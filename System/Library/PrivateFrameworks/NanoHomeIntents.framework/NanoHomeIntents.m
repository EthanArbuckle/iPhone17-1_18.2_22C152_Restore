uint64_t NHOLogForCategory(uint64_t a1)
{
  void *v2;
  uint64_t vars8;

  if (NHOLogForCategory_onceToken[0] != -1) {
    dispatch_once(NHOLogForCategory_onceToken, &__block_literal_global);
  }
  v2 = (void *)NHOLogForCategory_Logging;

  return [v2 logForCategory:a1];
}

uint64_t __NHOLogForCategory_block_invoke()
{
  NHOLogForCategory_Logging = objc_opt_new();

  return MEMORY[0x270F9A758]();
}

uint64_t NHOSmartStackLastAction.homeID.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t NHOSmartStackLastAction.homeID.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  void *v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*NHOSmartStackLastAction.homeID.modify())()
{
  return nullsub_1;
}

void NHOSmartStackLastAction.action.getter(unsigned char *a1@<X8>)
{
  *a1 = *(unsigned char *)(v1 + 16);
}

unsigned char *NHOSmartStackLastAction.action.setter(unsigned char *result)
{
  *(unsigned char *)(v1 + 16) = *result;
  return result;
}

uint64_t (*NHOSmartStackLastAction.action.modify())()
{
  return nullsub_1;
}

uint64_t NHOSmartStackLastAction.actionID.getter()
{
  uint64_t v1 = *(void *)(v0 + 24);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t NHOSmartStackLastAction.actionID.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 24) = a1;
  *(void *)(v2 + 32) = a2;
  return result;
}

uint64_t (*NHOSmartStackLastAction.actionID.modify())()
{
  return nullsub_1;
}

uint64_t NHOSmartStackLastAction.date.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for NHOSmartStackLastAction() + 28);
  uint64_t v4 = sub_257321578();
  v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);

  return v5(a1, v3, v4);
}

uint64_t type metadata accessor for NHOSmartStackLastAction()
{
  uint64_t result = qword_269FE5360;
  if (!qword_269FE5360) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t NHOSmartStackLastAction.date.setter(uint64_t a1)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for NHOSmartStackLastAction() + 28);
  uint64_t v4 = sub_257321578();
  v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40);

  return v5(v3, a1, v4);
}

uint64_t (*NHOSmartStackLastAction.date.modify())()
{
  return nullsub_1;
}

double static NHOSmartStackLastAction.actionLifeSpan.getter()
{
  return 180.0;
}

Swift::Void __swiftcall NHOSmartStackLastAction.save()()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_257321548();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388]();
  v5 = (char *)&v26 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = *v0;
  uint64_t v7 = v0[1];
  swift_bridgeObjectRetain();
  uint64_t v8 = MEMORY[0x263F8EE80];
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v27 = v8;
  sub_2572FC2B4(v6, v7, 0x4449656D6F68, 0xE600000000000000, isUniquelyReferenced_nonNull_native);
  uint64_t v10 = v27;
  swift_bridgeObjectRelease();
  uint64_t v11 = 0xE900000000000079;
  uint64_t v12 = 0x726F737365636361;
  switch(*((unsigned char *)v1 + 16))
  {
    case 1:
      uint64_t v11 = 0xE900000000000074;
      uint64_t v12 = 0x65536E6F69746361;
      break;
    case 2:
      uint64_t v12 = 0x746867694C6C6C61;
      uint64_t v11 = 0xE900000000000073;
      break;
    case 3:
      uint64_t v11 = 0xEB00000000737265;
      uint64_t v12 = 0x6B616570536C6C61;
      break;
    case 4:
      uint64_t v11 = 0xE800000000000000;
      uint64_t v12 = 0x736B636F4C6C6C61;
      break;
    default:
      break;
  }
  char v13 = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v27 = v10;
  sub_2572FC2B4(v12, v11, 0x6E6F69746361, 0xE600000000000000, v13);
  uint64_t v14 = v27;
  swift_bridgeObjectRelease();
  uint64_t v15 = v1[3];
  uint64_t v16 = v1[4];
  swift_bridgeObjectRetain();
  char v17 = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v27 = v14;
  sub_2572FC2B4(v15, v16, 0x44496E6F69746361, 0xE800000000000000, v17);
  uint64_t v18 = v27;
  swift_bridgeObjectRelease();
  type metadata accessor for NHOSmartStackLastAction();
  sub_2572FA69C((uint64_t)v5);
  uint64_t v19 = sub_2573214D8();
  uint64_t v21 = v20;
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  char v22 = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v27 = v18;
  sub_2572FC2B4(v19, v21, 1702125924, 0xE400000000000000, v22);
  swift_bridgeObjectRelease();
  id v23 = sub_2572FCBC0();
  v24 = (void *)sub_257321798();
  swift_bridgeObjectRelease();
  v25 = (void *)sub_2573217E8();
  objc_msgSend(v23, sel_setValue_forKey_, v24, v25);
}

uint64_t sub_2572FA69C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v24 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269FE5388);
  MEMORY[0x270FA5388]();
  uint64_t v27 = (char *)&v22 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v26 = sub_257321638();
  uint64_t v2 = *(void *)(v26 - 8);
  MEMORY[0x270FA5388]();
  id v23 = (char *)&v22 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = sub_257321538();
  uint64_t v4 = *(void *)(v25 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v6 = (char *)&v22 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_257321518();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v10 = (char *)&v22 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_2573214F8();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v14 = (char *)&v22 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_257321508();
  MEMORY[0x270FA5388]();
  (*(void (**)(char *, void))(v16 + 104))((char *)&v22 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0), *MEMORY[0x263F072A0]);
  uint64_t v17 = v11;
  uint64_t v18 = v26;
  (*(void (**)(char *, void, uint64_t))(v12 + 104))(v14, *MEMORY[0x263F07288], v17);
  uint64_t v19 = v6;
  uint64_t v20 = v27;
  (*(void (**)(char *, void, uint64_t))(v8 + 104))(v10, *MEMORY[0x263F072B8], v7);
  (*(void (**)(char *, void, uint64_t))(v4 + 104))(v19, *MEMORY[0x263F072C8], v25);
  sub_257321628();
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v2 + 48))(v20, 1, v18);
  if (result == 1)
  {
    __break(1u);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v2 + 32))(v23, v20, v18);
    return sub_257321528();
  }
  return result;
}

uint64_t static NHOSmartStackLastAction.getLastAction()@<X0>(uint64_t a1@<X8>)
{
  uint64_t Action = type metadata accessor for NHOSmartStackLastAction();
  uint64_t v2 = *(void *)(Action - 8);
  ((void (*)(void))MEMORY[0x270FA5388])();
  uint64_t v85 = (uint64_t)&v77 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269FE5348);
  ((void (*)(void))MEMORY[0x270FA5388])();
  uint64_t v5 = (char *)&v77 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_257321578();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  uint64_t v10 = (char *)&v77 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)&v77 - v11;
  id v13 = sub_2572FCBC0();
  v86 = "";
  uint64_t v14 = (void *)sub_2573217E8();
  id v15 = objc_msgSend(v13, sel_objectForKey_, v14);

  if (v15)
  {
    sub_257321A88();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v89, 0, sizeof(v89));
  }
  sub_2572FCD70((uint64_t)v89, (uint64_t)v90);
  if (v90[3])
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_269FE5358);
    if (swift_dynamicCast())
    {
      uint64_t v16 = v88;
      if (*(void *)(v88 + 16) && (unint64_t v17 = sub_2572FBD1C(0x4449656D6F68, 0xE600000000000000), (v18 & 1) != 0))
      {
        uint64_t v19 = *(void *)(v16 + 56) + 16 * v17;
        uint64_t v20 = *(void *)(v19 + 8);
        v82 = *(void (**)(char *, uint64_t))v19;
        uint64_t v83 = v20;
        uint64_t v21 = *(void *)(v16 + 16);
        swift_bridgeObjectRetain();
        uint64_t v84 = a1;
        if (v21 && (unint64_t v22 = sub_2572FBD1C(0x6E6F69746361, 0xE600000000000000), (v23 & 1) != 0))
        {
          uint64_t v24 = (uint64_t *)(*(void *)(v16 + 56) + 16 * v22);
          uint64_t v26 = *v24;
          uint64_t v25 = (void *)v24[1];
          swift_bridgeObjectRetain();
        }
        else
        {
          uint64_t v26 = 0;
          uint64_t v25 = (void *)0xE000000000000000;
        }
        v34._countAndFlagsBits = v26;
        v34._object = v25;
        NHOSmartStackAction.init(rawValue:)(v34);
        int v35 = LOBYTE(v90[0]);
        if (LOBYTE(v90[0]) != 5
          && *(void *)(v16 + 16)
          && (unint64_t v36 = sub_2572FBD1C(0x44496E6F69746361, 0xE800000000000000), (v37 & 1) != 0))
        {
          int v79 = v35;
          v38 = (uint64_t *)(*(void *)(v16 + 56) + 16 * v36);
          uint64_t v39 = v38[1];
          uint64_t v78 = *v38;
          id v40 = objc_allocWithZone(MEMORY[0x263F088C0]);
          uint64_t v81 = v39;
          swift_bridgeObjectRetain();
          id v41 = objc_msgSend(v40, sel_init);
          if (*(void *)(v16 + 16) && (unint64_t v42 = sub_2572FBD1C(1702125924, 0xE400000000000000), (v43 & 1) != 0))
          {
            uint64_t v80 = *(void *)(*(void *)(v16 + 56) + 16 * v42);
            swift_bridgeObjectRetain();
          }
          else
          {
            uint64_t v80 = 0;
          }
          swift_bridgeObjectRelease();
          v51 = (void *)sub_2573217E8();
          swift_bridgeObjectRelease();
          id v52 = objc_msgSend(v41, sel_dateFromString_, v51);

          if (v52)
          {
            sub_257321558();

            v53 = *(void (**)(char *, char *, uint64_t))(v7 + 32);
            v53(v5, v10, v6);
            (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(v5, 0, 1, v6);
            if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6) != 1)
            {
              v53(v12, v5, v6);
              uint64_t v33 = Action;
              uint64_t v54 = v85;
              (*(void (**)(uint64_t, char *, uint64_t))(v7 + 16))(v85 + *(int *)(Action + 28), v12, v6);
              uint64_t v55 = v83;
              *(void *)uint64_t v54 = v82;
              *(void *)(v54 + 8) = v55;
              *(unsigned char *)(v54 + 16) = v79;
              uint64_t v56 = v81;
              *(void *)(v54 + 24) = v78;
              *(void *)(v54 + 32) = v56;
              sub_257321568();
              sub_2573214E8();
              double v58 = v57;
              v61 = *(void (**)(char *, uint64_t))(v7 + 8);
              uint64_t v60 = v7 + 8;
              v59 = v61;
              v61(v10, v6);
              if (v58 < 180.0)
              {
                if (qword_269FE52C8 != -1) {
                  swift_once();
                }
                uint64_t v62 = sub_257321708();
                __swift_project_value_buffer(v62, (uint64_t)qword_269FE5548);
                v63 = sub_2573216E8();
                os_log_type_t v64 = sub_2573219E8();
                if (os_log_type_enabled(v63, v64))
                {
                  v65 = (uint8_t *)swift_slowAlloc();
                  uint64_t v66 = swift_slowAlloc();
                  uint64_t v83 = v60;
                  v67 = v59;
                  uint64_t v68 = v66;
                  v90[0] = v66;
                  *(_DWORD *)v65 = 136315138;
                  v86 = (char *)(v65 + 4);
                  *(void *)&v89[0] = sub_2572FB6C4(0x417473614C746567, 0xEF29286E6F697463, v90);
                  sub_257321A68();
                  _os_log_impl(&dword_2572F7000, v63, v64, "%s valid last action is found and being returned", v65, 0xCu);
                  swift_arrayDestroy();
                  MEMORY[0x25A2B3D30](v68, -1, -1);
                  v69 = v65;
                  uint64_t v33 = Action;
                  MEMORY[0x25A2B3D30](v69, -1, -1);

                  v67(v12, v6);
                }
                else
                {

                  v59(v12, v6);
                }
                a1 = v84;
                sub_2572FCEC8(v85, v84);
                uint64_t v32 = 0;
                return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v2 + 56))(a1, v32, 1, v33);
              }
              if (qword_269FE52C8 != -1) {
                swift_once();
              }
              v82 = v59;
              uint64_t v83 = v60;
              uint64_t v70 = sub_257321708();
              __swift_project_value_buffer(v70, (uint64_t)qword_269FE5548);
              v71 = sub_2573216E8();
              os_log_type_t v72 = sub_2573219D8();
              if (os_log_type_enabled(v71, v72))
              {
                uint64_t v73 = swift_slowAlloc();
                uint64_t v74 = swift_slowAlloc();
                v90[0] = v74;
                *(_DWORD *)uint64_t v73 = 136315650;
                *(void *)&v89[0] = sub_2572FB6C4(0x417473614C746567, 0xEF29286E6F697463, v90);
                sub_257321A68();
                *(_WORD *)(v73 + 12) = 2048;
                *(double *)v89 = v58;
                sub_257321A68();
                *(_WORD *)(v73 + 22) = 2048;
                *(void *)&v89[0] = 0x4066800000000000;
                sub_257321A68();
                _os_log_impl(&dword_2572F7000, v71, v72, "%s last action is %f seconds which is greater than %f seconds and it was removed", (uint8_t *)v73, 0x20u);
                swift_arrayDestroy();
                MEMORY[0x25A2B3D30](v74, -1, -1);
                uint64_t v75 = v73;
                uint64_t v33 = Action;
                MEMORY[0x25A2B3D30](v75, -1, -1);
              }

              a1 = v84;
              v76 = (void *)sub_2573217E8();
              objc_msgSend(v13, sel_removeObjectForKey_, v76);

              sub_2572FCE6C(v85);
              v82(v12, v6);
LABEL_33:
              uint64_t v32 = 1;
              return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v2 + 56))(a1, v32, 1, v33);
            }
          }
          else
          {
            (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v7 + 56))(v5, 1, 1, v6);
          }
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          sub_2572FCE10((uint64_t)v5, &qword_269FE5348);
        }
        else
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
        }
        a1 = v84;
      }
      else
      {
        swift_bridgeObjectRelease();
      }
      if (qword_269FE52C8 != -1) {
        swift_once();
      }
      uint64_t v44 = sub_257321708();
      __swift_project_value_buffer(v44, (uint64_t)qword_269FE5548);
      v45 = sub_2573216E8();
      os_log_type_t v46 = sub_2573219E8();
      if (os_log_type_enabled(v45, v46))
      {
        v47 = (uint8_t *)swift_slowAlloc();
        uint64_t v48 = swift_slowAlloc();
        v90[0] = v48;
        *(_DWORD *)v47 = 136315138;
        *(void *)&v89[0] = sub_2572FB6C4(0x417473614C746567, 0xEF29286E6F697463, v90);
        sub_257321A68();
        _os_log_impl(&dword_2572F7000, v45, v46, "%s last action found but values could not be loaded and it was removed", v47, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x25A2B3D30](v48, -1, -1);
        MEMORY[0x25A2B3D30](v47, -1, -1);
      }

      uint64_t v33 = Action;
      v49 = (void *)sub_2573217E8();
      objc_msgSend(v13, sel_removeObjectForKey_, v49);

      goto LABEL_33;
    }
  }
  else
  {
    sub_2572FCE10((uint64_t)v90, &qword_269FE5350);
  }
  if (qword_269FE52C8 != -1) {
    swift_once();
  }
  uint64_t v27 = sub_257321708();
  __swift_project_value_buffer(v27, (uint64_t)qword_269FE5548);
  v28 = sub_2573216E8();
  os_log_type_t v29 = sub_2573219E8();
  if (os_log_type_enabled(v28, v29))
  {
    v30 = (uint8_t *)swift_slowAlloc();
    uint64_t v31 = swift_slowAlloc();
    v90[0] = v31;
    *(_DWORD *)v30 = 136315138;
    *(void *)&v89[0] = sub_2572FB6C4(0x417473614C746567, 0xEF29286E6F697463, v90);
    sub_257321A68();
    _os_log_impl(&dword_2572F7000, v28, v29, "%s no last action found to home smart stack", v30, 0xCu);
    uint64_t v32 = 1;
    swift_arrayDestroy();
    MEMORY[0x25A2B3D30](v31, -1, -1);
    MEMORY[0x25A2B3D30](v30, -1, -1);
  }
  else
  {

    uint64_t v32 = 1;
  }
  uint64_t v33 = Action;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v2 + 56))(a1, v32, 1, v33);
}

uint64_t sub_2572FB6C4(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_2572FB798(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_2572FD6B8((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    uint64_t ObjectType = MEMORY[0x263F8DBE0];
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_2572FD6B8((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_2572FB798(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_257321A78();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_2572FB954(a5, a6);
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
  uint64_t v8 = sub_257321B48();
  if (!v8)
  {
    sub_257321B98();
    __break(1u);
LABEL_17:
    uint64_t result = sub_257321BE8();
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

uint64_t sub_2572FB954(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_2572FB9EC(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_2572FBBCC(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_2572FBBCC(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_2572FB9EC(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_2572FBB64(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_257321B28();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_257321B98();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_257321888();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_257321BE8();
    __break(1u);
LABEL_14:
    uint64_t result = sub_257321B98();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_2572FBB64(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return (void *)MEMORY[0x263F8EE78];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_269FE5380);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_2572FBBCC(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_269FE5380);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v12 = v10 + 32;
  id v13 = a4 + 32;
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
  uint64_t result = sub_257321BE8();
  __break(1u);
  return result;
}

unint64_t sub_2572FBD1C(uint64_t a1, uint64_t a2)
{
  sub_257321C48();
  sub_257321848();
  uint64_t v4 = sub_257321C68();

  return sub_2572FC43C(a1, a2, v4);
}

unint64_t sub_2572FBD94(uint64_t a1)
{
  uint64_t v2 = sub_257321AC8();

  return sub_2572FC520(a1, v2);
}

unint64_t sub_2572FBDD8(unsigned __int8 a1)
{
  sub_257321C48();
  sub_257321848();
  swift_bridgeObjectRelease();
  uint64_t v2 = sub_257321C68();

  return sub_2572FC5E8(a1, v2);
}

unint64_t sub_2572FBF08(uint64_t a1)
{
  sub_2573215A8();
  sub_2572FD574(&qword_269FE5370);
  uint64_t v2 = sub_2573217B8();

  return sub_2572FC858(a1, v2);
}

uint64_t sub_2572FBF8C(uint64_t a1, char a2)
{
  unint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269FE5390);
  char v42 = a2;
  uint64_t v6 = sub_257321BC8();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v41 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  uint64_t v39 = v2;
  int64_t v40 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v11 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v13 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v21 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v22 = v21 | (v13 << 6);
      goto LABEL_31;
    }
    int64_t v23 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v23 >= v40) {
      break;
    }
    uint64_t v24 = (void *)(v5 + 64);
    unint64_t v25 = *(void *)(v41 + 8 * v23);
    ++v13;
    if (!v25)
    {
      int64_t v13 = v23 + 1;
      if (v23 + 1 >= v40) {
        goto LABEL_33;
      }
      unint64_t v25 = *(void *)(v41 + 8 * v13);
      if (!v25)
      {
        int64_t v26 = v23 + 2;
        if (v26 >= v40)
        {
LABEL_33:
          swift_release();
          unint64_t v3 = v39;
          if ((v42 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v25 = *(void *)(v41 + 8 * v26);
        if (!v25)
        {
          while (1)
          {
            int64_t v13 = v26 + 1;
            if (__OFADD__(v26, 1)) {
              goto LABEL_42;
            }
            if (v13 >= v40) {
              goto LABEL_33;
            }
            unint64_t v25 = *(void *)(v41 + 8 * v13);
            ++v26;
            if (v25) {
              goto LABEL_30;
            }
          }
        }
        int64_t v13 = v26;
      }
    }
LABEL_30:
    unint64_t v10 = (v25 - 1) & v25;
    unint64_t v22 = __clz(__rbit64(v25)) + (v13 << 6);
LABEL_31:
    uint64_t v31 = 16 * v22;
    uint64_t v32 = (uint64_t *)(*(void *)(v5 + 48) + v31);
    uint64_t v34 = *v32;
    uint64_t v33 = v32[1];
    int v35 = (uint64_t *)(*(void *)(v5 + 56) + v31);
    uint64_t v36 = *v35;
    uint64_t v37 = v35[1];
    if ((v42 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    sub_257321C48();
    sub_257321848();
    uint64_t result = sub_257321C68();
    uint64_t v14 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v15 = result & ~v14;
    unint64_t v16 = v15 >> 6;
    if (((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      unint64_t v17 = __clz(__rbit64((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v27 = 0;
      unint64_t v28 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v28 && (v27 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v29 = v16 == v28;
        if (v16 == v28) {
          unint64_t v16 = 0;
        }
        v27 |= v29;
        uint64_t v30 = *(void *)(v11 + 8 * v16);
      }
      while (v30 == -1);
      unint64_t v17 = __clz(__rbit64(~v30)) + (v16 << 6);
    }
    *(void *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    uint64_t v18 = 16 * v17;
    uint64_t v19 = (void *)(*(void *)(v7 + 48) + v18);
    *uint64_t v19 = v34;
    v19[1] = v33;
    uint64_t v20 = (void *)(*(void *)(v7 + 56) + v18);
    *uint64_t v20 = v36;
    v20[1] = v37;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  unint64_t v3 = v39;
  uint64_t v24 = (void *)(v5 + 64);
  if ((v42 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v38 = 1 << *(unsigned char *)(v5 + 32);
  if (v38 >= 64) {
    bzero(v24, ((unint64_t)(v38 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    void *v24 = -1 << v38;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *unint64_t v3 = v7;
  return result;
}

uint64_t sub_2572FC2B4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  uint64_t v6 = v5;
  uint64_t v12 = *v5;
  unint64_t v14 = sub_2572FBD1C(a3, a4);
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
  if (v19 >= v17 && (a5 & 1) != 0) {
    goto LABEL_7;
  }
  if (v19 >= v17 && (a5 & 1) == 0)
  {
    sub_2572FCA04();
LABEL_7:
    uint64_t v20 = (void *)*v6;
    if (v18)
    {
LABEL_8:
      unint64_t v21 = (void *)(v20[7] + 16 * v14);
      uint64_t result = swift_bridgeObjectRelease();
      *unint64_t v21 = a1;
      v21[1] = a2;
      return result;
    }
    goto LABEL_11;
  }
  sub_2572FBF8C(v17, a5 & 1);
  unint64_t v23 = sub_2572FBD1C(a3, a4);
  if ((v18 & 1) != (v24 & 1))
  {
LABEL_17:
    uint64_t result = sub_257321C38();
    __break(1u);
    return result;
  }
  unint64_t v14 = v23;
  uint64_t v20 = (void *)*v6;
  if (v18) {
    goto LABEL_8;
  }
LABEL_11:
  v20[(v14 >> 6) + 8] |= 1 << v14;
  unint64_t v25 = (uint64_t *)(v20[6] + 16 * v14);
  uint64_t *v25 = a3;
  v25[1] = a4;
  int64_t v26 = (void *)(v20[7] + 16 * v14);
  *int64_t v26 = a1;
  v26[1] = a2;
  uint64_t v27 = v20[2];
  BOOL v28 = __OFADD__(v27, 1);
  uint64_t v29 = v27 + 1;
  if (v28)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v20[2] = v29;

  return swift_bridgeObjectRetain();
}

unint64_t sub_2572FC43C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    unint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_257321C18() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        char v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_257321C18() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_2572FC520(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v6 = ~v3;
    do
    {
      sub_2572FD5B8(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      char v7 = MEMORY[0x25A2B3620](v9, a1);
      sub_2572FD614((uint64_t)v9);
      if (v7) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v6;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

unint64_t sub_2572FC5E8(unsigned __int8 a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v5 = ~v3;
    uint64_t v6 = a1;
    while (1)
    {
      unint64_t v7 = 0xE900000000000079;
      uint64_t v8 = 0x726F737365636361;
      switch(*(unsigned char *)(*(void *)(v2 + 48) + v4))
      {
        case 1:
          unint64_t v7 = 0xE900000000000074;
          uint64_t v8 = 0x65536E6F69746361;
          break;
        case 2:
          uint64_t v8 = 0x746867694C6C6C61;
          unint64_t v7 = 0xE900000000000073;
          break;
        case 3:
          uint64_t v8 = 0x6B616570536C6C61;
          unint64_t v7 = 0xEB00000000737265;
          break;
        case 4:
          unint64_t v7 = 0xE800000000000000;
          uint64_t v8 = 0x736B636F4C6C6C61;
          break;
        default:
          break;
      }
      unint64_t v9 = 0xE900000000000079;
      uint64_t v10 = 0x726F737365636361;
      switch(v6)
      {
        case 1:
          unint64_t v9 = 0xE900000000000074;
          if (v8 == 0x65536E6F69746361) {
            goto LABEL_15;
          }
          goto LABEL_16;
        case 2:
          unint64_t v9 = 0xE900000000000073;
          if (v8 != 0x746867694C6C6C61) {
            goto LABEL_16;
          }
          goto LABEL_15;
        case 3:
          uint64_t v10 = 0x6B616570536C6C61;
          unint64_t v9 = 0xEB00000000737265;
          goto LABEL_14;
        case 4:
          unint64_t v9 = 0xE800000000000000;
          if (v8 != 0x736B636F4C6C6C61) {
            goto LABEL_16;
          }
          goto LABEL_15;
        default:
LABEL_14:
          if (v8 != v10) {
            goto LABEL_16;
          }
LABEL_15:
          if (v7 == v9)
          {
            swift_bridgeObjectRelease_n();
            return v4;
          }
LABEL_16:
          char v11 = sub_257321C18();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if (v11) {
            return v4;
          }
          unint64_t v4 = (v4 + 1) & v5;
          if (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) == 0) {
            return v4;
          }
          break;
      }
    }
  }
  return v4;
}

unint64_t sub_2572FC858(uint64_t a1, uint64_t a2)
{
  uint64_t v19 = a1;
  uint64_t v4 = sub_2573215A8();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  unint64_t v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = v2;
  uint64_t v8 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v9 = a2 & ~v8;
  uint64_t v18 = v2 + 64;
  if ((*(void *)(v2 + 64 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9))
  {
    uint64_t v10 = ~v8;
    char v13 = *(void (**)(char *, unint64_t, uint64_t))(v5 + 16);
    uint64_t v12 = v5 + 16;
    char v11 = v13;
    uint64_t v14 = *(void *)(v12 + 56);
    do
    {
      v11(v7, *(void *)(v20 + 48) + v14 * v9, v4);
      sub_2572FD574(&qword_269FE5378);
      char v15 = sub_2573217C8();
      (*(void (**)(char *, uint64_t))(v12 - 8))(v7, v4);
      if (v15) {
        break;
      }
      unint64_t v9 = (v9 + 1) & v10;
    }
    while (((*(void *)(v18 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9) & 1) != 0);
  }
  return v9;
}

void *sub_2572FCA04()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269FE5390);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_257321BB8();
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
    int64_t v25 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v25 >= v13) {
      goto LABEL_26;
    }
    unint64_t v26 = *(void *)(v6 + 8 * v25);
    ++v9;
    if (!v26)
    {
      int64_t v9 = v25 + 1;
      if (v25 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v26 = *(void *)(v6 + 8 * v9);
      if (!v26) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v26 - 1) & v26;
    unint64_t v15 = __clz(__rbit64(v26)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    uint64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + v16);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    uint64_t v20 = (uint64_t *)(*(void *)(v2 + 56) + v16);
    uint64_t v21 = *v20;
    uint64_t v22 = v20[1];
    unint64_t v23 = (void *)(*(void *)(v4 + 48) + v16);
    *unint64_t v23 = v19;
    v23[1] = v18;
    char v24 = (void *)(*(void *)(v4 + 56) + v16);
    void *v24 = v21;
    v24[1] = v22;
    swift_bridgeObjectRetain();
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v27 = v25 + 2;
  if (v27 >= v13) {
    goto LABEL_26;
  }
  unint64_t v26 = *(void *)(v6 + 8 * v27);
  if (v26)
  {
    int64_t v9 = v27;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v27 + 1;
    if (__OFADD__(v27, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v26 = *(void *)(v6 + 8 * v9);
    ++v27;
    if (v26) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

id sub_2572FCBC0()
{
  id v0 = objc_msgSend(self, sel_mainBundle);
  id v1 = objc_msgSend(v0, sel_bundleIdentifier);

  if (v1)
  {
    uint64_t v2 = sub_2573217F8();
    uint64_t v4 = v3;

    if (v2 == 0xD000000000000012 && v4 == 0x8000000257323E10)
    {
      swift_bridgeObjectRelease();
      goto LABEL_8;
    }
    char v5 = sub_257321C18();
    swift_bridgeObjectRelease();
    if (v5) {
      goto LABEL_8;
    }
  }
  id v6 = objc_allocWithZone(MEMORY[0x263EFFA40]);
  unint64_t v7 = (void *)sub_2573217E8();
  id v8 = objc_msgSend(v6, sel_initWithSuiteName_, v7);

  if (v8) {
    return v8;
  }
LABEL_8:
  id v10 = objc_msgSend(self, sel_standardUserDefaults);

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

uint64_t sub_2572FCD70(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269FE5350);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_2572FCE10(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_2572FCE6C(uint64_t a1)
{
  uint64_t Action = type metadata accessor for NHOSmartStackLastAction();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(Action - 8) + 8))(a1, Action);
  return a1;
}

uint64_t sub_2572FCEC8(uint64_t a1, uint64_t a2)
{
  uint64_t Action = type metadata accessor for NHOSmartStackLastAction();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(Action - 8) + 32))(a2, a1, Action);
  return a2;
}

void *initializeBufferWithCopyOfBuffer for NHOSmartStackLastAction(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v3 = (void *)a1;
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    uint64_t v12 = *a2;
    *uint64_t v3 = *a2;
    uint64_t v3 = (void *)(v12 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    uint64_t v5 = a2[1];
    *(void *)a1 = *a2;
    *(void *)(a1 + 8) = v5;
    *(unsigned char *)(a1 + 16) = *((unsigned char *)a2 + 16);
    uint64_t v6 = a2[4];
    uint64_t v7 = *(int *)(a3 + 28);
    uint64_t v8 = a1 + v7;
    uint64_t v9 = (uint64_t)a2 + v7;
    *(void *)(a1 + 24) = a2[3];
    *(void *)(a1 + 32) = v6;
    uint64_t v10 = sub_257321578();
    uint64_t v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v11(v8, v9, v10);
  }
  return v3;
}

uint64_t destroy for NHOSmartStackLastAction(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 28);
  uint64_t v5 = sub_257321578();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);

  return v6(v4, v5);
}

uint64_t initializeWithCopy for NHOSmartStackLastAction(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  uint64_t v5 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v5;
  uint64_t v6 = *(int *)(a3 + 28);
  uint64_t v7 = a1 + v6;
  uint64_t v8 = a2 + v6;
  uint64_t v9 = sub_257321578();
  uint64_t v10 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v10(v7, v8, v9);
  return a1;
}

uint64_t assignWithCopy for NHOSmartStackLastAction(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(int *)(a3 + 28);
  uint64_t v7 = a1 + v6;
  uint64_t v8 = a2 + v6;
  uint64_t v9 = sub_257321578();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  return a1;
}

uint64_t initializeWithTake for NHOSmartStackLastAction(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  uint64_t v4 = *(int *)(a3 + 28);
  uint64_t v5 = a1 + v4;
  uint64_t v6 = a2 + v4;
  uint64_t v7 = sub_257321578();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 32))(v5, v6, v7);
  return a1;
}

uint64_t assignWithTake for NHOSmartStackLastAction(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v6;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  uint64_t v7 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v7;
  swift_bridgeObjectRelease();
  uint64_t v8 = *(int *)(a3 + 28);
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  uint64_t v11 = sub_257321578();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 40))(v9, v10, v11);
  return a1;
}

uint64_t getEnumTagSinglePayload for NHOSmartStackLastAction(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_2572FD364);
}

uint64_t sub_2572FD364(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = sub_257321578();
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 28);
    return v9(v11, a2, v10);
  }
}

uint64_t storeEnumTagSinglePayload for NHOSmartStackLastAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_2572FD428);
}

uint64_t sub_2572FD428(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_257321578();
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 28);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t sub_2572FD4D0()
{
  uint64_t result = sub_257321578();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_2572FD574(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_2573215A8();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_2572FD5B8(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_2572FD614(uint64_t a1)
{
  return a1;
}

uint64_t __swift_destroy_boxed_opaque_existential_0(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_2572FD6B8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

BOOL static NHOWidgetFamilyUtilties.NHOWidgetFamily.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t NHOWidgetFamilyUtilties.NHOWidgetFamily.hash(into:)()
{
  return sub_257321C58();
}

uint64_t NHOWidgetFamilyUtilties.NHOWidgetFamily.hashValue.getter()
{
  return sub_257321C68();
}

BOOL sub_2572FD7A0(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_2572FD7B4()
{
  return sub_257321C68();
}

uint64_t sub_2572FD7FC()
{
  return sub_257321C58();
}

uint64_t sub_2572FD828()
{
  return sub_257321C68();
}

void *sub_2572FD86C(uint64_t a1, unint64_t a2)
{
  if (a1 == 0x656D6F486F6E614ELL && a2 == 0xEE00746567646957 || (sub_257321C18() & 1) != 0) {
    return &unk_27064A560;
  }
  if (a1 == 0xD000000000000031 && a2 == 0x8000000257323E30 || (sub_257321C18() & 1) != 0)
  {
    return (void *)sub_2572FDCA4((uint64_t)&unk_27064A588);
  }
  else if (a1 == 0xD000000000000029 && a2 == 0x8000000257323E70 || (sub_257321C18() & 1) != 0)
  {
    return &unk_27064A5B0;
  }
  else if (a1 == 0xD000000000000029 && a2 == 0x8000000257323EA0 || (sub_257321C18() & 1) != 0)
  {
    return &unk_27064A5D8;
  }
  else if (a1 == 0xD00000000000002CLL && a2 == 0x8000000257323ED0 || (sub_257321C18() & 1) != 0)
  {
    return &unk_27064A600;
  }
  else if (a1 == 0xD000000000000026 && a2 == 0x8000000257323F00 || (sub_257321C18() & 1) != 0)
  {
    return &unk_27064A628;
  }
  else if (a1 == 0xD000000000000027 && a2 == 0x8000000257323F30 || (sub_257321C18() & 1) != 0)
  {
    return &unk_27064A650;
  }
  else
  {
    if (qword_269FE52B8 != -1) {
      swift_once();
    }
    uint64_t v5 = sub_257321708();
    __swift_project_value_buffer(v5, (uint64_t)qword_269FE5518);
    swift_bridgeObjectRetain_n();
    uint64_t v6 = sub_2573216E8();
    os_log_type_t v7 = sub_2573219D8();
    if (os_log_type_enabled(v6, v7))
    {
      uint64_t v8 = (uint8_t *)swift_slowAlloc();
      uint64_t v9 = swift_slowAlloc();
      uint64_t v10 = v9;
      *(_DWORD *)uint64_t v8 = 136315138;
      swift_bridgeObjectRetain();
      sub_2572FB6C4(a1, a2, &v10);
      sub_257321A68();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_2572F7000, v6, v7, "Unknown and unhandled widget kind: %s", v8, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x25A2B3D30](v9, -1, -1);
      MEMORY[0x25A2B3D30](v8, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    return (void *)MEMORY[0x263F8EE78];
  }
}

uint64_t NHOWidgetFamilyUtilties.deinit()
{
  return v0;
}

uint64_t NHOWidgetFamilyUtilties.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t sub_2572FDCA4(uint64_t a1)
{
  uint64_t v2 = sub_257321618();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v6 = objc_msgSend(self, sel_currentLocale);
  sub_2573215C8();

  os_log_type_t v7 = (void *)sub_2573215B8();
  id v8 = objc_msgSend(v7, sel_countryCode);

  if (!v8) {
    goto LABEL_7;
  }
  uint64_t v9 = sub_2573217F8();
  uint64_t v11 = v10;

  if (v9 == 21333 && v11 == 0xE200000000000000)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    char v13 = sub_257321C18();
    swift_bridgeObjectRelease();
    if ((v13 & 1) == 0)
    {
LABEL_7:
      if (qword_269FE52B8 != -1) {
        swift_once();
      }
      uint64_t v14 = sub_257321708();
      __swift_project_value_buffer(v14, (uint64_t)qword_269FE5518);
      unint64_t v15 = sub_2573216E8();
      os_log_type_t v16 = sub_2573219C8();
      if (os_log_type_enabled(v15, v16))
      {
        uint64_t v17 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v17 = 0;
        _os_log_impl(&dword_2572F7000, v15, v16, "widget Locale requirements not met", v17, 2u);
        MEMORY[0x25A2B3D30](v17, -1, -1);
      }

      (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
      return MEMORY[0x263F8EE78];
    }
  }
  if (qword_269FE52B8 != -1) {
    swift_once();
  }
  uint64_t v18 = sub_257321708();
  __swift_project_value_buffer(v18, (uint64_t)qword_269FE5518);
  uint64_t v19 = sub_2573216E8();
  os_log_type_t v20 = sub_2573219C8();
  if (os_log_type_enabled(v19, v20))
  {
    uint64_t v21 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v21 = 0;
    _os_log_impl(&dword_2572F7000, v19, v20, "widget Locale requirements met", v21, 2u);
    MEMORY[0x25A2B3D30](v21, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  swift_bridgeObjectRetain();
  return a1;
}

unint64_t sub_2572FDFC0()
{
  unint64_t result = qword_269FE5398;
  if (!qword_269FE5398)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269FE5398);
  }
  return result;
}

uint64_t type metadata accessor for NHOWidgetFamilyUtilties()
{
  return self;
}

uint64_t method lookup function for NHOWidgetFamilyUtilties(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for NHOWidgetFamilyUtilties);
}

uint64_t dispatch thunk of static NHOWidgetFamilyUtilties.supportedWidgetFamilies(forKind:)()
{
  return (*(uint64_t (**)(void))(v0 + 80))();
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for NHOWidgetFamilyUtilties.NHOWidgetFamily(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFD) {
    goto LABEL_17;
  }
  if (a2 + 3 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 3) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 3;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 3;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 3;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 4;
  int v8 = v6 - 4;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for NHOWidgetFamilyUtilties.NHOWidgetFamily(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *unint64_t result = a2 + 3;
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
        JUMPOUT(0x2572FE1D0);
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
          *unint64_t result = a2 + 3;
        break;
    }
  }
  return result;
}

uint64_t sub_2572FE1F8(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_2572FE200(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for NHOWidgetFamilyUtilties.NHOWidgetFamily()
{
  return &type metadata for NHOWidgetFamilyUtilties.NHOWidgetFamily;
}

uint64_t HMServiceGroup.widgetSupportedServiceKind()@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_257321688();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = MEMORY[0x270FA5388](v3);
  BOOL v7 = (char *)&v157 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = MEMORY[0x270FA5388](v5);
  uint64_t v10 = (char *)&v157 - v9;
  uint64_t v11 = MEMORY[0x270FA5388](v8);
  char v13 = (char *)&v157 - v12;
  uint64_t v14 = MEMORY[0x270FA5388](v11);
  os_log_type_t v16 = (char *)&v157 - v15;
  uint64_t v17 = MEMORY[0x270FA5388](v14);
  v187 = (char *)&v157 - v18;
  uint64_t v19 = MEMORY[0x270FA5388](v17);
  v191 = (char *)&v157 - v20;
  MEMORY[0x270FA5388](v19);
  v196 = (char *)&v157 - v21;
  uint64_t v22 = *(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v4 + 56);
  uint64_t v163 = v4 + 56;
  v164 = v22;
  v22(a1, 1, 1, v3);
  id v188 = v1;
  id v23 = objc_msgSend(v1, sel_services);
  sub_2573001D4(0, &qword_269FE53A0);
  unint64_t v24 = sub_2573218D8();

  unint64_t v26 = v24;
  unint64_t v189 = v24;
  if (v24 >> 62) {
    goto LABEL_47;
  }
  uint64_t v27 = *(void *)((v24 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (v27)
  {
    v159 = v16;
    v157 = v10;
    v160 = v13;
    v158 = v7;
    uint64_t v161 = a1;
    uint64_t v166 = 0;
    unint64_t v185 = v26 & 0xC000000000000001;
    v178 = (char *)&v198;
    v186 = (char **)(v4 + 16);
    v184 = (uint64_t (**)(char *, uint64_t))(v4 + 88);
    int v183 = *MEMORY[0x263F481F0];
    int v181 = *MEMORY[0x263F48138];
    int v180 = *MEMORY[0x263F482B0];
    int v179 = *MEMORY[0x263F480B0];
    int v177 = *MEMORY[0x263F48248];
    int v175 = *MEMORY[0x263F48260];
    os_log_type_t v16 = (char *)(v4 + 8);
    uint64_t v162 = v4;
    v170 = (void (**)(char *, void, uint64_t))(v4 + 104);
    a1 = 4;
    unint64_t v167 = (unint64_t)"tents23NHOWidgetFamilyUtilties";
    unint64_t v169 = 0x8000000257323F90;
    unsigned int v190 = *MEMORY[0x263F48018];
    uint64_t v168 = MEMORY[0x263F8EE58] + 8;
    int v173 = *MEMORY[0x263F480F0];
    *(void *)&long long v25 = 136315906;
    long long v172 = v25;
    *(void *)&long long v25 = 136315650;
    long long v165 = v25;
    int v171 = *MEMORY[0x263F480F8];
    uint64_t v192 = v3;
    v182 = (char *)(v4 + 8);
    uint64_t v176 = v27;
    while (1)
    {
      uint64_t v4 = a1 - 4;
      id v28 = v185 ? (id)MEMORY[0x25A2B3680](a1 - 4, v26) : *(id *)(v26 + 8 * a1);
      uint64_t v29 = v28;
      uint64_t v3 = a1 - 3;
      if (__OFADD__(v4, 1)) {
        break;
      }
      if (qword_269FE52D8 != -1) {
        swift_once();
      }
      uint64_t v30 = sub_257321708();
      uint64_t v31 = __swift_project_value_buffer(v30, (uint64_t)qword_269FE5578);
      id v32 = v29;
      id v33 = v188;
      id v34 = v32;
      id v35 = v33;
      uint64_t v36 = sub_2573216E8();
      os_log_type_t v37 = sub_2573219B8();
      BOOL v38 = os_log_type_enabled(v36, v37);
      uint64_t v193 = a1 - 3;
      os_log_t v194 = (os_log_t)a1;
      v195 = (void (*)(void, void))v31;
      if (v38)
      {
        uint64_t v39 = v35;
        uint64_t v40 = swift_slowAlloc();
        v174 = (void (*)(void, void))swift_slowAlloc();
        v199[0] = (uint64_t)v174;
        *(_DWORD *)uint64_t v40 = v172;
        uint64_t v197 = sub_2572FB6C4(0xD00000000000001CLL, v169, v199);
        sub_257321A68();
        *(_WORD *)(v40 + 12) = 2080;
        id v41 = objc_msgSend(v34, sel_name);
        uint64_t v42 = sub_2573217F8();
        unint64_t v44 = v43;

        uint64_t v197 = sub_2572FB6C4(v42, v44, v199);
        sub_257321A68();

        swift_bridgeObjectRelease();
        *(_WORD *)(v40 + 22) = 2080;
        id v45 = objc_msgSend(v34, sel_serviceType);
        uint64_t v46 = sub_2573217F8();
        unint64_t v48 = v47;

        uint64_t v197 = sub_2572FB6C4(v46, v48, v199);
        sub_257321A68();

        swift_bridgeObjectRelease();
        *(_WORD *)(v40 + 32) = 2080;
        id v49 = objc_msgSend(v39, sel_name);
        uint64_t v50 = sub_2573217F8();
        unint64_t v52 = v51;

        os_log_type_t v16 = v182;
        uint64_t v197 = sub_2572FB6C4(v50, v52, v199);
        sub_257321A68();

        v53 = v39;
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_2572F7000, v36, v37, "%s: Checking service %s of type %s for accessory %s", (uint8_t *)v40, 0x2Au);
        uint64_t v54 = v174;
        swift_arrayDestroy();
        MEMORY[0x25A2B3D30](v54, -1, -1);
        MEMORY[0x25A2B3D30](v40, -1, -1);
      }
      else
      {

        v53 = v35;
      }
      uint64_t v55 = v196;
      sub_257321A28();
      char v13 = *v186;
      uint64_t v56 = v191;
      double v57 = v55;
      uint64_t v58 = v192;
      ((void (*)(char *, char *, uint64_t))*v186)(v191, v57, v192);
      int v59 = (*v184)(v56, v58);
      if (v59 == v183
        || v59 == v181
        || v59 == v180
        || v59 == v179
        || v59 == v177
        || v59 == v175
        || v59 == v190
        || v59 == v173
        || v59 == v171)
      {
        (*v170)(v187, v190, v58);
        sub_25730017C();
        sub_2573218B8();
        sub_2573218B8();
        if (v199[0] == v197 && v199[1] == v198) {
          char v80 = 1;
        }
        else {
          char v80 = sub_257321C18();
        }
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t v81 = *(void (**)(void, void))v16;
        (*(void (**)(char *, uint64_t))v16)(v187, v58);
        if (v80)
        {
          v174 = v81;
          swift_bridgeObjectRelease();
          v106 = v159;
          v107 = v196;
          ((void (*)(char *, char *, uint64_t))v13)(v159, v196, v58);
          v108 = v160;
          ((void (*)(char *, char *, uint64_t))v13)(v160, v107, v58);
          id v109 = v53;
          v110 = sub_2573216E8();
          os_log_type_t v111 = sub_2573219B8();
          int v112 = v111;
          if (os_log_type_enabled(v110, v111))
          {
            uint64_t v113 = swift_slowAlloc();
            v195 = (void (*)(void, void))swift_slowAlloc();
            v199[0] = (uint64_t)v195;
            *(_DWORD *)uint64_t v113 = v172;
            os_log_t v194 = v110;
            uint64_t v197 = sub_2572FB6C4(0xD00000000000001CLL, v167 | 0x8000000000000000, v199);
            sub_257321A68();
            *(_WORD *)(v113 + 12) = 2080;
            LODWORD(v193) = v112;
            uint64_t v114 = ServiceKind.debugDescription.getter();
            uint64_t v197 = sub_2572FB6C4(v114, v115, v199);
            sub_257321A68();
            swift_bridgeObjectRelease();
            v116 = v106;
            v117 = (void (*)(char *, uint64_t))v174;
            v174(v116, v58);
            *(_WORD *)(v113 + 22) = 2080;
            uint64_t v118 = sub_257321678();
            uint64_t v197 = sub_2572FB6C4(v118, v119, v199);
            sub_257321A68();
            swift_bridgeObjectRelease();
            v117(v108, v58);
            *(_WORD *)(v113 + 32) = 2080;
            id v120 = objc_msgSend(v109, sel_name);
            uint64_t v121 = sub_2573217F8();
            unint64_t v123 = v122;

            uint64_t v197 = sub_2572FB6C4(v121, v123, v199);
            sub_257321A68();

            swift_bridgeObjectRelease();
            os_log_t v124 = v194;
            _os_log_impl(&dword_2572F7000, v194, (os_log_type_t)v193, "%s: Found supported service kind %s(%s) for serviceGroup %s", (uint8_t *)v113, 0x2Au);
            v125 = v195;
            swift_arrayDestroy();
            MEMORY[0x25A2B3D30](v125, -1, -1);
            MEMORY[0x25A2B3D30](v113, -1, -1);
          }
          else
          {

            v153 = (void (*)(char *, uint64_t))v174;
            v174(v108, v58);
            v153(v106, v58);
          }
          goto LABEL_45;
        }
        HMService.primaryControlCharacteristicType.getter();
        if (v82)
        {
          uint64_t v83 = (void *)sub_2573217E8();
          swift_bridgeObjectRelease();
          id v84 = objc_msgSend(v34, sel_hf_characteristicOfType_, v83);

          if (v84) {
            goto LABEL_41;
          }
        }
        else
        {
          id v85 = objc_msgSend(v34, sel_characteristics);
          sub_2573001D4(0, &qword_269FE53B0);
          unint64_t v86 = sub_2573218D8();

          id v87 = v34;
          uint64_t v88 = v166;
          v89 = sub_257300210(v86);
          uint64_t v166 = v88;
          uint64_t v58 = v192;
          swift_bridgeObjectRelease();

          if (v89)
          {
LABEL_41:
            v174 = v81;
            swift_bridgeObjectRelease();
            v126 = v157;
            v127 = v196;
            ((void (*)(char *, char *, uint64_t))v13)(v157, v196, v58);
            v128 = v158;
            ((void (*)(char *, char *, uint64_t))v13)(v158, v127, v58);
            id v129 = v34;
            id v130 = v53;
            id v131 = v129;
            id v132 = v130;
            v133 = sub_2573216E8();
            os_log_type_t v134 = sub_2573219B8();
            int v135 = v134;
            if (os_log_type_enabled(v133, v134))
            {
              uint64_t v136 = swift_slowAlloc();
              v195 = (void (*)(void, void))swift_slowAlloc();
              v199[0] = (uint64_t)v195;
              *(_DWORD *)uint64_t v136 = 136316162;
              os_log_t v194 = v133;
              uint64_t v197 = sub_2572FB6C4(0xD00000000000001CLL, v167 | 0x8000000000000000, v199);
              sub_257321A68();
              *(_WORD *)(v136 + 12) = 2080;
              LODWORD(v193) = v135;
              uint64_t v137 = ServiceKind.debugDescription.getter();
              uint64_t v197 = sub_2572FB6C4(v137, v138, v199);
              sub_257321A68();
              swift_bridgeObjectRelease();
              v139 = v126;
              v140 = (void (*)(char *, uint64_t))v174;
              v174(v139, v58);
              *(_WORD *)(v136 + 22) = 2080;
              uint64_t v141 = sub_257321678();
              uint64_t v197 = sub_2572FB6C4(v141, v142, v199);
              sub_257321A68();
              swift_bridgeObjectRelease();
              v140(v128, v58);
              *(_WORD *)(v136 + 32) = 2080;
              id v143 = objc_msgSend(v131, sel_name);
              uint64_t v144 = sub_2573217F8();
              unint64_t v146 = v145;

              uint64_t v197 = sub_2572FB6C4(v144, v146, v199);
              sub_257321A68();

              swift_bridgeObjectRelease();
              *(_WORD *)(v136 + 42) = 2080;
              id v147 = objc_msgSend(v132, sel_name);
              uint64_t v148 = sub_2573217F8();
              unint64_t v150 = v149;

              uint64_t v197 = sub_2572FB6C4(v148, v150, v199);
              sub_257321A68();

              swift_bridgeObjectRelease();
              os_log_t v151 = v194;
              _os_log_impl(&dword_2572F7000, v194, (os_log_type_t)v193, "%s: Found supported service kind %s(%s) having a primary control characteristic with service %s for serviceGroup %s", (uint8_t *)v136, 0x34u);
              v152 = v195;
              swift_arrayDestroy();
              MEMORY[0x25A2B3D30](v152, -1, -1);
              MEMORY[0x25A2B3D30](v136, -1, -1);
            }
            else
            {

              v154 = (void (*)(char *, uint64_t))v174;
              v174(v128, v58);
              v154(v126, v58);
            }
LABEL_45:
            uint64_t v155 = v161;
            sub_2573005E4(v161);
            (*(void (**)(uint64_t, char *, uint64_t))(v162 + 32))(v155, v196, v58);
            return v164(v155, 0, 1, v58);
          }
        }
        id v90 = v34;
        id v91 = v53;
        id v92 = v90;
        BOOL v7 = (char *)v91;
        v93 = sub_2573216E8();
        os_log_type_t v94 = sub_2573219B8();
        uint64_t v10 = (char *)v94;
        if (os_log_type_enabled(v93, v94))
        {
          char v13 = (char *)swift_slowAlloc();
          v195 = (void (*)(void, void))swift_slowAlloc();
          v199[0] = (uint64_t)v195;
          *(_DWORD *)char v13 = v165;
          uint64_t v197 = sub_2572FB6C4(0xD00000000000001CLL, v167 | 0x8000000000000000, v199);
          sub_257321A68();
          *((_WORD *)v13 + 6) = 2080;
          id v95 = objc_msgSend(v92, sel_name);
          uint64_t v96 = sub_2573217F8();
          v174 = v81;
          uint64_t v97 = v96;
          unint64_t v99 = v98;

          uint64_t v197 = sub_2572FB6C4(v97, v99, v199);
          sub_257321A68();

          swift_bridgeObjectRelease();
          *((_WORD *)v13 + 11) = 2080;
          id v100 = objc_msgSend(v7, sel_name);
          uint64_t v101 = sub_2573217F8();
          unint64_t v103 = v102;

          os_log_type_t v16 = v182;
          uint64_t v197 = sub_2572FB6C4(v101, v103, v199);
          sub_257321A68();

          swift_bridgeObjectRelease();
          _os_log_impl(&dword_2572F7000, v93, (os_log_type_t)v10, "%s: Did not find primary control characteristic for service %s for serviceGroup %s, continuing to next service", (uint8_t *)v13, 0x20u);
          v104 = v195;
          swift_arrayDestroy();
          uint64_t v105 = v192;
          MEMORY[0x25A2B3D30](v104, -1, -1);
          MEMORY[0x25A2B3D30](v13, -1, -1);

          v174(v196, v105);
        }
        else
        {

          v81(v196, v58);
        }
      }
      else
      {
        BOOL v7 = *(char **)v16;
        (*(void (**)(char *, uint64_t))v16)(v191, v58);
        id v60 = v34;
        id v61 = v53;
        uint64_t v10 = (char *)v60;
        id v62 = v61;
        v63 = sub_2573216E8();
        os_log_type_t v64 = sub_2573219B8();
        if (os_log_type_enabled(v63, v64))
        {
          uint64_t v65 = swift_slowAlloc();
          v174 = (void (*)(void, void))swift_slowAlloc();
          v199[0] = (uint64_t)v174;
          *(_DWORD *)uint64_t v65 = v172;
          uint64_t v197 = sub_2572FB6C4(0xD00000000000001CLL, v167 | 0x8000000000000000, v199);
          v195 = (void (*)(void, void))v7;
          BOOL v7 = v178;
          sub_257321A68();
          *(_WORD *)(v65 + 12) = 2080;
          id v66 = objc_msgSend(v10, sel_serviceType);
          uint64_t v67 = sub_2573217F8();
          unint64_t v69 = v68;

          uint64_t v197 = sub_2572FB6C4(v67, v69, v199);
          sub_257321A68();

          swift_bridgeObjectRelease();
          *(_WORD *)(v65 + 22) = 2080;
          id v70 = objc_msgSend(v10, sel_name);
          uint64_t v71 = sub_2573217F8();
          unint64_t v73 = v72;

          uint64_t v197 = sub_2572FB6C4(v71, v73, v199);
          sub_257321A68();

          swift_bridgeObjectRelease();
          *(_WORD *)(v65 + 32) = 2080;
          id v74 = objc_msgSend(v62, sel_name);
          char v13 = (char *)sub_2573217F8();
          unint64_t v76 = v75;

          uint64_t v77 = v192;
          uint64_t v197 = sub_2572FB6C4((uint64_t)v13, v76, v199);
          sub_257321A68();

          swift_bridgeObjectRelease();
          _os_log_impl(&dword_2572F7000, v63, v64, "%s: ServiceType %s for service %s for serviceGroup %s is not supported.", (uint8_t *)v65, 0x2Au);
          uint64_t v78 = v174;
          swift_arrayDestroy();
          MEMORY[0x25A2B3D30](v78, -1, -1);
          uint64_t v79 = v65;
          os_log_type_t v16 = v182;
          MEMORY[0x25A2B3D30](v79, -1, -1);

          v195(v196, v77);
        }
        else
        {

          ((void (*)(char *, uint64_t))v7)(v196, v58);
        }
      }
      a1 = (uint64_t)&v194->isa + 1;
      unint64_t v26 = v189;
      if (v193 == v176) {
        return swift_bridgeObjectRelease();
      }
    }
    __break(1u);
LABEL_47:
    swift_bridgeObjectRetain();
    unint64_t v26 = v189;
    uint64_t v27 = sub_257321BA8();
    swift_bridgeObjectRelease();
  }

  return swift_bridgeObjectRelease();
}

HMService_optional __swiftcall HMServiceGroup.serviceWithPrimaryControlCharacteristic()()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_257321688();
  uint64_t v3 = *(char **)(v2 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  uint64_t v6 = (char *)&v44 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = MEMORY[0x270FA5388](v4);
  uint64_t v9 = (char *)&v44 - v8;
  uint64_t v10 = MEMORY[0x270FA5388](v7);
  uint64_t v12 = (char *)&v44 - v11;
  MEMORY[0x270FA5388](v10);
  unint64_t v73 = (char *)&v44 - v13;
  id v14 = objc_msgSend(v1, sel_services);
  sub_2573001D4(0, &qword_269FE53A0);
  unint64_t v15 = sub_2573218D8();

  if (v15 >> 62) {
    goto LABEL_58;
  }
  uint64_t v16 = *(void *)((v15 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (v16)
  {
    uint64_t v58 = v12;
    uint64_t v17 = 0;
    unint64_t v70 = v15 & 0xC000000000000001;
    int v72 = *MEMORY[0x263F481F0];
    uint64_t v64 = v15 & 0xFFFFFFFFFFFFFF8;
    unint64_t v67 = v15;
    unint64_t v63 = v15 + 32;
    uint64_t v71 = (uint64_t (**)(char *, uint64_t))(v3 + 88);
    int v66 = *MEMORY[0x263F48138];
    int v62 = *MEMORY[0x263F482B0];
    int v61 = *MEMORY[0x263F480B0];
    int v59 = *MEMORY[0x263F48248];
    int v57 = *MEMORY[0x263F48260];
    int v56 = *MEMORY[0x263F480F0];
    int v54 = *MEMORY[0x263F480F8];
    unint64_t v15 = (unint64_t)(v3 + 8);
    uint64_t v53 = *MEMORY[0x263F0C520];
    uint64_t v55 = *MEMORY[0x263F0BEF8];
    uint64_t v74 = *MEMORY[0x263F0C328];
    unint64_t v69 = (void (**)(char *, void, uint64_t))(v3 + 104);
    uint64_t v60 = *MEMORY[0x263F0C510];
    uint64_t v65 = *MEMORY[0x263F0C4A8];
    unsigned int v68 = *MEMORY[0x263F48018];
    while (1)
    {
      if (v70)
      {
        id v18 = (id)MEMORY[0x25A2B3680](v17, v67);
      }
      else
      {
        if ((unint64_t)v17 >= *(void *)(v64 + 16)) {
          goto LABEL_57;
        }
        id v18 = *(id *)(v63 + 8 * (void)v17);
      }
      uint64_t v19 = v18;
      if (__OFADD__(v17++, 1)) {
        break;
      }
      uint64_t v12 = (char *)v16;
      uint64_t v21 = v73;
      sub_257321A28();
      uint64_t v22 = *v71;
      int v23 = (*v71)(v21, v2);
      if (v23 == v72 || v23 == v66 || v23 == v62 || v23 == v61 || v23 == v59 || v23 == v57 || v23 == v56 || v23 == v54)
      {
        sub_2573217F8();
        uint64_t v40 = (void *)sub_2573217E8();
        swift_bridgeObjectRelease();
        id v41 = objc_msgSend(v19, sel_hf_characteristicOfType_, v40);

        if (v41) {
          goto LABEL_53;
        }
      }
      else
      {
        unint64_t v44 = *(char **)v15;
        ((void (*)(char *, uint64_t))v44)(v73, v2);
        id v24 = objc_msgSend(v19, sel_characteristics);
        sub_2573001D4(0, &qword_269FE53B0);
        unint64_t v25 = sub_2573218D8();

        unint64_t v47 = v25;
        if (v25 >> 62)
        {
          swift_bridgeObjectRetain_n();
          uint64_t v26 = sub_257321BA8();
          swift_bridgeObjectRelease();
        }
        else
        {
          uint64_t v26 = *(void *)((v25 & 0xFFFFFFFFFFFFFF8) + 0x10);
          swift_bridgeObjectRetain();
        }
        unint64_t v27 = v47;
        if (v26)
        {
          unint64_t v46 = v47 & 0xC000000000000001;
          uint64_t v28 = 4;
          uint64_t v45 = v26;
          do
          {
            uint64_t v29 = v28 - 4;
            uint64_t v49 = v28;
            if (v46)
            {
              id v30 = (id)MEMORY[0x25A2B3680](v28 - 4, v27);
              uint64_t v32 = v29 + 1;
              if (__OFADD__(v29, 1)) {
                goto LABEL_61;
              }
            }
            else
            {
              id v30 = *(id *)(v27 + 8 * v28);
              uint64_t v32 = v29 + 1;
              if (__OFADD__(v29, 1))
              {
LABEL_61:
                __break(1u);
                goto LABEL_62;
              }
            }
            uint64_t v48 = v32;
            id v52 = v30;
            id v33 = objc_msgSend(v30, sel_characteristicType);
            uint64_t v50 = sub_2573217F8();
            uint64_t v51 = v34;

            id v35 = v58;
            sub_257321A28();
            int v36 = v22(v35, v2);
            if (v36 == v72
              || v36 == v66
              || v36 == v62
              || v36 == v61
              || v36 == v59
              || v36 == v57
              || v36 == v56
              || v36 == v54)
            {
              if (v50 == sub_2573217F8() && v51 == v37)
              {
                swift_bridgeObjectRelease_n();
LABEL_55:
                swift_bridgeObjectRelease_n();
                swift_bridgeObjectRelease();

                goto LABEL_60;
              }
              char v39 = sub_257321C18();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              if (v39) {
                goto LABEL_55;
              }
            }
            else
            {
              ((void (*)(char *, uint64_t))v44)(v58, v2);

              swift_bridgeObjectRelease();
            }
            uint64_t v28 = v49 + 1;
            unint64_t v27 = v47;
          }
          while (v48 != v45);
        }
        swift_bridgeObjectRelease_n();
      }
      sub_257321A28();
      (*v69)(v6, v68, v2);
      sub_25730017C();
      sub_2573218B8();
      sub_2573218B8();
      if (v77 == v75 && v78 == v76)
      {
        swift_bridgeObjectRelease_n();
        unint64_t v43 = *(char **)v15;
        (*(void (**)(char *, uint64_t))v15)(v6, v2);
        ((void (*)(char *, uint64_t))v43)(v9, v2);
LABEL_53:
        swift_bridgeObjectRelease();
        goto LABEL_60;
      }
      char v42 = sub_257321C18();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v3 = *(char **)v15;
      (*(void (**)(char *, uint64_t))v15)(v6, v2);
      ((void (*)(char *, uint64_t))v3)(v9, v2);
      if (v42) {
        goto LABEL_53;
      }

      uint64_t v16 = (uint64_t)v12;
      if (v17 == v12) {
        goto LABEL_59;
      }
    }
    __break(1u);
LABEL_57:
    __break(1u);
LABEL_58:
    swift_bridgeObjectRetain();
    uint64_t v16 = sub_257321BA8();
    swift_bridgeObjectRelease();
  }
LABEL_59:
  swift_bridgeObjectRelease();
  uint64_t v19 = 0;
LABEL_60:
  id v30 = v19;
LABEL_62:
  result.value.super.isa = (Class)v30;
  result.is_nil = v31;
  return result;
}

HMService_optional __swiftcall HMServiceGroup.primaryService()()
{
  id v1 = objc_msgSend(v0, sel_services);
  sub_2573001D4(0, &qword_269FE53A0);
  unint64_t v2 = sub_2573218D8();

  if (v2 >> 62) {
    goto LABEL_14;
  }
  uint64_t v3 = *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (v3)
  {
    uint64_t v4 = 4;
    while (1)
    {
      id v5 = (v2 & 0xC000000000000001) != 0 ? (id)MEMORY[0x25A2B3680](v4 - 4, v2) : *(id *)(v2 + 8 * v4);
      uint64_t v6 = v5;
      uint64_t v7 = v4 - 3;
      if (__OFADD__(v4 - 4, 1)) {
        break;
      }
      if (objc_msgSend(v5, sel_isPrimaryService))
      {
        swift_bridgeObjectRelease();
        goto LABEL_12;
      }

      ++v4;
      if (v7 == v3) {
        goto LABEL_10;
      }
    }
    __break(1u);
LABEL_14:
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_257321BA8();
    swift_bridgeObjectRelease();
  }
LABEL_10:
  swift_bridgeObjectRelease();
  uint64_t v6 = 0;
LABEL_12:
  uint64_t v9 = (objc_class *)v6;
  result.value.super.isa = v9;
  result.is_nil = v8;
  return result;
}

unint64_t sub_25730017C()
{
  unint64_t result = qword_269FE53A8;
  if (!qword_269FE53A8)
  {
    sub_257321688();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269FE53A8);
  }
  return result;
}

uint64_t sub_2573001D4(uint64_t a1, unint64_t *a2)
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

char *sub_257300210(unint64_t a1)
{
  unint64_t v2 = v1;
  uint64_t v37 = sub_257321688();
  uint64_t v4 = *(char **)(v37 - 8);
  MEMORY[0x270FA5388](v37);
  int v36 = (char *)&v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1 >> 62) {
    goto LABEL_28;
  }
  uint64_t v6 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v6; uint64_t v6 = sub_257321BA8())
  {
    unint64_t v27 = v2;
    uint64_t v34 = (uint64_t (**)(char *, uint64_t))(v4 + 88);
    unint64_t v35 = a1 & 0xC000000000000001;
    int v33 = *MEMORY[0x263F481F0];
    int v32 = *MEMORY[0x263F48138];
    int v30 = *MEMORY[0x263F482B0];
    int v29 = *MEMORY[0x263F480B0];
    int v26 = *MEMORY[0x263F48248];
    int v25 = *MEMORY[0x263F48260];
    int v24 = *MEMORY[0x263F480F0];
    int v22 = *MEMORY[0x263F480F8];
    uint64_t v20 = (void (**)(char *, uint64_t))(v4 + 8);
    uint64_t v21 = *MEMORY[0x263F0C520];
    uint64_t v23 = *MEMORY[0x263F0BEF8];
    uint64_t v38 = *MEMORY[0x263F0C328];
    uint64_t v28 = *MEMORY[0x263F0C510];
    uint64_t v7 = 4;
    uint64_t v31 = *MEMORY[0x263F0C4A8];
    while (1)
    {
      Swift::Bool v8 = v35 ? (char *)MEMORY[0x25A2B3680](v7 - 4, a1) : (char *)*(id *)(a1 + 8 * v7);
      uint64_t v4 = v8;
      uint64_t v9 = v7 - 3;
      if (__OFADD__(v7 - 4, 1)) {
        break;
      }
      id v10 = objc_msgSend(v8, sel_characteristicType);
      uint64_t v11 = sub_2573217F8();
      uint64_t v13 = v12;

      unint64_t v2 = v36;
      sub_257321A28();
      int v14 = (*v34)(v2, v37);
      if (v14 == v33 || v14 == v32 || v14 == v30 || v14 == v29 || v14 == v26 || v14 == v25 || v14 == v24 || v14 == v22)
      {
        if (v11 == sub_2573217F8() && v13 == v15)
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
LABEL_26:
          swift_bridgeObjectRelease();
          return v4;
        }
        unint64_t v2 = v15;
        char v17 = sub_257321C18();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if (v17) {
          goto LABEL_26;
        }
      }
      else
      {
        (*v20)(v36, v37);

        swift_bridgeObjectRelease();
      }
      ++v7;
      if (v9 == v6) {
        goto LABEL_29;
      }
    }
    __break(1u);
LABEL_28:
    swift_bridgeObjectRetain();
  }
LABEL_29:
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t sub_2573005E4(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269FE53B8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t static EnergyForecastIntent.intentClassName.getter()
{
  return 0xD000000000000013;
}

uint64_t sub_257300660()
{
  uint64_t v0 = sub_2573214C8();
  __swift_allocate_value_buffer(v0, qword_269FE53C0);
  __swift_project_value_buffer(v0, (uint64_t)qword_269FE53C0);
  return sub_2573214B8();
}

uint64_t static EnergyForecastIntent.title.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_25730085C(&qword_269FE5270, MEMORY[0x263F06D40], (uint64_t)qword_269FE53C0, a1);
}

uint64_t static EnergyForecastIntent.title.setter(uint64_t a1)
{
  return sub_257300944(a1, &qword_269FE5270, MEMORY[0x263F06D40], (uint64_t)qword_269FE53C0);
}

uint64_t (*static EnergyForecastIntent.title.modify())()
{
  if (qword_269FE5270 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_2573214C8();
  __swift_project_value_buffer(v0, (uint64_t)qword_269FE53C0);
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_2573007D0()
{
  uint64_t v0 = sub_257321438();
  __swift_allocate_value_buffer(v0, qword_269FE53D8);
  __swift_project_value_buffer(v0, (uint64_t)qword_269FE53D8);
  return sub_257321428();
}

uint64_t static EnergyForecastIntent.description.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_25730085C(&qword_269FE5278, MEMORY[0x263EFBA28], (uint64_t)qword_269FE53D8, a1);
}

uint64_t sub_25730085C@<X0>(void *a1@<X0>, uint64_t (*a2)(void)@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v7 = a2(0);
  uint64_t v8 = __swift_project_value_buffer(v7, a3);
  swift_beginAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 16))(a4, v8, v7);
}

uint64_t static EnergyForecastIntent.description.setter(uint64_t a1)
{
  return sub_257300944(a1, &qword_269FE5278, MEMORY[0x263EFBA28], (uint64_t)qword_269FE53D8);
}

uint64_t sub_257300944(uint64_t a1, void *a2, uint64_t (*a3)(void), uint64_t a4)
{
  if (*a2 != -1) {
    swift_once();
  }
  uint64_t v7 = a3(0);
  uint64_t v8 = __swift_project_value_buffer(v7, a4);
  swift_beginAccess();
  uint64_t v9 = *(void *)(v7 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 24))(v8, a1, v7);
  swift_endAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v9 + 8))(a1, v7);
}

uint64_t (*static EnergyForecastIntent.description.modify())()
{
  if (qword_269FE5278 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_257321438();
  __swift_project_value_buffer(v0, (uint64_t)qword_269FE53D8);
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t EnergyForecastIntent.homeIdentifier.getter()
{
  return sub_257300C20();
}

uint64_t EnergyForecastIntent.homeIdentifier.setter()
{
  return sub_257300CF4();
}

uint64_t (*EnergyForecastIntent.homeIdentifier.modify(void *a1))()
{
  uint64_t v3 = malloc(0x30uLL);
  *a1 = v3;
  v3[4] = *(void *)(v1 + OBJC_IVAR___NHOEnergyForecastIntent__homeIdentifier);
  swift_retain();
  v3[5] = sub_2573213B8();
  return sub_257300B6C;
}

uint64_t EnergyForecastIntent.$homeIdentifier.getter()
{
  return sub_257300EB8();
}

id sub_257300B88(void *a1)
{
  id v1 = a1;
  swift_retain();
  sub_2573213C8();

  swift_release();
  if (v4)
  {
    uint64_t v2 = (void *)sub_2573217E8();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

uint64_t EnergyForecastIntent.homeName.getter()
{
  return sub_257300C20();
}

uint64_t sub_257300C20()
{
  swift_retain();
  sub_2573213C8();
  swift_release();
  return v1;
}

uint64_t sub_257300C74(void *a1, uint64_t a2, uint64_t a3)
{
  if (a3) {
    sub_2573217F8();
  }
  id v4 = a1;
  swift_retain();
  sub_2573213D8();

  return swift_release();
}

uint64_t EnergyForecastIntent.homeName.setter()
{
  return sub_257300CF4();
}

uint64_t sub_257300CF4()
{
  return swift_release();
}

double sub_257300D3C@<D0>(_OWORD *a1@<X8>)
{
  swift_retain();
  sub_2573213C8();
  swift_release();
  double result = *(double *)&v3;
  *a1 = v3;
  return result;
}

uint64_t sub_257300D90()
{
  return swift_release();
}

uint64_t (*EnergyForecastIntent.homeName.modify(void *a1))()
{
  long long v3 = malloc(0x30uLL);
  *a1 = v3;
  v3[4] = *(void *)(v1 + OBJC_IVAR___NHOEnergyForecastIntent__homeName);
  swift_retain();
  v3[5] = sub_2573213B8();
  return sub_257300B6C;
}

void sub_257300E58(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void, void))(*a1 + 40))(*a1, 0);
  swift_release();

  free(v1);
}

uint64_t EnergyForecastIntent.$homeName.getter()
{
  return sub_257300EB8();
}

uint64_t sub_257300EB8()
{
  swift_retain();
  uint64_t v0 = sub_2573213E8();
  swift_release();
  return v0;
}

id EnergyForecastIntent.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

id EnergyForecastIntent.init()()
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v30 = sub_257321468();
  uint64_t v1 = *(void *)(v30 - 8);
  MEMORY[0x270FA5388](v30);
  long long v3 = (char *)v25 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269FE5400);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)v25 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_269FE5408);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_269FE5410);
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t v12 = (char *)v25 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_2573214C8();
  uint64_t v34 = v13;
  uint64_t v14 = *(void *)(v13 - 8);
  MEMORY[0x270FA5388](v13);
  uint64_t v38 = OBJC_IVAR___NHOEnergyForecastIntent__homeIdentifier;
  uint64_t v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_269FE5418);
  char v39 = v0;
  sub_2573214B8();
  unint64_t v15 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v14 + 56);
  uint64_t v33 = v14 + 56;
  unint64_t v35 = v15;
  v15(v12, 1, 1, v13);
  uint64_t v16 = sub_2573217D8();
  uint64_t v42 = 0;
  uint64_t v43 = 0;
  uint64_t v17 = *(void *)(v16 - 8);
  uint64_t v31 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v17 + 56);
  uint64_t v32 = v17 + 56;
  v31(v9, 1, 1, v16);
  uint64_t v18 = sub_257321398();
  uint64_t v19 = *(void *)(v18 - 8);
  uint64_t v28 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v19 + 56);
  uint64_t v29 = v19 + 56;
  v28(v6, 1, 1, v18);
  unsigned int v27 = *MEMORY[0x263EFBDC8];
  uint64_t v20 = *(void (**)(void))(v1 + 104);
  v25[1] = v1 + 104;
  int v26 = (void (*)(char *, void, uint64_t))v20;
  uint64_t v21 = v30;
  v20(v3);
  *(void *)(v37 + v38) = sub_257321408();
  uint64_t v38 = OBJC_IVAR___NHOEnergyForecastIntent__homeName;
  sub_2573214B8();
  v35(v12, 1, 1, v34);
  uint64_t v42 = 0;
  uint64_t v43 = 0;
  v31(v9, 1, 1, v16);
  v28(v6, 1, 1, v18);
  v26(v3, v27, v21);
  uint64_t v22 = sub_257321408();
  uint64_t v23 = v39;
  *(void *)&v39[v38] = v22;

  v41.receiver = v23;
  v41.super_class = ObjectType;
  return objc_msgSendSuper2(&v41, sel_init);
}

id EnergyForecastIntent.__allocating_init(homeIdentifier:)()
{
  id v1 = objc_msgSend(objc_allocWithZone(v0), sel_init);
  swift_retain();
  sub_2573213D8();

  swift_release();
  return v1;
}

id EnergyForecastIntent.__allocating_init(homeIdentifier:homeName:)()
{
  id v1 = objc_msgSend(objc_allocWithZone(v0), sel_init);
  swift_retain();
  sub_2573213D8();
  swift_release();
  swift_retain();
  sub_2573213D8();

  swift_release();
  return v1;
}

id EnergyForecastIntent.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_25730152C()
{
  return sub_257301AD4(&qword_269FE5420);
}

uint64_t type metadata accessor for EnergyForecastIntent()
{
  return self;
}

unint64_t sub_2573015D0()
{
  return 0xD000000000000013;
}

uint64_t sub_2573015EC()
{
  return sub_257301AD4(&qword_269FE5428);
}

uint64_t sub_257301620()
{
  return sub_257301AD4(&qword_269FE5430);
}

unint64_t sub_257301658()
{
  unint64_t result = qword_269FE5438;
  if (!qword_269FE5438)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269FE5438);
  }
  return result;
}

uint64_t sub_2573016AC()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_257301718@<X0>(uint64_t a1@<X8>)
{
  if (qword_269FE5270 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_2573214C8();
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)qword_269FE53C0);
  swift_beginAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16))(a1, v3, v2);
}

void sub_2573017D8()
{
}

uint64_t sub_2573017E0()
{
  return MEMORY[0x270EE0D18](v0);
}

void sub_2573017E8()
{
}

uint64_t sub_2573017F0()
{
  return MEMORY[0x270EE0CD0](v0);
}

uint64_t sub_2573017F8()
{
  return MEMORY[0x270EE0CB0](v0);
}

uint64_t sub_257301800(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  uint64_t v5 = sub_257301AD4(&qword_269FE5450);
  *uint64_t v4 = v2;
  v4[1] = sub_2573018C8;
  return MEMORY[0x270EE1CC8](a2, v5);
}

uint64_t sub_2573018C8()
{
  uint64_t v2 = *v1;
  uint64_t result = swift_task_dealloc();
  if (v0)
  {
    uint64_t v4 = *(uint64_t (**)(void))(v2 + 8);
    return v4();
  }
  return result;
}

id sub_2573019D0@<X0>(void *a1@<X8>)
{
  id result = objc_msgSend(objc_allocWithZone(v1), sel_init);
  *a1 = result;
  return result;
}

void sub_257301A08()
{
  sub_257301AD4(&qword_269FE5448);

  JUMPOUT(0x25A2B2E60);
}

double sub_257301A54@<D0>(_OWORD *a1@<X8>)
{
  return sub_257300D3C(a1);
}

uint64_t sub_257301A74()
{
  return sub_257300D90();
}

double sub_257301A94@<D0>(_OWORD *a1@<X8>)
{
  return sub_257300D3C(a1);
}

uint64_t sub_257301AB4()
{
  return sub_257300D90();
}

uint64_t sub_257301AD4(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for EnergyForecastIntent();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
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

unint64_t HMActionSet.iconSymbolName.getter()
{
  id v1 = objc_msgSend(v0, sel_applicationData);
  uint64_t v2 = (void *)sub_2573217E8();
  id v3 = objc_msgSend(v1, sel_objectForKeyedSubscript_, v2);

  if (!v3 || (__swift_instantiateConcreteTypeFromMangledName(&qword_269FE5458), (swift_dynamicCast() & 1) == 0))
  {
    unint64_t v12 = 0;
    uint64_t v13 = 0;
  }
  uint64_t v4 = (void *)sub_2573217E8();
  id v5 = objc_msgSend(v1, sel_objectForKeyedSubscript_, v4);

  if (v5)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_269FE5458);
    if (swift_dynamicCast())
    {
      if (!v13 && (sub_257321898() & 1) != 0)
      {
        uint64_t v6 = (void *)sub_2573217E8();
        swift_bridgeObjectRelease();
        uint64_t v7 = HFImageIconIdentifier.symbolMapping.getter();
        uint64_t v9 = v8;

        unint64_t v12 = v7;
        uint64_t v13 = v9;
      }
      swift_bridgeObjectRelease();
    }
  }
  unint64_t v10 = sub_257301D80();

  if (v13)
  {
    unint64_t v10 = v12;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  return v10;
}

unint64_t sub_257301D80()
{
  unint64_t v0 = 0x69662E6573756F68;
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_269FE5468);
  uint64_t v2 = MEMORY[0x270FA5388](v1 - 8);
  uint64_t v4 = (char *)&v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v2);
  uint64_t v6 = (char *)&v11 - v5;
  sub_2573219A8();
  uint64_t v7 = sub_257321998();
  uint64_t v8 = *(void *)(v7 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) != 1)
  {
    sub_257302E24((uint64_t)v6, (uint64_t)v4);
    int v9 = (*(uint64_t (**)(char *, uint64_t))(v8 + 88))(v4, v7);
    if (v9 == *MEMORY[0x263F491D8])
    {
      unint64_t v0 = 0xD000000000000013;
    }
    else if (v9 == *MEMORY[0x263F491F0])
    {
      unint64_t v0 = 0xD000000000000015;
    }
    else if (v9 == *MEMORY[0x263F49210])
    {
      unint64_t v0 = 0x2E78616D2E6E7573;
    }
    else if (v9 == *MEMORY[0x263F49200])
    {
      unint64_t v0 = 0x6174732E6E6F6F6DLL;
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v8 + 8))(v4, v7);
    }
  }
  sub_2572FCE10((uint64_t)v6, &qword_269FE5468);
  return v0;
}

uint64_t HMActionSet.iconTintColor.getter()
{
  uint64_t v1 = sub_257321718();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)&v21 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v5 = objc_msgSend(v0, sel_applicationData);
  id v6 = objc_msgSend(v5, sel_dictionary);

  uint64_t v7 = sub_2573217A8();
  unint64_t v22 = 0xD00000000000001FLL;
  unint64_t v23 = 0x80000002573240E0;
  sub_257321AE8();
  if (*(void *)(v7 + 16) && (unint64_t v8 = sub_2572FBD94((uint64_t)v24), (v9 & 1) != 0))
  {
    sub_2572FD6B8(*(void *)(v7 + 56) + 32 * v8, (uint64_t)&v25);
  }
  else
  {
    long long v25 = 0u;
    long long v26 = 0u;
  }
  swift_bridgeObjectRelease();
  sub_2572FD614((uint64_t)v24);
  if (*((void *)&v26 + 1))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_269FE5460);
    if (swift_dynamicCast())
    {
      unint64_t v10 = v22;
      if (*(void *)(v22 + 16))
      {
        unint64_t v11 = sub_2572FBD1C(114, 0xE100000000000000);
        if (v12)
        {
          if (*(void *)(v10 + 16))
          {
            double v13 = *(double *)(*(void *)(v10 + 56) + 8 * v11);
            unint64_t v14 = sub_2572FBD1C(103, 0xE100000000000000);
            if (v15)
            {
              if (*(void *)(v10 + 16))
              {
                double v16 = *(double *)(*(void *)(v10 + 56) + 8 * v14);
                unint64_t v17 = sub_2572FBD1C(98, 0xE100000000000000);
                if (v18)
                {
                  double v19 = *(double *)(*(void *)(v10 + 56) + 8 * v17);
                  swift_bridgeObjectRelease();
                  (*(void (**)(char *, void, uint64_t))(v2 + 104))(v4, *MEMORY[0x263F1B388], v1);
                  return MEMORY[0x25A2B3290](v4, v13, v16, v19, 1.0);
                }
              }
            }
          }
        }
      }
      swift_bridgeObjectRelease();
    }
  }
  else
  {
    sub_2572FCE10((uint64_t)&v25, &qword_269FE5350);
  }
  return HMActionSet.defaultTint.getter();
}

uint64_t HMActionSet.defaultTint.getter()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_269FE5468);
  uint64_t v1 = MEMORY[0x270FA5388](v0 - 8);
  uint64_t v3 = (char *)&v13 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v1);
  id v5 = (char *)&v13 - v4;
  sub_2573219A8();
  uint64_t v6 = sub_257321998();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6) == 1) {
    goto LABEL_2;
  }
  sub_257302E24((uint64_t)v5, (uint64_t)v3);
  int v9 = (*(uint64_t (**)(char *, uint64_t))(v7 + 88))(v3, v6);
  if (v9 == *MEMORY[0x263F491D8] || v9 == *MEMORY[0x263F491F0])
  {
    id v10 = objc_msgSend(self, sel_systemOrangeColor);
LABEL_10:
    uint64_t v8 = MEMORY[0x25A2B32A0](v10);
    goto LABEL_11;
  }
  if (v9 == *MEMORY[0x263F49210])
  {
    id v10 = objc_msgSend(self, sel_systemYellowColor);
    goto LABEL_10;
  }
  if (v9 == *MEMORY[0x263F49200])
  {
    id v10 = objc_msgSend(self, sel_systemIndigoColor);
    goto LABEL_10;
  }
  (*(void (**)(char *, uint64_t))(v7 + 8))(v3, v6);
LABEL_2:
  uint64_t v8 = _sSo11HMActionSetC15NanoHomeIntentsE15backupTintColor7SwiftUI0H0Vvg_0();
LABEL_11:
  uint64_t v11 = v8;
  sub_2572FCE10((uint64_t)v5, &qword_269FE5468);
  return v11;
}

uint64_t HMActionSet.umbrellaCategories.getter()
{
  id v1 = objc_msgSend(v0, sel_actions);
  sub_257302E8C();
  sub_257302ED4((unint64_t *)&qword_269FE5478, (void (*)(uint64_t))sub_257302E8C);
  uint64_t v2 = sub_257321968();

  sub_257302568(MEMORY[0x263F8EE88], v2);
  uint64_t v4 = v3;
  swift_bridgeObjectRelease();
  return v4;
}

void sub_257302568(unsigned char *a1, uint64_t a2)
{
  uint64_t v4 = sub_257321688();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  unint64_t v69 = (char *)&v59 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v82 = sub_2573216A8();
  uint64_t v7 = *(void *)(v82 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v82);
  uint64_t v78 = (char *)&v59 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  uint64_t v81 = (char *)&v59 - v11;
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  unsigned int v68 = (char *)&v59 - v13;
  MEMORY[0x270FA5388](v12);
  uint64_t v71 = (char *)&v59 - v14;
  unint64_t v73 = a1;
  if ((a2 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_257321A98();
    sub_257302E8C();
    sub_257302ED4((unint64_t *)&qword_269FE5478, (void (*)(uint64_t))sub_257302E8C);
    sub_257321978();
    a2 = v87;
    uint64_t v15 = v88;
    uint64_t v16 = v89;
    uint64_t v17 = v90;
    unint64_t v18 = v91;
  }
  else
  {
    uint64_t v19 = -1 << *(unsigned char *)(a2 + 32);
    uint64_t v15 = a2 + 56;
    uint64_t v16 = ~v19;
    uint64_t v20 = -v19;
    if (v20 < 64) {
      uint64_t v21 = ~(-1 << v20);
    }
    else {
      uint64_t v21 = -1;
    }
    unint64_t v18 = v21 & *(void *)(a2 + 56);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v17 = 0;
  }
  uint64_t v72 = v16;
  uint64_t v84 = a2 & 0x7FFFFFFFFFFFFFFFLL;
  int64_t v85 = (unint64_t)(v16 + 64) >> 6;
  unint64_t v67 = (void (**)(char *, uint64_t))(v5 + 8);
  uint64_t v66 = v7 + 32;
  uint64_t v79 = v7 + 16;
  char v80 = (void (**)(char *, uint64_t))(v7 + 8);
  long long v65 = xmmword_257322B50;
  uint64_t v83 = MEMORY[0x263F8EE50] + 8;
  uint64_t v70 = v4;
  while (1)
  {
    uint64_t v22 = v17;
    if (a2 < 0)
    {
      uint64_t v25 = sub_257321AB8();
      if (!v25) {
        goto LABEL_44;
      }
      uint64_t v86 = v25;
      sub_257302E8C();
      swift_unknownObjectRetain();
      swift_dynamicCast();
      id v26 = v92;
      swift_unknownObjectRelease();
      if (!v26) {
        goto LABEL_44;
      }
      goto LABEL_33;
    }
    if (!v18) {
      break;
    }
    unint64_t v23 = __clz(__rbit64(v18));
    v18 &= v18 - 1;
    unint64_t v24 = v23 | (v17 << 6);
LABEL_32:
    id v26 = *(id *)(*(void *)(a2 + 48) + 8 * v24);
    if (!v26) {
      goto LABEL_44;
    }
LABEL_33:
    self;
    uint64_t v30 = swift_dynamicCastObjCClass();
    if (v30)
    {
      uint64_t v31 = (void *)v30;
      id v32 = v26;
      id v33 = objc_msgSend(v31, sel_characteristic);
      id v34 = objc_msgSend(v33, sel_service);

      if (!v34)
      {

        goto LABEL_9;
      }
      uint64_t v59 = v15;
      unint64_t v35 = v69;
      sub_257321A28();

      uint64_t v36 = v68;
      sub_257321658();
      (*v67)(v35, v70);
      uint64_t v37 = v71;
      uint64_t v38 = v82;
      (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v71, v36, v82);
      __swift_instantiateConcreteTypeFromMangledName(&qword_269FE5480);
      unint64_t v39 = (*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
      uint64_t v76 = *(void *)(v7 + 72);
      uint64_t v40 = swift_allocObject();
      *(_OWORD *)(v40 + 16) = v65;
      uint64_t v63 = v40;
      uint64_t v64 = v7;
      uint64_t v42 = *(void (**)(unint64_t, char *, uint64_t))(v7 + 16);
      unint64_t v41 = v40 + v39;
      v42(v40 + v39, v37, v38);
      uint64_t v43 = v73;
      swift_bridgeObjectRetain();
      unint64_t v62 = v41;
      uint64_t v77 = (void (*)(char *, unint64_t, uint64_t))v42;
      v42((unint64_t)v81, (char *)v41, v82);
      sub_257302ED4(&qword_269FE5488, MEMORY[0x263F487F0]);
      swift_bridgeObjectRetain();
      uint64_t v44 = sub_2573217B8();
      uint64_t v45 = -1 << v43[32];
      unint64_t v46 = v44 & ~v45;
      uint64_t v75 = v43 + 56;
      uint64_t v47 = *(void *)&v43[((v46 >> 3) & 0xFFFFFFFFFFFFFF8) + 56] >> v46;
      uint64_t v60 = a2;
      uint64_t v61 = (unint64_t)v80 & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
      if (v47)
      {
        uint64_t v74 = ~v45;
        uint64_t v48 = v82;
        uint64_t v49 = (void (*)(void, void, void))v73;
        while (1)
        {
          uint64_t v50 = v49;
          unint64_t v51 = *((void *)v49 + 6) + v46 * v76;
          id v52 = v78;
          v77(v78, v51, v48);
          sub_257302ED4(&qword_269FE5490, MEMORY[0x263F487F0]);
          char v53 = sub_2573217C8();
          int v54 = *v80;
          (*v80)(v52, v48);
          if (v53) {
            break;
          }
          unint64_t v46 = (v46 + 1) & v74;
          uint64_t v49 = v50;
          uint64_t v48 = v82;
          if (((*(void *)&v75[(v46 >> 3) & 0xFFFFFFFFFFFFFF8] >> v46) & 1) == 0) {
            goto LABEL_41;
          }
        }
        swift_bridgeObjectRelease();
        uint64_t v58 = v82;
        v54(v81, v82);
        uint64_t v77 = (void (*)(char *, unint64_t, uint64_t))v50;
      }
      else
      {
        uint64_t v48 = v82;
        uint64_t v49 = (void (*)(void, void, void))v73;
LABEL_41:
        swift_bridgeObjectRelease();
        LODWORD(v76) = swift_isUniquelyReferenced_nonNull_native();
        uint64_t v55 = (uint64_t)v78;
        int v56 = v49;
        int v57 = v81;
        v77(v78, (unint64_t)v81, v48);
        id v92 = v56;
        uint64_t v58 = v48;
        sub_257311058(v55, v46, v76);
        uint64_t v77 = (void (*)(char *, unint64_t, uint64_t))v92;
        swift_bridgeObjectRelease();
        int v54 = *v80;
        (*v80)(v57, v48);
      }
      a2 = v60;
      uint64_t v15 = v59;
      swift_setDeallocating();
      swift_arrayDestroy();
      swift_deallocClassInstance();

      v54(v71, v58);
      swift_bridgeObjectRelease();

      unint64_t v73 = v77;
      uint64_t v7 = v64;
    }
    else
    {
LABEL_9:
    }
  }
  int64_t v27 = v17 + 1;
  if (!__OFADD__(v17, 1))
  {
    if (v27 >= v85) {
      goto LABEL_44;
    }
    unint64_t v28 = *(void *)(v15 + 8 * v27);
    ++v17;
    if (!v28)
    {
      uint64_t v17 = v22 + 2;
      if (v22 + 2 >= v85) {
        goto LABEL_44;
      }
      unint64_t v28 = *(void *)(v15 + 8 * v17);
      if (!v28)
      {
        uint64_t v17 = v22 + 3;
        if (v22 + 3 >= v85) {
          goto LABEL_44;
        }
        unint64_t v28 = *(void *)(v15 + 8 * v17);
        if (!v28)
        {
          uint64_t v17 = v22 + 4;
          if (v22 + 4 >= v85) {
            goto LABEL_44;
          }
          unint64_t v28 = *(void *)(v15 + 8 * v17);
          if (!v28)
          {
            uint64_t v17 = v22 + 5;
            if (v22 + 5 >= v85) {
              goto LABEL_44;
            }
            unint64_t v28 = *(void *)(v15 + 8 * v17);
            if (!v28)
            {
              uint64_t v29 = v22 + 6;
              while (v85 != v29)
              {
                unint64_t v28 = *(void *)(v15 + 8 * v29++);
                if (v28)
                {
                  uint64_t v17 = v29 - 1;
                  goto LABEL_31;
                }
              }
LABEL_44:
              sub_257302ECC();
              return;
            }
          }
        }
      }
    }
LABEL_31:
    unint64_t v18 = (v28 - 1) & v28;
    unint64_t v24 = __clz(__rbit64(v28)) + (v17 << 6);
    goto LABEL_32;
  }
  __break(1u);
}

uint64_t sub_257302E24(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269FE5468);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_257302E8C()
{
  unint64_t result = qword_269FE5470;
  if (!qword_269FE5470)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_269FE5470);
  }
  return result;
}

uint64_t sub_257302ECC()
{
  return swift_release();
}

uint64_t sub_257302ED4(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_257302F1C()
{
  uint64_t result = _s15NanoHomeIntents21NHOIntentLocalizationC15localizedStringyS2SFZ_0(0x4C5F544547444957, 0xEF524548434E5541);
  qword_269FE5498 = result;
  unk_269FE54A0 = v1;
  return result;
}

uint64_t static NHOIntentLocalization.launcherWidgetName.getter()
{
  return sub_257303344(&qword_269FE5280, &qword_269FE5498);
}

uint64_t sub_257302FB4()
{
  uint64_t result = _s15NanoHomeIntents21NHOIntentLocalizationC15localizedStringyS2SFZ_0(0xD00000000000001DLL, 0x8000000257324360);
  qword_269FE54A8 = result;
  unk_269FE54B0 = v1;
  return result;
}

uint64_t static NHOIntentLocalization.smartStackWidgetName.getter()
{
  return sub_257303344(&qword_269FE5288, &qword_269FE54A8);
}

uint64_t sub_257303040()
{
  uint64_t result = _s15NanoHomeIntents21NHOIntentLocalizationC15localizedStringyS2SFZ_0(0xD00000000000001DLL, 0x8000000257324340);
  qword_269FE54B8 = result;
  unk_269FE54C0 = v1;
  return result;
}

uint64_t static NHOIntentLocalization.actionSetRectangularWidgetText.getter()
{
  return sub_257303344(&qword_269FE5290, &qword_269FE54B8);
}

uint64_t sub_2573030CC()
{
  uint64_t result = _s15NanoHomeIntents21NHOIntentLocalizationC15localizedStringyS2SFZ_0(0xD00000000000001CLL, 0x8000000257324320);
  qword_269FE54C8 = result;
  unk_269FE54D0 = v1;
  return result;
}

uint64_t static NHOIntentLocalization.forecastEnergyWidgetName.getter()
{
  return sub_257303344(&qword_269FE5298, &qword_269FE54C8);
}

uint64_t sub_257303158()
{
  uint64_t result = _s15NanoHomeIntents21NHOIntentLocalizationC15localizedStringyS2SFZ_0(0xD000000000000017, 0x8000000257324300);
  qword_269FE54D8 = result;
  unk_269FE54E0 = v1;
  return result;
}

uint64_t static NHOIntentLocalization.currentLocationEnergyWidgetName.getter()
{
  return sub_257303344(&qword_269FE52A0, &qword_269FE54D8);
}

uint64_t static NHOIntentLocalization.homeSpecificEnergyWidgetName(homeName:)(uint64_t a1, uint64_t a2)
{
  return sub_257303458(a1, a2, 0xD000000000000014, 0x8000000257324140);
}

uint64_t sub_25730321C()
{
  uint64_t result = _s15NanoHomeIntents21NHOIntentLocalizationC15localizedStringyS2SFZ_0(0xD00000000000001CLL, 0x80000002573242E0);
  qword_269FE54E8 = result;
  unk_269FE54F0 = v1;
  return result;
}

uint64_t static NHOIntentLocalization.electricityUsageWidgetName.getter()
{
  return sub_257303344(&qword_269FE52A8, &qword_269FE54E8);
}

uint64_t static NHOIntentLocalization.homeSpecificElectricityUsageWidgetName(homeName:)(uint64_t a1, uint64_t a2)
{
  return sub_257303458(a1, a2, 0xD000000000000020, 0x8000000257324160);
}

uint64_t sub_2573032E0()
{
  uint64_t result = _s15NanoHomeIntents21NHOIntentLocalizationC15localizedStringyS2SFZ_0(0xD00000000000001CLL, 0x80000002573242C0);
  qword_269FE54F8 = result;
  unk_269FE5500 = v1;
  return result;
}

uint64_t static NHOIntentLocalization.electricityRatesWidgetName.getter()
{
  return sub_257303344(&qword_269FE52B0, &qword_269FE54F8);
}

uint64_t sub_257303344(void *a1, uint64_t *a2)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v3 = *a2;
  swift_bridgeObjectRetain();
  return v3;
}

id sub_2573033C0(uint64_t a1, uint64_t a2, void *a3)
{
  if (*a3 != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  uint64_t v3 = (void *)sub_2573217E8();
  swift_bridgeObjectRelease();

  return v3;
}

uint64_t static NHOIntentLocalization.homeSpecificElectricityRatesWidgetName(homeName:)(uint64_t a1, uint64_t a2)
{
  return sub_257303458(a1, a2, 0xD000000000000020, 0x8000000257324190);
}

uint64_t sub_257303458(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _s15NanoHomeIntents21NHOIntentLocalizationC15localizedStringyS2SFZ_0(a3, a4);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269FE5508);
  uint64_t v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = xmmword_257322B50;
  *(void *)(v6 + 56) = MEMORY[0x263F8D310];
  *(void *)(v6 + 64) = sub_2573038D4();
  *(void *)(v6 + 32) = a1;
  *(void *)(v6 + 40) = a2;
  swift_bridgeObjectRetain();
  uint64_t v7 = sub_257321808();
  swift_bridgeObjectRelease();
  return v7;
}

id sub_25730352C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v7 = sub_2573217F8();
  uint64_t v9 = v8;
  _s15NanoHomeIntents21NHOIntentLocalizationC15localizedStringyS2SFZ_0(a4, a5);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269FE5508);
  uint64_t v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_257322B50;
  *(void *)(v10 + 56) = MEMORY[0x263F8D310];
  *(void *)(v10 + 64) = sub_2573038D4();
  *(void *)(v10 + 32) = v7;
  *(void *)(v10 + 40) = v9;
  swift_bridgeObjectRetain();
  sub_257321808();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v11 = (void *)sub_2573217E8();
  swift_bridgeObjectRelease();

  return v11;
}

id NHOIntentLocalization.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

id NHOIntentLocalization.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_init);
}

id NHOIntentLocalization.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t _s15NanoHomeIntents21NHOIntentLocalizationC15localizedStringyS2SFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (void *)sub_2573217E8();
  id v5 = objc_msgSend(self, sel_bundleWithIdentifier_, v4);

  if (v5)
  {
    uint64_t v6 = (void *)sub_2573217E8();
    uint64_t v7 = (void *)sub_2573217E8();
    id v8 = objc_msgSend(v5, sel_localizedStringForKey_value_table_, v6, 0, v7);

    uint64_t v9 = sub_2573217F8();
    uint64_t v11 = v10;

    BOOL v12 = v9 == a1 && v11 == a2;
    if (v12 || (sub_257321C18() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      uint64_t v13 = (void *)sub_2573217E8();
      uint64_t v14 = (void *)sub_2573217E8();
      id v15 = objc_msgSend(v5, sel_localizedStringForKey_value_table_, v13, 0, v14);

      a1 = sub_2573217F8();
    }
    else
    {

      return v9;
    }
  }
  else
  {
    swift_bridgeObjectRetain();
  }
  return a1;
}

unint64_t sub_2573038D4()
{
  unint64_t result = qword_269FE5510;
  if (!qword_269FE5510)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269FE5510);
  }
  return result;
}

uint64_t type metadata accessor for NHOIntentLocalization()
{
  return self;
}

unint64_t static Logger.sub.getter()
{
  return 0xD000000000000012;
}

uint64_t sub_257303968(uint64_t a1)
{
  return sub_257303B0C(a1, qword_269FE5518);
}

uint64_t static Logger.appIntents.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_257303BA8(&qword_269FE52B8, (uint64_t)qword_269FE5518, a1);
}

uint64_t sub_2573039B0(uint64_t a1)
{
  return sub_257303B0C(a1, qword_269FE5530);
}

uint64_t static Logger.intentPerformer.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_257303BA8(&qword_269FE52C0, (uint64_t)qword_269FE5530, a1);
}

uint64_t sub_257303A00(uint64_t a1)
{
  return sub_257303B0C(a1, qword_269FE5548);
}

uint64_t static Logger.lastAction.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_257303BA8(&qword_269FE52C8, (uint64_t)qword_269FE5548, a1);
}

uint64_t sub_257303A48(uint64_t a1)
{
  return sub_257303B0C(a1, qword_269FE5560);
}

uint64_t static Logger.homeExtensions.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_257303BA8(&qword_269FE52D0, (uint64_t)qword_269FE5560, a1);
}

uint64_t sub_257303A98(uint64_t a1)
{
  return sub_257303B0C(a1, qword_269FE5578);
}

uint64_t static Logger.accessoryWidget.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_257303BA8(&qword_269FE52D8, (uint64_t)qword_269FE5578, a1);
}

uint64_t sub_257303AE8(uint64_t a1)
{
  return sub_257303B0C(a1, qword_269FE5590);
}

uint64_t sub_257303B0C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_257321708();
  __swift_allocate_value_buffer(v3, a2);
  __swift_project_value_buffer(v3, (uint64_t)a2);
  return sub_2573216F8();
}

uint64_t static Logger.userCapabilities.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_257303BA8(&qword_269FE52E0, (uint64_t)qword_269FE5590, a1);
}

uint64_t sub_257303BA8@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_257321708();
  uint64_t v6 = __swift_project_value_buffer(v5, a2);
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);

  return v7(a3, v6, v5);
}

uint64_t NHOSmartStackAction.rawValue.getter()
{
  uint64_t result = 0x726F737365636361;
  switch(*v0)
  {
    case 1:
      uint64_t result = 0x65536E6F69746361;
      break;
    case 2:
      uint64_t result = 0x746867694C6C6C61;
      break;
    case 3:
      uint64_t result = 0x6B616570536C6C61;
      break;
    case 4:
      uint64_t result = 0x736B636F4C6C6C61;
      break;
    default:
      return result;
  }
  return result;
}

NanoHomeIntents::NHOSmartStackAction_optional __swiftcall NHOSmartStackAction.init(rawValue:)(Swift::String rawValue)
{
  objc_super v2 = v1;
  unint64_t v3 = sub_257321BF8();
  result.value = swift_bridgeObjectRelease();
  char v5 = 5;
  if (v3 < 5) {
    char v5 = v3;
  }
  char *v2 = v5;
  return result;
}

uint64_t sub_257303D5C(unsigned __int8 a1, char a2)
{
  uint64_t v2 = 0x726F737365636361;
  unint64_t v3 = 0xE900000000000079;
  uint64_t v4 = a1;
  uint64_t v5 = 0x726F737365636361;
  switch(v4)
  {
    case 1:
      uint64_t v5 = 0x65536E6F69746361;
      unint64_t v3 = 0xE900000000000074;
      break;
    case 2:
      uint64_t v5 = 0x746867694C6C6C61;
      unint64_t v3 = 0xE900000000000073;
      break;
    case 3:
      uint64_t v5 = 0x6B616570536C6C61;
      unint64_t v3 = 0xEB00000000737265;
      break;
    case 4:
      unint64_t v3 = 0xE800000000000000;
      uint64_t v5 = 0x736B636F4C6C6C61;
      break;
    default:
      break;
  }
  unint64_t v6 = 0xE900000000000079;
  switch(a2)
  {
    case 1:
      unint64_t v6 = 0xE900000000000074;
      if (v5 == 0x65536E6F69746361) {
        goto LABEL_13;
      }
      goto LABEL_16;
    case 2:
      unint64_t v6 = 0xE900000000000073;
      if (v5 != 0x746867694C6C6C61) {
        goto LABEL_16;
      }
      goto LABEL_13;
    case 3:
      uint64_t v2 = 0x6B616570536C6C61;
      unint64_t v6 = 0xEB00000000737265;
      goto LABEL_12;
    case 4:
      unint64_t v6 = 0xE800000000000000;
      if (v5 != 0x736B636F4C6C6C61) {
        goto LABEL_16;
      }
      goto LABEL_13;
    default:
LABEL_12:
      if (v5 != v2) {
        goto LABEL_16;
      }
LABEL_13:
      if (v3 == v6) {
        char v7 = 1;
      }
      else {
LABEL_16:
      }
        char v7 = sub_257321C18();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v7 & 1;
  }
}

uint64_t sub_257303F48(unsigned __int8 *a1, char *a2)
{
  return sub_257303D5C(*a1, *a2);
}

uint64_t sub_257303F54()
{
  return sub_257321C68();
}

uint64_t sub_257304068()
{
  sub_257321848();

  return swift_bridgeObjectRelease();
}

uint64_t sub_25730415C()
{
  return sub_257321C68();
}

NanoHomeIntents::NHOSmartStackAction_optional sub_25730426C(Swift::String *a1)
{
  return NHOSmartStackAction.init(rawValue:)(*a1);
}

void sub_257304278(uint64_t *a1@<X8>)
{
  unint64_t v2 = 0xE900000000000079;
  uint64_t v3 = 0x726F737365636361;
  switch(*v1)
  {
    case 1:
      unint64_t v2 = 0xE900000000000074;
      uint64_t v3 = 0x65536E6F69746361;
      goto LABEL_3;
    case 2:
      *a1 = 0x746867694C6C6C61;
      a1[1] = 0xE900000000000073;
      break;
    case 3:
      *a1 = 0x6B616570536C6C61;
      a1[1] = 0xEB00000000737265;
      break;
    case 4:
      *a1 = 0x736B636F4C6C6C61;
      a1[1] = 0xE800000000000000;
      break;
    default:
LABEL_3:
      *a1 = v3;
      a1[1] = v2;
      break;
  }
}

uint64_t static NHOSmartStackAction.typeDisplayRepresentation.getter()
{
  return MEMORY[0x270EE1CA0](0xD000000000000017, 0x8000000257324400);
}

unint64_t sub_257304364()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_269FE5708);
  uint64_t v0 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_269FE5710) - 8);
  uint64_t v1 = *(void *)(v0 + 72);
  unint64_t v2 = (*(unsigned __int8 *)(v0 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v0 + 80);
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_257322BA0;
  uint64_t v4 = (unsigned char *)(v3 + v2);
  *uint64_t v4 = 0;
  sub_257321448();
  v4[v1] = 1;
  sub_257321448();
  v4[2 * v1] = 2;
  sub_257321448();
  v4[3 * v1] = 3;
  sub_257321448();
  v4[4 * v1] = 4;
  sub_257321448();
  unint64_t result = sub_25730452C(v3);
  qword_269FE55A8 = result;
  return result;
}

unint64_t sub_25730452C(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269FE5710);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (unsigned __int8 *)v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(void *)(a1 + 16))
  {
    char v7 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_269FE5718);
  uint64_t v6 = sub_257321BD8();
  char v7 = (void *)v6;
  uint64_t v8 = *(void *)(a1 + 16);
  if (!v8)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v7;
  }
  uint64_t v9 = &v5[*(int *)(v2 + 48)];
  uint64_t v10 = v6 + 64;
  unint64_t v11 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v23[1] = a1;
  uint64_t v12 = a1 + v11;
  uint64_t v13 = *(void *)(v3 + 72);
  swift_retain();
  while (1)
  {
    sub_257307958(v12, (uint64_t)v5);
    unsigned __int8 v14 = *v5;
    unint64_t result = sub_2572FBDD8(*v5);
    if (v16) {
      break;
    }
    unint64_t v17 = result;
    *(void *)(v10 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(unsigned char *)(v7[6] + result) = v14;
    uint64_t v18 = v7[7];
    uint64_t v19 = sub_257321458();
    unint64_t result = (*(uint64_t (**)(unint64_t, unsigned __int8 *, uint64_t))(*(void *)(v19 - 8) + 32))(v18 + *(void *)(*(void *)(v19 - 8) + 72) * v17, v9, v19);
    uint64_t v20 = v7[2];
    BOOL v21 = __OFADD__(v20, 1);
    uint64_t v22 = v20 + 1;
    if (v21) {
      goto LABEL_11;
    }
    v7[2] = v22;
    v12 += v13;
    if (!--v8)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

uint64_t static NHOSmartStackAction.caseDisplayRepresentations.getter()
{
  if (qword_269FE52E8 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return swift_bridgeObjectRetain();
}

uint64_t static NHOSmartStackAction.caseDisplayRepresentations.setter(uint64_t a1)
{
  if (qword_269FE52E8 != -1) {
    swift_once();
  }
  swift_beginAccess();
  qword_269FE55A8 = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*static NHOSmartStackAction.caseDisplayRepresentations.modify())()
{
  if (qword_269FE52E8 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j__swift_endAccess;
}

void *static NHOSmartStackAction.allCases.getter()
{
  return &unk_27064A678;
}

uint64_t sub_2573048AC()
{
  return MEMORY[0x270EE1CA0](0xD000000000000017, 0x8000000257324400);
}

uint64_t sub_2573048C8(uint64_t a1)
{
  unint64_t v2 = sub_2573068E8();

  return MEMORY[0x270EE0C40](a1, v2);
}

uint64_t sub_257304914()
{
  if (qword_269FE52E8 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return swift_bridgeObjectRetain();
}

uint64_t sub_25730498C(uint64_t a1)
{
  unint64_t v2 = sub_257307174();

  return MEMORY[0x270EE1C28](a1, v2);
}

void sub_2573049D8(void *a1@<X8>)
{
  *a1 = &unk_27064A6A0;
}

uint64_t sub_2573049E8()
{
  uint64_t v0 = sub_2573214C8();
  __swift_allocate_value_buffer(v0, qword_269FE55B0);
  __swift_project_value_buffer(v0, (uint64_t)qword_269FE55B0);
  return sub_2573214B8();
}

uint64_t static NHOSmartStackActionIntent.title.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_25730085C(&qword_269FE52F0, MEMORY[0x263F06D40], (uint64_t)qword_269FE55B0, a1);
}

uint64_t static NHOSmartStackActionIntent.title.setter(uint64_t a1)
{
  return sub_257300944(a1, &qword_269FE52F0, MEMORY[0x263F06D40], (uint64_t)qword_269FE55B0);
}

uint64_t (*static NHOSmartStackActionIntent.title.modify())()
{
  if (qword_269FE52F0 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_2573214C8();
  __swift_project_value_buffer(v0, (uint64_t)qword_269FE55B0);
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_257304B50()
{
  uint64_t v0 = sub_257321438();
  __swift_allocate_value_buffer(v0, qword_269FE55C8);
  __swift_project_value_buffer(v0, (uint64_t)qword_269FE55C8);
  return sub_257321428();
}

uint64_t static NHOSmartStackActionIntent.description.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_25730085C(&qword_269FE52F8, MEMORY[0x263EFBA28], (uint64_t)qword_269FE55C8, a1);
}

uint64_t static NHOSmartStackActionIntent.description.setter(uint64_t a1)
{
  return sub_257300944(a1, &qword_269FE52F8, MEMORY[0x263EFBA28], (uint64_t)qword_269FE55C8);
}

uint64_t (*static NHOSmartStackActionIntent.description.modify())()
{
  if (qword_269FE52F8 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_257321438();
  __swift_project_value_buffer(v0, (uint64_t)qword_269FE55C8);
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t NHOSmartStackActionIntent.homeID.getter()
{
  return sub_257300C20();
}

uint64_t NHOSmartStackActionIntent.homeID.setter()
{
  return sub_257300CF4();
}

uint64_t (*NHOSmartStackActionIntent.homeID.modify(void *a1))()
{
  uint64_t v3 = malloc(0x30uLL);
  *a1 = v3;
  v3[4] = *(void *)(v1 + OBJC_IVAR___NHOSmartStackActionIntent__homeID);
  swift_retain();
  v3[5] = sub_2573213B8();
  return sub_257300B6C;
}

uint64_t NHOSmartStackActionIntent.$homeID.getter()
{
  return sub_257300EB8();
}

uint64_t NHOSmartStackActionIntent.homeName.getter()
{
  return sub_257300C20();
}

uint64_t NHOSmartStackActionIntent.homeName.setter()
{
  return sub_257300CF4();
}

uint64_t (*NHOSmartStackActionIntent.homeName.modify(void *a1))()
{
  uint64_t v3 = malloc(0x30uLL);
  *a1 = v3;
  v3[4] = *(void *)(v1 + OBJC_IVAR___NHOSmartStackActionIntent__homeName);
  swift_retain();
  v3[5] = sub_2573213B8();
  return sub_257300B6C;
}

uint64_t NHOSmartStackActionIntent.$homeName.getter()
{
  return sub_257300EB8();
}

uint64_t NHOSmartStackActionIntent.smartStackAction.getter()
{
  swift_retain();
  sub_2573213C8();

  return swift_release();
}

uint64_t sub_257304E68@<X0>(unsigned char *a1@<X8>)
{
  swift_retain();
  sub_2573213C8();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t NHOSmartStackActionIntent.smartStackAction.setter()
{
  return swift_release();
}

uint64_t (*NHOSmartStackActionIntent.smartStackAction.modify(void *a1))()
{
  char v3 = malloc(0x30uLL);
  *a1 = v3;
  v3[4] = *(void *)(v1 + OBJC_IVAR___NHOSmartStackActionIntent__smartStackAction);
  swift_retain();
  v3[5] = sub_2573213B8();
  return sub_257300B6C;
}

uint64_t NHOSmartStackActionIntent.$smartStackAction.getter()
{
  return sub_257300EB8();
}

uint64_t NHOSmartStackActionIntent.actionID.getter()
{
  return sub_257300C20();
}

uint64_t NHOSmartStackActionIntent.actionID.setter()
{
  return sub_257300CF4();
}

uint64_t (*NHOSmartStackActionIntent.actionID.modify(void *a1))()
{
  char v3 = malloc(0x30uLL);
  *a1 = v3;
  v3[4] = *(void *)(v1 + OBJC_IVAR___NHOSmartStackActionIntent__actionID);
  swift_retain();
  v3[5] = sub_2573213B8();
  return sub_257300B6C;
}

uint64_t NHOSmartStackActionIntent.$actionID.getter()
{
  return sub_257300EB8();
}

uint64_t NHOSmartStackActionIntent.actionName.getter()
{
  return sub_257300C20();
}

uint64_t NHOSmartStackActionIntent.actionName.setter()
{
  return sub_257300CF4();
}

uint64_t (*NHOSmartStackActionIntent.actionName.modify(void *a1))()
{
  char v3 = malloc(0x30uLL);
  *a1 = v3;
  v3[4] = *(void *)(v1 + OBJC_IVAR___NHOSmartStackActionIntent__actionName);
  swift_retain();
  v3[5] = sub_2573213B8();
  return sub_257300B6C;
}

uint64_t NHOSmartStackActionIntent.$actionName.getter()
{
  return sub_257300EB8();
}

uint64_t NHOSmartStackActionIntent.icon.getter()
{
  return sub_257300C20();
}

uint64_t NHOSmartStackActionIntent.icon.setter()
{
  return sub_257300CF4();
}

uint64_t (*NHOSmartStackActionIntent.icon.modify(void *a1))()
{
  char v3 = malloc(0x30uLL);
  *a1 = v3;
  v3[4] = *(void *)(v1 + OBJC_IVAR___NHOSmartStackActionIntent__icon);
  swift_retain();
  v3[5] = sub_2573213B8();
  return sub_257300B6C;
}

uint64_t NHOSmartStackActionIntent.$icon.getter()
{
  return sub_257300EB8();
}

uint64_t NHOSmartStackActionIntent.useHomeKitRecommendations.getter()
{
  swift_retain();
  sub_2573213C8();
  swift_release();
  return v1;
}

uint64_t NHOSmartStackActionIntent.useHomeKitRecommendations.setter()
{
  return swift_release();
}

uint64_t sub_2573052E8@<X0>(unsigned char *a1@<X8>)
{
  swift_retain();
  sub_2573213C8();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_257305340()
{
  return swift_release();
}

uint64_t (*NHOSmartStackActionIntent.useHomeKitRecommendations.modify(void *a1))()
{
  char v3 = malloc(0x30uLL);
  *a1 = v3;
  v3[4] = *(void *)(v1 + OBJC_IVAR___NHOSmartStackActionIntent__useHomeKitRecommendations);
  swift_retain();
  v3[5] = sub_2573213B8();
  return sub_257300B6C;
}

uint64_t NHOSmartStackActionIntent.$useHomeKitRecommendations.getter()
{
  return sub_257300EB8();
}

uint64_t NHOSmartStackActionIntent.accessoriesAndScenes.getter()
{
  swift_retain();
  sub_2573213C8();
  swift_release();
  return v1;
}

uint64_t NHOSmartStackActionIntent.accessoriesAndScenes.setter()
{
  return swift_release();
}

uint64_t sub_257305590@<X0>(void *a1@<X8>)
{
  swift_retain();
  sub_2573213C8();
  uint64_t result = swift_release();
  *a1 = v3;
  a1[1] = v4;
  return result;
}

uint64_t sub_2573055E8()
{
  return swift_release();
}

uint64_t (*NHOSmartStackActionIntent.accessoriesAndScenes.modify(void *a1))()
{
  uint64_t v3 = malloc(0x30uLL);
  *a1 = v3;
  v3[4] = *(void *)(v1 + OBJC_IVAR___NHOSmartStackActionIntent__accessoriesAndScenes);
  swift_retain();
  v3[5] = sub_2573213B8();
  return sub_257300B6C;
}

uint64_t NHOSmartStackActionIntent.$accessoriesAndScenes.getter()
{
  return sub_257300EB8();
}

uint64_t NHOSmartStackActionIntent.requestConfirmationText.getter()
{
  return sub_257300C20();
}

uint64_t NHOSmartStackActionIntent.requestConfirmationText.setter()
{
  return sub_257300CF4();
}

uint64_t (*NHOSmartStackActionIntent.requestConfirmationText.modify(void *a1))()
{
  uint64_t v3 = malloc(0x30uLL);
  *a1 = v3;
  v3[4] = *(void *)(v1 + OBJC_IVAR___NHOSmartStackActionIntent__requestConfirmationText);
  swift_retain();
  v3[5] = sub_2573213B8();
  return sub_257300B6C;
}

uint64_t NHOSmartStackActionIntent.$requestConfirmationText.getter()
{
  return sub_257300EB8();
}

uint64_t NHOSmartStackActionIntent.requestConfirmationIcon.getter()
{
  return sub_257300C20();
}

uint64_t NHOSmartStackActionIntent.requestConfirmationIcon.setter()
{
  return sub_257300CF4();
}

uint64_t (*NHOSmartStackActionIntent.requestConfirmationIcon.modify(void *a1))()
{
  uint64_t v3 = malloc(0x30uLL);
  *a1 = v3;
  v3[4] = *(void *)(v1 + OBJC_IVAR___NHOSmartStackActionIntent__requestConfirmationIcon);
  swift_retain();
  v3[5] = sub_2573213B8();
  return sub_257300B6C;
}

uint64_t NHOSmartStackActionIntent.$requestConfirmationIcon.getter()
{
  return sub_257300EB8();
}

uint64_t NHOSmartStackActionIntent.isSmartStack.getter()
{
  swift_retain();
  sub_2573213C8();
  swift_release();
  return v1;
}

uint64_t sub_25730583C@<X0>(unsigned char *a1@<X8>)
{
  swift_retain();
  sub_2573213C8();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_257305894()
{
  return swift_release();
}

uint64_t NHOSmartStackActionIntent.isSmartStack.setter()
{
  return swift_release();
}

uint64_t (*NHOSmartStackActionIntent.isSmartStack.modify(void *a1))()
{
  char v3 = malloc(0x30uLL);
  *a1 = v3;
  v3[4] = *(void *)(v1 + OBJC_IVAR___NHOSmartStackActionIntent__isSmartStack);
  swift_retain();
  v3[5] = sub_2573213B8();
  return sub_257300B6C;
}

uint64_t NHOSmartStackActionIntent.$isSmartStack.getter()
{
  return sub_257300EB8();
}

id NHOSmartStackActionIntent.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

id NHOSmartStackActionIntent.init()()
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_269FE5638);
  MEMORY[0x270FA5388](v1 - 8);
  uint64_t v88 = (char *)&v82 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v102 = sub_257321468();
  uint64_t v3 = *(void *)(v102 - 8);
  MEMORY[0x270FA5388](v102);
  uint64_t v5 = (char *)&v82 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269FE5400);
  uint64_t v7 = MEMORY[0x270FA5388](v6 - 8);
  uint64_t v86 = (char *)&v82 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v82 - v9;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_269FE5408);
  MEMORY[0x270FA5388](v11 - 8);
  uint64_t v13 = (char *)&v82 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_269FE5410);
  MEMORY[0x270FA5388](v14 - 8);
  char v16 = (char *)&v82 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_2573214C8();
  uint64_t v106 = v17;
  uint64_t v18 = *(void *)(v17 - 8);
  MEMORY[0x270FA5388](v17);
  uint64_t v20 = (char *)&v82 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v85 = OBJC_IVAR___NHOSmartStackActionIntent__homeID;
  uint64_t v93 = __swift_instantiateConcreteTypeFromMangledName(&qword_269FE5418);
  id v103 = v0;
  sub_2573214B8();
  BOOL v21 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v18 + 56);
  uint64_t v101 = v18 + 56;
  v21(v16, 1, 1, v17);
  uint64_t v22 = v21;
  uint64_t v100 = sub_2573217D8();
  unint64_t v110 = 0;
  unint64_t v111 = 0;
  uint64_t v23 = *(void *)(v100 - 8);
  unint64_t v99 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v23 + 56);
  uint64_t v96 = v23 + 56;
  unint64_t v24 = v13;
  v99(v13, 1, 1, v100);
  uint64_t v108 = sub_257321398();
  uint64_t v25 = *(void *)(v108 - 8);
  uint64_t v105 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v25 + 56);
  uint64_t v107 = v25 + 56;
  v105(v10, 1, 1, v108);
  uint64_t v26 = *MEMORY[0x263EFBDC8];
  int64_t v27 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 104);
  uint64_t v97 = v3 + 104;
  unint64_t v98 = v27;
  unsigned int v104 = v26;
  uint64_t v28 = v102;
  v27(v5, v26, v102);
  uint64_t v90 = v20;
  uint64_t v29 = v16;
  os_log_type_t v94 = v16;
  uint64_t v30 = v24;
  *(void *)((char *)v84 + v85) = sub_257321408();
  uint64_t v85 = OBJC_IVAR___NHOSmartStackActionIntent__homeName;
  sub_2573214B8();
  uint64_t v31 = v29;
  uint64_t v32 = v106;
  id v33 = v22;
  id v95 = v22;
  v22(v31, 1, 1, v106);
  unint64_t v110 = 0;
  unint64_t v111 = 0;
  unint64_t v91 = v30;
  v99(v30, 1, 1, v100);
  v105(v10, 1, 1, v108);
  v98(v5, v26, v28);
  id v34 = v94;
  uint64_t v35 = sub_257321408();
  uint64_t v36 = (char *)v103;
  *(void *)((char *)v103 + v85) = v35;
  uint64_t v85 = OBJC_IVAR___NHOSmartStackActionIntent__smartStackAction;
  uint64_t v84 = (void (*)(char *, uint64_t, uint64_t, uint64_t))__swift_instantiateConcreteTypeFromMangledName(&qword_269FE5640);
  sub_2573214B8();
  v33(v34, 1, 1, v32);
  LOBYTE(v110) = 5;
  id v92 = v10;
  uint64_t v37 = v10;
  uint64_t v38 = v108;
  unint64_t v39 = v105;
  v105(v37, 1, 1, v108);
  v39(v86, 1, 1, v38);
  uint64_t v89 = v5;
  uint64_t v40 = v104;
  unint64_t v41 = v98;
  v98(v5, v104, v102);
  sub_2573068E8();
  *(void *)&v36[v85] = sub_2573213F8();
  uint64_t v86 = (char *)OBJC_IVAR___NHOSmartStackActionIntent__actionID;
  sub_2573214B8();
  uint64_t v42 = v34;
  uint64_t v43 = v106;
  v95(v42, 1, 1, v106);
  unint64_t v110 = 0;
  unint64_t v111 = 0;
  uint64_t v45 = v99;
  uint64_t v44 = v100;
  v99(v91, 1, 1, v100);
  unint64_t v46 = v92;
  v105(v92, 1, 1, v108);
  uint64_t v47 = v89;
  v41(v89, v40, v102);
  uint64_t v48 = v94;
  uint64_t v49 = sub_257321408();
  id v50 = v103;
  *(void *)&v86[(void)v103] = v49;
  uint64_t v86 = (char *)OBJC_IVAR___NHOSmartStackActionIntent__actionName;
  sub_2573214B8();
  uint64_t v51 = v43;
  id v52 = v95;
  v95(v48, 1, 1, v51);
  unint64_t v110 = 0;
  unint64_t v111 = 0;
  char v53 = v91;
  v45(v91, 1, 1, v44);
  v105(v46, 1, 1, v108);
  int v54 = v47;
  uint64_t v55 = v47;
  uint64_t v56 = v102;
  v98(v55, v104, v102);
  int v57 = v48;
  *(void *)&v86[(void)v50] = sub_257321408();
  uint64_t v86 = (char *)OBJC_IVAR___NHOSmartStackActionIntent__icon;
  sub_2573214B8();
  v52(v48, 1, 1, v106);
  unint64_t v110 = 0;
  unint64_t v111 = 0;
  v99(v53, 1, 1, v100);
  v105(v46, 1, 1, v108);
  uint64_t v58 = v98;
  v98(v54, v104, v56);
  uint64_t v59 = v54;
  *(void *)&v86[(void)v103] = sub_257321408();
  uint64_t v83 = OBJC_IVAR___NHOSmartStackActionIntent__useHomeKitRecommendations;
  uint64_t v82 = __swift_instantiateConcreteTypeFromMangledName(&qword_269FE5650);
  sub_2573214B8();
  v52(v57, 1, 1, v106);
  LOBYTE(v110) = 2;
  uint64_t v85 = sub_257321918();
  uint64_t v60 = *(void *)(v85 - 8);
  uint64_t v84 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v60 + 56);
  uint64_t v86 = (char *)(v60 + 56);
  v84(v88, 1, 1, v85);
  uint64_t v61 = v105;
  v105(v46, 1, 1, v108);
  uint64_t v62 = v102;
  v58(v59, v104, v102);
  *(void *)((char *)v103 + v83) = sub_257321418();
  uint64_t v83 = OBJC_IVAR___NHOSmartStackActionIntent__accessoriesAndScenes;
  uint64_t v82 = __swift_instantiateConcreteTypeFromMangledName(&qword_269FE5658);
  sub_2573214B8();
  uint64_t v63 = v95;
  v95(v57, 1, 1, v106);
  unint64_t v110 = 0;
  unint64_t v111 = 0;
  uint64_t v64 = v91;
  v99(v91, 1, 1, v100);
  v61(v92, 1, 1, v108);
  long long v65 = v98;
  v98(v59, v104, v62);
  uint64_t v66 = v94;
  *(void *)((char *)v103 + v83) = sub_257321408();
  uint64_t v83 = OBJC_IVAR___NHOSmartStackActionIntent__requestConfirmationText;
  sub_2573214B8();
  v63(v66, 1, 1, v106);
  unint64_t v110 = 0;
  unint64_t v111 = 0;
  v99(v64, 1, 1, v100);
  uint64_t v67 = v108;
  unsigned int v68 = v105;
  v105(v92, 1, 1, v108);
  uint64_t v69 = v104;
  uint64_t v70 = v102;
  v65(v89, v104, v102);
  uint64_t v71 = v94;
  *(void *)((char *)v103 + v83) = sub_257321408();
  uint64_t v83 = OBJC_IVAR___NHOSmartStackActionIntent__requestConfirmationIcon;
  sub_2573214B8();
  v95(v71, 1, 1, v106);
  unint64_t v110 = 0;
  unint64_t v111 = 0;
  v99(v64, 1, 1, v100);
  uint64_t v72 = v92;
  v68(v92, 1, 1, v67);
  unint64_t v73 = v89;
  uint64_t v74 = v98;
  v98(v89, v69, v70);
  uint64_t v75 = v94;
  uint64_t v76 = sub_257321408();
  uint64_t v77 = (char *)v103;
  *(void *)((char *)v103 + v83) = v76;
  uint64_t v78 = OBJC_IVAR___NHOSmartStackActionIntent__isSmartStack;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269FE5660);
  sub_2573214B8();
  v95(v75, 1, 1, v106);
  LOBYTE(v110) = 2;
  v84(v88, 1, 1, v85);
  v105(v72, 1, 1, v108);
  v74(v73, v104, v102);
  *(void *)&v77[v78] = sub_257321418();

  v109.receiver = v77;
  v109.super_class = ObjectType;
  id v79 = objc_msgSendSuper2(&v109, sel_init);
  unint64_t v110 = 0xD000000000000024;
  unint64_t v111 = 0x80000002573244C0;
  id v80 = v79;
  swift_retain();
  sub_2573213D8();
  swift_release();
  LOBYTE(v110) = 1;
  swift_retain();
  sub_2573213D8();

  swift_release();
  return v80;
}

unint64_t sub_2573068E8()
{
  unint64_t result = qword_269FE5648;
  if (!qword_269FE5648)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269FE5648);
  }
  return result;
}

uint64_t NHOSmartStackActionIntent.perform()(uint64_t a1)
{
  *(void *)(v1 + 24) = a1;
  return MEMORY[0x270FA2498](sub_257306980, 0, 0);
}

uint64_t sub_257306980()
{
  uint64_t v9 = v0;
  if (qword_269FE52B8 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_257321708();
  __swift_project_value_buffer(v1, (uint64_t)qword_269FE5518);
  uint64_t v2 = sub_2573216E8();
  os_log_type_t v3 = sub_2573219E8();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    uint64_t v5 = swift_slowAlloc();
    uint64_t v8 = v5;
    *(_DWORD *)uint64_t v4 = 136315138;
    *(void *)(v0 + 16) = sub_2572FB6C4(0x286D726F66726570, 0xE900000000000029, &v8);
    sub_257321A68();
    _os_log_impl(&dword_2572F7000, v2, v3, "%s Perform method is only supported on watchOS", v4, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x25A2B3D30](v5, -1, -1);
    MEMORY[0x25A2B3D30](v4, -1, -1);
  }

  sub_2573213A8();
  uint64_t v6 = *(uint64_t (**)(void))(v0 + 8);
  return v6();
}

id NHOSmartStackActionIntent.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_257306C50@<X0>(uint64_t a1@<X8>)
{
  if (qword_269FE52F0 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_2573214C8();
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)qword_269FE55B0);
  swift_beginAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t sub_257306D10(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_257306DBC;
  v3[3] = a1;
  return MEMORY[0x270FA2498](sub_257306980, 0, 0);
}

uint64_t sub_257306DBC()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_257306EB0()
{
  uint64_t v1 = sub_257307464(&qword_269FE56D8);

  return MEMORY[0x270EE0D28](v0, v1);
}

unint64_t sub_257306F00()
{
  unint64_t result = qword_269FE5670;
  if (!qword_269FE5670)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269FE5670);
  }
  return result;
}

unint64_t sub_257306F58()
{
  unint64_t result = qword_269FE5678;
  if (!qword_269FE5678)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269FE5678);
  }
  return result;
}

unint64_t sub_257306FB0()
{
  unint64_t result = qword_269FE5680;
  if (!qword_269FE5680)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269FE5680);
  }
  return result;
}

unint64_t sub_257307008()
{
  unint64_t result = qword_269FE5688;
  if (!qword_269FE5688)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269FE5688);
  }
  return result;
}

uint64_t sub_25730705C()
{
  return MEMORY[0x263F8D380];
}

unint64_t sub_25730706C()
{
  unint64_t result = qword_269FE5690;
  if (!qword_269FE5690)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269FE5690);
  }
  return result;
}

unint64_t sub_2573070C4()
{
  unint64_t result = qword_269FE5698;
  if (!qword_269FE5698)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269FE5698);
  }
  return result;
}

unint64_t sub_25730711C()
{
  unint64_t result = qword_269FE56A0;
  if (!qword_269FE56A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269FE56A0);
  }
  return result;
}

unint64_t sub_257307174()
{
  unint64_t result = qword_269FE56A8;
  if (!qword_269FE56A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269FE56A8);
  }
  return result;
}

uint64_t sub_2573071C8()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_25730721C()
{
  unint64_t result = qword_269FE56B0;
  if (!qword_269FE56B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269FE56B0);
  }
  return result;
}

unint64_t sub_257307274()
{
  unint64_t result = qword_269FE56B8;
  if (!qword_269FE56B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269FE56B8);
  }
  return result;
}

unint64_t sub_2573072CC()
{
  unint64_t result = qword_269FE56C0;
  if (!qword_269FE56C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269FE56C0);
  }
  return result;
}

uint64_t sub_257307320()
{
  return sub_257307914(&qword_269FE56C8, &qword_269FE56D0);
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

uint64_t sub_2573073A4()
{
  return sub_257307464(&qword_269FE56D8);
}

uint64_t type metadata accessor for NHOSmartStackActionIntent()
{
  return self;
}

uint64_t sub_2573073FC()
{
  return sub_257307464(&qword_269FE56E0);
}

uint64_t sub_257307430()
{
  return sub_257307464((unint64_t *)&unk_269FE56E8);
}

uint64_t sub_257307464(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for NHOSmartStackActionIntent();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_2573074A4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_2573074C0()
{
  return swift_getOpaqueTypeConformance2();
}

double sub_25730752C@<D0>(_OWORD *a1@<X8>)
{
  return sub_257300D3C(a1);
}

uint64_t sub_25730754C()
{
  return sub_257300D90();
}

double sub_25730756C@<D0>(_OWORD *a1@<X8>)
{
  return sub_257300D3C(a1);
}

uint64_t sub_25730758C()
{
  return sub_257300D90();
}

uint64_t sub_2573075B0()
{
  return sub_257305894();
}

double sub_2573075D0@<D0>(_OWORD *a1@<X8>)
{
  return sub_257300D3C(a1);
}

uint64_t sub_2573075F0()
{
  return sub_257300D90();
}

double sub_257307610@<D0>(_OWORD *a1@<X8>)
{
  return sub_257300D3C(a1);
}

uint64_t sub_257307630()
{
  return sub_257300D90();
}

double sub_257307650@<D0>(_OWORD *a1@<X8>)
{
  return sub_257300D3C(a1);
}

uint64_t sub_257307670()
{
  return sub_257300D90();
}

double sub_2573076A0@<D0>(_OWORD *a1@<X8>)
{
  return sub_257300D3C(a1);
}

uint64_t sub_2573076C0()
{
  return sub_257300D90();
}

double sub_2573076E0@<D0>(_OWORD *a1@<X8>)
{
  return sub_257300D3C(a1);
}

uint64_t sub_257307700()
{
  return sub_257300D90();
}

uint64_t sub_257307724()
{
  return sub_257305894();
}

uint64_t getEnumTagSinglePayload for NHOSmartStackAction(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFC) {
    goto LABEL_17;
  }
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
    if (v4) {
      return (*a1 | (v4 << 8)) - 4;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 4;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 4;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 5;
  int v8 = v6 - 5;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for NHOSmartStackAction(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x2573078A0);
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

ValueMetadata *type metadata accessor for NHOSmartStackAction()
{
  return &type metadata for NHOSmartStackAction;
}

uint64_t sub_2573078D8()
{
  return sub_257307914((unint64_t *)&qword_269FE56F8, &qword_269FE5700);
}

uint64_t sub_257307914(unint64_t *a1, uint64_t *a2)
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

uint64_t sub_257307958(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269FE5710);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

const char *NHOFeatureFlags.domain.getter()
{
  return "NanoHome";
}

const char *NHOFeatureFlags.feature.getter()
{
  return "EagleRoost";
}

uint64_t NHOFeatureFlags.isEnabled.getter()
{
  return sub_257307B38((uint64_t)&type metadata for NHOFeatureFlags, (uint64_t (*)(void))sub_257307A08);
}

unint64_t sub_257307A08()
{
  unint64_t result = qword_269FE5720;
  if (!qword_269FE5720)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269FE5720);
  }
  return result;
}

uint64_t static NHOFeatureFlags.== infix(_:_:)()
{
  return 1;
}

uint64_t NHOFeatureFlags.hash(into:)()
{
  return sub_257321C58();
}

uint64_t sub_257307A90()
{
  return 1;
}

uint64_t sub_257307A9C()
{
  return sub_257321C58();
}

const char *sub_257307AC8()
{
  return "NanoHome";
}

const char *sub_257307ADC()
{
  return "EagleRoost";
}

const char *RestrictedGuestFeatureFlags.domain.getter()
{
  return "Home";
}

const char *RestrictedGuestFeatureFlags.feature.getter()
{
  return "RestrictedGuest";
}

uint64_t RestrictedGuestFeatureFlags.isEnabled.getter()
{
  return sub_257307B38((uint64_t)&type metadata for RestrictedGuestFeatureFlags, (uint64_t (*)(void))sub_257307B84);
}

uint64_t sub_257307B38(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v5 = a1;
  uint64_t v6 = a2();
  char v2 = sub_257321648();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v4);
  return v2 & 1;
}

unint64_t sub_257307B84()
{
  unint64_t result = qword_269FE5728;
  if (!qword_269FE5728)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269FE5728);
  }
  return result;
}

uint64_t static RestrictedGuestFeatureFlags.== infix(_:_:)()
{
  return 1;
}

uint64_t _s15NanoHomeIntents15NHOFeatureFlagsO9hashValueSivg_0()
{
  return sub_257321C68();
}

uint64_t sub_257307C28()
{
  return sub_257321C68();
}

const char *sub_257307C68()
{
  return "Home";
}

const char *sub_257307C7C()
{
  return "RestrictedGuest";
}

uint64_t sub_257307C90()
{
  int v3 = &type metadata for NHOFeatureFlags;
  unint64_t v4 = sub_257307A08();
  char v0 = sub_257321648();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v2);
  return v0 & 1;
}

id NHOFeatureFlagsObjC.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

id NHOFeatureFlagsObjC.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for NHOFeatureFlagsObjC();
  return objc_msgSendSuper2(&v2, sel_init);
}

uint64_t type metadata accessor for NHOFeatureFlagsObjC()
{
  return self;
}

id NHOFeatureFlagsObjC.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for NHOFeatureFlagsObjC();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

unint64_t sub_257307E34()
{
  unint64_t result = qword_269FE5730;
  if (!qword_269FE5730)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269FE5730);
  }
  return result;
}

unint64_t sub_257307E8C()
{
  unint64_t result = qword_269FE5738;
  if (!qword_269FE5738)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269FE5738);
  }
  return result;
}

uint64_t sub_257307EEC()
{
  return 0;
}

ValueMetadata *type metadata accessor for NHOFeatureFlags()
{
  return &type metadata for NHOFeatureFlags;
}

uint64_t _s15NanoHomeIntents15NHOFeatureFlagsOwet_0(unsigned int *a1, int a2)
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

unsigned char *_s15NanoHomeIntents15NHOFeatureFlagsOwst_0(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x257307FF0);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for RestrictedGuestFeatureFlags()
{
  return &type metadata for RestrictedGuestFeatureFlags;
}

uint64_t method lookup function for NHOFeatureFlagsObjC(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for NHOFeatureFlagsObjC);
}

uint64_t dispatch thunk of static NHOFeatureFlagsObjC.eagleRoostFeatureFlagIsEnabled()()
{
  return (*(uint64_t (**)(void))(v0 + 80))();
}

uint64_t Color.init(hex:)(uint64_t a1, unint64_t a2)
{
  v17[1] = *MEMORY[0x263EF8340];
  if ((sub_257321898() & 1) == 0) {
    goto LABEL_5;
  }
  unint64_t v4 = sub_257321868();
  uint64_t v5 = sub_257308250(v4, a1, a2);
  uint64_t v7 = v6;
  uint64_t v9 = v8;
  uint64_t v11 = v10;
  swift_bridgeObjectRelease();
  MEMORY[0x25A2B3380](v5, v7, v9, v11);
  swift_bridgeObjectRelease();
  if (sub_257321858() != 8)
  {
LABEL_5:
    swift_bridgeObjectRelease();
    return _sSo11HMActionSetC15NanoHomeIntentsE15backupTintColor7SwiftUI0H0Vvg_0();
  }
  id v12 = objc_allocWithZone(MEMORY[0x263F08B08]);
  uint64_t v13 = (void *)sub_2573217E8();
  swift_bridgeObjectRelease();
  id v14 = objc_msgSend(v12, sel_initWithString_, v13);

  v17[0] = 0;
  if (!objc_msgSend(v14, sel_scanHexLongLong_, v17))
  {

    return _sSo11HMActionSetC15NanoHomeIntentsE15backupTintColor7SwiftUI0H0Vvg_0();
  }
  uint64_t v15 = MEMORY[0x25A2B32A0](objc_msgSend(objc_allocWithZone(MEMORY[0x263F825C8]), sel_initWithRed_green_blue_alpha_, (double)BYTE3(v17[0]) / 255.0, (double)BYTE2(v17[0]) / 255.0, (double)BYTE1(v17[0]) / 255.0, (double)LOBYTE(v17[0]) / 255.0));

  return v15;
}

uint64_t sub_257308250(unint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v3 = HIBYTE(a3) & 0xF;
  if ((a3 & 0x2000000000000000) == 0) {
    uint64_t v3 = a2 & 0xFFFFFFFFFFFFLL;
  }
  if (4 * v3 < a1 >> 14) {
    __break(1u);
  }
  return MEMORY[0x270F9D8F0]();
}

Swift::String __swiftcall Color.toHexString()()
{
  sub_257308450();
  swift_retain();
  uint64_t v0 = (void *)sub_257321A08();
  id v1 = objc_msgSend(v0, sel_CGColor);
  uint64_t v2 = sub_257321988();

  if (!v2)
  {
    float v13 = 255.0;
    float v12 = 255.0;
    float v11 = 255.0;
    float v10 = 255.0;
    goto LABEL_8;
  }
  unint64_t v5 = *(void *)(v2 + 16);
  if (!v5)
  {
    __break(1u);
    goto LABEL_10;
  }
  if (v5 == 1)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  if (v5 < 3)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  if (v5 == 3)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  double v6 = *(double *)(v2 + 32);
  double v7 = *(double *)(v2 + 40);
  double v8 = *(double *)(v2 + 48);
  double v9 = *(double *)(v2 + 56);
  swift_bridgeObjectRelease();
  float v10 = v6 * 255.0;
  float v11 = v7 * 255.0;
  float v12 = v8 * 255.0;
  float v13 = v9 * 255.0;
LABEL_8:
  __swift_instantiateConcreteTypeFromMangledName(&qword_269FE5508);
  uint64_t v14 = swift_allocObject();
  *(_OWORD *)(v14 + 16) = xmmword_257323150;
  uint64_t v15 = lroundf(v10);
  uint64_t v16 = MEMORY[0x263F8D6C8];
  uint64_t v17 = MEMORY[0x263F8D750];
  *(void *)(v14 + 56) = MEMORY[0x263F8D6C8];
  *(void *)(v14 + 64) = v17;
  *(void *)(v14 + 32) = v15;
  uint64_t v18 = lroundf(v11);
  *(void *)(v14 + 96) = v16;
  *(void *)(v14 + 104) = v17;
  *(void *)(v14 + 72) = v18;
  uint64_t v19 = lroundf(v12);
  *(void *)(v14 + 136) = v16;
  *(void *)(v14 + 144) = v17;
  *(void *)(v14 + 112) = v19;
  uint64_t v20 = lroundf(v13);
  *(void *)(v14 + 176) = v16;
  *(void *)(v14 + 184) = v17;
  *(void *)(v14 + 152) = v20;
  uint64_t v21 = sub_257321808();
  uint64_t v23 = v22;

  uint64_t v3 = v21;
  unint64_t v4 = v23;
LABEL_13:
  result._object = v4;
  result._countAndFlagsBits = v3;
  return result;
}

unint64_t sub_257308450()
{
  unint64_t result = qword_269FE5740;
  if (!qword_269FE5740)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_269FE5740);
  }
  return result;
}

id *sub_257308490()
{
  type metadata accessor for HomeManagerActor();
  swift_allocObject();
  unint64_t result = sub_257308500();
  qword_269FE7950 = (uint64_t)result;
  return result;
}

id *sub_2573084CC()
{
  return sub_257308500();
}

id *sub_257308500()
{
  swift_defaultActor_initialize();
  *(unsigned char *)(v0 + 120) = 0;
  *(void *)(v0 + 128) = MEMORY[0x263F8EE78];
  sub_2573001D4(0, &qword_269FE57C8);
  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  swift_retain();
  id v2 = objc_msgSend(ObjCClassFromMetadata, sel_defaultPrivateConfiguration);
  objc_msgSend(v2, sel_setCachePolicy_, 0);
  objc_msgSend(v2, sel_setDiscretionary_, 0);
  objc_msgSend(v2, sel_setAdaptive_, 1);
  *(void *)(v0 + 112) = objc_msgSend(objc_allocWithZone(MEMORY[0x263F0E3C0]), sel_initWithConfiguration_, v2);
  swift_release();
  v5.receiver = (id)v0;
  v5.super_class = (Class)type metadata accessor for HomeManagerActor();
  uint64_t v3 = (id *)objc_msgSendSuper2(&v5, sel_init);
  objc_msgSend(v3[14], sel_setDelegate_, v3);

  return v3;
}

uint64_t HomeManagerActor.deinit()
{
  swift_bridgeObjectRelease();
  swift_defaultActor_destroy();
  return v0;
}

uint64_t HomeManagerActor.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  swift_defaultActor_destroy();

  return MEMORY[0x270FA2418](v0);
}

uint64_t HomeManagerActor.unownedExecutor.getter()
{
  return v0;
}

uint64_t sub_2573086B8()
{
  return v0;
}

uint64_t static HomeManagerActor.homeManager.getter()
{
  id v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 24) = v1;
  uint64_t v2 = sub_2573001D4(0, (unint64_t *)&unk_269FE5758);
  *id v1 = v0;
  v1[1] = sub_2573087B8;
  return MEMORY[0x270FA2318](v0 + 16, 0, 0, 0x616E614D656D6F68, 0xEB00000000726567, sub_2573088CC, 0, v2);
}

uint64_t sub_2573087B8()
{
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_2573088B4, 0, 0);
}

uint64_t sub_2573088B4()
{
  return (*(uint64_t (**)(void))(v0 + 8))(*(void *)(v0 + 16));
}

uint64_t sub_2573088CC(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269FE5800);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(void *)(v3 + 64);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_269FE57D0);
  MEMORY[0x270FA5388](v5 - 8);
  double v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_257321958();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v7, 1, 1, v8);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))((char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v2);
  unint64_t v9 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = 0;
  *(void *)(v10 + 24) = 0;
  (*(void (**)(unint64_t, char *, uint64_t))(v3 + 32))(v10 + v9, (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v2);
  sub_257308EB0((uint64_t)v7, (uint64_t)&unk_269FE5810, v10);
  return swift_release();
}

uint64_t sub_257308A94(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[6] = a4;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_269FE5800);
  v4[7] = v5;
  uint64_t v6 = *(void *)(v5 - 8);
  v4[8] = v6;
  v4[9] = *(void *)(v6 + 64);
  v4[10] = swift_task_alloc();
  v4[11] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_257308B70, 0, 0);
}

uint64_t sub_257308B70()
{
  if (qword_269FE5300 != -1) {
    swift_once();
  }
  uint64_t v1 = v0[10];
  uint64_t v2 = v0[11];
  uint64_t v3 = v0[8];
  uint64_t v4 = v0[6];
  uint64_t v5 = v0[7];
  uint64_t v6 = qword_269FE7950;
  v0[12] = qword_269FE7950;
  double v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16);
  v7(v2, v4, v5);
  v7(v1, v2, v5);
  unint64_t v8 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v9 = swift_allocObject();
  v0[13] = v9;
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v3 + 32))(v9 + v8, v2, v5);
  return MEMORY[0x270FA2498](sub_257308CA4, v6, 0);
}

uint64_t sub_257308CA4()
{
  uint64_t v1 = v0[12];
  if (*(unsigned char *)(v1 + 120) == 1)
  {
    uint64_t v2 = *(void **)(v1 + 112);
    v0[5] = v2;
    id v3 = v2;
    sub_257321938();
  }
  else
  {
    uint64_t v4 = v0[13];
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = sub_257309D98;
    *(void *)(v5 + 24) = v4;
    uint64_t v6 = (void *)(v1 + 128);
    swift_beginAccess();
    double v7 = *(void **)(v1 + 128);
    swift_retain();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *(void *)(v1 + 128) = v7;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      double v7 = sub_2573093C0(0, v7[2] + 1, 1, v7);
      *uint64_t v6 = v7;
    }
    unint64_t v10 = v7[2];
    unint64_t v9 = v7[3];
    if (v10 >= v9 >> 1)
    {
      double v7 = sub_2573093C0((void *)(v9 > 1), v10 + 1, 1, v7);
      *uint64_t v6 = v7;
    }
    v7[2] = v10 + 1;
    uint64_t v11 = &v7[2 * v10];
    v11[4] = sub_257309E0C;
    v11[5] = v5;
    swift_endAccess();
  }
  swift_release();
  (*(void (**)(void, void))(v0[8] + 8))(v0[10], v0[7]);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v12 = (uint64_t (*)(void))v0[1];
  return v12();
}

uint64_t sub_257308E68(void *a1)
{
  id v1 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269FE5800);
  return sub_257321938();
}

uint64_t sub_257308EB0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_257321958();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_257321948();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_25730993C(a1);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_257321928();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_257309058(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 16) = a4;
  return MEMORY[0x270FA2498](sub_257309078, a4, 0);
}

uint64_t sub_257309078()
{
  sub_2573090D8();
  id v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_2573090D8()
{
  *(unsigned char *)(v0 + 120) = 1;
  swift_beginAccess();
  uint64_t v1 = *(void *)(v0 + 128);
  uint64_t v2 = *(void *)(v1 + 16);
  if (v2)
  {
    uint64_t v3 = *(void *)(v0 + 112);
    swift_bridgeObjectRetain();
    uint64_t v4 = v1 + 40;
    do
    {
      uint64_t v5 = *(void (**)(uint64_t *))(v4 - 8);
      uint64_t v7 = v3;
      swift_retain();
      v5(&v7);
      swift_release();
      v4 += 16;
      --v2;
    }
    while (v2);
    swift_bridgeObjectRelease();
  }
  *(void *)(v0 + 128) = MEMORY[0x263F8EE78];
  return swift_bridgeObjectRelease();
}

uint64_t sub_2573091EC(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_2573092C8;
  return v6(a1);
}

uint64_t sub_2573092C8()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

void *sub_2573093C0(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = a4[3];
  uint64_t v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v7 + 0x4000000000000000 >= 0)
  {
    uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      uint64_t v7 = a2;
    }
LABEL_8:
    uint64_t v8 = a4[2];
    if (v7 <= v8) {
      uint64_t v9 = a4[2];
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_269FE5818);
      unint64_t v10 = (void *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 17;
      }
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 4);
      float v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      unint64_t v10 = (void *)MEMORY[0x263F8EE78];
      float v13 = (void *)(MEMORY[0x263F8EE78] + 32);
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[2 * v8 + 4]) {
          memmove(v13, a4 + 4, 16 * v8);
        }
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_2573094D0(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_2573094D0(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_269FE5820);
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_257321BE8();
  __break(1u);
  return result;
}

uint64_t _s15NanoHomeIntents0B12ManagerActorC04homeD14DidUpdateHomesyySo06HMHomeD0CF_0()
{
  uint64_t v1 = v0;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269FE57D0);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)v14 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_257321958();
  uint64_t v6 = *(void *)(v5 - 8);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56))(v4, 1, 1, v5);
  uint64_t v7 = (void *)swift_allocObject();
  v7[2] = 0;
  v7[3] = 0;
  v7[4] = v1;
  int v8 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5);
  swift_retain();
  if (v8 == 1)
  {
    sub_25730993C((uint64_t)v4);
    uint64_t v9 = 0;
    uint64_t v10 = 0;
  }
  else
  {
    sub_257321948();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v4, v5);
    if (v7[2])
    {
      swift_getObjectType();
      swift_unknownObjectRetain();
      uint64_t v9 = sub_257321928();
      uint64_t v10 = v11;
      swift_unknownObjectRelease();
    }
    else
    {
      uint64_t v9 = 0;
      uint64_t v10 = 0;
    }
  }
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = &unk_269FE57E0;
  *(void *)(v12 + 24) = v7;
  if (v10 | v9)
  {
    v14[0] = 0;
    v14[1] = 0;
    v14[2] = v9;
    v14[3] = v10;
  }
  swift_task_create();
  return swift_release();
}

uint64_t type metadata accessor for HomeManagerActor()
{
  return self;
}

uint64_t method lookup function for HomeManagerActor(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for HomeManagerActor);
}

uint64_t sub_257309854()
{
  swift_unknownObjectRelease();
  swift_release();

  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_257309894()
{
  uint64_t v2 = *(void *)(v0 + 32);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_257309E38;
  v3[2] = v2;
  return MEMORY[0x270FA2498](sub_257309078, v2, 0);
}

uint64_t sub_25730993C(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269FE57D0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_25730999C()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_2573099D4(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_257309E38;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_269FE57E8 + dword_269FE57E8);
  return v6(a1, v4);
}

uint64_t sub_257309A8C(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_257306DBC;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_269FE57E8 + dword_269FE57E8);
  return v6(a1, v4);
}

uint64_t sub_257309B44()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_269FE5800);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 32) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_unknownObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return MEMORY[0x270FA0238](v0, v5, v6);
}

uint64_t sub_257309C14(uint64_t a1)
{
  uint64_t v4 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_269FE5800) - 8);
  uint64_t v5 = *(void *)(v1 + 16);
  uint64_t v6 = *(void *)(v1 + 24);
  uint64_t v7 = v1 + ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  *uint64_t v8 = v2;
  v8[1] = sub_257306DBC;
  return sub_257308A94(a1, v5, v6, v7);
}

uint64_t sub_257309D04()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_269FE5800);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return MEMORY[0x270FA0238](v0, v5, v6);
}

uint64_t sub_257309D98(void *a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_269FE5800);

  return sub_257308E68(a1);
}

uint64_t sub_257309E0C(void *a1)
{
  return (*(uint64_t (**)(void))(v1 + 16))(*a1);
}

uint64_t static HMHome.home(homeID:fallbackToCurrentHome:)(uint64_t a1, uint64_t a2, char a3)
{
  *(unsigned char *)(v3 + 104) = a3;
  *(void *)(v3 + 80) = a1;
  *(void *)(v3 + 88) = a2;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v3 + 96) = v4;
  uint64_t v5 = sub_2573001D4(0, (unint64_t *)&unk_269FE5758);
  *uint64_t v4 = v3;
  v4[1] = sub_257309F40;
  return MEMORY[0x270FA2318](v3 + 16, 0, 0, 0x616E614D656D6F68, 0xEB00000000726567, sub_2573088CC, 0, v5);
}

uint64_t sub_257309F40()
{
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_25730A03C, 0, 0);
}

uint64_t sub_25730A03C()
{
  uint64_t v42 = v0;
  uint64_t v1 = *(uint64_t **)(v0 + 88);
  uint64_t v2 = *(void **)(v0 + 16);
  if (v1)
  {
    uint64_t v4 = (uint64_t *)(v0 + 80);
    uint64_t v3 = *(void *)(v0 + 80);
    swift_bridgeObjectRetain();
    id v5 = objc_msgSend(v2, sel_homes);
    sub_2573001D4(0, &qword_269FE5898);
    unint64_t v6 = sub_2573218D8();

    swift_bridgeObjectRetain();
    unint64_t v7 = sub_25730CE10(v6, v3, v1);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v7 >> 62)
    {
      uint64_t v8 = (uint64_t *)(v0 + 64);
      if (sub_257321BA8())
      {
LABEL_4:
        if ((v7 & 0xC000000000000001) != 0)
        {
          id v9 = (id)MEMORY[0x25A2B3680](0, v7);
        }
        else
        {
          if (!*(void *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10))
          {
            __break(1u);
LABEL_34:
            swift_once();
LABEL_8:
            uint64_t v10 = sub_257321708();
            __swift_project_value_buffer(v10, (uint64_t)qword_269FE5560);
            id v11 = v5;
            swift_bridgeObjectRetain();
            id v12 = v11;
            float v13 = sub_2573216E8();
            os_log_type_t v14 = sub_2573219E8();
            if (os_log_type_enabled(v13, v14))
            {
              uint64_t v37 = *v4;
              uint64_t v15 = swift_slowAlloc();
              uint64_t v38 = swift_slowAlloc();
              v41[0] = v38;
              *(_DWORD *)uint64_t v15 = 136315650;
              *(void *)(v0 + 40) = sub_2572FB6C4(0xD000000000000023, 0x8000000257324750, v41);
              sub_257321A68();
              *(_WORD *)(v15 + 12) = 2080;
              uint64_t v40 = v2;
              id v16 = objc_msgSend(v12, sel_name);
              uint64_t v17 = sub_2573217F8();
              unint64_t v19 = v18;

              *(void *)(v0 + 48) = sub_2572FB6C4(v17, v19, v41);
              sub_257321A68();
              swift_bridgeObjectRelease();

              *(_WORD *)(v15 + 22) = 2080;
              swift_bridgeObjectRetain();
              *(void *)(v0 + 56) = sub_2572FB6C4(v37, (unint64_t)v1, v41);
              sub_257321A68();
              swift_bridgeObjectRelease_n();
              _os_log_impl(&dword_2572F7000, v13, v14, "%s: home %s found for homeID: %s", (uint8_t *)v15, 0x20u);
              swift_arrayDestroy();
              MEMORY[0x25A2B3D30](v38, -1, -1);
              MEMORY[0x25A2B3D30](v15, -1, -1);
            }
            else
            {

              swift_bridgeObjectRelease_n();
            }
            goto LABEL_29;
          }
          id v9 = *(id *)(v7 + 32);
        }
        id v5 = v9;
        swift_bridgeObjectRelease();
        if (qword_269FE52D0 == -1) {
          goto LABEL_8;
        }
        goto LABEL_34;
      }
    }
    else
    {
      uint64_t v8 = (uint64_t *)(v0 + 64);
      if (*(void *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
        goto LABEL_4;
      }
    }
    swift_bridgeObjectRelease();
    if (qword_269FE52D0 != -1) {
      swift_once();
    }
    uint64_t v30 = sub_257321708();
    __swift_project_value_buffer(v30, (uint64_t)qword_269FE5560);
    swift_bridgeObjectRetain();
    uint64_t v26 = sub_2573216E8();
    os_log_type_t v31 = sub_2573219E8();
    if (os_log_type_enabled(v26, v31))
    {
      uint64_t type = *v4;
      uint64_t v32 = v8;
      uint64_t v33 = swift_slowAlloc();
      uint64_t v34 = swift_slowAlloc();
      *(_DWORD *)uint64_t v33 = 136315394;
      v41[0] = v34;
      *uint64_t v32 = sub_2572FB6C4(0xD000000000000023, 0x8000000257324750, v41);
      sub_257321A68();
      *(_WORD *)(v33 + 12) = 2080;
      swift_bridgeObjectRetain();
      *(void *)(v0 + 72) = sub_2572FB6C4(type, (unint64_t)v1, v41);
      sub_257321A68();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_2572F7000, v26, v31, "%s: home with ID %s not found, returning no home", (uint8_t *)v33, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x25A2B3D30](v34, -1, -1);
      MEMORY[0x25A2B3D30](v33, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
LABEL_28:

    id v12 = 0;
    goto LABEL_29;
  }
  if (*(unsigned char *)(v0 + 104) != 1)
  {
    if (qword_269FE52D0 != -1) {
      swift_once();
    }
    uint64_t v25 = sub_257321708();
    __swift_project_value_buffer(v25, (uint64_t)qword_269FE5560);
    uint64_t v26 = sub_2573216E8();
    os_log_type_t v27 = sub_2573219E8();
    if (os_log_type_enabled(v26, v27))
    {
      uint64_t v28 = (uint8_t *)swift_slowAlloc();
      uint64_t v29 = swift_slowAlloc();
      v41[0] = v29;
      *(_DWORD *)uint64_t v28 = 136315138;
      *(void *)(v0 + 24) = sub_2572FB6C4(0xD000000000000023, 0x8000000257324750, v41);
      sub_257321A68();
      _os_log_impl(&dword_2572F7000, v26, v27, "%s: no homeID, returning no home", v28, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x25A2B3D30](v29, -1, -1);
      MEMORY[0x25A2B3D30](v28, -1, -1);
    }

    goto LABEL_28;
  }
  if (qword_269FE52D0 != -1) {
    swift_once();
  }
  uint64_t v20 = sub_257321708();
  __swift_project_value_buffer(v20, (uint64_t)qword_269FE5560);
  uint64_t v21 = sub_2573216E8();
  os_log_type_t v22 = sub_2573219E8();
  if (os_log_type_enabled(v21, v22))
  {
    uint64_t v23 = (uint8_t *)swift_slowAlloc();
    uint64_t v24 = swift_slowAlloc();
    v41[0] = v24;
    *(_DWORD *)uint64_t v23 = 136315138;
    *(void *)(v0 + 32) = sub_2572FB6C4(0xD000000000000023, 0x8000000257324750, v41);
    sub_257321A68();
    _os_log_impl(&dword_2572F7000, v21, v22, "%s: no homeID, returning manager.currentHome", v23, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x25A2B3D30](v24, -1, -1);
    MEMORY[0x25A2B3D30](v23, -1, -1);
  }

  id v12 = objc_msgSend(v2, sel_currentHome);
LABEL_29:
  uint64_t v35 = *(uint64_t (**)(id))(v0 + 8);
  return v35(v12);
}

uint64_t HMHome.pickableEnergyForecastIntents.getter()
{
  v1[8] = v0;
  uint64_t v2 = sub_2573215A8();
  v1[9] = v2;
  v1[10] = *(void *)(v2 - 8);
  v1[11] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_25730A938, 0, 0);
}

uint64_t sub_25730A938()
{
  id receiver = v0[4].receiver;
  uint64_t v2 = (objc_class *)type metadata accessor for NHOHomeUserCapabilities();
  id v3 = objc_allocWithZone(v2);
  uint64_t v4 = OBJC_IVAR___NHOHomeUserCapabilities_logger;
  uint64_t v5 = qword_269FE52E0;
  id v6 = receiver;
  unint64_t v7 = v3;
  if (v5 != -1) {
    swift_once();
  }
  id v8 = v0[4].receiver;
  uint64_t v9 = sub_257321708();
  uint64_t v10 = __swift_project_value_buffer(v9, (uint64_t)qword_269FE5590);
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(*(void *)(v9 - 8) + 16))(&v7[v4], v10, v9);
  v7[OBJC_IVAR___NHOHomeUserCapabilities_isOnboarded] = 0;
  v7[OBJC_IVAR___NHOHomeUserCapabilities_hasMockData] = 0;
  *(void *)&v7[OBJC_IVAR___NHOHomeUserCapabilities_home] = v8;
  id v11 = v8;

  v0[1].id receiver = v7;
  v0[1].super_class = v2;
  v0[6].id receiver = objc_msgSendSuper2(v0 + 1, sel_init);

  id v12 = (objc_class *)swift_task_alloc();
  v0[6].super_class = v12;
  *(void *)id v12 = v0;
  *((void *)v12 + 1) = sub_25730AAD8;
  return sub_257318AAC();
}

uint64_t sub_25730AAD8()
{
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_25730ABD4, 0, 0);
}

uint64_t sub_25730ABD4()
{
  if (sub_25731A450())
  {
    uint64_t v1 = *(void *)(v0 + 88);
    uint64_t v2 = *(void **)(v0 + 96);
    uint64_t v3 = *(void *)(v0 + 72);
    uint64_t v4 = *(void *)(v0 + 80);
    uint64_t v5 = *(void **)(v0 + 64);
    id v6 = objc_msgSend(v5, sel_uniqueIdentifier);
    sub_257321598();

    uint64_t v7 = sub_257321588();
    uint64_t v9 = v8;
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v1, v3);
    id v10 = objc_msgSend(v5, sel_name);
    uint64_t v11 = sub_2573217F8();
    uint64_t v13 = v12;

    id v14 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for EnergyForecastIntent()), sel_init);
    *(void *)(v0 + 32) = v7;
    *(void *)(v0 + 40) = v9;
    id v15 = v14;
    swift_retain();
    sub_2573213D8();
    swift_release();
    *(void *)(v0 + 48) = v11;
    *(void *)(v0 + 56) = v13;
    swift_retain();
    sub_2573213D8();
    swift_release();

    __swift_instantiateConcreteTypeFromMangledName(&qword_269FE58A8);
    uint64_t v16 = swift_allocObject();
    *(_OWORD *)(v16 + 16) = xmmword_2573231F0;
    *(void *)(v16 + 32) = v15;
    uint64_t v20 = v16;
    sub_2573218E8();
    uint64_t v17 = v20;
  }
  else
  {

    uint64_t v17 = MEMORY[0x263F8EE78];
  }
  swift_task_dealloc();
  unint64_t v18 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v18(v17);
}

uint64_t HMHome.pickableElectricityUsageIntents.getter()
{
  v1[8] = v0;
  uint64_t v2 = sub_2573215A8();
  v1[9] = v2;
  v1[10] = *(void *)(v2 - 8);
  v1[11] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_25730AE74, 0, 0);
}

uint64_t sub_25730AE74()
{
  id receiver = v0[4].receiver;
  uint64_t v2 = (objc_class *)type metadata accessor for NHOHomeUserCapabilities();
  id v3 = objc_allocWithZone(v2);
  uint64_t v4 = OBJC_IVAR___NHOHomeUserCapabilities_logger;
  uint64_t v5 = qword_269FE52E0;
  id v6 = receiver;
  uint64_t v7 = v3;
  if (v5 != -1) {
    swift_once();
  }
  id v8 = v0[4].receiver;
  uint64_t v9 = sub_257321708();
  uint64_t v10 = __swift_project_value_buffer(v9, (uint64_t)qword_269FE5590);
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(*(void *)(v9 - 8) + 16))(&v7[v4], v10, v9);
  v7[OBJC_IVAR___NHOHomeUserCapabilities_isOnboarded] = 0;
  v7[OBJC_IVAR___NHOHomeUserCapabilities_hasMockData] = 0;
  *(void *)&v7[OBJC_IVAR___NHOHomeUserCapabilities_home] = v8;
  id v11 = v8;

  v0[1].id receiver = v7;
  v0[1].super_class = v2;
  v0[6].id receiver = objc_msgSendSuper2(v0 + 1, sel_init);

  uint64_t v12 = (objc_class *)swift_task_alloc();
  v0[6].super_class = v12;
  *(void *)uint64_t v12 = v0;
  *((void *)v12 + 1) = sub_25730B014;
  return sub_257318AAC();
}

uint64_t sub_25730B014()
{
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_25730B110, 0, 0);
}

uint64_t sub_25730B110()
{
  uint64_t v1 = (void *)v0[12];
  if ((*((unsigned char *)v1 + OBJC_IVAR___NHOHomeUserCapabilities_isOnboarded) & 1) != 0
    || (*((unsigned char *)v1 + OBJC_IVAR___NHOHomeUserCapabilities_hasMockData) & 1) != 0
    || (v2 = sub_2573185EC(), uint64_t v1 = (void *)v0[12], (v2 & 1) != 0))
  {
    uint64_t v4 = v0[10];
    uint64_t v3 = v0[11];
    id v6 = (void *)v0[8];
    uint64_t v5 = v0[9];
    id v7 = objc_msgSend(v6, sel_uniqueIdentifier);
    sub_257321598();

    uint64_t v8 = sub_257321588();
    uint64_t v10 = v9;
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
    id v11 = objc_msgSend(v6, sel_name);
    uint64_t v12 = sub_2573217F8();
    uint64_t v14 = v13;

    id v15 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for ElectricityUsageIntent()), sel_init);
    v0[4] = v8;
    v0[5] = v10;
    id v16 = v15;
    swift_retain();
    sub_2573213D8();
    swift_release();
    v0[6] = v12;
    v0[7] = v14;
    swift_retain();
    sub_2573213D8();
    swift_release();

    __swift_instantiateConcreteTypeFromMangledName(&qword_269FE58A8);
    uint64_t v17 = swift_allocObject();
    *(_OWORD *)(v17 + 16) = xmmword_2573231F0;
    *(void *)(v17 + 32) = v16;
    uint64_t v21 = v17;
    sub_2573218E8();
    uint64_t v18 = v21;
  }
  else
  {

    uint64_t v18 = MEMORY[0x263F8EE78];
  }
  swift_task_dealloc();
  unint64_t v19 = (uint64_t (*)(uint64_t))v0[1];
  return v19(v18);
}

uint64_t HMHome.pickableElectricityRatesIntents.getter()
{
  v1[8] = v0;
  uint64_t v2 = sub_2573215A8();
  v1[9] = v2;
  v1[10] = *(void *)(v2 - 8);
  v1[11] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_25730B3D0, 0, 0);
}

uint64_t sub_25730B3D0()
{
  id receiver = v0[4].receiver;
  uint64_t v2 = (objc_class *)type metadata accessor for NHOHomeUserCapabilities();
  id v3 = objc_allocWithZone(v2);
  uint64_t v4 = OBJC_IVAR___NHOHomeUserCapabilities_logger;
  uint64_t v5 = qword_269FE52E0;
  id v6 = receiver;
  id v7 = v3;
  if (v5 != -1) {
    swift_once();
  }
  id v8 = v0[4].receiver;
  uint64_t v9 = sub_257321708();
  uint64_t v10 = __swift_project_value_buffer(v9, (uint64_t)qword_269FE5590);
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(*(void *)(v9 - 8) + 16))(&v7[v4], v10, v9);
  v7[OBJC_IVAR___NHOHomeUserCapabilities_isOnboarded] = 0;
  v7[OBJC_IVAR___NHOHomeUserCapabilities_hasMockData] = 0;
  *(void *)&v7[OBJC_IVAR___NHOHomeUserCapabilities_home] = v8;
  id v11 = v8;

  v0[1].id receiver = v7;
  v0[1].super_class = v2;
  v0[6].id receiver = objc_msgSendSuper2(v0 + 1, sel_init);

  uint64_t v12 = (objc_class *)swift_task_alloc();
  v0[6].super_class = v12;
  *(void *)uint64_t v12 = v0;
  *((void *)v12 + 1) = sub_25730B570;
  return sub_257318AAC();
}

uint64_t sub_25730B570()
{
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_25730B66C, 0, 0);
}

uint64_t sub_25730B66C()
{
  uint64_t v1 = (void *)v0[12];
  if ((*((unsigned char *)v1 + OBJC_IVAR___NHOHomeUserCapabilities_isOnboarded) & 1) != 0
    || (*((unsigned char *)v1 + OBJC_IVAR___NHOHomeUserCapabilities_hasMockData) & 1) != 0
    || (v2 = sub_2573185EC(), uint64_t v1 = (void *)v0[12], (v2 & 1) != 0))
  {
    uint64_t v4 = v0[10];
    uint64_t v3 = v0[11];
    id v6 = (void *)v0[8];
    uint64_t v5 = v0[9];
    id v7 = objc_msgSend(v6, sel_uniqueIdentifier);
    sub_257321598();

    uint64_t v8 = sub_257321588();
    uint64_t v10 = v9;
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
    id v11 = objc_msgSend(v6, sel_name);
    uint64_t v12 = sub_2573217F8();
    uint64_t v14 = v13;

    id v15 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for ElectricityRatesIntent()), sel_init);
    v0[4] = v8;
    v0[5] = v10;
    id v16 = v15;
    swift_retain();
    sub_2573213D8();
    swift_release();
    v0[6] = v12;
    v0[7] = v14;
    swift_retain();
    sub_2573213D8();
    swift_release();

    __swift_instantiateConcreteTypeFromMangledName(&qword_269FE58A8);
    uint64_t v17 = swift_allocObject();
    *(_OWORD *)(v17 + 16) = xmmword_2573231F0;
    *(void *)(v17 + 32) = v16;
    uint64_t v21 = v17;
    sub_2573218E8();
    uint64_t v18 = v21;
  }
  else
  {

    uint64_t v18 = MEMORY[0x263F8EE78];
  }
  swift_task_dealloc();
  unint64_t v19 = (uint64_t (*)(uint64_t))v0[1];
  return v19(v18);
}

void HMHome.actionSetsWithActions()()
{
  id v1 = objc_msgSend(v0, sel_actionSets);
  sub_2573001D4(0, &qword_269FE58C0);
  unint64_t v2 = sub_2573218D8();

  if (!(v2 >> 62))
  {
    uint64_t v3 = *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v3) {
      goto LABEL_3;
    }
LABEL_17:
    swift_bridgeObjectRelease();
    return;
  }
  swift_bridgeObjectRetain();
  uint64_t v3 = sub_257321BA8();
  swift_bridgeObjectRelease();
  if (!v3) {
    goto LABEL_17;
  }
LABEL_3:
  if (v3 < 1)
  {
    __break(1u);
  }
  else
  {
    for (uint64_t i = 0; i != v3; ++i)
    {
      if ((v2 & 0xC000000000000001) != 0) {
        id v5 = (id)MEMORY[0x25A2B3680](i, v2);
      }
      else {
        id v5 = *(id *)(v2 + 8 * i + 32);
      }
      id v6 = v5;
      id v7 = objc_msgSend(v5, sel_actions);
      sub_2573001D4(0, (unint64_t *)&qword_269FE5470);
      sub_25730D070();
      uint64_t v8 = sub_257321968();

      if ((v8 & 0xC000000000000001) != 0) {
        uint64_t v9 = sub_257321AA8();
      }
      else {
        uint64_t v9 = *(void *)(v8 + 16);
      }
      swift_bridgeObjectRelease();
      if (v9 >= 1)
      {
        sub_257321B58();
        sub_257321B78();
        sub_257321B88();
        sub_257321B68();
      }
      else
      {
      }
    }
    swift_bridgeObjectRelease();
  }
}

uint64_t HMHome.pickableActionSetIntents.getter()
{
  HMHome.actionSetsWithActions()();
  unint64_t v2 = v1;
  id v3 = v0;
  uint64_t v4 = sub_25730D0D8(v2, v3);
  swift_bridgeObjectRelease();

  return v4;
}

uint64_t HMHome.pickableAccessoryIntents(forRoom:)(void *a1)
{
  uint64_t v74 = sub_2573215A8();
  unint64_t v2 = *(void *)(v74 - 8);
  uint64_t v3 = MEMORY[0x270FA5388](v74);
  unint64_t v73 = (char *)&v67 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v3);
  uint64_t v72 = (char *)&v67 - v5;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269FE53B8);
  MEMORY[0x270FA5388](v6 - 8);
  unint64_t v8 = (unint64_t)&v67 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v90 = sub_257321688();
  uint64_t v9 = *(void **)(v90 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v90);
  uint64_t v71 = (char *)&v67 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  uint64_t v87 = (char *)&v67 - v13;
  MEMORY[0x270FA5388](v12);
  uint64_t v89 = (char *)&v67 - v14;
  unint64_t v94 = MEMORY[0x263F8EE78];
  v95[0] = MEMORY[0x263F8EE78];
  id v15 = objc_msgSend(a1, sel_accessories);
  sub_2573001D4(0, &qword_269FE58C8);
  unint64_t v16 = sub_2573218D8();

  if (v16 >> 62) {
    goto LABEL_58;
  }
  uint64_t v17 = *(void *)((v16 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (v17)
  {
    uint64_t v84 = (id *)v8;
    unint64_t v8 = 0;
    unint64_t v93 = v16 & 0xC000000000000001;
    unint64_t v85 = v16 + 32;
    uint64_t v86 = v16 & 0xFFFFFFFFFFFFFF8;
    uint64_t v83 = (unsigned int (**)(id *, uint64_t, uint64_t))(v9 + 6);
    uint64_t v70 = (void (**)(char *, id *, void *))(v9 + 4);
    uint64_t v69 = (void (**)(char *, char *, uint64_t))(v9 + 2);
    unsigned int v68 = (void (**)(char *, uint64_t))(v2 + 8);
    uint64_t v67 = (void (**)(char *, uint64_t))(v9 + 1);
    uint64_t v91 = v17;
    unint64_t v92 = v16;
    while (1)
    {
      if (v93)
      {
        id v18 = (id)MEMORY[0x25A2B3680](v8, v16);
      }
      else
      {
        if (v8 >= *(void *)(v86 + 16)) {
          goto LABEL_55;
        }
        id v18 = *(id *)(v85 + 8 * v8);
      }
      unint64_t v19 = v18;
      if (__OFADD__(v8++, 1))
      {
        __break(1u);
LABEL_55:
        __break(1u);
LABEL_56:
        __break(1u);
        goto LABEL_57;
      }
      HMAccessory.serviceGroup.getter();
      if (!v21)
      {
        unint64_t v2 = (unint64_t)v84;
        HMAccessory.widgetSupportedServiceKind()((uint64_t)v84);
        uint64_t v9 = (void *)v90;
        if ((*v83)((id *)v2, 1, v90) == 1)
        {
          sub_2573005E4(v2);
          id v22 = v19;
          goto LABEL_7;
        }
        (*v70)(v89, (id *)v2, v9);
        uint64_t v28 = sub_257321668();
        uint64_t v30 = v29;
        unint64_t v31 = (unint64_t)HMAccessory.primaryService()();
        if (v31)
        {
          uint64_t v32 = (void *)v31;
          swift_bridgeObjectRelease();
          uint64_t v33 = HMService.iconSymbol.getter();
          uint64_t v75 = v34;
          uint64_t v76 = v33;
        }
        else
        {
          uint64_t v75 = v30;
          uint64_t v76 = v28;
        }
        uint64_t v81 = *v69;
        uint64_t v39 = v90;
        v81(v87, v89, v90);
        uint64_t v82 = type metadata accessor for NHOAccessoryIntent();
        id v40 = v88;
        id v41 = objc_msgSend(v88, sel_uniqueIdentifier);
        uint64_t v42 = v72;
        sub_257321598();

        uint64_t v43 = sub_257321588();
        uint64_t v79 = v44;
        uint64_t v80 = v43;
        uint64_t v45 = *v68;
        unint64_t v46 = v42;
        uint64_t v47 = v74;
        (*v68)(v46, v74);
        id v48 = objc_msgSend(v40, sel_name);
        uint64_t v49 = sub_2573217F8();
        uint64_t v77 = v50;
        uint64_t v78 = v49;

        id v51 = objc_msgSend(v19, sel_uniqueIdentifier);
        id v52 = v73;
        sub_257321598();

        LODWORD(v51) = sub_257321588();
        int v54 = v53;
        v45(v52, v47);
        id v55 = objc_msgSend(v19, sel_name);
        LODWORD(v45) = sub_2573217F8();
        LODWORD(v47) = v56;

        uint64_t v57 = (uint64_t)v71;
        uint64_t v58 = v87;
        v81(v71, v87, v39);
        id v59 = NHOAccessoryIntent.__allocating_init(homeID:homeName:accessoryID:accessoryName:icon:serviceKind:)(v80, v79, v78, v77, (int)v51, v54, (int)v45, v47, v76, v75, v57);
        uint64_t v60 = *v67;
        (*v67)(v58, v39);
        v60(v89, v39);
        id v22 = v59;
        uint64_t v9 = v95;
        MEMORY[0x25A2B3410]();
        unint64_t v2 = *(void *)((v95[0] & 0xFFFFFFFFFFFFFF8) + 0x10);
        if (v2 >= *(void *)((v95[0] & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
          sub_2573218F8();
        }
        sub_257321908();
        sub_2573218E8();
        goto LABEL_5;
      }
      id v22 = v21;
      unint64_t v2 = v94;
      if (v94 >> 62)
      {
        swift_bridgeObjectRetain_n();
        uint64_t v23 = sub_257321BA8();
        if (!v23) {
          goto LABEL_20;
        }
      }
      else
      {
        uint64_t v23 = *(void *)((v94 & 0xFFFFFFFFFFFFFF8) + 0x10);
        swift_bridgeObjectRetain_n();
        if (!v23) {
          goto LABEL_20;
        }
      }
      id v24 = (v2 & 0xC000000000000001) != 0 ? (id)MEMORY[0x25A2B3680](0, v2) : *(id *)(v2 + 32);
      uint64_t v25 = v24;
      uint64_t v9 = (void *)sub_2573001D4(0, &qword_269FE58D0);
      char v26 = sub_257321A18();

      if ((v26 & 1) == 0)
      {
        if (v23 == 1) {
          goto LABEL_20;
        }
        if ((v2 & 0xC000000000000001) != 0)
        {
          MEMORY[0x25A2B3680](1, v2);
          unint64_t v16 = sub_257321A18();
          swift_unknownObjectRelease();
          if ((v16 & 1) == 0)
          {
            if (v23 != 2)
            {
              uint64_t v35 = 2;
              do
              {
                uint64_t v36 = MEMORY[0x25A2B3680](v35, v2);
                uint64_t v37 = v35 + 1;
                if (__OFADD__(v35, 1)) {
                  goto LABEL_56;
                }
                unint64_t v16 = v36;
                char v38 = sub_257321A18();
                swift_unknownObjectRelease();
                if (v38) {
                  goto LABEL_4;
                }
                ++v35;
              }
              while (v37 != v23);
            }
LABEL_20:
            swift_bridgeObjectRelease_n();
            id v22 = v22;
            MEMORY[0x25A2B3410]();
            unint64_t v2 = *(void *)((v94 & 0xFFFFFFFFFFFFFF8) + 0x10);
            if (v2 >= *(void *)((v94 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
              sub_2573218F8();
            }
            sub_257321908();
            sub_2573218E8();
            uint64_t v9 = v88;
            id v27 = sub_25730C3B4(v22);
            unint64_t v16 = v92;
            if (v27)
            {
              unint64_t v2 = (unint64_t)v27;
              uint64_t v9 = v95;
              MEMORY[0x25A2B3410]();
              if (*(void *)((v95[0] & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v95[0] & 0xFFFFFFFFFFFFFF8)
                                                                                   + 0x18) >> 1)
                sub_2573218F8();
              sub_257321908();
              sub_2573218E8();
            }
            else
            {
            }
            goto LABEL_6;
          }
          goto LABEL_4;
        }
        id v61 = *(id *)(v2 + 40);
        unint64_t v16 = sub_257321A18();

        if ((v16 & 1) == 0) {
          break;
        }
      }
LABEL_4:
      swift_bridgeObjectRelease_n();
LABEL_5:

      unint64_t v16 = v92;
LABEL_6:
      uint64_t v17 = v91;
LABEL_7:

      if (v8 == v17)
      {
        swift_bridgeObjectRelease();
        uint64_t v65 = v95[0];
        goto LABEL_60;
      }
    }
    if (v23 == 2) {
      goto LABEL_20;
    }
    uint64_t v62 = 6;
    while (1)
    {
      uint64_t v63 = v62 - 3;
      if (__OFADD__(v62 - 4, 1)) {
        break;
      }
      id v64 = *(id *)(v2 + 8 * v62);
      unint64_t v16 = sub_257321A18();

      if (v16) {
        goto LABEL_4;
      }
      ++v62;
      if (v63 == v23) {
        goto LABEL_20;
      }
    }
LABEL_57:
    __break(1u);
LABEL_58:
    swift_bridgeObjectRetain();
    uint64_t v17 = sub_257321BA8();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  uint64_t v65 = MEMORY[0x263F8EE78];
LABEL_60:
  swift_bridgeObjectRelease();
  return v65;
}

id sub_25730C3B4(void *a1)
{
  uint64_t v2 = sub_2573215A8();
  uint64_t v56 = *(void *)(v2 - 8);
  uint64_t v3 = MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v46 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v3);
  uint64_t v7 = (char *)&v46 - v6;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_269FE53B8);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)&v46 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_257321688();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = MEMORY[0x270FA5388](v11);
  uint64_t v58 = (char *)&v46 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = MEMORY[0x270FA5388](v13);
  uint64_t v17 = (char *)&v46 - v16;
  MEMORY[0x270FA5388](v15);
  unint64_t v19 = (char *)&v46 - v18;
  HMServiceGroup.widgetSupportedServiceKind()((uint64_t)v10);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11) == 1)
  {
    sub_2573005E4((uint64_t)v10);
    return 0;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v19, v10, v11);
    uint64_t v21 = sub_257321668();
    uint64_t v59 = v22;
    id v54 = a1;
    unint64_t v23 = (unint64_t)HMServiceGroup.primaryService()();
    uint64_t v55 = v2;
    if (v23)
    {
      id v24 = (void *)v23;
      uint64_t v25 = v56;
      swift_bridgeObjectRelease();
      uint64_t v53 = HMService.iconSymbol.getter();
      uint64_t v59 = v26;
    }
    else
    {
      uint64_t v53 = v21;
      uint64_t v25 = v56;
    }
    id v51 = *(void (**)(char *, char *, uint64_t))(v12 + 16);
    id v52 = v17;
    v51(v17, v19, v11);
    uint64_t v56 = type metadata accessor for NHOAccessoryIntent();
    id v27 = v57;
    id v28 = objc_msgSend(v57, sel_uniqueIdentifier);
    sub_257321598();

    uint64_t v29 = sub_257321588();
    uint64_t v49 = v30;
    uint64_t v50 = v29;
    unint64_t v31 = *(void (**)(char *, uint64_t))(v25 + 8);
    uint64_t v32 = v7;
    uint64_t v33 = v55;
    v31(v32, v55);
    id v34 = objc_msgSend(v27, sel_name);
    id v57 = (id)sub_2573217F8();
    uint64_t v48 = v35;

    id v36 = v54;
    id v37 = objc_msgSend(v54, sel_uniqueIdentifier);
    sub_257321598();

    LODWORD(v37) = sub_257321588();
    uint64_t v47 = v38;
    v31(v5, v33);
    id v39 = objc_msgSend(v36, sel_name);
    LODWORD(v31) = sub_2573217F8();
    int v41 = v40;

    uint64_t v42 = (uint64_t)v58;
    uint64_t v43 = v52;
    v51(v58, v52, v11);
    id v20 = NHOAccessoryIntent.__allocating_init(homeID:homeName:accessoryID:accessoryName:icon:serviceKind:)(v50, v49, (int)v57, v48, (int)v37, v47, (int)v31, v41, v53, v59, v42);
    uint64_t v44 = *(void (**)(char *, uint64_t))(v12 + 8);
    v44(v43, v11);
    v44(v19, v11);
  }
  return v20;
}

Swift::Bool __swiftcall HMHome.isCurrentRestrictedGuestAwayFromHome()()
{
  v20[3] = (uint64_t)&type metadata for RestrictedGuestFeatureFlags;
  v20[4] = sub_257307B84();
  char v1 = sub_257321648();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v20);
  Swift::Bool v4 = (v1 & 1) != 0
    && (id v2 = objc_msgSend(v0, sel_currentUser),
        id v3 = objc_msgSend(v0, sel_homeAccessControlForUser_, v2),
        v2,
        LODWORD(v2) = objc_msgSend(v3, sel_isRestrictedGuest),
        v3,
        v2)
    && objc_msgSend(v0, sel_homeLocationStatus) == (id)2;
  if (qword_269FE52D0 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_257321708();
  __swift_project_value_buffer(v5, (uint64_t)qword_269FE5560);
  id v6 = v0;
  uint64_t v7 = sub_2573216E8();
  os_log_type_t v8 = sub_2573219E8();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = swift_slowAlloc();
    uint64_t v19 = swift_slowAlloc();
    v20[0] = v19;
    *(_DWORD *)uint64_t v9 = 136315906;
    sub_2572FB6C4(0xD000000000000026, 0x8000000257324780, v20);
    sub_257321A68();
    *(_WORD *)(v9 + 12) = 1024;
    sub_257321A68();
    *(_WORD *)(v9 + 18) = 2080;
    id v10 = objc_msgSend(v6, sel_name);
    uint64_t v11 = sub_2573217F8();
    unint64_t v13 = v12;

    sub_2572FB6C4(v11, v13, v20);
    sub_257321A68();

    swift_bridgeObjectRelease();
    *(_WORD *)(v9 + 28) = 2080;
    objc_msgSend(v6, sel_homeLocationStatus);
    id v14 = (id)HMStringFromHomeLocation();
    uint64_t v15 = sub_2573217F8();
    unint64_t v17 = v16;

    sub_2572FB6C4(v15, v17, v20);
    sub_257321A68();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_2572F7000, v7, v8, "%s: uint64_t result = %{BOOL}d, home: %s, location status %s", (uint8_t *)v9, 0x26u);
    swift_arrayDestroy();
    MEMORY[0x25A2B3D30](v19, -1, -1);
    MEMORY[0x25A2B3D30](v9, -1, -1);
  }
  else
  {
  }
  return v4;
}

Swift::Bool __swiftcall HMHome.hasEnabledResident()()
{
  char v1 = HFForceRemoteAccessStateAvailable();
  id v2 = objc_msgSend(v0, sel_residentDevices);
  sub_2573001D4(0, &qword_269FE58D8);
  unint64_t v3 = sub_2573218D8();

  if (v3 >> 62) {
    goto LABEL_14;
  }
  uint64_t v4 = *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (v4)
  {
    uint64_t v5 = 4;
    while (1)
    {
      id v6 = (v3 & 0xC000000000000001) != 0 ? (id)MEMORY[0x25A2B3680](v5 - 4, v3) : *(id *)(v3 + 8 * v5);
      uint64_t v7 = v6;
      uint64_t v8 = v5 - 3;
      if (__OFADD__(v5 - 4, 1)) {
        break;
      }
      unsigned __int8 v9 = objc_msgSend(v6, sel_hf_isEnabled);

      if (v9)
      {
        char v1 = 1;
        goto LABEL_12;
      }
      ++v5;
      if (v8 == v4) {
        goto LABEL_12;
      }
    }
    __break(1u);
LABEL_14:
    swift_bridgeObjectRetain();
    uint64_t v4 = sub_257321BA8();
    swift_bridgeObjectRelease();
  }
LABEL_12:
  swift_bridgeObjectRelease();
  return v1;
}

Swift::Bool __swiftcall HMHome.hasEnabledAndReachableResident()()
{
  char v1 = HFForceRemoteAccessStateAvailable();
  id v2 = objc_msgSend(v0, sel_residentDevices);
  sub_2573001D4(0, &qword_269FE58D8);
  unint64_t v3 = sub_2573218D8();

  if (v3 >> 62) {
    goto LABEL_15;
  }
  uint64_t v4 = *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (v4)
  {
    uint64_t v5 = 4;
    while (1)
    {
      id v6 = (v3 & 0xC000000000000001) != 0 ? (id)MEMORY[0x25A2B3680](v5 - 4, v3) : *(id *)(v3 + 8 * v5);
      uint64_t v7 = v6;
      uint64_t v8 = v5 - 3;
      if (__OFADD__(v5 - 4, 1)) {
        break;
      }
      if (objc_msgSend(v6, sel_hf_isEnabled))
      {
        unsigned __int8 v9 = objc_msgSend(v7, sel_hf_isReachable);

        if (v9)
        {
          char v1 = 1;
          goto LABEL_13;
        }
      }
      else
      {
      }
      ++v5;
      if (v8 == v4) {
        goto LABEL_13;
      }
    }
    __break(1u);
LABEL_15:
    swift_bridgeObjectRetain();
    uint64_t v4 = sub_257321BA8();
    swift_bridgeObjectRelease();
  }
LABEL_13:
  swift_bridgeObjectRelease();
  return v1;
}

uint64_t sub_25730CE10(unint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v4 = v3;
  unint64_t v23 = a3;
  uint64_t v25 = a2;
  uint64_t v24 = sub_2573215A8();
  id v6 = *(void (***)(char *, uint64_t))(v24 - 8);
  MEMORY[0x270FA5388](v24);
  uint64_t v8 = (char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v26 = MEMORY[0x263F8EE78];
  if (a1 >> 62) {
    goto LABEL_19;
  }
  uint64_t v9 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v9)
  {
    while (1)
    {
      unint64_t v10 = 0;
      unint64_t v22 = a1 & 0xC000000000000001;
      id v20 = v4;
      uint64_t v21 = a1 & 0xFFFFFFFFFFFFFF8;
      uint64_t v11 = v6 + 1;
      while (v22)
      {
        unint64_t v12 = (void (**)(char *, uint64_t))MEMORY[0x25A2B3680](v10, a1);
LABEL_9:
        id v6 = v12;
        unint64_t v13 = v10 + 1;
        if (__OFADD__(v10, 1)) {
          goto LABEL_18;
        }
        unint64_t v14 = a1;
        id v15 = objc_msgSend(v12, sel_uniqueIdentifier);
        sub_257321598();

        uint64_t v16 = sub_257321588();
        uint64_t v4 = v17;
        (*v11)(v8, v24);
        if (v16 == v25 && v4 == v23)
        {
          swift_bridgeObjectRelease();
LABEL_14:
          uint64_t v4 = &v26;
          sub_257321B58();
          sub_257321B78();
          sub_257321B88();
          sub_257321B68();
          goto LABEL_5;
        }
        char v18 = sub_257321C18();
        swift_bridgeObjectRelease();
        if (v18) {
          goto LABEL_14;
        }

LABEL_5:
        a1 = v14;
        ++v10;
        if (v13 == v9) {
          return v26;
        }
      }
      if (v10 < *(void *)(v21 + 16)) {
        break;
      }
      __break(1u);
LABEL_18:
      __break(1u);
LABEL_19:
      uint64_t v9 = sub_257321BA8();
      if (!v9) {
        return MEMORY[0x263F8EE78];
      }
    }
    unint64_t v12 = (void (**)(char *, uint64_t))*(id *)(a1 + 8 * v10 + 32);
    goto LABEL_9;
  }
  return MEMORY[0x263F8EE78];
}

unint64_t sub_25730D070()
{
  unint64_t result = qword_269FE5478;
  if (!qword_269FE5478)
  {
    sub_2573001D4(255, (unint64_t *)&qword_269FE5470);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269FE5478);
  }
  return result;
}

uint64_t sub_25730D0D8(unint64_t a1, void *a2)
{
  uint64_t v3 = v2;
  id v45 = a2;
  uint64_t v44 = sub_2573215A8();
  uint64_t v5 = *(void (***)(char *, uint64_t))(v44 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v44);
  uint64_t v43 = (char *)v36 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v42 = (char *)v36 - v8;
  uint64_t v53 = MEMORY[0x263F8EE78];
  if (a1 >> 62) {
    goto LABEL_13;
  }
  uint64_t v9 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v9; uint64_t v9 = sub_257321BA8())
  {
    v36[1] = v3;
    unint64_t v41 = a1 & 0xC000000000000001;
    uint64_t v10 = type metadata accessor for NHOActionSetIntent();
    id v37 = v5 + 1;
    uint64_t v38 = v10;
    uint64_t v11 = 4;
    uint64_t v39 = v9;
    unint64_t v40 = a1;
    while (1)
    {
      uint64_t v3 = v11 - 4;
      unint64_t v12 = v41 ? (char *)MEMORY[0x25A2B3680](v11 - 4, a1) : (char *)*(id *)(a1 + 8 * v11);
      uint64_t v5 = (void (**)(char *, uint64_t))v12;
      if (__OFADD__(v3, 1)) {
        break;
      }
      uint64_t v52 = v11 - 3;
      id v13 = v45;
      id v14 = objc_msgSend(v45, sel_uniqueIdentifier);
      id v15 = v42;
      sub_257321598();

      uint64_t v16 = sub_257321588();
      uint64_t v50 = v17;
      uint64_t v51 = v16;
      char v18 = *v37;
      uint64_t v19 = v15;
      uint64_t v20 = v44;
      (*v37)(v19, v44);
      id v21 = objc_msgSend(v13, sel_name);
      uint64_t v22 = sub_2573217F8();
      uint64_t v48 = v23;
      uint64_t v49 = v22;

      id v24 = objc_msgSend(v5, sel_uniqueIdentifier);
      uint64_t v25 = v43;
      sub_257321598();

      uint64_t v26 = sub_257321588();
      uint64_t v46 = v27;
      uint64_t v47 = v26;
      v18(v25, v20);
      id v28 = objc_msgSend(v5, sel_name);
      int v29 = sub_2573217F8();
      LODWORD(v18) = v30;

      unint64_t v31 = HMActionSet.iconSymbolName.getter();
      uint64_t v33 = v32;
      HMActionSet.iconTintColor.getter();
      Swift::String v34 = Color.toHexString()();
      swift_release();
      NHOActionSetIntent.__allocating_init(homeID:homeName:actionSetID:actionSetName:icon:iconTintColor:)(v51, v50, v49, v48, v47, v46, v29, (int)v18, v31, v33, v34._countAndFlagsBits, (uint64_t)v34._object);

      MEMORY[0x25A2B3410]();
      if (*(void *)((v53 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v53 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        sub_2573218F8();
      }
      sub_257321908();
      sub_2573218E8();
      ++v11;
      a1 = v40;
      if (v52 == v39)
      {
        swift_bridgeObjectRelease();
        return v53;
      }
    }
    __break(1u);
LABEL_13:
    swift_bridgeObjectRetain();
  }
  swift_bridgeObjectRelease();
  return MEMORY[0x263F8EE78];
}

uint64_t HFImageIconIdentifier.symbolMapping.getter()
{
  uint64_t v0 = sub_2573217F8();
  uint64_t v2 = v1;
  if (v0 == sub_2573217F8() && v2 == v3) {
    goto LABEL_13;
  }
  char v5 = sub_257321C18();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v5) {
    return sub_2573217F8();
  }
  uint64_t v6 = sub_2573217F8();
  uint64_t v8 = v7;
  if (v6 == sub_2573217F8() && v8 == v9)
  {
    swift_bridgeObjectRelease_n();
    return sub_2573217F8();
  }
  char v11 = sub_257321C18();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v11) {
    return sub_2573217F8();
  }
  uint64_t v12 = sub_2573217F8();
  uint64_t v14 = v13;
  if (v12 == sub_2573217F8() && v14 == v15) {
    goto LABEL_13;
  }
  char v18 = sub_257321C18();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v18) {
    return sub_2573217F8();
  }
  uint64_t v19 = sub_2573217F8();
  uint64_t v21 = v20;
  if (v19 == sub_2573217F8() && v21 == v22) {
    goto LABEL_13;
  }
  char v23 = sub_257321C18();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v23) {
    return sub_2573217F8();
  }
  uint64_t v24 = sub_2573217F8();
  uint64_t v26 = v25;
  if (v24 == sub_2573217F8() && v26 == v27)
  {
LABEL_13:
    swift_bridgeObjectRelease_n();
    return sub_2573217F8();
  }
  char v28 = sub_257321C18();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v28) {
    return sub_2573217F8();
  }
  uint64_t v29 = sub_2573217F8();
  uint64_t v31 = v30;
  if (v29 == sub_2573217F8() && v31 == v32) {
    goto LABEL_27;
  }
  char v33 = sub_257321C18();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v33) {
    return 0xD000000000000011;
  }
  uint64_t v16 = 0x2E6E726F63706F70;
  uint64_t v34 = sub_2573217F8();
  uint64_t v36 = v35;
  if (v34 == sub_2573217F8() && v36 == v37) {
    goto LABEL_32;
  }
  char v38 = sub_257321C18();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v38) {
    return v16;
  }
  uint64_t v16 = 0x696E6B2E6B726F66;
  uint64_t v39 = sub_2573217F8();
  uint64_t v41 = v40;
  if (v39 == sub_2573217F8() && v41 == v42) {
    goto LABEL_32;
  }
  char v43 = sub_257321C18();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v43) {
    return v16;
  }
  uint64_t v44 = sub_2573217F8();
  uint64_t v46 = v45;
  if (v44 == sub_2573217F8() && v46 == v47)
  {
    swift_bridgeObjectRelease_n();
    return 0xD000000000000013;
  }
  char v48 = sub_257321C18();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v48) {
    return 0xD000000000000013;
  }
  uint64_t v16 = 0x702E676E69797266;
  uint64_t v49 = sub_2573217F8();
  uint64_t v51 = v50;
  if (v49 == sub_2573217F8() && v51 == v52)
  {
LABEL_32:
    swift_bridgeObjectRelease_n();
    return v16;
  }
  char v53 = sub_257321C18();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v53) {
    return v16;
  }
  uint64_t v54 = sub_2573217F8();
  uint64_t v56 = v55;
  if (v54 == sub_2573217F8() && v56 == v57)
  {
LABEL_27:
    swift_bridgeObjectRelease_n();
    return 0xD000000000000011;
  }
  char v58 = sub_257321C18();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v58) {
    return 0xD000000000000011;
  }
  uint64_t v59 = sub_2573217F8();
  uint64_t v61 = v60;
  if (v59 == sub_2573217F8() && v61 == v62)
  {
    swift_bridgeObjectRelease_n();
  }
  else
  {
    char v63 = sub_257321C18();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v63 & 1) == 0) {
      return 0;
    }
  }
  return 0x69662E7472616568;
}

uint64_t ServiceKind.isSupportedByWidgets.getter()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_257321688();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  char v5 = (char *)&v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v1, v2);
  int v6 = (*(uint64_t (**)(char *, uint64_t))(v3 + 88))(v5, v2);
  BOOL v14 = v6 == *MEMORY[0x263F481F0]
     || v6 == *MEMORY[0x263F48138]
     || v6 == *MEMORY[0x263F482B0]
     || v6 == *MEMORY[0x263F480B0]
     || v6 == *MEMORY[0x263F48248]
     || v6 == *MEMORY[0x263F48260]
     || v6 == *MEMORY[0x263F48018]
     || v6 == *MEMORY[0x263F480F0]
     || v6 == *MEMORY[0x263F480F8];
  uint64_t v15 = v14;
  if (!v14) {
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
  return v15;
}

uint64_t ServiceKind.debugDescription.getter()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_257321688();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  char v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v1, v2);
  int v6 = (*(uint64_t (**)(char *, uint64_t))(v3 + 88))(v5, v2);
  if (v6 == *MEMORY[0x263F48208]) {
    return 1819047278;
  }
  int v8 = v6;
  uint64_t result = 0xD000000000000010;
  if (v8 == *MEMORY[0x263F48188]) {
    return 0xD000000000000014;
  }
  if (v8 != *MEMORY[0x263F48118])
  {
    if (v8 == *MEMORY[0x263F48028]) {
      return 0x6669727550726961;
    }
    if (v8 != *MEMORY[0x263F48120])
    {
      if (v8 == *MEMORY[0x263F48280]) {
        return 0x79726574746162;
      }
      if (v8 == *MEMORY[0x263F48090]) {
        return 0x6F436172656D6163;
      }
      if (v8 == *MEMORY[0x263F481C0] || v8 == *MEMORY[0x263F481C8]) {
        return 0xD000000000000019;
      }
      if (v8 == *MEMORY[0x263F48170]) {
        return 0xD000000000000013;
      }
      if (v8 == *MEMORY[0x263F48190]) {
        return 0xD000000000000014;
      }
      if (v8 == *MEMORY[0x263F480A0]) {
        return 0x53746361746E6F63;
      }
      if (v8 == *MEMORY[0x263F481E0]) {
        return 0xD00000000000001DLL;
      }
      if (v8 == *MEMORY[0x263F48038]) {
        return 0x74736F6E67616964;
      }
      if (v8 == *MEMORY[0x263F48200]) {
        return 1919905636;
      }
      if (v8 == *MEMORY[0x263F482A0]) {
        return 0x6C6C6562726F6F64;
      }
      if (v8 == *MEMORY[0x263F481F0]) {
        return 7233894;
      }
      if (v8 == *MEMORY[0x263F48238]) {
        return 0x746563756166;
      }
      if (v8 == *MEMORY[0x263F48158]) {
        return 0xD000000000000011;
      }
      if (v8 != *MEMORY[0x263F48138])
      {
        if (v8 == *MEMORY[0x263F48070]) {
          return 0x6F43726574616568;
        }
        if (v8 == *MEMORY[0x263F481B0]) {
          return 0xD000000000000016;
        }
        if (v8 == *MEMORY[0x263F480C8]) {
          return 0x79746964696D7568;
        }
        if (v8 == *MEMORY[0x263F48040]) {
          return 0x756F537475706E69;
        }
        if (v8 != *MEMORY[0x263F48148])
        {
          if (v8 == *MEMORY[0x263F48210]) {
            return 0x6C6562616CLL;
          }
          if (v8 == *MEMORY[0x263F47FE8]) {
            return 0x736E65536B61656CLL;
          }
          if (v8 == *MEMORY[0x263F48050])
          {
            uint64_t v9 = 0x53746867696CLL;
            return v9 & 0xFFFFFFFFFFFFLL | 0x6E65000000000000;
          }
          if (v8 == *MEMORY[0x263F482B0])
          {
            return 0x6C7562746867696CLL;
          }
          else if (v8 == *MEMORY[0x263F480D8])
          {
            return 0x616E614D6B636F6CLL;
          }
          else if (v8 == *MEMORY[0x263F480B0])
          {
            return 0x6863654D6B636F6CLL;
          }
          else if (v8 == *MEMORY[0x263F47FF8])
          {
            return 0x6F68706F7263696DLL;
          }
          else if (v8 == *MEMORY[0x263F48080])
          {
            return 0x65536E6F69746F6DLL;
          }
          else if (v8 == *MEMORY[0x263F48108])
          {
            return 0x636E61707563636FLL;
          }
          else if (v8 == *MEMORY[0x263F48248])
          {
            return 0x74656C74756FLL;
          }
          else if (v8 == *MEMORY[0x263F480E0])
          {
            return 0x7974697275636573;
          }
          else if (v8 == *MEMORY[0x263F48218])
          {
            return 0x7374616C73;
          }
          else
          {
            if (v8 == *MEMORY[0x263F48060])
            {
              uint64_t v9 = 0x53656B6F6D73;
              return v9 & 0xFFFFFFFFFFFFLL | 0x6E65000000000000;
            }
            if (v8 == *MEMORY[0x263F48288])
            {
              return 0x72656B61657073;
            }
            else if (v8 == *MEMORY[0x263F481D0])
            {
              return 0xD00000000000001ALL;
            }
            else if (v8 == *MEMORY[0x263F481D8])
            {
              return 0xD00000000000001BLL;
            }
            else if (v8 == *MEMORY[0x263F48260])
            {
              return 0x686374697773;
            }
            else if (v8 == *MEMORY[0x263F480B8])
            {
              return 0x6F43746567726174;
            }
            else if (v8 == *MEMORY[0x263F481B8])
            {
              return 0xD000000000000017;
            }
            else if (v8 == *MEMORY[0x263F48008])
            {
              return 0x69736976656C6574;
            }
            else if (v8 == *MEMORY[0x263F48168])
            {
              return 0xD000000000000011;
            }
            else if (v8 == *MEMORY[0x263F48018])
            {
              return 0x74736F6D72656874;
            }
            else if (v8 == *MEMORY[0x263F48230])
            {
              return 0x65766C6176;
            }
            else if (v8 == *MEMORY[0x263F480F0])
            {
              return 0x74616C69746E6576;
            }
            else if (v8 == *MEMORY[0x263F48020])
            {
              return 0x74756F5269666977;
            }
            else if (v8 == *MEMORY[0x263F480C0])
            {
              return 0x6574615369666977;
            }
            else if (v8 == *MEMORY[0x263F48270])
            {
              return 0x776F646E6977;
            }
            else if (v8 == *MEMORY[0x263F480F8])
            {
              return 0x6F43776F646E6977;
            }
            else
            {
              (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
              return 0xD00000000000001ALL;
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t ServiceKind.widgetTogglingCharacteristicKind.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_257321688();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v2, v4);
  int v8 = (*(uint64_t (**)(char *, uint64_t))(v5 + 88))(v7, v4);
  if (v8 != *MEMORY[0x263F48028]
    && v8 != *MEMORY[0x263F481F0]
    && v8 != *MEMORY[0x263F48238]
    && v8 != *MEMORY[0x263F48070]
    && v8 != *MEMORY[0x263F481B0]
    && v8 != *MEMORY[0x263F48148])
  {
    if (v8 != *MEMORY[0x263F482B0])
    {
      if (v8 == *MEMORY[0x263F47FF8])
      {
LABEL_14:
        uint64_t v9 = (unsigned int *)MEMORY[0x263F48A70];
        goto LABEL_8;
      }
      if (v8 != *MEMORY[0x263F48248])
      {
        if (v8 == *MEMORY[0x263F48288]) {
          goto LABEL_14;
        }
        if (v8 != *MEMORY[0x263F48260])
        {
          if (v8 != *MEMORY[0x263F480B8]
            && v8 != *MEMORY[0x263F48008]
            && v8 != *MEMORY[0x263F48230]
            && v8 != *MEMORY[0x263F480F0])
          {
            uint64_t v14 = sub_2573216B8();
            (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(a1, 1, 1, v14);
            return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
          }
          goto LABEL_7;
        }
      }
    }
    uint64_t v9 = (unsigned int *)MEMORY[0x263F48840];
    goto LABEL_8;
  }
LABEL_7:
  uint64_t v9 = (unsigned int *)MEMORY[0x263F48AC0];
LABEL_8:
  uint64_t v10 = *v9;
  uint64_t v11 = sub_2573216B8();
  uint64_t v12 = *(void *)(v11 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v12 + 104))(a1, v10, v11);
  return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v12 + 56))(a1, 0, 1, v11);
}

uint64_t ServiceKind.widgetTargetCharacteristicType.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_257321688();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v2, v4);
  int v8 = (*(uint64_t (**)(char *, uint64_t))(v5 + 88))(v7, v4);
  if (v8 != *MEMORY[0x263F48200])
  {
    if (v8 == *MEMORY[0x263F48238]) {
      goto LABEL_4;
    }
    if (v8 == *MEMORY[0x263F48138])
    {
      uint64_t v9 = (unsigned int *)MEMORY[0x263F488E8];
      goto LABEL_17;
    }
    if (v8 == *MEMORY[0x263F48070])
    {
      uint64_t v9 = (unsigned int *)MEMORY[0x263F48A18];
      goto LABEL_17;
    }
    if (v8 == *MEMORY[0x263F481B0])
    {
      uint64_t v9 = (unsigned int *)MEMORY[0x263F48A58];
      goto LABEL_17;
    }
    if (v8 == *MEMORY[0x263F480B0])
    {
      uint64_t v9 = (unsigned int *)MEMORY[0x263F48A30];
      goto LABEL_17;
    }
    if (v8 == *MEMORY[0x263F480E0])
    {
      uint64_t v9 = (unsigned int *)MEMORY[0x263F48A40];
      goto LABEL_17;
    }
    if (v8 == *MEMORY[0x263F48018])
    {
      uint64_t v9 = (unsigned int *)MEMORY[0x263F48A28];
      goto LABEL_17;
    }
    if (v8 == *MEMORY[0x263F48230])
    {
LABEL_4:
      uint64_t v9 = (unsigned int *)MEMORY[0x263F48AC0];
      goto LABEL_17;
    }
    if (v8 != *MEMORY[0x263F48270] && v8 != *MEMORY[0x263F480F8])
    {
      uint64_t v15 = *MEMORY[0x263F48AC0];
      uint64_t v16 = sub_2573216B8();
      uint64_t v17 = *(void *)(v16 - 8);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v17 + 104))(a1, v15, v16);
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v17 + 56))(a1, 0, 1, v16);
      return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    }
  }
  uint64_t v9 = (unsigned int *)MEMORY[0x263F488D0];
LABEL_17:
  uint64_t v10 = *v9;
  uint64_t v11 = sub_2573216B8();
  uint64_t v12 = *(void *)(v11 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v12 + 104))(a1, v10, v11);
  return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v12 + 56))(a1, 0, 1, v11);
}

uint64_t ServiceKind.widgetCurrentCharacteristicType.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_257321688();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v2, v4);
  int v8 = (*(uint64_t (**)(char *, uint64_t))(v5 + 88))(v7, v4);
  if (v8 != *MEMORY[0x263F48200])
  {
    if (v8 == *MEMORY[0x263F48138])
    {
      uint64_t v9 = (unsigned int *)MEMORY[0x263F48908];
      goto LABEL_11;
    }
    if (v8 == *MEMORY[0x263F480B0])
    {
      uint64_t v9 = (unsigned int *)MEMORY[0x263F48A38];
      goto LABEL_11;
    }
    if (v8 == *MEMORY[0x263F480E0])
    {
      uint64_t v9 = (unsigned int *)MEMORY[0x263F48A48];
      goto LABEL_11;
    }
    if (v8 == *MEMORY[0x263F48018])
    {
      uint64_t v9 = (unsigned int *)MEMORY[0x263F489A8];
      goto LABEL_11;
    }
    if (v8 != *MEMORY[0x263F48270] && v8 != *MEMORY[0x263F480F8])
    {
      uint64_t v15 = *MEMORY[0x263F48840];
      uint64_t v16 = sub_2573216B8();
      uint64_t v17 = *(void *)(v16 - 8);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v17 + 104))(a1, v15, v16);
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v17 + 56))(a1, 0, 1, v16);
      return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    }
  }
  uint64_t v9 = (unsigned int *)MEMORY[0x263F488D8];
LABEL_11:
  uint64_t v10 = *v9;
  uint64_t v11 = sub_2573216B8();
  uint64_t v12 = *(void *)(v11 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v12 + 104))(a1, v10, v11);
  return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v12 + 56))(a1, 0, 1, v11);
}

uint64_t ServiceKind.widgetDisplayCharacteristicType.getter()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_257321688();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v48 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v1, v2);
  int v6 = (*(uint64_t (**)(char *, uint64_t))(v3 + 88))(v5, v2);
  if (v6 == *MEMORY[0x263F48028]) {
    goto LABEL_6;
  }
  if (v6 != *MEMORY[0x263F48200])
  {
    if (v6 != *MEMORY[0x263F481F0])
    {
      if (v6 == *MEMORY[0x263F48138])
      {
        __swift_instantiateConcreteTypeFromMangledName(&qword_269FE58E0);
        uint64_t v16 = sub_2573216B8();
        uint64_t v17 = *(void *)(v16 - 8);
        unint64_t v22 = (*(unsigned __int8 *)(v17 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v17 + 80);
        uint64_t v11 = swift_allocObject();
        *(_OWORD *)(v11 + 16) = xmmword_257322B50;
        unint64_t v19 = v11 + v22;
        uint64_t v20 = (unsigned int *)MEMORY[0x263F48980];
        goto LABEL_7;
      }
      if (v6 == *MEMORY[0x263F48070])
      {
        __swift_instantiateConcreteTypeFromMangledName(&qword_269FE58E0);
        uint64_t v7 = sub_2573216B8();
        uint64_t v23 = *(void *)(v7 - 8);
        uint64_t v24 = *(void *)(v23 + 72);
        unint64_t v25 = (*(unsigned __int8 *)(v23 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v23 + 80);
        uint64_t v11 = swift_allocObject();
        *(_OWORD *)(v11 + 16) = xmmword_257323150;
        unint64_t v26 = v11 + v25;
        uint64_t v13 = *(void (**)(unint64_t, void, uint64_t))(v23 + 104);
        v13(v26, *MEMORY[0x263F48958], v7);
        v13(v26 + v24, *MEMORY[0x263F48A20], v7);
        v13(v26 + 2 * v24, *MEMORY[0x263F48910], v7);
        unint64_t v14 = v26 + 3 * v24;
        uint64_t v15 = (unsigned int *)MEMORY[0x263F48900];
        goto LABEL_4;
      }
      if (v6 == *MEMORY[0x263F481B0])
      {
        __swift_instantiateConcreteTypeFromMangledName(&qword_269FE58E0);
        uint64_t v27 = sub_2573216B8();
        uint64_t v28 = *(void *)(v27 - 8);
        uint64_t v29 = *(void *)(v28 + 72);
        unint64_t v30 = (*(unsigned __int8 *)(v28 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v28 + 80);
        uint64_t v11 = swift_allocObject();
        *(_OWORD *)(v11 + 16) = xmmword_257322BA0;
        unint64_t v31 = v11 + v30;
        uint64_t v32 = *(void (**)(unint64_t, void, uint64_t))(v28 + 104);
        v32(v31, *MEMORY[0x263F48AC0], v27);
        v32(v31 + v29, *MEMORY[0x263F488B8], v27);
        v32(v31 + 2 * v29, *MEMORY[0x263F48978], v27);
        v32(v31 + 3 * v29, *MEMORY[0x263F489B8], v27);
        unint64_t v33 = v31 + 4 * v29;
        uint64_t v34 = (unsigned int *)MEMORY[0x263F48A60];
      }
      else
      {
        if (v6 == *MEMORY[0x263F48148])
        {
          __swift_instantiateConcreteTypeFromMangledName(&qword_269FE58E0);
          uint64_t v7 = sub_2573216B8();
          uint64_t v35 = *(void *)(v7 - 8);
          uint64_t v36 = *(void *)(v35 + 72);
          unint64_t v37 = (*(unsigned __int8 *)(v35 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v35 + 80);
          uint64_t v11 = swift_allocObject();
          *(_OWORD *)(v11 + 16) = xmmword_257323210;
          unint64_t v38 = v11 + v37;
          uint64_t v13 = *(void (**)(unint64_t, void, uint64_t))(v35 + 104);
          v13(v38, *MEMORY[0x263F48AB8], v7);
          unint64_t v14 = v38 + v36;
          uint64_t v15 = (unsigned int *)MEMORY[0x263F48868];
          goto LABEL_4;
        }
        if (v6 == *MEMORY[0x263F482B0])
        {
          __swift_instantiateConcreteTypeFromMangledName(&qword_269FE58E0);
          uint64_t v16 = sub_2573216B8();
          uint64_t v17 = *(void *)(v16 - 8);
          unint64_t v39 = (*(unsigned __int8 *)(v17 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v17 + 80);
          uint64_t v11 = swift_allocObject();
          *(_OWORD *)(v11 + 16) = xmmword_257322B50;
          unint64_t v19 = v11 + v39;
          uint64_t v20 = (unsigned int *)MEMORY[0x263F48838];
          goto LABEL_7;
        }
        if (v6 != *MEMORY[0x263F48018])
        {
          if (v6 == *MEMORY[0x263F48230])
          {
            __swift_instantiateConcreteTypeFromMangledName(&qword_269FE58E0);
            uint64_t v16 = sub_2573216B8();
            uint64_t v17 = *(void *)(v16 - 8);
            unint64_t v44 = (*(unsigned __int8 *)(v17 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v17 + 80);
            uint64_t v11 = swift_allocObject();
            *(_OWORD *)(v11 + 16) = xmmword_257322B50;
            unint64_t v19 = v11 + v44;
            uint64_t v20 = (unsigned int *)MEMORY[0x263F48AB8];
            goto LABEL_7;
          }
          if (v6 != *MEMORY[0x263F480F0])
          {
            if (v6 != *MEMORY[0x263F48270] && v6 != *MEMORY[0x263F480F8])
            {
              __swift_instantiateConcreteTypeFromMangledName(&qword_269FE58E0);
              uint64_t v45 = sub_2573216B8();
              uint64_t v46 = *(void *)(v45 - 8);
              unint64_t v47 = (*(unsigned __int8 *)(v46 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v46 + 80);
              uint64_t v11 = swift_allocObject();
              *(_OWORD *)(v11 + 16) = xmmword_257322B50;
              (*(void (**)(unint64_t, void, uint64_t))(v46 + 104))(v11 + v47, *MEMORY[0x263F48840], v45);
              (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
              return v11;
            }
            goto LABEL_3;
          }
          goto LABEL_6;
        }
        __swift_instantiateConcreteTypeFromMangledName(&qword_269FE58E0);
        uint64_t v27 = sub_2573216B8();
        uint64_t v40 = *(void *)(v27 - 8);
        uint64_t v41 = *(void *)(v40 + 72);
        unint64_t v42 = (*(unsigned __int8 *)(v40 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v40 + 80);
        uint64_t v11 = swift_allocObject();
        *(_OWORD *)(v11 + 16) = xmmword_257322BA0;
        unint64_t v43 = v11 + v42;
        uint64_t v32 = *(void (**)(unint64_t, void, uint64_t))(v40 + 104);
        v32(v43, *MEMORY[0x263F48958], v27);
        v32(v43 + v41, *MEMORY[0x263F48940], v27);
        v32(v43 + 2 * v41, *MEMORY[0x263F489A8], v27);
        v32(v43 + 3 * v41, *MEMORY[0x263F48910], v27);
        unint64_t v33 = v43 + 4 * v41;
        uint64_t v34 = (unsigned int *)MEMORY[0x263F48900];
      }
      v32(v33, *v34, v27);
      return v11;
    }
LABEL_6:
    __swift_instantiateConcreteTypeFromMangledName(&qword_269FE58E0);
    uint64_t v16 = sub_2573216B8();
    uint64_t v17 = *(void *)(v16 - 8);
    unint64_t v18 = (*(unsigned __int8 *)(v17 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v17 + 80);
    uint64_t v11 = swift_allocObject();
    *(_OWORD *)(v11 + 16) = xmmword_257322B50;
    unint64_t v19 = v11 + v18;
    uint64_t v20 = (unsigned int *)MEMORY[0x263F488B8];
LABEL_7:
    (*(void (**)(unint64_t, void, uint64_t))(v17 + 104))(v19, *v20, v16);
    return v11;
  }
LABEL_3:
  __swift_instantiateConcreteTypeFromMangledName(&qword_269FE58E0);
  uint64_t v7 = sub_2573216B8();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(void *)(v8 + 72);
  unint64_t v10 = (*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  uint64_t v11 = swift_allocObject();
  *(_OWORD *)(v11 + 16) = xmmword_257323210;
  unint64_t v12 = v11 + v10;
  uint64_t v13 = *(void (**)(unint64_t, void, uint64_t))(v8 + 104);
  v13(v12, *MEMORY[0x263F488B0], v7);
  unint64_t v14 = v12 + v9;
  uint64_t v15 = (unsigned int *)MEMORY[0x263F48980];
LABEL_4:
  v13(v14, *v15, v7);
  return v11;
}

uint64_t ServiceKind.widgetRelevantCharacteristic.getter()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_269FE58E8);
  uint64_t v2 = MEMORY[0x270FA5388](v1 - 8);
  uint64_t v39 = (uint64_t)&v37 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  int v6 = (char *)&v37 - v5;
  MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v37 - v7;
  uint64_t v9 = sub_2573216B8();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  unint64_t v38 = (char *)&v37 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = MEMORY[0x270FA5388](v11);
  uint64_t v15 = (char *)&v37 - v14;
  uint64_t v16 = MEMORY[0x270FA5388](v13);
  unint64_t v18 = (char *)&v37 - v17;
  uint64_t v19 = MEMORY[0x270FA5388](v16);
  uint64_t v21 = (char *)&v37 - v20;
  MEMORY[0x270FA5388](v19);
  uint64_t v23 = (char *)&v37 - v22;
  uint64_t v42 = MEMORY[0x263F8EE88];
  uint64_t v40 = v0;
  ServiceKind.widgetTogglingCharacteristicKind.getter((uint64_t)v8);
  uint64_t v41 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48);
  if (v41(v8, 1, v9) == 1)
  {
    sub_25730FF50((uint64_t)v8);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v23, v8, v9);
    (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v18, v23, v9);
    sub_25731053C((uint64_t)v21, v18);
    uint64_t v24 = *(void (**)(char *, uint64_t))(v10 + 8);
    v24(v21, v9);
    v24(v23, v9);
  }
  ServiceKind.widgetTargetCharacteristicType.getter((uint64_t)v6);
  if (v41(v6, 1, v9) == 1)
  {
    sub_25730FF50((uint64_t)v6);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v15, v6, v9);
    (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v18, v15, v9);
    sub_25731053C((uint64_t)v21, v18);
    unint64_t v25 = *(void (**)(char *, uint64_t))(v10 + 8);
    v25(v21, v9);
    v25(v15, v9);
  }
  uint64_t v26 = v39;
  ServiceKind.widgetCurrentCharacteristicType.getter(v39);
  if (v41((char *)v26, 1, v9) == 1)
  {
    sub_25730FF50(v26);
  }
  else
  {
    uint64_t v27 = v38;
    (*(void (**)(char *, uint64_t, uint64_t))(v10 + 32))(v38, v26, v9);
    (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v18, v27, v9);
    sub_25731053C((uint64_t)v21, v18);
    uint64_t v28 = *(void (**)(char *, uint64_t))(v10 + 8);
    v28(v21, v9);
    v28(v27, v9);
  }
  uint64_t v29 = ServiceKind.widgetDisplayCharacteristicType.getter();
  if (v29)
  {
    uint64_t v41 = (unsigned int (*)(char *, uint64_t, uint64_t))v29;
    uint64_t v30 = *(void *)(v29 + 16);
    if (v30)
    {
      unint64_t v33 = *(void (**)(char *, char *, uint64_t))(v10 + 16);
      uint64_t v32 = v10 + 16;
      unint64_t v31 = v33;
      uint64_t v34 = (char *)v41 + ((*(unsigned __int8 *)(v32 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v32 + 64));
      uint64_t v35 = *(void *)(v32 + 56);
      do
      {
        v31(v18, v34, v9);
        sub_25731053C((uint64_t)v21, v18);
        (*(void (**)(char *, uint64_t))(v32 - 8))(v21, v9);
        v34 += v35;
        --v30;
      }
      while (v30);
    }
    swift_bridgeObjectRelease();
  }
  return v42;
}

uint64_t sub_25730FF50(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269FE58E8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t ServiceKind.iconColorBase.getter()
{
  uint64_t v1 = sub_257321688();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = MEMORY[0x270FA5388](v1);
  uint64_t v5 = (char *)&v33 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v3);
  unint64_t v43 = (char *)&v33 - v6;
  uint64_t v7 = sub_2573216A8();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)&v33 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = MEMORY[0x270FA5388](v9);
  uint64_t v14 = (char *)&v33 - v13;
  MEMORY[0x270FA5388](v12);
  uint64_t v16 = (char *)&v33 - v15;
  uint64_t v44 = v0;
  sub_257321658();
  (*(void (**)(char *, void, uint64_t))(v8 + 104))(v14, *MEMORY[0x263F487C8], v7);
  sub_257311FE0(&qword_269FE58F0, MEMORY[0x263F487F0]);
  sub_2573218B8();
  sub_2573218B8();
  uint64_t v42 = v5;
  if (v47 == v45 && v48 == v46) {
    char v17 = 1;
  }
  else {
    char v17 = sub_257321C18();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  unint64_t v18 = *(void (**)(char *, uint64_t))(v8 + 8);
  v18(v14, v7);
  v18(v16, v7);
  if ((v17 & 1) == 0) {
    goto LABEL_12;
  }
  uint64_t v40 = v18;
  uint64_t v41 = v11;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269FE58F8);
  uint64_t v19 = *(void *)(v2 + 72);
  unint64_t v20 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  uint64_t v21 = swift_allocObject();
  *(_OWORD *)(v21 + 16) = xmmword_257323220;
  unint64_t v22 = v21 + v20;
  uint64_t v23 = *(void (**)(void))(v2 + 104);
  ((void (*)(unint64_t, void, uint64_t))v23)(v22, *MEMORY[0x263F48248], v1);
  uint64_t v34 = v22 + v19;
  v23();
  unsigned int v24 = *MEMORY[0x263F482B0];
  unint64_t v33 = v22 + 2 * v19;
  unsigned int v37 = v24;
  unint64_t v38 = v23;
  v23();
  unint64_t v25 = *(void (**)(char *, uint64_t, uint64_t))(v2 + 16);
  uint64_t v26 = v43;
  unint64_t v39 = v22;
  uint64_t v36 = v25;
  v25(v43, v22, v1);
  uint64_t v35 = sub_257311FE0((unint64_t *)&qword_269FE5900, MEMORY[0x263F482B8]);
  LOBYTE(v19) = sub_2573217C8();
  uint64_t v27 = *(void (**)(char *, uint64_t))(v2 + 8);
  swift_bridgeObjectRetain();
  v27(v26, v1);
  if ((v19 & 1) == 0)
  {
    v36(v26, v34, v1);
    char v28 = sub_2573217C8();
    v27(v26, v1);
    if ((v28 & 1) == 0)
    {
      v36(v26, v33, v1);
      char v30 = sub_2573217C8();
      v27(v26, v1);
      swift_bridgeObjectRelease();
      if (v30) {
        goto LABEL_9;
      }
      swift_setDeallocating();
      swift_arrayDestroy();
      swift_deallocClassInstance();
      unint64_t v18 = v40;
      uint64_t v11 = v41;
LABEL_12:
      sub_257321658();
      goto LABEL_13;
    }
  }
  swift_bridgeObjectRelease();
LABEL_9:
  swift_setDeallocating();
  swift_arrayDestroy();
  swift_deallocClassInstance();
  uint64_t v29 = v42;
  ((void (*)(char *, void, uint64_t))v38)(v42, v37, v1);
  uint64_t v11 = v41;
  sub_257321658();
  v27(v29, v1);
  unint64_t v18 = v40;
LABEL_13:
  uint64_t v31 = sub_257321698();
  v18(v11, v7);
  return v31;
}

uint64_t sub_25731053C(uint64_t a1, char *a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_2573216B8();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = *v2;
  sub_257311FE0(&qword_269FE5908, MEMORY[0x263F48AD0]);
  swift_bridgeObjectRetain();
  unint64_t v33 = a2;
  uint64_t v11 = sub_2573217B8();
  uint64_t v12 = -1 << *(unsigned char *)(v10 + 32);
  unint64_t v13 = v11 & ~v12;
  uint64_t v32 = v10 + 56;
  if ((*(void *)(v10 + 56 + ((v13 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v13))
  {
    char v28 = v2;
    uint64_t v29 = a1;
    uint64_t v30 = ~v12;
    uint64_t v27 = v7;
    uint64_t v16 = *(void (**)(void, void, void))(v7 + 16);
    uint64_t v15 = v7 + 16;
    uint64_t v14 = v16;
    uint64_t v31 = *(void *)(v15 + 56);
    char v17 = (void (**)(char *, uint64_t))(v15 - 8);
    v26[1] = v15 & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
    while (1)
    {
      uint64_t v18 = v10;
      unint64_t v19 = v31 * v13;
      unint64_t v20 = v14;
      v14(v9, *(void *)(v10 + 48) + v31 * v13, v6);
      sub_257311FE0(&qword_269FE5910, MEMORY[0x263F48AD0]);
      char v21 = sub_2573217C8();
      unint64_t v22 = *v17;
      (*v17)(v9, v6);
      if (v21) {
        break;
      }
      unint64_t v13 = (v13 + 1) & v30;
      uint64_t v10 = v18;
      uint64_t v14 = v20;
      if (((*(void *)(v32 + ((v13 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v13) & 1) == 0)
      {
        swift_bridgeObjectRelease();
        uint64_t v3 = v28;
        a1 = v29;
        uint64_t v7 = v27;
        goto LABEL_7;
      }
    }
    swift_bridgeObjectRelease();
    v22(v33, v6);
    v20(v29, *(void *)(*v28 + 48) + v19, v6);
    return 0;
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v14 = *(void (**)(void, void, void))(v7 + 16);
LABEL_7:
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    unsigned int v24 = v33;
    v14(v9, v33, v6);
    uint64_t v34 = *v3;
    *uint64_t v3 = 0x8000000000000000;
    sub_257311314((uint64_t)v9, v13, isUniquelyReferenced_nonNull_native);
    *uint64_t v3 = v34;
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, char *, uint64_t))(v7 + 32))(a1, v24, v6);
    return 1;
  }
}

uint64_t sub_257310860()
{
  uint64_t v1 = v0;
  uint64_t v42 = sub_2573216A8();
  uint64_t v2 = *(void *)(v42 - 8);
  MEMORY[0x270FA5388](v42);
  uint64_t v41 = (char *)&v35 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269FE5920);
  uint64_t v5 = sub_257321B08();
  uint64_t v6 = v5;
  if (*(void *)(v4 + 16))
  {
    uint64_t v7 = 1 << *(unsigned char *)(v4 + 32);
    uint64_t v8 = *(void *)(v4 + 56);
    unsigned int v37 = (void *)(v4 + 56);
    if (v7 < 64) {
      uint64_t v9 = ~(-1 << v7);
    }
    else {
      uint64_t v9 = -1;
    }
    unint64_t v10 = v9 & v8;
    uint64_t v35 = v0;
    int64_t v36 = (unint64_t)(v7 + 63) >> 6;
    uint64_t v39 = v2;
    uint64_t v11 = v5 + 56;
    uint64_t result = swift_retain();
    int64_t v13 = 0;
    uint64_t v38 = v6;
    uint64_t v14 = v41;
    uint64_t v15 = v42;
    while (1)
    {
      if (v10)
      {
        unint64_t v17 = __clz(__rbit64(v10));
        v10 &= v10 - 1;
        int64_t v40 = v13;
        unint64_t v18 = v17 | (v13 << 6);
      }
      else
      {
        int64_t v19 = v13 + 1;
        if (__OFADD__(v13, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v19 >= v36) {
          goto LABEL_33;
        }
        unint64_t v20 = v37[v19];
        int64_t v21 = v13 + 1;
        if (!v20)
        {
          int64_t v21 = v13 + 2;
          if (v13 + 2 >= v36) {
            goto LABEL_33;
          }
          unint64_t v20 = v37[v21];
          if (!v20)
          {
            int64_t v21 = v13 + 3;
            if (v13 + 3 >= v36) {
              goto LABEL_33;
            }
            unint64_t v20 = v37[v21];
            if (!v20)
            {
              uint64_t v22 = v13 + 4;
              if (v13 + 4 >= v36)
              {
LABEL_33:
                swift_release();
                uint64_t v1 = v35;
                uint64_t v34 = 1 << *(unsigned char *)(v4 + 32);
                if (v34 > 63) {
                  bzero(v37, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *unsigned int v37 = -1 << v34;
                }
                *(void *)(v4 + 16) = 0;
                break;
              }
              unint64_t v20 = v37[v22];
              if (!v20)
              {
                while (1)
                {
                  int64_t v21 = v22 + 1;
                  if (__OFADD__(v22, 1)) {
                    goto LABEL_39;
                  }
                  if (v21 >= v36) {
                    goto LABEL_33;
                  }
                  unint64_t v20 = v37[v21];
                  ++v22;
                  if (v20) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v21 = v13 + 4;
            }
          }
        }
LABEL_23:
        unint64_t v10 = (v20 - 1) & v20;
        int64_t v40 = v21;
        unint64_t v18 = __clz(__rbit64(v20)) + (v21 << 6);
      }
      uint64_t v23 = v4;
      uint64_t v24 = *(void *)(v4 + 48);
      uint64_t v25 = *(void *)(v39 + 72);
      uint64_t v26 = *(void (**)(char *, unint64_t, uint64_t))(v39 + 32);
      v26(v14, v24 + v25 * v18, v15);
      uint64_t v6 = v38;
      sub_257311FE0(&qword_269FE5488, MEMORY[0x263F487F0]);
      uint64_t result = sub_2573217B8();
      uint64_t v27 = -1 << *(unsigned char *)(v6 + 32);
      unint64_t v28 = result & ~v27;
      unint64_t v29 = v28 >> 6;
      if (((-1 << v28) & ~*(void *)(v11 + 8 * (v28 >> 6))) != 0)
      {
        unint64_t v16 = __clz(__rbit64((-1 << v28) & ~*(void *)(v11 + 8 * (v28 >> 6)))) | v28 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v30 = 0;
        unint64_t v31 = (unint64_t)(63 - v27) >> 6;
        do
        {
          if (++v29 == v31 && (v30 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          BOOL v32 = v29 == v31;
          if (v29 == v31) {
            unint64_t v29 = 0;
          }
          v30 |= v32;
          uint64_t v33 = *(void *)(v11 + 8 * v29);
        }
        while (v33 == -1);
        unint64_t v16 = __clz(__rbit64(~v33)) + (v29 << 6);
      }
      *(void *)(v11 + ((v16 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v16;
      uint64_t result = ((uint64_t (*)(unint64_t, char *, uint64_t))v26)(*(void *)(v6 + 48) + v16 * v25, v41, v42);
      ++*(void *)(v6 + 16);
      uint64_t v4 = v23;
      int64_t v13 = v40;
    }
  }
  uint64_t result = swift_release();
  *uint64_t v1 = v6;
  return result;
}

uint64_t sub_257310C5C()
{
  uint64_t v1 = v0;
  uint64_t v42 = sub_2573216B8();
  uint64_t v2 = *(void *)(v42 - 8);
  MEMORY[0x270FA5388](v42);
  uint64_t v41 = (char *)&v35 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269FE5918);
  uint64_t v5 = sub_257321B08();
  uint64_t v6 = v5;
  if (*(void *)(v4 + 16))
  {
    uint64_t v7 = 1 << *(unsigned char *)(v4 + 32);
    uint64_t v8 = *(void *)(v4 + 56);
    unsigned int v37 = (void *)(v4 + 56);
    if (v7 < 64) {
      uint64_t v9 = ~(-1 << v7);
    }
    else {
      uint64_t v9 = -1;
    }
    unint64_t v10 = v9 & v8;
    uint64_t v35 = v0;
    int64_t v36 = (unint64_t)(v7 + 63) >> 6;
    uint64_t v39 = v2;
    uint64_t v11 = v5 + 56;
    uint64_t result = swift_retain();
    int64_t v13 = 0;
    uint64_t v38 = v6;
    uint64_t v14 = v41;
    uint64_t v15 = v42;
    while (1)
    {
      if (v10)
      {
        unint64_t v17 = __clz(__rbit64(v10));
        v10 &= v10 - 1;
        int64_t v40 = v13;
        unint64_t v18 = v17 | (v13 << 6);
      }
      else
      {
        int64_t v19 = v13 + 1;
        if (__OFADD__(v13, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v19 >= v36) {
          goto LABEL_33;
        }
        unint64_t v20 = v37[v19];
        int64_t v21 = v13 + 1;
        if (!v20)
        {
          int64_t v21 = v13 + 2;
          if (v13 + 2 >= v36) {
            goto LABEL_33;
          }
          unint64_t v20 = v37[v21];
          if (!v20)
          {
            int64_t v21 = v13 + 3;
            if (v13 + 3 >= v36) {
              goto LABEL_33;
            }
            unint64_t v20 = v37[v21];
            if (!v20)
            {
              uint64_t v22 = v13 + 4;
              if (v13 + 4 >= v36)
              {
LABEL_33:
                swift_release();
                uint64_t v1 = v35;
                uint64_t v34 = 1 << *(unsigned char *)(v4 + 32);
                if (v34 > 63) {
                  bzero(v37, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *unsigned int v37 = -1 << v34;
                }
                *(void *)(v4 + 16) = 0;
                break;
              }
              unint64_t v20 = v37[v22];
              if (!v20)
              {
                while (1)
                {
                  int64_t v21 = v22 + 1;
                  if (__OFADD__(v22, 1)) {
                    goto LABEL_39;
                  }
                  if (v21 >= v36) {
                    goto LABEL_33;
                  }
                  unint64_t v20 = v37[v21];
                  ++v22;
                  if (v20) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v21 = v13 + 4;
            }
          }
        }
LABEL_23:
        unint64_t v10 = (v20 - 1) & v20;
        int64_t v40 = v21;
        unint64_t v18 = __clz(__rbit64(v20)) + (v21 << 6);
      }
      uint64_t v23 = v4;
      uint64_t v24 = *(void *)(v4 + 48);
      uint64_t v25 = *(void *)(v39 + 72);
      uint64_t v26 = *(void (**)(char *, unint64_t, uint64_t))(v39 + 32);
      v26(v14, v24 + v25 * v18, v15);
      uint64_t v6 = v38;
      sub_257311FE0(&qword_269FE5908, MEMORY[0x263F48AD0]);
      uint64_t result = sub_2573217B8();
      uint64_t v27 = -1 << *(unsigned char *)(v6 + 32);
      unint64_t v28 = result & ~v27;
      unint64_t v29 = v28 >> 6;
      if (((-1 << v28) & ~*(void *)(v11 + 8 * (v28 >> 6))) != 0)
      {
        unint64_t v16 = __clz(__rbit64((-1 << v28) & ~*(void *)(v11 + 8 * (v28 >> 6)))) | v28 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v30 = 0;
        unint64_t v31 = (unint64_t)(63 - v27) >> 6;
        do
        {
          if (++v29 == v31 && (v30 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          BOOL v32 = v29 == v31;
          if (v29 == v31) {
            unint64_t v29 = 0;
          }
          v30 |= v32;
          uint64_t v33 = *(void *)(v11 + 8 * v29);
        }
        while (v33 == -1);
        unint64_t v16 = __clz(__rbit64(~v33)) + (v29 << 6);
      }
      *(void *)(v11 + ((v16 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v16;
      uint64_t result = ((uint64_t (*)(unint64_t, char *, uint64_t))v26)(*(void *)(v6 + 48) + v16 * v25, v41, v42);
      ++*(void *)(v6 + 16);
      uint64_t v4 = v23;
      int64_t v13 = v40;
    }
  }
  uint64_t result = swift_release();
  *uint64_t v1 = v6;
  return result;
}

uint64_t sub_257311058(uint64_t a1, unint64_t a2, char a3)
{
  uint64_t v31 = a1;
  uint64_t v6 = sub_2573216A8();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v28 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v10 = *(void *)(*v3 + 16);
  unint64_t v11 = *(void *)(*v3 + 24);
  unint64_t v28 = v3;
  uint64_t v29 = v7;
  if (v11 > v10 && (a3 & 1) != 0) {
    goto LABEL_12;
  }
  if (a3)
  {
    sub_257310860();
  }
  else
  {
    if (v11 > v10)
    {
      sub_2573115D0(MEMORY[0x263F487F0], &qword_269FE5920);
      goto LABEL_12;
    }
    sub_257311880();
  }
  uint64_t v12 = *v3;
  sub_257311FE0(&qword_269FE5488, MEMORY[0x263F487F0]);
  uint64_t v13 = sub_2573217B8();
  uint64_t v14 = -1 << *(unsigned char *)(v12 + 32);
  a2 = v13 & ~v14;
  uint64_t v30 = v12;
  uint64_t v15 = v12 + 56;
  if ((*(void *)(v12 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
  {
    uint64_t v16 = ~v14;
    int64_t v19 = *(void (**)(char *, unint64_t, uint64_t))(v7 + 16);
    uint64_t v18 = v7 + 16;
    unint64_t v17 = v19;
    uint64_t v20 = *(void *)(v18 + 56);
    do
    {
      v17(v9, *(void *)(v30 + 48) + v20 * a2, v6);
      sub_257311FE0(&qword_269FE5490, MEMORY[0x263F487F0]);
      char v21 = sub_2573217C8();
      (*(void (**)(char *, uint64_t))(v18 - 8))(v9, v6);
      if (v21) {
        goto LABEL_15;
      }
      a2 = (a2 + 1) & v16;
    }
    while (((*(void *)(v15 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2) & 1) != 0);
  }
LABEL_12:
  uint64_t v22 = v29;
  uint64_t v23 = *v28;
  *(void *)(v23 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  uint64_t result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v22 + 32))(*(void *)(v23 + 48) + *(void *)(v22 + 72) * a2, v31, v6);
  uint64_t v25 = *(void *)(v23 + 16);
  BOOL v26 = __OFADD__(v25, 1);
  uint64_t v27 = v25 + 1;
  if (!v26)
  {
    *(void *)(v23 + 16) = v27;
    return result;
  }
  __break(1u);
LABEL_15:
  uint64_t result = sub_257321C28();
  __break(1u);
  return result;
}

uint64_t sub_257311314(uint64_t a1, unint64_t a2, char a3)
{
  uint64_t v31 = a1;
  uint64_t v6 = sub_2573216B8();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v28 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v10 = *(void *)(*v3 + 16);
  unint64_t v11 = *(void *)(*v3 + 24);
  unint64_t v28 = v3;
  uint64_t v29 = v7;
  if (v11 > v10 && (a3 & 1) != 0) {
    goto LABEL_12;
  }
  if (a3)
  {
    sub_257310C5C();
  }
  else
  {
    if (v11 > v10)
    {
      sub_2573115D0(MEMORY[0x263F48AD0], &qword_269FE5918);
      goto LABEL_12;
    }
    sub_257311C30();
  }
  uint64_t v12 = *v3;
  sub_257311FE0(&qword_269FE5908, MEMORY[0x263F48AD0]);
  uint64_t v13 = sub_2573217B8();
  uint64_t v14 = -1 << *(unsigned char *)(v12 + 32);
  a2 = v13 & ~v14;
  uint64_t v30 = v12;
  uint64_t v15 = v12 + 56;
  if ((*(void *)(v12 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
  {
    uint64_t v16 = ~v14;
    int64_t v19 = *(void (**)(char *, unint64_t, uint64_t))(v7 + 16);
    uint64_t v18 = v7 + 16;
    unint64_t v17 = v19;
    uint64_t v20 = *(void *)(v18 + 56);
    do
    {
      v17(v9, *(void *)(v30 + 48) + v20 * a2, v6);
      sub_257311FE0(&qword_269FE5910, MEMORY[0x263F48AD0]);
      char v21 = sub_2573217C8();
      (*(void (**)(char *, uint64_t))(v18 - 8))(v9, v6);
      if (v21) {
        goto LABEL_15;
      }
      a2 = (a2 + 1) & v16;
    }
    while (((*(void *)(v15 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2) & 1) != 0);
  }
LABEL_12:
  uint64_t v22 = v29;
  uint64_t v23 = *v28;
  *(void *)(v23 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  uint64_t result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v22 + 32))(*(void *)(v23 + 48) + *(void *)(v22 + 72) * a2, v31, v6);
  uint64_t v25 = *(void *)(v23 + 16);
  BOOL v26 = __OFADD__(v25, 1);
  uint64_t v27 = v25 + 1;
  if (!v26)
  {
    *(void *)(v23 + 16) = v27;
    return result;
  }
  __break(1u);
LABEL_15:
  uint64_t result = sub_257321C28();
  __break(1u);
  return result;
}

void *sub_2573115D0(uint64_t (*a1)(void), uint64_t *a2)
{
  uint64_t v4 = v2;
  uint64_t v5 = a1(0);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v25 - v7;
  __swift_instantiateConcreteTypeFromMangledName(a2);
  uint64_t v9 = *v2;
  uint64_t v10 = sub_257321AF8();
  uint64_t v11 = v10;
  if (!*(void *)(v9 + 16))
  {
    uint64_t result = (void *)swift_release();
LABEL_30:
    *uint64_t v4 = v11;
    return result;
  }
  uint64_t result = (void *)(v10 + 56);
  unint64_t v13 = (unint64_t)((1 << *(unsigned char *)(v11 + 32)) + 63) >> 6;
  BOOL v26 = v4;
  uint64_t v27 = (const void *)(v9 + 56);
  if (v11 != v9 || (unint64_t)result >= v9 + 56 + 8 * v13) {
    uint64_t result = memmove(result, v27, 8 * v13);
  }
  int64_t v15 = 0;
  *(void *)(v11 + 16) = *(void *)(v9 + 16);
  uint64_t v16 = 1 << *(unsigned char *)(v9 + 32);
  uint64_t v17 = -1;
  if (v16 < 64) {
    uint64_t v17 = ~(-1 << v16);
  }
  unint64_t v18 = v17 & *(void *)(v9 + 56);
  int64_t v28 = (unint64_t)(v16 + 63) >> 6;
  while (1)
  {
    if (v18)
    {
      unint64_t v19 = __clz(__rbit64(v18));
      v18 &= v18 - 1;
      unint64_t v20 = v19 | (v15 << 6);
      goto LABEL_12;
    }
    int64_t v22 = v15 + 1;
    if (__OFADD__(v15, 1))
    {
      __break(1u);
      goto LABEL_32;
    }
    if (v22 >= v28) {
      goto LABEL_28;
    }
    unint64_t v23 = *((void *)v27 + v22);
    ++v15;
    if (!v23)
    {
      int64_t v15 = v22 + 1;
      if (v22 + 1 >= v28) {
        goto LABEL_28;
      }
      unint64_t v23 = *((void *)v27 + v15);
      if (!v23)
      {
        int64_t v15 = v22 + 2;
        if (v22 + 2 >= v28) {
          goto LABEL_28;
        }
        unint64_t v23 = *((void *)v27 + v15);
        if (!v23) {
          break;
        }
      }
    }
LABEL_27:
    unint64_t v18 = (v23 - 1) & v23;
    unint64_t v20 = __clz(__rbit64(v23)) + (v15 << 6);
LABEL_12:
    unint64_t v21 = *(void *)(v6 + 72) * v20;
    (*(void (**)(char *, unint64_t, uint64_t))(v6 + 16))(v8, *(void *)(v9 + 48) + v21, v5);
    uint64_t result = (void *)(*(uint64_t (**)(unint64_t, char *, uint64_t))(v6 + 32))(*(void *)(v11 + 48) + v21, v8, v5);
  }
  int64_t v24 = v22 + 3;
  if (v24 >= v28)
  {
LABEL_28:
    uint64_t result = (void *)swift_release();
    uint64_t v4 = v26;
    goto LABEL_30;
  }
  unint64_t v23 = *((void *)v27 + v24);
  if (v23)
  {
    int64_t v15 = v24;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v15 = v24 + 1;
    if (__OFADD__(v24, 1)) {
      break;
    }
    if (v15 >= v28) {
      goto LABEL_28;
    }
    unint64_t v23 = *((void *)v27 + v15);
    ++v24;
    if (v23) {
      goto LABEL_27;
    }
  }
LABEL_32:
  __break(1u);
  return result;
}

uint64_t sub_257311880()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_2573216A8();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v33 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269FE5920);
  uint64_t v7 = sub_257321B08();
  uint64_t v8 = v7;
  if (!*(void *)(v6 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    *uint64_t v1 = v8;
    return result;
  }
  uint64_t v9 = 1 << *(unsigned char *)(v6 + 32);
  uint64_t v10 = *(void *)(v6 + 56);
  uint64_t v34 = v0;
  uint64_t v35 = v6 + 56;
  if (v9 < 64) {
    uint64_t v11 = ~(-1 << v9);
  }
  else {
    uint64_t v11 = -1;
  }
  unint64_t v12 = v11 & v10;
  int64_t v36 = (unint64_t)(v9 + 63) >> 6;
  uint64_t v37 = v3 + 16;
  uint64_t v13 = v7 + 56;
  uint64_t v38 = v3;
  uint64_t v14 = (uint64_t (**)(unint64_t, char *, uint64_t))(v3 + 32);
  uint64_t result = swift_retain();
  int64_t v16 = 0;
  while (1)
  {
    if (v12)
    {
      unint64_t v18 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v19 = v18 | (v16 << 6);
      goto LABEL_24;
    }
    int64_t v20 = v16 + 1;
    if (__OFADD__(v16, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v20 >= v36) {
      goto LABEL_33;
    }
    unint64_t v21 = *(void *)(v35 + 8 * v20);
    ++v16;
    if (!v21)
    {
      int64_t v16 = v20 + 1;
      if (v20 + 1 >= v36) {
        goto LABEL_33;
      }
      unint64_t v21 = *(void *)(v35 + 8 * v16);
      if (!v21)
      {
        int64_t v16 = v20 + 2;
        if (v20 + 2 >= v36) {
          goto LABEL_33;
        }
        unint64_t v21 = *(void *)(v35 + 8 * v16);
        if (!v21) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v12 = (v21 - 1) & v21;
    unint64_t v19 = __clz(__rbit64(v21)) + (v16 << 6);
LABEL_24:
    uint64_t v23 = v6;
    uint64_t v24 = *(void *)(v6 + 48);
    uint64_t v25 = *(void *)(v38 + 72);
    (*(void (**)(char *, unint64_t, uint64_t))(v38 + 16))(v5, v24 + v25 * v19, v2);
    sub_257311FE0(&qword_269FE5488, MEMORY[0x263F487F0]);
    uint64_t result = sub_2573217B8();
    uint64_t v26 = -1 << *(unsigned char *)(v8 + 32);
    unint64_t v27 = result & ~v26;
    unint64_t v28 = v27 >> 6;
    if (((-1 << v27) & ~*(void *)(v13 + 8 * (v27 >> 6))) != 0)
    {
      unint64_t v17 = __clz(__rbit64((-1 << v27) & ~*(void *)(v13 + 8 * (v27 >> 6)))) | v27 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v29 = 0;
      unint64_t v30 = (unint64_t)(63 - v26) >> 6;
      do
      {
        if (++v28 == v30 && (v29 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        BOOL v31 = v28 == v30;
        if (v28 == v30) {
          unint64_t v28 = 0;
        }
        v29 |= v31;
        uint64_t v32 = *(void *)(v13 + 8 * v28);
      }
      while (v32 == -1);
      unint64_t v17 = __clz(__rbit64(~v32)) + (v28 << 6);
    }
    *(void *)(v13 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    uint64_t result = (*v14)(*(void *)(v8 + 48) + v17 * v25, v5, v2);
    ++*(void *)(v8 + 16);
    uint64_t v6 = v23;
  }
  int64_t v22 = v20 + 3;
  if (v22 >= v36)
  {
LABEL_33:
    uint64_t result = swift_release_n();
    uint64_t v1 = v34;
    goto LABEL_35;
  }
  unint64_t v21 = *(void *)(v35 + 8 * v22);
  if (v21)
  {
    int64_t v16 = v22;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v16 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (v16 >= v36) {
      goto LABEL_33;
    }
    unint64_t v21 = *(void *)(v35 + 8 * v16);
    ++v22;
    if (v21) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_257311C30()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_2573216B8();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v33 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269FE5918);
  uint64_t v7 = sub_257321B08();
  uint64_t v8 = v7;
  if (!*(void *)(v6 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    *uint64_t v1 = v8;
    return result;
  }
  uint64_t v9 = 1 << *(unsigned char *)(v6 + 32);
  uint64_t v10 = *(void *)(v6 + 56);
  uint64_t v34 = v0;
  uint64_t v35 = v6 + 56;
  if (v9 < 64) {
    uint64_t v11 = ~(-1 << v9);
  }
  else {
    uint64_t v11 = -1;
  }
  unint64_t v12 = v11 & v10;
  int64_t v36 = (unint64_t)(v9 + 63) >> 6;
  uint64_t v37 = v3 + 16;
  uint64_t v13 = v7 + 56;
  uint64_t v38 = v3;
  uint64_t v14 = (uint64_t (**)(unint64_t, char *, uint64_t))(v3 + 32);
  uint64_t result = swift_retain();
  int64_t v16 = 0;
  while (1)
  {
    if (v12)
    {
      unint64_t v18 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v19 = v18 | (v16 << 6);
      goto LABEL_24;
    }
    int64_t v20 = v16 + 1;
    if (__OFADD__(v16, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v20 >= v36) {
      goto LABEL_33;
    }
    unint64_t v21 = *(void *)(v35 + 8 * v20);
    ++v16;
    if (!v21)
    {
      int64_t v16 = v20 + 1;
      if (v20 + 1 >= v36) {
        goto LABEL_33;
      }
      unint64_t v21 = *(void *)(v35 + 8 * v16);
      if (!v21)
      {
        int64_t v16 = v20 + 2;
        if (v20 + 2 >= v36) {
          goto LABEL_33;
        }
        unint64_t v21 = *(void *)(v35 + 8 * v16);
        if (!v21) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v12 = (v21 - 1) & v21;
    unint64_t v19 = __clz(__rbit64(v21)) + (v16 << 6);
LABEL_24:
    uint64_t v23 = v6;
    uint64_t v24 = *(void *)(v6 + 48);
    uint64_t v25 = *(void *)(v38 + 72);
    (*(void (**)(char *, unint64_t, uint64_t))(v38 + 16))(v5, v24 + v25 * v19, v2);
    sub_257311FE0(&qword_269FE5908, MEMORY[0x263F48AD0]);
    uint64_t result = sub_2573217B8();
    uint64_t v26 = -1 << *(unsigned char *)(v8 + 32);
    unint64_t v27 = result & ~v26;
    unint64_t v28 = v27 >> 6;
    if (((-1 << v27) & ~*(void *)(v13 + 8 * (v27 >> 6))) != 0)
    {
      unint64_t v17 = __clz(__rbit64((-1 << v27) & ~*(void *)(v13 + 8 * (v27 >> 6)))) | v27 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v29 = 0;
      unint64_t v30 = (unint64_t)(63 - v26) >> 6;
      do
      {
        if (++v28 == v30 && (v29 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        BOOL v31 = v28 == v30;
        if (v28 == v30) {
          unint64_t v28 = 0;
        }
        v29 |= v31;
        uint64_t v32 = *(void *)(v13 + 8 * v28);
      }
      while (v32 == -1);
      unint64_t v17 = __clz(__rbit64(~v32)) + (v28 << 6);
    }
    *(void *)(v13 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    uint64_t result = (*v14)(*(void *)(v8 + 48) + v17 * v25, v5, v2);
    ++*(void *)(v8 + 16);
    uint64_t v6 = v23;
  }
  int64_t v22 = v20 + 3;
  if (v22 >= v36)
  {
LABEL_33:
    uint64_t result = swift_release_n();
    uint64_t v1 = v34;
    goto LABEL_35;
  }
  unint64_t v21 = *(void *)(v35 + 8 * v22);
  if (v21)
  {
    int64_t v16 = v22;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v16 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (v16 >= v36) {
      goto LABEL_33;
    }
    unint64_t v21 = *(void *)(v35 + 8 * v16);
    ++v22;
    if (v21) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_257311FE0(unint64_t *a1, void (*a2)(uint64_t))
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

id NHOActionSetIntent.__allocating_init(homeID:homeName:actionSetID:actionSetName:icon:iconTintColor:)(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  id v13 = objc_msgSend(objc_allocWithZone(v12), sel_init);
  swift_retain();
  sub_2573213D8();
  swift_release();
  swift_retain();
  sub_2573213D8();
  swift_release();
  swift_bridgeObjectRetain();
  swift_retain();
  sub_2573213D8();
  swift_release();
  swift_retain();
  sub_2573213D8();
  swift_release();
  swift_retain();
  sub_2573213D8();
  swift_release();
  swift_retain();
  sub_2573213D8();
  swift_release();
  swift_retain();
  sub_2573213D8();
  swift_release();
  swift_retain();
  sub_2573213D8();

  swift_release();
  return v13;
}

uint64_t sub_257312220()
{
  uint64_t v0 = sub_2573214C8();
  __swift_allocate_value_buffer(v0, qword_269FE5928);
  __swift_project_value_buffer(v0, (uint64_t)qword_269FE5928);
  return sub_2573214B8();
}

uint64_t static NHOActionSetIntent.title.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_25730085C(&qword_269FE5308, MEMORY[0x263F06D40], (uint64_t)qword_269FE5928, a1);
}

uint64_t static NHOActionSetIntent.title.setter(uint64_t a1)
{
  return sub_257300944(a1, &qword_269FE5308, MEMORY[0x263F06D40], (uint64_t)qword_269FE5928);
}

uint64_t (*static NHOActionSetIntent.title.modify())()
{
  if (qword_269FE5308 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_2573214C8();
  __swift_project_value_buffer(v0, (uint64_t)qword_269FE5928);
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_257312380()
{
  uint64_t v0 = sub_257321438();
  __swift_allocate_value_buffer(v0, qword_269FE5940);
  __swift_project_value_buffer(v0, (uint64_t)qword_269FE5940);
  return sub_257321428();
}

uint64_t static NHOActionSetIntent.description.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_25730085C(&qword_269FE5310, MEMORY[0x263EFBA28], (uint64_t)qword_269FE5940, a1);
}

uint64_t static NHOActionSetIntent.description.setter(uint64_t a1)
{
  return sub_257300944(a1, &qword_269FE5310, MEMORY[0x263EFBA28], (uint64_t)qword_269FE5940);
}

uint64_t (*static NHOActionSetIntent.description.modify())()
{
  if (qword_269FE5310 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_257321438();
  __swift_project_value_buffer(v0, (uint64_t)qword_269FE5940);
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t NHOActionSetIntent.homeID.getter()
{
  return sub_257300C20();
}

uint64_t NHOActionSetIntent.homeID.setter()
{
  return sub_257300CF4();
}

uint64_t (*NHOActionSetIntent.homeID.modify(void *a1))()
{
  uint64_t v3 = malloc(0x30uLL);
  *a1 = v3;
  v3[4] = *(void *)(v1 + OBJC_IVAR___NHOActionSetIntent__homeID);
  swift_retain();
  v3[5] = sub_2573213B8();
  return sub_257300B6C;
}

uint64_t NHOActionSetIntent.$homeID.getter()
{
  return sub_257300EB8();
}

uint64_t NHOActionSetIntent.homeName.getter()
{
  return sub_257300C20();
}

uint64_t NHOActionSetIntent.homeName.setter()
{
  return sub_257300CF4();
}

uint64_t (*NHOActionSetIntent.homeName.modify(void *a1))()
{
  uint64_t v3 = malloc(0x30uLL);
  *a1 = v3;
  v3[4] = *(void *)(v1 + OBJC_IVAR___NHOActionSetIntent__homeName);
  swift_retain();
  v3[5] = sub_2573213B8();
  return sub_257300B6C;
}

uint64_t NHOActionSetIntent.$homeName.getter()
{
  return sub_257300EB8();
}

uint64_t NHOActionSetIntent.actionSetID.getter()
{
  return sub_257300C20();
}

uint64_t NHOActionSetIntent.actionSetID.setter()
{
  return sub_257300CF4();
}

uint64_t (*NHOActionSetIntent.actionSetID.modify(void *a1))()
{
  uint64_t v3 = malloc(0x30uLL);
  *a1 = v3;
  v3[4] = *(void *)(v1 + OBJC_IVAR___NHOActionSetIntent__actionSetID);
  swift_retain();
  v3[5] = sub_2573213B8();
  return sub_257300B6C;
}

uint64_t NHOActionSetIntent.$actionSetID.getter()
{
  return sub_257300EB8();
}

uint64_t NHOActionSetIntent.actionSetName.getter()
{
  return sub_257300C20();
}

uint64_t NHOActionSetIntent.actionSetName.setter()
{
  return sub_257300CF4();
}

uint64_t (*NHOActionSetIntent.actionSetName.modify(void *a1))()
{
  uint64_t v3 = malloc(0x30uLL);
  *a1 = v3;
  v3[4] = *(void *)(v1 + OBJC_IVAR___NHOActionSetIntent__actionSetName);
  swift_retain();
  v3[5] = sub_2573213B8();
  return sub_257300B6C;
}

uint64_t NHOActionSetIntent.$actionSetName.getter()
{
  return sub_257300EB8();
}

uint64_t NHOActionSetIntent.icon.getter()
{
  return sub_257300C20();
}

uint64_t NHOActionSetIntent.icon.setter()
{
  return sub_257300CF4();
}

uint64_t (*NHOActionSetIntent.icon.modify(void *a1))()
{
  uint64_t v3 = malloc(0x30uLL);
  *a1 = v3;
  v3[4] = *(void *)(v1 + OBJC_IVAR___NHOActionSetIntent__icon);
  swift_retain();
  v3[5] = sub_2573213B8();
  return sub_257300B6C;
}

uint64_t NHOActionSetIntent.$icon.getter()
{
  return sub_257300EB8();
}

uint64_t NHOActionSetIntent.useHomeKitRecommendations.getter()
{
  swift_retain();
  sub_2573213C8();
  swift_release();
  return v1;
}

uint64_t NHOActionSetIntent.useHomeKitRecommendations.setter()
{
  return swift_release();
}

uint64_t sub_2573129A0@<X0>(unsigned char *a1@<X8>)
{
  swift_retain();
  sub_2573213C8();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_2573129F8()
{
  return swift_release();
}

uint64_t (*NHOActionSetIntent.useHomeKitRecommendations.modify(void *a1))()
{
  char v3 = malloc(0x30uLL);
  *a1 = v3;
  v3[4] = *(void *)(v1 + OBJC_IVAR___NHOActionSetIntent__useHomeKitRecommendations);
  swift_retain();
  v3[5] = sub_2573213B8();
  return sub_257300B6C;
}

uint64_t NHOActionSetIntent.$useHomeKitRecommendations.getter()
{
  return sub_257300EB8();
}

id sub_257312AD8(void *a1)
{
  id v1 = a1;
  swift_retain();
  sub_2573213C8();

  swift_release();
  uint64_t v2 = (void *)sub_2573217E8();
  swift_bridgeObjectRelease();

  return v2;
}

uint64_t NHOActionSetIntent.accessoriesAndScenes.getter()
{
  return sub_257300C20();
}

uint64_t sub_257312B6C(void *a1)
{
  sub_2573217F8();
  id v2 = a1;
  swift_retain();
  sub_2573213D8();

  return swift_release();
}

uint64_t NHOActionSetIntent.accessoriesAndScenes.setter()
{
  return sub_257300CF4();
}

uint64_t (*NHOActionSetIntent.accessoriesAndScenes.modify(void *a1))()
{
  char v3 = malloc(0x30uLL);
  *a1 = v3;
  v3[4] = *(void *)(v1 + OBJC_IVAR___NHOActionSetIntent__accessoriesAndScenes);
  swift_retain();
  v3[5] = sub_2573213B8();
  return sub_257300B6C;
}

uint64_t NHOActionSetIntent.$accessoriesAndScenes.getter()
{
  return sub_257300EB8();
}

uint64_t NHOActionSetIntent.requestConfirmationText.getter()
{
  return sub_257300C20();
}

uint64_t NHOActionSetIntent.requestConfirmationText.setter()
{
  return sub_257300CF4();
}

uint64_t (*NHOActionSetIntent.requestConfirmationText.modify(void *a1))()
{
  char v3 = malloc(0x30uLL);
  *a1 = v3;
  v3[4] = *(void *)(v1 + OBJC_IVAR___NHOActionSetIntent__requestConfirmationText);
  swift_retain();
  v3[5] = sub_2573213B8();
  return sub_257300B6C;
}

uint64_t NHOActionSetIntent.$requestConfirmationText.getter()
{
  return sub_257300EB8();
}

uint64_t NHOActionSetIntent.requestConfirmationIcon.getter()
{
  return sub_257300C20();
}

uint64_t NHOActionSetIntent.requestConfirmationIcon.setter()
{
  return sub_257300CF4();
}

uint64_t (*NHOActionSetIntent.requestConfirmationIcon.modify(void *a1))()
{
  char v3 = malloc(0x30uLL);
  *a1 = v3;
  v3[4] = *(void *)(v1 + OBJC_IVAR___NHOActionSetIntent__requestConfirmationIcon);
  swift_retain();
  v3[5] = sub_2573213B8();
  return sub_257300B6C;
}

uint64_t NHOActionSetIntent.$requestConfirmationIcon.getter()
{
  return sub_257300EB8();
}

uint64_t NHOActionSetIntent.isSmartStack.getter()
{
  swift_retain();
  sub_2573213C8();
  swift_release();
  return v1;
}

uint64_t sub_257312DE4@<X0>(unsigned char *a1@<X8>)
{
  swift_retain();
  sub_2573213C8();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_257312E3C()
{
  return swift_release();
}

uint64_t NHOActionSetIntent.isSmartStack.setter()
{
  return swift_release();
}

uint64_t (*NHOActionSetIntent.isSmartStack.modify(void *a1))()
{
  char v3 = malloc(0x30uLL);
  *a1 = v3;
  v3[4] = *(void *)(v1 + OBJC_IVAR___NHOActionSetIntent__isSmartStack);
  swift_retain();
  v3[5] = sub_2573213B8();
  return sub_257300B6C;
}

uint64_t NHOActionSetIntent.$isSmartStack.getter()
{
  return sub_257300EB8();
}

uint64_t NHOActionSetIntent.iconTintColor.getter()
{
  return sub_257300C20();
}

uint64_t sub_257312F68@<X0>(void *a1@<X8>)
{
  swift_retain();
  sub_2573213C8();
  uint64_t result = swift_release();
  *a1 = v3;
  a1[1] = v4;
  return result;
}

uint64_t NHOActionSetIntent.iconTintColor.setter()
{
  return sub_257300CF4();
}

uint64_t (*NHOActionSetIntent.iconTintColor.modify(void *a1))()
{
  uint64_t v3 = malloc(0x30uLL);
  *a1 = v3;
  v3[4] = *(void *)(v1 + OBJC_IVAR___NHOActionSetIntent__iconTintColor);
  swift_retain();
  v3[5] = sub_2573213B8();
  return sub_257300B6C;
}

uint64_t NHOActionSetIntent.$iconTintColor.getter()
{
  return sub_257300EB8();
}

id NHOActionSetIntent.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

id NHOActionSetIntent.init()()
{
  id v1 = v0;
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269FE5638);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v86 = (char *)v79 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v104 = sub_257321468();
  uint64_t v4 = *(void *)(v104 - 8);
  MEMORY[0x270FA5388](v104);
  uint64_t v6 = (char *)v79 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_269FE5400);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)v79 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_269FE5408);
  MEMORY[0x270FA5388](v10 - 8);
  unint64_t v12 = (char *)v79 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_269FE5410);
  MEMORY[0x270FA5388](v13 - 8);
  int64_t v15 = (char *)v79 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_2573214C8();
  uint64_t v105 = v16;
  uint64_t v17 = *(void *)(v16 - 8);
  MEMORY[0x270FA5388](v16);
  unint64_t v19 = (char *)v79 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v85 = OBJC_IVAR___NHOActionSetIntent__homeID;
  uint64_t v92 = __swift_instantiateConcreteTypeFromMangledName(&qword_269FE5658);
  uint64_t v102 = v1;
  sub_2573214B8();
  int64_t v20 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v17 + 56);
  uint64_t v94 = v17 + 56;
  uint64_t v101 = v20;
  v20(v15, 1, 1, v16);
  uint64_t v21 = sub_2573217D8();
  v108._countAndFlagsBits = 0;
  v108._object = 0;
  uint64_t v22 = *(void *)(v21 - 8);
  id v95 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v22 + 56);
  uint64_t v96 = v22 + 56;
  uint64_t v98 = v21;
  v95(v12, 1, 1, v21);
  uint64_t v103 = sub_257321398();
  uint64_t v23 = *(void *)(v103 - 8);
  uint64_t v24 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v23 + 56);
  uint64_t v99 = v23 + 56;
  uint64_t v100 = v24;
  v24(v9, 1, 1, v103);
  unsigned int v106 = *MEMORY[0x263EFBDC8];
  uint64_t v91 = *(void (**)(char *))(v4 + 104);
  uint64_t v25 = v104;
  v91(v6);
  uint64_t v97 = v4 + 104;
  uint64_t v89 = v19;
  id v88 = v15;
  *(void *)(v83 + v85) = sub_257321408();
  uint64_t v85 = OBJC_IVAR___NHOActionSetIntent__homeName;
  sub_2573214B8();
  uint64_t v26 = v105;
  v101(v15, 1, 1, v105);
  v108._countAndFlagsBits = 0;
  v108._object = 0;
  uint64_t v27 = v21;
  unint64_t v28 = v95;
  v95(v12, 1, 1, v27);
  unint64_t v93 = v9;
  v100(v9, 1, 1, v103);
  char v29 = v91;
  ((void (*)(char *, void, uint64_t))v91)(v6, v106, v25);
  unint64_t v30 = v88;
  *(void *)&v102[v85] = sub_257321408();
  uint64_t v85 = OBJC_IVAR___NHOActionSetIntent__actionSetID;
  sub_2573214B8();
  BOOL v31 = v30;
  uint64_t v32 = v101;
  v101(v31, 1, 1, v26);
  v108._countAndFlagsBits = 0;
  v108._object = 0;
  v28(v12, 1, 1, v98);
  uint64_t v33 = v103;
  uint64_t v34 = v100;
  v100(v93, 1, 1, v103);
  uint64_t v90 = v6;
  ((void (*)(char *, void, uint64_t))v29)(v6, v106, v104);
  uint64_t v35 = v88;
  uint64_t v87 = v12;
  *(void *)&v102[v85] = sub_257321408();
  uint64_t v85 = OBJC_IVAR___NHOActionSetIntent__actionSetName;
  sub_2573214B8();
  int64_t v36 = v35;
  v32(v35, 1, 1, v105);
  v108._countAndFlagsBits = 0;
  v108._object = 0;
  uint64_t v37 = v98;
  uint64_t v38 = v95;
  v95(v12, 1, 1, v98);
  v34(v93, 1, 1, v33);
  int64_t v40 = v90;
  uint64_t v39 = v91;
  ((void (*)(char *, void, uint64_t))v91)(v90, v106, v104);
  uint64_t v41 = v87;
  *(void *)&v102[v85] = sub_257321408();
  uint64_t v85 = OBJC_IVAR___NHOActionSetIntent__icon;
  sub_2573214B8();
  uint64_t v42 = v101;
  v101(v36, 1, 1, v105);
  v108._countAndFlagsBits = 0;
  v108._object = 0;
  v38(v41, 1, 1, v37);
  unint64_t v43 = v93;
  v100(v93, 1, 1, v103);
  uint64_t v44 = v104;
  ((void (*)(char *, void, uint64_t))v39)(v40, v106, v104);
  uint64_t v45 = v88;
  uint64_t v46 = sub_257321408();
  uint64_t v47 = v102;
  *(void *)&v102[v85] = v46;
  uint64_t v85 = OBJC_IVAR___NHOActionSetIntent__useHomeKitRecommendations;
  uint64_t v80 = __swift_instantiateConcreteTypeFromMangledName(&qword_269FE5650);
  sub_2573214B8();
  uint64_t v48 = v105;
  v42(v45, 1, 1, v105);
  LOBYTE(v108._countAndFlagsBits) = 2;
  uint64_t v82 = sub_257321918();
  uint64_t v49 = *(void *)(v82 - 8);
  uint64_t v81 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v49 + 56);
  uint64_t v83 = v49 + 56;
  v81(v86, 1, 1, v82);
  uint64_t v50 = v103;
  uint64_t v51 = v100;
  v100(v43, 1, 1, v103);
  uint64_t v52 = v91;
  ((void (*)(char *, void, uint64_t))v91)(v90, v106, v44);
  char v53 = v88;
  *(void *)&v47[v85] = sub_257321418();
  uint64_t v85 = OBJC_IVAR___NHOActionSetIntent__accessoriesAndScenes;
  sub_2573214B8();
  v101(v53, 1, 1, v48);
  v108._countAndFlagsBits = 0;
  v108._object = 0;
  uint64_t v54 = v87;
  v95(v87, 1, 1, v98);
  uint64_t v55 = v93;
  v51(v93, 1, 1, v50);
  uint64_t v56 = v90;
  ((void (*)(char *, void, uint64_t))v52)(v90, v106, v104);
  uint64_t v57 = v56;
  *(void *)&v102[v85] = sub_257321408();
  uint64_t v80 = OBJC_IVAR___NHOActionSetIntent__requestConfirmationText;
  uint64_t v85 = __swift_instantiateConcreteTypeFromMangledName(&qword_269FE5418);
  v79[1] = 0xD000000000000017;
  sub_2573214B8();
  char v58 = v53;
  v101(v53, 1, 1, v105);
  v108._countAndFlagsBits = 0;
  v108._object = 0;
  v95(v54, 1, 1, v98);
  uint64_t v59 = v100;
  v100(v55, 1, 1, v103);
  uint64_t v60 = v57;
  uint64_t v61 = v106;
  ((void (*)(char *, void, uint64_t))v91)(v60, v106, v104);
  uint64_t v62 = sub_257321408();
  char v63 = v102;
  *(void *)&v102[v80] = v62;
  uint64_t v80 = OBJC_IVAR___NHOActionSetIntent__requestConfirmationIcon;
  sub_2573214B8();
  v101(v58, 1, 1, v105);
  v108._countAndFlagsBits = 0;
  v108._object = 0;
  v95(v54, 1, 1, v98);
  v59(v93, 1, 1, v103);
  uint64_t v64 = v61;
  uint64_t v65 = v104;
  uint64_t v66 = v91;
  ((void (*)(char *, uint64_t, uint64_t))v91)(v90, v64, v104);
  *(void *)&v63[v80] = sub_257321408();
  uint64_t v85 = OBJC_IVAR___NHOActionSetIntent__isSmartStack;
  uint64_t v80 = __swift_instantiateConcreteTypeFromMangledName(&qword_269FE5660);
  sub_2573214B8();
  uint64_t v67 = v101;
  v101(v58, 1, 1, v105);
  LOBYTE(v108._countAndFlagsBits) = 2;
  v81(v86, 1, 1, v82);
  unsigned int v68 = v93;
  v100(v93, 1, 1, v103);
  uint64_t v69 = v90;
  ((void (*)(char *, void, uint64_t))v66)(v90, v106, v65);
  uint64_t v70 = sub_257321418();
  uint64_t v71 = v102;
  *(void *)&v102[v85] = v70;
  uint64_t v72 = OBJC_IVAR___NHOActionSetIntent__iconTintColor;
  sub_2573214B8();
  v67(v58, 1, 1, v105);
  v108._countAndFlagsBits = 0;
  v108._object = 0;
  v95(v87, 1, 1, v98);
  v100(v68, 1, 1, v103);
  ((void (*)(char *, void, uint64_t))v66)(v69, v106, v104);
  *(void *)&v71[v72] = sub_257321408();

  v107.id receiver = v71;
  v107.super_class = ObjectType;
  id v73 = objc_msgSendSuper2(&v107, sel_init);
  v108._countAndFlagsBits = 0xD000000000000024;
  v108._object = (void *)0x8000000257324A30;
  id v74 = v73;
  swift_retain();
  sub_2573213D8();
  swift_release();
  v108._countAndFlagsBits = _s15NanoHomeIntents21NHOIntentLocalizationC15localizedStringyS2SFZ_0(0xD00000000000001CLL, 0x8000000257324A60);
  v108._object = v75;
  swift_retain();
  sub_2573213D8();
  swift_release();
  v108._countAndFlagsBits = 0xD000000000000024;
  v108._object = (void *)0x8000000257324A30;
  swift_retain();
  sub_2573213D8();
  swift_release();
  v108._countAndFlagsBits = _s15NanoHomeIntents21NHOIntentLocalizationC15localizedStringyS2SFZ_0(0xD000000000000021, 0x8000000257324A80);
  v108._object = v76;
  swift_retain();
  sub_2573213D8();
  swift_release();
  v108._countAndFlagsBits = 0x74696B656D6F68;
  v108._object = (void *)0xE700000000000000;
  swift_retain();
  sub_2573213D8();
  swift_release();
  sub_257321728();
  Swift::String v77 = Color.toHexString()();
  swift_release();
  Swift::String v108 = v77;
  swift_retain();
  sub_2573213D8();
  swift_release();
  v108._countAndFlagsBits = 0xD000000000000024;
  v108._object = (void *)0x8000000257324A30;
  swift_retain();
  sub_2573213D8();
  swift_release();
  LOBYTE(v108._countAndFlagsBits) = 0;
  swift_retain();
  sub_2573213D8();

  swift_release();
  return v74;
}

uint64_t NHOActionSetIntent.perform()(uint64_t a1)
{
  *(void *)(v1 + 24) = a1;
  return MEMORY[0x270FA2498](sub_257306980, 0, 0);
}

id NHOActionSetIntent.__deallocating_deinit()
{
  v2.id receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_25731422C@<X0>(uint64_t a1@<X8>)
{
  if (qword_269FE5308 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_2573214C8();
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)qword_269FE5928);
  swift_beginAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t sub_2573142EC(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_257306DBC;
  v3[3] = a1;
  return MEMORY[0x270FA2498](sub_257306980, 0, 0);
}

uint64_t sub_257314398()
{
  uint64_t v1 = sub_2573144A4(&qword_269FE59B8);

  return MEMORY[0x270EE0D28](v0, v1);
}

uint64_t sub_2573143E4()
{
  return sub_2573144A4(&qword_269FE59B8);
}

uint64_t type metadata accessor for NHOActionSetIntent()
{
  return self;
}

uint64_t sub_25731443C()
{
  return sub_2573144A4(&qword_269FE59C0);
}

uint64_t sub_257314470()
{
  return sub_2573144A4((unint64_t *)&unk_269FE59C8);
}

uint64_t sub_2573144A4(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for NHOActionSetIntent();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_2573144E4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_257314500()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_25731456C@<X0>(void *a1@<X8>)
{
  return sub_257312F68(a1);
}

uint64_t sub_25731458C()
{
  return sub_257300D90();
}

uint64_t sub_2573145AC@<X0>(void *a1@<X8>)
{
  return sub_257312F68(a1);
}

uint64_t sub_2573145CC()
{
  return sub_257300D90();
}

uint64_t sub_2573145EC@<X0>(void *a1@<X8>)
{
  return sub_257312F68(a1);
}

uint64_t sub_25731460C()
{
  return sub_257300D90();
}

uint64_t sub_25731462C@<X0>(void *a1@<X8>)
{
  return sub_257312F68(a1);
}

uint64_t sub_25731464C()
{
  return sub_257300D90();
}

uint64_t sub_25731466C@<X0>(void *a1@<X8>)
{
  return sub_257312F68(a1);
}

uint64_t sub_25731468C()
{
  return sub_257300D90();
}

uint64_t sub_2573146B4@<X0>(void *a1@<X8>)
{
  return sub_257312F68(a1);
}

uint64_t sub_2573146D4()
{
  return sub_257300D90();
}

double sub_2573146F4@<D0>(_OWORD *a1@<X8>)
{
  return sub_257300D3C(a1);
}

uint64_t sub_257314714()
{
  return sub_257300D90();
}

double sub_257314734@<D0>(_OWORD *a1@<X8>)
{
  return sub_257300D3C(a1);
}

uint64_t sub_257314754()
{
  return sub_257300D90();
}

uint64_t sub_25731477C@<X0>(void *a1@<X8>)
{
  return sub_257312F68(a1);
}

uint64_t sub_25731479C()
{
  return sub_257300D90();
}

unint64_t sub_2573147C0()
{
  unint64_t result = qword_269FE56F8;
  if (!qword_269FE56F8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269FE5700);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269FE56F8);
  }
  return result;
}

unint64_t static NHOIntentConstants.appContainerBundleIdentifier.getter()
{
  return 0xD000000000000012;
}

unint64_t static NHOIntentConstants.widgetBundleIdentifier.getter()
{
  return 0xD000000000000022;
}

uint64_t static NHOIntentConstants.WidgetKind.Launcher.getter()
{
  return 0x656D6F486F6E614ELL;
}

unint64_t static NHOIntentConstants.WidgetKind.Energy.getter()
{
  return 0xD000000000000031;
}

unint64_t static NHOIntentConstants.WidgetKind.Accessory.getter()
{
  return 0xD000000000000027;
}

unint64_t static NHOIntentConstants.WidgetKind.ActionSets.getter()
{
  return 0xD000000000000026;
}

unint64_t static NHOIntentConstants.WidgetKind.SmartStack.getter()
{
  return 0xD00000000000002CLL;
}

unint64_t static NHOIntentConstants.WidgetKind.ElectricityUsage.getter()
{
  return 0xD000000000000029;
}

unint64_t static NHOIntentConstants.WidgetKind.ElectricityRates.getter()
{
  return 0xD000000000000029;
}

id NHOIntentConstants.WidgetKind.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

id NHOIntentConstants.WidgetKind.init()()
{
  v2.id receiver = v0;
  v2.super_class = (Class)type metadata accessor for NHOIntentConstants.WidgetKind();
  return objc_msgSendSuper2(&v2, sel_init);
}

uint64_t type metadata accessor for NHOIntentConstants.WidgetKind()
{
  return self;
}

id NHOIntentConstants.WidgetKind.__deallocating_deinit()
{
  v2.id receiver = v0;
  v2.super_class = (Class)type metadata accessor for NHOIntentConstants.WidgetKind();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id NHOIntentConstants.init()()
{
  v2.id receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_init);
}

id NHOIntentConstants.__deallocating_deinit()
{
  v2.id receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for NHOIntentConstants()
{
  return self;
}

id ElectricityUsageIntent.__allocating_init(homeIdentifier:homeName:)()
{
  id v1 = objc_msgSend(objc_allocWithZone(v0), sel_init);
  swift_retain();
  sub_2573213D8();
  swift_release();
  swift_retain();
  sub_2573213D8();

  swift_release();
  return v1;
}

uint64_t sub_257314E00()
{
  uint64_t v0 = sub_2573214C8();
  __swift_allocate_value_buffer(v0, qword_269FE59D8);
  __swift_project_value_buffer(v0, (uint64_t)qword_269FE59D8);
  return sub_2573214B8();
}

uint64_t static ElectricityUsageIntent.title.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_25730085C(&qword_269FE5318, MEMORY[0x263F06D40], (uint64_t)qword_269FE59D8, a1);
}

uint64_t static ElectricityUsageIntent.title.setter(uint64_t a1)
{
  return sub_257300944(a1, &qword_269FE5318, MEMORY[0x263F06D40], (uint64_t)qword_269FE59D8);
}

uint64_t (*static ElectricityUsageIntent.title.modify())()
{
  if (qword_269FE5318 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_2573214C8();
  __swift_project_value_buffer(v0, (uint64_t)qword_269FE59D8);
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_257314F68()
{
  uint64_t v0 = sub_257321438();
  __swift_allocate_value_buffer(v0, qword_269FE59F0);
  __swift_project_value_buffer(v0, (uint64_t)qword_269FE59F0);
  return sub_257321428();
}

uint64_t static ElectricityUsageIntent.description.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_25730085C(&qword_269FE5320, MEMORY[0x263EFBA28], (uint64_t)qword_269FE59F0, a1);
}

uint64_t static ElectricityUsageIntent.description.setter(uint64_t a1)
{
  return sub_257300944(a1, &qword_269FE5320, MEMORY[0x263EFBA28], (uint64_t)qword_269FE59F0);
}

uint64_t (*static ElectricityUsageIntent.description.modify())()
{
  if (qword_269FE5320 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_257321438();
  __swift_project_value_buffer(v0, (uint64_t)qword_269FE59F0);
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t ElectricityUsageIntent.homeID.getter()
{
  return sub_257300C20();
}

uint64_t ElectricityUsageIntent.homeID.setter()
{
  return sub_257300CF4();
}

uint64_t (*ElectricityUsageIntent.homeID.modify(void *a1))()
{
  uint64_t v3 = malloc(0x30uLL);
  *a1 = v3;
  v3[4] = *(void *)(v1 + OBJC_IVAR___NHOElectricityUsageIntent__homeID);
  swift_retain();
  v3[5] = sub_2573213B8();
  return sub_257300B6C;
}

uint64_t ElectricityUsageIntent.$homeID.getter()
{
  return sub_257300EB8();
}

uint64_t ElectricityUsageIntent.homeName.getter()
{
  return sub_257300C20();
}

uint64_t ElectricityUsageIntent.homeName.setter()
{
  return sub_257300CF4();
}

uint64_t (*ElectricityUsageIntent.homeName.modify(void *a1))()
{
  uint64_t v3 = malloc(0x30uLL);
  *a1 = v3;
  v3[4] = *(void *)(v1 + OBJC_IVAR___NHOElectricityUsageIntent__homeName);
  swift_retain();
  v3[5] = sub_2573213B8();
  return sub_257300B6C;
}

uint64_t ElectricityUsageIntent.$homeName.getter()
{
  return sub_257300EB8();
}

id ElectricityUsageIntent.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

id ElectricityUsageIntent.init()()
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v30 = sub_257321468();
  uint64_t v1 = *(void *)(v30 - 8);
  MEMORY[0x270FA5388](v30);
  uint64_t v3 = (char *)v25 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269FE5400);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)v25 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_269FE5408);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_269FE5410);
  MEMORY[0x270FA5388](v10 - 8);
  unint64_t v12 = (char *)v25 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_2573214C8();
  uint64_t v34 = v13;
  uint64_t v14 = *(void *)(v13 - 8);
  MEMORY[0x270FA5388](v13);
  uint64_t v38 = OBJC_IVAR___NHOElectricityUsageIntent__homeID;
  uint64_t v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_269FE5418);
  uint64_t v39 = v0;
  sub_2573214B8();
  int64_t v15 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v14 + 56);
  uint64_t v33 = v14 + 56;
  uint64_t v35 = v15;
  v15(v12, 1, 1, v13);
  uint64_t v16 = sub_2573217D8();
  uint64_t v42 = 0;
  uint64_t v43 = 0;
  uint64_t v17 = *(void *)(v16 - 8);
  BOOL v31 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v17 + 56);
  uint64_t v32 = v17 + 56;
  v31(v9, 1, 1, v16);
  uint64_t v18 = sub_257321398();
  uint64_t v19 = *(void *)(v18 - 8);
  unint64_t v28 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v19 + 56);
  uint64_t v29 = v19 + 56;
  v28(v6, 1, 1, v18);
  unsigned int v27 = *MEMORY[0x263EFBDC8];
  int64_t v20 = *(void (**)(void))(v1 + 104);
  v25[1] = v1 + 104;
  uint64_t v26 = (void (*)(char *, void, uint64_t))v20;
  uint64_t v21 = v30;
  v20(v3);
  *(void *)(v37 + v38) = sub_257321408();
  uint64_t v38 = OBJC_IVAR___NHOElectricityUsageIntent__homeName;
  sub_2573214B8();
  v35(v12, 1, 1, v34);
  uint64_t v42 = 0;
  uint64_t v43 = 0;
  v31(v9, 1, 1, v16);
  v28(v6, 1, 1, v18);
  v26(v3, v27, v21);
  uint64_t v22 = sub_257321408();
  uint64_t v23 = v39;
  *(void *)&v39[v38] = v22;

  v41.id receiver = v23;
  v41.super_class = ObjectType;
  return objc_msgSendSuper2(&v41, sel_init);
}

id ElectricityUsageIntent.__allocating_init(homeIdentifier:)()
{
  id v1 = objc_msgSend(objc_allocWithZone(v0), sel_init);
  swift_retain();
  sub_2573213D8();

  swift_release();
  return v1;
}

id ElectricityUsageIntent.__deallocating_deinit()
{
  v2.id receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_25731579C()
{
  return sub_257315B68(&qword_269FE5A18);
}

uint64_t type metadata accessor for ElectricityUsageIntent()
{
  return self;
}

uint64_t sub_2573157F4()
{
  return sub_257315B68(&qword_269FE5A20);
}

uint64_t sub_257315828()
{
  return sub_257315B68((unint64_t *)&unk_269FE5A28);
}

uint64_t sub_25731585C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_257315914@<X0>(uint64_t a1@<X8>)
{
  if (qword_269FE5318 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_2573214C8();
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)qword_269FE59D8);
  swift_beginAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t sub_2573159D4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  uint64_t v5 = sub_257315B68(&qword_269FE5A38);
  *uint64_t v4 = v2;
  v4[1] = sub_2573018C8;
  return MEMORY[0x270EE1CC8](a2, v5);
}

uint64_t sub_257315A9C()
{
  uint64_t v1 = sub_257315B68(&qword_269FE5A18);

  return MEMORY[0x270EE0D28](v0, v1);
}

double sub_257315AE8@<D0>(_OWORD *a1@<X8>)
{
  return sub_257300D3C(a1);
}

uint64_t sub_257315B08()
{
  return sub_257300D90();
}

double sub_257315B28@<D0>(_OWORD *a1@<X8>)
{
  return sub_257300D3C(a1);
}

uint64_t sub_257315B48()
{
  return sub_257300D90();
}

uint64_t sub_257315B68(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for ElectricityUsageIntent();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

void HMAccessory.serviceGroup.getter()
{
  id v1 = objc_msgSend(v0, sel_home);
  if (v1)
  {
    uint64_t v2 = v1;
    id v3 = objc_msgSend(v1, sel_serviceGroups);

    sub_2573001D4(0, &qword_269FE58D0);
    unint64_t v4 = sub_2573218D8();

    id v5 = objc_msgSend(v0, sel_services);
    sub_2573001D4(0, &qword_269FE53A0);
    unint64_t v6 = sub_2573218D8();

    if (v6 >> 62) {
      goto LABEL_55;
    }
    uint64_t v7 = *(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v7)
    {
LABEL_4:
      uint64_t v38 = v4 & 0xFFFFFFFFFFFFFF8;
      if (v4 >> 62)
      {
        swift_bridgeObjectRetain();
        uint64_t v41 = sub_257321BA8();
        swift_bridgeObjectRelease();
      }
      else
      {
        uint64_t v41 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
      }
      unint64_t v8 = 0;
      unint64_t v9 = v6 & 0xC000000000000001;
      uint64_t v10 = v6 & 0xFFFFFFFFFFFFFF8;
      unint64_t v11 = v6 + 32;
      unint64_t v39 = v4;
      unint64_t v40 = v4 & 0xC000000000000001;
      unint64_t v36 = v6;
      unint64_t v37 = v4 + 32;
      unint64_t v33 = v6 & 0xC000000000000001;
      uint64_t v34 = v7;
      unint64_t v31 = v6 + 32;
      uint64_t v32 = v6 & 0xFFFFFFFFFFFFFF8;
      do
      {
LABEL_7:
        if (v9)
        {
          id v12 = (id)MEMORY[0x25A2B3680](v8, v6);
        }
        else
        {
          if (v8 >= *(void *)(v10 + 16))
          {
            __break(1u);
            return;
          }
          id v12 = *(id *)(v11 + 8 * v8);
        }
        uint64_t v13 = v12;
        BOOL v14 = __OFADD__(v8++, 1);
        if (v14) {
          goto LABEL_54;
        }
        if (v41)
        {
          unint64_t v35 = v8;
          swift_bridgeObjectRetain();
          unint64_t v15 = 0;
          while (1)
          {
            if (v40)
            {
              id v16 = (id)MEMORY[0x25A2B3680](v15, v39);
            }
            else
            {
              if (v15 >= *(void *)(v38 + 16)) {
                goto LABEL_53;
              }
              id v16 = *(id *)(v37 + 8 * v15);
            }
            uint64_t v17 = v16;
            BOOL v14 = __OFADD__(v15++, 1);
            if (v14) {
              goto LABEL_51;
            }
            id v18 = objc_msgSend(v16, sel_services);
            unint64_t v19 = sub_2573218D8();

            if (v19 >> 62)
            {
              swift_bridgeObjectRetain_n();
              unint64_t v6 = sub_257321BA8();
              swift_bridgeObjectRelease();
              if (!v6) {
                goto LABEL_14;
              }
            }
            else
            {
              unint64_t v6 = *(void *)((v19 & 0xFFFFFFFFFFFFFF8) + 0x10);
              swift_bridgeObjectRetain();
              if (!v6) {
                goto LABEL_14;
              }
            }
            unint64_t v4 = v19 & 0xC000000000000001;
            if ((v19 & 0xC000000000000001) != 0) {
              id v20 = (id)MEMORY[0x25A2B3680](0, v19);
            }
            else {
              id v20 = *(id *)(v19 + 32);
            }
            uint64_t v21 = v20;
            char v22 = sub_257321A18();

            if (v22)
            {
LABEL_49:
              swift_bridgeObjectRelease_n();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease_n();

              return;
            }
            if (v6 != 1)
            {
              if (v4)
              {
                MEMORY[0x25A2B3680](1, v19);
                char v23 = sub_257321A18();
                swift_unknownObjectRelease();
                if (v23) {
                  goto LABEL_49;
                }
                if (v6 != 2)
                {
                  uint64_t v24 = 2;
                  while (1)
                  {
                    MEMORY[0x25A2B3680](v24, v19);
                    uint64_t v25 = v24 + 1;
                    if (__OFADD__(v24, 1)) {
                      break;
                    }
                    unint64_t v4 = sub_257321A18();
                    swift_unknownObjectRelease();
                    if (v4) {
                      goto LABEL_49;
                    }
                    ++v24;
                    if (v25 == v6) {
                      goto LABEL_14;
                    }
                  }
                  __break(1u);
LABEL_51:
                  __break(1u);
                  goto LABEL_52;
                }
              }
              else
              {
                id v26 = *(id *)(v19 + 40);
                char v27 = sub_257321A18();

                if (v27) {
                  goto LABEL_49;
                }
                if (v6 != 2)
                {
                  unint64_t v4 = 6;
                  while (1)
                  {
                    unint64_t v28 = v4 - 3;
                    if (__OFADD__(v4 - 4, 1)) {
                      break;
                    }
                    id v29 = *(id *)(v19 + 8 * v4);
                    char v30 = sub_257321A18();

                    if (v30) {
                      goto LABEL_49;
                    }
                    ++v4;
                    if (v28 == v6) {
                      goto LABEL_14;
                    }
                  }
LABEL_52:
                  __break(1u);
LABEL_53:
                  __break(1u);
LABEL_54:
                  __break(1u);
LABEL_55:
                  swift_bridgeObjectRetain();
                  uint64_t v7 = sub_257321BA8();
                  swift_bridgeObjectRelease();
                  if (!v7) {
                    goto LABEL_47;
                  }
                  goto LABEL_4;
                }
              }
            }
LABEL_14:
            swift_bridgeObjectRelease_n();

            if (v15 == v41)
            {

              unint64_t v4 = v39;
              swift_bridgeObjectRelease();
              unint64_t v8 = v35;
              unint64_t v6 = v36;
              unint64_t v9 = v33;
              uint64_t v7 = v34;
              unint64_t v11 = v31;
              uint64_t v10 = v32;
              if (v35 != v34) {
                goto LABEL_7;
              }
              goto LABEL_47;
            }
          }
        }
      }
      while (v8 != v7);
    }
LABEL_47:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
}

uint64_t HMAccessory.widgetSupportedServiceKind()@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_257321688();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = MEMORY[0x270FA5388](v3);
  uint64_t v7 = (char *)&v157 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = MEMORY[0x270FA5388](v5);
  uint64_t v10 = (char *)&v157 - v9;
  uint64_t v11 = MEMORY[0x270FA5388](v8);
  uint64_t v13 = (char *)&v157 - v12;
  uint64_t v14 = MEMORY[0x270FA5388](v11);
  id v16 = (char *)&v157 - v15;
  uint64_t v17 = MEMORY[0x270FA5388](v14);
  v187 = (char *)&v157 - v18;
  uint64_t v19 = MEMORY[0x270FA5388](v17);
  v191 = (char *)&v157 - v20;
  MEMORY[0x270FA5388](v19);
  v196 = (char *)&v157 - v21;
  char v22 = *(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v4 + 56);
  uint64_t v163 = v4 + 56;
  v164 = v22;
  v22(a1, 1, 1, v3);
  id v188 = v1;
  id v23 = objc_msgSend(v1, sel_services);
  sub_2573001D4(0, &qword_269FE53A0);
  unint64_t v24 = sub_2573218D8();

  unint64_t v26 = v24;
  unint64_t v189 = v24;
  if (v24 >> 62) {
    goto LABEL_47;
  }
  uint64_t v27 = *(void *)((v24 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (v27)
  {
    v159 = v16;
    v157 = v10;
    v160 = v13;
    v158 = v7;
    uint64_t v161 = a1;
    uint64_t v166 = 0;
    unint64_t v185 = v26 & 0xC000000000000001;
    v178 = (char *)&v198;
    v186 = (char **)(v4 + 16);
    v184 = (uint64_t (**)(char *, uint64_t))(v4 + 88);
    int v183 = *MEMORY[0x263F481F0];
    int v181 = *MEMORY[0x263F48138];
    int v180 = *MEMORY[0x263F482B0];
    int v179 = *MEMORY[0x263F480B0];
    int v177 = *MEMORY[0x263F48248];
    int v175 = *MEMORY[0x263F48260];
    id v16 = (char *)(v4 + 8);
    uint64_t v162 = v4;
    v170 = (void (**)(char *, void, uint64_t))(v4 + 104);
    a1 = 4;
    unint64_t v167 = (unint64_t)"tents23NHOWidgetFamilyUtilties";
    unint64_t v169 = 0x8000000257323F90;
    unsigned int v190 = *MEMORY[0x263F48018];
    uint64_t v168 = MEMORY[0x263F8EE58] + 8;
    int v173 = *MEMORY[0x263F480F0];
    *(void *)&long long v25 = 136315906;
    long long v172 = v25;
    *(void *)&long long v25 = 136315650;
    long long v165 = v25;
    int v171 = *MEMORY[0x263F480F8];
    uint64_t v192 = v3;
    v182 = (char *)(v4 + 8);
    uint64_t v176 = v27;
    while (1)
    {
      uint64_t v4 = a1 - 4;
      id v28 = v185 ? (id)MEMORY[0x25A2B3680](a1 - 4, v26) : *(id *)(v26 + 8 * a1);
      id v29 = v28;
      uint64_t v3 = a1 - 3;
      if (__OFADD__(v4, 1)) {
        break;
      }
      if (qword_269FE52D8 != -1) {
        swift_once();
      }
      uint64_t v30 = sub_257321708();
      uint64_t v31 = __swift_project_value_buffer(v30, (uint64_t)qword_269FE5578);
      id v32 = v29;
      id v33 = v188;
      id v34 = v32;
      id v35 = v33;
      unint64_t v36 = sub_2573216E8();
      os_log_type_t v37 = sub_2573219B8();
      BOOL v38 = os_log_type_enabled(v36, v37);
      uint64_t v193 = a1 - 3;
      os_log_t v194 = (os_log_t)a1;
      v195 = (void (*)(void, void))v31;
      if (v38)
      {
        unint64_t v39 = v35;
        uint64_t v40 = swift_slowAlloc();
        v174 = (void (*)(void, void))swift_slowAlloc();
        v199[0] = (uint64_t)v174;
        *(_DWORD *)uint64_t v40 = v172;
        uint64_t v197 = sub_2572FB6C4(0xD00000000000001CLL, v169, v199);
        sub_257321A68();
        *(_WORD *)(v40 + 12) = 2080;
        id v41 = objc_msgSend(v34, sel_name);
        uint64_t v42 = sub_2573217F8();
        unint64_t v44 = v43;

        uint64_t v197 = sub_2572FB6C4(v42, v44, v199);
        sub_257321A68();

        swift_bridgeObjectRelease();
        *(_WORD *)(v40 + 22) = 2080;
        id v45 = objc_msgSend(v34, sel_serviceType);
        uint64_t v46 = sub_2573217F8();
        unint64_t v48 = v47;

        uint64_t v197 = sub_2572FB6C4(v46, v48, v199);
        sub_257321A68();

        swift_bridgeObjectRelease();
        *(_WORD *)(v40 + 32) = 2080;
        id v49 = objc_msgSend(v39, sel_name);
        uint64_t v50 = sub_2573217F8();
        unint64_t v52 = v51;

        id v16 = v182;
        uint64_t v197 = sub_2572FB6C4(v50, v52, v199);
        sub_257321A68();

        char v53 = v39;
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_2572F7000, v36, v37, "%s: Checking service %s of type %s for accessory %s", (uint8_t *)v40, 0x2Au);
        uint64_t v54 = v174;
        swift_arrayDestroy();
        MEMORY[0x25A2B3D30](v54, -1, -1);
        MEMORY[0x25A2B3D30](v40, -1, -1);
      }
      else
      {

        char v53 = v35;
      }
      uint64_t v55 = v196;
      sub_257321A28();
      uint64_t v13 = *v186;
      uint64_t v56 = v191;
      uint64_t v57 = v55;
      uint64_t v58 = v192;
      ((void (*)(char *, char *, uint64_t))*v186)(v191, v57, v192);
      int v59 = (*v184)(v56, v58);
      if (v59 == v183
        || v59 == v181
        || v59 == v180
        || v59 == v179
        || v59 == v177
        || v59 == v175
        || v59 == v190
        || v59 == v173
        || v59 == v171)
      {
        (*v170)(v187, v190, v58);
        sub_25730017C();
        sub_2573218B8();
        sub_2573218B8();
        if (v199[0] == v197 && v199[1] == v198) {
          char v80 = 1;
        }
        else {
          char v80 = sub_257321C18();
        }
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t v81 = *(void (**)(void, void))v16;
        (*(void (**)(char *, uint64_t))v16)(v187, v58);
        if (v80)
        {
          v174 = v81;
          swift_bridgeObjectRelease();
          unsigned int v106 = v159;
          objc_super v107 = v196;
          ((void (*)(char *, char *, uint64_t))v13)(v159, v196, v58);
          Swift::String v108 = v160;
          ((void (*)(char *, char *, uint64_t))v13)(v160, v107, v58);
          id v109 = v53;
          unint64_t v110 = sub_2573216E8();
          os_log_type_t v111 = sub_2573219B8();
          int v112 = v111;
          if (os_log_type_enabled(v110, v111))
          {
            uint64_t v113 = swift_slowAlloc();
            v195 = (void (*)(void, void))swift_slowAlloc();
            v199[0] = (uint64_t)v195;
            *(_DWORD *)uint64_t v113 = v172;
            os_log_t v194 = v110;
            uint64_t v197 = sub_2572FB6C4(0xD00000000000001CLL, v167 | 0x8000000000000000, v199);
            sub_257321A68();
            *(_WORD *)(v113 + 12) = 2080;
            LODWORD(v193) = v112;
            uint64_t v114 = ServiceKind.debugDescription.getter();
            uint64_t v197 = sub_2572FB6C4(v114, v115, v199);
            sub_257321A68();
            swift_bridgeObjectRelease();
            v116 = v106;
            v117 = (void (*)(char *, uint64_t))v174;
            v174(v116, v58);
            *(_WORD *)(v113 + 22) = 2080;
            uint64_t v118 = sub_257321678();
            uint64_t v197 = sub_2572FB6C4(v118, v119, v199);
            sub_257321A68();
            swift_bridgeObjectRelease();
            v117(v108, v58);
            *(_WORD *)(v113 + 32) = 2080;
            id v120 = objc_msgSend(v109, sel_name);
            uint64_t v121 = sub_2573217F8();
            unint64_t v123 = v122;

            uint64_t v197 = sub_2572FB6C4(v121, v123, v199);
            sub_257321A68();

            swift_bridgeObjectRelease();
            os_log_t v124 = v194;
            _os_log_impl(&dword_2572F7000, v194, (os_log_type_t)v193, "%s: Found supported service kind %s(%s) for accessory %s", (uint8_t *)v113, 0x2Au);
            v125 = v195;
            swift_arrayDestroy();
            MEMORY[0x25A2B3D30](v125, -1, -1);
            MEMORY[0x25A2B3D30](v113, -1, -1);
          }
          else
          {

            v153 = (void (*)(char *, uint64_t))v174;
            v174(v108, v58);
            v153(v106, v58);
          }
          goto LABEL_45;
        }
        HMService.primaryControlCharacteristicType.getter();
        if (v82)
        {
          uint64_t v83 = (void *)sub_2573217E8();
          swift_bridgeObjectRelease();
          id v84 = objc_msgSend(v34, sel_hf_characteristicOfType_, v83);

          if (v84) {
            goto LABEL_41;
          }
        }
        else
        {
          id v85 = objc_msgSend(v34, sel_characteristics);
          sub_2573001D4(0, &qword_269FE53B0);
          unint64_t v86 = sub_2573218D8();

          id v87 = v34;
          uint64_t v88 = v166;
          uint64_t v89 = sub_257300210(v86);
          uint64_t v166 = v88;
          uint64_t v58 = v192;
          swift_bridgeObjectRelease();

          if (v89)
          {
LABEL_41:
            v174 = v81;
            swift_bridgeObjectRelease();
            v126 = v157;
            v127 = v196;
            ((void (*)(char *, char *, uint64_t))v13)(v157, v196, v58);
            v128 = v158;
            ((void (*)(char *, char *, uint64_t))v13)(v158, v127, v58);
            id v129 = v34;
            id v130 = v53;
            id v131 = v129;
            id v132 = v130;
            v133 = sub_2573216E8();
            os_log_type_t v134 = sub_2573219B8();
            int v135 = v134;
            if (os_log_type_enabled(v133, v134))
            {
              uint64_t v136 = swift_slowAlloc();
              v195 = (void (*)(void, void))swift_slowAlloc();
              v199[0] = (uint64_t)v195;
              *(_DWORD *)uint64_t v136 = 136316162;
              os_log_t v194 = v133;
              uint64_t v197 = sub_2572FB6C4(0xD00000000000001CLL, v167 | 0x8000000000000000, v199);
              sub_257321A68();
              *(_WORD *)(v136 + 12) = 2080;
              LODWORD(v193) = v135;
              uint64_t v137 = ServiceKind.debugDescription.getter();
              uint64_t v197 = sub_2572FB6C4(v137, v138, v199);
              sub_257321A68();
              swift_bridgeObjectRelease();
              v139 = v126;
              v140 = (void (*)(char *, uint64_t))v174;
              v174(v139, v58);
              *(_WORD *)(v136 + 22) = 2080;
              uint64_t v141 = sub_257321678();
              uint64_t v197 = sub_2572FB6C4(v141, v142, v199);
              sub_257321A68();
              swift_bridgeObjectRelease();
              v140(v128, v58);
              *(_WORD *)(v136 + 32) = 2080;
              id v143 = objc_msgSend(v131, sel_name);
              uint64_t v144 = sub_2573217F8();
              unint64_t v146 = v145;

              uint64_t v197 = sub_2572FB6C4(v144, v146, v199);
              sub_257321A68();

              swift_bridgeObjectRelease();
              *(_WORD *)(v136 + 42) = 2080;
              id v147 = objc_msgSend(v132, sel_name);
              uint64_t v148 = sub_2573217F8();
              unint64_t v150 = v149;

              uint64_t v197 = sub_2572FB6C4(v148, v150, v199);
              sub_257321A68();

              swift_bridgeObjectRelease();
              os_log_t v151 = v194;
              _os_log_impl(&dword_2572F7000, v194, (os_log_type_t)v193, "%s: Found supported service kind %s(%s) having a primary control characteristic with service %s for accessory %s", (uint8_t *)v136, 0x34u);
              v152 = v195;
              swift_arrayDestroy();
              MEMORY[0x25A2B3D30](v152, -1, -1);
              MEMORY[0x25A2B3D30](v136, -1, -1);
            }
            else
            {

              v154 = (void (*)(char *, uint64_t))v174;
              v174(v128, v58);
              v154(v126, v58);
            }
LABEL_45:
            uint64_t v155 = v161;
            sub_2573005E4(v161);
            (*(void (**)(uint64_t, char *, uint64_t))(v162 + 32))(v155, v196, v58);
            return v164(v155, 0, 1, v58);
          }
        }
        id v90 = v34;
        id v91 = v53;
        id v92 = v90;
        uint64_t v7 = (char *)v91;
        unint64_t v93 = sub_2573216E8();
        os_log_type_t v94 = sub_2573219B8();
        uint64_t v10 = (char *)v94;
        if (os_log_type_enabled(v93, v94))
        {
          uint64_t v13 = (char *)swift_slowAlloc();
          v195 = (void (*)(void, void))swift_slowAlloc();
          v199[0] = (uint64_t)v195;
          *(_DWORD *)uint64_t v13 = v165;
          uint64_t v197 = sub_2572FB6C4(0xD00000000000001CLL, v167 | 0x8000000000000000, v199);
          sub_257321A68();
          *((_WORD *)v13 + 6) = 2080;
          id v95 = objc_msgSend(v92, sel_name);
          uint64_t v96 = sub_2573217F8();
          v174 = v81;
          uint64_t v97 = v96;
          unint64_t v99 = v98;

          uint64_t v197 = sub_2572FB6C4(v97, v99, v199);
          sub_257321A68();

          swift_bridgeObjectRelease();
          *((_WORD *)v13 + 11) = 2080;
          id v100 = objc_msgSend(v7, sel_name);
          uint64_t v101 = sub_2573217F8();
          unint64_t v103 = v102;

          id v16 = v182;
          uint64_t v197 = sub_2572FB6C4(v101, v103, v199);
          sub_257321A68();

          swift_bridgeObjectRelease();
          _os_log_impl(&dword_2572F7000, v93, (os_log_type_t)v10, "%s: Did not find primary control characteristic for service %s for accessory %s, continuing to next service", (uint8_t *)v13, 0x20u);
          uint64_t v104 = v195;
          swift_arrayDestroy();
          uint64_t v105 = v192;
          MEMORY[0x25A2B3D30](v104, -1, -1);
          MEMORY[0x25A2B3D30](v13, -1, -1);

          v174(v196, v105);
        }
        else
        {

          v81(v196, v58);
        }
      }
      else
      {
        uint64_t v7 = *(char **)v16;
        (*(void (**)(char *, uint64_t))v16)(v191, v58);
        id v60 = v34;
        id v61 = v53;
        uint64_t v10 = (char *)v60;
        id v62 = v61;
        char v63 = sub_2573216E8();
        os_log_type_t v64 = sub_2573219B8();
        if (os_log_type_enabled(v63, v64))
        {
          uint64_t v65 = swift_slowAlloc();
          v174 = (void (*)(void, void))swift_slowAlloc();
          v199[0] = (uint64_t)v174;
          *(_DWORD *)uint64_t v65 = v172;
          uint64_t v197 = sub_2572FB6C4(0xD00000000000001CLL, v167 | 0x8000000000000000, v199);
          v195 = (void (*)(void, void))v7;
          uint64_t v7 = v178;
          sub_257321A68();
          *(_WORD *)(v65 + 12) = 2080;
          id v66 = objc_msgSend(v10, sel_serviceType);
          uint64_t v67 = sub_2573217F8();
          unint64_t v69 = v68;

          uint64_t v197 = sub_2572FB6C4(v67, v69, v199);
          sub_257321A68();

          swift_bridgeObjectRelease();
          *(_WORD *)(v65 + 22) = 2080;
          id v70 = objc_msgSend(v10, sel_name);
          uint64_t v71 = sub_2573217F8();
          unint64_t v73 = v72;

          uint64_t v197 = sub_2572FB6C4(v71, v73, v199);
          sub_257321A68();

          swift_bridgeObjectRelease();
          *(_WORD *)(v65 + 32) = 2080;
          id v74 = objc_msgSend(v62, sel_name);
          uint64_t v13 = (char *)sub_2573217F8();
          unint64_t v76 = v75;

          uint64_t v77 = v192;
          uint64_t v197 = sub_2572FB6C4((uint64_t)v13, v76, v199);
          sub_257321A68();

          swift_bridgeObjectRelease();
          _os_log_impl(&dword_2572F7000, v63, v64, "%s: ServiceType %s for service %s for accessory %s is not supported.", (uint8_t *)v65, 0x2Au);
          uint64_t v78 = v174;
          swift_arrayDestroy();
          MEMORY[0x25A2B3D30](v78, -1, -1);
          uint64_t v79 = v65;
          id v16 = v182;
          MEMORY[0x25A2B3D30](v79, -1, -1);

          v195(v196, v77);
        }
        else
        {

          ((void (*)(char *, uint64_t))v7)(v196, v58);
        }
      }
      a1 = (uint64_t)&v194->isa + 1;
      unint64_t v26 = v189;
      if (v193 == v176) {
        return swift_bridgeObjectRelease();
      }
    }
    __break(1u);
LABEL_47:
    swift_bridgeObjectRetain();
    unint64_t v26 = v189;
    uint64_t v27 = sub_257321BA8();
    swift_bridgeObjectRelease();
  }

  return swift_bridgeObjectRelease();
}

HMService_optional __swiftcall HMAccessory.primaryService()()
{
  id v1 = objc_msgSend(v0, sel_services);
  sub_2573001D4(0, &qword_269FE53A0);
  unint64_t v2 = sub_2573218D8();

  if (v2 >> 62) {
    goto LABEL_14;
  }
  uint64_t v3 = *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (v3)
  {
    uint64_t v4 = 4;
    while (1)
    {
      id v5 = (v2 & 0xC000000000000001) != 0 ? (id)MEMORY[0x25A2B3680](v4 - 4, v2) : *(id *)(v2 + 8 * v4);
      uint64_t v6 = v5;
      uint64_t v7 = v4 - 3;
      if (__OFADD__(v4 - 4, 1)) {
        break;
      }
      if (objc_msgSend(v5, sel_isPrimaryService))
      {
        swift_bridgeObjectRelease();
        goto LABEL_12;
      }

      ++v4;
      if (v7 == v3) {
        goto LABEL_10;
      }
    }
    __break(1u);
LABEL_14:
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_257321BA8();
    swift_bridgeObjectRelease();
  }
LABEL_10:
  swift_bridgeObjectRelease();
  uint64_t v6 = 0;
LABEL_12:
  uint64_t v9 = (objc_class *)v6;
  result.value.super.isa = v9;
  result.is_nil = v8;
  return result;
}

uint64_t HMAccessory.isInServiceGroup.getter()
{
  id v1 = objc_msgSend(v0, sel_home);
  if (!v1) {
    return 0;
  }
  unint64_t v2 = v1;
  id v3 = objc_msgSend(v1, sel_serviceGroups);

  sub_2573001D4(0, &qword_269FE58D0);
  unint64_t v4 = sub_2573218D8();

  unint64_t v5 = (unint64_t)HMAccessory.primaryService()();
  if (v5)
  {
    uint64_t v6 = (void *)v5;
    if (v4 >> 62) {
      goto LABEL_45;
    }
    uint64_t v7 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v7)
    {
      while (1)
      {
        unint64_t v8 = 0;
        unint64_t v30 = v4 & 0xC000000000000001;
        unint64_t v28 = v4 + 32;
        uint64_t v29 = v4 & 0xFFFFFFFFFFFFFF8;
        unint64_t v27 = v4;
        while (1)
        {
          if (v30)
          {
            id v9 = (id)MEMORY[0x25A2B3680](v8, v4);
          }
          else
          {
            if (v8 >= *(void *)(v29 + 16)) {
              goto LABEL_44;
            }
            id v9 = *(id *)(v28 + 8 * v8);
          }
          uint64_t v10 = v9;
          if (__OFADD__(v8++, 1)) {
            goto LABEL_42;
          }
          id v12 = objc_msgSend(v9, sel_services);
          sub_2573001D4(0, &qword_269FE53A0);
          unint64_t v13 = sub_2573218D8();

          if (v13 >> 62)
          {
            swift_bridgeObjectRetain_n();
            uint64_t v14 = sub_257321BA8();
            swift_bridgeObjectRelease();
            if (!v14) {
              goto LABEL_27;
            }
          }
          else
          {
            uint64_t v14 = *(void *)((v13 & 0xFFFFFFFFFFFFFF8) + 0x10);
            swift_bridgeObjectRetain();
            if (!v14) {
              goto LABEL_27;
            }
          }
          if ((v13 & 0xC000000000000001) != 0) {
            id v15 = (id)MEMORY[0x25A2B3680](0, v13);
          }
          else {
            id v15 = *(id *)(v13 + 32);
          }
          id v16 = v15;
          char v17 = sub_257321A18();

          if (v17)
          {
LABEL_39:

            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            uint64_t v7 = 1;
            goto LABEL_47;
          }
          if (v14 != 1) {
            break;
          }
LABEL_27:

          swift_bridgeObjectRelease();
LABEL_28:
          swift_bridgeObjectRelease();
          if (v8 == v7)
          {

            goto LABEL_40;
          }
        }
        if ((v13 & 0xC000000000000001) != 0) {
          break;
        }
        id v21 = *(id *)(v13 + 40);
        char v22 = sub_257321A18();

        if (v22) {
          goto LABEL_39;
        }
        if (v14 == 2) {
          goto LABEL_27;
        }
        uint64_t v23 = 6;
        while (1)
        {
          unint64_t v4 = v23 - 3;
          if (__OFADD__(v23 - 4, 1)) {
            break;
          }
          id v24 = *(id *)(v13 + 8 * v23);
          char v25 = sub_257321A18();

          if (v25) {
            goto LABEL_39;
          }
          ++v23;
          if (v4 == v14)
          {
LABEL_34:

            swift_bridgeObjectRelease();
            unint64_t v4 = v27;
            goto LABEL_28;
          }
        }
LABEL_43:
        __break(1u);
LABEL_44:
        __break(1u);
LABEL_45:
        swift_bridgeObjectRetain();
        uint64_t v7 = sub_257321BA8();
        swift_bridgeObjectRelease();
        if (!v7) {
          goto LABEL_46;
        }
      }
      MEMORY[0x25A2B3680](1, v13);
      char v18 = sub_257321A18();
      swift_unknownObjectRelease();
      if (v18) {
        goto LABEL_39;
      }
      if (v14 != 2)
      {
        uint64_t v19 = 2;
        while (1)
        {
          MEMORY[0x25A2B3680](v19, v13);
          unint64_t v4 = v19 + 1;
          if (__OFADD__(v19, 1)) {
            break;
          }
          char v20 = sub_257321A18();
          swift_unknownObjectRelease();
          if (v20) {
            goto LABEL_39;
          }
          ++v19;
          if (v4 == v14) {
            goto LABEL_34;
          }
        }
        __break(1u);
LABEL_42:
        __break(1u);
        goto LABEL_43;
      }
      goto LABEL_27;
    }
LABEL_46:
  }
  else
  {
LABEL_40:
    uint64_t v7 = 0;
  }
LABEL_47:
  swift_bridgeObjectRelease();
  return v7;
}

HMService_optional __swiftcall HMAccessory.serviceWithPrimaryControlCharacteristic()()
{
  id v1 = v0;
  uint64_t v2 = sub_257321688();
  id v3 = *(char **)(v2 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  uint64_t v6 = (char *)&v44 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = MEMORY[0x270FA5388](v4);
  id v9 = (char *)&v44 - v8;
  uint64_t v10 = MEMORY[0x270FA5388](v7);
  id v12 = (char *)&v44 - v11;
  MEMORY[0x270FA5388](v10);
  unint64_t v73 = (char *)&v44 - v13;
  id v14 = objc_msgSend(v1, sel_services);
  sub_2573001D4(0, &qword_269FE53A0);
  unint64_t v15 = sub_2573218D8();

  if (v15 >> 62) {
    goto LABEL_58;
  }
  uint64_t v16 = *(void *)((v15 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (v16)
  {
    uint64_t v58 = v12;
    char v17 = 0;
    unint64_t v70 = v15 & 0xC000000000000001;
    int v72 = *MEMORY[0x263F481F0];
    uint64_t v64 = v15 & 0xFFFFFFFFFFFFFF8;
    unint64_t v67 = v15;
    unint64_t v63 = v15 + 32;
    uint64_t v71 = (uint64_t (**)(char *, uint64_t))(v3 + 88);
    int v66 = *MEMORY[0x263F48138];
    int v62 = *MEMORY[0x263F482B0];
    int v61 = *MEMORY[0x263F480B0];
    int v59 = *MEMORY[0x263F48248];
    int v57 = *MEMORY[0x263F48260];
    int v56 = *MEMORY[0x263F480F0];
    int v54 = *MEMORY[0x263F480F8];
    unint64_t v15 = (unint64_t)(v3 + 8);
    uint64_t v53 = *MEMORY[0x263F0C520];
    uint64_t v55 = *MEMORY[0x263F0BEF8];
    uint64_t v74 = *MEMORY[0x263F0C328];
    unint64_t v69 = (void (**)(char *, void, uint64_t))(v3 + 104);
    uint64_t v60 = *MEMORY[0x263F0C510];
    uint64_t v65 = *MEMORY[0x263F0C4A8];
    unsigned int v68 = *MEMORY[0x263F48018];
    while (1)
    {
      if (v70)
      {
        id v18 = (id)MEMORY[0x25A2B3680](v17, v67);
      }
      else
      {
        if ((unint64_t)v17 >= *(void *)(v64 + 16)) {
          goto LABEL_57;
        }
        id v18 = *(id *)(v63 + 8 * (void)v17);
      }
      uint64_t v19 = v18;
      if (__OFADD__(v17++, 1)) {
        break;
      }
      id v12 = (char *)v16;
      id v21 = v73;
      sub_257321A28();
      char v22 = *v71;
      int v23 = (*v71)(v21, v2);
      if (v23 == v72 || v23 == v66 || v23 == v62 || v23 == v61 || v23 == v59 || v23 == v57 || v23 == v56 || v23 == v54)
      {
        sub_2573217F8();
        uint64_t v40 = (void *)sub_2573217E8();
        swift_bridgeObjectRelease();
        id v41 = objc_msgSend(v19, sel_hf_characteristicOfType_, v40);

        if (v41) {
          goto LABEL_53;
        }
      }
      else
      {
        unint64_t v44 = *(char **)v15;
        ((void (*)(char *, uint64_t))v44)(v73, v2);
        id v24 = objc_msgSend(v19, sel_characteristics);
        sub_2573001D4(0, &qword_269FE53B0);
        unint64_t v25 = sub_2573218D8();

        unint64_t v47 = v25;
        if (v25 >> 62)
        {
          swift_bridgeObjectRetain_n();
          uint64_t v26 = sub_257321BA8();
          swift_bridgeObjectRelease();
        }
        else
        {
          uint64_t v26 = *(void *)((v25 & 0xFFFFFFFFFFFFFF8) + 0x10);
          swift_bridgeObjectRetain();
        }
        unint64_t v27 = v47;
        if (v26)
        {
          unint64_t v46 = v47 & 0xC000000000000001;
          uint64_t v28 = 4;
          uint64_t v45 = v26;
          do
          {
            uint64_t v29 = v28 - 4;
            uint64_t v49 = v28;
            if (v46)
            {
              id v30 = (id)MEMORY[0x25A2B3680](v28 - 4, v27);
              uint64_t v32 = v29 + 1;
              if (__OFADD__(v29, 1)) {
                goto LABEL_61;
              }
            }
            else
            {
              id v30 = *(id *)(v27 + 8 * v28);
              uint64_t v32 = v29 + 1;
              if (__OFADD__(v29, 1))
              {
LABEL_61:
                __break(1u);
                goto LABEL_62;
              }
            }
            uint64_t v48 = v32;
            id v52 = v30;
            id v33 = objc_msgSend(v30, sel_characteristicType);
            uint64_t v50 = sub_2573217F8();
            uint64_t v51 = v34;

            id v35 = v58;
            sub_257321A28();
            int v36 = v22(v35, v2);
            if (v36 == v72
              || v36 == v66
              || v36 == v62
              || v36 == v61
              || v36 == v59
              || v36 == v57
              || v36 == v56
              || v36 == v54)
            {
              if (v50 == sub_2573217F8() && v51 == v37)
              {
                swift_bridgeObjectRelease_n();
LABEL_55:
                swift_bridgeObjectRelease_n();
                swift_bridgeObjectRelease();

                goto LABEL_60;
              }
              char v39 = sub_257321C18();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              if (v39) {
                goto LABEL_55;
              }
            }
            else
            {
              ((void (*)(char *, uint64_t))v44)(v58, v2);

              swift_bridgeObjectRelease();
            }
            uint64_t v28 = v49 + 1;
            unint64_t v27 = v47;
          }
          while (v48 != v45);
        }
        swift_bridgeObjectRelease_n();
      }
      sub_257321A28();
      (*v69)(v6, v68, v2);
      sub_25730017C();
      sub_2573218B8();
      sub_2573218B8();
      if (v77 == v75 && v78 == v76)
      {
        swift_bridgeObjectRelease_n();
        unint64_t v43 = *(char **)v15;
        (*(void (**)(char *, uint64_t))v15)(v6, v2);
        ((void (*)(char *, uint64_t))v43)(v9, v2);
LABEL_53:
        swift_bridgeObjectRelease();
        goto LABEL_60;
      }
      char v42 = sub_257321C18();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      id v3 = *(char **)v15;
      (*(void (**)(char *, uint64_t))v15)(v6, v2);
      ((void (*)(char *, uint64_t))v3)(v9, v2);
      if (v42) {
        goto LABEL_53;
      }

      uint64_t v16 = (uint64_t)v12;
      if (v17 == v12) {
        goto LABEL_59;
      }
    }
    __break(1u);
LABEL_57:
    __break(1u);
LABEL_58:
    swift_bridgeObjectRetain();
    uint64_t v16 = sub_257321BA8();
    swift_bridgeObjectRelease();
  }
LABEL_59:
  swift_bridgeObjectRelease();
  uint64_t v19 = 0;
LABEL_60:
  id v30 = v19;
LABEL_62:
  result.value.super.isa = (Class)v30;
  result.is_nil = v31;
  return result;
}

id NHOHomeUserCapabilities.__allocating_init(home:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  uint64_t v4 = OBJC_IVAR___NHOHomeUserCapabilities_logger;
  uint64_t v5 = qword_269FE52E0;
  uint64_t v6 = v3;
  if (v5 != -1) {
    swift_once();
  }
  uint64_t v7 = sub_257321708();
  uint64_t v8 = __swift_project_value_buffer(v7, (uint64_t)qword_269FE5590);
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(*(void *)(v7 - 8) + 16))(&v6[v4], v8, v7);
  v6[OBJC_IVAR___NHOHomeUserCapabilities_isOnboarded] = 0;
  v6[OBJC_IVAR___NHOHomeUserCapabilities_hasMockData] = 0;
  *(void *)&v6[OBJC_IVAR___NHOHomeUserCapabilities_home] = a1;
  id v9 = a1;

  v12.id receiver = v6;
  v12.super_class = v1;
  id v10 = objc_msgSendSuper2(&v12, sel_init);

  return v10;
}

uint64_t sub_2573184BC()
{
  if ((*(unsigned char *)(v0 + OBJC_IVAR___NHOHomeUserCapabilities_isOnboarded) & 1) != 0
    || (*(unsigned char *)(v0 + OBJC_IVAR___NHOHomeUserCapabilities_hasMockData) & 1) != 0)
  {
    return 1;
  }
  else
  {
    return sub_2573185EC();
  }
}

uint64_t static NHOHomeUserCapabilities.currentLocationEnergyForecastEnabled.getter()
{
  return sub_25731A46C(0xD000000000000024, 0x8000000257324CC0) & 1;
}

uint64_t sub_257318584()
{
  return sub_25731A46C(0xD000000000000015, 0x8000000257324D60) & 1;
}

uint64_t sub_2573185EC()
{
  id v1 = v0;
  uint64_t v2 = OBJC_IVAR___NHOHomeUserCapabilities_home;
  id v3 = *(id *)&v0[OBJC_IVAR___NHOHomeUserCapabilities_home];
  id v4 = objc_msgSend(v3, sel_currentUser);
  char v5 = sub_2573219F8();

  if ((v5 & 1) == 0)
  {
    id v6 = *(id *)&v1[v2];
    Swift::Bool v7 = HMHome.isCurrentRestrictedGuestAwayFromHome()();

    if (!v7) {
      return 0;
    }
  }
  if (qword_269FE52D0 != -1) {
    swift_once();
  }
  uint64_t v8 = sub_257321708();
  __swift_project_value_buffer(v8, (uint64_t)qword_269FE5560);
  id v9 = v1;
  id v10 = sub_2573216E8();
  os_log_type_t v11 = sub_2573219E8();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v12 = swift_slowAlloc();
    uint64_t v13 = swift_slowAlloc();
    uint64_t v20 = v13;
    *(_DWORD *)uint64_t v12 = 136315394;
    uint64_t v19 = sub_2572FB6C4(0x7463697274736572, 0xEF74736575476465, &v20);
    sub_257321A68();
    *(_WORD *)(v12 + 12) = 2080;
    id v14 = objc_msgSend(*(id *)&v1[v2], sel_name, v19);
    uint64_t v15 = sub_2573217F8();
    unint64_t v17 = v16;

    sub_2572FB6C4(v15, v17, &v20);
    sub_257321A68();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_2572F7000, v10, v11, "%s: the current user in home %s is restricted.", (uint8_t *)v12, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x25A2B3D30](v13, -1, -1);
    MEMORY[0x25A2B3D30](v12, -1, -1);
  }
  else
  {
  }
  return 1;
}

id NHOHomeUserCapabilities.init(home:)(void *a1)
{
  uint64_t v3 = OBJC_IVAR___NHOHomeUserCapabilities_logger;
  uint64_t v4 = qword_269FE52E0;
  char v5 = v1;
  if (v4 != -1) {
    swift_once();
  }
  id v6 = &v5[v3];
  uint64_t v7 = sub_257321708();
  uint64_t v8 = __swift_project_value_buffer(v7, (uint64_t)qword_269FE5590);
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v7 - 8) + 16))(v6, v8, v7);
  v5[OBJC_IVAR___NHOHomeUserCapabilities_isOnboarded] = 0;
  v5[OBJC_IVAR___NHOHomeUserCapabilities_hasMockData] = 0;
  *(void *)&v5[OBJC_IVAR___NHOHomeUserCapabilities_home] = a1;
  id v9 = a1;

  v12.id receiver = v5;
  v12.super_class = (Class)type metadata accessor for NHOHomeUserCapabilities();
  id v10 = objc_msgSendSuper2(&v12, sel_init);

  return v10;
}

uint64_t sub_257318AAC()
{
  v1[2] = v0;
  uint64_t v2 = sub_2573215A8();
  v1[3] = v2;
  v1[4] = *(void *)(v2 - 8);
  v1[5] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_257318B6C, 0, 0);
}

uint64_t sub_257318B6C()
{
  uint64_t v2 = v0[4];
  uint64_t v1 = v0[5];
  uint64_t v3 = v0[3];
  uint64_t v4 = *(void **)(v0[2] + OBJC_IVAR___NHOHomeUserCapabilities_home);
  v0[6] = v4;
  id v5 = objc_msgSend(v4, sel_uniqueIdentifier);
  sub_257321598();

  uint64_t v6 = sub_257321588();
  uint64_t v8 = v7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  sub_257321788();
  id v9 = (void *)swift_task_alloc();
  v0[7] = v9;
  *id v9 = v0;
  v9[1] = sub_257318C84;
  return MEMORY[0x270F27008](v6, v8);
}

uint64_t sub_257318C84(uint64_t a1)
{
  *(void *)(*(void *)v1 + 64) = a1;
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_257318D84, 0, 0);
}

uint64_t sub_257318D84()
{
  uint64_t v1 = (void *)v0[6];
  if (v0[8])
  {
    char v2 = sub_257321778();
    swift_release();
  }
  else
  {
    char v2 = 0;
  }

  uint64_t v3 = v0[2];
  char v4 = _sSo6HMHomeC15NanoHomeIntentsE22hasMockElectricityDataSbyF_0();
  uint64_t v5 = v0[2];
  if ((v2 & 1) == *(unsigned char *)(v3 + OBJC_IVAR___NHOHomeUserCapabilities_isOnboarded)
    && (v4 & 1) == *(unsigned char *)(v5 + OBJC_IVAR___NHOHomeUserCapabilities_hasMockData))
  {
    uint64_t v6 = 0;
  }
  else
  {
    *(unsigned char *)(v3 + OBJC_IVAR___NHOHomeUserCapabilities_isOnboarded) = v2 & 1;
    *(unsigned char *)(v5 + OBJC_IVAR___NHOHomeUserCapabilities_hasMockData) = v4 & 1;
    uint64_t v6 = 1;
  }
  swift_task_dealloc();
  uint64_t v7 = (uint64_t (*)(uint64_t))v0[1];
  return v7(v6);
}

uint64_t HMHome.utilityOnboarded()()
{
  v1[2] = v0;
  uint64_t v2 = sub_2573215A8();
  v1[3] = v2;
  v1[4] = *(void *)(v2 - 8);
  v1[5] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_257318F34, 0, 0);
}

uint64_t sub_257318F34()
{
  uint64_t v2 = *(void *)(v0 + 32);
  uint64_t v1 = *(void *)(v0 + 40);
  uint64_t v3 = *(void *)(v0 + 24);
  id v4 = objc_msgSend(*(id *)(v0 + 16), sel_uniqueIdentifier);
  sub_257321598();

  uint64_t v5 = sub_257321588();
  uint64_t v7 = v6;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  sub_257321788();
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v0 + 48) = v8;
  *uint64_t v8 = v0;
  v8[1] = sub_257319038;
  return MEMORY[0x270F27008](v5, v7);
}

uint64_t sub_257319038(uint64_t a1)
{
  *(void *)(*(void *)v1 + 56) = a1;
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_257319138, 0, 0);
}

uint64_t sub_257319138()
{
  if (*(void *)(v0 + 56))
  {
    char v1 = sub_257321778();
    swift_release();
  }
  else
  {
    char v1 = 0;
  }
  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2(v1 & 1);
}

uint64_t sub_25731932C(const void *a1, void *a2)
{
  v2[2] = a2;
  v2[3] = _Block_copy(a1);
  a2;
  uint64_t v4 = (void *)swift_task_alloc();
  v2[4] = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_2573193D4;
  return sub_257318AAC();
}

uint64_t sub_2573193D4(char a1)
{
  uint64_t v3 = *(void (***)(void, void))(*v1 + 24);
  uint64_t v4 = *(void **)(*v1 + 16);
  uint64_t v7 = *v1;
  swift_task_dealloc();

  v3[2](v3, a1 & 1);
  _Block_release(v3);
  uint64_t v5 = *(uint64_t (**)(void))(v7 + 8);
  return v5();
}

id NHOHomeUserCapabilities.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

void NHOHomeUserCapabilities.init()()
{
}

id NHOHomeUserCapabilities.__deallocating_deinit()
{
  v2.id receiver = v0;
  v2.super_class = (Class)type metadata accessor for NHOHomeUserCapabilities();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t HMHome.onboardedOrMockData()()
{
  v1[2] = v0;
  uint64_t v2 = sub_2573215A8();
  v1[3] = v2;
  v1[4] = *(void *)(v2 - 8);
  v1[5] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_257319728, 0, 0);
}

uint64_t sub_257319728()
{
  uint64_t v2 = *(void *)(v0 + 32);
  uint64_t v1 = *(void *)(v0 + 40);
  uint64_t v3 = *(void *)(v0 + 24);
  id v4 = objc_msgSend(*(id *)(v0 + 16), sel_uniqueIdentifier);
  sub_257321598();

  uint64_t v5 = sub_257321588();
  uint64_t v7 = v6;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  sub_257321788();
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v0 + 48) = v8;
  *uint64_t v8 = v0;
  v8[1] = sub_25731982C;
  return MEMORY[0x270F27008](v5, v7);
}

uint64_t sub_25731982C(uint64_t a1)
{
  *(void *)(*(void *)v1 + 56) = a1;
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_25731992C, 0, 0);
}

uint64_t sub_25731992C()
{
  if (*(void *)(v0 + 56) && (char v1 = sub_257321778(), swift_release(), (v1 & 1) != 0)) {
    char v2 = 1;
  }
  else {
    char v2 = _sSo6HMHomeC15NanoHomeIntentsE22hasMockElectricityDataSbyF_0();
  }
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(void))(v0 + 8);
  return v3(v2 & 1);
}

uint64_t sub_2573199BC(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  id v4 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v4;
  *id v4 = v3;
  v4[1] = sub_257309E38;
  return v6();
}

uint64_t sub_257319A88(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v5;
  void *v5 = v4;
  v5[1] = sub_257309E38;
  return v7();
}

uint64_t sub_257319B54(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_257321958();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_257321948();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_2572FCE10(a1, &qword_269FE57D0);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_257321928();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t _sSo6HMHomeC15NanoHomeIntentsE22hasMockElectricityDataSbyF_0()
{
  id v0 = sub_2572FCBC0();
  char v1 = (void *)sub_2573217E8();
  id v2 = objc_msgSend(v0, sel_stringForKey_, v1);

  if (v2)
  {
    uint64_t v3 = sub_2573217F8();
    uint64_t v5 = v4;
  }
  else
  {
    uint64_t v3 = 0;
    uint64_t v5 = 0;
  }
  uint64_t v6 = (void *)sub_2573217E8();
  id v7 = objc_msgSend(v0, sel_stringForKey_, v6);

  if (v7)
  {
    uint64_t v8 = sub_2573217F8();
    uint64_t v10 = v9;
  }
  else
  {
    uint64_t v8 = 0;
    uint64_t v10 = 0;
  }
  if (v5)
  {
    if (v3 == 0x746C7561666564 && v5 == 0xE700000000000000)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      char v11 = sub_257321C18();
      swift_bridgeObjectRelease();
      if ((v11 & 1) == 0)
      {

        swift_bridgeObjectRelease();
        char v12 = 1;
        return v12 & 1;
      }
    }
  }
  if (v10)
  {
    if (v8 != 0x746C7561666564 || v10 != 0xE700000000000000)
    {
      char v13 = sub_257321C18();
      swift_bridgeObjectRelease();

      char v12 = v13 ^ 1;
      return v12 & 1;
    }
    swift_bridgeObjectRelease();
  }

  char v12 = 0;
  return v12 & 1;
}

uint64_t sub_257319EEC()
{
  uint64_t v0 = sub_2573215E8();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v32 = (char *)&v31 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_269FE5AD0);
  uint64_t v4 = v3 - 8;
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v31 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_269FE5AD8);
  uint64_t v8 = MEMORY[0x270FA5388](v7 - 8);
  uint64_t v10 = (char *)&v31 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = MEMORY[0x270FA5388](v8);
  char v13 = (char *)&v31 - v12;
  MEMORY[0x270FA5388](v11);
  uint64_t v15 = (char *)&v31 - v14;
  uint64_t v16 = sub_257321618();
  uint64_t v17 = *(void *)(v16 - 8);
  MEMORY[0x270FA5388](v16);
  uint64_t v19 = (char *)&v31 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_257321608();
  sub_2573215F8();
  (*(void (**)(char *, uint64_t))(v17 + 8))(v19, v16);
  sub_2573215D8();
  (*(void (**)(char *, void, uint64_t, uint64_t))(v1 + 56))(v13, 0, 1, v0);
  uint64_t v20 = (uint64_t)&v6[*(int *)(v4 + 56)];
  sub_25731AD6C((uint64_t)v15, (uint64_t)v6);
  sub_25731AD6C((uint64_t)v13, v20);
  id v21 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v1 + 48);
  if (v21((uint64_t)v6, 1, v0) == 1)
  {
    sub_2572FCE10((uint64_t)v13, &qword_269FE5AD8);
    sub_2572FCE10((uint64_t)v15, &qword_269FE5AD8);
    if (v21(v20, 1, v0) == 1)
    {
      sub_2572FCE10((uint64_t)v6, &qword_269FE5AD8);
      return 1;
    }
    goto LABEL_6;
  }
  sub_25731AD6C((uint64_t)v6, (uint64_t)v10);
  if (v21(v20, 1, v0) == 1)
  {
    sub_2572FCE10((uint64_t)v13, &qword_269FE5AD8);
    sub_2572FCE10((uint64_t)v15, &qword_269FE5AD8);
    (*(void (**)(char *, uint64_t))(v1 + 8))(v10, v0);
LABEL_6:
    sub_2572FCE10((uint64_t)v6, &qword_269FE5AD0);
    goto LABEL_7;
  }
  uint64_t v28 = v32;
  (*(void (**)(char *, uint64_t, uint64_t))(v1 + 32))(v32, v20, v0);
  sub_25731ADD4();
  char v29 = sub_2573217C8();
  id v30 = *(void (**)(char *, uint64_t))(v1 + 8);
  v30(v28, v0);
  sub_2572FCE10((uint64_t)v13, &qword_269FE5AD8);
  sub_2572FCE10((uint64_t)v15, &qword_269FE5AD8);
  v30(v10, v0);
  sub_2572FCE10((uint64_t)v6, &qword_269FE5AD8);
  if (v29) {
    return 1;
  }
LABEL_7:
  if (qword_269FE52D0 != -1) {
    swift_once();
  }
  uint64_t v22 = sub_257321708();
  __swift_project_value_buffer(v22, (uint64_t)qword_269FE5560);
  int v23 = sub_2573216E8();
  os_log_type_t v24 = sub_2573219E8();
  if (os_log_type_enabled(v23, v24))
  {
    unint64_t v25 = (uint8_t *)swift_slowAlloc();
    uint64_t v26 = swift_slowAlloc();
    uint64_t v34 = v26;
    *(_DWORD *)unint64_t v25 = 136315138;
    uint64_t v33 = sub_2572FB6C4(0xD000000000000017, 0x8000000257324DB0, &v34);
    sub_257321A68();
    _os_log_impl(&dword_2572F7000, v23, v24, "%s: region is not supported", v25, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x25A2B3D30](v26, -1, -1);
    MEMORY[0x25A2B3D30](v25, -1, -1);
  }

  return 0;
}

uint64_t sub_25731A450()
{
  return sub_25731A46C(0xD000000000000015, 0x8000000257324D60);
}

uint64_t sub_25731A46C(uint64_t a1, unint64_t a2)
{
  char v4 = sub_257319EEC();
  if ((v4 & 1) == 0)
  {
    if (qword_269FE52D0 != -1) {
      swift_once();
    }
    uint64_t v5 = sub_257321708();
    __swift_project_value_buffer(v5, (uint64_t)qword_269FE5560);
    uint64_t v6 = sub_2573216E8();
    os_log_type_t v7 = sub_2573219E8();
    if (os_log_type_enabled(v6, v7))
    {
      uint64_t v8 = (uint8_t *)swift_slowAlloc();
      uint64_t v9 = swift_slowAlloc();
      uint64_t v11 = v9;
      *(_DWORD *)uint64_t v8 = 136315138;
      sub_2572FB6C4(a1, a2, &v11);
      sub_257321A68();
      _os_log_impl(&dword_2572F7000, v6, v7, "%s: region is not supported", v8, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x25A2B3D30](v9, -1, -1);
      MEMORY[0x25A2B3D30](v8, -1, -1);
    }
  }
  return v4 & 1;
}

uint64_t type metadata accessor for NHOHomeUserCapabilities()
{
  uint64_t result = qword_269FE5A78;
  if (!qword_269FE5A78) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_25731A644()
{
  return type metadata accessor for NHOHomeUserCapabilities();
}

uint64_t sub_25731A64C()
{
  uint64_t result = sub_257321708();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t method lookup function for NHOHomeUserCapabilities(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for NHOHomeUserCapabilities);
}

uint64_t dispatch thunk of NHOHomeUserCapabilities.shouldShowElectricity.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xB8))();
}

uint64_t dispatch thunk of NHOHomeUserCapabilities.energyForecastEnabled.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xC0))();
}

uint64_t dispatch thunk of NHOHomeUserCapabilities.restrictedGuest.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xC8))();
}

uint64_t dispatch thunk of NHOHomeUserCapabilities.__allocating_init(home:)()
{
  return (*(uint64_t (**)(void))(v0 + 208))();
}

uint64_t dispatch thunk of NHOHomeUserCapabilities.updateCapabilities()()
{
  uint64_t v2 = *(int **)((*MEMORY[0x263F8EED0] & *v0) + 0xD8);
  uint64_t v5 = (uint64_t (*)(void))((char *)v2 + *v2);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_25731A8C0;
  return v5();
}

uint64_t sub_25731A8C0(uint64_t a1)
{
  uint64_t v5 = *v1;
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(uint64_t))(v5 + 8);
  return v3(a1);
}

uint64_t sub_25731A9BC()
{
  _Block_release(*(const void **)(v0 + 16));

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_25731A9FC()
{
  uint64_t v2 = *(const void **)(v0 + 16);
  uint64_t v3 = *(void **)(v0 + 24);
  char v4 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v4;
  *char v4 = v1;
  v4[1] = sub_257306DBC;
  uint64_t v5 = (uint64_t (*)(const void *, void *))((char *)&dword_269FE5A90 + dword_269FE5A90);
  return v5(v2, v3);
}

uint64_t sub_25731AAAC()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  char v4 = (int *)v0[4];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  void *v5 = v1;
  v5[1] = sub_257309E38;
  uint64_t v6 = (uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_269FE5AA0 + dword_269FE5AA0);
  return v6(v2, v3, v4);
}

uint64_t objectdestroy_17Tm()
{
  swift_unknownObjectRelease();
  swift_release();

  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_25731ABB0(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = (int *)v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_257309E38;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_269FE5AB0 + dword_269FE5AB0);
  return v8(a1, v4, v5, v6);
}

uint64_t sub_25731AC7C()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_25731ACB4(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_257306DBC;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_269FE5AC0 + dword_269FE5AC0);
  return v6(a1, v4);
}

uint64_t sub_25731AD6C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269FE5AD8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_25731ADD4()
{
  unint64_t result = qword_269FE5AE0;
  if (!qword_269FE5AE0)
  {
    sub_2573215E8();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269FE5AE0);
  }
  return result;
}

id NHOAccessoryIntent.__allocating_init(homeID:homeName:accessoryID:accessoryName:icon:serviceKind:)(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  id v12 = objc_msgSend(objc_allocWithZone(v11), sel_init);
  swift_retain();
  sub_2573213D8();
  swift_release();
  swift_retain();
  sub_2573213D8();
  swift_release();
  swift_bridgeObjectRetain();
  swift_retain();
  sub_2573213D8();
  swift_release();
  swift_retain();
  sub_2573213D8();
  swift_release();
  swift_retain();
  sub_2573213D8();
  swift_release();
  sub_257321678();
  swift_retain();
  sub_2573213D8();
  swift_release();
  swift_retain();
  sub_2573213D8();
  swift_release();
  swift_retain();
  sub_2573213D8();

  swift_release();
  uint64_t v13 = sub_257321688();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v13 - 8) + 8))(a11, v13);
  return v12;
}

uint64_t sub_25731B058()
{
  uint64_t v0 = sub_2573214C8();
  __swift_allocate_value_buffer(v0, qword_269FE5AE8);
  __swift_project_value_buffer(v0, (uint64_t)qword_269FE5AE8);
  return sub_2573214B8();
}

uint64_t static NHOAccessoryIntent.title.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_25730085C(&qword_269FE5328, MEMORY[0x263F06D40], (uint64_t)qword_269FE5AE8, a1);
}

uint64_t static NHOAccessoryIntent.title.setter(uint64_t a1)
{
  return sub_257300944(a1, &qword_269FE5328, MEMORY[0x263F06D40], (uint64_t)qword_269FE5AE8);
}

uint64_t (*static NHOAccessoryIntent.title.modify())()
{
  if (qword_269FE5328 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_2573214C8();
  __swift_project_value_buffer(v0, (uint64_t)qword_269FE5AE8);
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_25731B1C4()
{
  uint64_t v0 = sub_257321438();
  __swift_allocate_value_buffer(v0, qword_269FE5B00);
  __swift_project_value_buffer(v0, (uint64_t)qword_269FE5B00);
  return sub_257321428();
}

uint64_t static NHOAccessoryIntent.description.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_25730085C(&qword_269FE5330, MEMORY[0x263EFBA28], (uint64_t)qword_269FE5B00, a1);
}

uint64_t static NHOAccessoryIntent.description.setter(uint64_t a1)
{
  return sub_257300944(a1, &qword_269FE5330, MEMORY[0x263EFBA28], (uint64_t)qword_269FE5B00);
}

uint64_t (*static NHOAccessoryIntent.description.modify())()
{
  if (qword_269FE5330 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_257321438();
  __swift_project_value_buffer(v0, (uint64_t)qword_269FE5B00);
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t NHOAccessoryIntent.homeID.getter()
{
  return sub_257300C20();
}

uint64_t NHOAccessoryIntent.homeID.setter()
{
  return sub_257300CF4();
}

uint64_t (*NHOAccessoryIntent.homeID.modify(void *a1))()
{
  uint64_t v3 = malloc(0x30uLL);
  *a1 = v3;
  v3[4] = *(void *)(v1 + OBJC_IVAR___NHOAccessoryIntent__homeID);
  swift_retain();
  v3[5] = sub_2573213B8();
  return sub_257300B6C;
}

uint64_t NHOAccessoryIntent.$homeID.getter()
{
  return sub_257300EB8();
}

uint64_t NHOAccessoryIntent.homeName.getter()
{
  return sub_257300C20();
}

uint64_t NHOAccessoryIntent.homeName.setter()
{
  return sub_257300CF4();
}

uint64_t (*NHOAccessoryIntent.homeName.modify(void *a1))()
{
  uint64_t v3 = malloc(0x30uLL);
  *a1 = v3;
  v3[4] = *(void *)(v1 + OBJC_IVAR___NHOAccessoryIntent__homeName);
  swift_retain();
  v3[5] = sub_2573213B8();
  return sub_257300B6C;
}

uint64_t NHOAccessoryIntent.$homeName.getter()
{
  return sub_257300EB8();
}

uint64_t NHOAccessoryIntent.accessoryID.getter()
{
  return sub_257300C20();
}

uint64_t NHOAccessoryIntent.accessoryID.setter()
{
  return sub_257300CF4();
}

uint64_t (*NHOAccessoryIntent.accessoryID.modify(void *a1))()
{
  uint64_t v3 = malloc(0x30uLL);
  *a1 = v3;
  v3[4] = *(void *)(v1 + OBJC_IVAR___NHOAccessoryIntent__accessoryID);
  swift_retain();
  v3[5] = sub_2573213B8();
  return sub_257300B6C;
}

uint64_t NHOAccessoryIntent.$accessoryID.getter()
{
  return sub_257300EB8();
}

uint64_t NHOAccessoryIntent.accessoryName.getter()
{
  return sub_257300C20();
}

uint64_t NHOAccessoryIntent.accessoryName.setter()
{
  return sub_257300CF4();
}

uint64_t (*NHOAccessoryIntent.accessoryName.modify(void *a1))()
{
  uint64_t v3 = malloc(0x30uLL);
  *a1 = v3;
  v3[4] = *(void *)(v1 + OBJC_IVAR___NHOAccessoryIntent__accessoryName);
  swift_retain();
  v3[5] = sub_2573213B8();
  return sub_257300B6C;
}

uint64_t NHOAccessoryIntent.$accessoryName.getter()
{
  return sub_257300EB8();
}

uint64_t NHOAccessoryIntent.icon.getter()
{
  return sub_257300C20();
}

uint64_t NHOAccessoryIntent.icon.setter()
{
  return sub_257300CF4();
}

uint64_t (*NHOAccessoryIntent.icon.modify(void *a1))()
{
  uint64_t v3 = malloc(0x30uLL);
  *a1 = v3;
  v3[4] = *(void *)(v1 + OBJC_IVAR___NHOAccessoryIntent__icon);
  swift_retain();
  v3[5] = sub_2573213B8();
  return sub_257300B6C;
}

uint64_t NHOAccessoryIntent.$icon.getter()
{
  return sub_257300EB8();
}

uint64_t NHOAccessoryIntent.serviceType.getter()
{
  return sub_257300C20();
}

uint64_t NHOAccessoryIntent.serviceType.setter()
{
  return sub_257300CF4();
}

uint64_t (*NHOAccessoryIntent.serviceType.modify(void *a1))()
{
  uint64_t v3 = malloc(0x30uLL);
  *a1 = v3;
  v3[4] = *(void *)(v1 + OBJC_IVAR___NHOAccessoryIntent__serviceType);
  swift_retain();
  v3[5] = sub_2573213B8();
  return sub_257300B6C;
}

uint64_t NHOAccessoryIntent.$serviceType.getter()
{
  return sub_257300EB8();
}

uint64_t NHOAccessoryIntent.useHomeKitRecommendations.getter()
{
  swift_retain();
  sub_2573213C8();
  swift_release();
  return v1;
}

uint64_t NHOAccessoryIntent.useHomeKitRecommendations.setter()
{
  return swift_release();
}

uint64_t sub_25731B894@<X0>(unsigned char *a1@<X8>)
{
  swift_retain();
  sub_2573213C8();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_25731B8EC()
{
  return swift_release();
}

uint64_t (*NHOAccessoryIntent.useHomeKitRecommendations.modify(void *a1))()
{
  char v3 = malloc(0x30uLL);
  *a1 = v3;
  v3[4] = *(void *)(v1 + OBJC_IVAR___NHOAccessoryIntent__useHomeKitRecommendations);
  swift_retain();
  v3[5] = sub_2573213B8();
  return sub_257300B6C;
}

uint64_t NHOAccessoryIntent.$useHomeKitRecommendations.getter()
{
  return sub_257300EB8();
}

uint64_t NHOAccessoryIntent.accessoriesAndScenes.getter()
{
  return sub_257300C20();
}

uint64_t NHOAccessoryIntent.accessoriesAndScenes.setter()
{
  return sub_257300CF4();
}

uint64_t (*NHOAccessoryIntent.accessoriesAndScenes.modify(void *a1))()
{
  char v3 = malloc(0x30uLL);
  *a1 = v3;
  v3[4] = *(void *)(v1 + OBJC_IVAR___NHOAccessoryIntent__accessoriesAndScenes);
  swift_retain();
  v3[5] = sub_2573213B8();
  return sub_257300B6C;
}

uint64_t NHOAccessoryIntent.$accessoriesAndScenes.getter()
{
  return sub_257300EB8();
}

uint64_t NHOAccessoryIntent.requestConfirmationText.getter()
{
  return sub_257300C20();
}

uint64_t NHOAccessoryIntent.requestConfirmationText.setter()
{
  return sub_257300CF4();
}

uint64_t (*NHOAccessoryIntent.requestConfirmationText.modify(void *a1))()
{
  char v3 = malloc(0x30uLL);
  *a1 = v3;
  v3[4] = *(void *)(v1 + OBJC_IVAR___NHOAccessoryIntent__requestConfirmationText);
  swift_retain();
  v3[5] = sub_2573213B8();
  return sub_257300B6C;
}

uint64_t NHOAccessoryIntent.$requestConfirmationText.getter()
{
  return sub_257300EB8();
}

uint64_t NHOAccessoryIntent.requestConfirmationIcon.getter()
{
  return sub_257300C20();
}

uint64_t NHOAccessoryIntent.requestConfirmationIcon.setter()
{
  return sub_257300CF4();
}

uint64_t (*NHOAccessoryIntent.requestConfirmationIcon.modify(void *a1))()
{
  char v3 = malloc(0x30uLL);
  *a1 = v3;
  v3[4] = *(void *)(v1 + OBJC_IVAR___NHOAccessoryIntent__requestConfirmationIcon);
  swift_retain();
  v3[5] = sub_2573213B8();
  return sub_257300B6C;
}

uint64_t NHOAccessoryIntent.$requestConfirmationIcon.getter()
{
  return sub_257300EB8();
}

uint64_t NHOAccessoryIntent.isSmartStack.getter()
{
  swift_retain();
  sub_2573213C8();
  swift_release();
  return v1;
}

uint64_t sub_25731BBEC@<X0>(unsigned char *a1@<X8>)
{
  swift_retain();
  sub_2573213C8();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_25731BC44()
{
  return swift_release();
}

uint64_t NHOAccessoryIntent.isSmartStack.setter()
{
  return swift_release();
}

uint64_t (*NHOAccessoryIntent.isSmartStack.modify(void *a1))()
{
  char v3 = malloc(0x30uLL);
  *a1 = v3;
  v3[4] = *(void *)(v1 + OBJC_IVAR___NHOAccessoryIntent__isSmartStack);
  swift_retain();
  v3[5] = sub_2573213B8();
  return sub_257300B6C;
}

uint64_t NHOAccessoryIntent.$isSmartStack.getter()
{
  return sub_257300EB8();
}

id NHOAccessoryIntent.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

id NHOAccessoryIntent.init()()
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v102 = sub_257321688();
  uint64_t v101 = *(void *)(v102 - 8);
  MEMORY[0x270FA5388](v102);
  id v100 = (char *)&v92 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269FE5638);
  MEMORY[0x270FA5388](v2 - 8);
  unint64_t v103 = (char *)&v92 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_257321468();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v114 = (char *)&v92 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_269FE5400);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v92 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_269FE5408);
  MEMORY[0x270FA5388](v10 - 8);
  id v12 = (char *)&v92 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_269FE5410);
  MEMORY[0x270FA5388](v13 - 8);
  uint64_t v15 = (char *)&v92 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_2573214C8();
  uint64_t v108 = v16;
  uint64_t v17 = *(void *)(v16 - 8);
  MEMORY[0x270FA5388](v16);
  uint64_t v19 = (char *)&v92 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v98 = OBJC_IVAR___NHOAccessoryIntent__homeID;
  uint64_t v107 = __swift_instantiateConcreteTypeFromMangledName(&qword_269FE5658);
  unint64_t v122 = v0;
  sub_2573214B8();
  uint64_t v20 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v17 + 56);
  uint64_t v109 = v17 + 56;
  v20(v15, 1, 1, v16);
  id v21 = v20;
  int v112 = v20;
  uint64_t v113 = sub_2573217D8();
  uint64_t v124 = 0;
  unint64_t v125 = 0;
  uint64_t v22 = *(void *)(v113 - 8);
  unint64_t v115 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v22 + 56);
  uint64_t v119 = v22 + 56;
  int v23 = v12;
  v115(v12, 1, 1, v113);
  uint64_t v118 = sub_257321398();
  uint64_t v24 = *(void *)(v118 - 8);
  v116 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v24 + 56);
  uint64_t v120 = v24 + 56;
  v116(v9, 1, 1, v118);
  unsigned int v117 = *MEMORY[0x263EFBDC8];
  unint64_t v110 = *(void (**)(char *))(v5 + 104);
  uint64_t v111 = v4;
  uint64_t v121 = v5 + 104;
  v110(v114);
  *(void *)(v97 + v98) = sub_257321408();
  uint64_t v98 = OBJC_IVAR___NHOAccessoryIntent__homeName;
  sub_2573214B8();
  uint64_t v25 = v108;
  v21(v15, 1, 1, v108);
  uint64_t v124 = 0;
  unint64_t v125 = 0;
  uint64_t v26 = v12;
  uint64_t v27 = v113;
  uint64_t v28 = v115;
  v115(v26, 1, 1, v113);
  v116(v9, 1, 1, v118);
  ((void (*)(char *, void, uint64_t))v110)(v114, v117, v4);
  unsigned int v106 = v19;
  char v29 = v9;
  *(void *)&v122[v98] = sub_257321408();
  uint64_t v98 = OBJC_IVAR___NHOAccessoryIntent__accessoryID;
  sub_2573214B8();
  uint64_t v30 = v25;
  uint64_t v31 = v112;
  v112(v15, 1, 1, v30);
  uint64_t v124 = 0;
  unint64_t v125 = 0;
  uint64_t v32 = v23;
  v28(v23, 1, 1, v27);
  uint64_t v33 = v118;
  uint64_t v34 = v116;
  v116(v9, 1, 1, v118);
  int v36 = v110;
  uint64_t v35 = v111;
  ((void (*)(char *, void, uint64_t))v110)(v114, v117, v111);
  uint64_t v105 = v15;
  *(void *)&v122[v98] = sub_257321408();
  uint64_t v98 = OBJC_IVAR___NHOAccessoryIntent__accessoryName;
  sub_2573214B8();
  v31(v15, 1, 1, v108);
  uint64_t v124 = 0;
  unint64_t v125 = 0;
  uint64_t v37 = v32;
  uint64_t v38 = v113;
  v115(v32, 1, 1, v113);
  char v39 = v29;
  v34(v29, 1, 1, v33);
  uint64_t v40 = v114;
  uint64_t v41 = v117;
  ((void (*)(char *, void, uint64_t))v36)(v114, v117, v35);
  char v42 = v105;
  unint64_t v43 = v39;
  unint64_t v44 = v40;
  *(void *)&v122[v98] = sub_257321408();
  uint64_t v98 = OBJC_IVAR___NHOAccessoryIntent__icon;
  sub_2573214B8();
  uint64_t v45 = v108;
  unint64_t v46 = v112;
  v112(v42, 1, 1, v108);
  uint64_t v124 = 0;
  unint64_t v125 = 0;
  uint64_t v104 = v37;
  unint64_t v47 = v115;
  v115(v37, 1, 1, v38);
  v116(v43, 1, 1, v118);
  ((void (*)(char *, uint64_t, uint64_t))v110)(v44, v41, v111);
  uint64_t v48 = v105;
  *(void *)&v122[v98] = sub_257321408();
  uint64_t v98 = OBJC_IVAR___NHOAccessoryIntent__serviceType;
  sub_2573214B8();
  v46(v48, 1, 1, v45);
  uint64_t v124 = 0;
  unint64_t v125 = 0;
  v47(v104, 1, 1, v113);
  uint64_t v49 = v43;
  uint64_t v50 = v118;
  uint64_t v51 = v116;
  v116(v43, 1, 1, v118);
  id v52 = v114;
  uint64_t v53 = v110;
  ((void (*)(char *, void, uint64_t))v110)(v114, v117, v111);
  int v54 = v105;
  uint64_t v55 = v52;
  *(void *)&v122[v98] = sub_257321408();
  uint64_t v95 = OBJC_IVAR___NHOAccessoryIntent__useHomeKitRecommendations;
  uint64_t v94 = __swift_instantiateConcreteTypeFromMangledName(&qword_269FE5650);
  sub_2573214B8();
  uint64_t v56 = v108;
  v112(v54, 1, 1, v108);
  LOBYTE(v124) = 2;
  uint64_t v97 = sub_257321918();
  uint64_t v57 = *(void *)(v97 - 8);
  uint64_t v96 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v57 + 56);
  uint64_t v98 = v57 + 56;
  v96(v103, 1, 1, v97);
  v51(v49, 1, 1, v50);
  uint64_t v58 = v55;
  int v59 = v55;
  uint64_t v60 = v117;
  uint64_t v61 = v111;
  ((void (*)(char *, void, uint64_t))v53)(v59, v117, v111);
  int v62 = v58;
  *(void *)&v122[v95] = sub_257321418();
  uint64_t v95 = OBJC_IVAR___NHOAccessoryIntent__accessoriesAndScenes;
  sub_2573214B8();
  v112(v54, 1, 1, v56);
  uint64_t v124 = 0;
  unint64_t v125 = 0;
  unint64_t v63 = v104;
  v115(v104, 1, 1, v113);
  v116(v49, 1, 1, v118);
  uint64_t v64 = v62;
  uint64_t v65 = v110;
  ((void (*)(char *, uint64_t, uint64_t))v110)(v64, v60, v61);
  int v66 = v49;
  *(void *)&v122[v95] = sub_257321408();
  uint64_t v95 = OBJC_IVAR___NHOAccessoryIntent__requestConfirmationText;
  uint64_t v107 = __swift_instantiateConcreteTypeFromMangledName(&qword_269FE5418);
  uint64_t v94 = 0xD000000000000017;
  sub_2573214B8();
  uint64_t v67 = v108;
  unsigned int v68 = v112;
  v112(v54, 1, 1, v108);
  uint64_t v124 = 0;
  unint64_t v125 = 0;
  v115(v63, 1, 1, v113);
  unint64_t v93 = v66;
  v116(v66, 1, 1, v118);
  unint64_t v69 = v114;
  uint64_t v70 = v117;
  ((void (*)(char *, void, uint64_t))v65)(v114, v117, v111);
  uint64_t v71 = v105;
  uint64_t v72 = sub_257321408();
  unint64_t v73 = v122;
  *(void *)&v122[v95] = v72;
  uint64_t v95 = OBJC_IVAR___NHOAccessoryIntent__requestConfirmationIcon;
  sub_2573214B8();
  v68(v71, 1, 1, v67);
  uint64_t v124 = 0;
  unint64_t v125 = 0;
  v115(v104, 1, 1, v113);
  uint64_t v74 = v93;
  uint64_t v75 = v118;
  uint64_t v76 = v116;
  v116(v93, 1, 1, v118);
  uint64_t v78 = v110;
  uint64_t v77 = v111;
  ((void (*)(char *, uint64_t, uint64_t))v110)(v69, v70, v111);
  *(void *)&v73[v95] = sub_257321408();
  uint64_t v119 = OBJC_IVAR___NHOAccessoryIntent__isSmartStack;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269FE5660);
  sub_2573214B8();
  v112(v71, 1, 1, v108);
  LOBYTE(v124) = 2;
  v96(v103, 1, 1, v97);
  v76(v74, 1, 1, v75);
  ((void (*)(char *, void, uint64_t))v78)(v69, v117, v77);
  uint64_t v79 = sub_257321418();
  char v80 = v122;
  *(void *)&v122[v119] = v79;

  v123.id receiver = v80;
  v123.super_class = ObjectType;
  id v81 = objc_msgSendSuper2(&v123, sel_init);
  uint64_t v124 = 0xD000000000000024;
  unint64_t v125 = 0x8000000257324DD0;
  id v82 = v81;
  swift_retain();
  sub_2573213D8();
  swift_release();
  uint64_t v124 = _s15NanoHomeIntents21NHOIntentLocalizationC15localizedStringyS2SFZ_0(0xD00000000000001CLL, 0x8000000257324A60);
  unint64_t v125 = v83;
  swift_retain();
  sub_2573213D8();
  swift_release();
  uint64_t v124 = 0xD000000000000024;
  unint64_t v125 = 0x8000000257324DD0;
  swift_retain();
  sub_2573213D8();
  swift_release();
  uint64_t v124 = _s15NanoHomeIntents21NHOIntentLocalizationC15localizedStringyS2SFZ_0(0xD000000000000021, 0x8000000257324E00);
  unint64_t v125 = v84;
  swift_retain();
  sub_2573213D8();
  swift_release();
  uint64_t v124 = 0x74696B656D6F68;
  unint64_t v125 = 0xE700000000000000;
  swift_retain();
  sub_2573213D8();
  swift_release();
  uint64_t v85 = v101;
  unint64_t v86 = v100;
  uint64_t v87 = v102;
  (*(void (**)(char *, void, uint64_t))(v101 + 104))(v100, *MEMORY[0x263F48208], v102);
  uint64_t v88 = sub_257321678();
  unint64_t v90 = v89;
  (*(void (**)(char *, uint64_t))(v85 + 8))(v86, v87);
  uint64_t v124 = v88;
  unint64_t v125 = v90;
  swift_retain();
  sub_2573213D8();
  swift_release();
  uint64_t v124 = 0xD000000000000024;
  unint64_t v125 = 0x8000000257324DD0;
  swift_retain();
  sub_2573213D8();
  swift_release();
  LOBYTE(v124) = 0;
  swift_retain();
  sub_2573213D8();

  swift_release();
  return v82;
}

uint64_t NHOAccessoryIntent.perform()(uint64_t a1)
{
  *(void *)(v1 + 24) = a1;
  return MEMORY[0x270FA2498](sub_257306980, 0, 0);
}

uint64_t NHOAccessoryIntent.description.getter()
{
  return 0;
}

id NHOAccessoryIntent.__deallocating_deinit()
{
  v2.id receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_25731D494@<X0>(uint64_t a1@<X8>)
{
  if (qword_269FE5328 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_2573214C8();
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)qword_269FE5AE8);
  swift_beginAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t sub_25731D554(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_257306DBC;
  v3[3] = a1;
  return MEMORY[0x270FA2498](sub_257306980, 0, 0);
}

uint64_t sub_25731D600()
{
  uint64_t v1 = sub_25731D70C(&qword_269FE5B80);

  return MEMORY[0x270EE0D28](v0, v1);
}

uint64_t sub_25731D64C()
{
  return sub_25731D70C(&qword_269FE5B80);
}

uint64_t type metadata accessor for NHOAccessoryIntent()
{
  return self;
}

uint64_t sub_25731D6A4()
{
  return sub_25731D70C(&qword_269FE5B88);
}

uint64_t sub_25731D6D8()
{
  return sub_25731D70C((unint64_t *)&unk_269FE5B90);
}

uint64_t sub_25731D70C(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for NHOAccessoryIntent();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_25731D74C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_25731D768()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_25731D7D4@<X0>(void *a1@<X8>)
{
  return sub_257312F68(a1);
}

uint64_t sub_25731D7F4()
{
  return sub_257300D90();
}

uint64_t sub_25731D814@<X0>(void *a1@<X8>)
{
  return sub_257312F68(a1);
}

uint64_t sub_25731D834()
{
  return sub_257300D90();
}

uint64_t sub_25731D854@<X0>(void *a1@<X8>)
{
  return sub_257312F68(a1);
}

uint64_t sub_25731D874()
{
  return sub_257300D90();
}

uint64_t sub_25731D894@<X0>(void *a1@<X8>)
{
  return sub_257312F68(a1);
}

uint64_t sub_25731D8B4()
{
  return sub_257300D90();
}

uint64_t sub_25731D8D4@<X0>(void *a1@<X8>)
{
  return sub_257312F68(a1);
}

uint64_t sub_25731D8F4()
{
  return sub_257300D90();
}

uint64_t sub_25731D914@<X0>(void *a1@<X8>)
{
  return sub_257312F68(a1);
}

uint64_t sub_25731D934()
{
  return sub_257300D90();
}

uint64_t sub_25731D95C@<X0>(void *a1@<X8>)
{
  return sub_257312F68(a1);
}

uint64_t sub_25731D97C()
{
  return sub_257300D90();
}

double sub_25731D99C@<D0>(_OWORD *a1@<X8>)
{
  return sub_257300D3C(a1);
}

uint64_t sub_25731D9BC()
{
  return sub_257300D90();
}

double sub_25731D9DC@<D0>(_OWORD *a1@<X8>)
{
  return sub_257300D3C(a1);
}

uint64_t sub_25731D9FC()
{
  return sub_257300D90();
}

char *HMService.primaryControlCharacteristic.getter()
{
  HMService.primaryControlCharacteristicType.getter();
  if (v1)
  {
    uint64_t v2 = (void *)sub_2573217E8();
    swift_bridgeObjectRelease();
    uint64_t v3 = (char *)objc_msgSend(v0, sel_hf_characteristicOfType_, v2);
  }
  else
  {
    id v4 = objc_msgSend(v0, sel_characteristics);
    sub_2573001D4(0, &qword_269FE53B0);
    unint64_t v5 = sub_2573218D8();

    id v6 = v0;
    uint64_t v3 = sub_257300210(v5);
    swift_bridgeObjectRelease();
  }
  return v3;
}

uint64_t HMService.iconSymbol.getter()
{
  return sub_25731E37C(MEMORY[0x263F490C0], MEMORY[0x263F481A0]);
}

uint64_t HMService.isLightbulbService.getter()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_257321688();
  uint64_t v67 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  unint64_t v63 = &v60[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v66 = __swift_instantiateConcreteTypeFromMangledName(&qword_269FE5BA8);
  uint64_t v4 = MEMORY[0x270FA5388](v66);
  uint64_t v65 = &v60[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = &v60[-v6];
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_269FE53B8);
  uint64_t v9 = MEMORY[0x270FA5388](v8 - 8);
  int v62 = &v60[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  uint64_t v13 = &v60[-v12];
  uint64_t v14 = MEMORY[0x270FA5388](v11);
  uint64_t v64 = &v60[-v15];
  uint64_t v16 = MEMORY[0x270FA5388](v14);
  uint64_t v18 = &v60[-v17];
  uint64_t v19 = MEMORY[0x270FA5388](v16);
  id v21 = &v60[-v20];
  MEMORY[0x270FA5388](v19);
  int v23 = &v60[-v22];
  id v24 = objc_msgSend(v0, sel_serviceType);
  uint64_t v25 = sub_2573217F8();
  uint64_t v27 = v26;

  if (v25 == sub_2573217F8() && v27 == v28)
  {
    swift_bridgeObjectRelease_n();
LABEL_27:
    char v46 = 1;
    return v46 & 1;
  }
  char v29 = sub_257321C18();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v29) {
    goto LABEL_27;
  }
  id v30 = objc_msgSend(v1, sel_serviceType);
  uint64_t v31 = sub_2573217F8();
  uint64_t v33 = v32;

  if (v31 == sub_2573217F8() && v33 == v34)
  {
    swift_bridgeObjectRelease_n();
  }
  else
  {
    char v35 = sub_257321C18();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v35 & 1) == 0) {
      goto LABEL_15;
    }
  }
  sub_257321A58();
  uint64_t v36 = v67;
  (*(void (**)(unsigned char *, void, uint64_t))(v67 + 104))(v21, *MEMORY[0x263F482B0], v2);
  (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v36 + 56))(v21, 0, 1, v2);
  uint64_t v37 = (uint64_t)&v7[*(int *)(v66 + 48)];
  sub_25731F8F4((uint64_t)v23, (uint64_t)v7);
  sub_25731F8F4((uint64_t)v21, v37);
  uint64_t v38 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v36 + 48);
  if (v38((uint64_t)v7, 1, v2) == 1)
  {
    sub_2572FCE10((uint64_t)v21, &qword_269FE53B8);
    sub_2572FCE10((uint64_t)v23, &qword_269FE53B8);
    if (v38(v37, 1, v2) == 1)
    {
      uint64_t v39 = (uint64_t)v7;
LABEL_22:
      sub_2572FCE10(v39, &qword_269FE53B8);
      goto LABEL_27;
    }
    goto LABEL_14;
  }
  sub_25731F8F4((uint64_t)v7, (uint64_t)v18);
  if (v38(v37, 1, v2) == 1)
  {
    sub_2572FCE10((uint64_t)v21, &qword_269FE53B8);
    sub_2572FCE10((uint64_t)v23, &qword_269FE53B8);
    (*(void (**)(unsigned char *, uint64_t))(v67 + 8))(v18, v2);
LABEL_14:
    sub_2572FCE10((uint64_t)v7, &qword_269FE5BA8);
    goto LABEL_15;
  }
  uint64_t v53 = v67;
  int v54 = v63;
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v67 + 32))(v63, v37, v2);
  sub_25731F95C();
  int v61 = sub_2573217C8();
  uint64_t v55 = *(void (**)(unsigned char *, uint64_t))(v53 + 8);
  v55(v54, v2);
  sub_2572FCE10((uint64_t)v21, &qword_269FE53B8);
  sub_2572FCE10((uint64_t)v23, &qword_269FE53B8);
  v55(v18, v2);
  sub_2572FCE10((uint64_t)v7, &qword_269FE53B8);
  if (v61) {
    goto LABEL_27;
  }
LABEL_15:
  id v40 = objc_msgSend(v1, sel_serviceType);
  uint64_t v41 = sub_2573217F8();
  uint64_t v43 = v42;

  if (v41 == sub_2573217F8() && v43 == v44)
  {
    swift_bridgeObjectRelease_n();
  }
  else
  {
    char v45 = sub_257321C18();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    char v46 = 0;
    if ((v45 & 1) == 0) {
      return v46 & 1;
    }
  }
  uint64_t v47 = (uint64_t)v64;
  sub_257321A58();
  uint64_t v48 = v67;
  (*(void (**)(unsigned char *, void, uint64_t))(v67 + 104))(v13, *MEMORY[0x263F482B0], v2);
  (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v48 + 56))(v13, 0, 1, v2);
  uint64_t v49 = v65;
  uint64_t v50 = (uint64_t)&v65[*(int *)(v66 + 48)];
  sub_25731F8F4(v47, (uint64_t)v65);
  sub_25731F8F4((uint64_t)v13, v50);
  uint64_t v51 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v48 + 48);
  if (v51((uint64_t)v49, 1, v2) == 1)
  {
    sub_2572FCE10((uint64_t)v13, &qword_269FE53B8);
    sub_2572FCE10(v47, &qword_269FE53B8);
    if (v51(v50, 1, v2) == 1)
    {
      uint64_t v39 = (uint64_t)v49;
      goto LABEL_22;
    }
  }
  else
  {
    id v52 = v62;
    sub_25731F8F4((uint64_t)v49, (uint64_t)v62);
    if (v51(v50, 1, v2) != 1)
    {
      uint64_t v57 = v67;
      uint64_t v58 = v63;
      (*(void (**)(unsigned char *, uint64_t, uint64_t))(v67 + 32))(v63, v50, v2);
      sub_25731F95C();
      char v46 = sub_2573217C8();
      int v59 = *(void (**)(unsigned char *, uint64_t))(v57 + 8);
      v59(v58, v2);
      sub_2572FCE10((uint64_t)v13, &qword_269FE53B8);
      sub_2572FCE10(v47, &qword_269FE53B8);
      v59(v52, v2);
      sub_2572FCE10((uint64_t)v49, &qword_269FE53B8);
      return v46 & 1;
    }
    sub_2572FCE10((uint64_t)v13, &qword_269FE53B8);
    sub_2572FCE10(v47, &qword_269FE53B8);
    (*(void (**)(unsigned char *, uint64_t))(v67 + 8))(v52, v2);
  }
  sub_2572FCE10((uint64_t)v49, &qword_269FE5BA8);
  char v46 = 0;
  return v46 & 1;
}

uint64_t HMService.iconSymbolActivated.getter()
{
  return sub_25731E37C(MEMORY[0x263F490B8], MEMORY[0x263F48180]);
}

uint64_t sub_25731E37C(uint64_t (*a1)(void), uint64_t (*a2)(uint64_t))
{
  uint64_t v4 = sub_257321688();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_269FE5BA0);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_257321A48();
  if (v11)
  {
    sub_2573216C8();
    uint64_t v12 = sub_2573216D8();
    uint64_t v13 = *(void *)(v12 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v10, 1, v12) != 1)
    {
      uint64_t v15 = a1();
      (*(void (**)(char *, uint64_t))(v13 + 8))(v10, v12);
      return v15;
    }
    sub_2572FCE10((uint64_t)v10, &qword_269FE5BA0);
  }
  if (HMService.isLightbulbService.getter()) {
    uint64_t v14 = (*(uint64_t (**)(char *, void, uint64_t))(v5 + 104))(v7, *MEMORY[0x263F482B0], v4);
  }
  else {
    uint64_t v14 = sub_257321A28();
  }
  uint64_t v15 = a2(v14);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v15;
}

uint64_t HMService.tint.getter()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_2573216A8();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269FE53B8);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_257321688();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v16 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v13 = objc_msgSend(v1, sel_serviceType);
  sub_2573217F8();

  sub_257321828();
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9) == 1)
  {
    sub_2572FCE10((uint64_t)v8, &qword_269FE53B8);
    (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, *MEMORY[0x263F487C8], v2);
    uint64_t v14 = sub_257321698();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v12, v8, v9);
    uint64_t v14 = ServiceKind.iconColorBase.getter();
    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  }
  return v14;
}

uint64_t HMService.primaryControlCharacteristicType.getter()
{
  uint64_t v0 = sub_257321688();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_257321A28();
  int v4 = (*(uint64_t (**)(char *, uint64_t))(v1 + 88))(v3, v0);
  if (v4 == *MEMORY[0x263F481F0]
    || v4 == *MEMORY[0x263F48138]
    || v4 == *MEMORY[0x263F482B0]
    || v4 == *MEMORY[0x263F480B0]
    || v4 == *MEMORY[0x263F48248]
    || v4 == *MEMORY[0x263F48260]
    || v4 == *MEMORY[0x263F480F0]
    || v4 == *MEMORY[0x263F480F8])
  {
    return sub_2573217F8();
  }
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  return 0;
}

uint64_t HMService.primaryStateCharacteristicType.getter()
{
  uint64_t v0 = sub_257321688();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_257321A28();
  int v4 = (*(uint64_t (**)(char *, uint64_t))(v1 + 88))(v3, v0);
  if (v4 == *MEMORY[0x263F48200]
    || v4 == *MEMORY[0x263F481F0]
    || v4 == *MEMORY[0x263F48138]
    || v4 == *MEMORY[0x263F482B0]
    || v4 == *MEMORY[0x263F480B0]
    || v4 == *MEMORY[0x263F48248]
    || v4 == *MEMORY[0x263F48260]
    || v4 == *MEMORY[0x263F480F0]
    || v4 == *MEMORY[0x263F480F8])
  {
    return sub_2573217F8();
  }
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  return 0;
}

void *HMService.primaryStateCharacteristic.getter()
{
  uint64_t v1 = HMService.primaryStateCharacteristicType.getter();
  if (!v2) {
    return 0;
  }
  uint64_t v3 = v1;
  uint64_t v4 = v2;
  id v5 = objc_msgSend(v0, sel_characteristics);
  sub_2573001D4(0, &qword_269FE53B0);
  unint64_t v6 = sub_2573218D8();

  swift_bridgeObjectRetain();
  uint64_t v7 = sub_25731F9B4(v6, v3, v4);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease_n();
  return v7;
}

uint64_t HMService.isLockService.getter()
{
  return sub_25731ECBC();
}

uint64_t HMService.isGarageDoor.getter()
{
  return sub_25731ECBC();
}

uint64_t sub_25731ECBC()
{
  id v1 = objc_msgSend(v0, sel_serviceType);
  uint64_t v2 = sub_2573217F8();
  uint64_t v4 = v3;

  if (v2 == sub_2573217F8() && v4 == v5) {
    char v7 = 1;
  }
  else {
    char v7 = sub_257321C18();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t HMService.isInServiceGroup.getter()
{
  id v1 = objc_msgSend(v0, sel_home);
  if (!v1) {
    return 0;
  }
  uint64_t v2 = v1;
  id v3 = objc_msgSend(v1, sel_serviceGroups);

  sub_2573001D4(0, &qword_269FE58D0);
  unint64_t v4 = sub_2573218D8();

  if (v4 >> 62) {
    goto LABEL_45;
  }
  uint64_t v5 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v5)
  {
    while (1)
    {
      unint64_t v6 = 0;
      unint64_t v28 = v4 & 0xC000000000000001;
      unint64_t v26 = v4 + 32;
      uint64_t v27 = v4 & 0xFFFFFFFFFFFFFF8;
      unint64_t v25 = v4;
      while (1)
      {
        if (v28)
        {
          id v7 = (id)MEMORY[0x25A2B3680](v6, v4);
        }
        else
        {
          if (v6 >= *(void *)(v27 + 16)) {
            goto LABEL_44;
          }
          id v7 = *(id *)(v26 + 8 * v6);
        }
        uint64_t v8 = v7;
        if (__OFADD__(v6++, 1)) {
          goto LABEL_42;
        }
        id v10 = objc_msgSend(v7, sel_services);
        sub_2573001D4(0, &qword_269FE53A0);
        unint64_t v11 = sub_2573218D8();

        if (v11 >> 62)
        {
          swift_bridgeObjectRetain_n();
          uint64_t v12 = sub_257321BA8();
          swift_bridgeObjectRelease();
          if (!v12) {
            goto LABEL_26;
          }
        }
        else
        {
          uint64_t v12 = *(void *)((v11 & 0xFFFFFFFFFFFFFF8) + 0x10);
          swift_bridgeObjectRetain();
          if (!v12) {
            goto LABEL_26;
          }
        }
        if ((v11 & 0xC000000000000001) != 0) {
          id v13 = (id)MEMORY[0x25A2B3680](0, v11);
        }
        else {
          id v13 = *(id *)(v11 + 32);
        }
        uint64_t v14 = v13;
        char v15 = sub_257321A18();

        if (v15)
        {
LABEL_38:

          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          uint64_t v5 = 1;
          goto LABEL_39;
        }
        if (v12 != 1) {
          break;
        }
LABEL_26:

        swift_bridgeObjectRelease();
LABEL_27:
        swift_bridgeObjectRelease();
        if (v6 == v5)
        {
          uint64_t v5 = 0;
          goto LABEL_39;
        }
      }
      if ((v11 & 0xC000000000000001) != 0) {
        break;
      }
      id v19 = *(id *)(v11 + 40);
      char v20 = sub_257321A18();

      if (v20) {
        goto LABEL_38;
      }
      if (v12 == 2) {
        goto LABEL_26;
      }
      uint64_t v21 = 6;
      while (1)
      {
        unint64_t v4 = v21 - 3;
        if (__OFADD__(v21 - 4, 1)) {
          break;
        }
        id v22 = *(id *)(v11 + 8 * v21);
        char v23 = sub_257321A18();

        if (v23) {
          goto LABEL_38;
        }
        ++v21;
        if (v4 == v12)
        {
LABEL_33:

          swift_bridgeObjectRelease();
          unint64_t v4 = v25;
          goto LABEL_27;
        }
      }
LABEL_43:
      __break(1u);
LABEL_44:
      __break(1u);
LABEL_45:
      swift_bridgeObjectRetain();
      uint64_t v5 = sub_257321BA8();
      swift_bridgeObjectRelease();
      if (!v5) {
        goto LABEL_39;
      }
    }
    MEMORY[0x25A2B3680](1, v11);
    char v16 = sub_257321A18();
    swift_unknownObjectRelease();
    if (v16) {
      goto LABEL_38;
    }
    if (v12 != 2)
    {
      uint64_t v17 = 2;
      while (1)
      {
        MEMORY[0x25A2B3680](v17, v11);
        unint64_t v4 = v17 + 1;
        if (__OFADD__(v17, 1)) {
          break;
        }
        char v18 = sub_257321A18();
        swift_unknownObjectRelease();
        if (v18) {
          goto LABEL_38;
        }
        ++v17;
        if (v4 == v12) {
          goto LABEL_33;
        }
      }
      __break(1u);
LABEL_42:
      __break(1u);
      goto LABEL_43;
    }
    goto LABEL_26;
  }
LABEL_39:
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_25731F100(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_269FE5BB0);
  MEMORY[0x270FA5388](v5 - 8);
  id v7 = (char *)v25 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_2573215A8();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)v25 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)v25 - v13;
  if (a2)
  {
    v25[1] = a3;
    char v15 = (void *)sub_257321A38();
    if (v15)
    {
      char v16 = v15;
      id v17 = objc_msgSend(v15, sel_uniqueIdentifier);

      sub_257321598();
      char v18 = *(void (**)(char *, char *, uint64_t))(v9 + 32);
      v18(v7, v12, v8);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v9 + 56))(v7, 0, 1, v8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) != 1)
      {
        v18(v14, v7, v8);
        if (*(void *)(a2 + 16) && (unint64_t v19 = sub_2572FBF08((uint64_t)v14), (v20 & 1) != 0))
        {
          sub_2572FD6B8(*(void *)(a2 + 56) + 32 * v19, (uint64_t)&v27);
        }
        else
        {
          long long v27 = 0u;
          long long v28 = 0u;
        }
        (*(void (**)(char *, uint64_t))(v9 + 8))(v14, v8);
        __swift_instantiateConcreteTypeFromMangledName(&qword_269FE5350);
        goto LABEL_16;
      }
    }
    else
    {
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56))(v7, 1, 1, v8);
    }
    sub_2572FCE10((uint64_t)v7, &qword_269FE5BB0);
  }
  uint64_t v21 = (void *)sub_257321A38();
  if (v21)
  {
    id v22 = v21;
    id v23 = objc_msgSend(v21, sel_value);

    if (v23)
    {
      sub_257321A88();
      swift_unknownObjectRelease();
    }
    else
    {
      memset(v26, 0, sizeof(v26));
    }
    sub_2572FCD70((uint64_t)v26, (uint64_t)&v27);
  }
  else
  {
    long long v27 = 0u;
    long long v28 = 0u;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_269FE5350);
LABEL_16:
  if ((swift_dynamicCast() & 1) == 0) {
    *(void *)&v26[0] = 0;
  }
  return *(void *)&v26[0];
}

uint64_t _sSo9HMServiceC15NanoHomeIntentsE9BOOLValue3for4withSbSg0C9DataModel18CharacteristicKindO_SDy10Foundation4UUIDVypGSgtF_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_269FE5BB0);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_2573215A8();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)v23 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)v23 - v11;
  if (!a2)
  {
LABEL_9:
    unint64_t v19 = (void *)sub_257321A38();
    if (v19)
    {
      char v20 = v19;
      id v21 = objc_msgSend(v19, sel_value);

      if (v21)
      {
        sub_257321A88();
        swift_unknownObjectRelease();
      }
      else
      {
        memset(v23, 0, sizeof(v23));
      }
      sub_2572FCD70((uint64_t)v23, (uint64_t)&v24);
    }
    else
    {
      long long v24 = 0u;
      long long v25 = 0u;
    }
    goto LABEL_17;
  }
  uint64_t v13 = (void *)sub_257321A38();
  if (!v13)
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v7 + 56))(v5, 1, 1, v6);
    goto LABEL_8;
  }
  uint64_t v14 = v13;
  id v15 = objc_msgSend(v13, sel_uniqueIdentifier);

  sub_257321598();
  char v16 = *(void (**)(char *, char *, uint64_t))(v7 + 32);
  v16(v5, v10, v6);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(v5, 0, 1, v6);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6) == 1)
  {
LABEL_8:
    sub_2572FCE10((uint64_t)v5, &qword_269FE5BB0);
    goto LABEL_9;
  }
  v16(v12, v5, v6);
  if (*(void *)(a2 + 16) && (unint64_t v17 = sub_2572FBF08((uint64_t)v12), (v18 & 1) != 0))
  {
    sub_2572FD6B8(*(void *)(a2 + 56) + 32 * v17, (uint64_t)&v24);
  }
  else
  {
    long long v24 = 0u;
    long long v25 = 0u;
  }
  (*(void (**)(char *, uint64_t))(v7 + 8))(v12, v6);
LABEL_17:
  __swift_instantiateConcreteTypeFromMangledName(&qword_269FE5350);
  if ((swift_dynamicCast() & 1) == 0) {
    LOBYTE(v23[0]) = 2;
  }
  return LOBYTE(v23[0]);
}

uint64_t HMService.intValue(for:with:)(uint64_t a1, uint64_t a2)
{
  return sub_25731F100(a1, a2, MEMORY[0x263F8D6C8]);
}

uint64_t HMService.doubleValue(for:with:)(uint64_t a1, uint64_t a2)
{
  return sub_25731F100(a1, a2, MEMORY[0x263F8D538]);
}

Swift::Bool_optional __swiftcall HMService.powerState(with:)(Swift::OpaquePointer_optional with)
{
  rawValue = with.value._rawValue;
  uint64_t v2 = sub_2573216B8();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = *(void (**)(char *, void, uint64_t))(v3 + 104);
  v6(v5, *MEMORY[0x263F48840], v2);
  v7.value = _sSo9HMServiceC15NanoHomeIntentsE9BOOLValue3for4withSbSg0C9DataModel18CharacteristicKindO_SDy10Foundation4UUIDVypGSgtF_0((uint64_t)v5, (uint64_t)rawValue);
  uint64_t v8 = *(void (**)(char *, uint64_t))(v3 + 8);
  v8(v5, v2);
  if (v7.value == 2)
  {
    v6(v5, *MEMORY[0x263F48AC0], v2);
    v7.value = _sSo9HMServiceC15NanoHomeIntentsE9BOOLValue3for4withSbSg0C9DataModel18CharacteristicKindO_SDy10Foundation4UUIDVypGSgtF_0((uint64_t)v5, (uint64_t)rawValue);
    v8(v5, v2);
  }
  return v7;
}

uint64_t sub_25731F8F4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269FE53B8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_25731F95C()
{
  unint64_t result = qword_269FE5900;
  if (!qword_269FE5900)
  {
    sub_257321688();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269FE5900);
  }
  return result;
}

void *sub_25731F9B4(unint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  unint64_t v7 = a1;
  if (a1 >> 62)
  {
LABEL_20:
    swift_bridgeObjectRetain();
    uint64_t v8 = sub_257321BA8();
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v8 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v8)
    {
LABEL_3:
      uint64_t v22 = v4;
      unint64_t v23 = v7;
      unint64_t v24 = v7 & 0xC000000000000001;
      uint64_t v4 = 4;
      do
      {
        uint64_t v9 = v4 - 4;
        if (v24)
        {
          id v10 = (id)MEMORY[0x25A2B3680](v4 - 4, v7);
          uint64_t v11 = v4 - 3;
          if (__OFADD__(v9, 1)) {
            goto LABEL_19;
          }
        }
        else
        {
          id v10 = *(id *)(v7 + 8 * v4);
          uint64_t v11 = v4 - 3;
          if (__OFADD__(v9, 1))
          {
LABEL_19:
            __break(1u);
            goto LABEL_20;
          }
        }
        uint64_t v12 = v8;
        uint64_t v13 = v10;
        uint64_t v14 = a3;
        id v15 = objc_msgSend(v10, sel_characteristicType, v22);
        uint64_t v16 = sub_2573217F8();
        uint64_t v18 = v17;

        a3 = v14;
        BOOL v19 = v16 == a2 && v18 == v14;
        if (v19)
        {
          swift_bridgeObjectRelease();
LABEL_18:
          swift_bridgeObjectRelease();
          return v13;
        }
        char v20 = sub_257321C18();
        swift_bridgeObjectRelease();
        if (v20) {
          goto LABEL_18;
        }

        ++v4;
        uint64_t v8 = v12;
        BOOL v19 = v11 == v12;
        unint64_t v7 = v23;
      }
      while (!v19);
    }
  }
  swift_bridgeObjectRelease();
  return 0;
}

unint64_t static NanoHomeAnalytics.WidgetTapped.getter()
{
  return 0xD000000000000020;
}

unint64_t static NanoHomeAnalytics.SuggestedControlsActionProvider.getter()
{
  return 0xD00000000000003ALL;
}

uint64_t static NanoHomeAnalytics.WidgetActionTypeKey.getter()
{
  return 0x79546E6F69746361;
}

NanoHomeIntents::NanoHomeAnalytics::WidgetActionType_optional __swiftcall NanoHomeAnalytics.WidgetActionType.init(rawValue:)(Swift::Int rawValue)
{
  char v2 = 6;
  if ((unint64_t)rawValue < 6) {
    char v2 = rawValue;
  }
  *id v1 = v2;
  return (NanoHomeIntents::NanoHomeAnalytics::WidgetActionType_optional)rawValue;
}

NanoHomeIntents::NanoHomeAnalytics::WidgetActionType_optional sub_25731FBCC(Swift::Int *a1)
{
  return NanoHomeAnalytics.WidgetActionType.init(rawValue:)(*a1);
}

uint64_t static NanoHomeAnalytics.WidgetSourceKey.getter()
{
  return 0x656372756F73;
}

NanoHomeIntents::NanoHomeAnalytics::WidgetSource_optional __swiftcall NanoHomeAnalytics.WidgetSource.init(rawValue:)(Swift::Int rawValue)
{
  if (rawValue == 1) {
    char v2 = 1;
  }
  else {
    char v2 = 2;
  }
  if (!rawValue) {
    char v2 = 0;
  }
  *id v1 = v2;
  return (NanoHomeIntents::NanoHomeAnalytics::WidgetSource_optional)rawValue;
}

uint64_t NanoHomeAnalytics.WidgetSource.rawValue.getter()
{
  return *v0;
}

BOOL sub_25731FC0C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

void *sub_25731FC24@<X0>(void *result@<X0>, char *a2@<X8>)
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

void sub_25731FC44(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t static NanoHomeAnalytics.WidgetKindKey.getter()
{
  return 0x694B746567646977;
}

NanoHomeIntents::NanoHomeAnalytics::WidgetKind_optional __swiftcall NanoHomeAnalytics.WidgetKind.init(rawValue:)(Swift::Int rawValue)
{
  char v2 = 3;
  if ((unint64_t)rawValue < 3) {
    char v2 = rawValue;
  }
  *id v1 = v2;
  return (NanoHomeIntents::NanoHomeAnalytics::WidgetKind_optional)rawValue;
}

uint64_t NanoHomeAnalytics.WidgetKind.rawValue.getter()
{
  return *v0;
}

NanoHomeIntents::NanoHomeAnalytics::WidgetKind_optional sub_25731FC88(Swift::Int *a1)
{
  return NanoHomeAnalytics.WidgetKind.init(rawValue:)(*a1);
}

uint64_t static NanoHomeAnalytics.WidgetActionProviderKey.getter()
{
  return 0x72506E6F69746361;
}

NanoHomeIntents::NanoHomeAnalytics::WidgetActionProvider_optional __swiftcall NanoHomeAnalytics.WidgetActionProvider.init(rawValue:)(Swift::Int rawValue)
{
  char v2 = 11;
  if ((unint64_t)rawValue < 0xB) {
    char v2 = rawValue;
  }
  *id v1 = v2;
  return (NanoHomeIntents::NanoHomeAnalytics::WidgetActionProvider_optional)rawValue;
}

unint64_t sub_25731FCCC()
{
  unint64_t result = qword_269FE5BB8;
  if (!qword_269FE5BB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269FE5BB8);
  }
  return result;
}

unint64_t sub_25731FD24()
{
  unint64_t result = qword_269FE5BC0;
  if (!qword_269FE5BC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269FE5BC0);
  }
  return result;
}

unint64_t sub_25731FD7C()
{
  unint64_t result = qword_269FE5BC8;
  if (!qword_269FE5BC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269FE5BC8);
  }
  return result;
}

unint64_t sub_25731FDD4()
{
  unint64_t result = qword_269FE5BD0;
  if (!qword_269FE5BD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269FE5BD0);
  }
  return result;
}

NanoHomeIntents::NanoHomeAnalytics::WidgetActionProvider_optional sub_25731FE28(Swift::Int *a1)
{
  return NanoHomeAnalytics.WidgetActionProvider.init(rawValue:)(*a1);
}

ValueMetadata *type metadata accessor for NanoHomeAnalytics()
{
  return &type metadata for NanoHomeAnalytics;
}

uint64_t getEnumTagSinglePayload for NanoHomeAnalytics.WidgetActionType(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFB) {
    goto LABEL_17;
  }
  if (a2 + 5 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 5) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 5;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 5;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 5;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 6;
  int v8 = v6 - 6;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for NanoHomeAnalytics.WidgetActionType(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 5 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 5) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFB) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFA)
  {
    unsigned int v6 = ((a2 - 251) >> 8) + 1;
    *unint64_t result = a2 + 5;
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
        JUMPOUT(0x25731FF9CLL);
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
          *unint64_t result = a2 + 5;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for NanoHomeAnalytics.WidgetActionType()
{
  return &type metadata for NanoHomeAnalytics.WidgetActionType;
}

uint64_t getEnumTagSinglePayload for NanoHomeAnalytics.WidgetSource(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFF) {
    goto LABEL_17;
  }
  if (a2 + 1 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 1) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 1;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 1;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 1;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 2;
  int v8 = v6 - 2;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for NanoHomeAnalytics.WidgetSource(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x257320130);
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

unsigned char *sub_257320158(unsigned char *result, char a2)
{
  *unint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for NanoHomeAnalytics.WidgetSource()
{
  return &type metadata for NanoHomeAnalytics.WidgetSource;
}

uint64_t getEnumTagSinglePayload for NanoHomeAnalytics.WidgetKind(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFE) {
    goto LABEL_17;
  }
  if (a2 + 2 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 2) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 2;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 2;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 2;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 3;
  int v8 = v6 - 3;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for NanoHomeAnalytics.WidgetKind(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x2573202D0);
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

ValueMetadata *type metadata accessor for NanoHomeAnalytics.WidgetKind()
{
  return &type metadata for NanoHomeAnalytics.WidgetKind;
}

uint64_t getEnumTagSinglePayload for NanoHomeAnalytics.WidgetActionProvider(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xF6) {
    goto LABEL_17;
  }
  if (a2 + 10 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 10) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 10;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 10;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 10;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0xB;
  int v8 = v6 - 11;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for NanoHomeAnalytics.WidgetActionProvider(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 10 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 10) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF6) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF5)
  {
    unsigned int v6 = ((a2 - 246) >> 8) + 1;
    *unint64_t result = a2 + 10;
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
        JUMPOUT(0x257320464);
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
          *unint64_t result = a2 + 10;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for NanoHomeAnalytics.WidgetActionProvider()
{
  return &type metadata for NanoHomeAnalytics.WidgetActionProvider;
}

id ElectricityRatesIntent.__allocating_init(homeIdentifier:homeName:)()
{
  id v1 = objc_msgSend(objc_allocWithZone(v0), sel_init);
  swift_retain();
  sub_2573213D8();
  swift_release();
  swift_retain();
  sub_2573213D8();

  swift_release();
  return v1;
}

uint64_t sub_257320570()
{
  uint64_t v0 = sub_2573214C8();
  __swift_allocate_value_buffer(v0, qword_269FE5BD8);
  __swift_project_value_buffer(v0, (uint64_t)qword_269FE5BD8);
  return sub_2573214B8();
}

uint64_t static ElectricityRatesIntent.title.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_25730085C(&qword_269FE5338, MEMORY[0x263F06D40], (uint64_t)qword_269FE5BD8, a1);
}

uint64_t static ElectricityRatesIntent.title.setter(uint64_t a1)
{
  return sub_257300944(a1, &qword_269FE5338, MEMORY[0x263F06D40], (uint64_t)qword_269FE5BD8);
}

uint64_t (*static ElectricityRatesIntent.title.modify())()
{
  if (qword_269FE5338 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_2573214C8();
  __swift_project_value_buffer(v0, (uint64_t)qword_269FE5BD8);
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_2573206D8()
{
  uint64_t v0 = sub_257321438();
  __swift_allocate_value_buffer(v0, qword_269FE5BF0);
  __swift_project_value_buffer(v0, (uint64_t)qword_269FE5BF0);
  return sub_257321428();
}

uint64_t static ElectricityRatesIntent.description.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_25730085C(&qword_269FE5340, MEMORY[0x263EFBA28], (uint64_t)qword_269FE5BF0, a1);
}

uint64_t static ElectricityRatesIntent.description.setter(uint64_t a1)
{
  return sub_257300944(a1, &qword_269FE5340, MEMORY[0x263EFBA28], (uint64_t)qword_269FE5BF0);
}

uint64_t (*static ElectricityRatesIntent.description.modify())()
{
  if (qword_269FE5340 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_257321438();
  __swift_project_value_buffer(v0, (uint64_t)qword_269FE5BF0);
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t ElectricityRatesIntent.homeID.getter()
{
  return sub_257300C20();
}

uint64_t ElectricityRatesIntent.homeID.setter()
{
  return sub_257300CF4();
}

uint64_t (*ElectricityRatesIntent.homeID.modify(void *a1))()
{
  int v3 = malloc(0x30uLL);
  *a1 = v3;
  v3[4] = *(void *)(v1 + OBJC_IVAR___NHOElectricityRatesIntent__homeID);
  swift_retain();
  v3[5] = sub_2573213B8();
  return sub_257300B6C;
}

uint64_t ElectricityRatesIntent.$homeID.getter()
{
  return sub_257300EB8();
}

uint64_t ElectricityRatesIntent.homeName.getter()
{
  return sub_257300C20();
}

uint64_t ElectricityRatesIntent.homeName.setter()
{
  return sub_257300CF4();
}

uint64_t (*ElectricityRatesIntent.homeName.modify(void *a1))()
{
  int v3 = malloc(0x30uLL);
  *a1 = v3;
  v3[4] = *(void *)(v1 + OBJC_IVAR___NHOElectricityRatesIntent__homeName);
  swift_retain();
  v3[5] = sub_2573213B8();
  return sub_257300B6C;
}

uint64_t ElectricityRatesIntent.$homeName.getter()
{
  return sub_257300EB8();
}

id ElectricityRatesIntent.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

id ElectricityRatesIntent.init()()
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v30 = sub_257321468();
  uint64_t v1 = *(void *)(v30 - 8);
  MEMORY[0x270FA5388](v30);
  int v3 = (char *)v25 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269FE5400);
  MEMORY[0x270FA5388](v4 - 8);
  unsigned int v6 = (char *)v25 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_269FE5408);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_269FE5410);
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t v12 = (char *)v25 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_2573214C8();
  uint64_t v34 = v13;
  uint64_t v14 = *(void *)(v13 - 8);
  MEMORY[0x270FA5388](v13);
  uint64_t v38 = OBJC_IVAR___NHOElectricityRatesIntent__homeID;
  uint64_t v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_269FE5418);
  uint64_t v39 = v0;
  sub_2573214B8();
  id v15 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v14 + 56);
  uint64_t v33 = v14 + 56;
  char v35 = v15;
  v15(v12, 1, 1, v13);
  uint64_t v16 = sub_2573217D8();
  uint64_t v42 = 0;
  uint64_t v43 = 0;
  uint64_t v17 = *(void *)(v16 - 8);
  uint64_t v31 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v17 + 56);
  uint64_t v32 = v17 + 56;
  v31(v9, 1, 1, v16);
  uint64_t v18 = sub_257321398();
  uint64_t v19 = *(void *)(v18 - 8);
  long long v28 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v19 + 56);
  uint64_t v29 = v19 + 56;
  v28(v6, 1, 1, v18);
  unsigned int v27 = *MEMORY[0x263EFBDC8];
  char v20 = *(void (**)(void))(v1 + 104);
  v25[1] = v1 + 104;
  unint64_t v26 = (void (*)(char *, void, uint64_t))v20;
  uint64_t v21 = v30;
  v20(v3);
  *(void *)(v37 + v38) = sub_257321408();
  uint64_t v38 = OBJC_IVAR___NHOElectricityRatesIntent__homeName;
  sub_2573214B8();
  v35(v12, 1, 1, v34);
  uint64_t v42 = 0;
  uint64_t v43 = 0;
  v31(v9, 1, 1, v16);
  v28(v6, 1, 1, v18);
  v26(v3, v27, v21);
  uint64_t v22 = sub_257321408();
  unint64_t v23 = v39;
  *(void *)&v39[v38] = v22;

  v41.id receiver = v23;
  v41.super_class = ObjectType;
  return objc_msgSendSuper2(&v41, sel_init);
}

id ElectricityRatesIntent.__allocating_init(homeIdentifier:)()
{
  id v1 = objc_msgSend(objc_allocWithZone(v0), sel_init);
  swift_retain();
  sub_2573213D8();

  swift_release();
  return v1;
}

id ElectricityRatesIntent.__deallocating_deinit()
{
  v2.id receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_257320F0C()
{
  return sub_2573212D8(&qword_269FE5C18);
}

uint64_t type metadata accessor for ElectricityRatesIntent()
{
  return self;
}

uint64_t sub_257320F64()
{
  return sub_2573212D8(&qword_269FE5C20);
}

uint64_t sub_257320F98()
{
  return sub_2573212D8((unint64_t *)&unk_269FE5C28);
}

uint64_t sub_257320FCC()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_257321084@<X0>(uint64_t a1@<X8>)
{
  if (qword_269FE5338 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_2573214C8();
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)qword_269FE5BD8);
  swift_beginAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t sub_257321144(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  uint64_t v5 = sub_2573212D8(&qword_269FE5C38);
  *uint64_t v4 = v2;
  v4[1] = sub_2573018C8;
  return MEMORY[0x270EE1CC8](a2, v5);
}

uint64_t sub_25732120C()
{
  uint64_t v1 = sub_2573212D8(&qword_269FE5C18);

  return MEMORY[0x270EE0D28](v0, v1);
}

double sub_257321258@<D0>(_OWORD *a1@<X8>)
{
  return sub_257300D3C(a1);
}

uint64_t sub_257321278()
{
  return sub_257300D90();
}

double sub_257321298@<D0>(_OWORD *a1@<X8>)
{
  return sub_257300D3C(a1);
}

uint64_t sub_2573212B8()
{
  return sub_257300D90();
}

uint64_t sub_2573212D8(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for ElectricityRatesIntent();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_257321338()
{
  return MEMORY[0x270EE0C80]();
}

uint64_t sub_257321358()
{
  return MEMORY[0x270EE0CC0]();
}

uint64_t sub_257321398()
{
  return MEMORY[0x270EE0E88]();
}

uint64_t sub_2573213A8()
{
  return MEMORY[0x270EE0FB0]();
}

uint64_t sub_2573213B8()
{
  return MEMORY[0x270EE11C0]();
}

uint64_t sub_2573213C8()
{
  return MEMORY[0x270EE11D8]();
}

uint64_t sub_2573213D8()
{
  return MEMORY[0x270EE11E0]();
}

uint64_t sub_2573213E8()
{
  return MEMORY[0x270EE11F8]();
}

uint64_t sub_2573213F8()
{
  return MEMORY[0x270EE1250]();
}

uint64_t sub_257321408()
{
  return MEMORY[0x270EE1300]();
}

uint64_t sub_257321418()
{
  return MEMORY[0x270EE1308]();
}

uint64_t sub_257321428()
{
  return MEMORY[0x270EE1578]();
}

uint64_t sub_257321438()
{
  return MEMORY[0x270EE1588]();
}

uint64_t sub_257321448()
{
  return MEMORY[0x270EE18A0]();
}

uint64_t sub_257321458()
{
  return MEMORY[0x270EE1958]();
}

uint64_t sub_257321468()
{
  return MEMORY[0x270EE1B80]();
}

uint64_t sub_257321488()
{
  return MEMORY[0x270EE1C48]();
}

uint64_t sub_2573214B8()
{
  return MEMORY[0x270EEF868]();
}

uint64_t sub_2573214C8()
{
  return MEMORY[0x270EEF8C0]();
}

uint64_t sub_2573214D8()
{
  return MEMORY[0x270EF0790]();
}

uint64_t sub_2573214E8()
{
  return MEMORY[0x270EF07E0]();
}

uint64_t sub_2573214F8()
{
  return MEMORY[0x270EF07E8]();
}

uint64_t sub_257321508()
{
  return MEMORY[0x270EF07F8]();
}

uint64_t sub_257321518()
{
  return MEMORY[0x270EF0808]();
}

uint64_t sub_257321528()
{
  return MEMORY[0x270EF0820]();
}

uint64_t sub_257321538()
{
  return MEMORY[0x270EF0840]();
}

uint64_t sub_257321548()
{
  return MEMORY[0x270EF0890]();
}

uint64_t sub_257321558()
{
  return MEMORY[0x270EF0BA8]();
}

uint64_t sub_257321568()
{
  return MEMORY[0x270EF0BB8]();
}

uint64_t sub_257321578()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_257321588()
{
  return MEMORY[0x270EF0C68]();
}

uint64_t sub_257321598()
{
  return MEMORY[0x270EF0CB8]();
}

uint64_t sub_2573215A8()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_2573215B8()
{
  return MEMORY[0x270EF0EE0]();
}

uint64_t sub_2573215C8()
{
  return MEMORY[0x270EF0F40]();
}

uint64_t sub_2573215D8()
{
  return MEMORY[0x270EF0F58]();
}

uint64_t sub_2573215E8()
{
  return MEMORY[0x270EF0F70]();
}

uint64_t sub_2573215F8()
{
  return MEMORY[0x270EF0F90]();
}

uint64_t sub_257321608()
{
  return MEMORY[0x270EF0FA0]();
}

uint64_t sub_257321618()
{
  return MEMORY[0x270EF10A8]();
}

uint64_t sub_257321628()
{
  return MEMORY[0x270EF15A8]();
}

uint64_t sub_257321638()
{
  return MEMORY[0x270EF1608]();
}

uint64_t sub_257321648()
{
  return MEMORY[0x270F28690]();
}

uint64_t sub_257321658()
{
  return MEMORY[0x270F3A620]();
}

uint64_t sub_257321668()
{
  return MEMORY[0x270F3A640]();
}

uint64_t sub_257321678()
{
  return MEMORY[0x270F3A658]();
}

uint64_t sub_257321688()
{
  return MEMORY[0x270F3A668]();
}

uint64_t sub_257321698()
{
  return MEMORY[0x270F3B328]();
}

uint64_t sub_2573216A8()
{
  return MEMORY[0x270F3B338]();
}

uint64_t sub_2573216B8()
{
  return MEMORY[0x270F3B498]();
}

uint64_t sub_2573216C8()
{
  return MEMORY[0x270F3BE30]();
}

uint64_t sub_2573216D8()
{
  return MEMORY[0x270F3BE40]();
}

uint64_t sub_2573216E8()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_2573216F8()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_257321708()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_257321718()
{
  return MEMORY[0x270F043A8]();
}

uint64_t sub_257321728()
{
  return MEMORY[0x270F04498]();
}

uint64_t _sSo11HMActionSetC15NanoHomeIntentsE15backupTintColor7SwiftUI0H0Vvg_0()
{
  return MEMORY[0x270F044C0]();
}

uint64_t sub_257321748()
{
  return MEMORY[0x270F04570]();
}

uint64_t sub_257321758()
{
  return MEMORY[0x270F045A8]();
}

uint64_t sub_257321778()
{
  return MEMORY[0x270F27010]();
}

uint64_t sub_257321788()
{
  return MEMORY[0x270F27068]();
}

uint64_t sub_257321798()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_2573217A8()
{
  return MEMORY[0x270EF1840]();
}

uint64_t sub_2573217B8()
{
  return MEMORY[0x270F9D318]();
}

uint64_t sub_2573217C8()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_2573217D8()
{
  return MEMORY[0x270EE1EF0]();
}

uint64_t sub_2573217E8()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_2573217F8()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_257321808()
{
  return MEMORY[0x270EF1A50]();
}

uint64_t sub_257321818()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_257321828()
{
  return MEMORY[0x270F3C088]();
}

uint64_t sub_257321838()
{
  return MEMORY[0x270F9D648]();
}

uint64_t sub_257321848()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_257321858()
{
  return MEMORY[0x270F9D740]();
}

uint64_t sub_257321868()
{
  return MEMORY[0x270F9D760]();
}

uint64_t sub_257321878()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_257321888()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_257321898()
{
  return MEMORY[0x270F9D878]();
}

uint64_t sub_2573218B8()
{
  return MEMORY[0x270F9DA70]();
}

uint64_t sub_2573218C8()
{
  return MEMORY[0x270F9DBA0]();
}

uint64_t sub_2573218D8()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_2573218E8()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_2573218F8()
{
  return MEMORY[0x270F9DBF0]();
}

uint64_t sub_257321908()
{
  return MEMORY[0x270F9DC50]();
}

uint64_t sub_257321918()
{
  return MEMORY[0x270EE1F10]();
}

uint64_t sub_257321928()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_257321938()
{
  return MEMORY[0x270FA1E20]();
}

uint64_t sub_257321948()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_257321958()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_257321968()
{
  return MEMORY[0x270EF1CC0]();
}

uint64_t sub_257321978()
{
  return MEMORY[0x270F9DF80]();
}

uint64_t sub_257321988()
{
  return MEMORY[0x270EE5820]();
}

uint64_t sub_257321998()
{
  return MEMORY[0x270F3C0E8]();
}

uint64_t sub_2573219A8()
{
  return MEMORY[0x270F3C0F8]();
}

uint64_t sub_2573219B8()
{
  return MEMORY[0x270FA2E40]();
}

uint64_t sub_2573219C8()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_2573219D8()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_2573219E8()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_2573219F8()
{
  return MEMORY[0x270F3C158]();
}

uint64_t sub_257321A08()
{
  return MEMORY[0x270F05438]();
}

uint64_t sub_257321A18()
{
  return MEMORY[0x270FA1180]();
}

uint64_t sub_257321A28()
{
  return MEMORY[0x270F3C160]();
}

uint64_t sub_257321A38()
{
  return MEMORY[0x270F3C170]();
}

uint64_t sub_257321A48()
{
  return MEMORY[0x270F3C180]();
}

uint64_t sub_257321A58()
{
  return MEMORY[0x270F3C188]();
}

uint64_t sub_257321A68()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_257321A78()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_257321A88()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_257321A98()
{
  return MEMORY[0x270F9E818]();
}

uint64_t sub_257321AA8()
{
  return MEMORY[0x270F9E848]();
}

uint64_t sub_257321AB8()
{
  return MEMORY[0x270F9E870]();
}

uint64_t sub_257321AC8()
{
  return MEMORY[0x270F9E8C0]();
}

uint64_t sub_257321AD8()
{
  return MEMORY[0x270F9E8C8]();
}

uint64_t sub_257321AE8()
{
  return MEMORY[0x270F9E8E8]();
}

uint64_t sub_257321AF8()
{
  return MEMORY[0x270F9E958]();
}

uint64_t sub_257321B08()
{
  return MEMORY[0x270F9E960]();
}

uint64_t sub_257321B18()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_257321B28()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_257321B38()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_257321B48()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_257321B58()
{
  return MEMORY[0x270F9EB98]();
}

uint64_t sub_257321B68()
{
  return MEMORY[0x270F9EBC0]();
}

uint64_t sub_257321B78()
{
  return MEMORY[0x270F9EC08]();
}

uint64_t sub_257321B88()
{
  return MEMORY[0x270F9EC10]();
}

uint64_t sub_257321B98()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_257321BA8()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_257321BB8()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_257321BC8()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_257321BD8()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_257321BE8()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_257321BF8()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_257321C18()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_257321C28()
{
  return MEMORY[0x270F9FB10]();
}

uint64_t sub_257321C38()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_257321C48()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_257321C58()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_257321C68()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t HFForceRemoteAccessStateAvailable()
{
  return MEMORY[0x270F3A0F8]();
}

uint64_t HMStringFromHomeLocation()
{
  return MEMORY[0x270EF3D80]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_release(const void *aBlock)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x270FA0160]();
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void free(void *a1)
{
}

uint64_t lroundf(float a1)
{
  return MEMORY[0x270EDA110](a1);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x270EDA328](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x270EDA378](ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

void objc_storeStrong(id *location, id obj)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x270FA01C0]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x270FA01C8]();
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

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x270FA0228]();
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

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x270FA0288]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x270FA02C0]();
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

uint64_t swift_getOpaqueTypeConformance2()
{
  return MEMORY[0x270FA03F0]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x270FA0400]();
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

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x270FA0488]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x270FA04C8]();
}

uint64_t swift_once()
{
  return MEMORY[0x270FA04F0]();
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

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x270FA0628]();
}