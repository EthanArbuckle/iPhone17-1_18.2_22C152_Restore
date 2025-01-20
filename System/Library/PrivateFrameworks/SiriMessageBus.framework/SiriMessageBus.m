uint64_t sub_1C9EC9EE8()
{
  unint64_t v0;

  v0 = sub_1C9F08348();
  swift_bridgeObjectRelease();
  if (v0 >= 8) {
    return 8;
  }
  else {
    return v0;
  }
}

void *sub_1C9EC9F34()
{
  return &unk_1F242EF98;
}

unint64_t sub_1C9EC9F40(char a1)
{
  unint64_t result = 0xD000000000000015;
  switch(a1)
  {
    case 1:
      unint64_t result = 0xD00000000000001FLL;
      break;
    case 2:
      unint64_t result = 0xD00000000000001DLL;
      break;
    case 3:
      unint64_t result = 0xD000000000000020;
      break;
    case 4:
    case 6:
      unint64_t result = 0xD000000000000013;
      break;
    case 5:
      unint64_t result = 0xD00000000000001ALL;
      break;
    case 7:
      unint64_t result = 0xD000000000000023;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_1C9ECA024(char *a1, char *a2)
{
  return sub_1C9EFDDE0(*a1, *a2);
}

uint64_t sub_1C9ECA030()
{
  return sub_1C9ECA038(*v0);
}

uint64_t sub_1C9ECA038(char a1)
{
  return sub_1C9F08418();
}

uint64_t sub_1C9ECA09C()
{
  return sub_1C9F08418();
}

uint64_t sub_1C9ECA0D8(uint64_t a1)
{
  return sub_1C9ECA100(a1, *v1);
}

uint64_t sub_1C9ECA0E0()
{
  return sub_1C9F08028();
}

uint64_t sub_1C9ECA100(uint64_t a1, char a2)
{
  sub_1C9EC9F40(a2);
  sub_1C9F08028();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1C9ECA154(uint64_t a1)
{
  return sub_1C9ECA15C(a1, *v1);
}

uint64_t sub_1C9ECA15C(uint64_t a1, char a2)
{
  return sub_1C9F08418();
}

uint64_t sub_1C9ECA1BC()
{
  return sub_1C9F08418();
}

unint64_t sub_1C9ECA1F4(char a1)
{
  unint64_t result = 0xD00000000000001CLL;
  switch(a1)
  {
    case 1:
      unint64_t result = 0xD000000000000029;
      break;
    case 2:
      unint64_t result = 0xD000000000000019;
      break;
    case 3:
      unint64_t result = 0xD000000000000012;
      break;
    case 4:
      unint64_t result = 0xD000000000000015;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_1C9ECA2A0@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_1C9EC9EE8();
  *a1 = result;
  return result;
}

unint64_t sub_1C9ECA2D0@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = sub_1C9EC9F40(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

void sub_1C9ECA2FC(void *a1@<X8>)
{
  *a1 = &unk_1F242EF98;
}

void sub_1C9ECA30C()
{
  qword_1EBC7FF48 = 0x6E6F6973726576;
  unk_1EBC7FF50 = 0xE700000000000000;
}

void sub_1C9ECA330()
{
  qword_1EBC7FF58 = 0x656C61636F6CLL;
  unk_1EBC7FF60 = 0xE600000000000000;
}

id sub_1C9ECA350()
{
  id v0 = objc_msgSend(self, sel_sharedManager);
  v1 = (void *)sub_1C9F07FD8();
  id v2 = objc_msgSend(v0, sel_retrieveAssetSet_usages_, v1, 0);

  return v2;
}

uint64_t sub_1C9ECA3E0(uint64_t a1, uint64_t a2)
{
  return sub_1C9ECA460(a2);
}

uint64_t sub_1C9ECA408(uint64_t a1, uint64_t a2)
{
  return sub_1C9ECC2D8(a2);
}

void sub_1C9ECA430(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
}

uint64_t sub_1C9ECA460(uint64_t a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC7F020);
  uint64_t v4 = MEMORY[0x1F4188790](v3 - 8);
  v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v4);
  v8 = (char *)&v13 - v7;
  uint64_t v9 = sub_1C9F069B8();
  OUTLINED_FUNCTION_15();
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v8, a1, v9);
  __swift_storeEnumTagSinglePayload((uint64_t)v8, 0, 1, v9);
  sub_1C9ECF400((uint64_t)v8, (uint64_t)v6, &qword_1EBC7F020);
  uint64_t v11 = v1 + OBJC_IVAR____TtC14SiriMessageBus26AssetInstrumentationLogger_currentSessionId;
  swift_beginAccess();
  sub_1C9ECEFCC((uint64_t)v6, v11);
  swift_endAccess();
  *(void *)(v1 + OBJC_IVAR____TtC14SiriMessageBus26AssetInstrumentationLogger_assetsForLogging) = sub_1C9ECA5CC();
  swift_bridgeObjectRelease();
  *(void *)(v1 + OBJC_IVAR____TtC14SiriMessageBus26AssetInstrumentationLogger_assetSetsForLogging) = sub_1C9ECB730();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1C9ECA5CC()
{
  OUTLINED_FUNCTION_8();
  uint64_t v1 = (void *)MEMORY[0x1CB794DD0]();
  sub_1C9ECA628(v0, &v3);
  return v3;
}

void sub_1C9ECA628(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = v2;
  if (qword_1EBC7F918 != -1) {
    swift_once();
  }
  uint64_t v6 = sub_1C9F07E78();
  __swift_project_value_buffer(v6, (uint64_t)qword_1EBC7FFF8);
  uint64_t v7 = sub_1C9F07E68();
  os_log_type_t v8 = sub_1C9F08158();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v9 = 0;
    _os_log_impl(&dword_1C9EC7000, v7, v8, "Requesting asset factors for logging from Trial client", v9, 2u);
    MEMORY[0x1CB795290](v9, -1, -1);
  }

  id v10 = objc_msgSend(self, sel_clientWithIdentifier_, 115);
  uint64_t v18 = MEMORY[0x1E4FBC860];
  uint64_t v11 = sub_1C9ECDDAC();
  uint64_t v12 = *((void *)v11 + 2);
  if (v12)
  {
    v17 = a2;
    uint64_t v13 = 0;
    while (1)
    {
      int v14 = v11[v13 + 32];
      v15 = (void *)MEMORY[0x1CB794DD0]();
      sub_1C9ECA808(v10, v14, a1, (uint64_t)&v18);
      if (v3) {
        break;
      }
      uint64_t v3 = 0;
      ++v13;
      if (v12 == v13)
      {

        swift_bridgeObjectRelease();
        uint64_t v16 = v18;
        a2 = v17;
        goto LABEL_11;
      }
    }
    __break(1u);
  }
  else
  {

    swift_bridgeObjectRelease();
    uint64_t v16 = MEMORY[0x1E4FBC860];
LABEL_11:
    *a2 = v16;
  }
}

void sub_1C9ECA808(void *a1, int a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = v4;
  sub_1C9EC9F40(a2);
  os_log_type_t v8 = (void *)sub_1C9F07FD8();
  swift_bridgeObjectRelease();
  id v9 = objc_msgSend(a1, sel_factorLevelsWithNamespaceName_, v8);

  sub_1C9ECF370(0, &qword_1EBC7F920);
  unint64_t v10 = sub_1C9F080F8();

  if (!(v10 >> 62))
  {
    uint64_t v11 = *(void *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v11) {
      goto LABEL_3;
    }
LABEL_10:
    swift_bridgeObjectRelease();
    return;
  }
LABEL_12:
  swift_bridgeObjectRetain();
  uint64_t v11 = sub_1C9F08318();
  swift_bridgeObjectRelease();
  if (!v11) {
    goto LABEL_10;
  }
LABEL_3:
  uint64_t v12 = 4;
  while (1)
  {
    if ((v10 & 0xC000000000000001) != 0) {
      id v13 = (id)MEMORY[0x1CB794B20](v12 - 4, v10);
    }
    else {
      id v13 = *(id *)(v10 + 8 * v12);
    }
    int v14 = v13;
    uint64_t v15 = v12 - 3;
    if (__OFADD__(v12 - 4, 1))
    {
      __break(1u);
      goto LABEL_12;
    }
    uint64_t v16 = (void *)MEMORY[0x1CB794DD0]();
    sub_1C9ECA99C(v14, a2, a3, a4);
    if (v5) {
      break;
    }
    uint64_t v5 = 0;

    ++v12;
    if (v15 == v11) {
      goto LABEL_10;
    }
  }
  __break(1u);
}

void sub_1C9ECA99C(void *a1, int a2, uint64_t a3, uint64_t a4)
{
  uint64_t v96 = a4;
  LODWORD(v97) = a2;
  uint64_t v8 = sub_1C9F07E78();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = MEMORY[0x1F4188790](v8);
  uint64_t v12 = (char *)&v86 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = MEMORY[0x1F4188790](v10);
  uint64_t v15 = (char *)&v86 - v14;
  MEMORY[0x1F4188790](v13);
  v17 = (char *)&v86 - v16;
  uint64_t v18 = objc_msgSend(a1, sel_level);
  if (!v18)
  {
    __break(1u);
    goto LABEL_60;
  }
  unint64_t v4 = (unint64_t)v18;
  uint64_t v6 = (uint64_t)[v18 directoryValue];

  if (!v6)
  {
LABEL_60:
    __break(1u);
    goto LABEL_61;
  }
  uint64_t v19 = sub_1C9ECF034((void *)v6, (SEL *)&selRef_path);
  if (v20)
  {
    uint64_t v6 = v19;
    unint64_t v4 = (unint64_t)v20;
    swift_bridgeObjectRelease();
    uint64_t v21 = HIBYTE(v4) & 0xF;
    if ((v4 & 0x2000000000000000) == 0) {
      uint64_t v21 = v6 & 0xFFFFFFFFFFFFLL;
    }
    if (v21)
    {
      v22 = objc_msgSend(a1, sel_level);
      if (v22)
      {
        unint64_t v4 = (unint64_t)v22;
        uint64_t v6 = (uint64_t)[v22 metadata];

        if (v6)
        {
          uint64_t v105 = v9;
          uint64_t v95 = v8;
          if (qword_1EBC7F8B0 != -1) {
            swift_once();
          }
          long long v100 = xmmword_1EBC7FF48;
          swift_bridgeObjectRetain_n();
          id v23 = objc_msgSend((id)v6, sel___swift_objectForKeyedSubscript_, sub_1C9F08398());
          swift_unknownObjectRelease();

          if (v23)
          {
            sub_1C9F08268();
            swift_unknownObjectRelease();
          }
          else
          {
            long long v100 = 0u;
            long long v101 = 0u;
          }
          uint64_t v24 = v95;
          uint64_t v25 = v105;
          sub_1C9ECF400((uint64_t)&v100, (uint64_t)&v102, &qword_1EBC7F868);
          if (v104)
          {
            if (swift_dynamicCast())
            {
              unint64_t v26 = v99;
              uint64_t v94 = v98;
              swift_bridgeObjectRelease();
              if (qword_1EBC7F918 != -1) {
                swift_once();
              }
              uint64_t v27 = __swift_project_value_buffer(v24, (uint64_t)qword_1EBC7FFF8);
              uint64_t v28 = v105;
              v29 = *(void (**)(char *, uint64_t, uint64_t))(v105 + 16);
              uint64_t v92 = v105 + 16;
              uint64_t v93 = v27;
              v91 = v29;
              ((void (*)(char *))v29)(v15);
              id v30 = a1;
              swift_bridgeObjectRetain_n();
              unint64_t v4 = (unint64_t)v30;
              v31 = sub_1C9F07E68();
              int v32 = sub_1C9F08158();
              if (!os_log_type_enabled(v31, (os_log_type_t)v32))
              {

                swift_bridgeObjectRelease_n();
                v43 = *(void (**)(char *, uint64_t))(v28 + 8);
                v43(v15, v24);
                uint64_t v38 = v94;
LABEL_30:
                v53 = sub_1C9ECD298(v38, v26);
                swift_bridgeObjectRelease();
                if (!v53)
                {
                  v91(v12, v93, v24);
                  unint64_t v4 = (unint64_t)(id)v4;
                  v59 = sub_1C9F07E68();
                  uint64_t v60 = v24;
                  os_log_type_t v61 = sub_1C9F08168();
                  if (os_log_type_enabled(v59, v61))
                  {
                    uint64_t v62 = swift_slowAlloc();
                    uint64_t v96 = swift_slowAlloc();
                    *(void *)&long long v100 = v96;
                    *(_DWORD *)uint64_t v62 = 136315394;
                    unint64_t v63 = sub_1C9EC9F40(v97);
                    uint64_t v102 = sub_1C9F01420(v63, v64, (uint64_t *)&v100);
                    sub_1C9F08228();
                    swift_bridgeObjectRelease();
                    *(_WORD *)(v62 + 12) = 2080;
                    id v65 = objc_msgSend((id)v4, sel_factor);
                    if (!v65)
                    {
LABEL_68:

                      __break(1u);
                      return;
                    }
                    uint64_t v102 = sub_1C9ECF034(v65, (SEL *)&selRef_name);
                    unint64_t v103 = v66;
                    __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC7F7F0);
                    uint64_t v67 = sub_1C9F07FF8();
                    uint64_t v102 = sub_1C9F01420(v67, v68, (uint64_t *)&v100);
                    sub_1C9F08228();

                    swift_bridgeObjectRelease();
                    _os_log_impl(&dword_1C9EC7000, v59, v61, "Failed to find version for namespace %s and asset %s", (uint8_t *)v62, 0x16u);
                    uint64_t v69 = v96;
                    swift_arrayDestroy();
                    MEMORY[0x1CB795290](v69, -1, -1);
                    MEMORY[0x1CB795290](v62, -1, -1);

                    v70 = v12;
                    uint64_t v71 = v95;
                  }
                  else
                  {

                    v70 = v12;
                    uint64_t v71 = v60;
                  }
                  v43(v70, v71);
                  return;
                }
                id v54 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FA1258]), sel_init);
                if (!v54)
                {
                  v72 = sub_1C9F07E68();
                  os_log_type_t v73 = sub_1C9F08168();
                  if (os_log_type_enabled(v72, v73))
                  {
                    v74 = (uint8_t *)swift_slowAlloc();
                    *(_WORD *)v74 = 0;
                    _os_log_impl(&dword_1C9EC7000, v72, v73, "Failed to create an event for asset", v74, 2u);
                    MEMORY[0x1CB795290](v74, -1, -1);

                    return;
                  }
                  goto LABEL_57;
                }
                v55 = v54;
                id v56 = objc_msgSend((id)v4, sel_factor);
                if (v56)
                {
                  v57 = (void *)v4;
                  sub_1C9ECF034(v56, (SEL *)&selRef_name);
                  if (v58)
                  {
                    unint64_t v4 = sub_1C9F07FD8();
                    swift_bridgeObjectRelease();
                  }
                  else
                  {
                    unint64_t v4 = 0;
                  }
                  objc_msgSend(v55, sel_setAssetName_, v4);

                  objc_msgSend(v55, sel_setAssetVersion_, v53);
                  v75 = objc_msgSend(v57, sel_level);
                  if (v75)
                  {
                    unint64_t v4 = (unint64_t)v75;
                    id v76 = [v75 metadata];

                    if (v76)
                    {
                      if (qword_1EBC7F938 != -1) {
                        swift_once();
                      }
                      long long v100 = xmmword_1EBC7FF58;
                      swift_bridgeObjectRetain_n();
                      id v77 = objc_msgSend(v76, sel___swift_objectForKeyedSubscript_, sub_1C9F08398());
                      swift_unknownObjectRelease();

                      if (v77)
                      {
                        sub_1C9F08268();
                        swift_unknownObjectRelease();
                      }
                      else
                      {
                        long long v100 = 0u;
                        long long v101 = 0u;
                      }
                      sub_1C9ECF400((uint64_t)&v100, (uint64_t)&v102, &qword_1EBC7F868);
                      if (v104)
                      {
                        if (swift_dynamicCast())
                        {
                          uint64_t v78 = v98;
                          unint64_t v79 = v99;
                          swift_bridgeObjectRelease();
                          uint64_t v102 = v78;
                          unint64_t v103 = v79;
                          *(void *)&long long v100 = 95;
                          *((void *)&v100 + 1) = 0xE100000000000000;
                          uint64_t v98 = 45;
                          unint64_t v99 = 0xE100000000000000;
                          sub_1C9ECEDCC();
                          sub_1C9F08258();
                          swift_bridgeObjectRelease();
                          v80 = self;
                          v81 = (void *)sub_1C9F07FD8();
                          swift_bridgeObjectRelease();
                          id v82 = objc_msgSend(v80, sel_convertLanguageCodeToSchemaLocale_, v81);

LABEL_56:
                          objc_msgSend(v55, sel_setAssetLocale_, v82);
                          unint64_t v83 = sub_1C9EC9F40(v97);
                          sub_1C9ECF09C(v83, v84, v55, (SEL *)&selRef_setTrialNamespace_);
                          v72 = v55;
                          v85 = (void *)v96;
                          MEMORY[0x1CB794930]();
                          sub_1C9EF8648(*(void *)((*v85 & 0xFFFFFFFFFFFFFF8) + 0x10));
                          sub_1C9F08138();
                          sub_1C9F08118();
LABEL_57:

                          return;
                        }
                        swift_bridgeObjectRelease();
                      }
                      else
                      {
                        swift_bridgeObjectRelease();
                        sub_1C9ECF3AC((uint64_t)&v102, &qword_1EBC7F868);
                      }
                      id v82 = 0;
                      goto LABEL_56;
                    }
                    goto LABEL_67;
                  }
LABEL_66:
                  __break(1u);
LABEL_67:
                  __break(1u);
                  goto LABEL_68;
                }
LABEL_65:
                __break(1u);
                goto LABEL_66;
              }
              int v89 = v32;
              os_log_t v90 = v31;
              uint64_t v33 = swift_slowAlloc();
              uint64_t v88 = swift_slowAlloc();
              *(void *)&long long v100 = v88;
              *(_DWORD *)uint64_t v33 = 136315650;
              id v34 = objc_msgSend((id)v4, sel_factor);
              v17 = (char *)v4;
              if (v34)
              {
                uint64_t v102 = sub_1C9ECF034(v34, (SEL *)&selRef_name);
                unint64_t v103 = v35;
                __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC7F7F0);
                uint64_t v36 = sub_1C9F07FF8();
                uint64_t v102 = sub_1C9F01420(v36, v37, (uint64_t *)&v100);
                sub_1C9F08228();
                v87 = v4;

                swift_bridgeObjectRelease();
                *(_WORD *)(v33 + 12) = 2080;
                swift_bridgeObjectRetain();
                uint64_t v38 = v94;
                uint64_t v102 = sub_1C9F01420(v94, v26, (uint64_t *)&v100);
                sub_1C9F08228();
                swift_bridgeObjectRelease_n();
                *(_WORD *)(v33 + 22) = 2080;
                unint64_t v39 = sub_1C9EC9F40(v97);
                uint64_t v102 = sub_1C9F01420(v39, v40, (uint64_t *)&v100);
                sub_1C9F08228();
                swift_bridgeObjectRelease();
                os_log_t v41 = v90;
                _os_log_impl(&dword_1C9EC7000, v90, (os_log_type_t)v89, "Found asset=%s, version=%s, namespace=%s", (uint8_t *)v33, 0x20u);
                uint64_t v42 = v88;
                swift_arrayDestroy();
                MEMORY[0x1CB795290](v42, -1, -1);
                MEMORY[0x1CB795290](v33, -1, -1);

                v43 = *(void (**)(char *, uint64_t))(v105 + 8);
                uint64_t v24 = v95;
                v43(v15, v95);
                unint64_t v4 = (unint64_t)v87;
                goto LABEL_30;
              }
LABEL_64:

              swift_bridgeObjectRelease();
              __break(1u);
              goto LABEL_65;
            }
            swift_bridgeObjectRelease();
          }
          else
          {
            swift_bridgeObjectRelease();
            sub_1C9ECF3AC((uint64_t)&v102, &qword_1EBC7F868);
          }
          if (qword_1EBC7F918 != -1) {
            swift_once();
          }
          uint64_t v44 = __swift_project_value_buffer(v24, (uint64_t)qword_1EBC7FFF8);
          (*(void (**)(char *, uint64_t, uint64_t))(v25 + 16))(v17, v44, v24);
          uint64_t v6 = a1;
          unint64_t v4 = sub_1C9F07E68();
          uint64_t v45 = v24;
          os_log_type_t v46 = sub_1C9F08168();
          if (!os_log_type_enabled((os_log_t)v4, v46))
          {

            (*(void (**)(char *, uint64_t))(v25 + 8))(v17, v45);
            return;
          }
          uint64_t v97 = v5;
          v47 = (uint8_t *)swift_slowAlloc();
          uint64_t v48 = swift_slowAlloc();
          *(void *)&long long v100 = v48;
          *(_DWORD *)v47 = 136315138;
          id v49 = objc_msgSend((id)v6, sel_factor);
          if (v49)
          {
            uint64_t v102 = sub_1C9ECF034(v49, (SEL *)&selRef_name);
            unint64_t v103 = v50;
            __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC7F7F0);
            uint64_t v51 = sub_1C9F07FF8();
            uint64_t v102 = sub_1C9F01420(v51, v52, (uint64_t *)&v100);
            sub_1C9F08228();

            swift_bridgeObjectRelease();
            _os_log_impl(&dword_1C9EC7000, (os_log_t)v4, v46, "Failed to find the version for asset: %s", v47, 0xCu);
            swift_arrayDestroy();
            MEMORY[0x1CB795290](v48, -1, -1);
            MEMORY[0x1CB795290](v47, -1, -1);

            (*(void (**)(char *, uint64_t))(v105 + 8))(v17, v95);
            return;
          }
LABEL_63:

          __break(1u);
          goto LABEL_64;
        }
LABEL_62:
        __break(1u);
        goto LABEL_63;
      }
LABEL_61:
      __break(1u);
      goto LABEL_62;
    }
  }
}

uint64_t sub_1C9ECB730()
{
  uint64_t v105 = MEMORY[0x1E4FBC860];
  unint64_t v1 = 0x1E65A5000uLL;
  id v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FA1460]), sel_init);
  uint64_t v3 = &loc_1C9F08000;
  if (!v2)
  {
    if (qword_1EBC7F918 != -1) {
      swift_once();
    }
    uint64_t v67 = sub_1C9F07E78();
    __swift_project_value_buffer(v67, (uint64_t)qword_1EBC7FFF8);
    id v68 = (id)sub_1C9F07E68();
    os_log_type_t v69 = sub_1C9F08168();
    if (OUTLINED_FUNCTION_5(v69))
    {
      OUTLINED_FUNCTION_7();
      uint64_t v70 = OUTLINED_FUNCTION_3();
      OUTLINED_FUNCTION_31(v70);
      *(_DWORD *)unint64_t v0 = 136315138;
      uint64_t v71 = OUTLINED_FUNCTION_2((uint64_t)"com.apple.siri.tts");
      OUTLINED_FUNCTION_27(v71);
      OUTLINED_FUNCTION_4(&dword_1C9EC7000, v72, v73, "Failed to create SELF asset set for %s");
      swift_arrayDestroy();
      OUTLINED_FUNCTION_1();
      OUTLINED_FUNCTION_1();
    }
    goto LABEL_70;
  }
  unint64_t v4 = v2;
  sub_1C9ECF09C(0xD000000000000015, 0x80000001C9F09990, v2, (SEL *)&selRef_setAssetSetName_);
  uint64_t v5 = (uint64_t)sub_1C9ECA350();
  swift_bridgeObjectRelease();
  if (!v5)
  {
    if (qword_1EBC7F918 != -1) {
      swift_once();
    }
    uint64_t v74 = sub_1C9F07E78();
    __swift_project_value_buffer(v74, (uint64_t)qword_1EBC7FFF8);
    id v68 = (id)sub_1C9F07E68();
    os_log_type_t v75 = sub_1C9F08168();
    if (OUTLINED_FUNCTION_5(v75))
    {
      OUTLINED_FUNCTION_7();
      uint64_t v76 = OUTLINED_FUNCTION_3();
      OUTLINED_FUNCTION_31(v76);
      *(_DWORD *)unint64_t v0 = 136315138;
      uint64_t v77 = OUTLINED_FUNCTION_2((uint64_t)"com.apple.siri.tts");
      OUTLINED_FUNCTION_27(v77);
      OUTLINED_FUNCTION_4(&dword_1C9EC7000, v78, v79, "Failed to create UAF asset set for %s");
      swift_arrayDestroy();
      OUTLINED_FUNCTION_1();
      OUTLINED_FUNCTION_1();

      goto LABEL_70;
    }

    return v105;
  }
  if (qword_1EBC7F918 != -1) {
    goto LABEL_74;
  }
LABEL_4:
  uint64_t v6 = sub_1C9F07E78();
  os_log_type_t v7 = __swift_project_value_buffer(v6, (uint64_t)qword_1EBC7FFF8);
  uint64_t v8 = (void *)sub_1C9F07E68();
  os_log_type_t v9 = sub_1C9F08158();
  os_log_type_t v98 = v7;
  if (OUTLINED_FUNCTION_5(v9))
  {
    OUTLINED_FUNCTION_7();
    uint64_t v104 = OUTLINED_FUNCTION_3();
    *(_DWORD *)unint64_t v0 = v3[471];
    *(void *)(v0 + 4) = sub_1C9F01420(0xD000000000000015, 0x80000001C9F09990, &v104);
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_4(&dword_1C9EC7000, v10, v11, "Created UAFAssetSet for %s");
    swift_arrayDestroy();
    OUTLINED_FUNCTION_1();
    OUTLINED_FUNCTION_1();
  }

  uint64_t v12 = sub_1C9ECEE50((void *)v5);
  if (!v12)
  {
    v80 = (void *)sub_1C9F07E68();
    os_log_type_t v81 = sub_1C9F08168();
    if (!OUTLINED_FUNCTION_5(v81)) {
      goto LABEL_66;
    }
    OUTLINED_FUNCTION_7();
    uint64_t v82 = OUTLINED_FUNCTION_3();
    OUTLINED_FUNCTION_31(v82);
    *(_DWORD *)unint64_t v0 = v3[471];
    uint64_t v83 = OUTLINED_FUNCTION_2((uint64_t)"com.apple.siri.tts");
    OUTLINED_FUNCTION_27(v83);
    OUTLINED_FUNCTION_4(&dword_1C9EC7000, v84, v85, "There are no assets for asset set: %s");
    goto LABEL_65;
  }
  unint64_t v0 = (unint64_t)sub_1C9ECEABC(v12);
  swift_bridgeObjectRelease();
  if ((v0 & 0x8000000000000000) != 0 || (v0 & 0x4000000000000000) != 0)
  {
    swift_retain();
    uint64_t v13 = sub_1C9F08318();
    swift_release();
  }
  else
  {
    uint64_t v13 = *(void *)(v0 + 16);
  }
  uint64_t v97 = (void *)v13;
  if (v13)
  {
    uint64_t v92 = v5;
    uint64_t v102 = 0;
    unint64_t v100 = v0 & 0xC000000000000001;
    uint64_t v5 = 4;
    int v93 = v3[471];
    uint64_t v3 = (void *)v13;
    uint64_t v94 = v4;
    unint64_t v99 = (void *)v0;
    while (1)
    {
      if (v100) {
        id v14 = (id)MEMORY[0x1CB794B20](v5 - 4, v0);
      }
      else {
        id v14 = *(id *)(v0 + 8 * v5);
      }
      uint64_t v15 = v14;
      if (__OFADD__(v5 - 4, 1))
      {
        __break(1u);
LABEL_73:
        __break(1u);
LABEL_74:
        swift_once();
        goto LABEL_4;
      }
      unint64_t v103 = (void *)(v5 - 3);
      id v16 = [objc_allocWithZone(MEMORY[0x1E4FA1458]) *(SEL *)(v1 + 3864)];
      if (v16) {
        break;
      }
      id v26 = v15;
      uint64_t v27 = sub_1C9F07E68();
      os_log_type_t v28 = sub_1C9F08168();
      if (OUTLINED_FUNCTION_21(v28))
      {
        OUTLINED_FUNCTION_7();
        uint64_t v104 = OUTLINED_FUNCTION_3();
        *(_DWORD *)unint64_t v0 = v93;
        unint64_t v1 = (unint64_t)objc_msgSend(v26, sel_name);
        os_log_type_t v7 = sub_1C9F07FE8();
        unint64_t v30 = v29;

        uint64_t v31 = OUTLINED_FUNCTION_30();
        *(void *)(v0 + 4) = sub_1C9F01420(v31, v30, v32);

        swift_bridgeObjectRelease();
        _os_log_impl(&dword_1C9EC7000, v27, (os_log_type_t)v15, "Failed to create a SELF asset: %s", (uint8_t *)v0, 0xCu);
        swift_arrayDestroy();
        uint64_t v3 = v97;
        OUTLINED_FUNCTION_1();
        unint64_t v0 = (unint64_t)v99;
        OUTLINED_FUNCTION_1();
      }
      else
      {
      }
LABEL_44:
      ++v5;
      if (v103 == v3)
      {
LABEL_59:
        swift_release();
        uint64_t v5 = v92;
        goto LABEL_67;
      }
    }
    if (__OFADD__(v102++, 1)) {
      goto LABEL_73;
    }
    uint64_t v18 = v16;
    id v19 = objc_msgSend(v15, sel_name);
    sub_1C9F07FE8();

    uint64_t v20 = OUTLINED_FUNCTION_17();
    sub_1C9ECF09C(v20, v21, v18, (SEL *)&selRef_setAssetName_);
    id v22 = objc_msgSend(v15, sel_metadata);
    uint64_t v23 = sub_1C9F07F78();

    long long v101 = v15;
    if (!*(void *)(v23 + 16))
    {
      swift_bridgeObjectRelease();
      id v33 = v15;
      id v34 = sub_1C9F07E68();
      os_log_type_t v35 = sub_1C9F08158();
      if (os_log_type_enabled(v34, v35))
      {
        uint64_t v36 = OUTLINED_FUNCTION_29();
        uint64_t v104 = OUTLINED_FUNCTION_28();
        *(_DWORD *)uint64_t v36 = 136315394;
        *(void *)(v36 + 4) = sub_1C9F01420(0xD000000000000015, 0x80000001C9F09990, &v104);
        swift_bridgeObjectRelease();
        *(_WORD *)(v36 + 12) = 2080;
        unint64_t v1 = (unint64_t)objc_msgSend(v33, sel_name);
        os_log_type_t v7 = sub_1C9F07FE8();
        unint64_t v38 = v37;

        uint64_t v39 = OUTLINED_FUNCTION_30();
        *(void *)(v36 + 14) = sub_1C9F01420(v39, v38, v40);

        unint64_t v4 = v94;
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_1C9EC7000, v34, v35, "ORCHAssetSetsReported: Asset set: %s, asset: %s has empty metadata.", (uint8_t *)v36, 0x16u);
        swift_arrayDestroy();
        uint64_t v3 = v97;
        OUTLINED_FUNCTION_1();
        OUTLINED_FUNCTION_1();
      }
      else
      {
      }
      goto LABEL_43;
    }
    sub_1C9F01B5C(0x6E6F6973726576, 0xE700000000000000);
    if (v24)
    {
      swift_bridgeObjectRetain();
      uint64_t v25 = (void *)sub_1C9F07FD8();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v25 = 0;
    }
    objc_msgSend(v18, sel_setAssetVersion_, v25, v92);

    if (!*(void *)(v23 + 16)) {
      goto LABEL_34;
    }
    unint64_t v41 = sub_1C9F01B5C(0xD000000000000026, 0x80000001C9F09B90);
    if ((v42 & 1) == 0) {
      goto LABEL_34;
    }
    v43 = (uint64_t *)(*(void *)(v23 + 56) + 16 * v41);
    uint64_t v45 = *v43;
    uint64_t v44 = v43[1];
    swift_bridgeObjectRetain();
    if (!v44) {
      goto LABEL_34;
    }
    if (v45 == 16717 && v44 == 0xE200000000000000)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      char v47 = sub_1C9F08388();
      swift_bridgeObjectRelease();
      if ((v47 & 1) == 0)
      {
LABEL_34:
        swift_bridgeObjectRelease();
LABEL_35:
        id v48 = v15;
        id v49 = v18;
        id v50 = v48;
        id v51 = v49;
        unint64_t v52 = sub_1C9F07E68();
        os_log_type_t v53 = sub_1C9F08158();
        if (OUTLINED_FUNCTION_5(v53))
        {
          uint64_t v54 = swift_slowAlloc();
          uint64_t v104 = swift_slowAlloc();
          *(_DWORD *)uint64_t v54 = 136315650;
          OUTLINED_FUNCTION_2((uint64_t)"com.apple.siri.tts");
          os_log_type_t type = v7;
          sub_1C9F08228();
          swift_bridgeObjectRelease();
          *(_WORD *)(v54 + 12) = 2080;
          id v55 = objc_msgSend(v50, sel_name);
          log = v52;
          uint64_t v56 = sub_1C9F07FE8();
          unint64_t v58 = v57;

          os_log_type_t v7 = v98;
          uint64_t v59 = sub_1C9F01420(v56, v58, &v104);
          OUTLINED_FUNCTION_25(v59);
          sub_1C9F08228();

          unint64_t v4 = v94;
          swift_bridgeObjectRelease();
          *(_WORD *)(v54 + 22) = 2080;
          uint64_t v60 = sub_1C9ECF108(v51);
          if (v61)
          {
            unint64_t v62 = v61;
          }
          else
          {
            uint64_t v60 = 0;
            unint64_t v62 = 0xE000000000000000;
          }
          uint64_t v63 = sub_1C9F01420(v60, v62, &v104);
          OUTLINED_FUNCTION_25(v63);
          unint64_t v1 = 0x1E65A5000;
          sub_1C9F08228();

          swift_bridgeObjectRelease();
          _os_log_impl(&dword_1C9EC7000, log, type, "ORCHAssetSetsReported: Asset set: %s, asset: %s, version: %s ", (uint8_t *)v54, 0x20u);
          swift_arrayDestroy();
          OUTLINED_FUNCTION_1();
          uint64_t v3 = v97;
          OUTLINED_FUNCTION_1();
        }
        else
        {
        }
LABEL_43:
        objc_msgSend(v4, sel_addAssets_, v18, v92);

        unint64_t v0 = (unint64_t)v99;
        if (v102 == 5) {
          goto LABEL_59;
        }
        goto LABEL_44;
      }
    }
    sub_1C9EFE6B8(0x7265567465737341, 0xEC0000006E6F6973, v23);
    uint64_t v65 = v64;
    swift_bridgeObjectRelease();
    if (v65)
    {
      unint64_t v66 = (void *)sub_1C9F07FD8();
      swift_bridgeObjectRelease();
    }
    else
    {
      unint64_t v66 = 0;
    }
    objc_msgSend(v18, sel_setAssetVersion_, v66);

    goto LABEL_35;
  }
  swift_release();
  v80 = (void *)sub_1C9F07E68();
  os_log_type_t v86 = sub_1C9F08168();
  if (!OUTLINED_FUNCTION_5(v86)) {
    goto LABEL_66;
  }
  OUTLINED_FUNCTION_7();
  uint64_t v87 = OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_31(v87);
  *(_DWORD *)unint64_t v0 = v3[471];
  uint64_t v88 = OUTLINED_FUNCTION_2((uint64_t)"com.apple.siri.tts");
  OUTLINED_FUNCTION_27(v88);
  OUTLINED_FUNCTION_4(&dword_1C9EC7000, v89, v90, "Asset set: %s has returned empty assets when getAssets() is called.");
LABEL_65:
  swift_arrayDestroy();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1();
LABEL_66:

LABEL_67:
  id v68 = v4;
  MEMORY[0x1CB794930]();
  if (*(void *)((v105 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v105 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
    sub_1C9F08128();
  }
  sub_1C9F08138();
  sub_1C9F08118();

LABEL_70:
  return v105;
}

uint64_t sub_1C9ECC2D8(uint64_t a1)
{
  uint64_t v3 = sub_1C9F07E78();
  OUTLINED_FUNCTION_0();
  uint64_t v64 = v4;
  MEMORY[0x1F4188790](v5);
  uint64_t v7 = OUTLINED_FUNCTION_10(v6, v58);
  OUTLINED_FUNCTION_0();
  uint64_t v9 = v8;
  MEMORY[0x1F4188790](v10);
  OUTLINED_FUNCTION_6();
  uint64_t v65 = v11;
  OUTLINED_FUNCTION_12();
  MEMORY[0x1F4188790](v12);
  unint64_t v61 = (char *)&v58 - v13;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC7F8E0);
  uint64_t v15 = v14 - 8;
  MEMORY[0x1F4188790](v14);
  v17 = (char *)&v58 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC7F020);
  MEMORY[0x1F4188790](v18 - 8);
  OUTLINED_FUNCTION_6();
  uint64_t v60 = v19;
  OUTLINED_FUNCTION_12();
  MEMORY[0x1F4188790](v20);
  uint64_t v62 = (uint64_t)&v58 - v21;
  OUTLINED_FUNCTION_12();
  uint64_t v23 = MEMORY[0x1F4188790](v22);
  uint64_t v25 = (char *)&v58 - v24;
  MEMORY[0x1F4188790](v23);
  uint64_t v27 = (char *)&v58 - v26;
  OUTLINED_FUNCTION_11();
  uint64_t v67 = v9;
  uint64_t v63 = *(void (**)(char *, uint64_t, uint64_t))(v9 + 16);
  v63(v27, a1, v7);
  __swift_storeEnumTagSinglePayload((uint64_t)v27, 0, 1, v7);
  uint64_t v28 = (uint64_t)&v17[*(int *)(v15 + 56)];
  sub_1C9ECEEF8(v1, (uint64_t)v17);
  sub_1C9ECEEF8((uint64_t)v27, v28);
  OUTLINED_FUNCTION_23((uint64_t)v17);
  if (v29)
  {
    sub_1C9ECF3AC((uint64_t)v27, &qword_1EBC7F020);
    OUTLINED_FUNCTION_23(v28);
    if (v29)
    {
      sub_1C9ECF3AC((uint64_t)v17, &qword_1EBC7F020);
LABEL_17:
      uint64_t v50 = v62;
      __swift_storeEnumTagSinglePayload(v62, 1, 1, v7);
      swift_beginAccess();
      sub_1C9ECEFCC(v50, v1);
      swift_endAccess();
      uint64_t v51 = v68;
      *(void *)(v68 + OBJC_IVAR____TtC14SiriMessageBus26AssetInstrumentationLogger_assetsForLogging) = 0;
      swift_bridgeObjectRelease();
      *(void *)(v51 + OBJC_IVAR____TtC14SiriMessageBus26AssetInstrumentationLogger_assetSetsForLogging) = 0;
      return swift_bridgeObjectRelease();
    }
    goto LABEL_9;
  }
  sub_1C9ECEEF8((uint64_t)v17, (uint64_t)v25);
  OUTLINED_FUNCTION_23(v28);
  if (v29)
  {
    sub_1C9ECF3AC((uint64_t)v27, &qword_1EBC7F020);
    (*(void (**)(char *, uint64_t))(v67 + 8))(v25, v7);
LABEL_9:
    sub_1C9ECF3AC((uint64_t)v17, &qword_1EBC7F8E0);
    uint64_t v49 = v64;
    goto LABEL_10;
  }
  uint64_t v44 = v67;
  uint64_t v45 = *(void (**)(char *, uint64_t, uint64_t))(v67 + 32);
  uint64_t v58 = a1;
  os_log_type_t v46 = v61;
  v45(v61, v28, v7);
  sub_1C9ECEF88(&qword_1EBC7F978);
  char v47 = sub_1C9F07FC8();
  uint64_t v59 = v3;
  id v48 = *(void (**)(char *, uint64_t))(v44 + 8);
  v48(v46, v7);
  sub_1C9ECF3AC((uint64_t)v27, &qword_1EBC7F020);
  v48(v25, v7);
  uint64_t v49 = v64;
  uint64_t v3 = v59;
  sub_1C9ECF3AC((uint64_t)v17, &qword_1EBC7F020);
  if (v47) {
    goto LABEL_17;
  }
LABEL_10:
  if (qword_1EBC7F918 != -1) {
    swift_once();
  }
  uint64_t v30 = __swift_project_value_buffer(v3, (uint64_t)qword_1EBC7FFF8);
  uint64_t v31 = v66;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v49 + 16))(v66, v30, v3);
  uint64_t v32 = v65;
  OUTLINED_FUNCTION_26();
  v33();
  swift_retain_n();
  id v34 = sub_1C9F07E68();
  os_log_type_t v35 = sub_1C9F08168();
  if (os_log_type_enabled(v34, v35))
  {
    uint64_t v36 = OUTLINED_FUNCTION_29();
    uint64_t v64 = OUTLINED_FUNCTION_28();
    v69[0] = v64;
    *(_DWORD *)uint64_t v36 = 136315394;
    uint64_t v37 = v60;
    sub_1C9ECEEF8(v1, v60);
    int EnumTagSinglePayload = __swift_getEnumTagSinglePayload(v37, 1, v7);
    uint64_t v59 = v3;
    uint64_t v39 = v49;
    if (EnumTagSinglePayload)
    {
      sub_1C9ECF3AC(v37, &qword_1EBC7F020);
      unint64_t v40 = 0xE300000000000000;
      uint64_t v41 = 7104878;
      uint64_t v42 = v67;
    }
    else
    {
      unint64_t v52 = v61;
      OUTLINED_FUNCTION_26();
      v53();
      sub_1C9ECF3AC(v37, &qword_1EBC7F020);
      uint64_t v41 = sub_1C9F06988();
      unint64_t v40 = v54;
      uint64_t v42 = v67;
      (*(void (**)(char *, uint64_t))(v67 + 8))(v52, v7);
    }
    uint64_t v70 = sub_1C9F01420(v41, v40, v69);
    sub_1C9F08228();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v36 + 12) = 2080;
    sub_1C9ECEF88((unint64_t *)&unk_1EBC7F010);
    uint64_t v55 = v65;
    uint64_t v56 = sub_1C9F08378();
    uint64_t v70 = sub_1C9F01420(v56, v57, v69);
    sub_1C9F08228();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v42 + 8))(v55, v7);
    _os_log_impl(&dword_1C9EC7000, v34, v35, "currentSessionId: %s is not the same as sessionId: %s", (uint8_t *)v36, 0x16u);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_1();
    OUTLINED_FUNCTION_1();

    return (*(uint64_t (**)(uint64_t, uint64_t))(v39 + 8))(v66, v59);
  }
  else
  {
    swift_release_n();
    (*(void (**)(uint64_t, uint64_t))(v67 + 8))(v32, v7);

    return (*(uint64_t (**)(uint64_t, uint64_t))(v49 + 8))(v31, v3);
  }
}

void sub_1C9ECC9C8(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v71 = a2;
  unint64_t v72 = a3;
  sub_1C9F07E78();
  OUTLINED_FUNCTION_0();
  uint64_t v81 = v6;
  uint64_t v82 = v5;
  MEMORY[0x1F4188790](v5);
  uint64_t v8 = OUTLINED_FUNCTION_10(v7, v70);
  OUTLINED_FUNCTION_0();
  uint64_t v10 = v9;
  MEMORY[0x1F4188790](v11);
  OUTLINED_FUNCTION_6();
  uint64_t v79 = v12;
  OUTLINED_FUNCTION_12();
  MEMORY[0x1F4188790](v13);
  uint64_t v70 = (uint64_t)&v70 - v14;
  OUTLINED_FUNCTION_12();
  MEMORY[0x1F4188790](v15);
  uint64_t v74 = (char *)&v70 - v16;
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC7F8E0);
  uint64_t v18 = v17 - 8;
  MEMORY[0x1F4188790](v17);
  uint64_t v20 = (char *)&v70 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC7F020);
  MEMORY[0x1F4188790](v21 - 8);
  OUTLINED_FUNCTION_6();
  uint64_t v73 = v22;
  OUTLINED_FUNCTION_12();
  uint64_t v24 = MEMORY[0x1F4188790](v23);
  uint64_t v26 = (char *)&v70 - v25;
  MEMORY[0x1F4188790](v24);
  uint64_t v28 = (char *)&v70 - v27;
  OUTLINED_FUNCTION_11();
  char v29 = *(void (**)(char *, uint64_t, uint64_t))(v10 + 16);
  uint64_t v75 = a1;
  uint64_t v76 = v29;
  OUTLINED_FUNCTION_22();
  v30();
  __swift_storeEnumTagSinglePayload((uint64_t)v28, 0, 1, v8);
  uint64_t v31 = (uint64_t)&v20[*(int *)(v18 + 56)];
  sub_1C9ECEEF8(v3, (uint64_t)v20);
  sub_1C9ECEEF8((uint64_t)v28, v31);
  OUTLINED_FUNCTION_24((uint64_t)v20);
  uint64_t v77 = v10;
  if (!v36)
  {
    sub_1C9ECEEF8((uint64_t)v20, (uint64_t)v26);
    OUTLINED_FUNCTION_24(v31);
    if (!v36)
    {
      (*(void (**)(char *, uint64_t, uint64_t))(v10 + 32))(v74, v31, v8);
      sub_1C9ECEF88(&qword_1EBC7F978);
      char v38 = sub_1C9F07FC8();
      uint64_t v39 = *(void (**)(void))(v10 + 8);
      OUTLINED_FUNCTION_16();
      v39();
      sub_1C9ECF3AC((uint64_t)v28, &qword_1EBC7F020);
      OUTLINED_FUNCTION_16();
      v39();
      uint64_t v35 = v81;
      uint64_t v32 = v82;
      sub_1C9ECF3AC((uint64_t)v20, &qword_1EBC7F020);
      uint64_t v34 = v79;
      uint64_t v33 = v80;
      if ((v38 & 1) == 0) {
        goto LABEL_16;
      }
      goto LABEL_11;
    }
    sub_1C9ECF3AC((uint64_t)v28, &qword_1EBC7F020);
    OUTLINED_FUNCTION_16();
    v37();
    uint64_t v32 = v82;
LABEL_9:
    sub_1C9ECF3AC((uint64_t)v20, &qword_1EBC7F8E0);
    uint64_t v34 = v79;
    uint64_t v35 = v81;
    goto LABEL_16;
  }
  sub_1C9ECF3AC((uint64_t)v28, &qword_1EBC7F020);
  OUTLINED_FUNCTION_24(v31);
  uint64_t v32 = v82;
  if (!v36) {
    goto LABEL_9;
  }
  sub_1C9ECF3AC((uint64_t)v20, &qword_1EBC7F020);
  uint64_t v34 = v79;
  uint64_t v33 = v80;
  uint64_t v35 = v81;
LABEL_11:
  unint64_t v40 = *(void *)(v33 + OBJC_IVAR____TtC14SiriMessageBus26AssetInstrumentationLogger_assetsForLogging);
  if (v40)
  {
    if (v40 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v41 = sub_1C9F08318();
    }
    else
    {
      uint64_t v41 = *(void *)((v40 & 0xFFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
    }
    unint64_t v42 = v72;
    if (v41)
    {
      uint64_t v43 = *(void *)(v33 + OBJC_IVAR____TtC14SiriMessageBus26AssetInstrumentationLogger_assetSetsForLogging);
      swift_bridgeObjectRetain();
      sub_1C9EDA414(v40, v43);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    else
    {
      swift_bridgeObjectRelease();
      if (qword_1EBC7F918 != -1) {
        swift_once();
      }
      __swift_project_value_buffer(v32, (uint64_t)qword_1EBC7FFF8);
      OUTLINED_FUNCTION_22();
      v60();
      swift_bridgeObjectRetain_n();
      unint64_t v61 = sub_1C9F07E68();
      os_log_type_t v62 = sub_1C9F08168();
      if (os_log_type_enabled(v61, v62))
      {
        uint64_t v63 = OUTLINED_FUNCTION_29();
        uint64_t v82 = OUTLINED_FUNCTION_28();
        v84[0] = v82;
        *(_DWORD *)uint64_t v63 = 136315394;
        sub_1C9ECEF88((unint64_t *)&unk_1EBC7F010);
        uint64_t v64 = sub_1C9F08378();
        uint64_t v83 = sub_1C9F01420(v64, v65, v84);
        sub_1C9F08228();
        swift_bridgeObjectRelease();
        uint64_t v66 = OUTLINED_FUNCTION_20();
        v67(v66);
        *(_WORD *)(v63 + 12) = 2080;
        swift_bridgeObjectRetain();
        uint64_t v83 = sub_1C9F01420(v71, v42, v84);
        sub_1C9F08228();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_1C9EC7000, v61, v62, "Failed to find any assets for instrumentation, for sessionId: %s and requestId: %s", (uint8_t *)v63, 0x16u);
        swift_arrayDestroy();
        OUTLINED_FUNCTION_1();
        OUTLINED_FUNCTION_1();
      }
      else
      {
        uint64_t v68 = OUTLINED_FUNCTION_20();
        v69(v68);

        swift_bridgeObjectRelease_n();
      }
    }
    return;
  }
LABEL_16:
  if (qword_1EBC7F918 != -1) {
    swift_once();
  }
  uint64_t v44 = __swift_project_value_buffer(v32, (uint64_t)qword_1EBC7FFF8);
  uint64_t v45 = v78;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v35 + 16))(v78, v44, v32);
  OUTLINED_FUNCTION_22();
  v46();
  swift_retain_n();
  uint64_t v47 = v35;
  id v48 = sub_1C9F07E68();
  os_log_type_t v49 = sub_1C9F08168();
  if (os_log_type_enabled(v48, v49))
  {
    uint64_t v50 = OUTLINED_FUNCTION_29();
    v84[0] = OUTLINED_FUNCTION_28();
    *(_DWORD *)uint64_t v50 = 136315394;
    uint64_t v51 = v73;
    sub_1C9ECEEF8(v3, v73);
    if (__swift_getEnumTagSinglePayload(v51, 1, v8))
    {
      sub_1C9ECF3AC(v51, &qword_1EBC7F020);
      unint64_t v52 = 0xE300000000000000;
      uint64_t v53 = 7104878;
      uint64_t v54 = v77;
    }
    else
    {
      uint64_t v55 = v74;
      v76(v74, v51, v8);
      sub_1C9ECF3AC(v51, &qword_1EBC7F020);
      uint64_t v53 = sub_1C9F06988();
      unint64_t v52 = v56;
      uint64_t v54 = v77;
      (*(void (**)(char *, uint64_t))(v77 + 8))(v55, v8);
    }
    uint64_t v83 = sub_1C9F01420(v53, v52, v84);
    sub_1C9F08228();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v50 + 12) = 2080;
    sub_1C9ECEF88((unint64_t *)&unk_1EBC7F010);
    uint64_t v57 = v79;
    uint64_t v58 = sub_1C9F08378();
    uint64_t v83 = sub_1C9F01420(v58, v59, v84);
    sub_1C9F08228();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v54 + 8))(v57, v8);
    _os_log_impl(&dword_1C9EC7000, v48, v49, "currentSessionId: %s is not the same as sessionId: %s", (uint8_t *)v50, 0x16u);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_1();
    OUTLINED_FUNCTION_1();

    (*(void (**)(uint64_t, uint64_t))(v81 + 8))(v78, v82);
  }
  else
  {
    swift_release_n();
    (*(void (**)(uint64_t, uint64_t))(v77 + 8))(v34, v8);

    (*(void (**)(uint64_t, uint64_t))(v47 + 8))(v45, v32);
  }
}

NSObject *sub_1C9ECD298(uint64_t a1, uint64_t a2)
{
  uint64_t v74 = a1;
  uint64_t v75 = a2;
  sub_1C9ECEDCC();
  uint64_t v4 = (void *)sub_1C9F08248();
  unint64_t v5 = v4[2];
  if (v5 <= 1)
  {
    swift_bridgeObjectRelease();
    if (qword_1EBC7F918 != -1) {
      swift_once();
    }
    uint64_t v6 = sub_1C9F07E78();
    OUTLINED_FUNCTION_19(v6, (uint64_t)qword_1EBC7FFF8);
    id v2 = sub_1C9F07E68();
    os_log_type_t v7 = sub_1C9F08168();
    if (os_log_type_enabled(v2, v7))
    {
      uint64_t v8 = (uint8_t *)OUTLINED_FUNCTION_7();
      uint64_t v74 = swift_slowAlloc();
      *(_DWORD *)uint64_t v8 = 136315138;
      uint64_t v9 = swift_bridgeObjectRetain();
      OUTLINED_FUNCTION_18(v9, v10, v11, v12);
      OUTLINED_FUNCTION_13();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_1C9EC7000, v2, v7, "The assertVersion=%s doesn't follow semantic version scheme", v8, 0xCu);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_1();
LABEL_23:
      OUTLINED_FUNCTION_1();
LABEL_96:

      return 0;
    }

LABEL_18:
    swift_bridgeObjectRelease_n();
    return 0;
  }
  uint64_t v13 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FA1388]), sel_init);
  if (!v13)
  {
    swift_bridgeObjectRelease();
    if (qword_1EBC7F918 != -1) {
      swift_once();
    }
    uint64_t v21 = sub_1C9F07E78();
    os_log_type_t v22 = __swift_project_value_buffer(v21, (uint64_t)qword_1EBC7FFF8);
    id v2 = sub_1C9F07E68();
    os_log_type_t v23 = sub_1C9F08168();
    if (!OUTLINED_FUNCTION_5(v23)) {
      goto LABEL_96;
    }
    uint64_t v24 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v24 = 0;
    _os_log_impl(&dword_1C9EC7000, v2, v22, "Failed to create SISchemaVersion", v24, 2u);
    goto LABEL_23;
  }
  if (v4[2])
  {
    id v2 = v13;
    unint64_t v14 = v4[4];
    unint64_t v3 = v4[5];
    uint64_t v15 = HIBYTE(v3) & 0xF;
    uint64_t v16 = v14 & 0xFFFFFFFFFFFFLL;
    if ((v3 & 0x2000000000000000) != 0) {
      uint64_t v17 = HIBYTE(v3) & 0xF;
    }
    else {
      uint64_t v17 = v14 & 0xFFFFFFFFFFFFLL;
    }
    if (!v17) {
      goto LABEL_90;
    }
    if ((v3 & 0x1000000000000000) == 0)
    {
      if ((v3 & 0x2000000000000000) == 0)
      {
        if ((v14 & 0x1000000000000000) != 0)
        {
          uint64_t v18 = (unsigned __int8 *)((v3 & 0xFFFFFFFFFFFFFFFLL) + 32);
        }
        else
        {
          OUTLINED_FUNCTION_17();
          uint64_t v18 = (unsigned __int8 *)sub_1C9F082D8();
        }
        unint64_t v3 = 0;
        uint64_t v19 = sub_1C9ECE340(v18, v16, 10);
        LOBYTE(v15) = BYTE4(v19) & 1;
        uint64_t v20 = (uint64_t)v19;
LABEL_51:
        if ((v15 & 1) == 0) {
          goto LABEL_52;
        }
LABEL_90:
        swift_bridgeObjectRelease();
        if (qword_1EBC7F918 == -1) {
          goto LABEL_91;
        }
        goto LABEL_101;
      }
      uint64_t v74 = v4[4];
      uint64_t v75 = v3 & 0xFFFFFFFFFFFFFFLL;
      unint64_t v25 = v14 >> 8;
      unint64_t v26 = v14 >> 16;
      if (v14 == 43)
      {
        if (v15)
        {
          if (v15 != 1)
          {
            uint64_t v20 = (BYTE1(v14) - 48);
            if (v20 <= 9)
            {
              if (v15 == 2) {
                goto LABEL_50;
              }
              if ((v26 - 48) <= 9u)
              {
                uint64_t v20 = 10 * v20 + (v26 - 48);
                uint64_t v30 = v15 - 3;
                if (v15 != 3)
                {
                  uint64_t v31 = (unsigned __int8 *)&v74 + 3;
                  while (1)
                  {
                    unsigned int v32 = *v31 - 48;
                    if (v32 > 9) {
                      goto LABEL_47;
                    }
                    uint64_t v33 = 10 * v20;
                    if ((v33 & 0xFFFFFFFF00000000) != 0) {
                      goto LABEL_47;
                    }
                    uint64_t v20 = v33 + v32;
                    if (__CFADD__(v33, v32)) {
                      goto LABEL_47;
                    }
                    LOBYTE(v15) = 0;
                    ++v31;
                    if (!--v30) {
                      goto LABEL_51;
                    }
                  }
                }
                goto LABEL_50;
              }
            }
            goto LABEL_47;
          }
          goto LABEL_102;
        }
      }
      else
      {
        if (v14 != 45)
        {
          if (v15)
          {
            uint64_t v20 = (v14 - 48);
            if (v20 <= 9)
            {
              if (v15 == 1) {
                goto LABEL_50;
              }
              unsigned __int8 v54 = v25 - 48;
              if (v54 <= 9u)
              {
                uint64_t v20 = 10 * v20 + v54;
                uint64_t v55 = v15 - 2;
                if (v15 != 2)
                {
                  unint64_t v56 = (unsigned __int8 *)&v74 + 2;
                  while (1)
                  {
                    unsigned int v57 = *v56 - 48;
                    if (v57 > 9) {
                      goto LABEL_47;
                    }
                    uint64_t v58 = 10 * v20;
                    if ((v58 & 0xFFFFFFFF00000000) != 0) {
                      goto LABEL_47;
                    }
                    uint64_t v20 = v58 + v57;
                    if (__CFADD__(v58, v57)) {
                      goto LABEL_47;
                    }
                    LOBYTE(v15) = 0;
                    ++v56;
                    if (!--v55) {
                      goto LABEL_51;
                    }
                  }
                }
                goto LABEL_50;
              }
            }
          }
LABEL_47:
          uint64_t v20 = 0;
LABEL_48:
          LOBYTE(v15) = 1;
          goto LABEL_51;
        }
        if (v15)
        {
          if (v15 != 1)
          {
            unsigned __int8 v27 = BYTE1(v14) - 48;
            if ((BYTE1(v14) - 48) <= 9u)
            {
              uint64_t v20 = 0;
              BOOL v28 = v27 == 0;
              uint64_t v29 = -v27;
              if (!v28) {
                goto LABEL_48;
              }
              if (v15 == 2)
              {
                LOBYTE(v15) = 0;
                uint64_t v20 = v29;
                goto LABEL_51;
              }
              unsigned __int8 v59 = v26 - 48;
              if (v59 <= 9u)
              {
                uint64_t v60 = 10 * v29;
                if ((v60 & 0xFFFFFFFF00000000) == 0)
                {
                  uint64_t v20 = v60 - v59;
                  if (v60 >= v59)
                  {
                    uint64_t v61 = v15 - 3;
                    if (v15 != 3)
                    {
                      os_log_type_t v62 = (unsigned __int8 *)&v74 + 3;
                      while (1)
                      {
                        unsigned int v63 = *v62 - 48;
                        if (v63 > 9) {
                          goto LABEL_47;
                        }
                        uint64_t v64 = 10 * v20;
                        if ((v64 & 0xFFFFFFFF00000000) != 0) {
                          goto LABEL_47;
                        }
                        uint64_t v20 = v64 - v63;
                        if (v64 < v63) {
                          goto LABEL_47;
                        }
                        LOBYTE(v15) = 0;
                        ++v62;
                        if (!--v61) {
                          goto LABEL_51;
                        }
                      }
                    }
LABEL_50:
                    LOBYTE(v15) = 0;
                    goto LABEL_51;
                  }
                }
              }
            }
            goto LABEL_47;
          }
LABEL_102:
          uint64_t v20 = 0;
          goto LABEL_51;
        }
        __break(1u);
      }
      __break(1u);
      goto LABEL_105;
    }
  }
  else
  {
    __break(1u);
  }
  swift_bridgeObjectRetain();
  uint64_t v65 = OUTLINED_FUNCTION_17();
  uint64_t v20 = sub_1C9ECE258(v65, v66, 10);
  swift_bridgeObjectRelease();
  if ((v20 & 0x100000000) != 0) {
    goto LABEL_90;
  }
LABEL_52:
  if (v4[2] < 2uLL)
  {
    __break(1u);
LABEL_101:
    swift_once();
LABEL_91:
    uint64_t v67 = sub_1C9F07E78();
    OUTLINED_FUNCTION_19(v67, (uint64_t)qword_1EBC7FFF8);
    uint64_t v43 = sub_1C9F07E68();
    os_log_type_t v68 = sub_1C9F08168();
    if (OUTLINED_FUNCTION_21(v68))
    {
      OUTLINED_FUNCTION_7();
      uint64_t v74 = OUTLINED_FUNCTION_3();
      uint64_t v69 = OUTLINED_FUNCTION_32(4.8149e-34);
      OUTLINED_FUNCTION_18(v69, v70, v71, v72);
      OUTLINED_FUNCTION_14();
      swift_bridgeObjectRelease_n();
      os_log_type_t v49 = "Failed to convert major version to UInt for version=%s";
      goto LABEL_93;
    }
LABEL_95:

    swift_bridgeObjectRelease_n();
    goto LABEL_96;
  }
  unint64_t v3 = v4[6];
  unint64_t v34 = v4[7];
  swift_bridgeObjectRetain();
  unint64_t v35 = sub_1C9ECDB4C(v3, v34);
  if ((v35 & 0x100000000) != 0)
  {
    swift_bridgeObjectRelease();
    if (qword_1EBC7F918 != -1) {
      swift_once();
    }
    uint64_t v42 = sub_1C9F07E78();
    OUTLINED_FUNCTION_19(v42, (uint64_t)qword_1EBC7FFF8);
    uint64_t v43 = sub_1C9F07E68();
    os_log_type_t v44 = sub_1C9F08168();
    if (OUTLINED_FUNCTION_21(v44))
    {
      OUTLINED_FUNCTION_7();
      uint64_t v74 = OUTLINED_FUNCTION_3();
      uint64_t v45 = OUTLINED_FUNCTION_32(4.8149e-34);
      OUTLINED_FUNCTION_18(v45, v46, v47, v48);
      OUTLINED_FUNCTION_14();
      swift_bridgeObjectRelease_n();
      os_log_type_t v49 = "Failed to convert minor version to UInt for version=%s";
LABEL_93:
      _os_log_impl(&dword_1C9EC7000, v43, (os_log_type_t)v4, v49, (uint8_t *)v3, 0xCu);
      swift_arrayDestroy();
      goto LABEL_94;
    }
    goto LABEL_95;
  }
  unint64_t v3 = v35;
  if (v5 < 3) {
    goto LABEL_58;
  }
  if (v4[2] < 3uLL)
  {
LABEL_105:
    __break(1u);
LABEL_106:
    __break(1u);
    goto LABEL_107;
  }
  uint64_t v36 = v4[8];
  unint64_t v37 = v4[9];
  swift_bridgeObjectRetain();
  unint64_t v38 = sub_1C9ECDB4C(v36, v37);
  if ((v38 & 0x100000000) != 0)
  {
    if (qword_1EBC7F918 == -1)
    {
LABEL_67:
      uint64_t v50 = sub_1C9F07E78();
      __swift_project_value_buffer(v50, (uint64_t)qword_1EBC7FFF8);
      swift_bridgeObjectRetain();
      uint64_t v43 = sub_1C9F07E68();
      os_log_type_t v51 = sub_1C9F08168();
      if (!os_log_type_enabled(v43, v51))
      {

        goto LABEL_18;
      }
      OUTLINED_FUNCTION_7();
      uint64_t v74 = OUTLINED_FUNCTION_3();
      *(_DWORD *)unint64_t v3 = 136315138;
      uint64_t v52 = v4[8];
      unint64_t v53 = v4[9];
      swift_bridgeObjectRetain();
      sub_1C9F01420(v52, v53, &v74);
      OUTLINED_FUNCTION_13();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1C9EC7000, v43, v51, "Malformed value for patch=%s", (uint8_t *)v3, 0xCu);
      swift_arrayDestroy();
LABEL_94:
      OUTLINED_FUNCTION_1();
      OUTLINED_FUNCTION_1();

      goto LABEL_96;
    }
LABEL_107:
    swift_once();
    goto LABEL_67;
  }
  [v2 setPatch:v38];
LABEL_58:
  [v2 setMajor:v20];
  [v2 setMinor:v3];
  if (v5 != 4)
  {
    swift_bridgeObjectRelease();
    return v2;
  }
  if (v4[2] < 4uLL) {
    goto LABEL_106;
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v39 = OUTLINED_FUNCTION_17();
  sub_1C9ECF09C(v39, v40, v2, v41);
  return v2;
}

unint64_t sub_1C9ECDB4C(uint64_t a1, unint64_t a2)
{
  uint64_t v3 = HIBYTE(a2) & 0xF;
  uint64_t v4 = a1 & 0xFFFFFFFFFFFFLL;
  if ((a2 & 0x2000000000000000) != 0) {
    uint64_t v5 = v3;
  }
  else {
    uint64_t v5 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (!v5)
  {
    swift_bridgeObjectRelease();
    uint64_t v21 = 0;
    LOBYTE(v20) = 1;
    return v21 | ((unint64_t)v20 << 32);
  }
  if ((a2 & 0x1000000000000000) == 0)
  {
    if ((a2 & 0x2000000000000000) == 0)
    {
      if ((a1 & 0x1000000000000000) != 0) {
        uint64_t v6 = (unsigned __int8 *)((a2 & 0xFFFFFFFFFFFFFFFLL) + 32);
      }
      else {
        uint64_t v6 = (unsigned __int8 *)sub_1C9F082D8();
      }
      os_log_type_t v7 = sub_1C9ECE340(v6, v4, 10);
      LODWORD(v8) = v7;
      char v27 = BYTE4(v7) & 1;
      char v9 = BYTE4(v7) & 1;
      goto LABEL_38;
    }
    v26[0] = a1;
    v26[1] = a2 & 0xFFFFFFFFFFFFFFLL;
    int v10 = a1;
    if (a1 == 43)
    {
      if (v3)
      {
        if (v3 != 1)
        {
          LODWORD(v8) = (BYTE1(a1) - 48);
          if (v8 <= 9)
          {
            uint64_t v15 = v3 - 2;
            if (v15)
            {
              uint64_t v16 = (unsigned __int8 *)v26 + 2;
              while (1)
              {
                unsigned int v17 = *v16 - 48;
                if (v17 > 9) {
                  goto LABEL_35;
                }
                uint64_t v18 = 10 * v8;
                if ((v18 & 0xFFFFFFFF00000000) != 0) {
                  goto LABEL_35;
                }
                LODWORD(v8) = v18 + v17;
                if (__CFADD__(v18, v17)) {
                  goto LABEL_35;
                }
                char v9 = 0;
                ++v16;
                if (!--v15) {
                  goto LABEL_38;
                }
              }
            }
            goto LABEL_37;
          }
        }
        goto LABEL_35;
      }
    }
    else
    {
      if (a1 != 45)
      {
        if (v3)
        {
          LODWORD(v8) = (a1 - 48);
          if (v8 <= 9)
          {
            uint64_t v19 = v3 - 1;
            if (v19)
            {
              os_log_type_t v23 = (unsigned __int8 *)v26 + 1;
              while (1)
              {
                unsigned int v24 = *v23 - 48;
                if (v24 > 9) {
                  goto LABEL_35;
                }
                uint64_t v25 = 10 * v8;
                if ((v25 & 0xFFFFFFFF00000000) != 0) {
                  goto LABEL_35;
                }
                LODWORD(v8) = v25 + v24;
                if (__CFADD__(v25, v24)) {
                  goto LABEL_35;
                }
                char v9 = 0;
                ++v23;
                if (!--v19) {
                  goto LABEL_38;
                }
              }
            }
            goto LABEL_37;
          }
        }
        goto LABEL_35;
      }
      if (v3)
      {
        if (v3 != 1 && (BYTE1(a1) - 48) <= 9u)
        {
          int v10 = 0;
          LODWORD(v8) = -(BYTE1(a1) - 48);
          if (BYTE1(a1) == 48)
          {
            uint64_t v11 = v3 - 2;
            if (v11)
            {
              uint64_t v12 = (unsigned __int8 *)v26 + 2;
              while (1)
              {
                unsigned int v13 = *v12 - 48;
                if (v13 > 9) {
                  goto LABEL_35;
                }
                uint64_t v14 = 10 * v8;
                if ((v14 & 0xFFFFFFFF00000000) != 0) {
                  goto LABEL_35;
                }
                LODWORD(v8) = v14 - v13;
                if (v14 < v13) {
                  goto LABEL_35;
                }
                char v9 = 0;
                ++v12;
                if (!--v11) {
                  goto LABEL_38;
                }
              }
            }
LABEL_37:
            char v9 = 0;
            goto LABEL_38;
          }
LABEL_53:
          char v9 = 1;
          LODWORD(v8) = v10;
          goto LABEL_38;
        }
LABEL_35:
        LODWORD(v8) = 0;
        char v9 = 1;
LABEL_38:
        swift_bridgeObjectRelease();
        LODWORD(v20) = v9 & 1;
        goto LABEL_39;
      }
      __break(1u);
    }
    __break(1u);
    goto LABEL_53;
  }
  unint64_t v8 = sub_1C9ECE258(a1, a2, 10);
  swift_bridgeObjectRelease();
  uint64_t v20 = HIDWORD(v8) & 1;
LABEL_39:
  uint64_t v21 = v8;
  if (v20) {
    uint64_t v21 = 0;
  }
  return v21 | ((unint64_t)v20 << 32);
}

unsigned __int8 *sub_1C9ECDDAC()
{
  if (*(unsigned char *)(v0 + 33) == 1)
  {
    uint64_t v1 = 0;
    uint64_t v2 = MEMORY[0x1E4FBC860];
    do
    {
      unsigned int v3 = byte_1F242EF98[v1 + 32];
      if (v3 > 7 || ((1 << v3) & 0x8C) == 0)
      {
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          sub_1C9ECEC8C(0, *(void *)(v2 + 16) + 1, 1);
        }
        unint64_t v6 = *(void *)(v2 + 16);
        unint64_t v5 = *(void *)(v2 + 24);
        if (v6 >= v5 >> 1) {
          sub_1C9ECEC8C((char *)(v5 > 1), v6 + 1, 1);
        }
        *(void *)(v2 + 16) = v6 + 1;
        *(unsigned char *)(v2 + v6 + 32) = v3;
      }
      ++v1;
    }
    while (v1 != 8);
    swift_bridgeObjectRelease();
  }
  else if (*(unsigned char *)(v0 + 32))
  {
    return byte_1F242EF98;
  }
  else
  {
    return (unsigned __int8 *)MEMORY[0x1E4FBC860];
  }
  return (unsigned __int8 *)v2;
}

uint64_t sub_1C9ECDEDC()
{
  swift_release();
  sub_1C9ECF3AC(v0 + OBJC_IVAR____TtC14SiriMessageBus26AssetInstrumentationLogger_currentSessionId, &qword_1EBC7F020);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  __swift_destroy_boxed_opaque_existential_1(v0 + OBJC_IVAR____TtC14SiriMessageBus26AssetInstrumentationLogger_assetSetObserverProvider);
  return v0;
}

uint64_t sub_1C9ECDF5C()
{
  sub_1C9ECDEDC();
  OUTLINED_FUNCTION_8();
  uint64_t v2 = *(unsigned int *)(v1 + 48);
  uint64_t v3 = *(unsigned __int16 *)(v1 + 52);
  return MEMORY[0x1F4186488](v0, v2, v3);
}

uint64_t sub_1C9ECDF94()
{
  return type metadata accessor for AssetInstrumentationLogger();
}

uint64_t type metadata accessor for AssetInstrumentationLogger()
{
  uint64_t result = qword_1EBC7F388;
  if (!qword_1EBC7F388) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_1C9ECDFE4()
{
  sub_1C9ECE0B4();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

void sub_1C9ECE0B4()
{
  if (!qword_1EBC7F028)
  {
    sub_1C9F069B8();
    unint64_t v0 = sub_1C9F08218();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EBC7F028);
    }
  }
}

void *sub_1C9ECE10C@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *result;
  return result;
}

void sub_1C9ECE118(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_1C9ECE124@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = sub_1C9EF84D4(*a1, *v2);
  *a2 = result;
  return result;
}

uint64_t sub_1C9ECE154(uint64_t *a1)
{
  return sub_1C9EF84DC(*a1);
}

BOOL sub_1C9ECE15C(uint64_t *a1)
{
  return sub_1C9EF84EC(*a1, *v1);
}

BOOL sub_1C9ECE168(uint64_t *a1)
{
  return sub_1C9EF84F8(*a1, *v1);
}

BOOL sub_1C9ECE174(uint64_t *a1, uint64_t *a2)
{
  return sub_1C9EFDDD4(*a1, *a2);
}

void *sub_1C9ECE180(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)sub_1C9F08338();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

uint64_t sub_1C9ECE258(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v14 = a1;
  uint64_t v15 = a2;
  swift_bridgeObjectRetain();
  uint64_t v4 = sub_1C9F080A8();
  uint64_t v6 = v4;
  unint64_t v7 = v5;
  if ((v5 & 0x1000000000000000) == 0)
  {
    if ((v5 & 0x2000000000000000) == 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v9 = HIBYTE(v7) & 0xF;
    uint64_t v14 = v6;
    uint64_t v15 = v7 & 0xFFFFFFFFFFFFFFLL;
    unint64_t v8 = (unsigned __int8 *)&v14;
    goto LABEL_7;
  }
  uint64_t v6 = sub_1C9ECE5C0(v4, v5);
  unint64_t v11 = v10;
  swift_bridgeObjectRelease();
  unint64_t v7 = v11;
  if ((v11 & 0x2000000000000000) != 0) {
    goto LABEL_6;
  }
LABEL_3:
  if ((v6 & 0x1000000000000000) != 0)
  {
    unint64_t v8 = (unsigned __int8 *)((v7 & 0xFFFFFFFFFFFFFFFLL) + 32);
    uint64_t v9 = v6 & 0xFFFFFFFFFFFFLL;
  }
  else
  {
    unint64_t v8 = (unsigned __int8 *)sub_1C9F082D8();
  }
LABEL_7:
  uint64_t v12 = sub_1C9ECE340(v8, v9, a3);
  swift_bridgeObjectRelease();
  return v12 | ((((unint64_t)v12 >> 32) & 1) << 32);
}

unsigned __int8 *sub_1C9ECE340(unsigned __int8 *result, uint64_t a2, uint64_t a3)
{
  int v3 = *result;
  if (v3 == 43)
  {
    if (a2 >= 1)
    {
      uint64_t v16 = a2 - 1;
      if (a2 != 1)
      {
        unsigned __int8 v17 = a3 + 87;
        if (a3 > 10)
        {
          unsigned __int8 v18 = a3 + 55;
        }
        else
        {
          unsigned __int8 v17 = 97;
          unsigned __int8 v18 = 65;
        }
        if (a3 <= 10) {
          unsigned __int8 v19 = a3 + 48;
        }
        else {
          unsigned __int8 v19 = 58;
        }
        if (result)
        {
          unsigned int v8 = 0;
          uint64_t v20 = result + 1;
          do
          {
            unsigned int v21 = *v20;
            if (v21 < 0x30 || v21 >= v19)
            {
              if (v21 < 0x41 || v21 >= v18)
              {
                unsigned int v12 = 0;
                unsigned __int8 v13 = 1;
                if (v21 < 0x61 || v21 >= v17) {
                  return (unsigned __int8 *)(v12 | ((unint64_t)v13 << 32));
                }
                char v22 = -87;
              }
              else
              {
                char v22 = -55;
              }
            }
            else
            {
              char v22 = -48;
            }
            unint64_t v23 = v8 * (unint64_t)a3;
            if ((v23 & 0xFFFFFFFF00000000) != 0) {
              goto LABEL_72;
            }
            unsigned __int8 v24 = v21 + v22;
            unsigned int v8 = v23 + v24;
            if (__CFADD__(v23, v24)) {
              goto LABEL_72;
            }
            ++v20;
            --v16;
          }
          while (v16);
LABEL_48:
          unsigned __int8 v13 = 0;
          unsigned int v12 = v8;
          return (unsigned __int8 *)(v12 | ((unint64_t)v13 << 32));
        }
        goto LABEL_71;
      }
LABEL_72:
      unsigned int v12 = 0;
      unsigned __int8 v13 = 1;
      return (unsigned __int8 *)(v12 | ((unint64_t)v13 << 32));
    }
  }
  else
  {
    if (v3 != 45)
    {
      if (a2)
      {
        unsigned __int8 v25 = a3 + 87;
        if (a3 > 10)
        {
          unsigned __int8 v26 = a3 + 55;
        }
        else
        {
          unsigned __int8 v25 = 97;
          unsigned __int8 v26 = 65;
        }
        if (a3 <= 10) {
          unsigned __int8 v27 = a3 + 48;
        }
        else {
          unsigned __int8 v27 = 58;
        }
        if (result)
        {
          unsigned int v28 = 0;
          do
          {
            unsigned int v29 = *result;
            if (v29 < 0x30 || v29 >= v27)
            {
              if (v29 < 0x41 || v29 >= v26)
              {
                unsigned int v12 = 0;
                unsigned __int8 v13 = 1;
                if (v29 < 0x61 || v29 >= v25) {
                  return (unsigned __int8 *)(v12 | ((unint64_t)v13 << 32));
                }
                char v30 = -87;
              }
              else
              {
                char v30 = -55;
              }
            }
            else
            {
              char v30 = -48;
            }
            unint64_t v31 = v28 * (unint64_t)a3;
            if ((v31 & 0xFFFFFFFF00000000) != 0) {
              goto LABEL_72;
            }
            unsigned __int8 v32 = v29 + v30;
            unsigned int v28 = v31 + v32;
            if (__CFADD__(v31, v32)) {
              goto LABEL_72;
            }
            ++result;
            --a2;
          }
          while (a2);
          unsigned __int8 v13 = 0;
          unsigned int v12 = v28;
          return (unsigned __int8 *)(v12 | ((unint64_t)v13 << 32));
        }
        goto LABEL_71;
      }
      goto LABEL_72;
    }
    if (a2 >= 1)
    {
      uint64_t v4 = a2 - 1;
      if (a2 != 1)
      {
        unsigned __int8 v5 = a3 + 87;
        if (a3 > 10)
        {
          unsigned __int8 v6 = a3 + 55;
        }
        else
        {
          unsigned __int8 v5 = 97;
          unsigned __int8 v6 = 65;
        }
        if (a3 <= 10) {
          unsigned __int8 v7 = a3 + 48;
        }
        else {
          unsigned __int8 v7 = 58;
        }
        if (result)
        {
          unsigned int v8 = 0;
          uint64_t v9 = result + 1;
          while (1)
          {
            unsigned int v10 = *v9;
            if (v10 < 0x30 || v10 >= v7)
            {
              if (v10 < 0x41 || v10 >= v6)
              {
                unsigned int v12 = 0;
                unsigned __int8 v13 = 1;
                if (v10 < 0x61 || v10 >= v5) {
                  return (unsigned __int8 *)(v12 | ((unint64_t)v13 << 32));
                }
                char v11 = -87;
              }
              else
              {
                char v11 = -55;
              }
            }
            else
            {
              char v11 = -48;
            }
            unint64_t v14 = v8 * (unint64_t)a3;
            if ((v14 & 0xFFFFFFFF00000000) != 0) {
              goto LABEL_72;
            }
            unsigned __int8 v15 = v10 + v11;
            unsigned int v8 = v14 - v15;
            if (v14 < v15) {
              goto LABEL_72;
            }
            ++v9;
            if (!--v4) {
              goto LABEL_48;
            }
          }
        }
LABEL_71:
        unsigned int v12 = 0;
        unsigned __int8 v13 = 0;
        return (unsigned __int8 *)(v12 | ((unint64_t)v13 << 32));
      }
      goto LABEL_72;
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_1C9ECE5C0(uint64_t a1, unint64_t a2)
{
  unint64_t v2 = sub_1C9ECE62C((uint64_t)sub_1C9ECE628, 0, a1, a2);
  uint64_t v6 = sub_1C9ECE660(v2, v3, v4, v5);
  swift_bridgeObjectRelease();
  return v6;
}

uint64_t sub_1C9ECE62C(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v4 = HIBYTE(a4) & 0xF;
  if ((a4 & 0x2000000000000000) == 0) {
    uint64_t v4 = a3;
  }
  uint64_t v5 = 7;
  if (((a4 >> 60) & ((a3 & 0x800000000000000) == 0)) != 0) {
    uint64_t v5 = 11;
  }
  return MEMORY[0x1F4183BA0](15, v5 | (v4 << 16));
}

uint64_t sub_1C9ECE660(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  if ((a4 & 0x1000000000000000) != 0)
  {
    uint64_t v9 = sub_1C9ECE7B8(a1, a2, a3, a4);
    if (v9)
    {
      uint64_t v10 = v9;
      char v11 = sub_1C9F01930(v9, 0);
      unint64_t v12 = sub_1C9ECE8B8((unint64_t)v14, (uint64_t)(v11 + 4), v10, a1, a2, a3, a4);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      if (v12 != v10)
      {
        __break(1u);
LABEL_11:
        sub_1C9F082D8();
LABEL_4:
        JUMPOUT(0x1CB794870);
      }
    }
    else
    {
      char v11 = (void *)MEMORY[0x1E4FBC860];
    }
    uint64_t v13 = MEMORY[0x1CB794870](v11 + 4, v11[2]);
    swift_release();
    return v13;
  }
  else
  {
    if ((a4 & 0x2000000000000000) == 0)
    {
      if ((a3 & 0x1000000000000000) != 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
    v14[0] = a3;
    v14[1] = a4 & 0xFFFFFFFFFFFFFFLL;
    return MEMORY[0x1CB794870]((char *)v14 + (a1 >> 16), (a2 >> 16) - (a1 >> 16));
  }
}

uint64_t sub_1C9ECE7B8(unint64_t a1, unint64_t a2, unint64_t a3, uint64_t a4)
{
  unint64_t v4 = a4;
  uint64_t v5 = a3;
  unint64_t v6 = a2;
  unint64_t v7 = a1;
  uint64_t v8 = (a3 >> 59) & 1;
  if ((a4 & 0x1000000000000000) == 0) {
    LOBYTE(v8) = 1;
  }
  uint64_t v9 = 4 << v8;
  if ((a1 & 0xC) == 4 << v8)
  {
    a1 = sub_1C9F01998(a1, a3, a4);
    unint64_t v7 = a1;
  }
  if ((v6 & 0xC) == v9)
  {
    a1 = sub_1C9F01998(v6, v5, v4);
    unint64_t v6 = a1;
    if ((v4 & 0x1000000000000000) == 0) {
      return (v6 >> 16) - (v7 >> 16);
    }
  }
  else if ((v4 & 0x1000000000000000) == 0)
  {
    return (v6 >> 16) - (v7 >> 16);
  }
  unint64_t v11 = HIBYTE(v4) & 0xF;
  if ((v4 & 0x2000000000000000) == 0) {
    unint64_t v11 = v5 & 0xFFFFFFFFFFFFLL;
  }
  if (v11 < v7 >> 16)
  {
    __break(1u);
  }
  else if (v11 >= v6 >> 16)
  {
    a1 = v7;
    a2 = v6;
    a3 = v5;
    a4 = v4;
    return MEMORY[0x1F4183AA8](a1, a2, a3, a4);
  }
  __break(1u);
  return MEMORY[0x1F4183AA8](a1, a2, a3, a4);
}

unint64_t sub_1C9ECE8B8(unint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6, unint64_t a7)
{
  uint64_t v9 = (void *)result;
  if (!a2) {
    goto LABEL_5;
  }
  if (!a3)
  {
    unint64_t v12 = a4;
    uint64_t v11 = 0;
    goto LABEL_35;
  }
  if (a3 < 0) {
    goto LABEL_38;
  }
  unint64_t v10 = a5 >> 14;
  unint64_t v27 = a4 >> 14;
  if (a4 >> 14 == a5 >> 14)
  {
LABEL_5:
    uint64_t v11 = 0;
    unint64_t v12 = a4;
LABEL_35:
    *uint64_t v9 = a4;
    v9[1] = a5;
    v9[2] = a6;
    v9[3] = a7;
    v9[4] = v12;
    return v11;
  }
  uint64_t v11 = 0;
  uint64_t v14 = (a6 >> 59) & 1;
  if ((a7 & 0x1000000000000000) == 0) {
    LOBYTE(v14) = 1;
  }
  uint64_t v15 = 4 << v14;
  uint64_t v21 = (a7 & 0xFFFFFFFFFFFFFFFLL) + 32;
  uint64_t v22 = a7 & 0xFFFFFFFFFFFFFFLL;
  uint64_t v16 = HIBYTE(a7) & 0xF;
  if ((a7 & 0x2000000000000000) == 0) {
    uint64_t v16 = a6 & 0xFFFFFFFFFFFFLL;
  }
  unint64_t v23 = v16;
  uint64_t v26 = a3 - 1;
  unint64_t v12 = a4;
  while (1)
  {
    uint64_t result = v12;
    if ((v12 & 0xC) == v15) {
      uint64_t result = sub_1C9F01998(v12, a6, a7);
    }
    if (result >> 14 < v27 || result >> 14 >= v10) {
      break;
    }
    if ((a7 & 0x1000000000000000) != 0)
    {
      uint64_t result = sub_1C9F08088();
      char v19 = result;
    }
    else
    {
      unint64_t v18 = result >> 16;
      if ((a7 & 0x2000000000000000) != 0)
      {
        v28[0] = a6;
        v28[1] = v22;
        char v19 = *((unsigned char *)v28 + v18);
      }
      else
      {
        uint64_t result = v21;
        if ((a6 & 0x1000000000000000) == 0) {
          uint64_t result = sub_1C9F082D8();
        }
        char v19 = *(unsigned char *)(result + v18);
      }
    }
    if ((v12 & 0xC) == v15)
    {
      uint64_t result = sub_1C9F01998(v12, a6, a7);
      unint64_t v12 = result;
      if ((a7 & 0x1000000000000000) == 0)
      {
LABEL_27:
        unint64_t v12 = (v12 & 0xFFFFFFFFFFFF0000) + 65540;
        goto LABEL_31;
      }
    }
    else if ((a7 & 0x1000000000000000) == 0)
    {
      goto LABEL_27;
    }
    if (v23 <= v12 >> 16) {
      goto LABEL_37;
    }
    unint64_t v12 = sub_1C9F08058();
LABEL_31:
    *(unsigned char *)(a2 + v11) = v19;
    if (v26 == v11)
    {
      uint64_t v11 = a3;
      goto LABEL_35;
    }
    ++v11;
    if (v10 == v12 >> 14) {
      goto LABEL_35;
    }
  }
  __break(1u);
LABEL_37:
  __break(1u);
LABEL_38:
  __break(1u);
  return result;
}

void *sub_1C9ECEABC(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return (void *)MEMORY[0x1E4FBC860];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC7FEA0);
  unint64_t v3 = (void *)swift_allocObject();
  size_t v4 = _swift_stdlib_malloc_size(v3);
  v3[2] = v1;
  v3[3] = (2 * ((uint64_t)(v4 - 32) / 8)) | 1;
  uint64_t v5 = sub_1C9ECF16C(&v7, v3 + 4, v1, a1);
  swift_bridgeObjectRetain();
  sub_1C9ECF368();
  if (v5 != (void *)v1)
  {
    __break(1u);
    return (void *)MEMORY[0x1E4FBC860];
  }
  return v3;
}

void *sub_1C9ECEBA8(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return (void *)MEMORY[0x1E4FBC860];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC7F858);
  unint64_t v3 = (void *)swift_allocObject();
  size_t v4 = _swift_stdlib_malloc_size(v3);
  v3[2] = v1;
  v3[3] = 2 * ((uint64_t)(v4 - 32) / 16);
  uint64_t v5 = sub_1C9ECF4AC((uint64_t)&v7, v3 + 4, v1, a1);
  swift_bridgeObjectRetain();
  sub_1C9ECF368();
  if (v5 != v1)
  {
    __break(1u);
    return (void *)MEMORY[0x1E4FBC860];
  }
  return v3;
}

char *sub_1C9ECEC8C(char *a1, int64_t a2, char a3)
{
  uint64_t result = sub_1C9ECECAC(a1, a2, a3, *v3);
  *unint64_t v3 = (uint64_t)result;
  return result;
}

char *sub_1C9ECECAC(char *result, int64_t a2, char a3, uint64_t a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC7F930);
    unint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    unint64_t v10 = (char *)MEMORY[0x1E4FBC860];
  }
  unint64_t v12 = v10 + 32;
  uint64_t v13 = (char *)(a4 + 32);
  if (v5)
  {
    sub_1C9EF8E94(v13, v8, v12);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_1C9ECE180(v13, v8, v12);
  }
  swift_release();
  return v10;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_1C9ECEDCC()
{
  unint64_t result = qword_1EBC7FD98;
  if (!qword_1EBC7FD98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBC7FD98);
  }
  return result;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_1C9ECEE50(void *a1)
{
  id v1 = objc_msgSend(a1, sel_assets);
  if (!v1) {
    return 0;
  }
  unint64_t v2 = v1;
  sub_1C9ECF370(0, &qword_1EBC7F928);
  uint64_t v3 = sub_1C9F07F78();

  return v3;
}

uint64_t __swift_storeEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

uint64_t sub_1C9ECEEF8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC7F020);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t __swift_getEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

uint64_t sub_1C9ECEF88(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_1C9F069B8();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1C9ECEFCC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC7F020);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_1C9ECF034(void *a1, SEL *a2)
{
  id v3 = [a1 *a2];

  if (v3)
  {
    sub_1C9F07FE8();
  }
  return OUTLINED_FUNCTION_17();
}

void sub_1C9ECF09C(uint64_t a1, uint64_t a2, void *a3, SEL *a4)
{
  id v6 = (id)sub_1C9F07FD8();
  swift_bridgeObjectRelease();
  objc_msgSend(a3, *a4, v6);
}

uint64_t sub_1C9ECF108(void *a1)
{
  id v1 = objc_msgSend(a1, sel_assetVersion);
  if (!v1) {
    return 0;
  }
  unint64_t v2 = v1;
  uint64_t v3 = sub_1C9F07FE8();

  return v3;
}

void *sub_1C9ECF16C(void *result, void *a2, uint64_t a3, uint64_t a4)
{
  char v5 = result;
  uint64_t v6 = a4 + 64;
  uint64_t v7 = -1 << *(unsigned char *)(a4 + 32);
  if (-v7 < 64) {
    uint64_t v8 = ~(-1 << -(char)v7);
  }
  else {
    uint64_t v8 = -1;
  }
  unint64_t v9 = v8 & *(void *)(a4 + 64);
  if (!a2)
  {
    int64_t v12 = 0;
    uint64_t v10 = 0;
LABEL_38:
    *char v5 = a4;
    v5[1] = v6;
    v5[2] = ~v7;
    v5[3] = v12;
    v5[4] = v9;
    return (void *)v10;
  }
  uint64_t v10 = a3;
  if (!a3)
  {
    int64_t v12 = 0;
    goto LABEL_38;
  }
  if (a3 < 0)
  {
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  size_t v11 = a2;
  int64_t v12 = 0;
  uint64_t v13 = 0;
  int64_t v14 = (unint64_t)(63 - v7) >> 6;
  if (!v9) {
    goto LABEL_9;
  }
LABEL_8:
  unint64_t v15 = __clz(__rbit64(v9));
  v9 &= v9 - 1;
  unint64_t v16 = v15 | (v12 << 6);
  while (1)
  {
    ++v13;
    uint64_t v20 = *(void **)(*(void *)(a4 + 56) + 8 * v16);
    *size_t v11 = v20;
    if (v13 == v10)
    {
      id v21 = v20;
      goto LABEL_38;
    }
    ++v11;
    uint64_t result = v20;
    if (v9) {
      goto LABEL_8;
    }
LABEL_9:
    int64_t v17 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
      __break(1u);
      goto LABEL_40;
    }
    if (v17 >= v14) {
      goto LABEL_33;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    if (!v18) {
      break;
    }
LABEL_18:
    unint64_t v9 = (v18 - 1) & v18;
    unint64_t v16 = __clz(__rbit64(v18)) + (v17 << 6);
    int64_t v12 = v17;
  }
  v12 += 2;
  if (v17 + 1 >= v14)
  {
    unint64_t v9 = 0;
    int64_t v12 = v17;
    goto LABEL_37;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v12);
  if (v18) {
    goto LABEL_14;
  }
  int64_t v19 = v17 + 2;
  if (v17 + 2 >= v14) {
    goto LABEL_33;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v19);
  if (v18) {
    goto LABEL_17;
  }
  int64_t v12 = v17 + 3;
  if (v17 + 3 >= v14)
  {
    unint64_t v9 = 0;
    int64_t v12 = v17 + 2;
    goto LABEL_37;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v12);
  if (v18)
  {
LABEL_14:
    int64_t v17 = v12;
    goto LABEL_18;
  }
  int64_t v19 = v17 + 4;
  if (v17 + 4 >= v14)
  {
LABEL_33:
    unint64_t v9 = 0;
LABEL_37:
    uint64_t v10 = v13;
    goto LABEL_38;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v19);
  if (v18)
  {
LABEL_17:
    int64_t v17 = v19;
    goto LABEL_18;
  }
  while (1)
  {
    int64_t v17 = v19 + 1;
    if (__OFADD__(v19, 1)) {
      break;
    }
    if (v17 >= v14)
    {
      unint64_t v9 = 0;
      int64_t v12 = v14 - 1;
      goto LABEL_37;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    ++v19;
    if (v18) {
      goto LABEL_18;
    }
  }
LABEL_41:
  __break(1u);
  return result;
}

uint64_t sub_1C9ECF368()
{
  return swift_release();
}

uint64_t sub_1C9ECF370(uint64_t a1, unint64_t *a2)
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

uint64_t sub_1C9ECF3AC(uint64_t a1, uint64_t *a2)
{
  __swift_instantiateConcreteTypeFromMangledName(a2);
  OUTLINED_FUNCTION_15();
  (*(void (**)(uint64_t))(v3 + 8))(a1);
  return a1;
}

uint64_t sub_1C9ECF400(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(a3);
  OUTLINED_FUNCTION_15();
  (*(void (**)(uint64_t, uint64_t))(v5 + 32))(a2, a1);
  return a2;
}

uint64_t __swift_destroy_boxed_opaque_existential_1(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_1C9ECF4AC(uint64_t result, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = (void *)result;
  uint64_t v6 = a4 + 64;
  uint64_t v7 = -1 << *(unsigned char *)(a4 + 32);
  if (-v7 < 64) {
    uint64_t v8 = ~(-1 << -(char)v7);
  }
  else {
    uint64_t v8 = -1;
  }
  unint64_t v9 = v8 & *(void *)(a4 + 64);
  if (!a2)
  {
    int64_t v12 = 0;
    uint64_t v10 = 0;
LABEL_38:
    *uint64_t v5 = a4;
    v5[1] = v6;
    v5[2] = ~v7;
    v5[3] = v12;
    v5[4] = v9;
    return v10;
  }
  uint64_t v10 = a3;
  if (!a3)
  {
    int64_t v12 = 0;
    goto LABEL_38;
  }
  if (a3 < 0)
  {
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  size_t v11 = a2;
  int64_t v12 = 0;
  uint64_t v13 = 0;
  int64_t v14 = (unint64_t)(63 - v7) >> 6;
  if (!v9) {
    goto LABEL_9;
  }
LABEL_8:
  unint64_t v15 = __clz(__rbit64(v9));
  v9 &= v9 - 1;
  unint64_t v16 = v15 | (v12 << 6);
  while (1)
  {
    ++v13;
    uint64_t v20 = (void *)(*(void *)(a4 + 48) + 16 * v16);
    uint64_t v21 = v20[1];
    *size_t v11 = *v20;
    v11[1] = v21;
    if (v13 == v10)
    {
      swift_bridgeObjectRetain();
      goto LABEL_38;
    }
    v11 += 2;
    uint64_t result = swift_bridgeObjectRetain();
    if (v9) {
      goto LABEL_8;
    }
LABEL_9:
    int64_t v17 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
      __break(1u);
      goto LABEL_40;
    }
    if (v17 >= v14) {
      goto LABEL_33;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    if (!v18) {
      break;
    }
LABEL_18:
    unint64_t v9 = (v18 - 1) & v18;
    unint64_t v16 = __clz(__rbit64(v18)) + (v17 << 6);
    int64_t v12 = v17;
  }
  v12 += 2;
  if (v17 + 1 >= v14)
  {
    unint64_t v9 = 0;
    int64_t v12 = v17;
    goto LABEL_37;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v12);
  if (v18) {
    goto LABEL_14;
  }
  int64_t v19 = v17 + 2;
  if (v17 + 2 >= v14) {
    goto LABEL_33;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v19);
  if (v18) {
    goto LABEL_17;
  }
  int64_t v12 = v17 + 3;
  if (v17 + 3 >= v14)
  {
    unint64_t v9 = 0;
    int64_t v12 = v17 + 2;
    goto LABEL_37;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v12);
  if (v18)
  {
LABEL_14:
    int64_t v17 = v12;
    goto LABEL_18;
  }
  int64_t v19 = v17 + 4;
  if (v17 + 4 >= v14)
  {
LABEL_33:
    unint64_t v9 = 0;
LABEL_37:
    uint64_t v10 = v13;
    goto LABEL_38;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v19);
  if (v18)
  {
LABEL_17:
    int64_t v17 = v19;
    goto LABEL_18;
  }
  while (1)
  {
    int64_t v17 = v19 + 1;
    if (__OFADD__(v19, 1)) {
      break;
    }
    if (v17 >= v14)
    {
      unint64_t v9 = 0;
      int64_t v12 = v14 - 1;
      goto LABEL_37;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    ++v19;
    if (v18) {
      goto LABEL_18;
    }
  }
LABEL_41:
  __break(1u);
  return result;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for TrialAssetNamespaces(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xF9)
  {
    if (a2 + 7 >= 0xFFFF00) {
      int v2 = 4;
    }
    else {
      int v2 = 2;
    }
    if ((a2 + 7) >> 8 < 0xFF) {
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
    int v5 = (*a1 | (v4 << 8)) - 8;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 8;
  int v5 = v6 - 8;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for TrialAssetNamespaces(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 7 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 7) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF9) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF8)
  {
    unsigned int v6 = ((a2 - 249) >> 8) + 1;
    *uint64_t result = a2 + 7;
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
        JUMPOUT(0x1C9ECF810);
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
          *uint64_t result = a2 + 7;
        break;
    }
  }
  return result;
}

uint64_t sub_1C9ECF838(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_1C9ECF844(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for TrialAssetNamespaces()
{
  return &type metadata for TrialAssetNamespaces;
}

unint64_t sub_1C9ECF860()
{
  unint64_t result = qword_1EA5CE820;
  if (!qword_1EA5CE820)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EA5CE828);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA5CE820);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_1C9ECF900()
{
  unint64_t result = qword_1EA5CE830;
  if (!qword_1EA5CE830)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA5CE830);
  }
  return result;
}

void OUTLINED_FUNCTION_1()
{
  JUMPOUT(0x1CB795290);
}

uint64_t OUTLINED_FUNCTION_2@<X0>(uint64_t a1@<X8>)
{
  return sub_1C9F01420(0xD000000000000015, a1 | 0x8000000000000000, (uint64_t *)(v1 - 104));
}

uint64_t OUTLINED_FUNCTION_3()
{
  return swift_slowAlloc();
}

void OUTLINED_FUNCTION_4(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v5, a4, v6, 0xCu);
}

BOOL OUTLINED_FUNCTION_5(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_7()
{
  return swift_slowAlloc();
}

uint64_t OUTLINED_FUNCTION_9()
{
  return sub_1C9F08028();
}

uint64_t OUTLINED_FUNCTION_10@<X0>(uint64_t a1@<X8>, uint64_t a2)
{
  *(void *)(v2 - 160) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
  return sub_1C9F069B8();
}

uint64_t OUTLINED_FUNCTION_11()
{
  *(void *)(v1 - 144) = v0;
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_13()
{
  return sub_1C9F08228();
}

uint64_t OUTLINED_FUNCTION_14()
{
  return sub_1C9F08228();
}

uint64_t OUTLINED_FUNCTION_17()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_18(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_start(va, a4);
  return sub_1C9F01420(v5, v4, (uint64_t *)va);
}

uint64_t OUTLINED_FUNCTION_19(uint64_t a1, uint64_t a2)
{
  __swift_project_value_buffer(a1, a2);
  return swift_bridgeObjectRetain_n();
}

uint64_t OUTLINED_FUNCTION_20()
{
  return v0;
}

BOOL OUTLINED_FUNCTION_21(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_23(uint64_t a1)
{
  return __swift_getEnumTagSinglePayload(a1, 1, v1);
}

uint64_t OUTLINED_FUNCTION_24(uint64_t a1)
{
  return __swift_getEnumTagSinglePayload(a1, 1, v1);
}

uint64_t OUTLINED_FUNCTION_25(uint64_t a1)
{
  *(void *)(v1 - 112) = a1;
  return v1 - 112;
}

uint64_t OUTLINED_FUNCTION_27(uint64_t a1)
{
  *(void *)(v1 + 4) = a1;
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_28()
{
  return swift_slowAlloc();
}

uint64_t OUTLINED_FUNCTION_29()
{
  return swift_slowAlloc();
}

uint64_t OUTLINED_FUNCTION_30()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_31(uint64_t result)
{
  *(void *)(v1 - 104) = result;
  return result;
}

uint64_t OUTLINED_FUNCTION_32(float a1)
{
  float *v1 = a1;
  return swift_bridgeObjectRetain();
}

uint64_t sub_1C9ECFCC8(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  sub_1C9ECFD44();
  sub_1C9F07CE8();
  return sub_1C9ECFD90(a2, a3, a4);
}

unint64_t sub_1C9ECFD44()
{
  unint64_t result = qword_1EBC7F6A0;
  if (!qword_1EBC7F6A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBC7F6A0);
  }
  return result;
}

uint64_t sub_1C9ECFD90(uint64_t a1, uint64_t a2, void *a3)
{
  sub_1C9F069B8();
  OUTLINED_FUNCTION_0();
  uint64_t v36 = v5;
  MEMORY[0x1F4188790](v6);
  uint64_t v7 = sub_1C9F07E58();
  OUTLINED_FUNCTION_0();
  uint64_t v40 = v8;
  MEMORY[0x1F4188790](v9);
  size_t v11 = (char *)&v31 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t ObjectType = swift_getObjectType();
  v42[0] = sub_1C9F07C48();
  v42[1] = v12;
  sub_1C9F08038();
  uint64_t v35 = swift_getObjectType();
  uint64_t v41 = v35;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC7FCE8);
  sub_1C9F07FF8();
  sub_1C9F08038();
  swift_bridgeObjectRelease();
  unint64_t v37 = sub_1C9ECFD44();
  uint64_t v39 = v11;
  OUTLINED_FUNCTION_3_0();
  sub_1C9F07CF8();
  swift_bridgeObjectRelease();
  if (qword_1EBC7F680 != -1) {
    swift_once();
  }
  uint64_t v13 = sub_1C9F07E78();
  __swift_project_value_buffer(v13, (uint64_t)qword_1EBC7FEF0);
  id v14 = a3;
  swift_unknownObjectRetain_n();
  id v15 = v14;
  unint64_t v16 = sub_1C9F07E68();
  os_log_type_t v17 = sub_1C9F08188();
  if (os_log_type_enabled(v16, v17))
  {
    uint64_t v18 = swift_slowAlloc();
    uint64_t v33 = v7;
    uint64_t v19 = v18;
    uint64_t v32 = swift_slowAlloc();
    v42[0] = v32;
    *(_DWORD *)uint64_t v19 = 136446722;
    sub_1C9F07A18();
    sub_1C9ED0E30((unint64_t *)&unk_1EBC7F010, MEMORY[0x1E4F27990]);
    uint64_t v20 = sub_1C9F08378();
    uint64_t v34 = a2;
    unint64_t v22 = v21;
    OUTLINED_FUNCTION_1_0();
    v23();
    uint64_t v41 = sub_1C9F01420(v20, v22, v42);
    sub_1C9F08228();

    swift_bridgeObjectRelease();
    *(_WORD *)(v19 + 12) = 2082;
    uint64_t v24 = sub_1C9F084A8();
    uint64_t v41 = sub_1C9F01420(v24, v25, v42);
    sub_1C9F08228();

    swift_bridgeObjectRelease();
    *(_WORD *)(v19 + 22) = 2082;
    uint64_t v26 = sub_1C9F07C48();
    uint64_t v41 = sub_1C9F01420(v26, v27, v42);
    sub_1C9F08228();
    swift_unknownObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1C9EC7000, v16, v17, "Posting messageId: %{public}s of type %{public}s to bridge %{public}s", (uint8_t *)v19, 0x20u);
    uint64_t v28 = v32;
    swift_arrayDestroy();
    MEMORY[0x1CB795290](v28, -1, -1);
    MEMORY[0x1CB795290](v19, -1, -1);
  }
  else
  {

    swift_unknownObjectRelease_n();
  }
  sub_1C9F07C08();
  sub_1C9F07CE8();
  OUTLINED_FUNCTION_1_0();
  return v29();
}

uint64_t sub_1C9ED0234(uint64_t a1, uint64_t a2, void *a3, void *a4, uint64_t a5, uint64_t a6)
{
  uint64_t v67 = a5;
  uint64_t v68 = a6;
  uint64_t v66 = a4;
  uint64_t v9 = sub_1C9F07E98();
  OUTLINED_FUNCTION_0();
  uint64_t v11 = v10;
  MEMORY[0x1F4188790](v12);
  OUTLINED_FUNCTION_2_0();
  uint64_t v65 = v13;
  uint64_t v14 = sub_1C9F07ED8();
  OUTLINED_FUNCTION_0();
  uint64_t v64 = v15;
  MEMORY[0x1F4188790](v16);
  OUTLINED_FUNCTION_2_0();
  uint64_t v63 = v17;
  uint64_t v70 = sub_1C9F07E58();
  OUTLINED_FUNCTION_0();
  uint64_t v19 = v18;
  uint64_t v21 = *(void *)(v20 + 64);
  uint64_t v23 = MEMORY[0x1F4188790](v22);
  uint64_t v24 = (char *)&v57 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v23);
  uint64_t v69 = (char *)&v57 - v25;
  swift_getObjectType();
  if (dynamic_cast_existential_1_conditional(a1))
  {
    uint64_t v58 = v26;
    swift_getObjectType();
    uint64_t v62 = v11;
    swift_unknownObjectRetain();
    uint64_t v61 = v9;
    uint64_t v59 = a2;
    uint64_t aBlock = sub_1C9F07C48();
    uint64_t v72 = v27;
    sub_1C9F08038();
    unsigned int v57 = a3;
    uint64_t v77 = sub_1C9EF9170(a3);
    uint64_t v78 = v28;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC7F7F0);
    sub_1C9F07FF8();
    sub_1C9F08038();
    swift_bridgeObjectRelease();
    uint64_t v60 = v14;
    sub_1C9ECFD44();
    unsigned int v29 = v69;
    OUTLINED_FUNCTION_3_0();
    sub_1C9F07CF8();
    swift_bridgeObjectRelease();
    swift_getObjectType();
    uint64_t v58 = sub_1C9F07B48();
    char v30 = *(void (**)(char *, char *))(v19 + 16);
    uint64_t v31 = v19;
    uint64_t v32 = v70;
    v30(v24, v29);
    unint64_t v33 = (*(unsigned __int8 *)(v31 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v31 + 80);
    unint64_t v34 = (v21 + v33 + 7) & 0xFFFFFFFFFFFFFFF8;
    unint64_t v35 = (v34 + 23) & 0xFFFFFFFFFFFFFFF8;
    unint64_t v36 = (v35 + 15) & 0xFFFFFFFFFFFFFFF8;
    uint64_t v37 = swift_allocObject();
    (*(void (**)(unint64_t, char *, uint64_t))(v31 + 32))(v37 + v33, v24, v32);
    unint64_t v38 = (uint64_t *)(v37 + v34);
    uint64_t v39 = v59;
    *unint64_t v38 = a1;
    v38[1] = v39;
    uint64_t v40 = v57;
    *(void *)(v37 + v35) = v57;
    uint64_t v42 = v66;
    uint64_t v41 = v67;
    *(void *)(v37 + v36) = v66;
    uint64_t v43 = (uint64_t *)(v37 + ((v36 + 15) & 0xFFFFFFFFFFFFFFF8));
    uint64_t v44 = v68;
    uint64_t *v43 = v41;
    v43[1] = v44;
    uint64_t v75 = sub_1C9ED0D50;
    uint64_t v76 = v37;
    uint64_t aBlock = MEMORY[0x1E4F143A8];
    uint64_t v72 = 1107296256;
    uint64_t v73 = sub_1C9EDF1A8;
    uint64_t v74 = &block_descriptor;
    uint64_t v45 = _Block_copy(&aBlock);
    swift_unknownObjectRetain();
    id v46 = v40;
    id v47 = v42;
    sub_1C9ED0E20(v41);
    uint64_t v48 = v63;
    sub_1C9F07EB8();
    uint64_t v77 = MEMORY[0x1E4FBC860];
    sub_1C9ED0E30((unint64_t *)&unk_1EBC7F7E0, MEMORY[0x1E4FBCB00]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC7F7F8);
    sub_1C9ED0E78();
    uint64_t v49 = v65;
    sub_1C9F08278();
    uint64_t v50 = (void *)v58;
    MEMORY[0x1CB794A40](0, v48, v49, v45);
    _Block_release(v45);
    swift_unknownObjectRelease();

    OUTLINED_FUNCTION_1_0();
    v51();
    OUTLINED_FUNCTION_1_0();
    v52();
    (*(void (**)(char *, uint64_t))(v31 + 8))(v69, v70);
    return swift_release();
  }
  else
  {
    uint64_t v54 = (uint64_t)v66;
    uint64_t v55 = v67;
    uint64_t v56 = v68;
    return sub_1C9ED07D4(a1, a2, a3, v54, v55, v56);
  }
}

uint64_t sub_1C9ED0730(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  sub_1C9ECFD44();
  sub_1C9F07CE8();
  return sub_1C9ED07D4(a2, a3, a4, a5, a6, a7);
}

uint64_t sub_1C9ED07D4(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v31 = a5;
  uint64_t v32 = a6;
  uint64_t v30 = a4;
  uint64_t v7 = sub_1C9F07E58();
  uint64_t v33 = *(void *)(v7 - 8);
  uint64_t v34 = v7;
  MEMORY[0x1F4188790](v7);
  unsigned int v29 = (char *)&v28 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1EBC7F680 != -1) {
    swift_once();
  }
  uint64_t v9 = sub_1C9F07E78();
  __swift_project_value_buffer(v9, (uint64_t)qword_1EBC7FEF0);
  id v10 = a3;
  swift_unknownObjectRetain_n();
  id v11 = v10;
  uint64_t v12 = sub_1C9F07E68();
  os_log_type_t v13 = sub_1C9F08158();
  if (os_log_type_enabled(v12, v13))
  {
    uint64_t v14 = swift_slowAlloc();
    uint64_t v28 = swift_slowAlloc();
    v35[0] = v28;
    *(_DWORD *)uint64_t v14 = 136315650;
    uint64_t v36 = sub_1C9EF9170(v11);
    uint64_t v37 = v15;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC7F7F0);
    uint64_t v16 = sub_1C9F07FF8();
    uint64_t v36 = sub_1C9F01420(v16, v17, v35);
    sub_1C9F08228();

    swift_bridgeObjectRelease();
    *(_WORD *)(v14 + 12) = 2080;
    uint64_t v36 = sub_1C9EF917C(v11);
    uint64_t v37 = v18;
    uint64_t v19 = sub_1C9F07FF8();
    uint64_t v36 = sub_1C9F01420(v19, v20, v35);
    sub_1C9F08228();

    swift_bridgeObjectRelease();
    *(_WORD *)(v14 + 22) = 2080;
    swift_getObjectType();
    uint64_t v21 = sub_1C9F07C48();
    uint64_t v36 = sub_1C9F01420(v21, v22, v35);
    sub_1C9F08228();
    swift_unknownObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1C9EC7000, v12, v13, "Forwarding ace command %s with aceId: %s to bridge: %s", (uint8_t *)v14, 0x20u);
    uint64_t v23 = v28;
    swift_arrayDestroy();
    MEMORY[0x1CB795290](v23, -1, -1);
    MEMORY[0x1CB795290](v14, -1, -1);
  }
  else
  {

    swift_unknownObjectRelease_n();
  }
  swift_getObjectType();
  uint64_t v36 = sub_1C9F07C48();
  uint64_t v37 = v24;
  sub_1C9F08038();
  v35[0] = sub_1C9EF9170(v11);
  v35[1] = v25;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC7F7F0);
  sub_1C9F07FF8();
  sub_1C9F08038();
  swift_bridgeObjectRelease();
  sub_1C9ECFD44();
  uint64_t v26 = v29;
  sub_1C9F07CF8();
  swift_bridgeObjectRelease();
  sub_1C9F07C58();
  sub_1C9F07CE8();
  return (*(uint64_t (**)(char *, uint64_t))(v33 + 8))(v26, v34);
}

uint64_t dynamic_cast_existential_1_conditional(uint64_t a1)
{
  if (swift_conformsToProtocol2()) {
    return a1;
  }
  else {
    return 0;
  }
}

uint64_t sub_1C9ED0C74()
{
  uint64_t v1 = sub_1C9F07E58();
  uint64_t v2 = *(unsigned __int8 *)(*(void *)(v1 - 8) + 80);
  unint64_t v3 = (((*(void *)(*(void *)(v1 - 8) + 64) + ((v2 + 16) & ~v2) + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v4 = (v3 + 15) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v5 = (v4 + 15) & 0xFFFFFFFFFFFFFFF8;
  OUTLINED_FUNCTION_1_0();
  v6();
  swift_unknownObjectRelease();

  if (*(void *)(v0 + v5)) {
    swift_release();
  }
  return MEMORY[0x1F4186498](v0, v5 + 16, v2 | 7);
}

uint64_t sub_1C9ED0D50()
{
  uint64_t v1 = *(void *)(sub_1C9F07E58() - 8);
  unint64_t v2 = (*(unsigned __int8 *)(v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  unint64_t v3 = (*(void *)(v1 + 64) + v2 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v4 = (v3 + 23) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v5 = (v4 + 15) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v6 = v0 + v2;
  uint64_t v7 = *(void *)(v0 + v3);
  uint64_t v8 = *(void *)(v0 + v3 + 8);
  uint64_t v9 = *(void **)(v0 + v4);
  uint64_t v10 = *(void *)(v0 + v5);
  id v11 = (uint64_t *)(v0 + ((v5 + 15) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v12 = *v11;
  uint64_t v13 = v11[1];
  return sub_1C9ED0730(v6, v7, v8, v9, v10, v12, v13);
}

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper()
{
  return swift_release();
}

uint64_t sub_1C9ED0E20(uint64_t result)
{
  if (result) {
    return swift_retain();
  }
  return result;
}

uint64_t sub_1C9ED0E30(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_1C9ED0E78()
{
  unint64_t result = qword_1EBC7F800;
  if (!qword_1EBC7F800)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EBC7F7F8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBC7F800);
  }
  return result;
}

uint64_t sub_1C9ED0F00(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t sub_1C9ED0F14(uint64_t a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC7FD60);
  *(void *)(v1 + 24) = sub_1C9F07F88();
  *(unsigned char *)(v1 + 32) = 0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBC7FDC8);
  *(void *)(v1 + 40) = OUTLINED_FUNCTION_20_0();
  *(void *)(v1 + 48) = OUTLINED_FUNCTION_20_0();
  *(void *)(v1 + 16) = a1;
  return v1;
}

uint64_t sub_1C9ED0FAC(void *a1)
{
  uint64_t v2 = v1;
  unint64_t v4 = (uint8_t *)sub_1C9F07E98();
  OUTLINED_FUNCTION_0();
  uint64_t v6 = v5;
  MEMORY[0x1F4188790](v7);
  OUTLINED_FUNCTION_12_0();
  uint64_t v10 = v9 - v8;
  uint64_t v11 = sub_1C9F07ED8();
  OUTLINED_FUNCTION_0();
  uint64_t v117 = v12;
  MEMORY[0x1F4188790](v13);
  OUTLINED_FUNCTION_2_0();
  uint64_t v114 = v14;
  sub_1C9F07E58();
  OUTLINED_FUNCTION_0();
  uint64_t v115 = v16;
  uint64_t v116 = v15;
  uint64_t v18 = *(void *)(v17 + 64);
  uint64_t v19 = MEMORY[0x1F4188790](v15);
  v113 = (char *)&v100 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v19);
  OUTLINED_FUNCTION_21_0();
  uint64_t v112 = v20;
  MEMORY[0x1F4188790](v21);
  OUTLINED_FUNCTION_21_0();
  uint64_t v121 = v22;
  MEMORY[0x1F4188790](v23);
  OUTLINED_FUNCTION_21_0();
  uint64_t v120 = v24;
  uint64_t v111 = sub_1C9F07A48();
  OUTLINED_FUNCTION_0();
  uint64_t v110 = v25;
  MEMORY[0x1F4188790](v26);
  OUTLINED_FUNCTION_12_0();
  sub_1C9F069B8();
  OUTLINED_FUNCTION_0();
  uint64_t v118 = v27;
  uint64_t v119 = v28;
  MEMORY[0x1F4188790](v27);
  OUTLINED_FUNCTION_2_0();
  aBlock[0] = swift_getObjectType();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC7FCE8);
  uint64_t v29 = sub_1C9F07FF8();
  uint64_t v122 = v2;
  uint64_t v123 = v29;
  unint64_t v31 = v30;
  if ((*(unsigned char *)(v2 + 32) & 1) == 0)
  {
    if (qword_1EBC7F680 != -1) {
      swift_once();
    }
    uint64_t v41 = sub_1C9F07E78();
    __swift_project_value_buffer(v41, (uint64_t)qword_1EBC7FEF0);
    id v34 = a1;
    swift_bridgeObjectRetain();
    unint64_t v35 = sub_1C9F07E68();
    os_log_type_t v36 = sub_1C9F08168();
    if (os_log_type_enabled(v35, v36))
    {
      OUTLINED_FUNCTION_29();
      uint64_t v122 = OUTLINED_FUNCTION_13_0();
      aBlock[0] = v122;
      *(_DWORD *)unint64_t v4 = 136315394;
      swift_bridgeObjectRetain();
      uint64_t v42 = sub_1C9F01420(v123, v31, aBlock);
      OUTLINED_FUNCTION_10_0(v42);
      OUTLINED_FUNCTION_19_0();
      OUTLINED_FUNCTION_11_0();
      sub_1C9ED45C4((unint64_t *)&unk_1EBC7F010, MEMORY[0x1E4F27990]);
      OUTLINED_FUNCTION_5_0();
      OUTLINED_FUNCTION_1_0();
      v43();
      uint64_t v44 = OUTLINED_FUNCTION_4_0();
      OUTLINED_FUNCTION_16_0(v44);

      swift_bridgeObjectRelease();
      uint64_t v40 = "MessageBus was not started rejected posting message type %s, message id: %s";
      goto LABEL_11;
    }
LABEL_12:

    swift_bridgeObjectRelease_n();
    return 0;
  }
  uint64_t v109 = v10;
  uint64_t v32 = a1;
  if (sub_1C9F079E8())
  {
    if (qword_1EBC7F680 != -1) {
      swift_once();
    }
    uint64_t v33 = sub_1C9F07E78();
    __swift_project_value_buffer(v33, (uint64_t)qword_1EBC7FEF0);
    id v34 = a1;
    swift_bridgeObjectRetain();
    unint64_t v35 = sub_1C9F07E68();
    os_log_type_t v36 = sub_1C9F08168();
    if (os_log_type_enabled(v35, v36))
    {
      OUTLINED_FUNCTION_29();
      uint64_t v122 = OUTLINED_FUNCTION_13_0();
      aBlock[0] = v122;
      *(_DWORD *)unint64_t v4 = 136315394;
      swift_bridgeObjectRetain();
      uint64_t v37 = sub_1C9F01420(v123, v31, aBlock);
      OUTLINED_FUNCTION_10_0(v37);
      OUTLINED_FUNCTION_19_0();
      OUTLINED_FUNCTION_11_0();
      sub_1C9ED45C4((unint64_t *)&unk_1EBC7F010, MEMORY[0x1E4F27990]);
      OUTLINED_FUNCTION_5_0();
      OUTLINED_FUNCTION_1_0();
      v38();
      uint64_t v39 = OUTLINED_FUNCTION_4_0();
      OUTLINED_FUNCTION_16_0(v39);

      swift_bridgeObjectRelease();
      uint64_t v40 = "Ignoring posting again message type: %s with msgId: %s back to the bus";
LABEL_11:
      _os_log_impl(&dword_1C9EC7000, v35, v36, v40, v4, 0x16u);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_1();
      OUTLINED_FUNCTION_1();

      return 0;
    }
    goto LABEL_12;
  }
  v108 = v4;
  sub_1C9F079F8();
  sub_1C9F079A8();
  uint64_t v46 = swift_dynamicCastClass();
  uint64_t v47 = qword_1EBC7F680;
  uint64_t v107 = v6;
  uint64_t v106 = v11;
  uint64_t v105 = a1;
  if (v46)
  {
    id v48 = a1;
    if (v47 != -1) {
      swift_once();
    }
    uint64_t v49 = sub_1C9F07E78();
    int v50 = __swift_project_value_buffer(v49, (uint64_t)qword_1EBC7FEF0);
    id v51 = v48;
    swift_bridgeObjectRetain_n();
    id v52 = v51;
    int v53 = v50;
    uint64_t v54 = sub_1C9F07E68();
    os_log_type_t v55 = sub_1C9F08188();
    if (OUTLINED_FUNCTION_5(v55))
    {
      uint64_t v56 = swift_slowAlloc();
      uint64_t v104 = swift_slowAlloc();
      aBlock[0] = v104;
      *(_DWORD *)uint64_t v56 = 136446978;
      int v103 = v53;
      swift_bridgeObjectRetain();
      os_log_t v102 = v54;
      uint64_t v57 = sub_1C9F01420(v123, v31, aBlock);
      OUTLINED_FUNCTION_9_0(v57);
      OUTLINED_FUNCTION_19_0();
      *(_WORD *)(v56 + 12) = 2082;
      uint64_t v101 = v56 + 14;
      sub_1C9F07A18();
      sub_1C9ED45C4((unint64_t *)&unk_1EBC7F010, MEMORY[0x1E4F27990]);
      OUTLINED_FUNCTION_5_0();
      OUTLINED_FUNCTION_1_0();
      v58();
      uint64_t v59 = OUTLINED_FUNCTION_4_0();
      OUTLINED_FUNCTION_7_0(v59);

      swift_bridgeObjectRelease();
      *(_WORD *)(v56 + 22) = 2082;
      uint64_t v60 = sub_1C9F07998();
      uint64_t v62 = sub_1C9F01420(v60, v61, aBlock);
      OUTLINED_FUNCTION_8_0(v62);

      swift_bridgeObjectRelease();
      *(_WORD *)(v56 + 32) = 2082;
      sub_1C9F07A08();
      sub_1C9F07A38();
      OUTLINED_FUNCTION_1_0();
      v63();
      uint64_t v64 = OUTLINED_FUNCTION_4_0();
      OUTLINED_FUNCTION_8_0(v64);

      swift_bridgeObjectRelease();
      os_log_t v65 = v102;
      _os_log_impl(&dword_1C9EC7000, v102, (os_log_type_t)v103, "Posting message type: %{public}s with msgId: %{public}s for requestId: %{public}s from source: %{public}s to the message bus", (uint8_t *)v56, 0x2Au);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_1();
      OUTLINED_FUNCTION_1();
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
  else
  {
    if (qword_1EBC7F680 != -1) {
      swift_once();
    }
    uint64_t v66 = sub_1C9F07E78();
    int v67 = __swift_project_value_buffer(v66, (uint64_t)qword_1EBC7FEF0);
    id v68 = v32;
    swift_bridgeObjectRetain_n();
    id v69 = v68;
    uint64_t v70 = sub_1C9F07E68();
    os_log_type_t v71 = sub_1C9F08188();
    if (OUTLINED_FUNCTION_5(v71))
    {
      uint64_t v72 = swift_slowAlloc();
      uint64_t v104 = swift_slowAlloc();
      aBlock[0] = v104;
      *(_DWORD *)uint64_t v72 = 136446722;
      int v103 = v67;
      swift_bridgeObjectRetain();
      os_log_t v102 = v70;
      uint64_t v73 = sub_1C9F01420(v123, v31, aBlock);
      OUTLINED_FUNCTION_9_0(v73);
      OUTLINED_FUNCTION_19_0();
      *(_WORD *)(v72 + 12) = 2082;
      uint64_t v101 = v72 + 14;
      sub_1C9F07A18();
      sub_1C9ED45C4((unint64_t *)&unk_1EBC7F010, MEMORY[0x1E4F27990]);
      OUTLINED_FUNCTION_5_0();
      OUTLINED_FUNCTION_1_0();
      v74();
      uint64_t v75 = OUTLINED_FUNCTION_4_0();
      OUTLINED_FUNCTION_7_0(v75);

      swift_bridgeObjectRelease();
      *(_WORD *)(v72 + 22) = 2082;
      sub_1C9F07A08();
      sub_1C9F07A38();
      OUTLINED_FUNCTION_1_0();
      v76();
      uint64_t v77 = OUTLINED_FUNCTION_4_0();
      OUTLINED_FUNCTION_8_0(v77);

      swift_bridgeObjectRelease();
      os_log_t v78 = v102;
      _os_log_impl(&dword_1C9EC7000, v102, (os_log_type_t)v103, "Posting message type: %{public}s with msgId: %{public}s from source: %{public}s to the message bus", (uint8_t *)v72, 0x20u);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_1();
      OUTLINED_FUNCTION_1();
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
  sub_1C9ECFD44();
  uint64_t v79 = v120;
  sub_1C9F07D08();
  uint64_t v80 = v121;
  sub_1C9F07CF8();
  swift_bridgeObjectRelease();
  uint64_t v123 = *(void *)(v122 + 16);
  uint64_t v81 = v115;
  uint64_t v82 = v116;
  uint64_t v83 = *(void (**)(uint64_t, uint64_t, uint64_t))(v115 + 16);
  uint64_t v84 = v112;
  v83(v112, v79, v116);
  uint64_t v85 = v113;
  v83((uint64_t)v113, v80, v82);
  uint64_t v86 = *(unsigned __int8 *)(v81 + 80);
  uint64_t v87 = (v86 + 16) & ~v86;
  uint64_t v88 = (v18 + v86 + v87) & ~v86;
  unint64_t v89 = (v18 + v88 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v90 = swift_allocObject();
  v91 = *(void (**)(uint64_t, uint64_t, uint64_t))(v81 + 32);
  v91(v90 + v87, v84, v82);
  v91(v90 + v88, (uint64_t)v85, v82);
  *(void *)(v90 + v89) = v122;
  uint64_t v92 = v105;
  *(void *)(v90 + ((v89 + 15) & 0xFFFFFFFFFFFFFFF8)) = v105;
  aBlock[4] = (uint64_t)sub_1C9ED46FC;
  aBlock[5] = v90;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_1C9EDF1A8;
  aBlock[3] = (uint64_t)&block_descriptor_19;
  int v93 = _Block_copy(aBlock);
  id v94 = v92;
  swift_retain();
  uint64_t v95 = v114;
  sub_1C9F07EB8();
  aBlock[7] = MEMORY[0x1E4FBC860];
  sub_1C9ED45C4((unint64_t *)&unk_1EBC7F7E0, MEMORY[0x1E4FBCB00]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC7F7F8);
  sub_1C9ED0E78();
  uint64_t v96 = v109;
  sub_1C9F08278();
  MEMORY[0x1CB794A40](0, v95, v96, v93);
  _Block_release(v93);
  OUTLINED_FUNCTION_1_0();
  v97();
  OUTLINED_FUNCTION_1_0();
  v98();
  unint64_t v99 = *(void (**)(uint64_t, uint64_t))(v81 + 8);
  v99(v121, v82);
  v99(v120, v82);
  swift_release();
  return 1;
}

uint64_t sub_1C9ED1D74(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  return sub_1C9ED1E10(a4);
}

uint64_t sub_1C9ED1E10(void *a1)
{
  uint64_t v93 = sub_1C9F07E98();
  OUTLINED_FUNCTION_0();
  uint64_t v100 = v3;
  MEMORY[0x1F4188790](v4);
  OUTLINED_FUNCTION_2_0();
  uint64_t v92 = v5;
  uint64_t v91 = sub_1C9F07ED8();
  OUTLINED_FUNCTION_0();
  uint64_t v81 = v6;
  MEMORY[0x1F4188790](v7);
  OUTLINED_FUNCTION_2_0();
  uint64_t v90 = v8;
  uint64_t v9 = sub_1C9F069B8();
  OUTLINED_FUNCTION_0();
  os_log_type_t v98 = v10;
  MEMORY[0x1F4188790](v11);
  OUTLINED_FUNCTION_2_0();
  uint64_t v86 = v12;
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC7F860);
  MEMORY[0x1F4188790](v13 - 8);
  OUTLINED_FUNCTION_2_0();
  uint64_t v15 = v14;
  uint64_t v96 = sub_1C9F07E58();
  OUTLINED_FUNCTION_0();
  uint64_t v97 = v16;
  uint64_t v18 = MEMORY[0x1F4188790](v17);
  unint64_t v89 = (char *)v80 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v18);
  OUTLINED_FUNCTION_21_0();
  uint64_t v101 = v20;
  *(void *)&long long v102 = v21;
  MEMORY[0x1F4188790](v22);
  uint64_t v24 = (char *)v80 - v23;
  uint64_t ObjectType = swift_getObjectType();
  uint64_t aBlock = ObjectType;
  uint64_t v88 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC7FCE8);
  uint64_t v25 = sub_1C9F07FF8();
  uint64_t v27 = v26;
  unint64_t v28 = sub_1C9ECFD44();
  swift_bridgeObjectRetain();
  unint64_t v95 = v28;
  sub_1C9F07CF8();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_15_0();
  uint64_t v29 = *(void *)(v1 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v30 = sub_1C9EFE710(v25, v27, v29);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (!v30)
  {
    uint64_t v110 = MEMORY[0x1E4FBC860];
    uint64_t v103 = MEMORY[0x1E4FBC870];
    uint64_t v107 = (void *)sub_1C9F07A28();
    uint64_t aBlock = (uint64_t)a1;
    id v31 = a1;
    sub_1C9F08438();
    uint64_t v32 = sub_1C9F08458();
    __swift_storeEnumTagSinglePayload(v15, 0, 1, v32);
    sub_1C9ED29F8(v15, &v103, &v110);
    sub_1C9ED441C(v15);
    swift_bridgeObjectRelease();
    uint64_t v30 = v110;
    swift_beginAccess();
    uint64_t v33 = swift_bridgeObjectRetain();
    sub_1C9F02670(v33, v25, v27);
    swift_endAccess();
  }
  swift_bridgeObjectRelease();
  uint64_t v99 = *(void *)(v30 + 16);
  if (v99)
  {
    if (qword_1EBC7F680 != -1) {
      swift_once();
    }
    uint64_t v34 = sub_1C9F07E78();
    __swift_project_value_buffer(v34, (uint64_t)qword_1EBC7FEF0);
    id v35 = a1;
    os_log_type_t v36 = sub_1C9F07E68();
    os_log_type_t v37 = sub_1C9F08158();
    BOOL v38 = os_log_type_enabled(v36, v37);
    os_log_type_t v98 = v35;
    v80[1] = v24;
    if (v38)
    {
      uint64_t v39 = (uint8_t *)swift_slowAlloc();
      uint64_t aBlock = swift_slowAlloc();
      *(_DWORD *)uint64_t v39 = 136315138;
      uint64_t v86 = v39 + 4;
      id v40 = objc_msgSend(v35, sel_debugDescription);
      uint64_t v41 = sub_1C9F07FE8();
      unint64_t v43 = v42;

      uint64_t v110 = sub_1C9F01420(v41, v43, &aBlock);
      sub_1C9F08228();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1C9EC7000, v36, v37, "Posting following message to bus %s", v39, 0xCu);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_1();
      OUTLINED_FUNCTION_1();
    }
    else
    {
    }
    uint64_t v55 = 0;
    uint64_t v86 = (uint8_t *)(v97 + 16);
    uint64_t v85 = v102 + 7;
    uint64_t v84 = v97 + 32;
    uint64_t v83 = &v106;
    uint64_t v82 = v100 + 8;
    v81 += 8;
    v80[2] = v97 + 8;
    uint64_t v87 = v30;
    uint64_t v56 = v97;
    do
    {
      long long v102 = *(_OWORD *)(v30 + 16 * v55 + 32);
      uint64_t v57 = v102;
      swift_getObjectType();
      uint64_t v58 = dynamic_cast_existential_1_conditional(v57);
      uint64_t v59 = *((void *)&v102 + 1);
      if (v58)
      {
        swift_getObjectType();
        swift_unknownObjectRetain_n();
        uint64_t aBlock = sub_1C9F07C48();
        uint64_t v105 = v60;
        sub_1C9F08038();
        uint64_t v110 = ObjectType;
        sub_1C9F07FF8();
        sub_1C9F08038();
        swift_bridgeObjectRelease();
        uint64_t v61 = v101;
        sub_1C9F07CF8();
        swift_bridgeObjectRelease();
        swift_getObjectType();
        uint64_t v100 = sub_1C9F07B48();
        uint64_t v62 = v89;
        uint64_t v63 = v61;
        uint64_t v64 = v96;
        (*(void (**)(char *, uint64_t, uint64_t))(v56 + 16))(v89, v63, v96);
        unint64_t v65 = (*(unsigned __int8 *)(v56 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v56 + 80);
        unint64_t v66 = (v85 + v65) & 0xFFFFFFFFFFFFFFF8;
        uint64_t v67 = swift_allocObject();
        (*(void (**)(unint64_t, char *, uint64_t))(v56 + 32))(v67 + v65, v62, v64);
        *(_OWORD *)(v67 + v66) = v102;
        id v68 = v98;
        *(void *)(v67 + ((v66 + 23) & 0xFFFFFFFFFFFFFFF8)) = v98;
        v108 = sub_1C9ED4534;
        uint64_t v109 = v67;
        uint64_t aBlock = MEMORY[0x1E4F143A8];
        uint64_t v105 = 1107296256;
        uint64_t v106 = sub_1C9EDF1A8;
        uint64_t v107 = &block_descriptor_0;
        id v69 = _Block_copy(&aBlock);
        id v70 = v68;
        swift_unknownObjectRetain();
        uint64_t v71 = v90;
        sub_1C9F07EB8();
        uint64_t v110 = MEMORY[0x1E4FBC860];
        sub_1C9ED45C4((unint64_t *)&unk_1EBC7F7E0, MEMORY[0x1E4FBCB00]);
        __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC7F7F8);
        sub_1C9ED0E78();
        uint64_t v72 = v92;
        uint64_t v30 = v87;
        sub_1C9F08278();
        uint64_t v73 = (void *)v100;
        MEMORY[0x1CB794A40](0, v71, v72, v69);
        _Block_release(v69);
        swift_unknownObjectRelease();

        OUTLINED_FUNCTION_1_0();
        v74();
        OUTLINED_FUNCTION_1_0();
        v75();
        OUTLINED_FUNCTION_1_0();
        v76();
        swift_unknownObjectRelease();
        swift_release();
      }
      else
      {
        uint64_t v77 = swift_unknownObjectRetain();
        sub_1C9ECFD90(v77, v59, v98);
        swift_unknownObjectRelease();
      }
      ++v55;
    }
    while (v99 != v55);
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    if (qword_1EBC7F680 != -1) {
      swift_once();
    }
    uint64_t v44 = sub_1C9F07E78();
    __swift_project_value_buffer(v44, (uint64_t)qword_1EBC7FEF0);
    id v45 = a1;
    uint64_t v46 = sub_1C9F07E68();
    os_log_type_t v47 = sub_1C9F08188();
    if (os_log_type_enabled(v46, v47))
    {
      OUTLINED_FUNCTION_29();
      *(void *)&long long v102 = OUTLINED_FUNCTION_13_0();
      uint64_t aBlock = v102;
      *(_DWORD *)uint64_t v30 = 136446466;
      uint64_t v48 = sub_1C9F084A8();
      uint64_t v110 = sub_1C9F01420(v48, v49, &aBlock);
      sub_1C9F08228();
      swift_bridgeObjectRelease();
      *(_WORD *)(v30 + 12) = 2082;
      int v50 = v86;
      sub_1C9F07A18();
      sub_1C9ED45C4((unint64_t *)&unk_1EBC7F010, MEMORY[0x1E4F27990]);
      uint64_t v51 = sub_1C9F08378();
      uint64_t v52 = v9;
      unint64_t v54 = v53;
      (*((void (**)(uint8_t *, uint64_t))v98 + 1))(v50, v52);
      uint64_t v110 = sub_1C9F01420(v51, v54, &aBlock);
      sub_1C9F08228();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1C9EC7000, v46, v47, "There is no bridge that registered to consume message type %{public}s and message id: %{public}s", (uint8_t *)v30, 0x16u);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_1();
      OUTLINED_FUNCTION_1();
    }
    else
    {
    }
  }
  sub_1C9F07CE8();
  OUTLINED_FUNCTION_1_0();
  return v78();
}

uint64_t sub_1C9ED29F8(uint64_t a1, uint64_t *a2, uint64_t *a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC7F860);
  uint64_t v9 = MEMORY[0x1F4188790](v8 - 8);
  uint64_t v11 = (char *)&v42 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v9);
  uint64_t v13 = (char *)&v42 - v12;
  uint64_t v14 = sub_1C9F08458();
  OUTLINED_FUNCTION_0();
  uint64_t v16 = v15;
  MEMORY[0x1F4188790](v17);
  OUTLINED_FUNCTION_12_0();
  uint64_t v20 = v19 - v18;
  uint64_t v21 = *(void *)(*a2 + 16);
  uint64_t result = OUTLINED_FUNCTION_15_0();
  if (v21 != *(void *)(*(void *)(v4 + 24) + 16))
  {
    sub_1C9ED43B4(a1, (uint64_t)v13);
    if (__swift_getEnumTagSinglePayload((uint64_t)v13, 1, v14) == 1)
    {
      return sub_1C9ED441C((uint64_t)v13);
    }
    else
    {
      (*(void (**)(uint64_t, char *, uint64_t))(v16 + 32))(v20, v13, v14);
      v48[2] = sub_1C9F08448();
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBC7F870);
      uint64_t v23 = sub_1C9F07FF8();
      uint64_t v25 = v24;
      OUTLINED_FUNCTION_15_0();
      uint64_t v26 = *(void *)(v4 + 48);
      swift_bridgeObjectRetain();
      uint64_t v27 = sub_1C9EFE710(v23, v25, v26);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (v27)
      {
        uint64_t v43 = v20;
        uint64_t v44 = v16;
        uint64_t v45 = v14;
        uint64_t v46 = v11;
        uint64_t v47 = v27;
        uint64_t v28 = *(void *)(v27 + 16);
        if (v28)
        {
          uint64_t v29 = (uint64_t *)(v47 + 40);
          do
          {
            uint64_t v30 = *(v29 - 1);
            uint64_t v31 = *v29;
            uint64_t v32 = *a2;
            uint64_t ObjectType = swift_getObjectType();
            swift_unknownObjectRetain();
            uint64_t v34 = sub_1C9F07C48();
            LOBYTE(v32) = sub_1C9ED2D60(v34, v35, v32);
            swift_bridgeObjectRelease();
            if (v32)
            {
              swift_unknownObjectRelease();
            }
            else
            {
              os_log_type_t v36 = (void *)*a3;
              swift_unknownObjectRetain();
              char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
              *a3 = (uint64_t)v36;
              if ((isUniquelyReferenced_nonNull_native & 1) == 0)
              {
                os_log_type_t v36 = OUTLINED_FUNCTION_14_0();
                *a3 = (uint64_t)v36;
              }
              unint64_t v39 = v36[2];
              unint64_t v38 = v36[3];
              if (v39 >= v38 >> 1)
              {
                os_log_type_t v36 = sub_1C9EF86E4((void *)(v38 > 1), v39 + 1, 1, (uint64_t)v36);
                *a3 = (uint64_t)v36;
              }
              sub_1C9EFB8D8(v39, v30, a3, ObjectType, v31);
              *a3 = (uint64_t)v36;
              uint64_t v40 = sub_1C9F07C48();
              sub_1C9ED392C(v48, v40, v41);
              swift_unknownObjectRelease();
              swift_bridgeObjectRelease();
            }
            v29 += 2;
            --v28;
          }
          while (v28);
        }
        swift_bridgeObjectRelease();
        uint64_t v14 = v45;
        uint64_t v11 = v46;
        uint64_t v20 = v43;
        uint64_t v16 = v44;
      }
      sub_1C9F08428();
      sub_1C9ED29F8(v11, a2, a3);
      sub_1C9ED441C((uint64_t)v11);
      return (*(uint64_t (**)(uint64_t, uint64_t))(v16 + 8))(v20, v14);
    }
  }
  return result;
}

uint64_t sub_1C9ED2D60(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a3 + 16))
  {
    sub_1C9F08408();
    sub_1C9F08028();
    uint64_t v6 = sub_1C9F08418();
    uint64_t v7 = -1 << *(unsigned char *)(a3 + 32);
    unint64_t v8 = v6 & ~v7;
    uint64_t v9 = a3 + 56;
    if ((*(void *)(a3 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8))
    {
      uint64_t v10 = *(void *)(a3 + 48);
      uint64_t v11 = (void *)(v10 + 16 * v8);
      BOOL v12 = *v11 == a1 && v11[1] == a2;
      if (v12 || (sub_1C9F08388() & 1) != 0) {
        return 1;
      }
      uint64_t v14 = ~v7;
      unint64_t v15 = (v8 + 1) & v14;
      if ((*(void *)(v9 + ((v15 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v15))
      {
        while (1)
        {
          uint64_t v16 = (void *)(v10 + 16 * v15);
          BOOL v17 = *v16 == a1 && v16[1] == a2;
          if (v17 || (sub_1C9F08388() & 1) != 0) {
            break;
          }
          uint64_t result = 0;
          unint64_t v15 = (v15 + 1) & v14;
          if (((*(void *)(v9 + ((v15 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v15) & 1) == 0) {
            return result;
          }
        }
        return 1;
      }
    }
  }
  return 0;
}

void sub_1C9ED2E98()
{
  if (*(unsigned char *)(v0 + 32) == 1)
  {
    if (qword_1EBC7F680 != -1) {
      swift_once();
    }
    uint64_t v1 = sub_1C9F07E78();
    __swift_project_value_buffer(v1, (uint64_t)qword_1EBC7FEF0);
    oslog = sub_1C9F07E68();
    os_log_type_t v2 = sub_1C9F08188();
    if (os_log_type_enabled(oslog, v2))
    {
      uint64_t v3 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v3 = 0;
      _os_log_impl(&dword_1C9EC7000, oslog, v2, "MessageBus was already started before", v3, 2u);
      OUTLINED_FUNCTION_1();
    }
  }
  else
  {
    uint64_t v4 = v0;
    if (qword_1EBC7F680 != -1) {
      swift_once();
    }
    uint64_t v5 = sub_1C9F07E78();
    __swift_project_value_buffer(v5, (uint64_t)qword_1EBC7FEF0);
    uint64_t v6 = sub_1C9F07E68();
    os_log_type_t v7 = sub_1C9F08188();
    if (os_log_type_enabled(v6, v7))
    {
      unint64_t v8 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v8 = 0;
      _os_log_impl(&dword_1C9EC7000, v6, v7, "MessageBus was started", v8, 2u);
      OUTLINED_FUNCTION_1();
    }

    *(unsigned char *)(v4 + 32) = 1;
  }
}

uint64_t sub_1C9ED3050(uint64_t a1, uint64_t a2)
{
  if (*(unsigned char *)(v2 + 32) == 1)
  {
    if (qword_1EBC7F680 != -1) {
LABEL_40:
    }
      swift_once();
    uint64_t v3 = sub_1C9F07E78();
    os_log_type_t v4 = __swift_project_value_buffer(v3, (uint64_t)qword_1EBC7FEF0);
    uint64_t v5 = sub_1C9F07E68();
    os_log_type_t v6 = sub_1C9F08168();
    if (OUTLINED_FUNCTION_5(v6))
    {
      os_log_type_t v7 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)os_log_type_t v7 = 0;
      _os_log_impl(&dword_1C9EC7000, v5, v4, "Cannot register bridge after message bus was started", v7, 2u);
      OUTLINED_FUNCTION_1();
    }

    return 0;
  }
  uint64_t v8 = v2;
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v12 = sub_1C9F07C48();
  uint64_t v14 = v13;
  OUTLINED_FUNCTION_15_0();
  uint64_t v15 = *(void *)(v8 + 24);
  swift_bridgeObjectRetain();
  uint64_t v16 = sub_1C9EFE714(v12, v14, v15);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  if (v16)
  {
    if (qword_1EBC7F680 != -1) {
      swift_once();
    }
    uint64_t v17 = sub_1C9F07E78();
    __swift_project_value_buffer(v17, (uint64_t)qword_1EBC7FEF0);
    swift_unknownObjectRetain_n();
    uint64_t v18 = sub_1C9F07E68();
    os_log_type_t v19 = sub_1C9F08168();
    if (os_log_type_enabled(v18, v19))
    {
      uint64_t v20 = (uint8_t *)swift_slowAlloc();
      v71[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v20 = 136315138;
      uint64_t v21 = sub_1C9F07C48();
      v70[0] = sub_1C9F01420(v21, v22, v71);
      sub_1C9F08228();
      swift_unknownObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1C9EC7000, v18, v19, "Bridge: %s is already register message types, ignore this register", v20, 0xCu);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_1();
      OUTLINED_FUNCTION_1();
    }
    else
    {

      swift_unknownObjectRelease_n();
    }
    return 0;
  }
  uint64_t v66 = ObjectType;
  uint64_t v23 = sub_1C9F07C18();
  if (qword_1EBC7F680 != -1) {
    swift_once();
  }
  uint64_t v24 = sub_1C9F07E78();
  __swift_project_value_buffer(v24, (uint64_t)qword_1EBC7FEF0);
  swift_unknownObjectRetain_n();
  swift_bridgeObjectRetain_n();
  uint64_t v25 = sub_1C9F07E68();
  os_log_type_t v26 = sub_1C9F08158();
  uint64_t v67 = v23;
  if (os_log_type_enabled(v25, v26))
  {
    uint64_t v27 = OUTLINED_FUNCTION_29();
    v71[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v27 = 136315394;
    swift_bridgeObjectRetain();
    uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC7FCE8);
    uint64_t v29 = MEMORY[0x1CB794960](v23, v28);
    unint64_t v31 = v30;
    swift_bridgeObjectRelease();
    sub_1C9F01420(v29, v31, v71);
    sub_1C9F08228();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v27 + 12) = 2080;
    uint64_t v32 = sub_1C9F07C48();
    v70[0] = sub_1C9F01420(v32, v33, v71);
    uint64_t v23 = v67;
    sub_1C9F08228();
    swift_unknownObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1C9EC7000, v25, v26, "registering messages %s to consume by bridge %s", (uint8_t *)v27, 0x16u);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_1();
    OUTLINED_FUNCTION_1();
  }
  else
  {

    swift_unknownObjectRelease_n();
    swift_bridgeObjectRelease_n();
  }
  uint64_t v35 = sub_1C9F07C48();
  uint64_t v37 = v36;
  swift_beginAccess();
  uint64_t v38 = swift_unknownObjectRetain();
  sub_1C9F02688(v38, a2, v35, v37);
  swift_endAccess();
  swift_bridgeObjectRelease();
  *(void *)os_log_type_t type = *(void *)(v23 + 16);
  if (!*(void *)type)
  {
LABEL_37:
    swift_bridgeObjectRelease();
    return 1;
  }
  uint64_t v64 = a2;
  unint64_t v39 = (void *)(v8 + 48);
  OUTLINED_FUNCTION_15_0();
  uint64_t v40 = 0;
  id v68 = v39;
  while (1)
  {
    v70[0] = *(void *)(v23 + 8 * v40 + 32);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC7FCE8);
    uint64_t v41 = sub_1C9F07FF8();
    uint64_t v43 = v42;
    uint64_t v44 = *v39;
    uint64_t v45 = *(void *)(*v39 + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v45)
    {
      unint64_t v46 = sub_1C9F01B5C(v41, v43);
      uint64_t v47 = MEMORY[0x1E4FBC860];
      if (v48)
      {
        uint64_t v47 = *(void *)(*(void *)(v44 + 56) + 8 * v46);
        swift_bridgeObjectRetain();
      }
    }
    else
    {
      uint64_t v47 = MEMORY[0x1E4FBC860];
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_unknownObjectRetain();
    swift_bridgeObjectRetain();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v70[0] = v47;
    int v50 = (void *)v47;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      int v50 = OUTLINED_FUNCTION_14_0();
      v70[0] = (uint64_t)v50;
    }
    unint64_t v52 = v50[2];
    unint64_t v51 = v50[3];
    if (v52 >= v51 >> 1)
    {
      int v50 = sub_1C9EF86E4((void *)(v51 > 1), v52 + 1, 1, (uint64_t)v50);
      v70[0] = (uint64_t)v50;
    }
    sub_1C9EFB8D8(v52, a1, v70, ObjectType, v64);
    swift_bridgeObjectRelease();
    swift_beginAccess();
    swift_isUniquelyReferenced_nonNull_native();
    id v69 = (void *)*v68;
    *id v68 = 0x8000000000000000;
    unint64_t v53 = sub_1C9F01B5C(v41, v43);
    if (__OFADD__(v69[2], (v54 & 1) == 0))
    {
      __break(1u);
LABEL_39:
      __break(1u);
      goto LABEL_40;
    }
    unint64_t v55 = v53;
    char v56 = v54;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBC7FE40);
    if (sub_1C9F082E8()) {
      break;
    }
LABEL_32:
    if (v56)
    {
      uint64_t v59 = v69[7];
      swift_bridgeObjectRelease();
      *(void *)(v59 + 8 * v55) = v50;
    }
    else
    {
      v69[(v55 >> 6) + 8] |= 1 << v55;
      uint64_t v60 = (uint64_t *)(v69[6] + 16 * v55);
      *uint64_t v60 = v41;
      v60[1] = v43;
      *(void *)(v69[7] + 8 * v55) = v50;
      uint64_t v61 = v69[2];
      BOOL v62 = __OFADD__(v61, 1);
      uint64_t v63 = v61 + 1;
      if (v62) {
        goto LABEL_39;
      }
      v69[2] = v63;
      swift_bridgeObjectRetain();
    }
    ++v40;
    unint64_t v39 = v68;
    *id v68 = v69;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_endAccess();
    uint64_t ObjectType = v66;
    uint64_t v23 = v67;
    if (*(void *)type == v40) {
      goto LABEL_37;
    }
  }
  unint64_t v57 = sub_1C9F01B5C(v41, v43);
  if ((v56 & 1) == (v58 & 1))
  {
    unint64_t v55 = v57;
    goto LABEL_32;
  }
  uint64_t result = sub_1C9F083B8();
  __break(1u);
  return result;
}

uint64_t sub_1C9ED3844()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_1C9ED387C()
{
  sub_1C9ED3844();
  return MEMORY[0x1F4186488](v0, 56, 7);
}

uint64_t type metadata accessor for Broker()
{
  return self;
}

uint64_t sub_1C9ED38D4(void (*a1)(void))
{
  a1();
  return sub_1C9F084A8();
}

uint64_t sub_1C9ED3910(uint64_t result, uint64_t a2, void *a3)
{
  if (a2 < 0)
  {
    __break(1u);
  }
  else
  {
    for (; a2; --a2)
      *a3++ = result;
  }
  return result;
}

uint64_t sub_1C9ED392C(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = *v3;
  sub_1C9F08408();
  swift_bridgeObjectRetain();
  sub_1C9F08028();
  uint64_t v8 = sub_1C9F08418();
  uint64_t v9 = -1 << *(unsigned char *)(v7 + 32);
  unint64_t v10 = v8 & ~v9;
  if ((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10))
  {
    uint64_t v11 = *(void *)(v7 + 48);
    uint64_t v12 = (void *)(v11 + 16 * v10);
    BOOL v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (sub_1C9F08388() & 1) != 0)
    {
LABEL_7:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v14 = (uint64_t *)(*(void *)(*v3 + 48) + 16 * v10);
      uint64_t v15 = v14[1];
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
      uint64_t v18 = (void *)(v11 + 16 * v10);
      BOOL v19 = *v18 == a2 && v18[1] == a3;
      if (v19 || (sub_1C9F08388() & 1) != 0) {
        goto LABEL_7;
      }
    }
  }
  swift_bridgeObjectRelease();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v21 = *v3;
  *uint64_t v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_1C9ED3DB8(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  *uint64_t v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t sub_1C9ED3ADC()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBC7F848);
  uint64_t v3 = sub_1C9F08298();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    unint64_t v30 = (void *)(v2 + 56);
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
    if (!v7) {
      goto LABEL_7;
    }
LABEL_6:
    unint64_t v12 = __clz(__rbit64(v7));
    v7 &= v7 - 1;
    for (unint64_t i = v12 | (v11 << 6); ; unint64_t i = __clz(__rbit64(v15)) + (v11 << 6))
    {
      uint64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + 16 * i);
      uint64_t v18 = *v17;
      uint64_t v19 = v17[1];
      sub_1C9F08408();
      sub_1C9F08028();
      uint64_t result = sub_1C9F08418();
      uint64_t v20 = -1 << *(unsigned char *)(v4 + 32);
      unint64_t v21 = result & ~v20;
      unint64_t v22 = v21 >> 6;
      if (((-1 << v21) & ~*(void *)(v9 + 8 * (v21 >> 6))) == 0)
      {
        char v24 = 0;
        unint64_t v25 = (unint64_t)(63 - v20) >> 6;
        while (++v22 != v25 || (v24 & 1) == 0)
        {
          BOOL v26 = v22 == v25;
          if (v22 == v25) {
            unint64_t v22 = 0;
          }
          v24 |= v26;
          uint64_t v27 = *(void *)(v9 + 8 * v22);
          if (v27 != -1)
          {
            unint64_t v23 = __clz(__rbit64(~v27)) + (v22 << 6);
            goto LABEL_30;
          }
        }
        __break(1u);
LABEL_38:
        __break(1u);
LABEL_39:
        __break(1u);
        return result;
      }
      unint64_t v23 = __clz(__rbit64((-1 << v21) & ~*(void *)(v9 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
LABEL_30:
      *(void *)(v9 + ((v23 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v23;
      uint64_t v28 = (void *)(*(void *)(v4 + 48) + 16 * v23);
      *uint64_t v28 = v18;
      v28[1] = v19;
      ++*(void *)(v4 + 16);
      if (v7) {
        goto LABEL_6;
      }
LABEL_7:
      int64_t v14 = v11 + 1;
      if (__OFADD__(v11, 1)) {
        goto LABEL_38;
      }
      if (v14 >= v8) {
        goto LABEL_32;
      }
      unint64_t v15 = v30[v14];
      ++v11;
      if (!v15)
      {
        int64_t v11 = v14 + 1;
        if (v14 + 1 >= v8) {
          goto LABEL_32;
        }
        unint64_t v15 = v30[v11];
        if (!v15)
        {
          int64_t v11 = v14 + 2;
          if (v14 + 2 >= v8) {
            goto LABEL_32;
          }
          unint64_t v15 = v30[v11];
          if (!v15)
          {
            int64_t v16 = v14 + 3;
            if (v16 >= v8)
            {
LABEL_32:
              swift_release();
              uint64_t v1 = v0;
              uint64_t v29 = 1 << *(unsigned char *)(v2 + 32);
              if (v29 > 63) {
                sub_1C9ED3910(0, (unint64_t)(v29 + 63) >> 6, v30);
              }
              else {
                *unint64_t v30 = -1 << v29;
              }
              *(void *)(v2 + 16) = 0;
              break;
            }
            unint64_t v15 = v30[v16];
            if (!v15)
            {
              while (1)
              {
                int64_t v11 = v16 + 1;
                if (__OFADD__(v16, 1)) {
                  goto LABEL_39;
                }
                if (v11 >= v8) {
                  goto LABEL_32;
                }
                unint64_t v15 = v30[v11];
                ++v16;
                if (v15) {
                  goto LABEL_20;
                }
              }
            }
            int64_t v11 = v16;
          }
        }
      }
LABEL_20:
      unint64_t v7 = (v15 - 1) & v15;
    }
  }
  uint64_t result = swift_release();
  uint64_t *v1 = v4;
  return result;
}

uint64_t sub_1C9ED3DB8(uint64_t result, uint64_t a2, unint64_t a3, char a4)
{
  uint64_t v5 = v4;
  uint64_t v8 = result;
  unint64_t v9 = *(void *)(*v4 + 16);
  unint64_t v10 = *(void *)(*v4 + 24);
  if (v10 > v9 && (a4 & 1) != 0) {
    goto LABEL_22;
  }
  if (a4)
  {
    sub_1C9ED3ADC();
  }
  else
  {
    if (v10 > v9)
    {
      uint64_t result = (uint64_t)sub_1C9ED3F54();
      goto LABEL_22;
    }
    sub_1C9ED4108();
  }
  uint64_t v11 = *v4;
  sub_1C9F08408();
  sub_1C9F08028();
  uint64_t result = sub_1C9F08418();
  uint64_t v12 = -1 << *(unsigned char *)(v11 + 32);
  a3 = result & ~v12;
  uint64_t v13 = v11 + 56;
  if ((*(void *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3))
  {
    uint64_t v14 = *(void *)(v11 + 48);
    unint64_t v15 = (void *)(v14 + 16 * a3);
    BOOL v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (uint64_t result = sub_1C9F08388(), (result & 1) != 0))
    {
LABEL_21:
      uint64_t result = sub_1C9F083A8();
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
        uint64_t v18 = (void *)(v14 + 16 * a3);
        if (*v18 != v8 || v18[1] != a2)
        {
          uint64_t result = sub_1C9F08388();
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
  unint64_t v21 = (uint64_t *)(*(void *)(v20 + 48) + 16 * a3);
  *unint64_t v21 = v8;
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

void *sub_1C9ED3F54()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBC7F848);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_1C9F08288();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    uint64_t result = (void *)swift_release();
    uint64_t *v1 = v4;
    return result;
  }
  uint64_t result = (void *)(v3 + 56);
  uint64_t v6 = v2 + 56;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 56), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = *(void *)(v2 + 56);
  uint64_t v12 = -1;
  if (v10 < 64) {
    uint64_t v12 = ~(-1 << v10);
  }
  unint64_t v13 = v12 & v11;
  int64_t v14 = (unint64_t)(v10 + 63) >> 6;
  if ((v12 & v11) == 0) {
    goto LABEL_12;
  }
LABEL_11:
  unint64_t v15 = __clz(__rbit64(v13));
  v13 &= v13 - 1;
  for (unint64_t i = v15 | (v9 << 6); ; unint64_t i = __clz(__rbit64(v18)) + (v9 << 6))
  {
    uint64_t v20 = (void *)(*(void *)(v2 + 48) + 16 * i);
    uint64_t v21 = v20[1];
    uint64_t v22 = (void *)(*(void *)(v4 + 48) + 16 * i);
    void *v22 = *v20;
    v22[1] = v21;
    uint64_t result = (void *)swift_bridgeObjectRetain();
    if (v13) {
      goto LABEL_11;
    }
LABEL_12:
    int64_t v17 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v17 >= v14) {
      goto LABEL_28;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    ++v9;
    if (!v18)
    {
      int64_t v9 = v17 + 1;
      if (v17 + 1 >= v14) {
        goto LABEL_28;
      }
      unint64_t v18 = *(void *)(v6 + 8 * v9);
      if (!v18)
      {
        int64_t v9 = v17 + 2;
        if (v17 + 2 >= v14) {
          goto LABEL_28;
        }
        unint64_t v18 = *(void *)(v6 + 8 * v9);
        if (!v18) {
          break;
        }
      }
    }
LABEL_25:
    unint64_t v13 = (v18 - 1) & v18;
  }
  int64_t v19 = v17 + 3;
  if (v19 >= v14) {
    goto LABEL_28;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v19);
  if (v18)
  {
    int64_t v9 = v19;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v19 + 1;
    if (__OFADD__(v19, 1)) {
      break;
    }
    if (v9 >= v14) {
      goto LABEL_28;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v9);
    ++v19;
    if (v18) {
      goto LABEL_25;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_1C9ED4108()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBC7F848);
  uint64_t v3 = sub_1C9F08298();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_34:
    uint64_t *v1 = v4;
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
  if (!v8) {
    goto LABEL_7;
  }
LABEL_6:
  unint64_t v12 = __clz(__rbit64(v8));
  v8 &= v8 - 1;
  for (unint64_t i = v12 | (v11 << 6); ; unint64_t i = __clz(__rbit64(v15)) + (v11 << 6))
  {
    int64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + 16 * i);
    uint64_t v18 = *v17;
    uint64_t v19 = v17[1];
    sub_1C9F08408();
    swift_bridgeObjectRetain();
    sub_1C9F08028();
    uint64_t result = sub_1C9F08418();
    uint64_t v20 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v21 = result & ~v20;
    unint64_t v22 = v21 >> 6;
    if (((-1 << v21) & ~*(void *)(v9 + 8 * (v21 >> 6))) == 0)
    {
      char v24 = 0;
      unint64_t v25 = (unint64_t)(63 - v20) >> 6;
      while (++v22 != v25 || (v24 & 1) == 0)
      {
        BOOL v26 = v22 == v25;
        if (v22 == v25) {
          unint64_t v22 = 0;
        }
        v24 |= v26;
        uint64_t v27 = *(void *)(v9 + 8 * v22);
        if (v27 != -1)
        {
          unint64_t v23 = __clz(__rbit64(~v27)) + (v22 << 6);
          goto LABEL_30;
        }
      }
      __break(1u);
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    unint64_t v23 = __clz(__rbit64((-1 << v21) & ~*(void *)(v9 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
LABEL_30:
    *(void *)(v9 + ((v23 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v23;
    uint64_t v28 = (void *)(*(void *)(v4 + 48) + 16 * v23);
    *uint64_t v28 = v18;
    v28[1] = v19;
    ++*(void *)(v4 + 16);
    if (v8) {
      goto LABEL_6;
    }
LABEL_7:
    int64_t v14 = v11 + 1;
    if (__OFADD__(v11, 1)) {
      goto LABEL_36;
    }
    if (v14 >= v29) {
      goto LABEL_32;
    }
    unint64_t v15 = *(void *)(v6 + 8 * v14);
    ++v11;
    if (!v15)
    {
      int64_t v11 = v14 + 1;
      if (v14 + 1 >= v29) {
        goto LABEL_32;
      }
      unint64_t v15 = *(void *)(v6 + 8 * v11);
      if (!v15)
      {
        int64_t v11 = v14 + 2;
        if (v14 + 2 >= v29) {
          goto LABEL_32;
        }
        unint64_t v15 = *(void *)(v6 + 8 * v11);
        if (!v15) {
          break;
        }
      }
    }
LABEL_20:
    unint64_t v8 = (v15 - 1) & v15;
  }
  int64_t v16 = v14 + 3;
  if (v16 >= v29)
  {
LABEL_32:
    uint64_t result = swift_release_n();
    uint64_t v1 = v0;
    goto LABEL_34;
  }
  unint64_t v15 = *(void *)(v6 + 8 * v16);
  if (v15)
  {
    int64_t v11 = v16;
    goto LABEL_20;
  }
  while (1)
  {
    int64_t v11 = v16 + 1;
    if (__OFADD__(v16, 1)) {
      break;
    }
    if (v11 >= v29) {
      goto LABEL_32;
    }
    unint64_t v15 = *(void *)(v6 + 8 * v11);
    ++v16;
    if (v15) {
      goto LABEL_20;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_1C9ED43B4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC7F860);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1C9ED441C(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC7F860);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1C9ED447C()
{
  uint64_t v1 = *(void *)(sub_1C9F07E58() - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = v2 | 7;
  unint64_t v4 = (((*(void *)(v1 + 64) + ((v2 + 16) & ~v2) + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8;
  OUTLINED_FUNCTION_1_0();
  v5();
  swift_unknownObjectRelease();

  return MEMORY[0x1F4186498](v0, v4 + 8, v3);
}

uint64_t sub_1C9ED4534()
{
  uint64_t v1 = sub_1C9F07E58();
  OUTLINED_FUNCTION_6_0(v1);
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  unint64_t v6 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  unint64_t v7 = (*(void *)(v5 + 64) + v6 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v8 = *(void *)(v0 + v7);
  uint64_t v9 = *(void *)(v0 + v7 + 8);
  uint64_t v10 = *(void **)(v0 + ((v7 + 23) & 0xFFFFFFFFFFFFFFF8));
  return sub_1C9ECFCC8(v0 + v6, v8, v9, v10);
}

uint64_t block_copy_helper_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_0()
{
  return swift_release();
}

uint64_t sub_1C9ED45C4(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_1C9ED460C()
{
  uint64_t v1 = sub_1C9F07E58();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(void (**)(uint64_t, uint64_t))(v2 + 8);
  uint64_t v4 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v5 = (v4 + 16) & ~v4;
  uint64_t v6 = *(void *)(v2 + 64);
  uint64_t v7 = v4 | 7;
  uint64_t v8 = (v6 + v4 + v5) & ~v4;
  unint64_t v9 = (((v6 + v8 + 7) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8;
  v3(v0 + v5, v1);
  v3(v0 + v8, v1);
  swift_release();

  return MEMORY[0x1F4186498](v0, v9 + 8, v7);
}

uint64_t sub_1C9ED46FC()
{
  uint64_t v1 = sub_1C9F07E58();
  OUTLINED_FUNCTION_6_0(v1);
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  uint64_t v6 = *(unsigned __int8 *)(v3 + 80);
  uint64_t v7 = (v6 + 16) & ~v6;
  uint64_t v8 = *(void *)(v5 + 64);
  uint64_t v9 = (v8 + v6 + v7) & ~v6;
  unint64_t v10 = (v8 + v9 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v11 = *(void *)(v0 + v10);
  unint64_t v12 = *(void **)(v0 + ((v10 + 15) & 0xFFFFFFFFFFFFFFF8));
  return sub_1C9ED1D74(v0 + v7, v0 + v9, v11, v12);
}

uint64_t OUTLINED_FUNCTION_4_0()
{
  return sub_1C9F01420(v0, v1, (uint64_t *)(v2 - 152));
}

uint64_t OUTLINED_FUNCTION_5_0()
{
  return sub_1C9F08378();
}

uint64_t OUTLINED_FUNCTION_6_0(uint64_t a1)
{
  return a1 - 8;
}

uint64_t OUTLINED_FUNCTION_7_0(uint64_t a1)
{
  *(void *)(v1 - 96) = a1;
  return sub_1C9F08228();
}

uint64_t OUTLINED_FUNCTION_8_0(uint64_t a1)
{
  *(void *)(v1 - 96) = a1;
  return sub_1C9F08228();
}

uint64_t OUTLINED_FUNCTION_9_0(uint64_t a1)
{
  *(void *)(v1 - 96) = a1;
  *(void *)(v1 - 336) = v1 - 88;
  return sub_1C9F08228();
}

uint64_t OUTLINED_FUNCTION_10_0(uint64_t a1)
{
  *(void *)(v1 - 96) = a1;
  return sub_1C9F08228();
}

uint64_t OUTLINED_FUNCTION_11_0()
{
  *(_WORD *)(v0 + 12) = 2080;
  return sub_1C9F07A18();
}

uint64_t OUTLINED_FUNCTION_13_0()
{
  return swift_slowAlloc();
}

void *OUTLINED_FUNCTION_14_0()
{
  int64_t v2 = *(void *)(v0 + 16) + 1;
  return sub_1C9EF86E4(0, v2, 1, v0);
}

uint64_t OUTLINED_FUNCTION_15_0()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_16_0(uint64_t a1)
{
  *(void *)(v1 - 96) = a1;
  return sub_1C9F08228();
}

uint64_t OUTLINED_FUNCTION_19_0()
{
  return swift_bridgeObjectRelease_n();
}

uint64_t OUTLINED_FUNCTION_20_0()
{
  return sub_1C9F07F88();
}

void sub_1C9ED4978()
{
  OUTLINED_FUNCTION_14_1();
  uint64_t v1 = v0;
  uint64_t v32 = v2;
  uint64_t v28 = v3;
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  sub_1C9F081A8();
  OUTLINED_FUNCTION_15();
  MEMORY[0x1F4188790](v8);
  OUTLINED_FUNCTION_2_0();
  sub_1C9F081C8();
  OUTLINED_FUNCTION_0_0();
  uint64_t v30 = v10;
  uint64_t v31 = v9;
  MEMORY[0x1F4188790](v9);
  OUTLINED_FUNCTION_2_0();
  uint64_t v29 = v11;
  uint64_t v12 = sub_1C9F07ED8();
  MEMORY[0x1F4188790](v12 - 8);
  OUTLINED_FUNCTION_2_0();
  unint64_t v13 = (uint64_t *)(v0 + OBJC_IVAR____TtC14SiriMessageBus19ConversationSession_sessionState);
  sub_1C9F07BD8();
  sub_1C9ED7D38(&qword_1EBC7FD20, 255, MEMORY[0x1E4FA2670]);
  uint64_t v14 = MEMORY[0x1E4FBC860];
  uint64_t v15 = OUTLINED_FUNCTION_18_0();
  uint64_t v16 = OUTLINED_FUNCTION_18_0();
  *unint64_t v13 = v15;
  v13[1] = v16;
  uint64_t v17 = OBJC_IVAR____TtC14SiriMessageBus19ConversationSession_snapshots;
  *(void *)(v1 + v17) = sub_1C9F07F88();
  *(void *)(v1 + OBJC_IVAR____TtC14SiriMessageBus19ConversationSession_snapshotRequestIds) = v14;
  uint64_t v18 = (void *)(v1 + OBJC_IVAR____TtC14SiriMessageBus19ConversationSession_assistantId);
  *uint64_t v18 = v7;
  v18[1] = v5;
  uint64_t v27 = sub_1C9F069B8();
  OUTLINED_FUNCTION_4_1();
  uint64_t v20 = v19;
  OUTLINED_FUNCTION_8_1();
  v21();
  uint64_t v22 = sub_1C9F07BF8();
  OUTLINED_FUNCTION_4_1();
  uint64_t v24 = v23;
  OUTLINED_FUNCTION_8_1();
  v25();
  sub_1C9ECF370(0, &qword_1EBC7F838);
  swift_bridgeObjectRetain();
  sub_1C9F082A8();
  swift_bridgeObjectRelease();
  sub_1C9F08038();
  swift_bridgeObjectRelease();
  sub_1C9F07EC8();
  (*(void (**)(uint64_t, void, uint64_t))(v30 + 104))(v29, *MEMORY[0x1E4FBCC68], v31);
  sub_1C9ED7D38(&qword_1EBC7F830, 255, MEMORY[0x1E4FBCC10]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBC7F810);
  sub_1C9ED7A40();
  sub_1C9F08278();
  uint64_t v26 = sub_1C9F081F8();
  (*(void (**)(uint64_t, uint64_t))(v24 + 8))(v32, v22);
  (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v28, v27);
  *(void *)(v1 + OBJC_IVAR____TtC14SiriMessageBus19ConversationSession_syncQueue) = v26;
  OUTLINED_FUNCTION_11_1();
}

uint64_t sub_1C9ED4D40(uint64_t a1)
{
  uint64_t v4 = sub_1C9F07BD8();
  OUTLINED_FUNCTION_0_0();
  uint64_t v6 = v5;
  MEMORY[0x1F4188790]();
  OUTLINED_FUNCTION_10_1();
  uint64_t v7 = *(NSObject **)(v1 + OBJC_IVAR____TtC14SiriMessageBus19ConversationSession_syncQueue);
  sub_1C9ED8418(a1, (uint64_t)v15);
  OUTLINED_FUNCTION_15_1();
  OUTLINED_FUNCTION_8_1();
  v8();
  unint64_t v9 = (*(unsigned __int8 *)(v6 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = v1;
  sub_1C9ED8590((uint64_t)v15, v10 + 24);
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v6 + 32))(v10 + v9, v2, v4);
  uint64_t v11 = OUTLINED_FUNCTION_7_1();
  *(void *)(v11 + 16) = sub_1C9ED87E0;
  *(void *)(v11 + 24) = v10;
  aBlock[4] = sub_1C9ED8B94;
  aBlock[5] = v11;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1C9EDF214;
  aBlock[3] = &block_descriptor_69;
  uint64_t v12 = _Block_copy(aBlock);
  swift_retain();
  swift_retain();
  swift_release();
  dispatch_sync(v7, v12);
  _Block_release(v12);
  LOBYTE(v7) = OUTLINED_FUNCTION_9_1();
  swift_release();
  uint64_t result = swift_release();
  if (v7) {
    __break(1u);
  }
  return result;
}

uint64_t sub_1C9ED4F2C()
{
  return swift_endAccess();
}

uint64_t sub_1C9ED4F98(uint64_t a1)
{
  uint64_t v3 = *(NSObject **)(v1 + OBJC_IVAR____TtC14SiriMessageBus19ConversationSession_syncQueue);
  uint64_t v4 = OUTLINED_FUNCTION_7_1();
  *(void *)(v4 + 16) = v1;
  *(void *)(v4 + 24) = a1;
  uint64_t v5 = OUTLINED_FUNCTION_7_1();
  *(void *)(v5 + 16) = sub_1C9ED8728;
  *(void *)(v5 + 24) = v4;
  v8[4] = sub_1C9ED8B94;
  v8[5] = v5;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 1107296256;
  v8[2] = sub_1C9EDF214;
  v8[3] = &block_descriptor_59;
  uint64_t v6 = _Block_copy(v8);
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_release();
  dispatch_sync(v3, v6);
  _Block_release(v6);
  LOBYTE(v3) = OUTLINED_FUNCTION_9_1();
  swift_release();
  uint64_t result = swift_release();
  if (v3) {
    __break(1u);
  }
  return result;
}

uint64_t sub_1C9ED50F0()
{
  return swift_endAccess();
}

uint64_t sub_1C9ED5148()
{
  return OUTLINED_FUNCTION_17_0();
}

uint64_t sub_1C9ED51B4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  uint64_t v5 = (uint64_t *)(a1 + OBJC_IVAR____TtC14SiriMessageBus19ConversationSession_sessionState);
  swift_beginAccess();
  uint64_t v7 = *v5;
  uint64_t v6 = v5[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1C9F04C8C(a2, v7, v6, a3);
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1C9ED5258()
{
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBC7F8D0);
  OUTLINED_FUNCTION_13_1();
  return v1;
}

uint64_t sub_1C9ED52C8@<X0>(void *a1@<X8>)
{
  swift_beginAccess();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1C9F04E04();
  uint64_t v3 = v2;
  swift_bridgeObjectRelease();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v3;
  return result;
}

void sub_1C9ED5370()
{
  OUTLINED_FUNCTION_14_1();
  v24[0] = v0;
  v24[1] = v1;
  v24[2] = v2;
  uint64_t v4 = v3;
  uint64_t v5 = sub_1C9F07C98();
  OUTLINED_FUNCTION_0_0();
  uint64_t v7 = v6;
  uint64_t v9 = *(void *)(v8 + 64);
  MEMORY[0x1F4188790]();
  uint64_t v10 = sub_1C9F07BD8();
  OUTLINED_FUNCTION_0_0();
  uint64_t v12 = v11;
  uint64_t v14 = *(void *)(v13 + 64);
  MEMORY[0x1F4188790]();
  uint64_t v15 = (char *)v24 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  dispatch_queue_t v25 = *(dispatch_queue_t *)(v0 + OBJC_IVAR____TtC14SiriMessageBus19ConversationSession_syncQueue);
  sub_1C9ED8418(v4, (uint64_t)v27);
  OUTLINED_FUNCTION_8_1();
  v16();
  uint64_t v17 = v5;
  OUTLINED_FUNCTION_8_1();
  v18();
  unint64_t v19 = (*(unsigned __int8 *)(v12 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
  unint64_t v20 = (v14 + *(unsigned __int8 *)(v7 + 80) + v19) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  uint64_t v21 = swift_allocObject();
  *(void *)(v21 + 16) = v24[0];
  sub_1C9ED8590((uint64_t)v27, v21 + 24);
  (*(void (**)(unint64_t, char *, uint64_t))(v12 + 32))(v21 + v19, v15, v10);
  (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))(v21 + v20, (char *)v24 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), v17);
  uint64_t v22 = OUTLINED_FUNCTION_7_1();
  *(void *)(v22 + 16) = sub_1C9ED85F8;
  *(void *)(v22 + 24) = v21;
  v26[4] = sub_1C9ED8B94;
  v26[5] = v22;
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 1107296256;
  void v26[2] = sub_1C9EDF214;
  v26[3] = &block_descriptor_49;
  uint64_t v23 = _Block_copy(v26);
  swift_retain();
  swift_retain();
  swift_release();
  dispatch_sync(v25, v23);
  _Block_release(v23);
  LOBYTE(v23) = OUTLINED_FUNCTION_9_1();
  swift_release();
  swift_release();
  if (v23) {
    __break(1u);
  }
  else {
    OUTLINED_FUNCTION_11_1();
  }
}

uint64_t sub_1C9ED5620()
{
  return swift_endAccess();
}

void sub_1C9ED5694()
{
  OUTLINED_FUNCTION_14_1();
  uint64_t v3 = v2;
  uint64_t v4 = sub_1C9F07C98();
  OUTLINED_FUNCTION_0_0();
  uint64_t v6 = v5;
  MEMORY[0x1F4188790]();
  OUTLINED_FUNCTION_10_1();
  uint64_t v7 = *(NSObject **)(v0 + OBJC_IVAR____TtC14SiriMessageBus19ConversationSession_syncQueue);
  OUTLINED_FUNCTION_15_1();
  OUTLINED_FUNCTION_8_1();
  v8();
  unint64_t v9 = (*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = v0;
  *(void *)(v10 + 24) = v3;
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v6 + 32))(v10 + v9, v1, v4);
  uint64_t v11 = OUTLINED_FUNCTION_7_1();
  *(void *)(v11 + 16) = sub_1C9ED83D0;
  *(void *)(v11 + 24) = v10;
  v13[4] = sub_1C9ED8B94;
  v13[5] = v11;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 1107296256;
  v13[2] = sub_1C9EDF214;
  v13[3] = &block_descriptor_39;
  uint64_t v12 = _Block_copy(v13);
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_release();
  dispatch_sync(v7, v12);
  _Block_release(v12);
  LOBYTE(v3) = OUTLINED_FUNCTION_9_1();
  swift_release();
  swift_release();
  if (v3) {
    __break(1u);
  }
  else {
    OUTLINED_FUNCTION_11_1();
  }
}

uint64_t sub_1C9ED5868()
{
  return swift_endAccess();
}

uint64_t sub_1C9ED58D4()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA5CEBD8);
  OUTLINED_FUNCTION_13_1();
  return v1;
}

uint64_t sub_1C9ED5940@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v5 = (uint64_t *)(a1 + OBJC_IVAR____TtC14SiriMessageBus19ConversationSession_sessionState);
  swift_beginAccess();
  uint64_t v6 = *v5;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v7 = sub_1C9F05FAC(a2, v6);
  swift_bridgeObjectRelease();
  uint64_t result = swift_bridgeObjectRelease();
  *a3 = v7;
  return result;
}

uint64_t sub_1C9ED59E0()
{
  return OUTLINED_FUNCTION_17_0();
}

uint64_t sub_1C9ED5A48@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  uint64_t v5 = a1 + OBJC_IVAR____TtC14SiriMessageBus19ConversationSession_sessionState;
  uint64_t result = swift_beginAccess();
  uint64_t v7 = *(void *)(v5 + 8);
  if (*(void *)(v7 + 16))
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_1C9F01BD4(a2);
    if (v9)
    {
      sub_1C9ED7CC0(*(void *)(v7 + 56) + 32 * v8, (uint64_t)a3);
    }
    else
    {
      *a3 = 0u;
      a3[1] = 0u;
    }
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  else
  {
    *a3 = 0u;
    a3[1] = 0u;
  }
  return result;
}

uint64_t sub_1C9ED5B10()
{
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBC7F8D0);
  OUTLINED_FUNCTION_13_1();
  return v1;
}

uint64_t sub_1C9ED5B7C@<X0>(void *a1@<X8>)
{
  swift_beginAccess();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1C9F0607C();
  uint64_t v3 = v2;
  swift_bridgeObjectRelease();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v3;
  return result;
}

uint64_t sub_1C9ED5C1C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = *(NSObject **)(v3 + OBJC_IVAR____TtC14SiriMessageBus19ConversationSession_syncQueue);
  uint64_t v7 = (void *)swift_allocObject();
  v7[2] = v3;
  v7[3] = a1;
  v7[4] = a2;
  uint64_t v8 = OUTLINED_FUNCTION_7_1();
  *(void *)(v8 + 16) = sub_1C9ED7DF8;
  *(void *)(v8 + 24) = v7;
  v11[4] = sub_1C9ED8B94;
  v11[5] = v8;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 1107296256;
  v11[2] = sub_1C9EDF214;
  v11[3] = &block_descriptor_29;
  char v9 = _Block_copy(v11);
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_release();
  dispatch_sync(v6, v9);
  _Block_release(v9);
  LOBYTE(v6) = OUTLINED_FUNCTION_9_1();
  swift_release();
  uint64_t result = swift_release();
  if (v6) {
    __break(1u);
  }
  return result;
}

uint64_t sub_1C9ED5D84(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v5 = a1;
  uint64_t v6 = (uint64_t *)(a1 + OBJC_IVAR____TtC14SiriMessageBus19ConversationSession_sessionState);
  swift_beginAccess();
  uint64_t v8 = *v6;
  uint64_t v7 = v6[1];
  char v9 = (uint64_t *)(v5 + OBJC_IVAR____TtC14SiriMessageBus19ConversationSession_snapshots);
  swift_beginAccess();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v10 = sub_1C9ED7E08(v8, v7, a2, a3);
  swift_endAccess();
  sub_1C9ED8284(v10);
  uint64_t v11 = &off_1EBC7F000;
  if (!v10) {
    goto LABEL_8;
  }
  if (qword_1EBC7F680 != -1) {
    goto LABEL_26;
  }
  while (1)
  {
    uint64_t v12 = sub_1C9F07E78();
    __swift_project_value_buffer(v12, (uint64_t)qword_1EBC7FEF0);
    swift_bridgeObjectRetain_n();
    uint64_t v13 = sub_1C9F07E68();
    os_log_type_t v14 = sub_1C9F08168();
    if (os_log_type_enabled(v13, v14))
    {
      uint64_t v15 = (uint8_t *)swift_slowAlloc();
      uint64_t v16 = swift_slowAlloc();
      v41[0] = v16;
      *(_DWORD *)uint64_t v15 = 136315138;
      swift_bridgeObjectRetain();
      sub_1C9F01420(a2, a3, v41);
      sub_1C9F08228();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_1C9EC7000, v13, v14, "Overwrote snapshot %s", v15, 0xCu);
      swift_arrayDestroy();
      uint64_t v17 = v16;
      uint64_t v11 = &off_1EBC7F000;
      MEMORY[0x1CB795290](v17, -1, -1);
      MEMORY[0x1CB795290](v15, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    uint64_t v18 = (uint64_t)v11[504] + v5;
    swift_beginAccess();
    swift_bridgeObjectRetain();
    uint64_t v19 = sub_1C9ED7EA4(v18, a2, a3);
    int64_t v20 = *(void *)(*(void *)v18 + 16);
    if (v20 < v19) {
      break;
    }
    sub_1C9ED8184(v19, v20);
    swift_endAccess();
LABEL_8:
    uint64_t v21 = (char *)v11[504] + v5;
    swift_beginAccess();
    swift_bridgeObjectRetain();
    sub_1C9EF85CC();
    uint64_t v22 = *(void **)(*(void *)v21 + 16);
    sub_1C9EF8674(v22);
    uint64_t v23 = *(void *)v21;
    *(void *)(v23 + 16) = (char *)v22 + 1;
    uint64_t v24 = v23 + 16 * (void)v22;
    uint64_t v39 = a2;
    *(void *)(v24 + 32) = a2;
    *(void *)(v24 + 40) = a3;
    uint64_t result = swift_endAccess();
    if (*(void *)(*(void *)v21 + 16) < 6uLL) {
      return result;
    }
    a2 = MEMORY[0x1E4FBB1A0];
    while (1)
    {
      if (qword_1EBC7F680 != -1) {
        swift_once();
      }
      uint64_t v26 = sub_1C9F07E78();
      __swift_project_value_buffer(v26, (uint64_t)qword_1EBC7FEF0);
      swift_bridgeObjectRetain_n();
      uint64_t v27 = sub_1C9F07E68();
      os_log_type_t v28 = sub_1C9F08158();
      if (os_log_type_enabled(v27, v28))
      {
        uint64_t v29 = swift_slowAlloc();
        uint64_t v30 = swift_slowAlloc();
        v41[0] = v30;
        *(_DWORD *)uint64_t v29 = 136315138;
        swift_bridgeObjectRetain();
        *(void *)(v29 + 4) = sub_1C9F01420(v39, a3, v41);
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_1C9EC7000, v27, v28, "Reached max count, removing snapshot %s", (uint8_t *)v29, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x1CB795290](v30, -1, -1);
        MEMORY[0x1CB795290](v29, -1, -1);
      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
      swift_beginAccess();
      uint64_t v31 = *(void **)v21;
      uint64_t v11 = *(uint64_t (***)())(*(void *)v21 + 16);
      if (!v11) {
        break;
      }
      uint64_t v32 = v31[4];
      uint64_t v33 = v31[5];
      swift_bridgeObjectRetain();
      char isUniquelyReferenced_nonNull_native = (void *)swift_isUniquelyReferenced_nonNull_native();
      if (!isUniquelyReferenced_nonNull_native || (unint64_t)v11 - 1 > v31[3] >> 1) {
        uint64_t v31 = sub_1C9EF8718(isUniquelyReferenced_nonNull_native, (int64_t)v11, 1, (uint64_t)v31);
      }
      swift_arrayDestroy();
      uint64_t v35 = v31[2];
      if (!v35) {
        goto LABEL_28;
      }
      memmove(v31 + 4, v31 + 6, 16 * v35 - 16);
      v31[2] = v35 - 1;
      *(void *)uint64_t v21 = v31;
      swift_endAccess();
      swift_beginAccess();
      swift_bridgeObjectRetain();
      unint64_t v36 = sub_1C9F01B5C(v32, v33);
      uint64_t v5 = v37;
      swift_bridgeObjectRelease();
      uint64_t v38 = 0;
      if (v5)
      {
        swift_isUniquelyReferenced_nonNull_native();
        uint64_t v40 = *v9;
        *char v9 = 0x8000000000000000;
        __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC7FE20);
        sub_1C9F082E8();
        uint64_t v5 = v40;
        swift_bridgeObjectRelease();
        uint64_t v38 = *(void *)(*(void *)(v40 + 56) + 16 * v36);
        sub_1C9F082F8();
        *char v9 = v40;
        swift_bridgeObjectRelease();
      }
      swift_endAccess();
      swift_bridgeObjectRelease();
      uint64_t result = sub_1C9ED8284(v38);
      if (*(void *)(*(void *)v21 + 16) <= 5uLL) {
        return result;
      }
    }
    __break(1u);
LABEL_26:
    swift_once();
  }
  __break(1u);
LABEL_28:
  uint64_t result = sub_1C9F08338();
  __break(1u);
  return result;
}

uint64_t sub_1C9ED63D8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = *(NSObject **)(v3 + OBJC_IVAR____TtC14SiriMessageBus19ConversationSession_syncQueue);
  uint64_t v7 = (void *)swift_allocObject();
  v7[2] = v3;
  v7[3] = a1;
  v7[4] = a2;
  uint64_t v8 = OUTLINED_FUNCTION_7_1();
  *(void *)(v8 + 16) = sub_1C9ED7D84;
  *(void *)(v8 + 24) = v7;
  v11[4] = sub_1C9ED7D94;
  v11[5] = v8;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 1107296256;
  v11[2] = sub_1C9EDF214;
  v11[3] = &block_descriptor_1;
  char v9 = _Block_copy(v11);
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_release();
  dispatch_sync(v6, v9);
  _Block_release(v9);
  LOBYTE(v6) = OUTLINED_FUNCTION_9_1();
  swift_release();
  uint64_t result = swift_release();
  if (v6) {
    __break(1u);
  }
  return result;
}

void sub_1C9ED6540(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v5 = a1;
  uint64_t v6 = (uint64_t *)(a1 + OBJC_IVAR____TtC14SiriMessageBus19ConversationSession_snapshots);
  swift_beginAccess();
  uint64_t v7 = *v6;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v8 = sub_1C9EFE764(a2, a3, v7);
  uint64_t v10 = v9;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v8)
  {
    if (qword_1EBC7F680 != -1) {
      swift_once();
    }
    uint64_t v29 = v10;
    uint64_t v11 = sub_1C9F07E78();
    __swift_project_value_buffer(v11, (uint64_t)qword_1EBC7FEF0);
    swift_bridgeObjectRetain_n();
    uint64_t v12 = sub_1C9F07E68();
    os_log_type_t v13 = sub_1C9F08158();
    if (os_log_type_enabled(v12, v13))
    {
      os_log_type_t v14 = (uint8_t *)swift_slowAlloc();
      uint64_t v28 = v5;
      uint64_t v15 = swift_slowAlloc();
      v30[0] = v15;
      *(_DWORD *)os_log_type_t v14 = 136315138;
      swift_bridgeObjectRetain();
      sub_1C9F01420(a2, a3, v30);
      sub_1C9F08228();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_1C9EC7000, v12, v13, "Restoring to snapshot %s", v14, 0xCu);
      swift_arrayDestroy();
      uint64_t v16 = v15;
      uint64_t v5 = v28;
      MEMORY[0x1CB795290](v16, -1, -1);
      MEMORY[0x1CB795290](v14, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    uint64_t v22 = (uint64_t *)(v5 + OBJC_IVAR____TtC14SiriMessageBus19ConversationSession_sessionState);
    swift_beginAccess();
    uint64_t *v22 = v8;
    v22[1] = v29;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v23 = sub_1C9F07E68();
    os_log_type_t v24 = sub_1C9F08158();
    if (os_log_type_enabled(v23, v24))
    {
      dispatch_queue_t v25 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)dispatch_queue_t v25 = 0;
      _os_log_impl(&dword_1C9EC7000, v23, v24, "Clearing all existing snapshots.", v25, 2u);
      MEMORY[0x1CB795290](v25, -1, -1);
    }

    uint64_t v26 = MEMORY[0x1E4FBC860];
    uint64_t *v6 = sub_1C9F07F88();
    swift_bridgeObjectRelease();
    uint64_t v27 = (void *)(v5 + OBJC_IVAR____TtC14SiriMessageBus19ConversationSession_snapshotRequestIds);
    swift_beginAccess();
    *uint64_t v27 = v26;
    swift_bridgeObjectRelease();
  }
  else
  {
    if (qword_1EBC7F680 != -1) {
      swift_once();
    }
    uint64_t v17 = sub_1C9F07E78();
    __swift_project_value_buffer(v17, (uint64_t)qword_1EBC7FEF0);
    swift_bridgeObjectRetain_n();
    uint64_t v18 = sub_1C9F07E68();
    os_log_type_t v19 = sub_1C9F08168();
    if (os_log_type_enabled(v18, v19))
    {
      int64_t v20 = (uint8_t *)swift_slowAlloc();
      uint64_t v21 = swift_slowAlloc();
      v30[0] = v21;
      *(_DWORD *)int64_t v20 = 136315138;
      swift_bridgeObjectRetain();
      sub_1C9F01420(a2, a3, v30);
      sub_1C9F08228();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_1C9EC7000, v18, v19, "Cannot restore. There is no snapshot %s", v20, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1CB795290](v21, -1, -1);
      MEMORY[0x1CB795290](v20, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
}

uint64_t sub_1C9ED69F0()
{
  return sub_1C9F081D8();
}

uint64_t sub_1C9ED6A64@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  if (qword_1EBC7F680 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_1C9F07E78();
  __swift_project_value_buffer(v4, (uint64_t)qword_1EBC7FEF0);
  uint64_t v5 = sub_1C9F07E68();
  os_log_type_t v6 = sub_1C9F08158();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl(&dword_1C9EC7000, v5, v6, "Creating an immutable snapshot of ConversationSession", v7, 2u);
    MEMORY[0x1CB795290](v7, -1, -1);
  }

  uint64_t v8 = (uint64_t *)(a1 + OBJC_IVAR____TtC14SiriMessageBus19ConversationSession_sessionState);
  swift_beginAccess();
  uint64_t v10 = *v8;
  uint64_t v9 = v8[1];
  uint64_t v11 = type metadata accessor for ImmutableConversationSession();
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = v10;
  *(void *)(v12 + 24) = v9;
  a2[3] = v11;
  a2[4] = sub_1C9ED7D38(&qword_1EBC7FC08, v13, (void (*)(uint64_t))type metadata accessor for ImmutableConversationSession);
  *a2 = v12;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

uint64_t sub_1C9ED6BEC()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC14SiriMessageBus19ConversationSession_sessionId;
  sub_1C9F069B8();
  OUTLINED_FUNCTION_15();
  (*(void (**)(uint64_t))(v2 + 8))(v1);
  swift_bridgeObjectRelease();
  uint64_t v3 = v0 + OBJC_IVAR____TtC14SiriMessageBus19ConversationSession_sessionType;
  sub_1C9F07BF8();
  OUTLINED_FUNCTION_15();
  (*(void (**)(uint64_t))(v4 + 8))(v3);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_1C9ED6CE4()
{
  sub_1C9ED6BEC();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return MEMORY[0x1F4186488](v0, v1, v2);
}

uint64_t sub_1C9ED6D3C()
{
  return type metadata accessor for ConversationSession();
}

uint64_t type metadata accessor for ConversationSession()
{
  uint64_t result = qword_1EBC7F9E0;
  if (!qword_1EBC7F9E0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1C9ED6D8C()
{
  uint64_t result = sub_1C9F069B8();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_1C9F07BF8();
    if (v2 <= 0x3F) {
      return swift_updateClassMetadata2();
    }
  }
  return result;
}

uint64_t sub_1C9ED6E7C@<X0>(uint64_t a1@<X8>)
{
  return sub_1C9ED6EFC(&OBJC_IVAR____TtC14SiriMessageBus19ConversationSession_sessionId, MEMORY[0x1E4F27990], a1);
}

uint64_t sub_1C9ED6E9C()
{
  uint64_t v1 = *(void *)(*v0 + OBJC_IVAR____TtC14SiriMessageBus19ConversationSession_assistantId);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_1C9ED6EDC@<X0>(uint64_t a1@<X8>)
{
  return sub_1C9ED6EFC(&OBJC_IVAR____TtC14SiriMessageBus19ConversationSession_sessionType, MEMORY[0x1E4FA26C0], a1);
}

uint64_t sub_1C9ED6EFC@<X0>(void *a1@<X2>, void (*a2)(void)@<X3>, uint64_t a3@<X8>)
{
  uint64_t v5 = *v3 + *a1;
  a2(0);
  OUTLINED_FUNCTION_15();
  uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 16);
  return v8(a3, v5, v6);
}

uint64_t sub_1C9ED6F6C()
{
  return sub_1C9ED5148();
}

uint64_t sub_1C9ED6F90()
{
  return sub_1C9ED5258();
}

void sub_1C9ED6FB4()
{
}

void sub_1C9ED6FD8()
{
}

uint64_t sub_1C9ED6FFC(uint64_t a1)
{
  return sub_1C9ED4D40(a1);
}

uint64_t sub_1C9ED7020(uint64_t a1)
{
  return sub_1C9ED4F98(a1);
}

uint64_t sub_1C9ED7044()
{
  return sub_1C9ED58D4();
}

uint64_t sub_1C9ED7068()
{
  return sub_1C9ED59E0();
}

uint64_t sub_1C9ED708C()
{
  return sub_1C9ED5B10();
}

uint64_t sub_1C9ED70B0(uint64_t a1, uint64_t a2)
{
  return sub_1C9ED5C1C(a1, a2);
}

uint64_t sub_1C9ED70D4(uint64_t a1, uint64_t a2)
{
  return sub_1C9ED63D8(a1, a2);
}

uint64_t sub_1C9ED70F8()
{
  return sub_1C9ED69F0();
}

double sub_1C9ED711C@<D0>(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  return sub_1C9F04C8C(a1, *(void *)(v2 + 16), *(void *)(v2 + 24), a2);
}

void sub_1C9ED7124()
{
}

uint64_t sub_1C9ED712C(uint64_t a1)
{
  return sub_1C9F05FAC(a1, *(void *)(v1 + 16));
}

double sub_1C9ED7134@<D0>(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v4 = *(void *)(v2 + 24);
  if (*(void *)(v4 + 16) && (sub_1C9F01BD4(a1), (v6 & 1) != 0))
  {
    uint64_t v7 = *(void *)(v4 + 56) + 32 * v5;
    sub_1C9ED7CC0(v7, (uint64_t)a2);
  }
  else
  {
    double result = 0.0;
    *a2 = 0u;
    a2[1] = 0u;
  }
  return result;
}

void sub_1C9ED7198()
{
}

uint64_t sub_1C9ED71A0(void *a1)
{
  uint64_t v3 = v2;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA5CEBC8);
  OUTLINED_FUNCTION_0_0();
  uint64_t v7 = v6;
  MEMORY[0x1F4188790](v8);
  uint64_t v10 = (char *)&v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = self;
  unint64_t v12 = *(void *)(v1 + 24);
  id v22 = *(id *)(v1 + 16);
  unint64_t v23 = v12;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v13 = sub_1C9F08398();
  id v22 = 0;
  id v14 = objc_msgSend(v11, sel_archivedDataWithRootObject_requiringSecureCoding_error_, v13, 1, &v22);
  swift_unknownObjectRelease();
  id v15 = v22;
  if (v14)
  {
    uint64_t v16 = (void *)sub_1C9F06918();
    uint64_t v21 = v3;
    unint64_t v18 = v17;

    __swift_project_boxed_opaque_existential_1(a1, a1[3]);
    sub_1C9ED7AD8();
    sub_1C9F08478();
    id v22 = v16;
    unint64_t v23 = v18;
    sub_1C9ED7C74();
    sub_1C9F08368();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v5);
    return sub_1C9ED7B70((uint64_t)v16, v18);
  }
  else
  {
    int64_t v20 = v15;
    sub_1C9F06908();

    return swift_willThrow();
  }
}

uint64_t sub_1C9ED73A8(void *a1)
{
  OUTLINED_FUNCTION_12_1();
  uint64_t v2 = swift_allocObject();
  sub_1C9ED73F0(a1);
  return v2;
}

uint64_t sub_1C9ED73F0(void *a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA5CEBA0);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x1F4188790](v4);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1C9ED7AD8();
  sub_1C9F08468();
  if (!v2)
  {
    sub_1C9ED7B24();
    sub_1C9F08358();
    uint64_t v8 = v14;
    unint64_t v7 = v15;
    sub_1C9ECF370(0, &qword_1EA5CEBB8);
    sub_1C9F08198();
    if (v16)
    {
      if (swift_dynamicCast())
      {
        sub_1C9ED7B70(v14, v15);
        uint64_t v10 = OUTLINED_FUNCTION_3_1();
        v11(v10);
        *(_OWORD *)(v1 + 16) = v13;
        goto LABEL_4;
      }
    }
    else
    {
      sub_1C9ED7BC8((uint64_t)&v14);
    }
    sub_1C9ED7C28();
    swift_allocError();
    *unint64_t v12 = 0xD000000000000023;
    v12[1] = 0x80000001C9F09E00;
    swift_willThrow();
    sub_1C9ED7B70(v8, v7);
    uint64_t v5 = OUTLINED_FUNCTION_3_1();
    v6(v5);
  }
  type metadata accessor for ImmutableConversationSession();
  swift_deallocPartialClassInstance();
LABEL_4:
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return v1;
}

BOOL sub_1C9ED7644()
{
  uint64_t v0 = sub_1C9F08348();
  swift_bridgeObjectRelease();
  return v0 != 0;
}

BOOL sub_1C9ED768C()
{
  return sub_1C9ED7644();
}

uint64_t sub_1C9ED76A8()
{
  return 1;
}

uint64_t sub_1C9ED76B0()
{
  return 0;
}

uint64_t sub_1C9ED76BC()
{
  return 0x536E6F6973736573;
}

BOOL sub_1C9ED76EC@<W0>(unsigned char *a1@<X8>)
{
  BOOL result = sub_1C9ED7644();
  *a1 = result;
  return result;
}

uint64_t sub_1C9ED7720@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1C9ED76BC();
  *a1 = result;
  a1[1] = v3;
  return result;
}

BOOL sub_1C9ED774C@<W0>(unsigned char *a1@<X8>)
{
  BOOL result = sub_1C9ED768C();
  *a1 = result;
  return result;
}

uint64_t sub_1C9ED7778()
{
  return sub_1C9ED76B0();
}

uint64_t sub_1C9ED7794@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_1C9ED76A8();
  *a1 = result & 1;
  return result;
}

uint64_t sub_1C9ED77C0(uint64_t a1)
{
  unint64_t v2 = sub_1C9ED7AD8();
  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1C9ED77FC(uint64_t a1)
{
  unint64_t v2 = sub_1C9ED7AD8();
  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t sub_1C9ED7848()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v0 = OUTLINED_FUNCTION_12_1();
  return MEMORY[0x1F4186488](v0, v1, v2);
}

uint64_t type metadata accessor for ImmutableConversationSession()
{
  return self;
}

double sub_1C9ED78AC@<D0>(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  return sub_1C9ED711C(a1, a2);
}

void sub_1C9ED78D0()
{
}

uint64_t sub_1C9ED78F4(uint64_t a1)
{
  return sub_1C9ED712C(a1);
}

double sub_1C9ED7918@<D0>(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  return sub_1C9ED7134(a1, a2);
}

void sub_1C9ED793C()
{
}

uint64_t sub_1C9ED7960@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = sub_1C9ED73A8(a1);
  if (!v2) {
    *a2 = result;
  }
  return result;
}

uint64_t sub_1C9ED798C(void *a1)
{
  return sub_1C9ED71A0(a1);
}

uint64_t sub_1C9ED79B0(uint64_t a1, uint64_t a2)
{
  return sub_1C9ED7D38(qword_1EBC7FC18, a2, (void (*)(uint64_t))type metadata accessor for ImmutableConversationSession);
}

uint64_t sub_1C9ED79F8(uint64_t a1, uint64_t a2)
{
  return sub_1C9ED7D38(&qword_1EBC7FC10, a2, (void (*)(uint64_t))type metadata accessor for ImmutableConversationSession);
}

unint64_t sub_1C9ED7A40()
{
  unint64_t result = qword_1EBC7F820;
  if (!qword_1EBC7F820)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract((uint64_t *)&unk_1EBC7F810);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBC7F820);
  }
  return result;
}

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_1C9ED7AD8()
{
  unint64_t result = qword_1EA5CEBA8;
  if (!qword_1EA5CEBA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA5CEBA8);
  }
  return result;
}

unint64_t sub_1C9ED7B24()
{
  unint64_t result = qword_1EA5CEBB0;
  if (!qword_1EA5CEBB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA5CEBB0);
  }
  return result;
}

uint64_t sub_1C9ED7B70(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    swift_release();
  }
  return swift_release();
}

uint64_t sub_1C9ED7BC8(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC7F868);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_1C9ED7C28()
{
  unint64_t result = qword_1EA5CEBC0;
  if (!qword_1EA5CEBC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA5CEBC0);
  }
  return result;
}

unint64_t sub_1C9ED7C74()
{
  unint64_t result = qword_1EA5CEBD0;
  if (!qword_1EA5CEBD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA5CEBD0);
  }
  return result;
}

uint64_t sub_1C9ED7CC0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_1C9ED7D1C@<X0>(uint64_t *a1@<X8>)
{
  return sub_1C9ED6A64(v1, a1);
}

uint64_t sub_1C9ED7D38(unint64_t *a1, uint64_t a2, void (*a3)(uint64_t))
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

void sub_1C9ED7D84()
{
  sub_1C9ED6540(*(void *)(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32));
}

uint64_t sub_1C9ED7D94()
{
  return sub_1C9EDF1EC(*(uint64_t (**)(void))(v0 + 16));
}

uint64_t block_copy_helper_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_1()
{
  return swift_release();
}

uint64_t objectdestroyTm()
{
  swift_release();
  swift_bridgeObjectRelease();
  return MEMORY[0x1F4186498](v0, 40, 7);
}

uint64_t sub_1C9ED7DF8()
{
  return sub_1C9ED5D84(*(void *)(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32));
}

uint64_t sub_1C9ED7E08(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = v4;
  swift_isUniquelyReferenced_nonNull_native();
  uint64_t v12 = *v4;
  *uint64_t v4 = 0x8000000000000000;
  uint64_t v10 = sub_1C9ED8064(a1, a2, a3, a4);
  *uint64_t v5 = v12;
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_1C9ED7EA4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void **)a1;
  uint64_t v5 = *(void *)(*(void *)a1 + 16);
  if (!v5)
  {
    unint64_t v8 = 0;
    goto LABEL_28;
  }
  uint64_t v7 = 0;
  unint64_t v8 = 0;
  while (1)
  {
    uint64_t result = v4[v7 + 4];
    if (result == a2 && v4[v7 + 5] == a3) {
      break;
    }
    uint64_t result = sub_1C9F08388();
    if (result) {
      break;
    }
    ++v8;
    v7 += 2;
    if (v5 == v8)
    {
      unint64_t v8 = v4[2];
      goto LABEL_28;
    }
  }
  unint64_t v11 = v8 + 1;
  if (__OFADD__(v8, 1)) {
    goto LABEL_33;
  }
  unint64_t v12 = v4[2];
  if (v11 == v12)
  {
LABEL_28:
    swift_bridgeObjectRelease();
    return v8;
  }
  while (v11 < v12)
  {
    long long v13 = &v4[v7];
    uint64_t result = v4[v7 + 6];
    if (result != a2 || v4[v7 + 7] != a3)
    {
      uint64_t result = sub_1C9F08388();
      if ((result & 1) == 0)
      {
        if (v11 != v8)
        {
          if (v8 >= v12) {
            goto LABEL_31;
          }
          unint64_t v15 = &v4[2 * v8 + 4];
          uint64_t v16 = v15[1];
          uint64_t v22 = *v15;
          uint64_t v17 = v13[6];
          uint64_t v18 = v13[7];
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            uint64_t v4 = sub_1C9ED82C4((uint64_t)v4);
          }
          os_log_type_t v19 = &v4[2 * v8];
          v19[4] = v17;
          v19[5] = v18;
          uint64_t result = swift_bridgeObjectRelease();
          if (v11 >= v4[2]) {
            goto LABEL_32;
          }
          int64_t v20 = &v4[v7];
          v20[6] = v22;
          v20[7] = v16;
          uint64_t result = swift_bridgeObjectRelease();
          *(void *)a1 = v4;
        }
        if (__OFADD__(v8++, 1)) {
          goto LABEL_30;
        }
      }
    }
    ++v11;
    unint64_t v12 = v4[2];
    v7 += 2;
    if (v11 == v12) {
      goto LABEL_28;
    }
  }
  __break(1u);
LABEL_30:
  __break(1u);
LABEL_31:
  __break(1u);
LABEL_32:
  __break(1u);
LABEL_33:
  __break(1u);
  return result;
}

uint64_t sub_1C9ED8064(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = *v4;
  unint64_t v11 = sub_1C9F01B5C(a3, a4);
  if (__OFADD__(*(void *)(v10 + 16), (v12 & 1) == 0))
  {
    __break(1u);
    goto LABEL_9;
  }
  unint64_t v13 = v11;
  char v14 = v12;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC7FE20);
  if ((sub_1C9F082E8() & 1) == 0) {
    goto LABEL_5;
  }
  unint64_t v15 = sub_1C9F01B5C(a3, a4);
  if ((v14 & 1) != (v16 & 1))
  {
LABEL_9:
    uint64_t result = sub_1C9F083B8();
    __break(1u);
    return result;
  }
  unint64_t v13 = v15;
LABEL_5:
  uint64_t v17 = *v5;
  if (v14)
  {
    uint64_t v18 = (uint64_t *)(*(void *)(v17 + 56) + 16 * v13);
    uint64_t result = *v18;
    *uint64_t v18 = a1;
    v18[1] = a2;
  }
  else
  {
    sub_1C9F030F8(v13, a3, a4, a1, a2, v17);
    swift_bridgeObjectRetain();
    return 0;
  }
  return result;
}

uint64_t sub_1C9ED8184(uint64_t result, int64_t a2)
{
  if (result < 0)
  {
    __break(1u);
    goto LABEL_18;
  }
  uint64_t v4 = *(void **)v2;
  int64_t v5 = *(void *)(*(void *)v2 + 16);
  if (v5 < a2)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  uint64_t v6 = result;
  int64_t v7 = a2 - result;
  if (__OFSUB__(a2, result))
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  uint64_t v8 = result - a2;
  if (__OFSUB__(0, v7))
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  int64_t v9 = v5 - v7;
  if (__OFADD__(v5, v8))
  {
LABEL_21:
    __break(1u);
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  char isUniquelyReferenced_nonNull_native = (void *)swift_isUniquelyReferenced_nonNull_native();
  if (!isUniquelyReferenced_nonNull_native || v9 > v4[3] >> 1)
  {
    if (v5 <= v9) {
      int64_t v11 = v5 + v8;
    }
    else {
      int64_t v11 = v5;
    }
    uint64_t v4 = sub_1C9EF8718(isUniquelyReferenced_nonNull_native, v11, 1, (uint64_t)v4);
  }
  char v12 = (char *)&v4[2 * v6 + 4];
  uint64_t result = swift_arrayDestroy();
  if (!v7) {
    goto LABEL_16;
  }
  uint64_t v13 = v4[2];
  if (__OFSUB__(v13, a2)) {
    goto LABEL_22;
  }
  uint64_t result = (uint64_t)sub_1C9EF8F94((char *)&v4[2 * a2 + 4], v13 - a2, v12);
  uint64_t v14 = v4[2];
  BOOL v15 = __OFADD__(v14, v8);
  uint64_t v16 = v14 - v7;
  if (!v15)
  {
    v4[2] = v16;
LABEL_16:
    *(void *)uint64_t v2 = v4;
    return result;
  }
LABEL_23:
  __break(1u);
  return result;
}

uint64_t sub_1C9ED8284(uint64_t result)
{
  if (result)
  {
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

void *sub_1C9ED82C4(uint64_t a1)
{
  return sub_1C9EF8718(0, *(void *)(a1 + 16), 0, a1);
}

uint64_t sub_1C9ED82D8@<X0>(void *a1@<X8>)
{
  return sub_1C9ED5B7C(a1);
}

uint64_t sub_1C9ED82F4@<X0>(_OWORD *a1@<X8>)
{
  return sub_1C9ED5A48(*(void *)(v1 + 16), *(void *)(v1 + 24), a1);
}

uint64_t sub_1C9ED8310@<X0>(uint64_t *a1@<X8>)
{
  return sub_1C9ED5940(*(void *)(v1 + 16), *(void *)(v1 + 24), a1);
}

uint64_t sub_1C9ED832C()
{
  sub_1C9F07C98();
  OUTLINED_FUNCTION_0_0();
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  uint64_t v5 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v6 = ((v5 + 32) & ~v5) + *(void *)(v4 + 64);
  uint64_t v7 = v5 | 7;
  swift_release();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_16_1();
  v8();
  return MEMORY[0x1F4186498](v0, v6, v7);
}

uint64_t sub_1C9ED83D0()
{
  uint64_t v0 = sub_1C9F07C98();
  OUTLINED_FUNCTION_2_1(v0);
  return sub_1C9ED5868();
}

uint64_t sub_1C9ED8418(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC7F868);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1C9ED8480()
{
  OUTLINED_FUNCTION_14_1();
  uint64_t v1 = sub_1C9F07BD8();
  OUTLINED_FUNCTION_0_0();
  uint64_t v3 = v2;
  uint64_t v4 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v6 = *(void *)(v5 + 64);
  uint64_t v7 = sub_1C9F07C98();
  OUTLINED_FUNCTION_0_0();
  uint64_t v9 = v8;
  uint64_t v10 = *(unsigned __int8 *)(v8 + 80);
  swift_release();
  if (*(void *)(v0 + 48)) {
    __swift_destroy_boxed_opaque_existential_1(v0 + 24);
  }
  uint64_t v11 = (v4 + 56) & ~v4;
  uint64_t v12 = (v11 + v6 + v10) & ~v10;
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v0 + v11, v1);
  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v0 + v12, v7);
  OUTLINED_FUNCTION_11_1();
  return MEMORY[0x1F4186498](v13, v14, v15);
}

uint64_t sub_1C9ED8590(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC7F868);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1C9ED85F8()
{
  sub_1C9F07BD8();
  uint64_t v0 = sub_1C9F07C98();
  OUTLINED_FUNCTION_2_1(v0);
  return sub_1C9ED5620();
}

uint64_t sub_1C9ED86B0@<X0>(void *a1@<X8>)
{
  return sub_1C9ED52C8(a1);
}

uint64_t sub_1C9ED86D0@<X0>(_OWORD *a1@<X8>)
{
  return sub_1C9ED51B4(*(void *)(v1 + 16), *(void *)(v1 + 24), a1);
}

uint64_t sub_1C9ED86F0()
{
  swift_release();
  swift_bridgeObjectRelease();
  uint64_t v0 = OUTLINED_FUNCTION_12_1();
  return MEMORY[0x1F4186498](v0, v1, v2);
}

uint64_t sub_1C9ED8728()
{
  return sub_1C9ED50F0();
}

uint64_t sub_1C9ED8734()
{
  sub_1C9F07BD8();
  OUTLINED_FUNCTION_0_0();
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v4 = *(void *)(v3 + 64);
  swift_release();
  if (*(void *)(v0 + 48)) {
    __swift_destroy_boxed_opaque_existential_1(v0 + 24);
  }
  OUTLINED_FUNCTION_16_1();
  v5();
  return MEMORY[0x1F4186498](v0, ((v2 + 56) & ~v2) + v4, v2 | 7);
}

uint64_t sub_1C9ED87E0()
{
  uint64_t v0 = sub_1C9F07BD8();
  OUTLINED_FUNCTION_2_1(v0);
  return sub_1C9ED4F2C();
}

void *initializeBufferWithCopyOfBuffer for ImmutableConversationSession.SessionStateDecodingError(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for ImmutableConversationSession.SessionStateDecodingError()
{
  return swift_bridgeObjectRelease();
}

void *assignWithCopy for ImmutableConversationSession.SessionStateDecodingError(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

void *assignWithTake for ImmutableConversationSession.SessionStateDecodingError(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for ImmutableConversationSession.SessionStateDecodingError(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 16))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      unint64_t v2 = *(void *)(a1 + 8);
      if (v2 >= 0xFFFFFFFF) {
        LODWORD(v2) = -1;
      }
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ImmutableConversationSession.SessionStateDecodingError(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)__n128 result = a2 ^ 0x80000000;
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
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 16) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

uint64_t sub_1C9ED8964()
{
  return 0;
}

ValueMetadata *type metadata accessor for ImmutableConversationSession.SessionStateDecodingError()
{
  return &type metadata for ImmutableConversationSession.SessionStateDecodingError;
}

uint64_t getEnumTagSinglePayload for ImmutableConversationSession.CodingKeys(unsigned int *a1, int a2)
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

unsigned char *storeEnumTagSinglePayload for ImmutableConversationSession.CodingKeys(unsigned char *result, int a2, int a3)
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
        *__n128 result = a2;
        return result;
      case 2:
        *(_WORD *)__n128 result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)__n128 result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *__n128 result = 0;
      break;
    case 2:
      *(_WORD *)__n128 result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x1C9ED8A6CLL);
    case 4:
      *(_DWORD *)__n128 result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for ImmutableConversationSession.CodingKeys()
{
  return &type metadata for ImmutableConversationSession.CodingKeys;
}

unint64_t sub_1C9ED8AA8()
{
  unint64_t result = qword_1EA5CEBE0;
  if (!qword_1EA5CEBE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA5CEBE0);
  }
  return result;
}

unint64_t sub_1C9ED8AF8()
{
  unint64_t result = qword_1EA5CEBE8;
  if (!qword_1EA5CEBE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA5CEBE8);
  }
  return result;
}

unint64_t sub_1C9ED8B48()
{
  unint64_t result = qword_1EA5CEBF0;
  if (!qword_1EA5CEBF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA5CEBF0);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_1_1()
{
  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t OUTLINED_FUNCTION_2_1(uint64_t a1)
{
  return a1 - 8;
}

uint64_t OUTLINED_FUNCTION_3_1()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_7_1()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_9_1()
{
  return swift_isEscapingClosureAtFileLocation();
}

uint64_t OUTLINED_FUNCTION_12_1()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_13_1()
{
  return sub_1C9F081D8();
}

uint64_t OUTLINED_FUNCTION_15_1()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_17_0()
{
  return sub_1C9F081D8();
}

uint64_t OUTLINED_FUNCTION_18_0()
{
  return sub_1C9F07F88();
}

ValueMetadata *type metadata accessor for Logger()
{
  return &type metadata for Logger;
}

void sub_1C9ED8D54()
{
  qword_1EBC7FF68 = 0x426567617373654DLL;
  unk_1EBC7FF70 = 0xEA00000000007375;
}

void sub_1C9ED8D7C()
{
  qword_1EBC7FF78 = 0x737465737341;
  unk_1EBC7FF80 = 0xE600000000000000;
}

uint64_t sub_1C9ED8D9C()
{
  sub_1C9ED905C();
  if (qword_1EBC7F940 != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  uint64_t result = sub_1C9F08208();
  qword_1EBC7FF08 = result;
  return result;
}

uint64_t *sub_1C9ED8E3C()
{
  if (qword_1EBC7F690 != -1) {
    swift_once();
  }
  return &qword_1EBC7FF08;
}

uint64_t sub_1C9ED8E88()
{
  sub_1C9ED905C();
  if (qword_1EBC7F8B8 != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  uint64_t result = sub_1C9F08208();
  qword_1EBC7FF28 = result;
  return result;
}

uint64_t sub_1C9ED8F28(uint64_t a1)
{
  return sub_1C9ED8F80(a1, qword_1EBC7FEF0, &qword_1EBC7F690, (id *)&qword_1EBC7FF08);
}

uint64_t sub_1C9ED8F54(uint64_t a1)
{
  return sub_1C9ED8F80(a1, qword_1EBC7FFF8, qword_1EBC7FCD8, (id *)&qword_1EBC7FF28);
}

uint64_t sub_1C9ED8F80(uint64_t a1, uint64_t *a2, void *a3, id *a4)
{
  uint64_t v7 = sub_1C9F07E78();
  __swift_allocate_value_buffer(v7, a2);
  __swift_project_value_buffer(v7, (uint64_t)a2);
  if (*a3 != -1) {
    swift_once();
  }
  id v8 = *a4;
  return sub_1C9F07E88();
}

id sub_1C9ED900C()
{
  sub_1C9ED8E3C();
  uint64_t v0 = (void *)qword_1EBC7FF08;
  return v0;
}

uint64_t sub_1C9ED9040()
{
  return sub_1C9F07CF8();
}

unint64_t sub_1C9ED905C()
{
  unint64_t result = qword_1EBC7F840;
  if (!qword_1EBC7F840)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EBC7F840);
  }
  return result;
}

uint64_t *__swift_allocate_value_buffer(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_1C9ED9100()
{
  type metadata accessor for MessageBusInstrumentationUtil();
  swift_allocObject();
  uint64_t result = sub_1C9ED913C();
  qword_1EBC7FED8 = result;
  return result;
}

uint64_t sub_1C9ED913C()
{
  *(void *)(v0 + 16) = objc_msgSend(self, sel_sharedStream);
  sub_1C9F07DD8();
  swift_allocObject();
  *(void *)(v0 + 24) = sub_1C9F07DC8();
  return v0;
}

void sub_1C9ED91A4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, char a6, int a7, int a8, char a9)
{
  uint64_t v76 = a3;
  int v78 = a7;
  LODWORD(v79) = a8;
  uint64_t v77 = a2;
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC7F020);
  uint64_t v14 = MEMORY[0x1F4188790](v13 - 8);
  uint64_t v16 = (char *)&v72 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v14);
  uint64_t v18 = (char *)&v72 - v17;
  uint64_t v19 = sub_1C9F069B8();
  uint64_t v20 = *(void *)(v19 - 8);
  uint64_t v21 = MEMORY[0x1F4188790](v19);
  unint64_t v23 = (char *)&v72 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v21);
  dispatch_queue_t v25 = (char *)&v72 - v24;
  sub_1C9ECEEF8(a1, (uint64_t)v18);
  if (__swift_getEnumTagSinglePayload((uint64_t)v18, 1, v19) == 1)
  {
    sub_1C9EDAF2C((uint64_t)v18);
    if (qword_1EBC7F680 != -1) {
      swift_once();
    }
    uint64_t v26 = sub_1C9F07E78();
    uint64_t v27 = OUTLINED_FUNCTION_2_2(v26, (uint64_t)qword_1EBC7FEF0);
    os_log_type_t v28 = sub_1C9F08168();
    if (os_log_type_enabled(v27, v28))
    {
      uint64_t v29 = (_WORD *)OUTLINED_FUNCTION_1_2();
      OUTLINED_FUNCTION_4_2(v29);
      OUTLINED_FUNCTION_5_1(&dword_1C9EC7000, v27, v28, "Starting a request without a sessinId");
      OUTLINED_FUNCTION_1();
    }
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v20 + 32))(v25, v18, v19);
    sub_1C9ECF370(0, (unint64_t *)&unk_1EBC7FDD8);
    uint64_t v73 = v25;
    uint64_t v74 = v20;
    uint64_t v31 = *(void (**)(char *, char *, uint64_t))(v20 + 16);
    os_log_type_t v30 = v20 + 16;
    v31(v23, v25, v19);
    id v32 = sub_1C9ED9988((uint64_t)v23);
    id v33 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FA0E48]), sel_init);
    if (v33)
    {
      uint64_t v34 = v33;
      objc_msgSend(v33, sel_setOrchestratorSessionId_, v32);
      objc_msgSend(v34, sel_setRequestType_, a4);
      if (a5) {
        LODWORD(v35) = 2;
      }
      else {
        LODWORD(v35) = 1;
      }
      objc_msgSend(v34, sel_setSiriUODEnabled_, a5 & 1);
      if (a6) {
        uint64_t v36 = 1;
      }
      else {
        uint64_t v36 = v35;
      }
      if (a6) {
        uint64_t v35 = 2;
      }
      else {
        uint64_t v35 = v35;
      }
      objc_msgSend(v34, sel_setSiriAsrMode_, v36);
      objc_msgSend(v34, sel_setSiriNlMode_, v35);
      id v37 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FA0DD0]), sel_init);
      if (v37)
      {
        uint64_t v38 = v37;
        objc_msgSend(v37, sel_setIsNLServerFallbackDisabled_, v78 & 1);
        objc_msgSend(v38, sel_setIsDomainServerFallbackDisabled_, v79 & 1);
        objc_msgSend(v34, sel_setNlv3DeprecationFlags_, v38);
        objc_msgSend(v34, sel_setIsAssistantEngineRequest_, a9 & 1);
        id v39 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FA0E18]), sel_init);
        if (v39)
        {
          uint64_t v40 = v39;
          id v79 = v32;
          objc_msgSend(v39, sel_setStartedOrChanged_, v34);
          uint64_t v41 = v75;
          uint64_t v42 = (void *)sub_1C9F07DA8();
          if (v42)
          {
            uint64_t v43 = v42;
            objc_msgSend(v42, sel_setRequestContext_, v40);
            objc_msgSend(*(id *)(v41 + 16), sel_emitMessage_, v43);
            uint64_t v44 = (void *)sub_1C9F07D88();
            if (v44
              && (uint64_t v45 = v44,
                  id v46 = objc_msgSend(v44, sel_captureSnapshot),
                  v45,
                  v46))
            {
              id v47 = objc_msgSend(self, sel_context);
              if (v47)
              {
                char v48 = v47;
                sub_1C9F06978();
                if (__swift_getEnumTagSinglePayload((uint64_t)v16, 1, v19) == 1)
                {
                  unint64_t v49 = 0;
                  uint64_t v50 = v74;
                }
                else
                {
                  unint64_t v49 = (void *)sub_1C9F06998();
                  uint64_t v50 = v74;
                  (*(void (**)(char *, uint64_t))(v74 + 8))(v16, v19);
                }
                objc_msgSend(v46, sel_logWithEventContext_requestIdentifier_, v48, v49);

                (*(void (**)(char *, uint64_t))(v50 + 8))(v73, v19);
              }
              else
              {
                __break(1u);
              }
            }
            else
            {
              (*(void (**)(char *, uint64_t))(v74 + 8))(v73, v19);
            }
            return;
          }
          id v68 = v79;
          if (qword_1EBC7F680 != -1) {
            swift_once();
          }
          uint64_t v69 = sub_1C9F07E78();
          unint64_t v65 = OUTLINED_FUNCTION_2_2(v69, (uint64_t)qword_1EBC7FEF0);
          os_log_type_t v70 = sub_1C9F08168();
          if (os_log_type_enabled(v65, v70))
          {
            uint64_t v71 = (_WORD *)OUTLINED_FUNCTION_1_2();
            OUTLINED_FUNCTION_4_2(v71);
            OUTLINED_FUNCTION_5_1(&dword_1C9EC7000, v65, v70, "The Orchestration SELF event wrapper failed to build");
            OUTLINED_FUNCTION_1();
          }
        }
        else
        {
          if (qword_1EBC7F680 != -1) {
            swift_once();
          }
          uint64_t v64 = sub_1C9F07E78();
          unint64_t v65 = OUTLINED_FUNCTION_2_2(v64, (uint64_t)qword_1EBC7FEF0);
          os_log_type_t v66 = sub_1C9F08168();
          if (OUTLINED_FUNCTION_9_2(v66))
          {
            uint64_t v67 = (_WORD *)OUTLINED_FUNCTION_1_2();
            OUTLINED_FUNCTION_4_2(v67);
            OUTLINED_FUNCTION_5_1(&dword_1C9EC7000, v65, v30, "Failed to create the RequestContext message for start of request");
            OUTLINED_FUNCTION_1();
          }
        }
        (*(void (**)(char *, uint64_t))(v74 + 8))(v73, v19);
        return;
      }
      if (qword_1EBC7F680 != -1) {
        swift_once();
      }
      uint64_t v58 = sub_1C9F07E78();
      uint64_t v59 = OUTLINED_FUNCTION_2_2(v58, (uint64_t)qword_1EBC7FEF0);
      os_log_type_t v60 = sub_1C9F08168();
      BOOL v61 = OUTLINED_FUNCTION_9_2(v60);
      BOOL v62 = v73;
      if (v61)
      {
        uint64_t v63 = (_WORD *)OUTLINED_FUNCTION_1_2();
        OUTLINED_FUNCTION_4_2(v63);
        OUTLINED_FUNCTION_5_1(&dword_1C9EC7000, v59, v30, "Failed to create the nlClassicDeprecationFlags message");
        OUTLINED_FUNCTION_1();
      }

      (*(void (**)(char *, uint64_t))(v74 + 8))(v62, v19);
    }
    else
    {
      if (qword_1EBC7F680 != -1) {
        swift_once();
      }
      uint64_t v51 = sub_1C9F07E78();
      unint64_t v52 = OUTLINED_FUNCTION_2_2(v51, (uint64_t)qword_1EBC7FEF0);
      os_log_type_t v53 = sub_1C9F08168();
      BOOL v54 = OUTLINED_FUNCTION_9_2(v53);
      char v56 = v73;
      uint64_t v55 = v74;
      if (v54)
      {
        unint64_t v57 = (_WORD *)OUTLINED_FUNCTION_1_2();
        OUTLINED_FUNCTION_4_2(v57);
        OUTLINED_FUNCTION_5_1(&dword_1C9EC7000, v52, v30, "Failed to create the RequestStarted message");
        OUTLINED_FUNCTION_1();
      }

      (*(void (**)(char *, uint64_t))(v55 + 8))(v56, v19);
    }
  }
}

id sub_1C9ED9988(uint64_t a1)
{
  id v2 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  uint64_t v3 = (void *)sub_1C9F06998();
  id v4 = objc_msgSend(v2, sel_initWithNSUUID_, v3);

  uint64_t v5 = sub_1C9F069B8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(a1, v5);
  return v4;
}

void sub_1C9ED9A24()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC7F020);
  MEMORY[0x1F4188790](v1 - 8);
  uint64_t v3 = (char *)&v29 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FA0E28]), sel_init);
  if (!v4)
  {
    if (qword_1EBC7F680 != -1) {
      swift_once();
    }
    uint64_t v17 = sub_1C9F07E78();
    os_log_type_t v30 = OUTLINED_FUNCTION_2_2(v17, (uint64_t)qword_1EBC7FEF0);
    os_log_type_t v18 = sub_1C9F08168();
    if (os_log_type_enabled(v30, v18))
    {
      uint64_t v19 = (_WORD *)OUTLINED_FUNCTION_1_2();
      OUTLINED_FUNCTION_7_2(v19);
      OUTLINED_FUNCTION_3_2(&dword_1C9EC7000, v30, v20, "Failed to create the message for end of request");
      OUTLINED_FUNCTION_1();
    }
    goto LABEL_27;
  }
  os_log_type_t v30 = v4;
  [v4 setExists:1];
  id v5 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FA0E18]), sel_init);
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = OUTLINED_FUNCTION_8_2();
    if (v7)
    {
      id v8 = (void *)v7;
      objc_msgSend(v6, sel_setEnded_, v30);
      objc_msgSend(v8, sel_setRequestContext_, v6);
      objc_msgSend(*(id *)(v0 + 16), sel_emitMessage_, v8);
      uint64_t v9 = (void *)sub_1C9F07D88();
      if (v9)
      {
        uint64_t v10 = v9;
        id v11 = objc_msgSend(v9, sel_captureSnapshot);

        if (v11)
        {
          id v12 = objc_msgSend(self, sel_context);
          if (v12)
          {
            uint64_t v13 = v12;
            sub_1C9F06978();
            uint64_t v14 = sub_1C9F069B8();
            uint64_t v15 = 0;
            if (__swift_getEnumTagSinglePayload((uint64_t)v3, 1, v14) != 1)
            {
              uint64_t v15 = v3;
              sub_1C9F06998();
              OUTLINED_FUNCTION_11_2();
              (*(void (**)(char *, uint64_t))(v16 + 8))(v3, v14);
            }
            objc_msgSend(v11, sel_logWithEventContext_requestIdentifier_, v13, v15);
          }
          else
          {
            __break(1u);
          }
          return;
        }
      }

      goto LABEL_26;
    }
    if (qword_1EBC7F680 != -1) {
      swift_once();
    }
    uint64_t v25 = sub_1C9F07E78();
    uint64_t v29 = OUTLINED_FUNCTION_2_2(v25, (uint64_t)qword_1EBC7FEF0);
    os_log_type_t v26 = sub_1C9F08168();
    if (!os_log_type_enabled(v29, v26))
    {

LABEL_26:
      goto LABEL_27;
    }
    uint64_t v27 = (_WORD *)OUTLINED_FUNCTION_1_2();
    OUTLINED_FUNCTION_4_2(v27);
    OUTLINED_FUNCTION_5_1(&dword_1C9EC7000, v29, v26, "The Orchestration SELF event wrapper failed to build");
    OUTLINED_FUNCTION_1();
  }
  else
  {
    if (qword_1EBC7F680 != -1) {
      swift_once();
    }
    uint64_t v21 = sub_1C9F07E78();
    uint64_t v29 = OUTLINED_FUNCTION_2_2(v21, (uint64_t)qword_1EBC7FEF0);
    os_log_type_t v22 = sub_1C9F08168();
    if (!os_log_type_enabled(v29, v22))
    {

LABEL_27:
      os_log_type_t v28 = v30;
      goto LABEL_28;
    }
    unint64_t v23 = (_WORD *)OUTLINED_FUNCTION_1_2();
    OUTLINED_FUNCTION_7_2(v23);
    OUTLINED_FUNCTION_3_2(&dword_1C9EC7000, v29, v24, "Failed to create the RequestContext message for end of request");
    OUTLINED_FUNCTION_1();
  }
  os_log_type_t v28 = v29;
LABEL_28:
}

void sub_1C9ED9E50(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
}

void sub_1C9ED9E6C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
}

void sub_1C9ED9E88(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, Class *a5, SEL *a6, const char *a7)
{
  uint64_t v11 = v8;
  id v12 = objc_msgSend(objc_allocWithZone(*a5), sel_init);
  if (!v12)
  {
    if (qword_1EBC7F680 != -1) {
      swift_once();
    }
    uint64_t v16 = sub_1C9F07E78();
    loga = OUTLINED_FUNCTION_2_2(v16, (uint64_t)qword_1EBC7FEF0);
    os_log_type_t v17 = sub_1C9F08168();
    if (OUTLINED_FUNCTION_10_2(v17, v18, v19, v20, v21, v22, v23, v24, v37, loga))
    {
      uint64_t v25 = (_WORD *)OUTLINED_FUNCTION_1_2();
      OUTLINED_FUNCTION_7_2(v25);
      _os_log_impl(&dword_1C9EC7000, log, v7, a7, (uint8_t *)v8, 2u);
      OUTLINED_FUNCTION_1();
    }
    goto LABEL_13;
  }
  uint64_t v13 = v12;
  [v12 setExists:1];
  uint64_t v14 = *(void *)(v8 + 24);
  uint64_t v15 = sub_1C9F07DA8();
  if (v15)
  {
    log = v15;
    objc_msgSend(v15, *a6, v13);
    objc_msgSend(*(id *)(v11 + 16), sel_emitMessage_, log);
LABEL_12:

LABEL_13:
    uint64_t v36 = log;
    goto LABEL_14;
  }
  if (qword_1EBC7F680 != -1) {
    swift_once();
  }
  uint64_t v26 = sub_1C9F07E78();
  logb = OUTLINED_FUNCTION_2_2(v26, (uint64_t)qword_1EBC7FEF0);
  os_log_type_t v27 = sub_1C9F08168();
  if (OUTLINED_FUNCTION_6_1(v27, v28, v29, v30, v31, v32, v33, v34, v37, logb))
  {
    uint64_t v35 = (_WORD *)OUTLINED_FUNCTION_1_2();
    OUTLINED_FUNCTION_4_2(v35);
    OUTLINED_FUNCTION_5_1(&dword_1C9EC7000, log, (os_log_type_t)v14, "The Orchestration SELF event wrapper failed to build");
    OUTLINED_FUNCTION_1();
    goto LABEL_12;
  }

  uint64_t v36 = v13;
LABEL_14:
}

void sub_1C9EDA08C()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC7F020);
  MEMORY[0x1F4188790](v1 - 8);
  uint64_t v3 = (char *)&v26 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FA0E10]), sel_init);
  if (!v4)
  {
    if (qword_1EBC7F680 != -1) {
      swift_once();
    }
    uint64_t v17 = sub_1C9F07E78();
    os_log_type_t v27 = OUTLINED_FUNCTION_2_2(v17, (uint64_t)qword_1EBC7FEF0);
    os_log_type_t v18 = sub_1C9F08168();
    if (os_log_type_enabled(v27, v18))
    {
      int v19 = (_WORD *)OUTLINED_FUNCTION_1_2();
      OUTLINED_FUNCTION_7_2(v19);
      OUTLINED_FUNCTION_3_2(&dword_1C9EC7000, v27, v20, "The request canclled event wasn't created");
      OUTLINED_FUNCTION_1();
    }
    goto LABEL_22;
  }
  os_log_type_t v27 = v4;
  [v4 setReason:2];
  uint64_t v5 = OUTLINED_FUNCTION_8_2();
  if (v5)
  {
    uint64_t v6 = (void *)v5;
    os_log_type_t v7 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FA0E18]), sel_init);
    uint64_t v8 = v7;
    uint64_t v26 = v7;
    if (v7)
    {
      [v7 setCancelled:v27];
      uint64_t v8 = v26;
    }
    objc_msgSend(v6, sel_setRequestContext_, v8, v26);
    objc_msgSend(*(id *)(v0 + 16), sel_emitMessage_, v6);
    uint64_t v9 = (void *)sub_1C9F07D88();
    if (v9)
    {
      uint64_t v10 = v9;
      id v11 = objc_msgSend(v9, sel_captureSnapshot);

      if (v11)
      {
        id v12 = objc_msgSend(self, sel_context);
        if (v12)
        {
          uint64_t v13 = v12;
          sub_1C9F06978();
          uint64_t v14 = sub_1C9F069B8();
          uint64_t v15 = 0;
          if (__swift_getEnumTagSinglePayload((uint64_t)v3, 1, v14) != 1)
          {
            uint64_t v15 = v3;
            sub_1C9F06998();
            OUTLINED_FUNCTION_11_2();
            (*(void (**)(char *, uint64_t))(v16 + 8))(v3, v14);
          }
          objc_msgSend(v11, sel_logWithEventContext_requestIdentifier_, v13, v15);
        }
        else
        {
          __break(1u);
        }
        return;
      }
    }

    goto LABEL_20;
  }
  if (qword_1EBC7F680 != -1) {
    swift_once();
  }
  uint64_t v21 = sub_1C9F07E78();
  uint64_t v26 = OUTLINED_FUNCTION_2_2(v21, (uint64_t)qword_1EBC7FEF0);
  os_log_type_t v22 = sub_1C9F08168();
  if (!os_log_type_enabled(v26, v22))
  {

LABEL_22:
    uint64_t v25 = v27;
    goto LABEL_23;
  }
  int v23 = (_WORD *)OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_7_2(v23);
  OUTLINED_FUNCTION_3_2(&dword_1C9EC7000, v26, v24, "The Orchestration SELF event wrapper failed to build");
  OUTLINED_FUNCTION_1();
LABEL_20:

  uint64_t v25 = v26;
LABEL_23:
}

void sub_1C9EDA414(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = *(void *)(v2 + 24);
  uint64_t v7 = sub_1C9F07DA8();
  if (!v7)
  {
    if (qword_1EBC7F680 != -1) {
      swift_once();
    }
    uint64_t v19 = sub_1C9F07E78();
    loga = OUTLINED_FUNCTION_2_2(v19, (uint64_t)qword_1EBC7FEF0);
    os_log_type_t v20 = sub_1C9F08168();
    if (OUTLINED_FUNCTION_10_2(v20, v21, v22, v23, v24, v25, v26, v27, v65, loga))
    {
      int v28 = (_WORD *)OUTLINED_FUNCTION_1_2();
      OUTLINED_FUNCTION_7_2(v28);
      OUTLINED_FUNCTION_3_2(&dword_1C9EC7000, log, v29, "The Orchestration SELF Assets event wrapper failed to build");
      OUTLINED_FUNCTION_1();
    }
    goto LABEL_30;
  }
  uint64_t v8 = v7;
  uint64_t v9 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FA0D18]), sel_init);
  if (!v9)
  {
    if (qword_1EBC7F680 != -1) {
      swift_once();
    }
    uint64_t v30 = sub_1C9F07E78();
    logb = OUTLINED_FUNCTION_2_2(v30, (uint64_t)qword_1EBC7FEF0);
    os_log_type_t v31 = sub_1C9F08168();
    if (!OUTLINED_FUNCTION_6_1(v31, v32, v33, v34, v35, v36, v37, v38, v65, logb))
    {

      uint64_t v50 = v8;
      goto LABEL_31;
    }
    id v39 = (_WORD *)OUTLINED_FUNCTION_1_2();
    OUTLINED_FUNCTION_4_2(v39);
    OUTLINED_FUNCTION_5_1(&dword_1C9EC7000, log, (os_log_type_t)v6, "Failed to create message to report assets");
    OUTLINED_FUNCTION_1();
    goto LABEL_23;
  }
  uint64_t v10 = v9;
  uint64_t v11 = sub_1C9F07DA8();
  if (!v11)
  {
    if (qword_1EBC7F680 != -1) {
      swift_once();
    }
    uint64_t v40 = sub_1C9F07E78();
    logc = OUTLINED_FUNCTION_2_2(v40, (uint64_t)qword_1EBC7FEF0);
    os_log_type_t v41 = sub_1C9F08168();
    if (!OUTLINED_FUNCTION_6_1(v41, v42, v43, v44, v45, v46, v47, v48, v65, logc))
    {

      goto LABEL_41;
    }
    unint64_t v49 = (uint8_t *)OUTLINED_FUNCTION_1_2();
    *(_WORD *)unint64_t v49 = 0;
    _os_log_impl(&dword_1C9EC7000, log, (os_log_type_t)v6, "The Orchestration SELF AssetSets event wrapper failed to build", v49, 2u);
    OUTLINED_FUNCTION_1();

LABEL_23:
LABEL_30:
    uint64_t v50 = log;
    goto LABEL_31;
  }
  id v12 = (void *)v11;
  uint64_t v13 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FA0D10]), sel_init);
  if (v13)
  {
    log = v13;
    sub_1C9EDAEB0(a1, v10, &qword_1EBC7FDE8, 0x1E4FA1258, (SEL *)&selRef_setAssets_);
    [v8 setAvailableAssets:v10];
    uint64_t v14 = *(void **)(v3 + 16);
    objc_msgSend(v14, sel_emitMessage_, v8);
    if (a2)
    {
      sub_1C9EDAEB0(a2, log, (unint64_t *)&unk_1EBC7FDF0, 0x1E4FA1460, (SEL *)&selRef_setUafAssetSets_);
      objc_msgSend(v12, sel_setAssetSetsReported_, log);
      if (qword_1EBC7F680 != -1) {
        swift_once();
      }
      uint64_t v15 = sub_1C9F07E78();
      uint64_t v16 = OUTLINED_FUNCTION_2_2(v15, (uint64_t)qword_1EBC7FEF0);
      os_log_type_t v17 = sub_1C9F08158();
      if (os_log_type_enabled(v16, v17))
      {
        os_log_type_t v18 = (uint8_t *)OUTLINED_FUNCTION_1_2();
        *(_WORD *)os_log_type_t v18 = 0;
        _os_log_impl(&dword_1C9EC7000, v16, v17, "ORCHAssetSetsReported event is being emitted now", v18, 2u);
        OUTLINED_FUNCTION_1();
      }

      objc_msgSend(v14, sel_emitMessage_, v12);
      goto LABEL_29;
    }
    if (qword_1EBC7F680 != -1) {
      swift_once();
    }
    uint64_t v61 = sub_1C9F07E78();
    BOOL v62 = OUTLINED_FUNCTION_2_2(v61, (uint64_t)qword_1EBC7FEF0);
    os_log_type_t v63 = sub_1C9F08188();
    if (os_log_type_enabled(v62, v63))
    {
      uint64_t v64 = (uint8_t *)OUTLINED_FUNCTION_1_2();
      *(_WORD *)uint64_t v64 = 0;
      _os_log_impl(&dword_1C9EC7000, v62, v63, "No asset sets, so assetSetsReported event is not being emitted", v64, 2u);
      OUTLINED_FUNCTION_1();

      uint64_t v50 = v62;
      goto LABEL_31;
    }
  }
  else
  {
    if (qword_1EBC7F680 != -1) {
      swift_once();
    }
    uint64_t v51 = sub_1C9F07E78();
    logd = OUTLINED_FUNCTION_2_2(v51, (uint64_t)qword_1EBC7FEF0);
    os_log_type_t v52 = sub_1C9F08168();
    if (OUTLINED_FUNCTION_6_1(v52, v53, v54, v55, v56, v57, v58, v59, v65, logd))
    {
      os_log_type_t v60 = (uint8_t *)OUTLINED_FUNCTION_1_2();
      *(_WORD *)os_log_type_t v60 = 0;
      _os_log_impl(&dword_1C9EC7000, log, (os_log_type_t)v6, "Failed to create message to report asset sets", v60, 2u);
      OUTLINED_FUNCTION_1();

LABEL_29:
      goto LABEL_30;
    }
  }
LABEL_41:
  uint64_t v50 = v10;
LABEL_31:
}

void sub_1C9EDA97C(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v9 = sub_1C9F07D78();
  if (v9)
  {
    id v14 = (id)v9;
    objc_msgSend(*(id *)(v4 + 16), sel_emitMessage_);
  }
  else
  {
    if (qword_1EBC7F680 != -1) {
      swift_once();
    }
    uint64_t v10 = sub_1C9F07E78();
    __swift_project_value_buffer(v10, (uint64_t)qword_1EBC7FEF0);
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    uint64_t v11 = sub_1C9F07E68();
    os_log_type_t v12 = sub_1C9F08168();
    if (os_log_type_enabled(v11, v12))
    {
      uint64_t v13 = swift_slowAlloc();
      uint64_t v15 = swift_slowAlloc();
      *(_DWORD *)uint64_t v13 = 136315394;
      swift_bridgeObjectRetain();
      sub_1C9F01420(a1, a2, &v15);
      sub_1C9F08228();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v13 + 12) = 2080;
      swift_bridgeObjectRetain();
      sub_1C9F01420(a3, a4, &v15);
      sub_1C9F08228();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_1C9EC7000, v11, v12, "Unable to logRequestSubRequestLink for rootRequestId=%s and childRequestId=%s", (uint8_t *)v13, 0x16u);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_1();
      OUTLINED_FUNCTION_1();
    }
    else
    {

      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
    }
  }
}

void sub_1C9EDABF4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6 = v5;
  uint64_t v8 = *(void *)(v5 + 24);
  uint64_t v9 = sub_1C9F07D98();
  if (!v9)
  {
    if (qword_1EBC7F680 != -1) {
      swift_once();
    }
    uint64_t v14 = sub_1C9F07E78();
    int v38 = OUTLINED_FUNCTION_2_2(v14, (uint64_t)qword_1EBC7FEF0);
    os_log_type_t v15 = sub_1C9F08168();
    if (OUTLINED_FUNCTION_10_2(v15, v16, v17, v18, v19, v20, v21, v22, v36, v38))
    {
      int v23 = (_WORD *)OUTLINED_FUNCTION_1_2();
      OUTLINED_FUNCTION_7_2(v23);
      OUTLINED_FUNCTION_3_2(&dword_1C9EC7000, v37, v24, "Could not build wrapper when logging logChildRequestStarted");
      OUTLINED_FUNCTION_1();
    }
    goto LABEL_14;
  }
  uint64_t v10 = v9;
  uint64_t v11 = sub_1C9F07DB8();
  if (v11)
  {
    os_log_type_t v12 = (void *)v11;
    id v13 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FA0E98]), sel_init);
    objc_msgSend(v13, sel_setSubRequestType_, a5);
    int v37 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FA0E90]), sel_init);
    if (v37) {
      [v37 setSubRequestId:v12];
    }
    [v37 setStartedOrChanged:v13];
    [v10 setSubRequestContext:v37];
    objc_msgSend(*(id *)(v6 + 16), sel_emitMessage_, v10);

    goto LABEL_14;
  }
  if (qword_1EBC7F680 != -1) {
    swift_once();
  }
  uint64_t v25 = sub_1C9F07E78();
  id v39 = OUTLINED_FUNCTION_2_2(v25, (uint64_t)qword_1EBC7FEF0);
  os_log_type_t v26 = sub_1C9F08168();
  if (OUTLINED_FUNCTION_6_1(v26, v27, v28, v29, v30, v31, v32, v33, v36, v39))
  {
    int v34 = (_WORD *)OUTLINED_FUNCTION_1_2();
    OUTLINED_FUNCTION_4_2(v34);
    OUTLINED_FUNCTION_5_1(&dword_1C9EC7000, v37, (os_log_type_t)v8, "The subRequestId is not a valid UUID, will not emit for logChildRequestStarted");
    OUTLINED_FUNCTION_1();

LABEL_14:
    int v35 = v37;
    goto LABEL_15;
  }

  int v35 = v10;
LABEL_15:
}

uint64_t sub_1C9EDAE30()
{
  swift_unknownObjectRelease();
  swift_release();
  return v0;
}

uint64_t sub_1C9EDAE58()
{
  sub_1C9EDAE30();
  return MEMORY[0x1F4186488](v0, 32, 7);
}

uint64_t type metadata accessor for MessageBusInstrumentationUtil()
{
  return self;
}

void sub_1C9EDAEB0(uint64_t a1, void *a2, unint64_t *a3, uint64_t a4, SEL *a5)
{
  sub_1C9ECF370(0, a3);
  id v7 = (id)sub_1C9F080E8();
  objc_msgSend(a2, *a5, v7);
}

uint64_t sub_1C9EDAF2C(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC7F020);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t OUTLINED_FUNCTION_1_2()
{
  return swift_slowAlloc();
}

uint64_t OUTLINED_FUNCTION_2_2(uint64_t a1, uint64_t a2)
{
  __swift_project_value_buffer(a1, a2);
  return sub_1C9F07E68();
}

void OUTLINED_FUNCTION_3_2(void *a1, NSObject *a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, a2, v4, a4, v5, 2u);
}

_WORD *OUTLINED_FUNCTION_4_2(_WORD *result)
{
  *uint64_t result = 0;
  return result;
}

void OUTLINED_FUNCTION_5_1(void *a1, NSObject *a2, os_log_type_t a3, const char *a4)
{
  _os_log_impl(a1, a2, a3, a4, v4, 2u);
}

BOOL OUTLINED_FUNCTION_6_1(os_log_type_t a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, os_log_t oslog)
{
  return os_log_type_enabled(oslog, a1);
}

_WORD *OUTLINED_FUNCTION_7_2(_WORD *result)
{
  *uint64_t result = 0;
  return result;
}

uint64_t OUTLINED_FUNCTION_8_2()
{
  return sub_1C9F07DA8();
}

BOOL OUTLINED_FUNCTION_9_2(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

BOOL OUTLINED_FUNCTION_10_2(os_log_type_t a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, os_log_t oslog)
{
  return os_log_type_enabled(oslog, a1);
}

uint64_t sub_1C9EDB0A4(void *a1)
{
  LOBYTE(a1) = sub_1C9ED0FAC(a1);
  swift_release();
  return a1 & 1;
}

uint64_t sub_1C9EDB0E8()
{
  swift_unownedRelease();
  return MEMORY[0x1F4186488](v0, 24, 7);
}

uint64_t type metadata accessor for MessagePublisher()
{
  return self;
}

uint64_t sub_1C9EDB144(void *a1)
{
  return sub_1C9EDB0A4(a1) & 1;
}

void sub_1C9EDB16C()
{
  OUTLINED_FUNCTION_14_1();
  OUTLINED_FUNCTION_24_0();
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC7F020);
  uint64_t v2 = OUTLINED_FUNCTION_10_3(v1);
  MEMORY[0x1F4188790](v2);
  OUTLINED_FUNCTION_14_2();
  id v3 = objc_allocWithZone((Class)sub_1C9F06C58());
  os_log_type_t v4 = (void *)sub_1C9F06C48();
  uint64_t v5 = v4;
  if (v4)
  {
    sub_1C9ED0FAC(v4);
    OUTLINED_FUNCTION_34(OBJC_IVAR___SRDRequestDispatcherInternal_instrumentationUtil);
    OUTLINED_FUNCTION_15();
    OUTLINED_FUNCTION_16_2();
    v6();
    OUTLINED_FUNCTION_25_0(v0);
    OUTLINED_FUNCTION_48(OBJC_IVAR___SRDRequestDispatcherInternal_serverFallbackDisablingUtils);
    swift_bridgeObjectRetain();
    OUTLINED_FUNCTION_28_0();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_38();
    OUTLINED_FUNCTION_9_3();
    uint64_t v7 = OUTLINED_FUNCTION_36();
    OUTLINED_FUNCTION_17_1(v7, v8, v9, v10, v11, v12, v13, v14, 0);

    sub_1C9EDAF2C(v0);
  }
  else
  {
    if (qword_1EBC7F680 != -1) {
      swift_once();
    }
    uint64_t v15 = sub_1C9F07E78();
    OUTLINED_FUNCTION_5_2(v15, (uint64_t)qword_1EBC7FEF0);
    int v16 = (void *)sub_1C9F07E68();
    os_log_type_t v17 = sub_1C9F08168();
    if (OUTLINED_FUNCTION_21(v17))
    {
      OUTLINED_FUNCTION_7();
      uint64_t v18 = OUTLINED_FUNCTION_3_3();
      OUTLINED_FUNCTION_40(v18);
      OUTLINED_FUNCTION_30_0(4.8149e-34);
      uint64_t v19 = OUTLINED_FUNCTION_21_1();
      OUTLINED_FUNCTION_6_2(v19);
      OUTLINED_FUNCTION_26_0();
      OUTLINED_FUNCTION_1_3(&dword_1C9EC7000, v20, v21, "Failed to create StartTextRequestMessage for request Id: %s");
      OUTLINED_FUNCTION_7_3();
      OUTLINED_FUNCTION_1();
      OUTLINED_FUNCTION_1();
    }
    else
    {

      OUTLINED_FUNCTION_27_0();
    }
  }
  OUTLINED_FUNCTION_35();
  OUTLINED_FUNCTION_11_1();
}

void sub_1C9EDB384()
{
  OUTLINED_FUNCTION_14_1();
  OUTLINED_FUNCTION_47();
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC7F020);
  uint64_t v2 = OUTLINED_FUNCTION_10_3(v1);
  MEMORY[0x1F4188790](v2);
  OUTLINED_FUNCTION_20_1();
  id v3 = objc_allocWithZone((Class)sub_1C9F06FC8());
  os_log_type_t v4 = (void *)sub_1C9F06F48();
  uint64_t v5 = v4;
  if (v4)
  {
    sub_1C9ED0FAC(v4);
    OUTLINED_FUNCTION_34(OBJC_IVAR___SRDRequestDispatcherInternal_instrumentationUtil);
    OUTLINED_FUNCTION_15();
    OUTLINED_FUNCTION_16_2();
    v6();
    OUTLINED_FUNCTION_25_0(v0);
    OUTLINED_FUNCTION_48(OBJC_IVAR___SRDRequestDispatcherInternal_serverFallbackDisablingUtils);
    swift_bridgeObjectRetain();
    OUTLINED_FUNCTION_28_0();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_38();
    OUTLINED_FUNCTION_9_3();
    uint64_t v7 = OUTLINED_FUNCTION_36();
    OUTLINED_FUNCTION_17_1(v7, v8, v9, v10, v11, v12, v13, v14, 1);

    sub_1C9EDAF2C(v0);
  }
  else
  {
    if (qword_1EBC7F680 != -1) {
      swift_once();
    }
    uint64_t v15 = sub_1C9F07E78();
    OUTLINED_FUNCTION_5_2(v15, (uint64_t)qword_1EBC7FEF0);
    int v16 = (void *)sub_1C9F07E68();
    os_log_type_t v17 = sub_1C9F08168();
    if (OUTLINED_FUNCTION_21(v17))
    {
      OUTLINED_FUNCTION_7();
      uint64_t v18 = OUTLINED_FUNCTION_3_3();
      OUTLINED_FUNCTION_40(v18);
      OUTLINED_FUNCTION_30_0(4.8149e-34);
      uint64_t v19 = OUTLINED_FUNCTION_21_1();
      OUTLINED_FUNCTION_6_2(v19);
      OUTLINED_FUNCTION_26_0();
      OUTLINED_FUNCTION_1_3(&dword_1C9EC7000, v20, v21, "Failed to create StartRootTextRequestMessage for request Id: %s");
      OUTLINED_FUNCTION_7_3();
      OUTLINED_FUNCTION_1();
      OUTLINED_FUNCTION_1();
    }
    else
    {

      OUTLINED_FUNCTION_27_0();
    }
  }
  OUTLINED_FUNCTION_35();
  OUTLINED_FUNCTION_11_1();
}

uint64_t sub_1C9EDB5C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, void *a8, uint64_t a9)
{
  uint64_t v31 = a7;
  id v32 = a8;
  uint64_t v29 = a4;
  uint64_t v30 = a5;
  uint64_t v33 = a9;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EA5CEBF8);
  MEMORY[0x1F4188790](v9 - 8);
  uint64_t v11 = (char *)&v28 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBC7FCF8);
  MEMORY[0x1F4188790](v12 - 8);
  uint64_t v14 = (char *)&v28 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC7F020);
  MEMORY[0x1F4188790](v15 - 8);
  os_log_type_t v17 = (char *)&v28 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC7FCF0);
  MEMORY[0x1F4188790](v18 - 8);
  uint64_t v20 = (char *)&v28 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = *MEMORY[0x1E4FA22F8];
  uint64_t v22 = sub_1C9F07A48();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v22 - 8) + 104))(v20, v21, v22);
  __swift_storeEnumTagSinglePayload((uint64_t)v20, 0, 1, v22);
  sub_1C9F06F98();
  swift_bridgeObjectRetain();
  sub_1C9F06F68();
  uint64_t v23 = sub_1C9F069B8();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v23 - 8) + 16))(v17, v29, v23);
  __swift_storeEnumTagSinglePayload((uint64_t)v17, 0, 1, v23);
  sub_1C9F06FB8();
  swift_bridgeObjectRetain();
  sub_1C9F06FA8();
  uint64_t v24 = sub_1C9F07A68();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v24 - 8) + 16))(v14, v31, v24);
  __swift_storeEnumTagSinglePayload((uint64_t)v14, 0, 1, v24);
  sub_1C9F06F78();
  id v25 = v32;
  sub_1C9F06F88();
  uint64_t v26 = sub_1C9F07AA8();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v26 - 8) + 16))(v11, v33, v26);
  __swift_storeEnumTagSinglePayload((uint64_t)v11, 0, 1, v26);
  return sub_1C9F06F58();
}

BOOL sub_1C9EDB900()
{
  return sub_1C9EDD1DC();
}

uint64_t sub_1C9EDB968(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
  v21[1] = a5;
  v21[2] = a7;
  id v22 = a9;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC7F020);
  MEMORY[0x1F4188790](v10 - 8);
  uint64_t v12 = (char *)v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC7FCF0);
  MEMORY[0x1F4188790](v13 - 8);
  uint64_t v15 = (char *)v21 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = *MEMORY[0x1E4FA22F8];
  uint64_t v17 = sub_1C9F07A48();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v17 - 8) + 104))(v15, v16, v17);
  __swift_storeEnumTagSinglePayload((uint64_t)v15, 0, 1, v17);
  sub_1C9F07488();
  swift_bridgeObjectRetain();
  sub_1C9F07468();
  uint64_t v18 = sub_1C9F069B8();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v18 - 8) + 16))(v12, a4, v18);
  __swift_storeEnumTagSinglePayload((uint64_t)v12, 0, 1, v18);
  sub_1C9F074A8();
  swift_bridgeObjectRetain();
  sub_1C9F07498();
  if (qword_1EBC7F8A8 != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  sub_1C9F07458();
  swift_bridgeObjectRetain();
  sub_1C9F074B8();
  id v19 = v22;
  return sub_1C9F07478();
}

BOOL sub_1C9EDBBC0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5)
{
  swift_getObjectType();
  id v7 = objc_allocWithZone((Class)sub_1C9F073A8());
  uint64_t v8 = (void *)sub_1C9F07318();
  if (v8)
  {
    OUTLINED_FUNCTION_31_0();
    if (qword_1EBC7F8A8 != -1) {
      swift_once();
    }
    sub_1C9ED9E6C(a4, a5, qword_1EBC7FF30, *(uint64_t *)algn_1EBC7FF38);
  }
  else
  {
    if (qword_1EBC7F680 != -1) {
      swift_once();
    }
    uint64_t v9 = sub_1C9F07E78();
    OUTLINED_FUNCTION_5_2(v9, (uint64_t)qword_1EBC7FEF0);
    uint64_t v10 = (void *)sub_1C9F07E68();
    os_log_type_t v11 = sub_1C9F08168();
    if (OUTLINED_FUNCTION_21(v11))
    {
      OUTLINED_FUNCTION_7();
      uint64_t v15 = OUTLINED_FUNCTION_3_3();
      OUTLINED_FUNCTION_29_0(4.8149e-34);
      sub_1C9F01420(a4, a5, &v15);
      OUTLINED_FUNCTION_23_0();
      OUTLINED_FUNCTION_26_0();
      OUTLINED_FUNCTION_1_3(&dword_1C9EC7000, v12, v13, "Failed to create MUXTextBasedResultSelectedMessage for request Id: %s");
      OUTLINED_FUNCTION_7_3();
      OUTLINED_FUNCTION_1();
      OUTLINED_FUNCTION_1();
    }
    else
    {

      OUTLINED_FUNCTION_27_0();
    }
  }
  return v8 != 0;
}

uint64_t sub_1C9EDBDC4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v21 = a5;
  uint64_t v22 = a7;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC7FD70);
  MEMORY[0x1F4188790](v8 - 8);
  uint64_t v10 = (char *)&v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC7F020);
  MEMORY[0x1F4188790](v11 - 8);
  uint64_t v13 = (char *)&v21 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC7FCF0);
  MEMORY[0x1F4188790](v14 - 8);
  uint64_t v16 = (char *)&v21 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = *MEMORY[0x1E4FA22F8];
  uint64_t v18 = sub_1C9F07A48();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v18 - 8) + 104))(v16, v17, v18);
  __swift_storeEnumTagSinglePayload((uint64_t)v16, 0, 1, v18);
  sub_1C9F07378();
  swift_bridgeObjectRetain();
  sub_1C9F07338();
  uint64_t v19 = sub_1C9F069B8();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v19 - 8) + 16))(v13, a4, v19);
  __swift_storeEnumTagSinglePayload((uint64_t)v13, 0, 1, v19);
  sub_1C9F07398();
  swift_bridgeObjectRetain();
  sub_1C9F07388();
  if (qword_1EBC7F8A8 != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  sub_1C9F07368();
  sub_1C9F07348();
  sub_1C9F07358();
  sub_1C9EDEBE0(v22, (uint64_t)v10);
  return sub_1C9F07328();
}

BOOL sub_1C9EDC05C()
{
  return sub_1C9EDE5D0();
}

BOOL sub_1C9EDC0BC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  return sub_1C9EDC454(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, MEMORY[0x1E4FA2270], (uint64_t)sub_1C9EDEB7C, MEMORY[0x1E4FA2268]);
}

uint64_t sub_1C9EDC12C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  v25[1] = a5;
  uint64_t v26 = a7;
  v25[0] = a4;
  uint64_t v27 = a11;
  uint64_t v28 = a8;
  uint64_t v29 = a10;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC7FD70);
  MEMORY[0x1F4188790](v11 - 8);
  uint64_t v13 = (char *)v25 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC7F020);
  MEMORY[0x1F4188790](v14 - 8);
  uint64_t v16 = (char *)v25 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC7FCF0);
  MEMORY[0x1F4188790](v17 - 8);
  uint64_t v19 = (char *)v25 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = *MEMORY[0x1E4FA22F8];
  uint64_t v21 = sub_1C9F07A48();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v21 - 8) + 104))(v19, v20, v21);
  __swift_storeEnumTagSinglePayload((uint64_t)v19, 0, 1, v21);
  sub_1C9F07908();
  swift_bridgeObjectRetain();
  sub_1C9F078E8();
  uint64_t v22 = sub_1C9F069B8();
  (*(void (**)(char *, void, uint64_t))(*(void *)(v22 - 8) + 16))(v16, v25[0], v22);
  __swift_storeEnumTagSinglePayload((uint64_t)v16, 0, 1, v22);
  sub_1C9F07938();
  swift_bridgeObjectRetain();
  sub_1C9F07928();
  uint64_t v23 = sub_1C9F07C98();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v23 - 8) + 16))(v13, v26, v23);
  __swift_storeEnumTagSinglePayload((uint64_t)v13, 0, 1, v23);
  sub_1C9F07918();
  swift_bridgeObjectRetain();
  sub_1C9F07948();
  swift_bridgeObjectRetain();
  return sub_1C9F078F8();
}

BOOL sub_1C9EDC3E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  return sub_1C9EDC454(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, MEMORY[0x1E4FA2240], (uint64_t)sub_1C9EDEA48, MEMORY[0x1E4FA2238]);
}

BOOL sub_1C9EDC454(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t (*a11)(void), uint64_t a12, uint64_t (*a13)(uint64_t, void *))
{
  OUTLINED_FUNCTION_46();
  v29[2] = v15;
  v29[3] = v16;
  v29[4] = v17;
  v29[5] = v18;
  v29[6] = v19;
  v29[7] = v20;
  v29[8] = v21;
  v29[9] = v22;
  v29[10] = a9;
  v29[11] = a10;
  id v23 = objc_allocWithZone((Class)a11(0));
  uint64_t v24 = (void *)a13(a12, v29);
  if (v24)
  {
    OUTLINED_FUNCTION_31_0();
    sub_1C9ED9E50(v14, v13, a9, a10);
  }
  else
  {
    if (qword_1EBC7F680 != -1) {
      swift_once();
    }
    uint64_t v25 = sub_1C9F07E78();
    OUTLINED_FUNCTION_5_2(v25, (uint64_t)qword_1EBC7FEF0);
    uint64_t v26 = (void *)sub_1C9F07E68();
    os_log_type_t v27 = sub_1C9F08168();
    if (OUTLINED_FUNCTION_21(v27))
    {
      OUTLINED_FUNCTION_7();
      v29[13] = OUTLINED_FUNCTION_3_3();
      OUTLINED_FUNCTION_44(4.8149e-34);
      OUTLINED_FUNCTION_21_1();
      OUTLINED_FUNCTION_43();
      sub_1C9F08228();
      OUTLINED_FUNCTION_26_0();
      OUTLINED_FUNCTION_18_1(&dword_1C9EC7000);
      OUTLINED_FUNCTION_37();
      OUTLINED_FUNCTION_1();
      OUTLINED_FUNCTION_1();
    }
    else
    {

      OUTLINED_FUNCTION_27_0();
    }
  }
  return v24 != 0;
}

uint64_t sub_1C9EDC5FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  v25[1] = a5;
  uint64_t v26 = a7;
  v25[0] = a4;
  uint64_t v27 = a11;
  uint64_t v28 = a8;
  uint64_t v29 = a10;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC7FD70);
  MEMORY[0x1F4188790](v11 - 8);
  uint64_t v13 = (char *)v25 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC7F020);
  MEMORY[0x1F4188790](v14 - 8);
  uint64_t v16 = (char *)v25 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC7FCF0);
  MEMORY[0x1F4188790](v17 - 8);
  uint64_t v19 = (char *)v25 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = *MEMORY[0x1E4FA22F8];
  uint64_t v21 = sub_1C9F07A48();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v21 - 8) + 104))(v19, v20, v21);
  __swift_storeEnumTagSinglePayload((uint64_t)v19, 0, 1, v21);
  sub_1C9F076D8();
  swift_bridgeObjectRetain();
  sub_1C9F076B8();
  uint64_t v22 = sub_1C9F069B8();
  (*(void (**)(char *, void, uint64_t))(*(void *)(v22 - 8) + 16))(v16, v25[0], v22);
  __swift_storeEnumTagSinglePayload((uint64_t)v16, 0, 1, v22);
  sub_1C9F07708();
  swift_bridgeObjectRetain();
  sub_1C9F076F8();
  uint64_t v23 = sub_1C9F07C98();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v23 - 8) + 16))(v13, v26, v23);
  __swift_storeEnumTagSinglePayload((uint64_t)v13, 0, 1, v23);
  sub_1C9F076E8();
  swift_bridgeObjectRetain();
  sub_1C9F07718();
  swift_bridgeObjectRetain();
  return sub_1C9F076C8();
}

BOOL sub_1C9EDC8B4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5)
{
  return sub_1C9EDDB98(a1, a2, a3, a4, a5, MEMORY[0x1E4FA20A8], (uint64_t)sub_1C9EDEA94, MEMORY[0x1E4FA20A0]);
}

BOOL sub_1C9EDC920(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  OUTLINED_FUNCTION_46();
  id v11 = objc_allocWithZone((Class)sub_1C9F07858());
  uint64_t v12 = (void *)sub_1C9F077F8();
  uint64_t v13 = v12;
  if (v12)
  {
    sub_1C9ED0FAC(v12);
    sub_1C9ED9E6C(v8, v7, a6, a7);
  }
  else
  {
    if (qword_1EBC7F680 != -1) {
      swift_once();
    }
    uint64_t v14 = sub_1C9F07E78();
    OUTLINED_FUNCTION_5_2(v14, (uint64_t)qword_1EBC7FEF0);
    uint64_t v15 = (void *)sub_1C9F07E68();
    os_log_type_t v16 = sub_1C9F08168();
    if (OUTLINED_FUNCTION_21(v16))
    {
      OUTLINED_FUNCTION_7();
      uint64_t v20 = OUTLINED_FUNCTION_3_3();
      OUTLINED_FUNCTION_29_0(4.8149e-34);
      sub_1C9F01420(v8, v7, &v20);
      OUTLINED_FUNCTION_23_0();
      OUTLINED_FUNCTION_26_0();
      OUTLINED_FUNCTION_1_3(&dword_1C9EC7000, v17, v18, "Failed to create StoppedListeningForTextContinuationForPlannerMessage for request Id: %s");
      OUTLINED_FUNCTION_7_3();
      OUTLINED_FUNCTION_1();
      OUTLINED_FUNCTION_1();
    }
    else
    {

      OUTLINED_FUNCTION_27_0();
    }
  }
  return v13 != 0;
}

uint64_t sub_1C9EDCAE4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v18[0] = a5;
  v18[1] = a7;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC7F020);
  MEMORY[0x1F4188790](v8 - 8);
  uint64_t v10 = (char *)v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC7FCF0);
  MEMORY[0x1F4188790](v11 - 8);
  uint64_t v13 = (char *)v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = *MEMORY[0x1E4FA22F8];
  uint64_t v15 = sub_1C9F07A48();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v15 - 8) + 104))(v13, v14, v15);
  __swift_storeEnumTagSinglePayload((uint64_t)v13, 0, 1, v15);
  sub_1C9F07818();
  swift_bridgeObjectRetain();
  sub_1C9F07808();
  uint64_t v16 = sub_1C9F069B8();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v16 - 8) + 16))(v10, a4, v16);
  __swift_storeEnumTagSinglePayload((uint64_t)v10, 0, 1, v16);
  sub_1C9F07848();
  swift_bridgeObjectRetain();
  sub_1C9F07838();
  swift_bridgeObjectRetain();
  return sub_1C9F07828();
}

uint64_t sub_1C9EDCCD4(uint64_t a1)
{
  return sub_1C9EDCAE4(a1, v1[2], v1[3], v1[4], v1[5], v1[6], v1[7]);
}

void sub_1C9EDCCE8()
{
  OUTLINED_FUNCTION_14_1();
  OUTLINED_FUNCTION_24_0();
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC7F020);
  uint64_t v5 = OUTLINED_FUNCTION_10_3(v4);
  MEMORY[0x1F4188790](v5);
  OUTLINED_FUNCTION_14_2();
  id v6 = objc_allocWithZone((Class)sub_1C9F071F8());
  unint64_t v7 = (void *)sub_1C9F06C48();
  if (v7)
  {
    sub_1C9ED0FAC(v7);
    char v8 = OUTLINED_FUNCTION_34(OBJC_IVAR___SRDRequestDispatcherInternal_instrumentationUtil);
    OUTLINED_FUNCTION_15();
    OUTLINED_FUNCTION_16_2();
    v9();
    char v21 = OUTLINED_FUNCTION_25_0(v2);
    char v20 = AFShouldRunAsrOnServerForUOD();
    OUTLINED_FUNCTION_15_2();
    uint64_t v10 = v3 + OBJC_IVAR___SRDRequestDispatcherInternal_siriInputLocale;
    swift_bridgeObjectRetain();
    char v11 = OUTLINED_FUNCTION_45();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_15_2();
    uint64_t v12 = *(void **)(v10 + 8);
    swift_bridgeObjectRetain();
    OUTLINED_FUNCTION_9_3();
    OUTLINED_FUNCTION_36();
    sub_1C9ED91A4(v2, v1, v0, 4, v21, v20, v11 & 1, v8 & 1, 0);

    sub_1C9EDAF2C(v2);
  }
  else
  {
    if (qword_1EBC7F680 != -1) {
      swift_once();
    }
    uint64_t v13 = sub_1C9F07E78();
    OUTLINED_FUNCTION_5_2(v13, (uint64_t)qword_1EBC7FEF0);
    uint64_t v14 = (void *)sub_1C9F07E68();
    os_log_type_t v15 = sub_1C9F08168();
    if (OUTLINED_FUNCTION_21(v15))
    {
      OUTLINED_FUNCTION_7();
      uint64_t v16 = OUTLINED_FUNCTION_3_3();
      OUTLINED_FUNCTION_40(v16);
      OUTLINED_FUNCTION_30_0(4.8149e-34);
      uint64_t v17 = OUTLINED_FUNCTION_21_1();
      OUTLINED_FUNCTION_6_2(v17);
      OUTLINED_FUNCTION_26_0();
      OUTLINED_FUNCTION_1_3(&dword_1C9EC7000, v18, v19, "Failed to create StartDirectActionRequestMessage for request Id: %s");
      OUTLINED_FUNCTION_7_3();
      OUTLINED_FUNCTION_1();
      OUTLINED_FUNCTION_1();
    }
    else
    {

      OUTLINED_FUNCTION_27_0();
    }
  }
  OUTLINED_FUNCTION_35();
  OUTLINED_FUNCTION_11_1();
}

void sub_1C9EDCF48()
{
  OUTLINED_FUNCTION_14_1();
  uint64_t v2 = v1;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBC7FCF8);
  uint64_t v4 = OUTLINED_FUNCTION_10_3(v3);
  MEMORY[0x1F4188790](v4);
  OUTLINED_FUNCTION_12_0();
  uint64_t v7 = v6 - v5;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC7F020);
  uint64_t v9 = OUTLINED_FUNCTION_10_3(v8);
  MEMORY[0x1F4188790](v9);
  OUTLINED_FUNCTION_12_0();
  uint64_t v12 = v11 - v10;
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC7FCF0);
  uint64_t v14 = OUTLINED_FUNCTION_10_3(v13);
  MEMORY[0x1F4188790](v14);
  OUTLINED_FUNCTION_39();
  uint64_t v15 = *MEMORY[0x1E4FA22F8];
  uint64_t v16 = sub_1C9F07A48();
  OUTLINED_FUNCTION_15();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v17 + 104))(v0, v15, v16);
  OUTLINED_FUNCTION_32_0();
  __swift_storeEnumTagSinglePayload(v18, v19, v20, v16);
  sub_1C9F06A68();
  swift_bridgeObjectRetain();
  sub_1C9F06A38();
  uint64_t v21 = sub_1C9F069B8();
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_22_0();
  v22();
  __swift_storeEnumTagSinglePayload(v12, 0, 1, v21);
  sub_1C9F06A88();
  swift_bridgeObjectRetain();
  sub_1C9F06A78();
  uint64_t v23 = sub_1C9F07A68();
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_22_0();
  v24();
  __swift_storeEnumTagSinglePayload(v7, 0, 1, v23);
  sub_1C9F06A48();
  id v25 = v2;
  sub_1C9F06A58();
  OUTLINED_FUNCTION_11_1();
}

BOOL sub_1C9EDD174()
{
  return sub_1C9EDD1DC();
}

BOOL sub_1C9EDD1DC()
{
  OUTLINED_FUNCTION_8_3();
  uint64_t v17 = v5;
  uint64_t v18 = v4;
  uint64_t v19 = v3;
  uint64_t v20 = v1;
  uint64_t v7 = OUTLINED_FUNCTION_42();
  id v8 = objc_allocWithZone((Class)v0(v7));
  uint64_t v9 = (void *)v15(v14, v16);
  if (v9)
  {
    OUTLINED_FUNCTION_31_0();
    if (qword_1EBC7F8A8 != -1) {
      swift_once();
    }
    sub_1C9ED9E50(v1, v6, qword_1EBC7FF30, *(uint64_t *)algn_1EBC7FF38);
  }
  else
  {
    if (qword_1EBC7F680 != -1) {
      swift_once();
    }
    uint64_t v10 = sub_1C9F07E78();
    __swift_project_value_buffer(v10, (uint64_t)qword_1EBC7FEF0);
    swift_bridgeObjectRetain_n();
    uint64_t v11 = (void *)sub_1C9F07E68();
    os_log_type_t v12 = sub_1C9F08168();
    if (OUTLINED_FUNCTION_21(v12))
    {
      OUTLINED_FUNCTION_7();
      uint64_t v22 = OUTLINED_FUNCTION_3_3();
      *uint64_t v2 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v21 = sub_1C9F01420(v1, v6, &v22);
      sub_1C9F08228();
      swift_bridgeObjectRelease_n();
      OUTLINED_FUNCTION_18_1(&dword_1C9EC7000);
      OUTLINED_FUNCTION_37();
      OUTLINED_FUNCTION_1();
      OUTLINED_FUNCTION_1();
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
  return v9 != 0;
}

uint64_t sub_1C9EDD3EC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  v20[1] = a5;
  v20[2] = a7;
  v20[3] = a9;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC7F020);
  MEMORY[0x1F4188790](v10 - 8);
  os_log_type_t v12 = (char *)v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC7FCF0);
  MEMORY[0x1F4188790](v13 - 8);
  uint64_t v15 = (char *)v20 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = *MEMORY[0x1E4FA22F8];
  uint64_t v17 = sub_1C9F07A48();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v17 - 8) + 104))(v15, v16, v17);
  __swift_storeEnumTagSinglePayload((uint64_t)v15, 0, 1, v17);
  sub_1C9F07688();
  swift_bridgeObjectRetain();
  sub_1C9F07668();
  uint64_t v18 = sub_1C9F069B8();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v18 - 8) + 16))(v12, a4, v18);
  __swift_storeEnumTagSinglePayload((uint64_t)v12, 0, 1, v18);
  sub_1C9F076A8();
  swift_bridgeObjectRetain();
  sub_1C9F07698();
  if (qword_1EBC7F8A8 != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  sub_1C9F07658();
  swift_bridgeObjectRetain();
  sub_1C9F07648();
  swift_bridgeObjectRetain();
  return sub_1C9F07678();
}

BOOL sub_1C9EDD640()
{
  OUTLINED_FUNCTION_46();
  swift_getObjectType();
  id v2 = objc_allocWithZone((Class)sub_1C9F07448());
  uint64_t v3 = (void *)sub_1C9F073B8();
  if (v3)
  {
    OUTLINED_FUNCTION_31_0();
    if (qword_1EBC7F8A8 != -1) {
      swift_once();
    }
    sub_1C9ED9E50(v1, v0, qword_1EBC7FF30, *(uint64_t *)algn_1EBC7FF38);
  }
  else
  {
    if (qword_1EBC7F680 != -1) {
      swift_once();
    }
    uint64_t v4 = sub_1C9F07E78();
    OUTLINED_FUNCTION_5_2(v4, (uint64_t)qword_1EBC7FEF0);
    uint64_t v5 = (void *)sub_1C9F07E68();
    os_log_type_t v6 = sub_1C9F08168();
    if (OUTLINED_FUNCTION_21(v6))
    {
      OUTLINED_FUNCTION_7();
      uint64_t v7 = OUTLINED_FUNCTION_3_3();
      OUTLINED_FUNCTION_40(v7);
      OUTLINED_FUNCTION_29_0(4.8149e-34);
      OUTLINED_FUNCTION_21_1();
      OUTLINED_FUNCTION_43();
      OUTLINED_FUNCTION_23_0();
      OUTLINED_FUNCTION_26_0();
      OUTLINED_FUNCTION_1_3(&dword_1C9EC7000, v8, v9, "Failed to create DirectActionResultCandidateMessage for request Id: %s");
      OUTLINED_FUNCTION_7_3();
      OUTLINED_FUNCTION_1();
      OUTLINED_FUNCTION_1();
    }
    else
    {

      OUTLINED_FUNCTION_27_0();
    }
  }
  return v3 != 0;
}

uint64_t sub_1C9EDD834(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  uint64_t v27 = a7;
  uint64_t v28 = a8;
  uint64_t v25 = a4;
  uint64_t v26 = a5;
  uint64_t v29 = a10;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC7FD70);
  MEMORY[0x1F4188790](v10 - 8);
  os_log_type_t v12 = (char *)&v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC7F020);
  MEMORY[0x1F4188790](v13 - 8);
  uint64_t v15 = (char *)&v24 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC7FCF0);
  MEMORY[0x1F4188790](v16 - 8);
  uint64_t v18 = (char *)&v24 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = *MEMORY[0x1E4FA22F8];
  uint64_t v20 = sub_1C9F07A48();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v20 - 8) + 104))(v18, v19, v20);
  __swift_storeEnumTagSinglePayload((uint64_t)v18, 0, 1, v20);
  sub_1C9F07408();
  swift_bridgeObjectRetain();
  sub_1C9F073E8();
  uint64_t v21 = sub_1C9F069B8();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v21 - 8) + 16))(v15, v25, v21);
  __swift_storeEnumTagSinglePayload((uint64_t)v15, 0, 1, v21);
  sub_1C9F07438();
  swift_bridgeObjectRetain();
  sub_1C9F07428();
  if (qword_1EBC7F8A8 != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  sub_1C9F073D8();
  swift_bridgeObjectRetain();
  sub_1C9F073C8();
  swift_bridgeObjectRetain();
  sub_1C9F073F8();
  uint64_t v22 = sub_1C9F07C98();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v22 - 8) + 16))(v12, v29, v22);
  __swift_storeEnumTagSinglePayload((uint64_t)v12, 0, 1, v22);
  return sub_1C9F07418();
}

BOOL sub_1C9EDDB2C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5)
{
  return sub_1C9EDDB98(a1, a2, a3, a4, a5, MEMORY[0x1E4FA2210], (uint64_t)sub_1C9EDEA94, MEMORY[0x1E4FA2208]);
}

BOOL sub_1C9EDDB98(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5, uint64_t (*a6)(void), uint64_t a7, uint64_t (*a8)(uint64_t, void *))
{
  v19[2] = a1;
  v19[3] = a2;
  v19[4] = a3;
  v19[5] = a4;
  v19[6] = a5;
  v19[7] = swift_getObjectType();
  id v13 = objc_allocWithZone((Class)a6(0));
  uint64_t v14 = (void *)a8(a7, v19);
  if (v14)
  {
    OUTLINED_FUNCTION_31_0();
    if (qword_1EBC7F8A8 != -1) {
      swift_once();
    }
    sub_1C9ED9E6C(a4, a5, qword_1EBC7FF30, *(uint64_t *)algn_1EBC7FF38);
  }
  else
  {
    if (qword_1EBC7F680 != -1) {
      swift_once();
    }
    uint64_t v15 = sub_1C9F07E78();
    OUTLINED_FUNCTION_5_2(v15, (uint64_t)qword_1EBC7FEF0);
    uint64_t v16 = (void *)sub_1C9F07E68();
    os_log_type_t v17 = sub_1C9F08168();
    if (OUTLINED_FUNCTION_21(v17))
    {
      OUTLINED_FUNCTION_7();
      uint64_t v20 = OUTLINED_FUNCTION_3_3();
      OUTLINED_FUNCTION_44(4.8149e-34);
      v19[8] = sub_1C9F01420(a4, a5, &v20);
      sub_1C9F08228();
      OUTLINED_FUNCTION_26_0();
      OUTLINED_FUNCTION_18_1(&dword_1C9EC7000);
      OUTLINED_FUNCTION_37();
      OUTLINED_FUNCTION_1();
      OUTLINED_FUNCTION_1();
    }
    else
    {

      OUTLINED_FUNCTION_27_0();
    }
  }
  return v14 != 0;
}

void sub_1C9EDDD9C()
{
  OUTLINED_FUNCTION_14_1();
  OUTLINED_FUNCTION_46();
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC7F020);
  uint64_t v1 = OUTLINED_FUNCTION_10_3(v0);
  MEMORY[0x1F4188790](v1);
  OUTLINED_FUNCTION_20_1();
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC7FCF0);
  uint64_t v3 = OUTLINED_FUNCTION_10_3(v2);
  MEMORY[0x1F4188790](v3);
  OUTLINED_FUNCTION_12_0();
  uint64_t v6 = v5 - v4;
  uint64_t v7 = *MEMORY[0x1E4FA22F8];
  uint64_t v8 = sub_1C9F07A48();
  OUTLINED_FUNCTION_15();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 104))(v6, v7, v8);
  OUTLINED_FUNCTION_32_0();
  __swift_storeEnumTagSinglePayload(v10, v11, v12, v8);
  sub_1C9F06B68();
  swift_bridgeObjectRetain();
  sub_1C9F06B28();
  uint64_t v13 = sub_1C9F069B8();
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_22_0();
  v14();
  OUTLINED_FUNCTION_32_0();
  __swift_storeEnumTagSinglePayload(v15, v16, v17, v13);
  sub_1C9F06B88();
  swift_bridgeObjectRetain();
  sub_1C9F06B78();
  if (qword_1EBC7F8A8 != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  sub_1C9F06B58();
  sub_1C9F06B38();
  sub_1C9F06B48();
  OUTLINED_FUNCTION_11_1();
}

void sub_1C9EDDF84()
{
  OUTLINED_FUNCTION_14_1();
  OUTLINED_FUNCTION_47();
  uint64_t v1 = v0;
  uint64_t v3 = v2;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC7F020);
  uint64_t v5 = OUTLINED_FUNCTION_10_3(v4);
  MEMORY[0x1F4188790](v5);
  OUTLINED_FUNCTION_12_0();
  uint64_t v21 = v7 - v6;
  id v8 = objc_allocWithZone((Class)sub_1C9F07548());
  uint64_t v9 = (void *)sub_1C9F074C8();
  uint64_t v10 = v9;
  if (v9)
  {
    sub_1C9ED0FAC(v9);
    sub_1C9F069B8();
    OUTLINED_FUNCTION_15();
    OUTLINED_FUNCTION_16_2();
    v11();
    char v20 = OUTLINED_FUNCTION_25_0(v21);
    char v19 = AFShouldRunAsrOnServerForUOD();
    OUTLINED_FUNCTION_15_2();
    swift_bridgeObjectRetain();
    char v12 = OUTLINED_FUNCTION_45();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_15_2();
    swift_bridgeObjectRetain();
    char v13 = sub_1C9F07DE8();
    swift_bridgeObjectRelease();
    sub_1C9ED91A4(v21, v3, (uint64_t)v1, 3, v20, v19, v12 & 1, v13 & 1, 0);

    sub_1C9EDAF2C(v21);
  }
  else
  {
    if (qword_1EBC7F680 != -1) {
      swift_once();
    }
    uint64_t v14 = sub_1C9F07E78();
    __swift_project_value_buffer(v14, (uint64_t)qword_1EBC7FEF0);
    swift_bridgeObjectRetain_n();
    uint64_t v15 = (void *)sub_1C9F07E68();
    os_log_type_t v16 = sub_1C9F08168();
    if (OUTLINED_FUNCTION_21(v16))
    {
      OUTLINED_FUNCTION_7();
      uint64_t v22 = OUTLINED_FUNCTION_3_3();
      _DWORD *v1 = 136315138;
      swift_bridgeObjectRetain();
      sub_1C9F01420(v3, (unint64_t)v1, &v22);
      OUTLINED_FUNCTION_23_0();
      swift_bridgeObjectRelease_n();
      OUTLINED_FUNCTION_1_3(&dword_1C9EC7000, v17, v18, "Failed to create StartCorrectedSpeechRequestMessage for request Id: %s");
      OUTLINED_FUNCTION_7_3();
      OUTLINED_FUNCTION_1();
      OUTLINED_FUNCTION_1();
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
  OUTLINED_FUNCTION_11_1();
}

uint64_t sub_1C9EDE2C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  uint64_t v27 = a5;
  uint64_t v28 = a7;
  uint64_t v26 = a4;
  id v29 = a10;
  uint64_t v30 = a8;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBC7FCF8);
  MEMORY[0x1F4188790](v10 - 8);
  char v12 = (char *)&v25 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC7F020);
  MEMORY[0x1F4188790](v13 - 8);
  uint64_t v15 = (char *)&v25 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC7FCF0);
  MEMORY[0x1F4188790](v16 - 8);
  uint64_t v18 = (char *)&v25 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = *MEMORY[0x1E4FA22F8];
  uint64_t v20 = sub_1C9F07A48();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v20 - 8) + 104))(v18, v19, v20);
  __swift_storeEnumTagSinglePayload((uint64_t)v18, 0, 1, v20);
  sub_1C9F07518();
  swift_bridgeObjectRetain();
  sub_1C9F074D8();
  uint64_t v21 = sub_1C9F069B8();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v21 - 8) + 16))(v15, v26, v21);
  __swift_storeEnumTagSinglePayload((uint64_t)v15, 0, 1, v21);
  sub_1C9F07538();
  swift_bridgeObjectRetain();
  sub_1C9F07528();
  uint64_t v22 = sub_1C9F07A68();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v22 - 8) + 16))(v12, v28, v22);
  __swift_storeEnumTagSinglePayload((uint64_t)v12, 0, 1, v22);
  sub_1C9F074E8();
  swift_bridgeObjectRetain();
  sub_1C9F074F8();
  id v23 = v29;
  return sub_1C9F07508();
}

BOOL sub_1C9EDE570()
{
  return sub_1C9EDE5D0();
}

BOOL sub_1C9EDE5D0()
{
  OUTLINED_FUNCTION_8_3();
  uint64_t v21 = v5;
  uint64_t v22 = v4;
  uint64_t v23 = v3;
  uint64_t v24 = v1;
  uint64_t v7 = OUTLINED_FUNCTION_42();
  id v8 = objc_allocWithZone((Class)v0(v7));
  uint64_t v9 = (void *)v19(v18, v20);
  if (v9)
  {
    OUTLINED_FUNCTION_31_0();
    if (qword_1EBC7F8A8 != -1) {
      swift_once();
    }
    sub_1C9ED9E50(v1, v6, qword_1EBC7FF30, *(uint64_t *)algn_1EBC7FF38);
  }
  else
  {
    if (qword_1EBC7F680 != -1) {
      swift_once();
    }
    uint64_t v10 = sub_1C9F07E78();
    __swift_project_value_buffer(v10, (uint64_t)qword_1EBC7FEF0);
    swift_bridgeObjectRetain_n();
    uint64_t v11 = (void *)sub_1C9F07E68();
    os_log_type_t v12 = sub_1C9F08168();
    if (OUTLINED_FUNCTION_21(v12))
    {
      OUTLINED_FUNCTION_7();
      uint64_t v13 = OUTLINED_FUNCTION_3_3();
      OUTLINED_FUNCTION_40(v13);
      *uint64_t v2 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v14 = sub_1C9F01420(v1, v6, &v25);
      OUTLINED_FUNCTION_6_2(v14);
      swift_bridgeObjectRelease_n();
      OUTLINED_FUNCTION_1_3(&dword_1C9EC7000, v15, v16, "Failed to create TextBasedResultCandidateMessage for request Id: %s");
      OUTLINED_FUNCTION_7_3();
      OUTLINED_FUNCTION_1();
      OUTLINED_FUNCTION_1();
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
  return v9 != 0;
}

void sub_1C9EDE7CC()
{
  OUTLINED_FUNCTION_14_1();
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC7FD70);
  uint64_t v2 = OUTLINED_FUNCTION_10_3(v1);
  MEMORY[0x1F4188790](v2);
  OUTLINED_FUNCTION_39();
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC7F020);
  uint64_t v4 = OUTLINED_FUNCTION_10_3(v3);
  MEMORY[0x1F4188790](v4);
  OUTLINED_FUNCTION_12_0();
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC7FCF0);
  uint64_t v6 = OUTLINED_FUNCTION_10_3(v5);
  MEMORY[0x1F4188790](v6);
  OUTLINED_FUNCTION_20_1();
  uint64_t v7 = *MEMORY[0x1E4FA22F8];
  uint64_t v8 = sub_1C9F07A48();
  OUTLINED_FUNCTION_15();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 104))(v0, v7, v8);
  OUTLINED_FUNCTION_32_0();
  __swift_storeEnumTagSinglePayload(v10, v11, v12, v8);
  sub_1C9F07238();
  swift_bridgeObjectRetain();
  sub_1C9F07228();
  uint64_t v13 = sub_1C9F069B8();
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_22_0();
  v14();
  OUTLINED_FUNCTION_32_0();
  __swift_storeEnumTagSinglePayload(v15, v16, v17, v13);
  sub_1C9F07268();
  swift_bridgeObjectRetain();
  sub_1C9F07258();
  if (qword_1EBC7F8A8 != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  sub_1C9F07218();
  swift_bridgeObjectRetain();
  sub_1C9F07278();
  uint64_t v18 = sub_1C9F07C98();
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_22_0();
  v19();
  OUTLINED_FUNCTION_32_0();
  __swift_storeEnumTagSinglePayload(v20, v21, v22, v18);
  sub_1C9F07248();
  OUTLINED_FUNCTION_11_1();
}

uint64_t sub_1C9EDEA48()
{
  return sub_1C9EDEB94();
}

uint64_t sub_1C9EDEA60(uint64_t a1)
{
  return sub_1C9EDB5C8(a1, *(void *)(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32), *(void *)(v1 + 40), *(void *)(v1 + 48), *(void *)(v1 + 56), *(void **)(v1 + 64), *(void *)(v1 + 72));
}

uint64_t sub_1C9EDEA9C()
{
  OUTLINED_FUNCTION_33();
  return sub_1C9EDE2C8(v0, v1, v2, v3, v4, v5, v6, v7, v9, v10);
}

void sub_1C9EDEAC0()
{
}

uint64_t sub_1C9EDEAE4(uint64_t a1)
{
  return sub_1C9EDEC60(a1, (uint64_t (*)(uint64_t, void, void, void, void, void, void, void, void, void))sub_1C9EDD3EC);
}

uint64_t sub_1C9EDEAFC()
{
  __n128 v0 = OUTLINED_FUNCTION_41();
  return sub_1C9EDD834(v1, v2, v3, v4, v5, v6, v7, v8, v0.n128_i64[0], v0.n128_i64[1]);
}

void sub_1C9EDEB30()
{
}

void sub_1C9EDEB54()
{
}

uint64_t sub_1C9EDEB7C()
{
  return sub_1C9EDEB94();
}

uint64_t sub_1C9EDEB94()
{
  OUTLINED_FUNCTION_41();
  return v3(v0, v1, v2);
}

uint64_t sub_1C9EDEBCC(uint64_t a1)
{
  return sub_1C9EDBDC4(a1, v1[2], v1[3], v1[4], v1[5], v1[6], v1[7]);
}

uint64_t sub_1C9EDEBE0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC7FD70);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1C9EDEC48(uint64_t a1)
{
  return sub_1C9EDEC60(a1, (uint64_t (*)(uint64_t, void, void, void, void, void, void, void, void, void))sub_1C9EDB968);
}

uint64_t sub_1C9EDEC60(uint64_t a1, uint64_t (*a2)(uint64_t, void, void, void, void, void, void, void, void, void))
{
  return a2(a1, v2[2], v2[3], v2[4], v2[5], v2[6], v2[7], v2[8], v2[9], v2[10]);
}

void OUTLINED_FUNCTION_1_3(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v6, a4, v5, 0xCu);
}

uint64_t OUTLINED_FUNCTION_3_3()
{
  return swift_slowAlloc();
}

uint64_t OUTLINED_FUNCTION_5_2(uint64_t a1, uint64_t a2)
{
  __swift_project_value_buffer(a1, a2);
  return swift_bridgeObjectRetain_n();
}

uint64_t OUTLINED_FUNCTION_6_2(uint64_t a1)
{
  *(void *)(v1 - 96) = a1;
  return sub_1C9F08228();
}

uint64_t OUTLINED_FUNCTION_7_3()
{
  return swift_arrayDestroy();
}

uint64_t OUTLINED_FUNCTION_8_3()
{
  return swift_getObjectType();
}

uint64_t OUTLINED_FUNCTION_9_3()
{
  return sub_1C9F07DE8();
}

uint64_t OUTLINED_FUNCTION_10_3(uint64_t a1)
{
  return a1 - 8;
}

uint64_t OUTLINED_FUNCTION_14_2()
{
  *(void *)(v7 - 160) = v6;
  *(void *)(v7 - 152) = v4;
  *(void *)(v7 - 144) = v5;
  *(void *)(v7 - 136) = v3;
  *(void *)(v7 - 128) = v2;
  *(void *)(v7 - 120) = v1;
  *(void *)(v7 - 112) = v0;
  return 0;
}

void *OUTLINED_FUNCTION_15_2()
{
  return __swift_project_boxed_opaque_existential_1(v0, v0[3]);
}

void OUTLINED_FUNCTION_17_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  int v16 = *(_DWORD *)(v14 - 196);
  sub_1C9ED91A4(v12, v11, v10, 2, v16, 0, v13 & 1, v9 & 1, a9);
}

void OUTLINED_FUNCTION_18_1(void *a1)
{
  _os_log_impl(a1, v1, v3, v4, v2, 0xCu);
}

uint64_t OUTLINED_FUNCTION_21_1()
{
  return sub_1C9F01420(v1, v0, (uint64_t *)(v2 - 88));
}

uint64_t OUTLINED_FUNCTION_23_0()
{
  return sub_1C9F08228();
}

uint64_t OUTLINED_FUNCTION_25_0(uint64_t a1)
{
  __swift_storeEnumTagSinglePayload(a1, 0, 1, v1);
  return AFDeviceSupportsSiriUOD();
}

uint64_t OUTLINED_FUNCTION_26_0()
{
  return swift_bridgeObjectRelease_n();
}

uint64_t OUTLINED_FUNCTION_27_0()
{
  return swift_bridgeObjectRelease_n();
}

uint64_t OUTLINED_FUNCTION_28_0()
{
  return sub_1C9F07DE8();
}

uint64_t OUTLINED_FUNCTION_29_0(float a1)
{
  float *v1 = a1;
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_30_0(float a1)
{
  float *v1 = a1;
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_31_0()
{
  return sub_1C9ED0FAC(v0);
}

uint64_t OUTLINED_FUNCTION_34@<X0>(uint64_t a1@<X8>)
{
  *(void *)(v2 - 192) = *(void *)(v1 + a1);
  return sub_1C9F069B8();
}

BOOL OUTLINED_FUNCTION_35()
{
  return v0 != 0;
}

uint64_t OUTLINED_FUNCTION_36()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_37()
{
  return swift_arrayDestroy();
}

uint64_t OUTLINED_FUNCTION_38()
{
  __swift_project_boxed_opaque_existential_1(v0, v0[3]);
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_40(uint64_t result)
{
  *(void *)(v1 - 88) = result;
  return result;
}

__n128 OUTLINED_FUNCTION_41()
{
  return *(__n128 *)(v0 + 72);
}

uint64_t OUTLINED_FUNCTION_42()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_44(float a1)
{
  float *v1 = a1;
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_45()
{
  return sub_1C9F07DE8();
}

void *OUTLINED_FUNCTION_48@<X0>(uint64_t a1@<X8>)
{
  *(void *)(v3 - 184) = v2;
  return __swift_project_boxed_opaque_existential_1((void *)(v1 + a1), *(void *)(v1 + a1 + 24));
}

uint64_t sub_1C9EDF1A8(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);
  return swift_release();
}

uint64_t sub_1C9EDF1EC(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_1C9EDF214(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))();
}

void sub_1C9EDF23C()
{
  qword_1EBC7FF30 = 48;
  *(void *)algn_1EBC7FF38 = 0xE100000000000000;
}

uint64_t sub_1C9EDF254(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (void *)(v2 + OBJC_IVAR___SRDRequestDispatcherInternal_siriInputLocale);
  *uint64_t v3 = a1;
  v3[1] = a2;
  return swift_bridgeObjectRelease();
}

char *RequestDispatcher.__allocating_init(requestDispatcherServiceHelper:bridgeConnectionListeners:)(uint64_t a1, uint64_t a2)
{
  id v4 = objc_allocWithZone((Class)OUTLINED_FUNCTION_349());
  sub_1C9F07CD8();
  swift_allocObject();
  uint64_t v5 = (void *)sub_1C9F07CC8();
  uint64_t v6 = sub_1C9EF924C(v2, a2, v5);
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v6;
}

char *RequestDispatcher.init(requestDispatcherServiceHelper:bridgeConnectionListeners:)()
{
  OUTLINED_FUNCTION_274();
  sub_1C9F07CD8();
  swift_allocObject();
  sub_1C9F07CC8();
  uint64_t v0 = OUTLINED_FUNCTION_195();
  uint64_t v3 = sub_1C9EF924C(v0, v1, v2);
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v3;
}

uint64_t sub_1C9EDF43C(uint64_t a1, void *a2)
{
  swift_getObjectType();
  sub_1C9ECFD44();
  sub_1C9F07CE8();
  char v3 = AFDeviceSupportsSiriUOD();
  char v4 = AFDeviceSupportsHybridUOD();
  char v5 = AFOfflineDictationCapable();
  char v6 = AFDeviceSupportsBobble();
  char v7 = AFIsInternalInstall();
  char v8 = AFDeviceSupportsMedoc();
  sub_1C9F07E38();
  char v9 = sub_1C9F07E28();
  sub_1C9EDF55C(a2, v3, v4, v5, v6, v7, v8, v9 & 1);
  sub_1C9EE0F28();
  return swift_bridgeObjectRelease();
}

char *sub_1C9EDF55C(void *a1, char a2, char a3, char a4, char a5, char a6, char a7, char a8)
{
  char v8 = a8;
  char v10 = a5;
  if (a2 & 1) != 0 || (a3)
  {
    uint64_t v14 = sub_1C9EF8850(0, 1, 1, MEMORY[0x1E4FBC860]);
    unint64_t v18 = *((void *)v14 + 2);
    unint64_t v17 = *((void *)v14 + 3);
    char v84 = a6;
    if (v18 >= v17 >> 1) {
      uint64_t v14 = sub_1C9EF8850((char *)(v17 > 1), v18 + 1, 1, (uint64_t)v14);
    }
    uint64_t v19 = sub_1C9F069F8();
    uint64_t v20 = sub_1C9EFBB30((unint64_t *)&unk_1EBC7F990, MEMORY[0x1E4F50E90]);
    *((void *)v14 + 2) = v18 + 1;
    uint64_t v21 = &v14[40 * v18];
    *((void *)v21 + 4) = 19534;
    *((void *)v21 + 5) = 0xE200000000000000;
    *((void *)v21 + 6) = v19;
    *((void *)v21 + 7) = v20;
    v21[64] = 0;
    __swift_project_boxed_opaque_existential_1(a1, a1[3]);
    if ((sub_1C9F07D68() & 1) == 0) {
      goto LABEL_13;
    }
    unint64_t v23 = *((void *)v14 + 2);
    unint64_t v22 = *((void *)v14 + 3);
    if (v23 >= v22 >> 1) {
      uint64_t v14 = sub_1C9EF8850((char *)(v22 > 1), v23 + 1, 1, (uint64_t)v14);
    }
    uint64_t v24 = sub_1C9F069E8();
    uint64_t v25 = sub_1C9EFBB30((unint64_t *)&unk_1EBC7FEA8, MEMORY[0x1E4F50E88]);
    *((void *)v14 + 2) = v23 + 1;
    uint64_t v26 = &v14[40 * v23];
    *((void *)v26 + 4) = 0x726574756F524C4ELL;
    *((void *)v26 + 5) = 0xE800000000000000;
    *((void *)v26 + 6) = v24;
    *((void *)v26 + 7) = v25;
    v26[64] = 0;
    __swift_project_boxed_opaque_existential_1(a1, a1[3]);
    if (sub_1C9F07D28())
    {
      unint64_t v28 = *((void *)v14 + 2);
      unint64_t v27 = *((void *)v14 + 3);
      char v8 = a8;
      if (v28 >= v27 >> 1) {
        uint64_t v14 = sub_1C9EF8850((char *)(v27 > 1), v28 + 1, 1, (uint64_t)v14);
      }
      char v10 = a5;
      uint64_t v29 = sub_1C9F07E48();
      uint64_t v30 = sub_1C9EFBB30(&qword_1EBC7FED0, MEMORY[0x1E4F96288]);
      *((void *)v14 + 2) = v28 + 1;
      uint64_t v31 = &v14[40 * v28];
      *((void *)v31 + 4) = 0xD000000000000010;
      *((void *)v31 + 5) = 0x80000001C9F0ADD0;
      *((void *)v31 + 6) = v29;
      *((void *)v31 + 7) = v30;
      v31[64] = 0;
    }
    else
    {
LABEL_13:
      char v8 = a8;
      char v10 = a5;
    }
    unint64_t v33 = *((void *)v14 + 2);
    unint64_t v32 = *((void *)v14 + 3);
    unint64_t v34 = v33 + 1;
    if (v33 >= v32 >> 1) {
      uint64_t v14 = sub_1C9EF8850((char *)(v32 > 1), v33 + 1, 1, (uint64_t)v14);
    }
    uint64_t v35 = sub_1C9F07CB8();
    uint64_t v36 = sub_1C9EFBB30(&qword_1EBC7FD88, MEMORY[0x1E4F9FE30]);
    *((void *)v14 + 2) = v34;
    int v37 = &v14[40 * v33];
    *((void *)v37 + 4) = 0x53454D4D4F50;
    *((void *)v37 + 5) = 0xE600000000000000;
    *((void *)v37 + 6) = v35;
    *((void *)v37 + 7) = v36;
    v37[64] = 0;
    if (a2)
    {
      unint64_t v38 = *((void *)v14 + 3);
      unint64_t v39 = v33 + 2;
      if (v34 >= v38 >> 1) {
        uint64_t v14 = sub_1C9EF8850((char *)(v38 > 1), v33 + 2, 1, (uint64_t)v14);
      }
      uint64_t v40 = sub_1C9F069C8();
      uint64_t v41 = sub_1C9EFBB30(&qword_1EBC7F980, MEMORY[0x1E4F9FD68]);
      *((void *)v14 + 2) = v39;
      int v42 = &v14[40 * v34];
      *((void *)v42 + 4) = 0x6C66726574747542;
      *((void *)v42 + 5) = 0xE900000000000079;
      *((void *)v42 + 6) = v40;
      *((void *)v42 + 7) = v41;
      v42[64] = 0;
    }
    if (a7)
    {
      unint64_t v44 = *((void *)v14 + 2);
      unint64_t v43 = *((void *)v14 + 3);
      unint64_t v45 = v44 + 1;
      if (v44 >= v43 >> 1) {
        uint64_t v14 = sub_1C9EF8850((char *)(v43 > 1), v44 + 1, 1, (uint64_t)v14);
      }
      uint64_t v46 = sub_1C9F07E18();
      uint64_t v47 = sub_1C9EFBB30(&qword_1EBC7FD90, MEMORY[0x1E4F96278]);
      *((void *)v14 + 2) = v45;
      int v48 = &v14[40 * v44];
      *((void *)v48 + 4) = 0xD000000000000011;
      *((void *)v48 + 5) = 0x80000001C9F0ADB0;
      *((void *)v48 + 6) = v46;
      *((void *)v48 + 7) = v47;
      v48[64] = 0;
      unint64_t v49 = *((void *)v14 + 3);
      unint64_t v50 = v44 + 2;
      if (v45 >= v49 >> 1) {
        uint64_t v14 = sub_1C9EF8850((char *)(v49 > 1), v44 + 2, 1, (uint64_t)v14);
      }
      uint64_t v51 = sub_1C9F069D8();
      uint64_t v52 = sub_1C9EFBB30(&qword_1EBC7F988, MEMORY[0x1E4FA5018]);
      *((void *)v14 + 2) = v50;
      int v53 = &v14[40 * v45];
      *((void *)v53 + 4) = 18773;
      *((void *)v53 + 5) = 0xE200000000000000;
      *((void *)v53 + 6) = v51;
      *((void *)v53 + 7) = v52;
      v53[64] = 1;
    }
    a6 = v84;
  }
  else
  {
    uint64_t v14 = (char *)MEMORY[0x1E4FBC860];
  }
  uint64_t v54 = sub_1C9EDFEC0(a6 & 1);
  if (v54)
  {
    uint64_t v56 = v54;
    uint64_t v57 = v55;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v14 = sub_1C9EF8850(0, *((void *)v14 + 2) + 1, 1, (uint64_t)v14);
    }
    unint64_t v59 = *((void *)v14 + 2);
    unint64_t v58 = *((void *)v14 + 3);
    if (v59 >= v58 >> 1) {
      uint64_t v14 = sub_1C9EF8850((char *)(v58 > 1), v59 + 1, 1, (uint64_t)v14);
    }
    *((void *)v14 + 2) = v59 + 1;
    os_log_type_t v60 = &v14[40 * v59];
    *((void *)v60 + 4) = 5526357;
    *((void *)v60 + 5) = 0xE300000000000000;
    *((void *)v60 + 6) = v56;
    *((void *)v60 + 7) = v57;
    v60[64] = 0;
  }
  if (a2 & 1) != 0 || (a4 & 1) != 0 || (a3)
  {
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v14 = sub_1C9EF8850(0, *((void *)v14 + 2) + 1, 1, (uint64_t)v14);
    }
    unint64_t v62 = *((void *)v14 + 2);
    unint64_t v61 = *((void *)v14 + 3);
    if (v62 >= v61 >> 1) {
      uint64_t v14 = sub_1C9EF8850((char *)(v61 > 1), v62 + 1, 1, (uint64_t)v14);
    }
    uint64_t v63 = sub_1C9F07F68();
    uint64_t v64 = sub_1C9EFBB30(&qword_1EBC7F8C8, MEMORY[0x1E4F47888]);
    *((void *)v14 + 2) = v62 + 1;
    uint64_t v65 = &v14[40 * v62];
    *((void *)v65 + 4) = 5395265;
    *((void *)v65 + 5) = 0xE300000000000000;
    *((void *)v65 + 6) = v63;
    *((void *)v65 + 7) = v64;
    v65[64] = 0;
  }
  if (v10)
  {
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v14 = sub_1C9EF8850(0, *((void *)v14 + 2) + 1, 1, (uint64_t)v14);
    }
    unint64_t v67 = *((void *)v14 + 2);
    unint64_t v66 = *((void *)v14 + 3);
    if (v67 >= v66 >> 1) {
      uint64_t v14 = sub_1C9EF8850((char *)(v66 > 1), v67 + 1, 1, (uint64_t)v14);
    }
    uint64_t v68 = sub_1C9F07CA8();
    uint64_t v69 = sub_1C9EFBB30(&qword_1EBC7F950, MEMORY[0x1E4F9FD58]);
    *((void *)v14 + 2) = v67 + 1;
    os_log_type_t v70 = &v14[40 * v67];
    *((void *)v70 + 4) = 0x65727574736547;
    *((void *)v70 + 5) = 0xE700000000000000;
    *((void *)v70 + 6) = v68;
    *((void *)v70 + 7) = v69;
    v70[64] = 0;
  }
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v14 = sub_1C9EF8850(0, *((void *)v14 + 2) + 1, 1, (uint64_t)v14);
  }
  unint64_t v72 = *((void *)v14 + 2);
  unint64_t v71 = *((void *)v14 + 3);
  unint64_t v73 = v72 + 1;
  if (v72 >= v71 >> 1) {
    uint64_t v14 = sub_1C9EF8850((char *)(v71 > 1), v72 + 1, 1, (uint64_t)v14);
  }
  uint64_t v74 = sub_1C9F06A08();
  uint64_t v75 = sub_1C9EFBB30(&qword_1EBC7F9A0, MEMORY[0x1E4FA2008]);
  *((void *)v14 + 2) = v73;
  uint64_t v76 = &v14[40 * v72];
  strcpy(v76 + 32, "Conversation");
  v76[45] = 0;
  *((_WORD *)v76 + 23) = -5120;
  *((void *)v76 + 6) = v74;
  *((void *)v76 + 7) = v75;
  v76[64] = 0;
  if (v8)
  {
    unint64_t v77 = *((void *)v14 + 3);
    unint64_t v78 = v72 + 2;
    if (v73 >= v77 >> 1) {
      uint64_t v14 = sub_1C9EF8850((char *)(v77 > 1), v72 + 2, 1, (uint64_t)v14);
    }
    uint64_t v79 = sub_1C9F07E38();
    uint64_t v80 = sub_1C9EFBB30(&qword_1EBC7FEB8, MEMORY[0x1E4F96280]);
    *((void *)v14 + 2) = v78;
    uint64_t v81 = &v14[40 * v73];
    *((void *)v81 + 4) = 0x657261727543;
    *((void *)v81 + 5) = 0xE600000000000000;
    *((void *)v81 + 6) = v79;
    *((void *)v81 + 7) = v80;
    v81[64] = 0;
  }
  return v14;
}

id sub_1C9EDFE4C()
{
  id v0 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  uint64_t v1 = (void *)sub_1C9F07FD8();
  swift_bridgeObjectRelease();
  id v2 = objc_msgSend(v0, sel_initWithPath_, v1);

  return v2;
}

uint64_t sub_1C9EDFEC0(char a1)
{
  if (qword_1EBC7F680 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_1C9F07E78();
  __swift_project_value_buffer(v2, (uint64_t)qword_1EBC7FEF0);
  char v3 = sub_1C9F07E68();
  os_log_type_t v4 = sub_1C9F08188();
  if (os_log_type_enabled(v3, v4))
  {
    char v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)char v5 = 0;
    _os_log_impl(&dword_1C9EC7000, v3, v4, "Attempting to load the USTBridge framework.", v5, 2u);
    MEMORY[0x1CB795290](v5, -1, -1);
  }

  if ((a1 & 1) == 0)
  {
    char v7 = sub_1C9F07E68();
    os_log_type_t v14 = sub_1C9F08188();
    if (os_log_type_enabled(v7, v14))
    {
      uint64_t v15 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v15 = 0;
      int v16 = "Not loading USTBridge in an external build.";
LABEL_16:
      _os_log_impl(&dword_1C9EC7000, v7, v14, v16, v15, 2u);
      MEMORY[0x1CB795290](v15, -1, -1);
    }
LABEL_23:
    uint64_t v10 = 0;
    goto LABEL_24;
  }
  sub_1C9ECF370(0, &qword_1EBC7FE08);
  char v6 = sub_1C9EDFE4C();
  if (!v6)
  {
    char v7 = sub_1C9F07E68();
    os_log_type_t v14 = sub_1C9F08168();
    if (os_log_type_enabled(v7, v14))
    {
      uint64_t v15 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v15 = 0;
      int v16 = "Can't locate the USTBridge framework.";
      goto LABEL_16;
    }
    goto LABEL_23;
  }
  char v7 = v6;
  if (![v6 principalClass])
  {
    unint64_t v17 = sub_1C9F07E68();
    os_log_type_t v18 = sub_1C9F08168();
    if (os_log_type_enabled(v17, v18))
    {
      uint64_t v19 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v19 = 0;
      uint64_t v20 = "USTBridge bundle didn't have a principal class.";
LABEL_21:
      _os_log_impl(&dword_1C9EC7000, v17, v18, v20, v19, 2u);
      MEMORY[0x1CB795290](v19, -1, -1);
    }
LABEL_22:

    goto LABEL_23;
  }
  uint64_t ObjCClassMetadata = swift_getObjCClassMetadata();
  uint64_t v9 = dynamic_cast_existential_1_conditional(ObjCClassMetadata);
  if (!v9)
  {
    unint64_t v17 = sub_1C9F07E68();
    os_log_type_t v18 = sub_1C9F08168();
    if (os_log_type_enabled(v17, v18))
    {
      uint64_t v19 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v19 = 0;
      uint64_t v20 = "USTBridge's principal class had unexpected type.";
      goto LABEL_21;
    }
    goto LABEL_22;
  }
  uint64_t v10 = v9;
  uint64_t v11 = sub_1C9F07E68();
  os_log_type_t v12 = sub_1C9F08188();
  if (os_log_type_enabled(v11, v12))
  {
    char v13 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)char v13 = 0;
    _os_log_impl(&dword_1C9EC7000, v11, v12, "Successfully loaded the USTBridge class.", v13, 2u);
    MEMORY[0x1CB795290](v13, -1, -1);
  }

LABEL_24:
  return v10;
}

void sub_1C9EE021C()
{
  OUTLINED_FUNCTION_14_1();
  uint64_t v99 = v0;
  unint64_t isUniquelyReferenced_nonNull_native = v1;
  uint64_t v4 = v3;
  uint64_t v106 = sub_1C9F081A8();
  OUTLINED_FUNCTION_15();
  MEMORY[0x1F4188790](v5);
  OUTLINED_FUNCTION_193(v6, v95[0]);
  uint64_t v105 = sub_1C9F081C8();
  OUTLINED_FUNCTION_0();
  uint64_t v8 = v7;
  MEMORY[0x1F4188790](v9);
  uint64_t v104 = (char *)v95 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = OUTLINED_FUNCTION_95();
  uint64_t v12 = OUTLINED_FUNCTION_10_3(v11);
  MEMORY[0x1F4188790](v12);
  OUTLINED_FUNCTION_98(v13, v95[0]);
  v95[2] = sub_1C9F07E58();
  OUTLINED_FUNCTION_0();
  v95[1] = v14;
  MEMORY[0x1F4188790](v15);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_115(v16);
  v95[3] = v4;
  int64_t v17 = *(void *)(v4 + 16);
  uint64_t v18 = MEMORY[0x1E4FBC860];
  sub_1C9EF8948(0, v17, 0, MEMORY[0x1E4FBC860]);
  swift_bridgeObjectRelease();
  int64_t v112 = v17;
  uint64_t v109 = sub_1C9EF874C(0, v17, 0, v18, &qword_1EBC7FE78, (void (*)(void, uint64_t, void *, uint64_t))sub_1C9EF8A40, (void (*)(uint64_t, uint64_t, void *))sub_1C9EF8F00);
  if (isUniquelyReferenced_nonNull_native >> 62) {
    goto LABEL_54;
  }
  id v19 = *(id *)((isUniquelyReferenced_nonNull_native & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  while (1)
  {
    uint64_t v107 = v8;
    uint64_t v20 = (void *)MEMORY[0x1E4FBC868];
    if (!v19) {
      break;
    }
    unint64_t v110 = isUniquelyReferenced_nonNull_native & 0xC000000000000001;
    uint64_t v21 = 4;
    unint64_t v108 = isUniquelyReferenced_nonNull_native;
    while (1)
    {
      uint64_t v8 = v21 - 4;
      id v22 = v110
          ? (id)MEMORY[0x1CB794B20](v21 - 4, isUniquelyReferenced_nonNull_native)
          : *(id *)(isUniquelyReferenced_nonNull_native + 8 * v21);
      unint64_t v23 = v22;
      if (__OFADD__(v8, 1)) {
        break;
      }
      id v111 = (id)(v21 - 3);
      id v24 = objc_msgSend(v22, sel_bridgeName);
      uint64_t v8 = sub_1C9F07FE8();
      uint64_t v26 = v25;

      id v27 = v23;
      unint64_t isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v116 = v20;
      unint64_t v28 = sub_1C9F01B5C(v8, v26);
      if (__OFADD__(v20[2], (v29 & 1) == 0)) {
        goto LABEL_52;
      }
      unint64_t v30 = v28;
      char v31 = v29;
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC7FE50);
      if (sub_1C9F082E8())
      {
        unint64_t v32 = sub_1C9F01B5C(v8, v26);
        if ((v31 & 1) != (v33 & 1))
        {
          sub_1C9F083B8();
          __break(1u);
          return;
        }
        unint64_t v30 = v32;
      }
      uint64_t v20 = v116;
      if (v31)
      {
        uint64_t v34 = v116[7];

        *(void *)(v34 + 8 * v30) = v27;
      }
      else
      {
        OUTLINED_FUNCTION_265((uint64_t)&v116[v30 >> 6]);
        uint64_t v35 = (uint64_t *)(v20[6] + 16 * v30);
        *uint64_t v35 = v8;
        v35[1] = v26;
        *(void *)(v20[7] + 8 * v30) = v27;
        uint64_t v36 = v20[2];
        BOOL v37 = __OFADD__(v36, 1);
        uint64_t v38 = v36 + 1;
        if (v37) {
          goto LABEL_53;
        }
        v20[2] = v38;
        swift_bridgeObjectRetain();
      }

      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      ++v21;
      unint64_t isUniquelyReferenced_nonNull_native = v108;
      if (v111 == v19) {
        goto LABEL_18;
      }
    }
    __break(1u);
LABEL_52:
    __break(1u);
LABEL_53:
    __break(1u);
LABEL_54:
    swift_bridgeObjectRetain();
    id v19 = (id)sub_1C9F08318();
  }
LABEL_18:
  uint64_t v96 = v20;
  swift_bridgeObjectRelease();
  unint64_t v39 = sub_1C9ECFD44();
  sub_1C9F07D08();
  if (!v112) {
    goto LABEL_50;
  }
  v95[0] = v39;
  uint64_t v103 = sub_1C9ECF370(0, &qword_1EBC7F838);
  uint64_t v97 = OBJC_IVAR___SRDRequestDispatcherInternal_messagePublisher;
  OUTLINED_FUNCTION_260(OBJC_IVAR___SRDRequestDispatcherInternal_serviceHelper);
  OUTLINED_FUNCTION_320(OBJC_IVAR___SRDRequestDispatcherInternal_sessionsManager);
  int v102 = *MEMORY[0x1E4FBCC68];
  uint64_t v101 = v107 + 104;
  uint64_t v40 = (unsigned __int8 *)(swift_bridgeObjectRetain() + 64);
  *(void *)&long long v41 = 136315138;
  long long v98 = v41;
  v95[5] = MEMORY[0x1E4FBC840] + 8;
  unint64_t v100 = 0x80000001C9F0AD20;
  do
  {
    uint64_t v42 = *((void *)v40 - 4);
    unint64_t v43 = *((void *)v40 - 3);
    uint64_t v45 = *((void *)v40 - 2);
    unint64_t v44 = *((void *)v40 - 1);
    int v46 = *v40;
    uint64_t v47 = qword_1EBC7F680;
    OUTLINED_FUNCTION_318();
    if (v47 != -1) {
      swift_once();
    }
    uint64_t v48 = sub_1C9F07E78();
    uint64_t v49 = __swift_project_value_buffer(v48, (uint64_t)qword_1EBC7FEF0);
    OUTLINED_FUNCTION_318();
    unint64_t v50 = sub_1C9F07E68();
    os_log_type_t v51 = sub_1C9F08158();
    BOOL v52 = OUTLINED_FUNCTION_180(v51);
    uint64_t v107 = v49;
    unint64_t v108 = v44;
    id v111 = (id)v45;
    LODWORD(v110) = v46;
    if (v52)
    {
      uint64_t v53 = OUTLINED_FUNCTION_7();
      uint64_t v116 = (void *)OUTLINED_FUNCTION_11_3();
      *(_DWORD *)uint64_t v53 = v98;
      swift_bridgeObjectRetain();
      *(void *)(v53 + 4) = sub_1C9F01420(v42, v43, (uint64_t *)&v116);
      OUTLINED_FUNCTION_257();
      _os_log_impl(&dword_1C9EC7000, v50, (os_log_type_t)v19, "Creating Bridge: %s...", (uint8_t *)v53, 0xCu);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_1();
      OUTLINED_FUNCTION_1();
    }
    else
    {

      OUTLINED_FUNCTION_209();
    }
    uint64_t v116 = 0;
    unint64_t v117 = 0xE000000000000000;
    sub_1C9F082A8();
    swift_bridgeObjectRelease();
    uint64_t v116 = (void *)0xD00000000000001DLL;
    unint64_t v117 = v100;
    OUTLINED_FUNCTION_275();
    sub_1C9F08038();
    LOBYTE(v54) = (_BYTE)v116;
    sub_1C9F07EC8();
    os_log_type_t v55 = v104;
    OUTLINED_FUNCTION_305();
    v56();
    uint64_t v116 = (void *)MEMORY[0x1E4FBC860];
    sub_1C9EFBB30(&qword_1EBC7F830, MEMORY[0x1E4FBCC10]);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBC7F810);
    sub_1C9EFB3B4((unint64_t *)&qword_1EBC7F820, (uint64_t *)&unk_1EBC7F810);
    sub_1C9F08278();
    id v19 = (id)sub_1C9F081F8();
    if (!v110)
    {
      uint64_t v77 = v99;
      OUTLINED_FUNCTION_249();
      uint64_t v79 = *(void *)(v77 + v78);
      uint64_t v118 = type metadata accessor for MessagePublisher();
      uint64_t v119 = sub_1C9EFBB30(&qword_1EBC7F9A8, (void (*)(uint64_t))type metadata accessor for MessagePublisher);
      uint64_t v116 = (void *)v79;
      OUTLINED_FUNCTION_301();
      OUTLINED_FUNCTION_299();
      uint64_t v81 = *(void *)(v77 + v80);
      uint64_t v114 = type metadata accessor for SessionsManager();
      uint64_t v115 = sub_1C9EFBB30(&qword_1EBC7F9B0, (void (*)(uint64_t))type metadata accessor for SessionsManager);
      uint64_t v113 = v81;
      id v19 = v19;
      swift_retain();
      swift_unknownObjectRetain();
      swift_retain();
      unint64_t v82 = v108;
      uint64_t v83 = sub_1C9F07B58();
      swift_bridgeObjectRelease();
      swift_unknownObjectRetain();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v109 = sub_1C9EF874C(0, v109[2] + 1, 1, (uint64_t)v109, &qword_1EBC7FE78, (void (*)(void, uint64_t, void *, uint64_t))sub_1C9EF8A40, (void (*)(uint64_t, uint64_t, void *))sub_1C9EF8F00);
      }
      unint64_t v85 = v109[2];
      unint64_t v84 = v109[3];
      if (v85 >= v84 >> 1) {
        uint64_t v109 = sub_1C9EF874C((void *)(v84 > 1), v85 + 1, 1, (uint64_t)v109, &qword_1EBC7FE78, (void (*)(void, uint64_t, void *, uint64_t))sub_1C9EF8A40, (void (*)(uint64_t, uint64_t, void *))sub_1C9EF8F00);
      }
      uint64_t v86 = *(void *)(v82 + 8);
      uint64_t v87 = v109;
      v109[2] = v85 + 1;
      uint64_t v88 = &v87[2 * v85];
      v88[4] = v83;
      v88[5] = v86;
      swift_unknownObjectRelease();
      goto LABEL_39;
    }
    swift_bridgeObjectRelease();
    uint64_t v57 = dynamic_cast_existential_1_conditional((uint64_t)v111);
    unint64_t v59 = v96;
    if (v57)
    {
      if (v96[2])
      {
        uint64_t v54 = v58;
        swift_bridgeObjectRetain();
        uint64_t v60 = OUTLINED_FUNCTION_275();
        unint64_t v62 = sub_1C9F01B5C(v60, v61);
        if (v63)
        {
          id v64 = *(id *)(v59[7] + 8 * v62);
          swift_bridgeObjectRelease();
          uint64_t v65 = v99;
          OUTLINED_FUNCTION_249();
          uint64_t v67 = *(void *)(v65 + v66);
          uint64_t v118 = type metadata accessor for MessagePublisher();
          uint64_t v119 = sub_1C9EFBB30(&qword_1EBC7F9A8, (void (*)(uint64_t))type metadata accessor for MessagePublisher);
          uint64_t v116 = (void *)v67;
          OUTLINED_FUNCTION_301();
          OUTLINED_FUNCTION_299();
          uint64_t v69 = *(void *)(v65 + v68);
          uint64_t v114 = type metadata accessor for SessionsManager();
          uint64_t v115 = sub_1C9EFBB30(&qword_1EBC7F9B0, (void (*)(uint64_t))type metadata accessor for SessionsManager);
          uint64_t v113 = v69;
          id v70 = v64;
          swift_retain();
          swift_unknownObjectRetain();
          id v19 = v19;
          swift_retain();
          uint64_t v71 = sub_1C9F07B38();
          swift_unknownObjectRetain();
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            uint64_t v109 = sub_1C9EF874C(0, v109[2] + 1, 1, (uint64_t)v109, &qword_1EBC7FE78, (void (*)(void, uint64_t, void *, uint64_t))sub_1C9EF8A40, (void (*)(uint64_t, uint64_t, void *))sub_1C9EF8F00);
          }
          unint64_t v73 = v109[2];
          unint64_t v72 = v109[3];
          if (v73 >= v72 >> 1) {
            uint64_t v109 = sub_1C9EF874C((void *)(v72 > 1), v73 + 1, 1, (uint64_t)v109, &qword_1EBC7FE78, (void (*)(void, uint64_t, void *, uint64_t))sub_1C9EF8A40, (void (*)(uint64_t, uint64_t, void *))sub_1C9EF8F00);
          }
          uint64_t v74 = *(void *)(*(void *)(v54 + 8) + 8);
          uint64_t v75 = v109;
          v109[2] = v73 + 1;
          uint64_t v76 = &v75[2 * v73];
          v76[4] = v71;
          v76[5] = v74;
          swift_unknownObjectRelease();

          goto LABEL_39;
        }
        swift_bridgeObjectRelease();
      }
      swift_bridgeObjectRetain();
      unint64_t v89 = sub_1C9F07E68();
      os_log_type_t v92 = sub_1C9F08168();
      if (!OUTLINED_FUNCTION_9_2(v92))
      {

        OUTLINED_FUNCTION_209();
LABEL_39:

        goto LABEL_46;
      }
      uint64_t v93 = OUTLINED_FUNCTION_7();
      uint64_t v116 = (void *)OUTLINED_FUNCTION_11_3();
      *(_DWORD *)uint64_t v93 = v98;
      swift_bridgeObjectRetain();
      *(void *)(v93 + 4) = sub_1C9F01420(v42, v43, (uint64_t *)&v116);
      OUTLINED_FUNCTION_257();
      _os_log_impl(&dword_1C9EC7000, v89, (os_log_type_t)v54, "Could not find XpcConnectionListener for Bridge: %s", (uint8_t *)v93, 0xCu);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_1();
    }
    else
    {
      swift_bridgeObjectRelease();
      unint64_t v89 = sub_1C9F07E68();
      os_log_type_t v90 = sub_1C9F08178();
      if (!OUTLINED_FUNCTION_106(v90))
      {

        goto LABEL_39;
      }
      uint64_t v91 = (uint8_t *)OUTLINED_FUNCTION_1_2();
      *(_WORD *)uint64_t v91 = 0;
      _os_log_impl(&dword_1C9EC7000, v89, v55, "isXPCListening set but bridge does not implement required interface", v91, 2u);
    }
    OUTLINED_FUNCTION_1();

LABEL_46:
    v40 += 40;
    --v112;
  }
  while (v112);
  swift_bridgeObjectRelease();
LABEL_50:
  sub_1C9F07CE8();
  OUTLINED_FUNCTION_250();
  OUTLINED_FUNCTION_1_0();
  v94();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_11_1();
}

void sub_1C9EE0F28()
{
  OUTLINED_FUNCTION_14_1();
  sub_1C9F07E58();
  OUTLINED_FUNCTION_0();
  MEMORY[0x1F4188790](v0);
  OUTLINED_FUNCTION_68();
  sub_1C9ECFD44();
  sub_1C9F07D08();
  sub_1C9EE021C();
  uint64_t v2 = *(void *)(v1 + 16);
  if (v2)
  {
    uint64_t v3 = (uint64_t *)(v1 + 40);
    do
    {
      uint64_t v4 = *v3;
      uint64_t v5 = swift_unknownObjectRetain();
      sub_1C9EE107C(v5, v4);
      swift_unknownObjectRelease();
      v3 += 2;
      --v2;
    }
    while (v2);
  }
  swift_bridgeObjectRelease();
  sub_1C9F07CE8();
  sub_1C9ED2E98();
  OUTLINED_FUNCTION_149();
  v6();
  OUTLINED_FUNCTION_11_1();
}

void sub_1C9EE107C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  if (qword_1EBC7F680 != -1) {
LABEL_53:
  }
    swift_once();
  uint64_t v5 = sub_1C9F07E78();
  __swift_project_value_buffer(v5, (uint64_t)qword_1EBC7FEF0);
  OUTLINED_FUNCTION_288();
  uint64_t v6 = sub_1C9F07E68();
  os_log_type_t v7 = sub_1C9F08158();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = (_DWORD *)OUTLINED_FUNCTION_7();
    v87[0] = OUTLINED_FUNCTION_11_3();
    _DWORD *v8 = 136315138;
    swift_getObjectType();
    uint64_t v9 = a2;
    uint64_t v10 = sub_1C9F07C48();
    uint64_t v12 = sub_1C9F01420(v10, v11, v87);
    OUTLINED_FUNCTION_298(v12);
    sub_1C9F08228();
    OUTLINED_FUNCTION_289();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_304(&dword_1C9EC7000, v6, v7, "About to register bridge %s to message bus...");
    swift_arrayDestroy();
    OUTLINED_FUNCTION_1();
    OUTLINED_FUNCTION_1();
  }
  else
  {

    OUTLINED_FUNCTION_289();
    uint64_t v9 = a2;
  }
  if ((sub_1C9ED3050(a1, v9) & 1) == 0)
  {
    OUTLINED_FUNCTION_288();
    uint64_t v65 = sub_1C9F07E68();
    os_log_type_t v70 = sub_1C9F08168();
    if (OUTLINED_FUNCTION_333(v70))
    {
      uint64_t v71 = (_DWORD *)OUTLINED_FUNCTION_7();
      v87[0] = OUTLINED_FUNCTION_11_3();
      *uint64_t v71 = 136315138;
      swift_getObjectType();
      uint64_t v72 = sub_1C9F07C48();
      uint64_t v74 = sub_1C9F01420(v72, v73, v87);
      OUTLINED_FUNCTION_298(v74);
      sub_1C9F08228();
      swift_unknownObjectRelease_n();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_304(&dword_1C9EC7000, v65, (os_log_type_t)a1, "Unable to register %s Bridge...");
      swift_arrayDestroy();
      goto LABEL_46;
    }
LABEL_47:

    swift_unknownObjectRelease_n();
    return;
  }
  swift_getObjectType();
  uint64_t v13 = sub_1C9F07C38();
  uint64_t v14 = v13;
  uint64_t v78 = *(void *)(v13 + 16);
  if (!v78)
  {
LABEL_42:
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_288();
    uint64_t v65 = sub_1C9F07E68();
    os_log_type_t v66 = sub_1C9F08188();
    if (OUTLINED_FUNCTION_333(v66))
    {
      uint64_t v67 = (_DWORD *)OUTLINED_FUNCTION_7();
      v86[0] = OUTLINED_FUNCTION_11_3();
      *uint64_t v67 = 136446210;
      uint64_t v68 = sub_1C9F07C48();
      sub_1C9F01420(v68, v69, v86);
      sub_1C9F08228();
      swift_unknownObjectRelease_n();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_304(&dword_1C9EC7000, v65, (os_log_type_t)a1, "%{public}s Bridge was registered to the MessageBus");
      OUTLINED_FUNCTION_345();
LABEL_46:
      OUTLINED_FUNCTION_1();
      OUTLINED_FUNCTION_1();

      return;
    }
    goto LABEL_47;
  }
  uint64_t v15 = (void *)((char *)v3 + OBJC_IVAR___SRDRequestDispatcherInternal_aceCommandDispatcher);
  uint64_t v77 = v13 + 32;
  OUTLINED_FUNCTION_15_0();
  unint64_t v16 = 0;
  uint64_t v82 = a1;
  uint64_t v75 = v15;
  uint64_t v76 = v14;
  while (1)
  {
    if (v16 >= *(void *)(v14 + 16)) {
      goto LABEL_50;
    }
    int64_t v17 = (uint64_t *)(v77 + 16 * v16);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    swift_bridgeObjectRetain();
    uint64_t v81 = v19;
    uint64_t v20 = sub_1C9F07C28();
    uint64_t v21 = *v15;
    unint64_t v79 = v16;
    if (*(void *)(*v15 + 16))
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      unint64_t v22 = sub_1C9F01B5C(v81, v18);
      if (v23)
      {
        uint64_t v3 = *(void **)(*(void *)(v21 + 56) + 8 * v22);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        goto LABEL_14;
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC7FD60);
    uint64_t v3 = (void *)sub_1C9F07F88();
LABEL_14:
    uint64_t v80 = v18;
    uint64_t v24 = *(void *)(v20 + 16);
    if (v24)
    {
      uint64_t v25 = (unint64_t *)(v20 + 40);
      while (1)
      {
        uint64_t v27 = *(v25 - 1);
        unint64_t v26 = *v25;
        swift_unknownObjectRetain();
        swift_bridgeObjectRetain();
        swift_isUniquelyReferenced_nonNull_native();
        v86[0] = (uint64_t)v3;
        unint64_t v28 = sub_1C9F01B5C(v27, v26);
        uint64_t v30 = v3[2];
        BOOL v31 = (v29 & 1) == 0;
        a1 = v30 + v31;
        if (__OFADD__(v30, v31)) {
          break;
        }
        unint64_t v32 = v28;
        char v33 = v29;
        __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC7FE30);
        a1 = v82;
        if (sub_1C9F082E8())
        {
          unint64_t v34 = sub_1C9F01B5C(v27, v26);
          if ((v33 & 1) != (v35 & 1)) {
            goto LABEL_54;
          }
          unint64_t v32 = v34;
        }
        uint64_t v3 = (void *)v86[0];
        uint64_t v84 = v24;
        if (v33)
        {
          uint64_t v36 = (uint64_t *)(*(void *)(v86[0] + 56) + 16 * v32);
          *uint64_t v36 = v82;
          v36[1] = a2;
          swift_bridgeObjectRelease();
          OUTLINED_FUNCTION_288();
          OUTLINED_FUNCTION_212();
          swift_unknownObjectRetain_n();
          BOOL v37 = sub_1C9F07E68();
          os_log_type_t v38 = sub_1C9F08168();
          if (os_log_type_enabled(v37, v38))
          {
            uint64_t v39 = OUTLINED_FUNCTION_11_3();
            v86[0] = swift_slowAlloc();
            *(_DWORD *)uint64_t v39 = 136315650;
            swift_getObjectType();
            uint64_t v40 = sub_1C9F07C48();
            *(void *)(v39 + 4) = sub_1C9F01420(v40, v41, v86);
            swift_unknownObjectRelease_n();
            swift_bridgeObjectRelease();
            *(_WORD *)(v39 + 12) = 2080;
            swift_bridgeObjectRetain();
            *(void *)(v39 + 14) = sub_1C9F01420(v27, v26, v86);
            OUTLINED_FUNCTION_19_0();
            *(_WORD *)(v39 + 22) = 2080;
            uint64_t v42 = sub_1C9F07C48();
            *(void *)(v39 + 24) = sub_1C9F01420(v42, v43, v86);
            swift_unknownObjectRelease_n();
            swift_bridgeObjectRelease();
            _os_log_impl(&dword_1C9EC7000, v37, v38, "There is already a bridge: %s consuming %s. Replacing with %s", (uint8_t *)v39, 0x20u);
            swift_arrayDestroy();
            OUTLINED_FUNCTION_1();
            a1 = v82;
            OUTLINED_FUNCTION_1();
            swift_unknownObjectRelease();
          }
          else
          {

            OUTLINED_FUNCTION_289();
            OUTLINED_FUNCTION_138();
            swift_unknownObjectRelease_n();
          }
        }
        else
        {
          OUTLINED_FUNCTION_265(v86[0] + 8 * (v32 >> 6));
          unint64_t v44 = (uint64_t *)(v3[6] + 16 * v32);
          *unint64_t v44 = v27;
          v44[1] = v26;
          uint64_t v45 = (uint64_t *)(v3[7] + 16 * v32);
          *uint64_t v45 = v82;
          v45[1] = a2;
          uint64_t v46 = v3[2];
          BOOL v47 = __OFADD__(v46, 1);
          uint64_t v48 = v46 + 1;
          if (v47) {
            goto LABEL_49;
          }
          v3[2] = v48;
          swift_bridgeObjectRetain();
          swift_bridgeObjectRelease();
        }
        OUTLINED_FUNCTION_288();
        swift_bridgeObjectRetain();
        uint64_t v49 = sub_1C9F07E68();
        os_log_type_t v50 = sub_1C9F08158();
        if (os_log_type_enabled(v49, v50))
        {
          uint64_t v51 = OUTLINED_FUNCTION_29();
          v86[0] = OUTLINED_FUNCTION_28();
          *(_DWORD *)uint64_t v51 = 136315394;
          uint64_t v52 = sub_1C9F07C48();
          *(void *)(v51 + 4) = sub_1C9F01420(v52, v53, v86);
          OUTLINED_FUNCTION_289();
          swift_bridgeObjectRelease();
          *(_WORD *)(v51 + 12) = 2080;
          swift_bridgeObjectRetain();
          *(void *)(v51 + 14) = sub_1C9F01420(v27, v26, v86);
          OUTLINED_FUNCTION_19_0();
          _os_log_impl(&dword_1C9EC7000, v49, v50, "Registered bridge:%s for command:%s", (uint8_t *)v51, 0x16u);
          OUTLINED_FUNCTION_234();
          OUTLINED_FUNCTION_1();
          OUTLINED_FUNCTION_1();
        }
        else
        {

          OUTLINED_FUNCTION_138();
          OUTLINED_FUNCTION_289();
        }
        v25 += 2;
        uint64_t v24 = v84 - 1;
        if (v84 == 1) {
          goto LABEL_30;
        }
      }
      __break(1u);
LABEL_49:
      __break(1u);
LABEL_50:
      __break(1u);
LABEL_51:
      __break(1u);
LABEL_52:
      __break(1u);
      goto LABEL_53;
    }
LABEL_30:
    swift_bridgeObjectRelease();
    if (!v3[2])
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v15 = v75;
      uint64_t v14 = v76;
      goto LABEL_41;
    }
    uint64_t v15 = v75;
    swift_beginAccess();
    swift_isUniquelyReferenced_nonNull_native();
    unint64_t v85 = (void *)*v75;
    void *v75 = 0x8000000000000000;
    unint64_t v54 = sub_1C9F01B5C(v81, v80);
    uint64_t v56 = v85[2];
    BOOL v57 = (v55 & 1) == 0;
    a1 = v56 + v57;
    uint64_t v14 = v76;
    if (__OFADD__(v56, v57)) {
      goto LABEL_51;
    }
    unint64_t v58 = v54;
    char v59 = v55;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC7FE38);
    a1 = v82;
    if (sub_1C9F082E8()) {
      break;
    }
LABEL_35:
    if (v59)
    {
      *(void *)(v85[7] + 8 * v58) = v3;
    }
    else
    {
      OUTLINED_FUNCTION_265((uint64_t)&v85[v58 >> 6]);
      unint64_t v62 = (uint64_t *)(v85[6] + 16 * v58);
      *unint64_t v62 = v81;
      v62[1] = v80;
      *(void *)(v85[7] + 8 * v58) = v3;
      uint64_t v63 = v85[2];
      BOOL v47 = __OFADD__(v63, 1);
      uint64_t v64 = v63 + 1;
      if (v47) {
        goto LABEL_52;
      }
      v85[2] = v64;
      swift_bridgeObjectRetain();
    }
    void *v75 = v85;
    swift_bridgeObjectRelease();
    swift_endAccess();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
LABEL_41:
    unint64_t v16 = v79 + 1;
    if (v79 + 1 == v78) {
      goto LABEL_42;
    }
  }
  unint64_t v60 = sub_1C9F01B5C(v81, v80);
  if ((v59 & 1) == (v61 & 1))
  {
    unint64_t v58 = v60;
    goto LABEL_35;
  }
LABEL_54:
  sub_1C9F083B8();
  __break(1u);
}

uint64_t sub_1C9EE1A50(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(uint64_t))
{
  unint64_t v11 = a5;
  uint64_t v5 = sub_1C9F07E58();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  uint64_t v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C9ECFD44();
  sub_1C9F07CE8();
  sub_1C9F07CE8();
  uint64_t v9 = sub_1C9F07CF8();
  v11(v9);
  sub_1C9F07CE8();
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

void sub_1C9EE1BFC()
{
  OUTLINED_FUNCTION_14_1();
  char v3 = sub_1C9F07E58();
  OUTLINED_FUNCTION_0();
  uint64_t v5 = v4;
  uint64_t v7 = *(void *)(v6 + 64);
  MEMORY[0x1F4188790](v8);
  OUTLINED_FUNCTION_52();
  MEMORY[0x1F4188790](v9);
  OUTLINED_FUNCTION_30_1();
  uint64_t v11 = MEMORY[0x1F4188790](v10);
  v21[1] = (char *)v21 - v12;
  MEMORY[0x1F4188790](v11);
  OUTLINED_FUNCTION_82();
  v21[0] = v21;
  uint64_t v27 = MEMORY[0x1E4FBC860];
  v24[2] = &v27;
  uint64_t v25 = v0;
  sub_1C9ECFD44();
  uint64_t v23 = v1;
  OUTLINED_FUNCTION_27_1();
  OUTLINED_FUNCTION_6_3();
  sub_1C9F07CF8();
  dispatch_queue_t v22 = *(dispatch_queue_t *)(v0 + OBJC_IVAR___SRDRequestDispatcherInternal_rdmbQueue);
  uint64_t v13 = *(void (**)(void))(v5 + 16);
  OUTLINED_FUNCTION_18_2();
  v13();
  OUTLINED_FUNCTION_18_2();
  v13();
  unint64_t v14 = (v7
       + ((v7
         + *(unsigned __int8 *)(v5 + 80)
         + ((*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80))) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80))
       + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v15 = swift_allocObject();
  unint64_t v16 = *(void (**)(void))(v5 + 32);
  OUTLINED_FUNCTION_17_2();
  v16();
  OUTLINED_FUNCTION_17_2();
  v16();
  int64_t v17 = (void *)(v15 + v14);
  void *v17 = 0x28736E69616D6F64;
  v17[1] = 0xE900000000000029;
  uint64_t v18 = (uint64_t (**)())(v15 + ((v14 + 23) & 0xFFFFFFFFFFFFFFF8));
  *uint64_t v18 = sub_1C9EF9C34;
  v18[1] = (uint64_t (*)())v24;
  uint64_t v19 = OUTLINED_FUNCTION_7_1();
  *(void *)(v19 + 16) = sub_1C9EF9C40;
  *(void *)(v19 + 24) = v15;
  v26[4] = sub_1C9EF9C48;
  v26[5] = v19;
  v26[0] = MEMORY[0x1E4F143A8];
  OUTLINED_FUNCTION_33_0(COERCE_DOUBLE(1107296256));
  void v26[2] = sub_1C9EDF214;
  v26[3] = &block_descriptor_2;
  _Block_copy(v26);
  OUTLINED_FUNCTION_53();
  swift_release();
  dispatch_sync(v22, v2);
  _Block_release(v2);
  uint64_t v20 = *(void (**)(void))(v5 + 8);
  OUTLINED_FUNCTION_10_4();
  v20();
  OUTLINED_FUNCTION_10_4();
  v20();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_40_0();
  swift_release();
  if (v3) {
    __break(1u);
  }
  else {
    OUTLINED_FUNCTION_11_1();
  }
}

uint64_t sub_1C9EE1F08(uint64_t *a1)
{
  swift_beginAccess();
  uint64_t v2 = swift_bridgeObjectRetain();
  uint64_t v3 = sub_1C9ECEBA4(v2);
  swift_bridgeObjectRelease();
  *a1 = v3;
  return swift_bridgeObjectRelease();
}

void sub_1C9EE1FE0()
{
  OUTLINED_FUNCTION_14_1();
  char v6 = OUTLINED_FUNCTION_188();
  OUTLINED_FUNCTION_0();
  uint64_t v8 = v7;
  uint64_t v10 = *(void *)(v9 + 64);
  MEMORY[0x1F4188790](v11);
  OUTLINED_FUNCTION_52();
  MEMORY[0x1F4188790](v12);
  OUTLINED_FUNCTION_30_1();
  MEMORY[0x1F4188790](v13);
  OUTLINED_FUNCTION_124();
  MEMORY[0x1F4188790](v14);
  OUTLINED_FUNCTION_82();
  uint64_t v32 = MEMORY[0x1E4FBC860];
  uint64_t v27 = v4;
  uint64_t v28 = v5;
  uint64_t v29 = v0;
  uint64_t v30 = &v32;
  sub_1C9ECFD44();
  OUTLINED_FUNCTION_27_1();
  OUTLINED_FUNCTION_182();
  OUTLINED_FUNCTION_6_3();
  sub_1C9F07CF8();
  uint64_t v15 = *(void (**)(uint64_t))(v8 + 16);
  OUTLINED_FUNCTION_18_2();
  v15(v16);
  OUTLINED_FUNCTION_18_2();
  v15(v17);
  OUTLINED_FUNCTION_20_2();
  uint64_t v18 = swift_allocObject();
  uint64_t v19 = OUTLINED_FUNCTION_49(v18);
  v2(v19);
  OUTLINED_FUNCTION_81();
  v2(v20);
  *(void *)(v10 + v1) = 0xD000000000000014;
  OUTLINED_FUNCTION_92(v10 + v1);
  *uint64_t v21 = sub_1C9EF9C88;
  v21[1] = (uint64_t (*)())&v26;
  uint64_t v22 = OUTLINED_FUNCTION_7_1();
  *(void *)(v22 + 16) = sub_1C9EF9C40;
  *(void *)(v22 + 24) = v10;
  v31[4] = sub_1C9EFBBDC;
  v31[5] = v22;
  v31[0] = MEMORY[0x1E4F143A8];
  OUTLINED_FUNCTION_33_0(COERCE_DOUBLE(1107296256));
  v31[2] = sub_1C9EDF214;
  v31[3] = &block_descriptor_14;
  _Block_copy(v31);
  OUTLINED_FUNCTION_53();
  swift_release();
  OUTLINED_FUNCTION_307();
  _Block_release(v3);
  uint64_t v23 = *(void (**)(uint64_t))(v8 + 8);
  OUTLINED_FUNCTION_10_4();
  v23(v24);
  OUTLINED_FUNCTION_10_4();
  v23(v25);
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_40_0();
  swift_release();
  if (v6) {
    __break(1u);
  }
  else {
    OUTLINED_FUNCTION_11_1();
  }
}

uint64_t sub_1C9EE2270(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v7 = (uint64_t *)(a1 + OBJC_IVAR___SRDRequestDispatcherInternal_aceCommandDispatcher);
  uint64_t result = swift_beginAccess();
  uint64_t v9 = *v7;
  if (*(void *)(v9 + 16))
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t v10 = sub_1C9F01B5C(a2, a3);
    if (v11)
    {
      uint64_t v12 = *(void *)(*(void *)(v9 + 56) + 8 * v10);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v13 = sub_1C9ECEBA4(v12);
      swift_bridgeObjectRelease();
      *a4 = v13;
    }
    else
    {
      swift_bridgeObjectRelease();
    }
    return swift_bridgeObjectRelease();
  }
  return result;
}

void sub_1C9EE23D4()
{
  OUTLINED_FUNCTION_14_1();
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  uint64_t v42 = v6;
  uint64_t v8 = v7;
  char v9 = sub_1C9F07E58();
  OUTLINED_FUNCTION_0();
  uint64_t v11 = v10;
  uint64_t v13 = MEMORY[0x1F4188790](v12);
  OUTLINED_FUNCTION_21_2(v13, v14, v15, v16, v17, v18, v19, v20, v40);
  MEMORY[0x1F4188790](v21);
  OUTLINED_FUNCTION_30_1();
  uint64_t v23 = MEMORY[0x1F4188790](v22);
  OUTLINED_FUNCTION_139(v23, v24, v25, v26, v27, v28, v29, v30, v41);
  MEMORY[0x1F4188790](v31);
  OUTLINED_FUNCTION_140();
  char v51 = 0;
  uint64_t v44 = v0;
  uint64_t v45 = v5;
  uint64_t v46 = v3;
  BOOL v47 = &v51;
  uint64_t v48 = v8;
  uint64_t v49 = v42;
  uint64_t v32 = (void (*)(uint64_t))sub_1C9ECFD44();
  OUTLINED_FUNCTION_174();
  OUTLINED_FUNCTION_6_3();
  sub_1C9F07CF8();
  uint64_t v33 = OUTLINED_FUNCTION_38_0(*(void *)(v0 + OBJC_IVAR___SRDRequestDispatcherInternal_rdmbQueue));
  v32(v33);
  uint64_t v34 = OUTLINED_FUNCTION_72();
  v32(v34);
  OUTLINED_FUNCTION_7_4();
  uint64_t v35 = swift_allocObject();
  uint64_t v36 = *(void (**)(void))(v11 + 32);
  OUTLINED_FUNCTION_17_2();
  v36();
  OUTLINED_FUNCTION_17_2();
  v36();
  OUTLINED_FUNCTION_91((unint64_t *)((char *)&type metadata for Logger + v35));
  *BOOL v37 = sub_1C9EF9C9C;
  v37[1] = (uint64_t (*)())&v43;
  uint64_t v38 = OUTLINED_FUNCTION_7_1();
  *(void *)(v38 + 16) = sub_1C9EF9C40;
  *(void *)(v38 + 24) = v35;
  v50[4] = sub_1C9EFBBDC;
  v50[5] = v38;
  v50[0] = MEMORY[0x1E4F143A8];
  OUTLINED_FUNCTION_33_0(COERCE_DOUBLE(1107296256));
  v50[2] = sub_1C9EDF214;
  v50[3] = &block_descriptor_25;
  _Block_copy(v50);
  OUTLINED_FUNCTION_53();
  swift_release();
  OUTLINED_FUNCTION_303();
  _Block_release(v1);
  uint64_t v39 = *(void (**)(void))(v11 + 8);
  OUTLINED_FUNCTION_13_2();
  v39();
  OUTLINED_FUNCTION_13_2();
  v39();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_40_0();
  swift_release();
  if (v9) {
    __break(1u);
  }
  else {
    OUTLINED_FUNCTION_11_1();
  }
}

uint64_t sub_1C9EE2664(uint64_t a1, uint64_t a2, uint64_t a3, BOOL *a4, uint64_t a5, uint64_t a6)
{
  uint64_t v11 = (uint64_t *)(a1 + OBJC_IVAR___SRDRequestDispatcherInternal_aceCommandDispatcher);
  uint64_t result = swift_beginAccess();
  uint64_t v13 = *v11;
  if (*(void *)(v13 + 16))
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t v14 = sub_1C9F01B5C(a2, a3);
    if (v15)
    {
      uint64_t v16 = *(void *)(*(void *)(v13 + 56) + 8 * v14);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRetain();
      uint64_t v17 = sub_1C9EFE714(a5, a6, v16);
      swift_bridgeObjectRelease();
      uint64_t result = swift_bridgeObjectRelease();
      if (v17) {
        uint64_t result = swift_unknownObjectRelease();
      }
      *a4 = v17 != 0;
    }
    else
    {
      swift_bridgeObjectRelease();
      return swift_bridgeObjectRelease();
    }
  }
  return result;
}

void sub_1C9EE27FC()
{
  OUTLINED_FUNCTION_14_1();
  uint64_t v4 = v3;
  uint64_t v42 = v6;
  dispatch_queue_t v43 = v5;
  uint64_t v44 = OUTLINED_FUNCTION_198();
  OUTLINED_FUNCTION_0();
  uint64_t v8 = v7;
  uint64_t v10 = *(void *)(v9 + 64);
  MEMORY[0x1F4188790](v11);
  OUTLINED_FUNCTION_186();
  uint64_t v13 = v12;
  OUTLINED_FUNCTION_58();
  MEMORY[0x1F4188790](v14);
  OUTLINED_FUNCTION_21_0();
  uint64_t v16 = v15;
  OUTLINED_FUNCTION_58();
  MEMORY[0x1F4188790](v17);
  OUTLINED_FUNCTION_82();
  MEMORY[0x1F4188790](v18);
  OUTLINED_FUNCTION_140();
  uint64_t v19 = sub_1C9EF91EC(v0, (SEL *)&selRef_encodedClassName);
  uint64_t v45 = v19;
  if (v20)
  {
    uint64_t v21 = v20;
    v40[0] = v40;
    MEMORY[0x1F4188790](v19);
    uint64_t v41 = (uint64_t (*)())v39;
    v39[2] = v0;
    v39[3] = v0;
    v39[4] = v42;
    v39[5] = v4;
    v39[6] = v43;
    sub_1C9ECFD44();
    OUTLINED_FUNCTION_27_1();
    OUTLINED_FUNCTION_6_3();
    uint64_t v22 = v21;
    sub_1C9F07CF8();
    dispatch_queue_t v43 = *(dispatch_queue_t *)&v0[OBJC_IVAR___SRDRequestDispatcherInternal_rdmbQueue];
    uint64_t v23 = *(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16);
    uint64_t v24 = v44;
    v23(v16, v2, v44);
    v23(v13, v1, v24);
    uint64_t v25 = *(unsigned __int8 *)(v8 + 80);
    uint64_t v26 = (v25 + 16) & ~v25;
    uint64_t v42 = v2;
    uint64_t v27 = (v10 + v25 + v26) & ~v25;
    unint64_t v28 = (v10 + v27 + 7) & 0xFFFFFFFFFFFFFFF8;
    v40[1] = v1;
    uint64_t v29 = swift_allocObject();
    uint64_t v30 = *(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 32);
    uint64_t v31 = v16;
    uint64_t v32 = v44;
    v30(v29 + v26, v31, v44);
    v30(v29 + v27, v13, v32);
    uint64_t v33 = (uint64_t *)(v29 + v28);
    *uint64_t v33 = v45;
    v33[1] = v22;
    uint64_t v34 = (uint64_t (**)())(v29 + ((v28 + 23) & 0xFFFFFFFFFFFFFFF8));
    uint64_t v35 = v41;
    *uint64_t v34 = sub_1C9EF9CB4;
    v34[1] = v35;
    uint64_t v36 = OUTLINED_FUNCTION_7_1();
    *(void *)(v36 + 16) = sub_1C9EF9C40;
    *(void *)(v36 + 24) = v29;
    v46[4] = sub_1C9EFBBDC;
    v46[5] = v36;
    v46[0] = MEMORY[0x1E4F143A8];
    OUTLINED_FUNCTION_153(COERCE_DOUBLE(1107296256));
    v46[2] = sub_1C9EDF214;
    v46[3] = &block_descriptor_36;
    BOOL v37 = _Block_copy(v46);
    swift_bridgeObjectRetain();
    swift_retain();
    swift_release();
    dispatch_sync(v43, v37);
    _Block_release(v37);
    uint64_t v38 = *(void (**)(void))(v8 + 8);
    OUTLINED_FUNCTION_10_4();
    v38();
    OUTLINED_FUNCTION_10_4();
    v38();
    LOBYTE(v32) = swift_isEscapingClosureAtFileLocation();
    swift_bridgeObjectRelease();
    swift_release();
    swift_release();
    if ((v32 & 1) == 0)
    {
      OUTLINED_FUNCTION_11_1();
      return;
    }
    __break(1u);
  }
  __break(1u);
}

uint64_t sub_1C9EE2B98(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t result = sub_1C9EF91EC(a2, (SEL *)&selRef_groupIdentifier);
  if (!v11)
  {
    __break(1u);
    goto LABEL_15;
  }
  uint64_t v12 = result;
  uint64_t v13 = v11;
  uint64_t v14 = (uint64_t *)(a1 + OBJC_IVAR___SRDRequestDispatcherInternal_aceCommandDispatcher);
  swift_beginAccess();
  uint64_t v15 = *v14;
  swift_bridgeObjectRetain();
  uint64_t v16 = sub_1C9EFE710(v12, v13, v15);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v16)
  {
    uint64_t result = sub_1C9EF91EC(a2, (SEL *)&selRef_encodedClassName);
    if (v17)
    {
      uint64_t v18 = sub_1C9EFE714(result, v17, v16);
      uint64_t v20 = v19;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (v18)
      {
        sub_1C9ED0234(v18, v20, a2, a5, a3, a4);
        return swift_unknownObjectRelease();
      }
      if (a3)
      {
        uint64_t v23 = swift_allocObject();
        *(void *)(v23 + 16) = a3;
        *(void *)(v23 + 24) = a4;
        uint64_t v22 = sub_1C9EFBBE0;
        goto LABEL_10;
      }
LABEL_11:
      uint64_t v24 = 0;
      goto LABEL_12;
    }
LABEL_15:
    __break(1u);
    return result;
  }
  if (!a3) {
    goto LABEL_11;
  }
  uint64_t v21 = swift_allocObject();
  *(void *)(v21 + 16) = a3;
  *(void *)(v21 + 24) = a4;
  uint64_t v22 = sub_1C9EFB9C8;
LABEL_10:
  uint64_t v24 = (uint64_t)v22;
LABEL_12:
  sub_1C9ED0E20(a3);
  sub_1C9EE2EB4();
  return sub_1C9EFB8F0(v24);
}

void sub_1C9EE2E44(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2) {
    uint64_t v5 = sub_1C9F068F8();
  }
  else {
    uint64_t v5 = 0;
  }
  id v6 = (id)v5;
  (*(void (**)(uint64_t, uint64_t))(a3 + 16))(a3, a1);
}

void sub_1C9EE2EB4()
{
  OUTLINED_FUNCTION_14_1();
  uint64_t v1 = v0;
  uint64_t v3 = v2;
  sub_1C9F069B8();
  OUTLINED_FUNCTION_0();
  MEMORY[0x1F4188790](v4);
  OUTLINED_FUNCTION_144();
  if (v1)
  {
    id v5 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F965A8]), sel_init);
    sub_1C9F069A8();
    uint64_t v6 = sub_1C9F06988();
    uint64_t v8 = v7;
    OUTLINED_FUNCTION_239();
    v9();
    sub_1C9EF9188(v6, v8, v5);
    id v10 = v5;
    sub_1C9EF91EC(v3, (SEL *)&selRef_aceId);
    if (v11)
    {
      uint64_t v12 = (void *)sub_1C9F07FD8();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v12 = 0;
    }
    objc_msgSend(v10, sel_setRefId_, v12);

    uint64_t v13 = self;
    id v14 = v10;
    id v15 = objc_msgSend(v13, sel_errorWithCode_, 2000);
    uint64_t v16 = OUTLINED_FUNCTION_287();
    v1(v16);
  }
  OUTLINED_FUNCTION_11_1();
}

void sub_1C9EE3030()
{
  OUTLINED_FUNCTION_14_1();
  uint64_t v34 = v2;
  uint64_t v32 = v3;
  uint64_t v33 = v4;
  uint64_t v31 = v5;
  uint64_t v7 = v6;
  char v8 = sub_1C9F07E58();
  OUTLINED_FUNCTION_0();
  uint64_t v10 = v9;
  uint64_t v12 = MEMORY[0x1F4188790](v11);
  OUTLINED_FUNCTION_21_2(v12, v13, v14, v15, v16, v17, v18, v19, v30);
  MEMORY[0x1F4188790](v20);
  OUTLINED_FUNCTION_30_1();
  MEMORY[0x1F4188790](v21);
  OUTLINED_FUNCTION_21_0();
  MEMORY[0x1F4188790](v22);
  OUTLINED_FUNCTION_83();
  sub_1C9F07D18();
  uint64_t v36 = v0;
  uint64_t v37 = v7;
  uint64_t v38 = v31;
  uint64_t v39 = v32;
  uint64_t v40 = v33;
  uint64_t v41 = v34;
  OUTLINED_FUNCTION_27_1();
  OUTLINED_FUNCTION_182();
  OUTLINED_FUNCTION_6_3();
  sub_1C9F07CF8();
  uint64_t v23 = OUTLINED_FUNCTION_38_0(*(void *)((char *)v0 + OBJC_IVAR___SRDRequestDispatcherInternal_rdmbQueue));
  v0(v23);
  uint64_t v24 = OUTLINED_FUNCTION_72();
  v0(v24);
  OUTLINED_FUNCTION_7_4();
  uint64_t v25 = swift_allocObject();
  uint64_t v26 = *(void (**)(void))(v10 + 32);
  OUTLINED_FUNCTION_17_2();
  v26();
  OUTLINED_FUNCTION_17_2();
  v26();
  OUTLINED_FUNCTION_91((unint64_t *)((char *)&type metadata for Logger + v25));
  *uint64_t v27 = sub_1C9EF9CCC;
  v27[1] = (uint64_t (*)())&v35;
  uint64_t v28 = OUTLINED_FUNCTION_7_1();
  *(void *)(v28 + 16) = sub_1C9EF9C40;
  *(void *)(v28 + 24) = v25;
  v42[4] = sub_1C9EFBBDC;
  v42[5] = v28;
  v42[0] = MEMORY[0x1E4F143A8];
  OUTLINED_FUNCTION_33_0(COERCE_DOUBLE(1107296256));
  uint64_t v42[2] = sub_1C9EDF214;
  v42[3] = &block_descriptor_47;
  _Block_copy(v42);
  OUTLINED_FUNCTION_53();
  swift_release();
  OUTLINED_FUNCTION_303();
  _Block_release(v1);
  uint64_t v29 = *(void (**)(void))(v10 + 8);
  OUTLINED_FUNCTION_13_2();
  v29();
  OUTLINED_FUNCTION_13_2();
  v29();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_40_0();
  swift_release();
  if (v8) {
    __break(1u);
  }
  else {
    OUTLINED_FUNCTION_11_1();
  }
}

void sub_1C9EE338C()
{
  OUTLINED_FUNCTION_14_1();
  uint64_t v1 = v0;
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  OUTLINED_FUNCTION_204();
  sub_1C9EFEEF8(v6, v7);
  if (v8)
  {
    MEMORY[0x1F4188790](v8);
    OUTLINED_FUNCTION_328();
    *(void *)(v10 - 32) = v9;
    *(void *)(v10 - 24) = v5;
    *(void *)(v10 - 16) = v3;
    *(void *)(v10 - 8) = v1;
    id v11 = objc_allocWithZone((Class)sub_1C9F06AF8());
    OUTLINED_FUNCTION_80();
    uint64_t v12 = (void *)sub_1C9F06A98();
    if (v12)
    {
      uint64_t v13 = v12;
      sub_1C9ED0FAC(v12);
      OUTLINED_FUNCTION_195();
      sub_1C9EDA08C();
      swift_release();
    }
    else
    {
      if (qword_1EBC7F680 != -1) {
        swift_once();
      }
      uint64_t v21 = sub_1C9F07E78();
      OUTLINED_FUNCTION_5_2(v21, (uint64_t)qword_1EBC7FEF0);
      uint64_t v22 = (void *)sub_1C9F07E68();
      os_log_type_t v23 = sub_1C9F08168();
      if (OUTLINED_FUNCTION_21(v23))
      {
        OUTLINED_FUNCTION_7();
        uint64_t v24 = OUTLINED_FUNCTION_11_3();
        OUTLINED_FUNCTION_40(v24);
        OUTLINED_FUNCTION_29_0(4.8149e-34);
        uint64_t v25 = OUTLINED_FUNCTION_21_1();
        OUTLINED_FUNCTION_6_2(v25);
        OUTLINED_FUNCTION_26_0();
        OUTLINED_FUNCTION_1_3(&dword_1C9EC7000, v26, v27, "Failed to create CancelRequestMessage for request Id: %s");
        OUTLINED_FUNCTION_7_3();
        OUTLINED_FUNCTION_1();
        OUTLINED_FUNCTION_1();
      }
      else
      {

        OUTLINED_FUNCTION_27_0();
      }
      swift_release();
    }
  }
  else
  {
    if (qword_1EBC7F680 != -1) {
      swift_once();
    }
    uint64_t v14 = sub_1C9F07E78();
    __swift_project_value_buffer(v14, (uint64_t)qword_1EBC7FEF0);
    OUTLINED_FUNCTION_121();
    uint64_t v15 = (void *)sub_1C9F07E68();
    os_log_type_t v16 = sub_1C9F08168();
    if (OUTLINED_FUNCTION_19_1(v16))
    {
      OUTLINED_FUNCTION_7();
      uint64_t v17 = OUTLINED_FUNCTION_11_3();
      OUTLINED_FUNCTION_281(v17);
      OUTLINED_FUNCTION_300(4.8149e-34);
      uint64_t v18 = OUTLINED_FUNCTION_78();
      OUTLINED_FUNCTION_69(v18);
      OUTLINED_FUNCTION_120();
      OUTLINED_FUNCTION_25_1(&dword_1C9EC7000, v19, v20, "No active session for assistantId: %s cannot post CancelRequest message");
      OUTLINED_FUNCTION_45_0();
      OUTLINED_FUNCTION_1();
      OUTLINED_FUNCTION_1();
    }
    else
    {

      OUTLINED_FUNCTION_130();
    }
  }
  OUTLINED_FUNCTION_11_1();
}

uint64_t sub_1C9EE3618(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v19[1] = a7;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC7F020);
  MEMORY[0x1F4188790](v8 - 8);
  uint64_t v10 = (char *)v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC7FCF0);
  MEMORY[0x1F4188790](v11 - 8);
  uint64_t v13 = (char *)v19 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = *MEMORY[0x1E4FA22F8];
  uint64_t v15 = sub_1C9F07A48();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v15 - 8) + 104))(v13, v14, v15);
  __swift_storeEnumTagSinglePayload((uint64_t)v13, 0, 1, v15);
  sub_1C9F06AC8();
  swift_bridgeObjectRetain();
  sub_1C9F06AA8();
  uint64_t v16 = a4 + OBJC_IVAR____TtC14SiriMessageBus7Session_sessionId;
  uint64_t v17 = sub_1C9F069B8();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v17 - 8) + 16))(v10, v16, v17);
  __swift_storeEnumTagSinglePayload((uint64_t)v10, 0, 1, v17);
  sub_1C9F06AE8();
  swift_bridgeObjectRetain();
  sub_1C9F06AD8();
  return sub_1C9F06AB8();
}

void sub_1C9EE3810()
{
  OUTLINED_FUNCTION_14_1();
  uint64_t v41 = v2;
  uint64_t v37 = v3;
  uint64_t v40 = v4;
  uint64_t v6 = v5;
  char v7 = sub_1C9F07E58();
  OUTLINED_FUNCTION_0();
  uint64_t v9 = v8;
  uint64_t v11 = MEMORY[0x1F4188790](v10);
  OUTLINED_FUNCTION_21_2(v11, v12, v13, v14, v15, v16, v17, v18, v37);
  MEMORY[0x1F4188790](v19);
  OUTLINED_FUNCTION_30_1();
  uint64_t v21 = MEMORY[0x1F4188790](v20);
  OUTLINED_FUNCTION_139(v21, v22, v23, v24, v25, v26, v27, v28, v38);
  MEMORY[0x1F4188790](v29);
  OUTLINED_FUNCTION_83();
  sub_1C9F07D18();
  uint64_t v43 = v0;
  uint64_t v44 = v6;
  uint64_t v45 = v39;
  uint64_t v46 = v40;
  uint64_t v47 = v41;
  OUTLINED_FUNCTION_41_0();
  OUTLINED_FUNCTION_165();
  OUTLINED_FUNCTION_6_3();
  sub_1C9F07CF8();
  uint64_t v30 = OUTLINED_FUNCTION_38_0(*(void *)(v0 + OBJC_IVAR___SRDRequestDispatcherInternal_rdmbQueue));
  v6(v30);
  uint64_t v31 = OUTLINED_FUNCTION_72();
  v6(v31);
  OUTLINED_FUNCTION_7_4();
  uint64_t v32 = swift_allocObject();
  uint64_t v33 = *(void (**)(void))(v9 + 32);
  OUTLINED_FUNCTION_17_2();
  v33();
  OUTLINED_FUNCTION_17_2();
  v33();
  OUTLINED_FUNCTION_91((unint64_t *)((char *)&type metadata for Logger + v32));
  *uint64_t v34 = sub_1C9EF9CEC;
  v34[1] = (uint64_t (*)())&v42;
  uint64_t v35 = OUTLINED_FUNCTION_7_1();
  *(void *)(v35 + 16) = sub_1C9EF9C40;
  *(void *)(v35 + 24) = v32;
  v48[4] = sub_1C9EFBBDC;
  uint64_t v48[5] = v35;
  v48[0] = MEMORY[0x1E4F143A8];
  OUTLINED_FUNCTION_33_0(COERCE_DOUBLE(1107296256));
  v48[2] = sub_1C9EDF214;
  v48[3] = &block_descriptor_58;
  _Block_copy(v48);
  OUTLINED_FUNCTION_53();
  swift_release();
  OUTLINED_FUNCTION_303();
  _Block_release(v1);
  uint64_t v36 = *(void (**)(void))(v9 + 8);
  OUTLINED_FUNCTION_13_2();
  v36();
  OUTLINED_FUNCTION_13_2();
  v36();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_40_0();
  swift_release();
  if (v7) {
    __break(1u);
  }
  else {
    OUTLINED_FUNCTION_11_1();
  }
}

void sub_1C9EE3AC8()
{
  OUTLINED_FUNCTION_14_1();
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  OUTLINED_FUNCTION_204();
  sub_1C9EFEEF8(v5, v6);
  if (v7)
  {
    uint64_t v8 = v7;
    OUTLINED_FUNCTION_200((void *)(v0 + OBJC_IVAR___SRDRequestDispatcherInternal_featureChecker), *(void *)(v0 + OBJC_IVAR___SRDRequestDispatcherInternal_featureChecker + 24));
    OUTLINED_FUNCTION_326();
    uint64_t v9 = sub_1C9F07D58();
    MEMORY[0x1F4188790](v9);
    OUTLINED_FUNCTION_328();
    *(void *)(v10 - 32) = v8;
    *(void *)(v10 - 24) = v4;
    *(void *)(v10 - 16) = v2;
    if (v11)
    {
      id v12 = objc_allocWithZone((Class)sub_1C9F06F38());
      OUTLINED_FUNCTION_80();
      uint64_t v13 = (void *)sub_1C9F06F28();
      if (!v13)
      {
        if (qword_1EBC7F680 != -1) {
          swift_once();
        }
        uint64_t v14 = sub_1C9F07E78();
        OUTLINED_FUNCTION_5_2(v14, (uint64_t)qword_1EBC7FEF0);
        uint64_t v15 = (void *)sub_1C9F07E68();
        os_log_type_t v16 = sub_1C9F08168();
        if (OUTLINED_FUNCTION_21(v16))
        {
          OUTLINED_FUNCTION_7();
          uint64_t v17 = OUTLINED_FUNCTION_11_3();
          OUTLINED_FUNCTION_40(v17);
          OUTLINED_FUNCTION_29_0(4.8149e-34);
          uint64_t v18 = OUTLINED_FUNCTION_21_1();
          OUTLINED_FUNCTION_6_2(v18);
          OUTLINED_FUNCTION_26_0();
          uint64_t v21 = "Failed to create RootRequestCompletedMessage for request Id: %s";
LABEL_19:
          OUTLINED_FUNCTION_1_3(&dword_1C9EC7000, v19, v20, v21);
          OUTLINED_FUNCTION_7_3();
          OUTLINED_FUNCTION_1();
          OUTLINED_FUNCTION_1();

          goto LABEL_23;
        }

        swift_release();
        goto LABEL_21;
      }
    }
    else
    {
      id v29 = objc_allocWithZone((Class)sub_1C9F06C38());
      OUTLINED_FUNCTION_80();
      uint64_t v13 = (void *)sub_1C9F06C28();
      if (!v13)
      {
        if (qword_1EBC7F680 != -1) {
          swift_once();
        }
        uint64_t v30 = sub_1C9F07E78();
        OUTLINED_FUNCTION_5_2(v30, (uint64_t)qword_1EBC7FEF0);
        uint64_t v15 = (void *)sub_1C9F07E68();
        os_log_type_t v31 = sub_1C9F08168();
        if (!OUTLINED_FUNCTION_21(v31))
        {

          OUTLINED_FUNCTION_27_0();
          goto LABEL_23;
        }
        OUTLINED_FUNCTION_7();
        uint64_t v32 = OUTLINED_FUNCTION_11_3();
        OUTLINED_FUNCTION_40(v32);
        OUTLINED_FUNCTION_29_0(4.8149e-34);
        uint64_t v33 = OUTLINED_FUNCTION_21_1();
        OUTLINED_FUNCTION_6_2(v33);
        OUTLINED_FUNCTION_26_0();
        uint64_t v21 = "Failed to create RequestCompletedMessage for request Id: %s";
        goto LABEL_19;
      }
    }
    sub_1C9ED0FAC(v13);

    OUTLINED_FUNCTION_195();
    sub_1C9ED9A24();
LABEL_23:
    swift_release();
    goto LABEL_24;
  }
  if (qword_1EBC7F680 != -1) {
    swift_once();
  }
  uint64_t v22 = sub_1C9F07E78();
  __swift_project_value_buffer(v22, (uint64_t)qword_1EBC7FEF0);
  OUTLINED_FUNCTION_121();
  uint64_t v23 = (void *)sub_1C9F07E68();
  os_log_type_t v24 = sub_1C9F08168();
  if (!OUTLINED_FUNCTION_19_1(v24))
  {

LABEL_21:
    swift_bridgeObjectRelease_n();
    goto LABEL_24;
  }
  OUTLINED_FUNCTION_7();
  uint64_t v25 = OUTLINED_FUNCTION_11_3();
  OUTLINED_FUNCTION_281(v25);
  OUTLINED_FUNCTION_300(4.8149e-34);
  uint64_t v26 = OUTLINED_FUNCTION_78();
  OUTLINED_FUNCTION_69(v26);
  OUTLINED_FUNCTION_120();
  OUTLINED_FUNCTION_25_1(&dword_1C9EC7000, v27, v28, "No active session for assistantId: %s cannot post RequestCompleted message");
  OUTLINED_FUNCTION_45_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1();

LABEL_24:
  OUTLINED_FUNCTION_11_1();
}

void sub_1C9EE3E5C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void (*a21)(uint64_t),void (*a22)(uint64_t, uint64_t))
{
  OUTLINED_FUNCTION_14_1();
  uint64_t v25 = v24;
  uint64_t v27 = v26;
  uint64_t v29 = v28;
  uint64_t v46 = v30;
  uint64_t v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC7F020);
  uint64_t v32 = OUTLINED_FUNCTION_10_3(v31);
  MEMORY[0x1F4188790](v32);
  OUTLINED_FUNCTION_68();
  uint64_t v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC7FCF0);
  uint64_t v34 = OUTLINED_FUNCTION_10_3(v33);
  MEMORY[0x1F4188790](v34);
  OUTLINED_FUNCTION_97();
  uint64_t v35 = sub_1C9F07A48();
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_305();
  v36();
  uint64_t v37 = OUTLINED_FUNCTION_245();
  __swift_storeEnumTagSinglePayload(v37, v38, v39, v35);
  v27(v23);
  swift_bridgeObjectRetain();
  uint64_t v40 = OUTLINED_FUNCTION_324();
  v25(v40);
  uint64_t v41 = sub_1C9F069B8();
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_195();
  OUTLINED_FUNCTION_22_0();
  v42();
  uint64_t v43 = OUTLINED_FUNCTION_277();
  __swift_storeEnumTagSinglePayload(v43, v44, v45, v41);
  a21(v22);
  swift_bridgeObjectRetain();
  a22(v46, v29);
  OUTLINED_FUNCTION_11_1();
}

void sub_1C9EE4004(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21)
{
  OUTLINED_FUNCTION_14_1();
  a19 = v23;
  a20 = v24;
  int v70 = v25;
  OUTLINED_FUNCTION_161(v26, v27, v28, v29, v30, v31, v32);
  uint64_t v34 = v33;
  uint64_t v36 = v35;
  uint64_t v38 = v37;
  uint64_t v67 = a21;
  swift_getObjectType();
  char v39 = OUTLINED_FUNCTION_198();
  OUTLINED_FUNCTION_0();
  uint64_t v41 = v40;
  uint64_t v43 = *(void *)(v42 + 64);
  uint64_t v45 = MEMORY[0x1F4188790](v44);
  OUTLINED_FUNCTION_35_0(v45, v46, v47, v48, v49, v50, v51, v52, v66[0]);
  MEMORY[0x1F4188790](v53);
  OUTLINED_FUNCTION_42_0();
  MEMORY[0x1F4188790](v54);
  OUTLINED_FUNCTION_36_0((uint64_t)v66 - v55);
  MEMORY[0x1F4188790](v56);
  OUTLINED_FUNCTION_140();
  uint64_t v74 = v21;
  uint64_t v75 = v38;
  uint64_t v76 = v36;
  uint64_t v77 = v34;
  uint64_t v78 = v66[1];
  uint64_t v79 = v68;
  OUTLINED_FUNCTION_233((uint64_t)&a13);
  char v80 = *(_DWORD *)(v57 - 256);
  uint64_t v81 = v67;
  uint64_t v82 = v21;
  sub_1C9ECFD44();
  uint64_t v71 = v22;
  OUTLINED_FUNCTION_15_3();
  OUTLINED_FUNCTION_119();
  unint64_t v69 = v58 | 0x8000000000000000;
  char v59 = v72;
  OUTLINED_FUNCTION_6_3();
  sub_1C9F07CF8();
  uint64_t v60 = OUTLINED_FUNCTION_16_3(*(void *)((char *)v21 + OBJC_IVAR___SRDRequestDispatcherInternal_rdmbQueue));
  ((void (*)(uint64_t))v21)(v60);
  OUTLINED_FUNCTION_29_1();
  v21();
  OUTLINED_FUNCTION_9_4();
  uint64_t v61 = swift_allocObject();
  uint64_t v62 = OUTLINED_FUNCTION_22_1(v61);
  ((void (*)(uint64_t))v22)(v62);
  OUTLINED_FUNCTION_28_1();
  v22();
  *(void *)((char *)v21 + v43) = 0xD000000000000062;
  OUTLINED_FUNCTION_85((uint64_t)v21 + v43);
  *uint64_t v63 = sub_1C9EF9D0C;
  v63[1] = (uint64_t (*)())&v73;
  uint64_t v64 = OUTLINED_FUNCTION_7_1();
  *(void *)(v64 + 16) = sub_1C9EF9C40;
  *(void *)(v64 + 24) = v21;
  v83[4] = sub_1C9EFBBDC;
  v83[5] = v64;
  v83[0] = MEMORY[0x1E4F143A8];
  OUTLINED_FUNCTION_33_0(COERCE_DOUBLE(1107296256));
  v83[2] = sub_1C9EDF214;
  v83[3] = &block_descriptor_69_0;
  _Block_copy(v83);
  OUTLINED_FUNCTION_86();
  swift_release();
  OUTLINED_FUNCTION_210((uint64_t)&a16);
  _Block_release(v59);
  uint64_t v65 = *(void (**)(void))(v41 + 8);
  OUTLINED_FUNCTION_10_4();
  v65();
  OUTLINED_FUNCTION_10_4();
  v65();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_40_0();
  swift_release();
  if (v39) {
    __break(1u);
  }
  else {
    OUTLINED_FUNCTION_11_1();
  }
}

uint64_t sub_1C9EE42FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9, uint64_t a10)
{
  uint64_t v22 = a5;
  uint64_t v23 = a1;
  uint64_t v21 = a10;
  uint64_t v14 = sub_1C9F07A68();
  uint64_t v15 = *(void *)(v14 - 8);
  MEMORY[0x1F4188790](v14);
  uint64_t v17 = (char *)&v20 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C9EE4448();
  if (a8) {
    uint64_t v18 = sub_1C9F08148();
  }
  else {
    uint64_t v18 = 0;
  }
  sub_1C9EE4754(a2, a3, a4, v22, (uint64_t)v17, v18, a9 & 1, v21, v20, v21, v22, v23, v24, v25, v26, v27, v28, v29, v30,
    v31);
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v15 + 8))(v17, v14);
}

void sub_1C9EE4448()
{
  OUTLINED_FUNCTION_14_1();
  uint64_t v3 = v2;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBC7FCF8);
  uint64_t v5 = OUTLINED_FUNCTION_10_3(v4);
  MEMORY[0x1F4188790](v5);
  OUTLINED_FUNCTION_144();
  OUTLINED_FUNCTION_287();
  sub_1C9F07A58();
  sub_1C9F07A68();
  uint64_t v6 = OUTLINED_FUNCTION_349();
  if (__swift_getEnumTagSinglePayload(v6, 1, v1) == 1)
  {
    sub_1C9EFB940(v0, (uint64_t *)&unk_1EBC7FCF8);
    if (qword_1EBC7F680 != -1) {
      swift_once();
    }
    uint64_t v7 = sub_1C9F07E78();
    OUTLINED_FUNCTION_19(v7, (uint64_t)qword_1EBC7FEF0);
    uint64_t v8 = (void *)sub_1C9F07E68();
    os_log_type_t v9 = sub_1C9F08168();
    if (OUTLINED_FUNCTION_96(v9))
    {
      uint64_t v10 = (_DWORD *)OUTLINED_FUNCTION_7();
      uint64_t v11 = OUTLINED_FUNCTION_11_3();
      OUTLINED_FUNCTION_256(v11);
      *uint64_t v10 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v12 = OUTLINED_FUNCTION_228();
      OUTLINED_FUNCTION_60(v12);
      sub_1C9F08228();
      OUTLINED_FUNCTION_221();
      OUTLINED_FUNCTION_177(&dword_1C9EC7000, v13, v14, "Unknown input origin %s, using default .homeButton");
      swift_arrayDestroy();
      OUTLINED_FUNCTION_1();
      OUTLINED_FUNCTION_1();
    }
    else
    {

      OUTLINED_FUNCTION_222();
    }
    (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v1 - 8) + 104))(v3, *MEMORY[0x1E4FA2388], v1);
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v1 - 8) + 32))(v3, v0, v1);
  }
  OUTLINED_FUNCTION_11_1();
}

void sub_1C9EE4754(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  OUTLINED_FUNCTION_14_1();
  a19 = v22;
  a20 = v23;
  uint64_t v143 = v25;
  uint64_t v144 = v24;
  int v142 = v26;
  uint64_t v140 = v27;
  uint64_t v141 = v28;
  uint64_t v146 = v29;
  unint64_t v31 = v30;
  uint64_t v33 = v32;
  sub_1C9F07E98();
  OUTLINED_FUNCTION_0();
  uint64_t v137 = v35;
  uint64_t v138 = v34;
  MEMORY[0x1F4188790](v34);
  v135 = (char *)v126 - ((v36 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v136 = OUTLINED_FUNCTION_95();
  OUTLINED_FUNCTION_0();
  uint64_t v134 = v37;
  MEMORY[0x1F4188790](v38);
  OUTLINED_FUNCTION_115((uint64_t)v126 - ((v39 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC7F020);
  uint64_t v41 = OUTLINED_FUNCTION_10_3(v40);
  MEMORY[0x1F4188790](v41);
  OUTLINED_FUNCTION_2_0();
  v148 = v42;
  uint64_t v43 = OUTLINED_FUNCTION_141();
  OUTLINED_FUNCTION_0();
  uint64_t v45 = v44;
  MEMORY[0x1F4188790](v46);
  uint64_t v48 = (char *)v126 - ((v47 + 15) & 0xFFFFFFFFFFFFFFF0);
  OUTLINED_FUNCTION_270((uint64_t)&a15);
  MEMORY[0x1F4188790](v49);
  uint64_t v51 = (char *)v126 - v50;
  uint64_t v52 = sub_1C9F07BF8();
  OUTLINED_FUNCTION_0();
  uint64_t v54 = v53;
  MEMORY[0x1F4188790](v55);
  OUTLINED_FUNCTION_273();
  uint64_t v145 = v20;
  uint64_t v149 = v33;
  uint64_t v56 = v33;
  unint64_t v57 = v31;
  sub_1C9EFEEF8(v56, v31);
  if (v58)
  {
    uint64_t v59 = v58;
    uint64_t v139 = v45;
    v147 = (uint8_t *)v43;
    uint64_t v60 = *(void (**)(void))(v54 + 104);
    LODWORD(v131) = *MEMORY[0x1E4FA26B0];
    v130 = (void (*)(uint64_t, void, uint64_t))v60;
    v60(v21);
    char v61 = sub_1C9EFDE68();
    uint64_t v62 = *(void (**)(uint64_t))(v54 + 8);
    uint64_t v63 = OUTLINED_FUNCTION_308();
    v62(v63);
    if (v61)
    {
      v126[3] = v48;
      unint64_t v129 = v57;
      uint64_t v64 = v145;
      sub_1C9EF7A80();
      uint64_t v132 = v59;
      uint64_t v65 = v139;
      os_log_type_t v66 = *(void (**)(void))(v139 + 16);
      v128 = v51;
      uint64_t v67 = (uint64_t)v147;
      OUTLINED_FUNCTION_55();
      v66();
      uint64_t v131 = *(void *)(v64 + OBJC_IVAR___SRDRequestDispatcherInternal_instrumentationUtil);
      uint64_t v68 = (uint64_t)v148;
      v126[2] = v65 + 16;
      v126[1] = v66;
      OUTLINED_FUNCTION_55();
      v66();
      __swift_storeEnumTagSinglePayload(v68, 0, 1, v67);
      LODWORD(v130) = AFDeviceSupportsSiriUOD();
      int v127 = AFShouldRunAsrOnServerForUOD();
      unint64_t v69 = (void *)(v64 + OBJC_IVAR___SRDRequestDispatcherInternal_serverFallbackDisablingUtils);
      OUTLINED_FUNCTION_200((void *)(v64 + OBJC_IVAR___SRDRequestDispatcherInternal_serverFallbackDisablingUtils), *(void *)(v64 + OBJC_IVAR___SRDRequestDispatcherInternal_serverFallbackDisablingUtils + 24));
      swift_bridgeObjectRetain();
      uint64_t v70 = v146;
      uint64_t v71 = v144;
      LOBYTE(v66) = sub_1C9F07DE8();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_200(v69, v69[3]);
      swift_bridgeObjectRetain();
      LOBYTE(v68) = sub_1C9F07DE8();
      swift_bridgeObjectRelease();
      uint64_t v72 = (void *)(v64 + OBJC_IVAR___SRDRequestDispatcherInternal_featureChecker);
      OUTLINED_FUNCTION_200((void *)(v64 + OBJC_IVAR___SRDRequestDispatcherInternal_featureChecker), *(void *)(v64 + OBJC_IVAR___SRDRequestDispatcherInternal_featureChecker + 24));
      unint64_t v73 = v71;
      uint64_t v74 = v128;
      char v75 = sub_1C9F07D58();
      uint64_t v76 = v148;
      sub_1C9ED91A4((uint64_t)v148, v70, v71, 1, (char)v130, v127, v66 & 1, v68 & 1, v75 & 1);
      sub_1C9EFB940((uint64_t)v76, &qword_1EBC7F020);
      uint64_t v77 = v72[4];
      __swift_project_boxed_opaque_existential_1(v72, v72[3]);
      uint64_t v78 = sub_1C9F07D58();
      char v79 = MEMORY[0x1F4188790](v78);
      unint64_t v80 = v129;
      v126[-10] = v149;
      v126[-9] = v80;
      v126[-8] = v74;
      v126[-7] = v70;
      uint64_t v81 = v140;
      v126[-6] = v71;
      v126[-5] = v81;
      v126[-4] = v141;
      LOBYTE(v126[-3]) = v142 & 1;
      uint64_t v125 = v143;
      if (v79)
      {
        objc_allocWithZone((Class)sub_1C9F07118());
        uint64_t v82 = (void *)sub_1C9F07088();
        if (!v82)
        {
          uint64_t v83 = v139;
          uint64_t v84 = v147;
          if (qword_1EBC7F680 != -1) {
            swift_once();
          }
          uint64_t v85 = sub_1C9F07E78();
          OUTLINED_FUNCTION_64(v85, (uint64_t)qword_1EBC7FEF0);
          uint64_t v86 = (void *)sub_1C9F07E68();
          os_log_type_t v87 = sub_1C9F08168();
          if (!OUTLINED_FUNCTION_19_1(v87))
          {

            OUTLINED_FUNCTION_343();
            OUTLINED_FUNCTION_155();
LABEL_30:
            (*(void (**)(char *, uint8_t *))(v83 + 8))(v74, v84);
            goto LABEL_31;
          }
LABEL_27:
          uint64_t v120 = (_DWORD *)OUTLINED_FUNCTION_7();
          uint64_t v121 = OUTLINED_FUNCTION_11_3();
          OUTLINED_FUNCTION_282(v121);
          *uint64_t v120 = 136315138;
          swift_bridgeObjectRetain();
          uint64_t v122 = sub_1C9F01420(v146, v73, v150);
          OUTLINED_FUNCTION_107(v122);
          OUTLINED_FUNCTION_154();
          OUTLINED_FUNCTION_25_1(&dword_1C9EC7000, v123, v124, "Failed to create StartSpeechRequestMessage for request Id: %s");
          OUTLINED_FUNCTION_45_0();
          uint64_t v84 = v147;
          OUTLINED_FUNCTION_1();
          OUTLINED_FUNCTION_1();
          OUTLINED_FUNCTION_343();

          goto LABEL_30;
        }
      }
      else
      {
        objc_allocWithZone((Class)sub_1C9F06E38());
        uint64_t v82 = (void *)sub_1C9F06DA8();
        if (!v82)
        {
          uint64_t v83 = v139;
          uint64_t v84 = v147;
          if (qword_1EBC7F680 != -1) {
            swift_once();
          }
          uint64_t v118 = sub_1C9F07E78();
          OUTLINED_FUNCTION_64(v118, (uint64_t)qword_1EBC7FEF0);
          uint64_t v86 = (void *)sub_1C9F07E68();
          os_log_type_t v119 = sub_1C9F08168();
          if (!OUTLINED_FUNCTION_19_1(v119))
          {

            OUTLINED_FUNCTION_155();
            OUTLINED_FUNCTION_343();
            goto LABEL_30;
          }
          goto LABEL_27;
        }
      }
      uint64_t v105 = v145;
      sub_1C9ED0FAC(v82);

      uint64_t v106 = v139;
      uint64_t v107 = v147;
      if ((*(unsigned char *)(*(void *)(v105 + OBJC_IVAR___SRDRequestDispatcherInternal_assetLogger) + 32) & 1) != 0
        || (OUTLINED_FUNCTION_110(), v108))
      {
        OUTLINED_FUNCTION_323();
        OUTLINED_FUNCTION_8_1();
        v109();
        OUTLINED_FUNCTION_344();
        OUTLINED_FUNCTION_112();
        uint64_t v110 = swift_allocObject();
        OUTLINED_FUNCTION_199(v110);
        OUTLINED_FUNCTION_103();
        v111();
        int64_t v112 = (void *)(v105 + v77);
        *int64_t v112 = v146;
        v112[1] = v73;
        v150[4] = (uint64_t)sub_1C9EFAE00;
        v150[5] = v105;
        v150[0] = MEMORY[0x1E4F143A8];
        OUTLINED_FUNCTION_33_0(COERCE_DOUBLE(1107296256));
        v150[2] = (uint64_t)sub_1C9EDF1A8;
        v150[3] = (uint64_t)&block_descriptor_406;
        uint64_t v113 = _Block_copy(v150);
        swift_bridgeObjectRetain();
        swift_retain();
        uint64_t v114 = v133;
        sub_1C9F07EB8();
        v150[6] = MEMORY[0x1E4FBC860];
        sub_1C9EFBB30((unint64_t *)&unk_1EBC7F7E0, MEMORY[0x1E4FBCB00]);
        __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC7F7F8);
        sub_1C9EFB3B4((unint64_t *)&qword_1EBC7F800, &qword_1EBC7F7F8);
        uint64_t v115 = v135;
        uint64_t v107 = v147;
        sub_1C9F08278();
        MEMORY[0x1CB794A40](0, v114, v115, v113);
        _Block_release(v113);
        OUTLINED_FUNCTION_1_0();
        v116();
        OUTLINED_FUNCTION_231();
        OUTLINED_FUNCTION_1_0();
        v117();
        swift_release();
      }
      swift_release();
      (*(void (**)(char *, uint8_t *))(v106 + 8))(v74, v107);
    }
    else
    {
      if (qword_1EBC7F680 != -1) {
        swift_once();
      }
      uint64_t v95 = sub_1C9F07E78();
      uint64_t v96 = OUTLINED_FUNCTION_2_2(v95, (uint64_t)qword_1EBC7FEF0);
      os_log_type_t v97 = sub_1C9F08168();
      if (os_log_type_enabled(v96, v97))
      {
        long long v98 = (uint8_t *)OUTLINED_FUNCTION_7();
        uint64_t v149 = OUTLINED_FUNCTION_11_3();
        v150[0] = v149;
        uint64_t v132 = v59;
        *(_DWORD *)long long v98 = 136315138;
        v147 = v98 + 4;
        v148 = v98;
        v130(v21, v131, v52);
        sub_1C9F07BE8();
        unint64_t v100 = v99;
        uint64_t v101 = OUTLINED_FUNCTION_308();
        v62(v101);
        uint64_t v102 = OUTLINED_FUNCTION_322();
        uint64_t v104 = sub_1C9F01420(v102, v100, v103);
        OUTLINED_FUNCTION_60(v104);
        sub_1C9F08228();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_1C9EC7000, v96, v97, "Current session is not of type %s, cannot start speech request", v148, 0xCu);
        swift_arrayDestroy();
        OUTLINED_FUNCTION_1();
        OUTLINED_FUNCTION_1();
        OUTLINED_FUNCTION_343();
      }
      else
      {

        swift_release();
      }
    }
  }
  else
  {
    if (qword_1EBC7F680 != -1) {
      swift_once();
    }
    uint64_t v88 = sub_1C9F07E78();
    OUTLINED_FUNCTION_64(v88, (uint64_t)qword_1EBC7FEF0);
    unint64_t v89 = (void *)sub_1C9F07E68();
    os_log_type_t v90 = sub_1C9F08178();
    if (OUTLINED_FUNCTION_19_1(v90))
    {
      uint64_t v91 = (_DWORD *)OUTLINED_FUNCTION_7();
      v150[0] = OUTLINED_FUNCTION_11_3();
      *uint64_t v91 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v92 = sub_1C9F01420(v149, v31, v150);
      OUTLINED_FUNCTION_70(v92);
      OUTLINED_FUNCTION_154();
      OUTLINED_FUNCTION_25_1(&dword_1C9EC7000, v93, v94, "No active session for assistantId: %s cannot start speech request");
      OUTLINED_FUNCTION_168();
      OUTLINED_FUNCTION_1();
      OUTLINED_FUNCTION_1();
    }
    else
    {

      OUTLINED_FUNCTION_155();
    }
  }
LABEL_31:
  OUTLINED_FUNCTION_11_1();
}

uint64_t sub_1C9EE5310(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, unsigned __int8 a9, void *a10)
{
  uint64_t v29 = a5;
  uint64_t v30 = a7;
  uint64_t v28 = a4;
  unint64_t v31 = a10;
  int v32 = a9;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBC7FCF8);
  MEMORY[0x1F4188790](v10 - 8);
  uint64_t v12 = (char *)&v27 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC7F020);
  MEMORY[0x1F4188790](v13 - 8);
  uint64_t v15 = (char *)&v27 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC7FCF0);
  MEMORY[0x1F4188790](v16 - 8);
  uint64_t v18 = (char *)&v27 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = *MEMORY[0x1E4FA22F8];
  uint64_t v20 = sub_1C9F07A48();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v20 - 8) + 104))(v18, v19, v20);
  __swift_storeEnumTagSinglePayload((uint64_t)v18, 0, 1, v20);
  sub_1C9F070D8();
  swift_bridgeObjectRetain();
  sub_1C9F070A8();
  uint64_t v21 = sub_1C9F069B8();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v21 - 8) + 16))(v15, v28, v21);
  __swift_storeEnumTagSinglePayload((uint64_t)v15, 0, 1, v21);
  sub_1C9F07108();
  swift_bridgeObjectRetain();
  sub_1C9F070F8();
  uint64_t v22 = sub_1C9F07A68();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v22 - 8) + 16))(v12, v30, v22);
  __swift_storeEnumTagSinglePayload((uint64_t)v12, 0, 1, v22);
  sub_1C9F070B8();
  swift_retain();
  uint64_t v23 = v31;
  sub_1C9F070E8();
  uint64_t result = sub_1C9F07098();
  if (v23)
  {
    id v25 = objc_allocWithZone((Class)sub_1C9F07B28());
    id v26 = v23;
    sub_1C9F07B18();
    return sub_1C9F070C8();
  }
  return result;
}

uint64_t sub_1C9EE55EC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, unsigned __int8 a9, void *a10)
{
  uint64_t v29 = a5;
  uint64_t v30 = a7;
  uint64_t v28 = a4;
  unint64_t v31 = a10;
  int v32 = a9;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBC7FCF8);
  MEMORY[0x1F4188790](v10 - 8);
  uint64_t v12 = (char *)&v27 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC7F020);
  MEMORY[0x1F4188790](v13 - 8);
  uint64_t v15 = (char *)&v27 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC7FCF0);
  MEMORY[0x1F4188790](v16 - 8);
  uint64_t v18 = (char *)&v27 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = *MEMORY[0x1E4FA22F8];
  uint64_t v20 = sub_1C9F07A48();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v20 - 8) + 104))(v18, v19, v20);
  __swift_storeEnumTagSinglePayload((uint64_t)v18, 0, 1, v20);
  sub_1C9F06DF8();
  swift_bridgeObjectRetain();
  sub_1C9F06DC8();
  uint64_t v21 = sub_1C9F069B8();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v21 - 8) + 16))(v15, v28, v21);
  __swift_storeEnumTagSinglePayload((uint64_t)v15, 0, 1, v21);
  sub_1C9F06E28();
  swift_bridgeObjectRetain();
  sub_1C9F06E18();
  uint64_t v22 = sub_1C9F07A68();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v22 - 8) + 16))(v12, v30, v22);
  __swift_storeEnumTagSinglePayload((uint64_t)v12, 0, 1, v22);
  sub_1C9F06DD8();
  swift_retain();
  uint64_t v23 = v31;
  sub_1C9F06E08();
  uint64_t result = sub_1C9F06DB8();
  if (v23)
  {
    id v25 = objc_allocWithZone((Class)sub_1C9F07B28());
    id v26 = v23;
    sub_1C9F07B18();
    return sub_1C9F06DE8();
  }
  return result;
}

void sub_1C9EE58C8()
{
  OUTLINED_FUNCTION_14_1();
  char v6 = OUTLINED_FUNCTION_188();
  OUTLINED_FUNCTION_0();
  uint64_t v8 = v7;
  uint64_t v10 = *(void *)(v9 + 64);
  MEMORY[0x1F4188790](v11);
  OUTLINED_FUNCTION_52();
  MEMORY[0x1F4188790](v12);
  OUTLINED_FUNCTION_30_1();
  MEMORY[0x1F4188790](v13);
  OUTLINED_FUNCTION_124();
  MEMORY[0x1F4188790](v14);
  OUTLINED_FUNCTION_82();
  char v31 = 0;
  void v26[2] = &v31;
  uint64_t v27 = v4;
  uint64_t v28 = v5;
  uint64_t v29 = v0;
  sub_1C9ECFD44();
  OUTLINED_FUNCTION_27_1();
  OUTLINED_FUNCTION_182();
  OUTLINED_FUNCTION_6_3();
  sub_1C9F07CF8();
  uint64_t v15 = *(void (**)(uint64_t))(v8 + 16);
  OUTLINED_FUNCTION_18_2();
  v15(v16);
  OUTLINED_FUNCTION_18_2();
  v15(v17);
  OUTLINED_FUNCTION_20_2();
  uint64_t v18 = swift_allocObject();
  uint64_t v19 = OUTLINED_FUNCTION_49(v18);
  v2(v19);
  OUTLINED_FUNCTION_81();
  v2(v20);
  *(void *)(v10 + v1) = 0xD00000000000001ELL;
  OUTLINED_FUNCTION_92(v10 + v1);
  *uint64_t v21 = sub_1C9EF9D48;
  v21[1] = (uint64_t (*)())v26;
  uint64_t v22 = OUTLINED_FUNCTION_7_1();
  *(void *)(v22 + 16) = sub_1C9EF9C40;
  *(void *)(v22 + 24) = v10;
  v30[4] = sub_1C9EFBBDC;
  v30[5] = v22;
  v30[0] = MEMORY[0x1E4F143A8];
  OUTLINED_FUNCTION_153(COERCE_DOUBLE(1107296256));
  v30[2] = sub_1C9EDF214;
  uint64_t v30[3] = &block_descriptor_80;
  _Block_copy(v30);
  OUTLINED_FUNCTION_268();
  swift_release();
  OUTLINED_FUNCTION_307();
  _Block_release(v3);
  uint64_t v23 = *(void (**)(uint64_t))(v8 + 8);
  OUTLINED_FUNCTION_10_4();
  v23(v24);
  OUTLINED_FUNCTION_10_4();
  v23(v25);
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_40_0();
  swift_release();
  if (v6) {
    __break(1u);
  }
  else {
    OUTLINED_FUNCTION_11_1();
  }
}

uint64_t sub_1C9EE5B50(unsigned char *a1)
{
  uint64_t result = sub_1C9EE5BEC();
  *a1 = result & 1;
  return result;
}

uint64_t sub_1C9EE5BEC()
{
  sub_1C9F07BF8();
  OUTLINED_FUNCTION_0();
  MEMORY[0x1F4188790](v0);
  OUTLINED_FUNCTION_39();
  uint64_t v1 = OUTLINED_FUNCTION_287();
  if (sub_1C9EFEE58(v1, v2))
  {
    OUTLINED_FUNCTION_127();
    v3();
    OUTLINED_FUNCTION_195();
    char v4 = sub_1C9EFDE68();
    OUTLINED_FUNCTION_278();
    v5();
    swift_release();
  }
  else
  {
    char v4 = 0;
  }
  return v4 & 1;
}

void sub_1C9EE5CF4()
{
  OUTLINED_FUNCTION_14_1();
  dispatch_queue_t v34 = v5;
  char v6 = OUTLINED_FUNCTION_136();
  OUTLINED_FUNCTION_0();
  uint64_t v8 = v7;
  uint64_t v10 = MEMORY[0x1F4188790](v9);
  OUTLINED_FUNCTION_21_2(v10, v11, v12, v13, v14, v15, v16, v17, v32[0]);
  MEMORY[0x1F4188790](v18);
  v32[1] = (uint64_t)v32 - v19;
  OUTLINED_FUNCTION_76();
  MEMORY[0x1F4188790](v20);
  OUTLINED_FUNCTION_62();
  MEMORY[0x1F4188790](v21);
  uint64_t v23 = (char *)v32 - v22;
  uint64_t v37 = v0;
  uint64_t v38 = v1;
  uint64_t v39 = v3;
  uint64_t v40 = v4;
  uint64_t v41 = v0;
  dispatch_queue_t v42 = v34;
  uint64_t v24 = (char *)sub_1C9ECFD44();
  uint64_t v35 = v23;
  OUTLINED_FUNCTION_15_3();
  OUTLINED_FUNCTION_119();
  v32[0] = v25 | 0x8000000000000000;
  uint64_t v33 = v2;
  OUTLINED_FUNCTION_211();
  dispatch_queue_t v34 = *(dispatch_queue_t *)(v0 + OBJC_IVAR___SRDRequestDispatcherInternal_rdmbQueue);
  id v26 = (void (*)(void))v8[2];
  OUTLINED_FUNCTION_18_2();
  v26();
  OUTLINED_FUNCTION_18_2();
  v26();
  OUTLINED_FUNCTION_39_0();
  uint64_t v27 = swift_allocObject();
  uint64_t v28 = (void (*)(void))v8[4];
  OUTLINED_FUNCTION_17_2();
  v28();
  OUTLINED_FUNCTION_17_2();
  v28();
  OUTLINED_FUNCTION_137((unint64_t *)&v24[v27]);
  *uint64_t v29 = sub_1C9EF9D5C;
  v29[1] = (uint64_t (*)())&v36;
  uint64_t v30 = OUTLINED_FUNCTION_7_1();
  *(void *)(v30 + 16) = sub_1C9EF9C40;
  *(void *)(v30 + 24) = v27;
  v43[4] = sub_1C9EFBBDC;
  v43[5] = v30;
  v43[0] = MEMORY[0x1E4F143A8];
  OUTLINED_FUNCTION_33_0(COERCE_DOUBLE(1107296256));
  v43[2] = sub_1C9EDF214;
  v43[3] = &block_descriptor_91;
  _Block_copy(v43);
  OUTLINED_FUNCTION_283();
  swift_release();
  dispatch_sync(v34, v24);
  _Block_release(v24);
  char v31 = (void (*)(void))v8[1];
  OUTLINED_FUNCTION_63();
  v31();
  OUTLINED_FUNCTION_63();
  v31();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_40_0();
  swift_release();
  if (v6) {
    __break(1u);
  }
  else {
    OUTLINED_FUNCTION_11_1();
  }
}

void sub_1C9EE6064(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  if ((a5 & 2) != 0)
  {
    MEMORY[0x1F4188790](a1);
    id v7 = objc_allocWithZone((Class)sub_1C9F07B08());
    OUTLINED_FUNCTION_80();
    uint64_t v8 = (void *)sub_1C9F07AB8();
    if (v8)
    {
      uint64_t v9 = v8;
      sub_1C9ED0FAC(v8);
    }
    else
    {
      if (qword_1EBC7F680 != -1) {
        swift_once();
      }
      uint64_t v10 = sub_1C9F07E78();
      OUTLINED_FUNCTION_47_0(v10, (uint64_t)qword_1EBC7FEF0);
      uint64_t v11 = (void *)sub_1C9F07E68();
      os_log_type_t v12 = sub_1C9F08168();
      if (OUTLINED_FUNCTION_180(v12))
      {
        uint64_t v13 = (_DWORD *)OUTLINED_FUNCTION_7();
        uint64_t v16 = OUTLINED_FUNCTION_11_3();
        *uint64_t v13 = 136315138;
        swift_bridgeObjectRetain();
        sub_1C9F01420(a1, a2, &v16);
        sub_1C9F08228();
        OUTLINED_FUNCTION_194();
        OUTLINED_FUNCTION_311(&dword_1C9EC7000, v14, v15, "Cannot create PrewarmNLMessage for assistantId: %s");
        swift_arrayDestroy();
        OUTLINED_FUNCTION_1();
        OUTLINED_FUNCTION_1();
      }
      else
      {

        OUTLINED_FUNCTION_146();
      }
    }
  }
}

uint64_t sub_1C9EE6234()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC7FD50);
  MEMORY[0x1F4188790](v0 - 8);
  uint64_t v2 = (char *)&v11 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC7FCF0);
  MEMORY[0x1F4188790](v3 - 8);
  uint64_t v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = *MEMORY[0x1E4FA22F8];
  uint64_t v7 = sub_1C9F07A48();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v7 - 8) + 104))(v5, v6, v7);
  __swift_storeEnumTagSinglePayload((uint64_t)v5, 0, 1, v7);
  sub_1C9F07AF8();
  swift_bridgeObjectRetain();
  sub_1C9F07AC8();
  swift_bridgeObjectRetain();
  sub_1C9F07AD8();
  uint64_t v8 = *MEMORY[0x1E4FA26B0];
  uint64_t v9 = sub_1C9F07BF8();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v9 - 8) + 104))(v2, v8, v9);
  __swift_storeEnumTagSinglePayload((uint64_t)v2, 0, 1, v9);
  return sub_1C9F07AE8();
}

void sub_1C9EE6410()
{
  OUTLINED_FUNCTION_14_1();
  char v4 = OUTLINED_FUNCTION_198();
  OUTLINED_FUNCTION_0();
  uint64_t v6 = v5;
  uint64_t v8 = *(void *)(v7 + 64);
  MEMORY[0x1F4188790](v9);
  OUTLINED_FUNCTION_52();
  MEMORY[0x1F4188790](v10);
  OUTLINED_FUNCTION_30_1();
  MEMORY[0x1F4188790](v11);
  OUTLINED_FUNCTION_124();
  MEMORY[0x1F4188790](v12);
  OUTLINED_FUNCTION_82();
  uint64_t v21 = v0;
  uint64_t v22 = v0;
  sub_1C9ECFD44();
  OUTLINED_FUNCTION_27_1();
  OUTLINED_FUNCTION_182();
  OUTLINED_FUNCTION_6_3();
  sub_1C9F07CF8();
  uint64_t v19 = *(NSObject **)(v0 + OBJC_IVAR___SRDRequestDispatcherInternal_rdmbQueue);
  uint64_t v13 = *(void (**)(void))(v6 + 16);
  OUTLINED_FUNCTION_18_2();
  v13();
  OUTLINED_FUNCTION_18_2();
  v13();
  OUTLINED_FUNCTION_20_2();
  uint64_t v14 = swift_allocObject();
  uint64_t v15 = OUTLINED_FUNCTION_49(v14);
  ((void (*)(uint64_t))v2)(v15);
  OUTLINED_FUNCTION_81();
  v2();
  *(void *)(v8 + v1) = 0xD000000000000020;
  OUTLINED_FUNCTION_92(v8 + v1);
  *uint64_t v16 = sub_1C9EF9DB4;
  v16[1] = (uint64_t (*)())&v20;
  uint64_t v17 = OUTLINED_FUNCTION_7_1();
  *(void *)(v17 + 16) = sub_1C9EF9C40;
  *(void *)(v17 + 24) = v8;
  v23[4] = sub_1C9EFBBDC;
  v23[5] = v17;
  v23[0] = MEMORY[0x1E4F143A8];
  OUTLINED_FUNCTION_153(COERCE_DOUBLE(1107296256));
  v23[2] = sub_1C9EDF214;
  v23[3] = &block_descriptor_102;
  _Block_copy(v23);
  OUTLINED_FUNCTION_268();
  swift_release();
  dispatch_sync(v19, v3);
  _Block_release(v3);
  uint64_t v18 = *(void (**)(void))(v6 + 8);
  OUTLINED_FUNCTION_10_4();
  v18();
  OUTLINED_FUNCTION_10_4();
  v18();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_40_0();
  swift_release();
  if (v4) {
    __break(1u);
  }
  else {
    OUTLINED_FUNCTION_11_1();
  }
}

uint64_t sub_1C9EE6694(uint64_t a1, void *a2)
{
  v11[1] = a1;
  uint64_t v3 = sub_1C9F07C98();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  uint64_t v6 = (char *)v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v7 = objc_msgSend(a2, sel_assistantId);
  v11[0] = sub_1C9F07FE8();

  id v8 = objc_msgSend(a2, sel_languageCode);
  sub_1C9F07FE8();

  objc_msgSend(a2, sel_understandingOnDevice);
  sub_1C9EF91EC(a2, (SEL *)&selRef_sharedUserId);
  if (!v9)
  {
    sub_1C9F07C88();
    sub_1C9F07C78();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  }
  objc_msgSend(a2, sel_clientAuditToken);
  char v12 = 0;
  sub_1C9EE68D4();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void sub_1C9EE68D4()
{
  OUTLINED_FUNCTION_14_1();
  uint64_t v2 = v0;
  uint64_t v69 = v3;
  uint64_t v64 = v4;
  uint64_t v65 = v5;
  int v68 = v6;
  uint64_t v66 = v7;
  uint64_t v67 = v8;
  uint64_t v10 = v9;
  uint64_t v12 = v11;
  v63[6] = sub_1C9F07E98();
  OUTLINED_FUNCTION_0();
  v63[5] = v13;
  MEMORY[0x1F4188790](v14);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_320(v15);
  v63[4] = OUTLINED_FUNCTION_95();
  OUTLINED_FUNCTION_0();
  v63[2] = v16;
  MEMORY[0x1F4188790](v17);
  OUTLINED_FUNCTION_115((uint64_t)v63 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC7FD70);
  uint64_t v20 = OUTLINED_FUNCTION_10_3(v19);
  MEMORY[0x1F4188790](v20);
  OUTLINED_FUNCTION_97();
  sub_1C9F07BF8();
  OUTLINED_FUNCTION_0();
  MEMORY[0x1F4188790](v21);
  OUTLINED_FUNCTION_220();
  uint64_t v71 = sub_1C9F069B8();
  OUTLINED_FUNCTION_0();
  uint64_t v70 = v22;
  uint64_t v24 = *(const void **)(v23 + 64);
  MEMORY[0x1F4188790](v25);
  OUTLINED_FUNCTION_115((uint64_t)v63 - (((unint64_t)v24 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x1F4188790](v26);
  uint64_t v28 = (char *)v63 - v27;
  sub_1C9EE7664();
  OUTLINED_FUNCTION_127();
  v29();
  OUTLINED_FUNCTION_287();
  sub_1C9EFF3F0();
  uint64_t v30 = v10;
  OUTLINED_FUNCTION_149();
  v31();
  uint64_t v32 = v12;
  uint64_t v33 = v64;
  swift_bridgeObjectRetain();
  uint64_t v34 = v65;
  uint64_t v35 = v33;
  sub_1C9F07C68();
  sub_1C9F07C98();
  uint64_t v36 = OUTLINED_FUNCTION_245();
  __swift_storeEnumTagSinglePayload(v36, v37, v38, v39);
  uint64_t v40 = v2 + OBJC_IVAR___SRDRequestDispatcherInternal_sessionUserId;
  swift_beginAccess();
  sub_1C9EFAF60(v1, v40);
  swift_endAccess();
  uint64_t v41 = v66;
  swift_bridgeObjectRetain();
  uint64_t v42 = v67;
  uint64_t v72 = v2;
  sub_1C9EDF254(v67, v41);
  uint64_t v73 = v32;
  uint64_t v74 = v30;
  char v75 = v28;
  uint64_t v76 = v42;
  uint64_t v77 = v41;
  char v78 = v68;
  uint64_t v79 = v34;
  uint64_t v80 = v35;
  uint64_t v81 = v69;
  objc_allocWithZone((Class)sub_1C9F06C18());
  uint64_t v43 = sub_1C9F06B98();
  if (v43)
  {
    uint64_t v44 = (void *)v43;
    uint64_t v45 = *(void *)(v72 + OBJC_IVAR___SRDRequestDispatcherInternal_assetLogger);
    if ((*(unsigned char *)(v45 + 32) & 1) != 0 || (OUTLINED_FUNCTION_110(), v46))
    {
      uint64_t v69 = *(void *)(v45 + 16);
      OUTLINED_FUNCTION_8_1();
      v47();
      uint64_t v48 = swift_allocObject();
      OUTLINED_FUNCTION_285(v48);
      OUTLINED_FUNCTION_103();
      v49();
      v82[4] = sub_1C9EFB090;
      v82[5] = v24;
      v82[0] = MEMORY[0x1E4F143A8];
      OUTLINED_FUNCTION_33_0(COERCE_DOUBLE(1107296256));
      v82[2] = sub_1C9EDF1A8;
      v82[3] = &block_descriptor_399;
      _Block_copy(v82);
      OUTLINED_FUNCTION_350();
      uint64_t v50 = v63[1];
      sub_1C9F07EB8();
      uint64_t v83 = MEMORY[0x1E4FBC860];
      sub_1C9EFBB30((unint64_t *)&unk_1EBC7F7E0, MEMORY[0x1E4FBCB00]);
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC7F7F8);
      sub_1C9EFB3B4((unint64_t *)&qword_1EBC7F800, &qword_1EBC7F7F8);
      uint64_t v51 = v63[3];
      sub_1C9F08278();
      MEMORY[0x1CB794A40](0, v50, v51, v24);
      _Block_release(v24);
      OUTLINED_FUNCTION_230();
      OUTLINED_FUNCTION_1_0();
      v52();
      OUTLINED_FUNCTION_251();
      OUTLINED_FUNCTION_1_0();
      v53();
      swift_release();
    }
    sub_1C9ED0FAC(v44);
  }
  else
  {
    if (qword_1EBC7F680 != -1) {
      swift_once();
    }
    uint64_t v54 = sub_1C9F07E78();
    OUTLINED_FUNCTION_46_0(v54, (uint64_t)qword_1EBC7FEF0);
    uint64_t v44 = (void *)sub_1C9F07E68();
    os_log_type_t v55 = sub_1C9F08168();
    if (!OUTLINED_FUNCTION_19_1(v55))
    {

      OUTLINED_FUNCTION_100();
      goto LABEL_12;
    }
    OUTLINED_FUNCTION_7();
    uint64_t v56 = OUTLINED_FUNCTION_11_3();
    OUTLINED_FUNCTION_282(v56);
    OUTLINED_FUNCTION_74(4.8149e-34);
    uint64_t v57 = OUTLINED_FUNCTION_326();
    uint64_t v83 = sub_1C9F01420(v57, v58, v59);
    sub_1C9F08228();
    OUTLINED_FUNCTION_88();
    OUTLINED_FUNCTION_25_1(&dword_1C9EC7000, v60, v61, "Cannot create SessionStartedMessage for assistantId: %s");
    OUTLINED_FUNCTION_45_0();
    OUTLINED_FUNCTION_1();
    OUTLINED_FUNCTION_1();
  }

LABEL_12:
  OUTLINED_FUNCTION_26_1();
  v62();
  OUTLINED_FUNCTION_11_1();
}

uint64_t sub_1C9EE6F88(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  int v27 = a7;
  uint64_t v25 = a4;
  uint64_t v26 = a5;
  uint64_t v28 = a8;
  uint64_t v29 = a10;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC7FD70);
  MEMORY[0x1F4188790](v10 - 8);
  uint64_t v12 = (char *)&v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC7F020);
  MEMORY[0x1F4188790](v13 - 8);
  uint64_t v15 = (char *)&v24 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC7FCF0);
  MEMORY[0x1F4188790](v16 - 8);
  uint64_t v18 = (char *)&v24 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = *MEMORY[0x1E4FA22F8];
  uint64_t v20 = sub_1C9F07A48();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v20 - 8) + 104))(v18, v19, v20);
  __swift_storeEnumTagSinglePayload((uint64_t)v18, 0, 1, v20);
  sub_1C9F06BE8();
  swift_bridgeObjectRetain();
  sub_1C9F06BA8();
  uint64_t v21 = sub_1C9F069B8();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v21 - 8) + 16))(v15, v25, v21);
  __swift_storeEnumTagSinglePayload((uint64_t)v15, 0, 1, v21);
  sub_1C9F06C08();
  swift_bridgeObjectRetain();
  sub_1C9F06BB8();
  sub_1C9F06BD8();
  swift_bridgeObjectRetain();
  sub_1C9F07C68();
  uint64_t v22 = sub_1C9F07C98();
  __swift_storeEnumTagSinglePayload((uint64_t)v12, 0, 1, v22);
  sub_1C9F06BF8();
  return sub_1C9F06BC8();
}

void sub_1C9EE7200()
{
  OUTLINED_FUNCTION_14_1();
  uint64_t v3 = v0;
  char v5 = v4;
  uint64_t v7 = v6;
  char v8 = sub_1C9F07E58();
  OUTLINED_FUNCTION_0();
  uint64_t v10 = v9;
  uint64_t v12 = *(void *)(v11 + 64);
  MEMORY[0x1F4188790](v13);
  uint64_t v26 = (char *)v25 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  OUTLINED_FUNCTION_76();
  MEMORY[0x1F4188790](v14);
  OUTLINED_FUNCTION_30_1();
  MEMORY[0x1F4188790](v15);
  OUTLINED_FUNCTION_327();
  MEMORY[0x1F4188790](v16);
  OUTLINED_FUNCTION_329();
  v30[4] = v7;
  char v31 = v5;
  sub_1C9ECFD44();
  uint64_t v29 = v2;
  OUTLINED_FUNCTION_27_1();
  OUTLINED_FUNCTION_182();
  v25[1] = v17 | 0x8000000000000000;
  uint64_t v27 = v1;
  OUTLINED_FUNCTION_6_3();
  sub_1C9F07CF8();
  uint64_t v28 = *(void *)(v3 + OBJC_IVAR___SRDRequestDispatcherInternal_rdmbQueue);
  uint64_t v18 = (void (*)(void))v10[2];
  OUTLINED_FUNCTION_18_2();
  v18();
  uint64_t v19 = v26;
  OUTLINED_FUNCTION_18_2();
  v18();
  OUTLINED_FUNCTION_7_4();
  uint64_t v20 = swift_allocObject();
  uint64_t v21 = (void (*)(void))v10[4];
  OUTLINED_FUNCTION_17_2();
  v21();
  OUTLINED_FUNCTION_17_2();
  v21();
  *(uint64_t *)((char *)&type metadata for Logger.Kind + v20) = 0xD000000000000026;
  OUTLINED_FUNCTION_92((uint64_t)&type metadata for Logger + v20);
  void *v22 = sub_1C9EF9DC4;
  v22[1] = (uint64_t (*)())v30;
  uint64_t v23 = OUTLINED_FUNCTION_7_1();
  *(void *)(v23 + 16) = sub_1C9EF9C40;
  *(void *)(v23 + 24) = v20;
  v32[4] = sub_1C9EFBBDC;
  v32[5] = v23;
  v32[0] = MEMORY[0x1E4F143A8];
  OUTLINED_FUNCTION_33_0(COERCE_DOUBLE(1107296256));
  v32[2] = sub_1C9EDF214;
  uint64_t v32[3] = &block_descriptor_113;
  _Block_copy(v32);
  OUTLINED_FUNCTION_53();
  swift_release();
  OUTLINED_FUNCTION_307();
  _Block_release(v19);
  uint64_t v24 = (void (*)(void))v10[1];
  OUTLINED_FUNCTION_13_2();
  v24();
  OUTLINED_FUNCTION_13_2();
  v24();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_40_0();
  swift_release();
  if (v8) {
    __break(1u);
  }
  else {
    OUTLINED_FUNCTION_11_1();
  }
}

uint64_t sub_1C9EE74C0()
{
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBC7FE68);
  uint64_t v0 = sub_1C9F07BF8();
  uint64_t v1 = *(void *)(v0 - 8);
  unint64_t v2 = (*(unsigned __int8 *)(v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_1C9F09580;
  (*(void (**)(unint64_t, void, uint64_t))(v1 + 104))(v3 + v2, *MEMORY[0x1E4FA26B0], v0);
  sub_1C9EE7664();
  swift_setDeallocating();
  return sub_1C9EF8550();
}

void sub_1C9EE7664()
{
  OUTLINED_FUNCTION_14_1();
  LODWORD(v123) = v2;
  int v118 = v3;
  os_log_t v120 = v4;
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  uint64_t v10 = v9;
  uint64_t v121 = sub_1C9F07E78();
  OUTLINED_FUNCTION_0();
  uint64_t v117 = v11;
  MEMORY[0x1F4188790](v12);
  OUTLINED_FUNCTION_218();
  sub_1C9F07E98();
  OUTLINED_FUNCTION_0();
  uint64_t v113 = v14;
  uint64_t v114 = v13;
  MEMORY[0x1F4188790](v13);
  id v111 = (char *)&v102 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v112 = OUTLINED_FUNCTION_95();
  OUTLINED_FUNCTION_0();
  uint64_t v110 = v16;
  MEMORY[0x1F4188790](v17);
  uint64_t v109 = (char *)&v102 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v116 = OUTLINED_FUNCTION_141();
  OUTLINED_FUNCTION_0();
  uint64_t v108 = v19;
  uint64_t v21 = *(void *)(v20 + 64);
  MEMORY[0x1F4188790](v22);
  uint64_t v107 = (char *)&v102 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = sub_1C9F07BF8();
  OUTLINED_FUNCTION_0();
  uint64_t v124 = v24;
  uint64_t v26 = MEMORY[0x1F4188790](v25);
  uint64_t v27 = MEMORY[0x1F4188790](v26);
  uint64_t v125 = (char *)&v102 - v28;
  MEMORY[0x1F4188790](v27);
  uint64_t v115 = v0;
  uint64_t v29 = v10;
  uint64_t v30 = v10;
  unint64_t v31 = v8;
  uint64_t v119 = *(void *)(v0 + OBJC_IVAR___SRDRequestDispatcherInternal_sessionsManager);
  uint64_t v32 = sub_1C9EFEE58(v30, v8);
  uint64_t v122 = v6;
  if (v32)
  {
    if (v6)
    {
      uint64_t v103 = v29;
      uint64_t v33 = *(void *)(v6 + 16);
      uint64_t v106 = v1;
      uint64_t v105 = v32;
      uint64_t v123 = OBJC_IVAR____TtC14SiriMessageBus7Session_conversationSession;
      if (!v33)
      {
LABEL_8:
        if (qword_1EBC7F680 != -1) {
          swift_once();
        }
        uint64_t v37 = v121;
        __swift_project_value_buffer(v121, (uint64_t)qword_1EBC7FEF0);
        uint64_t v38 = v117;
        uint64_t v39 = v106;
        OUTLINED_FUNCTION_8_1();
        v40();
        swift_retain_n();
        OUTLINED_FUNCTION_318();
        OUTLINED_FUNCTION_163();
        uint64_t v41 = sub_1C9F07E68();
        int v42 = sub_1C9F08168();
        if (os_log_type_enabled(v41, (os_log_type_t)v42))
        {
          int v118 = v42;
          os_log_t v120 = v41;
          uint64_t v43 = swift_slowAlloc();
          uint64_t v115 = swift_slowAlloc();
          v126[0] = v115;
          *(_DWORD *)uint64_t v43 = 136315906;
          uint64_t v44 = sub_1C9F07BE8();
          uint64_t v46 = sub_1C9F01420(v44, v45, v126);
          OUTLINED_FUNCTION_60(v46);
          sub_1C9F08228();
          swift_release_n();
          swift_bridgeObjectRelease();
          uint64_t v119 = v43;
          *(_WORD *)(v43 + 12) = 2080;
          if (v33)
          {
            unint64_t v104 = v31;
            uint64_t v47 = v124 + 16;
            uint64_t v48 = *(void *)(v124 + 16);
            uint64_t v49 = v122 + ((*(unsigned __int8 *)(v124 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v124 + 80));
            uint64_t v123 = *(void *)(v124 + 72);
            uint64_t v124 = v48;
            uint64_t v50 = (void (**)(char *, uint64_t))(v47 - 8);
            swift_bridgeObjectRetain();
            uint64_t v51 = (void *)MEMORY[0x1E4FBC860];
            do
            {
              uint64_t v52 = v125;
              ((void (*)(char *, uint64_t, uint64_t))v124)(v125, v49, v23);
              uint64_t v53 = sub_1C9F07BE8();
              uint64_t v55 = v54;
              (*v50)(v52, v23);
              if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
                uint64_t v51 = sub_1C9EF874C(0, v51[2] + 1, 1, (uint64_t)v51, &qword_1EBC7F858, (void (*)(void, uint64_t, void *, uint64_t))sub_1C9EF8B58, (void (*)(uint64_t, uint64_t, void *))sub_1C9EF8F94);
              }
              unint64_t v57 = v51[2];
              unint64_t v56 = v51[3];
              if (v57 >= v56 >> 1) {
                uint64_t v51 = sub_1C9EF874C((void *)(v56 > 1), v57 + 1, 1, (uint64_t)v51, &qword_1EBC7F858, (void (*)(void, uint64_t, void *, uint64_t))sub_1C9EF8B58, (void (*)(uint64_t, uint64_t, void *))sub_1C9EF8F94);
              }
              v51[2] = v57 + 1;
              unint64_t v58 = &v51[2 * v57];
              v58[4] = v53;
              v58[5] = v55;
              v49 += v123;
              --v33;
            }
            while (v33);
            swift_bridgeObjectRelease();
            uint64_t v38 = v117;
            unint64_t v31 = v104;
          }
          else
          {
            uint64_t v51 = (void *)MEMORY[0x1E4FBC860];
          }
          uint64_t v127 = (uint64_t)v51;
          uint64_t v88 = v119;
          unint64_t v89 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA5CEC90);
          sub_1C9EFB3B4(&qword_1EA5CEC98, &qword_1EA5CEC90);
          sub_1C9F07FB8();
          OUTLINED_FUNCTION_348();
          swift_bridgeObjectRelease();
          uint64_t v90 = OUTLINED_FUNCTION_322();
          uint64_t v127 = sub_1C9F01420(v90, v89, v91);
          sub_1C9F08228();
          OUTLINED_FUNCTION_138();
          swift_bridgeObjectRelease();
          *(_WORD *)(v88 + 22) = 2080;
          sub_1C9EFBB30((unint64_t *)&unk_1EBC7F010, MEMORY[0x1E4F27990]);
          uint64_t v92 = sub_1C9F08378();
          uint64_t v94 = sub_1C9F01420(v92, v93, v126);
          OUTLINED_FUNCTION_248(v94);
          sub_1C9F08228();
          swift_release_n();
          swift_bridgeObjectRelease();
          *(_WORD *)(v88 + 32) = 2080;
          swift_bridgeObjectRetain();
          uint64_t v95 = sub_1C9F01420(v103, v31, v126);
          OUTLINED_FUNCTION_248(v95);
          sub_1C9F08228();
          OUTLINED_FUNCTION_26_0();
          os_log_t v96 = v120;
          _os_log_impl(&dword_1C9EC7000, v120, (os_log_type_t)v118, "Current session type: %s is different from given types: %s not ending sessionId: %s for assistantId: %s", (uint8_t *)v88, 0x2Au);
          swift_arrayDestroy();
          OUTLINED_FUNCTION_1();
          OUTLINED_FUNCTION_1();
          swift_release();

          (*(void (**)(uint64_t, uint64_t))(v38 + 8))(v106, v121);
        }
        else
        {

          OUTLINED_FUNCTION_27_0();
          OUTLINED_FUNCTION_209();
          swift_release_n();
          (*(void (**)(uint64_t, uint64_t))(v38 + 8))(v39, v37);
        }
        goto LABEL_40;
      }
      unint64_t v104 = v8;
      uint64_t v34 = v6 + ((*(unsigned __int8 *)(v124 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v124 + 80));
      uint64_t v35 = *(void *)(v124 + 72);
      sub_1C9EFBB30((unint64_t *)&unk_1EBC7FD38, MEMORY[0x1E4FA26C0]);
      swift_bridgeObjectRetain();
      uint64_t v36 = v33;
      while ((sub_1C9F07FC8() & 1) == 0)
      {
        v34 += v35;
        if (!--v36)
        {
          swift_bridgeObjectRelease();
          unint64_t v31 = v104;
          goto LABEL_8;
        }
      }
      swift_bridgeObjectRelease();
    }
    if (v118)
    {
      OUTLINED_FUNCTION_127();
      v66();
      char v67 = OUTLINED_FUNCTION_353();
      uint64_t v68 = OUTLINED_FUNCTION_326();
      v69(v68);
      if (v67)
      {
        uint64_t v70 = *(void *)(v115 + OBJC_IVAR___SRDRequestDispatcherInternal_assetLogger);
        if ((*(unsigned char *)(v70 + 32) & 1) != 0 || *(unsigned char *)(v70 + 33) == 1)
        {
          uint64_t v125 = *(char **)(v70 + 16);
          uint64_t v71 = v108;
          uint64_t v72 = v107;
          uint64_t v73 = v116;
          OUTLINED_FUNCTION_8_1();
          v74();
          unint64_t v75 = (*(unsigned __int8 *)(v71 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v71 + 80);
          uint64_t v76 = swift_allocObject();
          *(void *)(v76 + 16) = v70;
          (*(void (**)(unint64_t, char *, uint64_t))(v71 + 32))(v76 + v75, v72, v73);
          void v126[4] = (uint64_t)sub_1C9EFAF48;
          v126[5] = v76;
          v126[0] = MEMORY[0x1E4F143A8];
          OUTLINED_FUNCTION_33_0(COERCE_DOUBLE(1107296256));
          v126[2] = (uint64_t)sub_1C9EDF1A8;
          v126[3] = (uint64_t)&block_descriptor_393;
          uint64_t v77 = _Block_copy(v126);
          swift_retain();
          char v78 = v109;
          sub_1C9F07EB8();
          uint64_t v127 = MEMORY[0x1E4FBC860];
          sub_1C9EFBB30((unint64_t *)&unk_1EBC7F7E0, MEMORY[0x1E4FBCB00]);
          __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC7F7F8);
          sub_1C9EFB3B4((unint64_t *)&qword_1EBC7F800, &qword_1EBC7F7F8);
          uint64_t v79 = v111;
          sub_1C9F08278();
          MEMORY[0x1CB794A40](0, v78, v79, v77);
          _Block_release(v77);
          OUTLINED_FUNCTION_203();
          OUTLINED_FUNCTION_1_0();
          v80();
          OUTLINED_FUNCTION_251();
          OUTLINED_FUNCTION_1_0();
          v81();
          swift_release();
        }
      }
    }
    sub_1C9EFF644();
    swift_release();
  }
  else if ((v123 & 1) != 0 && v122)
  {
    uint64_t v59 = v124;
    OUTLINED_FUNCTION_127();
    v60();
    uint64_t v61 = *(void *)(v122 + 16);
    if (v61)
    {
      uint64_t v62 = v121;
      uint64_t v63 = v59;
      uint64_t v64 = v122 + ((*(unsigned __int8 *)(v59 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v59 + 80));
      uint64_t v65 = *(void *)(v63 + 72);
      sub_1C9EFBB30((unint64_t *)&unk_1EBC7FD38, MEMORY[0x1E4FA26C0]);
      OUTLINED_FUNCTION_349();
      swift_bridgeObjectRetain();
      while (1)
      {
        OUTLINED_FUNCTION_275();
        if (sub_1C9F07FC8()) {
          break;
        }
        v64 += v65;
        if (!--v61) {
          goto LABEL_35;
        }
      }
      OUTLINED_FUNCTION_1_0();
      v83();
      uint64_t v84 = swift_bridgeObjectRelease();
      MEMORY[0x1F4188790](v84);
      *(&v102 - 2) = v29;
      *(&v102 - 1) = v31;
      id v85 = objc_allocWithZone((Class)sub_1C9F07BB8());
      uint64_t v86 = (void *)sub_1C9F07B78();
      if (v86)
      {
        os_log_type_t v87 = v86;
        sub_1C9ED0FAC(v86);
      }
      else
      {
        if (qword_1EBC7F680 != -1) {
          swift_once();
        }
        __swift_project_value_buffer(v62, (uint64_t)qword_1EBC7FEF0);
        OUTLINED_FUNCTION_131();
        os_log_type_t v87 = (void *)sub_1C9F07E68();
        os_log_type_t v97 = sub_1C9F08168();
        if (!OUTLINED_FUNCTION_19_1(v97))
        {

          OUTLINED_FUNCTION_132();
          goto LABEL_40;
        }
        OUTLINED_FUNCTION_7();
        uint64_t v98 = OUTLINED_FUNCTION_11_3();
        OUTLINED_FUNCTION_282(v98);
        OUTLINED_FUNCTION_312(4.8149e-34);
        uint64_t v99 = sub_1C9F01420(v29, v31, v126);
        OUTLINED_FUNCTION_107(v99);
        OUTLINED_FUNCTION_150();
        OUTLINED_FUNCTION_25_1(&dword_1C9EC7000, v100, v101, "Cannot create CancelPrewarmNLMessage for assistantId: %s");
        OUTLINED_FUNCTION_45_0();
        OUTLINED_FUNCTION_1();
        OUTLINED_FUNCTION_1();
      }
    }
    else
    {
      swift_bridgeObjectRetain();
LABEL_35:
      OUTLINED_FUNCTION_1_0();
      v82();
      swift_bridgeObjectRelease();
    }
  }
LABEL_40:
  OUTLINED_FUNCTION_11_1();
}

uint64_t sub_1C9EE83C4()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC7FD50);
  MEMORY[0x1F4188790](v0 - 8);
  int v2 = (char *)&v11 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC7FCF0);
  MEMORY[0x1F4188790](v3 - 8);
  uint64_t v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = *MEMORY[0x1E4FA22F8];
  uint64_t v7 = sub_1C9F07A48();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v7 - 8) + 104))(v5, v6, v7);
  __swift_storeEnumTagSinglePayload((uint64_t)v5, 0, 1, v7);
  sub_1C9F07BA8();
  swift_bridgeObjectRetain();
  sub_1C9F07B88();
  uint64_t v8 = *MEMORY[0x1E4FA26B0];
  uint64_t v9 = sub_1C9F07BF8();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v9 - 8) + 104))(v2, v8, v9);
  __swift_storeEnumTagSinglePayload((uint64_t)v2, 0, 1, v9);
  return sub_1C9F07B98();
}

void sub_1C9EE857C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  OUTLINED_FUNCTION_14_1();
  a19 = v22;
  a20 = v23;
  OUTLINED_FUNCTION_37_0(v24, v25, v26, v27, v28, v29, v30);
  char v31 = OUTLINED_FUNCTION_198();
  OUTLINED_FUNCTION_0();
  uint64_t v33 = v32;
  uint64_t v35 = *(void *)(v34 + 64);
  MEMORY[0x1F4188790](v36);
  OUTLINED_FUNCTION_36_0((uint64_t)v49 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x1F4188790](v37);
  OUTLINED_FUNCTION_42_0();
  MEMORY[0x1F4188790](v38);
  uint64_t v51 = (char *)v49 - v39;
  OUTLINED_FUNCTION_58();
  MEMORY[0x1F4188790](v40);
  OUTLINED_FUNCTION_31_1();
  uint64_t v50 = v20;
  OUTLINED_FUNCTION_15_3();
  OUTLINED_FUNCTION_119();
  v49[3] = v41 | 0x8000000000000000;
  int v42 = v51;
  OUTLINED_FUNCTION_6_3();
  sub_1C9F07CF8();
  uint64_t v43 = OUTLINED_FUNCTION_16_3(*(void *)((char *)v21 + OBJC_IVAR___SRDRequestDispatcherInternal_rdmbQueue));
  ((void (*)(uint64_t))v21)(v43);
  OUTLINED_FUNCTION_29_1();
  v21();
  OUTLINED_FUNCTION_9_4();
  uint64_t v44 = swift_allocObject();
  uint64_t v45 = OUTLINED_FUNCTION_22_1(v44);
  ((void (*)(uint64_t))v20)(v45);
  OUTLINED_FUNCTION_28_1();
  v20();
  *(void *)((char *)v21 + v35) = 0xD00000000000004CLL;
  OUTLINED_FUNCTION_85((uint64_t)v21 + v35);
  *uint64_t v46 = sub_1C9EF9DDC;
  v46[1] = (uint64_t (*)())&v52;
  uint64_t v47 = OUTLINED_FUNCTION_7_1();
  *(void *)(v47 + 16) = sub_1C9EF9C40;
  *(void *)(v47 + 24) = v21;
  v53[4] = sub_1C9EFBBDC;
  v53[5] = v47;
  v53[0] = MEMORY[0x1E4F143A8];
  OUTLINED_FUNCTION_33_0(COERCE_DOUBLE(1107296256));
  v53[2] = sub_1C9EDF214;
  v53[3] = &block_descriptor_124;
  _Block_copy(v53);
  OUTLINED_FUNCTION_86();
  swift_release();
  OUTLINED_FUNCTION_210((uint64_t)&a18);
  _Block_release(v42);
  uint64_t v48 = *(void (**)(void))(v33 + 8);
  OUTLINED_FUNCTION_10_4();
  v48();
  OUTLINED_FUNCTION_10_4();
  v48();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_40_0();
  swift_release();
  if (v31) {
    __break(1u);
  }
  else {
    OUTLINED_FUNCTION_11_1();
  }
}

uint64_t sub_1C9EE8810(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v20 = a8;
  uint64_t v12 = sub_1C9F07A68();
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x1F4188790](v12);
  uint64_t v15 = (char *)&v19 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C9EE4448();
  sub_1C9EE894C(a2, a3, a4, a5, (uint64_t)v15, v20, v16, v17, v19, v20, v21, v22, v23, v24, v25, v26, v27, v28, v29, v30);
  return (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v15, v12);
}

void sub_1C9EE894C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  OUTLINED_FUNCTION_14_1();
  a19 = v21;
  a20 = v22;
  uint64_t v139 = v23;
  uint64_t v140 = v24;
  uint64_t v145 = v25;
  uint64_t v141 = (_DWORD *)v26;
  unint64_t v28 = v27;
  uint64_t v30 = v29;
  uint64_t v31 = sub_1C9F07E98();
  OUTLINED_FUNCTION_0();
  uint64_t v137 = v32;
  MEMORY[0x1F4188790](v33);
  v135 = (char *)v127 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v136 = OUTLINED_FUNCTION_95();
  OUTLINED_FUNCTION_0();
  uint64_t v134 = v35;
  MEMORY[0x1F4188790](v36);
  uint64_t v133 = (char *)v127 - ((v37 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC7F020);
  uint64_t v39 = OUTLINED_FUNCTION_10_3(v38);
  MEMORY[0x1F4188790](v39);
  OUTLINED_FUNCTION_2_0();
  int v142 = v40;
  uint64_t v41 = OUTLINED_FUNCTION_141();
  OUTLINED_FUNCTION_0();
  uint64_t v43 = v42;
  MEMORY[0x1F4188790](v44);
  OUTLINED_FUNCTION_125();
  uint64_t v132 = v45;
  OUTLINED_FUNCTION_270((uint64_t)&a18);
  MEMORY[0x1F4188790](v46);
  uint64_t v48 = (char *)v127 - v47;
  sub_1C9F07BF8();
  OUTLINED_FUNCTION_0();
  uint64_t v50 = v49;
  MEMORY[0x1F4188790](v51);
  OUTLINED_FUNCTION_142();
  uint64_t v143 = v30;
  uint64_t v144 = v20;
  uint64_t v52 = OUTLINED_FUNCTION_326();
  sub_1C9EFEEF8(v52, v53);
  if (!v54)
  {
    if (qword_1EBC7F680 != -1) {
      swift_once();
    }
    uint64_t v101 = sub_1C9F07E78();
    OUTLINED_FUNCTION_46_0(v101, (uint64_t)qword_1EBC7FEF0);
    uint64_t v102 = sub_1C9F07E68();
    os_log_type_t v103 = sub_1C9F08178();
    if (!OUTLINED_FUNCTION_238(v103))
    {

      OUTLINED_FUNCTION_100();
      goto LABEL_28;
    }
    unint64_t v104 = (_DWORD *)OUTLINED_FUNCTION_7();
    v146[0] = OUTLINED_FUNCTION_11_3();
    *unint64_t v104 = 136315138;
    swift_bridgeObjectRetain();
    uint64_t v105 = sub_1C9F01420(v143, v28, v146);
    OUTLINED_FUNCTION_70(v105);
    OUTLINED_FUNCTION_88();
    OUTLINED_FUNCTION_57(&dword_1C9EC7000, v102, (os_log_type_t)v50, "No active session for assistantId: %s cannot start local request");
    OUTLINED_FUNCTION_168();
    OUTLINED_FUNCTION_1();
    OUTLINED_FUNCTION_1();
    goto LABEL_18;
  }
  uint64_t v129 = v31;
  v130 = v48;
  uint64_t v131 = v43;
  uint64_t v138 = v41;
  uint64_t v55 = v54;
  unint64_t v56 = *(void (**)(uint64_t))(v50 + 104);
  uint64_t v57 = OUTLINED_FUNCTION_225();
  v56(v57);
  char v58 = sub_1C9EFDE68();
  uint64_t v59 = *(void (**)(void))(v50 + 8);
  OUTLINED_FUNCTION_63();
  v59();
  if ((v58 & 1) == 0)
  {
    uint64_t v143 = v55;
    if (qword_1EBC7F680 != -1) {
      swift_once();
    }
    uint64_t v106 = sub_1C9F07E78();
    uint64_t v107 = OUTLINED_FUNCTION_2_2(v106, (uint64_t)qword_1EBC7FEF0);
    os_log_type_t v108 = sub_1C9F08168();
    if (!OUTLINED_FUNCTION_191(v108))
    {

      swift_release();
      goto LABEL_28;
    }
    uint64_t v145 = v107;
    uint64_t v109 = (_DWORD *)OUTLINED_FUNCTION_7();
    uint64_t v144 = OUTLINED_FUNCTION_11_3();
    v146[0] = v144;
    int v142 = v109;
    *uint64_t v109 = 136315138;
    uint64_t v141 = v109 + 1;
    uint64_t v110 = OUTLINED_FUNCTION_225();
    v56(v110);
    sub_1C9F07BE8();
    unint64_t v112 = v111;
    OUTLINED_FUNCTION_63();
    v59();
    uint64_t v113 = OUTLINED_FUNCTION_322();
    uint64_t v115 = sub_1C9F01420(v113, v112, v114);
    OUTLINED_FUNCTION_60(v115);
    sub_1C9F08228();
    swift_bridgeObjectRelease();
    uint64_t v102 = v145;
    OUTLINED_FUNCTION_57(&dword_1C9EC7000, v145, (os_log_type_t)v55, "Current session is not of type %s, cannot start local request");
    OUTLINED_FUNCTION_147();
    OUTLINED_FUNCTION_1();
    OUTLINED_FUNCTION_1();
    swift_release();
LABEL_18:

    goto LABEL_28;
  }
  uint64_t v60 = v143;
  sub_1C9EF7A80();
  uint64_t v61 = v131 + 16;
  uint64_t v62 = *(uint64_t (**)(void))(v131 + 16);
  uint64_t v63 = v130;
  uint64_t v64 = v138;
  OUTLINED_FUNCTION_108();
  uint64_t v65 = v62();
  v128 = v127;
  MEMORY[0x1F4188790](v65);
  v127[-8] = v60;
  v127[-7] = v28;
  uint64_t v66 = (uint64_t)v141;
  v127[-6] = v63;
  v127[-5] = v66;
  char v67 = v145;
  uint64_t v68 = v139;
  v127[-4] = v145;
  v127[-3] = v68;
  v126 = v140;
  objc_allocWithZone((Class)sub_1C9F06D08());
  uint64_t v140 = (void *)sub_1C9F06C48();
  if (v140)
  {
    uint64_t v143 = v55;
    uint64_t v69 = v144;
    uint64_t v139 = *(void *)(v144 + OBJC_IVAR___SRDRequestDispatcherInternal_instrumentationUtil);
    uint64_t v70 = (uint64_t)v142;
    OUTLINED_FUNCTION_215();
    v127[2] = v61;
    v127[1] = v62;
    OUTLINED_FUNCTION_108();
    v62();
    __swift_storeEnumTagSinglePayload(v70, 0, 1, v64);
    LODWORD(v128) = AFDeviceSupportsSiriUOD();
    char v71 = AFShouldRunAsrOnServerForUOD();
    uint64_t v72 = (void *)(v69 + OBJC_IVAR___SRDRequestDispatcherInternal_serverFallbackDisablingUtils);
    OUTLINED_FUNCTION_200((void *)(v69 + OBJC_IVAR___SRDRequestDispatcherInternal_serverFallbackDisablingUtils), *(void *)(v69 + OBJC_IVAR___SRDRequestDispatcherInternal_serverFallbackDisablingUtils + 24));
    swift_bridgeObjectRetain();
    sub_1C9F07DE8();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_200(v72, v72[3]);
    swift_bridgeObjectRetain();
    sub_1C9F07DE8();
    swift_bridgeObjectRelease();
    uint64_t v73 = (void *)(v69 + OBJC_IVAR___SRDRequestDispatcherInternal_featureChecker);
    OUTLINED_FUNCTION_200((void *)(v69 + OBJC_IVAR___SRDRequestDispatcherInternal_featureChecker), *(void *)(v69 + OBJC_IVAR___SRDRequestDispatcherInternal_featureChecker + 24));
    uint64_t v74 = v145;
    LOBYTE(v126) = sub_1C9F07D58() & 1;
    uint64_t v75 = (uint64_t)v142;
    uint64_t v76 = OUTLINED_FUNCTION_275();
    sub_1C9ED91A4(v76, v77, (uint64_t)v74, 5, (char)v128, v71, v78, v79, (char)v126);
    sub_1C9EFB940(v75, &qword_1EBC7F020);
    uint64_t v80 = (const void *)v73[4];
    __swift_project_boxed_opaque_existential_1(v73, v73[3]);
    if (sub_1C9F07D58())
    {
      uint64_t v81 = OUTLINED_FUNCTION_316();
      sub_1C9EDA97C(v81, v82, v83, v84);
      uint64_t v85 = OUTLINED_FUNCTION_316();
      sub_1C9EDABF4(v85, v86, v87, v88, 1);
    }
    uint64_t v89 = v144;
    sub_1C9ED0FAC(v140);
    uint64_t v90 = *(void *)(v89 + OBJC_IVAR___SRDRequestDispatcherInternal_assetLogger);
    uint64_t v91 = v131;
    if ((*(unsigned char *)(v90 + 32) & 1) != 0 || (OUTLINED_FUNCTION_110(), v92))
    {
      uint64_t v144 = *(void *)(v90 + 16);
      uint64_t v124 = v130;
      uint64_t v125 = v138;
      OUTLINED_FUNCTION_8_1();
      v93();
      OUTLINED_FUNCTION_344();
      OUTLINED_FUNCTION_112();
      uint64_t v94 = swift_allocObject();
      OUTLINED_FUNCTION_199(v94);
      OUTLINED_FUNCTION_103();
      v95();
      os_log_t v96 = (void *)((char *)v73 + (void)v80);
      *os_log_t v96 = v66;
      v96[1] = (uint64_t)v74;
      v146[4] = (uint64_t)sub_1C9EFAE00;
      v146[5] = (uint64_t)v80;
      v146[0] = MEMORY[0x1E4F143A8];
      OUTLINED_FUNCTION_33_0(COERCE_DOUBLE(1107296256));
      v146[2] = (uint64_t)sub_1C9EDF1A8;
      v146[3] = (uint64_t)&block_descriptor_387;
      _Block_copy(v146);
      OUTLINED_FUNCTION_350();
      swift_bridgeObjectRetain();
      os_log_type_t v97 = v133;
      sub_1C9F07EB8();
      v146[6] = MEMORY[0x1E4FBC860];
      sub_1C9EFBB30((unint64_t *)&unk_1EBC7F7E0, MEMORY[0x1E4FBCB00]);
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC7F7F8);
      sub_1C9EFB3B4((unint64_t *)&qword_1EBC7F800, &qword_1EBC7F7F8);
      uint64_t v98 = v135;
      OUTLINED_FUNCTION_314();
      OUTLINED_FUNCTION_148();
      MEMORY[0x1CB794A40](0, v97, v98, v80);
      _Block_release(v80);
      OUTLINED_FUNCTION_264();
      OUTLINED_FUNCTION_1_0();
      v99();
      OUTLINED_FUNCTION_203();
      OUTLINED_FUNCTION_1_0();
      v100();
      swift_release();

      swift_release();
    }
    else
    {
      swift_release();

      uint64_t v124 = v130;
      uint64_t v125 = v138;
    }
    (*(void (**)(char *, uint64_t))(v91 + 8))(v124, v125);
  }
  else
  {
    if (qword_1EBC7F680 != -1) {
      swift_once();
    }
    uint64_t v116 = sub_1C9F07E78();
    OUTLINED_FUNCTION_46_0(v116, (uint64_t)qword_1EBC7FEF0);
    uint64_t v117 = (void *)sub_1C9F07E68();
    os_log_type_t v118 = sub_1C9F08168();
    if (OUTLINED_FUNCTION_19_1(v118))
    {
      OUTLINED_FUNCTION_7();
      uint64_t v119 = OUTLINED_FUNCTION_11_3();
      OUTLINED_FUNCTION_282(v119);
      OUTLINED_FUNCTION_74(4.8149e-34);
      uint64_t v120 = sub_1C9F01420((uint64_t)v141, (unint64_t)v67, v146);
      OUTLINED_FUNCTION_247(v120);
      sub_1C9F08228();
      OUTLINED_FUNCTION_88();
      OUTLINED_FUNCTION_25_1(&dword_1C9EC7000, v121, v122, "Failed to create StartLocalRequestMessage for request Id: %s");
      OUTLINED_FUNCTION_45_0();
      OUTLINED_FUNCTION_1();
      OUTLINED_FUNCTION_1();
      swift_release();
    }
    else
    {

      OUTLINED_FUNCTION_100();
      swift_release();
    }
    OUTLINED_FUNCTION_149();
    v123();
  }
LABEL_28:
  OUTLINED_FUNCTION_11_1();
}

void sub_1C9EE93F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24)
{
  OUTLINED_FUNCTION_14_1();
  a19 = v27;
  a20 = v28;
  OUTLINED_FUNCTION_202(v29, v30, v31, v32, v33, v34, v35, v36);
  int v72 = v37;
  OUTLINED_FUNCTION_223(v38, v39, v40, (uint64_t)&v84);
  uint64_t v73 = a24;
  OUTLINED_FUNCTION_320(a23);
  uint64_t v41 = OUTLINED_FUNCTION_331();
  OUTLINED_FUNCTION_216(v41, (uint64_t)v83);
  OUTLINED_FUNCTION_0();
  uint64_t v43 = v42;
  uint64_t v45 = *(void *)(v44 + 64);
  MEMORY[0x1F4188790](v46);
  OUTLINED_FUNCTION_36_0((uint64_t)v71 - ((v45 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x1F4188790](v47);
  OUTLINED_FUNCTION_187();
  uint64_t v49 = MEMORY[0x1F4188790](v48);
  OUTLINED_FUNCTION_213(v49, v50, v51, v52, v53, v54, v55, v56, v71[0]);
  MEMORY[0x1F4188790](v57);
  char v58 = (void (*)(uint64_t))OUTLINED_FUNCTION_83();
  OUTLINED_FUNCTION_75();
  OUTLINED_FUNCTION_214();
  OUTLINED_FUNCTION_323();
  v77[6] = v59;
  char v78 = v72;
  OUTLINED_FUNCTION_111();
  OUTLINED_FUNCTION_249();
  uint64_t v79 = v61;
  uint64_t v80 = v60;
  uint64_t v81 = v71[2];
  uint64_t v76 = v24;
  OUTLINED_FUNCTION_41_0();
  OUTLINED_FUNCTION_165();
  unint64_t v74 = v62 | 0x8000000000000000;
  OUTLINED_FUNCTION_6_3();
  sub_1C9F07CF8();
  uint64_t v63 = OUTLINED_FUNCTION_66(*(void *)(v25 + OBJC_IVAR___SRDRequestDispatcherInternal_rdmbQueue));
  v58(v63);
  uint64_t v64 = OUTLINED_FUNCTION_109((uint64_t)&a13);
  v58(v64);
  OUTLINED_FUNCTION_8_4();
  uint64_t v65 = swift_allocObject();
  uint64_t v66 = OUTLINED_FUNCTION_32_1(v65);
  ((void (*)(uint64_t))v24)(v66);
  OUTLINED_FUNCTION_48_0();
  v24();
  OUTLINED_FUNCTION_208((unint64_t *)(v65 + v45));
  *char v67 = sub_1C9EF9DFC;
  v67[1] = (uint64_t (*)())v77;
  uint64_t v68 = OUTLINED_FUNCTION_7_1();
  *(void *)(v68 + 16) = sub_1C9EF9C40;
  *(void *)(v68 + 24) = v65;
  v83[2] = sub_1C9EFBBDC;
  v83[3] = v68;
  uint64_t v82 = MEMORY[0x1E4F143A8];
  OUTLINED_FUNCTION_33_0(COERCE_DOUBLE(1107296256));
  v83[0] = sub_1C9EDF214;
  v83[1] = &block_descriptor_135;
  _Block_copy(&v82);
  OUTLINED_FUNCTION_229();
  swift_release();
  dispatch_sync(v75, v26);
  _Block_release(v26);
  uint64_t v69 = *(void (**)(void))(v43 + 8);
  OUTLINED_FUNCTION_13_2();
  v69();
  OUTLINED_FUNCTION_13_2();
  v69();
  char v70 = OUTLINED_FUNCTION_5_3();
  swift_release();
  swift_release();
  if (v70) {
    __break(1u);
  }
  else {
    OUTLINED_FUNCTION_11_1();
  }
}

uint64_t sub_1C9EE96EC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  int v16 = a6;
  uint64_t v17 = a4;
  uint64_t v18 = a5;
  uint64_t v19 = a1;
  v15[0] = a10;
  v15[1] = a3;
  uint64_t v10 = sub_1C9F07A68();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x1F4188790](v10);
  uint64_t v13 = (char *)v15 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C9EE4448();
  if (a9) {
    sub_1C9F08148();
  }
  sub_1C9EE9990();
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v13, v10);
}

void sub_1C9EE9990()
{
  OUTLINED_FUNCTION_14_1();
  uint64_t v7 = OUTLINED_FUNCTION_252(v4, v5, v6);
  OUTLINED_FUNCTION_0();
  uint64_t v9 = v8;
  MEMORY[0x1F4188790](v10);
  OUTLINED_FUNCTION_67();
  sub_1C9EFEEF8(v1, v0);
  if (!v11)
  {
    if (qword_1EBC7F680 != -1) {
      swift_once();
    }
    uint64_t v18 = sub_1C9F07E78();
    OUTLINED_FUNCTION_64(v18, (uint64_t)qword_1EBC7FEF0);
    OUTLINED_FUNCTION_121();
    uint64_t v17 = (void *)sub_1C9F07E68();
    os_log_type_t v19 = sub_1C9F08168();
    if (!OUTLINED_FUNCTION_19_1(v19))
    {

      OUTLINED_FUNCTION_155();
      OUTLINED_FUNCTION_130();
      goto LABEL_22;
    }
    uint64_t v20 = (_DWORD *)OUTLINED_FUNCTION_29();
    uint64_t v21 = OUTLINED_FUNCTION_28();
    OUTLINED_FUNCTION_281(v21);
    _DWORD *v20 = 136315394;
    swift_bridgeObjectRetain();
    uint64_t v22 = OUTLINED_FUNCTION_78();
    OUTLINED_FUNCTION_206(v22);
    OUTLINED_FUNCTION_120();
    OUTLINED_FUNCTION_336();
    uint64_t v23 = sub_1C9F01420(v45, v3, &v46);
    OUTLINED_FUNCTION_71(v23);
    OUTLINED_FUNCTION_154();
    OUTLINED_FUNCTION_99(&dword_1C9EC7000, v24, v25, "No active session for assistantId: %s cannot start test speech request for request id: %s");
    OUTLINED_FUNCTION_170();
    OUTLINED_FUNCTION_1();
    OUTLINED_FUNCTION_1();
    goto LABEL_9;
  }
  unint64_t v44 = v3;
  unsigned int v43 = *MEMORY[0x1E4FA26B0];
  uint64_t v42 = *(void (**)(uint64_t))(v9 + 104);
  v42(v2);
  char v12 = OUTLINED_FUNCTION_353();
  uint64_t v13 = *(void (**)(void))(v9 + 8);
  OUTLINED_FUNCTION_63();
  v13();
  if ((v12 & 1) == 0)
  {
    if (qword_1EBC7F680 != -1) {
      swift_once();
    }
    uint64_t v26 = sub_1C9F07E78();
    uint64_t v27 = OUTLINED_FUNCTION_2_2(v26, (uint64_t)qword_1EBC7FEF0);
    os_log_type_t v28 = sub_1C9F08168();
    if (os_log_type_enabled(v27, v28))
    {
      uint64_t v29 = (uint8_t *)OUTLINED_FUNCTION_7();
      uint64_t v46 = OUTLINED_FUNCTION_11_3();
      *(_DWORD *)uint64_t v29 = 136315138;
      ((void (*)(uint64_t, void, uint64_t))v42)(v2, v43, v7);
      uint64_t v30 = sub_1C9F07BE8();
      unint64_t v32 = v31;
      OUTLINED_FUNCTION_63();
      v13();
      uint64_t v33 = sub_1C9F01420(v30, v32, &v46);
      OUTLINED_FUNCTION_60(v33);
      sub_1C9F08228();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1C9EC7000, v27, v28, "Current session is not of type %s, cannot start test speech request", v29, 0xCu);
      OUTLINED_FUNCTION_345();
      OUTLINED_FUNCTION_1();
      OUTLINED_FUNCTION_1();
      swift_release();

      goto LABEL_22;
    }

LABEL_21:
    swift_release();
    goto LABEL_22;
  }
  sub_1C9EF7A80();
  MEMORY[0x1F4188790](v14);
  id v15 = objc_allocWithZone((Class)sub_1C9F071D8());
  int v16 = (void *)sub_1C9F07128();
  if (!v16)
  {
    if (qword_1EBC7F680 != -1) {
      swift_once();
    }
    uint64_t v34 = sub_1C9F07E78();
    OUTLINED_FUNCTION_313(v34, (uint64_t)qword_1EBC7FEF0);
    OUTLINED_FUNCTION_212();
    uint64_t v35 = (void *)sub_1C9F07E68();
    os_log_type_t v36 = sub_1C9F08168();
    if (OUTLINED_FUNCTION_106(v36))
    {
      int v37 = (_DWORD *)OUTLINED_FUNCTION_7();
      uint64_t v38 = OUTLINED_FUNCTION_11_3();
      OUTLINED_FUNCTION_281(v38);
      *int v37 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v39 = sub_1C9F01420(v45, v44, &v46);
      OUTLINED_FUNCTION_107(v39);
      OUTLINED_FUNCTION_19_0();
      OUTLINED_FUNCTION_178(&dword_1C9EC7000, v40, v41, "Failed to create StartTestSpeechRequestMessage for request Id: %s");
      OUTLINED_FUNCTION_45_0();
      OUTLINED_FUNCTION_1();
      OUTLINED_FUNCTION_1();
      swift_release();

      goto LABEL_22;
    }

    OUTLINED_FUNCTION_138();
    goto LABEL_21;
  }
  uint64_t v17 = v16;
  sub_1C9ED0FAC(v16);
  swift_release();
LABEL_9:

LABEL_22:
  OUTLINED_FUNCTION_11_1();
}

uint64_t sub_1C9EE9ECC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  int v30 = a7;
  v29[0] = a4;
  v29[1] = a5;
  uint64_t v34 = a12;
  uint64_t v35 = a11;
  uint64_t v33 = a10;
  uint64_t v31 = a8;
  uint64_t v32 = a9;
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBC7FCF8);
  MEMORY[0x1F4188790](v13 - 8);
  id v15 = (char *)v29 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC7F020);
  MEMORY[0x1F4188790](v16 - 8);
  uint64_t v18 = (char *)v29 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC7FCF0);
  MEMORY[0x1F4188790](v19 - 8);
  uint64_t v21 = (char *)v29 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = *MEMORY[0x1E4FA22F8];
  uint64_t v23 = sub_1C9F07A48();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v23 - 8) + 104))(v21, v22, v23);
  __swift_storeEnumTagSinglePayload((uint64_t)v21, 0, 1, v23);
  sub_1C9F07188();
  swift_bridgeObjectRetain();
  sub_1C9F07148();
  uint64_t v24 = sub_1C9F069B8();
  (*(void (**)(char *, void, uint64_t))(*(void *)(v24 - 8) + 16))(v18, v29[0], v24);
  __swift_storeEnumTagSinglePayload((uint64_t)v18, 0, 1, v24);
  sub_1C9F071C8();
  swift_bridgeObjectRetain();
  sub_1C9F071B8();
  sub_1C9F071A8();
  uint64_t v25 = sub_1C9F07A68();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v25 - 8) + 16))(v15, v31, v25);
  __swift_storeEnumTagSinglePayload((uint64_t)v15, 0, 1, v25);
  sub_1C9F07158();
  swift_retain();
  sub_1C9F07198();
  swift_bridgeObjectRetain();
  sub_1C9F07138();
  swift_bridgeObjectRetain();
  uint64_t result = sub_1C9F07168();
  if (a13)
  {
    id v27 = objc_allocWithZone((Class)sub_1C9F07B28());
    id v28 = a13;
    sub_1C9F07B18();
    return sub_1C9F07178();
  }
  return result;
}

void sub_1C9EEA1D4()
{
  OUTLINED_FUNCTION_14_1();
  dispatch_queue_t v37 = v2;
  unint64_t v33 = v3;
  v32[1] = v4;
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  uint64_t v10 = v9;
  char v11 = OUTLINED_FUNCTION_198();
  OUTLINED_FUNCTION_0();
  uint64_t v13 = v12;
  uint64_t v15 = *(void *)(v14 + 64);
  MEMORY[0x1F4188790](v16);
  uint64_t v35 = (char *)v32 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  OUTLINED_FUNCTION_76();
  MEMORY[0x1F4188790](v17);
  uint64_t v34 = (char *)v32 - v18;
  OUTLINED_FUNCTION_76();
  MEMORY[0x1F4188790](v19);
  OUTLINED_FUNCTION_62();
  MEMORY[0x1F4188790](v20);
  uint64_t v22 = (char *)v32 - v21;
  uint64_t v40 = v0;
  uint64_t v41 = v0;
  uint64_t v42 = v10;
  uint64_t v43 = v8;
  OUTLINED_FUNCTION_306();
  uint64_t v44 = v6;
  uint64_t v45 = v23;
  unint64_t v46 = v33;
  dispatch_queue_t v47 = v37;
  uint64_t v24 = (char *)sub_1C9ECFD44();
  uint64_t v38 = v22;
  OUTLINED_FUNCTION_15_3();
  OUTLINED_FUNCTION_119();
  unint64_t v33 = v25 | 0x8000000000000000;
  uint64_t v36 = v1;
  OUTLINED_FUNCTION_6_3();
  sub_1C9F07CF8();
  dispatch_queue_t v37 = *(dispatch_queue_t *)(v0 + OBJC_IVAR___SRDRequestDispatcherInternal_rdmbQueue);
  uint64_t v26 = (void (*)(void))v13[2];
  OUTLINED_FUNCTION_29_1();
  v26();
  OUTLINED_FUNCTION_29_1();
  v26();
  OUTLINED_FUNCTION_65();
  uint64_t v27 = swift_allocObject();
  id v28 = (void (*)(void))v13[4];
  OUTLINED_FUNCTION_28_1();
  v28();
  OUTLINED_FUNCTION_28_1();
  v28();
  *(void *)&v24[v27] = 0xD00000000000004BLL;
  OUTLINED_FUNCTION_85((uint64_t)&v24[v27]);
  *uint64_t v29 = sub_1C9EF9E48;
  v29[1] = (void (*)())&v39;
  uint64_t v30 = OUTLINED_FUNCTION_7_1();
  *(void *)(v30 + 16) = sub_1C9EF9C40;
  *(void *)(v30 + 24) = v27;
  v48[4] = sub_1C9EFBBDC;
  uint64_t v48[5] = v30;
  v48[0] = MEMORY[0x1E4F143A8];
  OUTLINED_FUNCTION_33_0(COERCE_DOUBLE(1107296256));
  v48[2] = sub_1C9EDF214;
  v48[3] = &block_descriptor_146;
  _Block_copy(v48);
  OUTLINED_FUNCTION_86();
  swift_release();
  dispatch_sync(v37, v24);
  _Block_release(v24);
  uint64_t v31 = (void (*)(void))v13[1];
  OUTLINED_FUNCTION_10_4();
  v31();
  OUTLINED_FUNCTION_10_4();
  v31();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_40_0();
  swift_release();
  if (v11) {
    __break(1u);
  }
  else {
    OUTLINED_FUNCTION_11_1();
  }
}

void sub_1C9EEA520()
{
  OUTLINED_FUNCTION_14_1();
  uint64_t v2 = v1;
  uint64_t v55 = v3;
  os_log_type_t v5 = v4;
  unint64_t v7 = v6;
  unint64_t v9 = v8;
  uint64_t v11 = v10;
  uint64_t v12 = sub_1C9F069B8();
  OUTLINED_FUNCTION_0();
  uint64_t v14 = v13;
  MEMORY[0x1F4188790](v15);
  OUTLINED_FUNCTION_273();
  sub_1C9EFEEF8(v11, v9);
  if (v16)
  {
    uint64_t v53 = v14;
    uint64_t v54 = v12;
    OUTLINED_FUNCTION_8_1();
    v17();
    sub_1C9ECF370(0, (unint64_t *)&unk_1EA5CEC80);
    id v18 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F4E5E0]), sel_init);
    id v19 = v2;
    id v20 = sub_1C9EEAA70(v2, v2, v18, 1, 0.0);
    if (!v20)
    {
      if (qword_1EBC7F680 != -1) {
        swift_once();
      }
      uint64_t v37 = sub_1C9F07E78();
      OUTLINED_FUNCTION_313(v37, (uint64_t)qword_1EBC7FEF0);
      id v38 = v19;
      uint64_t v39 = sub_1C9F07E68();
      os_log_type_t v40 = sub_1C9F08168();
      if (os_log_type_enabled(v39, v40))
      {
        uint64_t v41 = (_DWORD *)OUTLINED_FUNCTION_7();
        uint64_t v42 = (void *)swift_slowAlloc();
        *uint64_t v41 = 138412290;
        uint64_t v56 = (uint64_t)v38;
        id v43 = v38;
        OUTLINED_FUNCTION_352();
        sub_1C9F08228();
        *uint64_t v42 = v2;

        OUTLINED_FUNCTION_57(&dword_1C9EC7000, v39, v40, "Failed to create SpeechPackage for recognition: %@");
        __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC7FEC0);
        OUTLINED_FUNCTION_147();
        OUTLINED_FUNCTION_1();
        OUTLINED_FUNCTION_1();
        swift_release();
      }
      else
      {

        swift_release();
      }
      uint64_t v51 = v54;
      uint64_t v52 = *(void (**)(uint64_t, uint64_t))(v53 + 8);
      uint64_t v50 = v0;
      goto LABEL_22;
    }
    uint64_t v21 = v20;
    unint64_t v22 = v7;
    MEMORY[0x1F4188790](v20);
    id v23 = objc_allocWithZone((Class)sub_1C9F06D98());
    OUTLINED_FUNCTION_80();
    uint64_t v24 = sub_1C9F06D18();
    if (v24)
    {
      uint64_t v25 = v24;
      sub_1C9ED0FAC(v24);
    }
    else
    {
      if (qword_1EBC7F680 != -1) {
        swift_once();
      }
      uint64_t v44 = sub_1C9F07E78();
      OUTLINED_FUNCTION_19(v44, (uint64_t)qword_1EBC7FEF0);
      uint64_t v25 = sub_1C9F07E68();
      os_log_type_t v45 = sub_1C9F08168();
      if (!OUTLINED_FUNCTION_254(v45))
      {

        OUTLINED_FUNCTION_222();
        swift_release();
        goto LABEL_19;
      }
      unint64_t v46 = (_DWORD *)OUTLINED_FUNCTION_7();
      uint64_t v56 = OUTLINED_FUNCTION_11_3();
      *unint64_t v46 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v47 = OUTLINED_FUNCTION_290();
      uint64_t v49 = sub_1C9F01420(v47, v22, v48);
      OUTLINED_FUNCTION_70(v49);
      OUTLINED_FUNCTION_221();
      OUTLINED_FUNCTION_57(&dword_1C9EC7000, v25, v5, "Failed to create AsrResultCandidateMessage for request Id: %s");
      OUTLINED_FUNCTION_147();
      OUTLINED_FUNCTION_1();
      OUTLINED_FUNCTION_1();
    }
    swift_release();

LABEL_19:
    uint64_t v50 = OUTLINED_FUNCTION_203();
LABEL_22:
    v52(v50, v51);
    goto LABEL_23;
  }
  if (qword_1EBC7F680 != -1) {
    swift_once();
  }
  uint64_t v26 = sub_1C9F07E78();
  OUTLINED_FUNCTION_313(v26, (uint64_t)qword_1EBC7FEF0);
  unint64_t v27 = v7;
  swift_bridgeObjectRetain_n();
  OUTLINED_FUNCTION_131();
  id v28 = (void *)sub_1C9F07E68();
  os_log_type_t v29 = sub_1C9F08168();
  if (OUTLINED_FUNCTION_19_1(v29))
  {
    uint64_t v30 = (_DWORD *)OUTLINED_FUNCTION_29();
    uint64_t v31 = OUTLINED_FUNCTION_28();
    OUTLINED_FUNCTION_281(v31);
    *uint64_t v30 = 136315394;
    swift_bridgeObjectRetain();
    uint64_t v32 = OUTLINED_FUNCTION_290();
    sub_1C9F01420(v32, v9, v33);
    OUTLINED_FUNCTION_101();
    OUTLINED_FUNCTION_150();
    OUTLINED_FUNCTION_269();
    swift_bridgeObjectRetain();
    uint64_t v34 = sub_1C9F01420(v55, v27, &v56);
    OUTLINED_FUNCTION_71(v34);
    OUTLINED_FUNCTION_19_0();
    OUTLINED_FUNCTION_99(&dword_1C9EC7000, v35, v36, "No active session for assistantId: %s cannot post test result candidate for request id: %s");
    OUTLINED_FUNCTION_170();
    OUTLINED_FUNCTION_1();
    OUTLINED_FUNCTION_1();
  }
  else
  {

    OUTLINED_FUNCTION_138();
    OUTLINED_FUNCTION_132();
  }
LABEL_23:
  OUTLINED_FUNCTION_11_1();
}

id sub_1C9EEAA70(void *a1, void *a2, void *a3, char a4, double a5)
{
  id v8 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithRecognition_rawRecognition_audioAnalytics_isFinal_utteranceStart_, a1, a2, a3, a4 & 1, a5);

  return v8;
}

uint64_t sub_1C9EEAAF8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
  uint64_t v26 = a5;
  uint64_t v27 = a7;
  uint64_t v24 = a2;
  uint64_t v25 = a4;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC7FD70);
  MEMORY[0x1F4188790](v9 - 8);
  uint64_t v11 = (char *)&v24 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC7F020);
  MEMORY[0x1F4188790](v12 - 8);
  uint64_t v14 = (char *)&v24 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC7FCF0);
  MEMORY[0x1F4188790](v15 - 8);
  uint64_t v17 = (char *)&v24 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = *MEMORY[0x1E4FA22F8];
  uint64_t v19 = sub_1C9F07A48();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v19 - 8) + 104))(v17, v18, v19);
  __swift_storeEnumTagSinglePayload((uint64_t)v17, 0, 1, v19);
  sub_1C9F06D58();
  swift_bridgeObjectRetain();
  sub_1C9F06D38();
  uint64_t v20 = sub_1C9F069B8();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v20 - 8) + 16))(v14, v25, v20);
  __swift_storeEnumTagSinglePayload((uint64_t)v14, 0, 1, v20);
  sub_1C9F06D88();
  swift_bridgeObjectRetain();
  sub_1C9F06D78();
  swift_bridgeObjectRetain();
  sub_1C9F06D28();
  id v21 = a9;
  sub_1C9F06D48();
  sub_1C9F07C88();
  uint64_t v22 = sub_1C9F07C98();
  __swift_storeEnumTagSinglePayload((uint64_t)v11, 0, 1, v22);
  return sub_1C9F06D68();
}

void sub_1C9EEAD68()
{
  OUTLINED_FUNCTION_14_1();
  uint64_t v4 = v0;
  dispatch_queue_t v33 = v5;
  v31[0] = v6;
  uint64_t v8 = v7;
  uint64_t v10 = v9;
  OUTLINED_FUNCTION_274();
  char v11 = sub_1C9F07E58();
  OUTLINED_FUNCTION_0();
  uint64_t v13 = v12;
  uint64_t v15 = *(void *)(v14 + 64);
  MEMORY[0x1F4188790](v16);
  v31[2] = (char *)v31 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  OUTLINED_FUNCTION_76();
  MEMORY[0x1F4188790](v17);
  v31[1] = (char *)v31 - v18;
  OUTLINED_FUNCTION_76();
  MEMORY[0x1F4188790](v19);
  OUTLINED_FUNCTION_62();
  MEMORY[0x1F4188790](v20);
  uint64_t v22 = (char *)v31 - v21;
  uint64_t v35[2] = v4;
  uint64_t v36 = v2;
  uint64_t v37 = v1;
  uint64_t v38 = v10;
  uint64_t v39 = v8;
  uint64_t v40 = v31[0];
  dispatch_queue_t v41 = v33;
  id v23 = (char *)sub_1C9ECFD44();
  uint64_t v34 = v22;
  OUTLINED_FUNCTION_15_3();
  OUTLINED_FUNCTION_119();
  v31[0] = v24 | 0x8000000000000000;
  uint64_t v32 = v3;
  OUTLINED_FUNCTION_6_3();
  sub_1C9F07CF8();
  dispatch_queue_t v33 = *(dispatch_queue_t *)(v4 + OBJC_IVAR___SRDRequestDispatcherInternal_rdmbQueue);
  uint64_t v25 = (void (*)(void))v13[2];
  OUTLINED_FUNCTION_29_1();
  v25();
  OUTLINED_FUNCTION_29_1();
  v25();
  OUTLINED_FUNCTION_65();
  uint64_t v26 = swift_allocObject();
  uint64_t v27 = (void (*)(void))v13[4];
  OUTLINED_FUNCTION_28_1();
  v27();
  OUTLINED_FUNCTION_28_1();
  v27();
  *(void *)&v23[v26] = 0xD000000000000037;
  OUTLINED_FUNCTION_85((uint64_t)&v23[v26]);
  *id v28 = sub_1C9EF9E78;
  v28[1] = (void (*)())v35;
  uint64_t v29 = OUTLINED_FUNCTION_7_1();
  *(void *)(v29 + 16) = sub_1C9EF9C40;
  *(void *)(v29 + 24) = v26;
  v42[4] = sub_1C9EFBBDC;
  v42[5] = v29;
  v42[0] = MEMORY[0x1E4F143A8];
  OUTLINED_FUNCTION_33_0(COERCE_DOUBLE(1107296256));
  uint64_t v42[2] = sub_1C9EDF214;
  v42[3] = &block_descriptor_157;
  _Block_copy(v42);
  OUTLINED_FUNCTION_86();
  swift_release();
  dispatch_sync(v33, v23);
  _Block_release(v23);
  uint64_t v30 = (void (*)(void))v13[1];
  OUTLINED_FUNCTION_10_4();
  v30();
  OUTLINED_FUNCTION_10_4();
  v30();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_40_0();
  swift_release();
  if (v11) {
    __break(1u);
  }
  else {
    OUTLINED_FUNCTION_11_1();
  }
}

void sub_1C9EEB0A8()
{
  OUTLINED_FUNCTION_14_1();
  uint64_t v1 = v0;
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  OUTLINED_FUNCTION_204();
  sub_1C9EFEEF8(v8, v9);
  if (!v10)
  {
    if (qword_1EBC7F680 != -1) {
      swift_once();
    }
    uint64_t v16 = sub_1C9F07E78();
    OUTLINED_FUNCTION_47_0(v16, (uint64_t)qword_1EBC7FEF0);
    OUTLINED_FUNCTION_121();
    uint64_t v17 = (void *)sub_1C9F07E68();
    os_log_type_t v18 = sub_1C9F08168();
    if (!OUTLINED_FUNCTION_96(v18))
    {

      OUTLINED_FUNCTION_146();
      OUTLINED_FUNCTION_130();
      goto LABEL_15;
    }
    uint64_t v19 = (_DWORD *)OUTLINED_FUNCTION_29();
    uint64_t v20 = OUTLINED_FUNCTION_28();
    OUTLINED_FUNCTION_256(v20);
    *uint64_t v19 = 136315394;
    swift_bridgeObjectRetain();
    uint64_t v21 = OUTLINED_FUNCTION_78();
    OUTLINED_FUNCTION_175(v21);
    OUTLINED_FUNCTION_120();
    OUTLINED_FUNCTION_338();
    uint64_t v22 = OUTLINED_FUNCTION_167();
    OUTLINED_FUNCTION_71(v22);
    OUTLINED_FUNCTION_194();
    OUTLINED_FUNCTION_122(&dword_1C9EC7000, v23, v24, "No active session for assistantId: %s cannot post test result selected for request id: %s");
    OUTLINED_FUNCTION_133();
    OUTLINED_FUNCTION_1();
    OUTLINED_FUNCTION_1();
    goto LABEL_12;
  }
  MEMORY[0x1F4188790](v10);
  OUTLINED_FUNCTION_341();
  *(void *)(v12 - 48) = v11;
  *(void *)(v12 - 40) = v7;
  *(void *)(v12 - 32) = v5;
  *(void *)(v12 - 24) = v3;
  *(void *)(v12 - 16) = v1;
  id v13 = objc_allocWithZone((Class)sub_1C9F06B18());
  uint64_t v14 = (void *)sub_1C9F06B08();
  if (!v14)
  {
    if (qword_1EBC7F680 != -1) {
      swift_once();
    }
    uint64_t v25 = sub_1C9F07E78();
    OUTLINED_FUNCTION_47_0(v25, (uint64_t)qword_1EBC7FEF0);
    uint64_t v17 = (void *)sub_1C9F07E68();
    os_log_type_t v26 = sub_1C9F08168();
    if (!OUTLINED_FUNCTION_21(v26))
    {

      OUTLINED_FUNCTION_146();
      swift_release();
      goto LABEL_15;
    }
    OUTLINED_FUNCTION_7();
    uint64_t v27 = OUTLINED_FUNCTION_11_3();
    OUTLINED_FUNCTION_40(v27);
    OUTLINED_FUNCTION_332(4.8149e-34);
    uint64_t v28 = OUTLINED_FUNCTION_167();
    OUTLINED_FUNCTION_6_2(v28);
    OUTLINED_FUNCTION_194();
    OUTLINED_FUNCTION_1_3(&dword_1C9EC7000, v29, v30, "Failed to create ResultSelectedMessage for request Id: %s");
    OUTLINED_FUNCTION_7_3();
    OUTLINED_FUNCTION_1();
    OUTLINED_FUNCTION_1();
    swift_release();
LABEL_12:

    goto LABEL_15;
  }
  uint64_t v15 = v14;
  sub_1C9ED0FAC(v14);
  swift_release();

LABEL_15:
  OUTLINED_FUNCTION_11_1();
}

uint64_t sub_1C9EEB35C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v18[0] = a5;
  v18[1] = a7;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC7F020);
  MEMORY[0x1F4188790](v8 - 8);
  uint64_t v10 = (char *)v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC7FCF0);
  MEMORY[0x1F4188790](v11 - 8);
  id v13 = (char *)v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = *MEMORY[0x1E4FA22F8];
  uint64_t v15 = sub_1C9F07A48();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v15 - 8) + 104))(v13, v14, v15);
  __swift_storeEnumTagSinglePayload((uint64_t)v13, 0, 1, v15);
  sub_1C9F06B68();
  swift_bridgeObjectRetain();
  sub_1C9F06B28();
  uint64_t v16 = sub_1C9F069B8();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v16 - 8) + 16))(v10, a4, v16);
  __swift_storeEnumTagSinglePayload((uint64_t)v10, 0, 1, v16);
  sub_1C9F06B88();
  swift_bridgeObjectRetain();
  sub_1C9F06B78();
  swift_bridgeObjectRetain();
  sub_1C9F06B58();
  return sub_1C9F06B38();
}

void sub_1C9EEB554(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  OUTLINED_FUNCTION_14_1();
  a19 = v22;
  a20 = v23;
  uint64_t v53 = v24;
  uint64_t v51 = v25;
  uint64_t v50 = v26;
  uint64_t v28 = v27;
  uint64_t ObjectType = swift_getObjectType();
  char v30 = OUTLINED_FUNCTION_216(ObjectType, (uint64_t)&a14);
  OUTLINED_FUNCTION_0();
  uint64_t v32 = v31;
  uint64_t v34 = *(void *)(v33 + 64);
  MEMORY[0x1F4188790](v35);
  OUTLINED_FUNCTION_186();
  uint64_t v52 = v36;
  OUTLINED_FUNCTION_58();
  MEMORY[0x1F4188790](v37);
  OUTLINED_FUNCTION_42_0();
  MEMORY[0x1F4188790](v38);
  OUTLINED_FUNCTION_82();
  MEMORY[0x1F4188790](v39);
  uint64_t v40 = (void (*)(void))OUTLINED_FUNCTION_83();
  OUTLINED_FUNCTION_75();
  uint64_t v56 = v20;
  uint64_t v57 = v28;
  OUTLINED_FUNCTION_306();
  uint64_t v58 = v42;
  uint64_t v59 = v41;
  uint64_t v60 = v50;
  uint64_t v61 = v51;
  uint64_t v62 = v53;
  uint64_t v63 = v49;
  OUTLINED_FUNCTION_41_0();
  OUTLINED_FUNCTION_165();
  OUTLINED_FUNCTION_6_3();
  sub_1C9F07CF8();
  uint64_t v54 = *(NSObject **)(v20 + OBJC_IVAR___SRDRequestDispatcherInternal_rdmbQueue);
  uint64_t v43 = OUTLINED_FUNCTION_87();
  ((void (*)(uint64_t))v40)(v43);
  OUTLINED_FUNCTION_93();
  v40();
  OUTLINED_FUNCTION_8_4();
  uint64_t v44 = swift_allocObject();
  uint64_t v45 = OUTLINED_FUNCTION_32_1(v44);
  ((void (*)(uint64_t))v21)(v45);
  OUTLINED_FUNCTION_48_0();
  v21();
  *(void *)(v44 + v34) = 0xD000000000000049;
  OUTLINED_FUNCTION_92(v44 + v34);
  *unint64_t v46 = sub_1C9EF9EB4;
  v46[1] = (uint64_t (*)())&v55;
  uint64_t v47 = OUTLINED_FUNCTION_7_1();
  *(void *)(v47 + 16) = sub_1C9EF9C40;
  *(void *)(v47 + 24) = v44;
  v64[4] = sub_1C9EFBBDC;
  v64[5] = v47;
  v64[0] = MEMORY[0x1E4F143A8];
  OUTLINED_FUNCTION_33_0(COERCE_DOUBLE(1107296256));
  v64[2] = sub_1C9EDF214;
  v64[3] = &block_descriptor_168;
  _Block_copy(v64);
  OUTLINED_FUNCTION_53();
  swift_release();
  dispatch_sync(v54, v52);
  _Block_release(v52);
  uint64_t v48 = *(void (**)(void))(v32 + 8);
  OUTLINED_FUNCTION_13_2();
  v48();
  OUTLINED_FUNCTION_13_2();
  v48();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_40_0();
  swift_release();
  if (v30) {
    __break(1u);
  }
  else {
    OUTLINED_FUNCTION_11_1();
  }
}

uint64_t sub_1C9EEB854()
{
  uint64_t v0 = sub_1C9F07A68();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x1F4188790](v0);
  uint64_t v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C9EE4448();
  sub_1C9EEBA3C();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

uint64_t sub_1C9EEB984(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void (*a6)(uint64_t))
{
  sub_1C9F07FE8();
  sub_1C9F07FE8();
  sub_1C9F07FE8();
  id v8 = a1;
  uint64_t v9 = OUTLINED_FUNCTION_280();
  a6(v9);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void sub_1C9EEBA3C()
{
  OUTLINED_FUNCTION_14_1();
  id v108 = v2;
  uint64_t v114 = v3;
  unint64_t v111 = v4;
  unint64_t v6 = v5;
  uint64_t v8 = v7;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC7F020);
  uint64_t v10 = OUTLINED_FUNCTION_10_3(v9);
  MEMORY[0x1F4188790](v10);
  uint64_t v12 = (char *)&v97 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C9F07E98();
  OUTLINED_FUNCTION_0();
  uint64_t v106 = v14;
  uint64_t v107 = v13;
  MEMORY[0x1F4188790](v13);
  unint64_t v104 = (char *)&v97 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v105 = OUTLINED_FUNCTION_95();
  OUTLINED_FUNCTION_0();
  uint64_t v103 = v16;
  MEMORY[0x1F4188790](v17);
  uint64_t v102 = (char *)&v97 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = OUTLINED_FUNCTION_141();
  OUTLINED_FUNCTION_0();
  unint64_t v112 = v20;
  uint64_t v22 = *(void *)(v21 + 64);
  uint64_t v24 = MEMORY[0x1F4188790](v23);
  uint64_t v101 = (char *)&v97 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v24);
  OUTLINED_FUNCTION_21_0();
  uint64_t v113 = v25;
  uint64_t v26 = sub_1C9F07BF8();
  OUTLINED_FUNCTION_0();
  uint64_t v28 = v27;
  MEMORY[0x1F4188790](v29);
  OUTLINED_FUNCTION_67();
  uint64_t v110 = v8;
  uint64_t v30 = v8;
  unint64_t v31 = v6;
  sub_1C9EFEEF8(v30, v6);
  if (!v32)
  {
    uint64_t v69 = (uint64_t)v111;
    char v70 = v114;
    if (qword_1EBC7F680 != -1) {
      swift_once();
    }
    uint64_t v71 = sub_1C9F07E78();
    __swift_project_value_buffer(v71, (uint64_t)qword_1EBC7FEF0);
    OUTLINED_FUNCTION_212();
    swift_bridgeObjectRetain_n();
    int v72 = sub_1C9F07E68();
    os_log_type_t v73 = sub_1C9F08168();
    if (!OUTLINED_FUNCTION_19_1(v73))
    {

      OUTLINED_FUNCTION_138();
      OUTLINED_FUNCTION_222();
      goto LABEL_26;
    }
    uint64_t v74 = OUTLINED_FUNCTION_29();
    v115[0] = OUTLINED_FUNCTION_28();
    *(_DWORD *)uint64_t v74 = 136315394;
    swift_bridgeObjectRetain();
    uint64_t v75 = sub_1C9F01420(v110, v6, v115);
    OUTLINED_FUNCTION_246(v75);
    sub_1C9F08228();
    OUTLINED_FUNCTION_221();
    *(_WORD *)(v74 + 12) = 2080;
    swift_bridgeObjectRetain();
    uint64_t v116 = sub_1C9F01420(v69, (unint64_t)v70, v115);
    sub_1C9F08228();
    OUTLINED_FUNCTION_19_0();
    OUTLINED_FUNCTION_99(&dword_1C9EC7000, v76, v77, "No active session for assistantId: %s cannot start remote server request for request id: %s");
    swift_arrayDestroy();
    OUTLINED_FUNCTION_1();
    OUTLINED_FUNCTION_1();
    goto LABEL_17;
  }
  uint64_t v100 = v0;
  uint64_t v99 = v12;
  uint64_t v109 = v19;
  uint64_t v33 = v32;
  uint64_t v34 = *MEMORY[0x1E4FA26B0];
  uint64_t v98 = *(uint64_t (**)(void))(v28 + 104);
  ((void (*)(uint64_t, uint64_t, uint64_t))v98)(v1, v34, v26);
  char v35 = OUTLINED_FUNCTION_353();
  uint64_t v36 = *(void (**)(uint64_t))(v28 + 8);
  uint64_t v37 = OUTLINED_FUNCTION_325();
  v36(v37);
  if ((v35 & 1) == 0)
  {
    uint64_t v110 = v33;
    if (qword_1EBC7F680 != -1) {
      swift_once();
    }
    uint64_t v78 = sub_1C9F07E78();
    uint64_t v79 = OUTLINED_FUNCTION_2_2(v78, (uint64_t)qword_1EBC7FEF0);
    os_log_type_t v80 = sub_1C9F08168();
    if (!OUTLINED_FUNCTION_191(v80))
    {

      swift_release();
      goto LABEL_26;
    }
    uint64_t v114 = v79;
    uint64_t v81 = (_DWORD *)OUTLINED_FUNCTION_7();
    uint64_t v113 = OUTLINED_FUNCTION_11_3();
    v115[0] = v113;
    unint64_t v112 = v81;
    _DWORD *v81 = 136315138;
    unint64_t v111 = v81 + 1;
    OUTLINED_FUNCTION_306();
    v82();
    sub_1C9F07BE8();
    unint64_t v84 = v83;
    uint64_t v85 = OUTLINED_FUNCTION_325();
    v36(v85);
    uint64_t v86 = OUTLINED_FUNCTION_322();
    uint64_t v88 = sub_1C9F01420(v86, v84, v87);
    OUTLINED_FUNCTION_60(v88);
    sub_1C9F08228();
    swift_bridgeObjectRelease();
    int v72 = v114;
    OUTLINED_FUNCTION_57(&dword_1C9EC7000, v114, (os_log_type_t)v22, "Current session is not of type %s, cannot start remote server request");
    OUTLINED_FUNCTION_147();
    OUTLINED_FUNCTION_1();
    OUTLINED_FUNCTION_1();
    swift_release();
LABEL_17:

    goto LABEL_26;
  }
  uint64_t v38 = v113;
  uint64_t v39 = (uint64_t (*)(void))*((void *)v112 + 2);
  uint64_t v40 = v109;
  OUTLINED_FUNCTION_55();
  uint64_t v41 = v39();
  MEMORY[0x1F4188790](v41);
  *(&v97 - 6) = v110;
  *(&v97 - 5) = v31;
  uint64_t v42 = (uint64_t)v111;
  *(&v97 - 4) = v38;
  *(&v97 - 3) = v42;
  uint64_t v43 = (uint64_t)v108;
  *(&v97 - 2) = (uint64_t)v114;
  *(&v97 - 1) = v43;
  id v44 = objc_allocWithZone((Class)sub_1C9F07758());
  OUTLINED_FUNCTION_80();
  uint64_t v45 = (void *)sub_1C9F06C48();
  if (v45)
  {
    uint64_t v110 = v33;
    uint64_t v46 = v100;
    id v108 = v45;
    sub_1C9ED0FAC(v45);
    uint64_t v47 = *(void *)(v46 + OBJC_IVAR___SRDRequestDispatcherInternal_assetLogger);
    if ((*(unsigned char *)(v47 + 32) & 1) != 0 || (OUTLINED_FUNCTION_110(), v48))
    {
      uint64_t v97 = *(void *)(v47 + 16);
      OUTLINED_FUNCTION_55();
      v39();
      OUTLINED_FUNCTION_351();
      uint64_t v49 = swift_allocObject();
      uint64_t v98 = v39;
      uint64_t v50 = v49;
      OUTLINED_FUNCTION_319(v49);
      OUTLINED_FUNCTION_103();
      v51();
      uint64_t v52 = (uint64_t *)(v50 + ((v22 + v46 + 7) & 0xFFFFFFFFFFFFFFF8));
      uint64_t v53 = v114;
      *uint64_t v52 = v42;
      v52[1] = (uint64_t)v53;
      v115[4] = (uint64_t)sub_1C9EFAE00;
      v115[5] = v50;
      v115[0] = MEMORY[0x1E4F143A8];
      OUTLINED_FUNCTION_33_0(COERCE_DOUBLE(1107296256));
      v115[2] = (uint64_t)sub_1C9EDF1A8;
      v115[3] = (uint64_t)&block_descriptor_380;
      uint64_t v54 = _Block_copy(v115);
      swift_retain();
      swift_bridgeObjectRetain();
      uint64_t v55 = v102;
      sub_1C9F07EB8();
      uint64_t v116 = MEMORY[0x1E4FBC860];
      sub_1C9EFBB30((unint64_t *)&unk_1EBC7F7E0, MEMORY[0x1E4FBCB00]);
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC7F7F8);
      sub_1C9EFB3B4((unint64_t *)&qword_1EBC7F800, &qword_1EBC7F7F8);
      uint64_t v56 = v104;
      uint64_t v39 = v98;
      sub_1C9F08278();
      MEMORY[0x1CB794A40](0, v55, v56, v54);
      uint64_t v57 = v54;
      uint64_t v40 = v109;
      _Block_release(v57);
      OUTLINED_FUNCTION_232();
      OUTLINED_FUNCTION_1_0();
      v58();
      OUTLINED_FUNCTION_231();
      OUTLINED_FUNCTION_1_0();
      v59();
      swift_release();
    }
    uint64_t v60 = v100;
    uint64_t v107 = *(void *)(v100 + OBJC_IVAR___SRDRequestDispatcherInternal_instrumentationUtil);
    uint64_t v61 = (uint64_t)v99;
    OUTLINED_FUNCTION_55();
    v39();
    OUTLINED_FUNCTION_32_0();
    __swift_storeEnumTagSinglePayload(v62, v63, v64, v40);
    LODWORD(v106) = AFDeviceSupportsSiriUOD();
    LODWORD(v105) = AFShouldRunAsrOnServerForUOD();
    OUTLINED_FUNCTION_200((void *)(v60 + OBJC_IVAR___SRDRequestDispatcherInternal_serverFallbackDisablingUtils), *(void *)(v60 + OBJC_IVAR___SRDRequestDispatcherInternal_serverFallbackDisablingUtils + 24));
    swift_bridgeObjectRetain();
    uint64_t v65 = v114;
    OUTLINED_FUNCTION_339();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_244();
    OUTLINED_FUNCTION_330();
    swift_bridgeObjectRelease();
    uint64_t v66 = OUTLINED_FUNCTION_297();
    sub_1C9ED91A4(v66, v42, (uint64_t)v65, 1, v106, v105, v67, v68, v97);
    swift_release();

    sub_1C9EFB940(v61, &qword_1EBC7F020);
    (*((void (**)(uint64_t, uint64_t))v112 + 1))(v113, v109);
  }
  else
  {
    if (qword_1EBC7F680 != -1) {
      swift_once();
    }
    uint64_t v89 = sub_1C9F07E78();
    OUTLINED_FUNCTION_313(v89, (uint64_t)qword_1EBC7FEF0);
    uint64_t v90 = v114;
    OUTLINED_FUNCTION_131();
    uint64_t v91 = (void *)sub_1C9F07E68();
    os_log_type_t v92 = sub_1C9F08168();
    if (OUTLINED_FUNCTION_19_1(v92))
    {
      OUTLINED_FUNCTION_7();
      uint64_t v93 = OUTLINED_FUNCTION_11_3();
      OUTLINED_FUNCTION_282(v93);
      OUTLINED_FUNCTION_312(4.8149e-34);
      uint64_t v94 = sub_1C9F01420(v42, (unint64_t)v90, v115);
      OUTLINED_FUNCTION_247(v94);
      uint64_t v40 = v109;
      sub_1C9F08228();
      OUTLINED_FUNCTION_150();
      OUTLINED_FUNCTION_25_1(&dword_1C9EC7000, v95, v96, "Failed to create StartRemoteServerRequestMessage for request Id: %s");
      OUTLINED_FUNCTION_45_0();
      OUTLINED_FUNCTION_1();
      OUTLINED_FUNCTION_1();
      swift_release();
    }
    else
    {

      OUTLINED_FUNCTION_132();
      swift_release();
    }
    (*((void (**)(uint64_t, uint64_t))v112 + 1))(v113, v40);
  }
LABEL_26:
  OUTLINED_FUNCTION_11_1();
}

uint64_t sub_1C9EEC47C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v22 = a5;
  uint64_t v23 = a7;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBC7FCF8);
  MEMORY[0x1F4188790](v8 - 8);
  uint64_t v10 = (char *)&v22 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC7F020);
  MEMORY[0x1F4188790](v11 - 8);
  uint64_t v13 = (char *)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC7FCF0);
  MEMORY[0x1F4188790](v14 - 8);
  uint64_t v16 = (char *)&v22 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = *MEMORY[0x1E4FA22F8];
  uint64_t v18 = sub_1C9F07A48();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v18 - 8) + 104))(v16, v17, v18);
  __swift_storeEnumTagSinglePayload((uint64_t)v16, 0, 1, v18);
  sub_1C9F06A68();
  swift_bridgeObjectRetain();
  sub_1C9F06A38();
  uint64_t v19 = sub_1C9F069B8();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v19 - 8) + 16))(v13, a4, v19);
  __swift_storeEnumTagSinglePayload((uint64_t)v13, 0, 1, v19);
  sub_1C9F06A88();
  swift_bridgeObjectRetain();
  sub_1C9F06A78();
  uint64_t v20 = sub_1C9F07A68();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v20 - 8) + 16))(v10, v23, v20);
  __swift_storeEnumTagSinglePayload((uint64_t)v10, 0, 1, v20);
  return sub_1C9F06A48();
}

void sub_1C9EEC6F8()
{
  OUTLINED_FUNCTION_14_1();
  uint64_t v10 = OUTLINED_FUNCTION_56(v2, v3, v4, v5, v6, v7, v8, v9);
  char v11 = OUTLINED_FUNCTION_216(v10, (uint64_t)&v49);
  OUTLINED_FUNCTION_0();
  uint64_t v13 = v12;
  uint64_t v15 = *(void *)(v14 + 64);
  uint64_t v17 = MEMORY[0x1F4188790](v16);
  OUTLINED_FUNCTION_35_0(v17, v18, v19, v20, v21, v22, v23, v24, v43);
  MEMORY[0x1F4188790](v25);
  OUTLINED_FUNCTION_42_0();
  uint64_t v27 = MEMORY[0x1F4188790](v26);
  OUTLINED_FUNCTION_113(v27, v28, v29, v30, v31, v32, v33, v34, v44);
  MEMORY[0x1F4188790](v35);
  uint64_t v36 = (void (*)(void))OUTLINED_FUNCTION_83();
  OUTLINED_FUNCTION_75();
  OUTLINED_FUNCTION_44_0();
  OUTLINED_FUNCTION_41_0();
  OUTLINED_FUNCTION_165();
  OUTLINED_FUNCTION_6_3();
  sub_1C9F07CF8();
  uint64_t v46 = *(NSObject **)(v1 + OBJC_IVAR___SRDRequestDispatcherInternal_rdmbQueue);
  uint64_t v37 = OUTLINED_FUNCTION_87();
  ((void (*)(uint64_t))v36)(v37);
  OUTLINED_FUNCTION_93();
  v36();
  OUTLINED_FUNCTION_8_4();
  uint64_t v38 = swift_allocObject();
  uint64_t v39 = OUTLINED_FUNCTION_32_1(v38);
  ((void (*)(uint64_t))v0)(v39);
  OUTLINED_FUNCTION_48_0();
  v0();
  *(void *)(v38 + v15) = 0xD00000000000006ALL;
  OUTLINED_FUNCTION_92(v38 + v15);
  *uint64_t v40 = sub_1C9EF9ECC;
  v40[1] = (uint64_t (*)())&v47;
  uint64_t v41 = OUTLINED_FUNCTION_7_1();
  *(void *)(v41 + 16) = sub_1C9EF9C40;
  *(void *)(v41 + 24) = v38;
  v48[4] = sub_1C9EFBBDC;
  uint64_t v48[5] = v41;
  v48[0] = MEMORY[0x1E4F143A8];
  OUTLINED_FUNCTION_33_0(COERCE_DOUBLE(1107296256));
  v48[2] = sub_1C9EDF214;
  v48[3] = &block_descriptor_179;
  _Block_copy(v48);
  OUTLINED_FUNCTION_53();
  swift_release();
  dispatch_sync(v46, v45);
  _Block_release(v45);
  uint64_t v42 = *(void (**)(void))(v13 + 8);
  OUTLINED_FUNCTION_13_2();
  v42();
  OUTLINED_FUNCTION_13_2();
  v42();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_40_0();
  swift_release();
  if (v11) {
    __break(1u);
  }
  else {
    OUTLINED_FUNCTION_11_1();
  }
}

uint64_t sub_1C9EEC99C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v13[2] = a1;
  v13[3] = a8;
  v13[1] = a5;
  uint64_t v8 = sub_1C9F07A68();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8);
  char v11 = (char *)v13 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C9EE4448();
  sub_1C9EECADC();
  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

void sub_1C9EECADC()
{
  OUTLINED_FUNCTION_14_1();
  v171 = v4;
  uint64_t v167 = v5;
  uint64_t v166 = v6;
  v170 = v7;
  uint64_t v181 = v8;
  uint64_t v178 = v9;
  char v11 = v10;
  OUTLINED_FUNCTION_349();
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC7F020);
  uint64_t v13 = OUTLINED_FUNCTION_10_3(v12);
  MEMORY[0x1F4188790](v13);
  OUTLINED_FUNCTION_84(v14, v157[0]);
  uint64_t v164 = sub_1C9F07E98();
  OUTLINED_FUNCTION_0();
  uint64_t v163 = v15;
  MEMORY[0x1F4188790](v16);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_260(v17);
  uint64_t v162 = OUTLINED_FUNCTION_95();
  OUTLINED_FUNCTION_0();
  uint64_t v160 = v18;
  MEMORY[0x1F4188790](v19);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_115(v20);
  uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC7FD70);
  uint64_t v22 = OUTLINED_FUNCTION_10_3(v21);
  MEMORY[0x1F4188790](v22);
  OUTLINED_FUNCTION_193(v23, v157[0]);
  uint64_t v177 = sub_1C9F07C98();
  OUTLINED_FUNCTION_0();
  uint64_t v25 = v24;
  MEMORY[0x1F4188790](v26);
  OUTLINED_FUNCTION_67();
  uint64_t v27 = sub_1C9F069B8();
  OUTLINED_FUNCTION_0();
  uint64_t v29 = v28;
  MEMORY[0x1F4188790](v30);
  OUTLINED_FUNCTION_125();
  OUTLINED_FUNCTION_115(v31);
  OUTLINED_FUNCTION_270((uint64_t)&v184);
  MEMORY[0x1F4188790](v32);
  OUTLINED_FUNCTION_21_0();
  uint64_t v176 = v33;
  sub_1C9F07BF8();
  OUTLINED_FUNCTION_0();
  uint64_t v35 = v34;
  MEMORY[0x1F4188790](v36);
  OUTLINED_FUNCTION_142();
  uint64_t v175 = v0;
  v179 = (_DWORD *)v1;
  v180 = v11;
  sub_1C9EFEEF8(v1, (unint64_t)v11);
  if (v37)
  {
    uint64_t v158 = v3;
    v157[2] = v25;
    uint64_t v173 = v27;
    uint64_t v169 = v29;
    unint64_t v38 = *MEMORY[0x1E4FA26B0];
    uint64_t v39 = *(void (**)(uint64_t))(v35 + 104);
    uint64_t v40 = v37;
    uint64_t v41 = OUTLINED_FUNCTION_227();
    v39(v41);
    char v42 = sub_1C9EFDE68();
    uint64_t v43 = *(void (**)(void))(v35 + 8);
    OUTLINED_FUNCTION_26_1();
    v43();
    uint64_t v172 = v40;
    if (v42)
    {
      uint64_t v44 = v169;
      uint64_t v45 = *(void (**)(void))(v169 + 16);
      uint64_t v46 = v176;
      uint64_t v47 = v173;
      OUTLINED_FUNCTION_93();
      v45();
      uint64_t v48 = v175 + OBJC_IVAR___SRDRequestDispatcherInternal_sessionUserId;
      OUTLINED_FUNCTION_15_0();
      sub_1C9EFADA4(v48, (uint64_t)v174, &qword_1EBC7FD70);
      if (__swift_getEnumTagSinglePayload((uint64_t)v174, 1, v177) == 1)
      {
        sub_1C9EFB940((uint64_t)v174, &qword_1EBC7FD70);
        unint64_t v49 = v181;
        if (qword_1EBC7F680 != -1) {
          swift_once();
        }
        uint64_t v50 = sub_1C9F07E78();
        __swift_project_value_buffer(v50, (uint64_t)qword_1EBC7FEF0);
        OUTLINED_FUNCTION_131();
        unint64_t v51 = (unint64_t)v180;
        swift_bridgeObjectRetain_n();
        uint64_t v52 = (void *)sub_1C9F07E68();
        os_log_type_t v53 = sub_1C9F08168();
        if (OUTLINED_FUNCTION_9_2(v53))
        {
          uint64_t v54 = (_DWORD *)OUTLINED_FUNCTION_29();
          v182[0] = OUTLINED_FUNCTION_28();
          *uint64_t v54 = 136315394;
          swift_bridgeObjectRetain();
          uint64_t v55 = sub_1C9F01420((uint64_t)v179, v51, v182);
          OUTLINED_FUNCTION_292(v55);
          OUTLINED_FUNCTION_347();
          OUTLINED_FUNCTION_154();
          OUTLINED_FUNCTION_335();
          uint64_t v183 = sub_1C9F01420(v178, v49, v182);
          OUTLINED_FUNCTION_347();
          OUTLINED_FUNCTION_150();
          OUTLINED_FUNCTION_176(&dword_1C9EC7000, v56, v57, "sessionUserId is not set for assistantId: %s during request: %s");
          OUTLINED_FUNCTION_169();
          uint64_t v47 = v173;
          OUTLINED_FUNCTION_1();
          OUTLINED_FUNCTION_1();
          swift_release();
        }
        else
        {

          OUTLINED_FUNCTION_132();
          OUTLINED_FUNCTION_155();
          swift_release();
        }
        (*(void (**)(uint64_t, uint64_t))(v44 + 8))(v46, v47);
        goto LABEL_52;
      }
      v157[1] = (uint64_t)v45;
      uint64_t v74 = v158;
      OUTLINED_FUNCTION_103();
      uint64_t v76 = v75();
      MEMORY[0x1F4188790](v76);
      uint64_t v77 = (uint64_t)v179;
      uint64_t v78 = v180;
      v157[-8] = (uint64_t)v179;
      v157[-7] = (uint64_t)v78;
      uint64_t v79 = v178;
      v157[-6] = v46;
      v157[-5] = v79;
      uint64_t v80 = v46;
      uint64_t v81 = v181;
      uint64_t v82 = (uint64_t)v170;
      v157[-4] = v181;
      v157[-3] = v82;
      v157[-2] = (uint64_t)v171;
      id v83 = objc_allocWithZone((Class)sub_1C9F07878());
      OUTLINED_FUNCTION_80();
      unint64_t v84 = (void *)sub_1C9F06C48();
      if (!v84)
      {
        uint64_t v120 = v80;
        if (qword_1EBC7F680 != -1) {
          swift_once();
        }
        uint64_t v121 = sub_1C9F07E78();
        OUTLINED_FUNCTION_46_0(v121, (uint64_t)qword_1EBC7FEF0);
        uint64_t v122 = (void *)sub_1C9F07E68();
        os_log_type_t v123 = sub_1C9F08168();
        OUTLINED_FUNCTION_19_1(v123);
        OUTLINED_FUNCTION_255();
        if (!v124)
        {

          OUTLINED_FUNCTION_100();
          swift_release();
LABEL_51:
          OUTLINED_FUNCTION_1_0();
          v155();
          v78[1](v120, v79);
          goto LABEL_52;
        }
        OUTLINED_FUNCTION_7();
        uint64_t v125 = OUTLINED_FUNCTION_11_3();
        OUTLINED_FUNCTION_224(v125);
        OUTLINED_FUNCTION_74(4.8149e-34);
        uint64_t v126 = OUTLINED_FUNCTION_171();
        OUTLINED_FUNCTION_59(v126);
        OUTLINED_FUNCTION_88();
        OUTLINED_FUNCTION_25_1(&dword_1C9EC7000, v127, v128, "Failed to create StartRemoteServerTextRequestMessage for request Id: %s");
        OUTLINED_FUNCTION_45_0();
        OUTLINED_FUNCTION_1();
        OUTLINED_FUNCTION_1();
        swift_release();
LABEL_43:

        goto LABEL_51;
      }
      v174 = v84;
      MEMORY[0x1F4188790](v84);
      v157[-10] = v77;
      v157[-9] = (uint64_t)v78;
      v157[-8] = v80;
      v157[-7] = v79;
      uint64_t v85 = v166;
      v157[-6] = v81;
      v157[-5] = v85;
      v157[-4] = v167;
      v157[-3] = v74;
      v157[-2] = ObjectType;
      id v86 = objc_allocWithZone((Class)sub_1C9F07288());
      OUTLINED_FUNCTION_80();
      uint64_t v87 = (void *)sub_1C9F07208();
      if (v87)
      {
        v171 = v87;
        MEMORY[0x1F4188790](v87);
        OUTLINED_FUNCTION_185();
        id v88 = objc_allocWithZone((Class)sub_1C9F06CE8());
        OUTLINED_FUNCTION_80();
        uint64_t v89 = (void *)sub_1C9F06C68();
        v170 = v89;
        if (v89)
        {
          MEMORY[0x1F4188790](v89);
          OUTLINED_FUNCTION_185();
          objc_allocWithZone((Class)sub_1C9F06B18());
          uint64_t v90 = sub_1C9F06B08();
          if (v90)
          {
            uint64_t v91 = (void (**)(void, uint64_t))v90;
            uint64_t v92 = v175;
            sub_1C9ED0FAC(v174);
            sub_1C9ED0FAC(v171);
            sub_1C9ED0FAC(v170);
            v180 = v91;
            sub_1C9ED0FAC(v91);
            uint64_t v93 = *(void *)(v92 + OBJC_IVAR___SRDRequestDispatcherInternal_assetLogger);
            uint64_t v94 = v173;
            if ((*(unsigned char *)(v93 + 32) & 1) != 0 || (OUTLINED_FUNCTION_110(), v95))
            {
              v179 = *(_DWORD **)(v93 + 16);
              OUTLINED_FUNCTION_108();
              v96();
              OUTLINED_FUNCTION_351();
              OUTLINED_FUNCTION_112();
              uint64_t v97 = swift_allocObject();
              OUTLINED_FUNCTION_319(v97);
              OUTLINED_FUNCTION_103();
              v98();
              uint64_t v99 = (void *)(v97 + v79);
              *uint64_t v99 = v178;
              v99[1] = v81;
              v182[4] = (uint64_t)sub_1C9EFAE00;
              v182[5] = v97;
              v182[0] = MEMORY[0x1E4F143A8];
              v182[1] = 1107296256;
              v182[2] = (uint64_t)sub_1C9EDF1A8;
              v182[3] = (uint64_t)&block_descriptor_373;
              uint64_t v100 = _Block_copy(v182);
              swift_retain();
              swift_bridgeObjectRetain();
              uint64_t v101 = v159;
              sub_1C9F07EB8();
              uint64_t v183 = MEMORY[0x1E4FBC860];
              sub_1C9EFBB30((unint64_t *)&unk_1EBC7F7E0, MEMORY[0x1E4FBCB00]);
              __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC7F7F8);
              sub_1C9EFB3B4((unint64_t *)&qword_1EBC7F800, &qword_1EBC7F7F8);
              uint64_t v102 = v161;
              uint64_t v94 = v173;
              sub_1C9F08278();
              MEMORY[0x1CB794A40](0, v101, v102, v100);
              _Block_release(v100);
              OUTLINED_FUNCTION_231();
              OUTLINED_FUNCTION_1_0();
              v103();
              OUTLINED_FUNCTION_232();
              OUTLINED_FUNCTION_1_0();
              v104();
              swift_release();
            }
            uint64_t v105 = v175;
            v179 = *(_DWORD **)(v175 + OBJC_IVAR___SRDRequestDispatcherInternal_instrumentationUtil);
            uint64_t v106 = v165;
            OUTLINED_FUNCTION_108();
            v107();
            OUTLINED_FUNCTION_32_0();
            __swift_storeEnumTagSinglePayload(v108, v109, v110, v94);
            LODWORD(ObjectType) = AFDeviceSupportsSiriUOD();
            LODWORD(v167) = AFShouldRunAsrOnServerForUOD();
            OUTLINED_FUNCTION_200((void *)(v105 + OBJC_IVAR___SRDRequestDispatcherInternal_serverFallbackDisablingUtils), *(void *)(v105 + OBJC_IVAR___SRDRequestDispatcherInternal_serverFallbackDisablingUtils + 24));
            swift_bridgeObjectRetain();
            OUTLINED_FUNCTION_215();
            OUTLINED_FUNCTION_339();
            swift_bridgeObjectRelease();
            OUTLINED_FUNCTION_244();
            OUTLINED_FUNCTION_215();
            OUTLINED_FUNCTION_330();
            swift_bridgeObjectRelease();
            OUTLINED_FUNCTION_297();
            OUTLINED_FUNCTION_215();
            sub_1C9ED91A4(v111, v112, v113, 2, ObjectType, v167, v114, v115, v157[0]);
            swift_release();

            sub_1C9EFB940(v106, &qword_1EBC7F020);
            OUTLINED_FUNCTION_1_0();
            v117(v116);
            OUTLINED_FUNCTION_250();
            OUTLINED_FUNCTION_1_0();
            v119(v118);
          }
          else
          {
            uint64_t v145 = v173;
            if (qword_1EBC7F680 != -1) {
              swift_once();
            }
            uint64_t v146 = sub_1C9F07E78();
            OUTLINED_FUNCTION_46_0(v146, (uint64_t)qword_1EBC7FEF0);
            v147 = (void *)sub_1C9F07E68();
            os_log_type_t v148 = sub_1C9F08168();
            BOOL v149 = OUTLINED_FUNCTION_19_1(v148);
            uint64_t v150 = v169;
            if (v149)
            {
              OUTLINED_FUNCTION_7();
              uint64_t v151 = OUTLINED_FUNCTION_11_3();
              OUTLINED_FUNCTION_224(v151);
              OUTLINED_FUNCTION_74(4.8149e-34);
              uint64_t v152 = OUTLINED_FUNCTION_171();
              OUTLINED_FUNCTION_59(v152);
              OUTLINED_FUNCTION_88();
              OUTLINED_FUNCTION_25_1(&dword_1C9EC7000, v153, v154, "Failed to create ResultSelectedMessage for request Id: %s");
              OUTLINED_FUNCTION_45_0();
              OUTLINED_FUNCTION_1();
              OUTLINED_FUNCTION_1();
              swift_release();
            }
            else
            {

              OUTLINED_FUNCTION_100();
              swift_release();
            }
            OUTLINED_FUNCTION_1_0();
            v156();
            (*(void (**)(uint64_t, uint64_t))(v150 + 8))(v176, v145);
          }
          goto LABEL_52;
        }
        uint64_t v120 = v80;
        if (qword_1EBC7F680 != -1) {
          swift_once();
        }
        uint64_t v137 = sub_1C9F07E78();
        OUTLINED_FUNCTION_46_0(v137, (uint64_t)qword_1EBC7FEF0);
        uint64_t v122 = (void *)sub_1C9F07E68();
        os_log_type_t v138 = sub_1C9F08168();
        OUTLINED_FUNCTION_19_1(v138);
        OUTLINED_FUNCTION_255();
        if (v139)
        {
          OUTLINED_FUNCTION_7();
          uint64_t v140 = OUTLINED_FUNCTION_11_3();
          OUTLINED_FUNCTION_224(v140);
          OUTLINED_FUNCTION_74(4.8149e-34);
          uint64_t v141 = OUTLINED_FUNCTION_171();
          OUTLINED_FUNCTION_59(v141);
          OUTLINED_FUNCTION_88();
          OUTLINED_FUNCTION_25_1(&dword_1C9EC7000, v142, v143, "Failed to create ExecuteNLOnServerMessage for request Id: %s");
          OUTLINED_FUNCTION_45_0();
          OUTLINED_FUNCTION_1();
          OUTLINED_FUNCTION_1();
          swift_release();

          uint64_t v136 = v171;
          goto LABEL_42;
        }

        OUTLINED_FUNCTION_100();
        swift_release();

        uint64_t v144 = v171;
      }
      else
      {
        uint64_t v120 = v80;
        if (qword_1EBC7F680 != -1) {
          swift_once();
        }
        uint64_t v129 = sub_1C9F07E78();
        OUTLINED_FUNCTION_46_0(v129, (uint64_t)qword_1EBC7FEF0);
        uint64_t v122 = (void *)sub_1C9F07E68();
        os_log_type_t v130 = sub_1C9F08168();
        OUTLINED_FUNCTION_19_1(v130);
        OUTLINED_FUNCTION_255();
        if (v131)
        {
          OUTLINED_FUNCTION_7();
          uint64_t v132 = OUTLINED_FUNCTION_11_3();
          OUTLINED_FUNCTION_224(v132);
          OUTLINED_FUNCTION_74(4.8149e-34);
          uint64_t v133 = OUTLINED_FUNCTION_171();
          OUTLINED_FUNCTION_59(v133);
          OUTLINED_FUNCTION_88();
          OUTLINED_FUNCTION_25_1(&dword_1C9EC7000, v134, v135, "Failed to create TextBasedResultCandidateMessage for request Id: %s");
          OUTLINED_FUNCTION_45_0();
          OUTLINED_FUNCTION_1();
          OUTLINED_FUNCTION_1();
          swift_release();
          uint64_t v136 = v174;
LABEL_42:

          goto LABEL_43;
        }

        OUTLINED_FUNCTION_100();
        swift_release();
        uint64_t v144 = v174;
      }

      goto LABEL_51;
    }
    if (qword_1EBC7F680 != -1) {
      swift_once();
    }
    uint64_t v67 = sub_1C9F07E78();
    int v68 = OUTLINED_FUNCTION_2_2(v67, (uint64_t)qword_1EBC7FEF0);
    os_log_type_t v69 = sub_1C9F08168();
    if (OUTLINED_FUNCTION_19_1(v69))
    {
      char v70 = (_DWORD *)OUTLINED_FUNCTION_7();
      v182[0] = OUTLINED_FUNCTION_11_3();
      _DWORD *v70 = 136315138;
      v179 = v70 + 1;
      v180 = (void (**)(void, uint64_t))v70;
      uint64_t v71 = OUTLINED_FUNCTION_227();
      v72(v71);
      sub_1C9F07BE8();
      OUTLINED_FUNCTION_348();
      OUTLINED_FUNCTION_26_1();
      v43();
      uint64_t v73 = sub_1C9F01420(v2, v38, v182);
      OUTLINED_FUNCTION_129(v73);
      sub_1C9F08228();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_57(&dword_1C9EC7000, v68, (os_log_type_t)v1, "Current session is not of type %s, cannot start server text request request");
      OUTLINED_FUNCTION_147();
      OUTLINED_FUNCTION_1();
      OUTLINED_FUNCTION_1();
      swift_release();
    }
    else
    {

      swift_release();
    }
  }
  else
  {
    if (qword_1EBC7F680 != -1) {
      swift_once();
    }
    uint64_t v58 = sub_1C9F07E78();
    OUTLINED_FUNCTION_313(v58, (uint64_t)qword_1EBC7FEF0);
    unint64_t v59 = v181;
    OUTLINED_FUNCTION_131();
    unint64_t v60 = (unint64_t)v180;
    OUTLINED_FUNCTION_212();
    uint64_t v61 = (void *)sub_1C9F07E68();
    os_log_type_t v62 = sub_1C9F08168();
    uint64_t v63 = (uint64_t)v179;
    if (OUTLINED_FUNCTION_9_2(v62))
    {
      uint64_t v64 = (_DWORD *)OUTLINED_FUNCTION_29();
      v182[0] = OUTLINED_FUNCTION_28();
      *uint64_t v64 = 136315394;
      swift_bridgeObjectRetain();
      uint64_t v184 = sub_1C9F01420(v63, v60, v182);
      OUTLINED_FUNCTION_347();
      OUTLINED_FUNCTION_19_0();
      OUTLINED_FUNCTION_335();
      uint64_t v184 = sub_1C9F01420(v178, v59, v182);
      OUTLINED_FUNCTION_347();
      OUTLINED_FUNCTION_150();
      OUTLINED_FUNCTION_176(&dword_1C9EC7000, v65, v66, "No active session for assistantId: %s cannot start remote server text request for request id: %s");
      OUTLINED_FUNCTION_169();
      OUTLINED_FUNCTION_1();
      OUTLINED_FUNCTION_1();
    }
    else
    {

      OUTLINED_FUNCTION_132();
      OUTLINED_FUNCTION_138();
    }
  }
LABEL_52:
  OUTLINED_FUNCTION_11_1();
}

void sub_1C9EEDC34()
{
  OUTLINED_FUNCTION_14_1();
  uint64_t v3 = v2;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBC7FCF8);
  uint64_t v5 = OUTLINED_FUNCTION_10_3(v4);
  MEMORY[0x1F4188790](v5);
  OUTLINED_FUNCTION_20_1();
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC7F020);
  uint64_t v7 = OUTLINED_FUNCTION_10_3(v6);
  MEMORY[0x1F4188790](v7);
  OUTLINED_FUNCTION_68();
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC7FCF0);
  uint64_t v9 = OUTLINED_FUNCTION_10_3(v8);
  MEMORY[0x1F4188790](v9);
  OUTLINED_FUNCTION_144();
  uint64_t v10 = sub_1C9F07A48();
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_305();
  v11();
  __swift_storeEnumTagSinglePayload(v0, 0, 1, v10);
  sub_1C9F06A68();
  swift_bridgeObjectRetain();
  sub_1C9F06A38();
  uint64_t v12 = sub_1C9F069B8();
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_22_0();
  v13();
  uint64_t v14 = OUTLINED_FUNCTION_277();
  __swift_storeEnumTagSinglePayload(v14, v15, v16, v12);
  sub_1C9F06A88();
  swift_bridgeObjectRetain();
  sub_1C9F06A78();
  uint64_t v17 = sub_1C9F07A68();
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_22_0();
  v18();
  __swift_storeEnumTagSinglePayload(v1, 0, 1, v17);
  sub_1C9F06A48();
  if (v3)
  {
    id v19 = objc_allocWithZone((Class)sub_1C9F07B28());
    id v20 = v3;
    sub_1C9F07B18();
    sub_1C9F06A58();
  }
  OUTLINED_FUNCTION_11_1();
}

uint64_t sub_1C9EEDE6C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  v23[1] = a5;
  v23[2] = a7;
  v23[0] = a4;
  uint64_t v24 = a9;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC7FD70);
  MEMORY[0x1F4188790](v9 - 8);
  char v11 = (char *)v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC7F020);
  MEMORY[0x1F4188790](v12 - 8);
  uint64_t v14 = (char *)v23 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC7FCF0);
  MEMORY[0x1F4188790](v15 - 8);
  uint64_t v17 = (char *)v23 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = *MEMORY[0x1E4FA22F8];
  uint64_t v19 = sub_1C9F07A48();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v19 - 8) + 104))(v17, v18, v19);
  __swift_storeEnumTagSinglePayload((uint64_t)v17, 0, 1, v19);
  sub_1C9F07238();
  swift_bridgeObjectRetain();
  sub_1C9F07228();
  uint64_t v20 = sub_1C9F069B8();
  (*(void (**)(char *, void, uint64_t))(*(void *)(v20 - 8) + 16))(v14, v23[0], v20);
  __swift_storeEnumTagSinglePayload((uint64_t)v14, 0, 1, v20);
  sub_1C9F07268();
  swift_bridgeObjectRetain();
  sub_1C9F07258();
  if (qword_1EBC7F8A8 != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  sub_1C9F07218();
  swift_bridgeObjectRetain();
  sub_1C9F07278();
  uint64_t v21 = sub_1C9F07C98();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v21 - 8) + 16))(v11, v24, v21);
  __swift_storeEnumTagSinglePayload((uint64_t)v11, 0, 1, v21);
  return sub_1C9F07248();
}

uint64_t sub_1C9EEE158(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v21[1] = a5;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC7FD08);
  MEMORY[0x1F4188790](v6 - 8);
  uint64_t v8 = (char *)v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC7F020);
  MEMORY[0x1F4188790](v9 - 8);
  char v11 = (char *)v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC7FCF0);
  MEMORY[0x1F4188790](v12 - 8);
  uint64_t v14 = (char *)v21 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = *MEMORY[0x1E4FA22F8];
  uint64_t v16 = sub_1C9F07A48();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v16 - 8) + 104))(v14, v15, v16);
  __swift_storeEnumTagSinglePayload((uint64_t)v14, 0, 1, v16);
  sub_1C9F06CB8();
  swift_bridgeObjectRetain();
  sub_1C9F06C78();
  uint64_t v17 = sub_1C9F069B8();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v17 - 8) + 16))(v11, a4, v17);
  __swift_storeEnumTagSinglePayload((uint64_t)v11, 0, 1, v17);
  sub_1C9F06CD8();
  swift_bridgeObjectRetain();
  sub_1C9F06CC8();
  if (qword_1EBC7F8A8 != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  sub_1C9F06C98();
  sub_1C9F06CA8();
  uint64_t v18 = *MEMORY[0x1E4FA25F8];
  uint64_t v19 = sub_1C9F07B68();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v19 - 8) + 104))(v8, v18, v19);
  __swift_storeEnumTagSinglePayload((uint64_t)v8, 0, 1, v19);
  return sub_1C9F06C88();
}

uint64_t sub_1C9EEE43C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC7F020);
  MEMORY[0x1F4188790](v5 - 8);
  uint64_t v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC7FCF0);
  MEMORY[0x1F4188790](v8 - 8);
  uint64_t v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = *MEMORY[0x1E4FA22F8];
  uint64_t v12 = sub_1C9F07A48();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v12 - 8) + 104))(v10, v11, v12);
  __swift_storeEnumTagSinglePayload((uint64_t)v10, 0, 1, v12);
  sub_1C9F06B68();
  swift_bridgeObjectRetain();
  sub_1C9F06B28();
  uint64_t v13 = sub_1C9F069B8();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v13 - 8) + 16))(v7, a4, v13);
  __swift_storeEnumTagSinglePayload((uint64_t)v7, 0, 1, v13);
  sub_1C9F06B88();
  swift_bridgeObjectRetain();
  sub_1C9F06B78();
  if (qword_1EBC7F8A8 != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  sub_1C9F06B58();
  return sub_1C9F06B38();
}

void sub_1C9EEE668()
{
  OUTLINED_FUNCTION_14_1();
  uint64_t v10 = OUTLINED_FUNCTION_56(v2, v3, v4, v5, v6, v7, v8, v9);
  char v11 = OUTLINED_FUNCTION_216(v10, (uint64_t)&v49);
  OUTLINED_FUNCTION_0();
  uint64_t v13 = v12;
  uint64_t v15 = *(void *)(v14 + 64);
  uint64_t v17 = MEMORY[0x1F4188790](v16);
  OUTLINED_FUNCTION_35_0(v17, v18, v19, v20, v21, v22, v23, v24, v43);
  MEMORY[0x1F4188790](v25);
  OUTLINED_FUNCTION_42_0();
  uint64_t v27 = MEMORY[0x1F4188790](v26);
  OUTLINED_FUNCTION_113(v27, v28, v29, v30, v31, v32, v33, v34, v44);
  MEMORY[0x1F4188790](v35);
  uint64_t v36 = (void (*)(void))OUTLINED_FUNCTION_83();
  OUTLINED_FUNCTION_75();
  OUTLINED_FUNCTION_44_0();
  OUTLINED_FUNCTION_41_0();
  OUTLINED_FUNCTION_165();
  OUTLINED_FUNCTION_6_3();
  sub_1C9F07CF8();
  uint64_t v46 = *(NSObject **)(v1 + OBJC_IVAR___SRDRequestDispatcherInternal_rdmbQueue);
  uint64_t v37 = OUTLINED_FUNCTION_87();
  ((void (*)(uint64_t))v36)(v37);
  OUTLINED_FUNCTION_93();
  v36();
  OUTLINED_FUNCTION_8_4();
  uint64_t v38 = swift_allocObject();
  uint64_t v39 = OUTLINED_FUNCTION_32_1(v38);
  ((void (*)(uint64_t))v0)(v39);
  OUTLINED_FUNCTION_48_0();
  v0();
  *(void *)(v38 + v15) = 0xD000000000000055;
  OUTLINED_FUNCTION_92(v38 + v15);
  *uint64_t v40 = sub_1C9EF9EEC;
  v40[1] = (uint64_t (*)())&v47;
  uint64_t v41 = OUTLINED_FUNCTION_7_1();
  *(void *)(v41 + 16) = sub_1C9EF9C40;
  *(void *)(v41 + 24) = v38;
  v48[4] = sub_1C9EFBBDC;
  uint64_t v48[5] = v41;
  v48[0] = MEMORY[0x1E4F143A8];
  OUTLINED_FUNCTION_33_0(COERCE_DOUBLE(1107296256));
  v48[2] = sub_1C9EDF214;
  v48[3] = &block_descriptor_190;
  _Block_copy(v48);
  OUTLINED_FUNCTION_53();
  swift_release();
  dispatch_sync(v46, v45);
  _Block_release(v45);
  char v42 = *(void (**)(void))(v13 + 8);
  OUTLINED_FUNCTION_13_2();
  v42();
  OUTLINED_FUNCTION_13_2();
  v42();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_40_0();
  swift_release();
  if (v11) {
    __break(1u);
  }
  else {
    OUTLINED_FUNCTION_11_1();
  }
}

uint64_t sub_1C9EEE90C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  uint64_t v27 = a5;
  uint64_t v28 = a8;
  uint64_t v25 = a9;
  uint64_t v26 = a4;
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC7FD70);
  MEMORY[0x1F4188790](v13 - 8);
  uint64_t v15 = (char *)&v25 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_1C9F07A68();
  uint64_t v17 = *(void *)(v16 - 8);
  MEMORY[0x1F4188790](v16);
  uint64_t v19 = (char *)&v25 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C9EE4448();
  char v20 = *(unsigned char *)(a1 + OBJC_IVAR___SRDRequestDispatcherInternal_isMUXEnabled);
  uint64_t v21 = sub_1C9F07C98();
  __swift_storeEnumTagSinglePayload((uint64_t)v15, 1, 1, v21);
  LOBYTE(v23) = v20;
  sub_1C9EEFE64(a2, a3, v26, v27, (uint64_t)v19, v28, v25, a10, v23, (uint64_t)v15, 0, v24, v25, v26, v27, v28, v29, v30, v31,
    v32,
    v33,
    v34,
    v35);
  sub_1C9EFB940((uint64_t)v15, &qword_1EBC7FD70);
  return (*(uint64_t (**)(char *, uint64_t))(v17 + 8))(v19, v16);
}

uint64_t sub_1C9EEEAD8()
{
  OUTLINED_FUNCTION_267();
  uint64_t v21 = v0;
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  uint64_t v20 = sub_1C9F07FE8();
  uint64_t v6 = v5;
  uint64_t v7 = sub_1C9F07FE8();
  uint64_t v9 = v8;
  uint64_t v10 = sub_1C9F07FE8();
  uint64_t v12 = v11;
  uint64_t v13 = sub_1C9F07FE8();
  uint64_t v15 = v14;
  id v16 = v2;
  id v17 = v4;
  v21(v20, v6, v7, v9, v10, v12, v13, v15);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_164();
  return swift_bridgeObjectRelease();
}

void sub_1C9EEEBCC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void *a21,void *a22,uint64_t a23,uint64_t a24)
{
  __swift_project_boxed_opaque_existential_1((void *)(v24 + OBJC_IVAR___SRDRequestDispatcherInternal_featureChecker), *(void *)(v24 + OBJC_IVAR___SRDRequestDispatcherInternal_featureChecker + 24));
  if (sub_1C9F07D58())
  {
    OUTLINED_FUNCTION_309();
    sub_1C9EEF0C0();
  }
  else
  {
    uint64_t v26 = OUTLINED_FUNCTION_309();
    sub_1C9EEECDC(v26, v27, v28, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
      a20,
      a21,
      a22,
      a23,
      a24);
  }
}

void sub_1C9EEECDC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void *a21,void *a22,uint64_t a23,uint64_t a24)
{
  OUTLINED_FUNCTION_14_1();
  uint64_t v78 = v26;
  uint64_t v79 = v27;
  unint64_t v29 = v28;
  uint64_t v31 = v30;
  uint64_t v33 = v32;
  uint64_t v81 = v34;
  uint64_t v76 = a23;
  uint64_t v77 = a24;
  id v82 = a22;
  uint64_t v83 = v24;
  sub_1C9F07E98();
  OUTLINED_FUNCTION_0();
  uint64_t v72 = v35;
  uint64_t v73 = v36;
  MEMORY[0x1F4188790](v35);
  char v70 = (char *)v69 - ((v37 + 15) & 0xFFFFFFFFFFFFFFF0);
  OUTLINED_FUNCTION_95();
  OUTLINED_FUNCTION_0();
  uint64_t v74 = v39;
  uint64_t v75 = v38;
  MEMORY[0x1F4188790](v38);
  OUTLINED_FUNCTION_68();
  uint64_t v40 = sub_1C9F069B8();
  OUTLINED_FUNCTION_0();
  uint64_t v71 = v41;
  uint64_t v43 = *(void *)(v42 + 64);
  MEMORY[0x1F4188790](v44);
  id v45 = objc_allocWithZone((Class)sub_1C9F07B28());
  id v46 = a21;
  uint64_t v47 = (void *)sub_1C9F07B18();
  unint64_t v80 = v29;
  id v82 = v47;
  uint64_t v48 = v83;
  sub_1C9EDB16C();
  if ((v49 & 1) != 0
    && (v69[0] = (char *)v69 - ((v43 + 15) & 0xFFFFFFFFFFFFFFF0),
        v69[1] = v25,
        OUTLINED_FUNCTION_317(),
        sub_1C9EDB900())
    && ((uint64_t v50 = OUTLINED_FUNCTION_317(),
         sub_1C9EDBBC0(v50, v51, v52, v53, v80),
         uint64_t v54 = *(void *)(v48 + OBJC_IVAR___SRDRequestDispatcherInternal_assetLogger),
         (*(unsigned char *)(v54 + 32) & 1) != 0)
     || (OUTLINED_FUNCTION_110(), v55)))
  {
    uint64_t v83 = *(void *)(v54 + 16);
    uint64_t v56 = v71;
    uint64_t v57 = v69[0];
    OUTLINED_FUNCTION_195();
    uint64_t v58 = v40;
    OUTLINED_FUNCTION_8_1();
    v59();
    unint64_t v60 = v80;
    OUTLINED_FUNCTION_112();
    uint64_t v61 = swift_allocObject();
    uint64_t v62 = OUTLINED_FUNCTION_285(v61);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v56 + 32))(v62, v57, v58);
    uint64_t v63 = &v33[v48];
    *(void *)uint64_t v63 = v31;
    *((void *)v63 + 1) = v60;
    v85[4] = sub_1C9EFAE00;
    v85[5] = v33;
    v85[0] = MEMORY[0x1E4F143A8];
    OUTLINED_FUNCTION_153(COERCE_DOUBLE(1107296256));
    v85[2] = sub_1C9EDF1A8;
    v85[3] = &block_descriptor_366;
    _Block_copy(v85);
    OUTLINED_FUNCTION_350();
    swift_bridgeObjectRetain();
    sub_1C9F07EB8();
    uint64_t v84 = MEMORY[0x1E4FBC860];
    sub_1C9EFBB30((unint64_t *)&unk_1EBC7F7E0, MEMORY[0x1E4FBCB00]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC7F7F8);
    sub_1C9EFB3B4((unint64_t *)&qword_1EBC7F800, &qword_1EBC7F7F8);
    uint64_t v64 = v70;
    OUTLINED_FUNCTION_314();
    uint64_t v65 = v72;
    OUTLINED_FUNCTION_148();
    OUTLINED_FUNCTION_243();
    _Block_release(v33);
    (*(void (**)(char *, uint64_t))(v73 + 8))(v64, v65);
    OUTLINED_FUNCTION_203();
    OUTLINED_FUNCTION_1_0();
    v66();

    swift_release();
    OUTLINED_FUNCTION_11_1();
  }
  else
  {
    OUTLINED_FUNCTION_11_1();
  }
}

void sub_1C9EEF0C0()
{
  OUTLINED_FUNCTION_14_1();
  v58[4] = OUTLINED_FUNCTION_116(v4, v5, v6, v7, v8, v9, v10, v11);
  OUTLINED_FUNCTION_0();
  v58[9] = v12;
  MEMORY[0x1F4188790](v13);
  v58[7] = (uint64_t)v58 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v58[8] = OUTLINED_FUNCTION_95();
  OUTLINED_FUNCTION_0();
  v58[6] = v15;
  MEMORY[0x1F4188790](v16);
  v58[5] = (uint64_t)v58 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  OUTLINED_FUNCTION_141();
  OUTLINED_FUNCTION_0();
  v58[15] = v18;
  MEMORY[0x1F4188790](v19);
  OUTLINED_FUNCTION_160();
  OUTLINED_FUNCTION_0();
  uint64_t v21 = v20;
  MEMORY[0x1F4188790](v22);
  id v23 = objc_allocWithZone((Class)OUTLINED_FUNCTION_219());
  id v24 = (id)v58[16];
  sub_1C9F07B18();
  OUTLINED_FUNCTION_127();
  v25();
  OUTLINED_FUNCTION_94();
  char v27 = v26;
  unint64_t v28 = (void *)(v21 + 8);
  OUTLINED_FUNCTION_149();
  v29();
  if ((v27 & 1) == 0) {
    goto LABEL_13;
  }
  sub_1C9F069A8();
  uint64_t v30 = sub_1C9F06988();
  uint64_t v31 = OUTLINED_FUNCTION_152(v30);
  v32(v31);
  if (qword_1EBC7F680 != -1) {
    swift_once();
  }
  v58[2] = v1;
  uint64_t v33 = sub_1C9F07E78();
  OUTLINED_FUNCTION_46_0(v33, (uint64_t)qword_1EBC7FEF0);
  swift_bridgeObjectRetain_n();
  uint64_t v34 = (char *)sub_1C9F07E68();
  os_log_type_t v35 = sub_1C9F08158();
  if (OUTLINED_FUNCTION_262(v35))
  {
    unint64_t v28 = (void *)OUTLINED_FUNCTION_29();
    v59[0] = OUTLINED_FUNCTION_28();
    OUTLINED_FUNCTION_236(4.8151e-34);
    uint64_t v36 = OUTLINED_FUNCTION_217();
    OUTLINED_FUNCTION_192(v36);
    OUTLINED_FUNCTION_88();
    OUTLINED_FUNCTION_334();
    uint64_t v37 = sub_1C9F01420(v2, v3, v59);
    OUTLINED_FUNCTION_126(v37);
    OUTLINED_FUNCTION_257();
    OUTLINED_FUNCTION_310(&dword_1C9EC7000, v38, v39, "MUX: Generating synthesized trpId : %s for text request: %s");
    OUTLINED_FUNCTION_169();
    OUTLINED_FUNCTION_1();
    OUTLINED_FUNCTION_1();
  }
  else
  {

    OUTLINED_FUNCTION_209();
    OUTLINED_FUNCTION_100();
  }
  uint64_t v40 = OUTLINED_FUNCTION_114();
  if (!sub_1C9EDC0BC(v40, v41, v42, v43, v44, v45, v46, v47, v58[0], v58[1]))
  {
    swift_bridgeObjectRelease();
LABEL_13:

    goto LABEL_14;
  }
  OUTLINED_FUNCTION_184();
  swift_bridgeObjectRelease();
  uint64_t v48 = *(void *)&v34[OBJC_IVAR___SRDRequestDispatcherInternal_assetLogger];
  if ((*(unsigned char *)(v48 + 32) & 1) == 0)
  {
    OUTLINED_FUNCTION_110();
    if (!v49) {
      goto LABEL_13;
    }
  }
  v58[19] = *(void *)(v48 + 16);
  OUTLINED_FUNCTION_8_1();
  v50();
  OUTLINED_FUNCTION_123();
  uint64_t v51 = swift_allocObject();
  uint64_t v52 = OUTLINED_FUNCTION_135(v51);
  v53(v52);
  uint64_t v54 = (uint64_t *)&v0[v2];
  *uint64_t v54 = v2;
  v54[1] = v3;
  v59[4] = (uint64_t)sub_1C9EFAE00;
  v59[5] = (uint64_t)v0;
  v59[0] = MEMORY[0x1E4F143A8];
  OUTLINED_FUNCTION_153(COERCE_DOUBLE(1107296256));
  v59[2] = (uint64_t)sub_1C9EDF1A8;
  v59[3] = (uint64_t)&block_descriptor_359;
  char v55 = _Block_copy(v59);
  swift_bridgeObjectRetain();
  swift_retain();
  sub_1C9F07EB8();
  v58[20] = MEMORY[0x1E4FBC860];
  sub_1C9EFBB30((unint64_t *)&unk_1EBC7F7E0, MEMORY[0x1E4FBCB00]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC7F7F8);
  sub_1C9EFB3B4((unint64_t *)&qword_1EBC7F800, &qword_1EBC7F7F8);
  OUTLINED_FUNCTION_128();
  OUTLINED_FUNCTION_243();
  _Block_release(v55);
  OUTLINED_FUNCTION_1_0();
  v56();
  OUTLINED_FUNCTION_1_0();
  v57();

  swift_release();
LABEL_14:
  OUTLINED_FUNCTION_11_1();
}

void sub_1C9EEF570(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void *a21)
{
  OUTLINED_FUNCTION_267();
  uint64_t v38 = v22;
  uint64_t v39 = v23;
  uint64_t v36 = v24;
  uint64_t v37 = v25;
  __swift_project_boxed_opaque_existential_1((void *)(v21 + OBJC_IVAR___SRDRequestDispatcherInternal_featureChecker), *(void *)(v21 + OBJC_IVAR___SRDRequestDispatcherInternal_featureChecker + 24));
  if (sub_1C9F07D58())
  {
    OUTLINED_FUNCTION_190();
    OUTLINED_FUNCTION_164();
    sub_1C9EEF9B4();
  }
  else
  {
    OUTLINED_FUNCTION_190();
    OUTLINED_FUNCTION_164();
    sub_1C9EEF624(v27, v28, v29, v30, v31, v32, v33, v34, v36, v37, v38, v39, a13, a14, a15, a16, a17, a18, a19,
      a20,
      a21);
  }
}

void sub_1C9EEF624(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void *a21)
{
  OUTLINED_FUNCTION_14_1();
  uint64_t v22 = v21;
  uint64_t v74 = v23;
  uint64_t v75 = v24;
  unint64_t v26 = v25;
  uint64_t v28 = v27;
  uint64_t v30 = v29;
  uint64_t v73 = v31;
  uint64_t v33 = v32;
  uint64_t v35 = v34;
  sub_1C9F07E98();
  OUTLINED_FUNCTION_0();
  uint64_t v71 = v37;
  uint64_t v72 = v36;
  MEMORY[0x1F4188790](v36);
  os_log_type_t v69 = (char *)&v64 - ((v38 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v70 = OUTLINED_FUNCTION_95();
  OUTLINED_FUNCTION_0();
  uint64_t v68 = v39;
  MEMORY[0x1F4188790](v40);
  OUTLINED_FUNCTION_2_0();
  uint64_t v67 = v41;
  OUTLINED_FUNCTION_141();
  OUTLINED_FUNCTION_0();
  uint64_t v65 = v43;
  uint64_t v66 = v42;
  uint64_t v45 = *(void *)(v44 + 64);
  MEMORY[0x1F4188790](v42);
  uint64_t v64 = (char *)&v64 - ((v45 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v46 = objc_allocWithZone((Class)sub_1C9F07B28());
  id v47 = a21;
  uint64_t v48 = (void *)sub_1C9F07B18();
  OUTLINED_FUNCTION_276();
  sub_1C9EDB16C();
  char v50 = v49;

  if (v50)
  {
    unint64_t v51 = v26;
    OUTLINED_FUNCTION_276();
    if (sub_1C9EDC05C())
    {
      sub_1C9EDC8B4(v35, (uint64_t)v33, v30, v28, v26);
      if ((*(unsigned char *)(*(void *)(v22 + OBJC_IVAR___SRDRequestDispatcherInternal_assetLogger) + 32) & 1) != 0
        || (OUTLINED_FUNCTION_110(), v52))
      {
        uint64_t v54 = v64;
        uint64_t v53 = v65;
        uint64_t v55 = v66;
        OUTLINED_FUNCTION_8_1();
        v56();
        OUTLINED_FUNCTION_112();
        uint64_t v57 = swift_allocObject();
        uint64_t v58 = OUTLINED_FUNCTION_285(v57);
        (*(void (**)(uint64_t, char *, uint64_t))(v53 + 32))(v58, v54, v55);
        unint64_t v59 = (uint64_t *)&v33[v45];
        uint64_t *v59 = v28;
        v59[1] = v51;
        v77[4] = sub_1C9EFAE00;
        v77[5] = v33;
        v77[0] = MEMORY[0x1E4F143A8];
        OUTLINED_FUNCTION_153(COERCE_DOUBLE(1107296256));
        v77[2] = sub_1C9EDF1A8;
        v77[3] = &block_descriptor_352;
        _Block_copy(v77);
        OUTLINED_FUNCTION_350();
        swift_bridgeObjectRetain();
        uint64_t v60 = v67;
        sub_1C9F07EB8();
        uint64_t v76 = MEMORY[0x1E4FBC860];
        sub_1C9EFBB30((unint64_t *)&unk_1EBC7F7E0, MEMORY[0x1E4FBCB00]);
        __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC7F7F8);
        sub_1C9EFB3B4((unint64_t *)&qword_1EBC7F800, &qword_1EBC7F7F8);
        uint64_t v61 = v69;
        OUTLINED_FUNCTION_314();
        OUTLINED_FUNCTION_148();
        MEMORY[0x1CB794A40](0, v60, v61, v33);
        _Block_release(v33);
        OUTLINED_FUNCTION_1_0();
        v62();
        OUTLINED_FUNCTION_1_0();
        v63();
        swift_release();
      }
    }
  }
  OUTLINED_FUNCTION_11_1();
}

void sub_1C9EEF9B4()
{
  OUTLINED_FUNCTION_14_1();
  v58[4] = OUTLINED_FUNCTION_116(v4, v5, v6, v7, v8, v9, v10, v11);
  OUTLINED_FUNCTION_0();
  v58[9] = v12;
  MEMORY[0x1F4188790](v13);
  v58[7] = (uint64_t)v58 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v58[8] = OUTLINED_FUNCTION_95();
  OUTLINED_FUNCTION_0();
  v58[6] = v15;
  MEMORY[0x1F4188790](v16);
  v58[5] = (uint64_t)v58 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  OUTLINED_FUNCTION_141();
  OUTLINED_FUNCTION_0();
  v58[15] = v18;
  MEMORY[0x1F4188790](v19);
  OUTLINED_FUNCTION_160();
  OUTLINED_FUNCTION_0();
  uint64_t v21 = v20;
  MEMORY[0x1F4188790](v22);
  id v23 = objc_allocWithZone((Class)OUTLINED_FUNCTION_219());
  id v24 = (id)v58[16];
  sub_1C9F07B18();
  OUTLINED_FUNCTION_127();
  v25();
  OUTLINED_FUNCTION_94();
  char v27 = v26;
  uint64_t v28 = (void *)(v21 + 8);
  OUTLINED_FUNCTION_149();
  v29();
  if ((v27 & 1) == 0) {
    goto LABEL_13;
  }
  sub_1C9F069A8();
  uint64_t v30 = sub_1C9F06988();
  uint64_t v31 = OUTLINED_FUNCTION_152(v30);
  v32(v31);
  if (qword_1EBC7F680 != -1) {
    swift_once();
  }
  v58[2] = v1;
  uint64_t v33 = sub_1C9F07E78();
  OUTLINED_FUNCTION_46_0(v33, (uint64_t)qword_1EBC7FEF0);
  swift_bridgeObjectRetain_n();
  uint64_t v34 = (char *)sub_1C9F07E68();
  os_log_type_t v35 = sub_1C9F08158();
  if (OUTLINED_FUNCTION_262(v35))
  {
    uint64_t v28 = (void *)OUTLINED_FUNCTION_29();
    v59[0] = OUTLINED_FUNCTION_28();
    OUTLINED_FUNCTION_236(4.8151e-34);
    uint64_t v36 = OUTLINED_FUNCTION_217();
    OUTLINED_FUNCTION_192(v36);
    OUTLINED_FUNCTION_88();
    OUTLINED_FUNCTION_334();
    uint64_t v37 = sub_1C9F01420(v2, v3, v59);
    OUTLINED_FUNCTION_126(v37);
    OUTLINED_FUNCTION_257();
    OUTLINED_FUNCTION_310(&dword_1C9EC7000, v38, v39, "minting synthesized trpId : %s for text request: %s");
    OUTLINED_FUNCTION_169();
    OUTLINED_FUNCTION_1();
    OUTLINED_FUNCTION_1();
  }
  else
  {

    OUTLINED_FUNCTION_209();
    OUTLINED_FUNCTION_100();
  }
  uint64_t v40 = OUTLINED_FUNCTION_114();
  if (!sub_1C9EDC3E4(v40, v41, v42, v43, v44, v45, v46, v47, v58[0], v58[1]))
  {
    swift_bridgeObjectRelease();
LABEL_13:

    goto LABEL_14;
  }
  OUTLINED_FUNCTION_184();
  swift_bridgeObjectRelease();
  uint64_t v48 = *(void *)&v34[OBJC_IVAR___SRDRequestDispatcherInternal_assetLogger];
  if ((*(unsigned char *)(v48 + 32) & 1) == 0)
  {
    OUTLINED_FUNCTION_110();
    if (!v49) {
      goto LABEL_13;
    }
  }
  v58[19] = *(void *)(v48 + 16);
  OUTLINED_FUNCTION_8_1();
  v50();
  OUTLINED_FUNCTION_123();
  uint64_t v51 = swift_allocObject();
  uint64_t v52 = OUTLINED_FUNCTION_135(v51);
  v53(v52);
  uint64_t v54 = (uint64_t *)&v0[v2];
  *uint64_t v54 = v2;
  v54[1] = v3;
  v59[4] = (uint64_t)sub_1C9EFAE00;
  v59[5] = (uint64_t)v0;
  v59[0] = MEMORY[0x1E4F143A8];
  OUTLINED_FUNCTION_153(COERCE_DOUBLE(1107296256));
  v59[2] = (uint64_t)sub_1C9EDF1A8;
  v59[3] = (uint64_t)&block_descriptor_345;
  uint64_t v55 = _Block_copy(v59);
  swift_bridgeObjectRetain();
  swift_retain();
  sub_1C9F07EB8();
  v58[20] = MEMORY[0x1E4FBC860];
  sub_1C9EFBB30((unint64_t *)&unk_1EBC7F7E0, MEMORY[0x1E4FBCB00]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC7F7F8);
  sub_1C9EFB3B4((unint64_t *)&qword_1EBC7F800, &qword_1EBC7F7F8);
  OUTLINED_FUNCTION_128();
  OUTLINED_FUNCTION_243();
  _Block_release(v55);
  OUTLINED_FUNCTION_1_0();
  v56();
  OUTLINED_FUNCTION_1_0();
  v57();

  swift_release();
LABEL_14:
  OUTLINED_FUNCTION_11_1();
}

void sub_1C9EEFE64(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23)
{
  OUTLINED_FUNCTION_14_1();
  uint64_t v27 = v23;
  uint64_t v82 = v29;
  uint64_t v83 = v28;
  uint64_t v84 = v30;
  uint64_t v81 = v31;
  unint64_t v33 = v32;
  uint64_t v88 = v34;
  unint64_t v36 = v35;
  uint64_t v38 = v37;
  uint64_t v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC7FD70);
  uint64_t v40 = OUTLINED_FUNCTION_10_3(v39);
  MEMORY[0x1F4188790](v40);
  OUTLINED_FUNCTION_220();
  sub_1C9F07C98();
  OUTLINED_FUNCTION_0();
  uint64_t v85 = v42;
  uint64_t v86 = v41;
  MEMORY[0x1F4188790](v41);
  uint64_t v80 = (uint64_t)&v75 - ((v43 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v87 = OUTLINED_FUNCTION_141();
  OUTLINED_FUNCTION_0();
  uint64_t v45 = v44;
  MEMORY[0x1F4188790](v46);
  OUTLINED_FUNCTION_97();
  if (qword_1EBC7F680 != -1) {
    swift_once();
  }
  uint64_t v47 = sub_1C9F07E78();
  uint64_t v79 = __swift_project_value_buffer(v47, (uint64_t)qword_1EBC7FEF0);
  uint64_t v48 = sub_1C9F07E68();
  os_log_type_t v49 = sub_1C9F08158();
  if (OUTLINED_FUNCTION_106(v49))
  {
    uint64_t v76 = v25;
    uint64_t v50 = OUTLINED_FUNCTION_7();
    unint64_t v78 = v33;
    uint64_t v51 = (uint8_t *)v50;
    uint64_t v52 = OUTLINED_FUNCTION_11_3();
    uint64_t v77 = v45;
    v91[0] = v52;
    *(_DWORD *)uint64_t v51 = 136315138;
    uint64_t v90 = sub_1C9F01420(0xD00000000000008ELL, 0x80000001C9F0AC50, v91);
    uint64_t v25 = v76;
    sub_1C9F08228();
    _os_log_impl(&dword_1C9EC7000, v48, v24, "%s", v51, 0xCu);
    OUTLINED_FUNCTION_7_3();
    uint64_t v45 = v77;
    OUTLINED_FUNCTION_1();
    unint64_t v33 = v78;
    OUTLINED_FUNCTION_1();
  }

  sub_1C9EF76CC();
  uint64_t v53 = v86;
  if (v54)
  {
    sub_1C9EF7A80();
    OUTLINED_FUNCTION_8_1();
    v55();
    uint64_t v56 = v27 + OBJC_IVAR___SRDRequestDispatcherInternal_sessionUserId;
    OUTLINED_FUNCTION_15_0();
    sub_1C9EFADA4(v56, v25, &qword_1EBC7FD70);
    if (__swift_getEnumTagSinglePayload(v25, 1, v53) == 1)
    {
      sub_1C9EFB940(v25, &qword_1EBC7FD70);
      swift_bridgeObjectRetain_n();
      OUTLINED_FUNCTION_318();
      uint64_t v57 = sub_1C9F07E68();
      os_log_type_t v58 = sub_1C9F08168();
      if (os_log_type_enabled(v57, v58))
      {
        uint64_t v59 = OUTLINED_FUNCTION_29();
        uint64_t v86 = OUTLINED_FUNCTION_28();
        uint64_t v90 = v86;
        *(_DWORD *)uint64_t v59 = 136315394;
        swift_bridgeObjectRetain();
        uint64_t v89 = sub_1C9F01420(v38, v36, &v90);
        sub_1C9F08228();
        OUTLINED_FUNCTION_221();
        *(_WORD *)(v59 + 12) = 2080;
        swift_bridgeObjectRetain();
        uint64_t v89 = sub_1C9F01420(v88, v33, &v90);
        sub_1C9F08228();
        OUTLINED_FUNCTION_257();
        _os_log_impl(&dword_1C9EC7000, v57, v58, "sessionUserId is not set for assistantId: %s during request: %s", (uint8_t *)v59, 0x16u);
        OUTLINED_FUNCTION_293();
        OUTLINED_FUNCTION_1();
        OUTLINED_FUNCTION_1();
      }
      else
      {
        OUTLINED_FUNCTION_222();
        OUTLINED_FUNCTION_209();
      }
      swift_release();
    }
    else
    {
      OUTLINED_FUNCTION_103();
      v60();
      uint64_t v61 = OUTLINED_FUNCTION_102();
      if (a21) {
        sub_1C9EEEBCC(v61, v62, v63, v64, v65, v66, v67, v68, v71, v72, a22, a23, v75, v76, v77, v78, v79, v80, v81,
      }
          v82,
          v83,
          v84,
          (uint64_t)v85,
          v86);
      else {
        sub_1C9EEF570(v61, v62, v63, v64, v65, v66, v67, v68, v73, v74, v75, v76, v77, v78, v79, v80, v81, v82, (uint64_t)v83,
      }
          (uint64_t)v84,
          v85);
      swift_release();
      uint64_t v69 = OUTLINED_FUNCTION_203();
      v70(v69, v53);
    }
    (*(void (**)(uint64_t, uint64_t))(v45 + 8))(v26, v87);
  }
  OUTLINED_FUNCTION_11_1();
}

void sub_1C9EF0320(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21)
{
  OUTLINED_FUNCTION_14_1();
  a19 = v25;
  a20 = v26;
  uint64_t v84 = v27;
  OUTLINED_FUNCTION_161(v28, v29, v30, v31, v32, v33, v34);
  uint64_t v36 = v35;
  OUTLINED_FUNCTION_260(a21);
  uint64_t ObjectType = swift_getObjectType();
  OUTLINED_FUNCTION_216(ObjectType, (uint64_t)&v97);
  OUTLINED_FUNCTION_0();
  uint64_t v39 = v38;
  uint64_t v41 = *(void *)(v40 + 64);
  uint64_t v43 = MEMORY[0x1F4188790](v42);
  OUTLINED_FUNCTION_35_0(v43, v44, v45, v46, v47, v48, v49, v50, v77);
  MEMORY[0x1F4188790](v51);
  OUTLINED_FUNCTION_187();
  uint64_t v53 = MEMORY[0x1F4188790](v52);
  OUTLINED_FUNCTION_113(v53, v54, v55, v56, v57, v58, v59, v60, v78);
  MEMORY[0x1F4188790](v61);
  uint64_t v62 = (void (*)(uint64_t))OUTLINED_FUNCTION_83();
  OUTLINED_FUNCTION_75();
  uint64_t v86 = v21;
  uint64_t v87 = v36;
  OUTLINED_FUNCTION_299();
  uint64_t v88 = v64;
  uint64_t v89 = v63;
  uint64_t v90 = v79;
  uint64_t v91 = v80;
  uint64_t v92 = v81;
  uint64_t v93 = v82;
  OUTLINED_FUNCTION_291((uint64_t)&a17);
  OUTLINED_FUNCTION_323();
  uint64_t v94 = v66;
  uint64_t v95 = v65;
  OUTLINED_FUNCTION_41_0();
  OUTLINED_FUNCTION_165();
  unint64_t v83 = v67 | 0x8000000000000000;
  OUTLINED_FUNCTION_6_3();
  sub_1C9F07CF8();
  uint64_t v68 = OUTLINED_FUNCTION_66(*(void *)(v21 + OBJC_IVAR___SRDRequestDispatcherInternal_rdmbQueue));
  v62(v68);
  uint64_t v69 = OUTLINED_FUNCTION_109((uint64_t)&a15);
  v62(v69);
  OUTLINED_FUNCTION_8_4();
  uint64_t v70 = swift_allocObject();
  uint64_t v71 = OUTLINED_FUNCTION_32_1(v70);
  ((void (*)(uint64_t))v23)(v71);
  OUTLINED_FUNCTION_48_0();
  v23();
  uint64_t v72 = (void *)(v70 + v41);
  void *v72 = 0xD00000000000007BLL;
  v72[1] = v83;
  uint64_t v73 = (uint64_t (**)())(v70 + v22);
  *uint64_t v73 = sub_1C9EF9F44;
  v73[1] = (uint64_t (*)())&v85;
  uint64_t v74 = OUTLINED_FUNCTION_7_1();
  *(void *)(v74 + 16) = sub_1C9EF9C40;
  *(void *)(v74 + 24) = v70;
  v96[4] = sub_1C9EFBBDC;
  v96[5] = v74;
  v96[0] = MEMORY[0x1E4F143A8];
  OUTLINED_FUNCTION_33_0(COERCE_DOUBLE(1107296256));
  v96[2] = sub_1C9EDF214;
  v96[3] = &block_descriptor_201;
  _Block_copy(v96);
  OUTLINED_FUNCTION_229();
  swift_release();
  dispatch_sync(v84, v24);
  _Block_release(v24);
  uint64_t v75 = *(void (**)(void))(v39 + 8);
  OUTLINED_FUNCTION_13_2();
  v75();
  OUTLINED_FUNCTION_13_2();
  v75();
  char v76 = OUTLINED_FUNCTION_5_3();
  swift_release();
  swift_release();
  if (v76) {
    __break(1u);
  }
  else {
    OUTLINED_FUNCTION_11_1();
  }
}

uint64_t sub_1C9EF064C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  uint64_t v22 = a5;
  uint64_t v23 = a8;
  uint64_t v20 = a9;
  uint64_t v21 = a4;
  uint64_t v14 = sub_1C9F07A68();
  uint64_t v15 = *(void *)(v14 - 8);
  MEMORY[0x1F4188790](v14);
  uint64_t v17 = (char *)&v20 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C9EE4448();
  LOBYTE(v19) = *(unsigned char *)(a1 + OBJC_IVAR___SRDRequestDispatcherInternal_isMUXEnabled);
  sub_1C9EF08E0(a2, a3, v21, v22, (uint64_t)v17, v23, v20, a10, a11, v19, v20, v21, v22, v23, v24, v25, v26, v27, v28,
    v29,
    v30,
    v31);
  return (*(uint64_t (**)(char *, uint64_t))(v15 + 8))(v17, v14);
}

void sub_1C9EF08E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void *a21,char a22)
{
  OUTLINED_FUNCTION_14_1();
  a19 = v26;
  a20 = v27;
  uint64_t v98 = v22;
  unint64_t v29 = v28;
  uint64_t v101 = v30;
  unint64_t v32 = v31;
  uint64_t v99 = v33;
  sub_1C9F07E98();
  OUTLINED_FUNCTION_0();
  MEMORY[0x1F4188790](v34);
  OUTLINED_FUNCTION_84(v35, v93);
  sub_1C9F07ED8();
  OUTLINED_FUNCTION_0();
  MEMORY[0x1F4188790](v36);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_115(v37);
  uint64_t v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC7FD70);
  uint64_t v39 = OUTLINED_FUNCTION_10_3(v38);
  MEMORY[0x1F4188790](v39);
  OUTLINED_FUNCTION_272();
  uint64_t v97 = sub_1C9F07C98();
  OUTLINED_FUNCTION_0();
  MEMORY[0x1F4188790](v40);
  OUTLINED_FUNCTION_218();
  uint64_t v41 = sub_1C9F069B8();
  OUTLINED_FUNCTION_0();
  uint64_t v100 = v42;
  MEMORY[0x1F4188790](v43);
  OUTLINED_FUNCTION_125();
  OUTLINED_FUNCTION_115(v44);
  OUTLINED_FUNCTION_270((uint64_t)&a9);
  MEMORY[0x1F4188790](v45);
  OUTLINED_FUNCTION_82();
  if (qword_1EBC7F680 != -1) {
    swift_once();
  }
  uint64_t v46 = sub_1C9F07E78();
  __swift_project_value_buffer(v46, (uint64_t)qword_1EBC7FEF0);
  uint64_t v47 = sub_1C9F07E68();
  os_log_type_t v48 = sub_1C9F08158();
  uint64_t v96 = v25;
  if (os_log_type_enabled(v47, v48))
  {
    uint64_t v49 = (uint8_t *)OUTLINED_FUNCTION_7();
    v102[0] = OUTLINED_FUNCTION_11_3();
    *(_DWORD *)uint64_t v49 = 136315138;
    uint64_t v50 = sub_1C9F01420(0xD000000000000087, 0x80000001C9F0ABC0, v102);
    OUTLINED_FUNCTION_129(v50);
    sub_1C9F08228();
    _os_log_impl(&dword_1C9EC7000, v47, v48, "%s", v49, 0xCu);
    OUTLINED_FUNCTION_147();
    OUTLINED_FUNCTION_1();
    OUTLINED_FUNCTION_1();
  }

  sub_1C9EF76CC();
  if (v51)
  {
    uint64_t v52 = a21;
    OUTLINED_FUNCTION_320(*(void *)(v100 + 16));
    v53();
    id v54 = objc_allocWithZone((Class)sub_1C9F07B28());
    id v55 = v52;
    uint64_t v56 = (void *)sub_1C9F07B18();
    unint64_t v57 = v32;
    OUTLINED_FUNCTION_237();
    sub_1C9EDCCE8();
    char v59 = v58;

    if ((v59 & 1) == 0)
    {
      OUTLINED_FUNCTION_302();
      OUTLINED_FUNCTION_1_0();
      v65();
      swift_release();
      goto LABEL_24;
    }
    uint64_t v60 = v98 + OBJC_IVAR___SRDRequestDispatcherInternal_sessionUserId;
    OUTLINED_FUNCTION_15_0();
    sub_1C9EFADA4(v60, v24, &qword_1EBC7FD70);
    if (__swift_getEnumTagSinglePayload(v24, 1, v97) == 1)
    {
      sub_1C9EFB940(v24, &qword_1EBC7FD70);
      OUTLINED_FUNCTION_121();
      OUTLINED_FUNCTION_131();
      uint64_t v61 = sub_1C9F07E68();
      os_log_type_t v62 = sub_1C9F08168();
      if (OUTLINED_FUNCTION_238(v62))
      {
        uint64_t v63 = OUTLINED_FUNCTION_29();
        v102[0] = OUTLINED_FUNCTION_28();
        *(_DWORD *)uint64_t v63 = 136315394;
        swift_bridgeObjectRetain();
        uint64_t v64 = sub_1C9F01420(v99, v57, v102);
        OUTLINED_FUNCTION_292(v64);
        sub_1C9F08228();
        OUTLINED_FUNCTION_88();
        *(_WORD *)(v63 + 12) = 2080;
        swift_bridgeObjectRetain();
        uint64_t v103 = sub_1C9F01420(v101, v29, v102);
        sub_1C9F08228();
        OUTLINED_FUNCTION_120();
        _os_log_impl(&dword_1C9EC7000, v61, (os_log_type_t)v23, "sessionUserId is not set for assistantId: %s during request: %s", (uint8_t *)v63, 0x16u);
        swift_arrayDestroy();
        OUTLINED_FUNCTION_1();
        OUTLINED_FUNCTION_1();
      }
      else
      {
        OUTLINED_FUNCTION_100();
        OUTLINED_FUNCTION_130();
      }
      swift_release();

      (*(void (**)(uint64_t, uint64_t))(v100 + 8))(v23, v41);
      goto LABEL_24;
    }
    char v66 = a22;
    OUTLINED_FUNCTION_103();
    v67();
    if (v66)
    {
      OUTLINED_FUNCTION_105();
      if (!sub_1C9EDD174() || (OUTLINED_FUNCTION_237(), !sub_1C9EDDB2C(v68, v69, v70, v71, v72)))
      {
LABEL_23:
        swift_release();
        OUTLINED_FUNCTION_239();
        v89();
        uint64_t v90 = OUTLINED_FUNCTION_302();
        v92(v90, v91);
        goto LABEL_24;
      }
    }
    else
    {
      OUTLINED_FUNCTION_105();
      if (!sub_1C9EDD640()) {
        goto LABEL_23;
      }
      OUTLINED_FUNCTION_237();
      if (!sub_1C9EDC8B4(v73, v74, v75, v76, v77)) {
        goto LABEL_23;
      }
    }
    if ((*(unsigned char *)(*(void *)(v98 + OBJC_IVAR___SRDRequestDispatcherInternal_assetLogger) + 32) & 1) != 0
      || (OUTLINED_FUNCTION_110(), v78))
    {
      OUTLINED_FUNCTION_299();
      v79();
      OUTLINED_FUNCTION_344();
      OUTLINED_FUNCTION_301();
      unint64_t v81 = v29;
      unint64_t v82 = (v80 + v23 + 7) & 0xFFFFFFFFFFFFFFF8;
      uint64_t v83 = swift_allocObject();
      OUTLINED_FUNCTION_199(v83);
      OUTLINED_FUNCTION_103();
      v84();
      uint64_t v85 = (uint64_t *)(v96 + v82);
      uint64_t *v85 = v101;
      v85[1] = v81;
      v102[4] = (uint64_t)sub_1C9EFAE00;
      v102[5] = v96;
      v102[0] = MEMORY[0x1E4F143A8];
      v102[1] = 1107296256;
      v102[2] = (uint64_t)sub_1C9EDF1A8;
      v102[3] = (uint64_t)&block_descriptor_338;
      uint64_t v86 = _Block_copy(v102);
      swift_retain();
      swift_bridgeObjectRetain();
      sub_1C9F07EB8();
      uint64_t v103 = MEMORY[0x1E4FBC860];
      sub_1C9EFBB30((unint64_t *)&unk_1EBC7F7E0, MEMORY[0x1E4FBCB00]);
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC7F7F8);
      sub_1C9EFB3B4((unint64_t *)&qword_1EBC7F800, &qword_1EBC7F7F8);
      OUTLINED_FUNCTION_314();
      sub_1C9F08278();
      MEMORY[0x1CB794A40](0, v94, v95, v86);
      _Block_release(v86);
      OUTLINED_FUNCTION_250();
      OUTLINED_FUNCTION_1_0();
      v87();
      OUTLINED_FUNCTION_203();
      OUTLINED_FUNCTION_1_0();
      v88();
      swift_release();
    }
    goto LABEL_23;
  }
LABEL_24:
  OUTLINED_FUNCTION_11_1();
}

void sub_1C9EF1134(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23)
{
  OUTLINED_FUNCTION_14_1();
  a19 = v26;
  a20 = v27;
  OUTLINED_FUNCTION_202(v28, v29, v30, v31, v32, v33, v34, v35);
  v69[9] = v36;
  OUTLINED_FUNCTION_223(v37, v38, v39, (uint64_t)&v74);
  OUTLINED_FUNCTION_260(a23);
  uint64_t v40 = OUTLINED_FUNCTION_331();
  OUTLINED_FUNCTION_216(v40, (uint64_t)v73);
  OUTLINED_FUNCTION_0();
  uint64_t v42 = v41;
  uint64_t v44 = *(void *)(v43 + 64);
  MEMORY[0x1F4188790](v45);
  OUTLINED_FUNCTION_36_0((uint64_t)v69 - ((v44 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x1F4188790](v46);
  OUTLINED_FUNCTION_187();
  uint64_t v48 = MEMORY[0x1F4188790](v47);
  OUTLINED_FUNCTION_213(v48, v49, v50, v51, v52, v53, v54, v55, v69[0]);
  MEMORY[0x1F4188790](v56);
  unint64_t v57 = (void (*)(uint64_t))OUTLINED_FUNCTION_83();
  OUTLINED_FUNCTION_75();
  OUTLINED_FUNCTION_214();
  OUTLINED_FUNCTION_249();
  v71[6] = v59;
  v71[7] = v58;
  OUTLINED_FUNCTION_111();
  v71[13] = v69[8];
  v71[14] = v69[2];
  uint64_t v70 = v23;
  OUTLINED_FUNCTION_41_0();
  OUTLINED_FUNCTION_165();
  v69[11] = v60 | 0x8000000000000000;
  OUTLINED_FUNCTION_6_3();
  sub_1C9F07CF8();
  uint64_t v61 = OUTLINED_FUNCTION_66(*(void *)(v24 + OBJC_IVAR___SRDRequestDispatcherInternal_rdmbQueue));
  v57(v61);
  uint64_t v62 = OUTLINED_FUNCTION_109((uint64_t)&a13);
  v57(v62);
  OUTLINED_FUNCTION_8_4();
  uint64_t v63 = swift_allocObject();
  uint64_t v64 = OUTLINED_FUNCTION_32_1(v63);
  ((void (*)(uint64_t))v23)(v64);
  OUTLINED_FUNCTION_48_0();
  v23();
  OUTLINED_FUNCTION_208((unint64_t *)(v63 + v44));
  *uint64_t v65 = sub_1C9EF9F7C;
  v65[1] = (uint64_t (*)())v71;
  uint64_t v66 = OUTLINED_FUNCTION_7_1();
  *(void *)(v66 + 16) = sub_1C9EF9C40;
  *(void *)(v66 + 24) = v63;
  v73[2] = sub_1C9EFBBDC;
  v73[3] = v66;
  uint64_t v72 = MEMORY[0x1E4F143A8];
  OUTLINED_FUNCTION_33_0(COERCE_DOUBLE(1107296256));
  v73[0] = sub_1C9EDF214;
  v73[1] = &block_descriptor_212;
  _Block_copy(&v72);
  OUTLINED_FUNCTION_229();
  swift_release();
  dispatch_sync((dispatch_queue_t)v69[14], v25);
  _Block_release(v25);
  uint64_t v67 = *(void (**)(void))(v42 + 8);
  OUTLINED_FUNCTION_13_2();
  v67();
  OUTLINED_FUNCTION_13_2();
  v67();
  char v68 = OUTLINED_FUNCTION_5_3();
  swift_release();
  swift_release();
  if (v68) {
    __break(1u);
  }
  else {
    OUTLINED_FUNCTION_11_1();
  }
}

uint64_t sub_1C9EF1418(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  uint64_t v23 = a1;
  uint64_t v24 = a8;
  uint64_t v21 = a4;
  uint64_t v22 = a5;
  uint64_t v20 = a9;
  uint64_t v14 = sub_1C9F07A68();
  uint64_t v15 = *(void *)(v14 - 8);
  MEMORY[0x1F4188790](v14);
  uint64_t v17 = (char *)&v19 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C9EE4448();
  sub_1C9EF167C(a2, a3, v21, v22, (uint64_t)v17, v24, v20, a10, a11, a12, v19, v20, v21, v22, v23, v24, v25, v26, v27,
    v28,
    v29,
    v30);
  return (*(uint64_t (**)(char *, uint64_t))(v15 + 8))(v17, v14);
}

void sub_1C9EF167C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,void *a22)
{
  OUTLINED_FUNCTION_14_1();
  uint64_t v25 = v22;
  uint64_t v206 = v26;
  uint64_t v202 = v27;
  uint64_t v201 = v28;
  uint64_t v205 = v29;
  v215 = v30;
  uint64_t v211 = v31;
  unint64_t v33 = v32;
  os_log_t v218 = v34;
  uint64_t v197 = sub_1C9F07E98();
  OUTLINED_FUNCTION_0();
  uint64_t v196 = v35;
  MEMORY[0x1F4188790](v36);
  OUTLINED_FUNCTION_2_0();
  uint64_t v194 = v37;
  uint64_t v195 = OUTLINED_FUNCTION_95();
  OUTLINED_FUNCTION_0();
  uint64_t v193 = v38;
  MEMORY[0x1F4188790](v39);
  OUTLINED_FUNCTION_2_0();
  uint64_t v192 = v40;
  uint64_t v199 = sub_1C9F07AA8();
  OUTLINED_FUNCTION_0();
  uint64_t v198 = v41;
  MEMORY[0x1F4188790](v42);
  OUTLINED_FUNCTION_115((uint64_t)&v189 - ((v43 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v44 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EA5CEC70);
  uint64_t v45 = OUTLINED_FUNCTION_10_3(v44);
  MEMORY[0x1F4188790](v45);
  OUTLINED_FUNCTION_84(v46, (uint64_t)v189);
  uint64_t v204 = sub_1C9F07A98();
  OUTLINED_FUNCTION_0();
  uint64_t v48 = v47;
  MEMORY[0x1F4188790](v49);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_115(v50);
  uint64_t v51 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC7FD70);
  uint64_t v52 = OUTLINED_FUNCTION_10_3(v51);
  MEMORY[0x1F4188790](v52);
  OUTLINED_FUNCTION_98(v53, (uint64_t)v189);
  uint64_t v212 = sub_1C9F07C98();
  OUTLINED_FUNCTION_0();
  uint64_t v208 = v54;
  MEMORY[0x1F4188790](v55);
  OUTLINED_FUNCTION_2_0();
  uint64_t v207 = v56;
  uint64_t v57 = OUTLINED_FUNCTION_141();
  OUTLINED_FUNCTION_0();
  uint64_t v59 = v58;
  MEMORY[0x1F4188790](v60);
  OUTLINED_FUNCTION_125();
  OUTLINED_FUNCTION_115(v61);
  OUTLINED_FUNCTION_270((uint64_t)v220);
  MEMORY[0x1F4188790](v62);
  uint64_t v64 = (char *)&v189 - v63;
  uint64_t v216 = sub_1C9F07BF8();
  OUTLINED_FUNCTION_0();
  uint64_t v219 = v65;
  MEMORY[0x1F4188790](v66);
  OUTLINED_FUNCTION_67();
  if (qword_1EBC7F680 != -1) {
    swift_once();
  }
  uint64_t v67 = sub_1C9F07E78();
  uint64_t v217 = __swift_project_value_buffer(v67, (uint64_t)qword_1EBC7FEF0);
  char v68 = sub_1C9F07E68();
  os_log_type_t v69 = sub_1C9F08158();
  BOOL v70 = OUTLINED_FUNCTION_180(v69);
  v213 = v64;
  v214 = v59;
  uint64_t v200 = v48;
  if (v70)
  {
    uint64_t v71 = (uint8_t *)OUTLINED_FUNCTION_7();
    uint64_t v72 = OUTLINED_FUNCTION_11_3();
    uint64_t v210 = v57;
    v220[0] = v72;
    *(_DWORD *)uint64_t v71 = 136315138;
    uint64_t v73 = sub_1C9F01420(0xD000000000000072, 0x80000001C9F0AB40, v220);
    OUTLINED_FUNCTION_129(v73);
    os_log_t v74 = v218;
    sub_1C9F08228();
    _os_log_impl(&dword_1C9EC7000, v68, v23, "%s", v71, 0xCu);
    OUTLINED_FUNCTION_7_3();
    uint64_t v57 = v210;
    OUTLINED_FUNCTION_1();
    OUTLINED_FUNCTION_1();
  }
  else
  {

    os_log_t v74 = v218;
  }
  sub_1C9EFEEF8((uint64_t)v74, v33);
  if (!v75)
  {
    uint64_t v99 = v215;
    OUTLINED_FUNCTION_131();
    swift_bridgeObjectRetain_n();
    uint64_t v100 = (void *)sub_1C9F07E68();
    os_log_type_t v101 = sub_1C9F08168();
    if (OUTLINED_FUNCTION_19_1(v101))
    {
      uint64_t v102 = (_DWORD *)OUTLINED_FUNCTION_29();
      uint64_t v103 = OUTLINED_FUNCTION_28();
      OUTLINED_FUNCTION_224(v103);
      *uint64_t v102 = 136315394;
      swift_bridgeObjectRetain();
      uint64_t v222 = sub_1C9F01420((uint64_t)v74, v33, v220);
      OUTLINED_FUNCTION_101();
      OUTLINED_FUNCTION_88();
      OUTLINED_FUNCTION_269();
      swift_bridgeObjectRetain();
      uint64_t v222 = sub_1C9F01420(v211, (unint64_t)v99, v220);
      OUTLINED_FUNCTION_101();
      OUTLINED_FUNCTION_150();
      OUTLINED_FUNCTION_99(&dword_1C9EC7000, v104, v105, "No active session for assistantId: %s cannot start correction speech request for request id: %s");
      OUTLINED_FUNCTION_170();
      OUTLINED_FUNCTION_1();
      OUTLINED_FUNCTION_1();
    }
    else
    {

      OUTLINED_FUNCTION_132();
      OUTLINED_FUNCTION_100();
    }
    goto LABEL_34;
  }
  uint64_t v76 = v75;
  uint64_t v191 = v25;
  unint64_t v190 = v33;
  unint64_t v77 = *MEMORY[0x1E4FA26B0];
  uint64_t v78 = v219;
  uint64_t v79 = *(void (**)(uint64_t, unint64_t, uint64_t))(v219 + 104);
  v79(v24, v77, v216);
  os_log_type_t v80 = sub_1C9EFDE68();
  unint64_t v81 = *(void (**)(void))(v78 + 8);
  uint64_t v219 = v78 + 8;
  OUTLINED_FUNCTION_77();
  v81();
  if ((v80 & 1) == 0)
  {
    uint64_t v106 = sub_1C9F07E68();
    os_log_type_t v107 = sub_1C9F08168();
    if (OUTLINED_FUNCTION_262(v107))
    {
      os_log_t v218 = v106;
      uint64_t v108 = (uint8_t *)OUTLINED_FUNCTION_7();
      uint64_t v217 = OUTLINED_FUNCTION_11_3();
      v220[0] = v217;
      *(_DWORD *)uint64_t v108 = 136315138;
      v214 = v108 + 4;
      v215 = v108;
      uint64_t v109 = v216;
      v79(v24, v77, v216);
      sub_1C9F07BE8();
      OUTLINED_FUNCTION_348();
      ((void (*)(uint64_t, uint64_t))v81)(v24, v109);
      uint64_t v110 = sub_1C9F01420(v24, v77, v220);
      OUTLINED_FUNCTION_129(v110);
      sub_1C9F08228();
      swift_bridgeObjectRelease();
      os_log_t v111 = v218;
      _os_log_impl(&dword_1C9EC7000, v218, v80, "Current session is not of type %s, cannot start correction speech request", v215, 0xCu);
      OUTLINED_FUNCTION_147();
      OUTLINED_FUNCTION_1();
      OUTLINED_FUNCTION_1();
      swift_release();
    }
    else
    {

      swift_release();
    }
    goto LABEL_34;
  }
  uint64_t v219 = v76;
  uint64_t v82 = (uint64_t)v213;
  uint64_t v83 = (uint64_t)(v214 + 16);
  uint64_t v84 = (void (*)(char *, uint64_t, uint64_t))*((void *)v214 + 2);
  v84(v213, v76 + OBJC_IVAR____TtC14SiriMessageBus7Session_sessionId, v57);
  uint64_t v85 = v191;
  uint64_t v86 = v191 + OBJC_IVAR___SRDRequestDispatcherInternal_sessionUserId;
  OUTLINED_FUNCTION_15_0();
  uint64_t v87 = v86;
  uint64_t v88 = (uint64_t)v209;
  sub_1C9EFADA4(v87, (uint64_t)v209, &qword_1EBC7FD70);
  if (__swift_getEnumTagSinglePayload(v88, 1, v212) == 1)
  {
    sub_1C9EFB940(v88, &qword_1EBC7FD70);
    uint64_t v89 = v215;
    OUTLINED_FUNCTION_212();
    unint64_t v90 = v190;
    swift_bridgeObjectRetain_n();
    uint64_t v91 = (void *)sub_1C9F07E68();
    os_log_type_t v92 = sub_1C9F08168();
    if (!OUTLINED_FUNCTION_19_1(v92))
    {
      OUTLINED_FUNCTION_100();
      OUTLINED_FUNCTION_138();
      swift_release();

      OUTLINED_FUNCTION_315();
      OUTLINED_FUNCTION_26_1();
      v122();
      goto LABEL_34;
    }
    uint64_t v93 = (_DWORD *)OUTLINED_FUNCTION_29();
    uint64_t v94 = OUTLINED_FUNCTION_28();
    OUTLINED_FUNCTION_224(v94);
    *uint64_t v93 = 136315394;
    swift_bridgeObjectRetain();
    uint64_t v95 = sub_1C9F01420((uint64_t)v218, v90, v220);
    OUTLINED_FUNCTION_292(v95);
    OUTLINED_FUNCTION_101();
    OUTLINED_FUNCTION_88();
    OUTLINED_FUNCTION_336();
    uint64_t v221 = sub_1C9F01420(v211, (unint64_t)v89, v220);
    OUTLINED_FUNCTION_101();
    OUTLINED_FUNCTION_154();
    OUTLINED_FUNCTION_99(&dword_1C9EC7000, v96, v97, "sessionUserId is not set for assistantId: %s during request: %s");
    OUTLINED_FUNCTION_170();
    OUTLINED_FUNCTION_1();
    OUTLINED_FUNCTION_1();
    swift_release();

    goto LABEL_11;
  }
  uint64_t v210 = v57;
  v189 = v84;
  uint64_t v216 = v83;
  OUTLINED_FUNCTION_103();
  v112();
  uint64_t v113 = v85;
  __swift_project_boxed_opaque_existential_1((void *)(v85 + OBJC_IVAR___SRDRequestDispatcherInternal_featureChecker), *(void *)(v85 + OBJC_IVAR___SRDRequestDispatcherInternal_featureChecker + 24));
  char v114 = sub_1C9F07D58();
  id v115 = objc_allocWithZone((Class)sub_1C9F07B28());
  id v116 = a22;
  uint64_t v117 = sub_1C9F07B18();
  uint64_t v118 = (void *)v117;
  if ((v114 & 1) == 0)
  {
    uint64_t v123 = v211;
    int v124 = v215;
    sub_1C9EDDF84();
    char v126 = v125;

    if (v126)
    {
      OUTLINED_FUNCTION_258();
      uint64_t v127 = v207;
      if (sub_1C9EDE570())
      {
        uint64_t v128 = v123;
        uint64_t v129 = OUTLINED_FUNCTION_258();
        uint64_t v134 = v127;
        uint64_t v135 = v82;
        if (sub_1C9EDC8B4(v129, v130, v131, v132, v133)) {
          goto LABEL_38;
        }
        swift_release();
        OUTLINED_FUNCTION_1_0();
        v136();
        uint64_t v137 = OUTLINED_FUNCTION_232();
LABEL_33:
        v138(v137, v210);
        goto LABEL_34;
      }
      swift_release();
      OUTLINED_FUNCTION_232();
    }
    else
    {
      swift_release();
      OUTLINED_FUNCTION_250();
    }
    OUTLINED_FUNCTION_1_0();
    v159();
    uint64_t v137 = OUTLINED_FUNCTION_231();
    goto LABEL_33;
  }
  MEMORY[0x1F4188790](v117);
  uint64_t v119 = v203;
  sub_1C9F07A78();
  if (__swift_getEnumTagSinglePayload(v119, 1, v204) == 1)
  {

    swift_release();
    OUTLINED_FUNCTION_230();
    OUTLINED_FUNCTION_1_0();
    v120();
    OUTLINED_FUNCTION_264();
    OUTLINED_FUNCTION_1_0();
    v121();
    sub_1C9EFB940(v119, (uint64_t *)&unk_1EA5CEC70);
    goto LABEL_34;
  }
  os_log_type_t v139 = v200;
  OUTLINED_FUNCTION_103();
  v140();
  OUTLINED_FUNCTION_8_1();
  v141();
  OUTLINED_FUNCTION_127();
  v142();
  id v143 = v118;
  uint64_t v144 = v215;
  id v145 = v143;
  sub_1C9EDB384();
  char v147 = v146;

  OUTLINED_FUNCTION_309();
  OUTLINED_FUNCTION_77();
  v148();
  if ((v147 & 1) == 0)
  {

    swift_release();
    OUTLINED_FUNCTION_10_4();
    v160();
    OUTLINED_FUNCTION_230();
    OUTLINED_FUNCTION_1_0();
    v161();
    uint64_t v137 = OUTLINED_FUNCTION_264();
    goto LABEL_33;
  }
  sub_1C9F069A8();
  uint64_t v149 = sub_1C9F06988();
  unint64_t v151 = v150;
  uint64_t v206 = *((void *)v214 + 1);
  OUTLINED_FUNCTION_149();
  v152();
  OUTLINED_FUNCTION_121();
  OUTLINED_FUNCTION_131();
  uint64_t v153 = sub_1C9F07E68();
  os_log_type_t v154 = sub_1C9F08158();
  BOOL v155 = OUTLINED_FUNCTION_191(v154);
  id v209 = v145;
  if (v155)
  {
    uint64_t v156 = OUTLINED_FUNCTION_29();
    v220[0] = OUTLINED_FUNCTION_28();
    *(_DWORD *)uint64_t v156 = 136315394;
    swift_bridgeObjectRetain();
    uint64_t v157 = sub_1C9F01420(v149, v151, v220);
    OUTLINED_FUNCTION_292(v157);
    sub_1C9F08228();
    OUTLINED_FUNCTION_120();
    *(_WORD *)(v156 + 12) = 2080;
    swift_bridgeObjectRetain();
    uint64_t v128 = v211;
    uint64_t v221 = sub_1C9F01420(v211, (unint64_t)v215, v220);
    sub_1C9F08228();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_1C9EC7000, v153, v139, "minting synthesized trpId : %s for text request: %s", (uint8_t *)v156, 0x16u);
    OUTLINED_FUNCTION_133();
    uint64_t v158 = v215;
    OUTLINED_FUNCTION_1();
    int v124 = v158;
    OUTLINED_FUNCTION_1();
  }
  else
  {
    int v124 = v144;

    OUTLINED_FUNCTION_132();
    OUTLINED_FUNCTION_130();
    uint64_t v128 = v211;
  }
  uint64_t v162 = v151;
  uint64_t v188 = v151;
  os_log_t v163 = v218;
  uint64_t v164 = v190;
  uint64_t v165 = v207;
  uint64_t v113 = v191;
  sub_1C9EDC3E4((uint64_t)v218, v190, (uint64_t)v213, v128, (uint64_t)v124, v207, v201, v202, v149, v188);
  OUTLINED_FUNCTION_301();
  if ((v166 & 1) == 0)
  {

    swift_bridgeObjectRelease();
    swift_release();
    OUTLINED_FUNCTION_77();
    v182();
    OUTLINED_FUNCTION_232();
    OUTLINED_FUNCTION_1_0();
    v183();
LABEL_44:
    OUTLINED_FUNCTION_306();
LABEL_11:
    OUTLINED_FUNCTION_149();
    v98();
    goto LABEL_34;
  }
  uint64_t v167 = (uint64_t)v163;
  uint64_t v168 = (uint64_t)v213;
  BOOL v169 = sub_1C9EDC920(v167, v164, (uint64_t)v213, v128, (uint64_t)v124, v149, v162);

  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_77();
  v170();
  uint64_t v134 = v165;
  uint64_t v135 = v168;
  if (!v169)
  {
    swift_release();
    OUTLINED_FUNCTION_1_0();
    v184();
    goto LABEL_44;
  }
LABEL_38:
  uint64_t v171 = *(void *)(v113 + OBJC_IVAR___SRDRequestDispatcherInternal_assetLogger);
  if ((*(unsigned char *)(v171 + 32) & 1) != 0 || (OUTLINED_FUNCTION_110(), v172))
  {
    os_log_t v218 = *(os_log_t *)(v171 + 16);
    uint64_t v173 = v210;
    OUTLINED_FUNCTION_8_1();
    v174();
    OUTLINED_FUNCTION_344();
    OUTLINED_FUNCTION_112();
    uint64_t v175 = swift_allocObject();
    OUTLINED_FUNCTION_199(v175);
    OUTLINED_FUNCTION_352();
    OUTLINED_FUNCTION_103();
    v176();
    uint64_t v177 = (uint64_t *)(v135 + v134);
    *uint64_t v177 = v128;
    v177[1] = (uint64_t)v124;
    v220[4] = (uint64_t)sub_1C9EFAE00;
    v220[5] = v135;
    v220[0] = MEMORY[0x1E4F143A8];
    v220[1] = 1107296256;
    v220[2] = (uint64_t)sub_1C9EDF1A8;
    v220[3] = (uint64_t)&block_descriptor_331;
    uint64_t v178 = _Block_copy(v220);
    uint64_t v186 = v173;
    swift_bridgeObjectRetain();
    swift_retain();
    sub_1C9F07EB8();
    uint64_t v221 = MEMORY[0x1E4FBC860];
    sub_1C9EFBB30((unint64_t *)&unk_1EBC7F7E0, MEMORY[0x1E4FBCB00]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC7F7F8);
    sub_1C9EFB3B4((unint64_t *)&qword_1EBC7F800, &qword_1EBC7F7F8);
    sub_1C9F08278();
    OUTLINED_FUNCTION_352();
    MEMORY[0x1CB794A40]();
    v179 = v178;
    uint64_t v135 = (uint64_t)v213;
    _Block_release(v179);
    OUTLINED_FUNCTION_251();
    OUTLINED_FUNCTION_1_0();
    v180();
    OUTLINED_FUNCTION_231();
    v185 = v214;
    OUTLINED_FUNCTION_1_0();
    v181();
    swift_release();
    swift_release();
  }
  else
  {
    swift_release();
    v185 = v214;
    uint64_t v186 = v210;
  }
  OUTLINED_FUNCTION_1_0();
  v187();
  (*((void (**)(uint64_t, uint64_t))v185 + 1))(v135, v186);
LABEL_34:
  OUTLINED_FUNCTION_11_1();
}

uint64_t sub_1C9EF2854()
{
  return sub_1C9F07A88();
}

void sub_1C9EF289C()
{
  OUTLINED_FUNCTION_14_1();
  LODWORD(v30) = v3;
  char v4 = OUTLINED_FUNCTION_136();
  OUTLINED_FUNCTION_0();
  uint64_t v6 = v5;
  uint64_t v8 = MEMORY[0x1F4188790](v7);
  OUTLINED_FUNCTION_21_2(v8, v9, v10, v11, v12, v13, v14, v15, v28[0]);
  MEMORY[0x1F4188790](v16);
  v28[1] = (uint64_t)v28 - v17;
  OUTLINED_FUNCTION_76();
  MEMORY[0x1F4188790](v18);
  OUTLINED_FUNCTION_62();
  MEMORY[0x1F4188790](v19);
  uint64_t v20 = (char *)OUTLINED_FUNCTION_159();
  uint64_t v31 = v2;
  OUTLINED_FUNCTION_15_3();
  OUTLINED_FUNCTION_119();
  v28[0] = v21 | 0x8000000000000000;
  uint64_t v29 = v1;
  OUTLINED_FUNCTION_6_3();
  sub_1C9F07CF8();
  dispatch_queue_t v30 = *(dispatch_queue_t *)(v0 + OBJC_IVAR___SRDRequestDispatcherInternal_rdmbQueue);
  uint64_t v22 = (void (*)(void))v6[2];
  OUTLINED_FUNCTION_18_2();
  v22();
  OUTLINED_FUNCTION_18_2();
  v22();
  OUTLINED_FUNCTION_39_0();
  uint64_t v23 = swift_allocObject();
  uint64_t v24 = (void (*)(void))v6[4];
  OUTLINED_FUNCTION_17_2();
  v24();
  OUTLINED_FUNCTION_17_2();
  v24();
  OUTLINED_FUNCTION_137((unint64_t *)&v20[v23]);
  *uint64_t v25 = sub_1C9EF9FB8;
  v25[1] = (uint64_t (*)())&v32;
  uint64_t v26 = OUTLINED_FUNCTION_7_1();
  *(void *)(v26 + 16) = sub_1C9EF9C40;
  *(void *)(v26 + 24) = v23;
  v33[4] = sub_1C9EFBBDC;
  v33[5] = v26;
  v33[0] = MEMORY[0x1E4F143A8];
  OUTLINED_FUNCTION_33_0(COERCE_DOUBLE(1107296256));
  v33[2] = sub_1C9EDF214;
  v33[3] = &block_descriptor_223;
  _Block_copy(v33);
  OUTLINED_FUNCTION_283();
  swift_release();
  dispatch_sync(v30, v20);
  _Block_release(v20);
  uint64_t v27 = (void (*)(void))v6[1];
  OUTLINED_FUNCTION_63();
  v27();
  OUTLINED_FUNCTION_63();
  v27();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_40_0();
  swift_release();
  if (v4) {
    __break(1u);
  }
  else {
    OUTLINED_FUNCTION_11_1();
  }
}

void sub_1C9EF2B54()
{
  OUTLINED_FUNCTION_14_1();
  OUTLINED_FUNCTION_201(v0, v1, v2, v3, v4);
  OUTLINED_FUNCTION_0();
  MEMORY[0x1F4188790](v5);
  OUTLINED_FUNCTION_118();
  OUTLINED_FUNCTION_0();
  MEMORY[0x1F4188790](v6);
  OUTLINED_FUNCTION_117();
  OUTLINED_FUNCTION_127();
  v7();
  OUTLINED_FUNCTION_321();
  uint64_t v8 = OUTLINED_FUNCTION_253();
  v9(v8);
  OUTLINED_FUNCTION_205();
  id v10 = objc_allocWithZone((Class)sub_1C9F07638());
  uint64_t v11 = (void *)sub_1C9F075D8();
  if (v11)
  {
    uint64_t v12 = v11;
    sub_1C9ED0FAC(v11);
  }
  else
  {
    if (qword_1EBC7F680 != -1) {
      swift_once();
    }
    uint64_t v13 = sub_1C9F07E78();
    OUTLINED_FUNCTION_19(v13, (uint64_t)qword_1EBC7FEF0);
    uint64_t v14 = (void *)sub_1C9F07E68();
    os_log_type_t v15 = sub_1C9F08168();
    if (OUTLINED_FUNCTION_96(v15))
    {
      OUTLINED_FUNCTION_7();
      uint64_t v16 = OUTLINED_FUNCTION_11_3();
      OUTLINED_FUNCTION_346(v16);
      OUTLINED_FUNCTION_295(4.8149e-34);
      uint64_t v17 = OUTLINED_FUNCTION_228();
      OUTLINED_FUNCTION_6_2(v17);
      OUTLINED_FUNCTION_221();
      OUTLINED_FUNCTION_177(&dword_1C9EC7000, v18, v19, "Cannot create StartSpeechDictationSessionMessage for assistantId: %s");
      OUTLINED_FUNCTION_345();
      OUTLINED_FUNCTION_1();
      OUTLINED_FUNCTION_1();
    }
    else
    {

      OUTLINED_FUNCTION_222();
    }
  }
  OUTLINED_FUNCTION_1_0();
  v20();
  OUTLINED_FUNCTION_11_1();
}

uint64_t sub_1C9EF2D5C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7)
{
  v18[3] = a7;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC7F020);
  MEMORY[0x1F4188790](v8 - 8);
  id v10 = (char *)v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC7FCF0);
  MEMORY[0x1F4188790](v11 - 8);
  uint64_t v13 = (char *)v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = *MEMORY[0x1E4FA22F8];
  uint64_t v15 = sub_1C9F07A48();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v15 - 8) + 104))(v13, v14, v15);
  __swift_storeEnumTagSinglePayload((uint64_t)v13, 0, 1, v15);
  sub_1C9F07618();
  swift_bridgeObjectRetain();
  sub_1C9F075E8();
  uint64_t v16 = sub_1C9F069B8();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v16 - 8) + 16))(v10, a4, v16);
  __swift_storeEnumTagSinglePayload((uint64_t)v10, 0, 1, v16);
  sub_1C9F07628();
  swift_bridgeObjectRetain();
  sub_1C9F075F8();
  return sub_1C9F07608();
}

void sub_1C9EF2F40(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  OUTLINED_FUNCTION_14_1();
  a19 = v22;
  a20 = v23;
  OUTLINED_FUNCTION_37_0(v24, v25, v26, v27, v28, v29, v30);
  char v31 = OUTLINED_FUNCTION_198();
  OUTLINED_FUNCTION_0();
  uint64_t v33 = v32;
  uint64_t v35 = *(void *)(v34 + 64);
  MEMORY[0x1F4188790](v36);
  OUTLINED_FUNCTION_36_0((uint64_t)v49 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x1F4188790](v37);
  OUTLINED_FUNCTION_42_0();
  MEMORY[0x1F4188790](v38);
  uint64_t v51 = (char *)v49 - v39;
  OUTLINED_FUNCTION_58();
  MEMORY[0x1F4188790](v40);
  OUTLINED_FUNCTION_31_1();
  uint64_t v50 = v20;
  OUTLINED_FUNCTION_15_3();
  OUTLINED_FUNCTION_119();
  v49[3] = v41 | 0x8000000000000000;
  uint64_t v42 = v51;
  OUTLINED_FUNCTION_6_3();
  sub_1C9F07CF8();
  uint64_t v43 = OUTLINED_FUNCTION_16_3(*(void *)((char *)v21 + OBJC_IVAR___SRDRequestDispatcherInternal_rdmbQueue));
  ((void (*)(uint64_t))v21)(v43);
  OUTLINED_FUNCTION_29_1();
  v21();
  OUTLINED_FUNCTION_9_4();
  uint64_t v44 = swift_allocObject();
  uint64_t v45 = OUTLINED_FUNCTION_22_1(v44);
  ((void (*)(uint64_t))v20)(v45);
  OUTLINED_FUNCTION_28_1();
  v20();
  *(void *)((char *)v21 + v35) = 0xD000000000000054;
  OUTLINED_FUNCTION_85((uint64_t)v21 + v35);
  *uint64_t v46 = sub_1C9EF9FD8;
  v46[1] = (uint64_t (*)())&v52;
  uint64_t v47 = OUTLINED_FUNCTION_7_1();
  *(void *)(v47 + 16) = sub_1C9EF9C40;
  *(void *)(v47 + 24) = v21;
  v53[4] = sub_1C9EFBBDC;
  v53[5] = v47;
  v53[0] = MEMORY[0x1E4F143A8];
  OUTLINED_FUNCTION_33_0(COERCE_DOUBLE(1107296256));
  v53[2] = sub_1C9EDF214;
  v53[3] = &block_descriptor_234;
  _Block_copy(v53);
  OUTLINED_FUNCTION_86();
  swift_release();
  OUTLINED_FUNCTION_210((uint64_t)&a18);
  _Block_release(v42);
  uint64_t v48 = *(void (**)(void))(v33 + 8);
  OUTLINED_FUNCTION_10_4();
  v48();
  OUTLINED_FUNCTION_10_4();
  v48();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_40_0();
  swift_release();
  if (v31) {
    __break(1u);
  }
  else {
    OUTLINED_FUNCTION_11_1();
  }
}

uint64_t sub_1C9EF31D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v13[0] = a5;
  v13[1] = a8;
  uint64_t v8 = sub_1C9F07A68();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8);
  uint64_t v11 = (char *)v13 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_bridgeObjectRetain();
  sub_1C9EE4448();
  swift_bridgeObjectRelease();
  sub_1C9EF33EC();
  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

#error "1C9EF33A4: call analysis failed (funcsize=55)"

void sub_1C9EF33EC()
{
  OUTLINED_FUNCTION_14_1();
  unint64_t v3 = v2;
  uint64_t v5 = v4;
  unint64_t v7 = v6;
  uint64_t v9 = v8;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC7F020);
  uint64_t v11 = OUTLINED_FUNCTION_10_3(v10);
  MEMORY[0x1F4188790](v11);
  uint64_t v12 = OUTLINED_FUNCTION_118();
  OUTLINED_FUNCTION_0();
  uint64_t v14 = v13;
  MEMORY[0x1F4188790](v15);
  OUTLINED_FUNCTION_20_1();
  uint64_t v16 = OUTLINED_FUNCTION_324();
  sub_1C9EFEEF8(v16, v17);
  if (v18)
  {
    uint64_t v19 = *(void (**)(uint64_t, uint64_t, uint64_t))(v14 + 16);
    v19(v1, v18 + OBJC_IVAR____TtC14SiriMessageBus7Session_sessionId, v12);
    v19(v0, v1, v12);
    uint64_t v20 = v12;
    OUTLINED_FUNCTION_32_0();
    __swift_storeEnumTagSinglePayload(v21, v22, v23, v12);
    uint64_t v24 = OUTLINED_FUNCTION_275();
    sub_1C9ED91A4(v24, v25, v3, 6, 0, 0, 0, 0, 0);
    uint64_t v26 = sub_1C9EFB940(v0, &qword_1EBC7F020);
    MEMORY[0x1F4188790](v26);
    id v27 = objc_allocWithZone((Class)sub_1C9F075C8());
    uint64_t v28 = (void *)sub_1C9F07558();
    if (v28)
    {
      uint64_t v29 = v28;
      sub_1C9ED0FAC(v28);
      swift_release();
    }
    else
    {
      if (qword_1EBC7F680 != -1) {
        swift_once();
      }
      uint64_t v39 = sub_1C9F07E78();
      OUTLINED_FUNCTION_64(v39, (uint64_t)qword_1EBC7FEF0);
      uint64_t v40 = (void *)sub_1C9F07E68();
      os_log_type_t v41 = sub_1C9F08168();
      if (OUTLINED_FUNCTION_106(v41))
      {
        uint64_t v42 = (_DWORD *)OUTLINED_FUNCTION_7();
        uint64_t v43 = OUTLINED_FUNCTION_11_3();
        OUTLINED_FUNCTION_40(v43);
        *uint64_t v42 = 136315138;
        swift_bridgeObjectRetain();
        sub_1C9F01420(v5, v3, &v48);
        uint64_t v20 = v12;
        sub_1C9F08228();
        OUTLINED_FUNCTION_154();
        OUTLINED_FUNCTION_178(&dword_1C9EC7000, v44, v45, "Failed to create StartSpeechDictationRequestMessage for requestId %s");
        OUTLINED_FUNCTION_7_3();
        OUTLINED_FUNCTION_1();
        OUTLINED_FUNCTION_1();
        swift_release();
      }
      else
      {

        OUTLINED_FUNCTION_155();
        swift_release();
      }
    }
    uint64_t v46 = OUTLINED_FUNCTION_230();
    v47(v46, v20);
  }
  else
  {
    if (qword_1EBC7F680 != -1) {
      swift_once();
    }
    uint64_t v30 = sub_1C9F07E78();
    OUTLINED_FUNCTION_64(v30, (uint64_t)qword_1EBC7FEF0);
    OUTLINED_FUNCTION_131();
    char v31 = (void *)sub_1C9F07E68();
    os_log_type_t v32 = sub_1C9F08178();
    if (OUTLINED_FUNCTION_9_2(v32))
    {
      uint64_t v33 = OUTLINED_FUNCTION_29();
      uint64_t v34 = OUTLINED_FUNCTION_28();
      OUTLINED_FUNCTION_346(v34);
      *(_DWORD *)uint64_t v33 = 136315394;
      swift_bridgeObjectRetain();
      uint64_t v35 = sub_1C9F01420(v9, v7, &v48);
      OUTLINED_FUNCTION_246(v35);
      OUTLINED_FUNCTION_101();
      OUTLINED_FUNCTION_150();
      *(_WORD *)(v33 + 12) = 2080;
      swift_bridgeObjectRetain();
      uint64_t v36 = sub_1C9F01420(v5, v3, &v48);
      OUTLINED_FUNCTION_71(v36);
      OUTLINED_FUNCTION_154();
      OUTLINED_FUNCTION_176(&dword_1C9EC7000, v37, v38, "No active session for assistantId: %s cannot start speech dictation request for request id: %s");
      OUTLINED_FUNCTION_234();
      OUTLINED_FUNCTION_1();
      OUTLINED_FUNCTION_1();
    }
    else
    {

      OUTLINED_FUNCTION_155();
      OUTLINED_FUNCTION_132();
    }
  }
  OUTLINED_FUNCTION_11_1();
}

void sub_1C9EF3858()
{
  OUTLINED_FUNCTION_14_1();
  LODWORD(v30) = v3;
  char v4 = OUTLINED_FUNCTION_136();
  OUTLINED_FUNCTION_0();
  unint64_t v6 = v5;
  uint64_t v8 = MEMORY[0x1F4188790](v7);
  OUTLINED_FUNCTION_21_2(v8, v9, v10, v11, v12, v13, v14, v15, v28[0]);
  MEMORY[0x1F4188790](v16);
  v28[1] = (uint64_t)v28 - v17;
  OUTLINED_FUNCTION_76();
  MEMORY[0x1F4188790](v18);
  OUTLINED_FUNCTION_62();
  MEMORY[0x1F4188790](v19);
  uint64_t v20 = (char *)OUTLINED_FUNCTION_159();
  uint64_t v31 = v2;
  OUTLINED_FUNCTION_15_3();
  OUTLINED_FUNCTION_119();
  v28[0] = v21 | 0x8000000000000000;
  uint64_t v29 = v1;
  OUTLINED_FUNCTION_6_3();
  sub_1C9F07CF8();
  dispatch_queue_t v30 = *(dispatch_queue_t *)(v0 + OBJC_IVAR___SRDRequestDispatcherInternal_rdmbQueue);
  uint64_t v22 = (void (*)(void))v6[2];
  OUTLINED_FUNCTION_18_2();
  v22();
  OUTLINED_FUNCTION_18_2();
  v22();
  OUTLINED_FUNCTION_39_0();
  uint64_t v23 = swift_allocObject();
  uint64_t v24 = (void (*)(void))v6[4];
  OUTLINED_FUNCTION_17_2();
  v24();
  OUTLINED_FUNCTION_17_2();
  v24();
  OUTLINED_FUNCTION_137((unint64_t *)&v20[v23]);
  *uint64_t v25 = sub_1C9EF9FF8;
  v25[1] = (uint64_t (*)())&v32;
  uint64_t v26 = OUTLINED_FUNCTION_7_1();
  *(void *)(v26 + 16) = sub_1C9EF9C40;
  *(void *)(v26 + 24) = v23;
  v33[4] = sub_1C9EFBBDC;
  v33[5] = v26;
  v33[0] = MEMORY[0x1E4F143A8];
  OUTLINED_FUNCTION_33_0(COERCE_DOUBLE(1107296256));
  v33[2] = sub_1C9EDF214;
  v33[3] = &block_descriptor_245;
  _Block_copy(v33);
  OUTLINED_FUNCTION_283();
  swift_release();
  dispatch_sync(v30, v20);
  _Block_release(v20);
  id v27 = (void (*)(void))v6[1];
  OUTLINED_FUNCTION_63();
  v27();
  OUTLINED_FUNCTION_63();
  v27();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_40_0();
  swift_release();
  if (v4) {
    __break(1u);
  }
  else {
    OUTLINED_FUNCTION_11_1();
  }
}

uint64_t sub_1C9EF3B10(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void (*a6)(uint64_t))
{
  sub_1C9F07FE8();
  sub_1C9F07FE8();
  id v8 = a1;
  uint64_t v9 = OUTLINED_FUNCTION_280();
  a6(v9);

  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void sub_1C9EF3BAC()
{
  OUTLINED_FUNCTION_14_1();
  OUTLINED_FUNCTION_201(v0, v1, v2, v3, v4);
  OUTLINED_FUNCTION_0();
  MEMORY[0x1F4188790](v5);
  OUTLINED_FUNCTION_118();
  OUTLINED_FUNCTION_0();
  MEMORY[0x1F4188790](v6);
  OUTLINED_FUNCTION_117();
  OUTLINED_FUNCTION_127();
  v7();
  OUTLINED_FUNCTION_321();
  uint64_t v8 = OUTLINED_FUNCTION_253();
  v9(v8);
  OUTLINED_FUNCTION_205();
  id v10 = objc_allocWithZone((Class)sub_1C9F077E8());
  uint64_t v11 = (void *)sub_1C9F07788();
  if (v11)
  {
    uint64_t v12 = v11;
    sub_1C9ED0FAC(v11);
  }
  else
  {
    if (qword_1EBC7F680 != -1) {
      swift_once();
    }
    uint64_t v13 = sub_1C9F07E78();
    OUTLINED_FUNCTION_19(v13, (uint64_t)qword_1EBC7FEF0);
    uint64_t v14 = (void *)sub_1C9F07E68();
    os_log_type_t v15 = sub_1C9F08168();
    if (OUTLINED_FUNCTION_96(v15))
    {
      OUTLINED_FUNCTION_7();
      uint64_t v16 = OUTLINED_FUNCTION_11_3();
      OUTLINED_FUNCTION_346(v16);
      OUTLINED_FUNCTION_295(4.8149e-34);
      uint64_t v17 = OUTLINED_FUNCTION_228();
      OUTLINED_FUNCTION_6_2(v17);
      OUTLINED_FUNCTION_221();
      OUTLINED_FUNCTION_177(&dword_1C9EC7000, v18, v19, "Cannot create StartUnderstandingDictationSessionMessage for assistantId: %s");
      OUTLINED_FUNCTION_345();
      OUTLINED_FUNCTION_1();
      OUTLINED_FUNCTION_1();
    }
    else
    {

      OUTLINED_FUNCTION_222();
    }
  }
  OUTLINED_FUNCTION_1_0();
  v20();
  OUTLINED_FUNCTION_11_1();
}

uint64_t sub_1C9EF3DB4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7)
{
  v18[3] = a7;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC7F020);
  MEMORY[0x1F4188790](v8 - 8);
  id v10 = (char *)v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC7FCF0);
  MEMORY[0x1F4188790](v11 - 8);
  uint64_t v13 = (char *)v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = *MEMORY[0x1E4FA22F8];
  uint64_t v15 = sub_1C9F07A48();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v15 - 8) + 104))(v13, v14, v15);
  __swift_storeEnumTagSinglePayload((uint64_t)v13, 0, 1, v15);
  sub_1C9F077C8();
  swift_bridgeObjectRetain();
  sub_1C9F07798();
  uint64_t v16 = sub_1C9F069B8();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v16 - 8) + 16))(v10, a4, v16);
  __swift_storeEnumTagSinglePayload((uint64_t)v10, 0, 1, v16);
  sub_1C9F077D8();
  swift_bridgeObjectRetain();
  sub_1C9F077A8();
  return sub_1C9F077B8();
}

void sub_1C9EF3F98(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  OUTLINED_FUNCTION_14_1();
  a19 = v22;
  a20 = v23;
  OUTLINED_FUNCTION_37_0(v24, v25, v26, v27, v28, v29, v30);
  char v31 = OUTLINED_FUNCTION_198();
  OUTLINED_FUNCTION_0();
  uint64_t v33 = v32;
  uint64_t v35 = *(void *)(v34 + 64);
  MEMORY[0x1F4188790](v36);
  OUTLINED_FUNCTION_36_0((uint64_t)v49 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x1F4188790](v37);
  OUTLINED_FUNCTION_42_0();
  MEMORY[0x1F4188790](v38);
  uint64_t v51 = (char *)v49 - v39;
  OUTLINED_FUNCTION_58();
  MEMORY[0x1F4188790](v40);
  OUTLINED_FUNCTION_31_1();
  uint64_t v50 = v20;
  OUTLINED_FUNCTION_15_3();
  OUTLINED_FUNCTION_119();
  v49[3] = v41 | 0x8000000000000000;
  uint64_t v42 = v51;
  OUTLINED_FUNCTION_6_3();
  sub_1C9F07CF8();
  uint64_t v43 = OUTLINED_FUNCTION_16_3(*(void *)((char *)v21 + OBJC_IVAR___SRDRequestDispatcherInternal_rdmbQueue));
  ((void (*)(uint64_t))v21)(v43);
  OUTLINED_FUNCTION_29_1();
  v21();
  OUTLINED_FUNCTION_9_4();
  uint64_t v44 = swift_allocObject();
  uint64_t v45 = OUTLINED_FUNCTION_22_1(v44);
  ((void (*)(uint64_t))v20)(v45);
  OUTLINED_FUNCTION_28_1();
  v20();
  *(void *)((char *)v21 + v35) = 0xD00000000000005BLL;
  OUTLINED_FUNCTION_85((uint64_t)v21 + v35);
  *uint64_t v46 = sub_1C9EFA048;
  v46[1] = (uint64_t (*)())&v52;
  uint64_t v47 = OUTLINED_FUNCTION_7_1();
  *(void *)(v47 + 16) = sub_1C9EF9C40;
  *(void *)(v47 + 24) = v21;
  v53[4] = sub_1C9EFBBDC;
  v53[5] = v47;
  v53[0] = MEMORY[0x1E4F143A8];
  OUTLINED_FUNCTION_33_0(COERCE_DOUBLE(1107296256));
  v53[2] = sub_1C9EDF214;
  v53[3] = &block_descriptor_256;
  _Block_copy(v53);
  OUTLINED_FUNCTION_86();
  swift_release();
  OUTLINED_FUNCTION_210((uint64_t)&a18);
  _Block_release(v42);
  uint64_t v48 = *(void (**)(void))(v33 + 8);
  OUTLINED_FUNCTION_10_4();
  v48();
  OUTLINED_FUNCTION_10_4();
  v48();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_40_0();
  swift_release();
  if (v31) {
    __break(1u);
  }
  else {
    OUTLINED_FUNCTION_11_1();
  }
}

uint64_t sub_1C9EF422C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v13[1] = a8;
  uint64_t v8 = sub_1C9F07A68();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8);
  uint64_t v11 = (char *)v13 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C9EE4448();
  sub_1C9EF4434();
  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

uint64_t sub_1C9EF4368()
{
  OUTLINED_FUNCTION_14_1();
  uint64_t v1 = v0;
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  sub_1C9F07FE8();
  sub_1C9F07FE8();
  sub_1C9F07FE8();
  id v6 = v3;
  id v7 = v5;
  uint64_t v8 = OUTLINED_FUNCTION_315();
  v1(v8);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_11_1();
  return swift_bridgeObjectRelease();
}

void sub_1C9EF4434()
{
  OUTLINED_FUNCTION_14_1();
  os_log_type_t v5 = v0;
  uint64_t v7 = v6;
  uint64_t v9 = v8;
  uint64_t v13 = OUTLINED_FUNCTION_252(v10, v11, v12);
  OUTLINED_FUNCTION_0();
  uint64_t v15 = v14;
  MEMORY[0x1F4188790](v16);
  OUTLINED_FUNCTION_67();
  sub_1C9EFEEF8(v2, v1);
  if (!v17)
  {
    if (qword_1EBC7F680 != -1) {
      swift_once();
    }
    uint64_t v26 = sub_1C9F07E78();
    OUTLINED_FUNCTION_64(v26, (uint64_t)qword_1EBC7FEF0);
    OUTLINED_FUNCTION_121();
    uint64_t v27 = sub_1C9F07E68();
    os_log_type_t v28 = sub_1C9F08168();
    if (!OUTLINED_FUNCTION_106(v28))
    {

      OUTLINED_FUNCTION_155();
      OUTLINED_FUNCTION_130();
      goto LABEL_22;
    }
    uint64_t v29 = OUTLINED_FUNCTION_29();
    uint64_t v30 = OUTLINED_FUNCTION_28();
    OUTLINED_FUNCTION_346(v30);
    *(_DWORD *)uint64_t v29 = 136315394;
    swift_bridgeObjectRetain();
    uint64_t v31 = OUTLINED_FUNCTION_78();
    OUTLINED_FUNCTION_206(v31);
    OUTLINED_FUNCTION_120();
    *(_WORD *)(v29 + 12) = 2080;
    swift_bridgeObjectRetain();
    uint64_t v32 = sub_1C9F01420(v53, v4, &v54);
    OUTLINED_FUNCTION_71(v32);
    OUTLINED_FUNCTION_154();
    _os_log_impl(&dword_1C9EC7000, v27, v5, "No active session for assistantId: %s cannot start understanding dictation request for request id: %s", (uint8_t *)v29, 0x16u);
    OUTLINED_FUNCTION_234();
    OUTLINED_FUNCTION_1();
    OUTLINED_FUNCTION_1();
LABEL_19:

    goto LABEL_22;
  }
  unint64_t v52 = v4;
  unsigned int v51 = *MEMORY[0x1E4FA26A8];
  uint64_t v50 = *(void (**)(uint64_t))(v15 + 104);
  v50(v3);
  char v18 = OUTLINED_FUNCTION_353();
  OUTLINED_FUNCTION_324();
  OUTLINED_FUNCTION_77();
  uint64_t v20 = v19();
  if ((v18 & 1) == 0)
  {
    if (qword_1EBC7F680 != -1) {
      swift_once();
    }
    uint64_t v33 = sub_1C9F07E78();
    OUTLINED_FUNCTION_313(v33, (uint64_t)qword_1EBC7FEF0);
    OUTLINED_FUNCTION_163();
    uint64_t v34 = sub_1C9F07E68();
    os_log_type_t v35 = sub_1C9F08168();
    if (os_log_type_enabled(v34, v35))
    {
      uint64_t v36 = OUTLINED_FUNCTION_29();
      uint64_t v54 = OUTLINED_FUNCTION_28();
      *(_DWORD *)uint64_t v36 = 136315394;
      ((void (*)(uint64_t, void, uint64_t))v50)(v3, v51, v13);
      uint64_t v37 = sub_1C9F07BE8();
      unint64_t v39 = v38;
      OUTLINED_FUNCTION_324();
      OUTLINED_FUNCTION_77();
      v40();
      uint64_t v41 = sub_1C9F01420(v37, v39, &v54);
      OUTLINED_FUNCTION_246(v41);
      sub_1C9F08228();
      swift_bridgeObjectRelease();
      *(_WORD *)(v36 + 12) = 2080;
      swift_bridgeObjectRetain();
      sub_1C9F01420(v53, v52, &v54);
      sub_1C9F08228();
      OUTLINED_FUNCTION_26_0();
      _os_log_impl(&dword_1C9EC7000, v34, v35, "Current session type is not of type %s, cannot start understanding dictation request for requestId: %s", (uint8_t *)v36, 0x16u);
      OUTLINED_FUNCTION_293();
      OUTLINED_FUNCTION_1();
      OUTLINED_FUNCTION_1();
      swift_release();

      goto LABEL_22;
    }

    OUTLINED_FUNCTION_27_0();
    goto LABEL_21;
  }
  MEMORY[0x1F4188790](v20);
  OUTLINED_FUNCTION_341();
  *(void *)(v22 - 48) = v21;
  *(void *)(v22 - 40) = v53;
  *(void *)(v22 - 32) = v4;
  *(void *)(v22 - 24) = v9;
  *(void *)(v22 - 16) = v7;
  id v23 = objc_allocWithZone((Class)sub_1C9F07778());
  OUTLINED_FUNCTION_80();
  uint64_t v24 = (void *)sub_1C9F07558();
  if (!v24)
  {
    if (qword_1EBC7F680 != -1) {
      swift_once();
    }
    uint64_t v42 = sub_1C9F07E78();
    __swift_project_value_buffer(v42, (uint64_t)qword_1EBC7FEF0);
    OUTLINED_FUNCTION_212();
    uint64_t v27 = sub_1C9F07E68();
    os_log_type_t v43 = sub_1C9F08168();
    if (OUTLINED_FUNCTION_106(v43))
    {
      uint64_t v44 = (_DWORD *)OUTLINED_FUNCTION_7();
      uint64_t v54 = OUTLINED_FUNCTION_11_3();
      *uint64_t v44 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v45 = OUTLINED_FUNCTION_290();
      uint64_t v47 = sub_1C9F01420(v45, v4, v46);
      OUTLINED_FUNCTION_70(v47);
      OUTLINED_FUNCTION_19_0();
      OUTLINED_FUNCTION_178(&dword_1C9EC7000, v48, v49, "Failed to create StartUnderstandingDictationRequestMessage for requestId %s");
      OUTLINED_FUNCTION_168();
      OUTLINED_FUNCTION_1();
      OUTLINED_FUNCTION_1();
      swift_release();
      goto LABEL_19;
    }

    OUTLINED_FUNCTION_138();
LABEL_21:
    swift_release();
    goto LABEL_22;
  }
  uint64_t v25 = v24;
  sub_1C9ED0FAC(v24);
  swift_release();

LABEL_22:
  OUTLINED_FUNCTION_11_1();
}

void sub_1C9EF4990()
{
  OUTLINED_FUNCTION_14_1();
  unint64_t v1 = v0;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBC7FCF8);
  uint64_t v3 = OUTLINED_FUNCTION_10_3(v2);
  MEMORY[0x1F4188790](v3);
  OUTLINED_FUNCTION_68();
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC7F020);
  uint64_t v5 = OUTLINED_FUNCTION_10_3(v4);
  MEMORY[0x1F4188790](v5);
  OUTLINED_FUNCTION_97();
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC7FCF0);
  uint64_t v7 = OUTLINED_FUNCTION_10_3(v6);
  MEMORY[0x1F4188790](v7);
  OUTLINED_FUNCTION_39();
  uint64_t v8 = sub_1C9F07A48();
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_305();
  v9();
  OUTLINED_FUNCTION_32_0();
  __swift_storeEnumTagSinglePayload(v10, v11, v12, v8);
  sub_1C9F07598();
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_309();
  sub_1C9F07568();
  uint64_t v13 = sub_1C9F069B8();
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_22_0();
  v14();
  uint64_t v15 = OUTLINED_FUNCTION_245();
  __swift_storeEnumTagSinglePayload(v15, v16, v17, v13);
  sub_1C9F075B8();
  swift_bridgeObjectRetain();
  sub_1C9F075A8();
  uint64_t v18 = sub_1C9F07A68();
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_22_0();
  v19();
  uint64_t v20 = OUTLINED_FUNCTION_277();
  __swift_storeEnumTagSinglePayload(v20, v21, v22, v18);
  sub_1C9F07578();
  id v23 = v1;
  sub_1C9F07588();
  OUTLINED_FUNCTION_11_1();
}

void sub_1C9EF4B94()
{
  OUTLINED_FUNCTION_14_1();
  char v6 = OUTLINED_FUNCTION_188();
  OUTLINED_FUNCTION_0();
  uint64_t v8 = v7;
  uint64_t v10 = *(void *)(v9 + 64);
  MEMORY[0x1F4188790](v11);
  OUTLINED_FUNCTION_52();
  MEMORY[0x1F4188790](v12);
  OUTLINED_FUNCTION_30_1();
  MEMORY[0x1F4188790](v13);
  OUTLINED_FUNCTION_124();
  MEMORY[0x1F4188790](v14);
  OUTLINED_FUNCTION_82();
  uint64_t v23 = v4;
  uint64_t v24 = v5;
  uint64_t v25 = v0;
  sub_1C9ECFD44();
  OUTLINED_FUNCTION_27_1();
  OUTLINED_FUNCTION_182();
  OUTLINED_FUNCTION_6_3();
  sub_1C9F07CF8();
  uint64_t v21 = *(NSObject **)(v4 + OBJC_IVAR___SRDRequestDispatcherInternal_rdmbQueue);
  uint64_t v15 = *(void (**)(void))(v8 + 16);
  OUTLINED_FUNCTION_18_2();
  v15();
  OUTLINED_FUNCTION_18_2();
  v15();
  OUTLINED_FUNCTION_20_2();
  uint64_t v16 = swift_allocObject();
  uint64_t v17 = OUTLINED_FUNCTION_49(v16);
  ((void (*)(uint64_t))v2)(v17);
  OUTLINED_FUNCTION_81();
  v2();
  *(void *)(v10 + v1) = 0xD000000000000025;
  OUTLINED_FUNCTION_92(v10 + v1);
  *uint64_t v18 = sub_1C9EFA09C;
  v18[1] = (uint64_t (*)())&v22;
  uint64_t v19 = OUTLINED_FUNCTION_7_1();
  *(void *)(v19 + 16) = sub_1C9EF9C40;
  *(void *)(v19 + 24) = v10;
  v26[4] = sub_1C9EFBBDC;
  v26[5] = v19;
  v26[0] = MEMORY[0x1E4F143A8];
  OUTLINED_FUNCTION_153(COERCE_DOUBLE(1107296256));
  void v26[2] = sub_1C9EDF214;
  void v26[3] = &block_descriptor_267;
  _Block_copy(v26);
  OUTLINED_FUNCTION_268();
  swift_release();
  dispatch_sync(v21, v3);
  _Block_release(v3);
  uint64_t v20 = *(void (**)(void))(v8 + 8);
  OUTLINED_FUNCTION_10_4();
  v20();
  OUTLINED_FUNCTION_10_4();
  v20();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_40_0();
  swift_release();
  if (v6) {
    __break(1u);
  }
  else {
    OUTLINED_FUNCTION_11_1();
  }
}

uint64_t sub_1C9EF4E18()
{
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBC7FE68);
  uint64_t v0 = sub_1C9F07BF8();
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = *(void *)(v1 + 72);
  unint64_t v3 = (*(unsigned __int8 *)(v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_1C9F09590;
  unint64_t v5 = v4 + v3;
  char v6 = *(void (**)(unint64_t, void, uint64_t))(v1 + 104);
  v6(v5, *MEMORY[0x1E4FA26B8], v0);
  v6(v5 + v2, *MEMORY[0x1E4FA26A8], v0);
  sub_1C9EE7664();
  swift_setDeallocating();
  return sub_1C9EF8550();
}

void sub_1C9EF4FC8()
{
  OUTLINED_FUNCTION_14_1();
  uint64_t v42 = v2;
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  char v9 = sub_1C9F07E58();
  OUTLINED_FUNCTION_0();
  uint64_t v11 = v10;
  uint64_t v13 = MEMORY[0x1F4188790](v12);
  OUTLINED_FUNCTION_21_2(v13, v14, v15, v16, v17, v18, v19, v20, v40);
  MEMORY[0x1F4188790](v21);
  OUTLINED_FUNCTION_30_1();
  uint64_t v23 = MEMORY[0x1F4188790](v22);
  OUTLINED_FUNCTION_139(v23, v24, v25, v26, v27, v28, v29, v30, v41);
  MEMORY[0x1F4188790](v31);
  OUTLINED_FUNCTION_140();
  uint64_t v44 = v0;
  uint64_t v45 = v8;
  uint64_t v46 = v6;
  uint64_t v47 = v4;
  uint64_t v48 = v42;
  uint64_t v32 = (void (*)(uint64_t))sub_1C9ECFD44();
  OUTLINED_FUNCTION_174();
  OUTLINED_FUNCTION_6_3();
  sub_1C9F07CF8();
  uint64_t v33 = OUTLINED_FUNCTION_38_0(*(void *)(v0 + OBJC_IVAR___SRDRequestDispatcherInternal_rdmbQueue));
  v32(v33);
  uint64_t v34 = OUTLINED_FUNCTION_72();
  v32(v34);
  OUTLINED_FUNCTION_7_4();
  uint64_t v35 = swift_allocObject();
  uint64_t v36 = *(void (**)(void))(v11 + 32);
  OUTLINED_FUNCTION_17_2();
  v36();
  OUTLINED_FUNCTION_17_2();
  v36();
  OUTLINED_FUNCTION_91((unint64_t *)((char *)&type metadata for Logger + v35));
  *uint64_t v37 = sub_1C9EFA0B0;
  v37[1] = (uint64_t (*)())&v43;
  uint64_t v38 = OUTLINED_FUNCTION_7_1();
  *(void *)(v38 + 16) = sub_1C9EF9C40;
  *(void *)(v38 + 24) = v35;
  v49[4] = sub_1C9EFBBDC;
  v49[5] = v38;
  v49[0] = MEMORY[0x1E4F143A8];
  OUTLINED_FUNCTION_33_0(COERCE_DOUBLE(1107296256));
  v49[2] = sub_1C9EDF214;
  v49[3] = &block_descriptor_278;
  _Block_copy(v49);
  OUTLINED_FUNCTION_53();
  swift_release();
  OUTLINED_FUNCTION_303();
  _Block_release(v1);
  unint64_t v39 = *(void (**)(void))(v11 + 8);
  OUTLINED_FUNCTION_13_2();
  v39();
  OUTLINED_FUNCTION_13_2();
  v39();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_40_0();
  swift_release();
  if (v9) {
    __break(1u);
  }
  else {
    OUTLINED_FUNCTION_11_1();
  }
}

uint64_t sub_1C9EF5264(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v9 = sub_1C9F07FE8();
  uint64_t v11 = v10;
  sub_1C9F07FE8();
  OUTLINED_FUNCTION_348();
  id v12 = a1;
  a5(v9, v11, a4, v5);

  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void sub_1C9EF52FC()
{
  OUTLINED_FUNCTION_14_1();
  OUTLINED_FUNCTION_204();
  sub_1C9EFEEF8(v0, v1);
  if (!v2)
  {
    if (qword_1EBC7F680 != -1) {
      swift_once();
    }
    uint64_t v6 = sub_1C9F07E78();
    OUTLINED_FUNCTION_47_0(v6, (uint64_t)qword_1EBC7FEF0);
    OUTLINED_FUNCTION_121();
    uint64_t v7 = (void *)sub_1C9F07E68();
    os_log_type_t v8 = sub_1C9F08168();
    if (!OUTLINED_FUNCTION_96(v8))
    {

      OUTLINED_FUNCTION_146();
      OUTLINED_FUNCTION_130();
      goto LABEL_15;
    }
    uint64_t v9 = (_DWORD *)OUTLINED_FUNCTION_29();
    uint64_t v10 = OUTLINED_FUNCTION_28();
    OUTLINED_FUNCTION_256(v10);
    *uint64_t v9 = 136315394;
    swift_bridgeObjectRetain();
    uint64_t v11 = OUTLINED_FUNCTION_78();
    OUTLINED_FUNCTION_175(v11);
    OUTLINED_FUNCTION_120();
    OUTLINED_FUNCTION_338();
    uint64_t v12 = OUTLINED_FUNCTION_167();
    OUTLINED_FUNCTION_71(v12);
    OUTLINED_FUNCTION_194();
    OUTLINED_FUNCTION_122(&dword_1C9EC7000, v13, v14, "No active session for assistantId: %s, cannot pause dictation recognition for requestId: %s");
    OUTLINED_FUNCTION_133();
    OUTLINED_FUNCTION_1();
    OUTLINED_FUNCTION_1();
    goto LABEL_12;
  }
  MEMORY[0x1F4188790](v2);
  id v3 = objc_allocWithZone((Class)sub_1C9F06FE8());
  OUTLINED_FUNCTION_80();
  uint64_t v4 = (void *)sub_1C9F06C28();
  if (!v4)
  {
    if (qword_1EBC7F680 != -1) {
      swift_once();
    }
    uint64_t v15 = sub_1C9F07E78();
    OUTLINED_FUNCTION_47_0(v15, (uint64_t)qword_1EBC7FEF0);
    uint64_t v7 = (void *)sub_1C9F07E68();
    os_log_type_t v16 = sub_1C9F08168();
    if (!OUTLINED_FUNCTION_21(v16))
    {

      OUTLINED_FUNCTION_146();
      swift_release();
      goto LABEL_15;
    }
    OUTLINED_FUNCTION_7();
    uint64_t v17 = OUTLINED_FUNCTION_11_3();
    OUTLINED_FUNCTION_40(v17);
    OUTLINED_FUNCTION_332(4.8149e-34);
    uint64_t v18 = OUTLINED_FUNCTION_167();
    OUTLINED_FUNCTION_6_2(v18);
    OUTLINED_FUNCTION_194();
    OUTLINED_FUNCTION_1_3(&dword_1C9EC7000, v19, v20, "Failed to create a PauseDictationRequestMessage for requestId %s");
    OUTLINED_FUNCTION_7_3();
    OUTLINED_FUNCTION_1();
    OUTLINED_FUNCTION_1();
    swift_release();
LABEL_12:

    goto LABEL_15;
  }
  uint64_t v5 = v4;
  sub_1C9ED0FAC(v4);
  swift_release();

LABEL_15:
  OUTLINED_FUNCTION_11_1();
}

uint64_t sub_1C9EF55AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC7F020);
  MEMORY[0x1F4188790](v5 - 8);
  uint64_t v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC7FCF0);
  MEMORY[0x1F4188790](v8 - 8);
  uint64_t v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = *MEMORY[0x1E4FA22F8];
  uint64_t v12 = sub_1C9F07A48();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v12 - 8) + 104))(v10, v11, v12);
  __swift_storeEnumTagSinglePayload((uint64_t)v10, 0, 1, v12);
  sub_1C9F07968();
  swift_bridgeObjectRetain();
  sub_1C9F07958();
  uint64_t v13 = sub_1C9F069B8();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v13 - 8) + 16))(v7, a4, v13);
  __swift_storeEnumTagSinglePayload((uint64_t)v7, 0, 1, v13);
  sub_1C9F07988();
  swift_bridgeObjectRetain();
  return sub_1C9F07978();
}

void sub_1C9EF5780(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22)
{
  OUTLINED_FUNCTION_14_1();
  a19 = v24;
  a20 = v25;
  uint64_t v69 = v22;
  uint64_t v71 = v26;
  unint64_t v70 = v27;
  uint64_t v68 = v28;
  uint64_t v67 = v29;
  uint64_t v31 = v30;
  uint64_t v33 = v32;
  uint64_t v35 = v34;
  uint64_t v37 = v36;
  v66[1] = a22;
  OUTLINED_FUNCTION_260(a21);
  char v38 = sub_1C9F07E58();
  OUTLINED_FUNCTION_0();
  uint64_t v40 = v39;
  uint64_t v42 = *(void *)(v41 + 64);
  uint64_t v44 = MEMORY[0x1F4188790](v43);
  OUTLINED_FUNCTION_35_0(v44, v45, v46, v47, v48, v49, v50, v51, v66[0]);
  MEMORY[0x1F4188790](v52);
  OUTLINED_FUNCTION_42_0();
  MEMORY[0x1F4188790](v53);
  OUTLINED_FUNCTION_36_0((uint64_t)v66 - v54);
  MEMORY[0x1F4188790](v55);
  OUTLINED_FUNCTION_140();
  uint64_t v75 = v22;
  uint64_t v76 = v37;
  uint64_t v77 = v35;
  uint64_t v78 = v33;
  uint64_t v79 = v31;
  uint64_t v80 = v67;
  OUTLINED_FUNCTION_233((uint64_t)&a12);
  OUTLINED_FUNCTION_291(v56);
  OUTLINED_FUNCTION_249();
  uint64_t v81 = v57;
  sub_1C9ECFD44();
  uint64_t v72 = v23;
  OUTLINED_FUNCTION_15_3();
  OUTLINED_FUNCTION_119();
  unint64_t v70 = v58 | 0x8000000000000000;
  uint64_t v59 = v73;
  OUTLINED_FUNCTION_6_3();
  sub_1C9F07CF8();
  uint64_t v60 = OUTLINED_FUNCTION_16_3(*(void *)(v69 + OBJC_IVAR___SRDRequestDispatcherInternal_rdmbQueue));
  ((void (*)(uint64_t))v33)(v60);
  OUTLINED_FUNCTION_29_1();
  v33();
  OUTLINED_FUNCTION_9_4();
  uint64_t v61 = swift_allocObject();
  uint64_t v62 = OUTLINED_FUNCTION_22_1(v61);
  ((void (*)(uint64_t))v23)(v62);
  OUTLINED_FUNCTION_28_1();
  v23();
  *(void *)((char *)v33 + v42) = 0xD00000000000005ALL;
  OUTLINED_FUNCTION_85((uint64_t)v33 + v42);
  *uint64_t v63 = sub_1C9EFA0FC;
  v63[1] = (void (*)())&v74;
  uint64_t v64 = OUTLINED_FUNCTION_7_1();
  *(void *)(v64 + 16) = sub_1C9EF9C40;
  *(void *)(v64 + 24) = v33;
  v82[4] = sub_1C9EFBBDC;
  v82[5] = v64;
  v82[0] = MEMORY[0x1E4F143A8];
  OUTLINED_FUNCTION_33_0(COERCE_DOUBLE(1107296256));
  v82[2] = sub_1C9EDF214;
  v82[3] = &block_descriptor_289;
  _Block_copy(v82);
  OUTLINED_FUNCTION_86();
  swift_release();
  OUTLINED_FUNCTION_210((uint64_t)&a16);
  _Block_release(v59);
  uint64_t v65 = *(void (**)(void))(v40 + 8);
  OUTLINED_FUNCTION_10_4();
  v65();
  OUTLINED_FUNCTION_10_4();
  v65();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_40_0();
  swift_release();
  if (v38) {
    __break(1u);
  }
  else {
    OUTLINED_FUNCTION_11_1();
  }
}

void sub_1C9EF5BA4()
{
  OUTLINED_FUNCTION_14_1();
  OUTLINED_FUNCTION_134();
  sub_1C9EFEEF8(v2, v3);
  if (!v4)
  {
    if (qword_1EBC7F680 != -1) {
      swift_once();
    }
    uint64_t v8 = sub_1C9F07E78();
    OUTLINED_FUNCTION_47_0(v8, (uint64_t)qword_1EBC7FEF0);
    OUTLINED_FUNCTION_121();
    uint64_t v9 = (void *)sub_1C9F07E68();
    os_log_type_t v10 = sub_1C9F08168();
    if (!OUTLINED_FUNCTION_96(v10))
    {

      OUTLINED_FUNCTION_146();
      OUTLINED_FUNCTION_130();
      goto LABEL_15;
    }
    uint64_t v11 = (_DWORD *)OUTLINED_FUNCTION_29();
    uint64_t v12 = OUTLINED_FUNCTION_28();
    OUTLINED_FUNCTION_256(v12);
    *uint64_t v11 = 136315394;
    swift_bridgeObjectRetain();
    OUTLINED_FUNCTION_78();
    OUTLINED_FUNCTION_166();
    OUTLINED_FUNCTION_120();
    OUTLINED_FUNCTION_337();
    v20[2] = sub_1C9F01420(v1, v0, &v21);
    OUTLINED_FUNCTION_166();
    OUTLINED_FUNCTION_194();
    OUTLINED_FUNCTION_122(&dword_1C9EC7000, v13, v14, "No active session for assistantId: %s, cannot resume dictation recognition for requestId: %s");
    OUTLINED_FUNCTION_133();
    OUTLINED_FUNCTION_1();
    OUTLINED_FUNCTION_1();
    goto LABEL_12;
  }
  v20[1] = v20;
  MEMORY[0x1F4188790](v4);
  id v5 = objc_allocWithZone((Class)sub_1C9F07078());
  OUTLINED_FUNCTION_80();
  uint64_t v6 = (void *)sub_1C9F06FF8();
  if (!v6)
  {
    if (qword_1EBC7F680 != -1) {
      swift_once();
    }
    uint64_t v15 = sub_1C9F07E78();
    OUTLINED_FUNCTION_47_0(v15, (uint64_t)qword_1EBC7FEF0);
    uint64_t v9 = (void *)sub_1C9F07E68();
    os_log_type_t v16 = sub_1C9F08168();
    if (!OUTLINED_FUNCTION_21(v16))
    {

      OUTLINED_FUNCTION_146();
      swift_release();
      goto LABEL_15;
    }
    OUTLINED_FUNCTION_7();
    uint64_t v21 = OUTLINED_FUNCTION_11_3();
    OUTLINED_FUNCTION_340(4.8149e-34);
    uint64_t v17 = sub_1C9F01420(v1, v0, &v21);
    OUTLINED_FUNCTION_69(v17);
    OUTLINED_FUNCTION_88();
    OUTLINED_FUNCTION_1_3(&dword_1C9EC7000, v18, v19, "Failed to create a ResumeDictationRequestMessage for requestId %s");
    OUTLINED_FUNCTION_147();
    OUTLINED_FUNCTION_1();
    OUTLINED_FUNCTION_1();
    swift_release();
LABEL_12:

    goto LABEL_15;
  }
  uint64_t v7 = v6;
  sub_1C9ED0FAC(v6);
  swift_release();

LABEL_15:
  OUTLINED_FUNCTION_11_1();
}

uint64_t sub_1C9EF5E9C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  v22[1] = a5;
  v22[2] = a7;
  v22[0] = a4;
  v22[4] = a12;
  v22[5] = a11;
  v22[3] = a9;
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC7F020);
  MEMORY[0x1F4188790](v12 - 8);
  uint64_t v14 = (char *)v22 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC7FCF0);
  MEMORY[0x1F4188790](v15 - 8);
  uint64_t v17 = (char *)v22 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = *MEMORY[0x1E4FA22F8];
  uint64_t v19 = sub_1C9F07A48();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v19 - 8) + 104))(v17, v18, v19);
  __swift_storeEnumTagSinglePayload((uint64_t)v17, 0, 1, v19);
  sub_1C9F07048();
  swift_bridgeObjectRetain();
  sub_1C9F07018();
  uint64_t v20 = sub_1C9F069B8();
  (*(void (**)(char *, void, uint64_t))(*(void *)(v20 - 8) + 16))(v14, v22[0], v20);
  __swift_storeEnumTagSinglePayload((uint64_t)v14, 0, 1, v20);
  sub_1C9F07068();
  swift_bridgeObjectRetain();
  sub_1C9F07058();
  swift_bridgeObjectRetain();
  sub_1C9F07008();
  swift_bridgeObjectRetain();
  sub_1C9F07028();
  swift_bridgeObjectRetain();
  return sub_1C9F07038();
}

void sub_1C9EF60CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,long long a21,long long a22,long long a23,uint64_t a24)
{
  OUTLINED_FUNCTION_14_1();
  a19 = v25;
  a20 = v26;
  uint64_t v68 = v24;
  uint64_t v69 = v27;
  unint64_t v67 = v28;
  uint64_t v66 = v29;
  uint64_t v64 = v30;
  uint64_t v32 = v31;
  uint64_t v34 = v33;
  uint64_t v36 = v35;
  uint64_t v38 = v37;
  uint64_t v65 = a24;
  long long v63 = a23;
  long long v62 = a22;
  long long v61 = a21;
  char v39 = sub_1C9F07E58();
  OUTLINED_FUNCTION_0();
  uint64_t v41 = v40;
  uint64_t v43 = *(void *)(v42 + 64);
  MEMORY[0x1F4188790](v44);
  OUTLINED_FUNCTION_186();
  OUTLINED_FUNCTION_36_0(v45);
  MEMORY[0x1F4188790](v46);
  OUTLINED_FUNCTION_42_0();
  MEMORY[0x1F4188790](v47);
  OUTLINED_FUNCTION_21_0();
  OUTLINED_FUNCTION_36_0(v48);
  MEMORY[0x1F4188790](v49);
  uint64_t v51 = (void (*)(void))((char *)&v61 - v50);
  uint64_t v73 = v24;
  uint64_t v74 = v38;
  uint64_t v75 = v36;
  uint64_t v76 = v34;
  uint64_t v77 = v32;
  uint64_t v78 = v64;
  uint64_t v79 = v66;
  unint64_t v80 = v67;
  uint64_t v81 = v69;
  long long v82 = v61;
  long long v83 = v62;
  long long v84 = v63;
  OUTLINED_FUNCTION_323();
  uint64_t v85 = v52;
  sub_1C9ECFD44();
  unint64_t v70 = v51;
  OUTLINED_FUNCTION_15_3();
  OUTLINED_FUNCTION_119();
  unint64_t v67 = v53 | 0x8000000000000000;
  uint64_t v54 = v71;
  OUTLINED_FUNCTION_6_3();
  sub_1C9F07CF8();
  uint64_t v55 = OUTLINED_FUNCTION_16_3(*(void *)(v68 + OBJC_IVAR___SRDRequestDispatcherInternal_rdmbQueue));
  ((void (*)(uint64_t))v51)(v55);
  OUTLINED_FUNCTION_29_1();
  v51();
  OUTLINED_FUNCTION_9_4();
  uint64_t v56 = swift_allocObject();
  uint64_t v57 = OUTLINED_FUNCTION_22_1(v56);
  ((void (*)(uint64_t))v51)(v57);
  OUTLINED_FUNCTION_28_1();
  v51();
  *(void *)((char *)v51 + v43) = 0xD0000000000000BCLL;
  OUTLINED_FUNCTION_85((uint64_t)v51 + v43);
  *uint64_t v58 = sub_1C9EFA140;
  v58[1] = (void (*)())&v72;
  uint64_t v59 = OUTLINED_FUNCTION_7_1();
  *(void *)(v59 + 16) = sub_1C9EF9C40;
  *(void *)(v59 + 24) = v51;
  v86[4] = sub_1C9EFBBDC;
  v86[5] = v59;
  v86[0] = MEMORY[0x1E4F143A8];
  OUTLINED_FUNCTION_33_0(COERCE_DOUBLE(1107296256));
  v86[2] = sub_1C9EDF214;
  uint64_t v86[3] = &block_descriptor_300;
  _Block_copy(v86);
  OUTLINED_FUNCTION_86();
  swift_release();
  OUTLINED_FUNCTION_210((uint64_t)&a12);
  _Block_release(v54);
  uint64_t v60 = *(void (**)(void))(v41 + 8);
  OUTLINED_FUNCTION_10_4();
  v60();
  OUTLINED_FUNCTION_10_4();
  v60();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_40_0();
  swift_release();
  if (v39) {
    __break(1u);
  }
  else {
    OUTLINED_FUNCTION_11_1();
  }
}

void sub_1C9EF65EC()
{
  OUTLINED_FUNCTION_14_1();
  OUTLINED_FUNCTION_134();
  sub_1C9EFEEF8(v2, v3);
  if (!v4)
  {
    if (qword_1EBC7F680 != -1) {
      swift_once();
    }
    uint64_t v8 = sub_1C9F07E78();
    OUTLINED_FUNCTION_47_0(v8, (uint64_t)qword_1EBC7FEF0);
    OUTLINED_FUNCTION_121();
    uint64_t v9 = (void *)sub_1C9F07E68();
    os_log_type_t v10 = sub_1C9F08168();
    if (!OUTLINED_FUNCTION_96(v10))
    {

      OUTLINED_FUNCTION_146();
      OUTLINED_FUNCTION_130();
      goto LABEL_15;
    }
    uint64_t v11 = (_DWORD *)OUTLINED_FUNCTION_29();
    uint64_t v12 = OUTLINED_FUNCTION_28();
    OUTLINED_FUNCTION_256(v12);
    *uint64_t v11 = 136315394;
    swift_bridgeObjectRetain();
    OUTLINED_FUNCTION_78();
    OUTLINED_FUNCTION_166();
    OUTLINED_FUNCTION_120();
    OUTLINED_FUNCTION_337();
    v20[2] = sub_1C9F01420(v1, v0, &v21);
    OUTLINED_FUNCTION_166();
    OUTLINED_FUNCTION_194();
    OUTLINED_FUNCTION_122(&dword_1C9EC7000, v13, v14, "No active session for assistantId: %s, cannot send voice command context for requestId: %s");
    OUTLINED_FUNCTION_133();
    OUTLINED_FUNCTION_1();
    OUTLINED_FUNCTION_1();
    goto LABEL_12;
  }
  v20[1] = v20;
  v20[0] = v4;
  MEMORY[0x1F4188790](v4);
  id v5 = objc_allocWithZone((Class)sub_1C9F06F18());
  OUTLINED_FUNCTION_80();
  uint64_t v6 = (void *)sub_1C9F06E48();
  if (!v6)
  {
    if (qword_1EBC7F680 != -1) {
      swift_once();
    }
    uint64_t v15 = sub_1C9F07E78();
    OUTLINED_FUNCTION_47_0(v15, (uint64_t)qword_1EBC7FEF0);
    uint64_t v9 = (void *)sub_1C9F07E68();
    os_log_type_t v16 = sub_1C9F08168();
    if (!OUTLINED_FUNCTION_21(v16))
    {

      OUTLINED_FUNCTION_146();
      swift_release();
      goto LABEL_15;
    }
    OUTLINED_FUNCTION_7();
    uint64_t v21 = OUTLINED_FUNCTION_11_3();
    OUTLINED_FUNCTION_340(4.8149e-34);
    uint64_t v17 = sub_1C9F01420(v1, v0, &v21);
    OUTLINED_FUNCTION_69(v17);
    OUTLINED_FUNCTION_88();
    OUTLINED_FUNCTION_1_3(&dword_1C9EC7000, v18, v19, "Failed to create a VoiceCommandContextMessage for requestId %s");
    OUTLINED_FUNCTION_147();
    OUTLINED_FUNCTION_1();
    OUTLINED_FUNCTION_1();
    swift_release();
LABEL_12:

    goto LABEL_15;
  }
  uint64_t v7 = v6;
  sub_1C9ED0FAC(v6);
  swift_release();

LABEL_15:
  OUTLINED_FUNCTION_11_1();
}

uint64_t sub_1C9EF68FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14, void *a15, void *a16, void *a17)
{
  v27[0] = a4;
  v27[1] = a5;
  id v28 = a13;
  id v29 = a14;
  v27[5] = a11;
  v27[3] = a7;
  v27[4] = a12;
  v27[2] = a9;
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC7F020);
  MEMORY[0x1F4188790](v17 - 8);
  uint64_t v19 = (char *)v27 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC7FCF0);
  MEMORY[0x1F4188790](v20 - 8);
  uint64_t v22 = (char *)v27 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = *MEMORY[0x1E4FA22F8];
  uint64_t v24 = sub_1C9F07A48();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v24 - 8) + 104))(v22, v23, v24);
  __swift_storeEnumTagSinglePayload((uint64_t)v22, 0, 1, v24);
  sub_1C9F06ED8();
  swift_bridgeObjectRetain();
  sub_1C9F06E88();
  uint64_t v25 = sub_1C9F069B8();
  (*(void (**)(char *, void, uint64_t))(*(void *)(v25 - 8) + 16))(v19, v27[0], v25);
  __swift_storeEnumTagSinglePayload((uint64_t)v19, 0, 1, v25);
  sub_1C9F06EF8();
  swift_bridgeObjectRetain();
  sub_1C9F06EE8();
  swift_bridgeObjectRetain();
  sub_1C9F06E78();
  swift_bridgeObjectRetain();
  sub_1C9F06E98();
  swift_bridgeObjectRetain();
  sub_1C9F06EA8();
  if (v28) {
    objc_msgSend(v28, sel_BOOLValue);
  }
  sub_1C9F06EC8();
  if (v29) {
    objc_msgSend(v29, sel_BOOLValue);
  }
  sub_1C9F06EB8();
  if (a15) {
    objc_msgSend(a15, sel_BOOLValue);
  }
  sub_1C9F06E68();
  if (a16) {
    objc_msgSend(a16, sel_BOOLValue);
  }
  sub_1C9F06E58();
  if (a17) {
    objc_msgSend(a17, sel_BOOLValue);
  }
  return sub_1C9F06F08();
}

void sub_1C9EF6BD4()
{
  OUTLINED_FUNCTION_14_1();
  uint64_t v3 = v0;
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  char v8 = sub_1C9F07E58();
  OUTLINED_FUNCTION_0();
  os_log_type_t v10 = v9;
  uint64_t v12 = *(void *)(v11 + 64);
  MEMORY[0x1F4188790](v13);
  uint64_t v26 = (char *)v25 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  OUTLINED_FUNCTION_76();
  MEMORY[0x1F4188790](v14);
  OUTLINED_FUNCTION_30_1();
  MEMORY[0x1F4188790](v15);
  OUTLINED_FUNCTION_327();
  MEMORY[0x1F4188790](v16);
  OUTLINED_FUNCTION_329();
  v30[4] = v7;
  void v30[5] = v5;
  sub_1C9ECFD44();
  uint64_t v29 = v2;
  OUTLINED_FUNCTION_27_1();
  OUTLINED_FUNCTION_182();
  v25[1] = v17 | 0x8000000000000000;
  uint64_t v27 = v1;
  OUTLINED_FUNCTION_211();
  uint64_t v28 = *(void *)(v3 + OBJC_IVAR___SRDRequestDispatcherInternal_rdmbQueue);
  uint64_t v18 = (void (*)(void))v10[2];
  OUTLINED_FUNCTION_18_2();
  v18();
  uint64_t v19 = v26;
  OUTLINED_FUNCTION_18_2();
  v18();
  OUTLINED_FUNCTION_7_4();
  uint64_t v20 = swift_allocObject();
  uint64_t v21 = (void (*)(void))v10[4];
  OUTLINED_FUNCTION_17_2();
  v21();
  OUTLINED_FUNCTION_17_2();
  v21();
  *(uint64_t *)((char *)&type metadata for Logger.Kind + v20) = 0xD000000000000042;
  OUTLINED_FUNCTION_92((uint64_t)&type metadata for Logger + v20);
  char *v22 = sub_1C9EFA198;
  v22[1] = (void (*)())v30;
  uint64_t v23 = OUTLINED_FUNCTION_7_1();
  *(void *)(v23 + 16) = sub_1C9EF9C40;
  *(void *)(v23 + 24) = v20;
  v31[4] = sub_1C9EFBBDC;
  v31[5] = v23;
  v31[0] = MEMORY[0x1E4F143A8];
  OUTLINED_FUNCTION_33_0(COERCE_DOUBLE(1107296256));
  v31[2] = sub_1C9EDF214;
  void v31[3] = &block_descriptor_311;
  _Block_copy(v31);
  OUTLINED_FUNCTION_53();
  swift_release();
  OUTLINED_FUNCTION_307();
  _Block_release(v19);
  uint64_t v24 = (void (*)(void))v10[1];
  OUTLINED_FUNCTION_13_2();
  v24();
  OUTLINED_FUNCTION_13_2();
  v24();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_40_0();
  swift_release();
  if (v8) {
    __break(1u);
  }
  else {
    OUTLINED_FUNCTION_11_1();
  }
}

void sub_1C9EF6EF0()
{
  OUTLINED_FUNCTION_14_1();
  OUTLINED_FUNCTION_274();
  uint64_t v1 = sub_1C9F07E78();
  OUTLINED_FUNCTION_0();
  MEMORY[0x1F4188790](v2);
  OUTLINED_FUNCTION_20_1();
  uint64_t v3 = OUTLINED_FUNCTION_195();
  sub_1C9EFEEF8(v3, v4);
  if (v5)
  {
    MEMORY[0x1F4188790](v5);
    id v6 = objc_allocWithZone((Class)sub_1C9F078D8());
    OUTLINED_FUNCTION_80();
    uint64_t v7 = (void *)sub_1C9F07888();
    if (v7)
    {
      char v8 = v7;
      sub_1C9ED0FAC(v7);
      swift_release();
    }
    else
    {
      if (qword_1EBC7F680 != -1) {
        swift_once();
      }
      OUTLINED_FUNCTION_5_2(v1, (uint64_t)qword_1EBC7FEF0);
      uint64_t v22 = sub_1C9F07E68();
      os_log_type_t v23 = sub_1C9F08168();
      if (OUTLINED_FUNCTION_254(v23))
      {
        uint64_t v24 = (_DWORD *)OUTLINED_FUNCTION_7();
        uint64_t v25 = OUTLINED_FUNCTION_11_3();
        OUTLINED_FUNCTION_40(v25);
        *uint64_t v24 = 136315138;
        swift_bridgeObjectRetain();
        uint64_t v26 = OUTLINED_FUNCTION_21_1();
        OUTLINED_FUNCTION_6_2(v26);
        OUTLINED_FUNCTION_26_0();
        OUTLINED_FUNCTION_57(&dword_1C9EC7000, v22, v0, "Failed to create a AnnounceNotificationHandlingStateUpdatedMessage for assistantId %s");
        OUTLINED_FUNCTION_7_3();
        OUTLINED_FUNCTION_1();
        OUTLINED_FUNCTION_1();
        swift_release();
      }
      else
      {

        OUTLINED_FUNCTION_27_0();
        swift_release();
      }
    }
    goto LABEL_15;
  }
  if (qword_1EBC7F680 != -1) {
    swift_once();
  }
  __swift_project_value_buffer(v1, (uint64_t)qword_1EBC7FEF0);
  OUTLINED_FUNCTION_8_1();
  v9();
  OUTLINED_FUNCTION_163();
  os_log_type_t v10 = sub_1C9F07E68();
  os_log_type_t v11 = sub_1C9F08168();
  if (!os_log_type_enabled(v10, v11))
  {

    OUTLINED_FUNCTION_27_0();
    OUTLINED_FUNCTION_239();
    v27();
    goto LABEL_15;
  }
  uint64_t v12 = OUTLINED_FUNCTION_29();
  OUTLINED_FUNCTION_28();
  *(_DWORD *)uint64_t v12 = 136315394;
  swift_bridgeObjectRetain();
  uint64_t v13 = OUTLINED_FUNCTION_21_1();
  OUTLINED_FUNCTION_246(v13);
  sub_1C9F08228();
  OUTLINED_FUNCTION_26_0();
  *(_WORD *)(v12 + 12) = 2080;
  id v14 = (id)AFExternalNotificationRequestHandlerStateGetName();
  if (v14)
  {
    uint64_t v15 = v14;
    sub_1C9F07FE8();
    unint64_t v17 = v16;

    uint64_t v18 = OUTLINED_FUNCTION_290();
    uint64_t v20 = sub_1C9F01420(v18, v17, v19);
    OUTLINED_FUNCTION_248(v20);
    sub_1C9F08228();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1C9EC7000, v10, v11, "No active session for assistantId: %s, cannot update announce notification handling state: %s", (uint8_t *)v12, 0x16u);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_1();
    OUTLINED_FUNCTION_1();

    OUTLINED_FUNCTION_230();
    OUTLINED_FUNCTION_1_0();
    v21();
LABEL_15:
    OUTLINED_FUNCTION_11_1();
    return;
  }
  __break(1u);
}

uint64_t sub_1C9EF72C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC7F020);
  MEMORY[0x1F4188790](v5 - 8);
  uint64_t v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC7FCF0);
  MEMORY[0x1F4188790](v8 - 8);
  os_log_type_t v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = *MEMORY[0x1E4FA22F8];
  uint64_t v12 = sub_1C9F07A48();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v12 - 8) + 104))(v10, v11, v12);
  __swift_storeEnumTagSinglePayload((uint64_t)v10, 0, 1, v12);
  sub_1C9F078B8();
  swift_bridgeObjectRetain();
  sub_1C9F078A8();
  uint64_t v13 = sub_1C9F069B8();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v13 - 8) + 16))(v7, a4, v13);
  __swift_storeEnumTagSinglePayload((uint64_t)v7, 0, 1, v13);
  sub_1C9F078C8();
  return sub_1C9F07898();
}

void sub_1C9EF748C()
{
  OUTLINED_FUNCTION_267();
  uint64_t v2 = v1;
  if (qword_1EBC7F680 != -1) {
    swift_once();
  }
  uint64_t v3 = sub_1C9F07E78();
  OUTLINED_FUNCTION_313(v3, (uint64_t)qword_1EBC7FEF0);
  id v4 = v2;
  uint64_t v5 = sub_1C9F07E68();
  os_log_type_t v6 = sub_1C9F08158();
  if (OUTLINED_FUNCTION_254(v6))
  {
    uint64_t v7 = swift_slowAlloc();
    uint64_t v8 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v7 = 138412546;
    id v9 = v4;
    OUTLINED_FUNCTION_352();
    sub_1C9F08228();
    void *v8 = v4;

    *(_WORD *)(v7 + 12) = 1024;
    sub_1C9F08228();
    _os_log_impl(&dword_1C9EC7000, v5, v0, "Received MultiUserInfo command: %@, isRMVEnabled=%{BOOL}d", (uint8_t *)v7, 0x12u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC7FEC0);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_1();
    OUTLINED_FUNCTION_1();
  }
  else
  {
  }
  os_log_type_t v10 = (void *)sub_1C9F07E68();
  os_log_type_t v11 = sub_1C9F08168();
  if (OUTLINED_FUNCTION_5(v11))
  {
    uint64_t v12 = (_WORD *)OUTLINED_FUNCTION_1_2();
    OUTLINED_FUNCTION_4_2(v12);
    OUTLINED_FUNCTION_196(&dword_1C9EC7000, v13, v14, "Ignoring MultiUserInfo on this device platform");
    OUTLINED_FUNCTION_1();
  }

  OUTLINED_FUNCTION_164();
}

void sub_1C9EF76CC()
{
  OUTLINED_FUNCTION_14_1();
  unint64_t v2 = v1;
  uint64_t v4 = v3;
  sub_1C9F07BF8();
  OUTLINED_FUNCTION_0();
  uint64_t v6 = v5;
  MEMORY[0x1F4188790](v7);
  OUTLINED_FUNCTION_142();
  sub_1C9EFEEF8(v4, v2);
  if (v8)
  {
    id v9 = *(void (**)(uint64_t))(v6 + 104);
    uint64_t v10 = OUTLINED_FUNCTION_226();
    v9(v10);
    char v11 = sub_1C9EFDE68();
    uint64_t v12 = *(void (**)(void))(v6 + 8);
    OUTLINED_FUNCTION_239();
    v12();
    if ((v11 & 1) == 0)
    {
      if (qword_1EBC7F680 != -1) {
        swift_once();
      }
      uint64_t v13 = sub_1C9F07E78();
      uint64_t v14 = OUTLINED_FUNCTION_2_2(v13, (uint64_t)qword_1EBC7FEF0);
      os_log_type_t v15 = sub_1C9F08168();
      if (OUTLINED_FUNCTION_191(v15))
      {
        uint64_t v29 = v14;
        os_log_type_t v28 = v0;
        unint64_t v16 = (_DWORD *)OUTLINED_FUNCTION_7();
        uint64_t v30 = OUTLINED_FUNCTION_11_3();
        *unint64_t v16 = 136315138;
        uint64_t v17 = OUTLINED_FUNCTION_226();
        v9(v17);
        uint64_t v18 = sub_1C9F07BE8();
        unint64_t v20 = v19;
        OUTLINED_FUNCTION_239();
        v12();
        uint64_t v21 = sub_1C9F01420(v18, v20, &v30);
        OUTLINED_FUNCTION_60(v21);
        sub_1C9F08228();
        swift_bridgeObjectRelease();
        OUTLINED_FUNCTION_304(&dword_1C9EC7000, v29, v28, "Current session is not of type %s, cannot start speech request");
        swift_arrayDestroy();
        OUTLINED_FUNCTION_1();
        OUTLINED_FUNCTION_1();
        swift_release();
      }
      else
      {

        swift_release();
      }
    }
  }
  else
  {
    if (qword_1EBC7F680 != -1) {
      swift_once();
    }
    uint64_t v22 = sub_1C9F07E78();
    __swift_project_value_buffer(v22, (uint64_t)qword_1EBC7FEF0);
    OUTLINED_FUNCTION_121();
    OUTLINED_FUNCTION_163();
    os_log_type_t v23 = sub_1C9F07E68();
    os_log_type_t v24 = sub_1C9F08178();
    if (os_log_type_enabled(v23, v24))
    {
      uint64_t v25 = (uint8_t *)OUTLINED_FUNCTION_29();
      uint64_t v26 = OUTLINED_FUNCTION_28();
      OUTLINED_FUNCTION_40(v26);
      *(_DWORD *)uint64_t v25 = 136315394;
      swift_bridgeObjectRetain();
      uint64_t v27 = sub_1C9F01420(v4, v2, &v30);
      OUTLINED_FUNCTION_246(v27);
      sub_1C9F08228();
      OUTLINED_FUNCTION_120();
      OUTLINED_FUNCTION_269();
      swift_bridgeObjectRetain();
      OUTLINED_FUNCTION_21_1();
      sub_1C9F08228();
      OUTLINED_FUNCTION_26_0();
      _os_log_impl(&dword_1C9EC7000, v23, v24, "No active session for assistantId: %s cannot start a request for request id: %s", v25, 0x16u);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_1();
      OUTLINED_FUNCTION_1();
    }
    else
    {

      OUTLINED_FUNCTION_27_0();
      OUTLINED_FUNCTION_130();
    }
  }
  OUTLINED_FUNCTION_11_1();
}

void sub_1C9EF7A80()
{
  OUTLINED_FUNCTION_14_1();
  uint64_t v3 = v2;
  sub_1C9F07F38();
  OUTLINED_FUNCTION_0();
  MEMORY[0x1F4188790](v4);
  OUTLINED_FUNCTION_272();
  uint64_t v5 = *(void **)(v0 + OBJC_IVAR___SRDRequestDispatcherInternal_rdmbQueue);
  void *v1 = v5;
  OUTLINED_FUNCTION_127();
  v6();
  id v7 = v5;
  LOBYTE(v5) = sub_1C9F07F58();
  OUTLINED_FUNCTION_149();
  v8();
  if ((v5 & 1) == 0)
  {
    __break(1u);
LABEL_41:
    swift_once();
    goto LABEL_11;
  }
  OUTLINED_FUNCTION_200((void *)(v0 + OBJC_IVAR___SRDRequestDispatcherInternal_featureChecker), *(void *)(v0 + OBJC_IVAR___SRDRequestDispatcherInternal_featureChecker + 24));
  OUTLINED_FUNCTION_315();
  if (sub_1C9F07D48())
  {
    sub_1C9EFADA4(v0 + OBJC_IVAR___SRDRequestDispatcherInternal_activeUserSessionObserver, (uint64_t)&v59, (uint64_t *)&unk_1EA5CEC60);
    if (v60)
    {
      sub_1C9EFAC6C(&v59, (uint64_t)v61);
      __swift_project_boxed_opaque_existential_1(v61, v61[3]);
      uint64_t v9 = OUTLINED_FUNCTION_315();
      uint64_t v11 = v10(v9);
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = (uint64_t *)(v3 + OBJC_IVAR____TtC14SiriMessageBus7Session_activeUserPersonaId);
        unint64_t v15 = *(void *)(v3 + OBJC_IVAR____TtC14SiriMessageBus7Session_activeUserPersonaId + 8);
        if (v15)
        {
          uint64_t v16 = *v14;
          swift_bridgeObjectRetain();
          swift_bridgeObjectRelease();
          if (qword_1EBC7F680 != -1) {
            swift_once();
          }
          uint64_t v17 = sub_1C9F07E78();
          __swift_project_value_buffer(v17, (uint64_t)qword_1EBC7FEF0);
          swift_bridgeObjectRetain();
          uint64_t v18 = sub_1C9F07E68();
          os_log_type_t v19 = sub_1C9F08168();
          if (!OUTLINED_FUNCTION_238(v19))
          {

            OUTLINED_FUNCTION_132();
            goto LABEL_38;
          }
          unint64_t v20 = (_DWORD *)OUTLINED_FUNCTION_7();
          *(void *)&long long v59 = OUTLINED_FUNCTION_11_3();
          _DWORD *v20 = 136315138;
          swift_bridgeObjectRetain();
          uint64_t v21 = sub_1C9F01420(v16, v15, (uint64_t *)&v59);
          OUTLINED_FUNCTION_294(v21);
          sub_1C9F08228();
          OUTLINED_FUNCTION_150();
          OUTLINED_FUNCTION_57(&dword_1C9EC7000, v18, (os_log_type_t)v3, "#user-session: Not posting ActiveUserSessionDetectedMessage. A personaId=%s already exists for the session.");
          OUTLINED_FUNCTION_168();
          OUTLINED_FUNCTION_1();
          goto LABEL_24;
        }
        uint64_t v38 = v11;
        if (qword_1EBC7F680 != -1) {
          swift_once();
        }
        uint64_t v39 = sub_1C9F07E78();
        __swift_project_value_buffer(v39, (uint64_t)qword_1EBC7FEF0);
        uint64_t v40 = sub_1C9F07E68();
        os_log_type_t v41 = sub_1C9F08158();
        if (os_log_type_enabled(v40, v41))
        {
          uint64_t v42 = (uint8_t *)OUTLINED_FUNCTION_1_2();
          *(_WORD *)uint64_t v42 = 0;
          _os_log_impl(&dword_1C9EC7000, v40, v41, "#user-session: Updating session with activeUserId", v42, 2u);
          OUTLINED_FUNCTION_1();
        }

        *uint64_t v14 = v38;
        v14[1] = v13;
        swift_bridgeObjectRetain();
        uint64_t v43 = swift_bridgeObjectRelease();
        MEMORY[0x1F4188790](v43);
        id v44 = objc_allocWithZone((Class)sub_1C9F072E8());
        OUTLINED_FUNCTION_80();
        uint64_t v45 = (void *)sub_1C9F07298();
        swift_bridgeObjectRelease();
        if (v45)
        {
          id v46 = v45;
          uint64_t v47 = (void *)sub_1C9F07E68();
          os_log_type_t v48 = sub_1C9F08158();
          if (OUTLINED_FUNCTION_180(v48))
          {
            uint64_t v49 = (_DWORD *)OUTLINED_FUNCTION_7();
            *(void *)&long long v59 = OUTLINED_FUNCTION_11_3();
            *uint64_t v49 = 136315138;
            id v50 = objc_msgSend(v46, sel_debugDescription, v49 + 1);
            uint64_t v51 = sub_1C9F07FE8();
            unint64_t v53 = v52;

            uint64_t v54 = sub_1C9F01420(v51, v53, (uint64_t *)&v59);
            OUTLINED_FUNCTION_294(v54);
            sub_1C9F08228();

            swift_bridgeObjectRelease();
            OUTLINED_FUNCTION_311(&dword_1C9EC7000, v55, v56, "#user-session: Posting message=%s");
            swift_arrayDestroy();
            OUTLINED_FUNCTION_1();
            OUTLINED_FUNCTION_1();
          }
          else
          {
          }
          sub_1C9ED0FAC(v46);

          goto LABEL_38;
        }
        uint64_t v18 = sub_1C9F07E68();
        os_log_type_t v57 = sub_1C9F08158();
        if (!OUTLINED_FUNCTION_5(v57)) {
          goto LABEL_25;
        }
        uint64_t v58 = (_WORD *)OUTLINED_FUNCTION_1_2();
        OUTLINED_FUNCTION_4_2(v58);
        uint64_t v37 = "#user-session: unable to post UserSessionActiveStatusMessage. Failure constructing msg";
      }
      else
      {
        if (qword_1EBC7F680 != -1) {
          swift_once();
        }
        uint64_t v32 = sub_1C9F07E78();
        uint64_t v18 = OUTLINED_FUNCTION_2_2(v32, (uint64_t)qword_1EBC7FEF0);
        os_log_type_t v33 = sub_1C9F08158();
        if (!OUTLINED_FUNCTION_5(v33)) {
          goto LABEL_25;
        }
        uint64_t v34 = (_WORD *)OUTLINED_FUNCTION_1_2();
        OUTLINED_FUNCTION_4_2(v34);
        uint64_t v37 = "#user-session: Not posting ActiveUserSessionDetectedMessage. We are in Ambient mode";
      }
      OUTLINED_FUNCTION_196(&dword_1C9EC7000, v35, v36, v37);
LABEL_24:
      OUTLINED_FUNCTION_1();
LABEL_25:

LABEL_38:
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v61);
      goto LABEL_39;
    }
    sub_1C9EFB940((uint64_t)&v59, (uint64_t *)&unk_1EA5CEC60);
    if (qword_1EBC7F680 != -1) {
      swift_once();
    }
    uint64_t v29 = sub_1C9F07E78();
    os_log_type_t v23 = (void *)OUTLINED_FUNCTION_2_2(v29, (uint64_t)qword_1EBC7FEF0);
    os_log_type_t v30 = sub_1C9F08158();
    if (OUTLINED_FUNCTION_5(v30))
    {
      uint64_t v31 = (_WORD *)OUTLINED_FUNCTION_1_2();
      OUTLINED_FUNCTION_4_2(v31);
      os_log_type_t v28 = "#user-session: activeUserSessionObserver is nil";
      goto LABEL_17;
    }
    goto LABEL_18;
  }
  if (qword_1EBC7F680 != -1) {
    goto LABEL_41;
  }
LABEL_11:
  uint64_t v22 = sub_1C9F07E78();
  os_log_type_t v23 = (void *)OUTLINED_FUNCTION_2_2(v22, (uint64_t)qword_1EBC7FEF0);
  os_log_type_t v24 = sub_1C9F08158();
  if (OUTLINED_FUNCTION_5(v24))
  {
    uint64_t v25 = (_WORD *)OUTLINED_FUNCTION_1_2();
    OUTLINED_FUNCTION_4_2(v25);
    os_log_type_t v28 = "#user-session: Not posting ActiveUserSessionDetectedMessage. Feature flag is turned off";
LABEL_17:
    OUTLINED_FUNCTION_196(&dword_1C9EC7000, v26, v27, v28);
    OUTLINED_FUNCTION_1();
  }
LABEL_18:

LABEL_39:
  OUTLINED_FUNCTION_11_1();
}

uint64_t sub_1C9EF8138(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC7FCF0);
  MEMORY[0x1F4188790](v7 - 8);
  uint64_t v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC7F020);
  MEMORY[0x1F4188790](v10 - 8);
  uint64_t v12 = (char *)&v18 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_bridgeObjectRetain();
  sub_1C9F072A8();
  swift_bridgeObjectRetain();
  sub_1C9F072B8();
  uint64_t v13 = a6 + OBJC_IVAR____TtC14SiriMessageBus7Session_sessionId;
  uint64_t v14 = sub_1C9F069B8();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v14 - 8) + 16))(v12, v13, v14);
  __swift_storeEnumTagSinglePayload((uint64_t)v12, 0, 1, v14);
  sub_1C9F072D8();
  uint64_t v15 = *MEMORY[0x1E4FA22F8];
  uint64_t v16 = sub_1C9F07A48();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v16 - 8) + 104))(v9, v15, v16);
  __swift_storeEnumTagSinglePayload((uint64_t)v9, 0, 1, v16);
  return sub_1C9F072C8();
}

id RequestDispatcher.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void RequestDispatcher.init()()
{
}

id RequestDispatcher.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for RequestDispatcher();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_1C9EF84D4(uint64_t a1, uint64_t a2)
{
  return a2 & a1;
}

uint64_t sub_1C9EF84DC(uint64_t result)
{
  *v1 &= result;
  return result;
}

BOOL sub_1C9EF84EC(uint64_t a1, uint64_t a2)
{
  return (a2 & ~a1) == 0;
}

BOOL sub_1C9EF84F8(uint64_t a1, uint64_t a2)
{
  return (a1 & ~a2) == 0;
}

uint64_t sub_1C9EF8504(uint64_t result, unsigned char **a2)
{
  objc_super v2 = *a2;
  *objc_super v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_1C9EF8514(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

uint64_t sub_1C9EF8550()
{
  sub_1C9F07BF8();
  swift_arrayDestroy();
  return MEMORY[0x1F4186488](v0, 32, 7);
}

void *sub_1C9EF85CC()
{
  uint64_t v1 = *v0;
  uint64_t result = (void *)swift_isUniquelyReferenced_nonNull_native();
  uint64_t *v0 = v1;
  if (!result)
  {
    uint64_t result = sub_1C9EF874C(result, *(void *)(v1 + 16) + 1, 1, v1, &qword_1EBC7F858, (void (*)(void, uint64_t, void *, uint64_t))sub_1C9EF8B58, (void (*)(uint64_t, uint64_t, void *))sub_1C9EF8F94);
    uint64_t *v0 = (uint64_t)result;
  }
  return result;
}

uint64_t sub_1C9EF8648(uint64_t result)
{
  if (result + 1 > *(void *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
    return sub_1C9F08128();
  }
  return result;
}

void *sub_1C9EF8674(void *result)
{
  unint64_t v2 = *(void *)(*v1 + 24);
  if ((uint64_t)result + 1 > (uint64_t)(v2 >> 1))
  {
    uint64_t result = sub_1C9EF874C((void *)(v2 > 1), (int64_t)result + 1, 1, *v1, &qword_1EBC7F858, (void (*)(void, uint64_t, void *, uint64_t))sub_1C9EF8B58, (void (*)(uint64_t, uint64_t, void *))sub_1C9EF8F94);
    uint64_t *v1 = (uint64_t)result;
  }
  return result;
}

void *sub_1C9EF86E4(void *a1, int64_t a2, char a3, uint64_t a4)
{
  return sub_1C9EF874C(a1, a2, a3, a4, &qword_1EBC7FE78, (void (*)(void, uint64_t, void *, uint64_t))sub_1C9EF8A40, (void (*)(uint64_t, uint64_t, void *))sub_1C9EF8F00);
}

void *sub_1C9EF8718(void *a1, int64_t a2, char a3, uint64_t a4)
{
  return sub_1C9EF874C(a1, a2, a3, a4, &qword_1EBC7F858, (void (*)(void, uint64_t, void *, uint64_t))sub_1C9EF8B58, (void (*)(uint64_t, uint64_t, void *))sub_1C9EF8F94);
}

void *sub_1C9EF874C(void *result, int64_t a2, char a3, uint64_t a4, uint64_t *a5, void (*a6)(void, uint64_t, void *, uint64_t), void (*a7)(uint64_t, uint64_t, void *))
{
  char v10 = (char)result;
  if (a3)
  {
    unint64_t v11 = *(void *)(a4 + 24);
    int64_t v12 = v11 >> 1;
    if ((uint64_t)(v11 >> 1) < a2)
    {
      if (v12 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      int64_t v12 = v11 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v11 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v12 = a2;
      }
    }
  }
  else
  {
    int64_t v12 = a2;
  }
  uint64_t v13 = *(void *)(a4 + 16);
  if (v12 <= v13) {
    uint64_t v14 = *(void *)(a4 + 16);
  }
  else {
    uint64_t v14 = v12;
  }
  if (v14)
  {
    __swift_instantiateConcreteTypeFromMangledName(a5);
    uint64_t v15 = (void *)swift_allocObject();
    size_t v16 = _swift_stdlib_malloc_size(v15);
    void v15[2] = v13;
    v15[3] = 2 * ((uint64_t)(v16 - 32) / 16);
  }
  else
  {
    uint64_t v15 = (void *)MEMORY[0x1E4FBC860];
  }
  uint64_t v17 = v15 + 4;
  if (v10)
  {
    a7(a4 + 32, v13, v17);
    *(void *)(a4 + 16) = 0;
    swift_bridgeObjectRelease();
  }
  else
  {
    a6(0, v13, v17, a4);
  }
  return v15;
}

char *sub_1C9EF8850(char *result, int64_t a2, char a3, uint64_t a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *(void *)(a4 + 24);
    uint64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        uint64_t v7 = a2;
      }
    }
  }
  else
  {
    uint64_t v7 = a2;
  }
  uint64_t v8 = *(void *)(a4 + 16);
  if (v7 <= v8) {
    uint64_t v9 = *(void *)(a4 + 16);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC7FE88);
    char v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 40);
  }
  else
  {
    char v10 = (char *)MEMORY[0x1E4FBC860];
  }
  int64_t v12 = v10 + 32;
  if (v5)
  {
    sub_1C9EF9004((char *)(a4 + 32), v8, v12);
    *(void *)(a4 + 16) = 0;
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_1C9EF8C50(0, v8, (unint64_t)v12, a4);
  }
  return v10;
}

char *sub_1C9EF8948(char *result, int64_t a2, char a3, uint64_t a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *(void *)(a4 + 24);
    uint64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        uint64_t v7 = a2;
      }
    }
  }
  else
  {
    uint64_t v7 = a2;
  }
  uint64_t v8 = *(void *)(a4 + 16);
  if (v7 <= v8) {
    uint64_t v9 = *(void *)(a4 + 16);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC7FE80);
    char v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 56);
  }
  else
  {
    char v10 = (char *)MEMORY[0x1E4FBC860];
  }
  int64_t v12 = v10 + 32;
  if (v5)
  {
    sub_1C9EF909C((char *)(a4 + 32), v8, v12);
    *(void *)(a4 + 16) = 0;
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_1C9EF8D70(0, v8, (unint64_t)v12, a4);
  }
  return v10;
}

uint64_t sub_1C9EF8A40(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 16 * a1 + 32;
    unint64_t v6 = a3 + 16 * v4;
    if (v5 >= v6 || v5 + 16 * v4 <= a3)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC7FD60);
      swift_arrayInitWithCopy();
      swift_bridgeObjectRelease();
      return v6;
    }
  }
  uint64_t result = sub_1C9F08338();
  __break(1u);
  return result;
}

uint64_t sub_1C9EF8B58(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 16 * a1 + 32;
    unint64_t v6 = a3 + 16 * v4;
    if (v5 >= v6 || v5 + 16 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      swift_bridgeObjectRelease();
      return v6;
    }
  }
  uint64_t result = sub_1C9F08338();
  __break(1u);
  return result;
}

uint64_t sub_1C9EF8C50(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 40 * a1 + 32;
    unint64_t v6 = a3 + 40 * v4;
    if (v5 >= v6 || v5 + 40 * v4 <= a3)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC7FDC0);
      swift_arrayInitWithCopy();
      swift_bridgeObjectRelease();
      return v6;
    }
  }
  uint64_t result = sub_1C9F08338();
  __break(1u);
  return result;
}

uint64_t sub_1C9EF8D70(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 56 * a1 + 32;
    unint64_t v6 = a3 + 56 * v4;
    if (v5 >= v6 || v5 + 56 * v4 <= a3)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC7FDB8);
      swift_arrayInitWithCopy();
      swift_bridgeObjectRelease();
      return v6;
    }
  }
  uint64_t result = sub_1C9F08338();
  __break(1u);
  return result;
}

char *sub_1C9EF8E94(char *__src, size_t __len, char *__dst)
{
  if ((__len & 0x8000000000000000) != 0)
  {
    OUTLINED_FUNCTION_263();
    __src = (char *)OUTLINED_FUNCTION_261();
    __break(1u);
  }
  else if (__dst != __src || &__src[__len] <= __dst)
  {
    return (char *)memmove(__dst, __src, __len);
  }
  return __src;
}

char *sub_1C9EF8F00(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    __src = (char *)sub_1C9F08338();
    __break(1u);
  }
  else if (__dst != __src || &__src[16 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 16 * a2);
  }
  return __src;
}

char *sub_1C9EF8F94(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    OUTLINED_FUNCTION_263();
    __src = (char *)OUTLINED_FUNCTION_261();
    __break(1u);
  }
  else if (__dst != __src || &__src[16 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 16 * a2);
  }
  return __src;
}

char *sub_1C9EF9004(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    __src = (char *)sub_1C9F08338();
    __break(1u);
  }
  else if (__dst != __src || &__src[40 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 40 * a2);
  }
  return __src;
}

char *sub_1C9EF909C(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    __src = (char *)sub_1C9F08338();
    __break(1u);
  }
  else if (__dst != __src || &__src[56 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 56 * a2);
  }
  return __src;
}

unsigned char **sub_1C9EF9138(unsigned char **result, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v4 = *result;
  *uint64_t v4 = a4;
  *uint64_t result = v4 + 1;
  return result;
}

uint64_t sub_1C9EF9148()
{
  return sub_1C9F08228();
}

uint64_t sub_1C9EF9170(void *a1)
{
  return sub_1C9EF91EC(a1, (SEL *)&selRef_encodedClassName);
}

uint64_t sub_1C9EF917C(void *a1)
{
  return sub_1C9EF91EC(a1, (SEL *)&selRef_aceId);
}

void sub_1C9EF9188(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = (id)sub_1C9F07FD8();
  swift_bridgeObjectRelease();
  objc_msgSend(a3, sel_setAceId_, v4);
}

uint64_t sub_1C9EF91EC(void *a1, SEL *a2)
{
  id v2 = [a1 *a2];
  if (!v2) {
    return 0;
  }
  uint64_t v3 = v2;
  uint64_t v4 = sub_1C9F07FE8();

  return v4;
}

char *sub_1C9EF924C(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v60 = a2;
  uint64_t v5 = *a3;
  uint64_t v67 = sub_1C9F07E98();
  uint64_t v66 = *(void *)(v67 - 8);
  MEMORY[0x1F4188790](v67);
  uint64_t v65 = (char *)&v53 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_1C9F081A8();
  MEMORY[0x1F4188790](v7);
  uint64_t v8 = sub_1C9F081C8();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8);
  size_t v11 = (char *)&v53 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v62 = sub_1C9F07ED8();
  uint64_t v61 = *(void *)(v62 - 8);
  MEMORY[0x1F4188790](v62);
  uint64_t v71 = (char *)&v53 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v64 = sub_1C9F07E58();
  uint64_t v63 = *(void *)(v64 - 8);
  uint64_t v13 = *(void *)(v63 + 64);
  uint64_t v14 = MEMORY[0x1F4188790](v64);
  os_log_type_t v57 = (char *)&v53 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = MEMORY[0x1F4188790](v14);
  unint64_t v70 = (char *)&v53 - v16;
  MEMORY[0x1F4188790](v15);
  uint64_t v18 = (char *)&v53 - v17;
  v79[3] = v5;
  v79[4] = MEMORY[0x1E4FA3FE8];
  uint64_t v58 = a3;
  v79[0] = a3;
  unint64_t v19 = sub_1C9ECFD44();
  long long v59 = v18;
  unint64_t v69 = v19;
  sub_1C9F07D08();
  if (qword_1EBC7F0F0 != -1) {
    swift_once();
  }
  uint64_t v55 = qword_1EBC7FED8;
  swift_retain_n();
  swift_unknownObjectRetain();
  int v54 = AFDeviceSupportsSiriUOD();
  int v53 = AFShouldRunAsrOnServerForUOD();
  uint64_t v20 = type metadata accessor for UAFAssetSetObserverProvider();
  uint64_t v21 = swift_allocObject();
  uint64_t v75 = (void *)v20;
  uint64_t v76 = (uint64_t (*)())&off_1F2430850;
  *(void *)&long long aBlock = v21;
  type metadata accessor for AssetInstrumentationLogger();
  uint64_t v22 = swift_allocObject();
  sub_1C9ECF370(0, &qword_1EBC7F838);
  uint64_t v68 = a1;
  sub_1C9F07EA8();
  (*(void (**)(char *, void, uint64_t))(v9 + 104))(v11, *MEMORY[0x1E4FBCC68], v8);
  *(void *)&v78[0] = MEMORY[0x1E4FBC860];
  sub_1C9EFBB30(&qword_1EBC7F830, MEMORY[0x1E4FBCC10]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBC7F810);
  uint64_t v56 = MEMORY[0x1E4FBB350];
  sub_1C9EFB3B4((unint64_t *)&qword_1EBC7F820, (uint64_t *)&unk_1EBC7F810);
  sub_1C9F08278();
  *(void *)(v22 + 16) = sub_1C9F081F8();
  uint64_t v23 = v22 + OBJC_IVAR____TtC14SiriMessageBus26AssetInstrumentationLogger_currentSessionId;
  uint64_t v24 = sub_1C9F069B8();
  __swift_storeEnumTagSinglePayload(v23, 1, 1, v24);
  *(void *)(v22 + OBJC_IVAR____TtC14SiriMessageBus26AssetInstrumentationLogger_assetsForLogging) = 0;
  *(void *)(v22 + OBJC_IVAR____TtC14SiriMessageBus26AssetInstrumentationLogger_assetSetsForLogging) = 0;
  id v25 = objc_msgSend(self, sel_sharedManager);
  uint64_t v26 = (void *)sub_1C9F07FD8();
  id v27 = objc_msgSend(v25, sel_retrieveAssetSet_usages_, v26, 0);

  *(void *)(v22 + OBJC_IVAR____TtC14SiriMessageBus26AssetInstrumentationLogger_uafAssetSet) = v27;
  uint64_t v28 = v55;
  *(void *)(v22 + 24) = v55;
  *(unsigned char *)(v22 + 32) = v54;
  *(unsigned char *)(v22 + 33) = v53;
  sub_1C9EFAC6C(&aBlock, v22 + OBJC_IVAR____TtC14SiriMessageBus26AssetInstrumentationLogger_assetSetObserverProvider);
  uint64_t v29 = self;
  id v30 = objc_msgSend(v29, sel_sharedPreferences);
  id v31 = objc_msgSend(v29, sel_sharedPreferences);
  sub_1C9F07DF8();
  swift_allocObject();
  uint64_t v32 = sub_1C9F07E08();
  os_log_type_t v33 = (char *)objc_allocWithZone((Class)type metadata accessor for RequestDispatcher());
  uint64_t v34 = (uint64_t)v58;
  swift_retain();
  uint64_t v35 = (char *)sub_1C9EFB3F8(v68, v28, v22, v30, v32, v34, v33);
  uint64_t v36 = v70;
  sub_1C9F07D08();
  uint64_t v37 = *(void **)&v35[OBJC_IVAR___SRDRequestDispatcherInternal_rdmbQueue];
  uint64_t v38 = v63;
  uint64_t v39 = v57;
  uint64_t v40 = v64;
  (*(void (**)(char *, char *, uint64_t))(v63 + 16))(v57, v36, v64);
  sub_1C9EFBB78((uint64_t)v79, (uint64_t)v78);
  unint64_t v41 = (*(unsigned __int8 *)(v38 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v38 + 80);
  unint64_t v42 = (v13 + v41 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v43 = (v42 + 47) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v44 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v38 + 32))(v44 + v41, v39, v40);
  sub_1C9EFAC6C(v78, v44 + v42);
  *(void *)(v44 + v43) = v60;
  *(void *)(v44 + ((v43 + 15) & 0xFFFFFFFFFFFFFFF8)) = v35;
  uint64_t v76 = sub_1C9EFBAB0;
  uint64_t v77 = v44;
  *(void *)&long long aBlock = MEMORY[0x1E4F143A8];
  *((void *)&aBlock + 1) = 1107296256;
  uint64_t v74 = sub_1C9EDF1A8;
  uint64_t v75 = &block_descriptor_422;
  uint64_t v45 = _Block_copy(&aBlock);
  id v46 = v37;
  uint64_t v47 = v71;
  sub_1C9F07EB8();
  uint64_t v72 = MEMORY[0x1E4FBC860];
  sub_1C9EFBB30((unint64_t *)&unk_1EBC7F7E0, MEMORY[0x1E4FBCB00]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC7F7F8);
  sub_1C9EFB3B4((unint64_t *)&qword_1EBC7F800, &qword_1EBC7F7F8);
  os_log_type_t v48 = v65;
  uint64_t v49 = v67;
  sub_1C9F08278();
  MEMORY[0x1CB794A40](0, v47, v48, v45);
  _Block_release(v45);

  (*(void (**)(char *, uint64_t))(v66 + 8))(v48, v49);
  (*(void (**)(char *, uint64_t))(v61 + 8))(v47, v62);
  id v50 = *(void (**)(char *, uint64_t))(v38 + 8);
  v50(v70, v40);
  swift_release();
  uint64_t v51 = v59;
  sub_1C9F07CE8();
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v79);
  v50(v51, v40);
  return v35;
}

uint64_t sub_1C9EF9C34()
{
  return sub_1C9EE1F08(*(uint64_t **)(v0 + 16));
}

uint64_t sub_1C9EF9C48()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t block_copy_helper_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_2()
{
  return swift_release();
}

uint64_t sub_1C9EF9C88()
{
  return sub_1C9EE2270(*(void *)(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32), *(uint64_t **)(v0 + 40));
}

uint64_t sub_1C9EF9C9C()
{
  return sub_1C9EE2664(*(void *)(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32), *(BOOL **)(v0 + 40), *(void *)(v0 + 48), *(void *)(v0 + 56));
}

uint64_t sub_1C9EF9CB4()
{
  return sub_1C9EE2B98(*(void *)(v0 + 16), *(void **)(v0 + 24), *(void *)(v0 + 32), *(void *)(v0 + 40), *(void **)(v0 + 48));
}

uint64_t sub_1C9EF9CCC()
{
  return sub_1C9EF9D74((uint64_t (*)(void, void, void, void, void))sub_1C9EE338C);
}

uint64_t sub_1C9EF9CEC()
{
  return sub_1C9EFA0C8();
}

uint64_t sub_1C9EF9D0C()
{
  uint64_t v1 = OUTLINED_FUNCTION_158();
  return sub_1C9EE42FC(v1, v2, v3, v4, v5, v6, v7, v8, *(unsigned char *)(v0 + 80), *(void *)(v0 + 88));
}

uint64_t sub_1C9EF9D48()
{
  return sub_1C9EE5B50(*(unsigned char **)(v0 + 16));
}

uint64_t sub_1C9EF9D5C()
{
  return sub_1C9EF9D74((uint64_t (*)(void, void, void, void, void))sub_1C9EE6064);
}

uint64_t sub_1C9EF9D74(uint64_t (*a1)(void, void, void, void, void))
{
  return a1(v1[3], v1[4], v1[5], v1[6], v1[7]);
}

uint64_t sub_1C9EF9DB4()
{
  return sub_1C9EE6694(*(void *)(v0 + 16), *(void **)(v0 + 24));
}

uint64_t sub_1C9EF9DC4()
{
  return sub_1C9EE74C0();
}

uint64_t sub_1C9EF9DDC()
{
  return sub_1C9EFA060();
}

uint64_t sub_1C9EF9DFC()
{
  return sub_1C9EE96EC(*(void *)(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32), *(void *)(v0 + 40), *(void *)(v0 + 48), *(unsigned __int8 *)(v0 + 56), *(void *)(v0 + 64), *(void *)(v0 + 72), *(void *)(v0 + 80), *(void *)(v0 + 88));
}

void sub_1C9EF9E48()
{
}

void sub_1C9EF9E78()
{
}

uint64_t sub_1C9EF9EB4()
{
  return sub_1C9EEB854();
}

uint64_t sub_1C9EF9ECC()
{
  return sub_1C9EF9F04();
}

uint64_t sub_1C9EF9EEC()
{
  return sub_1C9EF9F04();
}

uint64_t sub_1C9EF9F04()
{
  OUTLINED_FUNCTION_259();
  return v3(v0, v1, v2);
}

uint64_t sub_1C9EF9F44()
{
  __n128 v1 = OUTLINED_FUNCTION_259();
  return sub_1C9EF064C(v2, v3, v4, v5, v6, v7, v8, v9, v1.n128_i64[0], v1.n128_i64[1], *(void *)(v0 + 96));
}

uint64_t sub_1C9EF9F7C()
{
  uint64_t v1 = OUTLINED_FUNCTION_158();
  return sub_1C9EF1418(v1, v2, v3, v4, v5, v6, v7, v8, v0[10], v0[11], v0[12], v0[13]);
}

uint64_t sub_1C9EF9FB8()
{
  return sub_1C9EFA010();
}

uint64_t sub_1C9EF9FD8()
{
  return sub_1C9EFA060();
}

uint64_t sub_1C9EF9FF8()
{
  return sub_1C9EFA010();
}

uint64_t sub_1C9EFA010()
{
  uint64_t v0 = OUTLINED_FUNCTION_342();
  return v1(v0);
}

uint64_t sub_1C9EFA048()
{
  return sub_1C9EFA060();
}

uint64_t sub_1C9EFA060()
{
  uint64_t v0 = OUTLINED_FUNCTION_158();
  return v1(v0);
}

uint64_t sub_1C9EFA09C()
{
  return sub_1C9EF4E18();
}

uint64_t sub_1C9EFA0B0()
{
  return sub_1C9EFA0C8();
}

uint64_t sub_1C9EFA0C8()
{
  uint64_t v0 = OUTLINED_FUNCTION_342();
  return v1(v0);
}

void sub_1C9EFA0FC()
{
}

void sub_1C9EFA140()
{
}

void sub_1C9EFA198()
{
}

uint64_t objectdestroyTm_0()
{
  sub_1C9F07E58();
  OUTLINED_FUNCTION_15();
  uint64_t v1 = *(void (**)(void))(v0 + 8);
  OUTLINED_FUNCTION_278();
  v1();
  OUTLINED_FUNCTION_278();
  v1();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_215();
  return MEMORY[0x1F4186498](v2, v3, v4);
}

uint64_t sub_1C9EFA290()
{
  uint64_t v1 = sub_1C9F07E58();
  OUTLINED_FUNCTION_6_0(v1);
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  uint64_t v6 = *(unsigned __int8 *)(v3 + 80);
  uint64_t v7 = (v6 + 16) & ~v6;
  uint64_t v8 = *(void *)(v5 + 64);
  uint64_t v9 = (v8 + v6 + v7) & ~v6;
  unint64_t v10 = (v8 + v9 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v11 = *(void *)(v0 + v10);
  uint64_t v12 = *(void *)(v0 + v10 + 8);
  uint64_t v13 = *(void (**)(uint64_t))(v0 + ((v10 + 23) & 0xFFFFFFFFFFFFFFF8));
  return sub_1C9EE1A50(v0 + v7, v0 + v9, v11, v12, v13);
}

uint64_t type metadata accessor for RequestDispatcher()
{
  uint64_t result = qword_1EBC7F9C8;
  if (!qword_1EBC7F9C8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1C9EFA368()
{
  return type metadata accessor for RequestDispatcher();
}

void sub_1C9EFA370()
{
  sub_1C9EFAC14();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

uint64_t method lookup function for RequestDispatcher(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for RequestDispatcher);
}

uint64_t dispatch thunk of RequestDispatcher.__allocating_init(requestDispatcherServiceHelper:bridgeConnectionListeners:)()
{
  return (*(uint64_t (**)(void))(v0 + 296))();
}

uint64_t dispatch thunk of RequestDispatcher.domains()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x158))();
}

uint64_t dispatch thunk of RequestDispatcher.commands(forDomain:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x160))();
}

uint64_t dispatch thunk of RequestDispatcher.implementsCommand(_:forDomain:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x168))();
}

uint64_t dispatch thunk of RequestDispatcher.handleCommand(_:executionContextInfo:reply:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x170))();
}

uint64_t dispatch thunk of RequestDispatcher.cancelRequest(withAssistantId:requestId:reason:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x180))();
}

uint64_t dispatch thunk of RequestDispatcher.requestCompleted(withAssistantId:requestId:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x190))();
}

uint64_t dispatch thunk of RequestDispatcher.startSpeechRequest(withAssistantId:requestId:inputOrigin:location:asrOnServer:requestContextData:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x1A0))();
}

uint64_t dispatch thunk of RequestDispatcher.sessionExists(forAssistantId:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x1B0))();
}

uint64_t dispatch thunk of RequestDispatcher.prewarm(withAssistantId:languageCode:prewarmOptions:sharedUserId:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x1C0))();
}

uint64_t dispatch thunk of RequestDispatcher.startSession(withConfiguration:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x1D0))();
}

uint64_t dispatch thunk of RequestDispatcher.endSession(withAssistantId:withDelay:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x1E0))();
}

uint64_t dispatch thunk of RequestDispatcher.startLocalRequest(withAssistantId:requestId:inputOrigin:requestContextData:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x1F0))();
}

uint64_t dispatch thunk of RequestDispatcher.startTestSpeechRequest(withAssistantId:requestId:enableASR:inputOrigin:location:jitContext:overrideModelPath:requestContextData:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x200))();
}

uint64_t dispatch thunk of RequestDispatcher.postTestResultCandidate(withAssistantId:requestId:rcId:recognitionSausage:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x210))();
}

uint64_t dispatch thunk of RequestDispatcher.postTestResultSelected(withAssistantId:requestId:rcId:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x220))();
}

uint64_t dispatch thunk of RequestDispatcher.startUnderstandingOnServerRequest(withAssistantId:requestId:inputOrigin:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x230))();
}

uint64_t dispatch thunk of RequestDispatcher.startUnderstandingOnServerTextRequest(withAssistantId:requestId:inputOrigin:utterance:requestContextData:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x240))();
}

uint64_t dispatch thunk of RequestDispatcher.startTextRequest(withAssistantId:requestId:inputOrigin:utterance:requestContextData:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x250))();
}

uint64_t dispatch thunk of RequestDispatcher.startDirectActionRequest(withAssistantId:requestId:inputOrigin:directAction:requestExecutionParameters:requestContextData:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x290))();
}

uint64_t dispatch thunk of RequestDispatcher.startCorrectionSpeechRequest(withAssistantId:requestId:inputOrigin:utterance:previousUtterance:requestContextData:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x2A0))();
}

uint64_t dispatch thunk of RequestDispatcher.startSpeechDictationSession(withAssistantId:languageCode:recognitionOnDevice:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x2B0))();
}

uint64_t dispatch thunk of RequestDispatcher.startSpeechDictationRequest(withAssistantId:requestId:inputOrigin:dictationOptions:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x2C0))();
}

uint64_t dispatch thunk of RequestDispatcher.startUnderstandingDictationSession(withAssistantId:languageCode:understandingOnDevice:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x2D0))();
}

uint64_t dispatch thunk of RequestDispatcher.startUnderstandingDictationRequest(withAssistantId:requestId:inputOrigin:dictationOptions:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x2E0))();
}

uint64_t dispatch thunk of RequestDispatcher.endDictationSession(withAssistantId:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x2F0))();
}

uint64_t dispatch thunk of RequestDispatcher.pauseDictationRecognition(withAssistantId:requestId:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x2F8))();
}

uint64_t dispatch thunk of RequestDispatcher.resumeDictationRecognition(withAssistantId:requestId:prefixText:postfixText:selectedText:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x308))();
}

uint64_t dispatch thunk of RequestDispatcher.updateVoiceCommandContext(withAssistantId:requestId:prefixText:postfixText:selectedText:disambiguationActive:cursorInVisibleText:favorCommandSuppression:abortCommandSuppression:undoEvent:)()
{
  uint64_t v2 = *(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x318);
  return v2();
}

uint64_t dispatch thunk of RequestDispatcher.announceNotificationHandlingStateUpdated(withAssistantId:toState:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x328))();
}

uint64_t dispatch thunk of RequestDispatcher.sendMultiUserInfo(withDeviceAssistantId:multiUserInfo:isRMVEnabled:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x338))();
}

void sub_1C9EFAC14()
{
  if (!qword_1EBC7FD78)
  {
    sub_1C9F07C98();
    unint64_t v0 = sub_1C9F08218();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EBC7FD78);
    }
  }
}

uint64_t sub_1C9EFAC6C(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_1C9EFAC84(uint64_t a1)
{
  return sub_1C9EF8138(a1, v1[2], v1[3], v1[4], v1[5], v1[6]);
}

uint64_t sub_1C9EFAC94(uint64_t a1)
{
  return sub_1C9EF72C4(a1, v1[2], v1[3], v1[4]);
}

uint64_t sub_1C9EFACA0()
{
  __n128 v1 = OUTLINED_FUNCTION_41();
  return sub_1C9EF68FC(v2, v3, v4, v5, v6, v7, v8, v9, v1.n128_i64[0], v1.n128_i64[1], *(void *)(v0 + 88), *(void *)(v0 + 96), *(void **)(v0 + 104), *(void **)(v0 + 112), *(void **)(v0 + 120), *(void **)(v0 + 128), *(void **)(v0 + 136));
}

uint64_t sub_1C9EFACE0()
{
  __n128 v1 = OUTLINED_FUNCTION_41();
  return sub_1C9EF5E9C(v2, v3, v4, v5, v6, v7, v8, v9, v1.n128_i64[0], v1.n128_i64[1], *(void *)(v0 + 88), *(void *)(v0 + 96));
}

uint64_t sub_1C9EFAD10(uint64_t a1)
{
  return sub_1C9EF55AC(a1, v1[2], v1[3], v1[4]);
}

uint64_t sub_1C9EFAD20()
{
  return sub_1C9EFAD50();
}

uint64_t sub_1C9EFAD38()
{
  return sub_1C9EFAD8C();
}

uint64_t sub_1C9EFAD50()
{
  OUTLINED_FUNCTION_240();
  return v0();
}

uint64_t sub_1C9EFAD74()
{
  return sub_1C9EFAD8C();
}

uint64_t sub_1C9EFAD8C()
{
  OUTLINED_FUNCTION_242();
  return v0();
}

uint64_t sub_1C9EFADA4(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(a3);
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_22_0();
  v4();
  return a2;
}

uint64_t sub_1C9EFAE04()
{
  return sub_1C9EF2854();
}

uint64_t sub_1C9EFAE20()
{
  return sub_1C9EFAD50();
}

uint64_t sub_1C9EFAE38()
{
  OUTLINED_FUNCTION_296();
  return sub_1C9EEDE6C(v0, v1, v2, v3, v4, v5, v6, v7, v8);
}

uint64_t sub_1C9EFAE64(uint64_t a1)
{
  return sub_1C9EFAE94(a1, (uint64_t (*)(uint64_t, void, void, void, void, void, void))sub_1C9EEE158);
}

uint64_t sub_1C9EFAE7C(uint64_t a1)
{
  return sub_1C9EFAE94(a1, (uint64_t (*)(uint64_t, void, void, void, void, void, void))sub_1C9EEE43C);
}

uint64_t sub_1C9EFAE94(uint64_t a1, uint64_t (*a2)(uint64_t, void, void, void, void, void, void))
{
  return a2(a1, v2[2], v2[3], v2[4], v2[5], v2[6], v2[7]);
}

uint64_t sub_1C9EFAEB0(uint64_t a1)
{
  return sub_1C9EEC47C(a1, v1[2], v1[3], v1[4], v1[5], v1[6], v1[7]);
}

uint64_t sub_1C9EFAEC4()
{
  OUTLINED_FUNCTION_240();
  return sub_1C9EEB35C(v0, v1, v2, v3, v4, v5, v6);
}

uint64_t sub_1C9EFAED4()
{
  OUTLINED_FUNCTION_296();
  return sub_1C9EEAAF8(v0, v1, v2, v3, v4, v5, v6, v7, v8);
}

uint64_t sub_1C9EFAEFC()
{
  OUTLINED_FUNCTION_242();
  return sub_1C9EE9ECC(v1, v2, v3, v4, v5, v6, v7, *(void *)(v0 + 64), *(void *)(v0 + 72), *(void *)(v0 + 80), *(void *)(v0 + 88), *(void *)(v0 + 96), *(void **)(v0 + 104));
}

uint64_t sub_1C9EFAF3C()
{
  return sub_1C9EE83C4();
}

uint64_t sub_1C9EFAF48()
{
  return sub_1C9EFB0A8(sub_1C9ECA408);
}

uint64_t sub_1C9EFAF60(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC7FD70);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_1C9EFAFC8()
{
  OUTLINED_FUNCTION_242();
  return sub_1C9EE6F88(v1, v2, v3, v4, v5, v6, v7, v0[8], v0[9], v0[10]);
}

uint64_t objectdestroy_389Tm()
{
  sub_1C9F069B8();
  OUTLINED_FUNCTION_0();
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  uint64_t v5 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v6 = ((v5 + 24) & ~v5) + *(void *)(v4 + 64);
  uint64_t v7 = v5 | 7;
  swift_release();
  uint64_t v8 = OUTLINED_FUNCTION_235();
  v9(v8);
  return MEMORY[0x1F4186498](v0, v6, v7);
}

uint64_t sub_1C9EFB090()
{
  return sub_1C9EFB0A8(sub_1C9ECA3E0);
}

uint64_t sub_1C9EFB0A8(uint64_t (*a1)(uint64_t, uint64_t))
{
  uint64_t v2 = *(void *)(sub_1C9F069B8() - 8);
  uint64_t v3 = *(void *)(v1 + 16);
  uint64_t v4 = v1 + ((*(unsigned __int8 *)(v2 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
  return a1(v3, v4);
}

uint64_t sub_1C9EFB120()
{
  return sub_1C9EE6234();
}

uint64_t sub_1C9EFB12C()
{
  return sub_1C9EFB280();
}

uint64_t objectdestroy_327Tm()
{
  sub_1C9F069B8();
  OUTLINED_FUNCTION_0();
  swift_release();
  uint64_t v0 = OUTLINED_FUNCTION_235();
  v1(v0);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_215();
  return MEMORY[0x1F4186498](v2, v3, v4);
}

void sub_1C9EFB1F8()
{
  uint64_t v1 = sub_1C9F069B8();
  OUTLINED_FUNCTION_6_0(v1);
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  unint64_t v6 = (*(unsigned __int8 *)(v3 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v7 = *(void *)(v0 + 16);
  uint64_t v8 = v0 + v6;
  uint64_t v9 = (uint64_t *)(v0 + ((*(void *)(v5 + 64) + v6 + 7) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v10 = *v9;
  unint64_t v11 = v9[1];
  sub_1C9ECA430(v7, v8, v10, v11);
}

uint64_t sub_1C9EFB268()
{
  return sub_1C9EFB280();
}

uint64_t sub_1C9EFB280()
{
  OUTLINED_FUNCTION_240();
  return v2(v0, v1);
}

uint64_t sub_1C9EFB2BC(uint64_t a1)
{
  return sub_1C9EFB310(a1, MEMORY[0x1E4FA2280], MEMORY[0x1E4FA2278], MEMORY[0x1E4FA2290], MEMORY[0x1E4FA2288]);
}

#error "1C9EFB340: call analysis failed (funcsize=16)"

uint64_t sub_1C9EFB350(uint64_t a1)
{
  return sub_1C9EFB310(a1, MEMORY[0x1E4FA2168], MEMORY[0x1E4FA2160], MEMORY[0x1E4FA2178], MEMORY[0x1E4FA2170]);
}

uint64_t sub_1C9EFB3A4(uint64_t a1)
{
  return sub_1C9EE3618(a1, v1[2], v1[3], v1[4], v1[5], v1[6], v1[7]);
}

uint64_t sub_1C9EFB3B4(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

id sub_1C9EFB3F8(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6, char *a7)
{
  uint64_t v34 = a7;
  uint64_t v40 = a4;
  uint64_t v37 = a2;
  uint64_t v38 = a3;
  uint64_t v36 = a1;
  uint64_t v10 = sub_1C9F081A8();
  MEMORY[0x1F4188790](v10);
  uint64_t v11 = sub_1C9F081C8();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x1F4188790](v11);
  uint64_t v14 = (char *)&v33 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_1C9F07ED8();
  MEMORY[0x1F4188790](v15 - 8);
  uint64_t v39 = sub_1C9F07CD8();
  v44[3] = v39;
  v44[4] = MEMORY[0x1E4FA3FE8];
  v44[0] = a6;
  v43[3] = sub_1C9F07DF8();
  v43[4] = MEMORY[0x1E4FA4028];
  v43[0] = a5;
  uint64_t v35 = OBJC_IVAR___SRDRequestDispatcherInternal_rdmbQueue;
  sub_1C9ECF370(0, &qword_1EBC7F838);
  uint64_t v16 = a7;
  sub_1C9F07EC8();
  (*(void (**)(char *, void, uint64_t))(v12 + 104))(v14, *MEMORY[0x1E4FBCC68], v11);
  uint64_t v42 = MEMORY[0x1E4FBC860];
  sub_1C9EFBB30(&qword_1EBC7F830, MEMORY[0x1E4FBCC10]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBC7F810);
  sub_1C9EFB3B4((unint64_t *)&qword_1EBC7F820, (uint64_t *)&unk_1EBC7F810);
  sub_1C9F08278();
  uint64_t v17 = (void *)sub_1C9F081F8();
  *(void *)&v34[v35] = v17;
  uint64_t v18 = OBJC_IVAR___SRDRequestDispatcherInternal_aceCommandDispatcher;
  __swift_instantiateConcreteTypeFromMangledName(qword_1EBC7FDA0);
  *(void *)&v16[v18] = sub_1C9F07F88();
  uint64_t v19 = (uint64_t)&v16[OBJC_IVAR___SRDRequestDispatcherInternal_sessionUserId];
  uint64_t v20 = sub_1C9F07C98();
  __swift_storeEnumTagSinglePayload(v19, 1, 1, v20);
  uint64_t v21 = &v16[OBJC_IVAR___SRDRequestDispatcherInternal_siriInputLocale];
  *(void *)uint64_t v21 = 0;
  *((void *)v21 + 1) = 0;
  uint64_t v22 = &v16[OBJC_IVAR___SRDRequestDispatcherInternal_activeUserSessionObserver];
  *(_OWORD *)uint64_t v22 = 0u;
  *((_OWORD *)v22 + 1) = 0u;
  *((void *)v22 + 4) = 0;
  uint64_t v23 = v37;
  *(void *)&v16[OBJC_IVAR___SRDRequestDispatcherInternal_serviceHelper] = v36;
  *(void *)&v16[OBJC_IVAR___SRDRequestDispatcherInternal_instrumentationUtil] = v23;
  *(void *)&v16[OBJC_IVAR___SRDRequestDispatcherInternal_assetLogger] = v38;
  type metadata accessor for Broker();
  swift_allocObject();
  swift_unknownObjectRetain();
  swift_retain();
  swift_retain();
  id v24 = v17;
  uint64_t v25 = sub_1C9ED0F14((uint64_t)v24);
  *(void *)&v16[OBJC_IVAR___SRDRequestDispatcherInternal_broker] = v25;
  type metadata accessor for MessagePublisher();
  uint64_t v26 = swift_allocObject();
  *(void *)(v26 + 16) = v25;
  *(void *)&v16[OBJC_IVAR___SRDRequestDispatcherInternal_messagePublisher] = v26;
  type metadata accessor for SessionsManager();
  id v27 = v24;
  swift_unownedRetain();
  swift_retain();
  *(void *)&v16[OBJC_IVAR___SRDRequestDispatcherInternal_sessionsManager] = sub_1C9EFE84C((uint64_t)v27);
  uint64_t v28 = v40;
  *(void *)&v16[OBJC_IVAR___SRDRequestDispatcherInternal_afPreferences] = v40;
  sub_1C9EFBB78((uint64_t)v43, (uint64_t)&v16[OBJC_IVAR___SRDRequestDispatcherInternal_serverFallbackDisablingUtils]);
  sub_1C9EFBB78((uint64_t)v44, (uint64_t)&v16[OBJC_IVAR___SRDRequestDispatcherInternal_featureChecker]);
  id v29 = v28;
  v16[OBJC_IVAR___SRDRequestDispatcherInternal_isMUXEnabled] = sub_1C9F07D38() & 1;

  id v30 = (objc_class *)type metadata accessor for RequestDispatcher();
  v41.receiver = v16;
  v41.super_class = v30;
  id v31 = objc_msgSendSuper2(&v41, sel_init);
  swift_unknownObjectRelease();
  swift_release();
  swift_release();

  __swift_destroy_boxed_opaque_existential_1((uint64_t)v43);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v44);
  return v31;
}

uint64_t sub_1C9EFB8D8(uint64_t result, uint64_t a2, uint64_t *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5 = *a3;
  *(void *)(v5 + 16) = result + 1;
  uint64_t v6 = v5 + 16 * result;
  *(void *)(v6 + 32) = a2;
  *(void *)(v6 + 40) = a5;
  return result;
}

uint64_t sub_1C9EFB8F0(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t sub_1C9EFB900()
{
  _Block_release(*(const void **)(v0 + 16));
  return MEMORY[0x1F4186498](v0, 24, 7);
}

void sub_1C9EFB938(uint64_t a1, uint64_t a2)
{
  sub_1C9EE2E44(a1, a2, *(void *)(v2 + 16));
}

uint64_t sub_1C9EFB940(uint64_t a1, uint64_t *a2)
{
  __swift_instantiateConcreteTypeFromMangledName(a2);
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_1_0();
  v3();
  return a1;
}

uint64_t sub_1C9EFB990()
{
  swift_release();
  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_1C9EFB9C8()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_1C9EFB9F0()
{
  sub_1C9F07E58();
  OUTLINED_FUNCTION_15();
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = v2 | 7;
  unint64_t v4 = (*(void *)(v1 + 64) + ((v2 + 16) & ~v2) + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v5 = (((v4 + 47) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8;
  OUTLINED_FUNCTION_1_0();
  v6();
  __swift_destroy_boxed_opaque_existential_1(v0 + v4);
  swift_bridgeObjectRelease();

  return MEMORY[0x1F4186498](v0, v5 + 8, v3);
}

uint64_t sub_1C9EFBAB0()
{
  uint64_t v1 = sub_1C9F07E58();
  OUTLINED_FUNCTION_6_0(v1);
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  unint64_t v6 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v7 = (void *)(v0 + ((*(void *)(v5 + 64) + v6 + 7) & 0xFFFFFFFFFFFFFFF8));
  return sub_1C9EDF43C(v0 + v6, v7);
}

uint64_t sub_1C9EFBB30(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_1C9EFBB78(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t OUTLINED_FUNCTION_5_3()
{
  return swift_isEscapingClosureAtFileLocation();
}

uint64_t OUTLINED_FUNCTION_11_3()
{
  return swift_slowAlloc();
}

uint64_t OUTLINED_FUNCTION_15_3()
{
  return sub_1C9F07D08();
}

uint64_t OUTLINED_FUNCTION_16_3@<X0>(uint64_t a1@<X8>)
{
  *(void *)(v1 - 256) = a1;
  return v2;
}

BOOL OUTLINED_FUNCTION_19_1(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

void OUTLINED_FUNCTION_21_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  *(void *)(v10 - 240) = (char *)&a9 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
}

uint64_t OUTLINED_FUNCTION_22_1(uint64_t a1)
{
  return a1 + v1;
}

void OUTLINED_FUNCTION_25_1(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v6, a4, v5, 0xCu);
}

uint64_t OUTLINED_FUNCTION_27_1()
{
  return sub_1C9F07D08();
}

unint64_t OUTLINED_FUNCTION_31_1()
{
  *(void *)(v5 - 224) = v3;
  *(void *)(v5 - 216) = v2;
  *(void *)(v5 - 208) = v4;
  *(void *)(v5 - 200) = v1;
  uint64_t v7 = *(void *)(v5 - 288);
  *(void *)(v5 - 192) = *(void *)(v5 - 296);
  *(void *)(v5 - 184) = v7;
  uint64_t v8 = *(void *)(v5 - 264);
  *(void *)(v5 - 176) = *(void *)(v5 - 280);
  *(void *)(v5 - 168) = v8;
  *(void *)(v5 - 160) = v0;
  return sub_1C9ECFD44();
}

uint64_t OUTLINED_FUNCTION_32_1(uint64_t a1)
{
  return a1 + v1;
}

void OUTLINED_FUNCTION_33_0(double a1)
{
  *(double *)(v1 - 136) = a1;
}

void OUTLINED_FUNCTION_35_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  *(void *)(v10 - 288) = (char *)&a9 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
}

void OUTLINED_FUNCTION_36_0(uint64_t a1@<X8>)
{
  *(void *)(v1 - 256) = a1;
}

uint64_t OUTLINED_FUNCTION_37_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  *(void *)(v7 - 264) = a7;
  *(void *)(v7 - 280) = a6;
  *(void *)(v7 - 288) = a5;
  *(void *)(v7 - 296) = a4;
  return swift_getObjectType();
}

uint64_t OUTLINED_FUNCTION_38_0@<X0>(uint64_t a1@<X8>)
{
  *(void *)(v2 - 224) = a1;
  return v1;
}

uint64_t OUTLINED_FUNCTION_40_0()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_41_0()
{
  return sub_1C9F07D08();
}

void OUTLINED_FUNCTION_44_0()
{
  *(void *)(v2 - 240) = v0;
  *(void *)(v2 - 232) = v1;
  uint64_t v3 = *(void *)(v2 - 336);
  *(void *)(v2 - 224) = *(void *)(v2 - 352);
  *(void *)(v2 - 216) = v3;
  uint64_t v4 = *(void *)(v2 - 312);
  *(void *)(v2 - 208) = *(void *)(v2 - 328);
  *(void *)(v2 - 200) = v4;
  uint64_t v5 = *(void *)(v2 - 296);
  *(void *)(v2 - 192) = *(void *)(v2 - 304);
  *(void *)(v2 - 184) = v5;
  uint64_t v6 = *(void *)(v2 - 320);
  *(void *)(v2 - 176) = *(void *)(v2 - 272);
  *(void *)(v2 - 168) = v6;
  *(void *)(v2 - 160) = *(void *)(v2 - 344);
}

uint64_t OUTLINED_FUNCTION_45_0()
{
  return swift_arrayDestroy();
}

uint64_t OUTLINED_FUNCTION_46_0(uint64_t a1, uint64_t a2)
{
  __swift_project_value_buffer(a1, a2);
  return swift_bridgeObjectRetain_n();
}

uint64_t OUTLINED_FUNCTION_47_0(uint64_t a1, uint64_t a2)
{
  __swift_project_value_buffer(a1, a2);
  return swift_bridgeObjectRetain_n();
}

uint64_t OUTLINED_FUNCTION_49(uint64_t a1)
{
  return a1 + v1;
}

uint64_t OUTLINED_FUNCTION_53()
{
  return swift_retain();
}

uint64_t OUTLINED_FUNCTION_56(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  *(void *)(v8 - 272) = a8;
  *(void *)(v8 - 296) = a7;
  *(void *)(v8 - 304) = a6;
  *(void *)(v8 - 312) = a5;
  *(void *)(v8 - 328) = a4;
  *(void *)(v8 - 336) = a3;
  *(void *)(v8 - 352) = a2;
  *(void *)(v8 - 320) = *(void *)(v8 + 16);
  return swift_getObjectType();
}

void OUTLINED_FUNCTION_57(void *a1, NSObject *a2, os_log_type_t a3, const char *a4)
{
  _os_log_impl(a1, a2, a3, a4, v4, 0xCu);
}

uint64_t OUTLINED_FUNCTION_59(uint64_t a1)
{
  *(void *)(v1 - 120) = a1;
  return sub_1C9F08228();
}

uint64_t OUTLINED_FUNCTION_60(uint64_t a1)
{
  *(void *)(v1 - 96) = a1;
  return v1 - 96;
}

uint64_t OUTLINED_FUNCTION_64(uint64_t a1, uint64_t a2)
{
  __swift_project_value_buffer(a1, a2);
  return swift_bridgeObjectRetain_n();
}

uint64_t OUTLINED_FUNCTION_66@<X0>(uint64_t a1@<X8>)
{
  *(void *)(v1 - 256) = a1;
  return v2;
}

uint64_t OUTLINED_FUNCTION_69(uint64_t a1)
{
  *(void *)(v1 - 96) = a1;
  return sub_1C9F08228();
}

uint64_t OUTLINED_FUNCTION_70(uint64_t a1)
{
  *(void *)(v1 - 96) = a1;
  return sub_1C9F08228();
}

uint64_t OUTLINED_FUNCTION_71(uint64_t a1)
{
  *(void *)(v1 - 96) = a1;
  return sub_1C9F08228();
}

uint64_t OUTLINED_FUNCTION_72()
{
  return *(void *)(v0 - 240);
}

uint64_t OUTLINED_FUNCTION_74(float a1)
{
  float *v1 = a1;
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_75()
{
  return sub_1C9F07D18();
}

uint64_t OUTLINED_FUNCTION_78()
{
  return sub_1C9F01420(v1, v0, (uint64_t *)(v2 - 88));
}

unint64_t OUTLINED_FUNCTION_83()
{
  return sub_1C9ECFD44();
}

uint64_t OUTLINED_FUNCTION_84@<X0>(uint64_t a1@<X8>, uint64_t a2)
{
  *(void *)(v2 - 304) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
  return 0;
}

void OUTLINED_FUNCTION_85(uint64_t a1@<X8>)
{
  *(void *)(a1 + 8) = *(void *)(v1 - 256);
}

uint64_t OUTLINED_FUNCTION_86()
{
  return swift_retain();
}

uint64_t OUTLINED_FUNCTION_87()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_88()
{
  return swift_bridgeObjectRelease_n();
}

void OUTLINED_FUNCTION_91(unint64_t *a1@<X8>)
{
  *a1 = v1 & 0xFFFFFFFFFFFFLL | 0xD000000000000000;
  a1[1] = *(void *)(v2 - 248);
}

void OUTLINED_FUNCTION_92(uint64_t a1@<X8>)
{
  *(void *)(a1 + 8) = v1;
}

void OUTLINED_FUNCTION_94()
{
  *(void *)(v3 - 200) = v2;
  *(void *)(v3 - 192) = v0;
  *(void *)(v3 - 176) = v1;
  sub_1C9EDB384();
}

uint64_t OUTLINED_FUNCTION_95()
{
  return sub_1C9F07ED8();
}

BOOL OUTLINED_FUNCTION_96(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_98@<X0>(uint64_t a1@<X8>, uint64_t a2)
{
  *(void *)(v2 - 256) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
  return 0;
}

void OUTLINED_FUNCTION_99(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v6, a4, v5, 0x16u);
}

uint64_t OUTLINED_FUNCTION_100()
{
  return swift_bridgeObjectRelease_n();
}

uint64_t OUTLINED_FUNCTION_101()
{
  return sub_1C9F08228();
}

uint64_t OUTLINED_FUNCTION_102()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_105()
{
  return *(void *)(v0 - 192);
}

BOOL OUTLINED_FUNCTION_106(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_107(uint64_t a1)
{
  *(void *)(v1 - 96) = a1;
  return sub_1C9F08228();
}

uint64_t OUTLINED_FUNCTION_109@<X0>(uint64_t a1@<X8>)
{
  return *(void *)(a1 - 256);
}

__n128 OUTLINED_FUNCTION_111()
{
  uint64_t v1 = *(void *)(v0 - 312);
  *(void *)(v0 - 208) = *(void *)(v0 - 320);
  *(void *)(v0 - 200) = v1;
  *(void *)(v0 - 192) = *(void *)(v0 - 288);
  __n128 result = *(__n128 *)(v0 - 368);
  *(__n128 *)(v0 - 184) = result;
  return result;
}

void OUTLINED_FUNCTION_113(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  *(void *)(v10 - 280) = (char *)&a9 - v9;
}

uint64_t OUTLINED_FUNCTION_114()
{
  return *(void *)(v0 - 200);
}

void OUTLINED_FUNCTION_115(uint64_t a1@<X8>)
{
  *(void *)(v1 - 256) = a1;
}

uint64_t OUTLINED_FUNCTION_116(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  *(void *)(v9 - 160) = a6;
  *(void *)(v9 - 152) = v8;
  *(void *)(v9 - 216) = a7;
  *(void *)(v9 - 208) = a8;
  *(void *)(v9 - 224) = a3;
  uint64_t v11 = *(void *)(v9 + 24);
  *(void *)(v9 - 176) = *(void *)(v9 + 16);
  *(void *)(v9 - 168) = v11;
  return sub_1C9F07E98();
}

void OUTLINED_FUNCTION_117()
{
  sub_1C9EE7664();
}

uint64_t OUTLINED_FUNCTION_118()
{
  return sub_1C9F069B8();
}

uint64_t OUTLINED_FUNCTION_120()
{
  return swift_bridgeObjectRelease_n();
}

uint64_t OUTLINED_FUNCTION_121()
{
  return swift_bridgeObjectRetain_n();
}

void OUTLINED_FUNCTION_122(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v6, a4, v5, 0x16u);
}

uint64_t OUTLINED_FUNCTION_126(uint64_t a1)
{
  *(void *)(v1 - 144) = a1;
  return sub_1C9F08228();
}

uint64_t OUTLINED_FUNCTION_128()
{
  return sub_1C9F08278();
}

uint64_t OUTLINED_FUNCTION_129(uint64_t a1)
{
  *(void *)(v1 - 112) = a1;
  return v1 - 112;
}

uint64_t OUTLINED_FUNCTION_130()
{
  return swift_bridgeObjectRelease_n();
}

uint64_t OUTLINED_FUNCTION_131()
{
  return swift_bridgeObjectRetain_n();
}

uint64_t OUTLINED_FUNCTION_132()
{
  return swift_bridgeObjectRelease_n();
}

uint64_t OUTLINED_FUNCTION_133()
{
  return swift_arrayDestroy();
}

uint64_t OUTLINED_FUNCTION_135(uint64_t a1)
{
  *(void *)(a1 + 16) = v1;
  return a1 + v2;
}

uint64_t OUTLINED_FUNCTION_136()
{
  return sub_1C9F07E58();
}

void OUTLINED_FUNCTION_137(unint64_t *a1@<X8>)
{
  *a1 = v1 & 0xFFFFFFFFFFFFLL | 0xD000000000000000;
  a1[1] = *(void *)(v2 - 256);
}

uint64_t OUTLINED_FUNCTION_138()
{
  return swift_bridgeObjectRelease_n();
}

void OUTLINED_FUNCTION_139(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  *(void *)(v10 - 232) = (char *)&a9 - v9;
}

uint64_t OUTLINED_FUNCTION_141()
{
  return sub_1C9F069B8();
}

uint64_t OUTLINED_FUNCTION_146()
{
  return swift_bridgeObjectRelease_n();
}

uint64_t OUTLINED_FUNCTION_147()
{
  return swift_arrayDestroy();
}

uint64_t OUTLINED_FUNCTION_148()
{
  return sub_1C9F08278();
}

uint64_t OUTLINED_FUNCTION_150()
{
  return swift_bridgeObjectRelease_n();
}

uint64_t OUTLINED_FUNCTION_152(uint64_t a1)
{
  *(void *)(v2 - 168) = a1;
  return v1;
}

void OUTLINED_FUNCTION_153(double a1)
{
  *(double *)(v1 - 128) = a1;
}

uint64_t OUTLINED_FUNCTION_154()
{
  return swift_bridgeObjectRelease_n();
}

uint64_t OUTLINED_FUNCTION_155()
{
  return swift_bridgeObjectRelease_n();
}

uint64_t OUTLINED_FUNCTION_158()
{
  return *(void *)(v0 + 16);
}

unint64_t OUTLINED_FUNCTION_159()
{
  *(void *)(v5 - 192) = v2;
  *(void *)(v5 - 184) = v1;
  *(void *)(v5 - 176) = v3;
  *(void *)(v5 - 168) = v4;
  *(void *)(v5 - 160) = v0;
  *(unsigned char *)(v5 - 152) = *(_DWORD *)(v5 - 224);
  return sub_1C9ECFD44();
}

uint64_t OUTLINED_FUNCTION_160()
{
  *(void *)(v1 - 280) = v0;
  return sub_1C9F07AA8();
}

void OUTLINED_FUNCTION_161(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  *(void *)(v7 - 296) = a7;
  *(void *)(v7 - 304) = a6;
  *(void *)(v7 - 312) = a5;
  *(void *)(v7 - 328) = a4;
}

uint64_t OUTLINED_FUNCTION_163()
{
  return swift_bridgeObjectRetain_n();
}

uint64_t OUTLINED_FUNCTION_166()
{
  return sub_1C9F08228();
}

uint64_t OUTLINED_FUNCTION_167()
{
  return sub_1C9F01420(v1, v0, (uint64_t *)(v2 - 88));
}

uint64_t OUTLINED_FUNCTION_168()
{
  return swift_arrayDestroy();
}

uint64_t OUTLINED_FUNCTION_169()
{
  return swift_arrayDestroy();
}

uint64_t OUTLINED_FUNCTION_170()
{
  return swift_arrayDestroy();
}

uint64_t OUTLINED_FUNCTION_171()
{
  uint64_t v3 = *(void *)(v1 - 200);
  return sub_1C9F01420(v3, v0, (uint64_t *)(v1 - 168));
}

uint64_t OUTLINED_FUNCTION_174()
{
  *(void *)(v1 - 216) = v0;
  return sub_1C9F07D08();
}

uint64_t OUTLINED_FUNCTION_175(uint64_t a1)
{
  *(void *)(v1 - 96) = a1;
  return sub_1C9F08228();
}

void OUTLINED_FUNCTION_176(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v6, a4, v5, 0x16u);
}

void OUTLINED_FUNCTION_177(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v6, a4, v5, 0xCu);
}

void OUTLINED_FUNCTION_178(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v5, v6, a4, v4, 0xCu);
}

uint64_t OUTLINED_FUNCTION_179()
{
  return *(void *)(v0 + 24);
}

BOOL OUTLINED_FUNCTION_180(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

BOOL OUTLINED_FUNCTION_184()
{
  return sub_1C9EDC920(v4, v0, v1, v3, v2, v6, v5);
}

uint64_t OUTLINED_FUNCTION_185()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_188()
{
  return sub_1C9F07E58();
}

uint64_t OUTLINED_FUNCTION_190()
{
  *(void *)(v3 + 16) = v0;
  *(void *)(v3 + 24) = v1;
  return v2;
}

BOOL OUTLINED_FUNCTION_191(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_192(uint64_t a1)
{
  *(void *)(v1 - 144) = a1;
  return sub_1C9F08228();
}

uint64_t OUTLINED_FUNCTION_193@<X0>(uint64_t a1@<X8>, uint64_t a2)
{
  *(void *)(v2 - 232) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
  return 0;
}

uint64_t OUTLINED_FUNCTION_194()
{
  return swift_bridgeObjectRelease_n();
}

uint64_t OUTLINED_FUNCTION_195()
{
  return v0;
}

void OUTLINED_FUNCTION_196(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v5, a4, v6, 2u);
}

uint64_t OUTLINED_FUNCTION_198()
{
  return sub_1C9F07E58();
}

uint64_t OUTLINED_FUNCTION_199(uint64_t a1)
{
  *(void *)(a1 + 16) = v1;
  return a1 + v2;
}

void *OUTLINED_FUNCTION_200(void *a1, uint64_t a2)
{
  return __swift_project_boxed_opaque_existential_1(a1, a2);
}

uint64_t OUTLINED_FUNCTION_201(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  *(_DWORD *)(v5 - 180) = a5;
  return sub_1C9F07BF8();
}

void OUTLINED_FUNCTION_202(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  *(void *)(v8 - 288) = a8;
  *(void *)(v8 - 312) = a7;
  *(void *)(v8 - 320) = a6;
}

uint64_t OUTLINED_FUNCTION_203()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_205()
{
  *(void *)(v5 - 144) = v2;
  *(void *)(v5 - 136) = v1;
  *(void *)(v5 - 128) = v0;
  *(void *)(v5 - 120) = v4;
  *(void *)(v5 - 112) = v3;
  *(unsigned char *)(v5 - 104) = *(_DWORD *)(v5 - 180);
  return 0;
}

uint64_t OUTLINED_FUNCTION_206(uint64_t a1)
{
  *(void *)(v1 - 96) = a1;
  return sub_1C9F08228();
}

void OUTLINED_FUNCTION_208(unint64_t *a1@<X8>)
{
  *a1 = v1 & 0xFFFFFFFFFFFFLL | 0xD000000000000000;
  a1[1] = *(void *)(v2 - 312);
}

uint64_t OUTLINED_FUNCTION_209()
{
  return swift_bridgeObjectRelease_n();
}

void OUTLINED_FUNCTION_210(uint64_t a1@<X8>)
{
  uint64_t v3 = *(NSObject **)(a1 - 256);
  dispatch_sync(v3, v1);
}

uint64_t OUTLINED_FUNCTION_211()
{
  return sub_1C9F07CF8();
}

uint64_t OUTLINED_FUNCTION_212()
{
  return swift_bridgeObjectRetain_n();
}

void OUTLINED_FUNCTION_213(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  *(void *)(v10 - 296) = (char *)&a9 - v9;
}

void OUTLINED_FUNCTION_214()
{
  *(void *)(v2 - 256) = v0;
  *(void *)(v2 - 248) = v1;
  uint64_t v3 = *(void *)(v2 - 376);
  *(void *)(v2 - 240) = *(void *)(v2 - 392);
  *(void *)(v2 - 232) = v3;
}

uint64_t OUTLINED_FUNCTION_216@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  *(void *)(a2 - 256) = a1;
  return sub_1C9F07E58();
}

uint64_t OUTLINED_FUNCTION_217()
{
  *(void *)(v2 - 304) = v0;
  uint64_t v4 = *(void *)(v2 - 168);
  return sub_1C9F01420(v4, v1, (uint64_t *)(v2 - 136));
}

uint64_t OUTLINED_FUNCTION_218()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_219()
{
  return sub_1C9F07B28();
}

uint64_t OUTLINED_FUNCTION_220()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_221()
{
  return swift_bridgeObjectRelease_n();
}

uint64_t OUTLINED_FUNCTION_222()
{
  return swift_bridgeObjectRelease_n();
}

void OUTLINED_FUNCTION_223(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X8>)
{
  *(void *)(a4 - 256) = a3;
  *(void *)(v4 - 376) = a2;
  *(void *)(v4 - 392) = a1;
}

uint64_t OUTLINED_FUNCTION_224(uint64_t result)
{
  *(void *)(v1 - 168) = result;
  return result;
}

uint64_t OUTLINED_FUNCTION_225()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_226()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_227()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_228()
{
  return sub_1C9F01420(v1, v0, (uint64_t *)(v2 - 88));
}

uint64_t OUTLINED_FUNCTION_229()
{
  return swift_retain();
}

uint64_t OUTLINED_FUNCTION_230()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_231()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_232()
{
  return v0;
}

void OUTLINED_FUNCTION_233(uint64_t a1@<X8>)
{
  uint64_t v2 = *(void *)(a1 - 256);
  uint64_t v3 = *(void *)(v1 - 296);
  *(void *)(v1 - 192) = v2;
  *(void *)(v1 - 184) = v3;
}

uint64_t OUTLINED_FUNCTION_234()
{
  return swift_arrayDestroy();
}

uint64_t OUTLINED_FUNCTION_235()
{
  return v0 + v1;
}

uint64_t OUTLINED_FUNCTION_236(float a1)
{
  *uint64_t v2 = a1;
  *(void *)(v3 - 296) = v1;
  return swift_bridgeObjectRetain();
}

BOOL OUTLINED_FUNCTION_238(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

void OUTLINED_FUNCTION_243()
{
  JUMPOUT(0x1CB794A40);
}

uint64_t OUTLINED_FUNCTION_244()
{
  __swift_project_boxed_opaque_existential_1(v0, v0[3]);
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_245()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_246(uint64_t result)
{
  *(void *)(v1 - 96) = result;
  return result;
}

uint64_t OUTLINED_FUNCTION_247(uint64_t a1)
{
  *(void *)(v1 - 96) = a1;
  return v1 - 96;
}

uint64_t OUTLINED_FUNCTION_248(uint64_t a1)
{
  *(void *)(v1 - 96) = a1;
  return v1 - 96;
}

uint64_t OUTLINED_FUNCTION_251()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_252(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(v3 - 104) = a3;
  return sub_1C9F07BF8();
}

uint64_t OUTLINED_FUNCTION_253()
{
  return v0;
}

BOOL OUTLINED_FUNCTION_254(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_256(uint64_t result)
{
  *(void *)(v1 - 88) = result;
  return result;
}

uint64_t OUTLINED_FUNCTION_257()
{
  return swift_bridgeObjectRelease_n();
}

uint64_t OUTLINED_FUNCTION_258()
{
  return v0;
}

__n128 OUTLINED_FUNCTION_259()
{
  return v0[5];
}

void OUTLINED_FUNCTION_260(uint64_t a1@<X8>)
{
  *(void *)(v1 - 336) = a1;
}

uint64_t OUTLINED_FUNCTION_261()
{
  return sub_1C9F08338();
}

BOOL OUTLINED_FUNCTION_262(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_264()
{
  return v0;
}

void OUTLINED_FUNCTION_265(uint64_t a1@<X8>)
{
  *(void *)(a1 + 64) |= v1;
}

uint64_t OUTLINED_FUNCTION_268()
{
  return swift_retain();
}

void OUTLINED_FUNCTION_269()
{
  *(_WORD *)(v0 + 12) = 2080;
}

void OUTLINED_FUNCTION_270(uint64_t a1@<X8>)
{
  *(void *)(a1 - 256) = v1;
}

uint64_t OUTLINED_FUNCTION_274()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_275()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_276()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_277()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_280()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_281(uint64_t result)
{
  *(void *)(v1 - 88) = result;
  return result;
}

uint64_t OUTLINED_FUNCTION_282(uint64_t result)
{
  *(void *)(v1 - 144) = result;
  return result;
}

uint64_t OUTLINED_FUNCTION_283()
{
  return swift_retain();
}

uint64_t OUTLINED_FUNCTION_285(uint64_t a1)
{
  *(void *)(a1 + 16) = v1;
  return a1 + v2;
}

uint64_t OUTLINED_FUNCTION_287()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_288()
{
  return swift_unknownObjectRetain_n();
}

uint64_t OUTLINED_FUNCTION_289()
{
  return swift_unknownObjectRelease_n();
}

uint64_t OUTLINED_FUNCTION_290()
{
  return v0;
}

void OUTLINED_FUNCTION_291(uint64_t a1@<X8>)
{
  uint64_t v2 = *(void *)(a1 - 256);
  uint64_t v3 = *(void *)(v1 - 336);
  *(void *)(v1 - 176) = v2;
  *(void *)(v1 - 168) = v3;
}

uint64_t OUTLINED_FUNCTION_292(uint64_t result)
{
  *(void *)(v1 - 120) = result;
  return result;
}

uint64_t OUTLINED_FUNCTION_293()
{
  return swift_arrayDestroy();
}

uint64_t OUTLINED_FUNCTION_294(uint64_t a1)
{
  *(void *)(v1 - 168) = a1;
  return v1 - 168;
}

uint64_t OUTLINED_FUNCTION_295(float a1)
{
  float *v1 = a1;
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_297()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_298(uint64_t a1)
{
  *(void *)(v1 - 136) = a1;
  return v1 - 136;
}

uint64_t OUTLINED_FUNCTION_300(float a1)
{
  float *v1 = a1;
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_302()
{
  return v0;
}

void OUTLINED_FUNCTION_303()
{
  uint64_t v3 = *(NSObject **)(v1 - 224);
  dispatch_sync(v3, v0);
}

void OUTLINED_FUNCTION_304(void *a1, NSObject *a2, os_log_type_t a3, const char *a4)
{
  _os_log_impl(a1, a2, a3, a4, v4, 0xCu);
}

void OUTLINED_FUNCTION_307()
{
  uint64_t v3 = *(NSObject **)(v1 - 208);
  dispatch_sync(v3, v0);
}

uint64_t OUTLINED_FUNCTION_308()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_309()
{
  return v0;
}

void OUTLINED_FUNCTION_310(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v5, v4, a4, v6, 0x16u);
}

void OUTLINED_FUNCTION_311(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v6, a4, v5, 0xCu);
}

uint64_t OUTLINED_FUNCTION_312(float a1)
{
  float *v1 = a1;
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_313(uint64_t a1, uint64_t a2)
{
  return __swift_project_value_buffer(a1, a2);
}

uint64_t OUTLINED_FUNCTION_315()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_316()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_317()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_318()
{
  return swift_bridgeObjectRetain_n();
}

uint64_t OUTLINED_FUNCTION_319(uint64_t a1)
{
  *(void *)(a1 + 16) = v2;
  return a1 + v1;
}

void OUTLINED_FUNCTION_320(uint64_t a1@<X8>)
{
  *(void *)(v1 - 344) = a1;
}

void OUTLINED_FUNCTION_321()
{
  sub_1C9EFF3F0();
}

uint64_t OUTLINED_FUNCTION_322()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_324()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_325()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_326()
{
  return v0;
}

void OUTLINED_FUNCTION_329()
{
  *(void *)(v2 - 176) = v0;
  *(void *)(v2 - 168) = v1;
}

uint64_t OUTLINED_FUNCTION_330()
{
  return sub_1C9F07DE8();
}

uint64_t OUTLINED_FUNCTION_331()
{
  *(_OWORD *)(v0 - 368) = *(_OWORD *)(v0 + 16);
  return swift_getObjectType();
}

uint64_t OUTLINED_FUNCTION_332(float a1)
{
  float *v1 = a1;
  return swift_bridgeObjectRetain();
}

BOOL OUTLINED_FUNCTION_333(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_334()
{
  *(_WORD *)(v0 + 12) = 2080;
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_335()
{
  *(_WORD *)(v0 + 12) = 2080;
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_336()
{
  *(_WORD *)(v0 + 12) = 2080;
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_337()
{
  *(_WORD *)(v0 + 12) = 2080;
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_338()
{
  *(_WORD *)(v0 + 12) = 2080;
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_339()
{
  return sub_1C9F07DE8();
}

uint64_t OUTLINED_FUNCTION_340(float a1)
{
  float *v1 = a1;
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_342()
{
  return *(void *)(v0 + 24);
}

uint64_t OUTLINED_FUNCTION_343()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_345()
{
  return swift_arrayDestroy();
}

uint64_t OUTLINED_FUNCTION_346(uint64_t result)
{
  *(void *)(v1 - 88) = result;
  return result;
}

uint64_t OUTLINED_FUNCTION_347()
{
  return sub_1C9F08228();
}

uint64_t OUTLINED_FUNCTION_349()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_350()
{
  return swift_retain();
}

uint64_t OUTLINED_FUNCTION_353()
{
  return sub_1C9EFDE68();
}

BOOL sub_1C9EFDDD4(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

uint64_t sub_1C9EFDDE0(char a1, char a2)
{
  unint64_t v3 = sub_1C9EC9F40(a1);
  uint64_t v5 = v4;
  if (v3 == sub_1C9EC9F40(a2) && v5 == v6) {
    char v8 = 1;
  }
  else {
    char v8 = sub_1C9F08388();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_1C9EFDE68()
{
  sub_1C9F07BF8();
  sub_1C9EFE660(&qword_1EBC7FD48, MEMORY[0x1E4FA26C0]);
  sub_1C9F080C8();
  sub_1C9F080C8();
  if (v5 == v3 && v6 == v4) {
    char v1 = 1;
  }
  else {
    char v1 = sub_1C9F08388();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v1 & 1;
}

uint64_t sub_1C9EFDF4C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v49 = a3;
  uint64_t v48 = sub_1C9F06968();
  OUTLINED_FUNCTION_0();
  uint64_t v45 = v7;
  uint64_t v9 = MEMORY[0x1F4188790](v8);
  uint64_t v47 = (char *)v43 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v9);
  id v46 = (char *)v43 - v11;
  uint64_t v12 = sub_1C9F07BF8();
  OUTLINED_FUNCTION_0();
  uint64_t v44 = v13;
  MEMORY[0x1F4188790](v14);
  uint64_t v16 = (char *)v43 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_1C9F069B8();
  OUTLINED_FUNCTION_0();
  uint64_t v19 = v18;
  MEMORY[0x1F4188790](v20);
  uint64_t v22 = (char *)v43 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = v4 + OBJC_IVAR____TtC14SiriMessageBus7Session_sessionId;
  sub_1C9F069A8();
  uint64_t v24 = v4 + OBJC_IVAR____TtC14SiriMessageBus7Session_lastAccessedTime;
  sub_1C9F06958();
  uint64_t v25 = (void *)(v4 + OBJC_IVAR____TtC14SiriMessageBus7Session_activeUserPersonaId);
  *uint64_t v25 = 0;
  v25[1] = 0;
  uint64_t v26 = (void *)(v4 + OBJC_IVAR____TtC14SiriMessageBus7Session_assistantId);
  *uint64_t v26 = a1;
  v26[1] = a2;
  id v27 = *(void (**)(char *, uint64_t, uint64_t))(v19 + 16);
  v43[1] = v23;
  v43[2] = v17;
  v27(v22, v23, v17);
  uint64_t v28 = v44;
  (*(void (**)(char *, uint64_t, uint64_t))(v44 + 16))(v16, v49, v12);
  type metadata accessor for ConversationSession();
  swift_allocObject();
  swift_bridgeObjectRetain();
  uint64_t v29 = v12;
  uint64_t v30 = v28;
  sub_1C9ED4978();
  *(void *)(v4 + OBJC_IVAR____TtC14SiriMessageBus7Session_conversationSession) = v31;
  swift_beginAccess();
  uint64_t v32 = v45;
  uint64_t v33 = v47;
  uint64_t v34 = v24;
  uint64_t v35 = v48;
  (*(void (**)(char *, uint64_t, uint64_t))(v45 + 16))(v47, v34, v48);
  uint64_t v36 = v46;
  sub_1C9F06928();
  (*(void (**)(char *, uint64_t))(v32 + 8))(v33, v35);
  (*(void (**)(uint64_t, char *, uint64_t))(v32 + 32))(v4 + OBJC_IVAR____TtC14SiriMessageBus7Session_expirationTime, v36, v35);
  (*(void (**)(char *, void, uint64_t))(v30 + 104))(v16, *MEMORY[0x1E4FA26B0], v29);
  LOBYTE(v19) = sub_1C9EFDE68();
  uint64_t v37 = *(void (**)(void))(v30 + 8);
  OUTLINED_FUNCTION_1_4();
  v37();
  if (v19)
  {
    unint64_t v50 = 0;
    unint64_t v51 = 0xE000000000000000;
    sub_1C9F082A8();
    swift_bridgeObjectRelease();
    unint64_t v50 = 0xD00000000000002ALL;
    unint64_t v51 = 0x80000001C9F0AF20;
    sub_1C9EFE660((unint64_t *)&unk_1EBC7F010, MEMORY[0x1E4F27990]);
    sub_1C9F08378();
    sub_1C9F08038();
    swift_bridgeObjectRelease();
    unint64_t v38 = v51;
    uint64_t v39 = (unint64_t *)(v4 + OBJC_IVAR____TtC14SiriMessageBus7Session_transactionName);
    *uint64_t v39 = v50;
    v39[1] = v38;
    sub_1C9F08008();
    uint64_t v40 = os_transaction_create();
    OUTLINED_FUNCTION_1_4();
    v37();
    swift_release();
  }
  else
  {
    OUTLINED_FUNCTION_1_4();
    v37();
    uint64_t v40 = 0;
    objc_super v41 = (void *)(v4 + OBJC_IVAR____TtC14SiriMessageBus7Session_transactionName);
    *objc_super v41 = 0;
    v41[1] = 0xE000000000000000;
  }
  *(void *)(v4 + OBJC_IVAR____TtC14SiriMessageBus7Session_sessionTransaction) = v40;
  return v4;
}

uint64_t sub_1C9EFE390()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC14SiriMessageBus7Session_sessionId;
  uint64_t v2 = sub_1C9F069B8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  uint64_t v3 = v0 + OBJC_IVAR____TtC14SiriMessageBus7Session_lastAccessedTime;
  uint64_t v4 = sub_1C9F06968();
  uint64_t v5 = *(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(v3, v4);
  v5(v0 + OBJC_IVAR____TtC14SiriMessageBus7Session_expirationTime, v4);
  swift_release();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_1C9EFE4C4()
{
  sub_1C9EFE390();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return MEMORY[0x1F4186488](v0, v1, v2);
}

uint64_t sub_1C9EFE51C()
{
  return type metadata accessor for Session();
}

uint64_t type metadata accessor for Session()
{
  uint64_t result = qword_1EBC7F6A8;
  if (!qword_1EBC7F6A8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1C9EFE56C()
{
  uint64_t result = sub_1C9F069B8();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_1C9F06968();
    if (v2 <= 0x3F) {
      return swift_updateClassMetadata2();
    }
  }
  return result;
}

uint64_t sub_1C9EFE660(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_1C9EFE6B8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!*(void *)(a3 + 16)) {
    return 0;
  }
  unint64_t v4 = sub_1C9F01B5C(a1, a2);
  if ((v5 & 1) == 0) {
    return 0;
  }
  uint64_t v6 = *(void *)(*(void *)(a3 + 56) + 16 * v4);
  swift_bridgeObjectRetain();
  return v6;
}

uint64_t sub_1C9EFE714(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a3 + 16) && (sub_1C9F01B5C(a1, a2), (v3 & 1) != 0)) {
    return swift_unknownObjectRetain();
  }
  else {
    return 0;
  }
}

uint64_t sub_1C9EFE764(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!*(void *)(a3 + 16)) {
    return 0;
  }
  unint64_t v4 = sub_1C9F01B5C(a1, a2);
  if ((v5 & 1) == 0) {
    return 0;
  }
  uint64_t v6 = *(void *)(*(void *)(a3 + 56) + 16 * v4);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return v6;
}

uint64_t sub_1C9EFE7C4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a3 + 16) && (sub_1C9F01B5C(a1, a2), (v3 & 1) != 0)) {
    return swift_bridgeObjectRetain();
  }
  else {
    return 0;
  }
}

uint64_t sub_1C9EFE808(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a3 + 16) && (sub_1C9F01B5C(a1, a2), (v3 & 1) != 0)) {
    return swift_retain();
  }
  else {
    return 0;
  }
}

uint64_t sub_1C9EFE84C(uint64_t a1)
{
  double v2 = sub_1C9EFE8C4();
  double v3 = sub_1C9EFEA40();
  type metadata accessor for SessionsManager();
  uint64_t v4 = swift_allocObject();
  sub_1C9EFEBBC(a1, v2, v3);
  return v4;
}

double sub_1C9EFE8C4()
{
  uint64_t v14 = qword_1EA5CECA0;
  id v1 = objc_allocWithZone(MEMORY[0x1E4F1CB18]);
  id v2 = sub_1C9F0131C(0xD000000000000013, 0x80000001C9F0B240);
  if (v2)
  {
    double v3 = v2;
    uint64_t v4 = OUTLINED_FUNCTION_43_0();
    uint64_t v5 = (uint64_t)OUTLINED_FUNCTION_31_2(v4);

    if (v5 >= 1)
    {
      uint64_t v6 = OUTLINED_FUNCTION_43_0();
      id v7 = OUTLINED_FUNCTION_48_1(v6);

      uint64_t v14 = (uint64_t)v7;
      if (qword_1EBC7F680 != -1) {
        swift_once();
      }
      uint64_t v8 = sub_1C9F07E78();
      uint64_t v9 = OUTLINED_FUNCTION_2_2(v8, (uint64_t)qword_1EBC7FEF0);
      os_log_type_t v10 = sub_1C9F08188();
      if (os_log_type_enabled(v9, v10))
      {
        *(_DWORD *)OUTLINED_FUNCTION_29() = 134218240;
        OUTLINED_FUNCTION_39_1();
        OUTLINED_FUNCTION_14_3();
        OUTLINED_FUNCTION_49_0(&dword_1C9EC7000, v11, v12, "session expiration changed from default: %ld to: %ld seconds");
        OUTLINED_FUNCTION_1();
      }
    }
  }
  OUTLINED_FUNCTION_15_0();
  return (double)v14;
}

double sub_1C9EFEA40()
{
  uint64_t v14 = 15;
  id v1 = objc_allocWithZone(MEMORY[0x1E4F1CB18]);
  id v2 = sub_1C9F0131C(0xD000000000000013, 0x80000001C9F0B240);
  if (v2)
  {
    double v3 = v2;
    uint64_t v4 = OUTLINED_FUNCTION_43_0();
    uint64_t v5 = (uint64_t)OUTLINED_FUNCTION_31_2(v4);

    if (v5 >= 1)
    {
      uint64_t v6 = OUTLINED_FUNCTION_43_0();
      id v7 = OUTLINED_FUNCTION_48_1(v6);

      uint64_t v14 = (uint64_t)v7;
      if (qword_1EBC7F680 != -1) {
        swift_once();
      }
      uint64_t v8 = sub_1C9F07E78();
      uint64_t v9 = OUTLINED_FUNCTION_2_2(v8, (uint64_t)qword_1EBC7FEF0);
      os_log_type_t v10 = sub_1C9F08188();
      if (os_log_type_enabled(v9, v10))
      {
        *(_DWORD *)OUTLINED_FUNCTION_29() = 134218240;
        OUTLINED_FUNCTION_39_1();
        OUTLINED_FUNCTION_14_3();
        OUTLINED_FUNCTION_49_0(&dword_1C9EC7000, v11, v12, "session end expiration delay changed from default: %ld to: %ld seconds");
        OUTLINED_FUNCTION_1();
      }
    }
  }
  OUTLINED_FUNCTION_15_0();
  return (double)v14;
}

uint64_t sub_1C9EFEBBC(uint64_t a1, double a2, double a3)
{
  type metadata accessor for Session();
  *(void *)(v3 + 40) = sub_1C9F07F88();
  sub_1C9F069B8();
  sub_1C9F033E8((unint64_t *)&unk_1EBC7F968, MEMORY[0x1E4F27990]);
  *(void *)(v3 + 48) = sub_1C9F07F88();
  uint64_t v7 = v3 + OBJC_IVAR____TtC14SiriMessageBus15SessionsManager_nextExpirationTaskTimeCheck;
  uint64_t v8 = sub_1C9F06968();
  __swift_storeEnumTagSinglePayload(v7, 1, 1, v8);
  *(void *)(v3 + OBJC_IVAR____TtC14SiriMessageBus15SessionsManager_expirationScheduleTask) = 0;
  swift_weakInit();
  *(void *)(v3 + 32) = a1;
  swift_weakAssign();
  swift_release();
  *(double *)(v3 + 16) = a2;
  *(double *)(v3 + 24) = a3;
  return v3;
}

uint64_t sub_1C9EFECF0()
{
  return sub_1C9F081D8();
}

double sub_1C9EFED60@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  OUTLINED_FUNCTION_15_0();
  uint64_t v5 = *(void *)(v2 + 48);
  if (*(void *)(v5 + 16))
  {
    swift_bridgeObjectRetain();
    sub_1C9F01D7C(a1);
    if (v7)
    {
      uint64_t v8 = *(void *)(*(void *)(v5 + 56) + 8 * v6);
      swift_retain();
      swift_bridgeObjectRelease();
      uint64_t v9 = *(void *)(v8 + OBJC_IVAR____TtC14SiriMessageBus7Session_conversationSession);
      swift_retain();
      swift_release();
      *(void *)(a2 + 24) = type metadata accessor for ConversationSession();
      *(void *)(a2 + 32) = sub_1C9F033E8(&qword_1EBC7F9D8, (void (*)(uint64_t))type metadata accessor for ConversationSession);
      *(void *)a2 = v9;
      return result;
    }
    swift_bridgeObjectRelease();
  }
  *(void *)(a2 + 32) = 0;
  double result = 0.0;
  *(_OWORD *)a2 = 0u;
  *(_OWORD *)(a2 + 16) = 0u;
  return result;
}

uint64_t sub_1C9EFEE58(uint64_t a1, uint64_t a2)
{
  OUTLINED_FUNCTION_15_0();
  uint64_t v5 = *(void *)(v2 + 40);
  if (!*(void *)(v5 + 16)) {
    return 0;
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  unint64_t v6 = sub_1C9F01B5C(a1, a2);
  if (v7)
  {
    uint64_t v8 = *(void *)(*(void *)(v5 + 56) + 8 * v6);
    swift_retain();
  }
  else
  {
    uint64_t v8 = 0;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8;
}

void sub_1C9EFEEF8(uint64_t a1, unint64_t a2)
{
  uint64_t v6 = sub_1C9F06968();
  OUTLINED_FUNCTION_0();
  uint64_t v8 = v7;
  MEMORY[0x1F4188790](v9);
  OUTLINED_FUNCTION_18_3();
  MEMORY[0x1F4188790](v10);
  OUTLINED_FUNCTION_15_0();
  uint64_t v11 = *(void *)(v2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v12 = sub_1C9EFE808(a1, a2, v11);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v12)
  {
    sub_1C9F06958();
    uint64_t v13 = v12 + OBJC_IVAR____TtC14SiriMessageBus7Session_lastAccessedTime;
    OUTLINED_FUNCTION_10_5();
    uint64_t v14 = *(void (**)(void))(v8 + 40);
    OUTLINED_FUNCTION_38_1();
    v14();
    swift_endAccess();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16))(v3, v13, v6);
    sub_1C9F06928();
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v3, v6);
    OUTLINED_FUNCTION_10_5();
    OUTLINED_FUNCTION_38_1();
    v14();
    swift_endAccess();
    if (qword_1EBC7F680 != -1) {
      swift_once();
    }
    uint64_t v15 = sub_1C9F07E78();
    __swift_project_value_buffer(v15, (uint64_t)qword_1EBC7FEF0);
    swift_bridgeObjectRetain_n();
    swift_retain_n();
    uint64_t v16 = sub_1C9F07E68();
    os_log_type_t v17 = sub_1C9F08158();
    if (os_log_type_enabled(v16, v17))
    {
      uint64_t v18 = OUTLINED_FUNCTION_29();
      v25[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v18 = 136315394;
      sub_1C9F069B8();
      sub_1C9F033E8((unint64_t *)&unk_1EBC7F010, MEMORY[0x1E4F27990]);
      uint64_t v19 = sub_1C9F08378();
      uint64_t v26 = sub_1C9F01420(v19, v20, v25);
      sub_1C9F08228();
      swift_release_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v18 + 12) = 2080;
      swift_bridgeObjectRetain();
      uint64_t v26 = sub_1C9F01420(a1, a2, v25);
      sub_1C9F08228();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_1C9EC7000, v16, v17, "Extending session id: %s for assistant id: %s", (uint8_t *)v18, 0x16u);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_1();
      OUTLINED_FUNCTION_1();
    }
    else
    {

      swift_bridgeObjectRelease_n();
      swift_release_n();
    }
  }
  else
  {
    if (qword_1EBC7F680 != -1) {
      swift_once();
    }
    uint64_t v21 = sub_1C9F07E78();
    __swift_project_value_buffer(v21, (uint64_t)qword_1EBC7FEF0);
    swift_bridgeObjectRetain_n();
    uint64_t v22 = sub_1C9F07E68();
    os_log_type_t v23 = sub_1C9F08188();
    if (os_log_type_enabled(v22, v23))
    {
      uint64_t v24 = (uint8_t *)swift_slowAlloc();
      v25[0] = OUTLINED_FUNCTION_11_3();
      *(_DWORD *)uint64_t v24 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v26 = sub_1C9F01420(a1, a2, v25);
      sub_1C9F08228();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_1C9EC7000, v22, v23, "Cannot find session for assistant id: %s", v24, 0xCu);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_1();
      OUTLINED_FUNCTION_1();
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
  OUTLINED_FUNCTION_11_1();
}

void sub_1C9EFF3F0()
{
  OUTLINED_FUNCTION_11_4();
  uint64_t v3 = v0;
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  uint64_t v9 = v8;
  uint64_t v10 = sub_1C9F06968();
  OUTLINED_FUNCTION_0();
  uint64_t v12 = v11;
  MEMORY[0x1F4188790](v13);
  OUTLINED_FUNCTION_19_2();
  sub_1C9F07BF8();
  OUTLINED_FUNCTION_0();
  MEMORY[0x1F4188790](v14);
  OUTLINED_FUNCTION_272();
  (*(void (**)(uint64_t, uint64_t))(v15 + 16))(v2, v5);
  type metadata accessor for Session();
  swift_allocObject();
  swift_bridgeObjectRetain();
  uint64_t v16 = sub_1C9EFDF4C(v9, v7, v2);
  OUTLINED_FUNCTION_15_0();
  uint64_t v17 = *(void *)(*(void *)(v3 + 40) + 16);
  OUTLINED_FUNCTION_10_5();
  swift_bridgeObjectRetain();
  uint64_t v18 = swift_retain();
  sub_1C9F027AC(v18, v9, v7, (void (*)(uint64_t))sub_1C9F02DF8);
  swift_endAccess();
  swift_bridgeObjectRelease();
  uint64_t v19 = v16 + OBJC_IVAR____TtC14SiriMessageBus7Session_sessionId;
  OUTLINED_FUNCTION_10_5();
  uint64_t v20 = swift_retain();
  sub_1C9F02814(v20, v19);
  swift_endAccess();
  if (!v17)
  {
    uint64_t v21 = v16 + OBJC_IVAR____TtC14SiriMessageBus7Session_expirationTime;
    OUTLINED_FUNCTION_15_0();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v12 + 16))(v1, v21, v10);
    sub_1C9F00D4C();
    (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v1, v10);
  }
  sub_1C9F069B8();
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_22_0();
  v22();
  swift_release();
  OUTLINED_FUNCTION_13_3();
}

void sub_1C9EFF644()
{
  OUTLINED_FUNCTION_11_4();
  uint64_t v2 = v0;
  char v4 = v3;
  double v93 = v5;
  unint64_t v7 = v6;
  uint64_t v9 = v8;
  sub_1C9F07BF8();
  OUTLINED_FUNCTION_0();
  uint64_t v97 = v10;
  uint64_t v98 = v11;
  MEMORY[0x1F4188790](v10);
  OUTLINED_FUNCTION_15_4();
  uint64_t v94 = (char *)(v12 - v13);
  MEMORY[0x1F4188790](v14);
  uint64_t v96 = (char *)&v90 - v15;
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC7F958);
  uint64_t v17 = OUTLINED_FUNCTION_10_3(v16);
  MEMORY[0x1F4188790](v17);
  OUTLINED_FUNCTION_19_2();
  uint64_t v18 = sub_1C9F06968();
  OUTLINED_FUNCTION_0();
  uint64_t v92 = v19;
  MEMORY[0x1F4188790](v20);
  OUTLINED_FUNCTION_15_4();
  os_log_type_t v23 = (char *)(v21 - v22);
  MEMORY[0x1F4188790](v24);
  uint64_t v26 = (char *)&v90 - v25;
  OUTLINED_FUNCTION_47_1();
  uint64_t v27 = *(void *)(v2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v95 = (void (*)(char *, uint64_t, uint64_t))v9;
  uint64_t v28 = sub_1C9EFE808(v9, v7, v27);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v99 = v28;
  if (!v28)
  {
    if (qword_1EBC7F680 != -1) {
      swift_once();
    }
    uint64_t v33 = sub_1C9F07E78();
    uint64_t v34 = (void *)OUTLINED_FUNCTION_2_2(v33, (uint64_t)qword_1EBC7FEF0);
    os_log_type_t v35 = sub_1C9F08168();
    if (OUTLINED_FUNCTION_5(v35))
    {
      uint64_t v36 = (_WORD *)OUTLINED_FUNCTION_1_2();
      OUTLINED_FUNCTION_4_2(v36);
      OUTLINED_FUNCTION_196(&dword_1C9EC7000, v37, v38, "Cannot find current session to end");
      OUTLINED_FUNCTION_1();
    }

    goto LABEL_52;
  }
  if (!swift_weakLoadStrong())
  {
    if (qword_1EBC7F680 != -1) {
      swift_once();
    }
    uint64_t v50 = sub_1C9F07E78();
    unint64_t v51 = (void *)OUTLINED_FUNCTION_2_2(v50, (uint64_t)qword_1EBC7FEF0);
    os_log_type_t v52 = sub_1C9F08188();
    if (OUTLINED_FUNCTION_5(v52))
    {
      int v53 = (_WORD *)OUTLINED_FUNCTION_1_2();
      OUTLINED_FUNCTION_4_2(v53);
      OUTLINED_FUNCTION_196(&dword_1C9EC7000, v54, v55, "Broker is already deallocated so we just remove sessions");
      OUTLINED_FUNCTION_1();
    }

    sub_1C9F069B8();
    type metadata accessor for Session();
    sub_1C9F033E8((unint64_t *)&unk_1EBC7F968, MEMORY[0x1E4F27990]);
    uint64_t v56 = sub_1C9F07F88();
    OUTLINED_FUNCTION_47_1();
    *(void *)(v2 + 48) = v56;
    swift_bridgeObjectRelease();
    uint64_t v57 = sub_1C9F07F88();
    swift_release();
    *(void *)(v2 + 40) = v57;
    swift_bridgeObjectRelease();
    goto LABEL_52;
  }
  if ((v4 & 1) != 0 || v93 <= 0.0)
  {
    uint64_t v39 = (void (*)(char *, uint64_t, uint64_t))v99;
    uint64_t v40 = *(void (**)(char *, uint64_t, uint64_t))(v98 + 16);
    v40(v96, *(void *)(v99 + OBJC_IVAR____TtC14SiriMessageBus7Session_conversationSession)+ OBJC_IVAR____TtC14SiriMessageBus19ConversationSession_sessionType, v97);
    *(void *)&double v41 = (char *)v39 + OBJC_IVAR____TtC14SiriMessageBus7Session_sessionId;
    OUTLINED_FUNCTION_10_5();
    double v93 = v41;
    sub_1C9F02420(*(uint64_t *)&v41);
    swift_endAccess();
    swift_release();
    OUTLINED_FUNCTION_10_5();
    swift_bridgeObjectRetain();
    sub_1C9F02314((uint64_t)v95, v7);
    swift_endAccess();
    swift_bridgeObjectRelease();
    swift_release();
    if (qword_1EBC7F680 != -1) {
      swift_once();
    }
    uint64_t v42 = sub_1C9F07E78();
    uint64_t v43 = __swift_project_value_buffer(v42, (uint64_t)qword_1EBC7FEF0);
    OUTLINED_FUNCTION_318();
    swift_retain_n();
    swift_retain_n();
    uint64_t v92 = v43;
    uint64_t v44 = sub_1C9F07E68();
    os_log_type_t v45 = sub_1C9F08158();
    if (os_log_type_enabled(v44, v45))
    {
      uint64_t v46 = OUTLINED_FUNCTION_11_3();
      v101[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v46 = 136315650;
      sub_1C9F069B8();
      unint64_t v90 = v40;
      sub_1C9F033E8((unint64_t *)&unk_1EBC7F010, MEMORY[0x1E4F27990]);
      uint64_t v47 = sub_1C9F08378();
      uint64_t v100 = sub_1C9F01420(v47, v48, v101);
      sub_1C9F08228();
      swift_release_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v46 + 12) = 2080;
      swift_bridgeObjectRetain();
      uint64_t v100 = sub_1C9F01420((uint64_t)v95, v7, v101);
      sub_1C9F08228();
      OUTLINED_FUNCTION_257();
      *(_WORD *)(v46 + 22) = 2048;
      uint64_t v49 = *(void *)(*(void *)(v2 + 48) + 16);
      swift_release();
      uint64_t v100 = v49;
      uint64_t v40 = v90;
      sub_1C9F08228();
      swift_release();
      _os_log_impl(&dword_1C9EC7000, v44, v45, "Remove session id: %s for assistantId: %s, reminding sessions: %ld", (uint8_t *)v46, 0x20u);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_1();
      uint64_t v39 = (void (*)(char *, uint64_t, uint64_t))v99;
      OUTLINED_FUNCTION_1();
    }
    else
    {

      swift_bridgeObjectRelease_n();
      swift_release_n();
      swift_release_n();
    }
    uint64_t v58 = v94;
    uint64_t v59 = v97;
    v40(v94, (uint64_t)v96, v97);
    uint64_t v60 = (*(uint64_t (**)(char *, uint64_t))(v98 + 88))(v58, v59);
    if (v60 == *MEMORY[0x1E4FA26B0])
    {
      MEMORY[0x1F4188790](v60);
      *(&v90 - 4) = v95;
      *(&v90 - 3) = (void (*)(char *, uint64_t, uint64_t))v7;
      *(&v90 - 2) = v39;
      id v61 = objc_allocWithZone((Class)sub_1C9F06A28());
      uint64_t v62 = (void *)sub_1C9F06A18();
      if (!v62)
      {
        OUTLINED_FUNCTION_318();
        uint64_t v63 = sub_1C9F07E68();
        os_log_type_t v64 = sub_1C9F08168();
        if (OUTLINED_FUNCTION_19_1(v64))
        {
          uint64_t v65 = (uint8_t *)OUTLINED_FUNCTION_34_0();
          v101[0] = OUTLINED_FUNCTION_11_3();
          OUTLINED_FUNCTION_17_3(4.8149e-34);
          uint64_t v66 = OUTLINED_FUNCTION_30_2();
          OUTLINED_FUNCTION_4_3(v66);
          OUTLINED_FUNCTION_257();
          uint64_t v67 = "Cannot create SessionEndedMessage for assistantId: %s";
LABEL_48:
          _os_log_impl(&dword_1C9EC7000, v63, (os_log_type_t)&v90, v67, v65, 0xCu);
          swift_arrayDestroy();
          OUTLINED_FUNCTION_1();
          OUTLINED_FUNCTION_1();
          swift_release();
LABEL_50:

          goto LABEL_51;
        }
        goto LABEL_49;
      }
    }
    else if (v60 == *MEMORY[0x1E4FA26B8])
    {
      MEMORY[0x1F4188790](v60);
      OUTLINED_FUNCTION_20_3();
      id v68 = objc_allocWithZone((Class)sub_1C9F07308());
      uint64_t v62 = (void *)sub_1C9F06A18();
      if (!v62)
      {
        OUTLINED_FUNCTION_318();
        uint64_t v63 = sub_1C9F07E68();
        os_log_type_t v69 = sub_1C9F08168();
        if (OUTLINED_FUNCTION_19_1(v69))
        {
          uint64_t v65 = (uint8_t *)OUTLINED_FUNCTION_34_0();
          v101[0] = OUTLINED_FUNCTION_11_3();
          OUTLINED_FUNCTION_17_3(4.8149e-34);
          uint64_t v70 = OUTLINED_FUNCTION_30_2();
          OUTLINED_FUNCTION_4_3(v70);
          OUTLINED_FUNCTION_257();
          uint64_t v67 = "Cannot create EndSpeechDictationSessionMessage for assistantId %s";
          goto LABEL_48;
        }
LABEL_49:
        swift_release();
        swift_bridgeObjectRelease_n();
        goto LABEL_50;
      }
    }
    else
    {
      if (v60 != *MEMORY[0x1E4FA26A8])
      {
        uint64_t v77 = (void *)sub_1C9F07E68();
        os_log_type_t v78 = sub_1C9F08168();
        if (OUTLINED_FUNCTION_5(v78))
        {
          uint64_t v79 = (_WORD *)OUTLINED_FUNCTION_1_2();
          OUTLINED_FUNCTION_4_2(v79);
          OUTLINED_FUNCTION_196(&dword_1C9EC7000, v80, v81, "Cannot post end session message for unknown session type");
          OUTLINED_FUNCTION_1();
        }
        swift_release();

        swift_release();
        uint64_t v82 = v97;
        long long v83 = *(void (**)(char *, uint64_t))(v98 + 8);
        v83(v96, v97);
        v83(v58, v82);
        goto LABEL_52;
      }
      MEMORY[0x1F4188790](v60);
      OUTLINED_FUNCTION_20_3();
      id v71 = objc_allocWithZone((Class)sub_1C9F07738());
      uint64_t v62 = (void *)sub_1C9F06A18();
      if (!v62)
      {
        OUTLINED_FUNCTION_318();
        uint64_t v63 = sub_1C9F07E68();
        os_log_type_t v88 = sub_1C9F08168();
        if (OUTLINED_FUNCTION_19_1(v88))
        {
          uint64_t v65 = (uint8_t *)OUTLINED_FUNCTION_34_0();
          v101[0] = OUTLINED_FUNCTION_11_3();
          OUTLINED_FUNCTION_17_3(4.8149e-34);
          uint64_t v89 = OUTLINED_FUNCTION_30_2();
          OUTLINED_FUNCTION_4_3(v89);
          OUTLINED_FUNCTION_257();
          uint64_t v67 = "Cannot create EndUnderstandingDictationSessionMessage for assistantId %s";
          goto LABEL_48;
        }
        goto LABEL_49;
      }
    }
    uint64_t v72 = v62;
    sub_1C9ED0FAC(v62);
    swift_release();

LABEL_51:
    swift_release();
    (*(void (**)(char *, uint64_t))(v98 + 8))(v96, v97);
    goto LABEL_52;
  }
  if (qword_1EBC7F680 != -1) {
    swift_once();
  }
  uint64_t v29 = sub_1C9F07E78();
  __swift_project_value_buffer(v29, (uint64_t)qword_1EBC7FEF0);
  OUTLINED_FUNCTION_318();
  uint64_t v30 = sub_1C9F07E68();
  os_log_type_t v31 = sub_1C9F08158();
  if (os_log_type_enabled(v30, v31))
  {
    uint64_t v32 = OUTLINED_FUNCTION_29();
    uint64_t v98 = OUTLINED_FUNCTION_11_3();
    v101[0] = v98;
    *(_DWORD *)uint64_t v32 = 136315394;
    uint64_t v97 = v32 + 4;
    swift_bridgeObjectRetain();
    uint64_t v100 = sub_1C9F01420((uint64_t)v95, v7, v101);
    sub_1C9F08228();
    OUTLINED_FUNCTION_257();
    *(_WORD *)(v32 + 12) = 2048;
    uint64_t v100 = *(void *)&v93;
    sub_1C9F08228();
    _os_log_impl(&dword_1C9EC7000, v30, v31, "Asked to endSession for assistantId: %s with a delay of %f seconds, so not ending it now", (uint8_t *)v32, 0x16u);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_1();
    OUTLINED_FUNCTION_1();
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  uint64_t v73 = v92;
  sub_1C9F06958();
  sub_1C9F06928();
  uint64_t v74 = *(void (**)(void))(v73 + 8);
  OUTLINED_FUNCTION_16_4();
  v74();
  uint64_t v75 = v99 + OBJC_IVAR____TtC14SiriMessageBus7Session_expirationTime;
  OUTLINED_FUNCTION_10_5();
  (*(void (**)(uint64_t, char *, uint64_t))(v73 + 40))(v75, v26, v18);
  swift_endAccess();
  uint64_t v76 = v2 + OBJC_IVAR____TtC14SiriMessageBus15SessionsManager_nextExpirationTaskTimeCheck;
  OUTLINED_FUNCTION_15_0();
  sub_1C9F025A8(v76, v1);
  if (__swift_getEnumTagSinglePayload(v1, 1, v18))
  {
    sub_1C9F02610(v1);
  }
  else
  {
    long long v84 = *(void (**)(char *, uint64_t, uint64_t))(v73 + 16);
    v84(v26, v1, v18);
    sub_1C9F02610(v1);
    v84(v23, v75, v18);
    sub_1C9F06948();
    double v86 = v85;
    OUTLINED_FUNCTION_16_4();
    v74();
    OUTLINED_FUNCTION_16_4();
    v74();
    if (v86 > 0.0)
    {
      swift_release();
      swift_release();
      goto LABEL_52;
    }
  }
  if (*(void *)(v2 + OBJC_IVAR____TtC14SiriMessageBus15SessionsManager_expirationScheduleTask))
  {
    swift_retain();
    sub_1C9F07F18();
    swift_release();
  }
  OUTLINED_FUNCTION_22_0();
  v87();
  sub_1C9F00D4C();
  swift_release();
  swift_release();
  OUTLINED_FUNCTION_16_4();
  v74();
LABEL_52:
  OUTLINED_FUNCTION_13_3();
}

uint64_t sub_1C9F00388()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC7F020);
  uint64_t v2 = OUTLINED_FUNCTION_10_3(v1);
  MEMORY[0x1F4188790](v2);
  OUTLINED_FUNCTION_12_0();
  uint64_t v5 = v4 - v3;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC7FCF0);
  uint64_t v7 = OUTLINED_FUNCTION_10_3(v6);
  MEMORY[0x1F4188790](v7);
  OUTLINED_FUNCTION_272();
  uint64_t v8 = *MEMORY[0x1E4FA22F8];
  uint64_t v9 = sub_1C9F07A48();
  OUTLINED_FUNCTION_15();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 104))(v0, v8, v9);
  __swift_storeEnumTagSinglePayload(v0, 0, 1, v9);
  sub_1C9F079C8();
  swift_bridgeObjectRetain();
  sub_1C9F079B8();
  uint64_t v11 = sub_1C9F069B8();
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_22_0();
  v12();
  __swift_storeEnumTagSinglePayload(v5, 0, 1, v11);
  return sub_1C9F079D8();
}

void sub_1C9F00514()
{
  OUTLINED_FUNCTION_11_4();
  uint64_t v2 = v0;
  uint64_t v3 = sub_1C9F06968();
  OUTLINED_FUNCTION_0();
  uint64_t v5 = v4;
  MEMORY[0x1F4188790](v6);
  OUTLINED_FUNCTION_18_3();
  uint64_t v8 = MEMORY[0x1F4188790](v7);
  id v68 = (char *)&v63 - v9;
  MEMORY[0x1F4188790](v8);
  uint64_t v11 = (char *)&v63 - v10;
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC7F958);
  uint64_t v13 = OUTLINED_FUNCTION_10_3(v12);
  MEMORY[0x1F4188790](v13);
  OUTLINED_FUNCTION_12_0();
  uint64_t v16 = v15 - v14;
  __swift_storeEnumTagSinglePayload(v15 - v14, 1, 1, v3);
  uint64_t v17 = v2 + OBJC_IVAR____TtC14SiriMessageBus15SessionsManager_nextExpirationTaskTimeCheck;
  OUTLINED_FUNCTION_10_5();
  sub_1C9F0338C(v16, v17, &qword_1EBC7F958);
  swift_endAccess();
  *(void *)(v2 + OBJC_IVAR____TtC14SiriMessageBus15SessionsManager_expirationScheduleTask) = 0;
  swift_release();
  OUTLINED_FUNCTION_47_1();
  if (*(void *)(*(void *)(v2 + 40) + 16))
  {
    uint64_t Strong = swift_weakLoadStrong();
    swift_release();
    if (Strong)
    {
      uint64_t v65 = v2 + 40;
      double v19 = *(double *)(v2 + 16);
      sub_1C9F06958();
      uint64_t v20 = v68;
      sub_1C9F06928();
      uint64_t v21 = *(void *)(v2 + 40);
      uint64_t v22 = *(void *)(v21 + 64);
      uint64_t v72 = v21 + 64;
      uint64_t v23 = 1 << *(unsigned char *)(v21 + 32);
      uint64_t v24 = -1;
      if (v23 < 64) {
        uint64_t v24 = ~(-1 << v23);
      }
      unint64_t v25 = v24 & v22;
      int64_t v73 = (unint64_t)(v23 + 63) >> 6;
      uint64_t v76 = v5 + 16;
      uint64_t v26 = (void (**)(void))(v5 + 8);
      os_log_type_t v64 = (void (**)(char *, uint64_t, uint64_t))(v5 + 32);
      uint64_t v77 = v21;
      swift_bridgeObjectRetain();
      int64_t v27 = 0;
      *(void *)&long long v28 = 136315394;
      long long v67 = v28;
      uint64_t v66 = MEMORY[0x1E4FBC840] + 8;
      uint64_t v75 = (void (**)(void))(v5 + 8);
      uint64_t v70 = v1;
      id v71 = v11;
      while (1)
      {
        if (v25)
        {
          unint64_t v29 = __clz(__rbit64(v25));
          v25 &= v25 - 1;
          unint64_t v30 = v29 | (v27 << 6);
        }
        else
        {
          int64_t v31 = v27 + 1;
          if (__OFADD__(v27, 1))
          {
            __break(1u);
LABEL_49:
            __break(1u);
            goto LABEL_50;
          }
          if (v31 >= v73) {
            goto LABEL_35;
          }
          unint64_t v32 = *(void *)(v72 + 8 * v31);
          ++v27;
          if (!v32)
          {
            int64_t v27 = v31 + 1;
            if (v31 + 1 >= v73) {
              goto LABEL_35;
            }
            unint64_t v32 = *(void *)(v72 + 8 * v27);
            if (!v32)
            {
              int64_t v27 = v31 + 2;
              if (v31 + 2 >= v73) {
                goto LABEL_35;
              }
              unint64_t v32 = *(void *)(v72 + 8 * v27);
              if (!v32)
              {
                int64_t v33 = v31 + 3;
                if (v33 >= v73)
                {
LABEL_35:
                  swift_release();
                  if (*(void *)(*(void *)v65 + 16)) {
                    sub_1C9F00D4C();
                  }
                  uint64_t v49 = *v26;
                  OUTLINED_FUNCTION_6_4();
                  v49();
                  OUTLINED_FUNCTION_6_4();
                  v49();
                  goto LABEL_47;
                }
                unint64_t v32 = *(void *)(v72 + 8 * v33);
                if (!v32)
                {
                  while (1)
                  {
                    int64_t v27 = v33 + 1;
                    if (__OFADD__(v33, 1)) {
                      goto LABEL_49;
                    }
                    if (v27 >= v73) {
                      goto LABEL_35;
                    }
                    unint64_t v32 = *(void *)(v72 + 8 * v27);
                    ++v33;
                    if (v32) {
                      goto LABEL_21;
                    }
                  }
                }
                int64_t v27 = v33;
              }
            }
          }
LABEL_21:
          unint64_t v25 = (v32 - 1) & v32;
          unint64_t v30 = __clz(__rbit64(v32)) + (v27 << 6);
        }
        uint64_t v34 = (uint64_t *)(*(void *)(v77 + 48) + 16 * v30);
        unint64_t v35 = v34[1];
        uint64_t v78 = *v34;
        OUTLINED_FUNCTION_15_0();
        OUTLINED_FUNCTION_22_0();
        v36();
        swift_bridgeObjectRetain();
        swift_retain();
        if (sub_1C9F06938())
        {
          int64_t v74 = v27;
          if (qword_1EBC7F680 != -1) {
            swift_once();
          }
          uint64_t v37 = sub_1C9F07E78();
          __swift_project_value_buffer(v37, (uint64_t)qword_1EBC7FEF0);
          swift_bridgeObjectRetain_n();
          swift_retain_n();
          uint64_t v38 = sub_1C9F07E68();
          os_log_type_t v39 = sub_1C9F08188();
          if (os_log_type_enabled(v38, v39))
          {
            uint64_t v40 = OUTLINED_FUNCTION_29();
            uint64_t v69 = swift_slowAlloc();
            v79[0] = v69;
            *(_DWORD *)uint64_t v40 = v67;
            sub_1C9F069B8();
            sub_1C9F033E8((unint64_t *)&unk_1EBC7F010, MEMORY[0x1E4F27990]);
            uint64_t v20 = v68;
            uint64_t v41 = sub_1C9F08378();
            *(void *)(v40 + 4) = sub_1C9F01420(v41, v42, v79);
            swift_release_n();
            swift_bridgeObjectRelease();
            *(_WORD *)(v40 + 12) = 2080;
            swift_bridgeObjectRetain();
            *(void *)(v40 + 14) = sub_1C9F01420(v78, v35, v79);
            swift_bridgeObjectRelease_n();
            _os_log_impl(&dword_1C9EC7000, v38, v39, "Session id: %s for assistant Id: %s is expired", (uint8_t *)v40, 0x16u);
            swift_arrayDestroy();
            OUTLINED_FUNCTION_1();
            OUTLINED_FUNCTION_1();
          }
          else
          {

            swift_bridgeObjectRelease_n();
            swift_release_n();
          }
          sub_1C9EFF644();
          swift_release();
          swift_bridgeObjectRelease();
          uint64_t v26 = v75;
          uint64_t v1 = v70;
          OUTLINED_FUNCTION_6_4();
          v47();
          int64_t v27 = v74;
        }
        else
        {
          swift_bridgeObjectRelease();
          sub_1C9F06948();
          double v44 = v43;
          swift_release();
          uint64_t v26 = v75;
          if (v44 > 0.0 && v44 < v19)
          {
            OUTLINED_FUNCTION_6_4();
            v48();
            (*v64)(v20, v1, v3);
            double v19 = v44;
          }
          else
          {
            OUTLINED_FUNCTION_6_4();
            v46();
          }
        }
      }
    }
    if (qword_1EBC7F680 != -1) {
      swift_once();
    }
    uint64_t v56 = sub_1C9F07E78();
    uint64_t v57 = (void *)OUTLINED_FUNCTION_2_2(v56, (uint64_t)qword_1EBC7FEF0);
    os_log_type_t v58 = sub_1C9F08188();
    if (OUTLINED_FUNCTION_5(v58))
    {
      uint64_t v59 = (_WORD *)OUTLINED_FUNCTION_1_2();
      OUTLINED_FUNCTION_4_2(v59);
      OUTLINED_FUNCTION_196(&dword_1C9EC7000, v60, v61, "Broker does not exist anymore so just remove all sessions");
      OUTLINED_FUNCTION_1();
    }

    type metadata accessor for Session();
    *(void *)(v2 + 40) = sub_1C9F07F88();
    swift_bridgeObjectRelease();
    sub_1C9F069B8();
    sub_1C9F033E8((unint64_t *)&unk_1EBC7F968, MEMORY[0x1E4F27990]);
    uint64_t v62 = sub_1C9F07F88();
    OUTLINED_FUNCTION_47_1();
    *(void *)(v2 + 48) = v62;
    swift_bridgeObjectRelease();
  }
  else
  {
    if (qword_1EBC7F680 != -1) {
LABEL_50:
    }
      swift_once();
    uint64_t v50 = sub_1C9F07E78();
    unint64_t v51 = (void *)OUTLINED_FUNCTION_2_2(v50, (uint64_t)qword_1EBC7FEF0);
    os_log_type_t v52 = sub_1C9F08158();
    if (OUTLINED_FUNCTION_5(v52))
    {
      int v53 = (_WORD *)OUTLINED_FUNCTION_1_2();
      OUTLINED_FUNCTION_4_2(v53);
      OUTLINED_FUNCTION_196(&dword_1C9EC7000, v54, v55, "No active sessions nothing to do...");
      OUTLINED_FUNCTION_1();
    }
  }
LABEL_47:
  OUTLINED_FUNCTION_13_3();
}

void sub_1C9F00D4C()
{
  OUTLINED_FUNCTION_11_4();
  double v2 = v1;
  uint64_t v28 = v3;
  sub_1C9F07EF8();
  OUTLINED_FUNCTION_0();
  uint64_t v29 = v5;
  uint64_t v30 = v4;
  MEMORY[0x1F4188790](v4);
  OUTLINED_FUNCTION_15_4();
  uint64_t v8 = v6 - v7;
  MEMORY[0x1F4188790](v9);
  uint64_t v11 = (char *)&v28 - v10;
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC7F958);
  uint64_t v13 = OUTLINED_FUNCTION_10_3(v12);
  MEMORY[0x1F4188790](v13);
  OUTLINED_FUNCTION_15_4();
  uint64_t v16 = v14 - v15;
  MEMORY[0x1F4188790](v17);
  double v19 = (char *)&v28 - v18;
  sub_1C9F07E98();
  OUTLINED_FUNCTION_15();
  MEMORY[0x1F4188790](v20);
  OUTLINED_FUNCTION_12_0();
  v32[4] = sub_1C9F01300;
  uint64_t v33 = v0;
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 1107296256;
  void v32[2] = sub_1C9EDF1A8;
  uint64_t v32[3] = &block_descriptor_3;
  _Block_copy(v32);
  uint64_t v31 = MEMORY[0x1E4FBC860];
  sub_1C9F033E8((unint64_t *)&unk_1EBC7F7E0, MEMORY[0x1E4FBCB00]);
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC7F7F8);
  sub_1C9ED0E78();
  sub_1C9F08278();
  sub_1C9F07F28();
  swift_allocObject();
  uint64_t v21 = sub_1C9F07F08();
  swift_release();
  *(void *)(v0 + OBJC_IVAR____TtC14SiriMessageBus15SessionsManager_expirationScheduleTask) = v21;
  swift_retain();
  swift_release();
  uint64_t v22 = sub_1C9F06968();
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_22_0();
  v24(v23);
  __swift_storeEnumTagSinglePayload((uint64_t)v19, 0, 1, v22);
  sub_1C9ECF400((uint64_t)v19, v16, &qword_1EBC7F958);
  uint64_t v25 = v0 + OBJC_IVAR____TtC14SiriMessageBus15SessionsManager_nextExpirationTaskTimeCheck;
  OUTLINED_FUNCTION_10_5();
  sub_1C9F0338C(v16, v25, &qword_1EBC7F958);
  swift_endAccess();
  sub_1C9F07EE8();
  MEMORY[0x1CB7947A0](v8, v2);
  uint64_t v26 = v30;
  int64_t v27 = *(void (**)(uint64_t, uint64_t))(v29 + 8);
  v27(v8, v30);
  sub_1C9F081B8();
  swift_release();
  v27((uint64_t)v11, v26);
  OUTLINED_FUNCTION_13_3();
}

uint64_t sub_1C9F010A8()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1C9F02610(v0 + OBJC_IVAR____TtC14SiriMessageBus15SessionsManager_nextExpirationTaskTimeCheck);
  swift_release();
  swift_weakDestroy();
  return v0;
}

uint64_t sub_1C9F01108()
{
  sub_1C9F010A8();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return MEMORY[0x1F4186488](v0, v1, v2);
}

uint64_t sub_1C9F01160()
{
  return type metadata accessor for SessionsManager();
}

uint64_t type metadata accessor for SessionsManager()
{
  uint64_t result = qword_1EBC7F9B8;
  if (!qword_1EBC7F9B8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_1C9F011B0()
{
  sub_1C9F01284();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

void sub_1C9F01284()
{
  if (!qword_1EBC7F960)
  {
    sub_1C9F06968();
    unint64_t v0 = sub_1C9F08218();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EBC7F960);
    }
  }
}

uint64_t sub_1C9F012DC()
{
  return sub_1C9EFECF0();
}

uint64_t block_copy_helper_3(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_3()
{
  return swift_release();
}

id sub_1C9F0131C(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    uint64_t v3 = (void *)sub_1C9F07FD8();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v3 = 0;
  }
  id v4 = objc_msgSend(v2, sel_initWithSuiteName_, v3);

  return v4;
}

uint64_t sub_1C9F01380(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_1C9F013A8(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6 = a4();
  sub_1C9F01420(v6, v7, a3);
  uint64_t v8 = *a1 + 8;
  sub_1C9F08228();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v8;
  return result;
}

uint64_t sub_1C9F01420(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_1C9F014F4(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_1C9ED7CC0((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    uint64_t ObjectType = MEMORY[0x1E4FBB9B0];
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_1C9ED7CC0((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
}

uint64_t sub_1C9F014F4(void *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0 && __dst && a3 - (uint64_t)__dst > (uint64_t)(HIBYTE(a6) & 0xF))
    {
      __src[0] = a5;
      __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
      sub_1C9F0164C((char *)__src, HIBYTE(a6) & 0xF, __dst);
      sub_1C9F08238();
      uint64_t result = 0;
      *a1 = __dst;
      return result;
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    uint64_t result = sub_1C9F01724(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    uint64_t v8 = sub_1C9F082D8();
    if (!v8)
    {
      uint64_t result = sub_1C9F08308();
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

void *sub_1C9F0164C(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)sub_1C9F08338();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

uint64_t sub_1C9F01724(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_1C9F017BC(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = (uint64_t)sub_1C9F019F4(0, *(void *)(v2 + 16) + 1, 1, v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = (uint64_t)sub_1C9F019F4((char *)(v3 > 1), v4 + 1, 1, v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_1C9F017BC(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0)
  {
    uint64_t v2 = sub_1C9F08048();
    if (v2) {
      goto LABEL_6;
    }
    return MEMORY[0x1E4FBC860];
  }
  if ((a2 & 0x2000000000000000) != 0) {
    uint64_t v2 = HIBYTE(a2) & 0xF;
  }
  else {
    uint64_t v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (!v2) {
    return MEMORY[0x1E4FBC860];
  }
LABEL_6:
  unint64_t v3 = sub_1C9F01930(v2, 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    unint64_t v4 = v3;
    uint64_t v5 = sub_1C9F082B8();
    if ((v6 & 1) != 0 || v5 != v2) {
      goto LABEL_14;
    }
    return (uint64_t)v4;
  }
  sub_1C9F08338();
  __break(1u);
LABEL_14:
  uint64_t result = sub_1C9F08308();
  __break(1u);
  return result;
}

void *sub_1C9F01930(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return (void *)MEMORY[0x1E4FBC860];
  }
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBC7FE90);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_1C9F01998(unint64_t a1, uint64_t a2, uint64_t a3)
{
  if ((a3 & 0x1000000000000000) == 0 || (a2 & 0x800000000000000) != 0)
  {
    uint64_t v6 = sub_1C9F08098();
    OUTLINED_FUNCTION_25_2(v6);
    return v7 | 4;
  }
  else
  {
    uint64_t v3 = MEMORY[0x1CB7948C0](15, a1 >> 16);
    OUTLINED_FUNCTION_25_2(v3);
    return v4 | 8;
  }
}

char *sub_1C9F019F4(char *result, int64_t a2, char a3, uint64_t a4)
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
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBC7FE90);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x1E4FBC860];
  }
  uint64_t v12 = v10 + 32;
  uint64_t v13 = (char *)(a4 + 32);
  if (v5)
  {
    sub_1C9F01ACC(v13, v8, v12);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_1C9ECE180(v13, v8, v12);
  }
  swift_bridgeObjectRelease();
  return v10;
}

char *sub_1C9F01ACC(char *__src, size_t __len, char *__dst)
{
  if ((__len & 0x8000000000000000) != 0)
  {
    __src = (char *)sub_1C9F08338();
    __break(1u);
  }
  else if (__dst != __src || &__src[__len] <= __dst)
  {
    return (char *)memmove(__dst, __src, __len);
  }
  return __src;
}

unint64_t sub_1C9F01B5C(uint64_t a1, uint64_t a2)
{
  sub_1C9F08408();
  sub_1C9F08028();
  uint64_t v4 = sub_1C9F08418();
  return sub_1C9F01E50(a1, a2, v4);
}

void sub_1C9F01BD4(uint64_t a1)
{
  sub_1C9F07BD8();
  uint64_t v2 = (void (*)(uint64_t))MEMORY[0x1E4FA2670];
  sub_1C9F033E8(&qword_1EBC7FD20, MEMORY[0x1E4FA2670]);
  uint64_t v3 = sub_1C9F07FA8();
  sub_1C9F01F34(a1, v3, MEMORY[0x1E4FA2670], (unint64_t *)&unk_1EBC7FD28, v2, MEMORY[0x1E4FA2680]);
}

void sub_1C9F01CA8(uint64_t a1)
{
  sub_1C9F07C98();
  uint64_t v2 = (void (*)(uint64_t))MEMORY[0x1E4FA26E0];
  sub_1C9F033E8(&qword_1EA5CECB0, MEMORY[0x1E4FA26E0]);
  uint64_t v3 = sub_1C9F07FA8();
  sub_1C9F01F34(a1, v3, MEMORY[0x1E4FA26E0], &qword_1EA5CECB8, v2, MEMORY[0x1E4FA26F0]);
}

void sub_1C9F01D7C(uint64_t a1)
{
  sub_1C9F069B8();
  uint64_t v2 = (void (*)(uint64_t))MEMORY[0x1E4F27990];
  sub_1C9F033E8((unint64_t *)&unk_1EBC7F968, MEMORY[0x1E4F27990]);
  uint64_t v3 = sub_1C9F07FA8();
  sub_1C9F01F34(a1, v3, MEMORY[0x1E4F27990], &qword_1EBC7F978, v2, MEMORY[0x1E4F279B0]);
}

unint64_t sub_1C9F01E50(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_1C9F08388() & 1) == 0)
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
      while (!v14 && (sub_1C9F08388() & 1) == 0);
    }
  }
  return v6;
}

void sub_1C9F01F34(uint64_t a1, uint64_t a2, uint64_t (*a3)(void), unint64_t *a4, void (*a5)(uint64_t), uint64_t a6)
{
  uint64_t v24 = a5;
  uint64_t v25 = a6;
  uint64_t v23 = a4;
  v21[1] = a1;
  uint64_t v8 = a3(0);
  OUTLINED_FUNCTION_0();
  uint64_t v10 = v9;
  MEMORY[0x1F4188790]();
  uint64_t v12 = (char *)v21 - v11;
  uint64_t v22 = v6;
  uint64_t v13 = -1 << *(unsigned char *)(v6 + 32);
  unint64_t v14 = a2 & ~v13;
  v21[0] = v6 + 64;
  if ((*(void *)(v6 + 64 + ((v14 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v14))
  {
    uint64_t v15 = ~v13;
    uint64_t v18 = *(void (**)(char *, unint64_t, uint64_t))(v10 + 16);
    uint64_t v17 = v10 + 16;
    uint64_t v16 = v18;
    uint64_t v19 = *(void *)(v17 + 56);
    do
    {
      v16(v12, *(void *)(v22 + 48) + v19 * v14, v8);
      sub_1C9F033E8(v23, v24);
      char v20 = sub_1C9F07FC8();
      (*(void (**)(char *, uint64_t))(v17 - 8))(v12, v8);
      if (v20) {
        break;
      }
      unint64_t v14 = (v14 + 1) & v15;
    }
    while (((*(void *)(v21[0] + ((v14 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v14) & 1) != 0);
  }
  OUTLINED_FUNCTION_11_1();
}

void sub_1C9F020A4()
{
  OUTLINED_FUNCTION_26_2();
  sub_1C9F01BD4(v1);
  uint64_t v4 = v3;
  char v6 = v5;
  swift_bridgeObjectRelease();
  if (v6)
  {
    swift_isUniquelyReferenced_nonNull_native();
    OUTLINED_FUNCTION_22_2();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC7FE18);
    OUTLINED_FUNCTION_44_1();
    sub_1C9F07BD8();
    OUTLINED_FUNCTION_15();
    uint64_t v7 = OUTLINED_FUNCTION_45_1();
    v8(v7);
    sub_1C9F0337C((_OWORD *)(*(void *)(v10 + 56) + 32 * v4), v2);
    sub_1C9F033E8(&qword_1EBC7FD20, MEMORY[0x1E4FA2670]);
    sub_1C9F082F8();
    void *v0 = v10;
    OUTLINED_FUNCTION_46_1();
    swift_bridgeObjectRelease();
  }
  else
  {
    *uint64_t v2 = 0u;
    v2[1] = 0u;
    OUTLINED_FUNCTION_46_1();
  }
}

void sub_1C9F021E0()
{
  OUTLINED_FUNCTION_26_2();
  sub_1C9F01CA8(v1);
  uint64_t v4 = v3;
  char v6 = v5;
  swift_bridgeObjectRelease();
  if (v6)
  {
    swift_isUniquelyReferenced_nonNull_native();
    OUTLINED_FUNCTION_22_2();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EA5CECA8);
    OUTLINED_FUNCTION_44_1();
    sub_1C9F07C98();
    OUTLINED_FUNCTION_15();
    uint64_t v7 = OUTLINED_FUNCTION_45_1();
    v8(v7);
    sub_1C9ECF400(*(void *)(v9 + 56) + 32 * v4, (uint64_t)v2, &qword_1EBC7F868);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC7F868);
    sub_1C9F033E8(&qword_1EA5CECB0, MEMORY[0x1E4FA26E0]);
    sub_1C9F082F8();
    void *v0 = v9;
    swift_bridgeObjectRelease();
  }
  else
  {
    *uint64_t v2 = 0;
    v2[1] = 0;
    v2[2] = 0;
    v2[3] = 1;
  }
  OUTLINED_FUNCTION_46_1();
}

uint64_t sub_1C9F02314(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  swift_bridgeObjectRetain();
  unint64_t v6 = sub_1C9F01B5C(a1, a2);
  LOBYTE(a2) = v7;
  swift_bridgeObjectRelease();
  if ((a2 & 1) == 0) {
    return 0;
  }
  swift_isUniquelyReferenced_nonNull_native();
  uint64_t v10 = *v3;
  *uint64_t v3 = 0x8000000000000000;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC7FE28);
  sub_1C9F082E8();
  swift_bridgeObjectRelease();
  uint64_t v8 = *(void *)(*(void *)(v10 + 56) + 8 * v6);
  type metadata accessor for Session();
  sub_1C9F082F8();
  *uint64_t v3 = v10;
  swift_bridgeObjectRelease();
  return v8;
}

uint64_t sub_1C9F02420(uint64_t a1)
{
  uint64_t v2 = v1;
  swift_bridgeObjectRetain();
  sub_1C9F01D7C(a1);
  uint64_t v5 = v4;
  LOBYTE(a1) = v6;
  swift_bridgeObjectRelease();
  if ((a1 & 1) == 0) {
    return 0;
  }
  swift_isUniquelyReferenced_nonNull_native();
  uint64_t v11 = *v2;
  *uint64_t v2 = 0x8000000000000000;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC7FE10);
  sub_1C9F082E8();
  uint64_t v7 = *(void *)(v11 + 48);
  uint64_t v8 = sub_1C9F069B8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(v7 + *(void *)(*(void *)(v8 - 8) + 72) * v5, v8);
  uint64_t v9 = *(void *)(*(void *)(v11 + 56) + 8 * v5);
  type metadata accessor for Session();
  sub_1C9F033E8((unint64_t *)&unk_1EBC7F968, MEMORY[0x1E4F27990]);
  sub_1C9F082F8();
  *uint64_t v2 = v11;
  swift_bridgeObjectRelease();
  return v9;
}

uint64_t sub_1C9F02588()
{
  return sub_1C9F00388();
}

uint64_t sub_1C9F025A8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC7F958);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1C9F02610(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC7F958);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1C9F02670(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1C9F027AC(a1, a2, a3, (void (*)(uint64_t))sub_1C9F02894);
}

uint64_t sub_1C9F02688(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  OUTLINED_FUNCTION_41_1();
  uint64_t v6 = OUTLINED_FUNCTION_12_2();
  sub_1C9F029B0(v6, v7, v8, a4);
  *uint64_t v4 = v11;
  OUTLINED_FUNCTION_46_1();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1C9F026F0(uint64_t a1, uint64_t a2)
{
  return sub_1C9F02720(a1, a2, (void (*)(uint64_t, uint64_t, uint64_t))sub_1C9F02AF0);
}

uint64_t sub_1C9F02708(uint64_t a1, uint64_t a2)
{
  return sub_1C9F02720(a1, a2, (void (*)(uint64_t, uint64_t, uint64_t))sub_1C9F02C60);
}

uint64_t sub_1C9F02720(uint64_t a1, uint64_t a2, void (*a3)(uint64_t, uint64_t, uint64_t))
{
  uint64_t isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v10 = *v3;
  *uint64_t v3 = 0x8000000000000000;
  a3(a1, a2, isUniquelyReferenced_nonNull_native);
  *uint64_t v3 = v10;
  OUTLINED_FUNCTION_46_1();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1C9F027AC(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t))
{
  OUTLINED_FUNCTION_41_1();
  uint64_t v6 = OUTLINED_FUNCTION_12_2();
  a4(v6);
  *uint64_t v4 = v9;
  OUTLINED_FUNCTION_46_1();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1C9F02814(uint64_t a1, uint64_t a2)
{
  swift_isUniquelyReferenced_nonNull_native();
  uint64_t v6 = *v2;
  *uint64_t v2 = 0x8000000000000000;
  sub_1C9F02F20(a1, a2);
  *uint64_t v2 = v6;
  return swift_bridgeObjectRelease();
}

uint64_t sub_1C9F02894(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_1C9F01B5C(a2, a3);
  OUTLINED_FUNCTION_42_1();
  if (v9)
  {
    __break(1u);
    goto LABEL_11;
  }
  unint64_t v10 = v7;
  char v11 = v8;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBC7FE40);
  if ((sub_1C9F082E8() & 1) == 0) {
    goto LABEL_5;
  }
  unint64_t v12 = sub_1C9F01B5C(a2, a3);
  if ((v11 & 1) != (v13 & 1))
  {
LABEL_11:
    uint64_t result = sub_1C9F083B8();
    __break(1u);
    return result;
  }
  unint64_t v10 = v12;
LABEL_5:
  unint64_t v14 = *v3;
  if (v11)
  {
    uint64_t v15 = v14[7];
    uint64_t result = swift_bridgeObjectRelease();
    *(void *)(v15 + 8 * v10) = a1;
  }
  else
  {
    sub_1C9F030B0(v10, a2, a3, a1, v14);
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_1C9F029B0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = *v4;
  unint64_t v11 = sub_1C9F01B5C(a3, a4);
  if (__OFADD__(*(void *)(v10 + 16), (v12 & 1) == 0))
  {
    __break(1u);
    goto LABEL_11;
  }
  unint64_t v13 = v11;
  char v14 = v12;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC7FE30);
  if ((sub_1C9F082E8() & 1) == 0) {
    goto LABEL_5;
  }
  unint64_t v15 = sub_1C9F01B5C(a3, a4);
  if ((v14 & 1) != (v16 & 1))
  {
LABEL_11:
    uint64_t result = sub_1C9F083B8();
    __break(1u);
    return result;
  }
  unint64_t v13 = v15;
LABEL_5:
  uint64_t v17 = *v5;
  if (v14)
  {
    uint64_t v18 = (uint64_t *)(*(void *)(v17 + 56) + 16 * v13);
    uint64_t result = swift_unknownObjectRelease();
    *uint64_t v18 = a1;
    v18[1] = a2;
  }
  else
  {
    sub_1C9F030F8(v13, a3, a4, a1, a2, v17);
    return swift_bridgeObjectRetain();
  }
  return result;
}

void sub_1C9F02AF0(_OWORD *a1, uint64_t a2)
{
  uint64_t v6 = sub_1C9F07BD8();
  OUTLINED_FUNCTION_0();
  uint64_t v8 = v7;
  MEMORY[0x1F4188790]();
  OUTLINED_FUNCTION_272();
  sub_1C9F01BD4(a2);
  OUTLINED_FUNCTION_42_1();
  if (v11)
  {
    __break(1u);
    goto LABEL_11;
  }
  unint64_t v12 = v9;
  char v13 = v10;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC7FE18);
  if ((sub_1C9F082E8() & 1) == 0) {
    goto LABEL_5;
  }
  sub_1C9F01BD4(a2);
  if ((v13 & 1) != (v15 & 1))
  {
LABEL_11:
    sub_1C9F083B8();
    __break(1u);
    return;
  }
  unint64_t v12 = v14;
LABEL_5:
  char v16 = *v2;
  if (v13)
  {
    __swift_destroy_boxed_opaque_existential_1(v16[7] + 32 * v12);
    OUTLINED_FUNCTION_11_1();
    sub_1C9F0337C(v17, v18);
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16))(v3, a2, v6);
    sub_1C9F03114(v12, v3, a1, v16);
    OUTLINED_FUNCTION_11_1();
  }
}

uint64_t sub_1C9F02C60(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (void **)v2;
  uint64_t v6 = sub_1C9F07C98();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  unint64_t v9 = (char *)&v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v10 = (void *)*v2;
  sub_1C9F01CA8(a2);
  if (__OFADD__(v10[2], (v12 & 1) == 0))
  {
    __break(1u);
    goto LABEL_10;
  }
  unint64_t v13 = v11;
  char v14 = v12;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA5CECA8);
  if ((sub_1C9F082E8() & 1) == 0) {
    goto LABEL_5;
  }
  sub_1C9F01CA8(a2);
  if ((v14 & 1) != (v16 & 1))
  {
LABEL_10:
    uint64_t result = sub_1C9F083B8();
    __break(1u);
    return result;
  }
  unint64_t v13 = v15;
LABEL_5:
  uint64_t v17 = *v3;
  if (v14) {
    return sub_1C9F0338C(a1, v17[7] + 32 * v13, &qword_1EBC7F868);
  }
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, a2, v6);
  return sub_1C9F031CC(v13, (uint64_t)v9, a1, v17);
}

uint64_t sub_1C9F02DF8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = (void **)v3;
  uint64_t v8 = (void *)*v3;
  unint64_t v9 = sub_1C9F01B5C(a2, a3);
  if (__OFADD__(v8[2], (v10 & 1) == 0))
  {
    __break(1u);
    goto LABEL_11;
  }
  unint64_t v11 = v9;
  char v12 = v10;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC7FE28);
  if ((sub_1C9F082E8() & 1) == 0) {
    goto LABEL_5;
  }
  unint64_t v13 = sub_1C9F01B5C(a2, a3);
  if ((v12 & 1) != (v14 & 1))
  {
LABEL_11:
    uint64_t result = sub_1C9F083B8();
    __break(1u);
    return result;
  }
  unint64_t v11 = v13;
LABEL_5:
  unint64_t v15 = *v4;
  if (v12)
  {
    uint64_t v16 = v15[7];
    uint64_t result = swift_release();
    *(void *)(v16 + 8 * v11) = a1;
  }
  else
  {
    sub_1C9F030B0(v11, a2, a3, a1, v15);
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_1C9F02F20(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (void **)v2;
  uint64_t v6 = sub_1C9F069B8();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  unint64_t v9 = (char *)&v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v10 = (void *)*v2;
  sub_1C9F01D7C(a2);
  if (__OFADD__(v10[2], (v12 & 1) == 0))
  {
    __break(1u);
    goto LABEL_10;
  }
  unint64_t v13 = v11;
  char v14 = v12;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC7FE10);
  if ((sub_1C9F082E8() & 1) == 0) {
    goto LABEL_5;
  }
  sub_1C9F01D7C(a2);
  if ((v14 & 1) != (v16 & 1))
  {
LABEL_10:
    uint64_t result = sub_1C9F083B8();
    __break(1u);
    return result;
  }
  unint64_t v13 = v15;
LABEL_5:
  uint64_t v17 = *v3;
  if (v14)
  {
    uint64_t v18 = v17[7];
    uint64_t result = swift_release();
    *(void *)(v18 + 8 * v13) = a1;
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, a2, v6);
    return sub_1C9F03294(v13, (uint64_t)v9, a1, v17);
  }
  return result;
}

unint64_t sub_1C9F030B0(unint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  a5[(result >> 6) + 8] |= 1 << result;
  uint64_t v5 = (void *)(a5[6] + 16 * result);
  *uint64_t v5 = a2;
  v5[1] = a3;
  *(void *)(a5[7] + 8 * result) = a4;
  uint64_t v6 = a5[2];
  BOOL v7 = __OFADD__(v6, 1);
  uint64_t v8 = v6 + 1;
  if (v7) {
    __break(1u);
  }
  else {
    a5[2] = v8;
  }
  return result;
}

unint64_t sub_1C9F030F8(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  unint64_t result = OUTLINED_FUNCTION_5_4(a1, a2, a3, a4, a5, a6);
  if (v9) {
    __break(1u);
  }
  else {
    *(void *)(v7 + 16) = v8;
  }
  return result;
}

_OWORD *sub_1C9F03114(unint64_t a1, uint64_t a2, _OWORD *a3, void *a4)
{
  a4[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v8 = a4[6];
  sub_1C9F07BD8();
  OUTLINED_FUNCTION_15();
  (*(void (**)(unint64_t, uint64_t))(v9 + 32))(v8 + *(void *)(v9 + 72) * a1, a2);
  unint64_t result = sub_1C9F0337C(a3, (_OWORD *)(a4[7] + 32 * a1));
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

uint64_t sub_1C9F031CC(unint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  a4[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v8 = a4[6];
  uint64_t v9 = sub_1C9F07C98();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 32))(v8 + *(void *)(*(void *)(v9 - 8) + 72) * a1, a2, v9);
  uint64_t result = sub_1C9ECF400(a3, a4[7] + 32 * a1, &qword_1EBC7F868);
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

uint64_t sub_1C9F03294(unint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  a4[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v8 = a4[6];
  uint64_t v9 = sub_1C9F069B8();
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

double sub_1C9F0334C@<D0>(uint64_t a1@<X8>)
{
  return sub_1C9EFED60(*(void *)(v1 + 24), a1);
}

_OWORD *sub_1C9F0337C(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_1C9F0338C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(a3);
  OUTLINED_FUNCTION_15();
  (*(void (**)(uint64_t, uint64_t))(v5 + 40))(a2, a1);
  return a2;
}

uint64_t sub_1C9F033E8(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t OUTLINED_FUNCTION_4_3(uint64_t a1)
{
  *(void *)(v1 - 160) = a1;
  return sub_1C9F08228();
}

unint64_t OUTLINED_FUNCTION_5_4(unint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  *(void *)(a6 + 8 * (result >> 6) + 64) |= 1 << result;
  uint64_t v6 = (void *)(*(void *)(a6 + 48) + 16 * result);
  void *v6 = a2;
  v6[1] = a3;
  uint64_t v7 = (void *)(*(void *)(a6 + 56) + 16 * result);
  *uint64_t v7 = a4;
  v7[1] = a5;
  return result;
}

uint64_t OUTLINED_FUNCTION_10_5()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_12_2()
{
  void *v0 = 0x8000000000000000;
  return v1;
}

uint64_t OUTLINED_FUNCTION_14_3()
{
  *(_WORD *)(v0 + 12) = 2048;
  return sub_1C9F08228();
}

uint64_t OUTLINED_FUNCTION_17_3(float a1)
{
  float *v1 = a1;
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_19_2()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_20_3()
{
  return 0;
}

void OUTLINED_FUNCTION_22_2()
{
  void *v0 = 0x8000000000000000;
}

unint64_t OUTLINED_FUNCTION_25_2(uint64_t a1)
{
  return a1 & 0xFFFFFFFFFFFFFFFCLL | v1 & 3;
}

uint64_t OUTLINED_FUNCTION_26_2()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_30_2()
{
  return sub_1C9F01420(v1, v0, (uint64_t *)(v2 - 152));
}

id OUTLINED_FUNCTION_31_2(uint64_t a1)
{
  return objc_msgSend(v1, sel_integerForKey_, a1);
}

uint64_t OUTLINED_FUNCTION_34_0()
{
  return swift_slowAlloc();
}

uint64_t OUTLINED_FUNCTION_39_1()
{
  return sub_1C9F08228();
}

uint64_t OUTLINED_FUNCTION_41_1()
{
  return swift_isUniquelyReferenced_nonNull_native();
}

uint64_t OUTLINED_FUNCTION_43_0()
{
  return sub_1C9F07FD8();
}

uint64_t OUTLINED_FUNCTION_44_1()
{
  return sub_1C9F082E8();
}

uint64_t OUTLINED_FUNCTION_45_1()
{
  return v2 + v0 * v1;
}

uint64_t OUTLINED_FUNCTION_47_1()
{
  return swift_beginAccess();
}

id OUTLINED_FUNCTION_48_1(uint64_t a1)
{
  return objc_msgSend(v1, (SEL)(v2 + 3608), a1);
}

void OUTLINED_FUNCTION_49_0(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v5, a4, v6, 0x16u);
}

uint64_t destroy for SessionStateHolder()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void *_s14SiriMessageBus18SessionStateHolderVwCP_0(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for SessionStateHolder(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_OWORD *assignWithTake for SessionStateHolder(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for SessionStateHolder(uint64_t *a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *((unsigned char *)a1 + 16))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      uint64_t v2 = *a1;
      if ((unint64_t)*a1 >= 0xFFFFFFFF) {
        LODWORD(v2) = -1;
      }
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for SessionStateHolder(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for SessionStateHolder()
{
  return &type metadata for SessionStateHolder;
}

uint64_t sub_1C9F03958(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a1 + 24))
  {
    sub_1C9F0337C((_OWORD *)a1, v6);
    sub_1C9F026F0((uint64_t)v6, a2);
    uint64_t v3 = sub_1C9F07BD8();
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a2, v3);
  }
  else
  {
    sub_1C9F063CC(a1, &qword_1EBC7F868);
    sub_1C9F020A4();
    uint64_t v5 = sub_1C9F07BD8();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(a2, v5);
    return sub_1C9F063CC((uint64_t)v6, &qword_1EBC7F868);
  }
}

uint64_t sub_1C9F03A40(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a1 + 24) == 1)
  {
    sub_1C9F063CC(a1, (uint64_t *)&unk_1EA5CECC0);
    sub_1C9F021E0();
    uint64_t v3 = sub_1C9F07C98();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a2, v3);
    return sub_1C9F063CC((uint64_t)v6, (uint64_t *)&unk_1EA5CECC0);
  }
  else
  {
    sub_1C9F06424(a1, (uint64_t)v6, &qword_1EBC7F868);
    sub_1C9F02708((uint64_t)v6, a2);
    uint64_t v5 = sub_1C9F07C98();
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(a2, v5);
  }
}

void sub_1C9F03B34()
{
  OUTLINED_FUNCTION_14_1();
  uint64_t v30 = v0;
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  uint64_t v5 = sub_1C9F07BD8();
  OUTLINED_FUNCTION_0();
  uint64_t v7 = v6;
  MEMORY[0x1F4188790]();
  OUTLINED_FUNCTION_15_4();
  uint64_t v10 = v8 - v9;
  MEMORY[0x1F4188790]();
  BOOL v12 = (char *)&v25 - v11;
  if (qword_1EBC7F680 != -1) {
    swift_once();
  }
  uint64_t v13 = sub_1C9F07E78();
  __swift_project_value_buffer(v13, (uint64_t)qword_1EBC7FEF0);
  uint64_t v29 = *(void (**)(char *, uint64_t, uint64_t))(v7 + 16);
  v29(v12, v2, v5);
  char v14 = sub_1C9F07E68();
  os_log_type_t v15 = sub_1C9F08158();
  if (os_log_type_enabled(v14, v15))
  {
    uint64_t v16 = swift_slowAlloc();
    uint64_t v28 = v4;
    uint64_t v17 = (uint8_t *)v16;
    uint64_t v26 = swift_slowAlloc();
    v32[0] = v26;
    uint64_t v27 = v2;
    *(_DWORD *)uint64_t v17 = 136315138;
    uint64_t v25 = v17 + 4;
    uint64_t v18 = sub_1C9F07BC8();
    v31[0] = sub_1C9F01420(v18, v19, v32);
    uint64_t v2 = v27;
    sub_1C9F08228();
    swift_bridgeObjectRelease();
    uint64_t v20 = OUTLINED_FUNCTION_19_3();
    v21(v20);
    _os_log_impl(&dword_1C9EC7000, v14, v15, "Updating shared value for key: %s", v17, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_1();
    uint64_t v4 = v28;
    OUTLINED_FUNCTION_1();
  }
  else
  {
    uint64_t v22 = OUTLINED_FUNCTION_19_3();
    v23(v22);
  }

  memset(v32, 0, sizeof(v32));
  uint64_t v24 = (void (*)(uint64_t, uint64_t, uint64_t))v29;
  v29((char *)v10, v2, v5);
  sub_1C9ED8418((uint64_t)v32, (uint64_t)v31);
  sub_1C9F03958((uint64_t)v31, v10);
  sub_1C9F063CC((uint64_t)v32, &qword_1EBC7F868);
  v24(v10, v2, v5);
  sub_1C9ED8418(v4, (uint64_t)v32);
  sub_1C9F03958((uint64_t)v32, v10);
  OUTLINED_FUNCTION_11_1();
}

void sub_1C9F03DE4()
{
  OUTLINED_FUNCTION_14_1();
  uint64_t v1 = v0;
  unint64_t v3 = v2;
  uint64_t v4 = sub_1C9F07BD8();
  OUTLINED_FUNCTION_0();
  uint64_t v6 = v5;
  ((void (*)(void))MEMORY[0x1F4188790])();
  OUTLINED_FUNCTION_6();
  uint64_t v132 = (char *)v7;
  OUTLINED_FUNCTION_12();
  ((void (*)(void))MEMORY[0x1F4188790])();
  uint64_t v126 = (uint64_t)&v118 - v8;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC7FD18);
  ((void (*)(void))MEMORY[0x1F4188790])();
  OUTLINED_FUNCTION_6();
  unint64_t v130 = v9;
  OUTLINED_FUNCTION_12();
  ((void (*)(void))MEMORY[0x1F4188790])();
  uint64_t v129 = (uint64_t)&v118 - v10;
  OUTLINED_FUNCTION_12();
  uint64_t v11 = ((uint64_t (*)(void))MEMORY[0x1F4188790])();
  unint64_t v13 = (unint64_t)&v118 - v12;
  MEMORY[0x1F4188790](v11);
  os_log_type_t v15 = (char *)&v118 - v14;
  if (qword_1EBC7F680 == -1) {
    goto LABEL_2;
  }
LABEL_100:
  swift_once();
LABEL_2:
  uint64_t v16 = sub_1C9F07E78();
  __swift_project_value_buffer(v16, (uint64_t)qword_1EBC7FEF0);
  swift_bridgeObjectRetain_n();
  uint64_t v17 = sub_1C9F07E68();
  os_log_type_t v18 = sub_1C9F08158();
  BOOL v19 = os_log_type_enabled(v17, v18);
  uint64_t v20 = MEMORY[0x1E4FBC840];
  unint64_t v127 = v3;
  uint64_t v131 = v6;
  unint64_t v133 = v1;
  if (v19)
  {
    uint64_t v21 = (uint8_t *)swift_slowAlloc();
    v144[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v21 = 136315138;
    os_log_type_t v138 = (void (**)(void))(v21 + 4);
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC7F868);
    sub_1C9F06484(&qword_1EBC7FD20, MEMORY[0x1E4FA2670]);
    uint64_t v22 = sub_1C9F07F98();
    unint64_t v24 = v23;
    OUTLINED_FUNCTION_17_4();
    swift_bridgeObjectRelease();
    uint64_t v25 = v22;
    uint64_t v6 = v131;
    *(void *)&long long v142 = sub_1C9F01420(v25, v24, v144);
    sub_1C9F08228();
    OUTLINED_FUNCTION_17_4();
    swift_bridgeObjectRelease_n();
    unint64_t v3 = v127;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1C9EC7000, v17, v18, "Updating shared value for keys: %s", v21, 0xCu);
    uint64_t v20 = MEMORY[0x1E4FBC840];
    swift_arrayDestroy();
    OUTLINED_FUNCTION_1();
    uint64_t v1 = v133;
    OUTLINED_FUNCTION_1();
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  uint64_t v26 = sub_1C9F064CC(v3);
  unint64_t v3 = v1[1];
  uint64_t v123 = v26 + 64;
  OUTLINED_FUNCTION_1_5();
  unint64_t v29 = v28 & v27;
  uint64_t v135 = v6 + 32;
  uint64_t v137 = v6 + 16;
  os_log_type_t v138 = (void (**)(void))(v6 + 8);
  int64_t v124 = (unint64_t)(v30 + 63) >> 6;
  int64_t v119 = v124 - 1;
  uint64_t v121 = v31;
  swift_bridgeObjectRetain();
  unint64_t v120 = v3;
  swift_bridgeObjectRetain();
  uint64_t v125 = v26;
  swift_retain();
  int64_t v134 = 0;
  int64_t v122 = v20 + 8;
  uint64_t v32 = v126;
  uint64_t v136 = v4;
  int64_t v128 = (int64_t)v15;
  if (!v29)
  {
LABEL_25:
    if (__OFADD__(v134, 1)) {
      goto LABEL_96;
    }
    OUTLINED_FUNCTION_8_5();
    if (v59 != v36)
    {
      if (*(void *)(v123 + 8 * v58)) {
        goto LABEL_29;
      }
      int64_t v134 = v58;
      if (v58 + 1 >= v124) {
        goto LABEL_45;
      }
      if (*(void *)(v123 + 8 * (v58 + 1))) {
        goto LABEL_29;
      }
      int64_t v134 = v58 + 1;
      OUTLINED_FUNCTION_24_1();
      if (v59 == v36) {
        goto LABEL_45;
      }
      OUTLINED_FUNCTION_25_3();
      if (v66) {
        goto LABEL_29;
      }
      int64_t v134 = v65;
      if (v64 + 3 >= v124) {
        goto LABEL_45;
      }
      if (*(void *)(v123 + 8 * (v64 + 3))) {
        goto LABEL_29;
      }
      uint64_t v67 = v64 + 4;
      int64_t v134 = v64 + 3;
      if (v64 + 4 >= v124) {
        goto LABEL_45;
      }
      if (*(void *)(v123 + 8 * v67))
      {
LABEL_29:
        OUTLINED_FUNCTION_15_5();
        unint64_t v29 = v61 & v60;
        unint64_t v53 = v63 + (v62 << 6);
        int64_t v134 = v62;
        goto LABEL_24;
      }
      while (1)
      {
        if (__OFADD__(v67, 1))
        {
          __break(1u);
          goto LABEL_102;
        }
        OUTLINED_FUNCTION_8_5();
        if (v59 == v36) {
          break;
        }
        OUTLINED_FUNCTION_16_5();
        if (v68) {
          goto LABEL_29;
        }
      }
      int64_t v134 = v119;
    }
LABEL_45:
    uint64_t v69 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC7FD10);
    __swift_storeEnumTagSinglePayload(v13, 1, 1, v69);
    unint64_t v29 = 0;
    goto LABEL_46;
  }
  while (1)
  {
    unint64_t v52 = __clz(__rbit64(v29));
    v29 &= v29 - 1;
    unint64_t v53 = v52 | (v134 << 6);
LABEL_24:
    uint64_t v54 = v125;
    OUTLINED_FUNCTION_3_4();
    v55();
    uint64_t v56 = *(void *)(v54 + 56) + 32 * v53;
    uint64_t v57 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC7FD10);
    sub_1C9ED8418(v56, v13 + *(int *)(v57 + 48));
    __swift_storeEnumTagSinglePayload(v13, 0, 1, v57);
LABEL_46:
    unint64_t v70 = v13;
    sub_1C9F06424(v13, (uint64_t)v15, &qword_1EBC7FD18);
    unint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC7FD10);
    int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v15, 1, v3);
    uint64_t v1 = (void *)((unint64_t)v138 & 0xFFFFFFFFFFFFLL | 0x4F8000000000000);
    if (EnumTagSinglePayload == 1) {
      break;
    }
    sub_1C9F06424((uint64_t)&v15[*(int *)(v3 + 48)], (uint64_t)v144, &qword_1EBC7F868);
    OUTLINED_FUNCTION_23_1();
    v33();
    sub_1C9ED8418((uint64_t)v144, (uint64_t)&v142);
    if (v143)
    {
      sub_1C9F0337C(&v142, &v140);
      unint64_t v3 = (unint64_t)v133;
      swift_isUniquelyReferenced_nonNull_native();
      os_log_type_t v139 = *(char **)v3;
      *(void *)unint64_t v3 = 0x8000000000000000;
      sub_1C9F01BD4(v32);
      OUTLINED_FUNCTION_20_4();
      if (v36)
      {
        __break(1u);
LABEL_95:
        __break(1u);
LABEL_96:
        __break(1u);
LABEL_97:
        __break(1u);
LABEL_98:
        __break(1u);
LABEL_99:
        __break(1u);
        goto LABEL_100;
      }
      unint64_t v3 = v34;
      char v37 = v35;
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC7FE18);
      char v38 = sub_1C9F082E8();
      uint64_t v32 = v126;
      uint64_t v4 = v136;
      uint64_t v1 = v133;
      if (v38)
      {
        sub_1C9F01BD4(v126);
        OUTLINED_FUNCTION_9_5();
        if (!v40) {
          goto LABEL_103;
        }
        unint64_t v3 = v39;
      }
      os_log_type_t v15 = v139;
      if (v37)
      {
        uint64_t v41 = (_OWORD *)(*((void *)v139 + 7) + 32 * v3);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v41);
        sub_1C9F0337C(&v140, v41);
        uint64_t v6 = v131;
      }
      else
      {
        OUTLINED_FUNCTION_265((uint64_t)&v139[8 * (v3 >> 6)]);
        uint64_t v6 = v131;
        OUTLINED_FUNCTION_3_4();
        v48();
        sub_1C9F0337C(&v140, (_OWORD *)(*((void *)v15 + 7) + 32 * v3));
        uint64_t v49 = *((void *)v15 + 2);
        BOOL v36 = __OFADD__(v49, 1);
        uint64_t v50 = v49 + 1;
        if (v36) {
          goto LABEL_98;
        }
        *((void *)v15 + 2) = v50;
        os_log_type_t v15 = v139;
      }
      void *v1 = v15;
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_1_0();
      v51();
    }
    else
    {
      sub_1C9F063CC((uint64_t)&v142, &qword_1EBC7F868);
      unint64_t v42 = (char **)v133;
      swift_bridgeObjectRetain();
      sub_1C9F01BD4(v32);
      unint64_t v3 = v43;
      char v45 = v44;
      swift_bridgeObjectRelease();
      if (v45)
      {
        swift_isUniquelyReferenced_nonNull_native();
        os_log_type_t v139 = *v42;
        *unint64_t v42 = (char *)0x8000000000000000;
        __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC7FE18);
        uint64_t v32 = v126;
        sub_1C9F082E8();
        uint64_t v46 = *(void (**)(void))(v6 + 8);
        uint64_t v4 = v136;
        OUTLINED_FUNCTION_26_3();
        v46();
        uint64_t v47 = v139;
        sub_1C9F0337C((_OWORD *)(*((void *)v139 + 7) + 32 * v3), &v140);
        sub_1C9F06484(&qword_1EBC7FD20, MEMORY[0x1E4FA2670]);
        sub_1C9F082F8();
        *unint64_t v42 = v47;
        swift_bridgeObjectRelease();
      }
      else
      {
        long long v140 = 0u;
        long long v141 = 0u;
        uint64_t v46 = *v138;
        uint64_t v4 = v136;
      }
      ((void (*)(uint64_t, uint64_t))v46)(v32, v4);
      sub_1C9F063CC((uint64_t)&v140, &qword_1EBC7F868);
      unint64_t v13 = v70;
    }
    sub_1C9F063CC((uint64_t)v144, &qword_1EBC7F868);
    os_log_type_t v15 = (char *)v128;
    if (!v29) {
      goto LABEL_25;
    }
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release_n();
  uint64_t v126 = OUTLINED_FUNCTION_17_4() + 64;
  uint64_t v72 = v133;
  int64_t v73 = *v133;
  uint64_t v74 = v133[1];
  OUTLINED_FUNCTION_1_5();
  unint64_t v77 = v76 & v75;
  int64_t v128 = (unint64_t)(v78 + 63) >> 6;
  int64_t v122 = v128 - 1;
  swift_bridgeObjectRetain();
  int64_t v124 = v73;
  swift_bridgeObjectRetain();
  uint64_t v123 = v74;
  swift_bridgeObjectRetain();
  int64_t v79 = 0;
  uint64_t v125 = MEMORY[0x1E4FBC840] + 8;
  os_log_type_t v15 = v132;
  unint64_t v13 = v130;
  uint64_t v4 = v136;
  if (v77)
  {
LABEL_48:
    unint64_t v80 = __clz(__rbit64(v77));
    v77 &= v77 - 1;
    int64_t v134 = v79;
    unint64_t v81 = v80 | (v79 << 6);
LABEL_49:
    unint64_t v82 = v127;
    OUTLINED_FUNCTION_3_4();
    v83();
    sub_1C9ED8418(*(void *)(v82 + 56) + 32 * v81, v13 + *(int *)(v3 + 48));
    uint64_t v84 = 0;
    goto LABEL_56;
  }
  while (2)
  {
    if (__OFADD__(v79, 1)) {
      goto LABEL_97;
    }
    OUTLINED_FUNCTION_8_5();
    if (v59 == v36)
    {
      int64_t v134 = v86;
      goto LABEL_55;
    }
    if (*(void *)(v126 + 8 * v85)) {
      goto LABEL_54;
    }
    OUTLINED_FUNCTION_24_1();
    if (v59 == v36)
    {
      OUTLINED_FUNCTION_22_3();
LABEL_78:
      int64_t v134 = v112;
      goto LABEL_56;
    }
    OUTLINED_FUNCTION_25_3();
    if (v111) {
      goto LABEL_54;
    }
    if (v109 + 2 >= v128) {
      goto LABEL_92;
    }
    if (*(void *)(v126 + 8 * (v109 + 2))) {
      goto LABEL_54;
    }
    OUTLINED_FUNCTION_24_1();
    if (v59 == v36)
    {
      OUTLINED_FUNCTION_22_3();
      int64_t v134 = v117;
      goto LABEL_56;
    }
    OUTLINED_FUNCTION_25_3();
    if (v114) {
      goto LABEL_54;
    }
    uint64_t v115 = v113 + 4;
    if (v113 + 4 >= v128)
    {
LABEL_92:
      int64_t v134 = v110;
LABEL_55:
      OUTLINED_FUNCTION_22_3();
LABEL_56:
      __swift_storeEnumTagSinglePayload(v13, v84, 1, v3);
      uint64_t v91 = v129;
      sub_1C9F06424(v13, v129, &qword_1EBC7FD18);
      if (__swift_getEnumTagSinglePayload(v91, 1, v3) == 1)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        OUTLINED_FUNCTION_17_4();
        swift_release();
        OUTLINED_FUNCTION_11_1();
        return;
      }
      sub_1C9F06424(v91 + *(int *)(v3 + 48), (uint64_t)v144, &qword_1EBC7F868);
      OUTLINED_FUNCTION_23_1();
      v92();
      sub_1C9ED8418((uint64_t)v144, (uint64_t)&v142);
      if (v143)
      {
        sub_1C9F0337C(&v142, &v140);
        swift_isUniquelyReferenced_nonNull_native();
        os_log_type_t v139 = (char *)v72[1];
        v72[1] = 0x8000000000000000;
        sub_1C9F01BD4((uint64_t)v15);
        OUTLINED_FUNCTION_20_4();
        if (v36) {
          goto LABEL_95;
        }
        unint64_t v13 = v93;
        char v95 = v94;
        __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC7FE18);
        if (OUTLINED_FUNCTION_18_4())
        {
          sub_1C9F01BD4((uint64_t)v132);
          OUTLINED_FUNCTION_9_5();
          if (!v40) {
            goto LABEL_103;
          }
          unint64_t v13 = v96;
        }
        uint64_t v97 = v139;
        if (v95)
        {
          uint64_t v98 = (_OWORD *)(*((void *)v139 + 7) + 32 * v13);
          __swift_destroy_boxed_opaque_existential_1((uint64_t)v98);
          sub_1C9F0337C(&v140, v98);
          uint64_t v6 = v131;
        }
        else
        {
          OUTLINED_FUNCTION_21_3((uint64_t)&v139[8 * (v13 >> 6)]);
          uint64_t v6 = v131;
          OUTLINED_FUNCTION_3_4();
          v105();
          sub_1C9F0337C(&v140, (_OWORD *)(*((void *)v97 + 7) + 32 * v13));
          uint64_t v106 = *((void *)v97 + 2);
          BOOL v36 = __OFADD__(v106, 1);
          uint64_t v107 = v106 + 1;
          if (v36) {
            goto LABEL_99;
          }
          *((void *)v97 + 2) = v107;
          uint64_t v97 = v139;
        }
        v72[1] = v97;
        swift_bridgeObjectRelease();
        os_log_type_t v15 = v132;
        OUTLINED_FUNCTION_1_0();
        v108();
        unint64_t v13 = v130;
      }
      else
      {
        sub_1C9F063CC((uint64_t)&v142, &qword_1EBC7F868);
        swift_bridgeObjectRetain();
        sub_1C9F01BD4((uint64_t)v15);
        uint64_t v100 = v99;
        char v102 = v101;
        swift_bridgeObjectRelease();
        if (v102)
        {
          swift_isUniquelyReferenced_nonNull_native();
          os_log_type_t v139 = (char *)v72[1];
          v72[1] = 0x8000000000000000;
          __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC7FE18);
          OUTLINED_FUNCTION_18_4();
          uint64_t v103 = *(void (**)(void))(v6 + 8);
          OUTLINED_FUNCTION_26_3();
          v103();
          uint64_t v104 = v139;
          sub_1C9F0337C((_OWORD *)(*((void *)v139 + 7) + 32 * v100), &v140);
          sub_1C9F06484(&qword_1EBC7FD20, MEMORY[0x1E4FA2670]);
          sub_1C9F082F8();
          v72[1] = v104;
          swift_bridgeObjectRelease();
        }
        else
        {
          long long v140 = 0u;
          long long v141 = 0u;
          uint64_t v103 = *v138;
        }
        os_log_type_t v15 = v132;
        ((void (*)(char *, uint64_t))v103)(v132, v4);
        sub_1C9F063CC((uint64_t)&v140, &qword_1EBC7F868);
        unint64_t v13 = v130;
      }
      sub_1C9F063CC((uint64_t)v144, &qword_1EBC7F868);
      int64_t v79 = v134;
      if (v77) {
        goto LABEL_48;
      }
      continue;
    }
    break;
  }
  if (*(void *)(v126 + 8 * v115))
  {
LABEL_54:
    OUTLINED_FUNCTION_15_5();
    unint64_t v77 = v88 & v87;
    unint64_t v81 = v90 + (v89 << 6);
    int64_t v134 = v89;
    goto LABEL_49;
  }
  while (!__OFADD__(v115, 1))
  {
    OUTLINED_FUNCTION_8_5();
    if (v59 == v36)
    {
      OUTLINED_FUNCTION_22_3();
      int64_t v112 = v122;
      goto LABEL_78;
    }
    OUTLINED_FUNCTION_16_5();
    if (v116) {
      goto LABEL_54;
    }
  }
LABEL_102:
  __break(1u);
LABEL_103:
  sub_1C9F083B8();
  __break(1u);
}

double sub_1C9F04C8C@<D0>(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X3>, _OWORD *a4@<X8>)
{
  if (*(void *)(a2 + 16) && (sub_1C9F01BD4(a1), (v9 & 1) != 0))
  {
    sub_1C9ED7CC0(*(void *)(a2 + 56) + 32 * v8, (uint64_t)v18);
    sub_1C9F0337C(v18, a4);
  }
  else
  {
    if (qword_1EBC7F680 != -1) {
      swift_once();
    }
    uint64_t v11 = sub_1C9F07E78();
    __swift_project_value_buffer(v11, (uint64_t)qword_1EBC7FEF0);
    uint64_t v12 = sub_1C9F07E68();
    os_log_type_t v13 = sub_1C9F08188();
    if (os_log_type_enabled(v12, v13))
    {
      uint64_t v14 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v14 = 0;
      _os_log_impl(&dword_1C9EC7000, v12, v13, "Could not find key in user-specific session data. Falling back to shared space", v14, 2u);
      OUTLINED_FUNCTION_1();
    }

    if (*(void *)(a3 + 16) && (sub_1C9F01BD4(a1), (v16 & 1) != 0))
    {
      uint64_t v17 = *(void *)(a3 + 56) + 32 * v15;
      sub_1C9ED7CC0(v17, (uint64_t)a4);
    }
    else
    {
      double result = 0.0;
      *a4 = 0u;
      a4[1] = 0u;
    }
  }
  return result;
}

void sub_1C9F04E04()
{
  OUTLINED_FUNCTION_14_1();
  uint64_t v1 = v0;
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  uint64_t v6 = sub_1C9F07BD8();
  OUTLINED_FUNCTION_0();
  uint64_t v8 = v7;
  MEMORY[0x1F4188790]();
  OUTLINED_FUNCTION_6();
  char v45 = (char *)v9;
  OUTLINED_FUNCTION_12();
  MEMORY[0x1F4188790]();
  uint64_t v11 = (char *)&v40 - v10;
  uint64_t v12 = *(void *)(v5 + 16);
  if (!v12)
  {
LABEL_26:
    OUTLINED_FUNCTION_11_1();
    return;
  }
  uint64_t v14 = *(void (**)(char *, uint64_t, uint64_t))(v8 + 16);
  uint64_t v13 = v8 + 16;
  uint64_t v46 = v14;
  uint64_t v15 = v5 + ((*(unsigned __int8 *)(v13 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 64));
  uint64_t v43 = *(void *)(v13 + 56);
  char v16 = (void (**)(void))(v13 - 8);
  uint64_t v40 = v5;
  swift_bridgeObjectRetain();
  uint64_t v17 = (void *)MEMORY[0x1E4FBC868];
  uint64_t v41 = v1;
  uint64_t v42 = v3;
  uint64_t v44 = v13;
  while (1)
  {
    v46(v11, v15, v6);
    if (*(void *)(v3 + 16) && (sub_1C9F01BD4((uint64_t)v11), (v19 & 1) != 0))
    {
      sub_1C9ED7CC0(*(void *)(v3 + 56) + 32 * v18, (uint64_t)v49);
      sub_1C9F0337C(v49, v48);
    }
    else
    {
      if (qword_1EBC7F680 != -1) {
        swift_once();
      }
      uint64_t v20 = sub_1C9F07E78();
      __swift_project_value_buffer(v20, (uint64_t)qword_1EBC7FEF0);
      uint64_t v21 = sub_1C9F07E68();
      os_log_type_t v22 = sub_1C9F08188();
      if (os_log_type_enabled(v21, v22))
      {
        unint64_t v23 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)unint64_t v23 = 0;
        _os_log_impl(&dword_1C9EC7000, v21, v22, "Could not find key in user-specific session data. Falling back to shared space", v23, 2u);
        uint64_t v3 = v42;
        OUTLINED_FUNCTION_1();
      }

      if (!*(void *)(v1 + 16) || (sub_1C9F01BD4((uint64_t)v11), (v25 & 1) == 0))
      {
        memset(v48, 0, sizeof(v48));
        OUTLINED_FUNCTION_11_5();
        v35();
        sub_1C9F063CC((uint64_t)v48, &qword_1EBC7F868);
        goto LABEL_24;
      }
      sub_1C9ED7CC0(*(void *)(v1 + 56) + 32 * v24, (uint64_t)v48);
    }
    sub_1C9F0337C(v48, v49);
    uint64_t v26 = (uint64_t)v45;
    v46(v45, (uint64_t)v11, v6);
    sub_1C9ED7CC0((uint64_t)v49, (uint64_t)v48);
    swift_isUniquelyReferenced_nonNull_native();
    uint64_t v47 = v17;
    sub_1C9F01BD4(v26);
    if (__OFADD__(v17[2], (v28 & 1) == 0)) {
      break;
    }
    unint64_t v29 = v27;
    char v30 = v28;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC7FE18);
    char v31 = sub_1C9F082E8();
    uint64_t v3 = v42;
    if (v31)
    {
      sub_1C9F01BD4((uint64_t)v45);
      OUTLINED_FUNCTION_9_5();
      if (!v33) {
        goto LABEL_29;
      }
      unint64_t v29 = v32;
    }
    uint64_t v17 = v47;
    if (v30)
    {
      unint64_t v34 = (_OWORD *)(v47[7] + 32 * v29);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v34);
      sub_1C9F0337C(v48, v34);
    }
    else
    {
      OUTLINED_FUNCTION_265((uint64_t)&v47[v29 >> 6]);
      v46((char *)(v17[6] + v29 * v43), (uint64_t)v45, v6);
      sub_1C9F0337C(v48, (_OWORD *)(v17[7] + 32 * v29));
      uint64_t v36 = v17[2];
      BOOL v37 = __OFADD__(v36, 1);
      uint64_t v38 = v36 + 1;
      if (v37) {
        goto LABEL_28;
      }
      v17[2] = v38;
      uint64_t v17 = v47;
    }
    swift_bridgeObjectRelease();
    unint64_t v39 = *v16;
    OUTLINED_FUNCTION_11_5();
    v39();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v49);
    OUTLINED_FUNCTION_11_5();
    v39();
    uint64_t v1 = v41;
LABEL_24:
    v15 += v43;
    if (!--v12)
    {
      swift_bridgeObjectRelease();
      goto LABEL_26;
    }
  }
  __break(1u);
LABEL_28:
  __break(1u);
LABEL_29:
  sub_1C9F083B8();
  __break(1u);
}

void sub_1C9F051F0()
{
  OUTLINED_FUNCTION_14_1();
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  uint64_t v41 = sub_1C9F07C98();
  OUTLINED_FUNCTION_0();
  uint64_t v8 = v7;
  MEMORY[0x1F4188790]();
  OUTLINED_FUNCTION_12_0();
  uint64_t v11 = v10 - v9;
  uint64_t v42 = sub_1C9F07BD8();
  OUTLINED_FUNCTION_0();
  uint64_t v13 = v12;
  MEMORY[0x1F4188790]();
  OUTLINED_FUNCTION_6();
  uint64_t v39 = v14;
  OUTLINED_FUNCTION_12();
  MEMORY[0x1F4188790]();
  char v16 = (char *)&v34 - v15;
  if (qword_1EBC7F680 != -1) {
    swift_once();
  }
  uint64_t v17 = sub_1C9F07E78();
  __swift_project_value_buffer(v17, (uint64_t)qword_1EBC7FEF0);
  uint64_t v18 = *(void (**)(uint64_t, uint64_t, uint64_t))(v13 + 16);
  uint64_t v40 = v4;
  uint64_t v38 = v18;
  v18((uint64_t)v16, v4, v42);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16))(v11, v2, v41);
  char v19 = sub_1C9F07E68();
  os_log_type_t v20 = sub_1C9F08158();
  int v21 = v20;
  if (os_log_type_enabled(v19, v20))
  {
    uint64_t v22 = swift_slowAlloc();
    HIDWORD(v34) = v21;
    uint64_t v23 = v22;
    uint64_t v35 = swift_slowAlloc();
    v44[0] = v35;
    *(_DWORD *)uint64_t v23 = 136315394;
    uint64_t v36 = v6;
    uint64_t v24 = sub_1C9F07BC8();
    uint64_t v43 = sub_1C9F01420(v24, v25, v44);
    uint64_t v37 = v0;
    sub_1C9F08228();
    swift_bridgeObjectRelease();
    uint64_t v26 = v16;
    uint64_t v27 = v42;
    (*(void (**)(char *, uint64_t))(v13 + 8))(v26, v42);
    *(_WORD *)(v23 + 12) = 2080;
    sub_1C9F06484(&qword_1EBC7FD68, MEMORY[0x1E4FA26E0]);
    uint64_t v28 = v41;
    uint64_t v29 = sub_1C9F08378();
    uint64_t v43 = sub_1C9F01420(v29, v30, v44);
    uint64_t v6 = v36;
    sub_1C9F08228();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v11, v28);
    _os_log_impl(&dword_1C9EC7000, v19, BYTE4(v34), "Updating value for key: %s userId: %s", (uint8_t *)v23, 0x16u);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_1();
    OUTLINED_FUNCTION_1();

    uint64_t v31 = v27;
  }
  else
  {
    uint64_t v32 = v42;
    (*(void (**)(char *, uint64_t))(v13 + 8))(v16, v42);
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v11, v41);

    uint64_t v31 = v32;
  }
  uint64_t v33 = v39;
  v38(v39, v40, v31);
  sub_1C9ED8418(v6, (uint64_t)v44);
  sub_1C9F03958((uint64_t)v44, v33);
  OUTLINED_FUNCTION_11_1();
}

void sub_1C9F05590()
{
  OUTLINED_FUNCTION_14_1();
  uint64_t v1 = v0;
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  unint64_t v6 = sub_1C9F07BD8();
  OUTLINED_FUNCTION_0();
  uint64_t v8 = v7;
  MEMORY[0x1F4188790]();
  OUTLINED_FUNCTION_12_0();
  uint64_t v11 = v10 - v9;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC7FD18);
  MEMORY[0x1F4188790]();
  OUTLINED_FUNCTION_15_4();
  uint64_t v14 = v12 - v13;
  MEMORY[0x1F4188790]();
  unint64_t v93 = (char *)&v80 - v15;
  uint64_t v95 = sub_1C9F07C98();
  OUTLINED_FUNCTION_0();
  unint64_t v17 = v16;
  MEMORY[0x1F4188790]();
  OUTLINED_FUNCTION_12_0();
  uint64_t isUniquelyReferenced_nonNull_native = v19 - v18;
  if (qword_1EBC7F680 == -1) {
    goto LABEL_2;
  }
LABEL_50:
  swift_once();
LABEL_2:
  uint64_t v21 = sub_1C9F07E78();
  __swift_project_value_buffer(v21, (uint64_t)qword_1EBC7FEF0);
  (*(void (**)(uint64_t, uint64_t *, uint64_t))(v17 + 16))(isUniquelyReferenced_nonNull_native, v3, v95);
  swift_bridgeObjectRetain_n();
  uint64_t v22 = sub_1C9F07E68();
  os_log_type_t v23 = sub_1C9F08158();
  LODWORD(v94) = v23;
  BOOL v24 = os_log_type_enabled(v22, v23);
  uint64_t v25 = MEMORY[0x1E4FBC840];
  uint64_t v90 = v5;
  unint64_t v96 = v6;
  if (v24)
  {
    uint64_t v26 = swift_slowAlloc();
    uint64_t v92 = swift_slowAlloc();
    v101[0] = v92;
    *(_DWORD *)uint64_t v26 = 136315394;
    int64_t v89 = v26 + 4;
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC7F868);
    sub_1C9F06484(&qword_1EBC7FD20, MEMORY[0x1E4FA2670]);
    uint64_t v27 = sub_1C9F07F98();
    unint64_t v29 = v28;
    swift_bridgeObjectRelease();
    *(void *)&long long v99 = sub_1C9F01420(v27, v29, v101);
    os_log_t v91 = v22;
    sub_1C9F08228();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v26 + 12) = 2080;
    sub_1C9F06484(&qword_1EBC7FD68, MEMORY[0x1E4FA26E0]);
    int64_t v89 = isUniquelyReferenced_nonNull_native;
    uint64_t v30 = v95;
    uint64_t v31 = sub_1C9F08378();
    *(void *)&long long v99 = sub_1C9F01420(v31, v32, v101);
    uint64_t v5 = v90;
    sub_1C9F08228();
    swift_bridgeObjectRelease();
    (*(void (**)(int64_t, uint64_t))(v17 + 8))(v89, v30);
    os_log_t v33 = v91;
    _os_log_impl(&dword_1C9EC7000, v91, (os_log_type_t)v94, "Updating values for keys: %s userId: %s", (uint8_t *)v26, 0x16u);
    uint64_t v34 = MEMORY[0x1E4FBC840];
    swift_arrayDestroy();
    OUTLINED_FUNCTION_1();
    unint64_t v6 = v96;
    OUTLINED_FUNCTION_1();
  }
  else
  {
    swift_bridgeObjectRelease_n();
    (*(void (**)(uint64_t, uint64_t))(v17 + 8))(isUniquelyReferenced_nonNull_native, v95);

    uint64_t v34 = v25;
  }
  uint64_t v35 = *v1;
  uint64_t v36 = v1[1];
  uint64_t v85 = v5 + 64;
  OUTLINED_FUNCTION_1_5();
  unint64_t v17 = v38 & v37;
  uint64_t v94 = v8 + 16;
  os_log_t v91 = (os_log_t)(v8 + 8);
  uint64_t v92 = v8 + 32;
  int64_t v89 = (unint64_t)(v39 + 63) >> 6;
  uint64_t v81 = v89 - 1;
  swift_bridgeObjectRetain();
  long long v83 = v35;
  swift_bridgeObjectRetain();
  unint64_t v82 = v36;
  swift_bridgeObjectRetain();
  uint64_t v95 = 0;
  uint64_t v3 = &qword_1EBC7FD10;
  uint64_t v84 = v34 + 8;
  uint64_t v88 = v1;
  uint64_t isUniquelyReferenced_nonNull_native = (uint64_t)v93;
  uint64_t v87 = v14;
  uint64_t v86 = v11;
  if (v17)
  {
LABEL_6:
    unint64_t v40 = __clz(__rbit64(v17));
    v17 &= v17 - 1;
    unint64_t v41 = v40 | (v95 << 6);
LABEL_7:
    (*(void (**)(uint64_t, unint64_t, unint64_t))(v8 + 16))(v14, *(void *)(v5 + 48) + *(void *)(v8 + 72) * v41, v6);
    uint64_t v42 = *(void *)(v5 + 56) + 32 * v41;
    uint64_t v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC7FD10);
    sub_1C9ED8418(v42, v14 + *(int *)(v43 + 48));
    __swift_storeEnumTagSinglePayload(v14, 0, 1, v43);
    goto LABEL_29;
  }
  while (1)
  {
    if (__OFADD__(v95, 1)) {
      goto LABEL_48;
    }
    OUTLINED_FUNCTION_8_5();
    if (v45 != v46)
    {
      if (*(void *)(v85 + 8 * v44)) {
        goto LABEL_12;
      }
      uint64_t v95 = v44;
      if (v44 + 1 < v89)
      {
        if (*(void *)(v85 + 8 * (v44 + 1))) {
          goto LABEL_12;
        }
        uint64_t v95 = v44 + 1;
        OUTLINED_FUNCTION_24_1();
        if (v45 != v46)
        {
          OUTLINED_FUNCTION_25_3();
          if (v53) {
            goto LABEL_12;
          }
          uint64_t v95 = v52;
          if (v51 + 3 < v89)
          {
            if (*(void *)(v85 + 8 * (v51 + 3))) {
              goto LABEL_12;
            }
            uint64_t v54 = v51 + 4;
            uint64_t v95 = v51 + 3;
            if (v51 + 4 < v89) {
              break;
            }
          }
        }
      }
    }
LABEL_28:
    uint64_t v56 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC7FD10);
    __swift_storeEnumTagSinglePayload(v14, 1, 1, v56);
    unint64_t v17 = 0;
LABEL_29:
    sub_1C9F06424(v14, isUniquelyReferenced_nonNull_native, &qword_1EBC7FD18);
    uint64_t v57 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC7FD10);
    if (__swift_getEnumTagSinglePayload(isUniquelyReferenced_nonNull_native, 1, v57) == 1)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_release();
      OUTLINED_FUNCTION_11_1();
      return;
    }
    sub_1C9F06424(isUniquelyReferenced_nonNull_native + *(int *)(v57 + 48), (uint64_t)v101, &qword_1EBC7F868);
    OUTLINED_FUNCTION_23_1();
    v58();
    sub_1C9ED8418((uint64_t)v101, (uint64_t)&v99);
    if (v100)
    {
      sub_1C9F0337C(&v99, v98);
      uint64_t isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v97 = *v1;
      uint64_t v3 = v97;
      void *v1 = (uint64_t *)0x8000000000000000;
      sub_1C9F01BD4(v11);
      uint64_t v61 = v3[2];
      BOOL v62 = (v60 & 1) == 0;
      uint64_t v5 = v61 + v62;
      if (__OFADD__(v61, v62))
      {
        __break(1u);
LABEL_48:
        __break(1u);
LABEL_49:
        __break(1u);
        goto LABEL_50;
      }
      unint64_t v6 = v59;
      char v63 = v60;
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC7FE18);
      char v64 = sub_1C9F082E8();
      uint64_t v5 = v90;
      uint64_t isUniquelyReferenced_nonNull_native = (uint64_t)v93;
      if (v64)
      {
        sub_1C9F01BD4(v11);
        if ((v63 & 1) != (v66 & 1)) {
          goto LABEL_52;
        }
        unint64_t v6 = v65;
      }
      uint64_t v3 = v97;
      if (v63)
      {
        uint64_t v67 = (_OWORD *)(v97[7] + 32 * v6);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v67);
        sub_1C9F0337C(v98, v67);
      }
      else
      {
        OUTLINED_FUNCTION_21_3((uint64_t)&v97[v6 >> 6]);
        (*(void (**)(unint64_t, uint64_t, unint64_t))(v8 + 16))(v75 + *(void *)(v8 + 72) * v6, v11, v96);
        sub_1C9F0337C(v98, (_OWORD *)(v3[7] + 32 * v6));
        uint64_t v76 = v3[2];
        BOOL v46 = __OFADD__(v76, 1);
        uint64_t v77 = v76 + 1;
        if (v46) {
          goto LABEL_49;
        }
        v3[2] = v77;
        uint64_t v3 = v97;
      }
      void *v1 = v3;
      swift_bridgeObjectRelease();
      unint64_t v6 = v96;
      OUTLINED_FUNCTION_1_0();
      v78();
    }
    else
    {
      uint64_t v68 = v11;
      uint64_t v69 = v8;
      sub_1C9F063CC((uint64_t)&v99, &qword_1EBC7F868);
      swift_bridgeObjectRetain();
      sub_1C9F01BD4(v68);
      uint64_t v71 = v70;
      LOBYTE(v68) = v72;
      swift_bridgeObjectRelease();
      if (v68)
      {
        swift_isUniquelyReferenced_nonNull_native();
        uint64_t v97 = *v1;
        void *v1 = (uint64_t *)0x8000000000000000;
        __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC7FE18);
        uint64_t v5 = v90;
        sub_1C9F082E8();
        unint64_t v6 = v96;
        Class isa = *(Class *)(v69 + 8);
        ((void (*)(uint64_t, unint64_t))isa)(v97[6] + *(void *)(v69 + 72) * v71, v96);
        uint64_t v74 = v97;
        sub_1C9F0337C((_OWORD *)(v97[7] + 32 * v71), v98);
        sub_1C9F06484(&qword_1EBC7FD20, MEMORY[0x1E4FA2670]);
        sub_1C9F082F8();
        void *v1 = v74;
        swift_bridgeObjectRelease();
      }
      else
      {
        memset(v98, 0, sizeof(v98));
        Class isa = v91->isa;
        unint64_t v6 = v96;
      }
      uint64_t v79 = v86;
      ((void (*)(uint64_t, unint64_t))isa)(v86, v6);
      sub_1C9F063CC((uint64_t)v98, &qword_1EBC7F868);
      uint64_t v8 = v69;
      uint64_t v11 = v79;
      uint64_t v14 = v87;
      uint64_t v1 = v88;
      uint64_t isUniquelyReferenced_nonNull_native = (uint64_t)v93;
    }
    sub_1C9F063CC((uint64_t)v101, &qword_1EBC7F868);
    uint64_t v3 = &qword_1EBC7FD10;
    if (v17) {
      goto LABEL_6;
    }
  }
  if (*(void *)(v85 + 8 * v54))
  {
LABEL_12:
    OUTLINED_FUNCTION_15_5();
    unint64_t v17 = v48 & v47;
    unint64_t v41 = v50 + (v49 << 6);
    uint64_t v95 = v49;
    goto LABEL_7;
  }
  while (!__OFADD__(v54, 1))
  {
    OUTLINED_FUNCTION_8_5();
    if (v45 == v46)
    {
      uint64_t v95 = v81;
      goto LABEL_28;
    }
    OUTLINED_FUNCTION_16_5();
    if (v55) {
      goto LABEL_12;
    }
  }
  __break(1u);
LABEL_52:
  sub_1C9F083B8();
  __break(1u);
}

uint64_t sub_1C9F05FAC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1C9F07C98();
  MEMORY[0x1F4188790](v4 - 8);
  OUTLINED_FUNCTION_12_0();
  uint64_t v7 = v6 - v5;
  uint64_t v12 = MEMORY[0x1E4FBC868];
  sub_1C9F07C68();
  if (*(void *)(a2 + 16) && (sub_1C9F01BD4(a1), (v9 & 1) != 0)) {
    sub_1C9ED7CC0(*(void *)(a2 + 56) + 32 * v8, (uint64_t)v11);
  }
  else {
    memset(v11, 0, sizeof(v11));
  }
  sub_1C9F03A40((uint64_t)v11, v7);
  return v12;
}

void sub_1C9F0607C()
{
  OUTLINED_FUNCTION_14_1();
  uint64_t v1 = v0;
  uint64_t v3 = v2;
  uint64_t v4 = sub_1C9F07BD8();
  OUTLINED_FUNCTION_0();
  uint64_t v6 = v5;
  MEMORY[0x1F4188790](v7);
  OUTLINED_FUNCTION_15_4();
  uint64_t v10 = v8 - v9;
  MEMORY[0x1F4188790](v11);
  uint64_t v13 = (char *)v36 - v12;
  sub_1C9F06484(&qword_1EBC7FD20, MEMORY[0x1E4FA2670]);
  uint64_t v14 = (void *)sub_1C9F07F88();
  uint64_t v15 = *(void *)(v3 + 16);
  if (!v15)
  {
LABEL_17:
    OUTLINED_FUNCTION_11_1();
    return;
  }
  uint64_t v18 = *(void (**)(char *, uint64_t, uint64_t))(v6 + 16);
  uint64_t v16 = v6 + 16;
  unint64_t v17 = v18;
  uint64_t v19 = v3 + ((*(unsigned __int8 *)(v16 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 64));
  uint64_t v20 = v3;
  uint64_t v21 = *(void *)(v16 + 56);
  unint64_t v41 = (void (**)(uint64_t, uint64_t))(v16 - 8);
  v36[1] = v20;
  swift_bridgeObjectRetain();
  uint64_t v37 = v13;
  uint64_t v38 = v1;
  uint64_t v39 = v21;
  unint64_t v40 = (void (*)(unint64_t, uint64_t, uint64_t))v18;
  while (1)
  {
    v17(v13, v19, v4);
    if (!*(void *)(v1 + 16) || (sub_1C9F01BD4((uint64_t)v13), (v23 & 1) == 0))
    {
      OUTLINED_FUNCTION_1_0();
      v31();
      goto LABEL_15;
    }
    sub_1C9ED7CC0(*(void *)(v1 + 56) + 32 * v22, (uint64_t)v43);
    sub_1C9F0337C(v43, v44);
    v17((char *)v10, (uint64_t)v13, v4);
    sub_1C9ED7CC0((uint64_t)v44, (uint64_t)v43);
    swift_isUniquelyReferenced_nonNull_native();
    uint64_t v42 = v14;
    sub_1C9F01BD4(v10);
    if (__OFADD__(v14[2], (v25 & 1) == 0)) {
      break;
    }
    unint64_t v26 = v24;
    char v27 = v25;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC7FE18);
    if (sub_1C9F082E8())
    {
      sub_1C9F01BD4(v10);
      if ((v27 & 1) != (v29 & 1)) {
        goto LABEL_20;
      }
      unint64_t v26 = v28;
    }
    uint64_t v14 = v42;
    if (v27)
    {
      uint64_t v30 = (_OWORD *)(v42[7] + 32 * v26);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v30);
      sub_1C9F0337C(v43, v30);
    }
    else
    {
      OUTLINED_FUNCTION_265((uint64_t)&v42[v26 >> 6]);
      v40(v14[6] + v26 * v39, v10, v4);
      sub_1C9F0337C(v43, (_OWORD *)(v14[7] + 32 * v26));
      uint64_t v32 = v14[2];
      BOOL v33 = __OFADD__(v32, 1);
      uint64_t v34 = v32 + 1;
      if (v33) {
        goto LABEL_19;
      }
      v14[2] = v34;
      uint64_t v14 = v42;
    }
    swift_bridgeObjectRelease();
    uint64_t v35 = *v41;
    (*v41)(v10, v4);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v44);
    uint64_t v13 = v37;
    v35((uint64_t)v37, v4);
    uint64_t v1 = v38;
    uint64_t v21 = v39;
    unint64_t v17 = (void (*)(char *, uint64_t, uint64_t))v40;
LABEL_15:
    v19 += v21;
    if (!--v15)
    {
      swift_bridgeObjectRelease();
      goto LABEL_17;
    }
  }
  __break(1u);
LABEL_19:
  __break(1u);
LABEL_20:
  sub_1C9F083B8();
  __break(1u);
}

uint64_t sub_1C9F063CC(uint64_t a1, uint64_t *a2)
{
  __swift_instantiateConcreteTypeFromMangledName(a2);
  OUTLINED_FUNCTION_1_0();
  v3();
  return a1;
}

uint64_t sub_1C9F06424(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(a3);
  OUTLINED_FUNCTION_23_1();
  v4();
  return a2;
}

uint64_t sub_1C9F06484(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_1C9F064CC(uint64_t a1)
{
  uint64_t v2 = sub_1C9F07BD8();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790]();
  uint64_t v5 = (char *)&v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBC7FE58);
  uint64_t result = sub_1C9F08328();
  uint64_t v7 = (void *)result;
  int64_t v8 = 0;
  uint64_t v29 = a1;
  uint64_t v9 = *(void *)(a1 + 64);
  uint64_t v24 = a1 + 64;
  uint64_t v10 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & v9;
  uint64_t v27 = v3 + 16;
  uint64_t v13 = result + 64;
  int64_t v25 = (unint64_t)(v10 + 63) >> 6;
  uint64_t v26 = v3 + 32;
  if ((v11 & v9) == 0) {
    goto LABEL_5;
  }
LABEL_4:
  unint64_t v14 = __clz(__rbit64(v12));
  v12 &= v12 - 1;
  for (unint64_t i = v14 | (v8 << 6); ; unint64_t i = __clz(__rbit64(v17)) + (v8 << 6))
  {
    unint64_t v19 = *(void *)(v3 + 72) * i;
    (*(void (**)(char *, unint64_t, uint64_t))(v3 + 16))(v5, *(void *)(v29 + 48) + v19, v2);
    memset(v28, 0, sizeof(v28));
    *(void *)(v13 + ((i >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << i;
    (*(void (**)(unint64_t, char *, uint64_t))(v3 + 32))(v7[6] + v19, v5, v2);
    uint64_t result = sub_1C9F06424((uint64_t)v28, v7[7] + 32 * i, &qword_1EBC7F868);
    uint64_t v20 = v7[2];
    BOOL v21 = __OFADD__(v20, 1);
    uint64_t v22 = v20 + 1;
    if (v21)
    {
      __break(1u);
LABEL_24:
      __break(1u);
      goto LABEL_25;
    }
    v7[2] = v22;
    if (v12) {
      goto LABEL_4;
    }
LABEL_5:
    int64_t v16 = v8 + 1;
    if (__OFADD__(v8, 1)) {
      goto LABEL_24;
    }
    if (v16 >= v25) {
      return (uint64_t)v7;
    }
    unint64_t v17 = *(void *)(v24 + 8 * v16);
    ++v8;
    if (!v17)
    {
      int64_t v8 = v16 + 1;
      if (v16 + 1 >= v25) {
        return (uint64_t)v7;
      }
      unint64_t v17 = *(void *)(v24 + 8 * v8);
      if (!v17)
      {
        int64_t v8 = v16 + 2;
        if (v16 + 2 >= v25) {
          return (uint64_t)v7;
        }
        unint64_t v17 = *(void *)(v24 + 8 * v8);
        if (!v17) {
          break;
        }
      }
    }
LABEL_18:
    unint64_t v12 = (v17 - 1) & v17;
  }
  int64_t v18 = v16 + 3;
  if (v18 >= v25) {
    return (uint64_t)v7;
  }
  unint64_t v17 = *(void *)(v24 + 8 * v18);
  if (v17)
  {
    int64_t v8 = v18;
    goto LABEL_18;
  }
  while (1)
  {
    int64_t v8 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v8 >= v25) {
      return (uint64_t)v7;
    }
    unint64_t v17 = *(void *)(v24 + 8 * v8);
    ++v18;
    if (v17) {
      goto LABEL_18;
    }
  }
LABEL_25:
  __break(1u);
  return result;
}

uint64_t OUTLINED_FUNCTION_17_4()
{
  return *(void *)(v0 - 296);
}

uint64_t OUTLINED_FUNCTION_18_4()
{
  return sub_1C9F082E8();
}

uint64_t OUTLINED_FUNCTION_19_3()
{
  return v0;
}

void OUTLINED_FUNCTION_21_3(uint64_t a1@<X8>)
{
  *(void *)(a1 + 64) |= v1;
}

uint64_t sub_1C9F068B0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return (*(uint64_t (**)(void))(a7 + 8))();
}

uint64_t sub_1C9F068C4()
{
  return MEMORY[0x1F4186488](v0, 16, 7);
}

uint64_t type metadata accessor for UAFAssetSetObserverProvider()
{
  return self;
}

uint64_t sub_1C9F068F8()
{
  return MEMORY[0x1F40E4540]();
}

uint64_t sub_1C9F06908()
{
  return MEMORY[0x1F40E4550]();
}

uint64_t sub_1C9F06918()
{
  return MEMORY[0x1F40E4DA8]();
}

uint64_t sub_1C9F06928()
{
  return MEMORY[0x1F40E5158]();
}

uint64_t sub_1C9F06938()
{
  return MEMORY[0x1F40E51A8]();
}

uint64_t sub_1C9F06948()
{
  return MEMORY[0x1F40E5338]();
}

uint64_t sub_1C9F06958()
{
  return MEMORY[0x1F40E5378]();
}

uint64_t sub_1C9F06968()
{
  return MEMORY[0x1F40E5388]();
}

uint64_t sub_1C9F06978()
{
  return MEMORY[0x1F40E53A0]();
}

uint64_t sub_1C9F06988()
{
  return MEMORY[0x1F40E53B0]();
}

uint64_t sub_1C9F06998()
{
  return MEMORY[0x1F40E53C8]();
}

uint64_t sub_1C9F069A8()
{
  return MEMORY[0x1F40E5438]();
}

uint64_t sub_1C9F069B8()
{
  return MEMORY[0x1F40E5448]();
}

uint64_t sub_1C9F069C8()
{
  return MEMORY[0x1F4150AE8]();
}

uint64_t sub_1C9F069D8()
{
  return MEMORY[0x1F415AA80]();
}

uint64_t sub_1C9F069E8()
{
  return MEMORY[0x1F410D270]();
}

uint64_t sub_1C9F069F8()
{
  return MEMORY[0x1F410D278]();
}

uint64_t sub_1C9F06A08()
{
  return MEMORY[0x1F4152AE8]();
}

uint64_t sub_1C9F06A18()
{
  return MEMORY[0x1F4152C48]();
}

uint64_t sub_1C9F06A28()
{
  return MEMORY[0x1F4152C50]();
}

uint64_t sub_1C9F06A38()
{
  return MEMORY[0x1F4152C68]();
}

uint64_t sub_1C9F06A48()
{
  return MEMORY[0x1F4152C70]();
}

uint64_t sub_1C9F06A58()
{
  return MEMORY[0x1F4152C78]();
}

uint64_t sub_1C9F06A68()
{
  return MEMORY[0x1F4152C80]();
}

uint64_t sub_1C9F06A78()
{
  return MEMORY[0x1F4152C88]();
}

uint64_t sub_1C9F06A88()
{
  return MEMORY[0x1F4152C90]();
}

uint64_t sub_1C9F06A98()
{
  return MEMORY[0x1F4152CF0]();
}

uint64_t sub_1C9F06AA8()
{
  return MEMORY[0x1F4152D00]();
}

uint64_t sub_1C9F06AB8()
{
  return MEMORY[0x1F4152D08]();
}

uint64_t sub_1C9F06AC8()
{
  return MEMORY[0x1F4152D10]();
}

uint64_t sub_1C9F06AD8()
{
  return MEMORY[0x1F4152D18]();
}

uint64_t sub_1C9F06AE8()
{
  return MEMORY[0x1F4152D20]();
}

uint64_t sub_1C9F06AF8()
{
  return MEMORY[0x1F4152D28]();
}

uint64_t sub_1C9F06B08()
{
  return MEMORY[0x1F4152EF0]();
}

uint64_t sub_1C9F06B18()
{
  return MEMORY[0x1F4152EF8]();
}

uint64_t sub_1C9F06B28()
{
  return MEMORY[0x1F4152F10]();
}

uint64_t sub_1C9F06B38()
{
  return MEMORY[0x1F4152F18]();
}

uint64_t sub_1C9F06B48()
{
  return MEMORY[0x1F4152F20]();
}

uint64_t sub_1C9F06B58()
{
  return MEMORY[0x1F4152F28]();
}

uint64_t sub_1C9F06B68()
{
  return MEMORY[0x1F4152F30]();
}

uint64_t sub_1C9F06B78()
{
  return MEMORY[0x1F4152F38]();
}

uint64_t sub_1C9F06B88()
{
  return MEMORY[0x1F4152F40]();
}

uint64_t sub_1C9F06B98()
{
  return MEMORY[0x1F4152F60]();
}

uint64_t sub_1C9F06BA8()
{
  return MEMORY[0x1F4152F70]();
}

uint64_t sub_1C9F06BB8()
{
  return MEMORY[0x1F4152F78]();
}

uint64_t sub_1C9F06BC8()
{
  return MEMORY[0x1F4152F80]();
}

uint64_t sub_1C9F06BD8()
{
  return MEMORY[0x1F4152F88]();
}

uint64_t sub_1C9F06BE8()
{
  return MEMORY[0x1F4152F90]();
}

uint64_t sub_1C9F06BF8()
{
  return MEMORY[0x1F4152F98]();
}

uint64_t sub_1C9F06C08()
{
  return MEMORY[0x1F4152FA0]();
}

uint64_t sub_1C9F06C18()
{
  return MEMORY[0x1F4152FA8]();
}

uint64_t sub_1C9F06C28()
{
  return MEMORY[0x1F4153128]();
}

uint64_t sub_1C9F06C38()
{
  return MEMORY[0x1F4153130]();
}

uint64_t sub_1C9F06C48()
{
  return MEMORY[0x1F4153138]();
}

uint64_t sub_1C9F06C58()
{
  return MEMORY[0x1F4153140]();
}

uint64_t sub_1C9F06C68()
{
  return MEMORY[0x1F4153160]();
}

uint64_t sub_1C9F06C78()
{
  return MEMORY[0x1F4153168]();
}

uint64_t sub_1C9F06C88()
{
  return MEMORY[0x1F4153170]();
}

uint64_t sub_1C9F06C98()
{
  return MEMORY[0x1F4153178]();
}

uint64_t sub_1C9F06CA8()
{
  return MEMORY[0x1F4153188]();
}

uint64_t sub_1C9F06CB8()
{
  return MEMORY[0x1F41531A0]();
}

uint64_t sub_1C9F06CC8()
{
  return MEMORY[0x1F41531A8]();
}

uint64_t sub_1C9F06CD8()
{
  return MEMORY[0x1F41531B0]();
}

uint64_t sub_1C9F06CE8()
{
  return MEMORY[0x1F41531B8]();
}

uint64_t sub_1C9F06CF8()
{
  return MEMORY[0x1F4153460]();
}

uint64_t sub_1C9F06D08()
{
  return MEMORY[0x1F4153468]();
}

uint64_t sub_1C9F06D18()
{
  return MEMORY[0x1F41534A8]();
}

uint64_t sub_1C9F06D28()
{
  return MEMORY[0x1F41534B0]();
}

uint64_t sub_1C9F06D38()
{
  return MEMORY[0x1F41534B8]();
}

uint64_t sub_1C9F06D48()
{
  return MEMORY[0x1F41534C8]();
}

uint64_t sub_1C9F06D58()
{
  return MEMORY[0x1F41534D8]();
}

uint64_t sub_1C9F06D68()
{
  return MEMORY[0x1F41534E0]();
}

uint64_t sub_1C9F06D78()
{
  return MEMORY[0x1F41534E8]();
}

uint64_t sub_1C9F06D88()
{
  return MEMORY[0x1F41534F0]();
}

uint64_t sub_1C9F06D98()
{
  return MEMORY[0x1F41534F8]();
}

uint64_t sub_1C9F06DA8()
{
  return MEMORY[0x1F41536B8]();
}

uint64_t sub_1C9F06DB8()
{
  return MEMORY[0x1F41536C0]();
}

uint64_t sub_1C9F06DC8()
{
  return MEMORY[0x1F41536C8]();
}

uint64_t sub_1C9F06DD8()
{
  return MEMORY[0x1F41536D0]();
}

uint64_t sub_1C9F06DE8()
{
  return MEMORY[0x1F41536D8]();
}

uint64_t sub_1C9F06DF8()
{
  return MEMORY[0x1F41536E0]();
}

uint64_t sub_1C9F06E08()
{
  return MEMORY[0x1F41536E8]();
}

uint64_t sub_1C9F06E18()
{
  return MEMORY[0x1F41536F0]();
}

uint64_t sub_1C9F06E28()
{
  return MEMORY[0x1F41536F8]();
}

uint64_t sub_1C9F06E38()
{
  return MEMORY[0x1F4153708]();
}

uint64_t sub_1C9F06E48()
{
  return MEMORY[0x1F4153798]();
}

uint64_t sub_1C9F06E58()
{
  return MEMORY[0x1F41537A0]();
}

uint64_t sub_1C9F06E68()
{
  return MEMORY[0x1F41537A8]();
}

uint64_t sub_1C9F06E78()
{
  return MEMORY[0x1F41537B0]();
}

uint64_t sub_1C9F06E88()
{
  return MEMORY[0x1F41537B8]();
}

uint64_t sub_1C9F06E98()
{
  return MEMORY[0x1F41537C0]();
}

uint64_t sub_1C9F06EA8()
{
  return MEMORY[0x1F41537C8]();
}

uint64_t sub_1C9F06EB8()
{
  return MEMORY[0x1F41537D0]();
}

uint64_t sub_1C9F06EC8()
{
  return MEMORY[0x1F41537D8]();
}

uint64_t sub_1C9F06ED8()
{
  return MEMORY[0x1F41537E0]();
}

uint64_t sub_1C9F06EE8()
{
  return MEMORY[0x1F41537E8]();
}

uint64_t sub_1C9F06EF8()
{
  return MEMORY[0x1F41537F0]();
}

uint64_t sub_1C9F06F08()
{
  return MEMORY[0x1F41537F8]();
}

uint64_t sub_1C9F06F18()
{
  return MEMORY[0x1F4153800]();
}

uint64_t sub_1C9F06F28()
{
  return MEMORY[0x1F4153858]();
}

uint64_t sub_1C9F06F38()
{
  return MEMORY[0x1F4153860]();
}

uint64_t sub_1C9F06F48()
{
  return MEMORY[0x1F4153880]();
}

uint64_t sub_1C9F06F58()
{
  return MEMORY[0x1F4153888]();
}

uint64_t sub_1C9F06F68()
{
  return MEMORY[0x1F4153890]();
}

uint64_t sub_1C9F06F78()
{
  return MEMORY[0x1F4153898]();
}

uint64_t sub_1C9F06F88()
{
  return MEMORY[0x1F41538A0]();
}

uint64_t sub_1C9F06F98()
{
  return MEMORY[0x1F41538A8]();
}

uint64_t sub_1C9F06FA8()
{
  return MEMORY[0x1F41538B0]();
}

uint64_t sub_1C9F06FB8()
{
  return MEMORY[0x1F41538B8]();
}

uint64_t sub_1C9F06FC8()
{
  return MEMORY[0x1F41538C0]();
}

uint64_t sub_1C9F06FD8()
{
  return MEMORY[0x1F4153930]();
}

uint64_t sub_1C9F06FE8()
{
  return MEMORY[0x1F4153938]();
}

uint64_t sub_1C9F06FF8()
{
  return MEMORY[0x1F4153BA8]();
}

uint64_t sub_1C9F07008()
{
  return MEMORY[0x1F4153BB0]();
}

uint64_t sub_1C9F07018()
{
  return MEMORY[0x1F4153BB8]();
}

uint64_t sub_1C9F07028()
{
  return MEMORY[0x1F4153BC0]();
}

uint64_t sub_1C9F07038()
{
  return MEMORY[0x1F4153BC8]();
}

uint64_t sub_1C9F07048()
{
  return MEMORY[0x1F4153BD0]();
}

uint64_t sub_1C9F07058()
{
  return MEMORY[0x1F4153BD8]();
}

uint64_t sub_1C9F07068()
{
  return MEMORY[0x1F4153BE0]();
}

uint64_t sub_1C9F07078()
{
  return MEMORY[0x1F4153BE8]();
}

uint64_t sub_1C9F07088()
{
  return MEMORY[0x1F4153C08]();
}

uint64_t sub_1C9F07098()
{
  return MEMORY[0x1F4153C10]();
}

uint64_t sub_1C9F070A8()
{
  return MEMORY[0x1F4153C18]();
}

uint64_t sub_1C9F070B8()
{
  return MEMORY[0x1F4153C20]();
}

uint64_t sub_1C9F070C8()
{
  return MEMORY[0x1F4153C28]();
}

uint64_t sub_1C9F070D8()
{
  return MEMORY[0x1F4153C30]();
}

uint64_t sub_1C9F070E8()
{
  return MEMORY[0x1F4153C38]();
}

uint64_t sub_1C9F070F8()
{
  return MEMORY[0x1F4153C40]();
}

uint64_t sub_1C9F07108()
{
  return MEMORY[0x1F4153C48]();
}

uint64_t sub_1C9F07118()
{
  return MEMORY[0x1F4153C58]();
}

uint64_t sub_1C9F07128()
{
  return MEMORY[0x1F4153C60]();
}

uint64_t sub_1C9F07138()
{
  return MEMORY[0x1F4153C68]();
}

uint64_t sub_1C9F07148()
{
  return MEMORY[0x1F4153C70]();
}

uint64_t sub_1C9F07158()
{
  return MEMORY[0x1F4153C78]();
}

uint64_t sub_1C9F07168()
{
  return MEMORY[0x1F4153C80]();
}

uint64_t sub_1C9F07178()
{
  return MEMORY[0x1F4153C88]();
}

uint64_t sub_1C9F07188()
{
  return MEMORY[0x1F4153C90]();
}

uint64_t sub_1C9F07198()
{
  return MEMORY[0x1F4153C98]();
}

uint64_t sub_1C9F071A8()
{
  return MEMORY[0x1F4153CA0]();
}

uint64_t sub_1C9F071B8()
{
  return MEMORY[0x1F4153CA8]();
}

uint64_t sub_1C9F071C8()
{
  return MEMORY[0x1F4153CB0]();
}

uint64_t sub_1C9F071D8()
{
  return MEMORY[0x1F4153CB8]();
}

uint64_t sub_1C9F071E8()
{
  return MEMORY[0x1F4153E28]();
}

uint64_t sub_1C9F071F8()
{
  return MEMORY[0x1F4153E30]();
}

uint64_t sub_1C9F07208()
{
  return MEMORY[0x1F4153E38]();
}

uint64_t sub_1C9F07218()
{
  return MEMORY[0x1F4153E40]();
}

uint64_t sub_1C9F07228()
{
  return MEMORY[0x1F4153E48]();
}

uint64_t sub_1C9F07238()
{
  return MEMORY[0x1F4153E50]();
}

uint64_t sub_1C9F07248()
{
  return MEMORY[0x1F4153E58]();
}

uint64_t sub_1C9F07258()
{
  return MEMORY[0x1F4153E60]();
}

uint64_t sub_1C9F07268()
{
  return MEMORY[0x1F4153E68]();
}

uint64_t sub_1C9F07278()
{
  return MEMORY[0x1F4153E70]();
}

uint64_t sub_1C9F07288()
{
  return MEMORY[0x1F4153E80]();
}

uint64_t sub_1C9F07298()
{
  return MEMORY[0x1F4153E90]();
}

uint64_t sub_1C9F072A8()
{
  return MEMORY[0x1F4153E98]();
}

uint64_t sub_1C9F072B8()
{
  return MEMORY[0x1F4153EA0]();
}

uint64_t sub_1C9F072C8()
{
  return MEMORY[0x1F4153EA8]();
}

uint64_t sub_1C9F072D8()
{
  return MEMORY[0x1F4153EB0]();
}

uint64_t sub_1C9F072E8()
{
  return MEMORY[0x1F4153EB8]();
}

uint64_t sub_1C9F072F8()
{
  return MEMORY[0x1F4153EC0]();
}

uint64_t sub_1C9F07308()
{
  return MEMORY[0x1F4153EC8]();
}

uint64_t sub_1C9F07318()
{
  return MEMORY[0x1F4153F40]();
}

uint64_t sub_1C9F07328()
{
  return MEMORY[0x1F4153F48]();
}

uint64_t sub_1C9F07338()
{
  return MEMORY[0x1F4153F50]();
}

uint64_t sub_1C9F07348()
{
  return MEMORY[0x1F4153F58]();
}

uint64_t sub_1C9F07358()
{
  return MEMORY[0x1F4153F60]();
}

uint64_t sub_1C9F07368()
{
  return MEMORY[0x1F4153F68]();
}

uint64_t sub_1C9F07378()
{
  return MEMORY[0x1F4153F70]();
}

uint64_t sub_1C9F07388()
{
  return MEMORY[0x1F4153F78]();
}

uint64_t sub_1C9F07398()
{
  return MEMORY[0x1F4153F80]();
}

uint64_t sub_1C9F073A8()
{
  return MEMORY[0x1F4153F88]();
}

uint64_t sub_1C9F073B8()
{
  return MEMORY[0x1F4154028]();
}

uint64_t sub_1C9F073C8()
{
  return MEMORY[0x1F4154030]();
}

uint64_t sub_1C9F073D8()
{
  return MEMORY[0x1F4154038]();
}

uint64_t sub_1C9F073E8()
{
  return MEMORY[0x1F4154040]();
}

uint64_t sub_1C9F073F8()
{
  return MEMORY[0x1F4154048]();
}

uint64_t sub_1C9F07408()
{
  return MEMORY[0x1F4154050]();
}

uint64_t sub_1C9F07418()
{
  return MEMORY[0x1F4154058]();
}

uint64_t sub_1C9F07428()
{
  return MEMORY[0x1F4154060]();
}

uint64_t sub_1C9F07438()
{
  return MEMORY[0x1F4154068]();
}

uint64_t sub_1C9F07448()
{
  return MEMORY[0x1F4154070]();
}

uint64_t sub_1C9F07458()
{
  return MEMORY[0x1F4154090]();
}

uint64_t sub_1C9F07468()
{
  return MEMORY[0x1F4154098]();
}

uint64_t sub_1C9F07478()
{
  return MEMORY[0x1F41540A0]();
}

uint64_t sub_1C9F07488()
{
  return MEMORY[0x1F41540A8]();
}

uint64_t sub_1C9F07498()
{
  return MEMORY[0x1F41540B0]();
}

uint64_t sub_1C9F074A8()
{
  return MEMORY[0x1F41540B8]();
}

uint64_t sub_1C9F074B8()
{
  return MEMORY[0x1F41540C0]();
}

uint64_t sub_1C9F074C8()
{
  return MEMORY[0x1F41541A0]();
}

uint64_t sub_1C9F074D8()
{
  return MEMORY[0x1F41541A8]();
}

uint64_t sub_1C9F074E8()
{
  return MEMORY[0x1F41541B0]();
}

uint64_t sub_1C9F074F8()
{
  return MEMORY[0x1F41541B8]();
}

uint64_t sub_1C9F07508()
{
  return MEMORY[0x1F41541C0]();
}

uint64_t sub_1C9F07518()
{
  return MEMORY[0x1F41541C8]();
}

uint64_t sub_1C9F07528()
{
  return MEMORY[0x1F41541D0]();
}

uint64_t sub_1C9F07538()
{
  return MEMORY[0x1F41541D8]();
}

uint64_t sub_1C9F07548()
{
  return MEMORY[0x1F41541E0]();
}

uint64_t sub_1C9F07558()
{
  return MEMORY[0x1F41541E8]();
}

uint64_t sub_1C9F07568()
{
  return MEMORY[0x1F41541F0]();
}

uint64_t sub_1C9F07578()
{
  return MEMORY[0x1F41541F8]();
}

uint64_t sub_1C9F07588()
{
  return MEMORY[0x1F4154200]();
}

uint64_t sub_1C9F07598()
{
  return MEMORY[0x1F4154208]();
}

uint64_t sub_1C9F075A8()
{
  return MEMORY[0x1F4154210]();
}

uint64_t sub_1C9F075B8()
{
  return MEMORY[0x1F4154218]();
}

uint64_t sub_1C9F075C8()
{
  return MEMORY[0x1F4154220]();
}

uint64_t sub_1C9F075D8()
{
  return MEMORY[0x1F4154228]();
}

uint64_t sub_1C9F075E8()
{
  return MEMORY[0x1F4154230]();
}

uint64_t sub_1C9F075F8()
{
  return MEMORY[0x1F4154238]();
}

uint64_t sub_1C9F07608()
{
  return MEMORY[0x1F4154240]();
}

uint64_t sub_1C9F07618()
{
  return MEMORY[0x1F4154248]();
}

uint64_t sub_1C9F07628()
{
  return MEMORY[0x1F4154250]();
}

uint64_t sub_1C9F07638()
{
  return MEMORY[0x1F4154258]();
}

uint64_t sub_1C9F07648()
{
  return MEMORY[0x1F4154350]();
}

uint64_t sub_1C9F07658()
{
  return MEMORY[0x1F4154358]();
}

uint64_t sub_1C9F07668()
{
  return MEMORY[0x1F4154360]();
}

uint64_t sub_1C9F07678()
{
  return MEMORY[0x1F4154368]();
}

uint64_t sub_1C9F07688()
{
  return MEMORY[0x1F4154370]();
}

uint64_t sub_1C9F07698()
{
  return MEMORY[0x1F4154378]();
}

uint64_t sub_1C9F076A8()
{
  return MEMORY[0x1F4154380]();
}

uint64_t sub_1C9F076B8()
{
  return MEMORY[0x1F4154398]();
}

uint64_t sub_1C9F076C8()
{
  return MEMORY[0x1F41543A0]();
}

uint64_t sub_1C9F076D8()
{
  return MEMORY[0x1F41543A8]();
}

uint64_t sub_1C9F076E8()
{
  return MEMORY[0x1F41543B0]();
}

uint64_t sub_1C9F076F8()
{
  return MEMORY[0x1F41543B8]();
}

uint64_t sub_1C9F07708()
{
  return MEMORY[0x1F41543C0]();
}

uint64_t sub_1C9F07718()
{
  return MEMORY[0x1F41543C8]();
}

uint64_t sub_1C9F07728()
{
  return MEMORY[0x1F41543E0]();
}

uint64_t sub_1C9F07738()
{
  return MEMORY[0x1F41543E8]();
}

uint64_t sub_1C9F07748()
{
  return MEMORY[0x1F4154418]();
}

uint64_t sub_1C9F07758()
{
  return MEMORY[0x1F4154420]();
}

uint64_t sub_1C9F07768()
{
  return MEMORY[0x1F4154458]();
}

uint64_t sub_1C9F07778()
{
  return MEMORY[0x1F4154460]();
}

uint64_t sub_1C9F07788()
{
  return MEMORY[0x1F4154468]();
}

uint64_t sub_1C9F07798()
{
  return MEMORY[0x1F4154470]();
}

uint64_t sub_1C9F077A8()
{
  return MEMORY[0x1F4154478]();
}

uint64_t sub_1C9F077B8()
{
  return MEMORY[0x1F4154480]();
}

uint64_t sub_1C9F077C8()
{
  return MEMORY[0x1F4154488]();
}

uint64_t sub_1C9F077D8()
{
  return MEMORY[0x1F4154490]();
}

uint64_t sub_1C9F077E8()
{
  return MEMORY[0x1F4154498]();
}

uint64_t sub_1C9F077F8()
{
  return MEMORY[0x1F41544E0]();
}

uint64_t sub_1C9F07808()
{
  return MEMORY[0x1F41544E8]();
}

uint64_t sub_1C9F07818()
{
  return MEMORY[0x1F41544F0]();
}

uint64_t sub_1C9F07828()
{
  return MEMORY[0x1F41544F8]();
}

uint64_t sub_1C9F07838()
{
  return MEMORY[0x1F4154500]();
}

uint64_t sub_1C9F07848()
{
  return MEMORY[0x1F4154508]();
}

uint64_t sub_1C9F07858()
{
  return MEMORY[0x1F4154518]();
}

uint64_t sub_1C9F07868()
{
  return MEMORY[0x1F4154520]();
}

uint64_t sub_1C9F07878()
{
  return MEMORY[0x1F4154528]();
}

uint64_t sub_1C9F07888()
{
  return MEMORY[0x1F4154680]();
}

uint64_t sub_1C9F07898()
{
  return MEMORY[0x1F4154688]();
}

uint64_t sub_1C9F078A8()
{
  return MEMORY[0x1F4154690]();
}

uint64_t sub_1C9F078B8()
{
  return MEMORY[0x1F4154698]();
}

uint64_t sub_1C9F078C8()
{
  return MEMORY[0x1F41546A0]();
}

uint64_t sub_1C9F078D8()
{
  return MEMORY[0x1F41546A8]();
}

uint64_t sub_1C9F078E8()
{
  return MEMORY[0x1F41546B0]();
}

uint64_t sub_1C9F078F8()
{
  return MEMORY[0x1F41546B8]();
}

uint64_t sub_1C9F07908()
{
  return MEMORY[0x1F41546C0]();
}

uint64_t sub_1C9F07918()
{
  return MEMORY[0x1F41546C8]();
}

uint64_t sub_1C9F07928()
{
  return MEMORY[0x1F41546D0]();
}

uint64_t sub_1C9F07938()
{
  return MEMORY[0x1F41546D8]();
}

uint64_t sub_1C9F07948()
{
  return MEMORY[0x1F41546E0]();
}

uint64_t sub_1C9F07958()
{
  return MEMORY[0x1F4154700]();
}

uint64_t sub_1C9F07968()
{
  return MEMORY[0x1F4154708]();
}

uint64_t sub_1C9F07978()
{
  return MEMORY[0x1F4154710]();
}

uint64_t sub_1C9F07988()
{
  return MEMORY[0x1F4154718]();
}

uint64_t sub_1C9F07998()
{
  return MEMORY[0x1F4154720]();
}

uint64_t sub_1C9F079A8()
{
  return MEMORY[0x1F4154728]();
}

uint64_t sub_1C9F079B8()
{
  return MEMORY[0x1F4154730]();
}

uint64_t sub_1C9F079C8()
{
  return MEMORY[0x1F4154738]();
}

uint64_t sub_1C9F079D8()
{
  return MEMORY[0x1F4154740]();
}

uint64_t sub_1C9F079E8()
{
  return MEMORY[0x1F41547E8]();
}

uint64_t sub_1C9F079F8()
{
  return MEMORY[0x1F41547F0]();
}

uint64_t sub_1C9F07A08()
{
  return MEMORY[0x1F41547F8]();
}

uint64_t sub_1C9F07A18()
{
  return MEMORY[0x1F4154800]();
}

uint64_t sub_1C9F07A28()
{
  return MEMORY[0x1F4154808]();
}

uint64_t sub_1C9F07A38()
{
  return MEMORY[0x1F4154810]();
}

uint64_t sub_1C9F07A48()
{
  return MEMORY[0x1F4154818]();
}

uint64_t sub_1C9F07A58()
{
  return MEMORY[0x1F41548F8]();
}

uint64_t sub_1C9F07A68()
{
  return MEMORY[0x1F4154900]();
}

uint64_t sub_1C9F07A78()
{
  return MEMORY[0x1F4154AE8]();
}

uint64_t sub_1C9F07A88()
{
  return MEMORY[0x1F4154AF0]();
}

uint64_t sub_1C9F07A98()
{
  return MEMORY[0x1F4154AF8]();
}

uint64_t sub_1C9F07AA8()
{
  return MEMORY[0x1F4154B00]();
}

uint64_t sub_1C9F07AB8()
{
  return MEMORY[0x1F4154B08]();
}

uint64_t sub_1C9F07AC8()
{
  return MEMORY[0x1F4154B10]();
}

uint64_t sub_1C9F07AD8()
{
  return MEMORY[0x1F4154B18]();
}

uint64_t sub_1C9F07AE8()
{
  return MEMORY[0x1F4154B20]();
}

uint64_t sub_1C9F07AF8()
{
  return MEMORY[0x1F4154B28]();
}

uint64_t sub_1C9F07B08()
{
  return MEMORY[0x1F4154B30]();
}

uint64_t sub_1C9F07B18()
{
  return MEMORY[0x1F4154BF0]();
}

uint64_t sub_1C9F07B28()
{
  return MEMORY[0x1F4154C18]();
}

uint64_t sub_1C9F07B38()
{
  return MEMORY[0x1F4154C20]();
}

uint64_t sub_1C9F07B48()
{
  return MEMORY[0x1F4154C28]();
}

uint64_t sub_1C9F07B58()
{
  return MEMORY[0x1F4154C30]();
}

uint64_t sub_1C9F07B68()
{
  return MEMORY[0x1F4154C68]();
}

uint64_t sub_1C9F07B78()
{
  return MEMORY[0x1F4154C70]();
}

uint64_t sub_1C9F07B88()
{
  return MEMORY[0x1F4154C78]();
}

uint64_t sub_1C9F07B98()
{
  return MEMORY[0x1F4154C80]();
}

uint64_t sub_1C9F07BA8()
{
  return MEMORY[0x1F4154C88]();
}

uint64_t sub_1C9F07BB8()
{
  return MEMORY[0x1F4154C90]();
}

uint64_t sub_1C9F07BC8()
{
  return MEMORY[0x1F4154C98]();
}

uint64_t sub_1C9F07BD8()
{
  return MEMORY[0x1F4154CA0]();
}

uint64_t sub_1C9F07BE8()
{
  return MEMORY[0x1F4154CF0]();
}

uint64_t sub_1C9F07BF8()
{
  return MEMORY[0x1F4154CF8]();
}

uint64_t sub_1C9F07C08()
{
  return MEMORY[0x1F4154D68]();
}

uint64_t sub_1C9F07C18()
{
  return MEMORY[0x1F4154D70]();
}

uint64_t sub_1C9F07C28()
{
  return MEMORY[0x1F4154D78]();
}

uint64_t sub_1C9F07C38()
{
  return MEMORY[0x1F4154D80]();
}

uint64_t sub_1C9F07C48()
{
  return MEMORY[0x1F4154D88]();
}

uint64_t sub_1C9F07C58()
{
  return MEMORY[0x1F4154D90]();
}

uint64_t sub_1C9F07C68()
{
  return MEMORY[0x1F4154D98]();
}

uint64_t sub_1C9F07C78()
{
  return MEMORY[0x1F4154DA0]();
}

uint64_t sub_1C9F07C88()
{
  return MEMORY[0x1F4154DA8]();
}

uint64_t sub_1C9F07C98()
{
  return MEMORY[0x1F4154DB8]();
}

uint64_t sub_1C9F07CA8()
{
  return MEMORY[0x1F4150AD0]();
}

uint64_t sub_1C9F07CB8()
{
  return MEMORY[0x1F4150DB8]();
}

uint64_t sub_1C9F07CC8()
{
  return MEMORY[0x1F4158860]();
}

uint64_t sub_1C9F07CD8()
{
  return MEMORY[0x1F4158868]();
}

uint64_t sub_1C9F07CE8()
{
  return MEMORY[0x1F4158870]();
}

uint64_t sub_1C9F07CF8()
{
  return MEMORY[0x1F4158878]();
}

uint64_t sub_1C9F07D08()
{
  return MEMORY[0x1F4158880]();
}

uint64_t sub_1C9F07D18()
{
  return MEMORY[0x1F4158888]();
}

uint64_t sub_1C9F07D28()
{
  return MEMORY[0x1F4158898]();
}

uint64_t sub_1C9F07D38()
{
  return MEMORY[0x1F41588A0]();
}

uint64_t sub_1C9F07D48()
{
  return MEMORY[0x1F41588B0]();
}

uint64_t sub_1C9F07D58()
{
  return MEMORY[0x1F41588B8]();
}

uint64_t sub_1C9F07D68()
{
  return MEMORY[0x1F41588C0]();
}

uint64_t sub_1C9F07D78()
{
  return MEMORY[0x1F41588D0]();
}

uint64_t sub_1C9F07D88()
{
  return MEMORY[0x1F41588D8]();
}

uint64_t sub_1C9F07D98()
{
  return MEMORY[0x1F41588E0]();
}

uint64_t sub_1C9F07DA8()
{
  return MEMORY[0x1F41588E8]();
}

uint64_t sub_1C9F07DB8()
{
  return MEMORY[0x1F41588F0]();
}

uint64_t sub_1C9F07DC8()
{
  return MEMORY[0x1F41588F8]();
}

uint64_t sub_1C9F07DD8()
{
  return MEMORY[0x1F4158900]();
}

uint64_t sub_1C9F07DE8()
{
  return MEMORY[0x1F4158928]();
}

uint64_t sub_1C9F07DF8()
{
  return MEMORY[0x1F4158990]();
}

uint64_t sub_1C9F07E08()
{
  return MEMORY[0x1F4158998]();
}

uint64_t sub_1C9F07E18()
{
  return MEMORY[0x1F4149D30]();
}

uint64_t sub_1C9F07E28()
{
  return MEMORY[0x1F4149D38]();
}

uint64_t sub_1C9F07E38()
{
  return MEMORY[0x1F4149D40]();
}

uint64_t sub_1C9F07E48()
{
  return MEMORY[0x1F4149D48]();
}

uint64_t sub_1C9F07E58()
{
  return MEMORY[0x1F4188580]();
}

uint64_t sub_1C9F07E68()
{
  return MEMORY[0x1F4188670]();
}

uint64_t sub_1C9F07E78()
{
  return MEMORY[0x1F41886A0]();
}

uint64_t sub_1C9F07E88()
{
  return MEMORY[0x1F41886B0]();
}

uint64_t sub_1C9F07E98()
{
  return MEMORY[0x1F4186CB0]();
}

uint64_t sub_1C9F07EA8()
{
  return MEMORY[0x1F4186CE8]();
}

uint64_t sub_1C9F07EB8()
{
  return MEMORY[0x1F4186CF8]();
}

uint64_t sub_1C9F07EC8()
{
  return MEMORY[0x1F4186D08]();
}

uint64_t sub_1C9F07ED8()
{
  return MEMORY[0x1F4186D60]();
}

uint64_t sub_1C9F07EE8()
{
  return MEMORY[0x1F4186E28]();
}

uint64_t sub_1C9F07EF8()
{
  return MEMORY[0x1F4186E60]();
}

uint64_t sub_1C9F07F08()
{
  return MEMORY[0x1F4186EB0]();
}

uint64_t sub_1C9F07F18()
{
  return MEMORY[0x1F4186EC0]();
}

uint64_t sub_1C9F07F28()
{
  return MEMORY[0x1F4186EE8]();
}

uint64_t sub_1C9F07F38()
{
  return MEMORY[0x1F4186EF8]();
}

uint64_t sub_1C9F07F48()
{
  return MEMORY[0x1F4186F18]();
}

uint64_t sub_1C9F07F58()
{
  return MEMORY[0x1F4186F40]();
}

uint64_t sub_1C9F07F68()
{
  return MEMORY[0x1F4105630]();
}

uint64_t sub_1C9F07F78()
{
  return MEMORY[0x1F40E6030]();
}

uint64_t sub_1C9F07F88()
{
  return MEMORY[0x1F4183358]();
}

uint64_t sub_1C9F07F98()
{
  return MEMORY[0x1F4183370]();
}

uint64_t sub_1C9F07FA8()
{
  return MEMORY[0x1F41835C0]();
}

uint64_t sub_1C9F07FB8()
{
  return MEMORY[0x1F4183730]();
}

uint64_t sub_1C9F07FC8()
{
  return MEMORY[0x1F4183838]();
}

uint64_t sub_1C9F07FD8()
{
  return MEMORY[0x1F40E6190]();
}

uint64_t sub_1C9F07FE8()
{
  return MEMORY[0x1F40E61D8]();
}

uint64_t sub_1C9F07FF8()
{
  return MEMORY[0x1F4183880]();
}

uint64_t sub_1C9F08008()
{
  return MEMORY[0x1F41838B8]();
}

uint64_t sub_1C9F08018()
{
  return MEMORY[0x1F4183958]();
}

uint64_t sub_1C9F08028()
{
  return MEMORY[0x1F41839B0]();
}

uint64_t sub_1C9F08038()
{
  return MEMORY[0x1F4183A38]();
}

uint64_t sub_1C9F08048()
{
  return MEMORY[0x1F4183A80]();
}

uint64_t sub_1C9F08058()
{
  return MEMORY[0x1F4183A88]();
}

uint64_t sub_1C9F08068()
{
  return MEMORY[0x1F4183AA0]();
}

uint64_t sub_1C9F08088()
{
  return MEMORY[0x1F4183AB0]();
}

uint64_t sub_1C9F08098()
{
  return MEMORY[0x1F4183B10]();
}

uint64_t sub_1C9F080A8()
{
  return MEMORY[0x1F4183B90]();
}

uint64_t sub_1C9F080C8()
{
  return MEMORY[0x1F4183D70]();
}

uint64_t sub_1C9F080D8()
{
  return MEMORY[0x1F4183E80]();
}

uint64_t sub_1C9F080E8()
{
  return MEMORY[0x1F40E6338]();
}

uint64_t sub_1C9F080F8()
{
  return MEMORY[0x1F40E6370]();
}

uint64_t sub_1C9F08108()
{
  return MEMORY[0x1F4183E90]();
}

uint64_t sub_1C9F08118()
{
  return MEMORY[0x1F4183E98]();
}

uint64_t sub_1C9F08128()
{
  return MEMORY[0x1F4183EC8]();
}

uint64_t sub_1C9F08138()
{
  return MEMORY[0x1F4183F38]();
}

uint64_t sub_1C9F08148()
{
  return MEMORY[0x1F4154DD8]();
}

uint64_t sub_1C9F08158()
{
  return MEMORY[0x1F41886D0]();
}

uint64_t sub_1C9F08168()
{
  return MEMORY[0x1F41886E0]();
}

uint64_t sub_1C9F08178()
{
  return MEMORY[0x1F41886E8]();
}

uint64_t sub_1C9F08188()
{
  return MEMORY[0x1F4188700]();
}

uint64_t sub_1C9F08198()
{
  return MEMORY[0x1F40E6700]();
}

uint64_t sub_1C9F081A8()
{
  return MEMORY[0x1F4186FD8]();
}

uint64_t sub_1C9F081B8()
{
  return MEMORY[0x1F4187000]();
}

uint64_t sub_1C9F081C8()
{
  return MEMORY[0x1F41870A0]();
}

uint64_t sub_1C9F081D8()
{
  return MEMORY[0x1F41870D8]();
}

uint64_t sub_1C9F081E8()
{
  return MEMORY[0x1F41870E0]();
}

uint64_t sub_1C9F081F8()
{
  return MEMORY[0x1F4187100]();
}

uint64_t sub_1C9F08208()
{
  return MEMORY[0x1F4188758]();
}

uint64_t sub_1C9F08218()
{
  return MEMORY[0x1F4184640]();
}

uint64_t sub_1C9F08228()
{
  return MEMORY[0x1F41847C0]();
}

uint64_t sub_1C9F08238()
{
  return MEMORY[0x1F4184820]();
}

uint64_t sub_1C9F08248()
{
  return MEMORY[0x1F40E6BB0]();
}

uint64_t sub_1C9F08258()
{
  return MEMORY[0x1F40E6C80]();
}

uint64_t sub_1C9F08268()
{
  return MEMORY[0x1F4184978]();
}

uint64_t sub_1C9F08278()
{
  return MEMORY[0x1F4184B18]();
}

uint64_t sub_1C9F08288()
{
  return MEMORY[0x1F4184C90]();
}

uint64_t sub_1C9F08298()
{
  return MEMORY[0x1F4184C98]();
}

uint64_t sub_1C9F082A8()
{
  return MEMORY[0x1F4184CE8]();
}

uint64_t sub_1C9F082B8()
{
  return MEMORY[0x1F4184CF0]();
}

uint64_t sub_1C9F082C8()
{
  return MEMORY[0x1F4184D80]();
}

uint64_t sub_1C9F082D8()
{
  return MEMORY[0x1F4184E68]();
}

uint64_t sub_1C9F082E8()
{
  return MEMORY[0x1F41851A0]();
}

uint64_t sub_1C9F082F8()
{
  return MEMORY[0x1F41851C0]();
}

uint64_t sub_1C9F08308()
{
  return MEMORY[0x1F4185298]();
}

uint64_t sub_1C9F08318()
{
  return MEMORY[0x1F4185350]();
}

uint64_t sub_1C9F08328()
{
  return MEMORY[0x1F4185368]();
}

uint64_t sub_1C9F08338()
{
  return MEMORY[0x1F4185398]();
}

uint64_t sub_1C9F08348()
{
  return MEMORY[0x1F41854C8]();
}

uint64_t sub_1C9F08358()
{
  return MEMORY[0x1F4185598]();
}

uint64_t sub_1C9F08368()
{
  return MEMORY[0x1F41856C0]();
}

uint64_t sub_1C9F08378()
{
  return MEMORY[0x1F4185758]();
}

uint64_t sub_1C9F08388()
{
  return MEMORY[0x1F4185A40]();
}

uint64_t sub_1C9F08398()
{
  return MEMORY[0x1F4185D68]();
}

uint64_t sub_1C9F083A8()
{
  return MEMORY[0x1F4185DD8]();
}

uint64_t sub_1C9F083B8()
{
  return MEMORY[0x1F4185DE0]();
}

uint64_t sub_1C9F083C8()
{
  return MEMORY[0x1F4185E00]();
}

uint64_t sub_1C9F083D8()
{
  return MEMORY[0x1F4185E08]();
}

uint64_t sub_1C9F083E8()
{
  return MEMORY[0x1F4185E10]();
}

uint64_t sub_1C9F083F8()
{
  return MEMORY[0x1F4185E18]();
}

uint64_t sub_1C9F08408()
{
  return MEMORY[0x1F4185EB0]();
}

uint64_t sub_1C9F08418()
{
  return MEMORY[0x1F4185EF8]();
}

uint64_t sub_1C9F08428()
{
  return MEMORY[0x1F4185F08]();
}

uint64_t sub_1C9F08438()
{
  return MEMORY[0x1F4185F10]();
}

uint64_t sub_1C9F08448()
{
  return MEMORY[0x1F4185F20]();
}

uint64_t sub_1C9F08458()
{
  return MEMORY[0x1F4185F48]();
}

uint64_t sub_1C9F08468()
{
  return MEMORY[0x1F4185FC8]();
}

uint64_t sub_1C9F08478()
{
  return MEMORY[0x1F4185FF0]();
}

uint64_t sub_1C9F084A8()
{
  return MEMORY[0x1F4186318]();
}

uint64_t AFDeviceSupportsBobble()
{
  return MEMORY[0x1F410AC70]();
}

uint64_t AFDeviceSupportsHybridUOD()
{
  return MEMORY[0x1F410AC90]();
}

uint64_t AFDeviceSupportsMedoc()
{
  return MEMORY[0x1F410AC98]();
}

uint64_t AFDeviceSupportsSiriUOD()
{
  return MEMORY[0x1F410ACD8]();
}

uint64_t AFExternalNotificationRequestHandlerStateGetName()
{
  return MEMORY[0x1F410AD20]();
}

uint64_t AFIsInternalInstall()
{
  return MEMORY[0x1F410AD50]();
}

uint64_t AFOfflineDictationCapable()
{
  return MEMORY[0x1F410ADC8]();
}

uint64_t AFShouldRunAsrOnServerForUOD()
{
  return MEMORY[0x1F410AE50]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1F40C9A70](aBlock);
}

void _Block_release(const void *aBlock)
{
}

{
  return MEMORY[0x1F41813D0]();
}

{
  return MEMORY[0x1F41813F0]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x1F4186388]();
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
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

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1F4181640](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1F4181648]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
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

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

uint64_t os_transaction_create()
{
  return MEMORY[0x1F40CD5A0]();
}

uint64_t swift_allocError()
{
  return MEMORY[0x1F41863E0]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1F41863E8]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x1F4186410]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x1F4186418]();
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

uint64_t swift_conformsToProtocol2()
{
  return MEMORY[0x1F4186478]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x1F41864A0]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x1F41864B8]();
}

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x1F41864C0]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x1F4186518]();
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

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x1F41866C8]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x1F4186700]();
}

uint64_t swift_once()
{
  return MEMORY[0x1F4186728]();
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

uint64_t swift_unknownObjectRetain_n()
{
  return MEMORY[0x1F41867F8]();
}

uint64_t swift_unownedRelease()
{
  return MEMORY[0x1F4186880]();
}

uint64_t swift_unownedRetain()
{
  return MEMORY[0x1F4186888]();
}

uint64_t swift_unownedRetainStrong()
{
  return MEMORY[0x1F4186890]();
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