uint64_t destroy for WBSLocalizedStringLiteral()
{
  return swift_bridgeObjectRelease();
}

SafariCore::WBSLocalizedStringLiteral __swiftcall WBSLocalizedStringLiteral.init(stringLiteral:)(SafariCore::WBSLocalizedStringLiteral stringLiteral)
{
  SafariCore::WBSLocalizedStringLiteral *v1 = stringLiteral;
  return stringLiteral;
}

ValueMetadata *type metadata accessor for WBSLocalizedStringLiteral()
{
  return &type metadata for WBSLocalizedStringLiteral;
}

uint64_t sub_1B72925FC(uint64_t a1, char a2)
{
  v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB5B5C18);
  uint64_t result = sub_1B7384490();
  uint64_t v7 = result;
  if (*(void *)(v5 + 16))
  {
    int64_t v8 = 0;
    v9 = (uint64_t *)(v5 + 64);
    uint64_t v10 = 1 << *(unsigned char *)(v5 + 32);
    uint64_t v32 = -1 << v10;
    if (v10 < 64) {
      uint64_t v11 = ~(-1 << v10);
    }
    else {
      uint64_t v11 = -1;
    }
    unint64_t v12 = v11 & *(void *)(v5 + 64);
    uint64_t v33 = 1 << *(unsigned char *)(v5 + 32);
    v34 = v3;
    int64_t v35 = (unint64_t)(v10 + 63) >> 6;
    uint64_t v13 = result + 64;
    while (1)
    {
      if (v12)
      {
        unint64_t v19 = __clz(__rbit64(v12));
        v12 &= v12 - 1;
        unint64_t v20 = v19 | (v8 << 6);
      }
      else
      {
        int64_t v21 = v8 + 1;
        if (__OFADD__(v8, 1))
        {
LABEL_41:
          __break(1u);
LABEL_42:
          __break(1u);
          return result;
        }
        if (v21 >= v35) {
          goto LABEL_33;
        }
        unint64_t v22 = v9[v21];
        ++v8;
        if (!v22)
        {
          int64_t v8 = v21 + 1;
          if (v21 + 1 >= v35) {
            goto LABEL_33;
          }
          unint64_t v22 = v9[v8];
          if (!v22)
          {
            int64_t v23 = v21 + 2;
            if (v23 >= v35)
            {
LABEL_33:
              if ((a2 & 1) == 0)
              {
                uint64_t result = swift_release();
                v3 = v34;
                goto LABEL_40;
              }
              if (v33 >= 64) {
                bzero((void *)(v5 + 64), 8 * v35);
              }
              else {
                uint64_t *v9 = v32;
              }
              v3 = v34;
              *(void *)(v5 + 16) = 0;
              break;
            }
            unint64_t v22 = v9[v23];
            if (!v22)
            {
              while (1)
              {
                int64_t v8 = v23 + 1;
                if (__OFADD__(v23, 1)) {
                  goto LABEL_42;
                }
                if (v8 >= v35) {
                  goto LABEL_33;
                }
                unint64_t v22 = v9[v8];
                ++v23;
                if (v22) {
                  goto LABEL_30;
                }
              }
            }
            int64_t v8 = v23;
          }
        }
LABEL_30:
        unint64_t v12 = (v22 - 1) & v22;
        unint64_t v20 = __clz(__rbit64(v22)) + (v8 << 6);
      }
      uint64_t v28 = 8 * v20;
      uint64_t v29 = *(void *)(*(void *)(v5 + 48) + v28);
      v30 = *(void **)(*(void *)(v5 + 56) + v28);
      if ((a2 & 1) == 0) {
        id v31 = v30;
      }
      uint64_t result = sub_1B7384610();
      uint64_t v14 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v15 = result & ~v14;
      unint64_t v16 = v15 >> 6;
      if (((-1 << v15) & ~*(void *)(v13 + 8 * (v15 >> 6))) != 0)
      {
        unint64_t v17 = __clz(__rbit64((-1 << v15) & ~*(void *)(v13 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v24 = 0;
        unint64_t v25 = (unint64_t)(63 - v14) >> 6;
        do
        {
          if (++v16 == v25 && (v24 & 1) != 0)
          {
            __break(1u);
            goto LABEL_41;
          }
          BOOL v26 = v16 == v25;
          if (v16 == v25) {
            unint64_t v16 = 0;
          }
          v24 |= v26;
          uint64_t v27 = *(void *)(v13 + 8 * v16);
        }
        while (v27 == -1);
        unint64_t v17 = __clz(__rbit64(~v27)) + (v16 << 6);
      }
      *(void *)(v13 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
      uint64_t v18 = 8 * v17;
      *(void *)(*(void *)(v7 + 48) + v18) = v29;
      *(void *)(*(void *)(v7 + 56) + v18) = v30;
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
LABEL_40:
  uint64_t *v3 = v7;
  return result;
}

uint64_t sub_1B72928DC()
{
  uint64_t v0 = sub_1B7383E40();
  __swift_allocate_value_buffer(v0, qword_1E9E5B9C0);
  __swift_project_value_buffer(v0, (uint64_t)qword_1E9E5B9C0);
  return sub_1B7383E20();
}

uint64_t sub_1B7292958()
{
  uint64_t result = sub_1B7383D30();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_1B7292A1C@<X0>(void *a1@<X1>, uint64_t (*a2)(void)@<X2>, uint64_t *a3@<X8>)
{
  uint64_t v5 = a2();
  id v6 = a1;
  uint64_t v7 = sub_1B7292A9C(v5);

  uint64_t result = swift_bridgeObjectRelease();
  *a3 = v7;
  return result;
}

uint64_t sub_1B7292A9C(uint64_t a1)
{
  int64_t v1 = *(void *)(a1 + 16);
  uint64_t v2 = MEMORY[0x1E4FBC860];
  if (v1)
  {
    uint64_t v11 = MEMORY[0x1E4FBC860];
    sub_1B7372F0C(0, v1, 0);
    uint64_t v2 = v11;
    uint64_t v4 = *(void *)(type metadata accessor for WBSKeychainPasskey() - 8);
    uint64_t v5 = (void *)(a1 + ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80)));
    uint64_t v6 = *(void *)(v4 + 72);
    do
    {
      uint64_t v7 = sub_1B735BA0C(v5);
      unint64_t v9 = *(void *)(v11 + 16);
      unint64_t v8 = *(void *)(v11 + 24);
      if (v9 >= v8 >> 1) {
        sub_1B7372F0C(v8 > 1, v9 + 1, 1);
      }
      *(void *)(v11 + 16) = v9 + 1;
      *(void *)(v11 + 8 * v9 + 32) = v7;
      uint64_t v5 = (void *)((char *)v5 + v6);
      --v1;
    }
    while (v1);
  }
  return v2;
}

void *sub_1B7292C50()
{
  result[1] = *(CFTypeRef *)MEMORY[0x1E4F143B8];
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9E592F8);
  MEMORY[0x1F4188790](v0 - 8);
  uint64_t v2 = (char *)&v52 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = type metadata accessor for WBSKeychainPasskey();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = MEMORY[0x1F4188790](v3);
  uint64_t v55 = (uint64_t)&v52 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = MEMORY[0x1F4188790](v5);
  unint64_t v9 = (char *)&v52 - v8;
  uint64_t v10 = MEMORY[0x1F4188790](v7);
  uint64_t v57 = (uint64_t)&v52 - v11;
  MEMORY[0x1F4188790](v10);
  uint64_t v56 = (uint64_t)&v52 - v12;
  uint64_t v13 = sub_1B7383FC0();
  CFDictionaryRef v15 = (const __CFDictionary *)sub_1B7362D84(0, 0xF000000000000000, v13, v14, 0);
  swift_bridgeObjectRelease();
  result[0] = 0;
  OSStatus v16 = SecItemCopyMatching(v15, result);
  if (v16 == -25300)
  {
    if (qword_1E9E58F28 == -1) {
      goto LABEL_22;
    }
    goto LABEL_58;
  }
  OSStatus v17 = v16;
  if (v16)
  {
    if (qword_1E9E58F28 != -1) {
      swift_once();
    }
    uint64_t v35 = sub_1B7383E40();
    __swift_project_value_buffer(v35, (uint64_t)qword_1E9E5B9C0);
    uint64_t v27 = sub_1B7383E10();
    os_log_type_t v36 = sub_1B73841C0();
    if (!os_log_type_enabled(v27, v36)) {
      goto LABEL_56;
    }
    uint64_t v29 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v29 = 67240192;
    LODWORD(v59) = v17;
    sub_1B7384250();
    v30 = "Could not fetch passkeys: %{public}d";
    id v31 = v27;
    os_log_type_t v32 = v36;
    uint64_t v33 = v29;
    uint32_t v34 = 8;
    goto LABEL_28;
  }
  if (!result[0]
    || (v59 = result[0],
        swift_unknownObjectRetain(),
        __swift_instantiateConcreteTypeFromMangledName(&qword_1E9E59428),
        (swift_dynamicCast() & 1) == 0))
  {
    if (qword_1E9E58F28 != -1) {
      swift_once();
    }
    uint64_t v37 = sub_1B7383E40();
    __swift_project_value_buffer(v37, (uint64_t)qword_1E9E5B9C0);
    uint64_t v27 = sub_1B7383E10();
    os_log_type_t v38 = sub_1B73841C0();
    if (!os_log_type_enabled(v27, v38)) {
      goto LABEL_56;
    }
    uint64_t v29 = (uint8_t *)swift_slowAlloc();
    v39 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v29 = 138477827;
    swift_beginAccess();
    if (result[0])
    {
      swift_unknownObjectRetain();
      self;
      uint64_t v40 = swift_dynamicCastObjCClass();
      if (v40)
      {
        uint64_t v41 = v40;
        unint64_t v58 = v40;
        sub_1B7384250();
LABEL_54:
        void *v39 = v41;
        _os_log_impl(&dword_1B728F000, v27, v38, "Unexpected keychain response: %{private}@", v29, 0xCu);
        __swift_instantiateConcreteTypeFromMangledName(&qword_1E9E59418);
        swift_arrayDestroy();
        MEMORY[0x1BA9BDB10](v39, -1, -1);
        goto LABEL_55;
      }
      swift_unknownObjectRelease();
    }
    unint64_t v58 = 0;
    sub_1B7384250();
    uint64_t v41 = 0;
    goto LABEL_54;
  }
  unint64_t v18 = v58;
  if (v58 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v19 = sub_1B7384470();
  }
  else
  {
    uint64_t v19 = *(void *)((v58 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
  }
  CFDictionaryRef v52 = v15;
  uint64_t v54 = v4;
  if (v19)
  {
    if (v19 < 1) {
      __break(1u);
    }
    uint64_t v20 = 0;
    int64_t v21 = (unsigned int (**)(char *, uint64_t, uint64_t))(v54 + 48);
    CFDictionaryRef v15 = (const __CFDictionary *)MEMORY[0x1E4FBC860];
    uint64_t v53 = v3;
    do
    {
      if ((v18 & 0xC000000000000001) != 0) {
        id v22 = (id)MEMORY[0x1BA9BBDA0](v20, v18);
      }
      else {
        id v22 = *(id *)(v18 + 8 * v20 + 32);
      }
      WBSKeychainPasskey.init(keychainDictionary:)(v22, (uint64_t)v2);
      if ((*v21)(v2, 1, v3) == 1)
      {
        sub_1B735B684((uint64_t)v2, &qword_1E9E592F8);
      }
      else
      {
        uint64_t v23 = v56;
        sub_1B7368DAC((uint64_t)v2, v56, (uint64_t (*)(void))type metadata accessor for WBSKeychainPasskey);
        sub_1B7368DAC(v23, v57, (uint64_t (*)(void))type metadata accessor for WBSKeychainPasskey);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          CFDictionaryRef v15 = (const __CFDictionary *)sub_1B736B548(0, *((void *)v15 + 2) + 1, 1, (unint64_t)v15);
        }
        unint64_t v25 = *((void *)v15 + 2);
        unint64_t v24 = *((void *)v15 + 3);
        if (v25 >= v24 >> 1) {
          CFDictionaryRef v15 = (const __CFDictionary *)sub_1B736B548(v24 > 1, v25 + 1, 1, (unint64_t)v15);
        }
        *((void *)v15 + 2) = v25 + 1;
        sub_1B7368DAC(v57, (uint64_t)v15+ ((*(unsigned __int8 *)(v54 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v54 + 80))+ *(void *)(v54 + 72) * v25, (uint64_t (*)(void))type metadata accessor for WBSKeychainPasskey);
        uint64_t v3 = v53;
      }
      ++v20;
    }
    while (v19 != v20);
  }
  else
  {
    CFDictionaryRef v15 = (const __CFDictionary *)MEMORY[0x1E4FBC860];
  }
  swift_bridgeObjectRelease_n();
  v59 = (void *)MEMORY[0x1E4FBC860];
  uint64_t v42 = *((void *)v15 + 2);
  uint64_t v43 = v54;
  if (!v42)
  {
LABEL_51:

    swift_bridgeObjectRelease();
    swift_unknownObjectRelease();
    return v59;
  }
  unint64_t v44 = 0;
  uint64_t v57 = *((void *)v15 + 2);
  while (v44 < *((void *)v15 + 2))
  {
    unint64_t v45 = (*(unsigned __int8 *)(v43 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v43 + 80);
    uint64_t v46 = *(void *)(v43 + 72);
    sub_1B7369598((uint64_t)v15 + v45 + v46 * v44, (uint64_t)v9);
    BOOL v47 = *((void *)v9 + 3) == 0x6F632E656C707061 && *((void *)v9 + 4) == 0xE90000000000006DLL;
    if (v47 || (sub_1B7384590() & 1) != 0)
    {
      sub_1B7368E14((uint64_t)v9, (uint64_t (*)(void))type metadata accessor for WBSKeychainPasskey);
    }
    else
    {
      sub_1B7368DAC((uint64_t)v9, v55, (uint64_t (*)(void))type metadata accessor for WBSKeychainPasskey);
      v48 = v59;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_1B7372ED0(0, v48[2] + 1, 1);
        uint64_t v42 = v57;
        v48 = v59;
      }
      unint64_t v50 = v48[2];
      unint64_t v49 = v48[3];
      if (v50 >= v49 >> 1)
      {
        sub_1B7372ED0(v49 > 1, v50 + 1, 1);
        uint64_t v42 = v57;
        v48 = v59;
      }
      v48[2] = v50 + 1;
      sub_1B7368DAC(v55, (uint64_t)v48 + v45 + v50 * v46, (uint64_t (*)(void))type metadata accessor for WBSKeychainPasskey);
    }
    if (v42 == ++v44) {
      goto LABEL_51;
    }
  }
  __break(1u);
LABEL_58:
  swift_once();
LABEL_22:
  uint64_t v26 = sub_1B7383E40();
  __swift_project_value_buffer(v26, (uint64_t)qword_1E9E5B9C0);
  uint64_t v27 = sub_1B7383E10();
  os_log_type_t v28 = sub_1B73841E0();
  if (os_log_type_enabled(v27, v28))
  {
    uint64_t v29 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v29 = 0;
    v30 = "No passkeys found.";
    id v31 = v27;
    os_log_type_t v32 = v28;
    uint64_t v33 = v29;
    uint32_t v34 = 2;
LABEL_28:
    _os_log_impl(&dword_1B728F000, v31, v32, v30, v33, v34);
LABEL_55:
    MEMORY[0x1BA9BDB10](v29, -1, -1);
  }
LABEL_56:

  swift_unknownObjectRelease();
  return (void *)MEMORY[0x1E4FBC860];
}

unint64_t sub_1B729351C()
{
  result[1] = *(CFTypeRef *)MEMORY[0x1E4F143B8];
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9E592F8);
  MEMORY[0x1F4188790](v0 - 8);
  uint64_t v2 = (char *)&v36 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = type metadata accessor for WBSKeychainPasskey();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = MEMORY[0x1F4188790](v3);
  uint64_t v7 = (char *)&v36 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v5);
  unint64_t v9 = (char *)&v36 - v8;
  uint64_t v10 = sub_1B7383FC0();
  CFDictionaryRef v12 = (const __CFDictionary *)sub_1B7362D84(0, 0xF000000000000000, v10, v11, 1);
  swift_bridgeObjectRelease();
  result[0] = 0;
  OSStatus v13 = SecItemCopyMatching(v12, result);
  if (!v13)
  {
    if (result[0])
    {
      CFTypeRef v41 = result[0];
      swift_unknownObjectRetain();
      __swift_instantiateConcreteTypeFromMangledName(&qword_1E9E59428);
      if (swift_dynamicCast())
      {
        unint64_t v20 = v40;
        unint64_t v38 = v40;
        CFDictionaryRef v36 = v12;
        if (v40 >> 62)
        {
          swift_bridgeObjectRetain();
          unint64_t v20 = v38;
          uint64_t v21 = sub_1B7384470();
          if (v21) {
            goto LABEL_10;
          }
        }
        else
        {
          uint64_t v21 = *(void *)((v40 & 0xFFFFFFFFFFFFFF8) + 0x10);
          swift_bridgeObjectRetain();
          if (v21)
          {
LABEL_10:
            uint64_t v39 = v4;
            if (v21 < 1) {
              __break(1u);
            }
            uint64_t v22 = 0;
            unint64_t v23 = v20 & 0xC000000000000001;
            unint64_t v24 = (unsigned int (**)(char *, uint64_t, uint64_t))(v39 + 48);
            unint64_t v25 = MEMORY[0x1E4FBC860];
            uint64_t v37 = v21;
            do
            {
              if (v23) {
                id v26 = (id)MEMORY[0x1BA9BBDA0](v22, v20);
              }
              else {
                id v26 = *(id *)(v20 + 8 * v22 + 32);
              }
              WBSKeychainPasskey.init(keychainDictionary:)(v26, (uint64_t)v2);
              if ((*v24)(v2, 1, v3) == 1)
              {
                sub_1B735B684((uint64_t)v2, &qword_1E9E592F8);
              }
              else
              {
                sub_1B7368DAC((uint64_t)v2, (uint64_t)v9, (uint64_t (*)(void))type metadata accessor for WBSKeychainPasskey);
                sub_1B7368DAC((uint64_t)v9, (uint64_t)v7, (uint64_t (*)(void))type metadata accessor for WBSKeychainPasskey);
                if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
                  unint64_t v25 = sub_1B736B548(0, *(void *)(v25 + 16) + 1, 1, v25);
                }
                unint64_t v28 = *(void *)(v25 + 16);
                unint64_t v27 = *(void *)(v25 + 24);
                if (v28 >= v27 >> 1) {
                  unint64_t v25 = sub_1B736B548(v27 > 1, v28 + 1, 1, v25);
                }
                *(void *)(v25 + 16) = v28 + 1;
                sub_1B7368DAC((uint64_t)v7, v25+ ((*(unsigned __int8 *)(v39 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v39 + 80))+ *(void *)(v39 + 72) * v28, (uint64_t (*)(void))type metadata accessor for WBSKeychainPasskey);
                uint64_t v21 = v37;
                unint64_t v20 = v38;
              }
              ++v22;
            }
            while (v21 != v22);
            goto LABEL_37;
          }
        }
        unint64_t v25 = MEMORY[0x1E4FBC860];
LABEL_37:

        swift_bridgeObjectRelease_n();
        swift_unknownObjectRelease();
        return v25;
      }
    }
    if (qword_1E9E58F28 != -1) {
      swift_once();
    }
    uint64_t v29 = sub_1B7383E40();
    __swift_project_value_buffer(v29, (uint64_t)qword_1E9E5B9C0);
    OSStatus v16 = sub_1B7383E10();
    os_log_type_t v30 = sub_1B73841C0();
    if (!os_log_type_enabled(v16, v30)) {
      goto LABEL_33;
    }
    id v31 = (uint8_t *)swift_slowAlloc();
    os_log_type_t v32 = (void *)swift_slowAlloc();
    *(_DWORD *)id v31 = 138477827;
    swift_beginAccess();
    if (result[0])
    {
      swift_unknownObjectRetain();
      self;
      uint64_t v33 = swift_dynamicCastObjCClass();
      if (v33)
      {
        uint64_t v34 = v33;
        unint64_t v40 = v33;
        sub_1B7384250();
LABEL_31:
        *os_log_type_t v32 = v34;
        _os_log_impl(&dword_1B728F000, v16, v30, "Unexpected keychain response: %{private}@", v31, 0xCu);
        __swift_instantiateConcreteTypeFromMangledName(&qword_1E9E59418);
        swift_arrayDestroy();
        MEMORY[0x1BA9BDB10](v32, -1, -1);
        uint64_t v19 = v31;
        goto LABEL_32;
      }
      swift_unknownObjectRelease();
    }
    unint64_t v40 = 0;
    sub_1B7384250();
    uint64_t v34 = 0;
    goto LABEL_31;
  }
  OSStatus v14 = v13;
  if (qword_1E9E58F28 != -1) {
    swift_once();
  }
  uint64_t v15 = sub_1B7383E40();
  __swift_project_value_buffer(v15, (uint64_t)qword_1E9E5B9C0);
  OSStatus v16 = sub_1B7383E10();
  os_log_type_t v17 = sub_1B73841C0();
  if (!os_log_type_enabled(v16, v17)) {
    goto LABEL_33;
  }
  unint64_t v18 = (uint8_t *)swift_slowAlloc();
  *(_DWORD *)unint64_t v18 = 67240192;
  LODWORD(v41) = v14;
  sub_1B7384250();
  _os_log_impl(&dword_1B728F000, v16, v17, "Could not fetch passkeys: %{public}d", v18, 8u);
  uint64_t v19 = v18;
LABEL_32:
  MEMORY[0x1BA9BDB10](v19, -1, -1);
LABEL_33:

  swift_unknownObjectRelease();
  return MEMORY[0x1E4FBC860];
}

void __WBSMakeAccessibilityIdentifier_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = [MEMORY[0x1E4F290C8] queryItemWithName:a2 value:a3];
  [v3 addObject:v4];
}

void sub_1B72942D4(uint64_t a1, uint64_t a2, char a3)
{
  id v4 = v3;
  uint64_t v8 = *v3;
  unint64_t v10 = sub_1B729496C(a2);
  uint64_t v11 = *(void *)(v8 + 16);
  BOOL v12 = (v9 & 1) == 0;
  uint64_t v13 = v11 + v12;
  if (__OFADD__(v11, v12))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  char v14 = v9;
  uint64_t v15 = *(void *)(v8 + 24);
  if (v15 >= v13 && (a3 & 1) != 0) {
    goto LABEL_7;
  }
  if (v15 >= v13 && (a3 & 1) == 0)
  {
    sub_1B7358D08();
LABEL_7:
    OSStatus v16 = (void *)*v4;
    if (v14)
    {
LABEL_8:
      uint64_t v17 = v16[7];

      *(void *)(v17 + 8 * v10) = a1;
      return;
    }
LABEL_11:
    v16[(v10 >> 6) + 8] |= 1 << v10;
    uint64_t v20 = 8 * v10;
    *(void *)(v16[6] + v20) = a2;
    *(void *)(v16[7] + v20) = a1;
    uint64_t v21 = v16[2];
    BOOL v22 = __OFADD__(v21, 1);
    uint64_t v23 = v21 + 1;
    if (!v22)
    {
      v16[2] = v23;
      return;
    }
    goto LABEL_14;
  }
  sub_1B72925FC(v13, a3 & 1);
  unint64_t v18 = sub_1B729496C(a2);
  if ((v14 & 1) == (v19 & 1))
  {
    unint64_t v10 = v18;
    OSStatus v16 = (void *)*v4;
    if (v14) {
      goto LABEL_8;
    }
    goto LABEL_11;
  }
LABEL_15:
  sub_1B73845C0();
  __break(1u);
}

uint64_t WBSLookUpLocalizedString(_:key:dsohandle:)()
{
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v0 = sub_1B72944F4();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t WBSLookUpLocalizedString(_:dsohandle:)()
{
  swift_bridgeObjectRetain();
  uint64_t v0 = sub_1B72944F4();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_1B72944F4()
{
  unint64_t v1 = v0[3];
  uint64_t v2 = v0[4];
  if (v1)
  {
    uint64_t v3 = v0[2];
  }
  else
  {
    uint64_t v3 = *v0;
    unint64_t v1 = v0[1];
  }
  swift_bridgeObjectRetain();
  id v4 = sub_1B7294834(v2);
  unint64_t v5 = 0x80000001B73A7F10;
  if (!v4)
  {
    uint64_t v10 = 0xD00000000000001ALL;
LABEL_8:
    if (v5 == 0x80000001B73A7F10) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  uint64_t v6 = v4;
  uint64_t v7 = (void *)sub_1B7383FA0();
  uint64_t v8 = (void *)sub_1B7383FA0();
  id v9 = objc_msgSend(v6, sel_localizedStringForKey_value_table_, v7, v8, 0);

  uint64_t v10 = sub_1B7383FC0();
  unint64_t v5 = v11;

  if (v10 == 0xD00000000000001ALL) {
    goto LABEL_8;
  }
LABEL_9:
  if ((sub_1B7384590() & 1) == 0)
  {
    swift_bridgeObjectRelease();
    return v10;
  }
LABEL_10:
  uint64_t v12 = sub_1B7383E40();
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x1F4188790]();
  uint64_t v15 = (char *)&v24 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B7383E30();
  swift_bridgeObjectRetain();
  OSStatus v16 = sub_1B7383E10();
  os_log_type_t v17 = sub_1B73841C0();
  if (os_log_type_enabled(v16, v17))
  {
    uint64_t v26 = v13;
    uint64_t v18 = swift_slowAlloc();
    uint64_t v25 = v12;
    char v19 = (uint8_t *)v18;
    uint64_t v20 = swift_slowAlloc();
    uint64_t v24 = (uint64_t)&v24;
    uint64_t v21 = v3;
    uint64_t v22 = v20;
    uint64_t v29 = v20;
    uint64_t v27 = v10;
    *(_DWORD *)char v19 = 136315138;
    swift_bridgeObjectRetain();
    uint64_t v28 = sub_1B7367544(v21, v1, &v29);
    uint64_t v10 = v27;
    sub_1B7384250();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_1B728F000, v16, v17, "Failed to look up localized string key: %s", v19, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1BA9BDB10](v22, -1, -1);
    MEMORY[0x1BA9BDB10](v19, -1, -1);

    (*(void (**)(char *, uint64_t))(v26 + 8))(v15, v25);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
  }
  return v10;
}

id sub_1B7294834(uint64_t a1)
{
  if (qword_1EB5B5C10 != -1) {
    swift_once();
  }
  swift_beginAccess();
  uint64_t v2 = off_1EB5B5C20;
  if (*((void *)off_1EB5B5C20 + 2) && (unint64_t v3 = sub_1B729496C(a1), (v4 & 1) != 0))
  {
    id v5 = *(id *)(v2[7] + 8 * v3);
    swift_endAccess();
    id v6 = v5;
  }
  else
  {
    swift_endAccess();
    id v5 = _WBSGetLocalizableBundleFromAddress();
    if (v5)
    {
      swift_beginAccess();
      id v7 = v5;
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v10 = off_1EB5B5C20;
      off_1EB5B5C20 = (_UNKNOWN *)0x8000000000000000;
      sub_1B72942D4((uint64_t)v7, a1, isUniquelyReferenced_nonNull_native);
      off_1EB5B5C20 = v10;
      swift_bridgeObjectRelease();
      swift_endAccess();
    }
  }
  return v5;
}

unint64_t sub_1B729496C(uint64_t a1)
{
  uint64_t v2 = sub_1B7384610();
  return sub_1B72949B0(a1, v2);
}

unint64_t sub_1B72949B0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = v2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t result = a2 & ~v5;
  if ((*(void *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result))
  {
    uint64_t v7 = *(void *)(v2 + 48);
    if (*(void *)(v7 + 8 * result) != a1)
    {
      uint64_t v8 = ~v5;
      for (unint64_t result = (result + 1) & v8;
            ((*(void *)(v4 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result) & 1) != 0;
            unint64_t result = (result + 1) & v8)
      {
        if (*(void *)(v7 + 8 * result) == a1) {
          break;
        }
      }
    }
  }
  return result;
}

void sub_1B729577C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B7295CC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B7295E24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id WBSMakeAccessibilityIdentifier(void *a1, void *a2)
{
  unint64_t v3 = (void *)MEMORY[0x1E4F1CA48];
  id v4 = a2;
  id v5 = a1;
  id v6 = [v3 array];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __WBSMakeAccessibilityIdentifier_block_invoke;
  v11[3] = &unk_1E61595C0;
  id v12 = v6;
  id v7 = v6;
  [v4 enumerateKeysAndObjectsUsingBlock:v11];

  id v8 = objc_alloc_init(MEMORY[0x1E4F29088]);
  [v8 setPath:v5];

  [v8 setQueryItems:v7];
  id v9 = [v8 string];

  return v9;
}

void sub_1B7296C2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_1B7296D40(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B7296FB0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t SafariShared::WBSSQLiteDatabaseEnumerate<std::tuple<std::__ignore_t<unsigned char> const&>>(void *a1, uint64_t a2, void *a3)
{
  id v5 = a1;
  id v6 = a3;
  id v7 = [[WBSSQLiteStatement alloc] initWithDatabase:v5 query:v6 error:a2];
  id v8 = v7;
  if (v7)
  {
    uint64_t v9 = SafariShared::_WBSSQLiteStatementBindOrStep<0,0,std::tuple<std::tuple<std::__ignore_t<unsigned char> const&>>>(v5, [(WBSSQLiteStatement *)v7 handle], a2);
    [(WBSSQLiteStatement *)v8 invalidate];
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

void sub_1B72970D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B72971AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, objc_super a10)
{
  a10.super_class = (Class)WBSSQLiteStatement;
  [(_Unwind_Exception *)&a10 dealloc];
  _Unwind_Resume(a1);
}

void sub_1B7297280(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B7297318(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B7297414(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B729751C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B7297594(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t SafariShared::_WBSSQLiteStatementBindOrStep<0,0,std::tuple<std::tuple<std::__ignore_t<unsigned char> const&>>>(void *a1, sqlite3_stmt *a2, uint64_t a3)
{
  id v5 = a1;
  uint64_t v6 = sqlite3_step(a2);
  if (v6 == 100 && (uint64_t v6 = sqlite3_step(a2), v6 == 101))
  {
    uint64_t v7 = 1;
  }
  else
  {
    [v5 reportErrorWithCode:v6 statement:a2 error:a3];
    uint64_t v7 = 0;
  }

  return v7;
}

void sub_1B7297640(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B7297788(_Unwind_Exception *a1)
{
  id v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1B7297864(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id SafariShared::coalescedDisablerReasons(SafariShared *this)
{
  unint64_t v1 = [MEMORY[0x1E4F28BD0] set];
  {
    uint64_t v2 = (uint64_t *)SafariShared::coalescedDisablers(void)::set;
    if ((uint64_t *)SafariShared::coalescedDisablers(void)::set != &qword_1EB5B6030)
    {
      do
      {
        id v3 = *(id *)(v2[4] + 16);
        [v1 addObject:v3];

        id v4 = (uint64_t *)v2[1];
        if (v4)
        {
          do
          {
            id v5 = v4;
            id v4 = (uint64_t *)*v4;
          }
          while (v4);
        }
        else
        {
          do
          {
            id v5 = (uint64_t *)v2[2];
            BOOL v6 = *v5 == (void)v2;
            uint64_t v2 = v5;
          }
          while (!v6);
        }
        uint64_t v2 = v5;
      }
      while (v5 != &qword_1EB5B6030);
    }
  }
  else
  {
    qword_1EB5B6038 = 0;
    qword_1EB5B6030 = 0;
    SafariShared::coalescedDisablers(void)::set = (uint64_t)&qword_1EB5B6030;
  }
  return v1;
}

void sub_1B72981A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id _WBSLocalizedString(void *a1, dispatch_once_t *a2, id *a3)
{
  id v5 = a1;
  determineBundle(a2, (uint64_t)a3);
  BOOL v6 = [*a3 localizedStringForKey:v5 value:@"localized string not found" table:0];

  return v6;
}

void determineBundle(dispatch_once_t *a1, uint64_t a2)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __determineBundle_block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a2;
  if (*a1 != -1) {
    dispatch_once(a1, block);
  }
}

void SafariShared::SuddenTerminationDisabler::enableSuddenTerminationTask(SafariShared::SuddenTerminationDisabler *this)
{
  uint64_t v2 = SafariShared::coalescingBackgroundTaskAssertionQueue(this);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = ___ZN12SafariShared25SuddenTerminationDisabler27enableSuddenTerminationTaskEv_block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = this;
  dispatch_sync(v2, block);
}

void SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(id *this)
{
}

void sub_1B7299380(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void SafariShared::SuddenTerminationDisabler::enableSuddenTermination(SafariShared::SuddenTerminationDisabler *this)
{
  uint64_t v2 = SafariShared::sharedApplication(this);

  if (v2)
  {
    SafariShared::SuddenTerminationDisabler::enableSuddenTerminationTask(this);
  }
  else
  {
    SafariShared::SuddenTerminationDisabler::enableSuddenTerminationTransaction(this);
  }
}

SafariShared::SuddenTerminationDisabler *SafariShared::SuddenTerminationDisabler::SuddenTerminationDisabler(SafariShared::SuddenTerminationDisabler *this, NSString *a2)
{
  id v3 = a2;
  if (SafariShared::invalidTaskIdentifier(void)::once != -1) {
    dispatch_once(&SafariShared::invalidTaskIdentifier(void)::once, &__block_literal_global_10_1);
  }
  *(void *)this = SafariShared::invalidTaskIdentifier(void)::identifer;
  *((void *)this + 1) = 0;
  *((void *)this + 2) = v3;
  SafariShared::SuddenTerminationDisabler::disableSuddenTermination(this);
  return this;
}

void SafariShared::SuddenTerminationDisabler::disableSuddenTermination(SafariShared::SuddenTerminationDisabler *this)
{
  uint64_t v2 = SafariShared::sharedApplication(this);

  if (v2)
  {
    SafariShared::SuddenTerminationDisabler::disableSuddenTerminationTask(this);
  }
  else
  {
    SafariShared::SuddenTerminationDisabler::disableSuddenTerminationTransaction(this);
  }
}

void ___ZN12SafariShared25SuddenTerminationDisabler27enableSuddenTerminationTaskEv_block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(uint64_t **)(a1 + 32);
  uint64_t v2 = *v1;
  if (SafariShared::invalidTaskIdentifier(void)::once != -1) {
    dispatch_once(&SafariShared::invalidTaskIdentifier(void)::once, &__block_literal_global_10_1);
  }
  if (v2 != SafariShared::invalidTaskIdentifier(void)::identifer)
  {
    id v3 = WBS_LOG_CHANNEL_PREFIXSuddenTerminationDisabler();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = v1[2];
      *(_DWORD *)unint64_t v11 = 138543362;
      *(void *)&void v11[4] = v4;
      _os_log_impl(&dword_1B728F000, v3, OS_LOG_TYPE_DEFAULT, "Ending task assertion with reason %{public}@", v11, 0xCu);
    }
    if (SafariShared::invalidTaskIdentifier(void)::once != -1) {
      dispatch_once(&SafariShared::invalidTaskIdentifier(void)::once, &__block_literal_global_10_1);
    }
    uint64_t *v1 = SafariShared::invalidTaskIdentifier(void)::identifer;
    {
      qword_1EB5B6038 = 0;
      qword_1EB5B6030 = 0;
      SafariShared::coalescedDisablers(void)::set = (uint64_t)&qword_1EB5B6030;
    }
    *(void *)unint64_t v11 = v1;
    std::__tree<SafariShared::SuddenTerminationDisabler *>::__erase_unique<SafariShared::SuddenTerminationDisabler *>((uint64_t)&SafariShared::coalescedDisablers(void)::set, (unint64_t *)v11);
    {
      if (qword_1EB5B6038)
      {
        id v5 = (id)WBS_LOG_CHANNEL_PREFIXSuddenTerminationDisabler();
        BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
        if (v6)
        {
          uint64_t v7 = SafariShared::coalescedDisablerReasons((SafariShared *)v6);
          *(_DWORD *)unint64_t v11 = 138543362;
          *(void *)&void v11[4] = v7;
          _os_log_impl(&dword_1B728F000, v5, OS_LOG_TYPE_DEFAULT, "Continuing background task assertion with reasons %{public}@", v11, 0xCu);
        }
        return;
      }
    }
    else
    {
      qword_1EB5B6038 = 0;
      qword_1EB5B6030 = 0;
      SafariShared::coalescedDisablers(void)::set = (uint64_t)&qword_1EB5B6030;
    }
    id v8 = WBS_LOG_CHANNEL_PREFIXSuddenTerminationDisabler();
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    if (v9)
    {
      *(_WORD *)unint64_t v11 = 0;
      _os_log_impl(&dword_1B728F000, v8, OS_LOG_TYPE_DEFAULT, "Ending background task assertion", v11, 2u);
    }
    uint64_t v10 = SafariShared::sharedApplication((SafariShared *)v9);
    [v10 endBackgroundTask:SafariShared::coalescingBackgroundTaskIdentifier];

    if (SafariShared::invalidTaskIdentifier(void)::once != -1) {
      dispatch_once(&SafariShared::invalidTaskIdentifier(void)::once, &__block_literal_global_10_1);
    }
    SafariShared::coalescingBackgroundTaskIdentifier = SafariShared::invalidTaskIdentifier(void)::identifer;
  }
}

void sub_1B7299744(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void ___ZN12SafariShared25SuddenTerminationDisabler28disableSuddenTerminationTaskEv_block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = WBS_LOG_CHANNEL_PREFIXSuddenTerminationDisabler();
  BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    uint64_t v4 = v1[2];
    *(_DWORD *)uint64_t v18 = 138543362;
    *(void *)&v18[4] = v4;
    _os_log_impl(&dword_1B728F000, v2, OS_LOG_TYPE_DEFAULT, "Beginning new task assertion with reason: %{public}@", v18, 0xCu);
  }
  id v5 = SafariShared::sharedApplication((SafariShared *)v3);
  uint64_t v6 = [v5 beginBackgroundTaskWithName:@"com.apple.SafariShared.SuddenTerminationDisabler" expirationHandler:&__block_literal_global_66];

  if (SafariShared::invalidTaskIdentifier(void)::once != -1) {
    dispatch_once(&SafariShared::invalidTaskIdentifier(void)::once, &__block_literal_global_10_1);
  }
  if (v6 == SafariShared::invalidTaskIdentifier(void)::identifer)
  {
    BOOL v7 = SafariShared::coalescingBackgroundTaskIdentifier == SafariShared::invalidTaskIdentifier(void)::identifer;
    id v8 = WBS_LOG_CHANNEL_PREFIXSuddenTerminationDisabler();
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
    if (v7)
    {
      if (v9) {
        ___ZN12SafariShared25SuddenTerminationDisabler28disableSuddenTerminationTaskEv_block_invoke_cold_1(v8);
      }
    }
    else if (v9)
    {
      ___ZN12SafariShared25SuddenTerminationDisabler28disableSuddenTerminationTaskEv_block_invoke_cold_2(v8);
    }
  }
  else
  {
    uint64_t v10 = WBS_LOG_CHANNEL_PREFIXSuddenTerminationDisabler();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = v1[2];
      *(_DWORD *)uint64_t v18 = 138543362;
      *(void *)&v18[4] = v11;
      _os_log_impl(&dword_1B728F000, v10, OS_LOG_TYPE_DEFAULT, "Did begin task assertion with reason %{public}@", v18, 0xCu);
    }
    uint64_t v12 = SafariShared::coalescingBackgroundTaskIdentifier;
    if (SafariShared::invalidTaskIdentifier(void)::once != -1) {
      dispatch_once(&SafariShared::invalidTaskIdentifier(void)::once, &__block_literal_global_10_1);
    }
    if (v12 != SafariShared::invalidTaskIdentifier(void)::identifer)
    {
      uint64_t v13 = (id)WBS_LOG_CHANNEL_PREFIXSuddenTerminationDisabler();
      BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
      if (v14)
      {
        uint64_t v15 = SafariShared::coalescedDisablerReasons((SafariShared *)v14);
        *(_DWORD *)uint64_t v18 = 138543362;
        *(void *)&v18[4] = v15;
        _os_log_impl(&dword_1B728F000, v13, OS_LOG_TYPE_DEFAULT, "Interrupting previous coalesced task assertion to be replaced with existing reasons: %{public}@", v18, 0xCu);
      }
      os_log_type_t v17 = SafariShared::sharedApplication(v16);
      [v17 endBackgroundTask:SafariShared::coalescingBackgroundTaskIdentifier];
    }
    SafariShared::coalescingBackgroundTaskIdentifier = v6;
    {
      qword_1EB5B6038 = 0;
      qword_1EB5B6030 = 0;
      SafariShared::coalescedDisablers(void)::set = (uint64_t)&qword_1EB5B6030;
    }
    *(void *)uint64_t v18 = v1;
    std::__tree<SafariShared::SuddenTerminationDisabler *>::__emplace_unique_key_args<SafariShared::SuddenTerminationDisabler *,SafariShared::SuddenTerminationDisabler *>((uint64_t **)&SafariShared::coalescedDisablers(void)::set, (unint64_t *)v18, (uint64_t *)v18);
    void *v1 = SafariShared::coalescingBackgroundTaskIdentifier;
  }
}

void sub_1B7299A08(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t WBS_LOG_CHANNEL_PREFIXSuddenTerminationDisabler()
{
  if (WBS_LOG_CHANNEL_PREFIXSuddenTerminationDisabler_onceToken != -1) {
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXSuddenTerminationDisabler_onceToken, &__block_literal_global_49_0);
  }
  return WBS_LOG_CHANNEL_PREFIXSuddenTerminationDisabler_log;
}

id SafariShared::sharedApplication(SafariShared *this)
{
  if (SafariShared::sharedApplication(void)::once != -1) {
    dispatch_once(&SafariShared::sharedApplication(void)::once, &__block_literal_global_13);
  }
  uint64_t v1 = (void *)SafariShared::sharedApplication(void)::app;
  return v1;
}

uint64_t *std::__tree<SafariShared::SuddenTerminationDisabler *>::__emplace_unique_key_args<SafariShared::SuddenTerminationDisabler *,SafariShared::SuddenTerminationDisabler *>(uint64_t **a1, unint64_t *a2, uint64_t *a3)
{
  uint64_t v6 = a1 + 1;
  id v5 = a1[1];
  if (v5)
  {
    unint64_t v7 = *a2;
    while (1)
    {
      while (1)
      {
        id v8 = (uint64_t **)v5;
        unint64_t v9 = v5[4];
        if (v7 >= v9) {
          break;
        }
        id v5 = *v8;
        uint64_t v6 = v8;
        if (!*v8) {
          goto LABEL_10;
        }
      }
      if (v9 >= v7) {
        break;
      }
      id v5 = v8[1];
      if (!v5)
      {
        uint64_t v6 = v8 + 1;
        goto LABEL_10;
      }
    }
  }
  else
  {
    id v8 = a1 + 1;
LABEL_10:
    uint64_t v10 = (uint64_t *)operator new(0x28uLL);
    v10[4] = *a3;
    std::__tree<SafariShared::SuddenTerminationDisabler *>::__insert_node_at(a1, (uint64_t)v8, v6, v10);
    return v10;
  }
  return (uint64_t *)v8;
}

uint64_t *std::__tree<SafariShared::SuddenTerminationDisabler *>::__insert_node_at(uint64_t **a1, uint64_t a2, uint64_t **a3, uint64_t *a4)
{
  *a4 = 0;
  a4[1] = 0;
  a4[2] = a2;
  *a3 = a4;
  id v5 = (uint64_t *)**a1;
  if (v5)
  {
    *a1 = v5;
    a4 = *a3;
  }
  unint64_t result = std::__tree_balance_after_insert[abi:sn180100]<std::__tree_node_base<void *> *>(a1[1], a4);
  a1[2] = (uint64_t *)((char *)a1[2] + 1);
  return result;
}

uint64_t *std::__tree_balance_after_insert[abi:sn180100]<std::__tree_node_base<void *> *>(uint64_t *result, uint64_t *a2)
{
  *((unsigned char *)a2 + 24) = a2 == result;
  if (a2 != result)
  {
    do
    {
      uint64_t v2 = (uint64_t *)a2[2];
      if (*((unsigned char *)v2 + 24)) {
        return result;
      }
      BOOL v3 = (uint64_t *)v2[2];
      uint64_t v4 = (uint64_t *)*v3;
      if ((uint64_t *)*v3 == v2)
      {
        uint64_t v7 = v3[1];
        if (!v7 || (v8 = *(unsigned __int8 *)(v7 + 24), id v5 = (unsigned char *)(v7 + 24), v8))
        {
          if ((uint64_t *)*v2 == a2)
          {
            unint64_t v9 = (uint64_t **)a2[2];
          }
          else
          {
            unint64_t v9 = (uint64_t **)v2[1];
            uint64_t v10 = *v9;
            v2[1] = (uint64_t)*v9;
            if (v10)
            {
              v10[2] = (uint64_t)v2;
              BOOL v3 = (uint64_t *)v2[2];
            }
            v9[2] = v3;
            *(void *)(v2[2] + 8 * (*(void *)v2[2] != (void)v2)) = v9;
            void *v9 = v2;
            v2[2] = (uint64_t)v9;
            BOOL v3 = v9[2];
            uint64_t v2 = (uint64_t *)*v3;
          }
          *((unsigned char *)v9 + 24) = 1;
          *((unsigned char *)v3 + 24) = 0;
          uint64_t v13 = v2[1];
          uint64_t *v3 = v13;
          if (v13) {
            *(void *)(v13 + 16) = v3;
          }
          v2[2] = v3[2];
          *(void *)(v3[2] + 8 * (*(void *)v3[2] != (void)v3)) = v2;
          v2[1] = (uint64_t)v3;
          goto LABEL_27;
        }
      }
      else if (!v4 || (v6 = *((unsigned __int8 *)v4 + 24), id v5 = v4 + 3, v6))
      {
        if ((uint64_t *)*v2 == a2)
        {
          uint64_t v11 = a2[1];
          uint64_t *v2 = v11;
          if (v11)
          {
            *(void *)(v11 + 16) = v2;
            BOOL v3 = (uint64_t *)v2[2];
          }
          a2[2] = (uint64_t)v3;
          *(void *)(v2[2] + 8 * (*(void *)v2[2] != (void)v2)) = a2;
          a2[1] = (uint64_t)v2;
          v2[2] = (uint64_t)a2;
          BOOL v3 = (uint64_t *)a2[2];
        }
        else
        {
          a2 = (uint64_t *)a2[2];
        }
        *((unsigned char *)a2 + 24) = 1;
        *((unsigned char *)v3 + 24) = 0;
        uint64_t v2 = (uint64_t *)v3[1];
        uint64_t v12 = *v2;
        v3[1] = *v2;
        if (v12) {
          *(void *)(v12 + 16) = v3;
        }
        v2[2] = v3[2];
        *(void *)(v3[2] + 8 * (*(void *)v3[2] != (void)v3)) = v2;
        uint64_t *v2 = (uint64_t)v3;
LABEL_27:
        v3[2] = (uint64_t)v2;
        return result;
      }
      *((unsigned char *)v2 + 24) = 1;
      a2 = v3;
      *((unsigned char *)v3 + 24) = v3 == result;
      *id v5 = 1;
    }
    while (v3 != result);
  }
  return result;
}

void SafariShared::SuddenTerminationDisabler::disableSuddenTerminationTask(SafariShared::SuddenTerminationDisabler *this)
{
  uint64_t v2 = SafariShared::coalescingBackgroundTaskAssertionQueue(this);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = ___ZN12SafariShared25SuddenTerminationDisabler28disableSuddenTerminationTaskEv_block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = this;
  dispatch_sync(v2, block);
}

id SafariShared::coalescingBackgroundTaskAssertionQueue(SafariShared *this)
{
  if (SafariShared::coalescingBackgroundTaskAssertionQueue(void)::onceToken != -1) {
    dispatch_once(&SafariShared::coalescingBackgroundTaskAssertionQueue(void)::onceToken, &__block_literal_global_18_2);
  }
  uint64_t v1 = (void *)SafariShared::coalescingBackgroundTaskAssertionQueue(void)::queue;
  return v1;
}

uint64_t std::__tree<SafariShared::SuddenTerminationDisabler *>::__erase_unique<SafariShared::SuddenTerminationDisabler *>(uint64_t a1, unint64_t *a2)
{
  uint64_t v2 = *(void **)(a1 + 8);
  if (!v2) {
    return 0;
  }
  unint64_t v3 = *a2;
  uint64_t v4 = (uint64_t *)(a1 + 8);
  do
  {
    unint64_t v5 = v2[4];
    BOOL v6 = v5 >= v3;
    if (v5 >= v3) {
      uint64_t v7 = v2;
    }
    else {
      uint64_t v7 = v2 + 1;
    }
    if (v6) {
      uint64_t v4 = v2;
    }
    uint64_t v2 = (void *)*v7;
  }
  while (*v7);
  if (v4 == (uint64_t *)(a1 + 8) || v3 < v4[4]) {
    return 0;
  }
  std::__tree<SafariShared::SuddenTerminationDisabler *>::__remove_node_pointer((uint64_t **)a1, v4);
  operator delete(v4);
  return 1;
}

uint64_t *std::__tree<SafariShared::SuddenTerminationDisabler *>::__remove_node_pointer(uint64_t **a1, uint64_t *a2)
{
  uint64_t v2 = (uint64_t *)a2[1];
  if (v2)
  {
    do
    {
      unint64_t v3 = v2;
      uint64_t v2 = (uint64_t *)*v2;
    }
    while (v2);
  }
  else
  {
    uint64_t v4 = a2;
    do
    {
      unint64_t v3 = (uint64_t *)v4[2];
      BOOL v5 = *v3 == (void)v4;
      uint64_t v4 = v3;
    }
    while (!v5);
  }
  if (*a1 == a2) {
    *a1 = v3;
  }
  BOOL v6 = a1[1];
  a1[2] = (uint64_t *)((char *)a1[2] - 1);
  std::__tree_remove[abi:sn180100]<std::__tree_node_base<void *> *>(v6, a2);
  return v3;
}

uint64_t *std::__tree_remove[abi:sn180100]<std::__tree_node_base<void *> *>(uint64_t *result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  unint64_t v3 = a2;
  if (*a2)
  {
    uint64_t v4 = (uint64_t *)a2[1];
    if (!v4)
    {
      unint64_t v3 = a2;
      goto LABEL_7;
    }
    do
    {
      unint64_t v3 = v4;
      uint64_t v4 = (uint64_t *)*v4;
    }
    while (v4);
  }
  uint64_t v2 = v3[1];
  if (v2)
  {
LABEL_7:
    int v5 = 0;
    *(void *)(v2 + 16) = v3[2];
    goto LABEL_8;
  }
  int v5 = 1;
LABEL_8:
  BOOL v6 = (uint64_t **)v3[2];
  uint64_t v7 = *v6;
  if (*v6 == v3)
  {
    *BOOL v6 = (uint64_t *)v2;
    if (v3 == result)
    {
      uint64_t v7 = 0;
      unint64_t result = (uint64_t *)v2;
    }
    else
    {
      uint64_t v7 = v6[1];
    }
  }
  else
  {
    v6[1] = (uint64_t *)v2;
  }
  int v8 = *((unsigned __int8 *)v3 + 24);
  if (v3 != a2)
  {
    uint64_t v9 = a2[2];
    v3[2] = v9;
    *(void *)(v9 + 8 * (*(void *)a2[2] != (void)a2)) = v3;
    uint64_t v11 = *a2;
    uint64_t v10 = a2[1];
    *(void *)(v11 + 16) = v3;
    uint64_t *v3 = v11;
    v3[1] = v10;
    if (v10) {
      *(void *)(v10 + 16) = v3;
    }
    *((unsigned char *)v3 + 24) = *((unsigned char *)a2 + 24);
    if (result == a2) {
      unint64_t result = v3;
    }
  }
  if (!v8 || !result) {
    return result;
  }
  if (!v5)
  {
    *(unsigned char *)(v2 + 24) = 1;
    return result;
  }
  while (1)
  {
    uint64_t v12 = v7[2];
    if (*(uint64_t **)v12 == v7) {
      break;
    }
    if (!*((unsigned char *)v7 + 24))
    {
      *((unsigned char *)v7 + 24) = 1;
      *(unsigned char *)(v12 + 24) = 0;
      uint64_t v13 = *(uint64_t **)(v12 + 8);
      uint64_t v14 = *v13;
      *(void *)(v12 + 8) = *v13;
      if (v14) {
        *(void *)(v14 + 16) = v12;
      }
      v13[2] = *(void *)(v12 + 16);
      *(void *)(*(void *)(v12 + 16) + 8 * (**(void **)(v12 + 16) != v12)) = v13;
      *uint64_t v13 = v12;
      *(void *)(v12 + 16) = v13;
      if (result == (uint64_t *)*v7) {
        unint64_t result = v7;
      }
      uint64_t v7 = *(uint64_t **)(*v7 + 8);
    }
    uint64_t v15 = (void *)*v7;
    if (*v7 && !*((unsigned char *)v15 + 24))
    {
      OSStatus v16 = (uint64_t *)v7[1];
      if (!v16) {
        goto LABEL_56;
      }
LABEL_55:
      if (*((unsigned char *)v16 + 24))
      {
LABEL_56:
        *((unsigned char *)v15 + 24) = 1;
        *((unsigned char *)v7 + 24) = 0;
        uint64_t v22 = v15[1];
        *uint64_t v7 = v22;
        if (v22) {
          *(void *)(v22 + 16) = v7;
        }
        v15[2] = v7[2];
        *(void *)(v7[2] + 8 * (*(void *)v7[2] != (void)v7)) = v15;
        v15[1] = v7;
        v7[2] = (uint64_t)v15;
        OSStatus v16 = v7;
      }
      else
      {
        uint64_t v15 = v7;
      }
      uint64_t v23 = v15[2];
      *((unsigned char *)v15 + 24) = *(unsigned char *)(v23 + 24);
      *(unsigned char *)(v23 + 24) = 1;
      *((unsigned char *)v16 + 24) = 1;
      uint64_t v24 = *(uint64_t **)(v23 + 8);
      uint64_t v25 = *v24;
      *(void *)(v23 + 8) = *v24;
      if (v25) {
        *(void *)(v25 + 16) = v23;
      }
      v24[2] = *(void *)(v23 + 16);
      *(void *)(*(void *)(v23 + 16) + 8 * (**(void **)(v23 + 16) != v23)) = v24;
      *uint64_t v24 = v23;
      goto LABEL_72;
    }
    OSStatus v16 = (uint64_t *)v7[1];
    if (v16 && !*((unsigned char *)v16 + 24)) {
      goto LABEL_55;
    }
    *((unsigned char *)v7 + 24) = 0;
    os_log_type_t v17 = (uint64_t *)v7[2];
    if (v17 == result)
    {
      os_log_type_t v17 = result;
LABEL_53:
      *((unsigned char *)v17 + 24) = 1;
      return result;
    }
    if (!*((unsigned char *)v17 + 24)) {
      goto LABEL_53;
    }
LABEL_49:
    uint64_t v7 = *(uint64_t **)(v17[2] + 8 * (*(void *)v17[2] == (void)v17));
  }
  if (!*((unsigned char *)v7 + 24))
  {
    *((unsigned char *)v7 + 24) = 1;
    *(unsigned char *)(v12 + 24) = 0;
    uint64_t v18 = v7[1];
    *(void *)uint64_t v12 = v18;
    if (v18) {
      *(void *)(v18 + 16) = v12;
    }
    v7[2] = *(void *)(v12 + 16);
    *(void *)(*(void *)(v12 + 16) + 8 * (**(void **)(v12 + 16) != v12)) = v7;
    v7[1] = v12;
    *(void *)(v12 + 16) = v7;
    if (result == (uint64_t *)v12) {
      unint64_t result = v7;
    }
    uint64_t v7 = *(uint64_t **)v12;
  }
  uint64_t v19 = (void *)*v7;
  if (*v7 && !*((unsigned char *)v19 + 24)) {
    goto LABEL_68;
  }
  uint64_t v20 = (uint64_t *)v7[1];
  if (!v20 || *((unsigned char *)v20 + 24))
  {
    *((unsigned char *)v7 + 24) = 0;
    os_log_type_t v17 = (uint64_t *)v7[2];
    if (*((unsigned char *)v17 + 24)) {
      BOOL v21 = v17 == result;
    }
    else {
      BOOL v21 = 1;
    }
    if (v21) {
      goto LABEL_53;
    }
    goto LABEL_49;
  }
  if (v19 && !*((unsigned char *)v19 + 24))
  {
LABEL_68:
    uint64_t v20 = v7;
  }
  else
  {
    *((unsigned char *)v20 + 24) = 1;
    *((unsigned char *)v7 + 24) = 0;
    uint64_t v26 = *v20;
    v7[1] = *v20;
    if (v26) {
      *(void *)(v26 + 16) = v7;
    }
    v20[2] = v7[2];
    *(void *)(v7[2] + 8 * (*(void *)v7[2] != (void)v7)) = v20;
    *uint64_t v20 = (uint64_t)v7;
    v7[2] = (uint64_t)v20;
    uint64_t v19 = v7;
  }
  uint64_t v23 = v20[2];
  *((unsigned char *)v20 + 24) = *(unsigned char *)(v23 + 24);
  *(unsigned char *)(v23 + 24) = 1;
  *((unsigned char *)v19 + 24) = 1;
  uint64_t v24 = *(uint64_t **)v23;
  uint64_t v27 = *(void *)(*(void *)v23 + 8);
  *(void *)uint64_t v23 = v27;
  if (v27) {
    *(void *)(v27 + 16) = v23;
  }
  v24[2] = *(void *)(v23 + 16);
  *(void *)(*(void *)(v23 + 16) + 8 * (**(void **)(v23 + 16) != v23)) = v24;
  v24[1] = v23;
LABEL_72:
  *(void *)(v23 + 16) = v24;
  return result;
}

void SafariShared::SuddenTerminationDisabler::disableSuddenTerminationTransaction(SafariShared::SuddenTerminationDisabler *this)
{
  uint64_t v2 = SafariShared::coalescingBackgroundTaskAssertionQueue(this);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = ___ZN12SafariShared25SuddenTerminationDisabler35disableSuddenTerminationTransactionEv_block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = this;
  dispatch_sync(v2, block);
}

void SafariShared::SuddenTerminationDisabler::enableSuddenTerminationTransaction(SafariShared::SuddenTerminationDisabler *this)
{
  uint64_t v2 = SafariShared::coalescingBackgroundTaskAssertionQueue(this);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = ___ZN12SafariShared25SuddenTerminationDisabler34enableSuddenTerminationTransactionEv_block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = this;
  dispatch_sync(v2, block);
}

void sub_1B729A658(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B729A724(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void WBSSetUpAccessToAppDataContainerWithIdentifier(void *a1)
{
  id v1 = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&WBSSetUpAccessToAppDataContainerWithIdentifier_lock);
  uint64_t v2 = objc_alloc_init(WBSScopeExitHandler);
  [(WBSScopeExitHandler *)v2 setHandler:&__block_literal_global_52];
  unint64_t v3 = (void *)WBSSetUpAccessToAppDataContainerWithIdentifier_identifiersOfContainersGrantedAccessForThisProcess;
  if (!WBSSetUpAccessToAppDataContainerWithIdentifier_identifiersOfContainersGrantedAccessForThisProcess)
  {
    uint64_t v4 = [MEMORY[0x1E4F1CA80] set];
    int v5 = (void *)WBSSetUpAccessToAppDataContainerWithIdentifier_identifiersOfContainersGrantedAccessForThisProcess;
    WBSSetUpAccessToAppDataContainerWithIdentifier_identifiersOfContainersGrantedAccessForThisProcess = v4;

    unint64_t v3 = (void *)WBSSetUpAccessToAppDataContainerWithIdentifier_identifiersOfContainersGrantedAccessForThisProcess;
  }
  if ([v3 containsObject:v1])
  {
    BOOL v6 = WBS_LOG_CHANNEL_PREFIXSandbox();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      WBSSetUpAccessToAppDataContainerWithIdentifier_cold_1((uint64_t)v1, v6);
    }
  }
  else
  {
    container_query_create();
    container_query_set_class();
    id v7 = v1;
    xpc_object_t objects = xpc_string_create((const char *)[v7 UTF8String]);
    xpc_object_t v8 = xpc_array_create(&objects, 1uLL);
    container_query_set_identifiers();
    container_query_operation_set_flags();
    container_query_set_persona_unique_string();
    if (container_query_get_single_result())
    {
      uint64_t v9 = (void *)container_copy_sandbox_token();
      if ((sandbox_extension_consume() & 0x8000000000000000) == 0) {
        free(v9);
      }
      container_query_free();
      [(id)WBSSetUpAccessToAppDataContainerWithIdentifier_identifiersOfContainersGrantedAccessForThisProcess addObject:v7];
    }
    else
    {
      container_query_get_last_error();
      uint64_t v10 = (void *)container_error_copy_unlocalized_description();
      uint64_t v11 = WBS_LOG_CHANNEL_PREFIXSandbox();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        WBSSetUpAccessToAppDataContainerWithIdentifier_cold_2((uint64_t)v10, v11);
      }
      free(v10);
      container_query_free();
    }
  }
}

void sub_1B729AB94(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void __WBSSetUpAccessToAppDataContainerWithIdentifier_block_invoke()
{
}

void sub_1B729B1A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B729B464(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t AccountsLibrary()
{
  id v1 = 0;
  uint64_t result = AccountsLibraryCore();
  if (!result) {
    AccountsLibrary_cold_1(&v1);
  }
  return result;
}

uint64_t AccountsLibraryCore()
{
  if (!AccountsLibraryCore_frameworkLibrary) {
    AccountsLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  return AccountsLibraryCore_frameworkLibrary;
}

Class __getACMonitoredAccountStoreClass_block_invoke(uint64_t a1)
{
  AccountsLibrary();
  Class result = objc_getClass("ACMonitoredAccountStore");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getACMonitoredAccountStoreClass_block_invoke_cold_1();
  }
  getACMonitoredAccountStoreClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t AppleAccountLibraryCore()
{
  if (!AppleAccountLibraryCore_frameworkLibrary) {
    AppleAccountLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  return AppleAccountLibraryCore_frameworkLibrary;
}

void OUTLINED_FUNCTION_0_3(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_0_4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_0_5(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

uint64_t OUTLINED_FUNCTION_0_6(uint64_t result, uint64_t a2, int a3, float a4)
{
  *(float *)a2 = a4;
  *(void *)(a2 + 4) = result;
  *(_WORD *)(a2 + 12) = 1024;
  *(_DWORD *)(a2 + 14) = a3;
  return result;
}

void OUTLINED_FUNCTION_0_7(void *a1, int a2, os_log_t log, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

uint64_t OUTLINED_FUNCTION_0_8(uint64_t result, float a2, uint64_t a3, uint64_t a4)
{
  *(float *)a4 = a2;
  *(void *)(a4 + 4) = result;
  *(_WORD *)(a4 + 12) = 1024;
  *(_DWORD *)(a4 + 14) = v4;
  return result;
}

void sub_1B729C178(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

uint64_t WBS_LOG_CHANNEL_PREFIXPasswords()
{
  if (WBS_LOG_CHANNEL_PREFIXPasswords_onceToken != -1) {
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXPasswords_onceToken, &__block_literal_global_31);
  }
  return WBS_LOG_CHANNEL_PREFIXPasswords_log;
}

void sub_1B729CE0C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

uint64_t WBSIsEqual(void *a1, void *a2)
{
  if (a1 == a2) {
    return 1;
  }
  else {
    return [a1 isEqual:a2];
  }
}

void sub_1B729E188(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t MobileKeyBagLibraryCore(char **a1)
{
  if (!MobileKeyBagLibraryCore(char **)::frameworkLibrary) {
    MobileKeyBagLibraryCore(char **)::frameworkLibrary = _sl_dlopen();
  }
  return MobileKeyBagLibraryCore(char **)::frameworkLibrary;
}

void soft_MKBGetDeviceLockState(const __CFDictionary *a1)
{
  MKBGetDeviceLockStateSymbolLoc = (void (*)(void))getMKBGetDeviceLockStateSymbolLoc();
  if (MKBGetDeviceLockStateSymbolLoc)
  {
    MKBGetDeviceLockStateSymbolLoc(0);
  }
  else
  {
    uint64_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
    unint64_t v3 = [NSString stringWithUTF8String:"int soft_MKBGetDeviceLockState(CFDictionaryRef)"];
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"WBSKeyBagLockStatusManager.mm", 22, @"%s", dlerror());

    __break(1u);
  }
}

void sub_1B729E344(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t getMKBGetDeviceLockStateSymbolLoc(void)
{
  uint64_t v3 = 0;
  int v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getMKBGetDeviceLockStateSymbolLoc(void)::ptr;
  uint64_t v6 = getMKBGetDeviceLockStateSymbolLoc(void)::ptr;
  if (!getMKBGetDeviceLockStateSymbolLoc(void)::ptr)
  {
    v2[0] = MEMORY[0x1E4F143A8];
    v2[1] = 3221225472;
    v2[2] = ___ZL33getMKBGetDeviceLockStateSymbolLocv_block_invoke;
    v2[3] = &unk_1E615B018;
    v2[4] = &v3;
    ___ZL33getMKBGetDeviceLockStateSymbolLocv_block_invoke(v2);
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1B729E414(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *___ZL33getMKBGetDeviceLockStateSymbolLocv_block_invoke(void *a1)
{
  uint64_t v6 = 0;
  uint64_t v2 = MobileKeyBagLibraryCore(&v6);
  if (!v2)
  {
    a1 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v3 = [NSString stringWithUTF8String:"void *MobileKeyBagLibrary()"];
    objc_msgSend(a1, "handleFailureInFunction:file:lineNumber:description:", v3, @"WBSKeyBagLockStatusManager.mm", 21, @"%s", v6);

    __break(1u);
    goto LABEL_5;
  }
  uint64_t v3 = (void *)v2;
  int v4 = v6;
  if (v6) {
LABEL_5:
  }
    free(v4);
  Class result = dlsym(v3, "MKBGetDeviceLockState");
  *(void *)(*(void *)(a1[4] + 8) + 24) = result;
  getMKBGetDeviceLockStateSymbolLoc(void)::ptr = *(void *)(*(void *)(a1[4] + 8) + 24);
  return result;
}

void sub_1B729E514(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_1B729E55C(uint64_t a1, unint64_t *a2)
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

void type metadata accessor for CFString(uint64_t a1)
{
}

id sub_1B729E5AC(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v6 = a1;
  id v7 = objc_msgSend(v6, sel_passkeyStore);
  id v11 = v6;
  sub_1B729E6AC(a3, (uint64_t)v10, (uint64_t)"SafariCore/WBSSavedAccountStore.swift", 37, 2, a4, (uint64_t)&unk_1F105AEA0, (uint64_t)sub_1B729E938, sub_1B729E854);

  swift_release();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9E592D0);
  xpc_object_t v8 = (void *)sub_1B7384130();
  swift_bridgeObjectRelease();
  return v8;
}

uint64_t sub_1B729E6AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t (*a9)(uint64_t, uint64_t, uint64_t))
{
  uint64_t v12 = v9;
  if (swift_task_isCurrentExecutor())
  {
    uint64_t v15 = swift_allocObject();
    *(void *)(v15 + 16) = a1;
    *(void *)(v15 + 24) = a2;
    uint64_t v16 = a9(a8, v15, v12);
    if (v10)
    {
      swift_release();
      return v16;
    }
    char isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
    swift_release();
    if ((isEscapingClosureAtFileLocation & 1) == 0) {
      return v16;
    }
    __break(1u);
  }
  sub_1B7384380();
  sub_1B7384070();
  type metadata accessor for WBSPasskeyStore();
  sub_1B73843F0();
  sub_1B7384070();
  uint64_t result = sub_1B7384460();
  __break(1u);
  return result;
}

uint64_t sub_1B729E854(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = a1;
  *(void *)(v7 + 24) = a2;
  swift_retain();
  uint64_t v9 = a3;
  sub_1B729E8F0(&v9, &v10);
  uint64_t result = swift_release();
  if (!v3) {
    return v10;
  }
  return result;
}

void *sub_1B729E8F0@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t result = (*(void *(**)(uint64_t *__return_ptr, void))(v2 + 16))(&v6, *a1);
  if (!v3) {
    *a2 = v6;
  }
  return result;
}

void *sub_1B729E938@<X0>(void *a1@<X8>)
{
  uint64_t result = (*(void *(**)(uint64_t *__return_ptr))(v1 + 16))(&v5);
  if (!v2) {
    *a1 = v5;
  }
  return result;
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

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
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

void __determineBundle_block_invoke(uint64_t a1)
{
  uint64_t v2 = _WBSGetLocalizableBundleFromAddress();
  uint64_t v3 = *(void ***)(a1 + 32);
  int v4 = *v3;
  void *v3 = (void *)v2;
}

id _WBSGetLocalizableBundleFromAddress()
{
  uint64_t v0 = (const char *)dyld_image_path_containing_address();
  uint64_t v1 = [MEMORY[0x1E4F28CB8] defaultManager];
  [v1 stringWithFileSystemRepresentation:v0 length:strlen(v0)];
  uint64_t v2 = (void *)_CFBundleCopyFrameworkURLForExecutablePath();

  if (!v2)
  {
    [MEMORY[0x1E4F1CB10] fileURLWithFileSystemRepresentation:v0 isDirectory:0 relativeToURL:0];
    uint64_t v2 = (void *)_CFBundleCopyBundleURLForExecutableURL();
  }
  uint64_t v3 = [MEMORY[0x1E4F28B50] bundleWithURL:v2];

  return v3;
}

void sub_1B729F260(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B729F3C8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);

  SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler((id *)va);
  _Unwind_Resume(a1);
}

void sub_1B729FB0C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
  objc_destroyWeak(v23);
  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B72A0638(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B72A0D28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1B72A10AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_1B72A11CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a3;
  id v13 = 0;
  uint64_t v7 = [[WBSSQLiteStatement alloc] initWithDatabase:v5 query:v6 error:&v13];
  id v8 = v13;
  uint64_t v9 = v8;
  if (v7)
  {
    uint64_t v10 = [(WBSSQLiteStatement *)v7 execute];
    [(WBSSQLiteStatement *)v7 invalidate];
    if ((v10 - 100) >= 2 && v10 != 0) {
      objc_msgSend(v5, "reportErrorWithCode:statement:error:", v10, -[WBSSQLiteStatement handle](v7, "handle"), a2);
    }
  }
  else
  {
    if (a2) {
      *a2 = v8;
    }
    uint64_t v10 = [v9 code];
  }

  return v10;
}

void sub_1B72A1324(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void temporarilyDisableSuddenTermination(void)
{
  os_unfair_lock_lock((os_unfair_lock_t)&suddenTerminationDisablerLock);
  if (!suddenTerminationDisablerDispatchSource) {
    operator new();
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&suddenTerminationDisablerLock);
  dispatch_time_t v0 = dispatch_time(0, 3000000000);
  uint64_t v1 = suddenTerminationDisablerDispatchSource;
  dispatch_source_set_timer(v1, v0, 0xFFFFFFFFFFFFFFFFLL, 0x493E0uLL);
}

void sub_1B72A1480(_Unwind_Exception *a1)
{
  MEMORY[0x1BA9BC7E0](v1, 0x1080C40D2F62047);
  _Unwind_Resume(a1);
}

void sub_1B72A15B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B72A1780(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B72A1860(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B72A18D8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B72A1940(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B72A19BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B72A1A6C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B72A1BC0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id SafariShared::WBSSQLiteDatabaseFetch<>(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  id v5 = [[WBSSQLiteStatement alloc] initWithDatabase:v3 query:v4];
  id v6 = [(WBSSQLiteStatement *)v5 fetch];

  return v6;
}

void sub_1B72A1C6C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B72A1D5C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B72A1EC0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B72A20B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{
  _Unwind_Resume(a1);
}

uint64_t SafariShared::WBSSQLiteDatabaseEnumerate<std::tuple<NSString * {__strong}&>>(void *a1, uint64_t a2, void *a3, void ***a4)
{
  id v7 = a1;
  id v8 = a3;
  uint64_t v9 = [[WBSSQLiteStatement alloc] initWithDatabase:v7 query:v8 error:a2];
  uint64_t v10 = v9;
  if (v9)
  {
    id v11 = [(WBSSQLiteStatement *)v9 handle];
    uint64_t v14 = *a4;
    uint64_t v12 = SafariShared::_WBSSQLiteStatementBindOrStep<0,0,std::tuple<std::tuple<NSString * {__strong}&>>>(v7, v11, a2, &v14);
    [(WBSSQLiteStatement *)v10 invalidate];
  }
  else
  {
    uint64_t v12 = 0;
  }

  return v12;
}

void sub_1B72A21C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t SafariShared::_WBSSQLiteStatementBindOrStep<0,0,std::tuple<std::tuple<NSString * {__strong}&>>>(void *a1, sqlite3_stmt *a2, uint64_t a3, void ***a4)
{
  id v7 = a1;
  uint64_t v8 = sqlite3_step(a2);
  if (v8 != 100) {
    goto LABEL_5;
  }
  if (!SafariShared::_WBSStatementFetchColumnsInTuple<std::tuple<NSString * {__strong}&>,0>(a2, a4))
  {
LABEL_6:
    uint64_t v9 = 0;
    goto LABEL_7;
  }
  uint64_t v8 = sqlite3_step(a2);
  if (v8 != 101)
  {
LABEL_5:
    [v7 reportErrorWithCode:v8 statement:a2 error:a3];
    goto LABEL_6;
  }
  uint64_t v9 = 1;
LABEL_7:

  return v9;
}

void sub_1B72A2280(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t SafariShared::_WBSStatementFetchColumnsInTuple<std::tuple<NSString * {__strong}&>,0>(sqlite3_stmt *a1, void ***a2)
{
  uint64_t v3 = SafariShared::WBSSQLiteDatatypeTraits<NSString * {__strong}>::fetch(a1, 0);
  id v4 = **a2;
  **a2 = (void *)v3;

  return 1;
}

__CFString *SafariShared::WBSSQLiteDatatypeTraits<NSString * {__strong}>::fetch(sqlite3_stmt *a1, int a2)
{
  if (sqlite3_column_type(a1, a2) == 5)
  {
    id v4 = 0;
  }
  else
  {
    CFAllocatorRef v5 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    id v6 = sqlite3_column_text(a1, a2);
    int v7 = sqlite3_column_bytes(a1, a2);
    id v4 = (__CFString *)CFStringCreateWithBytes(v5, v6, v7, 0x8000100u, 0);
  }
  return v4;
}

void sub_1B72A26EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B72A275C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B72A2BAC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B72A2DE8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1B72A30C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  uint64_t v24 = v23;

  objc_destroyWeak(v22);
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void __isProcessAllowedToPerformAccountStoreMaintenance_block_invoke()
{
  id v2 = [MEMORY[0x1E4F28B50] mainBundle];
  if (objc_msgSend(v2, "safari_isSafariFamilyApplicationBundle"))
  {
    isProcessAllowedToPerformAccountStoreMaintenance_isAllowedToPerformMaintenance = 1;
  }
  else
  {
    dispatch_time_t v0 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"com.apple.AuthenticationServicesCore.AuthenticationServicesAgent", @"com.apple.Preferences", @"com.apple.Safari.SafariCoreUnitTests.xctrunner", 0);
    uint64_t v1 = [v2 bundleIdentifier];
    isProcessAllowedToPerformAccountStoreMaintenance_isAllowedToPerformMaintenance = [v0 containsObject:v1];
  }
}

void sub_1B72A3570(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B72A372C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B72A37EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B72A3854(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B72A39F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B72A3ED8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B72A3F40(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t WBS_LOG_CHANNEL_PREFIXRemotelyUpdatableDataController()
{
  if (WBS_LOG_CHANNEL_PREFIXRemotelyUpdatableDataController_onceToken != -1) {
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXRemotelyUpdatableDataController_onceToken, &__block_literal_global_37);
  }
  return WBS_LOG_CHANNEL_PREFIXRemotelyUpdatableDataController_log;
}

void sub_1B72A57A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B72A5D28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t WBS_LOG_CHANNEL_PREFIXKeychain()
{
  if (WBS_LOG_CHANNEL_PREFIXKeychain_onceToken != -1) {
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXKeychain_onceToken, &__block_literal_global_19);
  }
  return WBS_LOG_CHANNEL_PREFIXKeychain_log;
}

void sub_1B72A7B4C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B72A7CDC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B72A7E0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void __WBSDispatchAsyncToMainQueueWithAutoreleasePool_block_invoke(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x1BA9BCF20]();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_1B72A8640(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B72A8C0C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t WBS_LOG_CHANNEL_PREFIXSQLite()
{
  if (WBS_LOG_CHANNEL_PREFIXSQLite_onceToken != -1) {
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXSQLite_onceToken, &__block_literal_global_43);
  }
  return WBS_LOG_CHANNEL_PREFIXSQLite_log;
}

void ___ZN12SafariShared25SuddenTerminationDisabler34enableSuddenTerminationTransactionEv_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = *(void **)(v1 + 8);
  *(void *)(v1 + 8) = 0;
}

void sub_1B72A9294(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B72A946C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

id WBSAuthenticationServicesAgentInterface()
{
  if (WBSAuthenticationServicesAgentInterface_onceToken != -1) {
    dispatch_once(&WBSAuthenticationServicesAgentInterface_onceToken, &__block_literal_global_2);
  }
  dispatch_time_t v0 = (void *)WBSAuthenticationServicesAgentInterface_interface;
  return v0;
}

id WBSAuthenticationServicesAgentDelegateInterface()
{
  if (WBSAuthenticationServicesAgentDelegateInterface_onceToken != -1) {
    dispatch_once(&WBSAuthenticationServicesAgentDelegateInterface_onceToken, &__block_literal_global_49);
  }
  dispatch_time_t v0 = (void *)WBSAuthenticationServicesAgentDelegateInterface_interface;
  return v0;
}

void __WBSAuthenticationServicesAgentInterface_block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F108B0F0];
  uint64_t v1 = (void *)WBSAuthenticationServicesAgentInterface_interface;
  WBSAuthenticationServicesAgentInterface_interface = v0;

  id v2 = (void *)WBSAuthenticationServicesAgentInterface_interface;
  uint64_t v3 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  id v6 = objc_msgSend(v3, "setWithObjects:", v4, v5, objc_opt_class(), 0);
  [v2 setClasses:v6 forSelector:sel_getPasskeysForRunningAssertionWithApplicationIdentifier_withCompletionHandler_ argumentIndex:0 ofReply:1];

  int v7 = (void *)WBSAuthenticationServicesAgentInterface_interface;
  uint64_t v8 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  id v11 = objc_msgSend(v8, "setWithObjects:", v9, v10, objc_opt_class(), 0);
  [v7 setClasses:v11 forSelector:sel_getPasskeysForRunningAssertionWithWebFrameIdentifier_completionHandler_ argumentIndex:0 ofReply:1];

  uint64_t v12 = (void *)WBSAuthenticationServicesAgentInterface_interface;
  id v13 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
  [v12 setClasses:v13 forSelector:sel_userSelectedAutoFillNearbyDevice_completionHandler_ argumentIndex:0 ofReply:0];
}

void __WBSAuthenticationServicesAgentDelegateInterface_block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F108AAB0];
  uint64_t v1 = (void *)WBSAuthenticationServicesAgentDelegateInterface_interface;
  WBSAuthenticationServicesAgentDelegateInterface_interface = v0;
}

size_t WBSReadExactAmountOfBytesFromFileDescriptor(int a1, char *a2, size_t a3)
{
  size_t v3 = a3;
  while (v3)
  {
    ssize_t v6 = read(a1, a2, v3);
    if (v3 == v6) {
      break;
    }
    if (!v6) {
      return 0;
    }
    if (v6 < 0)
    {
      if (*__error() != 4) {
        return -1;
      }
    }
    else
    {
      a2 += v6;
      v3 -= v6;
    }
  }
  return v3;
}

void ___ZN12SafariShared25SuddenTerminationDisabler35disableSuddenTerminationTransactionEv_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v4 = [NSString stringWithFormat:@"com.apple.SafariShared.SuddenTerminationDisabler:%@", *(void *)(v1 + 16)];
  [v4 UTF8String];
  uint64_t v2 = os_transaction_create();
  size_t v3 = *(void **)(v1 + 8);
  *(void *)(v1 + 8) = v2;
}

void sub_1B72A99F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void WBSDispatchAsyncToMainQueueWithAutoreleasePool(void *a1)
{
  id v1 = a1;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __WBSDispatchAsyncToMainQueueWithAutoreleasePool_block_invoke;
  block[3] = &unk_1E615A620;
  id v4 = v1;
  id v2 = v1;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void sub_1B72A9D38(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B72A9DDC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B72AA000(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20,uint64_t a21,void *a22)
{
  _Unwind_Resume(a1);
}

void WBSReleaseOnMainQueueImpl(const void **a1)
{
  id v1 = *a1;
  if (*a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)&WBSReleaseOnMainQueueImpl_lock);
    if (WBSReleaseOnMainQueueImpl_objectList)
    {
      [(id)WBSReleaseOnMainQueueImpl_objectList addObject:v1];
    }
    else
    {
      uint64_t v3 = [MEMORY[0x1E4F1CA48] arrayWithObject:v1];
      id v4 = (void *)WBSReleaseOnMainQueueImpl_objectList;
      WBSReleaseOnMainQueueImpl_objectList = v3;
    }
    if ([(id)WBSReleaseOnMainQueueImpl_objectList count] == 1) {
      dispatch_async(MEMORY[0x1E4F14428], &__block_literal_global_68);
    }
    CFRelease(v1);
    *a1 = 0;
    os_unfair_lock_unlock((os_unfair_lock_t)&WBSReleaseOnMainQueueImpl_lock);
  }
}

void sub_1B72AA5D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B72AA704(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B72AA8F0(_Unwind_Exception *a1)
{
  id v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1B72AA994(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void ___ZN12SafariSharedL17sharedApplicationEv_block_invoke()
{
  uint64_t v0 = [NSClassFromString(&cfstr_Uiapplication.isa) sharedApplication];
  id v1 = (void *)SafariShared::sharedApplication(void)::app;
  SafariShared::sharedApplication(void)::app = v0;
}

void __WBSReleaseOnMainQueueImpl_block_invoke()
{
  os_unfair_lock_lock((os_unfair_lock_t)&WBSReleaseOnMainQueueImpl_lock);
  [(id)WBSReleaseOnMainQueueImpl_objectList removeAllObjects];
  os_unfair_lock_unlock((os_unfair_lock_t)&WBSReleaseOnMainQueueImpl_lock);
}

void sub_1B72AB07C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B72AB220(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18)
{
  objc_destroyWeak(v18);
  objc_destroyWeak((id *)(v20 - 72));
  _Unwind_Resume(a1);
}

uint64_t *___ZN12SafariSharedL21invalidTaskIdentifierEv_block_invoke()
{
  uint64_t result = (uint64_t *)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "UIBackgroundTaskInvalid");
  if (result) {
    SafariShared::invalidTaskIdentifier(void)::identifer = *result;
  }
  return result;
}

void __WBSDispatchSyncToMainQueueWithAutoreleasePool_block_invoke(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x1BA9BCF20]();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_1B72ABF34(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B72ABFC4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B72AC150(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t _WBSRunOnceImpl(void *a1)
{
  id v2 = objc_getAssociatedObject(a1, &hasRunAssociatedObjectKey);
  uint64_t v3 = [v2 BOOLValue];

  if ((v3 & 1) == 0) {
    objc_setAssociatedObject(a1, &hasRunAssociatedObjectKey, MEMORY[0x1E4F1CC38], (void *)1);
  }
  return v3;
}

void ___ZN12SafariSharedL38coalescingBackgroundTaskAssertionQueueEv_block_invoke()
{
  if (SafariShared::invalidTaskIdentifier(void)::once != -1) {
    dispatch_once(&SafariShared::invalidTaskIdentifier(void)::once, &__block_literal_global_10_1);
  }
  SafariShared::coalescingBackgroundTaskIdentifier = SafariShared::invalidTaskIdentifier(void)::identifer;
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.SafariShared.CoalescingBackgroundTaskAssertionQueue", 0);
  id v1 = (void *)SafariShared::coalescingBackgroundTaskAssertionQueue(void)::queue;
  SafariShared::coalescingBackgroundTaskAssertionQueue(void)::queue = (uint64_t)v0;
}

void WBSDispatchSyncToMainQueueWithAutoreleasePool(void *a1)
{
  id v1 = a1;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __WBSDispatchSyncToMainQueueWithAutoreleasePool_block_invoke;
  block[3] = &unk_1E615A620;
  id v4 = v1;
  id v2 = v1;
  dispatch_sync(MEMORY[0x1E4F14428], block);
}

void sub_1B72ACB3C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B72ACEC8(_Unwind_Exception *a1)
{
  ssize_t v6 = v5;

  _Unwind_Resume(a1);
}

void sub_1B72ACFA4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B72AD628(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t sub_1B72AE3C4@<X0>(uint64_t *a1@<X8>)
{
  return sub_1B72AE3DC(a1);
}

uint64_t sub_1B72AE3DC@<X0>(uint64_t *a1@<X8>)
{
  return sub_1B7292A1C(*(void **)(v1 + 16), (uint64_t (*)(void))sub_1B729351C, a1);
}

uint64_t sub_1B72AE428@<X0>(uint64_t *a1@<X8>)
{
  return sub_1B72AE440(a1);
}

uint64_t sub_1B72AE440@<X0>(uint64_t *a1@<X8>)
{
  return sub_1B7292A1C(*(void **)(v1 + 16), (uint64_t (*)(void))sub_1B7292C50, a1);
}

uint64_t type metadata accessor for WBSKeychainPasskey()
{
  uint64_t result = qword_1E9E59640;
  if (!qword_1E9E59640) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t type metadata accessor for WBSPasskeyStore()
{
  return self;
}

void sub_1B72AE4E0()
{
  off_1EB5B5C20 = (_UNKNOWN *)MEMORY[0x1E4FBC868];
}

uint64_t WBSAXShouldShowAnimatedImageControls()
{
  uint64_t result = libAccessibilityLibraryCore();
  if (result)
  {
    uint64_t result = _os_feature_enabled_impl();
    if (result)
    {
      uint64_t v3 = 0;
      id v4 = &v3;
      uint64_t v5 = 0x2020000000;
      uint64_t v1 = (unsigned int (*)(void))get_AXSReduceMotionAutoplayAnimatedImagesEnabledSymbolLoc_ptr;
      ssize_t v6 = get_AXSReduceMotionAutoplayAnimatedImagesEnabledSymbolLoc_ptr;
      if (!get_AXSReduceMotionAutoplayAnimatedImagesEnabledSymbolLoc_ptr)
      {
        v2[0] = MEMORY[0x1E4F143A8];
        v2[1] = 3221225472;
        v2[2] = __get_AXSReduceMotionAutoplayAnimatedImagesEnabledSymbolLoc_block_invoke;
        v2[3] = &unk_1E6159628;
        v2[4] = &v3;
        __get_AXSReduceMotionAutoplayAnimatedImagesEnabledSymbolLoc_block_invoke((uint64_t)v2);
        uint64_t v1 = (unsigned int (*)(void))v4[3];
      }
      _Block_object_dispose(&v3, 8);
      if (!v1) {
        WBSAXShouldShowAnimatedImageControls_cold_1();
      }
      return v1() == 0;
    }
  }
  return result;
}

void sub_1B72AE5DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t libAccessibilityLibraryCore()
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = 0;
  uint64_t v3 = &v2;
  uint64_t v4 = 0x2020000000;
  uint64_t v0 = libAccessibilityLibraryCore_frameworkLibrary;
  uint64_t v5 = libAccessibilityLibraryCore_frameworkLibrary;
  if (!libAccessibilityLibraryCore_frameworkLibrary)
  {
    long long v6 = xmmword_1E61595E0;
    uint64_t v7 = 0;
    v3[3] = _sl_dlopen();
    libAccessibilityLibraryCore_frameworkLibrary = v3[3];
    uint64_t v0 = v3[3];
  }
  _Block_object_dispose(&v2, 8);
  return v0;
}

void sub_1B72AE70C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __libAccessibilityLibraryCore_block_invoke(uint64_t a1)
{
  uint64_t result = _sl_dlopen();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  libAccessibilityLibraryCore_frameworkLibrary = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

dispatch_time_t WBSTimeUntilNextWeeklyAnalyticsReportForKey(void *a1)
{
  id v1 = a1;
  double Current = CFAbsoluteTimeGetCurrent();
  uint64_t v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v3 doubleForKey:v1];
  double v5 = v4;

  double v6 = v5 - Current + 604800.0;
  if (v6 < 300.0) {
    double v6 = 300.0;
  }
  dispatch_time_t v7 = dispatch_walltime(0, 1000000000 * (uint64_t)v6);

  return v7;
}

void sub_1B72AF15C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B72AF220(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B72AF3B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t descriptionForTimeInterval(NSDate *a1)
{
  id v1 = a1;
  uint64_t v2 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  if ([v2 isDateInToday:v1])
  {
    uint64_t v3 = 0;
  }
  else if ([v2 isDateInYesterday:v1])
  {
    uint64_t v3 = 1;
  }
  else
  {
    double v4 = [MEMORY[0x1E4F1C9C8] now];
    double v5 = [v2 components:28 fromDate:v1 toDate:v4 options:0];

    if ([v5 day] >= 8)
    {
      if ([v5 day] < 8 || objc_msgSend(v5, "day") >= 15)
      {
        if ([v5 day] < 31) {
          uint64_t v3 = 4;
        }
        else {
          uint64_t v3 = 5;
        }
      }
      else
      {
        uint64_t v3 = 3;
      }
    }
    else
    {
      uint64_t v3 = 2;
    }
  }
  return v3;
}

void sub_1B72AF4EC(_Unwind_Exception *a1)
{
  double v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1B72AF5B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B72AF868(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15)
{
  _Unwind_Resume(a1);
}

void sub_1B72AFA30(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B72AFD88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15)
{
  _Unwind_Resume(a1);
}

void sub_1B72B002C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B72B017C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_1B72B0268(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B72B03A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1B72B04E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1B72B06C8(_Unwind_Exception *a1)
{
  uint64_t v3 = v2;

  _Unwind_Resume(a1);
}

void sub_1B72B0820(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_1B72B08A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B72B0EF0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B72B10B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B72B11F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B72B1294(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1B72B164C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1B72B17F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1B72B18B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

id extensionInvokedMetric(NSString *a1, int a2)
{
  v9[2] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = a1;
  double v4 = v3;
  v8[0] = @"extensionIdentifier";
  v8[1] = @"method";
  double v5 = @"scriptInjection";
  if (a2) {
    double v5 = @"button";
  }
  v9[0] = v3;
  v9[1] = v5;
  double v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:2];

  return v6;
}

void sub_1B72B19A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B72B1A54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1B72B1BA0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B72B1D10(_Unwind_Exception *a1)
{
  uint64_t v3 = v2;

  _Unwind_Resume(a1);
}

void sub_1B72B1E60(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B72B2060(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_1B72B2204(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1B72B246C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_1B72B26D8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B72B284C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_1B72B292C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B72B2AA0(_Unwind_Exception *a1)
{
  uint64_t v3 = v2;

  _Unwind_Resume(a1);
}

void sub_1B72B2C08(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B72B2D60(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B72B2E34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1B72B2FBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1B72B3080(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B72B3234(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B72B3330(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1B72B350C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B72B364C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B72B3858(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B72B39C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B72B3B08(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B72B3C34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14, void *a15)
{
  _Unwind_Resume(a1);
}

void sub_1B72B3DF4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B72B3F04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1B72B405C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B72B41D0(_Unwind_Exception *a1)
{
  uint64_t v3 = v2;

  _Unwind_Resume(a1);
}

void sub_1B72B4338(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B72B44B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B72B4610(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B72B48EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B72B4A2C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B72B4B84(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B72B4D90(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B72B4F80(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B72B5104(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B72B51E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_1B72B5350(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B72B5608(_Unwind_Exception *a1)
{
  uint64_t v3 = v2;

  _Unwind_Resume(a1);
}

void sub_1B72B5758(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B72B5898(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B72B5B68(_Unwind_Exception *a1)
{
  if (v3) {

  }
  _Unwind_Resume(a1);
}

void sub_1B72B5CE8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B72B5FAC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B72B6104(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B72B6260(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B72B63A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B72B64E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B72B6870(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B72B6B6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1B72B6CA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1B72B7044(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B72B7398(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B72B74D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1B72B7690(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1B72B7858(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_1B72B792C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B72B7B0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15)
{
  _Unwind_Resume(a1);
}

void sub_1B72B7C1C(_Unwind_Exception *a1)
{
  int v3 = v2;

  _Unwind_Resume(a1);
}

void sub_1B72B7C9C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B72B7E8C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B72B8200(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B72B831C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1B72B8490(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_1B72B8600(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1B72B87DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B72B8938(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1B72B8A90(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B72B8D40(_Unwind_Exception *a1)
{
  int v3 = v2;

  _Unwind_Resume(a1);
}

void sub_1B72B8EC4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B72B9054(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B72B9184(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1B72B9360(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B72B94A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B72B9620(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B72B989C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B72B99F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B72B9AF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1B72B9D58(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

__CFString *stringForFieldType(unint64_t a1)
{
  if (a1 > 0x18) {
    return @"Invalid Field Type";
  }
  else {
    return off_1E615A1A0[a1];
  }
}

void sub_1B72B9E90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15)
{
  _Unwind_Resume(a1);
}

void sub_1B72BA000(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B72BA0FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15)
{
  _Unwind_Resume(a1);
}

void sub_1B72BA26C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B72BA368(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15)
{
  _Unwind_Resume(a1);
}

void sub_1B72BA450(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B72BA6B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B72BA768(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_1B72BA870(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B72BA930(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1B72BA9EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1B72BAAD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1B72BACD4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B72BADB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1B72BAF48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15)
{
  _Unwind_Resume(a1);
}

void sub_1B72BB054(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B72BB13C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B72BB25C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_1B72BB40C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15)
{
  _Unwind_Resume(a1);
}

void sub_1B72BB500(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B72BB714(_Unwind_Exception *a1)
{
  int v3 = v2;

  _Unwind_Resume(a1);
}

void sub_1B72BB890(_Unwind_Exception *a1)
{
  int v3 = v2;

  _Unwind_Resume(a1);
}

void sub_1B72BB9E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B72BBB5C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B72BBDEC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

__CFString *stringForToolbarButtonType(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 0x24) {
    return @"back";
  }
  else {
    return off_1E615A318[a1 - 1];
  }
}

void sub_1B72BBF80(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B72BC0B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B72BC49C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B72BC600(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B72BC6B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1B72BC878(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B72BCA88(_Unwind_Exception *a1)
{
  int v3 = v2;

  _Unwind_Resume(a1);
}

void sub_1B72BCB80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1B72BCD0C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B72BCDF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1B72BCEAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1B72BD034(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B72BD110(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B72BD27C(_Unwind_Exception *a1)
{
  int v3 = v2;

  _Unwind_Resume(a1);
}

void sub_1B72BD340(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1B72BD3FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1B72BD4DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1B72BD580(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B72BD63C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1B72BD958(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19, void *a20)
{
  _Unwind_Resume(a1);
}

void sub_1B72BDAA8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B72BDB78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1B72BDD58(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B72BDE30(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B72BDEF4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL WBSAuditTokenHasEntitlement(_OWORD *a1, void *a2)
{
  int v3 = a2;
  CFAllocatorRef v4 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  long long v5 = a1[1];
  *(_OWORD *)token.val = *a1;
  *(_OWORD *)&token.val[4] = v5;
  double v6 = SecTaskCreateWithAuditToken(v4, &token);
  dispatch_time_t v7 = v6;
  if (v6)
  {
    CFErrorRef error = 0;
    CFBooleanRef v8 = (const __CFBoolean *)SecTaskCopyValueForEntitlement(v6, v3, &error);
    CFBooleanRef v9 = v8;
    if (error)
    {
      NSLog(&cfstr_UnableToGetEnt.isa, v3, error);
      CFRelease(error);
      BOOL v10 = 0;
      if (!v9) {
        goto LABEL_12;
      }
    }
    else
    {
      if (!v8)
      {
        BOOL v10 = 0;
LABEL_12:
        CFRelease(v7);
        goto LABEL_13;
      }
      CFTypeID v11 = CFGetTypeID(v8);
      BOOL v10 = v11 == CFBooleanGetTypeID() && CFBooleanGetValue(v9) != 0;
    }
    CFRelease(v9);
    goto LABEL_12;
  }
  NSLog(&cfstr_UnableToCreate.isa, v3);
  BOOL v10 = 0;
LABEL_13:

  return v10;
}

void sub_1B72BE154(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id WBSAuditTokenValueArrayForEntitlement(_OWORD *a1, void *a2)
{
  int v3 = a2;
  CFAllocatorRef v4 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  long long v5 = a1[1];
  *(_OWORD *)token.val = *a1;
  *(_OWORD *)&token.val[4] = v5;
  double v6 = SecTaskCreateWithAuditToken(v4, &token);
  dispatch_time_t v7 = v6;
  if (!v6)
  {
    NSLog(&cfstr_UnableToCreate.isa, v3);
    CFBooleanRef v9 = 0;
    goto LABEL_10;
  }
  CFErrorRef error = 0;
  CFBooleanRef v8 = (void *)SecTaskCopyValueForEntitlement(v6, v3, &error);
  if (error)
  {
    NSLog(&cfstr_UnableToGetEnt.isa, v3, error);
    CFRelease(error);
    CFRelease(v7);
LABEL_8:
    CFBooleanRef v9 = 0;
    goto LABEL_9;
  }
  CFRelease(v7);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    NSLog(&cfstr_UnableToGetAnA.isa, v3);
    goto LABEL_8;
  }
  CFBooleanRef v9 = v8;
  CFBooleanRef v8 = 0;
LABEL_9:

LABEL_10:
  return v9;
}

void sub_1B72BE280(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id WBSApplicationIdentifierFromAuditToken(_OWORD *a1)
{
  CFAllocatorRef v1 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  long long v2 = a1[1];
  *(_OWORD *)v9.val = *a1;
  *(_OWORD *)&v9.val[4] = v2;
  int v3 = SecTaskCreateWithAuditToken(v1, &v9);
  CFAllocatorRef v4 = v3;
  if (v3)
  {
    long long v5 = (void *)SecTaskCopyValueForEntitlement(v3, @"application-identifier", 0);
    CFRelease(v4);
  }
  else
  {
    long long v5 = 0;
  }
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if (isKindOfClass) {
    dispatch_time_t v7 = 0;
  }
  else {
    dispatch_time_t v7 = v5;
  }
  if ((isKindOfClass & 1) == 0) {
    long long v5 = 0;
  }

  return v5;
}

void sub_1B72BE358(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id WBSTeamIdentifierFromAuditToken(_OWORD *a1)
{
  CFAllocatorRef v1 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  long long v2 = a1[1];
  *(_OWORD *)v6.val = *a1;
  *(_OWORD *)&v6.val[4] = v2;
  SecTaskRef v3 = SecTaskCreateWithAuditToken(v1, &v6);
  if (v3)
  {
    CFAllocatorRef v4 = (void *)SecTaskCopyTeamIdentifier();
    CFRelease(v3);
  }
  else
  {
    CFAllocatorRef v4 = 0;
  }
  return v4;
}

void sub_1B72BE3FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id WBSAuthenticationServicesAgentCredentialSharingGroupsUserNotificationsInterface()
{
  if (WBSAuthenticationServicesAgentCredentialSharingGroupsUserNotificationsInterface_onceToken != -1) {
    dispatch_once(&WBSAuthenticationServicesAgentCredentialSharingGroupsUserNotificationsInterface_onceToken, &__block_literal_global_1);
  }
  uint64_t v0 = (void *)WBSAuthenticationServicesAgentCredentialSharingGroupsUserNotificationsInterface_interface;
  return v0;
}

void __WBSAuthenticationServicesAgentCredentialSharingGroupsUserNotificationsInterface_block_invoke()
{
  v9[2] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F108A998];
  CFAllocatorRef v1 = (void *)WBSAuthenticationServicesAgentCredentialSharingGroupsUserNotificationsInterface_interface;
  WBSAuthenticationServicesAgentCredentialSharingGroupsUserNotificationsInterface_interface = v0;

  long long v2 = (void *)MEMORY[0x1E4F1CAD0];
  v9[0] = objc_opt_class();
  v9[1] = objc_opt_class();
  SecTaskRef v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:2];
  CFAllocatorRef v4 = [v2 setWithArray:v3];

  [(id)WBSAuthenticationServicesAgentCredentialSharingGroupsUserNotificationsInterface_interface setClasses:v4 forSelector:sel_groupsUpdatedWithInfos_ argumentIndex:0 ofReply:0];
  [(id)WBSAuthenticationServicesAgentCredentialSharingGroupsUserNotificationsInterface_interface setClasses:v4 forSelector:sel_groupsUpdatedWithInfos_shouldForceShowingNotifications_completionHandler_ argumentIndex:0 ofReply:0];
  long long v5 = (void *)MEMORY[0x1E4F1CAD0];
  v8[0] = objc_opt_class();
  v8[1] = objc_opt_class();
  audit_token_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:2];
  dispatch_time_t v7 = [v5 setWithArray:v6];

  [(id)WBSAuthenticationServicesAgentCredentialSharingGroupsUserNotificationsInterface_interface setClasses:v7 forSelector:sel_fetchSharingGroupsThatIncludeFamilyMembers_ argumentIndex:0 ofReply:1];
}

void sub_1B72BE7B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void OUTLINED_FUNCTION_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

uint64_t OUTLINED_FUNCTION_2()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_3()
{
  return v0;
}

id OUTLINED_FUNCTION_4_0(uint64_t a1, void *a2)
{
  return a2;
}

id OUTLINED_FUNCTION_5(uint64_t a1, void *a2)
{
  return a2;
}

__CFString *WBSAuthenticationServicesAgentAutoFillServiceName()
{
  return @"com.apple.AuthenticationServices.AutoFill";
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

void sub_1B72C25AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 64), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

void sub_1B72C2A14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B72C2B7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B72C2CE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B72C2E4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B72C2FC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B72C3118(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B72C32B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id WBSCloudBookmarksMigrationCoordinatorLogsDirectoryURL(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [@"CloudBookmarksMigrationCoordinator" stringByAppendingPathComponent:@"Logs"];
  SecTaskRef v3 = [v1 URLByAppendingPathComponent:v2 isDirectory:1];

  return v3;
}

__CFString *stringFromLocalMigrationState(uint64_t a1)
{
  if ((unint64_t)(a1 + 1) > 4) {
    return @"Unexpected Value";
  }
  else {
    return off_1E615A8A0[a1 + 1];
  }
}

__CFString *stringFromRemoteMigrationState(uint64_t a1)
{
  if ((unint64_t)(a1 + 1) > 3) {
    return @"Unexpected Value";
  }
  else {
    return off_1E615A8C8[a1 + 1];
  }
}

void OUTLINED_FUNCTION_1_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void *__Block_byref_object_copy__1(uint64_t a1, uint64_t a2)
{
  uint64_t result = _Block_copy(*(const void **)(a2 + 40));
  *(void *)(a1 + 40) = result;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
}

void sub_1B72C5E78(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B72C5F2C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B72C5FC0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B72C604C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B72C6158(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B72C6258(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B72C6534(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1B72C67C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11)
{
  _Unwind_Resume(a1);
}

void sub_1B72C6894(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B72C6950(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B72C69DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B72C6B74(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B72C6CDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1B72C6D74(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B72C6E1C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B72C6FEC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B72C70B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B72C72D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)WBSCoalescedAsynchronousWriter;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void __clang_call_terminate(void *a1)
{
}

void sub_1B72C74E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B72C7680(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B72C7864(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B72C790C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B72C7B48(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B72C7CC8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B72C7DDC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B72C802C(_Unwind_Exception *a1)
{
  MEMORY[0x1BA9BC7E0](v1, 0x1080C40D2F62047);
  _Unwind_Resume(a1);
}

void sub_1B72C81D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B72C8364(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B72C84F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

id *std::unique_ptr<SafariShared::SuddenTerminationDisabler>::reset[abi:sn180100](id **a1, id *a2)
{
  uint64_t result = *a1;
  *a1 = a2;
  if (result)
  {
    SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(result);
    JUMPOUT(0x1BA9BC7E0);
  }
  return result;
}

void sub_1B72C880C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B72C8968(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_1B72C8A80(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B72C8D4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, uint64_t a11, void *a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

uint64_t WBS_LOG_CHANNEL_PREFIXAppleAccount()
{
  if (WBS_LOG_CHANNEL_PREFIXAppleAccount_onceToken != -1) {
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXAppleAccount_onceToken, &__block_literal_global_4);
  }
  return WBS_LOG_CHANNEL_PREFIXAppleAccount_log;
}

uint64_t WBS_LOG_CHANNEL_PREFIXAutoFill()
{
  if (WBS_LOG_CHANNEL_PREFIXAutoFill_onceToken != -1) {
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXAutoFill_onceToken, &__block_literal_global_4);
  }
  return WBS_LOG_CHANNEL_PREFIXAutoFill_log;
}

uint64_t WBS_LOG_CHANNEL_PREFIXCoalescedAsynchronousWriter()
{
  if (WBS_LOG_CHANNEL_PREFIXCoalescedAsynchronousWriter_onceToken != -1) {
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXCoalescedAsynchronousWriter_onceToken, &__block_literal_global_7);
  }
  return WBS_LOG_CHANNEL_PREFIXCoalescedAsynchronousWriter_log;
}

uint64_t WBS_LOG_CHANNEL_PREFIXDebugUtilities()
{
  if (WBS_LOG_CHANNEL_PREFIXDebugUtilities_onceToken != -1) {
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXDebugUtilities_onceToken, &__block_literal_global_10);
  }
  return WBS_LOG_CHANNEL_PREFIXDebugUtilities_log;
}

uint64_t WBS_LOG_CHANNEL_PREFIXFileManager()
{
  if (WBS_LOG_CHANNEL_PREFIXFileManager_onceToken != -1) {
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXFileManager_onceToken, &__block_literal_global_16_0);
  }
  return WBS_LOG_CHANNEL_PREFIXFileManager_log;
}

uint64_t WBS_LOG_CHANNEL_PREFIXKeyedArchiver()
{
  if (WBS_LOG_CHANNEL_PREFIXKeyedArchiver_onceToken != -1) {
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXKeyedArchiver_onceToken, &__block_literal_global_22_0);
  }
  return WBS_LOG_CHANNEL_PREFIXKeyedArchiver_log;
}

uint64_t WBS_LOG_CHANNEL_PREFIXMissingPasswordGroups()
{
  if (WBS_LOG_CHANNEL_PREFIXMissingPasswordGroups_onceToken != -1) {
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXMissingPasswordGroups_onceToken, &__block_literal_global_25);
  }
  return WBS_LOG_CHANNEL_PREFIXMissingPasswordGroups_log;
}

uint64_t WBS_LOG_CHANNEL_PREFIXOther()
{
  if (WBS_LOG_CHANNEL_PREFIXOther_onceToken != -1) {
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXOther_onceToken, &__block_literal_global_28);
  }
  return WBS_LOG_CHANNEL_PREFIXOther_log;
}

uint64_t WBS_LOG_CHANNEL_PREFIXPinnedTabRestoration()
{
  if (WBS_LOG_CHANNEL_PREFIXPinnedTabRestoration_onceToken != -1) {
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXPinnedTabRestoration_onceToken, &__block_literal_global_34);
  }
  return WBS_LOG_CHANNEL_PREFIXPinnedTabRestoration_log;
}

uint64_t WBS_LOG_CHANNEL_PREFIXSandbox()
{
  if (WBS_LOG_CHANNEL_PREFIXSandbox_onceToken != -1) {
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXSandbox_onceToken, &__block_literal_global_40);
  }
  return WBS_LOG_CHANNEL_PREFIXSandbox_log;
}

uint64_t WBS_LOG_CHANNEL_PREFIXSQLiteStore()
{
  if (WBS_LOG_CHANNEL_PREFIXSQLiteStore_onceToken != -1) {
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXSQLiteStore_onceToken, &__block_literal_global_46);
  }
  return WBS_LOG_CHANNEL_PREFIXSQLiteStore_log;
}

uint64_t WBS_LOG_CHANNEL_PREFIXXPC()
{
  if (WBS_LOG_CHANNEL_PREFIXXPC_onceToken != -1) {
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXXPC_onceToken, &__block_literal_global_58);
  }
  return WBS_LOG_CHANNEL_PREFIXXPC_log;
}

uint64_t WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness()
{
  if (WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness_onceToken != -1) {
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness_onceToken, &__block_literal_global_61);
  }
  return WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness_log;
}

uint64_t WBS_LOG_CHANNEL_PREFIXExport()
{
  if (WBS_LOG_CHANNEL_PREFIXExport_onceToken != -1) {
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXExport_onceToken, &__block_literal_global_64);
  }
  return WBS_LOG_CHANNEL_PREFIXExport_log;
}

uint64_t WBS_LOG_CHANNEL_PREFIXImport()
{
  if (WBS_LOG_CHANNEL_PREFIXImport_onceToken != -1) {
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXImport_onceToken, &__block_literal_global_67);
  }
  return WBS_LOG_CHANNEL_PREFIXImport_log;
}

void sub_1B72C9AA8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B72C9C10(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B72C9CAC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B72C9E0C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B72CA0B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B72CA230(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B72CA3D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B72CA4B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B72CA9D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B72CAAEC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B72CABB0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B72CAC24(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B72CACB0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B72CAD30(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B72CADBC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B72CAE2C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B72CAE94(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B72CAF5C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B72CB090(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B72CB194(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B72CB4E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20)
{
  _Block_object_dispose(&a15, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2(uint64_t a1)
{
}

void sub_1B72CB5E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B72CB6C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B72CB77C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B72CB868(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B72CB954(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B72CBB58(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B72CBC0C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B72CBE74(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B72CBF98(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B72CC138(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B72CC3C4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B72CC974(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, void *a13, void *a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_1B72CCC08(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B72CCD78(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B72CCE90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B72CCF1C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B72CCF88(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B72CD144(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B72CD264(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20)
{
  _Unwind_Resume(a1);
}

void sub_1B72CD65C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B72CD6F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B72CD7A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B72CD914(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B72CD9D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  uint64_t v12 = v11;

  _Unwind_Resume(a1);
}

uint64_t enumeratePossibleURLsForUserTypedStringWithBlockInternal(void *a1, void *a2)
{
  id v3 = a1;
  CFAllocatorRef v4 = a2;
  uint64_t v5 = objc_msgSend(v3, "safari_stringByRemovingUnnecessaryCharactersFromUserTypedURLString");
  if (![v5 length])
  {
    uint64_t v10 = 0;
    goto LABEL_47;
  }
  char v18 = 0;
  id v6 = v5;
  unint64_t v7 = [v6 rangeOfString:@":"];
  unint64_t v8 = [v6 rangeOfString:@"/"];
  if (v7 != 0x7FFFFFFFFFFFFFFFLL && (v8 == 0x7FFFFFFFFFFFFFFFLL || v8 >= v7))
  {
    if ((objc_msgSend(v6, "safari_hasCaseInsensitivePrefix:", @"http:") & 1) != 0
      || (objc_msgSend(v6, "safari_hasCaseInsensitivePrefix:", @"https:") & 1) != 0
      || (objc_msgSend(v6, "safari_hasCaseInsensitivePrefix:", @"file:") & 1) != 0
      || (objc_msgSend(v6, "safari_hasCaseInsensitivePrefix:", @"ftp:") & 1) != 0
      || (objc_msgSend(v6, "safari_hasCaseInsensitivePrefix:", @"javascript:") & 1) != 0
      || (objc_msgSend(v6, "safari_hasCaseInsensitivePrefix:", @"about:") & 1) != 0
      || [v6 length] <= v7 + 1)
    {
    }
    else
    {
      LODWORD(v7) = objc_msgSend(v6, "characterAtIndex:") - 58;

      if ((unsigned __int16)v7 > 0xFFF5u) {
        goto LABEL_6;
      }
    }
    uint64_t v14 = objc_msgSend(MEMORY[0x1E4F1CB10], "safari_URLWithUserTypedString:", v6);
    if (v14)
    {
      v4[2](v4, v14, &v18);
      LOBYTE(v7) = v18 != 0;
    }

    uint64_t v10 = (v14 != 0) & v7;
    goto LABEL_47;
  }

LABEL_6:
  if (objc_msgSend(v6, "safari_hasCaseInsensitivePrefix:", @"www."))
  {
    audit_token_t v9 = urlWithAddedComponents((NSString *)v6, 1);
    if (v9) {
      goto LABEL_45;
    }
    goto LABEL_46;
  }
  unint64_t v11 = [v3 rangeOfString:@"/"];
  unint64_t v12 = [v3 rangeOfString:@"@"];
  if (v12 != 0x7FFFFFFFFFFFFFFFLL && (v11 == 0x7FFFFFFFFFFFFFFFLL || v12 < v11))
  {
    audit_token_t v9 = urlWithAddedComponents((NSString *)v6, 1);
    if (v9) {
      goto LABEL_45;
    }
    goto LABEL_46;
  }
  unint64_t v13 = [v3 rangeOfString:@"."];
  if (v13 != 0x7FFFFFFFFFFFFFFFLL && (v11 == 0x7FFFFFFFFFFFFFFFLL || v13 < v11))
  {
    uint64_t v15 = urlWithAddedComponents((NSString *)v6, 1);
    if (v15) {
      v4[2](v4, v15, &v18);
    }

    if (!v18)
    {
      audit_token_t v9 = urlWithAddedComponents((NSString *)v6, 3);
      if (v9) {
        goto LABEL_45;
      }
      goto LABEL_46;
    }
  }
  else
  {
    if ((objc_msgSend(v6, "safari_isCaseInsensitiveEqualToString:", @"localhost") & 1) != 0
      || objc_msgSend(v6, "safari_hasCaseInsensitivePrefix:", @"localhost/"))
    {
      audit_token_t v9 = urlWithAddedComponents((NSString *)v6, 1);
      if (v9) {
        goto LABEL_45;
      }
      goto LABEL_46;
    }
    uint64_t v16 = urlWithAddedComponents((NSString *)v6, 1);
    if (v16) {
      v4[2](v4, v16, &v18);
    }

    if (!v18)
    {
      audit_token_t v9 = urlWithAddedComponents((NSString *)v6, 7);
      if (v9) {
LABEL_45:
      }
        v4[2](v4, v9, &v18);
LABEL_46:

      uint64_t v10 = v18 != 0;
      goto LABEL_47;
    }
  }
  uint64_t v10 = 1;
LABEL_47:

  return v10;
}

void sub_1B72CDE04(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B72CDE94()
{
}

void sub_1B72CE024(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B72CE1B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B72CE314(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B72CE3DC(_Unwind_Exception *a1)
{
  CFAllocatorRef v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1B72CE4C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B72CE59C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B72CE610(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B72CE6BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B72CE980(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B72CEA28(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B72CEA98(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B72CEB48(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B72CEBE8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B72CEF18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_1B72CF0A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B72CF100(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B72CF200(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B72CF3D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL fileExists(NSURL *a1)
{
  id v1 = [(NSURL *)a1 path];
  BOOL v2 = lstat((const char *)[v1 fileSystemRepresentation], &v4) == 0;

  return v2;
}

void sub_1B72CF46C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B72CF4E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

id urlWithAddedComponents(NSString *a1, uint64_t a2)
{
  id v3 = a1;
  if ([(NSString *)v3 length] && [(NSString *)v3 characterAtIndex:0] != 47)
  {
    uint64_t v5 = (__CFString *)[(NSString *)v3 mutableCopy];
    id v6 = v5;
    if (a2)
    {
      [(__CFString *)v5 insertString:@"http://" atIndex:0];
      a2 &= ~1uLL;
    }
    if (a2)
    {
      uint64_t v7 = [(__CFString *)v6 rangeOfString:@"://"];
      uint64_t v8 = v7;
      if (v7 != 0x7FFFFFFFFFFFFFFFLL)
      {
        if ((a2 & 2) != 0) {
          [(__CFString *)v6 insertString:@"www." atIndex:v7 + 3];
        }
        if ((a2 & 4) != 0)
        {
          uint64_t v9 = v8 + 3;
          uint64_t v10 = [(__CFString *)v6 length] - v8 - 3;
          uint64_t v11 = [(__CFString *)v6 rangeOfString:@":", 0, v9, v10 options range];
          if (v11 == 0x7FFFFFFFFFFFFFFFLL)
          {
            uint64_t v11 = [(__CFString *)v6 rangeOfString:@"/", 0, v9, v10 options range];
            if (v11 == 0x7FFFFFFFFFFFFFFFLL) {
              uint64_t v11 = [(__CFString *)v6 length];
            }
          }
          v14.location = v11 - 4;
          v14.length = 4;
          if (CFStringCompareWithOptions(v6, @".com", v14, 1uLL)) {
            [(__CFString *)v6 insertString:@".com" atIndex:v11];
          }
        }
      }
    }
    stat v4 = objc_msgSend(MEMORY[0x1E4F1CB10], "safari_URLWithUserTypedString:", v6);
  }
  else
  {
    stat v4 = 0;
  }

  return v4;
}

void sub_1B72CF6D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL WBSCurrentPasswordSavingBehavior()
{
  uint64_t v0 = objc_msgSend(MEMORY[0x1E4F1CB18], "pm_defaults");
  id v1 = objc_msgSend(v0, "safari_numberForKey:", @"PasswordSavingBehavior");

  BOOL v2 = [v1 integerValue] == 1;
  return v2;
}

void WBSReportThreadLocationAndSleep(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v6 = WBS_LOG_CHANNEL_PREFIXDebugUtilities();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    WBSReportThreadLocationAndSleep_cold_1(v6);
  }
  uint64_t v7 = WBS_LOG_CHANNEL_PREFIXDebugUtilities();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446722;
    *(void *)&buf[4] = a1;
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = a2;
    *(_WORD *)&buf[18] = 2080;
    *(void *)&buf[20] = a3;
    _os_log_error_impl(&dword_1B728F000, v7, OS_LOG_TYPE_ERROR, "\t at %{public}s(%d) : %s\n", buf, 0x1Cu);
  }
  while (1)
  {
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v18 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v13 = 0u;
    memset(buf, 0, sizeof(buf));
    *(void *)uint64_t v9 = 0xE00000001;
    int v10 = 1;
    pid_t v11 = getpid();
    size_t v8 = 648;
    if (sysctl(v9, 4u, buf, &v8, 0, 0) != -1 && (v13 & 0x800) != 0) {
      break;
    }
    sleep(1u);
  }
  __break(0);
  JUMPOUT(0x1B72D025CLL);
}

void WBSLogWithDifferentialPrivacy(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if ([v4 length])
  {
    uint64_t v5 = [@"com.apple.safari." stringByAppendingString:v3];
    id v6 = (void *)[v4 copy];

    if (loggingQueue(void)::onceToken != -1) {
      dispatch_once(&loggingQueue(void)::onceToken, &__block_literal_global_9);
    }
    uint64_t v7 = loggingQueue(void)::loggingQueue;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    int v9[2] = __WBSLogWithDifferentialPrivacy_block_invoke;
    void v9[3] = &unk_1E6159900;
    id v10 = v5;
    id v4 = v6;
    id v11 = v4;
    id v8 = v5;
    dispatch_async(v7, v9);
  }
}

void sub_1B72D1450(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void __WBSLogWithDifferentialPrivacy_block_invoke(uint64_t a1)
{
  v6[1] = *MEMORY[0x1E4F143B8];
  id v2 = *(id *)(a1 + 32);
  {
    id v3 = (id)stringRecorderForKey(NSString *)::recorders;
  }
  else
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    stringRecorderForKey(NSString *)::recorders = (uint64_t)v3;
  }
  id v4 = [v3 objectForKeyedSubscript:v2];
  if (!v4)
  {
    id v4 = (void *)[objc_alloc(MEMORY[0x1E4F5F488]) initWithKey:v2];
    [(id)stringRecorderForKey(NSString *)::recorders setObject:v4 forKeyedSubscript:v2];
  }

  v6[0] = *(void *)(a1 + 40);
  uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
  [v4 record:v5];
}

void sub_1B72D159C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void ___ZL12loggingQueuev_block_invoke()
{
  id v2 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.Safari.WBSDifferentialPrivacyLogger", v2);
  id v1 = (void *)loggingQueue(void)::loggingQueue;
  loggingQueue(void)::loggingQueue = (uint64_t)v0;
}

void WBSDispatchGroupNotifyWithTimeout(void *a1, void *a2, void *a3, double a4)
{
  id v7 = a3;
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x2020000000;
  char v25 = 0;
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x3032000000;
  v22[3] = __Block_byref_object_copy__3;
  v22[4] = __Block_byref_object_dispose__3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __WBSDispatchGroupNotifyWithTimeout_block_invoke;
  aBlock[3] = &unk_1E615ADA0;
  id v20 = v7;
  long long v21 = v24;
  id v8 = v7;
  uint64_t v9 = a2;
  id v10 = a1;
  id v23 = _Block_copy(aBlock);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __WBSDispatchGroupNotifyWithTimeout_block_invoke_2;
  block[3] = &unk_1E6159628;
  void block[4] = v22;
  dispatch_block_t v11 = dispatch_block_create(DISPATCH_BLOCK_INHERIT_QOS_CLASS, block);
  dispatch_group_notify(v10, v9, v11);

  dispatch_time_t v12 = dispatch_time(0, (uint64_t)(a4 * 1000000000.0));
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __WBSDispatchGroupNotifyWithTimeout_block_invoke_3;
  v14[3] = &unk_1E615ADC8;
  long long v16 = v24;
  long long v17 = v22;
  id v15 = v11;
  id v13 = v11;
  dispatch_after(v12, v9, v14);

  _Block_object_dispose(v22, 8);
  _Block_object_dispose(v24, 8);
}

void *__Block_byref_object_copy__3(uint64_t a1, uint64_t a2)
{
  uint64_t result = _Block_copy(*(const void **)(a2 + 40));
  *(void *)(a1 + 40) = result;
  return result;
}

void __Block_byref_object_dispose__3(uint64_t a1)
{
}

uint64_t __WBSDispatchGroupNotifyWithTimeout_block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(*(void *)(result + 40) + 8);
  if (!*(unsigned char *)(v1 + 24))
  {
    *(unsigned char *)(v1 + 24) = 1;
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
  }
  return result;
}

uint64_t __WBSDispatchGroupNotifyWithTimeout_block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

void __WBSDispatchGroupNotifyWithTimeout_block_invoke_3(void *a1)
{
  if (!*(unsigned char *)(*(void *)(a1[5] + 8) + 24)) {
    (*(void (**)(void))(*(void *)(*(void *)(a1[6] + 8) + 40) + 16))();
  }
  uint64_t v2 = *(void *)(a1[6] + 8);
  id v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;

  id v4 = (void *)a1[4];
  dispatch_block_cancel(v4);
}

id WBSReadExactAmountOfBytesFromFileDescriptorAsNSData(int a1, size_t a2, void *a3)
{
  id v6 = (id) [objc_alloc(MEMORY[0x1E4F1CA58]) initWithLength:a2];
  size_t v7 = WBSReadExactAmountOfBytesFromFileDescriptor(a1, (char *)[v6 mutableBytes], a2);
  if ((v7 & 0x8000000000000000) != 0)
  {
    if (a3)
    {
      [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:*__error() userInfo:0];
      id v8 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
  }
  else if (v7)
  {
    id v8 = v6;
    goto LABEL_7;
  }
  id v8 = 0;
LABEL_7:

  return v8;
}

ssize_t WBSWriteExactAmountOfBytesToFileDescriptor(int __fd, char *__buf, size_t __nbyte)
{
  ssize_t result = 0;
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (!__buf) {
    return result;
  }
  size_t v5 = __nbyte;
  if (!__nbyte) {
    return result;
  }
  id v6 = __buf;
  while (1)
  {
    ssize_t result = write(__fd, v6, v5);
    if (v5 == result) {
      return v5;
    }
    if (!result) {
      return result;
    }
    if (result < 0) {
      break;
    }
    v6 += result;
    v5 -= result;
LABEL_11:
    if (!v5) {
      return 0;
    }
  }
  int v7 = *__error();
  id v8 = WBS_LOG_CHANNEL_PREFIXOther();
  uint64_t v9 = v8;
  if (v7 == 4)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      int v11 = __fd;
      _os_log_impl(&dword_1B728F000, v9, OS_LOG_TYPE_INFO, "Interrupted while writing to file descriptor %d; trying again",
        buf,
        8u);
    }
    goto LABEL_11;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    WBSWriteExactAmountOfBytesToFileDescriptor_cold_1(v9, __fd);
  }
  return -1;
}

void sub_1B72D37F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B72D3DE8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__4(uint64_t a1)
{
}

void OUTLINED_FUNCTION_1_1(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

uint64_t __Block_byref_object_copy__5(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__5(uint64_t a1)
{
}

void sub_1B72D5F80(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t ___ZL23MobileKeyBagLibraryCorePPc_block_invoke()
{
  uint64_t result = _sl_dlopen();
  MobileKeyBagLibraryCore(char **)::frameworkLibrary = result;
  return result;
}

void sub_1B72D618C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B72D6220(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1B72D62AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  id v10 = v9;

  a9.super_class = (Class)WBSKeychainCredentialNotificationMonitor;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_1B72D68A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B72D6974(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B72D6AE8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B72D8344(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, __CFString *a11)
{
  if (a2)
  {
    objc_begin_catch(exception_object);
    if (v11)
    {
      uint64_t v12 = (void *)MEMORY[0x1E4F28C58];
      a10 = *MEMORY[0x1E4F28568];
      a11 = @"Invalid JSON object";
      id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&a11 forKeys:&a10 count:1];
      *int v11 = [v12 errorWithDomain:@"com.apple.Safari.Core.WBSJSONWriterErrorDomain" code:7 userInfo:v13];
    }
    objc_end_catch();
    JUMPOUT(0x1B72D82F8);
  }
  _Unwind_Resume(exception_object);
}

BOOL WBSKeychainItemExists(void *a1, void *a2, void *a3, _DWORD *a4)
{
  int PasswordAndItem = getPasswordAndItem(a1, a2, a3, 0, 1, 0);
  if (a4) {
    *a4 = PasswordAndItem;
  }
  return PasswordAndItem == 0;
}

uint64_t getPasswordAndItem(void *a1, void *a2, void *a3, void *a4, char a5, void *a6)
{
  v36[5] = *MEMORY[0x1E4F143B8];
  id v11 = a1;
  id v12 = a2;
  id v13 = a3;
  uint64_t v14 = *MEMORY[0x1E4F3B988];
  uint64_t v15 = *MEMORY[0x1E4F3B850];
  v35[0] = *MEMORY[0x1E4F3B978];
  v35[1] = v15;
  v36[0] = v14;
  v36[1] = v12;
  uint64_t v16 = *MEMORY[0x1E4F3B5C0];
  uint64_t v17 = *MEMORY[0x1E4F3BC70];
  v35[2] = *MEMORY[0x1E4F3B5C0];
  v35[3] = v17;
  uint64_t v18 = *MEMORY[0x1E4F1CFD0];
  v36[2] = v13;
  v36[3] = v18;
  v35[4] = *MEMORY[0x1E4F3BC78];
  v36[4] = v18;
  long long v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v36 forKeys:v35 count:5];
  id v20 = (void *)[v19 mutableCopy];

  if (v11) {
    [v20 setObject:v11 forKeyedSubscript:*MEMORY[0x1E4F3B550]];
  }
  long long v21 = [NSNumber numberWithInt:v11 != 0];
  [v20 setObject:v21 forKeyedSubscript:*MEMORY[0x1E4F3B878]];

  if ((a5 & 2) != 0) {
    [v20 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F3BD08]];
  }
  CFTypeRef result = 0;
  uint64_t v22 = SecItemCopyMatching((CFDictionaryRef)v20, &result);
  if (v22 == -34018)
  {
    if ((a5 & 1) == 0)
    {
      uint64_t v22 = 4294933278;
LABEL_12:
      if (a4) {
        *a4 = 0;
      }
      if (v22 == -25300)
      {
        long long v29 = WBS_LOG_CHANNEL_PREFIXKeychain();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138543875;
          *(void *)long long v34 = v11;
          *(_WORD *)&v34[8] = 2114;
          *(void *)&v34[10] = v12;
          *(_WORD *)&v34[18] = 2113;
          *(void *)&v34[20] = v13;
          _os_log_impl(&dword_1B728F000, v29, OS_LOG_TYPE_INFO, "SecItemCopyMatching failed: Item not found; accessGroup: %{public}@, service: %{public}@, account: %{private}@",
            buf,
            0x20u);
        }
        uint64_t v22 = 4294941996;
      }
      else if (v22 == -128)
      {
        char v25 = WBS_LOG_CHANNEL_PREFIXKeychain();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138543875;
          *(void *)long long v34 = v11;
          *(_WORD *)&v34[8] = 2114;
          *(void *)&v34[10] = v12;
          *(_WORD *)&v34[18] = 2113;
          *(void *)&v34[20] = v13;
          _os_log_impl(&dword_1B728F000, v25, OS_LOG_TYPE_INFO, "SecItemCopyMatching failed: User canceled; accessGroup: %{public}@, service: %{public}@, account: %{private}@",
            buf,
            0x20u);
        }
        uint64_t v22 = 4294967168;
      }
      else
      {
        long long v30 = WBS_LOG_CHANNEL_PREFIXKeychain();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109891;
          *(_DWORD *)long long v34 = v22;
          *(_WORD *)&v34[4] = 2114;
          *(void *)&v34[6] = v11;
          *(_WORD *)&v34[14] = 2114;
          *(void *)&v34[16] = v12;
          *(_WORD *)&v34[24] = 2113;
          *(void *)&v34[26] = v13;
          _os_log_error_impl(&dword_1B728F000, v30, OS_LOG_TYPE_ERROR, "SecItemCopyMatching failed with error %d; accessGroup: %{public}@, service: %{public}@, account: %{private}@",
            buf,
            0x26u);
        }
      }
      goto LABEL_31;
    }
    id v23 = WBS_LOG_CHANNEL_PREFIXKeychain();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543875;
      *(void *)long long v34 = v11;
      *(_WORD *)&v34[8] = 2114;
      *(void *)&v34[10] = v12;
      *(_WORD *)&v34[18] = 2113;
      *(void *)&v34[20] = v13;
      _os_log_error_impl(&dword_1B728F000, v23, OS_LOG_TYPE_ERROR, "SecItemCopyMatching failed: Missing entitlement. Falling back to legacy keychain; accessGroup: %{public}@, servi"
        "ce: %{public}@, account: %{private}@",
        buf,
        0x20u);
    }
    [v20 removeObjectForKey:*MEMORY[0x1E4F3BD08]];
    long long v24 = [v13 stringByAppendingString:@"ForWebKitDevelopment"];
    [v20 setObject:v24 forKeyedSubscript:v16];

    uint64_t v22 = SecItemCopyMatching((CFDictionaryRef)v20, &result);
  }
  if (v22) {
    goto LABEL_12;
  }
  long long v26 = WBS_LOG_CHANNEL_PREFIXKeychain();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543875;
    *(void *)long long v34 = v11;
    *(_WORD *)&v34[8] = 2114;
    *(void *)&v34[10] = v12;
    *(_WORD *)&v34[18] = 2113;
    *(void *)&v34[20] = v13;
    _os_log_debug_impl(&dword_1B728F000, v26, OS_LOG_TYPE_DEBUG, "SecItemCopyMatching succeeded; accessGroup: %{public}@, service: %{public}@, account: %{private}@",
      buf,
      0x20u);
  }
  long long v27 = (void *)result;
  if (a4)
  {
    *a4 = [(id)result objectForKey:*MEMORY[0x1E4F3BD38]];
  }
  if (a6)
  {
    long long v28 = [v27 objectForKey:*MEMORY[0x1E4F3BD40]];
    *a6 = (id)[v28 copy];
  }
  uint64_t v22 = 0;
LABEL_31:

  return v22;
}

uint64_t WBSGetKeychainPassword(void *a1, void *a2, void *a3, void *a4)
{
  return getPasswordAndItem(a1, a2, a3, a4, 1, 0);
}

uint64_t WBSGetKeychainData(void *a1, void *a2, void *a3, char a4, void *a5)
{
  return getPasswordAndItem(a1, a2, a3, a5, a4, 0);
}

BOOL WBSSetKeychainData(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, char a7, void *a8)
{
  uint64_t v79 = *MEMORY[0x1E4F143B8];
  id v15 = a1;
  id v16 = a2;
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v20 = a6;
  id v67 = 0;
  int PasswordAndItem = getPasswordAndItem(v15, v16, v17, 0, a7, &v67);
  CFDictionaryRef v22 = (const __CFDictionary *)v67;
  CFDictionaryRef v23 = v22;
  if (!PasswordAndItem)
  {
    v66 = a8;
    uint64_t v42 = *MEMORY[0x1E4F3B978];
    v71[0] = *MEMORY[0x1E4F3BD40];
    v71[1] = v42;
    uint64_t v43 = *MEMORY[0x1E4F3B988];
    v72[0] = v22;
    v72[1] = v43;
    CFDictionaryRef v44 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v72 forKeys:v71 count:2];
    uint64_t v45 = *MEMORY[0x1E4F3B788];
    v69[0] = *MEMORY[0x1E4F3BD38];
    v69[1] = v45;
    id v65 = v18;
    v70[0] = v18;
    v70[1] = v19;
    v69[2] = *MEMORY[0x1E4F3B660];
    v70[2] = v20;
    CFDictionaryRef v46 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v70 forKeys:v69 count:3];
    int PasswordAndItem = SecItemUpdate(v44, v46);
    BOOL v47 = WBS_LOG_CHANNEL_PREFIXKeychain();
    v48 = v47;
    if (PasswordAndItem)
    {
      if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109891;
        *(_DWORD *)&uint8_t buf[4] = PasswordAndItem;
        *(_WORD *)&buf[8] = 2114;
        *(void *)&buf[10] = v15;
        *(_WORD *)&buf[18] = 2114;
        *(void *)&buf[20] = v16;
        *(_WORD *)&buf[28] = 2113;
        *(void *)&buf[30] = v17;
        _os_log_error_impl(&dword_1B728F000, v48, OS_LOG_TYPE_ERROR, "SecItemUpdate failed with error %d; accessGroup: %{public}@, service: %{public}@, account: %{private}@",
          buf,
          0x26u);
      }
    }
    else if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138543875;
      *(void *)&uint8_t buf[4] = v15;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v16;
      *(_WORD *)&buf[22] = 2113;
      *(void *)&buf[24] = v17;
      _os_log_debug_impl(&dword_1B728F000, v48, OS_LOG_TYPE_DEBUG, "SecItemUpdate succeeded; accessGroup: %{public}@, service: %{public}@, account: %{private}@",
        buf,
        0x20u);
    }

    goto LABEL_32;
  }
  if (PasswordAndItem != -25300) {
    goto LABEL_33;
  }
  v66 = a8;
  id v61 = v15;
  id v24 = v15;
  id v25 = v20;
  long long v26 = v19;
  id v27 = v24;
  id v28 = v16;
  id v29 = v17;
  id v65 = v18;
  id v30 = v18;
  v62 = v26;
  id v31 = v26;
  id v20 = v25;
  id v32 = v31;
  id v33 = v20;
  uint64_t v34 = *MEMORY[0x1E4F3B988];
  uint64_t v35 = *MEMORY[0x1E4F3B850];
  v75[0] = *MEMORY[0x1E4F3B978];
  v75[1] = v35;
  *(void *)buf = v34;
  *(void *)&buf[8] = v28;
  v63 = v28;
  uint64_t v36 = *MEMORY[0x1E4F3BD38];
  uint64_t v57 = *MEMORY[0x1E4F3B5C0];
  v75[2] = *MEMORY[0x1E4F3B5C0];
  v75[3] = v36;
  v64 = v29;
  *(void *)&buf[16] = v29;
  *(void *)&buf[24] = v30;
  long long v37 = v27;
  v60 = v30;
  uint64_t v38 = *MEMORY[0x1E4F3B660];
  v75[4] = *MEMORY[0x1E4F3B788];
  v75[5] = v38;
  id v58 = v33;
  v59 = v32;
  *(void *)&uint8_t buf[32] = v32;
  id v77 = v33;
  v75[6] = *MEMORY[0x1E4F3BC78];
  uint64_t v78 = *MEMORY[0x1E4F1CFD0];
  long long v39 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:v75 count:7];
  long long v40 = (void *)[v39 mutableCopy];

  if (v27) {
    [v40 setObject:v27 forKeyedSubscript:*MEMORY[0x1E4F3B550]];
  }
  long long v41 = [NSNumber numberWithInt:v27 != 0];
  [v40 setObject:v41 forKeyedSubscript:*MEMORY[0x1E4F3B878]];

  if ((a7 & 2) != 0)
  {
    [v40 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F3BD08]];
    if (!v27) {
      [v40 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F3B698]];
    }
  }
  CFTypeRef result = 0;
  int PasswordAndItem = SecItemAdd((CFDictionaryRef)v40, &result);
  id v15 = v61;
  id v19 = v62;
  if (PasswordAndItem == -34018)
  {
    if ((a7 & 1) == 0)
    {
      int PasswordAndItem = -34018;
      goto LABEL_24;
    }
    unint64_t v49 = WBS_LOG_CHANNEL_PREFIXKeychain();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v73 = 138543875;
      *(void *)v74 = v37;
      *(_WORD *)&v74[8] = 2114;
      *(void *)&v74[10] = v63;
      *(_WORD *)&v74[18] = 2113;
      *(void *)&v74[20] = v64;
      _os_log_error_impl(&dword_1B728F000, v49, OS_LOG_TYPE_ERROR, "SecItemAdd failed: Missing entitlement. Falling back to legacy keychain. accessGroup: %{public}@, service: %{public}@, account: %{private}@", v73, 0x20u);
    }
    [v40 removeObjectForKey:*MEMORY[0x1E4F3BD08]];
    [v40 removeObjectForKey:*MEMORY[0x1E4F3B698]];
    unint64_t v50 = [v64 stringByAppendingString:@"ForWebKitDevelopment"];
    [v40 setObject:v50 forKeyedSubscript:v57];

    int PasswordAndItem = SecItemAdd((CFDictionaryRef)v40, &result);
  }
  if (PasswordAndItem == -128)
  {
    uint64_t v54 = WBS_LOG_CHANNEL_PREFIXKeychain();
    if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)v73 = 138543875;
      *(void *)v74 = v37;
      *(_WORD *)&v74[8] = 2114;
      *(void *)&v74[10] = v63;
      *(_WORD *)&v74[18] = 2113;
      *(void *)&v74[20] = v64;
      _os_log_impl(&dword_1B728F000, v54, OS_LOG_TYPE_INFO, "SecItemAdd failed: User canceled; accessGroup: %{public}@, service: %{public}@, account: %{private}@",
        v73,
        0x20u);
    }
    uint64_t v53 = 0;
    int PasswordAndItem = -128;
    goto LABEL_31;
  }
  if (!PasswordAndItem)
  {
    v51 = WBS_LOG_CHANNEL_PREFIXKeychain();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)v73 = 138543875;
      *(void *)v74 = v37;
      *(_WORD *)&v74[8] = 2114;
      *(void *)&v74[10] = v63;
      *(_WORD *)&v74[18] = 2113;
      *(void *)&v74[20] = v64;
      _os_log_debug_impl(&dword_1B728F000, v51, OS_LOG_TYPE_DEBUG, "SecItemAdd succeeded; accessGroup: %{public}@, service: %{public}@, account: %{private}@",
        v73,
        0x20u);
    }
    uint64_t v53 = (id) result;

    int PasswordAndItem = 0;
    goto LABEL_31;
  }
LABEL_24:
  CFDictionaryRef v52 = WBS_LOG_CHANNEL_PREFIXKeychain();
  if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)v73 = 67109891;
    *(_DWORD *)v74 = PasswordAndItem;
    *(_WORD *)&v74[4] = 2114;
    *(void *)&v74[6] = v37;
    *(_WORD *)&v74[14] = 2114;
    *(void *)&v74[16] = v63;
    *(_WORD *)&v74[24] = 2113;
    *(void *)&v74[26] = v64;
    _os_log_error_impl(&dword_1B728F000, v52, OS_LOG_TYPE_ERROR, "SecItemAdd failed with error %d; accessGroup: %{public}@, service: %{public}@, account: %{private}@",
      v73,
      0x26u);
  }
  uint64_t v53 = 0;
LABEL_31:

  CFDictionaryRef v55 = v53;
  CFDictionaryRef v44 = v23;
  CFDictionaryRef v23 = v55;
LABEL_32:

  id v18 = v65;
  a8 = v66;
LABEL_33:
  if (a8) {
    *a8 = v23;
  }

  return PasswordAndItem == 0;
}

BOOL WBSSetKeychainPassword(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7)
{
  return WBSSetKeychainData(a1, a2, a3, a4, a5, a6, 1, a7);
}

BOOL WBSRemoveKeychainData(void *a1, void *a2, void *a3, char a4)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v7 = a1;
  id v8 = a2;
  id v9 = a3;
  int v10 = removeKeychainData(v7, v8, v9, a4);
  id v11 = WBS_LOG_CHANNEL_PREFIXKeychain();
  id v12 = v11;
  if (v10)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v14 = 67109891;
      *(_DWORD *)id v15 = v10;
      *(_WORD *)&v15[4] = 2114;
      *(void *)&v15[6] = v7;
      *(_WORD *)&v15[14] = 2114;
      *(void *)&v15[16] = v8;
      *(_WORD *)&v15[24] = 2113;
      *(void *)&v15[26] = v9;
      _os_log_error_impl(&dword_1B728F000, v12, OS_LOG_TYPE_ERROR, "SecItemDelete failed with error %d; accessGroup: %{public}@, service: %{public}@, account: %{private}@",
        (uint8_t *)&v14,
        0x26u);
    }
  }
  else if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    int v14 = 138543875;
    *(void *)id v15 = v7;
    *(_WORD *)&v15[8] = 2114;
    *(void *)&v15[10] = v8;
    *(_WORD *)&v15[18] = 2113;
    *(void *)&v15[20] = v9;
    _os_log_debug_impl(&dword_1B728F000, v12, OS_LOG_TYPE_DEBUG, "SecItemDelete succeeded; accessGroup: %{public}@, service: %{public}@, account: %{private}@",
      (uint8_t *)&v14,
      0x20u);
  }

  return v10 == 0;
}

uint64_t removeKeychainData(void *a1, void *a2, void *a3, char a4)
{
  v20[3] = *MEMORY[0x1E4F143B8];
  id v7 = a1;
  id v8 = a2;
  id v9 = a3;
  uint64_t v10 = *MEMORY[0x1E4F3B988];
  uint64_t v11 = *MEMORY[0x1E4F3B850];
  v19[0] = *MEMORY[0x1E4F3B978];
  v19[1] = v11;
  v20[0] = v10;
  v20[1] = v8;
  v19[2] = *MEMORY[0x1E4F3B5C0];
  v20[2] = v9;
  id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:3];
  id v13 = (void *)[v12 mutableCopy];

  if (v7) {
    [v13 setObject:v7 forKeyedSubscript:*MEMORY[0x1E4F3B550]];
  }
  int v14 = [NSNumber numberWithInt:v7 != 0];
  [v13 setObject:v14 forKeyedSubscript:*MEMORY[0x1E4F3B878]];

  if (a4)
  {
    uint64_t v15 = SecItemDelete((CFDictionaryRef)v13);
    if ((a4 & 2) != 0)
    {
LABEL_5:
      [v13 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F3BD08]];
      uint64_t v16 = SecItemDelete((CFDictionaryRef)v13);
      if (!v15) {
        goto LABEL_10;
      }
LABEL_9:
      if (v15 != -25300) {
        goto LABEL_19;
      }
      goto LABEL_10;
    }
  }
  else
  {
    uint64_t v15 = 4294941996;
    if ((a4 & 2) != 0) {
      goto LABEL_5;
    }
  }
  uint64_t v16 = 4294941996;
  if (v15) {
    goto LABEL_9;
  }
LABEL_10:
  if (v16 && v16 != -25300)
  {
    uint64_t v15 = v16;
  }
  else
  {
    if (v16) {
      BOOL v17 = v15 == 0;
    }
    else {
      BOOL v17 = 1;
    }
    if (v17) {
      uint64_t v15 = 0;
    }
    else {
      uint64_t v15 = 4294941996;
    }
  }
LABEL_19:

  return v15;
}

uint64_t WBSRemoveKeychainDataIfExists(void *a1, void *a2, void *a3, char a4)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v7 = a1;
  id v8 = a2;
  id v9 = a3;
  int v10 = removeKeychainData(v7, v8, v9, a4);
  int v11 = v10;
  if (v10 != -25300 && v10)
  {
    id v13 = WBS_LOG_CHANNEL_PREFIXKeychain();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      int v17 = 67109891;
      *(_DWORD *)id v18 = v11;
      *(_WORD *)&v18[4] = 2114;
      *(void *)&v18[6] = v7;
      *(_WORD *)&v18[14] = 2114;
      *(void *)&v18[16] = v8;
      *(_WORD *)&unsigned char v18[24] = 2113;
      *(void *)&v18[26] = v9;
      _os_log_error_impl(&dword_1B728F000, v13, OS_LOG_TYPE_ERROR, "SecItemDelete failed with error %d; accessGroup: %{public}@, service: %{public}@, account: %{private}@",
        (uint8_t *)&v17,
        0x26u);
    }
  }
  else
  {
    id v12 = WBS_LOG_CHANNEL_PREFIXKeychain();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      int v17 = 138543875;
      *(void *)id v18 = v7;
      *(_WORD *)&v18[8] = 2114;
      *(void *)&v18[10] = v8;
      *(_WORD *)&v18[18] = 2113;
      *(void *)&v18[20] = v9;
      _os_log_debug_impl(&dword_1B728F000, v12, OS_LOG_TYPE_DEBUG, "SecItemDelete succeeded; accessGroup: %{public}@, service: %{public}@, account: %{private}@",
        (uint8_t *)&v17,
        0x20u);
    }
  }
  if (v11) {
    BOOL v14 = v11 == -25300;
  }
  else {
    BOOL v14 = 1;
  }
  uint64_t v15 = v14;

  return v15;
}

uint64_t WBSRemoveKeychainPasswordIfExists(void *a1, void *a2, void *a3)
{
  return WBSRemoveKeychainDataIfExists(a1, a2, a3, 1);
}

id _WBSLocalizedStringWithCurrentUserLocale(void *a1, dispatch_once_t *a2, id *a3)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a1;
  determineBundle(a2, (uint64_t)a3);
  id v6 = (__CFBundle *)[*a3 _cfBundle];
  id v7 = v5;
  if (v7)
  {
    if (v6) {
      goto LABEL_3;
    }
  }
  else
  {
    id v20 = [MEMORY[0x1E4F28B00] currentHandler];
    long long v21 = objc_msgSend(NSString, "stringWithUTF8String:", "NSString *LocalizedKeyWithCurrentUserLocaleForBundle(CFBundleRef, NSString *__strong, NSString * _Nullable __strong)");
    [v20 handleFailureInFunction:v21, @"WBSLocalizableStrings.m", 47, @"Invalid parameter not satisfying: %@", @"formatKey" file lineNumber description];

    if (v6) {
      goto LABEL_3;
    }
  }
  CFDictionaryRef v22 = [MEMORY[0x1E4F28B00] currentHandler];
  CFDictionaryRef v23 = objc_msgSend(NSString, "stringWithUTF8String:", "NSString *LocalizedKeyWithCurrentUserLocaleForBundle(CFBundleRef, NSString *__strong, NSString * _Nullable __strong)");
  [v22 handleFailureInFunction:v23, @"WBSLocalizableStrings.m", 48, @"Invalid parameter not satisfying: %@", @"bundle" file lineNumber description];

LABEL_3:
  id v8 = [MEMORY[0x1E4F1CA20] preferredLanguages];
  CFArrayRef v9 = (const __CFArray *)[v8 mutableCopy];

  CFArrayRef v10 = CFBundleCopyBundleLocalizations(v6);
  CFArrayRef v11 = CFBundleCopyLocalizationsForPreferences(v10, v9);
  CFRelease(v10);
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  CFArrayRef v12 = v11;
  uint64_t v13 = [(__CFArray *)v12 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v25;
    while (2)
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v25 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = CFBundleCopyLocalizedStringForLocalization();
        if (v17)
        {
          id v18 = (void *)v17;
          goto LABEL_13;
        }
      }
      uint64_t v14 = [(__CFArray *)v12 countByEnumeratingWithState:&v24 objects:v28 count:16];
      if (v14) {
        continue;
      }
      break;
    }
  }
  id v18 = 0;
LABEL_13:

  return v18;
}

void sub_1B72DAE7C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id WBSManagedExtensionsConfigurationDisplayTitle()
{
  return _WBSLocalizedString(@"Safari Extensions", &_WBSLocalizableStringsBundleOnceToken, &_WBSLocalizableStringsBundle);
}

id WBSManagedExtensionsConfigurationDisplayDescription()
{
  return _WBSLocalizedString(@"Safari Extension Management", &_WBSLocalizableStringsBundleOnceToken, &_WBSLocalizableStringsBundle);
}

id WBSManagedExtensionsConfigurationDisplayAlwaysOnText()
{
  return _WBSLocalizedString(@"Always On", &_WBSLocalizableStringsBundleOnceToken, &_WBSLocalizableStringsBundle);
}

id WBSManagedExtensionsConfigurationDisplayAlwaysOffText()
{
  return _WBSLocalizedString(@"Always Off", &_WBSLocalizableStringsBundleOnceToken, &_WBSLocalizableStringsBundle);
}

id WBSManagedExtensionsConfigurationDisplayAllowedText()
{
  return _WBSLocalizedString(@"Allowed", &_WBSLocalizableStringsBundleOnceToken, &_WBSLocalizableStringsBundle);
}

id WBSManagedExtensionsConfigurationDisplayAllExtensionsText()
{
  return _WBSLocalizedString(@"All Extensions", &_WBSLocalizableStringsBundleOnceToken, &_WBSLocalizableStringsBundle);
}

id WBSManagedExtensionsConfigurationDisplayAllOtherExtensionsText()
{
  return _WBSLocalizedString(@"All Other Extensions", &_WBSLocalizableStringsBundleOnceToken, &_WBSLocalizableStringsBundle);
}

uint64_t managedExtensionStateFromString(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:@"AlwaysOn"])
  {
    uint64_t v2 = 1;
  }
  else if ([v1 isEqualToString:@"AlwaysOff"])
  {
    uint64_t v2 = 2;
  }
  else
  {
    [v1 isEqualToString:@"Allowed"];
    uint64_t v2 = 0;
  }

  return v2;
}

void enumerateAsynchronously(void *a1, void *a2, unint64_t a3, void *a4, void *a5)
{
  CFArrayRef v9 = a1;
  id v10 = a2;
  id v11 = a4;
  id v12 = a5;
  if ([v10 count] <= a3)
  {
    dispatch_async(v9, v12);
  }
  else
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __enumerateAsynchronously_block_invoke;
    block[3] = &unk_1E615B488;
    id v16 = v11;
    id v14 = v10;
    unint64_t v18 = a3;
    uint64_t v15 = v9;
    id v17 = v12;
    dispatch_async(v15, block);
  }
}

void sub_1B72DF190(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__6(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__6(uint64_t a1)
{
}

void __enumerateAsynchronously_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  id v3 = [*(id *)(a1 + 32) objectAtIndexedSubscript:*(void *)(a1 + 64)];
  uint64_t v4 = *(void *)(a1 + 64);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __enumerateAsynchronously_block_invoke_2;
  v7[3] = &unk_1E615B460;
  id v8 = *(id *)(a1 + 40);
  id v10 = *(id *)(a1 + 56);
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 64);
  id v9 = v5;
  uint64_t v12 = v6;
  id v11 = *(id *)(a1 + 48);
  (*(void (**)(uint64_t, void *, uint64_t, void *))(v2 + 16))(v2, v3, v4, v7);
}

void __enumerateAsynchronously_block_invoke_2(uint64_t a1, int a2)
{
  id v3 = *(NSObject **)(a1 + 32);
  if (a2) {
    dispatch_async(v3, *(dispatch_block_t *)(a1 + 48));
  }
  else {
    enumerateAsynchronously(v3, *(void *)(a1 + 40), *(void *)(a1 + 64) + 1, *(void *)(a1 + 56), *(void *)(a1 + 48));
  }
}

uint64_t ___dateFormatTemplatesWithLongMonth_block_invoke()
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  uint64_t v0 = [MEMORY[0x1E4F1CA48] array];
  id v1 = (void *)_dateFormatTemplatesWithLongMonth_dateFormats;
  _dateFormatTemplatesWithLongMonth_dateFormats = v0;

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  uint64_t result = [&unk_1F10866F0 countByEnumeratingWithState:&v27 objects:v33 count:16];
  uint64_t v14 = result;
  if (result)
  {
    uint64_t v13 = *(void *)v28;
    do
    {
      uint64_t v3 = 0;
      do
      {
        if (*(void *)v28 != v13) {
          objc_enumerationMutation(&unk_1F10866F0);
        }
        uint64_t v15 = v3;
        uint64_t v4 = *(void *)(*((void *)&v27 + 1) + 8 * v3);
        long long v23 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        uint64_t v17 = [&unk_1F1086708 countByEnumeratingWithState:&v23 objects:v32 count:16];
        if (v17)
        {
          uint64_t v16 = *(void *)v24;
          do
          {
            uint64_t v5 = 0;
            do
            {
              if (*(void *)v24 != v16) {
                objc_enumerationMutation(&unk_1F1086708);
              }
              uint64_t v18 = v5;
              uint64_t v6 = *(void *)(*((void *)&v23 + 1) + 8 * v5);
              long long v19 = 0u;
              long long v20 = 0u;
              long long v21 = 0u;
              long long v22 = 0u;
              uint64_t v7 = [&unk_1F1086720 countByEnumeratingWithState:&v19 objects:v31 count:16];
              if (v7)
              {
                uint64_t v8 = v7;
                uint64_t v9 = *(void *)v20;
                do
                {
                  uint64_t v10 = 0;
                  do
                  {
                    if (*(void *)v20 != v9) {
                      objc_enumerationMutation(&unk_1F1086720);
                    }
                    id v11 = (void *)_dateFormatTemplatesWithLongMonth_dateFormats;
                    uint64_t v12 = [NSString stringWithFormat:@"%@%@%@", v4, v6, *(void *)(*((void *)&v19 + 1) + 8 * v10)];
                    [v11 addObject:v12];

                    ++v10;
                  }
                  while (v8 != v10);
                  uint64_t v8 = [&unk_1F1086720 countByEnumeratingWithState:&v19 objects:v31 count:16];
                }
                while (v8);
              }
              uint64_t v5 = v18 + 1;
            }
            while (v18 + 1 != v17);
            uint64_t v17 = [&unk_1F1086708 countByEnumeratingWithState:&v23 objects:v32 count:16];
          }
          while (v17);
        }
        uint64_t v3 = v15 + 1;
      }
      while (v15 + 1 != v14);
      uint64_t result = [&unk_1F10866F0 countByEnumeratingWithState:&v27 objects:v33 count:16];
      uint64_t v14 = result;
    }
    while (result);
  }
  return result;
}

void sub_1B72E2CB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__7(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__7(uint64_t a1)
{
}

void sub_1B72E37C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B72E38CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B72E3C30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B72E3EC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B72E4614(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__Block_byref_object_copy__8(uint64_t a1, uint64_t a2)
{
  uint64_t result = _Block_copy(*(const void **)(a2 + 40));
  *(void *)(a1 + 40) = result;
  return result;
}

void __Block_byref_object_dispose__8(uint64_t a1)
{
}

id WBSNSExtensionFromNSExtension(void *a1)
{
  id v1 = a1;
  return v1;
}

void sub_1B72E4A04(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B72E4AFC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B72E4CC8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B72E4DC8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B72E4F1C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B72E5080(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B72E50F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B72E51FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B72E52E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B72E53E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B72E54F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B72E55F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B72E58E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B72E5B64(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B72E5FD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_1B72E61DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B72E62E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B72E642C(_Unwind_Exception *a1)
{
  uint64_t v5 = v3;

  _Unwind_Resume(a1);
}

void sub_1B72E67D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_1B72E696C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B72E6AD8(_Unwind_Exception *a1)
{
  uint64_t v5 = v4;

  _Unwind_Resume(a1);
}

void sub_1B72E6E6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_1B72E7020(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B72E7594(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);

  _Unwind_Resume(a1);
}

void sub_1B72E76D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void *___ZL24getBOMCopierNewSymbolLocv_block_invoke(uint64_t a1)
{
  uint64_t v2 = BomLibrary();
  uint64_t result = dlsym(v2, "BOMCopierNew");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getBOMCopierNewSymbolLoc(void)::ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *BomLibrary(void)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!BomLibraryCore(char **)::frameworkLibrary)
  {
    v4[1] = (void *)MEMORY[0x1E4F143A8];
    v4[2] = (void *)3221225472;
    v4[3] = ___ZL14BomLibraryCorePPc_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E615B7E8;
    uint64_t v6 = 0;
    BomLibraryCore(char **)::frameworkLibrary = _sl_dlopen();
  }
  uint64_t v0 = (void *)BomLibraryCore(char **)::frameworkLibrary;
  if (!BomLibraryCore(char **)::frameworkLibrary)
  {
    uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v3 = [NSString stringWithUTF8String:"void *BomLibrary()"];
    objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v3, @"WBSNSFileManagerExtras.mm", 50, @"%s", v4[0]);

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

void sub_1B72E789C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11, _Unwind_Exception *exception_object)
{
  _Unwind_Resume(a1);
}

uint64_t ___ZL14BomLibraryCorePPc_block_invoke()
{
  uint64_t result = _sl_dlopen();
  BomLibraryCore(char **)::frameworkLibrary = result;
  return result;
}

void *___ZL36getBOMCopierCopyWithOptionsSymbolLocv_block_invoke(uint64_t a1)
{
  uint64_t v2 = BomLibrary();
  uint64_t result = dlsym(v2, "BOMCopierCopyWithOptions");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getBOMCopierCopyWithOptionsSymbolLoc(void)::ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *___ZL25getBOMCopierFreeSymbolLocv_block_invoke(uint64_t a1)
{
  uint64_t v2 = BomLibrary();
  uint64_t result = dlsym(v2, "BOMCopierFree");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getBOMCopierFreeSymbolLoc(void)::ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id WBSHTTPProtocolFromSecAttrProtocolValue(void *a1)
{
  id v1 = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v4 = v1;
    if ([v4 isEqualToString:*MEMORY[0x1E4F3B7E8]])
    {
      long long v5 = (id *)MEMORY[0x1E4F18CD0];
    }
    else
    {
      if (![v4 isEqualToString:*MEMORY[0x1E4F3B7F8]])
      {
        uint64_t v6 = WBS_LOG_CHANNEL_PREFIXKeychain();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
          WBSHTTPProtocolFromSecAttrProtocolValue_cold_2();
        }
        id v3 = 0;
        goto LABEL_13;
      }
      long long v5 = (id *)MEMORY[0x1E4F18CD8];
    }
    id v3 = *v5;
LABEL_13:

    goto LABEL_14;
  }
  uint64_t v2 = WBS_LOG_CHANNEL_PREFIXKeychain();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    WBSHTTPProtocolFromSecAttrProtocolValue_cold_1(v2);
  }
  id v3 = 0;
LABEL_14:

  return v3;
}

id queryForUserInProtectionSpace(void *a1, void *a2, uint64_t a3, void *a4, int a5)
{
  v29[2] = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  uint64_t v10 = partialKeychainDictionaryForUserInProtectionSpace(a1, a2);
  uint64_t v11 = *MEMORY[0x1E4F3BD08];
  uint64_t v12 = MEMORY[0x1E4F1CC38];
  v29[0] = MEMORY[0x1E4F1CC38];
  uint64_t v13 = *MEMORY[0x1E4F3B550];
  v28[0] = v11;
  v28[1] = v13;
  uint64_t v14 = @"com.apple.cfnetwork.testing";
  uint64_t v15 = @"com.apple.cfnetwork-recently-deleted.testing";
  if (!shouldUseTestingAccessGroups)
  {
    uint64_t v14 = @"com.apple.cfnetwork";
    uint64_t v15 = @"com.apple.cfnetwork-recently-deleted";
  }
  if (!a5) {
    uint64_t v15 = v14;
  }
  uint64_t v16 = v15;
  v29[1] = v16;
  uint64_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:v28 count:2];
  [v10 addEntriesFromDictionary:v17];

  if (a3 == 1)
  {
    uint64_t v18 = *MEMORY[0x1E4F3BC70];
    v26[0] = *MEMORY[0x1E4F3BC68];
    v26[1] = v18;
    v27[0] = v12;
    v27[1] = v12;
    uint64_t v19 = *MEMORY[0x1E4F3BC78];
    v26[2] = *MEMORY[0x1E4F3BB80];
    v26[3] = v19;
    v27[2] = *MEMORY[0x1E4F3BB90];
    v27[3] = v12;
    long long v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:v26 count:4];
    [v10 addEntriesFromDictionary:v20];
  }
  uint64_t v21 = [v9 length];
  uint64_t v22 = *MEMORY[0x1E4F3B878];
  if (v21)
  {
    [v10 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:v22];
    uint64_t v22 = *MEMORY[0x1E4F3B858];
    long long v23 = v10;
    id v24 = v9;
  }
  else
  {
    id v24 = (id)MEMORY[0x1E4F1CC38];
    long long v23 = v10;
  }
  [v23 setObject:v24 forKeyedSubscript:v22];

  return v10;
}

id queryForPasskeyFromSavedAccount(void *a1)
{
  v30[4] = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  BOOL v2 = +[WBSFeatureAvailability isCredentialExchangeEnabled];
  uint64_t v3 = *MEMORY[0x1E4F3B978];
  v30[0] = *MEMORY[0x1E4F3B9A0];
  uint64_t v4 = *MEMORY[0x1E4F3B550];
  v29[0] = v3;
  v29[1] = v4;
  int v5 = [v1 isRecentlyDeleted];
  uint64_t v6 = @"com.apple.webkit.webauthn-recently-deleted.testing";
  if (shouldUseTestingAccessGroups) {
    uint64_t v7 = @"com.apple.webkit.webauthn.testing";
  }
  else {
    uint64_t v7 = @"com.apple.webkit.webauthn";
  }
  if (!shouldUseTestingAccessGroups) {
    uint64_t v6 = @"com.apple.webkit.webauthn-recently-deleted";
  }
  if (!v5) {
    uint64_t v6 = v7;
  }
  uint64_t v8 = v6;
  id v9 = v8;
  if (shouldUseTestingAccessGroups) {
    uint64_t v10 = @"com.apple.webkit.webauthn.testing";
  }
  else {
    uint64_t v10 = @"com.apple.webkit.webauthn";
  }
  v30[1] = v8;
  v30[2] = v10;
  uint64_t v11 = *MEMORY[0x1E4F3BD08];
  v29[2] = v4;
  void v29[3] = v11;
  uint64_t v12 = MEMORY[0x1E4F1CC38];
  v30[3] = MEMORY[0x1E4F1CC38];
  uint64_t v13 = (void *)MEMORY[0x1E4F1C9E8];
  uint64_t v14 = v10;
  uint64_t v15 = [v13 dictionaryWithObjects:v30 forKeys:v29 count:4];

  uint64_t v16 = (void *)[v15 mutableCopy];
  uint64_t v17 = credentialIDData(v1);
  uint64_t v18 = (void *)MEMORY[0x1E4F3B5C8];
  if (!v2) {
    uint64_t v18 = (void *)MEMORY[0x1E4F3B5D0];
  }
  [v16 setObject:v17 forKeyedSubscript:*v18];

  uint64_t v19 = *MEMORY[0x1E4F3BC70];
  v27[0] = *MEMORY[0x1E4F3BC68];
  v27[1] = v19;
  v28[0] = v12;
  v28[1] = v12;
  uint64_t v20 = *MEMORY[0x1E4F3BB80];
  v27[2] = *MEMORY[0x1E4F3BC78];
  v27[3] = v20;
  uint64_t v21 = *MEMORY[0x1E4F3BB90];
  void v28[2] = v12;
  v28[3] = v21;
  uint64_t v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:4];
  [v16 addEntriesFromDictionary:v22];

  int v23 = [v1 isSavedInPersonalKeychain];
  uint64_t v24 = *MEMORY[0x1E4F3B878];
  if (v23)
  {
    [v16 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:v24];
  }
  else
  {
    [v16 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:v24];
    long long v25 = [v1 sharedGroupID];
    [v16 setObject:v25 forKeyedSubscript:*MEMORY[0x1E4F3B858]];
  }
  return v16;
}

id credentialIDData(void *a1)
{
  id v1 = (objc_class *)MEMORY[0x1E4F1C9B8];
  id v2 = a1;
  id v3 = [v1 alloc];
  uint64_t v4 = [v2 passkeyCredentialID];

  int v5 = (void *)[v3 initWithBase64EncodedString:v4 options:0];
  return v5;
}

void sub_1B72ED7CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id queryForSidecarOfTypeWithUserAndProtectionSpaceInGroupWithID(uint64_t a1, void *a2, void *a3, void *a4, int a5, uint64_t a6)
{
  v39[4] = *MEMORY[0x1E4F143B8];
  id v11 = a4;
  uint64_t v12 = partialKeychainDictionaryForUserInProtectionSpace(a2, a3);
  uint64_t v13 = MEMORY[0x1E4F1CC38];
  [v12 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F3BD08]];
  if (a6 == 1)
  {
    uint64_t v14 = *MEMORY[0x1E4F3BC68];
    v38[0] = *MEMORY[0x1E4F3BC70];
    v38[1] = v14;
    uint64_t v15 = *MEMORY[0x1E4F3BB80];
    v38[2] = *MEMORY[0x1E4F3BC78];
    v38[3] = v15;
    v39[0] = v13;
    v39[1] = v13;
    uint64_t v16 = *MEMORY[0x1E4F3BB90];
    v39[2] = v13;
    v39[3] = v16;
    uint64_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v39 forKeys:v38 count:4];
    [v12 addEntriesFromDictionary:v17];
  }
  if (![v11 length])
  {
    [v12 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F3B878]];
    if (a5)
    {
      long long v27 = @"com.apple.password-manager-recently-deleted.testing";
      long long v28 = @"com.apple.password-manager-recently-deleted";
    }
    else
    {
      long long v27 = @"com.apple.password-manager.testing";
      long long v28 = @"com.apple.password-manager";
    }
    if (shouldUseTestingAccessGroups) {
      id v32 = v27;
    }
    else {
      id v32 = v28;
    }
    [v12 setObject:v32 forKeyedSubscript:*MEMORY[0x1E4F3B550]];
    goto LABEL_36;
  }
  if (a1 == 1936220530)
  {
    uint64_t v29 = *MEMORY[0x1E4F3B858];
    v34[0] = *MEMORY[0x1E4F3B878];
    v34[1] = v29;
    v35[0] = MEMORY[0x1E4F1CC28];
    v35[1] = v11;
    v34[2] = *MEMORY[0x1E4F3B550];
    if (shouldUseTestingAccessGroups) {
      uint64_t v20 = @"com.apple.password-manager.testing";
    }
    else {
      uint64_t v20 = @"com.apple.password-manager";
    }
    if (shouldUseTestingAccessGroups) {
      uint64_t v21 = @"com.apple.password-manager-recently-deleted.testing";
    }
    else {
      uint64_t v21 = @"com.apple.password-manager-recently-deleted";
    }
    if (a5) {
      long long v30 = v21;
    }
    else {
      long long v30 = v20;
    }
    v35[2] = v30;
    uint64_t v24 = (void *)MEMORY[0x1E4F1C9E8];
    long long v25 = v35;
    long long v26 = v34;
  }
  else
  {
    if (a1 != 1835626085) {
      goto LABEL_36;
    }
    uint64_t v18 = *MEMORY[0x1E4F3B878];
    v37[0] = v13;
    uint64_t v19 = *MEMORY[0x1E4F3B550];
    v36[0] = v18;
    v36[1] = v19;
    if (shouldUseTestingAccessGroups) {
      uint64_t v20 = @"com.apple.password-manager.personal.testing";
    }
    else {
      uint64_t v20 = @"com.apple.password-manager.personal";
    }
    if (shouldUseTestingAccessGroups) {
      uint64_t v21 = @"com.apple.password-manager.personal-recently-deleted.testing";
    }
    else {
      uint64_t v21 = @"com.apple.password-manager.personal-recently-deleted";
    }
    if (a5) {
      uint64_t v22 = v21;
    }
    else {
      uint64_t v22 = v20;
    }
    int v23 = v22;
    v36[2] = *MEMORY[0x1E4F3B7B8];
    v37[1] = v23;
    v37[2] = v11;
    uint64_t v24 = (void *)MEMORY[0x1E4F1C9E8];
    long long v25 = v37;
    long long v26 = v36;
  }
  id v31 = [v24 dictionaryWithObjects:v25 forKeys:v26 count:3];
  [v12 addEntriesFromDictionary:v31];

  if (a5) {
  else
  }

LABEL_36:
  return v12;
}

void sub_1B72F0F84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id queryForPasswordFromSavedAccountAndProtectionSpace(void *a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = a1;
  uint64_t v7 = [v6 user];
  uint64_t v8 = [v6 sharedGroupID];
  int v9 = [v6 isRecentlyDeleted];

  uint64_t v10 = queryForUserInProtectionSpace(v7, v5, a3, v8, v9);

  return v10;
}

void sub_1B72F13B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B72F17CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B72F1B34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va, a10);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id partialKeychainDictionaryForUserInProtectionSpace(void *a1, void *a2)
{
  v16[5] = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  uint64_t v4 = *MEMORY[0x1E4F3B998];
  uint64_t v5 = *MEMORY[0x1E4F3B5E8];
  v15[0] = *MEMORY[0x1E4F3B978];
  v15[1] = v5;
  uint64_t v6 = *MEMORY[0x1E4F3B5F8];
  v16[0] = v4;
  v16[1] = v6;
  v15[2] = *MEMORY[0x1E4F3B7C8];
  id v7 = a2;
  v16[2] = objc_msgSend(v7, "safari_protocolAsSecAttrProtocolValue");
  v15[3] = *MEMORY[0x1E4F3B848];
  uint64_t v8 = [v7 host];
  v16[3] = v8;
  v15[4] = *MEMORY[0x1E4F3B7C0];
  int v9 = NSNumber;
  uint64_t v10 = [v7 port];

  id v11 = [v9 numberWithInteger:v10];
  v16[4] = v11;
  uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:5];
  uint64_t v13 = (void *)[v12 mutableCopy];

  if (v3) {
    [v13 setObject:v3 forKeyedSubscript:*MEMORY[0x1E4F3B5C0]];
  }

  return v13;
}

void OUTLINED_FUNCTION_6(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

void OUTLINED_FUNCTION_8(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 2u);
}

uint64_t OUTLINED_FUNCTION_12()
{
  return v0;
}

void OUTLINED_FUNCTION_14(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

id OUTLINED_FUNCTION_20(uint64_t a1, void *a2)
{
  return a2;
}

void OUTLINED_FUNCTION_22(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, v9, OS_LOG_TYPE_FAULT, a4, &a9, 0x16u);
}

void sub_1B72F6C5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *WBSCreditCardNumberFieldLabels()
{
  return &unk_1F1086888;
}

id creditCardLabels(int a1)
{
  switch(a1)
  {
    case 2:
      id v1 = &unk_1F1086798;
      break;
    case 3:
      id v1 = &unk_1F10867B0;
      break;
    case 4:
      id v1 = &unk_1F10867C8;
      break;
    case 5:
      id v1 = &unk_1F10867E0;
      break;
    case 6:
      id v1 = &unk_1F10867F8;
      break;
    case 7:
      id v1 = &unk_1F1086810;
      break;
    case 8:
      id v1 = &unk_1F1086828;
      break;
    case 9:
      uint64_t v2 = &unk_1F1086840;
      id v3 = &unk_1F10867C8;
      goto LABEL_14;
    case 10:
      uint64_t v2 = &unk_1F1086858;
      goto LABEL_13;
    case 11:
      uint64_t v2 = &unk_1F1086870;
LABEL_13:
      id v3 = &unk_1F1086810;
LABEL_14:
      id v1 = [v2 arrayByAddingObjectsFromArray:v3];
      break;
    case 12:
      id v1 = &unk_1F1086888;
      break;
    case 13:
      id v1 = &unk_1F10868A0;
      break;
    case 14:
      id v1 = &unk_1F10868B8;
      break;
    case 15:
      id v1 = &unk_1F10868D0;
      break;
    case 16:
      id v1 = &unk_1F10868E8;
      break;
    case 17:
      id v1 = &unk_1F1086900;
      break;
    default:
      id v1 = &unk_1F1086780;
      break;
  }
  return v1;
}

void *WBSCreditCardSecurityCodeFieldLabels()
{
  return &unk_1F10868A0;
}

void *WBSCreditCardCardholderFieldLabels()
{
  return &unk_1F10868B8;
}

void *WBSCreditCardTypeFieldLabels()
{
  return &unk_1F10868D0;
}

void *WBSCreditCardCompositeExpirationDateFieldLabels()
{
  return &unk_1F10868E8;
}

void *WBSNonCreditCardCardNumberFieldLabels()
{
  return &unk_1F1086900;
}

id WBSCreditCardTypeSynonyms(uint64_t a1)
{
  switch(a1)
  {
    case 1:
      id v1 = &unk_1F1086828;
      break;
    case 2:
      id v1 = &unk_1F1086810;
      break;
    case 3:
      id v1 = &unk_1F1086780;
      break;
    case 4:
      id v1 = &unk_1F10867C8;
      break;
    case 5:
      int v2 = 9;
      goto LABEL_10;
    case 6:
      int v2 = 10;
      goto LABEL_10;
    case 7:
      int v2 = 11;
LABEL_10:
      id v1 = creditCardLabels(v2);
      break;
    case 8:
      id v1 = &unk_1F10867F8;
      break;
    default:
      id v1 = 0;
      break;
  }
  return v1;
}

id WBSAllowedCreditCardNumberSeparatorCharacters()
{
  {
    uint64_t v0 = (void *)WBSAllowedCreditCardNumberSeparatorCharacters::separators;
  }
  else
  {
    uint64_t v0 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@" -"];
    WBSAllowedCreditCardNumberSeparatorCharacters::separators = (uint64_t)v0;
  }
  return v0;
}

id WBSNormalizedCreditCardNumber(void *a1)
{
  id v1 = a1;
  if ([v1 length])
  {
    int v2 = WBSAllowedCreditCardNumberSeparatorCharacters();
    id v3 = [v1 componentsSeparatedByCharactersInSet:v2];
    uint64_t v4 = [v3 componentsJoinedByString:&stru_1F105D3F0];

    uint64_t v5 = [MEMORY[0x1E4F28B88] decimalDigitCharacterSet];
    uint64_t v6 = [v4 stringByTrimmingCharactersInSet:v5];
    uint64_t v7 = [v6 length];

    if (v7) {
      uint64_t v8 = 0;
    }
    else {
      uint64_t v8 = v4;
    }
    if (v7) {
      id v1 = v4;
    }
    else {
      id v1 = 0;
    }
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

void sub_1B72F7CB4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t WBSCreditCardTypeFromNumber(void *a1)
{
  return WBSCreditCardTypeFromNumberAllowingPartialMatch(a1, 0);
}

uint64_t WBSCreditCardTypeFromNumberAllowingPartialMatch(void *a1, int a2)
{
  id v3 = a1;
  uint64_t v4 = WBSNormalizedCreditCardNumber(v3);

  if (!v4) {
    goto LABEL_6;
  }
  if (!a2 || (uint64_t v5 = WBSCreditCardTypeFromNumberAllowingPartialMatch(v4, 0)) == 0)
  {
    unint64_t v6 = [v4 length];
    unint64_t v7 = v6;
    if ((a2 & 1) == 0 && v6 <= 3)
    {
LABEL_6:
      uint64_t v5 = 0;
      goto LABEL_7;
    }
    uint64_t v9 = [v4 stringByPaddingToLength:4 withString:@"0" startingAtIndex:0];
    uint64_t v10 = [v9 integerValue];

    if (a2)
    {
      if (v7 >= 0x11)
      {
        BOOL v11 = 0;
        BOOL v12 = 0;
        char v13 = 0;
        goto LABEL_28;
      }
    }
    else if (v7 != 16 && v7 != 13)
    {
      BOOL v12 = 0;
      BOOL v11 = v7 < 0x11;
      goto LABEL_25;
    }
    if ((unint64_t)(v10 - 4000) < 0x3E8)
    {
      uint64_t v5 = 1;
      goto LABEL_7;
    }
    BOOL v12 = v7 == 16;
    if (v7 == 16) {
      int v14 = 1;
    }
    else {
      int v14 = a2;
    }
    if (v14 == 1 && (unint64_t)(v10 - 5100) < 0x1F4)
    {
      uint64_t v5 = 2;
      goto LABEL_7;
    }
    BOOL v11 = 1;
    if (a2)
    {
      char v13 = 1;
      if (v7 >= 0x10) {
        goto LABEL_28;
      }
LABEL_26:
      uint64_t v5 = 3;
      if ((unint64_t)(v10 - 3400) < 0x64 || (unint64_t)(v10 - 3700) < 0x64) {
        goto LABEL_7;
      }
LABEL_28:
      if ((unint64_t)(v10 - 3800) >= 0xC8
        && (unint64_t)(v10 - 3000) >= 0x3C
        && (unint64_t)(v10 - 3600) > 0x63)
      {
        if (a2)
        {
          if (!v11) {
            goto LABEL_43;
          }
LABEL_38:
          uint64_t v5 = 4;
          if (v10 == 6011 || (unint64_t)(v10 - 6440) < 0xA0) {
            goto LABEL_7;
          }
          goto LABEL_43;
        }
        if (v12) {
          goto LABEL_38;
        }
LABEL_43:
        BOOL v15 = v7 < 0x14;
        if (!a2) {
          BOOL v15 = (v7 & 0xFFFFFFFFFFFFFFFCLL) == 16;
        }
        if (v15 && (unint64_t)(v10 - 6200) < 0x33)
        {
          uint64_t v5 = 5;
        }
        else if (isMaestroCard(v7, v10, a2))
        {
          uint64_t v5 = 6;
        }
        else
        {
          if ((unint64_t)(v10 - 6370) < 0x1E) {
            char v16 = v13;
          }
          else {
            char v16 = 0;
          }
          if (v16)
          {
            uint64_t v5 = 7;
          }
          else if (isJCBCard(v7, v10, a2))
          {
            uint64_t v5 = 8;
          }
          else
          {
            uint64_t v5 = 0;
          }
        }
        goto LABEL_7;
      }
      if (a2)
      {
        if (v7 >= 0xF) {
          goto LABEL_43;
        }
      }
      else if (v7 != 14)
      {
        goto LABEL_43;
      }
      uint64_t v5 = 4;
      goto LABEL_7;
    }
LABEL_25:
    char v13 = v12;
    if (v7 != 15) {
      goto LABEL_28;
    }
    goto LABEL_26;
  }
LABEL_7:

  return v5;
}

void sub_1B72F7F80(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t isMaestroCard(unint64_t a1, uint64_t a2, int a3)
{
  if (a3)
  {
    if (a1 >= 0x14) {
      return 0;
    }
  }
  else if (a1 - 12 > 7)
  {
    return 0;
  }
  uint64_t result = 1;
  if (a2 > 5892)
  {
    if (((unint64_t)(a2 - 6706) > 0x39 || ((1 << (a2 - 50)) & 0x3A0000000000001) == 0)
      && a2 != 5893)
    {
      uint64_t v4 = 6304;
LABEL_14:
      if (a2 == v4) {
        return result;
      }
      return 0;
    }
  }
  else if (((unint64_t)(a2 - 5018) > 0x14 || ((1 << (a2 + 102)) & 0x100005) == 0) {
         && a2 != 604)
  }
  {
    uint64_t v4 = 5612;
    goto LABEL_14;
  }
  return result;
}

BOOL isJCBCard(unint64_t a1, uint64_t a2, int a3)
{
  if ((unint64_t)(a2 - 3000) > 0x3E7)
  {
    if (a3)
    {
      if (a1 >= 0x10) {
        return 0;
      }
    }
    else if (a1 != 15)
    {
      return 0;
    }
    return a2 == 1800 || a2 == 2131;
  }
  if ((unint64_t)(a2 - 3400) < 0x64) {
    return 0;
  }
  BOOL v3 = a1 == 16;
  if (a3) {
    BOOL v3 = a1 < 0x11;
  }
  BOOL v4 = (unint64_t)(a2 - 3900) >= 0x64 && v3;
  BOOL v5 = (unint64_t)(a2 - 3600) >= 0x64 && v4;
  BOOL v6 = (unint64_t)(a2 - 3000) >= 0x3C && v5;
  if ((unint64_t)(a2 - 3800) < 0x64) {
    BOOL v6 = 0;
  }
  return (unint64_t)(a2 - 3700) >= 0x64 && v6;
}

id WBSCreditCardTypeLocalizedName(uint64_t a1)
{
  switch(a1)
  {
    case 1:
      int v2 = @"Visa (credit card type for filling)";
      goto LABEL_13;
    case 2:
      int v2 = @"Mastercard (credit card type for filling)";
      goto LABEL_13;
    case 3:
      int v2 = @"American Express (credit card type for filling)";
      goto LABEL_13;
    case 4:
      int v2 = @"Discover";
      goto LABEL_13;
    case 5:
      int v2 = @"China UnionPay";
      goto LABEL_13;
    case 6:
      int v2 = @"Maestro";
      goto LABEL_13;
    case 7:
      int v2 = @"InstaPayment";
      goto LABEL_13;
    case 8:
      int v2 = @"JCB";
LABEL_13:
      BOOL v3 = _WBSLocalizedString(v2, &_WBSLocalizableStringsBundleOnceToken, &_WBSLocalizableStringsBundle);
      break;
    default:
      BOOL v3 = 0;
      break;
  }
  return v3;
}

id WBSCreditCardTypeLocalizedNameForGeneratingCardNames(uint64_t a1)
{
  switch(a1)
  {
    case 1:
      int v2 = @"Visa (credit card name)";
      goto LABEL_13;
    case 2:
      int v2 = @"Mastercard";
      goto LABEL_13;
    case 3:
      int v2 = @"American Express";
      goto LABEL_13;
    case 4:
      int v2 = @"Discover card";
      goto LABEL_13;
    case 5:
      int v2 = @"China UnionPay card";
      goto LABEL_13;
    case 6:
      int v2 = @"Maestro card";
      goto LABEL_13;
    case 7:
      int v2 = @"InstaPayment card";
      goto LABEL_13;
    case 8:
      int v2 = @"JCB card";
LABEL_13:
      BOOL v3 = _WBSLocalizedString(v2, &_WBSLocalizableStringsBundleOnceToken, &_WBSLocalizableStringsBundle);
      break;
    default:
      BOOL v3 = 0;
      break;
  }
  return v3;
}

id WBSExpirationDateWithDayMonthYear(uint64_t a1, uint64_t a2, unint64_t a3)
{
  if (a3 > 0x7FFFFFFFFFFFFFFELL) {
    goto LABEL_2;
  }
  uint64_t v4 = a3;
  unint64_t v7 = (void *)MEMORY[0x1E4F1C318];
  if (a3 > 0x63) {
    goto LABEL_5;
  }
  id v8 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  [v8 setDateFormat:@"y"];
  uint64_t v9 = objc_msgSend(NSString, "stringWithFormat:", @"%02ld", v4);
  uint64_t v10 = [v8 dateFromString:v9];

  BOOL v11 = (void *)[objc_alloc(MEMORY[0x1E4F1C9A8]) initWithCalendarIdentifier:*v7];
  BOOL v12 = [v11 components:4 fromDate:v10];
  uint64_t v4 = [v12 year];

  if (v4)
  {
LABEL_5:
    if ((unint64_t)(a2 - 13) < 0xFFFFFFFFFFFFFFF4) {
      a2 = 12;
    }
    char v13 = gregorianDateFromParts(1, a2, v4);
    id v14 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
    [v14 setMonth:1];
    [v14 setDay:-1];
    [v14 setYear:0];
    BOOL v15 = (void *)[objc_alloc(MEMORY[0x1E4F1C9A8]) initWithCalendarIdentifier:*v7];
    char v16 = [v15 dateByAddingComponents:v14 toDate:v13 options:0];
    uint64_t v17 = [v15 components:16 fromDate:v16];

    uint64_t v18 = [v17 day];
    if (v18 < a1 || a1 < 1) {
      uint64_t v20 = v18;
    }
    else {
      uint64_t v20 = a1;
    }
    BOOL v3 = gregorianDateFromParts(v20, a2, v4);
  }
  else
  {
LABEL_2:
    BOOL v3 = 0;
  }
  return v3;
}

void sub_1B72F84E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id gregorianDateFromParts(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v6 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
  [v6 setDay:a1];
  [v6 setMonth:a2];
  [v6 setYear:a3];
  id v7 = objc_alloc(MEMORY[0x1E4F1C9A8]);
  id v8 = (void *)[v7 initWithCalendarIdentifier:*MEMORY[0x1E4F1C318]];
  uint64_t v9 = [v8 dateFromComponents:v6];

  return v9;
}

void sub_1B72F85EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id WBSLastDigitsOfCreditCardNumber(void *a1)
{
  uint64_t v1 = WBSNormalizedCreditCardNumber(a1);
  if ((unint64_t)[v1 length] < 5)
  {
    id v2 = v1;
  }
  else
  {
    objc_msgSend(v1, "substringFromIndex:", objc_msgSend(v1, "length") - 4);
    id v2 = (id)objc_claimAutoreleasedReturnValue();
  }
  BOOL v3 = v2;

  return v3;
}

void sub_1B72F867C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

__CFString *WBSDisplayTextForCreditCardNumber(void *a1)
{
  uint64_t v1 = WBSLastDigitsOfCreditCardNumber(a1);
  if (v1)
  {
    id v2 = [NSString stringWithFormat:@"\u202D•••• %@\u202C", v1];
  }
  else
  {
    id v2 = &stru_1F105D3F0;
  }

  return v2;
}

void sub_1B72F8704(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id WBSLocaleForCreditCardExpirationDate()
{
  if (WBSLocaleForCreditCardExpirationDate::once != -1) {
    dispatch_once(&WBSLocaleForCreditCardExpirationDate::once, &__block_literal_global_30);
  }
  uint64_t v0 = (void *)WBSLocaleForCreditCardExpirationDate::localeForCreditCardExpirationDate;
  return v0;
}

void __WBSLocaleForCreditCardExpirationDate_block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:@"en_US"];
  uint64_t v1 = (void *)WBSLocaleForCreditCardExpirationDate::localeForCreditCardExpirationDate;
  WBSLocaleForCreditCardExpirationDate::localeForCreditCardExpirationDate = v0;
}

uint64_t WBSStatusCodeGroupFromStatusCode(uint64_t a1)
{
  uint64_t v1 = 5;
  if ((unint64_t)(a1 - 500) >= 0x64) {
    uint64_t v1 = 0;
  }
  if ((unint64_t)(a1 - 400) >= 0x64) {
    uint64_t v2 = v1;
  }
  else {
    uint64_t v2 = 4;
  }
  if ((unint64_t)(a1 - 300) >= 0x64) {
    uint64_t v3 = v2;
  }
  else {
    uint64_t v3 = 3;
  }
  if ((unint64_t)(a1 - 200) >= 0x64) {
    uint64_t v4 = v3;
  }
  else {
    uint64_t v4 = 2;
  }
  if ((unint64_t)(a1 - 100) >= 0x64) {
    return v4;
  }
  else {
    return 1;
  }
}

void sub_1B72F9AAC(_Unwind_Exception *a1)
{
  uint64_t v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1B72F9C78(_Unwind_Exception *a1)
{
  id v7 = v6;

  _Unwind_Resume(a1);
}

void sub_1B72F9D34(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B72F9DA8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B72F9E70(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B72F9F14(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t WBSOngoingSharingInvitationFallbackURL()
{
  return [MEMORY[0x1E4F1CB10] URLWithString:@"https://www.icloud.com/unavailable_shared_passwords"];
}

uint64_t __Block_byref_object_copy__9(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__9(uint64_t a1)
{
}

void sub_1B72FA6B0(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

void WBSParseOperatingSystemVersion(void *a1@<X0>, uint64_t *a2@<X8>)
{
  id v11 = [a1 componentsSeparatedByString:@"."];
  uint64_t v3 = [v11 count];
  if ((unint64_t)(v3 - 4) > 0xFFFFFFFFFFFFFFFDLL)
  {
    uint64_t v4 = v3;
    BOOL v5 = [v11 objectAtIndexedSubscript:0];
    uint64_t v6 = [v5 integerValue];
    id v7 = [v11 objectAtIndexedSubscript:1];
    uint64_t v8 = [v7 integerValue];
    uint64_t v9 = 0;
    if (v4 == 3)
    {
      uint64_t v10 = [v11 objectAtIndexedSubscript:2];
      uint64_t v9 = [v10 integerValue];
    }
    *a2 = v6;
    a2[1] = v8;
    a2[2] = v9;
  }
  else
  {
    *a2 = 0;
    a2[1] = 0;
    a2[2] = 0;
  }
}

uint64_t WBSMakeOperatingSystemVersion@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void *a4@<X8>)
{
  *a4 = result;
  a4[1] = a2;
  a4[2] = a3;
  return result;
}

BOOL WBSAppWasLaunchedAfterMajorOSUpgrade(void *a1, void *a2)
{
  uint64_t v8 = 0;
  uint64_t v9 = 0;
  uint64_t v10 = 0;
  id v3 = a2;
  WBSParseOperatingSystemVersion(a1, &v8);
  uint64_t v5 = 0;
  uint64_t v6 = 0;
  uint64_t v7 = 0;
  WBSParseOperatingSystemVersion(v3, &v5);

  return v8 >= v5 && (v8 != v5 || v9 > v6);
}

BOOL WBSOperatingSystemVersionsEqual(void *a1, void *a2)
{
  return *a1 == *a2 && a1[1] == a2[1] && a1[2] == a2[2];
}

void sub_1B72FB784(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B72FB9C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B72FBB8C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

NSString *escapeHTML(NSString *a1)
{
  uint64_t v1 = a1;
  if (escapeHTML(NSString *)::once != -1) {
    dispatch_once(&escapeHTML(NSString *)::once, &__block_literal_global_34);
  }
  if ([(NSString *)v1 rangeOfCharacterFromSet:escapeHTML(NSString *)::htmlCharacters] == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v2 = 0;
  }
  else
  {
    uint64_t v2 = v1;
    id v3 = xmlEncodeEntitiesReentrant(0, (const xmlChar *)[(NSString *)v2 UTF8String]);
    uint64_t v1 = (NSString *)[[NSString alloc] initWithBytesNoCopy:v3 length:strlen((const char *)v3) encoding:4 deallocator:&__block_literal_global_82];
  }

  return v1;
}

void sub_1B72FBCA4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B72FBD80(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B72FBEE4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void ___ZL10escapeHTMLP8NSString_block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@"<>&\"'"];
  uint64_t v1 = (void *)escapeHTML(NSString *)::htmlCharacters;
  escapeHTML(NSString *)::htmlCharacters = v0;
}

uint64_t ___ZL10escapeHTMLP8NSString_block_invoke_2(uint64_t a1, uint64_t a2)
{
  return ((uint64_t (*)(uint64_t))*MEMORY[0x1E4FBA9D0])(a2);
}

void sub_1B72FC068(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B72FC0F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B72FC364(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void internalSubsetCallback(void *a1, const unsigned __int8 *a2, const unsigned __int8 *a3, const unsigned __int8 *a4)
{
  objc_msgSend(NSString, "stringWithUTF8String:", a2, a4);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_handleDoctype:");
}

void sub_1B72FC400(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void startElementCallback(void *a1, const unsigned __int8 *a2, const unsigned __int8 **a3)
{
  if (a3)
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    if (*a3)
    {
      uint64_t v7 = a3 + 2;
      do
      {
        uint64_t v8 = [NSString stringWithUTF8String:*(v7 - 1)];
        uint64_t v9 = [NSString stringWithUTF8String:*(v7 - 2)];
        [v6 setObject:v8 forKeyedSubscript:v9];

        uint64_t v10 = *v7;
        v7 += 2;
      }
      while (v10);
    }
    id v12 = v6;
  }
  else
  {
    id v12 = 0;
  }
  id v11 = [NSString stringWithUTF8String:a2];
  [a1 _handleStartElement:v11 attributes:v12];
}

void sub_1B72FC514(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void endElementCallback(void *a1, const unsigned __int8 *a2)
{
  id v3 = [NSString stringWithUTF8String:a2];
  objc_msgSend(a1, "_handleEndElement:");
}

void sub_1B72FC5B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void charactersCallback(void *a1, const unsigned __int8 *a2, int a3)
{
  id v4 = (id)[[NSString alloc] initWithBytes:a2 length:a3 encoding:4];
  objc_msgSend(a1, "_handleText:");
}

void sub_1B72FC640(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void errorCallback(void *a1, _xmlError *a2)
{
  v10[1] = *MEMORY[0x1E4F143B8];
  uint64_t code = a2->code;
  if ((code - 23) > 0x35 || ((1 << (code - 23)) & 0x20200000000001) == 0)
  {
    id v5 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v9 = *MEMORY[0x1E4F28568];
    id v6 = [NSString stringWithUTF8String:a2->message];
    v10[0] = v6;
    uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
    uint64_t v8 = [v5 errorWithDomain:@"WBSHTMLParserErrorDomain" code:code userInfo:v7];
    [a1 _handleError:v8];
  }
}

void sub_1B72FC770(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B72FC8AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B72FCA40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B72FCB7C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B72FCBF0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B72FD110(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_1B72FDEE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

__CFString *WBSUnlocalizedStringFromPasswordBreachCheckResult(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 2) {
    return @"Unknown";
  }
  else {
    return off_1E615BFA8[a1 - 1];
  }
}

void sub_1B73012D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B7301544(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va1, a7);
  va_start(va, a7);
  uint64_t v8 = va_arg(va1, void);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1B7301784(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va1, a7);
  va_start(va, a7);
  uint64_t v8 = va_arg(va1, void);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1B7301EC8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 96));
  _Unwind_Resume(a1);
}

unint64_t WBSPasswordBreachMurmur3HashWithSeed(void *a1, unsigned int a2)
{
  id v3 = a1;
  uint64_t v4 = [v3 bytes];
  unint64_t v5 = [v3 length];
  uint64_t v6 = a2;
  if (v5 >= 0x10)
  {
    unint64_t v8 = v5 >> 4;
    uint64_t v9 = (void *)(v4 + 8);
    uint64_t v7 = a2;
    do
    {
      uint64_t v7 = 5
         * (__ROR8__((0x4CF5AD432745937FLL * ((0x88A129EA80000000 * *(v9 - 1)) | ((0x87C37B91114253D5 * *(v9 - 1)) >> 33))) ^ v7, 37)+ v6)+ 1390208809;
      uint64_t v6 = 5
         * (v7
          + __ROR8__((0x87C37B91114253D5* ((0x4E8B26FE00000000 * *v9) | ((unint64_t)(0x4CF5AD432745937FLL * *v9) >> 31))) ^ v6, 33))+ 944331445;
      v9 += 2;
      --v8;
    }
    while (v8);
  }
  else
  {
    uint64_t v7 = a2;
  }
  unint64_t v10 = 0;
  unint64_t v11 = 0;
  unint64_t v12 = 0;
  unint64_t v13 = 0;
  unint64_t v14 = 0;
  unint64_t v15 = 0;
  unint64_t v16 = 0;
  unint64_t v17 = 0;
  unint64_t v18 = 0;
  unint64_t v19 = 0;
  unint64_t v20 = 0;
  unint64_t v21 = 0;
  unint64_t v22 = 0;
  int v23 = (unsigned __int8 *)(v4 + (v5 & 0xFFFFFFFFFFFFFFF0));
  switch(v5 & 0xF)
  {
    case 1uLL:
      goto LABEL_20;
    case 2uLL:
      goto LABEL_19;
    case 3uLL:
      goto LABEL_18;
    case 4uLL:
      goto LABEL_17;
    case 5uLL:
      goto LABEL_16;
    case 6uLL:
      goto LABEL_15;
    case 7uLL:
      goto LABEL_14;
    case 8uLL:
      goto LABEL_13;
    case 9uLL:
      goto LABEL_12;
    case 0xAuLL:
      goto LABEL_11;
    case 0xBuLL:
      goto LABEL_10;
    case 0xCuLL:
      goto LABEL_9;
    case 0xDuLL:
      goto LABEL_8;
    case 0xEuLL:
      goto LABEL_7;
    case 0xFuLL:
      unint64_t v10 = (unint64_t)v23[14] << 48;
LABEL_7:
      unint64_t v11 = v10 | ((unint64_t)v23[13] << 40);
LABEL_8:
      unint64_t v12 = v11 ^ ((unint64_t)v23[12] << 32);
LABEL_9:
      unint64_t v13 = v12 ^ ((unint64_t)v23[11] << 24);
LABEL_10:
      unint64_t v14 = v13 ^ ((unint64_t)v23[10] << 16);
LABEL_11:
      unint64_t v15 = v14 ^ ((unint64_t)v23[9] << 8);
LABEL_12:
      v6 ^= 0x87C37B91114253D5
          * ((0x4E8B26FE00000000 * (v15 ^ v23[8])) | ((0x4CF5AD432745937FLL * (v15 ^ v23[8])) >> 31));
LABEL_13:
      unint64_t v16 = (unint64_t)v23[7] << 56;
LABEL_14:
      unint64_t v17 = v16 | ((unint64_t)v23[6] << 48);
LABEL_15:
      unint64_t v18 = v17 ^ ((unint64_t)v23[5] << 40);
LABEL_16:
      unint64_t v19 = v18 ^ ((unint64_t)v23[4] << 32);
LABEL_17:
      unint64_t v20 = v19 ^ ((unint64_t)v23[3] << 24);
LABEL_18:
      unint64_t v21 = v20 ^ ((unint64_t)v23[2] << 16);
LABEL_19:
      unint64_t v22 = v21 ^ ((unint64_t)v23[1] << 8);
LABEL_20:
      v7 ^= 0x4CF5AD432745937FLL
          * ((0x88A129EA80000000 * (v22 ^ *v23)) | ((0x87C37B91114253D5 * (v22 ^ *v23)) >> 33));
      break;
    default:
      break;
  }
  unint64_t v24 = v6 ^ v5;
  unint64_t v25 = v24 + (v7 ^ v5);
  unint64_t v26 = v25 + v24;
  unint64_t v27 = 0xC4CEB9FE1A85EC53
      * ((0xFF51AFD7ED558CCDLL * (v25 ^ (v25 >> 33))) ^ ((0xFF51AFD7ED558CCDLL * (v25 ^ (v25 >> 33))) >> 33));
  unint64_t v28 = 0xC4CEB9FE1A85EC53
      * ((0xFF51AFD7ED558CCDLL * (v26 ^ (v26 >> 33))) ^ ((0xFF51AFD7ED558CCDLL * (v26 ^ (v26 >> 33))) >> 33));
  unint64_t v29 = (v28 ^ (v28 >> 33)) + (v27 ^ (v27 >> 33));

  return v29;
}

uint64_t __Block_byref_object_copy__10(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__10(uint64_t a1)
{
}

void sub_1B73098F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10)
{
  _Unwind_Resume(a1);
}

id appendedCanonicalizedCharactersFromCharacterClasses(void *a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v10 = a1;
  uint64_t v1 = [MEMORY[0x1E4F28E78] string];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v2 = v10;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v12 != v4) {
          objc_enumerationMutation(v2);
        }
        id v6 = *(id *)(*((void *)&v11 + 1) + 8 * i);
        uint64_t v7 = @"abcdefghijklmnopqrstuvwxyz";
        switch([v6 type])
        {
          case 0:
            uint64_t v8 = case 5:;
            goto LABEL_14;
          case 1:
            uint64_t v7 = @"0123456789";
            goto LABEL_12;
          case 2:
            goto LABEL_12;
          case 3:
            uint64_t v7 = @"ABCDEFGHIJKLMNOPQRSTUVWXYZ";
            goto LABEL_12;
          case 4:
LABEL_12:

            goto LABEL_15;
          case 6:
            uint64_t v8 = [v6 value];
LABEL_14:
            uint64_t v7 = (__CFString *)v8;

            if (v7) {
LABEL_15:
            }
              [v1 appendString:v7];
            break;
          default:

            uint64_t v7 = 0;
            break;
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v3);
  }

  return v1;
}

void sub_1B7309BD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1B7309D58(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t createLexiconWithLocale(NSString *a1)
{
  void v6[2] = *MEMORY[0x1E4F143B8];
  uint64_t v1 = a1;
  uint64_t v2 = *MEMORY[0x1E4F72448];
  v5[0] = *MEMORY[0x1E4F72458];
  v5[1] = v2;
  v6[0] = v1;
  v6[1] = MEMORY[0x1E4F1CC38];
  [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:2];
  uint64_t v3 = LXLexiconCreate();

  return v3;
}

void sub_1B7309EA0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B7309F30(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)WBSPasswordGenerationManager;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_1B7309FC0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL passwordMatchesFormatOfGenerationStyle(void *a1, uint64_t a2)
{
  id v3 = a1;
  uint64_t v4 = [v3 length];
  if (!a2)
  {
    if (v4 == 15 && [v3 containsString:@"-"])
    {
      if (regexForClassicPassword(void)::onceToken != -1) {
        dispatch_once(&regexForClassicPassword(void)::onceToken, &__block_literal_global_44);
      }
      uint64_t v5 = objc_msgSend((id)regexForClassicPassword(void)::regex, "numberOfMatchesInString:options:range:", v3, 0, 0, 15);
      goto LABEL_13;
    }
LABEL_14:
    BOOL v6 = 0;
    goto LABEL_15;
  }
  if (a2 != 2 || v4 != 20 || ![v3 containsString:@"-"]) {
    goto LABEL_14;
  }
  if (regexForMoreTypablePassword(void)::onceToken != -1) {
    dispatch_once(&regexForMoreTypablePassword(void)::onceToken, &__block_literal_global_148);
  }
  uint64_t v5 = objc_msgSend((id)regexForMoreTypablePassword(void)::regex, "numberOfMatchesInString:options:range:", v3, 0, 0, 20);
LABEL_13:
  BOOL v6 = v5 != 0;
LABEL_15:

  return v6;
}

void sub_1B730A0E4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B730A148(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B730A224(_Unwind_Exception *a1)
{
  uint64_t v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1B730A504(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t randomSyllable(void)
{
  uint64_t v0 = NSString;
  unsigned int v1 = randomConsonant();
  unsigned int v2 = randomVowel();
  return objc_msgSend(v0, "stringWithFormat:", @"%C%C%C", v1, v2, randomConsonant());
}

uint64_t randomConsonant(void)
{
  {
    LODWORD(v0) = randomConsonant(void)::lengthOfConsonants;
  }
  else
  {
    uint64_t v0 = [@"bcdfghjkmnpqrstvwxz" length];
    randomConsonant(void)::lengthOfConsonants = v0;
  }
  uint64_t v1 = arc4random_uniform(v0);
  return [@"bcdfghjkmnpqrstvwxz" characterAtIndex:v1];
}

uint64_t randomVowel(void)
{
  {
    LODWORD(v0) = randomVowel(void)::lengthOfVowels;
  }
  else
  {
    uint64_t v0 = [@"aeiouy" length];
    randomVowel(void)::lengthOfVowels = v0;
  }
  uint64_t v1 = arc4random_uniform(v0);
  return [@"aeiouy" characterAtIndex:v1];
}

uint64_t randomNumber(void)
{
  {
    LODWORD(v0) = randomNumber(void)::lengthOfNumbers;
  }
  else
  {
    uint64_t v0 = [@"0123456789" length];
    randomNumber(void)::lengthOfNumbers = v0;
  }
  uint64_t v1 = arc4random_uniform(v0);
  return [@"0123456789" characterAtIndex:v1];
}

void sub_1B730A824(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1B730AAC8(_Unwind_Exception *a1, void *a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);

  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B730BAEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,void *a28,uint64_t a29,void *a30,uint64_t a31,void *a32)
{
  _Unwind_Resume(a1);
}

void getPasswordRandomCharacters(uint64_t *a1, void *a2)
{
  id v3 = a2;
  uint64_t v5 = *a1;
  uint64_t v4 = a1[1];
  size_t v6 = (v4 - *a1) >> 1;
  std::vector<unsigned char>::vector(&__p, v6);
  uint64_t v7 = (char *)__p;
  unsigned __int8 v8 = [v3 length];
  if (v4 == v5) {
    goto LABEL_16;
  }
  uint64_t v21 = v5;
  uint64_t v22 = v4;
  unint64_t v9 = 0;
  unsigned int v10 = v8;
  unsigned int v11 = (0xFFu % v8) ^ 0xFF;
  long long v12 = (const __SecRandom *)*MEMORY[0x1E4F3BC60];
  long long v13 = v7;
  size_t v14 = v6;
  do
  {
    while (SecRandomCopyBytes(v12, v14, v13) == -1)
      ;
    size_t v15 = v6 - v9;
    if (v6 > v9)
    {
      uint64_t v16 = &v7[v9];
      do
      {
        unsigned int v18 = *v16++;
        unsigned int v17 = v18;
        if (v18 < v11) {
          v7[v9++] = v17 % v10;
        }
        --v15;
      }
      while (v15);
    }
    long long v13 = &v7[v9];
    size_t v14 = v6 - v9;
  }
  while (v6 > v9);
  if (v22 == v21)
  {
LABEL_16:
    if (__p)
    {
      unint64_t v24 = __p;
      operator delete(__p);
    }
  }
  else
  {
    unint64_t v19 = 0;
    if (v6 <= 1) {
      size_t v6 = 1;
    }
    while (v24 - (unsigned char *)__p > v19)
    {
      __int16 v20 = [v3 characterAtIndex:*((unsigned __int8 *)__p + v19)];
      if (v19 >= (a1[1] - *a1) >> 1) {
        break;
      }
      *(_WORD *)(*a1 + 2 * v19++) = v20;
      if (v6 == v19) {
        goto LABEL_16;
      }
    }
    __break(1u);
  }
}

void sub_1B730BFAC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13)
{
  if (__p) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

id tokenizedPassword(void *a1, uint64_t a2)
{
  id v3 = a1;
  uint64_t v4 = [v3 lowercaseString];
  if (a2 == 1) {
    goto LABEL_5;
  }
  if (a2 == 2)
  {
    if ([v3 length] == 18)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
      size_t v6 = objc_msgSend(v4, "substringWithRange:", 0, 6);
      uint64_t v7 = objc_msgSend(v6, "safari_setOfAllSubstringsWithMinimumLength:", 3);
      unsigned __int8 v8 = [v7 allObjects];
      [v5 addObjectsFromArray:v8];

      unint64_t v9 = objc_msgSend(v4, "substringWithRange:", 6, 6);
      unsigned int v10 = objc_msgSend(v9, "safari_setOfAllSubstringsWithMinimumLength:", 3);
      unsigned int v11 = [v10 allObjects];
      [v5 addObjectsFromArray:v11];

      long long v12 = objc_msgSend(v4, "substringWithRange:", 12, 6);
      long long v13 = objc_msgSend(v12, "safari_setOfAllSubstringsWithMinimumLength:", 3);
      size_t v14 = [v13 allObjects];
      [v5 addObjectsFromArray:v14];

      goto LABEL_9;
    }
  }
  else if (a2 == 3 && [v3 length] == 18)
  {
LABEL_5:
    objc_msgSend(v4, "safari_setOfAllSubstringsWithMinimumLength:", 3);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  id v5 = 0;
LABEL_9:

  return v5;
}

void sub_1B730C188(_Unwind_Exception *a1)
{
  uint64_t v7 = v4;

  _Unwind_Resume(a1);
}

void sub_1B730C2E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B730C394(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B730C41C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B730C4D8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B730C580(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void ___ZL23regexForClassicPasswordv_block_invoke()
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v0 = [NSString stringWithFormat:@"^[%@]{3}-[%@]{3}-[%@]{3}-[%@]{3}$", @"abcdefghijkmnopqrstuvwxyzABCDEFGHIJKLMNPQRSTUVWXYZ0123456789", @"abcdefghijkmnopqrstuvwxyzABCDEFGHIJKLMNPQRSTUVWXYZ0123456789", @"abcdefghijkmnopqrstuvwxyzABCDEFGHIJKLMNPQRSTUVWXYZ0123456789", @"abcdefghijkmnopqrstuvwxyzABCDEFGHIJKLMNPQRSTUVWXYZ0123456789"];
  id v6 = 0;
  uint64_t v1 = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:v0 options:16 error:&v6];
  id v2 = v6;
  id v3 = (void *)regexForClassicPassword(void)::regex;
  regexForClassicPassword(void)::regex = v1;

  if (v2)
  {
    uint64_t v4 = (id)WBS_LOG_CHANNEL_PREFIXPasswords();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      id v5 = objc_msgSend(v2, "safari_privacyPreservingDescription");
      ___ZL23regexForClassicPasswordv_block_invoke_cold_1(v5, buf, v4);
    }
  }
}

void sub_1B730C6B0(_Unwind_Exception *a1)
{
  uint64_t v4 = v3;

  _Unwind_Resume(a1);
}

void ___ZL27regexForMoreTypablePasswordv_block_invoke()
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v0 = [NSString stringWithFormat:@"^[%@]{6}-[%@]{6}-[%@]{6}$", @"abcdefghijkmnopqrstuvwxyzABCDEFGHIJKLMNPQRSTUVWXYZ0123456789", @"abcdefghijkmnopqrstuvwxyzABCDEFGHIJKLMNPQRSTUVWXYZ0123456789", @"abcdefghijkmnopqrstuvwxyzABCDEFGHIJKLMNPQRSTUVWXYZ0123456789"];
  id v6 = 0;
  uint64_t v1 = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:v0 options:16 error:&v6];
  id v2 = v6;
  id v3 = (void *)regexForMoreTypablePassword(void)::regex;
  regexForMoreTypablePassword(void)::regex = v1;

  if (v2)
  {
    uint64_t v4 = (id)WBS_LOG_CHANNEL_PREFIXPasswords();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      id v5 = objc_msgSend(v2, "safari_privacyPreservingDescription");
      ___ZL23regexForClassicPasswordv_block_invoke_cold_1(v5, buf, v4);
    }
  }
}

void sub_1B730C7EC(_Unwind_Exception *a1)
{
  uint64_t v4 = v3;

  _Unwind_Resume(a1);
}

char *std::vector<unsigned short>::vector(void *a1, uint64_t a2)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (!a2) {
    return (char *)a1;
  }
  uint64_t result = std::vector<unsigned short>::__vallocate[abi:sn180100](a1, a2);
  id v5 = (_WORD *)a1[1];
  id v6 = &v5[a2];
  uint64_t v7 = 2 * a2;
  while (v5)
  {
    *v5++ = 0;
    v7 -= 2;
    if (!v7)
    {
      a1[1] = v6;
      return (char *)a1;
    }
  }
  __break(1u);
  return result;
}

char *std::vector<unsigned short>::__vallocate[abi:sn180100](void *a1, uint64_t a2)
{
  if (a2 < 0) {
    abort();
  }
  uint64_t result = (char *)std::allocator<unsigned short>::allocate_at_least[abi:sn180100]((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[2 * v4];
  return result;
}

void *std::allocator<unsigned short>::allocate_at_least[abi:sn180100](uint64_t a1, uint64_t a2)
{
  if (a2 < 0) {
    std::__throw_bad_array_new_length[abi:sn180100]();
  }
  return operator new(2 * a2);
}

void std::__throw_bad_array_new_length[abi:sn180100]()
{
}

char *std::vector<unsigned char>::vector(void *a1, size_t a2)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (!a2) {
    return (char *)a1;
  }
  size_t v3 = a2;
  uint64_t result = std::vector<unsigned char>::__vallocate[abi:sn180100](a1, a2);
  id v5 = (unsigned char *)a1[1];
  id v6 = &v5[v3];
  while (v5)
  {
    *v5++ = 0;
    if (!--v3)
    {
      a1[1] = v6;
      return (char *)a1;
    }
  }
  __break(1u);
  return result;
}

char *std::vector<unsigned char>::__vallocate[abi:sn180100](void *a1, size_t __sz)
{
  if ((__sz & 0x8000000000000000) != 0) {
    abort();
  }
  uint64_t result = (char *)operator new(__sz);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[__sz];
  return result;
}

void ___ZL50ignorePasswordGenerationIsDisallowedByRequirementsv_block_invoke()
{
  if (+[WBSFeatureAvailability hasInternalContent])
  {
    id v0 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    ignorePasswordGenerationIsDisallowedByRequirements(void)::ignorePasswordGenerationIsDisallowedByRequirements = [v0 BOOLForKey:@"WBSIgnorePasswordGenerationIsDisallowedByRequirements"];
  }
  else
  {
    ignorePasswordGenerationIsDisallowedByRequirements(void)::ignorePasswordGenerationIsDisallowedByRequirements = 0;
  }
}

void sub_1B730CA2C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

uint64_t WBSAuthenticationPolicyForPasswordManager()
{
  if (+[WBSFeatureAvailability isDTOMitigationEnabled]) {
    return 1025;
  }
  else {
    return 2;
  }
}

uint64_t WBSAuthenticationPolicyForCreditCards()
{
  if (+[WBSFeatureAvailability isDTOMitigationEnabled]) {
    return 1025;
  }
  else {
    return 2;
  }
}

uint64_t WBSAuthenticationPolicyForCredentialsExport()
{
  if (+[WBSFeatureAvailability isDTOMitigationEnabled]) {
    return 1025;
  }
  else {
    return 2;
  }
}

double nChooseK(double a1, double a2)
{
  double v2 = 0.0;
  if (a2 <= a1)
  {
    if (a1 * 0.5 < a2) {
      a2 = a1 - a2;
    }
    double v2 = 1.0;
    if (a2 != 0.0 && a2 >= 1.0)
    {
      int v4 = 2;
      double v5 = 1.0;
      do
      {
        double v2 = v2 * (a1 - v5 + 1.0) / v5;
        double v5 = (double)v4++;
      }
      while (a2 >= v5);
    }
  }
  return v2;
}

void sub_1B73120D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

double factorial(unint64_t a1)
{
  double result = 1.0;
  if (a1 > 1) {
    return factorial(a1 - 1, 1.0) * (double)a1;
  }
  return result;
}

void sub_1B731231C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va1, a7);
  va_start(va, a7);
  uint64_t v8 = va_arg(va1, void);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

unsigned __int16 *skipWhitespaceCharacters(unsigned __int16 *result, void *a2)
{
  while (1)
  {
    unsigned int v2 = *result;
    BOOL v3 = v2 > 0x20;
    uint64_t v4 = (1 << v2) & 0x100003600;
    if (v3 || v4 == 0) {
      break;
    }
    ++result;
  }
  *a2 = result;
  return result;
}

__CFString *parseIdentifier(UniChar *chars, UniChar **a2, void *a3)
{
  BOOL v3 = chars;
  int v4 = *chars;
  if (*chars)
  {
    uint64_t v5 = 0;
    id v6 = chars;
    while (v4 == 45 || (v4 & 0xFFDFu) - 65 <= 0x19)
    {
      int v7 = v6[1];
      ++v6;
      int v4 = v7;
      --v5;
      if (!v7) {
        goto LABEL_8;
      }
    }
    if (v5)
    {
LABEL_8:
      *a3 = -1;
      *a2 = v6;
      uint64_t v8 = (__CFString *)CFStringCreateWithCharactersNoCopy((CFAllocatorRef)*MEMORY[0x1E4F1CF80], chars, -v5, (CFAllocatorRef)*MEMORY[0x1E4F1CFA0]);
      goto LABEL_11;
    }
    BOOL v3 = v6;
  }
  *a3 = 2;
  *a2 = v3;
  uint64_t v8 = &stru_1F105D3F0;
LABEL_11:
  return v8;
}

id parseNamedCharacterClass(UniChar *a1, void *a2, void *a3)
{
  uint64_t v11 = a1;
  uint64_t v5 = parseIdentifier(a1, &v11, a3);
  id v6 = v5;
  if (*a3 != -1)
  {
    int v7 = 0;
LABEL_3:
    *a2 = v11;
    goto LABEL_17;
  }
  uint64_t v8 = [v5 lowercaseString];
  if ([v8 isEqualToString:@"ascii-printable"])
  {
    uint64_t v9 = 0;
  }
  else if ([v8 isEqualToString:@"lower"])
  {
    uint64_t v9 = 2;
  }
  else if ([v8 isEqualToString:@"upper"])
  {
    uint64_t v9 = 3;
  }
  else if ([v8 isEqualToString:@"digit"])
  {
    uint64_t v9 = 1;
  }
  else if ([v8 isEqualToString:@"special"])
  {
    uint64_t v9 = 4;
  }
  else
  {
    if (([v8 isEqualToString:@"unicode"] & 1) == 0)
    {

      int v7 = 0;
      *a3 = 1;
      goto LABEL_3;
    }
    uint64_t v9 = 5;
  }

  *a3 = -1;
  *a2 = v11;
  int v7 = +[WBSPasswordCharacterClass namedCharacterClassWithType:v9];
LABEL_17:

  return v7;
}

uint64_t parsePositiveIntegerPropertyValue(unsigned __int16 *a1, void *a2, uint64_t *a3)
{
  unsigned int v3 = *a1;
  if (v3 - 48 > 9)
  {
    uint64_t v4 = -1;
    uint64_t v6 = 3;
  }
  else
  {
    uint64_t v4 = 0;
    if (*a1)
    {
      while (v3 != 59)
      {
        if (v3 - 48 > 9)
        {
          BOOL v7 = v3 == 0;
          if (v3) {
            uint64_t v6 = 3;
          }
          else {
            uint64_t v6 = -1;
          }
          if (!v7) {
            uint64_t v4 = -1;
          }
          goto LABEL_13;
        }
        uint64_t v4 = 10 * v4 + v3 - 48;
        unsigned int v5 = a1[1];
        ++a1;
        unsigned int v3 = v5;
        if (!v5) {
          break;
        }
      }
    }
    uint64_t v6 = -1;
  }
LABEL_13:
  *a3 = v6;
  *a2 = a1;
  return v4;
}

id parseCustomCharacterClass(_WORD *a1, void *a2, void *a3)
{
  if (*a1 == 91)
  {
    uint64_t v6 = [MEMORY[0x1E4F28E78] string];
    BOOL v7 = a1 + 2;
    for (unint64_t i = 1; ; ++i)
    {
      int v9 = (unsigned __int16)*(v7 - 1);
      if (!*(v7 - 1))
      {
        uint64_t v10 = 0;
        *a3 = 3;
        *a2 = v7 - 1;
        goto LABEL_16;
      }
      if (v9 == 93) {
        break;
      }
      if ((v9 - 32) < 0x5F && (i < 2 || v9 != 45)) {
        objc_msgSend(v6, "appendFormat:", @"%C", (unsigned __int16)*(v7 - 1));
      }
      ++v7;
    }
    if (*v7 == 93) {
      objc_msgSend(v6, "appendFormat:", @"%C", 93);
    }
    else {
      --v7;
    }
    *a3 = -1;
    *a2 = v7;
    uint64_t v10 = +[WBSPasswordCharacterClass customCharacterClassWithValue:v6];
LABEL_16:
  }
  else
  {
    uint64_t v10 = 0;
    *a3 = 3;
    *a2 = a1;
  }
  return v10;
}

id parsePasswordRequiredOrAllowedPropertyValue(UniChar *a1, UniChar **a2, uint64_t *a3)
{
  unsigned int v5 = a1;
  unint64_t v19 = a1;
  uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
  unsigned int v7 = *v5;
LABEL_2:
  if (v7)
  {
    if (v7 == 45 || (v7 & 0xFFDF) - 65 <= 0x19)
    {
      uint64_t v11 = parseNamedCharacterClass(v5, &v19, a3);
      uint64_t v12 = v11;
      if (*a3 == -1)
      {
        [v6 addObject:v11];

        uint64_t v10 = v19;
LABEL_10:
        unsigned int v5 = v10 + 1;
        for (unint64_t i = v10; ; ++i)
        {
          uint64_t v14 = *i;
          if (v14 > 0x3B) {
            break;
          }
          if (((1 << v14) & 0x100003600) == 0)
          {
            if (v14 == 44)
            {
              while (1)
              {
                unsigned int v7 = *v5;
                if (v7 > 0x20 || ((1 << v7) & 0x100003600) == 0) {
                  break;
                }
                ++v5;
              }
              unint64_t v19 = v5;
              if (!v7)
              {
                uint64_t v16 = 2;
                goto LABEL_33;
              }
              goto LABEL_2;
            }
            if (v14 == 59)
            {
              uint64_t v10 = i;
              goto LABEL_25;
            }
            break;
          }
          ++v5;
        }
        if (!*i) {
          goto LABEL_25;
        }
        *a3 = 3;
        *a2 = i;
        goto LABEL_27;
      }
      *a2 = v5;
    }
    else if (v7 == 91)
    {
      uint64_t v8 = parseCustomCharacterClass(v5, &v19, a3);
      int v9 = v8;
      if (*a3 == -1)
      {
        [v6 addObject:v8];
        uint64_t v10 = v19 + 1;

        goto LABEL_10;
      }
      *a2 = v19;
    }
    else
    {
      uint64_t v16 = 3;
LABEL_33:
      *a3 = v16;
      *a2 = v5;
    }
LABEL_27:
    id v17 = (id)MEMORY[0x1E4F1CBF0];
    goto LABEL_28;
  }
  uint64_t v10 = v5;
LABEL_25:
  *a3 = -1;
  *a2 = v10;
  id v17 = v6;
LABEL_28:

  return v17;
}

id parsePasswordRule(UniChar *a1, UniChar **a2, uint64_t *a3)
{
  unint64_t v26 = a1;
  uint64_t v6 = parseIdentifier(a1, &v26, a3);
  unsigned int v7 = v6;
  if (*a3 == -1)
  {
    uint64_t v10 = [v6 lowercaseString];
    char v11 = [v10 isEqualToString:@"allowed"];
    if (v11)
    {
      char v12 = 0;
      unint64_t v13 = 0;
    }
    else if ([v10 isEqualToString:@"required"])
    {
      char v12 = 0;
      unint64_t v13 = 1;
    }
    else if ([v10 isEqualToString:@"max-consecutive"])
    {
      char v12 = 0;
      unint64_t v13 = 2;
    }
    else if ([v10 isEqualToString:@"minlength"])
    {
      char v12 = 1;
      unint64_t v13 = 3;
    }
    else
    {
      if (([v10 isEqualToString:@"maxlength"] & 1) == 0)
      {

        uint64_t v8 = 0;
        *a3 = 2;
        *a2 = a1;
        goto LABEL_33;
      }
      char v12 = 0;
      unint64_t v13 = 4;
    }

    for (unint64_t i = v26; ; ++i)
    {
      uint64_t v14 = *i;
      if (v14 > 0x3A) {
        goto LABEL_31;
      }
      if (((1 << v14) & 0x100003600) == 0) {
        break;
      }
    }
    if (v14 != 58)
    {
LABEL_31:
      uint64_t v8 = 0;
      *a3 = 3;
      goto LABEL_32;
    }
    for (j = i + 1; ; ++j)
    {
      unsigned int v16 = *j;
      if (v16 > 0x20 || ((1 << v16) & 0x100003600) == 0) {
        break;
      }
    }
    unint64_t v26 = j;
    if (v16 == 59 || v16 == 0)
    {
      *a3 = -1;
      *a2 = j;
      switch(v13)
      {
        case 0uLL:
          uint64_t v19 = +[WBSAllowedPasswordRule allowedRuleWithCharacterClasses:0];
          break;
        case 1uLL:
          uint64_t v19 = +[WBSRequiredPasswordRule requiredRuleWithCharacterClasses:0];
          break;
        case 2uLL:
          uint64_t v19 = +[WBSMaxConsecutivePasswordRule maxConsecutiveRuleWithValue:0];
          break;
        case 3uLL:
          uint64_t v19 = +[WBSMinLengthPasswordRule minLengthRuleWithValue:0];
          break;
        case 4uLL:
          uint64_t v19 = +[WBSMaxLengthPasswordRule maxLengthRuleWithValue:0];
          break;
        default:
          goto LABEL_51;
      }
      uint64_t v8 = (void *)v19;
      goto LABEL_33;
    }
    if (v13 < 2)
    {
      unint64_t v24 = parsePasswordRequiredOrAllowedPropertyValue(j, &v26, a3);
      *a2 = v26;
      if (*a3 == -1)
      {
        if (v11) {
          +[WBSAllowedPasswordRule allowedRuleWithCharacterClasses:v24];
        }
        else {
        uint64_t v8 = +[WBSRequiredPasswordRule requiredRuleWithCharacterClasses:v24];
        }
      }
      else
      {
        uint64_t v8 = 0;
      }

      goto LABEL_33;
    }
    if (v13 - 3 >= 2)
    {
      if (v13 != 2)
      {
        uint64_t v8 = 0;
        *a3 = 0;
        *a2 = j;
        goto LABEL_33;
      }
      uint64_t v25 = parsePositiveIntegerPropertyValue(j, &v26, a3);
      *a2 = v26;
      if (*a3 == -1)
      {
        uint64_t v22 = [NSNumber numberWithInteger:v25];
        uint64_t v23 = +[WBSMaxConsecutivePasswordRule maxConsecutiveRuleWithValue:v22];
LABEL_58:
        uint64_t v8 = (void *)v23;

        goto LABEL_33;
      }
    }
    else
    {
      uint64_t v21 = parsePositiveIntegerPropertyValue(j, &v26, a3);
      *a2 = v26;
      if (*a3 == -1)
      {
        uint64_t v22 = [NSNumber numberWithInteger:v21];
        if (v12) {
          +[WBSMinLengthPasswordRule minLengthRuleWithValue:v22];
        }
        else {
        uint64_t v23 = +[WBSMaxLengthPasswordRule maxLengthRuleWithValue:v22];
        }
        goto LABEL_58;
      }
    }
LABEL_51:
    uint64_t v8 = 0;
    goto LABEL_33;
  }
  uint64_t v8 = 0;
  unint64_t i = v26;
LABEL_32:
  *a2 = i;
LABEL_33:

  return v8;
}

id parsePasswordRules(UniChar *i, uint64_t *a2)
{
  uint64_t v4 = [MEMORY[0x1E4F1CA48] array];
  while (1)
  {
    unsigned int v5 = *i;
    if (v5 > 0x20 || ((1 << v5) & 0x100003600) == 0) {
      break;
    }
    ++i;
  }
  unsigned int v18 = i;
  if (v5)
  {
    id v7 = (id)MEMORY[0x1E4F1CBF0];
    while (v5 == 45 || (v5 & 0xFFDF) - 65 <= 0x19)
    {
      uint64_t v8 = parsePasswordRule(i, &v18, a2);
      int v9 = v8;
      if (*a2 != -1)
      {
LABEL_29:

        goto LABEL_30;
      }
      uint64_t v10 = [v8 value];

      if (v10) {
        [v4 addObject:v9];
      }
      char v11 = v18;
      for (unint64_t i = v18 + 1; ; ++i)
      {
        uint64_t v12 = *v11;
        if (v12 > 0x3B) {
          goto LABEL_28;
        }
        if (((1 << v12) & 0x100003600) == 0) {
          break;
        }
        ++v11;
      }
      if (!*v11)
      {
        *a2 = -1;
        id v7 = v4;
        goto LABEL_29;
      }
      if (v12 != 59)
      {
LABEL_28:
        *a2 = 3;
        id v7 = (id)MEMORY[0x1E4F1CBF0];
        goto LABEL_29;
      }
      while (1)
      {
        unsigned int v13 = *i;
        BOOL v14 = v13 > 0x20;
        uint64_t v15 = (1 << v13) & 0x100003600;
        if (v14 || v15 == 0) {
          break;
        }
        ++i;
      }
      unsigned int v18 = i;

      unsigned int v5 = *i;
      if (!*i) {
        break;
      }
    }
  }
  *a2 = -1;
  id v7 = v4;
LABEL_30:

  return v7;
}

id canonicalizedCharacterClasses(void *a1)
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  if (![v1 count])
  {
    id v33 = (void *)MEMORY[0x1E4F1CBF0];
    goto LABEL_77;
  }
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  unsigned int v2 = (__CFString *)v1;
  uint64_t v3 = [(__CFString *)v2 countByEnumeratingWithState:&v43 objects:v52 count:16];
  if (!v3) {
    goto LABEL_11;
  }
  uint64_t v4 = v3;
  uint64_t v5 = *(void *)v44;
  while (2)
  {
    for (uint64_t i = 0; i != v4; ++i)
    {
      if (*(void *)v44 != v5) {
        objc_enumerationMutation(v2);
      }
      uint64_t v7 = [*(id *)(*((void *)&v43 + 1) + 8 * i) type];
      if (!v7)
      {
        long long v30 = +[WBSPasswordCharacterClass asciiPrintableCharacterClass];
        unint64_t v50 = v30;
        id v32 = &v50;
LABEL_73:
        id v31 = (void *)MEMORY[0x1E4F1C978];
        goto LABEL_74;
      }
      if (v7 == 5)
      {
        long long v30 = +[WBSPasswordCharacterClass unicodeCharacterClass];
        v51 = v30;
        id v32 = &v51;
        goto LABEL_73;
      }
    }
    uint64_t v4 = [(__CFString *)v2 countByEnumeratingWithState:&v43 objects:v52 count:16];
    if (v4) {
      continue;
    }
    break;
  }
LABEL_11:

  Mutable = CFBitVectorCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 95);
  CFBitVectorSetCount(Mutable, 95);
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  int v9 = v2;
  uint64_t v10 = [(__CFString *)v9 countByEnumeratingWithState:&v39 objects:v49 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v40;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v40 != v12) {
          objc_enumerationMutation(v9);
        }
        BOOL v14 = *(void **)(*((void *)&v39 + 1) + 8 * v13);
        uint64_t v15 = objc_msgSend(v14, "type", (void)v39);
        v16.locatioCFIndex n = 33;
        v16.length = 26;
        switch(v15)
        {
          case 1:
            v16.locatioCFIndex n = 16;
            v16.length = 10;
            goto LABEL_20;
          case 2:
            v16.locatioCFIndex n = 65;
            v16.length = 26;
            goto LABEL_20;
          case 3:
            goto LABEL_20;
          case 4:
            v55.locatioCFIndex n = 0;
            v55.length = 16;
            CFBitVectorSetBits(Mutable, v55, 1u);
            v56.locatioCFIndex n = 26;
            v56.length = 7;
            CFBitVectorSetBits(Mutable, v56, 1u);
            v57.locatioCFIndex n = 59;
            v57.length = 6;
            CFBitVectorSetBits(Mutable, v57, 1u);
            v16.locatioCFIndex n = 91;
            v16.length = 4;
LABEL_20:
            CFBitVectorSetBits(Mutable, v16, 1u);
            break;
          case 6:
            id v17 = objc_msgSend(v14, "value", 26);
            markBitsForCustomCharacterClassPropertyValue(Mutable, v17);

            break;
          default:
            break;
        }
        ++v13;
      }
      while (v11 != v13);
      uint64_t v18 = [(__CFString *)v9 countByEnumeratingWithState:&v39 objects:v49 count:16];
      uint64_t v11 = v18;
    }
    while (v18);
  }

  unsigned int v2 = [MEMORY[0x1E4F28E78] string];
  CFIndex v19 = 0;
  for (CFIndex j = 33; j != 59; ++j)
  {
    if (CFBitVectorGetBitAtIndex(Mutable, j)) {
      chars[v19++] = j + 32;
    }
  }
  if (v19 && v19 != 26) {
    CFStringAppendCharacters(v2, chars, v19);
  }
  CFIndex v21 = 0;
  for (CFIndex k = 65; k != 91; ++k)
  {
    if (CFBitVectorGetBitAtIndex(Mutable, k)) {
      chars[v21++] = k + 32;
    }
  }
  if (v21 && v21 != 26) {
    CFStringAppendCharacters(v2, chars, v21);
  }
  CFIndex v23 = 0;
  for (CFIndex m = 16; m != 26; ++m)
  {
    if (CFBitVectorGetBitAtIndex(Mutable, m)) {
      chars[v23++] = m + 32;
    }
  }
  if (v23 && v23 != 10) {
    CFStringAppendCharacters(v2, chars, v23);
  }
  CFIndex v25 = 0;
  CFIndex v26 = 0;
  do
  {
    if (CFBitVectorGetBitAtIndex(Mutable, v25)) {
      chars[v26++] = v25 + 32;
    }
    ++v25;
  }
  while (v25 != 16);
  for (CFIndex n = 26; n != 33; ++n)
  {
    if (CFBitVectorGetBitAtIndex(Mutable, n)) {
      chars[v26++] = n + 32;
    }
  }
  for (iuint64_t i = 59; ii != 65; ++ii)
  {
    if (CFBitVectorGetBitAtIndex(Mutable, ii)) {
      chars[v26++] = ii + 32;
    }
  }
  for (jCFIndex j = 91; jj != 95; ++jj)
  {
    if (CFBitVectorGetBitAtIndex(Mutable, jj)) {
      chars[v26++] = jj + 32;
    }
  }
  if (v26 && v26 != 33) {
    CFStringAppendCharacters(v2, chars, v26);
  }
  CFRelease(Mutable);
  if (v19 == 26 && v21 == 26 && v23 == 10 && v26 == 33)
  {
    long long v30 = +[WBSPasswordCharacterClass asciiPrintableCharacterClass];
    BOOL v47 = v30;
    id v31 = (void *)MEMORY[0x1E4F1C978];
    id v32 = &v47;
LABEL_74:
    id v33 = objc_msgSend(v31, "arrayWithObjects:count:", v32, 1, (void)v39);
LABEL_75:
  }
  else
  {
    id v33 = objc_msgSend(MEMORY[0x1E4F1CA48], "array", (void)v39);
    if (v19 == 26)
    {
      uint64_t v35 = +[WBSPasswordCharacterClass uppercaseCharacterClass];
      [v33 addObject:v35];
    }
    if (v21 == 26)
    {
      uint64_t v36 = +[WBSPasswordCharacterClass lowercaseCharacterClass];
      [v33 addObject:v36];
    }
    if (v23 == 10)
    {
      long long v37 = +[WBSPasswordCharacterClass digitCharacterClass];
      [v33 addObject:v37];
    }
    if (v26 == 33)
    {
      uint64_t v38 = +[WBSPasswordCharacterClass specialCharacterClass];
      [v33 addObject:v38];
    }
    if ([(__CFString *)v2 length])
    {
      long long v30 = +[WBSPasswordCharacterClass customCharacterClassWithValue:v2];
      [v33 addObject:v30];
      goto LABEL_75;
    }
  }

LABEL_77:
  return v33;
}

void markBitsForCustomCharacterClassPropertyValue(__CFBitVector *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (v3)
  {
    long long v19 = 0u;
    memset(v18, 0, sizeof(v18));
    unint64_t v5 = objc_msgSend(v3, "length", 0, 0, 0, 0, 0);
    id v6 = v4;
    unint64_t v17 = v5;
    *(void *)&v18[0] = 0;
    id v16 = v6;
    if (v5)
    {
      if (v5 >= 0x20) {
        unint64_t v5 = 32;
      }
      unint64_t v14 = v5;
      objc_msgSend(v6, sel_getUid("getCharacters:range:"), (char *)v18 + 8, 0, v5);
      __int16 v7 = WORD4(v18[0]);
    }
    else
    {
      unint64_t v14 = 0;
      __int16 v7 = -1;
    }
    uint64_t v15 = 1;
    WORD4(v19) = v7;

    unint64_t v8 = 1;
    unint64_t v9 = v14;
    if (v14)
    {
      do
      {
        uint64_t v10 = WORD4(v19);
        if (v8 >= v9)
        {
          unint64_t v12 = *(void *)&v18[0] + v9;
          if (v17 <= *(void *)&v18[0] + v9)
          {
            unint64_t v8 = v9 + 1;
            uint64_t v15 = v9 + 1;
            WORD4(v19) = -1;
          }
          else
          {
            if (v17 - (*(void *)&v18[0] + v9) >= 0x20) {
              uint64_t v13 = 32;
            }
            else {
              uint64_t v13 = v17 - (*(void *)&v18[0] + v9);
            }
            *(void *)&v18[0] += v9;
            unint64_t v14 = v13;
            objc_msgSend(v16, sel_getUid("getCharacters:range:"), (char *)v18 + 8, v12, v13);
            WORD4(v19) = WORD4(v18[0]);
            uint64_t v15 = 1;
            unint64_t v8 = 1;
          }
        }
        else
        {
          uint64_t v11 = (char *)&v14 + 2 * v8++;
          uint64_t v15 = v8;
          WORD4(v19) = *((_WORD *)v11 + 20);
        }
        if ((v10 - 32) <= 0x5E)
        {
          CFBitVectorSetBitAtIndex(a1, v10 - 32, 1u);
          unint64_t v8 = v15;
        }
        unint64_t v9 = v14;
      }
      while (v8 - 1 < v14);
    }
  }
}

uint64_t __intersectCharacterClasses_block_invoke(uint64_t a1, int a2)
{
  char v2 = a2;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = 40;
  if (a2) {
    uint64_t v4 = 32;
  }
  id v5 = *(id *)(a1 + v4);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = 0;
    uint64_t v9 = *(void *)v20;
    uint64_t v10 = (id *)(a1 + 48);
    uint64_t v11 = (id *)(a1 + 56);
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v13 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        switch([v13 type])
        {
          case 0:
            v8 |= 0x20uLL;
            break;
          case 1:
            v8 |= 4uLL;
            break;
          case 2:
            v8 |= 2uLL;
            break;
          case 3:
            v8 |= 1uLL;
            break;
          case 4:
            v8 |= 8uLL;
            break;
          case 5:
            v8 |= 0x10uLL;
            break;
          case 6:
            uint64_t v14 = [v13 value];
            uint64_t v15 = (void *)v14;
            if (v14) {
              char v16 = v2;
            }
            else {
              char v16 = 0;
            }
            unint64_t v17 = v10;
            if ((v16 & 1) != 0 || v14 && (unint64_t v17 = v11, (v2 & 1) == 0)) {
              [*v17 appendString:v14];
            }

            break;
          default:
            continue;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v7);
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

void sub_1B7317680(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,char a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,char a55)
{
}

uint64_t __Block_byref_object_copy__11(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__11(uint64_t a1)
{
}

void sub_1B73195C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B731965C(_Unwind_Exception *a1)
{
  char v2 = v1;

  _Unwind_Resume(a1);
}

void sub_1B7319944(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11)
{
  _Unwind_Resume(a1);
}

void sub_1B7319A88(_Unwind_Exception *a1)
{
  MEMORY[0x1BA9BC7E0](v1, 0x1080C40D2F62047);
  _Unwind_Resume(a1);
}

void sub_1B7319D18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, void *a8, ...)
{
  va_start(va, a8);

  std::unique_ptr<SafariShared::SuddenTerminationDisabler>::reset[abi:sn180100]((id **)va, 0);
  _Unwind_Resume(a1);
}

void sub_1B7319E60(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B731A0E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B731A284(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B731A444(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B731A53C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1B731A5D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B731C73C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object, uint64_t a11, void *a12, void *a13, void *a14, uint64_t a15, int a16, __int16 a17, char a18, char a19, void *__p,uint64_t a21,int a22,__int16 a23,char a24,char a25,uint64_t a26,void *a27,uint64_t a28,int a29,__int16 a30,char a31,char a32,std::exception a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,void *a38,uint64_t a39,int a40,__int16 a41,char a42,char a43,void *a44,uint64_t a45,int a46,__int16 a47,char a48,char a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54)
{
  nlohmann::detail::parse_error::~parse_error(&a33);
  if (a25 < 0) {
    operator delete(__p);
  }
  if (a19 < 0) {
    operator delete(a14);
  }
  if (a43 < 0) {
    operator delete(a38);
  }
  if (a44) {
    operator delete(a44);
  }
  nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::~lexer(v55);
  std::__function::__value_func<BOOL ()(int,nlohmann::detail::parse_event_t,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> &)>::~__value_func[abi:sn180100](&a54);
  std::__function::__value_func<BOOL ()(int,nlohmann::detail::parse_event_t,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> &)>::~__value_func[abi:sn180100](&a50);

  _Unwind_Resume(a1);
}

void anonymous namespace'::JSONSAXAdapter::~JSONSAXAdapter(id *this)
{
}

{
  uint64_t vars8;

  JUMPOUT(0x1BA9BC7E0);
}

void sub_1B731CBAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, void *a4, void *a5, ...)
{
  va_start(va2, a5);
  va_start(va1, a5);
  va_start(va, a5);
  uint64_t v9 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  va_copy(va2, va1);
  uint64_t v12 = va_arg(va2, void);
  uint64_t v14 = va_arg(va2, void);
  nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::input_stream_adapter>::~lexer((void **)(v6 + 40));
  std::__function::__value_func<BOOL ()(int,nlohmann::detail::parse_event_t,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> &)>::~__value_func[abi:sn180100]((void *)(v7 - 224));
  std::__function::__value_func<BOOL ()(int,nlohmann::detail::parse_event_t,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> &)>::~__value_func[abi:sn180100]((void *)(v7 - 256));
  nlohmann::detail::input_stream_adapter::~input_stream_adapter((nlohmann::detail::input_stream_adapter *)va);
  nlohmann::detail::input_stream_adapter::~input_stream_adapter((nlohmann::detail::input_stream_adapter *)va1);
  std::ifstream::~ifstream((uint64_t *)va2);

  _Unwind_Resume(a1);
}

uint64_t *std::ifstream::basic_ifstream(uint64_t *a1)
{
  uint64_t v2 = MEMORY[0x1E4FBA460] + 64;
  a1[53] = MEMORY[0x1E4FBA460] + 64;
  id v3 = a1 + 2;
  uint64_t v4 = *(void *)(MEMORY[0x1E4FBA3F8] + 16);
  uint64_t v5 = *(void *)(MEMORY[0x1E4FBA3F8] + 8);
  *a1 = v5;
  *(uint64_t *)((char *)a1 + *(void *)(v5 - 24)) = v4;
  a1[1] = 0;
  uint64_t v6 = (std::ios_base *)((char *)a1 + *(void *)(*a1 - 24));
  std::ios_base::init(v6, a1 + 2);
  uint64_t v7 = MEMORY[0x1E4FBA460] + 24;
  v6[1].__vftable = 0;
  v6[1].__fmtflags_ = -1;
  *a1 = v7;
  a1[53] = v2;
  MEMORY[0x1BA9BC6F0](v3);
  if (!std::filebuf::open()) {
    std::ios_base::clear((std::ios_base *)((char *)a1 + *(void *)(*a1 - 24)), *(_DWORD *)((char *)a1 + *(void *)(*a1 - 24) + 32) | 4);
  }
  return a1;
}

void sub_1B731CDB0(_Unwind_Exception *a1)
{
  std::istream::~istream();
  MEMORY[0x1BA9BC770](v1);
  _Unwind_Resume(a1);
}

void *std::ifstream::~ifstream(void *a1)
{
  uint64_t v2 = MEMORY[0x1E4FBA3F8];
  uint64_t v3 = *MEMORY[0x1E4FBA3F8];
  *a1 = *MEMORY[0x1E4FBA3F8];
  *(void *)((char *)a1 + *(void *)(v3 - 24)) = *(void *)(v2 + 24);
  MEMORY[0x1BA9BC700](a1 + 2);
  std::istream::~istream();
  MEMORY[0x1BA9BC770](a1 + 53);
  return a1;
}

void sub_1B731D0A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,void *a32,void *a33,char a34,uint64_t a35,char a36)
{
  nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::input_stream_adapter>::~lexer((void **)(v37 + 40));
  std::__function::__value_func<BOOL ()(int,nlohmann::detail::parse_event_t,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> &)>::~__value_func[abi:sn180100]((void *)(v38 - 224));
  std::__function::__value_func<BOOL ()(int,nlohmann::detail::parse_event_t,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> &)>::~__value_func[abi:sn180100]((void *)(v38 - 256));
  nlohmann::detail::input_stream_adapter::~input_stream_adapter((nlohmann::detail::input_stream_adapter *)&a34);
  nlohmann::detail::input_stream_adapter::~input_stream_adapter((nlohmann::detail::input_stream_adapter *)&a36);
  std::istream::~istream();
  std::streambuf::~streambuf();

  _Unwind_Resume(a1);
}

uint64_t anonymous namespace'::JSONSAXAdapter::null(_anonymous_namespace_::JSONSAXAdapter *this)
{
  uint64_t v2 = *((void *)this + 1);
  uint64_t v1 = (void *)*((void *)this + 2);
  uint64_t v3 = [MEMORY[0x1E4F1CA98] null];
  uint64_t v4 = [v1 jsonReader:v2 scalarValue:v3];

  return v4;
}

void sub_1B731D1C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t anonymous namespace'::JSONSAXAdapter::BOOLean(_anonymous_namespace_::JSONSAXAdapter *this, uint64_t a2)
{
  uint64_t v3 = *((void *)this + 1);
  uint64_t v2 = (void *)*((void *)this + 2);
  uint64_t v4 = [NSNumber numberWithBool:a2];
  uint64_t v5 = [v2 jsonReader:v3 scalarValue:v4];

  return v5;
}

void sub_1B731D22C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t anonymous namespace'::JSONSAXAdapter::number_integer(_anonymous_namespace_::JSONSAXAdapter *this, uint64_t a2)
{
  uint64_t v3 = *((void *)this + 1);
  uint64_t v2 = (void *)*((void *)this + 2);
  uint64_t v4 = [NSNumber numberWithLongLong:a2];
  uint64_t v5 = [v2 jsonReader:v3 scalarValue:v4];

  return v5;
}

void sub_1B731D298(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t anonymous namespace'::JSONSAXAdapter::number_unsigned(_anonymous_namespace_::JSONSAXAdapter *this, uint64_t a2)
{
  uint64_t v3 = *((void *)this + 1);
  uint64_t v2 = (void *)*((void *)this + 2);
  uint64_t v4 = [NSNumber numberWithUnsignedLongLong:a2];
  uint64_t v5 = [v2 jsonReader:v3 scalarValue:v4];

  return v5;
}

void sub_1B731D304(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t anonymous namespace'::JSONSAXAdapter::number_float(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 8);
  uint64_t v1 = *(void **)(a1 + 16);
  uint64_t v3 = objc_msgSend(NSNumber, "numberWithDouble:");
  uint64_t v4 = [v1 jsonReader:v2 scalarValue:v3];

  return v4;
}

void sub_1B731D36C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t anonymous namespace'::JSONSAXAdapter::string(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *(void *)(a1 + 8);
  uint64_t v2 = *(void **)(a1 + 16);
  if (*((char *)a2 + 23) >= 0) {
    uint64_t v4 = a2;
  }
  else {
    uint64_t v4 = (uint64_t *)*a2;
  }
  uint64_t v5 = [NSString stringWithUTF8String:v4];
  uint64_t v6 = [v2 jsonReader:v3 scalarValue:v5];

  return v6;
}

void sub_1B731D3E4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t anonymous namespace'::JSONSAXAdapter::binary(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 8);
  uint64_t v2 = *(void **)(a1 + 16);
  uint64_t v4 = [MEMORY[0x1E4F1C9B8] dataWithBytes:*a2 length:a2[1] - *a2];
  uint64_t v5 = [v2 jsonReader:v3 scalarValue:v4];

  return v5;
}

void sub_1B731D454(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t anonymous namespace'::JSONSAXAdapter::start_object(id *this)
{
  return [this[2] jsonReaderBeginObject:this[1]];
}

uint64_t anonymous namespace'::JSONSAXAdapter::key(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *(void *)(a1 + 8);
  uint64_t v2 = *(void **)(a1 + 16);
  if (*((char *)a2 + 23) >= 0) {
    uint64_t v4 = a2;
  }
  else {
    uint64_t v4 = (uint64_t *)*a2;
  }
  uint64_t v5 = [NSString stringWithUTF8String:v4];
  uint64_t v6 = [v2 jsonReader:v3 appendKey:v5];

  return v6;
}

void sub_1B731D4D8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t anonymous namespace'::JSONSAXAdapter::end_object(id *this)
{
  return [this[2] jsonReaderEndObject:this[1]];
}

uint64_t anonymous namespace'::JSONSAXAdapter::start_array(id *this)
{
  return [this[2] jsonReaderBeginArray:this[1]];
}

uint64_t anonymous namespace'::JSONSAXAdapter::end_array(id *this)
{
  return [this[2] jsonReaderEndArray:this[1]];
}

uint64_t anonymous namespace'::JSONSAXAdapter::parse_error(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  v13[1] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v6 = a4[2];
  uint64_t v12 = *MEMORY[0x1E4F28568];
  uint64_t v7 = [NSString stringWithUTF8String:(*(uint64_t (**)(int *))(*(void *)a4 + 16))(a4)];
  v13[0] = v7;
  uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
  uint64_t v9 = [v5 errorWithDomain:@"com.apple.Safari.Core.WBSJSONReaderErrorDomain" code:v6 userInfo:v8];

  uint64_t v10 = [*(id *)(a1 + 16) jsonReader:*(void *)(a1 + 8) error:v9];
  return v10;
}

void sub_1B731D634(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void anonymous namespace'::FileDescriptorStreamBuf::~FileDescriptorStreamBuf(_anonymous_namespace_::FileDescriptorStreamBuf *this)
{
  std::streambuf::~streambuf();
  JUMPOUT(0x1BA9BC7E0);
}

uint64_t anonymous namespace'::FileDescriptorStreamBuf::underflow(_anonymous_namespace_::FileDescriptorStreamBuf *this)
{
  uint64_t v1 = (unsigned __int8 *)*((void *)this + 3);
  if ((unint64_t)v1 < *((void *)this + 4)) {
    return *v1;
  }
  uint64_t v1 = (unsigned __int8 *)this + 68;
  ssize_t v3 = read(*((_DWORD *)this + 16), (char *)this + 68, 0x400uLL);
  if (v3 >= 1)
  {
    *((void *)this + 2) = v1;
    *((void *)this + 3) = v1;
    *((void *)this + 4) = &v1[v3];
    return *v1;
  }
  return 0xFFFFFFFFLL;
}

void *nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::parser<nlohmann::detail::iterator_input_adapter<char const*>>@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char a4@<W3>, uint64_t a5@<X8>)
{
  void v9[4] = *MEMORY[0x1E4F143B8];
  *(void *)&long long v8 = a1;
  *((void *)&v8 + 1) = a2;
  std::__function::__value_func<BOOL ()(int,nlohmann::detail::parse_event_t,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> &)>::__value_func[abi:sn180100]((uint64_t)v9, a3);
  nlohmann::detail::parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::parser(a5, &v8, (uint64_t)v9, a4);
  return std::__function::__value_func<BOOL ()(int,nlohmann::detail::parse_event_t,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> &)>::~__value_func[abi:sn180100](v9);
}

void sub_1B731D7D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_start(va, a4);
  std::__function::__value_func<BOOL ()(int,nlohmann::detail::parse_event_t,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> &)>::~__value_func[abi:sn180100]((uint64_t *)va);
  _Unwind_Resume(a1);
}

uint64_t std::__function::__value_func<BOOL ()(int,nlohmann::detail::parse_event_t,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> &)>::__value_func[abi:sn180100](uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 24);
  if (v3)
  {
    if (v3 == a2)
    {
      *(void *)(a1 + 24) = a1;
      (*(void (**)(void, uint64_t))(**(void **)(a2 + 24) + 24))(*(void *)(a2 + 24), a1);
    }
    else
    {
      *(void *)(a1 + 24) = v3;
      *(void *)(a2 + 24) = 0;
    }
  }
  else
  {
    *(void *)(a1 + 24) = 0;
  }
  return a1;
}

{
  uint64_t v3;

  uint64_t v3 = *(void *)(a2 + 24);
  if (v3)
  {
    if (v3 == a2)
    {
      *(void *)(a1 + 24) = a1;
      (*(void (**)(void, uint64_t))(**(void **)(a2 + 24) + 24))(*(void *)(a2 + 24), a1);
    }
    else
    {
      *(void *)(a1 + 24) = (*(uint64_t (**)(uint64_t))(*(void *)v3 + 16))(v3);
    }
  }
  else
  {
    *(void *)(a1 + 24) = 0;
  }
  return a1;
}

uint64_t nlohmann::detail::parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::parser(uint64_t a1, _OWORD *a2, uint64_t a3, char a4)
{
  uint64_t v7 = std::__function::__value_func<BOOL ()(int,nlohmann::detail::parse_event_t,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> &)>::__value_func[abi:sn180100](a1, a3);
  *(_DWORD *)(v7 + 32) = 0;
  uint64_t v8 = v7 + 40;
  *(_OWORD *)(v7 + 40) = *a2;
  *(_DWORD *)(v7 + 56) = -1;
  *(unsigned char *)(v7 + 60) = 0;
  *(_OWORD *)(v7 + 64) = 0u;
  *(_OWORD *)(v7 + 80) = 0u;
  *(_OWORD *)(v7 + 96) = 0u;
  *(_OWORD *)(v7 + 112) = 0u;
  *(void *)(v7 + 128) = 0;
  *(void *)(v7 + 136) = "";
  *(void *)(v7 + 152) = 0;
  *(void *)(v7 + 160) = 0;
  *(void *)(v7 + 144) = 0;
  uint64_t v9 = localeconv();
  if (v9->decimal_point) {
    int v10 = *v9->decimal_point;
  }
  else {
    int v10 = 46;
  }
  *(_DWORD *)(a1 + 168) = v10;
  *(unsigned char *)(a1 + 176) = a4;
  *(_DWORD *)(a1 + 32) = nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::scan(v8);
  return a1;
}

void sub_1B731D904(_Unwind_Exception *a1)
{
  nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::~lexer(v2);
  std::__function::__value_func<BOOL ()(int,nlohmann::detail::parse_event_t,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> &)>::~__value_func[abi:sn180100](v1);
  _Unwind_Resume(a1);
}

uint64_t nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::scan(uint64_t a1)
{
  if (*(void *)(a1 + 24)
    || nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::skip_bom((unsigned __int8 **)a1))
  {
    while (2)
    {
      while (1)
      {
        nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::get((unsigned __int8 **)a1);
        int v2 = *(_DWORD *)(a1 + 16);
        if (v2 > 31) {
          break;
        }
        if ((v2 - 9) >= 2 && v2 != 13)
        {
          if ((v2 + 1) < 2) {
            return 15;
          }
LABEL_48:
          uint64_t v6 = "invalid literal";
          goto LABEL_24;
        }
      }
      if (v2 > 90)
      {
        if (v2 <= 109)
        {
          switch(v2)
          {
            case '[':
              return 8;
            case ']':
              return 10;
            case 'f':
              uint64_t v7 = 0;
              while (aFalse_0[v7 + 1] == nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::get((unsigned __int8 **)a1))
              {
                if (++v7 == 4) {
                  return 2;
                }
              }
              break;
          }
        }
        else if (v2 > 122)
        {
          if (v2 == 123) {
            return 9;
          }
          if (v2 == 125) {
            return 11;
          }
        }
        else if (v2 == 110)
        {
          int v9 = 1819047278;
          uint64_t v8 = 1;
          while (*((unsigned __int8 *)&v9 + v8) == nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::get((unsigned __int8 **)a1))
          {
            if (++v8 == 4) {
              return 3;
            }
          }
        }
        else if (v2 == 116)
        {
          int v10 = 1702195828;
          uint64_t v5 = 1;
          while (*((unsigned __int8 *)&v10 + v5) == nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::get((unsigned __int8 **)a1))
          {
            if (++v5 == 4) {
              return 1;
            }
          }
        }
        goto LABEL_48;
      }
      switch(v2)
      {
        case ' ':
          continue;
        case '""':
          uint64_t result = nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::scan_string(a1);
          break;
        case ',':
          uint64_t result = 13;
          break;
        case '-':
        case '0':
        case '1':
        case '2':
        case '3':
        case '4':
        case '5':
        case '6':
        case '7':
        case '8':
        case '9':
          uint64_t result = nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::scan_number(a1);
          break;
        case ':':
          uint64_t result = 12;
          break;
        default:
          goto LABEL_48;
      }
      break;
    }
  }
  else
  {
    uint64_t v6 = "invalid BOM; must be 0xEF 0xBB 0xBF if given";
LABEL_24:
    *(void *)(a1 + 96) = v6;
    return 14;
  }
  return result;
}

BOOL nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::skip_bom(unsigned __int8 **a1)
{
  if (nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::get(a1) == 239)
  {
    return nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::get(a1) == 187
        && nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::get(a1) == 191;
  }
  else
  {
    nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::unget((uint64_t)a1);
    return 1;
  }
}

uint64_t nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::get(unsigned __int8 **a1)
{
  *(int64x2_t *)(a1 + 3) = vaddq_s64(*(int64x2_t *)(a1 + 3), vdupq_n_s64(1uLL));
  if (!*((unsigned char *)a1 + 20))
  {
    uint64_t v3 = *a1;
    if (*a1 == a1[1]) {
      goto LABEL_29;
    }
    int i = *v3;
    *a1 = v3 + 1;
    goto LABEL_5;
  }
  *((unsigned char *)a1 + 20) = 0;
  for (int i = *((_DWORD *)a1 + 4); ; *((_DWORD *)a1 + 4) = i)
  {
    if (i == -1) {
      return 0xFFFFFFFFLL;
    }
    uint64_t v5 = a1[7];
    unint64_t v4 = (unint64_t)a1[8];
    if ((unint64_t)v5 >= v4) {
      break;
    }
    if (v5)
    {
      *uint64_t v5 = i;
      uint64_t v6 = (uint64_t)(v5 + 1);
      goto LABEL_24;
    }
LABEL_28:
    __break(1u);
LABEL_29:
    int i = -1;
LABEL_5:
    ;
  }
  unint64_t v7 = (unint64_t)a1[6];
  uint64_t v8 = &v5[-v7];
  uint64_t v9 = (uint64_t)&v5[-v7 + 1];
  if (v9 < 0) {
    abort();
  }
  unint64_t v10 = v4 - v7;
  if (2 * v10 > v9) {
    uint64_t v9 = 2 * v10;
  }
  if (v10 >= 0x3FFFFFFFFFFFFFFFLL) {
    size_t v11 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    size_t v11 = v9;
  }
  if (!v11) {
    goto LABEL_28;
  }
  uint64_t v12 = (unsigned __int8 *)operator new(v11);
  uint64_t v13 = &v12[v11];
  v8[(void)v12] = i;
  uint64_t v6 = (uint64_t)&v8[(void)v12 + 1];
  if (v5 == (unsigned __int8 *)v7)
  {
    uint64_t v12 = &v8[(void)v12];
  }
  else
  {
    uint64_t v14 = &v5[~v7];
    do
    {
      unsigned __int8 v15 = *--v5;
      (v14--)[(void)v12] = v15;
    }
    while (v5 != (unsigned __int8 *)v7);
    uint64_t v5 = (unsigned __int8 *)v7;
  }
  a1[6] = v12;
  a1[7] = (unsigned __int8 *)v6;
  a1[8] = v13;
  if (v5) {
    operator delete(v5);
  }
LABEL_24:
  a1[7] = (unsigned __int8 *)v6;
  uint64_t result = *((unsigned int *)a1 + 4);
  if (result == 10)
  {
    uint64_t v17 = (uint64_t)(a1[5] + 1);
    a1[4] = 0;
    a1[5] = (unsigned __int8 *)v17;
  }
  return result;
}

uint64_t nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::scan_string(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::reset(a1);
  while (2)
  {
    while (2)
    {
      int v2 = nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::get((unsigned __int8 **)a1)
         + 1;
      uint64_t result = 4;
      unint64_t v4 = "invalid string: missing closing quote";
      switch(v2)
      {
        case 0:
          goto LABEL_81;
        case 1:
          unint64_t v4 = "invalid string: control character U+0000 (NUL) must be escaped to \\u0000";
          goto LABEL_81;
        case 2:
          unint64_t v4 = "invalid string: control character U+0001 (SOH) must be escaped to \\u0001";
          goto LABEL_81;
        case 3:
          unint64_t v4 = "invalid string: control character U+0002 (STX) must be escaped to \\u0002";
          goto LABEL_81;
        case 4:
          unint64_t v4 = "invalid string: control character U+0003 (ETX) must be escaped to \\u0003";
          goto LABEL_81;
        case 5:
          unint64_t v4 = "invalid string: control character U+0004 (EOT) must be escaped to \\u0004";
          goto LABEL_81;
        case 6:
          unint64_t v4 = "invalid string: control character U+0005 (ENQ) must be escaped to \\u0005";
          goto LABEL_81;
        case 7:
          unint64_t v4 = "invalid string: control character U+0006 (ACK) must be escaped to \\u0006";
          goto LABEL_81;
        case 8:
          unint64_t v4 = "invalid string: control character U+0007 (BEL) must be escaped to \\u0007";
          goto LABEL_81;
        case 9:
          unint64_t v4 = "invalid string: control character U+0008 (BS) must be escaped to \\u0008 or \\b";
          goto LABEL_81;
        case 10:
          unint64_t v4 = "invalid string: control character U+0009 (HT) must be escaped to \\u0009 or \\t";
          goto LABEL_81;
        case 11:
          unint64_t v4 = "invalid string: control character U+000A (LF) must be escaped to \\u000A or \\n";
          goto LABEL_81;
        case 12:
          unint64_t v4 = "invalid string: control character U+000B (VT) must be escaped to \\u000B";
          goto LABEL_81;
        case 13:
          unint64_t v4 = "invalid string: control character U+000C (FF) must be escaped to \\u000C or \\f";
          goto LABEL_81;
        case 14:
          unint64_t v4 = "invalid string: control character U+000D (CR) must be escaped to \\u000D or \\r";
          goto LABEL_81;
        case 15:
          unint64_t v4 = "invalid string: control character U+000E (SO) must be escaped to \\u000E";
          goto LABEL_81;
        case 16:
          unint64_t v4 = "invalid string: control character U+000F (SI) must be escaped to \\u000F";
          goto LABEL_81;
        case 17:
          unint64_t v4 = "invalid string: control character U+0010 (DLE) must be escaped to \\u0010";
          goto LABEL_81;
        case 18:
          unint64_t v4 = "invalid string: control character U+0011 (DC1) must be escaped to \\u0011";
          goto LABEL_81;
        case 19:
          unint64_t v4 = "invalid string: control character U+0012 (DC2) must be escaped to \\u0012";
          goto LABEL_81;
        case 20:
          unint64_t v4 = "invalid string: control character U+0013 (DC3) must be escaped to \\u0013";
          goto LABEL_81;
        case 21:
          unint64_t v4 = "invalid string: control character U+0014 (DC4) must be escaped to \\u0014";
          goto LABEL_81;
        case 22:
          unint64_t v4 = "invalid string: control character U+0015 (NAK) must be escaped to \\u0015";
          goto LABEL_81;
        case 23:
          unint64_t v4 = "invalid string: control character U+0016 (SYN) must be escaped to \\u0016";
          goto LABEL_81;
        case 24:
          unint64_t v4 = "invalid string: control character U+0017 (ETB) must be escaped to \\u0017";
          goto LABEL_81;
        case 25:
          unint64_t v4 = "invalid string: control character U+0018 (CAN) must be escaped to \\u0018";
          goto LABEL_81;
        case 26:
          unint64_t v4 = "invalid string: control character U+0019 (EM) must be escaped to \\u0019";
          goto LABEL_81;
        case 27:
          unint64_t v4 = "invalid string: control character U+001A (SUB) must be escaped to \\u001A";
          goto LABEL_81;
        case 28:
          unint64_t v4 = "invalid string: control character U+001B (ESC) must be escaped to \\u001B";
          goto LABEL_81;
        case 29:
          unint64_t v4 = "invalid string: control character U+001C (FS) must be escaped to \\u001C";
          goto LABEL_81;
        case 30:
          unint64_t v4 = "invalid string: control character U+001D (GS) must be escaped to \\u001D";
          goto LABEL_81;
        case 31:
          unint64_t v4 = "invalid string: control character U+001E (RS) must be escaped to \\u001E";
          goto LABEL_81;
        case 32:
          unint64_t v4 = "invalid string: control character U+001F (US) must be escaped to \\u001F";
          goto LABEL_81;
        case 33:
        case 34:
        case 36:
        case 37:
        case 38:
        case 39:
        case 40:
        case 41:
        case 42:
        case 43:
        case 44:
        case 45:
        case 46:
        case 47:
        case 48:
        case 49:
        case 50:
        case 51:
        case 52:
        case 53:
        case 54:
        case 55:
        case 56:
        case 57:
        case 58:
        case 59:
        case 60:
        case 61:
        case 62:
        case 63:
        case 64:
        case 65:
        case 66:
        case 67:
        case 68:
        case 69:
        case 70:
        case 71:
        case 72:
        case 73:
        case 74:
        case 75:
        case 76:
        case 77:
        case 78:
        case 79:
        case 80:
        case 81:
        case 82:
        case 83:
        case 84:
        case 85:
        case 86:
        case 87:
        case 88:
        case 89:
        case 90:
        case 91:
        case 92:
        case 94:
        case 95:
        case 96:
        case 97:
        case 98:
        case 99:
        case 100:
        case 101:
        case 102:
        case 103:
        case 104:
        case 105:
        case 106:
        case 107:
        case 108:
        case 109:
        case 110:
        case 111:
        case 112:
        case 113:
        case 114:
        case 115:
        case 116:
        case 117:
        case 118:
        case 119:
        case 120:
        case 121:
        case 122:
        case 123:
        case 124:
        case 125:
        case 126:
        case 127:
        case 128:
          int v5 = *(_DWORD *)(a1 + 16);
          goto LABEL_4;
        case 35:
          return result;
        case 93:
          int v10 = nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::get((unsigned __int8 **)a1);
          unint64_t v4 = "invalid string: forbidden character after backslash";
          if (v10 <= 97)
          {
            switch(v10)
            {
              case '""':
                LOBYTE(v5) = 34;
                break;
              case '/':
                LOBYTE(v5) = 47;
                break;
              case '\\':
                LOBYTE(v5) = 92;
                break;
              default:
                goto LABEL_81;
            }
            goto LABEL_4;
          }
          break;
        case 195:
        case 196:
        case 197:
        case 198:
        case 199:
        case 200:
        case 201:
        case 202:
        case 203:
        case 204:
        case 205:
        case 206:
        case 207:
        case 208:
        case 209:
        case 210:
        case 211:
        case 212:
        case 213:
        case 214:
        case 215:
        case 216:
        case 217:
        case 218:
        case 219:
        case 220:
        case 221:
        case 222:
        case 223:
        case 224:
          *(void *)&long long v14 = 0xBF00000080;
          uint64_t v6 = (std::string *)a1;
          uint64_t v7 = 2;
          goto LABEL_19;
        case 225:
          long long v8 = xmmword_1B7390140;
          goto LABEL_7;
        case 226:
        case 227:
        case 228:
        case 229:
        case 230:
        case 231:
        case 232:
        case 233:
        case 234:
        case 235:
        case 236:
        case 237:
        case 239:
        case 240:
          long long v8 = xmmword_1B7390130;
          goto LABEL_7;
        case 238:
          long long v8 = xmmword_1B7390120;
LABEL_7:
          long long v14 = v8;
          uint64_t v6 = (std::string *)a1;
          uint64_t v7 = 4;
          goto LABEL_19;
        case 241:
          uint64_t v15 = 0xBF00000080;
          uint64_t v9 = &xmmword_1B7390170;
          goto LABEL_18;
        case 242:
        case 243:
        case 244:
          uint64_t v15 = 0xBF00000080;
          uint64_t v9 = &xmmword_1B7390188;
          goto LABEL_18;
        case 245:
          uint64_t v15 = 0xBF00000080;
          uint64_t v9 = &xmmword_1B73901A0;
LABEL_18:
          long long v14 = *v9;
          uint64_t v6 = (std::string *)a1;
          uint64_t v7 = 6;
LABEL_19:
          if ((nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::next_byte_in_range(v6, &v14, v7) & 1) == 0)return 14; {
          continue;
          }
        default:
          unint64_t v4 = "invalid string: ill-formed UTF-8 byte";
          goto LABEL_81;
      }
      break;
    }
    switch(v10)
    {
      case 'n':
        LOBYTE(v5) = 10;
        goto LABEL_4;
      case 'o':
      case 'p':
      case 'q':
      case 's':
        goto LABEL_81;
      case 'r':
        LOBYTE(v5) = 13;
        goto LABEL_4;
      case 't':
        LOBYTE(v5) = 9;
        goto LABEL_4;
      case 'u':
        unsigned int codepoint = nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::get_codepoint(a1);
        if (codepoint == -1) {
          goto LABEL_83;
        }
        unsigned int v12 = codepoint;
        if ((codepoint & 0xFFFFFC00) != 0xD800)
        {
          if ((codepoint & 0xFFFFFC00) == 0xDC00)
          {
            unint64_t v4 = "invalid string: surrogate U+DC00..U+DFFF must follow U+D800..U+DBFF";
            goto LABEL_81;
          }
          if ((int)codepoint > 127)
          {
            if (codepoint <= 0x7FF)
            {
              std::string::push_back((std::string *)(a1 + 72), (codepoint >> 6) | 0xC0);
              goto LABEL_39;
            }
            if (!HIWORD(codepoint))
            {
              std::string::push_back((std::string *)(a1 + 72), (codepoint >> 12) | 0xE0);
              goto LABEL_38;
            }
LABEL_37:
            std::string::push_back((std::string *)(a1 + 72), (v12 >> 18) | 0xF0);
            std::string::push_back((std::string *)(a1 + 72), (v12 >> 12) & 0x3F | 0x80);
LABEL_38:
            std::string::push_back((std::string *)(a1 + 72), (v12 >> 6) & 0x3F | 0x80);
LABEL_39:
            LOBYTE(v5) = v12 & 0x3F | 0x80;
            goto LABEL_4;
          }
          LOBYTE(v5) = codepoint;
LABEL_4:
          std::string::push_back((std::string *)(a1 + 72), v5);
          continue;
        }
        if (nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::get((unsigned __int8 **)a1) != 92
          || nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::get((unsigned __int8 **)a1) != 117)
        {
LABEL_84:
          unint64_t v4 = "invalid string: surrogate U+D800..U+DBFF must be followed by U+DC00..U+DFFF";
          goto LABEL_81;
        }
        unsigned int v13 = nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::get_codepoint(a1);
        if (v13 != -1)
        {
          if (v13 >> 10 != 55) {
            goto LABEL_84;
          }
          unsigned int v12 = v13 + (v12 << 10) - 56613888;
          goto LABEL_37;
        }
LABEL_83:
        unint64_t v4 = "invalid string: '\\u' must be followed by 4 hex digits";
LABEL_81:
        *(void *)(a1 + 96) = v4;
        return 14;
      default:
        if (v10 == 98)
        {
          LOBYTE(v5) = 8;
        }
        else
        {
          if (v10 != 102) {
            goto LABEL_81;
          }
          LOBYTE(v5) = 12;
        }
        goto LABEL_4;
    }
  }
}

uint64_t nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::scan_number(uint64_t a1)
{
  nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::reset(a1);
  int v2 = *(_DWORD *)(a1 + 16);
  if ((v2 - 49) < 9)
  {
    int v3 = 5;
LABEL_3:
    unint64_t v4 = (std::string *)(a1 + 72);
    while (1)
    {
      std::string::push_back((std::string *)(a1 + 72), v2);
      int v5 = nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::get((unsigned __int8 **)a1);
      if ((v5 - 48) >= 0xA) {
        break;
      }
      int v2 = *(_DWORD *)(a1 + 16);
    }
    if (v5 != 46)
    {
      if (v5 == 69 || v5 == 101) {
        goto LABEL_9;
      }
LABEL_37:
      nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::unget(a1);
      __endptr = 0;
      *__error() = 0;
      if (v3 == 6)
      {
        uint64_t v16 = (const char *)(a1 + 72);
        if (*(char *)(a1 + 95) < 0) {
          uint64_t v16 = *(const char **)v16;
        }
        uint64_t v17 = strtoll(v16, &__endptr, 10);
        if (!*__error())
        {
          *(void *)(a1 + 104) = v17;
          return 6;
        }
      }
      else
      {
        long long v14 = (const char *)(a1 + 72);
        if (*(char *)(a1 + 95) < 0) {
          long long v14 = *(const char **)v14;
        }
        unint64_t v15 = strtoull(v14, &__endptr, 10);
        if (!*__error())
        {
          *(void *)(a1 + 112) = v15;
          return 5;
        }
      }
      goto LABEL_14;
    }
    goto LABEL_31;
  }
  if (v2 == 48)
  {
    std::string::push_back((std::string *)(a1 + 72), 48);
    int v3 = 5;
  }
  else
  {
    if (v2 == 45) {
      std::string::push_back((std::string *)(a1 + 72), 45);
    }
    int v10 = nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::get((unsigned __int8 **)a1);
    if ((v10 - 49) < 9)
    {
      int v2 = *(_DWORD *)(a1 + 16);
      int v3 = 6;
      goto LABEL_3;
    }
    if (v10 != 48)
    {
      size_t v11 = "invalid number; expected digit after '-'";
      goto LABEL_52;
    }
    std::string::push_back((std::string *)(a1 + 72), *(unsigned char *)(a1 + 16));
    int v3 = 6;
  }
  int v12 = nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::get((unsigned __int8 **)a1);
  if (v12 == 101 || v12 == 69)
  {
    unint64_t v4 = (std::string *)(a1 + 72);
    goto LABEL_9;
  }
  if (v12 != 46) {
    goto LABEL_37;
  }
  unint64_t v4 = (std::string *)(a1 + 72);
LABEL_31:
  std::string::push_back(v4, *(unsigned char *)(a1 + 128));
  if (nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::get((unsigned __int8 **)a1)
     - 48 > 9)
  {
    size_t v11 = "invalid number; expected digit after '.'";
    goto LABEL_52;
  }
  unint64_t v4 = (std::string *)(a1 + 72);
  do
  {
    std::string::push_back((std::string *)(a1 + 72), *(unsigned char *)(a1 + 16));
    int v13 = nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::get((unsigned __int8 **)a1);
  }
  while ((v13 - 48) < 0xA);
  if (v13 == 101 || v13 == 69)
  {
LABEL_9:
    std::string::push_back(v4, *(unsigned char *)(a1 + 16));
    int v6 = nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::get((unsigned __int8 **)a1);
    if ((v6 - 48) < 0xA)
    {
      uint64_t v7 = (std::string *)(a1 + 72);
      goto LABEL_11;
    }
    if (v6 == 45 || v6 == 43)
    {
      uint64_t v7 = (std::string *)(a1 + 72);
      std::string::push_back((std::string *)(a1 + 72), *(unsigned char *)(a1 + 16));
      if (nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::get((unsigned __int8 **)a1)
         - 48 < 0xA)
      {
LABEL_11:
        std::string::push_back(v7, *(unsigned char *)(a1 + 16));
        if (nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::get((unsigned __int8 **)a1)
           - 48 <= 9)
        {
          do
            std::string::push_back((std::string *)(a1 + 72), *(unsigned char *)(a1 + 16));
          while (nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::get((unsigned __int8 **)a1)
                - 48 < 0xA);
        }
        goto LABEL_13;
      }
      size_t v11 = "invalid number; expected digit after exponent sign";
    }
    else
    {
      size_t v11 = "invalid number; expected '+', '-', or digit after exponent";
    }
LABEL_52:
    *(void *)(a1 + 96) = v11;
    return 14;
  }
LABEL_13:
  nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::unget(a1);
  __endptr = 0;
  *__error() = 0;
LABEL_14:
  long long v8 = (const char *)(a1 + 72);
  if (*(char *)(a1 + 95) < 0) {
    long long v8 = *(const char **)v8;
  }
  *(double *)(a1 + 120) = strtod(v8, &__endptr);
  return 7;
}

uint64_t nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::unget(uint64_t result)
{
  uint64_t v1 = (void *)(result + 32);
  uint64_t v2 = *(void *)(result + 32);
  *(unsigned char *)(result + 20) = 1;
  --*(void *)(result + 24);
  if (v2 || (uint64_t v1 = (void *)(result + 40), (v2 = *(void *)(result + 40)) != 0)) {
    void *v1 = v2 - 1;
  }
  if (*(_DWORD *)(result + 16) != -1)
  {
    uint64_t v3 = *(void *)(result + 56);
    if (*(void *)(result + 48) == v3) {
      __break(1u);
    }
    else {
      *(void *)(result + 56) = v3 - 1;
    }
  }
  return result;
}

void nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::reset(uint64_t a1)
{
  if (*(char *)(a1 + 95) < 0)
  {
    **(unsigned char **)(a1 + 72) = 0;
    *(void *)(a1 + 80) = 0;
  }
  else
  {
    *(unsigned char *)(a1 + 72) = 0;
    *(unsigned char *)(a1 + 95) = 0;
  }
  uint64_t v2 = *(unsigned char **)(a1 + 48);
  *(void *)(a1 + 56) = v2;
  int v3 = *(_DWORD *)(a1 + 16);
  unint64_t v4 = *(void *)(a1 + 64);
  if ((unint64_t)v2 >= v4)
  {
    unint64_t v6 = v4 - (void)v2;
    uint64_t v7 = 2 * v6;
    if (2 * v6 <= 1) {
      uint64_t v7 = 1;
    }
    if (v6 >= 0x3FFFFFFFFFFFFFFFLL) {
      size_t v8 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else {
      size_t v8 = v7;
    }
    uint64_t v9 = operator new(v8);
    int v10 = &v9[v8];
    unsigned char *v9 = v3;
    int v5 = v9 + 1;
    *(void *)(a1 + 48) = v9;
    *(void *)(a1 + 56) = v9 + 1;
    *(void *)(a1 + 64) = v10;
    if (v2) {
      operator delete(v2);
    }
    goto LABEL_14;
  }
  if (v2)
  {
    unsigned char *v2 = v3;
    int v5 = v2 + 1;
LABEL_14:
    *(void *)(a1 + 56) = v5;
    return;
  }
  __break(1u);
}

uint64_t nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::get_codepoint(uint64_t a1)
{
  uint64_t v2 = 0;
  LODWORD(v3) = 0;
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  long long v8 = xmmword_1B7390150;
  while (1)
  {
    int v4 = *(_DWORD *)((char *)&v8 + v2);
    nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::get((unsigned __int8 **)a1);
    int v5 = *(_DWORD *)(a1 + 16);
    int v6 = v5 - 48;
    if ((v5 - 48) >= 0xA) {
      break;
    }
LABEL_7:
    uint64_t v3 = ((v6 << v4) + v3);
    v2 += 4;
    if (v2 == 16) {
      return v3;
    }
  }
  if ((v5 - 65) <= 5)
  {
    int v6 = v5 - 55;
    goto LABEL_7;
  }
  if ((v5 - 97) <= 5)
  {
    int v6 = v5 - 87;
    goto LABEL_7;
  }
  return 0xFFFFFFFFLL;
}

uint64_t nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::next_byte_in_range(std::string *a1, _DWORD *a2, uint64_t a3)
{
  int v6 = a1 + 3;
  std::string::push_back(a1 + 3, a1->__r_.__value_.__s.__data_[16]);
  if (!a3) {
    return 1;
  }
  uint64_t v7 = &a2[a3];
  while (1)
  {
    nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::get((unsigned __int8 **)a1);
    int v8 = a1->__r_.__value_.__r.__words[2];
    if (*a2 > v8 || v8 > a2[1]) {
      break;
    }
    std::string::push_back(v6, v8);
    a2 += 2;
    if (a2 == v7) {
      return 1;
    }
  }
  uint64_t result = 0;
  a1[4].__r_.__value_.__r.__words[0] = (std::string::size_type)"invalid string: ill-formed UTF-8 byte";
  return result;
}

uint64_t nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::~lexer(uint64_t a1)
{
  if (*(char *)(a1 + 95) < 0) {
    operator delete(*(void **)(a1 + 72));
  }
  uint64_t v2 = *(void **)(a1 + 48);
  if (v2)
  {
    *(void *)(a1 + 56) = v2;
    operator delete(v2);
  }
  return a1;
}

void nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::get_token_string(uint64_t a1@<X0>, std::string *a2@<X8>)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  a2->__r_.__value_.__r.__words[0] = 0;
  a2->__r_.__value_.__l.__size_ = 0;
  a2->__r_.__value_.__r.__words[2] = 0;
  uint64_t v3 = *(unsigned __int8 **)(a1 + 48);
  for (int i = *(unsigned __int8 **)(a1 + 56); v3 != i; ++v3)
  {
    unsigned int v5 = *v3;
    if (v5 > 0x1F)
    {
      std::string::push_back(a2, v5);
    }
    else
    {
      char v8 = 0;
      *(void *)__str = 0;
      snprintf(__str, 9uLL, "<U+%.4X>", v5);
      std::string::size_type v6 = strlen(__str);
      std::string::append(a2, __str, v6);
    }
  }
}

void sub_1B731EDB8(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

void nlohmann::detail::parse_error::create(int a1@<W0>, uint64_t *a2@<X1>, uint64_t a3@<X2>, nlohmann::detail::exception *a4@<X8>)
{
  std::string::basic_string[abi:sn180100]<0>((char **)&v24, "parse_error");
  nlohmann::detail::exception::name(a1, &v26);
  char v8 = std::string::append(&v26, "parse error", 0xBuLL);
  long long v9 = *(_OWORD *)&v8->__r_.__value_.__l.__data_;
  v27.__r_.__value_.__r.__words[2] = v8->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v27.__r_.__value_.__l.__data_ = v9;
  v8->__r_.__value_.__l.__size_ = 0;
  v8->__r_.__value_.__r.__words[2] = 0;
  v8->__r_.__value_.__r.__words[0] = 0;
  nlohmann::detail::parse_error::position_string((uint64_t)a2, &__p);
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    p_p = &__p;
  }
  else {
    p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
  }
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    std::string::size_type size = HIBYTE(__p.__r_.__value_.__r.__words[2]);
  }
  else {
    std::string::size_type size = __p.__r_.__value_.__l.__size_;
  }
  int v12 = std::string::append(&v27, (const std::string::value_type *)p_p, size);
  long long v13 = *(_OWORD *)&v12->__r_.__value_.__l.__data_;
  v28.__r_.__value_.__r.__words[2] = v12->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v28.__r_.__value_.__l.__data_ = v13;
  v12->__r_.__value_.__l.__size_ = 0;
  v12->__r_.__value_.__r.__words[2] = 0;
  v12->__r_.__value_.__r.__words[0] = 0;
  long long v14 = std::string::append(&v28, ": ", 2uLL);
  long long v15 = *(_OWORD *)&v14->__r_.__value_.__l.__data_;
  v29.__r_.__value_.__r.__words[2] = v14->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v29.__r_.__value_.__l.__data_ = v15;
  v14->__r_.__value_.__l.__size_ = 0;
  v14->__r_.__value_.__r.__words[2] = 0;
  v14->__r_.__value_.__r.__words[0] = 0;
  int v16 = *(char *)(a3 + 23);
  if (v16 >= 0) {
    uint64_t v17 = (const std::string::value_type *)a3;
  }
  else {
    uint64_t v17 = *(const std::string::value_type **)a3;
  }
  if (v16 >= 0) {
    std::string::size_type v18 = *(unsigned __int8 *)(a3 + 23);
  }
  else {
    std::string::size_type v18 = *(void *)(a3 + 8);
  }
  long long v19 = std::string::append(&v29, v17, v18);
  long long v20 = *(_OWORD *)&v19->__r_.__value_.__l.__data_;
  int64_t v31 = v19->__r_.__value_.__r.__words[2];
  long long v30 = v20;
  v19->__r_.__value_.__l.__size_ = 0;
  v19->__r_.__value_.__r.__words[2] = 0;
  v19->__r_.__value_.__r.__words[0] = 0;
  if (SHIBYTE(v29.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v29.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v28.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v28.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v27.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v27.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v26.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v26.__r_.__value_.__l.__data_);
  }
  if (v25 < 0) {
    operator delete(v24);
  }
  uint64_t v21 = *a2;
  if (v31 >= 0) {
    long long v22 = (const char *)&v30;
  }
  else {
    long long v22 = (const char *)v30;
  }
  nlohmann::detail::exception::exception(a4, a1, v22);
  *(void *)a4 = &unk_1F1059B10;
  *((void *)a4 + 4) = v21;
  if (SHIBYTE(v31) < 0) {
    operator delete((void *)v30);
  }
}

void sub_1B731EFCC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,void *a22,uint64_t a23,int a24,__int16 a25,char a26,char a27,void *a28,uint64_t a29,int a30,__int16 a31,char a32,char a33,uint64_t a34,void *__p,uint64_t a36,int a37,__int16 a38,char a39,char a40)
{
  if (*(char *)(v40 - 57) < 0) {
    operator delete(*(void **)(v40 - 80));
  }
  _Unwind_Resume(exception_object);
}

void nlohmann::detail::parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::exception_message(uint64_t a1@<X0>, unsigned int a2@<W1>, uint64_t a3@<X2>, std::string *a4@<X8>)
{
  std::string::basic_string[abi:sn180100]<0>(&a4->__r_.__value_.__l.__data_, "syntax error ");
  uint64_t v8 = *(unsigned __int8 *)(a3 + 23);
  if ((v8 & 0x80u) != 0) {
    uint64_t v8 = *(void *)(a3 + 8);
  }
  if (v8)
  {
    std::operator+<char>();
    long long v9 = std::string::append(&v38, " ", 1uLL);
    long long v10 = *(_OWORD *)&v9->__r_.__value_.__l.__data_;
    int64_t v40 = v9->__r_.__value_.__r.__words[2];
    long long v39 = v10;
    v9->__r_.__value_.__l.__size_ = 0;
    v9->__r_.__value_.__r.__words[2] = 0;
    v9->__r_.__value_.__r.__words[0] = 0;
    if (v40 >= 0) {
      size_t v11 = (const std::string::value_type *)&v39;
    }
    else {
      size_t v11 = (const std::string::value_type *)v39;
    }
    if (v40 >= 0) {
      std::string::size_type v12 = HIBYTE(v40);
    }
    else {
      std::string::size_type v12 = *((void *)&v39 + 1);
    }
    std::string::append(a4, v11, v12);
    if (SHIBYTE(v40) < 0) {
      operator delete((void *)v39);
    }
    if (SHIBYTE(v38.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v38.__r_.__value_.__l.__data_);
    }
  }
  std::string::append(a4, "- ", 2uLL);
  unsigned int v13 = *(_DWORD *)(a1 + 32);
  if (v13 == 14)
  {
    std::string::basic_string[abi:sn180100]<0>(&v36.__r_.__value_.__l.__data_, *(char **)(a1 + 136));
    long long v14 = std::string::append(&v36, "; last read: '", 0xEuLL);
    long long v15 = *(_OWORD *)&v14->__r_.__value_.__l.__data_;
    v37.__r_.__value_.__r.__words[2] = v14->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v37.__r_.__value_.__l.__data_ = v15;
    v14->__r_.__value_.__l.__size_ = 0;
    v14->__r_.__value_.__r.__words[2] = 0;
    v14->__r_.__value_.__r.__words[0] = 0;
    nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::get_token_string(a1 + 40, &__p);
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      p_p = &__p;
    }
    else {
      p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
    }
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      std::string::size_type size = HIBYTE(__p.__r_.__value_.__r.__words[2]);
    }
    else {
      std::string::size_type size = __p.__r_.__value_.__l.__size_;
    }
    std::string::size_type v18 = std::string::append(&v37, (const std::string::value_type *)p_p, size);
    long long v19 = *(_OWORD *)&v18->__r_.__value_.__l.__data_;
    v38.__r_.__value_.__r.__words[2] = v18->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v38.__r_.__value_.__l.__data_ = v19;
    v18->__r_.__value_.__l.__size_ = 0;
    v18->__r_.__value_.__r.__words[2] = 0;
    v18->__r_.__value_.__r.__words[0] = 0;
    long long v20 = std::string::append(&v38, "'", 1uLL);
    long long v21 = *(_OWORD *)&v20->__r_.__value_.__l.__data_;
    int64_t v40 = v20->__r_.__value_.__r.__words[2];
    long long v39 = v21;
    v20->__r_.__value_.__l.__size_ = 0;
    v20->__r_.__value_.__r.__words[2] = 0;
    v20->__r_.__value_.__r.__words[0] = 0;
    if (v40 >= 0) {
      long long v22 = (const std::string::value_type *)&v39;
    }
    else {
      long long v22 = (const std::string::value_type *)v39;
    }
    if (v40 >= 0) {
      std::string::size_type v23 = HIBYTE(v40);
    }
    else {
      std::string::size_type v23 = *((void *)&v39 + 1);
    }
    std::string::append(a4, v22, v23);
    if (SHIBYTE(v40) < 0) {
      operator delete((void *)v39);
    }
    if (SHIBYTE(v38.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v38.__r_.__value_.__l.__data_);
    }
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
    if (SHIBYTE(v37.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v37.__r_.__value_.__l.__data_);
    }
    if (SHIBYTE(v36.__r_.__value_.__r.__words[2]) < 0)
    {
      uint64_t v24 = (void *)v36.__r_.__value_.__r.__words[0];
      goto LABEL_49;
    }
LABEL_46:
    if (!a2) {
      return;
    }
    goto LABEL_50;
  }
  char v25 = (char *)nlohmann::detail::lexer_base<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::token_type_name(v13);
  std::string::basic_string[abi:sn180100]<0>(&v38.__r_.__value_.__l.__data_, v25);
  std::string v26 = std::string::insert(&v38, 0, "unexpected ", 0xBuLL);
  long long v27 = *(_OWORD *)&v26->__r_.__value_.__l.__data_;
  int64_t v40 = v26->__r_.__value_.__r.__words[2];
  long long v39 = v27;
  v26->__r_.__value_.__l.__size_ = 0;
  v26->__r_.__value_.__r.__words[2] = 0;
  v26->__r_.__value_.__r.__words[0] = 0;
  if (v40 >= 0) {
    std::string v28 = (const std::string::value_type *)&v39;
  }
  else {
    std::string v28 = (const std::string::value_type *)v39;
  }
  if (v40 >= 0) {
    std::string::size_type v29 = HIBYTE(v40);
  }
  else {
    std::string::size_type v29 = *((void *)&v39 + 1);
  }
  std::string::append(a4, v28, v29);
  if (SHIBYTE(v40) < 0) {
    operator delete((void *)v39);
  }
  if ((SHIBYTE(v38.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
    goto LABEL_46;
  }
  uint64_t v24 = (void *)v38.__r_.__value_.__r.__words[0];
LABEL_49:
  operator delete(v24);
  if (!a2) {
    return;
  }
LABEL_50:
  long long v30 = (char *)nlohmann::detail::lexer_base<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::token_type_name(a2);
  std::string::basic_string[abi:sn180100]<0>(&v38.__r_.__value_.__l.__data_, v30);
  int64_t v31 = std::string::insert(&v38, 0, "; expected ", 0xBuLL);
  long long v32 = *(_OWORD *)&v31->__r_.__value_.__l.__data_;
  int64_t v40 = v31->__r_.__value_.__r.__words[2];
  long long v39 = v32;
  v31->__r_.__value_.__l.__size_ = 0;
  v31->__r_.__value_.__r.__words[2] = 0;
  v31->__r_.__value_.__r.__words[0] = 0;
  if (v40 >= 0) {
    id v33 = (const std::string::value_type *)&v39;
  }
  else {
    id v33 = (const std::string::value_type *)v39;
  }
  if (v40 >= 0) {
    std::string::size_type v34 = HIBYTE(v40);
  }
  else {
    std::string::size_type v34 = *((void *)&v39 + 1);
  }
  std::string::append(a4, v33, v34);
  if (SHIBYTE(v40) < 0) {
    operator delete((void *)v39);
  }
  if (SHIBYTE(v38.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v38.__r_.__value_.__l.__data_);
  }
}

void sub_1B731F3B8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,void *a21,uint64_t a22,int a23,__int16 a24,char a25,char a26,uint64_t a27,void *__p,uint64_t a29,int a30,__int16 a31,char a32,char a33)
{
  if (*(char *)(v34 - 41) < 0) {
    operator delete(*(void **)(v34 - 64));
  }
  if (a33 < 0) {
    operator delete(__p);
  }
  if (a14 < 0) {
    operator delete(a9);
  }
  if (a26 < 0) {
    operator delete(a21);
  }
  if (a20 < 0) {
    operator delete(a15);
  }
  if (*(char *)(v33 + 23) < 0) {
    operator delete(*(void **)v33);
  }
  _Unwind_Resume(exception_object);
}

void nlohmann::detail::parse_error::~parse_error(std::exception *this)
{
  this->__vftable = (std::exception_vtbl *)&unk_1F1059AE8;
  MEMORY[0x1BA9BC6A0](&this[2]);
  std::exception::~exception(this);
}

{
  uint64_t vars8;

  this->__vftable = (std::exception_vtbl *)&unk_1F1059AE8;
  MEMORY[0x1BA9BC6A0](&this[2]);
  std::exception::~exception(this);
  JUMPOUT(0x1BA9BC7E0);
}

void std::vector<BOOL>::push_back(uint64_t a1, unsigned char *a2)
{
  unint64_t v4 = *(void *)(a1 + 8);
  uint64_t v5 = *(void *)(a1 + 16);
  if (v4 == v5 << 6)
  {
    if ((uint64_t)(v4 + 1) < 0) {
      abort();
    }
    unint64_t v6 = v5 << 7;
    if (v6 <= (v4 & 0xFFFFFFFFFFFFFFC0) + 64) {
      unint64_t v6 = (v4 & 0xFFFFFFFFFFFFFFC0) + 64;
    }
    if (v4 <= 0x3FFFFFFFFFFFFFFELL) {
      unint64_t v7 = v6;
    }
    else {
      unint64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
    }
    std::vector<BOOL>::reserve((char **)a1, v7);
    unint64_t v4 = *(void *)(a1 + 8);
  }
  *(void *)(a1 + 8) = v4 + 1;
  uint64_t v8 = *(char **)a1;
  unint64_t v9 = v4 >> 6;
  uint64_t v10 = 1 << v4;
  if (*a2) {
    uint64_t v11 = *(void *)&v8[8 * v9] | v10;
  }
  else {
    uint64_t v11 = *(void *)&v8[8 * v9] & ~v10;
  }
  *(void *)&v8[8 * v9] = v11;
}

void nlohmann::detail::out_of_range::create(int a1@<W0>, uint64_t a2@<X1>, nlohmann::detail::exception *a3@<X8>)
{
  std::string::basic_string[abi:sn180100]<0>((char **)&__p, "out_of_range");
  nlohmann::detail::exception::name(a1, &v14);
  int v6 = *(char *)(a2 + 23);
  if (v6 >= 0) {
    unint64_t v7 = (const std::string::value_type *)a2;
  }
  else {
    unint64_t v7 = *(const std::string::value_type **)a2;
  }
  if (v6 >= 0) {
    std::string::size_type v8 = *(unsigned __int8 *)(a2 + 23);
  }
  else {
    std::string::size_type v8 = *(void *)(a2 + 8);
  }
  unint64_t v9 = std::string::append(&v14, v7, v8);
  long long v10 = *(_OWORD *)&v9->__r_.__value_.__l.__data_;
  int64_t v16 = v9->__r_.__value_.__r.__words[2];
  *(_OWORD *)long long v15 = v10;
  v9->__r_.__value_.__l.__size_ = 0;
  v9->__r_.__value_.__r.__words[2] = 0;
  v9->__r_.__value_.__r.__words[0] = 0;
  if (SHIBYTE(v14.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v14.__r_.__value_.__l.__data_);
  }
  if (v13 < 0) {
    operator delete(__p);
  }
  if (v16 >= 0) {
    uint64_t v11 = v15;
  }
  else {
    uint64_t v11 = (void **)v15[0];
  }
  nlohmann::detail::exception::exception(a3, a1, (const char *)v11);
  *(void *)a3 = &unk_1F1059AC0;
  if (SHIBYTE(v16) < 0) {
    operator delete(v15[0]);
  }
}

void sub_1B731F68C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,void *__p,uint64_t a22,int a23,__int16 a24,char a25,char a26)
{
  if (a26 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void nlohmann::detail::out_of_range::~out_of_range(std::exception *this)
{
  this->__vftable = (std::exception_vtbl *)&unk_1F1059AE8;
  MEMORY[0x1BA9BC6A0](&this[2]);
  std::exception::~exception(this);
}

{
  uint64_t vars8;

  this->__vftable = (std::exception_vtbl *)&unk_1F1059AE8;
  MEMORY[0x1BA9BC6A0](&this[2]);
  std::exception::~exception(this);
  JUMPOUT(0x1BA9BC7E0);
}

void std::vector<BOOL>::reserve(char **a1, unint64_t a2)
{
  if (a2 > (void)a1[2] << 6)
  {
    if ((a2 & 0x8000000000000000) != 0) {
      abort();
    }
    long long v10 = 0;
    long long v11 = 0uLL;
    std::vector<BOOL>::__vallocate[abi:sn180100](&v10, a2);
    unint64_t v3 = (unint64_t)a1[1];
    std::string::size_type v8 = *a1;
    int v9 = 0;
    int v6 = &v8[8 * (v3 >> 6)];
    int v7 = v3 & 0x3F;
    std::vector<BOOL>::__construct_at_end<std::__bit_iterator<std::vector<BOOL>,false,0ul>,std::__bit_iterator<std::vector<BOOL>,false,0ul>>(&v10, (uint64_t)&v8, (uint64_t)&v6, v3);
    unint64_t v4 = *a1;
    *a1 = v10;
    long long v10 = v4;
    long long v5 = *(_OWORD *)(a1 + 1);
    *(_OWORD *)(a1 + 1) = v11;
    long long v11 = v5;
    if (v4) {
      operator delete(v4);
    }
  }
}

void sub_1B731F7CC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *__p)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void *std::vector<BOOL>::__vallocate[abi:sn180100](void *a1, uint64_t a2)
{
  if (a2 < 0) {
    abort();
  }
  uint64_t result = std::allocator<unsigned long>::allocate_at_least[abi:sn180100]((uint64_t)(a1 + 2), ((unint64_t)(a2 - 1) >> 6) + 1);
  *a1 = result;
  a1[1] = 0;
  a1[2] = v4;
  return result;
}

void std::vector<BOOL>::__construct_at_end<std::__bit_iterator<std::vector<BOOL>,false,0ul>,std::__bit_iterator<std::vector<BOOL>,false,0ul>>(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v4 = a1[1];
  unint64_t v5 = v4 + a4;
  a1[1] = v4 + a4;
  if (!v4 || ((v5 - 1) ^ (v4 - 1)) >= 0x40)
  {
    if (v5 >= 0x41) {
      unint64_t v6 = (v5 - 1) >> 6;
    }
    else {
      unint64_t v6 = 0;
    }
    *(void *)(*a1 + 8 * v6) = 0;
  }
  int v7 = *(_DWORD *)(a2 + 8);
  uint64_t v8 = *(void *)a3;
  int v9 = *(_DWORD *)(a3 + 8);
  uint64_t v10 = *a1 + 8 * (v4 >> 6);
  uint64_t v16 = *(void *)a2;
  int v17 = v7;
  uint64_t v14 = v8;
  int v15 = v9;
  uint64_t v12 = v10;
  int v13 = v4 & 0x3F;
  std::__unwrap_and_dispatch[abi:sn180100]<std::__overload<std::__copy_loop<std::_ClassicAlgPolicy>,std::__copy_trivial>,std::__bit_iterator<std::vector<BOOL>,false,0ul>,std::__bit_iterator<std::vector<BOOL>,false,0ul>,std::__bit_iterator<std::vector<BOOL>,false,0ul>,0>(&v16, &v14, &v12, (uint64_t)&v11);
}

void *std::allocator<unsigned long>::allocate_at_least[abi:sn180100](uint64_t a1, unint64_t a2)
{
  if (a2 >> 61) {
    std::__throw_bad_array_new_length[abi:sn180100]();
  }
  return operator new(8 * a2);
}

void std::__unwrap_and_dispatch[abi:sn180100]<std::__overload<std::__copy_loop<std::_ClassicAlgPolicy>,std::__copy_trivial>,std::__bit_iterator<std::vector<BOOL>,false,0ul>,std::__bit_iterator<std::vector<BOOL>,false,0ul>,std::__bit_iterator<std::vector<BOOL>,false,0ul>,0>(uint64_t *a1@<X0>, uint64_t *a2@<X1>, uint64_t *a3@<X2>, uint64_t a4@<X8>)
{
  int v5 = *((_DWORD *)a1 + 2);
  uint64_t v6 = *a2;
  int v7 = *((_DWORD *)a2 + 2);
  uint64_t v16 = *a1;
  int v17 = v5;
  uint64_t v14 = v6;
  int v15 = v7;
  int v8 = *((_DWORD *)a3 + 2);
  uint64_t v12 = *a3;
  int v13 = v8;
  std::__copy_loop<std::_ClassicAlgPolicy>::operator()[abi:sn180100]<std::__bit_iterator<std::vector<BOOL>,false,0ul>,std::__bit_iterator<std::vector<BOOL>,false,0ul>,std::__bit_iterator<std::vector<BOOL>,false,0ul>>((uint64_t)&v16, (uint64_t)&v14, (uint64_t)&v12, (uint64_t)&v18);
  int v9 = v19;
  uint64_t v10 = v20;
  int v11 = v21;
  *(void *)a4 = v18;
  *(_DWORD *)(a4 + 8) = v9;
  *(void *)(a4 + 16) = v10;
  *(_DWORD *)(a4 + 24) = v11;
}

void std::__copy_loop<std::_ClassicAlgPolicy>::operator()[abi:sn180100]<std::__bit_iterator<std::vector<BOOL>,false,0ul>,std::__bit_iterator<std::vector<BOOL>,false,0ul>,std::__bit_iterator<std::vector<BOOL>,false,0ul>>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X8>)
{
  unint64_t v4 = *(void **)a1;
  int v5 = *(_DWORD *)(a1 + 8);
  for (i = *(_DWORD *)(a3 + 8); *(void *)a1 != *(void *)a2 || v5 != *(_DWORD *)(a2 + 8); int v5 = *(_DWORD *)(a1 + 8))
  {
    int v8 = *(uint64_t **)a3;
    uint64_t v9 = 1 << i;
    if ((*v4 >> v5)) {
      uint64_t v10 = *v8 | v9;
    }
    else {
      uint64_t v10 = *v8 & ~v9;
    }
    *int v8 = v10;
    if (v5 == 63)
    {
      int v11 = 0;
      *(void *)a1 = v4 + 1;
    }
    else
    {
      int v11 = v5 + 1;
    }
    *(_DWORD *)(a1 + 8) = v11;
    int v12 = *(_DWORD *)(a3 + 8);
    if (v12 == 63)
    {
      int i = 0;
      *(void *)a3 += 8;
    }
    else
    {
      int i = v12 + 1;
    }
    *(_DWORD *)(a3 + 8) = i;
    unint64_t v4 = *(void **)a1;
  }
  *(void *)a4 = v4;
  *(_DWORD *)(a4 + 8) = v5;
  *(void *)(a4 + 16) = *(void *)a3;
  *(_DWORD *)(a4 + 24) = i;
}

void nlohmann::detail::exception::name(int a1@<W1>, std::string *a2@<X8>)
{
  std::operator+<char>();
  unint64_t v4 = std::string::append(&v12, ".", 1uLL);
  long long v5 = *(_OWORD *)&v4->__r_.__value_.__l.__data_;
  v13.__r_.__value_.__r.__words[2] = v4->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v13.__r_.__value_.__l.__data_ = v5;
  v4->__r_.__value_.__l.__size_ = 0;
  v4->__r_.__value_.__r.__words[2] = 0;
  v4->__r_.__value_.__r.__words[0] = 0;
  std::to_string(&__p, a1);
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    p_p = &__p;
  }
  else {
    p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
  }
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    std::string::size_type size = HIBYTE(__p.__r_.__value_.__r.__words[2]);
  }
  else {
    std::string::size_type size = __p.__r_.__value_.__l.__size_;
  }
  int v8 = std::string::append(&v13, (const std::string::value_type *)p_p, size);
  long long v9 = *(_OWORD *)&v8->__r_.__value_.__l.__data_;
  v14.__r_.__value_.__r.__words[2] = v8->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v14.__r_.__value_.__l.__data_ = v9;
  v8->__r_.__value_.__l.__size_ = 0;
  v8->__r_.__value_.__r.__words[2] = 0;
  v8->__r_.__value_.__r.__words[0] = 0;
  uint64_t v10 = std::string::append(&v14, "] ", 2uLL);
  *a2 = *v10;
  v10->__r_.__value_.__l.__size_ = 0;
  v10->__r_.__value_.__r.__words[2] = 0;
  v10->__r_.__value_.__r.__words[0] = 0;
  if (SHIBYTE(v14.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v14.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v13.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v13.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v12.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v12.__r_.__value_.__l.__data_);
  }
}

void sub_1B731FB8C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,void *a21,uint64_t a22,int a23,__int16 a24,char a25,char a26)
{
  if (*(char *)(v26 - 41) < 0) {
    operator delete(*(void **)(v26 - 64));
  }
  if (a14 < 0) {
    operator delete(__p);
  }
  if (a26 < 0) {
    operator delete(a21);
  }
  if (a20 < 0) {
    operator delete(a15);
  }
  _Unwind_Resume(exception_object);
}

nlohmann::detail::exception *nlohmann::detail::exception::exception(nlohmann::detail::exception *this, int a2, const char *a3)
{
  *(void *)this = &unk_1F1059AE8;
  *((_DWORD *)this + 2) = a2;
  MEMORY[0x1BA9BC690]((char *)this + 16, a3);
  return this;
}

void sub_1B731FC40(_Unwind_Exception *a1)
{
  std::exception::~exception(v1);
  _Unwind_Resume(a1);
}

const char *nlohmann::detail::exception::what(const std::runtime_error *this)
{
  return std::runtime_error::what(this + 1);
}

void nlohmann::detail::exception::~exception(std::exception *this)
{
  this->__vftable = (std::exception_vtbl *)&unk_1F1059AE8;
  MEMORY[0x1BA9BC6A0](&this[2]);
  std::exception::~exception(this);
}

{
  uint64_t vars8;

  this->__vftable = (std::exception_vtbl *)&unk_1F1059AE8;
  MEMORY[0x1BA9BC6A0](&this[2]);
  std::exception::~exception(this);
  JUMPOUT(0x1BA9BC7E0);
}

void nlohmann::detail::parse_error::position_string(uint64_t a1@<X0>, std::string *a2@<X8>)
{
  std::to_string(&v12, *(void *)(a1 + 16) + 1);
  unint64_t v4 = std::string::insert(&v12, 0, " at line ", 9uLL);
  long long v5 = *(_OWORD *)&v4->__r_.__value_.__l.__data_;
  v13.__r_.__value_.__r.__words[2] = v4->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v13.__r_.__value_.__l.__data_ = v5;
  v4->__r_.__value_.__l.__size_ = 0;
  v4->__r_.__value_.__r.__words[2] = 0;
  v4->__r_.__value_.__r.__words[0] = 0;
  uint64_t v6 = std::string::append(&v13, ", column ", 9uLL);
  long long v7 = *(_OWORD *)&v6->__r_.__value_.__l.__data_;
  v14.__r_.__value_.__r.__words[2] = v6->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v14.__r_.__value_.__l.__data_ = v7;
  v6->__r_.__value_.__l.__size_ = 0;
  v6->__r_.__value_.__r.__words[2] = 0;
  v6->__r_.__value_.__r.__words[0] = 0;
  std::to_string(&__p, *(void *)(a1 + 8));
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    p_p = &__p;
  }
  else {
    p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
  }
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    std::string::size_type size = HIBYTE(__p.__r_.__value_.__r.__words[2]);
  }
  else {
    std::string::size_type size = __p.__r_.__value_.__l.__size_;
  }
  uint64_t v10 = std::string::append(&v14, (const std::string::value_type *)p_p, size);
  *a2 = *v10;
  v10->__r_.__value_.__l.__size_ = 0;
  v10->__r_.__value_.__r.__words[2] = 0;
  v10->__r_.__value_.__r.__words[0] = 0;
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v14.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v14.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v13.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v13.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v12.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v12.__r_.__value_.__l.__data_);
  }
}

void sub_1B731FEA0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,void *a21,uint64_t a22,int a23,__int16 a24,char a25,char a26)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  if (*(char *)(v26 - 25) < 0) {
    operator delete(*(void **)(v26 - 48));
  }
  if (a26 < 0) {
    operator delete(a21);
  }
  if (a20 < 0) {
    operator delete(a15);
  }
  _Unwind_Resume(exception_object);
}

const char *nlohmann::detail::lexer_base<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::token_type_name(unsigned int a1)
{
  if (a1 > 0x10) {
    return "unknown token";
  }
  else {
    return off_1E615C9F8[a1];
  }
}

char **std::string::basic_string[abi:sn180100]<0>(char **a1, char *__s)
{
  if (!__s) {
    goto LABEL_15;
  }
  size_t v4 = strlen(__s);
  if (v4 >= 0x7FFFFFFFFFFFFFF8) {
    goto LABEL_16;
  }
  size_t v5 = v4;
  if (v4 > 0x16)
  {
    uint64_t v7 = (v4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v4 | 7) != 0x17) {
      uint64_t v7 = v4 | 7;
    }
    uint64_t v8 = v7 + 1;
    uint64_t v6 = (char *)operator new(v7 + 1);
    a1[1] = (char *)v5;
    a1[2] = (char *)(v8 | 0x8000000000000000);
    *a1 = v6;
  }
  else
  {
    *((unsigned char *)a1 + 23) = v4;
    uint64_t v6 = (char *)a1;
  }
  long long v9 = &v6[v5];
  if (v6 <= __s && v9 > __s)
  {
LABEL_15:
    __break(1u);
LABEL_16:
    abort();
  }
  if (v5) {
    memmove(v6, __s, v5);
  }
  char *v9 = 0;
  return a1;
}

void *std::__function::__value_func<BOOL ()(int,nlohmann::detail::parse_event_t,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> &)>::~__value_func[abi:sn180100](void *a1)
{
  uint64_t v2 = (void *)a1[3];
  if (v2 == a1)
  {
    (*(void (**)(void *))(*a1 + 32))(a1);
  }
  else if (v2)
  {
    (*(void (**)(void *))(*v2 + 40))(v2);
  }
  return a1;
}

void *nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::parser<nlohmann::detail::input_stream_adapter>@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X8>)
{
  v8[4] = *MEMORY[0x1E4F143B8];
  std::__function::__value_func<BOOL ()(int,nlohmann::detail::parse_event_t,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> &)>::__value_func[abi:sn180100]((uint64_t)v8, a2);
  nlohmann::detail::parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::input_stream_adapter>::parser(a4, a1, (uint64_t)v8, a3);
  return std::__function::__value_func<BOOL ()(int,nlohmann::detail::parse_event_t,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> &)>::~__value_func[abi:sn180100](v8);
}

void sub_1B7320154(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::__function::__value_func<BOOL ()(int,nlohmann::detail::parse_event_t,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> &)>::~__value_func[abi:sn180100]((uint64_t *)va);
  _Unwind_Resume(a1);
}

void nlohmann::detail::parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::input_stream_adapter>::sax_parse<anonymous namespace'::JSONSAXAdapter>(uint64_t a1, uint64_t a2)
{
  memset(&v39, 0, sizeof(v39));
  uint64_t v4 = a1 + 112;
  size_t v5 = (nlohmann::detail::input_stream_adapter *)(a1 + 40);
  while (2)
  {
    switch(*(_DWORD *)(a1 + 32))
    {
      case 1:
        char v6 = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)a2 + 8))(a2, 1);
        goto LABEL_18;
      case 2:
        char v6 = (*(uint64_t (**)(uint64_t, void))(*(void *)a2 + 8))(a2, 0);
        goto LABEL_18;
      case 3:
        char v6 = (**(uint64_t (***)(uint64_t))a2)(a2);
        goto LABEL_18;
      case 4:
        char v6 = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)a2 + 40))(a2, v4);
        goto LABEL_18;
      case 5:
        char v6 = (*(uint64_t (**)(uint64_t, void))(*(void *)a2 + 24))(a2, *(void *)(a1 + 152));
        goto LABEL_18;
      case 6:
        char v6 = (*(uint64_t (**)(uint64_t, void))(*(void *)a2 + 16))(a2, *(void *)(a1 + 144));
        goto LABEL_18;
      case 7:
        if ((*(void *)(a1 + 160) & 0x7FFFFFFFFFFFFFFFuLL) >= 0x7FF0000000000000)
        {
          uint64_t v28 = *(void *)(a1 + 64);
          nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::input_stream_adapter>::get_token_string((uint64_t)v5, &v38);
          nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::input_stream_adapter>::get_token_string((uint64_t)v5, &v33);
          std::string::size_type v29 = std::string::insert(&v33, 0, "number overflow parsing '", 0x19uLL);
          long long v30 = *(_OWORD *)&v29->__r_.__value_.__l.__data_;
          v34.__r_.__value_.__r.__words[2] = v29->__r_.__value_.__r.__words[2];
          *(_OWORD *)&v34.__r_.__value_.__l.__data_ = v30;
          v29->__r_.__value_.__l.__size_ = 0;
          v29->__r_.__value_.__r.__words[2] = 0;
          v29->__r_.__value_.__r.__words[0] = 0;
          int64_t v31 = std::string::append(&v34, "'", 1uLL);
          long long v32 = *(_OWORD *)&v31->__r_.__value_.__l.__data_;
          __p.__r_.__value_.__r.__words[2] = v31->__r_.__value_.__r.__words[2];
          *(_OWORD *)&__p.__r_.__value_.__l.__data_ = v32;
          v31->__r_.__value_.__l.__size_ = 0;
          v31->__r_.__value_.__r.__words[2] = 0;
          v31->__r_.__value_.__r.__words[0] = 0;
          nlohmann::detail::out_of_range::create(406, (uint64_t)&__p, (nlohmann::detail::exception *)&v36);
          int v17 = (*(uint64_t (**)(uint64_t, uint64_t, std::string *, std::exception *))(*(void *)a2 + 96))(a2, v28, &v38, &v36);
          nlohmann::detail::out_of_range::~out_of_range(&v36);
          if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
            operator delete(__p.__r_.__value_.__l.__data_);
          }
          goto LABEL_57;
        }
        if ((*(unsigned int (**)(uint64_t, uint64_t))(*(void *)a2 + 32))(a2, v4)) {
          goto LABEL_19;
        }
        goto LABEL_53;
      case 8:
        if (!(*(unsigned int (**)(uint64_t, uint64_t))(*(void *)a2 + 80))(a2, -1)) {
          goto LABEL_53;
        }
        int v7 = nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::input_stream_adapter>::scan(v5);
        *(_DWORD *)(a1 + 32) = v7;
        if (v7 == 10)
        {
          char v6 = (*(uint64_t (**)(uint64_t))(*(void *)a2 + 88))(a2);
          goto LABEL_18;
        }
        LOBYTE(v36.__vftable) = 1;
        std::vector<BOOL>::push_back((uint64_t)&v39, &v36);
        continue;
      case 9:
        if (((*(uint64_t (**)(uint64_t, uint64_t))(*(void *)a2 + 56))(a2, -1) & 1) == 0) {
          goto LABEL_53;
        }
        int v8 = nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::input_stream_adapter>::scan(v5);
        *(_DWORD *)(a1 + 32) = v8;
        if (v8 != 11)
        {
          if (v8 != 4) {
            goto LABEL_65;
          }
          if (!(*(unsigned int (**)(uint64_t, uint64_t))(*(void *)a2 + 64))(a2, v4)) {
            goto LABEL_53;
          }
          int v16 = nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::input_stream_adapter>::scan(v5);
          *(_DWORD *)(a1 + 32) = v16;
          if (v16 != 12) {
            goto LABEL_66;
          }
          LOBYTE(v36.__vftable) = 0;
          std::vector<BOOL>::push_back((uint64_t)&v39, &v36);
          int v15 = nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::input_stream_adapter>::scan(v5);
LABEL_35:
          *(_DWORD *)(a1 + 32) = v15;
          continue;
        }
        char v6 = (*(uint64_t (**)(uint64_t))(*(void *)a2 + 72))(a2);
LABEL_18:
        if ((v6 & 1) == 0) {
          goto LABEL_53;
        }
LABEL_19:
        std::string::size_type size = v39.__r_.__value_.__l.__size_;
        if (!v39.__r_.__value_.__l.__size_)
        {
LABEL_41:
          int v17 = 1;
          goto LABEL_42;
        }
        while (2)
        {
          if ((*(void *)(v39.__r_.__value_.__r.__words[0] + (((size - 1) >> 3) & 0x1FFFFFFFFFFFFFF8)) >> (size - 1)))
          {
            int v10 = nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::input_stream_adapter>::scan(v5);
            *(_DWORD *)(a1 + 32) = v10;
            if (v10 == 13) {
              goto LABEL_34;
            }
            if (v10 != 10)
            {
              uint64_t v23 = *(void *)(a1 + 64);
              nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::input_stream_adapter>::get_token_string((uint64_t)v5, &v38);
              std::string __p = *(std::string *)(a1 + 64);
              std::string::basic_string[abi:sn180100]<0>(&v33.__r_.__value_.__l.__data_, "array");
              nlohmann::detail::parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::input_stream_adapter>::exception_message(a1, 0xAu, (uint64_t)&v33, &v34);
              nlohmann::detail::parse_error::create(101, (uint64_t *)&__p, (uint64_t)&v34, (nlohmann::detail::exception *)&v36);
              int v24 = (*(uint64_t (**)(uint64_t, uint64_t, std::string *, std::exception *))(*(void *)a2 + 96))(a2, v23, &v38, &v36);
              goto LABEL_67;
            }
            char v11 = (*(uint64_t (**)(uint64_t))(*(void *)a2 + 88))(a2);
LABEL_27:
            if ((v11 & 1) == 0) {
              goto LABEL_53;
            }
            std::string::size_type size = v39.__r_.__value_.__l.__size_ - 1;
            v39.__r_.__value_.__l.__size_ = size;
            if (!size) {
              goto LABEL_41;
            }
            continue;
          }
          break;
        }
        int v12 = nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::input_stream_adapter>::scan(v5);
        *(_DWORD *)(a1 + 32) = v12;
        if (v12 != 13)
        {
          if (v12 != 11)
          {
            uint64_t v25 = *(void *)(a1 + 64);
            nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::input_stream_adapter>::get_token_string((uint64_t)v5, &v38);
            std::string __p = *(std::string *)(a1 + 64);
            std::string::basic_string[abi:sn180100]<0>(&v33.__r_.__value_.__l.__data_, "object");
            nlohmann::detail::parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::input_stream_adapter>::exception_message(a1, 0xBu, (uint64_t)&v33, &v34);
            nlohmann::detail::parse_error::create(101, (uint64_t *)&__p, (uint64_t)&v34, (nlohmann::detail::exception *)&v36);
            int v24 = (*(uint64_t (**)(uint64_t, uint64_t, std::string *, std::exception *))(*(void *)a2 + 96))(a2, v25, &v38, &v36);
            goto LABEL_67;
          }
          char v11 = (*(uint64_t (**)(uint64_t))(*(void *)a2 + 72))(a2);
          goto LABEL_27;
        }
        int v13 = nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::input_stream_adapter>::scan(v5);
        *(_DWORD *)(a1 + 32) = v13;
        if (v13 != 4)
        {
LABEL_65:
          uint64_t v26 = *(void *)(a1 + 64);
          nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::input_stream_adapter>::get_token_string((uint64_t)v5, &v38);
          std::string __p = *(std::string *)(a1 + 64);
          std::string::basic_string[abi:sn180100]<0>(&v33.__r_.__value_.__l.__data_, "object key");
          nlohmann::detail::parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::input_stream_adapter>::exception_message(a1, 4u, (uint64_t)&v33, &v34);
          nlohmann::detail::parse_error::create(101, (uint64_t *)&__p, (uint64_t)&v34, (nlohmann::detail::exception *)&v36);
          int v24 = (*(uint64_t (**)(uint64_t, uint64_t, std::string *, std::exception *))(*(void *)a2 + 96))(a2, v26, &v38, &v36);
          goto LABEL_67;
        }
        if (!(*(unsigned int (**)(uint64_t, uint64_t))(*(void *)a2 + 64))(a2, v4))
        {
LABEL_53:
          int v17 = 0;
          goto LABEL_42;
        }
        int v14 = nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::input_stream_adapter>::scan(v5);
        *(_DWORD *)(a1 + 32) = v14;
        if (v14 == 12)
        {
LABEL_34:
          int v15 = nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::input_stream_adapter>::scan(v5);
          goto LABEL_35;
        }
LABEL_66:
        uint64_t v27 = *(void *)(a1 + 64);
        nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::input_stream_adapter>::get_token_string((uint64_t)v5, &v38);
        std::string __p = *(std::string *)(a1 + 64);
        std::string::basic_string[abi:sn180100]<0>(&v33.__r_.__value_.__l.__data_, "object separator");
        nlohmann::detail::parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::input_stream_adapter>::exception_message(a1, 0xCu, (uint64_t)&v33, &v34);
        nlohmann::detail::parse_error::create(101, (uint64_t *)&__p, (uint64_t)&v34, (nlohmann::detail::exception *)&v36);
        int v24 = (*(uint64_t (**)(uint64_t, uint64_t, std::string *, std::exception *))(*(void *)a2 + 96))(a2, v27, &v38, &v36);
LABEL_67:
        int v17 = v24;
        nlohmann::detail::parse_error::~parse_error(&v36);
LABEL_57:
        if (SHIBYTE(v34.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(v34.__r_.__value_.__l.__data_);
        }
        if (SHIBYTE(v33.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(v33.__r_.__value_.__l.__data_);
        }
        if (SHIBYTE(v38.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(v38.__r_.__value_.__l.__data_);
        }
LABEL_42:
        if (v39.__r_.__value_.__r.__words[0]) {
          operator delete(v39.__r_.__value_.__l.__data_);
        }
        if (v17)
        {
          int v18 = nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::input_stream_adapter>::scan(v5);
          *(_DWORD *)(a1 + 32) = v18;
          if (v18 != 15)
          {
            uint64_t v19 = *(void *)(a1 + 64);
            nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::input_stream_adapter>::get_token_string((uint64_t)v5, &v39);
            std::string v38 = *(std::string *)(a1 + 64);
            std::string::basic_string[abi:sn180100]<0>(&v34.__r_.__value_.__l.__data_, "value");
            nlohmann::detail::parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::input_stream_adapter>::exception_message(a1, 0xFu, (uint64_t)&v34, &__p);
            nlohmann::detail::parse_error::create(101, (uint64_t *)&v38, (uint64_t)&__p, (nlohmann::detail::exception *)&v36);
            (*(void (**)(uint64_t, uint64_t, std::string *, std::exception *))(*(void *)a2 + 96))(a2, v19, &v39, &v36);
            v36.__vftable = (std::exception_vtbl *)&unk_1F1059AE8;
            MEMORY[0x1BA9BC6A0](v37);
            std::exception::~exception(&v36);
            if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
              operator delete(__p.__r_.__value_.__l.__data_);
            }
            if (SHIBYTE(v34.__r_.__value_.__r.__words[2]) < 0) {
              operator delete(v34.__r_.__value_.__l.__data_);
            }
            if (SHIBYTE(v39.__r_.__value_.__r.__words[2]) < 0) {
              operator delete(v39.__r_.__value_.__l.__data_);
            }
          }
        }
        return;
      case 0xE:
        uint64_t v20 = *(void *)(a1 + 64);
        nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::input_stream_adapter>::get_token_string((uint64_t)v5, &v38);
        std::string __p = *(std::string *)(a1 + 64);
        std::string::basic_string[abi:sn180100]<0>(&v33.__r_.__value_.__l.__data_, "value");
        nlohmann::detail::parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::input_stream_adapter>::exception_message(a1, 0, (uint64_t)&v33, &v34);
        nlohmann::detail::parse_error::create(101, (uint64_t *)&__p, (uint64_t)&v34, (nlohmann::detail::exception *)&v36);
        int v21 = (*(uint64_t (**)(uint64_t, uint64_t, std::string *, std::exception *))(*(void *)a2 + 96))(a2, v20, &v38, &v36);
        goto LABEL_56;
      default:
        uint64_t v22 = *(void *)(a1 + 64);
        nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::input_stream_adapter>::get_token_string((uint64_t)v5, &v38);
        std::string __p = *(std::string *)(a1 + 64);
        std::string::basic_string[abi:sn180100]<0>(&v33.__r_.__value_.__l.__data_, "value");
        nlohmann::detail::parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::input_stream_adapter>::exception_message(a1, 0x10u, (uint64_t)&v33, &v34);
        nlohmann::detail::parse_error::create(101, (uint64_t *)&__p, (uint64_t)&v34, (nlohmann::detail::exception *)&v36);
        int v21 = (*(uint64_t (**)(uint64_t, uint64_t, std::string *, std::exception *))(*(void *)a2 + 96))(a2, v22, &v38, &v36);
LABEL_56:
        int v17 = v21;
        v36.__vftable = (std::exception_vtbl *)&unk_1F1059AE8;
        MEMORY[0x1BA9BC6A0](v37);
        std::exception::~exception(&v36);
        goto LABEL_57;
    }
  }
}

void sub_1B7320CF4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21,uint64_t a22,void *a23,uint64_t a24,int a25,__int16 a26,char a27,char a28,std::exception a29)
{
  nlohmann::detail::parse_error::~parse_error(&a29);
  if (a21 < 0) {
    operator delete(__p);
  }
  if (a15 < 0) {
    operator delete(a10);
  }
  if (*(char *)(v29 - 73) < 0) {
    operator delete(*(void **)(v29 - 96));
  }
  int64_t v31 = *(void **)(v29 - 72);
  if (v31) {
    operator delete(v31);
  }
  _Unwind_Resume(a1);
}

uint64_t nlohmann::detail::parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::input_stream_adapter>::parser(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v7 = std::__function::__value_func<BOOL ()(int,nlohmann::detail::parse_event_t,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> &)>::__value_func[abi:sn180100](a1, a3);
  *(_DWORD *)(v7 + 32) = 0;
  int v8 = (nlohmann::detail::input_stream_adapter *)(v7 + 40);
  nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::input_stream_adapter>::lexer(v7 + 40, a2);
  *(unsigned char *)(a1 + 176) = a4;
  *(_DWORD *)(a1 + 32) = nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::input_stream_adapter>::scan(v8);
  return a1;
}

void sub_1B7320F28(_Unwind_Exception *a1)
{
  nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::input_stream_adapter>::~lexer(v2);
  std::__function::__value_func<BOOL ()(int,nlohmann::detail::parse_event_t,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> &)>::~__value_func[abi:sn180100](v1);
  _Unwind_Resume(a1);
}

uint64_t nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::input_stream_adapter>::lexer(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)a2 = 0;
  *(void *)(a2 + 8) = 0;
  *(_DWORD *)(a1 + 16) = -1;
  *(unsigned char *)(a1 + 20) = 0;
  *(_OWORD *)(a1 + 24) = 0u;
  *(_OWORD *)(a1 + 40) = 0u;
  *(_OWORD *)(a1 + 56) = 0u;
  *(_OWORD *)(a1 + 72) = 0u;
  *(void *)(a1 + 88) = 0;
  *(void *)(a1 + 96) = "";
  *(void *)(a1 + 112) = 0;
  *(void *)(a1 + 120) = 0;
  *(void *)(a1 + 104) = 0;
  unint64_t v3 = localeconv();
  if (v3->decimal_point) {
    int v4 = *v3->decimal_point;
  }
  else {
    int v4 = 46;
  }
  *(_DWORD *)(a1 + 128) = v4;
  return a1;
}

uint64_t nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::input_stream_adapter>::scan(nlohmann::detail::input_stream_adapter *this)
{
  if (*((void *)this + 3)
    || nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::input_stream_adapter>::skip_bom(this))
  {
    while (2)
    {
      while (1)
      {
        nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::input_stream_adapter>::get(this);
        int v2 = *((_DWORD *)this + 4);
        if (v2 > 31) {
          break;
        }
        if ((v2 - 9) >= 2 && v2 != 13)
        {
          if ((v2 + 1) < 2) {
            return 15;
          }
LABEL_48:
          char v6 = "invalid literal";
          goto LABEL_24;
        }
      }
      if (v2 > 90)
      {
        if (v2 <= 109)
        {
          switch(v2)
          {
            case '[':
              return 8;
            case ']':
              return 10;
            case 'f':
              uint64_t v7 = 0;
              while (aFalse_0[v7 + 1] == nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::input_stream_adapter>::get(this))
              {
                if (++v7 == 4) {
                  return 2;
                }
              }
              break;
          }
        }
        else if (v2 > 122)
        {
          if (v2 == 123) {
            return 9;
          }
          if (v2 == 125) {
            return 11;
          }
        }
        else if (v2 == 110)
        {
          int v9 = 1819047278;
          uint64_t v8 = 1;
          while (*((unsigned __int8 *)&v9 + v8) == nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::input_stream_adapter>::get(this))
          {
            if (++v8 == 4) {
              return 3;
            }
          }
        }
        else if (v2 == 116)
        {
          int v10 = 1702195828;
          uint64_t v5 = 1;
          while (*((unsigned __int8 *)&v10 + v5) == nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::input_stream_adapter>::get(this))
          {
            if (++v5 == 4) {
              return 1;
            }
          }
        }
        goto LABEL_48;
      }
      switch(v2)
      {
        case ' ':
          continue;
        case '""':
          uint64_t result = nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::input_stream_adapter>::scan_string((uint64_t)this);
          break;
        case ',':
          uint64_t result = 13;
          break;
        case '-':
        case '0':
        case '1':
        case '2':
        case '3':
        case '4':
        case '5':
        case '6':
        case '7':
        case '8':
        case '9':
          uint64_t result = nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::input_stream_adapter>::scan_number((uint64_t)this);
          break;
        case ':':
          uint64_t result = 12;
          break;
        default:
          goto LABEL_48;
      }
      break;
    }
  }
  else
  {
    char v6 = "invalid BOM; must be 0xEF 0xBB 0xBF if given";
LABEL_24:
    *((void *)this + 12) = v6;
    return 14;
  }
  return result;
}

BOOL nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::input_stream_adapter>::skip_bom(nlohmann::detail::input_stream_adapter *a1)
{
  if (nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::input_stream_adapter>::get(a1) == 239)
  {
    return nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::input_stream_adapter>::get(a1) == 187
        && nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::input_stream_adapter>::get(a1) == 191;
  }
  else
  {
    nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::unget((uint64_t)a1);
    return 1;
  }
}

uint64_t nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::input_stream_adapter>::get(nlohmann::detail::input_stream_adapter *this)
{
  *(int64x2_t *)((char *)this + 24) = vaddq_s64(*(int64x2_t *)((char *)this + 24), vdupq_n_s64(1uLL));
  if (*((unsigned char *)this + 20))
  {
    *((unsigned char *)this + 20) = 0;
    int character = *((_DWORD *)this + 4);
  }
  else
  {
    int character = nlohmann::detail::input_stream_adapter::get_character(this);
    *((_DWORD *)this + 4) = character;
  }
  if (character == -1) {
    return 0xFFFFFFFFLL;
  }
  int v4 = (unsigned char *)*((void *)this + 7);
  unint64_t v3 = *((void *)this + 8);
  if ((unint64_t)v4 >= v3)
  {
    unint64_t v6 = *((void *)this + 6);
    uint64_t v7 = &v4[-v6];
    uint64_t v8 = (uint64_t)&v4[-v6 + 1];
    if (v8 < 0) {
      goto LABEL_27;
    }
    unint64_t v9 = v3 - v6;
    if (2 * v9 > v8) {
      uint64_t v8 = 2 * v9;
    }
    if (v9 >= 0x3FFFFFFFFFFFFFFFLL) {
      size_t v10 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else {
      size_t v10 = v8;
    }
    if (v10)
    {
      char v11 = operator new(v10);
      int v12 = &v11[v10];
      v7[(void)v11] = character;
      uint64_t v5 = (uint64_t)&v7[(void)v11 + 1];
      if (v4 == (unsigned char *)v6)
      {
        char v11 = &v7[(void)v11];
      }
      else
      {
        int v13 = &v4[~v6];
        do
        {
          char v14 = *--v4;
          (v13--)[(void)v11] = v14;
        }
        while (v4 != (unsigned char *)v6);
        int v4 = (unsigned char *)v6;
      }
      *((void *)this + 6) = v11;
      *((void *)this + 7) = v5;
      *((void *)this + 8) = v12;
      if (v4) {
        operator delete(v4);
      }
      goto LABEL_22;
    }
LABEL_26:
    __break(1u);
LABEL_27:
    abort();
  }
  if (!v4) {
    goto LABEL_26;
  }
  *int v4 = character;
  uint64_t v5 = (uint64_t)(v4 + 1);
LABEL_22:
  *((void *)this + 7) = v5;
  uint64_t result = *((unsigned int *)this + 4);
  if (result == 10)
  {
    uint64_t v16 = *((void *)this + 5) + 1;
    *((void *)this + 4) = 0;
    *((void *)this + 5) = v16;
  }
  return result;
}

uint64_t nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::input_stream_adapter>::scan_string(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::reset(a1);
  while (2)
  {
    while (2)
    {
      int v2 = nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::input_stream_adapter>::get((nlohmann::detail::input_stream_adapter *)a1)
         + 1;
      uint64_t result = 4;
      int v4 = "invalid string: missing closing quote";
      switch(v2)
      {
        case 0:
          goto LABEL_81;
        case 1:
          int v4 = "invalid string: control character U+0000 (NUL) must be escaped to \\u0000";
          goto LABEL_81;
        case 2:
          int v4 = "invalid string: control character U+0001 (SOH) must be escaped to \\u0001";
          goto LABEL_81;
        case 3:
          int v4 = "invalid string: control character U+0002 (STX) must be escaped to \\u0002";
          goto LABEL_81;
        case 4:
          int v4 = "invalid string: control character U+0003 (ETX) must be escaped to \\u0003";
          goto LABEL_81;
        case 5:
          int v4 = "invalid string: control character U+0004 (EOT) must be escaped to \\u0004";
          goto LABEL_81;
        case 6:
          int v4 = "invalid string: control character U+0005 (ENQ) must be escaped to \\u0005";
          goto LABEL_81;
        case 7:
          int v4 = "invalid string: control character U+0006 (ACK) must be escaped to \\u0006";
          goto LABEL_81;
        case 8:
          int v4 = "invalid string: control character U+0007 (BEL) must be escaped to \\u0007";
          goto LABEL_81;
        case 9:
          int v4 = "invalid string: control character U+0008 (BS) must be escaped to \\u0008 or \\b";
          goto LABEL_81;
        case 10:
          int v4 = "invalid string: control character U+0009 (HT) must be escaped to \\u0009 or \\t";
          goto LABEL_81;
        case 11:
          int v4 = "invalid string: control character U+000A (LF) must be escaped to \\u000A or \\n";
          goto LABEL_81;
        case 12:
          int v4 = "invalid string: control character U+000B (VT) must be escaped to \\u000B";
          goto LABEL_81;
        case 13:
          int v4 = "invalid string: control character U+000C (FF) must be escaped to \\u000C or \\f";
          goto LABEL_81;
        case 14:
          int v4 = "invalid string: control character U+000D (CR) must be escaped to \\u000D or \\r";
          goto LABEL_81;
        case 15:
          int v4 = "invalid string: control character U+000E (SO) must be escaped to \\u000E";
          goto LABEL_81;
        case 16:
          int v4 = "invalid string: control character U+000F (SI) must be escaped to \\u000F";
          goto LABEL_81;
        case 17:
          int v4 = "invalid string: control character U+0010 (DLE) must be escaped to \\u0010";
          goto LABEL_81;
        case 18:
          int v4 = "invalid string: control character U+0011 (DC1) must be escaped to \\u0011";
          goto LABEL_81;
        case 19:
          int v4 = "invalid string: control character U+0012 (DC2) must be escaped to \\u0012";
          goto LABEL_81;
        case 20:
          int v4 = "invalid string: control character U+0013 (DC3) must be escaped to \\u0013";
          goto LABEL_81;
        case 21:
          int v4 = "invalid string: control character U+0014 (DC4) must be escaped to \\u0014";
          goto LABEL_81;
        case 22:
          int v4 = "invalid string: control character U+0015 (NAK) must be escaped to \\u0015";
          goto LABEL_81;
        case 23:
          int v4 = "invalid string: control character U+0016 (SYN) must be escaped to \\u0016";
          goto LABEL_81;
        case 24:
          int v4 = "invalid string: control character U+0017 (ETB) must be escaped to \\u0017";
          goto LABEL_81;
        case 25:
          int v4 = "invalid string: control character U+0018 (CAN) must be escaped to \\u0018";
          goto LABEL_81;
        case 26:
          int v4 = "invalid string: control character U+0019 (EM) must be escaped to \\u0019";
          goto LABEL_81;
        case 27:
          int v4 = "invalid string: control character U+001A (SUB) must be escaped to \\u001A";
          goto LABEL_81;
        case 28:
          int v4 = "invalid string: control character U+001B (ESC) must be escaped to \\u001B";
          goto LABEL_81;
        case 29:
          int v4 = "invalid string: control character U+001C (FS) must be escaped to \\u001C";
          goto LABEL_81;
        case 30:
          int v4 = "invalid string: control character U+001D (GS) must be escaped to \\u001D";
          goto LABEL_81;
        case 31:
          int v4 = "invalid string: control character U+001E (RS) must be escaped to \\u001E";
          goto LABEL_81;
        case 32:
          int v4 = "invalid string: control character U+001F (US) must be escaped to \\u001F";
          goto LABEL_81;
        case 33:
        case 34:
        case 36:
        case 37:
        case 38:
        case 39:
        case 40:
        case 41:
        case 42:
        case 43:
        case 44:
        case 45:
        case 46:
        case 47:
        case 48:
        case 49:
        case 50:
        case 51:
        case 52:
        case 53:
        case 54:
        case 55:
        case 56:
        case 57:
        case 58:
        case 59:
        case 60:
        case 61:
        case 62:
        case 63:
        case 64:
        case 65:
        case 66:
        case 67:
        case 68:
        case 69:
        case 70:
        case 71:
        case 72:
        case 73:
        case 74:
        case 75:
        case 76:
        case 77:
        case 78:
        case 79:
        case 80:
        case 81:
        case 82:
        case 83:
        case 84:
        case 85:
        case 86:
        case 87:
        case 88:
        case 89:
        case 90:
        case 91:
        case 92:
        case 94:
        case 95:
        case 96:
        case 97:
        case 98:
        case 99:
        case 100:
        case 101:
        case 102:
        case 103:
        case 104:
        case 105:
        case 106:
        case 107:
        case 108:
        case 109:
        case 110:
        case 111:
        case 112:
        case 113:
        case 114:
        case 115:
        case 116:
        case 117:
        case 118:
        case 119:
        case 120:
        case 121:
        case 122:
        case 123:
        case 124:
        case 125:
        case 126:
        case 127:
        case 128:
          int v5 = *(_DWORD *)(a1 + 16);
          goto LABEL_4;
        case 35:
          return result;
        case 93:
          int v10 = nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::input_stream_adapter>::get((nlohmann::detail::input_stream_adapter *)a1);
          int v4 = "invalid string: forbidden character after backslash";
          if (v10 <= 97)
          {
            switch(v10)
            {
              case '""':
                LOBYTE(v5) = 34;
                break;
              case '/':
                LOBYTE(v5) = 47;
                break;
              case '\\':
                LOBYTE(v5) = 92;
                break;
              default:
                goto LABEL_81;
            }
            goto LABEL_4;
          }
          break;
        case 195:
        case 196:
        case 197:
        case 198:
        case 199:
        case 200:
        case 201:
        case 202:
        case 203:
        case 204:
        case 205:
        case 206:
        case 207:
        case 208:
        case 209:
        case 210:
        case 211:
        case 212:
        case 213:
        case 214:
        case 215:
        case 216:
        case 217:
        case 218:
        case 219:
        case 220:
        case 221:
        case 222:
        case 223:
        case 224:
          *(void *)&long long v14 = 0xBF00000080;
          unint64_t v6 = (std::string *)a1;
          uint64_t v7 = 2;
          goto LABEL_19;
        case 225:
          long long v8 = xmmword_1B7390140;
          goto LABEL_7;
        case 226:
        case 227:
        case 228:
        case 229:
        case 230:
        case 231:
        case 232:
        case 233:
        case 234:
        case 235:
        case 236:
        case 237:
        case 239:
        case 240:
          long long v8 = xmmword_1B7390130;
          goto LABEL_7;
        case 238:
          long long v8 = xmmword_1B7390120;
LABEL_7:
          long long v14 = v8;
          unint64_t v6 = (std::string *)a1;
          uint64_t v7 = 4;
          goto LABEL_19;
        case 241:
          uint64_t v15 = 0xBF00000080;
          unint64_t v9 = &xmmword_1B7390170;
          goto LABEL_18;
        case 242:
        case 243:
        case 244:
          uint64_t v15 = 0xBF00000080;
          unint64_t v9 = &xmmword_1B7390188;
          goto LABEL_18;
        case 245:
          uint64_t v15 = 0xBF00000080;
          unint64_t v9 = &xmmword_1B73901A0;
LABEL_18:
          long long v14 = *v9;
          unint64_t v6 = (std::string *)a1;
          uint64_t v7 = 6;
LABEL_19:
          if ((nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::input_stream_adapter>::next_byte_in_range(v6, &v14, v7) & 1) == 0)return 14; {
          continue;
          }
        default:
          int v4 = "invalid string: ill-formed UTF-8 byte";
          goto LABEL_81;
      }
      break;
    }
    switch(v10)
    {
      case 'n':
        LOBYTE(v5) = 10;
        goto LABEL_4;
      case 'o':
      case 'p':
      case 'q':
      case 's':
        goto LABEL_81;
      case 'r':
        LOBYTE(v5) = 13;
        goto LABEL_4;
      case 't':
        LOBYTE(v5) = 9;
        goto LABEL_4;
      case 'u':
        unsigned int codepoint = nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::input_stream_adapter>::get_codepoint((nlohmann::detail::input_stream_adapter *)a1);
        if (codepoint == -1) {
          goto LABEL_83;
        }
        unsigned int v12 = codepoint;
        if ((codepoint & 0xFFFFFC00) != 0xD800)
        {
          if ((codepoint & 0xFFFFFC00) == 0xDC00)
          {
            int v4 = "invalid string: surrogate U+DC00..U+DFFF must follow U+D800..U+DBFF";
            goto LABEL_81;
          }
          if ((int)codepoint > 127)
          {
            if (codepoint <= 0x7FF)
            {
              std::string::push_back((std::string *)(a1 + 72), (codepoint >> 6) | 0xC0);
              goto LABEL_39;
            }
            if (!HIWORD(codepoint))
            {
              std::string::push_back((std::string *)(a1 + 72), (codepoint >> 12) | 0xE0);
              goto LABEL_38;
            }
LABEL_37:
            std::string::push_back((std::string *)(a1 + 72), (v12 >> 18) | 0xF0);
            std::string::push_back((std::string *)(a1 + 72), (v12 >> 12) & 0x3F | 0x80);
LABEL_38:
            std::string::push_back((std::string *)(a1 + 72), (v12 >> 6) & 0x3F | 0x80);
LABEL_39:
            LOBYTE(v5) = v12 & 0x3F | 0x80;
            goto LABEL_4;
          }
          LOBYTE(v5) = codepoint;
LABEL_4:
          std::string::push_back((std::string *)(a1 + 72), v5);
          continue;
        }
        if (nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::input_stream_adapter>::get((nlohmann::detail::input_stream_adapter *)a1) != 92
          || nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::input_stream_adapter>::get((nlohmann::detail::input_stream_adapter *)a1) != 117)
        {
LABEL_84:
          int v4 = "invalid string: surrogate U+D800..U+DBFF must be followed by U+DC00..U+DFFF";
          goto LABEL_81;
        }
        unsigned int v13 = nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::input_stream_adapter>::get_codepoint((nlohmann::detail::input_stream_adapter *)a1);
        if (v13 != -1)
        {
          if (v13 >> 10 != 55) {
            goto LABEL_84;
          }
          unsigned int v12 = v13 + (v12 << 10) - 56613888;
          goto LABEL_37;
        }
LABEL_83:
        int v4 = "invalid string: '\\u' must be followed by 4 hex digits";
LABEL_81:
        *(void *)(a1 + 96) = v4;
        return 14;
      default:
        if (v10 == 98)
        {
          LOBYTE(v5) = 8;
        }
        else
        {
          if (v10 != 102) {
            goto LABEL_81;
          }
          LOBYTE(v5) = 12;
        }
        goto LABEL_4;
    }
  }
}

uint64_t nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::input_stream_adapter>::scan_number(uint64_t a1)
{
  nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::reset(a1);
  int v2 = *(_DWORD *)(a1 + 16);
  if ((v2 - 49) < 9)
  {
    int v3 = 5;
LABEL_3:
    int v4 = (std::string *)(a1 + 72);
    while (1)
    {
      std::string::push_back((std::string *)(a1 + 72), v2);
      int v5 = nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::input_stream_adapter>::get((nlohmann::detail::input_stream_adapter *)a1);
      if ((v5 - 48) >= 0xA) {
        break;
      }
      int v2 = *(_DWORD *)(a1 + 16);
    }
    if (v5 != 46)
    {
      if (v5 == 69 || v5 == 101) {
        goto LABEL_9;
      }
LABEL_37:
      nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::unget(a1);
      __endptr = 0;
      *__error() = 0;
      if (v3 == 6)
      {
        uint64_t v16 = (const char *)(a1 + 72);
        if (*(char *)(a1 + 95) < 0) {
          uint64_t v16 = *(const char **)v16;
        }
        uint64_t v17 = strtoll(v16, &__endptr, 10);
        if (!*__error())
        {
          *(void *)(a1 + 104) = v17;
          return 6;
        }
      }
      else
      {
        long long v14 = (const char *)(a1 + 72);
        if (*(char *)(a1 + 95) < 0) {
          long long v14 = *(const char **)v14;
        }
        unint64_t v15 = strtoull(v14, &__endptr, 10);
        if (!*__error())
        {
          *(void *)(a1 + 112) = v15;
          return 5;
        }
      }
      goto LABEL_14;
    }
    goto LABEL_31;
  }
  if (v2 == 48)
  {
    std::string::push_back((std::string *)(a1 + 72), 48);
    int v3 = 5;
  }
  else
  {
    if (v2 == 45) {
      std::string::push_back((std::string *)(a1 + 72), 45);
    }
    int v10 = nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::input_stream_adapter>::get((nlohmann::detail::input_stream_adapter *)a1);
    if ((v10 - 49) < 9)
    {
      int v2 = *(_DWORD *)(a1 + 16);
      int v3 = 6;
      goto LABEL_3;
    }
    if (v10 != 48)
    {
      char v11 = "invalid number; expected digit after '-'";
      goto LABEL_52;
    }
    std::string::push_back((std::string *)(a1 + 72), *(unsigned char *)(a1 + 16));
    int v3 = 6;
  }
  int v12 = nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::input_stream_adapter>::get((nlohmann::detail::input_stream_adapter *)a1);
  if (v12 == 101 || v12 == 69)
  {
    int v4 = (std::string *)(a1 + 72);
    goto LABEL_9;
  }
  if (v12 != 46) {
    goto LABEL_37;
  }
  int v4 = (std::string *)(a1 + 72);
LABEL_31:
  std::string::push_back(v4, *(unsigned char *)(a1 + 128));
  if (nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::input_stream_adapter>::get((nlohmann::detail::input_stream_adapter *)a1)
     - 48 > 9)
  {
    char v11 = "invalid number; expected digit after '.'";
    goto LABEL_52;
  }
  int v4 = (std::string *)(a1 + 72);
  do
  {
    std::string::push_back((std::string *)(a1 + 72), *(unsigned char *)(a1 + 16));
    int v13 = nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::input_stream_adapter>::get((nlohmann::detail::input_stream_adapter *)a1);
  }
  while ((v13 - 48) < 0xA);
  if (v13 == 101 || v13 == 69)
  {
LABEL_9:
    std::string::push_back(v4, *(unsigned char *)(a1 + 16));
    int v6 = nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::input_stream_adapter>::get((nlohmann::detail::input_stream_adapter *)a1);
    if ((v6 - 48) < 0xA)
    {
      uint64_t v7 = (std::string *)(a1 + 72);
      goto LABEL_11;
    }
    if (v6 == 45 || v6 == 43)
    {
      uint64_t v7 = (std::string *)(a1 + 72);
      std::string::push_back((std::string *)(a1 + 72), *(unsigned char *)(a1 + 16));
      if (nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::input_stream_adapter>::get((nlohmann::detail::input_stream_adapter *)a1)
         - 48 < 0xA)
      {
LABEL_11:
        std::string::push_back(v7, *(unsigned char *)(a1 + 16));
        if (nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::input_stream_adapter>::get((nlohmann::detail::input_stream_adapter *)a1)
           - 48 <= 9)
        {
          do
            std::string::push_back((std::string *)(a1 + 72), *(unsigned char *)(a1 + 16));
          while (nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::input_stream_adapter>::get((nlohmann::detail::input_stream_adapter *)a1)
                - 48 < 0xA);
        }
        goto LABEL_13;
      }
      char v11 = "invalid number; expected digit after exponent sign";
    }
    else
    {
      char v11 = "invalid number; expected '+', '-', or digit after exponent";
    }
LABEL_52:
    *(void *)(a1 + 96) = v11;
    return 14;
  }
LABEL_13:
  nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::unget(a1);
  __endptr = 0;
  *__error() = 0;
LABEL_14:
  long long v8 = (const char *)(a1 + 72);
  if (*(char *)(a1 + 95) < 0) {
    long long v8 = *(const char **)v8;
  }
  *(double *)(a1 + 120) = strtod(v8, &__endptr);
  return 7;
}

uint64_t nlohmann::detail::input_stream_adapter::get_character(nlohmann::detail::input_stream_adapter *this)
{
  int v2 = (void *)*((void *)this + 1);
  int v3 = (unsigned __int8 *)v2[3];
  if (v3 == (unsigned __int8 *)v2[4])
  {
    uint64_t result = (*(uint64_t (**)(void *))(*v2 + 80))(v2);
    if (result == -1)
    {
      int v5 = (std::ios_base *)(*(void *)this + *(void *)(**(void **)this - 24));
      std::ios_base::clear(v5, v5->__rdstate_ | 2);
      return 0xFFFFFFFFLL;
    }
  }
  else
  {
    v2[3] = v3 + 1;
    return *v3;
  }
  return result;
}

uint64_t nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::input_stream_adapter>::get_codepoint(nlohmann::detail::input_stream_adapter *this)
{
  uint64_t v2 = 0;
  LODWORD(v3) = 0;
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  long long v8 = xmmword_1B7390150;
  while (1)
  {
    int v4 = *(_DWORD *)((char *)&v8 + v2);
    nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::input_stream_adapter>::get(this);
    int v5 = *((_DWORD *)this + 4);
    int v6 = v5 - 48;
    if ((v5 - 48) >= 0xA) {
      break;
    }
LABEL_7:
    uint64_t v3 = ((v6 << v4) + v3);
    v2 += 4;
    if (v2 == 16) {
      return v3;
    }
  }
  if ((v5 - 65) <= 5)
  {
    int v6 = v5 - 55;
    goto LABEL_7;
  }
  if ((v5 - 97) <= 5)
  {
    int v6 = v5 - 87;
    goto LABEL_7;
  }
  return 0xFFFFFFFFLL;
}

uint64_t nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::input_stream_adapter>::next_byte_in_range(std::string *a1, _DWORD *a2, uint64_t a3)
{
  int v6 = a1 + 3;
  std::string::push_back(a1 + 3, a1->__r_.__value_.__s.__data_[16]);
  if (!a3) {
    return 1;
  }
  uint64_t v7 = &a2[a3];
  while (1)
  {
    nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::input_stream_adapter>::get((nlohmann::detail::input_stream_adapter *)a1);
    int v8 = a1->__r_.__value_.__r.__words[2];
    if (*a2 > v8 || v8 > a2[1]) {
      break;
    }
    std::string::push_back(v6, v8);
    a2 += 2;
    if (a2 == v7) {
      return 1;
    }
  }
  uint64_t result = 0;
  a1[4].__r_.__value_.__r.__words[0] = (std::string::size_type)"invalid string: ill-formed UTF-8 byte";
  return result;
}

void nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::input_stream_adapter>::~lexer(void **this)
{
  if (*((char *)this + 95) < 0) {
    operator delete(this[9]);
  }
  uint64_t v2 = this[6];
  if (v2)
  {
    this[7] = v2;
    operator delete(v2);
  }
  nlohmann::detail::input_stream_adapter::~input_stream_adapter((nlohmann::detail::input_stream_adapter *)this);
}

void nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::input_stream_adapter>::get_token_string(uint64_t a1@<X0>, std::string *a2@<X8>)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  a2->__r_.__value_.__r.__words[0] = 0;
  a2->__r_.__value_.__l.__size_ = 0;
  a2->__r_.__value_.__r.__words[2] = 0;
  uint64_t v3 = *(unsigned __int8 **)(a1 + 48);
  for (int i = *(unsigned __int8 **)(a1 + 56); v3 != i; ++v3)
  {
    unsigned int v5 = *v3;
    if (v5 > 0x1F)
    {
      std::string::push_back(a2, v5);
    }
    else
    {
      char v8 = 0;
      *(void *)__str = 0;
      snprintf(__str, 9uLL, "<U+%.4X>", v5);
      std::string::size_type v6 = strlen(__str);
      std::string::append(a2, __str, v6);
    }
  }
}

void sub_1B732234C(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

void nlohmann::detail::parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::input_stream_adapter>::exception_message(uint64_t a1@<X0>, unsigned int a2@<W1>, uint64_t a3@<X2>, std::string *a4@<X8>)
{
  std::string::basic_string[abi:sn180100]<0>(&a4->__r_.__value_.__l.__data_, "syntax error ");
  uint64_t v8 = *(unsigned __int8 *)(a3 + 23);
  if ((v8 & 0x80u) != 0) {
    uint64_t v8 = *(void *)(a3 + 8);
  }
  if (v8)
  {
    std::operator+<char>();
    uint64_t v9 = std::string::append(&v38, " ", 1uLL);
    long long v10 = *(_OWORD *)&v9->__r_.__value_.__l.__data_;
    int64_t v40 = v9->__r_.__value_.__r.__words[2];
    long long v39 = v10;
    v9->__r_.__value_.__l.__size_ = 0;
    v9->__r_.__value_.__r.__words[2] = 0;
    v9->__r_.__value_.__r.__words[0] = 0;
    if (v40 >= 0) {
      char v11 = (const std::string::value_type *)&v39;
    }
    else {
      char v11 = (const std::string::value_type *)v39;
    }
    if (v40 >= 0) {
      std::string::size_type v12 = HIBYTE(v40);
    }
    else {
      std::string::size_type v12 = *((void *)&v39 + 1);
    }
    std::string::append(a4, v11, v12);
    if (SHIBYTE(v40) < 0) {
      operator delete((void *)v39);
    }
    if (SHIBYTE(v38.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v38.__r_.__value_.__l.__data_);
    }
  }
  std::string::append(a4, "- ", 2uLL);
  unsigned int v13 = *(_DWORD *)(a1 + 32);
  if (v13 == 14)
  {
    std::string::basic_string[abi:sn180100]<0>(&v36.__r_.__value_.__l.__data_, *(char **)(a1 + 136));
    long long v14 = std::string::append(&v36, "; last read: '", 0xEuLL);
    long long v15 = *(_OWORD *)&v14->__r_.__value_.__l.__data_;
    v37.__r_.__value_.__r.__words[2] = v14->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v37.__r_.__value_.__l.__data_ = v15;
    v14->__r_.__value_.__l.__size_ = 0;
    v14->__r_.__value_.__r.__words[2] = 0;
    v14->__r_.__value_.__r.__words[0] = 0;
    nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::input_stream_adapter>::get_token_string(a1 + 40, &__p);
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      p_p = &__p;
    }
    else {
      p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
    }
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      std::string::size_type size = HIBYTE(__p.__r_.__value_.__r.__words[2]);
    }
    else {
      std::string::size_type size = __p.__r_.__value_.__l.__size_;
    }
    int v18 = std::string::append(&v37, (const std::string::value_type *)p_p, size);
    long long v19 = *(_OWORD *)&v18->__r_.__value_.__l.__data_;
    v38.__r_.__value_.__r.__words[2] = v18->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v38.__r_.__value_.__l.__data_ = v19;
    v18->__r_.__value_.__l.__size_ = 0;
    v18->__r_.__value_.__r.__words[2] = 0;
    v18->__r_.__value_.__r.__words[0] = 0;
    uint64_t v20 = std::string::append(&v38, "'", 1uLL);
    long long v21 = *(_OWORD *)&v20->__r_.__value_.__l.__data_;
    int64_t v40 = v20->__r_.__value_.__r.__words[2];
    long long v39 = v21;
    v20->__r_.__value_.__l.__size_ = 0;
    v20->__r_.__value_.__r.__words[2] = 0;
    v20->__r_.__value_.__r.__words[0] = 0;
    if (v40 >= 0) {
      uint64_t v22 = (const std::string::value_type *)&v39;
    }
    else {
      uint64_t v22 = (const std::string::value_type *)v39;
    }
    if (v40 >= 0) {
      std::string::size_type v23 = HIBYTE(v40);
    }
    else {
      std::string::size_type v23 = *((void *)&v39 + 1);
    }
    std::string::append(a4, v22, v23);
    if (SHIBYTE(v40) < 0) {
      operator delete((void *)v39);
    }
    if (SHIBYTE(v38.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v38.__r_.__value_.__l.__data_);
    }
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
    if (SHIBYTE(v37.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v37.__r_.__value_.__l.__data_);
    }
    if (SHIBYTE(v36.__r_.__value_.__r.__words[2]) < 0)
    {
      int v24 = (void *)v36.__r_.__value_.__r.__words[0];
      goto LABEL_49;
    }
LABEL_46:
    if (!a2) {
      return;
    }
    goto LABEL_50;
  }
  uint64_t v25 = (char *)nlohmann::detail::lexer_base<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::token_type_name(v13);
  std::string::basic_string[abi:sn180100]<0>(&v38.__r_.__value_.__l.__data_, v25);
  uint64_t v26 = std::string::insert(&v38, 0, "unexpected ", 0xBuLL);
  long long v27 = *(_OWORD *)&v26->__r_.__value_.__l.__data_;
  int64_t v40 = v26->__r_.__value_.__r.__words[2];
  long long v39 = v27;
  v26->__r_.__value_.__l.__size_ = 0;
  v26->__r_.__value_.__r.__words[2] = 0;
  v26->__r_.__value_.__r.__words[0] = 0;
  if (v40 >= 0) {
    uint64_t v28 = (const std::string::value_type *)&v39;
  }
  else {
    uint64_t v28 = (const std::string::value_type *)v39;
  }
  if (v40 >= 0) {
    std::string::size_type v29 = HIBYTE(v40);
  }
  else {
    std::string::size_type v29 = *((void *)&v39 + 1);
  }
  std::string::append(a4, v28, v29);
  if (SHIBYTE(v40) < 0) {
    operator delete((void *)v39);
  }
  if ((SHIBYTE(v38.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
    goto LABEL_46;
  }
  int v24 = (void *)v38.__r_.__value_.__r.__words[0];
LABEL_49:
  operator delete(v24);
  if (!a2) {
    return;
  }
LABEL_50:
  long long v30 = (char *)nlohmann::detail::lexer_base<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::token_type_name(a2);
  std::string::basic_string[abi:sn180100]<0>(&v38.__r_.__value_.__l.__data_, v30);
  int64_t v31 = std::string::insert(&v38, 0, "; expected ", 0xBuLL);
  long long v32 = *(_OWORD *)&v31->__r_.__value_.__l.__data_;
  int64_t v40 = v31->__r_.__value_.__r.__words[2];
  long long v39 = v32;
  v31->__r_.__value_.__l.__size_ = 0;
  v31->__r_.__value_.__r.__words[2] = 0;
  v31->__r_.__value_.__r.__words[0] = 0;
  if (v40 >= 0) {
    std::string v33 = (const std::string::value_type *)&v39;
  }
  else {
    std::string v33 = (const std::string::value_type *)v39;
  }
  if (v40 >= 0) {
    std::string::size_type v34 = HIBYTE(v40);
  }
  else {
    std::string::size_type v34 = *((void *)&v39 + 1);
  }
  std::string::append(a4, v33, v34);
  if (SHIBYTE(v40) < 0) {
    operator delete((void *)v39);
  }
  if (SHIBYTE(v38.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v38.__r_.__value_.__l.__data_);
  }
}

void sub_1B73226B0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,void *a21,uint64_t a22,int a23,__int16 a24,char a25,char a26,uint64_t a27,void *__p,uint64_t a29,int a30,__int16 a31,char a32,char a33)
{
  if (*(char *)(v34 - 41) < 0) {
    operator delete(*(void **)(v34 - 64));
  }
  if (a33 < 0) {
    operator delete(__p);
  }
  if (a14 < 0) {
    operator delete(a9);
  }
  if (a26 < 0) {
    operator delete(a21);
  }
  if (a20 < 0) {
    operator delete(a15);
  }
  if (*(char *)(v33 + 23) < 0) {
    operator delete(*(void **)v33);
  }
  _Unwind_Resume(exception_object);
}

void nlohmann::detail::input_stream_adapter::~input_stream_adapter(nlohmann::detail::input_stream_adapter *this)
{
  if (*(void *)this) {
    std::ios_base::clear((std::ios_base *)(*(void *)this + *(void *)(**(void **)this - 24)), *(_DWORD *)(*(void *)this + *(void *)(**(void **)this - 24) + 32) & 2);
  }
}

uint64_t __Block_byref_object_copy__12(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__12(uint64_t a1)
{
}

id WBSBrowsingDataImportServiceInterface()
{
  if (WBSBrowsingDataImportServiceInterface_once != -1) {
    dispatch_once(&WBSBrowsingDataImportServiceInterface_once, &__block_literal_global_50);
  }
  id v0 = (void *)WBSBrowsingDataImportServiceInterface_interface;
  return v0;
}

void __WBSBrowsingDataImportServiceInterface_block_invoke()
{
  uint64_t v0 = WBSBrowsingDataImportServiceInterfaceWithProtocol((uint64_t)&unk_1F10905C0);
  uint64_t v1 = (void *)WBSBrowsingDataImportServiceInterface_interface;
  WBSBrowsingDataImportServiceInterface_interface = v0;
}

id WBSBrowsingDataImportServiceInterfaceWithProtocol(uint64_t a1)
{
  uint64_t v1 = [MEMORY[0x1E4F29280] interfaceWithProtocol:a1];
  uint64_t v2 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F10B6340];
  [v1 setInterface:v2 forSelector:sel_parseChromeExtensionsFromFileHandle_delegate_completionHandler_ argumentIndex:1 ofReply:0];

  uint64_t v3 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F108FA60];
  [v1 setInterface:v3 forSelector:sel_parseHistoryJSONFromFileHandle_ageLimit_delegate_completionHandler_ argumentIndex:2 ofReply:0];

  int v4 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F108DA60];
  [v1 setInterface:v4 forSelector:sel_parseCreditCardJSONFromFileHandle_delegate_completionHandler_ argumentIndex:1 ofReply:0];

  unsigned int v5 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F10B63A0];
  [v1 setInterface:v5 forSelector:sel_parseNetscapeBookmarkFromFileHandle_delegate_completionHandler_ argumentIndex:1 ofReply:0];

  std::string::size_type v6 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F10B6340];
  [v1 setInterface:v6 forSelector:sel_parseExtensionsFromFileHandle_delegate_completionHandler_ argumentIndex:1 ofReply:0];

  uint64_t v7 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F108FA60];
  [v1 setInterface:v7 forSelector:sel_parseChromeHistoryJSONFromFileHandle_ageLimit_delegate_completionHandler_ argumentIndex:2 ofReply:0];

  uint64_t v8 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v9 = objc_opt_class();
  long long v10 = objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
  [v1 setClasses:v10 forSelector:sel_scanImportURLs_sandboxExtensions_completionHandler_ argumentIndex:0 ofReply:0];

  char v11 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v12 = objc_opt_class();
  unsigned int v13 = objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
  [v1 setClasses:v13 forSelector:sel_scanImportURLs_sandboxExtensions_completionHandler_ argumentIndex:1 ofReply:0];

  long long v14 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v15 = objc_opt_class();
  uint64_t v16 = objc_opt_class();
  uint64_t v17 = objc_opt_class();
  int v18 = objc_msgSend(v14, "setWithObjects:", v15, v16, v17, objc_opt_class(), 0);
  [v1 setClasses:v18 forSelector:sel_scanImportURLs_sandboxExtensions_completionHandler_ argumentIndex:0 ofReply:1];

  return v1;
}

id getAAAccountClassPrimary()
{
  uint64_t v4 = 0;
  unsigned int v5 = &v4;
  uint64_t v6 = 0x2020000000;
  uint64_t v0 = (void **)getAAAccountClassPrimarySymbolLoc_ptr;
  uint64_t v7 = getAAAccountClassPrimarySymbolLoc_ptr;
  if (!getAAAccountClassPrimarySymbolLoc_ptr)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getAAAccountClassPrimarySymbolLoc_block_invoke;
    v3[3] = &unk_1E6159628;
    v3[4] = &v4;
    __getAAAccountClassPrimarySymbolLoc_block_invoke((uint64_t)v3);
    uint64_t v0 = (void **)v5[3];
  }
  _Block_object_dispose(&v4, 8);
  if (!v0) {
    getAAAccountClassPrimary_cold_1();
  }
  uint64_t v1 = *v0;
  return v1;
}

void sub_1B7323710(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __AccountsLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  AccountsLibraryCore_frameworkLibrary = result;
  return result;
}

uint64_t __AppleAccountLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  AppleAccountLibraryCore_frameworkLibrary = result;
  return result;
}

void *__getACAccountTypeIdentifierAppleAccountSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)AccountsLibrary();
  uint64_t result = dlsym(v2, "ACAccountTypeIdentifierAppleAccount");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getACAccountTypeIdentifierAppleAccountSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getACAccountDataclassBookmarksSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)AccountsLibrary();
  uint64_t result = dlsym(v2, "ACAccountDataclassBookmarks");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getACAccountDataclassBookmarksSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getAAAccountClassPrimarySymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v4 = 0;
  uint64_t v2 = (void *)AppleAccountLibraryCore();
  if (!v2) {
    __getAAAccountClassPrimarySymbolLoc_block_invoke_cold_1(&v4);
  }
  uint64_t result = dlsym(v2, "AAAccountClassPrimary");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAAAccountClassPrimarySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1B732493C(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_1B7324D3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__13(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__13(uint64_t a1)
{
}

void WBSPerformBlockOnMainRunLoopWithCommonModes(void *a1)
{
  id v1 = a1;
  MaiCFIndex n = CFRunLoopGetMain();
  CFRunLoopPerformBlock(Main, (CFTypeRef)*MEMORY[0x1E4F1D410], v1);

  uint64_t v3 = CFRunLoopGetMain();
  CFRunLoopWakeUp(v3);
}

void WBSRunLoopRunUntilTerminationSignal()
{
  uint64_t v0 = signal(15, (void (__cdecl *)(int))1);
  id v1 = (void *)MEMORY[0x1BA9BCF20](v0);
  CFRunLoopRef Current = CFRunLoopGetCurrent();
  uint64_t v3 = dispatch_source_create(MEMORY[0x1E4F14480], 0xFuLL, 0, MEMORY[0x1E4F14428]);
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __WBSRunLoopRunUntilTerminationSignal_block_invoke;
  handler[3] = &__block_descriptor_40_e5_v8__0l;
  handler[4] = Current;
  dispatch_source_set_event_handler(v3, handler);
  dispatch_resume(v3);
  CFRunLoopRun();
}

void __WBSRunLoopRunUntilTerminationSignal_block_invoke(uint64_t a1)
{
}

void sub_1B73260D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

__CFString *WBSStringFromCloudBookmarksAccountChangeType(uint64_t a1)
{
  id v1 = @"Added";
  if (a1 == 1) {
    id v1 = @"Deleted";
  }
  if (a1 == 2) {
    return @"Modified";
  }
  else {
    return v1;
  }
}

__CFString *WBSStringFromCloudBookmarksSyncResult(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 5) {
    return @"Success";
  }
  else {
    return off_1E615CC50[a1 - 1];
  }
}

__CFString *WBSStringFromCloudBookmarksErrorCode(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 3) {
    return @"Sync Disabled";
  }
  else {
    return off_1E615CC80[a1 - 1];
  }
}

__CFString *WBSStringFromCloudTabsErrorCode(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 2) {
    return @"Code Invalid Close Request";
  }
  else {
    return off_1E615CCA0[a1 - 1];
  }
}

__CFString *WBSStringFromCKContainerManateeState(uint64_t a1)
{
  id v1 = @"Not Determined";
  if (a1 == 1) {
    id v1 = @"Not Supported";
  }
  if (a1 == 2) {
    return @"Supported";
  }
  else {
    return v1;
  }
}

__CFString *WBSStringFromCKAccountTermsState(uint64_t a1)
{
  id v1 = @"Not Determined";
  if (a1 == 1) {
    id v1 = @"Not Verified";
  }
  if (a1 == 2) {
    return @"Verified";
  }
  else {
    return v1;
  }
}

void WBSSetEnvironmentFromContainerPath(void *a1)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  [v1 fileSystemRepresentation];
  if ((unint64_t)__strlcpy_chk() >= 0x400
    || (setenv("HOME", __value, 1), setenv("CFFIXED_USER_HOME", __value, 1), (unint64_t)__strlcat_chk() >= 0x400))
  {
    exit(1);
  }
  setenv("TMPDIR", __value, 1);
}

void sub_1B7328790(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__14(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__14(uint64_t a1)
{
}

void sub_1B7328C6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B732A30C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B732BA90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B732E8CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id __protectionSpacesString_block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [v2 port];
  uint64_t v4 = NSString;
  unsigned int v5 = [v2 protocol];
  uint64_t v6 = [v2 host];

  if (v3) {
    [v4 stringWithFormat:@"%@:%@:%ld", v5, v6, v3];
  }
  else {
  uint64_t v7 = [v4 stringWithFormat:@"%@:%@", v5, v6, v9];
  }

  return v7;
}

void __setOfHighLevelDomainsWhereFullDomainIsPreferableToHighLevelDomainForDisplayToUser_block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F1CAD0] setWithArray:&unk_1F1086D38];
  id v1 = (void *)setOfHighLevelDomainsWhereFullDomainIsPreferableToHighLevelDomainForDisplayToUser_set;
  setOfHighLevelDomainsWhereFullDomainIsPreferableToHighLevelDomainForDisplayToUser_set = v0;
}

void sub_1B7331600(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

__CFString *WBSStringFromSidecarType(uint64_t a1)
{
  if (a1) {
    return @"shared";
  }
  else {
    return @"personal";
  }
}

uint64_t __Block_byref_object_copy__15(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__15(uint64_t a1)
{
}

void sub_1B73356F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B7336CBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B733900C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B7339218(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B733A0C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B733F200(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1B733FA90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B733FF5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B7341200(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B7344CF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B73451D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B7345B54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B7347158(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __setOfUninterestingSubdomains_block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F1CAD0] setWithArray:&unk_1F1086D50];
  id v1 = (void *)setOfUninterestingSubdomains_set;
  setOfUninterestingSubdomains_set = v0;
}

void __numberedSubdomainRegexp_block_invoke()
{
  uint64_t v0 = [objc_alloc(MEMORY[0x1E4F28FD8]) initWithPattern:@"(www\\d+|\\d+web)" options:0 error:0];
  id v1 = (void *)numberedSubdomainRegexp_regexp;
  numberedSubdomainRegexp_regexp = v0;
}

void OUTLINED_FUNCTION_12_0(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_error_impl(a1, v5, OS_LOG_TYPE_ERROR, a4, v4, 0xCu);
}

id deepMutableDictionaryCopy(void *a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  id v2 = (void *)[v1 mutableCopy];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v3 = v1;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        uint64_t v9 = objc_msgSend(v3, "objectForKeyedSubscript:", v8, (void)v13);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v10 = deepMutableDictionaryCopy(v9);
LABEL_10:
          char v11 = (void *)v10;
          [v2 setObject:v10 forKeyedSubscript:v8];

          goto LABEL_12;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v10 = [v9 mutableCopy];
          goto LABEL_10;
        }
        [v2 setObject:v9 forKeyedSubscript:v8];
LABEL_12:
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v5);
  }

  return v2;
}

void sub_1B7348F50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

unint64_t WBSTimeIntervalToUnixTimeInMicroseconds(double a1)
{
  return (unint64_t)((*MEMORY[0x1E4F1CF78] + a1) * 1000000.0);
}

double WBSUnixTimeInMicrosecondsToTimeInterval(unint64_t a1)
{
  return (double)a1 / 1000000.0 - *MEMORY[0x1E4F1CF78];
}

id WBSCreateExportMetadataDictionary(void *a1, uint64_t a2)
{
  void v19[3] = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  uint64_t v4 = (void *)MEMORY[0x1E4F1CA60];
  v18[0] = @"export_time_usec";
  uint64_t v5 = [NSNumber numberWithUnsignedLongLong:(unint64_t)((CFAbsoluteTimeGetCurrent() + *MEMORY[0x1E4F1CF78]) * 1000000.0)];
  v19[0] = v5;
  v19[1] = v3;
  v18[1] = @"data_type";
  v18[2] = @"schema_version";
  uint64_t v6 = [NSNumber numberWithUnsignedInteger:a2];
  v19[2] = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:3];
  uint64_t v8 = [v4 dictionaryWithDictionary:v7];

  uint64_t v9 = objc_msgSend(MEMORY[0x1E4F28B50], "safari_safariApplicationPlatformBundleIdentifier");
  uint64_t v10 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:v9];
  char v11 = v10;
  if (v10)
  {
    uint64_t v12 = objc_msgSend(v10, "safari_displayName");
    [v8 setObject:v12 forKeyedSubscript:@"browser_name"];

    long long v13 = objc_msgSend(v11, "safari_shortVersion");
    [v8 setObject:v13 forKeyedSubscript:@"browser_version"];
  }
  else
  {
    long long v13 = (void *)[objc_alloc(MEMORY[0x1E4F223C8]) initWithBundleIdentifier:v9 allowPlaceholder:0 error:0];
    long long v14 = [v13 localizedNameWithPreferredLocalizations:&unk_1F1086D68];
    [v8 setObject:v14 forKeyedSubscript:@"browser_name"];

    long long v15 = [v13 shortVersionString];
    [v8 setObject:v15 forKeyedSubscript:@"browser_version"];
  }
  long long v16 = (void *)[v8 copy];

  return v16;
}

id WBSLoadMetadataDictionaryFromURL(uint64_t a1, void *a2)
{
  id v3 = [MEMORY[0x1E4F28CB0] fileHandleForReadingFromURL:a1 error:a2];
  uint64_t v4 = v3;
  if (v3)
  {
    uint64_t v5 = WBSLoadMetadataDictionaryFromFileHandle(v3, a2);
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

id WBSLoadMetadataDictionaryFromFileHandle(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v4 = objc_alloc_init(WBSJSONReader);
  uint64_t v5 = objc_alloc_init(WBSMetadataDictionaryReaderDelegate);
  [(WBSJSONReader *)v4 setDelegate:v5];
  BOOL v6 = [(WBSJSONReader *)v4 parseFileHandle:v3 error:a2];

  if (!v6)
  {
LABEL_5:
    uint64_t v8 = 0;
    goto LABEL_6;
  }
  uint64_t v7 = [(WBSMetadataDictionaryReaderDelegate *)v5 error];

  if (v7)
  {
    if (a2)
    {
      [(WBSMetadataDictionaryReaderDelegate *)v5 error];
      uint64_t v8 = 0;
      *a2 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  uint64_t v10 = [(WBSMetadataDictionaryReaderDelegate *)v5 metadataDictionary];
  uint64_t v8 = (void *)[v10 count];

  if (v8)
  {
    uint64_t v8 = [(WBSMetadataDictionaryReaderDelegate *)v5 metadataDictionary];
  }
LABEL_6:

  return v8;
}

void sub_1B734ABBC(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

Class __getDSArchiveServiceClass_block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!DesktopServicesPrivLibraryCore_frameworkLibrary)
  {
    v3[1] = (void *)MEMORY[0x1E4F143A8];
    v3[2] = (void *)3221225472;
    v3[3] = __DesktopServicesPrivLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_1E615DC98;
    uint64_t v5 = 0;
    DesktopServicesPrivLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!DesktopServicesPrivLibraryCore_frameworkLibrary) {
    __getDSArchiveServiceClass_block_invoke_cold_1(v3);
  }
  if (v3[0]) {
    free(v3[0]);
  }
  Class result = objc_getClass("DSArchiveService");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getDSArchiveServiceClass_block_invoke_cold_2();
  }
  getDSArchiveServiceClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __DesktopServicesPrivLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  DesktopServicesPrivLibraryCore_frameworkLibrary = result;
  return result;
}

void sub_1B734BE80(_Unwind_Exception *a1)
{
  uint64_t v6 = v5;

  _Unwind_Resume(a1);
}

__CFString *errorStringForCode(int a1)
{
  if (a1 == 101)
  {
    id v3 = @"Statement returned nothing";
  }
  else if (a1 == 100)
  {
    id v3 = @"Statement returned more rows than expected";
  }
  else
  {
    id v3 = (__CFString *)sqlite3_errstr(a1);
    if (v3)
    {
      objc_msgSend(NSString, "stringWithUTF8String:", v3, v1);
      id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  return v3;
}

void sub_1B734C054(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B734C138(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B734C308(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B734C458(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B734C56C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1B734C660(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B734C7C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B734C8A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B734C94C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B734C9E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B734CC34(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B734CEFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1B734D068(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B734D1F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B734D2EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B734D3BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B734D4EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B734D600(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void ___ZL35temporarilyDisableSuddenTerminationv_block_invoke()
{
  os_unfair_lock_lock((os_unfair_lock_t)&suddenTerminationDisablerLock);
  if (suddenTerminationDisabler)
  {
    SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler((id *)suddenTerminationDisabler);
    MEMORY[0x1BA9BC7E0]();
  }
  suddenTerminationDisabler = 0;
  dispatch_source_cancel((dispatch_source_t)suddenTerminationDisablerDispatchSource);
  uint64_t v0 = (void *)suddenTerminationDisablerDispatchSource;
  suddenTerminationDisablerDispatchSource = 0;

  os_unfair_lock_unlock((os_unfair_lock_t)&suddenTerminationDisablerLock);
}

void OUTLINED_FUNCTION_1_3(void *a1@<X0>, const char *a2@<X3>, uint8_t *a3@<X4>, NSObject *a4@<X8>)
{
  _os_log_debug_impl(a1, a4, OS_LOG_TYPE_DEBUG, a2, a3, 0x12u);
}

void sub_1B734D7F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B734D8EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)WBSSQLiteStore;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_1B734DA18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  objc_destroyWeak(v15);
  _Unwind_Resume(a1);
}

void sub_1B734DB1C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B734DC0C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B734DEE4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B734E028(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t OUTLINED_FUNCTION_1_4(uint64_t result, uint64_t a2, uint64_t a3, float a4)
{
  *(float *)a3 = a4;
  *(void *)(a3 + 4) = result;
  *(_WORD *)(a3 + 12) = 2114;
  *(void *)(a3 + 14) = a2;
  return result;
}

void OUTLINED_FUNCTION_2_1(void *a1@<X0>, const char *a2@<X3>, uint8_t *a3@<X4>, NSObject *a4@<X8>)
{
  _os_log_error_impl(a1, a4, OS_LOG_TYPE_ERROR, a2, a3, 0x12u);
}

void SafariShared::SuddenTerminationDisabler::invalidateTask(SafariShared::SuddenTerminationDisabler *this)
{
  if (SafariShared::invalidTaskIdentifier(void)::once != -1) {
    dispatch_once(&SafariShared::invalidTaskIdentifier(void)::once, &__block_literal_global_10_1);
  }
  *(void *)this = SafariShared::invalidTaskIdentifier(void)::identifer;
}

BOOL SafariShared::SuddenTerminationDisabler::isTaskInvalid(SafariShared::SuddenTerminationDisabler *this)
{
  uint64_t v1 = *(void *)this;
  if (SafariShared::invalidTaskIdentifier(void)::once != -1) {
    dispatch_once(&SafariShared::invalidTaskIdentifier(void)::once, &__block_literal_global_10_1);
  }
  return v1 == SafariShared::invalidTaskIdentifier(void)::identifer;
}

void *SafariShared::SuddenTerminationDisabler::setTaskIdentifier(void *this, uint64_t a2)
{
  *this = a2;
  return this;
}

void ___ZN12SafariShared25SuddenTerminationDisabler28disableSuddenTerminationTaskEv_block_invoke_5(SafariShared *a1)
{
  uint64_t v1 = SafariShared::coalescingBackgroundTaskAssertionQueue(a1);
  dispatch_sync(v1, &__block_literal_global_7_0);
}

void ___ZN12SafariShared25SuddenTerminationDisabler28disableSuddenTerminationTaskEv_block_invoke_2()
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v0 = SafariShared::coalescingBackgroundTaskIdentifier;
  if (SafariShared::invalidTaskIdentifier(void)::once != -1) {
    dispatch_once(&SafariShared::invalidTaskIdentifier(void)::once, &__block_literal_global_10_1);
  }
  if (v0 == SafariShared::invalidTaskIdentifier(void)::identifer)
  {
    uint64_t v1 = WBS_LOG_CHANNEL_PREFIXSuddenTerminationDisabler();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_INFO))
    {
      LOWORD(v12) = 0;
      _os_log_impl(&dword_1B728F000, v1, OS_LOG_TYPE_INFO, "Background task assertion was released by a prior item in the queue", (uint8_t *)&v12, 2u);
    }
  }
  else
  {
    uint64_t v2 = [MEMORY[0x1E4F28BD0] set];
    {
      id v3 = (uint64_t *)SafariShared::coalescedDisablers(void)::set;
      if ((uint64_t *)SafariShared::coalescedDisablers(void)::set != &qword_1EB5B6030)
      {
        do
        {
          uint64_t v4 = v3[4];
          id v5 = *(id *)(v4 + 16);
          [v2 addObject:v5];

          if (SafariShared::invalidTaskIdentifier(void)::once != -1) {
            dispatch_once(&SafariShared::invalidTaskIdentifier(void)::once, &__block_literal_global_10_1);
          }
          *(void *)uint64_t v4 = SafariShared::invalidTaskIdentifier(void)::identifer;
          uint64_t v6 = (uint64_t *)v3[1];
          if (v6)
          {
            do
            {
              uint64_t v7 = v6;
              uint64_t v6 = (uint64_t *)*v6;
            }
            while (v6);
          }
          else
          {
            do
            {
              uint64_t v7 = (uint64_t *)v3[2];
              BOOL v8 = *v7 == (void)v3;
              id v3 = v7;
            }
            while (!v8);
          }
          id v3 = v7;
        }
        while (v7 != &qword_1EB5B6030);
      }
    }
    else
    {
      qword_1EB5B6038 = 0;
      qword_1EB5B6030 = 0;
      SafariShared::coalescedDisablers(void)::set = (uint64_t)&qword_1EB5B6030;
    }
    std::__tree<SafariShared::SuddenTerminationDisabler *>::destroy((uint64_t)&SafariShared::coalescedDisablers(void)::set, (void *)qword_1EB5B6030);
    SafariShared::coalescedDisablers(void)::set = (uint64_t)&qword_1EB5B6030;
    qword_1EB5B6038 = 0;
    qword_1EB5B6030 = 0;
    uint64_t v9 = WBS_LOG_CHANNEL_PREFIXSuddenTerminationDisabler();
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    if (v10)
    {
      int v12 = 138543362;
      long long v13 = v2;
      _os_log_impl(&dword_1B728F000, v9, OS_LOG_TYPE_DEFAULT, "Background task assertion expired while performing reasons: %{public}@", (uint8_t *)&v12, 0xCu);
    }
    char v11 = SafariShared::sharedApplication((SafariShared *)v10);
    [v11 endBackgroundTask:SafariShared::coalescingBackgroundTaskIdentifier];

    if (SafariShared::invalidTaskIdentifier(void)::once != -1) {
      dispatch_once(&SafariShared::invalidTaskIdentifier(void)::once, &__block_literal_global_10_1);
    }
    SafariShared::coalescingBackgroundTaskIdentifier = SafariShared::invalidTaskIdentifier(void)::identifer;
  }
}

void sub_1B734E49C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void std::__tree<SafariShared::SuddenTerminationDisabler *>::destroy(uint64_t a1, void *a2)
{
  if (a2)
  {
    std::__tree<SafariShared::SuddenTerminationDisabler *>::destroy(a1, *a2);
    std::__tree<SafariShared::SuddenTerminationDisabler *>::destroy(a1, a2[1]);
    operator delete(a2);
  }
}

uint64_t __Block_byref_object_copy__16(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__16(uint64_t a1)
{
}

void WBSDispatchAsyncAndReleaseOnMainQueue(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v4 = (void *)[a2 copy];
  v6[0] = 0;
  v6[1] = v6;
  void v6[2] = 0x3032000000;
  void v6[3] = __Block_byref_object_copy__17;
  v6[4] = __Block_byref_object_dispose__17;
  id v7 = _Block_copy(v4);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __WBSDispatchAsyncAndReleaseOnMainQueue_block_invoke;
  block[3] = &unk_1E6159628;
  void block[4] = v6;
  dispatch_async(v3, block);

  _Block_object_dispose(v6, 8);
}

void *__Block_byref_object_copy__17(uint64_t a1, uint64_t a2)
{
  uint64_t result = _Block_copy(*(const void **)(a2 + 40));
  *(void *)(a1 + 40) = result;
  return result;
}

void __Block_byref_object_dispose__17(uint64_t a1)
{
}

void __WBSDispatchAsyncAndReleaseOnMainQueue_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void (**)(void))_Block_copy(*(const void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40));
  id v6 = v2;
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = 0;

  v2[2](v2);
  WBSReleaseOnMainQueueImpl((const void **)&v6);
  id v5 = v6;
}

void sub_1B7351FC4(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  WBSReleaseOnMainQueueImpl((const void **)va);
  _Unwind_Resume(a1);
}

void WBSPrintf(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9 = (objc_class *)NSString;
  id v10 = a1;
  char v11 = (void *)[[v9 alloc] initWithFormat:v10 arguments:&a9];

  id v12 = v11;
  printf("%s", (const char *)[v12 UTF8String]);
}

void WBSDPrintf(int a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v10 = (objc_class *)NSString;
  id v11 = a2;
  id v12 = (void *)[[v10 alloc] initWithFormat:v11 arguments:&a9];

  id v13 = v12;
  dprintf(a1, "%s", (const char *)[v13 UTF8String]);
}

unint64_t WBSRangeEnumerateIndexesUsingBlock(unint64_t result, uint64_t a2, uint64_t a3)
{
  if (result < result + a2)
  {
    uint64_t v10 = v3;
    uint64_t v11 = v4;
    unint64_t v6 = result;
    uint64_t v7 = a2 - 1;
    do
    {
      char v9 = 0;
      uint64_t result = (*(uint64_t (**)(uint64_t, unint64_t, char *))(a3 + 16))(a3, v6++, &v9);
      if (v9) {
        BOOL v8 = 1;
      }
      else {
        BOOL v8 = v7 == 0;
      }
      --v7;
    }
    while (!v8);
  }
  return result;
}

void WBSSetSignalHandler(void *a1, void *a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a1;
  unint64_t v6 = a2;
  id v7 = a3;
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  obCFIndex j = v5;
  uint64_t v9 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v21;
    id v12 = (const dispatch_source_type_s *)MEMORY[0x1E4F14480];
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v21 != v11) {
          objc_enumerationMutation(obj);
        }
        int v14 = [*(id *)(*((void *)&v20 + 1) + 8 * v13) intValue];
        long long v15 = dispatch_source_create(v12, v14, 0, v6);
        dispatch_source_set_event_handler(v15, v7);
        dispatch_resume(v15);
        [v8 addObject:v15];
        v19.__sigaction_u.__sa_handler = (void (__cdecl *)(int))1;
        *(void *)&v19.sa_masCFIndex k = 0;
        sigaction(v14, &v19, 0);

        ++v13;
      }
      while (v10 != v13);
      uint64_t v10 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v10);
  }

  uint64_t v16 = [v8 copy];
  uint64_t v17 = (void *)WBSSetSignalHandler_immortalDispatchSources;
  WBSSetSignalHandler_immortalDispatchSources = v16;
}

id sub_1B7352738()
{
  id result = objc_msgSend(objc_allocWithZone((Class)WBSPasswordsNotificationManager), sel_initIfAvailable);
  qword_1E9E58F18 = (uint64_t)result;
  return result;
}

id sub_1B7352810()
{
  if (MEMORY[0x1E4F44678]) {
    return objc_msgSend(v0, sel_init);
  }
  if (qword_1E9E58F28 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_1B7383E40();
  __swift_project_value_buffer(v2, (uint64_t)qword_1E9E5B9C0);
  uint64_t v3 = sub_1B7383E10();
  os_log_type_t v4 = sub_1B73841B0();
  if (os_log_type_enabled(v3, v4))
  {
    id v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_1B728F000, v3, v4, "Passwords notifications are unavailable because UserNotifications.framework is not present", v5, 2u);
    MEMORY[0x1BA9BDB10](v5, -1, -1);
  }

  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return 0;
}

char *sub_1B7352950()
{
  swift_unknownObjectWeakInit();
  uint64_t v1 = self;
  uint64_t v2 = v0;
  id v3 = objc_msgSend(v1, sel_mainBundle);
  LODWORD(v1) = objc_msgSend(v3, sel_safari_isPasswordsAppBundle);

  if (v1)
  {
    id v4 = objc_msgSend(self, sel_currentNotificationCenter);
  }
  else
  {
    sub_1B7383FC0();
    id v5 = objc_allocWithZone(MEMORY[0x1E4F44678]);
    unint64_t v6 = (void *)sub_1B7383FA0();
    swift_bridgeObjectRelease();
    id v4 = objc_msgSend(v5, sel_initWithBundleIdentifier_, v6);
  }
  *(void *)&v2[OBJC_IVAR___WBSPasswordsNotificationManager_userNotificationCenter] = v4;

  v11.receiver = v2;
  v11.super_class = (Class)WBSPasswordsNotificationManager;
  id v7 = (char *)objc_msgSendSuper2(&v11, sel_init);
  id v8 = *(void **)&v7[OBJC_IVAR___WBSPasswordsNotificationManager_userNotificationCenter];
  uint64_t v9 = v7;
  objc_msgSend(v8, sel_setDelegate_, v9);
  sub_1B7352AC4();

  return v9;
}

void sub_1B7352AC4()
{
  v32[1] = (id)MEMORY[0x1E4FBC870];
  uint64_t v0 = (void *)sub_1B7383FA0();
  sub_1B729E55C(0, &qword_1E9E59140);
  uint64_t v1 = (void *)sub_1B7384130();
  uint64_t v2 = (void *)sub_1B7384130();
  id v3 = self;
  id v4 = objc_msgSend(v3, sel_categoryWithIdentifier_actions_intentIdentifiers_options_, v0, v1, v2, 0);

  sub_1B7356C04(v32, v4);
  id v5 = (void *)sub_1B7383FA0();
  unint64_t v6 = (void *)sub_1B7384130();
  id v7 = (void *)sub_1B7384130();
  id v8 = objc_msgSend(v3, sel_categoryWithIdentifier_actions_intentIdentifiers_options_, v5, v6, v7, 0);

  sub_1B7356C04(v32, v8);
  uint64_t v9 = (void *)sub_1B7383FA0();
  uint64_t v10 = (void *)sub_1B7384130();
  objc_super v11 = (void *)sub_1B7384130();
  id v12 = objc_msgSend(v3, sel_categoryWithIdentifier_actions_intentIdentifiers_options_, v9, v10, v11, 0);

  sub_1B7356C04(v32, v12);
  uint64_t v13 = (void *)sub_1B7383FA0();
  int v14 = (void *)sub_1B7384130();
  long long v15 = (void *)sub_1B7384130();
  id v16 = objc_msgSend(v3, sel_categoryWithIdentifier_actions_intentIdentifiers_options_, v13, v14, v15, 0);

  sub_1B7356C04(v32, v16);
  sub_1B7383FC0();
  uint64_t v17 = (void *)sub_1B7383FA0();
  uint64_t v18 = (void *)sub_1B7384130();
  sigaction v19 = (void *)sub_1B7384130();
  id v20 = objc_msgSend(v3, sel_categoryWithIdentifier_actions_intentIdentifiers_options_, v17, v18, v19, 0);
  swift_bridgeObjectRelease();

  sub_1B7356C04(v32, v20);
  sub_1B7383FC0();
  long long v21 = (void *)sub_1B7383FA0();
  long long v22 = (void *)sub_1B7384130();
  long long v23 = (void *)sub_1B7384130();
  id v24 = objc_msgSend(v3, sel_categoryWithIdentifier_actions_intentIdentifiers_options_, v21, v22, v23, 0);
  swift_bridgeObjectRelease();

  sub_1B7356C04(v32, v24);
  uint64_t v25 = (void *)sub_1B7383FA0();
  uint64_t v26 = (void *)sub_1B7384130();
  long long v27 = (void *)sub_1B7384130();
  id v28 = objc_msgSend(v3, sel_categoryWithIdentifier_actions_intentIdentifiers_options_, v25, v26, v27, 0);

  sub_1B7356C04(v32, v28);
  std::string::size_type v29 = *(void **)&v30[OBJC_IVAR___WBSPasswordsNotificationManager_userNotificationCenter];
  sub_1B729E55C(0, &qword_1E9E59148);
  sub_1B735B8B0();
  id v31 = (id)sub_1B7384190();
  swift_bridgeObjectRelease();
  objc_msgSend(v29, sel_setNotificationCategories_, v31);
}

void sub_1B7352FD8(uint64_t a1, void *a2)
{
  id v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

void sub_1B735317C(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  swift_retain();
  id v6 = a3;
  v5(a2, a3);
  swift_release();
}

void sub_1B7353320(char a1, uint64_t a2, uint64_t a3)
{
  if (a2) {
    uint64_t v5 = sub_1B7383C30();
  }
  else {
    uint64_t v5 = 0;
  }
  id v6 = (id)v5;
  (*(void (**)(uint64_t, void))(a3 + 16))(a3, a1 & 1);
}

uint64_t sub_1B7353390(uint64_t a1)
{
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = v1;
  return MEMORY[0x1F4188298](sub_1B73533B0, 0, 0);
}

uint64_t sub_1B73533B0()
{
  id v1 = sub_1B735996C(*(void **)(v0 + 16));
  uint64_t v2 = (void *)sub_1B7383FA0();
  id v3 = objc_msgSend(self, sel_requestWithIdentifier_content_trigger_, v2, v1, 0);
  *(void *)(v0 + 32) = v3;

  uint64_t v4 = swift_task_alloc();
  *(void *)(v0 + 40) = v4;
  *(void *)uint64_t v4 = v0;
  *(void *)(v4 + 8) = sub_1B73534D4;
  uint64_t v5 = *(void *)(v0 + 24);
  *(unsigned char *)(v4 + 304) = 1;
  *(void *)(v4 + 256) = v3;
  *(void *)(v4 + 264) = v5;
  return MEMORY[0x1F4188298](sub_1B7353758, 0, 0);
}

uint64_t sub_1B73534D4()
{
  uint64_t v2 = *v1;
  *(void *)(v2 + 48) = v0;
  swift_task_dealloc();
  if (v0)
  {
    return MEMORY[0x1F4188298](sub_1B7353610, 0, 0);
  }
  else
  {

    id v3 = *(uint64_t (**)(void))(v2 + 8);
    return v3();
  }
}

uint64_t sub_1B7353610()
{
  if (qword_1E9E58F28 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_1B7383E40();
  __swift_project_value_buffer(v1, (uint64_t)qword_1E9E5B9C0);
  uint64_t v2 = sub_1B7383E10();
  os_log_type_t v3 = sub_1B73841C0();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_1B728F000, v2, v3, "Unable to schedule Password Saved notification", v4, 2u);
    MEMORY[0x1BA9BDB10](v4, -1, -1);
  }

  uint64_t v5 = *(uint64_t (**)(void))(v0 + 8);
  return v5();
}

uint64_t sub_1B7353734(uint64_t a1, char a2)
{
  *(unsigned char *)(v3 + 304) = a2;
  *(void *)(v3 + 256) = a1;
  *(void *)(v3 + 264) = v2;
  return MEMORY[0x1F4188298](sub_1B7353758, 0, 0);
}

uint64_t sub_1B7353758()
{
  uint64_t v1 = *(void **)(v0[33] + OBJC_IVAR___WBSPasswordsNotificationManager_userNotificationCenter);
  v0[34] = v1;
  v0[10] = v0;
  v0[15] = v0 + 31;
  v0[11] = sub_1B7353864;
  uint64_t v2 = swift_continuation_init();
  v0[26] = MEMORY[0x1E4F143A8];
  v0[27] = 0x40000000;
  v0[28] = sub_1B73561B0;
  v0[29] = &block_descriptor_37;
  v0[30] = v2;
  objc_msgSend(v1, sel_getNotificationSettingsWithCompletionHandler_, v0 + 26);
  return MEMORY[0x1F41881E8](v0 + 10);
}

uint64_t sub_1B7353864()
{
  return MEMORY[0x1F4188298](sub_1B7353944, 0, 0);
}

uint64_t sub_1B7353944()
{
  uint64_t v19 = v0;
  uint64_t v1 = *(NSObject **)(v0 + 248);
  *(void *)(v0 + 280) = v1;
  uint64_t v2 = (char *)[v1 authorizationStatus];
  if ((unint64_t)(v2 - 2) < 3) {
    goto LABEL_2;
  }
  if (v2 == (char *)1) {
    goto LABEL_16;
  }
  if (!v2)
  {
    if (*(unsigned char *)(v0 + 304) == 1 && ![v1 authorizationStatus])
    {
      uint64_t v3 = v0 + 144;
      uint64_t v7 = *(void **)(v0 + 264);
      *(void *)(v0 + 144) = v0;
      *(void *)(v0 + 184) = v0 + 248;
      *(void *)(v0 + 152) = sub_1B7353D18;
      uint64_t v8 = swift_continuation_init();
      *(void *)(v0 + 208) = MEMORY[0x1E4F143A8];
      *(void *)(v0 + 216) = 0x40000000;
      *(void *)(v0 + 224) = sub_1B7356204;
      *(void *)(v0 + 232) = &block_descriptor_40;
      *(void *)(v0 + 240) = v8;
      objc_msgSend(v7, sel_requestPermissionToSendNotificationsProvisionally_withCompletionHandler_, 1, v0 + 208);
      goto LABEL_3;
    }
LABEL_2:
    uint64_t v3 = v0 + 16;
    uint64_t v4 = *(void **)(v0 + 272);
    uint64_t v5 = *(void *)(v0 + 256);
    *(void *)(v0 + 16) = v0;
    *(void *)(v0 + 24) = sub_1B7353F6C;
    uint64_t v6 = swift_continuation_init();
    *(void *)(v0 + 208) = MEMORY[0x1E4F143A8];
    *(void *)(v0 + 216) = 0x40000000;
    *(void *)(v0 + 224) = sub_1B73562B8;
    *(void *)(v0 + 232) = &block_descriptor_38;
    *(void *)(v0 + 240) = v6;
    objc_msgSend(v4, sel_addNotificationRequest_withCompletionHandler_, v5, v0 + 208);
LABEL_3:
    return MEMORY[0x1F41881E8](v3);
  }
  if (qword_1E9E58F28 != -1) {
    swift_once();
  }
  uint64_t v9 = sub_1B7383E40();
  __swift_project_value_buffer(v9, (uint64_t)qword_1E9E5B9C0);
  uint64_t v10 = v1;
  uint64_t v1 = sub_1B7383E10();
  os_log_type_t v11 = sub_1B73841C0();
  if (!os_log_type_enabled(v1, v11))
  {

LABEL_16:
    goto LABEL_17;
  }
  id v12 = (uint8_t *)swift_slowAlloc();
  uint64_t v13 = swift_slowAlloc();
  uint64_t v18 = v13;
  *(_DWORD *)id v12 = 136315138;
  *(void *)(v0 + 208) = [v10 authorizationStatus];
  type metadata accessor for UNAuthorizationStatus(0);
  uint64_t v14 = sub_1B7384010();
  *(void *)(v0 + 208) = sub_1B7367544(v14, v15, &v18);
  sub_1B7384250();
  swift_bridgeObjectRelease();

  _os_log_impl(&dword_1B728F000, v1, v11, "Received unknown notification authorization status: %s", v12, 0xCu);
  swift_arrayDestroy();
  MEMORY[0x1BA9BDB10](v13, -1, -1);
  MEMORY[0x1BA9BDB10](v12, -1, -1);

LABEL_17:
  id v16 = *(uint64_t (**)(void))(v0 + 8);
  return v16();
}

uint64_t sub_1B7353D18()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 176);
  *(void *)(*(void *)v0 + 288) = v1;
  if (v1) {
    uint64_t v2 = sub_1B73540E0;
  }
  else {
    uint64_t v2 = sub_1B7353E28;
  }
  return MEMORY[0x1F4188298](v2, 0, 0);
}

uint64_t sub_1B7353E28()
{
  if (*(unsigned char *)(v0 + 248))
  {
    uint64_t v1 = *(void **)(v0 + 272);
    uint64_t v2 = *(void *)(v0 + 256);
    *(void *)(v0 + 16) = v0;
    *(void *)(v0 + 24) = sub_1B7353F6C;
    uint64_t v3 = swift_continuation_init();
    *(void *)(v0 + 208) = MEMORY[0x1E4F143A8];
    *(void *)(v0 + 216) = 0x40000000;
    *(void *)(v0 + 224) = sub_1B73562B8;
    *(void *)(v0 + 232) = &block_descriptor_38;
    *(void *)(v0 + 240) = v3;
    objc_msgSend(v1, sel_addNotificationRequest_withCompletionHandler_, v2, v0 + 208);
    return MEMORY[0x1F41881E8](v0 + 16);
  }
  else
  {

    uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
    return v4();
  }
}

uint64_t sub_1B7353F6C()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 296) = v1;
  if (v1) {
    uint64_t v2 = sub_1B7354150;
  }
  else {
    uint64_t v2 = sub_1B735407C;
  }
  return MEMORY[0x1F4188298](v2, 0, 0);
}

uint64_t sub_1B735407C()
{
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_1B73540E0()
{
  uint64_t v1 = *(void **)(v0 + 280);
  swift_willThrow();

  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_1B7354150()
{
  uint64_t v1 = *(void **)(v0 + 280);
  swift_willThrow();

  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_1B7354340(void *a1, void *aBlock, void *a3)
{
  v3[2] = a1;
  v3[3] = a3;
  v3[4] = _Block_copy(aBlock);
  id v6 = a1;
  id v7 = a3;
  uint64_t v8 = (void *)swift_task_alloc();
  void v3[5] = v8;
  *uint64_t v8 = v3;
  void v8[2] = v6;
  v8[3] = v7;
  v8[1] = sub_1B735441C;
  return MEMORY[0x1F4188298](sub_1B73533B0, 0, 0);
}

uint64_t sub_1B735441C()
{
  uint64_t v1 = *(void (***)(void))(*v0 + 32);
  uint64_t v2 = *(void **)(*v0 + 24);
  uint64_t v3 = *(void **)(*v0 + 16);
  uint64_t v6 = *v0;
  swift_task_dealloc();

  v1[2](v1);
  _Block_release(v1);
  uint64_t v4 = *(uint64_t (**)(void))(v6 + 8);
  return v4();
}

uint64_t sub_1B7354574(uint64_t a1)
{
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = v1;
  return MEMORY[0x1F4188298](sub_1B7354594, 0, 0);
}

uint64_t sub_1B7354594()
{
  id v1 = sub_1B7359E20(*(void **)(v0 + 16));
  uint64_t v2 = (void *)sub_1B7383FA0();
  id v3 = objc_msgSend(self, sel_requestWithIdentifier_content_trigger_, v2, v1, 0);
  *(void *)(v0 + 32) = v3;

  uint64_t v4 = swift_task_alloc();
  *(void *)(v0 + 40) = v4;
  *(void *)uint64_t v4 = v0;
  *(void *)(v4 + 8) = sub_1B73546B8;
  uint64_t v5 = *(void *)(v0 + 24);
  *(unsigned char *)(v4 + 304) = 1;
  *(void *)(v4 + 256) = v3;
  *(void *)(v4 + 264) = v5;
  return MEMORY[0x1F4188298](sub_1B7353758, 0, 0);
}

uint64_t sub_1B73546B8()
{
  uint64_t v2 = *v1;
  *(void *)(v2 + 48) = v0;
  swift_task_dealloc();
  if (v0)
  {
    return MEMORY[0x1F4188298](sub_1B73547F4, 0, 0);
  }
  else
  {

    id v3 = *(uint64_t (**)(void))(v2 + 8);
    return v3();
  }
}

uint64_t sub_1B73547F4()
{
  if (qword_1E9E58F28 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_1B7383E40();
  __swift_project_value_buffer(v1, (uint64_t)qword_1E9E5B9C0);
  uint64_t v2 = sub_1B7383E10();
  os_log_type_t v3 = sub_1B73841C0();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_1B728F000, v2, v3, "Unable to schedule Password Updated notification", v4, 2u);
    MEMORY[0x1BA9BDB10](v4, -1, -1);
  }

  uint64_t v5 = *(uint64_t (**)(void))(v0 + 8);
  return v5();
}

uint64_t sub_1B7354A94(void *a1, void *aBlock, void *a3)
{
  v3[2] = a1;
  v3[3] = a3;
  v3[4] = _Block_copy(aBlock);
  id v6 = a1;
  id v7 = a3;
  uint64_t v8 = (void *)swift_task_alloc();
  void v3[5] = v8;
  *uint64_t v8 = v3;
  void v8[2] = v6;
  v8[3] = v7;
  v8[1] = sub_1B735B9B8;
  return MEMORY[0x1F4188298](sub_1B7354594, 0, 0);
}

uint64_t sub_1B7354B70()
{
  *(void *)(v1 + 16) = v0;
  return MEMORY[0x1F4188298](sub_1B7354B90, 0, 0);
}

uint64_t sub_1B7354B90()
{
  uint64_t v1 = self;
  v0[3] = v1;
  id v2 = objc_msgSend(v1, sel_pm_defaults);
  v0[4] = @"hasSentTakeATourNotification";
  unsigned __int8 v3 = objc_msgSend(v2, sel_safari_BOOLForKey_defaultValue_);

  if ((v3 & 1) != 0
    || (id v4 = objc_msgSend(v1, sel_pm_defaults),
        unsigned int v5 = objc_msgSend(v4, sel_safari_BOOLForKey_defaultValue_, @"shouldShowAppOnboardingView", 1), v4, !v5))
  {
    os_log_type_t v11 = (uint64_t (*)(void))v0[1];
    return v11();
  }
  else
  {
    id v6 = sub_1B735A2B8();
    id v7 = (void *)sub_1B7383FA0();
    id v8 = objc_msgSend(self, sel_requestWithIdentifier_content_trigger_, v7, v6, 0);
    v0[5] = v8;

    uint64_t v9 = swift_task_alloc();
    v0[6] = v9;
    *(void *)uint64_t v9 = v0;
    *(void *)(v9 + 8) = sub_1B7354D84;
    uint64_t v10 = v0[2];
    *(unsigned char *)(v9 + 304) = 1;
    *(void *)(v9 + 256) = v8;
    *(void *)(v9 + 264) = v10;
    return MEMORY[0x1F4188298](sub_1B7353758, 0, 0);
  }
}

uint64_t sub_1B7354D84()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 56) = v0;
  swift_task_dealloc();
  if (v0)
  {
    unsigned __int8 v3 = sub_1B7354F2C;
  }
  else
  {

    unsigned __int8 v3 = sub_1B7354EA0;
  }
  return MEMORY[0x1F4188298](v3, 0, 0);
}

uint64_t sub_1B7354EA0()
{
  uint64_t v1 = *(void *)(v0 + 32);
  id v2 = objc_msgSend(*(id *)(v0 + 24), sel_pm_defaults);
  objc_msgSend(v2, sel_setBool_forKey_, 1, v1);

  unsigned __int8 v3 = *(uint64_t (**)(void))(v0 + 8);
  return v3();
}

uint64_t sub_1B7354F2C()
{
  if (qword_1E9E58F28 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_1B7383E40();
  __swift_project_value_buffer(v1, (uint64_t)qword_1E9E5B9C0);
  id v2 = sub_1B7383E10();
  os_log_type_t v3 = sub_1B73841C0();
  BOOL v4 = os_log_type_enabled(v2, v3);
  uint64_t v5 = *(void **)(v0 + 56);
  if (v4)
  {
    id v6 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_1B728F000, v2, v3, "Unable to schedule Take A Tour notification", v6, 2u);
    MEMORY[0x1BA9BDB10](v6, -1, -1);
  }

  id v7 = *(uint64_t (**)(void))(v0 + 8);
  return v7();
}

uint64_t sub_1B73551BC(const void *a1, void *a2)
{
  v2[2] = a2;
  v2[3] = _Block_copy(a1);
  id v4 = a2;
  uint64_t v5 = (void *)swift_task_alloc();
  v2[4] = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_1B735527C;
  void v5[2] = v4;
  return MEMORY[0x1F4188298](sub_1B7354B90, 0, 0);
}

uint64_t sub_1B735527C()
{
  uint64_t v1 = *(void (***)(void))(*v0 + 24);
  id v2 = *(void **)(*v0 + 16);
  uint64_t v5 = *v0;
  swift_task_dealloc();

  v1[2](v1);
  _Block_release(v1);
  os_log_type_t v3 = *(uint64_t (**)(void))(v5 + 8);
  return v3();
}

void sub_1B7355500(uint64_t a1, void *a2)
{
  os_log_type_t v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3(a2);
  swift_release();
}

void sub_1B7355694(uint64_t a1, uint64_t a2)
{
  if (a1) {
    uint64_t v3 = sub_1B7383C30();
  }
  else {
    uint64_t v3 = 0;
  }
  id v4 = (id)v3;
  (*(void (**)(uint64_t))(a2 + 16))(a2);
}

uint64_t sub_1B73556F8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v9[9] = a8;
  v9[10] = v8;
  v9[7] = a6;
  v9[8] = a7;
  void v9[5] = a4;
  v9[6] = a5;
  void v9[3] = a2;
  void v9[4] = a3;
  int v9[2] = a1;
  return MEMORY[0x1F4188298](sub_1B7355728, 0, 0);
}

uint64_t sub_1B7355728()
{
  uint64_t v17 = v0[6];
  uint64_t v18 = v0[7];
  uint64_t v1 = v0[4];
  uint64_t v16 = v0[5];
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  id v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F445A8]), sel_init);
  v0[11] = v4;
  sub_1B72944F4();
  uint64_t v5 = (void *)sub_1B7383FA0();
  swift_bridgeObjectRelease();
  objc_msgSend(v4, sel_setTitle_, v5);

  sub_1B72944F4();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9E59088);
  uint64_t v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = xmmword_1B7390260;
  *(void *)(v6 + 56) = MEMORY[0x1E4FBB1A0];
  *(void *)(v6 + 64) = sub_1B735B140();
  *(void *)(v6 + 32) = v2;
  *(void *)(v6 + 40) = v3;
  swift_bridgeObjectRetain();
  sub_1B7383FB0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v7 = (void *)sub_1B7383FA0();
  swift_bridgeObjectRelease();
  objc_msgSend(v4, sel_setBody_, v7);

  uint64_t v8 = sub_1B7383CE0();
  sub_1B7359424(v1, v16, v17, v18, 0, v8, v9, v4);
  swift_bridgeObjectRelease();
  id v10 = v4;
  os_log_type_t v11 = (void *)sub_1B7383FA0();
  id v12 = objc_msgSend(self, sel_requestWithIdentifier_content_trigger_, v11, v10, 0);
  v0[12] = v12;

  uint64_t v13 = swift_task_alloc();
  v0[13] = v13;
  *(void *)uint64_t v13 = v0;
  *(void *)(v13 + 8) = sub_1B7355A10;
  uint64_t v14 = v0[10];
  *(unsigned char *)(v13 + 304) = 1;
  *(void *)(v13 + 256) = v12;
  *(void *)(v13 + 264) = v14;
  return MEMORY[0x1F4188298](sub_1B7353758, 0, 0);
}

uint64_t sub_1B7355A10()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 112) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = sub_1B7355B8C;
  }
  else
  {

    uint64_t v3 = sub_1B7355B2C;
  }
  return MEMORY[0x1F4188298](v3, 0, 0);
}

uint64_t sub_1B7355B2C()
{
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_1B7355B8C()
{
  if (qword_1E9E58F28 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_1B7383E40();
  __swift_project_value_buffer(v1, (uint64_t)qword_1E9E5B9C0);
  uint64_t v2 = sub_1B7383E10();
  os_log_type_t v3 = sub_1B73841C0();
  BOOL v4 = os_log_type_enabled(v2, v3);
  uint64_t v5 = *(void **)(v0 + 112);
  uint64_t v6 = *(void **)(v0 + 88);
  if (v4)
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl(&dword_1B728F000, v2, v3, "Unable to schedule Automatically Created Passkey notification", v7, 2u);
    MEMORY[0x1BA9BDB10](v7, -1, -1);
  }
  else
  {
  }
  uint64_t v8 = *(uint64_t (**)(void))(v0 + 8);
  return v8();
}

uint64_t sub_1B7355E74(int a1, int a2, int a3, void *a4, void *aBlock, void *a6)
{
  uint64_t v9 = v6;
  void v6[2] = a6;
  void v6[3] = _Block_copy(aBlock);
  uint64_t v25 = sub_1B7383FC0();
  uint64_t v11 = v10;
  void v9[4] = v10;
  uint64_t v12 = sub_1B7383FC0();
  uint64_t v14 = v13;
  void v9[5] = v13;
  uint64_t v15 = sub_1B7383FC0();
  uint64_t v17 = v16;
  v9[6] = v16;
  id v18 = a4;
  id v19 = a6;
  uint64_t v20 = sub_1B7383D00();
  uint64_t v22 = v21;

  v9[7] = v20;
  v9[8] = v22;
  long long v23 = (void *)swift_task_alloc();
  v9[9] = v23;
  *long long v23 = v9;
  v23[9] = v22;
  v23[10] = v19;
  v23[7] = v17;
  v23[8] = v20;
  v23[5] = v14;
  v23[6] = v15;
  v23[3] = v11;
  v23[4] = v12;
  v23[1] = sub_1B7355FD8;
  v23[2] = v25;
  return MEMORY[0x1F4188298](sub_1B7355728, 0, 0);
}

uint64_t sub_1B7355FD8()
{
  unint64_t v1 = *(void *)(*v0 + 64);
  uint64_t v2 = *(void *)(*v0 + 56);
  os_log_type_t v3 = *(void (***)(void))(*v0 + 24);
  BOOL v4 = *(void **)(*v0 + 16);
  uint64_t v7 = *v0;
  swift_task_dealloc();
  sub_1B735B0E8(v2, v1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  v3[2](v3);
  _Block_release(v3);
  uint64_t v5 = *(uint64_t (**)(void))(v7 + 8);
  return v5();
}

uint64_t sub_1B73561B0(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  **(void **)(*(void *)(v2 + 64) + 40) = a2;
  id v3 = a2;
  return MEMORY[0x1F41881F8](v2);
}

uint64_t sub_1B7356204(uint64_t a1, char a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a3)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9E590A0);
    uint64_t v5 = swift_allocError();
    *uint64_t v6 = a3;
    id v7 = a3;
    return MEMORY[0x1F4188208](v3, v5);
  }
  else
  {
    **(unsigned char **)(*(void *)(v3 + 64) + 40) = a2;
    return MEMORY[0x1F4188200](v3);
  }
}

uint64_t sub_1B73562B8(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (a2)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9E590A0);
    uint64_t v4 = swift_allocError();
    *uint64_t v5 = a2;
    id v6 = a2;
    return MEMORY[0x1F4188208](v2, v4);
  }
  else
  {
    uint64_t v7 = *(void *)(a1 + 32);
    return MEMORY[0x1F4188200](v7);
  }
}

uint64_t sub_1B7356350(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v11 = objc_msgSend(v5, sel_delegate);
  sub_1B729E55C(0, &qword_1E9E58FD8);
  uint64_t v26 = sub_1B73841F0();
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = v11;
  v12[3] = v5;
  v12[4] = a2;
  v12[5] = a1;
  v12[6] = a3;
  v12[7] = a4;
  v12[8] = a5;
  void aBlock[4] = sub_1B735ACD8;
  aBlock[5] = v12;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1B73566DC;
  aBlock[3] = &block_descriptor;
  uint64_t v13 = _Block_copy(aBlock);
  swift_unknownObjectRetain();
  id v14 = v5;
  swift_bridgeObjectRetain();
  swift_retain();
  swift_release();
  uint64_t v15 = sub_1B7383E70();
  uint64_t v16 = *(void *)(v15 - 8);
  MEMORY[0x1F4188790](v15);
  id v18 = (char *)&v25 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B7383E60();
  uint64_t v19 = sub_1B7383E50();
  uint64_t v20 = *(void *)(v19 - 8);
  MEMORY[0x1F4188790](v19);
  uint64_t v22 = (char *)&v25 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  aBlock[0] = MEMORY[0x1E4FBC860];
  sub_1B735AD04();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9E59048);
  sub_1B735AD50();
  sub_1B7384290();
  long long v23 = (void *)v26;
  MEMORY[0x1BA9BBC00](0, v18, v22, v13);
  _Block_release(v13);
  swift_unknownObjectRelease();

  (*(void (**)(char *, uint64_t))(v20 + 8))(v22, v19);
  return (*(uint64_t (**)(char *, uint64_t))(v16 + 8))(v18, v15);
}

uint64_t sub_1B7356638(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t (*a6)(void))
{
  if (a1)
  {
    id v11 = (void *)sub_1B7383F70();
    objc_msgSend(a1, sel_notificationManager_didReceiveResponseOfType_toNotificationOfType_withUserInfo_, a2, a3, a4, v11);
  }
  return a6();
}

uint64_t sub_1B73566DC(uint64_t a1)
{
  unint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);
  return swift_release();
}

uint64_t type metadata accessor for WBSPasswordsNotificationManager(uint64_t a1)
{
  return sub_1B729E55C(a1, &qword_1E9E58FA8);
}

void type metadata accessor for SecKey(uint64_t a1)
{
}

void type metadata accessor for CFError(uint64_t a1)
{
}

void *sub_1B73569CC@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

void sub_1B73569DC(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_1B73569E8()
{
  return sub_1B7383E00();
}

uint64_t sub_1B7356A34()
{
  return sub_1B7383DF0();
}

uint64_t sub_1B7356A8C()
{
  return sub_1B7384630();
}

uint64_t sub_1B7356AF4()
{
  return sub_1B7383DE0() & 1;
}

uint64_t sub_1B7356B58()
{
  return sub_1B7356BC0(&qword_1E9E58FC8);
}

uint64_t sub_1B7356B8C()
{
  return sub_1B7356BC0(&qword_1E9E58FD0);
}

uint64_t sub_1B7356BC0(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for CFString(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1B7356C04(void *a1, void *a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = *v2;
  if ((*v2 & 0xC000000000000001) != 0)
  {
    if (v6 < 0) {
      uint64_t v7 = *v2;
    }
    else {
      uint64_t v7 = v6 & 0xFFFFFFFFFFFFFF8;
    }
    swift_bridgeObjectRetain();
    id v8 = a2;
    uint64_t v9 = sub_1B73842E0();

    if (v9)
    {
      swift_bridgeObjectRelease();

      sub_1B729E55C(0, &qword_1E9E59148);
      swift_unknownObjectRetain();
      swift_dynamicCast();
      *a1 = v26;
      swift_unknownObjectRelease();
      return 0;
    }
    uint64_t result = sub_1B73842D0();
    if (__OFADD__(result, 1))
    {
      __break(1u);
      return result;
    }
    uint64_t v21 = sub_1B7356EA4(v7, result + 1);
    uint64_t v27 = v21;
    if (*(void *)(v21 + 24) <= *(void *)(v21 + 16))
    {
      id v25 = v8;
      sub_1B735709C();
      uint64_t v22 = v27;
    }
    else
    {
      uint64_t v22 = v21;
      id v23 = v8;
    }
    sub_1B735733C((uint64_t)v8, v22);
    uint64_t *v3 = v22;
  }
  else
  {
    swift_bridgeObjectRetain();
    uint64_t v11 = sub_1B7384230();
    uint64_t v12 = -1 << *(unsigned char *)(v6 + 32);
    unint64_t v13 = v11 & ~v12;
    if ((*(void *)(v6 + 56 + ((v13 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v13))
    {
      sub_1B729E55C(0, &qword_1E9E59148);
      id v14 = *(id *)(*(void *)(v6 + 48) + 8 * v13);
      char v15 = sub_1B7384240();

      if (v15)
      {
LABEL_12:

        swift_bridgeObjectRelease();
        uint64_t v19 = *(void **)(*(void *)(*v2 + 48) + 8 * v13);
        *a1 = v19;
        id v20 = v19;
        return 0;
      }
      uint64_t v16 = ~v12;
      while (1)
      {
        unint64_t v13 = (v13 + 1) & v16;
        if (((*(void *)(v6 + 56 + ((v13 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v13) & 1) == 0) {
          break;
        }
        id v17 = *(id *)(*(void *)(v6 + 48) + 8 * v13);
        char v18 = sub_1B7384240();

        if (v18) {
          goto LABEL_12;
        }
      }
    }
    swift_bridgeObjectRelease();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v28 = *v2;
    uint64_t *v2 = 0x8000000000000000;
    id v8 = a2;
    sub_1B73573C0((uint64_t)v8, v13, isUniquelyReferenced_nonNull_native);
    uint64_t *v2 = v28;
  }
  swift_bridgeObjectRelease();
  *a1 = v8;
  return 1;
}

uint64_t sub_1B7356EA4(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9E59158);
    uint64_t v2 = sub_1B7384350();
    uint64_t v14 = v2;
    sub_1B73842C0();
    if (sub_1B73842F0())
    {
      sub_1B729E55C(0, &qword_1E9E59148);
      do
      {
        swift_dynamicCast();
        uint64_t v2 = v14;
        if (*(void *)(v14 + 24) <= *(void *)(v14 + 16))
        {
          sub_1B735709C();
          uint64_t v2 = v14;
        }
        uint64_t result = sub_1B7384230();
        uint64_t v4 = v2 + 56;
        uint64_t v5 = -1 << *(unsigned char *)(v2 + 32);
        unint64_t v6 = result & ~v5;
        unint64_t v7 = v6 >> 6;
        if (((-1 << v6) & ~*(void *)(v2 + 56 + 8 * (v6 >> 6))) != 0)
        {
          unint64_t v8 = __clz(__rbit64((-1 << v6) & ~*(void *)(v2 + 56 + 8 * (v6 >> 6)))) | v6 & 0x7FFFFFFFFFFFFFC0;
        }
        else
        {
          char v9 = 0;
          unint64_t v10 = (unint64_t)(63 - v5) >> 6;
          do
          {
            if (++v7 == v10 && (v9 & 1) != 0)
            {
              __break(1u);
              return result;
            }
            BOOL v11 = v7 == v10;
            if (v7 == v10) {
              unint64_t v7 = 0;
            }
            v9 |= v11;
            uint64_t v12 = *(void *)(v4 + 8 * v7);
          }
          while (v12 == -1);
          unint64_t v8 = __clz(__rbit64(~v12)) + (v7 << 6);
        }
        *(void *)(v4 + ((v8 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v8;
        *(void *)(*(void *)(v2 + 48) + 8 * v8) = v13;
        ++*(void *)(v2 + 16);
      }
      while (sub_1B73842F0());
    }
    swift_release();
  }
  else
  {
    swift_unknownObjectRelease();
    return MEMORY[0x1E4FBC870];
  }
  return v2;
}

uint64_t sub_1B735709C()
{
  unint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9E59158);
  uint64_t v3 = sub_1B7384340();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    uint64_t v28 = v0;
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    unint64_t v6 = (void *)(v2 + 56);
    if (v5 < 64) {
      uint64_t v7 = ~(-1 << v5);
    }
    else {
      uint64_t v7 = -1;
    }
    unint64_t v8 = v7 & *(void *)(v2 + 56);
    int64_t v9 = (unint64_t)(v5 + 63) >> 6;
    uint64_t v10 = v3 + 56;
    uint64_t result = swift_retain();
    int64_t v12 = 0;
    while (1)
    {
      if (v8)
      {
        unint64_t v14 = __clz(__rbit64(v8));
        v8 &= v8 - 1;
        unint64_t v15 = v14 | (v12 << 6);
      }
      else
      {
        int64_t v16 = v12 + 1;
        if (__OFADD__(v12, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v16 >= v9) {
          goto LABEL_33;
        }
        unint64_t v17 = v6[v16];
        ++v12;
        if (!v17)
        {
          int64_t v12 = v16 + 1;
          if (v16 + 1 >= v9) {
            goto LABEL_33;
          }
          unint64_t v17 = v6[v12];
          if (!v17)
          {
            int64_t v12 = v16 + 2;
            if (v16 + 2 >= v9) {
              goto LABEL_33;
            }
            unint64_t v17 = v6[v12];
            if (!v17)
            {
              int64_t v18 = v16 + 3;
              if (v18 >= v9)
              {
LABEL_33:
                swift_release();
                unint64_t v1 = v28;
                uint64_t v27 = 1 << *(unsigned char *)(v2 + 32);
                if (v27 > 63) {
                  bzero((void *)(v2 + 56), ((unint64_t)(v27 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *unint64_t v6 = -1 << v27;
                }
                *(void *)(v2 + 16) = 0;
                break;
              }
              unint64_t v17 = v6[v18];
              if (!v17)
              {
                while (1)
                {
                  int64_t v12 = v18 + 1;
                  if (__OFADD__(v18, 1)) {
                    goto LABEL_39;
                  }
                  if (v12 >= v9) {
                    goto LABEL_33;
                  }
                  unint64_t v17 = v6[v12];
                  ++v18;
                  if (v17) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v12 = v18;
            }
          }
        }
LABEL_23:
        unint64_t v8 = (v17 - 1) & v17;
        unint64_t v15 = __clz(__rbit64(v17)) + (v12 << 6);
      }
      uint64_t v19 = *(void *)(*(void *)(v2 + 48) + 8 * v15);
      uint64_t result = sub_1B7384230();
      uint64_t v20 = -1 << *(unsigned char *)(v4 + 32);
      unint64_t v21 = result & ~v20;
      unint64_t v22 = v21 >> 6;
      if (((-1 << v21) & ~*(void *)(v10 + 8 * (v21 >> 6))) != 0)
      {
        unint64_t v13 = __clz(__rbit64((-1 << v21) & ~*(void *)(v10 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v23 = 0;
        unint64_t v24 = (unint64_t)(63 - v20) >> 6;
        do
        {
          if (++v22 == v24 && (v23 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          BOOL v25 = v22 == v24;
          if (v22 == v24) {
            unint64_t v22 = 0;
          }
          v23 |= v25;
          uint64_t v26 = *(void *)(v10 + 8 * v22);
        }
        while (v26 == -1);
        unint64_t v13 = __clz(__rbit64(~v26)) + (v22 << 6);
      }
      *(void *)(v10 + ((v13 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v13;
      *(void *)(*(void *)(v4 + 48) + 8 * v13) = v19;
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = swift_release();
  uint64_t *v1 = v4;
  return result;
}

unint64_t sub_1B735733C(uint64_t a1, uint64_t a2)
{
  sub_1B7384230();
  unint64_t result = sub_1B73842B0();
  *(void *)(a2 + 56 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
  *(void *)(*(void *)(a2 + 48) + 8 * result) = a1;
  ++*(void *)(a2 + 16);
  return result;
}

void sub_1B73573C0(uint64_t a1, unint64_t a2, char a3)
{
  unint64_t v6 = *(void *)(*v3 + 16);
  unint64_t v7 = *(void *)(*v3 + 24);
  if (v7 > v6 && (a3 & 1) != 0) {
    goto LABEL_14;
  }
  if (a3)
  {
    sub_1B735709C();
  }
  else
  {
    if (v7 > v6)
    {
      sub_1B7357548();
      goto LABEL_14;
    }
    sub_1B73576F4();
  }
  uint64_t v8 = *v3;
  uint64_t v9 = sub_1B7384230();
  uint64_t v10 = -1 << *(unsigned char *)(v8 + 32);
  a2 = v9 & ~v10;
  if ((*(void *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
  {
    sub_1B729E55C(0, &qword_1E9E59148);
    id v11 = *(id *)(*(void *)(v8 + 48) + 8 * a2);
    char v12 = sub_1B7384240();

    if (v12)
    {
LABEL_13:
      sub_1B73845B0();
      __break(1u);
    }
    else
    {
      uint64_t v13 = ~v10;
      while (1)
      {
        a2 = (a2 + 1) & v13;
        if (((*(void *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2) & 1) == 0) {
          break;
        }
        id v14 = *(id *)(*(void *)(v8 + 48) + 8 * a2);
        char v15 = sub_1B7384240();

        if (v15) {
          goto LABEL_13;
        }
      }
    }
  }
LABEL_14:
  uint64_t v16 = *v3;
  *(void *)(*v3 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  *(void *)(*(void *)(v16 + 48) + 8 * a2) = a1;
  uint64_t v17 = *(void *)(v16 + 16);
  BOOL v18 = __OFADD__(v17, 1);
  uint64_t v19 = v17 + 1;
  if (v18) {
    __break(1u);
  }
  else {
    *(void *)(v16 + 16) = v19;
  }
}

id sub_1B7357548()
{
  unint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9E59158);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_1B7384330();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    id result = (id)swift_release();
    uint64_t *v1 = v4;
    return result;
  }
  id result = (id)(v3 + 56);
  uint64_t v6 = v2 + 56;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 56), 8 * v7);
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
    int64_t v18 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v18 >= v13) {
      goto LABEL_28;
    }
    unint64_t v19 = *(void *)(v6 + 8 * v18);
    ++v9;
    if (!v19)
    {
      int64_t v9 = v18 + 1;
      if (v18 + 1 >= v13) {
        goto LABEL_28;
      }
      unint64_t v19 = *(void *)(v6 + 8 * v9);
      if (!v19)
      {
        int64_t v9 = v18 + 2;
        if (v18 + 2 >= v13) {
          goto LABEL_28;
        }
        unint64_t v19 = *(void *)(v6 + 8 * v9);
        if (!v19) {
          break;
        }
      }
    }
LABEL_27:
    unint64_t v12 = (v19 - 1) & v19;
    unint64_t v15 = __clz(__rbit64(v19)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 8 * v15;
    uint64_t v17 = *(void **)(*(void *)(v2 + 48) + v16);
    *(void *)(*(void *)(v4 + 48) + v16) = v17;
    id result = v17;
  }
  int64_t v20 = v18 + 3;
  if (v20 >= v13) {
    goto LABEL_28;
  }
  unint64_t v19 = *(void *)(v6 + 8 * v20);
  if (v19)
  {
    int64_t v9 = v20;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v9 = v20 + 1;
    if (__OFADD__(v20, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_28;
    }
    unint64_t v19 = *(void *)(v6 + 8 * v9);
    ++v20;
    if (v19) {
      goto LABEL_27;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_1B73576F4()
{
  unint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9E59158);
  uint64_t v3 = sub_1B7384340();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    uint64_t *v1 = v4;
    return result;
  }
  uint64_t v27 = v0;
  uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v6 = v2 + 56;
  if (v5 < 64) {
    uint64_t v7 = ~(-1 << v5);
  }
  else {
    uint64_t v7 = -1;
  }
  unint64_t v8 = v7 & *(void *)(v2 + 56);
  int64_t v9 = (unint64_t)(v5 + 63) >> 6;
  uint64_t v10 = v3 + 56;
  uint64_t result = swift_retain();
  int64_t v12 = 0;
  while (1)
  {
    if (v8)
    {
      unint64_t v14 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      unint64_t v15 = v14 | (v12 << 6);
      goto LABEL_24;
    }
    int64_t v16 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v16 >= v9) {
      goto LABEL_33;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v16);
    ++v12;
    if (!v17)
    {
      int64_t v12 = v16 + 1;
      if (v16 + 1 >= v9) {
        goto LABEL_33;
      }
      unint64_t v17 = *(void *)(v6 + 8 * v12);
      if (!v17)
      {
        int64_t v12 = v16 + 2;
        if (v16 + 2 >= v9) {
          goto LABEL_33;
        }
        unint64_t v17 = *(void *)(v6 + 8 * v12);
        if (!v17) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v8 = (v17 - 1) & v17;
    unint64_t v15 = __clz(__rbit64(v17)) + (v12 << 6);
LABEL_24:
    id v19 = *(id *)(*(void *)(v2 + 48) + 8 * v15);
    uint64_t result = sub_1B7384230();
    uint64_t v20 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v21 = result & ~v20;
    unint64_t v22 = v21 >> 6;
    if (((-1 << v21) & ~*(void *)(v10 + 8 * (v21 >> 6))) != 0)
    {
      unint64_t v13 = __clz(__rbit64((-1 << v21) & ~*(void *)(v10 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v23 = 0;
      unint64_t v24 = (unint64_t)(63 - v20) >> 6;
      do
      {
        if (++v22 == v24 && (v23 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        BOOL v25 = v22 == v24;
        if (v22 == v24) {
          unint64_t v22 = 0;
        }
        v23 |= v25;
        uint64_t v26 = *(void *)(v10 + 8 * v22);
      }
      while (v26 == -1);
      unint64_t v13 = __clz(__rbit64(~v26)) + (v22 << 6);
    }
    *(void *)(v10 + ((v13 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v13;
    *(void *)(*(void *)(v4 + 48) + 8 * v13) = v19;
    ++*(void *)(v4 + 16);
  }
  int64_t v18 = v16 + 3;
  if (v18 >= v9)
  {
LABEL_33:
    uint64_t result = swift_release_n();
    unint64_t v1 = v27;
    goto LABEL_35;
  }
  unint64_t v17 = *(void *)(v6 + 8 * v18);
  if (v17)
  {
    int64_t v12 = v18;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v12 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v12 >= v9) {
      goto LABEL_33;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v12);
    ++v18;
    if (v17) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

unint64_t sub_1B7357970(uint64_t a1)
{
  uint64_t v2 = sub_1B7384230();
  return sub_1B73588F8(a1, v2);
}

unint64_t sub_1B73579B4(uint64_t a1)
{
  uint64_t v2 = sub_1B7384300();
  return sub_1B7358A14(a1, v2);
}

unint64_t sub_1B73579F8(uint64_t a1, uint64_t a2)
{
  sub_1B7384620();
  sub_1B7384050();
  uint64_t v4 = sub_1B7384630();
  return sub_1B7358ADC(a1, a2, v4);
}

unint64_t sub_1B7357A70(uint64_t a1)
{
  sub_1B7384620();
  type metadata accessor for CFString(0);
  sub_1B7356BC0(&qword_1E9E59178);
  sub_1B7383DF0();
  uint64_t v2 = sub_1B7384630();
  return sub_1B7358BC0(a1, v2);
}

uint64_t sub_1B7357B10(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9E590B8);
  uint64_t v6 = sub_1B7384490();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_41;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v36 = v5 + 64;
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
      unint64_t v19 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v20 = v19 | (v14 << 6);
      goto LABEL_22;
    }
    int64_t v21 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v21 >= v11) {
      break;
    }
    unint64_t v22 = (void *)(v5 + 64);
    unint64_t v23 = *(void *)(v36 + 8 * v21);
    ++v14;
    if (!v23)
    {
      int64_t v14 = v21 + 1;
      if (v21 + 1 >= v11) {
        goto LABEL_34;
      }
      unint64_t v23 = *(void *)(v36 + 8 * v14);
      if (!v23)
      {
        int64_t v24 = v21 + 2;
        if (v24 >= v11)
        {
LABEL_34:
          swift_release();
          if ((a2 & 1) == 0) {
            goto LABEL_41;
          }
          goto LABEL_37;
        }
        unint64_t v23 = *(void *)(v36 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            int64_t v14 = v24 + 1;
            if (__OFADD__(v24, 1)) {
              goto LABEL_43;
            }
            if (v14 >= v11) {
              goto LABEL_34;
            }
            unint64_t v23 = *(void *)(v36 + 8 * v14);
            ++v24;
            if (v23) {
              goto LABEL_21;
            }
          }
        }
        int64_t v14 = v24;
      }
    }
LABEL_21:
    unint64_t v10 = (v23 - 1) & v23;
    unint64_t v20 = __clz(__rbit64(v23)) + (v14 << 6);
LABEL_22:
    uint64_t v25 = *(void *)(v5 + 48) + 40 * v20;
    if (a2)
    {
      long long v26 = *(_OWORD *)v25;
      long long v27 = *(_OWORD *)(v25 + 16);
      uint64_t v40 = *(void *)(v25 + 32);
      long long v38 = v26;
      long long v39 = v27;
      sub_1B735B1F0((_OWORD *)(*(void *)(v5 + 56) + 32 * v20), v37);
    }
    else
    {
      sub_1B735B200(v25, (uint64_t)&v38);
      sub_1B735B2AC(*(void *)(v5 + 56) + 32 * v20, (uint64_t)v37);
    }
    uint64_t result = sub_1B7384300();
    uint64_t v28 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v29 = result & ~v28;
    unint64_t v30 = v29 >> 6;
    if (((-1 << v29) & ~*(void *)(v12 + 8 * (v29 >> 6))) != 0)
    {
      unint64_t v15 = __clz(__rbit64((-1 << v29) & ~*(void *)(v12 + 8 * (v29 >> 6)))) | v29 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v31 = 0;
      unint64_t v32 = (unint64_t)(63 - v28) >> 6;
      do
      {
        if (++v30 == v32 && (v31 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        BOOL v33 = v30 == v32;
        if (v30 == v32) {
          unint64_t v30 = 0;
        }
        v31 |= v33;
        uint64_t v34 = *(void *)(v12 + 8 * v30);
      }
      while (v34 == -1);
      unint64_t v15 = __clz(__rbit64(~v34)) + (v30 << 6);
    }
    *(void *)(v12 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
    uint64_t v16 = *(void *)(v7 + 48) + 40 * v15;
    long long v17 = v38;
    long long v18 = v39;
    *(void *)(v16 + 32) = v40;
    *(_OWORD *)uint64_t v16 = v17;
    *(_OWORD *)(v16 + 16) = v18;
    uint64_t result = (uint64_t)sub_1B735B1F0(v37, (_OWORD *)(*(void *)(v7 + 56) + 32 * v15));
    ++*(void *)(v7 + 16);
  }
  swift_release();
  unint64_t v22 = (void *)(v5 + 64);
  if ((a2 & 1) == 0) {
    goto LABEL_41;
  }
LABEL_37:
  uint64_t v35 = 1 << *(unsigned char *)(v5 + 32);
  if (v35 >= 64) {
    bzero(v22, ((unint64_t)(v35 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *unint64_t v22 = -1 << v35;
  }
  *(void *)(v5 + 16) = 0;
LABEL_41:
  uint64_t result = swift_release();
  uint64_t *v3 = v7;
  return result;
}

uint64_t sub_1B7357E28(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9E59180);
  uint64_t v6 = sub_1B7384490();
  uint64_t v7 = v6;
  if (*(void *)(v5 + 16))
  {
    uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
    uint64_t v34 = (void *)(v5 + 64);
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
                  void *v34 = -1 << v32;
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
      int64_t v24 = (_OWORD *)(*(void *)(v5 + 56) + 32 * v17);
      if (a2)
      {
        sub_1B735B1F0(v24, v35);
      }
      else
      {
        sub_1B735B2AC((uint64_t)v24, (uint64_t)v35);
        swift_bridgeObjectRetain();
      }
      sub_1B7384620();
      sub_1B7384050();
      uint64_t result = sub_1B7384630();
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
      unint64_t v15 = (void *)(*(void *)(v7 + 48) + 16 * v14);
      *unint64_t v15 = v23;
      v15[1] = v22;
      uint64_t result = (uint64_t)sub_1B735B1F0(v35, (_OWORD *)(*(void *)(v7 + 56) + 32 * v14));
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
  uint64_t *v3 = v7;
  return result;
}

uint64_t sub_1B7358128(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9E59170);
  uint64_t v6 = sub_1B7384490();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v36 = v2;
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
    uint64_t v23 = (void *)(v5 + 64);
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
          if ((a2 & 1) == 0) {
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
    uint64_t v30 = 8 * v21;
    uint64_t v31 = *(void **)(*(void *)(v5 + 48) + v30);
    uint64_t v32 = *(void **)(*(void *)(v5 + 56) + v30);
    if ((a2 & 1) == 0)
    {
      id v33 = v31;
      id v34 = v32;
    }
    uint64_t result = sub_1B7384230();
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
    uint64_t v19 = 8 * v18;
    *(void *)(*(void *)(v7 + 48) + v19) = v31;
    *(void *)(*(void *)(v7 + 56) + v19) = v32;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v36;
  uint64_t v23 = (void *)(v5 + 64);
  if ((a2 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v35 = 1 << *(unsigned char *)(v5 + 32);
  if (v35 >= 64) {
    bzero(v23, ((unint64_t)(v35 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *uint64_t v23 = -1 << v35;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  uint64_t *v3 = v7;
  return result;
}

_OWORD *sub_1B73583FC(_OWORD *a1, uint64_t a2, char a3)
{
  uint64_t v4 = (void **)v3;
  uint64_t v8 = (void *)*v3;
  unint64_t v10 = sub_1B73579B4(a2);
  uint64_t v11 = v8[2];
  BOOL v12 = (v9 & 1) == 0;
  uint64_t v13 = v11 + v12;
  if (__OFADD__(v11, v12))
  {
    __break(1u);
    goto LABEL_15;
  }
  char v14 = v9;
  uint64_t v15 = v8[3];
  if (v15 < v13 || (a3 & 1) == 0)
  {
    if (v15 >= v13 && (a3 & 1) == 0)
    {
      sub_1B7358EAC();
      goto LABEL_7;
    }
    sub_1B7357B10(v13, a3 & 1);
    unint64_t v19 = sub_1B73579B4(a2);
    if ((v14 & 1) == (v20 & 1))
    {
      unint64_t v10 = v19;
      unint64_t v16 = *v4;
      if (v14) {
        goto LABEL_8;
      }
LABEL_13:
      sub_1B735B200(a2, (uint64_t)v21);
      return sub_1B7358810(v10, (uint64_t)v21, a1, v16);
    }
LABEL_15:
    uint64_t result = (_OWORD *)sub_1B73845C0();
    __break(1u);
    return result;
  }
LABEL_7:
  unint64_t v16 = *v4;
  if ((v14 & 1) == 0) {
    goto LABEL_13;
  }
LABEL_8:
  unint64_t v17 = (_OWORD *)(v16[7] + 32 * v10);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v17);
  return sub_1B735B1F0(a1, v17);
}

_OWORD *sub_1B7358548(_OWORD *a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = (void **)v4;
  unint64_t v10 = (void *)*v4;
  unint64_t v12 = sub_1B73579F8(a2, a3);
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
      sub_1B7359094();
      goto LABEL_7;
    }
    sub_1B7357E28(v15, a4 & 1);
    unint64_t v21 = sub_1B73579F8(a2, a3);
    if ((v16 & 1) == (v22 & 1))
    {
      unint64_t v12 = v21;
      unint64_t v18 = *v5;
      if (v16) {
        goto LABEL_8;
      }
      goto LABEL_13;
    }
LABEL_17:
    uint64_t result = (_OWORD *)sub_1B73845C0();
    __break(1u);
    return result;
  }
LABEL_7:
  unint64_t v18 = *v5;
  if (v16)
  {
LABEL_8:
    unint64_t v19 = (_OWORD *)(v18[7] + 32 * v12);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v19);
    return sub_1B735B1F0(a1, v19);
  }
LABEL_13:
  sub_1B735888C(v12, a2, a3, a1, v18);
  return (_OWORD *)swift_bridgeObjectRetain();
}

void sub_1B735869C(uint64_t a1, void *a2, char a3)
{
  uint64_t v4 = v3;
  uint64_t v7 = *v3;
  unint64_t v9 = sub_1B7357970((uint64_t)a2);
  uint64_t v10 = *(void *)(v7 + 16);
  BOOL v11 = (v8 & 1) == 0;
  uint64_t v12 = v10 + v11;
  if (__OFADD__(v10, v11))
  {
    __break(1u);
    goto LABEL_16;
  }
  char v13 = v8;
  uint64_t v14 = *(void *)(v7 + 24);
  if (v14 >= v12 && (a3 & 1) != 0) {
    goto LABEL_7;
  }
  if (v14 >= v12 && (a3 & 1) == 0)
  {
    sub_1B735927C();
LABEL_7:
    uint64_t v15 = (void *)*v4;
    if (v13)
    {
LABEL_8:
      uint64_t v16 = v15[7];

      *(void *)(v16 + 8 * v9) = a1;
      return;
    }
    goto LABEL_11;
  }
  sub_1B7358128(v12, a3 & 1);
  unint64_t v17 = sub_1B7357970((uint64_t)a2);
  if ((v13 & 1) != (v18 & 1))
  {
LABEL_17:
    sub_1B729E55C(0, (unint64_t *)&qword_1E9E59160);
    sub_1B73845C0();
    __break(1u);
    return;
  }
  unint64_t v9 = v17;
  uint64_t v15 = (void *)*v4;
  if (v13) {
    goto LABEL_8;
  }
LABEL_11:
  v15[(v9 >> 6) + 8] |= 1 << v9;
  uint64_t v19 = 8 * v9;
  *(void *)(v15[6] + v19) = a2;
  *(void *)(v15[7] + v19) = a1;
  uint64_t v20 = v15[2];
  BOOL v21 = __OFADD__(v20, 1);
  uint64_t v22 = v20 + 1;
  if (v21)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v15[2] = v22;
  id v23 = a2;
}

_OWORD *sub_1B7358810(unint64_t a1, uint64_t a2, _OWORD *a3, void *a4)
{
  a4[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v5 = a4[6] + 40 * a1;
  long long v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)uint64_t v5 = *(_OWORD *)a2;
  *(_OWORD *)(v5 + 16) = v6;
  *(void *)(v5 + 32) = *(void *)(a2 + 32);
  uint64_t result = sub_1B735B1F0(a3, (_OWORD *)(a4[7] + 32 * a1));
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

_OWORD *sub_1B735888C(unint64_t a1, uint64_t a2, uint64_t a3, _OWORD *a4, void *a5)
{
  a5[(a1 >> 6) + 8] |= 1 << a1;
  long long v6 = (void *)(a5[6] + 16 * a1);
  *long long v6 = a2;
  v6[1] = a3;
  uint64_t result = sub_1B735B1F0(a4, (_OWORD *)(a5[7] + 32 * a1));
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

unint64_t sub_1B73588F8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t i = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i))
  {
    sub_1B729E55C(0, (unint64_t *)&qword_1E9E59160);
    id v6 = *(id *)(*(void *)(v2 + 48) + 8 * i);
    char v7 = sub_1B7384240();

    if ((v7 & 1) == 0)
    {
      uint64_t v8 = ~v4;
      for (unint64_t i = (i + 1) & v8; ((*(void *)(v3 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i) & 1) != 0; unint64_t i = (i + 1) & v8)
      {
        id v9 = *(id *)(*(void *)(v2 + 48) + 8 * i);
        char v10 = sub_1B7384240();

        if (v10) {
          break;
        }
      }
    }
  }
  return i;
}

unint64_t sub_1B7358A14(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v6 = ~v3;
    do
    {
      sub_1B735B200(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      char v7 = MEMORY[0x1BA9BBD10](v9, a1);
      sub_1B735B19C((uint64_t)v9);
      if (v7) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v6;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

unint64_t sub_1B7358ADC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    char v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_1B7384590() & 1) == 0)
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
      while (!v14 && (sub_1B7384590() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_1B7358BC0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t i = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i))
  {
    type metadata accessor for CFString(0);
    unint64_t v6 = *(void **)(*(void *)(v2 + 48) + 8 * i);
    sub_1B7356BC0(&qword_1E9E59178);
    id v7 = v6;
    char v8 = sub_1B7383DE0();

    if ((v8 & 1) == 0)
    {
      uint64_t v9 = ~v4;
      for (unint64_t i = (i + 1) & v9; ((*(void *)(v3 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i) & 1) != 0; unint64_t i = (i + 1) & v9)
      {
        id v10 = *(id *)(*(void *)(v2 + 48) + 8 * i);
        char v11 = sub_1B7383DE0();

        if (v11) {
          break;
        }
      }
    }
  }
  return i;
}

id sub_1B7358D08()
{
  unint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB5B5C18);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_1B7384480();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (id)swift_release();
    uint64_t *v1 = v4;
    return result;
  }
  id result = (id)(v3 + 64);
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
    int64_t v18 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v18 >= v13) {
      goto LABEL_26;
    }
    unint64_t v19 = *(void *)(v6 + 8 * v18);
    ++v9;
    if (!v19)
    {
      int64_t v9 = v18 + 1;
      if (v18 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v19 = *(void *)(v6 + 8 * v9);
      if (!v19) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v19 - 1) & v19;
    unint64_t v15 = __clz(__rbit64(v19)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 8 * v15;
    unint64_t v17 = *(void **)(*(void *)(v2 + 56) + v16);
    *(void *)(*(void *)(v4 + 48) + v16) = *(void *)(*(void *)(v2 + 48) + v16);
    *(void *)(*(void *)(v4 + 56) + v16) = v17;
    id result = v17;
  }
  int64_t v20 = v18 + 2;
  if (v20 >= v13) {
    goto LABEL_26;
  }
  unint64_t v19 = *(void *)(v6 + 8 * v20);
  if (v19)
  {
    int64_t v9 = v20;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v20 + 1;
    if (__OFADD__(v20, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v19 = *(void *)(v6 + 8 * v9);
    ++v20;
    if (v19) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_1B7358EAC()
{
  unint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9E590B8);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_1B7384480();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (void *)swift_release();
    uint64_t *v1 = v4;
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
    int64_t v21 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v21 >= v13) {
      goto LABEL_26;
    }
    unint64_t v22 = *(void *)(v6 + 8 * v21);
    ++v9;
    if (!v22)
    {
      int64_t v9 = v21 + 1;
      if (v21 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v22 = *(void *)(v6 + 8 * v9);
      if (!v22) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v22 - 1) & v22;
    unint64_t v15 = __clz(__rbit64(v22)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 40 * v15;
    sub_1B735B200(*(void *)(v2 + 48) + 40 * v15, (uint64_t)v25);
    uint64_t v17 = 32 * v15;
    sub_1B735B2AC(*(void *)(v2 + 56) + v17, (uint64_t)v24);
    uint64_t v18 = *(void *)(v4 + 48) + v16;
    long long v19 = v25[0];
    long long v20 = v25[1];
    *(void *)(v18 + 32) = v26;
    *(_OWORD *)uint64_t v18 = v19;
    *(_OWORD *)(v18 + 16) = v20;
    id result = sub_1B735B1F0(v24, (_OWORD *)(*(void *)(v4 + 56) + v17));
  }
  int64_t v23 = v21 + 2;
  if (v23 >= v13) {
    goto LABEL_26;
  }
  unint64_t v22 = *(void *)(v6 + 8 * v23);
  if (v22)
  {
    int64_t v9 = v23;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v23 + 1;
    if (__OFADD__(v23, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v22 = *(void *)(v6 + 8 * v9);
    ++v23;
    if (v22) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_1B7359094()
{
  unint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9E59180);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_1B7384480();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    id result = (void *)swift_release();
LABEL_28:
    uint64_t *v1 = v4;
    return result;
  }
  int64_t v25 = v1;
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
    uint64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    uint64_t v20 = 32 * v15;
    sub_1B735B2AC(*(void *)(v2 + 56) + 32 * v15, (uint64_t)v26);
    int64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    *int64_t v21 = v19;
    v21[1] = v18;
    sub_1B735B1F0(v26, (_OWORD *)(*(void *)(v4 + 56) + v20));
    id result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v24 = v22 + 2;
  if (v24 >= v13)
  {
LABEL_26:
    id result = (void *)swift_release();
    unint64_t v1 = v25;
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

id sub_1B735927C()
{
  unint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9E59170);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_1B7384480();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (id)swift_release();
    uint64_t *v1 = v4;
    return result;
  }
  id result = (id)(v3 + 64);
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
    int64_t v20 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v20 >= v13) {
      goto LABEL_26;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      int64_t v9 = v20 + 1;
      if (v20 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v21 = *(void *)(v6 + 8 * v9);
      if (!v21) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v21 - 1) & v21;
    unint64_t v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 8 * v15;
    uint64_t v17 = *(void **)(*(void *)(v2 + 48) + v16);
    uint64_t v18 = *(void **)(*(void *)(v2 + 56) + v16);
    *(void *)(*(void *)(v4 + 48) + v16) = v17;
    *(void *)(*(void *)(v4 + 56) + v16) = v18;
    id v19 = v17;
    id result = v18;
  }
  int64_t v22 = v20 + 2;
  if (v22 >= v13) {
    goto LABEL_26;
  }
  unint64_t v21 = *(void *)(v6 + 8 * v22);
  if (v21)
  {
    int64_t v9 = v22;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v9);
    ++v22;
    if (v21) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void sub_1B7359424(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, void *a8)
{
  uint64_t v16 = MEMORY[0x1E4FBC868];
  uint64_t v31 = MEMORY[0x1E4FBC868];
  *(void *)&long long v28 = 0x6576654C68676968;
  *((void *)&v28 + 1) = 0xEF6E69616D6F446CLL;
  uint64_t v17 = MEMORY[0x1E4FBB1A0];
  sub_1B7384320();
  if (a2)
  {
    uint64_t v29 = v17;
    *(void *)&long long v28 = a1;
    *((void *)&v28 + 1) = a2;
    sub_1B735B1F0(&v28, v27);
    swift_bridgeObjectRetain();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    sub_1B73583FC(v27, (uint64_t)v30, isUniquelyReferenced_nonNull_native);
    uint64_t v31 = v16;
    swift_bridgeObjectRelease();
    sub_1B735B19C((uint64_t)v30);
  }
  else
  {
    sub_1B7378878((uint64_t)v30, &v28);
    sub_1B735B19C((uint64_t)v30);
    sub_1B735B684((uint64_t)&v28, &qword_1E9E590A8);
  }
  *(void *)&long long v28 = 0x656D614E72657375;
  *((void *)&v28 + 1) = 0xE800000000000000;
  uint64_t v19 = MEMORY[0x1E4FBB1A0];
  sub_1B7384320();
  if (a4)
  {
    uint64_t v29 = v19;
    *(void *)&long long v28 = a3;
    *((void *)&v28 + 1) = a4;
    sub_1B735B1F0(&v28, v27);
    swift_bridgeObjectRetain();
    uint64_t v20 = v31;
    char v21 = swift_isUniquelyReferenced_nonNull_native();
    sub_1B73583FC(v27, (uint64_t)v30, v21);
    uint64_t v31 = v20;
    swift_bridgeObjectRelease();
    sub_1B735B19C((uint64_t)v30);
  }
  else
  {
    sub_1B7378878((uint64_t)v30, &v28);
    sub_1B735B19C((uint64_t)v30);
    sub_1B735B684((uint64_t)&v28, &qword_1E9E590A8);
  }
  *(void *)&long long v28 = 0x7365746973;
  *((void *)&v28 + 1) = 0xE500000000000000;
  sub_1B7384320();
  if (a5)
  {
    uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9E590B0);
    *(void *)&long long v28 = a5;
    sub_1B735B1F0(&v28, v27);
    swift_bridgeObjectRetain();
    uint64_t v22 = v31;
    char v23 = swift_isUniquelyReferenced_nonNull_native();
    sub_1B73583FC(v27, (uint64_t)v30, v23);
    uint64_t v31 = v22;
    swift_bridgeObjectRelease();
    sub_1B735B19C((uint64_t)v30);
  }
  else
  {
    sub_1B7378878((uint64_t)v30, &v28);
    sub_1B735B19C((uint64_t)v30);
    sub_1B735B684((uint64_t)&v28, &qword_1E9E590A8);
  }
  *(void *)&long long v28 = 0xD000000000000013;
  *((void *)&v28 + 1) = 0x80000001B73A7590;
  uint64_t v24 = MEMORY[0x1E4FBB1A0];
  sub_1B7384320();
  if (a7)
  {
    uint64_t v29 = v24;
    *(void *)&long long v28 = a6;
    *((void *)&v28 + 1) = a7;
    sub_1B735B1F0(&v28, v27);
    swift_bridgeObjectRetain();
    char v25 = swift_isUniquelyReferenced_nonNull_native();
    sub_1B73583FC(v27, (uint64_t)v30, v25);
    swift_bridgeObjectRelease();
    sub_1B735B19C((uint64_t)v30);
  }
  else
  {
    sub_1B7378878((uint64_t)v30, &v28);
    sub_1B735B19C((uint64_t)v30);
    sub_1B735B684((uint64_t)&v28, &qword_1E9E590A8);
  }
  uint64_t v26 = (void *)sub_1B7383F70();
  swift_bridgeObjectRelease();
  objc_msgSend(a8, sel_setUserInfo_, v26);
}

uint64_t sub_1B73597EC(void *a1, void *a2)
{
  id v4 = objc_msgSend(a1, sel_highLevelDomain);
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = sub_1B7383FC0();
    uint64_t v8 = v7;
  }
  else
  {
    uint64_t v6 = 0;
    uint64_t v8 = 0;
  }
  id v9 = objc_msgSend(a1, sel_user);
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = sub_1B7383FC0();
    uint64_t v13 = v12;
  }
  else
  {
    uint64_t v11 = 0;
    uint64_t v13 = 0;
  }
  id v14 = objc_msgSend(a1, sel_sites);
  if (v14)
  {
    unint64_t v15 = v14;
    uint64_t v16 = sub_1B7384140();
  }
  else
  {
    uint64_t v16 = 0;
  }
  id v17 = objc_msgSend(a1, sel_passkeyCredentialID);
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = sub_1B7383FC0();
    uint64_t v21 = v20;
  }
  else
  {
    uint64_t v19 = 0;
    uint64_t v21 = 0;
  }
  sub_1B7359424(v6, v8, v11, v13, v16, v19, v21, a2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

id sub_1B735996C(void *a1)
{
  id v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F445A8]), sel_init);
  strcpy((char *)v28, "Password Saved");
  HIBYTE(v28[1]) = -18;
  uint64_t v29 = 0;
  uint64_t v30 = 0;
  uint64_t v31 = &dword_1B728F000;
  sub_1B72944F4();
  uint64_t v3 = (void *)sub_1B7383FA0();
  swift_bridgeObjectRelease();
  objc_msgSend(v2, sel_setTitle_, v3);

  id v4 = objc_msgSend(a1, sel_userVisibleDomain);
  uint64_t v5 = sub_1B7383FC0();
  unint64_t v7 = v6;

  uint64_t v8 = HIBYTE(v7) & 0xF;
  if ((v7 & 0x2000000000000000) == 0) {
    uint64_t v8 = v5 & 0xFFFFFFFFFFFFLL;
  }
  if (v8)
  {
    v28[0] = 0x1000000000000048;
    v28[1] = 0x80000001B73A7780;
    uint64_t v29 = 0;
    uint64_t v30 = 0;
    uint64_t v31 = &dword_1B728F000;
    sub_1B72944F4();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9E59088);
    uint64_t v9 = swift_allocObject();
    *(_OWORD *)(v9 + 16) = xmmword_1B7390260;
    *(void *)(v9 + 56) = MEMORY[0x1E4FBB1A0];
    *(void *)(v9 + 64) = sub_1B735B140();
    *(void *)(v9 + 32) = v5;
    *(void *)(v9 + 40) = v7;
    sub_1B7383FB0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    v28[0] = 0xD00000000000003BLL;
    v28[1] = 0x80000001B73A77F0;
    uint64_t v29 = 0;
    uint64_t v30 = 0;
    uint64_t v31 = &dword_1B728F000;
    sub_1B72944F4();
  }
  uint64_t v10 = (void *)sub_1B7383FA0();
  swift_bridgeObjectRelease();
  objc_msgSend(v2, sel_setBody_, v10);

  uint64_t v11 = (void *)sub_1B7383FA0();
  objc_msgSend(v2, sel_setCategoryIdentifier_, v11);

  uint64_t v12 = sub_1B7383C70();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = *(void *)(v13 + 64);
  MEMORY[0x1F4188790](v12);
  unint64_t v15 = (v14 + 15) & 0xFFFFFFFFFFFFFFF0;
  id v16 = objc_msgSend(self, sel_urlForDetailViewOfSavedAccount_, a1);
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9E59110);
  unint64_t v27 = &v25;
  uint64_t v18 = MEMORY[0x1F4188790](v17 - 8);
  uint64_t v20 = (char *)&v25 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!v16)
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 56))(v20, 1, 1, v12);
    goto LABEL_10;
  }
  uint64_t v26 = (char *)&v25 - v15;
  MEMORY[0x1F4188790](v18);
  sub_1B7383C60();

  uint64_t v21 = *(void (**)(char *, char *, uint64_t))(v13 + 32);
  v21(v20, (char *)&v25 - v15, v12);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v13 + 56))(v20, 0, 1, v12);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v20, 1, v12) == 1)
  {
LABEL_10:
    sub_1B735B684((uint64_t)v20, &qword_1E9E59110);
    goto LABEL_11;
  }
  uint64_t v22 = v26;
  v21(v26, v20, v12);
  char v23 = (void *)sub_1B7383C50();
  objc_msgSend(v2, sel_setDefaultActionURL_, v23);

  (*(void (**)(char *, uint64_t))(v13 + 8))(v22, v12);
LABEL_11:
  sub_1B73597EC(a1, v2);
  return v2;
}

id sub_1B7359E20(void *a1)
{
  id v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F445A8]), sel_init);
  unint64_t v28 = 0xD000000000000010;
  unint64_t v29 = 0x80000001B73A76B0;
  uint64_t v30 = 0;
  uint64_t v31 = 0;
  uint64_t v32 = &dword_1B728F000;
  sub_1B72944F4();
  uint64_t v3 = (void *)sub_1B7383FA0();
  swift_bridgeObjectRelease();
  objc_msgSend(v2, sel_setTitle_, v3);

  id v4 = objc_msgSend(a1, sel_userVisibleDomain);
  uint64_t v5 = sub_1B7383FC0();
  unint64_t v7 = v6;

  uint64_t v8 = HIBYTE(v7) & 0xF;
  if ((v7 & 0x2000000000000000) == 0) {
    uint64_t v8 = v5 & 0xFFFFFFFFFFFFLL;
  }
  if (v8)
  {
    unint64_t v28 = 0x100000000000004ALL;
    unint64_t v29 = 0x80000001B73A76D0;
    uint64_t v30 = 0;
    uint64_t v31 = 0;
    uint64_t v32 = &dword_1B728F000;
    sub_1B72944F4();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9E59088);
    uint64_t v9 = swift_allocObject();
    *(_OWORD *)(v9 + 16) = xmmword_1B7390260;
    *(void *)(v9 + 56) = MEMORY[0x1E4FBB1A0];
    *(void *)(v9 + 64) = sub_1B735B140();
    *(void *)(v9 + 32) = v5;
    *(void *)(v9 + 40) = v7;
    sub_1B7383FB0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    unint64_t v28 = 0xD00000000000003DLL;
    unint64_t v29 = 0x80000001B73A7740;
    uint64_t v30 = 0;
    uint64_t v31 = 0;
    uint64_t v32 = &dword_1B728F000;
    sub_1B72944F4();
  }
  uint64_t v10 = (void *)sub_1B7383FA0();
  swift_bridgeObjectRelease();
  objc_msgSend(v2, sel_setBody_, v10);

  uint64_t v11 = (void *)sub_1B7383FA0();
  objc_msgSend(v2, sel_setCategoryIdentifier_, v11);

  uint64_t v12 = sub_1B7383C70();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = *(void *)(v13 + 64);
  MEMORY[0x1F4188790](v12);
  unint64_t v15 = (v14 + 15) & 0xFFFFFFFFFFFFFFF0;
  unint64_t v27 = a1;
  id v16 = objc_msgSend(self, sel_urlForDetailViewOfSavedAccount_, a1);
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9E59110);
  uint64_t v18 = MEMORY[0x1F4188790](v17 - 8);
  uint64_t v20 = (char *)&v25 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!v16)
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 56))(v20, 1, 1, v12);
    goto LABEL_10;
  }
  uint64_t v26 = (char *)&v25 - v15;
  MEMORY[0x1F4188790](v18);
  sub_1B7383C60();

  uint64_t v21 = *(void (**)(char *, char *, uint64_t))(v13 + 32);
  v21(v20, (char *)&v25 - v15, v12);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v13 + 56))(v20, 0, 1, v12);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v20, 1, v12) == 1)
  {
LABEL_10:
    sub_1B735B684((uint64_t)v20, &qword_1E9E59110);
    goto LABEL_11;
  }
  uint64_t v22 = v26;
  v21(v26, v20, v12);
  char v23 = (void *)sub_1B7383C50();
  objc_msgSend(v2, sel_setDefaultActionURL_, v23);

  (*(void (**)(char *, uint64_t))(v13 + 8))(v22, v12);
LABEL_11:
  sub_1B73597EC(v27, v2);
  return v2;
}

id sub_1B735A2B8()
{
  id v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F445A8]), sel_init);
  sub_1B72944F4();
  unint64_t v1 = (void *)sub_1B7383FA0();
  swift_bridgeObjectRelease();
  objc_msgSend(v0, sel_setTitle_, v1);

  id v2 = objc_msgSend(self, sel_sharedMonitor);
  objc_msgSend(v2, sel_isKeychainSyncEnabled);

  sub_1B72944F4();
  uint64_t v3 = (void *)sub_1B7383FA0();
  swift_bridgeObjectRelease();
  objc_msgSend(v0, sel_setBody_, v3);

  id v4 = (void *)sub_1B7383FA0();
  objc_msgSend(v0, sel_setCategoryIdentifier_, v4);

  return v0;
}

uint64_t sub_1B735A448(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD00000000000003BLL && a2 == 0x80000001B73A73A0 || (sub_1B7384590() & 1) != 0) {
    return 1;
  }
  if (a1 == 0xD000000000000037 && a2 == 0x80000001B73A73E0 || (sub_1B7384590() & 1) != 0) {
    return 2;
  }
  if (a1 == 0xD000000000000039 && a2 == 0x80000001B73A7420 || (sub_1B7384590() & 1) != 0) {
    return 3;
  }
  if (a1 == 0xD00000000000002BLL && a2 == 0x80000001B73A7030 || (sub_1B7384590() & 1) != 0) {
    return 4;
  }
  if (sub_1B7383FC0() == a1 && v5 == a2)
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  char v6 = sub_1B7384590();
  swift_bridgeObjectRelease();
  if (v6) {
    return 6;
  }
  if (sub_1B7383FC0() == a1 && v7 == a2)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  char v8 = sub_1B7384590();
  swift_bridgeObjectRelease();
  if (v8) {
    return 5;
  }
  if (a1 == 0xD000000000000026 && a2 == 0x80000001B73A7460) {
    return 8;
  }
  if (sub_1B7384590()) {
    return 8;
  }
  return 0;
}

uint64_t sub_1B735A6D8(void *a1, uint64_t a2, void (**a3)(void))
{
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = a3;
  _Block_copy(a3);
  id v6 = objc_msgSend(a1, sel_notification);
  uint64_t v7 = &selRef_schedulePeriodicReport;
  id v8 = objc_msgSend(v6, sel_request);

  uint64_t v9 = &selRef_description;
  id v10 = objc_msgSend(v8, sel_identifier);

  uint64_t v11 = sub_1B7383FC0();
  uint64_t v13 = v12;

  uint64_t v14 = sub_1B735A448(v11, v13);
  LOBYTE(v11) = v15;
  swift_bridgeObjectRelease();
  if ((v11 & 1) == 0)
  {
    id v16 = objc_msgSend(a1, sel_actionIdentifier);
    uint64_t v17 = sub_1B7383FC0();
    uint64_t v19 = v18;

    if (sub_1B7383FC0() == v17 && v20 == v19)
    {
      uint64_t v21 = 0;
LABEL_10:
      swift_bridgeObjectRelease();
      goto LABEL_11;
    }
    uint64_t v22 = v5;
    char v23 = sub_1B7384590();
    swift_bridgeObjectRelease();
    if (v23)
    {
      uint64_t v21 = 0;
      uint64_t v5 = v22;
      uint64_t v7 = &selRef_schedulePeriodicReport;
LABEL_11:
      swift_bridgeObjectRelease();
LABEL_12:
      id v25 = objc_msgSend(a1, sel_notification);
      id v26 = [v25 v7[226]];

      id v27 = objc_msgSend(v26, sel_content);
      id v28 = objc_msgSend(v27, sel_userInfo);

      uint64_t v29 = sub_1B7383F80();
      sub_1B7356350(v14, v21, v29, (uint64_t)sub_1B735AC78, v5);
      swift_release();
      return swift_bridgeObjectRelease();
    }
    uint64_t v5 = v22;
    if (sub_1B7383FC0() == v17 && v24 == v19)
    {
      uint64_t v21 = 1;
      uint64_t v7 = &selRef_schedulePeriodicReport;
      goto LABEL_10;
    }
    char v31 = sub_1B7384590();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v7 = &selRef_schedulePeriodicReport;
    uint64_t v9 = &selRef_description;
    if (v31)
    {
      uint64_t v21 = 1;
      goto LABEL_12;
    }
  }
  if (qword_1E9E58F28 != -1) {
    swift_once();
  }
  uint64_t v32 = sub_1B7383E40();
  __swift_project_value_buffer(v32, (uint64_t)qword_1E9E5B9C0);
  id v33 = a1;
  id v34 = sub_1B7383E10();
  os_log_type_t v35 = sub_1B73841C0();
  if (os_log_type_enabled(v34, v35))
  {
    uint64_t v36 = swift_slowAlloc();
    uint64_t v47 = swift_slowAlloc();
    uint64_t v48 = v47;
    *(_DWORD *)uint64_t v36 = 136315394;
    id v37 = objc_msgSend(v33, sel_notification);
    id v38 = [v37 v7[226]];

    id v39 = [v38 v9[198]];
    uint64_t v40 = sub_1B7383FC0();
    unint64_t v42 = v41;

    sub_1B7367544(v40, v42, &v48);
    sub_1B7384250();

    swift_bridgeObjectRelease();
    *(_WORD *)(v36 + 12) = 2080;
    id v43 = objc_msgSend(v33, sel_actionIdentifier);
    uint64_t v44 = sub_1B7383FC0();
    unint64_t v46 = v45;

    sub_1B7367544(v44, v46, &v48);
    sub_1B7384250();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1B728F000, v34, v35, "Could not get notification type (%s) or response type (%s) for user notification", (uint8_t *)v36, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x1BA9BDB10](v47, -1, -1);
    MEMORY[0x1BA9BDB10](v36, -1, -1);
  }
  else
  {
  }
  a3[2](a3);
  return swift_release();
}

uint64_t sub_1B735AC40()
{
  _Block_release(*(const void **)(v0 + 16));
  return MEMORY[0x1F4186498](v0, 24, 7);
}

uint64_t sub_1B735AC78()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 16) + 16))();
}

uint64_t sub_1B735AC88()
{
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
  swift_release();
  return MEMORY[0x1F4186498](v0, 72, 7);
}

uint64_t sub_1B735ACD8()
{
  return sub_1B7356638(*(void **)(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32), *(void *)(v0 + 40), *(void *)(v0 + 48), *(uint64_t (**)(void))(v0 + 56));
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

unint64_t sub_1B735AD04()
{
  unint64_t result = qword_1E9E59040;
  if (!qword_1E9E59040)
  {
    sub_1B7383E50();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9E59040);
  }
  return result;
}

unint64_t sub_1B735AD50()
{
  unint64_t result = qword_1E9E59050;
  if (!qword_1E9E59050)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9E59048);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9E59050);
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

uint64_t sub_1B735ADF4()
{
  return (*(uint64_t (**)(void))(v0 + 16))(0);
}

uint64_t sub_1B735AE20()
{
  _Block_release(*(const void **)(v0 + 48));
  return MEMORY[0x1F4186498](v0, 64, 7);
}

uint64_t sub_1B735AE80()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v4 = v0[4];
  uint64_t v5 = (void *)v0[5];
  uint64_t v7 = (void *)v0[6];
  id v6 = (void *)v0[7];
  id v8 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v8;
  *id v8 = v1;
  v8[1] = sub_1B735B9EC;
  uint64_t v9 = (uint64_t (*)(int, int, int, void *, void *, void *))((char *)&dword_1E9E59060 + dword_1E9E59060);
  return v9(v2, v3, v4, v5, v7, v6);
}

uint64_t sub_1B735AF58()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v4 = (int *)v0[4];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  *uint64_t v5 = v1;
  v5[1] = sub_1B735B9EC;
  id v6 = (uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_1E9E59380 + dword_1E9E59380);
  return v6(v2, v3, v4);
}

uint64_t sub_1B735B01C(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  id v6 = (int *)v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_1B735B9EC;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_1E9E59388 + dword_1E9E59388);
  return v8(a1, v4, v5, v6);
}

uint64_t sub_1B735B0E8(uint64_t a1, unint64_t a2)
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

unint64_t sub_1B735B140()
{
  unint64_t result = qword_1E9E59090;
  if (!qword_1E9E59090)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_1E9E59090);
  }
  return result;
}

void type metadata accessor for UNAuthorizationStatus(uint64_t a1)
{
}

uint64_t sub_1B735B19C(uint64_t a1)
{
  return a1;
}

_OWORD *sub_1B735B1F0(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_1B735B200(uint64_t a1, uint64_t a2)
{
  return a2;
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

uint64_t sub_1B735B2AC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void sub_1B735B308(uint64_t a1)
{
  sub_1B7355694(a1, *(void *)(v1 + 16));
}

uint64_t sub_1B735B310()
{
  _Block_release(*(const void **)(v0 + 16));

  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_1B735B350()
{
  long long v2 = *(const void **)(v0 + 16);
  uint64_t v3 = *(void **)(v0 + 24);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v4;
  *uint64_t v4 = v1;
  v4[1] = sub_1B735B9EC;
  uint64_t v5 = (uint64_t (*)(const void *, void *))((char *)&dword_1E9E590C0 + dword_1E9E590C0);
  return v5(v2, v3);
}

uint64_t sub_1B735B404(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  id v6 = (int *)v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_1B735B4D0;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_1E9E59388 + dword_1E9E59388);
  return v8(a1, v4, v5, v6);
}

uint64_t sub_1B735B4D0()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_1B735B5C8()
{
  uint64_t v2 = (void *)v0[2];
  uint64_t v3 = (void *)v0[3];
  uint64_t v4 = (void *)v0[4];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  *uint64_t v5 = v1;
  v5[1] = sub_1B735B9EC;
  id v6 = (uint64_t (*)(void *, void *, void *))((char *)&dword_1E9E590E8 + dword_1E9E590E8);
  return v6(v2, v3, v4);
}

uint64_t sub_1B735B684(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t objectdestroy_64Tm()
{
  _Block_release(*(const void **)(v0 + 24));
  return MEMORY[0x1F4186498](v0, 40, 7);
}

uint64_t sub_1B735B72C()
{
  uint64_t v2 = (void *)v0[2];
  uint64_t v3 = (void *)v0[3];
  uint64_t v4 = (void *)v0[4];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  *uint64_t v5 = v1;
  v5[1] = sub_1B735B9EC;
  id v6 = (uint64_t (*)(void *, void *, void *))((char *)&dword_1E9E59118 + dword_1E9E59118);
  return v6(v2, v3, v4);
}

uint64_t objectdestroy_28Tm()
{
  swift_unknownObjectRelease();
  swift_release();
  return MEMORY[0x1F4186498](v0, 48, 7);
}

void sub_1B735B828(char a1, uint64_t a2)
{
  sub_1B7353320(a1, a2, *(void *)(v2 + 16));
}

uint64_t sub_1B735B830()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 16) + 16))();
}

uint64_t sub_1B735B844()
{
  swift_release();
  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_1B735B87C(void *a1)
{
  return (*(uint64_t (**)(id))(v1 + 16))(objc_msgSend(a1, sel_authorizationStatus));
}

unint64_t sub_1B735B8B0()
{
  unint64_t result = qword_1E9E59150;
  if (!qword_1E9E59150)
  {
    sub_1B729E55C(255, &qword_1E9E59148);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9E59150);
  }
  return result;
}

uint64_t sub_1B735B90C(uint64_t a1)
{
  return a1;
}

void type metadata accessor for UNNotificationPresentationOptions(uint64_t a1)
{
}

void type metadata accessor for WBSPasswordsNotificationType(uint64_t a1)
{
}

void type metadata accessor for WBSPasswordsNotificationResponseType(uint64_t a1)
{
}

void sub_1B735B970(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t WBSSavedAccountStore.passkeysDataOnInternalQueue.getter()
{
  return sub_1B735C308((uint64_t)sub_1B72AE440, 12);
}

uint64_t sub_1B735BA0C(void *a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9E592F0);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1B7390470;
  *(void *)(inited + 32) = sub_1B7383FC0();
  *(void *)(inited + 40) = v3;
  uint64_t v4 = a1[2];
  swift_bridgeObjectRetain();
  uint64_t v5 = (void *)sub_1B7383FA0();
  id v63 = self;
  id v6 = objc_msgSend(v63, sel_cborWithUTF8String_, v5);

  uint64_t v7 = sub_1B73775C4(v6, v4);
  if (!v7 || (id v8 = objc_msgSend(v7, sel_string), v7, !v8))
  {
    swift_bridgeObjectRelease();
    __break(1u);
LABEL_11:
    uint64_t result = swift_bridgeObjectRelease();
    __break(1u);
    return result;
  }
  uint64_t v9 = sub_1B7383FC0();
  uint64_t v11 = v10;
  swift_bridgeObjectRelease();

  uint64_t v12 = MEMORY[0x1E4FBB1A0];
  *(void *)(inited + 72) = MEMORY[0x1E4FBB1A0];
  *(void *)(inited + 48) = v9;
  *(void *)(inited + 56) = v11;
  *(void *)(inited + 80) = sub_1B7383FC0();
  *(void *)(inited + 88) = v13;
  unint64_t v60 = a1[6];
  uint64_t v61 = a1[5];
  *(void *)(inited + 120) = MEMORY[0x1E4F277B8];
  *(void *)(inited + 96) = v61;
  *(void *)(inited + 104) = v60;
  *(void *)(inited + 128) = sub_1B7383FC0();
  *(void *)(inited + 136) = v14;
  uint64_t v15 = a1[3];
  uint64_t v16 = a1[4];
  *(void *)(inited + 168) = v12;
  *(void *)(inited + 144) = v15;
  *(void *)(inited + 152) = v16;
  *(void *)(inited + 176) = sub_1B7383FC0();
  *(void *)(inited + 184) = v17;
  uint64_t v18 = (int *)type metadata accessor for WBSKeychainPasskey();
  uint64_t v19 = (char *)a1 + v18[8];
  uint64_t v20 = sub_1B7383D30();
  *(void *)(inited + 216) = v20;
  boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0((uint64_t *)(inited + 192));
  uint64_t v22 = *(void (**)(uint64_t *, char *, uint64_t))(*(void *)(v20 - 8) + 16);
  v22(boxed_opaque_existential_0, v19, v20);
  *(void *)(inited + 224) = sub_1B7383FC0();
  *(void *)(inited + 232) = v23;
  uint64_t v24 = (char *)a1 + v18[9];
  *(void *)(inited + 264) = v20;
  id v25 = __swift_allocate_boxed_opaque_existential_0((uint64_t *)(inited + 240));
  v22(v25, v24, v20);
  *(void *)(inited + 272) = sub_1B7383FC0();
  *(void *)(inited + 280) = v26;
  char v27 = *((unsigned char *)a1 + v18[10]);
  uint64_t v28 = MEMORY[0x1E4FBB390];
  *(void *)(inited + 312) = MEMORY[0x1E4FBB390];
  *(unsigned char *)(inited + 288) = v27;
  *(void *)(inited + 320) = sub_1B7383FC0();
  *(void *)(inited + 328) = v29;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1B735F794(v61, v60);
  uint64_t v30 = (void *)sub_1B7383FA0();
  id v31 = objc_msgSend(v63, sel_cborWithUTF8String_, v30);

  uint64_t v32 = sub_1B73775C4(v31, v4);
  if (!v32) {
    goto LABEL_11;
  }
  id v33 = objc_msgSend(v32, sel_data);

  if (!v33) {
    goto LABEL_11;
  }
  uint64_t v34 = sub_1B7383D00();
  unint64_t v36 = v35;
  swift_bridgeObjectRelease();

  uint64_t v37 = sub_1B7383CE0();
  uint64_t v39 = v38;
  sub_1B735B0E8(v34, v36);
  uint64_t v40 = MEMORY[0x1E4FBB1A0];
  *(void *)(inited + 360) = MEMORY[0x1E4FBB1A0];
  *(void *)(inited + 336) = v37;
  *(void *)(inited + 344) = v39;
  unint64_t v41 = sub_1B73757E4(inited);
  uint64_t v42 = sub_1B7383FC0();
  uint64_t v44 = v43;
  unint64_t v45 = (void *)((char *)a1 + v18[11]);
  uint64_t v46 = *v45;
  uint64_t v47 = v45[1];
  uint64_t v66 = v40;
  *(void *)&long long v65 = v46;
  *((void *)&v65 + 1) = v47;
  sub_1B735B1F0(&v65, v64);
  swift_bridgeObjectRetain();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  unint64_t v67 = 0x8000000000000000;
  sub_1B7358548(v64, v42, v44, isUniquelyReferenced_nonNull_native);
  unint64_t v67 = v41;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (objc_msgSend(v62, sel_isForTesting))
  {
    uint64_t v49 = sub_1B7383FC0();
    uint64_t v51 = v50;
    uint64_t v52 = a1[2];
    swift_bridgeObjectRetain();
    uint64_t v53 = (void *)sub_1B7383FA0();
    id v54 = objc_msgSend(v63, sel_cborWithUTF8String_, v53);

    uint64_t v55 = sub_1B73775C4(v54, v52);
    if (v55)
    {
      unsigned __int8 v56 = objc_msgSend(v55, sel_BOOLValue);
      swift_bridgeObjectRelease();

      uint64_t v66 = v28;
      LOBYTE(v65) = v56;
      sub_1B735B1F0(&v65, v64);
      unint64_t v57 = v67;
      char v58 = swift_isUniquelyReferenced_nonNull_native();
      unint64_t v67 = 0x8000000000000000;
      sub_1B7358548(v64, v49, v51, v58);
      unint64_t v67 = v57;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    else
    {
      swift_bridgeObjectRelease();
      sub_1B7378974(v49, v51, &v65);
      swift_bridgeObjectRelease();
      sub_1B735B684((uint64_t)&v65, &qword_1E9E590A8);
    }
  }
  return v67;
}

uint64_t sub_1B735BF60(uint64_t a1, uint64_t a2)
{
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    goto LABEL_6;
  }
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = a1;
  *(void *)(v6 + 24) = a2;
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = sub_1B735FDF0;
  *(void *)(v7 + 24) = v6;
  swift_retain();
  v10[0] = v2;
  sub_1B735FE18(v10);
  if (v3)
  {
    swift_release();
    return swift_release();
  }
  swift_release();
  char isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  uint64_t result = swift_release();
  if (isEscapingClosureAtFileLocation)
  {
    __break(1u);
LABEL_6:
    v10[0] = 0;
    v10[1] = 0xE000000000000000;
    sub_1B7384380();
    sub_1B7384070();
    v10[3] = v2;
    type metadata accessor for WBSPasskeyStore();
    sub_1B73843F0();
    sub_1B7384070();
    uint64_t result = sub_1B7384460();
    __break(1u);
  }
  return result;
}

uint64_t sub_1B735C140(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = v2;
  if (swift_task_isCurrentExecutor())
  {
    uint64_t v7 = swift_allocObject();
    *(void *)(v7 + 16) = a1;
    *(void *)(v7 + 24) = a2;
    uint64_t v8 = sub_1B735F8D0((uint64_t)sub_1B735FC0C, v7, v4);
    if (v3)
    {
      swift_release();
      return v8;
    }
    char isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
    swift_release();
    if ((isEscapingClosureAtFileLocation & 1) == 0) {
      return v8;
    }
    __break(1u);
  }
  sub_1B7384380();
  sub_1B7384070();
  type metadata accessor for WBSPasskeyStore();
  sub_1B73843F0();
  sub_1B7384070();
  uint64_t result = sub_1B7384460();
  __break(1u);
  return result;
}

uint64_t WBSSavedAccountStore.recentlyDeletedPasskeysDataOnInternalQueue.getter()
{
  return sub_1B735C308((uint64_t)sub_1B72AE3DC, 22);
}

uint64_t sub_1B735C308(uint64_t a1, uint64_t a2)
{
  id v5 = objc_msgSend(v2, sel_passkeyStore);
  uint64_t v9 = v2;
  uint64_t v6 = sub_1B729E6AC(a1, (uint64_t)v8, (uint64_t)"SafariCore/WBSSavedAccountStore.swift", 37, 2, a2, (uint64_t)&unk_1F105AEA0, (uint64_t)sub_1B729E938, sub_1B729E854);
  swift_release();
  return v6;
}

uint64_t WBSSavedAccountStore.passkeyDataForPasskeyCredentialID(onInternalQueue:)(uint64_t a1, uint64_t a2)
{
  id v5 = objc_msgSend(v2, sel_passkeyStore);
  uint64_t v9 = a1;
  uint64_t v10 = a2;
  uint64_t v11 = v2;
  uint64_t v6 = sub_1B729E6AC((uint64_t)sub_1B735C78C, (uint64_t)v8, (uint64_t)"SafariCore/WBSSavedAccountStore.swift", 37, 2, 32, (uint64_t)&unk_1F105AEA0, (uint64_t)sub_1B729E938, sub_1B729E854);
  swift_release();
  return v6;
}

void sub_1B735C494(uint64_t a1@<X1>, unint64_t a2@<X2>, uint64_t *a3@<X8>)
{
  uint64_t v7 = type metadata accessor for WBSKeychainPasskey();
  MEMORY[0x1F4188790](v7 - 8);
  uint64_t v9 = (void *)((char *)v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v10 = sub_1B7383FC0();
  sub_1B735FF3C(a1, a2, v10, v11, 0, (uint64_t)v9);
  if (v3)
  {
    swift_bridgeObjectRelease();
    if (qword_1E9E58F28 != -1) {
      swift_once();
    }
    uint64_t v12 = sub_1B7383E40();
    __swift_project_value_buffer(v12, (uint64_t)qword_1E9E5B9C0);
    sub_1B735F794(a1, a2);
    sub_1B735F794(a1, a2);
    uint64_t v13 = sub_1B7383E10();
    os_log_type_t v14 = sub_1B73841C0();
    if (os_log_type_enabled(v13, v14))
    {
      uint64_t v21 = a3;
      uint64_t v15 = (uint8_t *)swift_slowAlloc();
      uint64_t v16 = swift_slowAlloc();
      uint64_t v23 = v16;
      *(_DWORD *)uint64_t v15 = 136315138;
      v20[1] = v15 + 4;
      uint64_t v17 = sub_1B7383CE0();
      uint64_t v22 = sub_1B7367544(v17, v18, &v23);
      sub_1B7384250();
      a3 = v21;
      swift_bridgeObjectRelease();
      sub_1B735B0E8(a1, a2);
      sub_1B735B0E8(a1, a2);
      _os_log_impl(&dword_1B728F000, v13, v14, "Could not find passkey with ID: %s", v15, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1BA9BDB10](v16, -1, -1);
      MEMORY[0x1BA9BDB10](v15, -1, -1);
    }
    else
    {
      sub_1B735B0E8(a1, a2);
      sub_1B735B0E8(a1, a2);
    }

    uint64_t v19 = MEMORY[0x1E4FBC860];
  }
  else
  {
    swift_bridgeObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9E592E8);
    uint64_t v19 = swift_allocObject();
    *(_OWORD *)(v19 + 16) = xmmword_1B7390260;
    *(void *)(v19 + 32) = sub_1B735BA0C(v9);
    sub_1B735F980((uint64_t)v9, (uint64_t (*)(void))type metadata accessor for WBSKeychainPasskey);
  }
  *a3 = v19;
}

void sub_1B735C78C(uint64_t *a1@<X8>)
{
  sub_1B735C494(*(void *)(v1 + 16), *(void *)(v1 + 24), a1);
}

uint64_t WBSSavedAccountStore.updateUserVisibleName(_:forPasskeyWith:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4[4] = a3;
  v4[5] = v3;
  v4[2] = a1;
  v4[3] = a2;
  return MEMORY[0x1F4188298](sub_1B735C90C, 0, 0);
}

uint64_t sub_1B735C90C()
{
  *(void *)(v0 + 48) = objc_msgSend(*(id *)(v0 + 40), sel_passkeyStore);
  type metadata accessor for WBSPasskeyStore();
  sub_1B735FCD0(&qword_1E9E59218, (void (*)(uint64_t))type metadata accessor for WBSPasskeyStore);
  uint64_t v2 = sub_1B7384160();
  return MEMORY[0x1F4188298](sub_1B735C9E0, v2, v1);
}

uint64_t sub_1B735C9E0()
{
  sub_1B7360514(*(void *)(v0 + 16), *(void *)(v0 + 24), *(void **)(v0 + 32));
  *(void *)(v0 + 56) = 0;
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_1B735CAA4()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_1B735CC8C(int a1, void *a2, void *aBlock, void *a4)
{
  v4[2] = a2;
  v4[3] = a4;
  v4[4] = _Block_copy(aBlock);
  v4[5] = sub_1B7383FC0();
  v4[6] = v7;
  id v8 = a2;
  id v9 = a4;
  return MEMORY[0x1F4188298](sub_1B735CD28, 0, 0);
}

uint64_t sub_1B735CD28()
{
  *(void *)(v0 + 56) = objc_msgSend(*(id *)(v0 + 24), sel_passkeyStore);
  type metadata accessor for WBSPasskeyStore();
  sub_1B735FCD0(&qword_1E9E59218, (void (*)(uint64_t))type metadata accessor for WBSPasskeyStore);
  uint64_t v2 = sub_1B7384160();
  return MEMORY[0x1F4188298](sub_1B735CDFC, v2, v1);
}

uint64_t sub_1B735CDFC()
{
  sub_1B7360514(*(void *)(v0 + 40), *(void *)(v0 + 48), *(void **)(v0 + 16));
  *(void *)(v0 + 64) = 0;
  uint64_t v2 = *(void **)(v0 + 24);
  uint64_t v1 = *(void *)(v0 + 32);
  uint64_t v3 = *(void **)(v0 + 16);
  swift_release();

  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, void))(v1 + 16))(v1, 0);
  _Block_release(*(const void **)(v0 + 32));
  uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
  return v4();
}

uint64_t sub_1B735CEFC()
{
  uint64_t v1 = *(void **)(v0 + 64);
  uint64_t v3 = *(void **)(v0 + 24);
  uint64_t v2 = *(void *)(v0 + 32);
  uint64_t v4 = *(void **)(v0 + 16);
  swift_release();

  swift_bridgeObjectRelease();
  id v5 = (void *)sub_1B7383C30();

  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v5);
  _Block_release(*(const void **)(v0 + 32));
  uint64_t v6 = *(uint64_t (**)(void))(v0 + 8);
  return v6();
}

Swift::Void __swiftcall WBSSavedAccountStore.updateUserVisibleName(onInternalQueue:forPasskeyWith:)(Swift::String onInternalQueue, WBSPublicKeyCredentialIdentifier forPasskeyWith)
{
  Class isa = forPasskeyWith.super.isa;
  object = onInternalQueue._object;
  uint64_t countAndFlagsBits = onInternalQueue._countAndFlagsBits;
  id v6 = objc_msgSend(v2, sel_passkeyStore, forPasskeyWith.super.isa, forPasskeyWith._credentialID, forPasskeyWith._groupID);
  v7[2] = countAndFlagsBits;
  v7[3] = object;
  void v7[4] = isa;
  sub_1B735BF60((uint64_t)sub_1B735D250, (uint64_t)v7);
  swift_release();
}

void sub_1B735D054(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  sub_1B7360514(a2, a3, a4);
  if (v4)
  {
    if (qword_1E9E58F28 != -1) {
      swift_once();
    }
    uint64_t v5 = sub_1B7383E40();
    __swift_project_value_buffer(v5, (uint64_t)qword_1E9E5B9C0);
    id v6 = v4;
    id v7 = v4;
    uint64_t v8 = sub_1B7383E10();
    os_log_type_t v9 = sub_1B73841C0();
    if (os_log_type_enabled(v8, v9))
    {
      uint64_t v10 = (uint8_t *)swift_slowAlloc();
      uint64_t v11 = swift_slowAlloc();
      uint64_t v13 = v11;
      *(_DWORD *)uint64_t v10 = 136446210;
      swift_getErrorValue();
      Swift::String v12 = Error.loggerDescription()();
      sub_1B7367544(v12._countAndFlagsBits, (unint64_t)v12._object, &v13);
      sub_1B7384250();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_1B728F000, v8, v9, "Failed to update passkey name: %{public}s", v10, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1BA9BDB10](v11, -1, -1);
      MEMORY[0x1BA9BDB10](v10, -1, -1);
    }
    else
    {
    }
  }
}

void sub_1B735D250(uint64_t a1)
{
  sub_1B735D054(a1, *(void *)(v1 + 16), *(void *)(v1 + 24), *(void **)(v1 + 32));
}

uint64_t WBSSavedAccountStore.deletePasskey(with:)(uint64_t a1)
{
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = v1;
  return MEMORY[0x1F4188298](sub_1B735D358, 0, 0);
}

uint64_t sub_1B735D358()
{
  *(void *)(v0 + 32) = objc_msgSend(*(id *)(v0 + 24), sel_passkeyStore);
  type metadata accessor for WBSPasskeyStore();
  sub_1B735FCD0(&qword_1E9E59218, (void (*)(uint64_t))type metadata accessor for WBSPasskeyStore);
  uint64_t v2 = sub_1B7384160();
  return MEMORY[0x1F4188298](sub_1B735D42C, v2, v1);
}

uint64_t sub_1B735D42C()
{
  sub_1B736099C(*(void **)(v0 + 16));
  *(void *)(v0 + 40) = 0;
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_1B735D4EC()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_1B735D6CC(void *a1, void *aBlock, void *a3)
{
  v3[2] = a1;
  v3[3] = a3;
  v3[4] = _Block_copy(aBlock);
  id v6 = a1;
  id v7 = a3;
  return MEMORY[0x1F4188298](sub_1B735D758, 0, 0);
}

uint64_t sub_1B735D758()
{
  *(void *)(v0 + 40) = objc_msgSend(*(id *)(v0 + 24), sel_passkeyStore);
  type metadata accessor for WBSPasskeyStore();
  sub_1B735FCD0(&qword_1E9E59218, (void (*)(uint64_t))type metadata accessor for WBSPasskeyStore);
  uint64_t v2 = sub_1B7384160();
  return MEMORY[0x1F4188298](sub_1B735D82C, v2, v1);
}

uint64_t sub_1B735D82C()
{
  sub_1B736099C(*(void **)(v0 + 16));
  *(void *)(v0 + 48) = 0;
  uint64_t v1 = *(void *)(v0 + 32);
  uint64_t v3 = *(void **)(v0 + 16);
  uint64_t v2 = *(void **)(v0 + 24);
  swift_release();

  (*(void (**)(uint64_t, void))(v1 + 16))(v1, 0);
  _Block_release(*(const void **)(v0 + 32));
  uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
  return v4();
}

uint64_t sub_1B735D910()
{
  uint64_t v1 = *(void **)(v0 + 48);
  uint64_t v3 = *(void **)(v0 + 24);
  uint64_t v2 = *(void *)(v0 + 32);
  uint64_t v4 = *(void **)(v0 + 16);
  swift_release();

  uint64_t v5 = (void *)sub_1B7383C30();
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v5);

  _Block_release(*(const void **)(v0 + 32));
  uint64_t v6 = *(uint64_t (**)(void))(v0 + 8);
  return v6();
}

Swift::Void __swiftcall WBSSavedAccountStore.deletePasskeyWithIdentifier(onInternalQueue:)(WBSPublicKeyCredentialIdentifier onInternalQueue)
{
  Class isa = onInternalQueue.super.isa;
  id v3 = objc_msgSend(v1, sel_passkeyStore, onInternalQueue._groupID);
  v4[2] = isa;
  sub_1B735BF60((uint64_t)sub_1B735DC3C, (uint64_t)v4);
  swift_release();
}

void sub_1B735DA48(uint64_t a1, void *a2)
{
  sub_1B736099C(a2);
  if (v2)
  {
    if (qword_1E9E58F28 != -1) {
      swift_once();
    }
    uint64_t v3 = sub_1B7383E40();
    __swift_project_value_buffer(v3, (uint64_t)qword_1E9E5B9C0);
    id v4 = v2;
    id v5 = v2;
    uint64_t v6 = sub_1B7383E10();
    os_log_type_t v7 = sub_1B73841C0();
    if (os_log_type_enabled(v6, v7))
    {
      uint64_t v8 = (uint8_t *)swift_slowAlloc();
      uint64_t v9 = swift_slowAlloc();
      uint64_t v11 = v9;
      *(_DWORD *)uint64_t v8 = 136446210;
      swift_getErrorValue();
      Swift::String v10 = Error.loggerDescription()();
      sub_1B7367544(v10._countAndFlagsBits, (unint64_t)v10._object, &v11);
      sub_1B7384250();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_1B728F000, v6, v7, "Failed to delete passkey: %{public}s", v8, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1BA9BDB10](v9, -1, -1);
      MEMORY[0x1BA9BDB10](v8, -1, -1);
    }
    else
    {
    }
  }
}

void sub_1B735DC3C(uint64_t a1)
{
  sub_1B735DA48(a1, *(void **)(v1 + 16));
}

uint64_t WBSSavedAccountStore.exportPasskeyCredentialWithID(onInternalQueue:)(uint64_t a1, uint64_t a2)
{
  id v5 = objc_msgSend(v2, sel_passkeyStore);
  uint64_t v9 = a1;
  uint64_t v10 = a2;
  uint64_t v6 = sub_1B729E6AC((uint64_t)sub_1B735E1A4, (uint64_t)v8, (uint64_t)"SafariCore/WBSSavedAccountStore.swift", 37, 2, 98, (uint64_t)&unk_1F105AE00, (uint64_t)sub_1B729E938, sub_1B735F834);
  swift_release();
  return v6;
}

void sub_1B735DDC0(void *a1@<X8>)
{
  unint64_t v3 = sub_1B735FD8C();
  uint64_t v4 = MEMORY[0x1E4FBB1A0];
  uint64_t v33 = sub_1B7384270();
  uint64_t v34 = v5;
  unint64_t v31 = v3;
  unint64_t v32 = v3;
  uint64_t v29 = v4;
  unint64_t v30 = v3;
  uint64_t v6 = sub_1B7384270();
  uint64_t v8 = v7;
  swift_bridgeObjectRelease();
  uint64_t v9 = sub_1B7384060();
  uint64_t v10 = v9 & 3;
  if (v9 <= 0) {
    uint64_t v10 = -(-v9 & 3);
  }
  if (v10 >= 1)
  {
    MEMORY[0x1BA9BBAF0](61, 0xE100000000000000, 4 - v10);
    uint64_t v33 = v6;
    uint64_t v34 = v8;
    swift_bridgeObjectRetain();
    sub_1B7384070();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  uint64_t v11 = (uint8_t *)sub_1B7383CA0();
  unint64_t v13 = v12;
  swift_bridgeObjectRelease();
  if (v13 >> 60 == 15)
  {
    __break(1u);
  }
  else
  {
    os_log_type_t v14 = sub_1B7360F8C(v11, (void *)v13, 0);
    if (v1)
    {
      sub_1B735F96C((uint64_t)v11, v13);
      if (qword_1E9E58F28 != -1) {
        swift_once();
      }
      uint64_t v16 = sub_1B7383E40();
      __swift_project_value_buffer(v16, (uint64_t)qword_1E9E5B9C0);
      id v17 = v1;
      id v18 = v1;
      uint64_t v19 = sub_1B7383E10();
      os_log_type_t v20 = sub_1B73841C0();
      if (os_log_type_enabled(v19, v20))
      {
        uint64_t v21 = (uint8_t *)swift_slowAlloc();
        uint64_t v22 = swift_slowAlloc();
        uint64_t v33 = v22;
        *(_DWORD *)uint64_t v21 = 136446210;
        swift_getErrorValue();
        Swift::String v23 = Error.loggerDescription()();
        sub_1B7367544(v23._countAndFlagsBits, (unint64_t)v23._object, &v33);
        sub_1B7384250();
        swift_bridgeObjectRelease();

        _os_log_impl(&dword_1B728F000, v19, v20, "Failed to export passkey: %{public}s", v21, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x1BA9BDB10](v22, -1, -1);
        MEMORY[0x1BA9BDB10](v21, -1, -1);
      }
      else
      {
      }
      id v28 = 0;
    }
    else
    {
      uint64_t v24 = (uint64_t)v14;
      unint64_t v25 = v15;
      uint64_t v26 = (void *)sub_1B7383CD0();
      char v27 = (void *)sub_1B7383CD0();
      id v28 = objc_msgSend(objc_allocWithZone((Class)WBSPair), sel_initWithFirst_second_, v26, v27, v29, v30, v31, v32);

      sub_1B735F96C((uint64_t)v11, v13);
      sub_1B735B0E8(v24, v25);
    }
    *a1 = v28;
  }
}

void sub_1B735E1A4(void *a1@<X8>)
{
}

uint64_t WBSSavedAccountStore.importPasskeyCredential(onInternalQueue:)(uint64_t a1)
{
  id v3 = objc_msgSend(v1, sel_passkeyStore);
  void v6[2] = a1;
  uint64_t v4 = sub_1B735C140((uint64_t)sub_1B735EA50, (uint64_t)v6);
  swift_release();
  return v4;
}

void sub_1B735E35C(uint64_t a1@<X0>, void *a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v7 = type metadata accessor for WBSKeychainPasskey();
  MEMORY[0x1F4188790](v7 - 8);
  uint64_t v9 = (char *)v48 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for WBSShareablePasskey();
  uint64_t v11 = MEMORY[0x1F4188790](v10);
  unint64_t v13 = (char *)v48 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v11);
  unint64_t v15 = (void *)((char *)v48 - v14);
  id v16 = objc_msgSend(a2, sel_second);
  if (v16
    && (id v17 = v16,
        long long v54 = xmmword_1B7390480,
        sub_1B7383CF0(),
        v17,
        unint64_t v18 = *((void *)&v54 + 1),
        *((void *)&v54 + 1) >> 60 != 15))
  {
    uint64_t v50 = a1;
    uint64_t v23 = v54;
    sub_1B7383D70();
    swift_allocObject();
    sub_1B735F794(v23, v18);
    sub_1B7383D60();
    sub_1B735FCD0(&qword_1E9E592D8, (void (*)(uint64_t))type metadata accessor for WBSShareablePasskey);
    sub_1B7383D50();
    if (v3)
    {
      sub_1B735F96C(v23, v18);
      swift_release();
      if (qword_1E9E58F28 != -1) {
        swift_once();
      }
      uint64_t v33 = sub_1B7383E40();
      __swift_project_value_buffer(v33, (uint64_t)qword_1E9E5B9C0);
      id v34 = v3;
      id v35 = v3;
      unint64_t v36 = sub_1B7383E10();
      os_log_type_t v37 = sub_1B73841C0();
      if (os_log_type_enabled(v36, v37))
      {
        unint64_t v51 = v18;
        uint64_t v38 = swift_slowAlloc();
        uint64_t v50 = 0;
        uint64_t v39 = (uint8_t *)v38;
        uint64_t v40 = swift_slowAlloc();
        *(void *)&long long v54 = v40;
        uint64_t v52 = v23;
        *(_DWORD *)uint64_t v39 = 136446210;
        swift_getErrorValue();
        Swift::String v41 = Error.loggerDescription()();
        uint64_t v53 = sub_1B7367544(v41._countAndFlagsBits, (unint64_t)v41._object, (uint64_t *)&v54);
        sub_1B7384250();
        swift_bridgeObjectRelease();

        _os_log_impl(&dword_1B728F000, v36, v37, "Failed to import passkey: %{public}s.", v39, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x1BA9BDB10](v40, -1, -1);
        MEMORY[0x1BA9BDB10](v39, -1, -1);

        sub_1B735F96C(v52, v51);
      }
      else
      {
        sub_1B735F96C(v23, v18);
      }
      *a3 = 0;
      a3[1] = 0;
    }
    else
    {
      uint64_t v49 = a3;
      sub_1B735F96C(v23, v18);
      swift_release();
      sub_1B735FD18((uint64_t)v13, (uint64_t)v15);
      uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9E59238);
      v48[1] = v48;
      uint64_t v25 = *(void *)(*(void *)(v24 - 8) + 64);
      MEMORY[0x1F4188790](v24 - 8);
      uint64_t v26 = (char *)v48 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v27 = sub_1B7383D30();
      uint64_t v52 = v23;
      uint64_t v28 = v27;
      uint64_t v29 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v27 - 8) + 56);
      unint64_t v51 = v18;
      uint64_t v30 = v29(v26, 1, 1, v27);
      v48[0] = v48;
      MEMORY[0x1F4188790](v30);
      v29(v26, 1, 1, v28);
      uint64_t v31 = sub_1B7383FC0();
      WBSPasskeyStore.importPasskey(_:to:inRecentlyDeleted:importedCredentialID:lastModified:created:)(v15, v31, v32, 0, 0, 0xF000000000000000, (uint64_t)v26, (uint64_t)v26, (uint64_t)v9);
      swift_bridgeObjectRelease();
      sub_1B735B684((uint64_t)v26, &qword_1E9E59238);
      sub_1B735B684((uint64_t)v26, &qword_1E9E59238);
      uint64_t v42 = *((void *)v9 + 5);
      unint64_t v43 = *((void *)v9 + 6);
      sub_1B735F794(v42, v43);
      uint64_t v44 = sub_1B7383CE0();
      uint64_t v46 = v45;
      sub_1B735B0E8(v42, v43);
      sub_1B735F96C(v52, v51);
      sub_1B735F980((uint64_t)v9, (uint64_t (*)(void))type metadata accessor for WBSKeychainPasskey);
      sub_1B735F980((uint64_t)v15, (uint64_t (*)(void))type metadata accessor for WBSShareablePasskey);
      uint64_t v47 = v49;
      *uint64_t v49 = v44;
      v47[1] = v46;
    }
  }
  else
  {
    if (qword_1E9E58F28 != -1) {
      swift_once();
    }
    uint64_t v19 = sub_1B7383E40();
    __swift_project_value_buffer(v19, (uint64_t)qword_1E9E5B9C0);
    os_log_type_t v20 = sub_1B7383E10();
    os_log_type_t v21 = sub_1B73841C0();
    if (os_log_type_enabled(v20, v21))
    {
      uint64_t v22 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v22 = 0;
      _os_log_impl(&dword_1B728F000, v20, v21, "Missing passkey data to import.", v22, 2u);
      MEMORY[0x1BA9BDB10](v22, -1, -1);
    }

    *a3 = 0;
    a3[1] = 0;
  }
}

void sub_1B735EA50(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  sub_1B735E35C(a1, *(void **)(v2 + 16), a2);
}

uint64_t WBSSavedAccountStore.savePasskey(for:credentialID:relyingPartyIdentifier:userHandle:privateKey:created:lastModified:passwordAccount:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  *(void *)(v9 + 168) = v15;
  *(void *)(v9 + 176) = v8;
  *(_OWORD *)(v9 + 152) = v14;
  *(_OWORD *)(v9 + 136) = v13;
  *(void *)(v9 + 120) = a7;
  *(void *)(v9 + 128) = a8;
  *(void *)(v9 + 104) = a5;
  *(void *)(v9 + 112) = a6;
  *(void *)(v9 + 88) = a3;
  *(void *)(v9 + 96) = a4;
  *(void *)(v9 + 72) = a1;
  *(void *)(v9 + 80) = a2;
  type metadata accessor for WBSKeychainPasskey();
  *(void *)(v9 + 184) = swift_task_alloc();
  type metadata accessor for WBSShareablePasskey();
  *(void *)(v9 + 192) = swift_task_alloc();
  uint64_t v10 = sub_1B7383F10();
  *(void *)(v9 + 200) = v10;
  *(void *)(v9 + 208) = *(void *)(v10 - 8);
  *(void *)(v9 + 216) = swift_task_alloc();
  *(void *)(v9 + 224) = swift_task_alloc();
  return MEMORY[0x1F4188298](sub_1B735ECA4, 0, 0);
}

uint64_t sub_1B735ECA4()
{
  uint64_t v29 = v0;
  uint64_t v2 = v0[17];
  unint64_t v1 = v0[18];
  uint64_t v4 = v0[15];
  unint64_t v3 = v0[16];
  uint64_t v5 = v0[10];
  uint64_t v6 = v0[9];
  swift_bridgeObjectRetain_n();
  sub_1B735F794(v4, v3);
  WBSKeychainPasskey.Metadata.init(name:displayName:userHandle:largeBlob:prfCredRandomWithUV:)(v6, v5, v6, v5, v4, v3, 0, 0xF000000000000000, (unint64_t *)v28, 0, 0xF000000000000000);
  uint64_t v7 = v28[0];
  v0[5] = v2;
  v0[6] = v1;
  sub_1B735F794(v2, v1);
  sub_1B735F7EC();
  sub_1B7383ED0();
  v0[29] = 0;
  uint64_t v9 = v0[27];
  uint64_t v8 = v0[28];
  uint64_t v10 = v0[25];
  uint64_t v11 = v0[26];
  uint64_t v12 = (void *)v0[24];
  long long v13 = (void *)v0[22];
  uint64_t v14 = v0[20];
  v28[0] = v7;
  uint64_t v16 = v0[13];
  uint64_t v15 = v0[14];
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 16))(v9, v8, v10);
  swift_bridgeObjectRetain();
  WBSShareablePasskey.init(relyingParty:metadata:privateKey:)(v16, v15, v28, v9, v12);
  v0[30] = objc_msgSend(v13, sel_passkeyStore);
  v0[31] = sub_1B7383CA0();
  v0[32] = v17;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9E59238);
  uint64_t v18 = swift_task_alloc();
  v0[33] = v18;
  uint64_t v19 = sub_1B7383D30();
  uint64_t v20 = *(void *)(v19 - 8);
  os_log_type_t v21 = *(void (**)(void))(v20 + 16);
  ((void (*)(uint64_t, uint64_t, uint64_t))v21)(v18, v14, v19);
  uint64_t v22 = *(void (**)(uint64_t, void, uint64_t, uint64_t))(v20 + 56);
  v22(v18, 0, 1, v19);
  uint64_t v23 = swift_task_alloc();
  v0[34] = v23;
  v21();
  v22(v23, 0, 1, v19);
  v0[35] = sub_1B7383FC0();
  v0[36] = v24;
  type metadata accessor for WBSPasskeyStore();
  sub_1B735FCD0(&qword_1E9E59218, (void (*)(uint64_t))type metadata accessor for WBSPasskeyStore);
  uint64_t v26 = sub_1B7384160();
  return MEMORY[0x1F4188298](sub_1B735F1BC, v26, v25);
}

uint64_t sub_1B735F1BC()
{
  uint64_t v1 = *(void *)(v0 + 232);
  WBSPasskeyStore.importPasskey(_:to:inRecentlyDeleted:importedCredentialID:lastModified:created:)(*(uint64_t **)(v0 + 192), *(void *)(v0 + 280), *(void *)(v0 + 288), 0, *(void *)(v0 + 248), *(void *)(v0 + 256), *(void *)(v0 + 264), *(void *)(v0 + 272), *(void *)(v0 + 184));
  *(void *)(v0 + 296) = v1;
  uint64_t v3 = *(void *)(v0 + 264);
  uint64_t v2 = *(void *)(v0 + 272);
  uint64_t v5 = *(void *)(v0 + 248);
  unint64_t v4 = *(void *)(v0 + 256);
  if (v1)
  {
    swift_bridgeObjectRelease();
    sub_1B735F96C(v5, v4);
    swift_release();
    sub_1B735B684(v2, &qword_1E9E59238);
    sub_1B735B684(v3, &qword_1E9E59238);
    uint64_t v6 = sub_1B735F4FC;
  }
  else
  {
    uint64_t v7 = *(void *)(v0 + 184);
    swift_bridgeObjectRelease();
    sub_1B735F96C(v5, v4);
    swift_release();
    sub_1B735B684(v2, &qword_1E9E59238);
    sub_1B735B684(v3, &qword_1E9E59238);
    sub_1B735F980(v7, (uint64_t (*)(void))type metadata accessor for WBSKeychainPasskey);
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v6 = sub_1B735F318;
  }
  return MEMORY[0x1F4188298](v6, 0, 0);
}

uint64_t sub_1B735F318()
{
  uint64_t v12 = *(void *)(v0 + 168);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1B7383CE0();
  id v1 = objc_allocWithZone((Class)WBSSavedAccount);
  swift_bridgeObjectRetain();
  uint64_t v2 = (void *)sub_1B7383FA0();
  swift_bridgeObjectRelease();
  uint64_t v3 = (void *)sub_1B7383FA0();
  swift_bridgeObjectRelease();
  unint64_t v4 = (void *)sub_1B7383FA0();
  swift_bridgeObjectRelease();
  uint64_t v5 = (void *)sub_1B7383FA0();
  swift_bridgeObjectRelease();
  id v6 = objc_msgSend(v1, sel_initWithPasskeyRelyingPartyID_user_passkeyUserHandle_passkeyCredentialID_, v2, v3, v4, v5);

  if (v12) {
    objc_msgSend(*(id *)(v0 + 176), sel__mergeSavedAccountWithPasskey_toSavedAccountWithPassword_, v6, *(void *)(v0 + 168));
  }
  uint64_t v7 = *(void *)(v0 + 224);
  uint64_t v8 = *(void *)(v0 + 200);
  uint64_t v9 = *(void *)(v0 + 208);
  sub_1B735F980(*(void *)(v0 + 192), (uint64_t (*)(void))type metadata accessor for WBSShareablePasskey);
  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v7, v8);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v10 = *(uint64_t (**)(id))(v0 + 8);
  return v10(v6);
}

uint64_t sub_1B735F4FC()
{
  uint64_t v16 = v0;
  uint64_t v1 = v0[28];
  uint64_t v2 = v0[25];
  uint64_t v3 = v0[26];
  sub_1B735F980(v0[24], (uint64_t (*)(void))type metadata accessor for WBSShareablePasskey);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);
  swift_task_dealloc();
  swift_task_dealloc();
  unint64_t v4 = (void *)v0[37];
  if (qword_1E9E58F28 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_1B7383E40();
  __swift_project_value_buffer(v5, (uint64_t)qword_1E9E5B9C0);
  id v6 = v4;
  id v7 = v4;
  uint64_t v8 = sub_1B7383E10();
  os_log_type_t v9 = sub_1B73841C0();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v10 = (uint8_t *)swift_slowAlloc();
    uint64_t v11 = swift_slowAlloc();
    uint64_t v15 = v11;
    *(_DWORD *)uint64_t v10 = 136446210;
    swift_getErrorValue();
    Swift::String v12 = Error.loggerDescription()();
    v0[8] = sub_1B7367544(v12._countAndFlagsBits, (unint64_t)v12._object, &v15);
    sub_1B7384250();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_1B728F000, v8, v9, "Failed to import passkey: %{public}s", v10, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1BA9BDB10](v11, -1, -1);
    MEMORY[0x1BA9BDB10](v10, -1, -1);
  }
  else
  {
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v13 = (uint64_t (*)(void))v0[1];
  return v13(0);
}

uint64_t sub_1B735F794(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    swift_retain();
  }
  return swift_retain();
}

unint64_t sub_1B735F7EC()
{
  unint64_t result = qword_1E9E59230;
  if (!qword_1E9E59230)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9E59230);
  }
  return result;
}

uint64_t sub_1B735F834(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = a1;
  *(void *)(v7 + 24) = a2;
  swift_retain();
  uint64_t v9 = a3;
  sub_1B729E8F0(&v9, &v10);
  uint64_t result = swift_release();
  if (!v3) {
    return v10;
  }
  return result;
}

uint64_t sub_1B735F8D0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = a1;
  *(void *)(v7 + 24) = a2;
  swift_retain();
  uint64_t v10 = a3;
  sub_1B735FC88(&v10, &v9);
  uint64_t result = swift_release();
  if (!v3) {
    return v9;
  }
  return result;
}

uint64_t sub_1B735F96C(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_1B735B0E8(a1, a2);
  }
  return a1;
}

uint64_t sub_1B735F980(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_1B735F9E0()
{
  _Block_release(*(const void **)(v0 + 24));
  return MEMORY[0x1F4186498](v0, 40, 7);
}

uint64_t sub_1B735FA28()
{
  uint64_t v2 = (void *)v0[2];
  uint64_t v3 = (void *)v0[3];
  unint64_t v4 = (void *)v0[4];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  *uint64_t v5 = v1;
  v5[1] = sub_1B735B9EC;
  id v6 = (uint64_t (*)(void *, void *, void *))((char *)&dword_1E9E592A0 + dword_1E9E592A0);
  return v6(v2, v3, v4);
}

uint64_t sub_1B735FAE4()
{
  _Block_release(*(const void **)(v0 + 32));
  return MEMORY[0x1F4186498](v0, 48, 7);
}

uint64_t sub_1B735FB34()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = (void *)v0[3];
  uint64_t v5 = (void *)v0[4];
  unint64_t v4 = (void *)v0[5];
  id v6 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v6;
  *id v6 = v1;
  v6[1] = sub_1B735B9EC;
  uint64_t v7 = (uint64_t (*)(int, void *, void *, void *))((char *)&dword_1E9E592B0 + dword_1E9E592B0);
  return v7(v2, v3, v5, v4);
}

uint64_t sub_1B735FBFC()
{
  return MEMORY[0x1F4186498](v0, 32, 7);
}

double sub_1B735FC0C@<D0>(_OWORD *a1@<X8>)
{
  (*(void (**)(long long *__return_ptr))(v1 + 16))(&v5);
  if (!v2)
  {
    double result = *(double *)&v5;
    *a1 = v5;
  }
  return result;
}

uint64_t sub_1B735FC50()
{
  swift_release();
  return MEMORY[0x1F4186498](v0, 32, 7);
}

double sub_1B735FC88@<D0>(void *a1@<X0>, _OWORD *a2@<X8>)
{
  (*(void (**)(long long *__return_ptr, void))(v2 + 16))(&v6, *a1);
  if (!v3)
  {
    double result = *(double *)&v6;
    *a2 = v6;
  }
  return result;
}

uint64_t sub_1B735FCD0(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_1B735FD18(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for WBSShareablePasskey();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1B735FD7C()
{
  return MEMORY[0x1F4186498](v0, 32, 7);
}

unint64_t sub_1B735FD8C()
{
  unint64_t result = qword_1E9E592E0;
  if (!qword_1E9E592E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9E592E0);
  }
  return result;
}

uint64_t sub_1B735FDE0()
{
  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_1B735FDF0()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_1B735FE18(void *a1)
{
  return (*(uint64_t (**)(void))(v1 + 16))(*a1);
}

uint64_t *__swift_allocate_boxed_opaque_existential_0(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t sub_1B735FEA8()
{
  return MEMORY[0x1F4186498](v0, 32, 7);
}

void sub_1B735FEC4(void *a1@<X8>)
{
}

void sub_1B735FEDC(uint64_t a1)
{
}

void sub_1B735FEF4(uint64_t *a1@<X8>)
{
}

void sub_1B735FF0C(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
}

void sub_1B735FF24(uint64_t a1)
{
}

id sub_1B735FF3C@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, char a5@<W4>, uint64_t a6@<X8>)
{
  result[1] = *(CFTypeRef *)MEMORY[0x1E4F143B8];
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9E592F8);
  MEMORY[0x1F4188790](v12 - 8);
  uint64_t v14 = (char *)&v40 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  CFDictionaryRef v15 = (const __CFDictionary *)sub_1B7362D84(a1, a2, a3, a4, a5);
  result[0] = 0;
  OSStatus v16 = SecItemCopyMatching(v15, result);
  CFTypeRef v17 = result[0];
  OSStatus v41 = v16;
  id v18 = objc_msgSend(self, sel_isCredentialExchangeEnabled);
  if (v18) {
    BOOL v19 = v16 == -25300;
  }
  else {
    BOOL v19 = 0;
  }
  if (!v19)
  {
LABEL_8:
    if (v16)
    {
      if (qword_1E9E58F28 != -1) {
        swift_once();
      }
      uint64_t v22 = sub_1B7383E40();
      __swift_project_value_buffer(v22, (uint64_t)qword_1E9E5B9C0);
      uint64_t v23 = sub_1B7383E10();
      os_log_type_t v24 = sub_1B73841C0();
      if (os_log_type_enabled(v23, v24))
      {
        uint64_t v25 = (uint8_t *)swift_slowAlloc();
        *(_DWORD *)uint64_t v25 = 67240192;
        swift_beginAccess();
        OSStatus v43 = v41;
        sub_1B7384250();
        _os_log_impl(&dword_1B728F000, v23, v24, "Could not fetch passkey: %{public}d", v25, 8u);
        MEMORY[0x1BA9BDB10](v25, -1, -1);
      }

      swift_beginAccess();
      OSStatus v26 = v41;
      sub_1B7367E60();
      swift_allocError();
      *(_DWORD *)uint64_t v27 = v26;
      *(unsigned char *)(v27 + 4) = 0;
      goto LABEL_30;
    }
    if (v17)
    {
      swift_unknownObjectRetain();
      self;
      uint64_t v28 = swift_dynamicCastObjCClass();
      if (v28)
      {
        uint64_t v29 = (void *)v28;
        swift_unknownObjectRetain();
        WBSKeychainPasskey.init(keychainDictionary:)(v29, (uint64_t)v14);
        uint64_t v30 = type metadata accessor for WBSKeychainPasskey();
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v30 - 8) + 48))(v14, 1, v30) != 1)
        {
          swift_unknownObjectRelease();

          sub_1B7368DAC((uint64_t)v14, a6, (uint64_t (*)(void))type metadata accessor for WBSKeychainPasskey);
          return (id)swift_unknownObjectRelease();
        }
        sub_1B735B684((uint64_t)v14, &qword_1E9E592F8);
        sub_1B7367E60();
        swift_allocError();
        *(_DWORD *)uint64_t v31 = 2;
        *(unsigned char *)(v31 + 4) = 1;
        swift_willThrow();
        swift_unknownObjectRelease();
LABEL_31:

        return (id)swift_unknownObjectRelease();
      }
      swift_unknownObjectRelease();
    }
    if (qword_1E9E58F28 != -1) {
      swift_once();
    }
    uint64_t v32 = sub_1B7383E40();
    __swift_project_value_buffer(v32, (uint64_t)qword_1E9E5B9C0);
    uint64_t v33 = sub_1B7383E10();
    os_log_type_t v34 = sub_1B73841C0();
    if (!os_log_type_enabled(v33, v34))
    {
LABEL_29:

      sub_1B7367E60();
      swift_allocError();
      *(_DWORD *)uint64_t v39 = 1;
      *(unsigned char *)(v39 + 4) = 1;
LABEL_30:
      swift_willThrow();
      goto LABEL_31;
    }
    id v35 = (uint8_t *)swift_slowAlloc();
    unint64_t v36 = (void *)swift_slowAlloc();
    *(_DWORD *)id v35 = 138477827;
    swift_beginAccess();
    if (result[0])
    {
      swift_unknownObjectRetain();
      self;
      uint64_t v37 = swift_dynamicCastObjCClass();
      if (v37)
      {
        uint64_t v38 = v37;
        uint64_t v42 = v37;
        sub_1B7384250();
LABEL_28:
        *unint64_t v36 = v38;
        _os_log_impl(&dword_1B728F000, v33, v34, "Unexpected keychain response: %{private}@", v35, 0xCu);
        __swift_instantiateConcreteTypeFromMangledName(&qword_1E9E59418);
        swift_arrayDestroy();
        MEMORY[0x1BA9BDB10](v36, -1, -1);
        MEMORY[0x1BA9BDB10](v35, -1, -1);
        goto LABEL_29;
      }
      swift_unknownObjectRelease();
    }
    uint64_t v42 = 0;
    sub_1B7384250();
    uint64_t v38 = 0;
    goto LABEL_28;
  }
  if (*MEMORY[0x1E4F3B5C8])
  {
    -[__CFDictionary __swift_setObject:forKeyedSubscript:](v15, sel___swift_setObject_forKeyedSubscript_, 0);
    id v20 = (id)*MEMORY[0x1E4F3B5D0];
    os_log_type_t v21 = (void *)sub_1B7383CD0();
    [(__CFDictionary *)v15 __swift_setObject:v21 forKeyedSubscript:v20];

    OSStatus v16 = SecItemCopyMatching(v15, result);
    CFTypeRef v17 = result[0];
    OSStatus v41 = v16;
    goto LABEL_8;
  }
  __break(1u);
  return v18;
}

void sub_1B7360514(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v7 = type metadata accessor for WBSKeychainPasskey();
  uint64_t v8 = MEMORY[0x1F4188790](v7 - 8);
  uint64_t v10 = (char *)v33 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v8);
  uint64_t v12 = (void *)((char *)v33 - v11);
  sub_1B7363174(a3);
  if (!v3)
  {
    v33[1] = a1;
    v33[2] = a2;
    os_log_type_t v34 = v12;
    id v13 = objc_msgSend(a3, sel_credentialID);
    sub_1B7383FC0();

    uint64_t v14 = sub_1B7383CA0();
    unint64_t v16 = v15;
    swift_bridgeObjectRelease();
    if (v16 >> 60 != 15)
    {
      id v17 = objc_msgSend(a3, sel_groupID);
      uint64_t v18 = sub_1B7383FC0();
      uint64_t v20 = v19;

      sub_1B735FF3C(v14, v16, v18, v20, 0, (uint64_t)v10);
      swift_bridgeObjectRelease();
      sub_1B735F96C(v14, v16);
      os_log_type_t v21 = v34;
      sub_1B7368DAC((uint64_t)v10, (uint64_t)v34, (uint64_t (*)(void))type metadata accessor for WBSKeychainPasskey);
      uint64_t v22 = v21 + 2;
      swift_bridgeObjectRetain();
      uint64_t v23 = (void *)sub_1B7383FA0();
      os_log_type_t v24 = self;
      id v25 = objc_msgSend(v24, sel_cborWithUTF8String_, v23);

      OSStatus v26 = (void *)sub_1B7383FA0();
      swift_bridgeObjectRelease();
      id v27 = objc_msgSend(v24, sel_cborWithUTF8String_, v26);

      if (!v27)
      {
        uint64_t v32 = (void *)sub_1B7378A78((unint64_t)v25);

        goto LABEL_12;
      }
      uint64_t v28 = *v22;
      if ((*v22 & 0xC000000000000001) == 0)
      {
LABEL_10:
        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        uint64_t v35 = *v22;
        *uint64_t v22 = 0x8000000000000000;
        sub_1B735869C((uint64_t)v27, v25, isUniquelyReferenced_nonNull_native);
        *uint64_t v22 = v35;

        swift_bridgeObjectRelease();
LABEL_12:
        sub_1B7367FC4(v21);
        sub_1B7368E14((uint64_t)v21, (uint64_t (*)(void))type metadata accessor for WBSKeychainPasskey);
        return;
      }
      if (v28 < 0) {
        uint64_t v29 = *v22;
      }
      else {
        uint64_t v29 = v28 & 0xFFFFFFFFFFFFFF8;
      }
      uint64_t v30 = sub_1B73842D0();
      if (!__OFADD__(v30, 1))
      {
        *uint64_t v22 = sub_1B7367B34(v29, v30 + 1);
        goto LABEL_10;
      }
      __break(1u);
    }
    __break(1u);
  }
}

void sub_1B736099C(void *a1)
{
  sub_1B7363174(a1);
  if (v1) {
    return;
  }
  id v52 = a1;
  id v3 = objc_msgSend(a1, sel_credentialID);
  sub_1B7383FC0();

  uint64_t v50 = sub_1B7383CA0();
  unint64_t v5 = v4;
  swift_bridgeObjectRelease();
  unint64_t v51 = v5;
  if (v5 >> 60 == 15)
  {
    __break(1u);
    goto LABEL_30;
  }
  unsigned int v6 = objc_msgSend(self, sel_isCredentialExchangeEnabled);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9E59300);
  uint64_t v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_1B73904B0;
  uint64_t v8 = (void *)*MEMORY[0x1E4F3B978];
  type metadata accessor for CFString(0);
  uint64_t v10 = v9;
  *(void *)(v7 + 32) = v8;
  uint64_t v11 = (void *)*MEMORY[0x1E4F3B9A0];
  *(void *)(v7 + 56) = v9;
  *(void *)(v7 + 64) = v11;
  uint64_t v12 = (void *)*MEMORY[0x1E4F3BD08];
  *(void *)(v7 + 120) = v9;
  *(void *)(v7 + 88) = v9;
  *(void *)(v7 + 96) = v12;
  uint64_t v13 = MEMORY[0x1E4FBB390];
  *(unsigned char *)(v7 + 128) = 1;
  uint64_t v14 = (void *)*MEMORY[0x1E4F3B878];
  *(void *)(v7 + 152) = v13;
  *(void *)(v7 + 160) = v14;
  unint64_t v15 = (void *)*MEMORY[0x1E4F3B880];
  *(void *)(v7 + 216) = v9;
  *(void *)(v7 + 184) = v9;
  *(void *)(v7 + 192) = v15;
  sub_1B729E55C(0, &qword_1E9E59330);
  id v16 = v8;
  id v17 = v11;
  id v18 = v12;
  id v19 = v14;
  id v20 = v15;
  os_log_type_t v21 = (void *)sub_1B73841A0();
  unsigned int v55 = v6;
  if (!v6)
  {
    id v24 = (id)*MEMORY[0x1E4F3B5D0];
    uint64_t v23 = v50;
    unint64_t v22 = v51;
    goto LABEL_7;
  }
  uint64_t v23 = v50;
  unint64_t v22 = v51;
  if (!*MEMORY[0x1E4F3B5C8])
  {
LABEL_30:
    __break(1u);
    goto LABEL_31;
  }
  id v24 = (id)*MEMORY[0x1E4F3B5C8];
LABEL_7:
  id v25 = (void *)sub_1B7383CD0();
  objc_msgSend(v21, sel___swift_setObject_forKeyedSubscript_, v25, v24);

  id v26 = objc_msgSend(v52, sel_groupID);
  uint64_t v27 = sub_1B7383FC0();
  uint64_t v29 = v28;

  if (v27 == sub_1B7383FC0() && v29 == v30)
  {
    swift_bridgeObjectRelease_n();
  }
  else
  {
    char v31 = sub_1B7384590();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v31 & 1) == 0)
    {
      uint64_t v32 = (void *)*MEMORY[0x1E4F3B858];
      if (!*MEMORY[0x1E4F3B858])
      {
LABEL_32:
        __break(1u);
        return;
      }
      v54[3] = v10;
      v54[0] = v32;
      id v33 = v32;
      id v34 = objc_msgSend(v52, sel_groupID);
      if (!v34)
      {
        sub_1B7383FC0();
        id v34 = (id)sub_1B7383FA0();
        swift_bridgeObjectRelease();
      }
      __swift_project_boxed_opaque_existential_1Tm(v54, v10);
      objc_msgSend(v21, sel___swift_setObject_forKeyedSubscript_, v34, sub_1B7384580());

      swift_unknownObjectRelease();
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v54);
    }
  }
  OSStatus v35 = SecItemDelete((CFDictionaryRef)v21);
  OSStatus v56 = v35;
  unsigned int v36 = v55;
  if (v35 != -25300) {
    unsigned int v36 = 0;
  }
  if (v36 != 1) {
    goto LABEL_20;
  }
  if (!*MEMORY[0x1E4F3B5C8])
  {
LABEL_31:
    __break(1u);
    goto LABEL_32;
  }
  objc_msgSend(v21, sel___swift_setObject_forKeyedSubscript_, 0);
  id v37 = (id)*MEMORY[0x1E4F3B5D0];
  uint64_t v38 = (void *)sub_1B7383CD0();
  objc_msgSend(v21, sel___swift_setObject_forKeyedSubscript_, v38, v37);

  OSStatus v35 = SecItemDelete((CFDictionaryRef)v21);
  OSStatus v56 = v35;
LABEL_20:
  if (v35)
  {
    if (qword_1E9E58F28 != -1) {
      swift_once();
    }
    uint64_t v39 = sub_1B7383E40();
    __swift_project_value_buffer(v39, (uint64_t)qword_1E9E5B9C0);
    uint64_t v40 = v52;
    OSStatus v41 = sub_1B7383E10();
    os_log_type_t v42 = sub_1B73841C0();
    if (os_log_type_enabled(v41, v42))
    {
      uint64_t v43 = swift_slowAlloc();
      id v53 = v21;
      uint64_t v44 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v43 = 138412546;
      v54[0] = v40;
      uint64_t v45 = v40;
      sub_1B7384250();
      *uint64_t v44 = v40;

      unint64_t v22 = v51;
      *(_WORD *)(v43 + 12) = 1024;
      swift_beginAccess();
      LODWORD(v54[0]) = v56;
      sub_1B7384250();
      _os_log_impl(&dword_1B728F000, v41, v42, "Failed to delete passkey for %@: %d", (uint8_t *)v43, 0x12u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_1E9E59418);
      swift_arrayDestroy();
      uint64_t v46 = v44;
      os_log_type_t v21 = v53;
      MEMORY[0x1BA9BDB10](v46, -1, -1);
      uint64_t v47 = v43;
      uint64_t v23 = v50;
      MEMORY[0x1BA9BDB10](v47, -1, -1);
    }
    else
    {

      OSStatus v41 = v40;
    }

    swift_beginAccess();
    OSStatus v48 = v56;
    sub_1B7367E60();
    swift_allocError();
    *(_DWORD *)uint64_t v49 = v48;
    *(unsigned char *)(v49 + 4) = 0;
    swift_willThrow();
  }

  sub_1B735F96C(v23, v22);
}

char *sub_1B7360F8C(uint8_t *a1, void *a2, char a3)
{
  uint64_t v27 = type metadata accessor for WBSShareablePasskey();
  MEMORY[0x1F4188790](v27);
  uint64_t v30 = (char *)&v25 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_1B7383F10();
  uint64_t v28 = *(void *)(v7 - 8);
  uint64_t v29 = v7;
  uint64_t v8 = MEMORY[0x1F4188790](v7);
  uint64_t v10 = (char *)&v25 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v8);
  uint64_t v31 = (uint64_t)&v25 - v11;
  uint64_t v12 = type metadata accessor for WBSKeychainPasskey();
  MEMORY[0x1F4188790](v12 - 8);
  uint64_t v14 = (char *)&v25 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_1B7383FC0();
  char v16 = a3;
  uint64_t v17 = v32;
  sub_1B735FF3C((uint64_t)a1, (unint64_t)a2, v15, v18, a3, (uint64_t)v14);
  if (v17)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    id v26 = v14;
    uint64_t v19 = v29;
    id v20 = v30;
    swift_bridgeObjectRelease();
    sub_1B7363320(a1, a2, v16 & 1, v31);
    uint64_t v21 = v26[3];
    uint64_t v22 = v26[4];
    uint64_t v33 = v26[2];
    uint64_t v23 = v28;
    (*(void (**)(char *, uint64_t, uint64_t))(v28 + 16))(v10, v31, v19);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    WBSShareablePasskey.init(relyingParty:metadata:privateKey:)(v21, v22, &v33, (uint64_t)v10, v20);
    sub_1B7383DA0();
    swift_allocObject();
    sub_1B7383D90();
    sub_1B7369508((unint64_t *)&qword_1E9E59400, 255, (void (*)(uint64_t))type metadata accessor for WBSShareablePasskey);
    uint64_t v10 = (char *)sub_1B7383D80();
    swift_release();
    sub_1B7368E14((uint64_t)v20, (uint64_t (*)(void))type metadata accessor for WBSShareablePasskey);
    (*(void (**)(uint64_t, uint64_t))(v23 + 8))(v31, v19);
    sub_1B7368E14((uint64_t)v26, (uint64_t (*)(void))type metadata accessor for WBSKeychainPasskey);
  }
  return v10;
}

void WBSPasskeyStore.importPasskey(_:to:inRecentlyDeleted:importedCredentialID:lastModified:created:)(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, int a4@<W3>, uint64_t a5@<X4>, unint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>)
{
  uint64_t v179 = a8;
  uint64_t v178 = a7;
  uint64_t v205 = a5;
  unint64_t v206 = a6;
  int v182 = a4;
  uint64_t v194 = a3;
  uint64_t v193 = a2;
  uint64_t v183 = a9;
  error[1] = *(CFErrorRef *)MEMORY[0x1E4F143B8];
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9E592F8);
  MEMORY[0x1F4188790](v10 - 8);
  v200 = (char *)&v177 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = type metadata accessor for WBSKeychainPasskey();
  v198 = *(void (***)(id, uint64_t, uint64_t, unint64_t))(v12 - 8);
  unint64_t v199 = v12;
  MEMORY[0x1F4188790](v12);
  v191 = (char *)&v177 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v192 = (uint64_t *)sub_1B7383F60();
  uint64_t v188 = *(v192 - 1);
  MEMORY[0x1F4188790](v192);
  v196 = (char *)&v177 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v190 = (void *)sub_1B7383F50();
  uint64_t v189 = *(v190 - 1);
  MEMORY[0x1F4188790](v190);
  v187 = (char *)&v177 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_1B7383F30();
  unint64_t v201 = *(void *)(v16 - 8);
  uint64_t v202 = v16;
  MEMORY[0x1F4188790](v16);
  uint64_t v18 = (char *)&v177 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v180 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9E59300);
  uint64_t v19 = swift_allocObject();
  *(_OWORD *)(v19 + 16) = xmmword_1B73904B0;
  id v20 = (void *)*MEMORY[0x1E4F3B720];
  type metadata accessor for CFString(0);
  uint64_t v22 = v21;
  *(void *)(v19 + 56) = v21;
  *(void *)(v19 + 32) = v20;
  uint64_t v23 = (int *)type metadata accessor for WBSShareablePasskey();
  uint64_t v24 = MEMORY[0x1E4FBB550];
  *(void *)(v19 + 64) = *(uint64_t *)((char *)a1 + v23[7]);
  uint64_t v25 = (void *)*MEMORY[0x1E4F3B6D0];
  *(void *)(v19 + 88) = v24;
  *(void *)(v19 + 96) = v25;
  id v26 = (void *)*MEMORY[0x1E4F3B6E0];
  *(void *)(v19 + 120) = v22;
  *(void *)(v19 + 128) = v26;
  uint64_t v27 = (void *)*MEMORY[0x1E4F3B710];
  *(void *)(v19 + 184) = v22;
  uint64_t v181 = v22;
  *(void *)(v19 + 152) = v22;
  *(void *)(v19 + 160) = v27;
  uint64_t v28 = *(uint64_t *)((char *)a1 + v23[8]);
  *(void *)(v19 + 216) = v24;
  *(void *)(v19 + 192) = v28;
  sub_1B729E55C(0, &qword_1E9E59308);
  id v29 = v20;
  id v186 = v25;
  id v185 = v26;
  id v30 = v27;
  CFDictionaryRef v31 = (const __CFDictionary *)sub_1B73841A0();
  v195 = (__CFString *)((char *)a1 + v23[6]);
  uint64_t v32 = sub_1B7383EB0();
  uint64_t v33 = MEMORY[0x1BA9BB920](v32);
  unint64_t v35 = v34;
  (*(void (**)(char *, uint64_t))(v201 + 8))(v18, v202);
  unint64_t v36 = v206;
  CFDictionaryRef v207 = v31;
  uint64_t v203 = v33;
  v184 = a1;
  if (v206 >> 60 == 15)
  {
    sub_1B7369508(&qword_1E9E59310, 255, MEMORY[0x1E4F251E8]);
    id v37 = v192;
    sub_1B7383EA0();
    switch(v35 >> 62)
    {
      case 1uLL:
        if (v33 >> 32 < (int)v33) {
          __break(1u);
        }
        sub_1B735F794(v33, v35);
        uint64_t v45 = v196;
        OSStatus v48 = v197;
        sub_1B7367D68((int)v33, v33 >> 32);
        uint64_t v47 = v48;
        sub_1B735B0E8(v33, v35);
        id v40 = v200;
        id v37 = v192;
        break;
      case 2uLL:
        uint64_t v42 = v33;
        uint64_t v43 = *(void *)(v33 + 16);
        uint64_t v44 = *(void *)(v33 + 24);
        sub_1B735F794(v42, v35);
        swift_retain();
        swift_retain();
        uint64_t v45 = v196;
        uint64_t v46 = v197;
        sub_1B7367D68(v43, v44);
        if (v46) {
          goto LABEL_86;
        }
        uint64_t v47 = 0;
        swift_release();
        swift_release();
        sub_1B735B0E8(v42, v35);
        id v40 = v200;
        break;
      case 3uLL:
        *(void *)((char *)&v210 + 6) = 0;
        *(void *)&long long v210 = 0;
        goto LABEL_8;
      default:
        *(void *)&long long v210 = v33;
        WORD4(v210) = v35;
        BYTE10(v210) = BYTE2(v35);
        BYTE11(v210) = BYTE3(v35);
        BYTE12(v210) = BYTE4(v35);
        BYTE13(v210) = BYTE5(v35);
LABEL_8:
        uint64_t v45 = v196;
        sub_1B7383E80();
        sub_1B735B0E8(v33, v35);
        id v40 = v200;
        uint64_t v47 = v197;
        break;
    }
    uint64_t v49 = v187;
    sub_1B7383E90();
    (*(void (**)(char *, uint64_t *))(v188 + 8))(v45, v37);
    sub_1B7383F40();
    OSStatus v41 = v47;
    (*(void (**)(char *, void *))(v189 + 8))(v49, v190);
    unint64_t v38 = *((void *)&v210 + 1);
    uint64_t v39 = v210;
    unint64_t v36 = v206;
  }
  else
  {
    unint64_t v38 = v206;
    uint64_t v39 = v205;
    id v40 = v200;
    OSStatus v41 = v197;
  }
  uint64_t v50 = sub_1B7383FC0();
  uint64_t v52 = v51;
  sub_1B7367E4C(v205, v36);
  sub_1B735FF3C(v39, v38, v50, v52, 0, (uint64_t)v40);
  uint64_t v53 = v39;
  if (v41)
  {

    swift_bridgeObjectRelease();
    v198[7](v40, 1, 1, v199);
    uint64_t v54 = sub_1B735B684((uint64_t)v40, &qword_1E9E592F8);
    goto LABEL_14;
  }
  unint64_t v206 = v35;
  unint64_t v75 = v38;
  swift_bridgeObjectRelease();
  unint64_t v76 = v199;
  v198[7](v40, 0, 1, v199);
  id v77 = v191;
  sub_1B7368DAC((uint64_t)v40, (uint64_t)v191, (uint64_t (*)(void))type metadata accessor for WBSKeychainPasskey);
  uint64_t v78 = &v77[*(int *)(v76 + 44)];
  if ((*(void *)v78 != v193 || *((void *)v78 + 1) != v194) && (sub_1B7384590() & 1) == 0)
  {
    uint64_t v54 = sub_1B7368E14((uint64_t)v77, (uint64_t (*)(void))type metadata accessor for WBSKeychainPasskey);
    unint64_t v38 = v75;
    unint64_t v35 = v206;
LABEL_14:
    uint64_t v55 = MEMORY[0x1BA9BB8F0](v54);
    unint64_t v57 = v56;
    error[0] = 0;
    uint64_t v205 = v55;
    CFDataRef v58 = (const __CFData *)sub_1B7383CD0();
    SecKeyRef v59 = SecKeyCreateWithData(v58, v207, error);

    if (!v59)
    {
      unint64_t v201 = v57;
      unint64_t v206 = v35;
      if (qword_1E9E58F28 != -1) {
        swift_once();
      }
      uint64_t v86 = sub_1B7383E40();
      uint64_t v87 = __swift_project_value_buffer(v86, (uint64_t)qword_1E9E5B9C0);
      v204 = &v177;
      uint64_t v88 = *(void *)(v86 - 8);
      MEMORY[0x1F4188790](v87);
      v90 = (char *)&v177 - ((v89 + 15) & 0xFFFFFFFFFFFFFFF0);
      (*(void (**)(char *))(v88 + 16))(v90);
      v91 = sub_1B7383E10();
      int v92 = sub_1B73841C0();
      BOOL v93 = os_log_type_enabled(v91, (os_log_type_t)v92);
      CFDictionaryRef v70 = v207;
      if (v93)
      {
        LODWORD(v200) = v92;
        uint64_t v202 = v53;
        v94 = (uint8_t *)swift_slowAlloc();
        uint64_t v95 = swift_slowAlloc();
        uint64_t v209 = v95;
        *(_DWORD *)v94 = 136446210;
        swift_beginAccess();
        uint64_t v74 = v203;
        unint64_t v199 = v95;
        if (error[0])
        {
          v197 = (void *)v38;
          v96 = error[0];
          *(void *)&long long v210 = 0;
          *((void *)&v210 + 1) = 0xE000000000000000;
          v208 = v96;
          type metadata accessor for CFError(0);
          sub_1B7367EB4();
          v198 = v96;
          uint64_t v97 = sub_1B7384570();
          if (v97)
          {
            v98 = (void *)v97;
          }
          else
          {
            v98 = (void *)swift_allocError();
            *v170 = v208;
          }
          v171 = (void *)sub_1B7383C30();

          id v172 = objc_msgSend(v171, sel_safari_privacyPreservingDescription);
          sub_1B7383FC0();

          sub_1B7384070();
          swift_bridgeObjectRelease();
          unint64_t v168 = *((void *)&v210 + 1);
          uint64_t v169 = v210;
          uint64_t v74 = v203;
          unint64_t v38 = (unint64_t)v197;
        }
        else
        {
          unint64_t v168 = 0xED0000726F727265;
          uint64_t v169 = 0x206E776F6E6B6E55;
        }
        *(void *)&long long v210 = sub_1B7367544(v169, v168, &v209);
        sub_1B7384250();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_1B728F000, v91, (os_log_type_t)v200, "Could not import key data: %{public}s", v94, 0xCu);
        unint64_t v173 = v199;
        swift_arrayDestroy();
        MEMORY[0x1BA9BDB10](v173, -1, -1);
        MEMORY[0x1BA9BDB10](v94, -1, -1);

        (*(void (**)(char *, uint64_t))(v88 + 8))(v90, v86);
        CFDictionaryRef v70 = v207;
        uint64_t v53 = v202;
        uint64_t v73 = v205;
      }
      else
      {

        (*(void (**)(char *, uint64_t))(v88 + 8))(v90, v86);
        uint64_t v73 = v205;
        uint64_t v74 = v203;
      }
      swift_beginAccess();
      unint64_t v35 = v206;
      unint64_t v57 = v201;
      if (error[0]) {

      }
      sub_1B7367E60();
      swift_allocError();
      *(_DWORD *)uint64_t v174 = 1;
      *(unsigned char *)(v174 + 4) = 1;
      swift_willThrow();
      goto LABEL_80;
    }
    v196 = 0;
    uint64_t v202 = v53;
    unint64_t v60 = v184;
    sub_1B729E55C(0, (unint64_t *)&qword_1E9E59160);
    sub_1B7367F00();
    swift_bridgeObjectRetain();
    uint64_t v61 = (void *)sub_1B7383F70();
    id v62 = objc_msgSend(self, sel_cborWithDictionary_, v61);

    id v63 = (void (**)(id, uint64_t, uint64_t, unint64_t))sub_1B7383C90();
    unint64_t v65 = v64;
    swift_bridgeObjectRelease();
    if (v65 >> 60 == 15)
    {
      if (qword_1E9E58F28 != -1) {
        swift_once();
      }
      uint64_t v66 = sub_1B7383E40();
      __swift_project_value_buffer(v66, (uint64_t)qword_1E9E5B9C0);
      unint64_t v67 = sub_1B7383E10();
      os_log_type_t v68 = sub_1B73841C0();
      BOOL v69 = os_log_type_enabled(v67, v68);
      uint64_t v53 = v202;
      CFDictionaryRef v70 = v207;
      if (v69)
      {
        v71 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v71 = 0;
        _os_log_impl(&dword_1B728F000, v67, v68, "Could not import key metadata.", v71, 2u);
        MEMORY[0x1BA9BDB10](v71, -1, -1);
      }

      sub_1B7367E60();
      swift_allocError();
      *(_DWORD *)uint64_t v72 = 2;
      *(unsigned char *)(v72 + 4) = 1;
      swift_willThrow();

      uint64_t v73 = v205;
      uint64_t v74 = v203;
      goto LABEL_80;
    }
    v195 = &stru_1F105D3F0;
    unint64_t v201 = v57;
    v197 = (void *)v38;
    unint64_t v206 = v35;
    LODWORD(v192) = objc_msgSend(self, sel_isCredentialExchangeEnabled);
    uint64_t v99 = swift_allocObject();
    *(_OWORD *)(v99 + 16) = xmmword_1B73904C0;
    v191 = (char *)*MEMORY[0x1E4F3BD50];
    v100 = v191;
    uint64_t v101 = v181;
    *(void *)(v99 + 56) = v181;
    *(void *)(v99 + 32) = v100;
    type metadata accessor for SecKey(0);
    *(void *)(v99 + 64) = v59;
    id v102 = v186;
    *(void *)(v99 + 88) = v103;
    *(void *)(v99 + 96) = v102;
    id v104 = v185;
    *(void *)(v99 + 120) = v101;
    *(void *)(v99 + 128) = v104;
    v190 = (void *)*MEMORY[0x1E4F3B788];
    v105 = v190;
    *(void *)(v99 + 152) = v101;
    *(void *)(v99 + 160) = v105;
    v198 = v63;
    uint64_t v106 = *v60;
    uint64_t v107 = v60[1];
    uint64_t v108 = MEMORY[0x1E4FBB1A0];
    *(void *)(v99 + 184) = v101;
    *(void *)(v99 + 192) = v106;
    *(void *)(v99 + 200) = v107;
    unint64_t v199 = v65;
    v109 = (void *)*MEMORY[0x1E4F3B5D8];
    *(void *)(v99 + 216) = v108;
    *(void *)(v99 + 224) = v109;
    uint64_t v110 = MEMORY[0x1E4F277B8];
    v111 = v198;
    *(void *)(v99 + 248) = v101;
    *(void *)(v99 + 256) = v111;
    *(void *)(v99 + 264) = v199;
    v112 = (void *)*MEMORY[0x1E4F3BD08];
    *(void *)(v99 + 312) = v101;
    *(void *)(v99 + 280) = v110;
    *(void *)(v99 + 288) = v112;
    uint64_t v113 = MEMORY[0x1E4FBB390];
    *(unsigned char *)(v99 + 320) = 1;
    v114 = (void *)*MEMORY[0x1E4F3B560];
    *(void *)(v99 + 344) = v113;
    *(void *)(v99 + 352) = v114;
    v200 = (char *)v59;
    v115 = (void *)*MEMORY[0x1E4F3B568];
    unint64_t v116 = 0xD000000000000019;
    *(void *)(v99 + 376) = v101;
    *(void *)(v99 + 384) = v115;
    unint64_t v117 = 0xD00000000000002ALL;
    v118 = (void *)*MEMORY[0x1E4F3B550];
    *(void *)(v99 + 408) = v101;
    *(void *)(v99 + 416) = v118;
    char v119 = *((unsigned char *)v204 + 16);
    if (v119) {
      unint64_t v117 = 0xD000000000000032;
    }
    unint64_t v120 = 0x80000001B73A7A80;
    if (*((unsigned char *)v204 + 16)) {
      unint64_t v116 = 0xD000000000000021;
    }
    else {
      unint64_t v120 = 0x80000001B73A7A50;
    }
    unint64_t v121 = 0x80000001B73A7A00;
    if (*((unsigned char *)v204 + 16)) {
      unint64_t v121 = 0x80000001B73A7A20;
    }
    if (v182) {
      unint64_t v116 = v117;
    }
    else {
      unint64_t v120 = v121;
    }
    *(void *)(v99 + 440) = v101;
    *(void *)(v99 + 448) = v116;
    *(void *)(v99 + 456) = v120;
    v122 = (void *)*MEMORY[0x1E4F3B878];
    *(void *)(v99 + 504) = v101;
    *(void *)(v99 + 472) = v108;
    *(void *)(v99 + 480) = v122;
    *(void *)(v99 + 536) = v113;
    *(unsigned char *)(v99 + 512) = v119 ^ 1;
    sub_1B729E55C(0, &qword_1E9E59330);
    v123 = v191;
    id v124 = v186;
    id v125 = v185;
    v126 = v190;
    swift_bridgeObjectRetain();
    id v127 = v109;
    id v128 = v112;
    id v129 = v114;
    id v130 = v115;
    id v131 = v118;
    sub_1B7367E4C((uint64_t)v198, v199);
    v132 = v200;
    id v133 = v122;
    v134 = (char *)sub_1B73841A0();
    v191 = v132;
    v200 = v134;
    if (v192)
    {
      if (!*MEMORY[0x1E4F3B5C8])
      {
        __break(1u);
        goto LABEL_85;
      }
      id v135 = (id)*MEMORY[0x1E4F3B5C8];
    }
    else
    {
      id v135 = (id)*MEMORY[0x1E4F3B5D0];
    }
    v137 = (void *)sub_1B7383CD0();
    objc_msgSend(v134, sel___swift_setObject_forKeyedSubscript_, v137, v135);

    uint64_t v138 = sub_1B7383D30();
    v192 = &v177;
    uint64_t v139 = *(void *)(v138 - 8);
    uint64_t v140 = *(void *)(v139 + 64);
    MEMORY[0x1F4188790](v138);
    uint64_t v141 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9E59238);
    uint64_t v142 = *(void *)(*(void *)(v141 - 8) + 64);
    MEMORY[0x1F4188790](v141 - 8);
    sub_1B7367F5C(v178, (uint64_t)&v177 - ((v142 + 15) & 0xFFFFFFFFFFFFFFF0));
    v190 = *(void **)(v139 + 48);
    if (((unsigned int (*)(char *, uint64_t, uint64_t))v190)((char *)&v177 - ((v142 + 15) & 0xFFFFFFFFFFFFFFF0), 1, v138) == 1)
    {
      uint64_t v143 = v139;
      uint64_t v144 = sub_1B735B684((uint64_t)&v177 - ((v142 + 15) & 0xFFFFFFFFFFFFFFF0), &qword_1E9E59238);
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v139 + 32))((char *)&v177 - ((v140 + 15) & 0xFFFFFFFFFFFFFFF0), (char *)&v177 - ((v142 + 15) & 0xFFFFFFFFFFFFFFF0), v138);
      id v145 = (id)*MEMORY[0x1E4F3B790];
      v146 = (void *)sub_1B7383D10();
      objc_msgSend(v200, sel___swift_setObject_forKeyedSubscript_, v146, v145);

      uint64_t v143 = v139;
      (*(void (**)(char *, uint64_t))(v139 + 8))((char *)&v177 - ((v140 + 15) & 0xFFFFFFFFFFFFFFF0), v138);
    }
    uint64_t v147 = MEMORY[0x1F4188790](v144);
    v148 = (char *)&v177 - ((v140 + 15) & 0xFFFFFFFFFFFFFFF0);
    MEMORY[0x1F4188790](v147);
    sub_1B7367F5C(v179, (uint64_t)&v177 - ((v142 + 15) & 0xFFFFFFFFFFFFFFF0));
    if (((unsigned int (*)(char *, uint64_t, uint64_t))v190)((char *)&v177 - ((v142 + 15) & 0xFFFFFFFFFFFFFFF0), 1, v138) == 1)
    {
      sub_1B735B684((uint64_t)&v177 - ((v142 + 15) & 0xFFFFFFFFFFFFFFF0), &qword_1E9E59238);
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v143 + 32))(v148, (char *)&v177 - ((v142 + 15) & 0xFFFFFFFFFFFFFFF0), v138);
      id v149 = (id)*MEMORY[0x1E4F3B668];
      v150 = (void *)sub_1B7383D10();
      objc_msgSend(v200, sel___swift_setObject_forKeyedSubscript_, v150, v149);

      (*(void (**)(char *, uint64_t))(v143 + 8))(v148, v138);
    }
    unint64_t v35 = v206;
    uint64_t v53 = v202;
    uint64_t v151 = v194;
    unint64_t v38 = (unint64_t)v197;
    uint64_t v152 = sub_1B7383FC0();
    uint64_t v74 = v203;
    v154 = v196;
    if (v152 == v193 && v153 == v151)
    {
      swift_bridgeObjectRelease();
      CFDictionaryRef v70 = v207;
LABEL_63:
      OSStatus v158 = SecItemAdd((CFDictionaryRef)v200, 0);
      if (v158)
      {
        OSStatus v159 = v158;
        if (qword_1E9E58F28 != -1) {
          swift_once();
        }
        uint64_t v160 = sub_1B7383E40();
        __swift_project_value_buffer(v160, (uint64_t)qword_1E9E5B9C0);
        v161 = sub_1B7383E10();
        os_log_type_t v162 = sub_1B73841C0();
        if (os_log_type_enabled(v161, v162))
        {
          v163 = (uint8_t *)swift_slowAlloc();
          *(_DWORD *)v163 = 67174657;
          LODWORD(v210) = v159;
          sub_1B7384250();
          _os_log_impl(&dword_1B728F000, v161, v162, "Failed to save passkey to keychain: %{private}d", v163, 8u);
          v164 = v163;
          unint64_t v35 = v206;
          MEMORY[0x1BA9BDB10](v164, -1, -1);
        }

        sub_1B7367E60();
        swift_allocError();
        *(_DWORD *)uint64_t v165 = v159;
        *(unsigned char *)(v165 + 4) = 0;
        swift_willThrow();
      }
      else
      {
        uint64_t v166 = sub_1B7383FC0();
        sub_1B735FF3C(v53, v38, v166, v167, v182 & 1, v183);
        if (!v154)
        {

          swift_bridgeObjectRelease();
          sub_1B735F96C((uint64_t)v198, v199);

          uint64_t v175 = v205;
          unint64_t v176 = v201;
          goto LABEL_81;
        }

        swift_bridgeObjectRelease();
      }
      sub_1B735F96C((uint64_t)v198, v199);

      unint64_t v57 = v201;
      uint64_t v73 = v205;
LABEL_80:
      uint64_t v175 = v73;
      unint64_t v176 = v57;
LABEL_81:
      sub_1B735B0E8(v175, v176);
      sub_1B735B0E8(v53, v38);
      sub_1B735B0E8(v74, v35);

      return;
    }
    char v155 = sub_1B7384590();
    swift_bridgeObjectRelease();
    CFDictionaryRef v70 = v207;
    if (v155) {
      goto LABEL_63;
    }
    if (*MEMORY[0x1E4F3B858])
    {
      id v156 = (id)*MEMORY[0x1E4F3B858];
      v157 = (void *)sub_1B7383FA0();
      objc_msgSend(v200, sel___swift_setObject_forKeyedSubscript_, v157, v156);

      goto LABEL_63;
    }
LABEL_85:
    __break(1u);
LABEL_86:
    swift_release();
    swift_release();
    __break(1u);
    JUMPOUT(0x1B7362B64);
  }
  if (qword_1E9E58F28 != -1) {
    swift_once();
  }
  uint64_t v79 = sub_1B7383E40();
  __swift_project_value_buffer(v79, (uint64_t)qword_1E9E5B9C0);
  v80 = sub_1B7383E10();
  os_log_type_t v81 = sub_1B73841B0();
  BOOL v82 = os_log_type_enabled(v80, v81);
  CFDictionaryRef v83 = v207;
  if (v82)
  {
    v84 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v84 = 0;
    _os_log_impl(&dword_1B728F000, v80, v81, "Imported duplicate passkey.", v84, 2u);
    v85 = v84;
    id v77 = v191;
    MEMORY[0x1BA9BDB10](v85, -1, -1);
    sub_1B735B0E8(v203, v206);
    sub_1B735B0E8(v53, v75);
  }
  else
  {

    sub_1B735B0E8(v203, v206);
    sub_1B735B0E8(v53, v75);
  }
  uint64_t v136 = v183;

  sub_1B7368DAC((uint64_t)v77, v136, (uint64_t (*)(void))type metadata accessor for WBSKeychainPasskey);
}

uint64_t WBSPasskeyStore.unownedExecutor.getter()
{
  return *(void *)(v0 + 24);
}

id WBSPasskeyStore.__allocating_init(forTesting:queue:)(char a1, void *a2)
{
  id v3 = v2;
  uint64_t v6 = swift_allocObject();
  *(unsigned char *)(v6 + 16) = a1;
  *(void *)(v6 + 40) = a2;
  swift_retain();
  id v7 = a2;
  *(void *)(v6 + 24) = sub_1B7384220();
  *(void *)(v6 + 32) = v8;
  swift_release();
  v11.receiver = (id)v6;
  v11.super_class = v3;
  id v9 = objc_msgSendSuper2(&v11, sel_init);

  return v9;
}

id WBSPasskeyStore.init(forTesting:queue:)(char a1, void *a2)
{
  uint64_t v3 = v2;
  *(unsigned char *)(v3 + 16) = a1;
  *(void *)(v3 + 40) = a2;
  swift_retain();
  id v5 = a2;
  *(void *)(v3 + 24) = sub_1B7384220();
  *(void *)(v3 + 32) = v6;
  swift_release();
  v9.receiver = (id)v3;
  v9.super_class = (Class)type metadata accessor for WBSPasskeyStore();
  id v7 = objc_msgSendSuper2(&v9, sel_init);

  return v7;
}

void WBSPasskeyStore.__allocating_init()()
{
}

void WBSPasskeyStore.init()()
{
}

uint64_t WBSPasskeyStore.deinit()
{
  return v0;
}

uint64_t WBSPasskeyStore.__deallocating_deinit()
{
  return MEMORY[0x1F4186488](v0, 48, 7);
}

uint64_t sub_1B7362D6C()
{
  return *(void *)(v0 + 24);
}

uint64_t sub_1B7362D84(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9E59300);
  uint64_t v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_1B73904C0;
  uint64_t v8 = *MEMORY[0x1E4F3B978];
  SecKeyRef v59 = (void *)*MEMORY[0x1E4F3B978];
  type metadata accessor for CFString(0);
  *(void *)(v7 + 32) = v8;
  uint64_t v10 = (void *)*MEMORY[0x1E4F3B9A0];
  *(void *)(v7 + 56) = v9;
  *(void *)(v7 + 64) = v10;
  objc_super v11 = (void *)*MEMORY[0x1E4F3B6D0];
  *(void *)(v7 + 88) = v9;
  *(void *)(v7 + 96) = v11;
  CFDataRef v58 = (void *)*MEMORY[0x1E4F3B6E0];
  uint64_t v12 = *MEMORY[0x1E4F3B6E0];
  *(void *)(v7 + 120) = v9;
  *(void *)(v7 + 128) = v12;
  uint64_t v13 = (void *)*MEMORY[0x1E4F3B878];
  uint64_t v14 = (void **)MEMORY[0x1E4F3B880];
  *(void *)(v7 + 152) = v9;
  *(void *)(v7 + 160) = v13;
  unint64_t v57 = *v14;
  *(void *)(v7 + 184) = v9;
  *(void *)(v7 + 192) = v57;
  unint64_t v56 = (void *)*MEMORY[0x1E4F3BD08];
  uint64_t v15 = *MEMORY[0x1E4F3BD08];
  *(void *)(v7 + 248) = v9;
  *(void *)(v7 + 216) = v9;
  *(void *)(v7 + 224) = v15;
  uint64_t v16 = MEMORY[0x1E4FBB390];
  *(unsigned char *)(v7 + 256) = 1;
  uint64_t v17 = (void *)*MEMORY[0x1E4F3BC68];
  *(void *)(v7 + 312) = v9;
  *(void *)(v7 + 280) = v16;
  *(void *)(v7 + 288) = v17;
  *(unsigned char *)(v7 + 320) = 1;
  uint64_t v18 = (void *)*MEMORY[0x1E4F3B550];
  *(void *)(v7 + 344) = v16;
  *(void *)(v7 + 352) = v18;
  unint64_t v19 = 0xD000000000000019;
  if (*(unsigned char *)(v5 + 16)) {
    unint64_t v20 = 0xD000000000000032;
  }
  else {
    unint64_t v20 = 0xD00000000000002ALL;
  }
  unint64_t v21 = 0x80000001B73A7A50;
  if (*(unsigned char *)(v5 + 16))
  {
    unint64_t v21 = 0x80000001B73A7A80;
    unint64_t v19 = 0xD000000000000021;
  }
  unint64_t v22 = 0x80000001B73A7A00;
  if (*(unsigned char *)(v5 + 16)) {
    unint64_t v22 = 0x80000001B73A7A20;
  }
  if (a5)
  {
    unint64_t v23 = v21;
  }
  else
  {
    unint64_t v20 = v19;
    unint64_t v23 = v22;
  }
  uint64_t v24 = MEMORY[0x1E4FBB1A0];
  *(void *)(v7 + 376) = v9;
  *(void *)(v7 + 384) = v20;
  *(void *)(v7 + 392) = v23;
  uint64_t v25 = (void *)*MEMORY[0x1E4F3BB80];
  id v26 = (void **)MEMORY[0x1E4F3BB88];
  *(void *)(v7 + 408) = v24;
  *(void *)(v7 + 416) = v25;
  uint64_t v27 = *v26;
  *(void *)(v7 + 440) = v9;
  *(void *)(v7 + 448) = v27;
  uint64_t v28 = (void *)*MEMORY[0x1E4F3BC78];
  *(void *)(v7 + 504) = v9;
  *(void *)(v7 + 472) = v9;
  *(void *)(v7 + 480) = v28;
  *(void *)(v7 + 536) = v16;
  *(unsigned char *)(v7 + 512) = 1;
  sub_1B729E55C(0, &qword_1E9E59330);
  id v29 = v59;
  id v30 = v10;
  id v31 = v11;
  id v32 = v58;
  id v33 = v13;
  id v34 = v57;
  id v35 = v56;
  id v36 = v17;
  id v37 = v18;
  id v38 = v25;
  id v39 = v27;
  id v40 = v28;
  OSStatus v41 = (void *)sub_1B73841A0();
  if (a2 >> 60 != 15)
  {
    uint64_t v42 = self;
    sub_1B735F794(a1, a2);
    if (objc_msgSend(v42, sel_isCredentialExchangeEnabled))
    {
      uint64_t v43 = (void *)*MEMORY[0x1E4F3B5C8];
      if (*MEMORY[0x1E4F3B5C8])
      {
LABEL_16:
        id v44 = v43;
        uint64_t v45 = (void *)sub_1B7383CD0();
        objc_msgSend(v41, sel___swift_setObject_forKeyedSubscript_, v45, v44);

        uint64_t v46 = *MEMORY[0x1E4F3BB90];
        id v47 = v38;
        objc_msgSend(v41, sel___swift_setObject_forKeyedSubscript_, v46, v47);
        sub_1B735F96C(a1, a2);

        goto LABEL_17;
      }
      __break(1u);
    }
    uint64_t v43 = (void *)*MEMORY[0x1E4F3B5D0];
    goto LABEL_16;
  }
LABEL_17:
  if (sub_1B7383FC0() == a3 && v48 == a4)
  {
    swift_bridgeObjectRelease();
    return (uint64_t)v41;
  }
  char v49 = sub_1B7384590();
  uint64_t result = swift_bridgeObjectRelease();
  if (v49) {
    return (uint64_t)v41;
  }
  if (*MEMORY[0x1E4F3B858])
  {
    id v51 = (id)*MEMORY[0x1E4F3B858];
    uint64_t v52 = (void *)sub_1B7383FA0();
    objc_msgSend(v41, sel___swift_setObject_forKeyedSubscript_, v52, v51);

    return (uint64_t)v41;
  }
  __break(1u);
  return result;
}

void sub_1B7363174(void *a1)
{
  id v3 = objc_msgSend(self, sel_sharedProvider);
  id v4 = objc_msgSend(a1, sel_groupID);
  if (!v4)
  {
    sub_1B7383FC0();
    id v4 = (id)sub_1B7383FA0();
    swift_bridgeObjectRelease();
  }
  unsigned int v5 = objc_msgSend(v3, sel_canCurrentUserEditSavedAccountsInGroupWithID_, v4);

  if (!v5)
  {
    if ((*(unsigned char *)(v1 + 16) & 1) == 0)
    {
      if (qword_1E9E58F28 != -1) {
        swift_once();
      }
      uint64_t v6 = sub_1B7383E40();
      __swift_project_value_buffer(v6, (uint64_t)qword_1E9E5B9C0);
      uint64_t v7 = sub_1B7383E10();
      os_log_type_t v8 = sub_1B73841D0();
      if (os_log_type_enabled(v7, v8))
      {
        uint64_t v9 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v9 = 0;
        _os_log_impl(&dword_1B728F000, v7, v8, "The user tried to change the username for a passkey in a group they have read only permission in.", v9, 2u);
        MEMORY[0x1BA9BDB10](v9, -1, -1);
      }
    }
    sub_1B7367E60();
    swift_allocError();
    *(_DWORD *)uint64_t v10 = 3;
    *(unsigned char *)(v10 + 4) = 1;
    swift_willThrow();
  }
}

void sub_1B7363320(uint8_t *a1@<X0>, void *a2@<X1>, char a3@<W2>, uint64_t a4@<X8>)
{
  v86[0] = a4;
  int v92 = a1;
  BOOL v93 = a2;
  result[1] = *(CFTypeRef *)MEMORY[0x1E4F143B8];
  unsigned int v91 = objc_msgSend(self, sel_isCredentialExchangeEnabled, a4);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9E59300);
  uint64_t v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = xmmword_1B7390470;
  id v90 = (id)*MEMORY[0x1E4F3B978];
  type metadata accessor for CFString(0);
  *(void *)(v6 + 32) = v90;
  uint64_t v89 = (__CFError *)*MEMORY[0x1E4F3B9A0];
  os_log_type_t v8 = v89;
  *(void *)(v6 + 56) = v7;
  *(void *)(v6 + 64) = v8;
  uint64_t v88 = *MEMORY[0x1E4F3B6D0];
  uint64_t v9 = v88;
  *(void *)(v6 + 88) = v7;
  *(void *)(v6 + 96) = v9;
  uint64_t v10 = (void *)*MEMORY[0x1E4F3B6E0];
  *(void *)(v6 + 120) = v7;
  *(void *)(v6 + 128) = v10;
  objc_super v11 = (void *)*MEMORY[0x1E4F3B878];
  *(void *)(v6 + 152) = v7;
  *(void *)(v6 + 160) = v11;
  uint64_t v12 = (void *)*MEMORY[0x1E4F3B880];
  uint64_t v13 = (id *)MEMORY[0x1E4F3BD08];
  *(void *)(v6 + 184) = v7;
  *(void *)(v6 + 192) = v12;
  id v87 = *v13;
  id v14 = v87;
  *(void *)(v6 + 248) = v7;
  uint64_t v15 = MEMORY[0x1E4FBB390];
  *(void *)(v6 + 216) = v7;
  *(void *)(v6 + 224) = v14;
  *(unsigned char *)(v6 + 256) = 1;
  uint64_t v16 = (void *)*MEMORY[0x1E4F3B550];
  *(void *)(v6 + 280) = v15;
  *(void *)(v6 + 288) = v16;
  unint64_t v17 = 0xD000000000000019;
  if (*(unsigned char *)(v4 + 16)) {
    unint64_t v18 = 0xD000000000000032;
  }
  else {
    unint64_t v18 = 0xD00000000000002ALL;
  }
  unint64_t v19 = 0x80000001B73A7A50;
  if (*(unsigned char *)(v4 + 16))
  {
    unint64_t v19 = 0x80000001B73A7A80;
    unint64_t v17 = 0xD000000000000021;
  }
  unint64_t v20 = 0x80000001B73A7A00;
  if (*(unsigned char *)(v4 + 16)) {
    unint64_t v20 = 0x80000001B73A7A20;
  }
  if (a3)
  {
    unint64_t v21 = v19;
  }
  else
  {
    unint64_t v18 = v17;
    unint64_t v21 = v20;
  }
  uint64_t v22 = MEMORY[0x1E4FBB1A0];
  *(void *)(v6 + 312) = v7;
  *(void *)(v6 + 320) = v18;
  *(void *)(v6 + 328) = v21;
  unint64_t v23 = (void *)*MEMORY[0x1E4F3BB80];
  uint64_t v24 = (void **)MEMORY[0x1E4F3BB90];
  *(void *)(v6 + 344) = v22;
  *(void *)(v6 + 352) = v23;
  uint64_t v25 = *v24;
  *(void *)(v6 + 376) = v7;
  *(void *)(v6 + 384) = v25;
  id v26 = (void *)*MEMORY[0x1E4F3BC88];
  *(void *)(v6 + 440) = v7;
  *(void *)(v6 + 408) = v7;
  *(void *)(v6 + 416) = v26;
  *(void *)(v6 + 472) = v15;
  *(unsigned char *)(v6 + 448) = 1;
  sub_1B729E55C(0, &qword_1E9E59330);
  id v27 = v90;
  uint64_t v28 = v89;
  id v29 = v88;
  id v30 = v10;
  id v31 = v11;
  id v32 = v12;
  id v33 = v87;
  id v34 = v16;
  id v35 = v23;
  id v36 = v25;
  id v37 = v26;
  id v38 = (void *)sub_1B73841A0();
  if (v91)
  {
    if (!*MEMORY[0x1E4F3B5C8])
    {
      __break(1u);
      goto LABEL_61;
    }
    id v39 = (id)*MEMORY[0x1E4F3B5C8];
  }
  else
  {
    id v39 = (id)*MEMORY[0x1E4F3B5D0];
  }
  id v40 = (void *)sub_1B7383CD0();
  objc_msgSend(v38, sel___swift_setObject_forKeyedSubscript_, v40, v39);

  result[0] = 0;
  OSStatus v41 = SecItemCopyMatching((CFDictionaryRef)v38, result);
  CFTypeRef v42 = result[0];
  OSStatus v95 = v41;
  if (v41) {
    unsigned int v43 = v91;
  }
  else {
    unsigned int v43 = 0;
  }
  if (v43 == 1)
  {
    if (*MEMORY[0x1E4F3B5C8])
    {
      objc_msgSend(v38, sel___swift_setObject_forKeyedSubscript_, 0);
      id v44 = (id)*MEMORY[0x1E4F3B5D0];
      uint64_t v45 = (void *)sub_1B7383CD0();
      objc_msgSend(v38, sel___swift_setObject_forKeyedSubscript_, v45, v44);

      OSStatus v41 = SecItemCopyMatching((CFDictionaryRef)v38, result);
      CFTypeRef v42 = result[0];
      OSStatus v95 = v41;
      goto LABEL_21;
    }
LABEL_61:
    __break(1u);
    return;
  }
LABEL_21:
  if (v41)
  {
    if (qword_1E9E58F28 != -1) {
      swift_once();
    }
    uint64_t v46 = sub_1B7383E40();
    __swift_project_value_buffer(v46, (uint64_t)qword_1E9E5B9C0);
    id v47 = sub_1B7383E10();
    os_log_type_t v48 = sub_1B73841C0();
    if (os_log_type_enabled(v47, v48))
    {
      char v49 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)char v49 = 67240192;
      swift_beginAccess();
      LODWORD(v99) = v95;
      sub_1B7384250();
      _os_log_impl(&dword_1B728F000, v47, v48, "Could not find passkey: %{public}d", v49, 8u);
      MEMORY[0x1BA9BDB10](v49, -1, -1);
    }

    swift_beginAccess();
    sub_1B7367E60();
    swift_allocError();
    *(_DWORD *)uint64_t v50 = v95;
    *(unsigned char *)(v50 + 4) = 0;
    goto LABEL_49;
  }
  if (!v42)
  {
LABEL_33:
    if (qword_1E9E58F28 != -1) {
      swift_once();
    }
    uint64_t v59 = sub_1B7383E40();
    __swift_project_value_buffer(v59, (uint64_t)qword_1E9E5B9C0);
    unint64_t v60 = sub_1B7383E10();
    os_log_type_t v61 = sub_1B73841C0();
    if (!os_log_type_enabled(v60, v61)) {
      goto LABEL_48;
    }
    id v62 = (uint8_t *)swift_slowAlloc();
    id v63 = (void *)swift_slowAlloc();
    *(_DWORD *)id v62 = 138477827;
    swift_beginAccess();
    if (result[0])
    {
      swift_unknownObjectRetain();
      self;
      uint64_t v64 = swift_dynamicCastObjCClass();
      if (v64)
      {
        uint64_t v65 = v64;
        uint64_t v98 = v64;
        sub_1B7384250();
LABEL_47:
        void *v63 = v65;
        _os_log_impl(&dword_1B728F000, v60, v61, "Unexpected keychain response: %{private}@", v62, 0xCu);
        __swift_instantiateConcreteTypeFromMangledName(&qword_1E9E59418);
        swift_arrayDestroy();
        MEMORY[0x1BA9BDB10](v63, -1, -1);
        MEMORY[0x1BA9BDB10](v62, -1, -1);
LABEL_48:

        sub_1B7367E60();
        swift_allocError();
        *(_DWORD *)uint64_t v77 = 1;
        *(unsigned char *)(v77 + 4) = 1;
LABEL_49:
        swift_willThrow();
        goto LABEL_50;
      }
      swift_unknownObjectRelease();
    }
    uint64_t v98 = 0;
    sub_1B7384250();
    uint64_t v65 = 0;
    goto LABEL_47;
  }
  id v51 = (const void *)swift_unknownObjectRetain();
  CFTypeID v52 = CFGetTypeID(v51);
  if (v52 != SecKeyGetTypeID())
  {
    swift_unknownObjectRelease();
    goto LABEL_33;
  }
  CFErrorRef error = 0;
  type metadata accessor for SecKey(0);
  swift_unknownObjectRetain();
  uint64_t v53 = (__SecKey *)swift_dynamicCastUnknownClassUnconditional();
  CFDataRef v54 = SecKeyCopyExternalRepresentation(v53, &error);

  if (!v54)
  {
    if (qword_1E9E58F28 != -1) {
      swift_once();
    }
    uint64_t v66 = sub_1B7383E40();
    uint64_t v67 = __swift_project_value_buffer(v66, (uint64_t)qword_1E9E5B9C0);
    uint64_t v68 = *(void *)(v66 - 8);
    MEMORY[0x1F4188790](v67);
    CFDictionaryRef v70 = (char *)v86 - ((v69 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v68 + 16))(v70);
    v71 = sub_1B7383E10();
    unsigned int v72 = sub_1B73841C0();
    if (os_log_type_enabled(v71, (os_log_type_t)v72))
    {
      uint64_t v73 = (uint8_t *)swift_slowAlloc();
      id v90 = (id)swift_slowAlloc();
      id v96 = v90;
      int v92 = v73;
      *(_DWORD *)uint64_t v73 = 136446210;
      swift_beginAccess();
      BOOL v93 = v86;
      unsigned int v91 = v72;
      if (error)
      {
        uint64_t v88 = v71;
        uint64_t v74 = error;
        uint64_t v99 = 0;
        unint64_t v100 = 0xE000000000000000;
        v94 = v74;
        type metadata accessor for CFError(0);
        sub_1B7367EB4();
        uint64_t v89 = v74;
        uint64_t v75 = sub_1B7384570();
        if (v75)
        {
          unint64_t v76 = (void *)v75;
        }
        else
        {
          unint64_t v76 = (void *)swift_allocError();
          NSObject *v80 = v94;
        }
        os_log_type_t v81 = (void *)sub_1B7383C30();

        id v82 = objc_msgSend(v81, sel_safari_privacyPreservingDescription);
        sub_1B7383FC0();

        sub_1B7384070();
        swift_bridgeObjectRelease();
        uint64_t v79 = v99;
        unint64_t v78 = v100;
        v71 = v88;
      }
      else
      {
        unint64_t v78 = 0xED0000726F727265;
        uint64_t v79 = 0x206E776F6E6B6E55;
      }
      CFDictionaryRef v83 = v92;
      uint64_t v99 = sub_1B7367544(v79, v78, (uint64_t *)&v96);
      sub_1B7384250();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1B728F000, v71, (os_log_type_t)v91, "Could not read key data: %{public}s", v83, 0xCu);
      id v84 = v90;
      swift_arrayDestroy();
      MEMORY[0x1BA9BDB10](v84, -1, -1);
      MEMORY[0x1BA9BDB10](v83, -1, -1);

      (*(void (**)(char *, uint64_t))(v68 + 8))(v70, v66);
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v68 + 8))(v70, v66);
    }
    swift_beginAccess();
    if (error) {

    }
    sub_1B7367E60();
    swift_allocError();
    *(_DWORD *)uint64_t v85 = 1;
    *(unsigned char *)(v85 + 4) = 1;
    swift_willThrow();
    swift_unknownObjectRelease();
    goto LABEL_50;
  }
  CFDataRef v55 = v54;
  uint64_t v56 = sub_1B7383D00();
  unint64_t v58 = v57;

  uint64_t v99 = v56;
  unint64_t v100 = v58;
  sub_1B7383F00();
  if (v86[1])
  {
    swift_unknownObjectRelease();

LABEL_50:
    swift_unknownObjectRelease();
    return;
  }

  swift_unknownObjectRelease_n();
}

uint64_t WBSPasskeyStore.exportPrivateKey(credentialID:)(uint8_t *a1, void *a2)
{
  uint64_t v6 = sub_1B7383F10();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  uint64_t v9 = (char *)&v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B7363320(a1, a2, 0, (uint64_t)v9);
  if (!v3)
  {
    uint64_t v2 = sub_1B7383EC0();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  }
  return v2;
}

uint64_t sub_1B7363F70@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  return sub_1B736667C(a1, a2, a3);
}

uint64_t WBSPasskeyStore.test_createPasskey(name:displayName:relyingParty:userHandle:groupID:inRecentlyDeleted:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unint64_t v17 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))((char *)&dword_1E9E59340
                                                                                     + dword_1E9E59340);
  uint64_t v15 = (void *)swift_task_alloc();
  *(void *)(v8 + 16) = v15;
  *uint64_t v15 = v8;
  v15[1] = sub_1B7364094;
  return v17(a1, a2, a5, a6, a7, a8);
}

uint64_t sub_1B7364094(uint64_t a1, uint64_t a2)
{
  uint64_t v10 = *v3;
  uint64_t v6 = swift_task_dealloc();
  uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t))(v10 + 8);
  if (!v2)
  {
    uint64_t v6 = a1;
    uint64_t v7 = a2;
  }
  return v8(v6, v7);
}

void sub_1B7364364(int a1, int a2, int a3, void *a4, void *a5, int a6, void *aBlock, uint64_t a8, char a9)
{
  int v9[2] = a8;
  void v9[3] = _Block_copy(aBlock);
  sub_1B7383FC0();
  void v9[4] = v12;
  sub_1B7383FC0();
  void v9[5] = v13;
  id v14 = a5;
  id v15 = a4;
  swift_retain();
  uint64_t v16 = sub_1B7383D00();
  uint64_t v18 = v17;

  v9[6] = v16;
  v9[7] = v18;
  if (a5)
  {
    sub_1B7383FC0();
    uint64_t v20 = v19;
  }
  else
  {
    uint64_t v20 = 0;
  }
  v9[8] = v20;
  uint64_t v22 = (char *)&dword_1E9E59340 + dword_1E9E59340;
  unint64_t v21 = (void *)swift_task_alloc();
  v9[9] = v21;
  *unint64_t v21 = v9;
  v21[1] = sub_1B73644F4;
  __asm { BR              X8; sub_1B736852C }
}

uint64_t sub_1B73644F4(uint64_t a1, unint64_t a2)
{
  uint64_t v4 = v2;
  uint64_t v8 = *v3;
  uint64_t v7 = *v3;
  uint64_t v9 = *v3;
  swift_task_dealloc();
  swift_release();
  unint64_t v10 = *(void *)(v7 + 56);
  uint64_t v11 = *(void *)(v7 + 48);
  swift_bridgeObjectRelease();
  sub_1B735B0E8(v11, v10);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v4)
  {
    uint64_t v12 = sub_1B7383C30();

    uint64_t v13 = 0;
    id v14 = (void *)v12;
  }
  else
  {
    uint64_t v13 = sub_1B7383CD0();
    sub_1B735B0E8(a1, a2);
    uint64_t v12 = 0;
    id v14 = (void *)v13;
  }
  id v15 = *(void (***)(void, void, void))(v8 + 24);
  v15[2](v15, v13, v12);

  _Block_release(v15);
  uint64_t v16 = *(uint64_t (**)(void))(v9 + 8);
  return v16();
}

uint64_t WBSPasskeyStore.test_createPasskey(name:displayName:relyingParty:userHandle:groupID:inRecentlyDeleted:unsafeAllowRealKeychainAccess:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v16 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))((char *)&dword_1E9E59350 + dword_1E9E59350);
  id v14 = (void *)swift_task_alloc();
  *(void *)(v8 + 16) = v14;
  *id v14 = v8;
  v14[1] = sub_1B73695FC;
  return v16(a1, a2, a5, a6, a7, a8, v19, v20);
}

uint64_t sub_1B7364A0C(int a1, int a2, int a3, void *a4, void *a5, int a6, int a7, void *aBlock, uint64_t a9)
{
  int v9[2] = a9;
  void v9[3] = _Block_copy(aBlock);
  uint64_t v27 = sub_1B7383FC0();
  uint64_t v13 = v12;
  void v9[4] = v12;
  uint64_t v26 = sub_1B7383FC0();
  uint64_t v15 = v14;
  void v9[5] = v14;
  id v16 = a5;
  id v17 = a4;
  swift_retain();
  uint64_t v18 = sub_1B7383D00();
  uint64_t v20 = v19;

  v9[6] = v18;
  v9[7] = v20;
  if (a5)
  {
    a5 = (void *)sub_1B7383FC0();
    uint64_t v22 = v21;
  }
  else
  {
    uint64_t v22 = 0;
  }
  v9[8] = v22;
  uint64_t v25 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))((char *)&dword_1E9E59350 + dword_1E9E59350);
  uint64_t v23 = (void *)swift_task_alloc();
  v9[9] = v23;
  *uint64_t v23 = v9;
  v23[1] = sub_1B7369600;
  return v25(v27, v13, v26, v15, v18, v20, (uint64_t)a5, v22);
}

uint64_t WBSPasskeyStore.test_createLegacyCredential(name:displayName:relyingParty:userHandle:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  id v17 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))((char *)&dword_1E9E59360
                                                                                     + dword_1E9E59360);
  uint64_t v15 = (void *)swift_task_alloc();
  *(void *)(v8 + 16) = v15;
  *uint64_t v15 = v8;
  v15[1] = sub_1B73695FC;
  return v17(a1, a2, a5, a6, a7, a8);
}

uint64_t sub_1B7364E30(int a1, int a2, int a3, void *a4, void *aBlock, uint64_t a6)
{
  void v6[2] = a6;
  void v6[3] = _Block_copy(aBlock);
  uint64_t v8 = sub_1B7383FC0();
  uint64_t v10 = v9;
  void v6[4] = v9;
  uint64_t v11 = sub_1B7383FC0();
  uint64_t v13 = v12;
  void v6[5] = v12;
  id v14 = a4;
  swift_retain();
  uint64_t v15 = sub_1B7383D00();
  uint64_t v17 = v16;

  v6[6] = v15;
  v6[7] = v17;
  uint64_t v20 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))((char *)&dword_1E9E59360
                                                                                     + dword_1E9E59360);
  uint64_t v18 = (void *)swift_task_alloc();
  v6[8] = v18;
  *uint64_t v18 = v6;
  v18[1] = sub_1B7364F74;
  return v20(v8, v10, v11, v13, v15, v17);
}

uint64_t sub_1B7364F74(uint64_t a1, unint64_t a2)
{
  uint64_t v4 = v2;
  uint64_t v8 = *v3;
  uint64_t v7 = *v3;
  uint64_t v9 = *v3;
  swift_task_dealloc();
  swift_release();
  sub_1B735B0E8(*(void *)(v7 + 48), *(void *)(v7 + 56));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v4)
  {
    uint64_t v10 = sub_1B7383C30();

    uint64_t v11 = 0;
    uint64_t v12 = (void *)v10;
  }
  else
  {
    uint64_t v11 = sub_1B7383CD0();
    sub_1B735B0E8(a1, a2);
    uint64_t v10 = 0;
    uint64_t v12 = (void *)v11;
  }
  uint64_t v13 = *(void (***)(void, void, void))(v8 + 24);
  v13[2](v13, v11, v10);

  _Block_release(v13);
  id v14 = *(uint64_t (**)(void))(v9 + 8);
  return v14();
}

void sub_1B736517C(__SecKey *a1@<X0>, void *a2@<X1>, void **a3@<X2>, NSObject *a4@<X3>, __SecKey *a5@<X4>, uint64_t a6@<X5>, char a7@<W6>, char a8@<W7>, uint64_t a9@<X8>)
{
  uint64_t v11 = v10;
  os_log_t v175 = a4;
  unint64_t v176 = a5;
  uint64_t v177 = a1;
  id v178 = a2;
  v183[25] = *(CFErrorRef *)MEMORY[0x1E4F143B8];
  uint64_t v17 = sub_1B7383F60();
  v171 = *(uint8_t **)(v17 - 8);
  uint64_t v172 = v17;
  MEMORY[0x1F4188790](v17);
  os_log_t v173 = (os_log_t)&v157[-((v18 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v19 = sub_1B7383F50();
  uint64_t v20 = MEMORY[0x1F4188790](v19);
  uint64_t v23 = &v157[-((v22 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v24 = *a3;
  int v25 = *(unsigned __int8 *)(v9 + 16);
  if ((v25 & 1) == 0 && (a8 & 1) == 0)
  {
    sub_1B7367E60();
    swift_allocError();
    *(_DWORD *)uint64_t v26 = 3;
    *(unsigned char *)(v26 + 4) = 1;
    swift_willThrow();
    return;
  }
  OSStatus v159 = v23;
  uint64_t v160 = v21;
  uint64_t v161 = v20;
  uint64_t v180 = (uint64_t)v24;
  swift_bridgeObjectRetain();
  uint64_t v162 = a9;
  uint64_t v163 = v9;
  v164 = v11;
  uint64_t v174 = (uint64_t)v24;
  if (a7)
  {
    uint64_t v27 = (void *)sub_1B7383FA0();
    uint64_t v28 = self;
    id v29 = objc_msgSend(v28, sel_cborWithUTF8String_, v27);

    id v30 = (__SecKey *)objc_msgSend(v28, sel_cborWithInteger_, 1);
    if (v30)
    {
      id v31 = v30;
      uint64_t v32 = v174;
      if ((v174 & 0xC000000000000001) != 0)
      {
        if (v174 >= 0) {
          uint64_t v32 = v174 & 0xFFFFFFFFFFFFFF8;
        }
        uint64_t v33 = sub_1B73842D0();
        if (__OFADD__(v33, 1))
        {
          __break(1u);
LABEL_84:
          swift_once();
LABEL_49:
          uint64_t v110 = sub_1B7383E40();
          uint64_t v111 = __swift_project_value_buffer(v110, (uint64_t)qword_1E9E5B9C0);
          os_log_t v175 = (os_log_t)v157;
          uint64_t v112 = *(void *)(v110 - 8);
          MEMORY[0x1F4188790](v111);
          v114 = &v157[-((v113 + 15) & 0xFFFFFFFFFFFFFFF0)];
          (*(void (**)(unsigned char *))(v112 + 16))(v114);
          v115 = sub_1B7383E10();
          int v116 = sub_1B73841C0();
          if (os_log_type_enabled(v115, (os_log_type_t)v116))
          {
            LODWORD(v173) = v116;
            uint64_t v174 = (uint64_t)v115;
            unint64_t v117 = (uint8_t *)swift_slowAlloc();
            uint64_t v172 = swift_slowAlloc();
            os_log_t v181 = (os_log_t)v172;
            v171 = v117;
            *(_DWORD *)unint64_t v117 = 136446210;
            swift_beginAccess();
            unint64_t v176 = v31;
            if (v183[0])
            {
              uint64_t v177 = v11;
              id v178 = (id)a6;
              v118 = v183[0];
              *(void *)&long long v182 = 0;
              *((void *)&v182 + 1) = 0xE000000000000000;
              uint64_t v179 = v118;
              type metadata accessor for CFError(0);
              sub_1B7367EB4();
              char v119 = v118;
              uint64_t v120 = sub_1B7384570();
              if (v120)
              {
                unint64_t v121 = (void *)v120;
              }
              else
              {
                unint64_t v121 = (void *)swift_allocError();
                void *v150 = v179;
              }
              uint64_t v151 = (void *)sub_1B7383C30();

              id v152 = objc_msgSend(v151, sel_safari_privacyPreservingDescription);
              sub_1B7383FC0();

              sub_1B7384070();
              swift_bridgeObjectRelease();
              unint64_t v149 = *((void *)&v182 + 1);
              uint64_t v148 = v182;
              uint64_t v11 = v177;
              a6 = (uint64_t)v178;
            }
            else
            {
              uint64_t v148 = 0x206E776F6E6B6E55;
              unint64_t v149 = 0xED0000726F727265;
            }
            uint64_t v153 = v171;
            *(void *)&long long v182 = sub_1B7367544(v148, v149, (uint64_t *)&v181);
            sub_1B7384250();
            swift_bridgeObjectRelease();
            id v154 = (id)v174;
            _os_log_impl(&dword_1B728F000, (os_log_t)v174, (os_log_type_t)v173, "Could not read public key data: %{public}s", v153, 0xCu);
            uint64_t v155 = v172;
            swift_arrayDestroy();
            MEMORY[0x1BA9BDB10](v155, -1, -1);
            MEMORY[0x1BA9BDB10](v153, -1, -1);

            (*(void (**)(unsigned char *, uint64_t))(v112 + 8))(v114, v110);
            id v31 = v176;
          }
          else
          {

            (*(void (**)(unsigned char *, uint64_t))(v112 + 8))(v114, v110);
          }
          swift_beginAccess();
          if (v183[0]) {

          }
          sub_1B7367E60();
          swift_allocError();
          *(_DWORD *)uint64_t v156 = 1;
          *(unsigned char *)(v156 + 4) = 1;
          swift_willThrow();

          return;
        }
        uint64_t v32 = sub_1B7367B34(v32, v33 + 1);
      }
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      *(void *)&long long v182 = v32;
      sub_1B735869C((uint64_t)v31, v29, isUniquelyReferenced_nonNull_native);
      uint64_t v174 = v182;
      uint64_t v180 = v182;

      swift_bridgeObjectRelease();
    }
    else
    {
      id v35 = (void *)sub_1B7378A78((unint64_t)v29);

      uint64_t v174 = v180;
    }
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9E59300);
  uint64_t v36 = swift_allocObject();
  *(_OWORD *)(v36 + 16) = xmmword_1B73904D0;
  id v170 = (id)*MEMORY[0x1E4F3B878];
  id v37 = v170;
  type metadata accessor for CFString(0);
  *(void *)(v36 + 56) = v38;
  uint64_t v39 = MEMORY[0x1E4FBB390];
  *(void *)(v36 + 32) = v37;
  *(unsigned char *)(v36 + 64) = 0;
  id v169 = (id)*MEMORY[0x1E4F3B720];
  id v40 = v169;
  *(void *)(v36 + 88) = v39;
  *(void *)(v36 + 96) = v40;
  id v168 = (id)*MEMORY[0x1E4F3B738];
  id v41 = v168;
  *(void *)(v36 + 120) = v38;
  *(void *)(v36 + 128) = v41;
  id v167 = (id)*MEMORY[0x1E4F3B710];
  id v42 = v167;
  uint64_t v43 = MEMORY[0x1E4FBB550];
  *(void *)(v36 + 152) = v38;
  *(void *)(v36 + 160) = v42;
  *(void *)(v36 + 184) = v38;
  *(void *)(v36 + 192) = 256;
  id v166 = (id)*MEMORY[0x1E4F3BD08];
  id v44 = v166;
  *(void *)(v36 + 248) = v38;
  *(void *)(v36 + 216) = v43;
  *(void *)(v36 + 224) = v44;
  *(unsigned char *)(v36 + 256) = 1;
  id v165 = (id)*MEMORY[0x1E4F3BC10];
  id v45 = v165;
  *(void *)(v36 + 312) = v38;
  *(void *)(v36 + 280) = v39;
  *(void *)(v36 + 288) = v45;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9E59408);
  uint64_t inited = swift_initStackObject();
  id v47 = (void *)inited;
  *(_OWORD *)(inited + 16) = xmmword_1B73904E0;
  os_log_type_t v48 = (void *)*MEMORY[0x1E4F3B6B8];
  *(void *)(inited + 32) = *MEMORY[0x1E4F3B6B8];
  char v49 = (void **)MEMORY[0x1E4F3B550];
  *(unsigned char *)(inited + 40) = 1;
  uint64_t v50 = *v49;
  *(void *)(inited + 64) = v39;
  *(void *)(inited + 72) = v50;
  unint64_t v51 = 0xD00000000000002ALL;
  if (v25) {
    unint64_t v51 = 0xD000000000000032;
  }
  unint64_t v52 = 0x80000001B73A7A50;
  if (v25) {
    unint64_t v52 = 0x80000001B73A7A80;
  }
  unint64_t v53 = 0xD000000000000019;
  if (v25) {
    unint64_t v53 = 0xD000000000000021;
  }
  unint64_t v54 = 0x80000001B73A7A00;
  if (v25) {
    unint64_t v54 = 0x80000001B73A7A20;
  }
  int v158 = a6;
  if ((a6 & 1) == 0)
  {
    unint64_t v51 = v53;
    unint64_t v52 = v54;
  }
  uint64_t v55 = MEMORY[0x1E4FBB1A0];
  *(void *)(inited + 80) = v51;
  *(void *)(inited + 88) = v52;
  uint64_t v56 = (void *)*MEMORY[0x1E4F3B788];
  *(void *)(inited + 104) = v55;
  *(void *)(inited + 112) = v56;
  id v57 = v178;
  *(void *)(inited + 120) = v177;
  *(void *)(inited + 128) = v57;
  unint64_t v58 = (void *)*MEMORY[0x1E4F3B5D8];
  *(void *)(inited + 144) = v55;
  *(void *)(inited + 152) = v58;
  sub_1B729E55C(0, (unint64_t *)&qword_1E9E59160);
  uint64_t v177 = (__SecKey *)sub_1B7367F00();
  id v59 = v170;
  id v60 = v169;
  id v61 = v168;
  id v62 = v167;
  id v63 = v166;
  id v64 = v165;
  id v65 = v48;
  id v66 = v50;
  id v67 = v56;
  swift_bridgeObjectRetain();
  id v68 = v58;
  swift_bridgeObjectRetain();
  uint64_t v69 = (void *)sub_1B7383F70();
  id v70 = objc_msgSend(self, sel_cborWithDictionary_, v69);

  uint64_t v71 = sub_1B7383C90();
  unint64_t v73 = v72;
  swift_bridgeObjectRelease();
  if (v73 >> 60 == 15)
  {
    __break(1u);
    goto LABEL_87;
  }
  v47[23] = MEMORY[0x1E4F277B8];
  v47[20] = v71;
  v47[21] = v73;
  unint64_t v74 = sub_1B7375A28((uint64_t)v47);
  *(void *)(v36 + 344) = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9E59410);
  *(void *)(v36 + 320) = v74;
  sub_1B729E55C(0, &qword_1E9E59330);
  a6 = sub_1B73841A0();
  if ((os_log_t)sub_1B7383FC0() == v175 && v75 == v176)
  {
    swift_bridgeObjectRelease();
    goto LABEL_30;
  }
  char v76 = sub_1B7384590();
  swift_bridgeObjectRelease();
  if ((v76 & 1) == 0)
  {
    if (*MEMORY[0x1E4F3B858])
    {
      id v77 = (id)*MEMORY[0x1E4F3B858];
      unint64_t v78 = (void *)sub_1B7383FA0();
      objc_msgSend((id)a6, sel___swift_setObject_forKeyedSubscript_, v78, v77);

      goto LABEL_30;
    }
LABEL_87:
    __break(1u);
LABEL_88:
    swift_release();
    swift_release();
    __break(1u);
    JUMPOUT(0x1B736666CLL);
  }
LABEL_30:
  v183[0] = 0;
  RandomKey = SecKeyCreateRandomKey((CFDictionaryRef)a6, v183);
  if (RandomKey)
  {
    uint64_t v11 = RandomKey;
    v80 = SecKeyCopyPublicKey(RandomKey);
    if (v80)
    {
      id v31 = v80;
      CFDataRef v81 = SecKeyCopyExternalRepresentation(v80, v183);
      if (v81)
      {
        unint64_t v176 = v31;
        uint64_t v177 = v11;
        id v178 = (id)a6;
        CFDataRef v82 = v81;
        uint64_t v83 = sub_1B7383D00();
        unint64_t v85 = v84;

        sub_1B7369508(&qword_1E9E59310, 255, MEMORY[0x1E4F251E8]);
        uint64_t v86 = v172;
        sub_1B7383EA0();
        switch(v85 >> 62)
        {
          case 1uLL:
            if (v83 >> 32 < (int)v83) {
              __break(1u);
            }
            sub_1B735F794(v83, v85);
            os_log_t v127 = v173;
            id v128 = v164;
            sub_1B7367D68((int)v83, v83 >> 32);
            v164 = v128;
            sub_1B735B0E8(v83, v85);
            uint64_t v86 = v172;
            break;
          case 2uLL:
            uint64_t v124 = *(void *)(v83 + 16);
            uint64_t v125 = *(void *)(v83 + 24);
            sub_1B735F794(v83, v85);
            swift_retain();
            swift_retain();
            v126 = v164;
            sub_1B7367D68(v124, v125);
            v164 = v126;
            if (v126) {
              goto LABEL_88;
            }
            swift_release();
            swift_release();
            sub_1B735B0E8(v83, v85);
            uint64_t v86 = v172;
            os_log_t v127 = v173;
            break;
          case 3uLL:
            *(void *)((char *)&v182 + 6) = 0;
            *(void *)&long long v182 = 0;
            goto LABEL_59;
          default:
            *(void *)&long long v182 = v83;
            WORD4(v182) = v85;
            BYTE10(v182) = BYTE2(v85);
            BYTE11(v182) = BYTE3(v85);
            BYTE12(v182) = BYTE4(v85);
            BYTE13(v182) = BYTE5(v85);
LABEL_59:
            os_log_t v127 = v173;
            sub_1B7383E80();
            sub_1B735B0E8(v83, v85);
            break;
        }
        id v129 = v159;
        sub_1B7383E90();
        (*((void (**)(os_log_t, uint64_t))v171 + 1))(v127, v86);
        sub_1B735B0E8(v83, v85);
        sub_1B7383F40();
        (*(void (**)(unsigned char *, uint64_t))(v160 + 8))(v129, v161);
        swift_bridgeObjectRelease();
        long long v130 = v182;
        uint64_t v131 = sub_1B7383FC0();
        sub_1B735FF3C(v130, *((unint64_t *)&v130 + 1), v131, v132, v158 & 1, v162);
        swift_bridgeObjectRelease();
        sub_1B735B0E8(v130, *((unint64_t *)&v130 + 1));

        return;
      }
      swift_bridgeObjectRelease();
      if (qword_1E9E58F28 == -1) {
        goto LABEL_49;
      }
      goto LABEL_84;
    }
    swift_bridgeObjectRelease();
    if (qword_1E9E58F28 != -1) {
      swift_once();
    }
    uint64_t v98 = sub_1B7383E40();
    uint64_t v99 = __swift_project_value_buffer(v98, (uint64_t)qword_1E9E5B9C0);
    uint64_t v100 = *(void *)(v98 - 8);
    MEMORY[0x1F4188790](v99);
    id v102 = &v157[-((v101 + 15) & 0xFFFFFFFFFFFFFFF0)];
    (*(void (**)(unsigned char *))(v100 + 16))(v102);
    uint64_t v103 = sub_1B7383E10();
    int v104 = sub_1B73841C0();
    if (os_log_type_enabled(v103, (os_log_type_t)v104))
    {
      LODWORD(v174) = v104;
      os_log_t v175 = v103;
      v105 = (_DWORD *)swift_slowAlloc();
      os_log_t v173 = (os_log_t)swift_slowAlloc();
      os_log_t v181 = v173;
      uint64_t v172 = (uint64_t)v105;
      _DWORD *v105 = 136446210;
      swift_beginAccess();
      unint64_t v176 = (__SecKey *)v157;
      if (v183[0])
      {
        uint64_t v177 = v11;
        id v178 = (id)a6;
        uint64_t v106 = v183[0];
        *(void *)&long long v182 = 0;
        *((void *)&v182 + 1) = 0xE000000000000000;
        uint64_t v179 = v106;
        type metadata accessor for CFError(0);
        sub_1B7367EB4();
        uint64_t v107 = v106;
        uint64_t v108 = sub_1B7384570();
        if (v108)
        {
          v109 = (void *)v108;
        }
        else
        {
          v109 = (void *)swift_allocError();
          *uint64_t v141 = v179;
        }
        uint64_t v142 = (void *)sub_1B7383C30();

        id v143 = objc_msgSend(v142, sel_safari_privacyPreservingDescription);
        sub_1B7383FC0();

        sub_1B7384070();
        swift_bridgeObjectRelease();
        unint64_t v140 = *((void *)&v182 + 1);
        uint64_t v139 = v182;
        uint64_t v11 = v177;
        a6 = (uint64_t)v178;
      }
      else
      {
        uint64_t v139 = 0x206E776F6E6B6E55;
        unint64_t v140 = 0xED0000726F727265;
      }
      uint64_t v144 = (uint8_t *)v172;
      *(void *)&long long v182 = sub_1B7367544(v139, v140, (uint64_t *)&v181);
      sub_1B7384250();
      swift_bridgeObjectRelease();
      os_log_t v145 = v175;
      _os_log_impl(&dword_1B728F000, v175, (os_log_type_t)v174, "Could not read passkey public key: %{public}s", v144, 0xCu);
      os_log_t v146 = v173;
      swift_arrayDestroy();
      MEMORY[0x1BA9BDB10](v146, -1, -1);
      MEMORY[0x1BA9BDB10](v144, -1, -1);

      (*(void (**)(unsigned char *, uint64_t))(v100 + 8))(v102, v98);
    }
    else
    {

      (*(void (**)(unsigned char *, uint64_t))(v100 + 8))(v102, v98);
    }
    swift_beginAccess();
    if (v183[0]) {

    }
    sub_1B7367E60();
    swift_allocError();
    *(_DWORD *)uint64_t v147 = 1;
    *(unsigned char *)(v147 + 4) = 1;
    swift_willThrow();
  }
  else
  {
    swift_bridgeObjectRelease();
    if (qword_1E9E58F28 != -1) {
      swift_once();
    }
    uint64_t v87 = sub_1B7383E40();
    uint64_t v88 = __swift_project_value_buffer(v87, (uint64_t)qword_1E9E5B9C0);
    uint64_t v89 = *(void *)(v87 - 8);
    MEMORY[0x1F4188790](v88);
    unsigned int v91 = &v157[-((v90 + 15) & 0xFFFFFFFFFFFFFFF0)];
    (*(void (**)(unsigned char *))(v89 + 16))(v91);
    int v92 = sub_1B7383E10();
    int v93 = sub_1B73841C0();
    if (os_log_type_enabled(v92, (os_log_type_t)v93))
    {
      v94 = (__SecKey *)swift_slowAlloc();
      os_log_t v175 = (os_log_t)swift_slowAlloc();
      os_log_t v181 = v175;
      uint64_t v177 = v94;
      *(_DWORD *)v94 = 136446210;
      swift_beginAccess();
      id v178 = (id)a6;
      LODWORD(v176) = v93;
      if (v183[0])
      {
        os_log_t v173 = (os_log_t)v157;
        OSStatus v95 = v183[0];
        *(void *)&long long v182 = 0;
        *((void *)&v182 + 1) = 0xE000000000000000;
        uint64_t v179 = v95;
        type metadata accessor for CFError(0);
        sub_1B7367EB4();
        uint64_t v174 = v95;
        uint64_t v96 = sub_1B7384570();
        if (v96)
        {
          uint64_t v97 = (void *)v96;
        }
        else
        {
          uint64_t v97 = (void *)swift_allocError();
          *id v133 = v179;
        }
        v134 = (void *)sub_1B7383C30();

        id v135 = objc_msgSend(v134, sel_safari_privacyPreservingDescription);
        sub_1B7383FC0();

        sub_1B7384070();
        swift_bridgeObjectRelease();
        unint64_t v123 = *((void *)&v182 + 1);
        uint64_t v122 = v182;
      }
      else
      {
        uint64_t v122 = 0x206E776F6E6B6E55;
        unint64_t v123 = 0xED0000726F727265;
      }
      uint64_t v136 = (uint8_t *)v177;
      *(void *)&long long v182 = sub_1B7367544(v122, v123, (uint64_t *)&v181);
      sub_1B7384250();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1B728F000, v92, (os_log_type_t)v176, "Could not create passkey: %{public}s", v136, 0xCu);
      os_log_t v137 = v175;
      swift_arrayDestroy();
      MEMORY[0x1BA9BDB10](v137, -1, -1);
      MEMORY[0x1BA9BDB10](v136, -1, -1);

      (*(void (**)(unsigned char *, uint64_t))(v89 + 8))(v91, v87);
      a6 = (uint64_t)v178;
    }
    else
    {

      (*(void (**)(unsigned char *, uint64_t))(v89 + 8))(v91, v87);
    }
    swift_beginAccess();
    if (v183[0]) {

    }
    sub_1B7367E60();
    swift_allocError();
    *(_DWORD *)uint64_t v138 = 1;
    *(unsigned char *)(v138 + 4) = 1;
    swift_willThrow();
  }
}

uint64_t sub_1B736667C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  v14[3] = MEMORY[0x1E4FBB2B8];
  void v14[4] = MEMORY[0x1E4F27EF8];
  v14[0] = a1;
  v14[1] = a2;
  uint64_t v4 = __swift_project_boxed_opaque_existential_1Tm(v14, MEMORY[0x1E4FBB2B8]);
  unsigned int v5 = (unsigned char *)*v4;
  if (*v4 && (v6 = (unsigned char *)v4[1], uint64_t v7 = v6 - v5, v6 != v5))
  {
    if (v7 <= 14)
    {
      uint64_t v8 = sub_1B736CBC8(v5, v6);
      unint64_t v9 = v12 & 0xFFFFFFFFFFFFFFLL;
    }
    else if ((unint64_t)v7 >= 0x7FFFFFFF)
    {
      uint64_t v8 = sub_1B736CD10((uint64_t)v5, (uint64_t)v6);
      unint64_t v9 = v13 | 0x8000000000000000;
    }
    else
    {
      uint64_t v8 = sub_1B736CC8C((uint64_t)v5, (uint64_t)v6);
      unint64_t v9 = v11 | 0x4000000000000000;
    }
  }
  else
  {
    uint64_t v8 = 0;
    unint64_t v9 = 0xC000000000000000;
  }
  uint64_t result = __swift_destroy_boxed_opaque_existential_0((uint64_t)v14);
  *a3 = v8;
  a3[1] = v9;
  return result;
}

uint64_t WBSPasskeyStore.test_copyPasskey(credentialID:to:inRecentlyDeleted:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  *(void *)(v6 + 40) = a4;
  *(void *)(v6 + 48) = v5;
  *(unsigned char *)(v6 + 88) = a5;
  *(void *)(v6 + 24) = a2;
  *(void *)(v6 + 32) = a3;
  *(void *)(v6 + 16) = a1;
  *(void *)(v6 + 56) = type metadata accessor for WBSShareablePasskey();
  *(void *)(v6 + 64) = swift_task_alloc();
  *(void *)(v6 + 72) = swift_task_alloc();
  type metadata accessor for WBSKeychainPasskey();
  *(void *)(v6 + 80) = swift_task_alloc();
  type metadata accessor for WBSPasskeyStore();
  sub_1B7369508(&qword_1E9E59218, v7, (void (*)(uint64_t))type metadata accessor for WBSPasskeyStore);
  uint64_t v9 = sub_1B7384160();
  return MEMORY[0x1F4188298](sub_1B7366874, v9, v8);
}

uint64_t sub_1B7366874()
{
  uint64_t v1 = sub_1B7360F8C(*(uint8_t **)(v0 + 16), *(void **)(v0 + 24), *(unsigned char *)(v0 + 88));
  unint64_t v3 = v2;
  sub_1B7383D70();
  swift_allocObject();
  sub_1B735F794((uint64_t)v1, v3);
  sub_1B7383D60();
  sub_1B7369508(&qword_1E9E592D8, 255, (void (*)(uint64_t))type metadata accessor for WBSShareablePasskey);
  sub_1B7383D50();
  sub_1B735B0E8((uint64_t)v1, v3);
  swift_release();
  uint64_t v6 = *(void *)(v0 + 40);
  sub_1B7368DAC(*(void *)(v0 + 64), *(void *)(v0 + 72), (uint64_t (*)(void))type metadata accessor for WBSShareablePasskey);
  if (v6)
  {
    uint64_t v16 = *(void *)(v0 + 32);
    uint64_t v7 = *(void *)(v0 + 40);
  }
  else
  {
    uint64_t v16 = sub_1B7383FC0();
    uint64_t v7 = v8;
  }
  uint64_t v13 = *(uint64_t **)(v0 + 72);
  uint64_t v14 = *(void *)(v0 + 80);
  int v15 = *(unsigned __int8 *)(v0 + 88);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9E59238);
  uint64_t v9 = swift_task_alloc();
  uint64_t v10 = sub_1B7383D30();
  uint64_t v11 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56);
  v11(v9, 1, 1, v10);
  uint64_t v12 = swift_task_alloc();
  v11(v12, 1, 1, v10);
  swift_bridgeObjectRetain();
  WBSPasskeyStore.importPasskey(_:to:inRecentlyDeleted:importedCredentialID:lastModified:created:)(v13, v16, v7, v15, 0, 0xF000000000000000, v9, v12, v14);
  sub_1B735B0E8((uint64_t)v1, v3);
  swift_bridgeObjectRelease();
  sub_1B735B684(v12, &qword_1E9E59238);
  sub_1B735B684(v9, &qword_1E9E59238);
  sub_1B7368E14((uint64_t)v13, (uint64_t (*)(void))type metadata accessor for WBSShareablePasskey);
  sub_1B7368E14(*(void *)(v0 + 80), (uint64_t (*)(void))type metadata accessor for WBSKeychainPasskey);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v4 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v4(1);
}

uint64_t sub_1B7366D5C(void *a1, void *a2, char a3, void *aBlock, uint64_t a5)
{
  void v5[2] = a5;
  v5[3] = _Block_copy(aBlock);
  id v9 = a2;
  id v10 = a1;
  swift_retain();
  uint64_t v11 = sub_1B7383D00();
  uint64_t v13 = v12;

  if (a2)
  {
    a2 = (void *)sub_1B7383FC0();
    uint64_t v15 = v14;
  }
  else
  {
    uint64_t v15 = 0;
  }
  v5[4] = v15;
  v5[5] = v13;
  v5[6] = v11;
  uint64_t v16 = (void *)swift_task_alloc();
  v5[7] = v16;
  *uint64_t v16 = v5;
  v16[1] = sub_1B7366E88;
  return WBSPasskeyStore.test_copyPasskey(credentialID:to:inRecentlyDeleted:)(v11, v13, (uint64_t)a2, v15, a3 & 1);
}

uint64_t sub_1B7366E88(char a1)
{
  uint64_t v3 = *(void *)(*v1 + 48);
  unint64_t v4 = *(void *)(*v1 + 40);
  uint64_t v5 = *(void (***)(void, void))(*v1 + 24);
  uint64_t v8 = *v1;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  sub_1B735B0E8(v3, v4);
  swift_release();
  v5[2](v5, a1 & 1);
  _Block_release(v5);
  uint64_t v6 = *(uint64_t (**)(void))(v8 + 8);
  return v6();
}

uint64_t sub_1B736702C(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  unint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v4;
  *unint64_t v4 = v3;
  v4[1] = sub_1B735B9EC;
  return v6();
}

uint64_t sub_1B73670F8(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v5;
  *uint64_t v5 = v4;
  v5[1] = sub_1B735B9EC;
  return v7();
}

uint64_t sub_1B73671C4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1B7384180();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_1B7384170();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_1B735B684(a1, &qword_1E9E59058);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_1B7384160();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_1B7367370(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_1B736744C;
  return v6(a1);
}

uint64_t sub_1B736744C()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_1B7367544(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_1B7367618(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_1B735B2AC((uint64_t)v12, *a3);
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
      sub_1B735B2AC((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_1B7367618(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_1B7384260();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_1B73677D4(a5, a6);
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
  uint64_t v8 = sub_1B73843D0();
  if (!v8)
  {
    sub_1B7384450();
    __break(1u);
LABEL_17:
    uint64_t result = sub_1B73844C0();
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

uint64_t sub_1B73677D4(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_1B736786C(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_1B73679E4(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_1B73679E4(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_1B736786C(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_1B736B8AC(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_1B7384390();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_1B7384450();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_1B7384090();
      if (!v2) {
        return MEMORY[0x1E4FBC860];
      }
    }
    sub_1B73844C0();
    __break(1u);
LABEL_14:
    uint64_t result = sub_1B7384450();
    __break(1u);
  }
  else
  {
    return MEMORY[0x1E4FBC860];
  }
  return result;
}

uint64_t sub_1B73679E4(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9E59420);
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
  uint64_t v13 = a4 + 32;
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
  uint64_t result = sub_1B73844C0();
  __break(1u);
  return result;
}

uint64_t sub_1B7367B34(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9E59170);
    uint64_t v2 = sub_1B73844A0();
    uint64_t v18 = v2;
    sub_1B7384400();
    uint64_t v3 = sub_1B7384440();
    if (v3)
    {
      uint64_t v4 = v3;
      sub_1B729E55C(0, (unint64_t *)&qword_1E9E59160);
      do
      {
        swift_dynamicCast();
        swift_dynamicCast();
        uint64_t v2 = v18;
        unint64_t v12 = *(void *)(v18 + 16);
        if (*(void *)(v18 + 24) <= v12)
        {
          sub_1B7358128(v12 + 1, 1);
          uint64_t v2 = v18;
        }
        uint64_t result = sub_1B7384230();
        uint64_t v6 = v2 + 64;
        uint64_t v7 = -1 << *(unsigned char *)(v2 + 32);
        unint64_t v8 = result & ~v7;
        unint64_t v9 = v8 >> 6;
        if (((-1 << v8) & ~*(void *)(v2 + 64 + 8 * (v8 >> 6))) != 0)
        {
          unint64_t v10 = __clz(__rbit64((-1 << v8) & ~*(void *)(v2 + 64 + 8 * (v8 >> 6)))) | v8 & 0x7FFFFFFFFFFFFFC0;
        }
        else
        {
          char v13 = 0;
          unint64_t v14 = (unint64_t)(63 - v7) >> 6;
          do
          {
            if (++v9 == v14 && (v13 & 1) != 0)
            {
              __break(1u);
              return result;
            }
            BOOL v15 = v9 == v14;
            if (v9 == v14) {
              unint64_t v9 = 0;
            }
            v13 |= v15;
            uint64_t v16 = *(void *)(v6 + 8 * v9);
          }
          while (v16 == -1);
          unint64_t v10 = __clz(__rbit64(~v16)) + (v9 << 6);
        }
        *(void *)(v6 + ((v10 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v10;
        uint64_t v11 = 8 * v10;
        *(void *)(*(void *)(v2 + 48) + v11) = v17;
        *(void *)(*(void *)(v2 + 56) + v11) = v4;
        ++*(void *)(v2 + 16);
        uint64_t v4 = sub_1B7384440();
      }
      while (v4);
    }
    swift_release();
  }
  else
  {
    swift_unknownObjectRelease();
    return MEMORY[0x1E4FBC868];
  }
  return v2;
}

uint64_t sub_1B7367D68(uint64_t a1, uint64_t a2)
{
  uint64_t result = sub_1B7383BF0();
  if (!result || (uint64_t result = sub_1B7383C10(), !__OFSUB__(a1, result)))
  {
    if (!__OFSUB__(a2, a1))
    {
      sub_1B7383C00();
      sub_1B7383F60();
      sub_1B7369508(&qword_1E9E59310, 255, MEMORY[0x1E4F251E8]);
      return sub_1B7383E80();
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_1B7367E4C(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_1B735F794(a1, a2);
  }
  return a1;
}

unint64_t sub_1B7367E60()
{
  unint64_t result = qword_1E9E59318;
  if (!qword_1E9E59318)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9E59318);
  }
  return result;
}

unint64_t sub_1B7367EB4()
{
  unint64_t result = qword_1E9E59320;
  if (!qword_1E9E59320)
  {
    type metadata accessor for CFError(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9E59320);
  }
  return result;
}

unint64_t sub_1B7367F00()
{
  unint64_t result = qword_1E9E59328;
  if (!qword_1E9E59328)
  {
    sub_1B729E55C(255, (unint64_t *)&qword_1E9E59160);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9E59328);
  }
  return result;
}

uint64_t sub_1B7367F5C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9E59238);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1B7367FC4(uint64_t *a1)
{
  unint64_t v1 = a1[1];
  if (v1 >> 60 != 15)
  {
    uint64_t v8 = *a1;
    sub_1B7367E4C(*a1, v1);
    sub_1B729E55C(0, (unint64_t *)&qword_1E9E59160);
    sub_1B7367F00();
    swift_bridgeObjectRetain();
    unint64_t v9 = (void *)sub_1B7383F70();
    id v10 = objc_msgSend(self, sel_cborWithDictionary_, v9);

    uint64_t v11 = sub_1B7383C90();
    unint64_t v13 = v12;
    swift_bridgeObjectRelease();
    if (v13 >> 60 == 15)
    {
      if (qword_1E9E58F28 != -1) {
        swift_once();
      }
      uint64_t v14 = sub_1B7383E40();
      __swift_project_value_buffer(v14, (uint64_t)qword_1E9E5B9C0);
      BOOL v15 = sub_1B7383E10();
      os_log_type_t v16 = sub_1B73841C0();
      if (os_log_type_enabled(v15, v16))
      {
        uint64_t v17 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v17 = 0;
        _os_log_impl(&dword_1B728F000, v15, v16, "Could not encode passkey metadata", v17, 2u);
        MEMORY[0x1BA9BDB10](v17, -1, -1);
      }

      sub_1B7367E60();
      swift_allocError();
      *(_DWORD *)uint64_t v18 = 2;
      *(unsigned char *)(v18 + 4) = 1;
      swift_willThrow();
      uint64_t v19 = v8;
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_1E9E59300);
      uint64_t v20 = swift_allocObject();
      *(_OWORD *)(v20 + 16) = xmmword_1B7390260;
      uint64_t v42 = v11;
      uint64_t v21 = (void *)*MEMORY[0x1E4F3BD40];
      type metadata accessor for CFString(0);
      uint64_t v23 = v22;
      *(void *)(v20 + 32) = v21;
      *(void *)(v20 + 88) = MEMORY[0x1E4F277B8];
      *(void *)(v20 + 56) = v22;
      *(void *)(v20 + 64) = v8;
      *(void *)(v20 + 72) = v1;
      sub_1B729E55C(0, &qword_1E9E59308);
      uint64_t v24 = v8;
      sub_1B7367E4C(v8, v1);
      id v25 = v21;
      CFDictionaryRef v26 = (const __CFDictionary *)sub_1B73841A0();
      uint64_t v27 = swift_allocObject();
      *(_OWORD *)(v27 + 16) = xmmword_1B7390260;
      uint64_t v28 = (void *)*MEMORY[0x1E4F3B5D8];
      *(void *)(v27 + 32) = *MEMORY[0x1E4F3B5D8];
      *(void *)(v27 + 88) = MEMORY[0x1E4F277B8];
      *(void *)(v27 + 56) = v23;
      *(void *)(v27 + 64) = v42;
      *(void *)(v27 + 72) = v13;
      id v29 = v28;
      sub_1B7367E4C(v42, v13);
      CFDictionaryRef v30 = v26;
      CFDictionaryRef v31 = (const __CFDictionary *)sub_1B73841A0();
      OSStatus v32 = SecItemUpdate(v26, v31);
      if (!v32)
      {

        sub_1B735F96C(v42, v13);
        return sub_1B735F96C(v24, v1);
      }
      OSStatus v33 = v32;
      uint64_t v34 = v24;
      if (qword_1E9E58F28 != -1) {
        swift_once();
      }
      uint64_t v35 = sub_1B7383E40();
      __swift_project_value_buffer(v35, (uint64_t)qword_1E9E5B9C0);
      uint64_t v36 = sub_1B7383E10();
      os_log_type_t v37 = sub_1B73841C0();
      if (os_log_type_enabled(v36, v37))
      {
        CFDictionaryRef v38 = v30;
        uint64_t v39 = (uint8_t *)swift_slowAlloc();
        *(_DWORD *)uint64_t v39 = 67240192;
        sub_1B7384250();
        _os_log_impl(&dword_1B728F000, v36, v37, "Could not update passkey: %{public}d", v39, 8u);
        id v40 = v39;
        CFDictionaryRef v30 = v38;
        MEMORY[0x1BA9BDB10](v40, -1, -1);
      }

      sub_1B7367E60();
      swift_allocError();
      *(_DWORD *)uint64_t v41 = v33;
      *(unsigned char *)(v41 + 4) = 0;
      swift_willThrow();

      sub_1B735F96C(v42, v13);
      uint64_t v19 = v34;
    }
    return sub_1B735F96C(v19, v1);
  }
  if (qword_1E9E58F28 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_1B7383E40();
  __swift_project_value_buffer(v2, (uint64_t)qword_1E9E5B9C0);
  uint64_t v3 = sub_1B7383E10();
  os_log_type_t v4 = sub_1B73841C0();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_1B728F000, v3, v4, "No persistent ref specified", v5, 2u);
    MEMORY[0x1BA9BDB10](v5, -1, -1);
  }

  sub_1B7367E60();
  swift_allocError();
  *(_DWORD *)uint64_t v6 = 0;
  *(unsigned char *)(v6 + 4) = 1;
  return swift_willThrow();
}

uint64_t sub_1B736852C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  *(void *)(v9 + 72) = a8;
  *(void *)(v9 + 80) = v8;
  *(unsigned char *)(v9 + 96) = v15;
  *(void *)(v9 + 56) = a6;
  *(void *)(v9 + 64) = a7;
  *(void *)(v9 + 40) = a4;
  *(void *)(v9 + 48) = a5;
  *(void *)(v9 + 24) = a2;
  *(void *)(v9 + 32) = a3;
  *(void *)(v9 + 16) = a1;
  type metadata accessor for WBSKeychainPasskey();
  *(void *)(v9 + 88) = swift_task_alloc();
  type metadata accessor for WBSPasskeyStore();
  sub_1B7369508(&qword_1E9E59218, v10, (void (*)(uint64_t))type metadata accessor for WBSPasskeyStore);
  uint64_t v12 = sub_1B7384160();
  return MEMORY[0x1F4188298](sub_1B7368628, v12, v11);
}

uint64_t sub_1B7368628()
{
  uint64_t v19 = v0;
  if (*(void *)(v0 + 72))
  {
    os_log_type_t v16 = *(NSObject **)(v0 + 64);
    unint64_t v1 = *(__SecKey **)(v0 + 72);
  }
  else
  {
    os_log_type_t v16 = sub_1B7383FC0();
    unint64_t v1 = v2;
  }
  uint64_t v3 = *(void *)(v0 + 88);
  uint64_t v4 = *(unsigned __int8 *)(v0 + 96);
  uint64_t v6 = *(void *)(v0 + 48);
  unint64_t v5 = *(void *)(v0 + 56);
  uint64_t v8 = *(__SecKey **)(v0 + 32);
  uint64_t v7 = *(void **)(v0 + 40);
  uint64_t v10 = *(void *)(v0 + 16);
  uint64_t v9 = *(void *)(v0 + 24);
  swift_bridgeObjectRetain();
  sub_1B735F794(v6, v5);
  swift_bridgeObjectRetain();
  WBSKeychainPasskey.Metadata.init(name:displayName:userHandle:largeBlob:prfCredRandomWithUV:)(v10, v9, 0, 0, v6, v5, 0, 0xF000000000000000, (unint64_t *)&v17, 0, 0xF000000000000000);
  uint64_t v18 = v17;
  sub_1B736517C(v8, v7, &v18, v16, v1, v4, 0, 0, v3);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v11 = *(void *)(v0 + 88);
  uint64_t v12 = *(void *)(v11 + 40);
  unint64_t v13 = *(void *)(v11 + 48);
  sub_1B735F794(v12, v13);
  sub_1B7368E14(v11, (uint64_t (*)(void))type metadata accessor for WBSKeychainPasskey);
  swift_task_dealloc();
  uint64_t v14 = *(uint64_t (**)(uint64_t, unint64_t))(v0 + 8);
  return v14(v12, v13);
}

uint64_t sub_1B736880C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  *(void *)(v9 + 72) = a8;
  *(void *)(v9 + 80) = v8;
  *(unsigned char *)(v9 + 97) = v16;
  *(unsigned char *)(v9 + 96) = v15;
  *(void *)(v9 + 56) = a6;
  *(void *)(v9 + 64) = a7;
  *(void *)(v9 + 40) = a4;
  *(void *)(v9 + 48) = a5;
  *(void *)(v9 + 24) = a2;
  *(void *)(v9 + 32) = a3;
  *(void *)(v9 + 16) = a1;
  type metadata accessor for WBSKeychainPasskey();
  *(void *)(v9 + 88) = swift_task_alloc();
  type metadata accessor for WBSPasskeyStore();
  sub_1B7369508(&qword_1E9E59218, v10, (void (*)(uint64_t))type metadata accessor for WBSPasskeyStore);
  uint64_t v12 = sub_1B7384160();
  return MEMORY[0x1F4188298](sub_1B7368910, v12, v11);
}

uint64_t sub_1B7368910()
{
  uint64_t v20 = v0;
  if (*(void *)(v0 + 72))
  {
    uint64_t v17 = *(NSObject **)(v0 + 64);
    unint64_t v1 = *(__SecKey **)(v0 + 72);
  }
  else
  {
    uint64_t v17 = sub_1B7383FC0();
    unint64_t v1 = v2;
  }
  uint64_t v3 = *(void *)(v0 + 88);
  char v16 = *(unsigned char *)(v0 + 97);
  uint64_t v4 = *(unsigned __int8 *)(v0 + 96);
  uint64_t v6 = *(void *)(v0 + 48);
  unint64_t v5 = *(void *)(v0 + 56);
  uint64_t v7 = *(__SecKey **)(v0 + 32);
  uint64_t v8 = *(void **)(v0 + 40);
  uint64_t v9 = *(void *)(v0 + 16);
  uint64_t v10 = *(void *)(v0 + 24);
  swift_bridgeObjectRetain();
  sub_1B735F794(v6, v5);
  swift_bridgeObjectRetain();
  WBSKeychainPasskey.Metadata.init(name:displayName:userHandle:largeBlob:prfCredRandomWithUV:)(v9, v10, 0, 0, v6, v5, 0, 0xF000000000000000, (unint64_t *)&v18, 0, 0xF000000000000000);
  uint64_t v19 = v18;
  sub_1B736517C(v7, v8, &v19, v17, v1, v4, 0, v16, v3);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v11 = *(void *)(v0 + 88);
  uint64_t v12 = *(void *)(v11 + 40);
  unint64_t v13 = *(void *)(v11 + 48);
  sub_1B735F794(v12, v13);
  sub_1B7368E14(v11, (uint64_t (*)(void))type metadata accessor for WBSKeychainPasskey);
  swift_task_dealloc();
  uint64_t v14 = *(uint64_t (**)(uint64_t, unint64_t))(v0 + 8);
  return v14(v12, v13);
}

uint64_t sub_1B7368AFC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v7[7] = a6;
  v7[8] = v6;
  v7[5] = a4;
  void v7[6] = a5;
  v7[3] = a2;
  void v7[4] = a3;
  v7[2] = a1;
  type metadata accessor for WBSKeychainPasskey();
  v7[9] = swift_task_alloc();
  type metadata accessor for WBSPasskeyStore();
  sub_1B7369508(&qword_1E9E59218, v8, (void (*)(uint64_t))type metadata accessor for WBSPasskeyStore);
  uint64_t v10 = sub_1B7384160();
  return MEMORY[0x1F4188298](sub_1B7368BE8, v10, v9);
}

uint64_t sub_1B7368BE8()
{
  uint64_t v18 = v0;
  uint64_t v1 = v0[9];
  uint64_t v3 = v0[6];
  unint64_t v2 = v0[7];
  unint64_t v5 = (__SecKey *)v0[4];
  uint64_t v4 = (void *)v0[5];
  uint64_t v7 = v0[2];
  uint64_t v6 = v0[3];
  uint64_t v8 = sub_1B7383FC0();
  uint64_t v10 = v9;
  sub_1B735F794(v3, v2);
  swift_bridgeObjectRetain();
  WBSKeychainPasskey.Metadata.init(name:displayName:userHandle:largeBlob:prfCredRandomWithUV:)(v7, v6, 0, 0, v3, v2, 0, 0xF000000000000000, (unint64_t *)&v16, 0, 0xF000000000000000);
  uint64_t v17 = v16;
  sub_1B736517C(v5, v4, &v17, v8, v10, 0, 1, 0, v1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v11 = v0[9];
  uint64_t v12 = *(void *)(v11 + 40);
  unint64_t v13 = *(void *)(v11 + 48);
  sub_1B735F794(v12, v13);
  sub_1B7368E14(v11, (uint64_t (*)(void))type metadata accessor for WBSKeychainPasskey);
  swift_task_dealloc();
  uint64_t v14 = (uint64_t (*)(uint64_t, unint64_t))v0[1];
  return v14(v12, v13);
}

uint64_t sub_1B7368DAC(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_1B7368E14(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t method lookup function for WBSPasskeyStore(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for WBSPasskeyStore);
}

uint64_t dispatch thunk of WBSPasskeyStore.__allocating_init(forTesting:queue:)()
{
  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t __swift_memcpy5_4(uint64_t result, int *a2)
{
  int v2 = *a2;
  *(unsigned char *)(result + 4) = *((unsigned char *)a2 + 4);
  *(_DWORD *)unint64_t result = v2;
  return result;
}

uint64_t getEnumTagSinglePayload for WBSPasskeyStore.PasskeyStoreError(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 5)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for WBSPasskeyStore.PasskeyStoreError(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(unsigned char *)(result + 4) = 0;
    *(_DWORD *)unint64_t result = a2 - 1;
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }
  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }
  *(unsigned char *)(result + 5) = v3;
  return result;
}

uint64_t sub_1B7368F04(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 4)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_1B7368F24(uint64_t result, int a2)
{
  if (a2)
  {
    *(_DWORD *)unint64_t result = a2 - 1;
    *(unsigned char *)(result + 4) = 1;
  }
  else
  {
    *(unsigned char *)(result + 4) = 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for WBSPasskeyStore.PasskeyStoreError()
{
  return &type metadata for WBSPasskeyStore.PasskeyStoreError;
}

uint64_t sub_1B7368F54()
{
  _Block_release(*(const void **)(v0 + 40));
  swift_release();
  return MEMORY[0x1F4186498](v0, 56, 7);
}

uint64_t sub_1B7368FA4()
{
  int v2 = *(void **)(v0 + 16);
  char v3 = *(void **)(v0 + 24);
  char v4 = *(unsigned char *)(v0 + 32);
  uint64_t v6 = *(void **)(v0 + 40);
  uint64_t v5 = *(void *)(v0 + 48);
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v7;
  *uint64_t v7 = v1;
  v7[1] = sub_1B735B4D0;
  uint64_t v8 = (uint64_t (*)(void *, void *, char, void *, uint64_t))((char *)&dword_1E9E59370 + dword_1E9E59370);
  return v8(v2, v3, v4, v6, v5);
}

uint64_t sub_1B7369074()
{
  swift_release();
  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_1B73690AC(uint64_t a1)
{
  char v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_1B735B4D0;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_1E9E59390 + dword_1E9E59390);
  return v6(a1, v4);
}

uint64_t sub_1B7369164()
{
  _Block_release(*(const void **)(v0 + 48));
  swift_release();
  return MEMORY[0x1F4186498](v0, 64, 7);
}

uint64_t sub_1B73691C4()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v4 = v0[4];
  uint64_t v5 = (void *)v0[5];
  uint64_t v7 = (void *)v0[6];
  uint64_t v6 = v0[7];
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v8;
  *uint64_t v8 = v1;
  v8[1] = sub_1B735B9EC;
  uint64_t v9 = (uint64_t (*)(int, int, int, void *, void *, uint64_t))((char *)&dword_1E9E593A0 + dword_1E9E593A0);
  return v9(v2, v3, v4, v5, v7, v6);
}

void sub_1B73692A4()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  void *v1 = v0;
  v1[1] = sub_1B735B9EC;
  uint64_t v2 = (char *)&dword_1E9E593C0 + dword_1E9E593C0;
  __asm { BR              X8; sub_1B7364A0C }
}

uint64_t objectdestroy_45Tm()
{
  _Block_release(*(const void **)(v0 + 64));
  swift_release();
  return MEMORY[0x1F4186498](v0, 80, 7);
}

void sub_1B7369414(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t v11 = *(void *)(v9 + 16);
  uint64_t v12 = *(void *)(v9 + 24);
  uint64_t v13 = *(void *)(v9 + 32);
  uint64_t v14 = *(void **)(v9 + 40);
  char v15 = *(void **)(v9 + 48);
  int v16 = *(unsigned __int8 *)(v9 + 56);
  uint64_t v18 = *(void **)(v9 + 64);
  uint64_t v17 = *(void *)(v9 + 72);
  uint64_t v19 = (void *)swift_task_alloc();
  *(void *)(v10 + 16) = v19;
  *uint64_t v19 = v10;
  v19[1] = sub_1B735B9EC;
  uint64_t v20 = (void (*)(int, int, int, void *, void *, int, void *, uint64_t, char))((char *)&dword_1E9E593E0
                                                                                       + dword_1E9E593E0);
  v20(v11, v12, v13, v14, v15, v16, v18, v17, a9);
}

uint64_t sub_1B7369508(unint64_t *a1, uint64_t a2, void (*a3)(uint64_t))
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

void *__swift_project_boxed_opaque_existential_1Tm(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_1B7369598(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for WBSKeychainPasskey();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

void __swiftcall UI_STRING_PLURAL_VAR(_:_:_:_:)(SafariCore::WBSLocalizedPluralVariable *__return_ptr retstr, SafariCore::WBSLocalizedStringLiteral a2, SafariCore::WBSLocalizedStringLiteral a3, SafariCore::WBSLocalizedStringLiteral a4, SafariCore::WBSLocalizedStringLiteral a5)
{
  uint64_t v5 = *(void *)a2.stringValue._countAndFlagsBits;
  a2.stringValue._uint64_t countAndFlagsBits = *(void *)(a2.stringValue._countAndFlagsBits + 8);
  uint64_t v6 = *(void *)a2.stringValue._object;
  uint64_t v7 = (void *)*((void *)a2.stringValue._object + 1);
  uint64_t v8 = *(void *)a3.stringValue._countAndFlagsBits;
  uint64_t v9 = *(void **)(a3.stringValue._countAndFlagsBits + 8);
  uint64_t v10 = *(void *)a3.stringValue._object;
  uint64_t v11 = (void *)*((void *)a3.stringValue._object + 1);
  retstr->name._uint64_t countAndFlagsBits = v5;
  retstr->name._object = (void *)a2.stringValue._countAndFlagsBits;
  retstr->type._uint64_t countAndFlagsBits = v6;
  retstr->type._object = v7;
  retstr->oneFormatString._uint64_t countAndFlagsBits = v8;
  retstr->oneFormatString._object = v9;
  retstr->otherFormatString._uint64_t countAndFlagsBits = v10;
  retstr->otherFormatString._object = v11;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
}

void *sub_1B7369670@<X0>(void *result@<X0>, void *a2@<X8>)
{
  uint64_t v2 = result[1];
  *a2 = *result;
  a2[1] = v2;
  return result;
}

unint64_t sub_1B7369680()
{
  unint64_t result = qword_1E9E59430;
  if (!qword_1E9E59430)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9E59430);
  }
  return result;
}

uint64_t sub_1B73696D4()
{
  return MEMORY[0x1E4FBB220];
}

unint64_t sub_1B73696E4()
{
  unint64_t result = qword_1E9E59438;
  if (!qword_1E9E59438)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9E59438);
  }
  return result;
}

uint64_t sub_1B7369738()
{
  return MEMORY[0x1E4FBB230];
}

uint64_t sub_1B7369744()
{
  return MEMORY[0x1E4FBB228];
}

uint64_t initializeBufferWithCopyOfBuffer for WBSLocalizedPluralVariable(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for WBSLocalizedPluralVariable()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for WBSLocalizedPluralVariable(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  uint64_t v5 = a2[5];
  a1[4] = a2[4];
  a1[5] = v5;
  uint64_t v6 = a2[7];
  a1[6] = a2[6];
  a1[7] = v6;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for WBSLocalizedPluralVariable(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  a1[5] = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[6] = a2[6];
  a1[7] = a2[7];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy64_8(uint64_t a1, uint64_t a2)
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

void *assignWithTake for WBSLocalizedPluralVariable(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  swift_bridgeObjectRelease();
  uint64_t v6 = a2[5];
  a1[4] = a2[4];
  a1[5] = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = a2[7];
  a1[6] = a2[6];
  a1[7] = v7;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for WBSLocalizedPluralVariable(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for WBSLocalizedPluralVariable(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for WBSLocalizedPluralVariable()
{
  return &type metadata for WBSLocalizedPluralVariable;
}

void *initializeBufferWithCopyOfBuffer for WBSLocalizedStringLiteral(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for WBSLocalizedStringLiteral(void *a1, void *a2)
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

void *assignWithTake for WBSLocalizedStringLiteral(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for WBSLocalizedStringLiteral(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 16)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for WBSLocalizedStringLiteral(uint64_t result, int a2, int a3)
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

uint64_t sub_1B7369B4C(uint64_t a1, unint64_t a2)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = a2 >> 62;
  uint64_t v4 = MEMORY[0x1E4FBC860];
  switch(a2 >> 62)
  {
    case 1uLL:
      if (__OFSUB__(HIDWORD(a1), a1)) {
        goto LABEL_45;
      }
      uint64_t v5 = HIDWORD(a1) - (int)a1;
LABEL_6:
      if (!v5) {
        return v4;
      }
      uint64_t v38 = MEMORY[0x1E4FBC860];
      int64_t v8 = v5 & ~(v5 >> 63);
      sub_1B7372F2C(0, v8, 0);
      uint64_t v9 = a1;
      uint64_t v4 = v38;
      if (!v3)
      {
        if ((v5 & 0x8000000000000000) == 0)
        {
          uint64_t v10 = 0;
          goto LABEL_14;
        }
LABEL_47:
        __break(1u);
LABEL_48:
        __break(1u);
LABEL_49:
        __break(1u);
      }
      if (v3 == 1) {
        uint64_t v10 = (int)a1;
      }
      else {
        uint64_t v10 = *(void *)(a1 + 16);
      }
      if (v5 < 0) {
        goto LABEL_44;
      }
      while (1)
      {
LABEL_14:
        if (!v8)
        {
          __break(1u);
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
LABEL_40:
          __break(1u);
LABEL_41:
          __break(1u);
LABEL_42:
          __break(1u);
LABEL_43:
          __break(1u);
LABEL_44:
          __break(1u);
LABEL_45:
          __break(1u);
LABEL_46:
          __break(1u);
          goto LABEL_47;
        }
        int64_t v30 = v8;
        if (v3)
        {
          if (v3 == 1)
          {
            if (v10 < (int)a1 || v10 >= a1 >> 32) {
              goto LABEL_38;
            }
            uint64_t v11 = v4;
            uint64_t v12 = v2;
            uint64_t v13 = sub_1B7383BF0();
            if (!v13) {
              goto LABEL_48;
            }
            uint64_t v14 = v13;
            uint64_t v15 = sub_1B7383C10();
            uint64_t v16 = v10 - v15;
            if (__OFSUB__(v10, v15)) {
              goto LABEL_41;
            }
          }
          else
          {
            if (v10 < *(void *)(v9 + 16)) {
              goto LABEL_40;
            }
            if (v10 >= *(void *)(v9 + 24)) {
              goto LABEL_42;
            }
            uint64_t v11 = v4;
            uint64_t v12 = v2;
            uint64_t v18 = sub_1B7383BF0();
            if (!v18) {
              goto LABEL_49;
            }
            uint64_t v14 = v18;
            uint64_t v19 = sub_1B7383C10();
            uint64_t v16 = v10 - v19;
            if (__OFSUB__(v10, v19)) {
              goto LABEL_43;
            }
          }
          char v17 = *(unsigned char *)(v14 + v16);
          uint64_t v2 = v12;
          uint64_t v9 = a1;
        }
        else
        {
          if (v10 >= BYTE6(a2)) {
            goto LABEL_39;
          }
          uint64_t v11 = v4;
          char v31 = v9;
          int v32 = *(_DWORD *)((char *)&a1 + 1);
          __int16 v33 = *(_WORD *)((char *)&a1 + 5);
          char v34 = HIBYTE(a1);
          int v35 = a2;
          __int16 v36 = WORD2(a2);
          char v17 = *(&v31 + v10);
        }
        char v31 = v17;
        sub_1B736A334(&v31, v37);
        if (v2) {
          break;
        }
        uint64_t v20 = v9;
        unint64_t v21 = v3;
        uint64_t v23 = v37[0];
        uint64_t v22 = v37[1];
        uint64_t v4 = v11;
        uint64_t v38 = v11;
        unint64_t v25 = *(void *)(v11 + 16);
        unint64_t v24 = *(void *)(v11 + 24);
        if (v25 >= v24 >> 1)
        {
          sub_1B7372F2C(v24 > 1, v25 + 1, 1);
          uint64_t v20 = a1;
          uint64_t v4 = v38;
        }
        *(void *)(v4 + 16) = v25 + 1;
        uint64_t v26 = v4 + 16 * v25;
        *(void *)(v26 + 32) = v23;
        *(void *)(v26 + 40) = v22;
        ++v10;
        int64_t v8 = v30 - 1;
        --v5;
        unint64_t v3 = v21;
        uint64_t v9 = v20;
        if (!v5) {
          return v4;
        }
      }
      swift_release();
      return v4;
    case 2uLL:
      uint64_t v7 = *(void *)(a1 + 16);
      uint64_t v6 = *(void *)(a1 + 24);
      uint64_t v5 = v6 - v7;
      if (!__OFSUB__(v6, v7)) {
        goto LABEL_6;
      }
      goto LABEL_46;
    case 3uLL:
      return v4;
    default:
      uint64_t v5 = BYTE6(a2);
      goto LABEL_6;
  }
}

uint64_t Data.init(base64URLEncoded:)()
{
  sub_1B735FD8C();
  sub_1B7384270();
  swift_bridgeObjectRelease();
  sub_1B7384270();
  swift_bridgeObjectRelease();
  uint64_t v0 = sub_1B7384060();
  uint64_t v1 = v0 & 3;
  if (v0 <= 0) {
    uint64_t v1 = -(-v0 & 3);
  }
  if (v1 >= 1)
  {
    MEMORY[0x1BA9BBAF0](61, 0xE100000000000000, 4 - v1);
    swift_bridgeObjectRetain();
    sub_1B7384070();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  uint64_t v2 = sub_1B7383CA0();
  swift_bridgeObjectRelease();
  return v2;
}

uint64_t sub_1B736A074(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = a3;
  uint64_t v17 = *(void *)(a3 + 16);
  if (v17)
  {
    uint64_t v5 = (uint64_t (*)(void *))result;
    unint64_t v6 = 0;
    uint64_t v7 = (uint64_t *)(a3 + 40);
    uint64_t v8 = MEMORY[0x1E4FBC860];
    uint64_t v15 = (uint64_t (*)(void *))result;
    while (v6 < *(void *)(v4 + 16))
    {
      uint64_t v10 = *(v7 - 1);
      uint64_t v9 = *v7;
      v18[0] = v10;
      v18[1] = v9;
      swift_bridgeObjectRetain();
      char v11 = v5(v18);
      if (v3)
      {
        swift_release();
        swift_bridgeObjectRelease();
        goto LABEL_16;
      }
      if (v11)
      {
        __n128 result = swift_isUniquelyReferenced_nonNull_native();
        uint64_t v19 = v8;
        if ((result & 1) == 0)
        {
          __n128 result = sub_1B7372F4C(0, *(void *)(v8 + 16) + 1, 1);
          uint64_t v8 = v19;
        }
        unint64_t v13 = *(void *)(v8 + 16);
        unint64_t v12 = *(void *)(v8 + 24);
        if (v13 >= v12 >> 1)
        {
          __n128 result = sub_1B7372F4C(v12 > 1, v13 + 1, 1);
          uint64_t v8 = v19;
        }
        *(void *)(v8 + 16) = v13 + 1;
        uint64_t v14 = v8 + 16 * v13;
        *(void *)(v14 + 32) = v10;
        *(void *)(v14 + 40) = v9;
        uint64_t v4 = a3;
        uint64_t v5 = v15;
      }
      else
      {
        __n128 result = swift_bridgeObjectRelease();
      }
      ++v6;
      v7 += 2;
      if (v17 == v6) {
        goto LABEL_16;
      }
    }
    __break(1u);
  }
  else
  {
    uint64_t v8 = MEMORY[0x1E4FBC860];
LABEL_16:
    swift_bridgeObjectRelease();
    return v8;
  }
  return result;
}

uint64_t Data.init(randomWithLength:)(size_t a1)
{
  uint64_t v2 = sub_1B736B304(0, a1);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = (uint64_t)sub_1B736B7B0(0, *(void *)(v2 + 16), 0, (char *)v2);
  }
  if (SecRandomCopyBytes(0, a1, (void *)(v2 + 32)))
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    uint64_t v3 = sub_1B736CD8C(v2);
    swift_bridgeObjectRelease();
  }
  return v3;
}

Swift::String __swiftcall Data.hexString()()
{
  sub_1B7369B4C(v0, v1);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9E590B0);
  sub_1B736CE60(&qword_1E9E59440, &qword_1E9E590B0);
  uint64_t v2 = sub_1B7383F90();
  uint64_t v4 = v3;
  swift_bridgeObjectRelease();
  uint64_t v5 = v2;
  unint64_t v6 = v4;
  result._object = v6;
  result._uint64_t countAndFlagsBits = v5;
  return result;
}

uint64_t sub_1B736A334@<X0>(char *a1@<X0>, uint64_t *a2@<X8>)
{
  char v3 = *a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9E59088);
  uint64_t v4 = swift_allocObject();
  uint64_t v5 = MEMORY[0x1E4FBC358];
  *(_OWORD *)(v4 + 16) = xmmword_1B7390260;
  uint64_t v6 = MEMORY[0x1E4FBC3B0];
  *(void *)(v4 + 56) = v5;
  *(void *)(v4 + 64) = v6;
  *(unsigned char *)(v4 + 32) = v3;
  uint64_t result = sub_1B7383FE0();
  *a2 = result;
  a2[1] = v8;
  return result;
}

uint64_t Data.init(hexString:)(uint64_t a1, unint64_t a2)
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (uint64_t *)sub_1B7383BD0();
  uint64_t v6 = (unint64_t *)*(v5 - 1);
  MEMORY[0x1F4188790](v5);
  unint64_t v52 = (char *)&v49 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B7383BB0();
  uint64_t v8 = sub_1B7384060();
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = (long long *)sub_1B736C4B0(v8, 0);
    swift_bridgeObjectRetain();
    char v11 = sub_1B736C3F4(v56, (uint64_t *)v10 + 4, v9, a1, a2);
    swift_bridgeObjectRelease();
    if (v11 != (uint64_t *)v9) {
      goto LABEL_79;
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v10 = (long long *)MEMORY[0x1E4FBC860];
  }
  uint64_t v54 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9E59448);
  uint64_t inited = swift_initStackObject();
  *(void *)(inited + 32) = 48;
  long long v53 = xmmword_1B73906D0;
  *(_OWORD *)(inited + 16) = xmmword_1B73906D0;
  *(void *)(inited + 40) = 0xE100000000000000;
  *(void *)(inited + 48) = 120;
  *(void *)(inited + 56) = 0xE100000000000000;
  char v13 = sub_1B736ABB4(inited, v10);
  swift_setDeallocating();
  swift_retain();
  swift_arrayDestroy();
  uint64_t v14 = swift_release();
  char v11 = (uint64_t *)v52;
  if ((v13 & 1) == 0)
  {
    uint64_t i = (uint64_t)v10;
    goto LABEL_16;
  }
  unint64_t v2 = *((void *)v10 + 2);
  if (v2 >= 2) {
    a2 = 2;
  }
  else {
    a2 = *((void *)v10 + 2);
  }
  sub_1B73845A0();
  swift_unknownObjectRetain_n();
  uint64_t v15 = swift_dynamicCastClass();
  if (!v15)
  {
    swift_release();
    uint64_t v15 = MEMORY[0x1E4FBC860];
  }
  uint64_t v16 = *(void *)(v15 + 16);
  swift_release();
  if (v16 != v2 - a2) {
    goto LABEL_80;
  }
  uint64_t i = swift_dynamicCastClass();
  uint64_t v14 = swift_release();
  if (i) {
    goto LABEL_16;
  }
  for (uint64_t i = MEMORY[0x1E4FBC860]; ; uint64_t i = sub_1B736B990((uint64_t)v10, (uint64_t)(v10 + 2), a2, (2 * v2) | 1))
  {
    uint64_t v14 = swift_release();
LABEL_16:
    MEMORY[0x1F4188790](v14);
    *(&v49 - 2) = (uint64_t)v11;
    uint64_t v18 = (void *)sub_1B736A074((uint64_t)sub_1B736CE40, (uint64_t)(&v49 - 4), i);
    uint64_t v19 = v18;
    unint64_t v20 = v18[2];
    if (!v20)
    {
      swift_bridgeObjectRelease();
      ((void (*)(uint64_t *, uint64_t *))v6[1])(v11, v5);
      return 0;
    }
    long long v59 = xmmword_1B73906E0;
    if ((v20 & 1) == 0)
    {
      unint64_t v2 = 0;
      goto LABEL_68;
    }
    uint64_t v22 = v18[4];
    unint64_t v23 = v18[5];
    uint64_t v24 = HIBYTE(v23) & 0xF;
    uint64_t v25 = v22 & 0xFFFFFFFFFFFFLL;
    if ((v23 & 0x2000000000000000) != 0) {
      uint64_t v26 = HIBYTE(v23) & 0xF;
    }
    else {
      uint64_t v26 = v22 & 0xFFFFFFFFFFFFLL;
    }
    if (!v26)
    {
      __break(1u);
LABEL_82:
      swift_bridgeObjectRetain();
      LOWORD(v22) = sub_1B736C068(v22, v23, 16);
      swift_bridgeObjectRelease();
      if ((v22 & 0x100) != 0) {
        goto LABEL_89;
      }
      goto LABEL_67;
    }
    if ((v23 & 0x1000000000000000) != 0) {
      goto LABEL_82;
    }
    if ((v23 & 0x2000000000000000) != 0)
    {
      v56[0] = v18[4];
      v56[1] = v23 & 0xFFFFFFFFFFFFFFLL;
      if (v22 == 43)
      {
        if (!v24) {
          goto LABEL_87;
        }
        if (!--v24)
        {
LABEL_89:
          __break(1u);
          JUMPOUT(0x1B736ABA4);
        }
        LOBYTE(v22) = 0;
        int v32 = (unsigned __int8 *)v56 + 1;
        while (1)
        {
          int v33 = *v32;
          char v34 = v33 - 48;
          if ((v33 - 48) >= 0xA)
          {
            if ((v33 - 65) < 6)
            {
              char v34 = v33 - 55;
            }
            else
            {
              if ((v33 - 97) > 5) {
                break;
              }
              char v34 = v33 - 87;
            }
          }
          if (v22 > 0xFu) {
            break;
          }
          LOBYTE(v22) = v34 + 16 * v22;
          ++v32;
          if (!--v24) {
            goto LABEL_66;
          }
        }
      }
      else if (v22 == 45)
      {
        if (!v24)
        {
          __break(1u);
LABEL_87:
          __break(1u);
LABEL_88:
          swift_bridgeObjectRelease();
          __break(1u);
        }
        if (!--v24) {
          goto LABEL_89;
        }
        LOBYTE(v22) = 0;
        id v29 = (unsigned __int8 *)v56 + 1;
        while (1)
        {
          int v30 = *v29;
          unsigned __int8 v31 = v30 - 48;
          if ((v30 - 48) >= 0xA)
          {
            if ((v30 - 65) < 6)
            {
              unsigned __int8 v31 = v30 - 55;
            }
            else
            {
              if ((v30 - 97) > 5) {
                break;
              }
              unsigned __int8 v31 = v30 - 87;
            }
          }
          if (v22 > 0xFu) {
            break;
          }
          LODWORD(v22) = 16 * (v22 & 0xF) - v31;
          if ((v22 & 0xFFFFFF00) != 0) {
            break;
          }
          ++v29;
          if (!--v24) {
            goto LABEL_66;
          }
        }
      }
      else
      {
        if (!v24) {
          goto LABEL_89;
        }
        LOBYTE(v22) = 0;
        int v35 = (unsigned __int8 *)v56;
        while (1)
        {
          int v36 = *v35;
          char v37 = v36 - 48;
          if ((v36 - 48) >= 0xA)
          {
            if ((v36 - 65) < 6)
            {
              char v37 = v36 - 55;
            }
            else
            {
              if ((v36 - 97) > 5) {
                break;
              }
              char v37 = v36 - 87;
            }
          }
          if (v22 > 0xFu) {
            break;
          }
          LOBYTE(v22) = v37 + 16 * v22;
          ++v35;
          if (!--v24) {
            goto LABEL_66;
          }
        }
      }
      LOBYTE(v22) = 0;
      LODWORD(v24) = 1;
LABEL_66:
      if (v24) {
        goto LABEL_89;
      }
    }
    else
    {
      if ((v22 & 0x1000000000000000) != 0) {
        uint64_t v27 = (unsigned __int8 *)((v23 & 0xFFFFFFFFFFFFFFFLL) + 32);
      }
      else {
        uint64_t v27 = (unsigned __int8 *)sub_1B73843D0();
      }
      unsigned int v28 = sub_1B736C14C(v27, v25, 16);
      if ((v28 >> 8)) {
        goto LABEL_89;
      }
      LOBYTE(v22) = v28;
    }
LABEL_67:
    uint64_t v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9E59450);
    uint64_t v57 = v38;
    uint64_t v58 = sub_1B736CE60(&qword_1E9E59458, &qword_1E9E59450);
    LOBYTE(v56[0]) = v22;
    char v55 = *(unsigned char *)__swift_project_boxed_opaque_existential_1Tm(v56, v38);
    unint64_t v2 = 1;
    uint64_t v10 = &v59;
    sub_1B7383CC0();
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v56);
    if (v20 <= 1) {
      break;
    }
LABEL_68:
    uint64_t v50 = v6;
    unint64_t v51 = v5;
    char v11 = &v19[2 * v2 + 7];
    a2 = (unint64_t)&qword_1E9E59460;
    uint64_t v5 = &qword_1E9E59450;
    uint64_t v6 = &qword_1E9E59458;
    while (1)
    {
      uint64_t v40 = swift_allocObject();
      *(_OWORD *)(v40 + 16) = v53;
      unint64_t v41 = v19[2];
      if (v2 >= v41) {
        break;
      }
      uint64_t v42 = *(v11 - 2);
      *(void *)(v40 + 32) = *(v11 - 3);
      *(void *)(v40 + 40) = v42;
      unint64_t v43 = v2 + 1;
      if (v2 + 1 >= v41) {
        goto LABEL_78;
      }
      uint64_t v44 = *v11;
      *(void *)(v40 + 48) = *(v11 - 1);
      *(void *)(v40 + 56) = v44;
      v56[0] = v40;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      __swift_instantiateConcreteTypeFromMangledName(&qword_1E9E59460);
      sub_1B736CE60(&qword_1E9E59468, &qword_1E9E59460);
      uint64_t v45 = sub_1B7384100();
      __int16 v47 = sub_1B736AE3C(v45, v46, 0x10uLL);
      if ((v47 & 0x100) != 0) {
        goto LABEL_88;
      }
      char v48 = v47;
      uint64_t v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9E59450);
      uint64_t v57 = v39;
      uint64_t v58 = sub_1B736CE60(&qword_1E9E59458, &qword_1E9E59450);
      LOBYTE(v56[0]) = v48;
      char v55 = *(unsigned char *)__swift_project_boxed_opaque_existential_1Tm(v56, v39);
      uint64_t v10 = &v59;
      sub_1B7383CC0();
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v56);
      v11 += 4;
      unint64_t v2 = v43 + 1;
      if (v43 + 1 >= v20)
      {
        swift_bridgeObjectRelease();
        uint64_t v5 = v51;
        uint64_t v6 = v50;
        char v11 = (uint64_t *)v52;
        goto LABEL_76;
      }
    }
    __break(1u);
LABEL_78:
    __break(1u);
LABEL_79:
    __break(1u);
LABEL_80:
    swift_release();
  }
  swift_bridgeObjectRelease();
LABEL_76:
  ((void (*)(uint64_t *, uint64_t *))v6[1])(v11, v5);
  return v59;
}

uint64_t sub_1B736ABB4(uint64_t result, void *a2)
{
  unint64_t v2 = (void *)result;
  unint64_t v3 = a2[2];
  if (!v3) {
    goto LABEL_9;
  }
  uint64_t v4 = *(void *)(result + 16);
  if (!v4) {
    return 1;
  }
  uint64_t result = a2[4];
  uint64_t v6 = a2[5];
  if (result != v2[4] || v6 != v2[5])
  {
    uint64_t result = sub_1B7384590();
    BOOL v8 = 0;
    if ((result & 1) == 0) {
      return v8;
    }
  }
  unint64_t v9 = v3 - 1;
  if (v3 != 1)
  {
    uint64_t v11 = v4 - 1;
    unint64_t v12 = a2 + 7;
    char v13 = v2 + 7;
    while (v9)
    {
      BOOL v8 = v11 == 0;
      if (!v11) {
        return v8;
      }
      uint64_t result = *(v12 - 1);
      if (result != *(v13 - 1) || *v12 != *v13)
      {
        uint64_t result = sub_1B7384590();
        if ((result & 1) == 0) {
          return v8;
        }
      }
      --v11;
      v12 += 2;
      v13 += 2;
      if (!--v9) {
        goto LABEL_9;
      }
    }
    __break(1u);
  }
  else
  {
LABEL_9:
    unint64_t v10 = v2[2];
    if (v3 == v10) {
      return 1;
    }
    if (v3 < v10) {
      return 0;
    }
  }
  __break(1u);
  return result;
}

unint64_t sub_1B736ACAC(unint64_t *a1)
{
  unint64_t v2 = *a1;
  unint64_t v1 = a1[1];
  uint64_t v3 = HIBYTE(v1) & 0xF;
  if ((v1 & 0x2000000000000000) == 0) {
    uint64_t v3 = *a1;
  }
  uint64_t v4 = 7;
  if (((v1 >> 60) & ((v2 & 0x800000000000000) == 0)) != 0) {
    uint64_t v4 = 11;
  }
  if (sub_1B736C5C8(0xFuLL, v4 | (v3 << 16), v2, v1) != 1) {
    return 0;
  }
  swift_bridgeObjectRetain();
  unint64_t result = sub_1B736AD5C(v2, v1);
  if ((result & 0x100000000) != 0)
  {
    __break(1u);
  }
  else
  {
    char v6 = sub_1B7383BC0();
    swift_bridgeObjectRelease();
    return v6 & 1;
  }
  return result;
}

unint64_t sub_1B736AD5C(unint64_t a1, unint64_t a2)
{
  if ((a2 & 0x2000000000000000) != 0) {
    uint64_t v2 = HIBYTE(a2) & 0xF;
  }
  else {
    uint64_t v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (v2)
  {
    sub_1B736C528(0xFuLL, a1, a2);
    if ((a2 & 0x1000000000000000) != 0)
    {
      unsigned int v5 = sub_1B7384370();
    }
    else
    {
      if ((a2 & 0x2000000000000000) == 0 && (a1 & 0x1000000000000000) == 0) {
        sub_1B73843D0();
      }
      unsigned int v5 = sub_1B73843E0();
    }
  }
  else
  {
    unsigned int v5 = 0;
  }
  return v5 | ((unint64_t)(v2 == 0) << 32);
}

uint64_t sub_1B736AE3C(uint64_t result, unint64_t a2, unint64_t a3)
{
  if (a3 - 37 < 0xFFFFFFFFFFFFFFDDLL)
  {
    __break(1u);
LABEL_76:
    swift_bridgeObjectRelease();
    unsigned __int8 v11 = 0;
    int v10 = 1;
    return v11 | (v10 << 8);
  }
  uint64_t v4 = HIBYTE(a2) & 0xF;
  uint64_t v5 = result & 0xFFFFFFFFFFFFLL;
  if ((a2 & 0x2000000000000000) != 0) {
    uint64_t v6 = v4;
  }
  else {
    uint64_t v6 = result & 0xFFFFFFFFFFFFLL;
  }
  if (!v6) {
    goto LABEL_76;
  }
  if ((a2 & 0x1000000000000000) != 0)
  {
    unsigned int v9 = sub_1B736C068(result, a2, a3);
    swift_bridgeObjectRelease();
    int v10 = (v9 >> 8) & 1;
LABEL_12:
    if (v10) {
      unsigned __int8 v11 = 0;
    }
    else {
      unsigned __int8 v11 = v9;
    }
    return v11 | (v10 << 8);
  }
  if ((a2 & 0x2000000000000000) == 0)
  {
    if ((result & 0x1000000000000000) != 0) {
      BOOL v8 = (unsigned __int8 *)((a2 & 0xFFFFFFFFFFFFFFFLL) + 32);
    }
    else {
      BOOL v8 = (unsigned __int8 *)sub_1B73843D0();
    }
    unsigned int v9 = sub_1B736C14C(v8, v5, a3);
    int v10 = (v9 >> 8) & 1;
    goto LABEL_11;
  }
  v36[0] = result;
  v36[1] = a2 & 0xFFFFFFFFFFFFFFLL;
  if (result == 43)
  {
    if (v4)
    {
      uint64_t v21 = v4 - 1;
      if (v21)
      {
        LOBYTE(v13) = 0;
        unsigned __int8 v22 = a3 + 48;
        unsigned __int8 v23 = a3 + 55;
        unsigned __int8 v24 = a3 + 87;
        if (a3 > 0xA)
        {
          unsigned __int8 v22 = 58;
        }
        else
        {
          unsigned __int8 v24 = 97;
          unsigned __int8 v23 = 65;
        }
        uint64_t v25 = (unsigned __int8 *)v36 + 1;
        int v10 = 1;
        do
        {
          unsigned int v26 = *v25;
          if (v26 < 0x30 || v26 >= v22)
          {
            if (v26 < 0x41 || v26 >= v23)
            {
              LOBYTE(v9) = 0;
              if (v26 < 0x61 || v26 >= v24) {
                goto LABEL_11;
              }
              char v27 = -87;
            }
            else
            {
              char v27 = -55;
            }
          }
          else
          {
            char v27 = -48;
          }
          __int16 v28 = v13 * a3;
          if ((v28 & 0xFF00) != 0) {
            goto LABEL_74;
          }
          unsigned int v13 = v28 + (v26 + v27);
          if ((v13 >> 8)) {
            goto LABEL_74;
          }
          ++v25;
          --v21;
        }
        while (v21);
LABEL_73:
        int v10 = 0;
        LOBYTE(v9) = v13;
        goto LABEL_11;
      }
      goto LABEL_74;
    }
  }
  else
  {
    if (result != 45)
    {
      if (v4)
      {
        LOBYTE(v13) = 0;
        unsigned __int8 v29 = a3 + 48;
        unsigned __int8 v30 = a3 + 55;
        unsigned __int8 v31 = a3 + 87;
        if (a3 > 0xA)
        {
          unsigned __int8 v29 = 58;
        }
        else
        {
          unsigned __int8 v31 = 97;
          unsigned __int8 v30 = 65;
        }
        int v32 = (unsigned __int8 *)v36;
        int v10 = 1;
        while (1)
        {
          unsigned int v33 = *v32;
          if (v33 < 0x30 || v33 >= v29)
          {
            if (v33 < 0x41 || v33 >= v30)
            {
              LOBYTE(v9) = 0;
              if (v33 < 0x61 || v33 >= v31) {
                goto LABEL_11;
              }
              char v34 = -87;
            }
            else
            {
              char v34 = -55;
            }
          }
          else
          {
            char v34 = -48;
          }
          __int16 v35 = v13 * a3;
          if ((v35 & 0xFF00) != 0) {
            goto LABEL_74;
          }
          unsigned int v13 = v35 + (v33 + v34);
          if ((v13 >> 8)) {
            goto LABEL_74;
          }
          ++v32;
          if (!--v4) {
            goto LABEL_73;
          }
        }
      }
      goto LABEL_74;
    }
    if (v4)
    {
      uint64_t v12 = v4 - 1;
      if (v12)
      {
        LOBYTE(v13) = 0;
        unsigned __int8 v14 = a3 + 48;
        unsigned __int8 v15 = a3 + 55;
        unsigned __int8 v16 = a3 + 87;
        if (a3 > 0xA)
        {
          unsigned __int8 v14 = 58;
        }
        else
        {
          unsigned __int8 v16 = 97;
          unsigned __int8 v15 = 65;
        }
        uint64_t v17 = (unsigned __int8 *)v36 + 1;
        int v10 = 1;
        while (1)
        {
          unsigned int v18 = *v17;
          if (v18 < 0x30 || v18 >= v14)
          {
            if (v18 < 0x41 || v18 >= v15)
            {
              LOBYTE(v9) = 0;
              if (v18 < 0x61 || v18 >= v16) {
                goto LABEL_11;
              }
              char v19 = -87;
            }
            else
            {
              char v19 = -55;
            }
          }
          else
          {
            char v19 = -48;
          }
          __int16 v20 = v13 * a3;
          if ((v20 & 0xFF00) != 0) {
            break;
          }
          unsigned int v13 = v20 - (v18 + v19);
          if ((v13 & 0xFFFFFF00) != 0) {
            break;
          }
          ++v17;
          if (!--v12) {
            goto LABEL_73;
          }
        }
      }
LABEL_74:
      LOBYTE(v9) = 0;
      int v10 = 1;
LABEL_11:
      swift_bridgeObjectRelease();
      goto LABEL_12;
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

Swift::String __swiftcall Data.base64URLEncodedString(includePadding:)(Swift::Bool includePadding)
{
  sub_1B7383CE0();
  sub_1B735FD8C();
  sub_1B7384270();
  swift_bridgeObjectRelease();
  uint64_t v2 = sub_1B7384270();
  uint64_t v4 = v3;
  swift_bridgeObjectRelease();
  if (!includePadding)
  {
    uint64_t v2 = sub_1B7384270();
    uint64_t v6 = v5;
    swift_bridgeObjectRelease();
    uint64_t v4 = v6;
  }
  uint64_t v7 = v2;
  BOOL v8 = v4;
  result._object = v8;
  result._uint64_t countAndFlagsBits = v7;
  return result;
}

uint64_t sub_1B736B304(int a1, size_t a2)
{
  if ((a2 & 0x8000000000000000) != 0)
  {
    uint64_t result = sub_1B7384450();
    __break(1u);
  }
  else
  {
    if (!a2) {
      return MEMORY[0x1E4FBC860];
    }
    uint64_t v4 = sub_1B7384150();
    *(void *)(v4 + 16) = a2;
    memset((void *)(v4 + 32), a1, a2);
    return v4;
  }
  return result;
}

void *Data.compressed(using:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1B736B468(a1, a2, a3, (SEL *)&selRef_compressedDataUsingAlgorithm_error_);
}

void *Data.decompressed(using:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1B736B468(a1, a2, a3, (SEL *)&selRef_decompressedDataUsingAlgorithm_error_);
}

void *sub_1B736B468(uint64_t a1, uint64_t a2, uint64_t a3, SEL *a4)
{
  v11[1] = *(id *)MEMORY[0x1E4F143B8];
  uint64_t v6 = (void *)sub_1B7383CD0();
  v11[0] = 0;
  id v7 = objc_msgSend(v6, *a4, a1, v11);

  id v8 = v11[0];
  if (v7)
  {
    unsigned int v9 = (void *)sub_1B7383D00();
  }
  else
  {
    unsigned int v9 = v8;
    sub_1B7383C40();

    swift_willThrow();
  }
  return v9;
}

uint64_t sub_1B736B548(char a1, int64_t a2, char a3, unint64_t a4)
{
  if (a3)
  {
    unint64_t v6 = *(void *)(a4 + 24);
    uint64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_29;
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
  if (!v9)
  {
    unsigned int v13 = (void *)MEMORY[0x1E4FBC860];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9E59480);
  uint64_t v10 = *(void *)(type metadata accessor for WBSKeychainPasskey() - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  unsigned int v13 = (void *)swift_allocObject();
  size_t v14 = _swift_stdlib_malloc_size(v13);
  if (!v11 || (v14 - v12 == 0x8000000000000000 ? (BOOL v15 = v11 == -1) : (BOOL v15 = 0), v15))
  {
LABEL_29:
    uint64_t result = sub_1B7384450();
    __break(1u);
    return result;
  }
  void v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  uint64_t v16 = *(void *)(type metadata accessor for WBSKeychainPasskey() - 8);
  unint64_t v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  unint64_t v18 = (unint64_t)v13 + v17;
  if (a1)
  {
    if ((unint64_t)v13 < a4 || v18 >= a4 + v17 + *(void *)(v16 + 72) * v8)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != (void *)a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_1B736CA70(0, v8, v18, a4);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v13;
}

char *sub_1B736B7B0(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    int64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = *((void *)a4 + 3);
  int64_t v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v7 + 0x4000000000000000 >= 0)
  {
    int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      int64_t v7 = a2;
    }
LABEL_8:
    int64_t v8 = *((void *)a4 + 2);
    if (v7 <= v8) {
      int64_t v9 = *((void *)a4 + 2);
    }
    else {
      int64_t v9 = v7;
    }
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_1E9E59420);
      uint64_t v10 = (char *)swift_allocObject();
      size_t v11 = _swift_stdlib_malloc_size(v10);
      *((void *)v10 + 2) = v8;
      *((void *)v10 + 3) = 2 * v11 - 64;
      unint64_t v12 = v10 + 32;
      if (v5)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[v8 + 32]) {
          memmove(v12, a4 + 32, v8);
        }
        *((void *)a4 + 2) = 0;
        goto LABEL_22;
      }
    }
    else
    {
      uint64_t v10 = (char *)MEMORY[0x1E4FBC860];
      unint64_t v12 = (char *)(MEMORY[0x1E4FBC860] + 32);
      if (result) {
        goto LABEL_13;
      }
    }
    sub_1B736CEA4(0, v8, v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

void *sub_1B736B8AC(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9E59420);
  uint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_1B736B914(unint64_t a1, uint64_t a2, uint64_t a3)
{
  char v3 = a1;
  uint64_t v4 = (unsigned __int16)a1 >> 14;
  if ((a3 & 0x1000000000000000) == 0 || (a2 & 0x800000000000000) != 0)
  {
    uint64_t v10 = sub_1B73840E0();
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
    uint64_t v5 = MEMORY[0x1BA9BBAB0](15, a1 >> 16);
    uint64_t v6 = v5 + (v4 << 16);
    unint64_t v7 = v5 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    unint64_t v8 = v6 & 0xFFFFFFFFFFFF0000;
    if (!v4) {
      unint64_t v8 = v7;
    }
    return v8 | 8;
  }
}

uint64_t sub_1B736B990(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  unint64_t v4 = a4 >> 1;
  uint64_t v5 = (a4 >> 1) - a3;
  if (!__OFSUB__(a4 >> 1, a3))
  {
    if (!v5) {
      return MEMORY[0x1E4FBC860];
    }
    uint64_t v8 = 2 * v5;
    if (v5 <= 0)
    {
      int64_t v9 = (void *)MEMORY[0x1E4FBC860];
      if (v4 != a3)
      {
LABEL_7:
        if (v5 < 0) {
          goto LABEL_19;
        }
        unint64_t v12 = a2 + 16 * a3;
        if (v12 < (unint64_t)&v9[v8 + 4] && (unint64_t)(v9 + 4) < v12 + v8 * 8) {
          goto LABEL_19;
        }
        swift_arrayInitWithCopy();
        return (uint64_t)v9;
      }
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_1E9E59448);
      int64_t v9 = (void *)swift_allocObject();
      int64_t v10 = _swift_stdlib_malloc_size(v9);
      uint64_t v11 = v10 - 32;
      if (v10 < 32) {
        uint64_t v11 = v10 - 17;
      }
      int v9[2] = v5;
      void v9[3] = 2 * (v11 >> 4);
      if (v4 != a3) {
        goto LABEL_7;
      }
    }
    __break(1u);
  }
  __break(1u);
LABEL_19:
  uint64_t result = sub_1B73844C0();
  __break(1u);
  return result;
}

uint64_t sub_1B736BB04()
{
  unint64_t v0 = sub_1B7384120();
  uint64_t v4 = sub_1B736BB84(v0, v1, v2, v3);
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_1B736BB84(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  if ((a4 & 0x1000000000000000) != 0)
  {
    uint64_t v9 = sub_1B736BCDC(a1, a2, a3, a4);
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = sub_1B736B8AC(v9, 0);
      unint64_t v12 = sub_1B736BDDC((unint64_t)v14, (uint64_t)(v11 + 4), v10, a1, a2, a3, a4);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      if (v12 != v10)
      {
        __break(1u);
LABEL_11:
        sub_1B73843D0();
LABEL_4:
        JUMPOUT(0x1BA9BBA40);
      }
    }
    else
    {
      uint64_t v11 = (void *)MEMORY[0x1E4FBC860];
    }
    uint64_t v13 = MEMORY[0x1BA9BBA40](v11 + 4, v11[2]);
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
    return MEMORY[0x1BA9BBA40]((char *)v14 + (a1 >> 16), (a2 >> 16) - (a1 >> 16));
  }
}

uint64_t sub_1B736BCDC(unint64_t a1, unint64_t a2, unint64_t a3, uint64_t a4)
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
    a1 = sub_1B736B914(a1, a3, a4);
    unint64_t v7 = a1;
  }
  if ((v6 & 0xC) == v9)
  {
    a1 = sub_1B736B914(v6, v5, v4);
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

unint64_t sub_1B736BDDC(unint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6, unint64_t a7)
{
  uint64_t v9 = (void *)result;
  if (!a2) {
    goto LABEL_5;
  }
  if (!a3)
  {
    unint64_t v12 = a4;
    uint64_t v11 = 0;
    goto LABEL_33;
  }
  if (a3 < 0) {
    goto LABEL_36;
  }
  unint64_t v10 = a5 >> 14;
  unint64_t v27 = a4 >> 14;
  if (a4 >> 14 == a5 >> 14)
  {
LABEL_5:
    uint64_t v11 = 0;
    unint64_t v12 = a4;
LABEL_33:
    void *v9 = a4;
    v9[1] = a5;
    int v9[2] = a6;
    void v9[3] = a7;
    void v9[4] = v12;
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
    unint64_t v17 = v12 & 0xC;
    uint64_t result = v12;
    if (v17 == v15) {
      uint64_t result = sub_1B736B914(v12, a6, a7);
    }
    if (result >> 14 < v27 || result >> 14 >= v10) {
      break;
    }
    if ((a7 & 0x1000000000000000) != 0)
    {
      uint64_t result = sub_1B73840D0();
      char v19 = result;
      if (v17 != v15) {
        goto LABEL_23;
      }
    }
    else
    {
      unint64_t v18 = result >> 16;
      if ((a7 & 0x2000000000000000) != 0)
      {
        v28[0] = a6;
        v28[1] = v22;
        char v19 = *((unsigned char *)v28 + v18);
        if (v17 != v15) {
          goto LABEL_23;
        }
      }
      else
      {
        uint64_t result = v21;
        if ((a6 & 0x1000000000000000) == 0) {
          uint64_t result = sub_1B73843D0();
        }
        char v19 = *(unsigned char *)(result + v18);
        if (v17 != v15)
        {
LABEL_23:
          if ((a7 & 0x1000000000000000) == 0) {
            goto LABEL_24;
          }
          goto LABEL_27;
        }
      }
    }
    uint64_t result = sub_1B736B914(v12, a6, a7);
    unint64_t v12 = result;
    if ((a7 & 0x1000000000000000) == 0)
    {
LABEL_24:
      unint64_t v12 = (v12 & 0xFFFFFFFFFFFF0000) + 65540;
      goto LABEL_29;
    }
LABEL_27:
    if (v23 <= v12 >> 16) {
      goto LABEL_35;
    }
    unint64_t v12 = sub_1B73840A0();
LABEL_29:
    *(unsigned char *)(a2 + v11) = v19;
    if (v26 == v11)
    {
      uint64_t v11 = a3;
      goto LABEL_33;
    }
    ++v11;
    if (v10 == v12 >> 14) {
      goto LABEL_33;
    }
  }
  __break(1u);
LABEL_35:
  __break(1u);
LABEL_36:
  __break(1u);
  return result;
}

unsigned char *sub_1B736BFF0@<X0>(unsigned char *result@<X0>, unsigned char *a2@<X1>, void *a3@<X8>)
{
  if (!result) {
    goto LABEL_4;
  }
  uint64_t v4 = a2 - result;
  if (a2 == result)
  {
    uint64_t result = 0;
LABEL_4:
    unint64_t v5 = 0xC000000000000000;
    goto LABEL_5;
  }
  if (v4 <= 14)
  {
    uint64_t result = (unsigned char *)sub_1B736CBC8(result, a2);
    unint64_t v5 = v7 & 0xFFFFFFFFFFFFFFLL;
  }
  else if ((unint64_t)v4 >= 0x7FFFFFFF)
  {
    uint64_t result = (unsigned char *)sub_1B736CD10((uint64_t)result, (uint64_t)a2);
    unint64_t v5 = v8 | 0x8000000000000000;
  }
  else
  {
    uint64_t result = (unsigned char *)sub_1B736CC8C((uint64_t)result, (uint64_t)a2);
    unint64_t v5 = v6 | 0x4000000000000000;
  }
LABEL_5:
  *a3 = result;
  a3[1] = v5;
  return result;
}

uint64_t sub_1B736C068(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v13 = a1;
  uint64_t v14 = a2;
  swift_bridgeObjectRetain();
  uint64_t v5 = sub_1B7384110();
  unint64_t v6 = v4;
  if ((v4 & 0x1000000000000000) == 0)
  {
    if ((v4 & 0x2000000000000000) == 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v8 = HIBYTE(v6) & 0xF;
    uint64_t v13 = v5;
    uint64_t v14 = v6 & 0xFFFFFFFFFFFFFFLL;
    uint64_t v7 = (unsigned __int8 *)&v13;
    goto LABEL_7;
  }
  uint64_t v5 = sub_1B736BB04();
  unint64_t v10 = v9;
  swift_bridgeObjectRelease();
  unint64_t v6 = v10;
  if ((v10 & 0x2000000000000000) != 0) {
    goto LABEL_6;
  }
LABEL_3:
  if ((v5 & 0x1000000000000000) != 0)
  {
    uint64_t v7 = (unsigned __int8 *)((v6 & 0xFFFFFFFFFFFFFFFLL) + 32);
    uint64_t v8 = v5 & 0xFFFFFFFFFFFFLL;
  }
  else
  {
    uint64_t v7 = (unsigned __int8 *)sub_1B73843D0();
  }
LABEL_7:
  unsigned __int16 v11 = (unsigned __int16)sub_1B736C14C(v7, v8, a3);
  swift_bridgeObjectRelease();
  return v11 & 0x1FF;
}

unsigned __int8 *sub_1B736C14C(unsigned __int8 *result, uint64_t a2, uint64_t a3)
{
  int v3 = *result;
  if (v3 == 43)
  {
    if (a2 >= 1)
    {
      uint64_t v14 = a2 - 1;
      if (a2 != 1)
      {
        unsigned __int8 v15 = a3 + 87;
        if (a3 > 10)
        {
          unsigned __int8 v16 = a3 + 55;
        }
        else
        {
          unsigned __int8 v15 = 97;
          unsigned __int8 v16 = 65;
        }
        if (a3 <= 10) {
          unsigned __int8 v17 = a3 + 48;
        }
        else {
          unsigned __int8 v17 = 58;
        }
        if (result)
        {
          LOBYTE(v8) = 0;
          unint64_t v18 = result + 1;
          do
          {
            unsigned int v19 = *v18;
            if (v19 < 0x30 || v19 >= v17)
            {
              if (v19 < 0x41 || v19 >= v16)
              {
                unsigned __int8 v12 = 0;
                int v13 = 1;
                if (v19 < 0x61 || v19 >= v15) {
                  return (unsigned __int8 *)(v12 | (v13 << 8));
                }
                char v20 = -87;
              }
              else
              {
                char v20 = -55;
              }
            }
            else
            {
              char v20 = -48;
            }
            if (((v8 * (unsigned __int16)a3) & 0xFF00) != 0) {
              goto LABEL_72;
            }
            unsigned int v8 = (v8 * a3) + (v19 + v20);
            if ((v8 >> 8)) {
              goto LABEL_72;
            }
            ++v18;
            --v14;
          }
          while (v14);
LABEL_48:
          int v13 = 0;
          unsigned __int8 v12 = v8;
          return (unsigned __int8 *)(v12 | (v13 << 8));
        }
        goto LABEL_71;
      }
LABEL_72:
      unsigned __int8 v12 = 0;
      int v13 = 1;
      return (unsigned __int8 *)(v12 | (v13 << 8));
    }
  }
  else
  {
    if (v3 != 45)
    {
      if (a2)
      {
        unsigned __int8 v21 = a3 + 87;
        if (a3 > 10)
        {
          unsigned __int8 v22 = a3 + 55;
        }
        else
        {
          unsigned __int8 v21 = 97;
          unsigned __int8 v22 = 65;
        }
        if (a3 <= 10) {
          unsigned __int8 v23 = a3 + 48;
        }
        else {
          unsigned __int8 v23 = 58;
        }
        if (result)
        {
          LOBYTE(v24) = 0;
          do
          {
            unsigned int v25 = *result;
            if (v25 < 0x30 || v25 >= v23)
            {
              if (v25 < 0x41 || v25 >= v22)
              {
                unsigned __int8 v12 = 0;
                int v13 = 1;
                if (v25 < 0x61 || v25 >= v21) {
                  return (unsigned __int8 *)(v12 | (v13 << 8));
                }
                char v26 = -87;
              }
              else
              {
                char v26 = -55;
              }
            }
            else
            {
              char v26 = -48;
            }
            if (((v24 * (unsigned __int16)a3) & 0xFF00) != 0) {
              goto LABEL_72;
            }
            unsigned int v24 = (v24 * a3) + (v25 + v26);
            if ((v24 >> 8)) {
              goto LABEL_72;
            }
            ++result;
            --a2;
          }
          while (a2);
          int v13 = 0;
          unsigned __int8 v12 = v24;
          return (unsigned __int8 *)(v12 | (v13 << 8));
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
          LOBYTE(v8) = 0;
          unint64_t v9 = result + 1;
          while (1)
          {
            unsigned int v10 = *v9;
            if (v10 < 0x30 || v10 >= v7)
            {
              if (v10 < 0x41 || v10 >= v6)
              {
                unsigned __int8 v12 = 0;
                int v13 = 1;
                if (v10 < 0x61 || v10 >= v5) {
                  return (unsigned __int8 *)(v12 | (v13 << 8));
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
            if (((v8 * (unsigned __int16)a3) & 0xFF00) != 0) {
              goto LABEL_72;
            }
            unsigned int v8 = (v8 * a3) - (v10 + v11);
            if ((v8 & 0xFFFFFF00) != 0) {
              goto LABEL_72;
            }
            ++v9;
            if (!--v4) {
              goto LABEL_48;
            }
          }
        }
LABEL_71:
        unsigned __int8 v12 = 0;
        int v13 = 0;
        return (unsigned __int8 *)(v12 | (v13 << 8));
      }
      goto LABEL_72;
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

void *sub_1B736C3F4(void *result, uint64_t *a2, uint64_t a3, uint64_t a4, unint64_t a5)
{
  unsigned __int8 v5 = result;
  uint64_t v6 = HIBYTE(a5) & 0xF;
  uint64_t v12 = a4;
  unint64_t v13 = a5;
  if ((a5 & 0x2000000000000000) == 0) {
    uint64_t v6 = a4 & 0xFFFFFFFFFFFFLL;
  }
  uint64_t v14 = v6;
  if (!a2)
  {
    uint64_t v7 = 0;
LABEL_14:
    *unsigned __int8 v5 = a4;
    v5[1] = a5;
    void v5[2] = 0;
    v5[3] = v6;
    return (void *)v7;
  }
  uint64_t v7 = a3;
  if (!a3) {
    goto LABEL_14;
  }
  if ((a3 & 0x8000000000000000) == 0)
  {
    unsigned int v8 = a2;
    uint64_t v9 = 0;
    while (1)
    {
      uint64_t v10 = sub_1B7384080();
      if (!v11) {
        break;
      }
      ++v9;
      *unsigned int v8 = v10;
      v8[1] = v11;
      v8 += 2;
      if (v7 == v9)
      {
        a4 = v12;
        a5 = v13;
        goto LABEL_13;
      }
    }
    a4 = v12;
    a5 = v13;
    uint64_t v7 = v9;
LABEL_13:
    uint64_t v6 = v14;
    goto LABEL_14;
  }
  __break(1u);
  return result;
}

void *sub_1B736C4B0(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9E59448);
  uint64_t v4 = (void *)swift_allocObject();
  int64_t v5 = _swift_stdlib_malloc_size(v4);
  uint64_t v6 = v5 - 32;
  if (v5 < 32) {
    uint64_t v6 = v5 - 17;
  }
  v4[2] = a1;
  v4[3] = 2 * (v6 >> 4);
  return v4;
}

unint64_t sub_1B736C528(unint64_t result, unint64_t a2, unint64_t a3)
{
  uint64_t v5 = (a2 >> 59) & 1;
  if ((a3 & 0x1000000000000000) == 0) {
    LOBYTE(v5) = 1;
  }
  if ((result & 1) == 0 || (result & 0xC) == 4 << v5) {
    goto LABEL_9;
  }
  unint64_t v6 = HIBYTE(a3) & 0xF;
  if ((a3 & 0x2000000000000000) == 0) {
    unint64_t v6 = a2 & 0xFFFFFFFFFFFFLL;
  }
  if (v6 <= result >> 16)
  {
    __break(1u);
LABEL_9:
    uint64_t result = sub_1B736C7DC(result, a2, a3);
    if ((result & 1) == 0) {
      return result & 0xC | sub_1B736C84C(result, a2, a3) & 0xFFFFFFFFFFFFFFF3 | 1;
    }
  }
  return result;
}

unint64_t sub_1B736C5C8(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  unint64_t v7 = sub_1B736C960(a1, a3, a4);
  unint64_t result = sub_1B736C960(a2, a3, a4);
  unint64_t v9 = result >> 14;
  if (v7 >> 14 < result >> 14)
  {
    for (uint64_t i = 0; ; ++i)
    {
      uint64_t v11 = i + 1;
      if (__OFADD__(i, 1)) {
        break;
      }
      if ((a4 & 0x1000000000000000) != 0)
      {
        unint64_t result = sub_1B7384020();
        unint64_t v7 = result;
      }
      else
      {
        unint64_t v12 = v7 >> 16;
        if ((a4 & 0x2000000000000000) != 0)
        {
          unint64_t v22 = a3;
          uint64_t v23 = a4 & 0xFFFFFFFFFFFFFFLL;
          int v13 = *((unsigned __int8 *)&v22 + v12);
        }
        else
        {
          unint64_t result = (a4 & 0xFFFFFFFFFFFFFFFLL) + 32;
          if ((a3 & 0x1000000000000000) == 0) {
            unint64_t result = sub_1B73843D0();
          }
          int v13 = *(unsigned __int8 *)(result + v12);
        }
        int v14 = (char)v13;
        unsigned int v15 = __clz(v13 ^ 0xFF) - 24;
        if (v14 >= 0) {
          LOBYTE(v15) = 1;
        }
        unint64_t v7 = ((v12 + v15) << 16) | 5;
      }
      if (v9 <= v7 >> 14) {
        return v11;
      }
    }
    __break(1u);
LABEL_36:
    __break(1u);
    return result;
  }
  if (v9 < v7 >> 14)
  {
    uint64_t v11 = 0;
    while (!__OFSUB__(v11--, 1))
    {
      if ((a4 & 0x1000000000000000) != 0)
      {
        unint64_t result = sub_1B7384030();
        unint64_t v7 = result;
      }
      else
      {
        if ((a4 & 0x2000000000000000) != 0)
        {
          unint64_t v22 = a3;
          uint64_t v23 = a4 & 0xFFFFFFFFFFFFFFLL;
          if ((*((unsigned char *)&v22 + (v7 >> 16) - 1) & 0xC0) == 0x80)
          {
            uint64_t v20 = 0;
            do
              int v21 = *((unsigned char *)&v22 + (v7 >> 16) + v20-- - 2) & 0xC0;
            while (v21 == 128);
            uint64_t v19 = 1 - v20;
          }
          else
          {
            uint64_t v19 = 1;
          }
        }
        else
        {
          unint64_t result = (a4 & 0xFFFFFFFFFFFFFFFLL) + 32;
          if ((a3 & 0x1000000000000000) == 0) {
            unint64_t result = sub_1B73843D0();
          }
          uint64_t v17 = 0;
          do
            int v18 = *(unsigned char *)(result + (v7 >> 16) - 1 + v17--) & 0xC0;
          while (v18 == 128);
          uint64_t v19 = -v17;
        }
        unint64_t v7 = (v7 - (v19 << 16)) & 0xFFFFFFFFFFFF0000 | 5;
      }
      if (v9 >= v7 >> 14) {
        return v11;
      }
    }
    goto LABEL_36;
  }
  return 0;
}

unint64_t sub_1B736C7DC(unint64_t result, unint64_t a2, unint64_t a3)
{
  uint64_t v5 = (a2 >> 59) & 1;
  if ((a3 & 0x1000000000000000) == 0) {
    LOBYTE(v5) = 1;
  }
  if ((result & 0xC) == 4 << v5) {
    unint64_t result = sub_1B736B914(result, a2, a3);
  }
  unint64_t v6 = HIBYTE(a3) & 0xF;
  if ((a3 & 0x2000000000000000) == 0) {
    unint64_t v6 = a2 & 0xFFFFFFFFFFFFLL;
  }
  if (v6 <= result >> 16) {
    __break(1u);
  }
  return result;
}

unint64_t sub_1B736C84C(unint64_t result, uint64_t a2, unint64_t a3)
{
  if ((result & 0xC000) != 0 || result < 0x10000)
  {
    result &= 0xFFFFFFFFFFFF0000;
  }
  else
  {
    unint64_t v5 = result >> 16;
    if ((a3 & 0x1000000000000000) == 0)
    {
      void v13[2] = v3;
      v13[3] = v4;
      if ((a3 & 0x2000000000000000) != 0)
      {
        v13[0] = a2;
        v13[1] = a3 & 0xFFFFFFFFFFFFFFLL;
        if (v5 != (HIBYTE(a3) & 0xF) && (*((unsigned char *)v13 + v5) & 0xC0) == 0x80)
        {
          do
          {
            unint64_t v10 = v5 - 1;
            int v11 = *((unsigned char *)&v12 + v5-- + 7) & 0xC0;
          }
          while (v11 == 128);
          unint64_t v5 = v10;
        }
        return v5 << 16;
      }
      if ((a2 & 0x1000000000000000) != 0)
      {
        uint64_t v6 = (a3 & 0xFFFFFFFFFFFFFFFLL) + 32;
        if (v5 != (a2 & 0xFFFFFFFFFFFFLL))
        {
          do
LABEL_9:
            int v7 = *(unsigned char *)(v6 + v5--) & 0xC0;
          while (v7 == 128);
          ++v5;
        }
      }
      else
      {
        unint64_t v12 = result >> 16;
        uint64_t v6 = sub_1B73843D0();
        unint64_t v5 = v12;
        if (v12 != v9) {
          goto LABEL_9;
        }
      }
      return v5 << 16;
    }
    uint64_t v8 = HIBYTE(a3) & 0xF;
    if ((a3 & 0x2000000000000000) == 0) {
      uint64_t v8 = a2 & 0xFFFFFFFFFFFFLL;
    }
    if (v5 != v8)
    {
      return MEMORY[0x1F4184CD0]();
    }
  }
  return result;
}

unint64_t sub_1B736C960(unint64_t result, unint64_t a2, unint64_t a3)
{
  uint64_t v5 = (a2 >> 59) & 1;
  if ((a3 & 0x1000000000000000) == 0) {
    LOBYTE(v5) = 1;
  }
  if ((result & 1) == 0 || (result & 0xC) == 4 << v5) {
    goto LABEL_9;
  }
  unint64_t v6 = HIBYTE(a3) & 0xF;
  if ((a3 & 0x2000000000000000) == 0) {
    unint64_t v6 = a2 & 0xFFFFFFFFFFFFLL;
  }
  if (v6 < result >> 16)
  {
    __break(1u);
LABEL_9:
    unint64_t result = sub_1B736CA00(result, a2, a3);
    if ((result & 1) == 0) {
      return result & 0xC | sub_1B736C84C(result, a2, a3) & 0xFFFFFFFFFFFFFFF3 | 1;
    }
  }
  return result;
}

unint64_t sub_1B736CA00(unint64_t result, unint64_t a2, unint64_t a3)
{
  uint64_t v5 = (a2 >> 59) & 1;
  if ((a3 & 0x1000000000000000) == 0) {
    LOBYTE(v5) = 1;
  }
  if ((result & 0xC) == 4 << v5) {
    unint64_t result = sub_1B736B914(result, a2, a3);
  }
  unint64_t v6 = HIBYTE(a3) & 0xF;
  if ((a3 & 0x2000000000000000) == 0) {
    unint64_t v6 = a2 & 0xFFFFFFFFFFFFLL;
  }
  if (v6 < result >> 16) {
    __break(1u);
  }
  return result;
}

uint64_t sub_1B736CA70(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    uint64_t v8 = *(void *)(type metadata accessor for WBSKeychainPasskey() - 8);
    uint64_t v9 = a4 + ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80));
    uint64_t v10 = *(void *)(v8 + 72);
    unint64_t v11 = v9 + v10 * a1;
    unint64_t v12 = a3 + v10 * v4;
    if (v11 >= v12 || v11 + v10 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v12;
    }
  }
  uint64_t result = sub_1B73844C0();
  __break(1u);
  return result;
}

uint64_t sub_1B736CBC8(unsigned char *__src, unsigned char *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (__src) {
    unint64_t v2 = a2 - __src;
  }
  else {
    unint64_t v2 = 0;
  }
  if ((v2 & 0x8000000000000000) != 0)
  {
    __break(1u);
LABEL_11:
    __break(1u);
  }
  if (v2 > 0xFF) {
    goto LABEL_11;
  }
  memset(__dst, 0, sizeof(__dst));
  char v5 = v2;
  if (__src && a2 != __src) {
    memcpy(__dst, __src, a2 - __src);
  }
  return *(void *)__dst;
}

uint64_t sub_1B736CC8C(uint64_t a1, uint64_t a2)
{
  if (a1) {
    uint64_t v2 = a2 - a1;
  }
  else {
    uint64_t v2 = 0;
  }
  sub_1B7383C20();
  swift_allocObject();
  uint64_t result = sub_1B7383BE0();
  if (v2 < (uint64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
    goto LABEL_9;
  }
  if (v2 > 0x7FFFFFFF)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  if ((v2 & 0x80000000) == 0) {
    return v2 << 32;
  }
LABEL_10:
  __break(1u);
  return result;
}

uint64_t sub_1B736CD10(uint64_t a1, uint64_t a2)
{
  if (a1) {
    uint64_t v2 = a2 - a1;
  }
  else {
    uint64_t v2 = 0;
  }
  sub_1B7383C20();
  swift_allocObject();
  uint64_t result = sub_1B7383BE0();
  if (v2 < 0)
  {
    __break(1u);
  }
  else
  {
    sub_1B7383CB0();
    uint64_t result = swift_allocObject();
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = v2;
  }
  return result;
}

uint64_t sub_1B736CD8C(uint64_t a1)
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9E59470);
  uint64_t v10 = sub_1B736CE60(&qword_1E9E59478, &qword_1E9E59470);
  v8[0] = a1;
  uint64_t v2 = __swift_project_boxed_opaque_existential_1Tm(v8, v9);
  uint64_t v3 = (unsigned char *)(*v2 + 32);
  uint64_t v4 = &v3[*(void *)(*v2 + 16)];
  swift_bridgeObjectRetain();
  sub_1B736BFF0(v3, v4, &v7);
  uint64_t v5 = v7;
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v8);
  return v5;
}

unint64_t sub_1B736CE40(unint64_t *a1)
{
  return sub_1B736ACAC(a1) & 1;
}

uint64_t sub_1B736CE60(unint64_t *a1, uint64_t *a2)
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

char *sub_1B736CEA4(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  size_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    uint64_t v5 = (char *)(a4 + a1 + 32);
    uint64_t v6 = &__dst[v4];
    if (v5 >= &__dst[v4] || &v5[v4] <= __dst)
    {
      memcpy(__dst, v5, v4);
      return v6;
    }
  }
  uint64_t result = (char *)sub_1B73844C0();
  __break(1u);
  return result;
}

Swift::String __swiftcall Error.loggerDescription()()
{
  uint64_t v1 = v0;
  uint64_t v2 = *(void *)(v0 - 8);
  ((void (*)())MEMORY[0x1F4188790])();
  size_t v4 = (char *)&v14 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = 0;
  unint64_t v15 = 0xE000000000000000;
  (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v4, v5, v1);
  uint64_t v6 = sub_1B7384570();
  if (v6)
  {
    uint64_t v7 = (void *)v6;
    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  }
  else
  {
    uint64_t v7 = (void *)swift_allocError();
    (*(void (**)(uint64_t, char *, uint64_t))(v2 + 32))(v8, v4, v1);
  }
  uint64_t v9 = (void *)sub_1B7383C30();

  id v10 = objc_msgSend(v9, sel_safari_privacyPreservingDescription);
  sub_1B7383FC0();

  sub_1B7384070();
  swift_bridgeObjectRelease();
  uint64_t v11 = v14;
  unint64_t v12 = (void *)v15;
  result._object = v12;
  result._uint64_t countAndFlagsBits = v11;
  return result;
}

uint64_t WBSShareablePasskey.init(relyingParty:metadata:privateKey:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X2>, uint64_t a4@<X3>, void *a5@<X8>)
{
  uint64_t v7 = *a3;
  *a5 = a1;
  a5[1] = a2;
  a5[2] = v7;
  uint64_t v8 = (int *)type metadata accessor for WBSShareablePasskey();
  uint64_t v9 = (char *)a5 + v8[6];
  uint64_t v10 = sub_1B7383F10();
  uint64_t v11 = *(void *)(v10 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v9, a4, v10);
  uint64_t result = sub_1B7383FC0();
  uint64_t v14 = v13;
  uint64_t v15 = HIBYTE(v13) & 0xF;
  uint64_t v16 = result & 0xFFFFFFFFFFFFLL;
  if ((v14 & 0x2000000000000000) != 0) {
    uint64_t v17 = v15;
  }
  else {
    uint64_t v17 = result & 0xFFFFFFFFFFFFLL;
  }
  if (!v17)
  {
    uint64_t result = swift_bridgeObjectRelease();
    goto LABEL_53;
  }
  if ((v14 & 0x1000000000000000) != 0) {
    goto LABEL_54;
  }
  if ((v14 & 0x2000000000000000) == 0)
  {
    if ((result & 0x1000000000000000) != 0) {
      int v18 = (unsigned __int8 *)((v14 & 0xFFFFFFFFFFFFFFFLL) + 32);
    }
    else {
      int v18 = (unsigned __int8 *)sub_1B73843D0();
    }
    uint64_t v19 = (uint64_t)sub_1B736EA94(v18, v16, 10);
    char v21 = v20 & 1;
    goto LABEL_44;
  }
  v35[0] = result;
  v35[1] = v14 & 0xFFFFFFFFFFFFFFLL;
  if (result == 43)
  {
    if (!v15)
    {
LABEL_57:
      __break(1u);
      return result;
    }
    if (v15 == 1 || (BYTE1(result) - 48) > 9u) {
      goto LABEL_31;
    }
    uint64_t v19 = (BYTE1(result) - 48);
    if (v15 != 2)
    {
      if ((BYTE2(result) - 48) > 9u) {
        goto LABEL_31;
      }
      uint64_t v19 = 10 * (BYTE1(result) - 48) + (BYTE2(result) - 48);
      uint64_t v22 = v15 - 3;
      if (v22)
      {
        uint64_t v23 = (unsigned __int8 *)v35 + 3;
        while (1)
        {
          unsigned int v24 = *v23 - 48;
          if (v24 > 9) {
            goto LABEL_31;
          }
          uint64_t v25 = 10 * v19;
          if ((unsigned __int128)(v19 * (__int128)10) >> 64 != (10 * v19) >> 63) {
            goto LABEL_31;
          }
          uint64_t v19 = v25 + v24;
          if (__OFADD__(v25, v24)) {
            goto LABEL_31;
          }
          char v21 = 0;
          ++v23;
          if (!--v22) {
            goto LABEL_44;
          }
        }
      }
    }
LABEL_43:
    char v21 = 0;
    goto LABEL_44;
  }
  if (result != 45)
  {
    if (!v15 || (result - 48) > 9u) {
      goto LABEL_31;
    }
    uint64_t v19 = (result - 48);
    if (v15 != 1)
    {
      if ((BYTE1(result) - 48) > 9u) {
        goto LABEL_31;
      }
      uint64_t v19 = 10 * (result - 48) + (BYTE1(result) - 48);
      uint64_t v26 = v15 - 2;
      if (v26)
      {
        unint64_t v27 = (unsigned __int8 *)v35 + 2;
        while (1)
        {
          unsigned int v28 = *v27 - 48;
          if (v28 > 9) {
            goto LABEL_31;
          }
          uint64_t v29 = 10 * v19;
          if ((unsigned __int128)(v19 * (__int128)10) >> 64 != (10 * v19) >> 63) {
            goto LABEL_31;
          }
          uint64_t v19 = v29 + v28;
          if (__OFADD__(v29, v28)) {
            goto LABEL_31;
          }
          char v21 = 0;
          ++v27;
          if (!--v26) {
            goto LABEL_44;
          }
        }
      }
    }
    goto LABEL_43;
  }
  if (!v15)
  {
    __break(1u);
    goto LABEL_57;
  }
  if (v15 == 1 || (BYTE1(result) - 48) > 9u) {
    goto LABEL_31;
  }
  if (v15 != 2)
  {
    if ((BYTE2(result) - 48) <= 9u)
    {
      uint64_t v19 = -10 * (BYTE1(result) - 48) - (BYTE2(result) - 48);
      uint64_t v30 = v15 - 3;
      if (!v30) {
        goto LABEL_43;
      }
      unsigned __int8 v31 = (unsigned __int8 *)v35 + 3;
      while (1)
      {
        unsigned int v32 = *v31 - 48;
        if (v32 > 9) {
          break;
        }
        uint64_t v33 = 10 * v19;
        if ((unsigned __int128)(v19 * (__int128)10) >> 64 != (10 * v19) >> 63) {
          break;
        }
        uint64_t v19 = v33 - v32;
        if (__OFSUB__(v33, v32)) {
          break;
        }
        char v21 = 0;
        ++v31;
        if (!--v30) {
          goto LABEL_44;
        }
      }
    }
LABEL_31:
    uint64_t v19 = 0;
    char v21 = 1;
    goto LABEL_44;
  }
  char v21 = 0;
  uint64_t v19 = -(uint64_t)(BYTE1(result) - 48);
LABEL_44:
  while (1)
  {
    uint64_t result = swift_bridgeObjectRelease();
    if ((v21 & 1) == 0) {
      break;
    }
LABEL_53:
    __break(1u);
LABEL_54:
    uint64_t v19 = (uint64_t)sub_1B736E878(result, v14, 10);
    char v21 = v34;
  }
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(v11 + 8))(a4, v10);
  *(void *)((char *)a5 + v8[7]) = v19;
  *(void *)((char *)a5 + v8[8]) = 256;
  return result;
}

uint64_t WBSShareablePasskey.exportedData()()
{
  sub_1B7383DA0();
  swift_allocObject();
  sub_1B7383D90();
  type metadata accessor for WBSShareablePasskey();
  sub_1B736E960();
  uint64_t v0 = sub_1B7383D80();
  swift_release();
  return v0;
}

uint64_t sub_1B736D548(char a1)
{
  return qword_1B7390928[a1];
}

uint64_t sub_1B736D568(char *a1, char *a2)
{
  return sub_1B736FE70(*a1, *a2);
}

uint64_t sub_1B736D574()
{
  return sub_1B7370350();
}

uint64_t sub_1B736D57C()
{
  return sub_1B7370860();
}

uint64_t sub_1B736D584()
{
  return sub_1B7370DF8();
}

uint64_t sub_1B736D58C@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_1B736FCE8();
  *a1 = result;
  return result;
}

uint64_t sub_1B736D5BC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1B736D548(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_1B736D5E8()
{
  return sub_1B736D548(*v0);
}

uint64_t sub_1B736D5F0@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_1B736FCE8();
  *a1 = result;
  return result;
}

uint64_t sub_1B736D618()
{
  return 0;
}

void sub_1B736D624(unsigned char *a1@<X8>)
{
  *a1 = 5;
}

uint64_t sub_1B736D630(uint64_t a1)
{
  unint64_t v2 = sub_1B736E9B8();
  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1B736D66C(uint64_t a1)
{
  unint64_t v2 = sub_1B736E9B8();
  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t WBSShareablePasskey.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9E59488);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  uint64_t v6 = (char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1Tm(a1, a1[3]);
  sub_1B736E9B8();
  sub_1B7384650();
  LOBYTE(v21) = 0;
  sub_1B7384530();
  if (v1) {
    return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  }
  uint64_t v20 = v4;
  uint64_t v8 = sub_1B7383DD0();
  uint64_t v19 = &v17;
  uint64_t v18 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8);
  uint64_t v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B736EA0C();
  sub_1B736F274((unint64_t *)&qword_1E9E59328, (void (*)(uint64_t))sub_1B736EA0C);
  swift_bridgeObjectRetain();
  uint64_t v11 = (void *)sub_1B7383F70();
  id v12 = objc_msgSend(self, sel_cborWithDictionary_, v11);

  sub_1B7383DB0();
  swift_bridgeObjectRelease();
  LOBYTE(v21) = 1;
  sub_1B736F274(&qword_1E9E59498, MEMORY[0x1F4195550]);
  sub_1B7384550();
  (*(void (**)(char *, uint64_t))(v18 + 8))(v10, v8);
  type metadata accessor for WBSShareablePasskey();
  uint64_t v13 = MEMORY[0x1BA9BB8F0]();
  unint64_t v15 = v14;
  uint64_t v21 = v13;
  unint64_t v22 = v14;
  char v23 = 2;
  sub_1B736EA4C();
  sub_1B7384550();
  sub_1B735B0E8(v13, v15);
  LOBYTE(v21) = 4;
  sub_1B7384540();
  uint64_t v16 = v20;
  LOBYTE(v21) = 3;
  sub_1B7384540();
  return (*(uint64_t (**)(char *, uint64_t))(v16 + 8))(v6, v3);
}

uint64_t static P256.Signing.PrivateKey.== infix(_:_:)()
{
  uint64_t v0 = sub_1B7383EE0();
  unint64_t v2 = v1;
  uint64_t v3 = sub_1B7383EE0();
  unint64_t v5 = v4;
  char v6 = sub_1B736EEA0(v0, v2, v3, v4);
  sub_1B735B0E8(v3, v5);
  sub_1B735B0E8(v0, v2);
  return v6 & 1;
}

uint64_t sub_1B736DB40@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  return WBSShareablePasskey.init(from:)(a1, a2);
}

uint64_t WBSShareablePasskey.init(from:)@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  id v63 = a2;
  uint64_t v3 = sub_1B7383F10();
  uint64_t v64 = *(void *)(v3 - 8);
  uint64_t v4 = MEMORY[0x1F4188790](v3);
  char v6 = (char *)&v47 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v4);
  uint64_t v8 = (char *)&v47 - v7;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9E594A8);
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x1F4188790](v9);
  id v12 = (char *)&v47 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = a1[3];
  id v65 = a1;
  __swift_project_boxed_opaque_existential_1Tm(a1, v13);
  sub_1B736E9B8();
  uint64_t v14 = v66;
  sub_1B7384640();
  if (!v14)
  {
    id v61 = v6;
    id v62 = v8;
    uint64_t v66 = v10;
    LOBYTE(v68) = 0;
    uint64_t v15 = sub_1B73844F0();
    uint64_t v17 = v16;
    uint64_t v58 = v15;
    uint64_t v18 = sub_1B7383DD0();
    long long v59 = &v47;
    uint64_t v19 = *(void *)(v18 - 8);
    uint64_t v20 = *(void *)(v19 + 64);
    MEMORY[0x1F4188790](v18);
    LOBYTE(v68) = 1;
    sub_1B736F274(&qword_1E9E594B0, MEMORY[0x1F4195550]);
    uint64_t v60 = v9;
    sub_1B7384510();
    uint64_t v56 = (char *)&v47 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v57 = v18;
    LOBYTE(v67) = 2;
    sub_1B736F2BC();
    sub_1B7384510();
    uint64_t v21 = v68;
    unint64_t v55 = v69;
    LOBYTE(v68) = 3;
    uint64_t v22 = sub_1B7384500();
    char v23 = v56;
    uint64_t v53 = v22;
    uint64_t v54 = v21;
    LOBYTE(v68) = 4;
    uint64_t v50 = sub_1B7384500();
    unint64_t v51 = &v47;
    MEMORY[0x1F4188790](v50);
    uint64_t v25 = v57;
    (*(void (**)(char *, char *, uint64_t))(v19 + 16))((char *)&v47 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0), v23, v57);
    unint64_t v52 = (char *)&v47 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v26 = (void *)sub_1B7383DC0();
    id v27 = objc_msgSend(v26, sel_dictionary);

    if (!v27)
    {
      char v37 = *(void (**)(char *, uint64_t))(v19 + 8);
      v37(v52, v25);
      swift_bridgeObjectRelease();
      LOBYTE(v68) = 1;
      sub_1B73843C0();
      swift_allocError();
      sub_1B736F304();
      uint64_t v38 = v60;
      sub_1B73843B0();
      swift_willThrow();
      sub_1B735B0E8(v54, v55);
      v37(v23, v25);
LABEL_15:
      (*(void (**)(char *, uint64_t))(v66 + 8))(v12, v38);
      return __swift_destroy_boxed_opaque_existential_0((uint64_t)v65);
    }
    char v48 = v12;
    sub_1B736EA0C();
    sub_1B736F274((unint64_t *)&qword_1E9E59328, (void (*)(uint64_t))sub_1B736EA0C);
    uint64_t v47 = sub_1B7383F80();

    unsigned int v28 = *(char **)(v19 + 8);
    uint64_t v29 = v52;
    uint64_t v49 = v19 + 8;
    unint64_t v52 = v28;
    ((void (*)(char *, uint64_t))v28)(v29, v25);
    uint64_t v68 = v50;
    uint64_t v30 = sub_1B7384560();
    uint64_t v32 = v31;
    if (v30 == sub_1B7383FC0() && v32 == v33)
    {
      swift_bridgeObjectRelease_n();
      char v34 = v63;
      uint64_t v35 = v64;
      int v36 = v62;
    }
    else
    {
      char v39 = sub_1B7384590();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      char v34 = v63;
      uint64_t v35 = v64;
      int v36 = v62;
      if ((v39 & 1) == 0)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        char v70 = 4;
        uint64_t v68 = 0;
        unint64_t v69 = 0xE000000000000000;
        sub_1B7384380();
        swift_bridgeObjectRelease();
        uint64_t v68 = 0xD000000000000014;
        unint64_t v69 = 0x80000001B73A8070;
        uint64_t v67 = v50;
        sub_1B7384560();
        sub_1B7384070();
        swift_bridgeObjectRelease();
        sub_1B73843C0();
        swift_allocError();
        sub_1B736F304();
        id v12 = v48;
        uint64_t v38 = v60;
        sub_1B73843B0();
        swift_bridgeObjectRelease();
        swift_willThrow();
        sub_1B735B0E8(v54, v55);
        uint64_t v44 = v23;
        uint64_t v45 = v57;
LABEL_14:
        ((void (*)(char *, uint64_t))v52)(v44, v45);
        goto LABEL_15;
      }
    }
    uint64_t v40 = v57;
    if (v53 == 256)
    {
      uint64_t v64 = v17;
      uint64_t v41 = v54;
      uint64_t v68 = v54;
      unint64_t v69 = v55;
      sub_1B735F794(v54, v55);
      sub_1B7383F00();
      uint64_t v42 = v66;
      uint64_t v68 = v47;
      uint64_t v46 = (uint64_t)v61;
      (*(void (**)(char *, char *, uint64_t))(v35 + 16))(v61, v36, v3);
      WBSShareablePasskey.init(relyingParty:metadata:privateKey:)(v58, v64, &v68, v46, v34);
      sub_1B735B0E8(v41, v55);
      (*(void (**)(char *, uint64_t))(v35 + 8))(v36, v3);
      ((void (*)(char *, uint64_t))v52)(v56, v40);
      (*(void (**)(char *, uint64_t))(v42 + 8))(v48, v60);
      return __swift_destroy_boxed_opaque_existential_0((uint64_t)v65);
    }
    uint64_t v43 = v53;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    char v70 = 3;
    uint64_t v68 = 0;
    unint64_t v69 = 0xE000000000000000;
    sub_1B7384380();
    swift_bridgeObjectRelease();
    uint64_t v68 = 0xD000000000000014;
    unint64_t v69 = 0x80000001B73A8090;
    uint64_t v67 = v43;
    sub_1B7384560();
    sub_1B7384070();
    swift_bridgeObjectRelease();
    sub_1B73843C0();
    swift_allocError();
    sub_1B736F304();
    id v12 = v48;
    uint64_t v38 = v60;
    sub_1B73843B0();
    swift_bridgeObjectRelease();
    swift_willThrow();
    sub_1B735B0E8(v54, v55);
    uint64_t v44 = v56;
    uint64_t v45 = v40;
    goto LABEL_14;
  }
  return __swift_destroy_boxed_opaque_existential_0((uint64_t)v65);
}

uint64_t sub_1B736E518(void *a1)
{
  return WBSShareablePasskey.encode(to:)(a1);
}

uint64_t sub_1B736E534()
{
  uint64_t v0 = sub_1B7383EE0();
  unint64_t v2 = v1;
  uint64_t v3 = sub_1B7383EE0();
  unint64_t v5 = v4;
  char v6 = sub_1B736EEA0(v0, v2, v3, v4);
  sub_1B735B0E8(v3, v5);
  sub_1B735B0E8(v0, v2);
  return v6 & 1;
}

uint64_t sub_1B736E5B8@<X0>(uint64_t __s1@<X0>, uint64_t a2@<X2>, unint64_t a3@<X3>, char *a4@<X8>)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = (const void *)__s1;
  switch(a3 >> 62)
  {
    case 1uLL:
      uint64_t v9 = (a2 >> 32) - (int)a2;
      if (a2 >> 32 < (int)a2)
      {
        __break(1u);
LABEL_31:
        __break(1u);
LABEL_32:
        __break(1u);
        goto LABEL_33;
      }
      sub_1B735F794(a2, a3);
      uint64_t v10 = (char *)sub_1B7383BF0();
      if (!v10) {
        goto LABEL_8;
      }
      uint64_t v11 = sub_1B7383C10();
      if (__OFSUB__((int)a2, v11)) {
LABEL_33:
      }
        __break(1u);
      v10 += (int)a2 - v11;
LABEL_8:
      uint64_t v12 = sub_1B7383C00();
      if (v12 >= v9) {
        size_t v13 = (a2 >> 32) - (int)a2;
      }
      else {
        size_t v13 = v12;
      }
      if (!v7)
      {
LABEL_35:
        __break(1u);
LABEL_36:
        __break(1u);
LABEL_37:
        __break(1u);
LABEL_38:
        __break(1u);
LABEL_39:
        __break(1u);
        JUMPOUT(0x1B736E81CLL);
      }
      if (!v10) {
        goto LABEL_36;
      }
      int v14 = memcmp(v7, v10, v13);
      __s1 = sub_1B735B0E8(a2, a3);
      BOOL v8 = v14 == 0;
LABEL_24:
      char v24 = v8;
LABEL_29:
      *a4 = v24;
      return __s1;
    case 2uLL:
      uint64_t v15 = *(void *)(a2 + 16);
      uint64_t v16 = *(void *)(a2 + 24);
      swift_retain();
      swift_retain();
      uint64_t v17 = (char *)sub_1B7383BF0();
      if (!v17) {
        goto LABEL_17;
      }
      uint64_t v18 = sub_1B7383C10();
      if (__OFSUB__(v15, v18)) {
        goto LABEL_32;
      }
      v17 += v15 - v18;
LABEL_17:
      BOOL v19 = __OFSUB__(v16, v15);
      int64_t v20 = v16 - v15;
      if (v19) {
        goto LABEL_31;
      }
      uint64_t v21 = sub_1B7383C00();
      if (v21 >= v20) {
        size_t v22 = v20;
      }
      else {
        size_t v22 = v21;
      }
      if (!v7) {
        goto LABEL_37;
      }
      if (!v17) {
        goto LABEL_38;
      }
      int v23 = memcmp(v7, v17, v22);
      swift_release();
      __s1 = swift_release();
      BOOL v8 = v23 == 0;
      goto LABEL_24;
    case 3uLL:
      if (!__s1) {
        goto LABEL_39;
      }
      char v24 = 1;
      goto LABEL_29;
    default:
      uint64_t __s2 = a2;
      __int16 v26 = a3;
      char v27 = BYTE2(a3);
      char v28 = BYTE3(a3);
      char v29 = BYTE4(a3);
      char v30 = BYTE5(a3);
      if (__s1)
      {
        __s1 = memcmp((const void *)__s1, &__s2, BYTE6(a3));
        BOOL v8 = __s1 == 0;
        goto LABEL_24;
      }
      __break(1u);
      goto LABEL_35;
  }
}

uint64_t type metadata accessor for WBSShareablePasskey()
{
  uint64_t result = qword_1E9E594C8;
  if (!qword_1E9E594C8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

unsigned __int8 *sub_1B736E878(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v13 = a1;
  uint64_t v14 = a2;
  swift_bridgeObjectRetain();
  uint64_t v5 = sub_1B7384110();
  unint64_t v6 = v4;
  if ((v4 & 0x1000000000000000) == 0)
  {
    if ((v4 & 0x2000000000000000) == 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v8 = HIBYTE(v6) & 0xF;
    uint64_t v13 = v5;
    uint64_t v14 = v6 & 0xFFFFFFFFFFFFFFLL;
    uint64_t v7 = (unsigned __int8 *)&v13;
    goto LABEL_7;
  }
  uint64_t v5 = sub_1B736BB04();
  unint64_t v10 = v9;
  swift_bridgeObjectRelease();
  unint64_t v6 = v10;
  if ((v10 & 0x2000000000000000) != 0) {
    goto LABEL_6;
  }
LABEL_3:
  if ((v5 & 0x1000000000000000) != 0)
  {
    uint64_t v7 = (unsigned __int8 *)((v6 & 0xFFFFFFFFFFFFFFFLL) + 32);
    uint64_t v8 = v5 & 0xFFFFFFFFFFFFLL;
  }
  else
  {
    uint64_t v7 = (unsigned __int8 *)sub_1B73843D0();
  }
LABEL_7:
  uint64_t v11 = sub_1B736EA94(v7, v8, a3);
  swift_bridgeObjectRelease();
  return v11;
}

unint64_t sub_1B736E960()
{
  unint64_t result = qword_1E9E59400;
  if (!qword_1E9E59400)
  {
    type metadata accessor for WBSShareablePasskey();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9E59400);
  }
  return result;
}

unint64_t sub_1B736E9B8()
{
  unint64_t result = qword_1E9E59490;
  if (!qword_1E9E59490)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9E59490);
  }
  return result;
}

unint64_t sub_1B736EA0C()
{
  unint64_t result = qword_1E9E59160;
  if (!qword_1E9E59160)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1E9E59160);
  }
  return result;
}

unint64_t sub_1B736EA4C()
{
  unint64_t result = qword_1E9E594A0;
  if (!qword_1E9E594A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9E594A0);
  }
  return result;
}

unsigned __int8 *sub_1B736EA94(unsigned __int8 *result, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = a2;
  int v4 = *result;
  if (v4 != 43)
  {
    if (v4 == 45)
    {
      if (a2 >= 1)
      {
        uint64_t v5 = a2 - 1;
        if (a2 != 1)
        {
          unsigned __int8 v6 = a3 + 48;
          unsigned __int8 v7 = a3 + 55;
          unsigned __int8 v8 = a3 + 87;
          if (a3 > 10)
          {
            unsigned __int8 v6 = 58;
          }
          else
          {
            unsigned __int8 v8 = 97;
            unsigned __int8 v7 = 65;
          }
          if (result)
          {
            uint64_t v9 = 0;
            for (uint64_t i = result + 1; ; ++i)
            {
              unsigned int v11 = *i;
              if (v11 < 0x30 || v11 >= v6)
              {
                if (v11 < 0x41 || v11 >= v7)
                {
                  if (v11 < 0x61 || v11 >= v8) {
                    return 0;
                  }
                  char v12 = -87;
                }
                else
                {
                  char v12 = -55;
                }
              }
              else
              {
                char v12 = -48;
              }
              uint64_t v13 = v9 * a3;
              if ((unsigned __int128)(v9 * (__int128)a3) >> 64 != (v9 * a3) >> 63) {
                return 0;
              }
              uint64_t v9 = v13 - (v11 + v12);
              if (__OFSUB__(v13, (v11 + v12))) {
                return 0;
              }
              if (!--v5) {
                return (unsigned __int8 *)v9;
              }
            }
          }
          return 0;
        }
        return 0;
      }
      __break(1u);
      goto LABEL_65;
    }
    if (a2)
    {
      unsigned __int8 v22 = a3 + 48;
      unsigned __int8 v23 = a3 + 55;
      unsigned __int8 v24 = a3 + 87;
      if (a3 > 10)
      {
        unsigned __int8 v22 = 58;
      }
      else
      {
        unsigned __int8 v24 = 97;
        unsigned __int8 v23 = 65;
      }
      if (result)
      {
        uint64_t v25 = 0;
        do
        {
          unsigned int v26 = *result;
          if (v26 < 0x30 || v26 >= v22)
          {
            if (v26 < 0x41 || v26 >= v23)
            {
              if (v26 < 0x61 || v26 >= v24) {
                return 0;
              }
              char v27 = -87;
            }
            else
            {
              char v27 = -55;
            }
          }
          else
          {
            char v27 = -48;
          }
          uint64_t v28 = v25 * a3;
          if ((unsigned __int128)(v25 * (__int128)a3) >> 64 != (v25 * a3) >> 63) {
            return 0;
          }
          uint64_t v25 = v28 + (v26 + v27);
          if (__OFADD__(v28, (v26 + v27))) {
            return 0;
          }
          ++result;
          --v3;
        }
        while (v3);
        return (unsigned __int8 *)(v28 + (v26 + v27));
      }
      return 0;
    }
    return 0;
  }
  if (a2 < 1)
  {
LABEL_65:
    __break(1u);
    return result;
  }
  uint64_t v14 = a2 - 1;
  if (a2 == 1) {
    return 0;
  }
  unsigned __int8 v15 = a3 + 48;
  unsigned __int8 v16 = a3 + 55;
  unsigned __int8 v17 = a3 + 87;
  if (a3 > 10)
  {
    unsigned __int8 v15 = 58;
  }
  else
  {
    unsigned __int8 v17 = 97;
    unsigned __int8 v16 = 65;
  }
  if (!result) {
    return 0;
  }
  uint64_t v9 = 0;
  uint64_t v18 = result + 1;
  do
  {
    unsigned int v19 = *v18;
    if (v19 < 0x30 || v19 >= v15)
    {
      if (v19 < 0x41 || v19 >= v16)
      {
        if (v19 < 0x61 || v19 >= v17) {
          return 0;
        }
        char v20 = -87;
      }
      else
      {
        char v20 = -55;
      }
    }
    else
    {
      char v20 = -48;
    }
    uint64_t v21 = v9 * a3;
    if ((unsigned __int128)(v9 * (__int128)a3) >> 64 != (v9 * a3) >> 63) {
      return 0;
    }
    uint64_t v9 = v21 + (v19 + v20);
    if (__OFADD__(v21, (v19 + v20))) {
      return 0;
    }
    ++v18;
    --v14;
  }
  while (v14);
  return (unsigned __int8 *)v9;
}

uint64_t sub_1B736ED10(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t __s1 = a1;
  __int16 v9 = a2;
  char v10 = BYTE2(a2);
  char v11 = BYTE3(a2);
  char v12 = BYTE4(a2);
  char v13 = BYTE5(a2);
  sub_1B736E5B8((uint64_t)&__s1, a3, a4, &v7);
  if (!v4) {
    char v5 = v7;
  }
  return v5 & 1;
}

uint64_t sub_1B736EDE8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5)
{
  uint64_t result = sub_1B7383BF0();
  uint64_t v11 = result;
  if (result)
  {
    uint64_t result = sub_1B7383C10();
    if (__OFSUB__(a1, result))
    {
LABEL_9:
      __break(1u);
      return result;
    }
    v11 += a1 - result;
  }
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
    goto LABEL_9;
  }
  sub_1B7383C00();
  sub_1B736E5B8(v11, a4, a5, &v13);
  if (!v5) {
    char v12 = v13;
  }
  return v12 & 1;
}

uint64_t sub_1B736EEA0(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v8 = 0;
  switch(a2 >> 62)
  {
    case 1uLL:
      LODWORD(v8) = HIDWORD(a1) - a1;
      if (__OFSUB__(HIDWORD(a1), a1))
      {
        __break(1u);
LABEL_26:
        __break(1u);
LABEL_27:
        __break(1u);
LABEL_28:
        __break(1u);
LABEL_29:
        __break(1u);
        JUMPOUT(0x1B736F108);
      }
      uint64_t v8 = (int)v8;
LABEL_6:
      switch(a4 >> 62)
      {
        case 1uLL:
          LODWORD(v12) = HIDWORD(a3) - a3;
          if (__OFSUB__(HIDWORD(a3), a3)) {
            goto LABEL_27;
          }
          uint64_t v12 = (int)v12;
LABEL_11:
          if (v8 == v12)
          {
            if (v8 < 1)
            {
              char v17 = 1;
            }
            else
            {
              switch(a2 >> 62)
              {
                case 1uLL:
                  if (a1 >> 32 < (int)a1) {
                    goto LABEL_29;
                  }
                  sub_1B735F794(a3, a4);
                  sub_1B735F794(a1, a2);
                  char v17 = sub_1B736EDE8((int)a1, a1 >> 32, a2 & 0x3FFFFFFFFFFFFFFFLL, a3, a4);
                  sub_1B735B0E8(a3, a4);
                  uint64_t v18 = a1;
                  unint64_t v19 = a2;
                  break;
                case 2uLL:
                  uint64_t v20 = a2 & 0x3FFFFFFFFFFFFFFFLL;
                  uint64_t v21 = *(void *)(a1 + 16);
                  uint64_t v22 = *(void *)(a1 + 24);
                  sub_1B735F794(a3, a4);
                  swift_retain();
                  swift_retain();
                  char v17 = sub_1B736EDE8(v21, v22, v20, a3, a4);
                  sub_1B735B0E8(a3, a4);
                  swift_release();
                  swift_release();
                  return v17 & 1;
                case 3uLL:
                  sub_1B735F794(a3, a4);
                  uint64_t v16 = 0;
                  uint64_t v15 = 0;
                  goto LABEL_22;
                default:
                  sub_1B735F794(a3, a4);
                  uint64_t v15 = a2 & 0xFFFFFFFFFFFFFFLL;
                  uint64_t v16 = a1;
LABEL_22:
                  char v17 = sub_1B736ED10(v16, v15, a3, a4);
                  uint64_t v18 = a3;
                  unint64_t v19 = a4;
                  break;
              }
              sub_1B735B0E8(v18, v19);
            }
          }
          else
          {
            char v17 = 0;
          }
          return v17 & 1;
        case 2uLL:
          uint64_t v14 = *(void *)(a3 + 16);
          uint64_t v13 = *(void *)(a3 + 24);
          BOOL v11 = __OFSUB__(v13, v14);
          uint64_t v12 = v13 - v14;
          if (!v11) {
            goto LABEL_11;
          }
          goto LABEL_28;
        case 3uLL:
          char v17 = v8 == 0;
          return v17 & 1;
        default:
          uint64_t v12 = BYTE6(a4);
          goto LABEL_11;
      }
    case 2uLL:
      uint64_t v10 = *(void *)(a1 + 16);
      uint64_t v9 = *(void *)(a1 + 24);
      BOOL v11 = __OFSUB__(v9, v10);
      uint64_t v8 = v9 - v10;
      if (!v11) {
        goto LABEL_6;
      }
      goto LABEL_26;
    case 3uLL:
      goto LABEL_6;
    default:
      uint64_t v8 = BYTE6(a2);
      goto LABEL_6;
  }
}

BOOL _s10SafariCore19WBSShareablePasskeyV2eeoiySbAC_ACtFZ_0(void *a1, void *a2)
{
  BOOL v4 = *a1 == *a2 && a1[1] == a2[1];
  if (v4 || (char v5 = sub_1B7384590(), result = 0, (v5 & 1) != 0))
  {
    uint64_t v7 = a1[2];
    uint64_t v8 = a2[2];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_1B7378594(v7, v8);
    char v10 = v9;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v10 & 1) == 0) {
      return 0;
    }
    uint64_t v11 = type metadata accessor for WBSShareablePasskey();
    uint64_t v12 = sub_1B7383EE0();
    unint64_t v14 = v13;
    uint64_t v15 = sub_1B7383EE0();
    unint64_t v17 = v16;
    char v18 = sub_1B736EEA0(v12, v14, v15, v16);
    sub_1B735B0E8(v15, v17);
    sub_1B735B0E8(v12, v14);
    if ((v18 & 1) == 0) {
      return 0;
    }
    return *(void *)((char *)a1 + *(int *)(v11 + 28)) == *(void *)((char *)a2 + *(int *)(v11 + 28))
        && *(void *)((char *)a1 + *(int *)(v11 + 32)) == *(void *)((char *)a2 + *(int *)(v11 + 32));
  }
  return result;
}

uint64_t sub_1B736F274(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_1B736F2BC()
{
  unint64_t result = qword_1E9E594B8;
  if (!qword_1E9E594B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9E594B8);
  }
  return result;
}

unint64_t sub_1B736F304()
{
  unint64_t result = qword_1E9E594C0;
  if (!qword_1E9E594C0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9E594A8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9E594C0);
  }
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for WBSShareablePasskey(uint64_t *a1, uint64_t *a2, int *a3)
{
  BOOL v4 = a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v14 = *a2;
    *BOOL v4 = *a2;
    BOOL v4 = (uint64_t *)(v14 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = a2[1];
    *a1 = *a2;
    a1[1] = v7;
    a1[2] = a2[2];
    uint64_t v8 = a3[6];
    char v9 = (char *)a1 + v8;
    char v10 = (char *)a2 + v8;
    uint64_t v11 = sub_1B7383F10();
    uint64_t v12 = *(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v12(v9, v10, v11);
    uint64_t v13 = a3[8];
    *(uint64_t *)((char *)v4 + a3[7]) = *(uint64_t *)((char *)a2 + a3[7]);
    *(uint64_t *)((char *)v4 + v13) = *(uint64_t *)((char *)a2 + v13);
  }
  return v4;
}

uint64_t destroy for WBSShareablePasskey(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 24);
  uint64_t v5 = sub_1B7383F10();
  unsigned __int8 v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
  return v6(v4, v5);
}

void *initializeWithCopy for WBSShareablePasskey(void *a1, void *a2, int *a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  a1[2] = a2[2];
  uint64_t v7 = a3[6];
  uint64_t v8 = (char *)a1 + v7;
  char v9 = (char *)a2 + v7;
  uint64_t v10 = sub_1B7383F10();
  uint64_t v11 = *(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v11(v8, v9, v10);
  uint64_t v12 = a3[8];
  *(void *)((char *)a1 + a3[7]) = *(void *)((char *)a2 + a3[7]);
  *(void *)((char *)a1 + v12) = *(void *)((char *)a2 + v12);
  return a1;
}

void *assignWithCopy for WBSShareablePasskey(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = a3[6];
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_1B7383F10();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  *(void *)((char *)a1 + a3[7]) = *(void *)((char *)a2 + a3[7]);
  *(void *)((char *)a1 + a3[8]) = *(void *)((char *)a2 + a3[8]);
  return a1;
}

uint64_t initializeWithTake for WBSShareablePasskey(uint64_t a1, uint64_t a2, int *a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  uint64_t v6 = a3[6];
  uint64_t v7 = a1 + v6;
  uint64_t v8 = a2 + v6;
  uint64_t v9 = sub_1B7383F10();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v8, v9);
  uint64_t v10 = a3[8];
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  *(void *)(a1 + v10) = *(void *)(a2 + v10);
  return a1;
}

void *assignWithTake for WBSShareablePasskey(void *a1, void *a2, int *a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_bridgeObjectRelease();
  uint64_t v7 = a3[6];
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_1B7383F10();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  uint64_t v11 = a3[8];
  *(void *)((char *)a1 + a3[7]) = *(void *)((char *)a2 + a3[7]);
  *(void *)((char *)a1 + v11) = *(void *)((char *)a2 + v11);
  return a1;
}

uint64_t getEnumTagSinglePayload for WBSShareablePasskey(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1B736F810);
}

uint64_t sub_1B736F810(uint64_t a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = sub_1B7383F10();
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 24);
    return v9(v11, a2, v10);
  }
}

uint64_t storeEnumTagSinglePayload for WBSShareablePasskey(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1B736F8D4);
}

uint64_t sub_1B736F8D4(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_1B7383F10();
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 24);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t sub_1B736F97C()
{
  uint64_t result = sub_1B7383F10();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for WBSShareablePasskey.AirDropCodingKeys(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for WBSShareablePasskey.AirDropCodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1B736FB98);
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

uint64_t sub_1B736FBC0(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_1B736FBC8(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for WBSShareablePasskey.AirDropCodingKeys()
{
  return &type metadata for WBSShareablePasskey.AirDropCodingKeys;
}

unint64_t sub_1B736FBE4()
{
  unint64_t result = qword_1E9E594D8;
  if (!qword_1E9E594D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9E594D8);
  }
  return result;
}

unint64_t sub_1B736FC3C()
{
  unint64_t result = qword_1E9E594E0;
  if (!qword_1E9E594E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9E594E0);
  }
  return result;
}

unint64_t sub_1B736FC94()
{
  unint64_t result = qword_1E9E594E8;
  if (!qword_1E9E594E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9E594E8);
  }
  return result;
}

uint64_t sub_1B736FCE8()
{
  unint64_t v0 = sub_1B73844D0();
  swift_bridgeObjectRelease();
  if (v0 >= 5) {
    return 5;
  }
  else {
    return v0;
  }
}

uint64_t sub_1B736FD34(char a1, char a2)
{
  BOOL v2 = (a1 & 1) == 0;
  if (a1) {
    unint64_t v3 = 0x776F72625F626577;
  }
  else {
    unint64_t v3 = 0xD000000000000015;
  }
  if (v2) {
    unint64_t v4 = 0x80000001B73A7100;
  }
  else {
    unint64_t v4 = 0xEC00000073726573;
  }
  if (a2) {
    unint64_t v5 = 0x776F72625F626577;
  }
  else {
    unint64_t v5 = 0xD000000000000015;
  }
  if (a2) {
    unint64_t v6 = 0xEC00000073726573;
  }
  else {
    unint64_t v6 = 0x80000001B73A7100;
  }
  if (v3 == v5 && v4 == v6) {
    char v7 = 1;
  }
  else {
    char v7 = sub_1B7384590();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_1B736FDE8(char a1, char a2)
{
  if (*(void *)&aName_6[8 * a1] == *(void *)&aName_6[8 * a2]
    && *(void *)&aIdentifi[8 * a1 + 8] == *(void *)&aIdentifi[8 * a2 + 8])
  {
    char v3 = 1;
  }
  else
  {
    char v3 = sub_1B7384590();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

uint64_t sub_1B736FE70(char a1, char a2)
{
  if (qword_1B7390F98[a1] == qword_1B7390F98[a2] && qword_1B7390FC0[a1] == qword_1B7390FC0[a2]) {
    char v3 = 1;
  }
  else {
    char v3 = sub_1B7384590();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

uint64_t sub_1B736FEF8(unsigned __int8 a1, char a2)
{
  unint64_t v2 = 0xD000000000000011;
  unint64_t v3 = 0x80000001B73A70A0;
  uint64_t v4 = a1;
  unint64_t v5 = 0xD000000000000011;
  switch(v4)
  {
    case 1:
      break;
    case 2:
      unint64_t v5 = 0xD00000000000001BLL;
      unint64_t v6 = "supported_store_identifiers";
      goto LABEL_5;
    case 3:
      unint64_t v5 = 0xD000000000000017;
      unint64_t v6 = "extensions_install_path";
LABEL_5:
      unint64_t v3 = (unint64_t)(v6 - 32) | 0x8000000000000000;
      break;
    default:
      unint64_t v5 = 0x616E5F74726F6873;
      unint64_t v3 = 0xEA0000000000656DLL;
      break;
  }
  unint64_t v7 = 0x80000001B73A70A0;
  switch(a2)
  {
    case 1:
      break;
    case 2:
      unint64_t v2 = 0xD00000000000001BLL;
      int v8 = "supported_store_identifiers";
      goto LABEL_10;
    case 3:
      unint64_t v2 = 0xD000000000000017;
      int v8 = "extensions_install_path";
LABEL_10:
      unint64_t v7 = (unint64_t)(v8 - 32) | 0x8000000000000000;
      break;
    default:
      unint64_t v2 = 0x616E5F74726F6873;
      unint64_t v7 = 0xEA0000000000656DLL;
      break;
  }
  if (v5 == v2 && v3 == v7) {
    char v9 = 1;
  }
  else {
    char v9 = sub_1B7384590();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v9 & 1;
}

uint64_t sub_1B737006C(char a1, char a2)
{
  BOOL v2 = (a1 & 1) == 0;
  if (a1) {
    unint64_t v3 = 0x6E6F697461657263;
  }
  else {
    unint64_t v3 = 0xD000000000000010;
  }
  if (v2) {
    unint64_t v4 = 0x80000001B73A7190;
  }
  else {
    unint64_t v4 = 0xEC00000065746144;
  }
  if (a2) {
    unint64_t v5 = 0x6E6F697461657263;
  }
  else {
    unint64_t v5 = 0xD000000000000010;
  }
  if (a2) {
    unint64_t v6 = 0xEC00000065746144;
  }
  else {
    unint64_t v6 = 0x80000001B73A7190;
  }
  if (v3 == v5 && v4 == v6) {
    char v7 = 1;
  }
  else {
    char v7 = sub_1B7384590();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_1B7370120(unsigned __int8 a1, char a2)
{
  unint64_t v2 = 0xD000000000000013;
  unint64_t v3 = 0x80000001B73A7170;
  uint64_t v4 = a1;
  unint64_t v5 = 0xD000000000000013;
  switch(v4)
  {
    case 1:
      unint64_t v3 = 0xE200000000000000;
      unint64_t v5 = 25705;
      break;
    case 2:
      unint64_t v5 = 0x6F6C42656772616CLL;
      unint64_t v3 = 0xE900000000000062;
      break;
    case 3:
      break;
    default:
      unint64_t v5 = 0x69746E6564657263;
      unint64_t v3 = 0xEC00000044496C61;
      break;
  }
  unint64_t v6 = 0x80000001B73A7170;
  switch(a2)
  {
    case 1:
      unint64_t v6 = 0xE200000000000000;
      unint64_t v2 = 25705;
      goto LABEL_9;
    case 2:
      unint64_t v6 = 0xE900000000000062;
      if (v5 == 0x6F6C42656772616CLL) {
        goto LABEL_12;
      }
      goto LABEL_14;
    case 3:
LABEL_9:
      if (v5 != v2) {
        goto LABEL_14;
      }
      goto LABEL_12;
    default:
      unint64_t v6 = 0xEC00000044496C61;
      if (v5 != 0x69746E6564657263) {
        goto LABEL_14;
      }
LABEL_12:
      if (v3 == v6) {
        char v7 = 1;
      }
      else {
LABEL_14:
      }
        char v7 = sub_1B7384590();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v7 & 1;
  }
}

uint64_t sub_1B73702AC(char a1, char a2)
{
  BOOL v2 = (a1 & 1) == 0;
  if (a1) {
    uint64_t v3 = 0x4E79616C70736964;
  }
  else {
    uint64_t v3 = 1701667182;
  }
  if (v2) {
    unint64_t v4 = 0xE400000000000000;
  }
  else {
    unint64_t v4 = 0xEB00000000656D61;
  }
  if (a2) {
    uint64_t v5 = 0x4E79616C70736964;
  }
  else {
    uint64_t v5 = 1701667182;
  }
  if (a2) {
    unint64_t v6 = 0xEB00000000656D61;
  }
  else {
    unint64_t v6 = 0xE400000000000000;
  }
  if (v3 == v5 && v4 == v6) {
    char v7 = 1;
  }
  else {
    char v7 = sub_1B7384590();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_1B7370350()
{
  return sub_1B7384630();
}

uint64_t sub_1B73703BC()
{
  return sub_1B7384630();
}

uint64_t sub_1B7370428()
{
  return sub_1B7384630();
}

uint64_t sub_1B7370510()
{
  return sub_1B7384630();
}

uint64_t sub_1B73705A0()
{
  return sub_1B7384630();
}

uint64_t sub_1B7370680()
{
  return sub_1B7384630();
}

uint64_t sub_1B7370710()
{
  return sub_1B7384630();
}

uint64_t sub_1B7370794()
{
  sub_1B7384050();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1B737080C()
{
  sub_1B7384050();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1B7370860()
{
  sub_1B7384050();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1B73708B4()
{
  sub_1B7384050();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1B737097C()
{
  sub_1B7384050();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1B73709F4()
{
  sub_1B7384050();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1B7370AC0()
{
  sub_1B7384050();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1B7370B2C()
{
  return sub_1B7384630();
}

uint64_t sub_1B7370BAC()
{
  return sub_1B7384630();
}

uint64_t sub_1B7370C88()
{
  return sub_1B7384630();
}

uint64_t sub_1B7370D14()
{
  return sub_1B7384630();
}

uint64_t sub_1B7370DF8()
{
  return sub_1B7384630();
}

uint64_t sub_1B7370E60()
{
  return sub_1B7384630();
}

uint64_t sub_1B7370EC8()
{
  return sub_1B7384630();
}

uint64_t WBSKnownExtensionStorefront.name.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t WBSKnownExtensionStorefront.url.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for WBSKnownExtensionStorefront() + 20);
  uint64_t v4 = sub_1B7383C70();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);
  return v5(a1, v3, v4);
}

uint64_t type metadata accessor for WBSKnownExtensionStorefront()
{
  uint64_t result = qword_1E9E59550;
  if (!qword_1E9E59550) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t WBSKnownExtensionStorefront.identifier.getter()
{
  return *(void *)(v0 + *(int *)(type metadata accessor for WBSKnownExtensionStorefront() + 24));
}

uint64_t WBSKnownExtensionStorefront.init(name:url:identifier:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, void *a5@<X8>)
{
  *a5 = a1;
  a5[1] = a2;
  uint64_t v8 = type metadata accessor for WBSKnownExtensionStorefront();
  char v9 = (char *)a5 + *(int *)(v8 + 20);
  uint64_t v10 = sub_1B7383C70();
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32))(v9, a3, v10);
  *(void *)((char *)a5 + *(int *)(v8 + 24)) = a4;
  return result;
}

uint64_t sub_1B7371100(char a1)
{
  return *(void *)&aName_6[8 * a1];
}

uint64_t sub_1B7371120(char *a1, char *a2)
{
  return sub_1B736FDE8(*a1, *a2);
}

uint64_t sub_1B737112C()
{
  return sub_1B73703BC();
}

uint64_t sub_1B7371134()
{
  return sub_1B737080C();
}

uint64_t sub_1B737113C()
{
  return sub_1B7370E60();
}

uint64_t sub_1B7371144@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_1B7374D10();
  *a1 = result;
  return result;
}

uint64_t sub_1B7371174@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1B7371100(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_1B73711A0()
{
  return sub_1B7371100(*v0);
}

uint64_t sub_1B73711A8@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_1B7374D10();
  *a1 = result;
  return result;
}

void sub_1B73711D0(unsigned char *a1@<X8>)
{
  *a1 = 3;
}

uint64_t sub_1B73711DC(uint64_t a1)
{
  unint64_t v2 = sub_1B737141C();
  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1B7371218(uint64_t a1)
{
  unint64_t v2 = sub_1B737141C();
  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t WBSKnownExtensionStorefront.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9E594F0);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  unint64_t v6 = &v8[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1Tm(a1, a1[3]);
  sub_1B737141C();
  sub_1B7384650();
  v8[15] = 0;
  sub_1B7384530();
  if (!v1)
  {
    type metadata accessor for WBSKnownExtensionStorefront();
    v8[14] = 1;
    sub_1B7383C70();
    sub_1B737180C(&qword_1E9E59500);
    sub_1B7384550();
    v8[13] = 2;
    sub_1B7384540();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v4 + 8))(v6, v3);
}

unint64_t sub_1B737141C()
{
  unint64_t result = qword_1E9E594F8;
  if (!qword_1E9E594F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9E594F8);
  }
  return result;
}

uint64_t WBSKnownExtensionStorefront.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v20 = a2;
  uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9E59508);
  uint64_t v4 = *(void *)(v21 - 8);
  MEMORY[0x1F4188790](v21);
  unint64_t v6 = (char *)v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for WBSKnownExtensionStorefront();
  MEMORY[0x1F4188790](v7);
  char v9 = (void *)((char *)v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  __swift_project_boxed_opaque_existential_1Tm(a1, a1[3]);
  sub_1B737141C();
  sub_1B7384640();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  }
  uint64_t v18 = v7;
  uint64_t v19 = v4;
  char v24 = 0;
  uint64_t *v9 = sub_1B73844F0();
  v9[1] = v10;
  uint64_t v11 = sub_1B7383C70();
  v17[1] = v17;
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x1F4188790](v11);
  uint64_t v14 = (char *)v17 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v23 = 1;
  sub_1B737180C(&qword_1E9E59510);
  sub_1B7384510();
  v17[0] = v12;
  (*(void (**)(char *, char *, uint64_t))(v12 + 32))((char *)v9 + *(int *)(v18 + 20), v14, v11);
  char v22 = 2;
  uint64_t v15 = sub_1B7384500();
  (*(void (**)(char *, uint64_t))(v19 + 8))(v6, v21);
  *(uint64_t *)((char *)v9 + *(int *)(v18 + 24)) = v15;
  sub_1B7371850((uint64_t)v9, v20);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  return sub_1B73718B4((uint64_t)v9);
}

uint64_t sub_1B737180C(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_1B7383C70();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1B7371850(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for WBSKnownExtensionStorefront();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1B73718B4(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for WBSKnownExtensionStorefront();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1B7371910@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return WBSKnownExtensionStorefront.init(from:)(a1, a2);
}

uint64_t sub_1B7371928(void *a1)
{
  return WBSKnownExtensionStorefront.encode(to:)(a1);
}

uint64_t WBSKnownWebBrowser.shortName.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t WBSKnownWebBrowser.bundleIdentifier.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t WBSKnownWebBrowser.supportedStoreIdentifiers.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t WBSKnownWebBrowser.extensionsInstallPath.getter()
{
  uint64_t v1 = *(void *)(v0 + 40);
  swift_bridgeObjectRetain();
  return v1;
}

void __swiftcall WBSKnownWebBrowser.init(shortName:bundleIdentifier:supportedStoreIdentifiers:extensionsInstallPath:)(SafariCore::WBSKnownWebBrowser *__return_ptr retstr, Swift::String shortName, Swift::String bundleIdentifier, Swift::OpaquePointer supportedStoreIdentifiers, Swift::String_optional extensionsInstallPath)
{
  retstr->shortName = shortName;
  retstr->bundleIdentifier = bundleIdentifier;
  retstr->supportedStoreIdentifiers = supportedStoreIdentifiers;
  retstr->extensionsInstallPath = extensionsInstallPath;
}

unint64_t sub_1B73719EC(char a1)
{
  unint64_t result = 0xD000000000000011;
  switch(a1)
  {
    case 1:
      return result;
    case 2:
      unint64_t result = 0xD00000000000001BLL;
      break;
    case 3:
      unint64_t result = 0xD000000000000017;
      break;
    default:
      unint64_t result = 0x616E5F74726F6873;
      break;
  }
  return result;
}

unint64_t sub_1B7371A80(char a1)
{
  unint64_t result = 0xD000000000000011;
  switch(a1)
  {
    case 1:
      return result;
    case 2:
      unint64_t result = 0xD00000000000001BLL;
      break;
    case 3:
      unint64_t result = 0xD000000000000017;
      break;
    default:
      unint64_t result = 0x616E5F74726F6873;
      break;
  }
  return result;
}

uint64_t sub_1B7371B14(unsigned __int8 *a1, char *a2)
{
  return sub_1B736FEF8(*a1, *a2);
}

uint64_t sub_1B7371B20()
{
  return sub_1B7370428();
}

uint64_t sub_1B7371B28()
{
  return sub_1B73708B4();
}

uint64_t sub_1B7371B30()
{
  return sub_1B7370D14();
}

uint64_t sub_1B7371B38@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_1B7374D5C();
  *a1 = result;
  return result;
}

unint64_t sub_1B7371B68@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = sub_1B73719EC(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

unint64_t sub_1B7371B94()
{
  return sub_1B7371A80(*v0);
}

uint64_t sub_1B7371B9C@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_1B7374D5C();
  *a1 = result;
  return result;
}

void sub_1B7371BC4(unsigned char *a1@<X8>)
{
  *a1 = 4;
}

uint64_t sub_1B7371BD0(uint64_t a1)
{
  unint64_t v2 = sub_1B7373764();
  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1B7371C0C(uint64_t a1)
{
  unint64_t v2 = sub_1B7373764();
  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t WBSKnownWebBrowser.isFirstParty.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = *(void *)(v0 + 24);
  if (v1 == 0xD000000000000010 && v2 == 0x80000001B73A80B0
    || (sub_1B7384590() & 1) != 0
    || v1 == 0xD000000000000021 && v2 == 0x80000001B73A80D0)
  {
    return 1;
  }
  return sub_1B7384590();
}

BOOL sub_1B7371D1C(void *a1, void *a2)
{
  uint64_t v2 = a1[2];
  if (v2 != a2[2]) {
    return 0;
  }
  if (!v2 || a1 == a2) {
    return 1;
  }
  if (a1[4] != a2[4]) {
    return 0;
  }
  if (v2 == 1) {
    return 1;
  }
  uint64_t v4 = v2 - 2;
  uint64_t v5 = a1 + 5;
  unint64_t v6 = a2 + 5;
  do
  {
    uint64_t v8 = *v5++;
    uint64_t v7 = v8;
    uint64_t v10 = *v6++;
    uint64_t v9 = v10;
    BOOL v12 = v4-- != 0;
    BOOL result = v7 == v9;
  }
  while (v7 == v9 && v12);
  return result;
}

uint64_t WBSKnownWebBrowser.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9E59518);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  unint64_t v6 = (char *)v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = v1[2];
  uint64_t v14 = v1[3];
  uint64_t v15 = v7;
  uint64_t v8 = v1[4];
  v12[2] = v1[5];
  uint64_t v13 = v8;
  v12[1] = v1[6];
  __swift_project_boxed_opaque_existential_1Tm(a1, a1[3]);
  sub_1B7373764();
  sub_1B7384650();
  char v21 = 0;
  uint64_t v9 = v16;
  sub_1B7384530();
  if (!v9)
  {
    uint64_t v10 = v13;
    char v20 = 1;
    sub_1B7384530();
    uint64_t v17 = v10;
    char v19 = 2;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9E59528);
    sub_1B73737B8(&qword_1E9E59530);
    sub_1B7384550();
    char v18 = 3;
    sub_1B7384520();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t WBSKnownWebBrowser.init(from:)@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9E59538);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  uint64_t v8 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1Tm(a1, a1[3]);
  sub_1B7373764();
  sub_1B7384640();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  }
  char v31 = 0;
  uint64_t v9 = sub_1B73844F0();
  uint64_t v11 = v10;
  uint64_t v25 = v9;
  char v30 = 1;
  swift_bridgeObjectRetain();
  uint64_t v12 = sub_1B73844F0();
  uint64_t v26 = v13;
  uint64_t v24 = v12;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9E59528);
  char v29 = 2;
  sub_1B73737B8(&qword_1E9E59540);
  swift_bridgeObjectRetain();
  sub_1B7384510();
  char v28 = 3;
  uint64_t v23 = v27;
  swift_bridgeObjectRetain();
  uint64_t v14 = sub_1B73844E0();
  uint64_t v17 = v16;
  char v18 = *(void (**)(char *, uint64_t))(v6 + 8);
  uint64_t v22 = v14;
  v18(v8, v5);
  swift_bridgeObjectRetain();
  uint64_t v19 = v26;
  *a2 = v25;
  a2[1] = v11;
  uint64_t v20 = v23;
  a2[2] = v24;
  a2[3] = v19;
  uint64_t v21 = v22;
  a2[4] = v20;
  a2[5] = v21;
  a2[6] = v17;
  __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1B7372328(char a1)
{
  if (a1) {
    return 0x776F72625F626577;
  }
  else {
    return 0xD000000000000015;
  }
}

uint64_t sub_1B737236C(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9E595D0);
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x1F4188790](v7);
  uint64_t v10 = (char *)&v12 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1Tm(a1, a1[3]);
  sub_1B7375038();
  sub_1B7384650();
  uint64_t v14 = a2;
  char v13 = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9E595A0);
  sub_1B7375150(&qword_1E9E595D8, &qword_1E9E595E0);
  sub_1B7384550();
  if (!v3)
  {
    uint64_t v14 = a3;
    char v13 = 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9E595B8);
    sub_1B737508C(&qword_1E9E595E8, (void (*)(void))sub_1B7375214);
    sub_1B7384550();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

uint64_t sub_1B7372580@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return WBSKnownWebBrowser.init(from:)(a1, a2);
}

uint64_t sub_1B7372598(void *a1)
{
  return WBSKnownWebBrowser.encode(to:)(a1);
}

uint64_t sub_1B73725B0@<X0>(void *a1@<X8>)
{
  uint64_t v2 = *(void *)(v1 + 24);
  *a1 = *(void *)(v1 + 16);
  a1[1] = v2;
  return swift_bridgeObjectRetain();
}

uint64_t sub_1B73725C0(char *a1, char *a2)
{
  return sub_1B736FD34(*a1, *a2);
}

uint64_t sub_1B73725CC()
{
  return sub_1B7370510();
}

uint64_t sub_1B73725D4()
{
  return sub_1B7370794();
}

uint64_t sub_1B73725DC()
{
  return sub_1B7370EC8();
}

uint64_t sub_1B73725E4@<X0>(char *a1@<X8>)
{
  uint64_t v2 = sub_1B73844D0();
  uint64_t result = swift_bridgeObjectRelease();
  if (v2 == 1) {
    char v4 = 1;
  }
  else {
    char v4 = 2;
  }
  if (!v2) {
    char v4 = 0;
  }
  *a1 = v4;
  return result;
}

uint64_t sub_1B7372644@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1B7372328(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_1B7372670()
{
  return sub_1B7372328(*v0);
}

uint64_t sub_1B7372678@<X0>(char *a1@<X8>)
{
  uint64_t v2 = sub_1B73844D0();
  uint64_t result = swift_bridgeObjectRelease();
  if (v2 == 1) {
    char v4 = 1;
  }
  else {
    char v4 = 2;
  }
  if (!v2) {
    char v4 = 0;
  }
  *a1 = v4;
  return result;
}

void sub_1B73726DC(unsigned char *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_1B73726E8(uint64_t a1)
{
  unint64_t v2 = sub_1B7375038();
  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1B7372724(uint64_t a1)
{
  unint64_t v2 = sub_1B7375038();
  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t sub_1B7372760@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = sub_1B7374DA8(a1);
  if (!v2)
  {
    *a2 = result;
    a2[1] = v5;
  }
  return result;
}

uint64_t sub_1B737278C(void *a1)
{
  return sub_1B737236C(a1, *v1, v1[1]);
}

uint64_t sub_1B73727A8(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = *a2;
  swift_beginAccess();
  *(void *)(v3 + 16) = v2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1B7372808()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_1B7372840(uint64_t a1)
{
  swift_beginAccess();
  *(void *)(v1 + 16) = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_1B7372888())()
{
  return j__swift_endAccess;
}

uint64_t sub_1B73728E0(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = *a2;
  swift_beginAccess();
  *(void *)(v3 + 24) = v2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1B7372940()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_1B7372978(uint64_t a1)
{
  swift_beginAccess();
  *(void *)(v1 + 24) = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_1B73729C0())()
{
  return j_j__swift_endAccess;
}

uint64_t WBSKnownWebBrowserManager.__allocating_init(backingDataURL:)(uint64_t a1)
{
  uint64_t v2 = swift_allocObject();
  WBSKnownWebBrowserManager.init(backingDataURL:)(a1);
  return v2;
}

uint64_t WBSKnownWebBrowserManager.init(backingDataURL:)(uint64_t a1)
{
  uint64_t v3 = MEMORY[0x1E4FBC860];
  *(void *)(v1 + 16) = MEMORY[0x1E4FBC860];
  *(void *)(v1 + 24) = v3;
  uint64_t v4 = sub_1B7383C80();
  unint64_t v6 = v5;
  sub_1B7383BA0();
  swift_allocObject();
  sub_1B7383B90();
  sub_1B737381C();
  sub_1B7383B80();
  uint64_t v8 = sub_1B7383C70();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(a1, v8);
  swift_release();
  sub_1B735B0E8(v4, v6);
  swift_beginAccess();
  *(void *)(v1 + 16) = v10;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_beginAccess();
  *(void *)(v1 + 24) = v9;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v1;
}

uint64_t WBSKnownWebBrowserManager.__allocating_init(knownWebBrowsers:knownExtensionStorefronts:)(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = a1;
  *(void *)(result + 24) = a2;
  return result;
}

uint64_t WBSKnownWebBrowserManager.init(knownWebBrowsers:knownExtensionStorefronts:)(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = a2;
  return v2;
}

uint64_t sub_1B7372DD8(uint64_t a1)
{
  long long v1 = *(_OWORD *)(a1 + 16);
  v5[0] = *(_OWORD *)a1;
  v5[1] = v1;
  void v5[2] = *(_OWORD *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 48);
  swift_beginAccess();
  sub_1B7373AB8((uint64_t)v5);
  uint64_t v2 = swift_bridgeObjectRetain();
  uint64_t v3 = sub_1B7373870(v2, (uint64_t)v5);
  sub_1B7373B0C((uint64_t)v5);
  swift_bridgeObjectRelease();
  return v3;
}

uint64_t WBSKnownWebBrowserManager.deinit()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t WBSKnownWebBrowserManager.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return MEMORY[0x1F4186488](v0, 32, 7);
}

uint64_t sub_1B7372ED0(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_1B737340C(a1, a2, a3, (void *)*v3, &qword_1E9E59480, (uint64_t (*)(void))type metadata accessor for WBSKeychainPasskey);
  uint64_t *v3 = result;
  return result;
}

uint64_t sub_1B7372F0C(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_1B7372FA8(a1, a2, a3, (void *)*v3);
  uint64_t *v3 = result;
  return result;
}

uint64_t sub_1B7372F2C(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_1B7373134(a1, a2, a3, *v3);
  uint64_t *v3 = (char *)result;
  return result;
}

uint64_t sub_1B7372F4C(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_1B73732A0(a1, a2, a3, *v3);
  uint64_t *v3 = (char *)result;
  return result;
}

uint64_t sub_1B7372F6C(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_1B737340C(a1, a2, a3, (void *)*v3, &qword_1E9E595F8, (uint64_t (*)(void))type metadata accessor for WBSKnownExtensionStorefront);
  uint64_t *v3 = result;
  return result;
}

uint64_t sub_1B7372FA8(char a1, int64_t a2, char a3, void *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9E592E8);
    uint64_t v10 = (void *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 25;
    }
    void v10[2] = v8;
    v10[3] = 2 * (v12 >> 3);
  }
  else
  {
    uint64_t v10 = (void *)MEMORY[0x1E4FBC860];
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9E592D0);
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_1B73844C0();
  __break(1u);
  return result;
}

uint64_t sub_1B7373134(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9E59600);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x1E4FBC860];
  }
  unint64_t v13 = v10 + 32;
  unint64_t v14 = a4 + 32;
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
  uint64_t result = sub_1B73844C0();
  __break(1u);
  return result;
}

uint64_t sub_1B73732A0(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9E59448);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x1E4FBC860];
  }
  unint64_t v13 = v10 + 32;
  unint64_t v14 = a4 + 32;
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
  uint64_t result = sub_1B73844C0();
  __break(1u);
  return result;
}

uint64_t sub_1B737340C(char a1, int64_t a2, char a3, void *a4, uint64_t *a5, uint64_t (*a6)(void))
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
    uint64_t v16 = (void *)MEMORY[0x1E4FBC860];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(a5);
  uint64_t v13 = *(void *)(a6(0) - 8);
  uint64_t v14 = *(void *)(v13 + 72);
  unint64_t v15 = (*(unsigned __int8 *)(v13 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
  uint64_t v16 = (void *)swift_allocObject();
  size_t v17 = _swift_stdlib_malloc_size(v16);
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
  uint64_t v22 = (char *)a4 + v20;
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
  uint64_t result = sub_1B73844C0();
  __break(1u);
  return result;
}

uint64_t _s10SafariCore18WBSKnownWebBrowserV2eeoiySbAC_ACtFZ_0(void *a1, void *a2)
{
  uint64_t v2 = a1[2];
  uint64_t v4 = a1[3];
  uint64_t v3 = (void *)a1[4];
  uint64_t v6 = a1[5];
  uint64_t v5 = a1[6];
  uint64_t v7 = a2[2];
  uint64_t v8 = a2[3];
  int64_t v10 = (void *)a2[4];
  uint64_t v9 = a2[5];
  uint64_t v11 = a2[6];
  if (*a1 == *a2 && a1[1] == a2[1] || (v12 = sub_1B7384590(), uint64_t result = 0, (v12 & 1) != 0))
  {
    if (v2 == v7 && v4 == v8 || (v14 = sub_1B7384590(), uint64_t result = 0, (v14 & 1) != 0))
    {
      if (sub_1B7371D1C(v3, v10))
      {
        if (v5)
        {
          if (v11 && (v6 == v9 && v5 == v11 || (sub_1B7384590() & 1) != 0)) {
            return 1;
          }
        }
        else if (!v11)
        {
          return 1;
        }
      }
      return 0;
    }
  }
  return result;
}

unint64_t sub_1B7373764()
{
  unint64_t result = qword_1E9E59520;
  if (!qword_1E9E59520)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9E59520);
  }
  return result;
}

uint64_t sub_1B73737B8(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9E59528);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_1B737381C()
{
  unint64_t result = qword_1E9E59548;
  if (!qword_1E9E59548)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9E59548);
  }
  return result;
}

uint64_t sub_1B7373870(uint64_t a1, uint64_t a2)
{
  uint64_t v28 = type metadata accessor for WBSKnownExtensionStorefront();
  uint64_t v5 = MEMORY[0x1F4188790](v28);
  uint64_t v7 = (char *)&v26 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v5);
  int64_t v10 = (char *)&v26 - v9;
  uint64_t result = MEMORY[0x1E4FBC860];
  uint64_t v30 = MEMORY[0x1E4FBC860];
  uint64_t v12 = *(void *)(a1 + 16);
  if (!v12) {
    return result;
  }
  uint64_t v13 = 0;
  uint64_t v14 = *(unsigned __int8 *)(v8 + 80);
  uint64_t v29 = *(void *)(v8 + 72);
  uint64_t v26 = v2;
  uint64_t v27 = (v14 + 32) & ~v14;
  uint64_t v15 = a1 + v27;
  uint64_t v16 = MEMORY[0x1E4FBC860];
  while (1)
  {
    uint64_t result = sub_1B7371850(v15 + v29 * v13, (uint64_t)v10);
    uint64_t v17 = *(void *)(a2 + 32);
    uint64_t v18 = *(void *)(v17 + 16);
    if (v18)
    {
      uint64_t v19 = *(void *)&v10[*(int *)(v28 + 24)];
      if (*(void *)(v17 + 32) == v19)
      {
LABEL_7:
        uint64_t v20 = (uint64_t)v7;
        sub_1B7375268((uint64_t)v10, (uint64_t)v7);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          sub_1B7372F6C(0, *(void *)(v16 + 16) + 1, 1);
        }
        uint64_t v16 = v30;
        unint64_t v22 = *(void *)(v30 + 16);
        unint64_t v21 = *(void *)(v30 + 24);
        if (v22 >= v21 >> 1)
        {
          sub_1B7372F6C(v21 > 1, v22 + 1, 1);
          uint64_t v16 = v30;
        }
        *(void *)(v16 + 16) = v22 + 1;
        uint64_t v23 = v16 + v27 + v22 * v29;
        uint64_t v7 = (char *)v20;
        sub_1B7375268(v20, v23);
        goto LABEL_4;
      }
      if (v18 != 1) {
        break;
      }
    }
LABEL_3:
    sub_1B73718B4((uint64_t)v10);
LABEL_4:
    if (++v13 == v12) {
      return v30;
    }
  }
  uint64_t v24 = 5;
  while (1)
  {
    uint64_t v25 = v24 - 3;
    if (__OFADD__(v24 - 4, 1)) {
      break;
    }
    if (*(void *)(v17 + 8 * v24) == v19) {
      goto LABEL_7;
    }
    ++v24;
    if (v25 == v18) {
      goto LABEL_3;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_1B7373AB8(uint64_t a1)
{
  return a1;
}

uint64_t sub_1B7373B0C(uint64_t a1)
{
  return a1;
}

uint64_t sub_1B7373B60()
{
  return MEMORY[0x1E4FBB1B0];
}

uint64_t sub_1B7373B6C@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_beginAccess();
  *a2 = *(void *)(v3 + 16);
  return swift_bridgeObjectRetain();
}

uint64_t sub_1B7373BBC@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_beginAccess();
  *a2 = *(void *)(v3 + 24);
  return swift_bridgeObjectRetain();
}

uint64_t *initializeBufferWithCopyOfBuffer for WBSKnownExtensionStorefront(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v13 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (uint64_t *)(v13 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = a2[1];
    *a1 = *a2;
    a1[1] = v7;
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = (char *)a1 + v8;
    int64_t v10 = (char *)a2 + v8;
    uint64_t v11 = sub_1B7383C70();
    uint64_t v12 = *(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16);
    swift_bridgeObjectRetain();
    v12(v9, v10, v11);
    *(uint64_t *)((char *)v4 + *(int *)(a3 + 24)) = *(uint64_t *)((char *)a2 + *(int *)(a3 + 24));
  }
  return v4;
}

uint64_t destroy for WBSKnownExtensionStorefront(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 20);
  uint64_t v5 = sub_1B7383C70();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
  return v6(v4, v5);
}

void *initializeWithCopy for WBSKnownExtensionStorefront(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_1B7383C70();
  uint64_t v11 = *(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16);
  swift_bridgeObjectRetain();
  v11(v8, v9, v10);
  *(void *)((char *)a1 + *(int *)(a3 + 24)) = *(void *)((char *)a2 + *(int *)(a3 + 24));
  return a1;
}

void *assignWithCopy for WBSKnownExtensionStorefront(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_1B7383C70();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  *(void *)((char *)a1 + *(int *)(a3 + 24)) = *(void *)((char *)a2 + *(int *)(a3 + 24));
  return a1;
}

_OWORD *initializeWithTake for WBSKnownExtensionStorefront(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_1B7383C70();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v8, v9);
  *(void *)((char *)a1 + *(int *)(a3 + 24)) = *(void *)((char *)a2 + *(int *)(a3 + 24));
  return a1;
}

void *assignWithTake for WBSKnownExtensionStorefront(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_1B7383C70();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  *(void *)((char *)a1 + *(int *)(a3 + 24)) = *(void *)((char *)a2 + *(int *)(a3 + 24));
  return a1;
}

uint64_t getEnumTagSinglePayload for WBSKnownExtensionStorefront(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1B7374038);
}

uint64_t sub_1B7374038(uint64_t a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = sub_1B7383C70();
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 20);
    return v9(v11, a2, v10);
  }
}

uint64_t storeEnumTagSinglePayload for WBSKnownExtensionStorefront(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1B73740FC);
}

uint64_t sub_1B73740FC(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_1B7383C70();
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 20);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t sub_1B73741A4()
{
  uint64_t result = sub_1B7383C70();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t destroy for WBSKnownWebBrowser()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for WBSKnownWebBrowser(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  uint64_t v5 = a2[5];
  a1[4] = a2[4];
  a1[5] = v5;
  a1[6] = a2[6];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for WBSKnownWebBrowser(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[5] = a2[5];
  a1[6] = a2[6];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy56_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  long long v4 = *(_OWORD *)(a2 + 32);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for WBSKnownWebBrowser(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v5;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for WBSKnownWebBrowser(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 56)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for WBSKnownWebBrowser(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 56) = 1;
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
    *(unsigned char *)(result + 56) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for WBSKnownWebBrowser()
{
  return &type metadata for WBSKnownWebBrowser;
}

uint64_t type metadata accessor for WBSKnownWebBrowserManager()
{
  return self;
}

uint64_t method lookup function for WBSKnownWebBrowserManager(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for WBSKnownWebBrowserManager);
}

uint64_t dispatch thunk of WBSKnownWebBrowserManager.knownWebBrowsers.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 96))();
}

uint64_t dispatch thunk of WBSKnownWebBrowserManager.knownWebBrowsers.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 104))();
}

uint64_t dispatch thunk of WBSKnownWebBrowserManager.knownWebBrowsers.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 112))();
}

uint64_t dispatch thunk of WBSKnownWebBrowserManager.knownExtensionStorefronts.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 120))();
}

uint64_t dispatch thunk of WBSKnownWebBrowserManager.knownExtensionStorefronts.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 128))();
}

uint64_t dispatch thunk of WBSKnownWebBrowserManager.knownExtensionStorefronts.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 136))();
}

uint64_t dispatch thunk of WBSKnownWebBrowserManager.__allocating_init(backingDataURL:)()
{
  return (*(uint64_t (**)(void))(v0 + 144))();
}

uint64_t dispatch thunk of WBSKnownWebBrowserManager.__allocating_init(knownWebBrowsers:knownExtensionStorefronts:)()
{
  return (*(uint64_t (**)(void))(v0 + 152))();
}

uint64_t dispatch thunk of WBSKnownWebBrowserManager.knownStorefrontsForWebBrowser(webBrowser:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 160))();
}

uint64_t destroy for WBSKnownExtensionStorefrontsAndBrowsers()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void *_s10SafariCore39WBSKnownExtensionStorefrontsAndBrowsersVwCP_0(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for WBSKnownExtensionStorefrontsAndBrowsers(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_OWORD *assignWithTake for WBSKnownExtensionStorefrontsAndBrowsers(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for WBSKnownExtensionStorefrontsAndBrowsers(uint64_t *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for WBSKnownExtensionStorefrontsAndBrowsers(uint64_t result, int a2, int a3)
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
      *(void *)__n128 result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 16) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for WBSKnownExtensionStorefrontsAndBrowsers()
{
  return &type metadata for WBSKnownExtensionStorefrontsAndBrowsers;
}

uint64_t getEnumTagSinglePayload for WBSKnownWebBrowser.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for WBSKnownWebBrowser.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *__n128 result = a2 + 3;
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
        JUMPOUT(0x1B7374934);
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
          *__n128 result = a2 + 3;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for WBSKnownWebBrowser.CodingKeys()
{
  return &type metadata for WBSKnownWebBrowser.CodingKeys;
}

uint64_t getEnumTagSinglePayload for WBSKnownExtensionStorefront.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for WBSKnownExtensionStorefront.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *__n128 result = a2 + 2;
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
        JUMPOUT(0x1B7374AC8);
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
          *__n128 result = a2 + 2;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for WBSKnownExtensionStorefront.CodingKeys()
{
  return &type metadata for WBSKnownExtensionStorefront.CodingKeys;
}

unint64_t sub_1B7374B04()
{
  unint64_t result = qword_1E9E59560;
  if (!qword_1E9E59560)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9E59560);
  }
  return result;
}

unint64_t sub_1B7374B5C()
{
  unint64_t result = qword_1E9E59568;
  if (!qword_1E9E59568)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9E59568);
  }
  return result;
}

unint64_t sub_1B7374BB4()
{
  unint64_t result = qword_1E9E59570;
  if (!qword_1E9E59570)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9E59570);
  }
  return result;
}

unint64_t sub_1B7374C0C()
{
  unint64_t result = qword_1E9E59578;
  if (!qword_1E9E59578)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9E59578);
  }
  return result;
}

unint64_t sub_1B7374C64()
{
  unint64_t result = qword_1E9E59580;
  if (!qword_1E9E59580)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9E59580);
  }
  return result;
}

unint64_t sub_1B7374CBC()
{
  unint64_t result = qword_1E9E59588;
  if (!qword_1E9E59588)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9E59588);
  }
  return result;
}

uint64_t sub_1B7374D10()
{
  unint64_t v0 = sub_1B73844D0();
  swift_bridgeObjectRelease();
  if (v0 >= 3) {
    return 3;
  }
  else {
    return v0;
  }
}

uint64_t sub_1B7374D5C()
{
  unint64_t v0 = sub_1B73844D0();
  swift_bridgeObjectRelease();
  if (v0 >= 4) {
    return 4;
  }
  else {
    return v0;
  }
}

uint64_t sub_1B7374DA8(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9E59590);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  unsigned int v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = a1[3];
  __swift_project_boxed_opaque_existential_1Tm(a1, v7);
  sub_1B7375038();
  sub_1B7384640();
  if (v1)
  {
    __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9E595A0);
    HIBYTE(v9) = 0;
    sub_1B7375150(&qword_1E9E595A8, &qword_1E9E595B0);
    sub_1B7384510();
    uint64_t v7 = v10;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9E595B8);
    HIBYTE(v9) = 1;
    sub_1B737508C(&qword_1E9E595C0, (void (*)(void))sub_1B73750FC);
    swift_bridgeObjectRetain();
    sub_1B7384510();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    swift_bridgeObjectRetain();
    __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return v7;
}

unint64_t sub_1B7375038()
{
  unint64_t result = qword_1E9E59598;
  if (!qword_1E9E59598)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9E59598);
  }
  return result;
}

uint64_t sub_1B737508C(unint64_t *a1, void (*a2)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9E595B8);
    a2();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_1B73750FC()
{
  unint64_t result = qword_1E9E595C8;
  if (!qword_1E9E595C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9E595C8);
  }
  return result;
}

uint64_t sub_1B7375150(unint64_t *a1, unint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9E595A0);
    sub_1B73751D0(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1B73751D0(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for WBSKnownExtensionStorefront();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_1B7375214()
{
  unint64_t result = qword_1E9E595F0;
  if (!qword_1E9E595F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9E595F0);
  }
  return result;
}

uint64_t sub_1B7375268(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for WBSKnownExtensionStorefront();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t getEnumTagSinglePayload for WBSKnownExtensionStorefrontsAndBrowsers.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for WBSKnownExtensionStorefrontsAndBrowsers.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1B7375428);
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

unsigned char *sub_1B7375450(unsigned char *result, char a2)
{
  *unint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for WBSKnownExtensionStorefrontsAndBrowsers.CodingKeys()
{
  return &type metadata for WBSKnownExtensionStorefrontsAndBrowsers.CodingKeys;
}

unint64_t sub_1B7375470()
{
  unint64_t result = qword_1E9E59608;
  if (!qword_1E9E59608)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9E59608);
  }
  return result;
}

unint64_t sub_1B73754C8()
{
  unint64_t result = qword_1E9E59610;
  if (!qword_1E9E59610)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9E59610);
  }
  return result;
}

unint64_t sub_1B7375520()
{
  unint64_t result = qword_1E9E59618;
  if (!qword_1E9E59618)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9E59618);
  }
  return result;
}

void *WBSKeychainPasskey.Metadata.subscript.getter()
{
  uint64_t v1 = *v0;
  int v2 = (void *)sub_1B7383FA0();
  swift_bridgeObjectRelease();
  id v3 = objc_msgSend(self, sel_cborWithUTF8String_, v2);

  unsigned int v4 = sub_1B73775C4(v3, v1);
  if (v4)
  {
    id v5 = objc_msgSend(v4, sel_string);

    if (v5)
    {
      unsigned int v4 = (void *)sub_1B7383FC0();
    }
    else
    {
      return 0;
    }
  }
  return v4;
}

{
  uint64_t *v0;
  uint64_t v1;
  void *v2;
  id v3;
  void *v4;
  id v5;

  uint64_t v1 = *v0;
  int v2 = (void *)sub_1B7383FA0();
  swift_bridgeObjectRelease();
  id v3 = objc_msgSend(self, sel_cborWithUTF8String_, v2);

  unsigned int v4 = sub_1B73775C4(v3, v1);
  if (v4)
  {
    id v5 = objc_msgSend(v4, sel_data);

    if (v5)
    {
      unsigned int v4 = (void *)sub_1B7383D00();
    }
    else
    {
      return 0;
    }
  }
  return v4;
}

unint64_t sub_1B73757E4(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    id v3 = (void *)MEMORY[0x1E4FBC868];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9E59180);
  uint64_t v2 = sub_1B73844B0();
  id v3 = (void *)v2;
  uint64_t v4 = *(void *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  uint64_t v5 = v2 + 64;
  uint64_t v6 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_1B737A518(v6, (uint64_t)&v15, &qword_1E9E59660);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_1B73579F8(v15, v16);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v3[6] + 16 * result);
    *uint64_t v11 = v7;
    v11[1] = v8;
    unint64_t result = (unint64_t)sub_1B735B1F0(&v17, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v12 = v3[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v3[2] = v14;
    v6 += 48;
    if (!--v4)
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

unint64_t sub_1B737591C(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = (void *)MEMORY[0x1E4FBC868];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9E59170);
  uint64_t v2 = (void *)sub_1B73844B0();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (void **)(a1 + 40);
  while (1)
  {
    uint64_t v5 = *v4;
    id v6 = *(v4 - 1);
    id v7 = v5;
    unint64_t result = sub_1B7357970((uint64_t)v6);
    if (v9) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v10 = 8 * result;
    *(void *)(v2[6] + v10) = v6;
    *(void *)(v2[7] + v10) = v7;
    uint64_t v11 = v2[2];
    BOOL v12 = __OFADD__(v11, 1);
    uint64_t v13 = v11 + 1;
    if (v12) {
      goto LABEL_11;
    }
    v2[2] = v13;
    v4 += 2;
    if (!--v3)
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

unint64_t sub_1B7375A28(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = (void *)MEMORY[0x1E4FBC868];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9E59650);
  uint64_t v2 = sub_1B73844B0();
  uint64_t v3 = (void *)v2;
  uint64_t v4 = *(void *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  uint64_t v5 = v2 + 64;
  uint64_t v6 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_1B737A518(v6, (uint64_t)&v13, &qword_1E9E59658);
    uint64_t v7 = v13;
    unint64_t result = sub_1B7357A70(v13);
    if (v9) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(void *)(v3[6] + 8 * result) = v7;
    unint64_t result = (unint64_t)sub_1B735B1F0(&v14, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v10 = v3[2];
    BOOL v11 = __OFADD__(v10, 1);
    uint64_t v12 = v10 + 1;
    if (v11) {
      goto LABEL_11;
    }
    v3[2] = v12;
    v6 += 40;
    if (!--v4)
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

uint64_t WBSKeychainPasskey.Metadata.subscript.getter()
{
  uint64_t v1 = *v0;
  uint64_t v2 = (void *)sub_1B7383FA0();
  id v3 = objc_msgSend(self, sel_cborWithUTF8String_, v2);

  uint64_t v4 = sub_1B73775C4(v3, v1);
  if (!v4) {
    return 2;
  }
  id v5 = objc_msgSend(v4, sel_BOOLValue);

  return (uint64_t)v5;
}

uint64_t WBSKeychainPasskey.Metadata.init(name:displayName:userHandle:largeBlob:prfCredRandomWithUV:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, unint64_t a6@<X5>, uint64_t a7@<X6>, unint64_t a8@<X7>, unint64_t *a9@<X8>, uint64_t a10, unint64_t a11)
{
  *a9 = sub_1B737591C(MEMORY[0x1E4FBC860]);
  WBSKeychainPasskey.Metadata.subscript.setter(a1, a2);
  WBSKeychainPasskey.Metadata.subscript.setter(a3, a4);
  sub_1B7367E4C(a5, a6);
  WBSKeychainPasskey.Metadata.subscript.setter(a5, a6);
  sub_1B7367E4C(a7, a8);
  WBSKeychainPasskey.Metadata.subscript.setter(a7, a8);
  WBSKeychainPasskey.Metadata.subscript.setter(a10, a11);
  sub_1B735F96C(a7, a8);
  return sub_1B735F96C(a5, a6);
}

uint64_t WBSKeychainPasskey.init(keychainDictionary:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = (int *)type metadata accessor for WBSKeychainPasskey();
  uint64_t v5 = *((void *)v4 - 1);
  ((void (*)(void))MEMORY[0x1F4188790])();
  uint64_t v7 = (char *)&v114 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v8 = (id)*MEMORY[0x1E4F3B5D8];
  if (objc_msgSend(a1, sel___swift_objectForKeyedSubscript_, v8))
  {
    sub_1B7384280();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v137 = 0u;
    long long v138 = 0u;
  }
  sub_1B7378150((uint64_t)&v137, (uint64_t)v139);
  if (!v140)
  {

    sub_1B735B684((uint64_t)v139, &qword_1E9E590A8);
LABEL_12:
    if (qword_1E9E58F28 != -1) {
      swift_once();
    }
    uint64_t v16 = sub_1B7383E40();
    __swift_project_value_buffer(v16, (uint64_t)qword_1E9E5B9C0);
    long long v17 = sub_1B7383E10();
    os_log_type_t v18 = sub_1B73841C0();
    if (os_log_type_enabled(v17, v18))
    {
      uint64_t v19 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v19 = 0;
      _os_log_impl(&dword_1B728F000, v17, v18, "Keychain passkey is missing atag.", v19, 2u);
      MEMORY[0x1BA9BDB10](v19, -1, -1);
    }
    goto LABEL_37;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {

    goto LABEL_12;
  }
  long long v9 = v136;

  uint64_t v10 = self;
  sub_1B735F794(v9, *((unint64_t *)&v9 + 1));
  unint64_t v133 = *((void *)&v9 + 1);
  BOOL v11 = (void *)sub_1B7383CD0();
  id v12 = objc_msgSend(v10, sel_decodeFromData_, v11);

  if (!v12 || (id v13 = objc_msgSend(v12, sel_dictionary), v12, !v13))
  {
    unint64_t v20 = v133;
    sub_1B735B0E8(v9, v133);
    if (qword_1E9E58F28 != -1) {
      swift_once();
    }
    uint64_t v21 = sub_1B7383E40();
    __swift_project_value_buffer(v21, (uint64_t)qword_1E9E5B9C0);
    long long v17 = sub_1B7383E10();
    os_log_type_t v22 = sub_1B73841C0();
    if (os_log_type_enabled(v17, v22))
    {
      uint64_t v23 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v23 = 0;
      _os_log_impl(&dword_1B728F000, v17, v22, "Could not parse keychain passkey's atag.", v23, 2u);
      MEMORY[0x1BA9BDB10](v23, -1, -1);

      uint64_t v24 = v9;
      unint64_t v25 = v20;
LABEL_34:
      sub_1B735B0E8(v24, v25);
LABEL_38:
      uint64_t v34 = 1;
      return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, int *))(v5 + 56))(a2, v34, 1, v4);
    }
    uint64_t v26 = v9;
    unint64_t v27 = v20;
LABEL_36:
    sub_1B735B0E8(v26, v27);
LABEL_37:

    goto LABEL_38;
  }
  sub_1B736EA0C();
  sub_1B7367F00();
  uint64_t v132 = sub_1B7383F80();
  unint64_t v14 = v133;
  sub_1B735B0E8(v9, v133);

  id v15 = (id)*MEMORY[0x1E4F3B788];
  if (objc_msgSend(a1, sel___swift_objectForKeyedSubscript_, v15))
  {
    sub_1B7384280();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v137 = 0u;
    long long v138 = 0u;
  }
  sub_1B7378150((uint64_t)&v137, (uint64_t)v139);
  if (!v140)
  {

    swift_bridgeObjectRelease();
    sub_1B735B684((uint64_t)v139, &qword_1E9E590A8);
LABEL_30:
    if (qword_1E9E58F28 != -1) {
      swift_once();
    }
    uint64_t v31 = sub_1B7383E40();
    __swift_project_value_buffer(v31, (uint64_t)qword_1E9E5B9C0);
    long long v17 = sub_1B7383E10();
    os_log_type_t v32 = sub_1B73841C0();
    if (os_log_type_enabled(v17, v32))
    {
      uint64_t v33 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v33 = 0;
      _os_log_impl(&dword_1B728F000, v17, v32, "Keychain passkey is missing labl.", v33, 2u);
      MEMORY[0x1BA9BDB10](v33, -1, -1);

      uint64_t v24 = v9;
      unint64_t v25 = v14;
      goto LABEL_34;
    }
    uint64_t v26 = v9;
    unint64_t v27 = v14;
    goto LABEL_36;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {

    swift_bridgeObjectRelease();
    goto LABEL_30;
  }
  uint64_t v131 = *((void *)&v136 + 1);
  uint64_t v28 = v136;

  unsigned int v29 = objc_msgSend(self, sel_isCredentialExchangeEnabled);
  uint64_t v128 = v28;
  if (!v29)
  {
    id v36 = (id)*MEMORY[0x1E4F3B5D0];
    if (objc_msgSend(a1, sel___swift_objectForKeyedSubscript_, v36))
    {
      sub_1B7384280();
      swift_unknownObjectRelease();
    }
    else
    {
      long long v137 = 0u;
      long long v138 = 0u;
    }
    sub_1B7378150((uint64_t)&v137, (uint64_t)v139);
    if (v140)
    {
      if (swift_dynamicCast())
      {
        unint64_t v37 = *((void *)&v136 + 1);
        uint64_t v38 = v136;

        uint64_t v129 = v38;
        uint64_t v39 = v38;
        goto LABEL_65;
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    else
    {

      sub_1B735B684((uint64_t)v139, &qword_1E9E590A8);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    uint64_t v40 = 0;
    unint64_t v37 = 0xF000000000000000;
LABEL_69:
    if (qword_1E9E58F28 != -1) {
      swift_once();
    }
    uint64_t v47 = sub_1B7383E40();
    __swift_project_value_buffer(v47, (uint64_t)qword_1E9E5B9C0);
    long long v17 = sub_1B7383E10();
    os_log_type_t v48 = sub_1B73841C0();
    if (os_log_type_enabled(v17, v48))
    {
      uint64_t v49 = (uint8_t *)swift_slowAlloc();
      unint64_t v130 = v37;
      uint64_t v50 = v49;
      *(_WORD *)uint64_t v49 = 0;
      _os_log_impl(&dword_1B728F000, v17, v48, "Keychain passkey is missing alis/klbl.", v49, 2u);
      MEMORY[0x1BA9BDB10](v50, -1, -1);

      sub_1B735B0E8(v9, v14);
      uint64_t v51 = v40;
      unint64_t v52 = v130;
LABEL_84:
      sub_1B735F96C(v51, v52);
      goto LABEL_38;
    }
    sub_1B735B0E8(v9, v14);
    sub_1B735F96C(v40, v37);
    goto LABEL_37;
  }
  if (!*MEMORY[0x1E4F3B5C8])
  {
    __break(1u);
    goto LABEL_132;
  }
  id v30 = (id)*MEMORY[0x1E4F3B5C8];
  if (objc_msgSend(a1, sel___swift_objectForKeyedSubscript_, v30))
  {
    sub_1B7384280();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v137 = 0u;
    long long v138 = 0u;
  }
  sub_1B7378150((uint64_t)&v137, (uint64_t)v139);
  if (!v140)
  {

    sub_1B735B684((uint64_t)v139, &qword_1E9E590A8);
LABEL_55:
    id v41 = (id)*MEMORY[0x1E4F3B5D0];
    if (objc_msgSend(a1, sel___swift_objectForKeyedSubscript_, v41))
    {
      sub_1B7384280();
      swift_unknownObjectRelease();
    }
    else
    {
      long long v137 = 0u;
      long long v138 = 0u;
    }
    sub_1B7378150((uint64_t)&v137, (uint64_t)v139);
    if (!v140)
    {

      sub_1B735B684((uint64_t)v139, &qword_1E9E590A8);
      uint64_t v40 = 0;
      unint64_t v37 = 0xF000000000000000;
      goto LABEL_68;
    }
    if ((swift_dynamicCast() & 1) == 0) {
      long long v136 = xmmword_1B7390480;
    }

    unint64_t v37 = *((void *)&v136 + 1);
    uint64_t v129 = v136;
    goto LABEL_62;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {

    goto LABEL_55;
  }
  unint64_t v37 = v135;
  uint64_t v129 = v134;

LABEL_62:
  if (v37 >> 60 == 15)
  {
    uint64_t v40 = v129;
LABEL_68:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_69;
  }
  uint64_t v39 = v129;
LABEL_65:
  unint64_t v130 = v37;
  sub_1B735F794(v39, v37);
  uint64_t v42 = sub_1B7383D30();
  uint64_t v124 = &v114;
  uint64_t v126 = *(void *)(v42 - 8);
  uint64_t v127 = v42;
  ((void (*)(void))MEMORY[0x1F4188790])();
  uint64_t v122 = v43;
  uint64_t v44 = (char *)&v114 - (((unint64_t)v43 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9E59238);
  uint64_t v125 = &v114;
  ((void (*)(void))MEMORY[0x1F4188790])();
  uint64_t v121 = v45;
  uint64_t v46 = (char *)&v114 - ((v45 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v123 = (id)*MEMORY[0x1E4F3B790];
  if (objc_msgSend(a1, sel___swift_objectForKeyedSubscript_))
  {
    sub_1B7384280();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v137 = 0u;
    long long v138 = 0u;
  }
  sub_1B7378150((uint64_t)&v137, (uint64_t)v139);
  if (!v140)
  {

    sub_1B735B684((uint64_t)v139, &qword_1E9E590A8);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v126 + 56))(v46, 1, 1, v127);
    goto LABEL_80;
  }
  uint64_t v120 = v44;
  uint64_t v53 = v127;
  int v54 = swift_dynamicCast();
  uint64_t v55 = v126;
  uint64_t v56 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v126 + 56);
  uint64_t v119 = v126 + 56;
  v118 = v56;
  v56(v46, v54 ^ 1u, 1, v53);

  uint64_t v57 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v55 + 48);
  id v123 = (id)(v55 + 48);
  unint64_t v117 = v57;
  if (v57(v46, 1, v53) == 1)
  {
LABEL_80:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_1B735B684((uint64_t)v46, &qword_1E9E59238);
    if (qword_1E9E58F28 != -1) {
      swift_once();
    }
    uint64_t v64 = sub_1B7383E40();
    __swift_project_value_buffer(v64, (uint64_t)qword_1E9E5B9C0);
    long long v17 = sub_1B7383E10();
    os_log_type_t v65 = sub_1B73841C0();
    BOOL v66 = os_log_type_enabled(v17, v65);
    unint64_t v67 = v133;
    if (v66)
    {
      uint64_t v68 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v68 = 0;
      _os_log_impl(&dword_1B728F000, v17, v65, "Keychain passkey is missing mdat.", v68, 2u);
      MEMORY[0x1BA9BDB10](v68, -1, -1);

      uint64_t v70 = v129;
      unint64_t v69 = v130;
      sub_1B735B0E8(v129, v130);
      sub_1B735B0E8(v9, v67);
      uint64_t v51 = v70;
      unint64_t v52 = v69;
      goto LABEL_84;
    }
    sub_1B735B0E8(v9, v133);
    uint64_t v72 = v129;
    unint64_t v71 = v130;
    sub_1B735F96C(v129, v130);
    uint64_t v26 = v72;
    unint64_t v27 = v71;
    goto LABEL_36;
  }
  v115 = *(uint64_t (**)(char *, char *, uint64_t))(v55 + 32);
  uint64_t v114 = v55 + 32;
  uint64_t v58 = v115(v120, v46, v53);
  uint64_t v125 = &v114;
  uint64_t v59 = MEMORY[0x1F4188790](v58);
  int v116 = (char *)&v114 - ((v60 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v122 = &v114;
  MEMORY[0x1F4188790](v59);
  id v62 = (char *)&v114 - ((v61 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v63 = (id)*MEMORY[0x1E4F3B668];
  if (objc_msgSend(a1, sel___swift_objectForKeyedSubscript_))
  {
    sub_1B7384280();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v137 = 0u;
    long long v138 = 0u;
  }
  sub_1B7378150((uint64_t)&v137, (uint64_t)v139);
  if (!v140)
  {

    sub_1B735B684((uint64_t)v139, &qword_1E9E590A8);
    v118(v62, 1, 1, v127);
    goto LABEL_92;
  }
  uint64_t v73 = v127;
  int v74 = swift_dynamicCast();
  v118(v62, v74 ^ 1u, 1, v73);

  if (v117(v62, 1, v73) == 1)
  {
LABEL_92:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_1B735B684((uint64_t)v62, &qword_1E9E59238);
    if (qword_1E9E58F28 != -1) {
      swift_once();
    }
    uint64_t v77 = sub_1B7383E40();
    __swift_project_value_buffer(v77, (uint64_t)qword_1E9E5B9C0);
    unint64_t v78 = sub_1B7383E10();
    os_log_type_t v79 = sub_1B73841C0();
    BOOL v80 = os_log_type_enabled(v78, v79);
    uint64_t v81 = v129;
    if (v80)
    {
      CFDataRef v82 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)CFDataRef v82 = 0;
      _os_log_impl(&dword_1B728F000, v78, v79, "Keychain passkey is missing cdat.", v82, 2u);
      MEMORY[0x1BA9BDB10](v82, -1, -1);
    }

    unint64_t v83 = v130;
    sub_1B735B0E8(v81, v130);
    sub_1B735B0E8(v9, v133);
    sub_1B735F96C(v81, v83);
    (*(void (**)(char *, uint64_t))(v126 + 8))(v120, v127);
    goto LABEL_109;
  }
  uint64_t v75 = v116;
  v115(v116, v62, v127);
  id v76 = (id)*MEMORY[0x1E4F3B878];
  if (objc_msgSend(a1, sel___swift_objectForKeyedSubscript_, v76))
  {
    sub_1B7384280();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v137 = 0u;
    long long v138 = 0u;
  }
  sub_1B7378150((uint64_t)&v137, (uint64_t)v139);
  unint64_t v84 = v130;
  if (!v140)
  {

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_1B735B684((uint64_t)v139, &qword_1E9E590A8);
LABEL_104:
    uint64_t v86 = v129;
    if (qword_1E9E58F28 != -1) {
      swift_once();
    }
    uint64_t v87 = sub_1B7383E40();
    __swift_project_value_buffer(v87, (uint64_t)qword_1E9E5B9C0);
    uint64_t v88 = sub_1B7383E10();
    os_log_type_t v89 = sub_1B73841C0();
    if (os_log_type_enabled(v88, v89))
    {
      uint64_t v90 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v90 = 0;
      _os_log_impl(&dword_1B728F000, v88, v89, "Keychain passkey is missing sync.", v90, 2u);
      unsigned int v91 = v90;
      unint64_t v84 = v130;
      MEMORY[0x1BA9BDB10](v91, -1, -1);
    }

    sub_1B735B0E8(v86, v84);
    sub_1B735B0E8(v9, v133);
    sub_1B735F96C(v86, v84);
    uint64_t v92 = v127;
    int v93 = *(void (**)(char *, uint64_t))(v126 + 8);
    v93(v75, v127);
    v93(v120, v92);
LABEL_109:
    uint64_t v34 = 1;
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, int *))(v5 + 56))(a2, v34, 1, v4);
  }
  if ((swift_dynamicCast() & 1) == 0)
  {

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_104;
  }
  LODWORD(v123) = v136;

  id v85 = (id)*MEMORY[0x1E4F3BD40];
  if (objc_msgSend(a1, sel___swift_objectForKeyedSubscript_, v85))
  {
    sub_1B7384280();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v137 = 0u;
    long long v138 = 0u;
  }
  sub_1B7378150((uint64_t)&v137, (uint64_t)v139);
  if (v140)
  {
    int v94 = swift_dynamicCast();
    if (v94) {
      uint64_t v95 = v136;
    }
    else {
      uint64_t v95 = 0;
    }
    if (v94) {
      unint64_t v96 = *((void *)&v136 + 1);
    }
    else {
      unint64_t v96 = 0xF000000000000000;
    }
  }
  else
  {

    sub_1B735B684((uint64_t)v139, &qword_1E9E590A8);
    uint64_t v95 = 0;
    unint64_t v96 = 0xF000000000000000;
  }
  *(void *)uint64_t v7 = v95;
  *((void *)v7 + 1) = v96;
  uint64_t v98 = v127;
  uint64_t v97 = v128;
  *((void *)v7 + 2) = v132;
  *((void *)v7 + 3) = v97;
  uint64_t v99 = v129;
  *((void *)v7 + 4) = v131;
  *((void *)v7 + 5) = v99;
  *((void *)v7 + 6) = v130;
  uint64_t v100 = *(void (**)(char *, char *, uint64_t))(v126 + 16);
  v100(&v7[v4[8]], v120, v98);
  v100(&v7[v4[9]], v116, v98);
  v7[v4[10]] = (char)v123;
  uint64_t v101 = (void *)*MEMORY[0x1E4F3B858];
  if (*MEMORY[0x1E4F3B858])
  {
    sub_1B735F794(v129, v130);
    id v102 = v101;
    if (objc_msgSend(a1, sel___swift_objectForKeyedSubscript_, v102))
    {
      sub_1B7384280();
      swift_unknownObjectRelease();
    }
    else
    {
      long long v137 = 0u;
      long long v138 = 0u;
    }
    sub_1B7378150((uint64_t)&v137, (uint64_t)v139);
    uint64_t v103 = v129;
    if (v140)
    {
      if (swift_dynamicCast())
      {
        uint64_t v105 = *((void *)&v136 + 1);
        uint64_t v104 = v136;

LABEL_130:
        unint64_t v107 = v130;
        sub_1B735B0E8(v103, v130);
        sub_1B735B0E8(v9, v133);
        sub_1B735F96C(v103, v107);
        uint64_t v108 = v127;
        v109 = v120;
        uint64_t v110 = *(void (**)(char *, uint64_t))(v126 + 8);
        v110(v116, v127);
        v110(v109, v108);
        uint64_t v111 = (uint64_t *)&v7[v4[11]];
        *uint64_t v111 = v104;
        v111[1] = v105;
        sub_1B7378814((uint64_t)v7, a2);
        uint64_t v34 = 0;
        return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, int *))(v5 + 56))(a2, v34, 1, v4);
      }
    }
    else
    {

      sub_1B735B684((uint64_t)v139, &qword_1E9E590A8);
    }
    uint64_t v104 = sub_1B7383FC0();
    uint64_t v105 = v106;

    goto LABEL_130;
  }
LABEL_132:
  uint64_t v113 = v129;
  unint64_t v112 = v130;
  sub_1B735F794(v129, v130);
  uint64_t result = sub_1B735F96C(v113, v112);
  __break(1u);
  return result;
}

void WBSKeychainPasskey.Metadata.subscript.setter(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    uint64_t v2 = (void *)sub_1B7383FA0();
    swift_bridgeObjectRelease();
    id v3 = self;
    id v9 = objc_msgSend(v3, sel_cborWithUTF8String_, v2);

    uint64_t v4 = (void *)sub_1B7383FA0();
    swift_bridgeObjectRelease();
    id v5 = objc_msgSend(v3, sel_cborWithUTF8String_, v4);

    if (v5)
    {
      sub_1B7378BC8((uint64_t)v5, v9);
    }
    else
    {
      uint64_t v8 = sub_1B7378A78((unint64_t)v9);

      id v9 = (id)v8;
    }
  }
  else
  {
    uint64_t v6 = (void *)sub_1B7383FA0();
    swift_bridgeObjectRelease();
    id v7 = objc_msgSend(self, sel_cborWithUTF8String_, v6);

    id v9 = (id)sub_1B7378A78((unint64_t)v7);
  }
}

uint64_t WBSKeychainPasskey.Metadata.toCBOR()()
{
  sub_1B736EA0C();
  sub_1B7367F00();
  swift_bridgeObjectRetain();
  unint64_t v0 = (void *)sub_1B7383F70();
  swift_bridgeObjectRelease();
  id v1 = objc_msgSend(self, sel_cborWithDictionary_, v0);

  return sub_1B7383C90();
}

void WBSKeychainPasskey.Metadata.subscript.setter(char a1)
{
  if (a1 == 2)
  {
    id v1 = (void *)sub_1B7383FA0();
    id v2 = objc_msgSend(self, sel_cborWithUTF8String_, v1);

    id v8 = (id)sub_1B7378A78((unint64_t)v2);
  }
  else
  {
    uint64_t v4 = (void *)sub_1B7383FA0();
    id v5 = self;
    id v8 = objc_msgSend(v5, sel_cborWithUTF8String_, v4);

    id v6 = objc_msgSend(v5, sel_cborWithInteger_, a1 & 1);
    if (v6)
    {
      sub_1B7378BC8((uint64_t)v6, v8);
    }
    else
    {
      uint64_t v7 = sub_1B7378A78((unint64_t)v8);

      id v8 = (id)v7;
    }
  }
}

void *sub_1B73775C4(void *a1, uint64_t a2)
{
  if ((a2 & 0xC000000000000001) == 0)
  {
    if (*(void *)(a2 + 16))
    {
      unint64_t v6 = sub_1B7357970((uint64_t)a1);
      if (v7)
      {
        id v5 = *(void **)(*(void *)(a2 + 56) + 8 * v6);
        id v8 = v5;
        return v5;
      }
    }
    return 0;
  }
  id v3 = a1;
  uint64_t v4 = sub_1B7384420();

  if (!v4) {
    return 0;
  }
  sub_1B736EA0C();
  swift_unknownObjectRetain();
  swift_dynamicCast();
  id v5 = v10;
  swift_unknownObjectRelease();
  return v5;
}

void static WBSKeychainPasskey.Metadata.== infix(_:_:)(uint64_t *a1, uint64_t *a2)
{
}

uint64_t WBSKeychainPasskey.persistentRef.getter()
{
  uint64_t v1 = *(void *)v0;
  sub_1B7367E4C(*(void *)v0, *(void *)(v0 + 8));
  return v1;
}

uint64_t WBSKeychainPasskey.metadata.getter@<X0>(void *a1@<X8>)
{
  *a1 = *(void *)(v1 + 16);
  return swift_bridgeObjectRetain();
}

uint64_t WBSKeychainPasskey.metadata.setter(uint64_t *a1)
{
  uint64_t v2 = *a1;
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 16) = v2;
  return result;
}

uint64_t (*WBSKeychainPasskey.metadata.modify())()
{
  return nullsub_1;
}

uint64_t WBSKeychainPasskey.relyingPartyIdentifier.getter()
{
  uint64_t v1 = *(void *)(v0 + 24);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t WBSKeychainPasskey.credentialID.getter()
{
  uint64_t v1 = *(void *)(v0 + 40);
  sub_1B735F794(v1, *(void *)(v0 + 48));
  return v1;
}

uint64_t WBSKeychainPasskey.lastModifiedDate.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for WBSKeychainPasskey() + 32);
  uint64_t v4 = sub_1B7383D30();
  id v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);
  return v5(a1, v3, v4);
}

uint64_t WBSKeychainPasskey.creationDate.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for WBSKeychainPasskey() + 36);
  uint64_t v4 = sub_1B7383D30();
  id v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);
  return v5(a1, v3, v4);
}

uint64_t WBSKeychainPasskey.isSynchronizable.getter()
{
  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for WBSKeychainPasskey() + 40));
}

uint64_t WBSKeychainPasskey.group.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for WBSKeychainPasskey() + 44));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t WBSKeychainPasskey.init(persistentRef:metadata:relyingPartyIdentifier:credentialID:lastModifiedDate:creationDate:isSynchronizable:group:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, void *a9@<X8>, uint64_t a10, char a11, uint64_t a12, uint64_t a13)
{
  uint64_t v15 = *a3;
  *a9 = a1;
  a9[1] = a2;
  a9[2] = v15;
  a9[3] = a4;
  a9[4] = a5;
  a9[5] = a6;
  a9[6] = a7;
  uint64_t v16 = (int *)type metadata accessor for WBSKeychainPasskey();
  long long v17 = (char *)a9 + v16[8];
  uint64_t v18 = sub_1B7383D30();
  uint64_t v19 = *(void (**)(char *, uint64_t, uint64_t))(*(void *)(v18 - 8) + 32);
  v19(v17, a8, v18);
  uint64_t result = ((uint64_t (*)(char *, uint64_t, uint64_t))v19)((char *)a9 + v16[9], a10, v18);
  *((unsigned char *)a9 + v16[10]) = a11;
  uint64_t v21 = (void *)((char *)a9 + v16[11]);
  *uint64_t v21 = a12;
  v21[1] = a13;
  return result;
}

uint64_t WBSKeychainPasskey.Metadata.BoolKeys.init(rawValue:)@<X0>(BOOL *a1@<X8>)
{
  uint64_t v2 = sub_1B73844D0();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2 != 0;
  return result;
}

unint64_t WBSKeychainPasskey.Metadata.BoolKeys.rawValue.getter()
{
  return 0xD000000000000017;
}

uint64_t sub_1B7377A4C()
{
  return 1;
}

uint64_t sub_1B7377A54()
{
  return sub_1B7384630();
}

uint64_t sub_1B7377AAC()
{
  return sub_1B7384050();
}

uint64_t sub_1B7377AC8()
{
  return sub_1B7384630();
}

uint64_t sub_1B7377B1C@<X0>(BOOL *a1@<X8>)
{
  uint64_t v2 = sub_1B73844D0();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2 != 0;
  return result;
}

void sub_1B7377B70(void *a1@<X8>)
{
  *a1 = 0xD000000000000017;
  a1[1] = 0x80000001B73A7130;
}

SafariCore::WBSKeychainPasskey::Metadata::DataKeys_optional __swiftcall WBSKeychainPasskey.Metadata.DataKeys.init(rawValue:)(Swift::String rawValue)
{
  uint64_t v2 = v1;
  unint64_t v3 = sub_1B73844D0();
  result.value = swift_bridgeObjectRelease();
  char v5 = 4;
  if (v3 < 4) {
    char v5 = v3;
  }
  char *v2 = v5;
  return result;
}

unint64_t WBSKeychainPasskey.Metadata.DataKeys.rawValue.getter()
{
  unint64_t result = 0xD000000000000013;
  switch(*v0)
  {
    case 1:
      unint64_t result = 25705;
      break;
    case 2:
      unint64_t result = 0x6F6C42656772616CLL;
      break;
    case 3:
      return result;
    default:
      unint64_t result = 0x69746E6564657263;
      break;
  }
  return result;
}

uint64_t sub_1B7377C80(unsigned __int8 *a1, char *a2)
{
  return sub_1B7370120(*a1, *a2);
}

uint64_t sub_1B7377C8C()
{
  return sub_1B73705A0();
}

uint64_t sub_1B7377C94()
{
  return sub_1B73709F4();
}

uint64_t sub_1B7377C9C()
{
  return sub_1B7370BAC();
}

SafariCore::WBSKeychainPasskey::Metadata::DataKeys_optional sub_1B7377CA4(Swift::String *a1)
{
  return WBSKeychainPasskey.Metadata.DataKeys.init(rawValue:)(*a1);
}

unint64_t sub_1B7377CB0@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = WBSKeychainPasskey.Metadata.DataKeys.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

SafariCore::WBSKeychainPasskey::Metadata::DateKeys_optional __swiftcall WBSKeychainPasskey.Metadata.DateKeys.init(rawValue:)(Swift::String rawValue)
{
  return (SafariCore::WBSKeychainPasskey::Metadata::DateKeys_optional)sub_1B7377D90(v1);
}

uint64_t WBSKeychainPasskey.Metadata.DateKeys.rawValue.getter()
{
  if (*v0) {
    return 0x6E6F697461657263;
  }
  else {
    return 0xD000000000000010;
  }
}

uint64_t sub_1B7377D2C(char *a1, char *a2)
{
  return sub_1B737006C(*a1, *a2);
}

uint64_t sub_1B7377D38()
{
  return sub_1B7370680();
}

uint64_t sub_1B7377D40()
{
  return sub_1B737097C();
}

uint64_t sub_1B7377D48()
{
  return sub_1B7370C88();
}

SafariCore::WBSKeychainPasskey::Metadata::DateKeys_optional sub_1B7377D50(Swift::String *a1)
{
  return WBSKeychainPasskey.Metadata.DateKeys.init(rawValue:)(*a1);
}

uint64_t sub_1B7377D5C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = WBSKeychainPasskey.Metadata.DateKeys.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

SafariCore::WBSKeychainPasskey::Metadata::StringKeys_optional __swiftcall WBSKeychainPasskey.Metadata.StringKeys.init(rawValue:)(Swift::String rawValue)
{
  return (SafariCore::WBSKeychainPasskey::Metadata::StringKeys_optional)sub_1B7377D90(v1);
}

uint64_t sub_1B7377D90@<X0>(char *a1@<X8>)
{
  uint64_t v2 = sub_1B73844D0();
  uint64_t result = swift_bridgeObjectRelease();
  if (v2 == 1) {
    char v4 = 1;
  }
  else {
    char v4 = 2;
  }
  if (!v2) {
    char v4 = 0;
  }
  *a1 = v4;
  return result;
}

uint64_t WBSKeychainPasskey.Metadata.StringKeys.rawValue.getter()
{
  if (*v0) {
    return 0x4E79616C70736964;
  }
  else {
    return 1701667182;
  }
}

uint64_t sub_1B7377E2C(char *a1, char *a2)
{
  return sub_1B73702AC(*a1, *a2);
}

uint64_t sub_1B7377E38()
{
  return sub_1B7370710();
}

uint64_t sub_1B7377E40()
{
  return sub_1B7370AC0();
}

uint64_t sub_1B7377E48()
{
  return sub_1B7370B2C();
}

SafariCore::WBSKeychainPasskey::Metadata::StringKeys_optional sub_1B7377E50(Swift::String *a1)
{
  return WBSKeychainPasskey.Metadata.StringKeys.init(rawValue:)(*a1);
}

uint64_t sub_1B7377E5C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = WBSKeychainPasskey.Metadata.StringKeys.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

void WBSKeychainPasskey.Metadata.subscript.setter(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 == 15)
  {
    char v4 = (void *)sub_1B7383FA0();
    swift_bridgeObjectRelease();
    id v5 = objc_msgSend(self, sel_cborWithUTF8String_, v4);

    id v12 = (id)sub_1B7378A78((unint64_t)v5);
  }
  else
  {
    sub_1B7367E4C(a1, a2);
    unint64_t v6 = (void *)sub_1B7383FA0();
    swift_bridgeObjectRelease();
    char v7 = self;
    id v8 = objc_msgSend(v7, sel_cborWithUTF8String_, v6);

    sub_1B735F794(a1, a2);
    id v9 = (void *)sub_1B7383CD0();
    id v10 = objc_msgSend(v7, sel_cborWithData_, v9);
    sub_1B735F96C(a1, a2);

    if (v10)
    {
      sub_1B7378BC8((uint64_t)v10, v8);
    }
    else
    {
      BOOL v11 = (void *)sub_1B7378A78((unint64_t)v8);
    }
    sub_1B735F96C(a1, a2);
    sub_1B735F96C(a1, a2);
  }
}

uint64_t sub_1B7378150(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9E590A8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_1B73781B8(uint64_t *a1@<X0>, unsigned __int8 *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_bridgeObjectRetain();
  uint64_t v4 = (void *)sub_1B7383FA0();
  id v5 = objc_msgSend(self, sel_cborWithUTF8String_, v4);

  unint64_t v6 = sub_1B73775C4(v5, v3);
  if (v6)
  {
    unsigned __int8 v7 = objc_msgSend(v6, sel_BOOLValue);
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    unsigned __int8 v7 = 2;
  }
  *a2 = v7;
}

void (*WBSKeychainPasskey.Metadata.subscript.modify(uint64_t a1))(uint64_t a1)
{
  *(void *)a1 = v1;
  uint64_t v3 = *v1;
  uint64_t v4 = (void *)sub_1B7383FA0();
  id v5 = objc_msgSend(self, sel_cborWithUTF8String_, v4);

  unint64_t v6 = sub_1B73775C4(v5, v3);
  if (v6)
  {
    unsigned __int8 v7 = objc_msgSend(v6, sel_BOOLValue);
  }
  else
  {
    unsigned __int8 v7 = 2;
  }
  *(unsigned char *)(a1 + 8) = v7;
  return sub_1B7378364;
}

void sub_1B7378364(uint64_t a1)
{
}

void (*WBSKeychainPasskey.Metadata.subscript.modify(uint64_t a1, unsigned char *a2))(uint64_t *a1, char a2)
{
  *(void *)(a1 + 16) = v2;
  *(unsigned char *)(a1 + 24) = *a2;
  *(void *)a1 = WBSKeychainPasskey.Metadata.subscript.getter();
  *(void *)(a1 + 8) = v4;
  return sub_1B73783F8;
}

{
  uint64_t v2;
  uint64_t v4;

  *(void *)(a1 + 16) = v2;
  *(unsigned char *)(a1 + 24) = *a2;
  *(void *)a1 = WBSKeychainPasskey.Metadata.subscript.getter();
  *(void *)(a1 + 8) = v4;
  return sub_1B7378500;
}

void sub_1B73783F8(uint64_t *a1, char a2)
{
  uint64_t v2 = *a1;
  unint64_t v3 = a1[1];
  if (a2)
  {
    sub_1B7367E4C(v2, v3);
    WBSKeychainPasskey.Metadata.subscript.setter(v2, v3);
    sub_1B735F96C(v2, v3);
  }
  else
  {
    WBSKeychainPasskey.Metadata.subscript.setter(v2, v3);
  }
}

void sub_1B7378500(uint64_t *a1, char a2)
{
  uint64_t v3 = *a1;
  uint64_t v2 = a1[1];
  if (a2)
  {
    swift_bridgeObjectRetain();
    WBSKeychainPasskey.Metadata.subscript.setter(v3, v2);
    swift_bridgeObjectRelease();
  }
  else
  {
    WBSKeychainPasskey.Metadata.subscript.setter(v3, v2);
  }
}

void sub_1B7378594(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a2;
  uint64_t v3 = a1;
  unint64_t v4 = a2 & 0xC000000000000001;
  if ((a1 & 0xC000000000000001) != 0)
  {
    if (a1 < 0) {
      a2 = a1;
    }
    else {
      a2 = a1 & 0xFFFFFFFFFFFFFF8;
    }
    if (v4)
    {
      if (v2 < 0) {
        a1 = v2;
      }
      else {
        a1 = v2 & 0xFFFFFFFFFFFFFF8;
      }
      goto LABEL_50;
    }
    uint64_t v5 = a2;
    uint64_t v6 = v2;
    goto LABEL_18;
  }
  if (v4)
  {
    if (a2 < 0) {
      uint64_t v5 = a2;
    }
    else {
      uint64_t v5 = a2 & 0xFFFFFFFFFFFFFF8;
    }
    uint64_t v6 = v3;
LABEL_18:
    sub_1B73791D4(v5, v6);
    return;
  }
  if (a1 == a2 || *(void *)(a1 + 16) != *(void *)(a2 + 16)) {
    return;
  }
  int64_t v7 = 0;
  uint64_t v8 = a1 + 64;
  uint64_t v9 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v10 = -1;
  if (v9 < 64) {
    uint64_t v10 = ~(-1 << v9);
  }
  unint64_t v11 = v10 & *(void *)(a1 + 64);
  int64_t v12 = (unint64_t)(v9 + 63) >> 6;
  while (1)
  {
    if (v11)
    {
      unint64_t v13 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      unint64_t v14 = v13 | (v7 << 6);
      goto LABEL_42;
    }
    int64_t v15 = v7 + 1;
    if (__OFADD__(v7, 1))
    {
      __break(1u);
      goto LABEL_49;
    }
    if (v15 >= v12) {
      return;
    }
    unint64_t v16 = *(void *)(v8 + 8 * v15);
    ++v7;
    if (!v16)
    {
      int64_t v7 = v15 + 1;
      if (v15 + 1 >= v12) {
        return;
      }
      unint64_t v16 = *(void *)(v8 + 8 * v7);
      if (!v16)
      {
        int64_t v7 = v15 + 2;
        if (v15 + 2 >= v12) {
          return;
        }
        unint64_t v16 = *(void *)(v8 + 8 * v7);
        if (!v16) {
          break;
        }
      }
    }
LABEL_41:
    unint64_t v11 = (v16 - 1) & v16;
    unint64_t v14 = __clz(__rbit64(v16)) + (v7 << 6);
LABEL_42:
    uint64_t v18 = 8 * v14;
    uint64_t v19 = *(void **)(*(void *)(v3 + 56) + v18);
    id v20 = *(id *)(*(void *)(v3 + 48) + v18);
    id v21 = v19;
    unint64_t v22 = sub_1B7357970((uint64_t)v20);
    char v24 = v23;

    if ((v24 & 1) == 0)
    {

      return;
    }
    sub_1B736EA0C();
    id v25 = *(id *)(*(void *)(v2 + 56) + 8 * v22);
    char v26 = sub_1B7384240();

    if ((v26 & 1) == 0) {
      return;
    }
  }
  int64_t v17 = v15 + 3;
  if (v17 >= v12) {
    return;
  }
  unint64_t v16 = *(void *)(v8 + 8 * v17);
  if (v16)
  {
    int64_t v7 = v17;
    goto LABEL_41;
  }
  while (1)
  {
    int64_t v7 = v17 + 1;
    if (__OFADD__(v17, 1)) {
      break;
    }
    if (v7 >= v12) {
      return;
    }
    unint64_t v16 = *(void *)(v8 + 8 * v7);
    ++v17;
    if (v16) {
      goto LABEL_41;
    }
  }
LABEL_49:
  __break(1u);
LABEL_50:
  MEMORY[0x1F4185268](a1, a2);
}

void sub_1B7378800(uint64_t *a1, uint64_t *a2)
{
}

uint64_t sub_1B7378814(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for WBSKeychainPasskey();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

double sub_1B7378878@<D0>(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v3 = v2;
  swift_bridgeObjectRetain();
  unint64_t v6 = sub_1B73579B4(a1);
  LOBYTE(a1) = v7;
  swift_bridgeObjectRelease();
  if (a1)
  {
    int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v9 = *v3;
    uint64_t v11 = *v3;
    uint64_t *v3 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_1B7358EAC();
      uint64_t v9 = v11;
    }
    sub_1B735B19C(*(void *)(v9 + 48) + 40 * v6);
    sub_1B735B1F0((_OWORD *)(*(void *)(v9 + 56) + 32 * v6), a2);
    sub_1B7378C7C(v6, v9);
    uint64_t *v3 = v9;
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

double sub_1B7378974@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  uint64_t v4 = v3;
  swift_bridgeObjectRetain();
  unint64_t v8 = sub_1B73579F8(a1, a2);
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
      sub_1B7359094();
      uint64_t v11 = v13;
    }
    swift_bridgeObjectRelease();
    sub_1B735B1F0((_OWORD *)(*(void *)(v11 + 56) + 32 * v8), a3);
    sub_1B7378E48(v8, v11);
    *uint64_t v4 = v11;
    swift_bridgeObjectRelease();
  }
  else
  {
    double result = 0.0;
    *a3 = 0u;
    a3[1] = 0u;
  }
  return result;
}

uint64_t sub_1B7378A78(unint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = *v1;
  if ((v4 & 0xC000000000000001) == 0)
  {
LABEL_8:
    swift_bridgeObjectRetain();
    a1 = sub_1B7357970(a1);
    char v13 = v12;
    swift_bridgeObjectRelease();
    if (v13)
    {
      int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v9 = *v2;
      uint64_t v17 = *v2;
      uint64_t *v2 = 0x8000000000000000;
      if (!isUniquelyReferenced_nonNull_native)
      {
        sub_1B735927C();
        uint64_t v9 = v17;
      }
      goto LABEL_11;
    }
    return 0;
  }
  if (v4 < 0) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = v4 & 0xFFFFFFFFFFFFFF8;
  }
  swift_bridgeObjectRetain();
  id v6 = (id)a1;
  uint64_t v7 = sub_1B7384420();

  if (!v7)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  swift_unknownObjectRelease();
  uint64_t v8 = sub_1B73842D0();
  uint64_t v9 = sub_1B7367B34(v5, v8);
  swift_retain();
  a1 = sub_1B7357970((uint64_t)v6);
  char v11 = v10;
  swift_release();
  if ((v11 & 1) == 0)
  {
    __break(1u);
    goto LABEL_8;
  }
LABEL_11:

  uint64_t v15 = *(void *)(*(void *)(v9 + 56) + 8 * a1);
  sub_1B7379020(a1, v9);
  uint64_t *v2 = v9;
  swift_bridgeObjectRelease();
  return v15;
}

uint64_t sub_1B7378BC8(uint64_t a1, void *a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = *v2;
  if ((*v2 & 0xC000000000000001) != 0)
  {
    if (v6 < 0) {
      uint64_t v7 = *v2;
    }
    else {
      uint64_t v7 = v6 & 0xFFFFFFFFFFFFFF8;
    }
    uint64_t result = sub_1B73842D0();
    if (__OFADD__(result, 1))
    {
      __break(1u);
      return result;
    }
    uint64_t *v3 = sub_1B7367B34(v7, result + 1);
  }
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v10 = *v3;
  uint64_t *v3 = 0x8000000000000000;
  sub_1B735869C(a1, a2, isUniquelyReferenced_nonNull_native);
  uint64_t *v3 = v10;
  return swift_bridgeObjectRelease();
}

unint64_t sub_1B7378C7C(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t result = sub_1B73842A0();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        sub_1B735B200(*(void *)(a2 + 48) + 40 * v6, (uint64_t)v28);
        uint64_t v10 = sub_1B7384300();
        uint64_t result = sub_1B735B19C((uint64_t)v28);
        unint64_t v11 = v10 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v11 >= v8 && v3 >= (uint64_t)v11)
          {
LABEL_16:
            uint64_t v14 = *(void *)(a2 + 48);
            unint64_t v15 = v14 + 40 * v3;
            unint64_t v16 = (long long *)(v14 + 40 * v6);
            if (v3 != v6 || v15 >= (unint64_t)v16 + 40)
            {
              long long v17 = *v16;
              long long v18 = v16[1];
              *(void *)(v15 + 32) = *((void *)v16 + 4);
              *(_OWORD *)unint64_t v15 = v17;
              *(_OWORD *)(v15 + 16) = v18;
            }
            uint64_t v19 = *(void *)(a2 + 56);
            id v20 = (_OWORD *)(v19 + 32 * v3);
            id v21 = (_OWORD *)(v19 + 32 * v6);
            if (v3 != v6 || (int64_t v3 = v6, v20 >= v21 + 2))
            {
              long long v9 = v21[1];
              *id v20 = *v21;
              v20[1] = v9;
              int64_t v3 = v6;
            }
          }
        }
        else if (v11 >= v8 || v3 >= (uint64_t)v11)
        {
          goto LABEL_16;
        }
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    unint64_t v22 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v23 = *v22;
    uint64_t v24 = (-1 << v3) - 1;
  }
  else
  {
    unint64_t v22 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v24 = *v22;
    uint64_t v23 = (-1 << result) - 1;
  }
  *unint64_t v22 = v24 & v23;
  uint64_t v25 = *(void *)(a2 + 16);
  BOOL v26 = __OFSUB__(v25, 1);
  uint64_t v27 = v25 - 1;
  if (v26)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v27;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

unint64_t sub_1B7378E48(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t result = sub_1B73842A0();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        sub_1B7384620();
        swift_bridgeObjectRetain();
        sub_1B7384050();
        uint64_t v10 = sub_1B7384630();
        uint64_t result = swift_bridgeObjectRelease();
        unint64_t v11 = v10 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v11 < v8) {
            goto LABEL_5;
          }
        }
        else if (v11 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v11)
        {
LABEL_11:
          uint64_t v12 = *(void *)(a2 + 48);
          char v13 = (_OWORD *)(v12 + 16 * v3);
          uint64_t v14 = (_OWORD *)(v12 + 16 * v6);
          if (v3 != v6 || v13 >= v14 + 1) {
            *char v13 = *v14;
          }
          uint64_t v15 = *(void *)(a2 + 56);
          unint64_t v16 = (_OWORD *)(v15 + 32 * v3);
          long long v17 = (_OWORD *)(v15 + 32 * v6);
          if (v3 != v6 || (int64_t v3 = v6, v16 >= v17 + 2))
          {
            long long v9 = v17[1];
            *unint64_t v16 = *v17;
            v16[1] = v9;
            int64_t v3 = v6;
          }
        }
LABEL_5:
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    long long v18 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v19 = *v18;
    uint64_t v20 = (-1 << v3) - 1;
  }
  else
  {
    long long v18 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v20 = *v18;
    uint64_t v19 = (-1 << result) - 1;
  }
  *long long v18 = v20 & v19;
  uint64_t v21 = *(void *)(a2 + 16);
  BOOL v22 = __OFSUB__(v21, 1);
  uint64_t v23 = v21 - 1;
  if (v22)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v23;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

void sub_1B7379020(unint64_t a1, uint64_t a2)
{
  int64_t v3 = a1;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (a1 + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t v8 = sub_1B73842A0();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v9 = (v8 + 1) & v7;
      do
      {
        id v10 = *(id *)(*(void *)(a2 + 48) + 8 * v6);
        uint64_t v11 = sub_1B7384230();

        unint64_t v12 = v11 & v7;
        if (v3 >= (uint64_t)v9)
        {
          if (v12 >= v9 && v3 >= (uint64_t)v12)
          {
LABEL_16:
            uint64_t v15 = *(void *)(a2 + 48);
            unint64_t v16 = (void *)(v15 + 8 * v3);
            long long v17 = (void *)(v15 + 8 * v6);
            if (v3 != v6 || v16 >= v17 + 1) {
              *unint64_t v16 = *v17;
            }
            uint64_t v18 = *(void *)(a2 + 56);
            uint64_t v19 = (void *)(v18 + 8 * v3);
            uint64_t v20 = (void *)(v18 + 8 * v6);
            if (v3 != v6 || (int64_t v3 = v6, v19 >= v20 + 1))
            {
              *uint64_t v19 = *v20;
              int64_t v3 = v6;
            }
          }
        }
        else if (v12 >= v9 || v3 >= (uint64_t)v12)
        {
          goto LABEL_16;
        }
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    uint64_t v21 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v22 = *v21;
    uint64_t v23 = (-1 << v3) - 1;
  }
  else
  {
    uint64_t v21 = (uint64_t *)(v4 + 8 * (a1 >> 6));
    uint64_t v23 = *v21;
    uint64_t v22 = (-1 << a1) - 1;
  }
  *uint64_t v21 = v23 & v22;
  uint64_t v24 = *(void *)(a2 + 16);
  BOOL v25 = __OFSUB__(v24, 1);
  uint64_t v26 = v24 - 1;
  if (v25)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v26;
    ++*(_DWORD *)(a2 + 36);
  }
}

void sub_1B73791D4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 16);
  if (v3 != sub_1B73842D0()) {
    return;
  }
  int64_t v4 = 0;
  uint64_t v5 = a2 + 64;
  uint64_t v6 = 1 << *(unsigned char *)(a2 + 32);
  uint64_t v7 = -1;
  if (v6 < 64) {
    uint64_t v7 = ~(-1 << v6);
  }
  unint64_t v8 = v7 & *(void *)(a2 + 64);
  int64_t v9 = (unint64_t)(v6 + 63) >> 6;
  while (1)
  {
    if (v8)
    {
      unint64_t v10 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      unint64_t v11 = v10 | (v4 << 6);
      goto LABEL_17;
    }
    if (__OFADD__(v4++, 1)) {
      goto LABEL_24;
    }
    if (v4 >= v9) {
      return;
    }
    unint64_t v13 = *(void *)(v5 + 8 * v4);
    if (!v13) {
      break;
    }
LABEL_16:
    unint64_t v8 = (v13 - 1) & v13;
    unint64_t v11 = __clz(__rbit64(v13)) + (v4 << 6);
LABEL_17:
    uint64_t v15 = 8 * v11;
    unint64_t v16 = *(void **)(*(void *)(a2 + 56) + v15);
    id v17 = *(id *)(*(void *)(a2 + 48) + v15);
    id v18 = v16;
    uint64_t v19 = sub_1B7384420();

    if (!v19)
    {

      return;
    }
    sub_1B736EA0C();
    swift_dynamicCast();
    char v20 = sub_1B7384240();

    if ((v20 & 1) == 0) {
      return;
    }
  }
  int64_t v14 = v4 + 1;
  if (v4 + 1 >= v9) {
    return;
  }
  unint64_t v13 = *(void *)(v5 + 8 * v14);
  if (v13)
  {
    ++v4;
    goto LABEL_16;
  }
  while (1)
  {
    int64_t v4 = v14 + 1;
    if (__OFADD__(v14, 1)) {
      break;
    }
    if (v4 >= v9) {
      return;
    }
    unint64_t v13 = *(void *)(v5 + 8 * v4);
    ++v14;
    if (v13) {
      goto LABEL_16;
    }
  }
  __break(1u);
LABEL_24:
  __break(1u);
}

uint64_t _s10SafariCore18WBSKeychainPasskeyV2eeoiySbAC_ACtFZ_0(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4 = *a1;
  unint64_t v5 = a1[1];
  uint64_t v6 = *a2;
  unint64_t v7 = a2[1];
  if (v5 >> 60 != 15)
  {
    if (v7 >> 60 != 15)
    {
      sub_1B7367E4C(*a1, v5);
      sub_1B7367E4C(v6, v7);
      char v8 = sub_1B736EEA0(v4, v5, v6, v7);
      sub_1B735F96C(v6, v7);
      sub_1B735F96C(v4, v5);
      if (v8) {
        goto LABEL_7;
      }
      return 0;
    }
LABEL_5:
    sub_1B7367E4C(*a1, v5);
    sub_1B7367E4C(v6, v7);
    sub_1B735F96C(v4, v5);
    sub_1B735F96C(v6, v7);
    return 0;
  }
  if (v7 >> 60 != 15) {
    goto LABEL_5;
  }
LABEL_7:
  uint64_t v9 = a1[2];
  uint64_t v10 = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1B7378594(v9, v10);
  char v12 = v11;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v12 & 1) == 0) {
    return 0;
  }
  if (a1[3] == a2[3] && a1[4] == a2[4] || (v13 = sub_1B7384590(), uint64_t result = 0, (v13 & 1) != 0))
  {
    if ((sub_1B736EEA0(a1[5], a1[6], a2[5], a2[6]) & 1) == 0) {
      return 0;
    }
    uint64_t v15 = type metadata accessor for WBSKeychainPasskey();
    if ((sub_1B7383D20() & 1) == 0
      || (sub_1B7383D20() & 1) == 0
      || *((unsigned __int8 *)a1 + *(int *)(v15 + 40)) != *((unsigned __int8 *)a2 + *(int *)(v15 + 40)))
    {
      return 0;
    }
    uint64_t v16 = *(int *)(v15 + 44);
    uint64_t v17 = *(uint64_t *)((char *)a1 + v16);
    uint64_t v18 = *(uint64_t *)((char *)a1 + v16 + 8);
    uint64_t v19 = (uint64_t *)((char *)a2 + v16);
    if (v17 == *v19 && v18 == v19[1])
    {
      return 1;
    }
    else
    {
      return sub_1B7384590();
    }
  }
  return result;
}

unint64_t sub_1B737959C()
{
  unint64_t result = qword_1E9E59620;
  if (!qword_1E9E59620)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9E59620);
  }
  return result;
}

unint64_t sub_1B73795F4()
{
  unint64_t result = qword_1E9E59628;
  if (!qword_1E9E59628)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9E59628);
  }
  return result;
}

unint64_t sub_1B737964C()
{
  unint64_t result = qword_1E9E59630;
  if (!qword_1E9E59630)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9E59630);
  }
  return result;
}

unint64_t sub_1B73796A4()
{
  unint64_t result = qword_1E9E59638;
  if (!qword_1E9E59638)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9E59638);
  }
  return result;
}

void sub_1B73796FC(char *a1)
{
}

uint64_t sub_1B7379724()
{
  return 0;
}

void *sub_1B7379734@<X0>(void *a1@<X8>)
{
  unint64_t result = WBSKeychainPasskey.Metadata.subscript.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

void sub_1B737977C(uint64_t *a1)
{
  uint64_t v1 = *a1;
  unint64_t v2 = a1[1];
  sub_1B7367E4C(*a1, v2);
  WBSKeychainPasskey.Metadata.subscript.setter(v1, v2);
}

uint64_t sub_1B73797D4()
{
  return 0;
}

void *sub_1B73797E4@<X0>(void *a1@<X8>)
{
  unint64_t result = WBSKeychainPasskey.Metadata.subscript.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

void sub_1B737982C(uint64_t *a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = a1[1];
  swift_bridgeObjectRetain();
  WBSKeychainPasskey.Metadata.subscript.setter(v1, v2);
}

uint64_t sub_1B7379880()
{
  return 0;
}

uint64_t *initializeBufferWithCopyOfBuffer for WBSKeychainPasskey(uint64_t *a1, uint64_t *a2, int *a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v8 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (uint64_t *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    unint64_t v7 = a2[1];
    if (v7 >> 60 == 15)
    {
      *(_OWORD *)a1 = *(_OWORD *)a2;
    }
    else
    {
      uint64_t v9 = *a2;
      sub_1B735F794(*a2, a2[1]);
      *uint64_t v4 = v9;
      v4[1] = v7;
    }
    uint64_t v10 = a2[3];
    v4[2] = a2[2];
    v4[3] = v10;
    uint64_t v11 = a2[5];
    void v4[4] = a2[4];
    unint64_t v12 = a2[6];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_1B735F794(v11, v12);
    v4[5] = v11;
    v4[6] = v12;
    uint64_t v13 = a3[8];
    int64_t v14 = (char *)v4 + v13;
    uint64_t v15 = (char *)a2 + v13;
    uint64_t v16 = sub_1B7383D30();
    uint64_t v17 = *(void (**)(char *, char *, uint64_t))(*(void *)(v16 - 8) + 16);
    v17(v14, v15, v16);
    v17((char *)v4 + a3[9], (char *)a2 + a3[9], v16);
    uint64_t v18 = a3[11];
    *((unsigned char *)v4 + a3[10]) = *((unsigned char *)a2 + a3[10]);
    uint64_t v19 = (uint64_t *)((char *)v4 + v18);
    char v20 = (uint64_t *)((char *)a2 + v18);
    uint64_t v21 = v20[1];
    *uint64_t v19 = *v20;
    v19[1] = v21;
    swift_bridgeObjectRetain();
  }
  return v4;
}

uint64_t destroy for WBSKeychainPasskey(uint64_t *a1, uint64_t a2)
{
  unint64_t v4 = a1[1];
  if (v4 >> 60 != 15) {
    sub_1B735B0E8(*a1, v4);
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1B735B0E8(a1[5], a1[6]);
  int v5 = (char *)a1 + *(int *)(a2 + 32);
  uint64_t v6 = sub_1B7383D30();
  unint64_t v7 = *(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8);
  v7(v5, v6);
  v7((char *)a1 + *(int *)(a2 + 36), v6);
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for WBSKeychainPasskey(uint64_t a1, uint64_t *a2, int *a3)
{
  unint64_t v6 = a2[1];
  if (v6 >> 60 == 15)
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
  }
  else
  {
    uint64_t v7 = *a2;
    sub_1B735F794(*a2, a2[1]);
    *(void *)a1 = v7;
    *(void *)(a1 + 8) = v6;
  }
  uint64_t v8 = a2[3];
  *(void *)(a1 + 16) = a2[2];
  *(void *)(a1 + 24) = v8;
  uint64_t v9 = a2[5];
  *(void *)(a1 + 32) = a2[4];
  unint64_t v10 = a2[6];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1B735F794(v9, v10);
  *(void *)(a1 + 40) = v9;
  *(void *)(a1 + 48) = v10;
  uint64_t v11 = a3[8];
  uint64_t v12 = a1 + v11;
  uint64_t v13 = (char *)a2 + v11;
  uint64_t v14 = sub_1B7383D30();
  uint64_t v15 = *(void (**)(uint64_t, char *, uint64_t))(*(void *)(v14 - 8) + 16);
  v15(v12, v13, v14);
  v15(a1 + a3[9], (char *)a2 + a3[9], v14);
  uint64_t v16 = a3[11];
  *(unsigned char *)(a1 + a3[10]) = *((unsigned char *)a2 + a3[10]);
  uint64_t v17 = (void *)(a1 + v16);
  uint64_t v18 = (uint64_t *)((char *)a2 + v16);
  uint64_t v19 = v18[1];
  *uint64_t v17 = *v18;
  v17[1] = v19;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t *assignWithCopy for WBSKeychainPasskey(uint64_t *a1, uint64_t *a2, int *a3)
{
  unint64_t v6 = a2[1];
  if ((unint64_t)a1[1] >> 60 != 15)
  {
    if (v6 >> 60 != 15)
    {
      uint64_t v8 = *a2;
      sub_1B735F794(*a2, a2[1]);
      uint64_t v9 = *a1;
      unint64_t v10 = a1[1];
      *a1 = v8;
      a1[1] = v6;
      sub_1B735B0E8(v9, v10);
      goto LABEL_8;
    }
    sub_1B7379DC0((uint64_t)a1);
    goto LABEL_6;
  }
  if (v6 >> 60 == 15)
  {
LABEL_6:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    goto LABEL_8;
  }
  uint64_t v7 = *a2;
  sub_1B735F794(*a2, a2[1]);
  *a1 = v7;
  a1[1] = v6;
LABEL_8:
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[3] = a2[3];
  a1[4] = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v11 = a2[5];
  unint64_t v12 = a2[6];
  sub_1B735F794(v11, v12);
  uint64_t v13 = a1[5];
  unint64_t v14 = a1[6];
  a1[5] = v11;
  a1[6] = v12;
  sub_1B735B0E8(v13, v14);
  uint64_t v15 = a3[8];
  uint64_t v16 = (char *)a1 + v15;
  uint64_t v17 = (char *)a2 + v15;
  uint64_t v18 = sub_1B7383D30();
  uint64_t v19 = *(void (**)(char *, char *, uint64_t))(*(void *)(v18 - 8) + 24);
  v19(v16, v17, v18);
  v19((char *)a1 + a3[9], (char *)a2 + a3[9], v18);
  *((unsigned char *)a1 + a3[10]) = *((unsigned char *)a2 + a3[10]);
  uint64_t v20 = a3[11];
  uint64_t v21 = (uint64_t *)((char *)a1 + v20);
  uint64_t v22 = (uint64_t *)((char *)a2 + v20);
  *uint64_t v21 = *v22;
  v21[1] = v22[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_1B7379DC0(uint64_t a1)
{
  return a1;
}

uint64_t initializeWithTake for WBSKeychainPasskey(uint64_t a1, uint64_t a2, int *a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  uint64_t v6 = a3[8];
  uint64_t v7 = a1 + v6;
  uint64_t v8 = a2 + v6;
  uint64_t v9 = sub_1B7383D30();
  unint64_t v10 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 32);
  v10(v7, v8, v9);
  v10(a1 + a3[9], a2 + a3[9], v9);
  uint64_t v11 = a3[11];
  *(unsigned char *)(a1 + a3[10]) = *(unsigned char *)(a2 + a3[10]);
  *(_OWORD *)(a1 + v11) = *(_OWORD *)(a2 + v11);
  return a1;
}

uint64_t *assignWithTake for WBSKeychainPasskey(uint64_t *a1, uint64_t a2, int *a3)
{
  unint64_t v6 = a1[1];
  if (v6 >> 60 != 15)
  {
    unint64_t v7 = *(void *)(a2 + 8);
    if (v7 >> 60 != 15)
    {
      uint64_t v8 = *a1;
      *a1 = *(void *)a2;
      a1[1] = v7;
      sub_1B735B0E8(v8, v6);
      goto LABEL_6;
    }
    sub_1B7379DC0((uint64_t)a1);
  }
  *(_OWORD *)a1 = *(_OWORD *)a2;
LABEL_6:
  a1[2] = *(void *)(a2 + 16);
  swift_bridgeObjectRelease();
  uint64_t v9 = *(void *)(a2 + 32);
  a1[3] = *(void *)(a2 + 24);
  a1[4] = v9;
  swift_bridgeObjectRelease();
  uint64_t v10 = a1[5];
  unint64_t v11 = a1[6];
  *(_OWORD *)(a1 + 5) = *(_OWORD *)(a2 + 40);
  sub_1B735B0E8(v10, v11);
  uint64_t v12 = a3[8];
  uint64_t v13 = (char *)a1 + v12;
  uint64_t v14 = a2 + v12;
  uint64_t v15 = sub_1B7383D30();
  uint64_t v16 = *(void (**)(char *, uint64_t, uint64_t))(*(void *)(v15 - 8) + 40);
  v16(v13, v14, v15);
  v16((char *)a1 + a3[9], a2 + a3[9], v15);
  uint64_t v17 = a3[11];
  *((unsigned char *)a1 + a3[10]) = *(unsigned char *)(a2 + a3[10]);
  uint64_t v18 = (uint64_t *)((char *)a1 + v17);
  uint64_t v19 = (uint64_t *)(a2 + v17);
  uint64_t v21 = *v19;
  uint64_t v20 = v19[1];
  *uint64_t v18 = v21;
  v18[1] = v20;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for WBSKeychainPasskey(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1B737A04C);
}

uint64_t sub_1B737A04C(uint64_t a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = sub_1B7383D30();
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 32);
    return v9(v11, a2, v10);
  }
}

uint64_t storeEnumTagSinglePayload for WBSKeychainPasskey(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1B737A110);
}

uint64_t sub_1B737A110(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 16) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_1B7383D30();
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 32);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

ValueMetadata *type metadata accessor for WBSKeychainPasskey.Metadata()
{
  return &type metadata for WBSKeychainPasskey.Metadata;
}

uint64_t getEnumTagSinglePayload for WBSKeychainPasskey.Metadata.BoolKeys(unsigned int *a1, int a2)
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

unsigned char *storeEnumTagSinglePayload for WBSKeychainPasskey.Metadata.BoolKeys(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x1B737A2B8);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_1B737A2E0()
{
  return 0;
}

ValueMetadata *type metadata accessor for WBSKeychainPasskey.Metadata.BoolKeys()
{
  return &type metadata for WBSKeychainPasskey.Metadata.BoolKeys;
}

unsigned char *storeEnumTagSinglePayload for WBSKeychainPasskey.Metadata.DataKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1B737A3C4);
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

ValueMetadata *type metadata accessor for WBSKeychainPasskey.Metadata.DataKeys()
{
  return &type metadata for WBSKeychainPasskey.Metadata.DataKeys;
}

ValueMetadata *type metadata accessor for WBSKeychainPasskey.Metadata.DateKeys()
{
  return &type metadata for WBSKeychainPasskey.Metadata.DateKeys;
}

unsigned char *_s10SafariCore18WBSKeychainPasskeyV8MetadataV8DateKeysOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1B737A4E0);
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

ValueMetadata *type metadata accessor for WBSKeychainPasskey.Metadata.StringKeys()
{
  return &type metadata for WBSKeychainPasskey.Metadata.StringKeys;
}

uint64_t sub_1B737A518(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

WBSSpotlightDonationEntityCorrelator __swiftcall WBSSpotlightDonationEntityCorrelator.init()()
{
  id v0 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  return (WBSSpotlightDonationEntityCorrelator)objc_msgSend(v0, sel_init);
}

id WBSSpotlightDonationEntityCorrelator.init()()
{
  v1.super_class = (Class)WBSSpotlightDonationEntityCorrelator;
  return objc_msgSendSuper2(&v1, sel_init);
}

unint64_t type metadata accessor for WBSSpotlightDonationEntityCorrelator()
{
  unint64_t result = qword_1E9E59668;
  if (!qword_1E9E59668)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1E9E59668);
  }
  return result;
}

unint64_t sub_1B737A758(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    int v3 = (void *)MEMORY[0x1E4FBC868];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9E59180);
  uint64_t v2 = sub_1B73844B0();
  int v3 = (void *)v2;
  uint64_t v4 = *(void *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  uint64_t v5 = v2 + 64;
  uint64_t v6 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_1B737ACAC(v6, (uint64_t)&v15);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_1B73579F8(v15, v16);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v3[6] + 16 * result);
    *uint64_t v11 = v7;
    v11[1] = v8;
    unint64_t result = (unint64_t)sub_1B735B1F0(&v17, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v12 = v3[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v3[2] = v14;
    v6 += 48;
    if (!--v4)
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

void sub_1B737A884(void *a1)
{
  id v2 = objc_msgSend(a1, sel_attributeSet);
  id v3 = objc_msgSend(v2, sel_title);

  if (v3)
  {
    sub_1B7383FC0();

    id v4 = objc_msgSend(a1, sel_attributeSet);
    id v5 = objc_msgSend(a1, sel_uniqueIdentifier);
    sub_1B7383FC0();

    sub_1B737A758(MEMORY[0x1E4FBC860]);
    sub_1B7384210();
    swift_bridgeObjectRelease();

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
}

void sub_1B737A9F8(void *a1)
{
  id v2 = objc_msgSend(a1, sel_attributeSet);
  id v3 = objc_msgSend(v2, sel_title);

  if (v3)
  {
    sub_1B7383FC0();

    id v4 = objc_msgSend(a1, sel_attributeSet);
    sub_1B737A758(MEMORY[0x1E4FBC860]);
    sub_1B7384210();
    swift_bridgeObjectRelease();

    swift_bridgeObjectRelease();
  }
}

void sub_1B737AB40(void *a1)
{
  id v2 = objc_msgSend(a1, sel_attributeSet);
  id v3 = objc_msgSend(v2, sel_title);

  if (v3)
  {
    sub_1B7383FC0();

    id v4 = objc_msgSend(a1, sel_attributeSet);
    id v5 = objc_msgSend(a1, sel_uniqueIdentifier);
    sub_1B7383FC0();

    sub_1B737A758(MEMORY[0x1E4FBC860]);
    sub_1B7384210();
    swift_bridgeObjectRelease();

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
}

uint64_t sub_1B737ACAC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9E59660);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t UUID.data.getter()
{
  sub_1B7383D40();
  uint64_t v0 = sub_1B7384000();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x1F4188790](v0);
  id v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B7383FF0();
  uint64_t v4 = sub_1B7383FD0();
  unint64_t v6 = v5;
  swift_bridgeObjectRelease();
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  if (v6 >> 60 != 15) {
    return v4;
  }
  __break(1u);
  return result;
}

void WBSAXShouldShowAnimatedImageControls_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Boolean soft_AXSReduceMotionAutoplayAnimatedImagesEnabled(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"WBSAccessibilityUtilities.m", 12, @"%s", dlerror());

  __break(1u);
}

void WBSReportThreadLocationAndSleep_cold_1(void *a1)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = a1;
  v2[0] = 67109120;
  v2[1] = getpid();
  _os_log_error_impl(&dword_1B728F000, v1, OS_LOG_TYPE_ERROR, "Sleeping thread for debugger; attach to process (PID: %d) to unsleep the thread.",
    (uint8_t *)v2,
    8u);
}

void WBSWriteExactAmountOfBytesToFileDescriptor_cold_1(void *a1, int a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = a1;
  int v4 = *__error();
  v5[0] = 67109376;
  v5[1] = a2;
  __int16 v6 = 1024;
  int v7 = v4;
  _os_log_error_impl(&dword_1B728F000, v3, OS_LOG_TYPE_ERROR, "Failed to write bytes to file descriptor %d: %{errno}i", (uint8_t *)v5, 0xEu);
}

void WBSHTTPProtocolFromSecAttrProtocolValue_cold_1(void *a1)
{
  id v2 = a1;
  [(id)OUTLINED_FUNCTION_2() unsignedIntValue];
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_19();
  _os_log_debug_impl(v3, v4, v5, v6, v7, 8u);
}

void WBSHTTPProtocolFromSecAttrProtocolValue_cold_2()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_0_4(&dword_1B728F000, v0, v1, "Not converting SecItem protocol string '%@' to NSURLProtectionSpace equivalent: Only HTTP and HTTPS are supported.", v2, v3, v4, v5, v6);
}

void createLexiconWithLocale(uint64_t a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543618;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2114;
  *(void *)(buf + 14) = a2;
  _os_log_error_impl(&dword_1B728F000, log, OS_LOG_TYPE_ERROR, "Failed to create %{public}@ LXLexiconRef: %{public}@", buf, 0x16u);
}

void ___ZL23regexForClassicPasswordv_block_invoke_cold_1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543362;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_1B728F000, log, OS_LOG_TYPE_ERROR, "Error creating password matching regex: %{public}@", buf, 0xCu);
}

void getAAAccountClassPrimary_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"NSString *getAAAccountClassPrimary(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"WBSPrimaryAppleAccountObserver.m", 11, @"%s", dlerror());

  __break(1u);
}

void __getACMonitoredAccountStoreClass_block_invoke_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getACMonitoredAccountStoreClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"WBSPrimaryAppleAccountObserver.m", 14, @"Unable to find class %s", "ACMonitoredAccountStore");

  __break(1u);
}

void AccountsLibrary_cold_1(void *a1)
{
  uint64_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"void *AccountsLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"WBSPrimaryAppleAccountObserver.m", 13, @"%s", *a1);

  __break(1u);
}

void __getAAAccountClassPrimarySymbolLoc_block_invoke_cold_1(void *a1)
{
  uint64_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"void *AppleAccountLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"WBSPrimaryAppleAccountObserver.m", 10, @"%s", *a1);

  __break(1u);
}

void WBSSetUpAccessToAppDataContainerWithIdentifier_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1B728F000, a2, OS_LOG_TYPE_ERROR, "Refusing to grant a sandbox extension to the same identifier twice (id: %@)", (uint8_t *)&v2, 0xCu);
}

void WBSSetUpAccessToAppDataContainerWithIdentifier_cold_2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 136315138;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1B728F000, a2, OS_LOG_TYPE_ERROR, "Error executing container query: %s", (uint8_t *)&v2, 0xCu);
}

void __getDSArchiveServiceClass_block_invoke_cold_1(void *a1)
{
  int v2 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"void *DesktopServicesPrivLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"WBSBrowsingDataImportService.m", 28, @"%s", *a1);

  __break(1u);
}

void __getDSArchiveServiceClass_block_invoke_cold_2()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getDSArchiveServiceClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"WBSBrowsingDataImportService.m", 29, @"Unable to find class %s", "DSArchiveService");

  __break(1u);
}

void ___ZN12SafariShared25SuddenTerminationDisabler28disableSuddenTerminationTaskEv_block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1B728F000, log, OS_LOG_TYPE_ERROR, "Could not begin background task", v1, 2u);
}

void ___ZN12SafariShared25SuddenTerminationDisabler28disableSuddenTerminationTaskEv_block_invoke_cold_2(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1B728F000, log, OS_LOG_TYPE_ERROR, "Could not begin new background task to replace existing background task", v1, 2u);
}

uint64_t sub_1B7383B80()
{
  return MEMORY[0x1F40E3030]();
}

uint64_t sub_1B7383B90()
{
  return MEMORY[0x1F40E3068]();
}

uint64_t sub_1B7383BA0()
{
  return MEMORY[0x1F40E3078]();
}

uint64_t sub_1B7383BB0()
{
  return MEMORY[0x1F40E32B8]();
}

uint64_t sub_1B7383BC0()
{
  return MEMORY[0x1F40E33E0]();
}

uint64_t sub_1B7383BD0()
{
  return MEMORY[0x1F40E3428]();
}

uint64_t sub_1B7383BE0()
{
  return MEMORY[0x1F40E37D8]();
}

uint64_t sub_1B7383BF0()
{
  return MEMORY[0x1F40E37E8]();
}

uint64_t sub_1B7383C00()
{
  return MEMORY[0x1F40E3808]();
}

uint64_t sub_1B7383C10()
{
  return MEMORY[0x1F40E3810]();
}

uint64_t sub_1B7383C20()
{
  return MEMORY[0x1F40E3828]();
}

uint64_t sub_1B7383C30()
{
  return MEMORY[0x1F40E4538]();
}

uint64_t sub_1B7383C40()
{
  return MEMORY[0x1F40E4548]();
}

uint64_t sub_1B7383C50()
{
  return MEMORY[0x1F40E4998]();
}

uint64_t sub_1B7383C60()
{
  return MEMORY[0x1F40E4A78]();
}

uint64_t sub_1B7383C70()
{
  return MEMORY[0x1F40E4B88]();
}

uint64_t sub_1B7383C80()
{
  return MEMORY[0x1F40E4BE8]();
}

uint64_t sub_1B7383C90()
{
  return MEMORY[0x1F410D138]();
}

uint64_t sub_1B7383CA0()
{
  return MEMORY[0x1F40E4C70]();
}

uint64_t sub_1B7383CB0()
{
  return MEMORY[0x1F40E4C88]();
}

uint64_t sub_1B7383CC0()
{
  return MEMORY[0x1F40E4CB0]();
}

uint64_t sub_1B7383CD0()
{
  return MEMORY[0x1F40E4D50]();
}

uint64_t sub_1B7383CE0()
{
  return MEMORY[0x1F40E4D60]();
}

uint64_t sub_1B7383CF0()
{
  return MEMORY[0x1F40E4D98]();
}

uint64_t sub_1B7383D00()
{
  return MEMORY[0x1F40E4DA0]();
}

uint64_t sub_1B7383D10()
{
  return MEMORY[0x1F40E5190]();
}

uint64_t sub_1B7383D20()
{
  return MEMORY[0x1F40E52C8]();
}

uint64_t sub_1B7383D30()
{
  return MEMORY[0x1F40E5380]();
}

uint64_t sub_1B7383D40()
{
  return MEMORY[0x1F40E53A8]();
}

uint64_t sub_1B7383D50()
{
  return MEMORY[0x1F410D150]();
}

uint64_t sub_1B7383D60()
{
  return MEMORY[0x1F410D178]();
}

uint64_t sub_1B7383D70()
{
  return MEMORY[0x1F410D188]();
}

uint64_t sub_1B7383D80()
{
  return MEMORY[0x1F410D1B8]();
}

uint64_t sub_1B7383D90()
{
  return MEMORY[0x1F410D1D0]();
}

uint64_t sub_1B7383DA0()
{
  return MEMORY[0x1F410D1E0]();
}

uint64_t sub_1B7383DB0()
{
  return MEMORY[0x1F410D1E8]();
}

uint64_t sub_1B7383DC0()
{
  return MEMORY[0x1F410D1F8]();
}

uint64_t sub_1B7383DD0()
{
  return MEMORY[0x1F410D208]();
}

uint64_t sub_1B7383DE0()
{
  return MEMORY[0x1F4186950]();
}

uint64_t sub_1B7383DF0()
{
  return MEMORY[0x1F4186960]();
}

uint64_t sub_1B7383E00()
{
  return MEMORY[0x1F4186970]();
}

uint64_t sub_1B7383E10()
{
  return MEMORY[0x1F4188678]();
}

uint64_t sub_1B7383E20()
{
  return MEMORY[0x1F4188688]();
}

uint64_t sub_1B7383E30()
{
  return MEMORY[0x1F4188698]();
}

uint64_t sub_1B7383E40()
{
  return MEMORY[0x1F41886A8]();
}

uint64_t sub_1B7383E50()
{
  return MEMORY[0x1F4186CB8]();
}

uint64_t sub_1B7383E60()
{
  return MEMORY[0x1F4186D00]();
}

uint64_t sub_1B7383E70()
{
  return MEMORY[0x1F4186D68]();
}

uint64_t sub_1B7383E80()
{
  return MEMORY[0x1F40DFF38]();
}

uint64_t sub_1B7383E90()
{
  return MEMORY[0x1F40DFF40]();
}

uint64_t sub_1B7383EA0()
{
  return MEMORY[0x1F40DFF58]();
}

uint64_t sub_1B7383EB0()
{
  return MEMORY[0x1F40E0200]();
}

uint64_t sub_1B7383EC0()
{
  return MEMORY[0x1F40E0208]();
}

uint64_t sub_1B7383ED0()
{
  return MEMORY[0x1F40E0210]();
}

uint64_t sub_1B7383EE0()
{
  return MEMORY[0x1F40E0218]();
}

uint64_t sub_1B7383EF0()
{
  return MEMORY[0x1F40E0220]();
}

uint64_t sub_1B7383F00()
{
  return MEMORY[0x1F40E0228]();
}

uint64_t sub_1B7383F10()
{
  return MEMORY[0x1F40E0240]();
}

uint64_t sub_1B7383F20()
{
  return MEMORY[0x1F40E0290]();
}

uint64_t sub_1B7383F30()
{
  return MEMORY[0x1F40E02A0]();
}

uint64_t sub_1B7383F40()
{
  return MEMORY[0x1F40E0530]();
}

uint64_t sub_1B7383F50()
{
  return MEMORY[0x1F40E0538]();
}

uint64_t sub_1B7383F60()
{
  return MEMORY[0x1F40E0548]();
}

uint64_t sub_1B7383F70()
{
  return MEMORY[0x1F40E5FF8]();
}

uint64_t sub_1B7383F80()
{
  return MEMORY[0x1F40E6028]();
}

uint64_t sub_1B7383F90()
{
  return MEMORY[0x1F4183730]();
}

uint64_t sub_1B7383FA0()
{
  return MEMORY[0x1F40E6198]();
}

uint64_t sub_1B7383FB0()
{
  return MEMORY[0x1F40E61A8]();
}

uint64_t sub_1B7383FC0()
{
  return MEMORY[0x1F40E61D0]();
}

uint64_t sub_1B7383FD0()
{
  return MEMORY[0x1F40E61E0]();
}

uint64_t sub_1B7383FE0()
{
  return MEMORY[0x1F40E6230]();
}

uint64_t sub_1B7383FF0()
{
  return MEMORY[0x1F40E6270]();
}

uint64_t sub_1B7384000()
{
  return MEMORY[0x1F40E62A8]();
}

uint64_t sub_1B7384010()
{
  return MEMORY[0x1F4183880]();
}

uint64_t sub_1B7384020()
{
  return MEMORY[0x1F4183920]();
}

uint64_t sub_1B7384030()
{
  return MEMORY[0x1F4183928]();
}

uint64_t sub_1B7384040()
{
  return MEMORY[0x1F4183958]();
}

uint64_t sub_1B7384050()
{
  return MEMORY[0x1F41839B0]();
}

uint64_t sub_1B7384060()
{
  return MEMORY[0x1F41839F0]();
}

uint64_t sub_1B7384070()
{
  return MEMORY[0x1F4183A38]();
}

uint64_t sub_1B7384080()
{
  return MEMORY[0x1F4183A78]();
}

uint64_t sub_1B7384090()
{
  return MEMORY[0x1F4183A80]();
}

uint64_t sub_1B73840A0()
{
  return MEMORY[0x1F4183A88]();
}

uint64_t sub_1B73840B0()
{
  return MEMORY[0x1F4183AA0]();
}

uint64_t sub_1B73840D0()
{
  return MEMORY[0x1F4183AB0]();
}

uint64_t sub_1B73840E0()
{
  return MEMORY[0x1F4183B10]();
}

uint64_t sub_1B73840F0()
{
  return MEMORY[0x1F4183B48]();
}

uint64_t sub_1B7384100()
{
  return MEMORY[0x1F4183B88]();
}

uint64_t sub_1B7384110()
{
  return MEMORY[0x1F4183B90]();
}

uint64_t sub_1B7384120()
{
  return MEMORY[0x1F4183BA0]();
}

uint64_t sub_1B7384130()
{
  return MEMORY[0x1F40E6340]();
}

uint64_t sub_1B7384140()
{
  return MEMORY[0x1F40E6368]();
}

uint64_t sub_1B7384150()
{
  return MEMORY[0x1F4183F08]();
}

uint64_t sub_1B7384160()
{
  return MEMORY[0x1F4187BF0]();
}

uint64_t sub_1B7384170()
{
  return MEMORY[0x1F4187CF8]();
}

uint64_t sub_1B7384180()
{
  return MEMORY[0x1F4187D00]();
}

uint64_t sub_1B7384190()
{
  return MEMORY[0x1F40E6438]();
}

uint64_t sub_1B73841A0()
{
  return MEMORY[0x1F40E6540]();
}

uint64_t sub_1B73841B0()
{
  return MEMORY[0x1F41886B8]();
}

uint64_t sub_1B73841C0()
{
  return MEMORY[0x1F41886D8]();
}

uint64_t sub_1B73841D0()
{
  return MEMORY[0x1F41886F0]();
}

uint64_t sub_1B73841E0()
{
  return MEMORY[0x1F41886F8]();
}

uint64_t sub_1B73841F0()
{
  return MEMORY[0x1F41870B0]();
}

uint64_t sub_1B7384200()
{
  return MEMORY[0x1F41870E8]();
}

uint64_t sub_1B7384210()
{
  return MEMORY[0x1F40D4AA0]();
}

uint64_t sub_1B7384220()
{
  return MEMORY[0x1F41872E8]();
}

uint64_t sub_1B7384230()
{
  return MEMORY[0x1F41874B0]();
}

uint64_t sub_1B7384240()
{
  return MEMORY[0x1F41874B8]();
}

uint64_t sub_1B7384250()
{
  return MEMORY[0x1F41847C0]();
}

uint64_t sub_1B7384260()
{
  return MEMORY[0x1F4184820]();
}

uint64_t sub_1B7384270()
{
  return MEMORY[0x1F40E6C88]();
}

uint64_t sub_1B7384280()
{
  return MEMORY[0x1F4184978]();
}

uint64_t sub_1B7384290()
{
  return MEMORY[0x1F4184B18]();
}

uint64_t sub_1B73842A0()
{
  return MEMORY[0x1F4184B20]();
}

uint64_t sub_1B73842B0()
{
  return MEMORY[0x1F4184B30]();
}

uint64_t sub_1B73842C0()
{
  return MEMORY[0x1F4184B60]();
}

uint64_t sub_1B73842D0()
{
  return MEMORY[0x1F4184B90]();
}

uint64_t sub_1B73842E0()
{
  return MEMORY[0x1F4184BA8]();
}

uint64_t sub_1B73842F0()
{
  return MEMORY[0x1F4184BC0]();
}

uint64_t sub_1B7384300()
{
  return MEMORY[0x1F4184C18]();
}

uint64_t sub_1B7384310()
{
  return MEMORY[0x1F4184C20]();
}

uint64_t sub_1B7384320()
{
  return MEMORY[0x1F4184C38]();
}

uint64_t sub_1B7384330()
{
  return MEMORY[0x1F4184C90]();
}

uint64_t sub_1B7384340()
{
  return MEMORY[0x1F4184C98]();
}

uint64_t sub_1B7384350()
{
  return MEMORY[0x1F4184CA0]();
}

uint64_t sub_1B7384370()
{
  return MEMORY[0x1F4184CE0]();
}

uint64_t sub_1B7384380()
{
  return MEMORY[0x1F4184CE8]();
}

uint64_t sub_1B7384390()
{
  return MEMORY[0x1F4184CF0]();
}

uint64_t sub_1B73843A0()
{
  return MEMORY[0x1F4184D80]();
}

uint64_t sub_1B73843B0()
{
  return MEMORY[0x1F4184DC0]();
}

uint64_t sub_1B73843C0()
{
  return MEMORY[0x1F4184DF0]();
}

uint64_t sub_1B73843D0()
{
  return MEMORY[0x1F4184E68]();
}

uint64_t sub_1B73843E0()
{
  return MEMORY[0x1F4184E70]();
}

uint64_t sub_1B73843F0()
{
  return MEMORY[0x1F4185050]();
}

uint64_t sub_1B7384400()
{
  return MEMORY[0x1F41851F8]();
}

uint64_t sub_1B7384410()
{
  return MEMORY[0x1F4185238]();
}

uint64_t sub_1B7384420()
{
  return MEMORY[0x1F4185260]();
}

uint64_t sub_1B7384440()
{
  return MEMORY[0x1F4185270]();
}

uint64_t sub_1B7384450()
{
  return MEMORY[0x1F4185298]();
}

uint64_t sub_1B7384460()
{
  return MEMORY[0x1F41852A0]();
}

uint64_t sub_1B7384470()
{
  return MEMORY[0x1F4185350]();
}

uint64_t sub_1B7384480()
{
  return MEMORY[0x1F4185368]();
}

uint64_t sub_1B7384490()
{
  return MEMORY[0x1F4185370]();
}

uint64_t sub_1B73844A0()
{
  return MEMORY[0x1F4185378]();
}

uint64_t sub_1B73844B0()
{
  return MEMORY[0x1F4185380]();
}

uint64_t sub_1B73844C0()
{
  return MEMORY[0x1F4185398]();
}

uint64_t sub_1B73844D0()
{
  return MEMORY[0x1F41854C8]();
}

uint64_t sub_1B73844E0()
{
  return MEMORY[0x1F41854F8]();
}

uint64_t sub_1B73844F0()
{
  return MEMORY[0x1F4185568]();
}

uint64_t sub_1B7384500()
{
  return MEMORY[0x1F4185588]();
}

uint64_t sub_1B7384510()
{
  return MEMORY[0x1F4185598]();
}

uint64_t sub_1B7384520()
{
  return MEMORY[0x1F4185628]();
}

uint64_t sub_1B7384530()
{
  return MEMORY[0x1F4185690]();
}

uint64_t sub_1B7384540()
{
  return MEMORY[0x1F41856B0]();
}

uint64_t sub_1B7384550()
{
  return MEMORY[0x1F41856C0]();
}

uint64_t sub_1B7384560()
{
  return MEMORY[0x1F4185758]();
}

uint64_t sub_1B7384570()
{
  return MEMORY[0x1F41859A8]();
}

uint64_t sub_1B7384580()
{
  return MEMORY[0x1F4185A30]();
}

uint64_t sub_1B7384590()
{
  return MEMORY[0x1F4185A40]();
}

uint64_t sub_1B73845A0()
{
  return MEMORY[0x1F4185B98]();
}

uint64_t sub_1B73845B0()
{
  return MEMORY[0x1F4185DD8]();
}

uint64_t sub_1B73845C0()
{
  return MEMORY[0x1F4185DE0]();
}

uint64_t sub_1B73845D0()
{
  return MEMORY[0x1F4185E00]();
}

uint64_t sub_1B73845E0()
{
  return MEMORY[0x1F4185E08]();
}

uint64_t sub_1B73845F0()
{
  return MEMORY[0x1F4185E10]();
}

uint64_t sub_1B7384600()
{
  return MEMORY[0x1F4185E18]();
}

uint64_t sub_1B7384610()
{
  return MEMORY[0x1F4185EA0]();
}

uint64_t sub_1B7384620()
{
  return MEMORY[0x1F4185EB0]();
}

uint64_t sub_1B7384630()
{
  return MEMORY[0x1F4185EF8]();
}

uint64_t sub_1B7384640()
{
  return MEMORY[0x1F4185FC8]();
}

uint64_t sub_1B7384650()
{
  return MEMORY[0x1F4185FF0]();
}

uint64_t AnalyticsIsEventUsed()
{
  return MEMORY[0x1F4113888]();
}

uint64_t AnalyticsSendEvent()
{
  return MEMORY[0x1F41138A0]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x1F41138B8]();
}

uint64_t CCECCryptorBlind()
{
  return MEMORY[0x1F40C9580]();
}

uint64_t CCECCryptorBlindingKeysRelease()
{
  return MEMORY[0x1F40C9588]();
}

uint64_t CCECCryptorExportKey()
{
  return MEMORY[0x1F40C9598]();
}

uint64_t CCECCryptorGenerateBlindingKeys()
{
  return MEMORY[0x1F40C95A0]();
}

uint64_t CCECCryptorH2C()
{
  return MEMORY[0x1F40C95B0]();
}

uint64_t CCECCryptorImportKey()
{
  return MEMORY[0x1F40C95B8]();
}

uint64_t CCECCryptorRelease()
{
  return MEMORY[0x1F40C95C0]();
}

uint64_t CCECCryptorUnblind()
{
  return MEMORY[0x1F40C95D0]();
}

void CCHmac(CCHmacAlgorithm algorithm, const void *key, size_t keyLength, const void *data, size_t dataLength, void *macOut)
{
}

unsigned __int8 *__cdecl CC_MD5(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x1F40C9710](data, *(void *)&len, md);
}

unsigned __int8 *__cdecl CC_SHA1(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x1F40C9730](data, *(void *)&len, md);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x1F40D70A8]();
  return result;
}

CFMutableBitVectorRef CFBitVectorCreateMutable(CFAllocatorRef allocator, CFIndex capacity)
{
  return (CFMutableBitVectorRef)MEMORY[0x1F40D73B8](allocator, capacity);
}

CFBit CFBitVectorGetBitAtIndex(CFBitVectorRef bv, CFIndex idx)
{
  return MEMORY[0x1F40D73C8](bv, idx);
}

void CFBitVectorSetBitAtIndex(CFMutableBitVectorRef bv, CFIndex idx, CFBit value)
{
}

void CFBitVectorSetBits(CFMutableBitVectorRef bv, CFRange range, CFBit value)
{
}

void CFBitVectorSetCount(CFMutableBitVectorRef bv, CFIndex count)
{
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x1F40D7420]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x1F40D7430](BOOLean);
}

CFArrayRef CFBundleCopyBundleLocalizations(CFBundleRef bundle)
{
  return (CFArrayRef)MEMORY[0x1F40D7448](bundle);
}

CFArrayRef CFBundleCopyLocalizationsForPreferences(CFArrayRef locArray, CFArrayRef prefArray)
{
  return (CFArrayRef)MEMORY[0x1F40D7490](locArray, prefArray);
}

uint64_t CFBundleCopyLocalizedStringForLocalization()
{
  return MEMORY[0x1F40D74B0]();
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1F40D7B80](cf);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1F40D8048](cf);
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return (CFRunLoopRef)MEMORY[0x1F40D80B0]();
}

CFRunLoopRef CFRunLoopGetMain(void)
{
  return (CFRunLoopRef)MEMORY[0x1F40D80B8]();
}

void CFRunLoopPerformBlock(CFRunLoopRef rl, CFTypeRef mode, void *block)
{
}

void CFRunLoopRun(void)
{
}

void CFRunLoopStop(CFRunLoopRef rl)
{
}

void CFRunLoopWakeUp(CFRunLoopRef rl)
{
}

void CFSetSetValue(CFMutableSetRef theSet, const void *value)
{
}

void CFStringAppendCharacters(CFMutableStringRef theString, const UniChar *chars, CFIndex numChars)
{
}

CFComparisonResult CFStringCompareWithOptions(CFStringRef theString1, CFStringRef theString2, CFRange rangeToCompare, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1F40D8390](theString1, theString2, rangeToCompare.location, rangeToCompare.length, compareOptions);
}

CFDataRef CFStringCreateExternalRepresentation(CFAllocatorRef alloc, CFStringRef theString, CFStringEncoding encoding, UInt8 lossByte)
{
  return (CFDataRef)MEMORY[0x1F40D83F8](alloc, theString, *(void *)&encoding, lossByte);
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return (CFMutableStringRef)MEMORY[0x1F40D8408](alloc, maxLength);
}

CFStringRef CFStringCreateWithBytes(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation)
{
  return (CFStringRef)MEMORY[0x1F40D8438](alloc, bytes, numBytes, *(void *)&encoding, isExternalRepresentation);
}

CFStringRef CFStringCreateWithCharactersNoCopy(CFAllocatorRef alloc, const UniChar *chars, CFIndex numChars, CFAllocatorRef contentsDeallocator)
{
  return (CFStringRef)MEMORY[0x1F40D8470](alloc, chars, numChars, contentsDeallocator);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x1F40D8520](theString, *(void *)&encoding);
}

void CFStringGetCharacters(CFStringRef theString, CFRange range, UniChar *buffer)
{
}

void CFStringPad(CFMutableStringRef theString, CFStringRef padString, CFIndex length, CFIndex indexIntoPad)
{
}

CFStringTokenizerRef CFStringTokenizerCreate(CFAllocatorRef alloc, CFStringRef string, CFRange range, CFOptionFlags options, CFLocaleRef locale)
{
  return (CFStringTokenizerRef)MEMORY[0x1F40D8698](alloc, string, range.location, range.length, options, locale);
}

CFIndex CFStringTokenizerGetCurrentSubTokens(CFStringTokenizerRef tokenizer, CFRange *ranges, CFIndex maxRangeLength, CFMutableArrayRef derivedSubTokens)
{
  return MEMORY[0x1F40D86A0](tokenizer, ranges, maxRangeLength, derivedSubTokens);
}

CFRange CFStringTokenizerGetCurrentTokenRange(CFStringTokenizerRef tokenizer)
{
  CFIndex v1 = MEMORY[0x1F40D86A8](tokenizer);
  result.length = v2;
  result.locatioCFIndex n = v1;
  return result;
}

CFStringTokenizerTokenType CFStringTokenizerGoToTokenAtIndex(CFStringTokenizerRef tokenizer, CFIndex index)
{
  return MEMORY[0x1F40D86B0](tokenizer, index);
}

void CFStringTokenizerSetString(CFStringTokenizerRef tokenizer, CFStringRef string, CFRange range)
{
}

void CFStringTrimWhitespace(CFMutableStringRef theString)
{
}

uint64_t CPSharedResourcesDirectory()
{
  return MEMORY[0x1F41096C8]();
}

uint64_t LXEntryCopyString()
{
  return MEMORY[0x1F412A6A8]();
}

uint64_t LXEntryGetCategoryFlags()
{
  return MEMORY[0x1F412A6C8]();
}

uint64_t LXEntryGetMetaFlags()
{
  return MEMORY[0x1F412A6D8]();
}

uint64_t LXEntryGetProbability()
{
  return MEMORY[0x1F412A6F0]();
}

uint64_t LXLexiconCreate()
{
  return MEMORY[0x1F412A768]();
}

uint64_t LXLexiconEnumerateEntriesForString()
{
  return MEMORY[0x1F412A788]();
}

uint64_t MGCancelNotifications()
{
  return MEMORY[0x1F417CDD0]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1F417CDE0]();
}

uint64_t MGGetSInt32Answer()
{
  return MEMORY[0x1F417CE28]();
}

uint64_t MGGetStringAnswer()
{
  return MEMORY[0x1F417CE38]();
}

uint64_t MGRegisterForUpdates()
{
  return MEMORY[0x1F417CE60]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1F40E7010](aClassName);
}

void NSLog(NSString *format, ...)
{
}

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return (NSArray *)MEMORY[0x1F40E7248](directory, domainMask, expandTilde);
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x1F40E7258](aSelectorName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
}

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return (NSString *)MEMORY[0x1F40E72A0](range.location, range.length);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1F40E72B0](aSelector);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x1F40E72C8]();
}

NSRange NSUnionRange(NSRange range1, NSRange range2)
{
  NSUInteger v2 = MEMORY[0x1F40E72E0](range1.location, range1.length, range2.location, range2.length);
  result.length = v3;
  result.locatioCFIndex n = v2;
  return result;
}

SecAccessControlRef SecAccessControlCreateWithFlags(CFAllocatorRef allocator, CFTypeRef protection, SecAccessControlCreateFlags flags, CFErrorRef *error)
{
  return (SecAccessControlRef)MEMORY[0x1F40F6A18](allocator, protection, flags, error);
}

OSStatus SecItemAdd(CFDictionaryRef attributes, CFTypeRef *result)
{
  return MEMORY[0x1F40F6DD8](attributes, result);
}

OSStatus SecItemCopyMatching(CFDictionaryRef query, CFTypeRef *result)
{
  return MEMORY[0x1F40F6DE0](query, result);
}

OSStatus SecItemDelete(CFDictionaryRef query)
{
  return MEMORY[0x1F40F6DE8](query);
}

uint64_t SecItemShareWithGroup()
{
  return MEMORY[0x1F40F6E18]();
}

OSStatus SecItemUpdate(CFDictionaryRef query, CFDictionaryRef attributesToUpdate)
{
  return MEMORY[0x1F40F6E20](query, attributesToUpdate);
}

uint64_t SecItemUpdateWithError()
{
  return MEMORY[0x1F40F6E28]();
}

CFDataRef SecKeyCopyExternalRepresentation(SecKeyRef key, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x1F40F6E48](key, error);
}

SecKeyRef SecKeyCopyPublicKey(SecKeyRef key)
{
  return (SecKeyRef)MEMORY[0x1F40F6E68](key);
}

SecKeyRef SecKeyCreateRandomKey(CFDictionaryRef parameters, CFErrorRef *error)
{
  return (SecKeyRef)MEMORY[0x1F40F6EE8](parameters, error);
}

SecKeyRef SecKeyCreateWithData(CFDataRef keyData, CFDictionaryRef attributes, CFErrorRef *error)
{
  return (SecKeyRef)MEMORY[0x1F40F6F00](keyData, attributes, error);
}

CFTypeID SecKeyGetTypeID(void)
{
  return MEMORY[0x1F40F6F50]();
}

int SecRandomCopyBytes(SecRandomRef rnd, size_t count, void *bytes)
{
  return MEMORY[0x1F40F70F0](rnd, count, bytes);
}

uint64_t SecTaskCopyTeamIdentifier()
{
  return MEMORY[0x1F40F7130]();
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return (CFTypeRef)MEMORY[0x1F40F7138](task, entitlement, error);
}

SecTaskRef SecTaskCreateWithAuditToken(CFAllocatorRef allocator, audit_token_t *token)
{
  return (SecTaskRef)MEMORY[0x1F40F7168](allocator, token);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1F40C9A70](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

uint64_t _CFBundleCopyBundleURLForExecutableURL()
{
  return MEMORY[0x1F40D8BB0]();
}

uint64_t _CFBundleCopyFrameworkURLForExecutablePath()
{
  return MEMORY[0x1F40D8BE0]();
}

uint64_t _CFHostGetTopLevelDomain()
{
  return MEMORY[0x1F40D5698]();
}

uint64_t _NSErrorWithFilePathAndErrno()
{
  return MEMORY[0x1F40E7338]();
}

uint64_t _NSErrorWithFilePathErrnoVariantAndExtraUserInfo()
{
  return MEMORY[0x1F40E7348]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

const char *__cdecl std::runtime_error::what(const std::runtime_error *this)
{
  return (const char *)MEMORY[0x1F417E350](this);
}

std::runtime_error *__cdecl std::runtime_error::runtime_error(std::runtime_error *this, const char *a2)
{
  return (std::runtime_error *)MEMORY[0x1F417E4B8](this, a2);
}

void std::runtime_error::~runtime_error(std::runtime_error *this)
{
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x1F417E5C0](this, __s, __n);
}

std::string *__cdecl std::string::insert(std::string *this, std::string::size_type __pos, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x1F417E608](this, __pos, __s, __n);
}

void std::string::push_back(std::string *this, std::string::value_type __c)
{
}

uint64_t std::filebuf::open()
{
  return MEMORY[0x1F417E728]();
}

uint64_t std::filebuf::basic_filebuf()
{
  return MEMORY[0x1F417E740]();
}

uint64_t std::filebuf::~filebuf()
{
  return MEMORY[0x1F417E748]();
}

uint64_t std::istream::~istream()
{
  return MEMORY[0x1F417E7B8]();
}

{
  return MEMORY[0x1F417E7C0]();
}

uint64_t std::streambuf::basic_streambuf()
{
  return MEMORY[0x1F417E978]();
}

uint64_t std::streambuf::~streambuf()
{
  return MEMORY[0x1F417E980]();
}

void std::ios_base::init(std::ios_base *this, void *__sb)
{
}

void std::ios_base::clear(std::ios_base *this, std::ios_base::iostate __state)
{
}

uint64_t std::ios::~ios()
{
  return MEMORY[0x1F417EE40]();
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, int __val)
{
  return (std::string *)MEMORY[0x1F417EE70](retstr, *(void *)&__val);
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, unint64_t __val)
{
  return (std::string *)MEMORY[0x1F417EE88](retstr, __val);
}

uint64_t std::operator+<char>()
{
  return MEMORY[0x1F417EEA0]();
}

void std::exception::~exception(std::exception *this)
{
}

void std::terminate(void)
{
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void operator delete()
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

void operator new()
{
  while (1)
    ;
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x1F417EF48](a1);
}

int *__error(void)
{
  return (int *)MEMORY[0x1F40C9B88]();
}

double __exp10(double a1)
{
  MEMORY[0x1F40C9B90](a1);
  return result;
}

uint64_t __strlcat_chk()
{
  return MEMORY[0x1F40C9CD0]();
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x1F40C9CD8]();
}

__darwin_ct_rune_t __toupper(__darwin_ct_rune_t a1)
{
  return MEMORY[0x1F40C9D00](*(void *)&a1);
}

void _os_activity_initiate(void *dso, const char *description, os_activity_flag_t flags, os_block_t activity_block)
{
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1F40C9FB0]();
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
  return MEMORY[0x1F415B160]();
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x1F4186370]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x1F4186388]();
}

void abort(void)
{
}

uint32_t arc4random(void)
{
  return MEMORY[0x1F40CA3A8]();
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x1F40CA3C0](*(void *)&__upper_bound);
}

void bzero(void *a1, size_t a2)
{
}

uint64_t ccscrypt()
{
  return MEMORY[0x1F40CB128]();
}

uint64_t ccscrypt_storage_size()
{
  return MEMORY[0x1F40CB130]();
}

int close(int a1)
{
  return MEMORY[0x1F40CB3F8](*(void *)&a1);
}

int connect(int a1, const sockaddr *a2, socklen_t a3)
{
  return MEMORY[0x1F40CB440](*(void *)&a1, a2, *(void *)&a3);
}

uint64_t container_copy_sandbox_token()
{
  return MEMORY[0x1F40CB550]();
}

uint64_t container_error_copy_unlocalized_description()
{
  return MEMORY[0x1F40CB5D0]();
}

uint64_t container_query_create()
{
  return MEMORY[0x1F40CB720]();
}

uint64_t container_query_free()
{
  return MEMORY[0x1F40CB730]();
}

uint64_t container_query_get_last_error()
{
  return MEMORY[0x1F40CB738]();
}

uint64_t container_query_get_single_result()
{
  return MEMORY[0x1F40CB740]();
}

uint64_t container_query_operation_set_flags()
{
  return MEMORY[0x1F40CB750]();
}

uint64_t container_query_set_class()
{
  return MEMORY[0x1F40CB760]();
}

uint64_t container_query_set_identifiers()
{
  return MEMORY[0x1F40CB770]();
}

uint64_t container_query_set_persona_unique_string()
{
  return MEMORY[0x1F40CB780]();
}

int deflate(z_streamp strm, int flush)
{
  return MEMORY[0x1F4182BD0](strm, *(void *)&flush);
}

uLong deflateBound(z_streamp strm, uLong sourceLen)
{
  return MEMORY[0x1F4182BD8](strm, sourceLen);
}

int deflateEnd(z_streamp strm)
{
  return MEMORY[0x1F4182BE0](strm);
}

int deflateInit_(z_streamp strm, int level, const char *version, int stream_size)
{
  return MEMORY[0x1F4182BF0](strm, *(void *)&level, version, *(void *)&stream_size);
}

void dispatch_activate(dispatch_object_t object)
{
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_apply(size_t iterations, dispatch_queue_t queue, void *block)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_block_cancel(dispatch_block_t block)
{
}

dispatch_block_t dispatch_block_create(dispatch_block_flags_t flags, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x1F40CB9C0](flags, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1F40CBA60](identifier, flags);
}

void dispatch_group_async(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
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

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x1F40CBAC0](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_initially_inactive(dispatch_queue_attr_t attr)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBA0](attr);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBA8](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBB8](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBC0](label, attr);
}

dispatch_queue_t dispatch_queue_create_with_target_V2(const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBD0](label, attr, target);
}

void dispatch_resume(dispatch_object_t object)
{
}

void dispatch_set_target_queue(dispatch_object_t object, dispatch_queue_t queue)
{
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1F40CBC98](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

intptr_t dispatch_source_testcancel(dispatch_source_t source)
{
  return MEMORY[0x1F40CBCF8](source);
}

void dispatch_suspend(dispatch_object_t object)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1F40CBD30](when, delta);
}

dispatch_time_t dispatch_walltime(const timespec *when, int64_t delta)
{
  return MEMORY[0x1F40CBD40](when, delta);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1F40CBDB0]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1F40CBDC8](__handle, __symbol);
}

int dprintf(int a1, const char *a2, ...)
{
  return MEMORY[0x1F40CBDE0](*(void *)&a1, a2);
}

uint64_t dyld_image_path_containing_address()
{
  return MEMORY[0x1F40CBE70]();
}

void exit(int a1)
{
}

int flock(int a1, int a2)
{
  return MEMORY[0x1F40CC160](*(void *)&a1, *(void *)&a2);
}

void free(void *a1)
{
}

void freeaddrinfo(addrinfo *a1)
{
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x1F40CC2B8](*(void *)&a1, a2);
}

int getaddrinfo(const char *a1, const char *a2, const addrinfo *a3, addrinfo **a4)
{
  return MEMORY[0x1F40CC348](a1, a2, a3, a4);
}

int gethostuuid(uuid_t a1, const timespec *a2)
{
  return MEMORY[0x1F40CC408](a1, a2);
}

pid_t getpid(void)
{
  return MEMORY[0x1F40CC4A0]();
}

htmlParserCtxtPtr htmlCreatePushParserCtxt(htmlSAXHandlerPtr sax, void *user_data, const char *chunk, int size, const char *filename, xmlCharEncoding enc)
{
  return (htmlParserCtxtPtr)MEMORY[0x1F4182580](sax, user_data, chunk, *(void *)&size, filename, *(void *)&enc);
}

int htmlCtxtUseOptions(htmlParserCtxtPtr ctxt, int options)
{
  return MEMORY[0x1F4182588](ctxt, *(void *)&options);
}

int htmlParseChunk(htmlParserCtxtPtr ctxt, const char *chunk, int size, int terminate)
{
  return MEMORY[0x1F4182598](ctxt, chunk, *(void *)&size, *(void *)&terminate);
}

int inet_pton(int a1, const char *a2, void *a3)
{
  return MEMORY[0x1F40CC680](*(void *)&a1, a2, a3);
}

int inflate(z_streamp strm, int flush)
{
  return MEMORY[0x1F4182CB0](strm, *(void *)&flush);
}

int inflateEnd(z_streamp strm)
{
  return MEMORY[0x1F4182CB8](strm);
}

int inflateInit_(z_streamp strm, const char *version, int stream_size)
{
  return MEMORY[0x1F4182CD8](strm, version, *(void *)&stream_size);
}

lconv *localeconv(void)
{
  return (lconv *)MEMORY[0x1F40CC858]();
}

long double log(long double __x)
{
  MEMORY[0x1F40CC878](__x);
  return result;
}

int lstat(const char *a1, stat *a2)
{
  return MEMORY[0x1F40CC900](a1, a2);
}

uint64_t malloc_get_all_zones()
{
  return MEMORY[0x1F40CCB48]();
}

const char *__cdecl malloc_get_zone_name(malloc_zone_t *zone)
{
  return (const char *)MEMORY[0x1F40CCB50](zone);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1F40CCB80](ptr);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB90](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB98](size, type_id);
}

void malloc_zone_statistics(malloc_zone_t *zone, malloc_statistics_t *stats)
{
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCD8](__s, *(void *)&__c, __n);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x1F40CCCE0](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCF0](__dst, __src, __n);
}

void *__cdecl memmem(const void *__big, size_t __big_len, const void *__little, size_t __little_len)
{
  return (void *)MEMORY[0x1F40CCD00](__big, __big_len, __little, __little_len);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD10](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD20](__b, *(void *)&__c, __len);
}

int mkdirat(int a1, const char *a2, mode_t a3)
{
  return MEMORY[0x1F40CCDD8](*(void *)&a1, a2, a3);
}

char *__cdecl mkdtemp(char *a1)
{
  return (char *)MEMORY[0x1F40CCDE0](a1);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1F40CD028](*(void *)&token);
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

uint64_t objc_alloc_init()
{
  return MEMORY[0x1F4181648]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1F4181660](a1);
}

{
  MEMORY[0x1F4181668](context);
}

{
  return (void *)MEMORY[0x1F4181670]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1F4181680](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

void objc_exception_throw(id exception)
{
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x1F4181718](object, key);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1F4181728](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1F4181748](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1F4181758](location, val);
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

uint64_t objc_opt_class()
{
  return MEMORY[0x1F41817B0]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1F41817B8]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1F41817C0]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1F41817C8]();
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

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1F41818B8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C8](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1F41818D0](a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
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
  return (id)MEMORY[0x1F4181A18](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x1F4181A28](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1F4181A30](obj);
}

void objc_terminate(void)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181A40](a1);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1F40CD0E0](a1, *(void *)&a2);
}

int openat(int a1, const char *a2, int a3, ...)
{
  return MEMORY[0x1F40CD100](*(void *)&a1, a2, *(void *)&a3);
}

uint64_t os_eligibility_get_domain_answer()
{
  return MEMORY[0x1F40CD2B0]();
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1F40CD360](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x1F40CD550](log);
}

uint64_t os_state_add_handler()
{
  return MEMORY[0x1F40CD570]();
}

uint64_t os_state_remove_handler()
{
  return MEMORY[0x1F40CD578]();
}

uint64_t os_transaction_create()
{
  return MEMORY[0x1F40CD5A0]();
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

uint64_t os_variant_allows_internal_security_policies()
{
  return MEMORY[0x1F40CD630]();
}

uint64_t os_variant_has_internal_content()
{
  return MEMORY[0x1F40CD648]();
}

uint64_t os_variant_has_internal_ui()
{
  return MEMORY[0x1F40CD658]();
}

long double pow(long double __x, long double __y)
{
  MEMORY[0x1F40CD818](__x, __y);
  return result;
}

int printf(const char *a1, ...)
{
  return MEMORY[0x1F40CD838](a1);
}

qos_class_t qos_class_self(void)
{
  return MEMORY[0x1F40CDBD8]();
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x1F40CDC50](*(void *)&a1, a2, a3);
}

uint64_t realpath_np()
{
  return MEMORY[0x1F40CDCA0]();
}

int renameatx_np(int a1, const char *a2, int a3, const char *a4, unsigned int a5)
{
  return MEMORY[0x1F40CDD68](*(void *)&a1, a2, *(void *)&a3, a4, *(void *)&a5);
}

int rmdir(const char *a1)
{
  return MEMORY[0x1F40CDD90](a1);
}

uint64_t sandbox_container_path_for_pid()
{
  return MEMORY[0x1F40CDDE8]();
}

uint64_t sandbox_extension_consume()
{
  return MEMORY[0x1F40CDDF8]();
}

uint64_t sandbox_extension_issue_file()
{
  return MEMORY[0x1F40CDE00]();
}

uint64_t sandbox_extension_release()
{
  return MEMORY[0x1F40CDE50]();
}

SEL sel_getUid(const char *str)
{
  return (SEL)MEMORY[0x1F4181B30](str);
}

int setenv(const char *__name, const char *__value, int __overwrite)
{
  return MEMORY[0x1F40CDF60](__name, __value, *(void *)&__overwrite);
}

int sigaction(int a1, const sigaction *a2, sigaction *a3)
{
  return MEMORY[0x1F40CE018](*(void *)&a1, a2, a3);
}

void (__cdecl *__cdecl signal(int a1, void (__cdecl *a2)(int)))(int)
{
  return (void (__cdecl *)(int))MEMORY[0x1F40CE030](*(void *)&a1, a2);
}

unsigned int sleep(unsigned int a1)
{
  return MEMORY[0x1F40CE078](*(void *)&a1);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1F40CE080](__str, __size, __format);
}

int socket(int a1, int a2, int a3)
{
  return MEMORY[0x1F40CE090](*(void *)&a1, *(void *)&a2, *(void *)&a3);
}

int sqlite3_bind_blob(sqlite3_stmt *a1, int a2, const void *a3, int n, void (__cdecl *a5)(void *))
{
  return MEMORY[0x1F4181F90](a1, *(void *)&a2, a3, *(void *)&n, a5);
}

int sqlite3_bind_double(sqlite3_stmt *a1, int a2, double a3)
{
  return MEMORY[0x1F4181FA8](a1, *(void *)&a2, a3);
}

int sqlite3_bind_int(sqlite3_stmt *a1, int a2, int a3)
{
  return MEMORY[0x1F4181FB0](a1, *(void *)&a2, *(void *)&a3);
}

int sqlite3_bind_int64(sqlite3_stmt *a1, int a2, sqlite3_int64 a3)
{
  return MEMORY[0x1F4181FB8](a1, *(void *)&a2, a3);
}

int sqlite3_bind_null(sqlite3_stmt *a1, int a2)
{
  return MEMORY[0x1F4181FC0](a1, *(void *)&a2);
}

int sqlite3_bind_text(sqlite3_stmt *a1, int a2, const char *a3, int a4, void (__cdecl *a5)(void *))
{
  return MEMORY[0x1F4181FE8](a1, *(void *)&a2, a3, *(void *)&a4, a5);
}

int sqlite3_busy_timeout(sqlite3 *a1, int ms)
{
  return MEMORY[0x1F4182048](a1, *(void *)&ms);
}

int sqlite3_changes(sqlite3 *a1)
{
  return MEMORY[0x1F4182050](a1);
}

int sqlite3_close_v2(sqlite3 *a1)
{
  return MEMORY[0x1F4182068](a1);
}

const void *__cdecl sqlite3_column_blob(sqlite3_stmt *a1, int iCol)
{
  return (const void *)MEMORY[0x1F4182070](a1, *(void *)&iCol);
}

int sqlite3_column_bytes(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x1F4182078](a1, *(void *)&iCol);
}

int sqlite3_column_count(sqlite3_stmt *pStmt)
{
  return MEMORY[0x1F4182088](pStmt);
}

double sqlite3_column_double(sqlite3_stmt *a1, int iCol)
{
  MEMORY[0x1F4182098](a1, *(void *)&iCol);
  return result;
}

int sqlite3_column_int(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x1F41820A0](a1, *(void *)&iCol);
}

sqlite3_int64 sqlite3_column_int64(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x1F41820A8](a1, *(void *)&iCol);
}

const char *__cdecl sqlite3_column_name(sqlite3_stmt *a1, int N)
{
  return (const char *)MEMORY[0x1F41820B0](a1, *(void *)&N);
}

const unsigned __int8 *__cdecl sqlite3_column_text(sqlite3_stmt *a1, int iCol)
{
  return (const unsigned __int8 *)MEMORY[0x1F41820C8](a1, *(void *)&iCol);
}

int sqlite3_column_type(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x1F41820D8](a1, *(void *)&iCol);
}

const char *__cdecl sqlite3_errmsg(sqlite3 *a1)
{
  return (const char *)MEMORY[0x1F4182198](a1);
}

const char *__cdecl sqlite3_errstr(int a1)
{
  return (const char *)MEMORY[0x1F41821A0](*(void *)&a1);
}

char *__cdecl sqlite3_expanded_sql(sqlite3_stmt *pStmt)
{
  return (char *)MEMORY[0x1F41821B8](pStmt);
}

int sqlite3_extended_errcode(sqlite3 *db)
{
  return MEMORY[0x1F41821C0](db);
}

int sqlite3_finalize(sqlite3_stmt *pStmt)
{
  return MEMORY[0x1F41821D8](pStmt);
}

void sqlite3_free(void *a1)
{
}

sqlite3_int64 sqlite3_last_insert_rowid(sqlite3 *a1)
{
  return MEMORY[0x1F4182230](a1);
}

int sqlite3_open_v2(const char *filename, sqlite3 **ppDb, int flags, const char *zVfs)
{
  return MEMORY[0x1F4182280](filename, ppDb, *(void *)&flags, zVfs);
}

int sqlite3_prepare_v2(sqlite3 *db, const char *zSql, int nByte, sqlite3_stmt **ppStmt, const char **pzTail)
{
  return MEMORY[0x1F4182290](db, zSql, *(void *)&nByte, ppStmt, pzTail);
}

int sqlite3_reset(sqlite3_stmt *pStmt)
{
  return MEMORY[0x1F41822C0](pStmt);
}

int sqlite3_step(sqlite3_stmt *a1)
{
  return MEMORY[0x1F41823B0](a1);
}

int sqlite3_wal_checkpoint_v2(sqlite3 *db, const char *zDb, int eMode, int *pnLog, int *pnCkpt)
{
  return MEMORY[0x1F4182490](db, zDb, *(void *)&eMode, pnLog, pnCkpt);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x1F40CE178](__s1);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1F40CE188](*(void *)&__errnum);
}

uint64_t stringForCKErrorCode()
{
  return MEMORY[0x1F40D6530]();
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1F40CE1C8](__s);
}

size_t strnlen(const char *__s1, size_t __n)
{
  return MEMORY[0x1F40CE208](__s1, __n);
}

double strtod(const char *a1, char **a2)
{
  MEMORY[0x1F40CE260](a1, a2);
  return result;
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1F40CE2A0](__str, __endptr, *(void *)&__base);
}

uint64_t strtoll(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1F40CE2C0](__str, __endptr, *(void *)&__base);
}

unint64_t strtoull(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1F40CE2F0](__str, __endptr, *(void *)&__base);
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

uint64_t swift_continuation_init()
{
  return MEMORY[0x1F41881F0]();
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

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x1F41864E0]();
}

uint64_t swift_dynamicCastUnknownClassUnconditional()
{
  return MEMORY[0x1F4186510]();
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

uint64_t swift_getErrorValue()
{
  return MEMORY[0x1F4186580]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x1F41865A8]();
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

uint64_t swift_task_isCurrentExecutor()
{
  return MEMORY[0x1F4188278]();
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

uint64_t swift_willThrow()
{
  return MEMORY[0x1F41868E0]();
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return MEMORY[0x1F40CE3C0](a1, *(void *)&a2, a3, a4, a5, a6);
}

kern_return_t task_info(task_name_t target_task, task_flavor_t flavor, task_info_t task_info_out, mach_msg_type_number_t *task_info_outCnt)
{
  return MEMORY[0x1F40CE470](*(void *)&target_task, *(void *)&flavor, task_info_out, task_info_outCnt);
}

int unlink(const char *a1)
{
  return MEMORY[0x1F40CE5E0](a1);
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return MEMORY[0x1F40CE928](*(void *)&__fd, __buf, __nbyte);
}

xmlChar *__cdecl xmlEncodeEntitiesReentrant(xmlDocPtr doc, const xmlChar *input)
{
  return (xmlChar *)MEMORY[0x1F4182688](doc, input);
}

void xmlFreeParserCtxt(xmlParserCtxtPtr ctxt)
{
}

xpc_object_t xpc_array_create(xpc_object_t *objects, size_t count)
{
  return (xpc_object_t)MEMORY[0x1F40CEA30](objects, count);
}

xpc_object_t xpc_string_create(const char *string)
{
  return (xpc_object_t)MEMORY[0x1F40CF290](string);
}