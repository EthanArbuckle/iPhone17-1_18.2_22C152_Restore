uint64_t sub_2380A1130@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  uint64_t *v15;
  uint8_t *v16;
  uint8_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t result;
  uint64_t v21;
  void (*v22)(char *, uint64_t);
  char *v23;
  void (*v24)(char *);
  uint64_t v25;

  v4 = sub_2380E4528();
  v5 = *(void *)(v4 - 8);
  v6 = MEMORY[0x270FA5388](v4);
  v8 = (char *)&v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  v10 = (char *)&v21 - v9;
  if (qword_26894AA20 != -1) {
    swift_once();
  }
  v11 = __swift_project_value_buffer(v4, (uint64_t)qword_268956458);
  v24 = *(void (**)(char *))(v5 + 16);
  v25 = v11;
  v24(v10);
  v12 = sub_2380E4508();
  v13 = sub_2380E4D38();
  if (os_log_type_enabled(v12, v13))
  {
    v14 = (uint8_t *)swift_slowAlloc();
    v23 = v8;
    v15 = a2;
    v16 = v14;
    *(_WORD *)v14 = 0;
    _os_log_impl(&dword_237EB8000, v12, v13, "AirPlayRouteProvider#startAirplayDiscovery Configuring audio session", v14, 2u);
    v17 = v16;
    a2 = v15;
    MEMORY[0x23EC87710](v17, -1, -1);
  }

  v22 = *(void (**)(char *, uint64_t))(v5 + 8);
  v22(v10, v4);
  v18 = a1[3];
  v19 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v18);
  result = (*(uint64_t (**)(uint64_t, uint64_t))(v19 + 64))(v18, v19);
  *a2 = result;
  return result;
}

void sub_2380A1598(void *a1@<X1>, uint64_t *a2@<X8>)
{
  uint64_t v4 = sub_2380E4528();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  v7 = (char *)&v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26894AA20 != -1) {
    swift_once();
  }
  uint64_t v8 = __swift_project_value_buffer(v4, (uint64_t)qword_268956458);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v8, v4);
  swift_bridgeObjectRetain_n();
  v9 = sub_2380E4508();
  os_log_type_t v10 = sub_2380E4D38();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v11 = swift_slowAlloc();
    v26 = a2;
    v12 = (uint8_t *)v11;
    uint64_t v24 = swift_slowAlloc();
    uint64_t v28 = v24;
    v25 = a1;
    *(_DWORD *)v12 = 136315138;
    v23 = v12 + 4;
    uint64_t v13 = swift_bridgeObjectRetain();
    uint64_t v14 = MEMORY[0x23EC86140](v13, MEMORY[0x263F8D310]);
    unint64_t v16 = v15;
    swift_bridgeObjectRelease();
    uint64_t v27 = sub_237EBC6BC(v14, v16, &v28);
    a1 = v25;
    sub_2380E4FC8();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_237EB8000, v9, v10, "AirPlayRouteProvider#startAirplayDiscovery Creating reconnaissance session for airplay ids: %s", v12, 0xCu);
    uint64_t v17 = v24;
    swift_arrayDestroy();
    MEMORY[0x23EC87710](v17, -1, -1);
    v18 = v12;
    a2 = v26;
    MEMORY[0x23EC87710](v18, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  uint64_t v19 = a1[3];
  uint64_t v20 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v19);
  v21 = (void *)sub_2380E4B08();
  uint64_t v22 = (*(uint64_t (**)(void *, uint64_t, uint64_t, uint64_t))(v20 + 72))(v21, 1, v19, v20);

  *a2 = v22;
}

void sub_2380A1884(void *a1, uint64_t a2, void (*a3)(void, void), uint64_t a4, uint64_t a5)
{
  v107 = a3;
  uint64_t v116 = *MEMORY[0x263EF8340];
  uint64_t v8 = sub_2380E4528();
  uint64_t v112 = *(void *)(v8 - 8);
  uint64_t v9 = MEMORY[0x270FA5388](v8);
  v108 = (char *)&v99 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  v103 = (char *)&v99 - v12;
  uint64_t v13 = MEMORY[0x270FA5388](v11);
  v104 = (char *)&v99 - v14;
  MEMORY[0x270FA5388](v13);
  v110 = (char *)&v99 - v15;
  uint64_t v16 = sub_2380E44F8();
  uint64_t v17 = *(void *)(v16 - 8);
  MEMORY[0x270FA5388](v16);
  uint64_t v19 = (char *)&v99 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v109 = a1;
  CFIndex Count = CFArrayGetCount((CFArrayRef)a1);
  uint64_t v21 = *(void *)(a4 + 16);
  sub_2380E4EA8();
  if (qword_26894A818 != -1) {
    swift_once();
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26894B288);
  uint64_t v22 = swift_allocObject();
  *(_OWORD *)(v22 + 16) = xmmword_2380E7390;
  uint64_t v23 = MEMORY[0x263F8D6C8];
  uint64_t v24 = MEMORY[0x263F8D750];
  *(void *)(v22 + 56) = MEMORY[0x263F8D6C8];
  *(void *)(v22 + 64) = v24;
  uint64_t v105 = v21;
  *(void *)(v22 + 32) = v21;
  *(void *)(v22 + 96) = v23;
  *(void *)(v22 + 104) = v24;
  *(void *)(v22 + 72) = Count;
  sub_2380E44E8();
  sub_2380E44B8();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v17 + 8))(v19, v16);
  swift_beginAccess();
  uint64_t v106 = Count;
  *(void *)(a5 + 112) = Count;
  *(unsigned char *)(a5 + 120) = 0;
  uint64_t v25 = v112;
  v26 = v107;
  uint64_t v111 = v8;
  if (v107)
  {
    if (qword_26894AA20 != -1) {
      swift_once();
    }
    uint64_t v27 = __swift_project_value_buffer(v8, (uint64_t)qword_268956458);
    uint64_t v28 = *(void (**)(char *, uint64_t, uint64_t))(v25 + 16);
    v28(v110, v27, v8);
    v29 = v26;
    v30 = sub_2380E4508();
    os_log_type_t v31 = sub_2380E4D48();
    BOOL v32 = os_log_type_enabled(v30, v31);
    uint64_t v102 = v25 + 16;
    v101 = v28;
    uint64_t v100 = v27;
    if (v32)
    {
      v33 = (uint8_t *)swift_slowAlloc();
      v34 = (void *)swift_slowAlloc();
      *(_DWORD *)v33 = 138412290;
      type metadata accessor for CFError(0);
      sub_237EBE2EC((unint64_t *)&qword_26894B528, type metadata accessor for CFError);
      swift_allocError();
      *v35 = v29;
      v36 = v29;
      uint64_t v37 = _swift_stdlib_bridgeErrorToNSError();
      v114[0] = v37;
      sub_2380E4FC8();
      void *v34 = v37;
      uint64_t v8 = v111;

      uint64_t v25 = v112;
      _os_log_impl(&dword_237EB8000, v30, v31, "AirPlayRouteProvider#startAirplayDiscovery Error searching for output devices: %@", v33, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26894C570);
      swift_arrayDestroy();
      MEMORY[0x23EC87710](v34, -1, -1);
      MEMORY[0x23EC87710](v33, -1, -1);
    }
    else
    {

      v30 = v29;
    }

    uint64_t v38 = v25 + 8;
    v107 = *(void (**)(void, void))(v25 + 8);
    v107(v110, v8);
    type metadata accessor for CFError(0);
    sub_237EBE2EC((unint64_t *)&qword_26894B528, type metadata accessor for CFError);
    v39 = (void *)swift_allocError();
    *v40 = v29;
    swift_beginAccess();
    v41 = *(void **)(a5 + 64);
    *(void *)(a5 + 64) = v39;
    v42 = v29;
    id v43 = v39;

    id v44 = v39;
    v110 = (char *)sub_2380E2B98();

    v45 = (void *)sub_2380E2B98();
    id v46 = objc_msgSend(v45, sel_code);
    id v47 = objc_msgSend(v45, sel_domain);
    uint64_t v48 = sub_2380E4938();
    uint64_t v50 = v49;

    if (!*MEMORY[0x263F54AE0])
    {
      __break(1u);
      return;
    }
    uint64_t v99 = v38;
    if (v48 == sub_2380E4938() && v50 == v51)
    {
      swift_bridgeObjectRelease_n();

      uint64_t v52 = v106;
      if (v46 != (id)26 || v106 <= 0) {
        goto LABEL_21;
      }
    }
    else
    {
      char v53 = sub_2380E5408();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();

      uint64_t v52 = v106;
      if (v46 != (id)26 || (v53 & 1) == 0 || v106 < 1)
      {
LABEL_21:
        id v68 = v110;
        id v69 = objc_msgSend(v110, sel_code);
        id v70 = objc_msgSend(v68, sel_domain);
        uint64_t v71 = sub_2380E4938();
        uint64_t v73 = v72;

        sub_2380497D8((uint64_t)"siriAirPlayDeviceSearchError", 28, 2, (uint64_t)"deviceIdCount=%{public, signpost.telemetry:number1}d resolvedOutputDevicesCount=%{public, signpost.telemetry:number2}d errorCode=%{public, signpost.telemetry:number3}d errorDomain=%{public, signpost.telemetry:string1}@ enableTelemetry=YES ", 239, 2, v105, v52, (uint64_t)v69, v71, v73);
        swift_bridgeObjectRelease();
        v74 = v103;
        uint64_t v75 = v111;
        v101(v103, v100, v111);
        id v76 = v39;
        id v77 = v39;
        v78 = sub_2380E4508();
        os_log_type_t v79 = sub_2380E4D48();
        if (os_log_type_enabled(v78, v79))
        {
          v80 = (uint8_t *)swift_slowAlloc();
          v81 = (void *)swift_slowAlloc();
          *(_DWORD *)v80 = 138412290;
          id v82 = v39;
          uint64_t v83 = _swift_stdlib_bridgeErrorToNSError();
          v114[0] = v83;
          sub_2380E4FC8();
          void *v81 = v83;
          uint64_t v75 = v111;

          _os_log_impl(&dword_237EB8000, v78, v79, "AirPlayRouteProvider#searchOutputDevices Failed to search for output devices: %@", v80, 0xCu);
          __swift_instantiateConcreteTypeFromMangledName(&qword_26894C570);
          swift_arrayDestroy();
          v84 = v81;
          id v68 = v110;
          MEMORY[0x23EC87710](v84, -1, -1);
          MEMORY[0x23EC87710](v80, -1, -1);
        }
        else
        {
        }
        v107(v74, v75);
        swift_beginAccess();
        if (*(void *)(a5 + 136))
        {
          swift_retain();
          sub_237FF2080();
          swift_release();
        }
        v115[0] = 6;
        sub_2380A51E8(v115);

        return;
      }
    }
    swift_beginAccess();
    *(unsigned char *)(a5 + 72) = 1;
    id v54 = v110;
    id v55 = objc_msgSend(v110, sel_code);
    id v56 = objc_msgSend(v54, sel_domain);
    uint64_t v57 = sub_2380E4938();
    uint64_t v59 = v58;

    sub_2380497D8((uint64_t)"siriAirPlayDeviceSearchPartialError", 35, 2, (uint64_t)"deviceIdCount=%{public, signpost.telemetry:number1}d resolvedOutputDevicesCount=%{public, signpost.telemetry:number2}d errorCode=%{public, signpost.telemetry:number3}d errorDomain=%{public, signpost.telemetry:string1}@ enableTelemetry=YES ", 239, 2, v105, v52, (uint64_t)v55, v57, v59);
    swift_bridgeObjectRelease();
    v60 = v104;
    uint64_t v8 = v111;
    v101(v104, v100, v111);
    id v61 = v109;
    id v62 = v109;
    v63 = sub_2380E4508();
    os_log_type_t v64 = sub_2380E4D48();
    if (os_log_type_enabled(v63, v64))
    {
      v65 = (uint8_t *)swift_slowAlloc();
      v66 = (void *)swift_slowAlloc();
      *(_DWORD *)v65 = 138412290;
      if (v61)
      {
        v114[0] = (uint64_t)v62;
        id v67 = v62;
      }
      else
      {
        v114[0] = 0;
      }
      sub_2380E4FC8();
      uint64_t v25 = v112;
      void *v66 = v109;

      _os_log_impl(&dword_237EB8000, v63, v64, "AirPlayRouteProvider#searchOutputDevices Timed out with partial discovery. We will fall through and use these partial devices, following the existing apple music behavior. Found devices: %@", v65, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26894C570);
      swift_arrayDestroy();
      MEMORY[0x23EC87710](v66, -1, -1);
      MEMORY[0x23EC87710](v65, -1, -1);

      uint64_t v8 = v111;
      v60 = v104;
    }
    else
    {

      uint64_t v25 = v112;
    }
    v107(v60, v8);
  }
  swift_beginAccess();
  v85 = *(void **)(a5 + 128);
  id v86 = v109;
  *(void *)(a5 + 128) = v109;
  id v87 = v86;

  v88 = v108;
  if (qword_26894AA20 != -1) {
    swift_once();
  }
  uint64_t v89 = __swift_project_value_buffer(v8, (uint64_t)qword_268956458);
  (*(void (**)(char *, uint64_t, uint64_t))(v25 + 16))(v88, v89, v8);
  swift_retain_n();
  v90 = sub_2380E4508();
  os_log_type_t v91 = sub_2380E4D38();
  if (os_log_type_enabled(v90, v91))
  {
    v92 = (uint8_t *)swift_slowAlloc();
    uint64_t v93 = swift_slowAlloc();
    v114[0] = v93;
    *(_DWORD *)v92 = 136315138;
    swift_retain();
    uint64_t v94 = sub_237EF3118();
    unint64_t v96 = v95;
    swift_release();
    uint64_t v113 = sub_237EBC6BC(v94, v96, v114);
    sub_2380E4FC8();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_237EB8000, v90, v91, "AirPlayRouteProvider#startAirplayDiscovery Finished searching devices, setting output devices: %s", v92, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23EC87710](v93, -1, -1);
    MEMORY[0x23EC87710](v92, -1, -1);

    (*(void (**)(char *, uint64_t))(v25 + 8))(v108, v111);
  }
  else
  {

    swift_release_n();
    (*(void (**)(char *, uint64_t))(v25 + 8))(v88, v8);
  }
  if (*(unsigned char *)(a5 + 40) == 3)
  {
    if (qword_26894A830 != -1) {
      swift_once();
    }
    uint64_t v97 = qword_26894B9E0;
    v114[3] = type metadata accessor for SiriKitTaskLoggingProvider();
    v114[4] = (uint64_t)&protocol witness table for SiriKitTaskLoggingProvider;
    v114[0] = v97;
    type metadata accessor for PThreadMutex();
    swift_allocObject();
    swift_retain();
    uint64_t v98 = PThreadMutex.init(name:abortOnFail:analyticsService:)(0xD000000000000017, 0x80000002380FA690, 1, (uint64_t)v114);
    swift_beginAccess();
    *(void *)(a5 + 144) = v98;
    swift_release();
    if (*(void *)(a5 + 144))
    {
      swift_retain();
      sub_237FF140C();
      swift_release();
    }
  }
  swift_beginAccess();
  if (*(void *)(a5 + 136))
  {
    swift_retain();
    sub_237FF2080();
    swift_release();
  }
}

uint64_t sub_2380A27C0(void *a1)
{
  v81 = a1;
  uint64_t v2 = sub_2380E44F8();
  uint64_t v79 = *(void *)(v2 - 8);
  uint64_t v80 = v2;
  MEMORY[0x270FA5388](v2);
  v78 = (char *)v69 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_2380E4DF8();
  uint64_t v76 = *(void *)(v4 - 8);
  uint64_t v77 = v4;
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = (char *)v69 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v75 = sub_2380E4728();
  uint64_t v74 = *(void *)(v75 - 8);
  MEMORY[0x270FA5388](v75);
  uint64_t v8 = (char *)v69 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_2380E4528();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  uint64_t v13 = (char *)v69 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = MEMORY[0x270FA5388](v11);
  uint64_t v16 = (char *)v69 - v15;
  uint64_t v17 = MEMORY[0x270FA5388](v14);
  uint64_t v19 = (char *)v69 - v18;
  MEMORY[0x270FA5388](v17);
  uint64_t v21 = (char *)v69 - v20;
  uint64_t v82 = v1;
  uint64_t v22 = *(void *)(v1 + 16);
  if (v22)
  {
    if ((*(unsigned char *)(v22 + 40) & 0xFE) == 2)
    {
      swift_beginAccess();
      uint64_t v23 = *(void **)(v22 + 128);
      if (v23)
      {
        uint64_t v24 = qword_26894AA20;
        swift_retain();
        id v25 = v23;
        if (v24 != -1) {
          swift_once();
        }
        uint64_t v26 = __swift_project_value_buffer(v9, (uint64_t)qword_268956458);
        (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v21, v26, v9);
        uint64_t v73 = v25;
        uint64_t v27 = sub_2380E4508();
        os_log_type_t v28 = sub_2380E4D38();
        int v29 = v28;
        if (os_log_type_enabled(v27, v28))
        {
          os_log_t v72 = v27;
          uint64_t v30 = swift_slowAlloc();
          int v70 = v29;
          os_log_type_t v31 = (uint8_t *)v30;
          uint64_t v71 = swift_slowAlloc();
          v83[0] = v71;
          *(_DWORD *)os_log_type_t v31 = 136315138;
          v69[1] = v31 + 4;
          BOOL v32 = v73;
          uint64_t v84 = (uint64_t)v73;
          type metadata accessor for CFArray(0);
          v33 = v32;
          uint64_t v34 = sub_2380E4988();
          uint64_t v84 = sub_237EBC6BC(v34, v35, v83);
          sub_2380E4FC8();

          swift_bridgeObjectRelease();
          os_log_t v36 = v72;
          _os_log_impl(&dword_237EB8000, v72, (os_log_type_t)v70, "AirPlayRouteProvider#setOutputDevices Setting output devices... %s", v31, 0xCu);
          uint64_t v37 = v71;
          swift_arrayDestroy();
          MEMORY[0x23EC87710](v37, -1, -1);
          MEMORY[0x23EC87710](v31, -1, -1);
        }
        else
        {

          os_log_t v36 = v73;
        }

        (*(void (**)(char *, uint64_t))(v10 + 8))(v21, v9);
        sub_2380E46E8();
        sub_2380E4DD8();
        uint64_t v57 = (void *)_s16SiriAudioSupport14DispatchQueuesV5queue_3qos10attributesSo012OS_dispatch_F0CSS_0D00D3QoSVAhIE10AttributesVtFZ_0(0x79616C50726941, 0xE700000000000000, (uint64_t)v8, (uint64_t)v6);
        (*(void (**)(char *, uint64_t))(v76 + 8))(v6, v77);
        (*(void (**)(char *, uint64_t))(v74 + 8))(v8, v75);
        swift_beginAccess();
        uint64_t v58 = *(void **)(v22 + 32);
        *(void *)(v22 + 32) = v57;
        id v59 = v57;

        v60 = (uint64_t *)(v22 + 144);
        swift_beginAccess();
        if (!*(void *)(v22 + 144))
        {
          if (qword_26894A830 != -1) {
            swift_once();
          }
          uint64_t v61 = qword_26894B9E0;
          v83[3] = type metadata accessor for SiriKitTaskLoggingProvider();
          v83[4] = (uint64_t)&protocol witness table for SiriKitTaskLoggingProvider;
          v83[0] = v61;
          type metadata accessor for PThreadMutex();
          swift_allocObject();
          swift_retain();
          uint64_t *v60 = PThreadMutex.init(name:abortOnFail:analyticsService:)(0xD000000000000017, 0x80000002380FA690, 1, (uint64_t)v83);
          swift_release();
          if (*v60)
          {
            swift_retain();
            sub_237FF140C();
            swift_release();
          }
        }
        LOBYTE(v83[0]) = 4;
        sub_2380A51E8((unsigned __int8 *)v83);
        sub_2380E4EB8();
        if (qword_26894A818 != -1) {
          swift_once();
        }
        id v62 = v78;
        sub_2380E44E8();
        sub_2380E44B8();
        (*(void (**)(char *, uint64_t))(v79 + 8))(v62, v80);
        uint64_t v63 = v81[3];
        uint64_t v64 = v81[4];
        __swift_project_boxed_opaque_existential_1(v81, v63);
        v65 = (void *)swift_allocObject();
        v66 = v73;
        v65[2] = v73;
        v65[3] = v22;
        v65[4] = v82;
        id v67 = *(void (**)(NSObject *, id, void (*)(void *), void *, uint64_t, uint64_t))(v64 + 112);
        swift_retain();
        id v68 = v66;
        swift_retain();
        v67(v68, v59, sub_2380A69A8, v65, v63, v64);
        swift_release();

        return swift_release();
      }
      else
      {
        uint64_t v52 = qword_26894AA20;
        swift_retain();
        if (v52 != -1) {
          swift_once();
        }
        uint64_t v53 = __swift_project_value_buffer(v9, (uint64_t)qword_268956458);
        (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v19, v53, v9);
        id v54 = sub_2380E4508();
        os_log_type_t v55 = sub_2380E4D48();
        if (os_log_type_enabled(v54, v55))
        {
          id v56 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)id v56 = 0;
          _os_log_impl(&dword_237EB8000, v54, v55, "AirPlayRouteProvider#setOutputDevices No resolved output devices, will not be setting up routes", v56, 2u);
          MEMORY[0x23EC87710](v56, -1, -1);
          swift_release();
        }
        else
        {

          swift_release();
        }
        return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v19, v9);
      }
    }
    else
    {
      uint64_t v43 = qword_26894AA20;
      swift_retain();
      if (v43 != -1) {
        swift_once();
      }
      uint64_t v44 = __swift_project_value_buffer(v9, (uint64_t)qword_268956458);
      (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v16, v44, v9);
      swift_retain_n();
      v45 = sub_2380E4508();
      os_log_type_t v46 = sub_2380E4D48();
      if (os_log_type_enabled(v45, v46))
      {
        uint64_t v47 = swift_slowAlloc();
        uint64_t v82 = swift_slowAlloc();
        v83[0] = v82;
        *(_DWORD *)uint64_t v47 = 136315138;
        v81 = (void *)(v47 + 4);
        swift_retain();
        uint64_t v48 = sub_237EF3118();
        unint64_t v50 = v49;
        swift_release();
        uint64_t v85 = sub_237EBC6BC(v48, v50, v83);
        sub_2380E4FC8();
        swift_release_n();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_237EB8000, v45, v46, "AirPlayRouteProvider#setOutputDevices setOutputDevices is being triggered more than once or in wrong context %s", (uint8_t *)v47, 0xCu);
        uint64_t v51 = v82;
        swift_arrayDestroy();
        MEMORY[0x23EC87710](v51, -1, -1);
        MEMORY[0x23EC87710](v47, -1, -1);
        swift_release();
      }
      else
      {

        swift_release_n();
      }
      return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v16, v9);
    }
  }
  else
  {
    if (qword_26894AA20 != -1) {
      swift_once();
    }
    uint64_t v38 = __swift_project_value_buffer(v9, (uint64_t)qword_268956458);
    (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v13, v38, v9);
    v39 = sub_2380E4508();
    os_log_type_t v40 = sub_2380E4D48();
    if (os_log_type_enabled(v39, v40))
    {
      v41 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v41 = 0;
      _os_log_impl(&dword_237EB8000, v39, v40, "AirPlayRouteProvider#setOutputDevices Unable to retrieve AirPlayRouteSetupContext", v41, 2u);
      MEMORY[0x23EC87710](v41, -1, -1);
    }

    return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v13, v9);
  }
}

void sub_2380A3324(void *a1, const __CFArray *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v54 = a4;
  uint64_t v7 = sub_2380E4528();
  uint64_t v58 = *(void *)(v7 - 8);
  uint64_t v59 = v7;
  uint64_t v8 = MEMORY[0x270FA5388](v7);
  os_log_type_t v55 = (char *)&v53 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v57 = (char *)&v53 - v10;
  uint64_t v11 = sub_2380E44F8();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)&v53 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  CFArrayRef v56 = a2;
  CFIndex Count = CFArrayGetCount(a2);
  sub_2380E4EA8();
  if (qword_26894A818 != -1) {
    swift_once();
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26894B288);
  uint64_t v16 = swift_allocObject();
  uint64_t v17 = MEMORY[0x263F8D6C8];
  long long v53 = xmmword_2380E7450;
  *(_OWORD *)(v16 + 16) = xmmword_2380E7450;
  uint64_t v18 = MEMORY[0x263F8D750];
  *(void *)(v16 + 56) = v17;
  *(void *)(v16 + 64) = v18;
  *(void *)(v16 + 32) = Count;
  sub_2380E44E8();
  sub_2380E44B8();
  swift_bridgeObjectRelease();
  uint64_t v19 = *(void (**)(char *, uint64_t))(v12 + 8);
  v19(v14, v11);
  if (a1)
  {
    if (qword_26894AA20 != -1) {
      swift_once();
    }
    uint64_t v20 = v59;
    uint64_t v21 = __swift_project_value_buffer(v59, (uint64_t)qword_268956458);
    uint64_t v22 = v58;
    (*(void (**)(char *, uint64_t, uint64_t))(v58 + 16))(v57, v21, v20);
    id v23 = a1;
    id v24 = a1;
    id v25 = sub_2380E4508();
    os_log_type_t v26 = sub_2380E4D48();
    if (os_log_type_enabled(v25, v26))
    {
      uint64_t v27 = (uint8_t *)swift_slowAlloc();
      os_log_type_t v28 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v27 = 138412290;
      id v29 = a1;
      uint64_t v30 = _swift_stdlib_bridgeErrorToNSError();
      uint64_t v63 = v30;
      sub_2380E4FC8();
      *os_log_type_t v28 = v30;
      uint64_t v22 = v58;

      _os_log_impl(&dword_237EB8000, v25, v26, "AirPlayRouteProvider#setOutputDevices Error setting output devices: %@", v27, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26894C570);
      swift_arrayDestroy();
      uint64_t v20 = v59;
      MEMORY[0x23EC87710](v28, -1, -1);
      MEMORY[0x23EC87710](v27, -1, -1);
    }
    else
    {
    }
    (*(void (**)(char *, uint64_t))(v22 + 8))(v57, v20);
    swift_beginAccess();
    uint64_t v44 = *(void **)(a3 + 80);
    *(void *)(a3 + 80) = a1;
    id v45 = a1;

    os_log_type_t v46 = (void *)sub_2380E2B98();
    swift_beginAccess();
    *(unsigned char *)(a3 + 121) = 0;
    LOBYTE(v60[0]) = 6;
    sub_2380A51E8((unsigned __int8 *)v60);
    swift_beginAccess();
    if (*(void *)(a3 + 144))
    {
      swift_retain();
      sub_237FF2080();
      swift_release();
    }
    CFIndex v47 = CFArrayGetCount(v56);
    id v48 = objc_msgSend(v46, sel_code);
    id v49 = objc_msgSend(v46, sel_domain);
    uint64_t v50 = sub_2380E4938();
    uint64_t v52 = v51;

    sub_2380495EC((uint64_t)"siriAirPlaySetOutputDeviceError", 31, 2, (uint64_t)"deviceCount=%{public, signpost.telemetry:number1}d errorCode=%{public, signpost.telemetry:number2}d errorDomain=%{public, signpost.telemetry:string1}@ enableTelemetry=YES ", 171, 2, v47, (uint64_t)v48, v50, v52);
    swift_bridgeObjectRelease();
  }
  else
  {
    CFIndex v31 = CFArrayGetCount(v56);
    sub_2380E4EC8();
    uint64_t v32 = swift_allocObject();
    *(_OWORD *)(v32 + 16) = v53;
    *(void *)(v32 + 56) = MEMORY[0x263F8D6C8];
    *(void *)(v32 + 64) = MEMORY[0x263F8D750];
    *(void *)(v32 + 32) = v31;
    sub_2380E44E8();
    sub_2380E44B8();
    swift_bridgeObjectRelease();
    v19(v14, v11);
    swift_beginAccess();
    *(unsigned char *)(a3 + 121) = 1;
    v62[0] = 5;
    sub_2380A51E8(v62);
    swift_beginAccess();
    if (*(void *)(a3 + 144))
    {
      swift_retain();
      sub_237FF2080();
      swift_release();
    }
    uint64_t v34 = v58;
    uint64_t v33 = v59;
    uint64_t v36 = v54;
    unint64_t v35 = v55;
    if (qword_26894AA20 != -1) {
      swift_once();
    }
    uint64_t v37 = __swift_project_value_buffer(v33, (uint64_t)qword_268956458);
    (*(void (**)(char *, uint64_t, uint64_t))(v34 + 16))(v35, v37, v33);
    swift_retain_n();
    uint64_t v38 = sub_2380E4508();
    os_log_type_t v39 = sub_2380E4D38();
    if (os_log_type_enabled(v38, v39))
    {
      os_log_type_t v40 = (uint8_t *)swift_slowAlloc();
      uint64_t v41 = swift_slowAlloc();
      v60[0] = v41;
      *(_DWORD *)os_log_type_t v40 = 136315138;
      uint64_t v61 = *(void *)(v36 + 16);
      swift_retain();
      __swift_instantiateConcreteTypeFromMangledName(&qword_26894D3A0);
      uint64_t v42 = sub_2380E4988();
      uint64_t v61 = sub_237EBC6BC(v42, v43, v60);
      sub_2380E4FC8();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_237EB8000, v38, v39, "AirPlayRouteProvider#setOutputDevices Finished setting output devices: %s", v40, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x23EC87710](v41, -1, -1);
      MEMORY[0x23EC87710](v40, -1, -1);

      (*(void (**)(char *, uint64_t))(v34 + 8))(v55, v33);
    }
    else
    {

      swift_release_n();
      (*(void (**)(char *, uint64_t))(v34 + 8))(v35, v33);
    }
  }
}

uint64_t sub_2380A3B58(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = sub_2380E4528();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)&v36 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = MEMORY[0x270FA5388](v10);
  uint64_t v15 = (char *)&v36 - v14;
  MEMORY[0x270FA5388](v13);
  uint64_t v17 = (char *)&v36 - v16;
  uint64_t v18 = *(void *)(v4 + 16);
  if (v18)
  {
    LOBYTE(v39) = 3;
    swift_retain();
    sub_2380A51E8((unsigned __int8 *)&v39);
    sub_2380A062C(a1, a2, a3);
    sub_2380A4044();
    if (*(unsigned char *)(v18 + 40) == 6)
    {
      if (qword_26894AA20 != -1) {
        swift_once();
      }
      uint64_t v19 = __swift_project_value_buffer(v8, (uint64_t)qword_268956458);
      (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v15, v19, v8);
      swift_retain_n();
      uint64_t v20 = sub_2380E4508();
      os_log_type_t v21 = sub_2380E4D48();
      if (os_log_type_enabled(v20, v21))
      {
        uint64_t v22 = (uint8_t *)swift_slowAlloc();
        uint64_t v37 = swift_slowAlloc();
        uint64_t v39 = v37;
        *(_DWORD *)uint64_t v22 = 136315138;
        uint64_t v36 = v22 + 4;
        swift_retain();
        uint64_t v23 = sub_237EF3118();
        unint64_t v25 = v24;
        swift_release();
        uint64_t v38 = sub_237EBC6BC(v23, v25, &v39);
        sub_2380E4FC8();
        swift_release_n();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_237EB8000, v20, v21, "AirPlayRouteProvider#discoverAndSetOutputDevices Something went wrong discovering AirPlay routes while connecting to device that initiated remote execution request %s", v22, 0xCu);
        uint64_t v26 = v37;
        swift_arrayDestroy();
        MEMORY[0x23EC87710](v26, -1, -1);
        MEMORY[0x23EC87710](v22, -1, -1);
        swift_release();
      }
      else
      {

        swift_release_n();
      }
      return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v15, v8);
    }
    else
    {
      if (qword_26894AA20 != -1) {
        swift_once();
      }
      uint64_t v32 = __swift_project_value_buffer(v8, (uint64_t)qword_268956458);
      (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v17, v32, v8);
      uint64_t v33 = sub_2380E4508();
      os_log_type_t v34 = sub_2380E4D38();
      if (os_log_type_enabled(v33, v34))
      {
        unint64_t v35 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)unint64_t v35 = 0;
        _os_log_impl(&dword_237EB8000, v33, v34, "AirPlayRouteProvider#discoverAndSetOutputDevices Starting to set AirPlay routes. Device search has been completed", v35, 2u);
        MEMORY[0x23EC87710](v35, -1, -1);
      }

      (*(void (**)(char *, uint64_t))(v9 + 8))(v17, v8);
      sub_2380A27C0(a3);
      return swift_release();
    }
  }
  else
  {
    if (qword_26894AA20 != -1) {
      swift_once();
    }
    uint64_t v27 = __swift_project_value_buffer(v8, (uint64_t)qword_268956458);
    (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v12, v27, v8);
    os_log_type_t v28 = sub_2380E4508();
    os_log_type_t v29 = sub_2380E4D48();
    if (os_log_type_enabled(v28, v29))
    {
      uint64_t v30 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v30 = 0;
      _os_log_impl(&dword_237EB8000, v28, v29, "AirPlayRouteProvider#discoverAndSetOutputDevices Unable to retrieve AirPlayRouteSetupContext", v30, 2u);
      MEMORY[0x23EC87710](v30, -1, -1);
    }

    return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v12, v8);
  }
}

uint64_t sub_2380A4044()
{
  uint64_t v1 = sub_2380E4528();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = MEMORY[0x270FA5388](v1);
  uint64_t v5 = (char *)&v36 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = MEMORY[0x270FA5388](v3);
  uint64_t v8 = (char *)&v36 - v7;
  uint64_t v9 = MEMORY[0x270FA5388](v6);
  uint64_t v11 = (char *)&v36 - v10;
  MEMORY[0x270FA5388](v9);
  uint64_t v13 = (char *)&v36 - v12;
  uint64_t v14 = *(void *)(v0 + 16);
  if (v14)
  {
    swift_beginAccess();
    if (*(void *)(v14 + 136))
    {
      uint64_t v15 = qword_26894AA20;
      swift_retain();
      swift_retain();
      if (v15 != -1) {
        swift_once();
      }
      uint64_t v16 = __swift_project_value_buffer(v1, (uint64_t)qword_268956458);
      uint64_t v38 = *(void (**)(char *, uint64_t, uint64_t))(v2 + 16);
      v38(v13, v16, v1);
      uint64_t v17 = sub_2380E4508();
      os_log_type_t v18 = sub_2380E4D38();
      if (os_log_type_enabled(v17, v18))
      {
        uint64_t v19 = (uint8_t *)swift_slowAlloc();
        uint64_t v37 = v2;
        uint64_t v20 = v19;
        *(_WORD *)uint64_t v19 = 0;
        _os_log_impl(&dword_237EB8000, v17, v18, "AirPlayRouteProvider#waitForDeviceDiscovery Waiting to finish device search...", v19, 2u);
        os_log_type_t v21 = v20;
        uint64_t v2 = v37;
        MEMORY[0x23EC87710](v21, -1, -1);
      }

      uint64_t v22 = *(void (**)(char *, uint64_t))(v2 + 8);
      v22(v13, v1);
      sub_237FF140C();
      v38(v11, v16, v1);
      uint64_t v23 = sub_2380E4508();
      os_log_type_t v24 = sub_2380E4D38();
      if (os_log_type_enabled(v23, v24))
      {
        unint64_t v25 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)unint64_t v25 = 0;
        _os_log_impl(&dword_237EB8000, v23, v24, "AirPlayRouteProvider#waitForDeviceDiscovery Finished waiting for device search", v25, 2u);
        MEMORY[0x23EC87710](v25, -1, -1);
      }

      v22(v11, v1);
      sub_237FF2080();
      swift_release();
      return swift_release();
    }
    else
    {
      uint64_t v31 = qword_26894AA20;
      swift_retain();
      if (v31 != -1) {
        swift_once();
      }
      uint64_t v32 = __swift_project_value_buffer(v1, (uint64_t)qword_268956458);
      (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v8, v32, v1);
      uint64_t v33 = sub_2380E4508();
      os_log_type_t v34 = sub_2380E4D38();
      if (os_log_type_enabled(v33, v34))
      {
        unint64_t v35 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)unint64_t v35 = 0;
        _os_log_impl(&dword_237EB8000, v33, v34, "AirPlayRouteProvider#waitForDeviceDiscovery Not waiting for device search since lock is not set", v35, 2u);
        MEMORY[0x23EC87710](v35, -1, -1);
      }

      swift_release();
      return (*(uint64_t (**)(char *, uint64_t))(v2 + 8))(v8, v1);
    }
  }
  else
  {
    if (qword_26894AA20 != -1) {
      swift_once();
    }
    uint64_t v27 = __swift_project_value_buffer(v1, (uint64_t)qword_268956458);
    (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v5, v27, v1);
    os_log_type_t v28 = sub_2380E4508();
    os_log_type_t v29 = sub_2380E4D48();
    if (os_log_type_enabled(v28, v29))
    {
      uint64_t v30 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v30 = 0;
      _os_log_impl(&dword_237EB8000, v28, v29, "AirPlayRouteProvider#waitForDeviceDiscovery Unable to retrieve AirPlayRouteSetupContext", v30, 2u);
      MEMORY[0x23EC87710](v30, -1, -1);
    }

    return (*(uint64_t (**)(char *, uint64_t))(v2 + 8))(v5, v1);
  }
}

uint64_t sub_2380A4524()
{
  uint64_t v1 = sub_2380E4528();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = MEMORY[0x270FA5388](v1);
  uint64_t v5 = (char *)&v36 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = MEMORY[0x270FA5388](v3);
  uint64_t v8 = (char *)&v36 - v7;
  uint64_t v9 = MEMORY[0x270FA5388](v6);
  uint64_t v11 = (char *)&v36 - v10;
  MEMORY[0x270FA5388](v9);
  uint64_t v13 = (char *)&v36 - v12;
  uint64_t v14 = *(void *)(v0 + 16);
  if (v14)
  {
    swift_beginAccess();
    if (*(void *)(v14 + 144))
    {
      uint64_t v15 = qword_26894AA20;
      swift_retain();
      swift_retain();
      if (v15 != -1) {
        swift_once();
      }
      uint64_t v16 = __swift_project_value_buffer(v1, (uint64_t)qword_268956458);
      uint64_t v38 = *(void (**)(char *, uint64_t, uint64_t))(v2 + 16);
      v38(v13, v16, v1);
      uint64_t v17 = sub_2380E4508();
      os_log_type_t v18 = sub_2380E4D38();
      if (os_log_type_enabled(v17, v18))
      {
        uint64_t v19 = (uint8_t *)swift_slowAlloc();
        uint64_t v37 = v2;
        uint64_t v20 = v19;
        *(_WORD *)uint64_t v19 = 0;
        _os_log_impl(&dword_237EB8000, v17, v18, "AirPlayRouteProvider#waitForSetOutputDevices Waiting to finish route setup...", v19, 2u);
        os_log_type_t v21 = v20;
        uint64_t v2 = v37;
        MEMORY[0x23EC87710](v21, -1, -1);
      }

      uint64_t v22 = *(void (**)(char *, uint64_t))(v2 + 8);
      v22(v13, v1);
      sub_237FF140C();
      v38(v11, v16, v1);
      uint64_t v23 = sub_2380E4508();
      os_log_type_t v24 = sub_2380E4D38();
      if (os_log_type_enabled(v23, v24))
      {
        unint64_t v25 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)unint64_t v25 = 0;
        _os_log_impl(&dword_237EB8000, v23, v24, "AirPlayRouteProvider#waitForSetOutputDevices Finished waiting for route setup", v25, 2u);
        MEMORY[0x23EC87710](v25, -1, -1);
      }

      v22(v11, v1);
      sub_237FF2080();
      swift_release();
      return swift_release();
    }
    else
    {
      uint64_t v31 = qword_26894AA20;
      swift_retain();
      if (v31 != -1) {
        swift_once();
      }
      uint64_t v32 = __swift_project_value_buffer(v1, (uint64_t)qword_268956458);
      (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v8, v32, v1);
      uint64_t v33 = sub_2380E4508();
      os_log_type_t v34 = sub_2380E4D38();
      if (os_log_type_enabled(v33, v34))
      {
        unint64_t v35 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)unint64_t v35 = 0;
        _os_log_impl(&dword_237EB8000, v33, v34, "AirPlayRouteProvider#waitForSetOutputDevices Not waiting for route setup since lock is not set", v35, 2u);
        MEMORY[0x23EC87710](v35, -1, -1);
      }

      swift_release();
      return (*(uint64_t (**)(char *, uint64_t))(v2 + 8))(v8, v1);
    }
  }
  else
  {
    if (qword_26894AA20 != -1) {
      swift_once();
    }
    uint64_t v27 = __swift_project_value_buffer(v1, (uint64_t)qword_268956458);
    (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v5, v27, v1);
    os_log_type_t v28 = sub_2380E4508();
    os_log_type_t v29 = sub_2380E4D48();
    if (os_log_type_enabled(v28, v29))
    {
      uint64_t v30 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v30 = 0;
      _os_log_impl(&dword_237EB8000, v28, v29, "AirPlayRouteProvider#waitForSetOutputDevices Unable to retrieve AirPlayRouteSetupContext", v30, 2u);
      MEMORY[0x23EC87710](v30, -1, -1);
    }

    return (*(uint64_t (**)(char *, uint64_t))(v2 + 8))(v5, v1);
  }
}

uint64_t AirPlayRouteProvider.deinit()
{
  swift_release();
  return v0;
}

void sub_2380A4A24(uint64_t a1, void *a2, void *a3)
{
}

uint64_t sub_2380A4A48(void *a1)
{
  return sub_2380A27C0(a1);
}

uint64_t sub_2380A4A6C(uint64_t a1, void *a2, void *a3)
{
  return sub_2380A3B58(a1, a2, a3);
}

uint64_t sub_2380A4A90()
{
  return sub_2380A4044();
}

uint64_t sub_2380A4AB4()
{
  return sub_2380A4524();
}

void sub_2380A4AD8()
{
  id v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08958]), sel_init);
  uint64_t v1 = (void *)sub_2380E4918();
  objc_msgSend(v0, sel_setName_, v1);

  qword_26894D368 = (uint64_t)v0;
}

void sub_2380A4B50()
{
  off_26894D370 = (_UNKNOWN *)MEMORY[0x263F8EE80];
}

uint64_t sub_2380A4B64()
{
  uint64_t v0 = sub_2380E4DF8();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)&v10 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_2380E4728();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2380E4708();
  sub_2380E4DD8();
  uint64_t v8 = _s16SiriAudioSupport14DispatchQueuesV5queue_3qos10attributesSo012OS_dispatch_F0CSS_0D00D3QoSVAhIE10AttributesVtFZ_0(0xD00000000000001FLL, 0x80000002380FACC0, (uint64_t)v7, (uint64_t)v3);
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  qword_26894D378 = v8;
  return result;
}

uint64_t sub_2380A4CFC()
{
  uint64_t v0 = sub_2380E4688();
  __swift_allocate_value_buffer(v0, qword_26894D380);
  *(void *)__swift_project_value_buffer(v0, (uint64_t)qword_26894D380) = 60;
  uint64_t v1 = *(uint64_t (**)(void))(*(void *)(v0 - 8) + 104);
  return v1();
}

id sub_2380A4D8C(uint64_t a1, unint64_t a2)
{
  uint64_t v14 = a1;
  uint64_t v3 = sub_2380E4528();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26894AA20 != -1) {
    swift_once();
  }
  uint64_t v7 = __swift_project_value_buffer(v3, (uint64_t)qword_268956458);
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, v7, v3);
  swift_bridgeObjectRetain_n();
  uint64_t v8 = sub_2380E4508();
  os_log_type_t v9 = sub_2380E4D58();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v10 = (uint8_t *)swift_slowAlloc();
    uint64_t v11 = swift_slowAlloc();
    v16[0] = v11;
    *(_DWORD *)uint64_t v10 = 136446210;
    swift_bridgeObjectRetain();
    uint64_t v15 = sub_237EBC6BC(v14, a2, v16);
    sub_2380E4FC8();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_237EB8000, v8, v9, "AirPlayRouteSetupContext#sharedCompletion Removing old context with refId: %{public}s", v10, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23EC87710](v11, -1, -1);
    MEMORY[0x23EC87710](v10, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  if (qword_26894AB90 != -1) {
    swift_once();
  }
  objc_msgSend((id)qword_26894D368, sel_lock);
  if (qword_26894AB98 != -1) {
    swift_once();
  }
  swift_beginAccess();
  sub_23807B7DC(v14, a2);
  swift_endAccess();
  swift_release();
  return objc_msgSend((id)qword_26894D368, sel_unlock);
}

void sub_2380A50A4(void **a1, uint64_t *a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = *a2;
  swift_beginAccess();
  uint64_t v4 = *(void **)(v3 + 32);
  *(void *)(v3 + 32) = v2;
  id v5 = v2;
}

void *sub_2380A50FC()
{
  swift_beginAccess();
  uint64_t v1 = *(void **)(v0 + 32);
  id v2 = v1;
  return v1;
}

void sub_2380A5140(uint64_t a1)
{
  swift_beginAccess();
  uint64_t v3 = *(void **)(v1 + 32);
  *(void *)(v1 + 32) = a1;
}

uint64_t (*sub_2380A5188())()
{
  return j_j__swift_endAccess;
}

void sub_2380A51DC(unsigned char *a1@<X8>)
{
  *a1 = *(unsigned char *)(v1 + 40);
}

uint64_t sub_2380A51E8(unsigned __int8 *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_2380E4528();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  uint64_t v8 = &v41[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v6);
  uint64_t v10 = &v41[-v9];
  LODWORD(v11) = *a1;
  if (*(unsigned __int8 *)(v2 + 40) >= v11)
  {
    if (qword_26894AA20 != -1) {
      swift_once();
    }
    uint64_t v26 = __swift_project_value_buffer(v4, (uint64_t)qword_268956458);
    (*(void (**)(unsigned char *, uint64_t, uint64_t))(v5 + 16))(v10, v26, v4);
    swift_retain_n();
    uint64_t v27 = sub_2380E4508();
    os_log_type_t v28 = sub_2380E4D48();
    int v29 = v28;
    if (os_log_type_enabled(v27, v28))
    {
      uint64_t v30 = swift_slowAlloc();
      int v44 = v11;
      uint64_t v11 = v30;
      uint64_t v43 = swift_slowAlloc();
      uint64_t v46 = v43;
      *(_DWORD *)uint64_t v11 = 136315650;
      int v42 = v29;
      LOBYTE(v45) = *(unsigned char *)(v2 + 40);
      uint64_t v31 = sub_2380E4988();
      uint64_t v45 = sub_237EBC6BC(v31, v32, &v46);
      sub_2380E4FC8();
      swift_release_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v11 + 12) = 2080;
      LOBYTE(v45) = v44;
      uint64_t v33 = sub_2380E4988();
      uint64_t v45 = sub_237EBC6BC(v33, v34, &v46);
      sub_2380E4FC8();
      swift_bridgeObjectRelease();
      *(_WORD *)(v11 + 22) = 2080;
      swift_retain();
      uint64_t v35 = sub_237EF3118();
      unint64_t v37 = v36;
      swift_release();
      uint64_t v45 = sub_237EBC6BC(v35, v37, &v46);
      sub_2380E4FC8();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_237EB8000, v27, (os_log_type_t)v42, "AirPlayRouteSetupContext#state Invalid state being set, old = %s, new = %s, context: %s", (uint8_t *)v11, 0x20u);
      uint64_t v38 = v43;
      swift_arrayDestroy();
      MEMORY[0x23EC87710](v38, -1, -1);
      uint64_t v39 = v11;
      LOBYTE(v11) = v44;
      MEMORY[0x23EC87710](v39, -1, -1);
    }
    else
    {

      swift_release_n();
    }
    uint64_t result = (*(uint64_t (**)(unsigned char *, uint64_t))(v5 + 8))(v10, v4);
  }
  else
  {
    if (qword_26894AA20 != -1) {
      swift_once();
    }
    uint64_t v12 = __swift_project_value_buffer(v4, (uint64_t)qword_268956458);
    (*(void (**)(unsigned char *, uint64_t, uint64_t))(v5 + 16))(v8, v12, v4);
    swift_retain_n();
    uint64_t v13 = sub_2380E4508();
    os_log_type_t v14 = sub_2380E4D38();
    int v15 = v14;
    if (os_log_type_enabled(v13, v14))
    {
      uint64_t v16 = swift_slowAlloc();
      int v44 = v11;
      uint64_t v11 = v16;
      uint64_t v43 = swift_slowAlloc();
      uint64_t v46 = v43;
      *(_DWORD *)uint64_t v11 = 136315650;
      int v42 = v15;
      LOBYTE(v45) = *(unsigned char *)(v2 + 40);
      uint64_t v17 = sub_2380E4988();
      uint64_t v45 = sub_237EBC6BC(v17, v18, &v46);
      sub_2380E4FC8();
      swift_release_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v11 + 12) = 2080;
      LOBYTE(v45) = v44;
      uint64_t v19 = sub_2380E4988();
      uint64_t v45 = sub_237EBC6BC(v19, v20, &v46);
      sub_2380E4FC8();
      swift_bridgeObjectRelease();
      *(_WORD *)(v11 + 22) = 2080;
      swift_retain();
      uint64_t v21 = sub_237EF3118();
      unint64_t v23 = v22;
      swift_release();
      uint64_t v45 = sub_237EBC6BC(v21, v23, &v46);
      sub_2380E4FC8();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_237EB8000, v13, (os_log_type_t)v42, "AirPlayRouteSetupContext#state Valid state being set, old = %s, new = %s, context: %s", (uint8_t *)v11, 0x20u);
      uint64_t v24 = v43;
      swift_arrayDestroy();
      MEMORY[0x23EC87710](v24, -1, -1);
      uint64_t v25 = v11;
      LOBYTE(v11) = v44;
      MEMORY[0x23EC87710](v25, -1, -1);
    }
    else
    {

      swift_release_n();
    }
    uint64_t result = (*(uint64_t (**)(unsigned char *, uint64_t))(v5 + 8))(v8, v4);
  }
  *(unsigned char *)(v2 + 40) = v11;
  return result;
}

uint64_t AirPlayRouteSetupState.rawValue.getter()
{
  return *v0;
}

uint64_t (*sub_2380A57B4(uint64_t a1))(uint64_t a1, char a2)
{
  *(void *)a1 = v1;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(v1 + 40);
  return sub_2380A57E0;
}

uint64_t sub_2380A57E0(uint64_t a1, char a2)
{
  if (a2)
  {
    char v4 = *(unsigned char *)(a1 + 8);
    uint64_t v2 = (unsigned __int8 *)&v4;
  }
  else
  {
    char v5 = *(unsigned char *)(a1 + 8);
    uint64_t v2 = (unsigned __int8 *)&v5;
  }
  return sub_2380A51E8(v2);
}

uint64_t sub_2380A5828(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = *a2;
  swift_beginAccess();
  *(void *)(v3 + 48) = v2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2380A5888()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_2380A58C0(uint64_t a1)
{
  swift_beginAccess();
  *(void *)(v1 + 48) = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_2380A5908())()
{
  return j_j__swift_endAccess;
}

void sub_2380A595C(void **a1, uint64_t *a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = *a2;
  swift_beginAccess();
  char v4 = *(void **)(v3 + 56);
  *(void *)(v3 + 56) = v2;
  id v5 = v2;
}

void *sub_2380A59BC()
{
  swift_beginAccess();
  uint64_t v1 = *(void **)(v0 + 56);
  id v2 = v1;
  return v1;
}

void sub_2380A5A04(uint64_t a1)
{
  swift_beginAccess();
  uint64_t v3 = *(void **)(v1 + 56);
  *(void *)(v1 + 56) = a1;
}

uint64_t (*sub_2380A5A4C())()
{
  return j__swift_endAccess;
}

void sub_2380A5AA0(void **a1, uint64_t *a2)
{
  id v2 = *a1;
  uint64_t v3 = *a2;
  swift_beginAccess();
  char v4 = *(void **)(v3 + 64);
  *(void *)(v3 + 64) = v2;
  id v5 = v2;
}

void *sub_2380A5B00()
{
  swift_beginAccess();
  uint64_t v1 = *(void **)(v0 + 64);
  id v2 = v1;
  return v1;
}

void sub_2380A5B48(uint64_t a1)
{
  swift_beginAccess();
  uint64_t v3 = *(void **)(v1 + 64);
  *(void *)(v1 + 64) = a1;
}

uint64_t (*sub_2380A5B90())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_2380A5BE4()
{
  swift_beginAccess();
  return *(unsigned __int8 *)(v0 + 72);
}

uint64_t sub_2380A5C18(char a1)
{
  uint64_t result = swift_beginAccess();
  *(unsigned char *)(v1 + 72) = a1;
  return result;
}

uint64_t (*sub_2380A5C58())()
{
  return j_j__swift_endAccess;
}

void sub_2380A5CAC(void **a1, uint64_t *a2)
{
  id v2 = *a1;
  uint64_t v3 = *a2;
  swift_beginAccess();
  char v4 = *(void **)(v3 + 80);
  *(void *)(v3 + 80) = v2;
  id v5 = v2;
}

void *sub_2380A5D0C()
{
  swift_beginAccess();
  uint64_t v1 = *(void **)(v0 + 80);
  id v2 = v1;
  return v1;
}

void sub_2380A5D54(uint64_t a1)
{
  swift_beginAccess();
  uint64_t v3 = *(void **)(v1 + 80);
  *(void *)(v1 + 80) = a1;
}

uint64_t (*sub_2380A5D9C())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_2380A5DF0()
{
  swift_beginAccess();
  return *(unsigned __int8 *)(v0 + 88);
}

uint64_t sub_2380A5E24(char a1)
{
  uint64_t result = swift_beginAccess();
  *(unsigned char *)(v1 + 88) = a1;
  return result;
}

uint64_t (*sub_2380A5E64())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_2380A5EB8()
{
  swift_beginAccess();
  return *(void *)(v0 + 96);
}

uint64_t sub_2380A5EF0(uint64_t a1, char a2)
{
  uint64_t result = swift_beginAccess();
  *(void *)(v2 + 96) = a1;
  *(unsigned char *)(v2 + 104) = a2 & 1;
  return result;
}

uint64_t (*sub_2380A5F44())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_2380A5F98()
{
  swift_beginAccess();
  return *(void *)(v0 + 112);
}

uint64_t sub_2380A5FD0(uint64_t a1, char a2)
{
  uint64_t result = swift_beginAccess();
  *(void *)(v2 + 112) = a1;
  *(unsigned char *)(v2 + 120) = a2 & 1;
  return result;
}

uint64_t (*sub_2380A6024())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_2380A6078()
{
  swift_beginAccess();
  return *(unsigned __int8 *)(v0 + 121);
}

uint64_t sub_2380A60AC(char a1)
{
  uint64_t result = swift_beginAccess();
  *(unsigned char *)(v1 + 121) = a1;
  return result;
}

uint64_t (*sub_2380A60EC())()
{
  return j_j__swift_endAccess;
}

void sub_2380A6140(void **a1, uint64_t *a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = *a2;
  swift_beginAccess();
  char v4 = *(void **)(v3 + 128);
  *(void *)(v3 + 128) = v2;
  id v5 = v2;
}

void *sub_2380A6198()
{
  swift_beginAccess();
  uint64_t v1 = *(void **)(v0 + 128);
  id v2 = v1;
  return v1;
}

void sub_2380A61DC(uint64_t a1)
{
  swift_beginAccess();
  uint64_t v3 = *(void **)(v1 + 128);
  *(void *)(v1 + 128) = a1;
}

uint64_t (*sub_2380A6224())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_2380A6278(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = *a2;
  swift_beginAccess();
  *(void *)(v3 + 136) = v2;
  swift_retain();
  return swift_release();
}

uint64_t sub_2380A62D8()
{
  return swift_retain();
}

uint64_t sub_2380A6310(uint64_t a1)
{
  swift_beginAccess();
  *(void *)(v1 + 136) = a1;
  return swift_release();
}

uint64_t (*sub_2380A6358())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_2380A63AC(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = *a2;
  swift_beginAccess();
  *(void *)(v3 + 144) = v2;
  swift_retain();
  return swift_release();
}

uint64_t sub_2380A640C()
{
  return swift_retain();
}

uint64_t sub_2380A6444(uint64_t a1)
{
  swift_beginAccess();
  *(void *)(v1 + 144) = a1;
  return swift_release();
}

uint64_t (*sub_2380A648C())()
{
  return j_j__swift_endAccess;
}

SiriAudioSupport::AirPlayRouteSetupState_optional __swiftcall AirPlayRouteSetupState.init(rawValue:)(Swift::Int rawValue)
{
  char v2 = 7;
  if ((unint64_t)rawValue < 7) {
    char v2 = rawValue;
  }
  *uint64_t v1 = v2;
  return (SiriAudioSupport::AirPlayRouteSetupState_optional)rawValue;
}

SiriAudioSupport::AirPlayRouteSetupState_optional sub_2380A64F4(Swift::Int *a1)
{
  return AirPlayRouteSetupState.init(rawValue:)(*a1);
}

uint64_t sub_2380A64FC(uint64_t (*a1)(void))
{
  uint64_t result = a1();
  if (result) {
    return _swift_stdlib_bridgeErrorToNSError();
  }
  return result;
}

uint64_t sub_2380A652C()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 40, 7);
}

id sub_2380A6564()
{
  return sub_2380A4D8C(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

void sub_2380A6570(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = sub_2380E4528();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26894AA20 != -1) {
    swift_once();
  }
  uint64_t v9 = __swift_project_value_buffer(v5, (uint64_t)qword_268956458);
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, v9, v5);
  swift_bridgeObjectRetain_n();
  uint64_t v10 = sub_2380E4508();
  os_log_type_t v11 = sub_2380E4D28();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v27 = a3;
    uint64_t v12 = swift_slowAlloc();
    uint64_t v26 = a2;
    uint64_t v13 = (uint8_t *)v12;
    uint64_t v25 = swift_slowAlloc();
    aBlock[0] = v25;
    *(_DWORD *)uint64_t v13 = 136315138;
    v24[1] = v13 + 4;
    uint64_t v14 = swift_bridgeObjectRetain();
    uint64_t v15 = MEMORY[0x23EC86140](v14, MEMORY[0x263F8D310]);
    unint64_t v17 = v16;
    swift_bridgeObjectRelease();
    uint64_t v28 = sub_237EBC6BC(v15, v17, aBlock);
    sub_2380E4FC8();
    swift_bridgeObjectRelease_n();
    a3 = v27;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_237EB8000, v10, v11, "AirPlayRouteProvider#decodeHashedRouteUIDs Decoding hashedRouteUIDs: %s", v13, 0xCu);
    uint64_t v18 = v25;
    swift_arrayDestroy();
    MEMORY[0x23EC87710](v18, -1, -1);
    uint64_t v19 = v13;
    a2 = v26;
    MEMORY[0x23EC87710](v19, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  id v20 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F54798]), sel_init);
  uint64_t v21 = swift_allocObject();
  *(void *)(v21 + 16) = a2;
  *(void *)(v21 + 24) = a3;
  swift_retain();
  unint64_t v22 = (void *)sub_2380E4B08();
  aBlock[4] = (uint64_t)sub_2380A79BC;
  aBlock[5] = v21;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_2380ACF04;
  aBlock[3] = (uint64_t)&block_descriptor_62_0;
  unint64_t v23 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  objc_msgSend(v20, sel_decodeHashedRouteUIDs_completion_, v22, v23);
  _Block_release(v23);

  swift_release();
}

uint64_t sub_2380A6904@<X0>(uint64_t *a1@<X8>)
{
  return sub_2380A1130(*(void **)(v1 + 16), a1);
}

void sub_2380A690C(uint64_t *a1@<X8>)
{
  sub_2380A1598(*(void **)(v1 + 24), a1);
}

uint64_t sub_2380A6914()
{
  swift_bridgeObjectRelease();
  swift_release();
  return MEMORY[0x270FA0238](v0, 40, 7);
}

void sub_2380A6954(void *a1, uint64_t a2, void (*a3)(void, void))
{
  sub_2380A1884(a1, a2, a3, *(void *)(v3 + 16), *(void *)(v3 + 24));
}

uint64_t sub_2380A6960()
{
  swift_release();
  swift_release();
  return MEMORY[0x270FA0238](v0, 40, 7);
}

void sub_2380A69A8(void *a1)
{
  sub_2380A3324(a1, *(const __CFArray **)(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32));
}

unint64_t sub_2380A69B8()
{
  unint64_t result = qword_26894D398;
  if (!qword_26894D398)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26894D398);
  }
  return result;
}

id sub_2380A6A0C@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_beginAccess();
  char v4 = *(void **)(v3 + 32);
  *a2 = v4;
  return v4;
}

uint64_t sub_2380A6A68@<X0>(uint64_t result@<X0>, unsigned char *a2@<X8>)
{
  *a2 = *(unsigned char *)(*(void *)result + 40);
  return result;
}

uint64_t sub_2380A6A78(unsigned __int8 *a1)
{
  unsigned __int8 v2 = *a1;
  return sub_2380A51E8(&v2);
}

uint64_t sub_2380A6AB0@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_beginAccess();
  *a2 = *(void *)(v3 + 48);
  return swift_bridgeObjectRetain();
}

id sub_2380A6B00@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_beginAccess();
  char v4 = *(void **)(v3 + 56);
  *a2 = v4;
  return v4;
}

id sub_2380A6B50@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_beginAccess();
  char v4 = *(void **)(v3 + 64);
  *a2 = v4;
  return v4;
}

uint64_t sub_2380A6BA0@<X0>(uint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v3 = *a1;
  uint64_t result = swift_beginAccess();
  *a2 = *(unsigned char *)(v3 + 72);
  return result;
}

uint64_t sub_2380A6BE8(char *a1, uint64_t *a2)
{
  char v2 = *a1;
  uint64_t v3 = *a2;
  uint64_t result = swift_beginAccess();
  *(unsigned char *)(v3 + 72) = v2;
  return result;
}

id sub_2380A6C2C@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_beginAccess();
  char v4 = *(void **)(v3 + 80);
  *a2 = v4;
  return v4;
}

uint64_t sub_2380A6C7C@<X0>(uint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v3 = *a1;
  uint64_t result = swift_beginAccess();
  *a2 = *(unsigned char *)(v3 + 88);
  return result;
}

uint64_t sub_2380A6CC4(char *a1, uint64_t *a2)
{
  char v2 = *a1;
  uint64_t v3 = *a2;
  uint64_t result = swift_beginAccess();
  *(unsigned char *)(v3 + 88) = v2;
  return result;
}

uint64_t sub_2380A6D08@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *a1;
  uint64_t result = swift_beginAccess();
  char v5 = *(unsigned char *)(v3 + 104);
  *(void *)a2 = *(void *)(v3 + 96);
  *(unsigned char *)(a2 + 8) = v5;
  return result;
}

uint64_t sub_2380A6D58(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a1;
  char v3 = *((unsigned char *)a1 + 8);
  uint64_t v4 = *a2;
  uint64_t result = swift_beginAccess();
  *(void *)(v4 + 96) = v2;
  *(unsigned char *)(v4 + 104) = v3;
  return result;
}

uint64_t sub_2380A6DAC@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *a1;
  uint64_t result = swift_beginAccess();
  char v5 = *(unsigned char *)(v3 + 120);
  *(void *)a2 = *(void *)(v3 + 112);
  *(unsigned char *)(a2 + 8) = v5;
  return result;
}

uint64_t sub_2380A6DFC(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a1;
  char v3 = *((unsigned char *)a1 + 8);
  uint64_t v4 = *a2;
  uint64_t result = swift_beginAccess();
  *(void *)(v4 + 112) = v2;
  *(unsigned char *)(v4 + 120) = v3;
  return result;
}

uint64_t sub_2380A6E50@<X0>(uint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v3 = *a1;
  uint64_t result = swift_beginAccess();
  *a2 = *(unsigned char *)(v3 + 121);
  return result;
}

uint64_t sub_2380A6E98(char *a1, uint64_t *a2)
{
  char v2 = *a1;
  uint64_t v3 = *a2;
  uint64_t result = swift_beginAccess();
  *(unsigned char *)(v3 + 121) = v2;
  return result;
}

id sub_2380A6EDC@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_beginAccess();
  uint64_t v4 = *(void **)(v3 + 128);
  *a2 = v4;
  return v4;
}

uint64_t sub_2380A6F38@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_beginAccess();
  *a2 = *(void *)(v3 + 136);
  return swift_retain();
}

uint64_t sub_2380A6F88@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_beginAccess();
  *a2 = *(void *)(v3 + 144);
  return swift_retain();
}

uint64_t method lookup function for AirPlayRouteProvider(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for AirPlayRouteProvider);
}

uint64_t dispatch thunk of AirPlayRouteProvider.__allocating_init(refId:)()
{
  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t dispatch thunk of AirPlayRouteProvider.getRouteIdsFrom(intent:completion:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 104))();
}

uint64_t dispatch thunk of AirPlayRouteProvider.startAirplayDiscovery(for:deviceProvider:mediaRemoteAPIProvider:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 112))();
}

uint64_t dispatch thunk of AirPlayRouteProvider.setOutputDevices(_:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 120))();
}

uint64_t dispatch thunk of AirPlayRouteProvider.discoverAndSetOutputDevices(for:deviceProvider:mediaRemoteAPIProvider:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 128))();
}

uint64_t dispatch thunk of AirPlayRouteProvider.waitForDeviceDiscovery()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 136))();
}

uint64_t dispatch thunk of AirPlayRouteProvider.waitForSetOutputDevices()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 144))();
}

uint64_t method lookup function for AirPlayRouteSetupContext(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for AirPlayRouteSetupContext);
}

uint64_t dispatch thunk of AirPlayRouteSetupContext.outputDevicesReplyQueue.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 208))();
}

uint64_t dispatch thunk of AirPlayRouteSetupContext.outputDevicesReplyQueue.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 216))();
}

uint64_t dispatch thunk of AirPlayRouteSetupContext.outputDevicesReplyQueue.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 224))();
}

uint64_t dispatch thunk of AirPlayRouteSetupContext.state.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 256))();
}

uint64_t dispatch thunk of AirPlayRouteSetupContext.state.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 264))();
}

uint64_t dispatch thunk of AirPlayRouteSetupContext.state.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 272))();
}

uint64_t dispatch thunk of AirPlayRouteSetupContext.airPlayRouteIDs.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 280))();
}

uint64_t dispatch thunk of AirPlayRouteSetupContext.airPlayRouteIDs.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 288))();
}

uint64_t dispatch thunk of AirPlayRouteSetupContext.airPlayRouteIDs.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 296))();
}

uint64_t dispatch thunk of AirPlayRouteSetupContext.audioSessionCategorySetupError.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 304))();
}

uint64_t dispatch thunk of AirPlayRouteSetupContext.audioSessionCategorySetupError.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 312))();
}

uint64_t dispatch thunk of AirPlayRouteSetupContext.audioSessionCategorySetupError.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 320))();
}

uint64_t dispatch thunk of AirPlayRouteSetupContext.deviceDiscoveryError.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 328))();
}

uint64_t dispatch thunk of AirPlayRouteSetupContext.deviceDiscoveryError.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 336))();
}

uint64_t dispatch thunk of AirPlayRouteSetupContext.deviceDiscoveryError.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 344))();
}

uint64_t dispatch thunk of AirPlayRouteSetupContext.isPartialError.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 352))();
}

uint64_t dispatch thunk of AirPlayRouteSetupContext.isPartialError.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 360))();
}

uint64_t dispatch thunk of AirPlayRouteSetupContext.isPartialError.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 368))();
}

uint64_t dispatch thunk of AirPlayRouteSetupContext.deviceRouteSetupError.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 376))();
}

uint64_t dispatch thunk of AirPlayRouteSetupContext.deviceRouteSetupError.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 384))();
}

uint64_t dispatch thunk of AirPlayRouteSetupContext.deviceRouteSetupError.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 392))();
}

uint64_t dispatch thunk of AirPlayRouteSetupContext.errorReported.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 400))();
}

uint64_t dispatch thunk of AirPlayRouteSetupContext.errorReported.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 408))();
}

uint64_t dispatch thunk of AirPlayRouteSetupContext.errorReported.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 416))();
}

uint64_t dispatch thunk of AirPlayRouteSetupContext.devicesAttemptedCount.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 424))();
}

uint64_t dispatch thunk of AirPlayRouteSetupContext.devicesAttemptedCount.setter(uint64_t a1, char a2)
{
  return (*(uint64_t (**)(uint64_t, void))(*(void *)v2 + 432))(a1, a2 & 1);
}

uint64_t dispatch thunk of AirPlayRouteSetupContext.devicesAttemptedCount.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 440))();
}

uint64_t dispatch thunk of AirPlayRouteSetupContext.devicesFoundCount.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 448))();
}

uint64_t dispatch thunk of AirPlayRouteSetupContext.devicesFoundCount.setter(uint64_t a1, char a2)
{
  return (*(uint64_t (**)(uint64_t, void))(*(void *)v2 + 456))(a1, a2 & 1);
}

uint64_t dispatch thunk of AirPlayRouteSetupContext.devicesFoundCount.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 464))();
}

uint64_t dispatch thunk of AirPlayRouteSetupContext.routeSetupSuccessful.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 472))();
}

uint64_t dispatch thunk of AirPlayRouteSetupContext.routeSetupSuccessful.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 480))();
}

uint64_t dispatch thunk of AirPlayRouteSetupContext.routeSetupSuccessful.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 488))();
}

uint64_t dispatch thunk of AirPlayRouteSetupContext.resolvedOutputDevices.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 496))();
}

uint64_t dispatch thunk of AirPlayRouteSetupContext.resolvedOutputDevices.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 504))();
}

uint64_t dispatch thunk of AirPlayRouteSetupContext.resolvedOutputDevices.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 512))();
}

uint64_t dispatch thunk of AirPlayRouteSetupContext.discoveryLock.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 520))();
}

uint64_t dispatch thunk of AirPlayRouteSetupContext.discoveryLock.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 528))();
}

uint64_t dispatch thunk of AirPlayRouteSetupContext.discoveryLock.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 536))();
}

uint64_t dispatch thunk of AirPlayRouteSetupContext.routeSetupLock.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 544))();
}

uint64_t dispatch thunk of AirPlayRouteSetupContext.routeSetupLock.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 552))();
}

uint64_t dispatch thunk of AirPlayRouteSetupContext.routeSetupLock.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 560))();
}

uint64_t dispatch thunk of AirPlayRouteSetupContext.description.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 568))();
}

unsigned char *storeEnumTagSinglePayload for AirPlayRouteSetupState(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 6 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 6) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFA) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF9)
  {
    unsigned int v6 = ((a2 - 250) >> 8) + 1;
    *uint64_t result = a2 + 6;
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
        JUMPOUT(0x2380A7954);
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
          *uint64_t result = a2 + 6;
        break;
    }
  }
  return result;
}

uint64_t sub_2380A797C()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_2380A79B4(uint64_t a1)
{
  return sub_2380A0230(a1, *(void (**)(void))(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_2380A79BC(uint64_t a1)
{
  return sub_23809FF48(a1, *(void (**)(void))(v1 + 16));
}

void sub_2380A79D0()
{
  qword_2689565D8 = (uint64_t)&unk_26EAF7378;
}

uint64_t sub_2380A79E4(uint64_t a1)
{
  uint64_t v2 = sub_2380E4528();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)v19 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26894AA20 != -1) {
    swift_once();
  }
  uint64_t v6 = __swift_project_value_buffer(v2, (uint64_t)qword_268956458);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v6, v2);
  swift_retain_n();
  uint64_t v7 = sub_2380E4508();
  os_log_type_t v8 = sub_2380E4D58();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    uint64_t v10 = swift_slowAlloc();
    uint64_t v21 = v10;
    *(_DWORD *)uint64_t v9 = 136446210;
    uint64_t v23 = v10;
    v19[1] = v9 + 4;
    id v20 = v9;
    os_log_type_t v11 = *(uint64_t (**)(uint64_t))(*(void *)a1 + 104);
    uint64_t v12 = swift_retain();
    uint64_t v13 = v11(v12);
    unint64_t v15 = v14;
    swift_release();
    uint64_t v22 = sub_237EBC6BC(v13, v15, &v23);
    sub_2380E4FC8();
    swift_release_n();
    swift_bridgeObjectRelease();
    unint64_t v16 = v20;
    _os_log_impl(&dword_237EB8000, v7, v8, "RemoteSongPlaybackHandler#collectionID Getting collectionID for %{public}s. Returning nil for song or list of songs", v20, 0xCu);
    uint64_t v17 = v21;
    swift_arrayDestroy();
    MEMORY[0x23EC87710](v17, -1, -1);
    MEMORY[0x23EC87710](v16, -1, -1);
  }
  else
  {

    swift_release_n();
  }
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return 0;
}

uint64_t sub_2380A7C8C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = swift_allocObject();
  uint64_t v9 = __swift_mutable_project_boxed_opaque_existential_1(a1, *(void *)(a1 + 24));
  MEMORY[0x270FA5388](v9);
  os_log_type_t v11 = (uint64_t *)((char *)&v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v12 + 16))(v11);
  uint64_t v13 = __swift_mutable_project_boxed_opaque_existential_1(a3, *(void *)(a3 + 24));
  MEMORY[0x270FA5388](v13);
  unint64_t v15 = (_OWORD *)((char *)&v23 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(_OWORD *))(v16 + 16))(v15);
  uint64_t v17 = __swift_mutable_project_boxed_opaque_existential_1(a4, *(void *)(a4 + 24));
  MEMORY[0x270FA5388](v17);
  uint64_t v19 = (_OWORD *)((char *)&v23 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(_OWORD *))(v20 + 16))(v19);
  uint64_t v21 = sub_2380A83C0(*v11, a2, v15, v19, v8);
  __swift_destroy_boxed_opaque_existential_1(a4);
  __swift_destroy_boxed_opaque_existential_1(a3);
  __swift_destroy_boxed_opaque_existential_1(a1);
  return v21;
}

uint64_t type metadata accessor for RemoteSongPlaybackHandler()
{
  return self;
}

uint64_t sub_2380A7F18(uint64_t a1, uint64_t a2, _OWORD *a3, _OWORD *a4, uint64_t a5)
{
  uint64_t v10 = type metadata accessor for MediaPlaybackProvider();
  v55[3] = v10;
  v55[4] = &off_26EB042B8;
  v55[0] = a1;
  v54[3] = &type metadata for PlaybackStarter;
  v54[4] = &off_26EAFF468;
  os_log_type_t v11 = (_OWORD *)swift_allocObject();
  v54[0] = v11;
  long long v12 = a3[3];
  v11[3] = a3[2];
  v11[4] = v12;
  v11[5] = a3[4];
  long long v13 = a3[1];
  v11[1] = *a3;
  v11[2] = v13;
  uint64_t v52 = &type metadata for PlaybackQueueLocationProvider;
  long long v53 = &off_26EAFA520;
  uint64_t v14 = (_OWORD *)swift_allocObject();
  *(void *)&long long v51 = v14;
  long long v15 = a4[3];
  v14[3] = a4[2];
  v14[4] = v15;
  v14[5] = a4[4];
  long long v16 = a4[1];
  v14[1] = *a4;
  v14[2] = v16;
  sub_237ECEFFC((uint64_t)v55, a5 + 16);
  sub_237ECEFFC(a2, a5 + 56);
  sub_237ECEFFC((uint64_t)v54, a5 + 104);
  sub_237ECEFFC((uint64_t)v55, (uint64_t)v50);
  sub_237ECEFFC(a2, (uint64_t)v49);
  sub_237ECEFFC((uint64_t)v54, (uint64_t)v48);
  uint64_t v17 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v50, v50[3]);
  MEMORY[0x270FA5388](v17);
  uint64_t v19 = (void *)((char *)&v44[-1] - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v20 + 16))(v19);
  uint64_t v21 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v48, v48[3]);
  MEMORY[0x270FA5388](v21);
  uint64_t v23 = (_OWORD *)((char *)&v44[-1] - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(_OWORD *))(v24 + 16))(v23);
  uint64_t v25 = *v19;
  v47[3] = v10;
  v47[4] = &off_26EB042B8;
  uint64_t v46 = &off_26EAFF468;
  v47[0] = v25;
  uint64_t v45 = &type metadata for PlaybackStarter;
  uint64_t v26 = (_OWORD *)swift_allocObject();
  v44[0] = v26;
  long long v27 = v23[3];
  v26[3] = v23[2];
  v26[4] = v27;
  v26[5] = v23[4];
  long long v28 = v23[1];
  v26[1] = *v23;
  v26[2] = v28;
  type metadata accessor for LocalPlaybackHelper();
  int v29 = (void *)swift_allocObject();
  uint64_t v30 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v47, v10);
  MEMORY[0x270FA5388](v30);
  unint64_t v32 = (void *)((char *)&v44[-1] - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v33 + 16))(v32);
  uint64_t v34 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v44, (uint64_t)v45);
  MEMORY[0x270FA5388](v34);
  unint64_t v36 = (_OWORD *)((char *)&v44[-1] - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(_OWORD *))(v37 + 16))(v36);
  uint64_t v38 = *v32;
  v29[5] = v10;
  v29[6] = &off_26EB042B8;
  v29[2] = v38;
  v29[15] = &type metadata for PlaybackStarter;
  v29[16] = &off_26EAFF468;
  uint64_t v39 = (_OWORD *)swift_allocObject();
  v29[12] = v39;
  long long v40 = v36[3];
  v39[3] = v36[2];
  v39[4] = v40;
  v39[5] = v36[4];
  long long v41 = v36[1];
  v39[1] = *v36;
  v39[2] = v41;
  sub_237EC4D08(v49, (uint64_t)(v29 + 7));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v44);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v47);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v48);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v50);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v54);
  __swift_destroy_boxed_opaque_existential_1(a2);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v55);
  *(void *)(a5 + 96) = v29;
  sub_237EC4D08(&v51, a5 + 144);
  return a5;
}

uint64_t sub_2380A83C0(uint64_t a1, uint64_t a2, _OWORD *a3, _OWORD *a4, uint64_t a5)
{
  v37[3] = type metadata accessor for MediaPlaybackProvider();
  v37[4] = &off_26EB042B8;
  v37[0] = a1;
  v36[3] = &type metadata for PlaybackStarter;
  v36[4] = &off_26EAFF468;
  uint64_t v10 = (_OWORD *)swift_allocObject();
  v36[0] = v10;
  long long v11 = a3[3];
  v10[3] = a3[2];
  v10[4] = v11;
  v10[5] = a3[4];
  long long v12 = a3[1];
  v10[1] = *a3;
  v10[2] = v12;
  v35[3] = &type metadata for PlaybackQueueLocationProvider;
  v35[4] = &off_26EAFA520;
  long long v13 = (_OWORD *)swift_allocObject();
  v35[0] = v13;
  long long v14 = a4[3];
  v13[3] = a4[2];
  v13[4] = v14;
  v13[5] = a4[4];
  long long v15 = a4[1];
  v13[1] = *a4;
  v13[2] = v15;
  sub_237ECEFFC((uint64_t)v37, (uint64_t)v34);
  sub_237ECEFFC(a2, (uint64_t)v33);
  sub_237ECEFFC((uint64_t)v36, (uint64_t)v32);
  sub_237ECEFFC((uint64_t)v35, (uint64_t)v31);
  uint64_t v16 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v34, v34[3]);
  MEMORY[0x270FA5388](v16);
  uint64_t v18 = (uint64_t *)((char *)&v31[-1] - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v19 + 16))(v18);
  uint64_t v20 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v32, v32[3]);
  MEMORY[0x270FA5388](v20);
  uint64_t v22 = (_OWORD *)((char *)&v31[-1] - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(_OWORD *))(v23 + 16))(v22);
  uint64_t v24 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v31, v31[3]);
  MEMORY[0x270FA5388](v24);
  uint64_t v26 = (_OWORD *)((char *)&v31[-1] - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(_OWORD *))(v27 + 16))(v26);
  uint64_t v28 = sub_2380A7F18(*v18, (uint64_t)v33, v22, v26, a5);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v31);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v32);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v34);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v35);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v36);
  __swift_destroy_boxed_opaque_existential_1(a2);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v37);
  return v28;
}

uint64_t sub_2380A870C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return (*(uint64_t (**)(void))(a9 + 8))();
}

uint64_t sub_2380A8728(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  return (*(uint64_t (**)(void))(a14 + 16))();
}

uint64_t sub_2380A875C(uint64_t a1)
{
  uint64_t v26 = a1 + 64;
  uint64_t v2 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v3 = -1;
  if (v2 < 64) {
    uint64_t v3 = ~(-1 << v2);
  }
  unint64_t v4 = v3 & *(void *)(a1 + 64);
  int64_t v5 = (unint64_t)(v2 + 63) >> 6;
  swift_bridgeObjectRetain();
  int64_t v6 = 0;
  uint64_t v7 = (void *)MEMORY[0x263F8EE78];
  while (1)
  {
    if (v4)
    {
      unint64_t v8 = __clz(__rbit64(v4));
      v4 &= v4 - 1;
      unint64_t v9 = v8 | (v6 << 6);
    }
    else
    {
      int64_t v10 = v6 + 1;
      if (__OFADD__(v6, 1)) {
        goto LABEL_47;
      }
      if (v10 >= v5)
      {
LABEL_42:
        swift_release();
        return (uint64_t)v7;
      }
      unint64_t v11 = *(void *)(v26 + 8 * v10);
      ++v6;
      if (!v11)
      {
        int64_t v6 = v10 + 1;
        if (v10 + 1 >= v5) {
          goto LABEL_42;
        }
        unint64_t v11 = *(void *)(v26 + 8 * v6);
        if (!v11)
        {
          int64_t v6 = v10 + 2;
          if (v10 + 2 >= v5) {
            goto LABEL_42;
          }
          unint64_t v11 = *(void *)(v26 + 8 * v6);
          if (!v11)
          {
            int64_t v6 = v10 + 3;
            if (v10 + 3 >= v5) {
              goto LABEL_42;
            }
            unint64_t v11 = *(void *)(v26 + 8 * v6);
            if (!v11)
            {
              int64_t v12 = v10 + 4;
              if (v12 >= v5) {
                goto LABEL_42;
              }
              unint64_t v11 = *(void *)(v26 + 8 * v12);
              if (!v11)
              {
                while (1)
                {
                  int64_t v6 = v12 + 1;
                  if (__OFADD__(v12, 1)) {
                    goto LABEL_48;
                  }
                  if (v6 >= v5) {
                    goto LABEL_42;
                  }
                  unint64_t v11 = *(void *)(v26 + 8 * v6);
                  ++v12;
                  if (v11) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v6 = v12;
            }
          }
        }
      }
LABEL_23:
      unint64_t v4 = (v11 - 1) & v11;
      unint64_t v9 = __clz(__rbit64(v11)) + (v6 << 6);
    }
    uint64_t v13 = *(void *)(*(void *)(a1 + 56) + 8 * v9);
    uint64_t v14 = *(void *)(v13 + 16);
    int64_t v15 = v7[2];
    int64_t v16 = v15 + v14;
    if (__OFADD__(v15, v14)) {
      break;
    }
    swift_bridgeObjectRetain();
    isUniquelyReferenced_nonNull_native = (void *)swift_isUniquelyReferenced_nonNull_native();
    if (isUniquelyReferenced_nonNull_native && v16 <= v7[3] >> 1)
    {
      if (!*(void *)(v13 + 16)) {
        goto LABEL_4;
      }
    }
    else
    {
      if (v15 <= v16) {
        int64_t v18 = v15 + v14;
      }
      else {
        int64_t v18 = v15;
      }
      uint64_t v7 = sub_237EBEE8C(isUniquelyReferenced_nonNull_native, v18, 1, v7);
      if (!*(void *)(v13 + 16))
      {
LABEL_4:
        if (v14) {
          goto LABEL_44;
        }
        goto LABEL_5;
      }
    }
    uint64_t v19 = v7[2];
    if ((v7[3] >> 1) - v19 < v14) {
      goto LABEL_45;
    }
    unint64_t v20 = (unint64_t)&v7[2 * v19 + 4];
    if (v13 + 32 < v20 + 16 * v14 && v20 < v13 + 32 + 16 * v14) {
      goto LABEL_49;
    }
    swift_arrayInitWithCopy();
    if (v14)
    {
      uint64_t v22 = v7[2];
      BOOL v23 = __OFADD__(v22, v14);
      uint64_t v24 = v22 + v14;
      if (v23) {
        goto LABEL_46;
      }
      v7[2] = v24;
    }
LABEL_5:
    swift_bridgeObjectRelease();
  }
  __break(1u);
LABEL_44:
  __break(1u);
LABEL_45:
  __break(1u);
LABEL_46:
  __break(1u);
LABEL_47:
  __break(1u);
LABEL_48:
  __break(1u);
LABEL_49:
  uint64_t result = sub_2380E5318();
  __break(1u);
  return result;
}

uint64_t sub_2380A8A00()
{
  uint64_t result = sub_237FEBBD0((uint64_t)&unk_26EAF4AE8);
  qword_26894D3A8 = result;
  return result;
}

void *sub_2380A8A28()
{
  __swift_instantiateConcreteTypeFromMangledName(qword_26894D3B8);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_2380F0210;
  *(void *)(inited + 32) = 0xD000000000000019;
  *(void *)(inited + 40) = 0x80000002380F0EE0;
  *(void *)(inited + 48) = sub_237FEBBD0((uint64_t)&unk_26EAF7BD0);
  *(void *)(inited + 56) = 0xD000000000000014;
  *(void *)(inited + 64) = 0x80000002380F0E80;
  if (qword_26894ABB8 != -1) {
    swift_once();
  }
  *(void *)(inited + 72) = qword_26894D3A8;
  *(void *)(inited + 80) = 0xD000000000000017;
  *(void *)(inited + 88) = 0x80000002380F0EC0;
  swift_bridgeObjectRetain();
  *(void *)(inited + 96) = sub_237FEBBD0((uint64_t)&unk_26EAF7BF8);
  *(void *)(inited + 104) = 0xD000000000000014;
  *(void *)(inited + 112) = 0x80000002380F0EA0;
  *(void *)(inited + 120) = sub_237FEBBD0((uint64_t)&unk_26EAF7C40);
  *(void *)(inited + 128) = 0xD000000000000014;
  *(void *)(inited + 136) = 0x80000002380F0F20;
  *(void *)(inited + 144) = sub_237FEBBD0((uint64_t)&unk_26EAF7C78);
  uint64_t result = (void *)sub_237FD00A0(inited);
  off_26894D3B0 = result;
  return result;
}

uint64_t sub_2380A8B74(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (!*(void *)(a3 + 16)) {
    return MEMORY[0x263F8EE78];
  }
  uint64_t v7 = (void *)swift_bridgeObjectRetain();
  LOBYTE(a4) = sub_2380AB930(v7, a4);
  swift_bridgeObjectRelease();
  if ((a4 & 1) == 0) {
    return MEMORY[0x263F8EE78];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26894B1E0);
  uint64_t v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_2380E7450;
  *(void *)(v8 + 32) = a1;
  *(void *)(v8 + 40) = a2;
  swift_bridgeObjectRetain();
  return v8;
}

unint64_t *sub_2380A8C14(uint64_t isStackAllocationSafe)
{
  uint64_t v2 = (unint64_t *)isStackAllocationSafe;
  v9[1] = *MEMORY[0x263EF8340];
  char v3 = *(unsigned char *)(isStackAllocationSafe + 32);
  unint64_t v4 = (unint64_t)((1 << v3) + 63) >> 6;
  size_t v5 = 8 * v4;
  if ((v3 & 0x3Fu) <= 0xD
    || (isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), (isStackAllocationSafe & 1) != 0))
  {
    MEMORY[0x270FA5388](isStackAllocationSafe);
    bzero((char *)v9 - ((v5 + 15) & 0x3FFFFFFFFFFFFFF0), v5);
    int64_t v6 = sub_2380A8D6C((void *)((char *)v9 - ((v5 + 15) & 0x3FFFFFFFFFFFFFF0)), v4, (uint64_t)v2);
    if (v1) {
      swift_willThrow();
    }
    else {
      return v6;
    }
  }
  else
  {
    uint64_t v7 = (void *)swift_slowAlloc();
    bzero(v7, v5);
    uint64_t v2 = sub_2380A8D6C((unint64_t *)v7, v4, (uint64_t)v2);
    MEMORY[0x23EC87710](v7, -1, -1);
  }
  return v2;
}

unint64_t *sub_2380A8D6C(unint64_t *result, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = 0;
  int64_t v5 = 0;
  uint64_t v6 = a3 + 64;
  uint64_t v7 = 1 << *(unsigned char *)(a3 + 32);
  uint64_t v8 = -1;
  if (v7 < 64) {
    uint64_t v8 = ~(-1 << v7);
  }
  unint64_t v9 = v8 & *(void *)(a3 + 64);
  int64_t v10 = (unint64_t)(v7 + 63) >> 6;
  while (1)
  {
    if (v9)
    {
      unint64_t v11 = __clz(__rbit64(v9));
      v9 &= v9 - 1;
      unint64_t v12 = v11 | (v5 << 6);
      goto LABEL_5;
    }
    int64_t v13 = v5 + 1;
    if (__OFADD__(v5, 1))
    {
      __break(1u);
      goto LABEL_26;
    }
    if (v13 >= v10) {
      return (unint64_t *)sub_2380D94B0(result, a2, v4, a3);
    }
    unint64_t v14 = *(void *)(v6 + 8 * v13);
    ++v5;
    if (!v14)
    {
      int64_t v5 = v13 + 1;
      if (v13 + 1 >= v10) {
        return (unint64_t *)sub_2380D94B0(result, a2, v4, a3);
      }
      unint64_t v14 = *(void *)(v6 + 8 * v5);
      if (!v14)
      {
        int64_t v5 = v13 + 2;
        if (v13 + 2 >= v10) {
          return (unint64_t *)sub_2380D94B0(result, a2, v4, a3);
        }
        unint64_t v14 = *(void *)(v6 + 8 * v5);
        if (!v14) {
          break;
        }
      }
    }
LABEL_20:
    unint64_t v9 = (v14 - 1) & v14;
    unint64_t v12 = __clz(__rbit64(v14)) + (v5 << 6);
LABEL_5:
    if (*(void *)(*(void *)(a3 + 56) + 8 * v12) == 1)
    {
      *(unint64_t *)((char *)result + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
      if (__OFADD__(v4++, 1))
      {
        __break(1u);
        return (unint64_t *)sub_2380D94B0(result, a2, v4, a3);
      }
    }
  }
  int64_t v15 = v13 + 3;
  if (v15 >= v10) {
    return (unint64_t *)sub_2380D94B0(result, a2, v4, a3);
  }
  unint64_t v14 = *(void *)(v6 + 8 * v15);
  if (v14)
  {
    int64_t v5 = v15;
    goto LABEL_20;
  }
  while (1)
  {
    int64_t v5 = v15 + 1;
    if (__OFADD__(v15, 1)) {
      break;
    }
    if (v5 >= v10) {
      return (unint64_t *)sub_2380D94B0(result, a2, v4, a3);
    }
    unint64_t v14 = *(void *)(v6 + 8 * v5);
    ++v15;
    if (v14) {
      goto LABEL_20;
    }
  }
LABEL_26:
  __break(1u);
  return result;
}

uint64_t sub_2380A8EBC(uint64_t a1, uint64_t (*a2)(uint64_t, uint64_t, uint64_t))
{
  uint64_t v3 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v4 = -1;
  if (v3 < 64) {
    uint64_t v4 = ~(-1 << v3);
  }
  unint64_t v5 = v4 & *(void *)(a1 + 64);
  int64_t v31 = (unint64_t)(v3 + 63) >> 6;
  swift_bridgeObjectRetain();
  int64_t v6 = 0;
  uint64_t v7 = (void *)MEMORY[0x263F8EE78];
  while (1)
  {
    if (v5)
    {
      unint64_t v8 = __clz(__rbit64(v5));
      v5 &= v5 - 1;
      unint64_t v9 = v8 | (v6 << 6);
    }
    else
    {
      int64_t v10 = v6 + 1;
      if (__OFADD__(v6, 1)) {
        goto LABEL_47;
      }
      if (v10 >= v31)
      {
LABEL_42:
        swift_release();
        return (uint64_t)v7;
      }
      unint64_t v11 = *(void *)(v30 + 8 * v10);
      ++v6;
      if (!v11)
      {
        int64_t v6 = v10 + 1;
        if (v10 + 1 >= v31) {
          goto LABEL_42;
        }
        unint64_t v11 = *(void *)(v30 + 8 * v6);
        if (!v11)
        {
          int64_t v6 = v10 + 2;
          if (v10 + 2 >= v31) {
            goto LABEL_42;
          }
          unint64_t v11 = *(void *)(v30 + 8 * v6);
          if (!v11)
          {
            int64_t v6 = v10 + 3;
            if (v10 + 3 >= v31) {
              goto LABEL_42;
            }
            unint64_t v11 = *(void *)(v30 + 8 * v6);
            if (!v11)
            {
              int64_t v12 = v10 + 4;
              if (v12 >= v31) {
                goto LABEL_42;
              }
              unint64_t v11 = *(void *)(v30 + 8 * v12);
              if (!v11)
              {
                while (1)
                {
                  int64_t v6 = v12 + 1;
                  if (__OFADD__(v12, 1)) {
                    goto LABEL_48;
                  }
                  if (v6 >= v31) {
                    goto LABEL_42;
                  }
                  unint64_t v11 = *(void *)(v30 + 8 * v6);
                  ++v12;
                  if (v11) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v6 = v12;
            }
          }
        }
      }
LABEL_23:
      unint64_t v5 = (v11 - 1) & v11;
      unint64_t v9 = __clz(__rbit64(v11)) + (v6 << 6);
    }
    int64_t v13 = (uint64_t *)(*(void *)(a1 + 48) + 16 * v9);
    uint64_t v14 = *v13;
    uint64_t v15 = v13[1];
    uint64_t v16 = *(void *)(*(void *)(a1 + 56) + 8 * v9);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v17 = a2(v14, v15, v16);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v18 = *(void *)(v17 + 16);
    int64_t v19 = v7[2];
    int64_t v20 = v19 + v18;
    if (__OFADD__(v19, v18)) {
      break;
    }
    isUniquelyReferenced_nonNull_native = (void *)swift_isUniquelyReferenced_nonNull_native();
    if (isUniquelyReferenced_nonNull_native && v20 <= v7[3] >> 1)
    {
      if (!*(void *)(v17 + 16)) {
        goto LABEL_4;
      }
    }
    else
    {
      if (v19 <= v20) {
        int64_t v22 = v19 + v18;
      }
      else {
        int64_t v22 = v19;
      }
      uint64_t v7 = sub_237EBEE8C(isUniquelyReferenced_nonNull_native, v22, 1, v7);
      if (!*(void *)(v17 + 16))
      {
LABEL_4:
        if (v18) {
          goto LABEL_44;
        }
        goto LABEL_5;
      }
    }
    uint64_t v23 = v7[2];
    if ((v7[3] >> 1) - v23 < v18) {
      goto LABEL_45;
    }
    unint64_t v24 = (unint64_t)&v7[2 * v23 + 4];
    if (v17 + 32 < v24 + 16 * v18 && v24 < v17 + 32 + 16 * v18) {
      goto LABEL_49;
    }
    swift_arrayInitWithCopy();
    if (v18)
    {
      uint64_t v26 = v7[2];
      BOOL v27 = __OFADD__(v26, v18);
      uint64_t v28 = v26 + v18;
      if (v27) {
        goto LABEL_46;
      }
      v7[2] = v28;
    }
LABEL_5:
    swift_bridgeObjectRelease();
  }
  __break(1u);
LABEL_44:
  __break(1u);
LABEL_45:
  __break(1u);
LABEL_46:
  __break(1u);
LABEL_47:
  __break(1u);
LABEL_48:
  __break(1u);
LABEL_49:
  uint64_t result = sub_2380E5318();
  __break(1u);
  return result;
}

uint64_t sub_2380A91C0(uint64_t *a1, uint64_t *a2, uint64_t a3, unint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  uint64_t v113 = a8;
  uint64_t v119 = a6;
  uint64_t v122 = a5;
  v117 = a1;
  uint64_t v120 = sub_2380E4528();
  uint64_t v121 = *(void *)(v120 - 8);
  uint64_t v17 = MEMORY[0x270FA5388](v120);
  v110 = (char *)&v107 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = MEMORY[0x270FA5388](v17);
  uint64_t v111 = (char *)&v107 - v20;
  uint64_t v21 = MEMORY[0x270FA5388](v19);
  uint64_t v112 = (char *)&v107 - v22;
  uint64_t v23 = MEMORY[0x270FA5388](v21);
  uint64_t v25 = (char *)&v107 - v24;
  uint64_t v26 = MEMORY[0x270FA5388](v23);
  uint64_t v116 = (char *)&v107 - v27;
  MEMORY[0x270FA5388](v26);
  int v29 = (char *)&v107 - v28;
  uint64_t v31 = *a2;
  unint64_t v30 = a2[1];
  double v126 = 0.0;
  LODWORD(a3) = sub_237EE54E4(v31, v30, a3);
  LODWORD(a4) = sub_237EE54E4(v31, v30, a4);
  int v114 = a3;
  v118 = v25;
  if ((a3 & 1) == 0) {
    goto LABEL_8;
  }
  if (!*(void *)(v122 + 16))
  {
    __break(1u);
    goto LABEL_90;
  }
  uint64_t v109 = a7;
  double v126 = *(double *)(v122 + 32) + 0.0;
  if (qword_26894AA20 != -1) {
LABEL_90:
  }
    swift_once();
  uint64_t v33 = v120;
  uint64_t v34 = __swift_project_value_buffer(v120, (uint64_t)qword_268956458);
  (*(void (**)(char *, uint64_t, uint64_t))(v121 + 16))(v29, v34, v33);
  swift_bridgeObjectRetain_n();
  uint64_t v35 = sub_2380E4508();
  os_log_type_t v36 = sub_2380E4D38();
  if (os_log_type_enabled(v35, v36))
  {
    uint64_t v37 = swift_slowAlloc();
    int v115 = a4;
    a4 = v37;
    uint64_t v38 = swift_slowAlloc();
    v125[0] = v38;
    *(_DWORD *)a4 = 136315394;
    swift_bridgeObjectRetain();
    v124[0] = sub_237EBC6BC(v31, v30, v125);
    uint64_t v13 = v31;
    sub_2380E4FC8();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(a4 + 12) = 2048;
    swift_beginAccess();
    *(double *)v124 = v126;
    sub_2380E4FC8();
    _os_log_impl(&dword_237EB8000, v35, v36, "VisionQuest21#vq21 support_flag for %s, score: %f", (uint8_t *)a4, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x23EC87710](v38, -1, -1);
    unint64_t v39 = a4;
    LODWORD(a4) = v115;
    MEMORY[0x23EC87710](v39, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  (*(void (**)(char *, uint64_t))(v121 + 8))(v29, v120);
  a7 = v109;
  uint64_t v25 = v118;
LABEL_8:
  if ((a4 & 1) == 0) {
    goto LABEL_14;
  }
  if (*(void *)(v122 + 16) < 2uLL)
  {
    __break(1u);
  }
  else
  {
    double v40 = *(double *)(v122 + 40);
    swift_beginAccess();
    double v126 = v40 + v126;
    if (qword_26894AA20 == -1) {
      goto LABEL_11;
    }
  }
  swift_once();
LABEL_11:
  uint64_t v41 = v120;
  uint64_t v42 = __swift_project_value_buffer(v120, (uint64_t)qword_268956458);
  uint64_t v43 = v116;
  (*(void (**)(char *, uint64_t, uint64_t))(v121 + 16))(v116, v42, v41);
  swift_bridgeObjectRetain_n();
  int v44 = sub_2380E4508();
  os_log_type_t v45 = sub_2380E4D38();
  if (os_log_type_enabled(v44, v45))
  {
    uint64_t v46 = swift_slowAlloc();
    int v115 = a4;
    a4 = v46;
    uint64_t v108 = swift_slowAlloc();
    v125[0] = v108;
    *(_DWORD *)a4 = 136315394;
    swift_bridgeObjectRetain();
    v124[0] = sub_237EBC6BC(v31, v30, v125);
    uint64_t v109 = v31;
    uint64_t v13 = v120;
    uint64_t v25 = v118;
    sub_2380E4FC8();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(a4 + 12) = 2048;
    *(double *)v124 = v126;
    uint64_t v31 = v109;
    sub_2380E4FC8();
    _os_log_impl(&dword_237EB8000, v44, v45, "VisionQuest21#vq21 unicorn_flag for %s, score: %f", (uint8_t *)a4, 0x16u);
    uint64_t v47 = v108;
    swift_arrayDestroy();
    MEMORY[0x23EC87710](v47, -1, -1);
    unint64_t v48 = a4;
    LODWORD(a4) = v115;
    MEMORY[0x23EC87710](v48, -1, -1);

    (*(void (**)(char *, uint64_t))(v121 + 8))(v43, v13);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    (*(void (**)(char *, uint64_t))(v121 + 8))(v43, v120);
  }
LABEL_14:
  if ((sub_237EE54E4(v31, v30, v119) & 1) == 0) {
    goto LABEL_20;
  }
  if (*(void *)(v122 + 16) < 3uLL)
  {
    __break(1u);
  }
  else
  {
    double v49 = *(double *)(v122 + 48);
    swift_beginAccess();
    double v126 = v49 + v126;
    if (qword_26894AA20 == -1) {
      goto LABEL_17;
    }
  }
  swift_once();
LABEL_17:
  uint64_t v50 = v120;
  uint64_t v51 = __swift_project_value_buffer(v120, (uint64_t)qword_268956458);
  (*(void (**)(char *, uint64_t, uint64_t))(v121 + 16))(v25, v51, v50);
  swift_bridgeObjectRetain_n();
  uint64_t v52 = sub_2380E4508();
  os_log_type_t v53 = sub_2380E4D38();
  if (os_log_type_enabled(v52, v53))
  {
    uint64_t v54 = swift_slowAlloc();
    int v115 = a4;
    a4 = v54;
    uint64_t v13 = swift_slowAlloc();
    v125[0] = v13;
    *(_DWORD *)a4 = 136315394;
    swift_bridgeObjectRetain();
    v124[0] = sub_237EBC6BC(v31, v30, v125);
    uint64_t v109 = v31;
    uint64_t v55 = v120;
    sub_2380E4FC8();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(a4 + 12) = 2048;
    *(double *)v124 = v126;
    uint64_t v31 = v109;
    sub_2380E4FC8();
    _os_log_impl(&dword_237EB8000, v52, v53, "VisionQuest21#vq21 support_unicorn_match for %s, score: %f", (uint8_t *)a4, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x23EC87710](v13, -1, -1);
    unint64_t v56 = a4;
    LOBYTE(a4) = v115;
    MEMORY[0x23EC87710](v56, -1, -1);

    (*(void (**)(char *, uint64_t))(v121 + 8))(v118, v55);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    (*(void (**)(char *, uint64_t))(v121 + 8))(v25, v120);
  }
LABEL_20:
  if (a7)
  {
    if (qword_26894ABB8 != -1) {
      goto LABEL_88;
    }
    while (1)
    {
      BOOL v58 = sub_237EE5328(a7, qword_26894D3A8);
      uint64_t v59 = *(void *)(a10 + 16);
      if (a4 & 1 | !v58 || ((v114 ^ 1) & 1) != 0) {
        break;
      }
      if (v59)
      {
        swift_bridgeObjectRetain();
        unint64_t v60 = sub_237EC9470(v31, v30);
        double v61 = 0.0;
        if (v62) {
          double v61 = *(double *)(*(void *)(a10 + 56) + 8 * v60);
        }
        swift_bridgeObjectRelease();
      }
      else
      {
        double v61 = 0.0;
      }
      a4 = *(void *)(v122 + 16);
      if (a4 < 5)
      {
        __break(1u);
LABEL_98:
        swift_once();
LABEL_57:
        uint64_t v90 = v120;
        uint64_t v91 = __swift_project_value_buffer(v120, (uint64_t)qword_268956458);
        uint64_t v13 = (uint64_t)v111;
        (*(void (**)(char *, uint64_t, uint64_t))(v121 + 16))(v111, v91, v90);
        uint64_t v92 = *(void *)&v126;
        swift_bridgeObjectRetain_n();
        uint64_t v77 = sub_2380E4508();
        os_log_type_t v78 = sub_2380E4D38();
        if (!os_log_type_enabled(v77, v78)) {
          goto LABEL_80;
        }
        uint64_t v79 = swift_slowAlloc();
        uint64_t v80 = swift_slowAlloc();
        v124[0] = v80;
        *(_DWORD *)uint64_t v79 = 136315394;
        swift_bridgeObjectRetain();
        uint64_t v123 = sub_237EBC6BC(v31, v30, v124);
        sub_2380E4FC8();
        swift_bridgeObjectRelease_n();
        *(_WORD *)(v79 + 12) = 2048;
        uint64_t v123 = v92;
        sub_2380E4FC8();
        v81 = "VisionQuest21#vq21 music type contains for %s, score: %f";
        goto LABEL_79;
      }
      double v82 = v61 * *(double *)(v122 + 64);
      uint64_t result = swift_beginAccess();
      double v126 = v82 + v126;
      if (*(void *)(a9 + 16))
      {
        swift_bridgeObjectRetain();
        a10 = a9;
        unint64_t v84 = sub_237EC9470(v31, v30);
        double v85 = 0.0;
        if (v86) {
          double v85 = *(double *)(*(void *)(a9 + 56) + 8 * v84);
        }
        uint64_t result = swift_bridgeObjectRelease();
        if (a4 < 6)
        {
LABEL_83:
          __break(1u);
          goto LABEL_84;
        }
      }
      else
      {
        double v85 = 0.0;
        if (a4 < 6) {
          goto LABEL_83;
        }
      }
      double v126 = v126 + v85 * *(double *)(v122 + 72);
      if (!*(void *)(a11 + 16)) {
        goto LABEL_86;
      }
      swift_bridgeObjectRetain();
      a10 = a11;
      unint64_t v87 = sub_237EC9470(v31, v30);
      double v88 = 0.0;
      if (v89) {
        double v88 = *(double *)(*(void *)(a11 + 56) + 8 * v87);
      }
      swift_bridgeObjectRelease();
      if (a4 >= 7)
      {
LABEL_56:
        double v126 = v126 + v88 * *(double *)(v122 + 80);
        if (qword_26894AA20 != -1) {
          goto LABEL_98;
        }
        goto LABEL_57;
      }
LABEL_87:
      __break(1u);
LABEL_88:
      swift_once();
    }
    if (v59)
    {
      swift_bridgeObjectRetain();
      unint64_t v67 = sub_237EC9470(v31, v30);
      double v68 = 0.0;
      if (v69) {
        double v68 = *(double *)(*(void *)(a10 + 56) + 8 * v67);
      }
      swift_bridgeObjectRelease();
    }
    else
    {
      double v68 = 0.0;
    }
    a4 = *(void *)(v122 + 16);
    if (a4 < 8)
    {
      __break(1u);
      goto LABEL_100;
    }
    double v93 = v68 * *(double *)(v122 + 88);
    uint64_t result = swift_beginAccess();
    double v126 = v93 + v126;
    if (*(void *)(a9 + 16))
    {
      swift_bridgeObjectRetain();
      a10 = a9;
      unint64_t v94 = sub_237EC9470(v31, v30);
      double v95 = 0.0;
      if (v96) {
        double v95 = *(double *)(*(void *)(a9 + 56) + 8 * v94);
      }
      uint64_t result = swift_bridgeObjectRelease();
      if (a4 >= 9)
      {
LABEL_65:
        double v126 = v126 + v95 * *(double *)(v122 + 96);
        double v97 = 0.0;
        double v98 = 0.0;
        if (a13)
        {
          if (v31 == a12 && v30 == a13 || (result = sub_2380E5408(), double v98 = 0.0, (result & 1) != 0))
          {
            if (a4 < 0xA)
            {
              __break(1u);
              return result;
            }
            double v98 = *(double *)(v122 + 104);
          }
        }
        double v126 = v98 + v126;
        if (*(void *)(a11 + 16))
        {
          swift_bridgeObjectRetain();
          unint64_t v99 = sub_237EC9470(v31, v30);
          if (v100) {
            double v97 = *(double *)(*(void *)(a11 + 56) + 8 * v99);
          }
          swift_bridgeObjectRelease();
        }
        if (a4 < 0xB)
        {
LABEL_100:
          __break(1u);
        }
        else
        {
          double v126 = v126 + v97 * *(double *)(v122 + 112);
          if (qword_26894AA20 == -1) {
            goto LABEL_77;
          }
        }
        swift_once();
LABEL_77:
        uint64_t v101 = v120;
        uint64_t v102 = __swift_project_value_buffer(v120, (uint64_t)qword_268956458);
        uint64_t v13 = (uint64_t)v110;
        (*(void (**)(char *, uint64_t, uint64_t))(v121 + 16))(v110, v102, v101);
        uint64_t v103 = *(void *)&v126;
        swift_bridgeObjectRetain_n();
        uint64_t v77 = sub_2380E4508();
        os_log_type_t v78 = sub_2380E4D38();
        if (!os_log_type_enabled(v77, v78)) {
          goto LABEL_80;
        }
        uint64_t v79 = swift_slowAlloc();
        uint64_t v80 = swift_slowAlloc();
        v124[0] = v80;
        *(_DWORD *)uint64_t v79 = 136315394;
        swift_bridgeObjectRetain();
        uint64_t v123 = sub_237EBC6BC(v31, v30, v124);
        sub_2380E4FC8();
        swift_bridgeObjectRelease_n();
        *(_WORD *)(v79 + 12) = 2048;
        uint64_t v123 = v103;
        sub_2380E4FC8();
        v81 = "VisionQuest21#vq21 all other type cases for %s, score: %f";
LABEL_79:
        _os_log_impl(&dword_237EB8000, v77, v78, v81, (uint8_t *)v79, 0x16u);
        swift_arrayDestroy();
        MEMORY[0x23EC87710](v80, -1, -1);
        MEMORY[0x23EC87710](v79, -1, -1);

        goto LABEL_81;
      }
    }
    else
    {
LABEL_84:
      double v95 = 0.0;
      if (a4 >= 9) {
        goto LABEL_65;
      }
    }
    __break(1u);
LABEL_86:
    double v88 = 0.0;
    if (a4 >= 7) {
      goto LABEL_56;
    }
    goto LABEL_87;
  }
  uint64_t v63 = v113;
  if (*(void *)(v113 + 16))
  {
    swift_bridgeObjectRetain();
    unint64_t v64 = sub_237EC9470(v31, v30);
    double v65 = 0.0;
    if (v66) {
      double v65 = *(double *)(*(void *)(v63 + 56) + 8 * v64);
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    double v65 = 0.0;
  }
  if (*(void *)(v122 + 16) < 4uLL)
  {
    __break(1u);
  }
  else
  {
    double v70 = *(double *)(v122 + 56);
    if (*(void *)(a9 + 16))
    {
      swift_bridgeObjectRetain();
      unint64_t v71 = sub_237EC9470(v31, v30);
      double v72 = 0.0;
      uint64_t v13 = (uint64_t)v112;
      if (v73) {
        double v72 = *(double *)(*(void *)(a9 + 56) + 8 * v71);
      }
      swift_bridgeObjectRelease();
    }
    else
    {
      double v72 = 0.0;
      uint64_t v13 = (uint64_t)v112;
    }
    swift_beginAccess();
    double v126 = v65 * v70 + v72 + v126;
    if (qword_26894AA20 == -1) {
      goto LABEL_44;
    }
  }
  swift_once();
LABEL_44:
  uint64_t v74 = v120;
  uint64_t v75 = __swift_project_value_buffer(v120, (uint64_t)qword_268956458);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v121 + 16))(v13, v75, v74);
  uint64_t v76 = *(void *)&v126;
  swift_bridgeObjectRetain_n();
  uint64_t v77 = sub_2380E4508();
  os_log_type_t v78 = sub_2380E4D38();
  if (os_log_type_enabled(v77, v78))
  {
    uint64_t v79 = swift_slowAlloc();
    uint64_t v80 = swift_slowAlloc();
    v124[0] = v80;
    *(_DWORD *)uint64_t v79 = 136315394;
    swift_bridgeObjectRetain();
    uint64_t v123 = sub_237EBC6BC(v31, v30, v124);
    sub_2380E4FC8();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v79 + 12) = 2048;
    uint64_t v123 = v76;
    sub_2380E4FC8();
    v81 = "VisionQuest21#vq21 type unknown for %s, score: %f";
    goto LABEL_79;
  }
LABEL_80:

  swift_bridgeObjectRelease_n();
LABEL_81:
  (*(void (**)(uint64_t, uint64_t))(v121 + 8))(v13, v120);
  swift_beginAccess();
  double v104 = v126;
  swift_bridgeObjectRetain();
  uint64_t v105 = v117;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v123 = *v105;
  *uint64_t v105 = 0x8000000000000000;
  sub_237FA1A2C(v31, v30, isUniquelyReferenced_nonNull_native, v104);
  *uint64_t v105 = v123;
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2380AA3D4(uint64_t a1, char a2, uint64_t a3)
{
  uint64_t v6 = sub_2380E4528();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  int64_t v10 = (char *)&v39 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  int64_t v12 = (char *)&v39 - v11;
  if (a2)
  {
    if (qword_26894AA20 != -1) {
      swift_once();
    }
    uint64_t v24 = __swift_project_value_buffer(v6, (uint64_t)qword_268956458);
    (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v10, v24, v6);
    uint64_t v25 = sub_2380E4508();
    os_log_type_t v26 = sub_2380E4D38();
    if (os_log_type_enabled(v25, v26))
    {
      uint64_t v27 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v27 = 0;
      _os_log_impl(&dword_237EB8000, v25, v26, "VisionQuest21#canSupportRequest missing media type --> false", v27, 2u);
      MEMORY[0x23EC87710](v27, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
    char v28 = 0;
  }
  else
  {
    uint64_t v13 = MEMORY[0x263F8EE78];
    int v44 = (char *)MEMORY[0x263F8EE78];
    uint64_t v14 = *(void *)(a3 + 16);
    uint64_t v42 = v6;
    if (v14)
    {
      uint64_t v40 = a1;
      uint64_t v41 = (char *)&v39 - v11;
      swift_bridgeObjectRetain();
      uint64_t v15 = (uint64_t *)(a3 + 40);
      uint64_t v16 = MEMORY[0x263F8EE88];
      do
      {
        uint64_t v18 = *(v15 - 1);
        uint64_t v17 = *v15;
        uint64_t v19 = qword_26894ABC0;
        swift_bridgeObjectRetain();
        if (v19 != -1) {
          swift_once();
        }
        uint64_t v20 = off_26894D3B0;
        if (*((void *)off_26894D3B0 + 2))
        {
          swift_bridgeObjectRetain();
          unint64_t v21 = sub_237EC9470(v18, v17);
          uint64_t v22 = v16;
          if (v23)
          {
            uint64_t v22 = *(void *)(v20[7] + 8 * v21);
            swift_bridgeObjectRetain();
          }
          swift_bridgeObjectRelease();
        }
        else
        {
          uint64_t v22 = v16;
        }
        v15 += 2;
        swift_bridgeObjectRelease();
        sub_237ED4FA0(v22);
        --v14;
      }
      while (v14);
      swift_bridgeObjectRelease();
      uint64_t v13 = (uint64_t)v44;
      int64_t v12 = v41;
      uint64_t v6 = v42;
      a1 = v40;
    }
    char v28 = sub_237EE58B8(a1, v13);
    swift_bridgeObjectRelease();
    if (qword_26894AA20 != -1) {
      swift_once();
    }
    uint64_t v29 = __swift_project_value_buffer(v6, (uint64_t)qword_268956458);
    (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v12, v29, v6);
    swift_bridgeObjectRetain_n();
    unint64_t v30 = sub_2380E4508();
    os_log_type_t v31 = sub_2380E4D58();
    if (os_log_type_enabled(v30, v31))
    {
      uint64_t v32 = swift_slowAlloc();
      uint64_t v41 = (char *)swift_slowAlloc();
      int v44 = v41;
      *(_DWORD *)uint64_t v32 = 67109378;
      LODWORD(v43) = v28 & 1;
      sub_2380E4FC8();
      *(_WORD *)(v32 + 8) = 2080;
      uint64_t v40 = v32 + 10;
      uint64_t v33 = swift_bridgeObjectRetain();
      uint64_t v34 = MEMORY[0x23EC86140](v33, MEMORY[0x263F8D310]);
      unint64_t v36 = v35;
      swift_bridgeObjectRelease();
      uint64_t v43 = sub_237EBC6BC(v34, v36, (uint64_t *)&v44);
      sub_2380E4FC8();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_237EB8000, v30, v31, "VisionQuest21#canSupportRequest: %{BOOL}d for categories: %s", (uint8_t *)v32, 0x12u);
      uint64_t v37 = v41;
      swift_arrayDestroy();
      MEMORY[0x23EC87710](v37, -1, -1);
      MEMORY[0x23EC87710](v32, -1, -1);

      (*(void (**)(char *, uint64_t))(v7 + 8))(v12, v42);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      (*(void (**)(char *, uint64_t))(v7 + 8))(v12, v6);
    }
  }
  return v28 & 1;
}

uint64_t sub_2380AA8A8(uint64_t a1)
{
  uint64_t v2 = sub_2380E4528();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  double v65 = (char *)v62 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  unint64_t v64 = (char *)v62 - v7;
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)v62 - v8;
  uint64_t v63 = a1;
  uint64_t v10 = 0;
  uint64_t v11 = sub_2380A875C(a1);
  int64_t v12 = *(void *)(v11 + 16);
  uint64_t v70 = v3;
  uint64_t v71 = v2;
  char v66 = v9;
  if (v12)
  {
    uint64_t v69 = 0;
    v73[0] = MEMORY[0x263F8EE78];
    sub_237ECF698(0, v12, 0);
    uint64_t v13 = (void *)v73[0];
    uint64_t v68 = v11;
    uint64_t v14 = (uint64_t *)(v11 + 40);
    do
    {
      uint64_t v15 = *(v14 - 1);
      uint64_t v16 = *v14;
      v73[0] = (uint64_t)v13;
      unint64_t v18 = v13[2];
      unint64_t v17 = v13[3];
      swift_bridgeObjectRetain();
      if (v18 >= v17 >> 1)
      {
        sub_237ECF698(v17 > 1, v18 + 1, 1);
        uint64_t v13 = (void *)v73[0];
      }
      v14 += 2;
      v13[2] = v18 + 1;
      uint64_t v19 = &v13[3 * v18];
      v19[4] = v15;
      v19[5] = v16;
      v19[6] = 1;
      --v12;
    }
    while (v12);
    swift_bridgeObjectRelease();
    uint64_t v3 = v70;
    uint64_t v2 = v71;
    uint64_t v9 = v66;
    uint64_t v10 = v69;
    if (v13[2]) {
      goto LABEL_7;
    }
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v13 = (void *)MEMORY[0x263F8EE78];
    if (*(void *)(MEMORY[0x263F8EE78] + 16))
    {
LABEL_7:
      __swift_instantiateConcreteTypeFromMangledName(&qword_26894BFE0);
      uint64_t v20 = sub_2380E5308();
      goto LABEL_10;
    }
  }
  uint64_t v20 = MEMORY[0x263F8EE80];
LABEL_10:
  v73[0] = v20;
  sub_237EDF394(v13, 1, v73);
  swift_bridgeObjectRelease();
  uint64_t v21 = v73[0];
  if (v10)
  {
    uint64_t result = swift_release();
    __break(1u);
  }
  else
  {
    if (qword_26894AA20 != -1) {
      swift_once();
    }
    uint64_t v22 = __swift_project_value_buffer(v2, (uint64_t)qword_268956458);
    char v23 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
    uint64_t v68 = v3 + 16;
    uint64_t v69 = v22;
    unint64_t v67 = v23;
    ((void (*)(char *))v23)(v9);
    swift_retain_n();
    uint64_t v24 = sub_2380E4508();
    os_log_type_t v25 = sub_2380E4D38();
    if (os_log_type_enabled(v24, v25))
    {
      os_log_type_t v26 = (uint8_t *)swift_slowAlloc();
      uint64_t v27 = swift_slowAlloc();
      v73[0] = v27;
      *(_DWORD *)os_log_type_t v26 = 136315138;
      swift_retain();
      uint64_t v28 = sub_2380E4838();
      unint64_t v30 = v29;
      swift_release();
      uint64_t v72 = sub_237EBC6BC(v28, v30, v73);
      sub_2380E4FC8();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_237EB8000, v24, v25, "VisionQuest21#uniqueProviders category counts: %s", v26, 0xCu);
      swift_arrayDestroy();
      uint64_t v31 = v27;
      uint64_t v2 = v71;
      MEMORY[0x23EC87710](v31, -1, -1);
      uint64_t v32 = v26;
      uint64_t v33 = v70;
      MEMORY[0x23EC87710](v32, -1, -1);

      uint64_t v34 = *(char **)(v33 + 8);
      unint64_t v35 = v66;
    }
    else
    {

      swift_release_n();
      uint64_t v34 = *(char **)(v3 + 8);
      unint64_t v35 = v9;
    }
    char v66 = v34;
    ((void (*)(char *, uint64_t))v34)(v35, v2);
    unint64_t v36 = sub_2380A8C14(v21);
    swift_release();
    uint64_t v37 = sub_237FE7D90(v36);
    uint64_t v38 = v64;
    v67(v64, v69, v2);
    swift_bridgeObjectRetain_n();
    uint64_t v39 = sub_2380E4508();
    os_log_type_t v40 = sub_2380E4D38();
    if (os_log_type_enabled(v39, v40))
    {
      uint64_t v41 = (uint8_t *)swift_slowAlloc();
      uint64_t v42 = swift_slowAlloc();
      v73[0] = v42;
      *(_DWORD *)uint64_t v41 = 136315138;
      v62[1] = 0;
      swift_bridgeObjectRetain();
      uint64_t v43 = sub_2380E4C88();
      unint64_t v45 = v44;
      swift_bridgeObjectRelease();
      uint64_t v72 = sub_237EBC6BC(v43, v45, v73);
      sub_2380E4FC8();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_237EB8000, v39, v40, "VisionQuest21#uniqueProviders unique categories: %s", v41, 0xCu);
      swift_arrayDestroy();
      uint64_t v46 = v42;
      uint64_t v2 = v71;
      MEMORY[0x23EC87710](v46, -1, -1);
      MEMORY[0x23EC87710](v41, -1, -1);

      uint64_t v47 = v64;
    }
    else
    {

      swift_bridgeObjectRelease_n();
      uint64_t v47 = v38;
    }
    uint64_t v48 = ((uint64_t (*)(char *, uint64_t))v66)(v47, v2);
    double v49 = v65;
    MEMORY[0x270FA5388](v48);
    v62[-2] = v37;
    uint64_t v50 = sub_2380A8EBC(v63, sub_2380AB928);
    swift_bridgeObjectRelease();
    uint64_t v51 = sub_237FEB820(v50);
    swift_bridgeObjectRelease();
    v67(v49, v69, v2);
    swift_bridgeObjectRetain_n();
    uint64_t v52 = sub_2380E4508();
    os_log_type_t v53 = sub_2380E4D38();
    if (os_log_type_enabled(v52, v53))
    {
      uint64_t v54 = (uint8_t *)swift_slowAlloc();
      uint64_t v55 = swift_slowAlloc();
      v73[0] = v55;
      *(_DWORD *)uint64_t v54 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v56 = sub_2380E4C88();
      unint64_t v58 = v57;
      swift_bridgeObjectRelease();
      uint64_t v72 = sub_237EBC6BC(v56, v58, v73);
      sub_2380E4FC8();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_237EB8000, v52, v53, "VisionQuest21#uniqueProviders unique: %s", v54, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x23EC87710](v55, -1, -1);
      MEMORY[0x23EC87710](v54, -1, -1);

      uint64_t v59 = v71;
      unint64_t v60 = v65;
    }
    else
    {

      swift_bridgeObjectRelease_n();
      unint64_t v60 = v49;
      uint64_t v59 = v2;
    }
    ((void (*)(char *, uint64_t))v66)(v60, v59);
    return v51;
  }
  return result;
}

uint64_t sub_2380AB0AC(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  unint64_t v83 = a3;
  uint64_t v84 = a6;
  uint64_t v76 = a5;
  uint64_t v77 = a4;
  uint64_t v16 = a11;
  uint64_t v82 = a12;
  uint64_t v78 = a10;
  uint64_t v85 = a9;
  uint64_t v17 = sub_2380E4528();
  uint64_t v18 = *(void *)(v17 - 8);
  MEMORY[0x270FA5388](v17);
  uint64_t v20 = (char *)&v68 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26894AA20 != -1) {
    swift_once();
  }
  uint64_t v21 = __swift_project_value_buffer(v17, (uint64_t)qword_268956458);
  (*(void (**)(char *, uint64_t, uint64_t))(v18 + 16))(v20, v21, v17);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  uint64_t v22 = sub_2380E4508();
  os_log_type_t v23 = sub_2380E4D38();
  int v75 = v23;
  if (os_log_type_enabled(v22, v23))
  {
    uint64_t v24 = swift_slowAlloc();
    uint64_t v79 = a7;
    uint64_t v25 = v24;
    uint64_t v73 = swift_slowAlloc();
    v87[0] = v73;
    *(_DWORD *)uint64_t v25 = 136317186;
    uint64_t v81 = a8;
    swift_bridgeObjectRetain();
    uint64_t v26 = sub_2380E4C88();
    os_log_t v72 = v22;
    uint64_t v27 = v26;
    unint64_t v80 = a11;
    unint64_t v29 = v28;
    swift_bridgeObjectRelease();
    uint64_t v86 = sub_237EBC6BC(v27, v29, v87);
    sub_2380E4FC8();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v25 + 12) = 2080;
    swift_bridgeObjectRetain();
    uint64_t v69 = v17;
    uint64_t v30 = sub_2380E4C88();
    uint64_t v74 = a1;
    unint64_t v32 = v31;
    swift_bridgeObjectRelease();
    uint64_t v86 = sub_237EBC6BC(v30, v32, v87);
    sub_2380E4FC8();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v25 + 22) = 2080;
    uint64_t v71 = v18;
    swift_bridgeObjectRetain();
    uint64_t v68 = a2;
    uint64_t v33 = sub_2380E4C88();
    unint64_t v35 = v34;
    swift_bridgeObjectRelease();
    uint64_t v86 = sub_237EBC6BC(v33, v35, v87);
    sub_2380E4FC8();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v25 + 32) = 2080;
    uint64_t v70 = v20;
    swift_bridgeObjectRetain();
    uint64_t v36 = MEMORY[0x263F8D538];
    uint64_t v37 = sub_2380E4838();
    unint64_t v39 = v38;
    swift_bridgeObjectRelease();
    uint64_t v86 = sub_237EBC6BC(v37, v39, v87);
    sub_2380E4FC8();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v25 + 42) = 2080;
    swift_bridgeObjectRetain();
    uint64_t v40 = sub_2380E4838();
    unint64_t v42 = v41;
    swift_bridgeObjectRelease();
    uint64_t v86 = sub_237EBC6BC(v40, v42, v87);
    sub_2380E4FC8();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v25 + 52) = 2080;
    swift_bridgeObjectRetain();
    uint64_t v43 = sub_2380E4838();
    unint64_t v45 = v44;
    swift_bridgeObjectRelease();
    uint64_t v86 = sub_237EBC6BC(v43, v45, v87);
    sub_2380E4FC8();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v25 + 62) = 2080;
    swift_bridgeObjectRetain();
    uint64_t v46 = sub_2380E4838();
    unint64_t v48 = v47;
    swift_bridgeObjectRelease();
    uint64_t v86 = sub_237EBC6BC(v46, v48, v87);
    sub_2380E4FC8();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v25 + 72) = 2080;
    if (v80) {
      uint64_t v49 = v78;
    }
    else {
      uint64_t v49 = 7104878;
    }
    if (v80) {
      unint64_t v50 = v80;
    }
    else {
      unint64_t v50 = 0xE300000000000000;
    }
    swift_bridgeObjectRetain();
    uint64_t v86 = sub_237EBC6BC(v49, v50, v87);
    sub_2380E4FC8();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v25 + 82) = 2080;
    uint64_t v51 = swift_bridgeObjectRetain();
    uint64_t v52 = MEMORY[0x23EC86140](v51, v36);
    unint64_t v54 = v53;
    swift_bridgeObjectRelease();
    uint64_t v55 = v52;
    uint64_t v16 = v80;
    uint64_t v86 = sub_237EBC6BC(v55, v54, v87);
    a8 = v81;
    sub_2380E4FC8();
    swift_bridgeObjectRelease_n();
    a1 = v74;
    swift_bridgeObjectRelease();
    os_log_t v56 = v72;
    _os_log_impl(&dword_237EB8000, v72, (os_log_type_t)v75, "VisionQuest21#vq21 candidateBundleIdentifiers:%s, supportFlag:%s, unicornFlag:%s, compoundMediaTypeBundleScore:%s, entitySearchBundleScore:%s, compoundActiveBundleScore:%s, nowPlayingBundleScore:%s, foregroundBundle:%s, weights:%s", (uint8_t *)v25, 0x5Cu);
    uint64_t v57 = v73;
    swift_arrayDestroy();
    MEMORY[0x23EC87710](v57, -1, -1);
    uint64_t v58 = v25;
    a7 = v79;
    MEMORY[0x23EC87710](v58, -1, -1);

    (*(void (**)(char *, uint64_t))(v71 + 8))(v70, v69);
    uint64_t v59 = v68;
  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
    (*(void (**)(char *, uint64_t))(v18 + 8))(v20, v17);
    uint64_t v59 = a2;
  }
  swift_bridgeObjectRetain();
  unint64_t v60 = v83;
  swift_bridgeObjectRetain();
  uint64_t v61 = v84;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v62 = v85;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v63 = v82;
  swift_bridgeObjectRetain();
  uint64_t v64 = v77;
  swift_bridgeObjectRetain();
  uint64_t v65 = sub_237ED6FB4(MEMORY[0x263F8EE80], a1, v59, v60, v63, v64, v76, v61, a7, a8, v62, v78, v16);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v66 = sub_237EEC9F4(v65, a1, 1);
  swift_bridgeObjectRelease();
  return v66;
}

uint64_t sub_2380AB928(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2380A8B74(a1, a2, a3, *(void *)(v3 + 16));
}

BOOL sub_2380AB930(void *a1, uint64_t a2)
{
  uint64_t v2 = a1[2];
  if (!v2) {
    return 1;
  }
  if (*(void *)(a2 + 16))
  {
    uint64_t v4 = a1 + 4;
    uint64_t v5 = a1 + 5;
    uint64_t v6 = a2 + 56;
    uint64_t v7 = 1;
    uint64_t v22 = a1 + 4;
    while (1)
    {
      uint64_t v8 = *v5;
      uint64_t v9 = *v4;
      swift_bridgeObjectRetain();
      sub_2380E54E8();
      sub_2380E49E8();
      uint64_t v10 = sub_2380E5538();
      uint64_t v11 = -1 << *(unsigned char *)(a2 + 32);
      unint64_t v12 = v10 & ~v11;
      if (((*(void *)(v6 + ((v12 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v12) & 1) == 0) {
        break;
      }
      uint64_t v13 = *(void *)(a2 + 48);
      uint64_t v14 = (void *)(v13 + 16 * v12);
      BOOL v15 = *v14 == v9 && v14[1] == v8;
      if (!v15 && (sub_2380E5408() & 1) == 0)
      {
        uint64_t v17 = ~v11;
        for (unint64_t i = v12 + 1; ; unint64_t i = v19 + 1)
        {
          uint64_t v19 = i & v17;
          if (((*(void *)(v6 + (((i & v17) >> 3) & 0xFFFFFFFFFFFFFF8)) >> (i & v17)) & 1) == 0) {
            break;
          }
          uint64_t v20 = (void *)(v13 + 16 * v19);
          BOOL v21 = *v20 == v9 && v20[1] == v8;
          if (v21 || (sub_2380E5408() & 1) != 0) {
            goto LABEL_10;
          }
        }
        break;
      }
LABEL_10:
      swift_bridgeObjectRelease();
      BOOL result = v7 == v2;
      if (v7 == v2 || !*(void *)(a2 + 16)) {
        return result;
      }
      uint64_t v4 = &v22[2 * v7++];
      uint64_t v5 = v4 + 1;
    }
    swift_bridgeObjectRelease();
  }
  return 0;
}

uint64_t AtomicArray.__allocating_init(name:)(uint64_t a1, unint64_t a2)
{
  uint64_t v4 = swift_allocObject();
  AtomicArray.init(name:)(a1, a2);
  return v4;
}

void *AtomicArray.init(name:)(uint64_t a1, unint64_t a2)
{
  uint64_t v3 = v2;
  v3[2] = sub_2380E4B78();
  v3[4] = a1;
  v3[5] = a2;
  uint64_t v6 = qword_26894A830;
  swift_bridgeObjectRetain();
  if (v6 != -1) {
    swift_once();
  }
  uint64_t v7 = qword_26894B9E0;
  v9[3] = type metadata accessor for SiriKitTaskLoggingProvider();
  v9[4] = &protocol witness table for SiriKitTaskLoggingProvider;
  v9[0] = v7;
  type metadata accessor for PThreadMutex();
  swift_allocObject();
  swift_retain();
  v3[3] = PThreadMutex.init(name:abortOnFail:analyticsService:)(a1, a2, 1, (uint64_t)v9);
  return v3;
}

uint64_t AtomicArray.deinit()
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t AtomicArray.__deallocating_deinit()
{
  AtomicArray.deinit();
  return swift_deallocClassInstance();
}

uint64_t sub_2380ABC64()
{
  return swift_initClassMetadata2();
}

uint64_t type metadata accessor for AtomicArray()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t method lookup function for AtomicArray(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for AtomicArray);
}

uint64_t dispatch thunk of AtomicArray.__allocating_init(name:)()
{
  return (*(uint64_t (**)(void))(v0 + 136))();
}

uint64_t sub_2380ABD08(uint64_t a1, uint64_t a2)
{
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v8 = a2;
  sub_237EDF640(a1, (uint64_t)sub_237EE118C, 0, isUniquelyReferenced_nonNull_native, (uint64_t)&v8);
  uint64_t v6 = v8;
  swift_bridgeObjectRelease();
  if (v2) {
    swift_bridgeObjectRelease();
  }
  return v6;
}

uint64_t sub_2380ABD94(uint64_t a1)
{
  return sub_2380ABEE8(a1, (uint64_t (*)(void))sub_237EEB2F4, (uint64_t (*)(void))sub_2380BC3EC);
}

uint64_t sub_2380ABDC0(uint64_t a1)
{
  uint64_t result = sub_23807CCB8(a1);
  if (v4) {
    goto LABEL_7;
  }
  if (*(_DWORD *)(a1 + 36) != v3)
  {
    __break(1u);
LABEL_7:
    __break(1u);
    return result;
  }
  if (result == 1 << *(unsigned char *)(a1 + 32)) {
    return 0;
  }
  else {
    return sub_2380BB2F0(result, v3, 0, a1);
  }
}

uint64_t sub_2380ABE3C(uint64_t a1)
{
  uint64_t result = sub_23807CCB8(a1);
  if (v4) {
    goto LABEL_7;
  }
  if (*(_DWORD *)(a1 + 36) != v3)
  {
    __break(1u);
LABEL_7:
    __break(1u);
    return result;
  }
  if (result == 1 << *(unsigned char *)(a1 + 32)) {
    return 0;
  }
  sub_2380BB2A0(result, v3, 0, a1);
  return v5;
}

uint64_t sub_2380ABEBC(uint64_t a1)
{
  return sub_2380ABEE8(a1, (uint64_t (*)(void))sub_2380BB340, (uint64_t (*)(void))sub_2380BC440);
}

uint64_t sub_2380ABEE8(uint64_t a1, uint64_t (*a2)(void), uint64_t (*a3)(void))
{
  uint64_t result = a2();
  if (v7) {
    goto LABEL_8;
  }
  if (*(_DWORD *)(a1 + 36) != v6)
  {
    __break(1u);
LABEL_8:
    __break(1u);
    return result;
  }
  if (result == 1 << *(unsigned char *)(a1 + 32)) {
    return 0;
  }
  uint64_t v8 = a3();
  swift_bridgeObjectRetain();
  return v8;
}

unint64_t sub_2380ABF74(unint64_t result)
{
  unint64_t v1 = result;
  if (!(result >> 62))
  {
    if (*(void *)((result & 0xFFFFFFFFFFFFFF8) + 0x10)) {
      goto LABEL_3;
    }
    return 0;
  }
  swift_bridgeObjectRetain();
  uint64_t v2 = sub_2380E52D8();
  uint64_t result = swift_bridgeObjectRelease();
  if (!v2) {
    return 0;
  }
LABEL_3:
  if ((v1 & 0xC000000000000001) != 0) {
    return MEMORY[0x23EC867A0](0, v1);
  }
  if (*(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
    return (unint64_t)*(id *)(v1 + 32);
  }
  __break(1u);
  return result;
}

uint64_t sub_2380AC00C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char v4 = v3;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26894D4B8);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_2380E3CF8();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)&v17 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v12 + 48))(a1, 1, v11) == 1)
  {
    sub_237F098FC(a1, &qword_26894D4B8);
    sub_23807BBD4(a2, a3, (uint64_t)v10);
    swift_bridgeObjectRelease();
    return sub_237F098FC((uint64_t)v10, &qword_26894D4B8);
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v12 + 32))(v14, a1, v11);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v18 = *v4;
    *char v4 = 0x8000000000000000;
    sub_237FA2498((uint64_t)v14, a2, a3, isUniquelyReferenced_nonNull_native);
    *char v4 = v18;
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_2380AC1E8(unsigned __int8 a1, uint64_t a2, unint64_t a3, uint64_t (*a4)(void *), uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v14 = a1;
  uint64_t v15 = sub_2380E4528();
  uint64_t v16 = MEMORY[0x270FA5388](v15);
  uint64_t v19 = (char *)&v27 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v33[0] = a6;
  v33[1] = a7;
  v33[2] = a8;
  if (v14 == 2) {
    return a4(v33);
  }
  uint64_t v28 = v17;
  unint64_t v29 = v19;
  uint64_t v30 = v16;
  if (qword_26894AA20 != -1) {
    swift_once();
  }
  uint64_t v21 = v30;
  uint64_t v22 = __swift_project_value_buffer(v30, (uint64_t)qword_268956458);
  (*(void (**)(char *, uint64_t, uint64_t))(v28 + 16))(v29, v22, v21);
  swift_bridgeObjectRetain_n();
  os_log_type_t v23 = sub_2380E4508();
  os_log_type_t v24 = sub_2380E4D48();
  if (os_log_type_enabled(v23, v24))
  {
    uint64_t v25 = (uint8_t *)swift_slowAlloc();
    uint64_t v26 = swift_slowAlloc();
    v32[0] = v26;
    *(_DWORD *)uint64_t v25 = 136315138;
    swift_bridgeObjectRetain();
    uint64_t v31 = sub_237EBC6BC(a2, a3, v32);
    sub_2380E4FC8();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_237EB8000, v23, v24, "Completions#protect FATAL! Double computing completion with name: %s", v25, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23EC87710](v26, -1, -1);
    MEMORY[0x23EC87710](v25, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  (*(void (**)(char *, uint64_t))(v28 + 8))(v29, v30);
  v32[0] = 0;
  v32[1] = 0xE000000000000000;
  sub_2380E5178();
  sub_2380E4A18();
  sub_2380E4A18();
  uint64_t result = sub_2380E52B8();
  __break(1u);
  return result;
}

uint64_t sub_2380AC4F8(uint64_t result, unint64_t a2)
{
  uint64_t v3 = HIBYTE(a2) & 0xF;
  uint64_t v4 = result & 0xFFFFFFFFFFFFLL;
  if ((a2 & 0x2000000000000000) != 0) {
    uint64_t v5 = v3;
  }
  else {
    uint64_t v5 = result & 0xFFFFFFFFFFFFLL;
  }
  if (!v5)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  if ((a2 & 0x1000000000000000) == 0)
  {
    if ((a2 & 0x2000000000000000) == 0)
    {
      if ((result & 0x1000000000000000) != 0) {
        int v6 = (unsigned __int8 *)((a2 & 0xFFFFFFFFFFFFFFFLL) + 32);
      }
      else {
        int v6 = (unsigned __int8 *)sub_2380E51B8();
      }
      uint64_t v7 = (uint64_t)sub_2380B97D8(v6, v4, 10);
      char v9 = v8 & 1;
      goto LABEL_37;
    }
    v23[0] = result;
    v23[1] = a2 & 0xFFFFFFFFFFFFFFLL;
    if (result == 43)
    {
      if (!v3) {
        goto LABEL_50;
      }
      if (v3 == 1 || (BYTE1(result) - 48) > 9u) {
        goto LABEL_34;
      }
      uint64_t v7 = (BYTE1(result) - 48);
      uint64_t v14 = v3 - 2;
      if (v14)
      {
        uint64_t v15 = (unsigned __int8 *)v23 + 2;
        while (1)
        {
          unsigned int v16 = *v15 - 48;
          if (v16 > 9) {
            goto LABEL_34;
          }
          uint64_t v17 = 10 * v7;
          if ((unsigned __int128)(v7 * (__int128)10) >> 64 != (10 * v7) >> 63) {
            goto LABEL_34;
          }
          uint64_t v7 = v17 + v16;
          if (__OFADD__(v17, v16)) {
            goto LABEL_34;
          }
          char v9 = 0;
          ++v15;
          if (!--v14) {
            goto LABEL_37;
          }
        }
      }
    }
    else
    {
      if (result == 45)
      {
        if (v3)
        {
          if (v3 != 1 && (BYTE1(result) - 48) <= 9u)
          {
            uint64_t v7 = -(uint64_t)(BYTE1(result) - 48);
            uint64_t v10 = v3 - 2;
            if (v10)
            {
              uint64_t v11 = (unsigned __int8 *)v23 + 2;
              while (1)
              {
                unsigned int v12 = *v11 - 48;
                if (v12 > 9) {
                  goto LABEL_34;
                }
                uint64_t v13 = 10 * v7;
                if ((unsigned __int128)(v7 * (__int128)10) >> 64 != (10 * v7) >> 63) {
                  goto LABEL_34;
                }
                uint64_t v7 = v13 - v12;
                if (__OFSUB__(v13, v12)) {
                  goto LABEL_34;
                }
                char v9 = 0;
                ++v11;
                if (!--v10) {
                  goto LABEL_37;
                }
              }
            }
            goto LABEL_36;
          }
LABEL_34:
          uint64_t v7 = 0;
          char v9 = 1;
          goto LABEL_37;
        }
        __break(1u);
LABEL_50:
        __break(1u);
        return result;
      }
      if (!v3 || (result - 48) > 9u) {
        goto LABEL_34;
      }
      uint64_t v7 = (result - 48);
      uint64_t v18 = v3 - 1;
      if (v18)
      {
        uint64_t v19 = (unsigned __int8 *)v23 + 1;
        while (1)
        {
          unsigned int v20 = *v19 - 48;
          if (v20 > 9) {
            goto LABEL_34;
          }
          uint64_t v21 = 10 * v7;
          if ((unsigned __int128)(v7 * (__int128)10) >> 64 != (10 * v7) >> 63) {
            goto LABEL_34;
          }
          uint64_t v7 = v21 + v20;
          if (__OFADD__(v21, v20)) {
            goto LABEL_34;
          }
          char v9 = 0;
          ++v19;
          if (!--v18) {
            goto LABEL_37;
          }
        }
      }
    }
LABEL_36:
    char v9 = 0;
    goto LABEL_37;
  }
  uint64_t v7 = sub_2380B9464(result, a2, 10, (uint64_t (*)(void *, uint64_t, uint64_t))sub_2380B97D8);
  char v9 = v22;
LABEL_37:
  swift_bridgeObjectRelease();
  if (v9) {
    return 0;
  }
  else {
    return v7;
  }
}

unint64_t sub_2380AC75C(uint64_t a1, unint64_t a2)
{
  uint64_t v4 = HIBYTE(a2) & 0xF;
  uint64_t v5 = a1 & 0xFFFFFFFFFFFFLL;
  if ((a2 & 0x2000000000000000) != 0) {
    uint64_t v6 = v4;
  }
  else {
    uint64_t v6 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (!v6)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  if ((a2 & 0x1000000000000000) != 0)
  {
    unint64_t v8 = sub_2380B9464(a1, a2, 10, (uint64_t (*)(void *, uint64_t, uint64_t))sub_2380B955C);
    char v10 = v22;
    goto LABEL_39;
  }
  if ((a2 & 0x2000000000000000) == 0)
  {
    if ((a1 & 0x1000000000000000) != 0) {
      uint64_t v7 = (unsigned __int8 *)((a2 & 0xFFFFFFFFFFFFFFFLL) + 32);
    }
    else {
      uint64_t v7 = (unsigned __int8 *)sub_2380E51B8();
    }
    unint64_t v8 = (unint64_t)sub_2380B955C(v7, v5, 10);
    char v10 = v9 & 1;
    goto LABEL_39;
  }
  v23[0] = a1;
  v23[1] = a2 & 0xFFFFFFFFFFFFFFLL;
  if (a1 == 43)
  {
    if (!v4) {
      goto LABEL_52;
    }
    if (v4 == 1 || (BYTE1(a1) - 48) > 9u) {
      goto LABEL_36;
    }
    unint64_t v8 = (BYTE1(a1) - 48);
    uint64_t v15 = v4 - 2;
    if (v15)
    {
      unsigned int v16 = (unsigned __int8 *)v23 + 2;
      while (1)
      {
        unsigned int v17 = *v16 - 48;
        if (v17 > 9) {
          goto LABEL_36;
        }
        if (!is_mul_ok(v8, 0xAuLL)) {
          goto LABEL_36;
        }
        BOOL v14 = __CFADD__(10 * v8, v17);
        unint64_t v8 = 10 * v8 + v17;
        if (v14) {
          goto LABEL_36;
        }
        char v10 = 0;
        ++v16;
        if (!--v15) {
          goto LABEL_39;
        }
      }
    }
LABEL_38:
    char v10 = 0;
    goto LABEL_39;
  }
  if (a1 != 45)
  {
    if (!v4 || (a1 - 48) > 9u) {
      goto LABEL_36;
    }
    unint64_t v8 = (a1 - 48);
    uint64_t v18 = v4 - 1;
    if (v18)
    {
      unsigned int v20 = (unsigned __int8 *)v23 + 1;
      while (1)
      {
        unsigned int v21 = *v20 - 48;
        if (v21 > 9) {
          goto LABEL_36;
        }
        if (!is_mul_ok(v8, 0xAuLL)) {
          goto LABEL_36;
        }
        BOOL v14 = __CFADD__(10 * v8, v21);
        unint64_t v8 = 10 * v8 + v21;
        if (v14) {
          goto LABEL_36;
        }
        char v10 = 0;
        ++v20;
        if (!--v18) {
          goto LABEL_39;
        }
      }
    }
    goto LABEL_38;
  }
  if (v4)
  {
    if (v4 != 1 && (BYTE1(a1) - 48) <= 9u)
    {
      unint64_t v2 = 0;
      unint64_t v8 = -(uint64_t)(BYTE1(a1) - 48);
      if (BYTE1(a1) == 48)
      {
        uint64_t v11 = v4 - 2;
        if (v11)
        {
          unsigned int v12 = (unsigned __int8 *)v23 + 2;
          while (1)
          {
            unsigned int v13 = *v12 - 48;
            if (v13 > 9) {
              goto LABEL_36;
            }
            if (!is_mul_ok(v8, 0xAuLL)) {
              goto LABEL_36;
            }
            BOOL v14 = 10 * v8 >= v13;
            unint64_t v8 = 10 * v8 - v13;
            if (!v14) {
              goto LABEL_36;
            }
            char v10 = 0;
            ++v12;
            if (!--v11) {
              goto LABEL_39;
            }
          }
        }
        goto LABEL_38;
      }
      goto LABEL_53;
    }
LABEL_36:
    unint64_t v8 = 0;
    char v10 = 1;
    goto LABEL_39;
  }
  __break(1u);
LABEL_52:
  __break(1u);
LABEL_53:
  char v10 = 1;
  unint64_t v8 = v2;
LABEL_39:
  swift_bridgeObjectRelease();
  if (v10) {
    return 0;
  }
  else {
    return v8;
  }
}

uint64_t sub_2380AC9D0(unint64_t a1, unint64_t a2)
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  *(void *)&long long v40 = a1;
  *((void *)&v40 + 1) = a2;
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26894D510);
  if (swift_dynamicCast())
  {
    sub_237EC4D08(v38, (uint64_t)&v41);
    __swift_project_boxed_opaque_existential_1(&v41, v43);
    sub_2380E2B88();
    swift_bridgeObjectRelease();
    v38[0] = v40;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v41);
    return *(void *)&v38[0];
  }
  uint64_t v39 = 0;
  memset(v38, 0, sizeof(v38));
  sub_237F098FC((uint64_t)v38, &qword_26894D518);
  unint64_t v2 = a1;
  unint64_t v3 = a2;
  if ((a2 & 0x1000000000000000) == 0)
  {
    if ((a2 & 0x2000000000000000) != 0)
    {
      uint64_t v41 = a1;
      uint64_t v42 = a2 & 0xFFFFFFFFFFFFFFLL;
      uint64_t v6 = (char *)&v41 + (HIBYTE(a2) & 0xF);
      uint64_t v7 = &v41;
    }
    else
    {
      if ((a1 & 0x1000000000000000) != 0)
      {
        uint64_t v4 = (a2 & 0xFFFFFFFFFFFFFFFLL) + 32;
        uint64_t v5 = a1 & 0xFFFFFFFFFFFFLL;
      }
      else
      {
        uint64_t v4 = sub_2380E51B8();
      }
      if (v4) {
        uint64_t v6 = (unsigned char *)(v4 + v5);
      }
      else {
        uint64_t v6 = 0;
      }
      uint64_t v7 = (uint64_t *)v4;
    }
    unint64_t v8 = sub_2380BECEC(v7, v6);
    unint64_t v10 = v9;
    if (v9 >> 60 != 15)
    {
      swift_bridgeObjectRelease();
      *(void *)&v38[0] = v8;
      *((void *)&v38[0] + 1) = v10;
      return *(void *)&v38[0];
    }
    unint64_t v2 = a1;
    unint64_t v3 = a2;
    if ((a2 & 0x1000000000000000) == 0) {
      goto LABEL_14;
    }
LABEL_70:
    uint64_t v11 = sub_2380E4A28();
    goto LABEL_17;
  }
LABEL_69:
  unint64_t v8 = 0;
  unint64_t v10 = 0xF000000000000000;
  if ((v3 & 0x1000000000000000) != 0) {
    goto LABEL_70;
  }
LABEL_14:
  if ((v3 & 0x2000000000000000) != 0) {
    uint64_t v11 = HIBYTE(v3) & 0xF;
  }
  else {
    uint64_t v11 = v2 & 0xFFFFFFFFFFFFLL;
  }
LABEL_17:
  *(void *)&v38[0] = sub_2380BED50(v11);
  *((void *)&v38[0] + 1) = v12;
  MEMORY[0x270FA5388](*(void *)&v38[0]);
  unint64_t v13 = (unint64_t)sub_2380B9F40((void *(*)(uint64_t *__return_ptr, char *, char *))sub_2380C7150);
  uint64_t v16 = *((void *)&v38[0] + 1) >> 62;
  uint64_t v17 = v13;
  uint64_t v18 = v3;
  unint64_t v19 = v14;
  switch(*((void *)&v38[0] + 1) >> 62)
  {
    case 1:
      LODWORD(v20) = DWORD1(v38[0]) - LODWORD(v38[0]);
      if (__OFSUB__(DWORD1(v38[0]), v38[0])) {
        goto LABEL_73;
      }
      uint64_t v20 = (int)v20;
LABEL_23:
      if (v15 != v20)
      {
        if (v16)
        {
          if (v16 == 1) {
            uint64_t v24 = *(uint64_t *)&v38[0] >> 32;
          }
          else {
            uint64_t v24 = *(void *)(*(void *)&v38[0] + 24);
          }
        }
        else
        {
          uint64_t v24 = BYTE14(v38[0]);
        }
LABEL_61:
        if (v24 < v15)
        {
          __break(1u);
LABEL_73:
          __break(1u);
LABEL_74:
          __break(1u);
        }
        sub_2380E2CB8();
LABEL_63:
        swift_bridgeObjectRelease();
        goto LABEL_64;
      }
LABEL_29:
      if ((v3 & 0x2000000000000000) != 0) {
        unint64_t v25 = HIBYTE(v3) & 0xF;
      }
      else {
        unint64_t v25 = v13 & 0xFFFFFFFFFFFFLL;
      }
      *(void *)((char *)&v40 + 7) = 0;
      *(void *)&long long v40 = 0;
      if (4 * v25 == v14 >> 14) {
        goto LABEL_58;
      }
      LOBYTE(v26) = 0;
      uint64_t v27 = (v13 >> 59) & 1;
      if ((v3 & 0x1000000000000000) == 0) {
        LOBYTE(v27) = 1;
      }
      uint64_t v28 = 4 << v27;
      uint64_t v35 = v3 & 0xFFFFFFFFFFFFFFLL;
      uint64_t v33 = (uint64_t)v8;
      uint64_t v34 = (v3 & 0xFFFFFFFFFFFFFFFLL) + 32;
      break;
    case 2:
      uint64_t v22 = *(void *)(*(void *)&v38[0] + 16);
      uint64_t v21 = *(void *)(*(void *)&v38[0] + 24);
      BOOL v23 = __OFSUB__(v21, v22);
      uint64_t v20 = v21 - v22;
      if (!v23) {
        goto LABEL_23;
      }
      goto LABEL_74;
    case 3:
      if (!v15) {
        goto LABEL_29;
      }
      uint64_t v24 = 0;
      goto LABEL_61;
    default:
      uint64_t v20 = BYTE14(v38[0]);
      goto LABEL_23;
  }
  do
  {
    unint64_t v29 = v19 & 0xC;
    unint64_t v2 = v19;
    if (v29 == v28) {
      unint64_t v2 = sub_2380B9270(v19, v17, v18);
    }
    unint64_t v30 = v2 >> 16;
    if (v2 >> 16 >= v25)
    {
      __break(1u);
LABEL_67:
      __break(1u);
LABEL_68:
      __break(1u);
      goto LABEL_69;
    }
    if ((v18 & 0x1000000000000000) != 0)
    {
      unint64_t v2 = sub_2380E4A68();
      char v31 = v2;
      if (v29 != v28) {
        goto LABEL_47;
      }
    }
    else if ((v18 & 0x2000000000000000) != 0)
    {
      uint64_t v41 = v17;
      uint64_t v42 = v35;
      char v31 = *((unsigned char *)&v41 + v30);
      if (v29 != v28) {
        goto LABEL_47;
      }
    }
    else
    {
      unint64_t v2 = v34;
      if ((v17 & 0x1000000000000000) == 0) {
        unint64_t v2 = sub_2380E51B8();
      }
      char v31 = *(unsigned char *)(v2 + v30);
      if (v29 != v28)
      {
LABEL_47:
        if ((v18 & 0x1000000000000000) == 0) {
          goto LABEL_48;
        }
        goto LABEL_51;
      }
    }
    unint64_t v2 = sub_2380B9270(v19, v17, v18);
    unint64_t v19 = v2;
    if ((v18 & 0x1000000000000000) == 0)
    {
LABEL_48:
      unint64_t v19 = (v19 & 0xFFFFFFFFFFFF0000) + 65540;
      goto LABEL_53;
    }
LABEL_51:
    if (v25 <= v19 >> 16) {
      goto LABEL_68;
    }
    unint64_t v2 = sub_2380E4A38();
    unint64_t v19 = v2;
LABEL_53:
    *((unsigned char *)&v40 + v26) = v31;
    unsigned int v26 = v26 + 1;
    if ((v26 >> 8)) {
      goto LABEL_67;
    }
    BYTE14(v40) = v26;
    if (v26 == 14)
    {
      uint64_t v41 = v40;
      LODWORD(v42) = DWORD2(v40);
      WORD2(v42) = WORD6(v40);
      sub_2380E2CC8();
      LOBYTE(v26) = 0;
      BYTE14(v40) = 0;
    }
  }
  while (4 * v25 != v19 >> 14);
  unint64_t v8 = (unsigned char *)v33;
  if ((_BYTE)v26)
  {
    uint64_t v41 = v40;
    LODWORD(v42) = DWORD2(v40);
    WORD2(v42) = WORD6(v40);
    sub_2380E2CC8();
    sub_237F99F84(v33, v10);
    goto LABEL_63;
  }
LABEL_58:
  swift_bridgeObjectRelease();
  sub_237F99F84((uint64_t)v8, v10);
LABEL_64:
  swift_bridgeObjectRelease();
  return *(void *)&v38[0];
}

uint64_t sub_2380ACF04(uint64_t a1)
{
  unint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = sub_2380E4828();
  swift_retain();
  v1(v2);
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2380ACF7C(uint64_t a1)
{
  return sub_2380B7DD4(a1, 0xD00000000000002DLL, 0x80000002380FB070, &qword_26894D440);
}

dispatch_semaphore_t sub_2380ACFA0()
{
  dispatch_semaphore_t result = dispatch_semaphore_create(0);
  qword_26894D450 = (uint64_t)result;
  return result;
}

uint64_t sub_2380ACFC4(uint64_t a1)
{
  return sub_2380B7DD4(a1, 0xD00000000000002FLL, 0x80000002380FB780, &qword_26894D458);
}

uint64_t sub_2380ACFE8(uint64_t a1)
{
  return sub_2380B7DD4(a1, 0xD000000000000028, 0x80000002380FB0A0, &qword_26894D460);
}

void sub_2380AD00C(void *a1, void (*a2)(void), uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v11 = sub_2380E4528();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  unint64_t v14 = (char *)&v30 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26894AA20 != -1) {
    swift_once();
  }
  uint64_t v15 = __swift_project_value_buffer(v11, (uint64_t)qword_268956458);
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v14, v15, v11);
  id v16 = a1;
  id v35 = a1;
  id v17 = v16;
  uint64_t v18 = sub_2380E4508();
  os_log_type_t v19 = sub_2380E4D38();
  if (os_log_type_enabled(v18, v19))
  {
    uint64_t v33 = a3;
    uint64_t v20 = swift_slowAlloc();
    uint64_t v34 = a2;
    uint64_t v21 = (uint8_t *)v20;
    uint64_t v22 = swift_slowAlloc();
    uint64_t v32 = a6;
    uint64_t v23 = v22;
    uint64_t v31 = a5;
    *(_DWORD *)uint64_t v21 = 136446210;
    unint64_t v30 = v21 + 4;
    uint64_t v36 = (uint64_t)v35;
    uint64_t v37 = v22;
    id v24 = v17;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26894B300);
    uint64_t v25 = sub_2380E4988();
    uint64_t v36 = sub_237EBC6BC(v25, v26, &v37);
    a5 = v31;
    sub_2380E4FC8();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_237EB8000, v18, v19, "MediaPlaybackProvider#destination resolved destination: %{public}s", v21, 0xCu);
    swift_arrayDestroy();
    uint64_t v27 = v23;
    a6 = v32;
    MEMORY[0x23EC87710](v27, -1, -1);
    uint64_t v28 = v21;
    a2 = v34;
    MEMORY[0x23EC87710](v28, -1, -1);
  }
  else
  {
  }
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  id v29 = sub_2380BD8E0(v35, a5, a6);
  a2();
}

void sub_2380AD2D0(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8 = sub_2380E4528();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v26 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = a1;
  *(void *)(v12 + 24) = a2;
  uint64_t v13 = qword_26894AA20;
  swift_retain();
  if (v13 != -1) {
    swift_once();
  }
  uint64_t v14 = __swift_project_value_buffer(v8, (uint64_t)qword_268956458);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, v14, v8);
  uint64_t v15 = sub_2380E4508();
  os_log_type_t v16 = sub_2380E4D38();
  if (os_log_type_enabled(v15, v16))
  {
    id v17 = (uint8_t *)swift_slowAlloc();
    uint64_t v18 = swift_slowAlloc();
    uint64_t v28 = a4;
    uint64_t v19 = v18;
    aBlock[0] = v18;
    uint64_t v27 = v12;
    *(_DWORD *)id v17 = 136446210;
    unint64_t v26 = v17 + 4;
    LOWORD(v29) = a3 & 0x101;
    BYTE2(v29) = BYTE2(a3) & 1;
    BYTE3(v29) = HIBYTE(a3) & 1;
    type metadata accessor for MPCAssistantWatchAudioRoutingInfo(0);
    uint64_t v20 = sub_2380E4988();
    uint64_t v29 = sub_237EBC6BC(v20, v21, aBlock);
    uint64_t v12 = v27;
    sub_2380E4FC8();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_237EB8000, v15, v16, "MediaPlaybackProvider#radioAvailability getting radio availability for routing: %{public}s", v17, 0xCu);
    swift_arrayDestroy();
    uint64_t v22 = v19;
    a4 = v28;
    MEMORY[0x23EC87710](v22, -1, -1);
    MEMORY[0x23EC87710](v17, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  uint64_t v23 = *(void **)(a4 + 136);
  uint64_t v24 = swift_allocObject();
  *(void *)(v24 + 16) = sub_237F38A7C;
  *(void *)(v24 + 24) = v12;
  aBlock[4] = (uint64_t)sub_2380C6F28;
  aBlock[5] = v24;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_2380AD884;
  aBlock[3] = (uint64_t)&block_descriptor_1622;
  uint64_t v25 = _Block_copy(aBlock);
  swift_release();
  objc_msgSend(v23, sel_assistantRadioGetAvailability_completion_, a3 & 0x1010101, v25);
  _Block_release(v25);
}

uint64_t sub_2380AD620(uint64_t a1, uint64_t (*a2)(void), uint64_t a3)
{
  uint64_t v21 = a3;
  uint64_t v5 = sub_2380E4528();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26894AA20 != -1) {
    swift_once();
  }
  uint64_t v9 = __swift_project_value_buffer(v5, (uint64_t)qword_268956458);
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, v9, v5);
  uint64_t v10 = sub_2380E4508();
  os_log_type_t v11 = sub_2380E4D38();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v12 = swift_slowAlloc();
    uint64_t v20 = a2;
    uint64_t v13 = (uint8_t *)v12;
    uint64_t v14 = swift_slowAlloc();
    uint64_t v22 = a1;
    uint64_t v23 = v14;
    *(_DWORD *)uint64_t v13 = 136315138;
    v19[1] = v13 + 4;
    uint64_t v15 = sub_2380E53B8();
    uint64_t v22 = sub_237EBC6BC(v15, v16, &v23);
    sub_2380E4FC8();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_237EB8000, v10, v11, "MediaPlaybackProvider#radioAvailability complete: %s", v13, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23EC87710](v14, -1, -1);
    id v17 = v13;
    a2 = v20;
    MEMORY[0x23EC87710](v17, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  return a2(a1);
}

uint64_t sub_2380AD884(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v3(a2);
  return swift_release();
}

uint64_t sub_2380AD8D8(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = sub_2380E4528();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)&v35 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26894AA20 != -1) {
    swift_once();
  }
  uint64_t v14 = __swift_project_value_buffer(v10, (uint64_t)qword_268956458);
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v13, v14, v10);
  uint64_t v15 = sub_2380E4508();
  os_log_type_t v16 = sub_2380E4D58();
  if (os_log_type_enabled(v15, v16))
  {
    id v17 = (uint8_t *)swift_slowAlloc();
    uint64_t v36 = v5;
    uint64_t v18 = a1;
    uint64_t v19 = a2;
    uint64_t v20 = a4;
    uint64_t v21 = a3;
    uint64_t v22 = v17;
    *(_WORD *)id v17 = 0;
    _os_log_impl(&dword_237EB8000, v15, v16, "MediaPlaybackProvider#play (provisional)", v17, 2u);
    uint64_t v23 = v22;
    a3 = v21;
    a4 = v20;
    a2 = v19;
    a1 = v18;
    uint64_t v5 = v36;
    MEMORY[0x23EC87710](v23, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  id v24 = objc_msgSend(a1, sel_outputDeviceUIDs);
  uint64_t v25 = sub_2380E4B28();

  uint64_t v26 = *(void *)(v25 + 16);
  swift_bridgeObjectRelease();
  if (v26)
  {
    uint64_t v27 = v5[38];
    uint64_t v28 = v5[39];
    __swift_project_boxed_opaque_existential_1(v5 + 35, v27);
    uint64_t v29 = (void *)swift_allocObject();
    v29[2] = v5;
    v29[3] = a1;
    v29[4] = a2;
    v29[5] = a3;
    v29[6] = a4;
    unint64_t v30 = *(void (**)(uint64_t (*)(uint64_t), void *, uint64_t, uint64_t))(v28 + 16);
    swift_retain();
    id v31 = a1;
    swift_bridgeObjectRetain();
    swift_retain();
    v30(sub_2380C6E68, v29, v27, v28);
  }
  else
  {
    if (qword_26894ABF0 != -1) {
      swift_once();
    }
    uint64_t v32 = (void *)swift_allocObject();
    uint64_t v32[2] = v5;
    v32[3] = a1;
    v32[4] = a2;
    uint64_t v32[5] = a3;
    v32[6] = a4;
    swift_retain();
    id v33 = a1;
    swift_bridgeObjectRetain();
    swift_retain();
    sub_237F056E4((uint64_t)sub_2380C6E9C, (uint64_t)v32);
  }
  return swift_release();
}

void sub_2380ADC14(void *a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (!a1) {
    goto LABEL_8;
  }
  id v22 = a1;
  id v11 = objc_msgSend(v22, sel_mediaRouteIdentifier);
  if (!v11)
  {

LABEL_8:
    if (qword_26894ABF0 != -1) {
      swift_once();
    }
    uint64_t v20 = (void *)swift_allocObject();
    v20[2] = a2;
    v20[3] = a3;
    v20[4] = a4;
    v20[5] = a5;
    v20[6] = a6;
    swift_retain();
    id v21 = a3;
    swift_bridgeObjectRetain();
    swift_retain();
    sub_237F056E4((uint64_t)sub_2380C6E9C, (uint64_t)v20);
    goto LABEL_11;
  }
  uint64_t v12 = v11;
  uint64_t v13 = sub_2380E4938();
  uint64_t v15 = v14;

  id v16 = objc_msgSend(a3, sel_outputDeviceUIDs);
  id v17 = (void *)sub_2380E4B28();

  LOBYTE(v16) = sub_237EE5620(v13, v15, v17);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v16)
  {
    if (qword_26894ABF0 != -1) {
      swift_once();
    }
    uint64_t v18 = (void *)swift_allocObject();
    v18[2] = a2;
    v18[3] = a3;
    v18[4] = a4;
    v18[5] = a5;
    v18[6] = a6;
    swift_retain();
    id v19 = a3;
    swift_bridgeObjectRetain();
    swift_retain();
    sub_237F056E4((uint64_t)sub_2380C6E9C, (uint64_t)v18);

LABEL_11:
    swift_release();
    return;
  }
  sub_2380AE050(a3, a4, a5, a6);
}

uint64_t sub_2380ADE88(char a1)
{
  uint64_t v2 = sub_2380E4528();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26894AA20 != -1) {
    swift_once();
  }
  uint64_t v6 = __swift_project_value_buffer(v2, (uint64_t)qword_268956458);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v6, v2);
  uint64_t v7 = sub_2380E4508();
  os_log_type_t v8 = sub_2380E4D58();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v9 = 67109120;
    v11[3] = a1 & 1;
    sub_2380E4FC8();
    _os_log_impl(&dword_237EB8000, v7, v8, "MediaPlaybackProvider#checkTTSEndToSendPlayDelay did AutoBugCapture for long delay between TTSEnd and SendPlay with: %{BOOL}d", v9, 8u);
    MEMORY[0x23EC87710](v9, -1, -1);
  }

  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t sub_2380AE050(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v49 = a3;
  uint64_t v50 = a4;
  uint64_t v52 = *v4;
  unint64_t v53 = v4;
  uint64_t v7 = sub_2380E44F8();
  uint64_t v54 = *(void *)(v7 - 8);
  uint64_t v8 = *(void *)(v54 + 64);
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  unint64_t v48 = (char *)v41 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  uint64_t v51 = (char *)v41 - v10;
  uint64_t v11 = sub_2380E4528();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)v41 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26894AA20 != -1) {
    swift_once();
  }
  uint64_t v15 = __swift_project_value_buffer(v11, (uint64_t)qword_268956458);
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v14, v15, v11);
  id v16 = a1;
  swift_bridgeObjectRetain_n();
  id v17 = v16;
  uint64_t v18 = sub_2380E4508();
  int v19 = sub_2380E4D58();
  BOOL v20 = os_log_type_enabled(v18, (os_log_type_t)v19);
  uint64_t v55 = a2;
  uint64_t v47 = (uint64_t)v17;
  if (v20)
  {
    int v42 = v19;
    os_log_t v44 = v18;
    uint64_t v45 = v8;
    uint64_t v46 = v7;
    uint64_t v21 = swift_slowAlloc();
    id v22 = (void *)swift_slowAlloc();
    uint64_t v43 = swift_slowAlloc();
    uint64_t v57 = v43;
    *(_DWORD *)uint64_t v21 = 136446722;
    if (qword_26894A8A8 != -1) {
      swift_once();
    }
    uint64_t v23 = qword_26894BE10;
    unint64_t v24 = *(void *)algn_26894BE18;
    swift_bridgeObjectRetain();
    uint64_t v56 = sub_237EBC6BC(v23, v24, &v57);
    sub_2380E4FC8();
    swift_bridgeObjectRelease();
    *(_WORD *)(v21 + 12) = 2114;
    uint64_t v56 = (uint64_t)v17;
    id v25 = v17;
    sub_2380E4FC8();
    *id v22 = v17;

    *(_WORD *)(v21 + 22) = 2080;
    v41[1] = v21 + 24;
    type metadata accessor for CFString(0);
    sub_2380BEFD0((unint64_t *)&qword_26894AE00, type metadata accessor for CFString);
    swift_bridgeObjectRetain();
    uint64_t v26 = sub_2380E4838();
    unint64_t v28 = v27;
    swift_bridgeObjectRelease();
    uint64_t v56 = sub_237EBC6BC(v26, v28, &v57);
    sub_2380E4FC8();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    os_log_t v29 = v44;
    _os_log_impl(&dword_237EB8000, v44, (os_log_type_t)v42, "MediaPlaybackProvider#play %{public}s sending MRMediaRemoteCommandPlay to destination:%{public}@, options: %s", (uint8_t *)v21, 0x20u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26894C570);
    swift_arrayDestroy();
    MEMORY[0x23EC87710](v22, -1, -1);
    uint64_t v30 = v43;
    swift_arrayDestroy();
    MEMORY[0x23EC87710](v30, -1, -1);
    MEMORY[0x23EC87710](v21, -1, -1);

    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
    uint64_t v8 = v45;
    uint64_t v7 = v46;
  }
  else
  {

    swift_bridgeObjectRelease_n();
    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  }
  if (qword_26894A818 != -1) {
    swift_once();
  }
  id v31 = (id)qword_268956368;
  uint64_t v32 = v51;
  sub_2380E44D8();
  uint64_t v33 = v54;
  uint64_t v34 = v48;
  (*(void (**)(char *, char *, uint64_t))(v54 + 16))(v48, v32, v7);
  unint64_t v35 = (*(unsigned __int8 *)(v33 + 80) + 33) & ~(unint64_t)*(unsigned __int8 *)(v33 + 80);
  uint64_t v36 = swift_allocObject();
  *(void *)(v36 + 16) = "mediaPlaybackProviderPlay";
  *(void *)(v36 + 24) = 25;
  *(unsigned char *)(v36 + 32) = 2;
  (*(void (**)(unint64_t, char *, uint64_t))(v33 + 32))(v36 + v35, v34, v7);
  uint64_t v37 = (void *)(v36 + ((v8 + v35 + 7) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v38 = v50;
  *uint64_t v37 = v49;
  v37[1] = v38;
  swift_retain();
  sub_2380E4EB8();
  sub_2380E44B8();
  uint64_t v39 = swift_allocObject();
  *(void *)(v39 + 16) = sub_237EE1900;
  *(void *)(v39 + 24) = v36;
  swift_retain();
  sub_2380AE6F0((uint64_t)sub_237EE14C0, v39, (uint64_t)v53, v55, v47, v52);
  swift_release();
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v33 + 8))(v32, v7);
}

uint64_t sub_2380AE6F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v76 = a6;
  uint64_t v77 = a2;
  uint64_t v78 = a5;
  uint64_t v79 = a3;
  uint64_t v80 = a4;
  uint64_t v75 = a1;
  uint64_t v70 = sub_2380E4528();
  uint64_t v69 = *(void *)(v70 - 8);
  MEMORY[0x270FA5388](v70);
  uint64_t v81 = (char *)&v67 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26894D0D0);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v67 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_2380E2E98();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)&v67 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  unint64_t v67 = (char *)&v67 - v15;
  uint64_t v74 = sub_2380E2E28();
  uint64_t v73 = *(void *)(v74 - 8);
  uint64_t v16 = MEMORY[0x270FA5388](v74);
  uint64_t v71 = (char *)&v67 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v68 = v17;
  MEMORY[0x270FA5388](v16);
  os_log_t v72 = (char *)&v67 - v18;
  sub_2380E2E18();
  if (qword_26894A8A0 != -1) {
    swift_once();
  }
  swift_beginAccess();
  uint64_t v20 = qword_26894BD60;
  uint64_t v19 = unk_26894BD68;
  uint64_t v21 = __swift_project_boxed_opaque_existential_1(qword_26894BD48, qword_26894BD60);
  uint64_t v22 = *(void *)(v20 - 8);
  MEMORY[0x270FA5388](v21);
  unint64_t v24 = (char *)&v67 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v22 + 16))(v24);
  (*(void (**)(uint64_t, uint64_t))(v19 + 16))(v20, v19);
  uint64_t v26 = v25;
  (*(void (**)(char *, uint64_t))(v22 + 8))(v24, v20);
  unint64_t v27 = &off_264D03000;
  if (v26)
  {
    sub_2380E2E38();
    swift_bridgeObjectRelease();
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10) == 1)
    {
      sub_237F098FC((uint64_t)v9, &qword_26894D0D0);
    }
    else
    {
      uint64_t v28 = (uint64_t)v67;
      (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v67, v9, v10);
      id v29 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for SiriAudioSelfLogger()), sel_init);
      sub_237F078F0(18, v28);

      (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v28, v10);
    }
  }
  uint64_t v30 = (void *)v79;
  sub_2380C0A10();
  uint64_t v31 = v30[15];
  uint64_t v32 = v30[16];
  __swift_project_boxed_opaque_existential_1(v30 + 12, v31);
  uint64_t v33 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v32 + 8))(1006, v31, v32);
  sub_2380E2E88();
  uint64_t v34 = sub_2380E2E48();
  unint64_t v36 = v35;
  (*(void (**)(char *, uint64_t))(v11 + 8))(v14, v10);
  uint64_t v37 = v80;
  swift_bridgeObjectRetain();
  uint64_t v38 = sub_2380E4918();
  uint64_t result = sub_237EC83D4(0, (unint64_t *)&unk_26894C740);
  uint64_t v89 = result;
  *(void *)&long long v88 = v38;
  if (*MEMORY[0x263F54C88])
  {
    id v40 = (id)*MEMORY[0x263F54C88];
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v87 = v37;
    sub_237EDB130(&v88, v40, isUniquelyReferenced_nonNull_native, &aBlock);
    uint64_t v42 = v87;

    swift_bridgeObjectRelease();
    sub_237F098FC((uint64_t)&aBlock, (uint64_t *)&unk_26894D750);
    uint64_t v43 = v70;
    uint64_t v44 = v69;
    if (qword_26894AA20 != -1) {
      swift_once();
    }
    uint64_t v80 = v33;
    uint64_t v45 = __swift_project_value_buffer(v43, (uint64_t)qword_268956458);
    uint64_t v46 = v81;
    (*(void (**)(char *, uint64_t, uint64_t))(v44 + 16))(v81, v45, v43);
    swift_bridgeObjectRetain();
    uint64_t v47 = sub_2380E4508();
    os_log_type_t v48 = sub_2380E4D38();
    if (os_log_type_enabled(v47, v48))
    {
      uint64_t v49 = swift_slowAlloc();
      uint64_t v79 = v42;
      uint64_t v50 = (uint8_t *)v49;
      uint64_t v51 = swift_slowAlloc();
      *(void *)&long long aBlock = v51;
      *(_DWORD *)uint64_t v50 = 136315138;
      swift_bridgeObjectRetain();
      *(void *)&long long v88 = sub_237EBC6BC(v34, v36, (uint64_t *)&aBlock);
      unint64_t v27 = &off_264D03000;
      sub_2380E4FC8();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_237EB8000, v47, v48, "MediaPlaybackProvider#internalPlayLogic sending command to MR with ID: %s", v50, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x23EC87710](v51, -1, -1);
      uint64_t v52 = v50;
      uint64_t v42 = v79;
      MEMORY[0x23EC87710](v52, -1, -1);

      (*(void (**)(char *, uint64_t))(v44 + 8))(v81, v43);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      (*(void (**)(char *, uint64_t))(v44 + 8))(v46, v43);
    }
    uint64_t v81 = (char *)[objc_allocWithZone(MEMORY[0x263F54780]) (SEL)v27[220]];
    uint64_t v53 = swift_bridgeObjectRetain();
    sub_237F76CF8(v53);
    uint64_t v54 = v42;
    swift_bridgeObjectRelease();
    uint64_t v79 = sub_2380E4818();
    swift_bridgeObjectRelease();
    uint64_t v55 = v73;
    uint64_t v56 = v71;
    uint64_t v57 = v72;
    uint64_t v58 = v74;
    (*(void (**)(char *, char *, uint64_t))(v73 + 16))(v71, v72, v74);
    unint64_t v59 = (*(unsigned __int8 *)(v55 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v55 + 80);
    unint64_t v60 = (v68 + v59 + 7) & 0xFFFFFFFFFFFFFFF8;
    uint64_t v61 = swift_allocObject();
    *(void *)(v61 + 16) = v80;
    *(void *)(v61 + 24) = v54;
    (*(void (**)(unint64_t, char *, uint64_t))(v55 + 32))(v61 + v59, v56, v58);
    uint64_t v62 = (void *)(v61 + v60);
    uint64_t v63 = v77;
    *uint64_t v62 = v75;
    v62[1] = v63;
    *(void *)(v61 + ((v60 + 23) & 0xFFFFFFFFFFFFFFF8)) = v76;
    uint64_t v85 = sub_2380C6DB4;
    uint64_t v86 = v61;
    *(void *)&long long aBlock = MEMORY[0x263EF8330];
    *((void *)&aBlock + 1) = 1107296256;
    unint64_t v83 = sub_237EFF834;
    uint64_t v84 = &block_descriptor_1599;
    uint64_t v64 = _Block_copy(&aBlock);
    swift_retain();
    swift_retain();
    swift_release();
    uint64_t v65 = v81;
    uint64_t v66 = (void *)v79;
    objc_msgSend(v81, sel_sendCommandWithResult_toDestination_withOptions_completion_, 0, v78, v79, v64);
    _Block_release(v64);
    swift_release();

    return (*(uint64_t (**)(char *, uint64_t))(v55 + 8))(v57, v58);
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_2380AF024(id a1, uint64_t a2, uint64_t a3, uint8_t *a4, uint64_t a5, uint64_t a6)
{
  if (a2) {
    sub_237FBCEAC();
  }
  if (a1)
  {
    id v17 = objc_msgSend(a1, sel_error);
    id v11 = objc_msgSend(a1, sel_returnStatuses);
    sub_237EC83D4(0, (unint64_t *)&qword_26894C6D0);
    uint64_t v12 = (uint8_t *)sub_2380E4B28();

    id v13 = objc_msgSend(a1, sel_commandResult);
    id v14 = objc_msgSend(v13, sel_resultStatuses);

    sub_237EC83D4(0, &qword_26894D4D8);
    uint64_t v15 = sub_2380E4B28();

    uint64_t v16 = v17;
    a1 = objc_msgSend(a1, sel_commandResult);
  }
  else
  {
    uint64_t v15 = 0;
    uint64_t v12 = 0;
    uint64_t v16 = 0;
  }
  sub_2380AF238(a3, 0xD00000000000001ALL, 0x80000002380FB960, 0xD000000000000018, (void (*)(void, void))0x80000002380FB1D0, a4, (uint64_t)v16, v12, v15, a1, 2u, (uint64_t)"mediaPlaybackProviderStatusPlay", 31, 2u, a5, a6);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

uint64_t sub_2380AF238(uint64_t a1, uint64_t a2, unint64_t a3, NSObject *a4, void (*a5)(void, void), uint8_t *a6, uint64_t a7, uint8_t *a8, uint64_t a9, void *a10, unsigned __int8 a11, uint64_t a12, uint64_t a13, unsigned __int8 a14, uint64_t a15, uint64_t a16)
{
  uint64_t v103 = a6;
  uint64_t v116 = a2;
  unint64_t v117 = a3;
  uint64_t v107 = a1;
  uint64_t v102 = sub_2380E2E28();
  uint64_t v101 = *(void *)(v102 - 8);
  MEMORY[0x270FA5388](v102);
  char v100 = (char *)&v92 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = sub_2380E4528();
  uint64_t v114 = *(void *)(v21 - 8);
  uint64_t v115 = v21;
  uint64_t v22 = MEMORY[0x270FA5388](v21);
  double v93 = (char *)&v92 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = MEMORY[0x270FA5388](v22);
  uint64_t v92 = (char *)&v92 - v25;
  MEMORY[0x270FA5388](v24);
  uint64_t v112 = (char *)&v92 - v26;
  uint64_t v27 = sub_2380E4458();
  uint64_t v28 = *(void *)(v27 - 8);
  MEMORY[0x270FA5388](v27);
  uint64_t v30 = (char *)&v92 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v104 = sub_2380C0ED0();
  uint64_t v105 = v31;
  uint64_t v120 = MEMORY[0x263F8EE78];
  uint64_t v113 = a9;
  if ((a4 != 0xD000000000000026 || a5 != (void (*)(void, void))0x80000002380FB130)
    && (sub_2380E5408() & 1) == 0)
  {
    if (sub_2380C1040(&v120))
    {
      sub_2380E4488();
      uint64_t v32 = sub_2380E4438();
      unint64_t v34 = v33;
      swift_bridgeObjectRelease();
      uint64_t v35 = HIBYTE(v34) & 0xF;
      if ((v34 & 0x2000000000000000) == 0) {
        uint64_t v35 = v32 & 0xFFFFFFFFFFFFLL;
      }
      if (v35)
      {
        uint64_t v36 = v120;
        uint64_t v37 = sub_2380E4438();
        sub_2380C185C(v36, v37, v38);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v28 + 8))(v30, v27);
      }
      else
      {
        (*(void (**)(char *, uint64_t))(v28 + 8))(v30, v27);
        swift_bridgeObjectRelease();
      }
    }
    else
    {
      swift_bridgeObjectRelease();
    }
  }
  uint64_t v111 = (void *)a7;
  if (qword_26894AA20 != -1) {
    swift_once();
  }
  uint64_t v106 = a10;
  uint64_t v108 = a4;
  uint64_t v39 = v115;
  uint64_t v40 = __swift_project_value_buffer(v115, (uint64_t)qword_268956458);
  uint64_t v41 = v114;
  uint64_t v42 = *(void (**)(char *, uint64_t, uint64_t))(v114 + 16);
  uint64_t v43 = v112;
  uint64_t v94 = v40;
  double v95 = v42;
  ((void (*)(char *))v42)(v112);
  swift_bridgeObjectRetain_n();
  unint64_t v44 = v117;
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  uint64_t v45 = sub_2380E4508();
  int v46 = sub_2380E4D58();
  BOOL v47 = os_log_type_enabled(v45, (os_log_type_t)v46);
  v110 = a5;
  if (v47)
  {
    LODWORD(v99) = v46;
    os_log_type_t v48 = a8;
    uint64_t v49 = swift_slowAlloc();
    uint64_t v98 = swift_slowAlloc();
    uint64_t v119 = v98;
    *(_DWORD *)uint64_t v49 = 136446978;
    swift_bridgeObjectRetain();
    uint64_t v118 = sub_237EBC6BC(v116, v44, &v119);
    sub_2380E4FC8();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v49 + 12) = 2082;
    if (qword_26894A8A8 != -1) {
      swift_once();
    }
    uint64_t v51 = qword_26894BE10;
    unint64_t v50 = *(void *)algn_26894BE18;
    swift_bridgeObjectRetain();
    uint64_t v118 = sub_237EBC6BC(v51, v50, &v119);
    sub_2380E4FC8();
    swift_bridgeObjectRelease();
    *(_WORD *)(v49 + 22) = 2082;
    if (v48) {
      uint64_t v52 = v48;
    }
    else {
      uint64_t v52 = (uint8_t *)MEMORY[0x263F8EE78];
    }
    uint64_t v53 = sub_237EC83D4(0, (unint64_t *)&qword_26894C6D0);
    swift_bridgeObjectRetain();
    uint64_t v54 = MEMORY[0x23EC86140](v52, v53);
    unint64_t v56 = v55;
    swift_bridgeObjectRelease();
    uint64_t v118 = sub_237EBC6BC(v54, v56, &v119);
    sub_2380E4FC8();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v49 + 32) = 2082;
    if (v113) {
      uint64_t v57 = v113;
    }
    else {
      uint64_t v57 = MEMORY[0x263F8EE78];
    }
    uint64_t v58 = sub_237EC83D4(0, &qword_26894D4D8);
    swift_bridgeObjectRetain();
    uint64_t v59 = MEMORY[0x23EC86140](v57, v58);
    unint64_t v61 = v60;
    swift_bridgeObjectRelease();
    uint64_t v118 = sub_237EBC6BC(v59, v61, &v119);
    sub_2380E4FC8();
    swift_bridgeObjectRelease_n();
    a8 = v48;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_237EB8000, v45, (os_log_type_t)v99, "%{public}s %{public}s - Result codes: %{public}s, Extended status type: %{public}s", (uint8_t *)v49, 0x2Au);
    uint64_t v62 = v98;
    swift_arrayDestroy();
    MEMORY[0x23EC87710](v62, -1, -1);
    MEMORY[0x23EC87710](v49, -1, -1);

    uint64_t v39 = v115;
    uint64_t v63 = *(void (**)(char *, uint64_t))(v114 + 8);
    v63(v112, v115);
    a5 = v110;
    unint64_t v44 = v117;
  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
    uint64_t v64 = v43;
    uint64_t v63 = *(void (**)(char *, uint64_t))(v41 + 8);
    v63(v64, v39);
  }
  uint64_t v97 = a15;
  LODWORD(v112) = a14;
  uint64_t v99 = a13;
  uint64_t v98 = a12;
  int v96 = a11;
  uint64_t v65 = v100;
  sub_2380E2E18();
  sub_2380E2D78();
  double v67 = v66;
  (*(void (**)(char *, uint64_t))(v101 + 8))(v65, v102);
  if (v67 >= 4.0)
  {
    uint64_t v68 = v93;
    v95(v93, v94, v39);
    swift_bridgeObjectRetain_n();
    uint64_t v69 = sub_2380E4508();
    os_log_type_t v78 = sub_2380E4D48();
    if (os_log_type_enabled(v69, v78))
    {
      uint64_t v71 = v63;
      uint64_t v103 = a8;
      uint64_t v79 = swift_slowAlloc();
      unint64_t v80 = v44;
      uint64_t v81 = swift_slowAlloc();
      uint64_t v119 = v81;
      *(_DWORD *)uint64_t v79 = 136446722;
      swift_bridgeObjectRetain();
      uint64_t v118 = sub_237EBC6BC(v116, v80, &v119);
      sub_2380E4FC8();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v79 + 12) = 2082;
      if (qword_26894A8A8 != -1) {
        swift_once();
      }
      uint64_t v82 = qword_26894BE10;
      unint64_t v83 = *(void *)algn_26894BE18;
      swift_bridgeObjectRetain();
      uint64_t v118 = sub_237EBC6BC(v82, v83, &v119);
      sub_2380E4FC8();
      swift_bridgeObjectRelease();
      *(_WORD *)(v79 + 22) = 2050;
      uint64_t v118 = *(void *)&v67;
      sub_2380E4FC8();
      _os_log_impl(&dword_237EB8000, v69, v78, "%{public}s %{public}s completed in %{public}f seconds (logging at error for timing visibility)", (uint8_t *)v79, 0x20u);
      swift_arrayDestroy();
      MEMORY[0x23EC87710](v81, -1, -1);
      MEMORY[0x23EC87710](v79, -1, -1);

      uint64_t v77 = &v122;
      goto LABEL_33;
    }
LABEL_34:

    swift_bridgeObjectRelease_n();
    v63(v68, v39);
    goto LABEL_35;
  }
  uint64_t v68 = v92;
  v95(v92, v94, v39);
  swift_bridgeObjectRetain_n();
  uint64_t v69 = sub_2380E4508();
  os_log_type_t v70 = sub_2380E4D58();
  if (!os_log_type_enabled(v69, v70)) {
    goto LABEL_34;
  }
  uint64_t v71 = v63;
  uint64_t v103 = a8;
  uint64_t v72 = swift_slowAlloc();
  unint64_t v73 = v44;
  uint64_t v74 = swift_slowAlloc();
  uint64_t v119 = v74;
  *(_DWORD *)uint64_t v72 = 136446722;
  swift_bridgeObjectRetain();
  uint64_t v118 = sub_237EBC6BC(v116, v73, &v119);
  sub_2380E4FC8();
  swift_bridgeObjectRelease_n();
  *(_WORD *)(v72 + 12) = 2082;
  if (qword_26894A8A8 != -1) {
    swift_once();
  }
  uint64_t v75 = qword_26894BE10;
  unint64_t v76 = *(void *)algn_26894BE18;
  swift_bridgeObjectRetain();
  uint64_t v118 = sub_237EBC6BC(v75, v76, &v119);
  sub_2380E4FC8();
  swift_bridgeObjectRelease();
  *(_WORD *)(v72 + 22) = 2050;
  uint64_t v118 = *(void *)&v67;
  sub_2380E4FC8();
  _os_log_impl(&dword_237EB8000, v69, v70, "%{public}s %{public}s completed in %{public}f seconds", (uint8_t *)v72, 0x20u);
  swift_arrayDestroy();
  MEMORY[0x23EC87710](v74, -1, -1);
  MEMORY[0x23EC87710](v72, -1, -1);

  uint64_t v77 = &v121;
LABEL_33:
  v71((char *)*(v77 - 32), v115);
  a8 = v103;
  a5 = v110;
  unint64_t v44 = v117;
LABEL_35:
  uint64_t v84 = swift_allocObject();
  uint64_t v85 = v116;
  *(void *)(v84 + 16) = v116;
  *(void *)(v84 + 24) = v44;
  uint64_t v87 = v108;
  uint64_t v86 = v109;
  *(void *)(v84 + 32) = v108;
  *(void *)(v84 + 40) = a5;
  long long v88 = v106;
  *(void *)(v84 + 48) = v86;
  *(void *)(v84 + 56) = v88;
  *(unsigned char *)(v84 + 64) = v96;
  *(void *)(v84 + 72) = v97;
  *(void *)(v84 + 80) = a16;
  id v89 = v88;
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v90 = v111;
  sub_237F1423C(v87, a5, (uint64_t)v111, a8, (uint8_t *)v88, (void (*)(unint64_t *, uint64_t, void *))sub_2380C5D60, v84);
  swift_release();
  sub_2380B173C(v86, v107, v85, v44, (uint64_t)v87, (uint64_t)a5, v90, (uint64_t)a8, v113, v88, v98, v99, v112, v104, v105);
  return swift_bridgeObjectRelease();
}

void sub_2380AFF30(id a1, uint64_t a2, uint64_t a3, uint8_t *a4, char a5, uint64_t a6, uint64_t a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a2) {
    sub_237FBCEAC();
  }
  if (a1)
  {
    id v15 = objc_msgSend(a1, sel_error);
    id v16 = objc_msgSend(a1, sel_returnStatuses);
    sub_237EC83D4(0, (unint64_t *)&qword_26894C6D0);
    id v17 = (uint8_t *)sub_2380E4B28();

    id v18 = objc_msgSend(a1, sel_commandResult);
    id v19 = objc_msgSend(v18, sel_resultStatuses);

    sub_237EC83D4(0, &qword_26894D4D8);
    uint64_t v20 = sub_2380E4B28();

    a1 = objc_msgSend(a1, sel_commandResult);
  }
  else
  {
    uint64_t v20 = 0;
    id v17 = 0;
    id v15 = 0;
  }
  sub_2380AF238(a3, 0xD00000000000001ALL, 0x80000002380FB8F0, 0xD00000000000001DLL, (void (*)(void, void))0x80000002380FB1B0, a4, (uint64_t)v15, v17, v20, a1, a5 & 1, (uint64_t)"mediaPlaybackProviderStatusSendQueue", 36, 2u, a6, a7);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

uint64_t sub_2380B0134(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7, uint64_t a8, unsigned __int8 a9, uint64_t a10)
{
  uint64_t v34 = a4;
  uint64_t v35 = (void *)a8;
  uint64_t v15 = sub_2380E4528();
  uint64_t v16 = *(void *)(v15 - 8);
  MEMORY[0x270FA5388](v15);
  id v18 = (char *)&v31 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v19 = sub_2380575FC(a2);
  if (qword_26894AA20 != -1) {
    swift_once();
  }
  uint64_t v33 = a10;
  int v32 = a9;
  uint64_t v20 = __swift_project_value_buffer(v15, (uint64_t)qword_268956458);
  (*(void (**)(char *, uint64_t, uint64_t))(v16 + 16))(v18, v20, v15);
  uint64_t v21 = sub_2380E4508();
  os_log_type_t v22 = sub_2380E4D58();
  if (os_log_type_enabled(v21, v22))
  {
    uint64_t v23 = (uint8_t *)swift_slowAlloc();
    uint64_t v31 = a7;
    uint64_t v24 = a6;
    uint64_t v25 = a5;
    uint64_t v26 = a3;
    uint64_t v27 = v23;
    *(_DWORD *)uint64_t v23 = 67109120;
    int v36 = v19 & 1;
    sub_2380E4FC8();
    _os_log_impl(&dword_237EB8000, v21, v22, "MediaPlaybackProvider#waitForTTSSynth setQueue done waiting on TTS synthesis, receivedNotification = %{BOOL}d", v27, 8u);
    uint64_t v28 = v27;
    a3 = v26;
    a5 = v25;
    a6 = v24;
    a7 = v31;
    MEMORY[0x23EC87710](v28, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v16 + 8))(v18, v15);
  uint64_t v29 = v35;
  sub_237F05BCC(1, v19 & 1, a3, v34, a5, a6, (uint64_t)a7, (uint64_t)v35, v32 & 1, v33);

  swift_bridgeObjectRelease();
  swift_release();
  return swift_release();
}

uint64_t sub_2380B03C0@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v4 = sub_2380E4528();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  uint64_t v34 = (char *)&v27 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v27 - v8;
  if (qword_26894AA20 != -1) {
    swift_once();
  }
  uint64_t v10 = __swift_project_value_buffer(v4, (uint64_t)qword_268956458);
  uint64_t v33 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
  v33(v9, v10, v4);
  id v11 = a1;
  uint64_t v12 = sub_2380E4508();
  os_log_type_t v13 = sub_2380E4D38();
  if (os_log_type_enabled(v12, v13))
  {
    uint64_t v14 = swift_slowAlloc();
    uint64_t v31 = v4;
    uint64_t v15 = (uint8_t *)v14;
    uint64_t v28 = (void *)swift_slowAlloc();
    int v32 = a2;
    uint64_t v29 = v15;
    uint64_t v30 = v9;
    *(_DWORD *)uint64_t v15 = 138543362;
    uint64_t v35 = v11;
    uint64_t v16 = v11;
    uint64_t v9 = v30;
    a2 = v32;
    sub_2380E4FC8();
    uint64_t v17 = v28;
    *uint64_t v28 = v11;

    id v18 = v29;
    _os_log_impl(&dword_237EB8000, v12, v13, "MediaPlaybackProvider#hasItems for query: %{public}@", v29, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26894C570);
    swift_arrayDestroy();
    MEMORY[0x23EC87710](v17, -1, -1);
    uint64_t v4 = v31;
    MEMORY[0x23EC87710](v18, -1, -1);
  }
  else
  {

    uint64_t v12 = v11;
  }

  char v19 = *(void (**)(char *, uint64_t))(v5 + 8);
  v19(v9, v4);
  unsigned int v20 = [v11 _hasItems];
  v33(v34, v10, v4);
  uint64_t v21 = sub_2380E4508();
  os_log_type_t v22 = sub_2380E4D38();
  if (os_log_type_enabled(v21, v22))
  {
    uint64_t v23 = v4;
    uint64_t v24 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v24 = 67240192;
    unsigned int v36 = v20;
    sub_2380E4FC8();
    _os_log_impl(&dword_237EB8000, v21, v22, "MediaPlaybackProvider#hasItems: %{BOOL,public}d", v24, 8u);
    uint64_t v25 = v24;
    uint64_t v4 = v23;
    MEMORY[0x23EC87710](v25, -1, -1);
  }

  uint64_t result = ((uint64_t (*)(char *, uint64_t))v19)(v34, v4);
  *a2 = v20;
  return result;
}

uint64_t sub_2380B0754@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v4 = sub_2380E4528();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  uint64_t v26 = (char *)&v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v24 - v8;
  if (qword_26894AA20 != -1) {
    swift_once();
  }
  uint64_t v10 = __swift_project_value_buffer(v4, (uint64_t)qword_268956458);
  id v11 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
  v11(v9, v10, v4);
  uint64_t v12 = sub_2380E4508();
  os_log_type_t v13 = sub_2380E4D38();
  if (os_log_type_enabled(v12, v13))
  {
    uint64_t v14 = (uint8_t *)swift_slowAlloc();
    uint64_t v25 = a1;
    uint64_t v15 = a2;
    uint64_t v16 = v14;
    *(_WORD *)uint64_t v14 = 0;
    _os_log_impl(&dword_237EB8000, v12, v13, "MediaPlaybackProvider#hasSongs for library", v14, 2u);
    uint64_t v17 = v16;
    a2 = v15;
    a1 = v25;
    MEMORY[0x23EC87710](v17, -1, -1);
  }

  id v18 = *(void (**)(char *, uint64_t))(v5 + 8);
  v18(v9, v4);
  unsigned int v19 = objc_msgSend(a1, sel_hasSongs);
  v11(v26, v10, v4);
  unsigned int v20 = sub_2380E4508();
  os_log_type_t v21 = sub_2380E4D38();
  if (os_log_type_enabled(v20, v21))
  {
    os_log_type_t v22 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)os_log_type_t v22 = 67109120;
    unsigned int v27 = v19;
    sub_2380E4FC8();
    _os_log_impl(&dword_237EB8000, v20, v21, "MediaPlaybackProvider#hasSongs: %{BOOL}d", v22, 8u);
    MEMORY[0x23EC87710](v22, -1, -1);
  }

  uint64_t result = ((uint64_t (*)(char *, uint64_t))v18)(v26, v4);
  *a2 = v19;
  return result;
}

void sub_2380B0A10(void *a1@<X1>, void *a2@<X8>)
{
  uint64_t v5 = sub_2380E4528();
  uint64_t v26 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = (char *)&v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = 0xD000000000000012;
  unint64_t v28 = 0x80000002380F5CC0;
  sub_2380E4A18();
  uint64_t v8 = v27;
  unint64_t v9 = v28;
  if (qword_26894AA20 != -1) {
    swift_once();
  }
  uint64_t v10 = __swift_project_value_buffer(v5, (uint64_t)qword_268956458);
  (*(void (**)(char *, uint64_t, uint64_t))(v26 + 16))(v7, v10, v5);
  swift_bridgeObjectRetain_n();
  id v11 = sub_2380E4508();
  os_log_type_t v12 = sub_2380E4D38();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v23 = a1;
    uint64_t v13 = swift_slowAlloc();
    uint64_t v24 = a2;
    uint64_t v14 = (uint8_t *)v13;
    uint64_t v15 = swift_slowAlloc();
    uint64_t v25 = v2;
    uint64_t v16 = v15;
    uint64_t v27 = v15;
    uint64_t v22 = v5;
    *(_DWORD *)uint64_t v14 = 136315138;
    swift_bridgeObjectRetain();
    uint64_t v29 = sub_237EBC6BC(v8, v9, &v27);
    a1 = v23;
    sub_2380E4FC8();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_237EB8000, v11, v12, "Transformed playback identifier to spotlight identifier: %s", v14, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23EC87710](v16, -1, -1);
    uint64_t v17 = v14;
    a2 = v24;
    MEMORY[0x23EC87710](v17, -1, -1);

    (*(void (**)(char *, uint64_t))(v26 + 8))(v7, v22);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    (*(void (**)(char *, uint64_t))(v26 + 8))(v7, v5);
  }
  id v18 = (void *)sub_2380E4918();
  swift_bridgeObjectRelease();
  id v19 = objc_msgSend(a1, sel_entityWithSpotlightIdentifier_, v18);

  if (v19)
  {
    id v20 = objc_msgSend(v19, sel_representativeItem);
  }
  else
  {
    id v20 = 0;
  }
  *a2 = v20;
}

uint64_t sub_2380B0D40(int a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v24 = a2;
  int v23 = a1;
  uint64_t v6 = *v4;
  uint64_t v21 = a3;
  uint64_t v22 = v6;
  uint64_t v7 = sub_2380E44F8();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(void *)(v8 + 64);
  uint64_t v10 = MEMORY[0x270FA5388](v7);
  id v11 = (char *)&v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)&v21 - v12;
  if (qword_26894A818 != -1) {
    swift_once();
  }
  id v14 = (id)qword_268956368;
  sub_2380E44D8();
  (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v11, v13, v7);
  unint64_t v15 = (*(unsigned __int8 *)(v8 + 80) + 33) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  unint64_t v16 = (v9 + v15 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = "mediaPlaybackProviderSetRepeatMode";
  *(void *)(v17 + 24) = 34;
  *(unsigned char *)(v17 + 32) = 2;
  (*(void (**)(unint64_t, char *, uint64_t))(v8 + 32))(v17 + v15, v11, v7);
  id v18 = (void *)(v17 + v16);
  void *v18 = v21;
  v18[1] = a4;
  swift_retain();
  sub_2380E4EB8();
  sub_2380E44B8();
  uint64_t v19 = swift_allocObject();
  *(void *)(v19 + 16) = sub_237EE1900;
  *(void *)(v19 + 24) = v17;
  swift_retain();
  sub_2380B1004((uint64_t)sub_237EE14C0, v19, v23, v24, v22);
  swift_release();
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v13, v7);
}

uint64_t sub_2380B1004(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5)
{
  uint64_t v52 = a2;
  uint64_t v53 = a1;
  uint64_t v8 = sub_2380E4528();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  id v11 = (char *)v47 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26894D500);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_2380E7390;
  uint64_t v13 = (void *)*MEMORY[0x263F54D68];
  *(void *)(inited + 32) = *MEMORY[0x263F54D68];
  uint64_t v14 = MEMORY[0x263F8E548];
  *(_DWORD *)(inited + 40) = a3;
  unint64_t v15 = (void *)*MEMORY[0x263F54D60];
  *(void *)(inited + 64) = v14;
  *(void *)(inited + 72) = v15;
  *(void *)(inited + 104) = MEMORY[0x263F8D310];
  *(void *)(inited + 80) = 0xD000000000000013;
  *(void *)(inited + 88) = 0x80000002380FBB10;
  id v16 = v15;
  id v17 = v13;
  unint64_t v18 = sub_237FD01C4(inited);
  swift_bridgeObjectRetain();
  uint64_t v19 = sub_237F770C0(a4);
  uint64_t v20 = sub_2380ABD08(v19, v18);
  swift_bridgeObjectRelease();
  uint64_t v57 = v20;
  id v21 = objc_msgSend(self, sel_nowPlayingApplicationDestination);
  if (qword_26894AA20 != -1) {
    swift_once();
  }
  uint64_t v22 = __swift_project_value_buffer(v8, (uint64_t)qword_268956458);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, v22, v8);
  id v54 = v21;
  uint64_t v23 = v9;
  uint64_t v24 = v11;
  uint64_t v25 = sub_2380E4508();
  os_log_type_t v26 = sub_2380E4D58();
  if (os_log_type_enabled(v25, v26))
  {
    uint64_t v27 = swift_slowAlloc();
    uint64_t v51 = a5;
    uint64_t v28 = v27;
    uint64_t v29 = (void *)swift_slowAlloc();
    uint64_t v48 = swift_slowAlloc();
    aBlock[0] = v48;
    *(_DWORD *)uint64_t v28 = 67240706;
    LODWORD(v56) = a3;
    uint64_t v50 = v8;
    sub_2380E4FC8();
    *(_WORD *)(v28 + 8) = 2112;
    uint64_t v49 = v24;
    id v30 = v54;
    uint64_t v56 = (uint64_t)v54;
    id v31 = v54;
    sub_2380E4FC8();
    void *v29 = v30;
    int v32 = v29;

    *(_WORD *)(v28 + 18) = 2080;
    v47[1] = v28 + 20;
    swift_beginAccess();
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26894CA80);
    sub_2380C70AC();
    uint64_t v33 = sub_2380E4838();
    unint64_t v35 = v34;
    swift_bridgeObjectRelease();
    uint64_t v56 = sub_237EBC6BC(v33, v35, aBlock);
    sub_2380E4FC8();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_237EB8000, v25, v26, "MediaPlaybackProvider#setRepeatMode sending mode:%{public}d to destination: %@ with options: %s", (uint8_t *)v28, 0x1Cu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26894C570);
    swift_arrayDestroy();
    MEMORY[0x23EC87710](v32, -1, -1);
    uint64_t v36 = v48;
    swift_arrayDestroy();
    MEMORY[0x23EC87710](v36, -1, -1);
    uint64_t v37 = v28;
    a5 = v51;
    MEMORY[0x23EC87710](v37, -1, -1);

    (*(void (**)(char *, uint64_t))(v23 + 8))(v49, v50);
  }
  else
  {

    id v38 = v54;
    (*(void (**)(char *, uint64_t))(v23 + 8))(v24, v8);
  }
  id v39 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F54780]), sel_init);
  swift_beginAccess();
  uint64_t v40 = swift_bridgeObjectRetain();
  sub_237F774A0(v40);
  swift_bridgeObjectRelease();
  uint64_t v41 = (void *)sub_2380E4818();
  swift_bridgeObjectRelease();
  uint64_t v42 = (void *)swift_allocObject();
  uint64_t v43 = v52;
  v42[2] = v53;
  v42[3] = v43;
  v42[4] = a5;
  aBlock[4] = (uint64_t)sub_2380C70A0;
  aBlock[5] = (uint64_t)v42;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_237EFF834;
  aBlock[3] = (uint64_t)&block_descriptor_1707;
  unint64_t v44 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  id v45 = v54;
  objc_msgSend(v39, sel_sendCommandWithResult_toDestination_withOptions_completion_, 25, v54, v41, v44);

  _Block_release(v44);
  return swift_bridgeObjectRelease();
}

void sub_2380B1618(id a1, void (*a2)(unint64_t *, uint64_t, void *), uint64_t a3)
{
  id v5 = a1;
  if (a1)
  {
    id v6 = objc_msgSend(a1, sel_error);
    id v7 = objc_msgSend(v5, sel_returnStatuses);
    sub_237EC83D4(0, (unint64_t *)&qword_26894C6D0);
    uint64_t v8 = (uint8_t *)sub_2380E4B28();

    id v5 = objc_msgSend(v5, sel_commandResult);
  }
  else
  {
    uint64_t v8 = 0;
    id v6 = 0;
  }
  sub_237F1423C(0xD000000000000024, (void (*)(void, void))0x80000002380FB3C0, (uint64_t)v6, v8, (uint8_t *)v5, a2, a3);

  swift_bridgeObjectRelease();
}

uint64_t sub_2380B173C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, unsigned __int8 a13, uint64_t a14, uint64_t a15)
{
  uint64_t v43 = a8;
  uint64_t v41 = a15;
  uint64_t v37 = a14;
  int v36 = a13;
  uint64_t v34 = a11;
  uint64_t v35 = a12;
  uint64_t v39 = sub_2380E46A8();
  uint64_t v45 = *(void *)(v39 - 8);
  MEMORY[0x270FA5388](v39);
  id v38 = (char *)&v34 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v44 = sub_2380E4728();
  uint64_t v42 = *(void *)(v44 - 8);
  MEMORY[0x270FA5388](v44);
  uint64_t v24 = (char *)&v34 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26894AB78 != -1) {
    swift_once();
  }
  uint64_t v40 = qword_26894D350;
  uint64_t v25 = swift_allocObject();
  *(void *)(v25 + 16) = a1;
  *(void *)(v25 + 24) = a2;
  *(void *)(v25 + 32) = a3;
  *(void *)(v25 + 40) = a4;
  *(void *)(v25 + 48) = a5;
  *(void *)(v25 + 56) = a6;
  *(void *)(v25 + 64) = a7;
  *(void *)(v25 + 72) = v43;
  *(void *)(v25 + 80) = a9;
  uint64_t v26 = v34;
  *(void *)(v25 + 88) = a10;
  *(void *)(v25 + 96) = v26;
  *(void *)(v25 + 104) = v35;
  *(unsigned char *)(v25 + 112) = v36;
  uint64_t v27 = v41;
  *(void *)(v25 + 120) = v37;
  *(void *)(v25 + 128) = v27;
  aBlock[4] = sub_2380C5E08;
  aBlock[5] = v25;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_237EBF1FC;
  aBlock[3] = &block_descriptor_252;
  uint64_t v28 = _Block_copy(aBlock);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  id v29 = a7;
  id v30 = a10;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_2380E46D8();
  uint64_t v46 = MEMORY[0x263F8EE78];
  sub_2380BEFD0((unint64_t *)&qword_26894D730, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26894CD60);
  sub_237EBE37C((unint64_t *)&qword_26894D740, (uint64_t *)&unk_26894CD60);
  int v32 = v38;
  uint64_t v31 = v39;
  sub_2380E5088();
  MEMORY[0x23EC86460](0, v24, v32, v28);
  _Block_release(v28);
  (*(void (**)(char *, uint64_t))(v45 + 8))(v32, v31);
  (*(void (**)(char *, uint64_t))(v42 + 8))(v24, v44);
  return swift_release();
}

uint64_t sub_2380B1AFC(unsigned __int16 *a1, uint64_t a2, unint64_t a3, uint64_t a4, unint64_t a5, uint64_t a6, void *a7, int a8, void (*a9)(uint64_t *), uint64_t a10)
{
  int v64 = a8;
  uint64_t v62 = a4;
  id v63 = a7;
  uint64_t v61 = a2;
  uint64_t v13 = a9;
  uint64_t v14 = sub_2380E4528();
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v16 = MEMORY[0x270FA5388](v14);
  unint64_t v18 = (char *)&v53 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v16);
  uint64_t v20 = (char *)&v53 - v19;
  uint64_t v21 = *((void *)a1 + 2);
  if (v21)
  {
    uint64_t v22 = *((void *)a1 + 1);
    uint64_t v58 = *a1;
    uint64_t v59 = v22;
    uint64_t v23 = qword_26894AA20;
    swift_bridgeObjectRetain();
    if (v23 != -1) {
      swift_once();
    }
    uint64_t v24 = __swift_project_value_buffer(v14, (uint64_t)qword_268956458);
    (*(void (**)(char *, uint64_t, uint64_t))(v15 + 16))(v18, v24, v14);
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    uint64_t v25 = v14;
    uint64_t v26 = sub_2380E4508();
    int v27 = sub_2380E4D48();
    if (os_log_type_enabled(v26, (os_log_type_t)v27))
    {
      int v55 = v27;
      uint64_t v56 = v25;
      uint64_t v57 = a9;
      uint64_t v60 = a10;
      uint64_t v28 = swift_slowAlloc();
      uint64_t v54 = swift_slowAlloc();
      uint64_t v66 = v54;
      *(_DWORD *)uint64_t v28 = 136446978;
      swift_bridgeObjectRetain();
      uint64_t v65 = sub_237EBC6BC(v61, a3, &v66);
      sub_2380E4FC8();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v28 + 12) = 2082;
      if (qword_26894A8A8 != -1) {
        swift_once();
      }
      uint64_t v29 = qword_26894BE10;
      unint64_t v30 = *(void *)algn_26894BE18;
      swift_bridgeObjectRetain();
      uint64_t v65 = sub_237EBC6BC(v29, v30, &v66);
      sub_2380E4FC8();
      swift_bridgeObjectRelease();
      *(_WORD *)(v28 + 22) = 2082;
      swift_bridgeObjectRetain();
      uint64_t v65 = sub_237EBC6BC(v62, a5, &v66);
      sub_2380E4FC8();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v28 + 32) = 2082;
      uint64_t v31 = v58;
      LOBYTE(v65) = v58;
      unint64_t v32 = PlaybackCode.rawValue.getter();
      uint64_t v65 = sub_237EBC6BC(v32, v33, &v66);
      sub_2380E4FC8();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_237EB8000, v26, (os_log_type_t)v55, "%{public}s %{public}s %{public}s completed with error code: %{public}s", (uint8_t *)v28, 0x2Au);
      uint64_t v34 = v54;
      swift_arrayDestroy();
      MEMORY[0x23EC87710](v34, -1, -1);
      MEMORY[0x23EC87710](v28, -1, -1);

      (*(void (**)(char *, uint64_t))(v15 + 8))(v18, v56);
      uint64_t v13 = v57;
      id v35 = v63;
      if (!v63) {
        goto LABEL_19;
      }
    }
    else
    {

      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      (*(void (**)(char *, uint64_t))(v15 + 8))(v18, v25);
      uint64_t v31 = v58;
      id v35 = v63;
      if (!v63) {
        goto LABEL_19;
      }
    }
    id v44 = objc_msgSend(v35, sel_playerPath);
    if (v44)
    {
      uint64_t v45 = v44;
      id v46 = objc_msgSend(v44, sel_origin);

      if (v46)
      {
        char v47 = objc_msgSend(v46, sel_isLocallyHosted);

LABEL_20:
        sub_237F20A20(v47, v64, 0);
        uint64_t v66 = v31;
        uint64_t v67 = v59;
        uint64_t v68 = v21;
        v13(&v66);
        return swift_bridgeObjectRelease();
      }
    }
LABEL_19:
    char v47 = 2;
    goto LABEL_20;
  }
  uint64_t v60 = a10;
  if (qword_26894AA20 != -1) {
    swift_once();
  }
  uint64_t v36 = __swift_project_value_buffer(v14, (uint64_t)qword_268956458);
  (*(void (**)(char *, uint64_t, uint64_t))(v15 + 16))(v20, v36, v14);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  uint64_t v37 = v14;
  id v38 = sub_2380E4508();
  os_log_type_t v39 = sub_2380E4D58();
  if (os_log_type_enabled(v38, v39))
  {
    uint64_t v56 = v37;
    uint64_t v57 = a9;
    uint64_t v40 = swift_slowAlloc();
    uint64_t v59 = swift_slowAlloc();
    uint64_t v66 = v59;
    *(_DWORD *)uint64_t v40 = 136446722;
    swift_bridgeObjectRetain();
    uint64_t v65 = sub_237EBC6BC(v61, a3, &v66);
    sub_2380E4FC8();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v40 + 12) = 2082;
    if (qword_26894A8A8 != -1) {
      swift_once();
    }
    uint64_t v42 = qword_26894BE10;
    unint64_t v41 = *(void *)algn_26894BE18;
    swift_bridgeObjectRetain();
    uint64_t v65 = sub_237EBC6BC(v42, v41, &v66);
    sub_2380E4FC8();
    swift_bridgeObjectRelease();
    *(_WORD *)(v40 + 22) = 2082;
    swift_bridgeObjectRetain();
    uint64_t v65 = sub_237EBC6BC(v62, a5, &v66);
    sub_2380E4FC8();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_237EB8000, v38, v39, "%{public}s %{public}s %{public}s completed successfully", (uint8_t *)v40, 0x20u);
    uint64_t v43 = v59;
    swift_arrayDestroy();
    MEMORY[0x23EC87710](v43, -1, -1);
    MEMORY[0x23EC87710](v40, -1, -1);

    (*(void (**)(char *, uint64_t))(v15 + 8))(v20, v56);
    uint64_t v13 = v57;
  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
    (*(void (**)(char *, uint64_t))(v15 + 8))(v20, v37);
  }
  if (v63
    && (id v49 = objc_msgSend(v63, sel_playerPath)) != 0
    && (uint64_t v50 = v49, v51 = objc_msgSend(v49, sel_origin), v50, v51))
  {
    char v52 = objc_msgSend(v51, sel_isLocallyHosted);
  }
  else
  {
    char v52 = 2;
  }
  sub_237F20A20(v52, v64, 1);
  uint64_t v66 = 0;
  uint64_t v67 = 0;
  uint64_t v68 = 0;
  return ((uint64_t (*)(uint64_t *))v13)(&v66);
}

void sub_2380B22F8(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, char *a5@<X8>)
{
  if ((sub_2380C0604(a2) & 1) == 0)
  {
    if (sub_2380C0744())
    {
      char v10 = 37;
      goto LABEL_16;
    }
    sub_237EC4CB4();
    if (sub_2380E5038())
    {
      char v10 = -104;
      goto LABEL_16;
    }
    if (sub_2380C1E64(a3, a4, 0x726F7272454349, 0xE700000000000000))
    {
      char v10 = 54;
      goto LABEL_16;
    }
    if (a1)
    {
      id v11 = (void *)sub_2380E2B98();
      char v12 = sub_2380C0848(v11, a2);

      if ((v12 & 1) == 0)
      {
        uint64_t v13 = (void *)sub_2380E2B98();
        id v14 = objc_msgSend(v13, sel_code, 0xD00000000000003ALL, 0x80000002380FB380, a3, a4);

        if (v14 == (id)15)
        {
          char v10 = 52;
          goto LABEL_16;
        }
LABEL_15:
        char v10 = 0;
        goto LABEL_16;
      }
    }
    else if ((sub_2380C0848(0, a2) & 1) == 0)
    {
      goto LABEL_15;
    }
    char v10 = -99;
    goto LABEL_16;
  }
  char v10 = 1;
LABEL_16:
  *a5 = v10;
}

uint64_t sub_2380B2468()
{
  return sub_2380E3208();
}

uint64_t sub_2380B24F4@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, unsigned __int8 *a5@<X8>)
{
  uint64_t v10 = sub_2380E4528();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)&v24 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = HIBYTE(a2) & 0xF;
  if ((a2 & 0x2000000000000000) == 0) {
    uint64_t v14 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (!v14) {
    goto LABEL_9;
  }
  if (!*(void *)(sub_2380E4428() + 16))
  {
    swift_bridgeObjectRelease();
LABEL_9:
    char v17 = 19;
    goto LABEL_10;
  }
  sub_237EC9470(a3, a4);
  char v16 = v15;
  swift_bridgeObjectRelease();
  if (v16) {
    char v17 = 12;
  }
  else {
    char v17 = 19;
  }
LABEL_10:
  unsigned __int8 v25 = v17;
  if (qword_26894AA20 != -1) {
    swift_once();
  }
  uint64_t v18 = __swift_project_value_buffer(v10, (uint64_t)qword_268956458);
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v13, v18, v10);
  uint64_t v19 = v25;
  uint64_t v20 = sub_2380E4508();
  os_log_type_t v21 = sub_2380E4D58();
  if (os_log_type_enabled(v20, v21))
  {
    uint64_t v22 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v22 = 134217984;
    uint64_t v24 = v19;
    sub_2380E4FC8();
    _os_log_impl(&dword_237EB8000, v20, v21, "MediaPlaybackProvider#determineDomainCode: %ld", v22, 0xCu);
    MEMORY[0x23EC87710](v22, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  uint64_t result = swift_beginAccess();
  *a5 = v25;
  return result;
}

uint64_t sub_2380B2758(void *a1, SEL *a2)
{
  id v2 = [a1 *a2];
  uint64_t v3 = sub_2380E4938();

  return v3;
}

void sub_2380B27A8(uint64_t a1, void *a2, void (*a3)(void), uint64_t a4)
{
  uint64_t v28 = a3;
  uint64_t v7 = sub_2380E4528();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)v27 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!MRAVEndpointGetLocalEndpoint())
  {
    __break(1u);
    return;
  }
  uint64_t v29 = MRAVEndpointCopyUniqueIdentifier();
  if (!a1)
  {
    unsigned __int8 v15 = 0;
    char v16 = (void *)v29;
    if (v29) {
      goto LABEL_4;
    }
LABEL_6:
    unsigned __int8 v21 = 0;
    goto LABEL_7;
  }
  id v11 = objc_msgSend(a2, sel_outputDeviceUIDs);
  uint64_t v12 = (void *)sub_2380E4B28();

  uint64_t v13 = sub_2380E4938();
  unsigned __int8 v15 = sub_237EE5620(v13, v14, v12);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  char v16 = (void *)v29;
  if (!v29) {
    goto LABEL_6;
  }
LABEL_4:
  id v17 = objc_msgSend(a2, sel_outputDeviceUIDs);
  uint64_t v18 = (void *)sub_2380E4B28();

  uint64_t v19 = sub_2380E4938();
  unsigned __int8 v21 = sub_237EE5620(v19, v20, v18);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
LABEL_7:
  if (qword_26894AA20 != -1) {
    swift_once();
  }
  uint64_t v22 = __swift_project_value_buffer(v7, (uint64_t)qword_268956458);
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, v22, v7);
  uint64_t v23 = sub_2380E4508();
  os_log_type_t v24 = sub_2380E4D58();
  if (os_log_type_enabled(v23, v24))
  {
    unsigned __int8 v25 = (_DWORD *)swift_slowAlloc();
    v27[1] = a4;
    uint64_t v26 = v25;
    _DWORD *v25 = 67109632;
    int v32 = (v15 | v21) & 1;
    sub_2380E4FC8();
    *((_WORD *)v26 + 4) = 1024;
    int v31 = v15 & 1;
    sub_2380E4FC8();
    *((_WORD *)v26 + 7) = 1024;
    char v16 = (void *)v29;
    int v30 = v21 & 1;
    sub_2380E4FC8();
    _os_log_impl(&dword_237EB8000, v23, v24, "MediaPlaybackProvider#currentDeviceApartOfWHAGroup:%{BOOL}d. pairingIDMatch:%{BOOL}d, localUIDMatch:%{BOOL}d", (uint8_t *)v26, 0x14u);
    MEMORY[0x23EC87710](v26, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  v28((v15 | v21) & 1);
}

uint64_t sub_2380B2AD8(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v44 = a8;
  uint64_t v45 = a4;
  uint64_t v48 = a6;
  uint64_t v46 = a5;
  int v43 = a3;
  uint64_t v42 = *v9;
  uint64_t v13 = sub_2380E4528();
  uint64_t v14 = *(void *)(v13 - 8);
  MEMORY[0x270FA5388](v13);
  char v16 = (char *)&v38 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26894AA20 != -1) {
    swift_once();
  }
  uint64_t v41 = a9;
  uint64_t v17 = __swift_project_value_buffer(v13, (uint64_t)qword_268956458);
  (*(void (**)(char *, uint64_t, uint64_t))(v14 + 16))(v16, v17, v13);
  uint64_t v18 = sub_2380E4508();
  os_log_type_t v19 = sub_2380E4D58();
  if (os_log_type_enabled(v18, v19))
  {
    uint64_t v20 = swift_slowAlloc();
    uint64_t v21 = swift_slowAlloc();
    uint64_t v40 = a7;
    uint64_t v22 = v21;
    uint64_t v49 = a1;
    v50[0] = v21;
    *(_DWORD *)uint64_t v20 = 136315650;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26894B520);
    uint64_t v23 = sub_2380E4988();
    uint64_t v39 = a1;
    uint64_t v49 = sub_237EBC6BC(v23, v24, v50);
    sub_2380E4FC8();
    swift_bridgeObjectRelease();
    *(_WORD *)(v20 + 12) = 2082;
    uint64_t v49 = a2;
    uint64_t v25 = sub_2380E4988();
    uint64_t v49 = sub_237EBC6BC(v25, v26, v50);
    sub_2380E4FC8();
    swift_bridgeObjectRelease();
    *(_WORD *)(v20 + 22) = 1026;
    int v27 = v43;
    LODWORD(v49) = v43;
    sub_2380E4FC8();
    _os_log_impl(&dword_237EB8000, v18, v19, "MediaPlaybackProvider#addToUpNext origin:%s queue:%{public}s position:%{public}d", (uint8_t *)v20, 0x1Cu);
    swift_arrayDestroy();
    uint64_t v28 = v22;
    a7 = v40;
    MEMORY[0x23EC87710](v28, -1, -1);
    MEMORY[0x23EC87710](v20, -1, -1);

    uint64_t v29 = a2;
    uint64_t v30 = v13;
    uint64_t v31 = v39;
    (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v30);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
    uint64_t v31 = a1;
    uint64_t v29 = a2;
    int v27 = v43;
  }
  v50[0] = 0;
  v50[1] = 0xE000000000000000;
  sub_2380E5178();
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26894B510);
  swift_allocObject();
  uint64_t v32 = sub_237F5F308(0xD000000000000037, 0x80000002380FAFC0, (uint64_t)sub_237F08FE4, 0);
  unint64_t v33 = (void *)swift_allocObject();
  v33[2] = v32;
  void v33[3] = 0xD000000000000021;
  uint64_t v34 = v44;
  v33[4] = 0x80000002380FAF90;
  v33[5] = v34;
  uint64_t v35 = v41;
  v33[6] = v41;
  uint64_t v36 = swift_allocObject();
  *(void *)(v36 + 16) = sub_2380BF400;
  *(void *)(v36 + 24) = v33;
  swift_retain();
  swift_retain();
  swift_retain();
  sub_2380BD644(v31, v47, v45, v46, v48, a7, v34, v35, v29, v27, v42);
  swift_release();
  swift_release();
  return swift_release();
}

void sub_2380B2F54(uint64_t a1, void (*a2)(void, void, void), uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, int a8, int a9, char a10)
{
  unint64_t v33 = a2;
  uint64_t v34 = a3;
  uint64_t v16 = sub_2380E4528();
  uint64_t v17 = *(void *)(v16 - 8);
  MEMORY[0x270FA5388](v16);
  os_log_type_t v19 = (char *)&v33 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = *(void **)a1;
  if (*(void *)a1 >= 2uLL)
  {
    unint64_t v26 = *(void **)(a1 + 8);
    id v27 = v20;
    MRSystemAppPlaybackQueueSetIsRequestingImmediatePlayback();
    if (qword_26894ABC8 != -1) {
      swift_once();
    }
    uint64_t v28 = swift_allocObject();
    *(void *)(v28 + 16) = a6;
    *(void *)(v28 + 24) = v27;
    *(void *)(v28 + 32) = v20;
    *(void *)(v28 + 40) = v26;
    *(void *)(v28 + 48) = a4;
    *(void *)(v28 + 56) = a5;
    uint64_t v29 = v33;
    uint64_t v30 = v34;
    *(void *)(v28 + 64) = a7;
    *(void *)(v28 + 72) = v29;
    *(void *)(v28 + 80) = v30;
    *(_DWORD *)(v28 + 88) = a8;
    *(_DWORD *)(v28 + 92) = a9;
    *(unsigned char *)(v28 + 96) = a10 & 1;
    uint64_t v39 = sub_2380BF508;
    uint64_t v40 = v28;
    uint64_t aBlock = MEMORY[0x263EF8330];
    uint64_t v36 = 1107296256;
    uint64_t v37 = sub_237EFF834;
    uint64_t v38 = &block_descriptor_204;
    uint64_t v31 = _Block_copy(&aBlock);
    id v32 = v27;
    sub_238086BCC(v20, v26);
    swift_retain();
    swift_retain();
    swift_release();
    MRMediaRemoteGetSupportedCommandsForOrigin();
    _Block_release(v31);
  }
  else
  {
    if (qword_26894AA20 != -1) {
      swift_once();
    }
    uint64_t v21 = __swift_project_value_buffer(v16, (uint64_t)qword_268956458);
    (*(void (**)(char *, uint64_t, uint64_t))(v17 + 16))(v19, v21, v16);
    uint64_t v22 = sub_2380E4508();
    os_log_type_t v23 = sub_2380E4D48();
    if (os_log_type_enabled(v22, v23))
    {
      unint64_t v24 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v24 = 0;
      _os_log_impl(&dword_237EB8000, v22, v23, "MediaPlaybackProvider#addToUpNext UserIdentity nil", v24, 2u);
      MEMORY[0x23EC87710](v24, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v17 + 8))(v19, v16);
    LOBYTE(v41[0]) = 21;
    char v42 = 19;
    v25._countAndFlagsBits = 0x49726573556C694ELL;
    v25._object = (void *)0xEF797469746E6564;
    SiriAudioSupport::PlaybackCodeAndDescription v43 = PlaybackCodeAndDescription.init(playbackCode:domainCode:errorDescription:)((SiriAudioSupport::PlaybackCode)v41, (SiriAudioSupport::DomainCode)&v42, v25);
    v41[0] = (unsigned __int16)aBlock;
    v41[1] = v36;
    void v41[2] = v37;
    v33(v41, v43.errorDescription._countAndFlagsBits, v43.errorDescription._object);
    swift_bridgeObjectRelease();
  }
}

uint64_t sub_2380B32C8(void *a1, uint64_t a2, void *a3, void *a4, void *a5, uint64_t a6, uint64_t a7, uint64_t a8, void (*a9)(void *, uint64_t, void *), uint64_t a10, unsigned int a11)
{
  uint64_t v18 = (void *)swift_allocObject();
  v18[2] = a2;
  v18[3] = a3;
  v18[4] = a4;
  v18[5] = a5;
  v18[6] = a6;
  v18[7] = a7;
  v18[8] = a8;
  v18[9] = a9;
  v18[10] = a10;
  swift_retain_n();
  swift_retain_n();
  swift_retain();
  id v19 = a3;
  sub_238086BCC(a4, a5);
  sub_2380C56A8(a11, a1, (uint64_t (*)(uint64_t))sub_2380BF5D0, (uint64_t)v18, a11, a6, a9, a10);
  swift_release_n();
  swift_release_n();
  return swift_release_n();
}

void sub_2380B33EC(int a1, unint64_t a2, uint64_t a3, uint64_t a4, void *a5, uint64_t a6, unint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  uint64_t v113 = a8;
  uint64_t v115 = a6;
  id v118 = a5;
  uint64_t v117 = a4;
  *(void *)&long long v122 = a3;
  int v114 = a1;
  uint64_t v131 = *MEMORY[0x263EF8340];
  uint64_t v12 = sub_2380E4808();
  uint64_t v110 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  uint64_t v112 = (char *)&v104 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v121 = sub_2380E47F8();
  uint64_t v120 = *(void *)(v121 - 8);
  uint64_t v14 = MEMORY[0x270FA5388](v121);
  uint64_t v109 = (char *)&v104 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v14);
  uint64_t v119 = (char *)&v104 - v16;
  uint64_t v17 = sub_2380E4528();
  uint64_t v18 = *(void *)(v17 - 8);
  uint64_t v19 = MEMORY[0x270FA5388](v17);
  uint64_t v21 = (char *)&v104 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v19);
  os_log_type_t v23 = (char *)&v104 - v22;
  if (qword_26894AA20 != -1) {
    goto LABEL_47;
  }
  while (1)
  {
    uint64_t v24 = __swift_project_value_buffer(v17, (uint64_t)qword_268956458);
    Swift::String v25 = *(void (**)(char *, uint64_t, uint64_t))(v18 + 16);
    uint64_t v108 = v24;
    uint64_t v107 = v25;
    ((void (*)(char *))v25)(v23);
    unint64_t v26 = sub_2380E4508();
    os_log_type_t v27 = sub_2380E4D38();
    BOOL v28 = os_log_type_enabled(v26, v27);
    unint64_t v116 = a7;
    if (v28)
    {
      unint64_t v104 = a2;
      uint64_t v105 = v21;
      uint64_t v106 = v18;
      uint64_t v111 = v12;
      uint64_t v29 = swift_slowAlloc();
      uint64_t v30 = swift_slowAlloc();
      *(void *)&long long aBlock = v30;
      *(_DWORD *)uint64_t v29 = 136446466;
      if (qword_26894A8A8 != -1) {
        swift_once();
      }
      uint64_t v32 = qword_26894BE10;
      unint64_t v31 = *(void *)algn_26894BE18;
      swift_bridgeObjectRetain();
      *(void *)&v124[0] = sub_237EBC6BC(v32, v31, (uint64_t *)&aBlock);
      sub_2380E4FC8();
      swift_bridgeObjectRelease();
      *(_WORD *)(v29 + 12) = 2082;
      *(void *)&v124[0] = v104;
      __swift_instantiateConcreteTypeFromMangledName(&qword_26894B520);
      uint64_t v33 = sub_2380E4988();
      *(void *)&v124[0] = sub_237EBC6BC(v33, v34, (uint64_t *)&aBlock);
      sub_2380E4FC8();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_237EB8000, v26, v27, "MediaPlaybackProvider#addToUpNext %{public}s Sending add request to %{public}s", (uint8_t *)v29, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x23EC87710](v30, -1, -1);
      MEMORY[0x23EC87710](v29, -1, -1);

      uint64_t v18 = v106;
      uint64_t v35 = *(void (**)(char *, uint64_t))(v106 + 8);
      v35(v23, v17);
      uint64_t v12 = v111;
      uint64_t v21 = v105;
    }
    else
    {

      uint64_t v35 = *(void (**)(char *, uint64_t))(v18 + 8);
      v35(v23, v17);
    }
    uint64_t v36 = (void *)*MEMORY[0x263F54DB8];
    if (!*MEMORY[0x263F54DB8]) {
      goto LABEL_49;
    }
    uint64_t v37 = self;
    *(void *)&v124[0] = 0;
    id v38 = v36;
    id v39 = objc_msgSend(v37, sel_archivedDataWithRootObject_requiringSecureCoding_error_, (void)v122, 1, v124);
    id v40 = *(id *)&v124[0];
    if (v39)
    {
      uint64_t v41 = sub_2380E2CE8();
      uint64_t v43 = v42;

      v127 = (void *)MEMORY[0x263F06F78];
      *(void *)&long long aBlock = v41;
      *((void *)&aBlock + 1) = v43;
      sub_237ECAB6C(&aBlock, v124);
      uint64_t v44 = MEMORY[0x263F8EE80];
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v130 = v44;
      sub_237FA2060(v124, v38, isUniquelyReferenced_nonNull_native);
      uint64_t v46 = v130;

      swift_bridgeObjectRelease();
      a7 = 0;
    }
    else
    {
      char v47 = v40;
      uint64_t v111 = v12;

      uint64_t v48 = (void *)sub_2380E2BA8();
      swift_willThrow();
      a7 = 0;
      v107(v21, v108, v17);
      id v49 = v48;
      id v50 = v48;
      id v51 = sub_2380E4508();
      char v52 = v21;
      os_log_type_t v53 = sub_2380E4D48();
      if (os_log_type_enabled(v51, v53))
      {
        uint64_t v54 = swift_slowAlloc();
        uint64_t v105 = v52;
        int v55 = (uint8_t *)v54;
        uint64_t v56 = swift_slowAlloc();
        *(void *)&long long v122 = 0;
        uint64_t v57 = v56;
        *(void *)&long long aBlock = v56;
        uint64_t v106 = v18;
        *(_DWORD *)int v55 = 136315138;
        swift_getErrorValue();
        uint64_t v58 = sub_2380E5468();
        *(void *)&v124[0] = sub_237EBC6BC(v58, v59, (uint64_t *)&aBlock);
        sub_2380E4FC8();
        swift_bridgeObjectRelease();

        _os_log_impl(&dword_237EB8000, v51, v53, "MediaPlaybackProvider#addToUpNext Error getting user identity data - %s", v55, 0xCu);
        swift_arrayDestroy();
        a7 = v122;
        MEMORY[0x23EC87710](v57, -1, -1);
        MEMORY[0x23EC87710](v55, -1, -1);

        uint64_t v60 = v105;
      }
      else
      {

        uint64_t v60 = v52;
      }
      v35(v60, v17);
      uint64_t v46 = MEMORY[0x263F8EE80];
      uint64_t v12 = v111;
    }
    if (qword_26894A8A0 != -1) {
      swift_once();
    }
    swift_beginAccess();
    uint64_t v62 = qword_26894BD60;
    uint64_t v61 = unk_26894BD68;
    id v63 = __swift_project_boxed_opaque_existential_1(qword_26894BD48, qword_26894BD60);
    uint64_t v64 = *(void *)(v62 - 8);
    MEMORY[0x270FA5388](v63);
    uint64_t v66 = (char *)&v104 - ((v65 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v64 + 16))(v66);
    unint64_t v67 = (*(uint64_t (**)(uint64_t, uint64_t))(v61 + 16))(v62, v61);
    unint64_t v69 = v68;
    (*(void (**)(char *, uint64_t))(v64 + 8))(v66, v62);
    if (!v69) {
      goto LABEL_29;
    }
    if (!*MEMORY[0x263F54CA0])
    {
      __break(1u);
LABEL_51:
      __break(1u);
      goto LABEL_52;
    }
    id v70 = (id)*MEMORY[0x263F54CA0];
    uint64_t v71 = sub_2380E4918();
    v127 = (void *)sub_237EC83D4(0, (unint64_t *)&unk_26894C740);
    *(void *)&long long aBlock = v71;
    sub_237ECAB6C(&aBlock, v124);
    char v72 = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v123 = v46;
    sub_237FA2060(v124, v70, v72);
    uint64_t v73 = v123;

    swift_bridgeObjectRelease();
    uint64_t v74 = sub_2380AC9D0(v67, v69);
    a2 = v75;
    uint64_t v17 = sub_2380BEFD0(&qword_26894C410, MEMORY[0x263F047F8]);
    unint64_t v76 = v112;
    sub_2380E47E8();
    uint64_t v111 = v73;
    switch(a2 >> 62)
    {
      case 1uLL:
        if (v74 >> 32 < (int)v74) {
          goto LABEL_48;
        }
        sub_23800CAA0(v74, a2);
        sub_2380BB994((int)v74, v74 >> 32);
        unint64_t v76 = v112;
        break;
      case 2uLL:
        uint64_t v77 = *(void *)(v74 + 16);
        uint64_t v78 = *(void *)(v74 + 24);
        sub_23800CAA0(v74, a2);
        swift_retain();
        swift_retain();
        sub_2380BB994(v77, v78);
        unint64_t v76 = v112;
        swift_release();
        swift_release();
        break;
      case 3uLL:
        *(void *)((char *)&aBlock + 6) = 0;
        *(void *)&long long aBlock = 0;
        goto LABEL_24;
      default:
        *(void *)&long long aBlock = v74;
        WORD4(aBlock) = a2;
        BYTE10(aBlock) = BYTE2(a2);
        BYTE11(aBlock) = BYTE3(a2);
        BYTE12(aBlock) = BYTE4(a2);
        BYTE13(aBlock) = BYTE5(a2);
LABEL_24:
        sub_2380E47C8();
        break;
    }
    sub_237EFD1BC(v74, a2);
    uint64_t v79 = v119;
    sub_2380E47D8();
    (*(void (**)(char *, uint64_t))(v110 + 8))(v76, v12);
    sub_237EFD1BC(v74, a2);
    (*(void (**)(char *, char *, uint64_t))(v120 + 16))(v109, v79, v121);
    sub_2380BEFD0(&qword_26894C418, MEMORY[0x263F045C0]);
    sub_2380E4AB8();
    uint64_t v18 = *((void *)&aBlock + 1);
    os_log_type_t v23 = (char *)aBlock;
    uint64_t v12 = *(void *)(aBlock + 16);
    if (*((void *)&aBlock + 1) == v12) {
      break;
    }
    if (*((uint64_t *)&aBlock + 1) >= v12)
    {
      __break(1u);
LABEL_48:
      __break(1u);
LABEL_49:
      __break(1u);
    }
    unint64_t v80 = (void *)MEMORY[0x263F8EE78];
    long long v122 = xmmword_2380E7450;
    uint64_t v21 = (char *)*((void *)&aBlock + 1);
    while ((v18 & 0x8000000000000000) == 0)
    {
      if ((unint64_t)v21 >= *((void *)v23 + 2)) {
        goto LABEL_46;
      }
      char v98 = v21[(void)(v23 + 32)];
      __swift_instantiateConcreteTypeFromMangledName(&qword_26894B288);
      uint64_t v99 = swift_allocObject();
      *(_OWORD *)(v99 + 16) = v122;
      *(void *)(v99 + 56) = MEMORY[0x263F8E778];
      *(void *)(v99 + 64) = MEMORY[0x263F8E7C0];
      *(unsigned char *)(v99 + 32) = v98;
      uint64_t v100 = sub_2380E4958();
      a2 = v101;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        unint64_t v80 = sub_237EBEE8C(0, v80[2] + 1, 1, v80);
      }
      a7 = v80[2];
      unint64_t v102 = v80[3];
      uint64_t v17 = a7 + 1;
      if (a7 >= v102 >> 1) {
        unint64_t v80 = sub_237EBEE8C((void *)(v102 > 1), a7 + 1, 1, v80);
      }
      ++v21;
      v80[2] = v17;
      uint64_t v103 = &v80[2 * a7];
      v103[4] = v100;
      v103[5] = a2;
      if ((char *)v12 == v21) {
        goto LABEL_27;
      }
    }
    __break(1u);
LABEL_46:
    __break(1u);
LABEL_47:
    swift_once();
  }
  unint64_t v80 = (void *)MEMORY[0x263F8EE78];
LABEL_27:
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v120 + 8))(v119, v121);
  *(void *)&long long aBlock = v80;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26894B160);
  sub_237EBE37C((unint64_t *)&qword_26894B168, &qword_26894B160);
  uint64_t v81 = sub_2380E48F8();
  uint64_t v83 = v82;
  swift_bridgeObjectRelease();
  uint64_t v84 = (void *)*MEMORY[0x263F54D88];
  if (!*MEMORY[0x263F54D88]) {
    goto LABEL_51;
  }
  v127 = (void *)MEMORY[0x263F8D310];
  *(void *)&long long aBlock = v81;
  *((void *)&aBlock + 1) = v83;
  sub_237ECAB6C(&aBlock, v124);
  id v85 = v84;
  uint64_t v86 = v111;
  char v87 = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v123 = v86;
  sub_237FA2060(v124, v85, v87);
  uint64_t v46 = v123;

  swift_bridgeObjectRelease();
LABEL_29:
  if (v117 != 1 && v118)
  {
    long long v88 = (void *)*MEMORY[0x263F54D40];
    if (*MEMORY[0x263F54D40])
    {
      id v89 = v118;
      id v90 = v88;
      unsigned __int8 v91 = objc_msgSend(v89, sel_BOOLValue);
      v127 = (void *)MEMORY[0x263F8D4F8];
      LOBYTE(aBlock) = v91;
      sub_237ECAB6C(&aBlock, v124);
      char v92 = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v123 = v46;
      sub_237FA2060(v124, v90, v92);

      swift_bridgeObjectRelease();
      goto LABEL_33;
    }
LABEL_52:
    __break(1u);
    JUMPOUT(0x2380B4448);
  }
LABEL_33:
  type metadata accessor for CFString(0);
  sub_2380BEFD0((unint64_t *)&qword_26894AE00, type metadata accessor for CFString);
  double v93 = (void *)sub_2380E4818();
  swift_bridgeObjectRelease();
  sub_237EC83D4(0, (unint64_t *)&qword_26894CA40);
  uint64_t v94 = (void *)sub_2380E4E38();
  double v95 = (void *)swift_allocObject();
  uint64_t v96 = v115;
  v95[2] = v113;
  v95[3] = v96;
  v95[4] = a9;
  v95[5] = a10;
  v128 = sub_2380C5BCC;
  v129 = v95;
  *(void *)&long long aBlock = MEMORY[0x263EF8330];
  *((void *)&aBlock + 1) = 1107296256;
  double v126 = sub_2380B4D78;
  v127 = &block_descriptor_223;
  uint64_t v97 = _Block_copy(&aBlock);
  swift_retain();
  swift_retain();
  swift_release();
  MRMediaRemoteInsertSystemAppPlaybackQueueWithOptions();
  _Block_release(v97);
}

uint64_t sub_2380B4458(int a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t *, uint64_t, void *), char *a5)
{
  uint64_t v75 = a3;
  LODWORD(v76) = a1;
  uint64_t v7 = sub_2380E4528();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  id v70 = (void (*)(void))((char *)&v68 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  uint64_t v74 = (char *)&v68 - v12;
  uint64_t v13 = MEMORY[0x270FA5388](v11);
  uint64_t v71 = (char *)&v68 - v14;
  uint64_t v15 = MEMORY[0x270FA5388](v13);
  uint64_t v73 = (char *)&v68 - v16;
  uint64_t v17 = MEMORY[0x270FA5388](v15);
  char v72 = (void (*)(uint64_t *, uint64_t, void *))((char *)&v68 - v18);
  MEMORY[0x270FA5388](v17);
  uint64_t v20 = (char *)&v68 - v19;
  if (qword_26894AA20 != -1) {
    swift_once();
  }
  uint64_t v21 = __swift_project_value_buffer(v7, (uint64_t)qword_268956458);
  uint64_t v22 = *(void (**)(void))(v8 + 16);
  ((void (*)(char *, uint64_t, uint64_t))v22)(v20, v21, v7);
  os_log_type_t v23 = sub_2380E4508();
  os_log_type_t v24 = sub_2380E4D38();
  if (os_log_type_enabled(v23, v24))
  {
    Swift::String v25 = (uint8_t *)swift_slowAlloc();
    uint64_t v69 = v8 + 16;
    uint64_t v26 = v21;
    os_log_type_t v27 = v22;
    uint64_t v28 = v7;
    uint64_t v29 = v8;
    uint64_t v30 = a5;
    unint64_t v31 = v25;
    *(_DWORD *)Swift::String v25 = 67109120;
    LODWORD(v81) = v76;
    sub_2380E4FC8();
    _os_log_impl(&dword_237EB8000, v23, v24, "MediaPlaybackProvider#addToUpNext received MRError code: %u", v31, 8u);
    uint64_t v32 = v31;
    a5 = v30;
    uint64_t v8 = v29;
    uint64_t v7 = v28;
    uint64_t v22 = v27;
    uint64_t v21 = v26;
    MEMORY[0x23EC87710](v32, -1, -1);
  }

  uint64_t v35 = *(void (**)(char *, uint64_t))(v8 + 8);
  uint64_t v34 = v8 + 8;
  uint64_t v33 = v35;
  v35(v20, v7);
  if (v76 == 45)
  {
    char v72 = a4;
    uint64_t v44 = v21;
    ((void (*)(char *, uint64_t, uint64_t))v22)(v74, v21, v7);
    uint64_t v45 = sub_2380E4508();
    os_log_type_t v46 = sub_2380E4D48();
    if (os_log_type_enabled(v45, v46))
    {
      char v47 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)char v47 = 0;
      _os_log_impl(&dword_237EB8000, v45, v46, "MediaPlaybackProvider#addToUpNext MRMediaRemoteError is cannotModifyQueueWithPlaybackTokenItems", v47, 2u);
      MEMORY[0x23EC87710](v47, -1, -1);
    }

    v33(v74, v7);
    uint64_t v48 = v70;
    ((void (*)(void (*)(void), uint64_t, uint64_t))v22)(v70, v44, v7);
    id v49 = sub_2380E4508();
    os_log_type_t v50 = sub_2380E4D38();
    if (os_log_type_enabled(v49, v50))
    {
      id v51 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v51 = 0;
      _os_log_impl(&dword_237EB8000, v49, v50, "MediaPlaybackProvider#destroyMRQueue destroying queue...", v51, 2u);
      MEMORY[0x23EC87710](v51, -1, -1);
    }

    v33((char *)v48, v7);
    MRSystemAppPlaybackQueueDestroy();
    LOBYTE(v77) = 48;
    char v80 = 19;
    v52._countAndFlagsBits = 0xD000000000000027;
    v52._object = (void *)0x80000002380FB040;
    SiriAudioSupport::PlaybackCodeAndDescription v84 = PlaybackCodeAndDescription.init(playbackCode:domainCode:errorDescription:)((SiriAudioSupport::PlaybackCode)&v77, (SiriAudioSupport::DomainCode)&v80, v52);
    uint64_t v77 = (unsigned __int16)v81;
    uint64_t v78 = v82;
    uint64_t v79 = v83;
    v72(&v77, v84.errorDescription._countAndFlagsBits, v84.errorDescription._object);
    return swift_bridgeObjectRelease();
  }
  if (v76)
  {
    os_log_type_t v53 = v73;
    uint64_t v69 = v21;
    id v70 = v22;
    ((void (*)(char *, uint64_t, uint64_t))v22)(v73, v21, v7);
    uint64_t v54 = sub_2380E4508();
    os_log_type_t v55 = sub_2380E4D48();
    if (os_log_type_enabled(v54, v55))
    {
      unint64_t v68 = v33;
      uint64_t v74 = a5;
      char v72 = a4;
      uint64_t v56 = swift_slowAlloc();
      uint64_t v57 = swift_slowAlloc();
      uint64_t v81 = v57;
      *(_DWORD *)uint64_t v56 = 136446466;
      if (qword_26894A8A8 != -1) {
        swift_once();
      }
      uint64_t v58 = qword_26894BE10;
      unint64_t v59 = *(void *)algn_26894BE18;
      swift_bridgeObjectRetain();
      uint64_t v77 = sub_237EBC6BC(v58, v59, &v81);
      sub_2380E4FC8();
      swift_bridgeObjectRelease();
      *(_WORD *)(v56 + 12) = 2082;
      LODWORD(v77) = v76;
      type metadata accessor for MRMediaRemoteError(0);
      uint64_t v60 = sub_2380E4988();
      uint64_t v77 = sub_237EBC6BC(v60, v61, &v81);
      sub_2380E4FC8();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_237EB8000, v54, v55, "MediaPlaybackProvider#addToUpNext %{public}s Error setting playback queue, error: %{public}s", (uint8_t *)v56, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x23EC87710](v57, -1, -1);
      MEMORY[0x23EC87710](v56, -1, -1);

      uint64_t v33 = v68;
      v68(v73, v7);
      a4 = v72;
    }
    else
    {

      v33(v53, v7);
    }
    id v63 = v71;
    ((void (*)(char *, uint64_t, uint64_t))v70)(v71, v69, v7);
    uint64_t v64 = sub_2380E4508();
    os_log_type_t v65 = sub_2380E4D38();
    if (os_log_type_enabled(v64, v65))
    {
      uint64_t v66 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v66 = 0;
      _os_log_impl(&dword_237EB8000, v64, v65, "MediaPlaybackProvider#destroyMRQueue destroying queue...", v66, 2u);
      MEMORY[0x23EC87710](v66, -1, -1);
    }

    v33(v63, v7);
    MRSystemAppPlaybackQueueDestroy();
    LOBYTE(v77) = 4;
    char v80 = 19;
    v67._object = (void *)0x80000002380FB020;
    v67._countAndFlagsBits = 0xD000000000000019;
    SiriAudioSupport::PlaybackCodeAndDescription v85 = PlaybackCodeAndDescription.init(playbackCode:domainCode:errorDescription:)((SiriAudioSupport::PlaybackCode)&v77, (SiriAudioSupport::DomainCode)&v80, v67);
    uint64_t v77 = (unsigned __int16)v81;
    uint64_t v78 = v82;
    uint64_t v79 = v83;
    a4(&v77, v85.errorDescription._countAndFlagsBits, v85.errorDescription._object);
    return swift_bridgeObjectRelease();
  }
  uint64_t v36 = (char *)v72;
  v22();
  uint64_t v37 = sub_2380E4508();
  os_log_type_t v38 = sub_2380E4D38();
  if (os_log_type_enabled(v37, v38))
  {
    id v39 = v33;
    uint64_t v76 = v34;
    uint64_t v74 = a5;
    id v40 = (uint8_t *)swift_slowAlloc();
    uint64_t v41 = swift_slowAlloc();
    uint64_t v81 = v41;
    *(_DWORD *)id v40 = 136446210;
    if (qword_26894A8A8 != -1) {
      swift_once();
    }
    uint64_t v42 = qword_26894BE10;
    unint64_t v43 = *(void *)algn_26894BE18;
    swift_bridgeObjectRetain();
    uint64_t v77 = sub_237EBC6BC(v42, v43, &v81);
    sub_2380E4FC8();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_237EB8000, v37, v38, "MediaPlaybackProvider#addToUpNext %{public}s set playback queue", v40, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23EC87710](v41, -1, -1);
    MEMORY[0x23EC87710](v40, -1, -1);

    v39((char *)v72, v7);
  }
  else
  {

    v33(v36, v7);
  }
  uint64_t v81 = 0;
  uint64_t v82 = 0;
  uint64_t v83 = 0;
  return ((uint64_t (*)(uint64_t *))a4)(&v81);
}

uint64_t sub_2380B4D78(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v3(a2);
  return swift_release();
}

void sub_2380B4DCC(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  if (a1)
  {
    id v20 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F54788]), sel_init);
    uint64_t v18 = swift_allocObject();
    *(void *)(v18 + 16) = a8;
    *(void *)(v18 + 24) = a9;
    *(void *)(v18 + 32) = v9;
    *(void *)(v18 + 40) = a2;
    *(_DWORD *)(v18 + 48) = a3;
    *(void *)(v18 + 56) = a4;
    *(void *)(v18 + 64) = a5;
    *(void *)(v18 + 72) = a6;
    *(void *)(v18 + 80) = a7;
    aBlock[4] = sub_237F636AC;
    aBlock[5] = v18;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_237F624B8;
    aBlock[3] = &block_descriptor_183;
    uint64_t v19 = _Block_copy(aBlock);
    swift_bridgeObjectRetain();
    swift_retain();
    swift_retain();
    swift_bridgeObjectRetain();
    swift_release();
    objc_msgSend(v20, sel_connectToEndpoint_completion_, a1, v19);
    _Block_release(v19);
  }
  else
  {
    sub_2380B2AD8(0, a2, a3, a4, a5, a6, a7, a8, a9);
  }
}

uint64_t sub_2380B4F84(uint64_t a1, uint64_t a2, void *a3, void (*a4)(void, void, void), uint64_t a5, uint64_t a6, uint64_t a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  uint64_t v18 = sub_2380E4528();
  uint64_t v19 = *(void *)(v18 - 8);
  MEMORY[0x270FA5388](v18);
  uint64_t v21 = (char *)v34 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!a3) {
    return sub_2380B2AD8(a2, a7, a8, a9, a10, a11, a12, (uint64_t)a4, a5);
  }
  if (qword_26894AA20 != -1) {
    swift_once();
  }
  uint64_t v22 = __swift_project_value_buffer(v18, (uint64_t)qword_268956458);
  (*(void (**)(char *, uint64_t, uint64_t))(v19 + 16))(v21, v22, v18);
  id v23 = a3;
  id v24 = a3;
  Swift::String v25 = sub_2380E4508();
  os_log_type_t v26 = sub_2380E4D48();
  if (os_log_type_enabled(v25, v26))
  {
    uint64_t v35 = a4;
    os_log_type_t v27 = (uint8_t *)swift_slowAlloc();
    uint64_t v28 = swift_slowAlloc();
    v38[0] = v28;
    v34[1] = a5;
    *(_DWORD *)os_log_type_t v27 = 136446210;
    v34[0] = v27 + 4;
    v36[0] = a3;
    id v29 = a3;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26894BC20);
    uint64_t v30 = sub_2380E4988();
    v36[0] = sub_237EBC6BC(v30, v31, v38);
    sub_2380E4FC8();
    a4 = v35;
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_237EB8000, v25, v26, "Failed to connect to endpoint, error: %{public}s", v27, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23EC87710](v28, -1, -1);
    MEMORY[0x23EC87710](v27, -1, -1);
  }
  else
  {
  }
  (*(void (**)(char *, uint64_t))(v19 + 8))(v21, v18);
  LOBYTE(v36[0]) = 7;
  char v37 = 19;
  v33._object = (void *)0x80000002380FAF50;
  v33._countAndFlagsBits = 0xD000000000000018;
  SiriAudioSupport::PlaybackCodeAndDescription v39 = PlaybackCodeAndDescription.init(playbackCode:domainCode:errorDescription:)((SiriAudioSupport::PlaybackCode)v36, (SiriAudioSupport::DomainCode)&v37, v33);
  v36[0] = LOWORD(v38[0]);
  v36[1] = v38[1];
  v36[2] = v38[2];
  a4(v36, v39.errorDescription._countAndFlagsBits, v39.errorDescription._object);
  return swift_bridgeObjectRelease();
}

uint64_t sub_2380B52B8(void *a1, unint64_t a2, uint64_t (*a3)(uint64_t *), uint64_t a4)
{
  uint64_t v44 = a4;
  uint64_t v7 = sub_2380E4528();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)&v40 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  uint64_t v13 = (char *)&v40 - v12;
  uint64_t v14 = sub_237EC83D4(0, (unint64_t *)&qword_26894C6D0);
  uint64_t v15 = (void *)sub_2380E4F68();
  char v16 = sub_237EE56E8((uint64_t)v15, a2);

  if (v16)
  {
    if (qword_26894AA20 != -1) {
      swift_once();
    }
    uint64_t v17 = __swift_project_value_buffer(v7, (uint64_t)qword_268956458);
    (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v13, v17, v7);
    uint64_t v18 = sub_2380E4508();
    os_log_type_t v19 = sub_2380E4D38();
    if (os_log_type_enabled(v18, v19))
    {
      uint64_t v20 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v20 = 0;
      _os_log_impl(&dword_237EB8000, v18, v19, "Create radio success", v20, 2u);
      MEMORY[0x23EC87710](v20, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v8 + 8))(v13, v7);
    uint64_t v47 = 0;
    uint64_t v48 = 0;
    uint64_t v49 = 0;
    return a3(&v47);
  }
  else
  {
    if (qword_26894AA20 != -1) {
      swift_once();
    }
    uint64_t v22 = __swift_project_value_buffer(v7, (uint64_t)qword_268956458);
    (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v11, v22, v7);
    id v23 = a1;
    swift_bridgeObjectRetain();
    id v24 = a1;
    swift_bridgeObjectRetain();
    Swift::String v25 = sub_2380E4508();
    int v26 = sub_2380E4D48();
    if (os_log_type_enabled(v25, (os_log_type_t)v26))
    {
      unint64_t v43 = a3;
      uint64_t v27 = swift_slowAlloc();
      uint64_t v28 = swift_slowAlloc();
      v45[0] = v28;
      *(_DWORD *)uint64_t v27 = 136446466;
      os_log_t v42 = v25;
      int v41 = v26;
      uint64_t v40 = v28;
      if (a1)
      {
        swift_getErrorValue();
        uint64_t v29 = sub_2380E5468();
      }
      else
      {
        uint64_t v29 = 0;
        uint64_t v30 = 0;
      }
      uint64_t v47 = v29;
      uint64_t v48 = v30;
      __swift_instantiateConcreteTypeFromMangledName(&qword_26894C560);
      uint64_t v31 = sub_2380E4988();
      uint64_t v47 = sub_237EBC6BC(v31, v32, v45);
      sub_2380E4FC8();
      swift_bridgeObjectRelease();

      *(_WORD *)(v27 + 12) = 2082;
      uint64_t v33 = swift_bridgeObjectRetain();
      uint64_t v34 = MEMORY[0x23EC86140](v33, v14);
      unint64_t v36 = v35;
      swift_bridgeObjectRelease();
      uint64_t v47 = sub_237EBC6BC(v34, v36, v45);
      sub_2380E4FC8();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      os_log_t v37 = v42;
      _os_log_impl(&dword_237EB8000, v42, (os_log_type_t)v41, "Create radio failed. Error: %{public}s, statuses: %{public}s", (uint8_t *)v27, 0x16u);
      uint64_t v38 = v40;
      swift_arrayDestroy();
      MEMORY[0x23EC87710](v38, -1, -1);
      MEMORY[0x23EC87710](v27, -1, -1);

      (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v7);
      a3 = v43;
    }
    else
    {

      swift_bridgeObjectRelease_n();
      (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v7);
    }
    LOBYTE(v45[0]) = 8;
    char v46 = 19;
    v39._object = (void *)0x80000002380F5150;
    v39._countAndFlagsBits = 0xD000000000000011;
    SiriAudioSupport::PlaybackCodeAndDescription v50 = PlaybackCodeAndDescription.init(playbackCode:domainCode:errorDescription:)((SiriAudioSupport::PlaybackCode)v45, (SiriAudioSupport::DomainCode)&v46, v39);
    v45[0] = (unsigned __int16)v47;
    v45[1] = v48;
    v45[2] = v49;
    ((void (*)(uint64_t *, uint64_t, void *))a3)(v45, v50.errorDescription._countAndFlagsBits, v50.errorDescription._object);
    return swift_bridgeObjectRelease();
  }
}

void sub_2380B57D8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a1)
  {
    id v7 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F54788]), sel_init);
    uint64_t v8 = (void *)swift_allocObject();
    v8[2] = a2;
    v8[3] = a3;
    v8[4] = v3;
    v10[4] = sub_2380BF384;
    v10[5] = v8;
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 1107296256;
    v10[2] = sub_237F624B8;
    v10[3] = &block_descriptor_164;
    uint64_t v9 = _Block_copy(v10);
    swift_retain();
    swift_retain();
    swift_release();
    objc_msgSend(v7, sel_connectToEndpoint_completion_, a1, v9);
    _Block_release(v9);
  }
  else
  {
    sub_2380BD794(0, a2, a3);
  }
}

void sub_2380B5928(uint64_t a1, uint8_t *a2, void *a3, void (*a4)(uint64_t *, uint64_t, void *), uint64_t a5)
{
  uint64_t v10 = sub_2380E4528();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)&v44 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  char v16 = (char *)&v44 - v15;
  if (a3)
  {
    uint64_t v47 = a4;
    if (qword_26894AA20 != -1) {
      swift_once();
    }
    uint64_t v17 = __swift_project_value_buffer(v10, (uint64_t)qword_268956458);
    (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v14, v17, v10);
    id v18 = a3;
    id v19 = a3;
    uint64_t v20 = sub_2380E4508();
    os_log_type_t v21 = sub_2380E4D48();
    if (os_log_type_enabled(v20, v21))
    {
      uint64_t v22 = (uint8_t *)swift_slowAlloc();
      uint64_t v23 = swift_slowAlloc();
      uint64_t v46 = a5;
      uint64_t v24 = v23;
      v48[0] = v23;
      *(_DWORD *)uint64_t v22 = 136446210;
      uint64_t v45 = v22 + 4;
      swift_getErrorValue();
      uint64_t aBlock = sub_2380E5468();
      uint64_t v51 = v25;
      __swift_instantiateConcreteTypeFromMangledName(&qword_26894C560);
      uint64_t v26 = sub_2380E4988();
      uint64_t aBlock = sub_237EBC6BC(v26, v27, v48);
      sub_2380E4FC8();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_237EB8000, v20, v21, "Failed to connect to endpoint, error: %{public}s", v22, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x23EC87710](v24, -1, -1);
      MEMORY[0x23EC87710](v22, -1, -1);
    }
    else
    {
    }
    (*(void (**)(char *, uint64_t))(v11 + 8))(v14, v10);
    LOBYTE(v48[0]) = 8;
    char v49 = 19;
    v43._object = (void *)0x80000002380FAF70;
    v43._countAndFlagsBits = 0xD000000000000017;
    SiriAudioSupport::PlaybackCodeAndDescription v56 = PlaybackCodeAndDescription.init(playbackCode:domainCode:errorDescription:)((SiriAudioSupport::PlaybackCode)v48, (SiriAudioSupport::DomainCode)&v49, v43);
    v48[0] = (unsigned __int16)aBlock;
    v48[1] = v51;
    v48[2] = (uint64_t)v52;
    v47(v48, v56.errorDescription._countAndFlagsBits, v56.errorDescription._object);
    swift_bridgeObjectRelease();
  }
  else
  {
    if (qword_26894AA20 != -1) {
      swift_once();
    }
    uint64_t v45 = a2;
    uint64_t v28 = __swift_project_value_buffer(v10, (uint64_t)qword_268956458);
    (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v16, v28, v10);
    uint64_t v29 = sub_2380E4508();
    os_log_type_t v30 = sub_2380E4D38();
    if (os_log_type_enabled(v29, v30))
    {
      uint64_t v31 = swift_slowAlloc();
      uint64_t v47 = a4;
      unint64_t v32 = (uint8_t *)v31;
      uint64_t v33 = swift_slowAlloc();
      uint64_t v46 = a5;
      uint64_t v34 = v33;
      uint64_t aBlock = v33;
      *(_DWORD *)unint64_t v32 = 136315138;
      v48[0] = a1;
      uint64_t v35 = sub_2380E4988();
      v48[0] = sub_237EBC6BC(v35, v36, &aBlock);
      sub_2380E4FC8();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_237EB8000, v29, v30, "Connected to endpoint: %s", v32, 0xCu);
      swift_arrayDestroy();
      uint64_t v37 = v34;
      a5 = v46;
      MEMORY[0x23EC87710](v37, -1, -1);
      uint64_t v38 = v32;
      a4 = v47;
      MEMORY[0x23EC87710](v38, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v11 + 8))(v16, v10);
    id v39 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F547A8]), sel_init);
    objc_msgSend(v39, sel_setOrigin_, v45);
    id v40 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F54780]), sel_init);
    uint64_t v41 = swift_allocObject();
    *(void *)(v41 + 16) = a4;
    *(void *)(v41 + 24) = a5;
    uint64_t v54 = sub_2380BF390;
    uint64_t v55 = v41;
    uint64_t aBlock = MEMORY[0x263EF8330];
    uint64_t v51 = 1107296256;
    Swift::String v52 = sub_237F96CE4;
    os_log_type_t v53 = &block_descriptor_170;
    os_log_t v42 = _Block_copy(&aBlock);
    swift_retain();
    swift_release();
    objc_msgSend(v40, sel_sendCommand_toDestination_withOptions_completion_, 121, v39, 0, v42);
    _Block_release(v42);
  }
}

uint64_t sub_2380B5EF0(uint64_t a1, int a2)
{
  uint64_t v4 = sub_2380E4528();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v50 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = MEMORY[0x270FA5388](v6);
  uint64_t v11 = (char *)&v50 - v10;
  uint64_t v12 = MEMORY[0x270FA5388](v9);
  uint64_t v14 = (char *)&v50 - v13;
  MEMORY[0x270FA5388](v12);
  char v16 = (char *)&v50 - v15;
  if (a1)
  {
    uint64_t v17 = MRMediaRemoteCommandInfoCopyValueForKey();
    if (v17)
    {
      id v18 = (void *)v17;
      if (qword_26894AA20 != -1) {
        swift_once();
      }
      uint64_t v55 = v8;
      uint64_t v19 = __swift_project_value_buffer(v4, (uint64_t)qword_268956458);
      os_log_type_t v53 = *(void (**)(char *))(v5 + 16);
      uint64_t v54 = v19;
      v53(v11);
      uint64_t v20 = sub_2380E4508();
      os_log_type_t v21 = sub_2380E4D48();
      if (os_log_type_enabled(v20, v21))
      {
        uint64_t v22 = (uint8_t *)swift_slowAlloc();
        uint64_t v23 = swift_slowAlloc();
        uint64_t v52 = v5;
        uint64_t v24 = v23;
        uint64_t v56 = (uint64_t)v18;
        uint64_t v57 = v23;
        int v51 = a2;
        *(_DWORD *)uint64_t v22 = 136315138;
        SiriAudioSupport::PlaybackCodeAndDescription v50 = v22 + 4;
        __swift_instantiateConcreteTypeFromMangledName(&qword_26894D4D0);
        uint64_t v25 = sub_2380E4988();
        uint64_t v56 = sub_237EBC6BC(v25, v26, &v57);
        a2 = v51;
        sub_2380E4FC8();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_237EB8000, v20, v21, "supportedInsertionPositions: %s", v22, 0xCu);
        swift_arrayDestroy();
        uint64_t v27 = v24;
        uint64_t v5 = v52;
        MEMORY[0x23EC87710](v27, -1, -1);
        MEMORY[0x23EC87710](v22, -1, -1);
      }

      uint64_t v28 = *(void (**)(char *, uint64_t))(v5 + 8);
      v28(v11, v4);
      swift_unknownObjectRetain();
      uint64_t v29 = (void *)sub_2380E54B8();
      unsigned __int8 v30 = objc_msgSend(v18, sel_containsObject_, v29);

      swift_unknownObjectRelease();
      if (v30) {
        return 1;
      }
      id v40 = v55;
      ((void (*)(char *, uint64_t, uint64_t))v53)(v55, v54, v4);
      uint64_t v41 = sub_2380E4508();
      os_log_type_t v42 = sub_2380E4D48();
      if (os_log_type_enabled(v41, v42))
      {
        uint64_t v43 = swift_slowAlloc();
        uint64_t v54 = swift_slowAlloc();
        uint64_t v57 = v54;
        *(_DWORD *)uint64_t v43 = 136446466;
        LODWORD(v56) = a2;
        uint64_t v44 = sub_2380E53B8();
        uint64_t v56 = sub_237EBC6BC(v44, v45, &v57);
        sub_2380E4FC8();
        swift_bridgeObjectRelease();
        *(_WORD *)(v43 + 12) = 2082;
        uint64_t v56 = (uint64_t)v18;
        __swift_instantiateConcreteTypeFromMangledName(&qword_26894D4D0);
        uint64_t v46 = sub_2380E4988();
        uint64_t v56 = sub_237EBC6BC(v46, v47, &v57);
        sub_2380E4FC8();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_237EB8000, v41, v42, "Mode %{public}s not in %{public}s", (uint8_t *)v43, 0x16u);
        uint64_t v48 = v54;
        swift_arrayDestroy();
        MEMORY[0x23EC87710](v48, -1, -1);
        MEMORY[0x23EC87710](v43, -1, -1);

        char v49 = v55;
      }
      else
      {

        char v49 = v40;
      }
      v28(v49, v4);
    }
    else
    {
      if (qword_26894AA20 != -1) {
        swift_once();
      }
      uint64_t v36 = __swift_project_value_buffer(v4, (uint64_t)qword_268956458);
      (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v14, v36, v4);
      uint64_t v37 = sub_2380E4508();
      os_log_type_t v38 = sub_2380E4D48();
      if (os_log_type_enabled(v37, v38))
      {
        id v39 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)id v39 = 0;
        _os_log_impl(&dword_237EB8000, v37, v38, "supportedInsertionPositions is nil", v39, 2u);
        MEMORY[0x23EC87710](v39, -1, -1);
      }

      (*(void (**)(char *, uint64_t))(v5 + 8))(v14, v4);
    }
  }
  else
  {
    if (qword_26894AA20 != -1) {
      swift_once();
    }
    uint64_t v32 = __swift_project_value_buffer(v4, (uint64_t)qword_268956458);
    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v16, v32, v4);
    uint64_t v33 = sub_2380E4508();
    os_log_type_t v34 = sub_2380E4D48();
    if (os_log_type_enabled(v33, v34))
    {
      uint64_t v35 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v35 = 0;
      _os_log_impl(&dword_237EB8000, v33, v34, "MediaPlaybackProvider#isInsertionPositionSupported MRMediaRemoteCommandInfoRef is nil", v35, 2u);
      MEMORY[0x23EC87710](v35, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v5 + 8))(v16, v4);
  }
  return 0;
}

uint64_t sub_2380B657C(uint64_t result, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t, uint64_t), uint64_t a5, uint64_t a6, uint64_t a7)
{
  if (result == 125)
  {
    uint64_t result = MRMediaRemoteCommandInfoGetEnabled();
    if (result)
    {
      char v12 = a4(a2, a6);
      swift_beginAccess();
      *(unsigned char *)(a3 + 16) = v12 & 1;
      char v13 = a4(a2, 0);
      uint64_t result = swift_beginAccess();
      *(unsigned char *)(a7 + 16) = v13 & 1;
    }
  }
  return result;
}

uint64_t sub_2380B6648(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void (**)(uint64_t, uint64_t))(a1 + 32);
  swift_retain();
  v5(a2, a3);
  return swift_release();
}

uint64_t sub_2380B66A8(uint64_t a1, void *a2, uint64_t (*a3)(void, void), uint64_t a4)
{
  uint64_t v27 = a1;
  uint64_t v7 = sub_2380E4528();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v23 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26894AA20 != -1) {
    swift_once();
  }
  uint64_t v11 = __swift_project_value_buffer(v7, (uint64_t)qword_268956458);
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, v11, v7);
  id v12 = a2;
  char v13 = sub_2380E4508();
  os_log_type_t v14 = sub_2380E4D58();
  if (os_log_type_enabled(v13, v14))
  {
    uint64_t v25 = a4;
    unint64_t v26 = a3;
    uint64_t v15 = a2;
    uint64_t v16 = swift_slowAlloc();
    uint64_t v17 = swift_slowAlloc();
    uint64_t v30 = v17;
    *(_DWORD *)uint64_t v16 = 67240450;
    LODWORD(v28) = v27 != 0;
    sub_2380E4FC8();
    *(_WORD *)(v16 + 8) = 2082;
    uint64_t v24 = v15;
    if (v15)
    {
      uint64_t v28 = (uint64_t)v12;
      type metadata accessor for CFError(0);
      sub_2380BEFD0((unint64_t *)&qword_26894B528, type metadata accessor for CFError);
      uint64_t v18 = sub_2380E5468();
    }
    else
    {
      uint64_t v18 = 0;
      uint64_t v19 = 0;
    }
    uint64_t v28 = v18;
    uint64_t v29 = v19;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26894C560);
    uint64_t v20 = sub_2380E4988();
    uint64_t v28 = sub_237EBC6BC(v20, v21, &v30);
    sub_2380E4FC8();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_237EB8000, v13, v14, "MediaPlaybackProvider#groupLeaderWithTimeOut completed with endpoint present?:%{BOOL,public}d, error: %{public}s...", (uint8_t *)v16, 0x12u);
    swift_arrayDestroy();
    MEMORY[0x23EC87710](v17, -1, -1);
    MEMORY[0x23EC87710](v16, -1, -1);

    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
    a3 = v26;
    a2 = v24;
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  }
  return a3(v27, a2);
}

void sub_2380B69E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = sub_2380E4528();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)v29 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = a1;
  *(void *)(v11 + 24) = a2;
  uint64_t v12 = qword_26894AA20;
  swift_retain();
  if (v12 != -1) {
    swift_once();
  }
  uint64_t v13 = __swift_project_value_buffer(v7, (uint64_t)qword_268956458);
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, v13, v7);
  swift_bridgeObjectRetain_n();
  os_log_type_t v14 = sub_2380E4508();
  os_log_type_t v15 = sub_2380E4D58();
  if (os_log_type_enabled(v14, v15))
  {
    uint64_t v16 = (uint8_t *)swift_slowAlloc();
    uint64_t v30 = swift_slowAlloc();
    aBlock[0] = v30;
    uint64_t v32 = v11;
    *(_DWORD *)uint64_t v16 = 136315138;
    v29[1] = v16 + 4;
    uint64_t v17 = swift_bridgeObjectRetain();
    uint64_t v18 = MEMORY[0x23EC86140](v17, MEMORY[0x263F8D310]);
    uint64_t v31 = v7;
    uint64_t v19 = a4;
    uint64_t v20 = v18;
    unint64_t v22 = v21;
    swift_bridgeObjectRelease();
    uint64_t v23 = v20;
    a4 = v19;
    uint64_t v33 = sub_237EBC6BC(v23, v22, aBlock);
    uint64_t v11 = v32;
    sub_2380E4FC8();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_237EB8000, v14, v15, "MediaPlaybackProvider#decodeHashedRouteUIDs for routes: %s", v16, 0xCu);
    uint64_t v24 = v30;
    swift_arrayDestroy();
    MEMORY[0x23EC87710](v24, -1, -1);
    MEMORY[0x23EC87710](v16, -1, -1);

    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v31);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  }
  uint64_t v25 = *(void **)(a4 + 144);
  unint64_t v26 = (void *)sub_2380E4B08();
  uint64_t v27 = (void *)swift_allocObject();
  void v27[2] = a4;
  v27[3] = sub_237F38A7C;
  v27[4] = v11;
  aBlock[4] = (uint64_t)sub_2380BF284;
  aBlock[5] = (uint64_t)v27;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_2380ACF04;
  aBlock[3] = (uint64_t)&block_descriptor_120;
  uint64_t v28 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  objc_msgSend(v25, sel_decodeHashedRouteUIDs_completion_, v26, v28);
  _Block_release(v28);
}

void sub_2380B6D98(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = swift_bridgeObjectRetain();
  sub_2380B934C(v7);
  swift_bridgeObjectRelease();
  uint64_t v8 = *(void **)(a2 + 152);
  uint64_t v9 = (void *)sub_2380E4B08();
  swift_release();
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = a3;
  *(void *)(v10 + 24) = a4;
  v12[4] = sub_2380BF290;
  v12[5] = v10;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 1107296256;
  v12[2] = sub_2380B6EC4;
  v12[3] = &block_descriptor_126;
  uint64_t v11 = _Block_copy(v12);
  swift_retain();
  swift_release();
  objc_msgSend(v8, sel_discoverRemoteControlEndpointsMatchingUIDs_completion_, v9, v11);
  _Block_release(v11);
}

uint64_t sub_2380B6EC4(uint64_t a1)
{
  unint64_t v1 = *(void (**)(uint64_t, uint64_t))(a1 + 32);
  uint64_t v2 = sub_2380E4B28();
  uint64_t v3 = sub_2380E4B28();
  swift_retain();
  v1(v2, v3);
  swift_release();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void sub_2380B6F60(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v9 = *(void **)(v4 + 152);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26894B1E0);
  uint64_t v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_2380E7450;
  *(void *)(v10 + 32) = a1;
  *(void *)(v10 + 40) = a2;
  swift_bridgeObjectRetain();
  uint64_t v11 = (void *)sub_2380E4B08();
  swift_bridgeObjectRelease();
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = a3;
  *(void *)(v12 + 24) = a4;
  v14[4] = sub_2380BF320;
  v14[5] = v12;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 1107296256;
  v14[2] = sub_2380B6EC4;
  v14[3] = &block_descriptor_158;
  uint64_t v13 = _Block_copy(v14);
  swift_retain();
  swift_release();
  objc_msgSend(v9, sel_discoverRemoteControlEndpointsMatchingUIDs_completion_, v11, v13);
  _Block_release(v13);
}

uint64_t sub_2380B70AC(uint64_t a1, uint64_t a2, uint64_t (*a3)(void), uint64_t a4, const char *a5)
{
  uint64_t v9 = sub_2380E4528();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)v25 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26894AA20 != -1) {
    swift_once();
  }
  uint64_t v13 = __swift_project_value_buffer(v9, (uint64_t)qword_268956458);
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v12, v13, v9);
  swift_bridgeObjectRetain_n();
  os_log_type_t v14 = sub_2380E4508();
  os_log_type_t v15 = sub_2380E4D58();
  if (os_log_type_enabled(v14, v15))
  {
    uint64_t v29 = a3;
    uint64_t v16 = swift_slowAlloc();
    uint64_t v27 = a5;
    uint64_t v17 = (uint8_t *)v16;
    uint64_t v26 = swift_slowAlloc();
    uint64_t v31 = v26;
    *(_DWORD *)uint64_t v17 = 136315138;
    v25[0] = v17 + 4;
    uint64_t v18 = swift_bridgeObjectRetain();
    v25[1] = MEMORY[0x263F8EE58] + 8;
    uint64_t v19 = MEMORY[0x23EC86140](v18);
    uint64_t v28 = a4;
    unint64_t v21 = v20;
    swift_bridgeObjectRelease();
    uint64_t v22 = v19;
    a3 = v29;
    uint64_t v30 = sub_237EBC6BC(v22, v21, &v31);
    sub_2380E4FC8();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_237EB8000, v14, v15, v27, v17, 0xCu);
    uint64_t v23 = v26;
    swift_arrayDestroy();
    MEMORY[0x23EC87710](v23, -1, -1);
    MEMORY[0x23EC87710](v17, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  return a3(a1);
}

id *sub_2380B7354()
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 2));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 7));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 12));

  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 20));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 25));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 30));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 35));
  return v0;
}

uint64_t sub_2380B73BC()
{
  sub_2380B7354();
  return swift_deallocClassInstance();
}

void sub_2380B73F0()
{
  off_26894D468 = &unk_26EAF72B0;
}

uint64_t static PFSQHandler.latestPFSQError.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_2380B7C4C(&qword_26894D470, &qword_26894D480, a1);
}

uint64_t static PFSQHandler.latestPFSQError.setter(uint64_t *a1)
{
  return sub_2380B7CBC(a1, &qword_26894D470, &qword_26894D480, &qword_26894D478);
}

uint64_t (*static PFSQHandler.latestPFSQError.modify())()
{
  return j__swift_endAccess;
}

uint64_t PFSQHandler.deinit()
{
  return v0;
}

uint64_t PFSQHandler.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t sub_2380B7498()
{
  sub_2380B7814(v46);
  if (qword_26894A938 != -1) {
    swift_once();
  }
  uint64_t v0 = byte_26894C098;
  int v1 = byte_26894C099;
  int v2 = byte_26894C09A;
  int v3 = byte_26894C09B;
  int v4 = byte_26894C09C;
  int v5 = byte_26894C09D;
  int v6 = byte_26894C09E;
  int v7 = byte_26894C09F;
  int v41 = byte_26894C0A1;
  int v42 = byte_26894C0A2;
  int v43 = byte_26894C0A3;
  int v44 = byte_26894C0A0;
  if (qword_26894A830 != -1) {
    swift_once();
  }
  uint64_t v8 = qword_26894B9E0;
  type metadata accessor for AppleMediaServicesProvider();
  uint64_t v9 = swift_allocObject();
  if (v1) {
    uint64_t v10 = 256;
  }
  else {
    uint64_t v10 = 0;
  }
  uint64_t v11 = v10 | v0;
  if (v2) {
    uint64_t v12 = 0x10000;
  }
  else {
    uint64_t v12 = 0;
  }
  if (v3) {
    uint64_t v13 = 0x1000000;
  }
  else {
    uint64_t v13 = 0;
  }
  uint64_t v14 = v11 | v12 | v13;
  uint64_t v15 = 0x100000000;
  if (!v4) {
    uint64_t v15 = 0;
  }
  uint64_t v16 = 0x10000000000;
  if (!v5) {
    uint64_t v16 = 0;
  }
  uint64_t v17 = 0x1000000000000;
  if (!v6) {
    uint64_t v17 = 0;
  }
  uint64_t v18 = v15 | v16;
  uint64_t v19 = 0x100000000000000;
  if (!v7) {
    uint64_t v19 = 0;
  }
  unint64_t v20 = v14 | v18 | v17 | v19;
  if (v41) {
    int v21 = 256;
  }
  else {
    int v21 = 0;
  }
  int v22 = v21 | v44;
  if (v42) {
    int v23 = 0x10000;
  }
  else {
    int v23 = 0;
  }
  if (v43) {
    int v24 = 0x1000000;
  }
  else {
    int v24 = 0;
  }
  int v25 = v22 | v23 | v24;
  swift_retain();
  id v26 = sub_2380BB3F0(v20, v25, v8, v9);
  uint64_t v27 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v46, v46[3]);
  MEMORY[0x270FA5388](v27);
  uint64_t v29 = (uint64_t *)((char *)&v41 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v30 + 16))(v29);
  uint64_t v31 = *v29;
  uint64_t v32 = type metadata accessor for MediaPlaybackProvider();
  uint64_t v45[3] = v32;
  v45[4] = &off_26EB042B8;
  v45[0] = v31;
  type metadata accessor for MediaPlaybackLite();
  uint64_t v33 = swift_allocObject();
  uint64_t v34 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v45, v32);
  MEMORY[0x270FA5388](v34);
  uint64_t v36 = (uint64_t *)((char *)&v41 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v37 + 16))(v36);
  uint64_t v38 = *v36;
  swift_retain();
  uint64_t v39 = sub_2380BB74C(v38, (uint64_t)v26, v33);
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v45);
  uint64_t result = __swift_destroy_boxed_opaque_existential_1((uint64_t)v46);
  qword_26894D488 = v39;
  return result;
}

uint64_t sub_2380B7814@<X0>(uint64_t *a1@<X8>)
{
  id v42 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F54778]), sel_init);
  id v1 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F17F98]), sel_init);
  if (qword_26894A958 != -1) {
    swift_once();
  }
  uint64_t v2 = qword_26894C278;
  uint64_t v48 = type metadata accessor for MultiUserConnectionProvider();
  char v49 = &protocol witness table for MultiUserConnectionProvider;
  *(void *)&long long v47 = v2;
  type metadata accessor for AccountProvider();
  uint64_t v3 = swift_allocObject();
  swift_retain();
  uint64_t v41 = sub_237FB1FD0(v1, (uint64_t)&v47, v3);

  id v40 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F54798]), sel_init);
  id v39 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F54790]), sel_init);
  if (qword_26894A8A0 != -1) {
    swift_once();
  }
  swift_beginAccess();
  sub_237ECEFFC((uint64_t)qword_26894BD48, (uint64_t)&v47);
  if (qword_26894A938 != -1) {
    swift_once();
  }
  uint64_t v4 = byte_26894C098;
  int v5 = byte_26894C099;
  int v6 = byte_26894C09A;
  int v7 = byte_26894C09B;
  int v8 = byte_26894C09C;
  int v31 = byte_26894C09D;
  int v32 = byte_26894C09E;
  int v33 = byte_26894C09F;
  int v34 = byte_26894C0A1;
  int v35 = byte_26894C0A2;
  int v36 = byte_26894C0A3;
  int v37 = byte_26894C0A0;
  type metadata accessor for SharedContextProvider();
  uint64_t inited = swift_initStaticObject();
  if (qword_26894A830 != -1) {
    swift_once();
  }
  uint64_t v9 = qword_26894B9E0;
  unint64_t v45 = &type metadata for WatchOSSupportProvider;
  uint64_t v46 = &off_26EAFDB30;
  uint64_t v10 = type metadata accessor for MediaPlaybackProvider();
  uint64_t v11 = swift_allocObject();
  uint64_t v12 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v44, (uint64_t)&type metadata for WatchOSSupportProvider);
  MEMORY[0x270FA5388](v12);
  (*(void (**)(void))(v13 + 16))();
  if (v5) {
    uint64_t v14 = 256;
  }
  else {
    uint64_t v14 = 0;
  }
  uint64_t v15 = v14 | v4;
  if (v6) {
    uint64_t v16 = 0x10000;
  }
  else {
    uint64_t v16 = 0;
  }
  if (v7) {
    uint64_t v17 = 0x1000000;
  }
  else {
    uint64_t v17 = 0;
  }
  uint64_t v18 = v15 | v16 | v17;
  uint64_t v19 = 0x100000000;
  if (!v8) {
    uint64_t v19 = 0;
  }
  uint64_t v20 = 0x10000000000;
  if (!v31) {
    uint64_t v20 = 0;
  }
  uint64_t v21 = 0x1000000000000;
  if (!v32) {
    uint64_t v21 = 0;
  }
  uint64_t v22 = v19 | v20;
  uint64_t v23 = 0x100000000000000;
  if (!v33) {
    uint64_t v23 = 0;
  }
  unint64_t v24 = v18 | v22 | v21 | v23;
  if (v34) {
    int v25 = 256;
  }
  else {
    int v25 = 0;
  }
  int v26 = v25 | v37;
  if (v35) {
    int v27 = 0x10000;
  }
  else {
    int v27 = 0;
  }
  if (v36) {
    int v28 = 0x1000000;
  }
  else {
    int v28 = 0;
  }
  uint64_t v29 = sub_237FCECC0((uint64_t)v42, v41, (uint64_t)v40, (uint64_t)v39, &v47, v24, v26 | v27 | v28, inited, v9, v11);
  swift_retain();
  uint64_t result = __swift_destroy_boxed_opaque_existential_1((uint64_t)v44);
  a1[3] = v10;
  a1[4] = (uint64_t)&off_26EB042B8;
  *a1 = v29;
  return result;
}

uint64_t static MediaPlaybackLite.latestPFSQError.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_2380B7C4C(&xmmword_26894D490, &qword_26894D4A0, a1);
}

uint64_t sub_2380B7C4C@<X0>(_OWORD *a1@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X8>)
{
  swift_beginAccess();
  uint64_t v6 = *a2;
  *(_OWORD *)a3 = *a1;
  *(void *)(a3 + 16) = v6;
  return swift_bridgeObjectRetain();
}

uint64_t static MediaPlaybackLite.latestPFSQError.setter(uint64_t *a1)
{
  return sub_2380B7CBC(a1, &xmmword_26894D490, &qword_26894D4A0, (void *)&xmmword_26894D490 + 1);
}

uint64_t sub_2380B7CBC(uint64_t *a1, void *a2, void *a3, void *a4)
{
  uint64_t v7 = *a1;
  uint64_t v8 = a1[1];
  uint64_t v9 = a1[2];
  swift_beginAccess();
  *a2 = v7;
  *a4 = v8;
  *a3 = v9;
  return swift_bridgeObjectRelease();
}

uint64_t (*static MediaPlaybackLite.latestPFSQError.modify())()
{
  return j_j__swift_endAccess;
}

double static MediaPlaybackLite.prepareForSetQueueSuccessExpireSeconds.getter()
{
  return 10.0;
}

uint64_t sub_2380B7D8C(uint64_t a1)
{
  return sub_2380B7DD4(a1, 0xD000000000000033, 0x80000002380FBAA0, &qword_26894D4A8);
}

uint64_t sub_2380B7DB0(uint64_t a1)
{
  return sub_2380B7DD4(a1, 0xD00000000000002CLL, 0x80000002380FBA70, &qword_26894D4B0);
}

uint64_t sub_2380B7DD4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v7 = sub_2380E4DF8();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_2380E4728();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)&v17 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2380E46E8();
  sub_2380E4DD8();
  uint64_t v15 = _s16SiriAudioSupport14DispatchQueuesV5queue_3qos10attributesSo012OS_dispatch_F0CSS_0D00D3QoSVAhIE10AttributesVtFZ_0(a2, a3, (uint64_t)v14, (uint64_t)v10);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  *a4 = v15;
  return result;
}

uint64_t sub_2380B7F6C(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3 = *a1;
  uint64_t v2 = a1[1];
  uint64_t v4 = *a2;
  swift_beginAccess();
  *(void *)(v4 + 96) = v3;
  *(void *)(v4 + 104) = v2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2380B7FCC()
{
  swift_beginAccess();
  uint64_t v1 = *(void *)(v0 + 96);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_2380B8028(long long *a1, uint64_t a2, unint64_t a3, uint64_t (*a4)(void), uint64_t a5)
{
  uint64_t v10 = sub_2380E4528();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)v30 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  uint64_t v16 = (char *)v30 - v15;
  long long v33 = *a1;
  uint64_t v17 = *((void *)a1 + 2);
  if (a3)
  {
    uint64_t v32 = a2;
    uint64_t v18 = qword_26894AA20;
    swift_bridgeObjectRetain();
    if (v18 != -1) {
      swift_once();
    }
    uint64_t v19 = __swift_project_value_buffer(v10, (uint64_t)qword_268956458);
    (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v14, v19, v10);
    swift_bridgeObjectRetain();
    uint64_t v20 = sub_2380E4508();
    os_log_type_t v21 = sub_2380E4D58();
    if (os_log_type_enabled(v20, v21))
    {
      int v31 = a4;
      uint64_t v22 = (uint8_t *)swift_slowAlloc();
      uint64_t v23 = swift_slowAlloc();
      v30[1] = a5;
      uint64_t v24 = v23;
      *(void *)&long long v35 = v23;
      v30[0] = v17;
      *(_DWORD *)uint64_t v22 = 136446210;
      swift_bridgeObjectRetain();
      uint64_t v34 = sub_237EBC6BC(v32, a3, (uint64_t *)&v35);
      a4 = v31;
      uint64_t v17 = v30[0];
      sub_2380E4FC8();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_237EB8000, v20, v21, "MediaPlaybackLite#prepareForSetQueue (AtomicValue) completed with refId: %{public}s...", v22, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x23EC87710](v24, -1, -1);
      MEMORY[0x23EC87710](v22, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    (*(void (**)(char *, uint64_t))(v11 + 8))(v14, v10);
  }
  else
  {
    if (qword_26894AA20 != -1) {
      swift_once();
    }
    uint64_t v25 = __swift_project_value_buffer(v10, (uint64_t)qword_268956458);
    (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v16, v25, v10);
    int v26 = sub_2380E4508();
    os_log_type_t v27 = sub_2380E4D48();
    if (os_log_type_enabled(v26, v27))
    {
      int v28 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)int v28 = 0;
      _os_log_impl(&dword_237EB8000, v26, v27, "MediaPlaybackLite#prepareForSetQueue (AtomicValue) completed with nil refId...", v28, 2u);
      MEMORY[0x23EC87710](v28, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v11 + 8))(v16, v10);
  }
  long long v35 = v33;
  uint64_t v36 = v17;
  return a4(&v35);
}

uint64_t sub_2380B83D4(unint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5)
{
  uint64_t v65 = a5;
  uint64_t v64 = a4;
  int v66 = a3;
  *(void *)&long long v75 = a2;
  unint64_t v69 = a1;
  uint64_t v80 = *MEMORY[0x263EF8340];
  uint64_t v71 = sub_2380E4808();
  uint64_t v68 = *(void *)(v71 - 8);
  MEMORY[0x270FA5388](v71);
  id v70 = (char *)&v61 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_2380E47F8();
  uint64_t v73 = *(void *)(v6 - 8);
  uint64_t v74 = v6;
  uint64_t v7 = MEMORY[0x270FA5388](v6);
  Swift::String v67 = (char *)&v61 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  char v72 = (char *)&v61 - v9;
  unint64_t v10 = sub_2380E4528();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)&v61 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  uint64_t v16 = (char *)&v61 - v15;
  if (qword_26894AA20 != -1) {
    goto LABEL_33;
  }
  while (1)
  {
    uint64_t v17 = __swift_project_value_buffer(v10, (uint64_t)qword_268956458);
    uint64_t v18 = *(void (**)(char *, uint64_t, unint64_t))(v11 + 16);
    v18(v16, v17, v10);
    uint64_t v19 = sub_2380E4508();
    os_log_type_t v20 = sub_2380E4D38();
    if (os_log_type_enabled(v19, v20))
    {
      os_log_type_t v21 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)os_log_type_t v21 = 0;
      _os_log_impl(&dword_237EB8000, v19, v20, "MediaPlaybackLite#setRepeatMode...", v21, 2u);
      MEMORY[0x23EC87710](v21, -1, -1);
    }

    uint64_t v22 = *(void (**)(char *, unint64_t))(v11 + 8);
    v22(v16, v10);
    unint64_t v23 = v75;
    if (!(void)v75) {
      break;
    }
    if (!*MEMORY[0x263F54CA0])
    {
      __break(1u);
      goto LABEL_36;
    }
    id v24 = (id)*MEMORY[0x263F54CA0];
    unint64_t v25 = v69;
    uint64_t v26 = sub_2380E4918();
    uint64_t v79 = sub_237EC83D4(0, (unint64_t *)&unk_26894C740);
    *(void *)&long long v78 = v26;
    sub_237ECAB6C(&v78, v77);
    uint64_t v27 = MEMORY[0x263F8EE80];
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v76 = v27;
    sub_237FA2060(v77, v24, isUniquelyReferenced_nonNull_native);
    uint64_t v29 = v76;

    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    uint64_t v30 = sub_2380AC9D0(v25, v23);
    unint64_t v10 = v31;
    sub_2380BEFD0(&qword_26894C410, MEMORY[0x263F047F8]);
    long long v33 = v70;
    uint64_t v32 = v71;
    sub_2380E47E8();
    uint64_t v62 = v29;
    switch(v10 >> 62)
    {
      case 1uLL:
        if (v30 >> 32 < (int)v30) {
          goto LABEL_34;
        }
        sub_23800CAA0(v30, v10);
        sub_2380BB994((int)v30, v30 >> 32);
        break;
      case 2uLL:
        uint64_t v38 = *(void *)(v30 + 16);
        uint64_t v39 = *(void *)(v30 + 24);
        sub_23800CAA0(v30, v10);
        swift_retain();
        swift_retain();
        sub_2380BB994(v38, v39);
        swift_release();
        swift_release();
        break;
      case 3uLL:
        *(void *)((char *)&v78 + 6) = 0;
        *(void *)&long long v78 = 0;
        goto LABEL_15;
      default:
        *(void *)&long long v78 = v30;
        WORD4(v78) = v10;
        BYTE10(v78) = BYTE2(v10);
        BYTE11(v78) = BYTE3(v10);
        BYTE12(v78) = BYTE4(v10);
        BYTE13(v78) = BYTE5(v10);
LABEL_15:
        sub_2380E47C8();
        break;
    }
    sub_237EFD1BC(v30, v10);
    id v40 = v72;
    sub_2380E47D8();
    (*(void (**)(char *, uint64_t))(v68 + 8))(v33, v32);
    sub_237EFD1BC(v30, v10);
    (*(void (**)(char *, char *, uint64_t))(v73 + 16))(v67, v40, v74);
    sub_2380BEFD0(&qword_26894C418, MEMORY[0x263F045C0]);
    sub_2380E4AB8();
    uint64_t v11 = *((void *)&v78 + 1);
    uint64_t v16 = (char *)v78;
    uint64_t v41 = *(void *)(v78 + 16);
    if (*((void *)&v78 + 1) == v41)
    {
      id v42 = (void *)MEMORY[0x263F8EE78];
LABEL_18:
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v73 + 8))(v72, v74);
      *(void *)&long long v78 = v42;
      __swift_instantiateConcreteTypeFromMangledName(&qword_26894B160);
      sub_237EBE37C((unint64_t *)&qword_26894B168, &qword_26894B160);
      uint64_t v43 = sub_2380E48F8();
      uint64_t v45 = v44;
      swift_bridgeObjectRelease();
      uint64_t v46 = (void *)*MEMORY[0x263F54D88];
      if (*MEMORY[0x263F54D88])
      {
        uint64_t v79 = MEMORY[0x263F8D310];
        *(void *)&long long v78 = v43;
        *((void *)&v78 + 1) = v45;
        sub_237ECAB6C(&v78, v77);
        id v47 = v46;
        uint64_t v48 = v62;
        char v49 = swift_isUniquelyReferenced_nonNull_native();
        uint64_t v76 = v48;
        sub_237FA2060(v77, v47, v49);
        uint64_t v50 = v76;

        swift_bridgeObjectRelease();
        __swift_project_boxed_opaque_existential_1((void *)(v63 + 56), *(void *)(v63 + 80));
        uint64_t v51 = swift_allocObject();
        *(void *)(v51 + 16) = v64;
        *(void *)(v51 + 24) = v65;
        swift_retain();
        sub_2380B0D40(v66, v50, (uint64_t)sub_2380BF018, v51);
        swift_bridgeObjectRelease();
        return swift_release();
      }
LABEL_36:
      __break(1u);
      JUMPOUT(0x2380B8D60);
    }
    if (*((uint64_t *)&v78 + 1) >= v41)
    {
      __break(1u);
LABEL_34:
      __break(1u);
    }
    uint64_t v14 = (char *)(v78 + 32);
    id v42 = (void *)MEMORY[0x263F8EE78];
    long long v75 = xmmword_2380E7450;
    unint64_t v52 = *((void *)&v78 + 1);
    while ((v11 & 0x8000000000000000) == 0)
    {
      if (v52 >= *((void *)v16 + 2)) {
        goto LABEL_32;
      }
      char v53 = v14[v52];
      __swift_instantiateConcreteTypeFromMangledName(&qword_26894B288);
      uint64_t v54 = swift_allocObject();
      *(_OWORD *)(v54 + 16) = v75;
      *(void *)(v54 + 56) = MEMORY[0x263F8E778];
      *(void *)(v54 + 64) = MEMORY[0x263F8E7C0];
      *(unsigned char *)(v54 + 32) = v53;
      uint64_t v55 = sub_2380E4958();
      uint64_t v57 = v56;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        id v42 = sub_237EBEE8C(0, v42[2] + 1, 1, v42);
      }
      unint64_t v59 = v42[2];
      unint64_t v58 = v42[3];
      unint64_t v10 = v59 + 1;
      if (v59 >= v58 >> 1) {
        id v42 = sub_237EBEE8C((void *)(v58 > 1), v59 + 1, 1, v42);
      }
      ++v52;
      v42[2] = v10;
      uint64_t v60 = &v42[2 * v59];
      v60[4] = v55;
      v60[5] = v57;
      if (v41 == v52) {
        goto LABEL_18;
      }
    }
    __break(1u);
LABEL_32:
    __break(1u);
LABEL_33:
    swift_once();
  }
  v18(v14, v17, v10);
  uint64_t v34 = sub_2380E4508();
  os_log_type_t v35 = sub_2380E4D48();
  if (os_log_type_enabled(v34, v35))
  {
    uint64_t v36 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v36 = 0;
    _os_log_impl(&dword_237EB8000, v34, v35, "MediaPlaybackLite#setRepeatMode received unexpected nil refId; can't set repeat mode",
      v36,
      2u);
    MEMORY[0x23EC87710](v36, -1, -1);
  }

  return ((uint64_t (*)(char *, unint64_t))v22)(v14, v10);
}

uint64_t sub_2380B8D70(uint64_t *a1, uint64_t (*a2)(void), uint64_t a3)
{
  uint64_t v6 = sub_2380E4528();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = *a1;
  uint64_t v11 = a1[1];
  uint64_t v12 = a1[2];
  if (qword_26894AA20 != -1) {
    swift_once();
  }
  uint64_t v13 = __swift_project_value_buffer(v6, (uint64_t)qword_268956458);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, v13, v6);
  swift_bridgeObjectRetain_n();
  uint64_t v14 = sub_2380E4508();
  os_log_type_t v15 = sub_2380E4D58();
  if (os_log_type_enabled(v14, v15))
  {
    uint64_t v26 = a2;
    uint64_t v16 = swift_slowAlloc();
    uint64_t v25 = a3;
    uint64_t v17 = (uint8_t *)v16;
    uint64_t v18 = swift_slowAlloc();
    uint64_t v27 = v10;
    uint64_t v28 = v18;
    uint64_t v24 = v18;
    *(_DWORD *)uint64_t v17 = 136446210;
    v23[1] = v17 + 4;
    uint64_t v29 = v27;
    uint64_t v30 = v11;
    uint64_t v31 = v12;
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26894B850);
    uint64_t v19 = sub_2380E4988();
    uint64_t v29 = sub_237EBC6BC(v19, v20, &v28);
    sub_2380E4FC8();
    swift_bridgeObjectRelease_n();
    a2 = v26;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_237EB8000, v14, v15, "MediaPlaybackLite#setRepeatMode repeat mode set with success?: %{public}s", v17, 0xCu);
    uint64_t v21 = v24;
    swift_arrayDestroy();
    uint64_t v10 = v27;
    MEMORY[0x23EC87710](v21, -1, -1);
    MEMORY[0x23EC87710](v17, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  uint64_t v29 = v10;
  uint64_t v30 = v11;
  uint64_t v31 = v12;
  return a2(&v29);
}

uint64_t MediaPlaybackLite.deinit()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  __swift_destroy_boxed_opaque_existential_1(v0 + 56);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  return v0;
}

uint64_t MediaPlaybackLite.__deallocating_deinit()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  __swift_destroy_boxed_opaque_existential_1(v0 + 56);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t sub_2380B90E4(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_237ED7A04(a1, a2, a3, a4);
}

uint64_t sub_2380B9108(uint64_t a1, uint64_t a2)
{
  return sub_237F226BC(a1, a2);
}

uint64_t sub_2380B912C(uint64_t a1, unint64_t a2, int a3, void (*a4)(long long *), uint64_t a5, double a6)
{
  return sub_237ED9A8C(a1, a2, a3, a4, a5, a6);
}

uint64_t sub_2380B9154(uint64_t *a1, uint64_t a2, uint64_t *a3)
{
  if (qword_26894A8A8 != -1) {
    swift_once();
  }
  uint64_t v5 = qword_26894BE10;
  unint64_t v6 = *(void *)algn_26894BE18;
  swift_bridgeObjectRetain();
  sub_237EBC6BC(v5, v6, a3);
  uint64_t v7 = *a1 + 8;
  sub_2380E4FC8();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v7;
  return result;
}

void *sub_2380B9208(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_26894B2E8);
  uint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_2380B9270(unint64_t a1, uint64_t a2, uint64_t a3)
{
  char v3 = a1;
  uint64_t v4 = (unsigned __int16)a1 >> 14;
  if ((a3 & 0x1000000000000000) == 0 || (a2 & 0x800000000000000) != 0)
  {
    uint64_t v10 = sub_2380E4A78();
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
    uint64_t v5 = MEMORY[0x23EC86050](15, a1 >> 16);
    uint64_t v6 = v5 + (v4 << 16);
    unint64_t v7 = v5 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    unint64_t v8 = v6 & 0xFFFFFFFFFFFF0000;
    if (!v4) {
      unint64_t v8 = v7;
    }
    return v8 | 8;
  }
}

uint64_t sub_2380B92EC@<X0>(uint64_t (*a1)(void)@<X0>, _DWORD *a2@<X8>)
{
  uint64_t result = a1();
  *a2 = result;
  return result;
}

uint64_t sub_2380B931C@<X0>(uint64_t (*a1)(void)@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = a1();
  *a2 = result;
  return result;
}

void *sub_2380B934C(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return (void *)MEMORY[0x263F8EE78];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26894B1E0);
  char v3 = (void *)swift_allocObject();
  int64_t v4 = _swift_stdlib_malloc_size(v3);
  uint64_t v5 = v4 - 32;
  if (v4 < 32) {
    uint64_t v5 = v4 - 17;
  }
  v3[2] = v1;
  v3[3] = 2 * (v5 >> 4);
  uint64_t v6 = sub_2380BAF0C((uint64_t)&v8, v3 + 4, v1, a1);
  swift_bridgeObjectRetain();
  sub_237F3987C();
  if (v6 != v1)
  {
    __break(1u);
    return (void *)MEMORY[0x263F8EE78];
  }
  return v3;
}

unsigned __int8 *sub_2380B9434(unsigned __int8 *a1, uint64_t a2, uint64_t a3)
{
  return sub_2380B97D8(a1, a2, a3);
}

uint64_t sub_2380B944C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2380B9464(a1, a2, a3, (uint64_t (*)(void *, uint64_t, uint64_t))sub_2380B97D8);
}

uint64_t sub_2380B9464(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void *, uint64_t, uint64_t))
{
  uint64_t v15 = a1;
  uint64_t v16 = a2;
  swift_bridgeObjectRetain();
  uint64_t v7 = sub_2380E4A98();
  unint64_t v8 = v6;
  if ((v6 & 0x1000000000000000) == 0)
  {
    if ((v6 & 0x2000000000000000) == 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v10 = HIBYTE(v8) & 0xF;
    uint64_t v15 = v7;
    uint64_t v16 = v8 & 0xFFFFFFFFFFFFFFLL;
    uint64_t v9 = &v15;
    goto LABEL_7;
  }
  uint64_t v7 = sub_2380B9A54();
  unint64_t v12 = v11;
  swift_bridgeObjectRelease();
  unint64_t v8 = v12;
  if ((v12 & 0x2000000000000000) != 0) {
    goto LABEL_6;
  }
LABEL_3:
  if ((v7 & 0x1000000000000000) != 0)
  {
    uint64_t v9 = (void *)((v8 & 0xFFFFFFFFFFFFFFFLL) + 32);
    uint64_t v10 = v7 & 0xFFFFFFFFFFFFLL;
  }
  else
  {
    uint64_t v9 = (void *)sub_2380E51B8();
  }
LABEL_7:
  uint64_t v13 = a4(v9, v10, a3);
  swift_bridgeObjectRelease();
  return v13;
}

unsigned __int8 *sub_2380B955C(unsigned __int8 *result, uint64_t a2, int64_t a3)
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
            unint64_t v9 = 0;
            for (unint64_t i = result + 1; ; ++i)
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
              if (!is_mul_ok(v9, a3)) {
                return 0;
              }
              unint64_t v13 = v9 * a3;
              unsigned __int8 v14 = v11 + v12;
              BOOL v15 = v13 >= v14;
              unint64_t v9 = v13 - v14;
              if (!v15) {
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
      goto LABEL_66;
    }
    if (a2)
    {
      unsigned __int8 v25 = a3 + 48;
      unsigned __int8 v26 = a3 + 55;
      unsigned __int8 v27 = a3 + 87;
      if (a3 > 10)
      {
        unsigned __int8 v25 = 58;
      }
      else
      {
        unsigned __int8 v27 = 97;
        unsigned __int8 v26 = 65;
      }
      if (result)
      {
        unint64_t v28 = 0;
        do
        {
          unsigned int v29 = *result;
          if (v29 < 0x30 || v29 >= v25)
          {
            if (v29 < 0x41 || v29 >= v26)
            {
              if (v29 < 0x61 || v29 >= v27) {
                return 0;
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
          if (!is_mul_ok(v28, a3)) {
            return 0;
          }
          unint64_t v31 = v28 * a3;
          unsigned __int8 v32 = v29 + v30;
          BOOL v15 = __CFADD__(v31, v32);
          unint64_t v28 = v31 + v32;
          if (v15) {
            return 0;
          }
          ++result;
          --v3;
        }
        while (v3);
        return (unsigned __int8 *)v28;
      }
      return 0;
    }
    return 0;
  }
  if (a2 < 1)
  {
LABEL_66:
    __break(1u);
    return result;
  }
  uint64_t v16 = a2 - 1;
  if (a2 == 1) {
    return 0;
  }
  unsigned __int8 v17 = a3 + 48;
  unsigned __int8 v18 = a3 + 55;
  unsigned __int8 v19 = a3 + 87;
  if (a3 > 10)
  {
    unsigned __int8 v17 = 58;
  }
  else
  {
    unsigned __int8 v19 = 97;
    unsigned __int8 v18 = 65;
  }
  if (!result) {
    return 0;
  }
  unint64_t v9 = 0;
  unint64_t v20 = result + 1;
  do
  {
    unsigned int v21 = *v20;
    if (v21 < 0x30 || v21 >= v17)
    {
      if (v21 < 0x41 || v21 >= v18)
      {
        if (v21 < 0x61 || v21 >= v19) {
          return 0;
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
    if (!is_mul_ok(v9, a3)) {
      return 0;
    }
    unint64_t v23 = v9 * a3;
    unsigned __int8 v24 = v21 + v22;
    BOOL v15 = __CFADD__(v23, v24);
    unint64_t v9 = v23 + v24;
    if (v15) {
      return 0;
    }
    ++v20;
    --v16;
  }
  while (v16);
  return (unsigned __int8 *)v9;
}

unsigned __int8 *sub_2380B97D8(unsigned __int8 *result, uint64_t a2, uint64_t a3)
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
            for (unint64_t i = result + 1; ; ++i)
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
  unsigned __int8 v18 = result + 1;
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

uint64_t sub_2380B9A54()
{
  unint64_t v0 = sub_2380E4AA8();
  uint64_t v4 = sub_2380B9AD4(v0, v1, v2, v3);
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_2380B9AD4(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  if ((a4 & 0x1000000000000000) != 0)
  {
    uint64_t v9 = sub_2380B9C2C(a1, a2, a3, a4);
    if (v9)
    {
      uint64_t v10 = v9;
      unsigned int v11 = sub_2380B9208(v9, 0);
      unint64_t v12 = sub_2380B9D2C((unint64_t)v14, (uint64_t)(v11 + 4), v10, a1, a2, a3, a4);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      if (v12 != v10)
      {
        __break(1u);
LABEL_11:
        sub_2380E51B8();
LABEL_4:
        JUMPOUT(0x23EC85FE0);
      }
    }
    else
    {
      unsigned int v11 = (void *)MEMORY[0x263F8EE78];
    }
    uint64_t v13 = MEMORY[0x23EC85FE0](v11 + 4, v11[2]);
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
    return MEMORY[0x23EC85FE0]((char *)v14 + (a1 >> 16), (a2 >> 16) - (a1 >> 16));
  }
}

uint64_t sub_2380B9C2C(unint64_t a1, unint64_t a2, unint64_t a3, uint64_t a4)
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
    a1 = sub_2380B9270(a1, a3, a4);
    unint64_t v7 = a1;
  }
  if ((v6 & 0xC) == v9)
  {
    a1 = sub_2380B9270(v6, v5, v4);
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
    return MEMORY[0x270F9D808](a1, a2, a3, a4);
  }
  __break(1u);
  return MEMORY[0x270F9D808](a1, a2, a3, a4);
}

unint64_t sub_2380B9D2C(unint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6, unint64_t a7)
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
    void v9[2] = a6;
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
    unint64_t v17 = v12 & 0xC;
    uint64_t result = v12;
    if (v17 == v15) {
      uint64_t result = sub_2380B9270(v12, a6, a7);
    }
    if (result >> 14 < v27 || result >> 14 >= v10) {
      break;
    }
    if ((a7 & 0x1000000000000000) != 0)
    {
      uint64_t result = sub_2380E4A68();
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
          uint64_t result = sub_2380E51B8();
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
    uint64_t result = sub_2380B9270(v12, a6, a7);
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
    unint64_t v12 = sub_2380E4A38();
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

char *sub_2380B9F40(void *(*a1)(uint64_t *__return_ptr, char *, char *))
{
  v16[2] = *MEMORY[0x263EF8340];
  uint64_t v4 = *v1;
  unint64_t v3 = v1[1];
  uint64_t v5 = v1;
  switch(v3 >> 62)
  {
    case 1uLL:
      uint64_t v9 = v3 & 0x3FFFFFFFFFFFFFFFLL;
      *(_OWORD *)unint64_t v1 = xmmword_2380F02B0;
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v11 = v4 >> 32;
      if (isUniquelyReferenced_nonNull_native) {
        goto LABEL_16;
      }
      if (v11 < (int)v4) {
        goto LABEL_23;
      }
      if (sub_2380E2B08() && __OFSUB__((int)v4, sub_2380E2B38())) {
        goto LABEL_24;
      }
      sub_2380E2B48();
      swift_allocObject();
      uint64_t v13 = sub_2380E2AE8();
      swift_release();
      uint64_t v9 = v13;
      uint64_t v11 = v4 >> 32;
LABEL_16:
      if (v11 < (int)v4)
      {
        __break(1u);
LABEL_23:
        __break(1u);
LABEL_24:
        __break(1u);
      }
      uint64_t result = sub_2380BA32C((int)v4, v11, a1);
      unint64_t v12 = v9 | 0x4000000000000000;
      if (v2)
      {
        *uint64_t v5 = v4;
        goto LABEL_19;
      }
      *uint64_t v5 = v4;
      v5[1] = v12;
      break;
    case 2uLL:
      uint64_t v14 = *v1;
      uint64_t v15 = v3 & 0x3FFFFFFFFFFFFFFFLL;
      sub_2380E2C78();
      uint64_t result = sub_2380BA32C(*(void *)(v14 + 16), *(void *)(v14 + 24), a1);
      unint64_t v12 = v15 | 0x8000000000000000;
      if (v2)
      {
        *unint64_t v1 = v14;
LABEL_19:
        v5[1] = v12;
      }
      else
      {
        *unint64_t v1 = v14;
        v1[1] = v12;
      }
      break;
    case 3uLL:
      memset(v16, 0, 15);
      uint64_t result = (char *)a1(&v14, (char *)v16, (char *)v16);
      if (!v2) {
        return (char *)v14;
      }
      return result;
    default:
      v16[0] = *v1;
      LOWORD(v16[1]) = v3;
      BYTE2(v16[1]) = BYTE2(v3);
      BYTE3(v16[1]) = BYTE3(v3);
      BYTE4(v16[1]) = BYTE4(v3);
      BYTE5(v16[1]) = BYTE5(v3);
      BYTE6(v16[1]) = BYTE6(v3);
      uint64_t result = (char *)a1(&v14, (char *)v16, (char *)v16 + BYTE6(v3));
      if (!v2) {
        uint64_t result = (char *)v14;
      }
      unint64_t v8 = LODWORD(v16[1]) | ((unint64_t)BYTE4(v16[1]) << 32) | ((unint64_t)BYTE5(v16[1]) << 40) | ((unint64_t)BYTE6(v16[1]) << 48);
      *unint64_t v1 = v16[0];
      v1[1] = v8;
      return result;
  }
  return result;
}

unsigned char *sub_2380BA244@<X0>(unsigned char *result@<X0>, unsigned char *a2@<X1>, void *a3@<X8>)
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
    uint64_t result = (unsigned char *)sub_2380BEB28(result, a2);
    unint64_t v5 = v7 & 0xFFFFFFFFFFFFFFLL;
  }
  else if ((unint64_t)v4 >= 0x7FFFFFFF)
  {
    uint64_t result = (unsigned char *)sub_2380BEBEC((uint64_t)result, (uint64_t)a2);
    unint64_t v5 = v8 | 0x8000000000000000;
  }
  else
  {
    uint64_t result = (unsigned char *)sub_2380BEC68((uint64_t)result, (uint64_t)a2);
    unint64_t v5 = v6 | 0x4000000000000000;
  }
LABEL_5:
  *a3 = result;
  a3[1] = v5;
  return result;
}

void *sub_2380BA2BC(void *(*a1)(uint64_t *__return_ptr, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a3)
  {
    uint64_t result = a1(&v6, a3, a4 - a3);
    if (v4) {
      return result;
    }
    return (void *)v6;
  }
  uint64_t result = a1(&v6, 0, 0);
  if (!v4) {
    return (void *)v6;
  }
  return result;
}

char *sub_2380BA32C(uint64_t a1, uint64_t a2, void *(*a3)(uint64_t *__return_ptr, char *, char *))
{
  uint64_t result = (char *)sub_2380E2B08();
  if (!result) {
    goto LABEL_12;
  }
  uint64_t v8 = result;
  uint64_t result = (char *)sub_2380E2B38();
  uint64_t v9 = a1 - (void)result;
  if (__OFSUB__(a1, result))
  {
    __break(1u);
    goto LABEL_11;
  }
  BOOL v10 = __OFSUB__(a2, a1);
  uint64_t v11 = a2 - a1;
  if (v10)
  {
LABEL_11:
    __break(1u);
LABEL_12:
    __break(1u);
    return result;
  }
  uint64_t v12 = sub_2380E2B28();
  if (v12 >= v11) {
    uint64_t v13 = v11;
  }
  else {
    uint64_t v13 = v12;
  }
  uint64_t result = (char *)a3(&v14, &v8[v9], &v8[v9 + v13]);
  if (!v3) {
    return (char *)v14;
  }
  return result;
}

_OWORD *sub_2380BA3E0@<X0>(_OWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char a4@<W3>, _OWORD *a5@<X8>)
{
  uint64_t v6 = (void **)v5;
  uint64_t v12 = (void *)*v5;
  unint64_t v14 = sub_237EC9470(a2, a3);
  uint64_t v15 = v12[2];
  BOOL v16 = (v13 & 1) == 0;
  uint64_t v17 = v15 + v16;
  if (__OFADD__(v15, v16))
  {
    __break(1u);
    goto LABEL_17;
  }
  char v18 = v13;
  uint64_t v19 = v12[3];
  if (v19 < v17 || (a4 & 1) == 0)
  {
    if (v19 >= v17 && (a4 & 1) == 0)
    {
      sub_238079D14();
      goto LABEL_7;
    }
    sub_237EDC7E8(v17, a4 & 1);
    unint64_t v23 = sub_237EC9470(a2, a3);
    if ((v18 & 1) == (v24 & 1))
    {
      unint64_t v14 = v23;
      char v20 = *v6;
      if (v18) {
        goto LABEL_8;
      }
      goto LABEL_13;
    }
LABEL_17:
    uint64_t result = (_OWORD *)sub_2380E5458();
    __break(1u);
    return result;
  }
LABEL_7:
  char v20 = *v6;
  if (v18)
  {
LABEL_8:
    sub_237ECAB6C((_OWORD *)(v20[7] + 32 * v14), a5);
    uint64_t v21 = (_OWORD *)(v20[7] + 32 * v14);
    return sub_237ECAB6C(a1, v21);
  }
LABEL_13:
  sub_23807C9D4(v14, a2, a3, a1, v20);
  *a5 = 0u;
  a5[1] = 0u;
  return (_OWORD *)swift_bridgeObjectRetain();
}

uint64_t sub_2380BA558(uint64_t result, void *a2, uint64_t a3, uint64_t a4)
{
  unint64_t v5 = (void *)result;
  uint64_t v6 = a4 + 56;
  uint64_t v7 = -1 << *(unsigned char *)(a4 + 32);
  if (-v7 < 64) {
    uint64_t v8 = ~(-1 << -(char)v7);
  }
  else {
    uint64_t v8 = -1;
  }
  unint64_t v9 = v8 & *(void *)(a4 + 56);
  if (!a2)
  {
    int64_t v12 = 0;
    uint64_t v10 = 0;
LABEL_38:
    *unint64_t v5 = a4;
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
  uint64_t v11 = a2;
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
    char v20 = (void *)(*(void *)(a4 + 48) + 16 * v16);
    uint64_t v21 = v20[1];
    *uint64_t v11 = *v20;
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

void *sub_2380BA758(void *result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v28 = a4 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a4 + 32);
  if (-v5 < 64) {
    uint64_t v6 = ~(-1 << -(char)v5);
  }
  else {
    uint64_t v6 = -1;
  }
  unint64_t v7 = v6 & *(void *)(a4 + 64);
  if (!a2)
  {
    int64_t v10 = 0;
    uint64_t v8 = 0;
LABEL_39:
    *uint64_t result = a4;
    result[1] = v28;
    result[2] = ~v5;
    result[3] = v10;
    result[4] = v7;
    return (void *)v8;
  }
  uint64_t v8 = a3;
  if (!a3)
  {
    int64_t v10 = 0;
    goto LABEL_39;
  }
  if (a3 < 0) {
    goto LABEL_41;
  }
  uint64_t v9 = a2;
  uint64_t v25 = -1 << *(unsigned char *)(a4 + 32);
  uint64_t v26 = result;
  int64_t v10 = 0;
  uint64_t v11 = 0;
  int64_t v27 = (unint64_t)(63 - v5) >> 6;
  if (!v7) {
    goto LABEL_9;
  }
LABEL_8:
  unint64_t v12 = __clz(__rbit64(v7));
  v7 &= v7 - 1;
  unint64_t v13 = v12 | (v10 << 6);
  while (1)
  {
    ++v11;
    unint64_t v17 = *(void *)(a4 + 56) + (v13 << 6);
    uint64_t v18 = *(void *)(v17 + 8);
    uint64_t v20 = *(void *)(v17 + 16);
    uint64_t v19 = *(void *)(v17 + 24);
    char v21 = *(unsigned char *)(v17 + 32);
    uint64_t v23 = *(void *)(v17 + 40);
    uint64_t v22 = *(void *)(v17 + 48);
    uint64_t v24 = *(void *)(v17 + 56);
    *(void *)uint64_t v9 = *(void *)v17;
    *(void *)(v9 + 8) = v18;
    *(void *)(v9 + 16) = v20;
    *(void *)(v9 + 24) = v19;
    *(unsigned char *)(v9 + 32) = v21;
    *(void *)(v9 + 40) = v23;
    *(void *)(v9 + 48) = v22;
    *(void *)(v9 + 56) = v24;
    if (v11 == v8)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      goto LABEL_38;
    }
    v9 += 64;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t result = (void *)swift_bridgeObjectRetain();
    if (v7) {
      goto LABEL_8;
    }
LABEL_9:
    int64_t v14 = v10 + 1;
    if (__OFADD__(v10, 1)) {
      break;
    }
    if (v14 >= v27) {
      goto LABEL_33;
    }
    unint64_t v15 = *(void *)(v28 + 8 * v14);
    if (!v15)
    {
      v10 += 2;
      if (v14 + 1 >= v27)
      {
        unint64_t v7 = 0;
        int64_t v10 = v14;
      }
      else
      {
        unint64_t v15 = *(void *)(v28 + 8 * v10);
        if (v15) {
          goto LABEL_14;
        }
        int64_t v16 = v14 + 2;
        if (v14 + 2 >= v27) {
          goto LABEL_33;
        }
        unint64_t v15 = *(void *)(v28 + 8 * v16);
        if (v15)
        {
LABEL_17:
          int64_t v14 = v16;
          goto LABEL_18;
        }
        int64_t v10 = v14 + 3;
        if (v14 + 3 < v27)
        {
          unint64_t v15 = *(void *)(v28 + 8 * v10);
          if (v15)
          {
LABEL_14:
            int64_t v14 = v10;
            goto LABEL_18;
          }
          int64_t v16 = v14 + 4;
          if (v14 + 4 >= v27)
          {
LABEL_33:
            unint64_t v7 = 0;
            goto LABEL_37;
          }
          unint64_t v15 = *(void *)(v28 + 8 * v16);
          if (!v15)
          {
            while (1)
            {
              int64_t v14 = v16 + 1;
              if (__OFADD__(v16, 1)) {
                goto LABEL_42;
              }
              if (v14 >= v27)
              {
                unint64_t v7 = 0;
                int64_t v10 = v27 - 1;
                goto LABEL_37;
              }
              unint64_t v15 = *(void *)(v28 + 8 * v14);
              ++v16;
              if (v15) {
                goto LABEL_18;
              }
            }
          }
          goto LABEL_17;
        }
        unint64_t v7 = 0;
        int64_t v10 = v14 + 2;
      }
LABEL_37:
      uint64_t v8 = v11;
LABEL_38:
      uint64_t v5 = v25;
      uint64_t result = v26;
      goto LABEL_39;
    }
LABEL_18:
    unint64_t v7 = (v15 - 1) & v15;
    unint64_t v13 = __clz(__rbit64(v15)) + (v14 << 6);
    int64_t v10 = v14;
  }
  __break(1u);
LABEL_41:
  __break(1u);
LABEL_42:
  __break(1u);
  return result;
}

uint64_t sub_2380BA9F8(uint64_t result, void *a2, uint64_t a3, uint64_t a4)
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
  uint64_t v11 = a2;
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
    uint64_t v22 = *(void *)(*(void *)(a4 + 56) + 8 * v16);
    *uint64_t v11 = *v20;
    v11[1] = v21;
    v11[2] = v22;
    if (v13 == v10)
    {
      swift_bridgeObjectRetain();
      goto LABEL_38;
    }
    v11 += 3;
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

void *sub_2380BAC00(void *result, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = a4;
  uint64_t v6 = a2;
  uint64_t v7 = result;
  if ((a4 & 0xC000000000000001) != 0)
  {
    sub_2380E50B8();
    sub_237EC83D4(0, (unint64_t *)&qword_26894BF00);
    sub_237FCB240();
    uint64_t result = (void *)sub_2380E4CA8();
    uint64_t v4 = v27;
    uint64_t v8 = v28;
    uint64_t v9 = v29;
    int64_t v10 = v30;
    unint64_t v11 = v31;
    uint64_t v24 = v7;
    if (v6) {
      goto LABEL_3;
    }
LABEL_36:
    uint64_t v12 = 0;
LABEL_46:
    *uint64_t v24 = v4;
    v24[1] = v8;
    void v24[2] = v9;
    v24[3] = v10;
    v24[4] = v11;
    return (void *)v12;
  }
  int64_t v10 = 0;
  uint64_t v20 = -1 << *(unsigned char *)(a4 + 32);
  uint64_t v8 = a4 + 56;
  uint64_t v9 = ~v20;
  uint64_t v21 = -v20;
  if (v21 < 64) {
    uint64_t v22 = ~(-1 << v21);
  }
  else {
    uint64_t v22 = -1;
  }
  unint64_t v11 = v22 & *(void *)(a4 + 56);
  uint64_t v24 = result;
  if (!a2) {
    goto LABEL_36;
  }
LABEL_3:
  if (!a3)
  {
    uint64_t v12 = 0;
    goto LABEL_46;
  }
  if (a3 < 0) {
    goto LABEL_48;
  }
  uint64_t v12 = 0;
  int64_t v25 = (unint64_t)(v9 + 64) >> 6;
  uint64_t v23 = v9;
  while (1)
  {
    if (v4 < 0)
    {
      if (!sub_2380E50E8()) {
        goto LABEL_45;
      }
      sub_237EC83D4(0, (unint64_t *)&qword_26894BF00);
      swift_unknownObjectRetain();
      swift_dynamicCast();
      unint64_t v15 = v26;
      uint64_t result = (void *)swift_unknownObjectRelease();
      if (!v26) {
        goto LABEL_45;
      }
      goto LABEL_8;
    }
    if (v11)
    {
      unint64_t v13 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      unint64_t v14 = v13 | (v10 << 6);
      goto LABEL_7;
    }
    int64_t v16 = v10 + 1;
    if (__OFADD__(v10, 1)) {
      break;
    }
    if (v16 >= v25)
    {
      unint64_t v11 = 0;
      goto LABEL_45;
    }
    unint64_t v17 = *(void *)(v8 + 8 * v16);
    if (v17) {
      goto LABEL_23;
    }
    int64_t v18 = v10 + 2;
    if (v10 + 2 >= v25)
    {
      unint64_t v11 = 0;
      ++v10;
      goto LABEL_45;
    }
    unint64_t v17 = *(void *)(v8 + 8 * v18);
    if (!v17)
    {
      if (v10 + 3 >= v25) {
        goto LABEL_42;
      }
      unint64_t v17 = *(void *)(v8 + 8 * (v10 + 3));
      if (v17)
      {
        int64_t v16 = v10 + 3;
        goto LABEL_23;
      }
      int64_t v18 = v10 + 4;
      if (v10 + 4 >= v25)
      {
        unint64_t v11 = 0;
        v10 += 3;
        goto LABEL_45;
      }
      unint64_t v17 = *(void *)(v8 + 8 * v18);
      if (!v17)
      {
        int64_t v16 = v10 + 5;
        if (v10 + 5 >= v25)
        {
LABEL_42:
          unint64_t v11 = 0;
          int64_t v10 = v18;
          goto LABEL_45;
        }
        unint64_t v17 = *(void *)(v8 + 8 * v16);
        if (!v17)
        {
          int64_t v19 = v10 + 6;
          while (v25 != v19)
          {
            unint64_t v17 = *(void *)(v8 + 8 * v19++);
            if (v17)
            {
              int64_t v16 = v19 - 1;
              goto LABEL_23;
            }
          }
          unint64_t v11 = 0;
          int64_t v10 = v25 - 1;
          goto LABEL_45;
        }
        goto LABEL_23;
      }
    }
    int64_t v16 = v18;
LABEL_23:
    unint64_t v11 = (v17 - 1) & v17;
    unint64_t v14 = __clz(__rbit64(v17)) + (v16 << 6);
    int64_t v10 = v16;
LABEL_7:
    uint64_t result = *(id *)(*(void *)(v4 + 48) + 8 * v14);
    unint64_t v15 = result;
    if (!result) {
      goto LABEL_45;
    }
LABEL_8:
    ++v12;
    *v6++ = v15;
    if (v12 == a3)
    {
      uint64_t v12 = a3;
LABEL_45:
      uint64_t v9 = v23;
      goto LABEL_46;
    }
  }
  __break(1u);
LABEL_48:
  __break(1u);
  return result;
}

uint64_t sub_2380BAF0C(uint64_t result, void *a2, uint64_t a3, uint64_t a4)
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
  unint64_t v11 = a2;
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
    *unint64_t v11 = *v20;
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

void *sub_2380BB10C(void *result, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = a4 + 56;
  uint64_t v5 = -1;
  uint64_t v6 = -1 << *(unsigned char *)(a4 + 32);
  if (-v6 < 64) {
    uint64_t v5 = ~(-1 << -(char)v6);
  }
  unint64_t v7 = v5 & *(void *)(a4 + 56);
  if (!a2)
  {
    int64_t v8 = 0;
    a3 = 0;
LABEL_35:
    *uint64_t result = a4;
    result[1] = v4;
    result[2] = ~v6;
    result[3] = v8;
    result[4] = v7;
    return (void *)a3;
  }
  if (!a3)
  {
    int64_t v8 = 0;
    goto LABEL_35;
  }
  if (a3 < 0)
  {
LABEL_37:
    __break(1u);
    goto LABEL_38;
  }
  int64_t v8 = 0;
  uint64_t v9 = 0;
  int64_t v10 = (unint64_t)(63 - v6) >> 6;
  while (v7)
  {
    unint64_t v11 = __clz(__rbit64(v7));
    v7 &= v7 - 1;
    unint64_t v12 = v11 | (v8 << 6);
LABEL_8:
    ++v9;
    *a2++ = *(void *)(*(void *)(a4 + 48) + 8 * v12);
    if (v9 == a3) {
      goto LABEL_35;
    }
  }
  int64_t v13 = v8 + 1;
  if (__OFADD__(v8, 1))
  {
    __break(1u);
    goto LABEL_37;
  }
  if (v13 >= v10) {
    goto LABEL_30;
  }
  unint64_t v14 = *(void *)(v4 + 8 * v13);
  if (v14) {
    goto LABEL_19;
  }
  v8 += 2;
  if (v13 + 1 >= v10)
  {
    unint64_t v7 = 0;
    int64_t v8 = v13;
    goto LABEL_34;
  }
  unint64_t v14 = *(void *)(v4 + 8 * v8);
  if (v14)
  {
LABEL_15:
    int64_t v13 = v8;
LABEL_19:
    unint64_t v16 = __clz(__rbit64(v14));
    unint64_t v7 = (v14 - 1) & v14;
    unint64_t v12 = v16 + (v13 << 6);
    int64_t v8 = v13;
    goto LABEL_8;
  }
  int64_t v15 = v13 + 2;
  if (v13 + 2 >= v10) {
    goto LABEL_30;
  }
  unint64_t v14 = *(void *)(v4 + 8 * v15);
  if (v14)
  {
LABEL_18:
    int64_t v13 = v15;
    goto LABEL_19;
  }
  int64_t v8 = v13 + 3;
  if (v13 + 3 >= v10)
  {
    unint64_t v7 = 0;
    int64_t v8 = v13 + 2;
    goto LABEL_34;
  }
  unint64_t v14 = *(void *)(v4 + 8 * v8);
  if (v14) {
    goto LABEL_15;
  }
  int64_t v15 = v13 + 4;
  if (v13 + 4 >= v10)
  {
LABEL_30:
    unint64_t v7 = 0;
LABEL_34:
    a3 = v9;
    goto LABEL_35;
  }
  unint64_t v14 = *(void *)(v4 + 8 * v15);
  if (v14) {
    goto LABEL_18;
  }
  while (1)
  {
    int64_t v13 = v15 + 1;
    if (__OFADD__(v15, 1)) {
      break;
    }
    if (v13 >= v10)
    {
      unint64_t v7 = 0;
      int64_t v8 = v10 - 1;
      goto LABEL_34;
    }
    unint64_t v14 = *(void *)(v4 + 8 * v13);
    ++v15;
    if (v14) {
      goto LABEL_19;
    }
  }
LABEL_38:
  __break(1u);
  return result;
}

uint64_t sub_2380BB2A0(uint64_t result, int a2, uint64_t a3, uint64_t a4)
{
  if (result < 0 || 1 << *(unsigned char *)(a4 + 32) <= result)
  {
    __break(1u);
    goto LABEL_7;
  }
  if (((*(void *)(a4 + 8 * ((unint64_t)result >> 6) + 64) >> result) & 1) == 0)
  {
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }
  if (*(_DWORD *)(a4 + 36) != a2) {
LABEL_8:
  }
    __break(1u);
  return result;
}

uint64_t sub_2380BB2F0(uint64_t result, int a2, uint64_t a3, uint64_t a4)
{
  if (result < 0 || 1 << *(unsigned char *)(a4 + 32) <= result)
  {
    __break(1u);
    goto LABEL_7;
  }
  if (((*(void *)(a4 + 8 * ((unint64_t)result >> 6) + 64) >> result) & 1) == 0)
  {
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }
  if (*(_DWORD *)(a4 + 36) == a2) {
    return *(void *)(*(void *)(a4 + 56) + 8 * result);
  }
LABEL_8:
  __break(1u);
  return result;
}

uint64_t sub_2380BB340(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 64);
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
  unint64_t v1 = *(void *)(a1 + 72);
  if (v1)
  {
    uint64_t v2 = 64;
    return __clz(__rbit64(v1)) + v2;
  }
  if (v6 < 8) {
    return v3;
  }
  unint64_t v1 = *(void *)(a1 + 80);
  if (v1)
  {
    uint64_t v2 = 128;
    return __clz(__rbit64(v1)) + v2;
  }
  unint64_t v1 = *(void *)(a1 + 88);
  if (v1)
  {
    uint64_t v2 = 192;
    return __clz(__rbit64(v1)) + v2;
  }
  unint64_t v7 = (unint64_t)(v3 + 63) >> 6;
  if (v7 <= 4) {
    unint64_t v7 = 4;
  }
  unint64_t v8 = v7 - 4;
  uint64_t v9 = (unint64_t *)(a1 + 96);
  uint64_t v2 = 192;
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

id sub_2380BB3F0(unint64_t a1, int a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = sub_2380E4528();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  unint64_t v11 = (char *)&v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v29 = &type metadata for FeatureFlagProvider;
  int64_t v30 = &protocol witness table for FeatureFlagProvider;
  LOBYTE(v28) = a1 & 1;
  uint64x2_t v12 = (uint64x2_t)vdupq_n_s64(a1);
  int16x8_t v13 = (int16x8_t)vuzp1q_s32((int32x4_t)vshlq_u64(v12, (uint64x2_t)xmmword_2380E7630), (int32x4_t)vshlq_u64(v12, (uint64x2_t)xmmword_2380E7620));
  *(int8x8_t *)v13.i8 = vand_s8((int8x8_t)vmovn_s32((int32x4_t)v13), (int8x8_t)0x1000100010001);
  *(_DWORD *)((char *)&v28 + 1) = vmovn_s16(v13).u32[0];
  BYTE5(v28) = BYTE5(a1) & 1;
  BYTE6(v28) = BYTE6(a1) & 1;
  BYTE7(v28) = HIBYTE(a1) & 1;
  WORD4(v28) = a2 & 0x101;
  BYTE10(v28) = BYTE2(a2) & 1;
  BYTE11(v28) = HIBYTE(a2) & 1;
  uint64_t v26 = type metadata accessor for SiriKitTaskLoggingProvider();
  uint64_t v27 = &protocol witness table for SiriKitTaskLoggingProvider;
  *(void *)&long long v25 = a3;
  *(void *)(a4 + 16) = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for AppleMediaServicesRequestHandler()), sel_init);
  if (qword_26894AA20 != -1) {
    swift_once();
  }
  uint64_t v14 = __swift_project_value_buffer(v8, (uint64_t)qword_268956458);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, v14, v8);
  int64_t v15 = sub_2380E4508();
  os_log_type_t v16 = sub_2380E4D38();
  if (os_log_type_enabled(v15, v16))
  {
    int64_t v17 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)int64_t v17 = 0;
    _os_log_impl(&dword_237EB8000, v15, v16, "AppleMediaServicesProvider#init...", v17, 2u);
    MEMORY[0x23EC87710](v17, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  unint64_t v18 = self;
  id result = objc_msgSend(v18, sel_bagSubProfile);
  if (result)
  {
    uint64_t v20 = result;
    sub_2380E4938();

    id result = objc_msgSend(v18, sel_bagSubProfileVersion);
    if (result)
    {
      uint64_t v21 = result;
      sub_2380E4938();

      uint64_t v22 = (void *)sub_2380E4918();
      swift_bridgeObjectRelease();
      uint64_t v23 = (void *)sub_2380E4918();
      swift_bridgeObjectRelease();
      id v24 = objc_msgSend(self, sel_bagForProfile_profileVersion_, v22, v23);

      *(void *)(a4 + 24) = v24;
      sub_237EC4D08(&v28, a4 + 32);
      sub_237EC4D08(&v25, a4 + 72);
      return (id)a4;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_2380BB74C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v9[3] = type metadata accessor for AppleMediaServicesProvider();
  v9[4] = &protocol witness table for AppleMediaServicesProvider;
  v9[0] = a2;
  v8[3] = type metadata accessor for MediaPlaybackProvider();
  v8[4] = &off_26EB042B8;
  v8[0] = a1;
  *(_OWORD *)(a3 + 96) = 0u;
  *(_OWORD *)(a3 + 112) = 0u;
  *(void *)(a3 + 128) = MEMORY[0x263F8EE80];
  sub_237ECEFFC((uint64_t)v8, a3 + 56);
  sub_237ECEFFC((uint64_t)v9, a3 + 16);
  *(void *)(a3 + 112) = 0;
  *(void *)(a3 + 120) = 0;
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26894C778);
  swift_allocObject();
  *(void *)(a3 + 136) = sub_237F5EE40(0xD000000000000019, 0x80000002380FBB30, (uint64_t)sub_237F03914, 0);
  swift_allocObject();
  swift_retain();
  uint64_t v6 = sub_237F5EE40(0xD000000000000032, 0x80000002380FBB50, (uint64_t)sub_237EDA4B4, a3);
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v9);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v8);
  *(void *)(a3 + 136) = v6;
  swift_release();
  return a3;
}

uint64_t sub_2380BB8C0(long long *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v10 = *((void *)a1 + 2);
  long long v13 = *a1;
  uint64_t v14 = v10;
  unint64_t v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = a4;
  _DWORD v11[4] = a5;
  v11[5] = a6;
  sub_237ED9A14((uint64_t)&v13, (uint64_t)(v11 + 6), &qword_26894B850);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  sub_237F08378((uint64_t (*)(uint64_t *))sub_2380BF458, (uint64_t)v11);
  return swift_release();
}

uint64_t sub_2380BB994(uint64_t a1, uint64_t a2)
{
  uint64_t result = sub_2380E2B08();
  if (!result || (uint64_t result = sub_2380E2B38(), !__OFSUB__(a1, result)))
  {
    if (!__OFSUB__(a2, a1))
    {
      sub_2380E2B28();
      sub_2380E4808();
      sub_2380BEFD0(&qword_26894C410, MEMORY[0x263F047F8]);
      return sub_2380E47C8();
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_2380BBA74@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  if (result)
  {
    swift_bridgeObjectRetain();
    uint64_t result = sub_2380E5188();
    if ((v3 & 1) == 0)
    {
      uint64_t v4 = result;
      uint64_t result = swift_bridgeObjectRelease();
      *a2 = 0;
      a2[1] = 0xE000000000000000;
      a2[2] = 15;
      a2[3] = v4;
      return result;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_2380BBB00(char a1, uint64_t a2, unint64_t a3)
{
  uint64_t v6 = sub_2380E4528();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)v25 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64x2_t v12 = (char *)v25 - v11;
  if ((a1 & 1) != 0 && a3)
  {
    uint64_t v13 = qword_26894AA20;
    swift_bridgeObjectRetain();
    if (v13 != -1) {
      swift_once();
    }
    uint64_t v14 = __swift_project_value_buffer(v6, (uint64_t)qword_268956458);
    (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v12, v14, v6);
    swift_bridgeObjectRetain();
    int64_t v15 = sub_2380E4508();
    os_log_type_t v16 = sub_2380E4D58();
    if (os_log_type_enabled(v15, v16))
    {
      int64_t v17 = (uint8_t *)swift_slowAlloc();
      uint64_t v18 = a2;
      uint64_t v19 = swift_slowAlloc();
      uint64_t v26 = v19;
      *(_DWORD *)int64_t v17 = 136315138;
      v25[1] = v17 + 4;
      swift_bridgeObjectRetain();
      void v25[2] = sub_237EBC6BC(v18, a3, &v26);
      sub_2380E4FC8();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_237EB8000, v15, v16, "MediaPlaybackProvider#generateTailSpinIfPolicyAndErrorAllow createTailSpinFile generated: %s", v17, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x23EC87710](v19, -1, -1);
      MEMORY[0x23EC87710](v17, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    (*(void (**)(char *, uint64_t))(v7 + 8))(v12, v6);
  }
  else
  {
    if (qword_26894AA20 != -1) {
      swift_once();
    }
    uint64_t v20 = __swift_project_value_buffer(v6, (uint64_t)qword_268956458);
    (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v10, v20, v6);
    uint64_t v21 = sub_2380E4508();
    os_log_type_t v22 = sub_2380E4D48();
    if (os_log_type_enabled(v21, v22))
    {
      uint64_t v23 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v23 = 0;
      _os_log_impl(&dword_237EB8000, v21, v22, "MediaPlaybackProvider#generateTailSpinIfPolicyAndErrorAllow failed to create tailspin file", v23, 2u);
      MEMORY[0x23EC87710](v23, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
  }
  if (qword_26894ABD0 != -1) {
    swift_once();
  }
  return sub_2380E4EF8();
}

uint64_t sub_2380BBEA8(uint64_t result)
{
  unint64_t v1 = *(void *)(result + 16);
  if (!v1) {
    return MEMORY[0x263F8EE78];
  }
  unint64_t v2 = 0;
  uint64_t v3 = result + 40;
  uint64_t v4 = -(uint64_t)v1;
  uint64_t v5 = MEMORY[0x263F8EE78];
  uint64_t v14 = result + 40;
  unint64_t v15 = *(void *)(result + 16);
  do
  {
    if (v2 <= v1) {
      unint64_t v6 = v1;
    }
    else {
      unint64_t v6 = v2;
    }
    uint64_t v7 = -(uint64_t)v6;
    for (unint64_t i = (uint64_t *)(v3 + 16 * v2++); ; i += 2)
    {
      if (v7 + v2 == 1)
      {
        __break(1u);
        return result;
      }
      uint64_t v10 = *(i - 1);
      uint64_t v9 = *i;
      sub_237EC4CB4();
      swift_bridgeObjectRetain();
      if (sub_2380E5038()) {
        break;
      }
      uint64_t result = swift_bridgeObjectRelease();
      ++v2;
      if (v4 + v2 == 1) {
        return v5;
      }
    }
    uint64_t result = swift_isUniquelyReferenced_nonNull_native();
    if ((result & 1) == 0) {
      uint64_t result = sub_237ECF824(0, *(void *)(v5 + 16) + 1, 1);
    }
    unint64_t v12 = *(void *)(v5 + 16);
    unint64_t v11 = *(void *)(v5 + 24);
    if (v12 >= v11 >> 1) {
      uint64_t result = sub_237ECF824(v11 > 1, v12 + 1, 1);
    }
    *(void *)(v5 + 16) = v12 + 1;
    uint64_t v13 = v5 + 16 * v12;
    *(void *)(v13 + 32) = v10;
    *(void *)(v13 + 40) = v9;
    uint64_t v3 = v14;
    unint64_t v1 = v15;
  }
  while (v4 + v2);
  return v5;
}

uint64_t sub_2380BC03C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v31 = a3;
  uint64_t v33 = a2;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26894BB58);
  MEMORY[0x270FA5388](v4 - 8);
  unint64_t v6 = (char *)v22 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_2380E2C68();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  unsigned __int8 v32 = (char *)v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = MEMORY[0x270FA5388](v9);
  uint64_t v34 = (char *)v22 - v12;
  uint64_t v36 = MEMORY[0x263F8EE78];
  uint64_t v30 = *(void *)(a1 + 16);
  if (v30)
  {
    unint64_t v13 = 0;
    uint64_t v26 = v6;
    uint64_t v27 = v8 + 48;
    os_log_type_t v35 = (void (**)(char *, char *, uint64_t))(v8 + 32);
    uint64_t v23 = (uint64_t (**)(char *, uint64_t))(v8 + 8);
    uint64_t v24 = a1;
    uint64_t v28 = v8 + 56;
    uint64_t v29 = v8 + 16;
    v22[1] = (v8 + 56) & 0xFFFFFFFFFFFFLL | 0xA0D1000000000000;
    while (1)
    {
      if (v13 >= *(void *)(a1 + 16))
      {
        __break(1u);
        return result;
      }
      unint64_t v14 = (*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
      uint64_t v15 = *(void *)(v8 + 72);
      (*(void (**)(char *, unint64_t, uint64_t))(v8 + 16))(v6, a1 + v14 + v15 * v13, v7);
      long long v25 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v8 + 56);
      v25(v6, 0, 1, v7);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) == 1) {
        goto LABEL_18;
      }
      os_log_type_t v16 = *v35;
      (*v35)(v34, v6, v7);
      if (sub_2380E2BD8() == v33 && v17 == v31) {
        break;
      }
      char v18 = sub_2380E5408();
      swift_bridgeObjectRelease();
      if (v18) {
        goto LABEL_11;
      }
      uint64_t result = (*v23)(v34, v7);
LABEL_4:
      ++v13;
      unint64_t v6 = v26;
      if (v30 == v13)
      {
        v25(v26, 1, 1, v7);
        goto LABEL_18;
      }
    }
    swift_bridgeObjectRelease();
LABEL_11:
    v16(v32, v34, v7);
    uint64_t v19 = v36;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      sub_237F6B8C0(0, *(void *)(v19 + 16) + 1, 1);
      uint64_t v19 = v36;
    }
    unint64_t v21 = *(void *)(v19 + 16);
    unint64_t v20 = *(void *)(v19 + 24);
    if (v21 >= v20 >> 1)
    {
      sub_237F6B8C0(v20 > 1, v21 + 1, 1);
      uint64_t v19 = v36;
    }
    *(void *)(v19 + 16) = v21 + 1;
    uint64_t result = ((uint64_t (*)(unint64_t, char *, uint64_t))v16)(v19 + v14 + v21 * v15, v32, v7);
    uint64_t v36 = v19;
    a1 = v24;
    goto LABEL_4;
  }
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v8 + 56))(v6, 1, 1, v7);
LABEL_18:
  swift_bridgeObjectRelease();
  sub_237F098FC((uint64_t)v6, &qword_26894BB58);
  return v36;
}

uint64_t sub_2380BC3EC(uint64_t result, int a2, uint64_t a3, uint64_t a4)
{
  if (result < 0 || 1 << *(unsigned char *)(a4 + 32) <= result)
  {
    __break(1u);
    goto LABEL_7;
  }
  if (((*(void *)(a4 + 8 * ((unint64_t)result >> 6) + 56) >> result) & 1) == 0)
  {
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }
  if (*(_DWORD *)(a4 + 36) == a2) {
    return *(void *)(*(void *)(a4 + 48) + 16 * result);
  }
LABEL_8:
  __break(1u);
  return result;
}

uint64_t sub_2380BC440(uint64_t result, int a2, uint64_t a3, uint64_t a4)
{
  if (result < 0 || 1 << *(unsigned char *)(a4 + 32) <= result)
  {
    __break(1u);
    goto LABEL_7;
  }
  if (((*(void *)(a4 + 8 * ((unint64_t)result >> 6) + 64) >> result) & 1) == 0)
  {
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }
  if (*(_DWORD *)(a4 + 36) == a2) {
    return *(void *)(*(void *)(a4 + 48) + 16 * result);
  }
LABEL_8:
  __break(1u);
  return result;
}

uint64_t sub_2380BC494(void *a1, uint64_t a2, uint64_t a3, void *a4, uint64_t (*a5)(uint64_t, uint64_t, uint64_t), uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v68 = a2;
  uint64_t v65 = sub_2380E44F8();
  uint64_t v67 = *(void *)(v65 - 8);
  uint64_t v15 = *(void *)(v67 + 64);
  uint64_t v16 = MEMORY[0x270FA5388](v65);
  uint64_t v17 = (char *)&v59 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v16);
  int v66 = (char *)&v59 - v18;
  uint64_t v19 = sub_2380E4528();
  uint64_t v60 = *(void *)(v19 - 8);
  uint64_t v61 = v19;
  MEMORY[0x270FA5388](v19);
  unint64_t v59 = (char *)&v59 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = swift_allocObject();
  long long v22 = *(_OWORD *)(a3 + 16);
  *(_OWORD *)(v21 + 16) = *(_OWORD *)a3;
  *(_OWORD *)(v21 + 32) = v22;
  *(_OWORD *)(v21 + 48) = *(_OWORD *)(a3 + 32);
  *(_DWORD *)(v21 + 63) = *(_DWORD *)(a3 + 47);
  *(void *)(v21 + 72) = a4;
  *(void *)(v21 + 80) = a5;
  uint64_t v62 = a5;
  uint64_t v63 = a7;
  uint64_t v23 = a6;
  *(void *)(v21 + 88) = a6;
  *(void *)(v21 + 96) = a7;
  *(void *)(v21 + 104) = a8;
  sub_237EF7FA4(a3);
  id v24 = a4;
  swift_retain();
  uint64_t v64 = (void *)a8;
  swift_retain();
  id v25 = objc_msgSend(a1, sel_outputDeviceUIDs);
  uint64_t v26 = sub_2380E4B28();

  uint64_t v27 = *(void *)(v26 + 16);
  swift_bridgeObjectRelease();
  if (v27
    || (id v28 = objc_msgSend(a1, sel_hashedOutputDeviceUIDs),
        uint64_t v29 = sub_2380E4B28(),
        v28,
        uint64_t v30 = *(void *)(v29 + 16),
        swift_bridgeObjectRelease(),
        v30))
  {
    uint64_t v64 = a1;
    uint64_t v31 = swift_allocObject();
    *(void *)(v31 + 16) = sub_2380C700C;
    *(void *)(v31 + 24) = v21;
    uint64_t v32 = v31;
    uint64_t v33 = qword_26894A818;
    swift_retain();
    if (v33 != -1) {
      swift_once();
    }
    id v34 = (id)qword_268956368;
    os_log_type_t v35 = v66;
    sub_2380E44D8();
    uint64_t v36 = v67;
    uint64_t v37 = v65;
    (*(void (**)(char *, char *, uint64_t))(v67 + 16))(v17, v35, v65);
    unint64_t v38 = (*(unsigned __int8 *)(v36 + 80) + 33) & ~(unint64_t)*(unsigned __int8 *)(v36 + 80);
    unint64_t v39 = (v15 + v38 + 7) & 0xFFFFFFFFFFFFFFF8;
    uint64_t v40 = swift_allocObject();
    *(void *)(v40 + 16) = "mediaPlaybackProviderCurrentDeviceApartWHAGroup";
    *(void *)(v40 + 24) = 47;
    *(unsigned char *)(v40 + 32) = 2;
    unint64_t v41 = v40 + v38;
    uint64_t v42 = v37;
    (*(void (**)(unint64_t, char *))(v36 + 32))(v41, v17);
    uint64_t v43 = (uint64_t (**)(unsigned __int8 *))(v40 + v39);
    *uint64_t v43 = sub_2380C7710;
    v43[1] = (uint64_t (*)(unsigned __int8 *))v32;
    swift_retain();
    sub_2380E4EB8();
    sub_2380E44B8();
    uint64_t v44 = swift_allocObject();
    *(void *)(v44 + 16) = sub_237EE15AC;
    *(void *)(v44 + 24) = v40;
    uint64_t v45 = swift_allocObject();
    *(void *)(v45 + 16) = sub_2380C7714;
    *(void *)(v45 + 24) = v44;
    uint64_t v46 = (void *)swift_allocObject();
    id v47 = v64;
    v46[2] = v64;
    v46[3] = sub_2380BF260;
    v46[4] = v45;
    aBlock[4] = sub_2380C7310;
    aBlock[5] = v46;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_237EFF834;
    aBlock[3] = &block_descriptor_1674;
    uint64_t v48 = _Block_copy(aBlock);
    swift_retain();
    swift_retain();
    id v49 = v47;
    swift_release();
    MEMORY[0x23EC86DD0](v68, v48);
    _Block_release(v48);
    swift_release();
    swift_release();
    (*(void (**)(char *, uint64_t))(v36 + 8))(v35, v42);
    swift_release();
  }
  else
  {
    uint64_t v51 = v24;
    if (qword_26894AA20 != -1) {
      swift_once();
    }
    uint64_t v52 = v61;
    uint64_t v53 = __swift_project_value_buffer(v61, (uint64_t)qword_268956458);
    uint64_t v55 = v59;
    uint64_t v54 = v60;
    (*(void (**)(char *, uint64_t, uint64_t))(v60 + 16))(v59, v53, v52);
    uint64_t v56 = sub_2380E4508();
    os_log_type_t v57 = sub_2380E4D38();
    if (os_log_type_enabled(v56, v57))
    {
      unint64_t v58 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v58 = 0;
      _os_log_impl(&dword_237EB8000, v56, v57, "MediaPlaybackProvider#currentDeviceApartOfWHAGroup: no hashed routes, skipping", v58, 2u);
      MEMORY[0x23EC87710](v58, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v54 + 8))(v55, v52);
    sub_237F2AA04(0, a3, v51, v62, v23, v63, (uint64_t)v64);
  }
  return swift_release();
}

uint64_t sub_2380BCAEC(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  char v7 = a4;
  uint64_t v8 = sub_2380E4528();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  unint64_t v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = *(void *)(a1 + 16);
  if (a3)
  {
    if (!v12)
    {
      if ((v7 & 1) == 0)
      {
        char v13 = 1;
        goto LABEL_8;
      }
      goto LABEL_6;
    }
  }
  else if (!v12)
  {
LABEL_6:
    char v7 = 1;
  }
  char v13 = v7 & 1;
LABEL_8:
  unsigned __int8 v24 = v13;
  if (qword_26894AA20 != -1) {
    swift_once();
  }
  uint64_t v14 = __swift_project_value_buffer(v8, (uint64_t)qword_268956458);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, v14, v8);
  int v15 = v24;
  uint64_t v16 = sub_2380E4508();
  os_log_type_t v17 = sub_2380E4D58();
  if (os_log_type_enabled(v16, v17))
  {
    BOOL v18 = a3 != 0;
    int v22 = v15;
    uint64_t v19 = swift_slowAlloc();
    *(_DWORD *)uint64_t v19 = 67109888;
    int v23 = v18;
    sub_2380E4FC8();
    *(_WORD *)(v19 + 8) = 1024;
    int v23 = v12 == 0;
    sub_2380E4FC8();
    *(_WORD *)(v19 + 14) = 1024;
    int v23 = a4 & 1;
    sub_2380E4FC8();
    *(_WORD *)(v19 + 20) = 1024;
    int v23 = v22;
    sub_2380E4FC8();
    _os_log_impl(&dword_237EB8000, v16, v17, "MediaPlaybackProvider#shouldSendPlayCommand seRoutePresent: %{BOOL}d, nonWHA: %{BOOL}d, apartOfWHAGroup: %{BOOL}d, shouldSendPlayCommand: %{BOOL}d...", (uint8_t *)v19, 0x1Au);
    MEMORY[0x23EC87710](v19, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  swift_beginAccess();
  return v24;
}

uint64_t sub_2380BCD7C(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(void *), uint64_t a6, uint64_t (*a7)(void), uint64_t a8)
{
  uint64_t v65 = a2;
  uint64_t v15 = sub_2380E44F8();
  uint64_t v63 = *(void *)(v15 - 8);
  uint64_t v64 = v15;
  uint64_t v16 = *(void *)(v63 + 64);
  uint64_t v17 = MEMORY[0x270FA5388](v15);
  MEMORY[0x270FA5388](v17);
  uint64_t v62 = (char *)&v56 - v18;
  uint64_t v19 = sub_2380E4528();
  uint64_t v58 = *(void *)(v19 - 8);
  uint64_t v59 = v19;
  MEMORY[0x270FA5388](v19);
  os_log_type_t v57 = (char *)&v56 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = swift_allocObject();
  *(void *)(v21 + 16) = a3;
  long long v22 = *(_OWORD *)(a4 + 16);
  *(_OWORD *)(v21 + 24) = *(_OWORD *)a4;
  *(_OWORD *)(v21 + 40) = v22;
  *(_OWORD *)(v21 + 56) = *(_OWORD *)(a4 + 32);
  *(_DWORD *)(v21 + 71) = *(_DWORD *)(a4 + 47);
  uint64_t v60 = a5;
  uint64_t v61 = a7;
  *(void *)(v21 + 80) = a5;
  *(void *)(v21 + 88) = a6;
  *(void *)(v21 + 96) = a7;
  *(void *)(v21 + 104) = a8;
  swift_retain();
  sub_237EF7FA4(a4);
  swift_retain();
  swift_retain();
  id v23 = objc_msgSend(a1, sel_outputDeviceUIDs);
  uint64_t v24 = sub_2380E4B28();

  uint64_t v25 = *(void *)(v24 + 16);
  swift_bridgeObjectRelease();
  if (v25
    || (id v26 = objc_msgSend(a1, sel_hashedOutputDeviceUIDs),
        uint64_t v27 = sub_2380E4B28(),
        v26,
        uint64_t v28 = *(void *)(v27 + 16),
        swift_bridgeObjectRelease(),
        v28))
  {
    uint64_t v61 = (uint64_t (*)(void))a1;
    uint64_t v29 = swift_allocObject();
    *(void *)(v29 + 16) = sub_2380C6F90;
    *(void *)(v29 + 24) = v21;
    uint64_t v30 = qword_26894A818;
    swift_retain();
    if (v30 != -1) {
      swift_once();
    }
    id v31 = (id)qword_268956368;
    uint64_t v32 = v62;
    sub_2380E44D8();
    uint64_t v33 = v63;
    id v34 = (char *)&v56 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v35 = v64;
    (*(void (**)(char *, char *))(v63 + 16))(v34, v32);
    unint64_t v36 = (*(unsigned __int8 *)(v33 + 80) + 33) & ~(unint64_t)*(unsigned __int8 *)(v33 + 80);
    unint64_t v37 = (v16 + v36 + 7) & 0xFFFFFFFFFFFFFFF8;
    uint64_t v38 = swift_allocObject();
    *(void *)(v38 + 16) = "mediaPlaybackProviderCurrentDeviceApartWHAGroup";
    *(void *)(v38 + 24) = 47;
    *(unsigned char *)(v38 + 32) = 2;
    unint64_t v39 = v38 + v36;
    uint64_t v40 = v35;
    (*(void (**)(unint64_t, char *, uint64_t))(v33 + 32))(v39, v34, v35);
    unint64_t v41 = (uint64_t (**)(unsigned __int8 *))(v38 + v37);
    NSObject *v41 = sub_2380C7710;
    v41[1] = (uint64_t (*)(unsigned __int8 *))v29;
    swift_retain();
    sub_2380E4EB8();
    sub_2380E44B8();
    uint64_t v42 = swift_allocObject();
    *(void *)(v42 + 16) = sub_237EE15AC;
    *(void *)(v42 + 24) = v38;
    uint64_t v43 = swift_allocObject();
    *(void *)(v43 + 16) = sub_2380C7714;
    *(void *)(v43 + 24) = v42;
    uint64_t v44 = (void *)swift_allocObject();
    uint64_t v45 = v61;
    v44[2] = v61;
    void v44[3] = sub_2380BF260;
    v44[4] = v43;
    aBlock[4] = sub_2380C7310;
    aBlock[5] = v44;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_237EFF834;
    aBlock[3] = &block_descriptor_1648;
    uint64_t v46 = _Block_copy(aBlock);
    swift_retain();
    swift_retain();
    id v47 = v45;
    swift_release();
    MEMORY[0x23EC86DD0](v65, v46);
    _Block_release(v46);
    swift_release();
    swift_release();
    (*(void (**)(char *, uint64_t))(v33 + 8))(v32, v40);
    swift_release();
  }
  else
  {
    if (qword_26894AA20 != -1) {
      swift_once();
    }
    uint64_t v49 = v59;
    uint64_t v50 = __swift_project_value_buffer(v59, (uint64_t)qword_268956458);
    uint64_t v52 = v57;
    uint64_t v51 = v58;
    (*(void (**)(char *, uint64_t, uint64_t))(v58 + 16))(v57, v50, v49);
    uint64_t v53 = sub_2380E4508();
    os_log_type_t v54 = sub_2380E4D38();
    if (os_log_type_enabled(v53, v54))
    {
      uint64_t v55 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v55 = 0;
      _os_log_impl(&dword_237EB8000, v53, v54, "MediaPlaybackProvider#currentDeviceApartOfWHAGroup: no hashed routes, skipping", v55, 2u);
      MEMORY[0x23EC87710](v55, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v51 + 8))(v52, v49);
    sub_237F45F18(0, (uint64_t *)a4, v60, a6, v61, a8);
  }
  return swift_release();
}

void sub_2380BD3C4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = sub_2380E4528();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)aBlock - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26894AA20 != -1) {
    swift_once();
  }
  uint64_t v9 = __swift_project_value_buffer(v5, (uint64_t)qword_268956458);
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, v9, v5);
  uint64_t v10 = sub_2380E4508();
  os_log_type_t v11 = sub_2380E4D58();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v12 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v12 = 134217984;
    aBlock[0] = 0x4014000000000000;
    sub_2380E4FC8();
    _os_log_impl(&dword_237EB8000, v10, v11, "MediaPlaybackProvider#groupLeaderWithTimeOut %f...", v12, 0xCu);
    MEMORY[0x23EC87710](v12, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = a2;
  *(void *)(v13 + 24) = a3;
  aBlock[4] = sub_2380BF274;
  aBlock[5] = v13;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_237ECBA18;
  aBlock[3] = &block_descriptor_111;
  uint64_t v14 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  MRAVEndpointGetMyGroupLeaderWithTimeout();
  _Block_release(v14);
}

uint64_t sub_2380BD644(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, int a10, uint64_t a11)
{
  uint64_t v14 = MROriginCopy();
  if (a1) {
    int UniqueIdentifier = MROriginGetUniqueIdentifier();
  }
  else {
    int UniqueIdentifier = 0;
  }
  uint64_t v16 = a2[5];
  uint64_t v17 = a2[6];
  __swift_project_boxed_opaque_existential_1(a2 + 2, v16);
  uint64_t v18 = swift_allocObject();
  *(void *)(v18 + 16) = a7;
  *(void *)(v18 + 24) = a8;
  *(void *)(v18 + 32) = a9;
  *(void *)(v18 + 40) = v14;
  *(void *)(v18 + 48) = a1;
  *(void *)(v18 + 56) = a2;
  *(_DWORD *)(v18 + 64) = a10;
  *(_DWORD *)(v18 + 68) = UniqueIdentifier;
  *(unsigned char *)(v18 + 72) = a1 == 0;
  *(void *)(v18 + 80) = a11;
  uint64_t v19 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, void (*)(uint64_t), uint64_t, uint64_t, uint64_t))(v17 + 8);
  swift_retain();
  swift_retain();
  v19(a3, a4, a5, a6, sub_2380BF4B8, v18, v16, v17);
  return swift_release();
}

void sub_2380BD794(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v6 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F547A8]), sel_init);
  uint64_t v7 = v6;
  if (a1) {
    objc_msgSend(v6, sel_setOrigin_, a1);
  }
  id v8 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F54780]), sel_init);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = a2;
  *(void *)(v9 + 24) = a3;
  _DWORD v11[4] = sub_2380C770C;
  v11[5] = v9;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 1107296256;
  v11[2] = sub_237F96CE4;
  v11[3] = &block_descriptor_177;
  uint64_t v10 = _Block_copy(v11);
  swift_retain();
  swift_release();
  objc_msgSend(v8, sel_sendCommand_toDestination_withOptions_completion_, 121, v7, 0, v10);
  _Block_release(v10);
}

id sub_2380BD8E0(id a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = sub_2380E4528();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)&v49 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = MEMORY[0x270FA5388](v7);
  uint64_t v12 = (char *)&v49 - v11;
  uint64_t v13 = MEMORY[0x270FA5388](v10);
  uint64_t v15 = (char *)&v49 - v14;
  MEMORY[0x270FA5388](v13);
  uint64_t v17 = (char *)&v49 - v16;
  if (a1)
  {
    if (a3)
    {
      id v18 = a1;
      objc_msgSend(v18, sel_mutableCopy);
      sub_2380E5068();
      swift_unknownObjectRelease();
      sub_237EC83D4(0, &qword_26894BC18);
      if (swift_dynamicCast())
      {
        uint64_t v19 = (void *)v54;
        uint64_t v20 = (void *)sub_2380E4918();
        objc_msgSend(v19, sel_setOriginatingOutputDeviceUID_, v20);

        if (qword_26894AA20 != -1) {
          swift_once();
        }
        uint64_t v21 = __swift_project_value_buffer(v5, (uint64_t)qword_268956458);
        (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v17, v21, v5);
        a1 = v19;
        long long v22 = sub_2380E4508();
        os_log_type_t v23 = sub_2380E4D38();
        int v24 = v23;
        if (os_log_type_enabled(v22, v23))
        {
          id v53 = v18;
          uint64_t v25 = swift_slowAlloc();
          int v52 = v24;
          id v26 = (uint8_t *)v25;
          uint64_t v51 = swift_slowAlloc();
          v55[0] = v51;
          uint64_t v50 = v26;
          *(_DWORD *)id v26 = 136446210;
          uint64_t v49 = v26 + 4;
          id v27 = a1;
          id v28 = objc_msgSend(v27, sel_description);
          uint64_t v29 = sub_2380E4938();
          unint64_t v31 = v30;

          uint64_t v54 = sub_237EBC6BC(v29, v31, v55);
          sub_2380E4FC8();

          swift_bridgeObjectRelease();
          uint64_t v32 = v50;
          _os_log_impl(&dword_237EB8000, v22, (os_log_type_t)v52, "MediaPlaybackProvider#createDestinationForSERouteId resolved destination: %{public}s", v50, 0xCu);
          uint64_t v33 = v51;
          swift_arrayDestroy();
          MEMORY[0x23EC87710](v33, -1, -1);
          MEMORY[0x23EC87710](v32, -1, -1);
        }
        else
        {
        }
        (*(void (**)(char *, uint64_t))(v6 + 8))(v17, v5);
      }
      else
      {
        if (qword_26894AA20 != -1) {
          swift_once();
        }
        uint64_t v44 = __swift_project_value_buffer(v5, (uint64_t)qword_268956458);
        (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v15, v44, v5);
        uint64_t v45 = sub_2380E4508();
        os_log_type_t v46 = sub_2380E4D48();
        if (os_log_type_enabled(v45, v46))
        {
          id v47 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)id v47 = 0;
          _os_log_impl(&dword_237EB8000, v45, v46, "MediaPlaybackProvider#createDestinationForSERouteId destination mutable copy failed", v47, 2u);
          MEMORY[0x23EC87710](v47, -1, -1);
        }

        (*(void (**)(char *, uint64_t))(v6 + 8))(v15, v5);
      }
    }
    else
    {
      uint64_t v38 = qword_26894AA20;
      id v39 = a1;
      if (v38 != -1) {
        swift_once();
      }
      uint64_t v40 = __swift_project_value_buffer(v5, (uint64_t)qword_268956458);
      (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v12, v40, v5);
      unint64_t v41 = sub_2380E4508();
      os_log_type_t v42 = sub_2380E4D48();
      if (os_log_type_enabled(v41, v42))
      {
        uint64_t v43 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v43 = 0;
        _os_log_impl(&dword_237EB8000, v41, v42, "MediaPlaybackProvider#createDestinationForSERouteId nil seRouteId", v43, 2u);
        MEMORY[0x23EC87710](v43, -1, -1);
      }

      (*(void (**)(char *, uint64_t))(v6 + 8))(v12, v5);
    }
  }
  else
  {
    if (qword_26894AA20 != -1) {
      swift_once();
    }
    uint64_t v34 = __swift_project_value_buffer(v5, (uint64_t)qword_268956458);
    (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v9, v34, v5);
    uint64_t v35 = sub_2380E4508();
    os_log_type_t v36 = sub_2380E4D48();
    if (os_log_type_enabled(v35, v36))
    {
      unint64_t v37 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v37 = 0;
      _os_log_impl(&dword_237EB8000, v35, v36, "MediaPlaybackProvider#createDestinationForSERouteId nil destination passed in", v37, 2u);
      MEMORY[0x23EC87710](v37, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
    return 0;
  }
  return a1;
}

uint64_t sub_2380BDF34(void *a1, uint64_t a2, void *a3, void *a4, uint64_t (*a5)(uint64_t, uint64_t), uint64_t a6, void *a7, int a8)
{
  uint64_t v64 = a2;
  uint64_t v65 = (void *)sub_2380E44F8();
  uint64_t v63 = *(v65 - 1);
  uint64_t v15 = *(void *)(v63 + 64);
  uint64_t v16 = MEMORY[0x270FA5388](v65);
  MEMORY[0x270FA5388](v16);
  uint64_t v62 = (char *)&v56 - v17;
  uint64_t v18 = sub_2380E4528();
  uint64_t v58 = *(void *)(v18 - 8);
  uint64_t v59 = v18;
  MEMORY[0x270FA5388](v18);
  os_log_type_t v57 = (char *)&v56 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = swift_allocObject();
  *(void *)(v20 + 16) = a3;
  *(void *)(v20 + 24) = a4;
  uint64_t v61 = a5;
  *(void *)(v20 + 32) = a5;
  *(void *)(v20 + 40) = a6;
  *(void *)(v20 + 48) = a7;
  int v60 = a8;
  *(unsigned char *)(v20 + 56) = a8;
  id v21 = a3;
  id v22 = a4;
  swift_retain();
  os_log_type_t v23 = a7;
  id v24 = objc_msgSend(a1, sel_outputDeviceUIDs);
  uint64_t v25 = sub_2380E4B28();

  uint64_t v26 = *(void *)(v25 + 16);
  swift_bridgeObjectRelease();
  if (v26
    || (id v27 = objc_msgSend(a1, sel_hashedOutputDeviceUIDs),
        uint64_t v28 = sub_2380E4B28(),
        v27,
        uint64_t v29 = *(void *)(v28 + 16),
        swift_bridgeObjectRelease(),
        v29))
  {
    uint64_t v61 = (uint64_t (*)(uint64_t, uint64_t))a1;
    uint64_t v30 = swift_allocObject();
    *(void *)(v30 + 16) = sub_2380BF304;
    *(void *)(v30 + 24) = v20;
    uint64_t v31 = qword_26894A818;
    swift_retain();
    if (v31 != -1) {
      swift_once();
    }
    id v32 = (id)qword_268956368;
    uint64_t v33 = v62;
    sub_2380E44D8();
    uint64_t v34 = v63;
    uint64_t v35 = (char *)&v56 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v36 = (uint64_t)v65;
    (*(void (**)(char *, char *))(v63 + 16))(v35, v33);
    unint64_t v37 = (*(unsigned __int8 *)(v34 + 80) + 33) & ~(unint64_t)*(unsigned __int8 *)(v34 + 80);
    unint64_t v38 = (v15 + v37 + 7) & 0xFFFFFFFFFFFFFFF8;
    uint64_t v39 = swift_allocObject();
    *(void *)(v39 + 16) = "mediaPlaybackProviderCurrentDeviceApartWHAGroup";
    *(void *)(v39 + 24) = 47;
    *(unsigned char *)(v39 + 32) = 2;
    (*(void (**)(unint64_t, char *, uint64_t))(v34 + 32))(v39 + v37, v35, v36);
    uint64_t v40 = (uint64_t (**)(unsigned __int8 *))(v39 + v38);
    *uint64_t v40 = sub_2380C7710;
    v40[1] = (uint64_t (*)(unsigned __int8 *))v30;
    swift_retain();
    sub_2380E4EB8();
    sub_2380E44B8();
    uint64_t v41 = swift_allocObject();
    *(void *)(v41 + 16) = sub_237EE15AC;
    *(void *)(v41 + 24) = v39;
    uint64_t v42 = swift_allocObject();
    *(void *)(v42 + 16) = sub_2380C7714;
    *(void *)(v42 + 24) = v41;
    uint64_t v43 = (void *)swift_allocObject();
    uint64_t v44 = v61;
    v43[2] = v61;
    v43[3] = sub_2380BF260;
    v43[4] = v42;
    aBlock[4] = sub_2380C7310;
    aBlock[5] = v43;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_237EFF834;
    aBlock[3] = &block_descriptor_152;
    uint64_t v45 = _Block_copy(aBlock);
    swift_retain();
    swift_retain();
    os_log_type_t v46 = v44;
    swift_release();
    MEMORY[0x23EC86DD0](v64, v45);
    _Block_release(v45);
    swift_release();
    swift_release();
    (*(void (**)(char *, void *))(v34 + 8))(v33, v65);
    swift_release();
  }
  else
  {
    uint64_t v65 = v23;
    uint64_t v48 = v21;
    if (qword_26894AA20 != -1) {
      swift_once();
    }
    uint64_t v49 = v59;
    uint64_t v50 = __swift_project_value_buffer(v59, (uint64_t)qword_268956458);
    int v52 = v57;
    uint64_t v51 = v58;
    (*(void (**)(char *, uint64_t, uint64_t))(v58 + 16))(v57, v50, v49);
    id v53 = sub_2380E4508();
    os_log_type_t v54 = sub_2380E4D38();
    if (os_log_type_enabled(v53, v54))
    {
      uint64_t v55 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v55 = 0;
      _os_log_impl(&dword_237EB8000, v53, v54, "MediaPlaybackProvider#currentDeviceApartOfWHAGroup: no hashed routes, skipping", v55, 2u);
      MEMORY[0x23EC87710](v55, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v51 + 8))(v52, v49);
    sub_237F00850(0, v48, v22, v61, a6, (uint64_t)v65, v60 & 1);
  }
  return swift_release();
}

uint64_t sub_2380BE580(void *a1, uint64_t a2, uint64_t (*a3)(void), uint64_t a4)
{
  uint64_t v8 = sub_2380E4528();
  uint64_t v43 = *(void (***)(char *, uint64_t, uint64_t))(v8 - 8);
  uint64_t v44 = v8;
  MEMORY[0x270FA5388](v8);
  uint64_t v42 = (char *)&v42 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v45 = sub_2380E44F8();
  uint64_t v10 = *(void *)(v45 - 8);
  uint64_t v11 = *(void *)(v10 + 64);
  uint64_t v12 = MEMORY[0x270FA5388](v45);
  MEMORY[0x270FA5388](v12);
  uint64_t v14 = (char *)&v42 - v13;
  id v15 = objc_msgSend(a1, sel_outputDeviceUIDs);
  uint64_t v16 = sub_2380E4B28();

  uint64_t v17 = *(void *)(v16 + 16);
  swift_bridgeObjectRelease();
  if (v17
    || (id v18 = objc_msgSend(a1, sel_hashedOutputDeviceUIDs),
        uint64_t v19 = sub_2380E4B28(),
        v18,
        uint64_t v20 = *(void *)(v19 + 16),
        swift_bridgeObjectRelease(),
        v20))
  {
    uint64_t v43 = (void (**)(char *, uint64_t, uint64_t))a1;
    uint64_t v44 = a2;
    uint64_t v21 = swift_allocObject();
    *(void *)(v21 + 16) = a3;
    *(void *)(v21 + 24) = a4;
    uint64_t v22 = qword_26894A818;
    swift_retain();
    if (v22 != -1) {
      swift_once();
    }
    id v23 = (id)qword_268956368;
    sub_2380E44D8();
    uint64_t v24 = v45;
    (*(void (**)(char *, char *))(v10 + 16))((char *)&v42 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), v14);
    unint64_t v25 = (*(unsigned __int8 *)(v10 + 80) + 33) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
    uint64_t v26 = swift_allocObject();
    *(void *)(v26 + 16) = "mediaPlaybackProviderCurrentDeviceApartWHAGroup";
    *(void *)(v26 + 24) = 47;
    *(unsigned char *)(v26 + 32) = 2;
    (*(void (**)(unint64_t, char *, uint64_t))(v10 + 32))(v26 + v25, (char *)&v42 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), v24);
    id v27 = (uint64_t (**)(unsigned __int8 *))(v26 + ((v11 + v25 + 7) & 0xFFFFFFFFFFFFFFF8));
    *id v27 = sub_237F50E5C;
    v27[1] = (uint64_t (*)(unsigned __int8 *))v21;
    swift_retain();
    sub_2380E4EB8();
    sub_2380E44B8();
    uint64_t v28 = swift_allocObject();
    *(void *)(v28 + 16) = sub_237EE15AC;
    *(void *)(v28 + 24) = v26;
    uint64_t v29 = swift_allocObject();
    *(void *)(v29 + 16) = sub_237EE14B4;
    *(void *)(v29 + 24) = v28;
    uint64_t v30 = (void *)swift_allocObject();
    uint64_t v31 = v43;
    void v30[2] = v43;
    v30[3] = sub_2380BF260;
    v30[4] = v29;
    aBlock[4] = sub_2380BF268;
    aBlock[5] = v30;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_237EFF834;
    aBlock[3] = &block_descriptor_105;
    id v32 = _Block_copy(aBlock);
    swift_retain();
    swift_retain();
    uint64_t v33 = v31;
    swift_release();
    MEMORY[0x23EC86DD0](v44, v32);
    _Block_release(v32);
    swift_release();
    swift_release();
    (*(void (**)(char *, uint64_t))(v10 + 8))(v14, v24);
    return swift_release();
  }
  else
  {
    if (qword_26894AA20 != -1) {
      swift_once();
    }
    uint64_t v35 = v44;
    uint64_t v36 = __swift_project_value_buffer(v44, (uint64_t)qword_268956458);
    unint64_t v38 = v42;
    unint64_t v37 = v43;
    v43[2](v42, v36, v35);
    uint64_t v39 = sub_2380E4508();
    os_log_type_t v40 = sub_2380E4D38();
    if (os_log_type_enabled(v39, v40))
    {
      uint64_t v41 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v41 = 0;
      _os_log_impl(&dword_237EB8000, v39, v40, "MediaPlaybackProvider#currentDeviceApartOfWHAGroup: no hashed routes, skipping", v41, 2u);
      MEMORY[0x23EC87710](v41, -1, -1);
    }

    ((void (*)(char *, uint64_t))v37[1])(v38, v35);
    return a3(0);
  }
}

uint64_t sub_2380BEB28(unsigned char *__src, unsigned char *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
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

uint64_t sub_2380BEBEC(uint64_t a1, uint64_t a2)
{
  if (a1) {
    uint64_t v2 = a2 - a1;
  }
  else {
    uint64_t v2 = 0;
  }
  sub_2380E2B48();
  swift_allocObject();
  uint64_t result = sub_2380E2AF8();
  if (v2 < 0)
  {
    __break(1u);
  }
  else
  {
    sub_2380E2CA8();
    uint64_t result = swift_allocObject();
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = v2;
  }
  return result;
}

uint64_t sub_2380BEC68(uint64_t a1, uint64_t a2)
{
  if (a1) {
    uint64_t v2 = a2 - a1;
  }
  else {
    uint64_t v2 = 0;
  }
  sub_2380E2B48();
  swift_allocObject();
  uint64_t result = sub_2380E2AF8();
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

unsigned char *sub_2380BECEC(unsigned char *result, unsigned char *a2)
{
  if (result)
  {
    uint64_t v2 = a2 - result;
    if (a2 == result)
    {
      return 0;
    }
    else if (v2 <= 14)
    {
      return (unsigned char *)sub_2380BEB28(result, a2);
    }
    else if ((unint64_t)v2 >= 0x7FFFFFFF)
    {
      return (unsigned char *)sub_2380BEBEC((uint64_t)result, (uint64_t)a2);
    }
    else
    {
      return (unsigned char *)sub_2380BEC68((uint64_t)result, (uint64_t)a2);
    }
  }
  return result;
}

uint64_t sub_2380BED50(uint64_t result)
{
  if (result)
  {
    unint64_t v1 = result;
    if (result <= 14)
    {
      if (result < 0) {
        __break(1u);
      }
      else {
        return 0;
      }
    }
    else
    {
      sub_2380E2B48();
      swift_allocObject();
      sub_2380E2B18();
      if (v1 >= 0x7FFFFFFF)
      {
        sub_2380E2CA8();
        uint64_t result = swift_allocObject();
        *(void *)(result + 16) = 0;
        *(void *)(result + 24) = v1;
      }
      else
      {
        return v1 << 32;
      }
    }
  }
  return result;
}

uint64_t _s16SiriAudioSupport11PFSQHandlerC22isPFSQTerminatingError12playbackCodeSbAA08PlaybackI0O_tFZ_0()
{
  if (qword_26894ABE8 != -1) {
    swift_once();
  }
  uint64_t v0 = *((void *)off_26894D468 + 2);
  if (!v0) {
    return 0;
  }
  swift_bridgeObjectRetain_n();
  uint64_t v1 = 0;
  while (1)
  {
    unint64_t v2 = PlaybackCode.rawValue.getter();
    uint64_t v4 = v3;
    if (v2 == PlaybackCode.rawValue.getter() && v4 == v5) {
      break;
    }
    char v7 = sub_2380E5408();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v7) {
      goto LABEL_14;
    }
    if (v0 == ++v1)
    {
      uint64_t v8 = 0;
      goto LABEL_15;
    }
  }
  swift_bridgeObjectRelease_n();
LABEL_14:
  uint64_t v8 = 1;
LABEL_15:
  swift_bridgeObjectRelease_n();
  return v8;
}

uint64_t sub_2380BEF28()
{
  uint64_t v1 = sub_2380E2E28();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = ((*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 16;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_release();
  return MEMORY[0x270FA0238](v0, v6, v5);
}

uint64_t sub_2380BEFD0(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_2380BF018(uint64_t *a1)
{
  return sub_2380B8D70(a1, *(uint64_t (**)(void))(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_2380BF020@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_beginAccess();
  uint64_t v4 = *(void *)(v3 + 104);
  *a2 = *(void *)(v3 + 96);
  a2[1] = v4;
  return swift_bridgeObjectRetain();
}

uint64_t type metadata accessor for MediaPlaybackProvider()
{
  return self;
}

uint64_t dispatch thunk of MediaPlaybackLiteProviding.warm(refId:completion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 8))();
}

uint64_t dispatch thunk of MediaPlaybackLiteProviding.waitForPrepareForSetQueue(completion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 16))();
}

uint64_t dispatch thunk of MediaPlaybackLiteProviding.prepareForSetQueue(refId:ignoreCache:cacheExpirySeconds:completion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return (*(uint64_t (**)(void))(a7 + 24))();
}

uint64_t dispatch thunk of MediaPlaybackLiteProviding.prepareForAudioHandoff(completion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 32))();
}

uint64_t type metadata accessor for PFSQHandler()
{
  return self;
}

uint64_t method lookup function for PFSQHandler(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for PFSQHandler);
}

uint64_t method lookup function for MediaPlaybackLite(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for MediaPlaybackLite);
}

uint64_t dispatch thunk of MediaPlaybackLite.originDeviceId.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 128))();
}

uint64_t dispatch thunk of MediaPlaybackLite.originDeviceId.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 144))();
}

uint64_t dispatch thunk of MediaPlaybackLite.prepareForSetQueue(refId:ignoreCache:cacheExpirySeconds:completion:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 248))();
}

uint64_t dispatch thunk of MediaPlaybackLite.setRepeatMode(refId:repeatMode:completion:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 256))();
}

uint64_t dispatch thunk of MediaPlaybackLite.prepareForAudioHandoff(completion:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 264))();
}

uint64_t sub_2380BF1FC()
{
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t sub_2380BF244(uint64_t a1)
{
  return sub_2380C6E80(a1, (uint64_t (*)(uint64_t, void, void, void, void, void))sub_2380AD00C);
}

void sub_2380BF268(uint64_t a1)
{
  sub_2380B27A8(a1, *(void **)(v1 + 16), *(void (**)(void))(v1 + 24), *(void *)(v1 + 32));
}

uint64_t sub_2380BF274(uint64_t a1, void *a2)
{
  return sub_2380B66A8(a1, a2, *(uint64_t (**)(void, void))(v2 + 16), *(void *)(v2 + 24));
}

uint64_t sub_2380BF27C()
{
  return objectdestroy_116Tm(40);
}

void sub_2380BF284(uint64_t a1)
{
  sub_2380B6D98(a1, v1[2], v1[3], v1[4]);
}

uint64_t sub_2380BF290(uint64_t a1, uint64_t a2)
{
  return sub_2380B70AC(a1, a2, *(uint64_t (**)(void))(v2 + 16), *(void *)(v2 + 24), "MediaPlaybackProvider#decodeHashedRouteUIDs completed with endpoints: %s");
}

uint64_t sub_2380BF2B4()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 57, 7);
}

uint64_t sub_2380BF304(char a1)
{
  return sub_237F00850(a1, *(void **)(v1 + 16), *(void **)(v1 + 24), *(uint64_t (**)(uint64_t, uint64_t))(v1 + 32), *(void *)(v1 + 40), *(void *)(v1 + 48), *(unsigned char *)(v1 + 56));
}

uint64_t sub_2380BF320(uint64_t a1, uint64_t a2)
{
  return sub_2380B70AC(a1, a2, *(uint64_t (**)(void))(v2 + 16), *(void *)(v2 + 24), "MediaPlaybackProvider#discoverRemoteEndpointId completed with endpoints: %s");
}

uint64_t sub_2380BF344()
{
  swift_release();
  swift_release();
  return MEMORY[0x270FA0238](v0, 40, 7);
}

void sub_2380BF384(uint64_t a1, uint8_t *a2, void *a3)
{
  sub_2380B5928(a1, a2, a3, *(void (**)(uint64_t *, uint64_t, void *))(v3 + 16), *(void *)(v3 + 24));
}

uint64_t sub_2380BF390(void *a1, unint64_t a2)
{
  return sub_2380B52B8(a1, a2, *(uint64_t (**)(uint64_t *))(v2 + 16), *(void *)(v2 + 24));
}

uint64_t sub_2380BF398()
{
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 88, 7);
}

uint64_t sub_2380BF3E8()
{
  return objectdestroy_185Tm(MEMORY[0x263F8EEA0]);
}

uint64_t sub_2380BF400(long long *a1)
{
  return sub_2380BB8C0(a1, v1[2], v1[3], v1[4], v1[5], v1[6]);
}

uint64_t sub_2380BF410()
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 72, 7);
}

uint64_t sub_2380BF458(unsigned __int8 *a1)
{
  return sub_2380AC1E8(*a1, *(void *)(v1 + 16), *(void *)(v1 + 24), *(uint64_t (**)(void *))(v1 + 32), *(void *)(v1 + 40), *(void *)(v1 + 48), *(void *)(v1 + 56), *(void *)(v1 + 64));
}

uint64_t sub_2380BF470()
{
  return objectdestroy_116Tm(41);
}

uint64_t sub_2380BF478()
{
  swift_release();
  swift_release();
  return MEMORY[0x270FA0238](v0, 88, 7);
}

void sub_2380BF4B8(uint64_t a1)
{
  unint64_t v2 = *(unsigned int *)(v1 + 68) | ((unint64_t)*(unsigned __int8 *)(v1 + 72) << 32);
  sub_2380B2F54(a1, *(void (**)(void, void, void))(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32), *(void *)(v1 + 40), *(void *)(v1 + 48), *(void *)(v1 + 56), *(_DWORD *)(v1 + 64), v2, SBYTE4(v2));
}

uint64_t sub_2380BF500()
{
  return objectdestroy_200Tm(97);
}

uint64_t sub_2380BF508(void *a1)
{
  return sub_2380B32C8(a1, *(void *)(v1 + 16), *(void **)(v1 + 24), *(void **)(v1 + 32), *(void **)(v1 + 40), *(void *)(v1 + 48), *(void *)(v1 + 56), *(void *)(v1 + 64), *(void (**)(void *, uint64_t, void *))(v1 + 72), *(void *)(v1 + 80), *(_DWORD *)(v1 + 88));
}

uint64_t sub_2380BF55C()
{
  return objectdestroy_200Tm(88);
}

uint64_t objectdestroy_200Tm(uint64_t a1)
{
  uint64_t v3 = *(void **)(v1 + 32);
  if (v3 != (void *)1)
  {
  }
  swift_release();
  swift_release();
  return MEMORY[0x270FA0238](v1, a1, 7);
}

void sub_2380BF5D0(int a1)
{
  sub_2380B33EC(a1, *(void *)(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32), *(void **)(v1 + 40), *(void *)(v1 + 48), *(void *)(v1 + 56), *(void *)(v1 + 64), *(void *)(v1 + 72), *(void *)(v1 + 80));
}

uint64_t sub_2380BF608(uint64_t a1, unint64_t a2)
{
  uint64_t v4 = sub_2380E4528();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  unint64_t v101 = (char *)&v94 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v100 = (char *)&v94 - v9;
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)&v94 - v11;
  uint64_t v13 = MEMORY[0x270FA5388](v10);
  id v15 = (char *)&v94 - v14;
  uint64_t v16 = MEMORY[0x270FA5388](v13);
  char v98 = (char *)&v94 - v17;
  MEMORY[0x270FA5388](v16);
  uint64_t v19 = (char *)&v94 - v18;
  uint64_t v107 = a1;
  uint64_t v108 = a2;
  uint64_t v105 = 47;
  unint64_t v106 = 0xE100000000000000;
  sub_237EC4CB4();
  uint64_t v20 = (void *)sub_2380E4FE8();
  if (qword_26894AA20 != -1) {
    swift_once();
  }
  uint64_t v21 = __swift_project_value_buffer(v4, (uint64_t)qword_268956458);
  uint64_t v22 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
  uint64_t v102 = v21;
  uint64_t v103 = v22;
  unint64_t v104 = (void (*)(char *, uint64_t))(v5 + 16);
  ((void (*)(char *))v22)(v19);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  id v23 = sub_2380E4508();
  os_log_type_t v24 = sub_2380E4D38();
  BOOL v25 = os_log_type_enabled(v23, v24);
  uint64_t v99 = v12;
  if (v25)
  {
    uint64_t v26 = swift_slowAlloc();
    uint64_t v96 = v15;
    uint64_t v27 = v26;
    uint64_t v28 = swift_slowAlloc();
    uint64_t v97 = v4;
    uint64_t v95 = v28;
    uint64_t v107 = v28;
    *(_DWORD *)uint64_t v27 = 136315394;
    swift_bridgeObjectRetain();
    uint64_t v105 = sub_237EBC6BC(a1, a2, &v107);
    sub_2380E4FC8();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v27 + 12) = 2080;
    uint64_t v29 = swift_bridgeObjectRetain();
    uint64_t v30 = MEMORY[0x23EC86140](v29, MEMORY[0x263F8D310]);
    uint64_t v31 = v5;
    unint64_t v33 = v32;
    swift_bridgeObjectRelease();
    uint64_t v105 = sub_237EBC6BC(v30, v33, &v107);
    sub_2380E4FC8();
    swift_bridgeObjectRelease_n();
    uint64_t v5 = v31;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_237EB8000, v23, v24, "MediaPlaybackProvider#spotlightIdentitfierAsCollection library grouping splitting identifier: %s into components: %s", (uint8_t *)v27, 0x16u);
    uint64_t v34 = v95;
    swift_arrayDestroy();
    uint64_t v4 = v97;
    MEMORY[0x23EC87710](v34, -1, -1);
    uint64_t v35 = v27;
    id v15 = v96;
    MEMORY[0x23EC87710](v35, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
  }
  uint64_t v36 = *(uint64_t (**)(char *, uint64_t))(v5 + 8);
  uint64_t result = v36(v19, v4);
  if (v20[2] != 3)
  {
    swift_bridgeObjectRelease();
    uint64_t v48 = v101;
    v103(v101, v102, v4);
    uint64_t v49 = sub_2380E4508();
    os_log_type_t v50 = sub_2380E4D38();
    if (os_log_type_enabled(v49, v50))
    {
      uint64_t v51 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v51 = 0;
      _os_log_impl(&dword_237EB8000, v49, v50, "MediaPlaybackProvider#spotlightIdentitfierAsCollection identifier didn't have 3 components", v51, 2u);
      MEMORY[0x23EC87710](v51, -1, -1);
    }

LABEL_75:
    uint64_t v76 = v48;
    goto LABEL_76;
  }
  uint64_t v38 = v20[6];
  unint64_t v39 = v20[7];
  os_log_type_t v40 = v20;
  unint64_t v41 = HIBYTE(v39) & 0xF;
  uint64_t v42 = v38 & 0xFFFFFFFFFFFFLL;
  if ((v39 & 0x2000000000000000) != 0) {
    uint64_t v43 = HIBYTE(v39) & 0xF;
  }
  else {
    uint64_t v43 = v38 & 0xFFFFFFFFFFFFLL;
  }
  if (!v43)
  {
LABEL_72:
    uint64_t v48 = v100;
    v103(v100, v102, v4);
    swift_bridgeObjectRetain();
    char v87 = sub_2380E4508();
    os_log_type_t v88 = sub_2380E4D38();
    if (os_log_type_enabled(v87, v88))
    {
      uint64_t v89 = swift_slowAlloc();
      unint64_t v104 = (void (*)(char *, uint64_t))v36;
      id v90 = (uint8_t *)v89;
      uint64_t v91 = swift_slowAlloc();
      uint64_t v107 = v91;
      *(_DWORD *)id v90 = 136315138;
      uint64_t v103 = (void (*)(char *, uint64_t, uint64_t))v5;
      uint64_t v92 = v40[6];
      unint64_t v93 = v40[7];
      swift_bridgeObjectRetain();
      uint64_t v105 = sub_237EBC6BC(v92, v93, &v107);
      sub_2380E4FC8();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_237EB8000, v87, v88, "MediaPlaybackProvider#spotlightIdentitfierAsCollection could not parse MPMediaEntityType from component: %s", v90, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x23EC87710](v91, -1, -1);
      MEMORY[0x23EC87710](v90, -1, -1);

      v104(v100, v4);
      return 0;
    }

    swift_bridgeObjectRelease_n();
    goto LABEL_75;
  }
  if ((v39 & 0x1000000000000000) != 0)
  {
    swift_bridgeObjectRetain();
    uint64_t v47 = sub_2380B9464(v38, v39, 10, (uint64_t (*)(void *, uint64_t, uint64_t))sub_2380B97D8);
    char v86 = v85;
    swift_bridgeObjectRelease();
    if ((v86 & 1) == 0)
    {
LABEL_45:
      while (1)
      {
        unint64_t v41 = v40[2];
        if (v41 >= 3) {
          break;
        }
        __break(1u);
LABEL_80:
        uint64_t v47 = 0;
LABEL_44:
        if (v41) {
          goto LABEL_72;
        }
      }
      uint64_t v56 = v40[8];
      unint64_t v57 = v40[9];
      swift_bridgeObjectRetain();
      uint64_t v58 = sub_2380AC4F8(v56, v57);
      if ((v59 & 1) == 0)
      {
        uint64_t v60 = v58;
        swift_bridgeObjectRelease();
        uint64_t v61 = v98;
        v103(v98, v102, v4);
        uint64_t v62 = sub_2380E4508();
        os_log_type_t v63 = sub_2380E4D58();
        if (os_log_type_enabled(v62, v63))
        {
          uint64_t v64 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)uint64_t v64 = 0;
          _os_log_impl(&dword_237EB8000, v62, v63, "Int64: doing the crazy to unwrap Int64 as UInt64...", v64, 2u);
          MEMORY[0x23EC87710](v64, -1, -1);
        }

        v36(v61, v4);
        *(void *)swift_slowAlloc() = v60;
        MEMORY[0x23EC87710]();
        v103(v15, v102, v4);
        uint64_t v65 = sub_2380E4508();
        os_log_type_t v66 = sub_2380E4D38();
        if (os_log_type_enabled(v65, v66))
        {
          uint64_t v67 = swift_slowAlloc();
          *(_DWORD *)uint64_t v67 = 134218240;
          uint64_t v107 = v47;
          sub_2380E4FC8();
          *(_WORD *)(v67 + 12) = 2048;
          uint64_t v107 = v60;
          sub_2380E4FC8();
          _os_log_impl(&dword_237EB8000, v65, v66, "MediaPlaybackProvider#spotlightIdentitfierAsCollection type:%ld, persistentID:%llu", (uint8_t *)v67, 0x16u);
          MEMORY[0x23EC87710](v67, -1, -1);
        }

        v36(v15, v4);
        return v47;
      }
      uint64_t v68 = v99;
      v103(v99, v102, v4);
      swift_bridgeObjectRetain();
      unint64_t v69 = sub_2380E4508();
      os_log_type_t v70 = sub_2380E4D38();
      if (os_log_type_enabled(v69, v70))
      {
        uint64_t v71 = swift_slowAlloc();
        unint64_t v104 = (void (*)(char *, uint64_t))v36;
        char v72 = (uint8_t *)v71;
        uint64_t v73 = swift_slowAlloc();
        uint64_t v107 = v73;
        *(_DWORD *)char v72 = 136315138;
        uint64_t v103 = (void (*)(char *, uint64_t, uint64_t))v5;
        uint64_t v74 = v40[8];
        unint64_t v75 = v40[9];
        swift_bridgeObjectRetain();
        uint64_t v105 = sub_237EBC6BC(v74, v75, &v107);
        sub_2380E4FC8();
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_237EB8000, v69, v70, "MediaPlaybackProvider#spotlightIdentitfierAsCollection could not parse persistentID from component: %s", v72, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x23EC87710](v73, -1, -1);
        MEMORY[0x23EC87710](v72, -1, -1);

        v104(v99, v4);
        return 0;
      }

      swift_bridgeObjectRelease_n();
      uint64_t v76 = v68;
LABEL_76:
      v36(v76, v4);
      return 0;
    }
    goto LABEL_72;
  }
  if ((v39 & 0x2000000000000000) == 0)
  {
    if ((v38 & 0x1000000000000000) != 0) {
      uint64_t v44 = (unsigned __int8 *)((v39 & 0xFFFFFFFFFFFFFFFLL) + 32);
    }
    else {
      uint64_t v44 = (unsigned __int8 *)sub_2380E51B8();
    }
    uint64_t v45 = sub_2380B97D8(v44, v42, 10);
    if ((v46 & 1) == 0)
    {
      uint64_t v47 = (uint64_t)v45;
      goto LABEL_45;
    }
    goto LABEL_72;
  }
  uint64_t v107 = v20[6];
  uint64_t v108 = v39 & 0xFFFFFFFFFFFFFFLL;
  if (v38 == 43)
  {
    if (v41)
    {
      if (v41 == 1) {
        goto LABEL_80;
      }
      if ((BYTE1(v38) - 48) > 9u) {
        goto LABEL_41;
      }
      uint64_t v47 = (BYTE1(v38) - 48);
      if (v41 != 2)
      {
        if ((BYTE2(v38) - 48) > 9u) {
          goto LABEL_41;
        }
        uint64_t v47 = 10 * (BYTE1(v38) - 48) + (BYTE2(v38) - 48);
        unint64_t v52 = v41 - 3;
        if (v41 != 3)
        {
          id v53 = (unsigned __int8 *)&v107 + 3;
          while (1)
          {
            unsigned int v54 = *v53 - 48;
            if (v54 > 9) {
              goto LABEL_41;
            }
            uint64_t v55 = 10 * v47;
            if ((unsigned __int128)(v47 * (__int128)10) >> 64 != (10 * v47) >> 63) {
              goto LABEL_41;
            }
            uint64_t v47 = v55 + v54;
            if (__OFADD__(v55, v54)) {
              goto LABEL_41;
            }
            LOBYTE(v41) = 0;
            ++v53;
            if (!--v52) {
              goto LABEL_44;
            }
          }
        }
      }
      goto LABEL_43;
    }
  }
  else
  {
    if (v38 != 45)
    {
      if (!v41 || (v38 - 48) > 9u) {
        goto LABEL_41;
      }
      uint64_t v47 = (v38 - 48);
      if (v41 != 1)
      {
        if ((BYTE1(v38) - 48) > 9u) {
          goto LABEL_41;
        }
        uint64_t v47 = 10 * (v38 - 48) + (BYTE1(v38) - 48);
        unint64_t v77 = v41 - 2;
        if (v41 != 2)
        {
          long long v78 = (unsigned __int8 *)&v107 + 2;
          while (1)
          {
            unsigned int v79 = *v78 - 48;
            if (v79 > 9) {
              goto LABEL_41;
            }
            uint64_t v80 = 10 * v47;
            if ((unsigned __int128)(v47 * (__int128)10) >> 64 != (10 * v47) >> 63) {
              goto LABEL_41;
            }
            uint64_t v47 = v80 + v79;
            if (__OFADD__(v80, v79)) {
              goto LABEL_41;
            }
            LOBYTE(v41) = 0;
            ++v78;
            if (!--v77) {
              goto LABEL_44;
            }
          }
        }
      }
LABEL_43:
      LOBYTE(v41) = 0;
      goto LABEL_44;
    }
    if (v41)
    {
      if (v41 == 1) {
        goto LABEL_80;
      }
      if ((BYTE1(v38) - 48) > 9u) {
        goto LABEL_41;
      }
      if (v41 == 2)
      {
        LOBYTE(v41) = 0;
        uint64_t v47 = -(uint64_t)(BYTE1(v38) - 48);
        goto LABEL_44;
      }
      if ((BYTE2(v38) - 48) > 9u) {
        goto LABEL_41;
      }
      uint64_t v47 = -10 * (BYTE1(v38) - 48) - (BYTE2(v38) - 48);
      unint64_t v81 = v41 - 3;
      if (v41 != 3)
      {
        uint64_t v82 = (unsigned __int8 *)&v107 + 3;
        while (1)
        {
          unsigned int v83 = *v82 - 48;
          if (v83 > 9) {
            break;
          }
          uint64_t v84 = 10 * v47;
          if ((unsigned __int128)(v47 * (__int128)10) >> 64 != (10 * v47) >> 63) {
            break;
          }
          uint64_t v47 = v84 - v83;
          if (__OFSUB__(v84, v83)) {
            break;
          }
          LOBYTE(v41) = 0;
          ++v82;
          if (!--v81) {
            goto LABEL_44;
          }
        }
LABEL_41:
        uint64_t v47 = 0;
        LOBYTE(v41) = 1;
        goto LABEL_44;
      }
      goto LABEL_43;
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_2380C0278(void *a1, void *a2)
{
  uint64_t v4 = sub_2380E4528();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  uint64_t v8 = &v32[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v6);
  uint64_t v10 = &v32[-v9];
  if (a1[2] != 1) {
    goto LABEL_10;
  }
  uint64_t v11 = a1[4];
  unint64_t v12 = a1[5];
  swift_bridgeObjectRetain();
  uint64_t v13 = sub_2380BF608(v11, v12);
  uint64_t v15 = v14;
  char v17 = v16;
  swift_bridgeObjectRelease();
  if (v17) {
    goto LABEL_10;
  }
  if (v13 == 1
    && (id v18 = objc_msgSend(a2, sel_collectionWithPersistentID_groupingType_, v15, 6)) != 0)
  {
    uint64_t v19 = v18;
    id v20 = objc_msgSend(v18, sel_items);

    sub_237EC83D4(0, &qword_26894BD28);
    uint64_t v21 = sub_2380E4B28();

    if (qword_26894AA20 != -1) {
      swift_once();
    }
    uint64_t v22 = __swift_project_value_buffer(v4, (uint64_t)qword_268956458);
    (*(void (**)(unsigned char *, uint64_t, uint64_t))(v5 + 16))(v10, v22, v4);
    id v23 = sub_2380E4508();
    os_log_type_t v24 = sub_2380E4D38();
    if (os_log_type_enabled(v23, v24))
    {
      BOOL v25 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)BOOL v25 = 0;
      _os_log_impl(&dword_237EB8000, v23, v24, "MediaPlaybackProvider#itemsFromSpotlight returing collection items", v25, 2u);
      MEMORY[0x23EC87710](v25, -1, -1);
    }

    (*(void (**)(unsigned char *, uint64_t))(v5 + 8))(v10, v4);
  }
  else
  {
LABEL_10:
    if (qword_26894AA20 != -1) {
      swift_once();
    }
    uint64_t v26 = __swift_project_value_buffer(v4, (uint64_t)qword_268956458);
    (*(void (**)(unsigned char *, uint64_t, uint64_t))(v5 + 16))(v8, v26, v4);
    uint64_t v27 = sub_2380E4508();
    os_log_type_t v28 = sub_2380E4D38();
    if (os_log_type_enabled(v27, v28))
    {
      uint64_t v29 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v29 = 0;
      _os_log_impl(&dword_237EB8000, v27, v28, "MediaPlaybackProvider#itemsFromSpotlight converting identifiers into entity items", v29, 2u);
      MEMORY[0x23EC87710](v29, -1, -1);
    }

    (*(void (**)(unsigned char *, uint64_t))(v5 + 8))(v8, v4);
    id v30 = a2;
    uint64_t v21 = sub_237F11678((uint64_t)a1, v30);
  }
  return v21;
}

uint64_t sub_2380C0604(unint64_t a1)
{
  if (a1)
  {
    unint64_t v1 = a1;
    id v2 = objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithUnsignedInt_, 401);
    LOBYTE(v1) = sub_237EE56E8((uint64_t)v2, v1);

    if (v1) {
      goto LABEL_4;
    }
  }
  sub_2380E53B8();
  sub_237EC4CB4();
  char v3 = sub_2380E5038();
  swift_bridgeObjectRelease();
  if (v3)
  {
LABEL_4:
    char v4 = 1;
  }
  else
  {
    sub_2380E53B8();
    char v4 = sub_2380E5038();
    swift_bridgeObjectRelease();
  }
  return v4 & 1;
}

uint64_t sub_2380C0744()
{
  sub_2380E53B8();
  sub_237EC4CB4();
  char v0 = sub_2380E5038();
  swift_bridgeObjectRelease();
  if (v0)
  {
    char v1 = 1;
  }
  else
  {
    sub_2380E53B8();
    char v1 = sub_2380E5038();
    swift_bridgeObjectRelease();
  }
  return v1 & 1;
}

uint64_t sub_2380C0848(void *a1, unint64_t a2)
{
  if (!a1) {
    return 0;
  }
  id v3 = a1;
  id v4 = objc_msgSend(v3, sel_domain);
  uint64_t v5 = sub_2380E4938();
  uint64_t v7 = v6;

  if (v5 == sub_2380E4938() && v7 == v8)
  {
    swift_bridgeObjectRelease_n();
  }
  else
  {
    char v10 = sub_2380E5408();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v10 & 1) == 0) {
      goto LABEL_23;
    }
  }
  if (objc_msgSend(v3, sel_code) != (id)9)
  {
LABEL_23:

    return 0;
  }
  if (!a2)
  {
    uint64_t v11 = 0;
    goto LABEL_19;
  }
  if (a2 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t result = sub_2380E52D8();
    uint64_t v11 = (void *)result;
    if (!result) {
      goto LABEL_17;
    }
  }
  else
  {
    uint64_t v11 = *(void **)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
    if (!v11)
    {
LABEL_17:
      swift_bridgeObjectRelease();
LABEL_19:
      sub_237EC83D4(0, (unint64_t *)&qword_26894C6D0);
      uint64_t v14 = (void *)sub_2380E4F68();
      uint64_t v15 = v14;
      if (v11)
      {
        id v16 = v11;
        char v17 = sub_2380E4F88();

        return (v17 & 1) != 0;
      }

      goto LABEL_23;
    }
  }
  if ((a2 & 0xC000000000000001) != 0)
  {
    id v13 = (id)MEMORY[0x23EC867A0](0, a2);
    goto LABEL_16;
  }
  if (*(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    id v13 = *(id *)(a2 + 32);
LABEL_16:
    uint64_t v11 = v13;
    goto LABEL_17;
  }
  __break(1u);
  return result;
}

void sub_2380C0A10()
{
  uint64_t v0 = sub_2380E4528();
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = MEMORY[0x270FA5388](v0);
  id v4 = (char *)v26 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v2);
  uint64_t v6 = (char *)v26 - v5;
  id v7 = objc_allocWithZone(MEMORY[0x263EFFA40]);
  uint64_t v8 = (void *)sub_2380E4918();
  id v9 = objc_msgSend(v7, sel_initWithSuiteName_, v8);

  if (v9)
  {
    char v10 = (void *)sub_2380E4918();
    id v11 = objc_msgSend(v9, sel_objectForKey_, v10);

    if (v11)
    {
      sub_2380E5068();
      swift_unknownObjectRelease();
    }
    else
    {
      memset(v27, 0, sizeof(v27));
    }
    sub_237ED9A14((uint64_t)v27, (uint64_t)v28, (uint64_t *)&unk_26894D750);
    if (v28[3])
    {
      if ((swift_dynamicCast() & 1) == 0)
      {
LABEL_18:

        return;
      }
      uint64_t v12 = v26[1];
      uint64_t v13 = mach_absolute_time();
      BOOL v14 = v13 >= v12;
      unint64_t v15 = v13 - v12;
      if (v14)
      {
        if (qword_26894AAC8 == -1)
        {
LABEL_10:
          double v16 = *(double *)&qword_2689564F0;
          if (qword_26894AA20 != -1)
          {
            v26[0] = qword_2689564F0;
            swift_once();
            double v16 = *(double *)v26;
          }
          double v17 = v16 * (double)v15;
          uint64_t v18 = __swift_project_value_buffer(v0, (uint64_t)qword_268956458);
          v26[0] = *(void *)(v1 + 16);
          ((void (*)(char *, uint64_t, uint64_t))v26[0])(v6, v18, v0);
          uint64_t v19 = sub_2380E4508();
          os_log_type_t v20 = sub_2380E4D58();
          if (os_log_type_enabled(v19, v20))
          {
            uint64_t v21 = (uint8_t *)swift_slowAlloc();
            *(_DWORD *)uint64_t v21 = 134217984;
            *(double *)os_log_type_t v28 = v17;
            sub_2380E4FC8();
            _os_log_impl(&dword_237EB8000, v19, v20, "MediaPlaybackProvider#checkTTSEndToSendPlayDelay read EndTTSTime with timeDiff: %f", v21, 0xCu);
            MEMORY[0x23EC87710](v21, -1, -1);
          }

          uint64_t v22 = *(void (**)(char *, uint64_t))(v1 + 8);
          v22(v6, v0);
          if (v17 > 1.0)
          {
            ((void (*)(char *, uint64_t, uint64_t))v26[0])(v4, v18, v0);
            id v23 = sub_2380E4508();
            os_log_type_t v24 = sub_2380E4D48();
            if (os_log_type_enabled(v23, v24))
            {
              BOOL v25 = (uint8_t *)swift_slowAlloc();
              *(_WORD *)BOOL v25 = 0;
              _os_log_impl(&dword_237EB8000, v23, v24, "MediaPlaybackProvider#checkTTSEndToSendPlayDelay large delay detected", v25, 2u);
              MEMORY[0x23EC87710](v25, -1, -1);
            }

            v22(v4, v0);
            sub_2380E3F88();
            swift_allocObject();
            sub_2380E3F78();
            sub_2380E3F68();
            swift_release();
          }
          goto LABEL_18;
        }
      }
      else
      {
        __break(1u);
      }
      swift_once();
      goto LABEL_10;
    }

    sub_237F098FC((uint64_t)v28, (uint64_t *)&unk_26894D750);
  }
}

uint64_t sub_2380C0ED0()
{
  uint64_t v0 = sub_2380E2E28();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)&v10 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2380E2DF8();
  id v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08790]), sel_init);
  uint64_t v5 = (void *)sub_2380E4918();
  objc_msgSend(v4, sel_setDateFormat_, v5);

  uint64_t v6 = (void *)sub_2380E2D98();
  id v7 = objc_msgSend(v4, sel_stringFromDate_, v6);

  uint64_t v8 = sub_2380E4938();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  return v8;
}

uint64_t sub_2380C1040(uint64_t *a1)
{
  os_log_type_t v70 = a1;
  uint64_t v1 = sub_2380E4528();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = MEMORY[0x270FA5388](v1);
  uint64_t v5 = (char *)&v62 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = MEMORY[0x270FA5388](v3);
  uint64_t v8 = (char *)&v62 - v7;
  uint64_t v9 = MEMORY[0x270FA5388](v6);
  id v11 = (char *)&v62 - v10;
  MEMORY[0x270FA5388](v9);
  unint64_t v69 = (char *)&v62 - v12;
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26894D4F8);
  MEMORY[0x270FA5388](v13 - 8);
  unint64_t v15 = (char *)&v62 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_2380E4328();
  uint64_t v17 = *(void *)(v16 - 8);
  uint64_t v18 = MEMORY[0x270FA5388](v16);
  os_log_type_t v20 = (char *)&v62 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v18);
  uint64_t v71 = (char *)&v62 - v21;
  type metadata accessor for ErrorFilingProvider();
  uint64_t v22 = static ErrorFilingProvider.getTrialPolicy()();
  if (v23 >> 60 == 15)
  {
    if (qword_26894AA20 != -1) {
      swift_once();
    }
    uint64_t v24 = __swift_project_value_buffer(v1, (uint64_t)qword_268956458);
    (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v5, v24, v1);
    BOOL v25 = sub_2380E4508();
    os_log_type_t v26 = sub_2380E4D38();
    if (os_log_type_enabled(v25, v26))
    {
      uint64_t v27 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v27 = 0;
      _os_log_impl(&dword_237EB8000, v25, v26, "MediaPlaybackProvider#doesCurrentDevicePolicyAllowTimeoutErrorsForTailspin no Trial policy, returning false", v27, 2u);
      MEMORY[0x23EC87710](v27, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v2 + 8))(v5, v1);
    return 0;
  }
  uint64_t v66 = v2;
  uint64_t v28 = v1;
  uint64_t v29 = v16;
  uint64_t v30 = v22;
  unint64_t v31 = v23;
  sub_2380E4308();
  uint64_t v67 = v30;
  unint64_t v68 = v31;
  uint64_t v32 = v29;
  sub_2380E42F8();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v17 + 48))(v15, 1, v29) == 1)
  {
    sub_237F098FC((uint64_t)v15, &qword_26894D4F8);
    if (qword_26894AA20 != -1) {
      swift_once();
    }
    uint64_t v33 = __swift_project_value_buffer(v28, (uint64_t)qword_268956458);
    uint64_t v34 = v66;
    (*(void (**)(char *, uint64_t, uint64_t))(v66 + 16))(v8, v33, v28);
    uint64_t v35 = sub_2380E4508();
    os_log_type_t v36 = sub_2380E4D38();
    if (os_log_type_enabled(v35, v36))
    {
      unint64_t v37 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v37 = 0;
      _os_log_impl(&dword_237EB8000, v35, v36, "MediaPlaybackProvider#doesCurrentDevicePolicyAllowTimeoutErrorsForTailspin no parseable policy, returning false", v37, 2u);
      MEMORY[0x23EC87710](v37, -1, -1);
    }
    sub_237F99F84(v67, v68);

    (*(void (**)(char *, uint64_t))(v34 + 8))(v8, v28);
    return 0;
  }
  (*(void (**)(char *, char *, uint64_t))(v17 + 32))(v71, v15, v29);
  uint64_t v38 = *(void *)(sub_2380E4318() + 16);
  swift_bridgeObjectRelease();
  if (!v38)
  {
    if (qword_26894AA20 != -1) {
      swift_once();
    }
    uint64_t v54 = __swift_project_value_buffer(v28, (uint64_t)qword_268956458);
    uint64_t v55 = v66;
    (*(void (**)(char *, uint64_t, uint64_t))(v66 + 16))(v11, v54, v28);
    uint64_t v56 = sub_2380E4508();
    os_log_type_t v57 = sub_2380E4D38();
    if (os_log_type_enabled(v56, v57))
    {
      uint64_t v58 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v58 = 0;
      _os_log_impl(&dword_237EB8000, v56, v57, "MediaPlaybackProvider#doesCurrentDevicePolicyAllowTimeoutErrorsForTailspin tailspin list is empty", v58, 2u);
      MEMORY[0x23EC87710](v58, -1, -1);
    }
    sub_237F99F84(v67, v68);

    (*(void (**)(char *, uint64_t))(v55 + 8))(v11, v28);
    (*(void (**)(char *, uint64_t))(v17 + 8))(v71, v29);
    return 0;
  }
  swift_bridgeObjectRelease();
  uint64_t v39 = v28;
  if (qword_26894AA20 != -1) {
    swift_once();
  }
  uint64_t v40 = __swift_project_value_buffer(v28, (uint64_t)qword_268956458);
  uint64_t v41 = v66;
  uint64_t v42 = v69;
  (*(void (**)(char *, uint64_t, uint64_t))(v66 + 16))(v69, v40, v39);
  (*(void (**)(char *, char *, uint64_t))(v17 + 16))(v20, v71, v32);
  uint64_t v43 = sub_2380E4508();
  os_log_type_t v44 = sub_2380E4D38();
  if (os_log_type_enabled(v43, v44))
  {
    os_log_t v65 = v43;
    uint64_t v45 = (uint8_t *)swift_slowAlloc();
    uint64_t v64 = swift_slowAlloc();
    uint64_t v73 = v64;
    *(_DWORD *)uint64_t v45 = 136315138;
    uint64_t v62 = v45 + 4;
    os_log_type_t v63 = v45;
    sub_2380E4318();
    uint64_t v46 = MEMORY[0x23EC86140]();
    unint64_t v48 = v47;
    swift_bridgeObjectRelease();
    uint64_t v72 = sub_237EBC6BC(v46, v48, &v73);
    sub_2380E4FC8();
    swift_bridgeObjectRelease();
    uint64_t v49 = *(void (**)(char *, uint64_t))(v17 + 8);
    v49(v20, v32);
    os_log_t v50 = v65;
    os_log_type_t v51 = v44;
    unint64_t v52 = v63;
    _os_log_impl(&dword_237EB8000, v65, v51, "MediaPlaybackProvider#doesCurrentDevicePolicyAllowTimeoutErrorsForTailspin tailspins supported: %s", v63, 0xCu);
    uint64_t v53 = v64;
    swift_arrayDestroy();
    MEMORY[0x23EC87710](v53, -1, -1);
    MEMORY[0x23EC87710](v52, -1, -1);

    (*(void (**)(char *, uint64_t))(v41 + 8))(v69, v39);
  }
  else
  {
    uint64_t v49 = *(void (**)(char *, uint64_t))(v17 + 8);
    v49(v20, v32);

    (*(void (**)(char *, uint64_t))(v41 + 8))(v42, v39);
  }
  uint64_t v60 = v71;
  uint64_t v61 = sub_2380E4318();
  sub_237F99F84(v67, v68);
  v49(v60, v32);
  *os_log_type_t v70 = v61;
  return 1;
}

uint64_t sub_2380C185C(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v5 = sub_2380E4528();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)&v38 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  id v11 = (char *)&v38 - v10;
  swift_bridgeObjectRetain();
  uint64_t v12 = swift_bridgeObjectRetain();
  uint64_t v13 = sub_2380BBEA8(v12);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v14 = *(void *)(v13 + 16);
  swift_bridgeObjectRelease();
  if (v14)
  {
    byte_26894D448 = 1;
    if (qword_26894AA20 != -1) {
      swift_once();
    }
    uint64_t v15 = __swift_project_value_buffer(v5, (uint64_t)qword_268956458);
    (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v11, v15, v5);
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    uint64_t v16 = sub_2380E4508();
    os_log_type_t v17 = sub_2380E4D38();
    if (os_log_type_enabled(v16, v17))
    {
      uint64_t v18 = swift_slowAlloc();
      uint64_t v19 = swift_slowAlloc();
      uint64_t v40 = v6;
      uint64_t v20 = v19;
      v42[0] = v19;
      *(_DWORD *)uint64_t v18 = 136315394;
      uint64_t v38 = a2;
      uint64_t v21 = swift_bridgeObjectRetain();
      uint64_t v22 = MEMORY[0x23EC86140](v21, MEMORY[0x263F8D310]);
      uint64_t v39 = v5;
      uint64_t v23 = v22;
      unint64_t v25 = v24;
      swift_bridgeObjectRelease();
      uint64_t v41 = sub_237EBC6BC(v23, v25, v42);
      sub_2380E4FC8();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v18 + 12) = 2080;
      swift_bridgeObjectRetain();
      uint64_t v41 = sub_237EBC6BC(v38, a3, v42);
      sub_2380E4FC8();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_237EB8000, v16, v17, "MediaPlaybackProvider#generateTailSpinIfPolicyAndErrorAllow collecting tailspin for list: %s and errorDescription: %s", (uint8_t *)v18, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x23EC87710](v20, -1, -1);
      MEMORY[0x23EC87710](v18, -1, -1);

      (*(void (**)(char *, uint64_t))(v40 + 8))(v11, v39);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      (*(void (**)(char *, uint64_t))(v6 + 8))(v11, v5);
    }
    return sub_2380E3F28();
  }
  else
  {
    if (qword_26894AA20 != -1) {
      swift_once();
    }
    uint64_t v26 = __swift_project_value_buffer(v5, (uint64_t)qword_268956458);
    (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v9, v26, v5);
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    uint64_t v27 = sub_2380E4508();
    os_log_type_t v28 = sub_2380E4D38();
    if (os_log_type_enabled(v27, v28))
    {
      uint64_t v29 = swift_slowAlloc();
      uint64_t v30 = swift_slowAlloc();
      uint64_t v40 = v6;
      uint64_t v31 = v30;
      v42[0] = v30;
      *(_DWORD *)uint64_t v29 = 136315394;
      uint64_t v32 = swift_bridgeObjectRetain();
      uint64_t v33 = MEMORY[0x23EC86140](v32, MEMORY[0x263F8D310]);
      uint64_t v38 = a2;
      uint64_t v39 = v5;
      uint64_t v34 = v33;
      unint64_t v36 = v35;
      swift_bridgeObjectRelease();
      uint64_t v41 = sub_237EBC6BC(v34, v36, v42);
      sub_2380E4FC8();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v29 + 12) = 2080;
      swift_bridgeObjectRetain();
      uint64_t v41 = sub_237EBC6BC(v38, a3, v42);
      sub_2380E4FC8();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_237EB8000, v27, v28, "MediaPlaybackProvider#generateTailSpinIfPolicyAndErrorAllow no op, with tailspinList: %s and errorDescription: '%s'", (uint8_t *)v29, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x23EC87710](v31, -1, -1);
      MEMORY[0x23EC87710](v29, -1, -1);

      uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v40 + 8))(v9, v39);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v9, v5);
    }
    byte_26894D448 = 0;
  }
  return result;
}

uint64_t sub_2380C1E64(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (*(void *)(sub_2380E4418() + 16) && (sub_237EC9470(a3, a4), (v6 & 1) != 0))
  {
    swift_bridgeObjectRelease();
    sub_2380E53B8();
    sub_237EC4CB4();
    char v7 = sub_2380E5038();
    swift_bridgeObjectRelease();
    sub_2380E53B8();
    char v8 = sub_2380E5038();
    swift_bridgeObjectRelease();
    char v9 = v7 & v8;
  }
  else
  {
    swift_bridgeObjectRelease();
    char v9 = 0;
  }
  return v9 & 1;
}

uint64_t sub_2380C1FB4()
{
  sub_237EC4CB4();
  if (sub_2380E5038() & 1) != 0 || (sub_2380E5038()) {
    char v0 = 1;
  }
  else {
    char v0 = sub_2380E5038();
  }
  return v0 & 1;
}

uint64_t sub_2380C20C4(uint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t v3 = HIBYTE(a2) & 0xF;
  if ((a2 & 0x2000000000000000) == 0) {
    uint64_t v3 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (!v3) {
    return 0;
  }
  if (a1 == 0xD000000000000026 && a2 == 0x80000002380FB130) {
    return 0;
  }
  char v8 = sub_2380E5408();
  uint64_t result = 0;
  if ((v8 & 1) == 0)
  {
    if (!*(void *)(sub_2380E4428() + 16))
    {
      swift_bridgeObjectRelease();
      return 0;
    }
    sub_237EC9470(a1, a2);
    char v10 = v9;
    swift_bridgeObjectRelease();
    uint64_t result = 0;
    if (v10)
    {
      if (a3)
      {

        return 1;
      }
    }
  }
  return result;
}

uint64_t sub_2380C21C4(uint64_t a1)
{
  v92[3] = *(id *)MEMORY[0x263EF8340];
  uint64_t v2 = sub_2380E4528();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  char v6 = (char *)v70 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = MEMORY[0x270FA5388](v4);
  char v9 = (char *)v70 - v8;
  MEMORY[0x270FA5388](v7);
  unint64_t v75 = (char *)v70 - v10;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26894BB58);
  MEMORY[0x270FA5388](v11 - 8);
  uint64_t v13 = (char *)v70 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_2380E2C68();
  MEMORY[0x270FA5388](v14);
  char v86 = (char *)v70 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = *(void *)(a1 + 64);
  uint64_t v83 = a1 + 64;
  uint64_t v18 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v91 = MEMORY[0x263F8EE78];
  if (v18 < 64) {
    uint64_t v19 = ~(-1 << v18);
  }
  else {
    uint64_t v19 = -1;
  }
  unint64_t v20 = v19 & v17;
  int64_t v84 = (unint64_t)(v18 + 63) >> 6;
  char v87 = (unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48);
  unint64_t v81 = (void (**)(char *, uint64_t, uint64_t))(v3 + 16);
  uint64_t v82 = (void (**)(char *, uint64_t))(v3 + 8);
  uint64_t v76 = (void (**)(char *, uint64_t))(v15 + 8);
  unint64_t v77 = (void (**)(char *, char *, uint64_t))(v15 + 32);
  swift_bridgeObjectRetain();
  int64_t v21 = 0;
  uint64_t v85 = 0;
  *(void *)&long long v22 = 136315138;
  long long v71 = v22;
  v70[1] = MEMORY[0x263F8EE58] + 8;
  *(void *)&long long v22 = 136315650;
  long long v72 = v22;
  uint64_t v74 = v9;
  uint64_t v79 = a1;
  uint64_t v80 = v14;
  uint64_t v73 = v6;
  long long v78 = v13;
  while (v20)
  {
    uint64_t v89 = (v20 - 1) & v20;
    unint64_t v23 = __clz(__rbit64(v20)) | (v21 << 6);
LABEL_19:
    uint64_t v27 = 16 * v23;
    os_log_type_t v28 = (uint64_t *)(*(void *)(a1 + 48) + v27);
    uint64_t v29 = *v28;
    unint64_t v30 = v28[1];
    uint64_t v31 = (uint64_t *)(*(void *)(a1 + 56) + v27);
    unint64_t v32 = v31[1];
    uint64_t v88 = *v31;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_2380E2C58();
    if ((*v87)(v13, 1, v14) == 1)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_237F098FC((uint64_t)v13, &qword_26894BB58);
      unint64_t v20 = v89;
    }
    else
    {
      (*v77)(v86, v13, v14);
      id v33 = objc_msgSend(self, sel_defaultManager);
      uint64_t v34 = (void *)sub_2380E2C08();
      v92[0] = 0;
      id v35 = objc_msgSend(v33, sel_contentsOfDirectoryAtURL_includingPropertiesForKeys_options_error_, v34, 0, 0, v92);

      id v36 = v92[0];
      if (v35)
      {
        uint64_t v37 = sub_2380E4B28();
        id v38 = v36;

        swift_bridgeObjectRetain();
        uint64_t v39 = v85;
        uint64_t v40 = sub_2380BC03C(v37, v88, v32);
        uint64_t v85 = v39;
        swift_bridgeObjectRelease();
        if (qword_26894AA20 != -1) {
          swift_once();
        }
        uint64_t v41 = __swift_project_value_buffer(v2, (uint64_t)qword_268956458);
        uint64_t v42 = v75;
        (*v81)(v75, v41, v2);
        swift_bridgeObjectRetain_n();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        uint64_t v43 = sub_2380E4508();
        os_log_type_t v44 = sub_2380E4D38();
        if (os_log_type_enabled(v43, v44))
        {
          uint64_t v45 = swift_slowAlloc();
          uint64_t v46 = v2;
          unint64_t v47 = (void *)swift_slowAlloc();
          v92[0] = v47;
          *(_DWORD *)uint64_t v45 = v72;
          swift_bridgeObjectRetain();
          *(void *)(v45 + 4) = sub_237EBC6BC(v29, v30, (uint64_t *)v92);
          swift_bridgeObjectRelease_n();
          *(_WORD *)(v45 + 12) = 2080;
          swift_bridgeObjectRetain();
          *(void *)(v45 + 14) = sub_237EBC6BC(v88, v32, (uint64_t *)v92);
          swift_bridgeObjectRelease_n();
          *(_WORD *)(v45 + 22) = 2048;
          uint64_t v48 = *(void *)(v40 + 16);
          swift_bridgeObjectRelease();
          *(void *)(v45 + 24) = v48;
          swift_bridgeObjectRelease();
          _os_log_impl(&dword_237EB8000, v43, v44, "MediaPlaybackProvider#collectAnyExtraFiles looking in %s, for %s extensions, found %ld", (uint8_t *)v45, 0x20u);
          swift_arrayDestroy();
          uint64_t v49 = v47;
          uint64_t v2 = v46;
          MEMORY[0x23EC87710](v49, -1, -1);
          uint64_t v50 = v45;
          char v9 = v74;
          MEMORY[0x23EC87710](v50, -1, -1);

          (*v82)(v75, v46);
        }
        else
        {

          swift_bridgeObjectRelease_n();
          swift_bridgeObjectRelease_n();
          swift_bridgeObjectRelease_n();
          (*v82)(v42, v2);
        }
        uint64_t v14 = v80;
        uint64_t v13 = v78;
        unint64_t v20 = v89;
        sub_237F69428(v40);
        (*v76)(v86, v14);
        a1 = v79;
      }
      else
      {
        id v51 = v92[0];
        swift_bridgeObjectRelease();
        unint64_t v52 = (void *)sub_2380E2BA8();

        swift_willThrow();
        if (qword_26894AA20 != -1) {
          swift_once();
        }
        uint64_t v53 = __swift_project_value_buffer(v2, (uint64_t)qword_268956458);
        uint64_t v54 = v73;
        (*v81)(v73, v53, v2);
        swift_bridgeObjectRetain();
        uint64_t v55 = sub_2380E4508();
        os_log_type_t v56 = sub_2380E4D48();
        if (os_log_type_enabled(v55, v56))
        {
          uint64_t v57 = swift_slowAlloc();
          uint64_t v58 = (void *)swift_slowAlloc();
          v92[0] = v58;
          *(_DWORD *)uint64_t v57 = v71;
          swift_bridgeObjectRetain();
          *(void *)(v57 + 4) = sub_237EBC6BC(v29, v30, (uint64_t *)v92);
          swift_bridgeObjectRelease_n();
          _os_log_impl(&dword_237EB8000, v55, v56, "MediaPlaybackProvider#collectAnyExtraFiles error fetching attachment(s) for directory: %s", (uint8_t *)v57, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x23EC87710](v58, -1, -1);
          uint64_t v59 = v57;
          uint64_t v54 = v73;
          MEMORY[0x23EC87710](v59, -1, -1);
        }
        else
        {

          swift_bridgeObjectRelease_n();
        }

        (*v82)(v54, v2);
        uint64_t v14 = v80;
        (*v76)(v86, v80);
        uint64_t v85 = 0;
        char v9 = v74;
        uint64_t v13 = v78;
        a1 = v79;
        unint64_t v20 = v89;
      }
    }
  }
  if (__OFADD__(v21++, 1))
  {
    __break(1u);
LABEL_43:
    __break(1u);
    goto LABEL_44;
  }
  if (v21 >= v84) {
    goto LABEL_37;
  }
  unint64_t v25 = *(void *)(v83 + 8 * v21);
  if (v25)
  {
LABEL_18:
    uint64_t v89 = (v25 - 1) & v25;
    unint64_t v23 = __clz(__rbit64(v25)) + (v21 << 6);
    goto LABEL_19;
  }
  int64_t v26 = v21 + 1;
  if (v21 + 1 >= v84) {
    goto LABEL_37;
  }
  unint64_t v25 = *(void *)(v83 + 8 * v26);
  if (v25) {
    goto LABEL_17;
  }
  int64_t v26 = v21 + 2;
  if (v21 + 2 >= v84) {
    goto LABEL_37;
  }
  unint64_t v25 = *(void *)(v83 + 8 * v26);
  if (v25)
  {
LABEL_17:
    int64_t v21 = v26;
    goto LABEL_18;
  }
  int64_t v26 = v21 + 3;
  if (v21 + 3 < v84)
  {
    unint64_t v25 = *(void *)(v83 + 8 * v26);
    if (!v25)
    {
      while (1)
      {
        int64_t v21 = v26 + 1;
        if (__OFADD__(v26, 1)) {
          goto LABEL_43;
        }
        if (v21 >= v84) {
          goto LABEL_37;
        }
        unint64_t v25 = *(void *)(v83 + 8 * v21);
        ++v26;
        if (v25) {
          goto LABEL_18;
        }
      }
    }
    goto LABEL_17;
  }
LABEL_37:
  swift_release();
  if (qword_26894AA20 == -1) {
    goto LABEL_38;
  }
LABEL_44:
  swift_once();
LABEL_38:
  uint64_t v60 = __swift_project_value_buffer(v2, (uint64_t)qword_268956458);
  (*v81)(v9, v60, v2);
  swift_bridgeObjectRetain_n();
  uint64_t v61 = sub_2380E4508();
  os_log_type_t v62 = sub_2380E4D28();
  if (os_log_type_enabled(v61, v62))
  {
    os_log_type_t v63 = (uint8_t *)swift_slowAlloc();
    uint64_t v64 = (void *)swift_slowAlloc();
    v92[0] = v64;
    *(_DWORD *)os_log_type_t v63 = v71;
    uint64_t v65 = swift_bridgeObjectRetain();
    uint64_t v66 = MEMORY[0x23EC86140](v65, v80);
    unint64_t v68 = v67;
    swift_bridgeObjectRelease();
    uint64_t v90 = sub_237EBC6BC(v66, v68, (uint64_t *)v92);
    sub_2380E4FC8();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_237EB8000, v61, v62, "MediaPlaybackProvider#collectAnyExtraFiles: %s", v63, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23EC87710](v64, -1, -1);
    MEMORY[0x23EC87710](v63, -1, -1);

    (*v82)(v74, v2);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    (*v82)(v9, v2);
  }
  swift_beginAccess();
  return v91;
}

uint64_t sub_2380C2CF0(char *a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v64 = a3;
  uint64_t v65 = a4;
  unint64_t v63 = a2;
  uint64_t v61 = a1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26894D4E0);
  MEMORY[0x270FA5388](v4 - 8);
  os_log_type_t v62 = (char *)&v49 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v57 = sub_2380E4688();
  uint64_t v55 = *(void *)(v57 - 8);
  MEMORY[0x270FA5388](v57);
  uint64_t v53 = (uint64_t *)((char *)&v49 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v56 = sub_2380E4758();
  uint64_t v54 = *(void *)(v56 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v56);
  id v51 = (char *)&v49 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  unint64_t v52 = (char *)&v49 - v9;
  uint64_t v10 = sub_2380E4528();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  uint64_t v58 = (char *)&v49 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = MEMORY[0x270FA5388](v12);
  uint64_t v16 = (char *)&v49 - v15;
  MEMORY[0x270FA5388](v14);
  uint64_t v18 = (char *)&v49 - v17;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26894D4E8);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_2380E7450;
  uint64_t v66 = sub_2380E3F38();
  uint64_t v67 = v20;
  swift_bridgeObjectRetain();
  sub_2380E4A18();
  swift_bridgeObjectRelease();
  uint64_t v21 = v67;
  *(void *)(inited + 32) = v66;
  *(void *)(inited + 40) = v21;
  *(void *)(inited + 48) = 0x6E6970736C696174;
  *(void *)(inited + 56) = 0xE800000000000000;
  unint64_t v22 = sub_237FD02F4(inited);
  uint64_t v23 = sub_2380C21C4(v22);
  swift_bridgeObjectRelease();
  if (qword_26894AA20 != -1) {
    swift_once();
  }
  uint64_t v24 = __swift_project_value_buffer(v10, (uint64_t)qword_268956458);
  uint64_t v59 = *(void (**)(char *))(v11 + 16);
  uint64_t v60 = v24;
  v59(v18);
  swift_bridgeObjectRetain();
  unint64_t v25 = sub_2380E4508();
  os_log_type_t v26 = sub_2380E4D58();
  if (os_log_type_enabled(v25, v26))
  {
    uint64_t v27 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v27 = 134217984;
    uint64_t v66 = *(void *)(v23 + 16);
    sub_2380E4FC8();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_237EB8000, v25, v26, "MediaPlaybackProvider#fileRadarWithTailSpins count: %ld", v27, 0xCu);
    MEMORY[0x23EC87710](v27, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease();
  }
  unint64_t v30 = *(void (**)(char *, uint64_t))(v11 + 8);
  uint64_t v29 = v11 + 8;
  os_log_type_t v28 = v30;
  v30(v18, v10);
  if (byte_26894D448 == 1)
  {
    ((void (*)(char *, uint64_t, uint64_t))v59)(v16, v60, v10);
    uint64_t v31 = sub_2380E4508();
    os_log_type_t v32 = sub_2380E4D58();
    if (os_log_type_enabled(v31, v32))
    {
      id v33 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)id v33 = 134217984;
      uint64_t v66 = 20;
      sub_2380E4FC8();
      _os_log_impl(&dword_237EB8000, v31, v32, "MediaPlaybackProvider#fileRadarWithTailSpins waiting up to %ld seconds for tailspin file creation to complete", v33, 0xCu);
      MEMORY[0x23EC87710](v33, -1, -1);
    }

    uint64_t v50 = v28;
    uint64_t v49 = v29;
    v28(v16, v10);
    uint64_t v34 = v58;
    if (qword_26894ABD0 != -1) {
      swift_once();
    }
    id v35 = v51;
    sub_2380E4738();
    id v36 = v53;
    *uint64_t v53 = 20;
    uint64_t v37 = v55;
    uint64_t v38 = v57;
    (*(void (**)(void *, void, uint64_t))(v55 + 104))(v36, *MEMORY[0x263F8F018], v57);
    uint64_t v39 = v52;
    MEMORY[0x23EC85DA0](v35, v36);
    (*(void (**)(void *, uint64_t))(v37 + 8))(v36, v38);
    uint64_t v40 = *(void (**)(char *, uint64_t))(v54 + 8);
    uint64_t v41 = v56;
    v40(v35, v56);
    sub_2380E4ED8();
    v40(v39, v41);
    char v42 = sub_2380E4698();
    ((void (*)(char *, uint64_t, uint64_t))v59)(v34, v60, v10);
    uint64_t v43 = sub_2380E4508();
    os_log_type_t v44 = sub_2380E4D58();
    if (os_log_type_enabled(v43, v44))
    {
      uint64_t v45 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)uint64_t v45 = 67109120;
      LODWORD(v66) = v42 & 1;
      sub_2380E4FC8();
      _os_log_impl(&dword_237EB8000, v43, v44, "MediaPlaybackProvider#fileRadarWithTailSpins notification received: %{BOOL}d", v45, 8u);
      MEMORY[0x23EC87710](v45, -1, -1);
    }

    v50(v34, v10);
  }
  type metadata accessor for ErrorFilingProvider();
  uint64_t v46 = sub_2380E4298();
  uint64_t v47 = (uint64_t)v62;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v46 - 8) + 56))(v62, 1, 1, v46);
  sub_2380E0168(v61, v63, 0, 0, v64, v65, 0, v23, v47, 0, 0, 0, 0);
  swift_bridgeObjectRelease();
  return sub_237F098FC(v47, &qword_26894D4E0);
}

uint64_t sub_2380C34C0(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, unint64_t a5, unint64_t a6, void *a7, uint64_t a8, char *a9, unsigned __int8 a10)
{
  id v170 = a7;
  uint64_t v171 = a8;
  unint64_t v157 = a6;
  unint64_t v174 = a5;
  uint64_t v166 = a2;
  uint64_t v150 = a1;
  uint64_t v173 = sub_2380E44F8();
  uint64_t v159 = *(void *)(v173 - 8);
  MEMORY[0x270FA5388](v173);
  v172 = (uint8_t *)&v147 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26894BA28);
  MEMORY[0x270FA5388](v13 - 8);
  v156 = (char *)&v147 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v154 = sub_2380E3388();
  uint64_t v153 = *(void *)(v154 - 8);
  MEMORY[0x270FA5388](v154);
  v155 = (char *)&v147 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v161 = sub_2380E4458();
  uint64_t v160 = *(void *)(v161 - 8);
  uint64_t v16 = MEMORY[0x270FA5388](v161);
  v158 = (char *)&v147 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v16);
  v176 = (char *)&v147 - v18;
  *(void *)&long long v175 = sub_2380E4528();
  uint64_t v19 = *(void *)(v175 - 8);
  uint64_t v20 = MEMORY[0x270FA5388](v175);
  v149 = (char *)&v147 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = MEMORY[0x270FA5388](v20);
  uint64_t v24 = (char *)&v147 - v23;
  uint64_t v25 = MEMORY[0x270FA5388](v22);
  v169 = (char *)&v147 - v26;
  uint64_t v27 = MEMORY[0x270FA5388](v25);
  v152 = (char *)&v147 - v28;
  uint64_t v29 = MEMORY[0x270FA5388](v27);
  uint64_t v31 = (char *)&v147 - v30;
  uint64_t v32 = MEMORY[0x270FA5388](v29);
  uint64_t v34 = (char *)&v147 - v33;
  MEMORY[0x270FA5388](v32);
  id v36 = (char *)&v147 - v35;
  if (qword_26894AA20 != -1) {
    swift_once();
  }
  uint64_t v37 = __swift_project_value_buffer(v175, (uint64_t)qword_268956458);
  uint64_t v38 = *(void (**)(void))(v19 + 16);
  uint64_t v163 = v37;
  uint64_t v167 = v19 + 16;
  v164 = (void (*)(char *, uint64_t, void))v38;
  v38(v36);
  uint64_t v39 = sub_2380E4508();
  os_log_type_t v40 = sub_2380E4D38();
  BOOL v41 = os_log_type_enabled(v39, v40);
  unint64_t v162 = a3;
  if (v41)
  {
    uint64_t v42 = v19;
    uint64_t v43 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v43 = 0;
    _os_log_impl(&dword_237EB8000, v39, v40, "MediaPlaybackProvider#logSignpost...", v43, 2u);
    os_log_type_t v44 = v43;
    uint64_t v19 = v42;
    a3 = v162;
    MEMORY[0x23EC87710](v44, -1, -1);
  }

  uint64_t v46 = *(void (**)(char *, void))(v19 + 8);
  unint64_t v45 = v19 + 8;
  v165 = v46;
  v46(v36, v175);
  if (!a4)
  {
LABEL_10:
    sub_2380E4488();
    sub_2380E4468();
    uint64_t v54 = sub_2380E4438();
    unint64_t v56 = (unint64_t)v55;
    swift_bridgeObjectRelease();
    uint64_t v57 = HIBYTE(v56) & 0xF;
    if ((v56 & 0x2000000000000000) == 0) {
      uint64_t v57 = v54 & 0xFFFFFFFFFFFFLL;
    }
    if (!v57)
    {
      swift_bridgeObjectRelease();
      v164(v24, v163, v175);
      os_log_type_t v62 = sub_2380E4508();
      os_log_type_t v63 = sub_2380E4D38();
      if (os_log_type_enabled(v62, v63))
      {
        unint64_t v56 = swift_slowAlloc();
        *(_WORD *)unint64_t v56 = 0;
        _os_log_impl(&dword_237EB8000, v62, v63, "MediaPlaybackProvider#logSignpost no error onion available", (uint8_t *)v56, 2u);
        MEMORY[0x23EC87710](v56, -1, -1);
      }

      v165(v24, v175);
      uint64_t v64 = v161;
      uint64_t v65 = v160;
LABEL_83:
      unint64_t v74 = v174;
      if (!v174) {
        return (*(uint64_t (**)(char *, uint64_t))(v65 + 8))(v176, v64);
      }
      goto LABEL_84;
    }
    uint64_t v58 = sub_2380E4478();
    uint64_t v181 = v58;
    unint64_t v182 = v59;
    uint64_t v60 = HIBYTE(v59) & 0xF;
    if ((v59 & 0x2000000000000000) == 0) {
      uint64_t v60 = v58 & 0xFFFFFFFFFFFFLL;
    }
    unint64_t v168 = v45;
    if (v60)
    {
      sub_2380E4A18();
      uint64_t v58 = v181;
      unint64_t v61 = v182;
    }
    else
    {
      unint64_t v61 = v59;
    }
    *(void *)&unsigned long long v177 = v58;
    *((void *)&v177 + 1) = v61;
    swift_bridgeObjectRetain();
    sub_2380E4A18();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    sub_2380E4A18();
    swift_bridgeObjectRelease();
    unint64_t v56 = *((void *)&v177 + 1);
    unint64_t v66 = v177;
    sub_2380E4438();
    sub_2380E4498();
    swift_bridgeObjectRelease();
    unsigned long long v177 = __PAIR128__(v56, v66);
    swift_bridgeObjectRetain();
    sub_2380E4A18();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    unint64_t v67 = *((void *)&v177 + 1);
    uint64_t v68 = HIBYTE(*((void *)&v177 + 1)) & 0xFLL;
    uint64_t v151 = v177;
    if ((*((void *)&v177 + 1) & 0x2000000000000000) == 0) {
      uint64_t v68 = v177 & 0xFFFFFFFFFFFFLL;
    }
    if (!v68)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v64 = v161;
      uint64_t v65 = v160;
      unint64_t v74 = v174;
      if (!v174) {
        return (*(uint64_t (**)(char *, uint64_t))(v65 + 8))(v176, v64);
      }
LABEL_84:
      if (v74 >> 62)
      {
        swift_bridgeObjectRetain();
        uint64_t v119 = sub_2380E52D8();
        if (v119)
        {
LABEL_86:
          unint64_t v168 = v74 & 0xC000000000000001;
          if ((v74 & 0xC000000000000001) != 0)
          {
            uint64_t v120 = (uint8_t *)MEMORY[0x23EC867A0](0, v74);
          }
          else
          {
            if (!*(void *)((v74 & 0xFFFFFFFFFFFFFF8) + 0x10))
            {
              __break(1u);
              goto LABEL_108;
            }
            uint64_t v120 = (uint8_t *)*(id *)(v74 + 32);
          }
          unint64_t v56 = (unint64_t)v120;
          LODWORD(v170) = a10;
          v169 = a9;
          swift_bridgeObjectRelease();
          if (!v157) {
            goto LABEL_109;
          }
          if (!(v157 >> 62))
          {
            if (*(void *)((v157 & 0xFFFFFFFFFFFFFF8) + 0x10))
            {
LABEL_92:
              v158 = (char *)v56;
              uint64_t v121 = v149;
              v164(v149, v163, v175);
              unint64_t v122 = v162;
              swift_bridgeObjectRetain_n();
              uint64_t v123 = sub_2380E4508();
              os_log_type_t v124 = sub_2380E4D58();
              BOOL v125 = os_log_type_enabled(v123, v124);
              uint64_t v167 = v119;
              if (v125)
              {
                double v126 = (uint8_t *)swift_slowAlloc();
                uint64_t v127 = swift_slowAlloc();
                *(void *)&unsigned long long v177 = v127;
                *(_DWORD *)double v126 = 136446210;
                swift_bridgeObjectRetain();
                uint64_t v181 = sub_237EBC6BC(v166, v122, (uint64_t *)&v177);
                sub_2380E4FC8();
                swift_bridgeObjectRelease_n();
                _os_log_impl(&dword_237EB8000, v123, v124, "Logging Signpost Event: %{public}s resultStatuses is empty", v126, 0xCu);
                swift_arrayDestroy();
                uint64_t v128 = v127;
                unint64_t v74 = v174;
                MEMORY[0x23EC87710](v128, -1, -1);
                MEMORY[0x23EC87710](v126, -1, -1);

                uint64_t result = ((uint64_t (*)(char *, void))v165)(v121, v175);
                uint64_t v119 = v167;
              }
              else
              {

                swift_bridgeObjectRelease_n();
                uint64_t result = ((uint64_t (*)(char *, void))v165)(v121, v175);
              }
              if (v119 >= 1)
              {
                v129 = (void (**)(uint8_t *, uint64_t))(v159 + 8);
                swift_bridgeObjectRetain();
                uint64_t v130 = 0;
                long long v175 = xmmword_2380E7390;
                uint64_t v131 = MEMORY[0x263F8D6C8];
                uint64_t v132 = MEMORY[0x263F8D750];
                do
                {
                  if (v168) {
                    id v133 = (id)MEMORY[0x23EC867A0](v130, v74);
                  }
                  else {
                    id v133 = *(id *)(v74 + 8 * v130 + 32);
                  }
                  v134 = v133;
                  id v135 = objc_msgSend(v133, sel_integerValue);
                  uint64_t v136 = sub_2380E4448();
                  sub_2380E4EC8();
                  if (qword_26894A818 != -1) {
                    swift_once();
                  }
                  ++v130;
                  __swift_instantiateConcreteTypeFromMangledName(&qword_26894B288);
                  uint64_t v137 = swift_allocObject();
                  *(_OWORD *)(v137 + 16) = v175;
                  *(void *)(v137 + 56) = v131;
                  *(void *)(v137 + 64) = v132;
                  *(void *)(v137 + 32) = v135;
                  *(void *)(v137 + 96) = v131;
                  *(void *)(v137 + 104) = v132;
                  *(void *)(v137 + 72) = v136;
                  v138 = v172;
                  sub_2380E44E8();
                  sub_2380E44B8();
                  swift_bridgeObjectRelease();
                  (*v129)(v138, v173);

                  unint64_t v74 = v174;
                }
                while (v167 != v130);

                swift_bridgeObjectRelease();
                uint64_t v64 = v161;
                uint64_t v65 = v160;
                return (*(uint64_t (**)(char *, uint64_t))(v65 + 8))(v176, v64);
              }
              __break(1u);
              goto LABEL_114;
            }
LABEL_109:
            v140 = (void *)v56;
            id v141 = objc_msgSend((id)v56, sel_integerValue);
            uint64_t v142 = sub_2380E4448();
            sub_2380E4EC8();
            if (qword_26894A818 != -1) {
              swift_once();
            }
            __swift_instantiateConcreteTypeFromMangledName(&qword_26894B288);
            uint64_t v143 = swift_allocObject();
            *(_OWORD *)(v143 + 16) = xmmword_2380E7390;
            uint64_t v144 = MEMORY[0x263F8D6C8];
            uint64_t v145 = MEMORY[0x263F8D750];
            *(void *)(v143 + 56) = MEMORY[0x263F8D6C8];
            *(void *)(v143 + 64) = v145;
            *(void *)(v143 + 32) = v141;
            *(void *)(v143 + 96) = v144;
            *(void *)(v143 + 104) = v145;
            *(void *)(v143 + 72) = v142;
            v146 = v172;
            sub_2380E44E8();
            sub_2380E44B8();
            swift_bridgeObjectRelease();
            (*(void (**)(uint8_t *, uint64_t))(v159 + 8))(v146, v173);

            return (*(uint64_t (**)(char *, uint64_t))(v65 + 8))(v176, v64);
          }
LABEL_108:
          swift_bridgeObjectRetain();
          uint64_t v139 = sub_2380E52D8();
          swift_bridgeObjectRelease();
          if (v139) {
            goto LABEL_92;
          }
          goto LABEL_109;
        }
      }
      else
      {
        uint64_t v119 = *(void *)((v74 & 0xFFFFFFFFFFFFFF8) + 0x10);
        swift_bridgeObjectRetain();
        if (v119) {
          goto LABEL_86;
        }
      }
      swift_bridgeObjectRelease();
      return (*(uint64_t (**)(char *, uint64_t))(v65 + 8))(v176, v64);
    }
    v164(v31, v163, v175);
    swift_bridgeObjectRetain_n();
    unint64_t v69 = sub_2380E4508();
    os_log_type_t v70 = sub_2380E4D58();
    BOOL v71 = os_log_type_enabled(v69, v70);
    unint64_t v148 = v67;
    if (v71)
    {
      long long v72 = (uint8_t *)swift_slowAlloc();
      uint64_t v73 = swift_slowAlloc();
      *(void *)&unsigned long long v177 = v73;
      *(_DWORD *)long long v72 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v179 = sub_237EBC6BC(v151, v148, (uint64_t *)&v177);
      unint64_t v67 = v148;
      sub_2380E4FC8();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_237EB8000, v69, v70, "MediaPlaybackProvider#logSignpost mediaPlaybackProviderErrorStatus: %s", v72, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x23EC87710](v73, -1, -1);
      MEMORY[0x23EC87710](v72, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    v165(v31, v175);
    sub_2380E4438();
    uint64_t v76 = v166;
    int v77 = sub_2380C20C4(v166, a3, a4);
    swift_bridgeObjectRelease();
    type metadata accessor for PFSQHandler();
    uint64_t v78 = sub_2380E4438();
    sub_2380B22F8(a4, v174, v78, v79, (char *)&v177);
    swift_bridgeObjectRelease();
    char v80 = v177;
    if (v76 == 0xD000000000000026 && a3 == 0x80000002380FB130 || (int v81 = 0, (sub_2380E5408() & 1) != 0))
    {
      LOBYTE(v177) = v80;
      int v81 = _s16SiriAudioSupport11PFSQHandlerC22isPFSQTerminatingError12playbackCodeSbAA08PlaybackI0O_tFZ_0();
    }
    if ((v166 != 0xD00000000000001DLL || a3 != 0x80000002380FB1B0)
      && (sub_2380E5408() & 1) == 0
      && (v166 != 0xD000000000000018 || a3 != 0x80000002380FB1D0)
      && ((v81 | v77 | sub_2380E5408()) & 1) == 0)
    {
      goto LABEL_77;
    }
    uint64_t v82 = v152;
    v164(v152, v163, v175);
    swift_bridgeObjectRetain_n();
    uint64_t v83 = sub_2380E4508();
    os_log_type_t v84 = sub_2380E4D38();
    if (os_log_type_enabled(v83, v84))
    {
      uint64_t v85 = (uint8_t *)swift_slowAlloc();
      uint64_t v86 = swift_slowAlloc();
      *(void *)&unsigned long long v177 = v86;
      *(_DWORD *)uint64_t v85 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v179 = sub_237EBC6BC(v166, a3, (uint64_t *)&v177);
      sub_2380E4FC8();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_237EB8000, v83, v84, "MediaPlaybackProvider#logSignpost submitting error metrics for %s", v85, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x23EC87710](v86, -1, -1);
      MEMORY[0x23EC87710](v85, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    v165(v82, v175);
    sub_2380E31A8();
    __swift_project_boxed_opaque_existential_1(&v177, *((uint64_t *)&v178 + 1));
    sub_2380E3288();
    (*(void (**)(char *, void, uint64_t))(v153 + 104))(v155, *MEMORY[0x263F6F9E0], v154);
    uint64_t v87 = *MEMORY[0x263F6F6C8];
    uint64_t v88 = sub_2380E31D8();
    uint64_t v89 = *(void *)(v88 - 8);
    uint64_t v90 = v156;
    (*(void (**)(char *, uint64_t, uint64_t))(v89 + 104))(v156, v87, v88);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v89 + 56))(v90, 0, 1, v88);
    uint64_t v91 = swift_allocObject();
    unint64_t v67 = v148;
    *(void *)(v91 + 16) = v151;
    *(void *)(v91 + 24) = v67;
    swift_bridgeObjectRetain();
    sub_2380E3238();
    sub_2380E31B8();
    swift_release();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v177);
    if ((v77 & 1) == 0)
    {
LABEL_77:
      swift_bridgeObjectRelease();
      sub_2380E4EC8();
      uint64_t v64 = v161;
      uint64_t v65 = v160;
      if (qword_26894A818 != -1) {
        swift_once();
      }
      __swift_instantiateConcreteTypeFromMangledName(&qword_26894B288);
      uint64_t v108 = swift_allocObject();
      *(_OWORD *)(v108 + 16) = xmmword_2380E7450;
      *(void *)(v108 + 56) = MEMORY[0x263F8D310];
      *(void *)(v108 + 64) = sub_237EC4C0C();
      *(void *)(v108 + 32) = v151;
      *(void *)(v108 + 40) = v67;
      swift_bridgeObjectRetain();
      unint64_t v56 = (unint64_t)v172;
      sub_2380E44E8();
      sub_2380E44B8();
      swift_bridgeObjectRelease();
      (*(void (**)(unint64_t, uint64_t))(v159 + 8))(v56, v173);
      swift_bridgeObjectRelease();
      uint64_t v109 = v169;
      v164(v169, v163, v175);
      uint64_t v110 = v158;
      (*(void (**)(char *, char *, uint64_t))(v65 + 16))(v158, v176, v64);
      unint64_t v111 = v162;
      swift_bridgeObjectRetain_n();
      uint64_t v112 = sub_2380E4508();
      os_log_type_t v113 = sub_2380E4D48();
      if (os_log_type_enabled(v112, v113))
      {
        uint64_t v114 = swift_slowAlloc();
        uint64_t v115 = swift_slowAlloc();
        *(void *)&unsigned long long v177 = v115;
        *(_DWORD *)uint64_t v114 = 136446466;
        swift_bridgeObjectRetain();
        uint64_t v179 = sub_237EBC6BC(v166, v111, (uint64_t *)&v177);
        unint64_t v56 = (unint64_t)&v180;
        sub_2380E4FC8();
        swift_bridgeObjectRelease_n();
        *(_WORD *)(v114 + 12) = 2082;
        uint64_t v116 = sub_2380E4438();
        uint64_t v179 = sub_237EBC6BC(v116, v117, (uint64_t *)&v177);
        sub_2380E4FC8();
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v65 + 8))(v110, v64);
        _os_log_impl(&dword_237EB8000, v112, v113, "Logging SiriKitEvent Event: %{public}s with extended error description: %{public}s", (uint8_t *)v114, 0x16u);
        swift_arrayDestroy();
        MEMORY[0x23EC87710](v115, -1, -1);
        MEMORY[0x23EC87710](v114, -1, -1);

        id v118 = v169;
      }
      else
      {
        swift_bridgeObjectRelease_n();
        (*(void (**)(char *, uint64_t))(v65 + 8))(v110, v64);

        id v118 = v109;
      }
      v165(v118, v175);
      goto LABEL_83;
    }
    if (v170)
    {
      id v92 = objc_msgSend(v170, sel_playerPath);
      uint64_t v93 = v150;
      if (v92)
      {
        uint64_t v94 = v92;
        id v95 = objc_msgSend(v92, sel_description);

        sub_2380E4938();
      }
    }
    else
    {
      uint64_t v93 = v150;
    }
    strcpy((char *)&v177, "playerPath = ");
    HIWORD(v177) = -4864;
    sub_2380E4A18();
    uint64_t result = swift_bridgeObjectRelease();
    if (!*MEMORY[0x263F54CA0])
    {
LABEL_114:
      __break(1u);
      goto LABEL_115;
    }
    if (*(void *)(v93 + 16))
    {
      id v96 = (id)*MEMORY[0x263F54CA0];
      unint64_t v97 = sub_237EC95C4((uint64_t)v96);
      if (v98)
      {
        sub_237EBCF68(*(void *)(v93 + 56) + 32 * v97, (uint64_t)&v177);
      }
      else
      {
        unsigned long long v177 = 0u;
        long long v178 = 0u;
      }

      if (*((void *)&v178 + 1))
      {
        swift_dynamicCast();
        goto LABEL_59;
      }
    }
    else
    {
      unsigned long long v177 = 0u;
      long long v178 = 0u;
    }
    sub_237F098FC((uint64_t)&v177, (uint64_t *)&unk_26894D750);
LABEL_59:
    strcpy((char *)&v177, "contextID = ");
    BYTE13(v177) = 0;
    HIWORD(v177) = -5120;
    sub_2380E4A18();
    uint64_t result = swift_bridgeObjectRelease();
    uint64_t v99 = (void *)*MEMORY[0x263F54D88];
    if (!*MEMORY[0x263F54D88])
    {
LABEL_115:
      __break(1u);
      goto LABEL_116;
    }
    id v170 = (id)*((void *)&v177 + 1);
    v156 = (char *)v177;
    if (*(void *)(v93 + 16))
    {
      id v100 = v99;
      unint64_t v101 = sub_237EC95C4((uint64_t)v100);
      if (v102)
      {
        sub_237EBCF68(*(void *)(v93 + 56) + 32 * v101, (uint64_t)&v177);
      }
      else
      {
        unsigned long long v177 = 0u;
        long long v178 = 0u;
      }

      if (*((void *)&v178 + 1))
      {
        swift_dynamicCast();
LABEL_68:
        *(void *)&unsigned long long v177 = 0xD000000000000016;
        *((void *)&v177 + 1) = 0x80000002380FB300;
        sub_2380E4A18();
        uint64_t result = swift_bridgeObjectRelease();
        uint64_t v103 = (void *)*MEMORY[0x263F54C88];
        if (!*MEMORY[0x263F54C88])
        {
LABEL_116:
          __break(1u);
          return result;
        }
        v155 = (char *)v177;
        id v104 = v103;
        swift_bridgeObjectRelease();
        if (*(void *)(v93 + 16) && (unint64_t v105 = sub_237EC95C4((uint64_t)v104), (v106 & 1) != 0))
        {
          sub_237EBCF68(*(void *)(v93 + 56) + 32 * v105, (uint64_t)&v177);
        }
        else
        {
          unsigned long long v177 = 0u;
          long long v178 = 0u;
        }

        if (*((void *)&v178 + 1)) {
          swift_dynamicCast();
        }
        else {
          sub_237F098FC((uint64_t)&v177, (uint64_t *)&unk_26894D750);
        }
        strcpy((char *)&v177, "commandID = ");
        BYTE13(v177) = 0;
        HIWORD(v177) = -5120;
        sub_2380E4A18();
        swift_bridgeObjectRelease();
        strcpy((char *)&v177, "timeOfError: ");
        HIWORD(v177) = -4864;
        sub_2380E4A18();
        *(void *)&unsigned long long v177 = 0;
        *((void *)&v177 + 1) = 0xE000000000000000;
        sub_2380E5178();
        swift_bridgeObjectRelease();
        *(void *)&unsigned long long v177 = 10;
        *((void *)&v177 + 1) = 0xE100000000000000;
        sub_2380E4A18();
        swift_bridgeObjectRelease();
        sub_2380E4A18();
        sub_2380E4A18();
        swift_bridgeObjectRelease();
        sub_2380E4A18();
        sub_2380E4A18();
        swift_bridgeObjectRelease();
        sub_2380E4A18();
        sub_2380E4A18();
        swift_bridgeObjectRelease();
        sub_2380E4A18();
        sub_2380E4A18();
        swift_bridgeObjectRelease();
        unsigned long long v107 = v177;
        *(void *)&unsigned long long v177 = 0;
        *((void *)&v177 + 1) = 0xE000000000000000;
        sub_2380E5178();
        swift_bridgeObjectRelease();
        *(void *)&unsigned long long v177 = 0xD00000000000001CLL;
        *((void *)&v177 + 1) = 0x80000002380FB340;
        unint64_t v67 = v148;
        sub_2380E4A18();
        sub_2380C2CF0((char *)v177, *((unint64_t *)&v177 + 1), v107, *((uint64_t *)&v107 + 1));
        swift_bridgeObjectRelease();
        goto LABEL_77;
      }
    }
    else
    {
      unsigned long long v177 = 0u;
      long long v178 = 0u;
    }
    sub_237F098FC((uint64_t)&v177, (uint64_t *)&unk_26894D750);
    goto LABEL_68;
  }
  uint64_t v47 = sub_2380E2B98();
  uint64_t v48 = (void *)sub_2380E2B98();
  int IsInformational = MPCAssistantErrorIsInformational();

  if (!IsInformational)
  {

    goto LABEL_10;
  }
  v164(v34, v163, v175);
  uint64_t v50 = sub_2380E4508();
  os_log_type_t v51 = sub_2380E4D58();
  if (os_log_type_enabled(v50, v51))
  {
    unint64_t v52 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)unint64_t v52 = 0;
    _os_log_impl(&dword_237EB8000, v50, v51, "MediaPlaybackProvider#logSignpost ignoring an informational error", v52, 2u);
    MEMORY[0x23EC87710](v52, -1, -1);
    uint64_t v53 = v47;
  }
  else
  {
    uint64_t v53 = v50;
    uint64_t v50 = v47;
  }

  return ((uint64_t (*)(char *, void))v165)(v34, v175);
}

uint64_t sub_2380C50E8(char a1, char a2, uint64_t (*a3)(uint64_t), uint64_t a4, unsigned int a5, uint64_t a6, void (*a7)(void *, uint64_t, void *), uint64_t a8)
{
  uint64_t v51 = a8;
  unint64_t v52 = a7;
  uint64_t v50 = a6;
  unsigned int v53 = a5;
  uint64_t v11 = sub_2380E4528();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = MEMORY[0x270FA5388](v11);
  uint64_t v15 = (char *)v46 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = MEMORY[0x270FA5388](v13);
  uint64_t v18 = (char *)v46 - v17;
  uint64_t v19 = MEMORY[0x270FA5388](v16);
  uint64_t v21 = (char *)v46 - v20;
  MEMORY[0x270FA5388](v19);
  uint64_t v23 = (char *)v46 - v22;
  if (a1)
  {
    if (qword_26894AA20 != -1) {
      swift_once();
    }
    uint64_t v24 = __swift_project_value_buffer(v11, (uint64_t)qword_268956458);
    (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v23, v24, v11);
    uint64_t v25 = sub_2380E4508();
    os_log_type_t v26 = sub_2380E4D58();
    if (os_log_type_enabled(v25, v26))
    {
      uint64_t v27 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v27 = 0;
      _os_log_impl(&dword_237EB8000, v25, v26, "MediaPlaybackProvider#addToUpNext Insertion position supported", v27, 2u);
      MEMORY[0x23EC87710](v27, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v12 + 8))(v23, v11);
    uint64_t v28 = v53;
    return a3(v28);
  }
  if (a2)
  {
    if (qword_26894AA20 != -1) {
      swift_once();
    }
    uint64_t v29 = __swift_project_value_buffer(v11, (uint64_t)qword_268956458);
    (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v21, v29, v11);
    uint64_t v30 = sub_2380E4508();
    os_log_type_t v31 = sub_2380E4D58();
    if (os_log_type_enabled(v30, v31))
    {
      uint64_t v32 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v32 = 0;
      _os_log_impl(&dword_237EB8000, v30, v31, "MediaPlaybackProvider#addToUpNext Insertion position of 'next' is supported. Default to that.", v32, 2u);
      MEMORY[0x23EC87710](v32, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v12 + 8))(v21, v11);
    uint64_t v28 = 0;
    return a3(v28);
  }
  if (qword_26894AA20 != -1) {
    swift_once();
  }
  uint64_t v34 = __swift_project_value_buffer(v11, (uint64_t)qword_268956458);
  uint64_t v49 = *(void (**)(char *, uint64_t, uint64_t))(v12 + 16);
  v49(v18, v34, v11);
  uint64_t v35 = sub_2380E4508();
  os_log_type_t v36 = sub_2380E4D48();
  if (os_log_type_enabled(v35, v36))
  {
    uint64_t v37 = (uint8_t *)swift_slowAlloc();
    uint64_t v47 = swift_slowAlloc();
    v56[0] = v47;
    uint64_t v48 = v34;
    *(_DWORD *)uint64_t v37 = 136315138;
    v46[1] = v37 + 4;
    LODWORD(v54[0]) = v53;
    sub_2380C5B38();
    uint64_t v38 = sub_2380E5058();
    v54[0] = sub_237EBC6BC(v38, v39, v56);
    uint64_t v34 = v48;
    sub_2380E4FC8();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_237EB8000, v35, v36, "MediaPlaybackProvider#addToUpNext Insertion position not supported for %s", v37, 0xCu);
    uint64_t v40 = v47;
    swift_arrayDestroy();
    MEMORY[0x23EC87710](v40, -1, -1);
    MEMORY[0x23EC87710](v37, -1, -1);
  }

  BOOL v41 = *(void (**)(char *, uint64_t))(v12 + 8);
  v41(v18, v11);
  v49(v15, v34, v11);
  uint64_t v42 = sub_2380E4508();
  os_log_type_t v43 = sub_2380E4D38();
  if (os_log_type_enabled(v42, v43))
  {
    os_log_type_t v44 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)os_log_type_t v44 = 0;
    _os_log_impl(&dword_237EB8000, v42, v43, "MediaPlaybackProvider#destroyMRQueue destroying queue...", v44, 2u);
    MEMORY[0x23EC87710](v44, -1, -1);
  }

  v41(v15, v11);
  MRSystemAppPlaybackQueueDestroy();
  LOBYTE(v54[0]) = 6;
  char v55 = 19;
  v45._object = (void *)0x80000002380FB020;
  v45._countAndFlagsBits = 0xD000000000000019;
  SiriAudioSupport::PlaybackCodeAndDescription v57 = PlaybackCodeAndDescription.init(playbackCode:domainCode:errorDescription:)((SiriAudioSupport::PlaybackCode)v54, (SiriAudioSupport::DomainCode)&v55, v45);
  v54[0] = LOWORD(v56[0]);
  v54[1] = v56[1];
  v54[2] = v56[2];
  v52(v54, v57.errorDescription._countAndFlagsBits, v57.errorDescription._object);
  return swift_bridgeObjectRelease();
}

uint64_t sub_2380C56A8(int a1, void *a2, uint64_t (*a3)(uint64_t), uint64_t a4, unsigned int a5, uint64_t a6, void (*a7)(void *, uint64_t, void *), uint64_t a8)
{
  uint64_t v27 = a8;
  uint64_t v28 = a3;
  uint64_t v31 = a6;
  uint64_t v32 = a7;
  unsigned int v30 = a5;
  uint64_t v29 = a4;
  uint64_t v10 = sub_2380E4528();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)v26 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = swift_allocObject();
  *(unsigned char *)(v14 + 16) = 0;
  v26[1] = v14 + 16;
  uint64_t v15 = swift_allocObject();
  *(unsigned char *)(v15 + 16) = 0;
  uint64_t v16 = swift_allocObject();
  *(void *)(v16 + 16) = v14;
  *(void *)(v16 + 24) = sub_2380B5EF0;
  *(void *)(v16 + 32) = 0;
  *(_DWORD *)(v16 + 40) = a1;
  *(void *)(v16 + 48) = v15;
  aBlock[4] = sub_2380C5B24;
  aBlock[5] = v16;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_2380B6648;
  aBlock[3] = &block_descriptor_217;
  uint64_t v17 = _Block_copy(aBlock);
  id v18 = a2;
  swift_retain();
  swift_retain();
  swift_release();
  MRMediaRemoteCommandInfoEnumerateSupportedCommandsWithHandler();
  _Block_release(v17);

  if (qword_26894AA20 != -1) {
    swift_once();
  }
  uint64_t v19 = __swift_project_value_buffer(v10, (uint64_t)qword_268956458);
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v13, v19, v10);
  swift_retain();
  swift_retain();
  uint64_t v20 = sub_2380E4508();
  os_log_type_t v21 = sub_2380E4D58();
  if (os_log_type_enabled(v20, v21))
  {
    uint64_t v22 = (_DWORD *)swift_slowAlloc();
    v26[0] = v10;
    uint64_t v23 = v22;
    *uint64_t v22 = 67109376;
    swift_beginAccess();
    LODWORD(aBlock[0]) = *(unsigned __int8 *)(v14 + 16);
    sub_2380E4FC8();
    swift_release();
    *((_WORD *)v23 + 4) = 1024;
    swift_beginAccess();
    LODWORD(aBlock[0]) = *(unsigned __int8 *)(v15 + 16);
    sub_2380E4FC8();
    swift_release();
    _os_log_impl(&dword_237EB8000, v20, v21, "MRMediaRemoteCommandInsertIntoPlaybackQueue supportedCommand: %{BOOL}d supportsOnlyNext: %{BOOL}d", (uint8_t *)v23, 0xEu);
    uint64_t v10 = v26[0];
    MEMORY[0x23EC87710](v23, -1, -1);
  }
  else
  {

    swift_release();
    swift_release();
  }
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  swift_beginAccess();
  char v24 = *(unsigned char *)(v14 + 16);
  swift_beginAccess();
  sub_2380C50E8(v24, *(unsigned char *)(v15 + 16), v28, v29, v30, v31, v32, v27);
  swift_release();
  return swift_release();
}

uint64_t sub_2380C5AA4()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_2380C5AB4()
{
  return objectdestroy_185Tm(MEMORY[0x263F8EED8]);
}

uint64_t objectdestroy_185Tm(void (*a1)(void))
{
  swift_release();
  a1(*(void *)(v1 + 32));
  swift_release();
  return MEMORY[0x270FA0238](v1, 56, 7);
}

uint64_t sub_2380C5B24(uint64_t a1, uint64_t a2)
{
  return sub_2380B657C(a1, a2, *(void *)(v2 + 16), *(uint64_t (**)(uint64_t, uint64_t))(v2 + 24), *(void *)(v2 + 32), *(unsigned int *)(v2 + 40), *(void *)(v2 + 48));
}

unint64_t sub_2380C5B38()
{
  unint64_t result = qword_26894D4C8;
  if (!qword_26894D4C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26894D4C8);
  }
  return result;
}

uint64_t sub_2380C5B8C()
{
  swift_release();
  swift_release();
  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_2380C5BCC(int a1)
{
  return sub_2380B4458(a1, *(void *)(v1 + 16), *(void *)(v1 + 24), *(void (**)(uint64_t *, uint64_t, void *))(v1 + 32), *(char **)(v1 + 40));
}

uint64_t sub_2380C5BD8()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_2380C5C1C()
{
  uint64_t v1 = sub_2380E2E28();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 24) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = ((((*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 8;
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_release();
  return MEMORY[0x270FA0238](v0, v6, v5);
}

uint64_t sub_2380C5D10()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_release();
  return MEMORY[0x270FA0238](v0, 88, 7);
}

uint64_t sub_2380C5D60(unsigned __int16 *a1)
{
  return sub_2380B1AFC(a1, *(void *)(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32), *(void *)(v1 + 40), *(void *)(v1 + 48), *(void **)(v1 + 56), *(unsigned __int8 *)(v1 + 64), *(void (**)(uint64_t *))(v1 + 72), *(void *)(v1 + 80));
}

uint64_t sub_2380C5D98()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 136, 7);
}

uint64_t sub_2380C5E08()
{
  return sub_2380C34C0(*(void *)(v0 + 24), *(void *)(v0 + 48), *(void *)(v0 + 56), *(void *)(v0 + 64), *(void *)(v0 + 72), *(void *)(v0 + 80), *(void **)(v0 + 88), *(void *)(v0 + 96), *(char **)(v0 + 104), *(unsigned char *)(v0 + 112));
}

uint64_t sub_2380C5E50()
{
  return sub_2380B2468();
}

uint64_t sub_2380C5E58()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_2380C5E68()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_2380C5E78()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_2380C5E88()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_2380C5E98()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_2380C5ED0@<X0>(void *a1@<X8>)
{
  *a1 = *(void *)(v1 + 16);
  return swift_bridgeObjectRetain();
}

uint64_t sub_2380C5EDC()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_2380C5EEC()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_2380C5EFC()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_2380C5F0C()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_2380C5F1C()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_2380C5F2C()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_2380C5F3C()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_2380C5F4C()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_2380C5F5C()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_2380C5F6C()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_2380C5F7C()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_2380C5F8C()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_2380C5F9C()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_2380C5FAC()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_2380C5FBC()
{
  return MEMORY[0x270FA0238](v0, 20, 7);
}

uint64_t sub_2380C5FCC()
{
  return *(unsigned int *)(v0 + 16);
}

uint64_t sub_2380C5FD4()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_2380C5FE4()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_2380C5FF4()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_2380C6004()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_2380C6014()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_2380C6024()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_2380C6034@<X0>(_DWORD *a1@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(v1 + 16))();
  *a1 = result;
  return result;
}

uint64_t sub_2380C6064(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  return sub_237FBC0C4(a1, a2, a3, *(void (**)(uint64_t *__return_ptr))(v3 + 16));
}

uint64_t sub_2380C606C()
{
  return sub_2380B2758(*(void **)(v0 + 16), (SEL *)&selRef_domain);
}

uint64_t sub_2380C6090()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_2380C60A0()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_2380C60B0()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_2380C60C0()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_2380C60D0()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_2380C60E0()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_2380C60F0@<X0>(uint64_t *a1@<X8>)
{
  return sub_237FBC184(*(uint64_t (**)(void))(v1 + 16), a1);
}

uint64_t sub_2380C60F8(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  return sub_237FBC124(a1, a2, a3, *(void (**)(uint64_t *__return_ptr))(v3 + 16));
}

uint64_t sub_2380C6100@<X0>(void *a1@<X8>)
{
  uint64_t v2 = MEMORY[0x263F8EE78];
  if (*(void *)(v1 + 16)) {
    uint64_t v2 = *(void *)(v1 + 16);
  }
  *a1 = v2;
  return swift_bridgeObjectRetain();
}

uint64_t sub_2380C611C()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_2380C612C()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_2380C613C()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_2380C614C()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_2380C615C()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_2380C616C()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_2380C617C()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_2380C618C()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_2380C619C()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_2380C61AC()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_2380C61BC()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_2380C61CC()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_2380C61DC()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_2380C61EC()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_2380C61FC()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_2380C620C()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_2380C621C()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_2380C622C()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_2380C623C()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_2380C624C()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_2380C625C()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_2380C626C()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_2380C627C()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_2380C628C()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_2380C629C()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_2380C62AC()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_2380C62BC()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_2380C62CC()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_2380C62DC()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_2380C62EC()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_2380C62FC()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_2380C630C()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_2380C631C()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_2380C632C()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_2380C633C()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_2380C634C()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_2380C635C()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_2380C636C()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_2380C637C()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_2380C638C()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_2380C639C()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_2380C63AC()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_2380C63BC()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_2380C63CC()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_2380C63DC()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_2380C63EC()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_2380C63FC()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_2380C640C()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_2380C641C()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_2380C642C()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_2380C643C()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_2380C644C()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_2380C645C()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_2380C646C()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_2380C647C()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_2380C648C()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_2380C649C()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_2380C64AC()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_2380C64BC()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_2380C64CC()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_2380C64DC()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_2380C64EC()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_2380C64FC()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_2380C650C()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_2380C651C()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_2380C652C()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_2380C653C()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_2380C654C()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_2380C655C()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_2380C656C()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_2380C657C()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_2380C658C()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_2380C659C()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_2380C65D4()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_2380C65E4()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_2380C65F4()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_2380C6604()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_2380C6614()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_2380C664C()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_2380C6684()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_2380C6694()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_2380C66A4()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_2380C66B4()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_2380C66C4()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_2380C66D4()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_2380C66E4()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_2380C66F4()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_2380C6704()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_2380C6714()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_2380C6724()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_2380C6734()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_2380C6744()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_2380C6754()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_2380C6764()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_2380C6774()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_2380C6784()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_2380C6794()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_2380C67A4()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_2380C67B4()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_2380C67C4()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_2380C67D4()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_2380C67E4()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_2380C67F4()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_2380C6804()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_2380C6814()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_2380C6824()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_2380C6834()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_2380C6844()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_2380C6854()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_2380C6864()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_2380C6874()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_2380C6884()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_2380C6894()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_2380C68A4()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_2380C68B4()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_2380C68C4()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_2380C68D4()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_2380C68E4()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_2380C68F4()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_2380C6904()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_2380C6934()
{
  return sub_2380B2758(*(void **)(v0 + 16), (SEL *)&selRef_localizedDescription);
}

uint64_t sub_2380C6958()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_2380C6968()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_2380C6978()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_2380C6988()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_2380C6998()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_2380C69A8()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_2380C69B8()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_2380C69C8()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

id sub_2380C69D8()
{
  return objc_msgSend(*(id *)(v0 + 16), sel_code);
}

uint64_t sub_2380C69E8()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_2380C69F8()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_2380C6A08()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_2380C6A18()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_2380C6A28()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_2380C6A38()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_2380C6A48()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_2380C6A58()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_2380C6A68()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_2380C6A78()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_2380C6A88()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_2380C6A98()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_2380C6AA8()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_2380C6AB8()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_2380C6AC8()
{
  return MEMORY[0x270FA0238](v0, 19, 7);
}

uint64_t sub_2380C6ADC()
{
  uint64_t v1 = sub_2380E2E28();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 32) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = ((((((((v4 + *(void *)(v2 + 64)) & 0xFFFFFFFFFFFFFFF8) + 31) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8)
       + 15) & 0xFFFFFFFFFFFFFFF8)
     + 8;
  swift_release();
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_release();
  swift_release();
  return MEMORY[0x270FA0238](v0, v6, v5);
}

void sub_2380C6BEC(void *a1)
{
  uint64_t v3 = *(void *)(sub_2380E2E28() - 8);
  unint64_t v4 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  unint64_t v5 = v4 + *(void *)(v3 + 64);
  sub_2380AFF30(a1, *(void *)(v1 + 16), *(void *)(v1 + 24), (uint8_t *)(v1 + v4), *(unsigned char *)(v1 + v5), *(void *)((v5 & 0xFFFFFFFFFFFFFFF8) + v1 + 8), *(void *)((v5 & 0xFFFFFFFFFFFFFFF8) + v1 + 16), *(void *)(v1 + (((v5 & 0xFFFFFFFFFFFFFFF8) + 31) & 0xFFFFFFFFFFFFFFF8)), *(void *)(v1 + (((((v5 & 0xFFFFFFFFFFFFFFF8) + 31) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8)), *(void *)(v1+ (((((((v5 & 0xFFFFFFFFFFFFFFF8) + 31) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8)));
}

uint64_t sub_2380C6CB8()
{
  uint64_t v1 = sub_2380E2E28();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 32) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = ((((*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 8;
  swift_release();
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_release();
  return MEMORY[0x270FA0238](v0, v6, v5);
}

void sub_2380C6DB4(void *a1)
{
  uint64_t v3 = *(void *)(sub_2380E2E28() - 8);
  unint64_t v4 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  unint64_t v5 = (*(void *)(v3 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v6 = *(void *)(v1 + 16);
  uint64_t v7 = *(void *)(v1 + 24);
  uint64_t v8 = *(void *)(v1 + v5);
  uint64_t v9 = *(void *)(v1 + v5 + 8);
  sub_2380AF024(a1, v6, v7, (uint8_t *)(v1 + v4), v8, v9);
}

uint64_t sub_2380C6E68(uint64_t a1)
{
  return sub_2380C6E80(a1, (uint64_t (*)(uint64_t, void, void, void, void, void))sub_2380ADC14);
}

uint64_t sub_2380C6E80(uint64_t a1, uint64_t (*a2)(uint64_t, void, void, void, void, void))
{
  return a2(a1, v2[2], v2[3], v2[4], v2[5], v2[6]);
}

uint64_t objectdestroy_1601Tm()
{
  swift_release();

  swift_bridgeObjectRelease();
  swift_release();
  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t sub_2380C6EF8()
{
  return sub_2380AE050(*(void **)(v0 + 24), *(void *)(v0 + 32), *(void *)(v0 + 40), *(void *)(v0 + 48));
}

uint64_t sub_2380C6F28(uint64_t a1)
{
  return sub_2380AD620(a1, *(uint64_t (**)(void))(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_2380C6F30()
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  return MEMORY[0x270FA0238](v0, 112, 7);
}

uint64_t sub_2380C6F90(int a1)
{
  return sub_237F40CC8(a1, *(void *)(v1 + 16), (uint64_t *)(v1 + 24), *(uint64_t (**)(void *))(v1 + 80), *(void *)(v1 + 88), *(uint64_t (**)(void))(v1 + 96), *(void *)(v1 + 104));
}

uint64_t sub_2380C6FAC()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_release();
  swift_release();
  return MEMORY[0x270FA0238](v0, 112, 7);
}

uint64_t sub_2380C700C(char a1)
{
  return sub_237F2AA04(a1, v1 + 16, *(void **)(v1 + 72), *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v1 + 80), *(void *)(v1 + 88), *(void *)(v1 + 96), *(void *)(v1 + 104));
}

uint64_t sub_2380C702C(char a1)
{
  uint64_t v2 = *(uint64_t (**)(char *))(v1 + 16);
  char v4 = a1;
  return v2(&v4);
}

uint64_t sub_2380C7068()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 40, 7);
}

void sub_2380C70A0(void *a1)
{
  sub_2380B1618(a1, *(void (**)(unint64_t *, uint64_t, void *))(v1 + 16), *(void *)(v1 + 24));
}

unint64_t sub_2380C70AC()
{
  unint64_t result = qword_26894D508;
  if (!qword_26894D508)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract((uint64_t *)&unk_26894CA80);
    sub_2380BEFD0((unint64_t *)&qword_26894AE00, type metadata accessor for CFString);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26894D508);
  }
  return result;
}

void *sub_2380C7150@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  unint64_t v5 = *(uint64_t **)(v3 + 16);
  uint64_t v7 = *v5;
  uint64_t v6 = v5[1];
  v13[0] = v7;
  v13[1] = v6;
  v12[2] = v13;
  unint64_t result = sub_2380BA2BC((void *(*)(uint64_t *__return_ptr, uint64_t, uint64_t))sub_2380C71BC, (uint64_t)v12, a1, a2);
  *a3 = result;
  a3[1] = v9;
  a3[2] = v10;
  a3[3] = v11;
  return result;
}

uint64_t sub_2380C71BC@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  return sub_2380BBA74(a1, a2);
}

uint64_t sub_2380C71DC()
{
  return objectdestroy_116Tm(40);
}

uint64_t sub_2380C71E4()
{
  return objectdestroy_116Tm(40);
}

uint64_t sub_2380C71EC()
{
  swift_bridgeObjectRelease();
  swift_release();
  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_2380C722C(long long *a1)
{
  return sub_2380B8028(a1, *(void *)(v1 + 16), *(void *)(v1 + 24), *(uint64_t (**)(void))(v1 + 32), *(void *)(v1 + 40));
}

uint64_t sub_2380C7238()
{
  return objectdestroy_116Tm(40);
}

void *sub_2380C7240(void *a1, void (*a2)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))
{
  a2(*a1, a1[1], a1[2], a1[3], a1[4], a1[5], a1[6], a1[7], a1[8], a1[9], a1[10], a1[11], a1[12], a1[13], a1[14], a1[15], a1[16], a1[17], a1[18],
    a1[19],
    a1[20],
    a1[21],
    a1[22],
    a1[23]);
  return a1;
}

uint64_t sub_2380C72B4()
{
  return objectdestroy_116Tm(40);
}

uint64_t objectdestroy_116Tm(uint64_t a1)
{
  swift_release();
  swift_release();
  return MEMORY[0x270FA0238](v1, a1, 7);
}

uint64_t dispatch thunk of NotificationProviding.post(result:songId:playlistId:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return (*(uint64_t (**)(void))(a7 + 8))();
}

uint64_t sub_2380C7730()
{
  uint64_t v1 = sub_2380E33F8();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  char v4 = (char *)&v12 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = (uint64_t)*(&off_264D02EE0 + *v0);
  int64_t v6 = *(void *)(v5 + 16);
  uint64_t v7 = MEMORY[0x263F8EE78];
  if (v6)
  {
    uint64_t v13 = MEMORY[0x263F8EE78];
    swift_bridgeObjectRetain();
    sub_237F6B6FC(0, v6, 0);
    uint64_t v8 = 0;
    uint64_t v7 = v13;
    do
    {
      switch(*(void *)(v5 + 8 * v8 + 32))
      {
        case 1:
          sub_2380E33E8();
          break;
        case 2:
          sub_2380E33A8();
          break;
        case 3:
          sub_2380E33C8();
          break;
        case 4:
          sub_2380E33D8();
          break;
        default:
          sub_2380E33B8();
          break;
      }
      uint64_t v13 = v7;
      unint64_t v10 = *(void *)(v7 + 16);
      unint64_t v9 = *(void *)(v7 + 24);
      if (v10 >= v9 >> 1)
      {
        sub_237F6B6FC(v9 > 1, v10 + 1, 1);
        uint64_t v7 = v13;
      }
      ++v8;
      *(void *)(v7 + 16) = v10 + 1;
      (*(void (**)(unint64_t, char *, uint64_t))(v2 + 32))(v7+ ((*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80))+ *(void *)(v2 + 72) * v10, v4, v1);
    }
    while (v6 != v8);
    swift_bridgeObjectRelease();
  }
  return v7;
}

BOOL static AcceptedSpeakerIdConfidence.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t AcceptedSpeakerIdConfidence.hash(into:)()
{
  return sub_2380E54F8();
}

uint64_t AcceptedSpeakerIdConfidence.hashValue.getter()
{
  return sub_2380E5538();
}

unint64_t sub_2380C79C4()
{
  unint64_t result = qword_26894D528;
  if (!qword_26894D528)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26894D528);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for AcceptedSpeakerIdConfidence(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x2380C7AE4);
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

ValueMetadata *type metadata accessor for AcceptedSpeakerIdConfidence()
{
  return &type metadata for AcceptedSpeakerIdConfidence;
}

uint64_t static PodcastShowEntity.bundleIdentifier.getter()
{
  return sub_237F79688((uint64_t *)&unk_26894D530);
}

uint64_t static PodcastShowEntity.bundleIdentifier.setter(uint64_t a1, uint64_t a2)
{
  return sub_237F796EC(a1, a2, qword_26894D530, &qword_26894D530[1]);
}

uint64_t (*static PodcastShowEntity.bundleIdentifier.modify())()
{
  return j_j__swift_endAccess;
}

uint64_t static PodcastShowEntity.typeIdentifier.getter()
{
  return sub_237F79688((uint64_t *)aShowentity);
}

uint64_t static PodcastShowEntity.typeIdentifier.setter(uint64_t a1, uint64_t a2)
{
  return sub_237F796EC(a1, a2, aShowentity, &aShowentity[1]);
}

uint64_t (*static PodcastShowEntity.typeIdentifier.modify())()
{
  return j__swift_endAccess;
}

uint64_t PodcastShowEntity.__allocating_init(_:)(uint64_t a1)
{
  uint64_t v2 = sub_2380E40A8();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_allocObject();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, a1, v2);
  uint64_t v6 = sub_2380E4108();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(a1, v2);
  return v6;
}

uint64_t PodcastShowEntity.init(_:)(uint64_t a1)
{
  uint64_t v2 = sub_2380E40A8();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))((char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v2);
  uint64_t v5 = sub_2380E4108();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(a1, v2);
  return v5;
}

uint64_t PodcastShowEntity.__deallocating_deinit()
{
  _s16SiriAudioSupport20PodcastChannelEntityCfd_0();
  return swift_deallocClassInstance();
}

uint64_t sub_2380C7E3C()
{
  return sub_2380C8164(&qword_26894D550);
}

uint64_t type metadata accessor for PodcastShowEntity()
{
  uint64_t result = qword_26894D598;
  if (!qword_26894D598) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_2380C7EBC()
{
  return sub_2380C8164(&qword_26894D558);
}

uint64_t sub_2380C7EF0()
{
  return sub_2380C8164(&qword_26894D560);
}

uint64_t sub_2380C7F24()
{
  return sub_2380C8164(&qword_26894D568);
}

uint64_t sub_2380C7F58()
{
  return sub_2380C8164(&qword_26894D570);
}

uint64_t sub_2380C7F8C()
{
  return sub_2380C8164(&qword_26894D578);
}

uint64_t sub_2380C7FC0()
{
  return sub_2380C8164(&qword_26894D580);
}

uint64_t sub_2380C7FF4(uint64_t a1, uint64_t a2)
{
  return sub_237F79C40(a1, a2, qword_26894D530);
}

uint64_t sub_2380C8004(uint64_t a1, uint64_t a2)
{
  return sub_237F79C40(a1, a2, aShowentity);
}

uint64_t sub_2380C8014()
{
  return sub_2380C8164(&qword_26894D570);
}

uint64_t sub_2380C8048(uint64_t a1, uint64_t a2)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x270F0CBC0](a1, a2, WitnessTable);
}

uint64_t sub_2380C80A8()
{
  return sub_2380C8164(&qword_26894D588);
}

uint64_t sub_2380C80DC(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x270F0C9E8](a1, WitnessTable);
}

uint64_t sub_2380C8130()
{
  return sub_2380C8164(&qword_26894D590);
}

uint64_t sub_2380C8164(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for PodcastShowEntity();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_2380C81A8(uint64_t a1, uint64_t a2)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x270F0CBA8](a1, a2, WitnessTable);
}

uint64_t sub_2380C8208()
{
  return swift_initClassMetadata2();
}

uint64_t sub_2380C8248()
{
  return type metadata accessor for PodcastShowEntity();
}

Swift::UInt64_optional __swiftcall MPMediaLibrary.persistentID(fromSiriSyncID:)(Swift::String fromSiriSyncID)
{
  uint64_t v2 = v1;
  object = fromSiriSyncID._object;
  uint64_t countAndFlagsBits = fromSiriSyncID._countAndFlagsBits;
  uint64_t v5 = sub_2380E4528();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v9 = (void *)sub_2380E4918();
  id v10 = objc_msgSend(v2, sel_entityWithSiriSyncIdentifier_, v9);

  if (v10)
  {
    id v11 = objc_msgSend(v10, sel_persistentID);
  }
  else
  {
    if (qword_26894AA20 != -1) {
      swift_once();
    }
    uint64_t v12 = __swift_project_value_buffer(v5, (uint64_t)qword_268956458);
    (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, v12, v5);
    swift_bridgeObjectRetain_n();
    uint64_t v13 = sub_2380E4508();
    os_log_type_t v14 = sub_2380E4D48();
    if (os_log_type_enabled(v13, v14))
    {
      uint64_t v15 = (uint8_t *)swift_slowAlloc();
      uint64_t v20 = swift_slowAlloc();
      uint64_t v22 = v20;
      *(_DWORD *)uint64_t v15 = 136315138;
      uint64_t v19 = v15 + 4;
      swift_bridgeObjectRetain();
      uint64_t v21 = sub_237EBC6BC(countAndFlagsBits, (unint64_t)object, &v22);
      sub_2380E4FC8();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_237EB8000, v13, v14, "MPMediaLibrary#persistantID Failed to get mediaEntity by querying with siriSyncID: %s", v15, 0xCu);
      uint64_t v16 = v20;
      swift_arrayDestroy();
      MEMORY[0x23EC87710](v16, -1, -1);
      MEMORY[0x23EC87710](v15, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    id v11 = 0;
  }
  Swift::Bool v17 = v10 == 0;
  Swift::UInt64 v18 = (Swift::UInt64)v11;
  result.value = v18;
  result.is_nil = v17;
  return result;
}

uint64_t sub_2380C8518(uint64_t a1, void *a2)
{
  uint64_t v4 = sub_2380E3CF8();
  uint64_t v5 = MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)v44 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v48 = v8;
  uint64_t v49 = (char *)v44 - v9;
  uint64_t v10 = *(void *)(a1 + 56);
  uint64_t v45 = a1 + 56;
  uint64_t v11 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v12 = -1;
  if (v11 < 64) {
    uint64_t v12 = ~(-1 << v11);
  }
  unint64_t v13 = v12 & v10;
  int64_t v46 = (unint64_t)(v11 + 63) >> 6;
  uint64_t v50 = a1;
  uint64_t v51 = (void (**)(char *, char *, uint64_t))(v8 + 32);
  v44[2] = v8 + 40;
  swift_bridgeObjectRetain();
  int64_t v14 = 0;
  uint64_t v47 = a2;
  while (1)
  {
    if (v13)
    {
      uint64_t v52 = (v13 - 1) & v13;
      int64_t v53 = v14;
      unint64_t v15 = __clz(__rbit64(v13)) | (v14 << 6);
    }
    else
    {
      int64_t v16 = v14 + 1;
      if (__OFADD__(v14, 1)) {
        goto LABEL_36;
      }
      if (v16 >= v46) {
        return swift_release();
      }
      unint64_t v17 = *(void *)(v45 + 8 * v16);
      int64_t v18 = v14 + 1;
      if (!v17)
      {
        int64_t v18 = v14 + 2;
        if (v14 + 2 >= v46) {
          return swift_release();
        }
        unint64_t v17 = *(void *)(v45 + 8 * v18);
        if (!v17)
        {
          int64_t v18 = v14 + 3;
          if (v14 + 3 >= v46) {
            return swift_release();
          }
          unint64_t v17 = *(void *)(v45 + 8 * v18);
          if (!v17)
          {
            int64_t v18 = v14 + 4;
            if (v14 + 4 >= v46) {
              return swift_release();
            }
            unint64_t v17 = *(void *)(v45 + 8 * v18);
            if (!v17)
            {
              uint64_t v19 = v14 + 5;
              if (v14 + 5 >= v46) {
                return swift_release();
              }
              unint64_t v17 = *(void *)(v45 + 8 * v19);
              if (!v17)
              {
                while (1)
                {
                  int64_t v18 = v19 + 1;
                  if (__OFADD__(v19, 1)) {
                    goto LABEL_37;
                  }
                  if (v18 >= v46) {
                    return swift_release();
                  }
                  unint64_t v17 = *(void *)(v45 + 8 * v18);
                  ++v19;
                  if (v17) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v18 = v14 + 5;
            }
          }
        }
      }
LABEL_23:
      uint64_t v52 = (v17 - 1) & v17;
      int64_t v53 = v18;
      unint64_t v15 = __clz(__rbit64(v17)) + (v18 << 6);
    }
    uint64_t v20 = (uint64_t *)(*(void *)(v50 + 48) + 16 * v15);
    uint64_t v21 = *v20;
    uint64_t v22 = v20[1];
    swift_bridgeObjectRetain_n();
    uint64_t v23 = v49;
    sub_2380E3CE8();
    char v24 = *v51;
    uint64_t v25 = v7;
    os_log_type_t v26 = v7;
    uint64_t v27 = v4;
    (*v51)(v26, v23, v4);
    int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v54 = (void *)*a2;
    uint64_t v29 = v54;
    *a2 = 0x8000000000000000;
    unint64_t v31 = sub_237EC9470(v21, v22);
    uint64_t v32 = v29[2];
    BOOL v33 = (v30 & 1) == 0;
    uint64_t v34 = v32 + v33;
    if (__OFADD__(v32, v33)) {
      break;
    }
    char v35 = v30;
    if (v29[3] >= v34)
    {
      if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
        sub_23807AF14();
      }
    }
    else
    {
      sub_238079AC4(v34, isUniquelyReferenced_nonNull_native);
      unint64_t v36 = sub_237EC9470(v21, v22);
      if ((v35 & 1) != (v37 & 1)) {
        goto LABEL_38;
      }
      unint64_t v31 = v36;
    }
    uint64_t v4 = v27;
    uint64_t v38 = v54;
    uint64_t v7 = v25;
    if (v35)
    {
      (*(void (**)(unint64_t, char *, uint64_t))(v48 + 40))(v54[7] + *(void *)(v48 + 72) * v31, v25, v4);
    }
    else
    {
      v54[(v31 >> 6) + 8] |= 1 << v31;
      unint64_t v39 = (uint64_t *)(v38[6] + 16 * v31);
      uint64_t *v39 = v21;
      v39[1] = v22;
      v24((char *)(v38[7] + *(void *)(v48 + 72) * v31), v25, v4);
      uint64_t v40 = v38[2];
      BOOL v41 = __OFADD__(v40, 1);
      uint64_t v42 = v40 + 1;
      if (v41) {
        goto LABEL_35;
      }
      long long v38[2] = v42;
      swift_bridgeObjectRetain();
    }
    a2 = v47;
    *uint64_t v47 = v54;
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    unint64_t v13 = v52;
    int64_t v14 = v53;
  }
  __break(1u);
LABEL_35:
  __break(1u);
LABEL_36:
  __break(1u);
LABEL_37:
  __break(1u);
LABEL_38:
  uint64_t result = sub_2380E5458();
  __break(1u);
  return result;
}

uint64_t sub_2380C8938(uint64_t a1, uint64_t *a2, uint64_t *a3, uint64_t *a4, uint64_t *a5, double a6, double a7, double a8)
{
  uint64_t v30 = a1 + 56;
  uint64_t v17 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v18 = -1;
  if (v17 < 64) {
    uint64_t v18 = ~(-1 << v17);
  }
  unint64_t v19 = v18 & *(void *)(a1 + 56);
  int64_t v31 = (unint64_t)(v17 + 63) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v21 = 0;
  if (!v19) {
    goto LABEL_5;
  }
LABEL_4:
  unint64_t v22 = __clz(__rbit64(v19));
  v19 &= v19 - 1;
  for (unint64_t i = v22 | (v21 << 6); ; unint64_t i = __clz(__rbit64(v25)) + (v21 << 6))
  {
    uint64_t v27 = (uint64_t *)(*(void *)(a1 + 48) + 16 * i);
    uint64_t v28 = v27[1];
    v32[0] = *v27;
    v32[1] = v28;
    swift_bridgeObjectRetain();
    sub_2380C949C(v32, a2, a3, a4, a5, a6, a7, a8);
    if (v8)
    {
      swift_release();
      return swift_bridgeObjectRelease();
    }
    uint64_t result = swift_bridgeObjectRelease();
    if (v19) {
      goto LABEL_4;
    }
LABEL_5:
    if (__OFADD__(v21++, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v21 >= v31) {
      return swift_release();
    }
    unint64_t v25 = *(void *)(v30 + 8 * v21);
    if (!v25)
    {
      int64_t v26 = v21 + 1;
      if (v21 + 1 >= v31) {
        return swift_release();
      }
      unint64_t v25 = *(void *)(v30 + 8 * v26);
      if (v25) {
        goto LABEL_14;
      }
      int64_t v26 = v21 + 2;
      if (v21 + 2 >= v31) {
        return swift_release();
      }
      unint64_t v25 = *(void *)(v30 + 8 * v26);
      if (v25) {
        goto LABEL_14;
      }
      int64_t v26 = v21 + 3;
      if (v21 + 3 >= v31) {
        return swift_release();
      }
      unint64_t v25 = *(void *)(v30 + 8 * v26);
      if (v25)
      {
LABEL_14:
        int64_t v21 = v26;
        goto LABEL_15;
      }
      int64_t v29 = v21 + 4;
      if (v21 + 4 >= v31) {
        return swift_release();
      }
      unint64_t v25 = *(void *)(v30 + 8 * v29);
      v21 += 4;
      if (!v25) {
        break;
      }
    }
LABEL_15:
    unint64_t v19 = (v25 - 1) & v25;
  }
  while (1)
  {
    int64_t v21 = v29 + 1;
    if (__OFADD__(v29, 1)) {
      break;
    }
    if (v21 >= v31) {
      return swift_release();
    }
    unint64_t v25 = *(void *)(v30 + 8 * v21);
    ++v29;
    if (v25) {
      goto LABEL_15;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_2380C8B60()
{
  uint64_t result = sub_237F3C988((uint64_t)&unk_26EAF7BA8);
  qword_26894D5A8 = result;
  return result;
}

uint64_t sub_2380C8B88()
{
  uint64_t v0 = (void *)sub_237F3C11C((uint64_t)&unk_26EAF3DA8);
  uint64_t result = swift_arrayDestroy();
  off_26894D5B0 = v0;
  return result;
}

uint64_t sub_2380C8BD4(uint64_t a1)
{
  return sub_2380C8C58(a1, &qword_26894AA58, (uint64_t)&qword_2689564A8, &qword_26894D5B8);
}

uint64_t sub_2380C8C00(uint64_t a1)
{
  return sub_2380C8C58(a1, &qword_26894AA60, (uint64_t)&qword_2689564B0, &qword_26894D5C0);
}

uint64_t sub_2380C8C2C(uint64_t a1)
{
  return sub_2380C8C58(a1, &qword_26894AA68, (uint64_t)&qword_2689564B8, &qword_26894D5C8);
}

uint64_t sub_2380C8C58(uint64_t a1, void *a2, uint64_t a3, uint64_t *a4)
{
  if (*a2 != -1) {
    swift_once();
  }
  uint64_t v5 = swift_bridgeObjectRetain();
  uint64_t v6 = sub_237FEBB24(v5);
  uint64_t result = swift_bridgeObjectRelease();
  *a4 = v6;
  return result;
}

uint64_t sub_2380C8CC0()
{
  uint64_t v0 = sub_237FEB820((uint64_t)&unk_26EAF3DE8);
  uint64_t result = swift_arrayDestroy();
  qword_2689565F0 = v0;
  return result;
}

unint64_t sub_2380C8D0C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26894C5B0);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_2380EC930;
  *(void *)(inited + 32) = 0xD000000000000019;
  *(void *)(inited + 40) = 0x80000002380F0F40;
  uint64_t v7 = *v2;
  uint64_t v8 = 0;
  uint64_t v9 = 0;
  if (*(void *)(v7 + 16))
  {
    swift_bridgeObjectRetain();
    unint64_t v10 = sub_237EC9470(a1, a2);
    if (v11) {
      uint64_t v9 = *(void *)(*(void *)(v7 + 56) + 8 * v10);
    }
    swift_bridgeObjectRelease();
  }
  uint64_t v12 = MEMORY[0x263F8D538];
  *(void *)(inited + 48) = v9;
  *(void *)(inited + 72) = v12;
  *(void *)(inited + 80) = 0xD00000000000001CLL;
  *(void *)(inited + 88) = 0x80000002380F0F60;
  uint64_t v13 = v3[1];
  if (*(void *)(v13 + 16))
  {
    swift_bridgeObjectRetain();
    unint64_t v14 = sub_237EC9470(a1, a2);
    if (v15) {
      uint64_t v8 = *(void *)(*(void *)(v13 + 56) + 8 * v14);
    }
    swift_bridgeObjectRelease();
  }
  *(void *)(inited + 96) = v8;
  *(void *)(inited + 120) = v12;
  *(void *)(inited + 128) = 0x4674726F70707573;
  *(void *)(inited + 136) = 0xEB0000000067616CLL;
  uint64_t v16 = 0;
  if (sub_237EE54E4(a1, a2, v3[2])) {
    double v17 = 1.0;
  }
  else {
    double v17 = 0.0;
  }
  *(double *)(inited + 144) = v17;
  *(void *)(inited + 168) = v12;
  *(void *)(inited + 176) = 0x466E726F63696E75;
  *(void *)(inited + 184) = 0xEB0000000067616CLL;
  if (sub_237EE54E4(a1, a2, v3[3])) {
    double v18 = 1.0;
  }
  else {
    double v18 = 0.0;
  }
  *(double *)(inited + 192) = v18;
  *(void *)(inited + 216) = v12;
  *(void *)(inited + 224) = 0xD000000000000013;
  *(void *)(inited + 232) = 0x80000002380F0F80;
  if (sub_237EE54E4(a1, a2, v3[4])) {
    double v19 = 1.0;
  }
  else {
    double v19 = 0.0;
  }
  *(double *)(inited + 240) = v19;
  *(void *)(inited + 264) = v12;
  *(void *)(inited + 272) = 825389430;
  *(void *)(inited + 280) = 0xE400000000000000;
  uint64_t v20 = v3[5];
  if (*(void *)(v20 + 16))
  {
    swift_bridgeObjectRetain();
    unint64_t v21 = sub_237EC9470(a1, a2);
    if (v22) {
      uint64_t v16 = *(void *)(*(void *)(v20 + 56) + 8 * v21);
    }
    swift_bridgeObjectRelease();
  }
  *(void *)(inited + 312) = v12;
  *(void *)(inited + 288) = v16;
  return sub_237FCF0C4(inited);
}

uint64_t sub_2380C8F44(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = v3[1];
  uint64_t v9 = 0;
  uint64_t v10 = 0;
  if (*(void *)(v8 + 16))
  {
    swift_bridgeObjectRetain();
    unint64_t v11 = sub_237EC9470(a1, a2);
    if (v12) {
      uint64_t v10 = *(void *)(*(void *)(v8 + 56) + 8 * v11);
    }
    swift_bridgeObjectRelease();
  }
  *(void *)(a3 + 96) = v10;
  uint64_t v13 = *v4;
  if (*(void *)(*v4 + 16))
  {
    swift_bridgeObjectRetain();
    unint64_t v14 = sub_237EC9470(a1, a2);
    if (v15) {
      uint64_t v9 = *(void *)(*(void *)(v13 + 56) + 8 * v14);
    }
    swift_bridgeObjectRelease();
  }
  *(void *)(a3 + 120) = v9;
  uint64_t v16 = 0;
  if (sub_237EE54E4(a1, a2, v4[2])) {
    double v17 = 1.0;
  }
  else {
    double v17 = 0.0;
  }
  *(double *)(a3 + 104) = v17;
  if (sub_237EE54E4(a1, a2, v4[3])) {
    double v18 = 1.0;
  }
  else {
    double v18 = 0.0;
  }
  *(double *)(a3 + 176) = v18;
  uint64_t result = sub_237EE54E4(a1, a2, v4[4]);
  if (result) {
    double v20 = 1.0;
  }
  else {
    double v20 = 0.0;
  }
  *(double *)(a3 + 16) = v20;
  uint64_t v21 = v4[5];
  if (*(void *)(v21 + 16))
  {
    swift_bridgeObjectRetain();
    unint64_t v22 = sub_237EC9470(a1, a2);
    if (v23) {
      uint64_t v16 = *(void *)(*(void *)(v21 + 56) + 8 * v22);
    }
    uint64_t result = swift_bridgeObjectRelease();
  }
  *(void *)(a3 + 32) = v16;
  return result;
}

uint64_t sub_2380C9094(uint64_t *a1, uint64_t a2, uint64_t *a3, void *a4, void *a5)
{
  uint64_t v8 = *a1;
  uint64_t v7 = a1[1];
  if (a2 && *(void *)(a2 + 16))
  {
    swift_bridgeObjectRetain();
    unint64_t v10 = sub_237EC9470(v8, v7);
    if (v11)
    {
      char v12 = *(void **)(*(void *)(a2 + 56) + 8 * v10);
      swift_bridgeObjectRetain();
    }
    else
    {
      char v12 = (void *)MEMORY[0x263F8EE78];
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    char v12 = (void *)MEMORY[0x263F8EE78];
  }
  double v13 = 0.05;
  unint64_t v14 = (double *)&protocol conformance descriptor for AirPlayRouteSetupState;
  double v15 = 0.05;
  uint64_t v44 = v12[2];
  if (v44)
  {
    uint64_t v42 = a4;
    uint64_t v39 = v8;
    uint64_t v40 = v7;
    BOOL v41 = a5;
    swift_bridgeObjectRetain();
    uint64_t v16 = 0;
    double v15 = 0.05;
    do
    {
      double v17 = &v12[2 * v16 + 4];
      uint64_t v18 = *v17;
      uint64_t v19 = v17[1];
      uint64_t v20 = qword_26894AC10;
      swift_bridgeObjectRetain();
      if (v20 != -1) {
        swift_once();
      }
      uint64_t v21 = off_26894D5B0;
      if (*((void *)off_26894D5B0 + 2))
      {
        sub_2380E54E8();
        sub_2380E49E8();
        uint64_t v22 = sub_2380E5538();
        uint64_t v23 = -1 << v21[32];
        unint64_t v24 = v22 & ~v23;
        if ((*(void *)&v21[((v24 >> 3) & 0xFFFFFFFFFFFFFF8) + 56] >> v24))
        {
          uint64_t v25 = *((void *)v21 + 6);
          int64_t v26 = (void *)(v25 + 16 * v24);
          BOOL v27 = *v26 == v18 && v26[1] == v19;
          if (v27 || (sub_2380E5408() & 1) != 0)
          {
LABEL_26:
            swift_bridgeObjectRelease();
            unint64_t v14 = (double *)&protocol conformance descriptor for AirPlayRouteSetupState;
            double v15 = 1.05;
            a5 = v41;
            uint64_t v8 = v39;
            uint64_t v7 = v40;
            goto LABEL_27;
          }
          while (1)
          {
            unint64_t v24 = (v24 + 1) & ~v23;
            if (((*(void *)&v21[((v24 >> 3) & 0xFFFFFFFFFFFFFF8) + 56] >> v24) & 1) == 0) {
              break;
            }
            uint64_t v28 = (void *)(v25 + 16 * v24);
            BOOL v29 = *v28 == v18 && v28[1] == v19;
            if (v29 || (sub_2380E5408() & 1) != 0) {
              goto LABEL_26;
            }
          }
        }
      }
      ++v16;
      swift_bridgeObjectRelease();
    }
    while (v16 != v44);
    a5 = v41;
    uint64_t v8 = v39;
    uint64_t v7 = v40;
    unint64_t v14 = (double *)&protocol conformance descriptor for AirPlayRouteSetupState;
LABEL_27:
    swift_bridgeObjectRelease();
    a4 = v42;
  }
  char v30 = sub_237EE5620(0xD000000000000017, 0x80000002380F0EC0, v12);
  double v31 = v14[234];
  if (v30) {
    double v32 = v14[234];
  }
  else {
    double v32 = 0.05;
  }
  if (sub_237EE5620(0xD000000000000019, 0x80000002380F0EE0, v12)) {
    double v13 = v31;
  }
  char v33 = sub_237EE5620(0xD000000000000014, 0x80000002380F0F20, v12);
  swift_bridgeObjectRelease();
  if (v33)
  {
    double v13 = v13 * 0.5;
    double v34 = v32 * 0.5;
  }
  else
  {
    double v34 = v32;
  }
  if (v33) {
    double v15 = v15 * 0.5;
  }
  swift_bridgeObjectRetain();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v45 = *a3;
  *a3 = 0x8000000000000000;
  sub_237FA1A2C(v8, v7, isUniquelyReferenced_nonNull_native, v15);
  *a3 = v45;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  char v36 = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v46 = *a4;
  *a4 = 0x8000000000000000;
  sub_237FA1A2C(v8, v7, v36, v34);
  *a4 = v46;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  char v37 = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v47 = *a5;
  *a5 = 0x8000000000000000;
  sub_237FA1A2C(v8, v7, v37, v13);
  *a5 = v47;
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2380C949C(uint64_t *a1, uint64_t *a2, uint64_t *a3, uint64_t *a4, uint64_t *a5, double a6, double a7, double a8)
{
  uint64_t v16 = *a1;
  uint64_t v15 = a1[1];
  swift_beginAccess();
  uint64_t v17 = *a3;
  uint64_t v18 = *(void *)(v17 + 16);
  swift_bridgeObjectRetain();
  if (!v18 || (unint64_t v19 = sub_237EC9470(v16, v15), (v20 & 1) == 0))
  {
    swift_endAccess();
    __break(1u);
    goto LABEL_9;
  }
  double v21 = *(double *)(*(void *)(v17 + 56) + 8 * v19);
  swift_endAccess();
  swift_beginAccess();
  uint64_t v22 = *a4;
  if (!*(void *)(*a4 + 16))
  {
LABEL_10:
    swift_endAccess();
    __break(1u);
LABEL_11:
    swift_bridgeObjectRelease();
    goto LABEL_12;
  }
  swift_bridgeObjectRetain();
  unint64_t v23 = sub_237EC9470(v16, v15);
  if ((v24 & 1) == 0)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    goto LABEL_10;
  }
  double v25 = *(double *)(*(void *)(v22 + 56) + 8 * v23);
  swift_endAccess();
  swift_bridgeObjectRelease();
  swift_beginAccess();
  uint64_t v26 = *a5;
  if (*(void *)(*a5 + 16))
  {
    swift_bridgeObjectRetain();
    unint64_t v27 = sub_237EC9470(v16, v15);
    if (v28)
    {
      double v29 = v21 * a6 + v25 * a7;
      double v30 = *(double *)(*(void *)(v26 + 56) + 8 * v27);
      swift_endAccess();
      swift_bridgeObjectRelease();
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v33 = *a2;
      *a2 = 0x8000000000000000;
      sub_237FA1A2C(v16, v15, isUniquelyReferenced_nonNull_native, v29 + v30 * a8);
      *a2 = v33;
      swift_bridgeObjectRelease();
      return swift_bridgeObjectRelease();
    }
    goto LABEL_11;
  }
LABEL_12:
  uint64_t result = swift_endAccess();
  __break(1u);
  return result;
}

double sub_2380C9694()
{
  return *(double *)(v0 + 48);
}

uint64_t sub_2380C969C()
{
  if (qword_26894AC30 != -1) {
    swift_once();
  }
  return swift_bridgeObjectRetain();
}

unint64_t *sub_2380C9700(uint64_t isStackAllocationSafe)
{
  uint64_t v2 = (unint64_t *)isStackAllocationSafe;
  v9[1] = *MEMORY[0x263EF8340];
  char v3 = *(unsigned char *)(isStackAllocationSafe + 32);
  unint64_t v4 = (unint64_t)((1 << v3) + 63) >> 6;
  size_t v5 = 8 * v4;
  if ((v3 & 0x3Fu) <= 0xD
    || (isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), (isStackAllocationSafe & 1) != 0))
  {
    MEMORY[0x270FA5388](isStackAllocationSafe);
    bzero((char *)v9 - ((v5 + 15) & 0x3FFFFFFFFFFFFFF0), v5);
    uint64_t v6 = sub_2380C99B0((void *)((char *)v9 - ((v5 + 15) & 0x3FFFFFFFFFFFFFF0)), v4, (uint64_t)v2);
    if (v1) {
      swift_willThrow();
    }
    else {
      return v6;
    }
  }
  else
  {
    uint64_t v7 = (void *)swift_slowAlloc();
    bzero(v7, v5);
    uint64_t v2 = sub_2380C99B0((unint64_t *)v7, v4, (uint64_t)v2);
    MEMORY[0x23EC87710](v7, -1, -1);
  }
  return v2;
}

unint64_t *sub_2380C9858(uint64_t isStackAllocationSafe)
{
  uint64_t v2 = (unint64_t *)isStackAllocationSafe;
  v9[1] = *MEMORY[0x263EF8340];
  char v3 = *(unsigned char *)(isStackAllocationSafe + 32);
  unint64_t v4 = (unint64_t)((1 << v3) + 63) >> 6;
  size_t v5 = 8 * v4;
  if ((v3 & 0x3Fu) <= 0xD
    || (isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), (isStackAllocationSafe & 1) != 0))
  {
    MEMORY[0x270FA5388](isStackAllocationSafe);
    bzero((char *)v9 - ((v5 + 15) & 0x3FFFFFFFFFFFFFF0), v5);
    uint64_t v6 = sub_2380A8D6C((void *)((char *)v9 - ((v5 + 15) & 0x3FFFFFFFFFFFFFF0)), v4, (uint64_t)v2);
    if (v1) {
      swift_willThrow();
    }
    else {
      return v6;
    }
  }
  else
  {
    uint64_t v7 = (void *)swift_slowAlloc();
    bzero(v7, v5);
    uint64_t v2 = sub_2380A8D6C((unint64_t *)v7, v4, (uint64_t)v2);
    MEMORY[0x23EC87710](v7, -1, -1);
  }
  return v2;
}

unint64_t *sub_2380C99B0(unint64_t *result, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = 0;
  int64_t v5 = 0;
  uint64_t v6 = a3 + 64;
  uint64_t v7 = 1 << *(unsigned char *)(a3 + 32);
  uint64_t v8 = -1;
  if (v7 < 64) {
    uint64_t v8 = ~(-1 << v7);
  }
  unint64_t v9 = v8 & *(void *)(a3 + 64);
  int64_t v10 = (unint64_t)(v7 + 63) >> 6;
  while (1)
  {
    if (v9)
    {
      unint64_t v11 = __clz(__rbit64(v9));
      v9 &= v9 - 1;
      unint64_t v12 = v11 | (v5 << 6);
      goto LABEL_5;
    }
    int64_t v13 = v5 + 1;
    if (__OFADD__(v5, 1))
    {
      __break(1u);
      goto LABEL_26;
    }
    if (v13 >= v10) {
      return (unint64_t *)sub_2380D94B0(result, a2, v4, a3);
    }
    unint64_t v14 = *(void *)(v6 + 8 * v13);
    ++v5;
    if (!v14)
    {
      int64_t v5 = v13 + 1;
      if (v13 + 1 >= v10) {
        return (unint64_t *)sub_2380D94B0(result, a2, v4, a3);
      }
      unint64_t v14 = *(void *)(v6 + 8 * v5);
      if (!v14)
      {
        int64_t v5 = v13 + 2;
        if (v13 + 2 >= v10) {
          return (unint64_t *)sub_2380D94B0(result, a2, v4, a3);
        }
        unint64_t v14 = *(void *)(v6 + 8 * v5);
        if (!v14) {
          break;
        }
      }
    }
LABEL_20:
    unint64_t v9 = (v14 - 1) & v14;
    unint64_t v12 = __clz(__rbit64(v14)) + (v5 << 6);
LABEL_5:
    if (*(void *)(*(void *)(a3 + 56) + 8 * v12) == 2)
    {
      *(unint64_t *)((char *)result + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
      if (__OFADD__(v4++, 1))
      {
        __break(1u);
        return (unint64_t *)sub_2380D94B0(result, a2, v4, a3);
      }
    }
  }
  int64_t v15 = v13 + 3;
  if (v15 >= v10) {
    return (unint64_t *)sub_2380D94B0(result, a2, v4, a3);
  }
  unint64_t v14 = *(void *)(v6 + 8 * v15);
  if (v14)
  {
    int64_t v5 = v15;
    goto LABEL_20;
  }
  while (1)
  {
    int64_t v5 = v15 + 1;
    if (__OFADD__(v15, 1)) {
      break;
    }
    if (v5 >= v10) {
      return (unint64_t *)sub_2380D94B0(result, a2, v4, a3);
    }
    unint64_t v14 = *(void *)(v6 + 8 * v5);
    ++v15;
    if (v14) {
      goto LABEL_20;
    }
  }
LABEL_26:
  __break(1u);
  return result;
}

uint64_t sub_2380C9B00(uint64_t a1, uint64_t a2, uint64_t *a3, void *a4, void *a5)
{
  uint64_t v24 = a1 + 56;
  uint64_t v11 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v12 = -1;
  if (v11 < 64) {
    uint64_t v12 = ~(-1 << v11);
  }
  unint64_t v13 = v12 & *(void *)(a1 + 56);
  int64_t v26 = (unint64_t)(v11 + 63) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v15 = 0;
  if (!v13) {
    goto LABEL_5;
  }
LABEL_4:
  unint64_t v16 = __clz(__rbit64(v13));
  v13 &= v13 - 1;
  for (unint64_t i = v16 | (v15 << 6); ; unint64_t i = __clz(__rbit64(v19)) + (v15 << 6))
  {
    double v21 = (uint64_t *)(*(void *)(a1 + 48) + 16 * i);
    uint64_t v22 = v21[1];
    v25[0] = *v21;
    v25[1] = v22;
    swift_bridgeObjectRetain();
    sub_2380C9094(v25, a2, a3, a4, a5);
    if (v5)
    {
      swift_release();
      return swift_bridgeObjectRelease();
    }
    uint64_t result = swift_bridgeObjectRelease();
    if (v13) {
      goto LABEL_4;
    }
LABEL_5:
    if (__OFADD__(v15++, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v15 >= v26) {
      return swift_release();
    }
    unint64_t v19 = *(void *)(v24 + 8 * v15);
    if (!v19)
    {
      int64_t v20 = v15 + 1;
      if (v15 + 1 >= v26) {
        return swift_release();
      }
      unint64_t v19 = *(void *)(v24 + 8 * v20);
      if (v19) {
        goto LABEL_14;
      }
      int64_t v20 = v15 + 2;
      if (v15 + 2 >= v26) {
        return swift_release();
      }
      unint64_t v19 = *(void *)(v24 + 8 * v20);
      if (v19) {
        goto LABEL_14;
      }
      int64_t v20 = v15 + 3;
      if (v15 + 3 >= v26) {
        return swift_release();
      }
      unint64_t v19 = *(void *)(v24 + 8 * v20);
      if (v19)
      {
LABEL_14:
        int64_t v15 = v20;
        goto LABEL_15;
      }
      int64_t v23 = v15 + 4;
      if (v15 + 4 >= v26) {
        return swift_release();
      }
      unint64_t v19 = *(void *)(v24 + 8 * v23);
      v15 += 4;
      if (!v19) {
        break;
      }
    }
LABEL_15:
    unint64_t v13 = (v19 - 1) & v19;
  }
  while (1)
  {
    int64_t v15 = v23 + 1;
    if (__OFADD__(v23, 1)) {
      break;
    }
    if (v15 >= v26) {
      return swift_release();
    }
    unint64_t v19 = *(void *)(v24 + 8 * v15);
    ++v23;
    if (v19) {
      goto LABEL_15;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_2380C9D00(uint64_t a1, uint64_t a2, void (*a3)(char *, uint64_t, uint64_t, uint64_t), void *a4)
{
  char v35 = a3;
  uint64_t v7 = sub_2380E4528();
  uint64_t v34 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  unint64_t v9 = (char *)&v33 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26894D4B8);
  uint64_t v11 = MEMORY[0x270FA5388](v10 - 8);
  unint64_t v13 = (char *)&v33 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  int64_t v15 = (char *)&v33 - v14;
  uint64_t v16 = sub_2380E3CF8();
  uint64_t v17 = *(void *)(v16 - 8);
  MEMORY[0x270FA5388](v16);
  unint64_t v19 = (char *)&v33 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v36 = a4;
  uint64_t v20 = *a4;
  if (!*(void *)(v20 + 16))
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v17 + 56))(v15, 1, 1, v16);
    return sub_237F098FC((uint64_t)v15, &qword_26894D4B8);
  }
  swift_bridgeObjectRetain();
  uint64_t v33 = a1;
  unint64_t v21 = sub_237EC9470(a1, a2);
  if (v22)
  {
    (*(void (**)(char *, unint64_t, uint64_t))(v17 + 16))(v15, *(void *)(v20 + 56) + *(void *)(v17 + 72) * v21, v16);
    int64_t v23 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v17 + 56);
    v23(v15, 0, 1, v16);
  }
  else
  {
    int64_t v23 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v17 + 56);
    v23(v15, 1, 1, v16);
  }
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v17 + 48))(v15, 1, v16) == 1) {
    return sub_237F098FC((uint64_t)v15, &qword_26894D4B8);
  }
  (*(void (**)(char *, char *, uint64_t))(v17 + 32))(v19, v15, v16);
  sub_2380E2DB8();
  if (v25 <= 0.0)
  {
    sub_2380E3CC8();
  }
  else
  {
    if (qword_26894AA20 != -1) {
      swift_once();
    }
    uint64_t v26 = __swift_project_value_buffer(v7, (uint64_t)qword_268956458);
    (*(void (**)(char *, uint64_t, uint64_t))(v34 + 16))(v9, v26, v7);
    unint64_t v27 = sub_2380E4508();
    os_log_type_t v28 = sub_2380E4D48();
    if (os_log_type_enabled(v27, v28))
    {
      double v29 = (uint8_t *)swift_slowAlloc();
      char v35 = v23;
      double v30 = v29;
      *(_WORD *)double v29 = 0;
      _os_log_impl(&dword_237EB8000, v27, v28, "HistoryStats cannot add instance from the future", v29, 2u);
      double v31 = v30;
      int64_t v23 = v35;
      MEMORY[0x23EC87710](v31, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v34 + 8))(v9, v7);
  }
  uint64_t v32 = v33;
  (*(void (**)(char *, char *, uint64_t))(v17 + 16))(v13, v19, v16);
  v23(v13, 0, 1, v16);
  swift_bridgeObjectRetain();
  sub_2380AC00C((uint64_t)v13, v32, a2);
  return (*(uint64_t (**)(char *, uint64_t))(v17 + 8))(v19, v16);
}

uint64_t sub_2380CA14C(unint64_t *a1, uint64_t a2, void *a3, uint64_t a4)
{
  uint64_t v43 = a2;
  uint64_t v44 = a1;
  uint64_t v54 = __swift_instantiateConcreteTypeFromMangledName(&qword_26894B3B0);
  MEMORY[0x270FA5388](v54);
  uint64_t v7 = (uint64_t *)((char *)&v42 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v8 = sub_2380E3CF8();
  uint64_t result = MEMORY[0x270FA5388](v8);
  unint64_t v59 = (char *)&v42 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v45 = 0;
  int64_t v12 = 0;
  char v55 = a3;
  uint64_t v15 = a3[8];
  uint64_t v14 = a3 + 8;
  uint64_t v13 = v15;
  uint64_t v16 = 1 << *((unsigned char *)v14 - 32);
  if (v16 < 64) {
    uint64_t v17 = ~(-1 << v16);
  }
  else {
    uint64_t v17 = -1;
  }
  unint64_t v18 = v17 & v13;
  uint64_t v47 = v14;
  int64_t v48 = (unint64_t)(v16 + 63) >> 6;
  uint64_t v52 = v10 + 16;
  uint64_t v46 = a4 + 56;
  uint64_t v53 = v10;
  uint64_t v49 = (void (**)(char *, uint64_t))(v10 + 8);
  uint64_t v50 = v7;
  uint64_t v56 = a4;
  uint64_t v51 = result;
  while (v18)
  {
    uint64_t v57 = (v18 - 1) & v18;
    int64_t v58 = v12;
    unint64_t v19 = __clz(__rbit64(v18)) | (v12 << 6);
LABEL_23:
    uint64_t v24 = (uint64_t *)(v55[6] + 16 * v19);
    uint64_t v25 = *v24;
    uint64_t v26 = v24[1];
    unint64_t v27 = *(void (**)(char *, unint64_t, uint64_t))(v53 + 16);
    os_log_type_t v28 = v59;
    v27(v59, v55[7] + *(void *)(v53 + 72) * v19, v8);
    void *v7 = v25;
    v7[1] = v26;
    v27((char *)v7 + *(int *)(v54 + 48), (unint64_t)v28, v8);
    if (!*(void *)(a4 + 16))
    {
      swift_bridgeObjectRetain_n();
      goto LABEL_6;
    }
    sub_2380E54E8();
    swift_bridgeObjectRetain_n();
    sub_2380E49E8();
    uint64_t v29 = sub_2380E5538();
    uint64_t v30 = -1 << *(unsigned char *)(a4 + 32);
    unint64_t v31 = v29 & ~v30;
    uint64_t v32 = v46;
    if ((*(void *)(v46 + ((v31 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v31))
    {
      uint64_t v33 = *(void *)(v56 + 48);
      uint64_t v34 = (void *)(v33 + 16 * v31);
      BOOL v35 = *v34 == v25 && v34[1] == v26;
      if (!v35 && (sub_2380E5408() & 1) == 0)
      {
        uint64_t v36 = ~v30;
        for (unint64_t i = v31 + 1; ; unint64_t i = v38 + 1)
        {
          uint64_t v38 = i & v36;
          if (((*(void *)(v32 + (((i & v36) >> 3) & 0xFFFFFFFFFFFFFF8)) >> (i & v36)) & 1) == 0) {
            break;
          }
          uint64_t v39 = (void *)(v33 + 16 * v38);
          BOOL v40 = *v39 == v25 && v39[1] == v26;
          if (v40 || (sub_2380E5408() & 1) != 0) {
            goto LABEL_38;
          }
        }
        goto LABEL_6;
      }
LABEL_38:
      uint64_t v7 = v50;
      sub_237F098FC((uint64_t)v50, &qword_26894B3B0);
      uint64_t v8 = v51;
      (*v49)(v59, v51);
      uint64_t result = swift_bridgeObjectRelease();
      *(unint64_t *)((char *)v44 + ((v19 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v19;
      BOOL v41 = __OFADD__(v45++, 1);
      a4 = v56;
      unint64_t v18 = v57;
      int64_t v12 = v58;
      if (v41)
      {
        __break(1u);
        return sub_2380D90F4(v44, v43, v45, v55);
      }
    }
    else
    {
LABEL_6:
      uint64_t v7 = v50;
      sub_237F098FC((uint64_t)v50, &qword_26894B3B0);
      uint64_t v8 = v51;
      (*v49)(v59, v51);
      uint64_t result = swift_bridgeObjectRelease();
      a4 = v56;
      unint64_t v18 = v57;
      int64_t v12 = v58;
    }
  }
  int64_t v20 = v12 + 1;
  if (__OFADD__(v12, 1))
  {
    __break(1u);
    goto LABEL_43;
  }
  if (v20 >= v48) {
    return sub_2380D90F4(v44, v43, v45, v55);
  }
  unint64_t v21 = v47[v20];
  int64_t v22 = v12 + 1;
  if (v21) {
    goto LABEL_22;
  }
  int64_t v22 = v12 + 2;
  if (v12 + 2 >= v48) {
    return sub_2380D90F4(v44, v43, v45, v55);
  }
  unint64_t v21 = v47[v22];
  if (v21) {
    goto LABEL_22;
  }
  int64_t v22 = v12 + 3;
  if (v12 + 3 >= v48) {
    return sub_2380D90F4(v44, v43, v45, v55);
  }
  unint64_t v21 = v47[v22];
  if (v21)
  {
LABEL_22:
    uint64_t v57 = (v21 - 1) & v21;
    int64_t v58 = v22;
    unint64_t v19 = __clz(__rbit64(v21)) + (v22 << 6);
    goto LABEL_23;
  }
  uint64_t v23 = v12 + 4;
  if (v12 + 4 >= v48) {
    return sub_2380D90F4(v44, v43, v45, v55);
  }
  unint64_t v21 = v47[v23];
  if (v21)
  {
    int64_t v22 = v12 + 4;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v22 = v23 + 1;
    if (__OFADD__(v23, 1)) {
      break;
    }
    if (v22 >= v48) {
      return sub_2380D90F4(v44, v43, v45, v55);
    }
    unint64_t v21 = v47[v22];
    ++v23;
    if (v21) {
      goto LABEL_22;
    }
  }
LABEL_43:
  __break(1u);
  return result;
}

uint64_t sub_2380CA608(uint64_t a1, uint64_t a2)
{
  v13[1] = *MEMORY[0x263EF8340];
  char v5 = *(unsigned char *)(a1 + 32);
  unsigned int v6 = v5 & 0x3F;
  unint64_t v7 = (unint64_t)((1 << v5) + 63) >> 6;
  size_t v8 = 8 * v7;
  uint64_t isStackAllocationSafe = swift_bridgeObjectRetain_n();
  if (v6 <= 0xD || (uint64_t isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), (isStackAllocationSafe & 1) != 0))
  {
    MEMORY[0x270FA5388](isStackAllocationSafe);
    bzero((char *)v13 - ((v8 + 15) & 0x3FFFFFFFFFFFFFF0), v8);
    swift_bridgeObjectRetain();
    uint64_t v10 = sub_2380CA14C((void *)((char *)v13 - ((v8 + 15) & 0x3FFFFFFFFFFFFFF0)), v7, (void *)a1, a2);
    swift_bridgeObjectRelease();
    if (v2) {
      swift_willThrow();
    }
    swift_bridgeObjectRelease_n();
  }
  else
  {
    uint64_t v11 = (void *)swift_slowAlloc();
    bzero(v11, v8);
    swift_bridgeObjectRetain();
    uint64_t v10 = sub_2380CA14C((unint64_t *)v11, v7, (void *)a1, a2);
    swift_bridgeObjectRelease();
    MEMORY[0x23EC87710](v11, -1, -1);
    swift_bridgeObjectRelease_n();
  }
  return v10;
}

uint64_t sub_2380CA7C4(uint64_t a1, uint64_t a2)
{
  uint64_t v272 = sub_2380E2E28();
  uint64_t v271 = *(void *)(v272 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v272);
  v260 = (char *)&v250 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  v270 = (void (*)(char *, uint64_t, uint64_t, uint64_t))((char *)&v250 - v6);
  uint64_t v7 = sub_2380E4528();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  v262 = (char *)&v250 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  v268 = (char *)&v250 - v12;
  uint64_t v13 = MEMORY[0x270FA5388](v11);
  v275 = (char *)&v250 - v14;
  uint64_t v15 = MEMORY[0x270FA5388](v13);
  v265 = (char *)&v250 - v16;
  uint64_t v17 = MEMORY[0x270FA5388](v15);
  v264 = (uint64_t *)((char *)&v250 - v18);
  uint64_t v19 = MEMORY[0x270FA5388](v17);
  v266 = (char *)&v250 - v20;
  uint64_t v21 = MEMORY[0x270FA5388](v19);
  v276 = (char *)&v250 - v22;
  MEMORY[0x270FA5388](v21);
  uint64_t v24 = (char *)&v250 - v23;
  uint64_t v278 = __swift_instantiateConcreteTypeFromMangledName(&qword_26894B8B0);
  uint64_t v25 = MEMORY[0x270FA5388](v278);
  v261 = (uint64_t *)((char *)&v250 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v27 = MEMORY[0x270FA5388](v25);
  v273 = (char *)&v250 - v28;
  uint64_t v29 = MEMORY[0x270FA5388](v27);
  v267 = (char *)&v250 - v30;
  uint64_t v31 = MEMORY[0x270FA5388](v29);
  v293 = (uint64_t *)((char *)&v250 - v32);
  uint64_t v33 = MEMORY[0x270FA5388](v31);
  uint64_t v297 = (uint64_t)&v250 - v34;
  uint64_t v35 = MEMORY[0x270FA5388](v33);
  uint64_t v263 = (uint64_t)&v250 - v36;
  uint64_t v37 = MEMORY[0x270FA5388](v35);
  v274 = (uint64_t (*)(uint64_t *, uint64_t))((char *)&v250 - v38);
  uint64_t v39 = MEMORY[0x270FA5388](v37);
  uint64_t v269 = (uint64_t)&v250 - v40;
  uint64_t v41 = MEMORY[0x270FA5388](v39);
  v290 = (uint64_t *)((char *)&v250 - v42);
  uint64_t v43 = MEMORY[0x270FA5388](v41);
  uint64_t v277 = (uint64_t)&v250 - v44;
  uint64_t v45 = MEMORY[0x270FA5388](v43);
  uint64_t v47 = (char *)&v250 - v46;
  MEMORY[0x270FA5388](v45);
  uint64_t v49 = (char *)&v250 - v48;
  uint64_t v304 = MEMORY[0x263F8EE80];
  uint64_t v286 = a1;
  sub_2380C8518(a1, &v304);
  uint64_t v296 = 0;
  unint64_t v50 = *(void *)(a2 + 16);
  uint64_t v295 = v8;
  uint64_t v294 = a2;
  unint64_t v298 = v50;
  if (!v50)
  {
LABEL_12:
    uint64_t v284 = 0;
    uint64_t v285 = 0;
LABEL_13:
    uint64_t v63 = sub_2380E35A8();
    uint64_t v64 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v63 - 8) + 56);
    int v288 = 1;
    v64(v49, 1, 1, v63);
    uint64_t v292 = 0;
    goto LABEL_14;
  }
  unint64_t v51 = v50;
  uint64_t v52 = a2 + 32;
  swift_bridgeObjectRetain();
  while (1)
  {
    sub_237ECEFFC(v52, (uint64_t)&v300);
    sub_237ECEFFC((uint64_t)&v300, (uint64_t)v299);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26894B320);
    if (swift_dynamicCast()) {
      break;
    }
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v300);
    v52 += 40;
    if (!--v51)
    {
      swift_bridgeObjectRelease();
LABEL_11:
      uint64_t v8 = v295;
      unint64_t v50 = v298;
      goto LABEL_12;
    }
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_237EC4D08(&v300, (uint64_t)&v302);
  if ((swift_dynamicCast() & 1) == 0) {
    goto LABEL_11;
  }
  uint64_t v285 = *((void *)&v300 + 1);
  uint64_t v53 = v300;
  uint64_t v284 = v301;
  if (!(void)v300)
  {
    uint64_t v8 = v295;
    unint64_t v50 = v298;
    goto LABEL_13;
  }
  swift_bridgeObjectRetain();
  uint64_t v54 = sub_2380E3948();
  uint64_t v56 = *(void *)(v53 + 16);
  uint64_t v8 = v295;
  uint64_t v292 = v53;
  if (v56 && (unint64_t v57 = sub_237EC9470(v54, v55), (v58 & 1) != 0))
  {
    unint64_t v59 = v57;
    uint64_t v60 = *(void *)(v53 + 56);
    uint64_t v61 = sub_2380E35A8();
    uint64_t v62 = *(void *)(v61 - 8);
    (*(void (**)(char *, unint64_t, uint64_t))(v62 + 16))(v49, v60 + *(void *)(v62 + 72) * v59, v61);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v62 + 56))(v49, 0, 1, v61);
    uint64_t v8 = v295;
  }
  else
  {
    uint64_t v135 = sub_2380E35A8();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v135 - 8) + 56))(v49, 1, 1, v135);
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  int v288 = 0;
  unint64_t v50 = v298;
LABEL_14:
  uint64_t v65 = v24;
  if (qword_26894AA20 != -1) {
    swift_once();
  }
  uint64_t v66 = __swift_project_value_buffer(v7, (uint64_t)qword_268956458);
  unint64_t v67 = *(void (**)(char *, uint64_t, uint64_t))(v8 + 16);
  uint64_t v281 = v66;
  uint64_t v282 = v8 + 16;
  v280 = v67;
  ((void (*)(char *))v67)(v24);
  sub_2380CFA30((uint64_t)v49, (uint64_t)v47);
  uint64_t v68 = sub_2380E4508();
  os_log_type_t v69 = sub_2380E4D38();
  BOOL v70 = os_log_type_enabled(v68, v69);
  uint64_t v291 = v7;
  if (v70)
  {
    BOOL v71 = (uint8_t *)swift_slowAlloc();
    long long v72 = v49;
    uint64_t v73 = swift_slowAlloc();
    uint64_t v302 = v73;
    *(_DWORD *)BOOL v71 = 136315138;
    sub_2380CFA30((uint64_t)v47, v277);
    uint64_t v74 = sub_2380E4988();
    *(void *)&long long v300 = sub_237EBC6BC(v74, v75, &v302);
    sub_2380E4FC8();
    uint64_t v7 = v291;
    swift_bridgeObjectRelease();
    sub_237F098FC((uint64_t)v47, &qword_26894B8B0);
    _os_log_impl(&dword_237EB8000, v68, v69, "CompoundSignal#activeScores current foregroundBundleMap is %s", v71, 0xCu);
    swift_arrayDestroy();
    uint64_t v76 = v73;
    uint64_t v49 = v72;
    unint64_t v50 = v298;
    MEMORY[0x23EC87710](v76, -1, -1);
    MEMORY[0x23EC87710](v71, -1, -1);

    v279 = *(void (**)(char *, uint64_t))(v295 + 8);
    v279(v65, v7);
  }
  else
  {
    sub_237F098FC((uint64_t)v47, &qword_26894B8B0);

    v279 = *(void (**)(char *, uint64_t))(v8 + 8);
    v279(v24, v7);
  }
  int v77 = v290;
  sub_2380CFA30((uint64_t)v49, (uint64_t)v290);
  uint64_t v78 = sub_2380E35A8();
  uint64_t v79 = *(void *)(v78 - 8);
  char v80 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v79 + 48);
  v290 = (uint64_t *)(v79 + 48);
  v289 = v80;
  unsigned int v81 = v80((uint64_t)v77, 1, v78);
  uint64_t v287 = v78;
  if (v81 == 1)
  {
    sub_237F098FC((uint64_t)v77, &qword_26894B8B0);
    goto LABEL_34;
  }
  uint64_t v82 = *(uint64_t (**)(uint64_t *, uint64_t))(v79 + 88);
  int v83 = v82(v77, v78);
  if (v83 == *MEMORY[0x263F744F8])
  {
    int v253 = v83;
    v254 = (uint64_t (*)(uint64_t, uint64_t))v82;
    uint64_t v255 = v79 + 88;
    v259 = v49;
    os_log_type_t v84 = *(void (**)(uint64_t, uint64_t))(v79 + 96);
    uint64_t v252 = v79 + 96;
    v251 = v84;
    v84((uint64_t)v77, v78);
    uint64_t v85 = *v77;
    uint64_t v86 = swift_bridgeObjectRetain();
    uint64_t v87 = v296;
    uint64_t v88 = sub_2380C9858(v86);
    swift_bridgeObjectRelease();
    uint64_t v89 = sub_2380ABEBC((uint64_t)v88);
    uint64_t v91 = v90;
    swift_release();
    id v92 = sub_2380C9700(v85);
    uint64_t v296 = v87;
    swift_bridgeObjectRelease();
    uint64_t v93 = sub_2380ABEBC((uint64_t)v92);
    uint64_t v95 = v94;
    swift_release();
    id v96 = v276;
    v280(v276, v281, v7);
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    unint64_t v97 = sub_2380E4508();
    os_log_type_t v98 = sub_2380E4D38();
    BOOL v99 = os_log_type_enabled(v97, v98);
    uint64_t v258 = v95;
    uint64_t v256 = v93;
    uint64_t v257 = v89;
    if (v99)
    {
      uint64_t v100 = v95;
      uint64_t v101 = swift_slowAlloc();
      uint64_t v250 = swift_slowAlloc();
      *(void *)&long long v300 = v250;
      *(_DWORD *)uint64_t v101 = 136315394;
      uint64_t v302 = v89;
      uint64_t v303 = v91;
      swift_bridgeObjectRetain();
      __swift_instantiateConcreteTypeFromMangledName(&qword_26894C560);
      uint64_t v283 = v79;
      uint64_t v102 = sub_2380E4988();
      uint64_t v302 = sub_237EBC6BC(v102, v103, (uint64_t *)&v300);
      sub_2380E4FC8();
      swift_bridgeObjectRelease_n();
      uint64_t v7 = v291;
      swift_bridgeObjectRelease();
      *(_WORD *)(v101 + 12) = 2080;
      uint64_t v302 = v93;
      uint64_t v303 = v100;
      swift_bridgeObjectRetain();
      uint64_t v104 = sub_2380E4988();
      uint64_t v302 = sub_237EBC6BC(v104, v105, (uint64_t *)&v300);
      sub_2380E4FC8();
      swift_bridgeObjectRelease_n();
      uint64_t v79 = v283;
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_237EB8000, v97, v98, "CompoundSignal#activeScores current foregroundBundleId is %s and last foregroundBundleId is %s", (uint8_t *)v101, 0x16u);
      uint64_t v106 = v250;
      swift_arrayDestroy();
      uint64_t v49 = v259;
      MEMORY[0x23EC87710](v106, -1, -1);
      MEMORY[0x23EC87710](v101, -1, -1);

      unsigned long long v107 = v276;
    }
    else
    {
      uint64_t v49 = v259;

      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      unsigned long long v107 = v96;
    }
    v279(v107, v7);
    uint64_t v108 = (uint64_t (*)(void, void))v274;
    if (v91)
    {
      swift_bridgeObjectRetain();
      uint64_t v109 = v270;
      sub_2380E2E18();
      uint64_t v110 = v257;
      sub_2380C9D00(v257, v91, v109, &v304);
      unint64_t v111 = *(void (**)(void (*)(char *, uint64_t, uint64_t, uint64_t), uint64_t))(v271 + 8);
      uint64_t v112 = v272;
      v111(v109, v272);
      sub_2380E2E18();
      sub_2380C9D00(v110, v91, v109, &v304);
      swift_bridgeObjectRelease();
      v111(v109, v112);
      uint64_t v78 = v287;
      if (!v258)
      {
LABEL_32:
        swift_bridgeObjectRelease();
        goto LABEL_33;
      }
      if (v110 == v256 && v91 == v258)
      {
        swift_bridgeObjectRelease();
        goto LABEL_32;
      }
      char v164 = sub_2380E5408();
      swift_bridgeObjectRelease();
      if (v164) {
        goto LABEL_32;
      }
    }
    else
    {
      uint64_t v78 = v287;
      if (!v258) {
        goto LABEL_32;
      }
    }
    if (v288)
    {
      uint64_t v165 = v269;
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v79 + 56))(v269, 1, 1, v78);
      uint64_t v166 = v266;
    }
    else
    {
      uint64_t v169 = v292;
      swift_bridgeObjectRetain();
      uint64_t v170 = sub_2380E3968();
      uint64_t v165 = v269;
      uint64_t v166 = v266;
      if (*(void *)(v169 + 16) && (unint64_t v172 = sub_237EC9470(v170, v171), (v173 & 1) != 0))
      {
        (*(void (**)(uint64_t, unint64_t, uint64_t))(v79 + 16))(v165, *(void *)(v169 + 56) + *(void *)(v79 + 72) * v172, v78);
        (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v79 + 56))(v165, 0, 1, v78);
      }
      else
      {
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v79 + 56))(v165, 1, 1, v78);
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    v280(v166, v281, v7);
    sub_2380CFA30(v165, (uint64_t)v108);
    v184 = sub_2380E4508();
    os_log_type_t v185 = sub_2380E4D38();
    if (os_log_type_enabled(v184, v185))
    {
      v186 = (uint8_t *)swift_slowAlloc();
      uint64_t v187 = swift_slowAlloc();
      uint64_t v302 = v187;
      *(_DWORD *)v186 = 136315138;
      sub_2380CFA30((uint64_t)v108, v277);
      uint64_t v188 = sub_2380E4988();
      *(void *)&long long v300 = sub_237EBC6BC(v188, v189, &v302);
      uint64_t v78 = v287;
      sub_2380E4FC8();
      uint64_t v7 = v291;
      swift_bridgeObjectRelease();
      sub_237F098FC((uint64_t)v274, &qword_26894B8B0);
      _os_log_impl(&dword_237EB8000, v184, v185, "CompoundSignal#activeScores foreground recency map is %s", v186, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x23EC87710](v187, -1, -1);
      MEMORY[0x23EC87710](v186, -1, -1);

      v190 = v266;
    }
    else
    {
      sub_237F098FC((uint64_t)v108, &qword_26894B8B0);

      v190 = v166;
    }
    v279(v190, v7);
    unint64_t v50 = v298;
    uint64_t v120 = v264;
    uint64_t v191 = v269;
    uint64_t v192 = v263;
    sub_2380CFA30(v269, v263);
    if (v289(v192, 1, v78) == 1)
    {
      sub_237F098FC(v191, &qword_26894B8B0);
      swift_bridgeObjectRelease();
      sub_237F098FC(v192, &qword_26894B8B0);
    }
    else
    {
      int v193 = v254(v192, v78);
      if (v193 == v253)
      {
        v251(v192, v78);
        uint64_t v194 = *(void *)v192;
        if (*(void *)(*(void *)v192 + 16))
        {
          uint64_t v195 = v258;
          swift_bridgeObjectRetain();
          unint64_t v196 = sub_237EC9470(v256, v195);
          if (v197)
          {
            uint64_t v198 = *(void *)(*(void *)(v194 + 56) + 8 * v196);
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            v280((char *)v120, v281, v7);
            uint64_t v119 = sub_2380E4508();
            os_log_type_t v199 = sub_2380E4D38();
            if (os_log_type_enabled(v119, v199))
            {
              v200 = (uint8_t *)swift_slowAlloc();
              uint64_t v201 = swift_slowAlloc();
              uint64_t v302 = v201;
              *(_DWORD *)v200 = 136315138;
              *(void *)&long long v300 = v198;
              uint64_t v202 = sub_2380E53B8();
              *(void *)&long long v300 = sub_237EBC6BC(v202, v203, &v302);
              uint64_t v7 = v291;
              sub_2380E4FC8();
              swift_bridgeObjectRelease();
              _os_log_impl(&dword_237EB8000, v119, v199, "CompoundSignal#activeScores last foreground elaspsed time is for common.foregroundAppRecency  %s", v200, 0xCu);
              swift_arrayDestroy();
              uint64_t v204 = v201;
              uint64_t v78 = v287;
              MEMORY[0x23EC87710](v204, -1, -1);
              MEMORY[0x23EC87710](v200, -1, -1);

              v205 = v264;
              goto LABEL_136;
            }
            goto LABEL_135;
          }
          swift_bridgeObjectRelease();
        }
        swift_bridgeObjectRelease();
        sub_237F098FC(v269, &qword_26894B8B0);
        swift_bridgeObjectRelease();
      }
      else
      {
        sub_237F098FC(v269, &qword_26894B8B0);
        swift_bridgeObjectRelease();
        (*(void (**)(uint64_t, uint64_t))(v79 + 8))(v192, v78);
      }
    }
  }
  else
  {
    (*(void (**)(uint64_t *, uint64_t))(v79 + 8))(v77, v78);
  }
LABEL_34:
  while (v50)
  {
    uint64_t v283 = v79;
    uint64_t v113 = v294 + 32;
    swift_bridgeObjectRetain();
    uint64_t v114 = v113;
    unint64_t v115 = v50;
    while (1)
    {
      sub_237ECEFFC(v114, (uint64_t)&v300);
      sub_237ECEFFC((uint64_t)&v300, (uint64_t)v299);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26894B320);
      uint64_t v78 = type metadata accessor for NowPlayingAppSignal();
      if (swift_dynamicCast()) {
        break;
      }
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v300);
      v114 += 40;
      if (!--v115)
      {
        swift_bridgeObjectRelease();
        uint64_t v79 = 0;
        goto LABEL_43;
      }
    }
    swift_bridgeObjectRelease();
    swift_release();
    sub_237EC4D08(&v300, (uint64_t)&v302);
    if (swift_dynamicCast()) {
      uint64_t v79 = v300;
    }
    else {
      uint64_t v79 = 0;
    }
LABEL_43:
    swift_bridgeObjectRetain();
    uint64_t v119 = 0;
    uint64_t v120 = &qword_26894B320;
    while (1)
    {
      uint64_t v121 = (char *)&v119->isa + 1;
      if (__OFADD__(v119, 1)) {
        break;
      }
      sub_237ECEFFC(v113, (uint64_t)&v300);
      sub_237ECEFFC((uint64_t)&v300, (uint64_t)&v302);
      uint64_t v78 = __swift_instantiateConcreteTypeFromMangledName(&qword_26894B320);
      if (swift_dynamicCast())
      {
        swift_bridgeObjectRelease();
        sub_237EC4D08(&v300, (uint64_t)&v302);
        int v124 = swift_dynamicCast();
        if (v124) {
          int v122 = v300;
        }
        else {
          int v122 = 0;
        }
        char v123 = v124 ^ 1;
LABEL_52:
        uint64_t v117 = v292;
        id v118 = v293;
        uint64_t v78 = v287;
        uint64_t v116 = v79;
        if (!v79) {
          goto LABEL_64;
        }
        unint64_t v50 = *(void *)(v79 + 24);
        if (v50)
        {
          if ((v123 & 1) == 0)
          {
            unint64_t v298 = *(void *)(v79 + 16);
            uint64_t v125 = qword_26894AC08;
            swift_bridgeObjectRetain();
            if (v125 != -1) {
              swift_once();
            }
            BOOL v126 = sub_237EE53F4(v122, qword_26894D5A8);
            uint64_t v117 = v292;
            if (v126)
            {
              uint64_t v127 = v265;
              v280(v265, v281, v7);
              swift_bridgeObjectRetain_n();
              uint64_t v128 = sub_2380E4508();
              os_log_type_t v129 = sub_2380E4D38();
              if (os_log_type_enabled(v128, v129))
              {
                uint64_t v130 = (uint8_t *)swift_slowAlloc();
                uint64_t v131 = swift_slowAlloc();
                uint64_t v302 = v131;
                *(_DWORD *)uint64_t v130 = 136315138;
                swift_bridgeObjectRetain();
                uint64_t v132 = v298;
                *(void *)&long long v300 = sub_237EBC6BC(v298, v50, &v302);
                sub_2380E4FC8();
                swift_bridgeObjectRelease_n();
                _os_log_impl(&dword_237EB8000, v128, v129, "CompoundSignal#activeScores currently playing: %s", v130, 0xCu);
                swift_arrayDestroy();
                uint64_t v133 = v131;
                uint64_t v116 = v79;
                MEMORY[0x23EC87710](v133, -1, -1);
                v134 = v130;
                id v118 = v293;
                MEMORY[0x23EC87710](v134, -1, -1);

                v279(v265, v291);
                uint64_t v78 = v287;
              }
              else
              {

                swift_bridgeObjectRelease_n();
                v279(v127, v7);
                uint64_t v78 = v287;
                uint64_t v132 = v298;
              }
              swift_bridgeObjectRetain();
              v183 = v270;
              sub_2380E2E18();
              sub_2380C9D00(v132, v50, v183, &v304);
              swift_bridgeObjectRelease();
              (*(void (**)(void (*)(char *, uint64_t, uint64_t, uint64_t), uint64_t))(v271 + 8))(v183, v272);
              uint64_t v117 = v292;
              goto LABEL_65;
            }
            swift_bridgeObjectRelease();
          }
LABEL_64:
          unint64_t v298 = 0;
          unint64_t v50 = 0;
        }
        else
        {
          unint64_t v298 = 0;
        }
LABEL_65:
        uint64_t v79 = v283;
        goto LABEL_66;
      }
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v300);
      uint64_t v119 = ((char *)v119 + 1);
      v113 += 40;
      if (v121 == (char *)v298)
      {
        swift_bridgeObjectRelease();
        int v122 = 0;
        char v123 = 1;
        goto LABEL_52;
      }
    }
    __break(1u);
LABEL_135:

    v205 = v120;
LABEL_136:
    v279((char *)v205, v7);
    v240 = v260;
    sub_2380E2E18();
    v241 = v270;
    sub_2380E2D88();
    v242 = *(void (**)(char *, uint64_t))(v271 + 8);
    v243 = v240;
    uint64_t v244 = v272;
    v242(v243, v272);
    sub_2380C9D00(v256, v258, v241, &v304);
    swift_bridgeObjectRelease();
    v242((char *)v241, v244);
    sub_237F098FC(v269, &qword_26894B8B0);
    uint64_t v49 = v259;
LABEL_33:
    unint64_t v50 = v298;
  }
  uint64_t v116 = 0;
  unint64_t v298 = 0;
  uint64_t v117 = v292;
  id v118 = v293;
LABEL_66:
  if (v288)
  {
    uint64_t v136 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v79 + 56);
    v136(v297, 1, 1, v78);
  }
  else
  {
    swift_bridgeObjectRetain();
    sub_2380E3848();
    uint64_t v137 = sub_2380E3838();
    if (*(void *)(v117 + 16) && (unint64_t v139 = sub_237EC9470(v137, v138), (v140 & 1) != 0))
    {
      uint64_t v141 = v297;
      (*(void (**)(uint64_t, unint64_t, uint64_t))(v79 + 16))(v297, *(void *)(v117 + 56) + *(void *)(v79 + 72) * v139, v78);
      uint64_t v136 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v79 + 56);
      v136(v141, 0, 1, v78);
    }
    else
    {
      uint64_t v136 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v79 + 56);
      v136(v297, 1, 1, v78);
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    id v118 = v293;
  }
  sub_2380CFA30(v297, (uint64_t)v118);
  if (v289((uint64_t)v118, 1, v78) == 1)
  {
    swift_bridgeObjectRelease();
    sub_2380CFA98(v117);
    uint64_t v142 = (uint64_t)v118;
LABEL_75:
    sub_237F098FC(v142, &qword_26894B8B0);
LABEL_133:
    uint64_t v232 = v286;
    swift_bridgeObjectRetain();
    uint64_t v233 = swift_bridgeObjectRetain();
    uint64_t v234 = sub_2380CA608(v233, v232);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v235 = sub_238053190(v234, 604800.0);
    uint64_t v236 = swift_bridgeObjectRetain();
    uint64_t v237 = sub_237FE7D90(v236);
    uint64_t v238 = sub_237EEAFFC((uint64_t)v235, v237);
    swift_release();
    swift_release();
    swift_bridgeObjectRelease();
    swift_release();
    sub_237F098FC(v297, &qword_26894B8B0);
    sub_237F098FC((uint64_t)v49, &qword_26894B8B0);
    swift_bridgeObjectRelease();
    return v238;
  }
  uint64_t v143 = *(uint64_t (**)(uint64_t *, uint64_t))(v79 + 88);
  int v144 = v143(v118, v78);
  if (v144 != *MEMORY[0x263F744F8])
  {
    swift_bridgeObjectRelease();
    sub_2380CFA98(v117);
    (*(void (**)(uint64_t *, uint64_t))(v79 + 8))(v118, v78);
    goto LABEL_133;
  }
  LODWORD(v269) = v144;
  v274 = v143;
  v276 = (char *)(v79 + 88);
  uint64_t v294 = v116;
  v265 = *(char **)(v79 + 96);
  ((void (*)(uint64_t *, uint64_t))v265)(v118, v78);
  uint64_t v145 = *v118;
  v146 = v275;
  uint64_t v147 = v291;
  v280(v275, v281, v291);
  swift_bridgeObjectRetain_n();
  unint64_t v148 = sub_2380E4508();
  os_log_type_t v149 = sub_2380E4D38();
  BOOL v150 = os_log_type_enabled(v148, v149);
  v266 = (char *)(v79 + 96);
  if (v150)
  {
    uint64_t v151 = (uint8_t *)swift_slowAlloc();
    uint64_t v152 = swift_slowAlloc();
    uint64_t v302 = v152;
    v259 = v49;
    *(_DWORD *)uint64_t v151 = 136315138;
    v293 = (uint64_t *)(v151 + 4);
    swift_bridgeObjectRetain();
    uint64_t v153 = sub_2380E4838();
    uint64_t v283 = v79;
    unint64_t v155 = v154;
    swift_bridgeObjectRelease();
    *(void *)&long long v300 = sub_237EBC6BC(v153, v155, &v302);
    uint64_t v49 = v259;
    sub_2380E4FC8();
    swift_bridgeObjectRelease_n();
    uint64_t v79 = v283;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_237EB8000, v148, v149, "CompoundSignal#activeScores last now playing map is %s", v151, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23EC87710](v152, -1, -1);
    MEMORY[0x23EC87710](v151, -1, -1);

    v156 = v275;
    uint64_t v157 = v291;
  }
  else
  {

    swift_bridgeObjectRelease_n();
    v156 = v146;
    uint64_t v157 = v147;
  }
  v279(v156, v157);
  uint64_t v158 = v296;
  uint64_t v159 = (uint64_t)v273;
  uint64_t v160 = sub_2380C9858(v145);
  swift_bridgeObjectRelease();
  v293 = (uint64_t *)sub_2380ABEBC((uint64_t)v160);
  uint64_t v162 = v161;
  swift_release();
  uint64_t v296 = v158;
  if (!v162)
  {
    swift_bridgeObjectRelease();
    sub_2380CFA98(v292);
    goto LABEL_133;
  }
  uint64_t v163 = v268;
  if (v50)
  {
    if (v293 == (uint64_t *)v298 && v162 == v50)
    {
      swift_bridgeObjectRelease();
LABEL_92:
      sub_2380CFA98(v292);
      swift_bridgeObjectRelease();
      goto LABEL_133;
    }
    char v167 = sub_2380E5408();
    swift_bridgeObjectRelease();
    if (v167) {
      goto LABEL_92;
    }
  }
  unint64_t v298 = v162;
  if (v288)
  {
    uint64_t v168 = (uint64_t)v267;
    v136((uint64_t)v267, 1, 1, v287);
  }
  else
  {
    swift_bridgeObjectRelease();
    sub_2380E39C8();
    uint64_t v174 = sub_2380E39B8();
    uint64_t v176 = v292;
    uint64_t v168 = (uint64_t)v267;
    if (*(void *)(v292 + 16) && (unint64_t v177 = sub_237EC9470(v174, v175), (v178 & 1) != 0))
    {
      uint64_t v179 = v287;
      (*(void (**)(char *, unint64_t, uint64_t))(v79 + 16))(v267, *(void *)(v176 + 56) + *(void *)(v79 + 72) * v177, v287);
      uint64_t v168 = (uint64_t)v267;
      uint64_t v180 = v267;
      uint64_t v181 = 0;
      uint64_t v182 = v179;
    }
    else
    {
      uint64_t v180 = (char *)v168;
      uint64_t v181 = 1;
      uint64_t v182 = v287;
    }
    v136((uint64_t)v180, v181, 1, v182);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  uint64_t v206 = v291;
  v280(v163, v281, v291);
  sub_2380CFA30(v168, v159);
  v207 = sub_2380E4508();
  v208 = v163;
  os_log_type_t v209 = sub_2380E4D38();
  if (os_log_type_enabled(v207, v209))
  {
    v210 = (uint8_t *)swift_slowAlloc();
    uint64_t v211 = swift_slowAlloc();
    uint64_t v302 = v211;
    *(_DWORD *)v210 = 136315138;
    sub_2380CFA30(v159, v277);
    uint64_t v212 = sub_2380E4988();
    *(void *)&long long v300 = sub_237EBC6BC(v212, v213, &v302);
    uint64_t v206 = v291;
    uint64_t v168 = (uint64_t)v267;
    sub_2380E4FC8();
    swift_bridgeObjectRelease();
    sub_237F098FC(v159, &qword_26894B8B0);
    _os_log_impl(&dword_237EB8000, v207, v209, "CompoundSignal#activeScores last playing recency map is %s", v210, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23EC87710](v211, -1, -1);
    MEMORY[0x23EC87710](v210, -1, -1);

    v214 = v268;
  }
  else
  {
    sub_237F098FC(v159, &qword_26894B8B0);

    v214 = v208;
  }
  v279(v214, v206);
  v215 = v262;
  v216 = v261;
  sub_2380CFA30(v168, (uint64_t)v261);
  uint64_t v217 = v287;
  if (v289((uint64_t)v216, 1, v287) == 1)
  {
    sub_237F098FC(v168, &qword_26894B8B0);
    swift_bridgeObjectRelease();
    uint64_t v142 = (uint64_t)v216;
    goto LABEL_75;
  }
  int v218 = v274(v216, v217);
  if (v218 != v269)
  {
    sub_237F098FC(v168, &qword_26894B8B0);
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t *, uint64_t))(v79 + 8))(v216, v217);
    goto LABEL_133;
  }
  ((void (*)(uint64_t *, uint64_t))v265)(v216, v217);
  uint64_t v219 = *v216;
  if (!*(void *)(v219 + 16))
  {
LABEL_132:
    swift_bridgeObjectRelease();
    sub_237F098FC(v168, &qword_26894B8B0);
    swift_bridgeObjectRelease();
    goto LABEL_133;
  }
  uint64_t v220 = v298;
  swift_bridgeObjectRetain();
  unint64_t v221 = sub_237EC9470((uint64_t)v293, v220);
  if ((v222 & 1) == 0)
  {
    swift_bridgeObjectRelease();
    goto LABEL_132;
  }
  uint64_t v223 = *(void *)(*(void *)(v219 + 56) + 8 * v221);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v280(v215, v281, v206);
  v224 = sub_2380E4508();
  os_log_type_t v225 = sub_2380E4D38();
  if (os_log_type_enabled(v224, v225))
  {
    v226 = (uint8_t *)swift_slowAlloc();
    uint64_t v227 = swift_slowAlloc();
    uint64_t v302 = v227;
    *(_DWORD *)v226 = 136315138;
    *(void *)&long long v300 = v223;
    uint64_t v228 = sub_2380E53B8();
    *(void *)&long long v300 = sub_237EBC6BC(v228, v229, &v302);
    sub_2380E4FC8();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_237EB8000, v224, v225, "CompoundSignal#activeScores last playing elaspsed time is for raw.LastNowPlayingRecency  %s", v226, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23EC87710](v227, -1, -1);
    MEMORY[0x23EC87710](v226, -1, -1);

    v230 = v215;
    uint64_t v231 = v291;
  }
  else
  {

    v230 = v215;
    uint64_t v231 = v206;
  }
  v279(v230, v231);
  v245 = v260;
  uint64_t result = sub_2380E2E18();
  if (!__OFSUB__(0, v223))
  {
    v246 = v270;
    sub_2380E2D88();
    v247 = *(void (**)(char *, uint64_t))(v271 + 8);
    v248 = v245;
    uint64_t v249 = v272;
    v247(v248, v272);
    sub_2380C9D00((uint64_t)v293, v298, v246, &v304);
    swift_bridgeObjectRelease();
    v247((char *)v246, v249);
    uint64_t v142 = (uint64_t)v267;
    goto LABEL_75;
  }
  __break(1u);
  return result;
}

uint64_t sub_2380CCEC0(void *a1, uint64_t a2, uint64_t a3)
{
  id v118 = a1;
  uint64_t v5 = sub_2380E4528();
  uint64_t v121 = *(void *)(v5 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v5);
  uint64_t v119 = (char *)&v111 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v120 = (char *)&v111 - v8;
  uint64_t v130 = MEMORY[0x263F8EE80];
  v131[0] = MEMORY[0x263F8EE80];
  uint64_t v129 = MEMORY[0x263F8EE80];
  uint64_t v9 = *(void *)(a3 + 16);
  if (!v9) {
    goto LABEL_8;
  }
  uint64_t v10 = a3 + 32;
  swift_bridgeObjectRetain();
  uint64_t v11 = v9;
  while (1)
  {
    sub_237ECEFFC(v10, (uint64_t)&v127);
    sub_237ECEFFC((uint64_t)&v127, (uint64_t)v128);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26894B320);
    if (swift_dynamicCast()) {
      break;
    }
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v127);
    v10 += 40;
    if (!--v11)
    {
      swift_bridgeObjectRelease();
      goto LABEL_8;
    }
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_237EC4D08(&v127, (uint64_t)v128);
  if (swift_dynamicCast())
  {
    uint64_t v12 = v127;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
LABEL_8:
    uint64_t v12 = 0;
  }
  swift_bridgeObjectRetain();
  sub_2380C9B00(a2, v12, v131, &v130, &v129);
  swift_bridgeObjectRelease_n();
  uint64_t v13 = swift_bridgeObjectRetain();
  uint64_t v14 = sub_237EEC9F4(v13, 0, 0);
  swift_bridgeObjectRelease();
  v131[0] = v14;
  swift_bridgeObjectRelease();
  uint64_t v15 = swift_bridgeObjectRetain();
  uint64_t v16 = sub_237EEC9F4(v15, 0, 0);
  swift_bridgeObjectRelease();
  uint64_t v130 = v16;
  swift_bridgeObjectRelease();
  uint64_t v17 = swift_bridgeObjectRetain();
  uint64_t v18 = sub_237EEC9F4(v17, 0, 0);
  swift_bridgeObjectRelease();
  uint64_t v129 = v18;
  swift_bridgeObjectRelease();
  if (!v9) {
    goto LABEL_16;
  }
  uint64_t v19 = a3 + 32;
  swift_bridgeObjectRetain();
  while (1)
  {
    sub_237ECEFFC(v19, (uint64_t)&v127);
    sub_237ECEFFC((uint64_t)&v127, (uint64_t)v126);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26894B320);
    type metadata accessor for NowPlayingUsageSignal();
    if (swift_dynamicCast()) {
      break;
    }
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v127);
    v19 += 40;
    if (!--v9)
    {
      swift_bridgeObjectRelease();
      goto LABEL_16;
    }
  }
  swift_bridgeObjectRelease();
  swift_release();
  sub_237EC4D08(&v127, (uint64_t)v128);
  if (swift_dynamicCast())
  {
    uint64_t v20 = v127;
    uint64_t v21 = *(void *)(v127 + 16);
    swift_bridgeObjectRetain();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v128[0] = v131[0];
    v131[0] = 0x8000000000000000;
    sub_237EE0884(v21, (uint64_t)sub_237EE11DC, 0, isUniquelyReferenced_nonNull_native, v128);
    v131[0] = v128[0];
    swift_bridgeObjectRelease();
    uint64_t v23 = *(void *)(v20 + 24);
    swift_bridgeObjectRetain();
    char v24 = swift_isUniquelyReferenced_nonNull_native();
    v128[0] = v130;
    uint64_t v130 = 0x8000000000000000;
    sub_237EE0884(v23, (uint64_t)sub_237EE11DC, 0, v24, v128);
    uint64_t v130 = v128[0];
    swift_bridgeObjectRelease();
    uint64_t v25 = *(void *)(v20 + 32);
    swift_bridgeObjectRetain();
    char v26 = swift_isUniquelyReferenced_nonNull_native();
    v128[0] = v129;
    uint64_t v129 = 0x8000000000000000;
    sub_237EE0884(v25, (uint64_t)sub_237EE11DC, 0, v26, v128);
    uint64_t v129 = v128[0];
    uint64_t v27 = v121;
    swift_release();
    swift_bridgeObjectRelease();
  }
  else
  {
LABEL_16:
    uint64_t v27 = v121;
  }
  uint64_t v28 = v120;
  uint64_t v116 = 0;
  uint64_t v29 = swift_bridgeObjectRetain();
  uint64_t v30 = sub_237EEC9F4(v29, 0, 0);
  swift_bridgeObjectRelease();
  v131[0] = v30;
  swift_bridgeObjectRelease();
  uint64_t v31 = swift_bridgeObjectRetain();
  uint64_t v32 = sub_237EEC9F4(v31, 0, 0);
  swift_bridgeObjectRelease();
  uint64_t v130 = v32;
  swift_bridgeObjectRelease();
  uint64_t v33 = swift_bridgeObjectRetain();
  uint64_t v34 = sub_237EEC9F4(v33, 0, 0);
  swift_bridgeObjectRelease();
  uint64_t v129 = v34;
  swift_bridgeObjectRelease();
  if (qword_26894AA20 != -1) {
    swift_once();
  }
  uint64_t v35 = __swift_project_value_buffer(v5, (uint64_t)qword_268956458);
  uint64_t v113 = *(void (**)(char *, uint64_t, uint64_t))(v27 + 16);
  v113(v28, v35, v5);
  uint64_t v36 = (void *)v5;
  uint64_t v37 = sub_2380E4508();
  os_log_type_t v38 = sub_2380E4D38();
  BOOL v39 = os_log_type_enabled(v37, v38);
  uint64_t v117 = a2;
  uint64_t v114 = v35;
  uint64_t v115 = v27 + 16;
  if (v39)
  {
    uint64_t v40 = swift_slowAlloc();
    uint64_t v112 = swift_slowAlloc();
    v128[0] = v112;
    *(_DWORD *)uint64_t v40 = 136315650;
    swift_beginAccess();
    swift_bridgeObjectRetain();
    uint64_t v41 = sub_2380E4838();
    unint64_t v43 = v42;
    swift_bridgeObjectRelease();
    v126[0] = sub_237EBC6BC(v41, v43, v128);
    sub_2380E4FC8();
    swift_bridgeObjectRelease();
    *(_WORD *)(v40 + 12) = 2080;
    swift_beginAccess();
    swift_bridgeObjectRetain();
    uint64_t v44 = sub_2380E4838();
    unint64_t v46 = v45;
    swift_bridgeObjectRelease();
    uint64_t v122 = sub_237EBC6BC(v44, v46, v128);
    sub_2380E4FC8();
    swift_bridgeObjectRelease();
    *(_WORD *)(v40 + 22) = 2080;
    uint64_t v47 = v121;
    swift_beginAccess();
    swift_bridgeObjectRetain();
    uint64_t v48 = sub_2380E4838();
    unint64_t v50 = v49;
    swift_bridgeObjectRelease();
    uint64_t v125 = sub_237EBC6BC(v48, v50, v128);
    sub_2380E4FC8();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_237EB8000, v37, v38, "CompoundSignal#mediaTypeAffinityScores app-affinity for music:%s podcasts:%s books:%s", (uint8_t *)v40, 0x20u);
    uint64_t v51 = v112;
    swift_arrayDestroy();
    MEMORY[0x23EC87710](v51, -1, -1);
    MEMORY[0x23EC87710](v40, -1, -1);

    uint64_t v52 = *(char **)(v47 + 8);
    uint64_t v53 = v120;
  }
  else
  {

    uint64_t v52 = *(char **)(v27 + 8);
    uint64_t v53 = v28;
  }
  uint64_t v120 = v52;
  ((void (*)(char *, void *))v52)(v53, v36);
  id v54 = v118;
  id v55 = objc_msgSend(v118, sel_mediaSearch);
  if (!v55)
  {
    double v58 = 0.7;
    double v59 = 0.2;
    double v60 = 0.1;
    goto LABEL_38;
  }
  uint64_t v56 = v55;
  unint64_t v57 = objc_msgSend(v55, sel_mediaType);

  if (qword_26894AC18 != -1) {
    goto LABEL_76;
  }
  while (1)
  {
    if (sub_237EE5238((uint64_t)v57, qword_26894D5B8)) {
      double v58 = 2.7;
    }
    else {
      double v58 = 0.7;
    }
    if (qword_26894AC20 != -1) {
      swift_once();
    }
    if (sub_237EE5238((uint64_t)v57, qword_26894D5C0)) {
      double v59 = 2.2;
    }
    else {
      double v59 = 0.2;
    }
    if (qword_26894AC28 != -1) {
      swift_once();
    }
    if (sub_237EE5238((uint64_t)v57, qword_26894D5C8)) {
      double v60 = 2.1;
    }
    else {
      double v60 = 0.1;
    }
LABEL_38:
    id v61 = objc_msgSend(v54, sel_mediaSearch);
    if (v61)
    {
      uint64_t v62 = v61;
      id v63 = objc_msgSend(v61, sel_albumName);

      if (v63)
      {
        uint64_t v64 = sub_2380E4938();
        unint64_t v66 = v65;

        swift_bridgeObjectRelease();
        uint64_t v67 = HIBYTE(v66) & 0xF;
        if ((v66 & 0x2000000000000000) == 0) {
          uint64_t v67 = v64 & 0xFFFFFFFFFFFFLL;
        }
        if (v67) {
          double v58 = v58 + 1.0;
        }
      }
    }
    id v68 = objc_msgSend(v54, sel_mediaSearch);
    if (v68)
    {
      os_log_type_t v69 = v68;
      id v70 = objc_msgSend(v68, sel_genreNames);

      if (v70)
      {
        uint64_t v71 = sub_2380E4B28();

        uint64_t v72 = *(void *)(v71 + 16);
        swift_bridgeObjectRelease();
        if (v72) {
          double v58 = v58 + 1.0;
        }
      }
    }
    id v73 = objc_msgSend(v54, sel_mediaSearch);
    if (v73)
    {
      uint64_t v74 = v73;
      id v75 = objc_msgSend(v73, sel_moodNames);

      if (v75)
      {
        uint64_t v76 = sub_2380E4B28();

        uint64_t v77 = *(void *)(v76 + 16);
        swift_bridgeObjectRelease();
        if (v77) {
          double v58 = v58 + 1.0;
        }
      }
    }
    id v78 = objc_msgSend(v54, sel_mediaSearch);
    id v79 = objc_msgSend(v78, sel_releaseDate);

    if (v79) {
      double v58 = v58 + 1.0;
    }
    id v80 = objc_msgSend(v54, sel_mediaSearch);
    if (v80)
    {
      unsigned int v81 = v80;
      id v82 = objc_msgSend(v80, sel_artistName);

      if (v82)
      {
        uint64_t v83 = sub_2380E4938();
        unint64_t v85 = v84;

        swift_bridgeObjectRelease();
        uint64_t v86 = HIBYTE(v85) & 0xF;
        if ((v85 & 0x2000000000000000) == 0) {
          uint64_t v86 = v83 & 0xFFFFFFFFFFFFLL;
        }
        if (v86)
        {
          double v58 = v58 + 0.4;
          double v59 = v59 + 0.2;
          double v60 = v60 + 0.1;
        }
      }
    }
    __swift_instantiateConcreteTypeFromMangledName(&qword_26894B728);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_2380E7460;
    *(void *)(inited + 32) = 0x636973756DLL;
    *(void *)(inited + 40) = 0xE500000000000000;
    *(double *)(inited + 48) = v58;
    *(void *)(inited + 56) = 0x74736163646F70;
    *(void *)(inited + 64) = 0xE700000000000000;
    *(double *)(inited + 72) = v59;
    *(void *)(inited + 80) = 1802465122;
    *(void *)(inited + 88) = 0xE400000000000000;
    *(double *)(inited + 96) = v60;
    unint64_t v88 = sub_237FCFAF8(inited);
    unint64_t v57 = (void *)sub_237EEC9F4(v88, 0, 0);
    swift_bridgeObjectRelease();
    uint64_t v125 = (uint64_t)v57;
    if (!v57[2])
    {
      __break(1u);
LABEL_71:
      __break(1u);
LABEL_72:
      __break(1u);
LABEL_73:
      __break(1u);
LABEL_74:
      __break(1u);
      goto LABEL_75;
    }
    unint64_t v89 = sub_237EC9470(0x636973756DLL, 0xE500000000000000);
    if ((v90 & 1) == 0) {
      goto LABEL_71;
    }
    if (!v57[2]) {
      goto LABEL_72;
    }
    double v91 = *(double *)(v57[7] + 8 * v89);
    unint64_t v92 = sub_237EC9470(0x74736163646F70, 0xE700000000000000);
    if ((v93 & 1) == 0) {
      goto LABEL_73;
    }
    if (!v57[2]) {
      goto LABEL_74;
    }
    double v94 = *(double *)(v57[7] + 8 * v92);
    unint64_t v95 = sub_237EC9470(1802465122, 0xE400000000000000);
    if (v96) {
      break;
    }
LABEL_75:
    __break(1u);
LABEL_76:
    swift_once();
  }
  double v97 = *(double *)(v57[7] + 8 * v95);
  os_log_type_t v98 = v119;
  v113(v119, v114, (uint64_t)v36);
  BOOL v99 = sub_2380E4508();
  os_log_type_t v100 = sub_2380E4D38();
  if (os_log_type_enabled(v99, v100))
  {
    uint64_t v101 = (uint8_t *)swift_slowAlloc();
    uint64_t v102 = swift_slowAlloc();
    v124[0] = v102;
    *(_DWORD *)uint64_t v101 = 136315138;
    swift_beginAccess();
    swift_bridgeObjectRetain();
    uint64_t v103 = sub_2380E4838();
    id v118 = v36;
    unint64_t v105 = v104;
    swift_bridgeObjectRelease();
    uint64_t v123 = sub_237EBC6BC(v103, v105, v124);
    sub_2380E4FC8();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_237EB8000, v99, v100, "CompoundSignal#mediaTypeAffinityScores input-affinity: %s", v101, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23EC87710](v102, -1, -1);
    MEMORY[0x23EC87710](v101, -1, -1);

    id v107 = v118;
    uint64_t v106 = v119;
  }
  else
  {

    uint64_t v106 = v98;
    id v107 = v36;
  }
  ((void (*)(char *, id))v120)(v106, v107);
  v124[0] = MEMORY[0x263F8EE80];
  sub_2380C8938(v117, v124, v131, &v130, &v129, v91, v94, v97);
  uint64_t v108 = swift_bridgeObjectRetain();
  uint64_t v109 = sub_237EEC9F4(v108, 0, 0);
  swift_bridgeObjectRelease_n();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v109;
}

uint64_t sub_2380CDDB0(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, char a5, uint64_t a6)
{
  uint64_t v29 = (unint64_t *)result;
  uint64_t v30 = 0;
  int64_t v8 = 0;
  uint64_t v11 = *(void *)(a3 + 56);
  uint64_t v9 = a3 + 56;
  uint64_t v10 = v11;
  uint64_t v12 = 1 << *(unsigned char *)(v9 - 24);
  uint64_t v13 = -1;
  if (v12 < 64) {
    uint64_t v13 = ~(-1 << v12);
  }
  char v14 = a5 & 1;
  unint64_t v15 = v13 & v10;
  uint64_t v31 = v9;
  int64_t v32 = (unint64_t)(v12 + 63) >> 6;
  while (1)
  {
    if (v15)
    {
      unint64_t v18 = __clz(__rbit64(v15));
      v15 &= v15 - 1;
      unint64_t v19 = v18 | (v8 << 6);
      goto LABEL_20;
    }
    BOOL v20 = __OFADD__(v8++, 1);
    if (v20)
    {
      __break(1u);
      goto LABEL_33;
    }
    if (v8 >= v32) {
      goto LABEL_31;
    }
    unint64_t v21 = *(void *)(v31 + 8 * v8);
    if (!v21) {
      break;
    }
LABEL_19:
    unint64_t v15 = (v21 - 1) & v21;
    unint64_t v19 = __clz(__rbit64(v21)) + (v8 << 6);
LABEL_20:
    uint64_t v23 = (uint64_t *)(*(void *)(a3 + 48) + 16 * v19);
    uint64_t v24 = v23[1];
    if (!*(void *)(a6 + 16))
    {
      swift_bridgeObjectRetain();
LABEL_5:
      uint64_t v16 = MEMORY[0x263F8EE78];
      goto LABEL_6;
    }
    uint64_t v25 = *v23;
    swift_bridgeObjectRetain_n();
    unint64_t v26 = sub_237EC9470(v25, v24);
    if ((v27 & 1) == 0)
    {
      swift_bridgeObjectRelease();
      goto LABEL_5;
    }
    uint64_t v16 = *(void *)(*(void *)(a6 + 56) + 8 * v26);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
LABEL_6:
    char v17 = sub_2380AA3D4(a4, v14, v16);
    swift_bridgeObjectRelease();
    uint64_t result = swift_bridgeObjectRelease();
    if (v17)
    {
      *(unint64_t *)((char *)v29 + ((v19 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v19;
      BOOL v20 = __OFADD__(v30++, 1);
      if (v20)
      {
        __break(1u);
LABEL_31:
        swift_retain();
        return sub_237ECAE3C(v29, a2, v30, a3);
      }
    }
  }
  int64_t v22 = v8 + 1;
  if (v8 + 1 >= v32) {
    goto LABEL_31;
  }
  unint64_t v21 = *(void *)(v31 + 8 * v22);
  if (v21) {
    goto LABEL_18;
  }
  int64_t v22 = v8 + 2;
  if (v8 + 2 >= v32) {
    goto LABEL_31;
  }
  unint64_t v21 = *(void *)(v31 + 8 * v22);
  if (v21) {
    goto LABEL_18;
  }
  int64_t v22 = v8 + 3;
  if (v8 + 3 >= v32) {
    goto LABEL_31;
  }
  unint64_t v21 = *(void *)(v31 + 8 * v22);
  if (v21)
  {
LABEL_18:
    int64_t v8 = v22;
    goto LABEL_19;
  }
  while (1)
  {
    int64_t v8 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (v8 >= v32) {
      goto LABEL_31;
    }
    unint64_t v21 = *(void *)(v31 + 8 * v8);
    ++v22;
    if (v21) {
      goto LABEL_19;
    }
  }
LABEL_33:
  __break(1u);
  return result;
}

uint64_t sub_2380CE010(uint64_t a1, uint64_t a2, char a3, uint64_t a4)
{
  v17[1] = *MEMORY[0x263EF8340];
  char v8 = a3 & 1;
  char v9 = *(unsigned char *)(a1 + 32);
  unsigned int v10 = v9 & 0x3F;
  unint64_t v11 = (unint64_t)((1 << v9) + 63) >> 6;
  size_t v12 = 8 * v11;
  uint64_t isStackAllocationSafe = swift_bridgeObjectRetain_n();
  if (v10 <= 0xD || (uint64_t isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), (isStackAllocationSafe & 1) != 0))
  {
    MEMORY[0x270FA5388](isStackAllocationSafe);
    bzero((char *)v17 - ((v12 + 15) & 0x3FFFFFFFFFFFFFF0), v12);
    swift_bridgeObjectRetain();
    uint64_t v14 = sub_2380CDDB0((uint64_t)v17 - ((v12 + 15) & 0x3FFFFFFFFFFFFFF0), v11, a1, a2, v8, a4);
    swift_release();
    swift_bridgeObjectRelease();
    if (v4) {
      swift_willThrow();
    }
    swift_bridgeObjectRelease_n();
  }
  else
  {
    unint64_t v15 = (void *)swift_slowAlloc();
    bzero(v15, v12);
    swift_bridgeObjectRetain();
    uint64_t v14 = sub_2380CDDB0((uint64_t)v15, v11, a1, a2, v8, a4);
    swift_release();
    swift_bridgeObjectRelease();
    MEMORY[0x23EC87710](v15, -1, -1);
    swift_bridgeObjectRelease_n();
  }
  return v14;
}

uint64_t sub_2380CE1FC(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_2380E4528();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  char v9 = (char *)&v34 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = *(void *)(a3 + 16);
  os_log_type_t v38 = v9;
  if (v10)
  {
    uint64_t v11 = a3 + 32;
    swift_bridgeObjectRetain();
    while (1)
    {
      sub_237ECEFFC(v11, (uint64_t)&v40);
      sub_237ECEFFC((uint64_t)&v40, (uint64_t)v39);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26894B320);
      if (swift_dynamicCast()) {
        break;
      }
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v40);
      v11 += 40;
      if (!--v10)
      {
        swift_bridgeObjectRelease();
        goto LABEL_8;
      }
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_237EC4D08(&v40, (uint64_t)&v41);
    if (swift_dynamicCast())
    {
      unint64_t v12 = v40;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      char v9 = v38;
      goto LABEL_10;
    }
LABEL_8:
    char v9 = v38;
  }
  unint64_t v12 = sub_237FCF4F4(MEMORY[0x263F8EE78]);
LABEL_10:
  id v13 = objc_msgSend(a1, sel_mediaSearch);
  uint64_t v14 = v13;
  if (v13)
  {
    id v15 = objc_msgSend(v13, sel_mediaType);
  }
  else
  {
    id v15 = 0;
  }
  if (qword_26894AA20 != -1) {
    swift_once();
  }
  uint64_t v16 = __swift_project_value_buffer(v6, (uint64_t)qword_268956458);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, v16, v6);
  swift_bridgeObjectRetain_n();
  uint64_t v17 = v7;
  unint64_t v18 = sub_2380E4508();
  os_log_type_t v19 = sub_2380E4D38();
  int v20 = v19;
  if (os_log_type_enabled(v18, v19))
  {
    uint64_t v21 = swift_slowAlloc();
    id v37 = v15;
    uint64_t v22 = v21;
    uint64_t v23 = swift_slowAlloc();
    uint64_t v35 = v6;
    uint64_t v24 = v23;
    *(void *)&long long v40 = v23;
    *(_DWORD *)uint64_t v22 = 136315394;
    HIDWORD(v34) = v20;
    uint64_t v41 = (uint64_t)v37;
    BOOL v42 = v14 == 0;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26894C428);
    uint64_t v25 = sub_2380E4988();
    uint64_t v41 = sub_237EBC6BC(v25, v26, (uint64_t *)&v40);
    uint64_t v36 = a2;
    sub_2380E4FC8();
    swift_bridgeObjectRelease();
    *(_WORD *)(v22 + 12) = 2080;
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26894B160);
    uint64_t v27 = sub_2380E4838();
    unint64_t v29 = v28;
    swift_bridgeObjectRelease();
    uint64_t v41 = sub_237EBC6BC(v27, v29, (uint64_t *)&v40);
    sub_2380E4FC8();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_237EB8000, v18, BYTE4(v34), "CompoundSignal#supportFlag computing for mediaType:%s and categories:%s...", (uint8_t *)v22, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x23EC87710](v24, -1, -1);
    uint64_t v30 = v22;
    id v15 = v37;
    MEMORY[0x23EC87710](v30, -1, -1);

    (*(void (**)(char *, uint64_t))(v17 + 8))(v38, v35);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  }
  uint64_t v31 = swift_bridgeObjectRetain();
  uint64_t v32 = sub_2380CE010(v31, (uint64_t)v15, v14 == 0, v12);
  swift_bridgeObjectRelease();
  return v32;
}

uint64_t sub_2380CE6C8(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    goto LABEL_8;
  }
  uint64_t v2 = a1 + 32;
  swift_bridgeObjectRetain();
  while (1)
  {
    sub_237ECEFFC(v2, (uint64_t)&v7);
    sub_237ECEFFC((uint64_t)&v7, (uint64_t)v6);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26894B320);
    if (swift_dynamicCast()) {
      break;
    }
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v7);
    v2 += 40;
    if (!--v1)
    {
      swift_bridgeObjectRelease();
      goto LABEL_8;
    }
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_237EC4D08(&v7, (uint64_t)v8);
  if (swift_dynamicCast())
  {
    unint64_t v3 = v7;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
LABEL_8:
    unint64_t v3 = sub_237FCF4F4(MEMORY[0x263F8EE78]);
  }
  uint64_t v4 = sub_2380AA8A8(v3);
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_2380CE814(void *a1, uint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v9 = *(void *)(a2 + 16);
  if (!v9) {
    goto LABEL_8;
  }
  uint64_t v10 = a2 + 32;
  swift_bridgeObjectRetain();
  uint64_t v11 = v9;
  while (1)
  {
    sub_237ECEFFC(v10, (uint64_t)&v34);
    sub_237ECEFFC((uint64_t)&v34, (uint64_t)v33);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26894B320);
    if (swift_dynamicCast()) {
      break;
    }
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v34);
    v10 += 40;
    if (!--v11)
    {
      swift_bridgeObjectRelease();
      goto LABEL_8;
    }
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_237EC4D08(&v34, (uint64_t)v36);
  if (swift_dynamicCast())
  {
    unint64_t v12 = v35;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
LABEL_8:
    unint64_t v12 = sub_237FCF4F4(MEMORY[0x263F8EE78]);
  }
  uint64_t v13 = sub_237FE7D90(v12);
  if (!v9) {
    goto LABEL_16;
  }
  uint64_t v14 = a2 + 32;
  swift_bridgeObjectRetain();
  uint64_t v15 = v9;
  while (1)
  {
    sub_237ECEFFC(v14, (uint64_t)&v34);
    sub_237ECEFFC((uint64_t)&v34, (uint64_t)v33);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26894B320);
    type metadata accessor for EntitySearchSignalLocal();
    if (swift_dynamicCast()) {
      break;
    }
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v34);
    v14 += 40;
    if (!--v15)
    {
      swift_bridgeObjectRelease();
      goto LABEL_16;
    }
  }
  swift_bridgeObjectRelease();
  swift_release();
  sub_237EC4D08(&v34, (uint64_t)v36);
  if (swift_dynamicCast())
  {
    unint64_t v16 = *(void *)(v34 + 16);
    swift_bridgeObjectRetain();
    swift_release();
  }
  else
  {
LABEL_16:
    unint64_t v16 = sub_237FCFAF8(MEMORY[0x263F8EE78]);
    if (!v9) {
      goto LABEL_23;
    }
  }
  uint64_t v17 = a2 + 32;
  swift_bridgeObjectRetain();
  uint64_t v18 = v9;
  while (1)
  {
    sub_237ECEFFC(v17, (uint64_t)&v34);
    sub_237ECEFFC((uint64_t)&v34, (uint64_t)v33);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26894B320);
    type metadata accessor for LastNowPlayingSignal();
    if (swift_dynamicCast()) {
      break;
    }
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v34);
    v17 += 40;
    if (!--v18)
    {
      swift_bridgeObjectRelease();
      goto LABEL_23;
    }
  }
  swift_bridgeObjectRelease();
  swift_release();
  sub_237EC4D08(&v34, (uint64_t)v36);
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_23:
    unint64_t v19 = sub_237FCFAF8(MEMORY[0x263F8EE78]);
    if (!v9) {
      goto LABEL_30;
    }
    goto LABEL_24;
  }
  unint64_t v19 = *(void *)(v34 + 48);
  swift_bridgeObjectRetain();
  swift_release();
LABEL_24:
  uint64_t v20 = a2 + 32;
  swift_bridgeObjectRetain();
  while (1)
  {
    sub_237ECEFFC(v20, (uint64_t)&v34);
    sub_237ECEFFC((uint64_t)&v34, (uint64_t)v33);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26894B320);
    type metadata accessor for ForegroundAppSignal();
    if (swift_dynamicCast()) {
      break;
    }
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v34);
    v20 += 40;
    if (!--v9)
    {
      swift_bridgeObjectRelease();
      goto LABEL_30;
    }
  }
  swift_bridgeObjectRelease();
  swift_release();
  sub_237EC4D08(&v34, (uint64_t)v36);
  if (swift_dynamicCast())
  {
    uint64_t v21 = *(void *)(v34 + 24);
    uint64_t v22 = *(void *)(v34 + 32);
    swift_bridgeObjectRetain();
    swift_release();
    goto LABEL_31;
  }
LABEL_30:
  uint64_t v21 = 0;
  uint64_t v22 = 0;
LABEL_31:
  id v23 = objc_msgSend(a1, sel_mediaSearch);
  if (v23)
  {
    uint64_t v24 = v23;
    id v25 = objc_msgSend(v23, sel_mediaType);
  }
  else
  {
    id v25 = 0;
  }
  uint64_t v26 = sub_2380AB0AC(v13, a3, a4, a5, (uint64_t)v25, a6, v16, a7, v19, v21, v22, (uint64_t)&unk_26EAF7CB8);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v26;
}

uint64_t sub_2380CECD8@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  int v124 = a1;
  id v118 = a4;
  uint64_t v131 = sub_2380E4528();
  uint64_t v6 = *(void *)(v131 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v131);
  uint64_t v120 = (char *)&v112 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  uint64_t v113 = (char *)&v112 - v10;
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  uint64_t v112 = (char *)&v112 - v12;
  uint64_t v13 = MEMORY[0x270FA5388](v11);
  uint64_t v125 = (char *)&v112 - v14;
  uint64_t v15 = MEMORY[0x270FA5388](v13);
  uint64_t v17 = (char *)&v112 - v16;
  MEMORY[0x270FA5388](v15);
  unint64_t v19 = (char *)&v112 - v18;
  uint64_t v20 = sub_2380E2E28();
  uint64_t v116 = *(void *)(v20 - 8);
  uint64_t v117 = v20;
  uint64_t v21 = MEMORY[0x270FA5388](v20);
  uint64_t v115 = (char *)&v112 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v21);
  uint64_t v114 = (char *)&v112 - v23;
  sub_2380E2E18();
  uint64_t v126 = a3;
  uint64_t v24 = sub_2380CA7C4(a2, a3);
  sub_237F9E9F4(v24);
  uint64_t v26 = v25;
  swift_bridgeObjectRelease();
  if (qword_26894AA20 != -1) {
    swift_once();
  }
  uint64_t v27 = __swift_project_value_buffer(v131, (uint64_t)qword_268956458);
  unint64_t v28 = *(void (**)(char *, uint64_t, uint64_t))(v6 + 16);
  uint64_t v129 = v6 + 16;
  uint64_t v130 = v27;
  uint64_t v128 = v28;
  ((void (*)(char *))v28)(v19);
  swift_retain_n();
  unint64_t v29 = sub_2380E4508();
  os_log_type_t v30 = sub_2380E4D38();
  BOOL v31 = os_log_type_enabled(v29, v30);
  uint64_t v122 = v6;
  uint64_t v123 = v17;
  uint64_t v119 = v26;
  if (v31)
  {
    uint64_t v32 = swift_slowAlloc();
    uint64_t v121 = a2;
    uint64_t v33 = (uint8_t *)v32;
    uint64_t v34 = swift_slowAlloc();
    v133[0] = v34;
    *(_DWORD *)uint64_t v33 = 136315138;
    long long v127 = (void (*)(char *, uint64_t))(v33 + 4);
    swift_retain();
    uint64_t v35 = sub_2380E4838();
    unint64_t v37 = v36;
    swift_release();
    uint64_t v132 = sub_237EBC6BC(v35, v37, v133);
    uint64_t v17 = v123;
    sub_2380E4FC8();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_237EB8000, v29, v30, "CompoundSignal#signal compoundActiveScores: %s", v33, 0xCu);
    swift_arrayDestroy();
    uint64_t v38 = v34;
    uint64_t v6 = v122;
    MEMORY[0x23EC87710](v38, -1, -1);
    BOOL v39 = v33;
    a2 = v121;
    MEMORY[0x23EC87710](v39, -1, -1);
  }
  else
  {

    swift_release_n();
  }
  long long v127 = *(void (**)(char *, uint64_t))(v6 + 8);
  v127(v19, v131);
  uint64_t v40 = sub_2380CCEC0(v124, a2, v126);
  sub_237F9E9F4(v40);
  uint64_t v42 = v41;
  swift_bridgeObjectRelease();
  v128(v17, v130, v131);
  swift_retain_n();
  unint64_t v43 = sub_2380E4508();
  os_log_type_t v44 = sub_2380E4D38();
  BOOL v45 = os_log_type_enabled(v43, v44);
  uint64_t v121 = v42;
  if (v45)
  {
    unint64_t v46 = (uint8_t *)swift_slowAlloc();
    uint64_t v47 = swift_slowAlloc();
    v133[0] = v47;
    *(_DWORD *)unint64_t v46 = 136315138;
    swift_retain();
    uint64_t v48 = a2;
    uint64_t v49 = sub_2380E4838();
    unint64_t v51 = v50;
    swift_release();
    uint64_t v52 = v49;
    a2 = v48;
    uint64_t v132 = sub_237EBC6BC(v52, v51, v133);
    sub_2380E4FC8();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_237EB8000, v43, v44, "CompoundSignal#signal compoundAffinityScores: %s", v46, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23EC87710](v47, -1, -1);
    MEMORY[0x23EC87710](v46, -1, -1);

    uint64_t v53 = v123;
  }
  else
  {

    swift_release_n();
    uint64_t v53 = v17;
  }
  v127(v53, v131);
  id v54 = v125;
  uint64_t v55 = sub_2380CE1FC(v124, a2, v126);
  v128(v54, v130, v131);
  swift_bridgeObjectRetain_n();
  uint64_t v56 = sub_2380E4508();
  os_log_type_t v57 = sub_2380E4D38();
  BOOL v58 = os_log_type_enabled(v56, v57);
  uint64_t v123 = (char *)v55;
  if (v58)
  {
    double v59 = (uint8_t *)swift_slowAlloc();
    uint64_t v60 = swift_slowAlloc();
    v133[0] = v60;
    *(_DWORD *)double v59 = 136315138;
    swift_bridgeObjectRetain();
    uint64_t v61 = sub_2380E4C88();
    unint64_t v63 = v62;
    swift_bridgeObjectRelease();
    uint64_t v64 = v61;
    uint64_t v55 = (uint64_t)v123;
    uint64_t v132 = sub_237EBC6BC(v64, v63, v133);
    sub_2380E4FC8();
    swift_bridgeObjectRelease_n();
    uint64_t v65 = v131;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_237EB8000, v56, v57, "CompoundSignal#signal supportFlag: %s", v59, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23EC87710](v60, -1, -1);
    MEMORY[0x23EC87710](v59, -1, -1);

    unint64_t v66 = v125;
    uint64_t v67 = v65;
  }
  else
  {

    swift_bridgeObjectRelease_n();
    unint64_t v66 = v54;
    uint64_t v67 = v131;
  }
  v127(v66, v67);
  id v68 = v112;
  uint64_t v69 = sub_2380CE6C8(v126);
  v128(v68, v130, v131);
  swift_bridgeObjectRetain_n();
  id v70 = sub_2380E4508();
  os_log_type_t v71 = sub_2380E4D38();
  BOOL v72 = os_log_type_enabled(v70, v71);
  uint64_t v125 = (char *)v69;
  if (v72)
  {
    id v73 = (uint8_t *)swift_slowAlloc();
    uint64_t v74 = swift_slowAlloc();
    v133[0] = v74;
    *(_DWORD *)id v73 = 136315138;
    swift_bridgeObjectRetain();
    uint64_t v75 = sub_2380E4C88();
    unint64_t v77 = v76;
    swift_bridgeObjectRelease();
    uint64_t v78 = v75;
    uint64_t v55 = (uint64_t)v123;
    uint64_t v132 = sub_237EBC6BC(v78, v77, v133);
    sub_2380E4FC8();
    swift_bridgeObjectRelease_n();
    uint64_t v69 = (uint64_t)v125;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_237EB8000, v70, v71, "CompoundSignal#signal unicornFlag: %s", v73, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23EC87710](v74, -1, -1);
    MEMORY[0x23EC87710](v73, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  v127(v68, v131);
  id v79 = v113;
  swift_bridgeObjectRetain();
  uint64_t v80 = sub_237ED92E4(v69, v55);
  v128(v79, v130, v131);
  swift_retain_n();
  unsigned int v81 = sub_2380E4508();
  os_log_type_t v82 = sub_2380E4D38();
  if (os_log_type_enabled(v81, v82))
  {
    uint64_t v83 = (uint8_t *)swift_slowAlloc();
    uint64_t v84 = swift_slowAlloc();
    v133[0] = v84;
    *(_DWORD *)uint64_t v83 = 136315138;
    swift_retain();
    uint64_t v85 = sub_2380E4C88();
    unint64_t v87 = v86;
    swift_release();
    uint64_t v132 = sub_237EBC6BC(v85, v87, v133);
    uint64_t v69 = (uint64_t)v125;
    sub_2380E4FC8();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_237EB8000, v81, v82, "CompoundSignal#signal supportUnicornMatch: %s", v83, 0xCu);
    swift_arrayDestroy();
    uint64_t v88 = v84;
    uint64_t v55 = (uint64_t)v123;
    MEMORY[0x23EC87710](v88, -1, -1);
    MEMORY[0x23EC87710](v83, -1, -1);
  }
  else
  {

    swift_release_n();
  }
  v127(v79, v131);
  uint64_t v90 = v119;
  unint64_t v89 = v120;
  uint64_t v91 = sub_2380CE814(v124, v126, v55, v69, v80, v121, v119);
  v128(v89, v130, v131);
  swift_bridgeObjectRetain_n();
  unint64_t v92 = sub_2380E4508();
  os_log_type_t v93 = sub_2380E4D38();
  if (os_log_type_enabled(v92, v93))
  {
    double v94 = (uint8_t *)swift_slowAlloc();
    uint64_t v95 = swift_slowAlloc();
    v133[0] = v95;
    *(_DWORD *)double v94 = 136315138;
    swift_bridgeObjectRetain();
    uint64_t v96 = sub_2380E4838();
    unint64_t v98 = v97;
    swift_bridgeObjectRelease();
    uint64_t v132 = sub_237EBC6BC(v96, v98, v133);
    sub_2380E4FC8();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_237EB8000, v92, v93, "CompoundSignal#signal vq21: %s", v94, 0xCu);
    swift_arrayDestroy();
    uint64_t v99 = v95;
    uint64_t v90 = v119;
    MEMORY[0x23EC87710](v99, -1, -1);
    MEMORY[0x23EC87710](v94, -1, -1);

    os_log_type_t v100 = v120;
  }
  else
  {

    swift_bridgeObjectRelease_n();
    os_log_type_t v100 = v89;
  }
  v127(v100, v131);
  uint64_t v101 = v115;
  sub_2380E2E18();
  uint64_t v102 = v114;
  sub_2380E2D78();
  uint64_t v104 = v103;
  unint64_t v105 = *(void (**)(char *, uint64_t))(v116 + 8);
  uint64_t v106 = v101;
  uint64_t v107 = v117;
  v105(v106, v117);
  uint64_t result = ((uint64_t (*)(char *, uint64_t))v105)(v102, v107);
  uint64_t v109 = v118;
  uint64_t v110 = v121;
  uint64_t *v118 = v90;
  v109[1] = v110;
  uint64_t v111 = v125;
  v109[2] = (uint64_t)v123;
  v109[3] = (uint64_t)v111;
  v109[4] = v80;
  v109[5] = v91;
  v109[6] = v104;
  return result;
}

uint64_t sub_2380CFA30(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26894B8B0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2380CFA98(uint64_t result)
{
  if (result)
  {
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t destroy for CompoundSignal()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for CompoundSignal(void *a1, void *a2)
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
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for CompoundSignal(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[5] = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[6] = a2[6];
  return a1;
}

uint64_t assignWithTake for CompoundSignal(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  return a1;
}

ValueMetadata *type metadata accessor for CompoundSignal()
{
  return &type metadata for CompoundSignal;
}

id privateMediaItemDataFromBacking(recommendationId:assetInfo:subItemIdentifiers:sharedUserIdFromPlayableMusicAccount:)(uint64_t a1, NSObject *a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6, uint8_t *a7)
{
  uint64_t v7 = a7;
  uint64_t v8 = a6;
  uint64_t v9 = a4;
  uint64_t v10 = a3;
  if (a5)
  {
    unint64_t v26 = MEMORY[0x263F8EE78];
    uint64_t v14 = *(void *)(a5 + 16);
    if (v14)
    {
      swift_bridgeObjectRetain_n();
      uint64_t v15 = a5 + 40;
      do
      {
        id v16 = objc_allocWithZone(MEMORY[0x263F0FC58]);
        swift_bridgeObjectRetain();
        uint64_t v17 = (void *)sub_2380E4918();
        swift_bridgeObjectRelease();
        id v18 = objc_msgSend(v16, sel_initWithIdentifier_assetInfo_, v17, 0);

        if (v18)
        {
          MEMORY[0x23EC86100]();
          if (*(void *)((v26 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v26 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
            sub_2380E4B58();
          }
          sub_2380E4B98();
          sub_2380E4B48();
        }
        v15 += 16;
        --v14;
      }
      while (v14);
      swift_bridgeObjectRelease();
      uint64_t v7 = a7;
      unint64_t v19 = v26;
      uint64_t v9 = a4;
      uint64_t v8 = a6;
      uint64_t v10 = a3;
    }
    else
    {
      swift_bridgeObjectRetain();
      unint64_t v19 = MEMORY[0x263F8EE78];
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    unint64_t v19 = 0;
  }
  id v20 = privateMediaItemDataFromBacking(recommendationId:assetInfo:mediaSubItems:sharedUserIdFromPlayableMusicAccount:)(a1, a2, v10, v9, v19, v8, v7);
  swift_bridgeObjectRelease();
  return v20;
}

id privateMediaItemDataFromBacking(recommendationId:assetInfo:mediaSubItems:sharedUserIdFromPlayableMusicAccount:)(uint64_t a1, NSObject *a2, uint64_t a3, void *a4, unint64_t a5, uint64_t a6, uint8_t *a7)
{
  unint64_t v97 = a4;
  unint64_t v98 = a7;
  uint64_t v94 = a1;
  uint64_t v95 = a6;
  uint64_t v93 = a3;
  uint64_t v99 = a2;
  uint64_t v8 = sub_2380E4528();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)&v87 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = MEMORY[0x270FA5388](v10);
  uint64_t v96 = (char *)&v87 - v14;
  uint64_t v15 = MEMORY[0x270FA5388](v13);
  uint64_t v91 = (char *)&v87 - v16;
  uint64_t v17 = MEMORY[0x270FA5388](v15);
  unint64_t v92 = (char *)&v87 - v18;
  MEMORY[0x270FA5388](v17);
  id v20 = (char *)&v87 - v19;
  uint64_t v21 = &off_264D03000;
  id v22 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F10150]), sel_init);
  if (!v22)
  {
    if (qword_26894AA20 != -1) {
      swift_once();
    }
    uint64_t v33 = __swift_project_value_buffer(v8, (uint64_t)qword_268956458);
    uint64_t v34 = v9;
    (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v12, v33, v8);
    uint64_t v35 = sub_2380E4508();
    os_log_type_t v36 = sub_2380E4D48();
    if (os_log_type_enabled(v35, v36))
    {
      unint64_t v37 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v37 = 0;
      _os_log_impl(&dword_237EB8000, v35, v36, "Workarounds#privateMediaItemDataFromBacking Unexpected nil initializer result for _INPBPrivateMediaItemValueData", v37, 2u);
      MEMORY[0x23EC87710](v37, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v34 + 8))(v12, v8);
    return 0;
  }
  uint64_t v23 = (uint64_t)v22;
  uint64_t v90 = v20;
  if (!a5)
  {
    uint64_t v38 = 0;
    goto LABEL_30;
  }
  uint64_t v89 = (uint64_t)v22;
  uint64_t v100 = MEMORY[0x263F8EE78];
  if (a5 >> 62)
  {
    swift_bridgeObjectRetain_n();
    uint64_t v23 = sub_2380E52D8();
    if (v23) {
      goto LABEL_5;
    }
  }
  else
  {
    uint64_t v23 = *(void *)((a5 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain_n();
    if (v23)
    {
LABEL_5:
      uint64_t v87 = v9;
      uint64_t v88 = v8;
      if (v23 < 1)
      {
        __break(1u);
        goto LABEL_63;
      }
      for (uint64_t i = 0; i != v23; ++i)
      {
        if ((a5 & 0xC000000000000001) != 0) {
          id v25 = (id)MEMORY[0x23EC867A0](i, a5);
        }
        else {
          id v25 = *(id *)(a5 + 8 * i + 32);
        }
        unint64_t v26 = v25;
        id v27 = [objc_allocWithZone(MEMORY[0x263F10130]) (SEL)v21[220]];
        if (v27)
        {
          unint64_t v28 = v21;
          id v29 = v27;
          id v30 = objc_msgSend(v26, sel_identifier);
          if (v30)
          {
            sub_2380E4938();

            id v30 = (id)sub_2380E4918();
            swift_bridgeObjectRelease();
          }
          objc_msgSend(v29, sel_setIdentifier_, v30, v87);

          id v31 = v29;
          id v32 = objc_msgSend(v26, sel_assetInfo);
          if (v32)
          {
            sub_2380E4938();

            id v32 = (id)sub_2380E4918();
            swift_bridgeObjectRelease();
          }
          objc_msgSend(v31, sel_setAssetInfo_, v32);

          MEMORY[0x23EC86100]();
          if (*(void *)((v100 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v100 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
            sub_2380E4B58();
          }
          sub_2380E4B98();
          sub_2380E4B48();
          uint64_t v21 = v28;
        }
        else
        {
        }
      }
      swift_bridgeObjectRelease();
      uint64_t v9 = v87;
      uint64_t v8 = v88;
      goto LABEL_29;
    }
  }
  swift_bridgeObjectRelease();
LABEL_29:
  swift_bridgeObjectRelease();
  sub_237EC83D4(0, &qword_26894D5D0);
  uint64_t v38 = (void *)sub_2380E4B08();
  swift_bridgeObjectRelease();
  uint64_t v23 = v89;
LABEL_30:
  BOOL v39 = v97;
  objc_msgSend((id)v23, sel_setMediaSubItems_, v38, v87);

  if (v39) {
    BOOL v39 = (void *)sub_2380E4918();
  }
  uint64_t v40 = v98;
  objc_msgSend((id)v23, sel_setAssetInfo_, v39);

  if (v99) {
    uint64_t v41 = (void *)sub_2380E4918();
  }
  else {
    uint64_t v41 = 0;
  }
  objc_msgSend((id)v23, sel_setRecommendationId_, v41);

  if (v40) {
    uint64_t v42 = (void *)sub_2380E4918();
  }
  else {
    uint64_t v42 = 0;
  }
  objc_msgSend((id)v23, sel_setSharedUserIdFromPlayableMusicAccount_, v42);

  id v43 = [objc_allocWithZone(MEMORY[0x263F10128]) (SEL)v21[220]];
  if (!v43)
  {
    if (qword_26894AA20 == -1)
    {
LABEL_50:
      uint64_t v66 = __swift_project_value_buffer(v8, (uint64_t)qword_268956458);
      (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v96, v66, v8);
      uint64_t v67 = sub_2380E4508();
      os_log_type_t v68 = sub_2380E4D48();
      if (os_log_type_enabled(v67, v68))
      {
        uint64_t v69 = v23;
        id v70 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)id v70 = 0;
        _os_log_impl(&dword_237EB8000, v67, v68, "Workarounds#privateMediaItemDataFromBacking Unexpected nil initializer result for _INPBMediaItemValue", v70, 2u);
        MEMORY[0x23EC87710](v70, -1, -1);
        os_log_type_t v71 = v69;
      }
      else
      {
        os_log_type_t v71 = v67;
        uint64_t v67 = v23;
      }

      (*(void (**)(char *, uint64_t))(v9 + 8))(v96, v8);
      return 0;
    }
LABEL_63:
    swift_once();
    goto LABEL_50;
  }
  os_log_type_t v44 = v43;
  objc_msgSend(v43, sel_setPrivateMediaItemValueData_, v23);
  id v45 = [objc_allocWithZone(MEMORY[0x263F10138]) (SEL)v21[220]];
  if (!v45)
  {
    BOOL v72 = v23;
    if (qword_26894AA20 != -1) {
      swift_once();
    }
    uint64_t v73 = __swift_project_value_buffer(v8, (uint64_t)qword_268956458);
    (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v91, v73, v8);
    uint64_t v74 = sub_2380E4508();
    os_log_type_t v75 = sub_2380E4D48();
    if (os_log_type_enabled(v74, v75))
    {
      unint64_t v76 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v76 = 0;
      _os_log_impl(&dword_237EB8000, v74, v75, "Workarounds#privateMediaItemDataFromBacking Unexpected nil initializer result for _INPBPlayMediaIntent", v76, 2u);
      MEMORY[0x23EC87710](v76, -1, -1);
      unint64_t v77 = v72;
    }
    else
    {
      unint64_t v77 = v74;
      uint64_t v74 = v72;
    }

    (*(void (**)(char *, uint64_t))(v9 + 8))(v91, v8);
    return 0;
  }
  unint64_t v46 = v45;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26894C550);
  uint64_t v47 = swift_allocObject();
  *(_OWORD *)(v47 + 16) = xmmword_2380E73A0;
  *(void *)(v47 + 32) = v44;
  uint64_t v100 = v47;
  sub_2380E4B48();
  sub_237EC83D4(0, &qword_26894B2E0);
  uint64_t v48 = v44;
  uint64_t v49 = (void *)sub_2380E4B08();
  swift_bridgeObjectRelease();
  objc_msgSend(v46, sel_setMediaItems_, v49);

  unint64_t v50 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F0FD48]), sel_initWithIdentifier_backingStore_, 0, v46);
  id v51 = [v50 mediaItems];
  if (!v51) {
    goto LABEL_66;
  }
  uint64_t v52 = v51;
  sub_237EC83D4(0, (unint64_t *)&qword_26894B368);
  unint64_t v53 = sub_2380E4B28();

  if (!(v53 >> 62))
  {
    id v54 = *(void **)((v53 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v54) {
      goto LABEL_43;
    }
    goto LABEL_65;
  }
  swift_bridgeObjectRetain();
  id v54 = (void *)sub_2380E52D8();
  swift_bridgeObjectRelease();
  if (!v54)
  {
LABEL_65:
    swift_bridgeObjectRelease();
LABEL_66:
    if (qword_26894AA20 != -1) {
      swift_once();
    }
    uint64_t v79 = __swift_project_value_buffer(v8, (uint64_t)qword_268956458);
    (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v92, v79, v8);
    uint64_t v80 = sub_2380E4508();
    os_log_type_t v81 = sub_2380E4D48();
    if (os_log_type_enabled(v80, v81))
    {
      os_log_type_t v82 = v23;
      uint64_t v83 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v83 = 0;
      _os_log_impl(&dword_237EB8000, v80, v81, "Workarounds#privateMediaItemDataFromBacking Unexpected nil media item after building INPlayMediaIntent from backing store", v83, 2u);
      MEMORY[0x23EC87710](v83, -1, -1);
      uint64_t v84 = v82;
      uint64_t v85 = v48;
    }
    else
    {
      uint64_t v84 = v80;
      uint64_t v85 = v50;
      uint64_t v80 = v48;
      unint64_t v50 = v23;
    }

    (*(void (**)(char *, uint64_t))(v9 + 8))(v92, v8);
    return 0;
  }
LABEL_43:
  if ((v53 & 0xC000000000000001) != 0)
  {
    id v55 = (id)MEMORY[0x23EC867A0](0, v53);
  }
  else
  {
    if (!*(void *)((v53 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      goto LABEL_76;
    }
    id v55 = *(id *)(v53 + 32);
  }
  id v54 = v55;
  swift_bridgeObjectRelease();
  if (qword_26894AA20 != -1) {
LABEL_76:
  }
    swift_once();
  uint64_t v56 = __swift_project_value_buffer(v8, (uint64_t)qword_268956458);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v90, v56, v8);
  os_log_type_t v57 = v54;
  BOOL v58 = sub_2380E4508();
  os_log_type_t v59 = sub_2380E4D28();
  if (os_log_type_enabled(v58, v59))
  {
    uint64_t v87 = v9;
    uint64_t v60 = (uint8_t *)swift_slowAlloc();
    unint64_t v97 = (void *)swift_slowAlloc();
    unint64_t v98 = v60;
    uint64_t v99 = v50;
    *(_DWORD *)uint64_t v60 = 138412290;
    uint64_t v100 = (uint64_t)v57;
    uint64_t v61 = v57;
    uint64_t v88 = v8;
    unint64_t v62 = v61;
    unint64_t v50 = v99;
    sub_2380E4FC8();
    unint64_t v63 = v97;
    *unint64_t v97 = v57;

    uint64_t v9 = v87;
    uint64_t v8 = v88;
    os_log_type_t v64 = v59;
    uint64_t v65 = v98;
    _os_log_impl(&dword_237EB8000, v58, v64, "Workarounds#privateMediaItemDataFromBacking Resolved hydrated media item from backing store: %@", v98, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26894C570);
    swift_arrayDestroy();
    MEMORY[0x23EC87710](v63, -1, -1);
    MEMORY[0x23EC87710](v65, -1, -1);
  }
  else
  {

    BOOL v58 = v57;
  }

  (*(void (**)(char *, uint64_t))(v9 + 8))(v90, v8);
  id v78 = [v57 privateMediaItemValueData];

  return v78;
}

uint64_t sub_2380D0AEC(uint64_t a1, int64_t a2, void (*a3)(void *), uint64_t a4)
{
  uint64_t v111 = a4;
  uint64_t v112 = a3;
  int64_t v113 = a2;
  uint64_t v129 = sub_2380E3D28();
  uint64_t v151 = *(void *)(v129 - 8);
  uint64_t v5 = MEMORY[0x270FA5388](v129);
  uint64_t v132 = (char *)&v103 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v128 = (char *)&v103 - v7;
  uint64_t v8 = (void *)sub_2380E3CF8();
  uint64_t v140 = *(v8 - 1);
  MEMORY[0x270FA5388](v8);
  uint64_t v152 = (char *)&v103 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v110 = sub_2380E4528();
  uint64_t v109 = *(void *)(v110 - 8);
  MEMORY[0x270FA5388](v110);
  uint64_t v108 = (char *)&v103 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26894C0E0);
  uint64_t v12 = MEMORY[0x270FA5388](v11 - 8);
  uint64_t v136 = (int64_t *)((char *)&v103 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x270FA5388](v12);
  uint64_t v135 = (int64_t *)((char *)&v103 - v14);
  uint64_t v137 = sub_2380E2E28();
  uint64_t v141 = *(char **)(v137 - 8);
  uint64_t v15 = MEMORY[0x270FA5388](v137);
  uint64_t v138 = (char *)&v103 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v15);
  unint64_t v139 = (char *)&v103 - v17;
  uint64_t v18 = sub_2380E46A8();
  uint64_t v19 = *(uint64_t **)(v18 - 8);
  MEMORY[0x270FA5388](v18);
  uint64_t v21 = (char *)&v103 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v150 = sub_2380E4728();
  uint64_t v22 = *(void *)(v150 - 8);
  MEMORY[0x270FA5388](v150);
  unint64_t v24 = (unint64_t)&v103 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26894AB78 != -1) {
LABEL_50:
  }
    swift_once();
  uint64_t v149 = qword_26894D350;
  uint64_t v25 = swift_allocObject();
  *(void *)(v25 + 16) = a1;
  v156 = sub_2380D47B4;
  uint64_t v157 = v25;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_237EBF1FC;
  unint64_t v155 = &block_descriptor_47;
  unint64_t v26 = _Block_copy(aBlock);
  swift_bridgeObjectRetain();
  sub_2380E46D8();
  uint64_t v153 = MEMORY[0x263F8EE78];
  sub_237EBE334((unint64_t *)&qword_26894D730, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26894CD60);
  sub_237EBE3C0();
  sub_2380E5088();
  MEMORY[0x23EC86460](0, v24, v21, v26);
  _Block_release(v26);
  ((void (*)(char *, uint64_t))v19[1])(v21, v18);
  (*(void (**)(unint64_t, uint64_t))(v22 + 8))(v24, v150);
  swift_release();
  uint64_t v107 = sub_238053190(a1, 604800.0);
  MEMORY[0x270FA5388](v107);
  *(&v103 - 2) = v113;
  uint64_t v106 = sub_2380D2F74((void (*)(uint64_t *__return_ptr, char *))sub_2380D47BC, (uint64_t)(&v103 - 4), a1);
  uint64_t v105 = sub_2380D3838(a1);
  uint64_t v27 = sub_2380D32AC(a1);
  uint64_t v104 = sub_238053190(v27, 14400.0);
  swift_release();
  unint64_t v28 = v138;
  sub_2380E2E18();
  sub_2380E2D88();
  uint64_t v21 = v141 + 8;
  uint64_t v18 = v137;
  v134 = (void (*)(char *, uint64_t))*((void *)v141 + 1);
  v134(v28, v137);
  uint64_t v29 = *(void *)(a1 + 64);
  uint64_t v114 = a1 + 64;
  uint64_t v30 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v31 = -1;
  if (v30 < 64) {
    uint64_t v31 = ~(-1 << v30);
  }
  unint64_t v24 = v31 & v29;
  uint64_t v118 = v140 + 16;
  uint64_t v131 = (void (**)(void))(v140 + 32);
  uint64_t v116 = (void (**)(char *, char *, uint64_t))(v21 + 24);
  unsigned int v130 = *MEMORY[0x263F74378];
  v146 = (void (**)(char *, void, uint64_t))(v151 + 104);
  uint64_t v145 = (uint64_t *)(v151 + 8);
  unsigned int v127 = *MEMORY[0x263F74350];
  unsigned int v126 = *MEMORY[0x263F74370];
  unsigned int v125 = *MEMORY[0x263F74340];
  unsigned int v124 = *MEMORY[0x263F74360];
  unsigned int v123 = *MEMORY[0x263F74348];
  unsigned int v122 = *MEMORY[0x263F74358];
  uint64_t v120 = (uint64_t (**)(char *, void *))(v140 + 8);
  int64_t v115 = (unint64_t)(v30 + 63) >> 6;
  int64_t v103 = v115 - 1;
  uint64_t v119 = a1;
  uint64_t result = swift_bridgeObjectRetain();
  uint64_t v117 = 0;
  uint64_t v133 = 0;
  int64_t v142 = 0;
  uint64_t v19 = &qword_26894B3B0;
  uint64_t v33 = MEMORY[0x263F8EE80];
  uint64_t v148 = MEMORY[0x263F8EE80];
  uint64_t v149 = MEMORY[0x263F8EE80];
  uint64_t v141 = v21;
  uint64_t v121 = v8;
  while (1)
  {
    uint64_t v22 = (uint64_t)v136;
    uint64_t v147 = v33;
    if (v24)
    {
      unint64_t v34 = __clz(__rbit64(v24));
      uint64_t v35 = (v24 - 1) & v24;
      unint64_t v36 = v34 | (v142 << 6);
      uint64_t v37 = v140;
LABEL_7:
      uint64_t v38 = *(void *)(v119 + 56);
      BOOL v39 = (void *)(*(void *)(v119 + 48) + 16 * v36);
      uint64_t v40 = v39[1];
      *uint64_t v136 = *v39;
      *(void *)(v22 + 8) = v40;
      uint64_t v41 = v38 + *(void *)(v37 + 72) * v36;
      uint64_t v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_26894B3B0);
      (*(void (**)(uint64_t, uint64_t, void *))(v37 + 16))(v22 + *(int *)(v42 + 48), v41, v8);
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v42 - 8) + 56))(v22, 0, 1, v42);
      swift_bridgeObjectRetain();
      goto LABEL_26;
    }
    int64_t v43 = v142 + 1;
    if (__OFADD__(v142, 1)) {
      goto LABEL_49;
    }
    uint64_t v37 = v140;
    if (v43 < v115)
    {
      unint64_t v44 = *(void *)(v114 + 8 * v43);
      if (v44) {
        goto LABEL_11;
      }
      int64_t v45 = v142 + 2;
      ++v142;
      if (v43 + 1 < v115)
      {
        unint64_t v44 = *(void *)(v114 + 8 * v45);
        if (v44) {
          goto LABEL_14;
        }
        int64_t v142 = v43 + 1;
        if (v43 + 2 < v115)
        {
          unint64_t v44 = *(void *)(v114 + 8 * (v43 + 2));
          if (v44)
          {
            v43 += 2;
            goto LABEL_11;
          }
          int64_t v45 = v43 + 3;
          int64_t v142 = v43 + 2;
          if (v43 + 3 < v115) {
            break;
          }
        }
      }
    }
LABEL_25:
    uint64_t v46 = __swift_instantiateConcreteTypeFromMangledName(&qword_26894B3B0);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v46 - 8) + 56))(v22, 1, 1, v46);
    uint64_t v35 = 0;
LABEL_26:
    uint64_t v47 = v135;
    sub_237FDC42C(v22, (uint64_t)v135);
    uint64_t v48 = __swift_instantiateConcreteTypeFromMangledName(&qword_26894B3B0);
    if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v48 - 8) + 48))(v47, 1, v48) == 1)
    {
      uint64_t v80 = v18;
      swift_release();
      if (qword_26894AA20 != -1) {
        swift_once();
      }
      uint64_t v81 = v110;
      uint64_t v82 = __swift_project_value_buffer(v110, (uint64_t)qword_268956458);
      uint64_t v83 = v109;
      uint64_t v84 = v108;
      (*(void (**)(char *, uint64_t, uint64_t))(v109 + 16))(v108, v82, v81);
      uint64_t v85 = sub_2380E4508();
      os_log_type_t v86 = sub_2380E4D58();
      BOOL v87 = os_log_type_enabled(v85, v86);
      uint64_t v88 = v139;
      uint64_t v89 = v138;
      if (v87)
      {
        uint64_t v90 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v90 = 0;
        _os_log_impl(&dword_237EB8000, v85, v86, "LastNowPlayingSignal#signal returning LastNowPlayingSignal", v90, 2u);
        MEMORY[0x23EC87710](v90, -1, -1);
      }

      (*(void (**)(char *, uint64_t))(v83 + 8))(v84, v81);
      sub_2380E2E18();
      sub_2380E2D78();
      uint64_t v92 = v91;
      uint64_t v93 = v80;
      uint64_t v94 = v80;
      uint64_t v95 = v134;
      v134(v89, v94);
      sub_2380E2D78();
      Swift::Double v96 = Double.rounded(to:)(5);
      uint64_t NowPlayingSignal = type metadata accessor for LastNowPlayingSignal();
      unint64_t v98 = (Swift::Double *)swift_allocObject();
      uint64_t v99 = v133;
      *((void *)v98 + 2) = v117;
      *((void *)v98 + 3) = v99;
      swift_bridgeObjectRelease();
      v98[4] = v96;
      uint64_t v100 = v107;
      *((void *)v98 + 5) = v106;
      *((void *)v98 + 6) = v100;
      uint64_t v101 = v105;
      *((void *)v98 + 7) = v104;
      *((void *)v98 + 8) = v101;
      *((void *)v98 + 9) = v92;
      uint64_t v102 = v148;
      *((void *)v98 + 10) = v149;
      *((void *)v98 + 11) = v102;
      *((void *)v98 + 12) = v147;
      unint64_t v155 = (void *)NowPlayingSignal;
      v156 = (uint64_t (*)())&off_26EB08A90;
      aBlock[0] = v98;
      v112(aBlock);
      v95(v88, v93);
      return __swift_destroy_boxed_opaque_existential_1((uint64_t)aBlock);
    }
    uint64_t v50 = *v47;
    uint64_t v49 = v47[1];
    id v51 = v152;
    (*v131)();
    uint64_t v52 = v138;
    sub_2380E3CD8();
    unint64_t v53 = v139;
    char v54 = sub_2380E2DA8();
    id v55 = v134;
    v134(v52, v18);
    uint64_t v150 = v50;
    unint64_t v144 = v35;
    if (v54)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRetain();
      sub_2380E3CD8();
      v55(v53, v18);
      (*v116)(v53, v52, v18);
      uint64_t v117 = v50;
      uint64_t v133 = v49;
    }
    unint64_t v24 = (unint64_t)v146;
    uint64_t v56 = *v146;
    uint64_t v21 = v128;
    uint64_t v18 = v129;
    (*v146)(v128, v130, v129);
    uint64_t v151 = v49;
    swift_bridgeObjectRetain();
    uint64_t v57 = sub_2380E3D08();
    uint64_t v19 = v145;
    BOOL v58 = (void (*)(char *, uint64_t))*v145;
    ((void (*)(char *, uint64_t))*v145)(v21, v18);
    uint64_t v8 = v132;
    ((void (*)(char *, void, uint64_t))v56)(v132, v127, v18);
    uint64_t v22 = sub_2380E3D08();
    v58((char *)v8, v18);
    BOOL v59 = __OFADD__(v57, v22);
    a1 = v57 + v22;
    if (v59)
    {
      __break(1u);
LABEL_43:
      __break(1u);
LABEL_44:
      __break(1u);
LABEL_45:
      __break(1u);
LABEL_46:
      __break(1u);
LABEL_47:
      __break(1u);
LABEL_48:
      __break(1u);
LABEL_49:
      __break(1u);
      goto LABEL_50;
    }
    ((void (*)(char *, void, uint64_t))v56)(v21, v126, v18);
    uint64_t v22 = sub_2380E3D08();
    v58(v21, v18);
    BOOL v59 = __OFADD__(a1, v22);
    a1 += v22;
    if (v59) {
      goto LABEL_43;
    }
    uint64_t v8 = v51;
    ((void (*)(char *, void, uint64_t))v56)(v21, v125, v18);
    uint64_t v60 = sub_2380E3D08();
    v58(v21, v18);
    BOOL v59 = __OFADD__(a1, v60);
    a1 += v60;
    if (v59) {
      goto LABEL_44;
    }
    ((void (*)(char *, void, uint64_t))v56)(v21, v124, v18);
    uint64_t v61 = sub_2380E3D08();
    v58(v21, v18);
    if (__OFADD__(a1, v61)) {
      goto LABEL_45;
    }
    double v62 = (double)(a1 + v61);
    uint64_t v63 = v149;
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    aBlock[0] = v63;
    a1 = v150;
    uint64_t v143 = v58;
    uint64_t v65 = v151;
    sub_237FA1A2C(v150, v151, isUniquelyReferenced_nonNull_native, v62);
    uint64_t v22 = aBlock[0];
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    uint64_t v149 = HistoryStats.total1Day.getter();
    uint64_t v66 = v56;
    uint64_t v67 = v123;
    uint64_t v8 = v66;
    ((void (*)(char *, void, uint64_t))v66)(v21, v123, v18);
    uint64_t v68 = sub_2380E3D08();
    unint64_t v24 = (unint64_t)v143;
    v143(v21, v18);
    uint64_t v69 = v149 + v68;
    if (__OFADD__(v149, v68)) {
      goto LABEL_46;
    }
    uint64_t v149 = v22;
    double v70 = (double)v69;
    uint64_t v71 = v148;
    char v72 = swift_isUniquelyReferenced_nonNull_native();
    aBlock[0] = v71;
    sub_237FA1A2C(a1, v65, v72, v70);
    uint64_t v22 = aBlock[0];
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v73 = HistoryStats.total1Day.getter();
    ((void (*)(char *, uint64_t, uint64_t))v8)(v21, v67, v18);
    uint64_t v74 = sub_2380E3D08();
    uint64_t v19 = (uint64_t *)v24;
    unint64_t v24 = (unint64_t)v145;
    ((void (*)(char *, uint64_t))v19)(v21, v18);
    BOOL v59 = __OFADD__(v73, v74);
    a1 = v73 + v74;
    if (v59) {
      goto LABEL_47;
    }
    ((void (*)(char *, void, uint64_t))v8)(v21, v122, v18);
    os_log_type_t v75 = v152;
    uint64_t v76 = sub_2380E3D08();
    ((void (*)(char *, uint64_t))v19)(v21, v18);
    if (__OFADD__(a1, v76)) {
      goto LABEL_48;
    }
    uint64_t v148 = v22;
    double v77 = (double)(a1 + v76);
    uint64_t v78 = v147;
    char v79 = swift_isUniquelyReferenced_nonNull_native();
    aBlock[0] = v78;
    sub_237FA1A2C(v150, v151, v79, v77);
    uint64_t v33 = aBlock[0];
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v8 = v121;
    uint64_t result = (*v120)(v75, v121);
    uint64_t v18 = v137;
    uint64_t v19 = &qword_26894B3B0;
    unint64_t v24 = v144;
  }
  unint64_t v44 = *(void *)(v114 + 8 * v45);
  if (v44)
  {
LABEL_14:
    int64_t v43 = v45;
LABEL_11:
    uint64_t v35 = (v44 - 1) & v44;
    unint64_t v36 = __clz(__rbit64(v44)) + (v43 << 6);
    int64_t v142 = v43;
    goto LABEL_7;
  }
  while (1)
  {
    int64_t v43 = v45 + 1;
    if (__OFADD__(v45, 1)) {
      break;
    }
    if (v43 >= v115)
    {
      int64_t v142 = v103;
      goto LABEL_25;
    }
    unint64_t v44 = *(void *)(v114 + 8 * v43);
    ++v45;
    if (v44) {
      goto LABEL_11;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_2380D1CB4(uint64_t a1)
{
  uint64_t v73 = sub_2380E2E28();
  uint64_t v2 = *(void *)(v73 - 8);
  MEMORY[0x270FA5388](v73);
  char v72 = (char *)&v63 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v87 = sub_2380E4528();
  uint64_t v4 = *(void *)(v87 - 8);
  MEMORY[0x270FA5388](v87);
  uint64_t v6 = (char *)&v63 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v82 = sub_2380E3CF8();
  uint64_t v7 = *(void *)(v82 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v82);
  uint64_t v10 = (char *)&v63 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = MEMORY[0x270FA5388](v8);
  uint64_t v13 = (char *)&v63 - v12;
  MEMORY[0x270FA5388](v11);
  uint64_t v88 = (char *)&v63 - v14;
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_26894C0E0);
  uint64_t v16 = MEMORY[0x270FA5388](v15 - 8);
  uint64_t v18 = (uint64_t *)((char *)&v63 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x270FA5388](v16);
  uint64_t v83 = (uint64_t *)((char *)&v63 - v19);
  uint64_t v20 = *(void *)(a1 + 64);
  uint64_t v65 = a1 + 64;
  uint64_t v21 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v22 = -1;
  if (v21 < 64) {
    uint64_t v22 = ~(-1 << v21);
  }
  unint64_t v23 = v22 & v20;
  uint64_t v85 = (void (**)(char *, char *, uint64_t))(v7 + 16);
  char v79 = (void (**)(char *, uint64_t, uint64_t))(v4 + 16);
  uint64_t v80 = (void (**)(char *, char *, uint64_t))(v7 + 32);
  uint64_t v74 = v7;
  double v77 = (void (**)(char *, uint64_t))(v4 + 8);
  uint64_t v78 = (void (**)(char *, uint64_t))(v7 + 8);
  double v70 = (void (**)(char *, uint64_t))(v2 + 8);
  int64_t v66 = (unint64_t)(v21 + 63) >> 6;
  int64_t v64 = v66 - 1;
  uint64_t v75 = a1;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v84 = 0;
  *(void *)&long long v25 = 136315650;
  long long v69 = v25;
  uint64_t v68 = MEMORY[0x263F8EE58] + 8;
  uint64_t v71 = v6;
  uint64_t v81 = v18;
  uint64_t v67 = v13;
  while (1)
  {
    if (v23)
    {
      uint64_t v86 = (v23 - 1) & v23;
      unint64_t v27 = __clz(__rbit64(v23)) | (v84 << 6);
      uint64_t v28 = v82;
      uint64_t v29 = v88;
LABEL_8:
      uint64_t v30 = v74;
      uint64_t v31 = *(void *)(v75 + 56);
      id v32 = (void *)(*(void *)(v75 + 48) + 16 * v27);
      uint64_t v33 = v32[1];
      void *v18 = *v32;
      v18[1] = v33;
      uint64_t v34 = v31 + *(void *)(v30 + 72) * v27;
      uint64_t v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_26894B3B0);
      (*(void (**)(char *, uint64_t, uint64_t))(v30 + 16))((char *)v18 + *(int *)(v35 + 48), v34, v28);
      (*(void (**)(void *, void, uint64_t, uint64_t))(*(void *)(v35 - 8) + 56))(v18, 0, 1, v35);
      swift_bridgeObjectRetain();
      unint64_t v36 = v83;
      goto LABEL_27;
    }
    int64_t v37 = v84 + 1;
    uint64_t v29 = v88;
    if (__OFADD__(v84, 1))
    {
      __break(1u);
      goto LABEL_34;
    }
    uint64_t v28 = v82;
    unint64_t v36 = v83;
    if (v37 < v66)
    {
      unint64_t v38 = *(void *)(v65 + 8 * v37);
      if (v38) {
        goto LABEL_12;
      }
      int64_t v39 = v84 + 2;
      ++v84;
      if (v37 + 1 < v66)
      {
        unint64_t v38 = *(void *)(v65 + 8 * v39);
        if (v38) {
          goto LABEL_15;
        }
        int64_t v84 = v37 + 1;
        if (v37 + 2 < v66)
        {
          unint64_t v38 = *(void *)(v65 + 8 * (v37 + 2));
          if (v38)
          {
            v37 += 2;
            goto LABEL_12;
          }
          int64_t v39 = v37 + 3;
          int64_t v84 = v37 + 2;
          if (v37 + 3 < v66) {
            break;
          }
        }
      }
    }
LABEL_26:
    uint64_t v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_26894B3B0);
    (*(void (**)(void *, uint64_t, uint64_t, uint64_t))(*(void *)(v40 - 8) + 56))(v18, 1, 1, v40);
    uint64_t v86 = 0;
LABEL_27:
    sub_237FDC42C((uint64_t)v18, (uint64_t)v36);
    uint64_t v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_26894B3B0);
    if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v41 - 8) + 48))(v36, 1, v41) == 1) {
      return swift_release();
    }
    uint64_t v42 = *v36;
    unint64_t v43 = v36[1];
    (*v80)(v29, (char *)v36 + *(int *)(v41 + 48), v28);
    if (qword_26894AA20 != -1) {
      swift_once();
    }
    uint64_t v44 = v87;
    uint64_t v45 = __swift_project_value_buffer(v87, (uint64_t)qword_268956458);
    (*v79)(v6, v45, v44);
    uint64_t v46 = *v85;
    (*v85)(v13, v29, v28);
    v46(v10, v29, v28);
    swift_bridgeObjectRetain();
    uint64_t v47 = v10;
    uint64_t v48 = sub_2380E4508();
    uint64_t v49 = v13;
    os_log_type_t v50 = sub_2380E4D38();
    if (os_log_type_enabled(v48, v50))
    {
      uint64_t v51 = swift_slowAlloc();
      uint64_t v76 = swift_slowAlloc();
      v89[0] = v76;
      *(_DWORD *)uint64_t v51 = v69;
      swift_bridgeObjectRetain();
      *(void *)(v51 + 4) = sub_237EBC6BC(v42, v43, v89);
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v51 + 12) = 2080;
      uint64_t v52 = v72;
      sub_2380E3CD8();
      sub_237EBE334(&qword_26894D5E8, MEMORY[0x263F07490]);
      uint64_t v53 = v73;
      uint64_t v54 = sub_2380E53B8();
      unint64_t v56 = v55;
      (*v70)(v52, v53);
      *(void *)(v51 + 14) = sub_237EBC6BC(v54, v56, v89);
      swift_bridgeObjectRelease();
      uint64_t v57 = *v78;
      (*v78)(v49, v28);
      *(_WORD *)(v51 + 22) = 2080;
      sub_2380E3CB8();
      uint64_t v58 = MEMORY[0x23EC86140]();
      unint64_t v60 = v59;
      swift_bridgeObjectRelease();
      *(void *)(v51 + 24) = sub_237EBC6BC(v58, v60, v89);
      swift_bridgeObjectRelease();
      v57(v47, v28);
      _os_log_impl(&dword_237EB8000, v48, v50, "LastNowPlayingSignal#signal For bundle %s - recency: %s frequencies: %s", (uint8_t *)v51, 0x20u);
      uint64_t v61 = v76;
      swift_arrayDestroy();
      MEMORY[0x23EC87710](v61, -1, -1);
      uint64_t v62 = v51;
      uint64_t v6 = v71;
      MEMORY[0x23EC87710](v62, -1, -1);

      (*v77)(v6, v87);
      uint64_t result = ((uint64_t (*)(char *, uint64_t))v57)(v88, v28);
      uint64_t v10 = v47;
      uint64_t v13 = v67;
    }
    else
    {

      unint64_t v26 = *v78;
      (*v78)(v47, v28);
      v26(v49, v28);
      swift_bridgeObjectRelease_n();
      (*v77)(v6, v87);
      uint64_t result = ((uint64_t (*)(char *, uint64_t))v26)(v88, v28);
      uint64_t v10 = v47;
      uint64_t v13 = v49;
    }
    uint64_t v18 = v81;
    unint64_t v23 = v86;
  }
  unint64_t v38 = *(void *)(v65 + 8 * v39);
  if (v38)
  {
LABEL_15:
    int64_t v37 = v39;
LABEL_12:
    uint64_t v86 = (v38 - 1) & v38;
    unint64_t v27 = __clz(__rbit64(v38)) + (v37 << 6);
    int64_t v84 = v37;
    goto LABEL_8;
  }
  while (1)
  {
    int64_t v37 = v39 + 1;
    if (__OFADD__(v39, 1)) {
      break;
    }
    if (v37 >= v66)
    {
      int64_t v84 = v64;
      goto LABEL_26;
    }
    unint64_t v38 = *(void *)(v65 + 8 * v37);
    ++v39;
    if (v38) {
      goto LABEL_12;
    }
  }
LABEL_34:
  __break(1u);
  return result;
}

void sub_2380D2600(Swift::Double *a1@<X8>)
{
  uint64_t v2 = sub_2380E2E28();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v6 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2380E3CD8();
  sub_2380E2D78();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  *a1 = Double.rounded(to:)(5);
}

uint64_t sub_2380D270C()
{
  uint64_t v0 = sub_237F3C11C((uint64_t)&unk_26EAF4118);
  uint64_t result = swift_arrayDestroy();
  qword_2689565F8 = v0;
  return result;
}

unint64_t sub_2380D2758(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26894C5B0);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_2380EB040;
  *(void *)(inited + 32) = 0xD000000000000013;
  *(void *)(inited + 40) = 0x80000002380F1240;
  uint64_t v7 = v2[10];
  uint64_t v8 = 0;
  uint64_t v9 = 0;
  if (*(void *)(v7 + 16))
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t v10 = sub_237EC9470(a1, a2);
    if (v11) {
      uint64_t v9 = *(void *)(*(void *)(v7 + 56) + 8 * v10);
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  uint64_t v12 = MEMORY[0x263F8D538];
  *(void *)(inited + 48) = v9;
  *(void *)(inited + 72) = v12;
  *(void *)(inited + 80) = 0xD000000000000014;
  *(void *)(inited + 88) = 0x80000002380F1260;
  uint64_t v13 = v3[11];
  if (*(void *)(v13 + 16))
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t v14 = sub_237EC9470(a1, a2);
    if (v15) {
      uint64_t v8 = *(void *)(*(void *)(v13 + 56) + 8 * v14);
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  *(void *)(inited + 96) = v8;
  *(void *)(inited + 120) = v12;
  *(void *)(inited + 128) = 0xD000000000000015;
  *(void *)(inited + 136) = 0x80000002380F1280;
  uint64_t v16 = v3[12];
  if (*(void *)(v16 + 16))
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t v17 = sub_237EC9470(a1, a2);
    uint64_t v18 = 0;
    if (v19) {
      uint64_t v18 = *(void *)(*(void *)(v16 + 56) + 8 * v17);
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v18 = 0;
  }
  *(void *)(inited + 144) = v18;
  *(void *)(inited + 168) = v12;
  *(void *)(inited + 176) = 0xD000000000000014;
  *(void *)(inited + 184) = 0x80000002380F1200;
  uint64_t v20 = v3[3];
  if (v20)
  {
    if (v3[2] == a1 && v20 == a2) {
      unint64_t result = 1;
    }
    else {
      unint64_t result = sub_2380E5408();
    }
  }
  else
  {
    unint64_t result = 0;
  }
  uint64_t v22 = MEMORY[0x263F8D4F8];
  *(unsigned char *)(inited + 192) = result & 1;
  *(void *)(inited + 216) = v22;
  *(void *)(inited + 224) = 0xD00000000000001BLL;
  *(void *)(inited + 232) = 0x80000002380F1220;
  *(void *)(inited + 240) = v3[4];
  *(void *)(inited + 264) = v12;
  *(void *)(inited + 272) = 0xD000000000000017;
  *(void *)(inited + 280) = 0x80000002380F12C0;
  uint64_t v23 = v3[5];
  if (*(void *)(v23 + 16))
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t v24 = sub_237EC9470(a1, a2);
    if (v25) {
      uint64_t v26 = *(void *)(*(void *)(v23 + 56) + 8 * v24);
    }
    else {
      uint64_t v26 = 0x4142750000000000;
    }
    swift_bridgeObjectRelease();
    unint64_t result = swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v26 = 0x4142750000000000;
  }
  *(void *)(inited + 288) = v26;
  *(void *)(inited + 312) = v12;
  *(void *)(inited + 320) = 0xD000000000000015;
  *(void *)(inited + 328) = 0x80000002380F12A0;
  uint64_t v27 = v3[6];
  uint64_t v28 = 0;
  uint64_t v29 = 0;
  if (*(void *)(v27 + 16))
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t v30 = sub_237EC9470(a1, a2);
    if (v31) {
      uint64_t v29 = *(void *)(*(void *)(v27 + 56) + 8 * v30);
    }
    swift_bridgeObjectRelease();
    unint64_t result = swift_bridgeObjectRelease();
  }
  *(void *)(inited + 336) = v29;
  *(void *)(inited + 360) = v12;
  *(void *)(inited + 368) = 0xD00000000000001CLL;
  *(void *)(inited + 376) = 0x80000002380F1320;
  uint64_t v32 = v3[7];
  if (*(void *)(v32 + 16))
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t v33 = sub_237EC9470(a1, a2);
    if (v34) {
      uint64_t v28 = *(void *)(*(void *)(v32 + 56) + 8 * v33);
    }
    swift_bridgeObjectRelease();
    unint64_t result = swift_bridgeObjectRelease();
  }
  *(void *)(inited + 384) = v28;
  *(void *)(inited + 408) = v12;
  *(void *)(inited + 416) = 0xD000000000000015;
  *(void *)(inited + 424) = 0x80000002380F12E0;
  uint64_t v35 = v3[8];
  if (*(void *)(v35 + 16))
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t v36 = sub_237EC9470(a1, a2);
    if (v37) {
      uint64_t v38 = *(void *)(*(void *)(v35 + 56) + 8 * v36);
    }
    else {
      uint64_t v38 = 0;
    }
    swift_bridgeObjectRelease();
    unint64_t result = swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v38 = 0;
  }
  int64_t v39 = 0;
  uint64_t v40 = 0;
  uint64_t v41 = MEMORY[0x263F8D6C8];
  *(void *)(inited + 432) = v38;
  *(void *)(inited + 456) = v41;
  *(void *)(inited + 464) = 0xD000000000000014;
  *(void *)(inited + 472) = 0x80000002380F1300;
  uint64_t v42 = v3[8];
  *(void *)(inited + 504) = v41;
  uint64_t v43 = 1 << *(unsigned char *)(v42 + 32);
  uint64_t v44 = -1;
  if (v43 < 64) {
    uint64_t v44 = ~(-1 << v43);
  }
  uint64_t v45 = v42 + 64;
  unint64_t v46 = v44 & *(void *)(v42 + 64);
  int64_t v47 = (unint64_t)(v43 + 63) >> 6;
  do
  {
    if (v46)
    {
      unint64_t v48 = __clz(__rbit64(v46));
      v46 &= v46 - 1;
      unint64_t v49 = v48 | (v39 << 6);
    }
    else
    {
      int64_t v52 = v39 + 1;
      if (__OFADD__(v39, 1)) {
        goto LABEL_66;
      }
      if (v52 >= v47)
      {
LABEL_64:
        *(void *)(inited + 480) = v40;
        return sub_237FCF0C4(inited);
      }
      unint64_t v53 = *(void *)(v45 + 8 * v52);
      ++v39;
      if (!v53)
      {
        int64_t v39 = v52 + 1;
        if (v52 + 1 >= v47) {
          goto LABEL_64;
        }
        unint64_t v53 = *(void *)(v45 + 8 * v39);
        if (!v53)
        {
          int64_t v39 = v52 + 2;
          if (v52 + 2 >= v47) {
            goto LABEL_64;
          }
          unint64_t v53 = *(void *)(v45 + 8 * v39);
          if (!v53)
          {
            int64_t v39 = v52 + 3;
            if (v52 + 3 >= v47) {
              goto LABEL_64;
            }
            unint64_t v53 = *(void *)(v45 + 8 * v39);
            if (!v53)
            {
              int64_t v39 = v52 + 4;
              if (v52 + 4 >= v47) {
                goto LABEL_64;
              }
              unint64_t v53 = *(void *)(v45 + 8 * v39);
              if (!v53)
              {
                int64_t v54 = v52 + 5;
                if (v54 >= v47) {
                  goto LABEL_64;
                }
                unint64_t v53 = *(void *)(v45 + 8 * v54);
                if (!v53)
                {
                  while (1)
                  {
                    int64_t v39 = v54 + 1;
                    if (__OFADD__(v54, 1)) {
                      goto LABEL_67;
                    }
                    if (v39 >= v47) {
                      goto LABEL_64;
                    }
                    unint64_t v53 = *(void *)(v45 + 8 * v39);
                    ++v54;
                    if (v53) {
                      goto LABEL_63;
                    }
                  }
                }
                int64_t v39 = v54;
              }
            }
          }
        }
      }
LABEL_63:
      unint64_t v46 = (v53 - 1) & v53;
      unint64_t v49 = __clz(__rbit64(v53)) + (v39 << 6);
    }
    uint64_t v50 = *(void *)(*(void *)(v42 + 56) + 8 * v49);
    BOOL v51 = __OFADD__(v40, v50);
    v40 += v50;
  }
  while (!v51);
  __break(1u);
LABEL_66:
  __break(1u);
LABEL_67:
  __break(1u);
  return result;
}

void sub_2380D2CC4(uint64_t a1, uint64_t a2, void *a3)
{
  unint64_t v4 = sub_2380D2758(a1, a2);
  if (!*(void *)(v4 + 16))
  {
    __break(1u);
    goto LABEL_12;
  }
  unint64_t v5 = v4;
  unint64_t v6 = sub_237EC9470(0xD00000000000001BLL, 0x80000002380F1220);
  if ((v7 & 1) == 0)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  sub_237EBCF68(*(void *)(v5 + 56) + 32 * v6, (uint64_t)&v19);
  sub_237ECAB6C(&v19, v21);
  sub_237F78D88();
  swift_dynamicCast();
  objc_msgSend(v18, sel_doubleValue);
  uint64_t v9 = v8;

  a3[6] = v9;
  if (!*(void *)(v5 + 16))
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  unint64_t v10 = sub_237EC9470(0xD000000000000013, 0x80000002380F1240);
  if ((v11 & 1) == 0)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  sub_237EBCF68(*(void *)(v5 + 56) + 32 * v10, (uint64_t)&v19);
  sub_237ECAB6C(&v19, v21);
  swift_dynamicCast();
  objc_msgSend(v18, sel_doubleValue);
  uint64_t v13 = v12;

  a3[33] = v13;
  if (*(void *)(v5 + 16) && (unint64_t v14 = sub_237EC9470(0xD000000000000015, 0x80000002380F12A0), (v15 & 1) != 0))
  {
    sub_237EBCF68(*(void *)(v5 + 56) + 32 * v14, (uint64_t)&v19);
  }
  else
  {
    long long v19 = 0u;
    long long v20 = 0u;
  }
  swift_bridgeObjectRelease();
  if (*((void *)&v20 + 1))
  {
    sub_237ECAB6C(&v19, v21);
    swift_dynamicCast();
    objc_msgSend(v18, sel_doubleValue);
    uint64_t v17 = v16;

    a3[34] = v17;
    return;
  }
LABEL_15:
  __break(1u);
}

double sub_2380D2EC4()
{
  return *(double *)(*(void *)v0 + 72);
}

uint64_t sub_2380D2ED0()
{
  if (qword_26894AC38 != -1) {
    swift_once();
  }
  return swift_bridgeObjectRetain();
}

unint64_t sub_2380D2F2C(uint64_t a1, uint64_t a2)
{
  return sub_2380D2758(a1, a2);
}

void sub_2380D2F50(uint64_t a1, uint64_t a2, void *a3)
{
}

uint64_t sub_2380D2F74(void (*a1)(uint64_t *__return_ptr, char *), uint64_t a2, uint64_t a3)
{
  void (*v36)(uint64_t *__return_ptr, char *);
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;

  uint64_t v4 = v3;
  unint64_t v36 = a1;
  char v37 = a2;
  uint64_t v6 = sub_2380E3CF8();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v30 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26894CD20);
  uint64_t result = sub_2380E52E8();
  int64_t v11 = 0;
  uint64_t v38 = a3;
  uint64_t v14 = *(void *)(a3 + 64);
  uint64_t v13 = a3 + 64;
  uint64_t v12 = v14;
  uint64_t v15 = 1 << *(unsigned char *)(v13 - 32);
  uint64_t v16 = -1;
  if (v15 < 64) {
    uint64_t v16 = ~(-1 << v15);
  }
  unint64_t v17 = v16 & v12;
  uint64_t v30 = v13;
  int64_t v31 = (unint64_t)(v15 + 63) >> 6;
  uint64_t v35 = v7;
  uint64_t v33 = v7 + 16;
  char v34 = (void (**)(char *, uint64_t))(v7 + 8);
  uint64_t v32 = result + 64;
  int64_t v39 = result;
  if ((v16 & v12) == 0) {
    goto LABEL_5;
  }
LABEL_4:
  unint64_t v18 = __clz(__rbit64(v17));
  v17 &= v17 - 1;
  for (unint64_t i = v18 | (v11 << 6); ; unint64_t i = __clz(__rbit64(v21)) + (v11 << 6))
  {
    uint64_t v23 = (uint64_t *)(*(void *)(v38 + 48) + 16 * i);
    uint64_t v24 = *v23;
    uint64_t v25 = v23[1];
    (*(void (**)(char *, unint64_t, uint64_t))(v35 + 16))(v9, *(void *)(v38 + 56) + *(void *)(v35 + 72) * i, v6);
    swift_bridgeObjectRetain();
    v36(&v40, v9);
    if (v4)
    {
      swift_bridgeObjectRelease();
      uint64_t v29 = v39;
      swift_release();
      (*v34)(v9, v6);
      return v29;
    }
    (*v34)(v9, v6);
    *(void *)(v32 + ((i >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << i;
    uint64_t result = v39;
    uint64_t v26 = (void *)(*(void *)(v39 + 48) + 16 * i);
    void *v26 = v24;
    v26[1] = v25;
    *(void *)(*(void *)(result + 56) + 8 * i) = v40;
    uint64_t v27 = *(void *)(result + 16);
    BOOL v20 = __OFADD__(v27, 1);
    uint64_t v28 = v27 + 1;
    if (v20)
    {
      __break(1u);
LABEL_28:
      __break(1u);
      goto LABEL_29;
    }
    *(void *)(result + 16) = v28;
    uint64_t v4 = 0;
    if (v17) {
      goto LABEL_4;
    }
LABEL_5:
    BOOL v20 = __OFADD__(v11++, 1);
    if (v20) {
      goto LABEL_28;
    }
    if (v11 >= v31) {
      return result;
    }
    unint64_t v21 = *(void *)(v30 + 8 * v11);
    if (!v21) {
      break;
    }
LABEL_15:
    unint64_t v17 = (v21 - 1) & v21;
  }
  int64_t v22 = v11 + 1;
  if (v11 + 1 >= v31) {
    return result;
  }
  unint64_t v21 = *(void *)(v30 + 8 * v22);
  if (v21) {
    goto LABEL_14;
  }
  int64_t v22 = v11 + 2;
  if (v11 + 2 >= v31) {
    return result;
  }
  unint64_t v21 = *(void *)(v30 + 8 * v22);
  if (v21) {
    goto LABEL_14;
  }
  int64_t v22 = v11 + 3;
  if (v11 + 3 >= v31) {
    return result;
  }
  unint64_t v21 = *(void *)(v30 + 8 * v22);
  if (v21)
  {
LABEL_14:
    int64_t v11 = v22;
    goto LABEL_15;
  }
  while (1)
  {
    int64_t v11 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (v11 >= v31) {
      return v39;
    }
    unint64_t v21 = *(void *)(v30 + 8 * v11);
    ++v22;
    if (v21) {
      goto LABEL_15;
    }
  }
LABEL_29:
  __break(1u);
  return result;
}

uint64_t sub_2380D32AC(uint64_t a1)
{
  uint64_t v56 = sub_2380E4528();
  uint64_t v2 = *(void *)(v56 - 8);
  MEMORY[0x270FA5388](v56);
  uint64_t v57 = (char *)&v46 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_2380E2E28();
  int64_t v66 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = (char *)&v46 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_2380E3CF8();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  int64_t v11 = (char *)&v46 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  uint64_t v67 = (char *)&v46 - v12;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26894BF50);
  uint64_t result = sub_2380E52E8();
  uint64_t v14 = (void *)result;
  int64_t v15 = 0;
  uint64_t v63 = a1;
  uint64_t v18 = *(void *)(a1 + 64);
  uint64_t v17 = a1 + 64;
  uint64_t v16 = v18;
  uint64_t v19 = 1 << *(unsigned char *)(v17 - 32);
  uint64_t v20 = -1;
  if (v19 < 64) {
    uint64_t v20 = ~(-1 << v19);
  }
  unint64_t v21 = v20 & v16;
  uint64_t v52 = v17;
  int64_t v53 = (unint64_t)(v19 + 63) >> 6;
  unint64_t v48 = (void (**)(char *, uint64_t))(v2 + 8);
  unint64_t v49 = (void (**)(char *, uint64_t, uint64_t))(v2 + 16);
  uint64_t v61 = (void (**)(void))(v66 + 8);
  uint64_t v62 = v8 + 16;
  uint64_t v59 = result + 64;
  unint64_t v60 = (void (**)(char *, uint64_t))(v8 + 8);
  uint64_t v64 = v8;
  uint64_t v58 = (uint64_t (**)(unint64_t, char *, uint64_t))(v8 + 32);
  int64_t v54 = v11;
  unint64_t v55 = (void *)result;
  uint64_t v50 = v7;
  uint64_t v51 = v4;
  int64_t v47 = v6;
  if (!v21) {
    goto LABEL_5;
  }
LABEL_4:
  uint64_t v65 = (v21 - 1) & v21;
  int64_t v66 = v15;
  for (unint64_t i = __clz(__rbit64(v21)) | (v15 << 6); ; unint64_t i = __clz(__rbit64(v24)) + (v25 << 6))
  {
    uint64_t v27 = (uint64_t *)(*(void *)(v63 + 48) + 16 * i);
    uint64_t v29 = *v27;
    uint64_t v28 = v27[1];
    unint64_t v30 = *(void *)(v64 + 72) * i;
    (*(void (**)(char *, unint64_t, uint64_t))(v64 + 16))(v67, *(void *)(v63 + 56) + v30, v7);
    swift_bridgeObjectRetain();
    sub_2380E3CE8();
    int64_t v31 = v6;
    uint64_t v32 = v11;
    uint64_t v33 = v31;
    sub_2380E3CD8();
    sub_2380E2DB8();
    if (v34 <= 0.0)
    {
      sub_2380E3CC8();
      uint64_t v41 = v33;
      int64_t v11 = v32;
    }
    else
    {
      if (qword_26894AA20 != -1) {
        swift_once();
      }
      uint64_t v35 = v56;
      uint64_t v36 = __swift_project_value_buffer(v56, (uint64_t)qword_268956458);
      (*v49)(v57, v36, v35);
      char v37 = sub_2380E4508();
      os_log_type_t v38 = sub_2380E4D48();
      BOOL v39 = os_log_type_enabled(v37, v38);
      int64_t v11 = v54;
      if (v39)
      {
        uint64_t v40 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v40 = 0;
        _os_log_impl(&dword_237EB8000, v37, v38, "HistoryStats cannot add instance from the future", v40, 2u);
        int64_t v11 = v54;
        MEMORY[0x23EC87710](v40, -1, -1);
      }

      (*v48)(v57, v56);
      uint64_t v7 = v50;
      uint64_t v41 = v47;
    }
    uint64_t v14 = v55;
    uint64_t v6 = v41;
    (*v61)();
    (*v60)(v67, v7);
    *(void *)(v59 + ((i >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << i;
    uint64_t v42 = (void *)(v14[6] + 16 * i);
    void *v42 = v29;
    v42[1] = v28;
    uint64_t result = (*v58)(v14[7] + v30, v11, v7);
    uint64_t v43 = v14[2];
    BOOL v44 = __OFADD__(v43, 1);
    uint64_t v45 = v43 + 1;
    if (v44)
    {
      __break(1u);
LABEL_31:
      __break(1u);
      goto LABEL_32;
    }
    v14[2] = v45;
    unint64_t v21 = v65;
    int64_t v15 = v66;
    if (v65) {
      goto LABEL_4;
    }
LABEL_5:
    int64_t v23 = v15 + 1;
    if (__OFADD__(v15, 1)) {
      goto LABEL_31;
    }
    if (v23 >= v53) {
      return (uint64_t)v14;
    }
    unint64_t v24 = *(void *)(v52 + 8 * v23);
    int64_t v25 = v15 + 1;
    if (!v24)
    {
      int64_t v25 = v15 + 2;
      if (v15 + 2 >= v53) {
        return (uint64_t)v14;
      }
      unint64_t v24 = *(void *)(v52 + 8 * v25);
      if (!v24)
      {
        int64_t v25 = v15 + 3;
        if (v15 + 3 >= v53) {
          return (uint64_t)v14;
        }
        unint64_t v24 = *(void *)(v52 + 8 * v25);
        if (!v24) {
          break;
        }
      }
    }
LABEL_18:
    uint64_t v65 = (v24 - 1) & v24;
    int64_t v66 = v25;
  }
  uint64_t v26 = v15 + 4;
  if (v15 + 4 >= v53) {
    return (uint64_t)v14;
  }
  unint64_t v24 = *(void *)(v52 + 8 * v26);
  if (v24)
  {
    int64_t v25 = v15 + 4;
    goto LABEL_18;
  }
  while (1)
  {
    int64_t v25 = v26 + 1;
    if (__OFADD__(v26, 1)) {
      break;
    }
    if (v25 >= v53) {
      return (uint64_t)v14;
    }
    unint64_t v24 = *(void *)(v52 + 8 * v25);
    ++v26;
    if (v24) {
      goto LABEL_18;
    }
  }
LABEL_32:
  __break(1u);
  return result;
}

uint64_t sub_2380D3838(uint64_t a1)
{
  uint64_t v2 = sub_2380E3D28();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  long long v69 = (char *)&v53 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v53 - v6;
  uint64_t v8 = sub_2380E3CF8();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  int64_t v11 = (char *)&v53 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26894BFE0);
  uint64_t result = sub_2380E52E8();
  int64_t v13 = 0;
  uint64_t v70 = a1;
  uint64_t v16 = *(void *)(a1 + 64);
  uint64_t v15 = a1 + 64;
  uint64_t v14 = v16;
  uint64_t v17 = 1 << *(unsigned char *)(v15 - 32);
  uint64_t v18 = -1;
  if (v17 < 64) {
    uint64_t v18 = ~(-1 << v17);
  }
  unint64_t v19 = v18 & v14;
  uint64_t v54 = v15;
  int64_t v55 = (unint64_t)(v17 + 63) >> 6;
  uint64_t v67 = v9 + 16;
  unsigned int v66 = *MEMORY[0x263F74378];
  uint64_t v20 = (void (**)(char *, uint64_t))(v3 + 8);
  unint64_t v21 = (void (**)(char *, void, uint64_t))(v3 + 104);
  unsigned int v65 = *MEMORY[0x263F74350];
  unsigned int v64 = *MEMORY[0x263F74370];
  unsigned int v63 = *MEMORY[0x263F74340];
  unsigned int v62 = *MEMORY[0x263F74360];
  unsigned int v61 = *MEMORY[0x263F74348];
  unsigned int v60 = *MEMORY[0x263F74358];
  uint64_t v68 = v9;
  uint64_t v56 = result + 64;
  uint64_t v57 = (void (**)(char *, uint64_t))(v9 + 8);
  uint64_t v58 = result;
  uint64_t v59 = v8;
  if (!v19) {
    goto LABEL_5;
  }
LABEL_4:
  uint64_t v71 = (v19 - 1) & v19;
  int64_t v72 = v13;
  for (unint64_t i = __clz(__rbit64(v19)) | (v13 << 6); ; unint64_t i = __clz(__rbit64(v24)) + (v25 << 6))
  {
    uint64_t v27 = *(void *)(v70 + 56);
    uint64_t v28 = (uint64_t *)(*(void *)(v70 + 48) + 16 * i);
    uint64_t v29 = v28[1];
    uint64_t v73 = *v28;
    uint64_t v30 = *(void *)(v68 + 72);
    unint64_t v75 = i;
    (*(void (**)(char *, unint64_t, uint64_t))(v68 + 16))(v11, v27 + v30 * i, v8);
    int64_t v31 = *v21;
    (*v21)(v7, v66, v2);
    uint64_t v74 = v29;
    swift_bridgeObjectRetain();
    uint64_t v32 = v11;
    uint64_t v76 = sub_2380E3D08();
    uint64_t v33 = *v20;
    (*v20)(v7, v2);
    double v34 = v69;
    v31(v69, v65, v2);
    uint64_t v35 = sub_2380E3D08();
    uint64_t result = ((uint64_t (*)(char *, uint64_t))v33)(v34, v2);
    BOOL v36 = __OFADD__(v76, v35);
    uint64_t v37 = v76 + v35;
    if (v36)
    {
      __break(1u);
LABEL_30:
      __break(1u);
LABEL_31:
      __break(1u);
LABEL_32:
      __break(1u);
LABEL_33:
      __break(1u);
LABEL_34:
      __break(1u);
LABEL_35:
      __break(1u);
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    v31(v7, v64, v2);
    uint64_t v38 = sub_2380E3D08();
    uint64_t result = ((uint64_t (*)(char *, uint64_t))v33)(v7, v2);
    BOOL v36 = __OFADD__(v37, v38);
    uint64_t v39 = v37 + v38;
    if (v36) {
      goto LABEL_30;
    }
    int64_t v11 = v32;
    v31(v7, v63, v2);
    uint64_t v40 = sub_2380E3D08();
    uint64_t result = ((uint64_t (*)(char *, uint64_t))v33)(v7, v2);
    BOOL v36 = __OFADD__(v39, v40);
    uint64_t v41 = v39 + v40;
    if (v36) {
      goto LABEL_31;
    }
    v31(v7, v62, v2);
    uint64_t v42 = sub_2380E3D08();
    uint64_t result = ((uint64_t (*)(char *, uint64_t))v33)(v7, v2);
    BOOL v36 = __OFADD__(v41, v42);
    uint64_t v43 = v41 + v42;
    if (v36) {
      goto LABEL_32;
    }
    v31(v7, v61, v2);
    uint64_t v44 = sub_2380E3D08();
    uint64_t result = ((uint64_t (*)(char *, uint64_t))v33)(v7, v2);
    BOOL v36 = __OFADD__(v43, v44);
    uint64_t v45 = v43 + v44;
    if (v36) {
      goto LABEL_33;
    }
    v31(v7, v60, v2);
    uint64_t v46 = sub_2380E3D08();
    uint64_t result = ((uint64_t (*)(char *, uint64_t))v33)(v7, v2);
    BOOL v36 = __OFADD__(v45, v46);
    uint64_t v47 = v45 + v46;
    if (v36) {
      goto LABEL_34;
    }
    uint64_t v8 = v59;
    (*v57)(v11, v59);
    unint64_t v48 = v75;
    *(void *)(v56 + ((v75 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v75;
    uint64_t result = v58;
    unint64_t v49 = (void *)(*(void *)(v58 + 48) + 16 * v48);
    uint64_t v50 = v74;
    *unint64_t v49 = v73;
    v49[1] = v50;
    *(void *)(*(void *)(result + 56) + 8 * v48) = v47;
    uint64_t v51 = *(void *)(result + 16);
    BOOL v36 = __OFADD__(v51, 1);
    uint64_t v52 = v51 + 1;
    if (v36) {
      goto LABEL_35;
    }
    *(void *)(result + 16) = v52;
    unint64_t v19 = v71;
    int64_t v13 = v72;
    if (v71) {
      goto LABEL_4;
    }
LABEL_5:
    int64_t v23 = v13 + 1;
    if (__OFADD__(v13, 1)) {
      goto LABEL_36;
    }
    if (v23 >= v55) {
      return result;
    }
    unint64_t v24 = *(void *)(v54 + 8 * v23);
    int64_t v25 = v13 + 1;
    if (!v24)
    {
      int64_t v25 = v13 + 2;
      if (v13 + 2 >= v55) {
        return result;
      }
      unint64_t v24 = *(void *)(v54 + 8 * v25);
      if (!v24)
      {
        int64_t v25 = v13 + 3;
        if (v13 + 3 >= v55) {
          return result;
        }
        unint64_t v24 = *(void *)(v54 + 8 * v25);
        if (!v24) {
          break;
        }
      }
    }
LABEL_18:
    uint64_t v71 = (v24 - 1) & v24;
    int64_t v72 = v25;
  }
  uint64_t v26 = v13 + 4;
  if (v13 + 4 >= v55) {
    return result;
  }
  unint64_t v24 = *(void *)(v54 + 8 * v26);
  if (v24)
  {
    int64_t v25 = v13 + 4;
    goto LABEL_18;
  }
  while (1)
  {
    int64_t v25 = v26 + 1;
    if (__OFADD__(v26, 1)) {
      break;
    }
    if (v25 >= v55) {
      return result;
    }
    unint64_t v24 = *(void *)(v54 + 8 * v25);
    ++v26;
    if (v24) {
      goto LABEL_18;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_2380D3E2C(uint64_t a1, uint64_t a2)
{
  int64_t v2 = *(void *)(a1 + 16);
  uint64_t v3 = MEMORY[0x263F8EE78];
  if (!v2) {
    return v3;
  }
  uint64_t v4 = a1;
  uint64_t v28 = MEMORY[0x263F8EE78];
  sub_237ECF698(0, v2, 0);
  uint64_t v3 = v28;
  uint64_t result = sub_237EEB2F4(v4);
  int64_t v6 = result;
  int v8 = v7;
  char v10 = v9 & 1;
  uint64_t v24 = v4;
  uint64_t v25 = v4 + 56;
  while ((v6 & 0x8000000000000000) == 0 && v6 < 1 << *(unsigned char *)(v4 + 32))
  {
    if (((*(void *)(v25 + (((unint64_t)v6 >> 3) & 0x1FFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
      goto LABEL_19;
    }
    if (*(_DWORD *)(v4 + 36) != v8) {
      goto LABEL_20;
    }
    int64_t v11 = (uint64_t *)(*(void *)(v4 + 48) + 16 * v6);
    uint64_t v13 = *v11;
    uint64_t v12 = v11[1];
    uint64_t v14 = *(void *)(a2 + 64);
    uint64_t v15 = *(void *)(v14 + 16);
    swift_bridgeObjectRetain();
    char v27 = v10;
    if (v15)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      unint64_t v16 = sub_237EC9470(v13, v12);
      if (v17) {
        uint64_t v18 = *(void *)(*(void *)(v14 + 56) + 8 * v16);
      }
      else {
        uint64_t v18 = 0;
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v18 = 0;
    }
    unint64_t v20 = *(void *)(v28 + 16);
    unint64_t v19 = *(void *)(v28 + 24);
    if (v20 >= v19 >> 1) {
      sub_237ECF698(v19 > 1, v20 + 1, 1);
    }
    *(void *)(v28 + 16) = v20 + 1;
    unint64_t v21 = (void *)(v28 + 24 * v20);
    v21[4] = v13;
    v21[5] = v12;
    v21[6] = v18;
    uint64_t v4 = v24;
    uint64_t result = sub_237EEB394(v6, v8, v27 & 1, v24);
    int64_t v6 = result;
    int v8 = v22;
    char v10 = v23 & 1;
    if (!--v2)
    {
      sub_23801885C(result, v22, v23 & 1);
      return v3;
    }
  }
  __break(1u);
LABEL_19:
  __break(1u);
LABEL_20:
  __break(1u);
  return result;
}

uint64_t sub_2380D4018(uint64_t a1, uint64_t a2)
{
  uint64_t v48 = sub_2380E2E28();
  uint64_t v4 = *(void *)(v48 - 8);
  uint64_t v5 = *(void *)(v4 + 64);
  uint64_t v6 = MEMORY[0x270FA5388](v48);
  uint64_t v44 = (char *)&v39 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v47 = (char *)&v39 - v7;
  uint64_t v8 = sub_2380E4528();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  uint64_t v45 = (char *)&v39 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)&v39 - v12;
  if (qword_26894A830 != -1) {
    swift_once();
  }
  uint64_t v46 = sub_237F82714(1014);
  if (qword_26894AA20 != -1) {
    swift_once();
  }
  uint64_t v14 = __swift_project_value_buffer(v8, (uint64_t)qword_268956458);
  uint64_t v42 = *(void (**)(char *))(v9 + 16);
  uint64_t v43 = v14;
  v42(v13);
  uint64_t v15 = sub_2380E4508();
  os_log_type_t v16 = sub_2380E4D58();
  if (os_log_type_enabled(v15, v16))
  {
    char v17 = (uint8_t *)swift_slowAlloc();
    uint64_t v41 = (void (*)(char *, uint64_t))v8;
    uint64_t v18 = v5;
    uint64_t v19 = v9;
    uint64_t v20 = v4;
    uint64_t v21 = a1;
    uint64_t v22 = a2;
    char v23 = v17;
    *(_WORD *)char v17 = 0;
    _os_log_impl(&dword_237EB8000, v15, v16, "LastNowPlayingSignal#signal", v17, 2u);
    uint64_t v24 = v23;
    a2 = v22;
    a1 = v21;
    uint64_t v4 = v20;
    uint64_t v9 = v19;
    uint64_t v5 = v18;
    uint64_t v8 = (uint64_t)v41;
    MEMORY[0x23EC87710](v24, -1, -1);
  }

  uint64_t v41 = *(void (**)(char *, uint64_t))(v9 + 8);
  v41(v13, v8);
  if (qword_26894A7E0 != -1) {
    swift_once();
  }
  uint64_t v40 = qword_268956350;
  uint64_t v25 = (uint64_t (*)(uint64_t))swift_allocObject();
  *((void *)v25 + 2) = v46;
  *((void *)v25 + 3) = a1;
  *((void *)v25 + 4) = a2;
  swift_retain();
  swift_retain();
  uint64_t v26 = v47;
  sub_2380E2E18();
  char v27 = v44;
  uint64_t v28 = v48;
  (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v44, v26, v48);
  unint64_t v29 = (*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  unint64_t v30 = (v5 + v29 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v31 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v4 + 32))(v31 + v29, v27, v28);
  uint64_t v32 = (uint64_t (**)(uint64_t))(v31 + v30);
  *uint64_t v32 = sub_237FA50C0;
  v32[1] = v25;
  uint64_t v33 = v45;
  ((void (*)(char *, uint64_t, uint64_t))v42)(v45, v43, v8);
  swift_retain();
  double v34 = sub_2380E4508();
  os_log_type_t v35 = sub_2380E4D38();
  if (os_log_type_enabled(v34, v35))
  {
    BOOL v36 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)BOOL v36 = 0;
    _os_log_impl(&dword_237EB8000, v34, v35, "NowPlayingUsageCache: retrieving bundle affinity", v36, 2u);
    MEMORY[0x23EC87710](v36, -1, -1);
  }

  v41(v33, v8);
  uint64_t v37 = *(unsigned char **)(v40 + 16);
  swift_retain();
  sub_237F70A80(0x4014000000000000, 0, v37, (void (*)(void))sub_2380D46DC, v31);
  swift_release_n();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v47, v48);
  swift_release();
  return swift_release();
}

uint64_t sub_2380D4514()
{
  uint64_t v1 = sub_2380E44F8();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 33) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = ((*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 16;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_release();
  return MEMORY[0x270FA0238](v0, v6, v5);
}

uint64_t sub_2380D45BC()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_2380D45F4()
{
  swift_release();
  swift_release();
  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_2380D4634()
{
  uint64_t v1 = sub_2380E2E28();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = ((*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 16;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_release();
  return MEMORY[0x270FA0238](v0, v6, v5);
}

uint64_t sub_2380D46DC(uint64_t a1)
{
  uint64_t v3 = *(void *)(sub_2380E2E28() - 8);
  unint64_t v4 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  int64_t v5 = v1 + v4;
  uint64_t v6 = v1 + ((*(void *)(v3 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v7 = *(void (**)(void *))v6;
  uint64_t v8 = *(void *)(v6 + 8);
  return sub_2380D0AEC(a1, v5, v7, v8);
}

uint64_t sub_2380D477C()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_2380D47B4()
{
  return sub_2380D1CB4(*(void *)(v0 + 16));
}

void sub_2380D47BC(Swift::Double *a1@<X8>)
{
}

uint64_t PlaybackItemContainer.__allocating_init(_:assetInfo:subItems:recommendationID:sharedUserIdFromPlayableMusicAccount:)(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  char v17 = (void *)swift_allocObject();
  v17[9] = a5;
  v17[10] = a6;
  v17[11] = a7;
  v17[12] = a8;
  v17[13] = a9;
  return PlaybackItem.init(_:assetInfo:)(a1, a2, a3, a4);
}

uint64_t PlaybackItemContainer.subItems.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t PlaybackItemContainer.recommendationID.getter()
{
  uint64_t v1 = *(void *)(v0 + 80);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t PlaybackItemContainer.sharedUserIdFromPlayableMusicAccount.getter()
{
  uint64_t v1 = *(void *)(v0 + 96);
  swift_bridgeObjectRetain();
  return v1;
}

void PlaybackItemContainer.__allocating_init(_:assetInfo:)()
{
}

void PlaybackItemContainer.init(_:assetInfo:)()
{
}

uint64_t sub_2380D493C()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t PlaybackItemContainer.deinit()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t method lookup function for PlaybackItemContainer(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for PlaybackItemContainer);
}

uint64_t dispatch thunk of PlaybackItemContainer.__allocating_init(_:assetInfo:subItems:recommendationID:sharedUserIdFromPlayableMusicAccount:)()
{
  return (*(uint64_t (**)(void))(v0 + 168))();
}

uint64_t sub_2380D49F0(uint64_t a1)
{
  uint64_t v2 = a1 + 56;
  uint64_t v3 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v4 = -1;
  if (v3 < 64) {
    uint64_t v4 = ~(-1 << v3);
  }
  unint64_t v5 = v4 & *(void *)(a1 + 56);
  int64_t v6 = (unint64_t)(v3 + 63) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v8 = 0;
  while (1)
  {
    if (v5)
    {
      unint64_t v9 = __clz(__rbit64(v5));
      v5 &= v5 - 1;
      unint64_t v10 = v9 | (v8 << 6);
      goto LABEL_5;
    }
    int64_t v15 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v15 >= v6) {
      return swift_release();
    }
    unint64_t v16 = *(void *)(v2 + 8 * v15);
    ++v8;
    if (!v16)
    {
      int64_t v8 = v15 + 1;
      if (v15 + 1 >= v6) {
        return swift_release();
      }
      unint64_t v16 = *(void *)(v2 + 8 * v8);
      if (!v16)
      {
        int64_t v8 = v15 + 2;
        if (v15 + 2 >= v6) {
          return swift_release();
        }
        unint64_t v16 = *(void *)(v2 + 8 * v8);
        if (!v16)
        {
          int64_t v8 = v15 + 3;
          if (v15 + 3 >= v6) {
            return swift_release();
          }
          unint64_t v16 = *(void *)(v2 + 8 * v8);
          if (!v16) {
            break;
          }
        }
      }
    }
LABEL_22:
    unint64_t v5 = (v16 - 1) & v16;
    unint64_t v10 = __clz(__rbit64(v16)) + (v8 << 6);
LABEL_5:
    uint64_t v11 = (uint64_t *)(*(void *)(a1 + 48) + 24 * v10);
    uint64_t v12 = *v11;
    uint64_t v13 = v11[1];
    double v14 = *((double *)v11 + 2);
    swift_bridgeObjectRetain_n();
    sub_237ED5910(&v18, v12, v13, v14);
    swift_bridgeObjectRelease();
    uint64_t result = swift_bridgeObjectRelease();
  }
  int64_t v17 = v15 + 4;
  if (v17 >= v6) {
    return swift_release();
  }
  unint64_t v16 = *(void *)(v2 + 8 * v17);
  if (v16)
  {
    int64_t v8 = v17;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v8 = v17 + 1;
    if (__OFADD__(v17, 1)) {
      break;
    }
    if (v8 >= v6) {
      return swift_release();
    }
    unint64_t v16 = *(void *)(v2 + 8 * v8);
    ++v17;
    if (v16) {
      goto LABEL_22;
    }
  }
LABEL_25:
  __break(1u);
  return result;
}

void sub_2380D4BA0()
{
  type metadata accessor for NowPlayingUsageProvider();
  uint64_t v0 = (void *)swift_allocObject();
  uint64_t v1 = MEMORY[0x263F8EE88];
  v0[2] = 0;
  v0[3] = v1;
  v0[4] = MEMORY[0x263F8EE80];
  id v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08958]), sel_init);
  uint64_t v3 = (void *)sub_2380E4918();
  objc_msgSend(v2, sel_setName_, v3);

  v0[5] = v2;
  qword_268956600 = (uint64_t)v0;
}

uint64_t sub_2380D4C50(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v76 = a1;
  uint64_t v77 = a2;
  uint64_t v67 = *(void *)v2;
  uint64_t v68 = sub_2380E2E28();
  uint64_t v66 = *(void *)(v68 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v68);
  unsigned int v64 = (char *)&v54 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  unsigned int v65 = (char *)&v54 - v6;
  uint64_t v61 = sub_2380E4688();
  uint64_t v60 = *(void *)(v61 - 8);
  MEMORY[0x270FA5388](v61);
  int64_t v8 = (uint64_t *)((char *)&v54 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v70 = sub_2380E4758();
  uint64_t v63 = *(void *)(v70 - 8);
  uint64_t v9 = MEMORY[0x270FA5388](v70);
  uint64_t v11 = (char *)&v54 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  uint64_t v57 = (char *)&v54 - v12;
  uint64_t v69 = sub_2380E46A8();
  uint64_t v75 = *(void *)(v69 - 8);
  MEMORY[0x270FA5388](v69);
  int64_t v72 = (char *)&v54 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_2380E4728();
  uint64_t v73 = *(void *)(v14 - 8);
  uint64_t v74 = v14;
  MEMORY[0x270FA5388](v14);
  uint64_t v71 = (char *)&v54 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_2380E4528();
  uint64_t v17 = *(void *)(v16 - 8);
  uint64_t v18 = MEMORY[0x270FA5388](v16);
  unsigned int v62 = (char *)&v54 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v18);
  uint64_t v21 = (char *)&v54 - v20;
  if (qword_26894AA20 != -1) {
    swift_once();
  }
  uint64_t v22 = __swift_project_value_buffer(v16, (uint64_t)qword_268956458);
  char v23 = *(void (**)(char *, uint64_t, uint64_t))(v17 + 16);
  uint64_t v59 = v22;
  uint64_t v58 = v23;
  ((void (*)(char *))v23)(v21);
  uint64_t v24 = sub_2380E4508();
  os_log_type_t v25 = sub_2380E4D38();
  if (os_log_type_enabled(v24, v25))
  {
    uint64_t v26 = v3;
    char v27 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)char v27 = 0;
    _os_log_impl(&dword_237EB8000, v24, v25, "NowPlayingUsageProvider#affinity...", v27, 2u);
    uint64_t v28 = v27;
    uint64_t v3 = v26;
    MEMORY[0x23EC87710](v28, -1, -1);
  }

  uint64_t v31 = *(void (**)(char *, uint64_t))(v17 + 8);
  uint64_t v30 = v17 + 8;
  unint64_t v29 = v31;
  v31(v21, v16);
  if (v3[2] <= 0.0)
  {
    int64_t v55 = v29;
    uint64_t v56 = v30;
    if (qword_26894AB78 != -1) {
      swift_once();
    }
    uint64_t v54 = qword_26894D350;
    sub_2380E4738();
    *int64_t v8 = 5;
    uint64_t v37 = v60;
    uint64_t v38 = v61;
    (*(void (**)(void *, void, uint64_t))(v60 + 104))(v8, *MEMORY[0x263F8F018], v61);
    uint64_t v39 = v57;
    MEMORY[0x23EC85DA0](v11, v8);
    (*(void (**)(void *, uint64_t))(v37 + 8))(v8, v38);
    uint64_t v63 = *(void *)(v63 + 8);
    ((void (*)(char *, uint64_t))v63)(v11, v70);
    uint64_t v83 = sub_2380DB7EC;
    int64_t v84 = v3;
    uint64_t aBlock = MEMORY[0x263EF8330];
    uint64_t v80 = 1107296256;
    uint64_t v81 = sub_237EBF1FC;
    uint64_t v82 = &block_descriptor_48;
    uint64_t v40 = _Block_copy(&aBlock);
    swift_retain();
    uint64_t v41 = v71;
    sub_2380E46D8();
    uint64_t v78 = MEMORY[0x263F8EE78];
    sub_237ED43D8((unint64_t *)&qword_26894D730, MEMORY[0x263F8F030]);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26894CD60);
    sub_237EBE3C0();
    uint64_t v42 = v72;
    uint64_t v43 = v69;
    sub_2380E5088();
    MEMORY[0x23EC86410](v39, v41, v42, v40);
    _Block_release(v40);
    (*(void (**)(char *, uint64_t))(v75 + 8))(v42, v43);
    (*(void (**)(char *, uint64_t))(v73 + 8))(v41, v74);
    ((void (*)(char *, uint64_t))v63)(v39, v70);
    swift_release();
    uint64_t v44 = v62;
    v58(v62, v59, v16);
    uint64_t v45 = sub_2380E4508();
    os_log_type_t v46 = sub_2380E4D38();
    if (os_log_type_enabled(v45, v46))
    {
      uint64_t v47 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v47 = 0;
      _os_log_impl(&dword_237EB8000, v45, v46, "NowPlayingUsageProvider#affinity no data, loading last 150...", v47, 2u);
      MEMORY[0x23EC87710](v47, -1, -1);
    }

    v55(v44, v16);
    uint64_t v48 = v64;
    sub_2380E2E18();
    unint64_t v49 = v65;
    sub_2380E2D88();
    uint64_t v50 = *(void (**)(char *, uint64_t))(v66 + 8);
    uint64_t v51 = v68;
    v50(v48, v68);
    uint64_t v52 = (void *)swift_allocObject();
    v52[2] = v76;
    uint64_t v53 = v67;
    v52[3] = v77;
    v52[4] = v53;
    swift_retain();
    sub_237ECEBF4(v49, 150, (uint64_t)sub_2380DB82C, (uint64_t)v52);
    swift_release();
    return ((uint64_t (*)(char *, uint64_t))v50)(v49, v51);
  }
  else
  {
    if (qword_26894AB78 != -1) {
      swift_once();
    }
    uint64_t v83 = sub_2380D686C;
    int64_t v84 = 0;
    uint64_t aBlock = MEMORY[0x263EF8330];
    uint64_t v80 = 1107296256;
    uint64_t v81 = sub_237EBF1FC;
    uint64_t v82 = &block_descriptor_20_0;
    uint64_t v32 = _Block_copy(&aBlock);
    uint64_t v33 = v71;
    sub_2380E46D8();
    uint64_t v78 = MEMORY[0x263F8EE78];
    sub_237ED43D8((unint64_t *)&qword_26894D730, MEMORY[0x263F8F030]);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26894CD60);
    sub_237EBE3C0();
    double v34 = v72;
    uint64_t v35 = v69;
    sub_2380E5088();
    MEMORY[0x23EC86460](0, v33, v34, v32);
    _Block_release(v32);
    (*(void (**)(char *, uint64_t))(v75 + 8))(v34, v35);
    (*(void (**)(char *, uint64_t))(v73 + 8))(v33, v74);
    return sub_2380D6A0C(v76, v77);
  }
}

uint64_t sub_2380D5688()
{
  uint64_t v0 = sub_2380E44F8();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)&v16 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_2380E4528();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26894AA20 != -1) {
    swift_once();
  }
  uint64_t v8 = __swift_project_value_buffer(v4, (uint64_t)qword_268956458);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v8, v4);
  uint64_t v9 = sub_2380E4508();
  os_log_type_t v10 = sub_2380E4D58();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v11 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v11 = 0;
    _os_log_impl(&dword_237EB8000, v9, v10, "NowPlayingUsageProvider#affinity (lazy load) no data, loading async...", v11, 2u);
    MEMORY[0x23EC87710](v11, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  sub_2380E4EC8();
  if (qword_26894A818 != -1) {
    swift_once();
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26894B288);
  uint64_t v12 = swift_allocObject();
  uint64_t v13 = MEMORY[0x263F8D6C8];
  *(_OWORD *)(v12 + 16) = xmmword_2380E7450;
  uint64_t v14 = MEMORY[0x263F8D750];
  *(void *)(v12 + 56) = v13;
  *(void *)(v12 + 64) = v14;
  *(void *)(v12 + 32) = 0;
  sub_2380E44E8();
  sub_2380E44B8();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  return sub_2380D6A0C((uint64_t)sub_2380D59B4, 0);
}

uint64_t sub_2380D59B4(uint64_t a1)
{
  uint64_t v79 = a1;
  uint64_t v77 = sub_2380E2E28();
  uint64_t v1 = *(char **)(v77 - 8);
  MEMORY[0x270FA5388](v77);
  uint64_t v76 = (char *)&v69 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v96 = sub_2380E3CF8();
  uint64_t v78 = *(void *)(v96 - 8);
  uint64_t v3 = MEMORY[0x270FA5388](v96);
  uint64_t v94 = (char *)&v69 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = MEMORY[0x270FA5388](v3);
  uint64_t v95 = (char *)&v69 - v6;
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v69 - v7;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26894C0E0);
  uint64_t v10 = MEMORY[0x270FA5388](v9 - 8);
  uint64_t v12 = (int64_t *)((char *)&v69 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x270FA5388](v10);
  uint64_t v91 = (int64_t *)((char *)&v69 - v13);
  uint64_t v14 = sub_2380E4528();
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v16 = MEMORY[0x270FA5388](v14);
  uint64_t v87 = (char *)&v69 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v16);
  uint64_t v19 = (void (*)(char *, uint64_t))((char *)&v69 - v18);
  if (qword_26894AA20 != -1) {
LABEL_35:
  }
    swift_once();
  uint64_t v20 = __swift_project_value_buffer(v14, (uint64_t)qword_268956458);
  uint64_t v21 = *(void (**)(char *, uint64_t, uint64_t))(v15 + 16);
  uint64_t v85 = v15 + 16;
  uint64_t v86 = v20;
  int64_t v84 = v21;
  ((void (*)(void (*)(char *, uint64_t)))v21)(v19);
  uint64_t v22 = sub_2380E4508();
  os_log_type_t v23 = sub_2380E4D58();
  BOOL v24 = os_log_type_enabled(v22, v23);
  uint64_t v90 = v14;
  if (v24)
  {
    os_log_type_t v25 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)os_log_type_t v25 = 0;
    _os_log_impl(&dword_237EB8000, v22, v23, "NowPlayingUsageProvider#affinity load complete.", v25, 2u);
    uint64_t v26 = v25;
    uint64_t v14 = v90;
    MEMORY[0x23EC87710](v26, -1, -1);
  }

  char v27 = *(void (**)(char *, uint64_t))(v15 + 8);
  v15 += 8;
  uint64_t v83 = v27;
  v27((char *)v19, v14);
  uint64_t v28 = *(void *)(v79 + 64);
  uint64_t v70 = v79 + 64;
  uint64_t v29 = 1 << *(unsigned char *)(v79 + 32);
  uint64_t v30 = -1;
  if (v29 < 64) {
    uint64_t v30 = ~(-1 << v29);
  }
  unint64_t v31 = v30 & v28;
  uint64_t v92 = (void (**)(char *, char *, uint64_t))(v78 + 16);
  uint64_t v81 = (void (**)(char *, uint64_t))(v78 + 8);
  uint64_t v82 = (void (**)(char *, char *, uint64_t))(v78 + 32);
  uint64_t v74 = (void (**)(char *, uint64_t))(v1 + 8);
  int64_t v71 = (unint64_t)(v29 + 63) >> 6;
  int64_t v69 = v71 - 1;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v89 = 0;
  uint64_t v1 = (char *)&qword_26894B3B0;
  *(void *)&long long v33 = 136315650;
  long long v73 = v33;
  uint64_t v72 = MEMORY[0x263F8EE58] + 8;
  double v34 = v91;
  uint64_t v75 = v12;
  uint64_t v88 = v15;
  uint64_t v80 = v8;
  while (1)
  {
    if (v31)
    {
      unint64_t v36 = __clz(__rbit64(v31));
      uint64_t v37 = (v31 - 1) & v31;
      unint64_t v38 = v36 | (v89 << 6);
LABEL_11:
      uint64_t v39 = v78;
      uint64_t v40 = *(void *)(v79 + 56);
      uint64_t v41 = (void *)(*(void *)(v79 + 48) + 16 * v38);
      uint64_t v42 = v41[1];
      void *v12 = *v41;
      v12[1] = v42;
      uint64_t v43 = v40 + *(void *)(v39 + 72) * v38;
      uint64_t v44 = __swift_instantiateConcreteTypeFromMangledName(&qword_26894B3B0);
      (*(void (**)(char *, uint64_t, uint64_t))(v39 + 16))((char *)v12 + *(int *)(v44 + 48), v43, v96);
      (*(void (**)(void *, void, uint64_t, uint64_t))(*(void *)(v44 - 8) + 56))(v12, 0, 1, v44);
      swift_bridgeObjectRetain();
      uint64_t v14 = v90;
      double v34 = v91;
      goto LABEL_30;
    }
    int64_t v45 = v89 + 1;
    if (__OFADD__(v89, 1))
    {
      __break(1u);
      goto LABEL_35;
    }
    if (v45 < v71)
    {
      unint64_t v46 = *(void *)(v70 + 8 * v45);
      if (v46) {
        goto LABEL_15;
      }
      int64_t v47 = v89 + 2;
      ++v89;
      if (v45 + 1 < v71)
      {
        unint64_t v46 = *(void *)(v70 + 8 * v47);
        if (v46) {
          goto LABEL_18;
        }
        int64_t v89 = v45 + 1;
        if (v45 + 2 < v71)
        {
          unint64_t v46 = *(void *)(v70 + 8 * (v45 + 2));
          if (v46)
          {
            v45 += 2;
            goto LABEL_15;
          }
          int64_t v47 = v45 + 3;
          int64_t v89 = v45 + 2;
          if (v45 + 3 < v71) {
            break;
          }
        }
      }
    }
LABEL_29:
    uint64_t v48 = __swift_instantiateConcreteTypeFromMangledName(&qword_26894B3B0);
    (*(void (**)(void *, uint64_t, uint64_t, uint64_t))(*(void *)(v48 - 8) + 56))(v12, 1, 1, v48);
    uint64_t v37 = 0;
LABEL_30:
    sub_237FDC42C((uint64_t)v12, (uint64_t)v34);
    uint64_t v49 = __swift_instantiateConcreteTypeFromMangledName(&qword_26894B3B0);
    if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v49 - 8) + 48))(v34, 1, v49) == 1) {
      return swift_release();
    }
    unint64_t v93 = v37;
    uint64_t v51 = *v34;
    unint64_t v50 = v34[1];
    uint64_t v52 = v96;
    (*v82)(v8, (char *)v34 + *(int *)(v49 + 48), v96);
    uint64_t v53 = v87;
    v84(v87, v86, v14);
    uint64_t v54 = *v92;
    (*v92)(v95, v8, v52);
    v54(v94, v8, v52);
    swift_bridgeObjectRetain();
    uint64_t v55 = v14;
    uint64_t v56 = sub_2380E4508();
    os_log_type_t v57 = sub_2380E4D38();
    if (os_log_type_enabled(v56, v57))
    {
      uint64_t v58 = swift_slowAlloc();
      uint64_t v59 = swift_slowAlloc();
      v97[0] = v59;
      *(_DWORD *)uint64_t v58 = v73;
      swift_bridgeObjectRetain();
      *(void *)(v58 + 4) = sub_237EBC6BC(v51, v50, v97);
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v58 + 12) = 2080;
      uint64_t v60 = v76;
      sub_2380E3CD8();
      sub_237ED43D8(&qword_26894D5E8, MEMORY[0x263F07490]);
      uint64_t v61 = v77;
      uint64_t v62 = sub_2380E53B8();
      unint64_t v64 = v63;
      (*v74)(v60, v61);
      *(void *)(v58 + 14) = sub_237EBC6BC(v62, v64, v97);
      swift_bridgeObjectRelease();
      unsigned int v65 = *v81;
      (*v81)(v95, v96);
      *(_WORD *)(v58 + 22) = 2080;
      sub_2380E3CB8();
      uint64_t v19 = (void (*)(char *, uint64_t))MEMORY[0x23EC86140]();
      unint64_t v67 = v66;
      swift_bridgeObjectRelease();
      *(void *)(v58 + 24) = sub_237EBC6BC((uint64_t)v19, v67, v97);
      swift_bridgeObjectRelease();
      v65(v94, v96);
      _os_log_impl(&dword_237EB8000, v56, v57, "NowPlayingUsageProvider#affinity (lazy load) For bundle %s - recency: %s frequencies: %s", (uint8_t *)v58, 0x20u);
      swift_arrayDestroy();
      MEMORY[0x23EC87710](v59, -1, -1);
      uint64_t v68 = v58;
      double v34 = v91;
      MEMORY[0x23EC87710](v68, -1, -1);

      uint64_t v14 = v90;
      uint64_t v15 = v88;
      v83(v53, v90);
      uint64_t v8 = v80;
      uint64_t result = ((uint64_t (*)(char *, uint64_t))v65)(v80, v96);
      uint64_t v12 = v75;
    }
    else
    {

      uint64_t v19 = *v81;
      uint64_t v35 = v96;
      (*v81)(v94, v96);
      v19(v95, v35);
      swift_bridgeObjectRelease_n();
      uint64_t v15 = v88;
      v83(v53, v55);
      uint64_t v8 = v80;
      uint64_t result = ((uint64_t (*)(char *, uint64_t))v19)(v80, v35);
      uint64_t v14 = v55;
    }
    uint64_t v1 = (char *)&qword_26894B3B0;
    unint64_t v31 = v93;
  }
  unint64_t v46 = *(void *)(v70 + 8 * v47);
  if (v46)
  {
LABEL_18:
    int64_t v45 = v47;
LABEL_15:
    uint64_t v37 = (v46 - 1) & v46;
    unint64_t v38 = __clz(__rbit64(v46)) + (v45 << 6);
    int64_t v89 = v45;
    goto LABEL_11;
  }
  while (1)
  {
    int64_t v45 = v47 + 1;
    if (__OFADD__(v47, 1)) {
      break;
    }
    if (v45 >= v71)
    {
      int64_t v89 = v69;
      goto LABEL_29;
    }
    unint64_t v46 = *(void *)(v70 + 8 * v45);
    ++v47;
    if (v46) {
      goto LABEL_15;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_2380D63B8(uint64_t a1, void (*a2)(void), uint64_t a3)
{
  uint64_t v41 = sub_2380E2E28();
  uint64_t v6 = *(void *)(v41 - 8);
  MEMORY[0x270FA5388](v41);
  uint64_t v8 = (char *)v38 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    sub_2380E2E18();
    uint64_t result = sub_2380E2DD8();
    double v11 = floor(v10 / 86400.0);
    if ((~*(void *)&v11 & 0x7FF0000000000000) == 0) {
      goto LABEL_34;
    }
    if (v11 <= -9.22337204e18)
    {
LABEL_35:
      __break(1u);
    }
    else if (v11 < 9.22337204e18)
    {
      uint64_t v12 = (uint64_t)v11;
      uint64_t v42 = a1;
      swift_bridgeObjectRetain();
      sub_2380D49F0(MEMORY[0x263F8EE88]);
      uint64_t v13 = MEMORY[0x263F8EE80];
      uint64_t v43 = MEMORY[0x263F8EE80];
      uint64_t result = sub_2380DABEC(v42, v12, &v43);
      BOOL v14 = __OFSUB__(v12, 28);
      uint64_t v15 = (unint64_t *)(v12 - 28);
      if (!v14)
      {
        uint64_t v16 = result;
        uint64_t v38[3] = a3;
        uint64_t v39 = a2;
        uint64_t v17 = swift_bridgeObjectRetain();
        uint64_t v18 = sub_2380D8B8C(v17, v15);
        v38[1] = 0;
        long long v38[2] = v18;
        swift_bridgeObjectRelease_n();
        uint64_t v19 = *(void (**)(char *, uint64_t))(v6 + 8);
        v19(v8, v41);
        uint64_t v20 = swift_allocObject();
        *(void *)(v20 + 16) = v13;
        v38[0] = v20 + 16;
        uint64_t v21 = *(void *)(v16 + 56);
        uint64_t v40 = v16 + 56;
        uint64_t v22 = 1 << *(unsigned char *)(v16 + 32);
        uint64_t v23 = -1;
        if (v22 < 64) {
          uint64_t v23 = ~(-1 << v22);
        }
        unint64_t v24 = v23 & v21;
        int64_t v25 = (unint64_t)(v22 + 63) >> 6;
        swift_retain_n();
        uint64_t result = swift_retain();
        int64_t v26 = 0;
        while (1)
        {
          if (v24)
          {
            unint64_t v27 = __clz(__rbit64(v24));
            v24 &= v24 - 1;
            unint64_t v28 = v27 | (v26 << 6);
          }
          else
          {
            int64_t v32 = v26 + 1;
            if (__OFADD__(v26, 1))
            {
              __break(1u);
              goto LABEL_33;
            }
            if (v32 >= v25) {
              goto LABEL_28;
            }
            unint64_t v33 = *(void *)(v40 + 8 * v32);
            ++v26;
            if (!v33)
            {
              int64_t v26 = v32 + 1;
              if (v32 + 1 >= v25) {
                goto LABEL_28;
              }
              unint64_t v33 = *(void *)(v40 + 8 * v26);
              if (!v33)
              {
                int64_t v26 = v32 + 2;
                if (v32 + 2 >= v25) {
                  goto LABEL_28;
                }
                unint64_t v33 = *(void *)(v40 + 8 * v26);
                if (!v33)
                {
                  int64_t v26 = v32 + 3;
                  if (v32 + 3 >= v25) {
                    goto LABEL_28;
                  }
                  unint64_t v33 = *(void *)(v40 + 8 * v26);
                  if (!v33)
                  {
                    int64_t v34 = v32 + 4;
                    if (v34 >= v25)
                    {
LABEL_28:
                      swift_retain();
                      uint64_t v35 = swift_release_n();
                      MEMORY[0x270FA5388](v35);
                      v38[-2] = sub_2380DB748;
                      v38[-1] = v20;
                      uint64_t v36 = swift_retain();
                      sub_2380DA6B4(v36, (void (*)(uint64_t, uint64_t))sub_2380DC0D4);
                      swift_release_n();
                      swift_release();
                      swift_beginAccess();
                      uint64_t v37 = *(void *)(v20 + 16);
                      swift_bridgeObjectRetain();
                      swift_release();
                      swift_release();
                      swift_release();
                      ((void (*)(uint64_t))v39)(v37);
                      return swift_bridgeObjectRelease();
                    }
                    unint64_t v33 = *(void *)(v40 + 8 * v34);
                    if (!v33)
                    {
                      while (1)
                      {
                        int64_t v26 = v34 + 1;
                        if (__OFADD__(v34, 1)) {
                          break;
                        }
                        if (v26 >= v25) {
                          goto LABEL_28;
                        }
                        unint64_t v33 = *(void *)(v40 + 8 * v26);
                        ++v34;
                        if (v33) {
                          goto LABEL_27;
                        }
                      }
LABEL_33:
                      __break(1u);
LABEL_34:
                      __break(1u);
                      goto LABEL_35;
                    }
                    int64_t v26 = v34;
                  }
                }
              }
            }
LABEL_27:
            unint64_t v24 = (v33 - 1) & v33;
            unint64_t v28 = __clz(__rbit64(v33)) + (v26 << 6);
          }
          uint64_t v29 = (uint64_t *)(*(void *)(v16 + 48) + 24 * v28);
          uint64_t v31 = *v29;
          uint64_t v30 = v29[1];
          swift_bridgeObjectRetain();
          sub_2380E2DC8();
          sub_2380D79CC(v31, v30, (uint64_t)v8, 1, v20);
          v19(v8, v41);
          uint64_t result = swift_bridgeObjectRelease();
        }
      }
      goto LABEL_37;
    }
    __break(1u);
LABEL_37:
    __break(1u);
    return result;
  }
  sub_237FCF50C(MEMORY[0x263F8EE78]);
  a2();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2380D686C()
{
  uint64_t v0 = sub_2380E44F8();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)&v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2380E4EC8();
  if (qword_26894A818 != -1) {
    swift_once();
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26894B288);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_2380E7450;
  uint64_t v5 = MEMORY[0x263F8D750];
  *(void *)(v4 + 56) = MEMORY[0x263F8D6C8];
  *(void *)(v4 + 64) = v5;
  *(void *)(v4 + 32) = 1;
  sub_2380E44E8();
  sub_2380E44B8();
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

uint64_t sub_2380D6A0C(uint64_t a1, uint64_t a2)
{
  uint64_t v42 = a1;
  uint64_t v43 = a2;
  uint64_t v44 = *v2;
  uint64_t v45 = sub_2380E2E28();
  uint64_t v40 = *(void *)(v45 - 8);
  uint64_t v3 = *(void *)(v40 + 64);
  uint64_t v4 = MEMORY[0x270FA5388](v45);
  uint64_t v39 = (char *)&v36 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v36 - v6;
  uint64_t v8 = MEMORY[0x270FA5388](v5);
  uint64_t v41 = (char *)&v36 - v9;
  MEMORY[0x270FA5388](v8);
  double v11 = (char *)&v36 - v10;
  uint64_t v12 = sub_2380E4528();
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  uint64_t v15 = (char *)&v36 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = v2;
  objc_msgSend((id)v2[5], sel_lock);
  if (qword_26894AA20 != -1) {
    swift_once();
  }
  uint64_t v17 = __swift_project_value_buffer(v12, (uint64_t)qword_268956458);
  (*(void (**)(char *, uint64_t, uint64_t))(v13 + 16))(v15, v17, v12);
  uint64_t v18 = sub_2380E4508();
  os_log_type_t v19 = sub_2380E4D38();
  if (os_log_type_enabled(v18, v19))
  {
    uint64_t v20 = v7;
    uint64_t v21 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v21 = 0;
    _os_log_impl(&dword_237EB8000, v18, v19, "NowPlayingUsageProvider#update [lock aquired]", v21, 2u);
    uint64_t v22 = v21;
    uint64_t v7 = v20;
    MEMORY[0x23EC87710](v22, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
  uint64_t v23 = v11;
  sub_2380E2E18();
  uint64_t v37 = v11;
  sub_2380E2D88();
  sub_2380E2DD8();
  uint64_t v24 = v40;
  unint64_t v38 = *(void (**)(char *, uint64_t))(v40 + 8);
  uint64_t v25 = v45;
  v38(v7, v45);
  int64_t v26 = v41;
  sub_2380E2DC8();
  unint64_t v27 = v39;
  (*(void (**)(char *, char *, uint64_t))(v24 + 16))(v39, v23, v25);
  unint64_t v28 = (*(unsigned __int8 *)(v24 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v24 + 80);
  unint64_t v29 = (v3 + v28 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v30 = (v29 + 23) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v31 = swift_allocObject();
  *(void *)(v31 + 16) = v16;
  (*(void (**)(unint64_t, char *, uint64_t))(v24 + 32))(v31 + v28, v27, v25);
  int64_t v32 = (void *)(v31 + v29);
  uint64_t v33 = v43;
  *int64_t v32 = v42;
  v32[1] = v33;
  *(void *)(v31 + v30) = v44;
  swift_retain();
  swift_retain();
  sub_237ECEBF4(v26, 0x7FFFFFFFFFFFFFFFLL, (uint64_t)sub_2380DB578, v31);
  swift_release();
  int64_t v34 = (uint64_t (*)(char *, uint64_t))v38;
  v38(v26, v25);
  return v34(v37, v25);
}

uint64_t sub_2380D6E50(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t), uint64_t a5)
{
  uint64_t v10 = sub_2380E4528();
  uint64_t v73 = *(void *)(v10 - 8);
  uint64_t v74 = v10;
  MEMORY[0x270FA5388](v10);
  uint64_t v72 = (char *)&v72 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v82 = sub_2380E2E28();
  uint64_t v12 = *(void *)(v82 - 8);
  MEMORY[0x270FA5388](v82);
  uint64_t v14 = (char *)&v72 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = *(void *)(a2 + 24);
  uint64_t v16 = *(void *)(a2 + 32);
  uint64_t v81 = a2;
  if (a1) {
    uint64_t v17 = a1;
  }
  else {
    uint64_t v17 = MEMORY[0x263F8EE88];
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_2380E2DD8();
  double v19 = v18;
  double v20 = floor(v18 / 86400.0);
  if ((~*(void *)&v20 & 0x7FF0000000000000) == 0) {
    goto LABEL_62;
  }
  if (v20 <= -9.22337204e18)
  {
LABEL_63:
    __break(1u);
    goto LABEL_64;
  }
  if (v20 >= 9.22337204e18)
  {
LABEL_64:
    __break(1u);
LABEL_65:
    __break(1u);
LABEL_66:
    __break(1u);
    goto LABEL_67;
  }
  uint64_t v78 = a5;
  uint64_t v79 = a4;
  uint64_t v21 = (uint64_t)v20;
  uint64_t v83 = v17;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_2380D49F0(v15);
  swift_bridgeObjectRelease();
  uint64_t v84 = v16;
  a5 = v83;
  swift_bridgeObjectRetain();
  uint64_t v22 = sub_2380DABEC(a5, v21, &v84);
  BOOL v23 = __OFSUB__(v21, 28);
  uint64_t v24 = (unint64_t *)(v21 - 28);
  if (v23) {
    goto LABEL_65;
  }
  a5 = v22;
  uint64_t v80 = v12;
  uint64_t v75 = a3;
  uint64_t v25 = swift_bridgeObjectRetain();
  int64_t v26 = sub_2380D8B8C(v25, v24);
  uint64_t v76 = 0;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease_n();
  uint64_t v77 = v26;
  if (!a1)
  {
    if (qword_26894AA20 == -1)
    {
LABEL_33:
      uint64_t v47 = v74;
      uint64_t v48 = __swift_project_value_buffer(v74, (uint64_t)qword_268956458);
      unint64_t v50 = v72;
      uint64_t v49 = v73;
      (*(void (**)(char *, uint64_t, uint64_t))(v73 + 16))(v72, v48, v47);
      uint64_t v51 = sub_2380E4508();
      os_log_type_t v52 = sub_2380E4D48();
      if (os_log_type_enabled(v51, v52))
      {
        uint64_t v53 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v53 = 0;
        _os_log_impl(&dword_237EB8000, v51, v52, "NowPlayingUsageProvider#update skipping persistence as events invalid", v53, 2u);
        MEMORY[0x23EC87710](v53, -1, -1);
      }

      (*(void (**)(char *, uint64_t))(v49 + 8))(v50, v47);
      uint64_t v28 = swift_allocObject();
      *(void *)(v28 + 16) = MEMORY[0x263F8EE80];
      uint64_t v74 = v28 + 16;
      uint64_t v54 = a5 + 56;
      uint64_t v55 = 1 << *(unsigned char *)(a5 + 32);
      uint64_t v56 = -1;
      if (v55 < 64) {
        uint64_t v56 = ~(-1 << v55);
      }
      unint64_t v57 = v56 & *(void *)(a5 + 56);
      int64_t v58 = (unint64_t)(v55 + 63) >> 6;
      uint64_t v59 = (void (**)(char *, uint64_t))(v80 + 8);
      swift_retain_n();
      swift_retain();
      int64_t v60 = 0;
      while (1)
      {
        if (v57)
        {
          unint64_t v61 = __clz(__rbit64(v57));
          v57 &= v57 - 1;
          unint64_t v62 = v61 | (v60 << 6);
        }
        else
        {
          int64_t v66 = v60 + 1;
          if (__OFADD__(v60, 1)) {
            goto LABEL_60;
          }
          if (v66 >= v58)
          {
LABEL_57:
            swift_retain();
            uint64_t v69 = swift_release_n();
            MEMORY[0x270FA5388](v69);
            *(&v72 - 2) = (char *)sub_2380DB748;
            *(&v72 - 1) = (char *)v28;
            uint64_t v45 = swift_retain();
            unint64_t v46 = (void (*)(uint64_t, uint64_t))sub_2380DB750;
            goto LABEL_58;
          }
          unint64_t v67 = *(void *)(v54 + 8 * v66);
          ++v60;
          if (!v67)
          {
            int64_t v60 = v66 + 1;
            if (v66 + 1 >= v58) {
              goto LABEL_57;
            }
            unint64_t v67 = *(void *)(v54 + 8 * v60);
            if (!v67)
            {
              int64_t v60 = v66 + 2;
              if (v66 + 2 >= v58) {
                goto LABEL_57;
              }
              unint64_t v67 = *(void *)(v54 + 8 * v60);
              if (!v67)
              {
                int64_t v60 = v66 + 3;
                if (v66 + 3 >= v58) {
                  goto LABEL_57;
                }
                unint64_t v67 = *(void *)(v54 + 8 * v60);
                if (!v67)
                {
                  int64_t v68 = v66 + 4;
                  if (v68 >= v58) {
                    goto LABEL_57;
                  }
                  unint64_t v67 = *(void *)(v54 + 8 * v68);
                  if (!v67)
                  {
                    while (1)
                    {
                      int64_t v60 = v68 + 1;
                      if (__OFADD__(v68, 1)) {
                        goto LABEL_66;
                      }
                      if (v60 >= v58) {
                        goto LABEL_57;
                      }
                      unint64_t v67 = *(void *)(v54 + 8 * v60);
                      ++v68;
                      if (v67) {
                        goto LABEL_56;
                      }
                    }
                  }
                  int64_t v60 = v68;
                }
              }
            }
          }
LABEL_56:
          unint64_t v57 = (v67 - 1) & v67;
          unint64_t v62 = __clz(__rbit64(v67)) + (v60 << 6);
        }
        unint64_t v63 = (uint64_t *)(*(void *)(a5 + 48) + 24 * v62);
        uint64_t v64 = *v63;
        uint64_t v65 = v63[1];
        swift_bridgeObjectRetain();
        sub_2380E2DC8();
        sub_2380D79CC(v64, v65, (uint64_t)v14, 1, v28);
        (*v59)(v14, v82);
        swift_bridgeObjectRelease();
      }
    }
LABEL_67:
    swift_once();
    goto LABEL_33;
  }
  uint64_t v27 = v81;
  *(double *)(v81 + 16) = v19;
  *(void *)(v27 + 24) = a5;
  *(void *)(v27 + 32) = v26;
  swift_retain();
  swift_retain();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v28 = swift_allocObject();
  *(void *)(v28 + 16) = MEMORY[0x263F8EE80];
  uint64_t v74 = v28 + 16;
  uint64_t v29 = a5 + 56;
  uint64_t v30 = 1 << *(unsigned char *)(a5 + 32);
  uint64_t v31 = -1;
  if (v30 < 64) {
    uint64_t v31 = ~(-1 << v30);
  }
  unint64_t v32 = v31 & *(void *)(a5 + 56);
  int64_t v33 = (unint64_t)(v30 + 63) >> 6;
  int64_t v34 = (void (**)(char *, uint64_t))(v80 + 8);
  swift_retain_n();
  swift_retain();
  int64_t v35 = 0;
  while (1)
  {
    if (v32)
    {
      unint64_t v36 = __clz(__rbit64(v32));
      v32 &= v32 - 1;
      unint64_t v37 = v36 | (v35 << 6);
      goto LABEL_13;
    }
    int64_t v41 = v35 + 1;
    if (__OFADD__(v35, 1))
    {
      __break(1u);
LABEL_60:
      __break(1u);
      goto LABEL_61;
    }
    if (v41 >= v33) {
      goto LABEL_31;
    }
    unint64_t v42 = *(void *)(v29 + 8 * v41);
    ++v35;
    if (!v42)
    {
      int64_t v35 = v41 + 1;
      if (v41 + 1 >= v33) {
        goto LABEL_31;
      }
      unint64_t v42 = *(void *)(v29 + 8 * v35);
      if (!v42)
      {
        int64_t v35 = v41 + 2;
        if (v41 + 2 >= v33) {
          goto LABEL_31;
        }
        unint64_t v42 = *(void *)(v29 + 8 * v35);
        if (!v42)
        {
          int64_t v35 = v41 + 3;
          if (v41 + 3 >= v33) {
            goto LABEL_31;
          }
          unint64_t v42 = *(void *)(v29 + 8 * v35);
          if (!v42) {
            break;
          }
        }
      }
    }
LABEL_30:
    unint64_t v32 = (v42 - 1) & v42;
    unint64_t v37 = __clz(__rbit64(v42)) + (v35 << 6);
LABEL_13:
    unint64_t v38 = (uint64_t *)(*(void *)(a5 + 48) + 24 * v37);
    uint64_t v39 = *v38;
    uint64_t v40 = v38[1];
    swift_bridgeObjectRetain();
    sub_2380E2DC8();
    sub_2380D79CC(v39, v40, (uint64_t)v14, 1, v28);
    (*v34)(v14, v82);
    swift_bridgeObjectRelease();
  }
  int64_t v43 = v41 + 4;
  if (v43 < v33)
  {
    unint64_t v42 = *(void *)(v29 + 8 * v43);
    if (!v42)
    {
      while (1)
      {
        int64_t v35 = v43 + 1;
        if (__OFADD__(v43, 1)) {
          break;
        }
        if (v35 >= v33) {
          goto LABEL_31;
        }
        unint64_t v42 = *(void *)(v29 + 8 * v35);
        ++v43;
        if (v42) {
          goto LABEL_30;
        }
      }
LABEL_61:
      __break(1u);
LABEL_62:
      __break(1u);
      goto LABEL_63;
    }
    int64_t v35 = v43;
    goto LABEL_30;
  }
LABEL_31:
  swift_retain();
  uint64_t v44 = swift_release_n();
  MEMORY[0x270FA5388](v44);
  *(&v72 - 2) = (char *)sub_2380DB748;
  *(&v72 - 1) = (char *)v28;
  uint64_t v45 = swift_retain();
  unint64_t v46 = (void (*)(uint64_t, uint64_t))sub_2380DC0D4;
LABEL_58:
  sub_2380DA6B4(v45, v46);
  swift_release_n();
  swift_release();
  swift_beginAccess();
  uint64_t v70 = *(void *)(v28 + 16);
  swift_bridgeObjectRetain();
  swift_release();
  swift_release();
  swift_release();
  v79(v70);
  swift_bridgeObjectRelease();
  return sub_2380D76AC(v81, v75);
}

uint64_t sub_2380D76AC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_2380E2E28();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)v25 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)v25 - v9;
  uint64_t v11 = sub_2380E4528();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)v25 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  objc_msgSend(*(id *)(a1 + 40), sel_unlock);
  if (qword_26894AA20 != -1) {
    swift_once();
  }
  uint64_t v15 = __swift_project_value_buffer(v11, (uint64_t)qword_268956458);
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v14, v15, v11);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v10, a2, v4);
  uint64_t v16 = sub_2380E4508();
  os_log_type_t v17 = sub_2380E4D38();
  if (os_log_type_enabled(v16, v17))
  {
    double v18 = (uint8_t *)swift_slowAlloc();
    v25[0] = v4;
    double v19 = v18;
    *(_DWORD *)double v18 = 134217984;
    v25[1] = v18 + 4;
    sub_2380E2E18();
    sub_2380E2D78();
    uint64_t v21 = v20;
    uint64_t v26 = v11;
    uint64_t v22 = *(void (**)(char *, uint64_t))(v5 + 8);
    uint64_t v23 = v25[0];
    v22(v8, v25[0]);
    uint64_t v27 = v21;
    sub_2380E4FC8();
    v22(v10, v23);
    uint64_t v11 = v26;
    _os_log_impl(&dword_237EB8000, v16, v17, "NowPlayingUsageProvider#update complete in %fs", v19, 0xCu);
    MEMORY[0x23EC87710](v19, -1, -1);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v5 + 8))(v10, v4);
  }

  return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v14, v11);
}

uint64_t sub_2380D79CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9 = sub_2380E4528();
  uint64_t v51 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = (char *)&v45 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26894D4B8);
  uint64_t v13 = MEMORY[0x270FA5388](v12 - 8);
  uint64_t v49 = (char *)&v45 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  uint64_t v16 = (char *)&v45 - v15;
  uint64_t v17 = sub_2380E3CF8();
  uint64_t v18 = *(void *)(v17 - 8);
  MEMORY[0x270FA5388](v17);
  uint64_t v53 = (char *)&v45 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v48 = a5 + 16;
  swift_beginAccess();
  uint64_t v20 = *(void *)(a5 + 16);
  uint64_t v21 = *(void *)(v20 + 16);
  uint64_t v52 = v18;
  uint64_t v50 = a1;
  if (v21)
  {
    swift_bridgeObjectRetain();
    unint64_t v22 = sub_237EC9470(a1, a2);
    uint64_t v18 = v52;
    if (v23)
    {
      (*(void (**)(char *, unint64_t, uint64_t))(v52 + 16))(v16, *(void *)(v20 + 56) + *(void *)(v52 + 72) * v22, v17);
      uint64_t v24 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v18 + 56);
      uint64_t v25 = v16;
      uint64_t v26 = 0;
    }
    else
    {
      uint64_t v24 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v52 + 56);
      uint64_t v25 = v16;
      uint64_t v26 = 1;
    }
    uint64_t v47 = v24;
    v24(v25, v26, 1, v17);
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v47 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v18 + 56);
    v47(v16, 1, 1, v17);
  }
  swift_endAccess();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48))(v16, 1, v17) == 1)
  {
    sub_2380E3CE8();
    uint64_t result = sub_2380DB78C((uint64_t)v16);
  }
  else
  {
    uint64_t result = (*(uint64_t (**)(char *, char *, uint64_t))(v18 + 32))(v53, v16, v17);
  }
  if (a4 >= 1)
  {
    uint64_t v45 = v17;
    uint64_t v46 = a2;
    uint64_t v28 = v52;
    uint64_t v29 = (void (**)(char *, uint64_t, uint64_t))(v51 + 16);
    uint64_t v30 = (uint64_t (**)(char *, uint64_t))(v51 + 8);
    uint64_t v31 = 1;
    while (1)
    {
      sub_2380E2DB8();
      if (v32 <= 0.0)
      {
        uint64_t result = sub_2380E3CC8();
        if (a4 == v31) {
          goto LABEL_23;
        }
      }
      else
      {
        if (qword_26894AA20 != -1) {
          swift_once();
        }
        uint64_t v33 = __swift_project_value_buffer(v9, (uint64_t)qword_268956458);
        (*v29)(v11, v33, v9);
        int64_t v34 = sub_2380E4508();
        os_log_type_t v35 = sub_2380E4D48();
        if (os_log_type_enabled(v34, v35))
        {
          unint64_t v36 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)unint64_t v36 = 0;
          _os_log_impl(&dword_237EB8000, v34, v35, "HistoryStats cannot add instance from the future", v36, 2u);
          unint64_t v37 = v36;
          uint64_t v28 = v52;
          MEMORY[0x23EC87710](v37, -1, -1);
        }

        uint64_t result = (*v30)(v11, v9);
        if (a4 == v31)
        {
LABEL_23:
          uint64_t v39 = *(void (**)(char *, char *, uint64_t))(v28 + 16);
          uint64_t v40 = (uint64_t)v49;
          int64_t v41 = v53;
          uint64_t v42 = v28;
          uint64_t v43 = v45;
          v39(v49, v53, v45);
          v47((char *)v40, 0, 1, v43);
          swift_beginAccess();
          uint64_t v44 = v46;
          swift_bridgeObjectRetain();
          sub_2380AC00C(v40, v50, v44);
          swift_endAccess();
          return (*(uint64_t (**)(char *, uint64_t))(v42 + 8))(v41, v43);
        }
      }
      if (__OFADD__(v31++, 1))
      {
        __break(1u);
        break;
      }
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_2380D7EC0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = sub_2380E2E28();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = &v12[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_2380E2DC8();
  uint64_t v13 = a3;
  uint64_t v14 = a4;
  uint64_t v15 = v10;
  sub_2380DA840(a2, (void (*)(uint64_t, uint64_t, uint64_t))sub_2380DB758);
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v8 + 8))(v10, v7);
}

uint64_t sub_2380D7FE4()
{
  uint64_t v1 = 0x746E65636572;
  if (*v0 != 1) {
    uint64_t v1 = 0x794273746E657665;
  }
  if (*v0) {
    return v1;
  }
  else {
    return 0x6D617473656D6974;
  }
}

uint64_t sub_2380D8048@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_2380DAD70(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_2380D8070()
{
  return 0;
}

uint64_t sub_2380D807C(uint64_t a1)
{
  unint64_t v2 = sub_2380DB170();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2380D80B8(uint64_t a1)
{
  unint64_t v2 = sub_2380DB170();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_2380D80F4(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26894D630);
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v12 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2380DB170();
  sub_2380E5588();
  LOBYTE(v13) = 0;
  sub_2380E5378();
  if (!v3)
  {
    uint64_t v13 = a2;
    HIBYTE(v12) = 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26894D600);
    sub_2380DB2B8(&qword_26894D638, (void (*)(void))sub_2380DB328);
    sub_2380E5388();
    uint64_t v13 = a3;
    HIBYTE(v12) = 2;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26894D618);
    sub_2380DB37C();
    sub_2380E5388();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

uint64_t sub_2380D8304(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26894D6B0);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = &v8[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2380DBE6C();
  sub_2380E5588();
  v8[15] = 0;
  sub_2380E5368();
  if (!v1)
  {
    v8[14] = 1;
    sub_2380E5378();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t sub_2380D8480()
{
  return sub_2380E5538();
}

uint64_t sub_2380D8500@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t result = sub_2380DAEE4(a1);
  if (!v2)
  {
    *a2 = v6;
    a2[1] = result;
    a2[2] = v5;
  }
  return result;
}

uint64_t sub_2380D8530(void *a1)
{
  return sub_2380D80F4(a1, *(void *)(v1 + 8), *(void *)(v1 + 16));
}

uint64_t sub_2380D8550()
{
  if (*v0) {
    return 0x6D617473656D6974;
  }
  else {
    return 0xD000000000000010;
  }
}

uint64_t sub_2380D8594@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_2380DBB80(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_2380D85BC(uint64_t a1)
{
  unint64_t v2 = sub_2380DBE6C();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2380D85F8(uint64_t a1)
{
  unint64_t v2 = sub_2380DBE6C();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_2380D8634()
{
  return sub_2380D8480();
}

uint64_t sub_2380D8640()
{
  return sub_2380E5528();
}

uint64_t sub_2380D86A0()
{
  return sub_2380E5538();
}

void sub_2380D8714(void *a1@<X0>, uint64_t a2@<X8>)
{
  double v6 = sub_2380DBC7C(a1);
  if (!v2)
  {
    *(void *)a2 = v4;
    *(void *)(a2 + 8) = v5;
    *(double *)(a2 + 16) = v6;
  }
}

uint64_t sub_2380D8744(void *a1)
{
  return sub_2380D8304(a1);
}

BOOL sub_2380D8764(uint64_t a1, uint64_t a2)
{
  double v2 = *(double *)(a1 + 16);
  double v3 = *(double *)(a2 + 16);
  if (*(void *)a1 == *(void *)a2 && *(void *)(a1 + 8) == *(void *)(a2 + 8)) {
    return v2 == v3;
  }
  char v5 = sub_2380E5408();
  BOOL result = 0;
  if (v5) {
    return v2 == v3;
  }
  return result;
}

uint64_t sub_2380D87C4()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for NowPlayingUsageProvider()
{
  return self;
}

void *assignWithCopy for NowPlayingUsageProvider.Store(void *a1, void *a2)
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

uint64_t assignWithTake for NowPlayingUsageProvider.Store(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_bridgeObjectRelease();
  return a1;
}

ValueMetadata *type metadata accessor for NowPlayingUsageProvider.Store()
{
  return &type metadata for NowPlayingUsageProvider.Store;
}

uint64_t sub_2380D8900(uint64_t a1, uint64_t a2, uint64_t *a3, unint64_t *a4)
{
  if (a2)
  {
    __swift_instantiateConcreteTypeFromMangledName(a3);
    uint64_t v6 = sub_2380E5148();
    uint64_t v19 = v6;
    sub_2380E50B8();
    if (sub_2380E50E8())
    {
      sub_237EC83D4(0, a4);
      do
      {
        swift_dynamicCast();
        uint64_t v6 = v19;
        unint64_t v13 = *(void *)(v19 + 16);
        if (*(void *)(v19 + 24) <= v13)
        {
          sub_237EE7334(v13 + 1, a3);
          uint64_t v6 = v19;
        }
        uint64_t result = sub_2380E4F78();
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
      while (sub_2380E50E8());
    }
    swift_release();
  }
  else
  {
    swift_unknownObjectRelease();
    return MEMORY[0x263F8EE88];
  }
  return v6;
}

unint64_t sub_2380D8B08(uint64_t a1, uint64_t a2)
{
  sub_2380E4F78();
  unint64_t result = sub_2380E50A8();
  *(void *)(a2 + 56 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
  *(void *)(*(void *)(a2 + 48) + 8 * result) = a1;
  ++*(void *)(a2 + 16);
  return result;
}

unint64_t *sub_2380D8B8C(uint64_t isStackAllocationSafe, unint64_t *a2)
{
  uint64_t v4 = isStackAllocationSafe;
  v11[1] = *MEMORY[0x263EF8340];
  char v5 = *(unsigned char *)(isStackAllocationSafe + 32);
  unint64_t v6 = (unint64_t)((1 << v5) + 63) >> 6;
  size_t v7 = 8 * v6;
  if ((v5 & 0x3Fu) <= 0xD
    || (uint64_t isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), (isStackAllocationSafe & 1) != 0))
  {
    MEMORY[0x270FA5388](isStackAllocationSafe);
    bzero((char *)v11 - ((v7 + 15) & 0x3FFFFFFFFFFFFFF0), v7);
    uint64_t v8 = sub_2380D8CF8((void *)((char *)v11 - ((v7 + 15) & 0x3FFFFFFFFFFFFFF0)), v6, v4, (uint64_t)a2);
    if (v2) {
      swift_willThrow();
    }
    else {
      return v8;
    }
  }
  else
  {
    uint64_t v9 = (void *)swift_slowAlloc();
    bzero(v9, v7);
    a2 = sub_2380D8CF8((unint64_t *)v9, v6, v4, (uint64_t)a2);
    MEMORY[0x23EC87710](v9, -1, -1);
  }
  return a2;
}

unint64_t *sub_2380D8CF8(unint64_t *result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = 0;
  int64_t v6 = 0;
  uint64_t v7 = a3 + 64;
  uint64_t v8 = 1 << *(unsigned char *)(a3 + 32);
  uint64_t v9 = -1;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  unint64_t v10 = v9 & *(void *)(a3 + 64);
  int64_t v11 = (unint64_t)(v8 + 63) >> 6;
  while (1)
  {
    if (v10)
    {
      unint64_t v12 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v13 = v12 | (v6 << 6);
      goto LABEL_5;
    }
    int64_t v14 = v6 + 1;
    if (__OFADD__(v6, 1))
    {
      __break(1u);
      goto LABEL_26;
    }
    if (v14 >= v11) {
      return (unint64_t *)sub_2380D9758(result, a2, v5, a3);
    }
    unint64_t v15 = *(void *)(v7 + 8 * v14);
    ++v6;
    if (!v15)
    {
      int64_t v6 = v14 + 1;
      if (v14 + 1 >= v11) {
        return (unint64_t *)sub_2380D9758(result, a2, v5, a3);
      }
      unint64_t v15 = *(void *)(v7 + 8 * v6);
      if (!v15)
      {
        int64_t v6 = v14 + 2;
        if (v14 + 2 >= v11) {
          return (unint64_t *)sub_2380D9758(result, a2, v5, a3);
        }
        unint64_t v15 = *(void *)(v7 + 8 * v6);
        if (!v15) {
          break;
        }
      }
    }
LABEL_20:
    unint64_t v10 = (v15 - 1) & v15;
    unint64_t v13 = __clz(__rbit64(v15)) + (v6 << 6);
LABEL_5:
    if (*(void *)(*(void *)(a3 + 48) + 8 * v13) > a4)
    {
      *(unint64_t *)((char *)result + ((v13 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v13;
      if (__OFADD__(v5++, 1))
      {
        __break(1u);
        return (unint64_t *)sub_2380D9758(result, a2, v5, a3);
      }
    }
  }
  int64_t v16 = v14 + 3;
  if (v16 >= v11) {
    return (unint64_t *)sub_2380D9758(result, a2, v5, a3);
  }
  unint64_t v15 = *(void *)(v7 + 8 * v16);
  if (v15)
  {
    int64_t v6 = v16;
    goto LABEL_20;
  }
  while (1)
  {
    int64_t v6 = v16 + 1;
    if (__OFADD__(v16, 1)) {
      break;
    }
    if (v6 >= v11) {
      return (unint64_t *)sub_2380D9758(result, a2, v5, a3);
    }
    unint64_t v15 = *(void *)(v7 + 8 * v6);
    ++v16;
    if (v15) {
      goto LABEL_20;
    }
  }
LABEL_26:
  __break(1u);
  return result;
}

uint64_t sub_2380D8E4C(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (!a3) {
    return MEMORY[0x263F8EE80];
  }
  uint64_t v4 = a4;
  uint64_t v5 = a3;
  if (*(void *)(a4 + 16) == a3)
  {
    swift_retain();
    return v4;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26894D668);
  uint64_t result = sub_2380E5308();
  uint64_t v8 = result;
  uint64_t v31 = a2;
  if (a2 < 1) {
    unint64_t v9 = 0;
  }
  else {
    unint64_t v9 = *a1;
  }
  uint64_t v10 = 0;
  uint64_t v11 = result + 64;
  while (1)
  {
    if (v9)
    {
      unint64_t v12 = __clz(__rbit64(v9));
      v9 &= v9 - 1;
      unint64_t v13 = v12 | (v10 << 6);
    }
    else
    {
      uint64_t v14 = v10 + 1;
      if (__OFADD__(v10, 1)) {
        goto LABEL_40;
      }
      if (v14 >= v31) {
        return v8;
      }
      unint64_t v15 = a1[v14];
      ++v10;
      if (!v15)
      {
        uint64_t v10 = v14 + 1;
        if (v14 + 1 >= v31) {
          return v8;
        }
        unint64_t v15 = a1[v10];
        if (!v15)
        {
          uint64_t v10 = v14 + 2;
          if (v14 + 2 >= v31) {
            return v8;
          }
          unint64_t v15 = a1[v10];
          if (!v15)
          {
            uint64_t v16 = v14 + 3;
            if (v16 >= v31) {
              return v8;
            }
            unint64_t v15 = a1[v16];
            if (!v15)
            {
              while (1)
              {
                uint64_t v10 = v16 + 1;
                if (__OFADD__(v16, 1)) {
                  goto LABEL_41;
                }
                if (v10 >= v31) {
                  return v8;
                }
                unint64_t v15 = a1[v10];
                ++v16;
                if (v15) {
                  goto LABEL_24;
                }
              }
            }
            uint64_t v10 = v16;
          }
        }
      }
LABEL_24:
      unint64_t v9 = (v15 - 1) & v15;
      unint64_t v13 = __clz(__rbit64(v15)) + (v10 << 6);
    }
    uint64_t v17 = (uint64_t *)(*(void *)(v4 + 48) + 16 * v13);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    char v20 = *(unsigned char *)(*(void *)(v4 + 56) + v13);
    sub_2380E54E8();
    swift_bridgeObjectRetain();
    sub_2380E49E8();
    uint64_t result = sub_2380E5538();
    uint64_t v21 = -1 << *(unsigned char *)(v8 + 32);
    unint64_t v22 = result & ~v21;
    unint64_t v23 = v22 >> 6;
    if (((-1 << v22) & ~*(void *)(v11 + 8 * (v22 >> 6))) != 0)
    {
      unint64_t v24 = __clz(__rbit64((-1 << v22) & ~*(void *)(v11 + 8 * (v22 >> 6)))) | v22 & 0x7FFFFFFFFFFFFFC0;
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
          goto LABEL_39;
        }
        BOOL v27 = v23 == v26;
        if (v23 == v26) {
          unint64_t v23 = 0;
        }
        v25 |= v27;
        uint64_t v28 = *(void *)(v11 + 8 * v23);
      }
      while (v28 == -1);
      unint64_t v24 = __clz(__rbit64(~v28)) + (v23 << 6);
    }
    *(void *)(v11 + ((v24 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v24;
    uint64_t v29 = (void *)(*(void *)(v8 + 48) + 16 * v24);
    void *v29 = v19;
    v29[1] = v18;
    *(unsigned char *)(*(void *)(v8 + 56) + v24) = v20;
    ++*(void *)(v8 + 16);
    if (__OFSUB__(v5--, 1)) {
      break;
    }
    if (!v5) {
      return v8;
    }
  }
LABEL_39:
  __break(1u);
LABEL_40:
  __break(1u);
LABEL_41:
  __break(1u);
  return result;
}

uint64_t sub_2380D90F4(unint64_t *a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v8 = sub_2380E3CF8();
  uint64_t v50 = *(void *)(v8 - 8);
  uint64_t v9 = MEMORY[0x270FA5388](v8);
  uint64_t v52 = (char *)&v43 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  uint64_t v49 = (char *)&v43 - v12;
  if (!a3) {
    return MEMORY[0x263F8EE80];
  }
  if (a4[2] == a3)
  {
    swift_retain();
    return (uint64_t)a4;
  }
  uint64_t v48 = v11;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26894BF50);
  uint64_t result = sub_2380E5308();
  uint64_t v14 = result;
  uint64_t v43 = a1;
  uint64_t v44 = a2;
  if (a2 < 1) {
    unint64_t v15 = 0;
  }
  else {
    unint64_t v15 = *a1;
  }
  uint64_t v16 = 0;
  uint64_t v46 = v50 + 32;
  uint64_t v47 = v50 + 16;
  uint64_t v17 = result + 64;
  uint64_t v18 = v48;
  uint64_t v45 = a4;
  while (1)
  {
    if (v15)
    {
      unint64_t v19 = __clz(__rbit64(v15));
      v15 &= v15 - 1;
      uint64_t v51 = v16;
      unint64_t v20 = v19 | (v16 << 6);
    }
    else
    {
      uint64_t v21 = v16 + 1;
      if (__OFADD__(v16, 1)) {
        goto LABEL_40;
      }
      if (v21 >= v44) {
        return v14;
      }
      unint64_t v22 = v43[v21];
      uint64_t v23 = v16 + 1;
      if (!v22)
      {
        uint64_t v23 = v16 + 2;
        if (v16 + 2 >= v44) {
          return v14;
        }
        unint64_t v22 = v43[v23];
        if (!v22)
        {
          uint64_t v23 = v16 + 3;
          if (v16 + 3 >= v44) {
            return v14;
          }
          unint64_t v22 = v43[v23];
          if (!v22)
          {
            uint64_t v24 = v16 + 4;
            if (v16 + 4 >= v44) {
              return v14;
            }
            unint64_t v22 = v43[v24];
            if (!v22)
            {
              while (1)
              {
                uint64_t v23 = v24 + 1;
                if (__OFADD__(v24, 1)) {
                  goto LABEL_41;
                }
                if (v23 >= v44) {
                  return v14;
                }
                unint64_t v22 = v43[v23];
                ++v24;
                if (v22) {
                  goto LABEL_24;
                }
              }
            }
            uint64_t v23 = v16 + 4;
          }
        }
      }
LABEL_24:
      unint64_t v15 = (v22 - 1) & v22;
      uint64_t v51 = v23;
      unint64_t v20 = __clz(__rbit64(v22)) + (v23 << 6);
    }
    uint64_t v25 = a4[7];
    unint64_t v26 = (uint64_t *)(a4[6] + 16 * v20);
    uint64_t v27 = *v26;
    uint64_t v28 = v26[1];
    uint64_t v29 = v49;
    uint64_t v30 = v50;
    uint64_t v31 = *(void *)(v50 + 72);
    (*(void (**)(char *, unint64_t, uint64_t))(v50 + 16))(v49, v25 + v31 * v20, v18);
    double v32 = *(void (**)(char *, char *, uint64_t))(v30 + 32);
    v32(v52, v29, v18);
    sub_2380E54E8();
    swift_bridgeObjectRetain();
    sub_2380E49E8();
    uint64_t result = sub_2380E5538();
    uint64_t v33 = -1 << *(unsigned char *)(v14 + 32);
    unint64_t v34 = result & ~v33;
    unint64_t v35 = v34 >> 6;
    if (((-1 << v34) & ~*(void *)(v17 + 8 * (v34 >> 6))) != 0)
    {
      unint64_t v36 = __clz(__rbit64((-1 << v34) & ~*(void *)(v17 + 8 * (v34 >> 6)))) | v34 & 0x7FFFFFFFFFFFFFC0;
      uint64_t v18 = v48;
    }
    else
    {
      char v37 = 0;
      unint64_t v38 = (unint64_t)(63 - v33) >> 6;
      uint64_t v18 = v48;
      do
      {
        if (++v35 == v38 && (v37 & 1) != 0)
        {
          __break(1u);
          goto LABEL_39;
        }
        BOOL v39 = v35 == v38;
        if (v35 == v38) {
          unint64_t v35 = 0;
        }
        v37 |= v39;
        uint64_t v40 = *(void *)(v17 + 8 * v35);
      }
      while (v40 == -1);
      unint64_t v36 = __clz(__rbit64(~v40)) + (v35 << 6);
    }
    *(void *)(v17 + ((v36 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v36;
    int64_t v41 = (void *)(*(void *)(v14 + 48) + 16 * v36);
    void *v41 = v27;
    v41[1] = v28;
    uint64_t result = ((uint64_t (*)(unint64_t, char *, uint64_t))v32)(*(void *)(v14 + 56) + v36 * v31, v52, v18);
    ++*(void *)(v14 + 16);
    if (__OFSUB__(a3--, 1)) {
      break;
    }
    a4 = v45;
    uint64_t v16 = v51;
    if (!a3) {
      return v14;
    }
  }
LABEL_39:
  __break(1u);
LABEL_40:
  __break(1u);
LABEL_41:
  __break(1u);
  return result;
}

uint64_t sub_2380D94B0(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (!a3) {
    return MEMORY[0x263F8EE80];
  }
  uint64_t v4 = a4;
  uint64_t v5 = a3;
  if (*(void *)(a4 + 16) == a3)
  {
    swift_retain();
    return v4;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26894BFE0);
  uint64_t result = sub_2380E5308();
  uint64_t v8 = result;
  uint64_t v31 = a2;
  if (a2 < 1) {
    unint64_t v9 = 0;
  }
  else {
    unint64_t v9 = *a1;
  }
  uint64_t v10 = 0;
  uint64_t v11 = result + 64;
  while (1)
  {
    if (v9)
    {
      unint64_t v12 = __clz(__rbit64(v9));
      v9 &= v9 - 1;
      unint64_t v13 = v12 | (v10 << 6);
    }
    else
    {
      uint64_t v14 = v10 + 1;
      if (__OFADD__(v10, 1)) {
        goto LABEL_40;
      }
      if (v14 >= v31) {
        return v8;
      }
      unint64_t v15 = a1[v14];
      ++v10;
      if (!v15)
      {
        uint64_t v10 = v14 + 1;
        if (v14 + 1 >= v31) {
          return v8;
        }
        unint64_t v15 = a1[v10];
        if (!v15)
        {
          uint64_t v10 = v14 + 2;
          if (v14 + 2 >= v31) {
            return v8;
          }
          unint64_t v15 = a1[v10];
          if (!v15)
          {
            uint64_t v16 = v14 + 3;
            if (v16 >= v31) {
              return v8;
            }
            unint64_t v15 = a1[v16];
            if (!v15)
            {
              while (1)
              {
                uint64_t v10 = v16 + 1;
                if (__OFADD__(v16, 1)) {
                  goto LABEL_41;
                }
                if (v10 >= v31) {
                  return v8;
                }
                unint64_t v15 = a1[v10];
                ++v16;
                if (v15) {
                  goto LABEL_24;
                }
              }
            }
            uint64_t v10 = v16;
          }
        }
      }
LABEL_24:
      unint64_t v9 = (v15 - 1) & v15;
      unint64_t v13 = __clz(__rbit64(v15)) + (v10 << 6);
    }
    uint64_t v17 = (uint64_t *)(*(void *)(v4 + 48) + 16 * v13);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    uint64_t v20 = *(void *)(*(void *)(v4 + 56) + 8 * v13);
    sub_2380E54E8();
    swift_bridgeObjectRetain();
    sub_2380E49E8();
    uint64_t result = sub_2380E5538();
    uint64_t v21 = -1 << *(unsigned char *)(v8 + 32);
    unint64_t v22 = result & ~v21;
    unint64_t v23 = v22 >> 6;
    if (((-1 << v22) & ~*(void *)(v11 + 8 * (v22 >> 6))) != 0)
    {
      unint64_t v24 = __clz(__rbit64((-1 << v22) & ~*(void *)(v11 + 8 * (v22 >> 6)))) | v22 & 0x7FFFFFFFFFFFFFC0;
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
          goto LABEL_39;
        }
        BOOL v27 = v23 == v26;
        if (v23 == v26) {
          unint64_t v23 = 0;
        }
        v25 |= v27;
        uint64_t v28 = *(void *)(v11 + 8 * v23);
      }
      while (v28 == -1);
      unint64_t v24 = __clz(__rbit64(~v28)) + (v23 << 6);
    }
    *(void *)(v11 + ((v24 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v24;
    uint64_t v29 = (void *)(*(void *)(v8 + 48) + 16 * v24);
    void *v29 = v19;
    v29[1] = v18;
    *(void *)(*(void *)(v8 + 56) + 8 * v24) = v20;
    ++*(void *)(v8 + 16);
    if (__OFSUB__(v5--, 1)) {
      break;
    }
    if (!v5) {
      return v8;
    }
  }
LABEL_39:
  __break(1u);
LABEL_40:
  __break(1u);
LABEL_41:
  __break(1u);
  return result;
}

uint64_t sub_2380D9758(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (!a3) {
    return MEMORY[0x263F8EE80];
  }
  uint64_t v4 = a4;
  uint64_t v5 = a3;
  if (*(void *)(a4 + 16) == a3)
  {
    swift_retain();
    return v4;
  }
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26894CD30);
  uint64_t result = sub_2380E5308();
  uint64_t v9 = result;
  uint64_t v31 = a1;
  if (a2 < 1) {
    unint64_t v10 = 0;
  }
  else {
    unint64_t v10 = *a1;
  }
  uint64_t v11 = 0;
  uint64_t v12 = result + 64;
  while (1)
  {
    if (v10)
    {
      unint64_t v13 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v14 = v13 | (v11 << 6);
    }
    else
    {
      uint64_t v15 = v11 + 1;
      if (__OFADD__(v11, 1)) {
        goto LABEL_40;
      }
      if (v15 >= a2) {
        return v9;
      }
      unint64_t v16 = v31[v15];
      ++v11;
      if (!v16)
      {
        uint64_t v11 = v15 + 1;
        if (v15 + 1 >= a2) {
          return v9;
        }
        unint64_t v16 = v31[v11];
        if (!v16)
        {
          uint64_t v11 = v15 + 2;
          if (v15 + 2 >= a2) {
            return v9;
          }
          unint64_t v16 = v31[v11];
          if (!v16)
          {
            uint64_t v17 = v15 + 3;
            if (v17 >= a2) {
              return v9;
            }
            unint64_t v16 = v31[v17];
            if (!v16)
            {
              while (1)
              {
                uint64_t v11 = v17 + 1;
                if (__OFADD__(v17, 1)) {
                  goto LABEL_41;
                }
                if (v11 >= a2) {
                  return v9;
                }
                unint64_t v16 = v31[v11];
                ++v17;
                if (v16) {
                  goto LABEL_24;
                }
              }
            }
            uint64_t v11 = v17;
          }
        }
      }
LABEL_24:
      unint64_t v10 = (v16 - 1) & v16;
      unint64_t v14 = __clz(__rbit64(v16)) + (v11 << 6);
    }
    uint64_t v18 = 8 * v14;
    uint64_t v19 = *(void *)(*(void *)(v4 + 48) + v18);
    uint64_t v20 = *(void *)(*(void *)(v4 + 56) + v18);
    uint64_t result = sub_2380E54D8();
    uint64_t v21 = -1 << *(unsigned char *)(v9 + 32);
    unint64_t v22 = result & ~v21;
    unint64_t v23 = v22 >> 6;
    if (((-1 << v22) & ~*(void *)(v12 + 8 * (v22 >> 6))) != 0)
    {
      unint64_t v24 = __clz(__rbit64((-1 << v22) & ~*(void *)(v12 + 8 * (v22 >> 6)))) | v22 & 0x7FFFFFFFFFFFFFC0;
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
          goto LABEL_39;
        }
        BOOL v27 = v23 == v26;
        if (v23 == v26) {
          unint64_t v23 = 0;
        }
        v25 |= v27;
        uint64_t v28 = *(void *)(v12 + 8 * v23);
      }
      while (v28 == -1);
      unint64_t v24 = __clz(__rbit64(~v28)) + (v23 << 6);
    }
    *(void *)(v12 + ((v24 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v24;
    uint64_t v29 = 8 * v24;
    *(void *)(*(void *)(v9 + 48) + v29) = v19;
    *(void *)(*(void *)(v9 + 56) + v29) = v20;
    ++*(void *)(v9 + 16);
    if (__OFSUB__(v5--, 1)) {
      break;
    }
    uint64_t result = swift_bridgeObjectRetain();
    if (!v5) {
      return v9;
    }
  }
LABEL_39:
  __break(1u);
LABEL_40:
  __break(1u);
LABEL_41:
  __break(1u);
  return result;
}

uint64_t sub_2380D99D0(void *a1, void *a2, unint64_t *a3, uint64_t a4, uint64_t *a5)
{
  uint64_t v8 = v5;
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
    uint64_t v14 = sub_2380E50D8();

    if (v14)
    {
      swift_bridgeObjectRelease();

      sub_237EC83D4(0, a3);
      swift_unknownObjectRetain();
      swift_dynamicCast();
      *a1 = v36;
      swift_unknownObjectRelease();
      return 0;
    }
    uint64_t result = sub_2380E50C8();
    if (__OFADD__(result, 1))
    {
      __break(1u);
      return result;
    }
    uint64_t v26 = sub_2380D8900(v12, result + 1, a5, a3);
    uint64_t v37 = v26;
    unint64_t v27 = *(void *)(v26 + 16);
    if (*(void *)(v26 + 24) <= v27)
    {
      uint64_t v32 = v27 + 1;
      id v33 = v13;
      sub_237EE7334(v32, a5);
      uint64_t v28 = v37;
    }
    else
    {
      uint64_t v28 = v26;
      id v29 = v13;
    }
    sub_2380D8B08((uint64_t)v13, v28);
    *uint64_t v8 = v28;
    swift_bridgeObjectRelease();
    *a1 = v13;
  }
  else
  {
    swift_bridgeObjectRetain();
    uint64_t v16 = sub_2380E4F78();
    uint64_t v17 = -1 << *(unsigned char *)(v11 + 32);
    unint64_t v18 = v16 & ~v17;
    if ((*(void *)(v11 + 56 + ((v18 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v18))
    {
      sub_237EC83D4(0, a3);
      id v19 = *(id *)(*(void *)(v11 + 48) + 8 * v18);
      char v20 = sub_2380E4F88();

      if (v20)
      {
LABEL_12:

        swift_bridgeObjectRelease();
        unint64_t v24 = *(void **)(*(void *)(*v5 + 48) + 8 * v18);
        *a1 = v24;
        id v25 = v24;
        return 0;
      }
      uint64_t v21 = ~v17;
      while (1)
      {
        unint64_t v18 = (v18 + 1) & v21;
        if (((*(void *)(v11 + 56 + ((v18 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v18) & 1) == 0) {
          break;
        }
        id v22 = *(id *)(*(void *)(v11 + 48) + 8 * v18);
        char v23 = sub_2380E4F88();

        if (v23) {
          goto LABEL_12;
        }
      }
    }
    swift_bridgeObjectRelease();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v38 = *v5;
    *uint64_t v5 = 0x8000000000000000;
    id v31 = a2;
    sub_237ED6334((uint64_t)v31, v18, isUniquelyReferenced_nonNull_native, a5, a3);
    *uint64_t v5 = v38;
    swift_bridgeObjectRelease();
    *a1 = v31;
  }
  return 1;
}

void *sub_2380D9C9C()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26894B290);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_2380E5128();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    uint64_t result = (void *)swift_release();
    *uint64_t v1 = v4;
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
    id v19 = (void *)(*(void *)(v4 + 48) + v16);
    *id v19 = *v17;
    v19[1] = v18;
    uint64_t result = (void *)swift_bridgeObjectRetain();
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

void *sub_2380D9E50()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26894CF70);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_2380E5128();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    uint64_t result = (void *)swift_release();
    *uint64_t v1 = v4;
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
    uint64_t v16 = 40 * v15;
    uint64_t result = (void *)sub_237FA2B84(*(void *)(v2 + 48) + 40 * v15, (uint64_t)v23);
    uint64_t v17 = *(void *)(v4 + 48) + v16;
    long long v18 = v23[0];
    long long v19 = v23[1];
    *(void *)(v17 + 32) = v24;
    *(_OWORD *)uint64_t v17 = v18;
    *(_OWORD *)(v17 + 16) = v19;
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

id sub_2380DA020(uint64_t *a1)
{
  uint64_t v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(a1);
  uint64_t v3 = *v1;
  uint64_t v4 = sub_2380E5128();
  uint64_t v5 = v4;
  if (!*(void *)(v3 + 16))
  {
LABEL_28:
    id result = (id)swift_release();
    *uint64_t v2 = v5;
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
    long long v18 = *(void **)(*(void *)(v3 + 48) + v17);
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

void *sub_2380DA1C4()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26894D678);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_2380E5128();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    id result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  id result = (void *)(v3 + 56);
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
    int64_t v16 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v16 >= v13) {
      goto LABEL_28;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v16);
    ++v9;
    if (!v17)
    {
      int64_t v9 = v16 + 1;
      if (v16 + 1 >= v13) {
        goto LABEL_28;
      }
      unint64_t v17 = *(void *)(v6 + 8 * v9);
      if (!v17)
      {
        int64_t v9 = v16 + 2;
        if (v16 + 2 >= v13) {
          goto LABEL_28;
        }
        unint64_t v17 = *(void *)(v6 + 8 * v9);
        if (!v17) {
          break;
        }
      }
    }
LABEL_27:
    unint64_t v12 = (v17 - 1) & v17;
    unint64_t v15 = __clz(__rbit64(v17)) + (v9 << 6);
LABEL_12:
    *(void *)(*(void *)(v4 + 48) + 8 * v15) = *(void *)(*(void *)(v2 + 48) + 8 * v15);
  }
  int64_t v18 = v16 + 3;
  if (v18 >= v13) {
    goto LABEL_28;
  }
  unint64_t v17 = *(void *)(v6 + 8 * v18);
  if (v17)
  {
    int64_t v9 = v18;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v9 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_28;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v9);
    ++v18;
    if (v17) {
      goto LABEL_27;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

void *sub_2380DA35C()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26894D670);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_2380E5128();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    id result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  id result = (void *)(v3 + 56);
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
    int64_t v16 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v16 >= v13) {
      goto LABEL_28;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v16);
    ++v9;
    if (!v17)
    {
      int64_t v9 = v16 + 1;
      if (v16 + 1 >= v13) {
        goto LABEL_28;
      }
      unint64_t v17 = *(void *)(v6 + 8 * v9);
      if (!v17)
      {
        int64_t v9 = v16 + 2;
        if (v16 + 2 >= v13) {
          goto LABEL_28;
        }
        unint64_t v17 = *(void *)(v6 + 8 * v9);
        if (!v17) {
          break;
        }
      }
    }
LABEL_27:
    unint64_t v12 = (v17 - 1) & v17;
    unint64_t v15 = __clz(__rbit64(v17)) + (v9 << 6);
LABEL_12:
    *(void *)(*(void *)(v4 + 48) + 8 * v15) = *(void *)(*(void *)(v2 + 48) + 8 * v15);
  }
  int64_t v18 = v16 + 3;
  if (v18 >= v13) {
    goto LABEL_28;
  }
  unint64_t v17 = *(void *)(v6 + 8 * v18);
  if (v17)
  {
    int64_t v9 = v18;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v9 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_28;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v9);
    ++v18;
    if (v17) {
      goto LABEL_27;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

void *sub_2380DA4F4()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26894D660);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_2380E5128();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    id result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  id result = (void *)(v3 + 56);
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
    int64_t v21 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v21 >= v13) {
      goto LABEL_28;
    }
    unint64_t v22 = *(void *)(v6 + 8 * v21);
    ++v9;
    if (!v22)
    {
      int64_t v9 = v21 + 1;
      if (v21 + 1 >= v13) {
        goto LABEL_28;
      }
      unint64_t v22 = *(void *)(v6 + 8 * v9);
      if (!v22)
      {
        int64_t v9 = v21 + 2;
        if (v21 + 2 >= v13) {
          goto LABEL_28;
        }
        unint64_t v22 = *(void *)(v6 + 8 * v9);
        if (!v22) {
          break;
        }
      }
    }
LABEL_27:
    unint64_t v12 = (v22 - 1) & v22;
    unint64_t v15 = __clz(__rbit64(v22)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 24 * v15;
    unint64_t v17 = (void *)(*(void *)(v2 + 48) + v16);
    uint64_t v18 = v17[1];
    uint64_t v19 = v17[2];
    unint64_t v20 = (void *)(*(void *)(v4 + 48) + v16);
    *unint64_t v20 = *v17;
    v20[1] = v18;
    v20[2] = v19;
    id result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v23 = v21 + 3;
  if (v23 >= v13) {
    goto LABEL_28;
  }
  unint64_t v22 = *(void *)(v6 + 8 * v23);
  if (v22)
  {
    int64_t v9 = v23;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v9 = v23 + 1;
    if (__OFADD__(v23, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_28;
    }
    unint64_t v22 = *(void *)(v6 + 8 * v9);
    ++v23;
    if (v22) {
      goto LABEL_27;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_2380DA6B4(uint64_t a1, void (*a2)(uint64_t, uint64_t))
{
  uint64_t v4 = a1 + 64;
  uint64_t v5 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v6 = -1;
  if (v5 < 64) {
    uint64_t v6 = ~(-1 << v5);
  }
  unint64_t v7 = v6 & *(void *)(a1 + 64);
  int64_t v8 = (unint64_t)(v5 + 63) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v10 = 0;
  while (1)
  {
    if (v7)
    {
      unint64_t v11 = __clz(__rbit64(v7));
      v7 &= v7 - 1;
      unint64_t v12 = v11 | (v10 << 6);
      goto LABEL_5;
    }
    int64_t v16 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v16 >= v8) {
      return swift_release();
    }
    unint64_t v17 = *(void *)(v4 + 8 * v16);
    ++v10;
    if (!v17)
    {
      int64_t v10 = v16 + 1;
      if (v16 + 1 >= v8) {
        return swift_release();
      }
      unint64_t v17 = *(void *)(v4 + 8 * v10);
      if (!v17)
      {
        int64_t v10 = v16 + 2;
        if (v16 + 2 >= v8) {
          return swift_release();
        }
        unint64_t v17 = *(void *)(v4 + 8 * v10);
        if (!v17)
        {
          int64_t v10 = v16 + 3;
          if (v16 + 3 >= v8) {
            return swift_release();
          }
          unint64_t v17 = *(void *)(v4 + 8 * v10);
          if (!v17) {
            break;
          }
        }
      }
    }
LABEL_22:
    unint64_t v7 = (v17 - 1) & v17;
    unint64_t v12 = __clz(__rbit64(v17)) + (v10 << 6);
LABEL_5:
    uint64_t v13 = 8 * v12;
    uint64_t v14 = *(void *)(*(void *)(a1 + 48) + v13);
    uint64_t v15 = *(void *)(*(void *)(a1 + 56) + v13);
    swift_bridgeObjectRetain();
    a2(v14, v15);
    uint64_t result = swift_bridgeObjectRelease();
  }
  int64_t v18 = v16 + 4;
  if (v18 >= v8) {
    return swift_release();
  }
  unint64_t v17 = *(void *)(v4 + 8 * v18);
  if (v17)
  {
    int64_t v10 = v18;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v10 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v10 >= v8) {
      return swift_release();
    }
    unint64_t v17 = *(void *)(v4 + 8 * v10);
    ++v18;
    if (v17) {
      goto LABEL_22;
    }
  }
LABEL_25:
  __break(1u);
  return result;
}

uint64_t sub_2380DA840(uint64_t a1, void (*a2)(uint64_t, uint64_t, uint64_t))
{
  uint64_t v4 = a1 + 64;
  uint64_t v5 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v6 = -1;
  if (v5 < 64) {
    uint64_t v6 = ~(-1 << v5);
  }
  unint64_t v7 = v6 & *(void *)(a1 + 64);
  int64_t v8 = (unint64_t)(v5 + 63) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v10 = 0;
  while (1)
  {
    if (v7)
    {
      unint64_t v11 = __clz(__rbit64(v7));
      v7 &= v7 - 1;
      unint64_t v12 = v11 | (v10 << 6);
      goto LABEL_5;
    }
    int64_t v17 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v17 >= v8) {
      return swift_release();
    }
    unint64_t v18 = *(void *)(v4 + 8 * v17);
    ++v10;
    if (!v18)
    {
      int64_t v10 = v17 + 1;
      if (v17 + 1 >= v8) {
        return swift_release();
      }
      unint64_t v18 = *(void *)(v4 + 8 * v10);
      if (!v18)
      {
        int64_t v10 = v17 + 2;
        if (v17 + 2 >= v8) {
          return swift_release();
        }
        unint64_t v18 = *(void *)(v4 + 8 * v10);
        if (!v18)
        {
          int64_t v10 = v17 + 3;
          if (v17 + 3 >= v8) {
            return swift_release();
          }
          unint64_t v18 = *(void *)(v4 + 8 * v10);
          if (!v18) {
            break;
          }
        }
      }
    }
LABEL_22:
    unint64_t v7 = (v18 - 1) & v18;
    unint64_t v12 = __clz(__rbit64(v18)) + (v10 << 6);
LABEL_5:
    uint64_t v13 = (uint64_t *)(*(void *)(a1 + 48) + 16 * v12);
    uint64_t v14 = *v13;
    uint64_t v15 = v13[1];
    uint64_t v16 = *(void *)(*(void *)(a1 + 56) + 8 * v12);
    swift_bridgeObjectRetain();
    a2(v14, v15, v16);
    uint64_t result = swift_bridgeObjectRelease();
  }
  int64_t v19 = v17 + 4;
  if (v19 >= v8) {
    return swift_release();
  }
  unint64_t v18 = *(void *)(v4 + 8 * v19);
  if (v18)
  {
    int64_t v10 = v19;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v10 = v19 + 1;
    if (__OFADD__(v19, 1)) {
      break;
    }
    if (v10 >= v8) {
      return swift_release();
    }
    unint64_t v18 = *(void *)(v4 + 8 * v10);
    ++v19;
    if (v18) {
      goto LABEL_22;
    }
  }
LABEL_25:
  __break(1u);
  return result;
}

uint64_t sub_2380DA9D0(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5)
{
  int64_t v23 = (unint64_t *)result;
  int64_t v9 = 0;
  uint64_t v24 = 0;
  uint64_t v25 = a3 + 56;
  uint64_t v10 = 1 << *(unsigned char *)(a3 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(a3 + 56);
  int64_t v27 = (unint64_t)(v10 + 63) >> 6;
  while (v12)
  {
    unint64_t v13 = __clz(__rbit64(v12));
    v12 &= v12 - 1;
    unint64_t v14 = v13 | (v9 << 6);
LABEL_17:
    unint64_t v18 = (void *)(*(void *)(a3 + 48) + 24 * v14);
    uint64_t v19 = v18[1];
    uint64_t v20 = v18[2];
    v26[0] = *v18;
    v26[1] = v19;
    void v26[2] = v20;
    swift_bridgeObjectRetain();
    BOOL v21 = sub_237EE86A0((BOOL)v26, a4, a5);
    uint64_t result = swift_bridgeObjectRelease();
    if (v5) {
      return result;
    }
    if (v21)
    {
      *(unint64_t *)((char *)v23 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v14;
      BOOL v15 = __OFADD__(v24++, 1);
      if (v15) {
        goto LABEL_30;
      }
    }
  }
  BOOL v15 = __OFADD__(v9++, 1);
  if (v15)
  {
    __break(1u);
    goto LABEL_29;
  }
  if (v9 >= v27) {
    goto LABEL_26;
  }
  unint64_t v16 = *(void *)(v25 + 8 * v9);
  if (v16)
  {
LABEL_16:
    unint64_t v12 = (v16 - 1) & v16;
    unint64_t v14 = __clz(__rbit64(v16)) + (v9 << 6);
    goto LABEL_17;
  }
  int64_t v17 = v9 + 1;
  if (v9 + 1 >= v27) {
    goto LABEL_26;
  }
  unint64_t v16 = *(void *)(v25 + 8 * v17);
  if (v16) {
    goto LABEL_15;
  }
  int64_t v17 = v9 + 2;
  if (v9 + 2 >= v27) {
    goto LABEL_26;
  }
  unint64_t v16 = *(void *)(v25 + 8 * v17);
  if (v16) {
    goto LABEL_15;
  }
  int64_t v17 = v9 + 3;
  if (v9 + 3 >= v27)
  {
LABEL_26:
    swift_retain();
    return sub_237ECAB7C(v23, a2, v24, a3);
  }
  unint64_t v16 = *(void *)(v25 + 8 * v17);
  if (v16)
  {
LABEL_15:
    int64_t v9 = v17;
    goto LABEL_16;
  }
  while (1)
  {
    int64_t v9 = v17 + 1;
    if (__OFADD__(v17, 1)) {
      break;
    }
    if (v9 >= v27) {
      goto LABEL_26;
    }
    unint64_t v16 = *(void *)(v25 + 8 * v9);
    ++v17;
    if (v16) {
      goto LABEL_16;
    }
  }
LABEL_29:
  __break(1u);
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_2380DABEC(uint64_t isStackAllocationSafe, uint64_t a2, uint64_t *a3)
{
  uint64_t v6 = isStackAllocationSafe;
  v13[1] = *MEMORY[0x263EF8340];
  char v7 = *(unsigned char *)(isStackAllocationSafe + 32);
  unint64_t v8 = (unint64_t)((1 << v7) + 63) >> 6;
  size_t v9 = 8 * v8;
  if ((v7 & 0x3Fu) <= 0xD
    || (uint64_t isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), (isStackAllocationSafe & 1) != 0))
  {
    MEMORY[0x270FA5388](isStackAllocationSafe);
    bzero((char *)v13 - ((v9 + 15) & 0x3FFFFFFFFFFFFFF0), v9);
    uint64_t v10 = sub_2380DA9D0((uint64_t)v13 - ((v9 + 15) & 0x3FFFFFFFFFFFFFF0), v8, v6, a2, a3);
    swift_release();
    if (v3) {
      swift_willThrow();
    }
  }
  else
  {
    uint64_t v11 = (void *)swift_slowAlloc();
    bzero(v11, v9);
    uint64_t v10 = sub_2380DA9D0((uint64_t)v11, v8, v6, a2, a3);
    swift_release();
    MEMORY[0x23EC87710](v11, -1, -1);
  }
  return v10;
}

uint64_t sub_2380DAD70(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x6D617473656D6974 && a2 == 0xE900000000000070;
  if (v2 || (sub_2380E5408() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x746E65636572 && a2 == 0xE600000000000000 || (sub_2380E5408() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x794273746E657665 && a2 == 0xEB00000000796144)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    char v6 = sub_2380E5408();
    swift_bridgeObjectRelease();
    if (v6) {
      return 2;
    }
    else {
      return 3;
    }
  }
}

uint64_t sub_2380DAEE4(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26894D5F0);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  char v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = a1[3];
  __swift_project_boxed_opaque_existential_1(a1, v7);
  sub_2380DB170();
  sub_2380E5578();
  if (v1)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  else
  {
    LOBYTE(v11) = 0;
    sub_2380E5348();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26894D600);
    char v10 = 1;
    sub_2380DB2B8(&qword_26894D608, (void (*)(void))sub_2380DB1C4);
    sub_2380E5358();
    uint64_t v7 = v11;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26894D618);
    char v10 = 2;
    sub_2380DB218();
    swift_bridgeObjectRetain();
    sub_2380E5358();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    swift_bridgeObjectRetain();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return v7;
}

unint64_t sub_2380DB170()
{
  unint64_t result = qword_26894D5F8;
  if (!qword_26894D5F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26894D5F8);
  }
  return result;
}

unint64_t sub_2380DB1C4()
{
  unint64_t result = qword_26894D610;
  if (!qword_26894D610)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26894D610);
  }
  return result;
}

unint64_t sub_2380DB218()
{
  unint64_t result = qword_26894D620;
  if (!qword_26894D620)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26894D618);
    sub_2380DB41C(&qword_26894D628);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26894D620);
  }
  return result;
}

uint64_t sub_2380DB2B8(unint64_t *a1, void (*a2)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26894D600);
    a2();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_2380DB328()
{
  unint64_t result = qword_26894D640;
  if (!qword_26894D640)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26894D640);
  }
  return result;
}

unint64_t sub_2380DB37C()
{
  unint64_t result = qword_26894D648;
  if (!qword_26894D648)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26894D618);
    sub_2380DB41C(&qword_26894D650);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26894D648);
  }
  return result;
}

uint64_t sub_2380DB41C(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26894C238);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_2380DB484()
{
  uint64_t v1 = sub_2380E2E28();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 24) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = ((((*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 8;
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_release();
  return MEMORY[0x270FA0238](v0, v6, v5);
}

uint64_t sub_2380DB578(uint64_t a1)
{
  uint64_t v3 = *(void *)(sub_2380E2E28() - 8);
  unint64_t v4 = (*(unsigned __int8 *)(v3 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  unint64_t v5 = (*(void *)(v3 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v6 = *(void *)(v1 + 16);
  uint64_t v7 = *(void (**)(uint64_t))(v1 + v5);
  uint64_t v8 = *(void *)(v1 + v5 + 8);
  return sub_2380D6E50(a1, v6, v1 + v4, v7, v8);
}

uint64_t sub_2380DB628()
{
  uint64_t v1 = sub_2380E2E28();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(void (**)(uint64_t, uint64_t))(v2 + 8);
  uint64_t v4 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v5 = (v4 + 16) & ~v4;
  uint64_t v6 = v4 | 7;
  uint64_t v7 = *(void *)(v2 + 64) + 7;
  unint64_t v8 = (v4 + 16 + ((((v7 + v5) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8)) & ~v4;
  unint64_t v9 = ((v7 + v8) & 0xFFFFFFFFFFFFFFF8) + 8;
  v3(v0 + v5, v1);
  swift_release();
  v3(v0 + v8, v1);
  return MEMORY[0x270FA0238](v0, v9, v6);
}

uint64_t sub_2380DB710()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_2380DB748(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_2380D79CC(a1, a2, a3, a4, v4);
}

uint64_t sub_2380DB750(uint64_t a1, uint64_t a2)
{
  return sub_2380D7EC0(a1, a2, *(void *)(v2 + 16), *(void *)(v2 + 24));
}

uint64_t sub_2380DB758(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, void, uint64_t))(v3 + 16))(a1, a2, *(void *)(v3 + 32), a3);
}

uint64_t sub_2380DB78C(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26894D4B8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_2380DB7EC()
{
  return sub_2380D5688();
}

uint64_t sub_2380DB7F4()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_2380DB82C(uint64_t a1)
{
  return sub_2380D63B8(a1, *(void (**)(void))(v1 + 16), *(void *)(v1 + 24));
}

unsigned char *storeEnumTagSinglePayload for NowPlayingUsageProvider.Store.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *uint64_t result = a2 + 2;
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
        JUMPOUT(0x2380DB904);
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
          *uint64_t result = a2 + 2;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for NowPlayingUsageProvider.Store.CodingKeys()
{
  return &type metadata for NowPlayingUsageProvider.Store.CodingKeys;
}

void *sub_2380DB940(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for NowPlayingUsageProvider.Event(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  return a1;
}

void *assignWithTake for NowPlayingUsageProvider.Event(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  return a1;
}

ValueMetadata *type metadata accessor for NowPlayingUsageProvider.Event()
{
  return &type metadata for NowPlayingUsageProvider.Event;
}

unint64_t sub_2380DBA24()
{
  unint64_t result = qword_26894D680;
  if (!qword_26894D680)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26894D680);
  }
  return result;
}

unint64_t sub_2380DBA7C()
{
  unint64_t result = qword_26894D688;
  if (!qword_26894D688)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26894D688);
  }
  return result;
}

unint64_t sub_2380DBAD4()
{
  unint64_t result = qword_26894D690;
  if (!qword_26894D690)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26894D690);
  }
  return result;
}

unint64_t sub_2380DBB2C()
{
  unint64_t result = qword_26894D698;
  if (!qword_26894D698)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26894D698);
  }
  return result;
}

uint64_t sub_2380DBB80(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000010 && a2 == 0x80000002380F5DF0 || (sub_2380E5408() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6D617473656D6974 && a2 == 0xE900000000000070)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v5 = sub_2380E5408();
    swift_bridgeObjectRelease();
    if (v5) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

double sub_2380DBC7C(void *a1)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26894D6A0);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2380DBE6C();
  sub_2380E5578();
  if (v1)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  else
  {
    char v12 = 0;
    sub_2380E5338();
    char v11 = 1;
    swift_bridgeObjectRetain();
    sub_2380E5348();
    double v2 = v9;
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    swift_bridgeObjectRelease();
  }
  return v2;
}

unint64_t sub_2380DBE6C()
{
  unint64_t result = qword_26894D6A8;
  if (!qword_26894D6A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26894D6A8);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for NowPlayingUsageProvider.Event.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x2380DBF8CLL);
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

ValueMetadata *type metadata accessor for NowPlayingUsageProvider.Event.CodingKeys()
{
  return &type metadata for NowPlayingUsageProvider.Event.CodingKeys;
}

unint64_t sub_2380DBFC8()
{
  unint64_t result = qword_26894D6B8;
  if (!qword_26894D6B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26894D6B8);
  }
  return result;
}

unint64_t sub_2380DC020()
{
  unint64_t result = qword_26894D6C0;
  if (!qword_26894D6C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26894D6C0);
  }
  return result;
}

unint64_t sub_2380DC078()
{
  unint64_t result = qword_26894D6C8;
  if (!qword_26894D6C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26894D6C8);
  }
  return result;
}

uint64_t static SiriAudioState.isWarmup.getter()
{
  return sub_2380DC5F4((unsigned __int8 *)&byte_26894D6E0, "SiriAudio#isWarmup#get %{BOOL}d") & 1;
}

uint64_t static SiriAudioState.isMakeFlowFromParse.getter()
{
  return sub_2380DC5F4((unsigned __int8 *)&byte_26894D6E1, "SiriAudio#isMakeFlowFromParse#get %{BOOL}d") & 1;
}

uint64_t sub_2380DC134()
{
  uint64_t v0 = sub_2380E4DF8();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  int v3 = (char *)&v10 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_2380E4728();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2380E46E8();
  sub_2380E4DD8();
  uint64_t v8 = _s16SiriAudioSupport14DispatchQueuesV5queue_3qos10attributesSo012OS_dispatch_F0CSS_0D00D3QoSVAhIE10AttributesVtFZ_0(0xD000000000000014, 0x80000002380FBEF0, (uint64_t)v7, (uint64_t)v3);
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  qword_26894D6D0 = v8;
  return result;
}

uint64_t (*static SiriAudioState.isWarmup.modify(unsigned char *a1))(char *a1)
{
  *a1 = sub_2380DC5F4((unsigned __int8 *)&byte_26894D6E0, "SiriAudio#isWarmup#get %{BOOL}d") & 1;
  return sub_2380DC328;
}

uint64_t sub_2380DC328(char *a1)
{
  return _s16SiriAudioSupport0aB5StateV8isWarmupSbvsZ_0(*a1);
}

uint64_t (*static SiriAudioState.isMakeFlowFromParse.modify(unsigned char *a1))(char *a1)
{
  *a1 = sub_2380DC5F4((unsigned __int8 *)&byte_26894D6E1, "SiriAudio#isMakeFlowFromParse#get %{BOOL}d") & 1;
  return sub_2380DC38C;
}

uint64_t sub_2380DC38C(char *a1)
{
  return _s16SiriAudioSupport0aB5StateV19isMakeFlowFromParseSbvsZ_0(*a1);
}

uint64_t static SiriAudioState.warmupWithRequestId(requestID:)(uint64_t a1, uint64_t a2)
{
  _s16SiriAudioSupport0aB5StateV8isWarmupSbvsZ_0(1);
  qword_26894D6E8 = a1;
  qword_26894D6F0 = a2;
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRetain();
}

uint64_t sub_2380DC3E8()
{
  uint64_t v0 = sub_2380E4528();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  int v3 = (char *)v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = sub_2380DC5F4((unsigned __int8 *)&byte_26894D6E1, "SiriAudio#isMakeFlowFromParse#get %{BOOL}d");
  if (result)
  {
    if (qword_26894AA20 != -1) {
      swift_once();
    }
    uint64_t v5 = __swift_project_value_buffer(v0, (uint64_t)qword_268956458);
    (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v3, v5, v0);
    uint64_t v6 = sub_2380E4508();
    os_log_type_t v7 = sub_2380E4D48();
    if (os_log_type_enabled(v6, v7))
    {
      uint64_t v8 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)uint64_t v8 = 134217984;
      v9[1] = 1000;
      sub_2380E4FC8();
      _os_log_impl(&dword_237EB8000, v6, v7, "SiriAudio#isMakeFlowFromParse#reset makeFlow(from:) did not finish within %ldms.", v8, 0xCu);
      MEMORY[0x23EC87710](v8, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
    return _s16SiriAudioSupport0aB5StateV19isMakeFlowFromParseSbvsZ_0(0);
  }
  return result;
}

uint64_t sub_2380DC5CC()
{
  return sub_2380DC5F4((unsigned __int8 *)&byte_26894D6E0, "SiriAudio#isWarmup#get %{BOOL}d");
}

uint64_t sub_2380DC5E0()
{
  return sub_2380DC5F4((unsigned __int8 *)&byte_26894D6E1, "SiriAudio#isMakeFlowFromParse#get %{BOOL}d");
}

uint64_t sub_2380DC5F4(unsigned __int8 *a1, const char *a2)
{
  uint64_t v4 = sub_2380E4528();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  os_log_type_t v7 = (char *)v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26894AA20 != -1) {
    swift_once();
  }
  uint64_t v8 = __swift_project_value_buffer(v4, (uint64_t)qword_268956458);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v8, v4);
  double v9 = sub_2380E4508();
  os_log_type_t v10 = sub_2380E4D58();
  if (os_log_type_enabled(v9, v10))
  {
    char v11 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)char v11 = 67109120;
    v13[3] = *a1;
    sub_2380E4FC8();
    _os_log_impl(&dword_237EB8000, v9, v10, a2, v11, 8u);
    MEMORY[0x23EC87710](v11, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return *a1;
}

uint64_t _s16SiriAudioSupport0aB5StateV16currentRequestIdSSSgyFZ_0()
{
  uint64_t v0 = sub_2380E4528();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  int v3 = (char *)&v19 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (sub_2380DC5F4((unsigned __int8 *)&byte_26894D6E0, "SiriAudio#isWarmup#get %{BOOL}d"))
  {
    if (qword_26894AA20 != -1) {
      swift_once();
    }
    uint64_t v4 = __swift_project_value_buffer(v0, (uint64_t)qword_268956458);
    (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v3, v4, v0);
    uint64_t v5 = sub_2380E4508();
    os_log_type_t v6 = sub_2380E4D48();
    if (os_log_type_enabled(v5, v6))
    {
      os_log_type_t v7 = (uint8_t *)swift_slowAlloc();
      uint64_t v20 = swift_slowAlloc();
      v22[0] = v20;
      *(_DWORD *)os_log_type_t v7 = 136315138;
      if (qword_26894D6F0) {
        uint64_t v8 = qword_26894D6E8;
      }
      else {
        uint64_t v8 = 0x3E6C696E3CLL;
      }
      if (qword_26894D6F0) {
        unint64_t v9 = qword_26894D6F0;
      }
      else {
        unint64_t v9 = 0xE500000000000000;
      }
      swift_bridgeObjectRetain();
      uint64_t v21 = sub_237EBC6BC(v8, v9, v22);
      sub_2380E4FC8();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_237EB8000, v5, v6, "SiriAudioState#currentRequestId warmup, returning warmup requestID: %s", v7, 0xCu);
      uint64_t v10 = v20;
      swift_arrayDestroy();
      MEMORY[0x23EC87710](v10, -1, -1);
      MEMORY[0x23EC87710](v7, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
    uint64_t v11 = qword_26894D6E8;
    swift_bridgeObjectRetain();
  }
  else
  {
    if (qword_26894A8A0 != -1) {
      swift_once();
    }
    swift_beginAccess();
    uint64_t v12 = qword_26894BD60;
    uint64_t v13 = unk_26894BD68;
    unint64_t v14 = __swift_project_boxed_opaque_existential_1(qword_26894BD48, qword_26894BD60);
    uint64_t v15 = *(void *)(v12 - 8);
    MEMORY[0x270FA5388](v14);
    int64_t v17 = (char *)&v19 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v15 + 16))(v17);
    uint64_t v11 = (*(uint64_t (**)(uint64_t, uint64_t))(v13 + 16))(v12, v13);
    (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v12);
  }
  return v11;
}

uint64_t _s16SiriAudioSupport0aB5StateV8isWarmupSbvsZ_0(char a1)
{
  uint64_t v2 = sub_2380E4528();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26894AA20 != -1) {
    swift_once();
  }
  uint64_t v6 = __swift_project_value_buffer(v2, (uint64_t)qword_268956458);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v6, v2);
  os_log_type_t v7 = sub_2380E4508();
  os_log_type_t v8 = sub_2380E4D58();
  if (os_log_type_enabled(v7, v8))
  {
    unint64_t v9 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)unint64_t v9 = 67109120;
    v11[3] = a1 & 1;
    sub_2380E4FC8();
    _os_log_impl(&dword_237EB8000, v7, v8, "SiriAudio#isWarmup#set %{BOOL}d", v9, 8u);
    MEMORY[0x23EC87710](v9, -1, -1);
  }

  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  byte_26894D6E0 = a1 & 1;
  return result;
}

uint64_t sub_2380DCD58()
{
  uint64_t v15 = sub_2380E4688();
  uint64_t v0 = *(void *)(v15 - 8);
  MEMORY[0x270FA5388](v15);
  uint64_t v2 = (uint64_t *)((char *)&v14 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v16 = sub_2380E4758();
  uint64_t v14 = *(void *)(v16 - 8);
  uint64_t v3 = MEMORY[0x270FA5388](v16);
  uint64_t v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v3);
  os_log_type_t v7 = (char *)&v14 - v6;
  uint64_t v8 = sub_2380E46A8();
  MEMORY[0x270FA5388](v8);
  if (qword_26894D6D8)
  {
    swift_retain();
    sub_2380E4778();
    swift_release();
  }
  aBlock[4] = sub_2380DC3E8;
  aBlock[5] = 0;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_237EBF1FC;
  void aBlock[3] = &block_descriptor_49;
  _Block_copy(aBlock);
  uint64_t v17 = MEMORY[0x263F8EE78];
  sub_237EBE174();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26894CD60);
  sub_237EBE3C0();
  sub_2380E5088();
  sub_2380E4788();
  swift_allocObject();
  qword_26894D6D8 = sub_2380E4768();
  uint64_t result = swift_release();
  if (qword_26894D6D8)
  {
    uint64_t v10 = qword_26894AC48;
    swift_retain();
    if (v10 != -1) {
      swift_once();
    }
    sub_2380E4738();
    *uint64_t v2 = 1000;
    uint64_t v11 = v15;
    (*(void (**)(void *, void, uint64_t))(v0 + 104))(v2, *MEMORY[0x263F8F000], v15);
    MEMORY[0x23EC85DA0](v5, v2);
    (*(void (**)(void *, uint64_t))(v0 + 8))(v2, v11);
    uint64_t v12 = *(void (**)(char *, uint64_t))(v14 + 8);
    uint64_t v13 = v16;
    v12(v5, v16);
    sub_2380E4E18();
    swift_release();
    return ((uint64_t (*)(char *, uint64_t))v12)(v7, v13);
  }
  return result;
}

uint64_t _s16SiriAudioSupport0aB5StateV19isMakeFlowFromParseSbvsZ_0(char a1)
{
  uint64_t v2 = sub_2380E4528();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26894AA20 != -1) {
    swift_once();
  }
  uint64_t v6 = __swift_project_value_buffer(v2, (uint64_t)qword_268956458);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v6, v2);
  os_log_type_t v7 = sub_2380E4508();
  os_log_type_t v8 = sub_2380E4D58();
  if (os_log_type_enabled(v7, v8))
  {
    unint64_t v9 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)unint64_t v9 = 67109120;
    v11[3] = a1 & 1;
    sub_2380E4FC8();
    _os_log_impl(&dword_237EB8000, v7, v8, "SiriAudio#isMakeFlowFromParse#set %{BOOL}d", v9, 8u);
    MEMORY[0x23EC87710](v9, -1, -1);
  }

  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  byte_26894D6E1 = a1 & 1;
  if (a1) {
    return sub_2380DCD58();
  }
  return result;
}

ValueMetadata *type metadata accessor for SiriAudioState()
{
  return &type metadata for SiriAudioState;
}

uint64_t sub_2380DD2D8(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  uint64_t v2 = swift_unknownObjectRetain();
  v1(v2);
  swift_release();
  return swift_unknownObjectRelease();
}

uint64_t static ErrorFilingProvider.getTrialPolicy()()
{
  long long v8 = xmmword_2380F0C90;
  if (qword_26894AC50 != -1) {
    swift_once();
  }
  uint64_t v1 = qword_26894D700;
  uint64_t v2 = swift_allocObject();
  *(void *)(v2 + 16) = &v8;
  *(void *)(v2 + 24) = v0;
  uint64_t v3 = swift_allocObject();
  *(void *)(v3 + 16) = sub_2380DF124;
  *(void *)(v3 + 24) = v2;
  v7[4] = sub_238057E18;
  v7[5] = v3;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 1107296256;
  v7[2] = sub_237FF270C;
  v7[3] = &block_descriptor_50;
  uint64_t v4 = _Block_copy(v7);
  swift_retain();
  swift_release();
  dispatch_sync(v1, v4);
  _Block_release(v4);
  LOBYTE(v1) = swift_isEscapingClosureAtFileLocation();
  uint64_t result = swift_release();
  if (v1)
  {
    __break(1u);
  }
  else
  {
    uint64_t v6 = v8;
    swift_release();
    return v6;
  }
  return result;
}

uint64_t static ErrorFilingProvider.fileTTR(errorToReport:errorDomain:extraInfo:extraDescInfo:deviceIDs:attachmentURLs:ttrComponentInfo:title:duc:)(char *a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, char *a12, uint64_t a13, uint64_t a14, unint64_t a15)
{
  return sub_2380E0168(a1, a2, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15);
}

unint64_t static ErrorFilingProvider.errorInfoForParamsKey.getter()
{
  return 0xD000000000000010;
}

unint64_t static ErrorFilingProvider.errorInfoForTitleKey.getter()
{
  return 0xD000000000000011;
}

unint64_t static ErrorFilingProvider.airplayNotRespondingParamsKey.getter()
{
  return 0xD000000000000020;
}

uint64_t sub_2380DD55C()
{
  uint64_t v0 = sub_2380E4DF8();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)v10 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_2380E4728();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  os_log_type_t v7 = (char *)v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2380E46F8();
  v10[1] = 0;
  sub_237EBE214((unint64_t *)&qword_26894D770, MEMORY[0x263F8F0F8]);
  sub_2380E55C8();
  uint64_t v8 = _s16SiriAudioSupport14DispatchQueuesV5queue_3qos10attributesSo012OS_dispatch_F0CSS_0D00D3QoSVAhIE10AttributesVtFZ_0(0xD00000000000001ELL, 0x80000002380FC170, (uint64_t)v7, (uint64_t)v3);
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  qword_26894D700 = v8;
  return result;
}

unint64_t sub_2380DD73C()
{
  unint64_t result = sub_237FCF0C4(MEMORY[0x263F8EE78]);
  qword_26894D718 = result;
  return result;
}

void *sub_2380DD764()
{
  type metadata accessor for ErrorFilingProvider.TrialClientManager();
  swift_allocObject();
  unint64_t result = sub_2380DD7E4();
  qword_26894D720 = (uint64_t)result;
  return result;
}

id sub_2380DD7A4()
{
  id result = objc_msgSend(self, sel_clientWithIdentifier_, 116);
  qword_26894D728 = (uint64_t)result;
  return result;
}

void *sub_2380DD7E4()
{
  uint64_t v1 = v0;
  uint64_t v34 = *v0;
  uint64_t v2 = sub_2380E46A8();
  uint64_t v33 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v4 = (char *)&v30 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_2380E4728();
  uint64_t v31 = *(void *)(v5 - 8);
  uint64_t v32 = v5;
  MEMORY[0x270FA5388](v5);
  os_log_type_t v7 = (char *)&v30 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_2380E4528();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v30 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26894AA20 != -1) {
    swift_once();
  }
  uint64_t v12 = __swift_project_value_buffer(v8, (uint64_t)qword_268956458);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, v12, v8);
  uint64_t v13 = sub_2380E4508();
  os_log_type_t v14 = sub_2380E4D38();
  if (os_log_type_enabled(v13, v14))
  {
    uint64_t v15 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v15 = 0;
    _os_log_impl(&dword_237EB8000, v13, v14, "ErrorFilingProvider#TrialClientManager#init", v15, 2u);
    MEMORY[0x23EC87710](v15, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  if (qword_26894AC50 != -1) {
    swift_once();
  }
  uint64_t v40 = sub_2380E0BCC;
  uint64_t v41 = (uint64_t)v1;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v37 = 1107296256;
  uint64_t v38 = sub_237EBF1FC;
  BOOL v39 = &block_descriptor_43_1;
  uint64_t v16 = _Block_copy(&aBlock);
  swift_retain();
  sub_2380E46D8();
  uint64_t v35 = MEMORY[0x263F8EE78];
  sub_237EBE214((unint64_t *)&qword_26894D730, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26894CD60);
  sub_237EBE3C0();
  sub_2380E5088();
  MEMORY[0x23EC86460](0, v7, v4, v16);
  _Block_release(v16);
  (*(void (**)(char *, uint64_t))(v33 + 8))(v4, v2);
  (*(void (**)(char *, uint64_t))(v31 + 8))(v7, v32);
  swift_release();
  if (qword_26894AC68 != -1) {
    swift_once();
  }
  uint64_t v17 = (void *)qword_26894D728;
  unint64_t v18 = (void *)sub_2380E4918();
  uint64_t v19 = qword_26894D700;
  uint64_t v20 = swift_allocObject();
  uint64_t v21 = v34;
  *(void *)(v20 + 16) = v1;
  *(void *)(v20 + 24) = v21;
  uint64_t v40 = sub_2380E0C08;
  uint64_t v41 = v20;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v37 = 1107296256;
  uint64_t v38 = sub_2380DD2D8;
  BOOL v39 = &block_descriptor_49_1;
  unint64_t v22 = _Block_copy(&aBlock);
  swift_retain();
  swift_release();
  id v23 = objc_msgSend(v17, sel_addUpdateHandlerForNamespaceName_queue_usingBlock_, v18, v19, v22);
  _Block_release(v22);
  swift_unknownObjectRelease();

  uint64_t v24 = (void *)qword_26894D728;
  uint64_t v25 = (void *)sub_2380E4B08();
  uint64_t v26 = (void *)sub_2380E4918();
  uint64_t v27 = qword_26894D700;
  uint64_t v40 = sub_2380DE0CC;
  uint64_t v41 = 0;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v37 = 1107296256;
  uint64_t v38 = sub_2380DE688;
  BOOL v39 = &block_descriptor_52_1;
  uint64_t v28 = _Block_copy(&aBlock);
  objc_msgSend(v24, sel_downloadLevelsForFactors_withNamespace_queue_options_progress_completion_, v25, v26, v27, 0, 0, v28);
  _Block_release(v28);

  return v1;
}

uint64_t sub_2380DDE10(uint64_t a1)
{
  uint64_t v2 = sub_2380E4528();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26894AA20 != -1) {
    swift_once();
  }
  uint64_t v6 = __swift_project_value_buffer(v2, (uint64_t)qword_268956458);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v6, v2);
  swift_unknownObjectRetain_n();
  os_log_type_t v7 = sub_2380E4508();
  os_log_type_t v8 = sub_2380E4D38();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    uint64_t v10 = swift_slowAlloc();
    uint64_t v15 = a1;
    uint64_t v16 = v10;
    *(_DWORD *)uint64_t v9 = 136315138;
    v14[1] = v9 + 4;
    swift_unknownObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26894C3E0);
    uint64_t v11 = sub_2380E4988();
    uint64_t v15 = sub_237EBC6BC(v11, v12, &v16);
    sub_2380E4FC8();
    swift_unknownObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_237EB8000, v7, v8, "ErrorFilingProvider#TrialClientManager update handler called with %s", v9, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23EC87710](v10, -1, -1);
    MEMORY[0x23EC87710](v9, -1, -1);
  }
  else
  {

    swift_unknownObjectRelease_n();
  }
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  if (qword_26894AC68 != -1) {
    swift_once();
  }
  objc_msgSend((id)qword_26894D728, sel_refresh);
  return sub_2380E0E38();
}

uint64_t sub_2380DE0CC(uint64_t a1, char *a2)
{
  uint64_t v3 = sub_2380E4528();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = MEMORY[0x270FA5388](v3);
  os_log_type_t v7 = (char *)&v40 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = MEMORY[0x270FA5388](v5);
  uint64_t v41 = (uint64_t (*)(char *, uint64_t))((char *)&v40 - v9);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v40 - v10;
  if (qword_26894AA20 != -1) {
    swift_once();
  }
  uint64_t v12 = __swift_project_value_buffer(v3, (uint64_t)qword_268956458);
  uint64_t v13 = *(void (**)(char *, uint64_t, uint64_t))(v4 + 16);
  v13(v11, v12, v3);
  os_log_type_t v14 = sub_2380E4508();
  os_log_type_t v15 = sub_2380E4D38();
  if (os_log_type_enabled(v14, v15))
  {
    uint64_t v16 = (uint8_t *)swift_slowAlloc();
    uint64_t v40 = a2;
    uint64_t v17 = v3;
    uint64_t v18 = v4;
    uint64_t v19 = v7;
    uint64_t v20 = v16;
    *(_WORD *)uint64_t v16 = 0;
    _os_log_impl(&dword_237EB8000, v14, v15, "ErrorFilingProvider#TrialClientManager downloadLevels", v16, 2u);
    uint64_t v21 = v20;
    os_log_type_t v7 = v19;
    uint64_t v4 = v18;
    uint64_t v3 = v17;
    a2 = v40;
    MEMORY[0x23EC87710](v21, -1, -1);
  }

  unint64_t v22 = *(void (**)(char *, uint64_t))(v4 + 8);
  v22(v11, v3);
  if (a2)
  {
    v13(v7, v12, v3);
    id v23 = a2;
    uint64_t v24 = a2;
    uint64_t v25 = a2;
    uint64_t v26 = sub_2380E4508();
    os_log_type_t v27 = sub_2380E4D48();
    if (os_log_type_enabled(v26, v27))
    {
      uint64_t v28 = swift_slowAlloc();
      uint64_t v29 = swift_slowAlloc();
      uint64_t v41 = (uint64_t (*)(char *, uint64_t))v22;
      uint64_t v30 = v29;
      uint64_t v43 = v29;
      *(_DWORD *)uint64_t v28 = 136315650;
      uint64_t v42 = sub_237EBC6BC(0xD000000000000019, 0x80000002380F3180, &v43);
      uint64_t v40 = v7;
      sub_2380E4FC8();
      *(_WORD *)(v28 + 12) = 2080;
      uint64_t v42 = sub_237EBC6BC(0xD000000000000023, 0x80000002380FC040, &v43);
      sub_2380E4FC8();
      *(_WORD *)(v28 + 22) = 2080;
      swift_getErrorValue();
      uint64_t v31 = sub_2380E5468();
      uint64_t v42 = sub_237EBC6BC(v31, v32, &v43);
      sub_2380E4FC8();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_237EB8000, v26, v27, "Error downloading levels for factor: %s in namespace: %s. Error: %s", (uint8_t *)v28, 0x20u);
      swift_arrayDestroy();
      MEMORY[0x23EC87710](v30, -1, -1);
      MEMORY[0x23EC87710](v28, -1, -1);

      return v41(v40, v3);
    }

    BOOL v39 = v7;
  }
  else
  {
    uint64_t v34 = (char *)v41;
    v13((char *)v41, v12, v3);
    uint64_t v35 = sub_2380E4508();
    os_log_type_t v36 = sub_2380E4D28();
    if (os_log_type_enabled(v35, v36))
    {
      uint64_t v37 = swift_slowAlloc();
      uint64_t v38 = swift_slowAlloc();
      uint64_t v43 = v38;
      *(_DWORD *)uint64_t v37 = 136315394;
      uint64_t v42 = sub_237EBC6BC(0xD000000000000019, 0x80000002380F3180, &v43);
      sub_2380E4FC8();
      *(_WORD *)(v37 + 12) = 2080;
      uint64_t v42 = sub_237EBC6BC(0xD000000000000023, 0x80000002380FC040, &v43);
      sub_2380E4FC8();
      _os_log_impl(&dword_237EB8000, v35, v36, "Successfully downloaded levels for factor: %s in namespace: %s", (uint8_t *)v37, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x23EC87710](v38, -1, -1);
      MEMORY[0x23EC87710](v37, -1, -1);

      return ((uint64_t (*)(void, uint64_t))v22)(v41, v3);
    }

    BOOL v39 = v34;
  }
  return ((uint64_t (*)(char *, uint64_t))v22)(v39, v3);
}

void sub_2380DE688(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  swift_retain();
  id v6 = a3;
  v5(a2, a3);
  swift_release();
}

uint64_t static ErrorFilingProvider.setTrialPolicy(dataPolicy:)(uint64_t a1, unint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_2380E46A8();
  uint64_t v31 = *(void *)(v6 - 8);
  uint64_t v32 = v6;
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)&v28 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_2380E4728();
  uint64_t v29 = *(void *)(v9 - 8);
  uint64_t v30 = v9;
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = (char *)&v28 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_2380E4528();
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  os_log_type_t v15 = (char *)&v28 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26894AA20 != -1) {
    swift_once();
  }
  uint64_t v16 = __swift_project_value_buffer(v12, (uint64_t)qword_268956458);
  (*(void (**)(char *, uint64_t, uint64_t))(v13 + 16))(v15, v16, v12);
  sub_2380E0A4C(a1, a2);
  uint64_t v17 = sub_2380E4508();
  os_log_type_t v18 = sub_2380E4D38();
  if (os_log_type_enabled(v17, v18))
  {
    uint64_t v28 = v3;
    uint64_t v19 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v19 = 134217984;
    if (a2 >> 60 == 15)
    {
      uint64_t v20 = 0;
    }
    else
    {
      uint64_t v20 = 0;
      switch(a2 >> 62)
      {
        case 1uLL:
          LODWORD(v20) = HIDWORD(a1) - a1;
          if (__OFSUB__(HIDWORD(a1), a1))
          {
            __break(1u);
LABEL_17:
            __break(1u);
            JUMPOUT(0x2380DEBF8);
          }
          uint64_t v20 = (int)v20;
          break;
        case 2uLL:
          uint64_t v22 = *(void *)(a1 + 16);
          uint64_t v21 = *(void *)(a1 + 24);
          BOOL v23 = __OFSUB__(v21, v22);
          uint64_t v20 = v21 - v22;
          if (!v23) {
            break;
          }
          goto LABEL_17;
        case 3uLL:
          break;
        default:
          uint64_t v20 = BYTE6(a2);
          break;
      }
    }
    aBlock[0] = v20;
    sub_2380E4FC8();
    sub_237F99F84(a1, a2);
    _os_log_impl(&dword_237EB8000, v17, v18, "ErrorFilingProvider#setTrialPolicy... policy is %ld bytes", v19, 0xCu);
    MEMORY[0x23EC87710](v19, -1, -1);
    uint64_t v3 = v28;
  }
  else
  {
    sub_237F99F84(a1, a2);
  }

  (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
  if (qword_26894AC50 != -1) {
    swift_once();
  }
  uint64_t v24 = (void *)swift_allocObject();
  void v24[2] = a1;
  v24[3] = a2;
  v24[4] = v3;
  aBlock[4] = sub_2380E0AA8;
  aBlock[5] = v24;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_237EBF1FC;
  void aBlock[3] = &block_descriptor_9_4;
  uint64_t v25 = _Block_copy(aBlock);
  sub_2380E0A4C(a1, a2);
  sub_2380E46D8();
  uint64_t v33 = MEMORY[0x263F8EE78];
  sub_237EBE214((unint64_t *)&qword_26894D730, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26894CD60);
  sub_237EBE3C0();
  uint64_t v26 = v32;
  sub_2380E5088();
  MEMORY[0x23EC86460](0, v11, v8, v25);
  _Block_release(v25);
  (*(void (**)(char *, uint64_t))(v31 + 8))(v8, v26);
  (*(void (**)(char *, uint64_t))(v29 + 8))(v11, v30);
  return swift_release();
}

uint64_t static ErrorFilingProvider.setupTrialClient()()
{
  uint64_t v0 = sub_2380E46A8();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)v16 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_2380E46C8();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_2380E4728();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = AFIsInternalInstall();
  if (result)
  {
    sub_2380E46E8();
    sub_238057D7C();
    v16[0] = v1;
    sub_2380E4718();
    uint64_t v13 = (void *)sub_2380E4E78();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    uint64_t v14 = *(void (**)(char *, uint64_t))(v9 + 8);
    v14(v11, v8);
    aBlock[4] = sub_2380DEF58;
    aBlock[5] = 0;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_237EBF1FC;
    void aBlock[3] = &block_descriptor_12_3;
    os_log_type_t v15 = _Block_copy(aBlock);
    sub_2380E46D8();
    v16[1] = MEMORY[0x263F8EE78];
    sub_237EBE214((unint64_t *)&qword_26894D730, MEMORY[0x263F8F030]);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26894CD60);
    sub_237EBE3C0();
    sub_2380E5088();
    MEMORY[0x23EC86460](0, v11, v3, v15);
    _Block_release(v15);

    (*(void (**)(char *, uint64_t))(v16[0] + 8))(v3, v0);
    return ((uint64_t (*)(char *, uint64_t))v14)(v11, v8);
  }
  return result;
}

uint64_t sub_2380DEF58()
{
  uint64_t v0 = sub_2380E4528();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)&v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26894AA20 != -1) {
    swift_once();
  }
  uint64_t v4 = __swift_project_value_buffer(v0, (uint64_t)qword_268956458);
  (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v3, v4, v0);
  uint64_t v5 = sub_2380E4508();
  os_log_type_t v6 = sub_2380E4D38();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl(&dword_237EB8000, v5, v6, "ErrorFilingProvider#setupTrialClient...", v7, 2u);
    MEMORY[0x23EC87710](v7, -1, -1);
  }

  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  if (qword_26894AC60 != -1) {
    return swift_once();
  }
  return result;
}

uint64_t sub_2380DF114()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_2380DF124()
{
  uint64_t v1 = *(uint64_t **)(v0 + 16);
  uint64_t v2 = qword_26894D708;
  unint64_t v3 = unk_26894D710;
  uint64_t v4 = *v1;
  unint64_t v5 = v1[1];
  *uint64_t v1 = qword_26894D708;
  v1[1] = v3;
  sub_2380E0A4C(v2, v3);
  return sub_237F99F84(v4, v5);
}

uint64_t sub_2380DF174()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t static ErrorFilingProvider.setErrorFilingInfo(errorCode:errorTitle:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v9 = sub_2380E46A8();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = sub_2380E4728();
  uint64_t v13 = *(void *)(v20 - 8);
  MEMORY[0x270FA5388](v20);
  os_log_type_t v15 = (char *)v19 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26894AC50 != -1) {
    swift_once();
  }
  v19[1] = qword_26894D700;
  uint64_t v16 = (void *)swift_allocObject();
  void v16[2] = a1;
  void v16[3] = a2;
  v16[4] = a3;
  v16[5] = a4;
  v16[6] = v4;
  aBlock[4] = sub_2380E0B34;
  aBlock[5] = v16;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_237EBF1FC;
  void aBlock[3] = &block_descriptor_18_1;
  uint64_t v17 = _Block_copy(aBlock);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_2380E46D8();
  uint64_t v21 = MEMORY[0x263F8EE78];
  sub_237EBE214((unint64_t *)&qword_26894D730, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26894CD60);
  sub_237EBE3C0();
  sub_2380E5088();
  MEMORY[0x23EC86460](0, v15, v12, v17);
  _Block_release(v17);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v20);
  return swift_release();
}

uint64_t sub_2380DF470(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (qword_26894AC58 != -1) {
    swift_once();
  }
  uint64_t v8 = MEMORY[0x263F8D310];
  uint64_t v15 = MEMORY[0x263F8D310];
  *(void *)&long long v14 = a1;
  *((void *)&v14 + 1) = a2;
  swift_beginAccess();
  swift_bridgeObjectRetain();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v12 = qword_26894D718;
  qword_26894D718 = 0x8000000000000000;
  sub_2380BA3E0(&v14, 0xD000000000000010, 0x80000002380FBF10, isUniquelyReferenced_nonNull_native, v16);
  qword_26894D718 = v12;
  swift_bridgeObjectRelease();
  swift_endAccess();
  uint64_t result = sub_237F098FC((uint64_t)v16, (uint64_t *)&unk_26894D750);
  if (a4)
  {
    uint64_t v15 = v8;
    *(void *)&long long v14 = a3;
    *((void *)&v14 + 1) = a4;
    swift_beginAccess();
    swift_bridgeObjectRetain();
    char v11 = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v13 = qword_26894D718;
    qword_26894D718 = 0x8000000000000000;
    sub_2380BA3E0(&v14, 0xD000000000000011, 0x80000002380FBF30, v11, v16);
    qword_26894D718 = v13;
    swift_bridgeObjectRelease();
    swift_endAccess();
    return sub_237F098FC((uint64_t)v16, (uint64_t *)&unk_26894D750);
  }
  return result;
}

uint64_t static ErrorFilingProvider.getErrorFilingInfo()()
{
  unint64_t v8 = sub_237FCF0C4(MEMORY[0x263F8EE78]);
  if (qword_26894AC50 != -1) {
    swift_once();
  }
  uint64_t v1 = qword_26894D700;
  uint64_t v2 = swift_allocObject();
  *(void *)(v2 + 16) = &v8;
  *(void *)(v2 + 24) = v0;
  uint64_t v3 = swift_allocObject();
  *(void *)(v3 + 16) = sub_2380E0B54;
  *(void *)(v3 + 24) = v2;
  aBlock[4] = sub_2380E14A8;
  aBlock[5] = v3;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_237FF270C;
  void aBlock[3] = &block_descriptor_28;
  uint64_t v4 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  dispatch_sync(v1, v4);
  _Block_release(v4);
  LOBYTE(v1) = swift_isEscapingClosureAtFileLocation();
  uint64_t result = swift_release();
  if (v1)
  {
    __break(1u);
  }
  else
  {
    unint64_t v6 = v8;
    swift_release();
    return v6;
  }
  return result;
}

uint64_t sub_2380DF7B8(void *a1)
{
  if (qword_26894AC58 != -1) {
    swift_once();
  }
  swift_beginAccess();
  *a1 = qword_26894D718;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t static ErrorFilingProvider.clearErrorFilingInfo()()
{
  uint64_t v0 = sub_2380E46A8();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)v10 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_2380E4728();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26894AC50 != -1) {
    swift_once();
  }
  aBlock[4] = sub_2380E00E4;
  aBlock[5] = 0;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_237EBF1FC;
  void aBlock[3] = &block_descriptor_31_1;
  unint64_t v8 = _Block_copy(aBlock);
  sub_2380E46D8();
  v10[1] = MEMORY[0x263F8EE78];
  sub_237EBE214((unint64_t *)&qword_26894D730, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26894CD60);
  sub_237EBE3C0();
  sub_2380E5088();
  MEMORY[0x23EC86460](0, v7, v3, v8);
  _Block_release(v8);
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return swift_release();
}

uint64_t sub_2380DFAEC(char a1)
{
  return sub_2380DFECC(a1, "ErrorFilingProvider#fileTTR TTR result: %{BOOL}d");
}

uint64_t static ErrorFilingProvider.generateABCSnapshot(errorToReport:errorDomain:errorType:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v27[1] = a6;
  _OWORD v27[2] = a4;
  v27[3] = a2;
  uint64_t v6 = sub_2380E4528();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)v27 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)v27 - v11;
  id v13 = objc_allocWithZone(MEMORY[0x263EFFA40]);
  long long v14 = (void *)sub_2380E4918();
  id v15 = objc_msgSend(v13, sel_initWithSuiteName_, v14);

  if (v15
    && (uint64_t v16 = (void *)sub_2380E4918(),
        unsigned __int8 v17 = objc_msgSend(v15, sel_BOOLForKey_, v16),
        v15,
        v16,
        (v17 & 1) != 0))
  {
    if (qword_26894AA20 != -1) {
      swift_once();
    }
    uint64_t v18 = __swift_project_value_buffer(v6, (uint64_t)qword_268956458);
    (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v10, v18, v6);
    uint64_t v19 = sub_2380E4508();
    os_log_type_t v20 = sub_2380E4D48();
    if (os_log_type_enabled(v19, v20))
    {
      uint64_t v21 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v21 = 0;
      _os_log_impl(&dword_237EB8000, v19, v20, "ErrorFilingProvider#generateABCSnapshot no-op because disabled!", v21, 2u);
      MEMORY[0x23EC87710](v21, -1, -1);
    }

    return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v10, v6);
  }
  else
  {
    if (qword_26894AA20 != -1) {
      swift_once();
    }
    uint64_t v23 = __swift_project_value_buffer(v6, (uint64_t)qword_268956458);
    (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v12, v23, v6);
    uint64_t v24 = sub_2380E4508();
    os_log_type_t v25 = sub_2380E4D58();
    if (os_log_type_enabled(v24, v25))
    {
      uint64_t v26 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v26 = 0;
      _os_log_impl(&dword_237EB8000, v24, v25, "ErrorFilingProvider#generateABCSnapshot called to capture some error condition", v26, 2u);
      MEMORY[0x23EC87710](v26, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v7 + 8))(v12, v6);
    sub_2380E3F88();
    swift_allocObject();
    sub_2380E3F78();
    sub_2380E3F68();
    return swift_release();
  }
}

uint64_t sub_2380DFEC0(char a1)
{
  return sub_2380DFECC(a1, "ErrorFilingProvider#generateABCSnapshot ABC result: %{BOOL}d");
}

uint64_t sub_2380DFECC(char a1, const char *a2)
{
  uint64_t v4 = sub_2380E4528();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26894AA20 != -1) {
    swift_once();
  }
  uint64_t v8 = __swift_project_value_buffer(v4, (uint64_t)qword_268956458);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v8, v4);
  uint64_t v9 = sub_2380E4508();
  os_log_type_t v10 = sub_2380E4D58();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v11 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v11 = 67109120;
    v13[3] = a1 & 1;
    sub_2380E4FC8();
    _os_log_impl(&dword_237EB8000, v9, v10, a2, v11, 8u);
    MEMORY[0x23EC87710](v11, -1, -1);
  }

  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

void static ErrorFilingProvider.createHomePodNewBugsAllTTRComponent()()
{
}

uint64_t ErrorFilingProvider.deinit()
{
  return v0;
}

uint64_t ErrorFilingProvider.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t sub_2380E00E4()
{
  if (qword_26894AC58 != -1) {
    swift_once();
  }
  swift_beginAccess();
  qword_26894D718 = MEMORY[0x263F8EE80];
  return swift_bridgeObjectRelease();
}

uint64_t sub_2380E0168(char *a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, char *a10, uint64_t a11, uint64_t a12, unint64_t a13)
{
  uint64_t v73 = a8;
  uint64_t v74 = a7;
  uint64_t v69 = a3;
  uint64_t v70 = a5;
  uint64_t v65 = a1;
  unint64_t v66 = a2;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26894D760);
  MEMORY[0x270FA5388](v14 - 8);
  uint64_t v64 = (char *)v62 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_2380E42B8();
  uint64_t v76 = *(void *)(v16 - 8);
  uint64_t v77 = v16;
  MEMORY[0x270FA5388](v16);
  uint64_t v75 = (char *)v62 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_26894D4E0);
  MEMORY[0x270FA5388](v18 - 8);
  uint64_t v72 = (uint64_t)v62 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v79 = sub_2380E4298();
  int64_t v68 = *(char **)(v79 - 8);
  MEMORY[0x270FA5388](v79);
  unint64_t v67 = (char *)v62 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = sub_2380E4528();
  uint64_t v22 = *(void *)(v21 - 8);
  uint64_t v23 = MEMORY[0x270FA5388](v21);
  os_log_type_t v25 = (char *)v62 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v23);
  os_log_type_t v27 = (char *)v62 - v26;
  id v28 = objc_allocWithZone(MEMORY[0x263EFFA40]);
  int64_t v71 = "leUniversalStoreIdentifiers>\"8";
  uint64_t v29 = (void *)sub_2380E4918();
  id v30 = objc_msgSend(v28, sel_initWithSuiteName_, v29);

  if (v30
    && (uint64_t v31 = (void *)sub_2380E4918(),
        unsigned __int8 v32 = objc_msgSend(v30, sel_BOOLForKey_, v31),
        v30,
        v31,
        (v32 & 1) != 0))
  {
    if (qword_26894AA20 != -1) {
      swift_once();
    }
    uint64_t v33 = __swift_project_value_buffer(v21, (uint64_t)qword_268956458);
    (*(void (**)(char *, uint64_t, uint64_t))(v22 + 16))(v25, v33, v21);
    uint64_t v34 = sub_2380E4508();
    os_log_type_t v35 = sub_2380E4D48();
    if (os_log_type_enabled(v34, v35))
    {
      os_log_type_t v36 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)os_log_type_t v36 = 0;
      _os_log_impl(&dword_237EB8000, v34, v35, "ErrorFilingProvider#fileTTR no-op because disabled!", v36, 2u);
      MEMORY[0x23EC87710](v36, -1, -1);
    }

    return (*(uint64_t (**)(char *, uint64_t))(v22 + 8))(v25, v21);
  }
  else
  {
    if (qword_26894AA20 != -1) {
      swift_once();
    }
    void v62[2] = a6;
    uint64_t v38 = __swift_project_value_buffer(v21, (uint64_t)qword_268956458);
    (*(void (**)(char *, uint64_t, uint64_t))(v22 + 16))(v27, v38, v21);
    BOOL v39 = sub_2380E4508();
    os_log_type_t v40 = sub_2380E4D58();
    if (os_log_type_enabled(v39, v40))
    {
      uint64_t v41 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v41 = 0;
      _os_log_impl(&dword_237EB8000, v39, v40, "ErrorFilingProvider#fileTTR called to capture some error condition", v41, 2u);
      MEMORY[0x23EC87710](v41, -1, -1);
    }
    v62[0] = a9;

    (*(void (**)(char *, uint64_t))(v22 + 8))(v27, v21);
    uint64_t v42 = static ErrorFilingProvider.getTrialPolicy()();
    if (v43 >> 60 == 15) {
      uint64_t v44 = 0;
    }
    else {
      uint64_t v44 = v42;
    }
    if (v43 >> 60 == 15) {
      unint64_t v45 = 0xC000000000000000;
    }
    else {
      unint64_t v45 = v43;
    }
    sub_2380E4308();
    swift_allocObject();
    sub_23800CAA0(v44, v45);
    swift_bridgeObjectRetain();
    uint64_t v69 = v44;
    unint64_t v63 = v45;
    v62[1] = sub_2380E42E8();
    unint64_t v78 = a13;
    v62[3] = a12;
    if (a13)
    {
      uint64_t v80 = a12;
      unint64_t v81 = a13;
      swift_bridgeObjectRetain();
      sub_2380E4A18();
    }
    uint64_t v46 = v79;
    uint64_t v47 = v68;
    if (a11)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      unint64_t v50 = v66;
      uint64_t v49 = v67;
      uint64_t v51 = v65;
    }
    else
    {
      uint64_t v80 = 0;
      unint64_t v81 = 0xE000000000000000;
      sub_2380E5178();
      sub_2380E4A18();
      sub_2380E4A18();
      swift_bridgeObjectRelease();
      sub_2380E4A18();
      swift_bridgeObjectRelease();
      uint64_t v51 = v65;
      unint64_t v50 = v66;
      sub_2380E4A18();
      a10 = (char *)v80;
      uint64_t v49 = v67;
    }
    if (v78) {
      uint64_t v52 = v51;
    }
    else {
      uint64_t v52 = a10;
    }
    unint64_t v67 = v52;
    int64_t v68 = a10;
    swift_bridgeObjectRetain();
    uint64_t v80 = (uint64_t)v51;
    unint64_t v81 = v50;
    swift_bridgeObjectRetain();
    sub_2380E4A18();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    uint64_t v53 = v72;
    sub_2380E1440(v62[0], v72);
    if ((*((unsigned int (**)(uint64_t, uint64_t, uint64_t))v47 + 6))(v53, 1, v46) == 1)
    {
      MEMORY[0x23EC85890](0xD000000000000011, 0x80000002380FC130, 0x6F69647541, 0xE500000000000000, 1050192);
      sub_237F098FC(v53, &qword_26894D4E0);
    }
    else
    {
      (*((void (**)(char *, uint64_t, uint64_t))v47 + 4))(v49, v53, v46);
    }
    uint64_t v54 = (uint64_t)v64;
    uint64_t v55 = v49;
    uint64_t v56 = v47;
    uint64_t v57 = v74;
    swift_bridgeObjectRetain();
    uint64_t v58 = swift_bridgeObjectRetain();
    uint64_t v59 = v75;
    MEMORY[0x23EC858B0](v58, &unk_26EAF7E58, v57, 0xD00000000000001ALL, 0x80000002380FC150);
    uint64_t v60 = v76;
    uint64_t v61 = v77;
    (*(void (**)(uint64_t, char *, uint64_t))(v76 + 16))(v54, v59, v77);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v60 + 56))(v54, 0, 1, v61);
    sub_2380E42D8();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_release();
    sub_237EFD1BC(v69, v63);
    sub_237F098FC(v54, (uint64_t *)&unk_26894D760);
    (*(void (**)(char *, uint64_t))(v60 + 8))(v59, v61);
    return (*((uint64_t (**)(char *, uint64_t))v56 + 1))(v55, v79);
  }
}

uint64_t sub_2380E0A4C(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_23800CAA0(a1, a2);
  }
  return a1;
}

uint64_t sub_2380E0A60()
{
  unint64_t v1 = *(void *)(v0 + 24);
  if (v1 >> 60 != 15) {
    sub_237EFD1BC(*(void *)(v0 + 16), v1);
  }
  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_2380E0AA8()
{
  uint64_t v1 = *(void *)(v0 + 16);
  unint64_t v2 = *(void *)(v0 + 24);
  uint64_t v3 = qword_26894D708;
  unint64_t v4 = unk_26894D710;
  qword_26894D708 = v1;
  unk_26894D710 = v2;
  sub_2380E0A4C(v1, v2);
  return sub_237F99F84(v3, v4);
}

uint64_t sub_2380E0AF4()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t sub_2380E0B34()
{
  return sub_2380DF470(v0[2], v0[3], v0[4], v0[5]);
}

uint64_t sub_2380E0B44()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_2380E0B54()
{
  return sub_2380DF7B8(*(void **)(v0 + 16));
}

uint64_t sub_2380E0B5C()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t type metadata accessor for ErrorFilingProvider()
{
  return self;
}

uint64_t method lookup function for ErrorFilingProvider(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for ErrorFilingProvider);
}

uint64_t type metadata accessor for ErrorFilingProvider.TrialClientManager()
{
  return self;
}

uint64_t sub_2380E0BD0()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_2380E0C08(uint64_t a1)
{
  return sub_2380DDE10(a1);
}

id sub_2380E0C10(void *a1)
{
  uint64_t v2 = sub_2380E4528();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!a1) {
    goto LABEL_8;
  }
  id result = objc_msgSend(a1, sel_fileValue);
  if (result)
  {
    uint64_t v7 = result;
    id v8 = objc_msgSend(result, sel_path);

    if (v8)
    {
      uint64_t v9 = sub_2380E4938();
      unint64_t v11 = v10;

      uint64_t v12 = HIBYTE(v11) & 0xF;
      if ((v11 & 0x2000000000000000) == 0) {
        uint64_t v12 = v9 & 0xFFFFFFFFFFFFLL;
      }
      if (v12) {
        return (id)v9;
      }
      swift_bridgeObjectRelease();
    }
LABEL_8:
    if (qword_26894AA20 != -1) {
      swift_once();
    }
    uint64_t v13 = __swift_project_value_buffer(v2, (uint64_t)qword_268956458);
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v13, v2);
    uint64_t v14 = sub_2380E4508();
    os_log_type_t v15 = sub_2380E4D38();
    if (os_log_type_enabled(v14, v15))
    {
      uint64_t v16 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v16 = 0;
      _os_log_impl(&dword_237EB8000, v14, v15, "ErrorFilingProvider#TrialClientManager#getPathForFactor using default local file system path", v16, 2u);
      MEMORY[0x23EC87710](v16, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    return (id)0xD000000000000065;
  }
  __break(1u);
  return result;
}

uint64_t sub_2380E0E38()
{
  uint64_t v0 = sub_2380E2C68();
  uint64_t v48 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v2 = (char *)&v41 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_2380E4528();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = MEMORY[0x270FA5388](v3);
  uint64_t v46 = (char *)&v41 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)&v41 - v8;
  MEMORY[0x270FA5388](v7);
  unint64_t v11 = (char *)&v41 - v10;
  if (qword_26894AA20 != -1) {
    swift_once();
  }
  uint64_t v12 = __swift_project_value_buffer(v3, (uint64_t)qword_268956458);
  uint64_t v49 = *(void (**)(char *))(v4 + 16);
  uint64_t v50 = v12;
  v49(v11);
  uint64_t v13 = sub_2380E4508();
  os_log_type_t v14 = sub_2380E4D38();
  if (os_log_type_enabled(v13, v14))
  {
    os_log_type_t v15 = v9;
    uint64_t v16 = v2;
    uint64_t v17 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v17 = 0;
    _os_log_impl(&dword_237EB8000, v13, v14, "ErrorFilingProvider#TrialClientManager#loadLatest...", v17, 2u);
    uint64_t v18 = v17;
    uint64_t v2 = v16;
    uint64_t v9 = v15;
    MEMORY[0x23EC87710](v18, -1, -1);
  }

  uint64_t v20 = *(void (**)(char *, uint64_t))(v4 + 8);
  uint64_t v19 = v4 + 8;
  uint64_t v51 = v20;
  v20(v11, v3);
  if (qword_26894AC68 != -1) {
    swift_once();
  }
  uint64_t v21 = (void *)qword_26894D728;
  uint64_t v22 = (void *)sub_2380E4918();
  uint64_t v23 = (void *)sub_2380E4918();
  id v24 = objc_msgSend(v21, sel_levelForFactor_withNamespaceName_, v22, v23);

  id v47 = v24;
  id v25 = sub_2380E0C10(v24);
  unint64_t v27 = v26;
  ((void (*)(char *, uint64_t, uint64_t))v49)(v9, v50, v3);
  swift_bridgeObjectRetain_n();
  id v28 = sub_2380E4508();
  os_log_type_t v29 = sub_2380E4D38();
  if (os_log_type_enabled(v28, v29))
  {
    uint64_t v42 = v9;
    uint64_t v43 = v19;
    uint64_t v30 = swift_slowAlloc();
    uint64_t v45 = v0;
    uint64_t v31 = (uint8_t *)v30;
    uint64_t v32 = swift_slowAlloc();
    uint64_t v44 = v2;
    uint64_t v33 = v32;
    uint64_t v53 = v32;
    *(_DWORD *)uint64_t v31 = 136446210;
    swift_bridgeObjectRetain();
    uint64_t v52 = sub_237EBC6BC((uint64_t)v25, v27, &v53);
    sub_2380E4FC8();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_237EB8000, v28, v29, "ErrorFilingProvider#TrialClientManager#loadLatest level path: %{public}s", v31, 0xCu);
    swift_arrayDestroy();
    uint64_t v34 = v33;
    uint64_t v2 = v44;
    MEMORY[0x23EC87710](v34, -1, -1);
    os_log_type_t v35 = v31;
    uint64_t v0 = v45;
    MEMORY[0x23EC87710](v35, -1, -1);

    os_log_type_t v36 = v42;
  }
  else
  {

    swift_bridgeObjectRelease_n();
    os_log_type_t v36 = v9;
  }
  v51(v36, v3);
  sub_2380E2BF8();
  swift_bridgeObjectRelease();
  uint64_t v37 = sub_2380E2C88();
  unint64_t v39 = v38;
  type metadata accessor for ErrorFilingProvider();
  sub_23800CAA0(v37, v39);
  static ErrorFilingProvider.setTrialPolicy(dataPolicy:)(v37, v39);
  sub_237EFD1BC(v37, v39);

  sub_237EFD1BC(v37, v39);
  return (*(uint64_t (**)(char *, uint64_t))(v48 + 8))(v2, v0);
}

uint64_t sub_2380E1440(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26894D4E0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

void *sub_2380E14EC()
{
  return &unk_26EAF4558;
}

uint64_t sub_2380E14F8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  uint64_t v20 = a7;
  uint64_t v21 = a3;
  uint64_t v18 = a6;
  uint64_t v19 = a2;
  uint64_t v22 = a4;
  uint64_t v23 = a5;
  uint64_t v17 = a1;
  uint64_t v11 = sub_2380E44F8();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  os_log_type_t v14 = (char *)&v17 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26894A818 != -1) {
    swift_once();
  }
  id v15 = (id)qword_268956368;
  sub_2380E44D8();
  sub_2380E4EB8();
  sub_2380E44B8();
  sub_237F29684(a9, a10, v17, v19, v21, v22, v23, &v24, v18, v20, a8);
  sub_2380E4EA8();
  sub_2380E44C8();
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  return v24;
}

uint64_t sub_2380E16F0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = swift_allocObject();
  uint64_t v5 = __swift_mutable_project_boxed_opaque_existential_1(a2, *(void *)(a2 + 24));
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = (uint64_t *)&v16[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  (*(void (**)(uint64_t *))(v8 + 16))(v7);
  uint64_t v9 = *v7;
  v18[3] = type metadata accessor for MediaPlaybackProvider();
  v18[4] = &off_26EB042B8;
  v18[0] = v9;
  sub_237ECEFFC((uint64_t)v18, (uint64_t)v16);
  uint64_t v10 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v16, v17);
  MEMORY[0x270FA5388](v10);
  uint64_t v12 = (uint64_t *)&v16[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  (*(void (**)(uint64_t *))(v13 + 16))(v12);
  uint64_t v14 = sub_2380E18F0(a1, *v12, v4);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v16);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v18);
  __swift_destroy_boxed_opaque_existential_1(a2);
  return v14;
}

uint64_t type metadata accessor for PodcastStationPlaybackHandler()
{
  return self;
}

uint64_t sub_2380E18F0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_2380E4528();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v18[-1] - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18[3] = type metadata accessor for MediaPlaybackProvider();
  v18[4] = &off_26EB042B8;
  v18[0] = a2;
  *(void *)(a3 + 16) = a1;
  sub_237ECEFFC((uint64_t)v18, a3 + 32);
  uint64_t v10 = qword_26894AA20;
  swift_retain();
  if (v10 != -1) {
    swift_once();
  }
  uint64_t v11 = __swift_project_value_buffer(v6, (uint64_t)qword_268956458);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, v11, v6);
  uint64_t v12 = sub_2380E4508();
  os_log_type_t v13 = sub_2380E4D58();
  if (os_log_type_enabled(v12, v13))
  {
    uint64_t v14 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v14 = 0;
    _os_log_impl(&dword_237EB8000, v12, v13, "PodcastPlaybackHandler#ControllerReferece Retrieving controller reference...", v14, 2u);
    MEMORY[0x23EC87710](v14, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26894D780);
  swift_allocObject();
  uint64_t v15 = sub_237F5EE3C(0xD00000000000001CLL, 0x80000002380FC1D0, sub_2380E1B30, a1);
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v18);
  *(void *)(a3 + 24) = v15;
  return a3;
}

uint64_t sub_2380E1B30(uint64_t a1, uint64_t a2)
{
  return sub_237F3F458(a1, a2);
}

uint64_t FollowShowAppIntent.init(show:)@<X0>(uint64_t *a1@<X8>)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26894C9B0);
  swift_allocObject();
  uint64_t result = sub_2380E41E8();
  *a1 = result;
  return result;
}

unint64_t static FollowShowAppIntent.bundleIdentifier.getter()
{
  return 0xD000000000000012;
}

unint64_t static FollowShowAppIntent.actionIdentifier.getter()
{
  return 0xD000000000000013;
}

unint64_t sub_2380E1BC4()
{
  return 0xD000000000000013;
}

ValueMetadata *type metadata accessor for FollowShowAppIntent()
{
  return &type metadata for FollowShowAppIntent;
}

void sub_2380E1BF0(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_2380E4528();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v25 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v8 = objc_msgSend(a1, sel_companionDeviceInfo);
  if (v8)
  {
    uint64_t v9 = v8;
    id v10 = objc_msgSend(v8, sel_assistantID);
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = sub_2380E4938();
      uint64_t v14 = v13;
    }
    else
    {
      uint64_t v12 = 0;
      uint64_t v14 = 0;
    }
    id v19 = objc_msgSend(v9, sel_productPrefix);
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = sub_2380E4938();
      uint64_t v23 = v22;
    }
    else
    {
      uint64_t v21 = 0;
      uint64_t v23 = 0;
    }
    unsigned __int8 v24 = objc_msgSend(v9, sel_peerToPeerHandoffCapability);

    *(void *)a2 = v12;
    *(void *)(a2 + 8) = v14;
    *(void *)(a2 + 16) = v21;
    *(void *)(a2 + 24) = v23;
    *(unsigned char *)(a2 + 32) = v24;
  }
  else
  {
    if (qword_26894AA20 != -1) {
      swift_once();
    }
    uint64_t v15 = __swift_project_value_buffer(v4, (uint64_t)qword_268956458);
    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v15, v4);
    uint64_t v16 = sub_2380E4508();
    os_log_type_t v17 = sub_2380E4D48();
    if (os_log_type_enabled(v16, v17))
    {
      uint64_t v18 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v18 = 0;
      _os_log_impl(&dword_237EB8000, v16, v17, "CompanionDeviceInfo#from AFSharedUserInfo.companionDeviceInfo is nil. Bailing", v18, 2u);
      MEMORY[0x23EC87710](v18, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    *(_OWORD *)a2 = xmmword_2380F0DD0;
    *(void *)(a2 + 16) = 0;
    *(void *)(a2 + 24) = 0;
    *(unsigned char *)(a2 + 32) = 0;
  }
}

uint64_t CompanionDeviceInfo.assistantID.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t CompanionDeviceInfo.assistantID.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*CompanionDeviceInfo.assistantID.modify())()
{
  return nullsub_1;
}

uint64_t CompanionDeviceInfo.productPrefix.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t CompanionDeviceInfo.productPrefix.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = a2;
  return result;
}

uint64_t (*CompanionDeviceInfo.productPrefix.modify())()
{
  return nullsub_1;
}

uint64_t CompanionDeviceInfo.peerToPeerHandoffCapability.getter()
{
  return *(unsigned __int8 *)(v0 + 32);
}

uint64_t CompanionDeviceInfo.peerToPeerHandoffCapability.setter(uint64_t result)
{
  *(unsigned char *)(v1 + 32) = result;
  return result;
}

uint64_t (*CompanionDeviceInfo.peerToPeerHandoffCapability.modify())()
{
  return nullsub_1;
}

void __swiftcall CompanionDeviceInfo.init(assistantID:productPrefix:peerToPeerHandoffCapability:)(SiriAudioSupport::CompanionDeviceInfo *__return_ptr retstr, Swift::String_optional assistantID, Swift::String_optional productPrefix, Swift::Bool_optional peerToPeerHandoffCapability)
{
  retstr->assistantID = assistantID;
  retstr->productPrefix = productPrefix;
  retstr->peerToPeerHandoffCapability = peerToPeerHandoffCapability;
}

Swift::Bool __swiftcall CompanionDeviceInfo.supports(version:)(SiriAudioSupport::BuildVersion version)
{
  uint64_t v2 = (unsigned __int8 *)version;
  uint64_t v3 = sub_2380E4528();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = MEMORY[0x270FA5388](v3);
  uint64_t v7 = (char *)&v25 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)&v25 - v8;
  unint64_t v10 = *(void *)(v1 + 24);
  if (v10)
  {
    int v11 = *v2;
    uint64_t v12 = *(void *)(v1 + 16);
    type metadata accessor for CompanionProductPrefixParser();
    swift_initStackObject();
    swift_bridgeObjectRetain_n();
    CompanionProductPrefixParser.init(for:)();
    LOBYTE(v28) = v11;
    char v13 = sub_237F64E4C(&v28);
    swift_release();
    if (v13)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    if (qword_26894AA20 != -1) {
      swift_once();
    }
    uint64_t v19 = __swift_project_value_buffer(v3, (uint64_t)qword_268956458);
    (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v9, v19, v3);
    swift_bridgeObjectRetain();
    uint64_t v20 = sub_2380E4508();
    os_log_type_t v21 = sub_2380E4D48();
    if (os_log_type_enabled(v20, v21))
    {
      uint64_t v22 = swift_slowAlloc();
      uint64_t v26 = swift_slowAlloc();
      uint64_t v28 = v26;
      *(_DWORD *)uint64_t v22 = 136315394;
      swift_bridgeObjectRetain();
      uint64_t v27 = sub_237EBC6BC(v12, v10, &v28);
      sub_2380E4FC8();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v22 + 12) = 2080;
      if (v11) {
        uint64_t v23 = 4534578;
      }
      else {
        uint64_t v23 = 4272434;
      }
      uint64_t v27 = sub_237EBC6BC(v23, 0xE300000000000000, &v28);
      sub_2380E4FC8();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_237EB8000, v20, v21, "CompanionDeviceInfo#supports companion version: %s older than required version: %s", (uint8_t *)v22, 0x16u);
      uint64_t v24 = v26;
      swift_arrayDestroy();
      MEMORY[0x23EC87710](v24, -1, -1);
      MEMORY[0x23EC87710](v22, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    (*(void (**)(char *, uint64_t))(v4 + 8))(v9, v3);
  }
  else
  {
    if (qword_26894AA20 != -1) {
      swift_once();
    }
    uint64_t v15 = __swift_project_value_buffer(v3, (uint64_t)qword_268956458);
    (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v7, v15, v3);
    uint64_t v16 = sub_2380E4508();
    os_log_type_t v17 = sub_2380E4D48();
    if (os_log_type_enabled(v16, v17))
    {
      uint64_t v18 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v18 = 0;
      _os_log_impl(&dword_237EB8000, v16, v17, "CompanionDeviceInfo#supports nil prefix returned. Returning false", v18, 2u);
      MEMORY[0x23EC87710](v18, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);
  }
  return 0;
}

uint64_t CompanionDeviceInfo.description.getter()
{
  return 0;
}

Swift::Bool __swiftcall CompanionDeviceInfo.supportsSiriForAirPlay()()
{
  int v1 = *((unsigned __int8 *)v0 + 32);
  long long v2 = v0[1];
  long long v7 = *v0;
  long long v8 = v2;
  char v9 = v1;
  char v6 = 0;
  Swift::Bool v3 = CompanionDeviceInfo.supports(version:)((SiriAudioSupport::BuildVersion)&v6);
  Swift::Bool v4 = v1 & 1;
  if (v1 == 2) {
    Swift::Bool v4 = 0;
  }
  return v3 && v4;
}

Swift::Bool __swiftcall CompanionDeviceInfo.supportsHomePodAppSelection()()
{
  uint64_t v1 = *v0;
  uint64_t v2 = v0[1];
  uint64_t v3 = v0[2];
  uint64_t v4 = v0[3];
  int v5 = *((unsigned __int8 *)v0 + 32);
  uint64_t v10 = *v0;
  uint64_t v11 = v2;
  uint64_t v12 = v3;
  uint64_t v13 = v4;
  char v14 = v5;
  char v9 = 1;
  if (!CompanionDeviceInfo.supports(version:)((SiriAudioSupport::BuildVersion)&v9)) {
    return 0;
  }
  uint64_t v10 = v1;
  uint64_t v11 = v2;
  uint64_t v12 = v3;
  uint64_t v13 = v4;
  char v14 = v5;
  char v9 = 0;
  Swift::Bool v6 = CompanionDeviceInfo.supports(version:)((SiriAudioSupport::BuildVersion)&v9);
  Swift::Bool v7 = v5 & 1;
  if (v5 == 2) {
    Swift::Bool v7 = 0;
  }
  return v6 && v7;
}

uint64_t destroy for CompanionDeviceInfo()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for CompanionDeviceInfo(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for CompanionDeviceInfo(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  return a1;
}

__n128 __swift_memcpy33_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for CompanionDeviceInfo(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  return a1;
}

uint64_t getEnumTagSinglePayload for CompanionDeviceInfo(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 33)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  unint64_t v3 = *(void *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for CompanionDeviceInfo(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(unsigned char *)(result + 32) = 0;
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
    *(void *)(result + 8) = 0;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 33) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 33) = 0;
    }
    if (a2) {
      *(void *)(result + 8) = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for CompanionDeviceInfo()
{
  return &type metadata for CompanionDeviceInfo;
}

uint64_t INMediaItem.isInternalSignalPresent(_:)(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2)
  {
    uint64_t v3 = a1 + 32;
    swift_bridgeObjectRetain();
    uint64_t v4 = 0;
    uint64_t v5 = &off_264D03000;
    Swift::Bool v6 = &off_264D03000;
    uint64_t v24 = v2;
    while (1)
    {
      Swift::Bool v7 = (uint64_t *)(v3 + 16 * v4);
      uint64_t v9 = *v7;
      uint64_t v8 = v7[1];
      swift_bridgeObjectRetain();
      id v10 = [v1 (SEL)v5[463]];
      if (!v10) {
        goto LABEL_21;
      }
      uint64_t v11 = v10;
      id v12 = [v10 (SEL)v6[208]];

      if (!v12) {
        goto LABEL_21;
      }
      uint64_t v13 = (void *)sub_2380E4B28();

      uint64_t v14 = v13[2];
      if (!v14) {
        break;
      }
      BOOL v15 = v13[4] == v9 && v13[5] == v8;
      if (v15 || (uint64_t v16 = v1, v17 = v3, (sub_2380E5408() & 1) != 0))
      {
LABEL_25:
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t v22 = 1;
        goto LABEL_27;
      }
      if (v14 != 1)
      {
        uint64_t v18 = v13 + 7;
        uint64_t v19 = 1;
        while (1)
        {
          uint64_t v20 = v19 + 1;
          if (__OFADD__(v19, 1)) {
            break;
          }
          BOOL v21 = *(v18 - 1) == v9 && *v18 == v8;
          if (v21 || (sub_2380E5408() & 1) != 0) {
            goto LABEL_25;
          }
          v18 += 2;
          ++v19;
          if (v20 == v14) {
            goto LABEL_20;
          }
        }
        __break(1u);
        return sub_2380E29F8();
      }
LABEL_20:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v3 = v17;
      uint64_t v1 = v16;
      uint64_t v2 = v24;
      uint64_t v5 = &off_264D03000;
      Swift::Bool v6 = &off_264D03000;
LABEL_22:
      if (++v4 == v2)
      {
        uint64_t v22 = 0;
LABEL_27:
        swift_bridgeObjectRelease();
        return v22;
      }
    }
    swift_bridgeObjectRelease();
LABEL_21:
    swift_bridgeObjectRelease();
    goto LABEL_22;
  }
  return 0;
}

uint64_t sub_2380E29F8()
{
  return MEMORY[0x270EEE098]();
}

uint64_t sub_2380E2A08()
{
  return MEMORY[0x270EEE0C0]();
}

uint64_t sub_2380E2A18()
{
  return MEMORY[0x270EEE188]();
}

uint64_t sub_2380E2A28()
{
  return MEMORY[0x270EEE258]();
}

uint64_t sub_2380E2A38()
{
  return MEMORY[0x270EEE3E0]();
}

uint64_t sub_2380E2A48()
{
  return MEMORY[0x270EEE410]();
}

uint64_t sub_2380E2A58()
{
  return MEMORY[0x270EEE4C0]();
}

uint64_t sub_2380E2A68()
{
  return MEMORY[0x270EEE4C8]();
}

uint64_t sub_2380E2A78()
{
  return MEMORY[0x270EEE4D0]();
}

uint64_t sub_2380E2A88()
{
  return MEMORY[0x270EEE520]();
}

uint64_t sub_2380E2A98()
{
  return MEMORY[0x270EEE548]();
}

uint64_t sub_2380E2AA8()
{
  return MEMORY[0x270EEE5B8]();
}

uint64_t sub_2380E2AB8()
{
  return MEMORY[0x270EEE5C0]();
}

uint64_t sub_2380E2AC8()
{
  return MEMORY[0x270EEE5F8]();
}

uint64_t sub_2380E2AD8()
{
  return MEMORY[0x270EEE610]();
}

uint64_t sub_2380E2AE8()
{
  return MEMORY[0x270EEE618]();
}

uint64_t sub_2380E2AF8()
{
  return MEMORY[0x270EEE628]();
}

uint64_t sub_2380E2B08()
{
  return MEMORY[0x270EEE638]();
}

uint64_t sub_2380E2B18()
{
  return MEMORY[0x270EEE648]();
}

uint64_t sub_2380E2B28()
{
  return MEMORY[0x270EEE658]();
}

uint64_t sub_2380E2B38()
{
  return MEMORY[0x270EEE670]();
}

uint64_t sub_2380E2B48()
{
  return MEMORY[0x270EEE688]();
}

uint64_t sub_2380E2B58()
{
  return MEMORY[0x270EEE768]();
}

uint64_t sub_2380E2B68()
{
  return MEMORY[0x270EEE870]();
}

uint64_t sub_2380E2B78()
{
  return MEMORY[0x270EEE8E8]();
}

uint64_t sub_2380E2B88()
{
  return MEMORY[0x270EEEA60]();
}

uint64_t sub_2380E2B98()
{
  return MEMORY[0x270EEF830]();
}

uint64_t sub_2380E2BA8()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_2380E2BB8()
{
  return MEMORY[0x270EEFB78]();
}

uint64_t sub_2380E2BC8()
{
  return MEMORY[0x270EEFB88]();
}

uint64_t sub_2380E2BD8()
{
  return MEMORY[0x270EEFC48]();
}

uint64_t sub_2380E2BE8()
{
  return MEMORY[0x270EEFC58]();
}

uint64_t sub_2380E2BF8()
{
  return MEMORY[0x270EEFCB0]();
}

uint64_t sub_2380E2C08()
{
  return MEMORY[0x270EEFD28]();
}

uint64_t sub_2380E2C18()
{
  return MEMORY[0x270EEFE20]();
}

uint64_t sub_2380E2C28()
{
  return MEMORY[0x270EEFE60]();
}

uint64_t sub_2380E2C38()
{
  return MEMORY[0x270EEFE80]();
}

uint64_t sub_2380E2C48()
{
  return MEMORY[0x270EEFEE0]();
}

uint64_t sub_2380E2C58()
{
  return MEMORY[0x270EEFF00]();
}

uint64_t sub_2380E2C68()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_2380E2C78()
{
  return MEMORY[0x270EEFFB0]();
}

uint64_t sub_2380E2C88()
{
  return MEMORY[0x270EEFFC8]();
}

uint64_t sub_2380E2C98()
{
  return MEMORY[0x270EF0060]();
}

uint64_t sub_2380E2CA8()
{
  return MEMORY[0x270EF0070]();
}

uint64_t sub_2380E2CB8()
{
  return MEMORY[0x270EF0090]();
}

uint64_t sub_2380E2CC8()
{
  return MEMORY[0x270EF00B0]();
}

uint64_t sub_2380E2CD8()
{
  return MEMORY[0x270EF0120]();
}

uint64_t sub_2380E2CE8()
{
  return MEMORY[0x270EF0178]();
}

uint64_t sub_2380E2CF8()
{
  return MEMORY[0x270EF0320]();
}

uint64_t sub_2380E2D08()
{
  return MEMORY[0x270EF0360]();
}

uint64_t sub_2380E2D18()
{
  return MEMORY[0x270EF0428]();
}

uint64_t sub_2380E2D28()
{
  return MEMORY[0x270EF0440]();
}

uint64_t sub_2380E2D38()
{
  return MEMORY[0x270EF0548]();
}

uint64_t sub_2380E2D48()
{
  return MEMORY[0x270EF0568]();
}

uint64_t sub_2380E2D58()
{
  return MEMORY[0x270EF06E0]();
}

uint64_t sub_2380E2D68()
{
  return MEMORY[0x270EF0700]();
}

uint64_t sub_2380E2D78()
{
  return MEMORY[0x270EF07E0]();
}

uint64_t sub_2380E2D88()
{
  return MEMORY[0x270EF0898]();
}

uint64_t sub_2380E2D98()
{
  return MEMORY[0x270EF0998]();
}

uint64_t sub_2380E2DA8()
{
  return MEMORY[0x270EF09B8]();
}

uint64_t sub_2380E2DB8()
{
  return MEMORY[0x270EF09E0]();
}

uint64_t sub_2380E2DC8()
{
  return MEMORY[0x270EF0AF0]();
}

uint64_t sub_2380E2DD8()
{
  return MEMORY[0x270EF0AF8]();
}

uint64_t sub_2380E2DE8()
{
  return MEMORY[0x270EF0BA8]();
}

uint64_t sub_2380E2DF8()
{
  return MEMORY[0x270EF0BB8]();
}

uint64_t sub_2380E2E08()
{
  return MEMORY[0x270EF0C20]();
}

uint64_t sub_2380E2E18()
{
  return MEMORY[0x270EF0C30]();
}

uint64_t sub_2380E2E28()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_2380E2E38()
{
  return MEMORY[0x270EF0C58]();
}

uint64_t sub_2380E2E48()
{
  return MEMORY[0x270EF0C68]();
}

uint64_t sub_2380E2E58()
{
  return MEMORY[0x270EF0C80]();
}

uint64_t sub_2380E2E68()
{
  return MEMORY[0x270EF0C88]();
}

uint64_t sub_2380E2E78()
{
  return MEMORY[0x270EF0CB8]();
}

uint64_t sub_2380E2E88()
{
  return MEMORY[0x270EF0D08]();
}

uint64_t sub_2380E2E98()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_2380E2EA8()
{
  return MEMORY[0x270EF0D78]();
}

uint64_t sub_2380E2EB8()
{
  return MEMORY[0x270EF0D80]();
}

uint64_t sub_2380E2EC8()
{
  return MEMORY[0x270EF0DF8]();
}

uint64_t sub_2380E2ED8()
{
  return MEMORY[0x270EF0EE0]();
}

uint64_t sub_2380E2EE8()
{
  return MEMORY[0x270EF0EF8]();
}

uint64_t sub_2380E2EF8()
{
  return MEMORY[0x270EF0FA0]();
}

uint64_t sub_2380E2F08()
{
  return MEMORY[0x270EF10A8]();
}

uint64_t sub_2380E2F18()
{
  return MEMORY[0x270EF1248]();
}

uint64_t sub_2380E2F28()
{
  return MEMORY[0x270EF1258]();
}

uint64_t sub_2380E2F38()
{
  return MEMORY[0x270EF12E0]();
}

uint64_t sub_2380E2F48()
{
  return MEMORY[0x270EF1388]();
}

uint64_t sub_2380E2F58()
{
  return MEMORY[0x270EF13D8]();
}

uint64_t sub_2380E2F68()
{
  return MEMORY[0x270EF1428]();
}

uint64_t sub_2380E2F78()
{
  return MEMORY[0x270EF1430]();
}

uint64_t sub_2380E2F88()
{
  return MEMORY[0x270EF1440]();
}

uint64_t sub_2380E2F98()
{
  return MEMORY[0x270EF15D0]();
}

uint64_t sub_2380E2FA8()
{
  return MEMORY[0x270EF1608]();
}

uint64_t sub_2380E2FB8()
{
  return MEMORY[0x270FA1168]();
}

uint64_t sub_2380E2FC8()
{
  return MEMORY[0x270F52AF0]();
}

uint64_t sub_2380E2FD8()
{
  return MEMORY[0x270EE0730]();
}

uint64_t sub_2380E2FE8()
{
  return MEMORY[0x270EE0738]();
}

uint64_t sub_2380E2FF8()
{
  return MEMORY[0x270EE0748]();
}

uint64_t sub_2380E3008()
{
  return MEMORY[0x270EE0750]();
}

uint64_t sub_2380E3018()
{
  return MEMORY[0x270EE0758]();
}

uint64_t sub_2380E3028()
{
  return MEMORY[0x270EE0760]();
}

uint64_t sub_2380E3038()
{
  return MEMORY[0x270EE07D0]();
}

uint64_t sub_2380E3048()
{
  return MEMORY[0x270EE07D8]();
}

uint64_t sub_2380E3058()
{
  return MEMORY[0x270EE07F8]();
}

uint64_t sub_2380E3068()
{
  return MEMORY[0x270EE0808]();
}

uint64_t sub_2380E3078()
{
  return MEMORY[0x270EE0810]();
}

uint64_t sub_2380E3088()
{
  return MEMORY[0x270EE0818]();
}

uint64_t sub_2380E3098()
{
  return MEMORY[0x270EE0848]();
}

uint64_t sub_2380E30A8()
{
  return MEMORY[0x270EE0850]();
}

uint64_t sub_2380E30B8()
{
  return MEMORY[0x270EE08A8]();
}

uint64_t sub_2380E30C8()
{
  return MEMORY[0x270EE08B8]();
}

uint64_t sub_2380E30D8()
{
  return MEMORY[0x270F547B0]();
}

uint64_t sub_2380E30E8()
{
  return MEMORY[0x270F547B8]();
}

uint64_t sub_2380E30F8()
{
  return MEMORY[0x270F547C0]();
}

uint64_t sub_2380E3108()
{
  return MEMORY[0x270F547C8]();
}

uint64_t sub_2380E3118()
{
  return MEMORY[0x270F547D8]();
}

uint64_t sub_2380E3128()
{
  return MEMORY[0x270F547E0]();
}

uint64_t sub_2380E3138()
{
  return MEMORY[0x270F547E8]();
}

uint64_t sub_2380E3148()
{
  return MEMORY[0x270F547F0]();
}

uint64_t sub_2380E3158()
{
  return MEMORY[0x270F547F8]();
}

uint64_t sub_2380E3168()
{
  return MEMORY[0x270F54800]();
}

uint64_t sub_2380E3178()
{
  return MEMORY[0x270F54808]();
}

uint64_t sub_2380E3188()
{
  return MEMORY[0x270F54818]();
}

uint64_t sub_2380E3198()
{
  return MEMORY[0x270F54820]();
}

uint64_t sub_2380E31A8()
{
  return MEMORY[0x270F66DA0]();
}

uint64_t sub_2380E31B8()
{
  return MEMORY[0x270F66DB8]();
}

uint64_t sub_2380E31D8()
{
  return MEMORY[0x270F66E28]();
}

uint64_t sub_2380E31E8()
{
  return MEMORY[0x270F66FF0]();
}

uint64_t sub_2380E31F8()
{
  return MEMORY[0x270F67000]();
}

uint64_t sub_2380E3208()
{
  return MEMORY[0x270F67010]();
}

uint64_t sub_2380E3218()
{
  return MEMORY[0x270F67018]();
}

uint64_t sub_2380E3228()
{
  return MEMORY[0x270F67028]();
}

uint64_t sub_2380E3238()
{
  return MEMORY[0x270F67030]();
}

uint64_t sub_2380E3248()
{
  return MEMORY[0x270F67038]();
}

uint64_t sub_2380E3258()
{
  return MEMORY[0x270F67048]();
}

uint64_t sub_2380E3268()
{
  return MEMORY[0x270F67050]();
}

uint64_t sub_2380E3278()
{
  return MEMORY[0x270F67058]();
}

uint64_t sub_2380E3288()
{
  return MEMORY[0x270F67068]();
}

uint64_t sub_2380E3298()
{
  return MEMORY[0x270F670A8]();
}

uint64_t sub_2380E32A8()
{
  return MEMORY[0x270F67180]();
}

uint64_t sub_2380E32B8()
{
  return MEMORY[0x270F67190]();
}

uint64_t sub_2380E32C8()
{
  return MEMORY[0x270F671A8]();
}

uint64_t sub_2380E32D8()
{
  return MEMORY[0x270F671B8]();
}

uint64_t sub_2380E32E8()
{
  return MEMORY[0x270F671C8]();
}

uint64_t sub_2380E32F8()
{
  return MEMORY[0x270F671D0]();
}

uint64_t sub_2380E3308()
{
  return MEMORY[0x270F671D8]();
}

uint64_t sub_2380E3318()
{
  return MEMORY[0x270F67220]();
}

uint64_t sub_2380E3328()
{
  return MEMORY[0x270F67228]();
}

uint64_t sub_2380E3338()
{
  return MEMORY[0x270F67240]();
}

uint64_t sub_2380E3348()
{
  return MEMORY[0x270F67248]();
}

uint64_t sub_2380E3358()
{
  return MEMORY[0x270F67258]();
}

uint64_t sub_2380E3368()
{
  return MEMORY[0x270F672B0]();
}

uint64_t sub_2380E3378()
{
  return MEMORY[0x270F672C8]();
}

uint64_t sub_2380E3388()
{
  return MEMORY[0x270F673A8]();
}

uint64_t sub_2380E3398()
{
  return MEMORY[0x270F67568]();
}

uint64_t sub_2380E33A8()
{
  return MEMORY[0x270F67580]();
}

uint64_t sub_2380E33B8()
{
  return MEMORY[0x270F67588]();
}

uint64_t sub_2380E33C8()
{
  return MEMORY[0x270F67590]();
}

uint64_t sub_2380E33D8()
{
  return MEMORY[0x270F67598]();
}

uint64_t sub_2380E33E8()
{
  return MEMORY[0x270F675A0]();
}

uint64_t sub_2380E33F8()
{
  return MEMORY[0x270F675A8]();
}

uint64_t sub_2380E3408()
{
  return MEMORY[0x270F675B8]();
}

uint64_t sub_2380E3418()
{
  return MEMORY[0x270F675C8]();
}

uint64_t sub_2380E3428()
{
  return MEMORY[0x270F678F8]();
}

uint64_t sub_2380E3438()
{
  return MEMORY[0x270F67930]();
}

uint64_t sub_2380E3448()
{
  return MEMORY[0x270F67938]();
}

uint64_t sub_2380E3458()
{
  return MEMORY[0x270F679D8]();
}

uint64_t sub_2380E3468()
{
  return MEMORY[0x270F679E8]();
}

uint64_t sub_2380E3478()
{
  return MEMORY[0x270F67A90]();
}

uint64_t sub_2380E3488()
{
  return MEMORY[0x270F67AA0]();
}

uint64_t sub_2380E3498()
{
  return MEMORY[0x270F67AA8]();
}

uint64_t sub_2380E34A8()
{
  return MEMORY[0x270F67C28]();
}

uint64_t sub_2380E34B8()
{
  return MEMORY[0x270F67C68]();
}

uint64_t sub_2380E34C8()
{
  return MEMORY[0x270F67DC0]();
}

uint64_t sub_2380E34D8()
{
  return MEMORY[0x270F67DC8]();
}

uint64_t sub_2380E34E8()
{
  return MEMORY[0x270F67DD8]();
}

uint64_t sub_2380E34F8()
{
  return MEMORY[0x270F67DE0]();
}

uint64_t sub_2380E3518()
{
  return MEMORY[0x270F68258]();
}

uint64_t sub_2380E3528()
{
  return MEMORY[0x270F68260]();
}

uint64_t sub_2380E3538()
{
  return MEMORY[0x270F68268]();
}

uint64_t sub_2380E3548()
{
  return MEMORY[0x270F68278]();
}

uint64_t sub_2380E3558()
{
  return MEMORY[0x270F682A0]();
}

uint64_t sub_2380E3568()
{
  return MEMORY[0x270F682B8]();
}

uint64_t sub_2380E3578()
{
  return MEMORY[0x270F68378]();
}

uint64_t sub_2380E3588()
{
  return MEMORY[0x270F68388]();
}

uint64_t sub_2380E3598()
{
  return MEMORY[0x270F710A8]();
}

uint64_t sub_2380E35A8()
{
  return MEMORY[0x270F710B0]();
}

uint64_t sub_2380E35B8()
{
  return MEMORY[0x270F710D8]();
}

uint64_t sub_2380E35C8()
{
  return MEMORY[0x270F710E0]();
}

uint64_t sub_2380E35D8()
{
  return MEMORY[0x270F710F0]();
}

uint64_t sub_2380E35E8()
{
  return MEMORY[0x270F710F8]();
}

uint64_t sub_2380E35F8()
{
  return MEMORY[0x270F71100]();
}

uint64_t sub_2380E3608()
{
  return MEMORY[0x270F71118]();
}

uint64_t sub_2380E3618()
{
  return MEMORY[0x270F71140]();
}

uint64_t sub_2380E3638()
{
  return MEMORY[0x270F71160]();
}

uint64_t sub_2380E3648()
{
  return MEMORY[0x270F71168]();
}

uint64_t sub_2380E3658()
{
  return MEMORY[0x270F71170]();
}

uint64_t sub_2380E3678()
{
  return MEMORY[0x270F71180]();
}

uint64_t sub_2380E3688()
{
  return MEMORY[0x270F71188]();
}

uint64_t sub_2380E3698()
{
  return MEMORY[0x270F71190]();
}

uint64_t sub_2380E36A8()
{
  return MEMORY[0x270F71198]();
}

uint64_t sub_2380E36B8()
{
  return MEMORY[0x270F711A0]();
}

uint64_t sub_2380E36C8()
{
  return MEMORY[0x270F711A8]();
}

uint64_t sub_2380E36D8()
{
  return MEMORY[0x270F711B0]();
}

uint64_t sub_2380E36E8()
{
  return MEMORY[0x270F711B8]();
}

uint64_t sub_2380E36F8()
{
  return MEMORY[0x270F711C0]();
}

uint64_t sub_2380E3708()
{
  return MEMORY[0x270F711C8]();
}

uint64_t sub_2380E3718()
{
  return MEMORY[0x270F711D0]();
}

uint64_t sub_2380E3728()
{
  return MEMORY[0x270F711D8]();
}

uint64_t sub_2380E3738()
{
  return MEMORY[0x270F711E0]();
}

uint64_t sub_2380E3748()
{
  return MEMORY[0x270F711E8]();
}

uint64_t sub_2380E3758()
{
  return MEMORY[0x270F711F8]();
}

uint64_t sub_2380E3768()
{
  return MEMORY[0x270F71200]();
}

uint64_t sub_2380E3778()
{
  return MEMORY[0x270F71208]();
}

uint64_t sub_2380E3788()
{
  return MEMORY[0x270F71210]();
}

uint64_t sub_2380E3798()
{
  return MEMORY[0x270F71220]();
}

uint64_t sub_2380E37A8()
{
  return MEMORY[0x270F71228]();
}

uint64_t sub_2380E37B8()
{
  return MEMORY[0x270F71238]();
}

uint64_t sub_2380E37C8()
{
  return MEMORY[0x270F71248]();
}

uint64_t sub_2380E37D8()
{
  return MEMORY[0x270F71260]();
}

uint64_t sub_2380E37E8()
{
  return MEMORY[0x270F71268]();
}

uint64_t sub_2380E37F8()
{
  return MEMORY[0x270F71270]();
}

uint64_t sub_2380E3808()
{
  return MEMORY[0x270F712B0]();
}

uint64_t sub_2380E3818()
{
  return MEMORY[0x270F712D8]();
}

uint64_t sub_2380E3828()
{
  return MEMORY[0x270F712E8]();
}

uint64_t sub_2380E3838()
{
  return MEMORY[0x270F712F0]();
}

uint64_t sub_2380E3848()
{
  return MEMORY[0x270F712F8]();
}

uint64_t sub_2380E3858()
{
  return MEMORY[0x270F71320]();
}

uint64_t sub_2380E3868()
{
  return MEMORY[0x270F71330]();
}

uint64_t sub_2380E3878()
{
  return MEMORY[0x270F71338]();
}

uint64_t sub_2380E3888()
{
  return MEMORY[0x270F71340]();
}

uint64_t sub_2380E3898()
{
  return MEMORY[0x270F71368]();
}

uint64_t sub_2380E38A8()
{
  return MEMORY[0x270F71370]();
}

uint64_t sub_2380E38B8()
{
  return MEMORY[0x270F71378]();
}

uint64_t sub_2380E38C8()
{
  return MEMORY[0x270F71380]();
}

uint64_t sub_2380E38D8()
{
  return MEMORY[0x270F713A8]();
}

uint64_t sub_2380E38E8()
{
  return MEMORY[0x270F713C0]();
}

uint64_t sub_2380E38F8()
{
  return MEMORY[0x270F713D0]();
}

uint64_t sub_2380E3908()
{
  return MEMORY[0x270F713D8]();
}

uint64_t sub_2380E3918()
{
  return MEMORY[0x270F713E0]();
}

uint64_t sub_2380E3928()
{
  return MEMORY[0x270F713E8]();
}

uint64_t sub_2380E3938()
{
  return MEMORY[0x270F713F0]();
}

uint64_t sub_2380E3948()
{
  return MEMORY[0x270F71430]();
}

uint64_t sub_2380E3958()
{
  return MEMORY[0x270F71438]();
}

uint64_t sub_2380E3968()
{
  return MEMORY[0x270F71440]();
}

uint64_t sub_2380E3978()
{
  return MEMORY[0x270F71448]();
}

uint64_t sub_2380E3988()
{
  return MEMORY[0x270F71450]();
}

uint64_t sub_2380E3998()
{
  return MEMORY[0x270F71468]();
}

uint64_t sub_2380E39A8()
{
  return MEMORY[0x270F71478]();
}

uint64_t sub_2380E39B8()
{
  return MEMORY[0x270F71488]();
}

uint64_t sub_2380E39C8()
{
  return MEMORY[0x270F71490]();
}

uint64_t sub_2380E39D8()
{
  return MEMORY[0x270F714E0]();
}

uint64_t sub_2380E39E8()
{
  return MEMORY[0x270F28690]();
}

uint64_t sub_2380E39F8()
{
  return MEMORY[0x270F6A370]();
}

uint64_t sub_2380E3A08()
{
  return MEMORY[0x270F6A498]();
}

uint64_t sub_2380E3A18()
{
  return MEMORY[0x270F6A4F8]();
}

uint64_t sub_2380E3A28()
{
  return MEMORY[0x270F6A7B0]();
}

uint64_t sub_2380E3A38()
{
  return MEMORY[0x270F6A868]();
}

uint64_t sub_2380E3A48()
{
  return MEMORY[0x270F6AAB0]();
}

uint64_t sub_2380E3A58()
{
  return MEMORY[0x270F6AAC8]();
}

uint64_t sub_2380E3A68()
{
  return MEMORY[0x270F6BB18]();
}

uint64_t sub_2380E3A78()
{
  return MEMORY[0x270F6BB28]();
}

uint64_t sub_2380E3A88()
{
  return MEMORY[0x270F6BB30]();
}

uint64_t sub_2380E3A98()
{
  return MEMORY[0x270F6C060]();
}

uint64_t sub_2380E3AA8()
{
  return MEMORY[0x270F6C068]();
}

uint64_t sub_2380E3AB8()
{
  return MEMORY[0x270F6C810]();
}

uint64_t sub_2380E3AC8()
{
  return MEMORY[0x270F6C9C0]();
}

uint64_t sub_2380E3AD8()
{
  return MEMORY[0x270F6C9C8]();
}

uint64_t sub_2380E3AE8()
{
  return MEMORY[0x270F6C9D0]();
}

uint64_t sub_2380E3AF8()
{
  return MEMORY[0x270F6C9D8]();
}

uint64_t sub_2380E3B08()
{
  return MEMORY[0x270F6C9E0]();
}

uint64_t sub_2380E3B18()
{
  return MEMORY[0x270F6CC98]();
}

uint64_t sub_2380E3B28()
{
  return MEMORY[0x270F6CD70]();
}

uint64_t sub_2380E3B38()
{
  return MEMORY[0x270F6CD80]();
}

uint64_t sub_2380E3B48()
{
  return MEMORY[0x270F6CE60]();
}

uint64_t sub_2380E3B58()
{
  return MEMORY[0x270F6CE68]();
}

uint64_t sub_2380E3B68()
{
  return MEMORY[0x270F6D008]();
}

uint64_t sub_2380E3B78()
{
  return MEMORY[0x270F6D220]();
}

uint64_t sub_2380E3B88()
{
  return MEMORY[0x270F6D530]();
}

uint64_t sub_2380E3B98()
{
  return MEMORY[0x270F6D538]();
}

uint64_t sub_2380E3BA8()
{
  return MEMORY[0x270F6DC30]();
}

uint64_t sub_2380E3BB8()
{
  return MEMORY[0x270F6E268]();
}

uint64_t sub_2380E3BC8()
{
  return MEMORY[0x270F6E280]();
}

uint64_t sub_2380E3BD8()
{
  return MEMORY[0x270F6E288]();
}

uint64_t sub_2380E3BE8()
{
  return MEMORY[0x270F6E290]();
}

uint64_t sub_2380E3BF8()
{
  return MEMORY[0x270F6EA58]();
}

uint64_t sub_2380E3C08()
{
  return MEMORY[0x270F6EA60]();
}

uint64_t sub_2380E3C18()
{
  return MEMORY[0x270F6EA68]();
}

uint64_t sub_2380E3C28()
{
  return MEMORY[0x270F6F280]();
}

uint64_t sub_2380E3C38()
{
  return MEMORY[0x270F6F408]();
}

uint64_t sub_2380E3C48()
{
  return MEMORY[0x270F6F4C0]();
}

uint64_t sub_2380E3C58()
{
  return MEMORY[0x270F70B20]();
}

uint64_t sub_2380E3C68()
{
  return MEMORY[0x270F70B38]();
}

uint64_t sub_2380E3C78()
{
  return MEMORY[0x270F70B50]();
}

uint64_t sub_2380E3C88()
{
  return MEMORY[0x270F70B58]();
}

uint64_t sub_2380E3C98()
{
  return MEMORY[0x270F70BE0]();
}

uint64_t sub_2380E3CA8()
{
  return MEMORY[0x270F70BE8]();
}

uint64_t sub_2380E3CB8()
{
  return MEMORY[0x270F70BF0]();
}

uint64_t sub_2380E3CC8()
{
  return MEMORY[0x270F70BF8]();
}

uint64_t sub_2380E3CD8()
{
  return MEMORY[0x270F70C00]();
}

uint64_t sub_2380E3CE8()
{
  return MEMORY[0x270F70C10]();
}

uint64_t sub_2380E3CF8()
{
  return MEMORY[0x270F70C18]();
}

uint64_t sub_2380E3D08()
{
  return MEMORY[0x270F70C20]();
}

uint64_t sub_2380E3D18()
{
  return MEMORY[0x270F70C28]();
}

uint64_t sub_2380E3D28()
{
  return MEMORY[0x270F70C30]();
}

uint64_t sub_2380E3D38()
{
  return MEMORY[0x270F70C40]();
}

uint64_t sub_2380E3D48()
{
  return MEMORY[0x270F70C48]();
}

uint64_t sub_2380E3D58()
{
  return MEMORY[0x270F70C50]();
}

uint64_t sub_2380E3D68()
{
  return MEMORY[0x270F70C78]();
}

uint64_t sub_2380E3D78()
{
  return MEMORY[0x270F70C88]();
}

uint64_t sub_2380E3D88()
{
  return MEMORY[0x270F70C90]();
}

uint64_t sub_2380E3D98()
{
  return MEMORY[0x270F70CB8]();
}

uint64_t sub_2380E3DA8()
{
  return MEMORY[0x270F70CE8]();
}

uint64_t sub_2380E3DB8()
{
  return MEMORY[0x270F70CF0]();
}

uint64_t sub_2380E3DC8()
{
  return MEMORY[0x270F70CF8]();
}

uint64_t sub_2380E3DD8()
{
  return MEMORY[0x270F70D10]();
}

uint64_t sub_2380E3DE8()
{
  return MEMORY[0x270F70DD0]();
}

uint64_t sub_2380E3DF8()
{
  return MEMORY[0x270F728E8]();
}

uint64_t sub_2380E3E08()
{
  return MEMORY[0x270F683D8]();
}

uint64_t sub_2380E3E18()
{
  return MEMORY[0x270F683F0]();
}

uint64_t sub_2380E3E28()
{
  return MEMORY[0x270F652C0]();
}

uint64_t sub_2380E3E38()
{
  return MEMORY[0x270F728F0]();
}

uint64_t sub_2380E3E48()
{
  return MEMORY[0x270F728F8]();
}

uint64_t sub_2380E3E58()
{
  return MEMORY[0x270F72908]();
}

uint64_t sub_2380E3E68()
{
  return MEMORY[0x270F72910]();
}

uint64_t sub_2380E3E78()
{
  return MEMORY[0x270F72918]();
}

uint64_t sub_2380E3E88()
{
  return MEMORY[0x270F72A40]();
}

uint64_t sub_2380E3E98()
{
  return MEMORY[0x270F72A48]();
}

uint64_t sub_2380E3EA8()
{
  return MEMORY[0x270F72A58]();
}

uint64_t sub_2380E3EB8()
{
  return MEMORY[0x270F72A68]();
}

uint64_t sub_2380E3EC8()
{
  return MEMORY[0x270F72A70]();
}

uint64_t sub_2380E3ED8()
{
  return MEMORY[0x270F72A80]();
}

uint64_t sub_2380E3EE8()
{
  return MEMORY[0x270F72A90]();
}

uint64_t sub_2380E3EF8()
{
  return MEMORY[0x270F72AC0]();
}

uint64_t sub_2380E3F08()
{
  return MEMORY[0x270F72AD8]();
}

uint64_t sub_2380E3F18()
{
  return MEMORY[0x270F72B28]();
}

uint64_t sub_2380E3F28()
{
  return MEMORY[0x270F72B30]();
}

uint64_t sub_2380E3F38()
{
  return MEMORY[0x270F72B38]();
}

uint64_t sub_2380E3F48()
{
  return MEMORY[0x270F72BD0]();
}

uint64_t sub_2380E3F58()
{
  return MEMORY[0x270F72BE0]();
}

uint64_t sub_2380E3F68()
{
  return MEMORY[0x270F72C28]();
}

uint64_t sub_2380E3F78()
{
  return MEMORY[0x270F72C30]();
}

uint64_t sub_2380E3F88()
{
  return MEMORY[0x270F72C38]();
}

uint64_t sub_2380E3F98()
{
  return MEMORY[0x270FA06B8]();
}

uint64_t sub_2380E3FA8()
{
  return MEMORY[0x270FA06C8]();
}

uint64_t sub_2380E3FB8()
{
  return MEMORY[0x270FA06D8]();
}

uint64_t sub_2380E3FC8()
{
  return MEMORY[0x270F4CA20]();
}

uint64_t sub_2380E3FD8()
{
  return MEMORY[0x270F4CA38]();
}

uint64_t sub_2380E3FE8()
{
  return MEMORY[0x270F4CA40]();
}

uint64_t sub_2380E3FF8()
{
  return MEMORY[0x270F63AE8]();
}

uint64_t sub_2380E4008()
{
  return MEMORY[0x270FA2A68]();
}

uint64_t sub_2380E4018()
{
  return MEMORY[0x270FA2A70]();
}

uint64_t sub_2380E4028()
{
  return MEMORY[0x270FA2AA0]();
}

uint64_t sub_2380E4038()
{
  return MEMORY[0x270F0C7F8]();
}

uint64_t sub_2380E4048()
{
  return MEMORY[0x270F0C808]();
}

uint64_t sub_2380E4058()
{
  return MEMORY[0x270F0C818]();
}

uint64_t sub_2380E4068()
{
  return MEMORY[0x270F0C820]();
}

uint64_t sub_2380E4078()
{
  return MEMORY[0x270F0C830]();
}

uint64_t sub_2380E4088()
{
  return MEMORY[0x270F0C840]();
}

uint64_t sub_2380E4098()
{
  return MEMORY[0x270F0C858]();
}

uint64_t sub_2380E40A8()
{
  return MEMORY[0x270F0C868]();
}

uint64_t sub_2380E40B8()
{
  return MEMORY[0x270F0C870]();
}

uint64_t sub_2380E40C8()
{
  return MEMORY[0x270F0C888]();
}

uint64_t sub_2380E40D8()
{
  return MEMORY[0x270F0C898]();
}

uint64_t sub_2380E40E8()
{
  return MEMORY[0x270F0C8A8]();
}

uint64_t _s16SiriAudioSupport20PodcastChannelEntityCfd_0()
{
  return MEMORY[0x270F0C8B0]();
}

uint64_t sub_2380E4108()
{
  return MEMORY[0x270F0C8C0]();
}

uint64_t sub_2380E4168()
{
  return MEMORY[0x270F0C9F8]();
}

uint64_t sub_2380E4178()
{
  return MEMORY[0x270F0CA08]();
}

uint64_t sub_2380E4188()
{
  return MEMORY[0x270F0CA10]();
}

uint64_t sub_2380E4198()
{
  return MEMORY[0x270F0CA30]();
}

uint64_t sub_2380E41A8()
{
  return MEMORY[0x270F0CA40]();
}

uint64_t sub_2380E41B8()
{
  return MEMORY[0x270F0CA50]();
}

uint64_t sub_2380E41C8()
{
  return MEMORY[0x270F0CA58]();
}

uint64_t sub_2380E41D8()
{
  return MEMORY[0x270F0CA70]();
}

uint64_t sub_2380E41E8()
{
  return MEMORY[0x270F0CB10]();
}

uint64_t sub_2380E41F8()
{
  return MEMORY[0x270F0CB48]();
}

uint64_t sub_2380E4228()
{
  return MEMORY[0x270F652C8]();
}

uint64_t sub_2380E4238()
{
  return MEMORY[0x270F65300]();
}

uint64_t sub_2380E4248()
{
  return MEMORY[0x270F65318]();
}

uint64_t sub_2380E4258()
{
  return MEMORY[0x270F65378]();
}

uint64_t sub_2380E4268()
{
  return MEMORY[0x270F65380]();
}

uint64_t sub_2380E4278()
{
  return MEMORY[0x270F65388]();
}

uint64_t sub_2380E4288()
{
  return MEMORY[0x270F65390]();
}

uint64_t sub_2380E4298()
{
  return MEMORY[0x270F65398]();
}

uint64_t sub_2380E42A8()
{
  return MEMORY[0x270F653A0]();
}

uint64_t sub_2380E42B8()
{
  return MEMORY[0x270F653A8]();
}

uint64_t sub_2380E42C8()
{
  return MEMORY[0x270F653C8]();
}

uint64_t sub_2380E42D8()
{
  return MEMORY[0x270F653D8]();
}

uint64_t sub_2380E42E8()
{
  return MEMORY[0x270F653E0]();
}

uint64_t sub_2380E42F8()
{
  return MEMORY[0x270F653E8]();
}

uint64_t sub_2380E4308()
{
  return MEMORY[0x270F653F0]();
}

uint64_t sub_2380E4318()
{
  return MEMORY[0x270F653F8]();
}

uint64_t sub_2380E4328()
{
  return MEMORY[0x270F65400]();
}

uint64_t sub_2380E4338()
{
  return MEMORY[0x270F63C08]();
}

uint64_t sub_2380E4348()
{
  return MEMORY[0x270F63C10]();
}

uint64_t sub_2380E4358()
{
  return MEMORY[0x270F63C18]();
}

uint64_t sub_2380E4368()
{
  return MEMORY[0x270F63C20]();
}

uint64_t sub_2380E4378()
{
  return MEMORY[0x270F63C28]();
}

uint64_t sub_2380E4388()
{
  return MEMORY[0x270F63C30]();
}

uint64_t sub_2380E4398()
{
  return MEMORY[0x270F66050]();
}

uint64_t sub_2380E43A8()
{
  return MEMORY[0x270F66068]();
}

uint64_t sub_2380E43B8()
{
  return MEMORY[0x270F660A0]();
}

uint64_t sub_2380E43C8()
{
  return MEMORY[0x270F660D0]();
}

uint64_t sub_2380E43D8()
{
  return MEMORY[0x270FA1938]();
}

uint64_t sub_2380E43E8()
{
  return MEMORY[0x270F70710]();
}

uint64_t sub_2380E43F8()
{
  return MEMORY[0x270F6FAD8]();
}

uint64_t sub_2380E4408()
{
  return MEMORY[0x270F6FAF0]();
}

uint64_t sub_2380E4418()
{
  return MEMORY[0x270F6FDE0]();
}

uint64_t sub_2380E4428()
{
  return MEMORY[0x270F6FDE8]();
}

uint64_t sub_2380E4438()
{
  return MEMORY[0x270F6FDF0]();
}

uint64_t sub_2380E4448()
{
  return MEMORY[0x270F6FDF8]();
}

uint64_t sub_2380E4458()
{
  return MEMORY[0x270F6FE00]();
}

uint64_t sub_2380E4468()
{
  return MEMORY[0x270F6FE08]();
}

uint64_t sub_2380E4478()
{
  return MEMORY[0x270F6FE10]();
}

uint64_t sub_2380E4488()
{
  return MEMORY[0x270F6FE18]();
}

uint64_t sub_2380E4498()
{
  return MEMORY[0x270F6FE20]();
}

uint64_t sub_2380E44A8()
{
  return MEMORY[0x270F08550]();
}

uint64_t sub_2380E44B8()
{
  return MEMORY[0x270FA2C90]();
}

uint64_t sub_2380E44C8()
{
  return MEMORY[0x270FA2C98]();
}

uint64_t sub_2380E44D8()
{
  return MEMORY[0x270FA2CC0]();
}

uint64_t sub_2380E44E8()
{
  return MEMORY[0x270FA2CF8]();
}

uint64_t sub_2380E44F8()
{
  return MEMORY[0x270FA2D00]();
}

uint64_t sub_2380E4508()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_2380E4518()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_2380E4528()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_2380E4538()
{
  return MEMORY[0x270FA2E30]();
}

uint64_t sub_2380E4548()
{
  return MEMORY[0x270F70748]();
}

uint64_t sub_2380E4558()
{
  return MEMORY[0x270F70750]();
}

uint64_t sub_2380E4568()
{
  return MEMORY[0x270F70760]();
}

uint64_t sub_2380E4578()
{
  return MEMORY[0x270F70768]();
}

uint64_t sub_2380E4588()
{
  return MEMORY[0x270F707C0]();
}

uint64_t sub_2380E4598()
{
  return MEMORY[0x270F707E0]();
}

uint64_t sub_2380E45A8()
{
  return MEMORY[0x270F709C0]();
}

uint64_t sub_2380E45B8()
{
  return MEMORY[0x270F70A30]();
}

uint64_t sub_2380E45C8()
{
  return MEMORY[0x270F70A58]();
}

uint64_t sub_2380E45D8()
{
  return MEMORY[0x270F70A78]();
}

uint64_t sub_2380E45E8()
{
  return MEMORY[0x270F70A80]();
}

uint64_t sub_2380E45F8()
{
  return MEMORY[0x270F70AA0]();
}

uint64_t sub_2380E4608()
{
  return MEMORY[0x270F70AA8]();
}

uint64_t sub_2380E4618()
{
  return MEMORY[0x270F70AB0]();
}

uint64_t sub_2380E4628()
{
  return MEMORY[0x270F70AD0]();
}

uint64_t sub_2380E4638()
{
  return MEMORY[0x270EE3BA8]();
}

uint64_t sub_2380E4648()
{
  return MEMORY[0x270EE3D40]();
}

uint64_t sub_2380E4658()
{
  return MEMORY[0x270EE3E98]();
}

uint64_t sub_2380E4668()
{
  return MEMORY[0x270EE3EA0]();
}

uint64_t sub_2380E4678()
{
  return MEMORY[0x270FA1038]();
}

uint64_t sub_2380E4688()
{
  return MEMORY[0x270FA0970]();
}

uint64_t sub_2380E4698()
{
  return MEMORY[0x270FA0988]();
}

uint64_t sub_2380E46A8()
{
  return MEMORY[0x270FA09A8]();
}

uint64_t sub_2380E46B8()
{
  return MEMORY[0x270FA09C0]();
}

uint64_t sub_2380E46C8()
{
  return MEMORY[0x270FA09D0]();
}

uint64_t sub_2380E46D8()
{
  return MEMORY[0x270FA09E8]();
}

uint64_t sub_2380E46E8()
{
  return MEMORY[0x270FA0A10]();
}

uint64_t sub_2380E46F8()
{
  return MEMORY[0x270FA0A18]();
}

uint64_t sub_2380E4708()
{
  return MEMORY[0x270FA0A28]();
}

uint64_t sub_2380E4718()
{
  return MEMORY[0x270FA0A40]();
}

uint64_t sub_2380E4728()
{
  return MEMORY[0x270FA0A48]();
}

uint64_t sub_2380E4738()
{
  return MEMORY[0x270FA0AC0]();
}

uint64_t sub_2380E4748()
{
  return MEMORY[0x270FA0AD0]();
}

uint64_t sub_2380E4758()
{
  return MEMORY[0x270FA0B00]();
}

uint64_t sub_2380E4768()
{
  return MEMORY[0x270FA0B60]();
}

uint64_t sub_2380E4778()
{
  return MEMORY[0x270FA0B70]();
}

uint64_t sub_2380E4788()
{
  return MEMORY[0x270FA0B98]();
}

uint64_t sub_2380E4798()
{
  return MEMORY[0x270FA0BB0]();
}

uint64_t sub_2380E47A8()
{
  return MEMORY[0x270FA0BC8]();
}

uint64_t sub_2380E47B8()
{
  return MEMORY[0x270EF6920]();
}

uint64_t sub_2380E47C8()
{
  return MEMORY[0x270EEAA78]();
}

uint64_t sub_2380E47D8()
{
  return MEMORY[0x270EEAA80]();
}

uint64_t sub_2380E47E8()
{
  return MEMORY[0x270EEAA98]();
}

uint64_t sub_2380E47F8()
{
  return MEMORY[0x270EEAAA8]();
}

uint64_t sub_2380E4808()
{
  return MEMORY[0x270EEB090]();
}

uint64_t sub_2380E4818()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_2380E4828()
{
  return MEMORY[0x270EF1840]();
}

uint64_t sub_2380E4838()
{
  return MEMORY[0x270F9D060]();
}

uint64_t sub_2380E4848()
{
  return MEMORY[0x270F9D068]();
}

uint64_t sub_2380E4858()
{
  return MEMORY[0x270F9D088]();
}

uint64_t sub_2380E4868()
{
  return MEMORY[0x270F9D0A8]();
}

uint64_t sub_2380E4878()
{
  return MEMORY[0x270F9D138]();
}

uint64_t sub_2380E4888()
{
  return MEMORY[0x270F9D1C8]();
}

uint64_t sub_2380E4898()
{
  return MEMORY[0x270F9D1D0]();
}

uint64_t sub_2380E48A8()
{
  return MEMORY[0x270F9D208]();
}

uint64_t sub_2380E48B8()
{
  return MEMORY[0x270F9D210]();
}

uint64_t sub_2380E48C8()
{
  return MEMORY[0x270F9D318]();
}

uint64_t sub_2380E48D8()
{
  return MEMORY[0x270F9D320]();
}

uint64_t sub_2380E48E8()
{
  return MEMORY[0x270FA2B70]();
}

uint64_t sub_2380E48F8()
{
  return MEMORY[0x270F9D478]();
}

uint64_t sub_2380E4908()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_2380E4918()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_2380E4928()
{
  return MEMORY[0x270EF19E0]();
}

uint64_t sub_2380E4938()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_2380E4948()
{
  return MEMORY[0x270EF1A10]();
}

uint64_t sub_2380E4958()
{
  return MEMORY[0x270EF1A50]();
}

uint64_t sub_2380E4968()
{
  return MEMORY[0x270EF1AA8]();
}

uint64_t sub_2380E4978()
{
  return MEMORY[0x270EF1AD0]();
}

uint64_t sub_2380E4988()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_2380E4998()
{
  return MEMORY[0x270F9D5F8]();
}

uint64_t sub_2380E49A8()
{
  return MEMORY[0x270F9D610]();
}

uint64_t sub_2380E49B8()
{
  return MEMORY[0x270F9D620]();
}

uint64_t sub_2380E49C8()
{
  return MEMORY[0x270F9D648]();
}

uint64_t sub_2380E49D8()
{
  return MEMORY[0x270F9D6B8]();
}

uint64_t sub_2380E49E8()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_2380E49F8()
{
  return MEMORY[0x270F9D740]();
}

uint64_t sub_2380E4A08()
{
  return MEMORY[0x270F9D758]();
}

uint64_t sub_2380E4A18()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_2380E4A28()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_2380E4A38()
{
  return MEMORY[0x270F9D7E8]();
}

uint64_t sub_2380E4A48()
{
  return MEMORY[0x270F9D800]();
}

uint64_t sub_2380E4A68()
{
  return MEMORY[0x270F9D810]();
}

uint64_t sub_2380E4A78()
{
  return MEMORY[0x270F9D860]();
}

uint64_t sub_2380E4A88()
{
  return MEMORY[0x270F9D878]();
}

uint64_t sub_2380E4A98()
{
  return MEMORY[0x270F9D8E0]();
}

uint64_t sub_2380E4AA8()
{
  return MEMORY[0x270F9D8F0]();
}

uint64_t sub_2380E4AB8()
{
  return MEMORY[0x270F9D8F8]();
}

uint64_t sub_2380E4AC8()
{
  return MEMORY[0x270F9D938]();
}

uint64_t sub_2380E4AD8()
{
  return MEMORY[0x270F9D9D8]();
}

uint64_t sub_2380E4AE8()
{
  return MEMORY[0x270F9DA70]();
}

uint64_t sub_2380E4AF8()
{
  return MEMORY[0x270F9DBA0]();
}

uint64_t sub_2380E4B08()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_2380E4B18()
{
  return MEMORY[0x270EF1BA8]();
}

uint64_t sub_2380E4B28()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_2380E4B38()
{
  return MEMORY[0x270F9DBB0]();
}

uint64_t sub_2380E4B48()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_2380E4B58()
{
  return MEMORY[0x270F9DBF0]();
}

uint64_t sub_2380E4B68()
{
  return MEMORY[0x270F9DC08]();
}

uint64_t sub_2380E4B78()
{
  return MEMORY[0x270F9DC10]();
}

uint64_t sub_2380E4B88()
{
  return MEMORY[0x270F9DC20]();
}

uint64_t sub_2380E4B98()
{
  return MEMORY[0x270F9DC50]();
}

uint64_t sub_2380E4BA8()
{
  return MEMORY[0x270F9DC60]();
}

uint64_t sub_2380E4BB8()
{
  return MEMORY[0x270F9DCD8]();
}

uint64_t sub_2380E4BC8()
{
  return MEMORY[0x270EF1BD8]();
}

uint64_t sub_2380E4BD8()
{
  return MEMORY[0x270EF1BE8]();
}

uint64_t sub_2380E4BE8()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_2380E4BF8()
{
  return MEMORY[0x270FA1E20]();
}

uint64_t sub_2380E4C18()
{
  return MEMORY[0x270FA1EF8]();
}

uint64_t sub_2380E4C28()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_2380E4C38()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_2380E4C48()
{
  return MEMORY[0x270EF1C18]();
}

uint64_t sub_2380E4C58()
{
  return MEMORY[0x270EF1C20]();
}

uint64_t sub_2380E4C68()
{
  return MEMORY[0x270EF1C98]();
}

uint64_t sub_2380E4C78()
{
  return MEMORY[0x270EF1CC0]();
}

uint64_t sub_2380E4C88()
{
  return MEMORY[0x270F9DEB0]();
}

uint64_t sub_2380E4C98()
{
  return MEMORY[0x270F9DEF0]();
}

uint64_t sub_2380E4CA8()
{
  return MEMORY[0x270F9DF80]();
}

uint64_t sub_2380E4CB8()
{
  return MEMORY[0x270EF1CE0]();
}

uint64_t sub_2380E4CC8()
{
  return MEMORY[0x270EF1CF8]();
}

uint64_t sub_2380E4CD8()
{
  return MEMORY[0x270F9E080]();
}

uint64_t sub_2380E4CE8()
{
  return MEMORY[0x270F9E0A0]();
}

uint64_t sub_2380E4CF8()
{
  return MEMORY[0x270F9E0E0]();
}

uint64_t sub_2380E4D08()
{
  return MEMORY[0x270F9E1E0]();
}

uint64_t sub_2380E4D18()
{
  return MEMORY[0x270FA1060]();
}

uint64_t sub_2380E4D28()
{
  return MEMORY[0x270FA2E40]();
}

uint64_t sub_2380E4D38()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_2380E4D48()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_2380E4D58()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_2380E4D68()
{
  return MEMORY[0x270FA1068]();
}

uint64_t sub_2380E4D78()
{
  return MEMORY[0x270FA1070]();
}

uint64_t sub_2380E4D88()
{
  return MEMORY[0x270EF1F60]();
}

uint64_t sub_2380E4D98()
{
  return MEMORY[0x270EF1F70]();
}

uint64_t sub_2380E4DA8()
{
  return MEMORY[0x270FA0C08]();
}

uint64_t sub_2380E4DB8()
{
  return MEMORY[0x270FA0C10]();
}

uint64_t sub_2380E4DC8()
{
  return MEMORY[0x270FA0C20]();
}

uint64_t sub_2380E4DD8()
{
  return MEMORY[0x270FA0C38]();
}

uint64_t sub_2380E4DE8()
{
  return MEMORY[0x270FA0C48]();
}

uint64_t sub_2380E4DF8()
{
  return MEMORY[0x270FA0C50]();
}

uint64_t sub_2380E4E08()
{
  return MEMORY[0x270FA0C78]();
}

uint64_t sub_2380E4E18()
{
  return MEMORY[0x270FA0C90]();
}

uint64_t sub_2380E4E28()
{
  return MEMORY[0x270FA0D50]();
}

uint64_t sub_2380E4E38()
{
  return MEMORY[0x270FA0D70]();
}

uint64_t sub_2380E4E48()
{
  return MEMORY[0x270FA0D88]();
}

uint64_t sub_2380E4E58()
{
  return MEMORY[0x270FA0DA0]();
}

uint64_t sub_2380E4E68()
{
  return MEMORY[0x270FA0DB8]();
}

uint64_t sub_2380E4E78()
{
  return MEMORY[0x270FA0DD0]();
}

uint64_t sub_2380E4E88()
{
  return MEMORY[0x270FA1078]();
}

uint64_t sub_2380E4E98()
{
  return MEMORY[0x270FA1080]();
}

uint64_t sub_2380E4EA8()
{
  return MEMORY[0x270FA2E90]();
}

uint64_t sub_2380E4EB8()
{
  return MEMORY[0x270FA2EA8]();
}

uint64_t sub_2380E4EC8()
{
  return MEMORY[0x270FA2EB8]();
}

uint64_t sub_2380E4ED8()
{
  return MEMORY[0x270FA0F00]();
}

uint64_t sub_2380E4EE8()
{
  return MEMORY[0x270FA0F10]();
}

uint64_t sub_2380E4EF8()
{
  return MEMORY[0x270FA0F28]();
}

uint64_t sub_2380E4F08()
{
  return MEMORY[0x270F66290]();
}

uint64_t sub_2380E4F18()
{
  return MEMORY[0x270F66298]();
}

uint64_t sub_2380E4F28()
{
  return MEMORY[0x270F662C8]();
}

uint64_t sub_2380E4F38()
{
  return MEMORY[0x270EF20F8]();
}

uint64_t sub_2380E4F48()
{
  return MEMORY[0x270EF2100]();
}

uint64_t sub_2380E4F58()
{
  return MEMORY[0x270EF2180]();
}

uint64_t sub_2380E4F68()
{
  return MEMORY[0x270EF2198]();
}

uint64_t sub_2380E4F78()
{
  return MEMORY[0x270FA1170]();
}

uint64_t sub_2380E4F88()
{
  return MEMORY[0x270FA1180]();
}

uint64_t sub_2380E4F98()
{
  return MEMORY[0x270FA2F00]();
}

uint64_t sub_2380E4FA8()
{
  return MEMORY[0x270F9E3B0]();
}

uint64_t sub_2380E4FB8()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_2380E4FC8()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_2380E4FD8()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_2380E4FE8()
{
  return MEMORY[0x270EF23E8]();
}

uint64_t sub_2380E4FF8()
{
  return MEMORY[0x270EF2410]();
}

uint64_t sub_2380E5008()
{
  return MEMORY[0x270EF2478]();
}

uint64_t sub_2380E5018()
{
  return MEMORY[0x270EF24A0]();
}

uint64_t sub_2380E5028()
{
  return MEMORY[0x270EF2528]();
}

uint64_t sub_2380E5038()
{
  return MEMORY[0x270EF25B0]();
}

uint64_t sub_2380E5048()
{
  return MEMORY[0x270FA13A0]();
}

uint64_t sub_2380E5058()
{
  return MEMORY[0x270F9E658]();
}

uint64_t sub_2380E5068()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_2380E5078()
{
  return MEMORY[0x270F9E730]();
}

uint64_t sub_2380E5088()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_2380E5098()
{
  return MEMORY[0x270F9E7F0]();
}

uint64_t sub_2380E50A8()
{
  return MEMORY[0x270F9E800]();
}

uint64_t sub_2380E50B8()
{
  return MEMORY[0x270F9E818]();
}

uint64_t sub_2380E50C8()
{
  return MEMORY[0x270F9E848]();
}

uint64_t sub_2380E50D8()
{
  return MEMORY[0x270F9E858]();
}

uint64_t sub_2380E50E8()
{
  return MEMORY[0x270F9E870]();
}

uint64_t sub_2380E50F8()
{
  return MEMORY[0x270F9E8C0]();
}

uint64_t sub_2380E5108()
{
  return MEMORY[0x270F9E8C8]();
}

uint64_t sub_2380E5118()
{
  return MEMORY[0x270F9E8E8]();
}

uint64_t sub_2380E5128()
{
  return MEMORY[0x270F9E958]();
}

uint64_t sub_2380E5138()
{
  return MEMORY[0x270F9E960]();
}

uint64_t sub_2380E5148()
{
  return MEMORY[0x270F9E968]();
}

uint64_t sub_2380E5158()
{
  return MEMORY[0x270F9E970]();
}

uint64_t sub_2380E5168()
{
  return MEMORY[0x270F9E988]();
}

uint64_t sub_2380E5178()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_2380E5188()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_2380E5198()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_2380E51A8()
{
  return MEMORY[0x270F9EA48]();
}

uint64_t sub_2380E51B8()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_2380E51D8()
{
  return MEMORY[0x270F9EB98]();
}

uint64_t sub_2380E51E8()
{
  return MEMORY[0x270F9EBC0]();
}

uint64_t sub_2380E51F8()
{
  return MEMORY[0x270F9EBD8]();
}

uint64_t sub_2380E5208()
{
  return MEMORY[0x270F9EBE0]();
}

uint64_t sub_2380E5218()
{
  return MEMORY[0x270F9EC08]();
}

uint64_t sub_2380E5228()
{
  return MEMORY[0x270F9EC10]();
}

uint64_t sub_2380E5238()
{
  return MEMORY[0x270F9EC48]();
}

uint64_t sub_2380E5248()
{
  return MEMORY[0x270F9EC88]();
}

uint64_t sub_2380E5258()
{
  return MEMORY[0x270F9EC90]();
}

uint64_t sub_2380E5268()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t sub_2380E5278()
{
  return MEMORY[0x270F9EF50]();
}

uint64_t sub_2380E5288()
{
  return MEMORY[0x270F9EFB0]();
}

uint64_t sub_2380E5298()
{
  return MEMORY[0x270F9EFC0]();
}

uint64_t sub_2380E52A8()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_2380E52B8()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_2380E52C8()
{
  return MEMORY[0x270F9F000]();
}

uint64_t sub_2380E52D8()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_2380E52E8()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_2380E52F8()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_2380E5308()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_2380E5318()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_2380E5328()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_2380E5338()
{
  return MEMORY[0x270F9F2E8]();
}

uint64_t sub_2380E5348()
{
  return MEMORY[0x270F9F2F8]();
}

uint64_t sub_2380E5358()
{
  return MEMORY[0x270F9F318]();
}

uint64_t sub_2380E5368()
{
  return MEMORY[0x270F9F428]();
}

uint64_t sub_2380E5378()
{
  return MEMORY[0x270F9F438]();
}

uint64_t sub_2380E5388()
{
  return MEMORY[0x270F9F458]();
}

uint64_t sub_2380E5398()
{
  return MEMORY[0x270F9F4C8]();
}

uint64_t sub_2380E53A8()
{
  return MEMORY[0x270F9F4D0]();
}

uint64_t sub_2380E53B8()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_2380E53D8()
{
  return MEMORY[0x270F9F730]();
}

uint64_t sub_2380E53E8()
{
  return MEMORY[0x270F9F788]();
}

uint64_t sub_2380E53F8()
{
  return MEMORY[0x270F9F7C0]();
}

uint64_t sub_2380E5408()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_2380E5418()
{
  return MEMORY[0x270F9F918]();
}

uint64_t sub_2380E5428()
{
  return MEMORY[0x270F9FA40]();
}

uint64_t sub_2380E5438()
{
  return MEMORY[0x270F9FA88]();
}

uint64_t sub_2380E5448()
{
  return MEMORY[0x270F9FB10]();
}

uint64_t sub_2380E5458()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_2380E5468()
{
  return MEMORY[0x270EF2680]();
}

uint64_t sub_2380E5478()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_2380E5488()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_2380E5498()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_2380E54A8()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_2380E54B8()
{
  return MEMORY[0x270EF26A8]();
}

uint64_t sub_2380E54C8()
{
  return MEMORY[0x270EF26E0]();
}

uint64_t sub_2380E54D8()
{
  return MEMORY[0x270F9FC40]();
}

uint64_t sub_2380E54E8()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_2380E54F8()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_2380E5508()
{
  return MEMORY[0x270F9FC68]();
}

uint64_t sub_2380E5518()
{
  return MEMORY[0x270F9FC78]();
}

uint64_t sub_2380E5528()
{
  return MEMORY[0x270F9FC80]();
}

uint64_t sub_2380E5538()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_2380E5558()
{
  return MEMORY[0x270F9FCF8]();
}

uint64_t sub_2380E5568()
{
  return MEMORY[0x270EF2760]();
}

uint64_t sub_2380E5578()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_2380E5588()
{
  return MEMORY[0x270F9FD98]();
}

uint64_t sub_2380E5598()
{
  return MEMORY[0x270FA0080]();
}

uint64_t sub_2380E55C8()
{
  return MEMORY[0x270FA00C0]();
}

uint64_t sub_2380E55D8()
{
  return MEMORY[0x270FA0128]();
}

uint64_t AFIsInternalInstall()
{
  return MEMORY[0x270F0EDD0]();
}

uint64_t AMSError()
{
  return MEMORY[0x270F0E690]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x270F18A48]();
}

uint64_t BiomeLibrary()
{
  return MEMORY[0x270F10AF0]();
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x270EE4320](theArray);
}

CFStringRef CFCopyDescription(CFTypeRef cf)
{
  return (CFStringRef)MEMORY[0x270EE4788](cf);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x270EE4B88]();
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x270EE4C90](applicationID);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x270EE4CA0](key, applicationID);
}

uint64_t INExtractAppInfoFromSiriLaunchId()
{
  return MEMORY[0x270EF51B8]();
}

uint64_t INMediaItemTypeGetName()
{
  return MEMORY[0x270EF5268]();
}

uint64_t INSupportedMediaCategories()
{
  return MEMORY[0x270EF52A8]();
}

uint64_t MGGetSInt32Answer()
{
  return MEMORY[0x270F95FE8]();
}

uint64_t MGGetStringAnswer()
{
  return MEMORY[0x270F95FF8]();
}

uint64_t MGRegisterForUpdates()
{
  return MEMORY[0x270F96030]();
}

uint64_t MPCAssistantErrorIsInformational()
{
  return MEMORY[0x270F49BA0]();
}

uint64_t MRAVEndpointCopyUniqueIdentifier()
{
  return MEMORY[0x270F49BC0]();
}

uint64_t MRAVEndpointGetLocalEndpoint()
{
  return MEMORY[0x270F49BE0]();
}

uint64_t MRAVEndpointGetMyGroupLeaderWithTimeout()
{
  return MEMORY[0x270F49BE8]();
}

uint64_t MRAVOutputContextGetSharedAudioPresentationContext()
{
  return MEMORY[0x270F49C60]();
}

uint64_t MRAVReconnaissanceSessionBeginSearch()
{
  return MEMORY[0x270F49CE0]();
}

uint64_t MRAVReconnaissanceSessionSetTargetAudioSessionID()
{
  return MEMORY[0x270F49D18]();
}

uint64_t MRMediaRemoteCommandInfoCopyValueForKey()
{
  return MEMORY[0x270F49E98]();
}

uint64_t MRMediaRemoteCommandInfoEnumerateSupportedCommandsWithHandler()
{
  return MEMORY[0x270F49EA8]();
}

uint64_t MRMediaRemoteCommandInfoGetEnabled()
{
  return MEMORY[0x270F49EB8]();
}

uint64_t MRMediaRemoteGetLocalReceiverPairingIdentity()
{
  return MEMORY[0x270F49F70]();
}

uint64_t MRMediaRemoteGetNowPlayingApplicationPlaybackState()
{
  return MEMORY[0x270F49F88]();
}

uint64_t MRMediaRemoteGetNowPlayingClient()
{
  return MEMORY[0x270F49FA0]();
}

uint64_t MRMediaRemoteGetSupportedCommandsForOrigin()
{
  return MEMORY[0x270F49FE0]();
}

uint64_t MRMediaRemoteInsertSystemAppPlaybackQueueWithOptions()
{
  return MEMORY[0x270F49FF0]();
}

uint64_t MRMediaRemoteRequestNowPlayingPlaybackQueueSync()
{
  return MEMORY[0x270F4A030]();
}

uint64_t MRMediaRemoteSendCommandWithReply()
{
  return MEMORY[0x270F4A068]();
}

uint64_t MRNowPlayingClientGetBundleIdentifier()
{
  return MEMORY[0x270F4A0C8]();
}

uint64_t MROriginCopy()
{
  return MEMORY[0x270F4A140]();
}

uint64_t MROriginGetUniqueIdentifier()
{
  return MEMORY[0x270F4A158]();
}

uint64_t MRPlaybackQueueGetQueueID()
{
  return MEMORY[0x270F4A190]();
}

uint64_t MRPlaybackQueueRequestCreateDefault()
{
  return MEMORY[0x270F4A1A8]();
}

uint64_t MRSystemAppPlaybackQueueDestroy()
{
  return MEMORY[0x270F4A228]();
}

uint64_t MRSystemAppPlaybackQueueSetIsRequestingImmediatePlayback()
{
  return MEMORY[0x270F4A258]();
}

SCNetworkReachabilityRef SCNetworkReachabilityCreateWithAddress(CFAllocatorRef allocator, const sockaddr *address)
{
  return (SCNetworkReachabilityRef)MEMORY[0x270F055F0](allocator, address);
}

Boolean SCNetworkReachabilityGetFlags(SCNetworkReachabilityRef target, SCNetworkReachabilityFlags *flags)
{
  return MEMORY[0x270F05620](target, flags);
}

uint64_t TCCAccessCopyInformationForBundleId()
{
  return MEMORY[0x270F795D8]();
}

uint64_t TCCAccessSetForBundleId()
{
  return MEMORY[0x270F79660]();
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

uint64_t _swift_isClassOrObjCExistentialType()
{
  return MEMORY[0x270FA0150]();
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

void bzero(void *a1, size_t a2)
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

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x270ED94B8](value);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

long double exp(long double __x)
{
  MEMORY[0x270ED9858](__x);
  return result;
}

void free(void *a1)
{
}

kern_return_t host_statistics(host_t host_priv, host_flavor_t flavor, host_info_t host_info_out, mach_msg_type_number_t *host_info_outCnt)
{
  return MEMORY[0x270ED9E40](*(void *)&host_priv, *(void *)&flavor, host_info_out, host_info_outCnt);
}

kern_return_t host_statistics64(host_t host_priv, host_flavor_t flavor, host_info64_t host_info64_out, mach_msg_type_number_t *host_info64_outCnt)
{
  return MEMORY[0x270ED9E48](*(void *)&host_priv, *(void *)&flavor, host_info64_out, host_info64_outCnt);
}

long double log(long double __x)
{
  MEMORY[0x270EDA0A8](__x);
  return result;
}

long double log1p(long double __x)
{
  MEMORY[0x270EDA0C0](__x);
  return result;
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x270EDA138]();
}

mach_port_t mach_host_self(void)
{
  return MEMORY[0x270EDA178]();
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

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

int pthread_equal(pthread_t a1, pthread_t a2)
{
  return MEMORY[0x270EDAEB0](a1, a2);
}

int pthread_mutex_destroy(pthread_mutex_t *a1)
{
  return MEMORY[0x270EDAF50](a1);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return MEMORY[0x270EDAF58](a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x270EDAF60](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x270EDAF70](a1);
}

pthread_t pthread_self(void)
{
  return (pthread_t)MEMORY[0x270EDB010]();
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

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x270FA0208]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x270FA0228]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x270FA0240]();
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

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x270FA0300]();
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

uint64_t swift_initStackObject()
{
  return MEMORY[0x270FA0478]();
}

uint64_t swift_initStaticObject()
{
  return MEMORY[0x270FA0480]();
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