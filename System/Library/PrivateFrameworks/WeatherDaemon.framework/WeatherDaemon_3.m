uint64_t sub_1A95D6F7C@<X0>(char a1@<W0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  NSObject *v18;
  os_log_type_t v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  os_log_t v30;
  uint64_t v31;
  uint64_t result;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  int v41;
  os_log_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  uint64_t v48[2];

  v4 = sub_1A962E810();
  v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  v7 = (char *)&v39 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6DE3A0);
  MEMORY[0x1F4188790](v8);
  v10 = (char *)&v39 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v11);
  v13 = (char *)&v39 - v12;
  MEMORY[0x1F4188790](v14);
  v16 = (char *)&v39 - v15;
  if ((sub_1A95DED0C() & 1) != 0 && (a1 & 1) == 0)
  {
    sub_1A96319A0();
    if (qword_1EB6DE388 != -1) {
      swift_once();
    }
    v17 = sub_1A96317F0();
    __swift_project_value_buffer(v17, (uint64_t)qword_1EB6EB630);
    sub_1A944A348((uint64_t)v16, (uint64_t)v13, &qword_1EB6DE3A0);
    v18 = sub_1A96317D0();
    v19 = sub_1A9632230();
    v20 = v19;
    if (os_log_type_enabled(v18, v19))
    {
      v21 = swift_slowAlloc();
      v40 = v5;
      v22 = v21;
      v43 = swift_slowAlloc();
      v48[0] = v43;
      *(_DWORD *)v22 = 136446722;
      v42 = v18;
      v44 = a2;
      swift_beginAccess();
      v41 = v20;
      v23 = *(void *)aCurrentweather_9;
      v24 = *(void *)&aCurrentweather_9[8];
      sub_1A9631510();
      v45 = sub_1A945C1DC(v23, v24, v48);
      sub_1A9632350();
      swift_bridgeObjectRelease();
      *(_WORD *)(v22 + 12) = 2082;
      sub_1A944A348((uint64_t)v13, (uint64_t)v10, &qword_1EB6DE3A0);
      v25 = sub_1A9631DC0();
      v45 = sub_1A945C1DC(v25, v26, v48);
      sub_1A9632350();
      swift_bridgeObjectRelease();
      sub_1A944C480((uint64_t)v13, &qword_1EB6DE3A0);
      *(_WORD *)(v22 + 22) = 2082;
      a2 = v44;
      sub_1A962E7F0();
      sub_1A961B500((unint64_t *)&qword_1EB6DC720, MEMORY[0x1E4F27928]);
      v27 = sub_1A96327B0();
      v29 = v28;
      (*(void (**)(char *, uint64_t))(v40 + 8))(v7, v4);
      v45 = sub_1A945C1DC(v27, v29, v48);
      sub_1A9632350();
      swift_bridgeObjectRelease();
      v30 = v42;
      _os_log_impl(&dword_1A9410000, v42, (os_log_type_t)v41, "Data has expired, returning nil; model=%{public}s, expiration=%{public}s, now=%{public}s",
        (uint8_t *)v22,
        0x20u);
      v31 = v43;
      swift_arrayDestroy();
      MEMORY[0x1AD0F7300](v31, -1, -1);
      MEMORY[0x1AD0F7300](v22, -1, -1);
    }
    else
    {

      sub_1A944C480((uint64_t)v13, &qword_1EB6DE3A0);
    }
    sub_1A944C480((uint64_t)v16, &qword_1EB6DE3A0);
    v38 = type metadata accessor for CurrentWeather();
    v36 = a2;
    v37 = 1;
    return __swift_storeEnumTagSinglePayload(v36, v37, 1, v38);
  }
  result = sub_1A96319A0();
  v33 = v47;
  if (v47 >> 60 != 15)
  {
    v34 = v46;
    sub_1A9631440();
    v35 = type metadata accessor for CurrentWeather();
    sub_1A961B500(&qword_1EB6DD3D0, (void (*)(uint64_t))type metadata accessor for CurrentWeather);
    sub_1A961B500(&qword_1EB6DD3D8, (void (*)(uint64_t))type metadata accessor for CurrentWeather);
    sub_1A9631430();
    sub_1A9490CE8(v34, v33);
    v36 = a2;
    v37 = 0;
    v38 = v35;
    return __swift_storeEnumTagSinglePayload(v36, v37, 1, v38);
  }
  __break(1u);
  return result;
}

uint64_t sub_1A95D76CC@<X0>(char a1@<W0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_1A962E810();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  v7 = (char *)&v39 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6DE3A0);
  MEMORY[0x1F4188790](v8);
  v10 = (char *)&v39 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v11);
  v13 = (char *)&v39 - v12;
  MEMORY[0x1F4188790](v14);
  v16 = (char *)&v39 - v15;
  if ((sub_1A95DED0C() & 1) != 0 && (a1 & 1) == 0)
  {
    sub_1A96319A0();
    if (qword_1EB6DE388 != -1) {
      swift_once();
    }
    uint64_t v17 = sub_1A96317F0();
    __swift_project_value_buffer(v17, (uint64_t)qword_1EB6EB630);
    sub_1A944A348((uint64_t)v16, (uint64_t)v13, &qword_1EB6DE3A0);
    v18 = sub_1A96317D0();
    os_log_type_t v19 = sub_1A9632230();
    int v20 = v19;
    if (os_log_type_enabled(v18, v19))
    {
      uint64_t v21 = swift_slowAlloc();
      uint64_t v40 = v5;
      uint64_t v22 = v21;
      uint64_t v43 = swift_slowAlloc();
      v48[0] = v43;
      *(_DWORD *)uint64_t v22 = 136446722;
      os_log_t v42 = v18;
      uint64_t v44 = a2;
      swift_beginAccess();
      int v41 = v20;
      uint64_t v23 = *(void *)aDailyforecast_3;
      unint64_t v24 = *(void *)&aDailyforecast_3[8];
      sub_1A9631510();
      uint64_t v45 = sub_1A945C1DC(v23, v24, v48);
      sub_1A9632350();
      swift_bridgeObjectRelease();
      *(_WORD *)(v22 + 12) = 2082;
      sub_1A944A348((uint64_t)v13, (uint64_t)v10, &qword_1EB6DE3A0);
      uint64_t v25 = sub_1A9631DC0();
      uint64_t v45 = sub_1A945C1DC(v25, v26, v48);
      sub_1A9632350();
      swift_bridgeObjectRelease();
      sub_1A944C480((uint64_t)v13, &qword_1EB6DE3A0);
      *(_WORD *)(v22 + 22) = 2082;
      a2 = v44;
      sub_1A962E7F0();
      sub_1A961B500((unint64_t *)&qword_1EB6DC720, MEMORY[0x1E4F27928]);
      uint64_t v27 = sub_1A96327B0();
      unint64_t v29 = v28;
      (*(void (**)(char *, uint64_t))(v40 + 8))(v7, v4);
      uint64_t v45 = sub_1A945C1DC(v27, v29, v48);
      sub_1A9632350();
      swift_bridgeObjectRelease();
      os_log_t v30 = v42;
      _os_log_impl(&dword_1A9410000, v42, (os_log_type_t)v41, "Data has expired, returning nil; model=%{public}s, expiration=%{public}s, now=%{public}s",
        (uint8_t *)v22,
        0x20u);
      uint64_t v31 = v43;
      swift_arrayDestroy();
      MEMORY[0x1AD0F7300](v31, -1, -1);
      MEMORY[0x1AD0F7300](v22, -1, -1);
    }
    else
    {

      sub_1A944C480((uint64_t)v13, &qword_1EB6DE3A0);
    }
    sub_1A944C480((uint64_t)v16, &qword_1EB6DE3A0);
    uint64_t v38 = type metadata accessor for DailyForecast();
    uint64_t v36 = a2;
    uint64_t v37 = 1;
    return __swift_storeEnumTagSinglePayload(v36, v37, 1, v38);
  }
  uint64_t result = sub_1A96319A0();
  unint64_t v33 = v47;
  if (v47 >> 60 != 15)
  {
    uint64_t v34 = v46;
    sub_1A9631440();
    uint64_t v35 = type metadata accessor for DailyForecast();
    sub_1A961B500(&qword_1EB6DC350, (void (*)(uint64_t))type metadata accessor for DailyForecast);
    sub_1A961B500(&qword_1EB6DC650, (void (*)(uint64_t))type metadata accessor for DailyForecast);
    sub_1A9631430();
    sub_1A9490CE8(v34, v33);
    uint64_t v36 = a2;
    uint64_t v37 = 0;
    uint64_t v38 = v35;
    return __swift_storeEnumTagSinglePayload(v36, v37, 1, v38);
  }
  __break(1u);
  return result;
}

uint64_t sub_1A95D7E1C@<X0>(char a1@<W0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_1A962E810();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  v7 = (char *)&v39 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6DE3A0);
  MEMORY[0x1F4188790](v8);
  v10 = (char *)&v39 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v11);
  v13 = (char *)&v39 - v12;
  MEMORY[0x1F4188790](v14);
  v16 = (char *)&v39 - v15;
  if ((sub_1A95DED0C() & 1) != 0 && (a1 & 1) == 0)
  {
    sub_1A96319A0();
    if (qword_1EB6DE388 != -1) {
      swift_once();
    }
    uint64_t v17 = sub_1A96317F0();
    __swift_project_value_buffer(v17, (uint64_t)qword_1EB6EB630);
    sub_1A944A348((uint64_t)v16, (uint64_t)v13, &qword_1EB6DE3A0);
    v18 = sub_1A96317D0();
    os_log_type_t v19 = sub_1A9632230();
    int v20 = v19;
    if (os_log_type_enabled(v18, v19))
    {
      uint64_t v21 = swift_slowAlloc();
      uint64_t v40 = v5;
      uint64_t v22 = v21;
      uint64_t v43 = swift_slowAlloc();
      v48[0] = v43;
      *(_DWORD *)uint64_t v22 = 136446722;
      os_log_t v42 = v18;
      uint64_t v44 = a2;
      swift_beginAccess();
      int v41 = v20;
      uint64_t v23 = *(void *)aHourlyforecast_4;
      unint64_t v24 = *(void *)&aHourlyforecast_4[8];
      sub_1A9631510();
      uint64_t v45 = sub_1A945C1DC(v23, v24, v48);
      sub_1A9632350();
      swift_bridgeObjectRelease();
      *(_WORD *)(v22 + 12) = 2082;
      sub_1A944A348((uint64_t)v13, (uint64_t)v10, &qword_1EB6DE3A0);
      uint64_t v25 = sub_1A9631DC0();
      uint64_t v45 = sub_1A945C1DC(v25, v26, v48);
      sub_1A9632350();
      swift_bridgeObjectRelease();
      sub_1A944C480((uint64_t)v13, &qword_1EB6DE3A0);
      *(_WORD *)(v22 + 22) = 2082;
      a2 = v44;
      sub_1A962E7F0();
      sub_1A961B500((unint64_t *)&qword_1EB6DC720, MEMORY[0x1E4F27928]);
      uint64_t v27 = sub_1A96327B0();
      unint64_t v29 = v28;
      (*(void (**)(char *, uint64_t))(v40 + 8))(v7, v4);
      uint64_t v45 = sub_1A945C1DC(v27, v29, v48);
      sub_1A9632350();
      swift_bridgeObjectRelease();
      os_log_t v30 = v42;
      _os_log_impl(&dword_1A9410000, v42, (os_log_type_t)v41, "Data has expired, returning nil; model=%{public}s, expiration=%{public}s, now=%{public}s",
        (uint8_t *)v22,
        0x20u);
      uint64_t v31 = v43;
      swift_arrayDestroy();
      MEMORY[0x1AD0F7300](v31, -1, -1);
      MEMORY[0x1AD0F7300](v22, -1, -1);
    }
    else
    {

      sub_1A944C480((uint64_t)v13, &qword_1EB6DE3A0);
    }
    sub_1A944C480((uint64_t)v16, &qword_1EB6DE3A0);
    uint64_t v38 = type metadata accessor for HourlyForecast();
    uint64_t v36 = a2;
    uint64_t v37 = 1;
    return __swift_storeEnumTagSinglePayload(v36, v37, 1, v38);
  }
  uint64_t result = sub_1A96319A0();
  unint64_t v33 = v47;
  if (v47 >> 60 != 15)
  {
    uint64_t v34 = v46;
    sub_1A9631440();
    uint64_t v35 = type metadata accessor for HourlyForecast();
    sub_1A961B500(&qword_1EB6DC658, (void (*)(uint64_t))type metadata accessor for HourlyForecast);
    sub_1A961B500(&qword_1EB6DC660, (void (*)(uint64_t))type metadata accessor for HourlyForecast);
    sub_1A9631430();
    sub_1A9490CE8(v34, v33);
    uint64_t v36 = a2;
    uint64_t v37 = 0;
    uint64_t v38 = v35;
    return __swift_storeEnumTagSinglePayload(v36, v37, 1, v38);
  }
  __break(1u);
  return result;
}

uint64_t sub_1A95D856C@<X0>(char a1@<W0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_1A962E810();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  v7 = (char *)&v39 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6DE3A0);
  MEMORY[0x1F4188790](v8);
  v10 = (char *)&v39 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v11);
  v13 = (char *)&v39 - v12;
  MEMORY[0x1F4188790](v14);
  v16 = (char *)&v39 - v15;
  if ((sub_1A95DED0C() & 1) != 0 && (a1 & 1) == 0)
  {
    sub_1A96319A0();
    if (qword_1EB6DE388 != -1) {
      swift_once();
    }
    uint64_t v17 = sub_1A96317F0();
    __swift_project_value_buffer(v17, (uint64_t)qword_1EB6EB630);
    sub_1A944A348((uint64_t)v16, (uint64_t)v13, &qword_1EB6DE3A0);
    v18 = sub_1A96317D0();
    os_log_type_t v19 = sub_1A9632230();
    int v20 = v19;
    if (os_log_type_enabled(v18, v19))
    {
      uint64_t v21 = swift_slowAlloc();
      uint64_t v40 = v5;
      uint64_t v22 = v21;
      uint64_t v43 = swift_slowAlloc();
      v48[0] = v43;
      *(_DWORD *)uint64_t v22 = 136446722;
      os_log_t v42 = v18;
      uint64_t v44 = a2;
      swift_beginAccess();
      int v41 = v20;
      uint64_t v23 = qword_1E97EB908;
      unint64_t v24 = off_1E97EB910;
      sub_1A9631510();
      uint64_t v45 = sub_1A945C1DC(v23, (unint64_t)v24, v48);
      sub_1A9632350();
      swift_bridgeObjectRelease();
      *(_WORD *)(v22 + 12) = 2082;
      sub_1A944A348((uint64_t)v13, (uint64_t)v10, &qword_1EB6DE3A0);
      uint64_t v25 = sub_1A9631DC0();
      uint64_t v45 = sub_1A945C1DC(v25, v26, v48);
      sub_1A9632350();
      swift_bridgeObjectRelease();
      sub_1A944C480((uint64_t)v13, &qword_1EB6DE3A0);
      *(_WORD *)(v22 + 22) = 2082;
      a2 = v44;
      sub_1A962E7F0();
      sub_1A961B500((unint64_t *)&qword_1EB6DC720, MEMORY[0x1E4F27928]);
      uint64_t v27 = sub_1A96327B0();
      unint64_t v29 = v28;
      (*(void (**)(char *, uint64_t))(v40 + 8))(v7, v4);
      uint64_t v45 = sub_1A945C1DC(v27, v29, v48);
      sub_1A9632350();
      swift_bridgeObjectRelease();
      os_log_t v30 = v42;
      _os_log_impl(&dword_1A9410000, v42, (os_log_type_t)v41, "Data has expired, returning nil; model=%{public}s, expiration=%{public}s, now=%{public}s",
        (uint8_t *)v22,
        0x20u);
      uint64_t v31 = v43;
      swift_arrayDestroy();
      MEMORY[0x1AD0F7300](v31, -1, -1);
      MEMORY[0x1AD0F7300](v22, -1, -1);
    }
    else
    {

      sub_1A944C480((uint64_t)v13, &qword_1EB6DE3A0);
    }
    sub_1A944C480((uint64_t)v16, &qword_1EB6DE3A0);
    uint64_t HourForecast = type metadata accessor for NextHourForecast();
    uint64_t v36 = a2;
    uint64_t v37 = 1;
    return __swift_storeEnumTagSinglePayload(v36, v37, 1, HourForecast);
  }
  uint64_t result = sub_1A96319A0();
  unint64_t v33 = v47;
  if (v47 >> 60 != 15)
  {
    uint64_t v34 = v46;
    sub_1A9631440();
    uint64_t v35 = type metadata accessor for NextHourForecast();
    sub_1A961B500(&qword_1EB6DB998, (void (*)(uint64_t))type metadata accessor for NextHourForecast);
    sub_1A961B500(&qword_1EB6DB9A0, (void (*)(uint64_t))type metadata accessor for NextHourForecast);
    sub_1A9631430();
    sub_1A9490CE8(v34, v33);
    uint64_t v36 = a2;
    uint64_t v37 = 0;
    uint64_t HourForecast = v35;
    return __swift_storeEnumTagSinglePayload(v36, v37, 1, HourForecast);
  }
  __break(1u);
  return result;
}

uint64_t sub_1A95D8CBC@<X0>(char a1@<W0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_1A962E810();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  v7 = (char *)&v39 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6DE3A0);
  MEMORY[0x1F4188790](v8);
  v10 = (char *)&v39 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v11);
  v13 = (char *)&v39 - v12;
  MEMORY[0x1F4188790](v14);
  v16 = (char *)&v39 - v15;
  if ((sub_1A95DED0C() & 1) != 0 && (a1 & 1) == 0)
  {
    sub_1A96319A0();
    if (qword_1EB6DE388 != -1) {
      swift_once();
    }
    uint64_t v17 = sub_1A96317F0();
    __swift_project_value_buffer(v17, (uint64_t)qword_1EB6EB630);
    sub_1A944A348((uint64_t)v16, (uint64_t)v13, &qword_1EB6DE3A0);
    v18 = sub_1A96317D0();
    os_log_type_t v19 = sub_1A9632230();
    int v20 = v19;
    if (os_log_type_enabled(v18, v19))
    {
      uint64_t v21 = swift_slowAlloc();
      uint64_t v40 = v5;
      uint64_t v22 = v21;
      uint64_t v43 = swift_slowAlloc();
      v48[0] = v43;
      *(_DWORD *)uint64_t v22 = 136446722;
      os_log_t v42 = v18;
      uint64_t v44 = a2;
      swift_beginAccess();
      int v41 = v20;
      uint64_t v23 = qword_1E97ECE08;
      unint64_t v24 = qword_1E97ECE10;
      sub_1A9631510();
      uint64_t v45 = sub_1A945C1DC(v23, v24, v48);
      sub_1A9632350();
      swift_bridgeObjectRelease();
      *(_WORD *)(v22 + 12) = 2082;
      sub_1A944A348((uint64_t)v13, (uint64_t)v10, &qword_1EB6DE3A0);
      uint64_t v25 = sub_1A9631DC0();
      uint64_t v45 = sub_1A945C1DC(v25, v26, v48);
      sub_1A9632350();
      swift_bridgeObjectRelease();
      sub_1A944C480((uint64_t)v13, &qword_1EB6DE3A0);
      *(_WORD *)(v22 + 22) = 2082;
      a2 = v44;
      sub_1A962E7F0();
      sub_1A961B500((unint64_t *)&qword_1EB6DC720, MEMORY[0x1E4F27928]);
      uint64_t v27 = sub_1A96327B0();
      unint64_t v29 = v28;
      (*(void (**)(char *, uint64_t))(v40 + 8))(v7, v4);
      uint64_t v45 = sub_1A945C1DC(v27, v29, v48);
      sub_1A9632350();
      swift_bridgeObjectRelease();
      os_log_t v30 = v42;
      _os_log_impl(&dword_1A9410000, v42, (os_log_type_t)v41, "Data has expired, returning nil; model=%{public}s, expiration=%{public}s, now=%{public}s",
        (uint8_t *)v22,
        0x20u);
      uint64_t v31 = v43;
      swift_arrayDestroy();
      MEMORY[0x1AD0F7300](v31, -1, -1);
      MEMORY[0x1AD0F7300](v22, -1, -1);
    }
    else
    {

      sub_1A944C480((uint64_t)v13, &qword_1EB6DE3A0);
    }
    sub_1A944C480((uint64_t)v16, &qword_1EB6DE3A0);
    uint64_t v38 = type metadata accessor for PeriodicForecasts();
    uint64_t v36 = a2;
    uint64_t v37 = 1;
    return __swift_storeEnumTagSinglePayload(v36, v37, 1, v38);
  }
  uint64_t result = sub_1A96319A0();
  unint64_t v33 = v47;
  if (v47 >> 60 != 15)
  {
    uint64_t v34 = v46;
    sub_1A9631440();
    uint64_t v35 = type metadata accessor for PeriodicForecasts();
    sub_1A961B500(&qword_1E97ED230, (void (*)(uint64_t))type metadata accessor for PeriodicForecasts);
    sub_1A961B500(&qword_1E97ED238, (void (*)(uint64_t))type metadata accessor for PeriodicForecasts);
    sub_1A9631430();
    sub_1A9490CE8(v34, v33);
    uint64_t v36 = a2;
    uint64_t v37 = 0;
    uint64_t v38 = v35;
    return __swift_storeEnumTagSinglePayload(v36, v37, 1, v38);
  }
  __break(1u);
  return result;
}

uint64_t sub_1A95D940C@<X0>(char a1@<W0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_1A962E810();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  v7 = (char *)&v39 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6DE3A0);
  MEMORY[0x1F4188790](v8);
  v10 = (char *)&v39 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v11);
  v13 = (char *)&v39 - v12;
  MEMORY[0x1F4188790](v14);
  v16 = (char *)&v39 - v15;
  if ((sub_1A95DED0C() & 1) != 0 && (a1 & 1) == 0)
  {
    sub_1A96319A0();
    if (qword_1EB6DE388 != -1) {
      swift_once();
    }
    uint64_t v17 = sub_1A96317F0();
    __swift_project_value_buffer(v17, (uint64_t)qword_1EB6EB630);
    sub_1A944A348((uint64_t)v16, (uint64_t)v13, &qword_1EB6DE3A0);
    v18 = sub_1A96317D0();
    os_log_type_t v19 = sub_1A9632230();
    int v20 = v19;
    if (os_log_type_enabled(v18, v19))
    {
      uint64_t v21 = swift_slowAlloc();
      uint64_t v40 = v5;
      uint64_t v22 = v21;
      uint64_t v43 = swift_slowAlloc();
      v48[0] = v43;
      *(_DWORD *)uint64_t v22 = 136446722;
      os_log_t v42 = v18;
      uint64_t v44 = a2;
      swift_beginAccess();
      int v41 = v20;
      uint64_t v23 = *(void *)aLocationinfo_7;
      unint64_t v24 = *(void *)&aLocationinfo_7[8];
      sub_1A9631510();
      uint64_t v45 = sub_1A945C1DC(v23, v24, v48);
      sub_1A9632350();
      swift_bridgeObjectRelease();
      *(_WORD *)(v22 + 12) = 2082;
      sub_1A944A348((uint64_t)v13, (uint64_t)v10, &qword_1EB6DE3A0);
      uint64_t v25 = sub_1A9631DC0();
      uint64_t v45 = sub_1A945C1DC(v25, v26, v48);
      sub_1A9632350();
      swift_bridgeObjectRelease();
      sub_1A944C480((uint64_t)v13, &qword_1EB6DE3A0);
      *(_WORD *)(v22 + 22) = 2082;
      a2 = v44;
      sub_1A962E7F0();
      sub_1A961B500((unint64_t *)&qword_1EB6DC720, MEMORY[0x1E4F27928]);
      uint64_t v27 = sub_1A96327B0();
      unint64_t v29 = v28;
      (*(void (**)(char *, uint64_t))(v40 + 8))(v7, v4);
      uint64_t v45 = sub_1A945C1DC(v27, v29, v48);
      sub_1A9632350();
      swift_bridgeObjectRelease();
      os_log_t v30 = v42;
      _os_log_impl(&dword_1A9410000, v42, (os_log_type_t)v41, "Data has expired, returning nil; model=%{public}s, expiration=%{public}s, now=%{public}s",
        (uint8_t *)v22,
        0x20u);
      uint64_t v31 = v43;
      swift_arrayDestroy();
      MEMORY[0x1AD0F7300](v31, -1, -1);
      MEMORY[0x1AD0F7300](v22, -1, -1);
    }
    else
    {

      sub_1A944C480((uint64_t)v13, &qword_1EB6DE3A0);
    }
    sub_1A944C480((uint64_t)v16, &qword_1EB6DE3A0);
    uint64_t v38 = type metadata accessor for LocationInfo();
    uint64_t v36 = a2;
    uint64_t v37 = 1;
    return __swift_storeEnumTagSinglePayload(v36, v37, 1, v38);
  }
  uint64_t result = sub_1A96319A0();
  unint64_t v33 = v47;
  if (v47 >> 60 != 15)
  {
    uint64_t v34 = v46;
    sub_1A9631440();
    uint64_t v35 = type metadata accessor for LocationInfo();
    sub_1A961B500(&qword_1EB6DA268, (void (*)(uint64_t))type metadata accessor for LocationInfo);
    sub_1A961B500(&qword_1EB6DA5F0, (void (*)(uint64_t))type metadata accessor for LocationInfo);
    sub_1A9631430();
    sub_1A9490CE8(v34, v33);
    uint64_t v36 = a2;
    uint64_t v37 = 0;
    uint64_t v38 = v35;
    return __swift_storeEnumTagSinglePayload(v36, v37, 1, v38);
  }
  __break(1u);
  return result;
}

uint64_t sub_1A95D9B5C@<X0>(char a1@<W0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_1A962E810();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  v7 = (char *)&v39 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6DE3A0);
  MEMORY[0x1F4188790](v8);
  v10 = (char *)&v39 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v11);
  v13 = (char *)&v39 - v12;
  MEMORY[0x1F4188790](v14);
  v16 = (char *)&v39 - v15;
  if ((sub_1A95DED0C() & 1) != 0 && (a1 & 1) == 0)
  {
    sub_1A96319A0();
    if (qword_1EB6DE388 != -1) {
      swift_once();
    }
    uint64_t v17 = sub_1A96317F0();
    __swift_project_value_buffer(v17, (uint64_t)qword_1EB6EB630);
    sub_1A944A348((uint64_t)v16, (uint64_t)v13, &qword_1EB6DE3A0);
    v18 = sub_1A96317D0();
    os_log_type_t v19 = sub_1A9632230();
    int v20 = v19;
    if (os_log_type_enabled(v18, v19))
    {
      uint64_t v21 = swift_slowAlloc();
      uint64_t v40 = v5;
      uint64_t v22 = v21;
      uint64_t v43 = swift_slowAlloc();
      v48[0] = v43;
      *(_DWORD *)uint64_t v22 = 136446722;
      os_log_t v42 = v18;
      uint64_t v44 = a2;
      swift_beginAccess();
      int v41 = v20;
      uint64_t v23 = *(void *)aMarineforecast_11;
      unint64_t v24 = *(void *)&aMarineforecast_11[8];
      sub_1A9631510();
      uint64_t v45 = sub_1A945C1DC(v23, v24, v48);
      sub_1A9632350();
      swift_bridgeObjectRelease();
      *(_WORD *)(v22 + 12) = 2082;
      sub_1A944A348((uint64_t)v13, (uint64_t)v10, &qword_1EB6DE3A0);
      uint64_t v25 = sub_1A9631DC0();
      uint64_t v45 = sub_1A945C1DC(v25, v26, v48);
      sub_1A9632350();
      swift_bridgeObjectRelease();
      sub_1A944C480((uint64_t)v13, &qword_1EB6DE3A0);
      *(_WORD *)(v22 + 22) = 2082;
      a2 = v44;
      sub_1A962E7F0();
      sub_1A961B500((unint64_t *)&qword_1EB6DC720, MEMORY[0x1E4F27928]);
      uint64_t v27 = sub_1A96327B0();
      unint64_t v29 = v28;
      (*(void (**)(char *, uint64_t))(v40 + 8))(v7, v4);
      uint64_t v45 = sub_1A945C1DC(v27, v29, v48);
      sub_1A9632350();
      swift_bridgeObjectRelease();
      os_log_t v30 = v42;
      _os_log_impl(&dword_1A9410000, v42, (os_log_type_t)v41, "Data has expired, returning nil; model=%{public}s, expiration=%{public}s, now=%{public}s",
        (uint8_t *)v22,
        0x20u);
      uint64_t v31 = v43;
      swift_arrayDestroy();
      MEMORY[0x1AD0F7300](v31, -1, -1);
      MEMORY[0x1AD0F7300](v22, -1, -1);
    }
    else
    {

      sub_1A944C480((uint64_t)v13, &qword_1EB6DE3A0);
    }
    sub_1A944C480((uint64_t)v16, &qword_1EB6DE3A0);
    uint64_t v38 = type metadata accessor for MarineForecast();
    uint64_t v36 = a2;
    uint64_t v37 = 1;
    return __swift_storeEnumTagSinglePayload(v36, v37, 1, v38);
  }
  uint64_t result = sub_1A96319A0();
  unint64_t v33 = v47;
  if (v47 >> 60 != 15)
  {
    uint64_t v34 = v46;
    sub_1A9631440();
    uint64_t v35 = type metadata accessor for MarineForecast();
    sub_1A961B500(&qword_1E97ED240, (void (*)(uint64_t))type metadata accessor for MarineForecast);
    sub_1A961B500(&qword_1E97ED248, (void (*)(uint64_t))type metadata accessor for MarineForecast);
    sub_1A9631430();
    sub_1A9490CE8(v34, v33);
    uint64_t v36 = a2;
    uint64_t v37 = 0;
    uint64_t v38 = v35;
    return __swift_storeEnumTagSinglePayload(v36, v37, 1, v38);
  }
  __break(1u);
  return result;
}

uint64_t sub_1A95DA2AC@<X0>(char a1@<W0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_1A962E810();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  v7 = (char *)&v39 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6DE3A0);
  MEMORY[0x1F4188790](v8);
  v10 = (char *)&v39 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v11);
  v13 = (char *)&v39 - v12;
  MEMORY[0x1F4188790](v14);
  v16 = (char *)&v39 - v15;
  if ((sub_1A95DED0C() & 1) != 0 && (a1 & 1) == 0)
  {
    sub_1A96319A0();
    if (qword_1EB6DE388 != -1) {
      swift_once();
    }
    uint64_t v17 = sub_1A96317F0();
    __swift_project_value_buffer(v17, (uint64_t)qword_1EB6EB630);
    sub_1A944A348((uint64_t)v16, (uint64_t)v13, &qword_1EB6DE3A0);
    v18 = sub_1A96317D0();
    os_log_type_t v19 = sub_1A9632230();
    int v20 = v19;
    if (os_log_type_enabled(v18, v19))
    {
      uint64_t v21 = swift_slowAlloc();
      uint64_t v40 = v5;
      uint64_t v22 = v21;
      uint64_t v43 = swift_slowAlloc();
      v48[0] = v43;
      *(_DWORD *)uint64_t v22 = 136446722;
      os_log_t v42 = v18;
      uint64_t v44 = a2;
      swift_beginAccess();
      int v41 = v20;
      uint64_t v23 = *(void *)aNews_8;
      unint64_t v24 = qword_1E97EC228;
      sub_1A9631510();
      uint64_t v45 = sub_1A945C1DC(v23, v24, v48);
      sub_1A9632350();
      swift_bridgeObjectRelease();
      *(_WORD *)(v22 + 12) = 2082;
      sub_1A944A348((uint64_t)v13, (uint64_t)v10, &qword_1EB6DE3A0);
      uint64_t v25 = sub_1A9631DC0();
      uint64_t v45 = sub_1A945C1DC(v25, v26, v48);
      sub_1A9632350();
      swift_bridgeObjectRelease();
      sub_1A944C480((uint64_t)v13, &qword_1EB6DE3A0);
      *(_WORD *)(v22 + 22) = 2082;
      a2 = v44;
      sub_1A962E7F0();
      sub_1A961B500((unint64_t *)&qword_1EB6DC720, MEMORY[0x1E4F27928]);
      uint64_t v27 = sub_1A96327B0();
      unint64_t v29 = v28;
      (*(void (**)(char *, uint64_t))(v40 + 8))(v7, v4);
      uint64_t v45 = sub_1A945C1DC(v27, v29, v48);
      sub_1A9632350();
      swift_bridgeObjectRelease();
      os_log_t v30 = v42;
      _os_log_impl(&dword_1A9410000, v42, (os_log_type_t)v41, "Data has expired, returning nil; model=%{public}s, expiration=%{public}s, now=%{public}s",
        (uint8_t *)v22,
        0x20u);
      uint64_t v31 = v43;
      swift_arrayDestroy();
      MEMORY[0x1AD0F7300](v31, -1, -1);
      MEMORY[0x1AD0F7300](v22, -1, -1);
    }
    else
    {

      sub_1A944C480((uint64_t)v13, &qword_1EB6DE3A0);
    }
    sub_1A944C480((uint64_t)v16, &qword_1EB6DE3A0);
    uint64_t v38 = type metadata accessor for News();
    uint64_t v36 = a2;
    uint64_t v37 = 1;
    return __swift_storeEnumTagSinglePayload(v36, v37, 1, v38);
  }
  uint64_t result = sub_1A96319A0();
  unint64_t v33 = v47;
  if (v47 >> 60 != 15)
  {
    uint64_t v34 = v46;
    sub_1A9631440();
    uint64_t v35 = type metadata accessor for News();
    sub_1A961B500(&qword_1EB6DA8C8, (void (*)(uint64_t))type metadata accessor for News);
    sub_1A961B500(&qword_1EB6DA8D0, (void (*)(uint64_t))type metadata accessor for News);
    sub_1A9631430();
    sub_1A9490CE8(v34, v33);
    uint64_t v36 = a2;
    uint64_t v37 = 0;
    uint64_t v38 = v35;
    return __swift_storeEnumTagSinglePayload(v36, v37, 1, v38);
  }
  __break(1u);
  return result;
}

uint64_t sub_1A95DA9FC@<X0>(char a1@<W0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_1A962E810();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  v7 = (char *)&v39 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6DE3A0);
  MEMORY[0x1F4188790](v8);
  v10 = (char *)&v39 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v11);
  v13 = (char *)&v39 - v12;
  MEMORY[0x1F4188790](v14);
  v16 = (char *)&v39 - v15;
  if ((sub_1A95DED0C() & 1) != 0 && (a1 & 1) == 0)
  {
    sub_1A96319A0();
    if (qword_1EB6DE388 != -1) {
      swift_once();
    }
    uint64_t v17 = sub_1A96317F0();
    __swift_project_value_buffer(v17, (uint64_t)qword_1EB6EB630);
    sub_1A944A348((uint64_t)v16, (uint64_t)v13, &qword_1EB6DE3A0);
    v18 = sub_1A96317D0();
    os_log_type_t v19 = sub_1A9632230();
    int v20 = v19;
    if (os_log_type_enabled(v18, v19))
    {
      uint64_t v21 = swift_slowAlloc();
      uint64_t v40 = v5;
      uint64_t v22 = v21;
      uint64_t v43 = swift_slowAlloc();
      v48[0] = v43;
      *(_DWORD *)uint64_t v22 = 136446722;
      os_log_t v42 = v18;
      uint64_t v44 = a2;
      swift_beginAccess();
      int v41 = v20;
      uint64_t v23 = *(void *)aTideevents_7;
      unint64_t v24 = *(void *)&aTideevents_7[8];
      sub_1A9631510();
      uint64_t v45 = sub_1A945C1DC(v23, v24, v48);
      sub_1A9632350();
      swift_bridgeObjectRelease();
      *(_WORD *)(v22 + 12) = 2082;
      sub_1A944A348((uint64_t)v13, (uint64_t)v10, &qword_1EB6DE3A0);
      uint64_t v25 = sub_1A9631DC0();
      uint64_t v45 = sub_1A945C1DC(v25, v26, v48);
      sub_1A9632350();
      swift_bridgeObjectRelease();
      sub_1A944C480((uint64_t)v13, &qword_1EB6DE3A0);
      *(_WORD *)(v22 + 22) = 2082;
      a2 = v44;
      sub_1A962E7F0();
      sub_1A961B500((unint64_t *)&qword_1EB6DC720, MEMORY[0x1E4F27928]);
      uint64_t v27 = sub_1A96327B0();
      unint64_t v29 = v28;
      (*(void (**)(char *, uint64_t))(v40 + 8))(v7, v4);
      uint64_t v45 = sub_1A945C1DC(v27, v29, v48);
      sub_1A9632350();
      swift_bridgeObjectRelease();
      os_log_t v30 = v42;
      _os_log_impl(&dword_1A9410000, v42, (os_log_type_t)v41, "Data has expired, returning nil; model=%{public}s, expiration=%{public}s, now=%{public}s",
        (uint8_t *)v22,
        0x20u);
      uint64_t v31 = v43;
      swift_arrayDestroy();
      MEMORY[0x1AD0F7300](v31, -1, -1);
      MEMORY[0x1AD0F7300](v22, -1, -1);
    }
    else
    {

      sub_1A944C480((uint64_t)v13, &qword_1EB6DE3A0);
    }
    sub_1A944C480((uint64_t)v16, &qword_1EB6DE3A0);
    uint64_t v38 = type metadata accessor for TideEvents();
    uint64_t v36 = a2;
    uint64_t v37 = 1;
    return __swift_storeEnumTagSinglePayload(v36, v37, 1, v38);
  }
  uint64_t result = sub_1A96319A0();
  unint64_t v33 = v47;
  if (v47 >> 60 != 15)
  {
    uint64_t v34 = v46;
    sub_1A9631440();
    uint64_t v35 = type metadata accessor for TideEvents();
    sub_1A961B500(&qword_1E97ED250, (void (*)(uint64_t))type metadata accessor for TideEvents);
    sub_1A961B500(&qword_1E97ED258, (void (*)(uint64_t))type metadata accessor for TideEvents);
    sub_1A9631430();
    sub_1A9490CE8(v34, v33);
    uint64_t v36 = a2;
    uint64_t v37 = 0;
    uint64_t v38 = v35;
    return __swift_storeEnumTagSinglePayload(v36, v37, 1, v38);
  }
  __break(1u);
  return result;
}

uint64_t sub_1A95DB14C@<X0>(char a1@<W0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_1A962E810();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  v7 = (char *)&v39 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6DE3A0);
  MEMORY[0x1F4188790](v8);
  v10 = (char *)&v39 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v11);
  v13 = (char *)&v39 - v12;
  MEMORY[0x1F4188790](v14);
  v16 = (char *)&v39 - v15;
  if ((sub_1A95DED0C() & 1) != 0 && (a1 & 1) == 0)
  {
    sub_1A96319A0();
    if (qword_1EB6DE388 != -1) {
      swift_once();
    }
    uint64_t v17 = sub_1A96317F0();
    __swift_project_value_buffer(v17, (uint64_t)qword_1EB6EB630);
    sub_1A944A348((uint64_t)v16, (uint64_t)v13, &qword_1EB6DE3A0);
    v18 = sub_1A96317D0();
    os_log_type_t v19 = sub_1A9632230();
    int v20 = v19;
    if (os_log_type_enabled(v18, v19))
    {
      uint64_t v21 = swift_slowAlloc();
      uint64_t v40 = v5;
      uint64_t v22 = v21;
      uint64_t v43 = swift_slowAlloc();
      v48[0] = v43;
      *(_DWORD *)uint64_t v22 = 136446722;
      os_log_t v42 = v18;
      uint64_t v44 = a2;
      swift_beginAccess();
      int v41 = v20;
      uint64_t v23 = *(void *)aWeatheralerts_8;
      unint64_t v24 = *(void *)&aWeatheralerts_8[8];
      sub_1A9631510();
      uint64_t v45 = sub_1A945C1DC(v23, v24, v48);
      sub_1A9632350();
      swift_bridgeObjectRelease();
      *(_WORD *)(v22 + 12) = 2082;
      sub_1A944A348((uint64_t)v13, (uint64_t)v10, &qword_1EB6DE3A0);
      uint64_t v25 = sub_1A9631DC0();
      uint64_t v45 = sub_1A945C1DC(v25, v26, v48);
      sub_1A9632350();
      swift_bridgeObjectRelease();
      sub_1A944C480((uint64_t)v13, &qword_1EB6DE3A0);
      *(_WORD *)(v22 + 22) = 2082;
      a2 = v44;
      sub_1A962E7F0();
      sub_1A961B500((unint64_t *)&qword_1EB6DC720, MEMORY[0x1E4F27928]);
      uint64_t v27 = sub_1A96327B0();
      unint64_t v29 = v28;
      (*(void (**)(char *, uint64_t))(v40 + 8))(v7, v4);
      uint64_t v45 = sub_1A945C1DC(v27, v29, v48);
      sub_1A9632350();
      swift_bridgeObjectRelease();
      os_log_t v30 = v42;
      _os_log_impl(&dword_1A9410000, v42, (os_log_type_t)v41, "Data has expired, returning nil; model=%{public}s, expiration=%{public}s, now=%{public}s",
        (uint8_t *)v22,
        0x20u);
      uint64_t v31 = v43;
      swift_arrayDestroy();
      MEMORY[0x1AD0F7300](v31, -1, -1);
      MEMORY[0x1AD0F7300](v22, -1, -1);
    }
    else
    {

      sub_1A944C480((uint64_t)v13, &qword_1EB6DE3A0);
    }
    sub_1A944C480((uint64_t)v16, &qword_1EB6DE3A0);
    uint64_t v38 = type metadata accessor for WeatherAlerts();
    uint64_t v36 = a2;
    uint64_t v37 = 1;
    return __swift_storeEnumTagSinglePayload(v36, v37, 1, v38);
  }
  uint64_t result = sub_1A96319A0();
  unint64_t v33 = v47;
  if (v47 >> 60 != 15)
  {
    uint64_t v34 = v46;
    sub_1A9631440();
    uint64_t v35 = type metadata accessor for WeatherAlerts();
    sub_1A961B500(&qword_1EB6DABC8, (void (*)(uint64_t))type metadata accessor for WeatherAlerts);
    sub_1A961B500(&qword_1EB6DAEA8, (void (*)(uint64_t))type metadata accessor for WeatherAlerts);
    sub_1A9631430();
    sub_1A9490CE8(v34, v33);
    uint64_t v36 = a2;
    uint64_t v37 = 0;
    uint64_t v38 = v35;
    return __swift_storeEnumTagSinglePayload(v36, v37, 1, v38);
  }
  __break(1u);
  return result;
}

uint64_t sub_1A95DB89C@<X0>(char a1@<W0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_1A962E810();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  v7 = (char *)&v39 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6DE3A0);
  MEMORY[0x1F4188790](v8);
  v10 = (char *)&v39 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v11);
  v13 = (char *)&v39 - v12;
  MEMORY[0x1F4188790](v14);
  v16 = (char *)&v39 - v15;
  if ((sub_1A95DED0C() & 1) != 0 && (a1 & 1) == 0)
  {
    sub_1A96319A0();
    if (qword_1EB6DE388 != -1) {
      swift_once();
    }
    uint64_t v17 = sub_1A96317F0();
    __swift_project_value_buffer(v17, (uint64_t)qword_1EB6EB630);
    sub_1A944A348((uint64_t)v16, (uint64_t)v13, &qword_1EB6DE3A0);
    v18 = sub_1A96317D0();
    os_log_type_t v19 = sub_1A9632230();
    int v20 = v19;
    if (os_log_type_enabled(v18, v19))
    {
      uint64_t v21 = swift_slowAlloc();
      uint64_t v40 = v5;
      uint64_t v22 = v21;
      uint64_t v43 = swift_slowAlloc();
      v48[0] = v43;
      *(_DWORD *)uint64_t v22 = 136446722;
      os_log_t v42 = v18;
      uint64_t v44 = a2;
      swift_beginAccess();
      int v41 = v20;
      uint64_t v23 = *(void *)aWeatherchange_8;
      unint64_t v24 = *(void *)&aWeatherchange_8[8];
      sub_1A9631510();
      uint64_t v45 = sub_1A945C1DC(v23, v24, v48);
      sub_1A9632350();
      swift_bridgeObjectRelease();
      *(_WORD *)(v22 + 12) = 2082;
      sub_1A944A348((uint64_t)v13, (uint64_t)v10, &qword_1EB6DE3A0);
      uint64_t v25 = sub_1A9631DC0();
      uint64_t v45 = sub_1A945C1DC(v25, v26, v48);
      sub_1A9632350();
      swift_bridgeObjectRelease();
      sub_1A944C480((uint64_t)v13, &qword_1EB6DE3A0);
      *(_WORD *)(v22 + 22) = 2082;
      a2 = v44;
      sub_1A962E7F0();
      sub_1A961B500((unint64_t *)&qword_1EB6DC720, MEMORY[0x1E4F27928]);
      uint64_t v27 = sub_1A96327B0();
      unint64_t v29 = v28;
      (*(void (**)(char *, uint64_t))(v40 + 8))(v7, v4);
      uint64_t v45 = sub_1A945C1DC(v27, v29, v48);
      sub_1A9632350();
      swift_bridgeObjectRelease();
      os_log_t v30 = v42;
      _os_log_impl(&dword_1A9410000, v42, (os_log_type_t)v41, "Data has expired, returning nil; model=%{public}s, expiration=%{public}s, now=%{public}s",
        (uint8_t *)v22,
        0x20u);
      uint64_t v31 = v43;
      swift_arrayDestroy();
      MEMORY[0x1AD0F7300](v31, -1, -1);
      MEMORY[0x1AD0F7300](v22, -1, -1);
    }
    else
    {

      sub_1A944C480((uint64_t)v13, &qword_1EB6DE3A0);
    }
    sub_1A944C480((uint64_t)v16, &qword_1EB6DE3A0);
    uint64_t v38 = type metadata accessor for WeatherChange();
    uint64_t v36 = a2;
    uint64_t v37 = 1;
    return __swift_storeEnumTagSinglePayload(v36, v37, 1, v38);
  }
  uint64_t result = sub_1A96319A0();
  unint64_t v33 = v47;
  if (v47 >> 60 != 15)
  {
    uint64_t v34 = v46;
    sub_1A9631440();
    uint64_t v35 = type metadata accessor for WeatherChange();
    sub_1A961B500(&qword_1EB6DB608, (void (*)(uint64_t))type metadata accessor for WeatherChange);
    sub_1A961B500(&qword_1EB6DB610, (void (*)(uint64_t))type metadata accessor for WeatherChange);
    sub_1A9631430();
    sub_1A9490CE8(v34, v33);
    uint64_t v36 = a2;
    uint64_t v37 = 0;
    uint64_t v38 = v35;
    return __swift_storeEnumTagSinglePayload(v36, v37, 1, v38);
  }
  __break(1u);
  return result;
}

uint64_t sub_1A95DBFEC@<X0>(char a1@<W0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_1A962E810();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  v7 = (char *)&v39 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6DE3A0);
  MEMORY[0x1F4188790](v8);
  v10 = (char *)&v39 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v11);
  v13 = (char *)&v39 - v12;
  MEMORY[0x1F4188790](v14);
  v16 = (char *)&v39 - v15;
  if ((sub_1A95DED0C() & 1) != 0 && (a1 & 1) == 0)
  {
    sub_1A96319A0();
    if (qword_1EB6DE388 != -1) {
      swift_once();
    }
    uint64_t v17 = sub_1A96317F0();
    __swift_project_value_buffer(v17, (uint64_t)qword_1EB6EB630);
    sub_1A944A348((uint64_t)v16, (uint64_t)v13, &qword_1EB6DE3A0);
    v18 = sub_1A96317D0();
    os_log_type_t v19 = sub_1A9632230();
    int v20 = v19;
    if (os_log_type_enabled(v18, v19))
    {
      uint64_t v21 = swift_slowAlloc();
      uint64_t v40 = v5;
      uint64_t v22 = v21;
      uint64_t v43 = swift_slowAlloc();
      v48[0] = v43;
      *(_DWORD *)uint64_t v22 = 136446722;
      os_log_t v42 = v18;
      uint64_t v44 = a2;
      swift_beginAccess();
      int v41 = v20;
      uint64_t v23 = qword_1E97EBA30;
      unint64_t v24 = off_1E97EBA38;
      sub_1A9631510();
      uint64_t v45 = sub_1A945C1DC(v23, (unint64_t)v24, v48);
      sub_1A9632350();
      swift_bridgeObjectRelease();
      *(_WORD *)(v22 + 12) = 2082;
      sub_1A944A348((uint64_t)v13, (uint64_t)v10, &qword_1EB6DE3A0);
      uint64_t v25 = sub_1A9631DC0();
      uint64_t v45 = sub_1A945C1DC(v25, v26, v48);
      sub_1A9632350();
      swift_bridgeObjectRelease();
      sub_1A944C480((uint64_t)v13, &qword_1EB6DE3A0);
      *(_WORD *)(v22 + 22) = 2082;
      a2 = v44;
      sub_1A962E7F0();
      sub_1A961B500((unint64_t *)&qword_1EB6DC720, MEMORY[0x1E4F27928]);
      uint64_t v27 = sub_1A96327B0();
      unint64_t v29 = v28;
      (*(void (**)(char *, uint64_t))(v40 + 8))(v7, v4);
      uint64_t v45 = sub_1A945C1DC(v27, v29, v48);
      sub_1A9632350();
      swift_bridgeObjectRelease();
      os_log_t v30 = v42;
      _os_log_impl(&dword_1A9410000, v42, (os_log_type_t)v41, "Data has expired, returning nil; model=%{public}s, expiration=%{public}s, now=%{public}s",
        (uint8_t *)v22,
        0x20u);
      uint64_t v31 = v43;
      swift_arrayDestroy();
      MEMORY[0x1AD0F7300](v31, -1, -1);
      MEMORY[0x1AD0F7300](v22, -1, -1);
    }
    else
    {

      sub_1A944C480((uint64_t)v13, &qword_1EB6DE3A0);
    }
    sub_1A944C480((uint64_t)v16, &qword_1EB6DE3A0);
    uint64_t v38 = type metadata accessor for WeatherComparisons();
    uint64_t v36 = a2;
    uint64_t v37 = 1;
    return __swift_storeEnumTagSinglePayload(v36, v37, 1, v38);
  }
  uint64_t result = sub_1A96319A0();
  unint64_t v33 = v47;
  if (v47 >> 60 != 15)
  {
    uint64_t v34 = v46;
    sub_1A9631440();
    uint64_t v35 = type metadata accessor for WeatherComparisons();
    sub_1A961B500(&qword_1EB6DA888, (void (*)(uint64_t))type metadata accessor for WeatherComparisons);
    sub_1A961B500(&qword_1EB6DA890, (void (*)(uint64_t))type metadata accessor for WeatherComparisons);
    sub_1A9631430();
    sub_1A9490CE8(v34, v33);
    uint64_t v36 = a2;
    uint64_t v37 = 0;
    uint64_t v38 = v35;
    return __swift_storeEnumTagSinglePayload(v36, v37, 1, v38);
  }
  __break(1u);
  return result;
}

uint64_t sub_1A95DC73C@<X0>(char a1@<W0>, void *a2@<X8>)
{
  uint64_t v4 = sub_1A962E810();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  v7 = (char *)&v36 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6DE3A0);
  MEMORY[0x1F4188790](v8);
  v10 = (char *)&v36 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v11);
  v13 = (char *)&v36 - v12;
  MEMORY[0x1F4188790](v14);
  v16 = (char *)&v36 - v15;
  if (sub_1A95DED0C() & 1) == 0 || (a1)
  {
    uint64_t result = sub_1A96319A0();
    unint64_t v34 = v44;
    if (v44 >> 60 == 15)
    {
      __break(1u);
    }
    else
    {
      uint64_t v35 = v43;
      sub_1A9631440();
      sub_1A961AB3C();
      sub_1A961AB88();
      sub_1A9631430();
      return sub_1A9490CE8(v35, v34);
    }
  }
  else
  {
    sub_1A96319A0();
    if (qword_1EB6DE388 != -1) {
      swift_once();
    }
    uint64_t v17 = sub_1A96317F0();
    __swift_project_value_buffer(v17, (uint64_t)qword_1EB6EB630);
    sub_1A944A348((uint64_t)v16, (uint64_t)v13, &qword_1EB6DE3A0);
    v18 = sub_1A96317D0();
    os_log_type_t v19 = sub_1A9632230();
    int v20 = v19;
    if (os_log_type_enabled(v18, v19))
    {
      uint64_t v21 = swift_slowAlloc();
      int v41 = a2;
      uint64_t v22 = v21;
      uint64_t v40 = swift_slowAlloc();
      v45[0] = v40;
      *(_DWORD *)uint64_t v22 = 136446722;
      os_log_t v39 = v18;
      uint64_t v37 = v5;
      swift_beginAccess();
      int v38 = v20;
      uint64_t v23 = qword_1E97EBAA8;
      unint64_t v24 = qword_1E97EBAB0;
      sub_1A9631510();
      uint64_t v42 = sub_1A945C1DC(v23, v24, v45);
      sub_1A9632350();
      swift_bridgeObjectRelease();
      *(_WORD *)(v22 + 12) = 2082;
      sub_1A944A348((uint64_t)v13, (uint64_t)v10, &qword_1EB6DE3A0);
      uint64_t v25 = sub_1A9631DC0();
      uint64_t v42 = sub_1A945C1DC(v25, v26, v45);
      sub_1A9632350();
      swift_bridgeObjectRelease();
      sub_1A944C480((uint64_t)v13, &qword_1EB6DE3A0);
      *(_WORD *)(v22 + 22) = 2082;
      sub_1A962E7F0();
      sub_1A961B500((unint64_t *)&qword_1EB6DC720, MEMORY[0x1E4F27928]);
      uint64_t v27 = sub_1A96327B0();
      unint64_t v29 = v28;
      (*(void (**)(char *, uint64_t))(v37 + 8))(v7, v4);
      uint64_t v42 = sub_1A945C1DC(v27, v29, v45);
      sub_1A9632350();
      swift_bridgeObjectRelease();
      os_log_t v30 = v39;
      _os_log_impl(&dword_1A9410000, v39, (os_log_type_t)v38, "Data has expired, returning nil; model=%{public}s, expiration=%{public}s, now=%{public}s",
        (uint8_t *)v22,
        0x20u);
      uint64_t v31 = v40;
      swift_arrayDestroy();
      MEMORY[0x1AD0F7300](v31, -1, -1);
      uint64_t v32 = v22;
      a2 = v41;
      MEMORY[0x1AD0F7300](v32, -1, -1);
    }
    else
    {

      sub_1A944C480((uint64_t)v13, &qword_1EB6DE3A0);
    }
    uint64_t result = sub_1A944C480((uint64_t)v16, &qword_1EB6DE3A0);
    *a2 = 0;
  }
  return result;
}

void sub_1A95DCDFC()
{
  OUTLINED_FUNCTION_6_10();
  int v2 = v1;
  sub_1A962E810();
  OUTLINED_FUNCTION_1();
  uint64_t v4 = v3;
  MEMORY[0x1F4188790](v5);
  OUTLINED_FUNCTION_6_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6DE3A0);
  OUTLINED_FUNCTION_10();
  MEMORY[0x1F4188790](v6);
  OUTLINED_FUNCTION_1_18();
  MEMORY[0x1F4188790](v7);
  uint64_t v9 = (char *)v31 - v8;
  MEMORY[0x1F4188790](v10);
  uint64_t v12 = (char *)v31 - v11;
  if ((sub_1A95DED0C() & 1) != 0 && (v2 & 1) == 0)
  {
    sub_1A96319A0();
    if (qword_1EB6DE388 != -1) {
      swift_once();
    }
    uint64_t v13 = sub_1A96317F0();
    __swift_project_value_buffer(v13, (uint64_t)qword_1EB6EB630);
    sub_1A944A348((uint64_t)v12, (uint64_t)v9, &qword_1EB6DE3A0);
    uint64_t v14 = sub_1A96317D0();
    os_log_type_t v15 = sub_1A9632230();
    if (OUTLINED_FUNCTION_88(v15))
    {
      uint64_t v16 = OUTLINED_FUNCTION_18_1();
      v31[1] = v4;
      uint64_t v17 = v16;
      uint64_t v34 = swift_slowAlloc();
      uint64_t v38 = v34;
      *(_DWORD *)uint64_t v17 = 136446722;
      os_log_t v33 = v14;
      OUTLINED_FUNCTION_74_2();
      int v32 = v2;
      uint64_t v18 = qword_1E97EB5E8;
      os_log_type_t v19 = off_1E97EB5F0;
      sub_1A9631510();
      uint64_t v37 = sub_1A945C1DC(v18, (unint64_t)v19, &v38);
      sub_1A9632350();
      swift_bridgeObjectRelease();
      *(_WORD *)(v17 + 12) = 2082;
      sub_1A944A348((uint64_t)v9, v0, &qword_1EB6DE3A0);
      uint64_t v20 = sub_1A9631DC0();
      uint64_t v37 = sub_1A945C1DC(v20, v21, &v38);
      sub_1A9632350();
      swift_bridgeObjectRelease();
      sub_1A944C480((uint64_t)v9, &qword_1EB6DE3A0);
      *(_WORD *)(v17 + 22) = 2082;
      sub_1A962E7F0();
      sub_1A961B500((unint64_t *)&qword_1EB6DC720, MEMORY[0x1E4F27928]);
      uint64_t v22 = sub_1A96327B0();
      unint64_t v24 = v23;
      OUTLINED_FUNCTION_34();
      v25();
      uint64_t v37 = sub_1A945C1DC(v22, v24, &v38);
      sub_1A9632350();
      swift_bridgeObjectRelease();
      os_log_t v26 = v33;
      _os_log_impl(&dword_1A9410000, v33, (os_log_type_t)v32, "Data has expired, returning nil; model=%{public}s, expiration=%{public}s, now=%{public}s",
        (uint8_t *)v17,
        0x20u);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_3_1();
      OUTLINED_FUNCTION_3_1();
    }
    else
    {

      sub_1A944C480((uint64_t)v9, &qword_1EB6DE3A0);
    }
    sub_1A944C480((uint64_t)v12, &qword_1EB6DE3A0);
    goto LABEL_11;
  }
  sub_1A96319A0();
  unint64_t v27 = v36;
  OUTLINED_FUNCTION_103_0();
  if (!(!v29 & v28))
  {
    uint64_t v30 = v35;
    sub_1A9631440();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB6DA5A0);
    sub_1A961B490(&qword_1EB6DA998);
    sub_1A961B490(&qword_1EB6DA9A0);
    sub_1A9631430();
    sub_1A9490CE8(v30, v27);
LABEL_11:
    OUTLINED_FUNCTION_7_1();
    return;
  }
  __break(1u);
}

uint64_t sub_1A95DD424(char a1)
{
  uint64_t v2 = sub_1A962E810();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  uint64_t v5 = (char *)&v33 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6DE3A0);
  MEMORY[0x1F4188790](v6);
  uint64_t v8 = (char *)&v33 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v9);
  uint64_t v11 = (char *)&v33 - v10;
  MEMORY[0x1F4188790](v12);
  uint64_t v14 = (char *)&v33 - v13;
  if (sub_1A95DED0C() & 1) == 0 || (a1)
  {
    uint64_t result = sub_1A96319A0();
    unint64_t v31 = v39;
    if (v39 >> 60 == 15)
    {
      __break(1u);
    }
    else
    {
      uint64_t v32 = v38;
      sub_1A9631440();
      type metadata accessor for CLLocationCoordinate2D(0);
      sub_1A961B500(&qword_1E97ED220, type metadata accessor for CLLocationCoordinate2D);
      sub_1A961B500(&qword_1E97ED228, type metadata accessor for CLLocationCoordinate2D);
      sub_1A9631430();
      sub_1A9490CE8(v32, v31);
      return v41;
    }
  }
  else
  {
    sub_1A96319A0();
    if (qword_1EB6DE388 != -1) {
      swift_once();
    }
    uint64_t v15 = sub_1A96317F0();
    __swift_project_value_buffer(v15, (uint64_t)qword_1EB6EB630);
    sub_1A944A348((uint64_t)v14, (uint64_t)v11, &qword_1EB6DE3A0);
    uint64_t v16 = sub_1A96317D0();
    os_log_type_t v17 = sub_1A9632230();
    int v18 = v17;
    if (os_log_type_enabled(v16, v17))
    {
      uint64_t v19 = swift_slowAlloc();
      uint64_t v34 = v3;
      uint64_t v20 = v19;
      uint64_t v37 = swift_slowAlloc();
      uint64_t v41 = v37;
      *(_DWORD *)uint64_t v20 = 136446722;
      os_log_t v36 = v16;
      swift_beginAccess();
      int v35 = v18;
      uint64_t v21 = *(void *)aMarinelocation_2;
      unint64_t v22 = *(void *)&aMarinelocation_2[8];
      sub_1A9631510();
      uint64_t v40 = sub_1A945C1DC(v21, v22, &v41);
      sub_1A9632350();
      swift_bridgeObjectRelease();
      *(_WORD *)(v20 + 12) = 2082;
      sub_1A944A348((uint64_t)v11, (uint64_t)v8, &qword_1EB6DE3A0);
      uint64_t v23 = sub_1A9631DC0();
      uint64_t v40 = sub_1A945C1DC(v23, v24, &v41);
      sub_1A9632350();
      swift_bridgeObjectRelease();
      sub_1A944C480((uint64_t)v11, &qword_1EB6DE3A0);
      *(_WORD *)(v20 + 22) = 2082;
      sub_1A962E7F0();
      sub_1A961B500((unint64_t *)&qword_1EB6DC720, MEMORY[0x1E4F27928]);
      uint64_t v25 = sub_1A96327B0();
      unint64_t v27 = v26;
      (*(void (**)(char *, uint64_t))(v34 + 8))(v5, v2);
      uint64_t v40 = sub_1A945C1DC(v25, v27, &v41);
      sub_1A9632350();
      swift_bridgeObjectRelease();
      os_log_t v28 = v36;
      _os_log_impl(&dword_1A9410000, v36, (os_log_type_t)v35, "Data has expired, returning nil; model=%{public}s, expiration=%{public}s, now=%{public}s",
        (uint8_t *)v20,
        0x20u);
      uint64_t v29 = v37;
      swift_arrayDestroy();
      MEMORY[0x1AD0F7300](v29, -1, -1);
      MEMORY[0x1AD0F7300](v20, -1, -1);
    }
    else
    {

      sub_1A944C480((uint64_t)v11, &qword_1EB6DE3A0);
    }
    sub_1A944C480((uint64_t)v14, &qword_1EB6DE3A0);
    return 0;
  }
  return result;
}

void sub_1A95DDB44()
{
  OUTLINED_FUNCTION_6_10();
  OUTLINED_FUNCTION_87_2();
  OUTLINED_FUNCTION_1();
  MEMORY[0x1F4188790](v3);
  OUTLINED_FUNCTION_26();
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6DE3A0);
  OUTLINED_FUNCTION_10();
  MEMORY[0x1F4188790](v5);
  OUTLINED_FUNCTION_5_23();
  MEMORY[0x1F4188790](v6);
  OUTLINED_FUNCTION_280();
  MEMORY[0x1F4188790](v7);
  if ((OUTLINED_FUNCTION_90_1() & 1) != 0 && (v2 & 1) == 0)
  {
    OUTLINED_FUNCTION_145_0();
    if (qword_1EB6DE388 != -1) {
      swift_once();
    }
    uint64_t v8 = sub_1A96317F0();
    uint64_t v9 = __swift_project_value_buffer(v8, (uint64_t)qword_1EB6EB630);
    OUTLINED_FUNCTION_147_0(v9, v10, &qword_1EB6DE3A0);
    uint64_t v11 = (void *)sub_1A96317D0();
    os_log_type_t v12 = sub_1A9632230();
    if (OUTLINED_FUNCTION_38_2(v12))
    {
      OUTLINED_FUNCTION_18_1();
      OUTLINED_FUNCTION_81_1();
      OUTLINED_FUNCTION_83_2(4.8754e-34);
      OUTLINED_FUNCTION_74_2();
      OUTLINED_FUNCTION_112_0();
      uint64_t v13 = OUTLINED_FUNCTION_108_0();
      OUTLINED_FUNCTION_37_6(v13);
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_80_2();
      OUTLINED_FUNCTION_113_0();
      uint64_t v14 = OUTLINED_FUNCTION_148_0();
      OUTLINED_FUNCTION_132_0(v14, v15);
      OUTLINED_FUNCTION_47_4();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_114_0();
      OUTLINED_FUNCTION_64_2();
      sub_1A961B500((unint64_t *)&qword_1EB6DC720, MEMORY[0x1E4F27928]);
      OUTLINED_FUNCTION_82_2();
      uint64_t v16 = OUTLINED_FUNCTION_33_6();
      v17(v16);
      uint64_t v18 = OUTLINED_FUNCTION_109();
      OUTLINED_FUNCTION_63_2(v18);
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_62_2(&dword_1A9410000, v19, v20, "Data has expired, returning nil; model=%{public}s, expiration=%{public}s, now=%{public}s");
      OUTLINED_FUNCTION_78_2();
      OUTLINED_FUNCTION_3_1();
      OUTLINED_FUNCTION_3_1();

      uint64_t v21 = v1;
      unint64_t v22 = (uint64_t *)v4;
    }
    else
    {

      OUTLINED_FUNCTION_134_0();
      uint64_t v21 = OUTLINED_FUNCTION_38_1();
    }
    sub_1A944C480(v21, v22);
    type metadata accessor for DailyWeatherStatistics();
    uint64_t v38 = OUTLINED_FUNCTION_49_4();
LABEL_19:
    __swift_storeEnumTagSinglePayload(v38, v39, v40, v41);
    OUTLINED_FUNCTION_7_1();
    return;
  }
  sub_1A96319A0();
  OUTLINED_FUNCTION_103_0();
  if (!(!v24 & v23))
  {
    sub_1A9631440();
    OUTLINED_FUNCTION_51_4();
    type metadata accessor for DailyWeatherStatistics();
    sub_1A961B500(&qword_1E97ED2C0, (void (*)(uint64_t))type metadata accessor for DailyWeatherStatistics);
    sub_1A961B500(&qword_1E97ED2C8, (void (*)(uint64_t))type metadata accessor for DailyWeatherStatistics);
    OUTLINED_FUNCTION_17_14();
    uint64_t v25 = OUTLINED_FUNCTION_53_2();
    if (type metadata accessor for DailyWeatherStatistics)
    {
      sub_1A9490CE8(v25, v26);
      if (qword_1EB6DE388 != -1) {
        swift_once();
      }
      uint64_t v27 = sub_1A96317F0();
      OUTLINED_FUNCTION_293(v27, (uint64_t)qword_1EB6EB630);
      os_log_t v28 = type metadata accessor for DailyWeatherStatistics;
      uint64_t v29 = (void *)sub_1A96317D0();
      os_log_type_t v30 = sub_1A9632220();
      if (OUTLINED_FUNCTION_88(v30))
      {
        OUTLINED_FUNCTION_43();
        uint64_t v31 = OUTLINED_FUNCTION_94_1();
        OUTLINED_FUNCTION_138_0(v31);
        OUTLINED_FUNCTION_157_0(4.8752e-34);
        OUTLINED_FUNCTION_74_2();
        sub_1A9631510();
        uint64_t v32 = OUTLINED_FUNCTION_107();
        OUTLINED_FUNCTION_53_3(v32);
        swift_bridgeObjectRelease();
        OUTLINED_FUNCTION_65_1();
        __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6DDB00);
        uint64_t v33 = OUTLINED_FUNCTION_110_0();
        uint64_t v35 = OUTLINED_FUNCTION_155_0(v33, v34);
        OUTLINED_FUNCTION_73_2(v35);
        swift_bridgeObjectRelease();

        OUTLINED_FUNCTION_60_2(&dword_1A9410000, v36, v37, "Unable to parse data model from cache; model=%{public}s, error=%{public}s");
        OUTLINED_FUNCTION_77_2();
        OUTLINED_FUNCTION_3_1();
        OUTLINED_FUNCTION_3_1();
      }
      else
      {
      }
      OUTLINED_FUNCTION_139();
    }
    else
    {
      OUTLINED_FUNCTION_130_0(v25, v26);
    }
    OUTLINED_FUNCTION_142_0();
    goto LABEL_19;
  }
  __break(1u);
}

void sub_1A95DDFB0()
{
  OUTLINED_FUNCTION_6_10();
  OUTLINED_FUNCTION_87_2();
  OUTLINED_FUNCTION_1();
  uint64_t v5 = v4;
  MEMORY[0x1F4188790](v6);
  OUTLINED_FUNCTION_26();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6DE3A0);
  OUTLINED_FUNCTION_10();
  MEMORY[0x1F4188790](v7);
  OUTLINED_FUNCTION_5_23();
  MEMORY[0x1F4188790](v8);
  OUTLINED_FUNCTION_280();
  MEMORY[0x1F4188790](v9);
  if ((OUTLINED_FUNCTION_90_1() & 1) != 0 && (v2 & 1) == 0)
  {
    OUTLINED_FUNCTION_145_0();
    if (qword_1EB6DE388 != -1) {
      swift_once();
    }
    uint64_t v10 = sub_1A96317F0();
    uint64_t v11 = __swift_project_value_buffer(v10, (uint64_t)qword_1EB6EB630);
    OUTLINED_FUNCTION_147_0(v11, v12, &qword_1EB6DE3A0);
    uint64_t v13 = sub_1A96317D0();
    os_log_type_t v14 = sub_1A9632230();
    if (OUTLINED_FUNCTION_38_2(v14))
    {
      OUTLINED_FUNCTION_18_1();
      v48[0] = OUTLINED_FUNCTION_81_1();
      *(_DWORD *)uint64_t v5 = 136446722;
      unint64_t v47 = v13;
      os_log_type_t v46 = v2;
      uint64_t v16 = qword_1E97EBCA8;
      unint64_t v15 = off_1E97EBCB0;
      sub_1A9631510();
      sub_1A945C1DC(v16, (unint64_t)v15, v48);
      sub_1A9632350();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_80_2();
      sub_1A944A348(v3, v0, &qword_1EB6DE3A0);
      uint64_t v17 = OUTLINED_FUNCTION_148_0();
      OUTLINED_FUNCTION_132_0(v17, v18);
      sub_1A9632350();
      swift_bridgeObjectRelease();
      sub_1A944C480(v3, &qword_1EB6DE3A0);
      *(_WORD *)(v5 + 22) = 2082;
      sub_1A962E7F0();
      sub_1A961B500((unint64_t *)&qword_1EB6DC720, MEMORY[0x1E4F27928]);
      uint64_t v19 = OUTLINED_FUNCTION_82_2();
      unint64_t v21 = v20;
      OUTLINED_FUNCTION_34();
      v22();
      sub_1A945C1DC(v19, v21, v48);
      sub_1A9632350();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1A9410000, v47, v46, "Data has expired, returning nil; model=%{public}s, expiration=%{public}s, now=%{public}s",
        (uint8_t *)v5,
        0x20u);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_3_1();
      OUTLINED_FUNCTION_3_1();

      uint64_t v23 = v1;
      char v24 = &qword_1EB6DE3A0;
    }
    else
    {

      OUTLINED_FUNCTION_134_0();
      uint64_t v23 = OUTLINED_FUNCTION_38_1();
    }
    sub_1A944C480(v23, v24);
    type metadata accessor for HourlyWeatherStatistics();
    uint64_t v42 = OUTLINED_FUNCTION_49_4();
LABEL_19:
    __swift_storeEnumTagSinglePayload(v42, v43, v44, v45);
    OUTLINED_FUNCTION_7_1();
    return;
  }
  sub_1A96319A0();
  uint64_t v25 = v48[1];
  OUTLINED_FUNCTION_103_0();
  if (!(!v27 & v26))
  {
    sub_1A9631440();
    OUTLINED_FUNCTION_51_4();
    type metadata accessor for HourlyWeatherStatistics();
    sub_1A961B500(&qword_1E97ED290, (void (*)(uint64_t))type metadata accessor for HourlyWeatherStatistics);
    sub_1A961B500(&qword_1E97ED298, (void (*)(uint64_t))type metadata accessor for HourlyWeatherStatistics);
    OUTLINED_FUNCTION_17_14();
    uint64_t v28 = OUTLINED_FUNCTION_53_2();
    if (type metadata accessor for HourlyWeatherStatistics)
    {
      sub_1A9490CE8(v28, v29);
      if (qword_1EB6DE388 != -1) {
        swift_once();
      }
      uint64_t v30 = sub_1A96317F0();
      OUTLINED_FUNCTION_293(v30, (uint64_t)qword_1EB6EB630);
      uint64_t v31 = type metadata accessor for HourlyWeatherStatistics;
      uint64_t v32 = (void *)sub_1A96317D0();
      os_log_type_t v33 = sub_1A9632220();
      if (OUTLINED_FUNCTION_88(v33))
      {
        OUTLINED_FUNCTION_43();
        uint64_t v34 = OUTLINED_FUNCTION_94_1();
        OUTLINED_FUNCTION_138_0(v34);
        OUTLINED_FUNCTION_157_0(4.8752e-34);
        uint64_t v35 = qword_1E97EBCA8;
        uint64_t v36 = off_1E97EBCB0;
        sub_1A9631510();
        sub_1A945C1DC(v35, (unint64_t)v36, v48);
        sub_1A9632350();
        swift_bridgeObjectRelease();
        *(_WORD *)(v25 + 12) = 2082;
        uint64_t v37 = type metadata accessor for HourlyWeatherStatistics;
        __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6DDB00);
        uint64_t v38 = sub_1A9631DC0();
        OUTLINED_FUNCTION_155_0(v38, v39);
        sub_1A9632350();
        swift_bridgeObjectRelease();

        OUTLINED_FUNCTION_60_2(&dword_1A9410000, v40, v41, "Unable to parse data model from cache; model=%{public}s, error=%{public}s");
        OUTLINED_FUNCTION_77_2();
        OUTLINED_FUNCTION_3_1();
        OUTLINED_FUNCTION_3_1();
      }
      else
      {
      }
      OUTLINED_FUNCTION_139();
    }
    else
    {
      OUTLINED_FUNCTION_130_0(v28, v29);
    }
    OUTLINED_FUNCTION_142_0();
    goto LABEL_19;
  }
  __break(1u);
}

void sub_1A95DE530()
{
  OUTLINED_FUNCTION_6_10();
  OUTLINED_FUNCTION_87_2();
  OUTLINED_FUNCTION_1();
  MEMORY[0x1F4188790](v3);
  OUTLINED_FUNCTION_26();
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6DE3A0);
  OUTLINED_FUNCTION_10();
  MEMORY[0x1F4188790](v5);
  OUTLINED_FUNCTION_5_23();
  MEMORY[0x1F4188790](v6);
  OUTLINED_FUNCTION_280();
  MEMORY[0x1F4188790](v7);
  if ((OUTLINED_FUNCTION_90_1() & 1) != 0 && (v2 & 1) == 0)
  {
    OUTLINED_FUNCTION_145_0();
    if (qword_1EB6DE388 != -1) {
      swift_once();
    }
    uint64_t v8 = sub_1A96317F0();
    uint64_t v9 = __swift_project_value_buffer(v8, (uint64_t)qword_1EB6EB630);
    OUTLINED_FUNCTION_147_0(v9, v10, &qword_1EB6DE3A0);
    uint64_t v11 = (void *)sub_1A96317D0();
    os_log_type_t v12 = sub_1A9632230();
    if (OUTLINED_FUNCTION_38_2(v12))
    {
      OUTLINED_FUNCTION_18_1();
      OUTLINED_FUNCTION_81_1();
      OUTLINED_FUNCTION_83_2(4.8754e-34);
      OUTLINED_FUNCTION_74_2();
      OUTLINED_FUNCTION_112_0();
      uint64_t v13 = OUTLINED_FUNCTION_108_0();
      OUTLINED_FUNCTION_37_6(v13);
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_80_2();
      OUTLINED_FUNCTION_113_0();
      uint64_t v14 = OUTLINED_FUNCTION_148_0();
      OUTLINED_FUNCTION_132_0(v14, v15);
      OUTLINED_FUNCTION_47_4();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_114_0();
      OUTLINED_FUNCTION_64_2();
      sub_1A961B500((unint64_t *)&qword_1EB6DC720, MEMORY[0x1E4F27928]);
      OUTLINED_FUNCTION_82_2();
      uint64_t v16 = OUTLINED_FUNCTION_33_6();
      v17(v16);
      uint64_t v18 = OUTLINED_FUNCTION_109();
      OUTLINED_FUNCTION_63_2(v18);
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_62_2(&dword_1A9410000, v19, v20, "Data has expired, returning nil; model=%{public}s, expiration=%{public}s, now=%{public}s");
      OUTLINED_FUNCTION_78_2();
      OUTLINED_FUNCTION_3_1();
      OUTLINED_FUNCTION_3_1();

      uint64_t v21 = v1;
      unint64_t v22 = (uint64_t *)v4;
    }
    else
    {

      OUTLINED_FUNCTION_134_0();
      uint64_t v21 = OUTLINED_FUNCTION_38_1();
    }
    sub_1A944C480(v21, v22);
    type metadata accessor for MonthlyWeatherStatistics();
    uint64_t v38 = OUTLINED_FUNCTION_49_4();
LABEL_19:
    __swift_storeEnumTagSinglePayload(v38, v39, v40, v41);
    OUTLINED_FUNCTION_7_1();
    return;
  }
  sub_1A96319A0();
  OUTLINED_FUNCTION_103_0();
  if (!(!v24 & v23))
  {
    sub_1A9631440();
    OUTLINED_FUNCTION_51_4();
    type metadata accessor for MonthlyWeatherStatistics();
    sub_1A961B500(&qword_1E97ED280, (void (*)(uint64_t))type metadata accessor for MonthlyWeatherStatistics);
    sub_1A961B500(&qword_1E97ED288, (void (*)(uint64_t))type metadata accessor for MonthlyWeatherStatistics);
    OUTLINED_FUNCTION_17_14();
    uint64_t v25 = OUTLINED_FUNCTION_53_2();
    if (type metadata accessor for MonthlyWeatherStatistics)
    {
      sub_1A9490CE8(v25, v26);
      if (qword_1EB6DE388 != -1) {
        swift_once();
      }
      uint64_t v27 = sub_1A96317F0();
      OUTLINED_FUNCTION_293(v27, (uint64_t)qword_1EB6EB630);
      uint64_t v28 = type metadata accessor for MonthlyWeatherStatistics;
      unint64_t v29 = (void *)sub_1A96317D0();
      os_log_type_t v30 = sub_1A9632220();
      if (OUTLINED_FUNCTION_88(v30))
      {
        OUTLINED_FUNCTION_43();
        uint64_t v31 = OUTLINED_FUNCTION_94_1();
        OUTLINED_FUNCTION_138_0(v31);
        OUTLINED_FUNCTION_157_0(4.8752e-34);
        OUTLINED_FUNCTION_74_2();
        sub_1A9631510();
        uint64_t v32 = OUTLINED_FUNCTION_107();
        OUTLINED_FUNCTION_53_3(v32);
        swift_bridgeObjectRelease();
        OUTLINED_FUNCTION_65_1();
        __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6DDB00);
        uint64_t v33 = OUTLINED_FUNCTION_110_0();
        uint64_t v35 = OUTLINED_FUNCTION_155_0(v33, v34);
        OUTLINED_FUNCTION_73_2(v35);
        swift_bridgeObjectRelease();

        OUTLINED_FUNCTION_60_2(&dword_1A9410000, v36, v37, "Unable to parse data model from cache; model=%{public}s, error=%{public}s");
        OUTLINED_FUNCTION_77_2();
        OUTLINED_FUNCTION_3_1();
        OUTLINED_FUNCTION_3_1();
      }
      else
      {
      }
      OUTLINED_FUNCTION_139();
    }
    else
    {
      OUTLINED_FUNCTION_130_0(v25, v26);
    }
    OUTLINED_FUNCTION_142_0();
    goto LABEL_19;
  }
  __break(1u);
}

uint64_t sub_1A95DE99C@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *(void *)(a1 + 16);
  if (v3)
  {
    uint64_t v4 = 0;
    uint64_t v5 = (uint64_t *)(a1 + 32);
    do
    {
      uint64_t v7 = *v5++;
      uint64_t v6 = v7;
      if ((v7 & ~v4) == 0) {
        uint64_t v6 = 0;
      }
      v4 |= v6;
      --v3;
    }
    while (v3);
  }
  else
  {
    uint64_t v4 = 0;
  }
  uint64_t result = swift_bridgeObjectRelease();
  *a2 = v4;
  return result;
}

uint64_t sub_1A95DE9F4(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t result = MEMORY[0x1E4FBC860];
  if (v2)
  {
    uint64_t v15 = MEMORY[0x1E4FBC860];
    sub_1A944C5FC(0, v2, 0);
    uint64_t result = v15;
    uint64_t v4 = (unsigned __int8 *)(a1 + 32);
    unint64_t v5 = (unint64_t)"castDaily";
    unint64_t v6 = (unint64_t)"forecastNextHour";
    do
    {
      int v7 = *v4++;
      unint64_t v8 = 0xEA00000000007974;
      unint64_t v9 = 0x696C617551726961;
      switch(v7)
      {
        case 1:
          unint64_t v8 = 0xEE00726568746165;
          unint64_t v9 = 0x57746E6572727563;
          break;
        case 2:
          unint64_t v8 = 0xED0000796C696144;
          goto LABEL_7;
        case 3:
          unint64_t v8 = 0xEE00796C72756F48;
LABEL_7:
          unint64_t v9 = 0x7473616365726F66;
          break;
        case 4:
          unint64_t v8 = v5 | 0x8000000000000000;
          goto LABEL_10;
        case 5:
          unint64_t v8 = v6 | 0x8000000000000000;
LABEL_10:
          unint64_t v9 = 0xD000000000000010;
          break;
        case 6:
          unint64_t v8 = 0xEC0000006F666E49;
          unint64_t v9 = 0x6E6F697461636F6CLL;
          break;
        case 7:
          unint64_t v8 = 0xEE00747361636572;
          unint64_t v9 = 0x6F46656E6972616DLL;
          break;
        case 8:
          unint64_t v8 = 0xE400000000000000;
          unint64_t v9 = 1937204590;
          break;
        case 9:
          unint64_t v8 = 0xED0000737472656CLL;
          unint64_t v9 = 0x4172656874616577;
          break;
        case 10:
          unint64_t v8 = 0xED000065676E6168;
          goto LABEL_17;
        case 11:
          unint64_t v8 = 0xEE007365676E6168;
LABEL_17:
          unint64_t v9 = 0x4372656874616577;
          break;
        case 12:
          unint64_t v9 = 0x6E65764565646974;
          unint64_t v8 = 0xEA00000000007374;
          break;
        case 13:
          unint64_t v8 = 0xEF6E6F7369726170;
          unint64_t v9 = 0x6D6F43646E657274;
          break;
        case 14:
          unint64_t v9 = 0xD000000000000015;
          unint64_t v8 = 0x80000001A9645040;
          break;
        case 15:
          unint64_t v8 = 0xEF73746361466C61;
          unint64_t v9 = 0x6369726F74736968;
          break;
        default:
          break;
      }
      uint64_t v16 = result;
      unint64_t v11 = *(void *)(result + 16);
      unint64_t v10 = *(void *)(result + 24);
      if (v11 >= v10 >> 1)
      {
        uint64_t v13 = (const char *)v6;
        uint64_t v14 = (char *)v5;
        sub_1A944C5FC(v10 > 1, v11 + 1, 1);
        unint64_t v6 = (unint64_t)v13;
        unint64_t v5 = (unint64_t)v14;
        uint64_t result = v16;
      }
      *(void *)(result + 16) = v11 + 1;
      uint64_t v12 = result + 16 * v11;
      *(void *)(v12 + 32) = v9;
      *(void *)(v12 + 40) = v8;
      --v2;
    }
    while (v2);
  }
  return result;
}

uint64_t sub_1A95DED0C()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6DE3A0);
  uint64_t v2 = OUTLINED_FUNCTION_2_0(v1);
  MEMORY[0x1F4188790](v2);
  OUTLINED_FUNCTION_5_25();
  uint64_t v3 = sub_1A962E810();
  OUTLINED_FUNCTION_1();
  uint64_t v5 = v4;
  MEMORY[0x1F4188790](v6);
  OUTLINED_FUNCTION_6_0();
  sub_1A962E7F0();
  sub_1A96319A0();
  uint64_t result = __swift_getEnumTagSinglePayload(v0, 1, v3);
  if (result == 1)
  {
    __break(1u);
  }
  else
  {
    sub_1A961B500((unint64_t *)&qword_1EB6DC740, MEMORY[0x1E4F27928]);
    char v8 = sub_1A9631D10();
    unint64_t v9 = *(void (**)(void))(v5 + 8);
    OUTLINED_FUNCTION_103();
    v9();
    OUTLINED_FUNCTION_103();
    v9();
    return (v8 & 1) == 0;
  }
  return result;
}

void sub_1A95DEE64()
{
  OUTLINED_FUNCTION_3();
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6DDBD8);
  uint64_t v7 = OUTLINED_FUNCTION_2_0(v6);
  MEMORY[0x1F4188790](v7);
  uint64_t v8 = OUTLINED_FUNCTION_102_0();
  OUTLINED_FUNCTION_1();
  uint64_t v10 = v9;
  MEMORY[0x1F4188790](v11);
  OUTLINED_FUNCTION_2_26();
  sub_1A9631960();
  v13[3] = MEMORY[0x1E4FBB1A0];
  v13[4] = MEMORY[0x1E4FAA778];
  v13[0] = v5;
  v13[1] = v3;
  sub_1A9631510();
  OUTLINED_FUNCTION_156_0();
  sub_1A96318F0();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v13);
  uint64_t v12 = sub_1A96319F0();
  __swift_storeEnumTagSinglePayload(v0, 1, 1, v12);
  sub_1A9631930();
  swift_release();
  sub_1A944C480(v0, &qword_1EB6DDBD8);
  (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v1, v8);
  OUTLINED_FUNCTION_4_0();
}

void sub_1A95DEFC0()
{
  OUTLINED_FUNCTION_3();
  uint64_t v28 = v3;
  uint64_t v29 = v4;
  uint64_t v6 = v5;
  uint64_t v27 = v7;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6DDBD8);
  uint64_t v9 = OUTLINED_FUNCTION_2_0(v8);
  MEMORY[0x1F4188790](v9);
  uint64_t v10 = OUTLINED_FUNCTION_102_0();
  OUTLINED_FUNCTION_1();
  uint64_t v12 = v11;
  MEMORY[0x1F4188790](v13);
  OUTLINED_FUNCTION_99_0();
  MEMORY[0x1F4188790](v14);
  uint64_t v16 = (char *)v26 - v15;
  MEMORY[0x1F4188790](v17);
  OUTLINED_FUNCTION_32_6();
  v26[1] = sub_1A9631960();
  uint64_t v18 = MEMORY[0x1E4FBB1A0];
  uint64_t v19 = MEMORY[0x1E4FAA778];
  uint64_t v32 = MEMORY[0x1E4FBB1A0];
  uint64_t v33 = MEMORY[0x1E4FAA778];
  uint64_t v30 = v27;
  uint64_t v31 = v6;
  sub_1A9631510();
  OUTLINED_FUNCTION_156_0();
  sub_1A9631900();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v30);
  uint64_t v32 = v18;
  uint64_t v33 = v19;
  uint64_t v30 = v28;
  uint64_t v31 = v29;
  sub_1A9631510();
  OUTLINED_FUNCTION_156_0();
  sub_1A96318B0();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v30);
  sub_1A96318E0();
  uint64_t v20 = *(void (**)(uint64_t, uint64_t))(v12 + 8);
  uint64_t v21 = v2;
  uint64_t v22 = v10;
  v20(v21, v10);
  v20((uint64_t)v16, v10);
  *uint64_t v0 = 0x73657269707865;
  v0[1] = 0xE700000000000000;
  uint64_t v23 = *MEMORY[0x1E4FAA6D8];
  uint64_t v24 = sub_1A96319F0();
  OUTLINED_FUNCTION_10();
  (*(void (**)(void *, uint64_t, uint64_t))(v25 + 104))(v0, v23, v24);
  __swift_storeEnumTagSinglePayload((uint64_t)v0, 0, 1, v24);
  sub_1A9631940();
  swift_release();
  sub_1A944C480((uint64_t)v0, &qword_1EB6DDBD8);
  v20(v1, v22);
  OUTLINED_FUNCTION_4_0();
}

uint64_t sub_1A95DF21C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, NSObject *a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v166 = a4;
  uint64_t v161 = a5;
  uint64_t v8 = type metadata accessor for WeatherRequestOptions();
  MEMORY[0x1F4188790](v8);
  uint64_t v159 = (uint64_t)&v140 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6DD258);
  MEMORY[0x1F4188790](v10 - 8);
  uint64_t v153 = (uint64_t)&v140 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v160 = type metadata accessor for MarineForecast();
  MEMORY[0x1F4188790](v160);
  v155 = (uint64_t *)((char *)&v140 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v164 = sub_1A962E810();
  uint64_t v156 = *(void *)(v164 - 8);
  MEMORY[0x1F4188790](v164);
  v148 = (char *)&v140 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v14);
  v150 = (char *)&v140 - v15;
  MEMORY[0x1F4188790](v16);
  v149 = (char *)&v140 - v17;
  MEMORY[0x1F4188790](v18);
  v151 = (char *)&v140 - v19;
  MEMORY[0x1F4188790](v20);
  v152 = (char *)&v140 - v21;
  MEMORY[0x1F4188790](v22);
  v154 = (char *)&v140 - v23;
  MEMORY[0x1F4188790](v24);
  v158 = (char *)&v140 - v25;
  MEMORY[0x1F4188790](v26);
  v157 = (char *)&v140 - v27;
  uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6DD120);
  MEMORY[0x1F4188790](v28 - 8);
  uint64_t v30 = (char *)&v140 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v31);
  uint64_t v33 = (char *)&v140 - v32;
  uint64_t v34 = type metadata accessor for WeatherRequestMarineHourlyRelativeRange();
  MEMORY[0x1F4188790](v34);
  uint64_t v36 = (char *)&v140 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0);
  os_log_t v162 = a3;
  os_log_t v163 = (os_log_t)v8;
  uint64_t v37 = *(uint64_t *)((char *)&a3->isa + *(int *)(v8 + 64));
  uint64_t v38 = a1;
  uint64_t v39 = a1;
  uint64_t v40 = a2;
  uint64_t v41 = sub_1A95680E0((uint64_t)a3, v39, a2);
  unint64_t v43 = v42;
  uint64_t v44 = v165;
  sub_1A95DEE64();
  uint64_t v165 = v44;
  if (v44) {
    return swift_bridgeObjectRelease();
  }
  uint64_t v146 = v37;
  uint64_t v145 = v34;
  v143 = v30;
  uint64_t v140 = v38;
  uint64_t v141 = v40;
  uint64_t v144 = v41;
  unint64_t v147 = v43;
  v142 = v36;
  uint64_t v46 = v164;
  uint64_t v47 = v167;
  if (v167)
  {
    uint64_t v172 = v167;
    uint64_t v173 = v168;
    uint64_t v174 = v169;
    uint64_t v175 = v170;
    uint64_t v176 = v171;
    swift_bridgeObjectRelease();
    sub_1A95D9B5C(v146, v161);
    return sub_1A948A95C(v47);
  }
  os_log_t v48 = v163;
  os_log_t v49 = v162;
  char v50 = v146;
  if ((v146 & 2) == 0) {
    goto LABEL_8;
  }
  sub_1A944A348((uint64_t)v162 + SLODWORD(v163[6].isa), (uint64_t)v33, &qword_1EB6DD120);
  if (__swift_getEnumTagSinglePayload((uint64_t)v33, 1, v145) == 1)
  {
    sub_1A944C480((uint64_t)v33, &qword_1EB6DD120);
LABEL_8:
    if (qword_1EB6DE388 != -1) {
      swift_once();
    }
    uint64_t v51 = sub_1A96317F0();
    __swift_project_value_buffer(v51, (uint64_t)qword_1EB6EB630);
    uint64_t v52 = (uint64_t)v49;
    uint64_t v53 = v159;
    sub_1A961B118(v52, v159);
    sub_1A9631510();
    v54 = sub_1A96317D0();
    os_log_type_t v55 = sub_1A9632230();
    int v56 = v55;
    if (os_log_type_enabled(v54, v55))
    {
      uint64_t v57 = swift_slowAlloc();
      LODWORD(v164) = v56;
      uint64_t v58 = v57;
      uint64_t v166 = swift_slowAlloc();
      uint64_t v167 = v166;
      *(_DWORD *)uint64_t v58 = 136316163;
      uint64_t v177 = sub_1A945C1DC(0x4620656E6972614DLL, 0xEF7473616365726FLL, &v167);
      uint64_t v59 = v53;
      sub_1A9632350();
      *(_WORD *)(v58 + 12) = 1024;
      LODWORD(v177) = (unint64_t)(v50 & 2) >> 1;
      sub_1A9632350();
      *(_WORD *)(v58 + 18) = 1024;
      uint64_t v60 = (uint64_t)v143;
      sub_1A944A348(v53 + SLODWORD(v48[6].isa), (uint64_t)v143, &qword_1EB6DD120);
      BOOL v61 = __swift_getEnumTagSinglePayload(v60, 1, v145) != 1;
      sub_1A944C480(v60, &qword_1EB6DD120);
      sub_1A961B3A4(v59, (void (*)(void))type metadata accessor for WeatherRequestOptions);
      LODWORD(v177) = v61;
      sub_1A9632350();
      *(_WORD *)(v58 + 24) = 2160;
      uint64_t v177 = 1752392040;
      sub_1A9632350();
      *(_WORD *)(v58 + 34) = 2081;
      unint64_t v62 = v147;
      sub_1A9631510();
      uint64_t v177 = sub_1A945C1DC(v144, v62, &v167);
      sub_1A9632350();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_1A9410000, v54, (os_log_type_t)v164, "Could not find a cached entry for %s. allowsFlexibleMarineTimeWindow=%{BOOL}d, hasRelativeRange=%{BOOL}d, identifier=%{private,mask.hash}s", (uint8_t *)v58, 0x2Cu);
      uint64_t v63 = v166;
      swift_arrayDestroy();
      MEMORY[0x1AD0F7300](v63, -1, -1);
      MEMORY[0x1AD0F7300](v58, -1, -1);
    }
    else
    {
      sub_1A961B3A4(v53, (void (*)(void))type metadata accessor for WeatherRequestOptions);

      swift_bridgeObjectRelease_n();
    }
    uint64_t v65 = v160;
    uint64_t v64 = v161;
    goto LABEL_14;
  }
  uint64_t v67 = (uint64_t)v142;
  sub_1A9449580((uint64_t)v33, (uint64_t)v142);
  uint64_t v167 = v140;
  uint64_t v168 = v141;
  sub_1A9631510();
  sub_1A9631EA0();
  uint64_t v68 = v165;
  sub_1A95DEFC0();
  if (!v68)
  {
    uint64_t v70 = v69;
    swift_bridgeObjectRelease();
    uint64_t v72 = (uint64_t)v157;
    uint64_t v71 = (uint64_t)v158;
    sub_1A958DF58((uint64_t)v157, (uint64_t)v158, (uint64_t)v49 + SHIDWORD(v48[2].isa));
    uint64_t v73 = v153;
    sub_1A95E1F4C(v70, (uint64_t)v49, v72, v71, v153);
    swift_bridgeObjectRelease();
    if (__swift_getEnumTagSinglePayload(v73, 1, v160) == 1)
    {
      sub_1A944C480(v73, &qword_1EB6DD258);
      uint64_t v74 = v156;
      uint64_t v75 = v46;
      if (qword_1EB6DE388 != -1) {
        swift_once();
      }
      uint64_t v76 = sub_1A96317F0();
      __swift_project_value_buffer(v76, (uint64_t)qword_1EB6EB630);
      v77 = *(void (**)(char *, uint64_t, uint64_t))(v74 + 16);
      v77(v154, v72, v46);
      v78 = v152;
      v77(v152, (uint64_t)v158, v75);
      sub_1A9631510();
      v79 = sub_1A96317D0();
      os_log_type_t v80 = sub_1A9632220();
      int v81 = v80;
      if (os_log_type_enabled(v79, v80))
      {
        uint64_t v82 = swift_slowAlloc();
        LODWORD(v165) = v81;
        uint64_t v83 = v82;
        uint64_t v166 = swift_slowAlloc();
        uint64_t v167 = v166;
        *(_DWORD *)uint64_t v83 = 136316163;
        os_log_t v163 = v79;
        uint64_t v177 = sub_1A945C1DC(0x4620656E6972614DLL, 0xEF7473616365726FLL, &v167);
        os_log_t v162 = (os_log_t)&v178;
        sub_1A9632350();
        *(_WORD *)(v83 + 12) = 2080;
        uint64_t v159 = v83 + 14;
        sub_1A961B500((unint64_t *)&qword_1EB6DC720, MEMORY[0x1E4F27928]);
        v84 = v154;
        uint64_t v85 = sub_1A96327B0();
        uint64_t v177 = sub_1A945C1DC(v85, v86, &v167);
        sub_1A9632350();
        swift_bridgeObjectRelease();
        v87 = *(void (**)(char *, uint64_t))(v74 + 8);
        v87(v84, v75);
        *(_WORD *)(v83 + 22) = 2080;
        v88 = v152;
        uint64_t v89 = sub_1A96327B0();
        uint64_t v177 = sub_1A945C1DC(v89, v90, &v167);
        sub_1A9632350();
        swift_bridgeObjectRelease();
        v91 = v88;
        uint64_t v92 = v164;
        v87(v91, v164);
        *(_WORD *)(v83 + 32) = 2160;
        uint64_t v177 = 1752392040;
        sub_1A9632350();
        *(_WORD *)(v83 + 42) = 2081;
        unint64_t v93 = v147;
        sub_1A9631510();
        uint64_t v177 = sub_1A945C1DC(v144, v93, &v167);
        sub_1A9632350();
        swift_bridgeObjectRelease_n();
        os_log_t v94 = v163;
        _os_log_impl(&dword_1A9410000, v163, (os_log_type_t)v165, "Could not find any cached %s appropriate for the request hourly range. rangeStart=%s, rangeEnd=%s, identifier=%{private,mask.hash}s", (uint8_t *)v83, 0x34u);
        uint64_t v95 = v166;
        swift_arrayDestroy();
        MEMORY[0x1AD0F7300](v95, -1, -1);
        MEMORY[0x1AD0F7300](v83, -1, -1);

        v87(v158, v92);
        v87(v157, v92);
        sub_1A961B3A4((uint64_t)v142, (void (*)(void))type metadata accessor for WeatherRequestMarineHourlyRelativeRange);
        uint64_t v65 = v160;
LABEL_37:
        uint64_t v64 = v161;
LABEL_14:
        uint64_t v66 = 1;
        return __swift_storeEnumTagSinglePayload(v64, v66, 1, v65);
      }
      swift_bridgeObjectRelease_n();

      v120 = *(void (**)(char *, uint64_t))(v74 + 8);
      v120(v78, v75);
      v120(v154, v75);
      v120(v158, v75);
      v120((char *)v72, v75);
      sub_1A961B3A4(v67, (void (*)(void))type metadata accessor for WeatherRequestMarineHourlyRelativeRange);
    }
    else
    {
      v96 = v155;
      uint64_t v97 = sub_1A9449580(v73, (uint64_t)v155);
      MEMORY[0x1F4188790](v97);
      *(&v140 - 2) = v72;
      *(&v140 - 1) = v71;
      sub_1A9631510();
      sub_1A9472C8C();
      uint64_t v99 = v98;
      uint64_t v165 = 0;
      swift_bridgeObjectRelease();
      void *v96 = v99;
      uint64_t v100 = v156;
      uint64_t v101 = v46;
      if (*(void *)(v99 + 16))
      {
        if (qword_1EB6DE388 != -1) {
          swift_once();
        }
        uint64_t v102 = sub_1A96317F0();
        __swift_project_value_buffer(v102, (uint64_t)qword_1EB6EB630);
        v103 = *(void (**)(char *, uint64_t, uint64_t))(v100 + 16);
        v103(v151, v72, v46);
        v104 = v149;
        v103(v149, (uint64_t)v158, v101);
        sub_1A9631510();
        v105 = sub_1A96317D0();
        os_log_type_t v106 = sub_1A9632230();
        int v107 = v106;
        if (os_log_type_enabled(v105, v106))
        {
          uint64_t v108 = swift_slowAlloc();
          uint64_t v166 = swift_slowAlloc();
          uint64_t v167 = v166;
          *(_DWORD *)uint64_t v108 = 136316163;
          LODWORD(v163) = v107;
          uint64_t v177 = sub_1A945C1DC(0x4620656E6972614DLL, 0xEF7473616365726FLL, &v167);
          sub_1A9632350();
          *(_WORD *)(v108 + 12) = 2080;
          sub_1A961B500((unint64_t *)&qword_1EB6DC720, MEMORY[0x1E4F27928]);
          os_log_t v162 = v105;
          v109 = v151;
          uint64_t v110 = sub_1A96327B0();
          uint64_t v177 = sub_1A945C1DC(v110, v111, &v167);
          sub_1A9632350();
          swift_bridgeObjectRelease();
          v112 = *(void (**)(char *, uint64_t))(v100 + 8);
          v112(v109, v101);
          *(_WORD *)(v108 + 22) = 2080;
          uint64_t v113 = sub_1A96327B0();
          uint64_t v177 = sub_1A945C1DC(v113, v114, &v167);
          sub_1A9632350();
          swift_bridgeObjectRelease();
          v112(v104, v101);
          *(_WORD *)(v108 + 32) = 2160;
          uint64_t v177 = 1752392040;
          sub_1A9632350();
          *(_WORD *)(v108 + 42) = 2081;
          unint64_t v115 = v147;
          sub_1A9631510();
          uint64_t v177 = sub_1A945C1DC(v144, v115, &v167);
          sub_1A9632350();
          swift_bridgeObjectRelease_n();
          os_log_t v116 = v162;
          _os_log_impl(&dword_1A9410000, v162, (os_log_type_t)v163, "Found cached %s that partially matches the requested range. rangeStart=%s, rangeEnd=%s, identifier=%{private,mask.hash}s", (uint8_t *)v108, 0x34u);
          uint64_t v117 = v166;
          swift_arrayDestroy();
          MEMORY[0x1AD0F7300](v117, -1, -1);
          MEMORY[0x1AD0F7300](v108, -1, -1);

          uint64_t v118 = v160;
          v112(v158, v101);
          v112(v157, v101);
          sub_1A961B3A4((uint64_t)v142, (void (*)(void))type metadata accessor for WeatherRequestMarineHourlyRelativeRange);
          uint64_t v119 = (uint64_t)v155;
        }
        else
        {
          swift_bridgeObjectRelease_n();

          v137 = *(void (**)(char *, uint64_t))(v100 + 8);
          v137(v104, v101);
          v137(v151, v101);
          v137(v158, v101);
          v137((char *)v72, v101);
          sub_1A961B3A4(v67, (void (*)(void))type metadata accessor for WeatherRequestMarineHourlyRelativeRange);
          uint64_t v119 = (uint64_t)v155;
          uint64_t v118 = v160;
        }
        uint64_t v138 = v161;
        sub_1A9449580(v119, v161);
        uint64_t v64 = v138;
        uint64_t v66 = 0;
        uint64_t v65 = v118;
        return __swift_storeEnumTagSinglePayload(v64, v66, 1, v65);
      }
      if (qword_1EB6DE388 != -1) {
        swift_once();
      }
      uint64_t v121 = sub_1A96317F0();
      __swift_project_value_buffer(v121, (uint64_t)qword_1EB6EB630);
      v122 = *(void (**)(char *, uint64_t, uint64_t))(v100 + 16);
      v122(v150, v72, v46);
      v123 = v148;
      v122(v148, (uint64_t)v158, v101);
      sub_1A9631510();
      v124 = sub_1A96317D0();
      os_log_type_t v125 = sub_1A9632220();
      int v126 = v125;
      if (os_log_type_enabled(v124, v125))
      {
        uint64_t v127 = swift_slowAlloc();
        uint64_t v166 = swift_slowAlloc();
        uint64_t v167 = v166;
        *(_DWORD *)uint64_t v127 = 136316163;
        LODWORD(v163) = v126;
        uint64_t v177 = sub_1A945C1DC(0x4620656E6972614DLL, 0xEF7473616365726FLL, &v167);
        sub_1A9632350();
        *(_WORD *)(v127 + 12) = 2080;
        sub_1A961B500((unint64_t *)&qword_1EB6DC720, MEMORY[0x1E4F27928]);
        os_log_t v162 = v124;
        v128 = v150;
        uint64_t v129 = sub_1A96327B0();
        uint64_t v177 = sub_1A945C1DC(v129, v130, &v167);
        sub_1A9632350();
        swift_bridgeObjectRelease();
        v131 = *(void (**)(char *, uint64_t))(v100 + 8);
        v131(v128, v101);
        *(_WORD *)(v127 + 22) = 2080;
        uint64_t v132 = sub_1A96327B0();
        uint64_t v177 = sub_1A945C1DC(v132, v133, &v167);
        sub_1A9632350();
        swift_bridgeObjectRelease();
        v131(v123, v101);
        *(_WORD *)(v127 + 32) = 2160;
        uint64_t v177 = 1752392040;
        sub_1A9632350();
        *(_WORD *)(v127 + 42) = 2081;
        unint64_t v134 = v147;
        sub_1A9631510();
        uint64_t v177 = sub_1A945C1DC(v144, v134, &v167);
        sub_1A9632350();
        swift_bridgeObjectRelease_n();
        os_log_t v135 = v162;
        _os_log_impl(&dword_1A9410000, v162, (os_log_type_t)v163, "Found cached %s that partially matches the requested range. But unexpectedly, none of its hours fit within the request range; rangeStart=%s, rangeEnd=%s, identifier=%{private,mask.hash}s",
          (uint8_t *)v127,
          0x34u);
        uint64_t v136 = v166;
        swift_arrayDestroy();
        MEMORY[0x1AD0F7300](v136, -1, -1);
        MEMORY[0x1AD0F7300](v127, -1, -1);

        sub_1A961B3A4((uint64_t)v155, (void (*)(void))type metadata accessor for MarineForecast);
        v131(v158, v101);
        v131(v157, v101);
        sub_1A961B3A4((uint64_t)v142, (void (*)(void))type metadata accessor for WeatherRequestMarineHourlyRelativeRange);
        uint64_t v65 = v160;
        goto LABEL_37;
      }
      swift_bridgeObjectRelease_n();

      v139 = *(void (**)(char *, uint64_t))(v100 + 8);
      v139(v123, v101);
      v139(v150, v101);
      sub_1A961B3A4((uint64_t)v155, (void (*)(void))type metadata accessor for MarineForecast);
      v139(v158, v101);
      v139((char *)v72, v101);
      sub_1A961B3A4(v67, (void (*)(void))type metadata accessor for WeatherRequestMarineHourlyRelativeRange);
    }
    uint64_t v65 = v160;
    goto LABEL_37;
  }
  sub_1A961B3A4(v67, (void (*)(void))type metadata accessor for WeatherRequestMarineHourlyRelativeRange);
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1A95E0870@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, NSObject *a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v169 = a4;
  uint64_t v164 = a5;
  uint64_t v8 = type metadata accessor for WeatherRequestOptions();
  MEMORY[0x1F4188790](v8);
  uint64_t v162 = (uint64_t)&v143 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6DD1D8);
  MEMORY[0x1F4188790](v10 - 8);
  uint64_t v156 = (uint64_t)&v143 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v163 = type metadata accessor for TideEvents();
  MEMORY[0x1F4188790](v163);
  v155 = (uint64_t *)((char *)&v143 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v166 = sub_1A962E810();
  uint64_t v159 = *(void *)(v166 - 8);
  MEMORY[0x1F4188790](v166);
  v152 = (char *)&v143 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v14);
  v151 = (char *)&v143 - v15;
  MEMORY[0x1F4188790](v16);
  v154 = (char *)&v143 - v17;
  MEMORY[0x1F4188790](v18);
  uint64_t v153 = (char *)&v143 - v19;
  MEMORY[0x1F4188790](v20);
  v158 = (char *)&v143 - v21;
  MEMORY[0x1F4188790](v22);
  v157 = (char *)&v143 - v23;
  MEMORY[0x1F4188790](v24);
  uint64_t v160 = (char *)&v143 - v25;
  MEMORY[0x1F4188790](v26);
  uint64_t v161 = (char *)&v143 - v27;
  uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6DD120);
  MEMORY[0x1F4188790](v28 - 8);
  uint64_t v30 = (char *)&v143 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v31);
  uint64_t v33 = (char *)&v143 - v32;
  uint64_t v34 = type metadata accessor for WeatherRequestMarineHourlyRelativeRange();
  MEMORY[0x1F4188790](v34);
  uint64_t v36 = (char *)&v143 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0);
  os_log_t v167 = (os_log_t)v8;
  uint64_t v37 = *(uint64_t *)((char *)&a3->isa + *(int *)(v8 + 64));
  os_log_t v165 = a3;
  uint64_t v38 = a1;
  uint64_t v39 = a1;
  uint64_t v40 = a2;
  uint64_t v41 = sub_1A95680E0((uint64_t)a3, v39, a2);
  unint64_t v43 = v42;
  uint64_t v44 = v168;
  sub_1A95DEE64();
  uint64_t v168 = v44;
  if (v44) {
    return swift_bridgeObjectRelease();
  }
  uint64_t v149 = v37;
  uint64_t v148 = v34;
  uint64_t v146 = v30;
  uint64_t v143 = v38;
  uint64_t v144 = v40;
  uint64_t v147 = v41;
  unint64_t v150 = v43;
  uint64_t v145 = v36;
  uint64_t v46 = v166;
  uint64_t v47 = v170;
  if (v170)
  {
    uint64_t v175 = v170;
    uint64_t v176 = v171;
    uint64_t v177 = v172;
    uint64_t v178 = v173;
    uint64_t v179 = v174;
    swift_bridgeObjectRelease();
    sub_1A95DA9FC(v149, v164);
    return sub_1A948A95C(v47);
  }
  os_log_t v48 = v167;
  os_log_t v49 = v165;
  char v50 = v149;
  if ((v149 & 2) == 0) {
    goto LABEL_8;
  }
  sub_1A944A348((uint64_t)v165 + SLODWORD(v167[6].isa), (uint64_t)v33, &qword_1EB6DD120);
  if (__swift_getEnumTagSinglePayload((uint64_t)v33, 1, v148) == 1)
  {
    sub_1A944C480((uint64_t)v33, &qword_1EB6DD120);
LABEL_8:
    if (qword_1EB6DE388 != -1) {
      swift_once();
    }
    uint64_t v51 = sub_1A96317F0();
    __swift_project_value_buffer(v51, (uint64_t)qword_1EB6EB630);
    uint64_t v52 = v162;
    sub_1A961B118((uint64_t)v49, v162);
    sub_1A9631510();
    uint64_t v53 = sub_1A96317D0();
    os_log_type_t v54 = sub_1A9632230();
    int v55 = v54;
    if (os_log_type_enabled(v53, v54))
    {
      uint64_t v56 = swift_slowAlloc();
      LODWORD(v166) = v55;
      uint64_t v57 = v56;
      uint64_t v169 = swift_slowAlloc();
      uint64_t v170 = v169;
      *(_DWORD *)uint64_t v57 = 136316163;
      uint64_t v180 = sub_1A945C1DC(0x6576452065646954, 0xEB0000000073746ELL, &v170);
      uint64_t v58 = v52;
      sub_1A9632350();
      *(_WORD *)(v57 + 12) = 1024;
      LODWORD(v180) = (unint64_t)(v50 & 2) >> 1;
      sub_1A9632350();
      *(_WORD *)(v57 + 18) = 1024;
      uint64_t v59 = (uint64_t)v146;
      sub_1A944A348(v52 + SLODWORD(v48[6].isa), (uint64_t)v146, &qword_1EB6DD120);
      BOOL v60 = __swift_getEnumTagSinglePayload(v59, 1, v148) != 1;
      sub_1A944C480(v59, &qword_1EB6DD120);
      sub_1A961B3A4(v58, (void (*)(void))type metadata accessor for WeatherRequestOptions);
      LODWORD(v180) = v60;
      sub_1A9632350();
      *(_WORD *)(v57 + 24) = 2160;
      uint64_t v180 = 1752392040;
      sub_1A9632350();
      *(_WORD *)(v57 + 34) = 2081;
      unint64_t v61 = v150;
      sub_1A9631510();
      uint64_t v180 = sub_1A945C1DC(v147, v61, &v170);
      sub_1A9632350();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_1A9410000, v53, (os_log_type_t)v166, "Could not find a cached entry for %s. allowsFlexibleMarineTimeWindow=%{BOOL}d, hasRelativeRange=%{BOOL}d, identifier=%{private,mask.hash}s", (uint8_t *)v57, 0x2Cu);
      uint64_t v62 = v169;
      swift_arrayDestroy();
      MEMORY[0x1AD0F7300](v62, -1, -1);
      MEMORY[0x1AD0F7300](v57, -1, -1);
    }
    else
    {
      sub_1A961B3A4(v52, (void (*)(void))type metadata accessor for WeatherRequestOptions);

      swift_bridgeObjectRelease_n();
    }
    uint64_t v64 = v163;
    uint64_t v63 = v164;
    goto LABEL_14;
  }
  uint64_t v66 = (uint64_t)v145;
  sub_1A9449580((uint64_t)v33, (uint64_t)v145);
  uint64_t v170 = v143;
  uint64_t v171 = v144;
  sub_1A9631510();
  sub_1A9631EA0();
  uint64_t v67 = v168;
  sub_1A95DEFC0();
  if (!v67)
  {
    uint64_t v69 = v68;
    swift_bridgeObjectRelease();
    uint64_t v70 = (uint64_t)v160;
    uint64_t v71 = (uint64_t)v161;
    sub_1A958DF58((uint64_t)v161, (uint64_t)v160, (uint64_t)v49 + SHIDWORD(v48[2].isa));
    uint64_t v72 = v156;
    sub_1A95E2688(v69, (uint64_t)v49, v71, v70, v156);
    swift_bridgeObjectRelease();
    if (__swift_getEnumTagSinglePayload(v72, 1, v163) == 1)
    {
      sub_1A944C480(v72, &qword_1EB6DD1D8);
      uint64_t v73 = v159;
      if (qword_1EB6DE388 != -1) {
        swift_once();
      }
      uint64_t v74 = sub_1A96317F0();
      __swift_project_value_buffer(v74, (uint64_t)qword_1EB6EB630);
      uint64_t v75 = *(void (**)(char *, uint64_t, uint64_t))(v73 + 16);
      v75(v157, v71, v46);
      v75(v158, (uint64_t)v160, v46);
      sub_1A9631510();
      uint64_t v76 = sub_1A96317D0();
      os_log_type_t v77 = sub_1A9632220();
      int v78 = v77;
      if (os_log_type_enabled(v76, v77))
      {
        uint64_t v79 = swift_slowAlloc();
        uint64_t v169 = swift_slowAlloc();
        uint64_t v170 = v169;
        *(_DWORD *)uint64_t v79 = 136316163;
        LODWORD(v168) = v78;
        uint64_t v180 = sub_1A945C1DC(0x6576452065646954, 0xEB0000000073746ELL, &v170);
        os_log_t v165 = (os_log_t)&v181;
        sub_1A9632350();
        *(_WORD *)(v79 + 12) = 2080;
        os_log_t v167 = v76;
        sub_1A961B500((unint64_t *)&qword_1EB6DC720, MEMORY[0x1E4F27928]);
        os_log_type_t v80 = v157;
        uint64_t v81 = sub_1A96327B0();
        uint64_t v180 = sub_1A945C1DC(v81, v82, &v170);
        sub_1A9632350();
        swift_bridgeObjectRelease();
        uint64_t v83 = *(void (**)(char *, uint64_t))(v73 + 8);
        v83(v80, v46);
        *(_WORD *)(v79 + 22) = 2080;
        uint64_t v162 = v79 + 24;
        v84 = v158;
        uint64_t v85 = sub_1A96327B0();
        uint64_t v180 = sub_1A945C1DC(v85, v86, &v170);
        sub_1A9632350();
        swift_bridgeObjectRelease();
        v83(v84, v46);
        *(_WORD *)(v79 + 32) = 2160;
        uint64_t v180 = 1752392040;
        sub_1A9632350();
        *(_WORD *)(v79 + 42) = 2081;
        unint64_t v87 = v150;
        sub_1A9631510();
        uint64_t v180 = sub_1A945C1DC(v147, v87, &v170);
        sub_1A9632350();
        swift_bridgeObjectRelease_n();
        os_log_t v88 = v167;
        _os_log_impl(&dword_1A9410000, v167, (os_log_type_t)v168, "Could not find any cached %s appropriate for the request hourly range. rangeStart=%s, rangeEnd=%s, identifier=%{private,mask.hash}s", (uint8_t *)v79, 0x34u);
        uint64_t v89 = v169;
        swift_arrayDestroy();
        MEMORY[0x1AD0F7300](v89, -1, -1);
        MEMORY[0x1AD0F7300](v79, -1, -1);

        v83(v160, v46);
        v83(v161, v46);
        sub_1A961B3A4((uint64_t)v145, (void (*)(void))type metadata accessor for WeatherRequestMarineHourlyRelativeRange);
        uint64_t v64 = v163;
LABEL_37:
        uint64_t v63 = v164;
LABEL_14:
        uint64_t v65 = 1;
        return __swift_storeEnumTagSinglePayload(v63, v65, 1, v64);
      }
      swift_bridgeObjectRelease_n();

      v122 = *(void (**)(char *, uint64_t))(v73 + 8);
      v122(v158, v46);
      v122(v157, v46);
      v122(v160, v46);
      v122((char *)v71, v46);
      sub_1A961B3A4(v66, (void (*)(void))type metadata accessor for WeatherRequestMarineHourlyRelativeRange);
    }
    else
    {
      uint64_t v90 = v72;
      v91 = v155;
      uint64_t v92 = sub_1A9449580(v90, (uint64_t)v155);
      MEMORY[0x1F4188790](v92);
      *(&v143 - 2) = v71;
      *(&v143 - 1) = v70;
      sub_1A9631510();
      uint64_t v93 = (uint64_t)v91;
      sub_1A9472EFC();
      uint64_t v95 = v94;
      uint64_t v96 = swift_bridgeObjectRelease();
      v91[1] = v95;
      MEMORY[0x1F4188790](v96);
      *(&v143 - 2) = v71;
      *(&v143 - 1) = v70;
      sub_1A9631510();
      sub_1A9472F50();
      uint64_t v98 = v97;
      swift_bridgeObjectRelease();
      void *v91 = v98;
      uint64_t v99 = *(void *)(v91[1] + 16);
      uint64_t v100 = v159;
      uint64_t v101 = v46;
      uint64_t v168 = 0;
      if (v99)
      {
        uint64_t v102 = v46;
        if (qword_1EB6DE388 != -1) {
          swift_once();
        }
        uint64_t v103 = sub_1A96317F0();
        __swift_project_value_buffer(v103, (uint64_t)qword_1EB6EB630);
        uint64_t v104 = v100;
        v105 = *(void (**)(char *, uint64_t, uint64_t))(v100 + 16);
        v105(v153, (uint64_t)v161, v102);
        v105(v154, v70, v102);
        sub_1A9631510();
        os_log_type_t v106 = sub_1A96317D0();
        os_log_type_t v107 = sub_1A9632230();
        int v108 = v107;
        if (os_log_type_enabled(v106, v107))
        {
          uint64_t v109 = swift_slowAlloc();
          uint64_t v169 = swift_slowAlloc();
          uint64_t v170 = v169;
          *(_DWORD *)uint64_t v109 = 136316163;
          LODWORD(v167) = v108;
          uint64_t v180 = sub_1A945C1DC(0x6576452065646954, 0xEB0000000073746ELL, &v170);
          sub_1A9632350();
          *(_WORD *)(v109 + 12) = 2080;
          sub_1A961B500((unint64_t *)&qword_1EB6DC720, MEMORY[0x1E4F27928]);
          uint64_t v110 = v153;
          uint64_t v111 = sub_1A96327B0();
          uint64_t v180 = sub_1A945C1DC(v111, v112, &v170);
          sub_1A9632350();
          swift_bridgeObjectRelease();
          uint64_t v113 = v154;
          os_log_t v165 = v106;
          unint64_t v114 = *(void (**)(char *, uint64_t))(v104 + 8);
          v114(v110, v102);
          *(_WORD *)(v109 + 22) = 2080;
          uint64_t v115 = sub_1A96327B0();
          uint64_t v180 = sub_1A945C1DC(v115, v116, &v170);
          uint64_t v93 = (uint64_t)v155;
          sub_1A9632350();
          swift_bridgeObjectRelease();
          v114(v113, v102);
          *(_WORD *)(v109 + 32) = 2160;
          uint64_t v180 = 1752392040;
          sub_1A9632350();
          *(_WORD *)(v109 + 42) = 2081;
          unint64_t v117 = v150;
          sub_1A9631510();
          uint64_t v180 = sub_1A945C1DC(v147, v117, &v170);
          sub_1A9632350();
          swift_bridgeObjectRelease_n();
          os_log_t v118 = v165;
          _os_log_impl(&dword_1A9410000, v165, (os_log_type_t)v167, "Found cached %s that partially matches the requested range. rangeStart=%s, rangeEnd=%s, identifier=%{private,mask.hash}s", (uint8_t *)v109, 0x34u);
          uint64_t v119 = v169;
          swift_arrayDestroy();
          uint64_t v120 = v119;
          uint64_t v121 = v163;
          MEMORY[0x1AD0F7300](v120, -1, -1);
          MEMORY[0x1AD0F7300](v109, -1, -1);

          v114(v160, v102);
          v114(v161, v102);
          sub_1A961B3A4((uint64_t)v145, (void (*)(void))type metadata accessor for WeatherRequestMarineHourlyRelativeRange);
        }
        else
        {
          swift_bridgeObjectRelease_n();

          uint64_t v140 = *(void (**)(char *, uint64_t))(v104 + 8);
          v140(v154, v102);
          v140(v153, v102);
          v140((char *)v70, v102);
          v140(v161, v102);
          sub_1A961B3A4(v66, (void (*)(void))type metadata accessor for WeatherRequestMarineHourlyRelativeRange);
          uint64_t v121 = v163;
        }
        uint64_t v141 = v164;
        sub_1A9449580(v93, v164);
        uint64_t v63 = v141;
        uint64_t v65 = 0;
        uint64_t v64 = v121;
        return __swift_storeEnumTagSinglePayload(v63, v65, 1, v64);
      }
      if (qword_1EB6DE388 != -1) {
        swift_once();
      }
      uint64_t v123 = sub_1A96317F0();
      __swift_project_value_buffer(v123, (uint64_t)qword_1EB6EB630);
      uint64_t v124 = v100;
      os_log_type_t v125 = *(void (**)(char *, uint64_t, uint64_t))(v100 + 16);
      v125(v151, (uint64_t)v161, v101);
      v125(v152, v70, v101);
      sub_1A9631510();
      int v126 = sub_1A96317D0();
      os_log_type_t v127 = sub_1A9632220();
      int v128 = v127;
      if (os_log_type_enabled(v126, v127))
      {
        uint64_t v129 = swift_slowAlloc();
        uint64_t v169 = swift_slowAlloc();
        uint64_t v170 = v169;
        *(_DWORD *)uint64_t v129 = 136316163;
        LODWORD(v167) = v128;
        uint64_t v180 = sub_1A945C1DC(0x6576452065646954, 0xEB0000000073746ELL, &v170);
        sub_1A9632350();
        *(_WORD *)(v129 + 12) = 2080;
        sub_1A961B500((unint64_t *)&qword_1EB6DC720, MEMORY[0x1E4F27928]);
        os_log_t v165 = v126;
        unint64_t v130 = v151;
        uint64_t v131 = sub_1A96327B0();
        uint64_t v180 = sub_1A945C1DC(v131, v132, &v170);
        sub_1A9632350();
        swift_bridgeObjectRelease();
        unint64_t v133 = v152;
        unint64_t v134 = *(void (**)(char *, uint64_t))(v124 + 8);
        v134(v130, v101);
        *(_WORD *)(v129 + 22) = 2080;
        uint64_t v135 = sub_1A96327B0();
        uint64_t v180 = sub_1A945C1DC(v135, v136, &v170);
        sub_1A9632350();
        swift_bridgeObjectRelease();
        v134(v133, v101);
        *(_WORD *)(v129 + 32) = 2160;
        uint64_t v180 = 1752392040;
        sub_1A9632350();
        *(_WORD *)(v129 + 42) = 2081;
        unint64_t v137 = v150;
        sub_1A9631510();
        uint64_t v180 = sub_1A945C1DC(v147, v137, &v170);
        sub_1A9632350();
        swift_bridgeObjectRelease_n();
        os_log_t v138 = v165;
        _os_log_impl(&dword_1A9410000, v165, (os_log_type_t)v167, "Found cached %s that partially matches the requested range. But unexpectedly, none of its hours fit within the request range; rangeStart=%s, rangeEnd=%s, identifier=%{private,mask.hash}s",
          (uint8_t *)v129,
          0x34u);
        uint64_t v139 = v169;
        swift_arrayDestroy();
        MEMORY[0x1AD0F7300](v139, -1, -1);
        MEMORY[0x1AD0F7300](v129, -1, -1);

        sub_1A961B3A4((uint64_t)v155, (void (*)(void))type metadata accessor for TideEvents);
        v134(v160, v101);
        v134(v161, v101);
        sub_1A961B3A4((uint64_t)v145, (void (*)(void))type metadata accessor for WeatherRequestMarineHourlyRelativeRange);
        uint64_t v64 = v163;
        goto LABEL_37;
      }
      swift_bridgeObjectRelease_n();

      v142 = *(void (**)(char *, uint64_t))(v124 + 8);
      v142(v152, v101);
      v142(v151, v101);
      sub_1A961B3A4(v93, (void (*)(void))type metadata accessor for TideEvents);
      v142((char *)v70, v101);
      v142(v161, v101);
      sub_1A961B3A4(v66, (void (*)(void))type metadata accessor for WeatherRequestMarineHourlyRelativeRange);
    }
    uint64_t v64 = v163;
    goto LABEL_37;
  }
  sub_1A961B3A4(v66, (void (*)(void))type metadata accessor for WeatherRequestMarineHourlyRelativeRange);
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1A95E1F4C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v60 = a4;
  uint64_t v66 = a1;
  uint64_t v67 = a3;
  uint64_t v7 = sub_1A962E810();
  unint64_t v61 = *(void (***)(char *, uint64_t))(v7 - 8);
  MEMORY[0x1F4188790](v7);
  uint64_t v59 = (char *)v55 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v9);
  uint64_t v11 = (char *)v55 - v10;
  uint64_t v65 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E97EB880);
  MEMORY[0x1F4188790](v65);
  uint64_t v13 = (char *)v55 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6DE3A0);
  MEMORY[0x1F4188790](v14 - 8);
  uint64_t v16 = (char *)v55 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v17);
  uint64_t v19 = (char *)v55 - v18;
  uint64_t v20 = type metadata accessor for MarineForecast();
  uint64_t v21 = *(void *)(v20 - 8);
  MEMORY[0x1F4188790](v20);
  uint64_t v62 = (void *)((char *)v55 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x1F4188790](v23);
  uint64_t v25 = (char *)v55 - v24;
  uint64_t v69 = a2;
  sub_1A9620C40();
  uint64_t v68 = v67;
  sub_1A9472FA4();
  uint64_t v27 = v26;
  uint64_t v67 = v20;
  __swift_storeEnumTagSinglePayload(a5, 1, 1, v20);
  uint64_t v28 = *(void *)(v27 + 16);
  if (v28)
  {
    uint64_t v58 = v11;
    unint64_t v29 = (*(unsigned __int8 *)(v21 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v21 + 80);
    v55[1] = v27;
    uint64_t v30 = v27 + v29;
    uint64_t v31 = *(void *)(v21 + 72);
    uint64_t v63 = (void (**)(char *, unint64_t, uint64_t))(v61 + 2);
    uint64_t v64 = v31;
    uint64_t v56 = v16;
    uint64_t v57 = (void (**)(void))(v61 + 4);
    ++v61;
    uint64_t v66 = a5;
    while (1)
    {
      sub_1A961B118(v30, (uint64_t)v25);
      uint64_t v32 = *(void *)v25;
      uint64_t v33 = *(void *)(*(void *)v25 + 16);
      if (v33)
      {
        uint64_t v34 = v33 - 1;
        uint64_t v35 = *(void *)(type metadata accessor for MarineHourForecast() - 8);
        unint64_t v36 = v32
            + ((*(unsigned __int8 *)(v35 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v35 + 80))
            + *(void *)(v35 + 72) * v34;
        a5 = v66;
        (*v63)(v19, v36, v7);
        uint64_t v37 = 0;
      }
      else
      {
        uint64_t v37 = 1;
      }
      __swift_storeEnumTagSinglePayload((uint64_t)v19, v37, 1, v7);
      if (__swift_getEnumTagSinglePayload(a5, 1, v67))
      {
        __swift_storeEnumTagSinglePayload((uint64_t)v16, 1, 1, v7);
      }
      else
      {
        uint64_t v38 = v62;
        sub_1A961B118(a5, (uint64_t)v62);
        uint64_t v39 = *v38;
        uint64_t v40 = *(void *)(v39 + 16);
        if (v40)
        {
          uint64_t v41 = v40 - 1;
          uint64_t v42 = *(void *)(type metadata accessor for MarineHourForecast() - 8);
          unint64_t v43 = v39
              + ((*(unsigned __int8 *)(v42 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v42 + 80))
              + *(void *)(v42 + 72) * v41;
          a5 = v66;
          (*v63)(v16, v43, v7);
          uint64_t v44 = 0;
        }
        else
        {
          uint64_t v44 = 1;
        }
        __swift_storeEnumTagSinglePayload((uint64_t)v16, v44, 1, v7);
        sub_1A961B3A4((uint64_t)v62, (void (*)(void))type metadata accessor for MarineForecast);
      }
      uint64_t v45 = (uint64_t)&v13[*(int *)(v65 + 48)];
      sub_1A944A754((uint64_t)v19, (uint64_t)v13, &qword_1EB6DE3A0);
      sub_1A944A754((uint64_t)v16, v45, &qword_1EB6DE3A0);
      if (__swift_getEnumTagSinglePayload((uint64_t)v13, 1, v7) == 1)
      {
        sub_1A961B3A4((uint64_t)v25, (void (*)(void))type metadata accessor for MarineForecast);
        if (__swift_getEnumTagSinglePayload(v45, 1, v7) != 1) {
          sub_1A944C480(v45, &qword_1EB6DE3A0);
        }
        goto LABEL_23;
      }
      if (__swift_getEnumTagSinglePayload(v45, 1, v7) != 1) {
        break;
      }
      sub_1A944C480(a5, &qword_1EB6DD258);
      sub_1A9449580((uint64_t)v25, a5);
      __swift_storeEnumTagSinglePayload(a5, 0, 1, v67);
      (*v61)(v13, v7);
LABEL_23:
      v30 += v64;
      if (!--v28) {
        return swift_bridgeObjectRelease();
      }
    }
    uint64_t v46 = v58;
    uint64_t v47 = *v57;
    ((void (*)(char *, char *, uint64_t))*v57)(v58, v13, v7);
    os_log_t v48 = v59;
    v47();
    if (sub_1A962E750())
    {
      char v49 = sub_1A962E740();
      char v50 = v48;
      char v51 = v49;
      uint64_t v52 = *v61;
      (*v61)(v50, v7);
      v52(v46, v7);
      if (v51)
      {
        a5 = v66;
        sub_1A944C480(v66, &qword_1EB6DD258);
        sub_1A9449580((uint64_t)v25, a5);
        __swift_storeEnumTagSinglePayload(a5, 0, 1, v67);
LABEL_22:
        uint64_t v16 = v56;
        goto LABEL_23;
      }
    }
    else
    {
      uint64_t v53 = *v61;
      (*v61)(v48, v7);
      v53(v46, v7);
    }
    sub_1A961B3A4((uint64_t)v25, (void (*)(void))type metadata accessor for MarineForecast);
    a5 = v66;
    goto LABEL_22;
  }
  return swift_bridgeObjectRelease();
}

uint64_t sub_1A95E2688@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v60 = a4;
  uint64_t v66 = a1;
  uint64_t v67 = a3;
  uint64_t v7 = sub_1A962E810();
  unint64_t v61 = *(void (***)(char *, uint64_t))(v7 - 8);
  MEMORY[0x1F4188790](v7);
  uint64_t v59 = (char *)v55 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v9);
  uint64_t v11 = (char *)v55 - v10;
  uint64_t v65 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E97EB880);
  MEMORY[0x1F4188790](v65);
  uint64_t v13 = (char *)v55 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6DE3A0);
  MEMORY[0x1F4188790](v14 - 8);
  uint64_t v16 = (char *)v55 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v17);
  uint64_t v19 = (char *)v55 - v18;
  uint64_t v20 = type metadata accessor for TideEvents();
  uint64_t v21 = *(void *)(v20 - 8);
  MEMORY[0x1F4188790](v20);
  uint64_t v62 = (uint64_t)v55 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v23);
  uint64_t v25 = (char *)v55 - v24;
  uint64_t v69 = a2;
  sub_1A9620C9C();
  uint64_t v68 = v67;
  sub_1A9472FF8();
  uint64_t v27 = v26;
  uint64_t v67 = v20;
  __swift_storeEnumTagSinglePayload(a5, 1, 1, v20);
  uint64_t v28 = *(void *)(v27 + 16);
  if (v28)
  {
    uint64_t v58 = v11;
    unint64_t v29 = (*(unsigned __int8 *)(v21 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v21 + 80);
    v55[1] = v27;
    uint64_t v30 = v27 + v29;
    uint64_t v31 = *(void *)(v21 + 72);
    uint64_t v63 = (void (**)(char *, unint64_t, uint64_t))(v61 + 2);
    uint64_t v64 = v31;
    uint64_t v56 = v16;
    uint64_t v57 = (void (**)(void))(v61 + 4);
    ++v61;
    uint64_t v66 = a5;
    while (1)
    {
      sub_1A961B118(v30, (uint64_t)v25);
      uint64_t v32 = *((void *)v25 + 1);
      uint64_t v33 = *(void *)(v32 + 16);
      if (v33)
      {
        uint64_t v34 = v33 - 1;
        uint64_t v35 = *(void *)(type metadata accessor for HourTide() - 8);
        unint64_t v36 = v32
            + ((*(unsigned __int8 *)(v35 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v35 + 80))
            + *(void *)(v35 + 72) * v34;
        a5 = v66;
        (*v63)(v19, v36, v7);
        uint64_t v37 = 0;
      }
      else
      {
        uint64_t v37 = 1;
      }
      __swift_storeEnumTagSinglePayload((uint64_t)v19, v37, 1, v7);
      if (__swift_getEnumTagSinglePayload(a5, 1, v67))
      {
        __swift_storeEnumTagSinglePayload((uint64_t)v16, 1, 1, v7);
      }
      else
      {
        uint64_t v38 = v62;
        sub_1A961B118(a5, v62);
        uint64_t v39 = *(void *)(v38 + 8);
        uint64_t v40 = *(void *)(v39 + 16);
        if (v40)
        {
          uint64_t v41 = v40 - 1;
          uint64_t v42 = *(void *)(type metadata accessor for HourTide() - 8);
          unint64_t v43 = v39
              + ((*(unsigned __int8 *)(v42 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v42 + 80))
              + *(void *)(v42 + 72) * v41;
          a5 = v66;
          (*v63)(v16, v43, v7);
          uint64_t v44 = 0;
        }
        else
        {
          uint64_t v44 = 1;
        }
        __swift_storeEnumTagSinglePayload((uint64_t)v16, v44, 1, v7);
        sub_1A961B3A4(v62, (void (*)(void))type metadata accessor for TideEvents);
      }
      uint64_t v45 = (uint64_t)&v13[*(int *)(v65 + 48)];
      sub_1A944A754((uint64_t)v19, (uint64_t)v13, &qword_1EB6DE3A0);
      sub_1A944A754((uint64_t)v16, v45, &qword_1EB6DE3A0);
      if (__swift_getEnumTagSinglePayload((uint64_t)v13, 1, v7) == 1)
      {
        sub_1A961B3A4((uint64_t)v25, (void (*)(void))type metadata accessor for TideEvents);
        if (__swift_getEnumTagSinglePayload(v45, 1, v7) != 1) {
          sub_1A944C480(v45, &qword_1EB6DE3A0);
        }
        goto LABEL_23;
      }
      if (__swift_getEnumTagSinglePayload(v45, 1, v7) != 1) {
        break;
      }
      sub_1A944C480(a5, &qword_1EB6DD1D8);
      sub_1A9449580((uint64_t)v25, a5);
      __swift_storeEnumTagSinglePayload(a5, 0, 1, v67);
      (*v61)(v13, v7);
LABEL_23:
      v30 += v64;
      if (!--v28) {
        return swift_bridgeObjectRelease();
      }
    }
    uint64_t v46 = v58;
    uint64_t v47 = *v57;
    ((void (*)(char *, char *, uint64_t))*v57)(v58, v13, v7);
    os_log_t v48 = v59;
    v47();
    if (sub_1A962E750())
    {
      char v49 = sub_1A962E740();
      char v50 = v48;
      char v51 = v49;
      uint64_t v52 = *v61;
      (*v61)(v50, v7);
      v52(v46, v7);
      if (v51)
      {
        a5 = v66;
        sub_1A944C480(v66, &qword_1EB6DD1D8);
        sub_1A9449580((uint64_t)v25, a5);
        __swift_storeEnumTagSinglePayload(a5, 0, 1, v67);
LABEL_22:
        uint64_t v16 = v56;
        goto LABEL_23;
      }
    }
    else
    {
      uint64_t v53 = *v61;
      (*v61)(v48, v7);
      v53(v46, v7);
    }
    sub_1A961B3A4((uint64_t)v25, (void (*)(void))type metadata accessor for TideEvents);
    a5 = v66;
    goto LABEL_22;
  }
  return swift_bridgeObjectRelease();
}

uint64_t sub_1A95E2DC4(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = type metadata accessor for WeatherRequestOptions();
  return a3(*(void *)(a2 + *(int *)(v5 + 64)));
}

uint64_t sub_1A95E2E28(uint64_t *a1, uint64_t a2)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6DE3A0);
  MEMORY[0x1F4188790](v5 - 8);
  uint64_t v7 = (char *)&v36 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v8);
  uint64_t v10 = (char *)&v36 - v9;
  uint64_t v11 = sub_1A962E810();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x1F4188790](v11);
  uint64_t v42 = (char *)&v36 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v14);
  uint64_t v41 = (char *)&v36 - v15;
  MEMORY[0x1F4188790](v16);
  MEMORY[0x1F4188790](v17);
  uint64_t v20 = (char *)&v36 - v19;
  uint64_t v21 = *a1;
  if (!*(void *)(*a1 + 16))
  {
    __swift_storeEnumTagSinglePayload((uint64_t)v10, 1, 1, v11);
    goto LABEL_6;
  }
  uint64_t v40 = v18;
  uint64_t v22 = *(void *)(type metadata accessor for MarineHourForecast() - 8);
  uint64_t v23 = v21 + ((*(unsigned __int8 *)(v22 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v22 + 80));
  uint64_t v39 = *(void (**)(char *, uint64_t, uint64_t))(v12 + 16);
  v39(v10, v23, v11);
  __swift_storeEnumTagSinglePayload((uint64_t)v10, 0, 1, v11);
  if (__swift_getEnumTagSinglePayload((uint64_t)v10, 1, v11) == 1)
  {
LABEL_6:
    sub_1A944C480((uint64_t)v10, &qword_1EB6DE3A0);
    char v25 = 0;
    return v25 & 1;
  }
  uint64_t v37 = a2;
  uint64_t v38 = v2;
  uint64_t v24 = *(void (**)(char *, char *, uint64_t))(v12 + 32);
  v24(v20, v10, v11);
  MarineForecast.lastHourDate.getter();
  if (__swift_getEnumTagSinglePayload((uint64_t)v7, 1, v11) == 1)
  {
    (*(void (**)(char *, uint64_t))(v12 + 8))(v20, v11);
    sub_1A944C480((uint64_t)v7, &qword_1EB6DE3A0);
    char v25 = 0;
  }
  else
  {
    uint64_t v27 = v40;
    v24(v40, v7, v11);
    uint64_t v28 = sub_1A961B500((unint64_t *)&qword_1EB6DC740, MEMORY[0x1E4F27928]);
    uint64_t v29 = v37;
    uint64_t v36 = v28;
    char v30 = sub_1A9631D10();
    uint64_t v31 = v41;
    uint64_t v32 = v27;
    uint64_t v33 = v39;
    v39(v41, (uint64_t)v32, v11);
    uint64_t v34 = v42;
    v33(v42, v29, v11);
    if (v30) {
      char v25 = 0;
    }
    else {
      char v25 = sub_1A9631D10() ^ 1;
    }
    uint64_t v35 = *(void (**)(char *, uint64_t))(v12 + 8);
    v35(v34, v11);
    v35(v31, v11);
    v35(v40, v11);
    v35(v20, v11);
  }
  return v25 & 1;
}

uint64_t sub_1A95E3234(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6DE3A0);
  MEMORY[0x1F4188790](v5 - 8);
  uint64_t v7 = (char *)&v36 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v8);
  uint64_t v10 = (char *)&v36 - v9;
  uint64_t v11 = sub_1A962E810();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x1F4188790](v11);
  uint64_t v42 = (char *)&v36 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v14);
  uint64_t v41 = (char *)&v36 - v15;
  MEMORY[0x1F4188790](v16);
  MEMORY[0x1F4188790](v17);
  uint64_t v20 = (char *)&v36 - v19;
  uint64_t v21 = *(void *)(a1 + 8);
  if (!*(void *)(v21 + 16))
  {
    __swift_storeEnumTagSinglePayload((uint64_t)v10, 1, 1, v11);
    goto LABEL_6;
  }
  uint64_t v40 = v18;
  uint64_t v22 = *(void *)(type metadata accessor for HourTide() - 8);
  uint64_t v23 = v21 + ((*(unsigned __int8 *)(v22 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v22 + 80));
  uint64_t v39 = *(void (**)(char *, uint64_t, uint64_t))(v12 + 16);
  v39(v10, v23, v11);
  __swift_storeEnumTagSinglePayload((uint64_t)v10, 0, 1, v11);
  if (__swift_getEnumTagSinglePayload((uint64_t)v10, 1, v11) == 1)
  {
LABEL_6:
    sub_1A944C480((uint64_t)v10, &qword_1EB6DE3A0);
    char v25 = 0;
    return v25 & 1;
  }
  uint64_t v37 = a2;
  uint64_t v38 = v2;
  uint64_t v24 = *(void (**)(char *, char *, uint64_t))(v12 + 32);
  v24(v20, v10, v11);
  TideEvents.lastHourDate.getter();
  if (__swift_getEnumTagSinglePayload((uint64_t)v7, 1, v11) == 1)
  {
    (*(void (**)(char *, uint64_t))(v12 + 8))(v20, v11);
    sub_1A944C480((uint64_t)v7, &qword_1EB6DE3A0);
    char v25 = 0;
  }
  else
  {
    uint64_t v27 = v40;
    v24(v40, v7, v11);
    uint64_t v28 = sub_1A961B500((unint64_t *)&qword_1EB6DC740, MEMORY[0x1E4F27928]);
    uint64_t v29 = v37;
    uint64_t v36 = v28;
    char v30 = sub_1A9631D10();
    uint64_t v31 = v41;
    uint64_t v32 = v27;
    uint64_t v33 = v39;
    v39(v41, (uint64_t)v32, v11);
    uint64_t v34 = v42;
    v33(v42, v29, v11);
    if (v30) {
      char v25 = 0;
    }
    else {
      char v25 = sub_1A9631D10() ^ 1;
    }
    uint64_t v35 = *(void (**)(char *, uint64_t))(v12 + 8);
    v35(v34, v11);
    v35(v31, v11);
    v35(v40, v11);
    v35(v20, v11);
  }
  return v25 & 1;
}

WeatherDaemon::WeatherDataCaching::Options __swiftcall WeatherDataCaching.Options.init(rawValue:)(WeatherDaemon::WeatherDataCaching::Options rawValue)
{
  v1->rawValue = rawValue.rawValue;
  return rawValue;
}

void static WeatherDataCaching.Options.allowsExpiredData.getter(void *a1@<X8>)
{
}

void static WeatherDataCaching.Options.allowsFlexibleMarineTimeWindow.getter(void *a1@<X8>)
{
}

void static WeatherDataCaching.Options.allowsMissingProducts.getter(void *a1@<X8>)
{
}

void static WeatherDataCaching.Options.reloadIgnoringLocalCacheData.getter(void *a1@<X8>)
{
}

uint64_t WeatherDataCaching.Options.rawValue.getter()
{
  return *(void *)v0;
}

WeatherDaemon::WeatherDataCaching::Options sub_1A95E3670(Swift::Int *a1)
{
  return WeatherDataCaching.Options.init(rawValue:)(*a1);
}

uint64_t sub_1A95E3678()
{
  return sub_1A9632010();
}

uint64_t sub_1A95E36D8()
{
  return sub_1A9631FC0();
}

uint64_t sub_1A95E3728@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_1A95E3734(*a1, *v2, a2);
}

uint64_t sub_1A95E3734@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  *a3 = a2 | result;
  return result;
}

void sub_1A95E3740(void *a1@<X8>)
{
}

void sub_1A95E374C(void *a1@<X8>)
{
}

uint64_t sub_1A95E3754@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_1A95E3760(*a1, *v2, a2);
}

uint64_t sub_1A95E3760@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  *a3 = a2 ^ result;
  return result;
}

BOOL sub_1A95E376C(void *a1, uint64_t *a2)
{
  return sub_1A95E3774(a1, *a2);
}

BOOL sub_1A95E3774(void *a1, uint64_t a2)
{
  uint64_t v3 = *v2 & a2;
  if (v3 != a2) {
    *v2 |= a2;
  }
  *a1 = a2;
  return v3 != a2;
}

uint64_t sub_1A95E37A0@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_1A95E37A8(*a1, a2);
}

uint64_t sub_1A95E37A8@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *v2 & result;
  if (v3) {
    *v2 &= ~result;
  }
  *(void *)a2 = v3;
  *(unsigned char *)(a2 + 8) = v3 == 0;
  return result;
}

uint64_t sub_1A95E37D0@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_1A95E37D8(*a1, a2);
}

uint64_t sub_1A95E37D8@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *v2;
  *v2 |= result;
  uint64_t v4 = v3 & result;
  *(void *)a2 = v4;
  *(unsigned char *)(a2 + 8) = v4 == 0;
  return result;
}

uint64_t sub_1A95E37F8(uint64_t *a1)
{
  return sub_1A95E3800(*a1);
}

uint64_t sub_1A95E3800(uint64_t result)
{
  *v1 |= result;
  return result;
}

uint64_t sub_1A95E3810(uint64_t *a1)
{
  return sub_1A95E3818(*a1);
}

uint64_t sub_1A95E3818(uint64_t result)
{
  *v1 &= result;
  return result;
}

uint64_t sub_1A95E3828(uint64_t *a1)
{
  return sub_1A95E3830(*a1);
}

uint64_t sub_1A95E3830(uint64_t result)
{
  *v1 ^= result;
  return result;
}

uint64_t sub_1A95E3840@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_1A95E384C(*a1, *v2, a2);
}

uint64_t sub_1A95E384C@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  *a3 = a2 & ~result;
  return result;
}

BOOL sub_1A95E3858(uint64_t *a1)
{
  return sub_1A95E3864(*a1, *v1);
}

BOOL sub_1A95E3864(uint64_t a1, uint64_t a2)
{
  return (a2 & ~a1) == 0;
}

BOOL sub_1A95E3870(uint64_t *a1)
{
  return sub_1A95E387C(*a1, *v1);
}

BOOL sub_1A95E387C(uint64_t a1, uint64_t a2)
{
  return (a2 & a1) == 0;
}

BOOL sub_1A95E3888(uint64_t *a1)
{
  return sub_1A95E3894(*a1, *v1);
}

BOOL sub_1A95E3894(uint64_t a1, uint64_t a2)
{
  return (a1 & ~a2) == 0;
}

BOOL sub_1A95E38A0()
{
  return sub_1A95E38A8(*v0);
}

BOOL sub_1A95E38A8(uint64_t a1)
{
  return a1 == 0;
}

uint64_t sub_1A95E38B4(uint64_t *a1)
{
  return sub_1A95E38BC(*a1);
}

uint64_t sub_1A95E38BC(uint64_t result)
{
  *v1 &= ~result;
  return result;
}

WeatherDaemon::WeatherDataCaching::Options sub_1A95E38CC@<X0>(Swift::Int *a1@<X0>, uint64_t a2@<X8>)
{
  result.rawValue = WeatherDataCaching.Options.init(rawValue:)(*a1).rawValue;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

uint64_t sub_1A95E38F8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = WeatherDataCaching.Options.rawValue.getter();
  *a1 = result;
  return result;
}

BOOL sub_1A95E3920(uint64_t *a1, uint64_t *a2)
{
  return sub_1A950C608(*a1, *a2);
}

BOOL static WeatherDataCaching.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t WeatherDataCaching.hash(into:)()
{
  return sub_1A9632910();
}

uint64_t sub_1A95E3974(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x64656C6261736964 && a2 == 0xE800000000000000;
  if (v2 || (sub_1A96327D0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x64656C62616E65 && a2 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v7 = sub_1A96327D0();
    swift_bridgeObjectRelease();
    if (v7) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_1A95E3A64(char a1)
{
  if (a1) {
    return 0x64656C62616E65;
  }
  else {
    return 0x64656C6261736964;
  }
}

uint64_t sub_1A95E3A9C()
{
  return sub_1A95E3A64(*v0);
}

uint64_t sub_1A95E3AA4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1A95E3974(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1A95E3ACC(uint64_t a1)
{
  unint64_t v2 = sub_1A95E3E20();
  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1A95E3B08(uint64_t a1)
{
  unint64_t v2 = sub_1A95E3E20();
  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t sub_1A95E3B44(uint64_t a1)
{
  unint64_t v2 = sub_1A95E3EB8();
  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1A95E3B80(uint64_t a1)
{
  unint64_t v2 = sub_1A95E3EB8();
  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t sub_1A95E3BBC(uint64_t a1)
{
  unint64_t v2 = sub_1A95E3E6C();
  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1A95E3BF8(uint64_t a1)
{
  unint64_t v2 = sub_1A95E3E6C();
  return MEMORY[0x1F41862B0](a1, v2);
}

void WeatherDataCaching.encode(to:)()
{
  OUTLINED_FUNCTION_3();
  uint64_t v3 = v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E97ED178);
  OUTLINED_FUNCTION_1();
  MEMORY[0x1F4188790](v4);
  OUTLINED_FUNCTION_1_1();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E97ED180);
  OUTLINED_FUNCTION_1();
  MEMORY[0x1F4188790](v5);
  OUTLINED_FUNCTION_2_33();
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E97ED188);
  OUTLINED_FUNCTION_1();
  uint64_t v8 = v7;
  MEMORY[0x1F4188790](v9);
  OUTLINED_FUNCTION_123();
  char v10 = *v0;
  __swift_project_boxed_opaque_existential_1(v3, v3[3]);
  sub_1A95E3E20();
  sub_1A9632970();
  uint64_t v11 = (void (**)(uint64_t, uint64_t))(v8 + 8);
  if (v10) {
    sub_1A95E3E6C();
  }
  else {
    sub_1A95E3EB8();
  }
  sub_1A96326C0();
  OUTLINED_FUNCTION_34();
  v13(v12);
  (*v11)(v1, v6);
  OUTLINED_FUNCTION_4_0();
}

unint64_t sub_1A95E3E20()
{
  unint64_t result = qword_1E97ED190;
  if (!qword_1E97ED190)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97ED190);
  }
  return result;
}

unint64_t sub_1A95E3E6C()
{
  unint64_t result = qword_1E97ED198;
  if (!qword_1E97ED198)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97ED198);
  }
  return result;
}

unint64_t sub_1A95E3EB8()
{
  unint64_t result = qword_1E97ED1A0;
  if (!qword_1E97ED1A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97ED1A0);
  }
  return result;
}

uint64_t WeatherDataCaching.hashValue.getter()
{
  return sub_1A9632930();
}

void WeatherDataCaching.init(from:)()
{
  OUTLINED_FUNCTION_3();
  uint64_t v3 = v2;
  uint64_t v22 = v4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E97ED1A8);
  OUTLINED_FUNCTION_1();
  MEMORY[0x1F4188790](v5);
  OUTLINED_FUNCTION_26();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E97ED1B0);
  OUTLINED_FUNCTION_1();
  MEMORY[0x1F4188790](v6);
  OUTLINED_FUNCTION_5_25();
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E97ED1B8);
  OUTLINED_FUNCTION_1();
  uint64_t v23 = v8;
  MEMORY[0x1F4188790](v9);
  OUTLINED_FUNCTION_6_0();
  __swift_project_boxed_opaque_existential_1(v3, v3[3]);
  sub_1A95E3E20();
  sub_1A9632950();
  if (v0) {
    goto LABEL_6;
  }
  uint64_t v24 = (uint64_t)v3;
  uint64_t v10 = sub_1A96326A0();
  uint64_t v11 = *(void *)(v10 + 16);
  if (!v11
    || (char v12 = *(unsigned char *)(v10 + 32),
        sub_1A96196F0(1, v11, v10, v10 + 32, 0, (2 * v11) | 1),
        uint64_t v14 = v13,
        unint64_t v16 = v15,
        swift_bridgeObjectRelease(),
        v14 != v16 >> 1))
  {
    sub_1A96324A0();
    swift_allocError();
    uint64_t v18 = v17;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E97ED1C0);
    void *v18 = &type metadata for WeatherDataCaching;
    sub_1A96325B0();
    sub_1A9632490();
    OUTLINED_FUNCTION_4_8();
    (*(void (**)(void *))(v19 + 104))(v18);
    swift_willThrow();
    swift_unknownObjectRelease();
    OUTLINED_FUNCTION_34();
    v20();
    uint64_t v3 = (void *)v24;
LABEL_6:
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v3);
    goto LABEL_7;
  }
  sub_1A95E3E6C();
  sub_1A96325A0();
  OUTLINED_FUNCTION_34();
  v21();
  swift_unknownObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v23 + 8))(v1, v7);
  *uint64_t v22 = v12;
  __swift_destroy_boxed_opaque_existential_1(v24);
LABEL_7:
  OUTLINED_FUNCTION_4_0();
}

void sub_1A95E4360()
{
}

void sub_1A95E4378()
{
}

uint64_t sub_1A95E4390(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 16);
  if (*(void *)(a1 + 16))
  {
    if (!v2) {
      return 1;
    }
  }
  else if (!v2)
  {
    if (qword_1EB6DE388 != -1) {
      swift_once();
    }
    uint64_t v4 = sub_1A96317F0();
    __swift_project_value_buffer(v4, (uint64_t)qword_1EB6EB630);
    uint64_t v5 = sub_1A96317D0();
    os_log_type_t v6 = sub_1A9632220();
    if (os_log_type_enabled(v5, v6))
    {
      uint64_t v7 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl(&dword_1A9410000, v5, v6, "Caller error: we failed to find cached products but we also don't have missing products.", v7, 2u);
      MEMORY[0x1AD0F7300](v7, -1, -1);
    }
  }
  return 0;
}

uint64_t sub_1A95E4488(unsigned char *a1, uint64_t a2, unsigned char *a3, uint64_t a4)
{
  *a1 = *a3;
  sub_1A961B118(a4, a2);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6DC8E8);
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_1A95E44F0()
{
  swift_retain();
  sub_1A96315F0();
  swift_release();
  return v1;
}

uint64_t sub_1A95E4534@<X0>(uint64_t (*a1)(void)@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = a1();
  *a2 = result;
  return result;
}

uint64_t sub_1A95E4704()
{
  sub_1A962EAE0();
  sub_1A962EAD0();
  if (qword_1EB6DCC10 != -1) {
    swift_once();
  }
  sub_1A962EAC0();
  uint64_t result = swift_release();
  if (v1 == 1)
  {
    type metadata accessor for Settings.DaemonStore();
    swift_initStaticObject();
    sub_1A961B500((unint64_t *)&qword_1E97EAA98, (void (*)(uint64_t))type metadata accessor for Settings.DaemonStore);
    sub_1A962EB60();
    sub_1A9615D3C();
    sub_1A9615044();
    sub_1A96152DC();
    sub_1A9615574();
    sub_1A961626C();
    sub_1A9615FD4();
    sub_1A961580C();
    sub_1A9615AA4();
    sub_1A961679C();
    sub_1A9616A34();
    sub_1A9616504();
    sub_1A9616CCC();
    sub_1A9616F64();
    sub_1A96171FC();
    sub_1A9617494();
    sub_1A961772C();
    sub_1A96179C4();
    sub_1A9617C5C();
    sub_1A9617EF4();
    sub_1A961818C();
    sub_1A9618424();
    return sub_1A96186BC();
  }
  return result;
}

void sub_1A95E4868()
{
  OUTLINED_FUNCTION_7_15();
  uint64_t v5 = v4;
  OUTLINED_FUNCTION_27_0();
  uint64_t v64 = type metadata accessor for InterpolationInputProducts();
  OUTLINED_FUNCTION_10();
  MEMORY[0x1F4188790](v6);
  OUTLINED_FUNCTION_14_17(v7, v61);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6DE0F8);
  uint64_t v9 = OUTLINED_FUNCTION_2_0(v8);
  MEMORY[0x1F4188790](v9);
  OUTLINED_FUNCTION_1_1();
  uint64_t v67 = v10;
  uint64_t v11 = type metadata accessor for DailyForecast();
  uint64_t v12 = OUTLINED_FUNCTION_2_0(v11);
  MEMORY[0x1F4188790](v12);
  OUTLINED_FUNCTION_38_0(v13, v62);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6DC948);
  uint64_t v15 = OUTLINED_FUNCTION_2_0(v14);
  MEMORY[0x1F4188790](v15);
  OUTLINED_FUNCTION_92_1(v16, v63);
  MEMORY[0x1F4188790](v17);
  OUTLINED_FUNCTION_32_6();
  uint64_t v18 = type metadata accessor for HourlyForecast();
  uint64_t v19 = OUTLINED_FUNCTION_2_0(v18);
  MEMORY[0x1F4188790](v19);
  OUTLINED_FUNCTION_1_1();
  uint64_t v69 = v20;
  uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6DD388);
  uint64_t v22 = OUTLINED_FUNCTION_2_0(v21);
  MEMORY[0x1F4188790](v22);
  OUTLINED_FUNCTION_2_26();
  uint64_t v23 = sub_1A962EA40();
  OUTLINED_FUNCTION_1();
  uint64_t v70 = v24;
  MEMORY[0x1F4188790](v25);
  OUTLINED_FUNCTION_1_1();
  uint64_t v27 = v26;
  uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6DD538);
  uint64_t v29 = OUTLINED_FUNCTION_2_0(v28);
  MEMORY[0x1F4188790](v29);
  OUTLINED_FUNCTION_5_24();
  type metadata accessor for WeatherInterpolationOptions();
  OUTLINED_FUNCTION_10();
  MEMORY[0x1F4188790](v30);
  OUTLINED_FUNCTION_6_1();
  uint64_t v31 = type metadata accessor for WeatherRequestOptions();
  sub_1A944A348((uint64_t)v5 + *(int *)(v31 + 52), v0, &qword_1EB6DD538);
  OUTLINED_FUNCTION_143_0(v0);
  if (!v32)
  {
    sub_1A9449580(v0, v1);
    sub_1A944A348((uint64_t)v5 + *(int *)(v31 + 20), v3, &qword_1EB6DD388);
    int EnumTagSinglePayload = __swift_getEnumTagSinglePayload(v3, 1, v23);
    if (EnumTagSinglePayload == 1)
    {
      sub_1A944C480(v3, &qword_1EB6DD388);
      if (qword_1EB6DE388 != -1) {
        swift_once();
      }
      uint64_t v40 = sub_1A96317F0();
      uint64_t v41 = OUTLINED_FUNCTION_57_0(v40, (uint64_t)qword_1EB6EB630);
      os_log_type_t v42 = sub_1A9632220();
      if (os_log_type_enabled(v41, v42))
      {
        unint64_t v43 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)unint64_t v43 = 0;
        _os_log_impl(&dword_1A9410000, v41, v42, "missing timeZoneIdentifier ... aborting", v43, 2u);
        OUTLINED_FUNCTION_3_1();
      }

      sub_1A94E8B58();
      swift_allocError();
      OUTLINED_FUNCTION_129_0();
      OUTLINED_FUNCTION_121_0(v44, v45);
      __swift_instantiateConcreteTypeFromMangledName(qword_1EB6DA628);
      OUTLINED_FUNCTION_10_0();
      sub_1A9631700();
      goto LABEL_26;
    }
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v70 + 32))(v27, v3, v23);
    double v46 = OUTLINED_FUNCTION_19_0();
    uint64_t v49 = sub_1A95E50C8(v47, v5, v46, v48);
    sub_1A94AE29C(3u, v49);
    type metadata accessor for WeatherModel();
    OUTLINED_FUNCTION_143_0(v2);
    if (v32)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    else
    {
      int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
      if (EnumCaseMultiPayload != 3)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
LABEL_23:
        sub_1A961B3A4(v2, (void (*)(void))type metadata accessor for WeatherModel);
        goto LABEL_24;
      }
      sub_1A9449580(v2, v69);
      uint64_t v2 = v68;
      sub_1A94AE29C(2u, v49);
      OUTLINED_FUNCTION_143_0(v68);
      if (!v32)
      {
        int v54 = swift_getEnumCaseMultiPayload();
        if (v54 == 2)
        {
          sub_1A9449580(v68, v66);
          sub_1A95EDA50(v49, v67);
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          sub_1A961B118(v69, v65);
          sub_1A961B118(v66, v65 + *(int *)(v64 + 20));
          sub_1A944A348(v67, v65 + *(int *)(v64 + 24), &qword_1EB6DE0F8);
          double v55 = OUTLINED_FUNCTION_19_0();
          uint64_t v58 = sub_1A95EDBA0(v65, v1, v56, v27, v55, v57);
          sub_1A961B3A4(v65, (void (*)(void))type metadata accessor for InterpolationInputProducts);
          if (v58)
          {
            __swift_instantiateConcreteTypeFromMangledName(qword_1EB6DA628);
            OUTLINED_FUNCTION_10_0();
            sub_1A9631710();
          }
          else
          {
            sub_1A94E8B58();
            swift_allocError();
            OUTLINED_FUNCTION_129_0();
            OUTLINED_FUNCTION_121_0(v60, v59 + 39);
            __swift_instantiateConcreteTypeFromMangledName(qword_1EB6DA628);
            OUTLINED_FUNCTION_10_0();
            sub_1A9631700();
          }
          sub_1A944C480(v67, &qword_1EB6DE0F8);
          sub_1A961B3A4(v66, (void (*)(void))type metadata accessor for DailyForecast);
          sub_1A961B3A4(v69, (void (*)(void))type metadata accessor for HourlyForecast);
          goto LABEL_25;
        }
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        sub_1A961B3A4(v69, (void (*)(void))type metadata accessor for HourlyForecast);
        goto LABEL_23;
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_1A961B3A4(v69, (void (*)(void))type metadata accessor for HourlyForecast);
    }
    sub_1A944C480(v2, &qword_1EB6DC948);
LABEL_24:
    double v51 = OUTLINED_FUNCTION_19_0();
    sub_1A95ED764((uint64_t)v5, v1, v52, v27, v51, v53);
LABEL_25:
    (*(void (**)(uint64_t, uint64_t))(v70 + 8))(v27, v23);
LABEL_26:
    sub_1A961B3A4(v1, (void (*)(void))type metadata accessor for WeatherInterpolationOptions);
    goto LABEL_27;
  }
  sub_1A944C480(v0, &qword_1EB6DD538);
  if (qword_1EB6DE388 != -1) {
    swift_once();
  }
  uint64_t v33 = sub_1A96317F0();
  uint64_t v34 = OUTLINED_FUNCTION_57_0(v33, (uint64_t)qword_1EB6EB630);
  os_log_type_t v35 = sub_1A9632220();
  if (os_log_type_enabled(v34, v35))
  {
    uint64_t v36 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v36 = 0;
    OUTLINED_FUNCTION_3_1();
  }

  sub_1A94E8B58();
  swift_allocError();
  OUTLINED_FUNCTION_129_0();
  OUTLINED_FUNCTION_121_0(v38, v37 + 5);
  __swift_instantiateConcreteTypeFromMangledName(qword_1EB6DA628);
  OUTLINED_FUNCTION_10_0();
  sub_1A9631700();
LABEL_27:
  OUTLINED_FUNCTION_47();
}

uint64_t sub_1A95E50C8(uint64_t a1, NSObject *a2, double a3, double a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6DDA28);
  MEMORY[0x1F4188790](v10 - 8);
  uint64_t v12 = (char *)v512 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v572 = type metadata accessor for WeatherComparisons();
  MEMORY[0x1F4188790](v572);
  uint64_t v568 = (uint64_t)v512 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6DDE70);
  MEMORY[0x1F4188790](v14 - 8);
  uint64_t v16 = (char *)v512 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v571 = type metadata accessor for WeatherChange();
  MEMORY[0x1F4188790](v571);
  uint64_t v567 = (uint64_t)v512 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6DD620);
  MEMORY[0x1F4188790](v18 - 8);
  uint64_t v20 = (char *)v512 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v566 = type metadata accessor for WeatherAlerts();
  MEMORY[0x1F4188790](v566);
  uint64_t v527 = (uint64_t)v512 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6DD1D8);
  MEMORY[0x1F4188790](v22 - 8);
  uint64_t v24 = (char *)v512 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v565 = type metadata accessor for TideEvents();
  MEMORY[0x1F4188790](v565);
  uint64_t v526 = (uint64_t)v512 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6DD938);
  MEMORY[0x1F4188790](v26 - 8);
  uint64_t v564 = (uint64_t)v512 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v563 = type metadata accessor for News();
  MEMORY[0x1F4188790](v563);
  uint64_t v525 = (uint64_t)v512 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6DD258);
  MEMORY[0x1F4188790](v29 - 8);
  v583 = (char *)v512 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v562 = type metadata accessor for MarineForecast();
  MEMORY[0x1F4188790](v562);
  uint64_t v524 = (uint64_t)v512 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6DD6F8);
  MEMORY[0x1F4188790](v32 - 8);
  v582 = (char *)v512 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v561 = type metadata accessor for LocationInfo();
  MEMORY[0x1F4188790](v561);
  uint64_t v523 = (uint64_t)v512 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E97EAC40);
  MEMORY[0x1F4188790](v35 - 8);
  v585 = (char *)v512 - ((v36 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v560 = type metadata accessor for PeriodicForecasts();
  MEMORY[0x1F4188790](v560);
  uint64_t v522 = (uint64_t)v512 - ((v37 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6DE0F8);
  MEMORY[0x1F4188790](v38 - 8);
  uint64_t v559 = (uint64_t)v512 - ((v39 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t HourForecast = type metadata accessor for NextHourForecast();
  MEMORY[0x1F4188790](HourForecast);
  uint64_t v521 = (uint64_t)v512 - ((v40 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6DE0F0);
  MEMORY[0x1F4188790](v41 - 8);
  v591 = (char *)v512 - ((v42 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v557 = type metadata accessor for HourlyForecast();
  MEMORY[0x1F4188790](v557);
  uint64_t v520 = (uint64_t)v512 - ((v43 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v44 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6DDBB0);
  MEMORY[0x1F4188790](v44 - 8);
  uint64_t v556 = (uint64_t)v512 - ((v45 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v555 = type metadata accessor for DailyForecast();
  MEMORY[0x1F4188790](v555);
  uint64_t v519 = (uint64_t)v512 - ((v46 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v47 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6DDC38);
  MEMORY[0x1F4188790](v47 - 8);
  uint64_t v554 = (uint64_t)v512 - ((v48 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v553 = type metadata accessor for CurrentWeather();
  MEMORY[0x1F4188790](v553);
  uint64_t v518 = (uint64_t)v512 - ((v49 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v584 = sub_1A96317F0();
  uint64_t v50 = *(void *)(v584 - 8);
  MEMORY[0x1F4188790](v584);
  v515 = (char *)v512 - ((v51 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v52);
  v514 = (char *)v512 - v53;
  MEMORY[0x1F4188790](v54);
  v552 = (char *)v512 - v55;
  MEMORY[0x1F4188790](v56);
  v551 = (char *)v512 - v57;
  MEMORY[0x1F4188790](v58);
  v550 = (char *)v512 - v59;
  MEMORY[0x1F4188790](v60);
  v549 = (char *)v512 - v61;
  MEMORY[0x1F4188790](v62);
  v539 = (char *)v512 - v63;
  MEMORY[0x1F4188790](v64);
  v538 = (char *)v512 - v65;
  MEMORY[0x1F4188790](v66);
  v537 = (char *)v512 - v67;
  MEMORY[0x1F4188790](v68);
  v536 = (char *)v512 - v69;
  MEMORY[0x1F4188790](v70);
  v535 = (char *)v512 - v71;
  MEMORY[0x1F4188790](v72);
  v534 = (char *)v512 - v73;
  MEMORY[0x1F4188790](v74);
  v533 = (char *)v512 - v75;
  MEMORY[0x1F4188790](v76);
  v532 = (char *)v512 - v77;
  MEMORY[0x1F4188790](v78);
  v548 = (char *)v512 - v79;
  MEMORY[0x1F4188790](v80);
  v547 = (char *)v512 - v81;
  MEMORY[0x1F4188790](v82);
  v531 = (char *)v512 - v83;
  MEMORY[0x1F4188790](v84);
  v530 = (char *)v512 - v85;
  MEMORY[0x1F4188790](v86);
  v546 = (char *)v512 - v87;
  MEMORY[0x1F4188790](v88);
  v545 = (char *)v512 - v89;
  MEMORY[0x1F4188790](v90);
  v544 = (char *)v512 - v91;
  MEMORY[0x1F4188790](v92);
  v529 = (char *)v512 - v93;
  MEMORY[0x1F4188790](v94);
  v528 = (char *)v512 - v95;
  uint64_t v96 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6DC948);
  MEMORY[0x1F4188790](v96 - 8);
  v581 = (void *)((char *)v512 - ((v97 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v98 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6DE088);
  MEMORY[0x1F4188790](v98 - 8);
  uint64_t v543 = (uint64_t)v512 - ((v99 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v542 = type metadata accessor for AirQuality();
  MEMORY[0x1F4188790](v542);
  uint64_t v517 = (uint64_t)v512 - ((v100 + 15) & 0xFFFFFFFFFFFFFFF0);
  v586 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))((char *)&a2->isa
                                                             + *(int *)(type metadata accessor for WeatherRequestOptions()
                                                                      + 64));
  sub_1A9481790(0);
  uint64_t v101 = type metadata accessor for WeatherModel();
  sub_1A942AB08();
  uint64_t v580 = v101;
  uint64_t v102 = sub_1A9631CC0();
  uint64_t v598 = v102;
  v597[1] = sub_1A9481710(0);
  v573 = a2;
  uint64_t v590 = sub_1A95F0878();
  unint64_t v104 = v103;
  uint64_t v589 = sub_1A95319B4(a1);
  if (!v589)
  {
    swift_bridgeObjectRelease();
    return v102;
  }
  v540 = v24;
  v541 = v20;
  v569 = v16;
  v570 = v12;
  v578 = (void (**)(char *, uint64_t, uint64_t))(v50 + 16);
  v577 = (void (**)(char *, uint64_t))(v50 + 8);
  sub_1A9631510();
  unint64_t v105 = 0;
  uint64_t v574 = 0;
  long long v575 = xmmword_1A9643AC0;
  v512[1] = MEMORY[0x1E4FBC840] + 8;
  uint64_t v588 = a1;
  uint64_t v579 = v5;
  uint64_t v107 = (uint64_t)v582;
  uint64_t v106 = (uint64_t)v583;
  uint64_t v109 = v584;
  uint64_t v108 = (uint64_t)v585;
  unint64_t v110 = v104;
  uint64_t v111 = (uint64_t)v591;
  unint64_t v587 = v110;
  uint64_t v112 = a1;
  while (2)
  {
    if ((sub_1A948BEE8() & 1) == 0)
    {
      sub_1A95651C0(v105, v112);
      __break(1u);
LABEL_267:
      __break(1u);
      goto LABEL_268;
    }
    a1 = v105 + 1;
    if (__OFADD__(v105, 1)) {
      goto LABEL_267;
    }
    uint64_t v113 = *(unsigned __int8 *)(v112 + v105 + 32);
    switch(v113)
    {
      case 1:
        v593 = v586;
        uint64_t v248 = v554;
        sub_1A9601C4C(v590, v110, (uint64_t *)&v593, v554);
        if (__swift_getEnumTagSinglePayload(v248, 1, v553) != 1)
        {
          uint64_t v358 = v248;
          uint64_t v351 = v518;
          sub_1A9449580(v358, v518);
          v359 = v581;
          sub_1A961B118(v351, (uint64_t)v581);
          uint64_t v360 = v580;
          swift_storeEnumTagMultiPayload();
          __swift_storeEnumTagSinglePayload((uint64_t)v359, 0, 1, v360);
          sub_1A9480798((uint64_t)v359, 1);
          v354 = type metadata accessor for CurrentWeather;
LABEL_156:
          sub_1A961B3A4(v351, (void (*)(void))v354);
          goto LABEL_157;
        }
        uint64_t v592 = v105 + 1;
        sub_1A944C480(v248, &qword_1EB6DDC38);
        sub_1A95CBF74(1);
        uint64_t v249 = sub_1A95AA978();
        (*v578)(v544, v249, v109);
        uint64_t v250 = swift_allocObject();
        *(double *)(v250 + 16) = a3;
        *(double *)(v250 + 24) = a4;
        os_log_t v516 = (os_log_t)sub_1A96317D0();
        int v251 = sub_1A9632230();
        uint64_t v252 = swift_allocObject();
        *(unsigned char *)(v252 + 16) = 112;
        uint64_t v253 = swift_allocObject();
        *(unsigned char *)(v253 + 16) = 8;
        uint64_t v254 = swift_allocObject();
        *(void *)(v254 + 16) = 1752392040;
        uint64_t v255 = swift_allocObject();
        *(void *)(v255 + 16) = sub_1A961B670;
        *(void *)(v255 + 24) = v254;
        uint64_t v256 = swift_allocObject();
        *(unsigned char *)(v256 + 16) = 33;
        uint64_t v257 = swift_allocObject();
        *(unsigned char *)(v257 + 16) = 8;
        uint64_t v258 = swift_allocObject();
        *(void *)(v258 + 16) = sub_1A961B548;
        *(void *)(v258 + 24) = v250;
        uint64_t v259 = swift_allocObject();
        *(void *)(v259 + 16) = sub_1A961B54C;
        *(void *)(v259 + 24) = v258;
        __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6DE290);
        uint64_t v260 = swift_allocObject();
        *(_OWORD *)(v260 + 16) = v575;
        *(void *)(v260 + 32) = sub_1A961B558;
        *(void *)(v260 + 40) = v252;
        *(void *)(v260 + 48) = sub_1A961B558;
        *(void *)(v260 + 56) = v253;
        *(void *)(v260 + 64) = sub_1A961B550;
        *(void *)(v260 + 72) = v255;
        *(void *)(v260 + 80) = sub_1A961B558;
        *(void *)(v260 + 88) = v256;
        *(void *)(v260 + 96) = sub_1A961B558;
        *(void *)(v260 + 104) = v257;
        *(void *)(v260 + 112) = sub_1A961B554;
        *(void *)(v260 + 120) = v259;
        swift_retain();
        swift_retain();
        swift_retain();
        swift_retain();
        swift_retain();
        swift_retain();
        v261 = v516;
        swift_bridgeObjectRelease();
        int v513 = v251;
        if (os_log_type_enabled(v261, (os_log_type_t)v251))
        {
          unint64_t v130 = (uint8_t *)sub_1A952A20C();
          uint64_t v131 = swift_slowAlloc();
          uint64_t v595 = v131;
          uint64_t v596 = 0;
          *(_WORD *)unint64_t v130 = 515;
          v597[0] = (uint64_t)(v130 + 2);
          v593 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1A961B558;
          uint64_t v594 = v252;
          a1 = v574;
          sub_1A9476698(&v593, (uint64_t)v597, (uint64_t)&v596, (uint64_t)&v595);
          if (!a1)
          {
            swift_release();
            v593 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1A961B558;
            uint64_t v594 = v253;
            sub_1A9476698(&v593, (uint64_t)v597, (uint64_t)&v596, (uint64_t)&v595);
            swift_release();
            v593 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1A961B550;
            uint64_t v594 = v255;
            sub_1A9476698(&v593, (uint64_t)v597, (uint64_t)&v596, (uint64_t)&v595);
            swift_release();
            v593 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1A961B558;
            uint64_t v594 = v256;
            sub_1A9476698(&v593, (uint64_t)v597, (uint64_t)&v596, (uint64_t)&v595);
            swift_release();
            v593 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1A961B558;
            uint64_t v594 = v257;
            sub_1A9476698(&v593, (uint64_t)v597, (uint64_t)&v596, (uint64_t)&v595);
            swift_release();
            v593 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1A961B554;
            uint64_t v594 = v259;
            sub_1A9476698(&v593, (uint64_t)v597, (uint64_t)&v596, (uint64_t)&v595);
            uint64_t v574 = 0;
            swift_release();
            os_log_type_t v132 = v513;
            unint64_t v133 = v516;
            unint64_t v134 = "Cache miss for currentWeather; location=%{private,mask.hash}s";
LABEL_242:
            _os_log_impl(&dword_1A9410000, v133, v132, v134, v130, 0x16u);
            goto LABEL_243;
          }
          goto LABEL_268;
        }

        swift_release();
        swift_release();
        swift_release();
        swift_release();
        swift_release();
        swift_release();
        v452 = *v577;
        v453 = (uint64_t *)&v575 + 1;
        goto LABEL_256;
      case 2:
        uint64_t v199 = sub_1A95F73E0((uint64_t)v573, v590, v110);
        v593 = v586;
        uint64_t v200 = v556;
        sub_1A960267C(v199, v201, (uint64_t *)&v593, v556);
        swift_bridgeObjectRelease();
        if (__swift_getEnumTagSinglePayload(v200, 1, v555) == 1)
        {
          uint64_t v592 = v105 + 1;
          sub_1A944C480(v200, &qword_1EB6DDBB0);
          sub_1A95CBF74(2);
          uint64_t v202 = sub_1A95AA978();
          (*v578)(v545, v202, v584);
          uint64_t v203 = swift_allocObject();
          *(double *)(v203 + 16) = a3;
          *(double *)(v203 + 24) = a4;
          os_log_t v516 = (os_log_t)sub_1A96317D0();
          int v204 = sub_1A9632230();
          uint64_t v205 = swift_allocObject();
          *(unsigned char *)(v205 + 16) = 112;
          uint64_t v206 = swift_allocObject();
          *(unsigned char *)(v206 + 16) = 8;
          uint64_t v207 = swift_allocObject();
          *(void *)(v207 + 16) = 1752392040;
          uint64_t v208 = swift_allocObject();
          *(void *)(v208 + 16) = sub_1A961B670;
          *(void *)(v208 + 24) = v207;
          uint64_t v209 = swift_allocObject();
          *(unsigned char *)(v209 + 16) = 33;
          uint64_t v210 = swift_allocObject();
          *(unsigned char *)(v210 + 16) = 8;
          uint64_t v211 = swift_allocObject();
          *(void *)(v211 + 16) = sub_1A961B548;
          *(void *)(v211 + 24) = v203;
          uint64_t v212 = swift_allocObject();
          *(void *)(v212 + 16) = sub_1A961B54C;
          *(void *)(v212 + 24) = v211;
          __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6DE290);
          uint64_t v213 = swift_allocObject();
          *(_OWORD *)(v213 + 16) = v575;
          *(void *)(v213 + 32) = sub_1A961B558;
          *(void *)(v213 + 40) = v205;
          *(void *)(v213 + 48) = sub_1A961B558;
          *(void *)(v213 + 56) = v206;
          *(void *)(v213 + 64) = sub_1A961B550;
          *(void *)(v213 + 72) = v208;
          *(void *)(v213 + 80) = sub_1A961B558;
          *(void *)(v213 + 88) = v209;
          *(void *)(v213 + 96) = sub_1A961B558;
          *(void *)(v213 + 104) = v210;
          *(void *)(v213 + 112) = sub_1A961B554;
          *(void *)(v213 + 120) = v212;
          swift_retain();
          swift_retain();
          swift_retain();
          swift_retain();
          swift_retain();
          swift_retain();
          v214 = v516;
          swift_bridgeObjectRelease();
          int v513 = v204;
          if (os_log_type_enabled(v214, (os_log_type_t)v204))
          {
            unint64_t v130 = (uint8_t *)sub_1A952A20C();
            uint64_t v131 = swift_slowAlloc();
            uint64_t v595 = v131;
            uint64_t v596 = 0;
            *(_WORD *)unint64_t v130 = 515;
            v597[0] = (uint64_t)(v130 + 2);
            v593 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1A961B558;
            uint64_t v594 = v205;
            a1 = v574;
            sub_1A9476698(&v593, (uint64_t)v597, (uint64_t)&v596, (uint64_t)&v595);
            if (!a1)
            {
              swift_release();
              v593 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1A961B558;
              uint64_t v594 = v206;
              sub_1A9476698(&v593, (uint64_t)v597, (uint64_t)&v596, (uint64_t)&v595);
              swift_release();
              v593 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1A961B550;
              uint64_t v594 = v208;
              sub_1A9476698(&v593, (uint64_t)v597, (uint64_t)&v596, (uint64_t)&v595);
              swift_release();
              v593 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1A961B558;
              uint64_t v594 = v209;
              sub_1A9476698(&v593, (uint64_t)v597, (uint64_t)&v596, (uint64_t)&v595);
              swift_release();
              v593 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1A961B558;
              uint64_t v594 = v210;
              sub_1A9476698(&v593, (uint64_t)v597, (uint64_t)&v596, (uint64_t)&v595);
              swift_release();
              v593 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1A961B554;
              uint64_t v594 = v212;
              sub_1A9476698(&v593, (uint64_t)v597, (uint64_t)&v596, (uint64_t)&v595);
              uint64_t v574 = 0;
              swift_release();
              os_log_type_t v132 = v513;
              unint64_t v133 = v516;
              unint64_t v134 = "Cache miss for forecastDaily; location=%{private,mask.hash}s";
              goto LABEL_242;
            }
LABEL_268:
            for (i = (void *)a1; ; i = *(void **)(v511 - 256))
            {

              __break(1u);
            }
          }

          swift_release();
          swift_release();
          swift_release();
          swift_release();
          swift_release();
          swift_release();
          v452 = *v577;
          v453 = (uint64_t *)&v576;
LABEL_256:
          uint64_t v109 = v584;
          v452((char *)*(v453 - 32), v584);
          uint64_t v107 = (uint64_t)v582;
          uint64_t v106 = (uint64_t)v583;
          uint64_t v108 = (uint64_t)v585;
          unint64_t v110 = v587;
LABEL_257:
          a1 = v592;
        }
        else
        {
          uint64_t v348 = v519;
          sub_1A9449580(v200, v519);
          v349 = v581;
          sub_1A961B118(v348, (uint64_t)v581);
          uint64_t v350 = v580;
          swift_storeEnumTagMultiPayload();
          __swift_storeEnumTagSinglePayload((uint64_t)v349, 0, 1, v350);
          sub_1A9480798((uint64_t)v349, 2);
          sub_1A961B3A4(v348, (void (*)(void))type metadata accessor for DailyForecast);
          uint64_t v109 = v584;
LABEL_157:
          unint64_t v110 = v587;
        }
LABEL_258:
        uint64_t v112 = v588;
LABEL_259:
        ++v105;
        uint64_t v111 = (uint64_t)v591;
        if (a1 != v589) {
          continue;
        }
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        return v598;
      case 3:
        uint64_t v215 = sub_1A95F7E9C((uint64_t)v573, v590, v110);
        v593 = v586;
        sub_1A96030AC(v215, v216, (uint64_t *)&v593, v111);
        uint64_t v217 = (uint64_t)v591;
        swift_bridgeObjectRelease();
        if (__swift_getEnumTagSinglePayload(v217, 1, v557) != 1)
        {
          uint64_t v351 = v520;
          sub_1A9449580(v217, v520);
          v352 = v581;
          sub_1A961B118(v351, (uint64_t)v581);
          uint64_t v353 = v580;
          swift_storeEnumTagMultiPayload();
          __swift_storeEnumTagSinglePayload((uint64_t)v352, 0, 1, v353);
          sub_1A9480798((uint64_t)v352, 3);
          v354 = type metadata accessor for HourlyForecast;
          goto LABEL_156;
        }
        uint64_t v592 = v105 + 1;
        sub_1A944C480(v217, &qword_1EB6DE0F0);
        sub_1A95CBF74(3);
        uint64_t v218 = sub_1A95AA978();
        (*v578)(v546, v218, v109);
        uint64_t v219 = swift_allocObject();
        *(double *)(v219 + 16) = a3;
        *(double *)(v219 + 24) = a4;
        os_log_t v516 = (os_log_t)sub_1A96317D0();
        int v220 = sub_1A9632230();
        uint64_t v221 = swift_allocObject();
        *(unsigned char *)(v221 + 16) = 112;
        uint64_t v222 = swift_allocObject();
        *(unsigned char *)(v222 + 16) = 8;
        uint64_t v223 = swift_allocObject();
        *(void *)(v223 + 16) = 1752392040;
        uint64_t v224 = swift_allocObject();
        *(void *)(v224 + 16) = sub_1A961B670;
        *(void *)(v224 + 24) = v223;
        uint64_t v225 = swift_allocObject();
        *(unsigned char *)(v225 + 16) = 33;
        uint64_t v226 = swift_allocObject();
        *(unsigned char *)(v226 + 16) = 8;
        uint64_t v227 = swift_allocObject();
        *(void *)(v227 + 16) = sub_1A961B548;
        *(void *)(v227 + 24) = v219;
        uint64_t v228 = swift_allocObject();
        *(void *)(v228 + 16) = sub_1A961B54C;
        *(void *)(v228 + 24) = v227;
        __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6DE290);
        uint64_t v229 = swift_allocObject();
        *(_OWORD *)(v229 + 16) = v575;
        *(void *)(v229 + 32) = sub_1A961B558;
        *(void *)(v229 + 40) = v221;
        *(void *)(v229 + 48) = sub_1A961B558;
        *(void *)(v229 + 56) = v222;
        *(void *)(v229 + 64) = sub_1A961B550;
        *(void *)(v229 + 72) = v224;
        *(void *)(v229 + 80) = sub_1A961B558;
        *(void *)(v229 + 88) = v225;
        *(void *)(v229 + 96) = sub_1A961B558;
        *(void *)(v229 + 104) = v226;
        *(void *)(v229 + 112) = sub_1A961B554;
        *(void *)(v229 + 120) = v228;
        swift_retain();
        swift_retain();
        swift_retain();
        swift_retain();
        swift_retain();
        swift_retain();
        v230 = v516;
        swift_bridgeObjectRelease();
        int v513 = v220;
        if (os_log_type_enabled(v230, (os_log_type_t)v220))
        {
          unint64_t v130 = (uint8_t *)sub_1A952A20C();
          uint64_t v131 = swift_slowAlloc();
          uint64_t v595 = v131;
          uint64_t v596 = 0;
          *(_WORD *)unint64_t v130 = 515;
          v597[0] = (uint64_t)(v130 + 2);
          v593 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1A961B558;
          uint64_t v594 = v221;
          a1 = v574;
          sub_1A9476698(&v593, (uint64_t)v597, (uint64_t)&v596, (uint64_t)&v595);
          if (!a1)
          {
            swift_release();
            v593 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1A961B558;
            uint64_t v594 = v222;
            sub_1A9476698(&v593, (uint64_t)v597, (uint64_t)&v596, (uint64_t)&v595);
            swift_release();
            v593 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1A961B550;
            uint64_t v594 = v224;
            sub_1A9476698(&v593, (uint64_t)v597, (uint64_t)&v596, (uint64_t)&v595);
            swift_release();
            v593 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1A961B558;
            uint64_t v594 = v225;
            sub_1A9476698(&v593, (uint64_t)v597, (uint64_t)&v596, (uint64_t)&v595);
            swift_release();
            v593 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1A961B558;
            uint64_t v594 = v226;
            sub_1A9476698(&v593, (uint64_t)v597, (uint64_t)&v596, (uint64_t)&v595);
            swift_release();
            v593 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1A961B554;
            uint64_t v594 = v228;
            sub_1A9476698(&v593, (uint64_t)v597, (uint64_t)&v596, (uint64_t)&v595);
            uint64_t v574 = 0;
            swift_release();
            os_log_type_t v132 = v513;
            unint64_t v133 = v516;
            unint64_t v134 = "Cache miss for hourlyForecast; location=%{private,mask.hash}s";
            goto LABEL_242;
          }
          goto LABEL_268;
        }

        swift_release();
        swift_release();
        swift_release();
        swift_release();
        swift_release();
        swift_release();
        v452 = *v577;
        v453 = (uint64_t *)&v577;
        goto LABEL_256;
      case 4:
        uint64_t v592 = v105 + 1;
        v593 = v586;
        uint64_t v151 = v559;
        uint64_t v152 = v590;
        sub_1A9603ADC(v590, v110, (uint64_t *)&v593, v559);
        uint64_t v153 = HourForecast;
        if (__swift_getEnumTagSinglePayload(v151, 1, HourForecast) != 1)
        {
          uint64_t v332 = v151;
          uint64_t v333 = v521;
          sub_1A9449580(v332, v521);
          v334 = v581;
          sub_1A961B118(v333, (uint64_t)v581);
          __swift_storeEnumTagSinglePayload((uint64_t)v334, 0, 1, v153);
          uint64_t v335 = v580;
          swift_storeEnumTagMultiPayload();
          __swift_storeEnumTagSinglePayload((uint64_t)v334, 0, 1, v335);
          uint64_t v336 = (uint64_t)v334;
          unint64_t v110 = v587;
          sub_1A9480798(v336, 4);
          v337 = type metadata accessor for NextHourForecast;
LABEL_140:
          v346 = v337;
          uint64_t v347 = v333;
LABEL_159:
          sub_1A961B3A4(v347, (void (*)(void))v346);
          goto LABEL_257;
        }
        sub_1A944C480(v151, &qword_1EB6DE0F8);
        if (sub_1A960450C(v152, v110))
        {
          uint64_t v154 = sub_1A95AA978();
          (*v578)(v530, v154, v109);
          uint64_t v155 = swift_allocObject();
          *(double *)(v155 + 16) = a3;
          *(double *)(v155 + 24) = a4;
          os_log_t v516 = (os_log_t)sub_1A96317D0();
          int v156 = sub_1A9632230();
          uint64_t v157 = swift_allocObject();
          *(unsigned char *)(v157 + 16) = 112;
          uint64_t v158 = swift_allocObject();
          *(unsigned char *)(v158 + 16) = 8;
          uint64_t v159 = swift_allocObject();
          *(void *)(v159 + 16) = 1752392040;
          uint64_t v160 = swift_allocObject();
          *(void *)(v160 + 16) = sub_1A961B670;
          *(void *)(v160 + 24) = v159;
          uint64_t v161 = swift_allocObject();
          *(unsigned char *)(v161 + 16) = 33;
          uint64_t v162 = swift_allocObject();
          *(unsigned char *)(v162 + 16) = 8;
          uint64_t v163 = swift_allocObject();
          *(void *)(v163 + 16) = sub_1A961B548;
          *(void *)(v163 + 24) = v155;
          uint64_t v164 = swift_allocObject();
          *(void *)(v164 + 16) = sub_1A961B54C;
          *(void *)(v164 + 24) = v163;
          __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6DE290);
          uint64_t v165 = swift_allocObject();
          *(_OWORD *)(v165 + 16) = v575;
          *(void *)(v165 + 32) = sub_1A961B558;
          *(void *)(v165 + 40) = v157;
          *(void *)(v165 + 48) = sub_1A961B558;
          *(void *)(v165 + 56) = v158;
          *(void *)(v165 + 64) = sub_1A961B550;
          *(void *)(v165 + 72) = v160;
          *(void *)(v165 + 80) = sub_1A961B558;
          *(void *)(v165 + 88) = v161;
          *(void *)(v165 + 96) = sub_1A961B558;
          *(void *)(v165 + 104) = v162;
          *(void *)(v165 + 112) = sub_1A961B554;
          *(void *)(v165 + 120) = v164;
          swift_retain();
          swift_retain();
          swift_retain();
          swift_retain();
          swift_retain();
          swift_retain();
          uint64_t v166 = v516;
          swift_bridgeObjectRelease();
          int v513 = v156;
          if (os_log_type_enabled(v166, (os_log_type_t)v156))
          {
            unint64_t v130 = (uint8_t *)sub_1A952A20C();
            uint64_t v131 = swift_slowAlloc();
            uint64_t v595 = v131;
            uint64_t v596 = 0;
            *(_WORD *)unint64_t v130 = 515;
            v597[0] = (uint64_t)(v130 + 2);
            v593 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1A961B558;
            uint64_t v594 = v157;
            a1 = v574;
            sub_1A9476698(&v593, (uint64_t)v597, (uint64_t)&v596, (uint64_t)&v595);
            if (!a1)
            {
              swift_release();
              v593 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1A961B558;
              uint64_t v594 = v158;
              sub_1A9476698(&v593, (uint64_t)v597, (uint64_t)&v596, (uint64_t)&v595);
              swift_release();
              v593 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1A961B550;
              uint64_t v594 = v160;
              sub_1A9476698(&v593, (uint64_t)v597, (uint64_t)&v596, (uint64_t)&v595);
              swift_release();
              v593 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1A961B558;
              uint64_t v594 = v161;
              sub_1A9476698(&v593, (uint64_t)v597, (uint64_t)&v596, (uint64_t)&v595);
              swift_release();
              v593 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1A961B558;
              uint64_t v594 = v162;
              sub_1A9476698(&v593, (uint64_t)v597, (uint64_t)&v596, (uint64_t)&v595);
              swift_release();
              v593 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1A961B554;
              uint64_t v594 = v164;
              sub_1A9476698(&v593, (uint64_t)v597, (uint64_t)&v596, (uint64_t)&v595);
              uint64_t v574 = 0;
              swift_release();
              os_log_type_t v132 = v513;
              unint64_t v133 = v516;
              unint64_t v134 = "Cache miss for nextHourForecast (expected); location=%{private,mask.hash}s";
              goto LABEL_242;
            }
            goto LABEL_268;
          }

          swift_release();
          swift_release();
          swift_release();
          swift_release();
          swift_release();
          swift_release();
          v452 = *v577;
          v453 = &v562;
        }
        else
        {
          sub_1A95CBF74(4);
          uint64_t v413 = sub_1A95AA978();
          (*v578)(v531, v413, v109);
          uint64_t v414 = swift_allocObject();
          *(double *)(v414 + 16) = a3;
          *(double *)(v414 + 24) = a4;
          os_log_t v516 = (os_log_t)sub_1A96317D0();
          int v415 = sub_1A9632230();
          uint64_t v416 = swift_allocObject();
          *(unsigned char *)(v416 + 16) = 112;
          uint64_t v417 = swift_allocObject();
          *(unsigned char *)(v417 + 16) = 8;
          uint64_t v418 = swift_allocObject();
          *(void *)(v418 + 16) = 1752392040;
          uint64_t v419 = swift_allocObject();
          *(void *)(v419 + 16) = sub_1A961B670;
          *(void *)(v419 + 24) = v418;
          uint64_t v420 = swift_allocObject();
          *(unsigned char *)(v420 + 16) = 33;
          uint64_t v421 = swift_allocObject();
          *(unsigned char *)(v421 + 16) = 8;
          uint64_t v422 = swift_allocObject();
          *(void *)(v422 + 16) = sub_1A961B548;
          *(void *)(v422 + 24) = v414;
          uint64_t v423 = swift_allocObject();
          *(void *)(v423 + 16) = sub_1A961B54C;
          *(void *)(v423 + 24) = v422;
          __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6DE290);
          uint64_t v424 = swift_allocObject();
          *(_OWORD *)(v424 + 16) = v575;
          *(void *)(v424 + 32) = sub_1A961B558;
          *(void *)(v424 + 40) = v416;
          *(void *)(v424 + 48) = sub_1A961B558;
          *(void *)(v424 + 56) = v417;
          *(void *)(v424 + 64) = sub_1A961B550;
          *(void *)(v424 + 72) = v419;
          *(void *)(v424 + 80) = sub_1A961B558;
          *(void *)(v424 + 88) = v420;
          *(void *)(v424 + 96) = sub_1A961B558;
          *(void *)(v424 + 104) = v421;
          *(void *)(v424 + 112) = sub_1A961B554;
          *(void *)(v424 + 120) = v423;
          swift_retain();
          swift_retain();
          swift_retain();
          swift_retain();
          swift_retain();
          swift_retain();
          v425 = v516;
          swift_bridgeObjectRelease();
          int v513 = v415;
          if (os_log_type_enabled(v425, (os_log_type_t)v415))
          {
            unint64_t v130 = (uint8_t *)sub_1A952A20C();
            uint64_t v131 = swift_slowAlloc();
            uint64_t v595 = v131;
            uint64_t v596 = 0;
            *(_WORD *)unint64_t v130 = 515;
            v597[0] = (uint64_t)(v130 + 2);
            v593 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1A961B558;
            uint64_t v594 = v416;
            a1 = v574;
            sub_1A9476698(&v593, (uint64_t)v597, (uint64_t)&v596, (uint64_t)&v595);
            if (!a1)
            {
              swift_release();
              v593 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1A961B558;
              uint64_t v594 = v417;
              sub_1A9476698(&v593, (uint64_t)v597, (uint64_t)&v596, (uint64_t)&v595);
              swift_release();
              v593 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1A961B550;
              uint64_t v594 = v419;
              sub_1A9476698(&v593, (uint64_t)v597, (uint64_t)&v596, (uint64_t)&v595);
              swift_release();
              v593 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1A961B558;
              uint64_t v594 = v420;
              sub_1A9476698(&v593, (uint64_t)v597, (uint64_t)&v596, (uint64_t)&v595);
              swift_release();
              v593 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1A961B558;
              uint64_t v594 = v421;
              sub_1A9476698(&v593, (uint64_t)v597, (uint64_t)&v596, (uint64_t)&v595);
              swift_release();
              v593 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1A961B554;
              uint64_t v594 = v423;
              sub_1A9476698(&v593, (uint64_t)v597, (uint64_t)&v596, (uint64_t)&v595);
              uint64_t v574 = 0;
              swift_release();
              os_log_type_t v132 = v513;
              unint64_t v133 = v516;
              unint64_t v134 = "Cache miss for nextHourForecast (unexpected); location=%{private,mask.hash}s";
              goto LABEL_242;
            }
            goto LABEL_268;
          }

          swift_release();
          swift_release();
          swift_release();
          swift_release();
          swift_release();
          swift_release();
          v452 = *v577;
          v453 = &v563;
        }
        goto LABEL_256;
      case 5:
        v593 = v586;
        sub_1A9604D54(v590, v110, (uint64_t *)&v593, v108);
        if (__swift_getEnumTagSinglePayload(v108, 1, v560) != 1)
        {
          uint64_t v351 = v522;
          sub_1A9449580(v108, v522);
          v379 = v581;
          sub_1A961B118(v351, (uint64_t)v581);
          uint64_t v380 = v580;
          swift_storeEnumTagMultiPayload();
          __swift_storeEnumTagSinglePayload((uint64_t)v379, 0, 1, v380);
          sub_1A9480798((uint64_t)v379, 5);
          v354 = type metadata accessor for PeriodicForecasts;
          goto LABEL_156;
        }
        uint64_t v592 = v105 + 1;
        sub_1A944C480(v108, &qword_1E97EAC40);
        sub_1A95CBF74(5);
        uint64_t v286 = sub_1A95AA978();
        (*v578)(v547, v286, v109);
        uint64_t v287 = swift_allocObject();
        *(double *)(v287 + 16) = a3;
        *(double *)(v287 + 24) = a4;
        os_log_t v516 = (os_log_t)sub_1A96317D0();
        int v288 = sub_1A9632230();
        uint64_t v289 = swift_allocObject();
        *(unsigned char *)(v289 + 16) = 112;
        uint64_t v290 = swift_allocObject();
        *(unsigned char *)(v290 + 16) = 8;
        uint64_t v291 = swift_allocObject();
        *(void *)(v291 + 16) = 1752392040;
        uint64_t v292 = swift_allocObject();
        *(void *)(v292 + 16) = sub_1A961B670;
        *(void *)(v292 + 24) = v291;
        uint64_t v293 = swift_allocObject();
        *(unsigned char *)(v293 + 16) = 33;
        uint64_t v294 = swift_allocObject();
        *(unsigned char *)(v294 + 16) = 8;
        uint64_t v295 = swift_allocObject();
        *(void *)(v295 + 16) = sub_1A961B548;
        *(void *)(v295 + 24) = v287;
        uint64_t v296 = swift_allocObject();
        *(void *)(v296 + 16) = sub_1A961B54C;
        *(void *)(v296 + 24) = v295;
        __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6DE290);
        uint64_t v297 = swift_allocObject();
        *(_OWORD *)(v297 + 16) = v575;
        *(void *)(v297 + 32) = sub_1A961B558;
        *(void *)(v297 + 40) = v289;
        *(void *)(v297 + 48) = sub_1A961B558;
        *(void *)(v297 + 56) = v290;
        *(void *)(v297 + 64) = sub_1A961B550;
        *(void *)(v297 + 72) = v292;
        *(void *)(v297 + 80) = sub_1A961B558;
        *(void *)(v297 + 88) = v293;
        *(void *)(v297 + 96) = sub_1A961B558;
        *(void *)(v297 + 104) = v294;
        *(void *)(v297 + 112) = sub_1A961B554;
        *(void *)(v297 + 120) = v296;
        swift_retain();
        swift_retain();
        swift_retain();
        swift_retain();
        swift_retain();
        swift_retain();
        v298 = v516;
        swift_bridgeObjectRelease();
        int v513 = v288;
        if (os_log_type_enabled(v298, (os_log_type_t)v288))
        {
          unint64_t v130 = (uint8_t *)sub_1A952A20C();
          uint64_t v131 = swift_slowAlloc();
          uint64_t v595 = v131;
          uint64_t v596 = 0;
          *(_WORD *)unint64_t v130 = 515;
          v597[0] = (uint64_t)(v130 + 2);
          v593 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1A961B558;
          uint64_t v594 = v289;
          a1 = v574;
          sub_1A9476698(&v593, (uint64_t)v597, (uint64_t)&v596, (uint64_t)&v595);
          if (!a1)
          {
            swift_release();
            v593 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1A961B558;
            uint64_t v594 = v290;
            sub_1A9476698(&v593, (uint64_t)v597, (uint64_t)&v596, (uint64_t)&v595);
            swift_release();
            v593 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1A961B550;
            uint64_t v594 = v292;
            sub_1A9476698(&v593, (uint64_t)v597, (uint64_t)&v596, (uint64_t)&v595);
            swift_release();
            v593 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1A961B558;
            uint64_t v594 = v293;
            sub_1A9476698(&v593, (uint64_t)v597, (uint64_t)&v596, (uint64_t)&v595);
            swift_release();
            v593 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1A961B558;
            uint64_t v594 = v294;
            sub_1A9476698(&v593, (uint64_t)v597, (uint64_t)&v596, (uint64_t)&v595);
            swift_release();
            v593 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1A961B554;
            uint64_t v594 = v296;
            sub_1A9476698(&v593, (uint64_t)v597, (uint64_t)&v596, (uint64_t)&v595);
            uint64_t v574 = 0;
            swift_release();
            os_log_type_t v132 = v513;
            unint64_t v133 = v516;
            unint64_t v134 = "Cache miss for forecastPeriod (unexpected); location=%{private,mask.hash}s";
            goto LABEL_242;
          }
          goto LABEL_268;
        }

        swift_release();
        swift_release();
        swift_release();
        swift_release();
        swift_release();
        swift_release();
        v452 = *v577;
        v453 = (uint64_t *)&v578;
        goto LABEL_256;
      case 6:
        v593 = v586;
        sub_1A9605784(v590, v110, (uint64_t *)&v593, v107);
        if (__swift_getEnumTagSinglePayload(v107, 1, v561) != 1)
        {
          uint64_t v351 = v523;
          sub_1A9449580(v107, v523);
          v381 = v581;
          sub_1A961B118(v351, (uint64_t)v581);
          uint64_t v382 = v580;
          swift_storeEnumTagMultiPayload();
          __swift_storeEnumTagSinglePayload((uint64_t)v381, 0, 1, v382);
          sub_1A9480798((uint64_t)v381, 6);
          v354 = type metadata accessor for LocationInfo;
          goto LABEL_156;
        }
        uint64_t v592 = v105 + 1;
        sub_1A944C480(v107, &qword_1EB6DD6F8);
        sub_1A95CBF74(6);
        uint64_t v299 = sub_1A95AA978();
        (*v578)(v548, v299, v109);
        uint64_t v300 = swift_allocObject();
        *(double *)(v300 + 16) = a3;
        *(double *)(v300 + 24) = a4;
        os_log_t v516 = (os_log_t)sub_1A96317D0();
        int v301 = sub_1A9632230();
        uint64_t v302 = swift_allocObject();
        *(unsigned char *)(v302 + 16) = 112;
        uint64_t v303 = swift_allocObject();
        *(unsigned char *)(v303 + 16) = 8;
        uint64_t v304 = swift_allocObject();
        *(void *)(v304 + 16) = 1752392040;
        uint64_t v305 = swift_allocObject();
        *(void *)(v305 + 16) = sub_1A961B670;
        *(void *)(v305 + 24) = v304;
        uint64_t v306 = swift_allocObject();
        *(unsigned char *)(v306 + 16) = 33;
        uint64_t v307 = swift_allocObject();
        *(unsigned char *)(v307 + 16) = 8;
        uint64_t v308 = swift_allocObject();
        *(void *)(v308 + 16) = sub_1A961B548;
        *(void *)(v308 + 24) = v300;
        uint64_t v309 = swift_allocObject();
        *(void *)(v309 + 16) = sub_1A961B54C;
        *(void *)(v309 + 24) = v308;
        __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6DE290);
        uint64_t v310 = swift_allocObject();
        *(_OWORD *)(v310 + 16) = v575;
        *(void *)(v310 + 32) = sub_1A961B558;
        *(void *)(v310 + 40) = v302;
        *(void *)(v310 + 48) = sub_1A961B558;
        *(void *)(v310 + 56) = v303;
        *(void *)(v310 + 64) = sub_1A961B550;
        *(void *)(v310 + 72) = v305;
        *(void *)(v310 + 80) = sub_1A961B558;
        *(void *)(v310 + 88) = v306;
        *(void *)(v310 + 96) = sub_1A961B558;
        *(void *)(v310 + 104) = v307;
        *(void *)(v310 + 112) = sub_1A961B554;
        *(void *)(v310 + 120) = v309;
        swift_retain();
        swift_retain();
        swift_retain();
        swift_retain();
        swift_retain();
        swift_retain();
        v311 = v516;
        swift_bridgeObjectRelease();
        int v513 = v301;
        if (os_log_type_enabled(v311, (os_log_type_t)v301))
        {
          unint64_t v130 = (uint8_t *)sub_1A952A20C();
          uint64_t v131 = swift_slowAlloc();
          uint64_t v595 = v131;
          uint64_t v596 = 0;
          *(_WORD *)unint64_t v130 = 515;
          v597[0] = (uint64_t)(v130 + 2);
          v593 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1A961B558;
          uint64_t v594 = v302;
          a1 = v574;
          sub_1A9476698(&v593, (uint64_t)v597, (uint64_t)&v596, (uint64_t)&v595);
          if (!a1)
          {
            swift_release();
            v593 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1A961B558;
            uint64_t v594 = v303;
            sub_1A9476698(&v593, (uint64_t)v597, (uint64_t)&v596, (uint64_t)&v595);
            swift_release();
            v593 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1A961B550;
            uint64_t v594 = v305;
            sub_1A9476698(&v593, (uint64_t)v597, (uint64_t)&v596, (uint64_t)&v595);
            swift_release();
            v593 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1A961B558;
            uint64_t v594 = v306;
            sub_1A9476698(&v593, (uint64_t)v597, (uint64_t)&v596, (uint64_t)&v595);
            swift_release();
            v593 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1A961B558;
            uint64_t v594 = v307;
            sub_1A9476698(&v593, (uint64_t)v597, (uint64_t)&v596, (uint64_t)&v595);
            swift_release();
            v593 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1A961B554;
            uint64_t v594 = v309;
            sub_1A9476698(&v593, (uint64_t)v597, (uint64_t)&v596, (uint64_t)&v595);
            uint64_t v574 = 0;
            swift_release();
            os_log_type_t v132 = v513;
            unint64_t v133 = v516;
            unint64_t v134 = "Cache miss for locationInfo; location=%{private,mask.hash}s";
            goto LABEL_242;
          }
          goto LABEL_268;
        }

        swift_release();
        swift_release();
        swift_release();
        swift_release();
        swift_release();
        swift_release();
        v452 = *v577;
        v453 = &v579;
        goto LABEL_256;
      case 7:
        uint64_t v262 = v590;
        sub_1A96061B4(v590, v110, v573, v106);
        uint64_t v263 = v562;
        if (__swift_getEnumTagSinglePayload(v106, 1, v562) != 1)
        {
          uint64_t v361 = v524;
          sub_1A9449580(v106, v524);
          v362 = v581;
          sub_1A961B118(v361, (uint64_t)v581);
          __swift_storeEnumTagSinglePayload((uint64_t)v362, 0, 1, v263);
          uint64_t v363 = v580;
          swift_storeEnumTagMultiPayload();
          __swift_storeEnumTagSinglePayload((uint64_t)v362, 0, 1, v363);
          uint64_t v364 = (uint64_t)v362;
          unint64_t v110 = v587;
          sub_1A9480798(v364, 7);
          uint64_t v365 = v361;
          uint64_t v108 = (uint64_t)v585;
          sub_1A961B3A4(v365, (void (*)(void))type metadata accessor for MarineForecast);
          goto LABEL_258;
        }
        uint64_t v592 = v105 + 1;
        sub_1A944C480(v106, &qword_1EB6DD258);
        if (sub_1A96067D4(v262, v110))
        {
          uint64_t v264 = sub_1A95AA978();
          (*v578)(v532, v264, v109);
          uint64_t v265 = swift_allocObject();
          *(double *)(v265 + 16) = a3;
          *(double *)(v265 + 24) = a4;
          os_log_t v516 = (os_log_t)sub_1A96317D0();
          int v266 = sub_1A9632230();
          uint64_t v267 = swift_allocObject();
          *(unsigned char *)(v267 + 16) = 112;
          uint64_t v268 = swift_allocObject();
          *(unsigned char *)(v268 + 16) = 8;
          uint64_t v269 = swift_allocObject();
          *(void *)(v269 + 16) = 1752392040;
          uint64_t v270 = swift_allocObject();
          *(void *)(v270 + 16) = sub_1A961B670;
          *(void *)(v270 + 24) = v269;
          uint64_t v271 = swift_allocObject();
          *(unsigned char *)(v271 + 16) = 33;
          uint64_t v272 = swift_allocObject();
          *(unsigned char *)(v272 + 16) = 8;
          uint64_t v273 = swift_allocObject();
          *(void *)(v273 + 16) = sub_1A961B548;
          *(void *)(v273 + 24) = v265;
          uint64_t v274 = swift_allocObject();
          *(void *)(v274 + 16) = sub_1A961B54C;
          *(void *)(v274 + 24) = v273;
          __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6DE290);
          uint64_t v275 = swift_allocObject();
          *(_OWORD *)(v275 + 16) = v575;
          *(void *)(v275 + 32) = sub_1A961B558;
          *(void *)(v275 + 40) = v267;
          *(void *)(v275 + 48) = sub_1A961B558;
          *(void *)(v275 + 56) = v268;
          *(void *)(v275 + 64) = sub_1A961B550;
          *(void *)(v275 + 72) = v270;
          *(void *)(v275 + 80) = sub_1A961B558;
          *(void *)(v275 + 88) = v271;
          *(void *)(v275 + 96) = sub_1A961B558;
          *(void *)(v275 + 104) = v272;
          *(void *)(v275 + 112) = sub_1A961B554;
          *(void *)(v275 + 120) = v274;
          swift_retain();
          swift_retain();
          swift_retain();
          swift_retain();
          swift_retain();
          swift_retain();
          v276 = v516;
          swift_bridgeObjectRelease();
          int v513 = v266;
          if (os_log_type_enabled(v276, (os_log_type_t)v266))
          {
            unint64_t v130 = (uint8_t *)sub_1A952A20C();
            uint64_t v131 = swift_slowAlloc();
            uint64_t v595 = v131;
            uint64_t v596 = 0;
            *(_WORD *)unint64_t v130 = 515;
            v597[0] = (uint64_t)(v130 + 2);
            v593 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1A961B558;
            uint64_t v594 = v267;
            a1 = v574;
            sub_1A9476698(&v593, (uint64_t)v597, (uint64_t)&v596, (uint64_t)&v595);
            if (!a1)
            {
              swift_release();
              v593 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1A961B558;
              uint64_t v594 = v268;
              sub_1A9476698(&v593, (uint64_t)v597, (uint64_t)&v596, (uint64_t)&v595);
              swift_release();
              v593 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1A961B550;
              uint64_t v594 = v270;
              sub_1A9476698(&v593, (uint64_t)v597, (uint64_t)&v596, (uint64_t)&v595);
              swift_release();
              v593 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1A961B558;
              uint64_t v594 = v271;
              sub_1A9476698(&v593, (uint64_t)v597, (uint64_t)&v596, (uint64_t)&v595);
              swift_release();
              v593 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1A961B558;
              uint64_t v594 = v272;
              sub_1A9476698(&v593, (uint64_t)v597, (uint64_t)&v596, (uint64_t)&v595);
              swift_release();
              v593 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1A961B554;
              uint64_t v594 = v274;
              sub_1A9476698(&v593, (uint64_t)v597, (uint64_t)&v596, (uint64_t)&v595);
              uint64_t v574 = 0;
              swift_release();
              os_log_type_t v132 = v513;
              unint64_t v133 = v516;
              unint64_t v134 = "Cache miss for marineForecast (expected); location=%{private,mask.hash}s";
              goto LABEL_242;
            }
            goto LABEL_268;
          }

          swift_release();
          swift_release();
          swift_release();
          swift_release();
          swift_release();
          swift_release();
          v452 = *v577;
          v453 = &v564;
        }
        else
        {
          sub_1A95CBF74(7);
          uint64_t v469 = sub_1A95AA978();
          (*v578)(v533, v469, v109);
          uint64_t v470 = swift_allocObject();
          *(double *)(v470 + 16) = a3;
          *(double *)(v470 + 24) = a4;
          os_log_t v516 = (os_log_t)sub_1A96317D0();
          int v471 = sub_1A9632230();
          uint64_t v472 = swift_allocObject();
          *(unsigned char *)(v472 + 16) = 112;
          uint64_t v473 = swift_allocObject();
          *(unsigned char *)(v473 + 16) = 8;
          uint64_t v474 = swift_allocObject();
          *(void *)(v474 + 16) = 1752392040;
          uint64_t v475 = swift_allocObject();
          *(void *)(v475 + 16) = sub_1A961B670;
          *(void *)(v475 + 24) = v474;
          uint64_t v476 = swift_allocObject();
          *(unsigned char *)(v476 + 16) = 33;
          uint64_t v477 = swift_allocObject();
          *(unsigned char *)(v477 + 16) = 8;
          uint64_t v478 = swift_allocObject();
          *(void *)(v478 + 16) = sub_1A961B548;
          *(void *)(v478 + 24) = v470;
          uint64_t v479 = swift_allocObject();
          *(void *)(v479 + 16) = sub_1A961B54C;
          *(void *)(v479 + 24) = v478;
          __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6DE290);
          uint64_t v480 = swift_allocObject();
          *(_OWORD *)(v480 + 16) = v575;
          *(void *)(v480 + 32) = sub_1A961B558;
          *(void *)(v480 + 40) = v472;
          *(void *)(v480 + 48) = sub_1A961B558;
          *(void *)(v480 + 56) = v473;
          *(void *)(v480 + 64) = sub_1A961B550;
          *(void *)(v480 + 72) = v475;
          *(void *)(v480 + 80) = sub_1A961B558;
          *(void *)(v480 + 88) = v476;
          *(void *)(v480 + 96) = sub_1A961B558;
          *(void *)(v480 + 104) = v477;
          *(void *)(v480 + 112) = sub_1A961B554;
          *(void *)(v480 + 120) = v479;
          swift_retain();
          swift_retain();
          swift_retain();
          swift_retain();
          swift_retain();
          swift_retain();
          v481 = v516;
          swift_bridgeObjectRelease();
          int v513 = v471;
          if (os_log_type_enabled(v481, (os_log_type_t)v471))
          {
            unint64_t v130 = (uint8_t *)sub_1A952A20C();
            uint64_t v131 = swift_slowAlloc();
            uint64_t v595 = v131;
            uint64_t v596 = 0;
            *(_WORD *)unint64_t v130 = 515;
            v597[0] = (uint64_t)(v130 + 2);
            v593 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1A961B558;
            uint64_t v594 = v472;
            a1 = v574;
            sub_1A9476698(&v593, (uint64_t)v597, (uint64_t)&v596, (uint64_t)&v595);
            if (!a1)
            {
              swift_release();
              v593 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1A961B558;
              uint64_t v594 = v473;
              sub_1A9476698(&v593, (uint64_t)v597, (uint64_t)&v596, (uint64_t)&v595);
              swift_release();
              v593 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1A961B550;
              uint64_t v594 = v475;
              sub_1A9476698(&v593, (uint64_t)v597, (uint64_t)&v596, (uint64_t)&v595);
              swift_release();
              v593 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1A961B558;
              uint64_t v594 = v476;
              sub_1A9476698(&v593, (uint64_t)v597, (uint64_t)&v596, (uint64_t)&v595);
              swift_release();
              v593 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1A961B558;
              uint64_t v594 = v477;
              sub_1A9476698(&v593, (uint64_t)v597, (uint64_t)&v596, (uint64_t)&v595);
              swift_release();
              v593 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1A961B554;
              uint64_t v594 = v479;
              sub_1A9476698(&v593, (uint64_t)v597, (uint64_t)&v596, (uint64_t)&v595);
              uint64_t v574 = 0;
              swift_release();
              os_log_type_t v132 = v513;
              unint64_t v133 = v516;
              unint64_t v134 = "Cache miss for marineForecast (unexpected); location=%{private,mask.hash}s";
              goto LABEL_242;
            }
            goto LABEL_268;
          }

          swift_release();
          swift_release();
          swift_release();
          swift_release();
          swift_release();
          swift_release();
          v452 = *v577;
          v453 = &v565;
        }
        goto LABEL_256;
      case 8:
        uint64_t v592 = v105 + 1;
        v593 = v586;
        uint64_t v312 = v564;
        uint64_t v313 = v590;
        sub_1A960701C(v590, v110, (uint64_t *)&v593, v564);
        uint64_t v314 = v563;
        if (__swift_getEnumTagSinglePayload(v312, 1, v563) != 1)
        {
          uint64_t v383 = v312;
          uint64_t v384 = v525;
          sub_1A9449580(v383, v525);
          v385 = v581;
          sub_1A961B118(v384, (uint64_t)v581);
          __swift_storeEnumTagSinglePayload((uint64_t)v385, 0, 1, v314);
          uint64_t v386 = v580;
          swift_storeEnumTagMultiPayload();
          __swift_storeEnumTagSinglePayload((uint64_t)v385, 0, 1, v386);
          uint64_t v387 = (uint64_t)v385;
          unint64_t v110 = v587;
          sub_1A9480798(v387, 8);
          v346 = type metadata accessor for News;
          uint64_t v347 = v384;
          uint64_t v108 = (uint64_t)v585;
          goto LABEL_159;
        }
        sub_1A944C480(v312, &qword_1EB6DD938);
        if (sub_1A96079EC(v313, v110))
        {
          uint64_t v315 = sub_1A95AA978();
          (*v578)(v534, v315, v109);
          uint64_t v316 = swift_allocObject();
          *(double *)(v316 + 16) = a3;
          *(double *)(v316 + 24) = a4;
          os_log_t v516 = (os_log_t)sub_1A96317D0();
          int v317 = sub_1A9632230();
          uint64_t v318 = swift_allocObject();
          *(unsigned char *)(v318 + 16) = 112;
          uint64_t v319 = swift_allocObject();
          *(unsigned char *)(v319 + 16) = 8;
          uint64_t v320 = swift_allocObject();
          *(void *)(v320 + 16) = 1752392040;
          uint64_t v321 = swift_allocObject();
          *(void *)(v321 + 16) = sub_1A961B670;
          *(void *)(v321 + 24) = v320;
          uint64_t v322 = swift_allocObject();
          *(unsigned char *)(v322 + 16) = 33;
          uint64_t v323 = swift_allocObject();
          *(unsigned char *)(v323 + 16) = 8;
          uint64_t v324 = swift_allocObject();
          *(void *)(v324 + 16) = sub_1A961B548;
          *(void *)(v324 + 24) = v316;
          uint64_t v325 = swift_allocObject();
          *(void *)(v325 + 16) = sub_1A961B54C;
          *(void *)(v325 + 24) = v324;
          __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6DE290);
          uint64_t v326 = swift_allocObject();
          *(_OWORD *)(v326 + 16) = v575;
          *(void *)(v326 + 32) = sub_1A961B558;
          *(void *)(v326 + 40) = v318;
          *(void *)(v326 + 48) = sub_1A961B558;
          *(void *)(v326 + 56) = v319;
          *(void *)(v326 + 64) = sub_1A961B550;
          *(void *)(v326 + 72) = v321;
          *(void *)(v326 + 80) = sub_1A961B558;
          *(void *)(v326 + 88) = v322;
          *(void *)(v326 + 96) = sub_1A961B558;
          *(void *)(v326 + 104) = v323;
          *(void *)(v326 + 112) = sub_1A961B554;
          *(void *)(v326 + 120) = v325;
          swift_retain();
          swift_retain();
          swift_retain();
          swift_retain();
          swift_retain();
          swift_retain();
          v327 = v516;
          swift_bridgeObjectRelease();
          int v513 = v317;
          if (os_log_type_enabled(v327, (os_log_type_t)v317))
          {
            unint64_t v130 = (uint8_t *)sub_1A952A20C();
            uint64_t v131 = swift_slowAlloc();
            uint64_t v595 = v131;
            uint64_t v596 = 0;
            *(_WORD *)unint64_t v130 = 515;
            v597[0] = (uint64_t)(v130 + 2);
            v593 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1A961B558;
            uint64_t v594 = v318;
            a1 = v574;
            sub_1A9476698(&v593, (uint64_t)v597, (uint64_t)&v596, (uint64_t)&v595);
            if (!a1)
            {
              swift_release();
              v593 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1A961B558;
              uint64_t v594 = v319;
              sub_1A9476698(&v593, (uint64_t)v597, (uint64_t)&v596, (uint64_t)&v595);
              swift_release();
              v593 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1A961B550;
              uint64_t v594 = v321;
              sub_1A9476698(&v593, (uint64_t)v597, (uint64_t)&v596, (uint64_t)&v595);
              swift_release();
              v593 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1A961B558;
              uint64_t v594 = v322;
              sub_1A9476698(&v593, (uint64_t)v597, (uint64_t)&v596, (uint64_t)&v595);
              swift_release();
              v593 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1A961B558;
              uint64_t v594 = v323;
              sub_1A9476698(&v593, (uint64_t)v597, (uint64_t)&v596, (uint64_t)&v595);
              swift_release();
              v593 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1A961B554;
              uint64_t v594 = v325;
              sub_1A9476698(&v593, (uint64_t)v597, (uint64_t)&v596, (uint64_t)&v595);
              uint64_t v574 = 0;
              swift_release();
              os_log_type_t v132 = v513;
              unint64_t v133 = v516;
              unint64_t v134 = "Cache miss for news (expected); location=%{private,mask.hash}s";
              goto LABEL_242;
            }
            goto LABEL_268;
          }

          swift_release();
          swift_release();
          swift_release();
          swift_release();
          swift_release();
          swift_release();
          v452 = *v577;
          v453 = &v566;
        }
        else
        {
          sub_1A95CBF74(8);
          uint64_t v482 = sub_1A95AA978();
          (*v578)(v535, v482, v109);
          uint64_t v483 = swift_allocObject();
          *(double *)(v483 + 16) = a3;
          *(double *)(v483 + 24) = a4;
          os_log_t v516 = (os_log_t)sub_1A96317D0();
          int v484 = sub_1A9632230();
          uint64_t v485 = swift_allocObject();
          *(unsigned char *)(v485 + 16) = 112;
          uint64_t v486 = swift_allocObject();
          *(unsigned char *)(v486 + 16) = 8;
          uint64_t v487 = swift_allocObject();
          *(void *)(v487 + 16) = 1752392040;
          uint64_t v488 = swift_allocObject();
          *(void *)(v488 + 16) = sub_1A961B670;
          *(void *)(v488 + 24) = v487;
          uint64_t v489 = swift_allocObject();
          *(unsigned char *)(v489 + 16) = 33;
          uint64_t v490 = swift_allocObject();
          *(unsigned char *)(v490 + 16) = 8;
          uint64_t v491 = swift_allocObject();
          *(void *)(v491 + 16) = sub_1A961B548;
          *(void *)(v491 + 24) = v483;
          uint64_t v492 = swift_allocObject();
          *(void *)(v492 + 16) = sub_1A961B54C;
          *(void *)(v492 + 24) = v491;
          __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6DE290);
          uint64_t v493 = swift_allocObject();
          *(_OWORD *)(v493 + 16) = v575;
          *(void *)(v493 + 32) = sub_1A961B558;
          *(void *)(v493 + 40) = v485;
          *(void *)(v493 + 48) = sub_1A961B558;
          *(void *)(v493 + 56) = v486;
          *(void *)(v493 + 64) = sub_1A961B550;
          *(void *)(v493 + 72) = v488;
          *(void *)(v493 + 80) = sub_1A961B558;
          *(void *)(v493 + 88) = v489;
          *(void *)(v493 + 96) = sub_1A961B558;
          *(void *)(v493 + 104) = v490;
          *(void *)(v493 + 112) = sub_1A961B554;
          *(void *)(v493 + 120) = v492;
          swift_retain();
          swift_retain();
          swift_retain();
          swift_retain();
          swift_retain();
          swift_retain();
          v494 = v516;
          swift_bridgeObjectRelease();
          int v513 = v484;
          if (os_log_type_enabled(v494, (os_log_type_t)v484))
          {
            unint64_t v130 = (uint8_t *)sub_1A952A20C();
            uint64_t v131 = swift_slowAlloc();
            uint64_t v595 = v131;
            uint64_t v596 = 0;
            *(_WORD *)unint64_t v130 = 515;
            v597[0] = (uint64_t)(v130 + 2);
            v593 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1A961B558;
            uint64_t v594 = v485;
            a1 = v574;
            sub_1A9476698(&v593, (uint64_t)v597, (uint64_t)&v596, (uint64_t)&v595);
            if (!a1)
            {
              swift_release();
              v593 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1A961B558;
              uint64_t v594 = v486;
              sub_1A9476698(&v593, (uint64_t)v597, (uint64_t)&v596, (uint64_t)&v595);
              swift_release();
              v593 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1A961B550;
              uint64_t v594 = v488;
              sub_1A9476698(&v593, (uint64_t)v597, (uint64_t)&v596, (uint64_t)&v595);
              swift_release();
              v593 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1A961B558;
              uint64_t v594 = v489;
              sub_1A9476698(&v593, (uint64_t)v597, (uint64_t)&v596, (uint64_t)&v595);
              swift_release();
              v593 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1A961B558;
              uint64_t v594 = v490;
              sub_1A9476698(&v593, (uint64_t)v597, (uint64_t)&v596, (uint64_t)&v595);
              swift_release();
              v593 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1A961B554;
              uint64_t v594 = v492;
              sub_1A9476698(&v593, (uint64_t)v597, (uint64_t)&v596, (uint64_t)&v595);
              uint64_t v574 = 0;
              swift_release();
              os_log_type_t v132 = v513;
              unint64_t v133 = v516;
              unint64_t v134 = "Cache miss for news (unexpected); location=%{private,mask.hash}s";
              goto LABEL_242;
            }
            goto LABEL_268;
          }

          swift_release();
          swift_release();
          swift_release();
          swift_release();
          swift_release();
          swift_release();
          v452 = *v577;
          v453 = &v567;
        }
        goto LABEL_256;
      case 9:
        uint64_t v592 = v105 + 1;
        v593 = v586;
        uint64_t v167 = (uint64_t)v541;
        uint64_t v168 = v590;
        sub_1A960909C(v590, v110, (uint64_t *)&v593, (uint64_t)v541);
        uint64_t v169 = v566;
        if (__swift_getEnumTagSinglePayload(v167, 1, v566) != 1)
        {
          uint64_t v338 = v167;
          uint64_t v333 = v527;
          sub_1A9449580(v338, v527);
          v339 = v581;
          sub_1A961B118(v333, (uint64_t)v581);
          __swift_storeEnumTagSinglePayload((uint64_t)v339, 0, 1, v169);
          uint64_t v340 = v580;
          swift_storeEnumTagMultiPayload();
          __swift_storeEnumTagSinglePayload((uint64_t)v339, 0, 1, v340);
          uint64_t v341 = (uint64_t)v339;
          unint64_t v110 = v587;
          sub_1A9480798(v341, 9);
          v337 = type metadata accessor for WeatherAlerts;
          goto LABEL_140;
        }
        sub_1A944C480(v167, &qword_1EB6DD620);
        if (sub_1A9609ACC(v168, v110))
        {
          uint64_t v170 = sub_1A95AA978();
          (*v578)(v538, v170, v109);
          uint64_t v171 = swift_allocObject();
          *(double *)(v171 + 16) = a3;
          *(double *)(v171 + 24) = a4;
          os_log_t v516 = (os_log_t)sub_1A96317D0();
          int v172 = sub_1A9632230();
          uint64_t v173 = swift_allocObject();
          *(unsigned char *)(v173 + 16) = 112;
          uint64_t v174 = swift_allocObject();
          *(unsigned char *)(v174 + 16) = 8;
          uint64_t v175 = swift_allocObject();
          *(void *)(v175 + 16) = 1752392040;
          uint64_t v176 = swift_allocObject();
          *(void *)(v176 + 16) = sub_1A961B670;
          *(void *)(v176 + 24) = v175;
          uint64_t v177 = swift_allocObject();
          *(unsigned char *)(v177 + 16) = 33;
          uint64_t v178 = swift_allocObject();
          *(unsigned char *)(v178 + 16) = 8;
          uint64_t v179 = swift_allocObject();
          *(void *)(v179 + 16) = sub_1A961B548;
          *(void *)(v179 + 24) = v171;
          uint64_t v180 = swift_allocObject();
          *(void *)(v180 + 16) = sub_1A961B54C;
          *(void *)(v180 + 24) = v179;
          __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6DE290);
          uint64_t v181 = swift_allocObject();
          *(_OWORD *)(v181 + 16) = v575;
          *(void *)(v181 + 32) = sub_1A961B558;
          *(void *)(v181 + 40) = v173;
          *(void *)(v181 + 48) = sub_1A961B558;
          *(void *)(v181 + 56) = v174;
          *(void *)(v181 + 64) = sub_1A961B550;
          *(void *)(v181 + 72) = v176;
          *(void *)(v181 + 80) = sub_1A961B558;
          *(void *)(v181 + 88) = v177;
          *(void *)(v181 + 96) = sub_1A961B558;
          *(void *)(v181 + 104) = v178;
          *(void *)(v181 + 112) = sub_1A961B554;
          *(void *)(v181 + 120) = v180;
          swift_retain();
          swift_retain();
          swift_retain();
          swift_retain();
          swift_retain();
          swift_retain();
          v182 = v516;
          swift_bridgeObjectRelease();
          int v513 = v172;
          if (os_log_type_enabled(v182, (os_log_type_t)v172))
          {
            unint64_t v130 = (uint8_t *)sub_1A952A20C();
            uint64_t v131 = swift_slowAlloc();
            uint64_t v595 = v131;
            uint64_t v596 = 0;
            *(_WORD *)unint64_t v130 = 515;
            v597[0] = (uint64_t)(v130 + 2);
            v593 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1A961B558;
            uint64_t v594 = v173;
            a1 = v574;
            sub_1A9476698(&v593, (uint64_t)v597, (uint64_t)&v596, (uint64_t)&v595);
            if (!a1)
            {
              swift_release();
              v593 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1A961B558;
              uint64_t v594 = v174;
              sub_1A9476698(&v593, (uint64_t)v597, (uint64_t)&v596, (uint64_t)&v595);
              swift_release();
              v593 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1A961B550;
              uint64_t v594 = v176;
              sub_1A9476698(&v593, (uint64_t)v597, (uint64_t)&v596, (uint64_t)&v595);
              swift_release();
              v593 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1A961B558;
              uint64_t v594 = v177;
              sub_1A9476698(&v593, (uint64_t)v597, (uint64_t)&v596, (uint64_t)&v595);
              swift_release();
              v593 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1A961B558;
              uint64_t v594 = v178;
              sub_1A9476698(&v593, (uint64_t)v597, (uint64_t)&v596, (uint64_t)&v595);
              swift_release();
              v593 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1A961B554;
              uint64_t v594 = v180;
              sub_1A9476698(&v593, (uint64_t)v597, (uint64_t)&v596, (uint64_t)&v595);
              uint64_t v574 = 0;
              swift_release();
              os_log_type_t v132 = v513;
              unint64_t v133 = v516;
              unint64_t v134 = "Cache miss for weatherAlerts (expected); location=%{private,mask.hash}s";
              goto LABEL_242;
            }
            goto LABEL_268;
          }

          swift_release();
          swift_release();
          swift_release();
          swift_release();
          swift_release();
          swift_release();
          v452 = *v577;
          v453 = (uint64_t *)&v570;
        }
        else
        {
          sub_1A95CBF74(9);
          uint64_t v426 = sub_1A95AA978();
          (*v578)(v539, v426, v109);
          uint64_t v427 = swift_allocObject();
          *(double *)(v427 + 16) = a3;
          *(double *)(v427 + 24) = a4;
          os_log_t v516 = (os_log_t)sub_1A96317D0();
          int v428 = sub_1A9632230();
          uint64_t v429 = swift_allocObject();
          *(unsigned char *)(v429 + 16) = 112;
          uint64_t v430 = swift_allocObject();
          *(unsigned char *)(v430 + 16) = 8;
          uint64_t v431 = swift_allocObject();
          *(void *)(v431 + 16) = 1752392040;
          uint64_t v432 = swift_allocObject();
          *(void *)(v432 + 16) = sub_1A961B670;
          *(void *)(v432 + 24) = v431;
          uint64_t v433 = swift_allocObject();
          *(unsigned char *)(v433 + 16) = 33;
          uint64_t v434 = swift_allocObject();
          *(unsigned char *)(v434 + 16) = 8;
          uint64_t v435 = swift_allocObject();
          *(void *)(v435 + 16) = sub_1A961B548;
          *(void *)(v435 + 24) = v427;
          uint64_t v436 = swift_allocObject();
          *(void *)(v436 + 16) = sub_1A961B54C;
          *(void *)(v436 + 24) = v435;
          __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6DE290);
          uint64_t v437 = swift_allocObject();
          *(_OWORD *)(v437 + 16) = v575;
          *(void *)(v437 + 32) = sub_1A961B558;
          *(void *)(v437 + 40) = v429;
          *(void *)(v437 + 48) = sub_1A961B558;
          *(void *)(v437 + 56) = v430;
          *(void *)(v437 + 64) = sub_1A961B550;
          *(void *)(v437 + 72) = v432;
          *(void *)(v437 + 80) = sub_1A961B558;
          *(void *)(v437 + 88) = v433;
          *(void *)(v437 + 96) = sub_1A961B558;
          *(void *)(v437 + 104) = v434;
          *(void *)(v437 + 112) = sub_1A961B554;
          *(void *)(v437 + 120) = v436;
          swift_retain();
          swift_retain();
          swift_retain();
          swift_retain();
          swift_retain();
          swift_retain();
          v438 = v516;
          swift_bridgeObjectRelease();
          int v513 = v428;
          if (os_log_type_enabled(v438, (os_log_type_t)v428))
          {
            unint64_t v130 = (uint8_t *)sub_1A952A20C();
            uint64_t v131 = swift_slowAlloc();
            uint64_t v595 = v131;
            uint64_t v596 = 0;
            *(_WORD *)unint64_t v130 = 515;
            v597[0] = (uint64_t)(v130 + 2);
            v593 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1A961B558;
            uint64_t v594 = v429;
            a1 = v574;
            sub_1A9476698(&v593, (uint64_t)v597, (uint64_t)&v596, (uint64_t)&v595);
            if (!a1)
            {
              swift_release();
              v593 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1A961B558;
              uint64_t v594 = v430;
              sub_1A9476698(&v593, (uint64_t)v597, (uint64_t)&v596, (uint64_t)&v595);
              swift_release();
              v593 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1A961B550;
              uint64_t v594 = v432;
              sub_1A9476698(&v593, (uint64_t)v597, (uint64_t)&v596, (uint64_t)&v595);
              swift_release();
              v593 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1A961B558;
              uint64_t v594 = v433;
              sub_1A9476698(&v593, (uint64_t)v597, (uint64_t)&v596, (uint64_t)&v595);
              swift_release();
              v593 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1A961B558;
              uint64_t v594 = v434;
              sub_1A9476698(&v593, (uint64_t)v597, (uint64_t)&v596, (uint64_t)&v595);
              swift_release();
              v593 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1A961B554;
              uint64_t v594 = v436;
              sub_1A9476698(&v593, (uint64_t)v597, (uint64_t)&v596, (uint64_t)&v595);
              uint64_t v574 = 0;
              swift_release();
              os_log_type_t v132 = v513;
              unint64_t v133 = v516;
              unint64_t v134 = "Cache miss for weatherAlerts (unexpected); location=%{private,mask.hash}s";
              goto LABEL_242;
            }
            goto LABEL_268;
          }

          swift_release();
          swift_release();
          swift_release();
          swift_release();
          swift_release();
          swift_release();
          v452 = *v577;
          v453 = &v571;
        }
        goto LABEL_256;
      case 10:
      case 11:
        uint64_t v592 = v105 + 1;
        v593 = v586;
        uint64_t v114 = (uint64_t)v569;
        uint64_t v115 = v590;
        sub_1A960B460(v590, v110, (uint64_t *)&v593, (uint64_t)v569);
        uint64_t v116 = v571;
        if (__swift_getEnumTagSinglePayload(v114, 1, v571) != 1)
        {
          uint64_t v328 = v114;
          uint64_t v281 = v567;
          sub_1A9449580(v328, v567);
          v329 = v581;
          sub_1A961B118(v281, (uint64_t)v581);
          __swift_storeEnumTagSinglePayload((uint64_t)v329, 0, 1, v116);
          uint64_t v330 = v580;
          swift_storeEnumTagMultiPayload();
          __swift_storeEnumTagSinglePayload((uint64_t)v329, 0, 1, v330);
          uint64_t v331 = (uint64_t)v329;
          unint64_t v110 = v587;
          sub_1A9480798(v331, v113);
          v285 = type metadata accessor for WeatherChange;
LABEL_135:
          sub_1A961B3A4(v281, (void (*)(void))v285);
LABEL_136:
          uint64_t v108 = (uint64_t)v585;
          goto LABEL_257;
        }
        sub_1A944C480(v114, &qword_1EB6DDE70);
        if (sub_1A960BE90(v115, v110))
        {
          uint64_t v117 = sub_1A95AA978();
          (*v578)(v549, v117, v109);
          uint64_t v118 = swift_allocObject();
          *(double *)(v118 + 16) = a3;
          *(double *)(v118 + 24) = a4;
          os_log_t v516 = (os_log_t)sub_1A96317D0();
          int v119 = sub_1A9632230();
          uint64_t v120 = swift_allocObject();
          *(unsigned char *)(v120 + 16) = 112;
          uint64_t v121 = swift_allocObject();
          *(unsigned char *)(v121 + 16) = 8;
          uint64_t v122 = swift_allocObject();
          *(void *)(v122 + 16) = 1752392040;
          uint64_t v123 = swift_allocObject();
          *(void *)(v123 + 16) = sub_1A961B670;
          *(void *)(v123 + 24) = v122;
          uint64_t v124 = swift_allocObject();
          *(unsigned char *)(v124 + 16) = 33;
          uint64_t v125 = swift_allocObject();
          *(unsigned char *)(v125 + 16) = 8;
          uint64_t v126 = swift_allocObject();
          *(void *)(v126 + 16) = sub_1A961B548;
          *(void *)(v126 + 24) = v118;
          uint64_t v127 = swift_allocObject();
          *(void *)(v127 + 16) = sub_1A961B54C;
          *(void *)(v127 + 24) = v126;
          __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6DE290);
          uint64_t v128 = swift_allocObject();
          *(_OWORD *)(v128 + 16) = v575;
          *(void *)(v128 + 32) = sub_1A961B558;
          *(void *)(v128 + 40) = v120;
          *(void *)(v128 + 48) = sub_1A961B558;
          *(void *)(v128 + 56) = v121;
          *(void *)(v128 + 64) = sub_1A961B550;
          *(void *)(v128 + 72) = v123;
          *(void *)(v128 + 80) = sub_1A961B558;
          *(void *)(v128 + 88) = v124;
          *(void *)(v128 + 96) = sub_1A961B558;
          *(void *)(v128 + 104) = v125;
          *(void *)(v128 + 112) = sub_1A961B554;
          *(void *)(v128 + 120) = v127;
          swift_retain();
          swift_retain();
          swift_retain();
          swift_retain();
          swift_retain();
          swift_retain();
          uint64_t v129 = v516;
          swift_bridgeObjectRelease();
          int v513 = v119;
          if (os_log_type_enabled(v129, (os_log_type_t)v119))
          {
            unint64_t v130 = (uint8_t *)sub_1A952A20C();
            uint64_t v131 = swift_slowAlloc();
            uint64_t v595 = v131;
            uint64_t v596 = 0;
            *(_WORD *)unint64_t v130 = 515;
            v597[0] = (uint64_t)(v130 + 2);
            v593 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1A961B558;
            uint64_t v594 = v120;
            a1 = v574;
            sub_1A9476698(&v593, (uint64_t)v597, (uint64_t)&v596, (uint64_t)&v595);
            if (!a1)
            {
              swift_release();
              v593 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1A961B558;
              uint64_t v594 = v121;
              sub_1A9476698(&v593, (uint64_t)v597, (uint64_t)&v596, (uint64_t)&v595);
              swift_release();
              v593 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1A961B550;
              uint64_t v594 = v123;
              sub_1A9476698(&v593, (uint64_t)v597, (uint64_t)&v596, (uint64_t)&v595);
              swift_release();
              v593 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1A961B558;
              uint64_t v594 = v124;
              sub_1A9476698(&v593, (uint64_t)v597, (uint64_t)&v596, (uint64_t)&v595);
              swift_release();
              v593 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1A961B558;
              uint64_t v594 = v125;
              sub_1A9476698(&v593, (uint64_t)v597, (uint64_t)&v596, (uint64_t)&v595);
              swift_release();
              v593 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1A961B554;
              uint64_t v594 = v127;
              sub_1A9476698(&v593, (uint64_t)v597, (uint64_t)&v596, (uint64_t)&v595);
              uint64_t v574 = 0;
              swift_release();
              os_log_type_t v132 = v513;
              unint64_t v133 = v516;
              unint64_t v134 = "Cache miss for weatherChange (expected); location=%{private,mask.hash}s";
              goto LABEL_242;
            }
            goto LABEL_268;
          }

          swift_release();
          swift_release();
          swift_release();
          swift_release();
          swift_release();
          swift_release();
          v452 = *v577;
          v453 = &v580;
        }
        else
        {
          sub_1A95CBF74(11);
          uint64_t v388 = sub_1A95AA978();
          (*v578)(v550, v388, v109);
          uint64_t v389 = swift_allocObject();
          *(double *)(v389 + 16) = a3;
          *(double *)(v389 + 24) = a4;
          os_log_t v516 = (os_log_t)sub_1A96317D0();
          int v390 = sub_1A9632230();
          uint64_t v391 = swift_allocObject();
          *(unsigned char *)(v391 + 16) = 112;
          uint64_t v392 = swift_allocObject();
          *(unsigned char *)(v392 + 16) = 8;
          uint64_t v393 = swift_allocObject();
          *(void *)(v393 + 16) = 1752392040;
          uint64_t v394 = swift_allocObject();
          *(void *)(v394 + 16) = sub_1A961B670;
          *(void *)(v394 + 24) = v393;
          uint64_t v395 = swift_allocObject();
          *(unsigned char *)(v395 + 16) = 33;
          uint64_t v396 = swift_allocObject();
          *(unsigned char *)(v396 + 16) = 8;
          uint64_t v397 = swift_allocObject();
          *(void *)(v397 + 16) = sub_1A961B548;
          *(void *)(v397 + 24) = v389;
          uint64_t v398 = swift_allocObject();
          *(void *)(v398 + 16) = sub_1A961B54C;
          *(void *)(v398 + 24) = v397;
          __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6DE290);
          uint64_t v399 = swift_allocObject();
          *(_OWORD *)(v399 + 16) = v575;
          *(void *)(v399 + 32) = sub_1A961B558;
          *(void *)(v399 + 40) = v391;
          *(void *)(v399 + 48) = sub_1A961B558;
          *(void *)(v399 + 56) = v392;
          *(void *)(v399 + 64) = sub_1A961B550;
          *(void *)(v399 + 72) = v394;
          *(void *)(v399 + 80) = sub_1A961B558;
          *(void *)(v399 + 88) = v395;
          *(void *)(v399 + 96) = sub_1A961B558;
          *(void *)(v399 + 104) = v396;
          *(void *)(v399 + 112) = sub_1A961B554;
          *(void *)(v399 + 120) = v398;
          swift_retain();
          swift_retain();
          swift_retain();
          swift_retain();
          swift_retain();
          swift_retain();
          v400 = v516;
          swift_bridgeObjectRelease();
          int v513 = v390;
          if (os_log_type_enabled(v400, (os_log_type_t)v390))
          {
            unint64_t v130 = (uint8_t *)sub_1A952A20C();
            uint64_t v131 = swift_slowAlloc();
            uint64_t v595 = v131;
            uint64_t v596 = 0;
            *(_WORD *)unint64_t v130 = 515;
            v597[0] = (uint64_t)(v130 + 2);
            v593 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1A961B558;
            uint64_t v594 = v391;
            a1 = v574;
            sub_1A9476698(&v593, (uint64_t)v597, (uint64_t)&v596, (uint64_t)&v595);
            if (!a1)
            {
              swift_release();
              v593 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1A961B558;
              uint64_t v594 = v392;
              sub_1A9476698(&v593, (uint64_t)v597, (uint64_t)&v596, (uint64_t)&v595);
              swift_release();
              v593 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1A961B550;
              uint64_t v594 = v394;
              sub_1A9476698(&v593, (uint64_t)v597, (uint64_t)&v596, (uint64_t)&v595);
              swift_release();
              v593 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1A961B558;
              uint64_t v594 = v395;
              sub_1A9476698(&v593, (uint64_t)v597, (uint64_t)&v596, (uint64_t)&v595);
              swift_release();
              v593 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1A961B558;
              uint64_t v594 = v396;
              sub_1A9476698(&v593, (uint64_t)v597, (uint64_t)&v596, (uint64_t)&v595);
              swift_release();
              v593 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1A961B554;
              uint64_t v594 = v398;
              sub_1A9476698(&v593, (uint64_t)v597, (uint64_t)&v596, (uint64_t)&v595);
              uint64_t v574 = 0;
              swift_release();
              os_log_type_t v132 = v513;
              unint64_t v133 = v516;
              unint64_t v134 = "Cache miss for weatherChange (unexpected); location=%{private,mask.hash}s";
              goto LABEL_242;
            }
            goto LABEL_268;
          }

          swift_release();
          swift_release();
          swift_release();
          swift_release();
          swift_release();
          swift_release();
          v452 = *v577;
          v453 = (uint64_t *)&v581;
        }
        goto LABEL_256;
      case 12:
        uint64_t v592 = v105 + 1;
        uint64_t v183 = (uint64_t)v540;
        uint64_t v184 = v590;
        sub_1A9608234(v590, v110, v573, (uint64_t)v540);
        uint64_t v185 = v565;
        if (__swift_getEnumTagSinglePayload(v183, 1, v565) != 1)
        {
          uint64_t v342 = v183;
          uint64_t v333 = v526;
          sub_1A9449580(v342, v526);
          v343 = v581;
          sub_1A961B118(v333, (uint64_t)v581);
          __swift_storeEnumTagSinglePayload((uint64_t)v343, 0, 1, v185);
          uint64_t v344 = v580;
          swift_storeEnumTagMultiPayload();
          __swift_storeEnumTagSinglePayload((uint64_t)v343, 0, 1, v344);
          uint64_t v345 = (uint64_t)v343;
          unint64_t v110 = v587;
          sub_1A9480798(v345, 12);
          v337 = type metadata accessor for TideEvents;
          goto LABEL_140;
        }
        sub_1A944C480(v183, &qword_1EB6DD1D8);
        if (sub_1A9608854(v184, v110))
        {
          uint64_t v186 = sub_1A95AA978();
          (*v578)(v536, v186, v109);
          uint64_t v187 = swift_allocObject();
          *(double *)(v187 + 16) = a3;
          *(double *)(v187 + 24) = a4;
          os_log_t v516 = (os_log_t)sub_1A96317D0();
          int v188 = sub_1A9632230();
          uint64_t v189 = swift_allocObject();
          *(unsigned char *)(v189 + 16) = 112;
          uint64_t v190 = swift_allocObject();
          *(unsigned char *)(v190 + 16) = 8;
          uint64_t v191 = swift_allocObject();
          *(void *)(v191 + 16) = 1752392040;
          uint64_t v192 = swift_allocObject();
          *(void *)(v192 + 16) = sub_1A961B670;
          *(void *)(v192 + 24) = v191;
          uint64_t v193 = swift_allocObject();
          *(unsigned char *)(v193 + 16) = 33;
          uint64_t v194 = swift_allocObject();
          *(unsigned char *)(v194 + 16) = 8;
          uint64_t v195 = swift_allocObject();
          *(void *)(v195 + 16) = sub_1A961B548;
          *(void *)(v195 + 24) = v187;
          uint64_t v196 = swift_allocObject();
          *(void *)(v196 + 16) = sub_1A961B54C;
          *(void *)(v196 + 24) = v195;
          __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6DE290);
          uint64_t v197 = swift_allocObject();
          *(_OWORD *)(v197 + 16) = v575;
          *(void *)(v197 + 32) = sub_1A961B558;
          *(void *)(v197 + 40) = v189;
          *(void *)(v197 + 48) = sub_1A961B558;
          *(void *)(v197 + 56) = v190;
          *(void *)(v197 + 64) = sub_1A961B550;
          *(void *)(v197 + 72) = v192;
          *(void *)(v197 + 80) = sub_1A961B558;
          *(void *)(v197 + 88) = v193;
          *(void *)(v197 + 96) = sub_1A961B558;
          *(void *)(v197 + 104) = v194;
          *(void *)(v197 + 112) = sub_1A961B554;
          *(void *)(v197 + 120) = v196;
          swift_retain();
          swift_retain();
          swift_retain();
          swift_retain();
          swift_retain();
          swift_retain();
          v198 = v516;
          swift_bridgeObjectRelease();
          int v513 = v188;
          if (os_log_type_enabled(v198, (os_log_type_t)v188))
          {
            unint64_t v130 = (uint8_t *)sub_1A952A20C();
            uint64_t v131 = swift_slowAlloc();
            uint64_t v595 = v131;
            uint64_t v596 = 0;
            *(_WORD *)unint64_t v130 = 515;
            v597[0] = (uint64_t)(v130 + 2);
            v593 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1A961B558;
            uint64_t v594 = v189;
            a1 = v574;
            sub_1A9476698(&v593, (uint64_t)v597, (uint64_t)&v596, (uint64_t)&v595);
            if (!a1)
            {
              swift_release();
              v593 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1A961B558;
              uint64_t v594 = v190;
              sub_1A9476698(&v593, (uint64_t)v597, (uint64_t)&v596, (uint64_t)&v595);
              swift_release();
              v593 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1A961B550;
              uint64_t v594 = v192;
              sub_1A9476698(&v593, (uint64_t)v597, (uint64_t)&v596, (uint64_t)&v595);
              swift_release();
              v593 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1A961B558;
              uint64_t v594 = v193;
              sub_1A9476698(&v593, (uint64_t)v597, (uint64_t)&v596, (uint64_t)&v595);
              swift_release();
              v593 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1A961B558;
              uint64_t v594 = v194;
              sub_1A9476698(&v593, (uint64_t)v597, (uint64_t)&v596, (uint64_t)&v595);
              swift_release();
              v593 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1A961B554;
              uint64_t v594 = v196;
              sub_1A9476698(&v593, (uint64_t)v597, (uint64_t)&v596, (uint64_t)&v595);
              uint64_t v574 = 0;
              swift_release();
              os_log_type_t v132 = v513;
              unint64_t v133 = v516;
              unint64_t v134 = "Cache miss for tideEvents (expected); location=%{private,mask.hash}s";
              goto LABEL_242;
            }
            goto LABEL_268;
          }

          swift_release();
          swift_release();
          swift_release();
          swift_release();
          swift_release();
          swift_release();
          v452 = *v577;
          v453 = &v568;
        }
        else
        {
          sub_1A95CBF74(12);
          uint64_t v439 = sub_1A95AA978();
          (*v578)(v537, v439, v109);
          uint64_t v440 = swift_allocObject();
          *(double *)(v440 + 16) = a3;
          *(double *)(v440 + 24) = a4;
          os_log_t v516 = (os_log_t)sub_1A96317D0();
          int v441 = sub_1A9632230();
          uint64_t v442 = swift_allocObject();
          *(unsigned char *)(v442 + 16) = 112;
          uint64_t v443 = swift_allocObject();
          *(unsigned char *)(v443 + 16) = 8;
          uint64_t v444 = swift_allocObject();
          *(void *)(v444 + 16) = 1752392040;
          uint64_t v445 = swift_allocObject();
          *(void *)(v445 + 16) = sub_1A961B670;
          *(void *)(v445 + 24) = v444;
          uint64_t v446 = swift_allocObject();
          *(unsigned char *)(v446 + 16) = 33;
          uint64_t v447 = swift_allocObject();
          *(unsigned char *)(v447 + 16) = 8;
          uint64_t v448 = swift_allocObject();
          *(void *)(v448 + 16) = sub_1A961B548;
          *(void *)(v448 + 24) = v440;
          uint64_t v449 = swift_allocObject();
          *(void *)(v449 + 16) = sub_1A961B54C;
          *(void *)(v449 + 24) = v448;
          __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6DE290);
          uint64_t v450 = swift_allocObject();
          *(_OWORD *)(v450 + 16) = v575;
          *(void *)(v450 + 32) = sub_1A961B558;
          *(void *)(v450 + 40) = v442;
          *(void *)(v450 + 48) = sub_1A961B558;
          *(void *)(v450 + 56) = v443;
          *(void *)(v450 + 64) = sub_1A961B550;
          *(void *)(v450 + 72) = v445;
          *(void *)(v450 + 80) = sub_1A961B558;
          *(void *)(v450 + 88) = v446;
          *(void *)(v450 + 96) = sub_1A961B558;
          *(void *)(v450 + 104) = v447;
          *(void *)(v450 + 112) = sub_1A961B554;
          *(void *)(v450 + 120) = v449;
          swift_retain();
          swift_retain();
          swift_retain();
          swift_retain();
          swift_retain();
          swift_retain();
          v451 = v516;
          swift_bridgeObjectRelease();
          int v513 = v441;
          if (os_log_type_enabled(v451, (os_log_type_t)v441))
          {
            unint64_t v130 = (uint8_t *)sub_1A952A20C();
            uint64_t v131 = swift_slowAlloc();
            uint64_t v595 = v131;
            uint64_t v596 = 0;
            *(_WORD *)unint64_t v130 = 515;
            v597[0] = (uint64_t)(v130 + 2);
            v593 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1A961B558;
            uint64_t v594 = v442;
            a1 = v574;
            sub_1A9476698(&v593, (uint64_t)v597, (uint64_t)&v596, (uint64_t)&v595);
            if (!a1)
            {
              swift_release();
              v593 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1A961B558;
              uint64_t v594 = v443;
              sub_1A9476698(&v593, (uint64_t)v597, (uint64_t)&v596, (uint64_t)&v595);
              swift_release();
              v593 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1A961B550;
              uint64_t v594 = v445;
              sub_1A9476698(&v593, (uint64_t)v597, (uint64_t)&v596, (uint64_t)&v595);
              swift_release();
              v593 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1A961B558;
              uint64_t v594 = v446;
              sub_1A9476698(&v593, (uint64_t)v597, (uint64_t)&v596, (uint64_t)&v595);
              swift_release();
              v593 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1A961B558;
              uint64_t v594 = v447;
              sub_1A9476698(&v593, (uint64_t)v597, (uint64_t)&v596, (uint64_t)&v595);
              swift_release();
              v593 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1A961B554;
              uint64_t v594 = v449;
              sub_1A9476698(&v593, (uint64_t)v597, (uint64_t)&v596, (uint64_t)&v595);
              uint64_t v574 = 0;
              swift_release();
              os_log_type_t v132 = v513;
              unint64_t v133 = v516;
              unint64_t v134 = "Cache miss for tideEvents (unexpected); location=%{private,mask.hash}s";
              goto LABEL_242;
            }
            goto LABEL_268;
          }

          swift_release();
          swift_release();
          swift_release();
          swift_release();
          swift_release();
          swift_release();
          v452 = *v577;
          v453 = (uint64_t *)&v569;
        }
        goto LABEL_256;
      case 13:
      case 14:
        uint64_t v592 = v105 + 1;
        v593 = v586;
        uint64_t v135 = (uint64_t)v570;
        uint64_t v136 = v590;
        sub_1A960C6D8(v590, v110, (uint64_t *)&v593, (uint64_t)v570);
        uint64_t v137 = v572;
        if (__swift_getEnumTagSinglePayload(v135, 1, v572) != 1)
        {
          uint64_t v280 = v135;
          uint64_t v281 = v568;
          sub_1A9449580(v280, v568);
          v282 = v581;
          sub_1A961B118(v281, (uint64_t)v581);
          __swift_storeEnumTagSinglePayload((uint64_t)v282, 0, 1, v137);
          uint64_t v283 = v580;
          swift_storeEnumTagMultiPayload();
          __swift_storeEnumTagSinglePayload((uint64_t)v282, 0, 1, v283);
          uint64_t v284 = (uint64_t)v282;
          unint64_t v110 = v587;
          sub_1A9480798(v284, v113);
          v285 = type metadata accessor for WeatherComparisons;
          goto LABEL_135;
        }
        sub_1A944C480(v135, &qword_1EB6DDA28);
        if (sub_1A960D108(v136, v110))
        {
          uint64_t v138 = sub_1A95AA978();
          (*v578)(v551, v138, v109);
          uint64_t v139 = swift_allocObject();
          *(double *)(v139 + 16) = a3;
          *(double *)(v139 + 24) = a4;
          os_log_t v516 = (os_log_t)sub_1A96317D0();
          int v140 = sub_1A9632230();
          uint64_t v141 = swift_allocObject();
          *(unsigned char *)(v141 + 16) = 112;
          uint64_t v142 = swift_allocObject();
          *(unsigned char *)(v142 + 16) = 8;
          uint64_t v143 = swift_allocObject();
          *(void *)(v143 + 16) = 1752392040;
          uint64_t v144 = swift_allocObject();
          *(void *)(v144 + 16) = sub_1A961B670;
          *(void *)(v144 + 24) = v143;
          uint64_t v145 = swift_allocObject();
          *(unsigned char *)(v145 + 16) = 33;
          uint64_t v146 = swift_allocObject();
          *(unsigned char *)(v146 + 16) = 8;
          uint64_t v147 = swift_allocObject();
          *(void *)(v147 + 16) = sub_1A961B548;
          *(void *)(v147 + 24) = v139;
          uint64_t v148 = swift_allocObject();
          *(void *)(v148 + 16) = sub_1A961B54C;
          *(void *)(v148 + 24) = v147;
          __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6DE290);
          uint64_t v149 = swift_allocObject();
          *(_OWORD *)(v149 + 16) = v575;
          *(void *)(v149 + 32) = sub_1A961B558;
          *(void *)(v149 + 40) = v141;
          *(void *)(v149 + 48) = sub_1A961B558;
          *(void *)(v149 + 56) = v142;
          *(void *)(v149 + 64) = sub_1A961B550;
          *(void *)(v149 + 72) = v144;
          *(void *)(v149 + 80) = sub_1A961B558;
          *(void *)(v149 + 88) = v145;
          *(void *)(v149 + 96) = sub_1A961B558;
          *(void *)(v149 + 104) = v146;
          *(void *)(v149 + 112) = sub_1A961B554;
          *(void *)(v149 + 120) = v148;
          swift_retain();
          swift_retain();
          swift_retain();
          swift_retain();
          swift_retain();
          swift_retain();
          unint64_t v150 = v516;
          swift_bridgeObjectRelease();
          int v513 = v140;
          if (os_log_type_enabled(v150, (os_log_type_t)v140))
          {
            unint64_t v130 = (uint8_t *)sub_1A952A20C();
            uint64_t v131 = swift_slowAlloc();
            uint64_t v595 = v131;
            uint64_t v596 = 0;
            *(_WORD *)unint64_t v130 = 515;
            v597[0] = (uint64_t)(v130 + 2);
            v593 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1A961B558;
            uint64_t v594 = v141;
            a1 = v574;
            sub_1A9476698(&v593, (uint64_t)v597, (uint64_t)&v596, (uint64_t)&v595);
            if (!a1)
            {
              swift_release();
              v593 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1A961B558;
              uint64_t v594 = v142;
              sub_1A9476698(&v593, (uint64_t)v597, (uint64_t)&v596, (uint64_t)&v595);
              swift_release();
              v593 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1A961B550;
              uint64_t v594 = v144;
              sub_1A9476698(&v593, (uint64_t)v597, (uint64_t)&v596, (uint64_t)&v595);
              swift_release();
              v593 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1A961B558;
              uint64_t v594 = v145;
              sub_1A9476698(&v593, (uint64_t)v597, (uint64_t)&v596, (uint64_t)&v595);
              swift_release();
              v593 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1A961B558;
              uint64_t v594 = v146;
              sub_1A9476698(&v593, (uint64_t)v597, (uint64_t)&v596, (uint64_t)&v595);
              swift_release();
              v593 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1A961B554;
              uint64_t v594 = v148;
              sub_1A9476698(&v593, (uint64_t)v597, (uint64_t)&v596, (uint64_t)&v595);
              uint64_t v574 = 0;
              swift_release();
              os_log_type_t v132 = v513;
              unint64_t v133 = v516;
              unint64_t v134 = "Cache miss for weatherComparisons (expected); location=%{private,mask.hash}s";
              goto LABEL_242;
            }
            goto LABEL_268;
          }

          swift_release();
          swift_release();
          swift_release();
          swift_release();
          swift_release();
          swift_release();
          v452 = *v577;
          v453 = (uint64_t *)&v582;
        }
        else
        {
          sub_1A95CBF74(14);
          uint64_t v366 = sub_1A95AA978();
          (*v578)(v552, v366, v109);
          uint64_t v367 = swift_allocObject();
          *(double *)(v367 + 16) = a3;
          *(double *)(v367 + 24) = a4;
          os_log_t v516 = (os_log_t)sub_1A96317D0();
          int v368 = sub_1A9632230();
          uint64_t v369 = swift_allocObject();
          *(unsigned char *)(v369 + 16) = 112;
          uint64_t v370 = swift_allocObject();
          *(unsigned char *)(v370 + 16) = 8;
          uint64_t v371 = swift_allocObject();
          *(void *)(v371 + 16) = 1752392040;
          uint64_t v372 = swift_allocObject();
          *(void *)(v372 + 16) = sub_1A961B670;
          *(void *)(v372 + 24) = v371;
          uint64_t v373 = swift_allocObject();
          *(unsigned char *)(v373 + 16) = 33;
          uint64_t v374 = swift_allocObject();
          *(unsigned char *)(v374 + 16) = 8;
          uint64_t v375 = swift_allocObject();
          *(void *)(v375 + 16) = sub_1A961B548;
          *(void *)(v375 + 24) = v367;
          uint64_t v376 = swift_allocObject();
          *(void *)(v376 + 16) = sub_1A961B54C;
          *(void *)(v376 + 24) = v375;
          __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6DE290);
          uint64_t v377 = swift_allocObject();
          *(_OWORD *)(v377 + 16) = v575;
          *(void *)(v377 + 32) = sub_1A961B558;
          *(void *)(v377 + 40) = v369;
          *(void *)(v377 + 48) = sub_1A961B558;
          *(void *)(v377 + 56) = v370;
          *(void *)(v377 + 64) = sub_1A961B550;
          *(void *)(v377 + 72) = v372;
          *(void *)(v377 + 80) = sub_1A961B558;
          *(void *)(v377 + 88) = v373;
          *(void *)(v377 + 96) = sub_1A961B558;
          *(void *)(v377 + 104) = v374;
          *(void *)(v377 + 112) = sub_1A961B554;
          *(void *)(v377 + 120) = v376;
          swift_retain();
          swift_retain();
          swift_retain();
          swift_retain();
          swift_retain();
          swift_retain();
          v378 = v516;
          swift_bridgeObjectRelease();
          int v513 = v368;
          if (os_log_type_enabled(v378, (os_log_type_t)v368))
          {
            unint64_t v130 = (uint8_t *)sub_1A952A20C();
            uint64_t v131 = swift_slowAlloc();
            uint64_t v595 = v131;
            uint64_t v596 = 0;
            *(_WORD *)unint64_t v130 = 515;
            v597[0] = (uint64_t)(v130 + 2);
            v593 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1A961B558;
            uint64_t v594 = v369;
            a1 = v574;
            sub_1A9476698(&v593, (uint64_t)v597, (uint64_t)&v596, (uint64_t)&v595);
            if (!a1)
            {
              swift_release();
              v593 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1A961B558;
              uint64_t v594 = v370;
              sub_1A9476698(&v593, (uint64_t)v597, (uint64_t)&v596, (uint64_t)&v595);
              swift_release();
              v593 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1A961B550;
              uint64_t v594 = v372;
              sub_1A9476698(&v593, (uint64_t)v597, (uint64_t)&v596, (uint64_t)&v595);
              swift_release();
              v593 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1A961B558;
              uint64_t v594 = v373;
              sub_1A9476698(&v593, (uint64_t)v597, (uint64_t)&v596, (uint64_t)&v595);
              swift_release();
              v593 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1A961B558;
              uint64_t v594 = v374;
              sub_1A9476698(&v593, (uint64_t)v597, (uint64_t)&v596, (uint64_t)&v595);
              swift_release();
              v593 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1A961B554;
              uint64_t v594 = v376;
              sub_1A9476698(&v593, (uint64_t)v597, (uint64_t)&v596, (uint64_t)&v595);
              uint64_t v574 = 0;
              swift_release();
              os_log_type_t v132 = v513;
              unint64_t v133 = v516;
              unint64_t v134 = "Cache miss for weatherComparisons; location=%{private,mask.hash}s";
              goto LABEL_242;
            }
            goto LABEL_268;
          }

          swift_release();
          swift_release();
          swift_release();
          swift_release();
          swift_release();
          swift_release();
          v452 = *v577;
          v453 = (uint64_t *)&v583;
        }
        goto LABEL_256;
      case 15:
        v597[0] = (uint64_t)v586;
        uint64_t v277 = v590;
        sub_1A960A314(v590, v110, v597, (uint64_t *)&v593);
        if (v593)
        {
          v278 = v581;
          void *v581 = v593;
          uint64_t v279 = v580;
          swift_storeEnumTagMultiPayload();
          __swift_storeEnumTagSinglePayload((uint64_t)v278, 0, 1, v279);
          sub_1A9480798((uint64_t)v278, 15);
          goto LABEL_258;
        }
        uint64_t v592 = v105 + 1;
        if (sub_1A960AC18(v277, v110))
        {
          uint64_t v401 = sub_1A95AA978();
          (*v578)(v514, v401, v109);
          uint64_t v402 = swift_allocObject();
          *(double *)(v402 + 16) = a3;
          *(double *)(v402 + 24) = a4;
          os_log_t v516 = (os_log_t)sub_1A96317D0();
          int v513 = sub_1A9632230();
          uint64_t v403 = swift_allocObject();
          *(unsigned char *)(v403 + 16) = 112;
          uint64_t v404 = swift_allocObject();
          *(unsigned char *)(v404 + 16) = 8;
          uint64_t v405 = swift_allocObject();
          *(void *)(v405 + 16) = 1752392040;
          uint64_t v406 = swift_allocObject();
          *(void *)(v406 + 16) = sub_1A961B670;
          *(void *)(v406 + 24) = v405;
          uint64_t v407 = swift_allocObject();
          *(unsigned char *)(v407 + 16) = 33;
          uint64_t v408 = swift_allocObject();
          *(unsigned char *)(v408 + 16) = 8;
          uint64_t v409 = swift_allocObject();
          *(void *)(v409 + 16) = sub_1A961B548;
          *(void *)(v409 + 24) = v402;
          uint64_t v410 = swift_allocObject();
          *(void *)(v410 + 16) = sub_1A961B54C;
          *(void *)(v410 + 24) = v409;
          __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6DE290);
          uint64_t v411 = swift_allocObject();
          *(_OWORD *)(v411 + 16) = v575;
          *(void *)(v411 + 32) = sub_1A961B558;
          *(void *)(v411 + 40) = v403;
          *(void *)(v411 + 48) = sub_1A961B558;
          *(void *)(v411 + 56) = v404;
          *(void *)(v411 + 64) = sub_1A961B550;
          *(void *)(v411 + 72) = v406;
          *(void *)(v411 + 80) = sub_1A961B558;
          *(void *)(v411 + 88) = v407;
          *(void *)(v411 + 96) = sub_1A961B558;
          *(void *)(v411 + 104) = v408;
          *(void *)(v411 + 112) = sub_1A961B554;
          *(void *)(v411 + 120) = v410;
          swift_retain();
          swift_retain();
          swift_retain();
          swift_retain();
          swift_retain();
          swift_retain();
          v412 = v516;
          swift_bridgeObjectRelease();
          if (os_log_type_enabled(v412, (os_log_type_t)v513))
          {
            unint64_t v130 = (uint8_t *)sub_1A952A20C();
            uint64_t v131 = swift_slowAlloc();
            uint64_t v595 = v131;
            uint64_t v596 = 0;
            *(_WORD *)unint64_t v130 = 515;
            v597[0] = (uint64_t)(v130 + 2);
            v593 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1A961B558;
            uint64_t v594 = v403;
            a1 = v574;
            sub_1A9476698(&v593, (uint64_t)v597, (uint64_t)&v596, (uint64_t)&v595);
            if (!a1)
            {
              swift_release();
              v593 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1A961B558;
              uint64_t v594 = v404;
              sub_1A9476698(&v593, (uint64_t)v597, (uint64_t)&v596, (uint64_t)&v595);
              swift_release();
              v593 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1A961B550;
              uint64_t v594 = v406;
              sub_1A9476698(&v593, (uint64_t)v597, (uint64_t)&v596, (uint64_t)&v595);
              swift_release();
              v593 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1A961B558;
              uint64_t v594 = v407;
              sub_1A9476698(&v593, (uint64_t)v597, (uint64_t)&v596, (uint64_t)&v595);
              swift_release();
              v593 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1A961B558;
              uint64_t v594 = v408;
              sub_1A9476698(&v593, (uint64_t)v597, (uint64_t)&v596, (uint64_t)&v595);
              swift_release();
              v593 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1A961B554;
              uint64_t v594 = v410;
              sub_1A9476698(&v593, (uint64_t)v597, (uint64_t)&v596, (uint64_t)&v595);
              uint64_t v574 = 0;
              swift_release();
              os_log_type_t v132 = v513;
              unint64_t v133 = v516;
              unint64_t v134 = "Cache miss for historicalFacts (expected); location=%{private,mask.hash}s";
              goto LABEL_242;
            }
            goto LABEL_268;
          }

          swift_release();
          swift_release();
          swift_release();
          swift_release();
          swift_release();
          swift_release();
          v507 = *v577;
          v508 = &v546;
        }
        else
        {
          sub_1A95CBF74(15);
          uint64_t v495 = sub_1A95AA978();
          (*v578)(v515, v495, v109);
          uint64_t v496 = swift_allocObject();
          *(double *)(v496 + 16) = a3;
          *(double *)(v496 + 24) = a4;
          os_log_t v516 = (os_log_t)sub_1A96317D0();
          int v513 = sub_1A9632230();
          uint64_t v497 = swift_allocObject();
          *(unsigned char *)(v497 + 16) = 112;
          uint64_t v498 = swift_allocObject();
          *(unsigned char *)(v498 + 16) = 8;
          uint64_t v499 = swift_allocObject();
          *(void *)(v499 + 16) = 1752392040;
          uint64_t v500 = swift_allocObject();
          *(void *)(v500 + 16) = sub_1A961A2E0;
          *(void *)(v500 + 24) = v499;
          uint64_t v501 = swift_allocObject();
          *(unsigned char *)(v501 + 16) = 33;
          uint64_t v502 = swift_allocObject();
          *(unsigned char *)(v502 + 16) = 8;
          uint64_t v503 = swift_allocObject();
          *(void *)(v503 + 16) = sub_1A961B548;
          *(void *)(v503 + 24) = v496;
          uint64_t v504 = swift_allocObject();
          *(void *)(v504 + 16) = sub_1A961A308;
          *(void *)(v504 + 24) = v503;
          __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6DE290);
          uint64_t v505 = swift_allocObject();
          *(_OWORD *)(v505 + 16) = v575;
          *(void *)(v505 + 32) = sub_1A961A2C0;
          *(void *)(v505 + 40) = v497;
          *(void *)(v505 + 48) = sub_1A961B558;
          *(void *)(v505 + 56) = v498;
          *(void *)(v505 + 64) = sub_1A961A2E8;
          *(void *)(v505 + 72) = v500;
          *(void *)(v505 + 80) = sub_1A961B558;
          *(void *)(v505 + 88) = v501;
          *(void *)(v505 + 96) = sub_1A961B558;
          *(void *)(v505 + 104) = v502;
          *(void *)(v505 + 112) = sub_1A961A310;
          *(void *)(v505 + 120) = v504;
          swift_retain();
          swift_retain();
          swift_retain();
          swift_retain();
          swift_retain();
          swift_retain();
          v506 = v516;
          swift_bridgeObjectRelease();
          if (os_log_type_enabled(v506, (os_log_type_t)v513))
          {
            unint64_t v130 = (uint8_t *)sub_1A952A20C();
            uint64_t v131 = swift_slowAlloc();
            uint64_t v595 = v131;
            uint64_t v596 = 0;
            *(_WORD *)unint64_t v130 = 515;
            v597[0] = (uint64_t)(v130 + 2);
            v593 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1A961A2C0;
            uint64_t v594 = v497;
            a1 = v574;
            sub_1A9476698(&v593, (uint64_t)v597, (uint64_t)&v596, (uint64_t)&v595);
            if (!a1)
            {
              swift_release();
              v593 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1A961B558;
              uint64_t v594 = v498;
              sub_1A9476698(&v593, (uint64_t)v597, (uint64_t)&v596, (uint64_t)&v595);
              swift_release();
              v593 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1A961A2E8;
              uint64_t v594 = v500;
              sub_1A9476698(&v593, (uint64_t)v597, (uint64_t)&v596, (uint64_t)&v595);
              swift_release();
              v593 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1A961B558;
              uint64_t v594 = v501;
              sub_1A9476698(&v593, (uint64_t)v597, (uint64_t)&v596, (uint64_t)&v595);
              swift_release();
              v593 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1A961B558;
              uint64_t v594 = v502;
              sub_1A9476698(&v593, (uint64_t)v597, (uint64_t)&v596, (uint64_t)&v595);
              swift_release();
              v593 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1A961A310;
              uint64_t v594 = v504;
              sub_1A9476698(&v593, (uint64_t)v597, (uint64_t)&v596, (uint64_t)&v595);
              uint64_t v574 = 0;
              swift_release();
              os_log_type_t v132 = v513;
              unint64_t v133 = v516;
              unint64_t v134 = "Cache miss for historicalFacts; location=%{private,mask.hash}s";
              goto LABEL_242;
            }
            goto LABEL_268;
          }

          swift_release();
          swift_release();
          swift_release();
          swift_release();
          swift_release();
          swift_release();
          v507 = *v577;
          v508 = &v547;
        }
        uint64_t v109 = v584;
        v507(*(v508 - 32), v584);
        uint64_t v107 = (uint64_t)v582;
        uint64_t v106 = (uint64_t)v583;
        goto LABEL_136;
      default:
        uint64_t v592 = v105 + 1;
        v593 = v586;
        uint64_t v231 = v543;
        uint64_t v232 = v590;
        sub_1A96009D4(v590, v110, (uint64_t *)&v593, v543);
        uint64_t v233 = v542;
        if (__swift_getEnumTagSinglePayload(v231, 1, v542) != 1)
        {
          uint64_t v355 = v517;
          sub_1A9449580(v231, v517);
          v356 = v581;
          sub_1A961B118(v355, (uint64_t)v581);
          __swift_storeEnumTagSinglePayload((uint64_t)v356, 0, 1, v233);
          uint64_t v357 = v580;
          swift_storeEnumTagMultiPayload();
          __swift_storeEnumTagSinglePayload((uint64_t)v356, 0, 1, v357);
          sub_1A9480798((uint64_t)v356, 0);
          v346 = type metadata accessor for AirQuality;
          uint64_t v347 = v355;
          unint64_t v110 = v587;
          goto LABEL_159;
        }
        sub_1A944C480(v231, &qword_1EB6DE088);
        if ((sub_1A9601404(v232, v110) & 1) == 0)
        {
          sub_1A95CBF74(0);
          uint64_t v454 = sub_1A95AA978();
          uint64_t v455 = v109;
          (*v578)(v529, v454, v109);
          uint64_t v456 = swift_allocObject();
          *(double *)(v456 + 16) = a3;
          *(double *)(v456 + 24) = a4;
          os_log_t v516 = (os_log_t)sub_1A96317D0();
          int v513 = sub_1A9632230();
          uint64_t v457 = swift_allocObject();
          *(unsigned char *)(v457 + 16) = 112;
          uint64_t v458 = swift_allocObject();
          *(unsigned char *)(v458 + 16) = 8;
          uint64_t v459 = swift_allocObject();
          *(void *)(v459 + 16) = 1752392040;
          uint64_t v460 = swift_allocObject();
          *(void *)(v460 + 16) = sub_1A961B670;
          *(void *)(v460 + 24) = v459;
          uint64_t v461 = swift_allocObject();
          *(unsigned char *)(v461 + 16) = 33;
          uint64_t v462 = swift_allocObject();
          *(unsigned char *)(v462 + 16) = 8;
          uint64_t v463 = swift_allocObject();
          *(void *)(v463 + 16) = sub_1A961A8FC;
          *(void *)(v463 + 24) = v456;
          uint64_t v464 = swift_allocObject();
          *(void *)(v464 + 16) = sub_1A961B54C;
          *(void *)(v464 + 24) = v463;
          __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6DE290);
          uint64_t v465 = swift_allocObject();
          *(_OWORD *)(v465 + 16) = v575;
          *(void *)(v465 + 32) = sub_1A961B558;
          *(void *)(v465 + 40) = v457;
          *(void *)(v465 + 48) = sub_1A961B558;
          *(void *)(v465 + 56) = v458;
          *(void *)(v465 + 64) = sub_1A961B550;
          *(void *)(v465 + 72) = v460;
          *(void *)(v465 + 80) = sub_1A961B558;
          *(void *)(v465 + 88) = v461;
          *(void *)(v465 + 96) = sub_1A961B558;
          *(void *)(v465 + 104) = v462;
          *(void *)(v465 + 112) = sub_1A961B554;
          *(void *)(v465 + 120) = v464;
          swift_retain();
          swift_retain();
          swift_retain();
          swift_retain();
          swift_retain();
          swift_retain();
          v466 = v516;
          swift_bridgeObjectRelease();
          if (os_log_type_enabled(v466, (os_log_type_t)v513))
          {
            v467 = (uint8_t *)sub_1A952A20C();
            uint64_t v468 = swift_slowAlloc();
            uint64_t v595 = v468;
            uint64_t v596 = 0;
            *(_WORD *)v467 = 515;
            v597[0] = (uint64_t)(v467 + 2);
            v593 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1A961B558;
            uint64_t v594 = v457;
            a1 = v574;
            sub_1A9476698(&v593, (uint64_t)v597, (uint64_t)&v596, (uint64_t)&v595);
            if (!a1)
            {
              swift_release();
              v593 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1A961B558;
              uint64_t v594 = v458;
              sub_1A9476698(&v593, (uint64_t)v597, (uint64_t)&v596, (uint64_t)&v595);
              swift_release();
              v593 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1A961B550;
              uint64_t v594 = v460;
              sub_1A9476698(&v593, (uint64_t)v597, (uint64_t)&v596, (uint64_t)&v595);
              swift_release();
              v593 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1A961B558;
              uint64_t v594 = v461;
              sub_1A9476698(&v593, (uint64_t)v597, (uint64_t)&v596, (uint64_t)&v595);
              swift_release();
              v593 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1A961B558;
              uint64_t v594 = v462;
              sub_1A9476698(&v593, (uint64_t)v597, (uint64_t)&v596, (uint64_t)&v595);
              swift_release();
              v593 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1A961B554;
              uint64_t v594 = v464;
              sub_1A9476698(&v593, (uint64_t)v597, (uint64_t)&v596, (uint64_t)&v595);
              uint64_t v574 = 0;
              swift_release();
              _os_log_impl(&dword_1A9410000, v516, (os_log_type_t)v513, "Cache miss for airQuality (unexpected); location=%{private,mask.hash}s",
                v467,
                0x16u);
              swift_arrayDestroy();
              MEMORY[0x1AD0F7300](v468, -1, -1);
              sub_1A952A214();
            }
            goto LABEL_268;
          }

          swift_release();
          swift_release();
          swift_release();
          swift_release();
          swift_release();
          swift_release();
          (*v577)(v529, v455);
          uint64_t v112 = v588;
          uint64_t v107 = (uint64_t)v582;
          uint64_t v106 = (uint64_t)v583;
          uint64_t v108 = (uint64_t)v585;
          uint64_t v109 = v455;
          unint64_t v110 = v587;
          a1 = v592;
          goto LABEL_259;
        }
        uint64_t v234 = sub_1A95AA978();
        (*v578)(v528, v234, v109);
        uint64_t v235 = swift_allocObject();
        *(double *)(v235 + 16) = a3;
        *(double *)(v235 + 24) = a4;
        os_log_t v516 = (os_log_t)sub_1A96317D0();
        int v236 = sub_1A9632230();
        uint64_t v237 = swift_allocObject();
        *(unsigned char *)(v237 + 16) = 112;
        uint64_t v238 = swift_allocObject();
        *(unsigned char *)(v238 + 16) = 8;
        uint64_t v239 = swift_allocObject();
        *(void *)(v239 + 16) = 1752392040;
        uint64_t v240 = swift_allocObject();
        *(void *)(v240 + 16) = sub_1A961B670;
        *(void *)(v240 + 24) = v239;
        uint64_t v241 = swift_allocObject();
        *(unsigned char *)(v241 + 16) = 33;
        uint64_t v242 = swift_allocObject();
        *(unsigned char *)(v242 + 16) = 8;
        uint64_t v243 = swift_allocObject();
        *(void *)(v243 + 16) = sub_1A961B548;
        *(void *)(v243 + 24) = v235;
        uint64_t v244 = swift_allocObject();
        *(void *)(v244 + 16) = sub_1A961B54C;
        *(void *)(v244 + 24) = v243;
        __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6DE290);
        uint64_t v245 = swift_allocObject();
        *(_OWORD *)(v245 + 16) = v575;
        *(void *)(v245 + 32) = sub_1A961B558;
        *(void *)(v245 + 40) = v237;
        *(void *)(v245 + 48) = sub_1A961B558;
        *(void *)(v245 + 56) = v238;
        *(void *)(v245 + 64) = sub_1A961B550;
        *(void *)(v245 + 72) = v240;
        *(void *)(v245 + 80) = sub_1A961B558;
        *(void *)(v245 + 88) = v241;
        *(void *)(v245 + 96) = sub_1A961B558;
        *(void *)(v245 + 104) = v242;
        *(void *)(v245 + 112) = sub_1A961B554;
        *(void *)(v245 + 120) = v244;
        swift_retain();
        swift_retain();
        swift_retain();
        swift_retain();
        swift_retain();
        swift_retain();
        v246 = v516;
        swift_bridgeObjectRelease();
        int v513 = v236;
        if (os_log_type_enabled(v246, (os_log_type_t)v236))
        {
          v247 = (uint8_t *)sub_1A952A20C();
          uint64_t v131 = swift_slowAlloc();
          uint64_t v595 = v131;
          uint64_t v596 = 0;
          *(_WORD *)v247 = 515;
          v597[0] = (uint64_t)(v247 + 2);
          v593 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1A961B558;
          uint64_t v594 = v237;
          a1 = v574;
          sub_1A9476698(&v593, (uint64_t)v597, (uint64_t)&v596, (uint64_t)&v595);
          if (!a1)
          {
            swift_release();
            v593 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1A961B558;
            uint64_t v594 = v238;
            sub_1A9476698(&v593, (uint64_t)v597, (uint64_t)&v596, (uint64_t)&v595);
            swift_release();
            v593 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1A961B550;
            uint64_t v594 = v240;
            sub_1A9476698(&v593, (uint64_t)v597, (uint64_t)&v596, (uint64_t)&v595);
            swift_release();
            v593 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1A961B558;
            uint64_t v594 = v241;
            sub_1A9476698(&v593, (uint64_t)v597, (uint64_t)&v596, (uint64_t)&v595);
            swift_release();
            v593 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1A961B558;
            uint64_t v594 = v242;
            sub_1A9476698(&v593, (uint64_t)v597, (uint64_t)&v596, (uint64_t)&v595);
            swift_release();
            v593 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1A961B554;
            uint64_t v594 = v244;
            sub_1A9476698(&v593, (uint64_t)v597, (uint64_t)&v596, (uint64_t)&v595);
            uint64_t v574 = 0;
            swift_release();
            _os_log_impl(&dword_1A9410000, v516, (os_log_type_t)v513, "Cache miss for airQuality (expected); location=%{private,mask.hash}s",
              v247,
              0x16u);
LABEL_243:
            swift_arrayDestroy();
            MEMORY[0x1AD0F7300](v131, -1, -1);
            sub_1A952A214();
          }
          goto LABEL_268;
        }

        swift_release();
        swift_release();
        swift_release();
        swift_release();
        swift_release();
        swift_release();
        v452 = *v577;
        v453 = &v560;
        goto LABEL_256;
    }
  }
}

uint64_t sub_1A95ED764(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, double a5, double a6)
{
  v26[0] = a3;
  uint64_t v11 = *v6;
  uint64_t v27 = a4;
  uint64_t v28 = v11;
  uint64_t v12 = sub_1A962EA40();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = *(void *)(v13 + 64);
  MEMORY[0x1F4188790](v12);
  uint64_t v15 = type metadata accessor for WeatherInterpolationOptions();
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v17 = *(void *)(v16 + 64);
  MEMORY[0x1F4188790](v15 - 8);
  uint64_t v18 = (char *)v26 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v29 = v6;
  double v30 = a5;
  double v31 = a6;
  uint64_t v32 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6DDBE0);
  v26[1] = sub_1A9631770();
  sub_1A961B118(a2, (uint64_t)v18);
  sub_1A9433E60(v26[0], (uint64_t)v33);
  (*(void (**)(char *, uint64_t, uint64_t))(v13 + 16))((char *)v26 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0), v27, v12);
  unint64_t v19 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  unint64_t v20 = (v17 + v19 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v21 = (*(unsigned __int8 *)(v13 + 80) + v20 + 40) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
  uint64_t v22 = swift_allocObject();
  *(double *)(v22 + 16) = a5;
  *(double *)(v22 + 24) = a6;
  sub_1A9449580((uint64_t)v18, v22 + v19);
  sub_1A9435A70(v33, v22 + v20);
  (*(void (**)(unint64_t, char *, uint64_t))(v13 + 32))(v22 + v21, (char *)v26 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0), v12);
  uint64_t v23 = (void *)sub_1A9631660();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6DA780);
  uint64_t v24 = sub_1A96316D0();
  swift_release();
  swift_release();

  return v24;
}

uint64_t sub_1A95EDA50@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = type metadata accessor for WeatherModel();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(void *)(a1 + 16))
  {
    unint64_t v8 = sub_1A94E73F4(4u);
    if (v9)
    {
      sub_1A961B118(*(void *)(a1 + 56) + *(void *)(v5 + 72) * v8, (uint64_t)v7);
      if (swift_getEnumCaseMultiPayload() == 4) {
        return sub_1A944A754((uint64_t)v7, a2, &qword_1EB6DE0F8);
      }
      sub_1A961B3A4((uint64_t)v7, (void (*)(void))type metadata accessor for WeatherModel);
    }
  }
  uint64_t HourForecast = type metadata accessor for NextHourForecast();
  return __swift_storeEnumTagSinglePayload(a2, 1, 1, HourForecast);
}

uint64_t sub_1A95EDBA0(uint64_t a1, uint64_t a2, NSObject *a3, uint64_t a4, double a5, double a6)
{
  uint64_t v210 = a1;
  uint64_t v211 = a4;
  uint64_t v209 = a3;
  uint64_t v201 = a2;
  uint64_t v8 = sub_1A962E360();
  uint64_t v202 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8);
  uint64_t v192 = (char *)&v184 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v10);
  uint64_t v190 = (char *)&v184 - v11;
  MEMORY[0x1F4188790](v12);
  uint64_t v194 = (char *)&v184 - v13;
  MEMORY[0x1F4188790](v14);
  uint64_t v193 = (char *)&v184 - v15;
  MEMORY[0x1F4188790](v16);
  uint64_t v206 = (char *)&v184 - v17;
  MEMORY[0x1F4188790](v18);
  uint64_t v195 = (char *)&v184 - v19;
  MEMORY[0x1F4188790](v20);
  uint64_t v22 = (char *)&v184 - v21;
  uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6DDC38);
  MEMORY[0x1F4188790](v23 - 8);
  uint64_t v25 = (char *)&v184 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v26);
  os_log_t v196 = (os_log_t)((char *)&v184 - v27);
  uint64_t v28 = type metadata accessor for CurrentWeather();
  uint64_t v207 = *(void *)(v28 - 8);
  uint64_t v208 = v28;
  MEMORY[0x1F4188790](v28);
  uint64_t v204 = (uint64_t)&v184 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v30);
  uint64_t v32 = (char *)&v184 - v31;
  MEMORY[0x1F4188790](v33);
  uint64_t v198 = (uint64_t)&v184 - v34;
  uint64_t v35 = sub_1A962E810();
  uint64_t v36 = *(char **)(v35 - 8);
  MEMORY[0x1F4188790](v35);
  uint64_t v212 = (char *)&v184 - ((v37 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v38);
  uint64_t v200 = (char *)&v184 - v39;
  MEMORY[0x1F4188790](v40);
  uint64_t v197 = (double *)((char *)&v184 - v41);
  MEMORY[0x1F4188790](v42);
  uint64_t v191 = (char *)&v184 - v43;
  MEMORY[0x1F4188790](v44);
  uint64_t v46 = (char *)&v184 - v45;
  MEMORY[0x1F4188790](v47);
  uint64_t v49 = (char *)&v184 - v48;
  uint64_t v50 = type metadata accessor for WeatherInterpolationOptions();
  MEMORY[0x1F4188790](v50);
  uint64_t v52 = (char *)&v184 - ((v51 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A961B118(v201, (uint64_t)v52);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v203 = v35;
    uint64_t v53 = v36;
    uint64_t v54 = &v52[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EB6DA620) + 48)];
    uint64_t v198 = *(void *)v54;
    LODWORD(v201) = v54[8];
    uint64_t v55 = v202;
    (*(void (**)(char *, char *, uint64_t))(v202 + 32))(v22, v52, v8);
    unint64_t v56 = v8;
    uint64_t v57 = v22;
    uint64_t v58 = v55;
    if (qword_1EB6DE388 != -1) {
      goto LABEL_41;
    }
    while (1)
    {
      uint64_t v59 = sub_1A96317F0();
      uint64_t v60 = __swift_project_value_buffer(v59, (uint64_t)qword_1EB6EB630);
      uint64_t v61 = *(void (**)(void))(v58 + 16);
      uint64_t v62 = v195;
      v61();
      uint64_t v189 = v58 + 16;
      int v188 = v61;
      ((void (*)(char *, char *, unint64_t))v61)(v206, v57, v56);
      uint64_t v191 = (char *)v60;
      uint64_t v63 = sub_1A96317D0();
      os_log_type_t v64 = sub_1A9632230();
      int v65 = v64;
      os_log_t v196 = v63;
      BOOL v66 = os_log_type_enabled(v63, v64);
      uint64_t v205 = v57;
      unint64_t v199 = v56;
      if (v66)
      {
        uint64_t v67 = swift_slowAlloc();
        int v186 = v65;
        uint64_t v68 = v67;
        uint64_t v187 = swift_slowAlloc();
        uint64_t v216 = v187;
        *(_DWORD *)uint64_t v68 = 141559043;
        uint64_t v214 = 1752392040;
        sub_1A9632350();
        *(_WORD *)(v68 + 12) = 2081;
        uint64_t v214 = *(void *)&a5;
        double v215 = a6;
        type metadata accessor for CLLocationCoordinate2D(0);
        uint64_t v213 = v53;
        uint64_t v69 = sub_1A9631DC0();
        uint64_t v214 = sub_1A945C1DC(v69, v70, &v216);
        uint64_t v197 = &v215;
        sub_1A9632350();
        swift_bridgeObjectRelease();
        *(_WORD *)(v68 + 22) = 2080;
        uint64_t v53 = v200;
        sub_1A962E350();
        sub_1A961B500((unint64_t *)&qword_1EB6DC720, MEMORY[0x1E4F27928]);
        uint64_t v71 = sub_1A96327B0();
        unint64_t v73 = v72;
        uint64_t v185 = (void (*)(char *, uint64_t))*((void *)v213 + 1);
        v185(v53, v203);
        uint64_t v214 = sub_1A945C1DC(v71, v73, &v216);
        sub_1A9632350();
        swift_bridgeObjectRelease();
        uint64_t v74 = *(double **)(v202 + 8);
        ((void (*)(char *, unint64_t))v74)(v62, v199);
        *(_WORD *)(v68 + 32) = 2080;
        uint64_t v195 = (char *)(v68 + 34);
        uint64_t v75 = v206;
        sub_1A962E340();
        uint64_t v76 = sub_1A96327B0();
        unint64_t v78 = v77;
        v185(v53, v203);
        uint64_t v214 = sub_1A945C1DC(v76, v78, &v216);
        sub_1A9632350();
        uint64_t v57 = v205;
        swift_bridgeObjectRelease();
        uint64_t v197 = v74;
        ((void (*)(char *, unint64_t))v74)(v75, v199);
        *(_WORD *)(v68 + 42) = 2080;
        uint64_t v214 = v198;
        LOBYTE(v215) = v201;
        uint64_t v79 = WeatherInterpolationOptions.Stride.description.getter();
        uint64_t v214 = sub_1A945C1DC(v79, v80, &v216);
        uint64_t v81 = v203;
        uint64_t v82 = v213;
        sub_1A9632350();
        swift_bridgeObjectRelease();
        os_log_t v83 = v196;
        _os_log_impl(&dword_1A9410000, v196, (os_log_type_t)v186, "Attempting to interpolate current weather; location=%{private,mask.hash}s, DateInterval.start: %s, DateInterva"
          "l.end: %s, stride: %s",
          (uint8_t *)v68,
          0x34u);
        uint64_t v84 = v187;
        swift_arrayDestroy();
        MEMORY[0x1AD0F7300](v84, -1, -1);
        MEMORY[0x1AD0F7300](v68, -1, -1);
      }
      else
      {
        uint64_t v99 = *(double **)(v58 + 8);
        ((void (*)(char *, unint64_t))v99)(v62, v56);
        uint64_t v197 = v99;
        ((void (*)(char *, unint64_t))v99)(v206, v56);

        uint64_t v82 = v53;
        uint64_t v81 = v203;
        uint64_t v53 = v200;
      }
      sub_1A962E350();
      sub_1A962E340();
      char v100 = sub_1A962E750();
      uint64_t v101 = (char *)*((void *)v82 + 1);
      uint64_t v58 = v81;
      uint64_t v213 = v82 + 8;
      uint64_t v206 = v101;
      ((void (*)(char *, uint64_t))v101)(v53, v81);
      if ((v100 & 1) == 0) {
        break;
      }
      int v102 = v201 | ((unsigned __int128)(v198 * (__int128)60) >> 64 == (60 * v198) >> 63);
      uint64_t v103 = MEMORY[0x1E4FBC860];
      unint64_t v104 = v212;
      while (1)
      {
        uint64_t isa = (uint64_t)v209[3].isa;
        Class v106 = v209[4].isa;
        __swift_project_boxed_opaque_existential_1(v209, isa);
        (*((void (**)(uint64_t, char *, uint64_t, uint64_t, Class, double, double))v106 + 1))(v210, v104, v211, isa, v106, a5, a6);
        if (__swift_getEnumTagSinglePayload((uint64_t)v25, 1, v208) == 1)
        {
          sub_1A944C480((uint64_t)v25, &qword_1EB6DDC38);
          uint64_t v57 = v205;
          goto LABEL_28;
        }
        sub_1A9449580((uint64_t)v25, (uint64_t)v32);
        uint64_t v107 = v204;
        sub_1A961B118((uint64_t)v32, v204);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v103 = sub_1A9481F94(0, *(void *)(v103 + 16) + 1, 1, v103);
        }
        uint64_t v57 = v205;
        unint64_t v56 = *(void *)(v103 + 16);
        unint64_t v108 = *(void *)(v103 + 24);
        if (v56 >= v108 >> 1) {
          uint64_t v103 = sub_1A9481F94(v108 > 1, v56 + 1, 1, v103);
        }
        *(void *)(v103 + 16) = v56 + 1;
        sub_1A9449580(v107, v103+ ((*(unsigned __int8 *)(v207 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v207 + 80))+ *(void *)(v207 + 72) * v56);
        if (!v102) {
          break;
        }
        unint64_t v104 = v212;
        sub_1A962E7D0();
        sub_1A961B3A4((uint64_t)v32, (void (*)(void))type metadata accessor for CurrentWeather);
        sub_1A962E340();
        char v109 = sub_1A962E750();
        ((void (*)(char *, uint64_t))v206)(v53, v58);
        if ((v109 & 1) == 0) {
          goto LABEL_28;
        }
      }
      __break(1u);
LABEL_41:
      swift_once();
    }
    uint64_t v103 = MEMORY[0x1E4FBC860];
LABEL_28:
    if (*(void *)(v103 + 16))
    {
      unint64_t v133 = v193;
      unint64_t v134 = v199;
      uint64_t v135 = v188;
      ((void (*)(char *, char *, unint64_t))v188)(v193, v57, v199);
      uint64_t v136 = v194;
      ((void (*)(char *, char *, unint64_t))v135)(v194, v57, v134);
      uint64_t v137 = sub_1A96317D0();
      os_log_type_t v138 = sub_1A9632230();
      int v139 = v138;
      uint64_t v140 = v58;
      if (os_log_type_enabled(v137, v138))
      {
        uint64_t v141 = swift_slowAlloc();
        uint64_t v211 = swift_slowAlloc();
        uint64_t v216 = v211;
        *(_DWORD *)uint64_t v141 = 136315650;
        uint64_t v207 = v141 + 4;
        LODWORD(v210) = v139;
        uint64_t v142 = v200;
        uint64_t v209 = v137;
        sub_1A962E350();
        uint64_t v208 = sub_1A961B500((unint64_t *)&qword_1EB6DC720, MEMORY[0x1E4F27928]);
        uint64_t v143 = sub_1A96327B0();
        unint64_t v145 = v144;
        uint64_t v146 = (void (*)(char *, uint64_t))v206;
        ((void (*)(char *, uint64_t))v206)(v142, v140);
        uint64_t v214 = sub_1A945C1DC(v143, v145, &v216);
        sub_1A9632350();
        swift_bridgeObjectRelease();
        uint64_t v207 = v202 + 8;
        unint64_t v147 = v199;
        ((void (*)(char *, unint64_t))v197)(v193, v199);
        *(_WORD *)(v141 + 12) = 2080;
        sub_1A962E340();
        uint64_t v148 = sub_1A96327B0();
        unint64_t v150 = v149;
        v146(v142, v140);
        uint64_t v214 = sub_1A945C1DC(v148, v150, &v216);
        sub_1A9632350();
        swift_bridgeObjectRelease();
        uint64_t v151 = v197;
        ((void (*)(char *, unint64_t))v197)(v194, v147);
        *(_WORD *)(v141 + 22) = 2080;
        uint64_t v214 = v198;
        LOBYTE(v215) = v201;
        uint64_t v152 = WeatherInterpolationOptions.Stride.description.getter();
        uint64_t v214 = sub_1A945C1DC(v152, v153, &v216);
        sub_1A9632350();
        swift_bridgeObjectRelease();
        uint64_t v154 = v209;
        _os_log_impl(&dword_1A9410000, v209, (os_log_type_t)v210, "Successfully interpolated for dateInterval.start: %s, dateInterval.end: %s, stride: %s", (uint8_t *)v141, 0x20u);
        uint64_t v155 = v211;
        swift_arrayDestroy();
        MEMORY[0x1AD0F7300](v155, -1, -1);
        MEMORY[0x1AD0F7300](v141, -1, -1);

        v146(v212, v203);
        ((void (*)(char *, unint64_t))v151)(v205, v147);
      }
      else
      {

        uint64_t v179 = v133;
        uint64_t v180 = v197;
        ((void (*)(char *, unint64_t))v197)(v136, v134);
        ((void (*)(char *, unint64_t))v180)(v179, v134);
        ((void (*)(char *, uint64_t))v206)(v212, v58);
        ((void (*)(char *, unint64_t))v180)(v57, v134);
      }
      return v103;
    }
    swift_bridgeObjectRelease();
    int v156 = v190;
    unint64_t v157 = v199;
    uint64_t v158 = v188;
    ((void (*)(char *, char *, unint64_t))v188)(v190, v57, v199);
    uint64_t v159 = v192;
    ((void (*)(char *, char *, unint64_t))v158)(v192, v57, v157);
    uint64_t v160 = sub_1A96317D0();
    os_log_type_t v161 = sub_1A9632220();
    int v162 = v161;
    if (os_log_type_enabled(v160, v161))
    {
      uint64_t v163 = swift_slowAlloc();
      uint64_t v211 = swift_slowAlloc();
      uint64_t v216 = v211;
      *(_DWORD *)uint64_t v163 = 136315650;
      uint64_t v208 = v163 + 4;
      LODWORD(v210) = v162;
      sub_1A962E350();
      sub_1A961B500((unint64_t *)&qword_1EB6DC720, MEMORY[0x1E4F27928]);
      uint64_t v164 = sub_1A96327B0();
      uint64_t v165 = v53;
      uint64_t v166 = v156;
      unint64_t v168 = v167;
      uint64_t v209 = v160;
      ((void (*)(char *, uint64_t))v206)(v165, v58);
      uint64_t v214 = sub_1A945C1DC(v164, v168, &v216);
      sub_1A9632350();
      swift_bridgeObjectRelease();
      uint64_t v169 = v58;
      uint64_t v208 = v202 + 8;
      ((void (*)(char *, unint64_t))v197)(v166, v157);
      *(_WORD *)(v163 + 12) = 2080;
      uint64_t v170 = v192;
      sub_1A962E340();
      uint64_t v171 = sub_1A96327B0();
      unint64_t v173 = v172;
      ((void (*)(char *, uint64_t))v206)(v165, v169);
      uint64_t v214 = sub_1A945C1DC(v171, v173, &v216);
      sub_1A9632350();
      swift_bridgeObjectRelease();
      uint64_t v174 = v197;
      ((void (*)(char *, unint64_t))v197)(v170, v157);
      *(_WORD *)(v163 + 22) = 2080;
      uint64_t v214 = v198;
      LOBYTE(v215) = v201;
      uint64_t v175 = WeatherInterpolationOptions.Stride.description.getter();
      uint64_t v214 = sub_1A945C1DC(v175, v176, &v216);
      sub_1A9632350();
      swift_bridgeObjectRelease();
      uint64_t v177 = v209;
      _os_log_impl(&dword_1A9410000, v209, (os_log_type_t)v210, "Failed to interpolate for dateInterval.start: %s, dateInterval.end: %s, stride: %s", (uint8_t *)v163, 0x20u);
      uint64_t v178 = v211;
      swift_arrayDestroy();
      MEMORY[0x1AD0F7300](v178, -1, -1);
      MEMORY[0x1AD0F7300](v163, -1, -1);

      ((void (*)(char *, uint64_t))v206)(v212, v203);
      ((void (*)(char *, unint64_t))v174)(v205, v157);
    }
    else
    {

      v182 = v197;
      ((void (*)(char *, unint64_t))v197)(v159, v157);
      ((void (*)(char *, unint64_t))v182)(v156, v157);
      ((void (*)(char *, uint64_t))v206)(v212, v58);
      ((void (*)(char *, unint64_t))v182)(v57, v157);
    }
    return 0;
  }
  (*((void (**)(char *, char *, uint64_t))v36 + 4))(v49, v52, v35);
  if (qword_1EB6DE388 != -1) {
    swift_once();
  }
  uint64_t v85 = sub_1A96317F0();
  uint64_t v86 = __swift_project_value_buffer(v85, (uint64_t)qword_1EB6EB630);
  uint64_t v206 = (char *)*((void *)v36 + 2);
  ((void (*)(char *, char *, uint64_t))v206)(v46, v49, v35);
  uint64_t v212 = (char *)v86;
  uint64_t v87 = sub_1A96317D0();
  os_log_type_t v88 = sub_1A9632230();
  BOOL v89 = os_log_type_enabled(v87, v88);
  uint64_t v213 = v36;
  if (v89)
  {
    uint64_t v90 = swift_slowAlloc();
    uint64_t v205 = v49;
    uint64_t v91 = v35;
    uint64_t v92 = v90;
    uint64_t v93 = swift_slowAlloc();
    uint64_t v216 = v93;
    *(_DWORD *)uint64_t v92 = 141558531;
    uint64_t v214 = 1752392040;
    sub_1A9632350();
    *(_WORD *)(v92 + 12) = 2081;
    uint64_t v214 = *(void *)&a5;
    double v215 = a6;
    type metadata accessor for CLLocationCoordinate2D(0);
    uint64_t v94 = sub_1A9631DC0();
    uint64_t v214 = sub_1A945C1DC(v94, v95, &v216);
    sub_1A9632350();
    swift_bridgeObjectRelease();
    *(_WORD *)(v92 + 22) = 2080;
    sub_1A961B500((unint64_t *)&qword_1EB6DC720, MEMORY[0x1E4F27928]);
    uint64_t v96 = sub_1A96327B0();
    uint64_t v214 = sub_1A945C1DC(v96, v97, &v216);
    sub_1A9632350();
    swift_bridgeObjectRelease();
    uint64_t v98 = (void (*)(char *, uint64_t))*((void *)v213 + 1);
    v98(v46, v91);
    _os_log_impl(&dword_1A9410000, v87, v88, "Attempting to interpolate current weather; location=%{private,mask.hash}s, date: %s",
      (uint8_t *)v92,
      0x20u);
    swift_arrayDestroy();
    MEMORY[0x1AD0F7300](v93, -1, -1);
    uint64_t v35 = v91;
    uint64_t v49 = v205;
    MEMORY[0x1AD0F7300](v92, -1, -1);
  }
  else
  {
    uint64_t v98 = (void (*)(char *, uint64_t))*((void *)v36 + 1);
    v98(v46, v35);
  }

  unint64_t v110 = v197;
  uint64_t v111 = (uint64_t)v209[3].isa;
  Class v112 = v209[4].isa;
  __swift_project_boxed_opaque_existential_1(v209, v111);
  os_log_t v113 = v196;
  (*((void (**)(uint64_t, char *, uint64_t, uint64_t, Class, double, double))v112 + 1))(v210, v49, v211, v111, v112, a5, a6);
  if (__swift_getEnumTagSinglePayload((uint64_t)v113, 1, v208) == 1)
  {
    sub_1A944C480((uint64_t)v113, &qword_1EB6DDC38);
    ((void (*)(double *, char *, uint64_t))v206)(v110, v49, v35);
    uint64_t v114 = sub_1A96317D0();
    os_log_type_t v115 = sub_1A9632220();
    if (os_log_type_enabled(v114, v115))
    {
      uint64_t v116 = (uint8_t *)swift_slowAlloc();
      uint64_t v117 = swift_slowAlloc();
      uint64_t v212 = (char *)v98;
      uint64_t v118 = v110;
      uint64_t v119 = v117;
      uint64_t v214 = v117;
      *(_DWORD *)uint64_t v116 = 136315138;
      sub_1A961B500((unint64_t *)&qword_1EB6DC720, MEMORY[0x1E4F27928]);
      uint64_t v120 = sub_1A96327B0();
      uint64_t v216 = sub_1A945C1DC(v120, v121, &v214);
      sub_1A9632350();
      swift_bridgeObjectRelease();
      uint64_t v122 = (void (*)(char *, uint64_t))v212;
      ((void (*)(double *, uint64_t))v212)(v118, v35);
      _os_log_impl(&dword_1A9410000, v114, v115, "Failed to interpolate for date: %s", v116, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1AD0F7300](v119, -1, -1);
      MEMORY[0x1AD0F7300](v116, -1, -1);

      v122(v49, v35);
    }
    else
    {

      v98((char *)v110, v35);
      v98(v49, v35);
    }
    return 0;
  }
  sub_1A9449580((uint64_t)v113, v198);
  uint64_t v123 = v191;
  ((void (*)(char *, char *, uint64_t))v206)(v191, v49, v35);
  uint64_t v124 = sub_1A96317D0();
  os_log_type_t v125 = sub_1A9632230();
  if (os_log_type_enabled(v124, v125))
  {
    uint64_t v126 = (uint8_t *)swift_slowAlloc();
    uint64_t v127 = swift_slowAlloc();
    uint64_t v212 = (char *)v98;
    uint64_t v128 = v123;
    uint64_t v129 = v127;
    uint64_t v214 = v127;
    *(_DWORD *)uint64_t v126 = 136315138;
    sub_1A961B500((unint64_t *)&qword_1EB6DC720, MEMORY[0x1E4F27928]);
    uint64_t v130 = sub_1A96327B0();
    uint64_t v216 = sub_1A945C1DC(v130, v131, &v214);
    sub_1A9632350();
    swift_bridgeObjectRelease();
    os_log_type_t v132 = v128;
    uint64_t v98 = (void (*)(char *, uint64_t))v212;
    ((void (*)(char *, uint64_t))v212)(v132, v35);
    _os_log_impl(&dword_1A9410000, v124, v125, "Successfuly interpolated for date: %s", v126, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1AD0F7300](v129, -1, -1);
    MEMORY[0x1AD0F7300](v126, -1, -1);
  }
  else
  {
    v98(v123, v35);
  }

  __swift_instantiateConcreteTypeFromMangledName(&qword_1E97EA900);
  unint64_t v181 = (*(unsigned __int8 *)(v207 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v207 + 80);
  uint64_t v103 = swift_allocObject();
  *(_OWORD *)(v103 + 16) = xmmword_1A96357F0;
  sub_1A9449580(v198, v103 + v181);
  v98(v49, v35);
  return v103;
}

void sub_1A95EF5E0()
{
  OUTLINED_FUNCTION_7_15();
  uint64_t v67 = v3;
  uint64_t v68 = v0;
  uint64_t v5 = v4;
  OUTLINED_FUNCTION_27_0();
  uint64_t v6 = sub_1A96317C0();
  OUTLINED_FUNCTION_1();
  uint64_t v8 = v7;
  MEMORY[0x1F4188790](v9);
  OUTLINED_FUNCTION_38_0(v10, v64);
  uint64_t v11 = *(int *)(type metadata accessor for WeatherRequestOptions() + 64);
  if (*((unsigned char *)&v5->isa + v11))
  {
    if (qword_1EB6DE388 != -1) {
      swift_once();
    }
    uint64_t v21 = sub_1A96317F0();
    uint64_t v13 = (void *)OUTLINED_FUNCTION_57_0(v21, (uint64_t)qword_1EB6EB630);
    os_log_type_t v22 = sub_1A9632230();
    if (OUTLINED_FUNCTION_89_2(v22))
    {
      OUTLINED_FUNCTION_43();
      uint64_t v69 = OUTLINED_FUNCTION_18_1();
      uint64_t v70 = 1752392040;
      OUTLINED_FUNCTION_50_3(7.2225e-34);
      OUTLINED_FUNCTION_69_1();
      uint64_t v23 = OUTLINED_FUNCTION_111_0();
      uint64_t v25 = sub_1A945C1DC(v23, v24, &v69);
      OUTLINED_FUNCTION_68_0(v25);
      swift_bridgeObjectRelease();
      uint64_t v20 = "Attempting to read weather data from cache (policy allows expired data); location=%{private,mask.hash}s";
      goto LABEL_10;
    }
  }
  else
  {
    if (qword_1EB6DE388 != -1) {
      swift_once();
    }
    uint64_t v12 = sub_1A96317F0();
    uint64_t v13 = (void *)OUTLINED_FUNCTION_57_0(v12, (uint64_t)qword_1EB6EB630);
    os_log_type_t v14 = sub_1A9632230();
    if (OUTLINED_FUNCTION_89_2(v14))
    {
      OUTLINED_FUNCTION_43();
      uint64_t v69 = OUTLINED_FUNCTION_18_1();
      uint64_t v70 = 1752392040;
      OUTLINED_FUNCTION_50_3(7.2225e-34);
      OUTLINED_FUNCTION_69_1();
      uint64_t v15 = OUTLINED_FUNCTION_111_0();
      uint64_t v17 = sub_1A945C1DC(v15, v16, &v69);
      OUTLINED_FUNCTION_68_0(v17);
      swift_bridgeObjectRelease();
      uint64_t v20 = "Attempting to read weather data from cache (policy disallows expired data); location=%{private,mask.hash}s";
LABEL_10:
      OUTLINED_FUNCTION_93_1(&dword_1A9410000, v18, v19, v20);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_3_1();
      OUTLINED_FUNCTION_3_1();
    }
  }

  if ((*((unsigned char *)&v5->isa + v11) & 8) != 0)
  {
    if (qword_1EB6DE388 != -1) {
      swift_once();
    }
    uint64_t v44 = sub_1A96317F0();
    uint64_t v45 = OUTLINED_FUNCTION_57_0(v44, (uint64_t)qword_1EB6EB630);
    os_log_type_t v46 = sub_1A9632230();
    if (os_log_type_enabled(v45, v46))
    {
      uint64_t v47 = OUTLINED_FUNCTION_43();
      uint64_t v48 = OUTLINED_FUNCTION_18_1();
      *(_DWORD *)uint64_t v47 = 141558275;
      uint64_t v69 = v48;
      uint64_t v70 = 1752392040;
      sub_1A9632350();
      *(_WORD *)(v47 + 12) = 2081;
      uint64_t v70 = *(void *)&v2;
      unint64_t v71 = *(void *)&v1;
      type metadata accessor for CLLocationCoordinate2D(0);
      uint64_t v49 = sub_1A9631DC0();
      uint64_t v70 = sub_1A945C1DC(v49, v50, &v69);
      sub_1A9632350();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_152_0(&dword_1A9410000, v51, v52, "Skipped checking cache due to policy ... falling back to server; location=%{private,mask.hash}s");
      swift_arrayDestroy();
      OUTLINED_FUNCTION_3_1();
      OUTLINED_FUNCTION_3_1();
    }

    goto LABEL_28;
  }
  uint64_t v65 = v8;
  id v26 = *(id *)(v68 + 80);
  sub_1A96317B0();
  uint64_t v70 = 0;
  unint64_t v71 = 0xE000000000000000;
  sub_1A9632180();
  sub_1A9631EA0();
  sub_1A9632180();
  uint64_t v27 = v70;
  unint64_t v28 = v71;
  sub_1A96322C0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6DE280);
  uint64_t v29 = swift_allocObject();
  *(_OWORD *)(v29 + 16) = xmmword_1A96357F0;
  *(void *)(v29 + 56) = MEMORY[0x1E4FBB1A0];
  unint64_t v30 = sub_1A9459E7C();
  *(void *)(v29 + 64) = v30;
  *(void *)(v29 + 32) = v27;
  *(void *)(v29 + 40) = v28;
  sub_1A9631510();
  OUTLINED_FUNCTION_144_0();
  sub_1A96317A0();
  swift_bridgeObjectRelease();
  uint64_t v31 = sub_1A95E50C8(v67, v5, v2, v1);
  uint64_t v33 = v32;
  sub_1A96322B0();
  uint64_t v34 = swift_allocObject();
  *(_OWORD *)(v34 + 16) = xmmword_1A96357F0;
  *(void *)(v34 + 56) = MEMORY[0x1E4FBB1A0];
  *(void *)(v34 + 64) = v30;
  *(void *)(v34 + 32) = v27;
  *(void *)(v34 + 40) = v28;
  OUTLINED_FUNCTION_144_0();
  sub_1A96317A0();
  swift_bridgeObjectRelease();
  if ((sub_1A95E4390(v31, v33) & 1) == 0)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (qword_1EB6DE388 != -1) {
      swift_once();
    }
    uint64_t v53 = sub_1A96317F0();
    uint64_t v54 = (void *)OUTLINED_FUNCTION_57_0(v53, (uint64_t)qword_1EB6EB630);
    os_log_type_t v55 = sub_1A9632230();
    if (OUTLINED_FUNCTION_89_2(v55))
    {
      OUTLINED_FUNCTION_43();
      uint64_t v69 = OUTLINED_FUNCTION_18_1();
      uint64_t v70 = 1752392040;
      OUTLINED_FUNCTION_50_3(7.2225e-34);
      OUTLINED_FUNCTION_69_1();
      uint64_t v56 = OUTLINED_FUNCTION_111_0();
      uint64_t v58 = sub_1A945C1DC(v56, v57, &v69);
      OUTLINED_FUNCTION_68_0(v58);
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_93_1(&dword_1A9410000, v59, v60, "Weather data NOT found in cache and not successfully interpolated ... falling back to server; location=%{private,mask.hash}s");
      swift_arrayDestroy();
      OUTLINED_FUNCTION_3_1();
      OUTLINED_FUNCTION_3_1();
    }

    (*(void (**)(uint64_t, uint64_t))(v65 + 8))(v66, v6);
LABEL_28:
    double v61 = OUTLINED_FUNCTION_19_0();
    sub_1A95EFE04(v62, (uint64_t)v5, v61, v63);
    goto LABEL_29;
  }
  if (qword_1EB6DE388 != -1) {
    swift_once();
  }
  uint64_t v35 = sub_1A96317F0();
  uint64_t v36 = (void *)OUTLINED_FUNCTION_57_0(v35, (uint64_t)qword_1EB6EB630);
  os_log_type_t v37 = sub_1A9632230();
  if (OUTLINED_FUNCTION_88(v37))
  {
    uint64_t v38 = OUTLINED_FUNCTION_43();
    uint64_t v69 = OUTLINED_FUNCTION_18_1();
    uint64_t v70 = 1752392040;
    *(_DWORD *)uint64_t v38 = 141558275;
    sub_1A9632350();
    *(_WORD *)(v38 + 12) = 2081;
    uint64_t v70 = *(void *)&v2;
    unint64_t v71 = *(void *)&v1;
    type metadata accessor for CLLocationCoordinate2D(0);
    uint64_t v39 = sub_1A9631DC0();
    uint64_t v70 = sub_1A945C1DC(v39, v40, &v69);
    sub_1A9632350();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_154_0(&dword_1A9410000, v41, v42, "Weather data found in cache; returning cached data; location=%{private,mask.hash}s");
    swift_arrayDestroy();
    OUTLINED_FUNCTION_3_1();
    OUTLINED_FUNCTION_3_1();
  }

  type metadata accessor for WeatherModel();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6DC8E8);
  sub_1A942AB08();
  uint64_t v43 = sub_1A9631CB0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v70 = v43;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6DC8F0);
  OUTLINED_FUNCTION_10_0();
  sub_1A9631710();
  (*(void (**)(uint64_t, uint64_t))(v65 + 8))(v66, v6);
LABEL_29:
  OUTLINED_FUNCTION_47();
}

uint64_t sub_1A95EFE04(uint64_t a1, uint64_t a2, double a3, double a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = *v4;
  uint64_t v11 = type metadata accessor for WeatherRequestOptions();
  uint64_t v29 = *(void *)(v11 - 8);
  uint64_t v12 = *(void *)(v29 + 64);
  MEMORY[0x1F4188790](v11 - 8);
  uint64_t v13 = (char *)v28 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1EB6DE388 != -1) {
    swift_once();
  }
  uint64_t v14 = sub_1A96317F0();
  __swift_project_value_buffer(v14, (uint64_t)qword_1EB6EB630);
  uint64_t v15 = sub_1A96317D0();
  os_log_type_t v16 = sub_1A9632230();
  if (os_log_type_enabled(v15, v16))
  {
    uint64_t v17 = swift_slowAlloc();
    v28[1] = v10;
    uint64_t v18 = v17;
    uint64_t v19 = swift_slowAlloc();
    uint64_t v32 = v19;
    *(_DWORD *)uint64_t v18 = 141558275;
    uint64_t v30 = 1752392040;
    sub_1A9632350();
    *(_WORD *)(v18 + 12) = 2081;
    v28[0] = v5;
    uint64_t v30 = *(void *)&a3;
    double v31 = a4;
    type metadata accessor for CLLocationCoordinate2D(0);
    uint64_t v20 = sub_1A9631DC0();
    uint64_t v30 = sub_1A945C1DC(v20, v21, &v32);
    uint64_t v13 = (char *)v28 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v5 = (void *)v28[0];
    sub_1A9632350();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1A9410000, v15, v16, "Fetching from WDS; location=%{private,mask.hash}s", (uint8_t *)v18, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x1AD0F7300](v19, -1, -1);
    MEMORY[0x1AD0F7300](v18, -1, -1);
  }

  MEMORY[0x1F4188790](v22);
  v28[-6] = a2;
  v28[-5] = v5;
  *(double *)&v28[-4] = a3;
  *(double *)&v28[-3] = a4;
  v28[-2] = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6DDBE0);
  sub_1A9631770();
  sub_1A961B118(a2, (uint64_t)v13);
  unint64_t v23 = (*(unsigned __int8 *)(v29 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v29 + 80);
  uint64_t v24 = swift_allocObject();
  *(double *)(v24 + 16) = a3;
  *(double *)(v24 + 24) = a4;
  sub_1A9449580((uint64_t)v13, v24 + v23);
  *(void *)(v24 + ((v12 + v23 + 7) & 0xFFFFFFFFFFFFFFF8)) = a1;
  sub_1A9631510();
  uint64_t v25 = (void *)sub_1A9631660();
  uint64_t v26 = sub_1A96316D0();
  swift_release();
  swift_release();

  return v26;
}

uint64_t sub_1A95F01D8(uint64_t a1, NSObject *a2)
{
  OUTLINED_FUNCTION_27_0();
  uint64_t v6 = v5;
  uint64_t v7 = type metadata accessor for WeatherRequestOptions();
  if (*((unsigned char *)&a2->isa + *(int *)(v7 + 64)))
  {
    if (qword_1EB6DE388 != -1) {
      swift_once();
    }
    uint64_t v15 = sub_1A96317F0();
    uint64_t v9 = OUTLINED_FUNCTION_57_0(v15, (uint64_t)qword_1EB6EB630);
    os_log_type_t v10 = sub_1A9632230();
    if (os_log_type_enabled(v9, v10))
    {
      uint64_t v11 = (uint8_t *)OUTLINED_FUNCTION_43();
      v53[0] = OUTLINED_FUNCTION_18_1();
      *(_DWORD *)uint64_t v11 = 141558275;
      OUTLINED_FUNCTION_18_11();
      OUTLINED_FUNCTION_118_0();
      uint64_t v16 = sub_1A9631DC0();
      sub_1A945C1DC(v16, v17, v53);
      OUTLINED_FUNCTION_76_2();
      swift_bridgeObjectRelease();
      uint64_t v14 = "About to attempt retrieving cached data (policy allows expired data); location=%{private,mask.hash}s";
      goto LABEL_10;
    }
  }
  else
  {
    if (qword_1EB6DE388 != -1) {
      swift_once();
    }
    uint64_t v8 = sub_1A96317F0();
    uint64_t v9 = OUTLINED_FUNCTION_57_0(v8, (uint64_t)qword_1EB6EB630);
    os_log_type_t v10 = sub_1A9632230();
    if (os_log_type_enabled(v9, v10))
    {
      uint64_t v11 = (uint8_t *)OUTLINED_FUNCTION_43();
      v53[0] = OUTLINED_FUNCTION_18_1();
      *(_DWORD *)uint64_t v11 = 141558275;
      OUTLINED_FUNCTION_18_11();
      OUTLINED_FUNCTION_118_0();
      uint64_t v12 = sub_1A9631DC0();
      sub_1A945C1DC(v12, v13, v53);
      OUTLINED_FUNCTION_76_2();
      swift_bridgeObjectRelease();
      uint64_t v14 = "About to attempt retrieving cached data (policy disallows expired data); location=%{private,mask.hash}s";
LABEL_10:
      _os_log_impl(&dword_1A9410000, v9, v10, v14, v11, 0x16u);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_3_1();
      OUTLINED_FUNCTION_3_1();
    }
  }

  if (*((unsigned char *)&a2->isa + *(int *)(v7 + 76)) == 1)
  {
    OUTLINED_FUNCTION_19_0();
    uint64_t v18 = sub_1A95F0878();
    double v51 = 0.0;
    *(double *)&uint64_t v20 = COERCE_DOUBLE(sub_1A95F0910(v18, v19, (uint64_t *)&v51));
    double v22 = v21;
    char v24 = v23;
    swift_bridgeObjectRelease();
    if (v24)
    {
      if (qword_1EB6DE388 != -1) {
        swift_once();
      }
      uint64_t v44 = sub_1A96317F0();
      uint64_t v45 = OUTLINED_FUNCTION_57_0(v44, (uint64_t)qword_1EB6EB630);
      os_log_type_t v46 = sub_1A9632220();
      if (os_log_type_enabled(v45, v46))
      {
        uint64_t v47 = OUTLINED_FUNCTION_43();
        v53[0] = OUTLINED_FUNCTION_18_1();
        *(_DWORD *)uint64_t v47 = 141558275;
        OUTLINED_FUNCTION_18_11();
        *(_WORD *)(v47 + 12) = 2081;
        double v51 = v3;
        double v52 = v2;
        type metadata accessor for CLLocationCoordinate2D(0);
        uint64_t v48 = sub_1A9631DC0();
        double v51 = COERCE_DOUBLE(sub_1A945C1DC(v48, v49, v53));
        sub_1A9632350();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_1A9410000, v45, v46, "Couldn't retrieve cached data requiring marine data because no cached marine location could be found; location"
          "=%{private,mask.hash}s",
          (uint8_t *)v47,
          0x16u);
        swift_arrayDestroy();
        OUTLINED_FUNCTION_3_1();
        OUTLINED_FUNCTION_3_1();
      }

      return 0;
    }
    double v3 = *(double *)&v20;
    double v2 = v22;
    if (qword_1EB6DE388 != -1) {
      swift_once();
    }
    uint64_t v25 = sub_1A96317F0();
    uint64_t v26 = (void *)OUTLINED_FUNCTION_57_0(v25, (uint64_t)qword_1EB6EB630);
    os_log_type_t v27 = sub_1A9632230();
    if (OUTLINED_FUNCTION_89_2(v27))
    {
      uint64_t v28 = OUTLINED_FUNCTION_43();
      v53[0] = OUTLINED_FUNCTION_18_1();
      *(_DWORD *)uint64_t v28 = 141558275;
      OUTLINED_FUNCTION_18_11();
      *(_WORD *)(v28 + 12) = 2081;
      double v51 = *(double *)&v20;
      double v52 = v22;
      type metadata accessor for CLLocationCoordinate2D(0);
      uint64_t v29 = sub_1A9631DC0();
      double v51 = COERCE_DOUBLE(sub_1A945C1DC(v29, v30, v53));
      sub_1A9632350();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_93_1(&dword_1A9410000, v31, v32, "Using cached marine location for cache request; location=%{private,mask.hash}s");
      swift_arrayDestroy();
      OUTLINED_FUNCTION_3_1();
      OUTLINED_FUNCTION_3_1();
    }
  }
  uint64_t v33 = sub_1A95E50C8(v6, a2, v3, v2);
  if ((sub_1A95E4390(v33, v34) & 1) == 0)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return 0;
  }
  if (qword_1EB6DE388 != -1) {
    swift_once();
  }
  uint64_t v35 = sub_1A96317F0();
  uint64_t v36 = (void *)OUTLINED_FUNCTION_57_0(v35, (uint64_t)qword_1EB6EB630);
  os_log_type_t v37 = sub_1A9632230();
  if (OUTLINED_FUNCTION_88(v37))
  {
    uint64_t v38 = OUTLINED_FUNCTION_43();
    v53[0] = OUTLINED_FUNCTION_18_1();
    *(_DWORD *)uint64_t v38 = 141558275;
    OUTLINED_FUNCTION_18_11();
    *(_WORD *)(v38 + 12) = 2081;
    double v51 = v3;
    double v52 = v2;
    type metadata accessor for CLLocationCoordinate2D(0);
    uint64_t v39 = sub_1A9631DC0();
    double v51 = COERCE_DOUBLE(sub_1A945C1DC(v39, v40, v53));
    sub_1A9632350();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_154_0(&dword_1A9410000, v41, v42, "Successfully retrieved cached data; location=%{private,mask.hash}s");
    swift_arrayDestroy();
    OUTLINED_FUNCTION_3_1();
    OUTLINED_FUNCTION_3_1();
  }

  type metadata accessor for WeatherModel();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6DC8E8);
  sub_1A942AB08();
  uint64_t v43 = sub_1A9631CB0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v43;
}

uint64_t sub_1A95F0878()
{
  uint64_t v1 = CLLocationCoordinate2D.cacheKey.getter();
  sub_1A9631EA0();
  sub_1A9631510();
  sub_1A9631EA0();
  swift_bridgeObjectRelease();
  sub_1A9631EA0();
  sub_1A95CC4C0();
  sub_1A9631EA0();
  swift_bridgeObjectRelease();
  return v1;
}

uint64_t sub_1A95F0910(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6DDBD8);
  MEMORY[0x1F4188790](v8 - 8);
  os_log_type_t v10 = (char *)&v44 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_1A9631860();
  uint64_t v48 = *(void *)(v11 - 8);
  uint64_t v49 = v11;
  MEMORY[0x1F4188790](v11);
  unint64_t v13 = (char *)&v44 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v47 = *a3;
  if (qword_1EB6DE388 != -1) {
    swift_once();
  }
  uint64_t v50 = a1;
  uint64_t v14 = sub_1A96317F0();
  __swift_project_value_buffer(v14, (uint64_t)qword_1EB6EB630);
  swift_bridgeObjectRetain_n();
  uint64_t v15 = sub_1A96317D0();
  os_log_type_t v16 = sub_1A9632230();
  if (os_log_type_enabled(v15, v16))
  {
    uint64_t v17 = swift_slowAlloc();
    uint64_t v46 = v4;
    uint64_t v18 = v17;
    uint64_t v19 = swift_slowAlloc();
    uint64_t v57 = v19;
    *(_DWORD *)uint64_t v18 = 141558275;
    uint64_t v52 = 1752392040;
    sub_1A9632350();
    *(_WORD *)(v18 + 12) = 2081;
    sub_1A9631510();
    uint64_t v52 = sub_1A945C1DC(v50, a2, &v57);
    sub_1A9632350();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_1A9410000, v15, v16, "Attempting to retrieve marineLocation from cache; identifier=%{private,mask.hash}s",
      (uint8_t *)v18,
      0x16u);
    swift_arrayDestroy();
    MEMORY[0x1AD0F7300](v19, -1, -1);
    MEMORY[0x1AD0F7300](v18, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  uint64_t v20 = sub_1A95E44F0();
  if (!v20)
  {
    char v24 = sub_1A96317D0();
    os_log_type_t v25 = sub_1A9632230();
    if (os_log_type_enabled(v24, v25))
    {
      uint64_t v26 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v26 = 0;
      _os_log_impl(&dword_1A9410000, v24, v25, "Cannot retrieve cached marineLocation due to missing store", v26, 2u);
      MEMORY[0x1AD0F7300](v26, -1, -1);
    }

    return 0;
  }
  uint64_t v21 = v20;
  sub_1A9631960();
  uint64_t v60 = MEMORY[0x1E4FBB1A0];
  uint64_t v61 = MEMORY[0x1E4FAA778];
  uint64_t v22 = v50;
  uint64_t v57 = v50;
  unint64_t v58 = a2;
  sub_1A9631510();
  sub_1A96318F0();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v57);
  uint64_t v23 = sub_1A96319F0();
  __swift_storeEnumTagSinglePayload((uint64_t)v10, 1, 1, v23);
  sub_1A9631930();
  uint64_t v46 = v21;
  swift_release();
  sub_1A944C480((uint64_t)v10, &qword_1EB6DDBD8);
  (*(void (**)(char *, uint64_t))(v48 + 8))(v13, v49);
  uint64_t v27 = v52;
  if (!v52)
  {
    swift_bridgeObjectRetain_n();
    uint64_t v39 = sub_1A96317D0();
    os_log_type_t v40 = sub_1A9632230();
    if (os_log_type_enabled(v39, v40))
    {
      uint64_t v41 = swift_slowAlloc();
      uint64_t v42 = v22;
      uint64_t v43 = swift_slowAlloc();
      uint64_t v57 = v43;
      *(_DWORD *)uint64_t v41 = 141558275;
      uint64_t v52 = 1752392040;
      sub_1A9632350();
      *(_WORD *)(v41 + 12) = 2081;
      sub_1A9631510();
      uint64_t v52 = sub_1A945C1DC(v42, a2, &v57);
      sub_1A9632350();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_1A9410000, v39, v40, "Could not find marineLocation data in cache; identifier=%{private,mask.hash}s",
        (uint8_t *)v41,
        0x16u);
      swift_arrayDestroy();
      MEMORY[0x1AD0F7300](v43, -1, -1);
      MEMORY[0x1AD0F7300](v41, -1, -1);
      swift_release();

      return 0;
    }

    swift_bridgeObjectRelease_n();
    swift_release();
    return 0;
  }
  unint64_t v28 = v53;
  uint64_t v29 = v54;
  uint64_t v31 = v55;
  uint64_t v30 = v56;
  uint64_t v57 = v52;
  unint64_t v58 = v53;
  uint64_t v59 = v54;
  uint64_t v60 = v55;
  uint64_t v61 = v56;
  uint64_t v32 = sub_1A95DD424(v47);
  if (v33)
  {
    sub_1A948A95C(v27);
    swift_release();
  }
  else
  {
    unint64_t v44 = v28;
    uint64_t v45 = v27;
    uint64_t v47 = v29;
    uint64_t v48 = v31;
    uint64_t v49 = v30;
    swift_bridgeObjectRetain_n();
    uint64_t v34 = sub_1A96317D0();
    os_log_type_t v35 = sub_1A9632230();
    if (os_log_type_enabled(v34, v35))
    {
      uint64_t v36 = swift_slowAlloc();
      uint64_t v37 = swift_slowAlloc();
      uint64_t v52 = v37;
      *(_DWORD *)uint64_t v36 = 141558275;
      uint64_t v51 = 1752392040;
      sub_1A9632350();
      *(_WORD *)(v36 + 12) = 2081;
      sub_1A9631510();
      uint64_t v51 = sub_1A945C1DC(v50, a2, &v52);
      sub_1A9632350();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_1A9410000, v34, v35, "Successfully retrieved marineLocation from cache; identifier=%{private,mask.hash}s",
        (uint8_t *)v36,
        0x16u);
      swift_arrayDestroy();
      MEMORY[0x1AD0F7300](v37, -1, -1);
      MEMORY[0x1AD0F7300](v36, -1, -1);
      sub_1A948A95C(v45);
      swift_release();
    }
    else
    {
      swift_bridgeObjectRelease_n();
      sub_1A948A95C(v45);

      swift_release();
    }
  }
  return v32;
}

void sub_1A95F1228()
{
  OUTLINED_FUNCTION_7_15();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_27_0();
  uint64_t v5 = v4;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6DE3A0);
  uint64_t v7 = OUTLINED_FUNCTION_2_0(v6);
  MEMORY[0x1F4188790](v7);
  OUTLINED_FUNCTION_6_0();
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6DDBD8);
  uint64_t v9 = OUTLINED_FUNCTION_2_0(v8);
  MEMORY[0x1F4188790](v9);
  OUTLINED_FUNCTION_123();
  sub_1A9631860();
  OUTLINED_FUNCTION_1();
  MEMORY[0x1F4188790](v10);
  OUTLINED_FUNCTION_2_33();
  if (!sub_1A95E44F0())
  {
    uint64_t v14 = sub_1A962E810();
    uint64_t v15 = v5;
LABEL_4:
    uint64_t v16 = 1;
LABEL_5:
    __swift_storeEnumTagSinglePayload(v15, v16, 1, v14);
    OUTLINED_FUNCTION_47();
    return;
  }
  uint64_t v25 = v5;
  sub_1A9631960();
  OUTLINED_FUNCTION_19_0();
  uint64_t v11 = CLLocationCoordinate2D.cacheKey.getter();
  v26[3] = MEMORY[0x1E4FBB1A0];
  v26[4] = MEMORY[0x1E4FAA778];
  v26[0] = v11;
  v26[1] = v12;
  OUTLINED_FUNCTION_156_0();
  sub_1A96318F0();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v26);
  uint64_t v13 = sub_1A96319F0();
  __swift_storeEnumTagSinglePayload(v1, 1, 1, v13);
  uint64_t v17 = sub_1A9631940();
  swift_release();
  sub_1A944C480(v1, &qword_1EB6DDBD8);
  uint64_t v18 = OUTLINED_FUNCTION_104_0();
  v19(v18);
  uint64_t v20 = sub_1A95DE9F4(v3);
  uint64_t v21 = sub_1A95F1500(v20);
  sub_1A9631510();
  uint64_t v22 = sub_1A95CBD5C(v17, v21);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (!v22)
  {
    swift_release();
    uint64_t v14 = sub_1A962E810();
    uint64_t v15 = v25;
    goto LABEL_4;
  }
  sub_1A96319A0();
  uint64_t v23 = sub_1A962E810();
  if (__swift_getEnumTagSinglePayload(v0, 1, v23) != 1)
  {
    sub_1A961A254(v22);
    swift_release();
    OUTLINED_FUNCTION_4_8();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v24 + 32))(v25, v0, v23);
    uint64_t v15 = v25;
    uint64_t v16 = 0;
    uint64_t v14 = v23;
    goto LABEL_5;
  }
  __break(1u);
}

uint64_t sub_1A95F1500(uint64_t a1)
{
  uint64_t v2 = sub_1A9632190();
  uint64_t v10 = v2;
  uint64_t v3 = *(void *)(a1 + 16);
  if (v3)
  {
    uint64_t v4 = (uint64_t *)(a1 + 40);
    do
    {
      uint64_t v5 = *(v4 - 1);
      uint64_t v6 = *v4;
      sub_1A9631510();
      sub_1A9618C68(&v9, v5, v6);
      swift_bridgeObjectRelease();
      v4 += 2;
      --v3;
    }
    while (v3);
    swift_bridgeObjectRelease();
    return v10;
  }
  else
  {
    uint64_t v7 = v2;
    swift_bridgeObjectRelease();
  }
  return v7;
}

uint64_t sub_1A95F15B4(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a1 + 16) < *(void *)(a2 + 16)) {
    return 0;
  }
  uint64_t v3 = a2;
  uint64_t v4 = a1;
  uint64_t v31 = a2 + 56;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  if (-v5 < 64) {
    uint64_t v6 = ~(-1 << -(char)v5);
  }
  else {
    uint64_t v6 = -1;
  }
  unint64_t v7 = v6 & *(void *)(a2 + 56);
  int64_t v30 = (unint64_t)(63 - v5) >> 6;
  uint64_t v32 = a1 + 56;
  uint64_t result = sub_1A9631510();
  for (int64_t i = 0; ; int64_t i = v12)
  {
    if (v7)
    {
      unint64_t v10 = __clz(__rbit64(v7));
      v7 &= v7 - 1;
      unint64_t v11 = v10 | (i << 6);
      int64_t v12 = i;
      goto LABEL_23;
    }
    int64_t v13 = i + 1;
    if (__OFADD__(i, 1))
    {
      __break(1u);
      goto LABEL_44;
    }
    if (v13 >= v30) {
      goto LABEL_40;
    }
    unint64_t v14 = *(void *)(v31 + 8 * v13);
    int64_t v12 = i + 1;
    if (!v14)
    {
      int64_t v12 = i + 2;
      if (i + 2 >= v30) {
        goto LABEL_40;
      }
      unint64_t v14 = *(void *)(v31 + 8 * v12);
      if (!v14)
      {
        int64_t v12 = i + 3;
        if (i + 3 >= v30) {
          goto LABEL_40;
        }
        unint64_t v14 = *(void *)(v31 + 8 * v12);
        if (!v14) {
          break;
        }
      }
    }
LABEL_22:
    unint64_t v7 = (v14 - 1) & v14;
    unint64_t v11 = __clz(__rbit64(v14)) + (v12 << 6);
LABEL_23:
    if (!*(void *)(v4 + 16))
    {
      uint64_t v2 = 0;
      goto LABEL_41;
    }
    uint64_t v16 = v3;
    uint64_t v17 = (uint64_t *)(*(void *)(v3 + 48) + 16 * v11);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    sub_1A9632900();
    sub_1A9631510();
    sub_1A9631E60();
    uint64_t v20 = sub_1A9632930();
    uint64_t v21 = v4;
    uint64_t v22 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v23 = v20 & ~v22;
    if (((*(void *)(v32 + ((v23 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v23) & 1) == 0) {
      goto LABEL_38;
    }
    uint64_t v24 = *(void *)(v21 + 48);
    uint64_t v25 = (void *)(v24 + 16 * v23);
    BOOL v26 = *v25 == v19 && v25[1] == v18;
    if (!v26 && (sub_1A96327D0() & 1) == 0)
    {
      uint64_t v27 = ~v22;
      while (1)
      {
        unint64_t v23 = (v23 + 1) & v27;
        if (((*(void *)(v32 + ((v23 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v23) & 1) == 0) {
          break;
        }
        unint64_t v28 = (void *)(v24 + 16 * v23);
        BOOL v29 = *v28 == v19 && v28[1] == v18;
        if (v29 || (sub_1A96327D0() & 1) != 0) {
          goto LABEL_37;
        }
      }
LABEL_38:
      swift_bridgeObjectRelease();
      uint64_t v2 = 0;
LABEL_41:
      sub_1A961A2A0();
      return v2;
    }
LABEL_37:
    uint64_t result = swift_bridgeObjectRelease();
    uint64_t v3 = v16;
    uint64_t v4 = v21;
  }
  int64_t v15 = i + 4;
  if (i + 4 >= v30)
  {
LABEL_40:
    uint64_t v2 = 1;
    goto LABEL_41;
  }
  unint64_t v14 = *(void *)(v31 + 8 * v15);
  if (v14)
  {
    int64_t v12 = i + 4;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v12 = v15 + 1;
    if (__OFADD__(v15, 1)) {
      break;
    }
    if (v12 >= v30) {
      goto LABEL_40;
    }
    unint64_t v14 = *(void *)(v31 + 8 * v12);
    ++v15;
    if (v14) {
      goto LABEL_22;
    }
  }
LABEL_44:
  __break(1u);
  return result;
}

uint64_t sub_1A95F189C(uint64_t a1)
{
  if (*(unsigned char *)(a1 + *(int *)(type metadata accessor for WeatherRequestOptions() + 76)) == 1
    && (v1 = sub_1A95F0878(), v6 = 0, sub_1A95F0910(v1, v2, &v6), char v4 = v3, swift_bridgeObjectRelease(), (v4 & 1) != 0))
  {
    return sub_1A94DE68C();
  }
  else
  {
    return sub_1A94DE6C0();
  }
}

void sub_1A95F1994(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, double a5, double a6)
{
  uint64_t v79 = a4;
  uint64_t v78 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6DC8E8);
  uint64_t v76 = *(void *)(v78 - 8);
  MEMORY[0x1F4188790](v78);
  int64_t v12 = (id *)((char *)&v66 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6DD628);
  MEMORY[0x1F4188790](v13 - 8);
  int64_t v15 = (char *)&v66 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v16);
  uint64_t v18 = (char *)&v66 - v17;
  uint64_t v19 = sub_1A962E810();
  uint64_t v20 = *(void *)(v19 - 8);
  MEMORY[0x1F4188790](v19);
  uint64_t v22 = (char *)&v66 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = *a1;
  sub_1A95F21D4(v23, a3);
  sub_1A962E7F0();
  uint64_t v72 = a2;
  sub_1A95F4BEC(v79, (uint64_t)v22);
  uint64_t v24 = v22;
  uint64_t v25 = v12;
  (*(void (**)(char *, uint64_t))(v20 + 8))(v24, v19);
  uint64_t v26 = *(void *)(v23 + 64);
  uint64_t v71 = v23 + 64;
  uint64_t v27 = 1 << *(unsigned char *)(v23 + 32);
  uint64_t v28 = -1;
  if (v27 < 64) {
    uint64_t v28 = ~(-1 << v27);
  }
  unint64_t v29 = v28 & v26;
  int64_t v74 = (unint64_t)(v27 + 63) >> 6;
  uint64_t v67 = v74 - 1;
  sub_1A9631510();
  uint64_t v30 = 0;
  unint64_t v77 = (void *)v23;
  uint64_t v68 = v23 + 104;
  *(void *)&long long v31 = 136446723;
  long long v73 = v31;
  uint64_t v69 = MEMORY[0x1E4FBC840] + 8;
  uint64_t v75 = v12;
  while (1)
  {
    if (v29)
    {
      unint64_t v32 = __clz(__rbit64(v29));
      v29 &= v29 - 1;
      uint64_t v79 = v30;
      unint64_t v33 = v32 | (v30 << 6);
      goto LABEL_6;
    }
    uint64_t v37 = v30 + 1;
    if (__OFADD__(v30, 1)) {
      break;
    }
    if (v37 >= v74)
    {
      uint64_t v39 = v30;
    }
    else
    {
      unint64_t v38 = *(void *)(v71 + 8 * v37);
      if (v38) {
        goto LABEL_10;
      }
      uint64_t v39 = v30 + 1;
      if (v30 + 2 < v74)
      {
        unint64_t v38 = *(void *)(v71 + 8 * (v30 + 2));
        if (v38)
        {
          uint64_t v37 = v30 + 2;
          goto LABEL_10;
        }
        uint64_t v39 = v30 + 2;
        if (v30 + 3 < v74)
        {
          unint64_t v38 = *(void *)(v71 + 8 * (v30 + 3));
          if (v38)
          {
            uint64_t v37 = v30 + 3;
LABEL_10:
            unint64_t v29 = (v38 - 1) & v38;
            unint64_t v33 = __clz(__rbit64(v38)) + (v37 << 6);
            uint64_t v79 = v37;
LABEL_6:
            uint64_t v34 = v77[7];
            *int64_t v15 = *(unsigned char *)(v77[6] + v33);
            uint64_t v35 = v34 + *(void *)(v76 + 72) * v33;
            uint64_t v36 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB6DC958);
            sub_1A944A348(v35, (uint64_t)&v15[*(int *)(v36 + 48)], &qword_1EB6DC8E8);
            __swift_storeEnumTagSinglePayload((uint64_t)v15, 0, 1, v36);
            goto LABEL_13;
          }
          uint64_t v37 = v30 + 4;
          uint64_t v39 = v30 + 3;
          if (v30 + 4 < v74)
          {
            unint64_t v38 = *(void *)(v71 + 8 * v37);
            if (v38) {
              goto LABEL_10;
            }
            while (v30 + 5 < v74)
            {
              unint64_t v38 = *(void *)(v68 + 8 * v30++);
              if (v38)
              {
                uint64_t v37 = v30 + 4;
                goto LABEL_10;
              }
            }
            uint64_t v39 = v67;
          }
        }
      }
    }
    uint64_t v40 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB6DC958);
    __swift_storeEnumTagSinglePayload((uint64_t)v15, 1, 1, v40);
    unint64_t v29 = 0;
    uint64_t v79 = v39;
LABEL_13:
    sub_1A944A754((uint64_t)v15, (uint64_t)v18, &qword_1EB6DD628);
    uint64_t v41 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB6DC958);
    if (__swift_getEnumTagSinglePayload((uint64_t)v18, 1, v41) == 1)
    {
      uint64_t v65 = v77;
      swift_release();
      id v80 = v65;
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6DC8F0);
      swift_allocObject();
      sub_1A9631510();
      sub_1A9631710();
      return;
    }
    char v42 = *v18;
    sub_1A944A754((uint64_t)&v18[*(int *)(v41 + 48)], (uint64_t)v25, &qword_1EB6DC8E8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      id v80 = *v25;
      id v43 = v80;
      id v44 = v80;
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6DDB00);
      if (swift_dynamicCast())
      {
        int v45 = v82;
        if (qword_1EB6DE388 != -1) {
          swift_once();
        }
        uint64_t v46 = sub_1A96317F0();
        __swift_project_value_buffer(v46, (uint64_t)qword_1EB6EB630);
        uint64_t v47 = sub_1A96317D0();
        os_log_type_t v48 = sub_1A9632220();
        if (os_log_type_enabled(v47, v48))
        {
          uint64_t v49 = swift_slowAlloc();
          uint64_t v50 = swift_slowAlloc();
          uint64_t v82 = v50;
          *(_DWORD *)uint64_t v49 = v73;
          LOBYTE(v80) = v45;
          uint64_t v51 = sub_1A9631DC0();
          int v70 = v45;
          *(void *)(v49 + 4) = sub_1A945C1DC(v51, v52, &v82);
          swift_bridgeObjectRelease();
          *(_WORD *)(v49 + 12) = 2160;
          *(void *)(v49 + 14) = 1752392040;
          *(_WORD *)(v49 + 22) = 2081;
          id v80 = *(id *)&a5;
          double v81 = a6;
          type metadata accessor for CLLocationCoordinate2D(0);
          uint64_t v53 = sub_1A9631DC0();
          *(void *)(v49 + 24) = sub_1A945C1DC(v53, v54, &v82);
          LOBYTE(v45) = v70;
          swift_bridgeObjectRelease();
          _os_log_impl(&dword_1A9410000, v47, v48, "Invalid weather data from WDS; clearing cache; error=%{public}s; location=%{private,mask.hash}s",
            (uint8_t *)v49,
            0x20u);
          swift_arrayDestroy();
          MEMORY[0x1AD0F7300](v50, -1, -1);
          MEMORY[0x1AD0F7300](v49, -1, -1);
        }

        uint64_t v25 = v75;
        LOBYTE(v80) = v45;
        sub_1A95F5024(&v80);
      }

      uint64_t v30 = v79;
    }
    else
    {
      if (qword_1EB6DE388 != -1) {
        swift_once();
      }
      uint64_t v55 = sub_1A96317F0();
      __swift_project_value_buffer(v55, (uint64_t)qword_1EB6EB630);
      uint64_t v56 = sub_1A96317D0();
      os_log_type_t v57 = sub_1A9632230();
      if (os_log_type_enabled(v56, v57))
      {
        uint64_t v58 = swift_slowAlloc();
        uint64_t v59 = swift_slowAlloc();
        uint64_t v82 = v59;
        *(_DWORD *)uint64_t v58 = v73;
        LOBYTE(v80) = v42;
        uint64_t v60 = sub_1A9631DC0();
        *(void *)(v58 + 4) = sub_1A945C1DC(v60, v61, &v82);
        swift_bridgeObjectRelease();
        *(_WORD *)(v58 + 12) = 2160;
        *(void *)(v58 + 14) = 1752392040;
        *(_WORD *)(v58 + 22) = 2081;
        id v80 = *(id *)&a5;
        double v81 = a6;
        type metadata accessor for CLLocationCoordinate2D(0);
        uint64_t v62 = sub_1A9631DC0();
        *(void *)(v58 + 24) = sub_1A945C1DC(v62, v63, &v82);
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_1A9410000, v56, v57, "Weather data fetched from WDS and stored in cache; product=%{public}s; location=%{private,mask.hash}s",
          (uint8_t *)v58,
          0x20u);
        swift_arrayDestroy();
        uint64_t v64 = v59;
        uint64_t v25 = v75;
        MEMORY[0x1AD0F7300](v64, -1, -1);
        MEMORY[0x1AD0F7300](v58, -1, -1);
      }

      sub_1A961B3A4((uint64_t)v25, (void (*)(void))type metadata accessor for WeatherModel);
      uint64_t v30 = v79;
    }
  }
  __break(1u);
}

uint64_t sub_1A95F21D4(uint64_t a1, uint64_t a2)
{
  uint64_t v310 = type metadata accessor for WeatherComparisons();
  MEMORY[0x1F4188790](v310);
  v278 = (uint64_t *)((char *)&v234 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6DDA28);
  MEMORY[0x1F4188790](v5 - 8);
  uint64_t v309 = (uint64_t)&v234 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v7);
  uint64_t v308 = (uint64_t)&v234 - v8;
  uint64_t v307 = type metadata accessor for WeatherChange();
  MEMORY[0x1F4188790](v307);
  uint64_t v277 = (uint64_t)&v234 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6DDE70);
  MEMORY[0x1F4188790](v10 - 8);
  uint64_t v318 = (uint64_t)&v234 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v12);
  uint64_t v306 = (uint64_t)&v234 - v13;
  uint64_t v305 = type metadata accessor for WeatherAlerts();
  MEMORY[0x1F4188790](v305);
  uint64_t v276 = (uint64_t)&v234 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6DD620);
  MEMORY[0x1F4188790](v15 - 8);
  uint64_t v304 = (uint64_t)&v234 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v17);
  uint64_t v303 = (uint64_t)&v234 - v18;
  uint64_t v302 = type metadata accessor for TideEvents();
  MEMORY[0x1F4188790](v302);
  uint64_t v301 = (uint64_t)&v234 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6DD1D8);
  MEMORY[0x1F4188790](v20 - 8);
  uint64_t v317 = (uint64_t)&v234 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v22);
  uint64_t v314 = (uint64_t)&v234 - v23;
  uint64_t v300 = type metadata accessor for News();
  MEMORY[0x1F4188790](v300);
  uint64_t v275 = (uint64_t)&v234 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6DD938);
  MEMORY[0x1F4188790](v25 - 8);
  uint64_t v299 = (uint64_t)&v234 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v27);
  uint64_t v298 = (uint64_t)&v234 - v28;
  uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6DE3A0);
  MEMORY[0x1F4188790](v29 - 8);
  uint64_t v261 = (uint64_t)&v234 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v31);
  uint64_t v267 = (uint64_t)&v234 - v32;
  MEMORY[0x1F4188790](v33);
  uint64_t v260 = (uint64_t)&v234 - v34;
  MEMORY[0x1F4188790](v35);
  uint64_t v266 = (uint64_t)&v234 - v36;
  uint64_t v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6DD120);
  MEMORY[0x1F4188790](v37 - 8);
  uint64_t v274 = (uint64_t)&v234 - ((v38 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v39);
  uint64_t v273 = (uint64_t)&v234 - v40;
  uint64_t v312 = type metadata accessor for WeatherRequestMarineHourlyRelativeRange();
  MEMORY[0x1F4188790](v312);
  uint64_t v259 = (uint64_t)&v234 - ((v41 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v42);
  v282 = (uint64_t *)((char *)&v234 - v43);
  MEMORY[0x1F4188790](v44);
  uint64_t v258 = (uint64_t)&v234 - v45;
  MEMORY[0x1F4188790](v46);
  uint64_t v281 = (uint64_t *)((char *)&v234 - v47);
  uint64_t v297 = type metadata accessor for MarineForecast();
  MEMORY[0x1F4188790](v297);
  uint64_t v296 = (uint64_t)&v234 - ((v48 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v49 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6DD258);
  MEMORY[0x1F4188790](v49 - 8);
  uint64_t v295 = (uint64_t)&v234 - ((v50 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v51);
  uint64_t v313 = (uint64_t)&v234 - v52;
  uint64_t v53 = type metadata accessor for LocationInfo();
  MEMORY[0x1F4188790](v53 - 8);
  uint64_t v294 = (uint64_t)&v234 - ((v54 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v55 = type metadata accessor for PeriodicForecasts();
  MEMORY[0x1F4188790](v55 - 8);
  uint64_t v293 = (uint64_t)&v234 - ((v56 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t HourForecast = type metadata accessor for NextHourForecast();
  MEMORY[0x1F4188790](HourForecast);
  uint64_t v272 = (uint64_t)&v234 - ((v57 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v58 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6DE0F8);
  MEMORY[0x1F4188790](v58 - 8);
  uint64_t v291 = (uint64_t)&v234 - ((v59 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v60);
  uint64_t v290 = (uint64_t)&v234 - v61;
  uint64_t v62 = type metadata accessor for HourlyForecast();
  MEMORY[0x1F4188790](v62 - 8);
  uint64_t v289 = (uint64_t)&v234 - ((v63 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v64 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6DE298);
  MEMORY[0x1F4188790](v64 - 8);
  uint64_t v240 = (uint64_t)&v234 - ((v65 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v66);
  uint64_t v243 = (char *)&v234 - v67;
  MEMORY[0x1F4188790](v68);
  uint64_t v252 = (char *)&v234 - v69;
  uint64_t v70 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6DD388);
  MEMORY[0x1F4188790](v70 - 8);
  uint64_t v242 = (char *)&v234 - ((v71 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v72);
  uint64_t v241 = (char *)&v234 - v73;
  MEMORY[0x1F4188790](v74);
  uint64_t v257 = (char *)&v234 - v75;
  uint64_t v283 = sub_1A962EA40();
  uint64_t v263 = *(void (***)(char *, uint64_t))(v283 - 8);
  MEMORY[0x1F4188790](v283);
  uint64_t v256 = (char *)&v234 - ((v76 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v77);
  uint64_t v255 = (char *)&v234 - v78;
  MEMORY[0x1F4188790](v79);
  int v251 = (char *)&v234 - v80;
  MEMORY[0x1F4188790](v81);
  os_log_t v83 = (char *)&v234 - v82;
  uint64_t v264 = sub_1A962EA00();
  uint64_t v262 = *(void (***)(char *, uint64_t, uint64_t))(v264 - 8);
  MEMORY[0x1F4188790](v264);
  uint64_t v254 = (char *)&v234 - ((v84 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v85);
  uint64_t v253 = (char *)&v234 - v86;
  MEMORY[0x1F4188790](v87);
  BOOL v89 = (char *)&v234 - v88;
  uint64_t v311 = sub_1A962E810();
  uint64_t v90 = *(void *)(v311 - 8);
  MEMORY[0x1F4188790](v311);
  uint64_t v239 = (char *)&v234 - ((v91 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v92);
  uint64_t v280 = (char *)&v234 - v93;
  MEMORY[0x1F4188790](v94);
  uint64_t v238 = (char *)&v234 - v95;
  MEMORY[0x1F4188790](v96);
  uint64_t v279 = (char *)&v234 - v97;
  MEMORY[0x1F4188790](v98);
  uint64_t v250 = (char *)&v234 - v99;
  uint64_t v100 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6DD0F0);
  MEMORY[0x1F4188790](v100 - 8);
  uint64_t v271 = (uint64_t)&v234 - ((v101 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v270 = type metadata accessor for WeatherRequestDailyRelativeRange();
  MEMORY[0x1F4188790](v270);
  uint64_t v265 = (uint64_t *)((char *)&v234 - ((v102 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v103 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6DDB08);
  MEMORY[0x1F4188790](v103 - 8);
  uint64_t v288 = (uint64_t)&v234 - ((v104 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v287 = sub_1A962E360();
  uint64_t v105 = *(void *)(v287 - 8);
  MEMORY[0x1F4188790](v287);
  uint64_t v269 = (char *)&v234 - ((v106 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v107 = type metadata accessor for DailyForecast();
  MEMORY[0x1F4188790](v107 - 8);
  uint64_t v316 = (uint64_t)&v234 - ((v108 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v109 = type metadata accessor for CurrentWeather();
  MEMORY[0x1F4188790](v109 - 8);
  uint64_t v286 = (uint64_t)&v234 - ((v110 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v285 = type metadata accessor for AirQuality();
  MEMORY[0x1F4188790](v285);
  uint64_t v268 = (uint64_t)&v234 - ((v111 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v112 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6DE088);
  MEMORY[0x1F4188790](v112 - 8);
  uint64_t v284 = (uint64_t)&v234 - ((v113 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v114);
  uint64_t v320 = (char *)&v234 - v115;
  uint64_t v323 = type metadata accessor for WeatherModel();
  uint64_t v116 = *(void *)(v323 - 8);
  MEMORY[0x1F4188790](v323);
  uint64_t v118 = (uint64_t *)((char *)&v234 - ((v117 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v319 = a2;
  uint64_t v315 = v2;
  uint64_t v322 = sub_1A95F0878();
  unint64_t v324 = v119;
  uint64_t v120 = sub_1A9631510();
  uint64_t v121 = sub_1A95CBFC8(v120);
  swift_bridgeObjectRelease();
  uint64_t v122 = *(void *)(v121 + 16);
  if (v122)
  {
    unint64_t v123 = (*(unsigned __int8 *)(v116 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v116 + 80);
    uint64_t v244 = v121;
    uint64_t v124 = v121 + v123;
    uint64_t v321 = *(void *)(v116 + 72);
    uint64_t v249 = (void (**)(char *, uint64_t, uint64_t))(v90 + 32);
    v247 = (void (**)(char *, uint64_t, uint64_t))(v263 + 4);
    uint64_t v235 = v262 + 4;
    uint64_t v234 = (void (**)(char *, uint64_t, uint64_t))(v263 + 2);
    v246 = (void (**)(uint64_t, uint64_t))(v263 + 1);
    uint64_t v245 = (void (**)(uint64_t, uint64_t))(v262 + 1);
    uint64_t v263 = (void (**)(char *, uint64_t))(v90 + 8);
    uint64_t v262 = (void (**)(char *, uint64_t, uint64_t))(v105 + 32);
    uint64_t v248 = (void (**)(char *, uint64_t))(v105 + 8);
    uint64_t v237 = v83;
    int v236 = v89;
    uint64_t v125 = (uint64_t)v320;
    do
    {
      sub_1A961B118(v124, (uint64_t)v118);
      switch(swift_getEnumCaseMultiPayload())
      {
        case 1u:
          uint64_t v127 = v286;
          sub_1A9449580((uint64_t)v118, v286);
          sub_1A95F6D1C(v127, v322, v324);
          uint64_t v128 = type metadata accessor for CurrentWeather;
          goto LABEL_17;
        case 2u:
          sub_1A9449580((uint64_t)v118, v316);
          uint64_t v129 = type metadata accessor for WeatherRequestOptions();
          uint64_t v130 = v319;
          uint64_t v131 = v288;
          sub_1A944A348(v319 + *(int *)(v129 + 28), v288, &qword_1EB6DDB08);
          uint64_t v132 = v287;
          if (__swift_getEnumTagSinglePayload(v131, 1, v287) == 1)
          {
            sub_1A944C480(v131, &qword_1EB6DDB08);
            uint64_t v133 = v271;
            sub_1A944A348(v130 + *(int *)(v129 + 36), v271, &qword_1EB6DD0F0);
            if (__swift_getEnumTagSinglePayload(v133, 1, v270) == 1)
            {
              sub_1A944C480(v133, &qword_1EB6DD0F0);
              unint64_t v134 = v324;
              sub_1A9631510();
              uint64_t v135 = v322;
            }
            else
            {
              sub_1A9449580(v133, (uint64_t)v265);
              uint64_t v328 = v322;
              unint64_t v329 = v324;
              sub_1A9631510();
              sub_1A9631EA0();
              uint64_t v180 = (uint64_t)v257;
              sub_1A962EA20();
              uint64_t v181 = v283;
              if (__swift_getEnumTagSinglePayload(v180, 1, v283) == 1)
              {
                __break(1u);
LABEL_95:
                __break(1u);
LABEL_96:
                __break(1u);
                JUMPOUT(0x1A95F4BB4);
              }
              uint64_t v182 = (uint64_t)v237;
              (*v247)(v237, v180, v181);
              uint64_t v183 = (uint64_t)v252;
              if (qword_1EB6DC730 != -1) {
                swift_once();
              }
              sub_1A9416F78(v183);
              uint64_t v184 = v264;
              if (__swift_getEnumTagSinglePayload(v183, 1, v264) == 1)
              {
                sub_1A944C480(v183, &qword_1EB6DE298);
                uint64_t v185 = (uint64_t)v236;
                sub_1A962E9D0();
                (*v234)(v251, v182, v181);
                sub_1A962E9E0();
                sub_1A94248FC(v185, v182);
              }
              else
              {
                uint64_t v185 = (uint64_t)v236;
                (*v235)(v236, v183, v184);
              }
              int v220 = v265;
              (*v246)(v182, v181);
              uint64_t v221 = v250;
              sub_1A962E980();
              (*v245)(v185, v184);
              sub_1A962E7B0();
              sub_1A9632170();
              (*v263)(v221, v311);
              uint64_t v325 = *v220;
              uint64_t v326 = sub_1A96327B0();
              uint64_t v327 = v222;
              sub_1A9631EA0();
              sub_1A9631EA0();
              swift_bridgeObjectRelease();
              sub_1A9631EA0();
              uint64_t v325 = v220[1];
              sub_1A96327B0();
              sub_1A9631EA0();
              swift_bridgeObjectRelease();
              sub_1A9631EA0();
              swift_bridgeObjectRelease();
              uint64_t v135 = v328;
              unint64_t v134 = v329;
              sub_1A961B3A4((uint64_t)v220, (void (*)(void))type metadata accessor for WeatherRequestDailyRelativeRange);
            }
          }
          else
          {
            os_log_type_t v161 = v269;
            (*v262)(v269, v131, v132);
            swift_getKeyPath();
            uint64_t v328 = v322;
            unint64_t v329 = v324;
            sub_1A9631510();
            sub_1A9631EA0();
            sub_1A9618A60();
            sub_1A9631EA0();
            swift_release();
            swift_bridgeObjectRelease();
            uint64_t v135 = v328;
            unint64_t v134 = v329;
            (*v248)(v161, v132);
          }
          uint64_t v125 = (uint64_t)v320;
          uint64_t v223 = v316;
          sub_1A95F77D8(v316, v135, v134);
          swift_bridgeObjectRelease();
          sub_1A961B3A4(v223, (void (*)(void))type metadata accessor for DailyForecast);
          break;
        case 3u:
          uint64_t v136 = v289;
          sub_1A9449580((uint64_t)v118, v289);
          uint64_t v137 = sub_1A95F7E9C(v319, v322, v324);
          sub_1A95F8524(v136, v137, v138);
          swift_bridgeObjectRelease();
          int v139 = type metadata accessor for HourlyForecast;
          uint64_t v140 = v136;
          uint64_t v125 = (uint64_t)v320;
          goto LABEL_18;
        case 4u:
          unint64_t v141 = v324;
          uint64_t v142 = v290;
          sub_1A944A754((uint64_t)v118, v290, &qword_1EB6DE0F8);
          uint64_t v143 = v291;
          sub_1A944A348(v142, v291, &qword_1EB6DE0F8);
          if (__swift_getEnumTagSinglePayload(v143, 1, HourForecast) == 1)
          {
            sub_1A944C480(v143, &qword_1EB6DE0F8);
            sub_1A95F92B0(v322, v141);
          }
          else
          {
            uint64_t v162 = v272;
            sub_1A9449580(v143, v272);
            sub_1A95F8BE8(v162, v322, v141);
            sub_1A961B3A4(v162, (void (*)(void))type metadata accessor for NextHourForecast);
          }
          uint64_t v163 = v142;
          uint64_t v164 = &qword_1EB6DE0F8;
          goto LABEL_88;
        case 5u:
          uint64_t v127 = v293;
          sub_1A9449580((uint64_t)v118, v293);
          sub_1A95F9938(v127, v322, v324);
          uint64_t v128 = type metadata accessor for PeriodicForecasts;
          goto LABEL_17;
        case 6u:
          if (*v118)
          {
            uint64_t v328 = *v118;
            sub_1A95FF908(&v328, v322, v324);
            swift_bridgeObjectRelease();
          }
          else
          {
            sub_1A960034C(v322, v324);
          }
          break;
        case 7u:
          uint64_t v127 = v294;
          sub_1A9449580((uint64_t)v118, v294);
          sub_1A95F9FFC(v127, v322, v324);
          uint64_t v128 = type metadata accessor for LocationInfo;
LABEL_17:
          int v139 = v128;
          uint64_t v140 = v127;
LABEL_18:
          sub_1A961B3A4(v140, (void (*)(void))v139);
          break;
        case 8u:
          uint64_t v144 = v313;
          sub_1A944A754((uint64_t)v118, v313, &qword_1EB6DD258);
          uint64_t v145 = v295;
          sub_1A944A348(v144, v295, &qword_1EB6DD258);
          if (__swift_getEnumTagSinglePayload(v145, 1, v297) == 1)
          {
            sub_1A944C480(v145, &qword_1EB6DD258);
            sub_1A95FADC8(v322, v324);
            uint64_t v146 = v144;
          }
          else
          {
            sub_1A9449580(v145, v296);
            uint64_t v165 = type metadata accessor for WeatherRequestOptions();
            uint64_t v166 = v273;
            sub_1A944A348(v319 + *(int *)(v165 + 48), v273, &qword_1EB6DD120);
            if (__swift_getEnumTagSinglePayload(v166, 1, v312) == 1)
            {
              sub_1A944C480(v166, &qword_1EB6DD120);
              unint64_t v167 = v324;
              sub_1A9631510();
              uint64_t v168 = v322;
            }
            else
            {
              uint64_t v186 = v166;
              uint64_t v187 = (uint64_t)v281;
              sub_1A9449580(v186, (uint64_t)v281);
              uint64_t v188 = v266;
              uint64_t v189 = v311;
              __swift_storeEnumTagSinglePayload(v266, 1, 1, v311);
              uint64_t v328 = 0x2C656E6972616DLL;
              unint64_t v329 = 0xE700000000000000;
              uint64_t v190 = v188;
              uint64_t v191 = v260;
              sub_1A944A348(v190, v260, &qword_1EB6DE3A0);
              uint64_t v192 = v187;
              uint64_t v193 = v258;
              sub_1A961B118(v192, v258);
              if (__swift_getEnumTagSinglePayload(v191, 1, v189) == 1)
              {
                (*v249)(v279, v193 + *(int *)(v312 + 28), v189);
                sub_1A944C480(v191, &qword_1EB6DE3A0);
              }
              else
              {
                sub_1A961B3A4(v193, (void (*)(void))type metadata accessor for WeatherRequestMarineHourlyRelativeRange);
                (*v249)(v279, v191, v189);
              }
              uint64_t v201 = v283;
              uint64_t v202 = (uint64_t)v255;
              uint64_t v203 = (uint64_t)v253;
              if (v281[2])
              {
                sub_1A94A8AB4();
                uint64_t v204 = v311;
                uint64_t v205 = v263;
              }
              else
              {
                uint64_t v211 = (uint64_t)v241;
                sub_1A962EA20();
                int EnumTagSinglePayload = __swift_getEnumTagSinglePayload(v211, 1, v201);
                uint64_t v213 = (uint64_t)v243;
                if (EnumTagSinglePayload == 1) {
                  goto LABEL_95;
                }
                (*v247)((char *)v202, v211, v201);
                if (qword_1EB6DC730 != -1) {
                  swift_once();
                }
                sub_1A9416F78(v213);
                uint64_t v214 = v264;
                if (__swift_getEnumTagSinglePayload(v213, 1, v264) == 1)
                {
                  sub_1A944C480(v213, &qword_1EB6DE298);
                  sub_1A962E9D0();
                  uint64_t v215 = v214;
                  (*v234)(v251, v202, v201);
                  sub_1A962E9E0();
                  sub_1A94248FC(v203, v202);
                }
                else
                {
                  (*v235)((char *)v203, v213, v214);
                  uint64_t v215 = v214;
                }
                (*v246)(v202, v201);
                uint64_t v224 = v238;
                sub_1A962E980();
                (*v245)(v203, v215);
                sub_1A962E7B0();
                sub_1A9632170();
                uint64_t v205 = v263;
                uint64_t v225 = v224;
                uint64_t v204 = v311;
                (*v263)(v225, v311);
              }
              uint64_t v226 = (uint64_t)v281;
              uint64_t v325 = *v281;
              uint64_t v326 = sub_1A96327B0();
              uint64_t v327 = v227;
              sub_1A9631EA0();
              sub_1A9631EA0();
              swift_bridgeObjectRelease();
              sub_1A9631EA0();
              uint64_t v325 = *(void *)(v226 + 8);
              sub_1A96327B0();
              sub_1A9631EA0();
              swift_bridgeObjectRelease();
              (*v205)(v279, v204);
              sub_1A9631EA0();
              swift_bridgeObjectRelease();
              uint64_t v328 = v322;
              unint64_t v329 = v324;
              sub_1A9631510();
              sub_1A9631EA0();
              sub_1A9631EA0();
              swift_bridgeObjectRelease();
              uint64_t v168 = v328;
              unint64_t v167 = v329;
              sub_1A944C480(v266, &qword_1EB6DE3A0);
              sub_1A961B3A4(v226, (void (*)(void))type metadata accessor for WeatherRequestMarineHourlyRelativeRange);
              uint64_t v125 = (uint64_t)v320;
            }
            uint64_t v228 = v296;
            sub_1A95FA6C0(v296, v168, v167);
            swift_bridgeObjectRelease();
            sub_1A961B3A4(v228, (void (*)(void))type metadata accessor for MarineForecast);
            uint64_t v146 = v313;
          }
          sub_1A944C480(v146, &qword_1EB6DD258);
          break;
        case 9u:
          uint64_t v147 = v298;
          uint64_t v148 = &qword_1EB6DD938;
          sub_1A944A754((uint64_t)v118, v298, &qword_1EB6DD938);
          uint64_t v149 = v299;
          sub_1A944A348(v147, v299, &qword_1EB6DD938);
          if (__swift_getEnumTagSinglePayload(v149, 1, v300) == 1)
          {
            sub_1A944C480(v149, &qword_1EB6DD938);
            sub_1A95FBB18(v322, v324);
          }
          else
          {
            uint64_t v169 = v275;
            sub_1A9449580(v149, v275);
            sub_1A95FB450(v169, v322, v324);
            sub_1A961B3A4(v169, (void (*)(void))type metadata accessor for News);
          }
          uint64_t v158 = v147;
          goto LABEL_40;
        case 0xAu:
          uint64_t v150 = v303;
          uint64_t v151 = &qword_1EB6DD620;
          sub_1A944A754((uint64_t)v118, v303, &qword_1EB6DD620);
          uint64_t v152 = v304;
          sub_1A944A348(v150, v304, &qword_1EB6DD620);
          if (__swift_getEnumTagSinglePayload(v152, 1, v305) == 1)
          {
            sub_1A944C480(v152, &qword_1EB6DD620);
            sub_1A95FD5F8(v322, v324);
            goto LABEL_47;
          }
          uint64_t v170 = v276;
          sub_1A9449580(v152, v276);
          sub_1A95FCF30(v170, v322, v324);
          uint64_t v171 = type metadata accessor for WeatherAlerts;
          uint64_t v172 = v170;
          goto LABEL_46;
        case 0xBu:
          uint64_t v153 = v306;
          sub_1A944A754((uint64_t)v118, v306, &qword_1EB6DDE70);
          uint64_t v154 = v318;
          sub_1A944A348(v153, v318, &qword_1EB6DDE70);
          if (__swift_getEnumTagSinglePayload(v154, 1, v307) == 1)
          {
            sub_1A944C480(v318, &qword_1EB6DDE70);
            sub_1A95FE348(v322, v324);
          }
          else
          {
            uint64_t v173 = v277;
            sub_1A9449580(v318, v277);
            sub_1A95FDC80(v173, v322, v324);
            sub_1A961B3A4(v173, (void (*)(void))type metadata accessor for WeatherChange);
          }
          sub_1A944C480(v153, &qword_1EB6DDE70);
          uint64_t v125 = (uint64_t)v320;
          break;
        case 0xCu:
          uint64_t v150 = v308;
          uint64_t v151 = &qword_1EB6DDA28;
          sub_1A944A754((uint64_t)v118, v308, &qword_1EB6DDA28);
          uint64_t v155 = v309;
          sub_1A944A348(v150, v309, &qword_1EB6DDA28);
          if (__swift_getEnumTagSinglePayload(v155, 1, v310) == 1)
          {
            sub_1A944C480(v155, &qword_1EB6DDA28);
            sub_1A95FF280(v322, v324);
          }
          else
          {
            uint64_t v174 = v155;
            uint64_t v175 = v278;
            sub_1A9449580(v174, (uint64_t)v278);
            sub_1A95FE9D0(v175, v322, v324);
            uint64_t v171 = type metadata accessor for WeatherComparisons;
            uint64_t v172 = (uint64_t)v175;
LABEL_46:
            sub_1A961B3A4(v172, (void (*)(void))v171);
          }
LABEL_47:
          sub_1A944C480(v150, v151);
          uint64_t v125 = (uint64_t)v320;
          break;
        case 0xDu:
          uint64_t v156 = v314;
          uint64_t v148 = &qword_1EB6DD1D8;
          sub_1A944A754((uint64_t)v118, v314, &qword_1EB6DD1D8);
          uint64_t v157 = v317;
          sub_1A944A348(v156, v317, &qword_1EB6DD1D8);
          if (__swift_getEnumTagSinglePayload(v157, 1, v302) == 1)
          {
            sub_1A944C480(v317, &qword_1EB6DD1D8);
            sub_1A95FC8A8(v322, v324);
            uint64_t v158 = v156;
LABEL_40:
            uint64_t v160 = v148;
LABEL_41:
            sub_1A944C480(v158, v160);
          }
          else
          {
            sub_1A9449580(v317, v301);
            uint64_t v176 = type metadata accessor for WeatherRequestOptions();
            uint64_t v177 = v274;
            sub_1A944A348(v319 + *(int *)(v176 + 48), v274, &qword_1EB6DD120);
            if (__swift_getEnumTagSinglePayload(v177, 1, v312) == 1)
            {
              sub_1A944C480(v177, &qword_1EB6DD120);
              unint64_t v178 = v324;
              sub_1A9631510();
              uint64_t v179 = v322;
            }
            else
            {
              uint64_t v194 = (uint64_t)v282;
              sub_1A9449580(v177, (uint64_t)v282);
              uint64_t v195 = v267;
              uint64_t v196 = v311;
              __swift_storeEnumTagSinglePayload(v267, 1, 1, v311);
              uint64_t v328 = 0x2C656E6972616DLL;
              unint64_t v329 = 0xE700000000000000;
              uint64_t v197 = v195;
              uint64_t v198 = v261;
              sub_1A944A348(v197, v261, &qword_1EB6DE3A0);
              uint64_t v199 = v194;
              uint64_t v200 = v259;
              sub_1A961B118(v199, v259);
              if (__swift_getEnumTagSinglePayload(v198, 1, v196) == 1)
              {
                (*v249)(v280, v200 + *(int *)(v312 + 28), v196);
                sub_1A944C480(v198, &qword_1EB6DE3A0);
              }
              else
              {
                sub_1A961B3A4(v200, (void (*)(void))type metadata accessor for WeatherRequestMarineHourlyRelativeRange);
                (*v249)(v280, v198, v196);
              }
              uint64_t v206 = v283;
              uint64_t v207 = (uint64_t)v256;
              uint64_t v208 = (uint64_t)v254;
              if (v282[2])
              {
                sub_1A94A8AB4();
                uint64_t v209 = v311;
                uint64_t v210 = v263;
              }
              else
              {
                uint64_t v216 = (uint64_t)v242;
                sub_1A962EA20();
                if (__swift_getEnumTagSinglePayload(v216, 1, v206) == 1) {
                  goto LABEL_96;
                }
                (*v247)((char *)v207, v216, v206);
                if (qword_1EB6DC730 != -1) {
                  swift_once();
                }
                uint64_t v217 = v240;
                sub_1A9416F78(v240);
                uint64_t v218 = v264;
                if (__swift_getEnumTagSinglePayload(v217, 1, v264) == 1)
                {
                  sub_1A944C480(v217, &qword_1EB6DE298);
                  sub_1A962E9D0();
                  (*v234)(v251, v207, v206);
                  uint64_t v219 = v218;
                  sub_1A962E9E0();
                  sub_1A94248FC(v208, v207);
                }
                else
                {
                  (*v235)((char *)v208, v217, v218);
                  uint64_t v219 = v218;
                }
                (*v246)(v207, v206);
                uint64_t v229 = v239;
                sub_1A962E980();
                (*v245)(v208, v219);
                sub_1A962E7B0();
                sub_1A9632170();
                uint64_t v210 = v263;
                uint64_t v209 = v311;
                (*v263)(v229, v311);
              }
              uint64_t v230 = (uint64_t)v282;
              uint64_t v325 = *v282;
              uint64_t v326 = sub_1A96327B0();
              uint64_t v327 = v231;
              sub_1A9631EA0();
              sub_1A9631EA0();
              swift_bridgeObjectRelease();
              sub_1A9631EA0();
              uint64_t v325 = *(void *)(v230 + 8);
              sub_1A96327B0();
              sub_1A9631EA0();
              swift_bridgeObjectRelease();
              (*v210)(v280, v209);
              sub_1A9631EA0();
              swift_bridgeObjectRelease();
              uint64_t v328 = v322;
              unint64_t v329 = v324;
              sub_1A9631510();
              sub_1A9631EA0();
              sub_1A9631EA0();
              swift_bridgeObjectRelease();
              uint64_t v179 = v328;
              unint64_t v178 = v329;
              sub_1A944C480(v267, &qword_1EB6DE3A0);
              sub_1A961B3A4(v230, (void (*)(void))type metadata accessor for WeatherRequestMarineHourlyRelativeRange);
            }
            uint64_t v232 = v301;
            sub_1A95FC1A0(v301, v179, v178);
            swift_bridgeObjectRelease();
            sub_1A961B3A4(v232, (void (*)(void))type metadata accessor for TideEvents);
            uint64_t v163 = v314;
            uint64_t v164 = &qword_1EB6DD1D8;
LABEL_88:
            sub_1A944C480(v163, v164);
            uint64_t v125 = (uint64_t)v320;
          }
          break;
        default:
          sub_1A944A754((uint64_t)v118, v125, &qword_1EB6DE088);
          uint64_t v126 = v284;
          sub_1A944A348(v125, v284, &qword_1EB6DE088);
          if (__swift_getEnumTagSinglePayload(v126, 1, v285) == 1)
          {
            sub_1A944C480(v126, &qword_1EB6DE088);
            sub_1A95F6694(v322, v324);
          }
          else
          {
            uint64_t v159 = v268;
            sub_1A9449580(v126, v268);
            sub_1A95F5FCC(v159, v322, v324);
            sub_1A961B3A4(v159, (void (*)(void))type metadata accessor for AirQuality);
          }
          uint64_t v158 = v125;
          uint64_t v160 = &qword_1EB6DE088;
          goto LABEL_41;
      }
      v124 += v321;
      --v122;
    }
    while (v122);
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_1A95F4BEC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = sub_1A962E810();
  uint64_t v48 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  uint64_t v47 = (char *)v39 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_1A9631860();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  uint64_t v8 = (char *)v39 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v9);
  uint64_t v11 = (char *)v39 - v10;
  MEMORY[0x1F4188790](v12);
  uint64_t v14 = (char *)v39 - v13;
  uint64_t result = sub_1A95E44F0();
  if (result)
  {
    uint64_t v16 = result;
    uint64_t v45 = v3;
    uint64_t v46 = a2;
    uint64_t v17 = CLLocationCoordinate2D.cacheKey.getter();
    uint64_t v42 = v5;
    uint64_t v18 = v17;
    uint64_t v49 = v19;
    uint64_t v20 = sub_1A9632070();
    uint64_t v21 = sub_1A95DE9F4(v20);
    uint64_t v40 = 0;
    swift_bridgeObjectRelease();
    uint64_t v50 = v21;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6DE268);
    sub_1A944C79C();
    uint64_t v22 = sub_1A9631D00();
    uint64_t v23 = v14;
    uint64_t v24 = v6;
    uint64_t v26 = v25;
    swift_bridgeObjectRelease();
    uint64_t v43 = v16;
    uint64_t v27 = v49;
    v39[1] = sub_1A9631980();
    uint64_t v28 = MEMORY[0x1E4FAA778];
    uint64_t v29 = MEMORY[0x1E4FBB1A0];
    uint64_t v53 = MEMORY[0x1E4FBB1A0];
    uint64_t v54 = MEMORY[0x1E4FAA778];
    uint64_t v44 = v18;
    uint64_t v50 = v18;
    uint64_t v51 = v27;
    uint64_t v30 = v42;
    sub_1A9631510();
    sub_1A96318F0();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v50);
    uint64_t v53 = v29;
    uint64_t v54 = v28;
    uint64_t v41 = v22;
    uint64_t v50 = v22;
    uint64_t v31 = v26;
    uint64_t v32 = v24;
    uint64_t v33 = v23;
    uint64_t v51 = v31;
    sub_1A9631510();
    sub_1A96318F0();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v50);
    sub_1A96318E0();
    uint64_t v34 = *(void (**)(char *, uint64_t))(v32 + 8);
    v34(v8, v30);
    v34(v11, v30);
    uint64_t v35 = v40;
    sub_1A96319E0();
    swift_release();
    if (v35) {

    }
    v34(v33, v30);
    sub_1A9631950();
    uint64_t v36 = (uint64_t)v47;
    (*(void (**)(char *, uint64_t, uint64_t))(v48 + 16))(v47, v46, v45);
    uint64_t v50 = sub_1A95A3374(v44, v49, v36, v41, v31);
    uint64_t v51 = v37;
    uint64_t v52 = v38;
    sub_1A9631920();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    return swift_release();
  }
  return result;
}

void sub_1A95F5024(unsigned char *a1)
{
  switch(*a1)
  {
    case 0:
      sub_1A9615D3C();
      break;
    case 1:
      sub_1A9615044();
      break;
    case 2:
      sub_1A96152DC();
      break;
    case 3:
      sub_1A9615574();
      break;
    case 4:
      sub_1A961580C();
      break;
    case 6:
      sub_1A961626C();
      break;
    case 8:
      sub_1A9615FD4();
      break;
    case 9:
      sub_1A9615AA4();
      break;
    case 0xA:
    case 0xB:
      sub_1A961679C();
      break;
    case 0xD:
    case 0xE:
      sub_1A9616A34();
      break;
    case 0xF:
      sub_1A9616504();
      break;
    default:
      if (qword_1EB6DE388 != -1) {
        swift_once();
      }
      uint64_t v1 = sub_1A96317F0();
      __swift_project_value_buffer(v1, (uint64_t)qword_1EB6EB630);
      oslog = sub_1A96317D0();
      os_log_type_t v2 = sub_1A9632230();
      if (os_log_type_enabled(oslog, v2))
      {
        uint64_t v3 = swift_slowAlloc();
        uint64_t v4 = swift_slowAlloc();
        *(_DWORD *)uint64_t v3 = 141558275;
        uint64_t v8 = v4;
        sub_1A9632350();
        *(_WORD *)(v3 + 12) = 2081;
        uint64_t v5 = sub_1A9631DC0();
        sub_1A945C1DC(v5, v6, &v8);
        sub_1A9632350();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_1A9410000, oslog, v2, "Unknown default; skipping clear cache; error=%{private,mask.hash}s",
          (uint8_t *)v3,
          0x16u);
        swift_arrayDestroy();
        MEMORY[0x1AD0F7300](v4, -1, -1);
        MEMORY[0x1AD0F7300](v3, -1, -1);
      }
      else
      {
      }
      break;
  }
}

unint64_t sub_1A95F5418@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = WeatherProduct.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_1A95F5454(uint64_t *a1, uint64_t a2, uint64_t a3, NSObject *a4, uint64_t a5, double a6, double a7)
{
  uint64_t v67 = a4;
  uint64_t v68 = a5;
  uint64_t v65 = a3;
  uint64_t v66 = a2;
  uint64_t v63 = type metadata accessor for InterpolationInputProducts();
  MEMORY[0x1F4188790](v63);
  uint64_t v64 = (uint64_t)&v63 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6DE0F8);
  MEMORY[0x1F4188790](v11 - 8);
  uint64_t v70 = (uint64_t)&v63 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = type metadata accessor for DailyForecast();
  MEMORY[0x1F4188790](v13 - 8);
  uint64_t v69 = (uint64_t)&v63 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = type metadata accessor for HourlyForecast();
  MEMORY[0x1F4188790](v15 - 8);
  uint64_t v72 = (uint64_t)&v63 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = type metadata accessor for WeatherModel();
  MEMORY[0x1F4188790](v17);
  uint64_t v19 = (char *)&v63 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v20);
  uint64_t v71 = (uint64_t)&v63 - v21;
  MEMORY[0x1F4188790](v22);
  uint64_t v24 = (char *)&v63 - v23;
  MEMORY[0x1F4188790](v25);
  uint64_t v73 = (uint64_t)&v63 - v26;
  uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6DD3C8);
  MEMORY[0x1F4188790](v27 - 8);
  uint64_t v29 = (char *)&v63 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v30);
  uint64_t v32 = (char *)&v63 - v31;
  MEMORY[0x1F4188790](v33);
  uint64_t v35 = (char *)&v63 - v34;
  MEMORY[0x1F4188790](v36);
  uint64_t v38 = (char *)&v63 - v37;
  uint64_t v39 = *a1;
  sub_1A94AE348(3u, v39, (uint64_t)&v63 - v37);
  sub_1A94AE348(2u, v39, (uint64_t)v35);
  sub_1A944A348((uint64_t)v38, (uint64_t)v32, &qword_1EB6DD3C8);
  uint64_t v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6DC8E8);
  if (__swift_getEnumTagSinglePayload((uint64_t)v32, 1, v40) != 1)
  {
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v41 = &qword_1EB6DC8E8;
      goto LABEL_5;
    }
    uint64_t v50 = (uint64_t)v32;
    uint64_t v51 = v73;
    sub_1A9449580(v50, v73);
    sub_1A961B118(v51, (uint64_t)v24);
    if (swift_getEnumCaseMultiPayload() == 3)
    {
      uint64_t v52 = v72;
      sub_1A9449580((uint64_t)v24, v72);
      sub_1A944A348((uint64_t)v35, (uint64_t)v29, &qword_1EB6DD3C8);
      if (__swift_getEnumTagSinglePayload((uint64_t)v29, 1, v40) == 1)
      {
        sub_1A961B3A4(v52, (void (*)(void))type metadata accessor for HourlyForecast);
        sub_1A961B3A4(v73, (void (*)(void))type metadata accessor for WeatherModel);
        uint64_t v41 = &qword_1EB6DD3C8;
LABEL_20:
        uint64_t v42 = (uint64_t)v29;
        goto LABEL_6;
      }
      if (swift_getEnumCaseMultiPayload() == 1)
      {
        sub_1A961B3A4(v52, (void (*)(void))type metadata accessor for HourlyForecast);
        sub_1A961B3A4(v73, (void (*)(void))type metadata accessor for WeatherModel);
        uint64_t v41 = &qword_1EB6DC8E8;
        goto LABEL_20;
      }
      uint64_t v54 = v71;
      sub_1A9449580((uint64_t)v29, v71);
      sub_1A961B118(v54, (uint64_t)v19);
      if (swift_getEnumCaseMultiPayload() == 2)
      {
        uint64_t v55 = (uint64_t)v19;
        uint64_t v56 = v69;
        sub_1A9449580(v55, v69);
        uint64_t v57 = v70;
        sub_1A95F5D1C(v39, v70);
        uint64_t v58 = v64;
        sub_1A961B118(v52, v64);
        uint64_t v59 = v63;
        sub_1A961B118(v56, v58 + *(int *)(v63 + 20));
        sub_1A944A348(v57, v58 + *(int *)(v59 + 24), &qword_1EB6DE0F8);
        uint64_t v60 = sub_1A95EDBA0(v58, v65, v67, v68, a6, a7);
        sub_1A961B3A4(v58, (void (*)(void))type metadata accessor for InterpolationInputProducts);
        if (v60)
        {
          uint64_t v74 = v60;
          __swift_instantiateConcreteTypeFromMangledName(qword_1EB6DA628);
          swift_allocObject();
          uint64_t v61 = sub_1A9631710();
        }
        else
        {
          sub_1A94E8B58();
          swift_allocError();
          *uint64_t v62 = 0xD00000000000004CLL;
          v62[1] = 0x80000001A9646B90;
          __swift_instantiateConcreteTypeFromMangledName(qword_1EB6DA628);
          swift_allocObject();
          uint64_t v61 = sub_1A9631700();
        }
        uint64_t v48 = v61;
        sub_1A944C480(v57, &qword_1EB6DE0F8);
        sub_1A961B3A4(v56, (void (*)(void))type metadata accessor for DailyForecast);
        sub_1A961B3A4(v71, (void (*)(void))type metadata accessor for WeatherModel);
        sub_1A961B3A4(v52, (void (*)(void))type metadata accessor for HourlyForecast);
        sub_1A961B3A4(v73, (void (*)(void))type metadata accessor for WeatherModel);
        goto LABEL_12;
      }
      sub_1A961B3A4(v54, (void (*)(void))type metadata accessor for WeatherModel);
      sub_1A961B3A4(v52, (void (*)(void))type metadata accessor for HourlyForecast);
      sub_1A961B3A4(v73, (void (*)(void))type metadata accessor for WeatherModel);
      uint64_t v53 = (uint64_t)v19;
    }
    else
    {
      sub_1A961B3A4(v51, (void (*)(void))type metadata accessor for WeatherModel);
      uint64_t v53 = (uint64_t)v24;
    }
    sub_1A961B3A4(v53, (void (*)(void))type metadata accessor for WeatherModel);
    goto LABEL_7;
  }
  uint64_t v41 = &qword_1EB6DD3C8;
LABEL_5:
  uint64_t v42 = (uint64_t)v32;
LABEL_6:
  sub_1A944C480(v42, v41);
LABEL_7:
  if (qword_1EB6DE388 != -1) {
    swift_once();
  }
  uint64_t v43 = sub_1A96317F0();
  __swift_project_value_buffer(v43, (uint64_t)qword_1EB6EB630);
  uint64_t v44 = sub_1A96317D0();
  os_log_type_t v45 = sub_1A9632220();
  if (os_log_type_enabled(v44, v45))
  {
    uint64_t v46 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v46 = 0;
    _os_log_impl(&dword_1A9410000, v44, v45, "Hourly and Daily forecasts missing from WDS fetch, so cannot interpolate", v46, 2u);
    MEMORY[0x1AD0F7300](v46, -1, -1);
  }

  sub_1A94E8B58();
  swift_allocError();
  *uint64_t v47 = 0xD000000000000048;
  v47[1] = 0x80000001A9646B40;
  __swift_instantiateConcreteTypeFromMangledName(qword_1EB6DA628);
  swift_allocObject();
  uint64_t v48 = sub_1A9631700();
LABEL_12:
  sub_1A944C480((uint64_t)v35, &qword_1EB6DD3C8);
  sub_1A944C480((uint64_t)v38, &qword_1EB6DD3C8);
  return v48;
}

uint64_t sub_1A95F5D1C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = type metadata accessor for WeatherModel();
  MEMORY[0x1F4188790](v4);
  unint64_t v6 = (char *)&v28 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v7);
  uint64_t v9 = (char *)&v28 - v8;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6DD3C8);
  MEMORY[0x1F4188790](v10 - 8);
  uint64_t v12 = (char *)&v28 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v13);
  uint64_t v15 = (char *)&v28 - v14;
  if (*(void *)(a1 + 16) && (unint64_t v16 = sub_1A94E73F4(4u), (v17 & 1) != 0))
  {
    unint64_t v18 = v16;
    uint64_t v19 = *(void *)(a1 + 56);
    uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6DC8E8);
    sub_1A944A348(v19 + *(void *)(*(void *)(v20 - 8) + 72) * v18, (uint64_t)v15, &qword_1EB6DC8E8);
    uint64_t v21 = (uint64_t)v15;
    uint64_t v22 = 0;
    uint64_t v23 = v20;
  }
  else
  {
    uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6DC8E8);
    uint64_t v21 = (uint64_t)v15;
    uint64_t v22 = 1;
  }
  __swift_storeEnumTagSinglePayload(v21, v22, 1, v23);
  sub_1A944A754((uint64_t)v15, (uint64_t)v12, &qword_1EB6DD3C8);
  uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6DC8E8);
  if (__swift_getEnumTagSinglePayload((uint64_t)v12, 1, v24) == 1)
  {
    uint64_t v25 = &qword_1EB6DD3C8;
LABEL_9:
    sub_1A944C480((uint64_t)v12, v25);
    goto LABEL_10;
  }
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v25 = &qword_1EB6DC8E8;
    goto LABEL_9;
  }
  sub_1A9449580((uint64_t)v12, (uint64_t)v9);
  sub_1A9449580((uint64_t)v9, (uint64_t)v6);
  if (swift_getEnumCaseMultiPayload() == 4) {
    return sub_1A944A754((uint64_t)v6, a2, &qword_1EB6DE0F8);
  }
  sub_1A961B3A4((uint64_t)v6, (void (*)(void))type metadata accessor for WeatherModel);
LABEL_10:
  uint64_t HourForecast = type metadata accessor for NextHourForecast();
  return __swift_storeEnumTagSinglePayload(a2, 1, 1, HourForecast);
}

void sub_1A95F5FCC(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v6 = sub_1A962E810();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  uint64_t v9 = (char *)&v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for AirQuality();
  MEMORY[0x1F4188790](v10 - 8);
  uint64_t v12 = (char *)&v25 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (sub_1A95E44F0())
  {
    sub_1A961B118(a1, (uint64_t)v12);
    uint64_t v13 = type metadata accessor for Metadata();
    (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, a1 + *(int *)(v13 + 20), v6);
    sub_1A9631510();
    sub_1A95CDF40(a2, a3, (uint64_t)v12, (uint64_t)v9, (uint64_t *)&v28);
    long long v31 = v28;
    long long v32 = v29;
    uint64_t v33 = v30;
    sub_1A9631950();
    long long v28 = v31;
    long long v29 = v32;
    uint64_t v30 = v33;
    sub_1A9631920();
    swift_release();
    if (qword_1EB6DE388 != -1) {
      swift_once();
    }
    uint64_t v18 = sub_1A96317F0();
    __swift_project_value_buffer(v18, (uint64_t)qword_1EB6EB630);
    sub_1A9631510();
    sub_1A948A8F8((uint64_t)&v31);
    sub_1A9631510();
    sub_1A948A8F8((uint64_t)&v31);
    uint64_t v19 = sub_1A96317D0();
    os_log_type_t v20 = sub_1A9632230();
    if (os_log_type_enabled(v19, v20))
    {
      uint64_t v21 = swift_slowAlloc();
      uint64_t v22 = swift_slowAlloc();
      v27[0] = v22;
      *(_DWORD *)uint64_t v21 = 141558531;
      *(void *)&long long v28 = 1752392040;
      sub_1A9632350();
      *(_WORD *)(v21 + 12) = 2081;
      sub_1A9631510();
      *(void *)&long long v28 = sub_1A945C1DC(a2, a3, v27);
      sub_1A9632350();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v21 + 22) = 2080;
      sub_1A948A8F8((uint64_t)&v31);
      sub_1A95D6124((uint64_t)&v28);
      sub_1A948A894((uint64_t)&v31);
      uint64_t v23 = sub_1A95D62D8();
      *(void *)&long long v28 = sub_1A945C1DC(v23, v24, v27);
      sub_1A9632350();
      swift_bridgeObjectRelease();
      sub_1A948A894((uint64_t)&v31);
      sub_1A948A894((uint64_t)&v31);
      _os_log_impl(&dword_1A9410000, v19, v20, "Just cached airQuality; identifier=%{private,mask.hash}s. It's valid for another %s",
        (uint8_t *)v21,
        0x20u);
      swift_arrayDestroy();
      MEMORY[0x1AD0F7300](v22, -1, -1);
      MEMORY[0x1AD0F7300](v21, -1, -1);

      sub_1A948A894((uint64_t)&v31);
    }
    else
    {
      sub_1A948A894((uint64_t)&v31);
      swift_bridgeObjectRelease_n();
      sub_1A948A894((uint64_t)&v31);
      sub_1A948A894((uint64_t)&v31);
    }
    sub_1A960DE30();
    sub_1A960E2DC();
    swift_release();
  }
  else
  {
    if (qword_1EB6DE388 != -1) {
      swift_once();
    }
    uint64_t v14 = sub_1A96317F0();
    __swift_project_value_buffer(v14, (uint64_t)qword_1EB6EB630);
    os_log_t v26 = (os_log_t)sub_1A96317D0();
    os_log_type_t v15 = sub_1A9632220();
    if (os_log_type_enabled(v26, v15))
    {
      unint64_t v16 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v16 = 0;
      _os_log_impl(&dword_1A9410000, v26, v15, "Cannot cache airQuality data due to missing store", v16, 2u);
      MEMORY[0x1AD0F7300](v16, -1, -1);
    }
    os_log_t v17 = v26;
  }
}

void sub_1A95F6694(uint64_t a1, unint64_t a2)
{
  uint64_t v4 = sub_1A962E810();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = (char *)&v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v8);
  if (sub_1A95E44F0())
  {
    sub_1A9631510();
    sub_1A962E7F0();
    sub_1A962E760();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    sub_1A95D5B50();
    long long v26 = v23;
    long long v27 = v24;
    uint64_t v28 = v25;
    sub_1A9631950();
    long long v23 = v26;
    long long v24 = v27;
    uint64_t v25 = v28;
    sub_1A9631920();
    swift_release();
    if (qword_1EB6DE388 != -1) {
      swift_once();
    }
    uint64_t v13 = sub_1A96317F0();
    __swift_project_value_buffer(v13, (uint64_t)qword_1EB6EB630);
    sub_1A9631510();
    sub_1A948A8F8((uint64_t)&v26);
    sub_1A9631510();
    sub_1A948A8F8((uint64_t)&v26);
    uint64_t v14 = sub_1A96317D0();
    os_log_type_t v15 = sub_1A9632230();
    if (os_log_type_enabled(v14, v15))
    {
      uint64_t v16 = swift_slowAlloc();
      uint64_t v17 = swift_slowAlloc();
      v22[0] = v17;
      *(_DWORD *)uint64_t v16 = 141558531;
      *(void *)&long long v23 = 1752392040;
      sub_1A9632350();
      *(_WORD *)(v16 + 12) = 2081;
      sub_1A9631510();
      *(void *)&long long v23 = sub_1A945C1DC(a1, a2, v22);
      sub_1A9632350();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v16 + 22) = 2080;
      sub_1A948A8F8((uint64_t)&v26);
      sub_1A95D6124((uint64_t)&v23);
      sub_1A948A894((uint64_t)&v26);
      uint64_t v18 = sub_1A95D62D8();
      *(void *)&long long v23 = sub_1A945C1DC(v18, v19, v22);
      sub_1A9632350();
      swift_bridgeObjectRelease();
      sub_1A948A894((uint64_t)&v26);
      sub_1A948A894((uint64_t)&v26);
      _os_log_impl(&dword_1A9410000, v14, v15, "Just marked airQuality unavailable; identifier=%{private,mask.hash}s. It's valid for another %s",
        (uint8_t *)v16,
        0x20u);
      swift_arrayDestroy();
      MEMORY[0x1AD0F7300](v17, -1, -1);
      MEMORY[0x1AD0F7300](v16, -1, -1);

      sub_1A948A894((uint64_t)&v26);
    }
    else
    {
      sub_1A948A894((uint64_t)&v26);
      swift_bridgeObjectRelease_n();
      sub_1A948A894((uint64_t)&v26);
      sub_1A948A894((uint64_t)&v26);
    }
    sub_1A960DE30();
    sub_1A960E2DC();
    swift_release();
  }
  else
  {
    if (qword_1EB6DE388 != -1) {
      swift_once();
    }
    uint64_t v9 = sub_1A96317F0();
    __swift_project_value_buffer(v9, (uint64_t)qword_1EB6EB630);
    os_log_t v21 = (os_log_t)sub_1A96317D0();
    os_log_type_t v10 = sub_1A9632220();
    if (os_log_type_enabled(v21, v10))
    {
      uint64_t v11 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v11 = 0;
      _os_log_impl(&dword_1A9410000, v21, v10, "Cannot log airQuality unavailable data due to missing store", v11, 2u);
      MEMORY[0x1AD0F7300](v11, -1, -1);
    }
    os_log_t v12 = v21;
  }
}

void sub_1A95F6D1C(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v6 = sub_1A962E810();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  uint64_t v9 = (char *)&v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for CurrentWeather();
  MEMORY[0x1F4188790](v10 - 8);
  os_log_t v12 = (char *)&v25 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (sub_1A95E44F0())
  {
    sub_1A961B118(a1, (uint64_t)v12);
    uint64_t v13 = type metadata accessor for Metadata();
    (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, a1 + *(int *)(v13 + 20), v6);
    sub_1A9631510();
    sub_1A95CE798(a2, a3, (uint64_t)v12, (uint64_t)v9, (uint64_t *)&v28);
    long long v31 = v28;
    long long v32 = v29;
    uint64_t v33 = v30;
    sub_1A9631950();
    long long v28 = v31;
    long long v29 = v32;
    uint64_t v30 = v33;
    sub_1A9631920();
    swift_release();
    if (qword_1EB6DE388 != -1) {
      swift_once();
    }
    uint64_t v18 = sub_1A96317F0();
    __swift_project_value_buffer(v18, (uint64_t)qword_1EB6EB630);
    sub_1A9631510();
    sub_1A948A8F8((uint64_t)&v31);
    sub_1A9631510();
    sub_1A948A8F8((uint64_t)&v31);
    unint64_t v19 = sub_1A96317D0();
    os_log_type_t v20 = sub_1A9632230();
    if (os_log_type_enabled(v19, v20))
    {
      uint64_t v21 = swift_slowAlloc();
      uint64_t v22 = swift_slowAlloc();
      v27[0] = v22;
      *(_DWORD *)uint64_t v21 = 141558531;
      *(void *)&long long v28 = 1752392040;
      sub_1A9632350();
      *(_WORD *)(v21 + 12) = 2081;
      sub_1A9631510();
      *(void *)&long long v28 = sub_1A945C1DC(a2, a3, v27);
      sub_1A9632350();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v21 + 22) = 2080;
      sub_1A948A8F8((uint64_t)&v31);
      sub_1A95D6124((uint64_t)&v28);
      sub_1A948A894((uint64_t)&v31);
      uint64_t v23 = sub_1A95D62D8();
      *(void *)&long long v28 = sub_1A945C1DC(v23, v24, v27);
      sub_1A9632350();
      swift_bridgeObjectRelease();
      sub_1A948A894((uint64_t)&v31);
      sub_1A948A894((uint64_t)&v31);
      _os_log_impl(&dword_1A9410000, v19, v20, "Just cached currentWeather; identifier=%{private,mask.hash}s. It's valid for another %s",
        (uint8_t *)v21,
        0x20u);
      swift_arrayDestroy();
      MEMORY[0x1AD0F7300](v22, -1, -1);
      MEMORY[0x1AD0F7300](v21, -1, -1);

      sub_1A948A894((uint64_t)&v31);
    }
    else
    {
      sub_1A948A894((uint64_t)&v31);
      swift_bridgeObjectRelease_n();
      sub_1A948A894((uint64_t)&v31);
      sub_1A948A894((uint64_t)&v31);
    }
    sub_1A960E788();
    swift_release();
  }
  else
  {
    if (qword_1EB6DE388 != -1) {
      swift_once();
    }
    uint64_t v14 = sub_1A96317F0();
    __swift_project_value_buffer(v14, (uint64_t)qword_1EB6EB630);
    os_log_t v26 = (os_log_t)sub_1A96317D0();
    os_log_type_t v15 = sub_1A9632220();
    if (os_log_type_enabled(v26, v15))
    {
      uint64_t v16 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v16 = 0;
      _os_log_impl(&dword_1A9410000, v26, v15, "Cannot cache currentWeather due to missing store", v16, 2u);
      MEMORY[0x1AD0F7300](v16, -1, -1);
    }
    os_log_t v17 = v26;
  }
}

uint64_t sub_1A95F73E0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v24 = a2;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6DD0F0);
  MEMORY[0x1F4188790](v5 - 8);
  uint64_t v7 = (char *)&v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = type metadata accessor for WeatherRequestDailyRelativeRange();
  MEMORY[0x1F4188790](v23);
  uint64_t v9 = (uint64_t *)((char *)&v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6DDB08);
  MEMORY[0x1F4188790](v10 - 8);
  os_log_t v12 = (char *)&v22 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_1A962E360();
  uint64_t v14 = *(void *)(v13 - 8);
  MEMORY[0x1F4188790](v13);
  uint64_t v16 = (char *)&v22 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = type metadata accessor for WeatherRequestOptions();
  sub_1A944A348(a1 + *(int *)(v17 + 28), (uint64_t)v12, &qword_1EB6DDB08);
  if (__swift_getEnumTagSinglePayload((uint64_t)v12, 1, v13) == 1)
  {
    sub_1A944C480((uint64_t)v12, &qword_1EB6DDB08);
    sub_1A944A348(a1 + *(int *)(v17 + 36), (uint64_t)v7, &qword_1EB6DD0F0);
    int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v7, 1, v23);
    uint64_t v19 = v24;
    if (EnumTagSinglePayload == 1)
    {
      sub_1A944C480((uint64_t)v7, &qword_1EB6DD0F0);
      sub_1A9631510();
    }
    else
    {
      sub_1A9449580((uint64_t)v7, (uint64_t)v9);
      uint64_t v28 = v19;
      uint64_t v29 = a3;
      sub_1A9631510();
      sub_1A9631EA0();
      sub_1A94A88C4();
      uint64_t v25 = *v9;
      uint64_t v26 = sub_1A96327B0();
      uint64_t v27 = v20;
      sub_1A9631EA0();
      sub_1A9631EA0();
      swift_bridgeObjectRelease();
      sub_1A9631EA0();
      uint64_t v25 = v9[1];
      sub_1A96327B0();
      sub_1A9631EA0();
      swift_bridgeObjectRelease();
      sub_1A9631EA0();
      swift_bridgeObjectRelease();
      uint64_t v19 = v28;
      sub_1A961B3A4((uint64_t)v9, (void (*)(void))type metadata accessor for WeatherRequestDailyRelativeRange);
    }
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v14 + 32))(v16, v12, v13);
    swift_getKeyPath();
    uint64_t v28 = v24;
    uint64_t v29 = a3;
    sub_1A9631510();
    sub_1A9631EA0();
    sub_1A9618A60();
    sub_1A9631EA0();
    swift_release();
    swift_bridgeObjectRelease();
    uint64_t v19 = v28;
    (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
  }
  return v19;
}

void sub_1A95F77D8(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v6 = sub_1A962E810();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  uint64_t v9 = (char *)&v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for DailyForecast();
  MEMORY[0x1F4188790](v10 - 8);
  os_log_t v12 = (char *)&v25 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (sub_1A95E44F0())
  {
    sub_1A961B118(a1, (uint64_t)v12);
    uint64_t v13 = type metadata accessor for Metadata();
    (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, a1 + *(int *)(v13 + 20), v6);
    sub_1A9631510();
    sub_1A95CEFF0(a2, a3, (uint64_t)v12, (uint64_t)v9, (uint64_t *)&v28);
    long long v31 = v28;
    long long v32 = v29;
    uint64_t v33 = v30;
    sub_1A9631950();
    long long v28 = v31;
    long long v29 = v32;
    uint64_t v30 = v33;
    sub_1A9631920();
    swift_release();
    if (qword_1EB6DE388 != -1) {
      swift_once();
    }
    uint64_t v18 = sub_1A96317F0();
    __swift_project_value_buffer(v18, (uint64_t)qword_1EB6EB630);
    sub_1A9631510();
    sub_1A948A8F8((uint64_t)&v31);
    sub_1A9631510();
    sub_1A948A8F8((uint64_t)&v31);
    uint64_t v19 = sub_1A96317D0();
    os_log_type_t v20 = sub_1A9632230();
    if (os_log_type_enabled(v19, v20))
    {
      uint64_t v21 = swift_slowAlloc();
      uint64_t v22 = swift_slowAlloc();
      v27[0] = v22;
      *(_DWORD *)uint64_t v21 = 141558531;
      *(void *)&long long v28 = 1752392040;
      sub_1A9632350();
      *(_WORD *)(v21 + 12) = 2081;
      sub_1A9631510();
      *(void *)&long long v28 = sub_1A945C1DC(a2, a3, v27);
      sub_1A9632350();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v21 + 22) = 2080;
      sub_1A948A8F8((uint64_t)&v31);
      sub_1A95D6124((uint64_t)&v28);
      sub_1A948A894((uint64_t)&v31);
      uint64_t v23 = sub_1A95D62D8();
      *(void *)&long long v28 = sub_1A945C1DC(v23, v24, v27);
      sub_1A9632350();
      swift_bridgeObjectRelease();
      sub_1A948A894((uint64_t)&v31);
      sub_1A948A894((uint64_t)&v31);
      _os_log_impl(&dword_1A9410000, v19, v20, "Just cached dailyForecast; identifier=%{private,mask.hash}s. It's valid for another %s",
        (uint8_t *)v21,
        0x20u);
      swift_arrayDestroy();
      MEMORY[0x1AD0F7300](v22, -1, -1);
      MEMORY[0x1AD0F7300](v21, -1, -1);

      sub_1A948A894((uint64_t)&v31);
    }
    else
    {
      sub_1A948A894((uint64_t)&v31);
      swift_bridgeObjectRelease_n();
      sub_1A948A894((uint64_t)&v31);
      sub_1A948A894((uint64_t)&v31);
    }
    sub_1A960EC34();
    swift_release();
  }
  else
  {
    if (qword_1EB6DE388 != -1) {
      swift_once();
    }
    uint64_t v14 = sub_1A96317F0();
    __swift_project_value_buffer(v14, (uint64_t)qword_1EB6EB630);
    os_log_t v26 = (os_log_t)sub_1A96317D0();
    os_log_type_t v15 = sub_1A9632220();
    if (os_log_type_enabled(v26, v15))
    {
      uint64_t v16 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v16 = 0;
      _os_log_impl(&dword_1A9410000, v26, v15, "Cannot cache dailyForecast due to missing store", v16, 2u);
      MEMORY[0x1AD0F7300](v16, -1, -1);
    }
    os_log_t v17 = v26;
  }
}

uint64_t sub_1A95F7E9C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v45 = a3;
  uint64_t v46 = a2;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6DD0F0);
  MEMORY[0x1F4188790](v4 - 8);
  uint64_t v43 = (uint64_t)&v40 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v42 = type metadata accessor for WeatherRequestDailyRelativeRange();
  MEMORY[0x1F4188790](v42);
  uint64_t v41 = (uint64_t *)((char *)&v40 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6DD110);
  MEMORY[0x1F4188790](v7 - 8);
  uint64_t v9 = (char *)&v40 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v44 = type metadata accessor for WeatherRequestHourlyRelativeRange();
  MEMORY[0x1F4188790](v44);
  uint64_t v11 = (char *)&v40 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6DDB08);
  MEMORY[0x1F4188790](v12 - 8);
  uint64_t v14 = (char *)&v40 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v15);
  os_log_t v17 = (char *)&v40 - v16;
  uint64_t v18 = sub_1A962E360();
  uint64_t v19 = *(void *)(v18 - 8);
  MEMORY[0x1F4188790](v18);
  uint64_t v21 = (char *)&v40 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v22);
  unint64_t v24 = (char *)&v40 - v23;
  uint64_t v25 = (int *)type metadata accessor for WeatherRequestOptions();
  sub_1A944A348(a1 + v25[8], (uint64_t)v17, &qword_1EB6DDB08);
  if (__swift_getEnumTagSinglePayload((uint64_t)v17, 1, v18) != 1)
  {
    (*(void (**)(char *, char *, uint64_t))(v19 + 32))(v24, v17, v18);
    swift_getKeyPath();
    uint64_t v50 = v46;
    uint64_t v51 = v45;
    sub_1A9631510();
    sub_1A9631EA0();
    sub_1A9618A60();
    sub_1A9631EA0();
    swift_release();
    swift_bridgeObjectRelease();
    uint64_t v33 = v50;
    (*(void (**)(char *, uint64_t))(v19 + 8))(v24, v18);
    return v33;
  }
  uint64_t v40 = v21;
  uint64_t v26 = v46;
  sub_1A944C480((uint64_t)v17, &qword_1EB6DDB08);
  sub_1A944A348(a1 + v25[10], (uint64_t)v9, &qword_1EB6DD110);
  if (__swift_getEnumTagSinglePayload((uint64_t)v9, 1, v44) != 1)
  {
    sub_1A9449580((uint64_t)v9, (uint64_t)v11);
    uint64_t v50 = v26;
    uint64_t v51 = v45;
    sub_1A9631510();
    sub_1A9631EA0();
    sub_1A958E75C();
    sub_1A9631EA0();
    swift_bridgeObjectRelease();
    uint64_t v33 = v50;
    uint64_t v34 = type metadata accessor for WeatherRequestHourlyRelativeRange;
    uint64_t v35 = (uint64_t)v11;
LABEL_10:
    sub_1A961B3A4(v35, (void (*)(void))v34);
    return v33;
  }
  sub_1A944C480((uint64_t)v9, &qword_1EB6DD110);
  uint64_t v27 = (uint64_t)v14;
  sub_1A944A348(a1 + v25[7], (uint64_t)v14, &qword_1EB6DDB08);
  uint64_t v28 = (uint64_t)v14;
  uint64_t v29 = v18;
  if (__swift_getEnumTagSinglePayload(v28, 1, v18) != 1)
  {
    uint64_t v36 = v40;
    (*(void (**)(char *, uint64_t, uint64_t))(v19 + 32))(v40, v27, v29);
    swift_getKeyPath();
    uint64_t v50 = v26;
    uint64_t v51 = v45;
    sub_1A9631510();
    sub_1A9631EA0();
    sub_1A9618A60();
    sub_1A9631EA0();
    swift_release();
    swift_bridgeObjectRelease();
    uint64_t v33 = v50;
    (*(void (**)(char *, uint64_t))(v19 + 8))(v36, v29);
    return v33;
  }
  sub_1A944C480(v27, &qword_1EB6DDB08);
  uint64_t v30 = v43;
  sub_1A944A348(a1 + v25[9], v43, &qword_1EB6DD0F0);
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload(v30, 1, v42);
  uint64_t v32 = v45;
  uint64_t v33 = v26;
  if (EnumTagSinglePayload != 1)
  {
    uint64_t v37 = v41;
    sub_1A9449580(v30, (uint64_t)v41);
    uint64_t v50 = v26;
    uint64_t v51 = v32;
    sub_1A9631510();
    sub_1A9631EA0();
    sub_1A94A88C4();
    uint64_t v47 = *v37;
    uint64_t v48 = sub_1A96327B0();
    uint64_t v49 = v38;
    sub_1A9631EA0();
    sub_1A9631EA0();
    swift_bridgeObjectRelease();
    sub_1A9631EA0();
    uint64_t v47 = v37[1];
    sub_1A96327B0();
    sub_1A9631EA0();
    swift_bridgeObjectRelease();
    sub_1A9631EA0();
    swift_bridgeObjectRelease();
    uint64_t v33 = v50;
    uint64_t v34 = type metadata accessor for WeatherRequestDailyRelativeRange;
    uint64_t v35 = (uint64_t)v37;
    goto LABEL_10;
  }
  sub_1A944C480(v30, &qword_1EB6DD0F0);
  sub_1A9631510();
  return v33;
}

void sub_1A95F8524(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v6 = sub_1A962E810();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  uint64_t v9 = (char *)&v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for HourlyForecast();
  MEMORY[0x1F4188790](v10 - 8);
  uint64_t v12 = (char *)&v25 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (sub_1A95E44F0())
  {
    sub_1A961B118(a1, (uint64_t)v12);
    uint64_t v13 = type metadata accessor for Metadata();
    (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, a1 + *(int *)(v13 + 20), v6);
    sub_1A9631510();
    sub_1A95CF848(a2, a3, (uint64_t)v12, (uint64_t)v9, (uint64_t *)&v28);
    long long v31 = v28;
    long long v32 = v29;
    uint64_t v33 = v30;
    sub_1A9631950();
    long long v28 = v31;
    long long v29 = v32;
    uint64_t v30 = v33;
    sub_1A9631920();
    swift_release();
    if (qword_1EB6DE388 != -1) {
      swift_once();
    }
    uint64_t v18 = sub_1A96317F0();
    __swift_project_value_buffer(v18, (uint64_t)qword_1EB6EB630);
    sub_1A9631510();
    sub_1A948A8F8((uint64_t)&v31);
    sub_1A9631510();
    sub_1A948A8F8((uint64_t)&v31);
    uint64_t v19 = sub_1A96317D0();
    os_log_type_t v20 = sub_1A9632230();
    if (os_log_type_enabled(v19, v20))
    {
      uint64_t v21 = swift_slowAlloc();
      uint64_t v22 = swift_slowAlloc();
      v27[0] = v22;
      *(_DWORD *)uint64_t v21 = 141558531;
      *(void *)&long long v28 = 1752392040;
      sub_1A9632350();
      *(_WORD *)(v21 + 12) = 2081;
      sub_1A9631510();
      *(void *)&long long v28 = sub_1A945C1DC(a2, a3, v27);
      sub_1A9632350();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v21 + 22) = 2080;
      sub_1A948A8F8((uint64_t)&v31);
      sub_1A95D6124((uint64_t)&v28);
      sub_1A948A894((uint64_t)&v31);
      uint64_t v23 = sub_1A95D62D8();
      *(void *)&long long v28 = sub_1A945C1DC(v23, v24, v27);
      sub_1A9632350();
      swift_bridgeObjectRelease();
      sub_1A948A894((uint64_t)&v31);
      sub_1A948A894((uint64_t)&v31);
      _os_log_impl(&dword_1A9410000, v19, v20, "Just cached hourlyForecast; identifier=%{private,mask.hash}s. It's valid for another %s",
        (uint8_t *)v21,
        0x20u);
      swift_arrayDestroy();
      MEMORY[0x1AD0F7300](v22, -1, -1);
      MEMORY[0x1AD0F7300](v21, -1, -1);

      sub_1A948A894((uint64_t)&v31);
    }
    else
    {
      sub_1A948A894((uint64_t)&v31);
      swift_bridgeObjectRelease_n();
      sub_1A948A894((uint64_t)&v31);
      sub_1A948A894((uint64_t)&v31);
    }
    sub_1A960F0E0();
    swift_release();
  }
  else
  {
    if (qword_1EB6DE388 != -1) {
      swift_once();
    }
    uint64_t v14 = sub_1A96317F0();
    __swift_project_value_buffer(v14, (uint64_t)qword_1EB6EB630);
    os_log_t v26 = (os_log_t)sub_1A96317D0();
    os_log_type_t v15 = sub_1A9632220();
    if (os_log_type_enabled(v26, v15))
    {
      uint64_t v16 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v16 = 0;
      _os_log_impl(&dword_1A9410000, v26, v15, "Cannot cache hourlyForecast due to missing store", v16, 2u);
      MEMORY[0x1AD0F7300](v16, -1, -1);
    }
    os_log_t v17 = v26;
  }
}

void sub_1A95F8BE8(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v6 = sub_1A962E810();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  uint64_t v9 = (char *)&v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t HourForecast = type metadata accessor for NextHourForecast();
  MEMORY[0x1F4188790](HourForecast - 8);
  uint64_t v12 = (char *)&v25 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (sub_1A95E44F0())
  {
    sub_1A961B118(a1, (uint64_t)v12);
    uint64_t v13 = type metadata accessor for Metadata();
    (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, a1 + *(int *)(v13 + 20), v6);
    sub_1A9631510();
    sub_1A95D00A0(a2, a3, (uint64_t)v12, (uint64_t)v9, (uint64_t *)&v28);
    long long v31 = v28;
    long long v32 = v29;
    uint64_t v33 = v30;
    sub_1A9631950();
    long long v28 = v31;
    long long v29 = v32;
    uint64_t v30 = v33;
    sub_1A9631920();
    swift_release();
    if (qword_1EB6DE388 != -1) {
      swift_once();
    }
    uint64_t v18 = sub_1A96317F0();
    __swift_project_value_buffer(v18, (uint64_t)qword_1EB6EB630);
    sub_1A9631510();
    sub_1A948A8F8((uint64_t)&v31);
    sub_1A9631510();
    sub_1A948A8F8((uint64_t)&v31);
    uint64_t v19 = sub_1A96317D0();
    os_log_type_t v20 = sub_1A9632230();
    if (os_log_type_enabled(v19, v20))
    {
      uint64_t v21 = swift_slowAlloc();
      uint64_t v22 = swift_slowAlloc();
      v27[0] = v22;
      *(_DWORD *)uint64_t v21 = 141558531;
      *(void *)&long long v28 = 1752392040;
      sub_1A9632350();
      *(_WORD *)(v21 + 12) = 2081;
      sub_1A9631510();
      *(void *)&long long v28 = sub_1A945C1DC(a2, a3, v27);
      sub_1A9632350();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v21 + 22) = 2080;
      sub_1A948A8F8((uint64_t)&v31);
      sub_1A95D6124((uint64_t)&v28);
      sub_1A948A894((uint64_t)&v31);
      uint64_t v23 = sub_1A95D62D8();
      *(void *)&long long v28 = sub_1A945C1DC(v23, v24, v27);
      sub_1A9632350();
      swift_bridgeObjectRelease();
      sub_1A948A894((uint64_t)&v31);
      sub_1A948A894((uint64_t)&v31);
      _os_log_impl(&dword_1A9410000, v19, v20, "Just cached nextHourForecast; identifier=%{private,mask.hash}s. It's valid for another %s",
        (uint8_t *)v21,
        0x20u);
      swift_arrayDestroy();
      MEMORY[0x1AD0F7300](v22, -1, -1);
      MEMORY[0x1AD0F7300](v21, -1, -1);

      sub_1A948A894((uint64_t)&v31);
    }
    else
    {
      sub_1A948A894((uint64_t)&v31);
      swift_bridgeObjectRelease_n();
      sub_1A948A894((uint64_t)&v31);
      sub_1A948A894((uint64_t)&v31);
    }
    sub_1A960F58C();
    sub_1A960FA38();
    swift_release();
  }
  else
  {
    if (qword_1EB6DE388 != -1) {
      swift_once();
    }
    uint64_t v14 = sub_1A96317F0();
    __swift_project_value_buffer(v14, (uint64_t)qword_1EB6EB630);
    os_log_t v26 = (os_log_t)sub_1A96317D0();
    os_log_type_t v15 = sub_1A9632220();
    if (os_log_type_enabled(v26, v15))
    {
      uint64_t v16 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v16 = 0;
      _os_log_impl(&dword_1A9410000, v26, v15, "Cannot cache nextHourForecast due to missing store", v16, 2u);
      MEMORY[0x1AD0F7300](v16, -1, -1);
    }
    os_log_t v17 = v26;
  }
}

void sub_1A95F92B0(uint64_t a1, unint64_t a2)
{
  uint64_t v4 = sub_1A962E810();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = (char *)&v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v8);
  if (sub_1A95E44F0())
  {
    sub_1A9631510();
    sub_1A962E7F0();
    sub_1A962E760();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    sub_1A95D5B50();
    long long v26 = v23;
    long long v27 = v24;
    uint64_t v28 = v25;
    sub_1A9631950();
    long long v23 = v26;
    long long v24 = v27;
    uint64_t v25 = v28;
    sub_1A9631920();
    swift_release();
    if (qword_1EB6DE388 != -1) {
      swift_once();
    }
    uint64_t v13 = sub_1A96317F0();
    __swift_project_value_buffer(v13, (uint64_t)qword_1EB6EB630);
    sub_1A9631510();
    sub_1A948A8F8((uint64_t)&v26);
    sub_1A9631510();
    sub_1A948A8F8((uint64_t)&v26);
    uint64_t v14 = sub_1A96317D0();
    os_log_type_t v15 = sub_1A9632230();
    if (os_log_type_enabled(v14, v15))
    {
      uint64_t v16 = swift_slowAlloc();
      uint64_t v17 = swift_slowAlloc();
      v22[0] = v17;
      *(_DWORD *)uint64_t v16 = 141558531;
      *(void *)&long long v23 = 1752392040;
      sub_1A9632350();
      *(_WORD *)(v16 + 12) = 2081;
      sub_1A9631510();
      *(void *)&long long v23 = sub_1A945C1DC(a1, a2, v22);
      sub_1A9632350();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v16 + 22) = 2080;
      sub_1A948A8F8((uint64_t)&v26);
      sub_1A95D6124((uint64_t)&v23);
      sub_1A948A894((uint64_t)&v26);
      uint64_t v18 = sub_1A95D62D8();
      *(void *)&long long v23 = sub_1A945C1DC(v18, v19, v22);
      sub_1A9632350();
      swift_bridgeObjectRelease();
      sub_1A948A894((uint64_t)&v26);
      sub_1A948A894((uint64_t)&v26);
      _os_log_impl(&dword_1A9410000, v14, v15, "Just marked nextHourForecast unavailable; identifier=%{private,mask.hash}s. It's valid for another %s",
        (uint8_t *)v16,
        0x20u);
      swift_arrayDestroy();
      MEMORY[0x1AD0F7300](v17, -1, -1);
      MEMORY[0x1AD0F7300](v16, -1, -1);

      sub_1A948A894((uint64_t)&v26);
    }
    else
    {
      sub_1A948A894((uint64_t)&v26);
      swift_bridgeObjectRelease_n();
      sub_1A948A894((uint64_t)&v26);
      sub_1A948A894((uint64_t)&v26);
    }
    sub_1A960F58C();
    sub_1A960FA38();
    swift_release();
  }
  else
  {
    if (qword_1EB6DE388 != -1) {
      swift_once();
    }
    uint64_t v9 = sub_1A96317F0();
    __swift_project_value_buffer(v9, (uint64_t)qword_1EB6EB630);
    os_log_t v21 = (os_log_t)sub_1A96317D0();
    os_log_type_t v10 = sub_1A9632220();
    if (os_log_type_enabled(v21, v10))
    {
      uint64_t v11 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v11 = 0;
      _os_log_impl(&dword_1A9410000, v21, v10, "Cannot log nextHourForecast unavailable data due to missing store", v11, 2u);
      MEMORY[0x1AD0F7300](v11, -1, -1);
    }
    os_log_t v12 = v21;
  }
}

void sub_1A95F9938(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v6 = sub_1A962E810();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  uint64_t v9 = (char *)&v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for PeriodicForecasts();
  MEMORY[0x1F4188790](v10 - 8);
  os_log_t v12 = (char *)&v25 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (sub_1A95E44F0())
  {
    sub_1A961B118(a1, (uint64_t)v12);
    uint64_t v13 = type metadata accessor for Metadata();
    (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, a1 + *(int *)(v13 + 20), v6);
    sub_1A9631510();
    sub_1A95D08F8(a2, a3, (uint64_t)v12, (uint64_t)v9, (uint64_t *)&v28);
    long long v31 = v28;
    long long v32 = v29;
    uint64_t v33 = v30;
    sub_1A9631950();
    long long v28 = v31;
    long long v29 = v32;
    uint64_t v30 = v33;
    sub_1A9631920();
    swift_release();
    if (qword_1EB6DE388 != -1) {
      swift_once();
    }
    uint64_t v18 = sub_1A96317F0();
    __swift_project_value_buffer(v18, (uint64_t)qword_1EB6EB630);
    sub_1A9631510();
    sub_1A948A8F8((uint64_t)&v31);
    sub_1A9631510();
    sub_1A948A8F8((uint64_t)&v31);
    unint64_t v19 = sub_1A96317D0();
    os_log_type_t v20 = sub_1A9632230();
    if (os_log_type_enabled(v19, v20))
    {
      uint64_t v21 = swift_slowAlloc();
      uint64_t v22 = swift_slowAlloc();
      v27[0] = v22;
      *(_DWORD *)uint64_t v21 = 141558531;
      *(void *)&long long v28 = 1752392040;
      sub_1A9632350();
      *(_WORD *)(v21 + 12) = 2081;
      sub_1A9631510();
      *(void *)&long long v28 = sub_1A945C1DC(a2, a3, v27);
      sub_1A9632350();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v21 + 22) = 2080;
      sub_1A948A8F8((uint64_t)&v31);
      sub_1A95D6124((uint64_t)&v28);
      sub_1A948A894((uint64_t)&v31);
      uint64_t v23 = sub_1A95D62D8();
      *(void *)&long long v28 = sub_1A945C1DC(v23, v24, v27);
      sub_1A9632350();
      swift_bridgeObjectRelease();
      sub_1A948A894((uint64_t)&v31);
      sub_1A948A894((uint64_t)&v31);
      _os_log_impl(&dword_1A9410000, v19, v20, "Just cached forecastPeriod; identifier=%{private,mask.hash}s. It's valid for another %s",
        (uint8_t *)v21,
        0x20u);
      swift_arrayDestroy();
      MEMORY[0x1AD0F7300](v22, -1, -1);
      MEMORY[0x1AD0F7300](v21, -1, -1);

      sub_1A948A894((uint64_t)&v31);
    }
    else
    {
      sub_1A948A894((uint64_t)&v31);
      swift_bridgeObjectRelease_n();
      sub_1A948A894((uint64_t)&v31);
      sub_1A948A894((uint64_t)&v31);
    }
    sub_1A960D984();
    swift_release();
  }
  else
  {
    if (qword_1EB6DE388 != -1) {
      swift_once();
    }
    uint64_t v14 = sub_1A96317F0();
    __swift_project_value_buffer(v14, (uint64_t)qword_1EB6EB630);
    os_log_t v26 = (os_log_t)sub_1A96317D0();
    os_log_type_t v15 = sub_1A9632220();
    if (os_log_type_enabled(v26, v15))
    {
      uint64_t v16 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v16 = 0;
      _os_log_impl(&dword_1A9410000, v26, v15, "Cannot cache forecastPeriod due to missing store", v16, 2u);
      MEMORY[0x1AD0F7300](v16, -1, -1);
    }
    os_log_t v17 = v26;
  }
}

void sub_1A95F9FFC(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v6 = sub_1A962E810();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  uint64_t v9 = (char *)&v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for LocationInfo();
  MEMORY[0x1F4188790](v10 - 8);
  os_log_t v12 = (char *)&v25 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (sub_1A95E44F0())
  {
    sub_1A961B118(a1, (uint64_t)v12);
    uint64_t v13 = type metadata accessor for Metadata();
    (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, a1 + *(int *)(v13 + 20), v6);
    sub_1A9631510();
    sub_1A95D1150(a2, a3, (uint64_t)v12, (uint64_t)v9, (uint64_t *)&v28);
    long long v31 = v28;
    long long v32 = v29;
    uint64_t v33 = v30;
    sub_1A9631950();
    long long v28 = v31;
    long long v29 = v32;
    uint64_t v30 = v33;
    sub_1A9631920();
    swift_release();
    if (qword_1EB6DE388 != -1) {
      swift_once();
    }
    uint64_t v18 = sub_1A96317F0();
    __swift_project_value_buffer(v18, (uint64_t)qword_1EB6EB630);
    sub_1A9631510();
    sub_1A948A8F8((uint64_t)&v31);
    sub_1A9631510();
    sub_1A948A8F8((uint64_t)&v31);
    unint64_t v19 = sub_1A96317D0();
    os_log_type_t v20 = sub_1A9632230();
    if (os_log_type_enabled(v19, v20))
    {
      uint64_t v21 = swift_slowAlloc();
      uint64_t v22 = swift_slowAlloc();
      v27[0] = v22;
      *(_DWORD *)uint64_t v21 = 141558531;
      *(void *)&long long v28 = 1752392040;
      sub_1A9632350();
      *(_WORD *)(v21 + 12) = 2081;
      sub_1A9631510();
      *(void *)&long long v28 = sub_1A945C1DC(a2, a3, v27);
      sub_1A9632350();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v21 + 22) = 2080;
      sub_1A948A8F8((uint64_t)&v31);
      sub_1A95D6124((uint64_t)&v28);
      sub_1A948A894((uint64_t)&v31);
      uint64_t v23 = sub_1A95D62D8();
      *(void *)&long long v28 = sub_1A945C1DC(v23, v24, v27);
      sub_1A9632350();
      swift_bridgeObjectRelease();
      sub_1A948A894((uint64_t)&v31);
      sub_1A948A894((uint64_t)&v31);
      _os_log_impl(&dword_1A9410000, v19, v20, "Just cached locationInfo; identifier=%{private,mask.hash}s. It's valid for another %s",
        (uint8_t *)v21,
        0x20u);
      swift_arrayDestroy();
      MEMORY[0x1AD0F7300](v22, -1, -1);
      MEMORY[0x1AD0F7300](v21, -1, -1);

      sub_1A948A894((uint64_t)&v31);
    }
    else
    {
      sub_1A948A894((uint64_t)&v31);
      swift_bridgeObjectRelease_n();
      sub_1A948A894((uint64_t)&v31);
      sub_1A948A894((uint64_t)&v31);
    }
    sub_1A960FEE4();
    swift_release();
  }
  else
  {
    if (qword_1EB6DE388 != -1) {
      swift_once();
    }
    uint64_t v14 = sub_1A96317F0();
    __swift_project_value_buffer(v14, (uint64_t)qword_1EB6EB630);
    os_log_t v26 = (os_log_t)sub_1A96317D0();
    os_log_type_t v15 = sub_1A9632220();
    if (os_log_type_enabled(v26, v15))
    {
      uint64_t v16 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v16 = 0;
      _os_log_impl(&dword_1A9410000, v26, v15, "Cannot cache locationInfo due to missing store", v16, 2u);
      MEMORY[0x1AD0F7300](v16, -1, -1);
    }
    os_log_t v17 = v26;
  }
}

void sub_1A95FA6C0(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v6 = sub_1A962E810();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  uint64_t v9 = (char *)&v27 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for MarineForecast();
  MEMORY[0x1F4188790](v10);
  os_log_t v12 = (char *)&v27 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_1A95E44F0();
  if (v13)
  {
    os_log_t v29 = v13;
    sub_1A961B118(a1, (uint64_t)v12);
    uint64_t v14 = a1 + *(int *)(v10 + 20);
    uint64_t v15 = type metadata accessor for Metadata();
    (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, v14 + *(int *)(v15 + 20), v6);
    sub_1A9631510();
    sub_1A95D21AC(a2, a3, (uint64_t)v12, (uint64_t)v9, (uint64_t *)&v31);
    uint64_t v28 = v10;
    long long v34 = v31;
    long long v35 = v32;
    uint64_t v36 = v33;
    sub_1A9631950();
    long long v31 = v34;
    long long v32 = v35;
    uint64_t v33 = v36;
    sub_1A9631920();
    swift_release();
    if (qword_1EB6DE388 != -1) {
      swift_once();
    }
    uint64_t v20 = sub_1A96317F0();
    __swift_project_value_buffer(v20, (uint64_t)qword_1EB6EB630);
    sub_1A9631510();
    sub_1A948A8F8((uint64_t)&v34);
    sub_1A9631510();
    sub_1A948A8F8((uint64_t)&v34);
    uint64_t v21 = sub_1A96317D0();
    os_log_type_t v22 = sub_1A9632230();
    if (os_log_type_enabled(v21, v22))
    {
      uint64_t v23 = swift_slowAlloc();
      uint64_t v24 = swift_slowAlloc();
      v30[0] = v24;
      *(_DWORD *)uint64_t v23 = 141558531;
      *(void *)&long long v31 = 1752392040;
      sub_1A9632350();
      *(_WORD *)(v23 + 12) = 2081;
      sub_1A9631510();
      *(void *)&long long v31 = sub_1A945C1DC(a2, a3, v30);
      sub_1A9632350();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v23 + 22) = 2080;
      sub_1A948A8F8((uint64_t)&v34);
      sub_1A95D6124((uint64_t)&v31);
      sub_1A948A894((uint64_t)&v34);
      uint64_t v25 = sub_1A95D62D8();
      *(void *)&long long v31 = sub_1A945C1DC(v25, v26, v30);
      sub_1A9632350();
      swift_bridgeObjectRelease();
      sub_1A948A894((uint64_t)&v34);
      sub_1A948A894((uint64_t)&v34);
      _os_log_impl(&dword_1A9410000, v21, v22, "Just cached marineForecast; identifier=%{private,mask.hash}s. It's valid for another %s",
        (uint8_t *)v23,
        0x20u);
      swift_arrayDestroy();
      MEMORY[0x1AD0F7300](v24, -1, -1);
      MEMORY[0x1AD0F7300](v23, -1, -1);

      sub_1A948A894((uint64_t)&v34);
    }
    else
    {
      sub_1A948A894((uint64_t)&v34);
      swift_bridgeObjectRelease_n();
      sub_1A948A894((uint64_t)&v34);
      sub_1A948A894((uint64_t)&v34);
    }
    sub_1A9610390();
    sub_1A961083C();
    sub_1A9610CE8(a2, a3, *(double *)(a1 + *(int *)(v28 + 24)), *(double *)(a1 + *(int *)(v28 + 24) + 8));
    swift_release();
  }
  else
  {
    if (qword_1EB6DE388 != -1) {
      swift_once();
    }
    uint64_t v16 = sub_1A96317F0();
    __swift_project_value_buffer(v16, (uint64_t)qword_1EB6EB630);
    os_log_t v29 = (os_log_t)sub_1A96317D0();
    os_log_type_t v17 = sub_1A9632230();
    if (os_log_type_enabled(v29, v17))
    {
      uint64_t v18 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v18 = 0;
      _os_log_impl(&dword_1A9410000, v29, v17, "Cannot cache marineForecast due to missing store", v18, 2u);
      MEMORY[0x1AD0F7300](v18, -1, -1);
    }
    os_log_t v19 = v29;
  }
}

void sub_1A95FADC8(uint64_t a1, unint64_t a2)
{
  uint64_t v4 = sub_1A962E810();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = (char *)&v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v8);
  if (sub_1A95E44F0())
  {
    sub_1A9631510();
    sub_1A962E7F0();
    sub_1A962E760();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    sub_1A95D5B50();
    long long v26 = v23;
    long long v27 = v24;
    uint64_t v28 = v25;
    sub_1A9631950();
    long long v23 = v26;
    long long v24 = v27;
    uint64_t v25 = v28;
    sub_1A9631920();
    swift_release();
    if (qword_1EB6DE388 != -1) {
      swift_once();
    }
    uint64_t v13 = sub_1A96317F0();
    __swift_project_value_buffer(v13, (uint64_t)qword_1EB6EB630);
    sub_1A9631510();
    sub_1A948A8F8((uint64_t)&v26);
    sub_1A9631510();
    sub_1A948A8F8((uint64_t)&v26);
    uint64_t v14 = sub_1A96317D0();
    os_log_type_t v15 = sub_1A9632230();
    if (os_log_type_enabled(v14, v15))
    {
      uint64_t v16 = swift_slowAlloc();
      uint64_t v17 = swift_slowAlloc();
      v22[0] = v17;
      *(_DWORD *)uint64_t v16 = 141558531;
      *(void *)&long long v23 = 1752392040;
      sub_1A9632350();
      *(_WORD *)(v16 + 12) = 2081;
      sub_1A9631510();
      *(void *)&long long v23 = sub_1A945C1DC(a1, a2, v22);
      sub_1A9632350();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v16 + 22) = 2080;
      sub_1A948A8F8((uint64_t)&v26);
      sub_1A95D6124((uint64_t)&v23);
      sub_1A948A894((uint64_t)&v26);
      uint64_t v18 = sub_1A95D62D8();
      *(void *)&long long v23 = sub_1A945C1DC(v18, v19, v22);
      sub_1A9632350();
      swift_bridgeObjectRelease();
      sub_1A948A894((uint64_t)&v26);
      sub_1A948A894((uint64_t)&v26);
      _os_log_impl(&dword_1A9410000, v14, v15, "Just marked marineForecastUnavailable; identifier=%{private,mask.hash}s. It's valid for another %s",
        (uint8_t *)v16,
        0x20u);
      swift_arrayDestroy();
      MEMORY[0x1AD0F7300](v17, -1, -1);
      MEMORY[0x1AD0F7300](v16, -1, -1);

      sub_1A948A894((uint64_t)&v26);
    }
    else
    {
      sub_1A948A894((uint64_t)&v26);
      swift_bridgeObjectRelease_n();
      sub_1A948A894((uint64_t)&v26);
      sub_1A948A894((uint64_t)&v26);
    }
    sub_1A9610390();
    sub_1A961083C();
    swift_release();
  }
  else
  {
    if (qword_1EB6DE388 != -1) {
      swift_once();
    }
    uint64_t v9 = sub_1A96317F0();
    __swift_project_value_buffer(v9, (uint64_t)qword_1EB6EB630);
    os_log_t v21 = (os_log_t)sub_1A96317D0();
    os_log_type_t v10 = sub_1A9632230();
    if (os_log_type_enabled(v21, v10))
    {
      uint64_t v11 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v11 = 0;
      _os_log_impl(&dword_1A9410000, v21, v10, "Cannot log marineForecastUnavailable data due to missing store", v11, 2u);
      MEMORY[0x1AD0F7300](v11, -1, -1);
    }
    os_log_t v12 = v21;
  }
}

void sub_1A95FB450(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v6 = sub_1A962E810();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  uint64_t v9 = (char *)&v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for News();
  MEMORY[0x1F4188790](v10 - 8);
  os_log_t v12 = (char *)&v25 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (sub_1A95E44F0())
  {
    sub_1A961B118(a1, (uint64_t)v12);
    uint64_t v13 = type metadata accessor for Metadata();
    (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, a1 + *(int *)(v13 + 20), v6);
    sub_1A9631510();
    sub_1A95D2A04(a2, a3, (uint64_t)v12, (uint64_t)v9, (uint64_t *)&v28);
    long long v31 = v28;
    long long v32 = v29;
    uint64_t v33 = v30;
    sub_1A9631950();
    long long v28 = v31;
    long long v29 = v32;
    uint64_t v30 = v33;
    sub_1A9631920();
    swift_release();
    if (qword_1EB6DE388 != -1) {
      swift_once();
    }
    uint64_t v18 = sub_1A96317F0();
    __swift_project_value_buffer(v18, (uint64_t)qword_1EB6EB630);
    sub_1A9631510();
    sub_1A948A8F8((uint64_t)&v31);
    sub_1A9631510();
    sub_1A948A8F8((uint64_t)&v31);
    unint64_t v19 = sub_1A96317D0();
    os_log_type_t v20 = sub_1A9632230();
    if (os_log_type_enabled(v19, v20))
    {
      uint64_t v21 = swift_slowAlloc();
      uint64_t v22 = swift_slowAlloc();
      v27[0] = v22;
      *(_DWORD *)uint64_t v21 = 141558531;
      *(void *)&long long v28 = 1752392040;
      sub_1A9632350();
      *(_WORD *)(v21 + 12) = 2081;
      sub_1A9631510();
      *(void *)&long long v28 = sub_1A945C1DC(a2, a3, v27);
      sub_1A9632350();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v21 + 22) = 2080;
      sub_1A948A8F8((uint64_t)&v31);
      sub_1A95D6124((uint64_t)&v28);
      sub_1A948A894((uint64_t)&v31);
      uint64_t v23 = sub_1A95D62D8();
      *(void *)&long long v28 = sub_1A945C1DC(v23, v24, v27);
      sub_1A9632350();
      swift_bridgeObjectRelease();
      sub_1A948A894((uint64_t)&v31);
      sub_1A948A894((uint64_t)&v31);
      _os_log_impl(&dword_1A9410000, v19, v20, "Just cached news; identifier=%{private,mask.hash}s. It's valid for another %s",
        (uint8_t *)v21,
        0x20u);
      swift_arrayDestroy();
      MEMORY[0x1AD0F7300](v22, -1, -1);
      MEMORY[0x1AD0F7300](v21, -1, -1);

      sub_1A948A894((uint64_t)&v31);
    }
    else
    {
      sub_1A948A894((uint64_t)&v31);
      swift_bridgeObjectRelease_n();
      sub_1A948A894((uint64_t)&v31);
      sub_1A948A894((uint64_t)&v31);
    }
    sub_1A9611834();
    sub_1A9611CE0();
    swift_release();
  }
  else
  {
    if (qword_1EB6DE388 != -1) {
      swift_once();
    }
    uint64_t v14 = sub_1A96317F0();
    __swift_project_value_buffer(v14, (uint64_t)qword_1EB6EB630);
    os_log_t v26 = (os_log_t)sub_1A96317D0();
    os_log_type_t v15 = sub_1A9632220();
    if (os_log_type_enabled(v26, v15))
    {
      uint64_t v16 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v16 = 0;
      _os_log_impl(&dword_1A9410000, v26, v15, "Cannot cache news due to missing store", v16, 2u);
      MEMORY[0x1AD0F7300](v16, -1, -1);
    }
    os_log_t v17 = v26;
  }
}

void sub_1A95FBB18(uint64_t a1, unint64_t a2)
{
  uint64_t v4 = sub_1A962E810();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = (char *)&v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v8);
  if (sub_1A95E44F0())
  {
    sub_1A9631510();
    sub_1A962E7F0();
    sub_1A962E760();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    sub_1A95D5B50();
    long long v26 = v23;
    long long v27 = v24;
    uint64_t v28 = v25;
    sub_1A9631950();
    long long v23 = v26;
    long long v24 = v27;
    uint64_t v25 = v28;
    sub_1A9631920();
    swift_release();
    if (qword_1EB6DE388 != -1) {
      swift_once();
    }
    uint64_t v13 = sub_1A96317F0();
    __swift_project_value_buffer(v13, (uint64_t)qword_1EB6EB630);
    sub_1A9631510();
    sub_1A948A8F8((uint64_t)&v26);
    sub_1A9631510();
    sub_1A948A8F8((uint64_t)&v26);
    uint64_t v14 = sub_1A96317D0();
    os_log_type_t v15 = sub_1A9632230();
    if (os_log_type_enabled(v14, v15))
    {
      uint64_t v16 = swift_slowAlloc();
      uint64_t v17 = swift_slowAlloc();
      v22[0] = v17;
      *(_DWORD *)uint64_t v16 = 141558531;
      *(void *)&long long v23 = 1752392040;
      sub_1A9632350();
      *(_WORD *)(v16 + 12) = 2081;
      sub_1A9631510();
      *(void *)&long long v23 = sub_1A945C1DC(a1, a2, v22);
      sub_1A9632350();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v16 + 22) = 2080;
      sub_1A948A8F8((uint64_t)&v26);
      sub_1A95D6124((uint64_t)&v23);
      sub_1A948A894((uint64_t)&v26);
      uint64_t v18 = sub_1A95D62D8();
      *(void *)&long long v23 = sub_1A945C1DC(v18, v19, v22);
      sub_1A9632350();
      swift_bridgeObjectRelease();
      sub_1A948A894((uint64_t)&v26);
      sub_1A948A894((uint64_t)&v26);
      _os_log_impl(&dword_1A9410000, v14, v15, "Just marked news unavailable; identifier=%{private,mask.hash}s. It's valid for another %s",
        (uint8_t *)v16,
        0x20u);
      swift_arrayDestroy();
      MEMORY[0x1AD0F7300](v17, -1, -1);
      MEMORY[0x1AD0F7300](v16, -1, -1);

      sub_1A948A894((uint64_t)&v26);
    }
    else
    {
      sub_1A948A894((uint64_t)&v26);
      swift_bridgeObjectRelease_n();
      sub_1A948A894((uint64_t)&v26);
      sub_1A948A894((uint64_t)&v26);
    }
    sub_1A9611834();
    sub_1A9611CE0();
    swift_release();
  }
  else
  {
    if (qword_1EB6DE388 != -1) {
      swift_once();
    }
    uint64_t v9 = sub_1A96317F0();
    __swift_project_value_buffer(v9, (uint64_t)qword_1EB6EB630);
    os_log_t v21 = (os_log_t)sub_1A96317D0();
    os_log_type_t v10 = sub_1A9632220();
    if (os_log_type_enabled(v21, v10))
    {
      uint64_t v11 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v11 = 0;
      _os_log_impl(&dword_1A9410000, v21, v10, "Cannot log news unavailable data due to missing store", v11, 2u);
      MEMORY[0x1AD0F7300](v11, -1, -1);
    }
    os_log_t v12 = v21;
  }
}

void sub_1A95FC1A0(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v6 = sub_1A962E810();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  uint64_t v9 = (char *)&v27 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for TideEvents();
  MEMORY[0x1F4188790](v10);
  os_log_t v12 = (char *)&v27 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_1A95E44F0();
  if (v13)
  {
    os_log_t v29 = v13;
    sub_1A961B118(a1, (uint64_t)v12);
    uint64_t v14 = a1 + *(int *)(v10 + 24);
    uint64_t v15 = type metadata accessor for Metadata();
    (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, v14 + *(int *)(v15 + 20), v6);
    sub_1A9631510();
    sub_1A95D325C(a2, a3, (uint64_t)v12, (uint64_t)v9, (uint64_t *)&v31);
    uint64_t v28 = v10;
    long long v34 = v31;
    long long v35 = v32;
    uint64_t v36 = v33;
    sub_1A9631950();
    long long v31 = v34;
    long long v32 = v35;
    uint64_t v33 = v36;
    sub_1A9631920();
    swift_release();
    if (qword_1EB6DE388 != -1) {
      swift_once();
    }
    uint64_t v20 = sub_1A96317F0();
    __swift_project_value_buffer(v20, (uint64_t)qword_1EB6EB630);
    sub_1A9631510();
    sub_1A948A8F8((uint64_t)&v34);
    sub_1A9631510();
    sub_1A948A8F8((uint64_t)&v34);
    os_log_t v21 = sub_1A96317D0();
    os_log_type_t v22 = sub_1A9632230();
    if (os_log_type_enabled(v21, v22))
    {
      uint64_t v23 = swift_slowAlloc();
      uint64_t v24 = swift_slowAlloc();
      v30[0] = v24;
      *(_DWORD *)uint64_t v23 = 141558531;
      *(void *)&long long v31 = 1752392040;
      sub_1A9632350();
      *(_WORD *)(v23 + 12) = 2081;
      sub_1A9631510();
      *(void *)&long long v31 = sub_1A945C1DC(a2, a3, v30);
      sub_1A9632350();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v23 + 22) = 2080;
      sub_1A948A8F8((uint64_t)&v34);
      sub_1A95D6124((uint64_t)&v31);
      sub_1A948A894((uint64_t)&v34);
      uint64_t v25 = sub_1A95D62D8();
      *(void *)&long long v31 = sub_1A945C1DC(v25, v26, v30);
      sub_1A9632350();
      swift_bridgeObjectRelease();
      sub_1A948A894((uint64_t)&v34);
      sub_1A948A894((uint64_t)&v34);
      _os_log_impl(&dword_1A9410000, v21, v22, "Just cached tideEvents; identifier=%{private,mask.hash}s. It's valid for another %s",
        (uint8_t *)v23,
        0x20u);
      swift_arrayDestroy();
      MEMORY[0x1AD0F7300](v24, -1, -1);
      MEMORY[0x1AD0F7300](v23, -1, -1);

      sub_1A948A894((uint64_t)&v34);
    }
    else
    {
      sub_1A948A894((uint64_t)&v34);
      swift_bridgeObjectRelease_n();
      sub_1A948A894((uint64_t)&v34);
      sub_1A948A894((uint64_t)&v34);
    }
    sub_1A961218C();
    sub_1A9612638();
    sub_1A9610CE8(a2, a3, *(double *)(a1 + *(int *)(v28 + 28)), *(double *)(a1 + *(int *)(v28 + 28) + 8));
    swift_release();
  }
  else
  {
    if (qword_1EB6DE388 != -1) {
      swift_once();
    }
    uint64_t v16 = sub_1A96317F0();
    __swift_project_value_buffer(v16, (uint64_t)qword_1EB6EB630);
    os_log_t v29 = (os_log_t)sub_1A96317D0();
    os_log_type_t v17 = sub_1A9632230();
    if (os_log_type_enabled(v29, v17))
    {
      uint64_t v18 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v18 = 0;
      _os_log_impl(&dword_1A9410000, v29, v17, "Cannot cache tideEvents due to missing store", v18, 2u);
      MEMORY[0x1AD0F7300](v18, -1, -1);
    }
    os_log_t v19 = v29;
  }
}

void sub_1A95FC8A8(uint64_t a1, unint64_t a2)
{
  uint64_t v4 = sub_1A962E810();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = (char *)&v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v8);
  if (sub_1A95E44F0())
  {
    sub_1A9631510();
    sub_1A962E7F0();
    sub_1A962E760();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    sub_1A95D5B50();
    long long v26 = v23;
    long long v27 = v24;
    uint64_t v28 = v25;
    sub_1A9631950();
    long long v23 = v26;
    long long v24 = v27;
    uint64_t v25 = v28;
    sub_1A9631920();
    swift_release();
    if (qword_1EB6DE388 != -1) {
      swift_once();
    }
    uint64_t v13 = sub_1A96317F0();
    __swift_project_value_buffer(v13, (uint64_t)qword_1EB6EB630);
    sub_1A9631510();
    sub_1A948A8F8((uint64_t)&v26);
    sub_1A9631510();
    sub_1A948A8F8((uint64_t)&v26);
    uint64_t v14 = sub_1A96317D0();
    os_log_type_t v15 = sub_1A9632230();
    if (os_log_type_enabled(v14, v15))
    {
      uint64_t v16 = swift_slowAlloc();
      uint64_t v17 = swift_slowAlloc();
      v22[0] = v17;
      *(_DWORD *)uint64_t v16 = 141558531;
      *(void *)&long long v23 = 1752392040;
      sub_1A9632350();
      *(_WORD *)(v16 + 12) = 2081;
      sub_1A9631510();
      *(void *)&long long v23 = sub_1A945C1DC(a1, a2, v22);
      sub_1A9632350();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v16 + 22) = 2080;
      sub_1A948A8F8((uint64_t)&v26);
      sub_1A95D6124((uint64_t)&v23);
      sub_1A948A894((uint64_t)&v26);
      uint64_t v18 = sub_1A95D62D8();
      *(void *)&long long v23 = sub_1A945C1DC(v18, v19, v22);
      sub_1A9632350();
      swift_bridgeObjectRelease();
      sub_1A948A894((uint64_t)&v26);
      sub_1A948A894((uint64_t)&v26);
      _os_log_impl(&dword_1A9410000, v14, v15, "Just marked tides unavailable; identifier=%{private,mask.hash}s. It's valid for another %s",
        (uint8_t *)v16,
        0x20u);
      swift_arrayDestroy();
      MEMORY[0x1AD0F7300](v17, -1, -1);
      MEMORY[0x1AD0F7300](v16, -1, -1);

      sub_1A948A894((uint64_t)&v26);
    }
    else
    {
      sub_1A948A894((uint64_t)&v26);
      swift_bridgeObjectRelease_n();
      sub_1A948A894((uint64_t)&v26);
      sub_1A948A894((uint64_t)&v26);
    }
    sub_1A961218C();
    sub_1A9612638();
    swift_release();
  }
  else
  {
    if (qword_1EB6DE388 != -1) {
      swift_once();
    }
    uint64_t v9 = sub_1A96317F0();
    __swift_project_value_buffer(v9, (uint64_t)qword_1EB6EB630);
    os_log_t v21 = (os_log_t)sub_1A96317D0();
    os_log_type_t v10 = sub_1A9632230();
    if (os_log_type_enabled(v21, v10))
    {
      uint64_t v11 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v11 = 0;
      _os_log_impl(&dword_1A9410000, v21, v10, "Cannot log tides unavailable data due to missing store", v11, 2u);
      MEMORY[0x1AD0F7300](v11, -1, -1);
    }
    os_log_t v12 = v21;
  }
}

void sub_1A95FCF30(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v6 = sub_1A962E810();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  uint64_t v9 = (char *)&v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for WeatherAlerts();
  MEMORY[0x1F4188790](v10 - 8);
  os_log_t v12 = (char *)&v25 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (sub_1A95E44F0())
  {
    sub_1A961B118(a1, (uint64_t)v12);
    uint64_t v13 = type metadata accessor for Metadata();
    (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, a1 + *(int *)(v13 + 20), v6);
    sub_1A9631510();
    sub_1A95D3AB4(a2, a3, (uint64_t)v12, (uint64_t)v9, (uint64_t *)&v28);
    long long v31 = v28;
    long long v32 = v29;
    uint64_t v33 = v30;
    sub_1A9631950();
    long long v28 = v31;
    long long v29 = v32;
    uint64_t v30 = v33;
    sub_1A9631920();
    swift_release();
    if (qword_1EB6DE388 != -1) {
      swift_once();
    }
    uint64_t v18 = sub_1A96317F0();
    __swift_project_value_buffer(v18, (uint64_t)qword_1EB6EB630);
    sub_1A9631510();
    sub_1A948A8F8((uint64_t)&v31);
    sub_1A9631510();
    sub_1A948A8F8((uint64_t)&v31);
    unint64_t v19 = sub_1A96317D0();
    os_log_type_t v20 = sub_1A9632230();
    if (os_log_type_enabled(v19, v20))
    {
      uint64_t v21 = swift_slowAlloc();
      uint64_t v22 = swift_slowAlloc();
      v27[0] = v22;
      *(_DWORD *)uint64_t v21 = 141558531;
      *(void *)&long long v28 = 1752392040;
      sub_1A9632350();
      *(_WORD *)(v21 + 12) = 2081;
      sub_1A9631510();
      *(void *)&long long v28 = sub_1A945C1DC(a2, a3, v27);
      sub_1A9632350();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v21 + 22) = 2080;
      sub_1A948A8F8((uint64_t)&v31);
      sub_1A95D6124((uint64_t)&v28);
      sub_1A948A894((uint64_t)&v31);
      uint64_t v23 = sub_1A95D62D8();
      *(void *)&long long v28 = sub_1A945C1DC(v23, v24, v27);
      sub_1A9632350();
      swift_bridgeObjectRelease();
      sub_1A948A894((uint64_t)&v31);
      sub_1A948A894((uint64_t)&v31);
      _os_log_impl(&dword_1A9410000, v19, v20, "Just cached weatherAlerts; identifier=%{private,mask.hash}s. It's valid for another %s",
        (uint8_t *)v21,
        0x20u);
      swift_arrayDestroy();
      MEMORY[0x1AD0F7300](v22, -1, -1);
      MEMORY[0x1AD0F7300](v21, -1, -1);

      sub_1A948A894((uint64_t)&v31);
    }
    else
    {
      sub_1A948A894((uint64_t)&v31);
      swift_bridgeObjectRelease_n();
      sub_1A948A894((uint64_t)&v31);
      sub_1A948A894((uint64_t)&v31);
    }
    sub_1A9612AE4();
    sub_1A9612F90();
    swift_release();
  }
  else
  {
    if (qword_1EB6DE388 != -1) {
      swift_once();
    }
    uint64_t v14 = sub_1A96317F0();
    __swift_project_value_buffer(v14, (uint64_t)qword_1EB6EB630);
    os_log_t v26 = (os_log_t)sub_1A96317D0();
    os_log_type_t v15 = sub_1A9632220();
    if (os_log_type_enabled(v26, v15))
    {
      uint64_t v16 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v16 = 0;
      _os_log_impl(&dword_1A9410000, v26, v15, "Cannot cache weatherAlerts due to missing store", v16, 2u);
      MEMORY[0x1AD0F7300](v16, -1, -1);
    }
    os_log_t v17 = v26;
  }
}

void sub_1A95FD5F8(uint64_t a1, unint64_t a2)
{
  uint64_t v4 = sub_1A962E810();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = (char *)&v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v8);
  if (sub_1A95E44F0())
  {
    sub_1A9631510();
    sub_1A962E7F0();
    sub_1A962E760();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    sub_1A95D5B50();
    long long v26 = v23;
    long long v27 = v24;
    uint64_t v28 = v25;
    sub_1A9631950();
    long long v23 = v26;
    long long v24 = v27;
    uint64_t v25 = v28;
    sub_1A9631920();
    swift_release();
    if (qword_1EB6DE388 != -1) {
      swift_once();
    }
    uint64_t v13 = sub_1A96317F0();
    __swift_project_value_buffer(v13, (uint64_t)qword_1EB6EB630);
    sub_1A9631510();
    sub_1A948A8F8((uint64_t)&v26);
    sub_1A9631510();
    sub_1A948A8F8((uint64_t)&v26);
    uint64_t v14 = sub_1A96317D0();
    os_log_type_t v15 = sub_1A9632230();
    if (os_log_type_enabled(v14, v15))
    {
      uint64_t v16 = swift_slowAlloc();
      uint64_t v17 = swift_slowAlloc();
      v22[0] = v17;
      *(_DWORD *)uint64_t v16 = 141558531;
      *(void *)&long long v23 = 1752392040;
      sub_1A9632350();
      *(_WORD *)(v16 + 12) = 2081;
      sub_1A9631510();
      *(void *)&long long v23 = sub_1A945C1DC(a1, a2, v22);
      sub_1A9632350();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v16 + 22) = 2080;
      sub_1A948A8F8((uint64_t)&v26);
      sub_1A95D6124((uint64_t)&v23);
      sub_1A948A894((uint64_t)&v26);
      uint64_t v18 = sub_1A95D62D8();
      *(void *)&long long v23 = sub_1A945C1DC(v18, v19, v22);
      sub_1A9632350();
      swift_bridgeObjectRelease();
      sub_1A948A894((uint64_t)&v26);
      sub_1A948A894((uint64_t)&v26);
      _os_log_impl(&dword_1A9410000, v14, v15, "Just marked weatherAlerts unavailable; identifier=%{private,mask.hash}s. It's valid for another %s",
        (uint8_t *)v16,
        0x20u);
      swift_arrayDestroy();
      MEMORY[0x1AD0F7300](v17, -1, -1);
      MEMORY[0x1AD0F7300](v16, -1, -1);

      sub_1A948A894((uint64_t)&v26);
    }
    else
    {
      sub_1A948A894((uint64_t)&v26);
      swift_bridgeObjectRelease_n();
      sub_1A948A894((uint64_t)&v26);
      sub_1A948A894((uint64_t)&v26);
    }
    sub_1A9612AE4();
    sub_1A9612F90();
    swift_release();
  }
  else
  {
    if (qword_1EB6DE388 != -1) {
      swift_once();
    }
    uint64_t v9 = sub_1A96317F0();
    __swift_project_value_buffer(v9, (uint64_t)qword_1EB6EB630);
    os_log_t v21 = (os_log_t)sub_1A96317D0();
    os_log_type_t v10 = sub_1A9632220();
    if (os_log_type_enabled(v21, v10))
    {
      uint64_t v11 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v11 = 0;
      _os_log_impl(&dword_1A9410000, v21, v10, "Cannot log weatherAlerts unavailable data due to missing store", v11, 2u);
      MEMORY[0x1AD0F7300](v11, -1, -1);
    }
    os_log_t v12 = v21;
  }
}

void sub_1A95FDC80(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v6 = sub_1A962E810();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  uint64_t v9 = (char *)&v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for WeatherChange();
  MEMORY[0x1F4188790](v10 - 8);
  os_log_t v12 = (char *)&v25 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (sub_1A95E44F0())
  {
    sub_1A961B118(a1, (uint64_t)v12);
    uint64_t v13 = type metadata accessor for Metadata();
    (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, a1 + *(int *)(v13 + 20), v6);
    sub_1A9631510();
    sub_1A95D430C(a2, a3, (uint64_t)v12, (uint64_t)v9, (uint64_t *)&v28);
    long long v31 = v28;
    long long v32 = v29;
    uint64_t v33 = v30;
    sub_1A9631950();
    long long v28 = v31;
    long long v29 = v32;
    uint64_t v30 = v33;
    sub_1A9631920();
    swift_release();
    if (qword_1EB6DE388 != -1) {
      swift_once();
    }
    uint64_t v18 = sub_1A96317F0();
    __swift_project_value_buffer(v18, (uint64_t)qword_1EB6EB630);
    sub_1A9631510();
    sub_1A948A8F8((uint64_t)&v31);
    sub_1A9631510();
    sub_1A948A8F8((uint64_t)&v31);
    unint64_t v19 = sub_1A96317D0();
    os_log_type_t v20 = sub_1A9632230();
    if (os_log_type_enabled(v19, v20))
    {
      uint64_t v21 = swift_slowAlloc();
      uint64_t v22 = swift_slowAlloc();
      v27[0] = v22;
      *(_DWORD *)uint64_t v21 = 141558531;
      *(void *)&long long v28 = 1752392040;
      sub_1A9632350();
      *(_WORD *)(v21 + 12) = 2081;
      sub_1A9631510();
      *(void *)&long long v28 = sub_1A945C1DC(a2, a3, v27);
      sub_1A9632350();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v21 + 22) = 2080;
      sub_1A948A8F8((uint64_t)&v31);
      sub_1A95D6124((uint64_t)&v28);
      sub_1A948A894((uint64_t)&v31);
      uint64_t v23 = sub_1A95D62D8();
      *(void *)&long long v28 = sub_1A945C1DC(v23, v24, v27);
      sub_1A9632350();
      swift_bridgeObjectRelease();
      sub_1A948A894((uint64_t)&v31);
      sub_1A948A894((uint64_t)&v31);
      _os_log_impl(&dword_1A9410000, v19, v20, "Just cached weatherChange; identifier=%{private,mask.hash}s. It's valid for another %s",
        (uint8_t *)v21,
        0x20u);
      swift_arrayDestroy();
      MEMORY[0x1AD0F7300](v22, -1, -1);
      MEMORY[0x1AD0F7300](v21, -1, -1);

      sub_1A948A894((uint64_t)&v31);
    }
    else
    {
      sub_1A948A894((uint64_t)&v31);
      swift_bridgeObjectRelease_n();
      sub_1A948A894((uint64_t)&v31);
      sub_1A948A894((uint64_t)&v31);
    }
    sub_1A961343C();
    sub_1A96138E8();
    swift_release();
  }
  else
  {
    if (qword_1EB6DE388 != -1) {
      swift_once();
    }
    uint64_t v14 = sub_1A96317F0();
    __swift_project_value_buffer(v14, (uint64_t)qword_1EB6EB630);
    os_log_t v26 = (os_log_t)sub_1A96317D0();
    os_log_type_t v15 = sub_1A9632220();
    if (os_log_type_enabled(v26, v15))
    {
      uint64_t v16 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v16 = 0;
      _os_log_impl(&dword_1A9410000, v26, v15, "Cannot cache weatherChange due to missing store", v16, 2u);
      MEMORY[0x1AD0F7300](v16, -1, -1);
    }
    os_log_t v17 = v26;
  }
}

void sub_1A95FE348(uint64_t a1, unint64_t a2)
{
  uint64_t v4 = sub_1A962E810();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = (char *)&v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v8);
  if (sub_1A95E44F0())
  {
    sub_1A9631510();
    sub_1A962E7F0();
    sub_1A962E760();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    sub_1A95D5B50();
    long long v26 = v23;
    long long v27 = v24;
    uint64_t v28 = v25;
    sub_1A9631950();
    long long v23 = v26;
    long long v24 = v27;
    uint64_t v25 = v28;
    sub_1A9631920();
    swift_release();
    if (qword_1EB6DE388 != -1) {
      swift_once();
    }
    uint64_t v13 = sub_1A96317F0();
    __swift_project_value_buffer(v13, (uint64_t)qword_1EB6EB630);
    sub_1A9631510();
    sub_1A948A8F8((uint64_t)&v26);
    sub_1A9631510();
    sub_1A948A8F8((uint64_t)&v26);
    uint64_t v14 = sub_1A96317D0();
    os_log_type_t v15 = sub_1A9632230();
    if (os_log_type_enabled(v14, v15))
    {
      uint64_t v16 = swift_slowAlloc();
      uint64_t v17 = swift_slowAlloc();
      v22[0] = v17;
      *(_DWORD *)uint64_t v16 = 141558531;
      *(void *)&long long v23 = 1752392040;
      sub_1A9632350();
      *(_WORD *)(v16 + 12) = 2081;
      sub_1A9631510();
      *(void *)&long long v23 = sub_1A945C1DC(a1, a2, v22);
      sub_1A9632350();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v16 + 22) = 2080;
      sub_1A948A8F8((uint64_t)&v26);
      sub_1A95D6124((uint64_t)&v23);
      sub_1A948A894((uint64_t)&v26);
      uint64_t v18 = sub_1A95D62D8();
      *(void *)&long long v23 = sub_1A945C1DC(v18, v19, v22);
      sub_1A9632350();
      swift_bridgeObjectRelease();
      sub_1A948A894((uint64_t)&v26);
      sub_1A948A894((uint64_t)&v26);
      _os_log_impl(&dword_1A9410000, v14, v15, "Just marked weatherChange unavailable; identifier=%{private,mask.hash}s. It's valid for another %s",
        (uint8_t *)v16,
        0x20u);
      swift_arrayDestroy();
      MEMORY[0x1AD0F7300](v17, -1, -1);
      MEMORY[0x1AD0F7300](v16, -1, -1);

      sub_1A948A894((uint64_t)&v26);
    }
    else
    {
      sub_1A948A894((uint64_t)&v26);
      swift_bridgeObjectRelease_n();
      sub_1A948A894((uint64_t)&v26);
      sub_1A948A894((uint64_t)&v26);
    }
    sub_1A961343C();
    sub_1A96138E8();
    swift_release();
  }
  else
  {
    if (qword_1EB6DE388 != -1) {
      swift_once();
    }
    uint64_t v9 = sub_1A96317F0();
    __swift_project_value_buffer(v9, (uint64_t)qword_1EB6EB630);
    os_log_t v21 = (os_log_t)sub_1A96317D0();
    os_log_type_t v10 = sub_1A9632220();
    if (os_log_type_enabled(v21, v10))
    {
      uint64_t v11 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v11 = 0;
      _os_log_impl(&dword_1A9410000, v21, v10, "Cannot mark weatherChange unavailable data due to missing store", v11, 2u);
      MEMORY[0x1AD0F7300](v11, -1, -1);
    }
    os_log_t v12 = v21;
  }
}

void sub_1A95FE9D0(uint64_t *a1, uint64_t a2, unint64_t a3)
{
  uint64_t v7 = sub_1A962E810();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x1F4188790](v7);
  os_log_type_t v10 = (char *)&v36 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for WeatherComparisons();
  MEMORY[0x1F4188790](v11 - 8);
  uint64_t v13 = (char *)&v36 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6DA880);
  MEMORY[0x1F4188790](v14 - 8);
  uint64_t v16 = (char *)&v36 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = type metadata accessor for WeatherComparison();
  MEMORY[0x1F4188790](v17);
  uint64_t v36 = v3;
  os_log_t v37 = (os_log_t)((char *)&v36 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0));
  if (sub_1A95E44F0())
  {
    sub_1A94763E0(*a1, (uint64_t)v16);
    if (__swift_getEnumTagSinglePayload((uint64_t)v16, 1, v17) == 1)
    {
      sub_1A944C480((uint64_t)v16, &qword_1EB6DA880);
      if (qword_1EB6DE388 != -1) {
        swift_once();
      }
      uint64_t v19 = sub_1A96317F0();
      __swift_project_value_buffer(v19, (uint64_t)qword_1EB6EB630);
      uint64_t v20 = sub_1A96317D0();
      os_log_type_t v21 = sub_1A9632230();
      if (os_log_type_enabled(v20, v21))
      {
        uint64_t v22 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v22 = 0;
        _os_log_impl(&dword_1A9410000, v20, v21, "Cannot cache weatherComparisons as the object didn't contain any comparisons", v22, 2u);
        MEMORY[0x1AD0F7300](v22, -1, -1);
        swift_release();
      }
      else
      {

        swift_release();
      }
    }
    else
    {
      os_log_t v27 = v37;
      sub_1A9449580((uint64_t)v16, (uint64_t)v37);
      sub_1A961B118((uint64_t)a1, (uint64_t)v13);
      uint64_t v28 = type metadata accessor for Metadata();
      (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v10, (char *)v27 + *(int *)(v28 + 20), v7);
      sub_1A9631510();
      sub_1A95D4B64(a2, a3, (uint64_t)v13, (uint64_t)v10, (uint64_t *)&v39);
      long long v42 = v39;
      long long v43 = v40;
      uint64_t v44 = v41;
      sub_1A9631950();
      long long v39 = v42;
      long long v40 = v43;
      uint64_t v41 = v44;
      sub_1A9631920();
      swift_release();
      if (qword_1EB6DE388 != -1) {
        swift_once();
      }
      uint64_t v29 = sub_1A96317F0();
      __swift_project_value_buffer(v29, (uint64_t)qword_1EB6EB630);
      sub_1A9631510();
      sub_1A948A8F8((uint64_t)&v42);
      sub_1A9631510();
      sub_1A948A8F8((uint64_t)&v42);
      uint64_t v30 = sub_1A96317D0();
      os_log_type_t v31 = sub_1A9632230();
      if (os_log_type_enabled(v30, v31))
      {
        uint64_t v32 = swift_slowAlloc();
        uint64_t v33 = swift_slowAlloc();
        v38[0] = v33;
        *(_DWORD *)uint64_t v32 = 141558531;
        *(void *)&long long v39 = 1752392040;
        sub_1A9632350();
        *(_WORD *)(v32 + 12) = 2081;
        sub_1A9631510();
        *(void *)&long long v39 = sub_1A945C1DC(a2, a3, v38);
        sub_1A9632350();
        swift_bridgeObjectRelease_n();
        *(_WORD *)(v32 + 22) = 2080;
        sub_1A948A8F8((uint64_t)&v42);
        sub_1A95D6124((uint64_t)&v39);
        sub_1A948A894((uint64_t)&v42);
        uint64_t v34 = sub_1A95D62D8();
        *(void *)&long long v39 = sub_1A945C1DC(v34, v35, v38);
        sub_1A9632350();
        swift_bridgeObjectRelease();
        sub_1A948A894((uint64_t)&v42);
        sub_1A948A894((uint64_t)&v42);
        _os_log_impl(&dword_1A9410000, v30, v31, "Just cached weatherComparisons; identifier=%{private,mask.hash}s. It's valid for another %s",
          (uint8_t *)v32,
          0x20u);
        swift_arrayDestroy();
        MEMORY[0x1AD0F7300](v33, -1, -1);
        MEMORY[0x1AD0F7300](v32, -1, -1);

        sub_1A948A894((uint64_t)&v42);
      }
      else
      {
        sub_1A948A894((uint64_t)&v42);
        swift_bridgeObjectRelease_n();
        sub_1A948A894((uint64_t)&v42);
        sub_1A948A894((uint64_t)&v42);
      }
      sub_1A9613D94();
      sub_1A9614240();
      swift_release();
      sub_1A961B3A4((uint64_t)v37, (void (*)(void))type metadata accessor for WeatherComparison);
    }
  }
  else
  {
    if (qword_1EB6DE388 != -1) {
      swift_once();
    }
    uint64_t v23 = sub_1A96317F0();
    __swift_project_value_buffer(v23, (uint64_t)qword_1EB6EB630);
    os_log_t v37 = (os_log_t)sub_1A96317D0();
    os_log_type_t v24 = sub_1A9632220();
    if (os_log_type_enabled(v37, v24))
    {
      uint64_t v25 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v25 = 0;
      _os_log_impl(&dword_1A9410000, v37, v24, "Cannot cache weatherComparisons data due to missing store", v25, 2u);
      MEMORY[0x1AD0F7300](v25, -1, -1);
    }
    os_log_t v26 = v37;
  }
}

void sub_1A95FF280(uint64_t a1, unint64_t a2)
{
  uint64_t v4 = sub_1A962E810();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = (char *)&v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v8);
  if (sub_1A95E44F0())
  {
    sub_1A9631510();
    sub_1A962E7F0();
    sub_1A962E760();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    sub_1A95D5B50();
    long long v26 = v23;
    long long v27 = v24;
    uint64_t v28 = v25;
    sub_1A9631950();
    long long v23 = v26;
    long long v24 = v27;
    uint64_t v25 = v28;
    sub_1A9631920();
    swift_release();
    if (qword_1EB6DE388 != -1) {
      swift_once();
    }
    uint64_t v13 = sub_1A96317F0();
    __swift_project_value_buffer(v13, (uint64_t)qword_1EB6EB630);
    sub_1A9631510();
    sub_1A948A8F8((uint64_t)&v26);
    sub_1A9631510();
    sub_1A948A8F8((uint64_t)&v26);
    uint64_t v14 = sub_1A96317D0();
    os_log_type_t v15 = sub_1A9632230();
    if (os_log_type_enabled(v14, v15))
    {
      uint64_t v16 = swift_slowAlloc();
      uint64_t v17 = swift_slowAlloc();
      v22[0] = v17;
      *(_DWORD *)uint64_t v16 = 141558531;
      *(void *)&long long v23 = 1752392040;
      sub_1A9632350();
      *(_WORD *)(v16 + 12) = 2081;
      sub_1A9631510();
      *(void *)&long long v23 = sub_1A945C1DC(a1, a2, v22);
      sub_1A9632350();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v16 + 22) = 2080;
      sub_1A948A8F8((uint64_t)&v26);
      sub_1A95D6124((uint64_t)&v23);
      sub_1A948A894((uint64_t)&v26);
      uint64_t v18 = sub_1A95D62D8();
      *(void *)&long long v23 = sub_1A945C1DC(v18, v19, v22);
      sub_1A9632350();
      swift_bridgeObjectRelease();
      sub_1A948A894((uint64_t)&v26);
      sub_1A948A894((uint64_t)&v26);
      _os_log_impl(&dword_1A9410000, v14, v15, "Just marked weatherComparisons unavailable; identifier=%{private,mask.hash}s. It's valid for another %s",
        (uint8_t *)v16,
        0x20u);
      swift_arrayDestroy();
      MEMORY[0x1AD0F7300](v17, -1, -1);
      MEMORY[0x1AD0F7300](v16, -1, -1);

      sub_1A948A894((uint64_t)&v26);
    }
    else
    {
      sub_1A948A894((uint64_t)&v26);
      swift_bridgeObjectRelease_n();
      sub_1A948A894((uint64_t)&v26);
      sub_1A948A894((uint64_t)&v26);
    }
    sub_1A9613D94();
    sub_1A96138E8();
    swift_release();
  }
  else
  {
    if (qword_1EB6DE388 != -1) {
      swift_once();
    }
    uint64_t v9 = sub_1A96317F0();
    __swift_project_value_buffer(v9, (uint64_t)qword_1EB6EB630);
    os_log_t v21 = (os_log_t)sub_1A96317D0();
    os_log_type_t v10 = sub_1A9632220();
    if (os_log_type_enabled(v21, v10))
    {
      uint64_t v11 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v11 = 0;
      _os_log_impl(&dword_1A9410000, v21, v10, "Cannot mark weatherComparisons unavailable data due to missing store", v11, 2u);
      MEMORY[0x1AD0F7300](v11, -1, -1);
    }
    os_log_t v12 = v21;
  }
}

void sub_1A95FF908(uint64_t *a1, uint64_t a2, unint64_t a3)
{
  uint64_t v52 = a2;
  unint64_t v53 = a3;
  uint64_t v5 = sub_1A962E810();
  uint64_t v49 = *(void *)(v5 - 8);
  uint64_t v50 = v5;
  MEMORY[0x1F4188790](v5);
  uint64_t v51 = (char *)v47 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E97ED278);
  MEMORY[0x1F4188790](v7 - 8);
  os_log_t v54 = (os_log_t)((char *)v47 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v9 = type metadata accessor for HistoricalFact();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x1F4188790](v9);
  os_log_t v12 = (char *)v47 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v13);
  os_log_type_t v15 = (char *)v47 - v14;
  MEMORY[0x1F4188790](v16);
  uint64_t v18 = (char *)v47 - v17;
  uint64_t v19 = *a1;
  uint64_t v20 = sub_1A95E44F0();
  if (v20)
  {
    uint64_t v48 = v18;
    v47[1] = v3;
    uint64_t v21 = *(void *)(v19 + 16);
    if (v21)
    {
      v47[2] = v20;
      uint64_t v22 = v19 + ((*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80));
      sub_1A961B118(v22, (uint64_t)v15);
      sub_1A9631510();
      if (v21 != 1)
      {
        unint64_t v23 = 1;
        while (v23 < *(void *)(v19 + 16))
        {
          sub_1A961B118(v22 + *(void *)(v10 + 72) * v23, (uint64_t)v12);
          type metadata accessor for Metadata();
          if (sub_1A962E750())
          {
            sub_1A961B3A4((uint64_t)v15, (void (*)(void))type metadata accessor for HistoricalFact);
            sub_1A9449580((uint64_t)v12, (uint64_t)v15);
          }
          else
          {
            sub_1A961B3A4((uint64_t)v12, (void (*)(void))type metadata accessor for HistoricalFact);
          }
          if (v21 == ++v23) {
            goto LABEL_10;
          }
        }
        __break(1u);
LABEL_31:
        swift_once();
LABEL_21:
        uint64_t v36 = sub_1A96317F0();
        __swift_project_value_buffer(v36, (uint64_t)qword_1EB6EB630);
        os_log_t v37 = sub_1A96317D0();
        os_log_type_t v38 = sub_1A9632230();
        if (os_log_type_enabled(v37, v38))
        {
          long long v39 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)long long v39 = 0;
          _os_log_impl(&dword_1A9410000, v37, v38, "Cannot cache historicalFacts as the object didn't contain any comparisons", v39, 2u);
          MEMORY[0x1AD0F7300](v39, -1, -1);
          swift_release();
        }
        else
        {

          swift_release();
        }
        return;
      }
LABEL_10:
      uint64_t v24 = (uint64_t)v15;
      os_log_t v25 = v54;
      sub_1A9449580(v24, (uint64_t)v54);
      __swift_storeEnumTagSinglePayload((uint64_t)v25, 0, 1, v9);
      swift_bridgeObjectRelease();
      if (__swift_getEnumTagSinglePayload((uint64_t)v25, 1, v9) != 1)
      {
        uint64_t v26 = (uint64_t)v48;
        sub_1A9449580((uint64_t)v25, (uint64_t)v48);
        uint64_t v27 = v26 + *(int *)(v9 + 40);
        uint64_t v28 = v27 + *(int *)(type metadata accessor for Metadata() + 20);
        uint64_t v29 = (uint64_t)v51;
        (*(void (**)(char *, uint64_t, uint64_t))(v49 + 16))(v51, v28, v50);
        sub_1A9631510();
        unint64_t v30 = v53;
        sub_1A9631510();
        uint64_t v31 = v52;
        sub_1A95D53BC(v52, v30, v19, v29, (uint64_t *)&v56);
        long long v59 = v56;
        long long v60 = v57;
        uint64_t v61 = v58;
        sub_1A9631950();
        long long v56 = v59;
        long long v57 = v60;
        uint64_t v58 = v61;
        sub_1A9631920();
        swift_release();
        if (qword_1EB6DE388 != -1) {
          swift_once();
        }
        uint64_t v40 = sub_1A96317F0();
        __swift_project_value_buffer(v40, (uint64_t)qword_1EB6EB630);
        sub_1A9631510();
        sub_1A948A8F8((uint64_t)&v59);
        sub_1A9631510();
        sub_1A948A8F8((uint64_t)&v59);
        uint64_t v41 = sub_1A96317D0();
        os_log_type_t v42 = sub_1A9632230();
        if (os_log_type_enabled(v41, v42))
        {
          uint64_t v43 = swift_slowAlloc();
          uint64_t v44 = swift_slowAlloc();
          v55[0] = v44;
          *(_DWORD *)uint64_t v43 = 141558531;
          *(void *)&long long v56 = 1752392040;
          sub_1A9632350();
          *(_WORD *)(v43 + 12) = 2081;
          sub_1A9631510();
          *(void *)&long long v56 = sub_1A945C1DC(v31, v30, v55);
          sub_1A9632350();
          swift_bridgeObjectRelease_n();
          *(_WORD *)(v43 + 22) = 2080;
          sub_1A948A8F8((uint64_t)&v59);
          sub_1A95D6124((uint64_t)&v56);
          sub_1A948A894((uint64_t)&v59);
          uint64_t v45 = sub_1A95D62D8();
          *(void *)&long long v56 = sub_1A945C1DC(v45, v46, v55);
          uint64_t v26 = (uint64_t)v48;
          sub_1A9632350();
          swift_bridgeObjectRelease();
          sub_1A948A894((uint64_t)&v59);
          sub_1A948A894((uint64_t)&v59);
          _os_log_impl(&dword_1A9410000, v41, v42, "Just cached historicalFacts; identifier=%{private,mask.hash}s. It's valid for another %s",
            (uint8_t *)v43,
            0x20u);
          swift_arrayDestroy();
          MEMORY[0x1AD0F7300](v44, -1, -1);
          MEMORY[0x1AD0F7300](v43, -1, -1);

          sub_1A948A894((uint64_t)&v59);
        }
        else
        {
          sub_1A948A894((uint64_t)&v59);
          swift_bridgeObjectRelease_n();
          sub_1A948A894((uint64_t)&v59);
          sub_1A948A894((uint64_t)&v59);
        }
        sub_1A96146EC();
        sub_1A9614B98();
        swift_release();
        sub_1A961B3A4(v26, (void (*)(void))type metadata accessor for HistoricalFact);
        return;
      }
    }
    else
    {
      os_log_t v25 = v54;
      __swift_storeEnumTagSinglePayload((uint64_t)v54, 1, 1, v9);
    }
    sub_1A944C480((uint64_t)v25, &qword_1E97ED278);
    if (qword_1EB6DE388 == -1) {
      goto LABEL_21;
    }
    goto LABEL_31;
  }
  if (qword_1EB6DE388 != -1) {
    swift_once();
  }
  uint64_t v32 = sub_1A96317F0();
  __swift_project_value_buffer(v32, (uint64_t)qword_1EB6EB630);
  os_log_t v54 = (os_log_t)sub_1A96317D0();
  os_log_type_t v33 = sub_1A9632220();
  if (os_log_type_enabled(v54, v33))
  {
    uint64_t v34 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v34 = 0;
    _os_log_impl(&dword_1A9410000, v54, v33, "Cannot cache historicalFacts data due to missing store", v34, 2u);
    MEMORY[0x1AD0F7300](v34, -1, -1);
  }
  os_log_t v35 = v54;
}

void sub_1A960034C(uint64_t a1, unint64_t a2)
{
  uint64_t v4 = sub_1A962E810();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = (char *)&v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v8);
  if (sub_1A95E44F0())
  {
    sub_1A9631510();
    sub_1A962E7F0();
    sub_1A962E760();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    sub_1A95D5B50();
    long long v26 = v23;
    long long v27 = v24;
    uint64_t v28 = v25;
    sub_1A9631950();
    long long v23 = v26;
    long long v24 = v27;
    uint64_t v25 = v28;
    sub_1A9631920();
    swift_release();
    if (qword_1EB6DE388 != -1) {
      swift_once();
    }
    uint64_t v13 = sub_1A96317F0();
    __swift_project_value_buffer(v13, (uint64_t)qword_1EB6EB630);
    sub_1A9631510();
    sub_1A948A8F8((uint64_t)&v26);
    sub_1A9631510();
    sub_1A948A8F8((uint64_t)&v26);
    uint64_t v14 = sub_1A96317D0();
    os_log_type_t v15 = sub_1A9632230();
    if (os_log_type_enabled(v14, v15))
    {
      uint64_t v16 = swift_slowAlloc();
      uint64_t v17 = swift_slowAlloc();
      v22[0] = v17;
      *(_DWORD *)uint64_t v16 = 141558531;
      *(void *)&long long v23 = 1752392040;
      sub_1A9632350();
      *(_WORD *)(v16 + 12) = 2081;
      sub_1A9631510();
      *(void *)&long long v23 = sub_1A945C1DC(a1, a2, v22);
      sub_1A9632350();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v16 + 22) = 2080;
      sub_1A948A8F8((uint64_t)&v26);
      sub_1A95D6124((uint64_t)&v23);
      sub_1A948A894((uint64_t)&v26);
      uint64_t v18 = sub_1A95D62D8();
      *(void *)&long long v23 = sub_1A945C1DC(v18, v19, v22);
      sub_1A9632350();
      swift_bridgeObjectRelease();
      sub_1A948A894((uint64_t)&v26);
      sub_1A948A894((uint64_t)&v26);
      _os_log_impl(&dword_1A9410000, v14, v15, "Just marked historicalFacts unavailable; identifier=%{private,mask.hash}s. It's valid for another %s",
        (uint8_t *)v16,
        0x20u);
      swift_arrayDestroy();
      MEMORY[0x1AD0F7300](v17, -1, -1);
      MEMORY[0x1AD0F7300](v16, -1, -1);

      sub_1A948A894((uint64_t)&v26);
    }
    else
    {
      sub_1A948A894((uint64_t)&v26);
      swift_bridgeObjectRelease_n();
      sub_1A948A894((uint64_t)&v26);
      sub_1A948A894((uint64_t)&v26);
    }
    sub_1A96146EC();
    sub_1A9614B98();
    swift_release();
  }
  else
  {
    if (qword_1EB6DE388 != -1) {
      swift_once();
    }
    uint64_t v9 = sub_1A96317F0();
    __swift_project_value_buffer(v9, (uint64_t)qword_1EB6EB630);
    os_log_t v21 = (os_log_t)sub_1A96317D0();
    os_log_type_t v10 = sub_1A9632220();
    if (os_log_type_enabled(v21, v10))
    {
      uint64_t v11 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v11 = 0;
      _os_log_impl(&dword_1A9410000, v21, v10, "Cannot mark historicalFacts unavailable data due to missing store", v11, 2u);
      MEMORY[0x1AD0F7300](v11, -1, -1);
    }
    os_log_t v12 = v21;
  }
}

uint64_t sub_1A96009D4@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t *a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v55 = a4;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6DE088);
  MEMORY[0x1F4188790](v7 - 8);
  uint64_t v50 = (uint64_t)&v45 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v57 = type metadata accessor for AirQuality();
  MEMORY[0x1F4188790](v57);
  uint64_t v48 = (uint64_t)&v45 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6DDBD8);
  MEMORY[0x1F4188790](v10 - 8);
  os_log_t v12 = (char *)&v45 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_1A9631860();
  uint64_t v51 = *(void *)(v13 - 8);
  uint64_t v52 = v13;
  MEMORY[0x1F4188790](v13);
  os_log_type_t v15 = (char *)&v45 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v49 = *a3;
  if (qword_1EB6DE388 != -1) {
    swift_once();
  }
  uint64_t v56 = a1;
  uint64_t v16 = sub_1A96317F0();
  uint64_t v17 = __swift_project_value_buffer(v16, (uint64_t)qword_1EB6EB630);
  swift_bridgeObjectRetain_n();
  uint64_t v53 = v17;
  uint64_t v18 = sub_1A96317D0();
  os_log_type_t v19 = sub_1A9632230();
  if (os_log_type_enabled(v18, v19))
  {
    uint64_t v20 = swift_slowAlloc();
    uint64_t v21 = swift_slowAlloc();
    uint64_t v64 = v21;
    *(_DWORD *)uint64_t v20 = 141558275;
    uint64_t v59 = 1752392040;
    sub_1A9632350();
    *(_WORD *)(v20 + 12) = 2081;
    sub_1A9631510();
    uint64_t v59 = sub_1A945C1DC(v56, a2, &v64);
    sub_1A9632350();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_1A9410000, v18, v19, "Attempting to retrieve airQuality from cache; identifier=%{private,mask.hash}s",
      (uint8_t *)v20,
      0x16u);
    swift_arrayDestroy();
    MEMORY[0x1AD0F7300](v21, -1, -1);
    MEMORY[0x1AD0F7300](v20, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  if (!sub_1A95E44F0())
  {
    long long v24 = sub_1A96317D0();
    os_log_type_t v25 = sub_1A9632230();
    if (os_log_type_enabled(v24, v25))
    {
      long long v26 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)long long v26 = 0;
      _os_log_impl(&dword_1A9410000, v24, v25, "Cannot retrieve cached airQuality due to missing store", v26, 2u);
      MEMORY[0x1AD0F7300](v26, -1, -1);
    }

    goto LABEL_14;
  }
  sub_1A9631960();
  uint64_t v67 = MEMORY[0x1E4FBB1A0];
  uint64_t v68 = MEMORY[0x1E4FAA778];
  uint64_t v22 = v56;
  uint64_t v64 = v56;
  unint64_t v65 = a2;
  sub_1A9631510();
  sub_1A96318F0();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v64);
  uint64_t v23 = sub_1A96319F0();
  __swift_storeEnumTagSinglePayload((uint64_t)v12, 1, 1, v23);
  sub_1A9631930();
  swift_release();
  sub_1A944C480((uint64_t)v12, &qword_1EB6DDBD8);
  (*(void (**)(char *, uint64_t))(v51 + 8))(v15, v52);
  uint64_t v27 = v59;
  if (!v59)
  {
    swift_bridgeObjectRetain_n();
    os_log_t v35 = sub_1A96317D0();
    os_log_type_t v36 = sub_1A9632230();
    if (os_log_type_enabled(v35, v36))
    {
      uint64_t v37 = swift_slowAlloc();
      uint64_t v38 = swift_slowAlloc();
      uint64_t v64 = v38;
      *(_DWORD *)uint64_t v37 = 141558275;
      uint64_t v59 = 1752392040;
      sub_1A9632350();
      *(_WORD *)(v37 + 12) = 2081;
      sub_1A9631510();
      uint64_t v59 = sub_1A945C1DC(v22, a2, &v64);
      sub_1A9632350();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_1A9410000, v35, v36, "Could not find airQuality data in cache; identifier=%{private,mask.hash}s",
        (uint8_t *)v37,
        0x16u);
      uint64_t v33 = 1;
      swift_arrayDestroy();
      MEMORY[0x1AD0F7300](v38, -1, -1);
      MEMORY[0x1AD0F7300](v37, -1, -1);
      swift_release();

      return __swift_storeEnumTagSinglePayload(v55, v33, 1, v57);
    }

    swift_bridgeObjectRelease_n();
    swift_release();
    goto LABEL_14;
  }
  unint64_t v29 = v60;
  uint64_t v28 = v61;
  uint64_t v31 = v62;
  uint64_t v30 = v63;
  uint64_t v64 = v59;
  unint64_t v65 = v60;
  uint64_t v66 = v61;
  uint64_t v67 = v62;
  uint64_t v68 = v63;
  uint64_t v32 = v50;
  sub_1A95D682C(v49, v50);
  if (__swift_getEnumTagSinglePayload(v32, 1, v57) == 1)
  {
    sub_1A948A95C(v27);
    swift_release();
    sub_1A944C480(v32, &qword_1EB6DE088);
LABEL_14:
    uint64_t v33 = 1;
    return __swift_storeEnumTagSinglePayload(v55, v33, 1, v57);
  }
  uint64_t v46 = v27;
  unint64_t v47 = v29;
  uint64_t v49 = v28;
  uint64_t v51 = v31;
  uint64_t v52 = v30;
  sub_1A9449580(v32, v48);
  swift_bridgeObjectRetain_n();
  long long v39 = sub_1A96317D0();
  os_log_type_t v40 = sub_1A9632230();
  os_log_t v54 = v39;
  if (os_log_type_enabled(v39, v40))
  {
    uint64_t v41 = v22;
    uint64_t v42 = swift_slowAlloc();
    uint64_t v43 = swift_slowAlloc();
    uint64_t v59 = v43;
    *(_DWORD *)uint64_t v42 = 141558275;
    uint64_t v58 = 1752392040;
    sub_1A9632350();
    *(_WORD *)(v42 + 12) = 2081;
    sub_1A9631510();
    uint64_t v58 = sub_1A945C1DC(v41, a2, &v59);
    sub_1A9632350();
    swift_bridgeObjectRelease_n();
    os_log_t v44 = v54;
    _os_log_impl(&dword_1A9410000, v54, v40, "Successfully retrieved airQuality from cache; identifier=%{private,mask.hash}s",
      (uint8_t *)v42,
      0x16u);
    swift_arrayDestroy();
    MEMORY[0x1AD0F7300](v43, -1, -1);
    MEMORY[0x1AD0F7300](v42, -1, -1);
    sub_1A948A95C(v46);
    swift_release();
  }
  else
  {
    swift_bridgeObjectRelease_n();
    sub_1A948A95C(v46);

    swift_release();
  }
  sub_1A9449580(v48, v55);
  uint64_t v33 = 0;
  return __swift_storeEnumTagSinglePayload(v55, v33, 1, v57);
}

uint64_t sub_1A9601404(uint64_t a1, unint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v40 = a1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6DDBD8);
  MEMORY[0x1F4188790](v5 - 8);
  uint64_t v7 = (char *)v37 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_1A9631860();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8);
  uint64_t v11 = (char *)v37 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1EB6DE388 != -1) {
    swift_once();
  }
  uint64_t v12 = sub_1A96317F0();
  uint64_t v13 = __swift_project_value_buffer(v12, (uint64_t)qword_1EB6EB630);
  swift_bridgeObjectRetain_n();
  uint64_t v39 = v13;
  uint64_t v14 = sub_1A96317D0();
  os_log_type_t v15 = sub_1A9632230();
  if (os_log_type_enabled(v14, v15))
  {
    uint64_t v16 = swift_slowAlloc();
    v37[1] = v3;
    uint64_t v17 = v16;
    uint64_t v18 = swift_slowAlloc();
    uint64_t v38 = v9;
    uint64_t v19 = v8;
    uint64_t v20 = v18;
    uint64_t v42 = v18;
    *(_DWORD *)uint64_t v17 = 141558275;
    v41[0] = 1752392040;
    sub_1A9632350();
    *(_WORD *)(v17 + 12) = 2081;
    sub_1A9631510();
    v41[0] = sub_1A945C1DC(v40, a2, &v42);
    sub_1A9632350();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_1A9410000, v14, v15, "Attempting to retrieve airQuality unavailable from cache; identifier=%{private,mask.hash}s",
      (uint8_t *)v17,
      0x16u);
    swift_arrayDestroy();
    uint64_t v21 = v20;
    uint64_t v8 = v19;
    uint64_t v9 = v38;
    MEMORY[0x1AD0F7300](v21, -1, -1);
    MEMORY[0x1AD0F7300](v17, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  if (!sub_1A95E44F0())
  {
    long long v24 = sub_1A96317D0();
    os_log_type_t v25 = sub_1A9632230();
    if (os_log_type_enabled(v24, v25))
    {
      long long v26 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)long long v26 = 0;
      _os_log_impl(&dword_1A9410000, v24, v25, "Cannot retrieve cached airQuality unavailable due to missing store", v26, 2u);
      MEMORY[0x1AD0F7300](v26, -1, -1);
    }

    return 0;
  }
  sub_1A9631960();
  v41[3] = MEMORY[0x1E4FBB1A0];
  v41[4] = MEMORY[0x1E4FAA778];
  uint64_t v22 = v40;
  v41[0] = v40;
  v41[1] = a2;
  sub_1A9631510();
  sub_1A96318F0();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v41);
  uint64_t v23 = sub_1A96319F0();
  __swift_storeEnumTagSinglePayload((uint64_t)v7, 1, 1, v23);
  sub_1A9631930();
  swift_release();
  sub_1A944C480((uint64_t)v7, &qword_1EB6DDBD8);
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  uint64_t v27 = v42;
  sub_1A948A95C(v42);
  swift_bridgeObjectRetain_n();
  uint64_t v28 = sub_1A96317D0();
  uint64_t v29 = sub_1A9632230();
  BOOL v30 = os_log_type_enabled(v28, (os_log_type_t)v29);
  if (!v27)
  {
    if (v30)
    {
      uint64_t v35 = swift_slowAlloc();
      uint64_t v36 = swift_slowAlloc();
      uint64_t v42 = v36;
      *(_DWORD *)uint64_t v35 = 141558275;
      v41[0] = 1752392040;
      sub_1A9632350();
      *(_WORD *)(v35 + 12) = 2081;
      sub_1A9631510();
      v41[0] = sub_1A945C1DC(v22, a2, &v42);
      sub_1A9632350();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_1A9410000, v28, (os_log_type_t)v29, "Could not find airQuality unavailable data in cache; identifier=%{private,mask.hash}s",
        (uint8_t *)v35,
        0x16u);
      swift_arrayDestroy();
      MEMORY[0x1AD0F7300](v36, -1, -1);
      MEMORY[0x1AD0F7300](v35, -1, -1);
      swift_release();
    }
    else
    {

      swift_bridgeObjectRelease_n();
      swift_release();
    }
    return 0;
  }
  if (v30)
  {
    uint64_t v31 = swift_slowAlloc();
    uint64_t v32 = swift_slowAlloc();
    uint64_t v42 = v32;
    *(_DWORD *)uint64_t v31 = 141558275;
    v41[0] = 1752392040;
    sub_1A9632350();
    *(_WORD *)(v31 + 12) = 2081;
    sub_1A9631510();
    v41[0] = sub_1A945C1DC(v22, a2, &v42);
    sub_1A9632350();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_1A9410000, v28, (os_log_type_t)v29, "Successfully retrieved airQuality unavailable from cache; identifier=%{private,mask.hash}s",
      (uint8_t *)v31,
      0x16u);
    uint64_t v33 = 1;
    swift_arrayDestroy();
    MEMORY[0x1AD0F7300](v32, -1, -1);
    MEMORY[0x1AD0F7300](v31, -1, -1);
    swift_release();
  }
  else
  {

    swift_release();
    swift_bridgeObjectRelease_n();
    return 1;
  }
  return v33;
}

uint64_t sub_1A9601C4C@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t *a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v55 = a4;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6DDC38);
  MEMORY[0x1F4188790](v7 - 8);
  uint64_t v50 = (uint64_t)&v45 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v57 = type metadata accessor for CurrentWeather();
  MEMORY[0x1F4188790](v57);
  uint64_t v48 = (uint64_t)&v45 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6DDBD8);
  MEMORY[0x1F4188790](v10 - 8);
  uint64_t v12 = (char *)&v45 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_1A9631860();
  uint64_t v51 = *(void *)(v13 - 8);
  uint64_t v52 = v13;
  MEMORY[0x1F4188790](v13);
  os_log_type_t v15 = (char *)&v45 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v49 = *a3;
  if (qword_1EB6DE388 != -1) {
    swift_once();
  }
  uint64_t v56 = a1;
  uint64_t v16 = sub_1A96317F0();
  uint64_t v17 = __swift_project_value_buffer(v16, (uint64_t)qword_1EB6EB630);
  swift_bridgeObjectRetain_n();
  uint64_t v53 = v17;
  uint64_t v18 = sub_1A96317D0();
  os_log_type_t v19 = sub_1A9632230();
  if (os_log_type_enabled(v18, v19))
  {
    uint64_t v20 = swift_slowAlloc();
    uint64_t v21 = swift_slowAlloc();
    uint64_t v64 = v21;
    *(_DWORD *)uint64_t v20 = 141558275;
    uint64_t v59 = 1752392040;
    sub_1A9632350();
    *(_WORD *)(v20 + 12) = 2081;
    sub_1A9631510();
    uint64_t v59 = sub_1A945C1DC(v56, a2, &v64);
    sub_1A9632350();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_1A9410000, v18, v19, "Attempting to retrieve currentWeather from cache; identifier=%{private,mask.hash}s",
      (uint8_t *)v20,
      0x16u);
    swift_arrayDestroy();
    MEMORY[0x1AD0F7300](v21, -1, -1);
    MEMORY[0x1AD0F7300](v20, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  if (!sub_1A95E44F0())
  {
    long long v24 = sub_1A96317D0();
    os_log_type_t v25 = sub_1A9632230();
    if (os_log_type_enabled(v24, v25))
    {
      long long v26 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)long long v26 = 0;
      _os_log_impl(&dword_1A9410000, v24, v25, "Cannot retrieve cached currentWeather due to missing store", v26, 2u);
      MEMORY[0x1AD0F7300](v26, -1, -1);
    }

    goto LABEL_14;
  }
  sub_1A9631960();
  uint64_t v67 = MEMORY[0x1E4FBB1A0];
  uint64_t v68 = MEMORY[0x1E4FAA778];
  uint64_t v22 = v56;
  uint64_t v64 = v56;
  unint64_t v65 = a2;
  sub_1A9631510();
  sub_1A96318F0();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v64);
  uint64_t v23 = sub_1A96319F0();
  __swift_storeEnumTagSinglePayload((uint64_t)v12, 1, 1, v23);
  sub_1A9631930();
  swift_release();
  sub_1A944C480((uint64_t)v12, &qword_1EB6DDBD8);
  (*(void (**)(char *, uint64_t))(v51 + 8))(v15, v52);
  uint64_t v27 = v59;
  if (!v59)
  {
    swift_bridgeObjectRetain_n();
    uint64_t v35 = sub_1A96317D0();
    os_log_type_t v36 = sub_1A9632230();
    if (os_log_type_enabled(v35, v36))
    {
      uint64_t v37 = swift_slowAlloc();
      uint64_t v38 = swift_slowAlloc();
      uint64_t v64 = v38;
      *(_DWORD *)uint64_t v37 = 141558275;
      uint64_t v59 = 1752392040;
      sub_1A9632350();
      *(_WORD *)(v37 + 12) = 2081;
      sub_1A9631510();
      uint64_t v59 = sub_1A945C1DC(v22, a2, &v64);
      sub_1A9632350();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_1A9410000, v35, v36, "Could not find currentWeather data in cache; identifier=%{private,mask.hash}s",
        (uint8_t *)v37,
        0x16u);
      uint64_t v33 = 1;
      swift_arrayDestroy();
      MEMORY[0x1AD0F7300](v38, -1, -1);
      MEMORY[0x1AD0F7300](v37, -1, -1);
      swift_release();

      return __swift_storeEnumTagSinglePayload(v55, v33, 1, v57);
    }

    swift_bridgeObjectRelease_n();
    swift_release();
    goto LABEL_14;
  }
  unint64_t v29 = v60;
  uint64_t v28 = v61;
  uint64_t v31 = v62;
  uint64_t v30 = v63;
  uint64_t v64 = v59;
  unint64_t v65 = v60;
  uint64_t v66 = v61;
  uint64_t v67 = v62;
  uint64_t v68 = v63;
  uint64_t v32 = v50;
  sub_1A95D6F7C(v49, v50);
  if (__swift_getEnumTagSinglePayload(v32, 1, v57) == 1)
  {
    sub_1A948A95C(v27);
    swift_release();
    sub_1A944C480(v32, &qword_1EB6DDC38);
LABEL_14:
    uint64_t v33 = 1;
    return __swift_storeEnumTagSinglePayload(v55, v33, 1, v57);
  }
  uint64_t v46 = v27;
  unint64_t v47 = v29;
  uint64_t v49 = v28;
  uint64_t v51 = v31;
  uint64_t v52 = v30;
  sub_1A9449580(v32, v48);
  swift_bridgeObjectRetain_n();
  uint64_t v39 = sub_1A96317D0();
  os_log_type_t v40 = sub_1A9632230();
  os_log_t v54 = v39;
  if (os_log_type_enabled(v39, v40))
  {
    uint64_t v41 = v22;
    uint64_t v42 = swift_slowAlloc();
    uint64_t v43 = swift_slowAlloc();
    uint64_t v59 = v43;
    *(_DWORD *)uint64_t v42 = 141558275;
    uint64_t v58 = 1752392040;
    sub_1A9632350();
    *(_WORD *)(v42 + 12) = 2081;
    sub_1A9631510();
    uint64_t v58 = sub_1A945C1DC(v41, a2, &v59);
    sub_1A9632350();
    swift_bridgeObjectRelease_n();
    os_log_t v44 = v54;
    _os_log_impl(&dword_1A9410000, v54, v40, "Successfully retrieved currentWeather from cache; identifier=%{private,mask.hash}s",
      (uint8_t *)v42,
      0x16u);
    swift_arrayDestroy();
    MEMORY[0x1AD0F7300](v43, -1, -1);
    MEMORY[0x1AD0F7300](v42, -1, -1);
    sub_1A948A95C(v46);
    swift_release();
  }
  else
  {
    swift_bridgeObjectRelease_n();
    sub_1A948A95C(v46);

    swift_release();
  }
  sub_1A9449580(v48, v55);
  uint64_t v33 = 0;
  return __swift_storeEnumTagSinglePayload(v55, v33, 1, v57);
}

uint64_t sub_1A960267C@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t *a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v55 = a4;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6DDBB0);
  MEMORY[0x1F4188790](v7 - 8);
  uint64_t v50 = (uint64_t)&v45 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v57 = type metadata accessor for DailyForecast();
  MEMORY[0x1F4188790](v57);
  uint64_t v48 = (uint64_t)&v45 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6DDBD8);
  MEMORY[0x1F4188790](v10 - 8);
  uint64_t v12 = (char *)&v45 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_1A9631860();
  uint64_t v51 = *(void *)(v13 - 8);
  uint64_t v52 = v13;
  MEMORY[0x1F4188790](v13);
  os_log_type_t v15 = (char *)&v45 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v49 = *a3;
  if (qword_1EB6DE388 != -1) {
    swift_once();
  }
  uint64_t v56 = a1;
  uint64_t v16 = sub_1A96317F0();
  uint64_t v17 = __swift_project_value_buffer(v16, (uint64_t)qword_1EB6EB630);
  swift_bridgeObjectRetain_n();
  uint64_t v53 = v17;
  uint64_t v18 = sub_1A96317D0();
  os_log_type_t v19 = sub_1A9632230();
  if (os_log_type_enabled(v18, v19))
  {
    uint64_t v20 = swift_slowAlloc();
    uint64_t v21 = swift_slowAlloc();
    uint64_t v64 = v21;
    *(_DWORD *)uint64_t v20 = 141558275;
    uint64_t v59 = 1752392040;
    sub_1A9632350();
    *(_WORD *)(v20 + 12) = 2081;
    sub_1A9631510();
    uint64_t v59 = sub_1A945C1DC(v56, a2, &v64);
    sub_1A9632350();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_1A9410000, v18, v19, "Attempting to retrieve dailyForecast from cache; identifier=%{private,mask.hash}s",
      (uint8_t *)v20,
      0x16u);
    swift_arrayDestroy();
    MEMORY[0x1AD0F7300](v21, -1, -1);
    MEMORY[0x1AD0F7300](v20, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  if (!sub_1A95E44F0())
  {
    long long v24 = sub_1A96317D0();
    os_log_type_t v25 = sub_1A9632230();
    if (os_log_type_enabled(v24, v25))
    {
      long long v26 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)long long v26 = 0;
      _os_log_impl(&dword_1A9410000, v24, v25, "Cannot retrieve cached dailyForecast due to missing store", v26, 2u);
      MEMORY[0x1AD0F7300](v26, -1, -1);
    }

    goto LABEL_14;
  }
  sub_1A9631960();
  uint64_t v67 = MEMORY[0x1E4FBB1A0];
  uint64_t v68 = MEMORY[0x1E4FAA778];
  uint64_t v22 = v56;
  uint64_t v64 = v56;
  unint64_t v65 = a2;
  sub_1A9631510();
  sub_1A96318F0();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v64);
  uint64_t v23 = sub_1A96319F0();
  __swift_storeEnumTagSinglePayload((uint64_t)v12, 1, 1, v23);
  sub_1A9631930();
  swift_release();
  sub_1A944C480((uint64_t)v12, &qword_1EB6DDBD8);
  (*(void (**)(char *, uint64_t))(v51 + 8))(v15, v52);
  uint64_t v27 = v59;
  if (!v59)
  {
    swift_bridgeObjectRetain_n();
    uint64_t v35 = sub_1A96317D0();
    os_log_type_t v36 = sub_1A9632230();
    if (os_log_type_enabled(v35, v36))
    {
      uint64_t v37 = swift_slowAlloc();
      uint64_t v38 = swift_slowAlloc();
      uint64_t v64 = v38;
      *(_DWORD *)uint64_t v37 = 141558275;
      uint64_t v59 = 1752392040;
      sub_1A9632350();
      *(_WORD *)(v37 + 12) = 2081;
      sub_1A9631510();
      uint64_t v59 = sub_1A945C1DC(v22, a2, &v64);
      sub_1A9632350();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_1A9410000, v35, v36, "Could not find dailyForecast data in cache; identifier=%{private,mask.hash}s",
        (uint8_t *)v37,
        0x16u);
      uint64_t v33 = 1;
      swift_arrayDestroy();
      MEMORY[0x1AD0F7300](v38, -1, -1);
      MEMORY[0x1AD0F7300](v37, -1, -1);
      swift_release();

      return __swift_storeEnumTagSinglePayload(v55, v33, 1, v57);
    }

    swift_bridgeObjectRelease_n();
    swift_release();
    goto LABEL_14;
  }
  unint64_t v29 = v60;
  uint64_t v28 = v61;
  uint64_t v31 = v62;
  uint64_t v30 = v63;
  uint64_t v64 = v59;
  unint64_t v65 = v60;
  uint64_t v66 = v61;
  uint64_t v67 = v62;
  uint64_t v68 = v63;
  uint64_t v32 = v50;
  sub_1A95D76CC(v49, v50);
  if (__swift_getEnumTagSinglePayload(v32, 1, v57) == 1)
  {
    sub_1A948A95C(v27);
    swift_release();
    sub_1A944C480(v32, &qword_1EB6DDBB0);
LABEL_14:
    uint64_t v33 = 1;
    return __swift_storeEnumTagSinglePayload(v55, v33, 1, v57);
  }
  uint64_t v46 = v27;
  unint64_t v47 = v29;
  uint64_t v49 = v28;
  uint64_t v51 = v31;
  uint64_t v52 = v30;
  sub_1A9449580(v32, v48);
  swift_bridgeObjectRetain_n();
  uint64_t v39 = sub_1A96317D0();
  os_log_type_t v40 = sub_1A9632230();
  os_log_t v54 = v39;
  if (os_log_type_enabled(v39, v40))
  {
    uint64_t v41 = v22;
    uint64_t v42 = swift_slowAlloc();
    uint64_t v43 = swift_slowAlloc();
    uint64_t v59 = v43;
    *(_DWORD *)uint64_t v42 = 141558275;
    uint64_t v58 = 1752392040;
    sub_1A9632350();
    *(_WORD *)(v42 + 12) = 2081;
    sub_1A9631510();
    uint64_t v58 = sub_1A945C1DC(v41, a2, &v59);
    sub_1A9632350();
    swift_bridgeObjectRelease_n();
    os_log_t v44 = v54;
    _os_log_impl(&dword_1A9410000, v54, v40, "Successfully retrieved dailyForecast from cache; identifier=%{private,mask.hash}s",
      (uint8_t *)v42,
      0x16u);
    swift_arrayDestroy();
    MEMORY[0x1AD0F7300](v43, -1, -1);
    MEMORY[0x1AD0F7300](v42, -1, -1);
    sub_1A948A95C(v46);
    swift_release();
  }
  else
  {
    swift_bridgeObjectRelease_n();
    sub_1A948A95C(v46);

    swift_release();
  }
  sub_1A9449580(v48, v55);
  uint64_t v33 = 0;
  return __swift_storeEnumTagSinglePayload(v55, v33, 1, v57);
}

uint64_t sub_1A96030AC@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t *a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v55 = a4;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6DE0F0);
  MEMORY[0x1F4188790](v7 - 8);
  uint64_t v50 = (uint64_t)&v45 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v57 = type metadata accessor for HourlyForecast();
  MEMORY[0x1F4188790](v57);
  uint64_t v48 = (uint64_t)&v45 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6DDBD8);
  MEMORY[0x1F4188790](v10 - 8);
  uint64_t v12 = (char *)&v45 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_1A9631860();
  uint64_t v51 = *(void *)(v13 - 8);
  uint64_t v52 = v13;
  MEMORY[0x1F4188790](v13);
  os_log_type_t v15 = (char *)&v45 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v49 = *a3;
  if (qword_1EB6DE388 != -1) {
    swift_once();
  }
  uint64_t v56 = a1;
  uint64_t v16 = sub_1A96317F0();
  uint64_t v17 = __swift_project_value_buffer(v16, (uint64_t)qword_1EB6EB630);
  swift_bridgeObjectRetain_n();
  uint64_t v53 = v17;
  uint64_t v18 = sub_1A96317D0();
  os_log_type_t v19 = sub_1A9632230();
  if (os_log_type_enabled(v18, v19))
  {
    uint64_t v20 = swift_slowAlloc();
    uint64_t v21 = swift_slowAlloc();
    uint64_t v64 = v21;
    *(_DWORD *)uint64_t v20 = 141558275;
    uint64_t v59 = 1752392040;
    sub_1A9632350();
    *(_WORD *)(v20 + 12) = 2081;
    sub_1A9631510();
    uint64_t v59 = sub_1A945C1DC(v56, a2, &v64);
    sub_1A9632350();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_1A9410000, v18, v19, "Attempting to retrieve hourlyForecast from cache; identifier=%{private,mask.hash}s",
      (uint8_t *)v20,
      0x16u);
    swift_arrayDestroy();
    MEMORY[0x1AD0F7300](v21, -1, -1);
    MEMORY[0x1AD0F7300](v20, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  if (!sub_1A95E44F0())
  {
    long long v24 = sub_1A96317D0();
    os_log_type_t v25 = sub_1A9632230();
    if (os_log_type_enabled(v24, v25))
    {
      long long v26 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)long long v26 = 0;
      _os_log_impl(&dword_1A9410000, v24, v25, "Cannot retrieve cached hourlyForecast due to missing store", v26, 2u);
      MEMORY[0x1AD0F7300](v26, -1, -1);
    }

    goto LABEL_14;
  }
  sub_1A9631960();
  uint64_t v67 = MEMORY[0x1E4FBB1A0];
  uint64_t v68 = MEMORY[0x1E4FAA778];
  uint64_t v22 = v56;
  uint64_t v64 = v56;
  unint64_t v65 = a2;
  sub_1A9631510();
  sub_1A96318F0();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v64);
  uint64_t v23 = sub_1A96319F0();
  __swift_storeEnumTagSinglePayload((uint64_t)v12, 1, 1, v23);
  sub_1A9631930();
  swift_release();
  sub_1A944C480((uint64_t)v12, &qword_1EB6DDBD8);
  (*(void (**)(char *, uint64_t))(v51 + 8))(v15, v52);
  uint64_t v27 = v59;
  if (!v59)
  {
    swift_bridgeObjectRetain_n();
    uint64_t v35 = sub_1A96317D0();
    os_log_type_t v36 = sub_1A9632230();
    if (os_log_type_enabled(v35, v36))
    {
      uint64_t v37 = swift_slowAlloc();
      uint64_t v38 = swift_slowAlloc();
      uint64_t v64 = v38;
      *(_DWORD *)uint64_t v37 = 141558275;
      uint64_t v59 = 1752392040;
      sub_1A9632350();
      *(_WORD *)(v37 + 12) = 2081;
      sub_1A9631510();
      uint64_t v59 = sub_1A945C1DC(v22, a2, &v64);
      sub_1A9632350();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_1A9410000, v35, v36, "Could not find hourlyForecast data in cache; identifier=%{private,mask.hash}s",
        (uint8_t *)v37,
        0x16u);
      uint64_t v33 = 1;
      swift_arrayDestroy();
      MEMORY[0x1AD0F7300](v38, -1, -1);
      MEMORY[0x1AD0F7300](v37, -1, -1);
      swift_release();

      return __swift_storeEnumTagSinglePayload(v55, v33, 1, v57);
    }

    swift_bridgeObjectRelease_n();
    swift_release();
    goto LABEL_14;
  }
  unint64_t v29 = v60;
  uint64_t v28 = v61;
  uint64_t v31 = v62;
  uint64_t v30 = v63;
  uint64_t v64 = v59;
  unint64_t v65 = v60;
  uint64_t v66 = v61;
  uint64_t v67 = v62;
  uint64_t v68 = v63;
  uint64_t v32 = v50;
  sub_1A95D7E1C(v49, v50);
  if (__swift_getEnumTagSinglePayload(v32, 1, v57) == 1)
  {
    sub_1A948A95C(v27);
    swift_release();
    sub_1A944C480(v32, &qword_1EB6DE0F0);
LABEL_14:
    uint64_t v33 = 1;
    return __swift_storeEnumTagSinglePayload(v55, v33, 1, v57);
  }
  uint64_t v46 = v27;
  unint64_t v47 = v29;
  uint64_t v49 = v28;
  uint64_t v51 = v31;
  uint64_t v52 = v30;
  sub_1A9449580(v32, v48);
  swift_bridgeObjectRetain_n();
  uint64_t v39 = sub_1A96317D0();
  os_log_type_t v40 = sub_1A9632230();
  os_log_t v54 = v39;
  if (os_log_type_enabled(v39, v40))
  {
    uint64_t v41 = v22;
    uint64_t v42 = swift_slowAlloc();
    uint64_t v43 = swift_slowAlloc();
    uint64_t v59 = v43;
    *(_DWORD *)uint64_t v42 = 141558275;
    uint64_t v58 = 1752392040;
    sub_1A9632350();
    *(_WORD *)(v42 + 12) = 2081;
    sub_1A9631510();
    uint64_t v58 = sub_1A945C1DC(v41, a2, &v59);
    sub_1A9632350();
    swift_bridgeObjectRelease_n();
    os_log_t v44 = v54;
    _os_log_impl(&dword_1A9410000, v54, v40, "Successfully retrieved hourlyForecast from cache; identifier=%{private,mask.hash}s",
      (uint8_t *)v42,
      0x16u);
    swift_arrayDestroy();
    MEMORY[0x1AD0F7300](v43, -1, -1);
    MEMORY[0x1AD0F7300](v42, -1, -1);
    sub_1A948A95C(v46);
    swift_release();
  }
  else
  {
    swift_bridgeObjectRelease_n();
    sub_1A948A95C(v46);

    swift_release();
  }
  sub_1A9449580(v48, v55);
  uint64_t v33 = 0;
  return __swift_storeEnumTagSinglePayload(v55, v33, 1, v57);
}

uint64_t sub_1A9603ADC@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t *a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v55 = a4;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6DE0F8);
  MEMORY[0x1F4188790](v7 - 8);
  uint64_t v50 = (uint64_t)&v45 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t HourForecast = type metadata accessor for NextHourForecast();
  MEMORY[0x1F4188790](HourForecast);
  uint64_t v48 = (uint64_t)&v45 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6DDBD8);
  MEMORY[0x1F4188790](v10 - 8);
  uint64_t v12 = (char *)&v45 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_1A9631860();
  uint64_t v51 = *(void *)(v13 - 8);
  uint64_t v52 = v13;
  MEMORY[0x1F4188790](v13);
  os_log_type_t v15 = (char *)&v45 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v49 = *a3;
  if (qword_1EB6DE388 != -1) {
    swift_once();
  }
  uint64_t v56 = a1;
  uint64_t v16 = sub_1A96317F0();
  uint64_t v17 = __swift_project_value_buffer(v16, (uint64_t)qword_1EB6EB630);
  swift_bridgeObjectRetain_n();
  uint64_t v53 = v17;
  uint64_t v18 = sub_1A96317D0();
  os_log_type_t v19 = sub_1A9632230();
  if (os_log_type_enabled(v18, v19))
  {
    uint64_t v20 = swift_slowAlloc();
    uint64_t v21 = swift_slowAlloc();
    uint64_t v64 = v21;
    *(_DWORD *)uint64_t v20 = 141558275;
    uint64_t v59 = 1752392040;
    sub_1A9632350();
    *(_WORD *)(v20 + 12) = 2081;
    sub_1A9631510();
    uint64_t v59 = sub_1A945C1DC(v56, a2, &v64);
    sub_1A9632350();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_1A9410000, v18, v19, "Attempting to retrieve nextHourForecast from cache; identifier=%{private,mask.hash}s",
      (uint8_t *)v20,
      0x16u);
    swift_arrayDestroy();
    MEMORY[0x1AD0F7300](v21, -1, -1);
    MEMORY[0x1AD0F7300](v20, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  if (!sub_1A95E44F0())
  {
    long long v24 = sub_1A96317D0();
    os_log_type_t v25 = sub_1A9632230();
    if (os_log_type_enabled(v24, v25))
    {
      long long v26 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)long long v26 = 0;
      _os_log_impl(&dword_1A9410000, v24, v25, "Cannot retrieve cached nextHourForecast due to missing store", v26, 2u);
      MEMORY[0x1AD0F7300](v26, -1, -1);
    }

    goto LABEL_14;
  }
  sub_1A9631960();
  uint64_t v67 = MEMORY[0x1E4FBB1A0];
  uint64_t v68 = MEMORY[0x1E4FAA778];
  uint64_t v22 = v56;
  uint64_t v64 = v56;
  unint64_t v65 = a2;
  sub_1A9631510();
  sub_1A96318F0();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v64);
  uint64_t v23 = sub_1A96319F0();
  __swift_storeEnumTagSinglePayload((uint64_t)v12, 1, 1, v23);
  sub_1A9631930();
  swift_release();
  sub_1A944C480((uint64_t)v12, &qword_1EB6DDBD8);
  (*(void (**)(char *, uint64_t))(v51 + 8))(v15, v52);
  uint64_t v27 = v59;
  if (!v59)
  {
    swift_bridgeObjectRetain_n();
    uint64_t v35 = sub_1A96317D0();
    os_log_type_t v36 = sub_1A9632230();
    if (os_log_type_enabled(v35, v36))
    {
      uint64_t v37 = swift_slowAlloc();
      uint64_t v38 = swift_slowAlloc();
      uint64_t v64 = v38;
      *(_DWORD *)uint64_t v37 = 141558275;
      uint64_t v59 = 1752392040;
      sub_1A9632350();
      *(_WORD *)(v37 + 12) = 2081;
      sub_1A9631510();
      uint64_t v59 = sub_1A945C1DC(v22, a2, &v64);
      sub_1A9632350();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_1A9410000, v35, v36, "Could not find nextHourForecast data in cache; identifier=%{private,mask.hash}s",
        (uint8_t *)v37,
        0x16u);
      uint64_t v33 = 1;
      swift_arrayDestroy();
      MEMORY[0x1AD0F7300](v38, -1, -1);
      MEMORY[0x1AD0F7300](v37, -1, -1);
      swift_release();

      return __swift_storeEnumTagSinglePayload(v55, v33, 1, HourForecast);
    }

    swift_bridgeObjectRelease_n();
    swift_release();
    goto LABEL_14;
  }
  unint64_t v29 = v60;
  uint64_t v28 = v61;
  uint64_t v31 = v62;
  uint64_t v30 = v63;
  uint64_t v64 = v59;
  unint64_t v65 = v60;
  uint64_t v66 = v61;
  uint64_t v67 = v62;
  uint64_t v68 = v63;
  uint64_t v32 = v50;
  sub_1A95D856C(v49, v50);
  if (__swift_getEnumTagSinglePayload(v32, 1, HourForecast) == 1)
  {
    sub_1A948A95C(v27);
    swift_release();
    sub_1A944C480(v32, &qword_1EB6DE0F8);
LABEL_14:
    uint64_t v33 = 1;
    return __swift_storeEnumTagSinglePayload(v55, v33, 1, HourForecast);
  }
  uint64_t v46 = v27;
  unint64_t v47 = v29;
  uint64_t v49 = v28;
  uint64_t v51 = v31;
  uint64_t v52 = v30;
  sub_1A9449580(v32, v48);
  swift_bridgeObjectRetain_n();
  uint64_t v39 = sub_1A96317D0();
  os_log_type_t v40 = sub_1A9632230();
  os_log_t v54 = v39;
  if (os_log_type_enabled(v39, v40))
  {
    uint64_t v41 = v22;
    uint64_t v42 = swift_slowAlloc();
    uint64_t v43 = swift_slowAlloc();
    uint64_t v59 = v43;
    *(_DWORD *)uint64_t v42 = 141558275;
    uint64_t v58 = 1752392040;
    sub_1A9632350();
    *(_WORD *)(v42 + 12) = 2081;
    sub_1A9631510();
    uint64_t v58 = sub_1A945C1DC(v41, a2, &v59);
    sub_1A9632350();
    swift_bridgeObjectRelease_n();
    os_log_t v44 = v54;
    _os_log_impl(&dword_1A9410000, v54, v40, "Successfully retrieved nextHourForecast from cache; identifier=%{private,mask.hash}s",
      (uint8_t *)v42,
      0x16u);
    swift_arrayDestroy();
    MEMORY[0x1AD0F7300](v43, -1, -1);
    MEMORY[0x1AD0F7300](v42, -1, -1);
    sub_1A948A95C(v46);
    swift_release();
  }
  else
  {
    swift_bridgeObjectRelease_n();
    sub_1A948A95C(v46);

    swift_release();
  }
  sub_1A9449580(v48, v55);
  uint64_t v33 = 0;
  return __swift_storeEnumTagSinglePayload(v55, v33, 1, HourForecast);
}

uint64_t sub_1A960450C(uint64_t a1, unint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v40 = a1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6DDBD8);
  MEMORY[0x1F4188790](v5 - 8);
  uint64_t v7 = (char *)v37 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_1A9631860();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8);
  uint64_t v11 = (char *)v37 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1EB6DE388 != -1) {
    swift_once();
  }
  uint64_t v12 = sub_1A96317F0();
  uint64_t v13 = __swift_project_value_buffer(v12, (uint64_t)qword_1EB6EB630);
  swift_bridgeObjectRetain_n();
  uint64_t v39 = v13;
  uint64_t v14 = sub_1A96317D0();
  os_log_type_t v15 = sub_1A9632230();
  if (os_log_type_enabled(v14, v15))
  {
    uint64_t v16 = swift_slowAlloc();
    v37[1] = v3;
    uint64_t v17 = v16;
    uint64_t v18 = swift_slowAlloc();
    uint64_t v38 = v9;
    uint64_t v19 = v8;
    uint64_t v20 = v18;
    uint64_t v42 = v18;
    *(_DWORD *)uint64_t v17 = 141558275;
    v41[0] = 1752392040;
    sub_1A9632350();
    *(_WORD *)(v17 + 12) = 2081;
    sub_1A9631510();
    v41[0] = sub_1A945C1DC(v40, a2, &v42);
    sub_1A9632350();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_1A9410000, v14, v15, "Attempting to retrieve nextHourForecast unavailable from cache; identifier=%{private,mask.hash}s",
      (uint8_t *)v17,
      0x16u);
    swift_arrayDestroy();
    uint64_t v21 = v20;
    uint64_t v8 = v19;
    uint64_t v9 = v38;
    MEMORY[0x1AD0F7300](v21, -1, -1);
    MEMORY[0x1AD0F7300](v17, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  if (!sub_1A95E44F0())
  {
    long long v24 = sub_1A96317D0();
    os_log_type_t v25 = sub_1A9632230();
    if (os_log_type_enabled(v24, v25))
    {
      long long v26 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)long long v26 = 0;
      _os_log_impl(&dword_1A9410000, v24, v25, "Cannot retrieve cached nextHourForecast unavailable due to missing store", v26, 2u);
      MEMORY[0x1AD0F7300](v26, -1, -1);
    }

    return 0;
  }
  sub_1A9631960();
  v41[3] = MEMORY[0x1E4FBB1A0];
  v41[4] = MEMORY[0x1E4FAA778];
  uint64_t v22 = v40;
  v41[0] = v40;
  v41[1] = a2;
  sub_1A9631510();
  sub_1A96318F0();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v41);
  uint64_t v23 = sub_1A96319F0();
  __swift_storeEnumTagSinglePayload((uint64_t)v7, 1, 1, v23);
  sub_1A9631930();
  swift_release();
  sub_1A944C480((uint64_t)v7, &qword_1EB6DDBD8);
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  uint64_t v27 = v42;
  sub_1A948A95C(v42);
  swift_bridgeObjectRetain_n();
  uint64_t v28 = sub_1A96317D0();
  uint64_t v29 = sub_1A9632230();
  BOOL v30 = os_log_type_enabled(v28, (os_log_type_t)v29);
  if (!v27)
  {
    if (v30)
    {
      uint64_t v35 = swift_slowAlloc();
      uint64_t v36 = swift_slowAlloc();
      uint64_t v42 = v36;
      *(_DWORD *)uint64_t v35 = 141558275;
      v41[0] = 1752392040;
      sub_1A9632350();
      *(_WORD *)(v35 + 12) = 2081;
      sub_1A9631510();
      v41[0] = sub_1A945C1DC(v22, a2, &v42);
      sub_1A9632350();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_1A9410000, v28, (os_log_type_t)v29, "Could not find nextHourForecast unavailable data in cache; identifier=%{private,mask.hash}s",
        (uint8_t *)v35,
        0x16u);
      swift_arrayDestroy();
      MEMORY[0x1AD0F7300](v36, -1, -1);
      MEMORY[0x1AD0F7300](v35, -1, -1);
      swift_release();
    }
    else
    {

      swift_bridgeObjectRelease_n();
      swift_release();
    }
    return 0;
  }
  if (v30)
  {
    uint64_t v31 = swift_slowAlloc();
    uint64_t v32 = swift_slowAlloc();
    uint64_t v42 = v32;
    *(_DWORD *)uint64_t v31 = 141558275;
    v41[0] = 1752392040;
    sub_1A9632350();
    *(_WORD *)(v31 + 12) = 2081;
    sub_1A9631510();
    v41[0] = sub_1A945C1DC(v22, a2, &v42);
    sub_1A9632350();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_1A9410000, v28, (os_log_type_t)v29, "Successfully retrieved nextHourForecast unavailable from cache; identifier=%{private,mask.hash}s",
      (uint8_t *)v31,
      0x16u);
    uint64_t v33 = 1;
    swift_arrayDestroy();
    MEMORY[0x1AD0F7300](v32, -1, -1);
    MEMORY[0x1AD0F7300](v31, -1, -1);
    swift_release();
  }
  else
  {

    swift_release();
    swift_bridgeObjectRelease_n();
    return 1;
  }
  return v33;
}

uint64_t sub_1A9604D54@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t *a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v55 = a4;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E97EAC40);
  MEMORY[0x1F4188790](v7 - 8);
  uint64_t v50 = (uint64_t)&v45 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v57 = type metadata accessor for PeriodicForecasts();
  MEMORY[0x1F4188790](v57);
  uint64_t v48 = (uint64_t)&v45 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6DDBD8);
  MEMORY[0x1F4188790](v10 - 8);
  uint64_t v12 = (char *)&v45 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_1A9631860();
  uint64_t v51 = *(void *)(v13 - 8);
  uint64_t v52 = v13;
  MEMORY[0x1F4188790](v13);
  os_log_type_t v15 = (char *)&v45 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v49 = *a3;
  if (qword_1EB6DE388 != -1) {
    swift_once();
  }
  uint64_t v56 = a1;
  uint64_t v16 = sub_1A96317F0();
  uint64_t v17 = __swift_project_value_buffer(v16, (uint64_t)qword_1EB6EB630);
  swift_bridgeObjectRetain_n();
  uint64_t v53 = v17;
  uint64_t v18 = sub_1A96317D0();
  os_log_type_t v19 = sub_1A9632230();
  if (os_log_type_enabled(v18, v19))
  {
    uint64_t v20 = swift_slowAlloc();
    uint64_t v21 = swift_slowAlloc();
    uint64_t v64 = v21;
    *(_DWORD *)uint64_t v20 = 141558275;
    uint64_t v59 = 1752392040;
    sub_1A9632350();
    *(_WORD *)(v20 + 12) = 2081;
    sub_1A9631510();
    uint64_t v59 = sub_1A945C1DC(v56, a2, &v64);
    sub_1A9632350();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_1A9410000, v18, v19, "Attempting to retrieve forecastPeriod from cache; identifier=%{private,mask.hash}s",
      (uint8_t *)v20,
      0x16u);
    swift_arrayDestroy();
    MEMORY[0x1AD0F7300](v21, -1, -1);
    MEMORY[0x1AD0F7300](v20, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  if (!sub_1A95E44F0())
  {
    long long v24 = sub_1A96317D0();
    os_log_type_t v25 = sub_1A9632230();
    if (os_log_type_enabled(v24, v25))
    {
      long long v26 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)long long v26 = 0;
      _os_log_impl(&dword_1A9410000, v24, v25, "Cannot retrieve cached forecastPeriod due to missing store", v26, 2u);
      MEMORY[0x1AD0F7300](v26, -1, -1);
    }

    goto LABEL_14;
  }
  sub_1A9631960();
  uint64_t v67 = MEMORY[0x1E4FBB1A0];
  uint64_t v68 = MEMORY[0x1E4FAA778];
  uint64_t v22 = v56;
  uint64_t v64 = v56;
  unint64_t v65 = a2;
  sub_1A9631510();
  sub_1A96318F0();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v64);
  uint64_t v23 = sub_1A96319F0();
  __swift_storeEnumTagSinglePayload((uint64_t)v12, 1, 1, v23);
  sub_1A9631930();
  swift_release();
  sub_1A944C480((uint64_t)v12, &qword_1EB6DDBD8);
  (*(void (**)(char *, uint64_t))(v51 + 8))(v15, v52);
  uint64_t v27 = v59;
  if (!v59)
  {
    swift_bridgeObjectRetain_n();
    uint64_t v35 = sub_1A96317D0();
    os_log_type_t v36 = sub_1A9632230();
    if (os_log_type_enabled(v35, v36))
    {
      uint64_t v37 = swift_slowAlloc();
      uint64_t v38 = swift_slowAlloc();
      uint64_t v64 = v38;
      *(_DWORD *)uint64_t v37 = 141558275;
      uint64_t v59 = 1752392040;
      sub_1A9632350();
      *(_WORD *)(v37 + 12) = 2081;
      sub_1A9631510();
      uint64_t v59 = sub_1A945C1DC(v22, a2, &v64);
      sub_1A9632350();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_1A9410000, v35, v36, "Could not find forecastPeriod data in cache; identifier=%{private,mask.hash}s",
        (uint8_t *)v37,
        0x16u);
      uint64_t v33 = 1;
      swift_arrayDestroy();
      MEMORY[0x1AD0F7300](v38, -1, -1);
      MEMORY[0x1AD0F7300](v37, -1, -1);
      swift_release();

      return __swift_storeEnumTagSinglePayload(v55, v33, 1, v57);
    }

    swift_bridgeObjectRelease_n();
    swift_release();
    goto LABEL_14;
  }
  unint64_t v29 = v60;
  uint64_t v28 = v61;
  uint64_t v31 = v62;
  uint64_t v30 = v63;
  uint64_t v64 = v59;
  unint64_t v65 = v60;
  uint64_t v66 = v61;
  uint64_t v67 = v62;
  uint64_t v68 = v63;
  uint64_t v32 = v50;
  sub_1A95D8CBC(v49, v50);
  if (__swift_getEnumTagSinglePayload(v32, 1, v57) == 1)
  {
    sub_1A948A95C(v27);
    swift_release();
    sub_1A944C480(v32, &qword_1E97EAC40);
LABEL_14:
    uint64_t v33 = 1;
    return __swift_storeEnumTagSinglePayload(v55, v33, 1, v57);
  }
  uint64_t v46 = v27;
  unint64_t v47 = v29;
  uint64_t v49 = v28;
  uint64_t v51 = v31;
  uint64_t v52 = v30;
  sub_1A9449580(v32, v48);
  swift_bridgeObjectRetain_n();
  uint64_t v39 = sub_1A96317D0();
  os_log_type_t v40 = sub_1A9632230();
  os_log_t v54 = v39;
  if (os_log_type_enabled(v39, v40))
  {
    uint64_t v41 = v22;
    uint64_t v42 = swift_slowAlloc();
    uint64_t v43 = swift_slowAlloc();
    uint64_t v59 = v43;
    *(_DWORD *)uint64_t v42 = 141558275;
    uint64_t v58 = 1752392040;
    sub_1A9632350();
    *(_WORD *)(v42 + 12) = 2081;
    sub_1A9631510();
    uint64_t v58 = sub_1A945C1DC(v41, a2, &v59);
    sub_1A9632350();
    swift_bridgeObjectRelease_n();
    os_log_t v44 = v54;
    _os_log_impl(&dword_1A9410000, v54, v40, "Successfully retrieved forecastPeriod from cache; identifier=%{private,mask.hash}s",
      (uint8_t *)v42,
      0x16u);
    swift_arrayDestroy();
    MEMORY[0x1AD0F7300](v43, -1, -1);
    MEMORY[0x1AD0F7300](v42, -1, -1);
    sub_1A948A95C(v46);
    swift_release();
  }
  else
  {
    swift_bridgeObjectRelease_n();
    sub_1A948A95C(v46);

    swift_release();
  }
  sub_1A9449580(v48, v55);
  uint64_t v33 = 0;
  return __swift_storeEnumTagSinglePayload(v55, v33, 1, v57);
}

uint64_t sub_1A9605784@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t *a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v55 = a4;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6DD6F8);
  MEMORY[0x1F4188790](v7 - 8);
  uint64_t v50 = (uint64_t)&v45 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v57 = type metadata accessor for LocationInfo();
  MEMORY[0x1F4188790](v57);
  uint64_t v48 = (uint64_t)&v45 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6DDBD8);
  MEMORY[0x1F4188790](v10 - 8);
  uint64_t v12 = (char *)&v45 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_1A9631860();
  uint64_t v51 = *(void *)(v13 - 8);
  uint64_t v52 = v13;
  MEMORY[0x1F4188790](v13);
  os_log_type_t v15 = (char *)&v45 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v49 = *a3;
  if (qword_1EB6DE388 != -1) {
    swift_once();
  }
  uint64_t v56 = a1;
  uint64_t v16 = sub_1A96317F0();
  uint64_t v17 = __swift_project_value_buffer(v16, (uint64_t)qword_1EB6EB630);
  swift_bridgeObjectRetain_n();
  uint64_t v53 = v17;
  uint64_t v18 = sub_1A96317D0();
  os_log_type_t v19 = sub_1A9632230();
  if (os_log_type_enabled(v18, v19))
  {
    uint64_t v20 = swift_slowAlloc();
    uint64_t v21 = swift_slowAlloc();
    uint64_t v64 = v21;
    *(_DWORD *)uint64_t v20 = 141558275;
    uint64_t v59 = 1752392040;
    sub_1A9632350();
    *(_WORD *)(v20 + 12) = 2081;
    sub_1A9631510();
    uint64_t v59 = sub_1A945C1DC(v56, a2, &v64);
    sub_1A9632350();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_1A9410000, v18, v19, "Attempting to retrieve locationInfo from cache; identifier=%{private,mask.hash}s",
      (uint8_t *)v20,
      0x16u);
    swift_arrayDestroy();
    MEMORY[0x1AD0F7300](v21, -1, -1);
    MEMORY[0x1AD0F7300](v20, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  if (!sub_1A95E44F0())
  {
    long long v24 = sub_1A96317D0();
    os_log_type_t v25 = sub_1A9632230();
    if (os_log_type_enabled(v24, v25))
    {
      long long v26 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)long long v26 = 0;
      _os_log_impl(&dword_1A9410000, v24, v25, "Cannot retrieve cached locationInfo due to missing store", v26, 2u);
      MEMORY[0x1AD0F7300](v26, -1, -1);
    }

    goto LABEL_14;
  }
  sub_1A9631960();
  uint64_t v67 = MEMORY[0x1E4FBB1A0];
  uint64_t v68 = MEMORY[0x1E4FAA778];
  uint64_t v22 = v56;
  uint64_t v64 = v56;
  unint64_t v65 = a2;
  sub_1A9631510();
  sub_1A96318F0();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v64);
  uint64_t v23 = sub_1A96319F0();
  __swift_storeEnumTagSinglePayload((uint64_t)v12, 1, 1, v23);
  sub_1A9631930();
  swift_release();
  sub_1A944C480((uint64_t)v12, &qword_1EB6DDBD8);
  (*(void (**)(char *, uint64_t))(v51 + 8))(v15, v52);
  uint64_t v27 = v59;
  if (!v59)
  {
    swift_bridgeObjectRetain_n();
    uint64_t v35 = sub_1A96317D0();
    os_log_type_t v36 = sub_1A9632230();
    if (os_log_type_enabled(v35, v36))
    {
      uint64_t v37 = swift_slowAlloc();
      uint64_t v38 = swift_slowAlloc();
      uint64_t v64 = v38;
      *(_DWORD *)uint64_t v37 = 141558275;
      uint64_t v59 = 1752392040;
      sub_1A9632350();
      *(_WORD *)(v37 + 12) = 2081;
      sub_1A9631510();
      uint64_t v59 = sub_1A945C1DC(v22, a2, &v64);
      sub_1A9632350();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_1A9410000, v35, v36, "Could not find locationInfo data in cache; identifier=%{private,mask.hash}s",
        (uint8_t *)v37,
        0x16u);
      uint64_t v33 = 1;
      swift_arrayDestroy();
      MEMORY[0x1AD0F7300](v38, -1, -1);
      MEMORY[0x1AD0F7300](v37, -1, -1);
      swift_release();

      return __swift_storeEnumTagSinglePayload(v55, v33, 1, v57);
    }

    swift_bridgeObjectRelease_n();
    swift_release();
    goto LABEL_14;
  }
  unint64_t v29 = v60;
  uint64_t v28 = v61;
  uint64_t v31 = v62;
  uint64_t v30 = v63;
  uint64_t v64 = v59;
  unint64_t v65 = v60;
  uint64_t v66 = v61;
  uint64_t v67 = v62;
  uint64_t v68 = v63;
  uint64_t v32 = v50;
  sub_1A95D940C(v49, v50);
  if (__swift_getEnumTagSinglePayload(v32, 1, v57) == 1)
  {
    sub_1A948A95C(v27);
    swift_release();
    sub_1A944C480(v32, &qword_1EB6DD6F8);
LABEL_14:
    uint64_t v33 = 1;
    return __swift_storeEnumTagSinglePayload(v55, v33, 1, v57);
  }
  uint64_t v46 = v27;
  unint64_t v47 = v29;
  uint64_t v49 = v28;
  uint64_t v51 = v31;
  uint64_t v52 = v30;
  sub_1A9449580(v32, v48);
  swift_bridgeObjectRetain_n();
  uint64_t v39 = sub_1A96317D0();
  os_log_type_t v40 = sub_1A9632230();
  os_log_t v54 = v39;
  if (os_log_type_enabled(v39, v40))
  {
    uint64_t v41 = v22;
    uint64_t v42 = swift_slowAlloc();
    uint64_t v43 = swift_slowAlloc();
    uint64_t v59 = v43;
    *(_DWORD *)uint64_t v42 = 141558275;
    uint64_t v58 = 1752392040;
    sub_1A9632350();
    *(_WORD *)(v42 + 12) = 2081;
    sub_1A9631510();
    uint64_t v58 = sub_1A945C1DC(v41, a2, &v59);
    sub_1A9632350();
    swift_bridgeObjectRelease_n();
    os_log_t v44 = v54;
    _os_log_impl(&dword_1A9410000, v54, v40, "Successfully retrieved locationInfo from cache; identifier=%{private,mask.hash}s",
      (uint8_t *)v42,
      0x16u);
    swift_arrayDestroy();
    MEMORY[0x1AD0F7300](v43, -1, -1);
    MEMORY[0x1AD0F7300](v42, -1, -1);
    sub_1A948A95C(v46);
    swift_release();
  }
  else
  {
    swift_bridgeObjectRelease_n();
    sub_1A948A95C(v46);

    swift_release();
  }
  sub_1A9449580(v48, v55);
  uint64_t v33 = 0;
  return __swift_storeEnumTagSinglePayload(v55, v33, 1, v57);
}

uint64_t sub_1A96061B4@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, NSObject *a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6DD258);
  MEMORY[0x1F4188790](v8 - 8);
  uint64_t v10 = (char *)v30 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for MarineForecast();
  MEMORY[0x1F4188790](v11);
  uint64_t v13 = (char *)v30 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_1A95E44F0();
  if (v14)
  {
    uint64_t v15 = *(void *)(v14 + 64);
    swift_retain();
    sub_1A95DF21C(a1, a2, a3, v15, (uint64_t)v10);
    swift_release();
    int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v10, 1, v11);
    if (EnumTagSinglePayload == 1)
    {
      swift_release();
      sub_1A944C480((uint64_t)v10, &qword_1EB6DD258);
      uint64_t v22 = a4;
      uint64_t v23 = 1;
    }
    else
    {
      sub_1A9449580((uint64_t)v10, (uint64_t)v13);
      if (qword_1EB6DE388 != -1) {
        swift_once();
      }
      uint64_t v24 = sub_1A96317F0();
      __swift_project_value_buffer(v24, (uint64_t)qword_1EB6EB630);
      swift_bridgeObjectRetain_n();
      os_log_type_t v25 = sub_1A96317D0();
      os_log_type_t v26 = sub_1A9632230();
      if (os_log_type_enabled(v25, v26))
      {
        uint64_t v27 = swift_slowAlloc();
        uint64_t v28 = swift_slowAlloc();
        uint64_t v31 = v28;
        *(_DWORD *)uint64_t v27 = 141558275;
        uint64_t v32 = 1752392040;
        uint64_t v33 = v28;
        sub_1A9632350();
        *(_WORD *)(v27 + 12) = 2081;
        v30[1] = v27 + 14;
        sub_1A9631510();
        uint64_t v32 = sub_1A945C1DC(a1, a2, &v33);
        sub_1A9632350();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_1A9410000, v25, v26, "Successfully retrieved marineForecast from cache; identifier=%{private,mask.hash}s",
          (uint8_t *)v27,
          0x16u);
        uint64_t v29 = v31;
        swift_arrayDestroy();
        MEMORY[0x1AD0F7300](v29, -1, -1);
        MEMORY[0x1AD0F7300](v27, -1, -1);
        swift_release();
      }
      else
      {

        swift_release();
        swift_bridgeObjectRelease_n();
      }
      sub_1A9449580((uint64_t)v13, a4);
      uint64_t v22 = a4;
      uint64_t v23 = 0;
    }
    return __swift_storeEnumTagSinglePayload(v22, v23, 1, v11);
  }
  else
  {
    if (qword_1EB6DE388 != -1) {
      swift_once();
    }
    uint64_t v16 = sub_1A96317F0();
    __swift_project_value_buffer(v16, (uint64_t)qword_1EB6EB630);
    uint64_t v17 = sub_1A96317D0();
    os_log_type_t v18 = sub_1A9632230();
    if (os_log_type_enabled(v17, v18))
    {
      os_log_type_t v19 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)os_log_type_t v19 = 0;
      _os_log_impl(&dword_1A9410000, v17, v18, "Cannot retrieve cached marineForecast due to missing store", v19, 2u);
      MEMORY[0x1AD0F7300](v19, -1, -1);
    }

    return __swift_storeEnumTagSinglePayload(a4, 1, 1, v11);
  }
}

uint64_t sub_1A96067D4(uint64_t a1, unint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v40 = a1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6DDBD8);
  MEMORY[0x1F4188790](v5 - 8);
  uint64_t v7 = (char *)v37 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_1A9631860();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8);
  uint64_t v11 = (char *)v37 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1EB6DE388 != -1) {
    swift_once();
  }
  uint64_t v12 = sub_1A96317F0();
  uint64_t v13 = __swift_project_value_buffer(v12, (uint64_t)qword_1EB6EB630);
  swift_bridgeObjectRetain_n();
  uint64_t v39 = v13;
  uint64_t v14 = sub_1A96317D0();
  os_log_type_t v15 = sub_1A9632230();
  if (os_log_type_enabled(v14, v15))
  {
    uint64_t v16 = swift_slowAlloc();
    v37[1] = v3;
    uint64_t v17 = v16;
    uint64_t v18 = swift_slowAlloc();
    uint64_t v38 = v9;
    uint64_t v19 = v8;
    uint64_t v20 = v18;
    uint64_t v42 = v18;
    *(_DWORD *)uint64_t v17 = 141558275;
    v41[0] = 1752392040;
    sub_1A9632350();
    *(_WORD *)(v17 + 12) = 2081;
    sub_1A9631510();
    v41[0] = sub_1A945C1DC(v40, a2, &v42);
    sub_1A9632350();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_1A9410000, v14, v15, "Attempting to retrieve marineForecastUnavailable from cache; identifier=%{private,mask.hash}s",
      (uint8_t *)v17,
      0x16u);
    swift_arrayDestroy();
    uint64_t v21 = v20;
    uint64_t v8 = v19;
    uint64_t v9 = v38;
    MEMORY[0x1AD0F7300](v21, -1, -1);
    MEMORY[0x1AD0F7300](v17, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  if (!sub_1A95E44F0())
  {
    uint64_t v24 = sub_1A96317D0();
    os_log_type_t v25 = sub_1A9632230();
    if (os_log_type_enabled(v24, v25))
    {
      os_log_type_t v26 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)os_log_type_t v26 = 0;
      _os_log_impl(&dword_1A9410000, v24, v25, "Cannot retrieve cached marineForecastUnavailable due to missing store", v26, 2u);
      MEMORY[0x1AD0F7300](v26, -1, -1);
    }

    return 0;
  }
  sub_1A9631960();
  v41[3] = MEMORY[0x1E4FBB1A0];
  v41[4] = MEMORY[0x1E4FAA778];
  uint64_t v22 = v40;
  v41[0] = v40;
  v41[1] = a2;
  sub_1A9631510();
  sub_1A96318F0();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v41);
  uint64_t v23 = sub_1A96319F0();
  __swift_storeEnumTagSinglePayload((uint64_t)v7, 1, 1, v23);
  sub_1A9631930();
  swift_release();
  sub_1A944C480((uint64_t)v7, &qword_1EB6DDBD8);
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  uint64_t v27 = v42;
  sub_1A948A95C(v42);
  swift_bridgeObjectRetain_n();
  uint64_t v28 = sub_1A96317D0();
  uint64_t v29 = sub_1A9632230();
  BOOL v30 = os_log_type_enabled(v28, (os_log_type_t)v29);
  if (!v27)
  {
    if (v30)
    {
      uint64_t v35 = swift_slowAlloc();
      uint64_t v36 = swift_slowAlloc();
      uint64_t v42 = v36;
      *(_DWORD *)uint64_t v35 = 141558275;
      v41[0] = 1752392040;
      sub_1A9632350();
      *(_WORD *)(v35 + 12) = 2081;
      sub_1A9631510();
      v41[0] = sub_1A945C1DC(v22, a2, &v42);
      sub_1A9632350();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_1A9410000, v28, (os_log_type_t)v29, "Could not find marineForecastUnavailable data in cache; identifier=%{private,mask.hash}s",
        (uint8_t *)v35,
        0x16u);
      swift_arrayDestroy();
      MEMORY[0x1AD0F7300](v36, -1, -1);
      MEMORY[0x1AD0F7300](v35, -1, -1);
      swift_release();
    }
    else
    {

      swift_bridgeObjectRelease_n();
      swift_release();
    }
    return 0;
  }
  if (v30)
  {
    uint64_t v31 = swift_slowAlloc();
    uint64_t v32 = swift_slowAlloc();
    uint64_t v42 = v32;
    *(_DWORD *)uint64_t v31 = 141558275;
    v41[0] = 1752392040;
    sub_1A9632350();
    *(_WORD *)(v31 + 12) = 2081;
    sub_1A9631510();
    v41[0] = sub_1A945C1DC(v22, a2, &v42);
    sub_1A9632350();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_1A9410000, v28, (os_log_type_t)v29, "Successfully retrieved marineForecastUnavailable from cache; identifier=%{private,mask.hash}s",
      (uint8_t *)v31,
      0x16u);
    uint64_t v33 = 1;
    swift_arrayDestroy();
    MEMORY[0x1AD0F7300](v32, -1, -1);
    MEMORY[0x1AD0F7300](v31, -1, -1);
    swift_release();
  }
  else
  {

    swift_release();
    swift_bridgeObjectRelease_n();
    return 1;
  }
  return v33;
}

uint64_t sub_1A960701C@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t *a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v57 = a4;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6DD938);
  MEMORY[0x1F4188790](v7 - 8);
  uint64_t v9 = (char *)v53 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v58 = type metadata accessor for News();
  MEMORY[0x1F4188790](v58);
  uint64_t v55 = (uint64_t)v53 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6DDBD8);
  MEMORY[0x1F4188790](v11 - 8);
  uint64_t v13 = (char *)v53 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_1A9631860();
  uint64_t v15 = *(void *)(v14 - 8);
  MEMORY[0x1F4188790](v14);
  uint64_t v17 = (char *)v53 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = *a3;
  uint64_t v19 = sub_1A95E44F0();
  if (v19)
  {
    uint64_t v56 = v19;
    sub_1A9631960();
    uint64_t v67 = MEMORY[0x1E4FBB1A0];
    uint64_t v68 = MEMORY[0x1E4FAA778];
    uint64_t v64 = a1;
    uint64_t v65 = a2;
    sub_1A9631510();
    sub_1A96318F0();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v64);
    uint64_t v20 = sub_1A96319F0();
    __swift_storeEnumTagSinglePayload((uint64_t)v13, 1, 1, v20);
    sub_1A9631930();
    uint64_t v54 = a1;
    swift_release();
    sub_1A944C480((uint64_t)v13, &qword_1EB6DDBD8);
    (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v14);
    uint64_t v29 = v60[0];
    if (v60[0])
    {
      uint64_t v30 = v61;
      uint64_t v32 = v62;
      uint64_t v31 = v63;
      uint64_t v64 = v60[0];
      uint64_t v65 = v60[1];
      uint64_t v66 = v61;
      uint64_t v67 = v62;
      uint64_t v68 = v63;
      sub_1A95DA2AC(v18, (uint64_t)v9);
      uint64_t v33 = v58;
      if (__swift_getEnumTagSinglePayload((uint64_t)v9, 1, v58) != 1)
      {
        v53[3] = v30;
        uint64_t v41 = (uint64_t)v9;
        uint64_t v42 = v55;
        sub_1A9449580(v41, v55);
        if (qword_1EB6DE388 != -1) {
          swift_once();
        }
        uint64_t v43 = sub_1A96317F0();
        __swift_project_value_buffer(v43, (uint64_t)qword_1EB6EB630);
        swift_bridgeObjectRetain_n();
        os_log_t v44 = sub_1A96317D0();
        os_log_type_t v45 = sub_1A9632230();
        if (os_log_type_enabled(v44, v45))
        {
          uint64_t v46 = swift_slowAlloc();
          uint64_t v53[2] = v31;
          uint64_t v47 = v46;
          uint64_t v48 = swift_slowAlloc();
          v53[1] = v32;
          uint64_t v49 = v48;
          v60[0] = v48;
          *(_DWORD *)uint64_t v47 = 141558275;
          uint64_t v59 = 1752392040;
          sub_1A9632350();
          *(_WORD *)(v47 + 12) = 2081;
          sub_1A9631510();
          uint64_t v59 = sub_1A945C1DC(v54, a2, v60);
          uint64_t v42 = v55;
          sub_1A9632350();
          swift_bridgeObjectRelease_n();
          _os_log_impl(&dword_1A9410000, v44, v45, "Successfully retrieved news from cache; identifier=%{private,mask.hash}s",
            (uint8_t *)v47,
            0x16u);
          swift_arrayDestroy();
          MEMORY[0x1AD0F7300](v49, -1, -1);
          MEMORY[0x1AD0F7300](v47, -1, -1);
          sub_1A948A95C(v29);
          swift_release();
        }
        else
        {
          swift_bridgeObjectRelease_n();
          sub_1A948A95C(v29);

          swift_release();
        }
        uint64_t v52 = v57;
        sub_1A9449580(v42, v57);
        uint64_t v50 = v52;
        uint64_t v51 = 0;
        return __swift_storeEnumTagSinglePayload(v50, v51, 1, v33);
      }
      sub_1A948A95C(v29);
      swift_release();
      sub_1A944C480((uint64_t)v9, &qword_1EB6DD938);
    }
    else
    {
      uint64_t v33 = v58;
      if (qword_1EB6DE388 != -1) {
        swift_once();
      }
      uint64_t v34 = sub_1A96317F0();
      __swift_project_value_buffer(v34, (uint64_t)qword_1EB6EB630);
      swift_bridgeObjectRetain_n();
      uint64_t v35 = sub_1A96317D0();
      os_log_type_t v36 = sub_1A9632230();
      BOOL v37 = os_log_type_enabled(v35, v36);
      uint64_t v38 = v54;
      if (v37)
      {
        uint64_t v39 = swift_slowAlloc();
        uint64_t v40 = swift_slowAlloc();
        uint64_t v64 = v40;
        *(_DWORD *)uint64_t v39 = 141558275;
        v60[0] = 1752392040;
        sub_1A9632350();
        *(_WORD *)(v39 + 12) = 2081;
        sub_1A9631510();
        v60[0] = sub_1A945C1DC(v38, a2, &v64);
        sub_1A9632350();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_1A9410000, v35, v36, "Could not find news data in cache; identifier=%{private,mask.hash}s",
          (uint8_t *)v39,
          0x16u);
        swift_arrayDestroy();
        MEMORY[0x1AD0F7300](v40, -1, -1);
        MEMORY[0x1AD0F7300](v39, -1, -1);
        swift_release();
      }
      else
      {

        swift_bridgeObjectRelease_n();
        swift_release();
      }
    }
    uint64_t v50 = v57;
    uint64_t v51 = 1;
    return __swift_storeEnumTagSinglePayload(v50, v51, 1, v33);
  }
  if (qword_1EB6DE388 != -1) {
    swift_once();
  }
  uint64_t v21 = sub_1A96317F0();
  __swift_project_value_buffer(v21, (uint64_t)qword_1EB6EB630);
  uint64_t v22 = sub_1A96317D0();
  os_log_type_t v23 = sub_1A9632230();
  BOOL v24 = os_log_type_enabled(v22, v23);
  uint64_t v25 = v57;
  uint64_t v26 = v58;
  if (v24)
  {
    uint64_t v27 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v27 = 0;
    _os_log_impl(&dword_1A9410000, v22, v23, "Cannot retrieve cached news due to missing store", v27, 2u);
    MEMORY[0x1AD0F7300](v27, -1, -1);
  }

  return __swift_storeEnumTagSinglePayload(v25, 1, 1, v26);
}

uint64_t sub_1A96079EC(uint64_t a1, unint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v40 = a1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6DDBD8);
  MEMORY[0x1F4188790](v5 - 8);
  uint64_t v7 = (char *)v37 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_1A9631860();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8);
  uint64_t v11 = (char *)v37 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1EB6DE388 != -1) {
    swift_once();
  }
  uint64_t v12 = sub_1A96317F0();
  uint64_t v13 = __swift_project_value_buffer(v12, (uint64_t)qword_1EB6EB630);
  swift_bridgeObjectRetain_n();
  uint64_t v39 = v13;
  uint64_t v14 = sub_1A96317D0();
  os_log_type_t v15 = sub_1A9632230();
  if (os_log_type_enabled(v14, v15))
  {
    uint64_t v16 = swift_slowAlloc();
    v37[1] = v3;
    uint64_t v17 = v16;
    uint64_t v18 = swift_slowAlloc();
    uint64_t v38 = v9;
    uint64_t v19 = v8;
    uint64_t v20 = v18;
    uint64_t v42 = v18;
    *(_DWORD *)uint64_t v17 = 141558275;
    v41[0] = 1752392040;
    sub_1A9632350();
    *(_WORD *)(v17 + 12) = 2081;
    sub_1A9631510();
    v41[0] = sub_1A945C1DC(v40, a2, &v42);
    sub_1A9632350();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_1A9410000, v14, v15, "Attempting to retrieve news unavailable from cache; identifier=%{private,mask.hash}s",
      (uint8_t *)v17,
      0x16u);
    swift_arrayDestroy();
    uint64_t v21 = v20;
    uint64_t v8 = v19;
    uint64_t v9 = v38;
    MEMORY[0x1AD0F7300](v21, -1, -1);
    MEMORY[0x1AD0F7300](v17, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  if (!sub_1A95E44F0())
  {
    BOOL v24 = sub_1A96317D0();
    os_log_type_t v25 = sub_1A9632230();
    if (os_log_type_enabled(v24, v25))
    {
      uint64_t v26 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v26 = 0;
      _os_log_impl(&dword_1A9410000, v24, v25, "Cannot retrieve cached news unavailable due to missing store", v26, 2u);
      MEMORY[0x1AD0F7300](v26, -1, -1);
    }

    return 0;
  }
  sub_1A9631960();
  v41[3] = MEMORY[0x1E4FBB1A0];
  v41[4] = MEMORY[0x1E4FAA778];
  uint64_t v22 = v40;
  v41[0] = v40;
  v41[1] = a2;
  sub_1A9631510();
  sub_1A96318F0();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v41);
  uint64_t v23 = sub_1A96319F0();
  __swift_storeEnumTagSinglePayload((uint64_t)v7, 1, 1, v23);
  sub_1A9631930();
  swift_release();
  sub_1A944C480((uint64_t)v7, &qword_1EB6DDBD8);
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  uint64_t v27 = v42;
  sub_1A948A95C(v42);
  swift_bridgeObjectRetain_n();
  uint64_t v28 = sub_1A96317D0();
  uint64_t v29 = sub_1A9632230();
  BOOL v30 = os_log_type_enabled(v28, (os_log_type_t)v29);
  if (!v27)
  {
    if (v30)
    {
      uint64_t v35 = swift_slowAlloc();
      uint64_t v36 = swift_slowAlloc();
      uint64_t v42 = v36;
      *(_DWORD *)uint64_t v35 = 141558275;
      v41[0] = 1752392040;
      sub_1A9632350();
      *(_WORD *)(v35 + 12) = 2081;
      sub_1A9631510();
      v41[0] = sub_1A945C1DC(v22, a2, &v42);
      sub_1A9632350();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_1A9410000, v28, (os_log_type_t)v29, "Could not find news unavailable data in cache; identifier=%{private,mask.hash}s",
        (uint8_t *)v35,
        0x16u);
      swift_arrayDestroy();
      MEMORY[0x1AD0F7300](v36, -1, -1);
      MEMORY[0x1AD0F7300](v35, -1, -1);
      swift_release();
    }
    else
    {

      swift_bridgeObjectRelease_n();
      swift_release();
    }
    return 0;
  }
  if (v30)
  {
    uint64_t v31 = swift_slowAlloc();
    uint64_t v32 = swift_slowAlloc();
    uint64_t v42 = v32;
    *(_DWORD *)uint64_t v31 = 141558275;
    v41[0] = 1752392040;
    sub_1A9632350();
    *(_WORD *)(v31 + 12) = 2081;
    sub_1A9631510();
    v41[0] = sub_1A945C1DC(v22, a2, &v42);
    sub_1A9632350();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_1A9410000, v28, (os_log_type_t)v29, "Successfully retrieved news unavailable from cache; identifier=%{private,mask.hash}s",
      (uint8_t *)v31,
      0x16u);
    uint64_t v33 = 1;
    swift_arrayDestroy();
    MEMORY[0x1AD0F7300](v32, -1, -1);
    MEMORY[0x1AD0F7300](v31, -1, -1);
    swift_release();
  }
  else
  {

    swift_release();
    swift_bridgeObjectRelease_n();
    return 1;
  }
  return v33;
}

uint64_t sub_1A9608234@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, NSObject *a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6DD1D8);
  MEMORY[0x1F4188790](v8 - 8);
  uint64_t v10 = (char *)v30 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for TideEvents();
  MEMORY[0x1F4188790](v11);
  uint64_t v13 = (char *)v30 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_1A95E44F0();
  if (v14)
  {
    uint64_t v15 = *(void *)(v14 + 96);
    swift_retain();
    sub_1A95E0870(a1, a2, a3, v15, (uint64_t)v10);
    swift_release();
    int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v10, 1, v11);
    if (EnumTagSinglePayload == 1)
    {
      swift_release();
      sub_1A944C480((uint64_t)v10, &qword_1EB6DD1D8);
      uint64_t v22 = a4;
      uint64_t v23 = 1;
    }
    else
    {
      sub_1A9449580((uint64_t)v10, (uint64_t)v13);
      if (qword_1EB6DE388 != -1) {
        swift_once();
      }
      uint64_t v24 = sub_1A96317F0();
      __swift_project_value_buffer(v24, (uint64_t)qword_1EB6EB630);
      swift_bridgeObjectRetain_n();
      os_log_type_t v25 = sub_1A96317D0();
      os_log_type_t v26 = sub_1A9632230();
      if (os_log_type_enabled(v25, v26))
      {
        uint64_t v27 = swift_slowAlloc();
        uint64_t v28 = swift_slowAlloc();
        uint64_t v31 = v28;
        *(_DWORD *)uint64_t v27 = 141558275;
        uint64_t v32 = 1752392040;
        uint64_t v33 = v28;
        sub_1A9632350();
        *(_WORD *)(v27 + 12) = 2081;
        v30[1] = v27 + 14;
        sub_1A9631510();
        uint64_t v32 = sub_1A945C1DC(a1, a2, &v33);
        sub_1A9632350();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_1A9410000, v25, v26, "Successfully retrieved tideEvents from cache; identifier=%{private,mask.hash}s",
          (uint8_t *)v27,
          0x16u);
        uint64_t v29 = v31;
        swift_arrayDestroy();
        MEMORY[0x1AD0F7300](v29, -1, -1);
        MEMORY[0x1AD0F7300](v27, -1, -1);
        swift_release();
      }
      else
      {

        swift_release();
        swift_bridgeObjectRelease_n();
      }
      sub_1A9449580((uint64_t)v13, a4);
      uint64_t v22 = a4;
      uint64_t v23 = 0;
    }
    return __swift_storeEnumTagSinglePayload(v22, v23, 1, v11);
  }
  else
  {
    if (qword_1EB6DE388 != -1) {
      swift_once();
    }
    uint64_t v16 = sub_1A96317F0();
    __swift_project_value_buffer(v16, (uint64_t)qword_1EB6EB630);
    uint64_t v17 = sub_1A96317D0();
    os_log_type_t v18 = sub_1A9632230();
    if (os_log_type_enabled(v17, v18))
    {
      uint64_t v19 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v19 = 0;
      _os_log_impl(&dword_1A9410000, v17, v18, "Cannot retrieve cached tideEvents due to missing store", v19, 2u);
      MEMORY[0x1AD0F7300](v19, -1, -1);
    }

    return __swift_storeEnumTagSinglePayload(a4, 1, 1, v11);
  }
}

uint64_t sub_1A9608854(uint64_t a1, unint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v40 = a1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6DDBD8);
  MEMORY[0x1F4188790](v5 - 8);
  uint64_t v7 = (char *)v37 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_1A9631860();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8);
  uint64_t v11 = (char *)v37 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1EB6DE388 != -1) {
    swift_once();
  }
  uint64_t v12 = sub_1A96317F0();
  uint64_t v13 = __swift_project_value_buffer(v12, (uint64_t)qword_1EB6EB630);
  swift_bridgeObjectRetain_n();
  uint64_t v39 = v13;
  uint64_t v14 = sub_1A96317D0();
  os_log_type_t v15 = sub_1A9632230();
  if (os_log_type_enabled(v14, v15))
  {
    uint64_t v16 = swift_slowAlloc();
    v37[1] = v3;
    uint64_t v17 = v16;
    uint64_t v18 = swift_slowAlloc();
    uint64_t v38 = v9;
    uint64_t v19 = v8;
    uint64_t v20 = v18;
    uint64_t v42 = v18;
    *(_DWORD *)uint64_t v17 = 141558275;
    v41[0] = 1752392040;
    sub_1A9632350();
    *(_WORD *)(v17 + 12) = 2081;
    sub_1A9631510();
    v41[0] = sub_1A945C1DC(v40, a2, &v42);
    sub_1A9632350();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_1A9410000, v14, v15, "Attempting to retrieve tides unavailable from cache; identifier=%{private,mask.hash}s",
      (uint8_t *)v17,
      0x16u);
    swift_arrayDestroy();
    uint64_t v21 = v20;
    uint64_t v8 = v19;
    uint64_t v9 = v38;
    MEMORY[0x1AD0F7300](v21, -1, -1);
    MEMORY[0x1AD0F7300](v17, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  if (!sub_1A95E44F0())
  {
    uint64_t v24 = sub_1A96317D0();
    os_log_type_t v25 = sub_1A9632230();
    if (os_log_type_enabled(v24, v25))
    {
      os_log_type_t v26 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)os_log_type_t v26 = 0;
      _os_log_impl(&dword_1A9410000, v24, v25, "Cannot retrieve cached tides unavailable due to missing store", v26, 2u);
      MEMORY[0x1AD0F7300](v26, -1, -1);
    }

    return 0;
  }
  sub_1A9631960();
  v41[3] = MEMORY[0x1E4FBB1A0];
  v41[4] = MEMORY[0x1E4FAA778];
  uint64_t v22 = v40;
  v41[0] = v40;
  v41[1] = a2;
  sub_1A9631510();
  sub_1A96318F0();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v41);
  uint64_t v23 = sub_1A96319F0();
  __swift_storeEnumTagSinglePayload((uint64_t)v7, 1, 1, v23);
  sub_1A9631930();
  swift_release();
  sub_1A944C480((uint64_t)v7, &qword_1EB6DDBD8);
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  uint64_t v27 = v42;
  sub_1A948A95C(v42);
  swift_bridgeObjectRetain_n();
  uint64_t v28 = sub_1A96317D0();
  uint64_t v29 = sub_1A9632230();
  BOOL v30 = os_log_type_enabled(v28, (os_log_type_t)v29);
  if (!v27)
  {
    if (v30)
    {
      uint64_t v35 = swift_slowAlloc();
      uint64_t v36 = swift_slowAlloc();
      uint64_t v42 = v36;
      *(_DWORD *)uint64_t v35 = 141558275;
      v41[0] = 1752392040;
      sub_1A9632350();
      *(_WORD *)(v35 + 12) = 2081;
      sub_1A9631510();
      v41[0] = sub_1A945C1DC(v22, a2, &v42);
      sub_1A9632350();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_1A9410000, v28, (os_log_type_t)v29, "Could not find tideEvents unavailable data in cache; identifier=%{private,mask.hash}s",
        (uint8_t *)v35,
        0x16u);
      swift_arrayDestroy();
      MEMORY[0x1AD0F7300](v36, -1, -1);
      MEMORY[0x1AD0F7300](v35, -1, -1);
      swift_release();
    }
    else
    {

      swift_bridgeObjectRelease_n();
      swift_release();
    }
    return 0;
  }
  if (v30)
  {
    uint64_t v31 = swift_slowAlloc();
    uint64_t v32 = swift_slowAlloc();
    uint64_t v42 = v32;
    *(_DWORD *)uint64_t v31 = 141558275;
    v41[0] = 1752392040;
    sub_1A9632350();
    *(_WORD *)(v31 + 12) = 2081;
    sub_1A9631510();
    v41[0] = sub_1A945C1DC(v22, a2, &v42);
    sub_1A9632350();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_1A9410000, v28, (os_log_type_t)v29, "Successfully retrieved tideEvents unavailable from cache; identifier=%{private,mask.hash}s",
      (uint8_t *)v31,
      0x16u);
    uint64_t v33 = 1;
    swift_arrayDestroy();
    MEMORY[0x1AD0F7300](v32, -1, -1);
    MEMORY[0x1AD0F7300](v31, -1, -1);
    swift_release();
  }
  else
  {

    swift_release();
    swift_bridgeObjectRelease_n();
    return 1;
  }
  return v33;
}

uint64_t sub_1A960909C@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t *a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v55 = a4;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6DD620);
  MEMORY[0x1F4188790](v7 - 8);
  uint64_t v50 = (uint64_t)&v45 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v57 = type metadata accessor for WeatherAlerts();
  MEMORY[0x1F4188790](v57);
  uint64_t v48 = (uint64_t)&v45 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6DDBD8);
  MEMORY[0x1F4188790](v10 - 8);
  uint64_t v12 = (char *)&v45 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_1A9631860();
  uint64_t v51 = *(void *)(v13 - 8);
  uint64_t v52 = v13;
  MEMORY[0x1F4188790](v13);
  os_log_type_t v15 = (char *)&v45 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v49 = *a3;
  if (qword_1EB6DE388 != -1) {
    swift_once();
  }
  uint64_t v56 = a1;
  uint64_t v16 = sub_1A96317F0();
  uint64_t v17 = __swift_project_value_buffer(v16, (uint64_t)qword_1EB6EB630);
  swift_bridgeObjectRetain_n();
  uint64_t v53 = v17;
  uint64_t v18 = sub_1A96317D0();
  os_log_type_t v19 = sub_1A9632230();
  if (os_log_type_enabled(v18, v19))
  {
    uint64_t v20 = swift_slowAlloc();
    uint64_t v21 = swift_slowAlloc();
    uint64_t v64 = v21;
    *(_DWORD *)uint64_t v20 = 141558275;
    uint64_t v59 = 1752392040;
    sub_1A9632350();
    *(_WORD *)(v20 + 12) = 2081;
    sub_1A9631510();
    uint64_t v59 = sub_1A945C1DC(v56, a2, &v64);
    sub_1A9632350();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_1A9410000, v18, v19, "Attempting to retrieve weatherAlerts from cache; identifier=%{private,mask.hash}s",
      (uint8_t *)v20,
      0x16u);
    swift_arrayDestroy();
    MEMORY[0x1AD0F7300](v21, -1, -1);
    MEMORY[0x1AD0F7300](v20, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  if (!sub_1A95E44F0())
  {
    uint64_t v24 = sub_1A96317D0();
    os_log_type_t v25 = sub_1A9632230();
    if (os_log_type_enabled(v24, v25))
    {
      os_log_type_t v26 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)os_log_type_t v26 = 0;
      _os_log_impl(&dword_1A9410000, v24, v25, "Cannot retrieve cached weatherAlerts due to missing store", v26, 2u);
      MEMORY[0x1AD0F7300](v26, -1, -1);
    }

    goto LABEL_14;
  }
  sub_1A9631960();
  uint64_t v67 = MEMORY[0x1E4FBB1A0];
  uint64_t v68 = MEMORY[0x1E4FAA778];
  uint64_t v22 = v56;
  uint64_t v64 = v56;
  unint64_t v65 = a2;
  sub_1A9631510();
  sub_1A96318F0();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v64);
  uint64_t v23 = sub_1A96319F0();
  __swift_storeEnumTagSinglePayload((uint64_t)v12, 1, 1, v23);
  sub_1A9631930();
  swift_release();
  sub_1A944C480((uint64_t)v12, &qword_1EB6DDBD8);
  (*(void (**)(char *, uint64_t))(v51 + 8))(v15, v52);
  uint64_t v27 = v59;
  if (!v59)
  {
    swift_bridgeObjectRetain_n();
    uint64_t v35 = sub_1A96317D0();
    os_log_type_t v36 = sub_1A9632230();
    if (os_log_type_enabled(v35, v36))
    {
      uint64_t v37 = swift_slowAlloc();
      uint64_t v38 = swift_slowAlloc();
      uint64_t v64 = v38;
      *(_DWORD *)uint64_t v37 = 141558275;
      uint64_t v59 = 1752392040;
      sub_1A9632350();
      *(_WORD *)(v37 + 12) = 2081;
      sub_1A9631510();
      uint64_t v59 = sub_1A945C1DC(v22, a2, &v64);
      sub_1A9632350();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_1A9410000, v35, v36, "Could not find weatherAlerts data in cache; identifier=%{private,mask.hash}s",
        (uint8_t *)v37,
        0x16u);
      uint64_t v33 = 1;
      swift_arrayDestroy();
      MEMORY[0x1AD0F7300](v38, -1, -1);
      MEMORY[0x1AD0F7300](v37, -1, -1);
      swift_release();

      return __swift_storeEnumTagSinglePayload(v55, v33, 1, v57);
    }

    swift_bridgeObjectRelease_n();
    swift_release();
    goto LABEL_14;
  }
  unint64_t v29 = v60;
  uint64_t v28 = v61;
  uint64_t v31 = v62;
  uint64_t v30 = v63;
  uint64_t v64 = v59;
  unint64_t v65 = v60;
  uint64_t v66 = v61;
  uint64_t v67 = v62;
  uint64_t v68 = v63;
  uint64_t v32 = v50;
  sub_1A95DB14C(v49, v50);
  if (__swift_getEnumTagSinglePayload(v32, 1, v57) == 1)
  {
    sub_1A948A95C(v27);
    swift_release();
    sub_1A944C480(v32, &qword_1EB6DD620);
LABEL_14:
    uint64_t v33 = 1;
    return __swift_storeEnumTagSinglePayload(v55, v33, 1, v57);
  }
  uint64_t v46 = v27;
  unint64_t v47 = v29;
  uint64_t v49 = v28;
  uint64_t v51 = v31;
  uint64_t v52 = v30;
  sub_1A9449580(v32, v48);
  swift_bridgeObjectRetain_n();
  uint64_t v39 = sub_1A96317D0();
  os_log_type_t v40 = sub_1A9632230();
  os_log_t v54 = v39;
  if (os_log_type_enabled(v39, v40))
  {
    uint64_t v41 = v22;
    uint64_t v42 = swift_slowAlloc();
    uint64_t v43 = swift_slowAlloc();
    uint64_t v59 = v43;
    *(_DWORD *)uint64_t v42 = 141558275;
    uint64_t v58 = 1752392040;
    sub_1A9632350();
    *(_WORD *)(v42 + 12) = 2081;
    sub_1A9631510();
    uint64_t v58 = sub_1A945C1DC(v41, a2, &v59);
    sub_1A9632350();
    swift_bridgeObjectRelease_n();
    os_log_t v44 = v54;
    _os_log_impl(&dword_1A9410000, v54, v40, "Successfully retrieved weatherAlerts from cache; identifier=%{private,mask.hash}s",
      (uint8_t *)v42,
      0x16u);
    swift_arrayDestroy();
    MEMORY[0x1AD0F7300](v43, -1, -1);
    MEMORY[0x1AD0F7300](v42, -1, -1);
    sub_1A948A95C(v46);
    swift_release();
  }
  else
  {
    swift_bridgeObjectRelease_n();
    sub_1A948A95C(v46);

    swift_release();
  }
  sub_1A9449580(v48, v55);
  uint64_t v33 = 0;
  return __swift_storeEnumTagSinglePayload(v55, v33, 1, v57);
}

uint64_t sub_1A9609ACC(uint64_t a1, unint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v40 = a1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6DDBD8);
  MEMORY[0x1F4188790](v5 - 8);
  uint64_t v7 = (char *)v37 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_1A9631860();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8);
  uint64_t v11 = (char *)v37 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1EB6DE388 != -1) {
    swift_once();
  }
  uint64_t v12 = sub_1A96317F0();
  uint64_t v13 = __swift_project_value_buffer(v12, (uint64_t)qword_1EB6EB630);
  swift_bridgeObjectRetain_n();
  uint64_t v39 = v13;
  uint64_t v14 = sub_1A96317D0();
  os_log_type_t v15 = sub_1A9632230();
  if (os_log_type_enabled(v14, v15))
  {
    uint64_t v16 = swift_slowAlloc();
    v37[1] = v3;
    uint64_t v17 = v16;
    uint64_t v18 = swift_slowAlloc();
    uint64_t v38 = v9;
    uint64_t v19 = v8;
    uint64_t v20 = v18;
    uint64_t v42 = v18;
    *(_DWORD *)uint64_t v17 = 141558275;
    v41[0] = 1752392040;
    sub_1A9632350();
    *(_WORD *)(v17 + 12) = 2081;
    sub_1A9631510();
    v41[0] = sub_1A945C1DC(v40, a2, &v42);
    sub_1A9632350();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_1A9410000, v14, v15, "Attempting to retrieve weatherAlerts unavailable from cache; identifier=%{private,mask.hash}s",
      (uint8_t *)v17,
      0x16u);
    swift_arrayDestroy();
    uint64_t v21 = v20;
    uint64_t v8 = v19;
    uint64_t v9 = v38;
    MEMORY[0x1AD0F7300](v21, -1, -1);
    MEMORY[0x1AD0F7300](v17, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  if (!sub_1A95E44F0())
  {
    uint64_t v24 = sub_1A96317D0();
    os_log_type_t v25 = sub_1A9632230();
    if (os_log_type_enabled(v24, v25))
    {
      os_log_type_t v26 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)os_log_type_t v26 = 0;
      _os_log_impl(&dword_1A9410000, v24, v25, "Cannot retrieve cached weatherAlerts unavailable due to missing store", v26, 2u);
      MEMORY[0x1AD0F7300](v26, -1, -1);
    }

    return 0;
  }
  sub_1A9631960();
  v41[3] = MEMORY[0x1E4FBB1A0];
  v41[4] = MEMORY[0x1E4FAA778];
  uint64_t v22 = v40;
  v41[0] = v40;
  v41[1] = a2;
  sub_1A9631510();
  sub_1A96318F0();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v41);
  uint64_t v23 = sub_1A96319F0();
  __swift_storeEnumTagSinglePayload((uint64_t)v7, 1, 1, v23);
  sub_1A9631930();
  swift_release();
  sub_1A944C480((uint64_t)v7, &qword_1EB6DDBD8);
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  uint64_t v27 = v42;
  sub_1A948A95C(v42);
  swift_bridgeObjectRetain_n();
  uint64_t v28 = sub_1A96317D0();
  uint64_t v29 = sub_1A9632230();
  BOOL v30 = os_log_type_enabled(v28, (os_log_type_t)v29);
  if (!v27)
  {
    if (v30)
    {
      uint64_t v35 = swift_slowAlloc();
      uint64_t v36 = swift_slowAlloc();
      uint64_t v42 = v36;
      *(_DWORD *)uint64_t v35 = 141558275;
      v41[0] = 1752392040;
      sub_1A9632350();
      *(_WORD *)(v35 + 12) = 2081;
      sub_1A9631510();
      v41[0] = sub_1A945C1DC(v22, a2, &v42);
      sub_1A9632350();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_1A9410000, v28, (os_log_type_t)v29, "Could not find weatherAlerts unavailable data in cache; identifier=%{private,mask.hash}s",
        (uint8_t *)v35,
        0x16u);
      swift_arrayDestroy();
      MEMORY[0x1AD0F7300](v36, -1, -1);
      MEMORY[0x1AD0F7300](v35, -1, -1);
      swift_release();
    }
    else
    {

      swift_bridgeObjectRelease_n();
      swift_release();
    }
    return 0;
  }
  if (v30)
  {
    uint64_t v31 = swift_slowAlloc();
    uint64_t v32 = swift_slowAlloc();
    uint64_t v42 = v32;
    *(_DWORD *)uint64_t v31 = 141558275;
    v41[0] = 1752392040;
    sub_1A9632350();
    *(_WORD *)(v31 + 12) = 2081;
    sub_1A9631510();
    v41[0] = sub_1A945C1DC(v22, a2, &v42);
    sub_1A9632350();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_1A9410000, v28, (os_log_type_t)v29, "Successfully retrieved weatherAlerts unavailable from cache; identifier=%{private,mask.hash}s",
      (uint8_t *)v31,
      0x16u);
    uint64_t v33 = 1;
    swift_arrayDestroy();
    MEMORY[0x1AD0F7300](v32, -1, -1);
    MEMORY[0x1AD0F7300](v31, -1, -1);
    swift_release();
  }
  else
  {

    swift_release();
    swift_bridgeObjectRelease_n();
    return 1;
  }
  return v33;
}

void sub_1A960A314(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t *a3@<X2>, uint64_t *a4@<X8>)
{
  uint64_t v47 = a1;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6DDBD8);
  MEMORY[0x1F4188790](v7 - 8);
  uint64_t v9 = (char *)v41 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_1A9631860();
  Class isa = v10[-1].isa;
  os_log_t v45 = v10;
  MEMORY[0x1F4188790](v10);
  uint64_t v12 = (char *)v41 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v42 = *a3;
  if (qword_1EB6DE388 != -1) {
    swift_once();
  }
  uint64_t v13 = sub_1A96317F0();
  uint64_t v14 = __swift_project_value_buffer(v13, (uint64_t)qword_1EB6EB630);
  swift_bridgeObjectRetain_n();
  os_log_type_t v15 = sub_1A96317D0();
  os_log_type_t v16 = sub_1A9632230();
  if (os_log_type_enabled(v15, v16))
  {
    uint64_t v17 = swift_slowAlloc();
    uint64_t v18 = swift_slowAlloc();
    uint64_t v43 = v14;
    uint64_t v19 = v18;
    uint64_t v54 = v18;
    *(_DWORD *)uint64_t v17 = 141558275;
    uint64_t v49 = 1752392040;
    sub_1A9632350();
    *(_WORD *)(v17 + 12) = 2081;
    sub_1A9631510();
    uint64_t v49 = sub_1A945C1DC(v47, a2, &v54);
    sub_1A9632350();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_1A9410000, v15, v16, "Attempting to retrieve historicalFacts from cache; identifier=%{private,mask.hash}s",
      (uint8_t *)v17,
      0x16u);
    swift_arrayDestroy();
    uint64_t v20 = v19;
    uint64_t v14 = v43;
    MEMORY[0x1AD0F7300](v20, -1, -1);
    MEMORY[0x1AD0F7300](v17, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  if (sub_1A95E44F0())
  {
    sub_1A9631960();
    uint64_t v57 = MEMORY[0x1E4FBB1A0];
    uint64_t v58 = (objc_class *)MEMORY[0x1E4FAA778];
    uint64_t v21 = v47;
    uint64_t v54 = v47;
    unint64_t v55 = a2;
    sub_1A9631510();
    sub_1A96318F0();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v54);
    uint64_t v22 = sub_1A96319F0();
    __swift_storeEnumTagSinglePayload((uint64_t)v9, 1, 1, v22);
    sub_1A9631930();
    uint64_t v46 = a4;
    swift_release();
    sub_1A944C480((uint64_t)v9, &qword_1EB6DDBD8);
    (*((void (**)(char *, os_log_t))isa + 1))(v12, v45);
    if (!v49)
    {
      swift_bridgeObjectRetain_n();
      uint64_t v37 = sub_1A96317D0();
      os_log_type_t v38 = sub_1A9632230();
      if (os_log_type_enabled(v37, v38))
      {
        uint64_t v39 = swift_slowAlloc();
        uint64_t v40 = swift_slowAlloc();
        uint64_t v54 = v40;
        *(_DWORD *)uint64_t v39 = 141558275;
        uint64_t v49 = 1752392040;
        sub_1A9632350();
        *(_WORD *)(v39 + 12) = 2081;
        sub_1A9631510();
        uint64_t v49 = sub_1A945C1DC(v21, a2, &v54);
        sub_1A9632350();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_1A9410000, v37, v38, "Could not find historicalFacts data in cache; identifier=%{private,mask.hash}s",
          (uint8_t *)v39,
          0x16u);
        swift_arrayDestroy();
        MEMORY[0x1AD0F7300](v40, -1, -1);
        MEMORY[0x1AD0F7300](v39, -1, -1);
        swift_release();
      }
      else
      {

        swift_bridgeObjectRelease_n();
        swift_release();
      }
      uint64_t v31 = 0;
      goto LABEL_22;
    }
    uint64_t v43 = v14;
    uint64_t v27 = v50;
    uint64_t v26 = v51;
    uint64_t v29 = v52;
    uint64_t v28 = v53;
    uint64_t v54 = v49;
    unint64_t v55 = v50;
    uint64_t v56 = v51;
    uint64_t v57 = v52;
    uint64_t v58 = v53;
    uint64_t v30 = v49;
    sub_1A95DC73C(v42, &v49);
    uint64_t v31 = v49;
    if (v49)
    {
      v41[0] = v30;
      v41[1] = v27;
      v41[2] = v26;
      uint64_t v42 = v29;
      Class isa = v28;
      swift_bridgeObjectRetain_n();
      uint64_t v32 = sub_1A96317D0();
      os_log_type_t v33 = sub_1A9632230();
      os_log_t v45 = v32;
      if (os_log_type_enabled(v32, v33))
      {
        uint64_t v34 = swift_slowAlloc();
        uint64_t v35 = swift_slowAlloc();
        uint64_t v49 = v35;
        *(_DWORD *)uint64_t v34 = 141558275;
        uint64_t v48 = 1752392040;
        sub_1A9632350();
        *(_WORD *)(v34 + 12) = 2081;
        sub_1A9631510();
        uint64_t v48 = sub_1A945C1DC(v47, a2, &v49);
        sub_1A9632350();
        swift_bridgeObjectRelease_n();
        os_log_t v36 = v45;
        _os_log_impl(&dword_1A9410000, v45, v33, "Successfully retrieved historicalFacts from cache; identifier=%{private,mask.hash}s",
          (uint8_t *)v34,
          0x16u);
        swift_arrayDestroy();
        MEMORY[0x1AD0F7300](v35, -1, -1);
        MEMORY[0x1AD0F7300](v34, -1, -1);
        sub_1A948A95C(v41[0]);
        swift_release();

LABEL_22:
        a4 = v46;
        goto LABEL_23;
      }
      swift_bridgeObjectRelease_n();
      sub_1A948A95C(v41[0]);
    }
    else
    {
      sub_1A948A95C(v30);
    }
    swift_release();
    goto LABEL_22;
  }
  uint64_t v23 = sub_1A96317D0();
  os_log_type_t v24 = sub_1A9632230();
  if (os_log_type_enabled(v23, v24))
  {
    os_log_type_t v25 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)os_log_type_t v25 = 0;
    _os_log_impl(&dword_1A9410000, v23, v24, "Cannot retrieve cached historicalFacts due to missing store", v25, 2u);
    MEMORY[0x1AD0F7300](v25, -1, -1);
  }

  uint64_t v31 = 0;
LABEL_23:
  *a4 = v31;
}

uint64_t sub_1A960AC18(uint64_t a1, unint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v40 = a1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6DDBD8);
  MEMORY[0x1F4188790](v5 - 8);
  uint64_t v7 = (char *)v37 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_1A9631860();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8);
  uint64_t v11 = (char *)v37 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1EB6DE388 != -1) {
    swift_once();
  }
  uint64_t v12 = sub_1A96317F0();
  uint64_t v13 = __swift_project_value_buffer(v12, (uint64_t)qword_1EB6EB630);
  swift_bridgeObjectRetain_n();
  uint64_t v39 = v13;
  uint64_t v14 = sub_1A96317D0();
  os_log_type_t v15 = sub_1A9632230();
  if (os_log_type_enabled(v14, v15))
  {
    uint64_t v16 = swift_slowAlloc();
    v37[1] = v3;
    uint64_t v17 = v16;
    uint64_t v18 = swift_slowAlloc();
    uint64_t v38 = v9;
    uint64_t v19 = v8;
    uint64_t v20 = v18;
    uint64_t v42 = v18;
    *(_DWORD *)uint64_t v17 = 141558275;
    v41[0] = 1752392040;
    sub_1A9632350();
    *(_WORD *)(v17 + 12) = 2081;
    sub_1A9631510();
    v41[0] = sub_1A945C1DC(v40, a2, &v42);
    sub_1A9632350();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_1A9410000, v14, v15, "Attempting to retrieve historicalFacts unavailable from cache; identifier=%{private,mask.hash}s",
      (uint8_t *)v17,
      0x16u);
    swift_arrayDestroy();
    uint64_t v21 = v20;
    uint64_t v8 = v19;
    uint64_t v9 = v38;
    MEMORY[0x1AD0F7300](v21, -1, -1);
    MEMORY[0x1AD0F7300](v17, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  if (!sub_1A95E44F0())
  {
    os_log_type_t v24 = sub_1A96317D0();
    os_log_type_t v25 = sub_1A9632230();
    if (os_log_type_enabled(v24, v25))
    {
      uint64_t v26 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v26 = 0;
      _os_log_impl(&dword_1A9410000, v24, v25, "Cannot retrieve cached historicalFacts unavailable due to missing store", v26, 2u);
      MEMORY[0x1AD0F7300](v26, -1, -1);
    }

    return 0;
  }
  sub_1A9631960();
  uint64_t v41[3] = MEMORY[0x1E4FBB1A0];
  v41[4] = MEMORY[0x1E4FAA778];
  uint64_t v22 = v40;
  v41[0] = v40;
  v41[1] = a2;
  sub_1A9631510();
  sub_1A96318F0();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v41);
  uint64_t v23 = sub_1A96319F0();
  __swift_storeEnumTagSinglePayload((uint64_t)v7, 1, 1, v23);
  sub_1A9631930();
  swift_release();
  sub_1A944C480((uint64_t)v7, &qword_1EB6DDBD8);
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  uint64_t v27 = v42;
  sub_1A948A95C(v42);
  swift_bridgeObjectRetain_n();
  uint64_t v28 = sub_1A96317D0();
  uint64_t v29 = sub_1A9632230();
  BOOL v30 = os_log_type_enabled(v28, (os_log_type_t)v29);
  if (!v27)
  {
    if (v30)
    {
      uint64_t v35 = swift_slowAlloc();
      uint64_t v36 = swift_slowAlloc();
      uint64_t v42 = v36;
      *(_DWORD *)uint64_t v35 = 141558275;
      v41[0] = 1752392040;
      sub_1A9632350();
      *(_WORD *)(v35 + 12) = 2081;
      sub_1A9631510();
      v41[0] = sub_1A945C1DC(v22, a2, &v42);
      sub_1A9632350();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_1A9410000, v28, (os_log_type_t)v29, "Could not find historicalFacts unavailable data in cache; identifier=%{private,mask.hash}s",
        (uint8_t *)v35,
        0x16u);
      swift_arrayDestroy();
      MEMORY[0x1AD0F7300](v36, -1, -1);
      MEMORY[0x1AD0F7300](v35, -1, -1);
      swift_release();
    }
    else
    {

      swift_bridgeObjectRelease_n();
      swift_release();
    }
    return 0;
  }
  if (v30)
  {
    uint64_t v31 = swift_slowAlloc();
    uint64_t v32 = swift_slowAlloc();
    uint64_t v42 = v32;
    *(_DWORD *)uint64_t v31 = 141558275;
    v41[0] = 1752392040;
    sub_1A9632350();
    *(_WORD *)(v31 + 12) = 2081;
    sub_1A9631510();
    v41[0] = sub_1A945C1DC(v22, a2, &v42);
    sub_1A9632350();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_1A9410000, v28, (os_log_type_t)v29, "Successfully retrieved historicalFacts unavailable from cache; identifier=%{private,mask.hash}s",
      (uint8_t *)v31,
      0x16u);
    uint64_t v33 = 1;
    swift_arrayDestroy();
    MEMORY[0x1AD0F7300](v32, -1, -1);
    MEMORY[0x1AD0F7300](v31, -1, -1);
    swift_release();
  }
  else
  {

    swift_release();
    swift_bridgeObjectRelease_n();
    return 1;
  }
  return v33;
}

uint64_t sub_1A960B460@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t *a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v55 = a4;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6DDE70);
  MEMORY[0x1F4188790](v7 - 8);
  uint64_t v50 = (uint64_t)&v45 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v57 = type metadata accessor for WeatherChange();
  MEMORY[0x1F4188790](v57);
  uint64_t v48 = (uint64_t)&v45 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6DDBD8);
  MEMORY[0x1F4188790](v10 - 8);
  uint64_t v12 = (char *)&v45 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_1A9631860();
  uint64_t v51 = *(void *)(v13 - 8);
  uint64_t v52 = v13;
  MEMORY[0x1F4188790](v13);
  os_log_type_t v15 = (char *)&v45 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v49 = *a3;
  if (qword_1EB6DE388 != -1) {
    swift_once();
  }
  uint64_t v56 = a1;
  uint64_t v16 = sub_1A96317F0();
  uint64_t v17 = __swift_project_value_buffer(v16, (uint64_t)qword_1EB6EB630);
  swift_bridgeObjectRetain_n();
  uint64_t v53 = v17;
  uint64_t v18 = sub_1A96317D0();
  os_log_type_t v19 = sub_1A9632230();
  if (os_log_type_enabled(v18, v19))
  {
    uint64_t v20 = swift_slowAlloc();
    uint64_t v21 = swift_slowAlloc();
    uint64_t v64 = v21;
    *(_DWORD *)uint64_t v20 = 141558275;
    uint64_t v59 = 1752392040;
    sub_1A9632350();
    *(_WORD *)(v20 + 12) = 2081;
    sub_1A9631510();
    uint64_t v59 = sub_1A945C1DC(v56, a2, &v64);
    sub_1A9632350();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_1A9410000, v18, v19, "Attempting to retrieve weatherChange from cache; identifier=%{private,mask.hash}s",
      (uint8_t *)v20,
      0x16u);
    swift_arrayDestroy();
    MEMORY[0x1AD0F7300](v21, -1, -1);
    MEMORY[0x1AD0F7300](v20, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  if (!sub_1A95E44F0())
  {
    os_log_type_t v24 = sub_1A96317D0();
    os_log_type_t v25 = sub_1A9632230();
    if (os_log_type_enabled(v24, v25))
    {
      uint64_t v26 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v26 = 0;
      _os_log_impl(&dword_1A9410000, v24, v25, "Cannot retrieve cached weatherChange due to missing store", v26, 2u);
      MEMORY[0x1AD0F7300](v26, -1, -1);
    }

    goto LABEL_14;
  }
  sub_1A9631960();
  uint64_t v67 = MEMORY[0x1E4FBB1A0];
  uint64_t v68 = MEMORY[0x1E4FAA778];
  uint64_t v22 = v56;
  uint64_t v64 = v56;
  unint64_t v65 = a2;
  sub_1A9631510();
  sub_1A96318F0();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v64);
  uint64_t v23 = sub_1A96319F0();
  __swift_storeEnumTagSinglePayload((uint64_t)v12, 1, 1, v23);
  sub_1A9631930();
  swift_release();
  sub_1A944C480((uint64_t)v12, &qword_1EB6DDBD8);
  (*(void (**)(char *, uint64_t))(v51 + 8))(v15, v52);
  uint64_t v27 = v59;
  if (!v59)
  {
    swift_bridgeObjectRetain_n();
    uint64_t v35 = sub_1A96317D0();
    os_log_type_t v36 = sub_1A9632230();
    if (os_log_type_enabled(v35, v36))
    {
      uint64_t v37 = swift_slowAlloc();
      uint64_t v38 = swift_slowAlloc();
      uint64_t v64 = v38;
      *(_DWORD *)uint64_t v37 = 141558275;
      uint64_t v59 = 1752392040;
      sub_1A9632350();
      *(_WORD *)(v37 + 12) = 2081;
      sub_1A9631510();
      uint64_t v59 = sub_1A945C1DC(v22, a2, &v64);
      sub_1A9632350();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_1A9410000, v35, v36, "Could not find weatherChange data in cache; identifier=%{private,mask.hash}s",
        (uint8_t *)v37,
        0x16u);
      uint64_t v33 = 1;
      swift_arrayDestroy();
      MEMORY[0x1AD0F7300](v38, -1, -1);
      MEMORY[0x1AD0F7300](v37, -1, -1);
      swift_release();

      return __swift_storeEnumTagSinglePayload(v55, v33, 1, v57);
    }

    swift_bridgeObjectRelease_n();
    swift_release();
    goto LABEL_14;
  }
  unint64_t v29 = v60;
  uint64_t v28 = v61;
  uint64_t v31 = v62;
  uint64_t v30 = v63;
  uint64_t v64 = v59;
  unint64_t v65 = v60;
  uint64_t v66 = v61;
  uint64_t v67 = v62;
  uint64_t v68 = v63;
  uint64_t v32 = v50;
  sub_1A95DB89C(v49, v50);
  if (__swift_getEnumTagSinglePayload(v32, 1, v57) == 1)
  {
    sub_1A948A95C(v27);
    swift_release();
    sub_1A944C480(v32, &qword_1EB6DDE70);
LABEL_14:
    uint64_t v33 = 1;
    return __swift_storeEnumTagSinglePayload(v55, v33, 1, v57);
  }
  uint64_t v46 = v27;
  unint64_t v47 = v29;
  uint64_t v49 = v28;
  uint64_t v51 = v31;
  uint64_t v52 = v30;
  sub_1A9449580(v32, v48);
  swift_bridgeObjectRetain_n();
  uint64_t v39 = sub_1A96317D0();
  os_log_type_t v40 = sub_1A9632230();
  os_log_t v54 = v39;
  if (os_log_type_enabled(v39, v40))
  {
    uint64_t v41 = v22;
    uint64_t v42 = swift_slowAlloc();
    uint64_t v43 = swift_slowAlloc();
    uint64_t v59 = v43;
    *(_DWORD *)uint64_t v42 = 141558275;
    uint64_t v58 = 1752392040;
    sub_1A9632350();
    *(_WORD *)(v42 + 12) = 2081;
    sub_1A9631510();
    uint64_t v58 = sub_1A945C1DC(v41, a2, &v59);
    sub_1A9632350();
    swift_bridgeObjectRelease_n();
    os_log_t v44 = v54;
    _os_log_impl(&dword_1A9410000, v54, v40, "Successfully retrieved weatherChange from cache; identifier=%{private,mask.hash}s",
      (uint8_t *)v42,
      0x16u);
    swift_arrayDestroy();
    MEMORY[0x1AD0F7300](v43, -1, -1);
    MEMORY[0x1AD0F7300](v42, -1, -1);
    sub_1A948A95C(v46);
    swift_release();
  }
  else
  {
    swift_bridgeObjectRelease_n();
    sub_1A948A95C(v46);

    swift_release();
  }
  sub_1A9449580(v48, v55);
  uint64_t v33 = 0;
  return __swift_storeEnumTagSinglePayload(v55, v33, 1, v57);
}

uint64_t sub_1A960BE90(uint64_t a1, unint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v40 = a1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6DDBD8);
  MEMORY[0x1F4188790](v5 - 8);
  uint64_t v7 = (char *)v37 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_1A9631860();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8);
  uint64_t v11 = (char *)v37 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1EB6DE388 != -1) {
    swift_once();
  }
  uint64_t v12 = sub_1A96317F0();
  uint64_t v13 = __swift_project_value_buffer(v12, (uint64_t)qword_1EB6EB630);
  swift_bridgeObjectRetain_n();
  uint64_t v39 = v13;
  uint64_t v14 = sub_1A96317D0();
  os_log_type_t v15 = sub_1A9632230();
  if (os_log_type_enabled(v14, v15))
  {
    uint64_t v16 = swift_slowAlloc();
    v37[1] = v3;
    uint64_t v17 = v16;
    uint64_t v18 = swift_slowAlloc();
    uint64_t v38 = v9;
    uint64_t v19 = v8;
    uint64_t v20 = v18;
    uint64_t v42 = v18;
    *(_DWORD *)uint64_t v17 = 141558275;
    v41[0] = 1752392040;
    sub_1A9632350();
    *(_WORD *)(v17 + 12) = 2081;
    sub_1A9631510();
    v41[0] = sub_1A945C1DC(v40, a2, &v42);
    sub_1A9632350();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_1A9410000, v14, v15, "Attempting to retrieve weatherChange unavailable from cache; identifier=%{private,mask.hash}s",
      (uint8_t *)v17,
      0x16u);
    swift_arrayDestroy();
    uint64_t v21 = v20;
    uint64_t v8 = v19;
    uint64_t v9 = v38;
    MEMORY[0x1AD0F7300](v21, -1, -1);
    MEMORY[0x1AD0F7300](v17, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  if (!sub_1A95E44F0())
  {
    os_log_type_t v24 = sub_1A96317D0();
    os_log_type_t v25 = sub_1A9632230();
    if (os_log_type_enabled(v24, v25))
    {
      uint64_t v26 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v26 = 0;
      _os_log_impl(&dword_1A9410000, v24, v25, "Cannot retrieve cached weatherChange unavailable due to missing store", v26, 2u);
      MEMORY[0x1AD0F7300](v26, -1, -1);
    }

    return 0;
  }
  sub_1A9631960();
  uint64_t v41[3] = MEMORY[0x1E4FBB1A0];
  v41[4] = MEMORY[0x1E4FAA778];
  uint64_t v22 = v40;
  v41[0] = v40;
  v41[1] = a2;
  sub_1A9631510();
  sub_1A96318F0();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v41);
  uint64_t v23 = sub_1A96319F0();
  __swift_storeEnumTagSinglePayload((uint64_t)v7, 1, 1, v23);
  sub_1A9631930();
  swift_release();
  sub_1A944C480((uint64_t)v7, &qword_1EB6DDBD8);
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  uint64_t v27 = v42;
  sub_1A948A95C(v42);
  swift_bridgeObjectRetain_n();
  uint64_t v28 = sub_1A96317D0();
  uint64_t v29 = sub_1A9632230();
  BOOL v30 = os_log_type_enabled(v28, (os_log_type_t)v29);
  if (!v27)
  {
    if (v30)
    {
      uint64_t v35 = swift_slowAlloc();
      uint64_t v36 = swift_slowAlloc();
      uint64_t v42 = v36;
      *(_DWORD *)uint64_t v35 = 141558275;
      v41[0] = 1752392040;
      sub_1A9632350();
      *(_WORD *)(v35 + 12) = 2081;
      sub_1A9631510();
      v41[0] = sub_1A945C1DC(v22, a2, &v42);
      sub_1A9632350();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_1A9410000, v28, (os_log_type_t)v29, "Could not find weatherChange unavailable data in cache; identifier=%{private,mask.hash}s",
        (uint8_t *)v35,
        0x16u);
      swift_arrayDestroy();
      MEMORY[0x1AD0F7300](v36, -1, -1);
      MEMORY[0x1AD0F7300](v35, -1, -1);
      swift_release();
    }
    else
    {

      swift_bridgeObjectRelease_n();
      swift_release();
    }
    return 0;
  }
  if (v30)
  {
    uint64_t v31 = swift_slowAlloc();
    uint64_t v32 = swift_slowAlloc();
    uint64_t v42 = v32;
    *(_DWORD *)uint64_t v31 = 141558275;
    v41[0] = 1752392040;
    sub_1A9632350();
    *(_WORD *)(v31 + 12) = 2081;
    sub_1A9631510();
    v41[0] = sub_1A945C1DC(v22, a2, &v42);
    sub_1A9632350();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_1A9410000, v28, (os_log_type_t)v29, "Successfully retrieved weatherChange unavailable from cache; identifier=%{private,mask.hash}s",
      (uint8_t *)v31,
      0x16u);
    uint64_t v33 = 1;
    swift_arrayDestroy();
    MEMORY[0x1AD0F7300](v32, -1, -1);
    MEMORY[0x1AD0F7300](v31, -1, -1);
    swift_release();
  }
  else
  {

    swift_release();
    swift_bridgeObjectRelease_n();
    return 1;
  }
  return v33;
}

uint64_t sub_1A960C6D8@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t *a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v55 = a4;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6DDA28);
  MEMORY[0x1F4188790](v7 - 8);
  uint64_t v50 = (uint64_t)&v45 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v57 = type metadata accessor for WeatherComparisons();
  MEMORY[0x1F4188790](v57);
  uint64_t v48 = (uint64_t)&v45 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6DDBD8);
  MEMORY[0x1F4188790](v10 - 8);
  uint64_t v12 = (char *)&v45 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_1A9631860();
  uint64_t v51 = *(void *)(v13 - 8);
  uint64_t v52 = v13;
  MEMORY[0x1F4188790](v13);
  os_log_type_t v15 = (char *)&v45 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v49 = *a3;
  if (qword_1EB6DE388 != -1) {
    swift_once();
  }
  uint64_t v56 = a1;
  uint64_t v16 = sub_1A96317F0();
  uint64_t v17 = __swift_project_value_buffer(v16, (uint64_t)qword_1EB6EB630);
  swift_bridgeObjectRetain_n();
  uint64_t v53 = v17;
  uint64_t v18 = sub_1A96317D0();
  os_log_type_t v19 = sub_1A9632230();
  if (os_log_type_enabled(v18, v19))
  {
    uint64_t v20 = swift_slowAlloc();
    uint64_t v21 = swift_slowAlloc();
    uint64_t v64 = v21;
    *(_DWORD *)uint64_t v20 = 141558275;
    uint64_t v59 = 1752392040;
    sub_1A9632350();
    *(_WORD *)(v20 + 12) = 2081;
    sub_1A9631510();
    uint64_t v59 = sub_1A945C1DC(v56, a2, &v64);
    sub_1A9632350();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_1A9410000, v18, v19, "Attempting to retrieve weatherComparison from cache; identifier=%{private,mask.hash}s",
      (uint8_t *)v20,
      0x16u);
    swift_arrayDestroy();
    MEMORY[0x1AD0F7300](v21, -1, -1);
    MEMORY[0x1AD0F7300](v20, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  if (!sub_1A95E44F0())
  {
    os_log_type_t v24 = sub_1A96317D0();
    os_log_type_t v25 = sub_1A9632230();
    if (os_log_type_enabled(v24, v25))
    {
      uint64_t v26 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v26 = 0;
      _os_log_impl(&dword_1A9410000, v24, v25, "Cannot retrieve cached weatherComparison due to missing store", v26, 2u);
      MEMORY[0x1AD0F7300](v26, -1, -1);
    }

    goto LABEL_14;
  }
  sub_1A9631960();
  uint64_t v67 = MEMORY[0x1E4FBB1A0];
  uint64_t v68 = MEMORY[0x1E4FAA778];
  uint64_t v22 = v56;
  uint64_t v64 = v56;
  unint64_t v65 = a2;
  sub_1A9631510();
  sub_1A96318F0();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v64);
  uint64_t v23 = sub_1A96319F0();
  __swift_storeEnumTagSinglePayload((uint64_t)v12, 1, 1, v23);
  sub_1A9631930();
  swift_release();
  sub_1A944C480((uint64_t)v12, &qword_1EB6DDBD8);
  (*(void (**)(char *, uint64_t))(v51 + 8))(v15, v52);
  uint64_t v27 = v59;
  if (!v59)
  {
    swift_bridgeObjectRetain_n();
    uint64_t v35 = sub_1A96317D0();
    os_log_type_t v36 = sub_1A9632230();
    if (os_log_type_enabled(v35, v36))
    {
      uint64_t v37 = swift_slowAlloc();
      uint64_t v38 = swift_slowAlloc();
      uint64_t v64 = v38;
      *(_DWORD *)uint64_t v37 = 141558275;
      uint64_t v59 = 1752392040;
      sub_1A9632350();
      *(_WORD *)(v37 + 12) = 2081;
      sub_1A9631510();
      uint64_t v59 = sub_1A945C1DC(v22, a2, &v64);
      sub_1A9632350();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_1A9410000, v35, v36, "Could not find weatherComparison data in cache; identifier=%{private,mask.hash}s",
        (uint8_t *)v37,
        0x16u);
      uint64_t v33 = 1;
      swift_arrayDestroy();
      MEMORY[0x1AD0F7300](v38, -1, -1);
      MEMORY[0x1AD0F7300](v37, -1, -1);
      swift_release();

      return __swift_storeEnumTagSinglePayload(v55, v33, 1, v57);
    }

    swift_bridgeObjectRelease_n();
    swift_release();
    goto LABEL_14;
  }
  unint64_t v29 = v60;
  uint64_t v28 = v61;
  uint64_t v31 = v62;
  uint64_t v30 = v63;
  uint64_t v64 = v59;
  unint64_t v65 = v60;
  uint64_t v66 = v61;
  uint64_t v67 = v62;
  uint64_t v68 = v63;
  uint64_t v32 = v50;
  sub_1A95DBFEC(v49, v50);
  if (__swift_getEnumTagSinglePayload(v32, 1, v57) == 1)
  {
    sub_1A948A95C(v27);
    swift_release();
    sub_1A944C480(v32, &qword_1EB6DDA28);
LABEL_14:
    uint64_t v33 = 1;
    return __swift_storeEnumTagSinglePayload(v55, v33, 1, v57);
  }
  uint64_t v46 = v27;
  unint64_t v47 = v29;
  uint64_t v49 = v28;
  uint64_t v51 = v31;
  uint64_t v52 = v30;
  sub_1A9449580(v32, v48);
  swift_bridgeObjectRetain_n();
  uint64_t v39 = sub_1A96317D0();
  os_log_type_t v40 = sub_1A9632230();
  os_log_t v54 = v39;
  if (os_log_type_enabled(v39, v40))
  {
    uint64_t v41 = v22;
    uint64_t v42 = swift_slowAlloc();
    uint64_t v43 = swift_slowAlloc();
    uint64_t v59 = v43;
    *(_DWORD *)uint64_t v42 = 141558275;
    uint64_t v58 = 1752392040;
    sub_1A9632350();
    *(_WORD *)(v42 + 12) = 2081;
    sub_1A9631510();
    uint64_t v58 = sub_1A945C1DC(v41, a2, &v59);
    sub_1A9632350();
    swift_bridgeObjectRelease_n();
    os_log_t v44 = v54;
    _os_log_impl(&dword_1A9410000, v54, v40, "Successfully retrieved weatherComparison from cache; identifier=%{private,mask.hash}s",
      (uint8_t *)v42,
      0x16u);
    swift_arrayDestroy();
    MEMORY[0x1AD0F7300](v43, -1, -1);
    MEMORY[0x1AD0F7300](v42, -1, -1);
    sub_1A948A95C(v46);
    swift_release();
  }
  else
  {
    swift_bridgeObjectRelease_n();
    sub_1A948A95C(v46);

    swift_release();
  }
  sub_1A9449580(v48, v55);
  uint64_t v33 = 0;
  return __swift_storeEnumTagSinglePayload(v55, v33, 1, v57);
}

uint64_t sub_1A960D108(uint64_t a1, unint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v40 = a1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6DDBD8);
  MEMORY[0x1F4188790](v5 - 8);
  uint64_t v7 = (char *)v37 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_1A9631860();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8);
  uint64_t v11 = (char *)v37 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1EB6DE388 != -1) {
    swift_once();
  }
  uint64_t v12 = sub_1A96317F0();
  uint64_t v13 = __swift_project_value_buffer(v12, (uint64_t)qword_1EB6EB630);
  swift_bridgeObjectRetain_n();
  uint64_t v39 = v13;
  uint64_t v14 = sub_1A96317D0();
  os_log_type_t v15 = sub_1A9632230();
  if (os_log_type_enabled(v14, v15))
  {
    uint64_t v16 = swift_slowAlloc();
    v37[1] = v3;
    uint64_t v17 = v16;
    uint64_t v18 = swift_slowAlloc();
    uint64_t v38 = v9;
    uint64_t v19 = v8;
    uint64_t v20 = v18;
    uint64_t v42 = v18;
    *(_DWORD *)uint64_t v17 = 141558275;
    v41[0] = 1752392040;
    sub_1A9632350();
    *(_WORD *)(v17 + 12) = 2081;
    sub_1A9631510();
    v41[0] = sub_1A945C1DC(v40, a2, &v42);
    sub_1A9632350();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_1A9410000, v14, v15, "Attempting to retrieve weatherComparison unavailable from cache; identifier=%{private,mask.hash}s",
      (uint8_t *)v17,
      0x16u);
    swift_arrayDestroy();
    uint64_t v21 = v20;
    uint64_t v8 = v19;
    uint64_t v9 = v38;
    MEMORY[0x1AD0F7300](v21, -1, -1);
    MEMORY[0x1AD0F7300](v17, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  if (!sub_1A95E44F0())
  {
    os_log_type_t v24 = sub_1A96317D0();
    os_log_type_t v25 = sub_1A9632230();
    if (os_log_type_enabled(v24, v25))
    {
      uint64_t v26 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v26 = 0;
      _os_log_impl(&dword_1A9410000, v24, v25, "Cannot retrieve cached weatherComparison unavailable due to missing store", v26, 2u);
      MEMORY[0x1AD0F7300](v26, -1, -1);
    }

    return 0;
  }
  sub_1A9631960();
  uint64_t v41[3] = MEMORY[0x1E4FBB1A0];
  v41[4] = MEMORY[0x1E4FAA778];
  uint64_t v22 = v40;
  v41[0] = v40;
  v41[1] = a2;
  sub_1A9631510();
  sub_1A96318F0();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v41);
  uint64_t v23 = sub_1A96319F0();
  __swift_storeEnumTagSinglePayload((uint64_t)v7, 1, 1, v23);
  sub_1A9631930();
  swift_release();
  sub_1A944C480((uint64_t)v7, &qword_1EB6DDBD8);
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  uint64_t v27 = v42;
  sub_1A948A95C(v42);
  swift_bridgeObjectRetain_n();
  uint64_t v28 = sub_1A96317D0();
  uint64_t v29 = sub_1A9632230();
  BOOL v30 = os_log_type_enabled(v28, (os_log_type_t)v29);
  if (!v27)
  {
    if (v30)
    {
      uint64_t v35 = swift_slowAlloc();
      uint64_t v36 = swift_slowAlloc();
      uint64_t v42 = v36;
      *(_DWORD *)uint64_t v35 = 141558275;
      v41[0] = 1752392040;
      sub_1A9632350();
      *(_WORD *)(v35 + 12) = 2081;
      sub_1A9631510();
      v41[0] = sub_1A945C1DC(v22, a2, &v42);
      sub_1A9632350();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_1A9410000, v28, (os_log_type_t)v29, "Could not find weatherComparison unavailable data in cache; identifier=%{private,mask.hash}s",
        (uint8_t *)v35,
        0x16u);
      swift_arrayDestroy();
      MEMORY[0x1AD0F7300](v36, -1, -1);
      MEMORY[0x1AD0F7300](v35, -1, -1);
      swift_release();
    }
    else
    {

      swift_bridgeObjectRelease_n();
      swift_release();
    }
    return 0;
  }
  if (v30)
  {
    uint64_t v31 = swift_slowAlloc();
    uint64_t v32 = swift_slowAlloc();
    uint64_t v42 = v32;
    *(_DWORD *)uint64_t v31 = 141558275;
    v41[0] = 1752392040;
    sub_1A9632350();
    *(_WORD *)(v31 + 12) = 2081;
    sub_1A9631510();
    v41[0] = sub_1A945C1DC(v22, a2, &v42);
    sub_1A9632350();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_1A9410000, v28, (os_log_type_t)v29, "Successfully retrieved weatherComparison unavailable from cache; identifier=%{private,mask.hash}s",
      (uint8_t *)v31,
      0x16u);
    uint64_t v33 = 1;
    swift_arrayDestroy();
    MEMORY[0x1AD0F7300](v32, -1, -1);
    MEMORY[0x1AD0F7300](v31, -1, -1);
    swift_release();
  }
  else
  {

    swift_release();
    swift_bridgeObjectRelease_n();
    return 1;
  }
  return v33;
}

uint64_t sub_1A960D950()
{
  return sub_1A9631DC0();
}

void sub_1A960D984()
{
  uint64_t v0 = sub_1A962E810();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x1F4188790](v0);
  uint64_t v3 = (char *)v13 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0) + 8;
  uint64_t v4 = sub_1A9631860();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = (char *)v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0) + 8;
  if (sub_1A95E44F0())
  {
    sub_1A9631980();
    v13[3] = v0;
    v13[4] = MEMORY[0x1E4FAA600];
    __swift_allocate_boxed_opaque_existential_1(v13);
    sub_1A962E7F0();
    sub_1A962E770();
    (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
    sub_1A9631910();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v13);
    sub_1A96319E0();
    swift_release();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    if (qword_1EB6DE388 != -1) {
      swift_once();
    }
    uint64_t v8 = sub_1A96317F0();
    __swift_project_value_buffer(v8, (uint64_t)qword_1EB6EB630);
    uint64_t v9 = sub_1A96317D0();
    os_log_type_t v10 = sub_1A9632230();
    if (os_log_type_enabled(v9, v10))
    {
      uint64_t v11 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v11 = 0;
      _os_log_impl(&dword_1A9410000, v9, v10, "Purged expired forecastPeriod data", v11, 2u);
      MEMORY[0x1AD0F7300](v11, -1, -1);
      swift_release();
    }
    else
    {

      swift_release();
    }
  }
}

void sub_1A960DE30()
{
  uint64_t v0 = sub_1A962E810();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x1F4188790](v0);
  uint64_t v3 = (char *)v13 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0) + 8;
  uint64_t v4 = sub_1A9631860();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = (char *)v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0) + 8;
  if (sub_1A95E44F0())
  {
    sub_1A9631980();
    v13[3] = v0;
    v13[4] = MEMORY[0x1E4FAA600];
    __swift_allocate_boxed_opaque_existential_1(v13);
    sub_1A962E7F0();
    sub_1A962E770();
    (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
    sub_1A9631910();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v13);
    sub_1A96319E0();
    swift_release();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    if (qword_1EB6DE388 != -1) {
      swift_once();
    }
    uint64_t v8 = sub_1A96317F0();
    __swift_project_value_buffer(v8, (uint64_t)qword_1EB6EB630);
    uint64_t v9 = sub_1A96317D0();
    os_log_type_t v10 = sub_1A9632230();
    if (os_log_type_enabled(v9, v10))
    {
      uint64_t v11 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v11 = 0;
      _os_log_impl(&dword_1A9410000, v9, v10, "Purged expired airQuality data", v11, 2u);
      MEMORY[0x1AD0F7300](v11, -1, -1);
      swift_release();
    }
    else
    {

      swift_release();
    }
  }
}

void sub_1A960E2DC()
{
  uint64_t v0 = sub_1A962E810();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x1F4188790](v0);
  uint64_t v3 = (char *)v13 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0) + 8;
  uint64_t v4 = sub_1A9631860();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = (char *)v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0) + 8;
  if (sub_1A95E44F0())
  {
    sub_1A9631980();
    v13[3] = v0;
    v13[4] = MEMORY[0x1E4FAA600];
    __swift_allocate_boxed_opaque_existential_1(v13);
    sub_1A962E7F0();
    sub_1A962E770();
    (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
    sub_1A9631910();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v13);
    sub_1A96319E0();
    swift_release();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    if (qword_1EB6DE388 != -1) {
      swift_once();
    }
    uint64_t v8 = sub_1A96317F0();
    __swift_project_value_buffer(v8, (uint64_t)qword_1EB6EB630);
    uint64_t v9 = sub_1A96317D0();
    os_log_type_t v10 = sub_1A9632230();
    if (os_log_type_enabled(v9, v10))
    {
      uint64_t v11 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v11 = 0;
      _os_log_impl(&dword_1A9410000, v9, v10, "Purged expired airQuality unavailable data", v11, 2u);
      MEMORY[0x1AD0F7300](v11, -1, -1);
      swift_release();
    }
    else
    {

      swift_release();
    }
  }
}

void sub_1A960E788()
{
  uint64_t v0 = sub_1A962E810();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x1F4188790](v0);
  uint64_t v3 = (char *)v13 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0) + 8;
  uint64_t v4 = sub_1A9631860();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = (char *)v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0) + 8;
  if (sub_1A95E44F0())
  {
    sub_1A9631980();
    v13[3] = v0;
    v13[4] = MEMORY[0x1E4FAA600];
    __swift_allocate_boxed_opaque_existential_1(v13);
    sub_1A962E7F0();
    sub_1A962E770();
    (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
    sub_1A9631910();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v13);
    sub_1A96319E0();
    swift_release();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    if (qword_1EB6DE388 != -1) {
      swift_once();
    }
    uint64_t v8 = sub_1A96317F0();
    __swift_project_value_buffer(v8, (uint64_t)qword_1EB6EB630);
    uint64_t v9 = sub_1A96317D0();
    os_log_type_t v10 = sub_1A9632230();
    if (os_log_type_enabled(v9, v10))
    {
      uint64_t v11 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v11 = 0;
      _os_log_impl(&dword_1A9410000, v9, v10, "Purged expired currentWeather data", v11, 2u);
      MEMORY[0x1AD0F7300](v11, -1, -1);
      swift_release();
    }
    else
    {

      swift_release();
    }
  }
}

void sub_1A960EC34()
{
  uint64_t v0 = sub_1A962E810();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x1F4188790](v0);
  uint64_t v3 = (char *)v13 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0) + 8;
  uint64_t v4 = sub_1A9631860();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = (char *)v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0) + 8;
  if (sub_1A95E44F0())
  {
    sub_1A9631980();
    v13[3] = v0;
    v13[4] = MEMORY[0x1E4FAA600];
    __swift_allocate_boxed_opaque_existential_1(v13);
    sub_1A962E7F0();
    sub_1A962E770();
    (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
    sub_1A9631910();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v13);
    sub_1A96319E0();
    swift_release();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    if (qword_1EB6DE388 != -1) {
      swift_once();
    }
    uint64_t v8 = sub_1A96317F0();
    __swift_project_value_buffer(v8, (uint64_t)qword_1EB6EB630);
    uint64_t v9 = sub_1A96317D0();
    os_log_type_t v10 = sub_1A9632230();
    if (os_log_type_enabled(v9, v10))
    {
      uint64_t v11 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v11 = 0;
      _os_log_impl(&dword_1A9410000, v9, v10, "Purged expired dailyForecast data", v11, 2u);
      MEMORY[0x1AD0F7300](v11, -1, -1);
      swift_release();
    }
    else
    {

      swift_release();
    }
  }
}

void sub_1A960F0E0()
{
  uint64_t v0 = sub_1A962E810();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x1F4188790](v0);
  uint64_t v3 = (char *)v13 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0) + 8;
  uint64_t v4 = sub_1A9631860();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = (char *)v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0) + 8;
  if (sub_1A95E44F0())
  {
    sub_1A9631980();
    v13[3] = v0;
    v13[4] = MEMORY[0x1E4FAA600];
    __swift_allocate_boxed_opaque_existential_1(v13);
    sub_1A962E7F0();
    sub_1A962E770();
    (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
    sub_1A9631910();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v13);
    sub_1A96319E0();
    swift_release();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    if (qword_1EB6DE388 != -1) {
      swift_once();
    }
    uint64_t v8 = sub_1A96317F0();
    __swift_project_value_buffer(v8, (uint64_t)qword_1EB6EB630);
    uint64_t v9 = sub_1A96317D0();
    os_log_type_t v10 = sub_1A9632230();
    if (os_log_type_enabled(v9, v10))
    {
      uint64_t v11 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v11 = 0;
      _os_log_impl(&dword_1A9410000, v9, v10, "Purged expired hourlyForecast data", v11, 2u);
      MEMORY[0x1AD0F7300](v11, -1, -1);
      swift_release();
    }
    else
    {

      swift_release();
    }
  }
}

void sub_1A960F58C()
{
  uint64_t v0 = sub_1A962E810();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x1F4188790](v0);
  uint64_t v3 = (char *)v13 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0) + 8;
  uint64_t v4 = sub_1A9631860();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = (char *)v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0) + 8;
  if (sub_1A95E44F0())
  {
    sub_1A9631980();
    v13[3] = v0;
    v13[4] = MEMORY[0x1E4FAA600];
    __swift_allocate_boxed_opaque_existential_1(v13);
    sub_1A962E7F0();
    sub_1A962E770();
    (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
    sub_1A9631910();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v13);
    sub_1A96319E0();
    swift_release();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    if (qword_1EB6DE388 != -1) {
      swift_once();
    }
    uint64_t v8 = sub_1A96317F0();
    __swift_project_value_buffer(v8, (uint64_t)qword_1EB6EB630);
    uint64_t v9 = sub_1A96317D0();
    os_log_type_t v10 = sub_1A9632230();
    if (os_log_type_enabled(v9, v10))
    {
      uint64_t v11 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v11 = 0;
      _os_log_impl(&dword_1A9410000, v9, v10, "Purged expired nextHourForecast data", v11, 2u);
      MEMORY[0x1AD0F7300](v11, -1, -1);
      swift_release();
    }
    else
    {

      swift_release();
    }
  }
}

void sub_1A960FA38()
{
  uint64_t v0 = sub_1A962E810();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x1F4188790](v0);
  uint64_t v3 = (char *)v13 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0) + 8;
  uint64_t v4 = sub_1A9631860();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = (char *)v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0) + 8;
  if (sub_1A95E44F0())
  {
    sub_1A9631980();
    v13[3] = v0;
    v13[4] = MEMORY[0x1E4FAA600];
    __swift_allocate_boxed_opaque_existential_1(v13);
    sub_1A962E7F0();
    sub_1A962E770();
    (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
    sub_1A9631910();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v13);
    sub_1A96319E0();
    swift_release();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    if (qword_1EB6DE388 != -1) {
      swift_once();
    }
    uint64_t v8 = sub_1A96317F0();
    __swift_project_value_buffer(v8, (uint64_t)qword_1EB6EB630);
    uint64_t v9 = sub_1A96317D0();
    os_log_type_t v10 = sub_1A9632230();
    if (os_log_type_enabled(v9, v10))
    {
      uint64_t v11 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v11 = 0;
      _os_log_impl(&dword_1A9410000, v9, v10, "Purged expired nextHourForecast unavailable data", v11, 2u);
      MEMORY[0x1AD0F7300](v11, -1, -1);
      swift_release();
    }
    else
    {

      swift_release();
    }
  }
}

void sub_1A960FEE4()
{
  uint64_t v0 = sub_1A962E810();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x1F4188790](v0);
  uint64_t v3 = (char *)v13 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0) + 8;
  uint64_t v4 = sub_1A9631860();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = (char *)v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0) + 8;
  if (sub_1A95E44F0())
  {
    sub_1A9631980();
    v13[3] = v0;
    v13[4] = MEMORY[0x1E4FAA600];
    __swift_allocate_boxed_opaque_existential_1(v13);
    sub_1A962E7F0();
    sub_1A962E770();
    (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
    sub_1A9631910();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v13);
    sub_1A96319E0();
    swift_release();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    if (qword_1EB6DE388 != -1) {
      swift_once();
    }
    uint64_t v8 = sub_1A96317F0();
    __swift_project_value_buffer(v8, (uint64_t)qword_1EB6EB630);
    uint64_t v9 = sub_1A96317D0();
    os_log_type_t v10 = sub_1A9632230();
    if (os_log_type_enabled(v9, v10))
    {
      uint64_t v11 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v11 = 0;
      _os_log_impl(&dword_1A9410000, v9, v10, "Purged expired locationInfo data", v11, 2u);
      MEMORY[0x1AD0F7300](v11, -1, -1);
      swift_release();
    }
    else
    {

      swift_release();
    }
  }
}

void sub_1A9610390()
{
  uint64_t v0 = sub_1A962E810();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x1F4188790](v0);
  uint64_t v3 = (char *)v13 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0) + 8;
  uint64_t v4 = sub_1A9631860();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = (char *)v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0) + 8;
  if (sub_1A95E44F0())
  {
    sub_1A9631980();
    v13[3] = v0;
    v13[4] = MEMORY[0x1E4FAA600];
    __swift_allocate_boxed_opaque_existential_1(v13);
    sub_1A962E7F0();
    sub_1A962E770();
    (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
    sub_1A9631910();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v13);
    sub_1A96319E0();
    swift_release();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    if (qword_1EB6DE388 != -1) {
      swift_once();
    }
    uint64_t v8 = sub_1A96317F0();
    __swift_project_value_buffer(v8, (uint64_t)qword_1EB6EB630);
    uint64_t v9 = sub_1A96317D0();
    os_log_type_t v10 = sub_1A9632230();
    if (os_log_type_enabled(v9, v10))
    {
      uint64_t v11 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v11 = 0;
      _os_log_impl(&dword_1A9410000, v9, v10, "Purged expired marineForecast data", v11, 2u);
      MEMORY[0x1AD0F7300](v11, -1, -1);
      swift_release();
    }
    else
    {

      swift_release();
    }
  }
}

void sub_1A961083C()
{
  uint64_t v0 = sub_1A962E810();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x1F4188790](v0);
  uint64_t v3 = (char *)v13 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0) + 8;
  uint64_t v4 = sub_1A9631860();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = (char *)v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0) + 8;
  if (sub_1A95E44F0())
  {
    sub_1A9631980();
    v13[3] = v0;
    v13[4] = MEMORY[0x1E4FAA600];
    __swift_allocate_boxed_opaque_existential_1(v13);
    sub_1A962E7F0();
    sub_1A962E770();
    (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
    sub_1A9631910();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v13);
    sub_1A96319E0();
    swift_release();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    if (qword_1EB6DE388 != -1) {
      swift_once();
    }
    uint64_t v8 = sub_1A96317F0();
    __swift_project_value_buffer(v8, (uint64_t)qword_1EB6EB630);
    uint64_t v9 = sub_1A96317D0();
    os_log_type_t v10 = sub_1A9632230();
    if (os_log_type_enabled(v9, v10))
    {
      uint64_t v11 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v11 = 0;
      _os_log_impl(&dword_1A9410000, v9, v10, "Purged expired marineForecastUnavailable data", v11, 2u);
      MEMORY[0x1AD0F7300](v11, -1, -1);
      swift_release();
    }
    else
    {

      swift_release();
    }
  }
}

void sub_1A9610CE8(uint64_t a1, unint64_t a2, double a3, double a4)
{
  uint64_t v8 = sub_1A962E810();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8);
  uint64_t v11 = (char *)&v26 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v12);
  uint64_t v14 = (char *)&v26 - v13;
  if (sub_1A95E44F0())
  {
    sub_1A9631510();
    sub_1A962E7F0();
    sub_1A962E760();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
    sub_1A95D19A8(a1, a2, (uint64_t)v14, (uint64_t *)&v29, a3, a4);
    long long v32 = v29;
    long long v33 = v30;
    uint64_t v34 = v31;
    sub_1A9631950();
    long long v29 = v32;
    long long v30 = v33;
    uint64_t v31 = v34;
    sub_1A9631920();
    swift_release();
    if (qword_1EB6DE388 != -1) {
      swift_once();
    }
    uint64_t v19 = sub_1A96317F0();
    __swift_project_value_buffer(v19, (uint64_t)qword_1EB6EB630);
    sub_1A9631510();
    sub_1A948A8F8((uint64_t)&v32);
    sub_1A9631510();
    sub_1A948A8F8((uint64_t)&v32);
    uint64_t v20 = sub_1A96317D0();
    os_log_type_t v21 = sub_1A9632230();
    if (os_log_type_enabled(v20, v21))
    {
      uint64_t v22 = swift_slowAlloc();
      uint64_t v23 = swift_slowAlloc();
      v28[0] = v23;
      *(_DWORD *)uint64_t v22 = 141558531;
      *(void *)&long long v29 = 1752392040;
      sub_1A9632350();
      *(_WORD *)(v22 + 12) = 2081;
      sub_1A9631510();
      *(void *)&long long v29 = sub_1A945C1DC(a1, a2, v28);
      sub_1A9632350();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v22 + 22) = 2080;
      sub_1A948A8F8((uint64_t)&v32);
      sub_1A95D6124((uint64_t)&v29);
      sub_1A948A894((uint64_t)&v32);
      uint64_t v24 = sub_1A95D62D8();
      *(void *)&long long v29 = sub_1A945C1DC(v24, v25, v28);
      sub_1A9632350();
      swift_bridgeObjectRelease();
      sub_1A948A894((uint64_t)&v32);
      sub_1A948A894((uint64_t)&v32);
      _os_log_impl(&dword_1A9410000, v20, v21, "Just cached marineLocation; identifier=%{private,mask.hash}s. It's valid for another %s",
        (uint8_t *)v22,
        0x20u);
      swift_arrayDestroy();
      MEMORY[0x1AD0F7300](v23, -1, -1);
      MEMORY[0x1AD0F7300](v22, -1, -1);

      sub_1A948A894((uint64_t)&v32);
    }
    else
    {
      sub_1A948A894((uint64_t)&v32);
      swift_bridgeObjectRelease_n();
      sub_1A948A894((uint64_t)&v32);
      sub_1A948A894((uint64_t)&v32);
    }
    sub_1A9611388();
    swift_release();
  }
  else
  {
    if (qword_1EB6DE388 != -1) {
      swift_once();
    }
    uint64_t v15 = sub_1A96317F0();
    __swift_project_value_buffer(v15, (uint64_t)qword_1EB6EB630);
    os_log_t v27 = (os_log_t)sub_1A96317D0();
    os_log_type_t v16 = sub_1A9632230();
    if (os_log_type_enabled(v27, v16))
    {
      uint64_t v17 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v17 = 0;
      _os_log_impl(&dword_1A9410000, v27, v16, "Cannot cache marineLocation due to missing store", v17, 2u);
      MEMORY[0x1AD0F7300](v17, -1, -1);
    }
    os_log_t v18 = v27;
  }
}

void sub_1A9611388()
{
  uint64_t v0 = sub_1A962E810();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x1F4188790](v0);
  uint64_t v3 = (char *)v13 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0) + 8;
  uint64_t v4 = sub_1A9631860();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = (char *)v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0) + 8;
  if (sub_1A95E44F0())
  {
    sub_1A9631980();
    v13[3] = v0;
    v13[4] = MEMORY[0x1E4FAA600];
    __swift_allocate_boxed_opaque_existential_1(v13);
    sub_1A962E7F0();
    sub_1A962E770();
    (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
    sub_1A9631910();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v13);
    sub_1A96319E0();
    swift_release();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    if (qword_1EB6DE388 != -1) {
      swift_once();
    }
    uint64_t v8 = sub_1A96317F0();
    __swift_project_value_buffer(v8, (uint64_t)qword_1EB6EB630);
    uint64_t v9 = sub_1A96317D0();
    os_log_type_t v10 = sub_1A9632230();
    if (os_log_type_enabled(v9, v10))
    {
      uint64_t v11 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v11 = 0;
      _os_log_impl(&dword_1A9410000, v9, v10, "Purged expired marineLocation data", v11, 2u);
      MEMORY[0x1AD0F7300](v11, -1, -1);
      swift_release();
    }
    else
    {

      swift_release();
    }
  }
}

void sub_1A9611834()
{
  uint64_t v0 = sub_1A962E810();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x1F4188790](v0);
  uint64_t v3 = (char *)v13 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0) + 8;
  uint64_t v4 = sub_1A9631860();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = (char *)v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0) + 8;
  if (sub_1A95E44F0())
  {
    sub_1A9631980();
    v13[3] = v0;
    v13[4] = MEMORY[0x1E4FAA600];
    __swift_allocate_boxed_opaque_existential_1(v13);
    sub_1A962E7F0();
    sub_1A962E770();
    (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
    sub_1A9631910();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v13);
    sub_1A96319E0();
    swift_release();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    if (qword_1EB6DE388 != -1) {
      swift_once();
    }
    uint64_t v8 = sub_1A96317F0();
    __swift_project_value_buffer(v8, (uint64_t)qword_1EB6EB630);
    uint64_t v9 = sub_1A96317D0();
    os_log_type_t v10 = sub_1A9632230();
    if (os_log_type_enabled(v9, v10))
    {
      uint64_t v11 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v11 = 0;
      _os_log_impl(&dword_1A9410000, v9, v10, "Purged expired news data", v11, 2u);
      MEMORY[0x1AD0F7300](v11, -1, -1);
      swift_release();
    }
    else
    {

      swift_release();
    }
  }
}

void sub_1A9611CE0()
{
  uint64_t v0 = sub_1A962E810();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x1F4188790](v0);
  uint64_t v3 = (char *)v13 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0) + 8;
  uint64_t v4 = sub_1A9631860();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = (char *)v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0) + 8;
  if (sub_1A95E44F0())
  {
    sub_1A9631980();
    v13[3] = v0;
    v13[4] = MEMORY[0x1E4FAA600];
    __swift_allocate_boxed_opaque_existential_1(v13);
    sub_1A962E7F0();
    sub_1A962E770();
    (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
    sub_1A9631910();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v13);
    sub_1A96319E0();
    swift_release();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    if (qword_1EB6DE388 != -1) {
      swift_once();
    }
    uint64_t v8 = sub_1A96317F0();
    __swift_project_value_buffer(v8, (uint64_t)qword_1EB6EB630);
    uint64_t v9 = sub_1A96317D0();
    os_log_type_t v10 = sub_1A9632230();
    if (os_log_type_enabled(v9, v10))
    {
      uint64_t v11 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v11 = 0;
      _os_log_impl(&dword_1A9410000, v9, v10, "Purged expired news unavailable data", v11, 2u);
      MEMORY[0x1AD0F7300](v11, -1, -1);
      swift_release();
    }
    else
    {

      swift_release();
    }
  }
}

void sub_1A961218C()
{
  uint64_t v0 = sub_1A962E810();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x1F4188790](v0);
  uint64_t v3 = (char *)v13 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0) + 8;
  uint64_t v4 = sub_1A9631860();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = (char *)v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0) + 8;
  if (sub_1A95E44F0())
  {
    sub_1A9631980();
    v13[3] = v0;
    v13[4] = MEMORY[0x1E4FAA600];
    __swift_allocate_boxed_opaque_existential_1(v13);
    sub_1A962E7F0();
    sub_1A962E770();
    (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
    sub_1A9631910();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v13);
    sub_1A96319E0();
    swift_release();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    if (qword_1EB6DE388 != -1) {
      swift_once();
    }
    uint64_t v8 = sub_1A96317F0();
    __swift_project_value_buffer(v8, (uint64_t)qword_1EB6EB630);
    uint64_t v9 = sub_1A96317D0();
    os_log_type_t v10 = sub_1A9632230();
    if (os_log_type_enabled(v9, v10))
    {
      uint64_t v11 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v11 = 0;
      _os_log_impl(&dword_1A9410000, v9, v10, "Purged expired tideEvents data", v11, 2u);
      MEMORY[0x1AD0F7300](v11, -1, -1);
      swift_release();
    }
    else
    {

      swift_release();
    }
  }
}

void sub_1A9612638()
{
  uint64_t v0 = sub_1A962E810();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x1F4188790](v0);
  uint64_t v3 = (char *)v13 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0) + 8;
  uint64_t v4 = sub_1A9631860();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = (char *)v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0) + 8;
  if (sub_1A95E44F0())
  {
    sub_1A9631980();
    v13[3] = v0;
    v13[4] = MEMORY[0x1E4FAA600];
    __swift_allocate_boxed_opaque_existential_1(v13);
    sub_1A962E7F0();
    sub_1A962E770();
    (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
    sub_1A9631910();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v13);
    sub_1A96319E0();
    swift_release();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    if (qword_1EB6DE388 != -1) {
      swift_once();
    }
    uint64_t v8 = sub_1A96317F0();
    __swift_project_value_buffer(v8, (uint64_t)qword_1EB6EB630);
    uint64_t v9 = sub_1A96317D0();
    os_log_type_t v10 = sub_1A9632230();
    if (os_log_type_enabled(v9, v10))
    {
      uint64_t v11 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v11 = 0;
      _os_log_impl(&dword_1A9410000, v9, v10, "Purged expired tideEvents unavailable data", v11, 2u);
      MEMORY[0x1AD0F7300](v11, -1, -1);
      swift_release();
    }
    else
    {

      swift_release();
    }
  }
}

void sub_1A9612AE4()
{
  uint64_t v0 = sub_1A962E810();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x1F4188790](v0);
  uint64_t v3 = (char *)v13 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0) + 8;
  uint64_t v4 = sub_1A9631860();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = (char *)v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0) + 8;
  if (sub_1A95E44F0())
  {
    sub_1A9631980();
    v13[3] = v0;
    v13[4] = MEMORY[0x1E4FAA600];
    __swift_allocate_boxed_opaque_existential_1(v13);
    sub_1A962E7F0();
    sub_1A962E770();
    (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
    sub_1A9631910();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v13);
    sub_1A96319E0();
    swift_release();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    if (qword_1EB6DE388 != -1) {
      swift_once();
    }
    uint64_t v8 = sub_1A96317F0();
    __swift_project_value_buffer(v8, (uint64_t)qword_1EB6EB630);
    uint64_t v9 = sub_1A96317D0();
    os_log_type_t v10 = sub_1A9632230();
    if (os_log_type_enabled(v9, v10))
    {
      uint64_t v11 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v11 = 0;
      _os_log_impl(&dword_1A9410000, v9, v10, "Purged expired weatherAlerts data", v11, 2u);
      MEMORY[0x1AD0F7300](v11, -1, -1);
      swift_release();
    }
    else
    {

      swift_release();
    }
  }
}

void sub_1A9612F90()
{
  uint64_t v0 = sub_1A962E810();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x1F4188790](v0);
  uint64_t v3 = (char *)v13 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0) + 8;
  uint64_t v4 = sub_1A9631860();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = (char *)v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0) + 8;
  if (sub_1A95E44F0())
  {
    sub_1A9631980();
    v13[3] = v0;
    v13[4] = MEMORY[0x1E4FAA600];
    __swift_allocate_boxed_opaque_existential_1(v13);
    sub_1A962E7F0();
    sub_1A962E770();
    (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
    sub_1A9631910();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v13);
    sub_1A96319E0();
    swift_release();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    if (qword_1EB6DE388 != -1) {
      swift_once();
    }
    uint64_t v8 = sub_1A96317F0();
    __swift_project_value_buffer(v8, (uint64_t)qword_1EB6EB630);
    uint64_t v9 = sub_1A96317D0();
    os_log_type_t v10 = sub_1A9632230();
    if (os_log_type_enabled(v9, v10))
    {
      uint64_t v11 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v11 = 0;
      _os_log_impl(&dword_1A9410000, v9, v10, "Purged expired weatherAlerts unavailable data", v11, 2u);
      MEMORY[0x1AD0F7300](v11, -1, -1);
      swift_release();
    }
    else
    {

      swift_release();
    }
  }
}

void sub_1A961343C()
{
  uint64_t v0 = sub_1A962E810();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x1F4188790](v0);
  uint64_t v3 = (char *)v13 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0) + 8;
  uint64_t v4 = sub_1A9631860();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = (char *)v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0) + 8;
  if (sub_1A95E44F0())
  {
    sub_1A9631980();
    v13[3] = v0;
    v13[4] = MEMORY[0x1E4FAA600];
    __swift_allocate_boxed_opaque_existential_1(v13);
    sub_1A962E7F0();
    sub_1A962E770();
    (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
    sub_1A9631910();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v13);
    sub_1A96319E0();
    swift_release();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    if (qword_1EB6DE388 != -1) {
      swift_once();
    }
    uint64_t v8 = sub_1A96317F0();
    __swift_project_value_buffer(v8, (uint64_t)qword_1EB6EB630);
    uint64_t v9 = sub_1A96317D0();
    os_log_type_t v10 = sub_1A9632230();
    if (os_log_type_enabled(v9, v10))
    {
      uint64_t v11 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v11 = 0;
      _os_log_impl(&dword_1A9410000, v9, v10, "Purged expired weatherChange data", v11, 2u);
      MEMORY[0x1AD0F7300](v11, -1, -1);
      swift_release();
    }
    else
    {

      swift_release();
    }
  }
}

void sub_1A96138E8()
{
  uint64_t v0 = sub_1A962E810();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x1F4188790](v0);
  uint64_t v3 = (char *)v13 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0) + 8;
  uint64_t v4 = sub_1A9631860();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = (char *)v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0) + 8;
  if (sub_1A95E44F0())
  {
    sub_1A9631980();
    v13[3] = v0;
    v13[4] = MEMORY[0x1E4FAA600];
    __swift_allocate_boxed_opaque_existential_1(v13);
    sub_1A962E7F0();
    sub_1A962E770();
    (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
    sub_1A9631910();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v13);
    sub_1A96319E0();
    swift_release();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    if (qword_1EB6DE388 != -1) {
      swift_once();
    }
    uint64_t v8 = sub_1A96317F0();
    __swift_project_value_buffer(v8, (uint64_t)qword_1EB6EB630);
    uint64_t v9 = sub_1A96317D0();
    os_log_type_t v10 = sub_1A9632230();
    if (os_log_type_enabled(v9, v10))
    {
      uint64_t v11 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v11 = 0;
      _os_log_impl(&dword_1A9410000, v9, v10, "Purged expired weatherChange unavailable data", v11, 2u);
      MEMORY[0x1AD0F7300](v11, -1, -1);
      swift_release();
    }
    else
    {

      swift_release();
    }
  }
}

void sub_1A9613D94()
{
  uint64_t v0 = sub_1A962E810();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x1F4188790](v0);
  uint64_t v3 = (char *)v13 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0) + 8;
  uint64_t v4 = sub_1A9631860();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = (char *)v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0) + 8;
  if (sub_1A95E44F0())
  {
    sub_1A9631980();
    v13[3] = v0;
    v13[4] = MEMORY[0x1E4FAA600];
    __swift_allocate_boxed_opaque_existential_1(v13);
    sub_1A962E7F0();
    sub_1A962E770();
    (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
    sub_1A9631910();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v13);
    sub_1A96319E0();
    swift_release();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    if (qword_1EB6DE388 != -1) {
      swift_once();
    }
    uint64_t v8 = sub_1A96317F0();
    __swift_project_value_buffer(v8, (uint64_t)qword_1EB6EB630);
    uint64_t v9 = sub_1A96317D0();
    os_log_type_t v10 = sub_1A9632230();
    if (os_log_type_enabled(v9, v10))
    {
      uint64_t v11 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v11 = 0;
      _os_log_impl(&dword_1A9410000, v9, v10, "Purged expired weatherComparisons data", v11, 2u);
      MEMORY[0x1AD0F7300](v11, -1, -1);
      swift_release();
    }
    else
    {

      swift_release();
    }
  }
}

void sub_1A9614240()
{
  uint64_t v0 = sub_1A962E810();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x1F4188790](v0);
  uint64_t v3 = (char *)v13 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0) + 8;
  uint64_t v4 = sub_1A9631860();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = (char *)v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0) + 8;
  if (sub_1A95E44F0())
  {
    sub_1A9631980();
    v13[3] = v0;
    v13[4] = MEMORY[0x1E4FAA600];
    __swift_allocate_boxed_opaque_existential_1(v13);
    sub_1A962E7F0();
    sub_1A962E770();
    (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
    sub_1A9631910();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v13);
    sub_1A96319E0();
    swift_release();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    if (qword_1EB6DE388 != -1) {
      swift_once();
    }
    uint64_t v8 = sub_1A96317F0();
    __swift_project_value_buffer(v8, (uint64_t)qword_1EB6EB630);
    uint64_t v9 = sub_1A96317D0();
    os_log_type_t v10 = sub_1A9632230();
    if (os_log_type_enabled(v9, v10))
    {
      uint64_t v11 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v11 = 0;
      _os_log_impl(&dword_1A9410000, v9, v10, "Purged expired weatherComparisons unavailable data", v11, 2u);
      MEMORY[0x1AD0F7300](v11, -1, -1);
      swift_release();
    }
    else
    {

      swift_release();
    }
  }
}

void sub_1A96146EC()
{
  uint64_t v0 = sub_1A962E810();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x1F4188790](v0);
  uint64_t v3 = (char *)v13 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0) + 8;
  uint64_t v4 = sub_1A9631860();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = (char *)v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0) + 8;
  if (sub_1A95E44F0())
  {
    sub_1A9631980();
    v13[3] = v0;
    v13[4] = MEMORY[0x1E4FAA600];
    __swift_allocate_boxed_opaque_existential_1(v13);
    sub_1A962E7F0();
    sub_1A962E770();
    (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
    sub_1A9631910();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v13);
    sub_1A96319E0();
    swift_release();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    if (qword_1EB6DE388 != -1) {
      swift_once();
    }
    uint64_t v8 = sub_1A96317F0();
    __swift_project_value_buffer(v8, (uint64_t)qword_1EB6EB630);
    uint64_t v9 = sub_1A96317D0();
    os_log_type_t v10 = sub_1A9632230();
    if (os_log_type_enabled(v9, v10))
    {
      uint64_t v11 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v11 = 0;
      _os_log_impl(&dword_1A9410000, v9, v10, "Purged expired historicalFacts data", v11, 2u);
      MEMORY[0x1AD0F7300](v11, -1, -1);
      swift_release();
    }
    else
    {

      swift_release();
    }
  }
}

void sub_1A9614B98()
{
  uint64_t v0 = sub_1A962E810();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x1F4188790](v0);
  uint64_t v3 = (char *)v13 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0) + 8;
  uint64_t v4 = sub_1A9631860();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = (char *)v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0) + 8;
  if (sub_1A95E44F0())
  {
    sub_1A9631980();
    v13[3] = v0;
    v13[4] = MEMORY[0x1E4FAA600];
    __swift_allocate_boxed_opaque_existential_1(v13);
    sub_1A962E7F0();
    sub_1A962E770();
    (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
    sub_1A9631910();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v13);
    sub_1A96319E0();
    swift_release();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    if (qword_1EB6DE388 != -1) {
      swift_once();
    }
    uint64_t v8 = sub_1A96317F0();
    __swift_project_value_buffer(v8, (uint64_t)qword_1EB6EB630);
    uint64_t v9 = sub_1A96317D0();
    os_log_type_t v10 = sub_1A9632230();
    if (os_log_type_enabled(v9, v10))
    {
      uint64_t v11 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v11 = 0;
      _os_log_impl(&dword_1A9410000, v9, v10, "Purged expired historicalFacts unavailable data", v11, 2u);
      MEMORY[0x1AD0F7300](v11, -1, -1);
      swift_release();
    }
    else
    {

      swift_release();
    }
  }
}

uint64_t sub_1A9615044()
{
  uint64_t result = sub_1A95E44F0();
  if (result)
  {
    sub_1A9631980();
    sub_1A96319D0();
    swift_release();
    return swift_release();
  }
  return result;
}

uint64_t sub_1A96152DC()
{
  uint64_t result = sub_1A95E44F0();
  if (result)
  {
    sub_1A9631980();
    sub_1A96319D0();
    swift_release();
    return swift_release();
  }
  return result;
}

uint64_t sub_1A9615574()
{
  uint64_t result = sub_1A95E44F0();
  if (result)
  {
    sub_1A9631980();
    sub_1A96319D0();
    swift_release();
    return swift_release();
  }
  return result;
}

uint64_t sub_1A961580C()
{
  uint64_t result = sub_1A95E44F0();
  if (result)
  {
    sub_1A9631980();
    sub_1A96319D0();
    swift_release();
    return swift_release();
  }
  return result;
}

uint64_t sub_1A9615AA4()
{
  uint64_t result = sub_1A95E44F0();
  if (result)
  {
    sub_1A9631980();
    sub_1A96319D0();
    swift_release();
    return swift_release();
  }
  return result;
}

uint64_t sub_1A9615D3C()
{
  uint64_t result = sub_1A95E44F0();
  if (result)
  {
    sub_1A9631980();
    sub_1A96319D0();
    swift_release();
    return swift_release();
  }
  return result;
}

uint64_t sub_1A9615FD4()
{
  uint64_t result = sub_1A95E44F0();
  if (result)
  {
    sub_1A9631980();
    sub_1A96319D0();
    swift_release();
    return swift_release();
  }
  return result;
}

uint64_t sub_1A961626C()
{
  uint64_t result = sub_1A95E44F0();
  if (result)
  {
    sub_1A9631980();
    sub_1A96319D0();
    swift_release();
    return swift_release();
  }
  return result;
}

uint64_t sub_1A9616504()
{
  uint64_t result = sub_1A95E44F0();
  if (result)
  {
    sub_1A9631980();
    sub_1A96319D0();
    swift_release();
    return swift_release();
  }
  return result;
}

uint64_t sub_1A961679C()
{
  uint64_t result = sub_1A95E44F0();
  if (result)
  {
    sub_1A9631980();
    sub_1A96319D0();
    swift_release();
    return swift_release();
  }
  return result;
}

uint64_t sub_1A9616A34()
{
  uint64_t result = sub_1A95E44F0();
  if (result)
  {
    sub_1A9631980();
    sub_1A96319D0();
    swift_release();
    return swift_release();
  }
  return result;
}

uint64_t sub_1A9616CCC()
{
  uint64_t result = sub_1A95E44F0();
  if (result)
  {
    sub_1A9631980();
    sub_1A96319D0();
    swift_release();
    return swift_release();
  }
  return result;
}

uint64_t sub_1A9616F64()
{
  uint64_t result = sub_1A95E44F0();
  if (result)
  {
    sub_1A9631980();
    sub_1A96319D0();
    swift_release();
    return swift_release();
  }
  return result;
}

uint64_t sub_1A96171FC()
{
  uint64_t result = sub_1A95E44F0();
  if (result)
  {
    sub_1A9631980();
    sub_1A96319D0();
    swift_release();
    return swift_release();
  }
  return result;
}

uint64_t sub_1A9617494()
{
  uint64_t result = sub_1A95E44F0();
  if (result)
  {
    sub_1A9631980();
    sub_1A96319D0();
    swift_release();
    return swift_release();
  }
  return result;
}

uint64_t sub_1A961772C()
{
  uint64_t result = sub_1A95E44F0();
  if (result)
  {
    sub_1A9631980();
    sub_1A96319D0();
    swift_release();
    return swift_release();
  }
  return result;
}

uint64_t sub_1A96179C4()
{
  uint64_t result = sub_1A95E44F0();
  if (result)
  {
    sub_1A9631980();
    sub_1A96319D0();
    swift_release();
    return swift_release();
  }
  return result;
}

uint64_t sub_1A9617C5C()
{
  uint64_t result = sub_1A95E44F0();
  if (result)
  {
    sub_1A9631980();
    sub_1A96319D0();
    swift_release();
    return swift_release();
  }
  return result;
}

uint64_t sub_1A9617EF4()
{
  uint64_t result = sub_1A95E44F0();
  if (result)
  {
    sub_1A9631980();
    sub_1A96319D0();
    swift_release();
    return swift_release();
  }
  return result;
}

uint64_t sub_1A961818C()
{
  uint64_t result = sub_1A95E44F0();
  if (result)
  {
    sub_1A9631980();
    sub_1A96319D0();
    swift_release();
    return swift_release();
  }
  return result;
}

uint64_t sub_1A9618424()
{
  uint64_t result = sub_1A95E44F0();
  if (result)
  {
    sub_1A9631980();
    sub_1A96319D0();
    swift_release();
    return swift_release();
  }
  return result;
}

uint64_t sub_1A96186BC()
{
  uint64_t result = sub_1A95E44F0();
  if (result)
  {
    sub_1A9631980();
    sub_1A96319D0();
    swift_release();
    return swift_release();
  }
  return result;
}

uint64_t sub_1A9618954()
{
  swift_release();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1(v0 + 32);
  swift_release();

  return v0;
}

uint64_t sub_1A961899C()
{
  sub_1A9618954();
  return MEMORY[0x1F4186488](v0, 96, 7);
}

void sub_1A96189D0()
{
}

void sub_1A96189F4()
{
}

uint64_t sub_1A9618A18(uint64_t a1, NSObject *a2)
{
  return sub_1A95F01D8(a1, a2);
}

void sub_1A9618A3C()
{
}

uint64_t sub_1A9618A60()
{
  uint64_t v0 = sub_1A962E810();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x1F4188790](v0);
  uint64_t v3 = (char *)v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = 0;
  unint64_t v10 = 0xE000000000000000;
  sub_1A962E350();
  swift_getAtKeyPath();
  uint64_t v4 = *(void (**)(char *, uint64_t))(v1 + 8);
  v4(v3, v0);
  uint64_t v5 = v8[0];
  unint64_t v6 = v8[1];
  swift_bridgeObjectRelease();
  uint64_t v9 = v5;
  unint64_t v10 = v6;
  sub_1A9631EA0();
  sub_1A962E340();
  swift_getAtKeyPath();
  v4(v3, v0);
  sub_1A9631EA0();
  swift_bridgeObjectRelease();
  return v9;
}

void sub_1A9618BC0()
{
  uint64_t v1 = *v0;
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *uint64_t v0 = v1;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_1A9481F7C();
    *uint64_t v0 = v3;
  }
}

void sub_1A9618C0C(uint64_t a1)
{
  if (a1 + 1 > *(void *)(*(void *)v1 + 24) >> 1)
  {
    sub_1A9481F7C();
    *(void *)uint64_t v1 = v2;
  }
}

uint64_t sub_1A9618C4C(uint64_t result, uint64_t a2, void *a3)
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

uint64_t sub_1A9618C68(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = *v3;
  sub_1A9632900();
  sub_1A9631510();
  sub_1A9631E60();
  uint64_t v8 = sub_1A9632930();
  uint64_t v9 = -1 << *(unsigned char *)(v7 + 32);
  unint64_t v10 = v8 & ~v9;
  if ((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10))
  {
    uint64_t v11 = *(void *)(v7 + 48);
    uint64_t v12 = (void *)(v11 + 16 * v10);
    BOOL v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (sub_1A96327D0() & 1) != 0)
    {
LABEL_7:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v14 = (uint64_t *)(*(void *)(*v3 + 48) + 16 * v10);
      uint64_t v15 = v14[1];
      *a1 = *v14;
      a1[1] = v15;
      sub_1A9631510();
      return 0;
    }
    uint64_t v17 = ~v9;
    while (1)
    {
      unint64_t v10 = (v10 + 1) & v17;
      if (((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10) & 1) == 0) {
        break;
      }
      os_log_t v18 = (void *)(v11 + 16 * v10);
      BOOL v19 = *v18 == a2 && v18[1] == a3;
      if (v19 || (sub_1A96327D0() & 1) != 0) {
        goto LABEL_7;
      }
    }
  }
  swift_bridgeObjectRelease();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v21 = *v3;
  *uint64_t v3 = 0x8000000000000000;
  sub_1A9631510();
  sub_1A96190F4(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  *uint64_t v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t sub_1A9618E18()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E97ED218);
  uint64_t v3 = sub_1A9632430();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    long long v30 = (void *)(v2 + 56);
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
      sub_1A9632900();
      sub_1A9631E60();
      uint64_t result = sub_1A9632930();
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
                sub_1A9618C4C(0, (unint64_t)(v29 + 63) >> 6, v30);
              }
              else {
                *long long v30 = -1 << v29;
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
  *uint64_t v1 = v4;
  return result;
}

uint64_t sub_1A96190F4(uint64_t result, uint64_t a2, unint64_t a3, char a4)
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
    sub_1A9618E18();
  }
  else
  {
    if (v10 > v9)
    {
      uint64_t result = (uint64_t)sub_1A9619290();
      goto LABEL_22;
    }
    sub_1A9619444();
  }
  uint64_t v11 = *v4;
  sub_1A9632900();
  sub_1A9631E60();
  uint64_t result = sub_1A9632930();
  uint64_t v12 = -1 << *(unsigned char *)(v11 + 32);
  a3 = result & ~v12;
  uint64_t v13 = v11 + 56;
  if ((*(void *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3))
  {
    uint64_t v14 = *(void *)(v11 + 48);
    unint64_t v15 = (void *)(v14 + 16 * a3);
    BOOL v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (uint64_t result = sub_1A96327D0(), (result & 1) != 0))
    {
LABEL_21:
      uint64_t result = sub_1A9632870();
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
          uint64_t result = sub_1A96327D0();
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

void *sub_1A9619290()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E97ED218);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_1A9632420();
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
    *uint64_t v22 = *v20;
    v22[1] = v21;
    uint64_t result = (void *)sub_1A9631510();
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

uint64_t sub_1A9619444()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E97ED218);
  uint64_t v3 = sub_1A9632430();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_34:
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
    sub_1A9632900();
    sub_1A9631510();
    sub_1A9631E60();
    uint64_t result = sub_1A9632930();
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

uint64_t sub_1A96196F0(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6)
{
  if (result < a5)
  {
    __break(1u);
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  if ((uint64_t)(a6 >> 1) < result || (uint64_t)(a6 >> 1) < a2) {
    goto LABEL_10;
  }
  if (a2 < a5)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  if ((a2 & 0x8000000000000000) == 0) {
    return swift_unknownObjectRetain();
  }
LABEL_12:
  __break(1u);
  return result;
}

unint64_t sub_1A9619770()
{
  unint64_t result = qword_1E97ED1C8;
  if (!qword_1E97ED1C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97ED1C8);
  }
  return result;
}

unint64_t sub_1A96197C0()
{
  unint64_t result = qword_1E97ED1D0;
  if (!qword_1E97ED1D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97ED1D0);
  }
  return result;
}

unint64_t sub_1A9619810()
{
  unint64_t result = qword_1E97ED1D8;
  if (!qword_1E97ED1D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97ED1D8);
  }
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for WeatherDataLastFetched(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v8 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v6 = *(void *)(a3 - 8);
    uint64_t v7 = sub_1A962E810();
    if (__swift_getEnumTagSinglePayload((uint64_t)a2, 1, v7))
    {
      memcpy(a1, a2, *(void *)(v6 + 64));
    }
    else
    {
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
      __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v7);
    }
  }
  return a1;
}

void *initializeWithCopy for WeatherDataLastFetched(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6 = sub_1A962E810();
  if (__swift_getEnumTagSinglePayload((uint64_t)a2, 1, v6))
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
    __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v6);
  }
  return a1;
}

void *assignWithCopy for WeatherDataLastFetched(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6 = sub_1A962E810();
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)a1, 1, v6);
  int v8 = __swift_getEnumTagSinglePayload((uint64_t)a2, 1, v6);
  if (!EnumTagSinglePayload)
  {
    uint64_t v9 = *(void *)(v6 - 8);
    if (!v8)
    {
      (*(void (**)(void *, const void *, uint64_t))(v9 + 24))(a1, a2, v6);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v9 + 8))(a1, v6);
    goto LABEL_6;
  }
  if (v8)
  {
LABEL_6:
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, const void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v6);
  return a1;
}

void *initializeWithTake for WeatherDataLastFetched(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6 = sub_1A962E810();
  if (__swift_getEnumTagSinglePayload((uint64_t)a2, 1, v6))
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
    __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v6);
  }
  return a1;
}

void *assignWithTake for WeatherDataLastFetched(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6 = sub_1A962E810();
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)a1, 1, v6);
  int v8 = __swift_getEnumTagSinglePayload((uint64_t)a2, 1, v6);
  if (!EnumTagSinglePayload)
  {
    uint64_t v9 = *(void *)(v6 - 8);
    if (!v8)
    {
      (*(void (**)(void *, const void *, uint64_t))(v9 + 40))(a1, a2, v6);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v9 + 8))(a1, v6);
    goto LABEL_6;
  }
  if (v8)
  {
LABEL_6:
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, const void *, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for WeatherDataLastFetched(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1A9619D80);
}

uint64_t sub_1A9619D80(uint64_t a1, uint64_t a2)
{
  OUTLINED_FUNCTION_51_4();
  uint64_t v4 = sub_1A962E810();
  unsigned int EnumTagSinglePayload = __swift_getEnumTagSinglePayload(v2, a2, v4);
  if (EnumTagSinglePayload >= 2) {
    return EnumTagSinglePayload - 1;
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for WeatherDataLastFetched(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1A9619DD8);
}

uint64_t sub_1A9619DD8(uint64_t a1, int a2, uint64_t a3)
{
  if (a2) {
    uint64_t v5 = (a2 + 1);
  }
  else {
    uint64_t v5 = 0;
  }
  uint64_t v6 = sub_1A962E810();
  return __swift_storeEnumTagSinglePayload(a1, v5, a3, v6);
}

uint64_t sub_1A9619E34(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1A962E810();
  return __swift_storeEnumTagSinglePayload(a1, a2, 1, v4);
}

void type metadata accessor for WeatherDataError()
{
}

uint64_t dispatch thunk of WeatherDataManagerType.fetchInterpolatedWeather(for:with:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

uint64_t dispatch thunk of WeatherDataManagerType.fetch(_:for:with:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 16))();
}

uint64_t dispatch thunk of WeatherDataManagerType.cached(_:for:with:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 24))();
}

uint64_t dispatch thunk of WeatherDataManagerType.lastServerFetch(for:products:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 32))();
}

uint64_t type metadata accessor for WeatherDataManager()
{
  return self;
}

unsigned char *_s13WeatherDaemon18WeatherDataCachingOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1A9619FCCLL);
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

ValueMetadata *type metadata accessor for WeatherDataCaching.CodingKeys()
{
  return &type metadata for WeatherDataCaching.CodingKeys;
}

ValueMetadata *type metadata accessor for WeatherDataCaching.DisabledCodingKeys()
{
  return &type metadata for WeatherDataCaching.DisabledCodingKeys;
}

ValueMetadata *type metadata accessor for WeatherDataCaching.EnabledCodingKeys()
{
  return &type metadata for WeatherDataCaching.EnabledCodingKeys;
}

unint64_t sub_1A961A028()
{
  unint64_t result = qword_1E97ED1E0;
  if (!qword_1E97ED1E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97ED1E0);
  }
  return result;
}

unint64_t sub_1A961A078()
{
  unint64_t result = qword_1E97ED1E8;
  if (!qword_1E97ED1E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97ED1E8);
  }
  return result;
}

unint64_t sub_1A961A0C8()
{
  unint64_t result = qword_1E97ED1F0;
  if (!qword_1E97ED1F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97ED1F0);
  }
  return result;
}

unint64_t sub_1A961A118()
{
  unint64_t result = qword_1E97ED1F8;
  if (!qword_1E97ED1F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97ED1F8);
  }
  return result;
}

unint64_t sub_1A961A168()
{
  unint64_t result = qword_1E97ED200;
  if (!qword_1E97ED200)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97ED200);
  }
  return result;
}

unint64_t sub_1A961A1B8()
{
  unint64_t result = qword_1E97ED208;
  if (!qword_1E97ED208)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97ED208);
  }
  return result;
}

unint64_t sub_1A961A208()
{
  unint64_t result = qword_1E97ED210;
  if (!qword_1E97ED210)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97ED210);
  }
  return result;
}

uint64_t sub_1A961A254(uint64_t result)
{
  if (result)
  {
    swift_release();
    swift_release();
    return swift_release();
  }
  return result;
}

uint64_t sub_1A961A2A0()
{
  return swift_release();
}

uint64_t sub_1A961A2A8()
{
  return OUTLINED_FUNCTION_0_45(v0, 32);
}

uint64_t sub_1A961A2B4()
{
  return OUTLINED_FUNCTION_0_45(v0, 17);
}

unsigned char **sub_1A961A2C0(unsigned char **a1, uint64_t a2, uint64_t a3)
{
  return sub_1A94766D4(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

uint64_t sub_1A961A2C8()
{
  return OUTLINED_FUNCTION_0_45(v0, 17);
}

uint64_t sub_1A961A2D4()
{
  return OUTLINED_FUNCTION_0_45(v0, 24);
}

void sub_1A961A2E0(void *a1@<X8>)
{
}

uint64_t sub_1A961A2E8(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  return sub_1A952C828(a1, a2, a3, *(void (**)(uint64_t *__return_ptr))(v3 + 16));
}

uint64_t sub_1A961A2F0()
{
  return OUTLINED_FUNCTION_0_45(v0, 17);
}

uint64_t sub_1A961A2FC()
{
  return OUTLINED_FUNCTION_0_45(v0, 17);
}

uint64_t sub_1A961A308()
{
  return sub_1A94766E4(*(uint64_t (**)(void))(v0 + 16));
}

uint64_t sub_1A961A310(uint64_t *a1, uint64_t a2, uint64_t *a3)
{
  return sub_1A947670C(a1, a2, a3, *(uint64_t (**)(void))(v3 + 16));
}

uint64_t sub_1A961A318()
{
  return OUTLINED_FUNCTION_0_45(v0, 32);
}

uint64_t sub_1A961A324()
{
  return OUTLINED_FUNCTION_0_45(v0, 17);
}

uint64_t sub_1A961A330()
{
  return OUTLINED_FUNCTION_0_45(v0, 17);
}

uint64_t sub_1A961A33C()
{
  return OUTLINED_FUNCTION_0_45(v0, 24);
}

uint64_t sub_1A961A348()
{
  return OUTLINED_FUNCTION_0_45(v0, 17);
}

uint64_t sub_1A961A354()
{
  return OUTLINED_FUNCTION_0_45(v0, 17);
}

uint64_t sub_1A961A360()
{
  return OUTLINED_FUNCTION_0_45(v0, 32);
}

uint64_t sub_1A961A36C()
{
  return OUTLINED_FUNCTION_0_45(v0, 17);
}

uint64_t sub_1A961A378()
{
  return OUTLINED_FUNCTION_0_45(v0, 17);
}

uint64_t sub_1A961A384()
{
  return OUTLINED_FUNCTION_0_45(v0, 24);
}

uint64_t sub_1A961A390()
{
  return OUTLINED_FUNCTION_0_45(v0, 17);
}

uint64_t sub_1A961A39C()
{
  return OUTLINED_FUNCTION_0_45(v0, 17);
}

uint64_t sub_1A961A3A8()
{
  swift_release();
  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_1A961A3E0()
{
  return OUTLINED_FUNCTION_0_45(v0, 32);
}

uint64_t sub_1A961A3EC()
{
  return OUTLINED_FUNCTION_0_45(v0, 17);
}

uint64_t sub_1A961A3F8()
{
  return OUTLINED_FUNCTION_0_45(v0, 17);
}

uint64_t sub_1A961A404()
{
  return OUTLINED_FUNCTION_0_45(v0, 24);
}

uint64_t sub_1A961A410()
{
  return OUTLINED_FUNCTION_0_45(v0, 17);
}

uint64_t sub_1A961A41C()
{
  return OUTLINED_FUNCTION_0_45(v0, 17);
}

uint64_t sub_1A961A428()
{
  return OUTLINED_FUNCTION_0_45(v0, 32);
}

uint64_t sub_1A961A434()
{
  return OUTLINED_FUNCTION_0_45(v0, 17);
}

uint64_t sub_1A961A440()
{
  return OUTLINED_FUNCTION_0_45(v0, 17);
}

uint64_t sub_1A961A44C()
{
  return OUTLINED_FUNCTION_0_45(v0, 24);
}

uint64_t sub_1A961A458()
{
  return OUTLINED_FUNCTION_0_45(v0, 17);
}

uint64_t sub_1A961A464()
{
  return OUTLINED_FUNCTION_0_45(v0, 17);
}

uint64_t sub_1A961A470()
{
  return OUTLINED_FUNCTION_0_45(v0, 32);
}

uint64_t sub_1A961A47C()
{
  return OUTLINED_FUNCTION_0_45(v0, 17);
}

uint64_t sub_1A961A488()
{
  return OUTLINED_FUNCTION_0_45(v0, 17);
}

uint64_t sub_1A961A494()
{
  return OUTLINED_FUNCTION_0_45(v0, 24);
}

uint64_t sub_1A961A4A0()
{
  return OUTLINED_FUNCTION_0_45(v0, 17);
}

uint64_t sub_1A961A4AC()
{
  return OUTLINED_FUNCTION_0_45(v0, 17);
}

uint64_t sub_1A961A4B8()
{
  return OUTLINED_FUNCTION_0_45(v0, 32);
}

uint64_t sub_1A961A4C4()
{
  return OUTLINED_FUNCTION_0_45(v0, 17);
}

uint64_t sub_1A961A4D0()
{
  return OUTLINED_FUNCTION_0_45(v0, 17);
}

uint64_t sub_1A961A4DC()
{
  return OUTLINED_FUNCTION_0_45(v0, 24);
}

uint64_t sub_1A961A4E8()
{
  return OUTLINED_FUNCTION_0_45(v0, 17);
}

uint64_t sub_1A961A4F4()
{
  return OUTLINED_FUNCTION_0_45(v0, 17);
}

uint64_t sub_1A961A500()
{
  return OUTLINED_FUNCTION_0_45(v0, 32);
}

uint64_t sub_1A961A50C()
{
  return OUTLINED_FUNCTION_0_45(v0, 17);
}

uint64_t sub_1A961A518()
{
  return OUTLINED_FUNCTION_0_45(v0, 17);
}

uint64_t sub_1A961A524()
{
  return OUTLINED_FUNCTION_0_45(v0, 24);
}

uint64_t sub_1A961A530()
{
  return OUTLINED_FUNCTION_0_45(v0, 17);
}

uint64_t sub_1A961A53C()
{
  return OUTLINED_FUNCTION_0_45(v0, 17);
}

uint64_t sub_1A961A548()
{
  return OUTLINED_FUNCTION_0_45(v0, 32);
}

uint64_t sub_1A961A554()
{
  return OUTLINED_FUNCTION_0_45(v0, 17);
}

uint64_t sub_1A961A560()
{
  return OUTLINED_FUNCTION_0_45(v0, 17);
}

uint64_t sub_1A961A56C()
{
  return OUTLINED_FUNCTION_0_45(v0, 24);
}

uint64_t sub_1A961A578()
{
  return OUTLINED_FUNCTION_0_45(v0, 17);
}

uint64_t sub_1A961A584()
{
  return OUTLINED_FUNCTION_0_45(v0, 17);
}

uint64_t sub_1A961A590()
{
  return OUTLINED_FUNCTION_0_45(v0, 32);
}

uint64_t sub_1A961A59C()
{
  return OUTLINED_FUNCTION_0_45(v0, 17);
}

uint64_t sub_1A961A5A8()
{
  return OUTLINED_FUNCTION_0_45(v0, 17);
}

uint64_t sub_1A961A5B4()
{
  return OUTLINED_FUNCTION_0_45(v0, 24);
}

uint64_t sub_1A961A5C0()
{
  return OUTLINED_FUNCTION_0_45(v0, 17);
}

uint64_t sub_1A961A5CC()
{
  return OUTLINED_FUNCTION_0_45(v0, 17);
}

uint64_t sub_1A961A5D8()
{
  return OUTLINED_FUNCTION_0_45(v0, 32);
}

uint64_t sub_1A961A5E4()
{
  return OUTLINED_FUNCTION_0_45(v0, 17);
}

uint64_t sub_1A961A5F0()
{
  return OUTLINED_FUNCTION_0_45(v0, 17);
}

uint64_t sub_1A961A5FC()
{
  return OUTLINED_FUNCTION_0_45(v0, 24);
}

uint64_t sub_1A961A608()
{
  return OUTLINED_FUNCTION_0_45(v0, 17);
}

uint64_t sub_1A961A614()
{
  return OUTLINED_FUNCTION_0_45(v0, 17);
}

uint64_t sub_1A961A620()
{
  return OUTLINED_FUNCTION_0_45(v0, 32);
}

uint64_t sub_1A961A62C()
{
  return OUTLINED_FUNCTION_0_45(v0, 17);
}

uint64_t sub_1A961A638()
{
  return OUTLINED_FUNCTION_0_45(v0, 17);
}

uint64_t sub_1A961A644()
{
  return OUTLINED_FUNCTION_0_45(v0, 24);
}

uint64_t sub_1A961A650()
{
  return OUTLINED_FUNCTION_0_45(v0, 17);
}

uint64_t sub_1A961A65C()
{
  return OUTLINED_FUNCTION_0_45(v0, 17);
}

uint64_t sub_1A961A668()
{
  return OUTLINED_FUNCTION_0_45(v0, 32);
}

uint64_t sub_1A961A674()
{
  return OUTLINED_FUNCTION_0_45(v0, 17);
}

uint64_t sub_1A961A680()
{
  return OUTLINED_FUNCTION_0_45(v0, 17);
}

uint64_t sub_1A961A68C()
{
  return OUTLINED_FUNCTION_0_45(v0, 24);
}

uint64_t sub_1A961A698()
{
  return OUTLINED_FUNCTION_0_45(v0, 17);
}

uint64_t sub_1A961A6A4()
{
  return OUTLINED_FUNCTION_0_45(v0, 17);
}

uint64_t sub_1A961A6B0()
{
  return OUTLINED_FUNCTION_0_45(v0, 32);
}

uint64_t sub_1A961A6BC()
{
  return OUTLINED_FUNCTION_0_45(v0, 17);
}

uint64_t sub_1A961A6C8()
{
  return OUTLINED_FUNCTION_0_45(v0, 17);
}

uint64_t sub_1A961A6D4()
{
  return OUTLINED_FUNCTION_0_45(v0, 24);
}

uint64_t sub_1A961A6E0()
{
  return OUTLINED_FUNCTION_0_45(v0, 17);
}

uint64_t sub_1A961A6EC()
{
  return OUTLINED_FUNCTION_0_45(v0, 17);
}

uint64_t sub_1A961A6F8()
{
  return OUTLINED_FUNCTION_0_45(v0, 32);
}

uint64_t sub_1A961A704()
{
  return OUTLINED_FUNCTION_0_45(v0, 17);
}

uint64_t sub_1A961A710()
{
  return OUTLINED_FUNCTION_0_45(v0, 17);
}

uint64_t sub_1A961A71C()
{
  return OUTLINED_FUNCTION_0_45(v0, 24);
}

uint64_t sub_1A961A728()
{
  return OUTLINED_FUNCTION_0_45(v0, 17);
}

uint64_t sub_1A961A734()
{
  return OUTLINED_FUNCTION_0_45(v0, 17);
}

uint64_t sub_1A961A740()
{
  return OUTLINED_FUNCTION_0_45(v0, 32);
}

uint64_t sub_1A961A74C()
{
  return OUTLINED_FUNCTION_0_45(v0, 17);
}

uint64_t sub_1A961A758()
{
  return OUTLINED_FUNCTION_0_45(v0, 17);
}

uint64_t sub_1A961A764()
{
  return OUTLINED_FUNCTION_0_45(v0, 24);
}

uint64_t sub_1A961A770()
{
  return OUTLINED_FUNCTION_0_45(v0, 17);
}

uint64_t sub_1A961A77C()
{
  return OUTLINED_FUNCTION_0_45(v0, 17);
}

uint64_t sub_1A961A788()
{
  return OUTLINED_FUNCTION_0_45(v0, 32);
}

uint64_t sub_1A961A794()
{
  return OUTLINED_FUNCTION_0_45(v0, 17);
}

uint64_t sub_1A961A7A0()
{
  return OUTLINED_FUNCTION_0_45(v0, 17);
}

uint64_t sub_1A961A7AC()
{
  return OUTLINED_FUNCTION_0_45(v0, 24);
}

uint64_t sub_1A961A7B8()
{
  return OUTLINED_FUNCTION_0_45(v0, 17);
}

uint64_t sub_1A961A7C4()
{
  return OUTLINED_FUNCTION_0_45(v0, 17);
}

uint64_t sub_1A961A7D0()
{
  return OUTLINED_FUNCTION_0_45(v0, 32);
}

uint64_t sub_1A961A7DC()
{
  return OUTLINED_FUNCTION_0_45(v0, 17);
}

uint64_t sub_1A961A7E8()
{
  return OUTLINED_FUNCTION_0_45(v0, 17);
}

uint64_t sub_1A961A7F4()
{
  return OUTLINED_FUNCTION_0_45(v0, 24);
}

uint64_t sub_1A961A800()
{
  return OUTLINED_FUNCTION_0_45(v0, 17);
}

uint64_t sub_1A961A80C()
{
  return OUTLINED_FUNCTION_0_45(v0, 17);
}

uint64_t sub_1A961A818()
{
  return OUTLINED_FUNCTION_0_45(v0, 32);
}

uint64_t sub_1A961A824()
{
  return OUTLINED_FUNCTION_0_45(v0, 17);
}

uint64_t sub_1A961A830()
{
  return OUTLINED_FUNCTION_0_45(v0, 17);
}

uint64_t sub_1A961A83C()
{
  return OUTLINED_FUNCTION_0_45(v0, 24);
}

uint64_t sub_1A961A848()
{
  return OUTLINED_FUNCTION_0_45(v0, 17);
}

uint64_t sub_1A961A854()
{
  return OUTLINED_FUNCTION_0_45(v0, 17);
}

uint64_t sub_1A961A860()
{
  return OUTLINED_FUNCTION_0_45(v0, 32);
}

uint64_t sub_1A961A86C()
{
  return OUTLINED_FUNCTION_0_45(v0, 17);
}

uint64_t sub_1A961A878()
{
  return OUTLINED_FUNCTION_0_45(v0, 17);
}

uint64_t sub_1A961A884()
{
  return OUTLINED_FUNCTION_0_45(v0, 24);
}

uint64_t sub_1A961A890()
{
  return OUTLINED_FUNCTION_0_45(v0, 17);
}

uint64_t sub_1A961A89C()
{
  return OUTLINED_FUNCTION_0_45(v0, 17);
}

uint64_t sub_1A961A8A8()
{
  return OUTLINED_FUNCTION_0_45(v0, 32);
}

uint64_t sub_1A961A8B4()
{
  return OUTLINED_FUNCTION_0_45(v0, 17);
}

uint64_t sub_1A961A8C0()
{
  return OUTLINED_FUNCTION_0_45(v0, 17);
}

uint64_t sub_1A961A8CC()
{
  return OUTLINED_FUNCTION_0_45(v0, 24);
}

uint64_t sub_1A961A8D8()
{
  return OUTLINED_FUNCTION_0_45(v0, 17);
}

uint64_t sub_1A961A8E4()
{
  return OUTLINED_FUNCTION_0_45(v0, 17);
}

uint64_t sub_1A961A8F0()
{
  return OUTLINED_FUNCTION_0_45(v0, 32);
}

uint64_t sub_1A961A8FC()
{
  return sub_1A960D950();
}

uint64_t sub_1A961A918()
{
  return OUTLINED_FUNCTION_0_45(v0, 17);
}

uint64_t sub_1A961A924()
{
  return OUTLINED_FUNCTION_0_45(v0, 17);
}

uint64_t sub_1A961A930()
{
  return OUTLINED_FUNCTION_0_45(v0, 24);
}

uint64_t sub_1A961A93C()
{
  return OUTLINED_FUNCTION_0_45(v0, 17);
}

uint64_t sub_1A961A948()
{
  return OUTLINED_FUNCTION_0_45(v0, 17);
}

uint64_t sub_1A961A954()
{
  return OUTLINED_FUNCTION_0_45(v0, 32);
}

uint64_t sub_1A961A960()
{
  return OUTLINED_FUNCTION_0_45(v0, 17);
}

uint64_t sub_1A961A96C()
{
  return OUTLINED_FUNCTION_0_45(v0, 17);
}

uint64_t sub_1A961A978()
{
  return OUTLINED_FUNCTION_0_45(v0, 24);
}

uint64_t sub_1A961A984()
{
  return OUTLINED_FUNCTION_0_45(v0, 17);
}

uint64_t sub_1A961A990()
{
  return OUTLINED_FUNCTION_0_45(v0, 17);
}

void sub_1A961A99C(void *a1@<X8>)
{
  sub_1A94A88C4();
  *a1 = v2;
  a1[1] = v3;
}

void sub_1A961A9C8(void *a1@<X8>)
{
  sub_1A94A8AB4();
  *a1 = v2;
  a1[1] = v3;
}

uint64_t sub_1A961A9F4(uint64_t a1, uint64_t a2)
{
  long long v2 = *(_OWORD *)(a1 + 16);
  v4[0] = *(_OWORD *)a1;
  v4[1] = v2;
  uint64_t v5 = *(void *)(a1 + 32);
  return sub_1A95E2DC4((uint64_t)v4, a2, (uint64_t (*)(void))sub_1A95D9B5C);
}

uint64_t sub_1A961AA3C(uint64_t a1)
{
  return sub_1A961A9F4(a1, *(void *)(v1 + 16));
}

uint64_t sub_1A961AA58(uint64_t *a1)
{
  return sub_1A95E2E28(a1, *(void *)(v1 + 16)) & 1;
}

uint64_t sub_1A961AA78(uint64_t a1)
{
  return sub_1A95B965C(a1, *(void *)(v1 + 16), *(void *)(v1 + 24)) & 1;
}

uint64_t sub_1A961AA98(uint64_t a1)
{
  return sub_1A95B96E8(a1, *(void *)(v1 + 16), *(void *)(v1 + 24)) & 1;
}

uint64_t sub_1A961AAB8(uint64_t a1, uint64_t a2)
{
  long long v2 = *(_OWORD *)(a1 + 16);
  v4[0] = *(_OWORD *)a1;
  v4[1] = v2;
  uint64_t v5 = *(void *)(a1 + 32);
  return sub_1A95E2DC4((uint64_t)v4, a2, (uint64_t (*)(void))sub_1A95DA9FC);
}

uint64_t sub_1A961AB00(uint64_t a1)
{
  return sub_1A961AAB8(a1, *(void *)(v1 + 16));
}

uint64_t sub_1A961AB1C(uint64_t a1)
{
  return sub_1A95E3234(a1, *(void *)(v1 + 16)) & 1;
}

unint64_t sub_1A961AB3C()
{
  unint64_t result = qword_1E97ED260;
  if (!qword_1E97ED260)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97ED260);
  }
  return result;
}

unint64_t sub_1A961AB88()
{
  unint64_t result = qword_1E97ED268;
  if (!qword_1E97ED268)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97ED268);
  }
  return result;
}

uint64_t sub_1A961ABD4()
{
  return sub_1A95F189C(*(void *)(v0 + 16));
}

uint64_t sub_1A961ABF8()
{
  uint64_t v3 = (int *)type metadata accessor for WeatherRequestOptions();
  OUTLINED_FUNCTION_34_1();
  uint64_t v5 = *(unsigned __int8 *)(v4 + 80);
  uint64_t v7 = *(void *)(v6 + 64);
  uint64_t v38 = (v5 + 32) & ~v5;
  uint64_t v8 = v0 + v38;
  swift_bridgeObjectRelease();
  uint64_t v9 = v0 + v38 + v3[5];
  uint64_t v10 = sub_1A962EA40();
  if (!OUTLINED_FUNCTION_28_2(v10))
  {
    OUTLINED_FUNCTION_4_8();
    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v9, v1);
  }
  OUTLINED_FUNCTION_96_1();
  sub_1A962E360();
  if (!OUTLINED_FUNCTION_117_0())
  {
    OUTLINED_FUNCTION_4_8();
    uint64_t v12 = OUTLINED_FUNCTION_49();
    v13(v12);
  }
  uint64_t v14 = v8 + v3[8];
  if (!OUTLINED_FUNCTION_117_0())
  {
    OUTLINED_FUNCTION_4_8();
    uint64_t v15 = OUTLINED_FUNCTION_49();
    v16(v15);
  }
  OUTLINED_FUNCTION_96_1();
  uint64_t v17 = type metadata accessor for WeatherRequestDailyRelativeRange();
  if (!OUTLINED_FUNCTION_12_1(v17))
  {
    OUTLINED_FUNCTION_43_0();
    OUTLINED_FUNCTION_10();
    (*(void (**)(uint64_t))(v18 + 8))(v14);
  }
  OUTLINED_FUNCTION_96_1();
  uint64_t v19 = type metadata accessor for WeatherRequestHourlyRelativeRange();
  if (!OUTLINED_FUNCTION_12_1(v19))
  {
    OUTLINED_FUNCTION_43_0();
    OUTLINED_FUNCTION_10();
    (*(void (**)(uint64_t))(v20 + 8))(v14);
  }
  OUTLINED_FUNCTION_96_1();
  uint64_t v21 = type metadata accessor for WeatherRequestPeriodicRelativeRange();
  if (!OUTLINED_FUNCTION_12_1(v21))
  {
    uint64_t v37 = v5;
    uint64_t v22 = sub_1A962E810();
    OUTLINED_FUNCTION_10();
    char v24 = *(void (**)(uint64_t, uint64_t))(v23 + 8);
    v24(v14, v22);
    uint64_t v25 = v22;
    uint64_t v5 = v37;
    v24(v14 + *(int *)(v2 + 20), v25);
    swift_bridgeObjectRelease();
  }
  OUTLINED_FUNCTION_96_1();
  uint64_t v26 = type metadata accessor for WeatherRequestMarineHourlyRelativeRange();
  if (!OUTLINED_FUNCTION_12_1(v26))
  {
    OUTLINED_FUNCTION_43_0();
    OUTLINED_FUNCTION_10();
    (*(void (**)(uint64_t))(v27 + 8))(v14);
  }
  OUTLINED_FUNCTION_96_1();
  uint64_t v28 = type metadata accessor for WeatherInterpolationOptions();
  if (!OUTLINED_FUNCTION_12_1(v28))
  {
    if (swift_getEnumCaseMultiPayload() != 1) {
      sub_1A962E810();
    }
    OUTLINED_FUNCTION_4_8();
    uint64_t v29 = OUTLINED_FUNCTION_49();
    v30(v29);
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v31 = v8 + v3[18];
  uint64_t v32 = type metadata accessor for WDSNetworkActivity();
  if (!OUTLINED_FUNCTION_28_2(v32))
  {
    uint64_t v33 = v31 + *(int *)(v14 + 24);
    uint64_t v34 = sub_1A962E850();
    if (!OUTLINED_FUNCTION_28_2(v34))
    {
      OUTLINED_FUNCTION_4_8();
      (*(void (**)(uint64_t, uint64_t))(v35 + 8))(v33, v14);
    }
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return MEMORY[0x1F4186498](v0, ((v7 + v38 + 7) & 0xFFFFFFFFFFFFFFF8) + 8, v5 | 7);
}

void sub_1A961AF80()
{
  OUTLINED_FUNCTION_131_0();
  uint64_t v3 = type metadata accessor for WeatherRequestOptions();
  OUTLINED_FUNCTION_0_2(v3);
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  unint64_t v8 = (*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  sub_1A95F1994(v2, v1, v0 + v8, *(void *)(v0 + ((*(void *)(v7 + 64) + v8 + 7) & 0xFFFFFFFFFFFFFFF8)), *(double *)(v0 + 16), *(double *)(v0 + 24));
}

unint64_t sub_1A961AFFC()
{
  unint64_t result = qword_1EB6DAEE0;
  if (!qword_1EB6DAEE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB6DAEE0);
  }
  return result;
}

unint64_t sub_1A961B048()
{
  unint64_t result = qword_1EB6DAEE8;
  if (!qword_1EB6DAEE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB6DAEE8);
  }
  return result;
}

unint64_t sub_1A961B094()
{
  unint64_t result = qword_1EB6DAEF0;
  if (!qword_1EB6DAEF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB6DAEF0);
  }
  return result;
}

uint64_t sub_1A961B0E0@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
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

uint64_t sub_1A961B118(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = OUTLINED_FUNCTION_51_4();
  v4(v3);
  OUTLINED_FUNCTION_10();
  uint64_t v5 = OUTLINED_FUNCTION_52();
  v6(v5);
  return a2;
}

void sub_1A961B168()
{
}

uint64_t sub_1A961B1A8()
{
  OUTLINED_FUNCTION_6_10();
  type metadata accessor for WeatherInterpolationOptions();
  OUTLINED_FUNCTION_34_1();
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v4 = *(void *)(v3 + 64);
  sub_1A962EA40();
  OUTLINED_FUNCTION_1();
  if (swift_getEnumCaseMultiPayload() == 1) {
    sub_1A962E360();
  }
  else {
    sub_1A962E810();
  }
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_34();
  v5();
  __swift_destroy_boxed_opaque_existential_1(v0 + ((v4 + ((v2 + 32) & ~v2) + 7) & 0xFFFFFFFFFFFFFFF8));
  OUTLINED_FUNCTION_103();
  v6();
  OUTLINED_FUNCTION_7_1();
  return MEMORY[0x1F4186498](v7, v8, v9);
}

uint64_t sub_1A961B2E0()
{
  OUTLINED_FUNCTION_131_0();
  uint64_t v3 = type metadata accessor for WeatherInterpolationOptions();
  OUTLINED_FUNCTION_0_2(v3);
  unint64_t v5 = (*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  unint64_t v7 = (*(void *)(v6 + 64) + v5 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v8 = *(void *)(sub_1A962EA40() - 8);
  return sub_1A95F5454(v2, v1, v0 + v5, (v0 + v7), v0 + ((v7 + *(unsigned __int8 *)(v8 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80)), *(double *)(v0 + 16), *(double *)(v0 + 24));
}

uint64_t sub_1A961B3A4(uint64_t a1, void (*a2)(void))
{
  a2(0);
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_34();
  v3();
  return a1;
}

unint64_t sub_1A961B3F8()
{
  unint64_t result = qword_1EB6DA910;
  if (!qword_1EB6DA910)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB6DA910);
  }
  return result;
}

unint64_t sub_1A961B444()
{
  unint64_t result = qword_1EB6DA918;
  if (!qword_1EB6DA918)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB6DA918);
  }
  return result;
}

uint64_t sub_1A961B490(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract((uint64_t *)&unk_1EB6DA5A0);
    sub_1A961B3F8();
    sub_1A961B444();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1A961B500(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t OUTLINED_FUNCTION_50_3(float a1)
{
  *uint64_t v1 = a1;
  return sub_1A9632350();
}

uint64_t OUTLINED_FUNCTION_86_2()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_90_1()
{
  return sub_1A95DED0C();
}

uint64_t OUTLINED_FUNCTION_96_1()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_104_0()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_107()
{
  return sub_1A945C1DC(v1, v0, (uint64_t *)(v2 - 96));
}

uint64_t OUTLINED_FUNCTION_109()
{
  return sub_1A945C1DC(v0, v1, (uint64_t *)(v2 - 96));
}

uint64_t OUTLINED_FUNCTION_111_0()
{
  return sub_1A9631DC0();
}

void OUTLINED_FUNCTION_118_0()
{
  *(_WORD *)(v0 + 12) = 2081;
  type metadata accessor for CLLocationCoordinate2D(0);
}

uint64_t OUTLINED_FUNCTION_120_0(uint64_t a1)
{
  __swift_storeEnumTagSinglePayload(a1, 1, 1, v1);
  return swift_allocObject();
}

void OUTLINED_FUNCTION_121_0(void *a1@<X1>, uint64_t a2@<X8>)
{
  *a1 = a2;
  a1[1] = (v2 - 32) | 0x8000000000000000;
}

uint64_t OUTLINED_FUNCTION_122_0()
{
  return swift_retain();
}

uint64_t OUTLINED_FUNCTION_131_0()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_132_0(uint64_t a1, unint64_t a2)
{
  return sub_1A945C1DC(a1, a2, (uint64_t *)(v2 - 96));
}

uint64_t OUTLINED_FUNCTION_134_0()
{
  return sub_1A944C480(v1, v0);
}

uint64_t OUTLINED_FUNCTION_135_0()
{
  return sub_1A96319B0();
}

uint64_t OUTLINED_FUNCTION_139()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_145_0()
{
  return sub_1A96319A0();
}

uint64_t OUTLINED_FUNCTION_147_0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  return sub_1A944A348(v3, v4, a3);
}

uint64_t OUTLINED_FUNCTION_148_0()
{
  return sub_1A9631DC0();
}

uint64_t OUTLINED_FUNCTION_151_0()
{
  return swift_retain();
}

void OUTLINED_FUNCTION_152_0(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v6, a4, v5, 0x16u);
}

uint64_t OUTLINED_FUNCTION_155_0(uint64_t a1, unint64_t a2)
{
  return sub_1A945C1DC(a1, a2, (uint64_t *)(v2 - 96));
}

void OUTLINED_FUNCTION_157_0(float a1)
{
  *uint64_t v1 = a1;
}

uint64_t WeatherAlert.id.getter()
{
  sub_1A962E850();
  OUTLINED_FUNCTION_10();
  uint64_t v0 = OUTLINED_FUNCTION_5();
  return v1(v0);
}

uint64_t WeatherAlert.id.setter()
{
  sub_1A962E850();
  OUTLINED_FUNCTION_10();
  uint64_t v0 = OUTLINED_FUNCTION_15_17();
  return v1(v0);
}

uint64_t (*WeatherAlert.id.modify())(void)
{
  return nullsub_1;
}

uint64_t WeatherAlert.area.getter()
{
  uint64_t v2 = *(void *)(v1 + *(int *)(OUTLINED_FUNCTION_10_21() + 20));
  *uint64_t v0 = v2;
  return sub_1A94EB758(v2);
}

uint64_t type metadata accessor for WeatherAlert()
{
  uint64_t result = qword_1EB6DADB0;
  if (!qword_1EB6DADB0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t WeatherAlert.area.setter(uint64_t *a1)
{
  uint64_t v2 = *a1;
  uint64_t v3 = *(int *)(type metadata accessor for WeatherAlert() + 20);
  uint64_t result = sub_1A95654E4(*(void *)(v1 + v3));
  *(void *)(v1 + v3) = v2;
  return result;
}

uint64_t (*WeatherAlert.area.modify())(void)
{
  return nullsub_1;
}

uint64_t WeatherAlert.areaId.getter()
{
  return OUTLINED_FUNCTION_5();
}

uint64_t WeatherAlert.areaId.setter()
{
  OUTLINED_FUNCTION_5_41();
  uint64_t result = OUTLINED_FUNCTION_32_0();
  *uint64_t v1 = v2;
  v1[1] = v0;
  return result;
}

uint64_t (*WeatherAlert.areaId.modify())(void)
{
  return nullsub_1;
}

uint64_t WeatherAlert.areaName.getter()
{
  return OUTLINED_FUNCTION_5();
}

uint64_t WeatherAlert.areaName.setter()
{
  OUTLINED_FUNCTION_5_41();
  uint64_t result = OUTLINED_FUNCTION_32_0();
  *uint64_t v1 = v2;
  v1[1] = v0;
  return result;
}

uint64_t (*WeatherAlert.areaName.modify())(void)
{
  return nullsub_1;
}

uint64_t WeatherAlert.countryCode.getter()
{
  return OUTLINED_FUNCTION_5();
}

uint64_t WeatherAlert.countryCode.setter()
{
  OUTLINED_FUNCTION_5_41();
  uint64_t result = OUTLINED_FUNCTION_32_0();
  *uint64_t v1 = v2;
  v1[1] = v0;
  return result;
}

uint64_t (*WeatherAlert.countryCode.modify())(void)
{
  return nullsub_1;
}

uint64_t WeatherAlert.description.getter()
{
  return OUTLINED_FUNCTION_5();
}

uint64_t WeatherAlert.description.setter()
{
  OUTLINED_FUNCTION_5_41();
  uint64_t result = OUTLINED_FUNCTION_32_0();
  *uint64_t v1 = v2;
  v1[1] = v0;
  return result;
}

uint64_t (*WeatherAlert.description.modify())(void)
{
  return nullsub_1;
}

uint64_t WeatherAlert.expireTime.getter()
{
  OUTLINED_FUNCTION_10_21();
  OUTLINED_FUNCTION_19_12();
  OUTLINED_FUNCTION_10();
  uint64_t v0 = OUTLINED_FUNCTION_5();
  return v1(v0);
}

uint64_t WeatherAlert.expireTime.setter()
{
  OUTLINED_FUNCTION_1_56();
  OUTLINED_FUNCTION_19_12();
  OUTLINED_FUNCTION_10();
  uint64_t v0 = OUTLINED_FUNCTION_15_17();
  return v1(v0);
}

uint64_t (*WeatherAlert.expireTime.modify())(void)
{
  return nullsub_1;
}

uint64_t WeatherAlert.issuedTime.getter()
{
  OUTLINED_FUNCTION_10_21();
  OUTLINED_FUNCTION_19_12();
  OUTLINED_FUNCTION_10();
  uint64_t v0 = OUTLINED_FUNCTION_5();
  return v1(v0);
}

uint64_t WeatherAlert.issuedTime.setter()
{
  OUTLINED_FUNCTION_1_56();
  OUTLINED_FUNCTION_19_12();
  OUTLINED_FUNCTION_10();
  uint64_t v0 = OUTLINED_FUNCTION_15_17();
  return v1(v0);
}

uint64_t (*WeatherAlert.issuedTime.modify())(void)
{
  return nullsub_1;
}

uint64_t WeatherAlert.effectiveTime.getter()
{
  OUTLINED_FUNCTION_10_21();
  OUTLINED_FUNCTION_19_12();
  OUTLINED_FUNCTION_10();
  uint64_t v0 = OUTLINED_FUNCTION_5();
  return v1(v0);
}

uint64_t WeatherAlert.effectiveTime.setter()
{
  OUTLINED_FUNCTION_1_56();
  OUTLINED_FUNCTION_19_12();
  OUTLINED_FUNCTION_10();
  uint64_t v0 = OUTLINED_FUNCTION_15_17();
  return v1(v0);
}

uint64_t (*WeatherAlert.effectiveTime.modify())(void)
{
  return nullsub_1;
}

uint64_t WeatherAlert.eventOnsetTime.getter()
{
  uint64_t v2 = v1 + *(int *)(OUTLINED_FUNCTION_10_21() + 52);
  return sub_1A9412F20(v2, v0);
}

uint64_t WeatherAlert.eventOnsetTime.setter()
{
  uint64_t v2 = v1 + *(int *)(OUTLINED_FUNCTION_1_56() + 52);
  return sub_1A94200B4(v0, v2);
}

uint64_t (*WeatherAlert.eventOnsetTime.modify())(void)
{
  return nullsub_1;
}

uint64_t WeatherAlert.eventEndTime.getter()
{
  uint64_t v2 = v1 + *(int *)(OUTLINED_FUNCTION_10_21() + 56);
  return sub_1A9412F20(v2, v0);
}

uint64_t WeatherAlert.eventEndTime.setter()
{
  uint64_t v2 = v1 + *(int *)(OUTLINED_FUNCTION_1_56() + 56);
  return sub_1A94200B4(v0, v2);
}

uint64_t (*WeatherAlert.eventEndTime.modify())(void)
{
  return nullsub_1;
}

uint64_t WeatherAlert.detailsUrl.getter()
{
  return OUTLINED_FUNCTION_5();
}

uint64_t WeatherAlert.detailsUrl.setter()
{
  OUTLINED_FUNCTION_5_41();
  uint64_t result = OUTLINED_FUNCTION_32_0();
  *uint64_t v1 = v2;
  v1[1] = v0;
  return result;
}

uint64_t (*WeatherAlert.detailsUrl.modify())(void)
{
  return nullsub_1;
}

void WeatherAlert.certainty.getter()
{
  uint64_t v0 = OUTLINED_FUNCTION_10_21();
  OUTLINED_FUNCTION_7_24(*(int *)(v0 + 64));
}

uint64_t WeatherAlert.certainty.setter()
{
  uint64_t result = OUTLINED_FUNCTION_28_8();
  *(unsigned char *)(v1 + *(int *)(result + 64)) = v0;
  return result;
}

uint64_t (*WeatherAlert.certainty.modify())(void)
{
  return nullsub_1;
}

uint64_t WeatherAlert.phenomenon.getter()
{
  return OUTLINED_FUNCTION_5();
}

uint64_t WeatherAlert.phenomenon.setter()
{
  OUTLINED_FUNCTION_5_41();
  uint64_t result = OUTLINED_FUNCTION_32_0();
  *uint64_t v1 = v2;
  v1[1] = v0;
  return result;
}

uint64_t (*WeatherAlert.phenomenon.modify())(void)
{
  return nullsub_1;
}

uint64_t WeatherAlert.responses.getter()
{
  type metadata accessor for WeatherAlert();
  return sub_1A9631510();
}

uint64_t WeatherAlert.responses.setter()
{
  uint64_t v2 = *(int *)(OUTLINED_FUNCTION_1_56() + 72);
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + v2) = v0;
  return result;
}

uint64_t (*WeatherAlert.responses.modify())(void)
{
  return nullsub_1;
}

void WeatherAlert.severity.getter()
{
  uint64_t v0 = OUTLINED_FUNCTION_10_21();
  OUTLINED_FUNCTION_7_24(*(int *)(v0 + 76));
}

uint64_t WeatherAlert.severity.setter()
{
  uint64_t result = OUTLINED_FUNCTION_28_8();
  *(unsigned char *)(v1 + *(int *)(result + 76)) = v0;
  return result;
}

uint64_t (*WeatherAlert.severity.modify())(void)
{
  return nullsub_1;
}

void WeatherAlert.significance.getter()
{
  uint64_t v0 = OUTLINED_FUNCTION_10_21();
  OUTLINED_FUNCTION_7_24(*(int *)(v0 + 80));
}

uint64_t WeatherAlert.significance.setter()
{
  uint64_t result = OUTLINED_FUNCTION_28_8();
  *(unsigned char *)(v1 + *(int *)(result + 80)) = v0;
  return result;
}

uint64_t (*WeatherAlert.significance.modify())(void)
{
  return nullsub_1;
}

uint64_t WeatherAlert.source.getter()
{
  return OUTLINED_FUNCTION_5();
}

uint64_t WeatherAlert.source.setter()
{
  OUTLINED_FUNCTION_5_41();
  uint64_t result = OUTLINED_FUNCTION_32_0();
  *uint64_t v1 = v2;
  v1[1] = v0;
  return result;
}

uint64_t (*WeatherAlert.source.modify())(void)
{
  return nullsub_1;
}

uint64_t WeatherAlert.eventSource.getter()
{
  return OUTLINED_FUNCTION_5();
}

uint64_t WeatherAlert.eventSource.setter()
{
  OUTLINED_FUNCTION_5_41();
  uint64_t result = OUTLINED_FUNCTION_32_0();
  *uint64_t v1 = v2;
  v1[1] = v0;
  return result;
}

uint64_t (*WeatherAlert.eventSource.modify())(void)
{
  return nullsub_1;
}

void WeatherAlert.urgency.getter()
{
  uint64_t v0 = OUTLINED_FUNCTION_10_21();
  OUTLINED_FUNCTION_7_24(*(int *)(v0 + 92));
}

uint64_t WeatherAlert.urgency.setter()
{
  uint64_t result = OUTLINED_FUNCTION_28_8();
  *(unsigned char *)(v1 + *(int *)(result + 92)) = v0;
  return result;
}

uint64_t (*WeatherAlert.urgency.modify())(void)
{
  return nullsub_1;
}

uint64_t WeatherAlert.messages.getter()
{
  type metadata accessor for WeatherAlert();
  return sub_1A9631510();
}

uint64_t WeatherAlert.messages.setter()
{
  uint64_t v2 = *(int *)(OUTLINED_FUNCTION_1_56() + 96);
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + v2) = v0;
  return result;
}

uint64_t (*WeatherAlert.messages.modify())(void)
{
  return nullsub_1;
}

void WeatherAlert.importance.getter()
{
  uint64_t v0 = OUTLINED_FUNCTION_10_21();
  OUTLINED_FUNCTION_7_24(*(int *)(v0 + 100));
}

uint64_t WeatherAlert.importance.setter()
{
  uint64_t result = OUTLINED_FUNCTION_28_8();
  *(unsigned char *)(v1 + *(int *)(result + 100)) = v0;
  return result;
}

uint64_t (*WeatherAlert.importance.modify())(void)
{
  return nullsub_1;
}

uint64_t WeatherAlert.init(id:area:areaId:areaName:countryCode:description:expireTime:issuedTime:effectiveTime:eventOnsetTime:eventEndTime:detailsUrl:certainty:phenomenon:responses:severity:significance:source:eventSource:urgency:messages:importance:)@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char *a19, uint64_t a20,uint64_t a21,uint64_t a22,char *a23,char *a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char *a29,uint64_t a30,char *a31)
{
  uint64_t v48 = *a2;
  char v62 = *a19;
  char v63 = *a24;
  char v64 = *a23;
  char v65 = *a29;
  char v66 = *a31;
  uint64_t v32 = (int *)type metadata accessor for WeatherAlert();
  uint64_t v47 = v32[5];
  uint64_t v33 = (void *)(a9 + v32[6]);
  uint64_t v34 = (void *)(a9 + v32[7]);
  uint64_t v35 = (void *)(a9 + v32[8]);
  uint64_t v36 = a9 + v32[13];
  uint64_t v52 = v36;
  uint64_t v37 = sub_1A962E810();
  __swift_storeEnumTagSinglePayload(v36, 1, 1, v37);
  uint64_t v50 = a9 + v32[14];
  __swift_storeEnumTagSinglePayload(v50, 1, 1, v37);
  uint64_t v38 = (void *)(a9 + v32[15]);
  *uint64_t v38 = 0;
  v38[1] = 0;
  uint64_t v49 = v32[16];
  *(unsigned char *)(a9 + v49) = 5;
  uint64_t v39 = (void *)(a9 + v32[17]);
  *uint64_t v39 = 0;
  v39[1] = 0;
  uint64_t v51 = v32[20];
  *(unsigned char *)(a9 + v51) = 13;
  uint64_t v40 = (void *)(a9 + v32[22]);
  *uint64_t v40 = 0;
  v40[1] = 0;
  uint64_t v53 = v32[23];
  *(unsigned char *)(a9 + v53) = 5;
  uint64_t v41 = v32[24];
  *(void *)(a9 + v41) = 0;
  uint64_t v55 = v32[25];
  *(unsigned char *)(a9 + v55) = 4;
  sub_1A962E850();
  OUTLINED_FUNCTION_10();
  (*(void (**)(uint64_t, uint64_t))(v42 + 32))(a9, a1);
  *(void *)(a9 + v47) = v48;
  *uint64_t v33 = a3;
  v33[1] = a4;
  *uint64_t v34 = a5;
  v34[1] = a6;
  *uint64_t v35 = a7;
  v35[1] = a8;
  uint64_t v43 = (void *)(a9 + v32[9]);
  *uint64_t v43 = a10;
  v43[1] = a11;
  os_log_t v44 = *(void (**)(void))(*(void *)(v37 - 8) + 32);
  OUTLINED_FUNCTION_25_6();
  v44();
  OUTLINED_FUNCTION_25_6();
  v44();
  OUTLINED_FUNCTION_25_6();
  v44();
  sub_1A94200B4(a15, v52);
  sub_1A94200B4(a16, v50);
  swift_bridgeObjectRelease();
  *uint64_t v38 = a17;
  v38[1] = a18;
  *(unsigned char *)(a9 + v49) = v62;
  swift_bridgeObjectRelease();
  *uint64_t v39 = a20;
  v39[1] = a21;
  *(void *)(a9 + v32[18]) = a22;
  *(unsigned char *)(a9 + v32[19]) = v64;
  *(unsigned char *)(a9 + v51) = v63;
  uint64_t v45 = (void *)(a9 + v32[21]);
  *uint64_t v45 = a25;
  v45[1] = a26;
  swift_bridgeObjectRelease();
  *uint64_t v40 = a27;
  v40[1] = a28;
  *(unsigned char *)(a9 + v53) = v65;
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(a9 + v41) = a30;
  *(unsigned char *)(a9 + v55) = v66;
  return result;
}

uint64_t WeatherAlert.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v66 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6DE3A0);
  MEMORY[0x1F4188790](v3 - 8);
  uint64_t v67 = (uint64_t)&v47 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v5);
  uint64_t v68 = (uint64_t)&v47 - v6;
  sub_1A962E810();
  OUTLINED_FUNCTION_1();
  uint64_t v69 = v8;
  uint64_t v70 = v7;
  MEMORY[0x1F4188790](v7);
  uint64_t v10 = (char *)&v47 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v11);
  unint64_t v13 = (char *)&v47 - v12;
  MEMORY[0x1F4188790](v14);
  int64_t v16 = (char *)&v47 - v15;
  uint64_t v17 = sub_1A962E850();
  OUTLINED_FUNCTION_1();
  uint64_t v71 = v18;
  MEMORY[0x1F4188790](v19);
  OUTLINED_FUNCTION_2();
  uint64_t v22 = v21 - v20;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6DB090);
  OUTLINED_FUNCTION_1();
  uint64_t v73 = v23;
  uint64_t v74 = v24;
  MEMORY[0x1F4188790](v23);
  OUTLINED_FUNCTION_2();
  uint64_t v27 = v26 - v25;
  uint64_t v28 = a1[3];
  uint64_t v76 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v28);
  sub_1A961D728();
  uint64_t v72 = v27;
  uint64_t v29 = (uint64_t)v75;
  sub_1A9632950();
  if (!v29)
  {
    char v64 = v10;
    char v65 = v13;
    uint64_t v75 = v16;
    LOBYTE(v93) = 0;
    sub_1A961EBE4(&qword_1EB6DAF88, MEMORY[0x1E4F27990]);
    sub_1A9632680();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6DB010);
    LOBYTE(v93) = 1;
    sub_1A961EB9C((unint64_t *)&qword_1EB6DB008);
    sub_1A9632630();
    uint64_t v62 = v22;
    uint64_t v63 = v17;
    uint64_t v32 = v96;
    uint64_t v95 = v96;
    LOBYTE(v91) = 2;
    OUTLINED_FUNCTION_7_32();
    uint64_t v33 = v94;
    uint64_t v61 = v93;
    LOBYTE(v89) = 3;
    OUTLINED_FUNCTION_7_32();
    uint64_t v35 = v91;
    uint64_t v34 = v92;
    LOBYTE(v87) = 4;
    OUTLINED_FUNCTION_7_32();
    uint64_t v37 = v89;
    uint64_t v36 = v90;
    LOBYTE(v87) = 5;
    uint64_t v38 = sub_1A9632640();
    uint64_t v57 = v32;
    uint64_t v54 = v38;
    uint64_t v55 = v37;
    uint64_t v56 = v35;
    uint64_t v58 = v39;
    uint64_t v59 = v34;
    uint64_t v60 = v33;
    LOBYTE(v87) = 6;
    sub_1A961EBE4(&qword_1EB6DC8D8, MEMORY[0x1E4F27928]);
    sub_1A9632680();
    uint64_t v57 = v36;
    OUTLINED_FUNCTION_33_7(7);
    OUTLINED_FUNCTION_24_9();
    OUTLINED_FUNCTION_33_7(8);
    OUTLINED_FUNCTION_24_9();
    OUTLINED_FUNCTION_33_7(9);
    OUTLINED_FUNCTION_20_9();
    OUTLINED_FUNCTION_33_7(10);
    OUTLINED_FUNCTION_20_9();
    LOBYTE(v84) = 11;
    OUTLINED_FUNCTION_7_32();
    uint64_t v40 = v88;
    uint64_t v52 = v87;
    LOBYTE(v84) = 12;
    sub_1A961D774();
    OUTLINED_FUNCTION_32_7();
    v86[0] = v86[1];
    char v83 = 13;
    OUTLINED_FUNCTION_7_32();
    uint64_t v42 = v84;
    uint64_t v41 = v85;
    char v83 = 14;
    sub_1A961D7C0();
    uint64_t v53 = sub_1A96325C0();
    uint64_t v43 = v62;
    char v82 = 15;
    sub_1A961D80C();
    sub_1A9632680();
    char v82 = v83;
    v81[0] = 16;
    sub_1A961D858();
    OUTLINED_FUNCTION_32_7();
    v81[0] = v81[1];
    char v80 = 17;
    uint64_t v50 = sub_1A9632640();
    uint64_t v51 = v44;
    char v80 = 17;
    uint64_t v49 = sub_1A9632640();
    uint64_t v48 = v45;
    char v79 = 19;
    sub_1A961D8A4();
    OUTLINED_FUNCTION_32_7();
    char v79 = v80;
    char v78 = 20;
    sub_1A961D8F0();
    uint64_t v46 = sub_1A96325E0();
    char v77 = 21;
    sub_1A961D93C();
    OUTLINED_FUNCTION_32_7();
    char v77 = v78;
    WeatherAlert.init(id:area:areaId:areaName:countryCode:description:expireTime:issuedTime:effectiveTime:eventOnsetTime:eventEndTime:detailsUrl:certainty:phenomenon:responses:severity:significance:source:eventSource:urgency:messages:importance:)(v43, &v95, v61, v60, v56, v59, v55, v57, v66, v54, v58, (uint64_t)v75, (uint64_t)v65, (uint64_t)v64, v68, v67, v52, v40, v86,
      v42,
      v41,
      v53,
      &v82,
      v81,
      v50,
      v51,
      v49,
      v48,
      &v79,
      v46,
      &v77);
    OUTLINED_FUNCTION_34();
    v30();
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v76);
}

unint64_t sub_1A961D728()
{
  unint64_t result = qword_1EB6DAF90;
  if (!qword_1EB6DAF90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB6DAF90);
  }
  return result;
}

unint64_t sub_1A961D774()
{
  unint64_t result = qword_1EB6DB058;
  if (!qword_1EB6DB058)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB6DB058);
  }
  return result;
}

unint64_t sub_1A961D7C0()
{
  unint64_t result = qword_1EB6DAFE0;
  if (!qword_1EB6DAFE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB6DAFE0);
  }
  return result;
}

unint64_t sub_1A961D80C()
{
  unint64_t result = qword_1EB6DB040;
  if (!qword_1EB6DB040)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB6DB040);
  }
  return result;
}

unint64_t sub_1A961D858()
{
  unint64_t result = qword_1EB6DAFF8;
  if (!qword_1EB6DAFF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB6DAFF8);
  }
  return result;
}

unint64_t sub_1A961D8A4()
{
  unint64_t result = qword_1EB6DB028;
  if (!qword_1EB6DB028)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB6DB028);
  }
  return result;
}

unint64_t sub_1A961D8F0()
{
  unint64_t result = qword_1EB6DAFD0;
  if (!qword_1EB6DAFD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB6DAFD0);
  }
  return result;
}

unint64_t sub_1A961D93C()
{
  unint64_t result = qword_1EB6DAFC0;
  if (!qword_1EB6DAFC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB6DAFC0);
  }
  return result;
}

uint64_t sub_1A961D988(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 25705 && a2 == 0xE200000000000000;
  if (v2 || (sub_1A96327D0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    BOOL v6 = a1 == 1634038369 && a2 == 0xE400000000000000;
    if (v6 || (sub_1A96327D0() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else
    {
      BOOL v7 = a1 == 0x644961657261 && a2 == 0xE600000000000000;
      if (v7 || (sub_1A96327D0() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 2;
      }
      else
      {
        BOOL v8 = a1 == 0x656D614E61657261 && a2 == 0xE800000000000000;
        if (v8 || (sub_1A96327D0() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          return 3;
        }
        else
        {
          BOOL v9 = a1 == 0x437972746E756F63 && a2 == 0xEB0000000065646FLL;
          if (v9 || (sub_1A96327D0() & 1) != 0)
          {
            swift_bridgeObjectRelease();
            return 4;
          }
          else
          {
            BOOL v10 = a1 == 0x7470697263736564 && a2 == 0xEB000000006E6F69;
            if (v10 || (sub_1A96327D0() & 1) != 0)
            {
              swift_bridgeObjectRelease();
              return 5;
            }
            else
            {
              BOOL v11 = a1 == 0x6954657269707865 && a2 == 0xEA0000000000656DLL;
              if (v11 || (sub_1A96327D0() & 1) != 0)
              {
                swift_bridgeObjectRelease();
                return 6;
              }
              else
              {
                BOOL v12 = a1 == 0x6954646575737369 && a2 == 0xEA0000000000656DLL;
                if (v12 || (sub_1A96327D0() & 1) != 0)
                {
                  swift_bridgeObjectRelease();
                  return 7;
                }
                else
                {
                  BOOL v13 = a1 == 0x7669746365666665 && a2 == 0xED0000656D695465;
                  if (v13 || (sub_1A96327D0() & 1) != 0)
                  {
                    swift_bridgeObjectRelease();
                    return 8;
                  }
                  else
                  {
                    BOOL v14 = a1 == 0x736E4F746E657665 && a2 == 0xEE00656D69547465;
                    if (v14 || (sub_1A96327D0() & 1) != 0)
                    {
                      swift_bridgeObjectRelease();
                      return 9;
                    }
                    else
                    {
                      BOOL v15 = a1 == 0x646E45746E657665 && a2 == 0xEC000000656D6954;
                      if (v15 || (sub_1A96327D0() & 1) != 0)
                      {
                        swift_bridgeObjectRelease();
                        return 10;
                      }
                      else
                      {
                        BOOL v16 = a1 == 0x55736C6961746564 && a2 == 0xEA00000000006C72;
                        if (v16 || (sub_1A96327D0() & 1) != 0)
                        {
                          swift_bridgeObjectRelease();
                          return 11;
                        }
                        else
                        {
                          BOOL v17 = a1 == 0x746E696174726563 && a2 == 0xE900000000000079;
                          if (v17 || (sub_1A96327D0() & 1) != 0)
                          {
                            swift_bridgeObjectRelease();
                            return 12;
                          }
                          else
                          {
                            BOOL v18 = a1 == 0x6E656D6F6E656870 && a2 == 0xEA00000000006E6FLL;
                            if (v18 || (sub_1A96327D0() & 1) != 0)
                            {
                              swift_bridgeObjectRelease();
                              return 13;
                            }
                            else
                            {
                              BOOL v19 = a1 == 0x65736E6F70736572 && a2 == 0xE900000000000073;
                              if (v19 || (sub_1A96327D0() & 1) != 0)
                              {
                                swift_bridgeObjectRelease();
                                return 14;
                              }
                              else
                              {
                                BOOL v20 = a1 == 0x7974697265766573 && a2 == 0xE800000000000000;
                                if (v20 || (sub_1A96327D0() & 1) != 0)
                                {
                                  swift_bridgeObjectRelease();
                                  return 15;
                                }
                                else
                                {
                                  BOOL v21 = a1 == 0x636966696E676973 && a2 == 0xEC00000065636E61;
                                  if (v21 || (sub_1A96327D0() & 1) != 0)
                                  {
                                    swift_bridgeObjectRelease();
                                    return 16;
                                  }
                                  else
                                  {
                                    BOOL v22 = a1 == 0x656372756F73 && a2 == 0xE600000000000000;
                                    if (v22 || (sub_1A96327D0() & 1) != 0)
                                    {
                                      swift_bridgeObjectRelease();
                                      return 17;
                                    }
                                    else
                                    {
                                      BOOL v23 = a1 == 0x756F53746E657665 && a2 == 0xEB00000000656372;
                                      if (v23 || (sub_1A96327D0() & 1) != 0)
                                      {
                                        swift_bridgeObjectRelease();
                                        return 18;
                                      }
                                      else
                                      {
                                        BOOL v24 = a1 == 0x79636E65677275 && a2 == 0xE700000000000000;
                                        if (v24 || (sub_1A96327D0() & 1) != 0)
                                        {
                                          swift_bridgeObjectRelease();
                                          return 19;
                                        }
                                        else
                                        {
                                          BOOL v25 = a1 == 0x736567617373656DLL && a2 == 0xE800000000000000;
                                          if (v25 || (sub_1A96327D0() & 1) != 0)
                                          {
                                            swift_bridgeObjectRelease();
                                            return 20;
                                          }
                                          else if (a1 == 0x6E6174726F706D69 && a2 == 0xEA00000000006563)
                                          {
                                            swift_bridgeObjectRelease();
                                            return 21;
                                          }
                                          else
                                          {
                                            char v27 = sub_1A96327D0();
                                            swift_bridgeObjectRelease();
                                            if (v27) {
                                              return 21;
                                            }
                                            else {
                                              return 22;
                                            }
                                          }
                                        }
                                      }
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
}

uint64_t sub_1A961E298()
{
  return 22;
}

uint64_t sub_1A961E2A0(char a1)
{
  uint64_t result = 25705;
  switch(a1)
  {
    case 1:
      uint64_t result = 1634038369;
      break;
    case 2:
      uint64_t result = 0x644961657261;
      break;
    case 3:
      uint64_t result = 0x656D614E61657261;
      break;
    case 4:
      uint64_t result = 0x437972746E756F63;
      break;
    case 5:
      uint64_t result = 0x7470697263736564;
      break;
    case 6:
      uint64_t v3 = 0x657269707865;
      goto LABEL_9;
    case 7:
      uint64_t v3 = 0x646575737369;
LABEL_9:
      uint64_t result = v3 & 0xFFFFFFFFFFFFLL | 0x6954000000000000;
      break;
    case 8:
      uint64_t result = 0x7669746365666665;
      break;
    case 9:
      uint64_t result = 0x736E4F746E657665;
      break;
    case 10:
      uint64_t result = 0x646E45746E657665;
      break;
    case 11:
      uint64_t result = 0x55736C6961746564;
      break;
    case 12:
      uint64_t result = 0x746E696174726563;
      break;
    case 13:
      uint64_t result = 0x6E656D6F6E656870;
      break;
    case 14:
      uint64_t result = 0x65736E6F70736572;
      break;
    case 15:
      uint64_t result = 0x7974697265766573;
      break;
    case 16:
      uint64_t result = 0x636966696E676973;
      break;
    case 17:
      uint64_t result = 0x656372756F73;
      break;
    case 18:
      uint64_t result = 0x756F53746E657665;
      break;
    case 19:
      uint64_t result = 0x79636E65677275;
      break;
    case 20:
      uint64_t result = 0x736567617373656DLL;
      break;
    case 21:
      uint64_t result = 0x6E6174726F706D69;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_1A961E574()
{
  return sub_1A961E2A0(*v0);
}

uint64_t sub_1A961E57C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1A961D988(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1A961E5A4@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_1A961E298();
  *a1 = result;
  return result;
}

uint64_t sub_1A961E5CC(uint64_t a1)
{
  unint64_t v2 = sub_1A961D728();
  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1A961E608(uint64_t a1)
{
  unint64_t v2 = sub_1A961D728();
  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t WeatherAlert.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6DB098);
  OUTLINED_FUNCTION_1();
  uint64_t v5 = v4;
  MEMORY[0x1F4188790](v6);
  OUTLINED_FUNCTION_2();
  uint64_t v9 = v8 - v7;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1A961D728();
  sub_1A9632970();
  sub_1A962E850();
  sub_1A961EBE4(&qword_1EB6DAF80, MEMORY[0x1E4F27990]);
  sub_1A9632770();
  if (!v1)
  {
    BOOL v10 = (int *)type metadata accessor for WeatherAlert();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6DB010);
    sub_1A961EB9C(&qword_1EB6DB000);
    OUTLINED_FUNCTION_12_21();
    OUTLINED_FUNCTION_33(v10[6]);
    OUTLINED_FUNCTION_3_45(2);
    OUTLINED_FUNCTION_33(v10[7]);
    OUTLINED_FUNCTION_3_45(3);
    OUTLINED_FUNCTION_33(v10[8]);
    OUTLINED_FUNCTION_3_45(4);
    OUTLINED_FUNCTION_33(v10[9]);
    OUTLINED_FUNCTION_30_8(5);
    sub_1A962E810();
    sub_1A961EBE4(&qword_1EB6DC8D0, MEMORY[0x1E4F27928]);
    OUTLINED_FUNCTION_11_22();
    OUTLINED_FUNCTION_11_22();
    OUTLINED_FUNCTION_11_22();
    OUTLINED_FUNCTION_12_21();
    OUTLINED_FUNCTION_12_21();
    OUTLINED_FUNCTION_33(v10[15]);
    OUTLINED_FUNCTION_3_45(11);
    OUTLINED_FUNCTION_26_8(v10[16]);
    sub_1A961EC2C();
    OUTLINED_FUNCTION_8_25();
    OUTLINED_FUNCTION_33(v10[17]);
    OUTLINED_FUNCTION_3_45(13);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6DB080);
    sub_1A961EDA8(&qword_1EB6DB088, &qword_1EB6DB080, (void (*)(void))sub_1A961EC78);
    sub_1A9632770();
    OUTLINED_FUNCTION_26_8(v10[19]);
    sub_1A961ECC4();
    sub_1A9632770();
    OUTLINED_FUNCTION_26_8(v10[20]);
    sub_1A961ED10();
    OUTLINED_FUNCTION_8_25();
    OUTLINED_FUNCTION_33(v10[21]);
    OUTLINED_FUNCTION_30_8(17);
    OUTLINED_FUNCTION_33(v10[22]);
    OUTLINED_FUNCTION_3_45(18);
    OUTLINED_FUNCTION_26_8(v10[23]);
    sub_1A961ED5C();
    OUTLINED_FUNCTION_8_25();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6DB070);
    sub_1A961EDA8(&qword_1EB6DB078, &qword_1EB6DB070, (void (*)(void))sub_1A961EE20);
    OUTLINED_FUNCTION_12_21();
    OUTLINED_FUNCTION_26_8(v10[25]);
    sub_1A961EE6C();
    OUTLINED_FUNCTION_8_25();
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 8))(v9, v3);
}

uint64_t sub_1A961EB9C(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EB6DB010);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1A961EBE4(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_1A961EC2C()
{
  unint64_t result = qword_1EB6DB048;
  if (!qword_1EB6DB048)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB6DB048);
  }
  return result;
}

unint64_t sub_1A961EC78()
{
  unint64_t result = qword_1EB6DAFD8;
  if (!qword_1EB6DAFD8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB6DAFD8);
  }
  return result;
}

unint64_t sub_1A961ECC4()
{
  unint64_t result = qword_1EB6DB030;
  if (!qword_1EB6DB030)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB6DB030);
  }
  return result;
}

unint64_t sub_1A961ED10()
{
  unint64_t result = qword_1EB6DAFE8;
  if (!qword_1EB6DAFE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB6DAFE8);
  }
  return result;
}

unint64_t sub_1A961ED5C()
{
  unint64_t result = qword_1EB6DB018;
  if (!qword_1EB6DB018)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB6DB018);
  }
  return result;
}

uint64_t sub_1A961EDA8(unint64_t *a1, uint64_t *a2, void (*a3)(void))
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

unint64_t sub_1A961EE20()
{
  unint64_t result = qword_1EB6DAFC8;
  if (!qword_1EB6DAFC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB6DAFC8);
  }
  return result;
}

unint64_t sub_1A961EE6C()
{
  unint64_t result = qword_1EB6DAFB0;
  if (!qword_1EB6DAFB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB6DAFB0);
  }
  return result;
}

uint64_t sub_1A961EEB8@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return WeatherAlert.init(from:)(a1, a2);
}

uint64_t sub_1A961EED0(void *a1)
{
  return WeatherAlert.encode(to:)(a1);
}

char *initializeBufferWithCopyOfBuffer for WeatherAlert(char *a1, char *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v33 = *(void *)a2;
    *(void *)a1 = *(void *)a2;
    a1 = (char *)(v33 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_1A962E850();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = a3[5];
    uint64_t v9 = *(void *)&a2[v8];
    if ((~v9 & 0xF000000000000007) != 0) {
      swift_retain();
    }
    *(void *)&a1[v8] = v9;
    uint64_t v10 = a3[6];
    uint64_t v11 = a3[7];
    BOOL v12 = &a1[v10];
    BOOL v13 = &a2[v10];
    uint64_t v14 = *((void *)v13 + 1);
    *(void *)BOOL v12 = *(void *)v13;
    *((void *)v12 + 1) = v14;
    BOOL v15 = &a1[v11];
    BOOL v16 = &a2[v11];
    uint64_t v17 = *((void *)v16 + 1);
    *(void *)BOOL v15 = *(void *)v16;
    *((void *)v15 + 1) = v17;
    uint64_t v18 = a3[8];
    uint64_t v19 = a3[9];
    BOOL v20 = &a1[v18];
    BOOL v21 = &a2[v18];
    uint64_t v22 = *((void *)v21 + 1);
    *(void *)BOOL v20 = *(void *)v21;
    *((void *)v20 + 1) = v22;
    BOOL v23 = &a1[v19];
    BOOL v24 = &a2[v19];
    uint64_t v25 = *((void *)v24 + 1);
    *(void *)BOOL v23 = *(void *)v24;
    *((void *)v23 + 1) = v25;
    uint64_t v26 = a3[10];
    uint64_t v59 = &a2[v26];
    uint64_t v60 = &a1[v26];
    uint64_t v27 = sub_1A962E810();
    uint64_t v28 = *(void (**)(char *, char *, uint64_t))(*(void *)(v27 - 8) + 16);
    sub_1A9631510();
    sub_1A9631510();
    sub_1A9631510();
    sub_1A9631510();
    v28(v60, v59, v27);
    v28(&a1[a3[11]], &a2[a3[11]], v27);
    v28(&a1[a3[12]], &a2[a3[12]], v27);
    uint64_t v29 = a3[13];
    long long v30 = &a1[v29];
    uint64_t v31 = &a2[v29];
    if (__swift_getEnumTagSinglePayload((uint64_t)&a2[v29], 1, v27))
    {
      uint64_t v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6DE3A0);
      memcpy(v30, v31, *(void *)(*(void *)(v32 - 8) + 64));
    }
    else
    {
      v28(v30, v31, v27);
      __swift_storeEnumTagSinglePayload((uint64_t)v30, 0, 1, v27);
    }
    uint64_t v34 = a3[14];
    uint64_t v35 = &a1[v34];
    uint64_t v36 = &a2[v34];
    if (__swift_getEnumTagSinglePayload((uint64_t)&a2[v34], 1, v27))
    {
      uint64_t v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6DE3A0);
      memcpy(v35, v36, *(void *)(*(void *)(v37 - 8) + 64));
    }
    else
    {
      v28(v35, v36, v27);
      __swift_storeEnumTagSinglePayload((uint64_t)v35, 0, 1, v27);
    }
    uint64_t v38 = a3[15];
    uint64_t v39 = a3[16];
    uint64_t v40 = &a1[v38];
    uint64_t v41 = &a2[v38];
    uint64_t v42 = *((void *)v41 + 1);
    *(void *)uint64_t v40 = *(void *)v41;
    *((void *)v40 + 1) = v42;
    a1[v39] = a2[v39];
    uint64_t v43 = a3[17];
    uint64_t v44 = a3[18];
    uint64_t v45 = &a1[v43];
    uint64_t v46 = &a2[v43];
    uint64_t v47 = *((void *)v46 + 1);
    *(void *)uint64_t v45 = *(void *)v46;
    *((void *)v45 + 1) = v47;
    *(void *)&a1[v44] = *(void *)&a2[v44];
    uint64_t v48 = a3[20];
    a1[a3[19]] = a2[a3[19]];
    a1[v48] = a2[v48];
    uint64_t v49 = a3[21];
    uint64_t v50 = a3[22];
    uint64_t v51 = &a1[v49];
    uint64_t v52 = &a2[v49];
    uint64_t v53 = *((void *)v52 + 1);
    *(void *)uint64_t v51 = *(void *)v52;
    *((void *)v51 + 1) = v53;
    uint64_t v54 = &a1[v50];
    uint64_t v55 = &a2[v50];
    uint64_t v56 = *((void *)v55 + 1);
    *(void *)uint64_t v54 = *(void *)v55;
    *((void *)v54 + 1) = v56;
    uint64_t v57 = a3[24];
    a1[a3[23]] = a2[a3[23]];
    *(void *)&a1[v57] = *(void *)&a2[v57];
    a1[a3[25]] = a2[a3[25]];
    sub_1A9631510();
    sub_1A9631510();
    sub_1A9631510();
    sub_1A9631510();
    sub_1A9631510();
    sub_1A9631510();
  }
  return a1;
}

uint64_t destroy for WeatherAlert(uint64_t a1, int *a2)
{
  uint64_t v4 = sub_1A962E850();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  if ((~*(void *)(a1 + a2[5]) & 0xF000000000000007) != 0) {
    swift_release();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v5 = a1 + a2[10];
  uint64_t v6 = sub_1A962E810();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8);
  v7(v5, v6);
  v7(a1 + a2[11], v6);
  v7(a1 + a2[12], v6);
  uint64_t v8 = a1 + a2[13];
  if (!__swift_getEnumTagSinglePayload(v8, 1, v6)) {
    v7(v8, v6);
  }
  uint64_t v9 = a1 + a2[14];
  if (!__swift_getEnumTagSinglePayload(v9, 1, v6)) {
    v7(v9, v6);
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for WeatherAlert(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_1A962E850();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = *(void *)(a2 + v7);
  if ((~v8 & 0xF000000000000007) != 0) {
    swift_retain();
  }
  *(void *)(a1 + v7) = v8;
  uint64_t v9 = a3[6];
  uint64_t v10 = a3[7];
  uint64_t v11 = (void *)(a1 + v9);
  BOOL v12 = (void *)(a2 + v9);
  uint64_t v13 = v12[1];
  *uint64_t v11 = *v12;
  v11[1] = v13;
  uint64_t v14 = (void *)(a1 + v10);
  BOOL v15 = (void *)(a2 + v10);
  uint64_t v16 = v15[1];
  *uint64_t v14 = *v15;
  v14[1] = v16;
  uint64_t v17 = a3[8];
  uint64_t v18 = a3[9];
  uint64_t v19 = (void *)(a1 + v17);
  BOOL v20 = (void *)(a2 + v17);
  uint64_t v21 = v20[1];
  *uint64_t v19 = *v20;
  v19[1] = v21;
  uint64_t v22 = (void *)(a1 + v18);
  BOOL v23 = (void *)(a2 + v18);
  uint64_t v24 = v23[1];
  *uint64_t v22 = *v23;
  v22[1] = v24;
  uint64_t v25 = a3[10];
  uint64_t v57 = (const void *)(a2 + v25);
  uint64_t v58 = (void *)(a1 + v25);
  uint64_t v26 = sub_1A962E810();
  uint64_t v27 = *(void (**)(void *, const void *, uint64_t))(*(void *)(v26 - 8) + 16);
  sub_1A9631510();
  sub_1A9631510();
  sub_1A9631510();
  sub_1A9631510();
  v27(v58, v57, v26);
  v27((void *)(a1 + a3[11]), (const void *)(a2 + a3[11]), v26);
  v27((void *)(a1 + a3[12]), (const void *)(a2 + a3[12]), v26);
  uint64_t v28 = a3[13];
  uint64_t v29 = (void *)(a1 + v28);
  long long v30 = (const void *)(a2 + v28);
  if (__swift_getEnumTagSinglePayload(a2 + v28, 1, v26))
  {
    uint64_t v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6DE3A0);
    memcpy(v29, v30, *(void *)(*(void *)(v31 - 8) + 64));
  }
  else
  {
    v27(v29, v30, v26);
    __swift_storeEnumTagSinglePayload((uint64_t)v29, 0, 1, v26);
  }
  uint64_t v32 = a3[14];
  uint64_t v33 = (void *)(a1 + v32);
  uint64_t v34 = (const void *)(a2 + v32);
  if (__swift_getEnumTagSinglePayload(a2 + v32, 1, v26))
  {
    uint64_t v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6DE3A0);
    memcpy(v33, v34, *(void *)(*(void *)(v35 - 8) + 64));
  }
  else
  {
    v27(v33, v34, v26);
    __swift_storeEnumTagSinglePayload((uint64_t)v33, 0, 1, v26);
  }
  uint64_t v36 = a3[15];
  uint64_t v37 = a3[16];
  uint64_t v38 = (void *)(a1 + v36);
  uint64_t v39 = (void *)(a2 + v36);
  uint64_t v40 = v39[1];
  *uint64_t v38 = *v39;
  v38[1] = v40;
  *(unsigned char *)(a1 + v37) = *(unsigned char *)(a2 + v37);
  uint64_t v41 = a3[17];
  uint64_t v42 = a3[18];
  uint64_t v43 = (void *)(a1 + v41);
  uint64_t v44 = (void *)(a2 + v41);
  uint64_t v45 = v44[1];
  *uint64_t v43 = *v44;
  v43[1] = v45;
  *(void *)(a1 + v42) = *(void *)(a2 + v42);
  uint64_t v46 = a3[20];
  *(unsigned char *)(a1 + a3[19]) = *(unsigned char *)(a2 + a3[19]);
  *(unsigned char *)(a1 + v46) = *(unsigned char *)(a2 + v46);
  uint64_t v47 = a3[21];
  uint64_t v48 = a3[22];
  uint64_t v49 = (void *)(a1 + v47);
  uint64_t v50 = (void *)(a2 + v47);
  uint64_t v51 = v50[1];
  *uint64_t v49 = *v50;
  v49[1] = v51;
  uint64_t v52 = (void *)(a1 + v48);
  uint64_t v53 = (void *)(a2 + v48);
  uint64_t v54 = v53[1];
  *uint64_t v52 = *v53;
  v52[1] = v54;
  uint64_t v55 = a3[24];
  *(unsigned char *)(a1 + a3[23]) = *(unsigned char *)(a2 + a3[23]);
  *(void *)(a1 + v55) = *(void *)(a2 + v55);
  *(unsigned char *)(a1 + a3[25]) = *(unsigned char *)(a2 + a3[25]);
  sub_1A9631510();
  sub_1A9631510();
  sub_1A9631510();
  sub_1A9631510();
  sub_1A9631510();
  sub_1A9631510();
  return a1;
}

uint64_t assignWithCopy for WeatherAlert(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_1A962E850();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = *(void *)(a2 + v7);
  unint64_t v10 = v9 & 0xF000000000000007;
  if ((~*(void *)(a1 + v7) & 0xF000000000000007) == 0)
  {
    if (v10 != 0xF000000000000007)
    {
      *uint64_t v8 = v9;
      swift_retain();
      goto LABEL_8;
    }
    goto LABEL_6;
  }
  if (v10 == 0xF000000000000007)
  {
    sub_1A944C480(a1 + v7, &qword_1EB6DB010);
    uint64_t v9 = *(void *)(a2 + v7);
LABEL_6:
    *uint64_t v8 = v9;
    goto LABEL_8;
  }
  *uint64_t v8 = v9;
  swift_retain();
  swift_release();
LABEL_8:
  uint64_t v11 = a3[6];
  BOOL v12 = (void *)(a1 + v11);
  uint64_t v13 = (void *)(a2 + v11);
  *BOOL v12 = *v13;
  v12[1] = v13[1];
  sub_1A9631510();
  swift_bridgeObjectRelease();
  uint64_t v14 = a3[7];
  BOOL v15 = (void *)(a1 + v14);
  uint64_t v16 = (void *)(a2 + v14);
  *BOOL v15 = *v16;
  v15[1] = v16[1];
  sub_1A9631510();
  swift_bridgeObjectRelease();
  uint64_t v17 = a3[8];
  uint64_t v18 = (void *)(a1 + v17);
  uint64_t v19 = (void *)(a2 + v17);
  void *v18 = *v19;
  v18[1] = v19[1];
  sub_1A9631510();
  swift_bridgeObjectRelease();
  uint64_t v20 = a3[9];
  uint64_t v21 = (void *)(a1 + v20);
  uint64_t v22 = (void *)(a2 + v20);
  *uint64_t v21 = *v22;
  v21[1] = v22[1];
  sub_1A9631510();
  swift_bridgeObjectRelease();
  uint64_t v23 = a3[10];
  uint64_t v24 = (void *)(a1 + v23);
  uint64_t v25 = (const void *)(a2 + v23);
  uint64_t v26 = sub_1A962E810();
  uint64_t v27 = *(void *)(v26 - 8);
  uint64_t v28 = *(void (**)(void *, const void *, uint64_t))(v27 + 24);
  v28(v24, v25, v26);
  v28((void *)(a1 + a3[11]), (const void *)(a2 + a3[11]), v26);
  v28((void *)(a1 + a3[12]), (const void *)(a2 + a3[12]), v26);
  uint64_t v29 = a3[13];
  long long v30 = (void *)(a1 + v29);
  uint64_t v31 = (const void *)(a2 + v29);
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload(a1 + v29, 1, v26);
  int v33 = __swift_getEnumTagSinglePayload((uint64_t)v31, 1, v26);
  if (EnumTagSinglePayload)
  {
    if (!v33)
    {
      (*(void (**)(void *, const void *, uint64_t))(v27 + 16))(v30, v31, v26);
      __swift_storeEnumTagSinglePayload((uint64_t)v30, 0, 1, v26);
      goto LABEL_14;
    }
    goto LABEL_13;
  }
  if (v33)
  {
    (*(void (**)(void *, uint64_t))(v27 + 8))(v30, v26);
LABEL_13:
    uint64_t v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6DE3A0);
    memcpy(v30, v31, *(void *)(*(void *)(v34 - 8) + 64));
    goto LABEL_14;
  }
  v28(v30, v31, v26);
LABEL_14:
  uint64_t v35 = a3[14];
  uint64_t v36 = (void *)(a1 + v35);
  uint64_t v37 = (const void *)(a2 + v35);
  int v38 = __swift_getEnumTagSinglePayload(a1 + v35, 1, v26);
  int v39 = __swift_getEnumTagSinglePayload((uint64_t)v37, 1, v26);
  if (!v38)
  {
    if (!v39)
    {
      v28(v36, v37, v26);
      goto LABEL_20;
    }
    (*(void (**)(void *, uint64_t))(v27 + 8))(v36, v26);
    goto LABEL_19;
  }
  if (v39)
  {
LABEL_19:
    uint64_t v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6DE3A0);
    memcpy(v36, v37, *(void *)(*(void *)(v40 - 8) + 64));
    goto LABEL_20;
  }
  (*(void (**)(void *, const void *, uint64_t))(v27 + 16))(v36, v37, v26);
  __swift_storeEnumTagSinglePayload((uint64_t)v36, 0, 1, v26);
LABEL_20:
  uint64_t v41 = a3[15];
  uint64_t v42 = (void *)(a1 + v41);
  uint64_t v43 = (void *)(a2 + v41);
  *uint64_t v42 = *v43;
  v42[1] = v43[1];
  sub_1A9631510();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + a3[16]) = *(unsigned char *)(a2 + a3[16]);
  uint64_t v44 = a3[17];
  uint64_t v45 = (void *)(a1 + v44);
  uint64_t v46 = (void *)(a2 + v44);
  *uint64_t v45 = *v46;
  v45[1] = v46[1];
  sub_1A9631510();
  swift_bridgeObjectRelease();
  *(void *)(a1 + a3[18]) = *(void *)(a2 + a3[18]);
  sub_1A9631510();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + a3[19]) = *(unsigned char *)(a2 + a3[19]);
  *(unsigned char *)(a1 + a3[20]) = *(unsigned char *)(a2 + a3[20]);
  uint64_t v47 = a3[21];
  uint64_t v48 = (void *)(a1 + v47);
  uint64_t v49 = (void *)(a2 + v47);
  *uint64_t v48 = *v49;
  v48[1] = v49[1];
  sub_1A9631510();
  swift_bridgeObjectRelease();
  uint64_t v50 = a3[22];
  uint64_t v51 = (void *)(a1 + v50);
  uint64_t v52 = (void *)(a2 + v50);
  *uint64_t v51 = *v52;
  v51[1] = v52[1];
  sub_1A9631510();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + a3[23]) = *(unsigned char *)(a2 + a3[23]);
  *(void *)(a1 + a3[24]) = *(void *)(a2 + a3[24]);
  sub_1A9631510();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + a3[25]) = *(unsigned char *)(a2 + a3[25]);
  return a1;
}

uint64_t initializeWithTake for WeatherAlert(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_1A962E850();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(void *)(a1 + a3[5]) = *(void *)(a2 + a3[5]);
  *(_OWORD *)(a1 + v7) = *(_OWORD *)(a2 + v7);
  uint64_t v8 = a3[8];
  *(_OWORD *)(a1 + a3[7]) = *(_OWORD *)(a2 + a3[7]);
  *(_OWORD *)(a1 + v8) = *(_OWORD *)(a2 + v8);
  uint64_t v9 = a3[10];
  *(_OWORD *)(a1 + a3[9]) = *(_OWORD *)(a2 + a3[9]);
  unint64_t v10 = (void *)(a1 + v9);
  uint64_t v11 = (const void *)(a2 + v9);
  uint64_t v12 = sub_1A962E810();
  uint64_t v13 = *(void (**)(void *, const void *, uint64_t))(*(void *)(v12 - 8) + 32);
  v13(v10, v11, v12);
  v13((void *)(a1 + a3[11]), (const void *)(a2 + a3[11]), v12);
  v13((void *)(a1 + a3[12]), (const void *)(a2 + a3[12]), v12);
  uint64_t v14 = a3[13];
  BOOL v15 = (void *)(a1 + v14);
  uint64_t v16 = (const void *)(a2 + v14);
  if (__swift_getEnumTagSinglePayload(a2 + v14, 1, v12))
  {
    uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6DE3A0);
    memcpy(v15, v16, *(void *)(*(void *)(v17 - 8) + 64));
  }
  else
  {
    v13(v15, v16, v12);
    __swift_storeEnumTagSinglePayload((uint64_t)v15, 0, 1, v12);
  }
  uint64_t v18 = a3[14];
  uint64_t v19 = (void *)(a1 + v18);
  uint64_t v20 = (const void *)(a2 + v18);
  if (__swift_getEnumTagSinglePayload(a2 + v18, 1, v12))
  {
    uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6DE3A0);
    memcpy(v19, v20, *(void *)(*(void *)(v21 - 8) + 64));
  }
  else
  {
    v13(v19, v20, v12);
    __swift_storeEnumTagSinglePayload((uint64_t)v19, 0, 1, v12);
  }
  uint64_t v22 = a3[16];
  *(_OWORD *)(a1 + a3[15]) = *(_OWORD *)(a2 + a3[15]);
  *(unsigned char *)(a1 + v22) = *(unsigned char *)(a2 + v22);
  uint64_t v23 = a3[18];
  *(_OWORD *)(a1 + a3[17]) = *(_OWORD *)(a2 + a3[17]);
  *(void *)(a1 + v23) = *(void *)(a2 + v23);
  uint64_t v24 = a3[20];
  *(unsigned char *)(a1 + a3[19]) = *(unsigned char *)(a2 + a3[19]);
  *(unsigned char *)(a1 + v24) = *(unsigned char *)(a2 + v24);
  uint64_t v25 = a3[22];
  *(_OWORD *)(a1 + a3[21]) = *(_OWORD *)(a2 + a3[21]);
  *(_OWORD *)(a1 + v25) = *(_OWORD *)(a2 + v25);
  uint64_t v26 = a3[24];
  *(unsigned char *)(a1 + a3[23]) = *(unsigned char *)(a2 + a3[23]);
  *(void *)(a1 + v26) = *(void *)(a2 + v26);
  *(unsigned char *)(a1 + a3[25]) = *(unsigned char *)(a2 + a3[25]);
  return a1;
}

uint64_t assignWithTake for WeatherAlert(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_1A962E850();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = *(void *)(a2 + v7);
  if ((~*(void *)(a1 + v7) & 0xF000000000000007) != 0)
  {
    if ((~v9 & 0xF000000000000007) != 0)
    {
      *uint64_t v8 = v9;
      swift_release();
    }
    else
    {
      sub_1A944C480(a1 + v7, &qword_1EB6DB010);
      *uint64_t v8 = *(void *)(a2 + v7);
    }
  }
  else
  {
    *uint64_t v8 = v9;
  }
  uint64_t v10 = a3[6];
  uint64_t v11 = (void *)(a1 + v10);
  uint64_t v12 = (uint64_t *)(a2 + v10);
  uint64_t v14 = *v12;
  uint64_t v13 = v12[1];
  *uint64_t v11 = v14;
  v11[1] = v13;
  swift_bridgeObjectRelease();
  uint64_t v15 = a3[7];
  uint64_t v16 = (void *)(a1 + v15);
  uint64_t v17 = (uint64_t *)(a2 + v15);
  uint64_t v19 = *v17;
  uint64_t v18 = v17[1];
  void *v16 = v19;
  v16[1] = v18;
  swift_bridgeObjectRelease();
  uint64_t v20 = a3[8];
  uint64_t v21 = (void *)(a1 + v20);
  uint64_t v22 = (uint64_t *)(a2 + v20);
  uint64_t v24 = *v22;
  uint64_t v23 = v22[1];
  *uint64_t v21 = v24;
  v21[1] = v23;
  swift_bridgeObjectRelease();
  uint64_t v25 = a3[9];
  uint64_t v26 = (void *)(a1 + v25);
  uint64_t v27 = (uint64_t *)(a2 + v25);
  uint64_t v29 = *v27;
  uint64_t v28 = v27[1];
  *uint64_t v26 = v29;
  v26[1] = v28;
  swift_bridgeObjectRelease();
  uint64_t v30 = a3[10];
  uint64_t v31 = (void *)(a1 + v30);
  uint64_t v32 = (const void *)(a2 + v30);
  uint64_t v33 = sub_1A962E810();
  uint64_t v34 = *(void *)(v33 - 8);
  uint64_t v35 = *(void (**)(void *, const void *, uint64_t))(v34 + 40);
  v35(v31, v32, v33);
  v35((void *)(a1 + a3[11]), (const void *)(a2 + a3[11]), v33);
  v35((void *)(a1 + a3[12]), (const void *)(a2 + a3[12]), v33);
  uint64_t v36 = a3[13];
  uint64_t v37 = (void *)(a1 + v36);
  int v38 = (const void *)(a2 + v36);
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload(a1 + v36, 1, v33);
  int v40 = __swift_getEnumTagSinglePayload((uint64_t)v38, 1, v33);
  if (EnumTagSinglePayload)
  {
    if (!v40)
    {
      (*(void (**)(void *, const void *, uint64_t))(v34 + 32))(v37, v38, v33);
      __swift_storeEnumTagSinglePayload((uint64_t)v37, 0, 1, v33);
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  if (v40)
  {
    (*(void (**)(void *, uint64_t))(v34 + 8))(v37, v33);
LABEL_11:
    uint64_t v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6DE3A0);
    memcpy(v37, v38, *(void *)(*(void *)(v41 - 8) + 64));
    goto LABEL_12;
  }
  v35(v37, v38, v33);
LABEL_12:
  uint64_t v42 = a3[14];
  uint64_t v43 = (void *)(a1 + v42);
  uint64_t v44 = (const void *)(a2 + v42);
  int v45 = __swift_getEnumTagSinglePayload(a1 + v42, 1, v33);
  int v46 = __swift_getEnumTagSinglePayload((uint64_t)v44, 1, v33);
  if (!v45)
  {
    if (!v46)
    {
      v35(v43, v44, v33);
      goto LABEL_18;
    }
    (*(void (**)(void *, uint64_t))(v34 + 8))(v43, v33);
    goto LABEL_17;
  }
  if (v46)
  {
LABEL_17:
    uint64_t v47 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6DE3A0);
    memcpy(v43, v44, *(void *)(*(void *)(v47 - 8) + 64));
    goto LABEL_18;
  }
  (*(void (**)(void *, const void *, uint64_t))(v34 + 32))(v43, v44, v33);
  __swift_storeEnumTagSinglePayload((uint64_t)v43, 0, 1, v33);
LABEL_18:
  uint64_t v48 = a3[15];
  uint64_t v49 = (void *)(a1 + v48);
  uint64_t v50 = (uint64_t *)(a2 + v48);
  uint64_t v52 = *v50;
  uint64_t v51 = v50[1];
  *uint64_t v49 = v52;
  v49[1] = v51;
  swift_bridgeObjectRelease();
  uint64_t v53 = a3[17];
  *(unsigned char *)(a1 + a3[16]) = *(unsigned char *)(a2 + a3[16]);
  uint64_t v54 = (void *)(a1 + v53);
  uint64_t v55 = (uint64_t *)(a2 + v53);
  uint64_t v57 = *v55;
  uint64_t v56 = v55[1];
  void *v54 = v57;
  v54[1] = v56;
  swift_bridgeObjectRelease();
  *(void *)(a1 + a3[18]) = *(void *)(a2 + a3[18]);
  swift_bridgeObjectRelease();
  uint64_t v58 = a3[20];
  *(unsigned char *)(a1 + a3[19]) = *(unsigned char *)(a2 + a3[19]);
  *(unsigned char *)(a1 + v58) = *(unsigned char *)(a2 + v58);
  uint64_t v59 = a3[21];
  uint64_t v60 = (void *)(a1 + v59);
  uint64_t v61 = (uint64_t *)(a2 + v59);
  uint64_t v63 = *v61;
  uint64_t v62 = v61[1];
  *uint64_t v60 = v63;
  v60[1] = v62;
  swift_bridgeObjectRelease();
  uint64_t v64 = a3[22];
  char v65 = (void *)(a1 + v64);
  uint64_t v66 = (uint64_t *)(a2 + v64);
  uint64_t v68 = *v66;
  uint64_t v67 = v66[1];
  *char v65 = v68;
  v65[1] = v67;
  swift_bridgeObjectRelease();
  uint64_t v69 = a3[24];
  *(unsigned char *)(a1 + a3[23]) = *(unsigned char *)(a2 + a3[23]);
  *(void *)(a1 + v69) = *(void *)(a2 + v69);
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + a3[25]) = *(unsigned char *)(a2 + a3[25]);
  return a1;
}

uint64_t getEnumTagSinglePayload for WeatherAlert(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1A96203F4);
}

uint64_t sub_1A96203F4(uint64_t a1, uint64_t a2, int *a3)
{
  sub_1A962E850();
  OUTLINED_FUNCTION_0();
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = a1;
LABEL_11:
    return __swift_getEnumTagSinglePayload(v9, a2, v8);
  }
  if (a2 != 0x7FFFFFFF)
  {
    sub_1A962E810();
    OUTLINED_FUNCTION_0();
    if (*(_DWORD *)(v13 + 84) == a2)
    {
      uint64_t v8 = v12;
      uint64_t v14 = a3[10];
    }
    else
    {
      uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6DE3A0);
      uint64_t v14 = a3[13];
    }
    uint64_t v9 = a1 + v14;
    goto LABEL_11;
  }
  unint64_t v10 = *(void *)(a1 + a3[9] + 8);
  if (v10 >= 0xFFFFFFFF) {
    LODWORD(v10) = -1;
  }
  return (v10 + 1);
}

uint64_t storeEnumTagSinglePayload for WeatherAlert(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1A96204E4);
}

void sub_1A96204E4(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  sub_1A962E850();
  OUTLINED_FUNCTION_0();
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = a1;
  }
  else
  {
    if (a3 == 0x7FFFFFFF)
    {
      *(void *)(a1 + a4[9] + 8) = (a2 - 1);
      return;
    }
    sub_1A962E810();
    OUTLINED_FUNCTION_0();
    if (*(_DWORD *)(v13 + 84) == a3)
    {
      uint64_t v10 = v12;
      uint64_t v14 = a4[10];
    }
    else
    {
      uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6DE3A0);
      uint64_t v14 = a4[13];
    }
    uint64_t v11 = a1 + v14;
  }
  __swift_storeEnumTagSinglePayload(v11, a2, a2, v10);
}

void sub_1A96205BC()
{
  sub_1A962E850();
  if (v0 <= 0x3F)
  {
    sub_1A962E810();
    if (v1 <= 0x3F)
    {
      sub_1A947025C();
      if (v2 <= 0x3F) {
        swift_initStructMetadata();
      }
    }
  }
}

uint64_t getEnumTagSinglePayload for WeatherAlert.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xEB)
  {
    if (a2 + 21 >= 0xFFFF00) {
      int v2 = 4;
    }
    else {
      int v2 = 2;
    }
    if ((a2 + 21) >> 8 < 0xFF) {
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
    int v5 = (*a1 | (v4 << 8)) - 22;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0x16;
  int v5 = v6 - 22;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for WeatherAlert.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 21 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 21) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xEB) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xEA)
  {
    unsigned int v6 = ((a2 - 235) >> 8) + 1;
    *unint64_t result = a2 + 21;
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
        JUMPOUT(0x1A9620884);
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
          *unint64_t result = a2 + 21;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for WeatherAlert.CodingKeys()
{
  return &type metadata for WeatherAlert.CodingKeys;
}

unint64_t sub_1A96208C0()
{
  unint64_t result = qword_1E97ED2D8;
  if (!qword_1E97ED2D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97ED2D8);
  }
  return result;
}

unint64_t sub_1A9620910()
{
  unint64_t result = qword_1EB6DAFA0;
  if (!qword_1EB6DAFA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB6DAFA0);
  }
  return result;
}

unint64_t sub_1A9620960()
{
  unint64_t result = qword_1EB6DAF98;
  if (!qword_1EB6DAF98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB6DAF98);
  }
  return result;
}

void sub_1A96209B0(void (*a1)(uint64_t *__return_ptr, int *), uint64_t a2, unint64_t a3)
{
  int v4 = a3;
  unint64_t v5 = HIDWORD(a3);
  if (a3 != HIDWORD(a3))
  {
    if (SHIDWORD(a3) >= (int)a3)
    {
      uint64_t v6 = MEMORY[0x1E4FBC860];
      while (v4 < (int)v5)
      {
        int v17 = v4;
        a1(&v15, &v17);
        if (v3)
        {
          swift_bridgeObjectRelease();
          return;
        }
        uint64_t v7 = v16;
        if (v16)
        {
          char v8 = v15;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          {
            sub_1A9481A88(0, *(void *)(v6 + 16) + 1, 1, v6);
            uint64_t v6 = v12;
          }
          unint64_t v10 = *(void *)(v6 + 16);
          unint64_t v9 = *(void *)(v6 + 24);
          if (v10 >= v9 >> 1)
          {
            sub_1A9481A88(v9 > 1, v10 + 1, 1, v6);
            uint64_t v6 = v13;
          }
          *(void *)(v6 + 16) = v10 + 1;
          uint64_t v11 = v6 + 16 * v10;
          *(unsigned char *)(v11 + 32) = v8;
          *(void *)(v11 + 40) = v7;
        }
        if (v5 == ++v4) {
          return;
        }
      }
      __break(1u);
    }
    __break(1u);
  }
}

void sub_1A9620AF8(void (*a1)(uint64_t *__return_ptr, int *), uint64_t a2, unint64_t a3)
{
  int v4 = a3;
  unint64_t v5 = HIDWORD(a3);
  if (a3 != HIDWORD(a3))
  {
    if (SHIDWORD(a3) >= (int)a3)
    {
      uint64_t v6 = MEMORY[0x1E4FBC860];
      while (v4 < (int)v5)
      {
        int v17 = v4;
        a1(&v15, &v17);
        if (v3)
        {
          swift_bridgeObjectRelease();
          return;
        }
        uint64_t v7 = v15;
        if (v15)
        {
          char v8 = v16;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          {
            sub_1A9481BEC(0, *(void *)(v6 + 16) + 1, 1, v6);
            uint64_t v6 = v12;
          }
          unint64_t v10 = *(void *)(v6 + 16);
          unint64_t v9 = *(void *)(v6 + 24);
          if (v10 >= v9 >> 1)
          {
            sub_1A9481BEC(v9 > 1, v10 + 1, 1, v6);
            uint64_t v6 = v13;
          }
          *(void *)(v6 + 16) = v10 + 1;
          uint64_t v11 = v6 + 16 * v10;
          *(void *)(v11 + 32) = v7;
          *(unsigned char *)(v11 + 40) = v8;
        }
        if (v5 == ++v4) {
          return;
        }
      }
      __break(1u);
    }
    __break(1u);
  }
}

void sub_1A9620C40()
{
}

void sub_1A9620C9C()
{
}

void sub_1A9620CF8()
{
  OUTLINED_FUNCTION_3();
  uint64_t v3 = v2;
  uint64_t v43 = v5;
  uint64_t v44 = v4;
  uint64_t v7 = v6;
  uint64_t v9 = v8;
  int v40 = v10;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(v10);
  uint64_t v12 = OUTLINED_FUNCTION_2_0(v11);
  MEMORY[0x1F4188790](v12);
  uint64_t v13 = OUTLINED_FUNCTION_568();
  uint64_t v42 = v7(v13);
  OUTLINED_FUNCTION_1();
  uint64_t v39 = v14;
  MEMORY[0x1F4188790](v15);
  OUTLINED_FUNCTION_16();
  uint64_t v41 = v16;
  OUTLINED_FUNCTION_2_4();
  MEMORY[0x1F4188790](v17);
  OUTLINED_FUNCTION_61_2(v18, v19, v20, v21, v22, v23, v24, v25, v36);
  uint64_t v26 = *(void *)(v9 + 16);
  if (v26)
  {
    uint64_t v37 = v3;
    sub_1A9631510();
    uint64_t v27 = (uint64_t *)(v9 + 64);
    uint64_t v45 = MEMORY[0x1E4FBC860];
    while (1)
    {
      uint64_t v28 = *(v27 - 3);
      uint64_t v29 = *(v27 - 2);
      uint64_t v30 = *(v27 - 1);
      uint64_t v31 = *v27;
      v46[0] = *(v27 - 4);
      v46[1] = v28;
      v46[2] = v29;
      v46[3] = v30;
      v46[4] = v31;
      swift_retain();
      swift_retain();
      swift_retain();
      swift_retain();
      swift_retain();
      v44(v46);
      if (v1) {
        break;
      }
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      uint64_t v32 = OUTLINED_FUNCTION_34_6();
      if (__swift_getEnumTagSinglePayload(v32, v33, v42) == 1)
      {
        sub_1A94179C4(v0, v40);
      }
      else
      {
        sub_1A9417740(v0, v38, v43);
        sub_1A9417740(v38, v41, v43);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v45 = ((uint64_t (*)(void, uint64_t, uint64_t))v37)(0, *(void *)(v45 + 16) + 1, 1);
        }
        unint64_t v35 = *(void *)(v45 + 16);
        unint64_t v34 = *(void *)(v45 + 24);
        if (v35 >= v34 >> 1) {
          uint64_t v45 = v37(v34 > 1, v35 + 1, 1, v45);
        }
        *(void *)(v45 + 16) = v35 + 1;
        sub_1A9417740(v41, v45+ ((*(unsigned __int8 *)(v39 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v39 + 80))+ *(void *)(v39 + 72) * v35, v43);
      }
      v27 += 5;
      if (!--v26)
      {
        swift_bridgeObjectRelease();
        goto LABEL_15;
      }
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
  }
LABEL_15:
  OUTLINED_FUNCTION_4_0();
}

void sub_1A9620FEC(void (*a1)(uint64_t *__return_ptr, char *), uint64_t a2, unint64_t a3)
{
  int v4 = a3;
  unint64_t v5 = HIDWORD(a3);
  if (a3 != HIDWORD(a3))
  {
    if (SHIDWORD(a3) >= (int)a3)
    {
      uint64_t v7 = MEMORY[0x1E4FBC860];
      while (v4 < (int)v5)
      {
        *(_DWORD *)((char *)&v12 + 1) = v4;
        a1(&v12, (char *)&v12 + 1);
        if (v3)
        {
          swift_bridgeObjectRelease();
          return;
        }
        char v8 = v12;
        if (v12 != 9)
        {
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          {
            sub_1A94820CC();
            uint64_t v7 = v10;
          }
          unint64_t v9 = *(void *)(v7 + 16);
          if (v9 >= *(void *)(v7 + 24) >> 1)
          {
            sub_1A94820CC();
            uint64_t v7 = v11;
          }
          *(void *)(v7 + 16) = v9 + 1;
          *(unsigned char *)(v7 + v9 + 32) = v8;
        }
        if (v5 == ++v4) {
          return;
        }
      }
      __break(1u);
    }
    __break(1u);
  }
}

void sub_1A9621124(void (*a1)(uint64_t *__return_ptr, int *), uint64_t a2, unint64_t a3)
{
  int v4 = a3;
  unint64_t v5 = HIDWORD(a3);
  if (a3 != HIDWORD(a3))
  {
    if (SHIDWORD(a3) >= (int)a3)
    {
      uint64_t v7 = MEMORY[0x1E4FBC860];
      while (v4 < (int)v5)
      {
        int v23 = v4;
        a1(&v18, &v23);
        if (v3)
        {
          swift_bridgeObjectRelease();
          return;
        }
        if ((void)v19)
        {
          long long v17 = v19;
          uint64_t v8 = v18;
          long long v15 = v21;
          long long v16 = v20;
          long long v14 = v22;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          {
            sub_1A9482184();
            uint64_t v7 = v12;
          }
          unint64_t v9 = *(void *)(v7 + 16);
          long long v10 = v17;
          if (v9 >= *(void *)(v7 + 24) >> 1)
          {
            sub_1A9482184();
            long long v10 = v17;
            uint64_t v7 = v13;
          }
          *(void *)(v7 + 16) = v9 + 1;
          uint64_t v11 = v7 + 72 * v9;
          *(void *)(v11 + 32) = v8;
          *(_OWORD *)(v11 + 40) = v10;
          *(_OWORD *)(v11 + 56) = v16;
          *(_OWORD *)(v11 + 72) = v15;
          *(_OWORD *)(v11 + 88) = v14;
        }
        if (v5 == ++v4) {
          return;
        }
      }
      __break(1u);
    }
    __break(1u);
  }
}

void sub_1A96212A8(void (*a1)(uint64_t *__return_ptr, int *), uint64_t a2, unint64_t a3)
{
  int v4 = a3;
  unint64_t v5 = HIDWORD(a3);
  if (a3 != HIDWORD(a3))
  {
    if (SHIDWORD(a3) >= (int)a3)
    {
      uint64_t v6 = MEMORY[0x1E4FBC860];
      while (v4 < (int)v5)
      {
        int v17 = v4;
        a1(&v15, &v17);
        if (v3)
        {
          swift_bridgeObjectRelease();
          return;
        }
        uint64_t v7 = v16;
        if (v16)
        {
          uint64_t v8 = v15;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          {
            sub_1A9481944(0, *(void *)(v6 + 16) + 1, 1, v6);
            uint64_t v6 = v12;
          }
          unint64_t v10 = *(void *)(v6 + 16);
          unint64_t v9 = *(void *)(v6 + 24);
          if (v10 >= v9 >> 1)
          {
            sub_1A9481944(v9 > 1, v10 + 1, 1, v6);
            uint64_t v6 = v13;
          }
          *(void *)(v6 + 16) = v10 + 1;
          uint64_t v11 = v6 + 16 * v10;
          *(void *)(v11 + 32) = v8;
          *(void *)(v11 + 40) = v7;
        }
        if (v5 == ++v4) {
          return;
        }
      }
      __break(1u);
    }
    __break(1u);
  }
}

uint64_t sub_1A96213EC(void (*a1)(void), uint64_t a2, unint64_t a3)
{
  int v4 = a3;
  uint64_t v7 = (void (*)(char *, char *, uint64_t))HIDWORD(a3);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6DD370);
  MEMORY[0x1F4188790](v8 - 8);
  unint64_t v10 = (char *)&v22 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_1A962E850();
  uint64_t v28 = *(void *)(v11 - 8);
  uint64_t v12 = MEMORY[0x1F4188790](v11);
  long long v14 = (char *)&v22 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = MEMORY[0x1F4188790](v12);
  uint64_t v27 = (char *)&v22 - v16;
  if (v4 == v7)
  {
    return MEMORY[0x1E4FBC860];
  }
  else
  {
    if ((int)v7 >= v4)
    {
      uint64_t v29 = (void (**)(char *, char *, uint64_t))(v28 + 32);
      uint64_t v17 = MEMORY[0x1E4FBC860];
      uint64_t v25 = a2;
      uint64_t v26 = a1;
      int v23 = v7;
      uint64_t v24 = v14;
      while (v4 < (int)v7)
      {
        int v30 = v4;
        a1(&v30);
        if (v3)
        {
          swift_bridgeObjectRelease();
          return v17;
        }
        if (__swift_getEnumTagSinglePayload((uint64_t)v10, 1, v11) == 1)
        {
          uint64_t result = sub_1A94179C4((uint64_t)v10, &qword_1EB6DD370);
        }
        else
        {
          uint64_t v7 = *v29;
          uint64_t v18 = v27;
          (*v29)(v27, v10, v11);
          v7(v14, v18, v11);
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            uint64_t v17 = sub_1A9482228(0, *(void *)(v17 + 16) + 1, 1, v17);
          }
          unint64_t v20 = *(void *)(v17 + 16);
          unint64_t v19 = *(void *)(v17 + 24);
          if (v20 >= v19 >> 1) {
            uint64_t v17 = sub_1A9482228(v19 > 1, v20 + 1, 1, v17);
          }
          *(void *)(v17 + 16) = v20 + 1;
          unint64_t v21 = v17
              + ((*(unsigned __int8 *)(v28 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v28 + 80))
              + *(void *)(v28 + 72) * v20;
          long long v14 = v24;
          uint64_t result = ((uint64_t (*)(unint64_t, char *, uint64_t))v7)(v21, v24, v11);
          a1 = v26;
          LODWORD(v7) = v23;
        }
        if (v7 == ++v4) {
          return v17;
        }
      }
      __break(1u);
    }
    __break(1u);
  }
  return result;
}

uint64_t sub_1A96216B8@<X0>(void (*a1)(char *)@<X0>, uint64_t a2@<X8>)
{
  uint64_t v16 = a1;
  uint64_t v5 = sub_1A9630DC0();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  uint64_t v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E97ED2E8);
  MEMORY[0x1F4188790](v9 - 8);
  uint64_t v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A9417B8C(v2, (uint64_t)v11, &qword_1E97ED2E8);
  uint64_t v12 = 1;
  if (__swift_getEnumTagSinglePayload((uint64_t)v11, 1, v5) != 1)
  {
    (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v8, v11, v5);
    v16(v8);
    if (v3) {
      return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    }
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    uint64_t v12 = 0;
  }
  uint64_t v14 = type metadata accessor for WeatherComparison();
  return __swift_storeEnumTagSinglePayload(a2, v12, 1, v14);
}

uint64_t sub_1A9621898@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  uint64_t v4 = sub_1A9630B70();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = (char *)v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E97ED300);
  MEMORY[0x1F4188790](v8 - 8);
  uint64_t v10 = (char *)v12 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A9417B8C(a1, (uint64_t)v10, &qword_1E97ED300);
  if (__swift_getEnumTagSinglePayload((uint64_t)v10, 1, v4) == 1)
  {
    uint64_t result = swift_release();
    *a2 = 9;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v7, v10, v4);
    sub_1A9625264((uint64_t)v7, a2);
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    return swift_release();
  }
  return result;
}

uint64_t sub_1A9621A38@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_1A9630510();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = (char *)v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E97ED328);
  MEMORY[0x1F4188790](v8 - 8);
  uint64_t v10 = (char *)v12 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A9417B8C(a1, (uint64_t)v10, &qword_1E97ED328);
  if (__swift_getEnumTagSinglePayload((uint64_t)v10, 1, v4) == 1)
  {
    uint64_t result = swift_release();
    *(void *)a2 = 0;
    *(unsigned char *)(a2 + 8) = 0;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v7, v10, v4);
    sub_1A9626888((uint64_t)v7, a2);
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    return swift_release();
  }
  return result;
}

uint64_t sub_1A9621BD8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_1A962FD80();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = (char *)v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E97ED330);
  MEMORY[0x1F4188790](v8 - 8);
  uint64_t v10 = (char *)v12 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A9417B8C(a1, (uint64_t)v10, &qword_1E97ED330);
  if (__swift_getEnumTagSinglePayload((uint64_t)v10, 1, v4) == 1)
  {
    uint64_t result = swift_release();
    *(void *)(a2 + 64) = 0;
    *(_OWORD *)(a2 + 32) = 0u;
    *(_OWORD *)(a2 + 48) = 0u;
    *(_OWORD *)a2 = 0u;
    *(_OWORD *)(a2 + 16) = 0u;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v7, v10, v4);
    sub_1A9626D4C((uint64_t)v7, (uint64_t *)a2);
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    return swift_release();
  }
  return result;
}

uint64_t sub_1A9621D80()
{
  unint64_t v0 = sub_1A9632580();
  swift_bridgeObjectRelease();
  if (v0 >= 6) {
    return 6;
  }
  else {
    return v0;
  }
}

uint64_t sub_1A9621DCC()
{
  uint64_t v0 = sub_1A9632580();
  swift_bridgeObjectRelease();
  if (v0 == 1) {
    unsigned int v1 = 1;
  }
  else {
    unsigned int v1 = 2;
  }
  if (v0) {
    return v1;
  }
  else {
    return 0;
  }
}

void sub_1A9621E6C()
{
  OUTLINED_FUNCTION_6_10();
  OUTLINED_FUNCTION_20_10();
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6DB138);
  uint64_t v6 = OUTLINED_FUNCTION_2_0(v5);
  MEMORY[0x1F4188790](v6);
  uint64_t v7 = OUTLINED_FUNCTION_64_0();
  uint64_t v8 = OUTLINED_FUNCTION_2_0(v7);
  MEMORY[0x1F4188790](v8);
  OUTLINED_FUNCTION_6_0();
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E97ED2E0);
  uint64_t v10 = OUTLINED_FUNCTION_2_0(v9);
  MEMORY[0x1F4188790](v10);
  OUTLINED_FUNCTION_28_1();
  uint64_t v11 = sub_1A9630C70();
  OUTLINED_FUNCTION_1();
  MEMORY[0x1F4188790](v12);
  OUTLINED_FUNCTION_4_36();
  OUTLINED_FUNCTION_478(v4, 1, v11);
  if (v13)
  {
    sub_1A94179C4(v4, &qword_1E97ED2E0);
    type metadata accessor for PeriodicForecasts();
    uint64_t v14 = OUTLINED_FUNCTION_5_7();
LABEL_7:
    __swift_storeEnumTagSinglePayload(v14, v15, v16, v17);
    OUTLINED_FUNCTION_7_1();
    return;
  }
  OUTLINED_FUNCTION_29();
  uint64_t v19 = v18();
  MEMORY[0x1AD0F4D10](v19);
  sub_1A962FF50();
  OUTLINED_FUNCTION_5_42(v2);
  if (!v13)
  {
    sub_1A943EE70();
    OUTLINED_FUNCTION_4_8();
    OUTLINED_FUNCTION_34();
    uint64_t v21 = v20();
    uint64_t v22 = MEMORY[0x1AD0F4D00](v21);
    if ((v22 & 0x80000000) == 0)
    {
      MEMORY[0x1F4188790](v22);
      OUTLINED_FUNCTION_51_5();
      *(void *)(v23 - 16) = v3;
      *(void *)(v23 - 8) = v1;
      sub_1A96209B0((void (*)(uint64_t *__return_ptr, int *))sub_1A96277F4, v25, v24 << 32);
      uint64_t v27 = v26;
      OUTLINED_FUNCTION_49_5(v26, v28, (void (*)(void))type metadata accessor for Metadata);
      *(void *)(v0 + *(int *)(type metadata accessor for PeriodicForecasts() + 20)) = v27;
      OUTLINED_FUNCTION_23_10();
      v29();
      uint64_t v14 = OUTLINED_FUNCTION_2_9();
      goto LABEL_7;
    }
    __break(1u);
  }
  __break(1u);
}

void sub_1A96220C0(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = MEMORY[0x1AD0F5040]();
  if ((v4 & 0x80000000) != 0)
  {
    __break(1u);
  }
  else
  {
    uint64_t v5 = MEMORY[0x1F4188790](v4);
    sub_1A94174F8((uint64_t)sub_1A96277D8, (uint64_t)&v7, v5 << 32, (uint64_t)&unk_1E97ED338, (uint64_t)type metadata accessor for MarineHourForecast, (uint64_t)type metadata accessor for MarineHourForecast, (uint64_t)sub_1A9481BA4, v6, v7, v8, v9, a1, v2, v10, v11, v12, v13, v14, v15,
      vars0,
      vars8);
  }
}

void sub_1A9622188(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = MEMORY[0x1AD0F4300]();
  if ((v4 & 0x80000000) != 0)
  {
    __break(1u);
  }
  else
  {
    uint64_t v5 = MEMORY[0x1F4188790](v4);
    sub_1A94174F8((uint64_t)sub_1A96276C0, (uint64_t)&v7, v5 << 32, (uint64_t)&unk_1E97ED318, (uint64_t)type metadata accessor for TideEvent, (uint64_t)type metadata accessor for TideEvent, (uint64_t)sub_1A9481C20, v6, v7, v8, v9, a1, v2, v10, v11, v12, v13, v14, v15,
      vars0,
      vars8);
  }
}

void sub_1A9622250(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = MEMORY[0x1AD0F42D0]();
  if ((v4 & 0x80000000) != 0)
  {
    __break(1u);
  }
  else
  {
    uint64_t v5 = MEMORY[0x1F4188790](v4);
    sub_1A94174F8((uint64_t)sub_1A96276A4, (uint64_t)&v7, v5 << 32, (uint64_t)&unk_1E97ED308, (uint64_t)type metadata accessor for HourTide, (uint64_t)type metadata accessor for HourTide, (uint64_t)sub_1A9481C68, v6, v7, v8, v9, a1, v2, v10, v11, v12, v13, v14, v15,
      vars0,
      vars8);
  }
}

void sub_1A9622318(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = MEMORY[0x1AD0F3500]();
  if ((v4 & 0x80000000) != 0)
  {
    __break(1u);
  }
  else
  {
    uint64_t v5 = MEMORY[0x1F4188790](v4);
    sub_1A94174F8((uint64_t)sub_1A9627618, (uint64_t)&v7, v5 << 32, (uint64_t)&unk_1E97EB380, (uint64_t)type metadata accessor for WeatherAlert, (uint64_t)type metadata accessor for WeatherAlert, (uint64_t)sub_1A9481CB0, v6, v7, v8, v9, a1, v2, v10, v11, v12, v13, v14, v15,
      vars0,
      vars8);
  }
}

uint64_t sub_1A96223E0@<X0>(unsigned int *a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X8>)
{
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E97ED2E8);
  MEMORY[0x1F4188790](v8 - 8);
  uint64_t v10 = &v12[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x1AD0F4FB0](*a1);
  uint64_t v13 = a2;
  uint64_t v14 = a3;
  sub_1A96216B8((void (*)(char *))sub_1A96275CC, a4);
  return sub_1A94179C4((uint64_t)v10, &qword_1E97ED2E8);
}

uint64_t sub_1A96224D0@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v23 = a1;
  uint64_t v3 = sub_1A962FF60();
  uint64_t v24 = *(void *)(v3 - 8);
  uint64_t v25 = v3;
  MEMORY[0x1F4188790](v3);
  uint64_t v5 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = sub_1A9630D00();
  uint64_t v6 = *(void *)(v22 - 8);
  MEMORY[0x1F4188790](v22);
  uint64_t v8 = (char *)&v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for Metadata();
  MEMORY[0x1F4188790](v9 - 8);
  uint64_t v21 = (uint64_t)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_1A9630F50();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x1F4188790](v11);
  uint64_t v14 = (char *)&v21 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A9630D60();
  sub_1A9622D20((uint64_t)v14);
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  uint64_t v15 = v21;
  sub_1A943F20C(v23, v21);
  sub_1A9630DA0();
  sub_1A9622E2C((uint64_t)v8, &v27);
  uint64_t v16 = (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v22);
  LOBYTE(v6) = v27;
  double v17 = MEMORY[0x1AD0F4E30](v16);
  double v18 = MEMORY[0x1AD0F4E40]();
  sub_1A9630DB0();
  sub_1A9622FAC((uint64_t)v5, &v26);
  (*(void (**)(char *, uint64_t))(v24 + 8))(v5, v25);
  LOBYTE(v14) = v26;
  sub_1A9630D90();
  uint64_t v19 = (int *)type metadata accessor for WeatherComparison();
  sub_1A962E7A0();
  uint64_t result = sub_1A9417740(v15, a2, (void (*)(void))type metadata accessor for Metadata);
  *(unsigned char *)(a2 + v19[6]) = v6;
  *(double *)(a2 + v19[7]) = v17;
  *(double *)(a2 + v19[8]) = v18;
  *(unsigned char *)(a2 + v19[9]) = (_BYTE)v14;
  return result;
}

uint64_t sub_1A9622808@<X0>(unsigned int *a1@<X0>, void *a2@<X8>)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6DB228);
  MEMORY[0x1F4188790](v4 - 8);
  uint64_t v6 = &v15[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v7 = sub_1A9630B60();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x1F4188790](v7);
  uint64_t v10 = &v15[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v11 = *a1;
  MEMORY[0x1AD0F4D20](v11);
  if (__swift_getEnumTagSinglePayload((uint64_t)v6, 1, v7) == 1)
  {
    uint64_t result = sub_1A94179C4((uint64_t)v6, &qword_1EB6DB228);
    uint64_t v13 = 0;
    uint64_t v14 = 0;
  }
  else
  {
    (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v8 + 32))(v10, v6, v7);
    sub_1A96229C0((uint64_t)v10, v11, (uint64_t)v15);
    uint64_t result = (*(uint64_t (**)(unsigned char *, uint64_t))(v8 + 8))(v10, v7);
    uint64_t v13 = v15[0];
    uint64_t v14 = v16;
  }
  *a2 = v13;
  a2[1] = v14;
  return result;
}

uint64_t sub_1A96229C0@<X0>(uint64_t a1@<X0>, unsigned int a2@<W1>, uint64_t a3@<X8>)
{
  uint64_t v4 = v3;
  uint64_t v8 = MEMORY[0x1AD0F4C00]();
  if ((v8 & 0x80000000) != 0)
  {
    __break(1u);
  }
  else
  {
    uint64_t v9 = MEMORY[0x1F4188790](v8);
    sub_1A94174F8((uint64_t)sub_1A9627810, (uint64_t)&v14, v9 << 32, (uint64_t)&qword_1EB6DC678, (uint64_t)type metadata accessor for DayPartForecast, (uint64_t)type metadata accessor for DayPartForecast, (uint64_t)sub_1A9482084, v10, v14, v15, SHIDWORD(v15), a1, v4, v17, v18, v19, v20, v21, v22,
      v23,
      v24);
    uint64_t v12 = v11;
    uint64_t result = MEMORY[0x1AD0F4BF0]();
    if ((_BYTE)result)
    {
LABEL_6:
      *(unsigned char *)a3 = result;
      *(void *)(a3 + 8) = v12;
      return result;
    }
    if ((a2 & 0x80000000) != 0) {
      goto LABEL_9;
    }
    if (a2 >= 0x100)
    {
      int v16 = 0;
      uint64_t v15 = 3455;
      LOBYTE(v14) = 2;
      goto LABEL_11;
    }
    uint64_t result = a2 + 1;
    if (((a2 + 1) & 0x100) == 0) {
      goto LABEL_6;
    }
  }
  __break(1u);
LABEL_9:
  int v16 = 0;
  uint64_t v15 = 3451;
  LOBYTE(v14) = 2;
LABEL_11:
  uint64_t result = sub_1A9632530();
  __break(1u);
  return result;
}

uint64_t sub_1A9622B64@<X0>(unsigned int *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6DAA50);
  MEMORY[0x1F4188790](v4 - 8);
  uint64_t v6 = (char *)v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_1A9630A20();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x1F4188790](v7);
  uint64_t v10 = (char *)v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1AD0F4C10](*a1);
  if (__swift_getEnumTagSinglePayload((uint64_t)v6, 1, v7) == 1)
  {
    sub_1A94179C4((uint64_t)v6, &qword_1EB6DAA50);
    uint64_t v11 = 1;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v10, v6, v7);
    sub_1A9421844((uint64_t)v10, a2);
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
    uint64_t v11 = 0;
  }
  uint64_t v12 = type metadata accessor for DayPartForecast();
  return __swift_storeEnumTagSinglePayload(a2, v11, 1, v12);
}

uint64_t sub_1A9622D20(uint64_t a1)
{
  uint64_t v2 = sub_1A9630F50();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  uint64_t v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, a1, v2);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v3 + 88))(v5, v2);
  if (result != *MEMORY[0x1E4FB5FF0]) {
    return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
  return result;
}

uint64_t sub_1A9622E2C@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  uint64_t v4 = sub_1A9630D00();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v5 + 88))(v7, v4);
  if (result == *MEMORY[0x1E4FB5FA0])
  {
    *a2 = 0;
    return result;
  }
  if (result == *MEMORY[0x1E4FB5F98])
  {
    char v9 = 1;
  }
  else if (result == *MEMORY[0x1E4FB5F90])
  {
    char v9 = 2;
  }
  else
  {
    if (result != *MEMORY[0x1E4FB5FA8])
    {
      *a2 = 2;
      return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    }
    char v9 = 3;
  }
  *a2 = v9;
  return result;
}

uint64_t sub_1A9622FAC@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  uint64_t v4 = sub_1A962FF60();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v5 + 88))(v7, v4);
  if (result == *MEMORY[0x1E4FB5A40])
  {
    *a2 = 0;
    return result;
  }
  if (result == *MEMORY[0x1E4FB5A50])
  {
    char v9 = 1;
  }
  else if (result == *MEMORY[0x1E4FB5A58])
  {
    char v9 = 2;
  }
  else if (result == *MEMORY[0x1E4FB5A48])
  {
    char v9 = 3;
  }
  else
  {
    if (result != *MEMORY[0x1E4FB5A60])
    {
      *a2 = 2;
      return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    }
    char v9 = 4;
  }
  *a2 = v9;
  return result;
}

uint64_t sub_1A9623148(unsigned int *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E97ED340);
  MEMORY[0x1F4188790](v2 - 8);
  uint64_t v4 = (char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1AD0F5080](*a1);
  swift_retain();
  sub_1A9417A18();
  return sub_1A94179C4((uint64_t)v4, &qword_1E97ED340);
}

uint64_t sub_1A9623260@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E97ED348);
  MEMORY[0x1F4188790](v2 - 8);
  uint64_t v4 = (char *)&v17 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_1A962E810();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = MEMORY[0x1F4188790](v5);
  char v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1AD0F4EB0](v7);
  sub_1A962E7A0();
  sub_1A9630DD0();
  uint64_t v10 = sub_1A9631150();
  uint64_t result = __swift_getEnumTagSinglePayload((uint64_t)v4, 1, v10);
  if (result == 1)
  {
    __break(1u);
  }
  else
  {
    double v12 = sub_1A9623454((double *)&v18);
    uint64_t v13 = (*(uint64_t (**)(char *, uint64_t, double))(*(void *)(v10 - 8) + 8))(v4, v10, v12);
    long long v17 = v18;
    uint64_t v14 = v19;
    double v15 = MEMORY[0x1AD0F4EA0](v13);
    (*(void (**)(uint64_t, char *, uint64_t))(v6 + 32))(a1, v9, v5);
    uint64_t result = type metadata accessor for MarineHourForecast();
    uint64_t v16 = a1 + *(int *)(result + 20);
    *(_OWORD *)uint64_t v16 = v17;
    *(void *)(v16 + 16) = v14;
    *(double *)(a1 + *(int *)(result + 24)) = v15;
  }
  return result;
}

double sub_1A9623454@<D0>(double *a1@<X8>)
{
  double v2 = MEMORY[0x1AD0F51F0]();
  double v3 = MEMORY[0x1AD0F5200]();
  double result = (double)MEMORY[0x1AD0F51E0]();
  *a1 = v2;
  a1[1] = v3;
  a1[2] = result;
  return result;
}

uint64_t sub_1A96234A4(unsigned int *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E97ED310);
  MEMORY[0x1F4188790](v2 - 8);
  uint64_t v4 = (char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1AD0F4330](*a1);
  swift_retain();
  sub_1A9417A18();
  return sub_1A94179C4((uint64_t)v4, &qword_1E97ED310);
}

uint64_t sub_1A96235BC@<X0>(uint64_t a1@<X8>)
{
  MEMORY[0x1AD0F3E50]();
  uint64_t v2 = sub_1A962E7A0();
  double v3 = MEMORY[0x1AD0F3E60](v2);
  uint64_t result = type metadata accessor for HourTide();
  *(double *)(a1 + *(int *)(result + 20)) = v3;
  return result;
}

uint64_t sub_1A9623610(unsigned int *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E97ED320);
  MEMORY[0x1F4188790](v2 - 8);
  uint64_t v4 = (char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1AD0F4340](*a1);
  swift_retain();
  sub_1A9417A18();
  return sub_1A94179C4((uint64_t)v4, &qword_1E97ED320);
}

uint64_t sub_1A9623728@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_1A9630550();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  uint64_t v5 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_1A962E810();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x1F4188790](v6);
  uint64_t v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1AD0F40E0](v8);
  uint64_t v11 = sub_1A962E7A0();
  MEMORY[0x1AD0F4100](v11);
  char v12 = sub_1A96238F0((uint64_t)v5) & 1;
  uint64_t v13 = (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  double v14 = MEMORY[0x1AD0F40F0](v13);
  (*(void (**)(uint64_t, char *, uint64_t))(v7 + 32))(a1, v10, v6);
  uint64_t result = type metadata accessor for TideEvent();
  *(unsigned char *)(a1 + *(int *)(result + 20)) = v12;
  *(double *)(a1 + *(int *)(result + 24)) = v14;
  return result;
}

uint64_t sub_1A96238F0(uint64_t a1)
{
  uint64_t v2 = sub_1A9630550();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  uint64_t v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, a1, v2);
  int v6 = (*(uint64_t (**)(char *, uint64_t))(v3 + 88))(v5, v2);
  if (v6 != *MEMORY[0x1E4FB5D90])
  {
    if (v6 == *MEMORY[0x1E4FB5D98]) {
      return 1;
    }
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
  return 0;
}

uint64_t sub_1A9623A1C(unsigned int *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E97ED2F0);
  MEMORY[0x1F4188790](v2 - 8);
  uint64_t v4 = (char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1AD0F3530](*a1);
  swift_retain();
  sub_1A9417A18();
  return sub_1A94179C4((uint64_t)v4, &qword_1E97ED2F0);
}

uint64_t sub_1A9623B34@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v77 = a2;
  uint64_t v3 = sub_1A9630700();
  uint64_t v75 = *(void *)(v3 - 8);
  uint64_t v76 = v3;
  MEMORY[0x1F4188790](v3);
  uint64_t v74 = (char *)&v59 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_1A96302E0();
  uint64_t v72 = *(void *)(v5 - 8);
  uint64_t v73 = v5;
  MEMORY[0x1F4188790](v5);
  uint64_t v71 = (char *)&v59 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_1A9630B80();
  uint64_t v81 = *(void *)(v7 - 8);
  uint64_t v82 = v7;
  MEMORY[0x1F4188790](v7);
  uint64_t v9 = (char *)&v59 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_1A9630440();
  uint64_t v79 = *(void *)(v10 - 8);
  uint64_t v80 = v10;
  MEMORY[0x1F4188790](v10);
  char v12 = (char *)&v59 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v78 = sub_1A9630560();
  uint64_t v13 = *(void *)(v78 - 8);
  MEMORY[0x1F4188790](v78);
  double v15 = (char *)&v59 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6DE3A0);
  uint64_t v17 = MEMORY[0x1F4188790](v16 - 8);
  uint64_t v83 = (uint64_t)&v59 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v17);
  uint64_t v87 = (uint64_t)&v59 - v19;
  uint64_t v20 = sub_1A962E810();
  uint64_t v21 = MEMORY[0x1F4188790](v20 - 8);
  uint64_t v86 = (uint64_t)&v59 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = MEMORY[0x1F4188790](v21);
  uint64_t v85 = (uint64_t)&v59 - v24;
  MEMORY[0x1F4188790](v23);
  uint64_t v84 = (uint64_t)&v59 - v25;
  uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E97ED2F8);
  MEMORY[0x1F4188790](v26 - 8);
  uint64_t v28 = (char *)&v59 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v29 = sub_1A962E850();
  uint64_t v30 = MEMORY[0x1F4188790](v29 - 8);
  uint64_t v32 = (char *)&v59 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1AD0F3440](v30);
  uint64_t v33 = sub_1A96310E0();
  uint64_t result = __swift_getEnumTagSinglePayload((uint64_t)v28, 1, v33);
  if (result == 1)
  {
    __break(1u);
    goto LABEL_6;
  }
  uint64_t v70 = v32;
  sub_1A962437C((uint64_t)v28);
  uint64_t v35 = (*(uint64_t (**)(char *, uint64_t))(*(void *)(v33 - 8) + 8))(v28, v33);
  MEMORY[0x1AD0F3450](v35);
  sub_1A9624748(v36, (unint64_t *)&v98);
  uint64_t v37 = swift_bridgeObjectRelease();
  uint64_t v38 = MEMORY[0x1AD0F3450](v37);
  uint64_t v40 = v39;
  uint64_t v41 = MEMORY[0x1AD0F3480]();
  uint64_t v69 = v42;
  uint64_t v68 = MEMORY[0x1AD0F33D0]();
  uint64_t v67 = v43;
  uint64_t result = MEMORY[0x1AD0F33E0]();
  uint64_t v66 = result;
  uint64_t v65 = v44;
  if (!v44)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  uint64_t v62 = v41;
  uint64_t v63 = v40;
  uint64_t v64 = v38;
  sub_1A962F2D0();
  sub_1A962E7A0();
  sub_1A962F2F0();
  sub_1A962E7A0();
  sub_1A962F360();
  sub_1A962E7A0();
  unint64_t v45 = sub_1A962F370();
  sub_1A94217DC(v45 | ((HIDWORD(v45) & 1) << 32), v87);
  unint64_t v46 = sub_1A962F340();
  uint64_t v47 = v83;
  sub_1A94217DC(v46 | ((HIDWORD(v46) & 1) << 32), v83);
  uint64_t v61 = sub_1A962F2C0();
  uint64_t v60 = v48;
  sub_1A962F3E0();
  sub_1A96248D8((uint64_t)v15, v97);
  (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v78);
  char v96 = v97[0];
  uint64_t v78 = sub_1A962F300();
  uint64_t v59 = v49;
  uint64_t v50 = sub_1A9626F10(a1, MEMORY[0x1E4FB59D0], (uint64_t)sub_1A9627634, (uint64_t (*)(uint64_t))sub_1A9620FEC);
  sub_1A962F3D0();
  sub_1A9624A74((uint64_t)v12, &v95);
  (*(void (**)(char *, uint64_t))(v79 + 8))(v12, v80);
  char v94 = v95;
  sub_1A962F350();
  sub_1A9624C10((uint64_t)v9, &v93);
  (*(void (**)(char *, uint64_t))(v81 + 8))(v9, v82);
  char v92 = v93;
  uint64_t result = sub_1A962F3A0();
  if (v51)
  {
    uint64_t v52 = result;
    uint64_t v53 = v51;
    uint64_t v54 = sub_1A962F330();
    uint64_t v56 = v55;
    uint64_t v57 = (uint64_t)v71;
    sub_1A962F3B0();
    sub_1A9624E8C(v57, &v91);
    (*(void (**)(uint64_t, uint64_t))(v72 + 8))(v57, v73);
    char v90 = v91;
    uint64_t v58 = (uint64_t)v74;
    sub_1A962F2E0();
    sub_1A9625028(v58, &v89);
    (*(void (**)(uint64_t, uint64_t))(v75 + 8))(v58, v76);
    char v88 = v89;
    return WeatherAlert.init(id:area:areaId:areaName:countryCode:description:expireTime:issuedTime:effectiveTime:eventOnsetTime:eventEndTime:detailsUrl:certainty:phenomenon:responses:severity:significance:source:eventSource:urgency:messages:importance:)((uint64_t)v70, &v98, v64, v63, v62, v69, v68, v67, v77, v66, v65, v84, v85, v86, v87, v47, v61, v60, &v96,
             v78,
             v59,
             v50,
             &v94,
             &v92,
             v52,
             v53,
             v54,
             v56,
             &v90,
             0,
             &v88);
  }
LABEL_7:
  __break(1u);
  return result;
}

uint64_t sub_1A962437C(uint64_t a1)
{
  uint64_t v2 = sub_1A96310E0();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  uint64_t v5 = (char *)v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  int v6 = sub_1A96310C0();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, a1, v2);
  if (v6 != 16)
  {
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    return sub_1A962E840();
  }
  uint64_t v7 = *(void *)(sub_1A96310D0() + 16);
  swift_bridgeObjectRelease();
  int v8 = sub_1A96310C0();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  if (v7 != v8) {
    return sub_1A962E840();
  }
  uint64_t v9 = sub_1A96310D0();
  uint64_t v10 = sub_1A9566A78(v9);
  unint64_t v33 = v11;
  uint64_t v12 = v10;
  switch(v11 >> 62)
  {
    case 1uLL:
      int v14 = v10;
      uint64_t v32 = v10;
      if ((int)v10 <= v10 >> 32)
      {
        uint64_t v15 = sub_1A962E470();
        if (!v15)
        {
          uint64_t v18 = 0;
LABEL_17:
          sub_1A962E480();
          if (v18)
          {
            uint64_t v12 = v32;
            goto LABEL_19;
          }
LABEL_24:
          __break(1u);
          JUMPOUT(0x1A9624738);
        }
        uint64_t v16 = v15;
        uint64_t v17 = sub_1A962E490();
        if (!__OFSUB__(v14, v17))
        {
          uint64_t v18 = v16 + v14 - v17;
          goto LABEL_17;
        }
        goto LABEL_22;
      }
      __break(1u);
      goto LABEL_21;
    case 2uLL:
      uint64_t v19 = *(void *)(v10 + 16);
      uint64_t v32 = v10;
      swift_retain();
      swift_retain();
      uint64_t v20 = sub_1A962E470();
      if (v20)
      {
        uint64_t v21 = v20;
        uint64_t v22 = sub_1A962E490();
        if (__OFSUB__(v19, v22))
        {
LABEL_21:
          __break(1u);
LABEL_22:
          __break(1u);
          goto LABEL_23;
        }
        uint64_t v23 = (unsigned __int8 *)(v21 + v19 - v22);
      }
      else
      {
        uint64_t v23 = 0;
      }
      sub_1A962E480();
      if (!v23)
      {
LABEL_23:
        __break(1u);
        goto LABEL_24;
      }
      uint64_t v31 = v23[1];
      uint64_t v30 = v23[2];
      uint64_t v29 = v23[3];
      uint64_t v28 = v23[4];
      uint64_t v27 = v23[5];
      uint64_t v26 = v23[6];
      uint64_t v25 = v23[7];
      v24[1] = v23[14];
      swift_release();
      uint64_t v12 = v32;
      swift_release();
LABEL_19:
      sub_1A962E830();
      return sub_1A9466028(v12, v33);
    default:
      goto LABEL_19;
  }
}

uint64_t sub_1A9624748@<X0>(uint64_t a1@<X1>, unint64_t *a2@<X8>)
{
  uint64_t v4 = sub_1A9631DB0();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t result = MEMORY[0x1F4188790](v4);
  int v8 = (char *)v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!a1
    || (sub_1A9631DA0(),
        uint64_t v9 = sub_1A9631D70(),
        unint64_t v11 = v10,
        uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v8, v4),
        v11 >> 60 == 15))
  {
    unint64_t v12 = 0xF000000000000007;
  }
  else
  {
    sub_1A962E2E0();
    swift_allocObject();
    sub_1A962E2D0();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6DB010);
    sub_1A9627650();
    sub_1A962E2C0();
    sub_1A9490CE8(v9, v11);
    uint64_t result = swift_release();
    unint64_t v12 = v13[1];
  }
  *a2 = v12;
  return result;
}

uint64_t sub_1A96248D8@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  uint64_t v4 = sub_1A9630560();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v5 + 88))(v7, v4);
  if (result == *MEMORY[0x1E4FB5DA8])
  {
    char v9 = 4;
  }
  else
  {
    if (result == *MEMORY[0x1E4FB5DB0])
    {
      *a2 = 0;
      return result;
    }
    if (result == *MEMORY[0x1E4FB5DA0])
    {
      char v9 = 1;
    }
    else if (result == *MEMORY[0x1E4FB5DB8])
    {
      char v9 = 2;
    }
    else
    {
      if (result != *MEMORY[0x1E4FB5DC0])
      {
        *a2 = 4;
        return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
      }
      char v9 = 3;
    }
  }
  *a2 = v9;
  return result;
}

uint64_t sub_1A9624A74@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  uint64_t v4 = sub_1A9630440();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v5 + 88))(v7, v4);
  if (result == *MEMORY[0x1E4FB5B98])
  {
    char v9 = 4;
  }
  else
  {
    if (result == *MEMORY[0x1E4FB5B90])
    {
      *a2 = 0;
      return result;
    }
    if (result == *MEMORY[0x1E4FB5B88])
    {
      char v9 = 1;
    }
    else if (result == *MEMORY[0x1E4FB5BA0])
    {
      char v9 = 2;
    }
    else
    {
      if (result != *MEMORY[0x1E4FB5B80])
      {
        *a2 = 4;
        return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
      }
      char v9 = 3;
    }
  }
  *a2 = v9;
  return result;
}

uint64_t sub_1A9624C10@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  uint64_t v4 = sub_1A9630B80();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v5 + 88))(v7, v4);
  if (result == *MEMORY[0x1E4FB5F10])
  {
    char v9 = 12;
  }
  else
  {
    if (result == *MEMORY[0x1E4FB5EE8])
    {
      *a2 = 0;
      return result;
    }
    if (result == *MEMORY[0x1E4FB5F28])
    {
      char v9 = 1;
    }
    else if (result == *MEMORY[0x1E4FB5F38])
    {
      char v9 = 2;
    }
    else if (result == *MEMORY[0x1E4FB5EF8])
    {
      char v9 = 3;
    }
    else if (result == *MEMORY[0x1E4FB5F30])
    {
      char v9 = 4;
    }
    else if (result == *MEMORY[0x1E4FB5EE0])
    {
      char v9 = 5;
    }
    else if (result == *MEMORY[0x1E4FB5F00])
    {
      char v9 = 6;
    }
    else if (result == *MEMORY[0x1E4FB5F08])
    {
      char v9 = 7;
    }
    else if (result == *MEMORY[0x1E4FB5EF0])
    {
      char v9 = 8;
    }
    else if (result == *MEMORY[0x1E4FB5F40])
    {
      char v9 = 9;
    }
    else if (result == *MEMORY[0x1E4FB5F18])
    {
      char v9 = 10;
    }
    else
    {
      if (result != *MEMORY[0x1E4FB5F20])
      {
        *a2 = 12;
        return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
      }
      char v9 = 11;
    }
  }
  *a2 = v9;
  return result;
}

uint64_t sub_1A9624E8C@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  uint64_t v4 = sub_1A96302E0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v5 + 88))(v7, v4);
  if (result == *MEMORY[0x1E4FB5B58])
  {
    char v9 = 4;
  }
  else
  {
    if (result == *MEMORY[0x1E4FB5B68])
    {
      *a2 = 0;
      return result;
    }
    if (result == *MEMORY[0x1E4FB5B60])
    {
      char v9 = 1;
    }
    else if (result == *MEMORY[0x1E4FB5B50])
    {
      char v9 = 2;
    }
    else
    {
      if (result != *MEMORY[0x1E4FB5B48])
      {
        *a2 = 4;
        return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
      }
      char v9 = 3;
    }
  }
  *a2 = v9;
  return result;
}

uint64_t sub_1A9625028@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  uint64_t v4 = sub_1A9630700();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v5 + 88))(v7, v4);
  if (result == *MEMORY[0x1E4FB5E68])
  {
    char v9 = 2;
LABEL_5:
    *a2 = v9;
    return result;
  }
  if (result == *MEMORY[0x1E4FB5E58])
  {
    char v9 = 1;
    goto LABEL_5;
  }
  if (result == *MEMORY[0x1E4FB5E60])
  {
    *a2 = 0;
  }
  else
  {
    *a2 = 3;
    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
  return result;
}

uint64_t sub_1A962518C@<X0>(char *a1@<X8>)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E97ED300);
  MEMORY[0x1F4188790](v2 - 8);
  uint64_t v4 = (char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A962F3F0();
  swift_retain();
  sub_1A9621898((uint64_t)v4, a1);
  return sub_1A94179C4((uint64_t)v4, &qword_1E97ED300);
}

uint64_t sub_1A9625264@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  uint64_t v4 = sub_1A9630B70();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v5 + 88))(v7, v4);
  if (result == *MEMORY[0x1E4FB5EA0])
  {
    char v9 = 8;
  }
  else
  {
    if (result == *MEMORY[0x1E4FB5EC8])
    {
      *a2 = 0;
      return result;
    }
    if (result == *MEMORY[0x1E4FB5ED8])
    {
      char v9 = 1;
    }
    else if (result == *MEMORY[0x1E4FB5EC0])
    {
      char v9 = 2;
    }
    else if (result == *MEMORY[0x1E4FB5EB0])
    {
      char v9 = 3;
    }
    else if (result == *MEMORY[0x1E4FB5E98])
    {
      char v9 = 4;
    }
    else if (result == *MEMORY[0x1E4FB5EB8])
    {
      char v9 = 5;
    }
    else if (result == *MEMORY[0x1E4FB5EA8])
    {
      char v9 = 6;
    }
    else
    {
      if (result != *MEMORY[0x1E4FB5ED0])
      {
        *a2 = 8;
        return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
      }
      char v9 = 7;
    }
  }
  *a2 = v9;
  return result;
}

uint64_t sub_1A9625470()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6DAA48);
  MEMORY[0x1F4188790](v0 - 8);
  uint64_t v2 = (char *)&v4 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A962F510();
  swift_retain();
  sub_1A9417A18();
  return sub_1A94179C4((uint64_t)v2, &qword_1EB6DAA48);
}

uint64_t sub_1A9625588@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_1A9630710();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  uint64_t v5 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6DE3A0);
  uint64_t v7 = MEMORY[0x1F4188790](v6 - 8);
  char v9 = (char *)&v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  unsigned int v10 = MEMORY[0x1AD0F4770](v7);
  v26[1] = 0;
  sub_1A94217DC(v10, (uint64_t)v9);
  sub_1A96306C0();
  sub_1A9625804((uint64_t)v5, v26);
  unint64_t v11 = *(void (**)(char *, uint64_t))(v3 + 8);
  v11(v5, v2);
  int v22 = v26[0];
  sub_1A96306D0();
  sub_1A9625804((uint64_t)v5, (char *)&v25);
  v11(v5, v2);
  int v21 = v25;
  sub_1A96306E0();
  sub_1A9625804((uint64_t)v5, &v24);
  v11(v5, v2);
  char v12 = v24;
  sub_1A96306F0();
  sub_1A9625804((uint64_t)v5, &v23);
  v11(v5, v2);
  char v13 = v23;
  uint64_t v14 = sub_1A962E810();
  __swift_storeEnumTagSinglePayload(a1, 1, 1, v14);
  uint64_t v15 = (int *)type metadata accessor for TrendDeviation();
  uint64_t v16 = v15[5];
  *(unsigned char *)(a1 + v16) = 4;
  uint64_t v17 = v15[6];
  *(unsigned char *)(a1 + v17) = 4;
  uint64_t v18 = v15[7];
  *(unsigned char *)(a1 + v18) = 4;
  uint64_t v19 = v15[8];
  *(unsigned char *)(a1 + v19) = 4;
  uint64_t result = sub_1A94200B4((uint64_t)v9, a1);
  *(unsigned char *)(a1 + v16) = v22;
  *(unsigned char *)(a1 + v17) = v21;
  *(unsigned char *)(a1 + v18) = v12;
  *(unsigned char *)(a1 + v19) = v13;
  return result;
}

uint64_t sub_1A9625804@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  uint64_t v4 = sub_1A9630710();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v5 + 88))(v7, v4);
  if (result == *MEMORY[0x1E4FB5E80])
  {
    char v9 = 3;
  }
  else if (result == *MEMORY[0x1E4FB5E78])
  {
    char v9 = 1;
  }
  else
  {
    if (result != *MEMORY[0x1E4FB5E70])
    {
      *a2 = 3;
      return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    }
    char v9 = 2;
  }
  *a2 = v9;
  return result;
}

uint64_t sub_1A9625968(unsigned int *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E97ED368);
  MEMORY[0x1F4188790](v2 - 8);
  uint64_t v4 = (char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1AD0F4BB0](*a1);
  swift_retain();
  sub_1A9417A18();
  return sub_1A94179C4((uint64_t)v4, &qword_1E97ED368);
}

uint64_t sub_1A9625A80@<X0>(uint64_t a1@<X8>)
{
  uint64_t v23 = sub_1A9630C80();
  uint64_t v2 = *(void *)(v23 - 8);
  MEMORY[0x1F4188790](v23);
  uint64_t v4 = &v24[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0) - 5];
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6DE3A0);
  MEMORY[0x1F4188790](v5 - 8);
  uint64_t v7 = &v24[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0) - 5];
  uint64_t v8 = sub_1A962E810();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = MEMORY[0x1F4188790](v8);
  char v12 = &v24[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0) - 5];
  MEMORY[0x1AD0F4F70](v10);
  uint64_t v13 = sub_1A962E7A0();
  unint64_t v14 = MEMORY[0x1AD0F4F50](v13);
  sub_1A94217DC(v14 | ((HIDWORD(v14) & 1) << 32), (uint64_t)v7);
  sub_1A9630EA0();
  sub_1A941CDC8((uint64_t)v4, v24);
  uint64_t v15 = (*(uint64_t (**)(char *, uint64_t))(v2 + 8))(v4, v23);
  LODWORD(v23) = v24[0];
  double v16 = (double)(char)MEMORY[0x1AD0F4EE0](v15) / 100.0;
  double v17 = MEMORY[0x1AD0F4EF0]();
  uint64_t v18 = (int *)type metadata accessor for ForecastSummary();
  uint64_t v19 = a1 + v18[5];
  __swift_storeEnumTagSinglePayload(v19, 1, 1, v8);
  uint64_t v20 = a1 + v18[7];
  *(void *)uint64_t v20 = 0;
  *(unsigned char *)(v20 + 8) = 1;
  uint64_t v21 = a1 + v18[8];
  *(void *)uint64_t v21 = 0;
  *(unsigned char *)(v21 + 8) = 1;
  (*(void (**)(uint64_t, char *, uint64_t))(v9 + 32))(a1, v12, v8);
  uint64_t result = sub_1A94200B4((uint64_t)v7, v19);
  *(unsigned char *)(a1 + v18[6]) = v23;
  *(double *)uint64_t v20 = v16;
  *(unsigned char *)(v20 + 8) = 0;
  *(double *)uint64_t v21 = v17;
  *(unsigned char *)(v21 + 8) = 0;
  return result;
}

uint64_t sub_1A9625D30(uint64_t a1, unsigned int *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v22[2] = a1;
  v22[1] = a4;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6DE3A0);
  MEMORY[0x1F4188790](v5 - 8);
  v22[0] = (uint64_t)v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_1A9631030();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x1F4188790](v7);
  uint64_t v10 = (char *)v22 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E97ED398);
  MEMORY[0x1F4188790](v11 - 8);
  uint64_t v13 = (char *)v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_1A9631020();
  uint64_t v15 = *(void *)(v14 - 8);
  MEMORY[0x1F4188790](v14);
  double v17 = (char *)v22 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1AD0F4C90](*a2);
  if (__swift_getEnumTagSinglePayload((uint64_t)v13, 1, v14) == 1) {
    return sub_1A94179C4((uint64_t)v13, &qword_1E97ED398);
  }
  (*(void (**)(char *, char *, uint64_t))(v15 + 32))(v17, v13, v14);
  sub_1A9631010();
  sub_1A9626024((uint64_t)v10);
  uint64_t v19 = (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  unsigned int v20 = MEMORY[0x1AD0F50C0](v19);
  char v23 = 0;
  uint64_t v21 = v22[0];
  sub_1A94217DC(v20, v22[0]);
  sub_1A9452008(v21);
  return (*(uint64_t (**)(char *, uint64_t))(v15 + 8))(v17, v14);
}

uint64_t sub_1A9626024(uint64_t a1)
{
  uint64_t v2 = sub_1A9631030();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  uint64_t v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, a1, v2);
  int v6 = (*(uint64_t (**)(char *, uint64_t))(v3 + 88))(v5, v2);
  if (v6 != *MEMORY[0x1E4FB5FF8])
  {
    if (v6 == *MEMORY[0x1E4FB6000]) {
      return 1;
    }
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
  return 0;
}

uint64_t sub_1A9626150(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1A9630570();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x1F4188790](v4);
  uint64_t v8 = (char *)&v46 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = MEMORY[0x1F4188790](v6);
  uint64_t v11 = (char *)&v46 - v10;
  uint64_t v12 = MEMORY[0x1F4188790](v9);
  uint64_t v14 = (char *)&v46 - v13;
  MEMORY[0x1F4188790](v12);
  uint64_t v16 = (char *)&v46 - v15;
  double v17 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
  v17((char *)&v46 - v15, a1, v4);
  int v18 = (*(uint64_t (**)(char *, uint64_t))(v5 + 88))(v16, v4);
  if (v18 != *MEMORY[0x1E4FB5E00]
    && v18 != *MEMORY[0x1E4FB5DE8]
    && v18 != *MEMORY[0x1E4FB5DC8]
    && v18 != *MEMORY[0x1E4FB5E08]
    && v18 != *MEMORY[0x1E4FB5DD0])
  {
    if (v18 == *MEMORY[0x1E4FB5E20])
    {
      uint64_t v25 = *MEMORY[0x1E4FB5DF0];
      uint64_t v47 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 104);
      v47(v14, v25, v4);
      sub_1A9426AD8(&qword_1E97ED390, MEMORY[0x1E4FB5E30]);
      sub_1A9631FA0();
      sub_1A9631FA0();
      int v26 = v53;
      uint64_t v27 = v14;
      int v28 = v52;
      uint64_t v29 = *(void (**)(void))(v5 + 8);
      uint64_t v48 = v27;
      uint64_t v49 = v29;
      v29();
      v17(v11, a2, v4);
      if (v26 == v28)
      {
        uint64_t v30 = v11;
LABEL_20:
        ((void (*)(char *, uint64_t))v49)(v30, v4);
        return 1;
      }
      unint64_t v34 = v48;
      v47(v48, *MEMORY[0x1E4FB5E10], v4);
      sub_1A9631FA0();
      sub_1A9631FA0();
      BOOL v23 = v51 == v50;
      uint64_t v35 = v34;
      uint64_t v36 = v49;
      ((void (*)(char *, uint64_t))v49)(v35, v4);
      uint64_t v37 = v11;
      goto LABEL_29;
    }
    if (v18 == *MEMORY[0x1E4FB5DF0] || v18 == *MEMORY[0x1E4FB5E10])
    {
      (*(void (**)(char *))(v5 + 104))(v14);
      sub_1A9426AD8(&qword_1E97ED390, MEMORY[0x1E4FB5E30]);
      sub_1A9631FA0();
      sub_1A9631FA0();
      int v32 = v55;
      int v33 = v54;
      goto LABEL_27;
    }
    if (v18 != *MEMORY[0x1E4FB5DD8])
    {
      if (v18 == *MEMORY[0x1E4FB5E28])
      {
        uint64_t v38 = *MEMORY[0x1E4FB5DF8];
        uint64_t v47 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 104);
        v47(v14, v38, v4);
        sub_1A9426AD8(&qword_1E97ED390, MEMORY[0x1E4FB5E30]);
        sub_1A9631FA0();
        sub_1A9631FA0();
        int v39 = v59;
        uint64_t v40 = v14;
        int v41 = v58;
        uint64_t v42 = *(void (**)(void))(v5 + 8);
        uint64_t v48 = v40;
        uint64_t v49 = v42;
        v42();
        v17(v8, a2, v4);
        if (v39 == v41)
        {
          uint64_t v30 = v8;
          goto LABEL_20;
        }
        uint64_t v44 = v48;
        v47(v48, *MEMORY[0x1E4FB5E18], v4);
        sub_1A9631FA0();
        sub_1A9631FA0();
        BOOL v23 = v57 == v56;
        unint64_t v45 = v44;
        uint64_t v36 = v49;
        ((void (*)(char *, uint64_t))v49)(v45, v4);
        uint64_t v37 = v8;
LABEL_29:
        ((void (*)(char *, uint64_t))v36)(v37, v4);
        return v23;
      }
      if (v18 != *MEMORY[0x1E4FB5DF8] && v18 != *MEMORY[0x1E4FB5E18])
      {
        if (v18 != *MEMORY[0x1E4FB5DE0]) {
          (*(void (**)(char *, uint64_t))(v5 + 8))(v16, v4);
        }
        return 0;
      }
      (*(void (**)(char *))(v5 + 104))(v14);
      sub_1A9426AD8(&qword_1E97ED390, MEMORY[0x1E4FB5E30]);
      sub_1A9631FA0();
      sub_1A9631FA0();
      int v32 = v61;
      int v33 = v60;
LABEL_27:
      BOOL v23 = v32 == v33;
      (*(void (**)(char *, uint64_t))(v5 + 8))(v14, v4);
      return v23;
    }
  }
  return 0;
}

uint64_t sub_1A96267B0@<X0>(unsigned int *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E97ED328);
  MEMORY[0x1F4188790](v4 - 8);
  uint64_t v6 = (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1AD0F5130](*a1);
  swift_retain();
  sub_1A9621A38((uint64_t)v6, a2);
  return sub_1A94179C4((uint64_t)v6, &qword_1E97ED328);
}

uint64_t sub_1A9626888@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_1A962FF80();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_1A9626F10(a1, MEMORY[0x1E4FB5CF8], (uint64_t)sub_1A96276F8, (uint64_t (*)(uint64_t))sub_1A9621124);
  sub_1A9630500();
  sub_1A96269D0((uint64_t)v7, &v12);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  char v10 = v12;
  *(void *)a2 = v8;
  *(unsigned char *)(a2 + 8) = v10;
  return result;
}

uint64_t sub_1A96269D0@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  uint64_t v4 = sub_1A962FF80();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v5 + 88))(v7, v4);
  if (result == *MEMORY[0x1E4FB5AD8])
  {
    char v9 = 6;
  }
  else
  {
    if (result == *MEMORY[0x1E4FB5AC8])
    {
      *a2 = 0;
      return result;
    }
    if (result == *MEMORY[0x1E4FB5AC0])
    {
      char v9 = 2;
    }
    else if (result == *MEMORY[0x1E4FB5AB0])
    {
      char v9 = 3;
    }
    else if (result == *MEMORY[0x1E4FB5AE8] || result == *MEMORY[0x1E4FB5B00])
    {
      char v9 = 4;
    }
    else if (result == *MEMORY[0x1E4FB5AA8])
    {
      char v9 = 7;
    }
    else if (result == *MEMORY[0x1E4FB5AF0])
    {
      char v9 = 8;
    }
    else if (result == *MEMORY[0x1E4FB5AE0] || result == *MEMORY[0x1E4FB5B08])
    {
      char v9 = 9;
    }
    else if (result == *MEMORY[0x1E4FB5AF8])
    {
      char v9 = 11;
    }
    else if (result == *MEMORY[0x1E4FB5B10])
    {
      char v9 = 10;
    }
    else if (result == *MEMORY[0x1E4FB5B18])
    {
      char v9 = 12;
    }
    else if (result == *MEMORY[0x1E4FB5AD0])
    {
      char v9 = 13;
    }
    else
    {
      if (result != *MEMORY[0x1E4FB5AB8])
      {
        *a2 = 9;
        return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
      }
      char v9 = 14;
    }
  }
  *a2 = v9;
  return result;
}

uint64_t sub_1A9626C74@<X0>(unsigned int *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E97ED330);
  MEMORY[0x1F4188790](v4 - 8);
  uint64_t v6 = (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1AD0F45B0](*a1);
  swift_retain();
  sub_1A9621BD8((uint64_t)v6, a2);
  return sub_1A94179C4((uint64_t)v6, &qword_1E97ED330);
}

uint64_t sub_1A9626D4C@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = sub_1A962FD50();
  uint64_t v17 = result;
  if (v5)
  {
    uint64_t v6 = v5;
    sub_1A9626EA0(a1, MEMORY[0x1E4FB5A28], (void (*)(uint64_t *__return_ptr, int *))sub_1A9627768);
    uint64_t v16 = v7;
    uint64_t v8 = MEMORY[0x1AD0F3E20]();
    uint64_t v10 = v9;
    uint64_t v11 = MEMORY[0x1AD0F3E00]();
    uint64_t v13 = v12;
    sub_1A9626EA0(a1, MEMORY[0x1E4FB5A18], (void (*)(uint64_t *__return_ptr, int *))sub_1A962773C);
    uint64_t v15 = v14;
    uint64_t result = sub_1A9626F10(a1, MEMORY[0x1E4FB5A10], (uint64_t)sub_1A9627714, (uint64_t (*)(uint64_t))sub_1A96213EC);
    *a2 = v17;
    a2[1] = v6;
    a2[2] = v16;
    a2[3] = v8;
    a2[4] = v10;
    a2[5] = v11;
    a2[6] = v13;
    a2[7] = v15;
    a2[8] = result;
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_1A9626EA0(uint64_t a1, uint64_t (*a2)(void), void (*a3)(uint64_t *__return_ptr, int *))
{
  uint64_t v5 = a2();
  if ((v5 & 0x80000000) != 0)
  {
    __break(1u);
  }
  else
  {
    MEMORY[0x1F4188790](v5);
    OUTLINED_FUNCTION_51_5();
    *(void *)(v6 - 16) = a1;
    sub_1A96212A8(a3, v8, v7 << 32);
  }
}

uint64_t sub_1A9626F10(uint64_t a1, uint64_t (*a2)(void), uint64_t a3, uint64_t (*a4)(uint64_t))
{
  uint64_t v7 = v4;
  uint64_t result = a2();
  if ((result & 0x80000000) != 0)
  {
    __break(1u);
  }
  else
  {
    MEMORY[0x1F4188790](result);
    OUTLINED_FUNCTION_51_5();
    *(void *)(v10 - 16) = a1;
    *(void *)(v10 - 8) = v7;
    return a4(a3);
  }
  return result;
}

uint64_t sub_1A9626F8C@<X0>(unsigned int *a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E97ED2F8);
  MEMORY[0x1F4188790](v6 - 8);
  uint64_t v8 = &v10[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x1AD0F3E30](*a1);
  uint64_t v11 = sub_1A9627730;
  uint64_t v12 = a2;
  swift_retain();
  sub_1A96270EC((uint64_t)v8, (void (*)(char *))sub_1A9627734, a3);
  sub_1A94179C4((uint64_t)v8, &qword_1E97ED2F8);
  return swift_release();
}

uint64_t sub_1A9627098@<X0>(void (*a1)(void)@<X1>, uint64_t a2@<X8>)
{
  a1();
  uint64_t v3 = sub_1A962E850();
  return __swift_storeEnumTagSinglePayload(a2, 0, 1, v3);
}

uint64_t sub_1A96270EC@<X0>(uint64_t a1@<X0>, void (*a2)(char *)@<X1>, uint64_t a3@<X8>)
{
  uint64_t v15 = a2;
  uint64_t v5 = sub_1A96310E0();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  uint64_t v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E97ED2F8);
  MEMORY[0x1F4188790](v9 - 8);
  uint64_t v11 = (char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A9417B8C(a1, (uint64_t)v11, &qword_1E97ED2F8);
  if (__swift_getEnumTagSinglePayload((uint64_t)v11, 1, v5) == 1)
  {
    uint64_t v12 = sub_1A962E850();
    return __swift_storeEnumTagSinglePayload(a3, 1, 1, v12);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v8, v11, v5);
    v15(v8);
    return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }
}

double sub_1A96272A0@<D0>(double *a1@<X8>)
{
  double v2 = MEMORY[0x1AD0F4DA0]();
  double v3 = MEMORY[0x1AD0F4DA0]();
  double v4 = MEMORY[0x1AD0F4DA0]();
  double v5 = MEMORY[0x1AD0F4D70]();
  double v6 = MEMORY[0x1AD0F4D60]();
  double result = MEMORY[0x1AD0F4D80]();
  *a1 = v2;
  a1[1] = v3;
  a1[2] = v4;
  a1[3] = v5;
  a1[4] = v6;
  a1[5] = result;
  return result;
}

void sub_1A9627318()
{
  OUTLINED_FUNCTION_3();
  double v3 = v2;
  double v5 = v4;
  uint64_t v20 = sub_1A9630C80();
  OUTLINED_FUNCTION_1();
  uint64_t v7 = v6;
  MEMORY[0x1F4188790](v8);
  OUTLINED_FUNCTION_2_33();
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6DAA58);
  uint64_t v10 = OUTLINED_FUNCTION_2_0(v9);
  MEMORY[0x1F4188790](v10);
  OUTLINED_FUNCTION_568();
  uint64_t v11 = sub_1A9630CF0();
  OUTLINED_FUNCTION_1();
  MEMORY[0x1F4188790](v12);
  OUTLINED_FUNCTION_2_26();
  v3(*v5);
  uint64_t v13 = OUTLINED_FUNCTION_34_6();
  if (__swift_getEnumTagSinglePayload(v13, v14, v11) == 1)
  {
    sub_1A94179C4(v0, &qword_1EB6DAA58);
  }
  else
  {
    OUTLINED_FUNCTION_29();
    v15();
    sub_1A9630CD0();
    sub_1A941CDC8(v1, (char *)v21);
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v1, v20);
    uint64_t v16 = 0xE500000000000000;
    uint64_t v17 = 0x7261656C63;
    switch(LOBYTE(v21[0]))
    {
      case 1:
        uint64_t v17 = 0x646578696DLL;
        break;
      case 2:
        uint64_t v16 = 0xED00006E6F697461;
        uint64_t v17 = 0x7469706963657270;
        break;
      case 3:
        uint64_t v16 = 0xE400000000000000;
        uint64_t v17 = 1852399986;
        break;
      case 4:
        uint64_t v16 = 0xE400000000000000;
        uint64_t v17 = 2003791475;
        break;
      case 5:
        uint64_t v17 = 0x7465656C73;
        break;
      case 6:
        uint64_t v16 = 0xE400000000000000;
        uint64_t v17 = 1818845544;
        break;
      case 7:
        uint64_t v16 = 0xE700000000000000;
        uint64_t v17 = 0x6E776F6E6B6E75;
        break;
      default:
        break;
    }
    sub_1A96272A0((double *)v21);
    sub_1A9483B64(v21, v17, v16);
    swift_bridgeObjectRelease();
    uint64_t v18 = OUTLINED_FUNCTION_60_3();
    v19(v18);
  }
  OUTLINED_FUNCTION_4_0();
}

uint64_t sub_1A96275AC@<X0>(unsigned int *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_1A96223E0(a1, *(void *)(v2 + 24), *(void *)(v2 + 32), a2);
}

uint64_t sub_1A96275CC@<X0>(uint64_t a1@<X8>)
{
  return sub_1A96224D0(*(void *)(v1 + 24), a1);
}

uint64_t sub_1A96275FC()
{
  return sub_1A9625470();
}

uint64_t sub_1A9627618(unsigned int *a1)
{
  return sub_1A9623A1C(a1);
}

uint64_t sub_1A9627634@<X0>(char *a1@<X8>)
{
  return sub_1A962518C(a1);
}

unint64_t sub_1A9627650()
{
  unint64_t result = qword_1EB6DB008;
  if (!qword_1EB6DB008)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EB6DB010);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB6DB008);
  }
  return result;
}

uint64_t sub_1A96276A4(unsigned int *a1)
{
  return sub_1A96234A4(a1);
}

uint64_t sub_1A96276C0(unsigned int *a1)
{
  return sub_1A9623610(a1);
}

uint64_t sub_1A96276DC@<X0>(unsigned int *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_1A96267B0(a1, a2);
}

uint64_t sub_1A96276F8@<X0>(unsigned int *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_1A9626C74(a1, a2);
}

uint64_t sub_1A9627714@<X0>(unsigned int *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_1A9626F8C(a1, *(void *)(v2 + 24), a2);
}

uint64_t sub_1A9627734@<X0>(uint64_t a1@<X8>)
{
  return sub_1A9627098(*(void (**)(void))(v1 + 16), a1);
}

uint64_t sub_1A962773C@<X0>(unsigned int *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_1A9627794(a1, MEMORY[0x1E4FB5A30], a2);
}

uint64_t sub_1A9627768@<X0>(unsigned int *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_1A9627794(a1, MEMORY[0x1E4FB5A20], a2);
}

uint64_t sub_1A9627794@<X0>(unsigned int *a1@<X0>, uint64_t (*a2)(void)@<X1>, uint64_t *a3@<X8>)
{
  uint64_t result = a2(*a1);
  *a3 = result;
  a3[1] = v5;
  return result;
}

uint64_t sub_1A96277D8(unsigned int *a1)
{
  return sub_1A9623148(a1);
}

uint64_t sub_1A96277F4@<X0>(unsigned int *a1@<X0>, void *a2@<X8>)
{
  return sub_1A9622808(a1, a2);
}

uint64_t sub_1A9627810@<X0>(unsigned int *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_1A9622B64(a1, a2);
}

void sub_1A962782C()
{
}

uint64_t sub_1A962785C(unsigned int *a1)
{
  return sub_1A9625968(a1);
}

uint64_t sub_1A9627878(uint64_t a1, unsigned int *a2)
{
  return sub_1A9625D30(a1, a2, *(void *)(v2 + 16), *(void *)(v2 + 24));
}

void sub_1A9627894()
{
}

void sub_1A96278C4()
{
}

void sub_1A96278F4()
{
}

void sub_1A9627924()
{
}

void sub_1A9627954()
{
}

void sub_1A9627984()
{
}

void sub_1A96279B4()
{
}

BOOL static Swell.== infix(_:_:)(double *a1, double *a2)
{
  return *a1 == *a2 && a1[1] == a2[1] && a1[2] == a2[2];
}

double Swell.height.getter()
{
  return *(double *)v0;
}

void Swell.height.setter(double a1)
{
  *uint64_t v1 = a1;
}

uint64_t (*Swell.height.modify())(void)
{
  return nullsub_1;
}

double Swell.direction.getter()
{
  return *(double *)(v0 + 8);
}

void Swell.direction.setter(double a1)
{
  *(double *)(v1 + 8) = a1;
}

uint64_t (*Swell.direction.modify())(void)
{
  return nullsub_1;
}

double Swell.timeIntervalSeconds.getter()
{
  return *(double *)(v0 + 16);
}

void Swell.timeIntervalSeconds.setter(double a1)
{
  *(double *)(v1 + 16) = a1;
}

uint64_t (*Swell.timeIntervalSeconds.modify())(void)
{
  return nullsub_1;
}

uint64_t sub_1A9627AA4(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x746867696568 && a2 == 0xE600000000000000;
  if (v2 || (sub_1A96327D0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    BOOL v6 = a1 == 0x6F69746365726964 && a2 == 0xE90000000000006ELL;
    if (v6 || (sub_1A96327D0() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else if (a1 == 0xD000000000000013 && a2 == 0x80000001A9649460)
    {
      swift_bridgeObjectRelease();
      return 2;
    }
    else
    {
      char v7 = sub_1A96327D0();
      swift_bridgeObjectRelease();
      if (v7) {
        return 2;
      }
      else {
        return 3;
      }
    }
  }
}

uint64_t sub_1A9627BF8(char a1)
{
  if (!a1) {
    return 0x746867696568;
  }
  if (a1 == 1) {
    return 0x6F69746365726964;
  }
  return 0xD000000000000013;
}

uint64_t sub_1A9627C54()
{
  return sub_1A9627BF8(*v0);
}

uint64_t sub_1A9627C5C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1A9627AA4(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1A9627C84(uint64_t a1)
{
  unint64_t v2 = sub_1A9627E48();
  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1A9627CC0(uint64_t a1)
{
  unint64_t v2 = sub_1A9627E48();
  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t Swell.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E97ED3A0);
  OUTLINED_FUNCTION_1();
  uint64_t v5 = v4;
  MEMORY[0x1F4188790](v6);
  uint64_t v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1A9627E48();
  sub_1A9632970();
  char v13 = 0;
  OUTLINED_FUNCTION_2_2();
  if (!v1)
  {
    char v12 = 1;
    OUTLINED_FUNCTION_2_2();
    char v11 = 2;
    OUTLINED_FUNCTION_2_2();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v8, v3);
}

unint64_t sub_1A9627E48()
{
  unint64_t result = qword_1E97ED3A8;
  if (!qword_1E97ED3A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97ED3A8);
  }
  return result;
}

uint64_t Swell.init(from:)@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E97ED3B0);
  OUTLINED_FUNCTION_1();
  MEMORY[0x1F4188790](v5);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1A9627E48();
  sub_1A9632950();
  if (!v2)
  {
    OUTLINED_FUNCTION_1_19();
    uint64_t v7 = v6;
    OUTLINED_FUNCTION_1_19();
    uint64_t v10 = v9;
    OUTLINED_FUNCTION_1_19();
    uint64_t v12 = v11;
    uint64_t v13 = OUTLINED_FUNCTION_12_0();
    v14(v13);
    *a2 = v7;
    a2[1] = v10;
    a2[2] = v12;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_1A962800C@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  return Swell.init(from:)(a1, a2);
}

uint64_t sub_1A9628024(void *a1)
{
  return Swell.encode(to:)(a1);
}

ValueMetadata *type metadata accessor for Swell()
{
  return &type metadata for Swell;
}

unsigned char *storeEnumTagSinglePayload for Swell.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1A962811CLL);
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

ValueMetadata *type metadata accessor for Swell.CodingKeys()
{
  return &type metadata for Swell.CodingKeys;
}

unint64_t sub_1A9628158()
{
  unint64_t result = qword_1E97ED3B8;
  if (!qword_1E97ED3B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97ED3B8);
  }
  return result;
}

unint64_t sub_1A96281A8()
{
  unint64_t result = qword_1E97ED3C0;
  if (!qword_1E97ED3C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97ED3C0);
  }
  return result;
}

unint64_t sub_1A96281F8()
{
  unint64_t result = qword_1E97ED3C8;
  if (!qword_1E97ED3C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97ED3C8);
  }
  return result;
}

double DayPartForecast.init(forecastStart:forecastEnd:period:cloudCover:cloudCoverLowAltPct:cloudCoverMidAltPct:cloudCoverHighAltPct:conditionCode:humidityMax:humidityMin:temperatureMax:temperatureMin:precipitationAmount:precipitationAmountByType:precipitationChance:precipitationType:snowfallAmount:visibilityMax:visibilityMin:windDirection:windGustSpeedMax:windSpeed:windSpeedMax:humidity:precipitationIntensityMax:perceivedPrecipitationIntensityMax:uvIndexMin:uvIndexMax:temperatureApparentMin:temperatureApparentMax:daylight:)@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char *a3@<X2>, char *a4@<X3>, uint64_t a5@<X4>, char a6@<W5>, uint64_t a7@<X6>, char *a8@<X7>, uint64_t a9@<X8>, double a10@<D0>, double a11@<D1>, double a12@<D2>, double a13@<D3>, double a14@<D4>, double a15@<D5>, double a16@<D6>, double a17@<D7>, uint64_t a18, uint64_t a19, char a20,uint64_t a21,uint64_t a22,uint64_t a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,double a34,char a35)
{
  char v41 = *a3;
  char v52 = *a4;
  char v54 = *a8;
  uint64_t v42 = (int *)type metadata accessor for DayPartForecast();
  uint64_t v43 = v42[6];
  uint64_t v44 = a9 + v42[16];
  uint64_t v53 = v42[19];
  uint64_t v45 = a9 + v42[20];
  uint64_t v46 = a9 + v42[23];
  uint64_t v47 = sub_1A962E810();
  OUTLINED_FUNCTION_10();
  uint64_t v49 = *(void (**)(uint64_t, uint64_t, uint64_t))(v48 + 32);
  v49(a9, a1, v47);
  v49(a9 + v42[5], a2, v47);
  *(unsigned char *)(a9 + v43) = v41;
  *(double *)(a9 + v42[7]) = a10;
  *(double *)(a9 + v42[8]) = a11;
  *(double *)(a9 + v42[9]) = a12;
  *(double *)(a9 + v42[10]) = a13;
  *(unsigned char *)(a9 + v42[11]) = v52;
  *(double *)(a9 + v42[12]) = a14;
  *(double *)(a9 + v42[13]) = a15;
  *(double *)(a9 + v42[14]) = a16;
  *(double *)(a9 + v42[15]) = a17;
  *(void *)uint64_t v44 = a5;
  *(unsigned char *)(v44 + 8) = a6 & 1;
  *(void *)(a9 + v42[17]) = a7;
  *(void *)(a9 + v42[18]) = a18;
  *(unsigned char *)(a9 + v53) = v54;
  *(void *)uint64_t v45 = a19;
  *(unsigned char *)(v45 + 8) = a20 & 1;
  *(void *)(a9 + v42[21]) = a21;
  *(void *)(a9 + v42[22]) = a22;
  *(void *)uint64_t v46 = a23;
  *(unsigned char *)(v46 + 8) = a24 & 1;
  *(void *)(a9 + v42[24]) = a25;
  *(void *)(a9 + v42[25]) = a26;
  *(void *)(a9 + v42[26]) = a27;
  *(void *)(a9 + v42[27]) = a28;
  *(void *)(a9 + v42[28]) = a29;
  *(void *)(a9 + v42[29]) = a30;
  *(void *)(a9 + v42[30]) = a31;
  *(void *)(a9 + v42[31]) = a32;
  *(void *)(a9 + v42[32]) = a33;
  double result = a34;
  *(double *)(a9 + v42[33]) = a34;
  *(unsigned char *)(a9 + v42[34]) = a35;
  return result;
}

uint64_t DayPartForecast.forecastStart.getter@<X0>(uint64_t a1@<X8>)
{
  sub_1A962E810();
  OUTLINED_FUNCTION_10();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 16);
  return v5(a1, v1, v3);
}

uint64_t DayPartForecast.forecastStart.setter(uint64_t a1)
{
  sub_1A962E810();
  OUTLINED_FUNCTION_10();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 40);
  return v5(v1, a1, v3);
}

uint64_t (*DayPartForecast.forecastStart.modify())(void)
{
  return nullsub_1;
}

uint64_t DayPartForecast.forecastEnd.getter()
{
  uint64_t v2 = v1 + *(int *)(OUTLINED_FUNCTION_24_10() + 20);
  sub_1A962E810();
  OUTLINED_FUNCTION_10();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 16);
  return v5(v0, v2, v3);
}

uint64_t DayPartForecast.forecastEnd.setter()
{
  uint64_t v2 = v1 + *(int *)(OUTLINED_FUNCTION_2_49() + 20);
  sub_1A962E810();
  OUTLINED_FUNCTION_10();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 40);
  return v5(v2, v0, v3);
}

uint64_t (*DayPartForecast.forecastEnd.modify())(void)
{
  return nullsub_1;
}

uint64_t DayPartForecast.period.getter()
{
  uint64_t result = OUTLINED_FUNCTION_24_10();
  *uint64_t v0 = *(unsigned char *)(v1 + *(int *)(result + 24));
  return result;
}

uint64_t DayPartForecast.period.setter(char *a1)
{
  char v2 = *a1;
  uint64_t result = type metadata accessor for DayPartForecast();
  *(unsigned char *)(v1 + *(int *)(result + 24)) = v2;
  return result;
}

uint64_t (*DayPartForecast.period.modify())(void)
{
  return nullsub_1;
}

uint64_t DayPartForecast.cloudCover.setter()
{
  uint64_t result = OUTLINED_FUNCTION_3_46();
  *(void *)(v0 + *(int *)(result + 28)) = v1;
  return result;
}

uint64_t (*DayPartForecast.cloudCover.modify())(void)
{
  return nullsub_1;
}

uint64_t DayPartForecast.cloudCoverLowAltPct.setter()
{
  uint64_t result = OUTLINED_FUNCTION_3_46();
  *(void *)(v0 + *(int *)(result + 32)) = v1;
  return result;
}

uint64_t (*DayPartForecast.cloudCoverLowAltPct.modify())(void)
{
  return nullsub_1;
}

uint64_t DayPartForecast.cloudCoverMidAltPct.setter()
{
  uint64_t result = OUTLINED_FUNCTION_3_46();
  *(void *)(v0 + *(int *)(result + 36)) = v1;
  return result;
}

uint64_t (*DayPartForecast.cloudCoverMidAltPct.modify())(void)
{
  return nullsub_1;
}

uint64_t DayPartForecast.cloudCoverHighAltPct.setter()
{
  uint64_t result = OUTLINED_FUNCTION_3_46();
  *(void *)(v0 + *(int *)(result + 40)) = v1;
  return result;
}

uint64_t (*DayPartForecast.cloudCoverHighAltPct.modify())(void)
{
  return nullsub_1;
}

uint64_t DayPartForecast.conditionCode.setter(char *a1)
{
  char v2 = *a1;
  uint64_t result = type metadata accessor for DayPartForecast();
  *(unsigned char *)(v1 + *(int *)(result + 44)) = v2;
  return result;
}

uint64_t (*DayPartForecast.conditionCode.modify())(void)
{
  return nullsub_1;
}

uint64_t DayPartForecast.humidityMax.setter()
{
  uint64_t result = OUTLINED_FUNCTION_3_46();
  *(void *)(v0 + *(int *)(result + 48)) = v1;
  return result;
}

uint64_t (*DayPartForecast.humidityMax.modify())(void)
{
  return nullsub_1;
}

uint64_t DayPartForecast.humidityMin.setter()
{
  uint64_t result = OUTLINED_FUNCTION_3_46();
  *(void *)(v0 + *(int *)(result + 52)) = v1;
  return result;
}

uint64_t (*DayPartForecast.humidityMin.modify())(void)
{
  return nullsub_1;
}

uint64_t DayPartForecast.temperatureMax.setter()
{
  uint64_t result = OUTLINED_FUNCTION_3_46();
  *(void *)(v0 + *(int *)(result + 56)) = v1;
  return result;
}

uint64_t (*DayPartForecast.temperatureMax.modify())(void)
{
  return nullsub_1;
}

uint64_t DayPartForecast.temperatureMin.setter()
{
  uint64_t result = OUTLINED_FUNCTION_3_46();
  *(void *)(v0 + *(int *)(result + 60)) = v1;
  return result;
}

uint64_t (*DayPartForecast.temperatureMin.modify())(void)
{
  return nullsub_1;
}

void DayPartForecast.precipitationAmount.setter()
{
  uint64_t v0 = OUTLINED_FUNCTION_22_13();
  OUTLINED_FUNCTION_10_1(*(int *)(v0 + 64));
}

uint64_t (*DayPartForecast.precipitationAmount.modify())(void)
{
  return nullsub_1;
}

uint64_t DayPartForecast.precipitationAmountByType.setter()
{
  uint64_t v2 = *(int *)(OUTLINED_FUNCTION_2_49() + 68);
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + v2) = v0;
  return result;
}

uint64_t (*DayPartForecast.precipitationAmountByType.modify())(void)
{
  return nullsub_1;
}

uint64_t DayPartForecast.precipitationChance.setter()
{
  uint64_t result = OUTLINED_FUNCTION_3_46();
  *(void *)(v0 + *(int *)(result + 72)) = v1;
  return result;
}

uint64_t (*DayPartForecast.precipitationChance.modify())(void)
{
  return nullsub_1;
}

uint64_t DayPartForecast.precipitationType.setter(char *a1)
{
  char v2 = *a1;
  uint64_t result = type metadata accessor for DayPartForecast();
  *(unsigned char *)(v1 + *(int *)(result + 76)) = v2;
  return result;
}

uint64_t (*DayPartForecast.precipitationType.modify())(void)
{
  return nullsub_1;
}

uint64_t DayPartForecast.snowfallAmount.getter()
{
  uint64_t v1 = type metadata accessor for DayPartForecast();
  return OUTLINED_FUNCTION_9_1(v0 + *(int *)(v1 + 80));
}

void DayPartForecast.snowfallAmount.setter()
{
  uint64_t v0 = OUTLINED_FUNCTION_22_13();
  OUTLINED_FUNCTION_10_1(*(int *)(v0 + 80));
}

uint64_t (*DayPartForecast.snowfallAmount.modify())(void)
{
  return nullsub_1;
}

uint64_t DayPartForecast.visibilityMax.setter()
{
  uint64_t result = OUTLINED_FUNCTION_3_46();
  *(void *)(v0 + *(int *)(result + 84)) = v1;
  return result;
}

uint64_t (*DayPartForecast.visibilityMax.modify())(void)
{
  return nullsub_1;
}

uint64_t DayPartForecast.visibilityMin.setter()
{
  uint64_t result = OUTLINED_FUNCTION_3_46();
  *(void *)(v0 + *(int *)(result + 88)) = v1;
  return result;
}

uint64_t (*DayPartForecast.visibilityMin.modify())(void)
{
  return nullsub_1;
}

void DayPartForecast.windDirection.setter()
{
  uint64_t v0 = OUTLINED_FUNCTION_22_13();
  OUTLINED_FUNCTION_10_1(*(int *)(v0 + 92));
}

uint64_t (*DayPartForecast.windDirection.modify())(void)
{
  return nullsub_1;
}

uint64_t DayPartForecast.windGustSpeedMax.setter()
{
  uint64_t result = OUTLINED_FUNCTION_3_46();
  *(void *)(v0 + *(int *)(result + 96)) = v1;
  return result;
}

uint64_t (*DayPartForecast.windGustSpeedMax.modify())(void)
{
  return nullsub_1;
}

uint64_t DayPartForecast.windSpeed.setter()
{
  uint64_t result = OUTLINED_FUNCTION_3_46();
  *(void *)(v0 + *(int *)(result + 100)) = v1;
  return result;
}

uint64_t (*DayPartForecast.windSpeed.modify())(void)
{
  return nullsub_1;
}

uint64_t DayPartForecast.windSpeedMax.setter()
{
  uint64_t result = OUTLINED_FUNCTION_3_46();
  *(void *)(v0 + *(int *)(result + 104)) = v1;
  return result;
}

uint64_t (*DayPartForecast.windSpeedMax.modify())(void)
{
  return nullsub_1;
}

double DayPartForecast.humidity.getter()
{
  return *(double *)(v0 + *(int *)(type metadata accessor for DayPartForecast() + 108));
}

uint64_t DayPartForecast.humidity.setter()
{
  uint64_t result = OUTLINED_FUNCTION_3_46();
  *(void *)(v0 + *(int *)(result + 108)) = v1;
  return result;
}

uint64_t (*DayPartForecast.humidity.modify())(void)
{
  return nullsub_1;
}

double DayPartForecast.precipitationIntensityMax.getter()
{
  return *(double *)(v0 + *(int *)(type metadata accessor for DayPartForecast() + 112));
}

uint64_t DayPartForecast.precipitationIntensityMax.setter()
{
  uint64_t result = OUTLINED_FUNCTION_3_46();
  *(void *)(v0 + *(int *)(result + 112)) = v1;
  return result;
}

uint64_t (*DayPartForecast.precipitationIntensityMax.modify())(void)
{
  return nullsub_1;
}

double DayPartForecast.perceivedPrecipitationIntensityMax.getter()
{
  return *(double *)(v0 + *(int *)(type metadata accessor for DayPartForecast() + 116));
}

uint64_t DayPartForecast.perceivedPrecipitationIntensityMax.setter()
{
  uint64_t result = OUTLINED_FUNCTION_3_46();
  *(void *)(v0 + *(int *)(result + 116)) = v1;
  return result;
}

uint64_t (*DayPartForecast.perceivedPrecipitationIntensityMax.modify())(void)
{
  return nullsub_1;
}

double DayPartForecast.uvIndexMin.getter()
{
  return *(double *)(v0 + *(int *)(type metadata accessor for DayPartForecast() + 120));
}

uint64_t DayPartForecast.uvIndexMin.setter()
{
  uint64_t result = OUTLINED_FUNCTION_3_46();
  *(void *)(v0 + *(int *)(result + 120)) = v1;
  return result;
}

uint64_t (*DayPartForecast.uvIndexMin.modify())(void)
{
  return nullsub_1;
}

double DayPartForecast.uvIndexMax.getter()
{
  return *(double *)(v0 + *(int *)(type metadata accessor for DayPartForecast() + 124));
}

uint64_t DayPartForecast.uvIndexMax.setter()
{
  uint64_t result = OUTLINED_FUNCTION_3_46();
  *(void *)(v0 + *(int *)(result + 124)) = v1;
  return result;
}

uint64_t (*DayPartForecast.uvIndexMax.modify())(void)
{
  return nullsub_1;
}

double DayPartForecast.temperatureApparentMin.getter()
{
  return *(double *)(v0 + *(int *)(type metadata accessor for DayPartForecast() + 128));
}

uint64_t DayPartForecast.temperatureApparentMin.setter()
{
  uint64_t result = OUTLINED_FUNCTION_3_46();
  *(void *)(v0 + *(int *)(result + 128)) = v1;
  return result;
}

uint64_t (*DayPartForecast.temperatureApparentMin.modify())(void)
{
  return nullsub_1;
}

double DayPartForecast.temperatureApparentMax.getter()
{
  return *(double *)(v0 + *(int *)(type metadata accessor for DayPartForecast() + 132));
}

uint64_t DayPartForecast.temperatureApparentMax.setter()
{
  uint64_t result = OUTLINED_FUNCTION_3_46();
  *(void *)(v0 + *(int *)(result + 132)) = v1;
  return result;
}

uint64_t (*DayPartForecast.temperatureApparentMax.modify())(void)
{
  return nullsub_1;
}

uint64_t DayPartForecast.daylight.getter()
{
  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for DayPartForecast() + 136));
}

uint64_t DayPartForecast.daylight.setter(char a1)
{
  uint64_t result = type metadata accessor for DayPartForecast();
  *(unsigned char *)(v1 + *(int *)(result + 136)) = a1;
  return result;
}

uint64_t (*DayPartForecast.daylight.modify())(void)
{
  return nullsub_1;
}

void DayPartForecast.init(period:cloudCover:cloudCoverLowAltPct:cloudCoverMidAltPct:cloudCoverHighAltPct:conditionCode:humidityMax:humidityMin:temperatureMax:temperatureMin:precipitationAmount:precipitationAmountByType:precipitationChance:precipitationType:snowfallAmount:visibilityMax:visibilityMin:windDirection:windGustSpeedMax:windSpeed:windSpeedMax:humidity:)(double a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8, uint64_t a9, uint64_t a10, uint64_t a11, char a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25)
{
  OUTLINED_FUNCTION_13_22();
  OUTLINED_FUNCTION_17_17();
  OUTLINED_FUNCTION_12_22();
  sub_1A962E800();
  OUTLINED_FUNCTION_5_43(v30, v31, v32, v33, v34, v35, v36, v37, v39, v41);
  *(double *)(v25 + v38) = a8;
  *(void *)uint64_t v27 = a11;
  *(unsigned char *)(v27 + 8) = a12 & 1;
  OUTLINED_FUNCTION_26_10(v26[17]);
  *int v28 = a15;
  OUTLINED_FUNCTION_15_18(a16, v40, v42, v43);
  *(void *)uint64_t v29 = a20;
  *(unsigned char *)(v29 + 8) = a21 & 1;
  *(void *)(v25 + v26[24]) = a22;
  *(void *)(v25 + v26[25]) = a23;
  *(void *)(v25 + v26[26]) = a24;
  *(void *)(v25 + v26[27]) = a25;
  OUTLINED_FUNCTION_7_33();
}

uint64_t DayPartForecast.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v89 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6DE3A0);
  MEMORY[0x1F4188790](v3 - 8);
  char v90 = (char *)&v70 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v5);
  uint64_t v91 = (uint64_t)&v70 - v6;
  uint64_t v7 = sub_1A962E810();
  OUTLINED_FUNCTION_1();
  double v92 = v8;
  MEMORY[0x1F4188790](v9);
  uint64_t v11 = (char *)&v70 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v12);
  uint64_t v14 = (char *)&v70 - v13;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6DC300);
  OUTLINED_FUNCTION_1();
  uint64_t v16 = v15;
  MEMORY[0x1F4188790](v17);
  uint64_t v18 = a1[3];
  char v93 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v18);
  sub_1A962A058();
  uint64_t v19 = v94;
  sub_1A9632950();
  if (v19) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v93);
  }
  uint64_t v87 = 0;
  uint64_t v94 = v16;
  LOBYTE(v101) = 0;
  sub_1A947198C(&qword_1EB6DC8D8);
  uint64_t v20 = v91;
  sub_1A96325D0();
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload(v20, 1, v7);
  uint64_t v22 = v7;
  char v88 = v14;
  if (EnumTagSinglePayload == 1)
  {
    sub_1A962E800();
    sub_1A9471308(v91);
    uint64_t v23 = (uint64_t)v11;
    double v24 = v92;
  }
  else
  {
    double v24 = v92;
    (*(void (**)(char *, uint64_t, uint64_t))(*(void *)&v92 + 32))(v14, v91, v22);
    uint64_t v23 = (uint64_t)v11;
  }
  uint64_t v25 = (uint64_t)v90;
  LOBYTE(v101) = 1;
  sub_1A96325D0();
  if (__swift_getEnumTagSinglePayload(v25, 1, v22) == 1)
  {
    sub_1A962E800();
    sub_1A9471308(v25);
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)&v24 + 32))(v23, v25, v22);
  }
  uint64_t v26 = v87;
  LOBYTE(v99) = 2;
  sub_1A962A0A4();
  OUTLINED_FUNCTION_25_7();
  char v106 = v101 & 1;
  LOBYTE(v99) = 3;
  OUTLINED_FUNCTION_1_57();
  double v27 = OUTLINED_FUNCTION_10_11();
  double v28 = 0.0;
  if (v29) {
    double v30 = v27;
  }
  else {
    double v30 = 0.0;
  }
  LOBYTE(v99) = 4;
  OUTLINED_FUNCTION_1_57();
  double v31 = OUTLINED_FUNCTION_10_11();
  if (v29) {
    double v32 = v31;
  }
  else {
    double v32 = 0.0;
  }
  LOBYTE(v99) = 5;
  OUTLINED_FUNCTION_1_57();
  double v33 = OUTLINED_FUNCTION_10_11();
  if (v29) {
    double v34 = v33;
  }
  else {
    double v34 = 0.0;
  }
  LOBYTE(v99) = 6;
  OUTLINED_FUNCTION_1_57();
  double v35 = OUTLINED_FUNCTION_10_11();
  if (v29) {
    double v36 = v35;
  }
  else {
    double v36 = 0.0;
  }
  LOBYTE(v101) = 7;
  sub_1A9541C0C();
  sub_1A9632680();
  if (v26)
  {
    double v37 = *(void (**)(uint64_t, uint64_t))(*(void *)&v92 + 8);
    v37(v23, v22);
    v37((uint64_t)v88, v22);
    uint64_t v38 = OUTLINED_FUNCTION_8_26();
    v39(v38);
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v93);
  }
  v105[0] = v105[1];
  LOBYTE(v99) = 8;
  OUTLINED_FUNCTION_1_57();
  double v40 = OUTLINED_FUNCTION_10_11();
  if (v29) {
    double v41 = v40;
  }
  else {
    double v41 = 0.0;
  }
  LOBYTE(v99) = 9;
  OUTLINED_FUNCTION_1_57();
  double v42 = OUTLINED_FUNCTION_10_11();
  if (v29) {
    double v43 = v42;
  }
  else {
    double v43 = 0.0;
  }
  LOBYTE(v99) = 10;
  OUTLINED_FUNCTION_1_57();
  double v44 = OUTLINED_FUNCTION_10_11();
  if (v29) {
    double v45 = v44;
  }
  else {
    double v45 = 0.0;
  }
  LOBYTE(v99) = 11;
  OUTLINED_FUNCTION_1_57();
  double v46 = OUTLINED_FUNCTION_10_11();
  if (v29) {
    double v28 = v46;
  }
  LOBYTE(v99) = 12;
  OUTLINED_FUNCTION_1_57();
  uint64_t v91 = v101;
  LODWORD(v90) = v102;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6DD340);
  LOBYTE(v97) = 13;
  sub_1A957416C((unint64_t *)&unk_1EB6DD350, (void (*)(void))sub_1A957255C);
  sub_1A96325D0();
  uint64_t v47 = v99;
  if (!v99) {
    uint64_t v47 = sub_1A9631CC0();
  }
  LOBYTE(v99) = 14;
  sub_1A9632660();
  uint64_t v82 = v49;
  uint64_t v87 = v47;
  double v83 = v28;
  double v84 = v45;
  double v85 = v43;
  double v86 = *(double *)&v22;
  LOBYTE(v99) = 15;
  sub_1A9502638();
  OUTLINED_FUNCTION_25_7();
  v104[0] = v104[1];
  LOBYTE(v97) = 16;
  OUTLINED_FUNCTION_1_57();
  uint64_t v81 = v99;
  int v80 = v100;
  LOBYTE(v95) = 17;
  OUTLINED_FUNCTION_1_57();
  double v50 = *(double *)&v97;
  int v51 = v98;
  LOBYTE(v95) = 18;
  OUTLINED_FUNCTION_1_57();
  double v52 = *(double *)&v97;
  int v53 = v98;
  LOBYTE(v95) = 19;
  OUTLINED_FUNCTION_25_7();
  uint64_t v79 = v97;
  int v78 = v98;
  char v103 = 20;
  OUTLINED_FUNCTION_1_57();
  double v54 = v95;
  int v55 = v96;
  LOBYTE(v95) = 21;
  sub_1A9632660();
  double v92 = v41;
  double v57 = 0.0;
  if (v55) {
    double v58 = 0.0;
  }
  else {
    double v58 = v54;
  }
  double v86 = v58;
  if (v53) {
    double v59 = 0.0;
  }
  else {
    double v59 = v52;
  }
  uint64_t v77 = *(void *)&v59;
  if (v51) {
    double v60 = 0.0;
  }
  else {
    double v60 = v50;
  }
  uint64_t v76 = *(void *)&v60;
  char v103 = 22;
  uint64_t v75 = v56;
  sub_1A96325D0();
  uint64_t v74 = OUTLINED_FUNCTION_10_22();
  char v103 = 23;
  OUTLINED_FUNCTION_1_57();
  uint64_t v73 = OUTLINED_FUNCTION_10_22();
  char v103 = 24;
  OUTLINED_FUNCTION_1_57();
  uint64_t v72 = OUTLINED_FUNCTION_10_22();
  char v103 = 25;
  OUTLINED_FUNCTION_1_57();
  uint64_t v71 = OUTLINED_FUNCTION_10_22();
  char v103 = 26;
  OUTLINED_FUNCTION_1_57();
  double v61 = OUTLINED_FUNCTION_16_15();
  if (v29) {
    double v62 = v61;
  }
  else {
    double v62 = 0.0;
  }
  char v103 = 27;
  OUTLINED_FUNCTION_1_57();
  double v63 = OUTLINED_FUNCTION_16_15();
  if (v29) {
    double v64 = v63;
  }
  else {
    double v64 = 0.0;
  }
  char v103 = 28;
  OUTLINED_FUNCTION_1_57();
  double v65 = OUTLINED_FUNCTION_16_15();
  if (v29) {
    double v66 = v65;
  }
  else {
    double v66 = 0.0;
  }
  char v103 = 29;
  OUTLINED_FUNCTION_1_57();
  double v67 = OUTLINED_FUNCTION_16_15();
  if (v29) {
    double v57 = v67;
  }
  char v103 = 30;
  OUTLINED_FUNCTION_25_7();
  uint64_t v68 = OUTLINED_FUNCTION_8_26();
  v69(v68);
  DayPartForecast.init(forecastStart:forecastEnd:period:cloudCover:cloudCoverLowAltPct:cloudCoverMidAltPct:cloudCoverHighAltPct:conditionCode:humidityMax:humidityMin:temperatureMax:temperatureMin:precipitationAmount:precipitationAmountByType:precipitationChance:precipitationType:snowfallAmount:visibilityMax:visibilityMin:windDirection:windGustSpeedMax:windSpeed:windSpeedMax:humidity:precipitationIntensityMax:perceivedPrecipitationIntensityMax:uvIndexMin:uvIndexMax:temperatureApparentMin:temperatureApparentMax:daylight:)((uint64_t)v88, v23, &v106, v105, v91, (char)v90, v87, v104, v89, v30, v32, v34, v36, v92, v85, v84, v83, v82, v81,
    v80,
    v76,
    v77,
    v79,
    v78,
    *(uint64_t *)&v86,
    v75,
    v74,
    v73,
    v72,
    v71,
    *(uint64_t *)&v62,
    *(uint64_t *)&v64,
    *(uint64_t *)&v66,
    v57,
    LOBYTE(v95) & 1);
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v93);
}

unint64_t sub_1A962A058()
{
  unint64_t result = qword_1EB6DC128;
  if (!qword_1EB6DC128)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB6DC128);
  }
  return result;
}

unint64_t sub_1A962A0A4()
{
  unint64_t result = qword_1EB6DC618;
  if (!qword_1EB6DC618)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB6DC618);
  }
  return result;
}

uint64_t sub_1A962A0F0(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x7473616365726F66 && a2 == 0xED00007472617453;
  if (v2 || (sub_1A96327D0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    BOOL v6 = a1 == 0x7473616365726F66 && a2 == 0xEB00000000646E45;
    if (v6 || (sub_1A96327D0() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else
    {
      BOOL v7 = a1 == 0x646F69726570 && a2 == 0xE600000000000000;
      if (v7 || (sub_1A96327D0() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 2;
      }
      else
      {
        BOOL v8 = a1 == 0x766F4364756F6C63 && a2 == 0xEA00000000007265;
        if (v8 || (sub_1A96327D0() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          return 3;
        }
        else if (a1 == 0xD000000000000013 && a2 == 0x80000001A96474C0 || (sub_1A96327D0() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          return 4;
        }
        else if (a1 == 0xD000000000000013 && a2 == 0x80000001A96474E0 || (sub_1A96327D0() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          return 5;
        }
        else if (a1 == 0xD000000000000014 && a2 == 0x80000001A9647500 || (sub_1A96327D0() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          return 6;
        }
        else
        {
          BOOL v9 = a1 == 0x6F697469646E6F63 && a2 == 0xED000065646F436ELL;
          if (v9 || (sub_1A96327D0() & 1) != 0)
          {
            swift_bridgeObjectRelease();
            return 7;
          }
          else
          {
            BOOL v10 = a1 == 0x79746964696D7568 && a2 == 0xEB0000000078614DLL;
            if (v10 || (sub_1A96327D0() & 1) != 0)
            {
              swift_bridgeObjectRelease();
              return 8;
            }
            else
            {
              BOOL v11 = a1 == 0x79746964696D7568 && a2 == 0xEB000000006E694DLL;
              if (v11 || (sub_1A96327D0() & 1) != 0)
              {
                swift_bridgeObjectRelease();
                return 9;
              }
              else
              {
                BOOL v12 = a1 == 0x74617265706D6574 && a2 == 0xEE0078614D657275;
                if (v12 || (sub_1A96327D0() & 1) != 0)
                {
                  swift_bridgeObjectRelease();
                  return 10;
                }
                else
                {
                  BOOL v13 = a1 == 0x74617265706D6574 && a2 == 0xEE006E694D657275;
                  if (v13 || (sub_1A96327D0() & 1) != 0)
                  {
                    swift_bridgeObjectRelease();
                    return 11;
                  }
                  else if (a1 == 0xD000000000000013 && a2 == 0x80000001A9647520 || (sub_1A96327D0() & 1) != 0)
                  {
                    swift_bridgeObjectRelease();
                    return 12;
                  }
                  else if (a1 == 0xD000000000000019 && a2 == 0x80000001A9648390 || (sub_1A96327D0() & 1) != 0)
                  {
                    swift_bridgeObjectRelease();
                    return 13;
                  }
                  else if (a1 == 0xD000000000000013 && a2 == 0x80000001A9646EF0 || (sub_1A96327D0() & 1) != 0)
                  {
                    swift_bridgeObjectRelease();
                    return 14;
                  }
                  else if (a1 == 0xD000000000000011 && a2 == 0x80000001A9647540 || (sub_1A96327D0() & 1) != 0)
                  {
                    swift_bridgeObjectRelease();
                    return 15;
                  }
                  else
                  {
                    BOOL v14 = a1 == 0x6C6C6166776F6E73 && a2 == 0xEE00746E756F6D41;
                    if (v14 || (sub_1A96327D0() & 1) != 0)
                    {
                      swift_bridgeObjectRelease();
                      return 16;
                    }
                    else
                    {
                      BOOL v15 = a1 == 0x696C696269736976 && a2 == 0xED000078614D7974;
                      if (v15 || (sub_1A96327D0() & 1) != 0)
                      {
                        swift_bridgeObjectRelease();
                        return 17;
                      }
                      else
                      {
                        BOOL v16 = a1 == 0x696C696269736976 && a2 == 0xED00006E694D7974;
                        if (v16 || (sub_1A96327D0() & 1) != 0)
                        {
                          swift_bridgeObjectRelease();
                          return 18;
                        }
                        else
                        {
                          BOOL v17 = a1 == 0x65726944646E6977 && a2 == 0xED00006E6F697463;
                          if (v17 || (sub_1A96327D0() & 1) != 0)
                          {
                            swift_bridgeObjectRelease();
                            return 19;
                          }
                          else if (a1 == 0xD000000000000010 && a2 == 0x80000001A9648430 {
                                 || (sub_1A96327D0() & 1) != 0)
                          }
                          {
                            swift_bridgeObjectRelease();
                            return 20;
                          }
                          else
                          {
                            BOOL v18 = a1 == 0x65657053646E6977 && a2 == 0xE900000000000064;
                            if (v18 || (sub_1A96327D0() & 1) != 0)
                            {
                              swift_bridgeObjectRelease();
                              return 21;
                            }
                            else
                            {
                              BOOL v19 = a1 == 0x65657053646E6977 && a2 == 0xEC00000078614D64;
                              if (v19 || (sub_1A96327D0() & 1) != 0)
                              {
                                swift_bridgeObjectRelease();
                                return 22;
                              }
                              else
                              {
                                BOOL v20 = a1 == 0x79746964696D7568 && a2 == 0xE800000000000000;
                                if (v20 || (sub_1A96327D0() & 1) != 0)
                                {
                                  swift_bridgeObjectRelease();
                                  return 23;
                                }
                                else if (a1 == 0xD000000000000019 && a2 == 0x80000001A9649480 {
                                       || (sub_1A96327D0() & 1) != 0)
                                }
                                {
                                  swift_bridgeObjectRelease();
                                  return 24;
                                }
                                else if (a1 == 0xD000000000000022 && a2 == 0x80000001A96494A0 {
                                       || (sub_1A96327D0() & 1) != 0)
                                }
                                {
                                  swift_bridgeObjectRelease();
                                  return 25;
                                }
                                else
                                {
                                  BOOL v21 = a1 == 0x4D7865646E497675 && a2 == 0xEA00000000006E69;
                                  if (v21 || (sub_1A96327D0() & 1) != 0)
                                  {
                                    swift_bridgeObjectRelease();
                                    return 26;
                                  }
                                  else
                                  {
                                    BOOL v22 = a1 == 0x4D7865646E497675 && a2 == 0xEA00000000007861;
                                    if (v22 || (sub_1A96327D0() & 1) != 0)
                                    {
                                      swift_bridgeObjectRelease();
                                      return 27;
                                    }
                                    else if (a1 == 0xD000000000000016 && a2 == 0x80000001A96494D0 {
                                           || (sub_1A96327D0() & 1) != 0)
                                    }
                                    {
                                      swift_bridgeObjectRelease();
                                      return 28;
                                    }
                                    else if (a1 == 0xD000000000000016 && a2 == 0x80000001A96494F0 {
                                           || (sub_1A96327D0() & 1) != 0)
                                    }
                                    {
                                      swift_bridgeObjectRelease();
                                      return 29;
                                    }
                                    else if (a1 == 0x746867696C796164 && a2 == 0xE800000000000000)
                                    {
                                      swift_bridgeObjectRelease();
                                      return 30;
                                    }
                                    else
                                    {
                                      char v24 = sub_1A96327D0();
                                      swift_bridgeObjectRelease();
                                      if (v24) {
                                        return 30;
                                      }
                                      else {
                                        return 31;
                                      }
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
}

uint64_t sub_1A962AD78()
{
  return 31;
}

unint64_t sub_1A962AD80(char a1)
{
  unint64_t result = 0x7473616365726F66;
  switch(a1)
  {
    case 2:
      unint64_t result = 0x646F69726570;
      break;
    case 3:
      unint64_t result = 0x766F4364756F6C63;
      break;
    case 4:
    case 5:
    case 12:
    case 14:
      unint64_t result = 0xD000000000000013;
      break;
    case 6:
      unint64_t result = 0xD000000000000014;
      break;
    case 7:
      unint64_t result = 0x6F697469646E6F63;
      break;
    case 8:
    case 9:
    case 23:
      unint64_t result = 0x79746964696D7568;
      break;
    case 10:
    case 11:
      unint64_t result = 0x74617265706D6574;
      break;
    case 13:
      unint64_t result = 0xD000000000000019;
      break;
    case 15:
      unint64_t result = 0xD000000000000011;
      break;
    case 16:
      unint64_t result = 0x6C6C6166776F6E73;
      break;
    case 17:
    case 18:
      unint64_t result = 0x696C696269736976;
      break;
    case 19:
      unint64_t result = 0x65726944646E6977;
      break;
    case 20:
      unint64_t result = 0xD000000000000010;
      break;
    case 21:
    case 22:
      unint64_t result = 0x65657053646E6977;
      break;
    case 24:
      unint64_t result = 0xD000000000000019;
      break;
    case 25:
      unint64_t result = 0xD000000000000022;
      break;
    case 26:
      unint64_t result = 0x4D7865646E497675;
      break;
    case 27:
      unint64_t result = 0x4D7865646E497675;
      break;
    case 28:
      unint64_t result = 0xD000000000000016;
      break;
    case 29:
      unint64_t result = 0xD000000000000016;
      break;
    case 30:
      unint64_t result = 0x746867696C796164;
      break;
    default:
      return result;
  }
  return result;
}

unint64_t sub_1A962B118()
{
  return sub_1A962AD80(*v0);
}

uint64_t sub_1A962B120@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1A962A0F0(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1A962B148@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_1A962AD78();
  *a1 = result;
  return result;
}

uint64_t sub_1A962B170(uint64_t a1)
{
  unint64_t v2 = sub_1A962A058();
  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1A962B1AC(uint64_t a1)
{
  unint64_t v2 = sub_1A962A058();
  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t DayPartForecast.encode(to:)(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6DC328);
  OUTLINED_FUNCTION_1();
  uint64_t v7 = v6;
  MEMORY[0x1F4188790](v8);
  BOOL v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1A962A058();
  sub_1A9632970();
  LOBYTE(v14) = 0;
  sub_1A962E810();
  sub_1A947198C(&qword_1EB6DC8D0);
  OUTLINED_FUNCTION_11_22();
  if (!v2)
  {
    BOOL v11 = (int *)type metadata accessor for DayPartForecast();
    LOBYTE(v14) = 1;
    OUTLINED_FUNCTION_11_22();
    LOBYTE(v14) = *(unsigned char *)(v3 + v11[6]);
    char v15 = 2;
    sub_1A962B708();
    OUTLINED_FUNCTION_19_13();
    OUTLINED_FUNCTION_0_46(3);
    OUTLINED_FUNCTION_0_46(4);
    OUTLINED_FUNCTION_0_46(5);
    OUTLINED_FUNCTION_0_46(6);
    LOBYTE(v14) = *(unsigned char *)(v3 + v11[11]);
    char v15 = 7;
    sub_1A9542D40();
    sub_1A9632770();
    OUTLINED_FUNCTION_0_46(8);
    OUTLINED_FUNCTION_0_46(9);
    OUTLINED_FUNCTION_0_46(10);
    OUTLINED_FUNCTION_0_46(11);
    OUTLINED_FUNCTION_9_1(v3 + v11[16]);
    OUTLINED_FUNCTION_20_11(12);
    uint64_t v14 = *(void *)(v3 + v11[17]);
    char v15 = 13;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6DD340);
    sub_1A957416C(&qword_1EB6DD348, (void (*)(void))sub_1A95741E8);
    sub_1A9632770();
    OUTLINED_FUNCTION_0_46(14);
    LOBYTE(v14) = *(unsigned char *)(v3 + v11[19]);
    char v15 = 15;
    sub_1A9502C94();
    OUTLINED_FUNCTION_19_13();
    OUTLINED_FUNCTION_9_1(v3 + v11[20]);
    OUTLINED_FUNCTION_20_11(16);
    OUTLINED_FUNCTION_0_46(17);
    OUTLINED_FUNCTION_0_46(18);
    OUTLINED_FUNCTION_9_1(v3 + v11[23]);
    LOBYTE(v14) = 19;
    sub_1A9632710();
    OUTLINED_FUNCTION_0_46(20);
    OUTLINED_FUNCTION_0_46(21);
    OUTLINED_FUNCTION_0_46(22);
    OUTLINED_FUNCTION_0_46(23);
    OUTLINED_FUNCTION_0_46(24);
    OUTLINED_FUNCTION_0_46(25);
    OUTLINED_FUNCTION_0_46(26);
    OUTLINED_FUNCTION_0_46(27);
    OUTLINED_FUNCTION_0_46(28);
    OUTLINED_FUNCTION_0_46(29);
    LOBYTE(v14) = 30;
    sub_1A9632740();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v10, v5);
}

unint64_t sub_1A962B708()
{
  unint64_t result = qword_1EB6DC608;
  if (!qword_1EB6DC608)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB6DC608);
  }
  return result;
}

uint64_t sub_1A962B754@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return DayPartForecast.init(from:)(a1, a2);
}

uint64_t sub_1A962B76C(void *a1)
{
  return DayPartForecast.encode(to:)(a1);
}

void sub_1A962B784()
{
}

uint64_t sub_1A962B79C()
{
  return DayPartForecast.write(to:)();
}

void *initializeBufferWithCopyOfBuffer for DayPartForecast(void *a1, void *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v31 = *a2;
    *a1 = *a2;
    a1 = (void *)(v31 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_1A962E810();
    uint64_t v8 = *(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16);
    v8(a1, a2, v7);
    v8((void *)((char *)a1 + a3[5]), (void *)((char *)a2 + a3[5]), v7);
    uint64_t v9 = a3[7];
    *((unsigned char *)a1 + a3[6]) = *((unsigned char *)a2 + a3[6]);
    *(void *)((char *)a1 + v9) = *(void *)((char *)a2 + v9);
    uint64_t v10 = a3[9];
    *(void *)((char *)a1 + a3[8]) = *(void *)((char *)a2 + a3[8]);
    *(void *)((char *)a1 + v10) = *(void *)((char *)a2 + v10);
    uint64_t v11 = a3[11];
    *(void *)((char *)a1 + a3[10]) = *(void *)((char *)a2 + a3[10]);
    *((unsigned char *)a1 + v11) = *((unsigned char *)a2 + v11);
    uint64_t v12 = a3[13];
    *(void *)((char *)a1 + a3[12]) = *(void *)((char *)a2 + a3[12]);
    *(void *)((char *)a1 + v12) = *(void *)((char *)a2 + v12);
    uint64_t v13 = a3[15];
    *(void *)((char *)a1 + a3[14]) = *(void *)((char *)a2 + a3[14]);
    *(void *)((char *)a1 + v13) = *(void *)((char *)a2 + v13);
    uint64_t v14 = a3[16];
    uint64_t v15 = a3[17];
    BOOL v16 = (char *)a1 + v14;
    BOOL v17 = (char *)a2 + v14;
    *(void *)BOOL v16 = *(void *)v17;
    v16[8] = v17[8];
    *(void *)((char *)a1 + v15) = *(void *)((char *)a2 + v15);
    uint64_t v18 = a3[19];
    *(void *)((char *)a1 + a3[18]) = *(void *)((char *)a2 + a3[18]);
    *((unsigned char *)a1 + v18) = *((unsigned char *)a2 + v18);
    uint64_t v19 = a3[20];
    uint64_t v20 = a3[21];
    BOOL v21 = (char *)a1 + v19;
    BOOL v22 = (char *)a2 + v19;
    *(void *)BOOL v21 = *(void *)v22;
    v21[8] = v22[8];
    *(void *)((char *)a1 + v20) = *(void *)((char *)a2 + v20);
    uint64_t v23 = a3[23];
    *(void *)((char *)a1 + a3[22]) = *(void *)((char *)a2 + a3[22]);
    char v24 = (char *)a1 + v23;
    uint64_t v25 = (char *)a2 + v23;
    *(void *)char v24 = *(void *)v25;
    v24[8] = v25[8];
    uint64_t v26 = a3[25];
    *(void *)((char *)a1 + a3[24]) = *(void *)((char *)a2 + a3[24]);
    *(void *)((char *)a1 + v26) = *(void *)((char *)a2 + v26);
    uint64_t v27 = a3[27];
    *(void *)((char *)a1 + a3[26]) = *(void *)((char *)a2 + a3[26]);
    *(void *)((char *)a1 + v27) = *(void *)((char *)a2 + v27);
    uint64_t v28 = a3[29];
    *(void *)((char *)a1 + a3[28]) = *(void *)((char *)a2 + a3[28]);
    *(void *)((char *)a1 + v28) = *(void *)((char *)a2 + v28);
    uint64_t v29 = a3[31];
    *(void *)((char *)a1 + a3[30]) = *(void *)((char *)a2 + a3[30]);
    *(void *)((char *)a1 + v29) = *(void *)((char *)a2 + v29);
    uint64_t v30 = a3[33];
    *(void *)((char *)a1 + a3[32]) = *(void *)((char *)a2 + a3[32]);
    *(void *)((char *)a1 + v30) = *(void *)((char *)a2 + v30);
    *((unsigned char *)a1 + a3[34]) = *((unsigned char *)a2 + a3[34]);
    sub_1A9631510();
  }
  return a1;
}

uint64_t assignWithCopy for DayPartForecast(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_1A962E810();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24);
  v7(a1, a2, v6);
  v7(a1 + a3[5], a2 + a3[5], v6);
  *(unsigned char *)(a1 + a3[6]) = *(unsigned char *)(a2 + a3[6]);
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  *(void *)(a1 + a3[8]) = *(void *)(a2 + a3[8]);
  *(void *)(a1 + a3[9]) = *(void *)(a2 + a3[9]);
  *(void *)(a1 + a3[10]) = *(void *)(a2 + a3[10]);
  *(unsigned char *)(a1 + a3[11]) = *(unsigned char *)(a2 + a3[11]);
  *(void *)(a1 + a3[12]) = *(void *)(a2 + a3[12]);
  *(void *)(a1 + a3[13]) = *(void *)(a2 + a3[13]);
  *(void *)(a1 + a3[14]) = *(void *)(a2 + a3[14]);
  *(void *)(a1 + a3[15]) = *(void *)(a2 + a3[15]);
  uint64_t v8 = a3[16];
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  char v11 = *(unsigned char *)(v10 + 8);
  *(void *)uint64_t v9 = *(void *)v10;
  *(unsigned char *)(v9 + 8) = v11;
  *(void *)(a1 + a3[17]) = *(void *)(a2 + a3[17]);
  sub_1A9631510();
  swift_bridgeObjectRelease();
  *(void *)(a1 + a3[18]) = *(void *)(a2 + a3[18]);
  *(unsigned char *)(a1 + a3[19]) = *(unsigned char *)(a2 + a3[19]);
  uint64_t v12 = a3[20];
  uint64_t v13 = a1 + v12;
  uint64_t v14 = (uint64_t *)(a2 + v12);
  uint64_t v15 = *v14;
  *(unsigned char *)(v13 + 8) = *((unsigned char *)v14 + 8);
  *(void *)uint64_t v13 = v15;
  *(void *)(a1 + a3[21]) = *(void *)(a2 + a3[21]);
  *(void *)(a1 + a3[22]) = *(void *)(a2 + a3[22]);
  uint64_t v16 = a3[23];
  uint64_t v17 = a1 + v16;
  uint64_t v18 = (uint64_t *)(a2 + v16);
  uint64_t v19 = *v18;
  *(unsigned char *)(v17 + 8) = *((unsigned char *)v18 + 8);
  *(void *)uint64_t v17 = v19;
  *(void *)(a1 + a3[24]) = *(void *)(a2 + a3[24]);
  *(void *)(a1 + a3[25]) = *(void *)(a2 + a3[25]);
  *(void *)(a1 + a3[26]) = *(void *)(a2 + a3[26]);
  *(void *)(a1 + a3[27]) = *(void *)(a2 + a3[27]);
  *(void *)(a1 + a3[28]) = *(void *)(a2 + a3[28]);
  *(void *)(a1 + a3[29]) = *(void *)(a2 + a3[29]);
  *(void *)(a1 + a3[30]) = *(void *)(a2 + a3[30]);
  *(void *)(a1 + a3[31]) = *(void *)(a2 + a3[31]);
  *(void *)(a1 + a3[32]) = *(void *)(a2 + a3[32]);
  *(void *)(a1 + a3[33]) = *(void *)(a2 + a3[33]);
  *(unsigned char *)(a1 + a3[34]) = *(unsigned char *)(a2 + a3[34]);
  return a1;
}

uint64_t initializeWithTake for DayPartForecast(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_1A962E810();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32);
  v7(a1, a2, v6);
  v7(a1 + a3[5], a2 + a3[5], v6);
  uint64_t v8 = a3[7];
  *(unsigned char *)(a1 + a3[6]) = *(unsigned char *)(a2 + a3[6]);
  *(void *)(a1 + v8) = *(void *)(a2 + v8);
  uint64_t v9 = a3[9];
  *(void *)(a1 + a3[8]) = *(void *)(a2 + a3[8]);
  *(void *)(a1 + v9) = *(void *)(a2 + v9);
  uint64_t v10 = a3[11];
  *(void *)(a1 + a3[10]) = *(void *)(a2 + a3[10]);
  *(unsigned char *)(a1 + v10) = *(unsigned char *)(a2 + v10);
  uint64_t v11 = a3[13];
  *(void *)(a1 + a3[12]) = *(void *)(a2 + a3[12]);
  *(void *)(a1 + v11) = *(void *)(a2 + v11);
  uint64_t v12 = a3[15];
  *(void *)(a1 + a3[14]) = *(void *)(a2 + a3[14]);
  *(void *)(a1 + v12) = *(void *)(a2 + v12);
  uint64_t v13 = a3[16];
  uint64_t v14 = a3[17];
  uint64_t v15 = a1 + v13;
  uint64_t v16 = a2 + v13;
  *(void *)uint64_t v15 = *(void *)v16;
  *(unsigned char *)(v15 + 8) = *(unsigned char *)(v16 + 8);
  *(void *)(a1 + v14) = *(void *)(a2 + v14);
  uint64_t v17 = a3[19];
  *(void *)(a1 + a3[18]) = *(void *)(a2 + a3[18]);
  *(unsigned char *)(a1 + v17) = *(unsigned char *)(a2 + v17);
  uint64_t v18 = a3[20];
  uint64_t v19 = a3[21];
  uint64_t v20 = a1 + v18;
  uint64_t v21 = a2 + v18;
  *(void *)uint64_t v20 = *(void *)v21;
  *(unsigned char *)(v20 + 8) = *(unsigned char *)(v21 + 8);
  *(void *)(a1 + v19) = *(void *)(a2 + v19);
  uint64_t v22 = a3[23];
  *(void *)(a1 + a3[22]) = *(void *)(a2 + a3[22]);
  uint64_t v23 = a1 + v22;
  uint64_t v24 = a2 + v22;
  *(void *)uint64_t v23 = *(void *)v24;
  *(unsigned char *)(v23 + 8) = *(unsigned char *)(v24 + 8);
  uint64_t v25 = a3[25];
  *(void *)(a1 + a3[24]) = *(void *)(a2 + a3[24]);
  *(void *)(a1 + v25) = *(void *)(a2 + v25);
  uint64_t v26 = a3[27];
  *(void *)(a1 + a3[26]) = *(void *)(a2 + a3[26]);
  *(void *)(a1 + v26) = *(void *)(a2 + v26);
  uint64_t v27 = a3[29];
  *(void *)(a1 + a3[28]) = *(void *)(a2 + a3[28]);
  *(void *)(a1 + v27) = *(void *)(a2 + v27);
  uint64_t v28 = a3[31];
  *(void *)(a1 + a3[30]) = *(void *)(a2 + a3[30]);
  *(void *)(a1 + v28) = *(void *)(a2 + v28);
  uint64_t v29 = a3[33];
  *(void *)(a1 + a3[32]) = *(void *)(a2 + a3[32]);
  *(void *)(a1 + v29) = *(void *)(a2 + v29);
  *(unsigned char *)(a1 + a3[34]) = *(unsigned char *)(a2 + a3[34]);
  return a1;
}

uint64_t assignWithTake for DayPartForecast(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_1A962E810();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40);
  v7(a1, a2, v6);
  v7(a1 + a3[5], a2 + a3[5], v6);
  uint64_t v8 = a3[7];
  *(unsigned char *)(a1 + a3[6]) = *(unsigned char *)(a2 + a3[6]);
  *(void *)(a1 + v8) = *(void *)(a2 + v8);
  uint64_t v9 = a3[9];
  *(void *)(a1 + a3[8]) = *(void *)(a2 + a3[8]);
  *(void *)(a1 + v9) = *(void *)(a2 + v9);
  uint64_t v10 = a3[11];
  *(void *)(a1 + a3[10]) = *(void *)(a2 + a3[10]);
  *(unsigned char *)(a1 + v10) = *(unsigned char *)(a2 + v10);
  uint64_t v11 = a3[13];
  *(void *)(a1 + a3[12]) = *(void *)(a2 + a3[12]);
  *(void *)(a1 + v11) = *(void *)(a2 + v11);
  uint64_t v12 = a3[15];
  *(void *)(a1 + a3[14]) = *(void *)(a2 + a3[14]);
  *(void *)(a1 + v12) = *(void *)(a2 + v12);
  uint64_t v13 = a3[16];
  uint64_t v14 = a3[17];
  uint64_t v15 = a1 + v13;
  uint64_t v16 = a2 + v13;
  *(void *)uint64_t v15 = *(void *)v16;
  *(unsigned char *)(v15 + 8) = *(unsigned char *)(v16 + 8);
  *(void *)(a1 + v14) = *(void *)(a2 + v14);
  swift_bridgeObjectRelease();
  uint64_t v17 = a3[19];
  *(void *)(a1 + a3[18]) = *(void *)(a2 + a3[18]);
  *(unsigned char *)(a1 + v17) = *(unsigned char *)(a2 + v17);
  uint64_t v18 = a3[20];
  uint64_t v19 = a3[21];
  uint64_t v20 = a1 + v18;
  uint64_t v21 = a2 + v18;
  *(unsigned char *)(v20 + 8) = *(unsigned char *)(v21 + 8);
  *(void *)uint64_t v20 = *(void *)v21;
  *(void *)(a1 + v19) = *(void *)(a2 + v19);
  uint64_t v22 = a3[23];
  *(void *)(a1 + a3[22]) = *(void *)(a2 + a3[22]);
  uint64_t v23 = a1 + v22;
  uint64_t v24 = a2 + v22;
  *(void *)uint64_t v23 = *(void *)v24;
  *(unsigned char *)(v23 + 8) = *(unsigned char *)(v24 + 8);
  uint64_t v25 = a3[25];
  *(void *)(a1 + a3[24]) = *(void *)(a2 + a3[24]);
  *(void *)(a1 + v25) = *(void *)(a2 + v25);
  uint64_t v26 = a3[27];
  *(void *)(a1 + a3[26]) = *(void *)(a2 + a3[26]);
  *(void *)(a1 + v26) = *(void *)(a2 + v26);
  uint64_t v27 = a3[29];
  *(void *)(a1 + a3[28]) = *(void *)(a2 + a3[28]);
  *(void *)(a1 + v27) = *(void *)(a2 + v27);
  uint64_t v28 = a3[31];
  *(void *)(a1 + a3[30]) = *(void *)(a2 + a3[30]);
  *(void *)(a1 + v28) = *(void *)(a2 + v28);
  uint64_t v29 = a3[33];
  *(void *)(a1 + a3[32]) = *(void *)(a2 + a3[32]);
  *(void *)(a1 + v29) = *(void *)(a2 + v29);
  *(unsigned char *)(a1 + a3[34]) = *(unsigned char *)(a2 + a3[34]);
  return a1;
}

uint64_t sub_1A962C008(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_1A962E810();
  OUTLINED_FUNCTION_0();
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    return __swift_getEnumTagSinglePayload(a1, a2, v6);
  }
  else
  {
    unint64_t v9 = *(void *)(a1 + *(int *)(a3 + 68));
    if (v9 >= 0xFFFFFFFF) {
      LODWORD(v9) = -1;
    }
    return (v9 + 1);
  }
}

void sub_1A962C094(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  sub_1A962E810();
  OUTLINED_FUNCTION_0();
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    __swift_storeEnumTagSinglePayload(a1, a2, a2, v8);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 68)) = (a2 - 1);
  }
}

uint64_t sub_1A962C11C()
{
  uint64_t result = sub_1A962E810();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t getEnumTagSinglePayload for DayPartForecast.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xE2)
  {
    if (a2 + 30 >= 0xFFFF00) {
      int v2 = 4;
    }
    else {
      int v2 = 2;
    }
    if ((a2 + 30) >> 8 < 0xFF) {
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
    int v5 = (*a1 | (v4 << 8)) - 31;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0x1F;
  int v5 = v6 - 31;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for DayPartForecast.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 30 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 30) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xE2) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xE1)
  {
    unsigned int v6 = ((a2 - 226) >> 8) + 1;
    *uint64_t result = a2 + 30;
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
        JUMPOUT(0x1A962C378);
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
          *uint64_t result = a2 + 30;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for DayPartForecast.CodingKeys()
{
  return &type metadata for DayPartForecast.CodingKeys;
}

unint64_t sub_1A962C3B4()
{
  unint64_t result = qword_1E97ED3E0;
  if (!qword_1E97ED3E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97ED3E0);
  }
  return result;
}

unint64_t sub_1A962C404()
{
  unint64_t result = qword_1EB6DC138;
  if (!qword_1EB6DC138)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB6DC138);
  }
  return result;
}

unint64_t sub_1A962C454()
{
  unint64_t result = qword_1EB6DC130;
  if (!qword_1EB6DC130)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB6DC130);
  }
  return result;
}

uint64_t GeoJSONProperties.init(from:)(uint64_t a1)
{
  return __swift_destroy_boxed_opaque_existential_1(a1);
}

uint64_t static GeoJSONProperties.== infix(_:_:)()
{
  return 1;
}

uint64_t sub_1A962C4D8(uint64_t a1)
{
  return GeoJSONProperties.init(from:)(a1);
}

uint64_t static LocationInfoDescriptor.name.getter()
{
  OUTLINED_FUNCTION_2_1();
  uint64_t v0 = *(void *)aLocationinfo_7;
  sub_1A9631510();
  return v0;
}

uint64_t static LocationInfoDescriptor.name.setter(uint64_t a1, uint64_t a2)
{
  *(void *)aLocationinfo_7 = a1;
  *(void *)&aLocationinfo_7[8] = a2;
  return swift_bridgeObjectRelease();
}

uint64_t (*static LocationInfoDescriptor.name.modify())()
{
  return j__swift_endAccess;
}

uint64_t sub_1A962C5C8()
{
  sub_1A9631510();
  sub_1A9631EA0();
  uint64_t result = swift_bridgeObjectRelease();
  qword_1EB6DD7F0 = 0x2E312E312E30;
  qword_1EB6DD7F8 = 0xE600000000000000;
  return result;
}

uint64_t static LocationInfoDescriptor.version.getter()
{
  if (qword_1EB6DD800 != -1) {
    swift_once();
  }
  OUTLINED_FUNCTION_2_1();
  uint64_t v0 = qword_1EB6DD7F0;
  sub_1A9631510();
  return v0;
}

uint64_t static LocationInfoDescriptor.version.setter(uint64_t a1, uint64_t a2)
{
  if (qword_1EB6DD800 != -1) {
    swift_once();
  }
  OUTLINED_FUNCTION_1_3();
  qword_1EB6DD7F0 = a1;
  qword_1EB6DD7F8 = a2;
  return swift_bridgeObjectRelease();
}

uint64_t (*static LocationInfoDescriptor.version.modify())()
{
  if (qword_1EB6DD800 != -1) {
    swift_once();
  }
  OUTLINED_FUNCTION_0_3();
  return j_j__swift_endAccess;
}

ValueMetadata *type metadata accessor for LocationInfoDescriptor()
{
  return &type metadata for LocationInfoDescriptor;
}

WeatherDaemon::Deviation_optional __swiftcall Deviation.init(rawValue:)(Swift::String rawValue)
{
  int v2 = v1;
  unint64_t v3 = sub_1A9632580();
  result.value = swift_bridgeObjectRelease();
  char v5 = 5;
  if (v3 < 5) {
    char v5 = v3;
  }
  *int v2 = v5;
  return result;
}

uint64_t Deviation.rawValue.getter()
{
  uint64_t result = 0x686769486863756DLL;
  switch(*v0)
  {
    case 1:
      uint64_t result = 0x726568676968;
      break;
    case 2:
      uint64_t result = 0x6C616D726F6ELL;
      break;
    case 3:
      uint64_t result = 0x7265776F6CLL;
      break;
    case 4:
      uint64_t result = 0x65776F4C6863756DLL;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_1A962C8C8(unsigned __int8 *a1, char *a2)
{
  return sub_1A950AAE0(*a1, *a2);
}

unint64_t sub_1A962C8D8()
{
  unint64_t result = qword_1E97ED3F8;
  if (!qword_1E97ED3F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97ED3F8);
  }
  return result;
}

uint64_t sub_1A962C924()
{
  return sub_1A95C9560(*v0);
}

uint64_t sub_1A962C92C(uint64_t a1)
{
  return sub_1A94ABF24(a1, *v1);
}

uint64_t sub_1A962C934()
{
  return sub_1A94AE014();
}

WeatherDaemon::Deviation_optional sub_1A962C93C(Swift::String *a1)
{
  return Deviation.init(rawValue:)(*a1);
}

uint64_t sub_1A962C948@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = Deviation.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_1A962C970()
{
  return sub_1A9632000();
}

uint64_t sub_1A962C9D0()
{
  return sub_1A9631FB0();
}

void sub_1A962CA20(unsigned char *a1@<X8>)
{
}

uint64_t sub_1A962CA38()
{
  return Deviation.write(to:)();
}

unsigned char *storeEnumTagSinglePayload for Deviation(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1A962CB1CLL);
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

ValueMetadata *type metadata accessor for Deviation()
{
  return &type metadata for Deviation;
}

unint64_t sub_1A962CB54()
{
  unint64_t result = qword_1EB6DA928;
  if (!qword_1EB6DA928)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB6DA928);
  }
  return result;
}

uint64_t WeatherComparisons.comparisons.getter()
{
  return sub_1A9631510();
}

uint64_t WeatherComparisons.comparisons.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  *unint64_t v1 = a1;
  return result;
}

uint64_t (*WeatherComparisons.comparisons.modify())(void)
{
  return nullsub_1;
}

uint64_t WeatherComparisons.metadata.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for WeatherComparisons() + 20);
  return sub_1A943F20C(v3, a1);
}

uint64_t WeatherComparisons.metadata.setter(uint64_t a1)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for WeatherComparisons() + 20);
  return sub_1A947A5CC(a1, v3);
}

uint64_t (*WeatherComparisons.metadata.modify())(void)
{
  return nullsub_1;
}

uint64_t WeatherComparisons.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v55 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6DE3A0);
  MEMORY[0x1F4188790](v3 - 8);
  OUTLINED_FUNCTION_2();
  uint64_t v54 = v5 - v4;
  uint64_t v57 = sub_1A962E810();
  uint64_t v52 = *(void *)(v57 - 8);
  MEMORY[0x1F4188790](v57);
  int v51 = (char *)&v46 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v7);
  int v53 = (char *)&v46 - v8;
  MEMORY[0x1F4188790](v9);
  uint64_t v56 = (char *)&v46 - v10;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6DA880);
  MEMORY[0x1F4188790](v11 - 8);
  OUTLINED_FUNCTION_2();
  uint64_t v14 = v13 - v12;
  uint64_t v15 = type metadata accessor for Metadata();
  MEMORY[0x1F4188790](v15 - 8);
  uint64_t v17 = (char *)&v46 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v18);
  uint64_t v20 = (char *)&v46 - v19;
  uint64_t v21 = type metadata accessor for WeatherComparisons();
  MEMORY[0x1F4188790](v21);
  OUTLINED_FUNCTION_2();
  uint64_t v24 = (uint64_t *)(v23 - v22);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  uint64_t v25 = v58;
  sub_1A9632940();
  if (v25)
  {
    uint64_t v28 = (uint64_t)a1;
  }
  else
  {
    uint64_t v47 = v17;
    uint64_t v48 = v21;
    uint64_t v49 = v20;
    double v50 = v24;
    double v58 = a1;
    uint64_t v26 = v56;
    uint64_t v27 = v57;
    __swift_project_boxed_opaque_existential_1(v59, v59[3]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6DA970);
    sub_1A962D334(&qword_1EB6DA980, &qword_1EB6DA878);
    sub_1A9632810();
    uint64_t v30 = v60;
    uint64_t v31 = (uint64_t)v50;
    *double v50 = v60;
    sub_1A94763E0(v30, v14);
    uint64_t v32 = type metadata accessor for WeatherComparison();
    int EnumTagSinglePayload = __swift_getEnumTagSinglePayload(v14, 1, v32);
    uint64_t v34 = v55;
    uint64_t v35 = (uint64_t)v58;
    if (EnumTagSinglePayload == 1)
    {
      sub_1A962D188(v14);
      uint64_t v36 = (uint64_t)v26;
      sub_1A962E7F0();
      double v37 = v51;
      sub_1A962E7F0();
      uint64_t v38 = (uint64_t)v53;
      sub_1A962E760();
      double v39 = v37;
      uint64_t v40 = v27;
      (*(void (**)(char *, uint64_t))(v52 + 8))(v39, v27);
      uint64_t v41 = v54;
      uint64_t v42 = v40;
      uint64_t v31 = (uint64_t)v50;
      __swift_storeEnumTagSinglePayload(v54, 1, 1, v42);
      LOBYTE(v60) = 1;
      uint64_t v43 = (uint64_t)v49;
      Metadata.init(readTime:expireTime:reportedTime:version:latitude:longitude:language:providerName:providerLogo:temporarilyUnavailable:units:attributionURL:)(v36, v38, v41, 1, 0, 0, 0, 0, (uint64_t)v49, 0.0, 0.0, 0, 0, 0, (char *)&v60, 0, 0);
    }
    else
    {
      uint64_t v44 = (uint64_t)v47;
      sub_1A943F20C(v14, (uint64_t)v47);
      sub_1A962D1E8(v14);
      uint64_t v45 = v44;
      uint64_t v43 = (uint64_t)v49;
      sub_1A9437488(v45, (uint64_t)v49, (uint64_t (*)(void))type metadata accessor for Metadata);
    }
    sub_1A9437488(v43, v31 + *(int *)(v48 + 20), (uint64_t (*)(void))type metadata accessor for Metadata);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v59);
    sub_1A9437488(v31, v34, (uint64_t (*)(void))type metadata accessor for WeatherComparisons);
    uint64_t v28 = v35;
  }
  return __swift_destroy_boxed_opaque_existential_1(v28);
}

uint64_t sub_1A962D188(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6DA880);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1A962D1E8(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for WeatherComparison();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t WeatherComparisons.encode(to:)(void *a1)
{
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1A9632960();
  uint64_t v5 = *v1;
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v3, v4);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6DA970);
  sub_1A962D334(&qword_1EB6DA978, &qword_1EB6DA870);
  sub_1A9632820();
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v3);
}

uint64_t sub_1A962D334(unint64_t *a1, unint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EB6DA970);
    sub_1A962D3B4(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1A962D3B4(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for WeatherComparison();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1A962D3F8@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return WeatherComparisons.init(from:)(a1, a2);
}

uint64_t sub_1A962D410(void *a1)
{
  return WeatherComparisons.encode(to:)(a1);
}

void sub_1A962D428()
{
}

void sub_1A962D440()
{
}

uint64_t *initializeBufferWithCopyOfBuffer for WeatherComparisons(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v3 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  uint64_t v4 = *a2;
  *a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    uint64_t v5 = (uint64_t *)(v4 + ((v3 + 16) & ~(unint64_t)v3));
    swift_retain();
  }
  else
  {
    uint64_t v5 = a1;
    uint64_t v6 = *(int *)(a3 + 20);
    uint64_t v7 = (char *)a1 + v6;
    uint64_t v8 = (char *)a2 + v6;
    uint64_t v9 = sub_1A962E810();
    uint64_t v10 = *(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 16);
    sub_1A9631510();
    v10(v7, v8, v9);
    uint64_t v11 = (int *)type metadata accessor for Metadata();
    v10(&v7[v11[5]], &v8[v11[5]], v9);
    uint64_t v12 = v11[6];
    uint64_t v13 = &v7[v12];
    uint64_t v14 = &v8[v12];
    if (__swift_getEnumTagSinglePayload((uint64_t)&v8[v12], 1, v9))
    {
      uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6DE3A0);
      memcpy(v13, v14, *(void *)(*(void *)(v15 - 8) + 64));
    }
    else
    {
      v10(v13, v14, v9);
      __swift_storeEnumTagSinglePayload((uint64_t)v13, 0, 1, v9);
    }
    *(void *)&v7[v11[7]] = *(void *)&v8[v11[7]];
    *(void *)&v7[v11[8]] = *(void *)&v8[v11[8]];
    *(void *)&v7[v11[9]] = *(void *)&v8[v11[9]];
    uint64_t v16 = v11[10];
    uint64_t v17 = &v7[v16];
    uint64_t v18 = &v8[v16];
    uint64_t v19 = *((void *)v18 + 1);
    *(void *)uint64_t v17 = *(void *)v18;
    *((void *)v17 + 1) = v19;
    uint64_t v20 = v11[11];
    uint64_t v21 = &v7[v20];
    uint64_t v22 = &v8[v20];
    uint64_t v23 = *((void *)v22 + 1);
    *(void *)uint64_t v21 = *(void *)v22;
    *((void *)v21 + 1) = v23;
    uint64_t v24 = v11[12];
    uint64_t v25 = &v7[v24];
    uint64_t v26 = &v8[v24];
    uint64_t v27 = *((void *)v26 + 1);
    *(void *)uint64_t v25 = *(void *)v26;
    *((void *)v25 + 1) = v27;
    v7[v11[13]] = v8[v11[13]];
    v7[v11[14]] = v8[v11[14]];
    uint64_t v28 = v11[15];
    uint64_t v29 = &v7[v28];
    uint64_t v30 = &v8[v28];
    uint64_t v31 = *((void *)v30 + 1);
    *(void *)uint64_t v29 = *(void *)v30;
    *((void *)v29 + 1) = v31;
    sub_1A9631510();
    sub_1A9631510();
    sub_1A9631510();
    sub_1A9631510();
  }
  return v5;
}

void *initializeWithCopy for WeatherComparisons(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = (char *)a1 + v4;
  uint64_t v6 = (char *)a2 + v4;
  uint64_t v7 = sub_1A962E810();
  uint64_t v8 = *(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 16);
  sub_1A9631510();
  v8(v5, v6, v7);
  uint64_t v9 = (int *)type metadata accessor for Metadata();
  v8(&v5[v9[5]], &v6[v9[5]], v7);
  uint64_t v10 = v9[6];
  uint64_t v11 = &v5[v10];
  uint64_t v12 = &v6[v10];
  if (__swift_getEnumTagSinglePayload((uint64_t)&v6[v10], 1, v7))
  {
    uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6DE3A0);
    memcpy(v11, v12, *(void *)(*(void *)(v13 - 8) + 64));
  }
  else
  {
    v8(v11, v12, v7);
    __swift_storeEnumTagSinglePayload((uint64_t)v11, 0, 1, v7);
  }
  *(void *)&v5[v9[7]] = *(void *)&v6[v9[7]];
  *(void *)&v5[v9[8]] = *(void *)&v6[v9[8]];
  *(void *)&v5[v9[9]] = *(void *)&v6[v9[9]];
  uint64_t v14 = v9[10];
  uint64_t v15 = &v5[v14];
  uint64_t v16 = &v6[v14];
  uint64_t v17 = *((void *)v16 + 1);
  *(void *)uint64_t v15 = *(void *)v16;
  *((void *)v15 + 1) = v17;
  uint64_t v18 = v9[11];
  uint64_t v19 = &v5[v18];
  uint64_t v20 = &v6[v18];
  uint64_t v21 = *((void *)v20 + 1);
  *(void *)uint64_t v19 = *(void *)v20;
  *((void *)v19 + 1) = v21;
  uint64_t v22 = v9[12];
  uint64_t v23 = &v5[v22];
  uint64_t v24 = &v6[v22];
  uint64_t v25 = *((void *)v24 + 1);
  *(void *)uint64_t v23 = *(void *)v24;
  *((void *)v23 + 1) = v25;
  v5[v9[13]] = v6[v9[13]];
  v5[v9[14]] = v6[v9[14]];
  uint64_t v26 = v9[15];
  uint64_t v27 = &v5[v26];
  uint64_t v28 = &v6[v26];
  uint64_t v29 = *((void *)v28 + 1);
  *(void *)uint64_t v27 = *(void *)v28;
  *((void *)v27 + 1) = v29;
  sub_1A9631510();
  sub_1A9631510();
  sub_1A9631510();
  sub_1A9631510();
  return a1;
}

void *assignWithCopy for WeatherComparisons(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  sub_1A9631510();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v32 = a1;
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_1A962E810();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(void (**)(char *, char *, uint64_t))(v10 + 24);
  v11(v7, v8, v9);
  uint64_t v12 = (int *)type metadata accessor for Metadata();
  v11(&v7[v12[5]], &v8[v12[5]], v9);
  uint64_t v13 = v12[6];
  uint64_t v14 = &v7[v13];
  uint64_t v15 = &v8[v13];
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)&v7[v13], 1, v9);
  int v17 = __swift_getEnumTagSinglePayload((uint64_t)v15, 1, v9);
  if (!EnumTagSinglePayload)
  {
    if (!v17)
    {
      v11(v14, v15, v9);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v10 + 8))(v14, v9);
    goto LABEL_6;
  }
  if (v17)
  {
LABEL_6:
    uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6DE3A0);
    memcpy(v14, v15, *(void *)(*(void *)(v18 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v14, v15, v9);
  __swift_storeEnumTagSinglePayload((uint64_t)v14, 0, 1, v9);
LABEL_7:
  *(void *)&v7[v12[7]] = *(void *)&v8[v12[7]];
  *(void *)&v7[v12[8]] = *(void *)&v8[v12[8]];
  *(void *)&v7[v12[9]] = *(void *)&v8[v12[9]];
  uint64_t v19 = v12[10];
  uint64_t v20 = &v7[v19];
  uint64_t v21 = &v8[v19];
  *(void *)uint64_t v20 = *(void *)v21;
  *((void *)v20 + 1) = *((void *)v21 + 1);
  sub_1A9631510();
  swift_bridgeObjectRelease();
  uint64_t v22 = v12[11];
  uint64_t v23 = &v7[v22];
  uint64_t v24 = &v8[v22];
  *(void *)uint64_t v23 = *(void *)v24;
  *((void *)v23 + 1) = *((void *)v24 + 1);
  sub_1A9631510();
  swift_bridgeObjectRelease();
  uint64_t v25 = v12[12];
  uint64_t v26 = &v7[v25];
  uint64_t v27 = &v8[v25];
  *(void *)uint64_t v26 = *(void *)v27;
  *((void *)v26 + 1) = *((void *)v27 + 1);
  sub_1A9631510();
  swift_bridgeObjectRelease();
  v7[v12[13]] = v8[v12[13]];
  v7[v12[14]] = v8[v12[14]];
  uint64_t v28 = v12[15];
  uint64_t v29 = &v7[v28];
  uint64_t v30 = &v8[v28];
  *(void *)uint64_t v29 = *(void *)v30;
  *((void *)v29 + 1) = *((void *)v30 + 1);
  sub_1A9631510();
  swift_bridgeObjectRelease();
  return v32;
}

void *initializeWithTake for WeatherComparisons(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = (char *)a1 + v4;
  uint64_t v6 = (char *)a2 + v4;
  uint64_t v7 = sub_1A962E810();
  uint64_t v8 = *(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32);
  v8(v5, v6, v7);
  uint64_t v9 = (int *)type metadata accessor for Metadata();
  v8(&v5[v9[5]], &v6[v9[5]], v7);
  uint64_t v10 = v9[6];
  uint64_t v11 = &v5[v10];
  uint64_t v12 = &v6[v10];
  if (__swift_getEnumTagSinglePayload((uint64_t)&v6[v10], 1, v7))
  {
    uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6DE3A0);
    memcpy(v11, v12, *(void *)(*(void *)(v13 - 8) + 64));
  }
  else
  {
    v8(v11, v12, v7);
    __swift_storeEnumTagSinglePayload((uint64_t)v11, 0, 1, v7);
  }
  *(void *)&v5[v9[7]] = *(void *)&v6[v9[7]];
  *(void *)&v5[v9[8]] = *(void *)&v6[v9[8]];
  *(void *)&v5[v9[9]] = *(void *)&v6[v9[9]];
  *(_OWORD *)&v5[v9[10]] = *(_OWORD *)&v6[v9[10]];
  *(_OWORD *)&v5[v9[11]] = *(_OWORD *)&v6[v9[11]];
  *(_OWORD *)&v5[v9[12]] = *(_OWORD *)&v6[v9[12]];
  v5[v9[13]] = v6[v9[13]];
  v5[v9[14]] = v6[v9[14]];
  *(_OWORD *)&v5[v9[15]] = *(_OWORD *)&v6[v9[15]];
  return a1;
}

void *assignWithTake for WeatherComparisons(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  swift_bridgeObjectRelease();
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v40 = a1;
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_1A962E810();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(void (**)(char *, char *, uint64_t))(v10 + 40);
  v11(v7, v8, v9);
  uint64_t v12 = (int *)type metadata accessor for Metadata();
  v11(&v7[v12[5]], &v8[v12[5]], v9);
  uint64_t v13 = v12[6];
  uint64_t v14 = &v7[v13];
  uint64_t v15 = &v8[v13];
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)&v7[v13], 1, v9);
  int v17 = __swift_getEnumTagSinglePayload((uint64_t)v15, 1, v9);
  if (!EnumTagSinglePayload)
  {
    if (!v17)
    {
      v11(v14, v15, v9);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v10 + 8))(v14, v9);
    goto LABEL_6;
  }
  if (v17)
  {
LABEL_6:
    uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6DE3A0);
    memcpy(v14, v15, *(void *)(*(void *)(v18 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v14, v15, v9);
  __swift_storeEnumTagSinglePayload((uint64_t)v14, 0, 1, v9);
LABEL_7:
  *(void *)&v7[v12[7]] = *(void *)&v8[v12[7]];
  *(void *)&v7[v12[8]] = *(void *)&v8[v12[8]];
  *(void *)&v7[v12[9]] = *(void *)&v8[v12[9]];
  uint64_t v19 = v12[10];
  uint64_t v20 = &v7[v19];
  uint64_t v21 = &v8[v19];
  uint64_t v23 = *(void *)v21;
  uint64_t v22 = *((void *)v21 + 1);
  *(void *)uint64_t v20 = v23;
  *((void *)v20 + 1) = v22;
  swift_bridgeObjectRelease();
  uint64_t v24 = v12[11];
  uint64_t v25 = &v7[v24];
  uint64_t v26 = &v8[v24];
  uint64_t v28 = *(void *)v26;
  uint64_t v27 = *((void *)v26 + 1);
  *(void *)uint64_t v25 = v28;
  *((void *)v25 + 1) = v27;
  swift_bridgeObjectRelease();
  uint64_t v29 = v12[12];
  uint64_t v30 = &v7[v29];
  uint64_t v31 = &v8[v29];
  uint64_t v33 = *(void *)v31;
  uint64_t v32 = *((void *)v31 + 1);
  *(void *)uint64_t v30 = v33;
  *((void *)v30 + 1) = v32;
  swift_bridgeObjectRelease();
  v7[v12[13]] = v8[v12[13]];
  v7[v12[14]] = v8[v12[14]];
  uint64_t v34 = v12[15];
  uint64_t v35 = &v7[v34];
  uint64_t v36 = &v8[v34];
  uint64_t v38 = *(void *)v36;
  uint64_t v37 = *((void *)v36 + 1);
  *(void *)uint64_t v35 = v38;
  *((void *)v35 + 1) = v37;
  swift_bridgeObjectRelease();
  return v40;
}

uint64_t sub_1A962DF4C(uint64_t *a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = type metadata accessor for Metadata();
    uint64_t v9 = (uint64_t)a1 + *(int *)(a3 + 20);
    return __swift_getEnumTagSinglePayload(v9, a2, v8);
  }
}

void *sub_1A962DFD4(void *result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *uint64_t result = (a2 - 1);
  }
  else
  {
    uint64_t v7 = type metadata accessor for Metadata();
    uint64_t v8 = (uint64_t)v5 + *(int *)(a4 + 20);
    return (void *)__swift_storeEnumTagSinglePayload(v8, a2, a2, v7);
  }
  return result;
}

ValueMetadata *type metadata accessor for DailyWeatherSummaryResource()
{
  return &type metadata for DailyWeatherSummaryResource;
}

_UNKNOWN **sub_1A962E064()
{
  return &off_1EFFC8388;
}

unint64_t sub_1A962E074()
{
  unint64_t result = qword_1E97ED410;
  if (!qword_1E97ED410)
  {
    type metadata accessor for DailySummary();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E97ED410);
  }
  return result;
}

void WDLogForCategory_cold_1()
{
}

uint64_t sub_1A962E1F0()
{
  return MEMORY[0x1F40E2E58]();
}

uint64_t sub_1A962E200()
{
  return MEMORY[0x1F40E2E68]();
}

uint64_t sub_1A962E210()
{
  return MEMORY[0x1F40E2E88]();
}

uint64_t sub_1A962E220()
{
  return MEMORY[0x1F40E2EA8]();
}

uint64_t sub_1A962E230()
{
  return MEMORY[0x1F40E2ED8]();
}

uint64_t sub_1A962E240()
{
  return MEMORY[0x1F40E2EE8]();
}

uint64_t sub_1A962E250()
{
  return MEMORY[0x1F40E2F00]();
}

uint64_t sub_1A962E260()
{
  return MEMORY[0x1F40E2F28]();
}

uint64_t sub_1A962E270()
{
  return MEMORY[0x1F40E2F40]();
}

uint64_t sub_1A962E280()
{
  return MEMORY[0x1F40E2F50]();
}

uint64_t sub_1A962E290()
{
  return MEMORY[0x1F40E2F60]();
}

uint64_t sub_1A962E2A0()
{
  return MEMORY[0x1F40E3008]();
}

uint64_t sub_1A962E2B0()
{
  return MEMORY[0x1F40E3020]();
}

uint64_t sub_1A962E2C0()
{
  return MEMORY[0x1F40E3038]();
}

uint64_t sub_1A962E2D0()
{
  return MEMORY[0x1F40E3060]();
}

uint64_t sub_1A962E2E0()
{
  return MEMORY[0x1F40E3070]();
}

uint64_t sub_1A962E2F0()
{
  return MEMORY[0x1F40E3128]();
}

uint64_t sub_1A962E300()
{
  return MEMORY[0x1F40E3150]();
}

uint64_t sub_1A962E310()
{
  return MEMORY[0x1F40E3160]();
}

uint64_t sub_1A962E320()
{
  return MEMORY[0x1F40E3368]();
}

uint64_t sub_1A962E330()
{
  return MEMORY[0x1F40E3420]();
}

uint64_t sub_1A962E340()
{
  return MEMORY[0x1F40E34D0]();
}

uint64_t sub_1A962E350()
{
  return MEMORY[0x1F40E34F8]();
}

uint64_t sub_1A962E360()
{
  return MEMORY[0x1F40E3530]();
}

uint64_t sub_1A962E370()
{
  return MEMORY[0x1F40E35B0]();
}

uint64_t sub_1A962E380()
{
  return MEMORY[0x1F40E35C0]();
}

uint64_t sub_1A962E390()
{
  return MEMORY[0x1F40E35C8]();
}

uint64_t sub_1A962E3A0()
{
  return MEMORY[0x1F40E35D8]();
}

uint64_t sub_1A962E3B0()
{
  return MEMORY[0x1F40E3670]();
}

uint64_t sub_1A962E3C0()
{
  return MEMORY[0x1F40E36C8]();
}

uint64_t sub_1A962E3D0()
{
  return MEMORY[0x1F40E36D8]();
}

uint64_t sub_1A962E3E0()
{
  return MEMORY[0x1F40E36F8]();
}

uint64_t sub_1A962E3F0()
{
  return MEMORY[0x1F40E3708]();
}

uint64_t sub_1A962E400()
{
  return MEMORY[0x1F40E3718]();
}

uint64_t sub_1A962E410()
{
  return MEMORY[0x1F40E3728]();
}

uint64_t sub_1A962E420()
{
  return MEMORY[0x1F40E3760]();
}

uint64_t sub_1A962E430()
{
  return MEMORY[0x1F40E3778]();
}

uint64_t sub_1A962E440()
{
  return MEMORY[0x1F40E37A8]();
}

uint64_t sub_1A962E450()
{
  return MEMORY[0x1F40E37B8]();
}

uint64_t sub_1A962E460()
{
  return MEMORY[0x1F40E37D0]();
}

uint64_t sub_1A962E470()
{
  return MEMORY[0x1F40E37E0]();
}

uint64_t sub_1A962E480()
{
  return MEMORY[0x1F40E3800]();
}

uint64_t sub_1A962E490()
{
  return MEMORY[0x1F40E3818]();
}

uint64_t sub_1A962E4A0()
{
  return MEMORY[0x1F40E3830]();
}

uint64_t sub_1A962E4B0()
{
  return MEMORY[0x1F40E3A58]();
}

uint64_t sub_1A962E4C0()
{
  return MEMORY[0x1F40E3A90]();
}

uint64_t sub_1A962E4D0()
{
  return MEMORY[0x1F40E3A98]();
}

uint64_t sub_1A962E4E0()
{
  return MEMORY[0x1F40E3AC0]();
}

uint64_t sub_1A962E4F0()
{
  return MEMORY[0x1F40E3B70]();
}

uint64_t sub_1A962E500()
{
  return MEMORY[0x1F40E3F58]();
}

uint64_t sub_1A962E510()
{
  return MEMORY[0x1F40E42A8]();
}

uint64_t sub_1A962E520()
{
  return MEMORY[0x1F40E4540]();
}

uint64_t sub_1A962E530()
{
  return MEMORY[0x1F40E4550]();
}

uint64_t sub_1A962E540()
{
  return MEMORY[0x1F40E48F8]();
}

uint64_t sub_1A962E550()
{
  return MEMORY[0x1F40E4938]();
}

uint64_t sub_1A962E560()
{
  return MEMORY[0x1F40E49A0]();
}

uint64_t sub_1A962E570()
{
  return MEMORY[0x1F40E49E0]();
}

uint64_t sub_1A962E580()
{
  return MEMORY[0x1F40E49E8]();
}

uint64_t sub_1A962E590()
{
  return MEMORY[0x1F40E49F8]();
}

uint64_t sub_1A962E5A0()
{
  return MEMORY[0x1F40E4A70]();
}

uint64_t sub_1A962E5B0()
{
  return MEMORY[0x1F40E4AA0]();
}

uint64_t sub_1A962E5C0()
{
  return MEMORY[0x1F40E4AC0]();
}

uint64_t sub_1A962E5D0()
{
  return MEMORY[0x1F40E4B00]();
}

uint64_t sub_1A962E5E0()
{
  return MEMORY[0x1F40E4B20]();
}

uint64_t sub_1A962E5F0()
{
  return MEMORY[0x1F40E4B80]();
}

uint64_t sub_1A962E600()
{
  return MEMORY[0x1F40E4BB0]();
}

uint64_t sub_1A962E610()
{
  return MEMORY[0x1F40E4BD8]();
}

uint64_t sub_1A962E620()
{
  return MEMORY[0x1F40E4BE0]();
}

uint64_t sub_1A962E630()
{
  return MEMORY[0x1F40E4C18]();
}

uint64_t sub_1A962E640()
{
  return MEMORY[0x1F40E4C78]();
}

uint64_t sub_1A962E650()
{
  return MEMORY[0x1F40E4C80]();
}

uint64_t sub_1A962E660()
{
  return MEMORY[0x1F40E4D48]();
}

uint64_t sub_1A962E670()
{
  return MEMORY[0x1F40E4D58]();
}

uint64_t sub_1A962E680()
{
  return MEMORY[0x1F40E4DA8]();
}

uint64_t sub_1A962E690()
{
  return MEMORY[0x1F40E4ED0]();
}

uint64_t sub_1A962E6A0()
{
  return MEMORY[0x1F40E4EE0]();
}

uint64_t sub_1A962E6B0()
{
  return MEMORY[0x1F415D950]();
}

uint64_t sub_1A962E6C0()
{
  return MEMORY[0x1F415D958]();
}

uint64_t sub_1A962E6D0()
{
  return MEMORY[0x1F40E5088]();
}

uint64_t sub_1A962E6E0()
{
  return MEMORY[0x1F40E50A8]();
}

uint64_t sub_1A962E6F0()
{
  return MEMORY[0x1F40E50E0]();
}

uint64_t sub_1A962E700()
{
  return MEMORY[0x1F40E5138]();
}

uint64_t sub_1A962E710()
{
  return MEMORY[0x1F40E5148]();
}

uint64_t sub_1A962E720()
{
  return MEMORY[0x1F40E5158]();
}

uint64_t sub_1A962E730()
{
  return MEMORY[0x1F40E5188]();
}

uint64_t sub_1A962E740()
{
  return MEMORY[0x1F40E5198]();
}

uint64_t sub_1A962E750()
{
  return MEMORY[0x1F40E51A8]();
}

uint64_t sub_1A962E760()
{
  return MEMORY[0x1F40E51C0]();
}

uint64_t sub_1A962E770()
{
  return MEMORY[0x1F40E51D0]();
}

uint64_t sub_1A962E780()
{
  return MEMORY[0x1F40E51D8]();
}

uint64_t sub_1A962E790()
{
  return MEMORY[0x1F40E51F0]();
}

uint64_t sub_1A962E7A0()
{
  return MEMORY[0x1F40E52A0]();
}

uint64_t sub_1A962E7B0()
{
  return MEMORY[0x1F40E52B0]();
}

uint64_t sub_1A962E7C0()
{
  return MEMORY[0x1F40E52C0]();
}

uint64_t sub_1A962E7D0()
{
  return MEMORY[0x1F40E52D0]();
}

uint64_t sub_1A962E7E0()
{
  return MEMORY[0x1F40E52E0]();
}

uint64_t sub_1A962E7F0()
{
  return MEMORY[0x1F40E52F0]();
}

uint64_t sub_1A962E800()
{
  return MEMORY[0x1F40E5378]();
}

uint64_t sub_1A962E810()
{
  return MEMORY[0x1F40E5388]();
}

uint64_t sub_1A962E820()
{
  return MEMORY[0x1F40E53B0]();
}

uint64_t sub_1A962E830()
{
  return MEMORY[0x1F40E5418]();
}

uint64_t sub_1A962E840()
{
  return MEMORY[0x1F40E5438]();
}

uint64_t sub_1A962E850()
{
  return MEMORY[0x1F40E5448]();
}

uint64_t sub_1A962E860()
{
  return MEMORY[0x1F40E5510]();
}

uint64_t sub_1A962E870()
{
  return MEMORY[0x1F40E5540]();
}

uint64_t sub_1A962E880()
{
  return MEMORY[0x1F40E5578]();
}

uint64_t sub_1A962E890()
{
  return MEMORY[0x1F40E55F0]();
}

uint64_t sub_1A962E8A0()
{
  return MEMORY[0x1F40E5638]();
}

uint64_t sub_1A962E8B0()
{
  return MEMORY[0x1F40E5648]();
}

uint64_t sub_1A962E8C0()
{
  return MEMORY[0x1F40E56B0]();
}

uint64_t sub_1A962E8D0()
{
  return MEMORY[0x1F40E56C8]();
}

uint64_t sub_1A962E8E0()
{
  return MEMORY[0x1F40E5728]();
}

uint64_t sub_1A962E8F0()
{
  return MEMORY[0x1F40E57F8]();
}

uint64_t sub_1A962E900()
{
  return MEMORY[0x1F40E5820]();
}

uint64_t sub_1A962E910()
{
  return MEMORY[0x1F40E5840]();
}

uint64_t sub_1A962E920()
{
  return MEMORY[0x1F40E5868]();
}

uint64_t sub_1A962E930()
{
  return MEMORY[0x1F40E5890]();
}

uint64_t sub_1A962E940()
{
  return MEMORY[0x1F40E5898]();
}

uint64_t sub_1A962E950()
{
  return MEMORY[0x1F40E58A8]();
}

uint64_t sub_1A962E960()
{
  return MEMORY[0x1F40E58B0]();
}

uint64_t sub_1A962E970()
{
  return MEMORY[0x1F40E58C0]();
}

uint64_t sub_1A962E980()
{
  return MEMORY[0x1F40E58D0]();
}

uint64_t sub_1A962E990()
{
  return MEMORY[0x1F40E5978]();
}

uint64_t sub_1A962E9A0()
{
  return MEMORY[0x1F40E5A40]();
}

uint64_t sub_1A962E9B0()
{
  return MEMORY[0x1F40E5A58]();
}

uint64_t sub_1A962E9C0()
{
  return MEMORY[0x1F40E5A80]();
}

uint64_t sub_1A962E9D0()
{
  return MEMORY[0x1F40E5AB8]();
}

uint64_t sub_1A962E9E0()
{
  return MEMORY[0x1F40E5AE0]();
}

uint64_t sub_1A962E9F0()
{
  return MEMORY[0x1F40E5AF0]();
}

uint64_t sub_1A962EA00()
{
  return MEMORY[0x1F40E5B18]();
}

uint64_t sub_1A962EA10()
{
  return MEMORY[0x1F40E5CD0]();
}

uint64_t sub_1A962EA20()
{
  return MEMORY[0x1F40E5D20]();
}

uint64_t sub_1A962EA30()
{
  return MEMORY[0x1F40E5D60]();
}

uint64_t sub_1A962EA40()
{
  return MEMORY[0x1F40E5D70]();
}

uint64_t sub_1A962EA90()
{
  return MEMORY[0x1F415F268]();
}

uint64_t _s11TeaSettings0B0C13WeatherDaemonE0D0V20AttributionOverridesCfd_0()
{
  return MEMORY[0x1F415F290]();
}

uint64_t sub_1A962EAC0()
{
  return MEMORY[0x1F415F2E8]();
}

uint64_t sub_1A962EAD0()
{
  return MEMORY[0x1F415F2F0]();
}

uint64_t sub_1A962EAE0()
{
  return MEMORY[0x1F415F300]();
}

uint64_t sub_1A962EAF0()
{
  return MEMORY[0x1F415F3E8]();
}

uint64_t sub_1A962EB00()
{
  return MEMORY[0x1F415F3F0]();
}

uint64_t sub_1A962EB10()
{
  return MEMORY[0x1F415F3F8]();
}

uint64_t sub_1A962EB20()
{
  return MEMORY[0x1F415F428]();
}

uint64_t sub_1A962EB30()
{
  return MEMORY[0x1F415F450]();
}

uint64_t sub_1A962EB40()
{
  return MEMORY[0x1F415F458]();
}

uint64_t sub_1A962EB50()
{
  return MEMORY[0x1F415F488]();
}

uint64_t sub_1A962EB60()
{
  return MEMORY[0x1F415F4D0]();
}

uint64_t sub_1A962EB90()
{
  return MEMORY[0x1F4169688]();
}

uint64_t sub_1A962EBA0()
{
  return MEMORY[0x1F4169690]();
}

uint64_t sub_1A962EBB0()
{
  return MEMORY[0x1F4169698]();
}

uint64_t sub_1A962EBC0()
{
  return MEMORY[0x1F41696A0]();
}

uint64_t sub_1A962EBD0()
{
  return MEMORY[0x1F41696A8]();
}

uint64_t sub_1A962EBE0()
{
  return MEMORY[0x1F41696B0]();
}

uint64_t sub_1A962EBF0()
{
  return MEMORY[0x1F41696B8]();
}

uint64_t sub_1A962EC00()
{
  return MEMORY[0x1F41696C0]();
}

uint64_t sub_1A962EC10()
{
  return MEMORY[0x1F41696C8]();
}

uint64_t sub_1A962EC20()
{
  return MEMORY[0x1F41696D0]();
}

uint64_t sub_1A962EC30()
{
  return MEMORY[0x1F41696D8]();
}

uint64_t sub_1A962EC40()
{
  return MEMORY[0x1F41696E0]();
}

uint64_t sub_1A962EC50()
{
  return MEMORY[0x1F41696E8]();
}

uint64_t sub_1A962EC60()
{
  return MEMORY[0x1F41696F0]();
}

uint64_t sub_1A962EC70()
{
  return MEMORY[0x1F41696F8]();
}

uint64_t sub_1A962EC80()
{
  return MEMORY[0x1F4169700]();
}

uint64_t sub_1A962EC90()
{
  return MEMORY[0x1F4169708]();
}

uint64_t sub_1A962ECA0()
{
  return MEMORY[0x1F4169710]();
}

uint64_t sub_1A962ECB0()
{
  return MEMORY[0x1F4169718]();
}

uint64_t sub_1A962ECC0()
{
  return MEMORY[0x1F4169720]();
}

uint64_t sub_1A962ECD0()
{
  return MEMORY[0x1F4169728]();
}

uint64_t sub_1A962ECE0()
{
  return MEMORY[0x1F4169730]();
}

uint64_t sub_1A962ECF0()
{
  return MEMORY[0x1F4169738]();
}

uint64_t sub_1A962ED00()
{
  return MEMORY[0x1F4169740]();
}

uint64_t sub_1A962ED10()
{
  return MEMORY[0x1F4169748]();
}

uint64_t sub_1A962ED20()
{
  return MEMORY[0x1F4169750]();
}

uint64_t sub_1A962ED30()
{
  return MEMORY[0x1F4169758]();
}

uint64_t sub_1A962ED40()
{
  return MEMORY[0x1F4169760]();
}

uint64_t sub_1A962ED50()
{
  return MEMORY[0x1F4169768]();
}

uint64_t sub_1A962ED60()
{
  return MEMORY[0x1F4169770]();
}

uint64_t sub_1A962ED70()
{
  return MEMORY[0x1F4169778]();
}

uint64_t sub_1A962ED80()
{
  return MEMORY[0x1F4169780]();
}

uint64_t sub_1A962ED90()
{
  return MEMORY[0x1F4169788]();
}

uint64_t sub_1A962EDA0()
{
  return MEMORY[0x1F4169790]();
}

uint64_t sub_1A962EDB0()
{
  return MEMORY[0x1F4169798]();
}

uint64_t sub_1A962EDC0()
{
  return MEMORY[0x1F41697A0]();
}

uint64_t sub_1A962EDD0()
{
  return MEMORY[0x1F41697A8]();
}

uint64_t sub_1A962EDE0()
{
  return MEMORY[0x1F41697B0]();
}

uint64_t sub_1A962EDF0()
{
  return MEMORY[0x1F41697B8]();
}

uint64_t sub_1A962EE00()
{
  return MEMORY[0x1F41697C0]();
}

uint64_t sub_1A962EE10()
{
  return MEMORY[0x1F41697C8]();
}

uint64_t sub_1A962EE20()
{
  return MEMORY[0x1F41697D0]();
}

uint64_t sub_1A962EE30()
{
  return MEMORY[0x1F41697D8]();
}

uint64_t sub_1A962EE40()
{
  return MEMORY[0x1F41697E0]();
}

uint64_t sub_1A962EE50()
{
  return MEMORY[0x1F41697E8]();
}

uint64_t sub_1A962EE60()
{
  return MEMORY[0x1F41697F0]();
}

uint64_t sub_1A962EE70()
{
  return MEMORY[0x1F41697F8]();
}

uint64_t sub_1A962EE80()
{
  return MEMORY[0x1F4169800]();
}

uint64_t sub_1A962EE90()
{
  return MEMORY[0x1F4169808]();
}

uint64_t sub_1A962EEA0()
{
  return MEMORY[0x1F4169810]();
}

uint64_t sub_1A962EEB0()
{
  return MEMORY[0x1F4169818]();
}

uint64_t sub_1A962EEC0()
{
  return MEMORY[0x1F4169820]();
}

uint64_t sub_1A962EED0()
{
  return MEMORY[0x1F4169828]();
}

uint64_t sub_1A962EEE0()
{
  return MEMORY[0x1F4169830]();
}

uint64_t sub_1A962EEF0()
{
  return MEMORY[0x1F4169838]();
}

uint64_t sub_1A962EF00()
{
  return MEMORY[0x1F4169840]();
}

uint64_t sub_1A962EF10()
{
  return MEMORY[0x1F4169848]();
}

uint64_t sub_1A962EF20()
{
  return MEMORY[0x1F4169850]();
}

uint64_t sub_1A962EF30()
{
  return MEMORY[0x1F4169858]();
}

uint64_t sub_1A962EF40()
{
  return MEMORY[0x1F4169860]();
}

uint64_t sub_1A962EF50()
{
  return MEMORY[0x1F4169868]();
}

uint64_t sub_1A962EF60()
{
  return MEMORY[0x1F4169870]();
}

uint64_t sub_1A962EF70()
{
  return MEMORY[0x1F4169878]();
}

uint64_t sub_1A962EF80()
{
  return MEMORY[0x1F4169880]();
}

uint64_t sub_1A962EF90()
{
  return MEMORY[0x1F4169888]();
}

uint64_t sub_1A962EFA0()
{
  return MEMORY[0x1F4169890]();
}

uint64_t sub_1A962EFB0()
{
  return MEMORY[0x1F4169898]();
}

uint64_t sub_1A962EFC0()
{
  return MEMORY[0x1F41698A0]();
}

uint64_t sub_1A962EFD0()
{
  return MEMORY[0x1F41698A8]();
}

uint64_t sub_1A962EFE0()
{
  return MEMORY[0x1F41698B0]();
}

uint64_t sub_1A962EFF0()
{
  return MEMORY[0x1F41698B8]();
}

uint64_t sub_1A962F000()
{
  return MEMORY[0x1F41698C0]();
}

uint64_t sub_1A962F010()
{
  return MEMORY[0x1F41698C8]();
}

uint64_t sub_1A962F020()
{
  return MEMORY[0x1F41698D0]();
}

uint64_t sub_1A962F030()
{
  return MEMORY[0x1F41698D8]();
}

uint64_t sub_1A962F040()
{
  return MEMORY[0x1F41698E0]();
}

uint64_t sub_1A962F050()
{
  return MEMORY[0x1F41698E8]();
}

uint64_t sub_1A962F060()
{
  return MEMORY[0x1F41698F0]();
}

uint64_t sub_1A962F070()
{
  return MEMORY[0x1F41698F8]();
}

uint64_t sub_1A962F080()
{
  return MEMORY[0x1F4169900]();
}

uint64_t sub_1A962F090()
{
  return MEMORY[0x1F4169908]();
}

uint64_t sub_1A962F0A0()
{
  return MEMORY[0x1F4169910]();
}

uint64_t sub_1A962F0B0()
{
  return MEMORY[0x1F4169918]();
}

uint64_t sub_1A962F0C0()
{
  return MEMORY[0x1F4169920]();
}

uint64_t sub_1A962F0D0()
{
  return MEMORY[0x1F4169928]();
}

uint64_t sub_1A962F0E0()
{
  return MEMORY[0x1F4169930]();
}

uint64_t sub_1A962F0F0()
{
  return MEMORY[0x1F4169938]();
}

uint64_t sub_1A962F100()
{
  return MEMORY[0x1F4169940]();
}

uint64_t sub_1A962F110()
{
  return MEMORY[0x1F4169948]();
}

uint64_t sub_1A962F120()
{
  return MEMORY[0x1F4169950]();
}

uint64_t sub_1A962F130()
{
  return MEMORY[0x1F4169958]();
}

uint64_t sub_1A962F140()
{
  return MEMORY[0x1F4169960]();
}

uint64_t sub_1A962F150()
{
  return MEMORY[0x1F4169968]();
}

uint64_t sub_1A962F160()
{
  return MEMORY[0x1F4169970]();
}

uint64_t sub_1A962F170()
{
  return MEMORY[0x1F4169978]();
}

uint64_t sub_1A962F180()
{
  return MEMORY[0x1F4169980]();
}

uint64_t sub_1A962F190()
{
  return MEMORY[0x1F4169988]();
}

uint64_t sub_1A962F1A0()
{
  return MEMORY[0x1F4169990]();
}

uint64_t sub_1A962F1B0()
{
  return MEMORY[0x1F4169998]();
}

uint64_t sub_1A962F1C0()
{
  return MEMORY[0x1F41699A0]();
}

uint64_t sub_1A962F1D0()
{
  return MEMORY[0x1F41699A8]();
}

uint64_t sub_1A962F1E0()
{
  return MEMORY[0x1F41699B0]();
}

uint64_t sub_1A962F1F0()
{
  return MEMORY[0x1F41699B8]();
}

uint64_t sub_1A962F200()
{
  return MEMORY[0x1F41699C0]();
}

uint64_t sub_1A962F210()
{
  return MEMORY[0x1F41699C8]();
}

uint64_t sub_1A962F220()
{
  return MEMORY[0x1F41699D0]();
}

uint64_t sub_1A962F230()
{
  return MEMORY[0x1F41699D8]();
}

uint64_t sub_1A962F240()
{
  return MEMORY[0x1F41699E0]();
}

uint64_t sub_1A962F250()
{
  return MEMORY[0x1F41699E8]();
}

uint64_t sub_1A962F260()
{
  return MEMORY[0x1F41699F0]();
}

uint64_t sub_1A962F270()
{
  return MEMORY[0x1F41699F8]();
}

uint64_t sub_1A962F280()
{
  return MEMORY[0x1F4169A00]();
}

uint64_t sub_1A962F290()
{
  return MEMORY[0x1F4169A08]();
}

uint64_t sub_1A962F2A0()
{
  return MEMORY[0x1F4169A10]();
}

uint64_t sub_1A962F2B0()
{
  return MEMORY[0x1F4169A18]();
}

uint64_t sub_1A962F2C0()
{
  return MEMORY[0x1F4169A20]();
}

uint64_t sub_1A962F2D0()
{
  return MEMORY[0x1F4169A28]();
}

uint64_t sub_1A962F2E0()
{
  return MEMORY[0x1F4169A30]();
}

uint64_t sub_1A962F2F0()
{
  return MEMORY[0x1F4169A38]();
}

uint64_t sub_1A962F300()
{
  return MEMORY[0x1F4169A40]();
}

uint64_t sub_1A962F310()
{
  return MEMORY[0x1F4169A48]();
}

uint64_t sub_1A962F320()
{
  return MEMORY[0x1F4169A50]();
}

uint64_t sub_1A962F330()
{
  return MEMORY[0x1F4169A58]();
}

uint64_t sub_1A962F340()
{
  return MEMORY[0x1F4169A60]();
}

uint64_t sub_1A962F350()
{
  return MEMORY[0x1F4169A68]();
}

uint64_t sub_1A962F360()
{
  return MEMORY[0x1F4169A70]();
}

uint64_t sub_1A962F370()
{
  return MEMORY[0x1F4169A78]();
}

uint64_t sub_1A962F380()
{
  return MEMORY[0x1F4169A80]();
}

uint64_t sub_1A962F390()
{
  return MEMORY[0x1F4169A88]();
}

uint64_t sub_1A962F3A0()
{
  return MEMORY[0x1F4169A90]();
}

uint64_t sub_1A962F3B0()
{
  return MEMORY[0x1F4169A98]();
}

uint64_t sub_1A962F3C0()
{
  return MEMORY[0x1F4169AA0]();
}

uint64_t sub_1A962F3D0()
{
  return MEMORY[0x1F4169AA8]();
}

uint64_t sub_1A962F3E0()
{
  return MEMORY[0x1F4169AB0]();
}

uint64_t sub_1A962F3F0()
{
  return MEMORY[0x1F4169AB8]();
}

uint64_t sub_1A962F400()
{
  return MEMORY[0x1F4169AC0]();
}

uint64_t sub_1A962F410()
{
  return MEMORY[0x1F4169AC8]();
}

uint64_t sub_1A962F420()
{
  return MEMORY[0x1F4169AD0]();
}

uint64_t sub_1A962F430()
{
  return MEMORY[0x1F4169AD8]();
}

uint64_t sub_1A962F440()
{
  return MEMORY[0x1F4169AE0]();
}

uint64_t sub_1A962F450()
{
  return MEMORY[0x1F4169AE8]();
}

uint64_t sub_1A962F460()
{
  return MEMORY[0x1F4169AF0]();
}

uint64_t sub_1A962F470()
{
  return MEMORY[0x1F4169AF8]();
}

uint64_t sub_1A962F480()
{
  return MEMORY[0x1F4169B00]();
}

uint64_t sub_1A962F490()
{
  return MEMORY[0x1F4169B08]();
}

uint64_t sub_1A962F4A0()
{
  return MEMORY[0x1F4169B10]();
}

uint64_t sub_1A962F4B0()
{
  return MEMORY[0x1F4169B18]();
}

uint64_t sub_1A962F4C0()
{
  return MEMORY[0x1F4169B20]();
}

uint64_t sub_1A962F4D0()
{
  return MEMORY[0x1F4169B28]();
}

uint64_t sub_1A962F4E0()
{
  return MEMORY[0x1F4169B30]();
}

uint64_t sub_1A962F4F0()
{
  return MEMORY[0x1F4169B38]();
}

uint64_t sub_1A962F500()
{
  return MEMORY[0x1F4169B40]();
}

uint64_t sub_1A962F510()
{
  return MEMORY[0x1F4169B48]();
}

uint64_t sub_1A962F520()
{
  return MEMORY[0x1F4169B50]();
}

uint64_t sub_1A962F530()
{
  return MEMORY[0x1F4169B58]();
}

uint64_t sub_1A962F540()
{
  return MEMORY[0x1F4169B60]();
}

uint64_t sub_1A962F550()
{
  return MEMORY[0x1F4169B68]();
}

uint64_t sub_1A962F560()
{
  return MEMORY[0x1F4169B70]();
}

uint64_t sub_1A962F570()
{
  return MEMORY[0x1F4169B78]();
}

uint64_t sub_1A962F580()
{
  return MEMORY[0x1F4169B80]();
}

uint64_t sub_1A962F590()
{
  return MEMORY[0x1F4169B88]();
}

uint64_t sub_1A962F5A0()
{
  return MEMORY[0x1F4169B90]();
}

uint64_t sub_1A962F5B0()
{
  return MEMORY[0x1F4169B98]();
}

uint64_t sub_1A962F5C0()
{
  return MEMORY[0x1F4169BA0]();
}

uint64_t sub_1A962F5D0()
{
  return MEMORY[0x1F4169BA8]();
}

uint64_t sub_1A962F5E0()
{
  return MEMORY[0x1F4169BB0]();
}

uint64_t sub_1A962F5F0()
{
  return MEMORY[0x1F4169BB8]();
}

uint64_t sub_1A962F600()
{
  return MEMORY[0x1F4169BC0]();
}

uint64_t sub_1A962F610()
{
  return MEMORY[0x1F4169BC8]();
}

uint64_t sub_1A962F620()
{
  return MEMORY[0x1F4169BD0]();
}

uint64_t sub_1A962F630()
{
  return MEMORY[0x1F4169BD8]();
}

uint64_t sub_1A962F640()
{
  return MEMORY[0x1F4169BE0]();
}

uint64_t sub_1A962F650()
{
  return MEMORY[0x1F4169BE8]();
}

uint64_t sub_1A962F660()
{
  return MEMORY[0x1F4169BF0]();
}

uint64_t sub_1A962F670()
{
  return MEMORY[0x1F4169BF8]();
}

uint64_t sub_1A962F680()
{
  return MEMORY[0x1F4169C00]();
}

uint64_t sub_1A962F690()
{
  return MEMORY[0x1F4169C08]();
}

uint64_t sub_1A962F6A0()
{
  return MEMORY[0x1F4169C10]();
}

uint64_t sub_1A962F6B0()
{
  return MEMORY[0x1F4169C18]();
}

uint64_t sub_1A962F6C0()
{
  return MEMORY[0x1F4169C20]();
}

uint64_t sub_1A962F6D0()
{
  return MEMORY[0x1F4169C28]();
}

uint64_t sub_1A962F6E0()
{
  return MEMORY[0x1F4169C30]();
}

uint64_t sub_1A962F6F0()
{
  return MEMORY[0x1F4169C38]();
}

uint64_t sub_1A962F700()
{
  return MEMORY[0x1F4169C40]();
}

uint64_t sub_1A962F710()
{
  return MEMORY[0x1F4169C48]();
}

uint64_t sub_1A962F720()
{
  return MEMORY[0x1F4169C50]();
}

uint64_t sub_1A962F730()
{
  return MEMORY[0x1F4169C58]();
}

uint64_t sub_1A962F740()
{
  return MEMORY[0x1F4169C60]();
}

uint64_t sub_1A962F750()
{
  return MEMORY[0x1F4169C68]();
}

uint64_t sub_1A962F760()
{
  return MEMORY[0x1F4169C70]();
}

uint64_t sub_1A962F770()
{
  return MEMORY[0x1F4169C78]();
}

uint64_t sub_1A962F780()
{
  return MEMORY[0x1F4169C80]();
}

uint64_t sub_1A962F790()
{
  return MEMORY[0x1F4169C88]();
}

uint64_t sub_1A962F7A0()
{
  return MEMORY[0x1F4169C90]();
}

uint64_t sub_1A962F7B0()
{
  return MEMORY[0x1F4169C98]();
}

uint64_t sub_1A962F7C0()
{
  return MEMORY[0x1F4169CA0]();
}

uint64_t sub_1A962F7D0()
{
  return MEMORY[0x1F4169CA8]();
}

uint64_t sub_1A962F7E0()
{
  return MEMORY[0x1F4169CB0]();
}

uint64_t sub_1A962F7F0()
{
  return MEMORY[0x1F4169CB8]();
}

uint64_t sub_1A962F800()
{
  return MEMORY[0x1F4169CC0]();
}

uint64_t sub_1A962F810()
{
  return MEMORY[0x1F4169CC8]();
}

uint64_t sub_1A962F820()
{
  return MEMORY[0x1F4169CD0]();
}

uint64_t sub_1A962F830()
{
  return MEMORY[0x1F4169CD8]();
}

uint64_t sub_1A962F840()
{
  return MEMORY[0x1F4169CE0]();
}

uint64_t sub_1A962F850()
{
  return MEMORY[0x1F4169CE8]();
}

uint64_t sub_1A962F860()
{
  return MEMORY[0x1F4169CF0]();
}

uint64_t sub_1A962F870()
{
  return MEMORY[0x1F4169CF8]();
}

uint64_t sub_1A962F880()
{
  return MEMORY[0x1F4169D00]();
}

uint64_t sub_1A962F890()
{
  return MEMORY[0x1F4169D08]();
}

uint64_t sub_1A962F8A0()
{
  return MEMORY[0x1F4169D10]();
}

uint64_t sub_1A962F8B0()
{
  return MEMORY[0x1F4169D18]();
}

uint64_t sub_1A962F8C0()
{
  return MEMORY[0x1F4169D20]();
}

uint64_t sub_1A962F8D0()
{
  return MEMORY[0x1F4169D28]();
}

uint64_t sub_1A962F8E0()
{
  return MEMORY[0x1F4169D30]();
}

uint64_t sub_1A962F8F0()
{
  return MEMORY[0x1F4169D38]();
}

uint64_t sub_1A962F900()
{
  return MEMORY[0x1F4169D40]();
}

uint64_t sub_1A962F910()
{
  return MEMORY[0x1F4169D48]();
}

uint64_t sub_1A962F920()
{
  return MEMORY[0x1F4169D50]();
}

uint64_t sub_1A962F930()
{
  return MEMORY[0x1F4169D58]();
}

uint64_t sub_1A962F940()
{
  return MEMORY[0x1F4169D60]();
}

uint64_t sub_1A962F950()
{
  return MEMORY[0x1F4169D68]();
}

uint64_t sub_1A962F960()
{
  return MEMORY[0x1F4169D70]();
}

uint64_t sub_1A962F970()
{
  return MEMORY[0x1F4169D78]();
}

uint64_t sub_1A962F980()
{
  return MEMORY[0x1F4169D80]();
}

uint64_t sub_1A962F990()
{
  return MEMORY[0x1F4169D88]();
}

uint64_t sub_1A962F9A0()
{
  return MEMORY[0x1F4169D90]();
}

uint64_t sub_1A962F9B0()
{
  return MEMORY[0x1F4169D98]();
}

uint64_t sub_1A962F9C0()
{
  return MEMORY[0x1F4169DA0]();
}

uint64_t sub_1A962F9D0()
{
  return MEMORY[0x1F4169DA8]();
}

uint64_t sub_1A962F9E0()
{
  return MEMORY[0x1F4169DB0]();
}

uint64_t sub_1A962F9F0()
{
  return MEMORY[0x1F4169DB8]();
}

uint64_t sub_1A962FA00()
{
  return MEMORY[0x1F4169DC0]();
}

uint64_t sub_1A962FA10()
{
  return MEMORY[0x1F4169DC8]();
}

uint64_t sub_1A962FA20()
{
  return MEMORY[0x1F4169DD0]();
}

uint64_t sub_1A962FA30()
{
  return MEMORY[0x1F4169DD8]();
}

uint64_t sub_1A962FA40()
{
  return MEMORY[0x1F4169DE0]();
}

uint64_t sub_1A962FA50()
{
  return MEMORY[0x1F4169DE8]();
}

uint64_t sub_1A962FA60()
{
  return MEMORY[0x1F4169DF0]();
}

uint64_t sub_1A962FA70()
{
  return MEMORY[0x1F4169DF8]();
}

uint64_t sub_1A962FA80()
{
  return MEMORY[0x1F4169E00]();
}

uint64_t sub_1A962FA90()
{
  return MEMORY[0x1F4169E08]();
}

uint64_t sub_1A962FAA0()
{
  return MEMORY[0x1F4169E10]();
}

uint64_t sub_1A962FAB0()
{
  return MEMORY[0x1F4169E18]();
}

uint64_t sub_1A962FAC0()
{
  return MEMORY[0x1F4169E20]();
}

uint64_t sub_1A962FAD0()
{
  return MEMORY[0x1F4169E28]();
}

uint64_t sub_1A962FAE0()
{
  return MEMORY[0x1F4169E30]();
}

uint64_t sub_1A962FAF0()
{
  return MEMORY[0x1F4169E38]();
}

uint64_t sub_1A962FB00()
{
  return MEMORY[0x1F4169E40]();
}

uint64_t sub_1A962FB10()
{
  return MEMORY[0x1F4169E48]();
}

uint64_t sub_1A962FB20()
{
  return MEMORY[0x1F4169E50]();
}

uint64_t sub_1A962FB30()
{
  return MEMORY[0x1F4169E58]();
}

uint64_t sub_1A962FB40()
{
  return MEMORY[0x1F4169E60]();
}

uint64_t sub_1A962FB50()
{
  return MEMORY[0x1F4169E68]();
}

uint64_t sub_1A962FB60()
{
  return MEMORY[0x1F4169E70]();
}

uint64_t sub_1A962FB70()
{
  return MEMORY[0x1F4169E78]();
}

uint64_t sub_1A962FB80()
{
  return MEMORY[0x1F4169E80]();
}

uint64_t sub_1A962FB90()
{
  return MEMORY[0x1F4169E88]();
}

uint64_t sub_1A962FBA0()
{
  return MEMORY[0x1F4169E90]();
}

uint64_t sub_1A962FBB0()
{
  return MEMORY[0x1F4169E98]();
}

uint64_t sub_1A962FBC0()
{
  return MEMORY[0x1F4169EA0]();
}

uint64_t sub_1A962FBD0()
{
  return MEMORY[0x1F4169EA8]();
}

uint64_t sub_1A962FBE0()
{
  return MEMORY[0x1F4169EB0]();
}

uint64_t sub_1A962FBF0()
{
  return MEMORY[0x1F4169EB8]();
}

uint64_t sub_1A962FC00()
{
  return MEMORY[0x1F4169EC0]();
}

uint64_t sub_1A962FC10()
{
  return MEMORY[0x1F4169EC8]();
}

uint64_t sub_1A962FC20()
{
  return MEMORY[0x1F4169ED0]();
}

uint64_t sub_1A962FC30()
{
  return MEMORY[0x1F4169ED8]();
}

uint64_t sub_1A962FC40()
{
  return MEMORY[0x1F4169EE0]();
}

uint64_t sub_1A962FC50()
{
  return MEMORY[0x1F4169EE8]();
}

uint64_t sub_1A962FC60()
{
  return MEMORY[0x1F4169EF0]();
}

uint64_t sub_1A962FC70()
{
  return MEMORY[0x1F4169EF8]();
}

uint64_t sub_1A962FC80()
{
  return MEMORY[0x1F4169F00]();
}

uint64_t sub_1A962FC90()
{
  return MEMORY[0x1F4169F08]();
}

uint64_t sub_1A962FCA0()
{
  return MEMORY[0x1F4169F10]();
}

uint64_t sub_1A962FCB0()
{
  return MEMORY[0x1F4169F18]();
}

uint64_t sub_1A962FCC0()
{
  return MEMORY[0x1F4169F20]();
}

uint64_t sub_1A962FCD0()
{
  return MEMORY[0x1F4169F28]();
}

uint64_t sub_1A962FCE0()
{
  return MEMORY[0x1F4169F30]();
}

uint64_t sub_1A962FCF0()
{
  return MEMORY[0x1F4169F38]();
}

uint64_t sub_1A962FD00()
{
  return MEMORY[0x1F4169F40]();
}

uint64_t sub_1A962FD10()
{
  return MEMORY[0x1F4169F48]();
}

uint64_t sub_1A962FD20()
{
  return MEMORY[0x1F4169F50]();
}

uint64_t sub_1A962FD30()
{
  return MEMORY[0x1F4169F58]();
}

uint64_t sub_1A962FD40()
{
  return MEMORY[0x1F4169F60]();
}

uint64_t sub_1A962FD50()
{
  return MEMORY[0x1F4169F68]();
}

uint64_t sub_1A962FD60()
{
  return MEMORY[0x1F4169F70]();
}

uint64_t sub_1A962FD70()
{
  return MEMORY[0x1F4169F78]();
}

uint64_t sub_1A962FD80()
{
  return MEMORY[0x1F4169F80]();
}

uint64_t sub_1A962FD90()
{
  return MEMORY[0x1F4169F88]();
}

uint64_t sub_1A962FDA0()
{
  return MEMORY[0x1F4169F90]();
}

uint64_t sub_1A962FDB0()
{
  return MEMORY[0x1F4169F98]();
}

uint64_t sub_1A962FDC0()
{
  return MEMORY[0x1F4169FA0]();
}

uint64_t sub_1A962FDE0()
{
  return MEMORY[0x1F4169FB0]();
}

uint64_t sub_1A962FDF0()
{
  return MEMORY[0x1F4169FB8]();
}

uint64_t sub_1A962FE00()
{
  return MEMORY[0x1F4169FC0]();
}

uint64_t sub_1A962FE10()
{
  return MEMORY[0x1F4169FC8]();
}

uint64_t sub_1A962FE20()
{
  return MEMORY[0x1F4169FD0]();
}

uint64_t sub_1A962FE30()
{
  return MEMORY[0x1F4169FD8]();
}

uint64_t sub_1A962FE40()
{
  return MEMORY[0x1F4169FE0]();
}

uint64_t sub_1A962FE50()
{
  return MEMORY[0x1F4169FE8]();
}

uint64_t sub_1A962FE60()
{
  return MEMORY[0x1F4169FF0]();
}

uint64_t sub_1A962FE70()
{
  return MEMORY[0x1F4169FF8]();
}

uint64_t sub_1A962FE80()
{
  return MEMORY[0x1F416A000]();
}

uint64_t sub_1A962FE90()
{
  return MEMORY[0x1F416A008]();
}

uint64_t sub_1A962FEA0()
{
  return MEMORY[0x1F416A010]();
}

uint64_t sub_1A962FEB0()
{
  return MEMORY[0x1F416A018]();
}

uint64_t sub_1A962FEC0()
{
  return MEMORY[0x1F416A020]();
}

uint64_t sub_1A962FED0()
{
  return MEMORY[0x1F416A028]();
}

uint64_t sub_1A962FEE0()
{
  return MEMORY[0x1F416A030]();
}

uint64_t sub_1A962FEF0()
{
  return MEMORY[0x1F416A038]();
}

uint64_t sub_1A962FF00()
{
  return MEMORY[0x1F416A040]();
}

uint64_t sub_1A962FF10()
{
  return MEMORY[0x1F416A048]();
}

uint64_t sub_1A962FF20()
{
  return MEMORY[0x1F416A050]();
}

uint64_t sub_1A962FF30()
{
  return MEMORY[0x1F416A058]();
}

uint64_t sub_1A962FF40()
{
  return MEMORY[0x1F416A060]();
}

uint64_t sub_1A962FF50()
{
  return MEMORY[0x1F416A068]();
}

uint64_t sub_1A962FF60()
{
  return MEMORY[0x1F416A070]();
}

uint64_t sub_1A962FF70()
{
  return MEMORY[0x1F416A078]();
}

uint64_t sub_1A962FF80()
{
  return MEMORY[0x1F416A080]();
}

uint64_t sub_1A962FF90()
{
  return MEMORY[0x1F416A088]();
}

uint64_t sub_1A962FFA0()
{
  return MEMORY[0x1F416A090]();
}

uint64_t sub_1A962FFB0()
{
  return MEMORY[0x1F416A098]();
}

uint64_t sub_1A962FFC0()
{
  return MEMORY[0x1F416A0A0]();
}

uint64_t sub_1A962FFD0()
{
  return MEMORY[0x1F416A0A8]();
}

uint64_t sub_1A962FFE0()
{
  return MEMORY[0x1F416A0B0]();
}

uint64_t sub_1A962FFF0()
{
  return MEMORY[0x1F416A0B8]();
}

uint64_t sub_1A9630000()
{
  return MEMORY[0x1F416A0C0]();
}

uint64_t sub_1A9630010()
{
  return MEMORY[0x1F416A0C8]();
}

uint64_t sub_1A9630020()
{
  return MEMORY[0x1F416A0D0]();
}

uint64_t sub_1A9630030()
{
  return MEMORY[0x1F416A0D8]();
}

uint64_t sub_1A9630040()
{
  return MEMORY[0x1F416A0E0]();
}

uint64_t sub_1A9630050()
{
  return MEMORY[0x1F416A0E8]();
}

uint64_t sub_1A9630060()
{
  return MEMORY[0x1F416A0F0]();
}

uint64_t sub_1A9630070()
{
  return MEMORY[0x1F416A0F8]();
}

uint64_t sub_1A9630080()
{
  return MEMORY[0x1F416A100]();
}

uint64_t sub_1A9630090()
{
  return MEMORY[0x1F416A108]();
}

uint64_t sub_1A96300A0()
{
  return MEMORY[0x1F416A110]();
}

uint64_t sub_1A96300B0()
{
  return MEMORY[0x1F416A118]();
}

uint64_t sub_1A96300C0()
{
  return MEMORY[0x1F416A120]();
}

uint64_t sub_1A96300D0()
{
  return MEMORY[0x1F416A128]();
}

uint64_t sub_1A96300E0()
{
  return MEMORY[0x1F416A130]();
}

uint64_t sub_1A96300F0()
{
  return MEMORY[0x1F416A138]();
}

uint64_t sub_1A9630100()
{
  return MEMORY[0x1F416A140]();
}

uint64_t sub_1A9630110()
{
  return MEMORY[0x1F416A148]();
}

uint64_t sub_1A9630120()
{
  return MEMORY[0x1F416A150]();
}

uint64_t sub_1A9630130()
{
  return MEMORY[0x1F416A158]();
}

uint64_t sub_1A9630140()
{
  return MEMORY[0x1F416A160]();
}

uint64_t sub_1A9630150()
{
  return MEMORY[0x1F416A168]();
}

uint64_t sub_1A9630160()
{
  return MEMORY[0x1F416A170]();
}

uint64_t sub_1A9630170()
{
  return MEMORY[0x1F416A178]();
}

uint64_t sub_1A9630180()
{
  return MEMORY[0x1F416A180]();
}

uint64_t sub_1A9630190()
{
  return MEMORY[0x1F416A188]();
}

uint64_t sub_1A96301A0()
{
  return MEMORY[0x1F416A190]();
}

uint64_t sub_1A96301B0()
{
  return MEMORY[0x1F416A198]();
}

uint64_t sub_1A96301C0()
{
  return MEMORY[0x1F416A1A0]();
}

uint64_t sub_1A96301D0()
{
  return MEMORY[0x1F416A1A8]();
}

uint64_t sub_1A96301E0()
{
  return MEMORY[0x1F416A1B0]();
}

uint64_t sub_1A96301F0()
{
  return MEMORY[0x1F416A1B8]();
}

uint64_t sub_1A9630200()
{
  return MEMORY[0x1F416A1C0]();
}

uint64_t sub_1A9630210()
{
  return MEMORY[0x1F416A1C8]();
}

uint64_t sub_1A9630220()
{
  return MEMORY[0x1F416A1D0]();
}

uint64_t sub_1A9630230()
{
  return MEMORY[0x1F416A1D8]();
}

uint64_t sub_1A9630240()
{
  return MEMORY[0x1F416A1E0]();
}

uint64_t sub_1A9630250()
{
  return MEMORY[0x1F416A1E8]();
}

uint64_t sub_1A9630260()
{
  return MEMORY[0x1F416A1F0]();
}

uint64_t sub_1A9630270()
{
  return MEMORY[0x1F416A1F8]();
}

uint64_t sub_1A9630280()
{
  return MEMORY[0x1F416A200]();
}

uint64_t sub_1A9630290()
{
  return MEMORY[0x1F416A208]();
}

uint64_t sub_1A96302A0()
{
  return MEMORY[0x1F416A210]();
}

uint64_t sub_1A96302B0()
{
  return MEMORY[0x1F416A218]();
}

uint64_t sub_1A96302C0()
{
  return MEMORY[0x1F416A220]();
}

uint64_t sub_1A96302D0()
{
  return MEMORY[0x1F416A228]();
}

uint64_t sub_1A96302E0()
{
  return MEMORY[0x1F416A230]();
}

uint64_t sub_1A96302F0()
{
  return MEMORY[0x1F416A238]();
}

uint64_t sub_1A9630300()
{
  return MEMORY[0x1F416A240]();
}

uint64_t sub_1A9630310()
{
  return MEMORY[0x1F416A248]();
}

uint64_t sub_1A9630320()
{
  return MEMORY[0x1F416A250]();
}

uint64_t sub_1A9630330()
{
  return MEMORY[0x1F416A258]();
}

uint64_t sub_1A9630340()
{
  return MEMORY[0x1F416A260]();
}

uint64_t sub_1A9630350()
{
  return MEMORY[0x1F416A268]();
}

uint64_t sub_1A9630360()
{
  return MEMORY[0x1F416A270]();
}

uint64_t sub_1A9630370()
{
  return MEMORY[0x1F416A278]();
}

uint64_t sub_1A9630380()
{
  return MEMORY[0x1F416A280]();
}

uint64_t sub_1A9630390()
{
  return MEMORY[0x1F416A288]();
}

uint64_t sub_1A96303A0()
{
  return MEMORY[0x1F416A290]();
}

uint64_t sub_1A96303B0()
{
  return MEMORY[0x1F416A298]();
}

uint64_t sub_1A96303C0()
{
  return MEMORY[0x1F416A2A0]();
}

uint64_t sub_1A96303D0()
{
  return MEMORY[0x1F416A2A8]();
}

uint64_t sub_1A96303E0()
{
  return MEMORY[0x1F416A2B0]();
}

uint64_t sub_1A96303F0()
{
  return MEMORY[0x1F416A2B8]();
}

uint64_t sub_1A9630400()
{
  return MEMORY[0x1F416A2C0]();
}

uint64_t sub_1A9630410()
{
  return MEMORY[0x1F416A2C8]();
}

uint64_t sub_1A9630420()
{
  return MEMORY[0x1F416A2D0]();
}

uint64_t sub_1A9630440()
{
  return MEMORY[0x1F416A2E0]();
}

uint64_t sub_1A9630450()
{
  return MEMORY[0x1F416A2E8]();
}

uint64_t sub_1A9630460()
{
  return MEMORY[0x1F416A2F0]();
}

uint64_t sub_1A9630470()
{
  return MEMORY[0x1F416A2F8]();
}

uint64_t sub_1A9630480()
{
  return MEMORY[0x1F416A300]();
}

uint64_t sub_1A9630490()
{
  return MEMORY[0x1F416A308]();
}

uint64_t sub_1A96304A0()
{
  return MEMORY[0x1F416A310]();
}

uint64_t sub_1A96304B0()
{
  return MEMORY[0x1F416A318]();
}

uint64_t sub_1A96304C0()
{
  return MEMORY[0x1F416A320]();
}

uint64_t sub_1A96304D0()
{
  return MEMORY[0x1F416A328]();
}

uint64_t sub_1A96304E0()
{
  return MEMORY[0x1F416A330]();
}

uint64_t sub_1A96304F0()
{
  return MEMORY[0x1F416A338]();
}

uint64_t sub_1A9630500()
{
  return MEMORY[0x1F416A340]();
}

uint64_t sub_1A9630510()
{
  return MEMORY[0x1F416A348]();
}

uint64_t sub_1A9630520()
{
  return MEMORY[0x1F416A350]();
}

uint64_t sub_1A9630530()
{
  return MEMORY[0x1F416A358]();
}

uint64_t sub_1A9630540()
{
  return MEMORY[0x1F416A360]();
}

uint64_t sub_1A9630550()
{
  return MEMORY[0x1F416A368]();
}

uint64_t sub_1A9630560()
{
  return MEMORY[0x1F416A370]();
}

uint64_t sub_1A9630570()
{
  return MEMORY[0x1F416A378]();
}

uint64_t sub_1A9630580()
{
  return MEMORY[0x1F416A380]();
}

uint64_t sub_1A9630590()
{
  return MEMORY[0x1F416A388]();
}

uint64_t sub_1A96305A0()
{
  return MEMORY[0x1F416A390]();
}

uint64_t sub_1A96305B0()
{
  return MEMORY[0x1F416A398]();
}

uint64_t sub_1A96305C0()
{
  return MEMORY[0x1F416A3A0]();
}

uint64_t sub_1A96305D0()
{
  return MEMORY[0x1F416A3A8]();
}

uint64_t sub_1A96305E0()
{
  return MEMORY[0x1F416A3B0]();
}

uint64_t sub_1A96305F0()
{
  return MEMORY[0x1F416A3B8]();
}

uint64_t sub_1A9630600()
{
  return MEMORY[0x1F416A3C0]();
}

uint64_t sub_1A9630610()
{
  return MEMORY[0x1F416A3C8]();
}

uint64_t sub_1A9630620()
{
  return MEMORY[0x1F416A3D0]();
}

uint64_t sub_1A9630630()
{
  return MEMORY[0x1F416A3D8]();
}

uint64_t sub_1A9630640()
{
  return MEMORY[0x1F416A3E0]();
}

uint64_t sub_1A9630650()
{
  return MEMORY[0x1F416A3E8]();
}

uint64_t sub_1A9630660()
{
  return MEMORY[0x1F416A3F0]();
}

uint64_t sub_1A9630670()
{
  return MEMORY[0x1F416A3F8]();
}

uint64_t sub_1A9630680()
{
  return MEMORY[0x1F416A400]();
}

uint64_t sub_1A9630690()
{
  return MEMORY[0x1F416A408]();
}

uint64_t sub_1A96306A0()
{
  return MEMORY[0x1F416A410]();
}

uint64_t sub_1A96306B0()
{
  return MEMORY[0x1F416A418]();
}

uint64_t sub_1A96306C0()
{
  return MEMORY[0x1F416A420]();
}

uint64_t sub_1A96306D0()
{
  return MEMORY[0x1F416A428]();
}

uint64_t sub_1A96306E0()
{
  return MEMORY[0x1F416A430]();
}

uint64_t sub_1A96306F0()
{
  return MEMORY[0x1F416A438]();
}

uint64_t sub_1A9630700()
{
  return MEMORY[0x1F416A448]();
}

uint64_t sub_1A9630710()
{
  return MEMORY[0x1F416A450]();
}

uint64_t sub_1A9630720()
{
  return MEMORY[0x1F416A458]();
}

uint64_t sub_1A9630730()
{
  return MEMORY[0x1F416A460]();
}

uint64_t sub_1A9630740()
{
  return MEMORY[0x1F416A468]();
}

uint64_t sub_1A9630750()
{
  return MEMORY[0x1F416A470]();
}

uint64_t sub_1A9630760()
{
  return MEMORY[0x1F416A478]();
}

uint64_t sub_1A9630770()
{
  return MEMORY[0x1F416A480]();
}

uint64_t sub_1A9630780()
{
  return MEMORY[0x1F416A488]();
}

uint64_t sub_1A9630790()
{
  return MEMORY[0x1F416A490]();
}

uint64_t sub_1A96307A0()
{
  return MEMORY[0x1F416A498]();
}

uint64_t sub_1A96307B0()
{
  return MEMORY[0x1F416A4A0]();
}

uint64_t sub_1A96307C0()
{
  return MEMORY[0x1F416A4A8]();
}

uint64_t sub_1A96307D0()
{
  return MEMORY[0x1F416A4B0]();
}

uint64_t sub_1A96307E0()
{
  return MEMORY[0x1F416A4B8]();
}

uint64_t sub_1A96307F0()
{
  return MEMORY[0x1F416A4C0]();
}

uint64_t sub_1A9630800()
{
  return MEMORY[0x1F416A4C8]();
}

uint64_t sub_1A9630810()
{
  return MEMORY[0x1F416A4D0]();
}

uint64_t sub_1A9630820()
{
  return MEMORY[0x1F416A4D8]();
}

uint64_t sub_1A9630830()
{
  return MEMORY[0x1F416A4E0]();
}

uint64_t sub_1A9630840()
{
  return MEMORY[0x1F416A4E8]();
}

uint64_t sub_1A9630850()
{
  return MEMORY[0x1F416A4F0]();
}

uint64_t sub_1A9630860()
{
  return MEMORY[0x1F416A4F8]();
}

uint64_t sub_1A9630870()
{
  return MEMORY[0x1F416A500]();
}

uint64_t sub_1A9630880()
{
  return MEMORY[0x1F416A508]();
}

uint64_t sub_1A9630890()
{
  return MEMORY[0x1F416A510]();
}

uint64_t sub_1A96308A0()
{
  return MEMORY[0x1F416A518]();
}

uint64_t sub_1A96308B0()
{
  return MEMORY[0x1F416A520]();
}

uint64_t sub_1A96308C0()
{
  return MEMORY[0x1F416A528]();
}

uint64_t sub_1A96308D0()
{
  return MEMORY[0x1F416A530]();
}

uint64_t sub_1A96308E0()
{
  return MEMORY[0x1F416A538]();
}

uint64_t sub_1A96308F0()
{
  return MEMORY[0x1F416A540]();
}

uint64_t sub_1A9630900()
{
  return MEMORY[0x1F416A548]();
}

uint64_t sub_1A9630910()
{
  return MEMORY[0x1F416A550]();
}

uint64_t sub_1A9630920()
{
  return MEMORY[0x1F416A558]();
}

uint64_t sub_1A9630930()
{
  return MEMORY[0x1F416A560]();
}

uint64_t sub_1A9630940()
{
  return MEMORY[0x1F416A568]();
}

uint64_t sub_1A9630950()
{
  return MEMORY[0x1F416A570]();
}

uint64_t sub_1A9630960()
{
  return MEMORY[0x1F416A578]();
}

uint64_t sub_1A9630970()
{
  return MEMORY[0x1F416A580]();
}

uint64_t sub_1A9630980()
{
  return MEMORY[0x1F416A588]();
}

uint64_t sub_1A9630990()
{
  return MEMORY[0x1F416A590]();
}

uint64_t sub_1A96309A0()
{
  return MEMORY[0x1F416A598]();
}

uint64_t sub_1A96309B0()
{
  return MEMORY[0x1F416A5A0]();
}

uint64_t sub_1A96309C0()
{
  return MEMORY[0x1F416A5A8]();
}

uint64_t sub_1A96309D0()
{
  return MEMORY[0x1F416A5B0]();
}

uint64_t sub_1A96309E0()
{
  return MEMORY[0x1F416A5B8]();
}

uint64_t sub_1A96309F0()
{
  return MEMORY[0x1F416A5C0]();
}

uint64_t sub_1A9630A00()
{
  return MEMORY[0x1F416A5C8]();
}

uint64_t sub_1A9630A10()
{
  return MEMORY[0x1F416A5D0]();
}

uint64_t sub_1A9630A20()
{
  return MEMORY[0x1F416A5D8]();
}

uint64_t sub_1A9630A30()
{
  return MEMORY[0x1F416A5E0]();
}

uint64_t sub_1A9630A40()
{
  return MEMORY[0x1F416A5E8]();
}

uint64_t sub_1A9630A50()
{
  return MEMORY[0x1F416A5F0]();
}

uint64_t sub_1A9630A60()
{
  return MEMORY[0x1F416A5F8]();
}

uint64_t sub_1A9630A70()
{
  return MEMORY[0x1F416A600]();
}

uint64_t sub_1A9630A80()
{
  return MEMORY[0x1F416A608]();
}

uint64_t sub_1A9630A90()
{
  return MEMORY[0x1F416A610]();
}

uint64_t sub_1A9630AA0()
{
  return MEMORY[0x1F416A618]();
}

uint64_t sub_1A9630AB0()
{
  return MEMORY[0x1F416A620]();
}

uint64_t sub_1A9630AC0()
{
  return MEMORY[0x1F416A628]();
}

uint64_t sub_1A9630AD0()
{
  return MEMORY[0x1F416A630]();
}

uint64_t sub_1A9630AE0()
{
  return MEMORY[0x1F416A638]();
}

uint64_t sub_1A9630AF0()
{
  return MEMORY[0x1F416A640]();
}

uint64_t sub_1A9630B00()
{
  return MEMORY[0x1F416A648]();
}

uint64_t sub_1A9630B10()
{
  return MEMORY[0x1F416A650]();
}

uint64_t sub_1A9630B20()
{
  return MEMORY[0x1F416A658]();
}

uint64_t sub_1A9630B30()
{
  return MEMORY[0x1F416A660]();
}

uint64_t sub_1A9630B40()
{
  return MEMORY[0x1F416A668]();
}

uint64_t sub_1A9630B50()
{
  return MEMORY[0x1F416A670]();
}

uint64_t sub_1A9630B60()
{
  return MEMORY[0x1F416A678]();
}

uint64_t sub_1A9630B70()
{
  return MEMORY[0x1F416A680]();
}

uint64_t sub_1A9630B80()
{
  return MEMORY[0x1F416A688]();
}

uint64_t sub_1A9630B90()
{
  return MEMORY[0x1F416A690]();
}

uint64_t sub_1A9630BA0()
{
  return MEMORY[0x1F416A698]();
}

uint64_t sub_1A9630BB0()
{
  return MEMORY[0x1F416A6A0]();
}

uint64_t sub_1A9630BC0()
{
  return MEMORY[0x1F416A6A8]();
}

uint64_t sub_1A9630BD0()
{
  return MEMORY[0x1F416A6B0]();
}

uint64_t sub_1A9630BE0()
{
  return MEMORY[0x1F416A6B8]();
}

uint64_t sub_1A9630BF0()
{
  return MEMORY[0x1F416A6C0]();
}

uint64_t sub_1A9630C00()
{
  return MEMORY[0x1F416A6C8]();
}

uint64_t sub_1A9630C10()
{
  return MEMORY[0x1F416A6D0]();
}

uint64_t sub_1A9630C20()
{
  return MEMORY[0x1F416A6D8]();
}

uint64_t sub_1A9630C30()
{
  return MEMORY[0x1F416A6E0]();
}

uint64_t sub_1A9630C40()
{
  return MEMORY[0x1F416A6E8]();
}

uint64_t sub_1A9630C50()
{
  return MEMORY[0x1F416A6F0]();
}

uint64_t sub_1A9630C60()
{
  return MEMORY[0x1F416A6F8]();
}

uint64_t sub_1A9630C70()
{
  return MEMORY[0x1F416A700]();
}

uint64_t sub_1A9630C80()
{
  return MEMORY[0x1F416A708]();
}

uint64_t sub_1A9630C90()
{
  return MEMORY[0x1F416A710]();
}

uint64_t sub_1A9630CA0()
{
  return MEMORY[0x1F416A718]();
}

uint64_t sub_1A9630CB0()
{
  return MEMORY[0x1F416A720]();
}

uint64_t sub_1A9630CC0()
{
  return MEMORY[0x1F416A728]();
}

uint64_t sub_1A9630CD0()
{
  return MEMORY[0x1F416A730]();
}

uint64_t sub_1A9630CE0()
{
  return MEMORY[0x1F416A738]();
}

uint64_t sub_1A9630CF0()
{
  return MEMORY[0x1F416A740]();
}

uint64_t sub_1A9630D00()
{
  return MEMORY[0x1F416A748]();
}

uint64_t sub_1A9630D10()
{
  return MEMORY[0x1F416A750]();
}

uint64_t sub_1A9630D20()
{
  return MEMORY[0x1F416A758]();
}

uint64_t sub_1A9630D30()
{
  return MEMORY[0x1F416A760]();
}

uint64_t sub_1A9630D40()
{
  return MEMORY[0x1F416A768]();
}

uint64_t sub_1A9630D50()
{
  return MEMORY[0x1F416A770]();
}

uint64_t sub_1A9630D60()
{
  return MEMORY[0x1F416A778]();
}

uint64_t sub_1A9630D70()
{
  return MEMORY[0x1F416A780]();
}

uint64_t sub_1A9630D80()
{
  return MEMORY[0x1F416A788]();
}

uint64_t sub_1A9630D90()
{
  return MEMORY[0x1F416A790]();
}

uint64_t sub_1A9630DA0()
{
  return MEMORY[0x1F416A798]();
}

uint64_t sub_1A9630DB0()
{
  return MEMORY[0x1F416A7A0]();
}

uint64_t sub_1A9630DC0()
{
  return MEMORY[0x1F416A7A8]();
}

uint64_t sub_1A9630DD0()
{
  return MEMORY[0x1F416A7B0]();
}

uint64_t sub_1A9630DE0()
{
  return MEMORY[0x1F416A7B8]();
}

uint64_t sub_1A9630DF0()
{
  return MEMORY[0x1F416A7C0]();
}

uint64_t sub_1A9630E00()
{
  return MEMORY[0x1F416A7C8]();
}

uint64_t sub_1A9630E10()
{
  return MEMORY[0x1F416A7D0]();
}

uint64_t sub_1A9630E20()
{
  return MEMORY[0x1F416A7D8]();
}

uint64_t sub_1A9630E30()
{
  return MEMORY[0x1F416A7E0]();
}

uint64_t sub_1A9630E40()
{
  return MEMORY[0x1F416A7E8]();
}

uint64_t sub_1A9630E50()
{
  return MEMORY[0x1F416A7F0]();
}

uint64_t sub_1A9630E60()
{
  return MEMORY[0x1F416A7F8]();
}

uint64_t sub_1A9630E70()
{
  return MEMORY[0x1F416A800]();
}

uint64_t sub_1A9630E80()
{
  return MEMORY[0x1F416A808]();
}

uint64_t sub_1A9630E90()
{
  return MEMORY[0x1F416A810]();
}

uint64_t sub_1A9630EA0()
{
  return MEMORY[0x1F416A818]();
}

uint64_t sub_1A9630EB0()
{
  return MEMORY[0x1F416A820]();
}

uint64_t sub_1A9630EC0()
{
  return MEMORY[0x1F416A828]();
}

uint64_t sub_1A9630ED0()
{
  return MEMORY[0x1F416A830]();
}

uint64_t sub_1A9630EE0()
{
  return MEMORY[0x1F416A838]();
}

uint64_t sub_1A9630EF0()
{
  return MEMORY[0x1F416A840]();
}

uint64_t sub_1A9630F00()
{
  return MEMORY[0x1F416A848]();
}

uint64_t sub_1A9630F10()
{
  return MEMORY[0x1F416A850]();
}

uint64_t sub_1A9630F20()
{
  return MEMORY[0x1F416A858]();
}

uint64_t sub_1A9630F30()
{
  return MEMORY[0x1F416A860]();
}

uint64_t sub_1A9630F40()
{
  return MEMORY[0x1F416A868]();
}

uint64_t sub_1A9630F50()
{
  return MEMORY[0x1F416A870]();
}

uint64_t sub_1A9630F60()
{
  return MEMORY[0x1F416A878]();
}

uint64_t sub_1A9630F70()
{
  return MEMORY[0x1F416A880]();
}

uint64_t sub_1A9630F80()
{
  return MEMORY[0x1F416A888]();
}

uint64_t sub_1A9630F90()
{
  return MEMORY[0x1F416A890]();
}

uint64_t sub_1A9630FA0()
{
  return MEMORY[0x1F416A898]();
}

uint64_t sub_1A9630FB0()
{
  return MEMORY[0x1F416A8A0]();
}

uint64_t sub_1A9630FC0()
{
  return MEMORY[0x1F416A8A8]();
}

uint64_t sub_1A9630FD0()
{
  return MEMORY[0x1F416A8B0]();
}

uint64_t sub_1A9630FE0()
{
  return MEMORY[0x1F416A8B8]();
}

uint64_t sub_1A9630FF0()
{
  return MEMORY[0x1F416A8C0]();
}

uint64_t sub_1A9631000()
{
  return MEMORY[0x1F416A8C8]();
}

uint64_t sub_1A9631010()
{
  return MEMORY[0x1F416A8D0]();
}

uint64_t sub_1A9631020()
{
  return MEMORY[0x1F416A8D8]();
}

uint64_t sub_1A9631030()
{
  return MEMORY[0x1F416A8E0]();
}

uint64_t sub_1A9631040()
{
  return MEMORY[0x1F416A8E8]();
}

uint64_t sub_1A9631050()
{
  return MEMORY[0x1F416A8F0]();
}

uint64_t sub_1A9631060()
{
  return MEMORY[0x1F416A8F8]();
}

uint64_t sub_1A9631070()
{
  return MEMORY[0x1F416A900]();
}

uint64_t sub_1A9631080()
{
  return MEMORY[0x1F416A908]();
}

uint64_t sub_1A9631090()
{
  return MEMORY[0x1F416A910]();
}

uint64_t sub_1A96310A0()
{
  return MEMORY[0x1F416A918]();
}

uint64_t sub_1A96310B0()
{
  return MEMORY[0x1F416A920]();
}

uint64_t sub_1A96310C0()
{
  return MEMORY[0x1F416A928]();
}

uint64_t sub_1A96310D0()
{
  return MEMORY[0x1F416A930]();
}

uint64_t sub_1A96310E0()
{
  return MEMORY[0x1F416A938]();
}

uint64_t sub_1A96310F0()
{
  return MEMORY[0x1F416A940]();
}

uint64_t sub_1A9631100()
{
  return MEMORY[0x1F416A948]();
}

uint64_t sub_1A9631110()
{
  return MEMORY[0x1F416A950]();
}

uint64_t sub_1A9631120()
{
  return MEMORY[0x1F416A958]();
}

uint64_t sub_1A9631130()
{
  return MEMORY[0x1F416A960]();
}

uint64_t sub_1A9631140()
{
  return MEMORY[0x1F416A968]();
}

uint64_t sub_1A9631150()
{
  return MEMORY[0x1F416A970]();
}

uint64_t sub_1A9631160()
{
  return MEMORY[0x1F4183190]();
}

uint64_t sub_1A9631170()
{
  return MEMORY[0x1F4183198]();
}

uint64_t sub_1A9631180()
{
  return MEMORY[0x1F41831A0]();
}

uint64_t sub_1A9631190()
{
  return MEMORY[0x1F41831A8]();
}

uint64_t sub_1A96311A0()
{
  return MEMORY[0x1F41831C0]();
}

uint64_t sub_1A96311B0()
{
  return MEMORY[0x1F41831D8]();
}

uint64_t sub_1A96311C0()
{
  return MEMORY[0x1F41831E0]();
}

uint64_t sub_1A96311D0()
{
  return MEMORY[0x1F41831E8]();
}

uint64_t sub_1A96311E0()
{
  return MEMORY[0x1F41831F0]();
}

uint64_t sub_1A96311F0()
{
  return MEMORY[0x1F41831F8]();
}

uint64_t sub_1A9631200()
{
  return MEMORY[0x1F4183210]();
}

uint64_t sub_1A9631210()
{
  return MEMORY[0x1F4183220]();
}

uint64_t sub_1A9631220()
{
  return MEMORY[0x1F4183230]();
}

uint64_t sub_1A9631230()
{
  return MEMORY[0x1F4183238]();
}

uint64_t sub_1A9631240()
{
  return MEMORY[0x1F415D9F8]();
}

uint64_t sub_1A9631250()
{
  return MEMORY[0x1F415DA18]();
}

uint64_t sub_1A9631260()
{
  return MEMORY[0x1F415DA20]();
}

uint64_t sub_1A9631270()
{
  return MEMORY[0x1F415DA28]();
}

uint64_t sub_1A9631280()
{
  return MEMORY[0x1F415DAC0]();
}

uint64_t sub_1A9631290()
{
  return MEMORY[0x1F415DAC8]();
}

uint64_t sub_1A96312A0()
{
  return MEMORY[0x1F415DAD0]();
}

uint64_t sub_1A96312B0()
{
  return MEMORY[0x1F415DAD8]();
}

uint64_t sub_1A96312C0()
{
  return MEMORY[0x1F415DAE0]();
}

uint64_t sub_1A96312D0()
{
  return MEMORY[0x1F415DAE8]();
}

uint64_t sub_1A96312E0()
{
  return MEMORY[0x1F415DBF8]();
}

uint64_t sub_1A96312F0()
{
  return MEMORY[0x1F415DC00]();
}

uint64_t sub_1A9631300()
{
  return MEMORY[0x1F415DC08]();
}

uint64_t sub_1A9631310()
{
  return MEMORY[0x1F415DC10]();
}

uint64_t sub_1A9631320()
{
  return MEMORY[0x1F415DC18]();
}

uint64_t sub_1A9631330()
{
  return MEMORY[0x1F415DC40]();
}

uint64_t sub_1A9631340()
{
  return MEMORY[0x1F415DC48]();
}

uint64_t sub_1A9631350()
{
  return MEMORY[0x1F415DC50]();
}

uint64_t sub_1A9631360()
{
  return MEMORY[0x1F415DC58]();
}

uint64_t sub_1A9631370()
{
  return MEMORY[0x1F415DC60]();
}

uint64_t sub_1A9631380()
{
  return MEMORY[0x1F415DCA0]();
}

uint64_t sub_1A9631390()
{
  return MEMORY[0x1F415DCB8]();
}

uint64_t sub_1A96313A0()
{
  return MEMORY[0x1F415DCC0]();
}

uint64_t sub_1A96313B0()
{
  return MEMORY[0x1F415DCC8]();
}

uint64_t sub_1A96313C0()
{
  return MEMORY[0x1F415DD48]();
}

uint64_t sub_1A96313D0()
{
  return MEMORY[0x1F415DD68]();
}

uint64_t sub_1A96313E0()
{
  return MEMORY[0x1F415DD70]();
}

uint64_t sub_1A96313F0()
{
  return MEMORY[0x1F415DDD8]();
}

uint64_t sub_1A9631400()
{
  return MEMORY[0x1F415DDE0]();
}

uint64_t sub_1A9631410()
{
  return MEMORY[0x1F415DDE8]();
}

uint64_t sub_1A9631420()
{
  return MEMORY[0x1F415DE00]();
}

uint64_t sub_1A9631430()
{
  return MEMORY[0x1F415DE08]();
}

uint64_t sub_1A9631440()
{
  return MEMORY[0x1F415DE10]();
}

uint64_t sub_1A9631450()
{
  return MEMORY[0x1F415DE18]();
}

uint64_t sub_1A9631460()
{
  return MEMORY[0x1F415DE20]();
}

uint64_t sub_1A9631470()
{
  return MEMORY[0x1F415DF28]();
}

uint64_t sub_1A9631480()
{
  return MEMORY[0x1F415DF30]();
}

uint64_t sub_1A9631490()
{
  return MEMORY[0x1F415DF70]();
}

uint64_t sub_1A96314A0()
{
  return MEMORY[0x1F415DF78]();
}

uint64_t sub_1A96314B0()
{
  return MEMORY[0x1F415DF80]();
}

uint64_t sub_1A96314C0()
{
  return MEMORY[0x1F415DF90]();
}

uint64_t sub_1A96314D0()
{
  return MEMORY[0x1F415DF98]();
}

uint64_t sub_1A96314E0()
{
  return MEMORY[0x1F415E140]();
}

uint64_t sub_1A9631500()
{
  return MEMORY[0x1F415E230]();
}

uint64_t sub_1A9631510()
{
  return MEMORY[0x1F415E560]();
}

uint64_t sub_1A9631520()
{
  return MEMORY[0x1F415E568]();
}

uint64_t sub_1A9631530()
{
  return MEMORY[0x1F415E590]();
}

uint64_t sub_1A9631540()
{
  return MEMORY[0x1F415E598]();
}

uint64_t sub_1A9631550()
{
  return MEMORY[0x1F415E610]();
}

uint64_t sub_1A9631560()
{
  return MEMORY[0x1F415E618]();
}

uint64_t sub_1A9631570()
{
  return MEMORY[0x1F415E620]();
}

uint64_t sub_1A9631580()
{
  return MEMORY[0x1F415E660]();
}

uint64_t sub_1A9631590()
{
  return MEMORY[0x1F415E670]();
}

uint64_t sub_1A96315A0()
{
  return MEMORY[0x1F415E678]();
}

uint64_t sub_1A96315B0()
{
  return MEMORY[0x1F415E6A8]();
}

uint64_t sub_1A96315C0()
{
  return MEMORY[0x1F415E6B0]();
}

uint64_t sub_1A96315D0()
{
  return MEMORY[0x1F415E8E8]();
}

uint64_t sub_1A96315E0()
{
  return MEMORY[0x1F415E8F0]();
}

uint64_t sub_1A96315F0()
{
  return MEMORY[0x1F415E9D8]();
}

uint64_t sub_1A9631600()
{
  return MEMORY[0x1F415E9F0]();
}

uint64_t sub_1A9631610()
{
  return MEMORY[0x1F415EA00]();
}

uint64_t sub_1A9631620()
{
  return MEMORY[0x1F415EA70]();
}

uint64_t sub_1A9631630()
{
  return MEMORY[0x1F415EA98]();
}

uint64_t sub_1A9631640()
{
  return MEMORY[0x1F415EAA0]();
}

uint64_t sub_1A9631650()
{
  return MEMORY[0x1F415EAA8]();
}

uint64_t sub_1A9631660()
{
  return MEMORY[0x1F415EB28]();
}

uint64_t sub_1A9631670()
{
  return MEMORY[0x1F415EB38]();
}

uint64_t sub_1A9631680()
{
  return MEMORY[0x1F415EB48]();
}

uint64_t sub_1A9631690()
{
  return MEMORY[0x1F415EB50]();
}

uint64_t sub_1A96316A0()
{
  return MEMORY[0x1F415EC08]();
}

uint64_t sub_1A96316B0()
{
  return MEMORY[0x1F415EC10]();
}

uint64_t sub_1A96316C0()
{
  return MEMORY[0x1F415EC18]();
}

uint64_t sub_1A96316D0()
{
  return MEMORY[0x1F415EC20]();
}

uint64_t sub_1A96316E0()
{
  return MEMORY[0x1F415EC28]();
}

uint64_t sub_1A96316F0()
{
  return MEMORY[0x1F415EC48]();
}

uint64_t sub_1A9631700()
{
  return MEMORY[0x1F415EC60]();
}

uint64_t sub_1A9631710()
{
  return MEMORY[0x1F415EC70]();
}

uint64_t sub_1A9631720()
{
  return MEMORY[0x1F415EC78]();
}

uint64_t sub_1A9631740()
{
  return MEMORY[0x1F415EC98]();
}

uint64_t sub_1A9631750()
{
  return MEMORY[0x1F415ECC8]();
}

uint64_t sub_1A9631760()
{
  return MEMORY[0x1F415EE08]();
}

uint64_t sub_1A9631770()
{
  return MEMORY[0x1F415EE18]();
}

uint64_t sub_1A9631780()
{
  return MEMORY[0x1F415EED8]();
}

uint64_t sub_1A9631790()
{
  return MEMORY[0x1F415EEE0]();
}

uint64_t sub_1A96317A0()
{
  return MEMORY[0x1F4188508]();
}

uint64_t sub_1A96317B0()
{
  return MEMORY[0x1F4188568]();
}

uint64_t sub_1A96317C0()
{
  return MEMORY[0x1F4188580]();
}

uint64_t sub_1A96317D0()
{
  return MEMORY[0x1F4188670]();
}

uint64_t sub_1A96317E0()
{
  return MEMORY[0x1F4188680]();
}

uint64_t sub_1A96317F0()
{
  return MEMORY[0x1F41886A0]();
}

uint64_t sub_1A9631860()
{
  return MEMORY[0x1F415D4F8]();
}

uint64_t sub_1A9631870()
{
  return MEMORY[0x1F415D650]();
}

uint64_t sub_1A9631880()
{
  return MEMORY[0x1F415D658]();
}

uint64_t sub_1A9631890()
{
  return MEMORY[0x1F415D660]();
}

uint64_t sub_1A96318A0()
{
  return MEMORY[0x1F415D668]();
}

uint64_t sub_1A96318B0()
{
  return MEMORY[0x1F415D6A8]();
}

uint64_t sub_1A96318C0()
{
  return MEMORY[0x1F415D6B0]();
}

uint64_t sub_1A96318D0()
{
  return MEMORY[0x1F415D6B8]();
}

uint64_t sub_1A96318E0()
{
  return MEMORY[0x1F415D6C0]();
}

uint64_t sub_1A96318F0()
{
  return MEMORY[0x1F415D6C8]();
}

uint64_t sub_1A9631900()
{
  return MEMORY[0x1F415D6D8]();
}

uint64_t sub_1A9631910()
{
  return MEMORY[0x1F415D6E0]();
}

uint64_t sub_1A9631920()
{
  return MEMORY[0x1F415D718]();
}

uint64_t sub_1A9631930()
{
  return MEMORY[0x1F415D730]();
}

uint64_t sub_1A9631940()
{
  return MEMORY[0x1F415D738]();
}

uint64_t sub_1A9631950()
{
  return MEMORY[0x1F415D768]();
}

uint64_t sub_1A9631960()
{
  return MEMORY[0x1F415D770]();
}

uint64_t sub_1A9631970()
{
  return MEMORY[0x1F415D778]();
}

uint64_t sub_1A9631980()
{
  return MEMORY[0x1F415D780]();
}

uint64_t sub_1A9631990()
{
  return MEMORY[0x1F415D790]();
}

uint64_t sub_1A96319A0()
{
  return MEMORY[0x1F415D7A0]();
}

uint64_t sub_1A96319B0()
{
  return MEMORY[0x1F415D7A8]();
}

uint64_t sub_1A96319C0()
{
  return MEMORY[0x1F415D7C0]();
}

uint64_t sub_1A96319D0()
{
  return MEMORY[0x1F415D7E0]();
}

uint64_t sub_1A96319E0()
{
  return MEMORY[0x1F415D7E8]();
}

uint64_t sub_1A96319F0()
{
  return MEMORY[0x1F415D7F8]();
}

uint64_t sub_1A9631A00()
{
  return MEMORY[0x1F415D818]();
}

uint64_t sub_1A9631A10()
{
  return MEMORY[0x1F415D838]();
}

uint64_t sub_1A9631A20()
{
  return MEMORY[0x1F415D850]();
}

uint64_t sub_1A9631A30()
{
  return MEMORY[0x1F415D878]();
}

uint64_t sub_1A9631A40()
{
  return MEMORY[0x1F415D888]();
}

uint64_t sub_1A9631A50()
{
  return MEMORY[0x1F415D890]();
}

uint64_t sub_1A9631A60()
{
  return MEMORY[0x1F415D8A0]();
}

uint64_t sub_1A9631A70()
{
  return MEMORY[0x1F415D8A8]();
}

uint64_t sub_1A9631A80()
{
  return MEMORY[0x1F415D8D0]();
}

uint64_t sub_1A9631A90()
{
  return MEMORY[0x1F415D8F8]();
}

uint64_t sub_1A9631AA0()
{
  return MEMORY[0x1F4187810]();
}

uint64_t sub_1A9631AB0()
{
  return MEMORY[0x1F4187818]();
}

uint64_t sub_1A9631AC0()
{
  return MEMORY[0x1F40D6A08]();
}

uint64_t sub_1A9631AD0()
{
  return MEMORY[0x1F40D6A20]();
}

uint64_t sub_1A9631AE0()
{
  return MEMORY[0x1F40D6BD8]();
}

uint64_t sub_1A9631AF0()
{
  return MEMORY[0x1F40D6D80]();
}

uint64_t sub_1A9631B00()
{
  return MEMORY[0x1F40F1EA0]();
}

uint64_t sub_1A9631B10()
{
  return MEMORY[0x1F40F1EA8]();
}

uint64_t sub_1A9631B20()
{
  return MEMORY[0x1F40F1EB8]();
}

uint64_t sub_1A9631B30()
{
  return MEMORY[0x1F40F1EC8]();
}

uint64_t sub_1A9631B40()
{
  return MEMORY[0x1F40F1ED8]();
}

uint64_t sub_1A9631B50()
{
  return MEMORY[0x1F40F1EE0]();
}

uint64_t sub_1A9631B60()
{
  return MEMORY[0x1F4186CB0]();
}

uint64_t sub_1A9631B70()
{
  return MEMORY[0x1F4186CF8]();
}

uint64_t sub_1A9631B80()
{
  return MEMORY[0x1F4186D08]();
}

uint64_t sub_1A9631B90()
{
  return MEMORY[0x1F4186D40]();
}

uint64_t sub_1A9631BA0()
{
  return MEMORY[0x1F4186D60]();
}

uint64_t sub_1A9631BB0()
{
  return MEMORY[0x1F40DFF38]();
}

uint64_t sub_1A9631BC0()
{
  return MEMORY[0x1F40DFF40]();
}

uint64_t sub_1A9631BD0()
{
  return MEMORY[0x1F40DFF58]();
}

uint64_t sub_1A9631BE0()
{
  return MEMORY[0x1F40DFFC0]();
}

uint64_t sub_1A9631BF0()
{
  return MEMORY[0x1F40DFFD8]();
}

uint64_t sub_1A9631C00()
{
  return MEMORY[0x1F40E0110]();
}

uint64_t sub_1A9631C10()
{
  return MEMORY[0x1F40E0118]();
}

uint64_t sub_1A9631C20()
{
  return MEMORY[0x1F40E0120]();
}

uint64_t sub_1A9631C30()
{
  return MEMORY[0x1F40E04A8]();
}

uint64_t sub_1A9631C40()
{
  return MEMORY[0x1F40E0538]();
}

uint64_t sub_1A9631C50()
{
  return MEMORY[0x1F40E0548]();
}

uint64_t sub_1A9631C60()
{
  return MEMORY[0x1F40E6000]();
}

uint64_t sub_1A9631C70()
{
  return MEMORY[0x1F40E6030]();
}

uint64_t sub_1A9631C80()
{
  return MEMORY[0x1F416A978]();
}

uint64_t sub_1A9631C90()
{
  return MEMORY[0x1F415EF98]();
}

uint64_t sub_1A9631CA0()
{
  return MEMORY[0x1F415EFA0]();
}

uint64_t sub_1A9631CB0()
{
  return MEMORY[0x1F415EFA8]();
}

uint64_t sub_1A9631CC0()
{
  return MEMORY[0x1F4183358]();
}

uint64_t sub_1A9631CD0()
{
  return MEMORY[0x1F41835C0]();
}

uint64_t sub_1A9631CE0()
{
  return MEMORY[0x1F41835C8]();
}

uint64_t sub_1A9631CF0()
{
  return MEMORY[0x1F41836E0]();
}

uint64_t sub_1A9631D00()
{
  return MEMORY[0x1F4183730]();
}

uint64_t sub_1A9631D10()
{
  return MEMORY[0x1F4183740]();
}

uint64_t sub_1A9631D20()
{
  return MEMORY[0x1F4183748]();
}

uint64_t sub_1A9631D30()
{
  return MEMORY[0x1F4183838]();
}

uint64_t sub_1A9631D40()
{
  return MEMORY[0x1F40E6190]();
}

uint64_t sub_1A9631D50()
{
  return MEMORY[0x1F40E61C8]();
}

uint64_t sub_1A9631D60()
{
  return MEMORY[0x1F40E61D8]();
}

uint64_t sub_1A9631D70()
{
  return MEMORY[0x1F40E61E8]();
}

uint64_t sub_1A9631D80()
{
  return MEMORY[0x1F40E61F8]();
}

uint64_t sub_1A9631D90()
{
  return MEMORY[0x1F40E6238]();
}

uint64_t sub_1A9631DA0()
{
  return MEMORY[0x1F40E6268]();
}

uint64_t sub_1A9631DB0()
{
  return MEMORY[0x1F40E62A0]();
}

uint64_t sub_1A9631DC0()
{
  return MEMORY[0x1F4183880]();
}

uint64_t sub_1A9631DD0()
{
  return MEMORY[0x1F4183898]();
}

uint64_t sub_1A9631DE0()
{
  return MEMORY[0x1F416A980]();
}

uint64_t sub_1A9631DF0()
{
  return MEMORY[0x1F41838B8]();
}

uint64_t sub_1A9631E00()
{
  return MEMORY[0x1F415EFE0]();
}

uint64_t sub_1A9631E10()
{
  return MEMORY[0x1F415EFF8]();
}

uint64_t sub_1A9631E20()
{
  return MEMORY[0x1F415F000]();
}

uint64_t sub_1A9631E30()
{
  return MEMORY[0x1F41838D8]();
}

uint64_t sub_1A9631E40()
{
  return MEMORY[0x1F4183950]();
}

uint64_t sub_1A9631E50()
{
  return MEMORY[0x1F4183958]();
}

uint64_t sub_1A9631E60()
{
  return MEMORY[0x1F41839B0]();
}

uint64_t sub_1A9631E70()
{
  return MEMORY[0x1F41839F0]();
}

uint64_t sub_1A9631E80()
{
  return MEMORY[0x1F4183A08]();
}

uint64_t sub_1A9631E90()
{
  return MEMORY[0x1F4183A28]();
}

uint64_t sub_1A9631EA0()
{
  return MEMORY[0x1F4183A38]();
}

uint64_t sub_1A9631EB0()
{
  return MEMORY[0x1F4183A78]();
}

uint64_t sub_1A9631EC0()
{
  return MEMORY[0x1F4183A80]();
}

uint64_t sub_1A9631ED0()
{
  return MEMORY[0x1F4183A88]();
}

uint64_t sub_1A9631EE0()
{
  return MEMORY[0x1F4183AA0]();
}

uint64_t sub_1A9631F00()
{
  return MEMORY[0x1F4183AB0]();
}

uint64_t sub_1A9631F10()
{
  return MEMORY[0x1F4183B10]();
}

uint64_t sub_1A9631F20()
{
  return MEMORY[0x1F4183B38]();
}

uint64_t sub_1A9631F30()
{
  return MEMORY[0x1F4183B90]();
}

uint64_t sub_1A9631F40()
{
  return MEMORY[0x1F4183BA0]();
}

uint64_t sub_1A9631F50()
{
  return MEMORY[0x1F4183C88]();
}

uint64_t sub_1A9631F60()
{
  return MEMORY[0x1F4183CE0]();
}

uint64_t sub_1A9631FA0()
{
  return MEMORY[0x1F4183D70]();
}

uint64_t sub_1A9631FB0()
{
  return MEMORY[0x1F4183D80]();
}

uint64_t sub_1A9631FC0()
{
  return MEMORY[0x1F4183D98]();
}

uint64_t sub_1A9632000()
{
  return MEMORY[0x1F4183DF8]();
}

uint64_t sub_1A9632010()
{
  return MEMORY[0x1F4183E10]();
}

uint64_t sub_1A9632020()
{
  return MEMORY[0x1F40E6370]();
}

uint64_t sub_1A9632030()
{
  return MEMORY[0x1F4183E90]();
}

uint64_t sub_1A9632040()
{
  return MEMORY[0x1F415F068]();
}

uint64_t sub_1A9632050()
{
  return MEMORY[0x1F415F070]();
}

uint64_t sub_1A9632060()
{
  return MEMORY[0x1F415F098]();
}

uint64_t sub_1A9632070()
{
  return MEMORY[0x1F415F0C8]();
}

uint64_t sub_1A9632080()
{
  return MEMORY[0x1F4183F08]();
}

uint64_t sub_1A9632090()
{
  return MEMORY[0x1F4183F40]();
}

uint64_t sub_1A96320A0()
{
  return MEMORY[0x1F4183FA8]();
}

uint64_t sub_1A96320B0()
{
  return MEMORY[0x1F4183FC8]();
}

uint64_t sub_1A96320D0()
{
  return MEMORY[0x1F4187BF0]();
}

uint64_t sub_1A96320E0()
{
  return MEMORY[0x1F4187C00]();
}

uint64_t sub_1A96320F0()
{
  return MEMORY[0x1F4187C08]();
}

uint64_t sub_1A9632100()
{
  return MEMORY[0x1F4187CF8]();
}

uint64_t sub_1A9632110()
{
  return MEMORY[0x1F4187D00]();
}

uint64_t sub_1A9632140()
{
  return MEMORY[0x1F4187DD8]();
}

uint64_t sub_1A9632160()
{
  return MEMORY[0x1F4187E58]();
}

uint64_t sub_1A9632170()
{
  return MEMORY[0x1F4184008]();
}

uint64_t sub_1A9632180()
{
  return MEMORY[0x1F4184048]();
}

uint64_t sub_1A9632190()
{
  return MEMORY[0x1F4184138]();
}

uint64_t sub_1A96321A0()
{
  return MEMORY[0x1F416A988]();
}

uint64_t sub_1A96321B0()
{
  return MEMORY[0x1F4184318]();
}

uint64_t sub_1A96321C0()
{
  return MEMORY[0x1F4184398]();
}

uint64_t sub_1A96321D0()
{
  return MEMORY[0x1F4184440]();
}

uint64_t sub_1A96321E0()
{
  return MEMORY[0x1F4188468]();
}

uint64_t sub_1A96321F0()
{
  return MEMORY[0x1F40E6500]();
}

uint64_t sub_1A9632210()
{
  return MEMORY[0x1F41886D0]();
}

uint64_t sub_1A9632220()
{
  return MEMORY[0x1F41886E0]();
}

uint64_t sub_1A9632230()
{
  return MEMORY[0x1F4188700]();
}

uint64_t sub_1A9632240()
{
  return MEMORY[0x1F40F27B8]();
}

uint64_t sub_1A9632250()
{
  return MEMORY[0x1F4186FB0]();
}

uint64_t sub_1A9632260()
{
  return MEMORY[0x1F4186FC0]();
}

uint64_t sub_1A9632270()
{
  return MEMORY[0x1F4186FD8]();
}

uint64_t sub_1A9632280()
{
  return MEMORY[0x1F4187040]();
}

uint64_t sub_1A9632290()
{
  return MEMORY[0x1F41870A0]();
}

uint64_t sub_1A96322A0()
{
  return MEMORY[0x1F4187100]();
}

uint64_t sub_1A96322B0()
{
  return MEMORY[0x1F4188708]();
}

uint64_t sub_1A96322C0()
{
  return MEMORY[0x1F4188710]();
}

uint64_t sub_1A96322D0()
{
  return MEMORY[0x1F40E6858]();
}

uint64_t sub_1A96322F0()
{
  return MEMORY[0x1F4188758]();
}

uint64_t sub_1A9632300()
{
  return MEMORY[0x1F416A990]();
}

uint64_t sub_1A9632310()
{
  return MEMORY[0x1F415F170]();
}

uint64_t sub_1A9632320()
{
  return MEMORY[0x1F415F178]();
}

uint64_t sub_1A9632330()
{
  return MEMORY[0x1F4184640]();
}

uint64_t sub_1A9632340()
{
  return MEMORY[0x1F4184788]();
}

uint64_t sub_1A9632350()
{
  return MEMORY[0x1F41847C0]();
}

uint64_t sub_1A9632360()
{
  return MEMORY[0x1F4184820]();
}

uint64_t sub_1A9632370()
{
  return MEMORY[0x1F40E6BB0]();
}

uint64_t sub_1A9632380()
{
  return MEMORY[0x1F40E6C68]();
}

uint64_t sub_1A9632390()
{
  return MEMORY[0x1F40E6C80]();
}

uint64_t sub_1A96323A0()
{
  return MEMORY[0x1F40E6D88]();
}

uint64_t sub_1A96323B0()
{
  return MEMORY[0x1F4184978]();
}

uint64_t sub_1A96323D0()
{
  return MEMORY[0x1F4184B18]();
}

uint64_t sub_1A96323E0()
{
  return MEMORY[0x1F4184B28]();
}

uint64_t sub_1A96323F0()
{
  return MEMORY[0x1F4184C18]();
}

uint64_t sub_1A9632400()
{
  return MEMORY[0x1F4184C20]();
}

uint64_t sub_1A9632410()
{
  return MEMORY[0x1F4184C38]();
}

uint64_t sub_1A9632420()
{
  return MEMORY[0x1F4184C90]();
}

uint64_t sub_1A9632430()
{
  return MEMORY[0x1F4184C98]();
}

uint64_t sub_1A9632440()
{
  return MEMORY[0x1F4184CA8]();
}

uint64_t sub_1A9632450()
{
  return MEMORY[0x1F4184CE8]();
}

uint64_t sub_1A9632460()
{
  return MEMORY[0x1F4184CF0]();
}

uint64_t sub_1A9632470()
{
  return MEMORY[0x1F4184D80]();
}

uint64_t sub_1A9632480()
{
  return MEMORY[0x1F4184DC0]();
}

uint64_t sub_1A9632490()
{
  return MEMORY[0x1F4184DD0]();
}

uint64_t sub_1A96324A0()
{
  return MEMORY[0x1F4184DF0]();
}

uint64_t sub_1A96324B0()
{
  return MEMORY[0x1F4184E68]();
}

uint64_t sub_1A96324C0()
{
  return MEMORY[0x1F4187F70]();
}

uint64_t sub_1A96324D0()
{
  return MEMORY[0x1F4187F78]();
}

uint64_t sub_1A96324E0()
{
  return MEMORY[0x1F4187F80]();
}

uint64_t sub_1A96324F0()
{
  return MEMORY[0x1F4184F98]();
}

uint64_t sub_1A9632500()
{
  return MEMORY[0x1F4185050]();
}

uint64_t sub_1A9632510()
{
  return MEMORY[0x1F41851A0]();
}

uint64_t sub_1A9632520()
{
  return MEMORY[0x1F41851C0]();
}

uint64_t sub_1A9632530()
{
  return MEMORY[0x1F4185298]();
}

uint64_t sub_1A9632540()
{
  return MEMORY[0x1F41852A0]();
}

uint64_t sub_1A9632550()
{
  return MEMORY[0x1F41852A8]();
}

uint64_t sub_1A9632560()
{
  return MEMORY[0x1F4185350]();
}

uint64_t sub_1A9632570()
{
  return MEMORY[0x1F4185398]();
}

uint64_t sub_1A9632580()
{
  return MEMORY[0x1F41854C8]();
}

uint64_t sub_1A96325A0()
{
  return MEMORY[0x1F41854D8]();
}

uint64_t sub_1A96325B0()
{
  return MEMORY[0x1F41854E0]();
}

uint64_t sub_1A96325C0()
{
  return MEMORY[0x1F415F198]();
}

uint64_t sub_1A96325D0()
{
  return MEMORY[0x1F415F1A0]();
}

uint64_t sub_1A96325E0()
{
  return MEMORY[0x1F415F1A8]();
}

uint64_t sub_1A96325F0()
{
  return MEMORY[0x1F41854F8]();
}

uint64_t sub_1A9632600()
{
  return MEMORY[0x1F4185500]();
}

uint64_t sub_1A9632620()
{
  return MEMORY[0x1F4185518]();
}

uint64_t sub_1A9632630()
{
  return MEMORY[0x1F4185528]();
}

uint64_t sub_1A9632640()
{
  return MEMORY[0x1F4185568]();
}

uint64_t sub_1A9632650()
{
  return MEMORY[0x1F4185570]();
}

uint64_t sub_1A9632660()
{
  return MEMORY[0x1F4185578]();
}

uint64_t sub_1A9632670()
{
  return MEMORY[0x1F4185588]();
}

uint64_t sub_1A9632680()
{
  return MEMORY[0x1F4185598]();
}

uint64_t sub_1A9632690()
{
  return MEMORY[0x1F41855C0]();
}

uint64_t sub_1A96326A0()
{
  return MEMORY[0x1F41855E0]();
}

uint64_t sub_1A96326B0()
{
  return MEMORY[0x1F41855F0]();
}

uint64_t sub_1A96326C0()
{
  return MEMORY[0x1F4185608]();
}

uint64_t sub_1A96326D0()
{
  return MEMORY[0x1F4185628]();
}

uint64_t sub_1A96326E0()
{
  return MEMORY[0x1F4185630]();
}

uint64_t sub_1A96326F0()
{
  return MEMORY[0x1F4185638]();
}

uint64_t sub_1A9632700()
{
  return MEMORY[0x1F4185640]();
}

uint64_t sub_1A9632710()
{
  return MEMORY[0x1F4185648]();
}

uint64_t sub_1A9632720()
{
  return MEMORY[0x1F4185658]();
}

uint64_t sub_1A9632730()
{
  return MEMORY[0x1F4185690]();
}

uint64_t sub_1A9632740()
{
  return MEMORY[0x1F4185698]();
}

uint64_t sub_1A9632750()
{
  return MEMORY[0x1F41856A0]();
}

uint64_t sub_1A9632760()
{
  return MEMORY[0x1F41856B0]();
}

uint64_t sub_1A9632770()
{
  return MEMORY[0x1F41856C0]();
}

uint64_t sub_1A9632780()
{
  return MEMORY[0x1F41856E8]();
}

uint64_t sub_1A9632790()
{
  return MEMORY[0x1F4185710]();
}

uint64_t sub_1A96327A0()
{
  return MEMORY[0x1F4185740]();
}

uint64_t sub_1A96327B0()
{
  return MEMORY[0x1F4185758]();
}

uint64_t sub_1A96327C0()
{
  return MEMORY[0x1F41859A8]();
}

uint64_t sub_1A96327D0()
{
  return MEMORY[0x1F4185A40]();
}

uint64_t sub_1A96327F0()
{
  return MEMORY[0x1F4185A58]();
}

uint64_t sub_1A9632800()
{
  return MEMORY[0x1F4185A68]();
}

uint64_t sub_1A9632810()
{
  return MEMORY[0x1F4185A88]();
}

uint64_t sub_1A9632820()
{
  return MEMORY[0x1F4185B20]();
}

uint64_t sub_1A9632830()
{
  return MEMORY[0x1F4185B98]();
}

uint64_t sub_1A9632850()
{
  return MEMORY[0x1F4185D10]();
}

uint64_t sub_1A9632870()
{
  return MEMORY[0x1F4185DD8]();
}

uint64_t sub_1A9632880()
{
  return MEMORY[0x1F4185DE0]();
}

uint64_t sub_1A9632890()
{
  return MEMORY[0x1F4188170]();
}

uint64_t sub_1A96328B0()
{
  return MEMORY[0x1F40E6E30]();
}

uint64_t sub_1A96328C0()
{
  return MEMORY[0x1F4185E00]();
}

uint64_t sub_1A96328D0()
{
  return MEMORY[0x1F4185E08]();
}

uint64_t sub_1A96328E0()
{
  return MEMORY[0x1F4185E10]();
}

uint64_t sub_1A96328F0()
{
  return MEMORY[0x1F4185E18]();
}

uint64_t sub_1A9632900()
{
  return MEMORY[0x1F4185EB0]();
}

uint64_t sub_1A9632910()
{
  return MEMORY[0x1F4185EC8]();
}

uint64_t sub_1A9632920()
{
  return MEMORY[0x1F4185EE8]();
}

uint64_t sub_1A9632930()
{
  return MEMORY[0x1F4185EF8]();
}

uint64_t sub_1A9632940()
{
  return MEMORY[0x1F4185FB8]();
}

uint64_t sub_1A9632950()
{
  return MEMORY[0x1F4185FC8]();
}

uint64_t sub_1A9632960()
{
  return MEMORY[0x1F4185FE0]();
}

uint64_t sub_1A9632970()
{
  return MEMORY[0x1F4185FF0]();
}

uint64_t sub_1A9632980()
{
  return MEMORY[0x1F4186138]();
}

uint64_t sub_1A9632990()
{
  return MEMORY[0x1F41861A0]();
}

uint64_t sub_1A96329C0()
{
  return MEMORY[0x1F4186318]();
}

void CFRelease(CFTypeRef cf)
{
}

CLLocationCoordinate2D CLLocationCoordinate2DMake(CLLocationDegrees latitude, CLLocationDegrees longitude)
{
  MEMORY[0x1F40DB5A0](latitude, longitude);
  result.longitude = v3;
  result.latitude = v2;
  return result;
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1F417CDE0]();
}

uint64_t MKBDeviceUnlockedSinceBoot()
{
  return MEMORY[0x1F412F958]();
}

uint64_t MSVBundleIDForAuditToken()
{
  return MEMORY[0x1F412EB88]();
}

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return (NSArray *)MEMORY[0x1F40E7248](directory, domainMask, expandTilde);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
}

CFStringRef SecTaskCopySigningIdentifier(SecTaskRef task, CFErrorRef *error)
{
  return (CFStringRef)MEMORY[0x1F40F7128](task, error);
}

SecTaskRef SecTaskCreateWithAuditToken(CFAllocatorRef allocator, audit_token_t *token)
{
  return (SecTaskRef)MEMORY[0x1F40F7168](allocator, token);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1F40C9A70](aBlock);
}

void _Block_release(const void *aBlock)
{
}

uint64_t _CFCopySystemVersionDictionaryValue()
{
  return MEMORY[0x1F40D8D18]();
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

{
  return MEMORY[0x1F41813D0]();
}

{
  return MEMORY[0x1F41813F0]();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
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

long double atan2(long double __y, long double __x)
{
  MEMORY[0x1F40CA460](__y, __x);
  return result;
}

void bzero(void *a1, size_t a2)
{
}

long double cos(long double __x)
{
  MEMORY[0x1F40CB8A8](__x);
  return result;
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

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void free(void *a1)
{
}

pid_t getpid(void)
{
  return MEMORY[0x1F40CC4A0]();
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1F40CCB80](ptr);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB98](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCF0](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD10](__dst, __src, __len);
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

void objc_storeStrong(id *location, id obj)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1F40CD360](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

uint64_t os_transaction_create()
{
  return MEMORY[0x1F40CD5A0]();
}

uint64_t sandbox_check()
{
  return MEMORY[0x1F40CDDD0]();
}

long double sin(long double __x)
{
  MEMORY[0x1F40CE058](__x);
  return result;
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

uint64_t swift_getTupleTypeLayout2()
{
  return MEMORY[0x1F4186638]();
}

uint64_t swift_getTupleTypeLayout3()
{
  return MEMORY[0x1F4186640]();
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

uint64_t swift_initStaticObject()
{
  return MEMORY[0x1F41866B0]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x1F41866B8]();
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

uint64_t swift_unexpectedError()
{
  return MEMORY[0x1F41867D8]();
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

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x1F4186898]();
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

sysdir_search_path_enumeration_state sysdir_get_next_search_path_enumeration(sysdir_search_path_enumeration_state state, char *path)
{
  return MEMORY[0x1F40CE3E8](*(void *)&state, path);
}

uint64_t sysdir_start_search_path_enumeration_private()
{
  return MEMORY[0x1F40CE3F8]();
}

xpc_object_t xpc_activity_copy_criteria(xpc_activity_t activity)
{
  return (xpc_object_t)MEMORY[0x1F40CE978](activity);
}

xpc_activity_state_t xpc_activity_get_state(xpc_activity_t activity)
{
  return MEMORY[0x1F40CE990](activity);
}

void xpc_activity_register(const char *identifier, xpc_object_t criteria, xpc_activity_handler_t handler)
{
}

void xpc_activity_set_criteria(xpc_activity_t activity, xpc_object_t criteria)
{
}

BOOL xpc_activity_set_state(xpc_activity_t activity, xpc_activity_state_t state)
{
  return MEMORY[0x1F40CE9D0](activity, state);
}

BOOL xpc_activity_should_defer(xpc_activity_t activity)
{
  return MEMORY[0x1F40CE9E8](activity);
}

void xpc_activity_unregister(const char *identifier)
{
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1F40CEE20](keys, values, count);
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1F40CEEC8](xdict, key);
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