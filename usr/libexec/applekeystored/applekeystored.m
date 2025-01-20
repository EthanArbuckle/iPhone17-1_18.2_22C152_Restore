uint64_t sub_100004328()
{
  return sub_100004344();
}

uint64_t sub_100004344()
{
  return swift_release();
}

uint64_t sub_1000043EC()
{
  return sub_100004408();
}

uint64_t sub_100004408()
{
  return swift_release();
}

uint64_t sub_1000044B0()
{
  return sub_1000044CC();
}

uint64_t sub_1000044CC()
{
  return swift_release();
}

uint64_t sub_100004574()
{
  return sub_100004590();
}

uint64_t sub_100004590()
{
  return swift_release();
}

uint64_t sub_100004638()
{
  return sub_100004654();
}

uint64_t sub_100004654()
{
  return swift_release();
}

uint64_t sub_1000046FC()
{
  return sub_100004718();
}

uint64_t sub_100004718()
{
  return swift_release();
}

uint64_t sub_1000047C0()
{
  return sub_1000047DC();
}

uint64_t sub_1000047DC()
{
  return swift_release();
}

uint64_t sub_100004884()
{
  return sub_1000048A0();
}

uint64_t sub_1000048A0()
{
  return swift_release();
}

uint64_t sub_100004948()
{
  return sub_100004964();
}

uint64_t sub_100004964()
{
  return swift_release();
}

uint64_t sub_100004A0C(_OWORD *a1)
{
  uint64_t v2 = sub_1000082E0(&qword_10007C620);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = (char *)v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  long long v6 = a1[1];
  v9[0] = *a1;
  v9[1] = v6;
  long long v7 = a1[3];
  v9[2] = a1[2];
  v9[3] = v7;
  sub_10000514C((uint64_t)a1);
  sub_1000082E0(&qword_10007C618);
  AsyncStream.Continuation.yield(_:)();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t sub_100004B10()
{
  return swift_release();
}

uint64_t sub_100004BB8()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *v0;
  uint64_t v12 = *v0 + 80;
  uint64_t v3 = *(void *)(*v0 + 232);
  uint64_t v4 = *(void *)(*v0 + 224);
  uint64_t v5 = *(void *)(*v0 + 216);
  uint64_t v6 = *(void *)(*v0 + 208);
  uint64_t v7 = *(void *)(*v0 + 200);
  uint64_t v8 = *(void *)(*v0 + 192);
  uint64_t v13 = *v0;
  swift_task_dealloc();
  sub_1000053E8(v8, v7, v6, v5, v4, v3);
  v9 = (void *)swift_task_alloc();
  *(void *)(v2 + 184) = v9;
  void *v9 = v13;
  v9[1] = sub_100008D4C;
  uint64_t v10 = *(void *)(v1 + 160);
  return AsyncStream.Iterator.next(isolation:)(v12, 0, 0, v10);
}

uint64_t sub_100004E0C()
{
  uint64_t v1 = type metadata accessor for Logger();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v4 = (char *)v18 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  do
  {
    uint64_t v5 = *(_DWORD **)(v0 + 88);
    _DWORD *v5 = 0;
    unint64_t v6 = *(void *)(v0 + 80);
    if ((v6 & 0x8000000000000000) != 0 || HIDWORD(v6)) {
      goto LABEL_14;
    }
    v5[1] = v6;
    uint64_t v7 = *(void *)(v0 + 88);
    *(void *)(v7 + 8) = 0;
    uint64_t result = mach_msg((mach_msg_header_t *)v7, 258, 0, *(_DWORD *)(v7 + 4), *(_DWORD *)(v0 + 56), 0, 0);
  }
  while (!result);
  mach_error_t v9 = result;
  if (result == 268451843) {
    return result;
  }
  if (qword_10007A5C0 != -1) {
    swift_once();
  }
  uint64_t v10 = sub_10000AF48(v1, (uint64_t)qword_10007DAE0);
  (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v4, v10, v1);
  v11 = Logger.logObject.getter();
  os_log_type_t v12 = static os_log_type_t.error.getter();
  if (!os_log_type_enabled(v11, v12))
  {
LABEL_11:

    return (*(uint64_t (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  }
  uint64_t v13 = swift_slowAlloc();
  uint64_t v19 = swift_slowAlloc();
  *(_DWORD *)uint64_t v13 = 136315394;
  v18[1] = v9;
  sub_100027368();
  uint64_t v14 = String.init<A>(_:radix:uppercase:)();
  *(void *)(v13 + 4) = sub_10001EE9C(v14, v15, &v19);
  swift_bridgeObjectRelease();
  *(_WORD *)(v13 + 12) = 2080;
  if (mach_error_string(v9))
  {
    uint64_t v16 = String.init(cString:)();
    *(void *)(v13 + 14) = sub_10001EE9C(v16, v17, &v19);
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v11, v12, "mach_msg receive failed: 0x%s %s", (uint8_t *)v13, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
    goto LABEL_11;
  }
  __break(1u);
LABEL_14:
  uint64_t result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t sub_10000514C(uint64_t a1)
{
  return a1;
}

uint64_t sub_100005184()
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
    return _swift_task_switch(sub_100044F00, 0, 0);
  }
  else
  {
    swift_task_dealloc();
    swift_task_dealloc();
    unint64_t v6 = *(uint64_t (**)(void))(v5 + 8);
    return v6();
  }
}

uint64_t sub_100005340()
{
  return swift_release();
}

uint64_t sub_1000053E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (a6)
  {
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_10000542C(unint64_t a1, uint64_t a2, char a3, char a4, unsigned __int8 a5)
{
  if ((a3 & 1) == 0)
  {
    char v6 = a4;
    switch(a4)
    {
      case 1:
        if (((a1 >> 1) & 1) == 0) {
          return 1;
        }
        goto LABEL_9;
      case 2:
        goto LABEL_8;
      case 3:
        char v6 = 3;
LABEL_8:
        if ((a1 >> v6)) {
          goto LABEL_9;
        }
        return 1;
      case 4:
        goto LABEL_9;
      default:
        if ((a1 & 1) == 0) {
          return 1;
        }
LABEL_9:
        if ((sub_1000089A4(a5, 0) & ~a2) != 0) {
          return 1;
        }
        uint64_t v7 = *(void *)(v5 + 136) + 40;
        break;
    }
    goto LABEL_11;
  }
  if (!(a1 | a2))
  {
    uint64_t v7 = *(void *)(v5 + 136) + 48;
LABEL_11:
    uint64_t v8 = *(uint64_t (**)(uint64_t))(**(void **)v7 + 136);
    uint64_t v9 = swift_retain();
    atomic_fetch_add_explicit((atomic_ullong *volatile)v8(v9), 1uLL, memory_order_relaxed);
    swift_release();
    return 0;
  }
  return 1;
}

uint64_t sub_100005524(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  *(void *)(v6 + 56) = v5;
  uint64_t v12 = type metadata accessor for ContinuousClock.Instant();
  *(void *)(v6 + 64) = v12;
  *(void *)(v6 + 72) = *(void *)(v12 - 8);
  *(void *)(v6 + 80) = swift_task_alloc();
  *(void *)(v6 + 88) = swift_task_alloc();
  *(void *)(v6 + 40) = a1;
  *(void *)(v6 + 48) = a2;
  *(void *)(v6 + 16) = a3;
  *(void *)(v6 + 24) = a4;
  *(unsigned char *)(v6 + 32) = a5 & 1;
  return _swift_task_switch(sub_100005B54, 0, 0);
}

uint64_t sub_100005628(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_10001D498(a1, a2, a3, (void (*)(uint64_t, uint64_t))sub_10001FA80);
}

uint64_t sub_100005640()
{
  uint64_t v34 = v0;
  unsigned int v1 = *(_DWORD *)(v0 + 152);
  unsigned __int8 v2 = sub_100009358(*(unsigned __int8 *)(v0 + 156), *(unsigned char *)(v0 + 157) & 1 | ((*(unsigned char *)(v0 + 158) & 1u) << 8), *(void *)(v0 + 112), *(unsigned char *)(v0 + 159));
  char v3 = sub_100009478(v1);
  uint64_t v4 = *(void *)(v0 + 80);
  if (v3 == 5)
  {
    uint64_t v5 = *(uint64_t (**)(uint64_t))(**(void **)(*(void *)(v4 + 136) + 64) + 136);
    uint64_t v6 = swift_retain();
    atomic_fetch_add_explicit((atomic_ullong *volatile)v5(v6), 1uLL, memory_order_relaxed);
    swift_release();
    if (qword_10007A5C8 != -1) {
      swift_once();
    }
    uint64_t v8 = (uint64_t *)(v0 + 72);
    uint64_t v7 = *(void *)(v0 + 72);
    uint64_t v9 = type metadata accessor for Logger();
    sub_10000AF48(v9, (uint64_t)qword_10007DAF8);
    sub_10000514C(v7);
    uint64_t v10 = Logger.logObject.getter();
    os_log_type_t v11 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v10, v11))
    {
      int v12 = *(_DWORD *)(v0 + 152);
      uint64_t v13 = *v8;
      uint64_t v14 = swift_slowAlloc();
      uint64_t v33 = swift_slowAlloc();
      *(_DWORD *)uint64_t v14 = 67109378;
      *(_DWORD *)(v0 + 148) = v12;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *(_WORD *)(v14 + 8) = 2080;
      uint64_t v16 = *(void *)(v13 + 32);
      unint64_t v15 = *(void *)(v13 + 40);
      swift_bridgeObjectRetain();
      *(void *)(v0 + 64) = sub_10001EE9C(v16, v15, &v33);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      sub_100037CDC(v13);
      _os_log_impl((void *)&_mh_execute_header, v10, v11, "invalid event type %u for %s", (uint8_t *)v14, 0x12u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      sub_100037CDC(*v8);
    }

    goto LABEL_16;
  }
  char v17 = v3;
  uint64_t v18 = *(void *)(v0 + 72);
  uint64_t v19 = *(void *)(v18 + 48);
  uint64_t v20 = *(void *)(v18 + 56);
  sub_10000699C(v19, v20, *(void *)(v4 + 112), (void *)(v0 + 16));
  if (*(unsigned char *)(v0 + 33))
  {
    uint64_t v21 = *(void *)(v0 + 80);
    v22 = (unint64_t *)(v21 + 80);
    v23 = (uint64_t *)(v21 + 88);
    char v24 = *(unsigned char *)(v21 + 96);
  }
  else
  {
    v23 = (uint64_t *)(v0 + 24);
    char v24 = *(unsigned char *)(v0 + 32) & 1;
    v22 = (unint64_t *)(v0 + 16);
  }
  if ((sub_10000542C(*v22, *v23, v24, v17, v2) & 1) == 0)
  {
    sub_100008940(v0 + 16);
LABEL_16:
    v31 = *(uint64_t (**)(void))(v0 + 8);
    return v31();
  }
  v25 = *(uint64_t (**)(uint64_t))(**(void **)(*(void *)(*(void *)(v0 + 80) + 136) + 24) + 136);
  uint64_t v26 = swift_retain();
  atomic_fetch_add_explicit((atomic_ullong *volatile)v25(v26), 1uLL, memory_order_relaxed);
  swift_release();
  uint64_t v28 = *(void *)(v0 + 40);
  uint64_t v27 = *(void *)(v0 + 48);
  *(void *)(v0 + 120) = v28;
  *(void *)(v0 + 128) = v27;
  swift_bridgeObjectRetain();
  uint64_t v29 = swift_task_alloc();
  *(void *)(v0 + 136) = v29;
  *(void *)uint64_t v29 = v0;
  *(void *)(v29 + 8) = sub_100035D80;
  int8x16_t v30 = *(int8x16_t *)(v0 + 96);
  *(void *)(v29 + 72) = *(void *)(v0 + 80);
  *(int8x16_t *)(v29 + 56) = vextq_s8(v30, v30, 8uLL);
  *(unsigned char *)(v29 + 81) = v2;
  *(unsigned char *)(v29 + 80) = v17;
  *(void *)(v29 + 40) = v28;
  *(void *)(v29 + 48) = v27;
  *(void *)(v29 + 24) = v19;
  *(void *)(v29 + 32) = v20;
  return _swift_task_switch(sub_100036000, 0, 0);
}

unsigned int *sub_100005A64(uint64_t a1)
{
  uint64_t result = (unsigned int *)sub_100004E0C();
  char v3 = *(IODataQueueMemory **)(a1 + 40);
  if (((unint64_t)v3 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else
  {
    for (uint64_t result = (unsigned int *)IODataQueuePeek(*(IODataQueueMemory **)(a1 + 40));
          result;
          uint64_t result = (unsigned int *)IODataQueuePeek(v3))
    {
      sub_1000060A0((long long *)(result + 1), (uint64_t)result + *result + 4, (uint64_t)v5);
      sub_1000084C8((uint64_t)v5, (uint64_t)v6, &qword_10007C678);
      if (*((void *)&v7 + 1))
      {
        v9[0] = v6[0];
        v9[1] = v6[1];
        v9[2] = v7;
        v9[3] = v8;
        uint64_t v4 = *(void (**)(_OWORD *))(a1 + 16);
        if (v4)
        {
          swift_retain();
          v4(v9);
          sub_100009348((uint64_t)v4);
        }
        sub_10000930C(v5);
      }
      IODataQueueDequeue(v3, 0, 0);
    }
  }
  return result;
}

uint64_t sub_100005B54()
{
  uint64_t v1 = v0[10];
  uint64_t v2 = v0[8];
  uint64_t v3 = v0[9];
  uint64_t v4 = type metadata accessor for ContinuousClock();
  uint64_t v5 = sub_100005D3C(&qword_10007D4D0, (void (*)(uint64_t))&type metadata accessor for ContinuousClock);
  dispatch thunk of Clock.now.getter();
  sub_100005D3C(&qword_10007D4D8, (void (*)(uint64_t))&type metadata accessor for ContinuousClock.Instant);
  dispatch thunk of InstantProtocol.advanced(by:)();
  uint64_t v6 = *(void (**)(uint64_t, uint64_t))(v3 + 8);
  v0[12] = v6;
  v0[13] = (v3 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v6(v1, v2);
  long long v7 = (void *)swift_task_alloc();
  v0[14] = v7;
  *long long v7 = v0;
  v7[1] = sub_100005184;
  uint64_t v8 = v0[11];
  return dispatch thunk of Clock.sleep(until:tolerance:)(v8, v0 + 2, v4, v5);
}

uint64_t sub_100005CF4(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_100005D3C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_100005D84()
{
  uint64_t v1 = v0[25];
  swift_retain();
  sub_100008630(v0 + 2);
  swift_release();
  sub_10000658C();
  dispatch thunk of ModelContext.save()();
  if (v1)
  {
    if (qword_10007A5C0 != -1) {
      swift_once();
    }
    uint64_t v2 = type metadata accessor for Logger();
    sub_10000AF48(v2, (uint64_t)qword_10007DAE0);
    swift_errorRetain();
    swift_errorRetain();
    uint64_t v3 = Logger.logObject.getter();
    os_log_type_t v4 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v3, v4))
    {
      uint64_t v5 = (uint8_t *)swift_slowAlloc();
      unint64_t v15 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v5 = 138412290;
      swift_errorRetain();
      uint64_t v6 = _swift_stdlib_bridgeErrorToNSError();
      v0[17] = v6;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *unint64_t v15 = v6;
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v3, v4, "counter checkpoint failed: %@", v5, 0xCu);
      sub_1000082E0(&qword_10007BFB8);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      swift_errorRelease();
      swift_errorRelease();
    }
    uint64_t v7 = v0[18];

    uint64_t v8 = *(uint64_t (**)(uint64_t))(**(void **)(*(void *)(v7 + 224) + 80) + 136);
    uint64_t v9 = swift_retain();
    atomic_fetch_add_explicit((atomic_ullong *volatile)v8(v9), 1uLL, memory_order_relaxed);
    swift_release();
    swift_errorRelease();
  }
  uint64_t v10 = *(void *)(v0[18] + 16);
  uint64_t v11 = 1000000000000000000 * v10;
  uint64_t v12 = ((v10 >> 63) & 0xF21F494C589C0000) + (((unint64_t)v10 * (unsigned __int128)0xDE0B6B3A7640000uLL) >> 64);
  ContinuousClock.init()();
  uint64_t v16 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, char))((char *)&dword_10007D4C8 + dword_10007D4C8);
  uint64_t v13 = (void *)swift_task_alloc();
  v0[24] = v13;
  *uint64_t v13 = v0;
  v13[1] = sub_100008A78;
  return v16(v11, v12, 0, 0, 1);
}

void sub_1000060A0(long long *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = type metadata accessor for String.Encoding();
  __chkstk_darwin(v6 - 8);
  if (!a1 || a2 - (uint64_t)a1 <= 31)
  {
    if (qword_10007A5C0 != -1) {
      swift_once();
    }
    uint64_t v7 = type metadata accessor for Logger();
    sub_10000AF48(v7, (uint64_t)qword_10007DAE0);
    uint64_t v8 = Logger.logObject.getter();
    os_log_type_t v9 = static os_log_type_t.error.getter();
    if (!os_log_type_enabled(v8, v9)) {
      goto LABEL_22;
    }
    uint64_t v10 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v10 = 134217984;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "short AnalyticsEvent message %ld", v10, 0xCu);
    goto LABEL_21;
  }
  uint64_t v11 = *((unsigned int *)a1 + 5);
  int v12 = v11 + 32;
  if (v11 >= 0xFFFFFFE0)
  {
    __break(1u);
    goto LABEL_31;
  }
  uint64_t v13 = *((unsigned int *)a1 + 6);
  BOOL v14 = __CFADD__(v12, v13);
  int v15 = v12 + v13;
  if (v14)
  {
LABEL_31:
    __break(1u);
    goto LABEL_32;
  }
  if (a2 - (void)a1 != v15)
  {
    if (qword_10007A5C0 == -1)
    {
LABEL_14:
      uint64_t v25 = type metadata accessor for Logger();
      sub_10000AF48(v25, (uint64_t)qword_10007DAE0);
      uint64_t v8 = Logger.logObject.getter();
      os_log_type_t v26 = static os_log_type_t.error.getter();
      if (!os_log_type_enabled(v8, v26))
      {
LABEL_22:

LABEL_23:
        uint64_t v23 = 0;
        uint64_t v13 = 0;
        uint64_t v18 = 0;
        uint64_t v19 = 0;
        uint64_t v20 = 0;
        uint64_t v22 = 0;
        long long v24 = 0uLL;
        goto LABEL_24;
      }
      uint64_t v27 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)uint64_t v27 = 134217984;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      uint64_t v28 = "invalid AnalyticsEvent length %ld";
      uint64_t v29 = v8;
      os_log_type_t v30 = v26;
      v31 = v27;
      uint32_t v32 = 12;
      goto LABEL_20;
    }
LABEL_32:
    swift_once();
    goto LABEL_14;
  }
  long long v41 = *a1;
  uint64_t v40 = *((unsigned int *)a1 + 4);
  static String.Encoding.utf8.getter();
  sub_1000082E0(&qword_10007C680);
  sub_10000949C(&qword_10007C688, &qword_10007C680);
  uint64_t v16 = String.init<A>(bytes:encoding:)();
  if (!v17)
  {
    if (qword_10007A5C0 != -1) {
      swift_once();
    }
    uint64_t v33 = type metadata accessor for Logger();
    sub_10000AF48(v33, (uint64_t)qword_10007DAE0);
    uint64_t v8 = Logger.logObject.getter();
    os_log_type_t v34 = static os_log_type_t.error.getter();
    if (!os_log_type_enabled(v8, v34)) {
      goto LABEL_22;
    }
    uint64_t v35 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v35 = 0;
    uint64_t v28 = "invalid AnalyticsEvent path";
    uint64_t v29 = v8;
    os_log_type_t v30 = v34;
    v31 = v35;
    uint32_t v32 = 2;
LABEL_20:
    _os_log_impl((void *)&_mh_execute_header, v29, v30, v28, v31, v32);
LABEL_21:
    swift_slowDealloc();
    goto LABEL_22;
  }
  uint64_t v18 = v16;
  uint64_t v19 = v17;
  swift_bridgeObjectRetain();
  static String.Encoding.utf8.getter();
  uint64_t v20 = String.init<A>(bytes:encoding:)();
  uint64_t v22 = v21;
  swift_bridgeObjectRelease();
  if (!v22)
  {
    if (qword_10007A5C0 != -1) {
      swift_once();
    }
    uint64_t v36 = type metadata accessor for Logger();
    sub_10000AF48(v36, (uint64_t)qword_10007DAE0);
    v37 = Logger.logObject.getter();
    os_log_type_t v38 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v37, v38))
    {
      v39 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v39 = 0;
      _os_log_impl((void *)&_mh_execute_header, v37, v38, "invalid AnalyticsEvent proc", v39, 2u);
      swift_slowDealloc();
    }

    swift_bridgeObjectRelease();
    goto LABEL_23;
  }
  uint64_t v23 = v40 | (v11 << 32);
  long long v24 = v41;
LABEL_24:
  *(_OWORD *)a3 = v24;
  *(void *)(a3 + 16) = v23;
  *(void *)(a3 + 24) = v13;
  *(void *)(a3 + 32) = v18;
  *(void *)(a3 + 40) = v19;
  *(void *)(a3 + 48) = v20;
  *(void *)(a3 + 56) = v22;
}

uint64_t sub_10000658C()
{
  return swift_release();
}

uint64_t sub_10000699C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X4>, void *a4@<X8>)
{
  uint64_t v5 = v4;
  uint64_t v213 = a3;
  uint64_t v221 = a1;
  v184 = a4;
  uint64_t v195 = sub_1000082E0(&qword_10007D900);
  __chkstk_darwin(v195);
  v194 = (char *)&v184 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v211 = sub_1000082E0(&qword_10007D908);
  uint64_t v8 = __chkstk_darwin(v211);
  v193 = (char *)&v184 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  v205 = (char *)&v184 - v10;
  uint64_t v192 = sub_1000082E0(&qword_10007D910);
  uint64_t v11 = __chkstk_darwin(v192);
  v191 = (char *)&v184 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  uint64_t v204 = (uint64_t)&v184 - v13;
  uint64_t v14 = sub_1000082E0(&qword_10007CB18);
  __chkstk_darwin(v14 - 8);
  v207 = (char *)&v184 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v230 = sub_1000082E0(&qword_10007D918);
  uint64_t v16 = *(void *)(v230 - 8);
  __chkstk_darwin(v230);
  v218 = (char *)&v184 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v240 = type metadata accessor for FilePath.ComponentView.Index();
  uint64_t v18 = *(void *)(v240 - 8);
  uint64_t v19 = __chkstk_darwin(v240);
  v239 = (char *)&v184 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v19);
  v241 = (char *)&v184 - v21;
  uint64_t v246 = type metadata accessor for FilePath.Component();
  uint64_t v210 = *(void *)(v246 - 8);
  uint64_t v22 = __chkstk_darwin(v246);
  v212 = (char *)&v184 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = __chkstk_darwin(v22);
  v247 = (char *)&v184 - v25;
  uint64_t v26 = __chkstk_darwin(v24);
  v217 = (char *)&v184 - v27;
  __chkstk_darwin(v26);
  v216 = (char *)&v184 - v28;
  uint64_t v29 = sub_1000082E0(&qword_10007D920);
  uint64_t v30 = __chkstk_darwin(v29 - 8);
  v226 = (void **)((char *)&v184 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0));
  __chkstk_darwin(v30);
  v225 = (char *)&v184 - v32;
  uint64_t v242 = type metadata accessor for FilePath.ComponentView();
  uint64_t v33 = *(void *)(v242 - 8);
  uint64_t v34 = __chkstk_darwin(v242);
  v197 = (char *)&v184 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v34);
  v224 = (char *)&v184 - v36;
  uint64_t v37 = sub_1000082E0(&qword_10007D928);
  __chkstk_darwin(v37 - 8);
  v39 = (char *)&v184 - ((v38 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v40 = sub_1000082E0(&qword_10007D930);
  __chkstk_darwin(v40);
  uint64_t v235 = (uint64_t)&v184 - ((v41 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v209 = type metadata accessor for FilePath();
  uint64_t v198 = *(void *)(v209 - 8);
  uint64_t v42 = __chkstk_darwin(v209);
  v196 = (char *)&v184 - ((v43 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v44 = __chkstk_darwin(v42);
  v208 = (char *)&v184 - v45;
  __chkstk_darwin(v44);
  v243 = (char *)&v184 - v46;
  swift_beginAccess();
  uint64_t v47 = *(void *)(v4 + 40);
  uint64_t v48 = *(void *)(v47 + 16);
  uint64_t v220 = a2;
  if (!v48) {
    goto LABEL_5;
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  unint64_t v49 = sub_10000836C(v221, a2);
  if ((v50 & 1) == 0)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
LABEL_5:
    uint64_t v188 = *(void *)(v5 + 16);
    uint64_t v187 = *(void *)(v5 + 24);
    int v186 = *(unsigned __int8 *)(v5 + 32);
    int v185 = *(unsigned __int8 *)(v5 + 33);
    goto LABEL_6;
  }
  uint64_t v51 = *(void *)(v47 + 56) + 24 * v49;
  uint64_t v188 = *(void *)v51;
  uint64_t v187 = *(void *)(v51 + 8);
  int v186 = *(unsigned __int8 *)(v51 + 16);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  int v185 = 0;
LABEL_6:
  swift_bridgeObjectRetain();
  v52 = v243;
  FilePath.init(_:)();
  v53 = *(void (**)(void, void, void))(v198 + 16);
  uint64_t v203 = v198 + 16;
  v202 = v53;
  v53(v208, v52, v209);
  FilePath.components.getter();
  v55 = *(void (**)(char *, char *, uint64_t))(v33 + 32);
  uint64_t v54 = v33 + 32;
  v55(v224, v39, v242);
  sub_100008324(&qword_10007D938, (void (*)(uint64_t))&type metadata accessor for FilePath.ComponentView);
  uint64_t v56 = v235;
  dispatch thunk of Sequence.makeIterator()();
  uint64_t v215 = *(int *)(v40 + 36);
  *(void *)(v56 + v215) = 0;
  uint64_t v57 = v56 + *(int *)(sub_1000082E0(&qword_10007D940) + 36);
  v59 = *(void (**)(void, void, void))(v18 + 16);
  uint64_t v58 = v18 + 16;
  v237 = (void (*)(char *, uint64_t, uint64_t))v59;
  v244 = (void (**)(char *, uint64_t))(v58 - 8);
  v222 = (void (**)(char *))(v210 + 16);
  v214 = (void (**)(char *, uint64_t, uint64_t))(v54 - 16);
  v223 = (void (**)(char *, uint64_t))(v54 - 24);
  v229 = (uint64_t (**)(char *, char *, uint64_t))(v210 + 32);
  v228 = (void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v16 + 56);
  v227 = (unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48);
  v206 = (uint64_t (**)(uint64_t, uint64_t, uint64_t))(v210 + 48);
  uint64_t v238 = v58;
  v190 = (void (**)(void, void, void))(v58 + 16);
  v233 = (void (**)(char *, uint64_t))(v210 + 8);
  swift_retain();
  long long v189 = xmmword_1000569E0;
  v60 = v239;
  uint64_t v236 = v57;
  uint64_t v61 = v5;
  while (1)
  {
    uint64_t v245 = v61;
    uint64_t v66 = (uint64_t)v241;
    uint64_t v67 = v240;
    v237(v241, v57, v240);
    uint64_t v68 = sub_100008324(&qword_10007D948, (void (*)(uint64_t))&type metadata accessor for FilePath.ComponentView);
    uint64_t v69 = v235;
    uint64_t v70 = v242;
    dispatch thunk of Collection.endIndex.getter();
    sub_100008324(&qword_10007D950, (void (*)(uint64_t))&type metadata accessor for FilePath.ComponentView.Index);
    char v71 = dispatch thunk of static Equatable.== infix(_:_:)();
    v72 = *v244;
    (*v244)(v60, v67);
    v72((char *)v66, v67);
    uint64_t v232 = v68;
    if ((v71 & 1) == 0) {
      break;
    }
    uint64_t v73 = 1;
    uint64_t v75 = v246;
    v74 = v247;
    uint64_t v76 = (uint64_t)v226;
    v77 = v225;
    v78 = v243;
    v79 = (void (**)(char *, char *, uint64_t))v229;
    uint64_t v80 = v230;
LABEL_14:
    (*v228)(v76, v73, 1, v80);
    sub_1000084C8(v76, (uint64_t)v77, &qword_10007D920);
    if ((*v227)(v77, 1, v80) == 1) {
      goto LABEL_43;
    }
    v234 = v72;
    v231 = *(void (**)(uint64_t *, void))v77;
    v93 = *v79;
    (*v79)(v74, &v77[*(int *)(v80 + 48)], v75);
    uint64_t v94 = v245;
    int v95 = *(unsigned __int8 *)(v245 + 56);
    if (v95 == 6
      || (uint64_t v96 = FilePath.Component.string.getter(),
          uint64_t v98 = sub_100033244(v96, v97, v95),
          v100 = v99,
          uint64_t v57 = v236,
          swift_bridgeObjectRelease(),
          !v100))
    {
      uint64_t v105 = FilePath.Component.string.getter();
    }
    else
    {
      uint64_t v249 = 36;
      unint64_t v250 = 0xE100000000000000;
      unint64_t v101 = 0xE700000000000000;
      uint64_t v102 = 0x61746144707061;
      switch(v95)
      {
        case 1:
          uint64_t v103 = 0x6E6967756C70;
          goto LABEL_22;
        case 2:
          unint64_t v101 = 0xE600000000000000;
          uint64_t v102 = 0x6E6F6D656164;
          break;
        case 3:
          uint64_t v103 = 0x6D6574737973;
LABEL_22:
          uint64_t v102 = v103 & 0xFFFFFFFFFFFFLL | 0x6144000000000000;
          unint64_t v101 = 0xEA00000000006174;
          break;
        case 4:
          unint64_t v101 = 0xE800000000000000;
          uint64_t v102 = 0x70756F7247707061;
          break;
        case 5:
          unint64_t v101 = 0xEB0000000070756FLL;
          uint64_t v102 = 0x72476D6574737973;
          break;
        default:
          break;
      }
      unint64_t v106 = v101;
      String.append(_:)(*(Swift::String *)&v102);
      swift_bridgeObjectRelease();
      v107._countAndFlagsBits = 40;
      v107._object = (void *)0xE100000000000000;
      String.append(_:)(v107);
      v108._countAndFlagsBits = v98;
      v108._object = v100;
      String.append(_:)(v108);
      v109._countAndFlagsBits = 41;
      v109._object = (void *)0xE100000000000000;
      String.append(_:)(v109);
      swift_bridgeObjectRelease();
      uint64_t v105 = v249;
      unint64_t v110 = v250;
      swift_bridgeObjectRetain();
      uint64_t v111 = (uint64_t)v207;
      unint64_t v219 = v110;
      FilePath.Component.init(_:)();
      int v112 = (*v206)(v111, 1, v75);
      v113 = v243;
      if (v112 == 1)
      {
        sub_100008590(v111, &qword_10007CB18);
        if (qword_10007A5C0 != -1) {
          swift_once();
        }
        uint64_t v114 = type metadata accessor for Logger();
        sub_10000AF48(v114, (uint64_t)qword_10007DAE0);
        v115 = Logger.logObject.getter();
        os_log_type_t v116 = static os_log_type_t.error.getter();
        BOOL v117 = os_log_type_enabled(v115, v116);
        uint64_t v57 = v236;
        if (v117)
        {
          v118 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v118 = 0;
          _os_log_impl((void *)&_mh_execute_header, v115, v116, "failed to replace normalize directory name", v118, 2u);
          swift_slowDealloc();
        }
      }
      else
      {
        uint64_t v201 = v105;
        v93(v212, (char *)v111, v75);
        v119 = v113;
        v120 = v113;
        uint64_t v121 = v209;
        v122 = (void (*)(char *, char *, uint64_t))v202;
        v202(v208, v119, v209);
        v123 = v224;
        FilePath.components.getter();
        v122(v196, v120, v121);
        v124 = v197;
        FilePath.components.getter();
        uint64_t v125 = (uint64_t)v239;
        FilePath.ComponentView.startIndex.getter();
        v126 = *v223;
        v127 = v124;
        uint64_t v128 = v242;
        (*v223)(v127, v242);
        uint64_t v129 = (uint64_t)v241;
        sub_10004F3D8(v125, (uint64_t)v231, (uint64_t)v241);
        v130 = v234;
        v234((char *)v125, v240);
        v126(v123, v128);
        sub_100008324(&qword_10007D958, (void (*)(uint64_t))&type metadata accessor for FilePath.ComponentView.Index);
        uint64_t result = dispatch thunk of static Comparable.<= infix(_:_:)();
        if ((result & 1) == 0) {
          goto LABEL_45;
        }
        uint64_t v131 = v211;
        v132 = v205;
        v133 = &v205[*(int *)(v211 + 48)];
        v134 = v130;
        uint64_t v135 = v240;
        v136 = v237;
        ((void (*)(char *, uint64_t))v237)(v205, v129);
        v136(v133, v129, v135);
        v137 = v193;
        v138 = &v193[*(int *)(v131 + 48)];
        v136(v193, (uint64_t)v132, v135);
        v136(v138, (uint64_t)v133, v135);
        v139 = *v190;
        v199 = v139;
        uint64_t v140 = (uint64_t)v191;
        v139(v191, v137, v135);
        v134(v138, v135);
        uint64_t v141 = v211;
        v142 = &v137[*(int *)(v211 + 48)];
        v139(v137, v132, v135);
        v139(v142, v133, v135);
        v139(v140 + *(int *)(v192 + 36), v142, v135);
        v134(v137, v135);
        uint64_t v143 = v204;
        sub_1000084C8(v140, v204, &qword_10007D910);
        sub_1000082E0(&qword_10007D960);
        uint64_t v144 = v210;
        unint64_t v145 = (*(unsigned __int8 *)(v210 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v210 + 80);
        uint64_t v146 = swift_allocObject();
        *(_OWORD *)(v146 + 16) = v189;
        (*(void (**)(unint64_t, char *, uint64_t))(v144 + 16))(v146 + v145, v212, v246);
        v231 = (void (*)(uint64_t *, void))FilePath.components.modify();
        uint64_t v200 = v147;
        uint64_t v248 = v146;
        v148 = v239;
        dispatch thunk of Collection.index(after:)();
        uint64_t v149 = v141;
        v150 = v205;
        v151 = &v205[*(int *)(v141 + 48)];
        v152 = (void (*)(char *, char *, uint64_t))v237;
        v237(v205, v143, v135);
        v153 = v151;
        v154 = v151;
        v155 = (void (*)(char *, char *, uint64_t))v199;
        v199(v154, v148, v135);
        v156 = &v137[*(int *)(v149 + 48)];
        v152(v137, v150, v135);
        v157 = v153;
        v152(v156, v153, v135);
        v158 = v194;
        v155(v194, v137, v135);
        v159 = v234;
        v234(v156, v135);
        v160 = &v137[*(int *)(v211 + 48)];
        v155(v137, v150, v135);
        v155(v160, v157, v135);
        v155(&v158[*(int *)(v195 + 36)], v160, v135);
        v159(v137, v135);
        sub_100008324(&qword_10007D968, (void (*)(uint64_t))&type metadata accessor for FilePath.ComponentView);
        sub_1000082E0(&qword_10007D970);
        sub_10000949C(&qword_10007D978, &qword_10007D970);
        dispatch thunk of RangeReplaceableCollection.replaceSubrange<A>(_:with:)();
        uint64_t v161 = (uint64_t)v158;
        uint64_t v75 = v246;
        sub_100008590(v161, &qword_10007D900);
        sub_100008590(v204, &qword_10007D910);
        v231(&v249, 0);
        v159(v241, v135);
        (*(void (**)(char *, uint64_t))(v210 + 8))(v212, v75);
        uint64_t v57 = v236;
        uint64_t v94 = v245;
        uint64_t v105 = v201;
      }
      unint64_t v104 = v219;
    }
    uint64_t v249 = v105;
    unint64_t v250 = v104;
    uint64_t v162 = String.init<A>(_:)();
    uint64_t v164 = v163;
    swift_beginAccess();
    uint64_t v165 = *(void *)(v94 + 48);
    if (!*(void *)(v165 + 16)) {
      goto LABEL_42;
    }
    swift_bridgeObjectRetain();
    unint64_t v166 = sub_10000836C(v162, v164);
    if ((v167 & 1) == 0)
    {
      swift_bridgeObjectRelease();
LABEL_42:
      swift_bridgeObjectRelease();
      v78 = v243;
      (*v233)(v247, v75);
LABEL_43:
      sub_100008590(v235, &qword_10007D930);
      v174 = v208;
      v175 = v78;
      v176 = v78;
      uint64_t v177 = v209;
      v202(v208, v175, v209);
      uint64_t v178 = FilePath.string.getter();
      uint64_t v180 = v179;
      swift_release();
      v181 = *(void (**)(char *, uint64_t))(v198 + 8);
      v181(v174, v177);
      uint64_t result = ((uint64_t (*)(char *, uint64_t))v181)(v176, v177);
      v182 = v184;
      uint64_t v183 = v187;
      void *v184 = v188;
      v182[1] = v183;
      *((unsigned char *)v182 + 16) = v186;
      *((unsigned char *)v182 + 17) = v185 & 1;
      v182[3] = v178;
      v182[4] = v180;
      return result;
    }
    uint64_t v168 = *(void *)(*(void *)(v165 + 56) + 8 * v166);
    swift_retain();
    swift_release();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_beginAccess();
    uint64_t v169 = *(void *)(v168 + 40);
    if (*(void *)(v169 + 16))
    {
      uint64_t v170 = v220;
      swift_bridgeObjectRetain();
      swift_retain();
      swift_bridgeObjectRetain();
      unint64_t v171 = sub_10000836C(v221, v170);
      if ((v172 & 1) == 0)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        goto LABEL_8;
      }
      uint64_t v173 = *(void *)(v169 + 56) + 24 * v171;
      uint64_t v188 = *(void *)v173;
      uint64_t v187 = *(void *)(v173 + 8);
      int v186 = *(unsigned __int8 *)(v173 + 16);
      swift_release();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      (*v233)(v247, v246);
      int v185 = 0;
      v60 = v239;
      uint64_t v61 = v168;
    }
    else
    {
      swift_retain();
LABEL_8:
      v60 = v239;
      uint64_t v62 = *(void *)(v168 + 16);
      uint64_t v63 = *(void *)(v168 + 24);
      int v64 = *(unsigned __int8 *)(v168 + 32);
      char v65 = *(unsigned char *)(v168 + 33);
      swift_release();
      (*v233)(v247, v246);
      uint64_t v61 = v168;
      if ((v65 & 1) == 0)
      {
        int v185 = 0;
        uint64_t v188 = v62;
        uint64_t v187 = v63;
        int v186 = v64;
        uint64_t v61 = v168;
      }
    }
  }
  v81 = (void (*)(uint64_t *, void))dispatch thunk of Collection.subscript.read();
  uint64_t v82 = v69;
  v83 = v217;
  uint64_t v75 = v246;
  (*v222)(v217);
  v81(&v249, 0);
  v84 = v224;
  (*v214)(v224, v82, v70);
  dispatch thunk of Collection.formIndex(after:)();
  (*v223)(v84, v70);
  v79 = (void (**)(char *, char *, uint64_t))v229;
  v85 = *v229;
  v86 = v216;
  (*v229)(v216, v83, v75);
  uint64_t v87 = v230;
  v88 = &v218[*(int *)(v230 + 48)];
  uint64_t v89 = v215;
  uint64_t v90 = *(void *)(v82 + v215);
  uint64_t result = v85(v88, v86, v75);
  if (!__OFADD__(v90, 1))
  {
    *(void *)(v82 + v89) = v90 + 1;
    uint64_t v76 = (uint64_t)v226;
    v92 = (char *)v226 + *(int *)(v87 + 48);
    void *v226 = v90;
    v85(v92, v88, v75);
    uint64_t v73 = 0;
    v74 = v247;
    v77 = v225;
    v78 = v243;
    uint64_t v57 = v236;
    uint64_t v80 = v87;
    goto LABEL_14;
  }
  __break(1u);
LABEL_45:
  __break(1u);
  return result;
}

uint64_t sub_100008234(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_100008298(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_1000082E0(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_100008324(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_10000836C(uint64_t a1, uint64_t a2)
{
  Hasher.init(_seed:)();
  String.hash(into:)();
  Swift::Int v4 = Hasher._finalize()();

  return sub_1000083E4(a1, a2, v4);
}

unint64_t sub_1000083E4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
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
      while (!v14 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_1000084C8(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_1000082E0(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

__n128 initializeWithTake for AnalyticsEvent(uint64_t a1, uint64_t a2)
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

uint64_t sub_100008540(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_100008590(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_1000082E0(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_1000085EC(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

uint64_t *sub_100008630@<X0>(void *a1@<X8>)
{
  uint64_t v15 = *(void *)(*(uint64_t (**)(void))(*v1[2] + 136))();
  uint64_t v14 = *(void *)(*(uint64_t (**)(void))(*v1[3] + 136))();
  uint64_t v13 = *(void *)(*(uint64_t (**)(void))(*v1[4] + 136))();
  uint64_t v12 = *(void *)(*(uint64_t (**)(void))(*v1[5] + 136))();
  uint64_t v3 = *(void *)(*(uint64_t (**)(void))(*v1[6] + 136))();
  uint64_t v4 = *(void *)(*(uint64_t (**)(void))(*v1[7] + 136))();
  uint64_t v5 = *(void *)(*(uint64_t (**)(void))(*v1[8] + 136))();
  uint64_t v6 = *(void *)(*(uint64_t (**)(void))(*v1[9] + 136))();
  uint64_t v7 = *(void *)(*(uint64_t (**)(void))(*v1[10] + 136))();
  uint64_t v8 = *(void *)(*(uint64_t (**)(void))(*v1[11] + 136))();
  uint64_t v9 = *(void *)(*(uint64_t (**)(void))(*v1[12] + 136))();
  __n128 result = (uint64_t *)(*(uint64_t (**)(void))(*v1[13] + 136))();
  uint64_t v11 = *result;
  *a1 = v15;
  a1[1] = v14;
  a1[2] = v13;
  a1[3] = v12;
  a1[4] = v3;
  a1[5] = v4;
  a1[6] = v5;
  a1[7] = v6;
  a1[8] = v7;
  a1[9] = v8;
  a1[10] = v9;
  a1[11] = v11;
  return result;
}

uint64_t sub_1000088C4(_OWORD *a1)
{
  sub_1000082E0(&qword_10007C618);

  return sub_100004A0C(a1);
}

unsigned int *sub_100008938()
{
  return sub_100005A64(v0);
}

uint64_t sub_100008940(uint64_t a1)
{
  return a1;
}

uint64_t sub_10000896C()
{
  return sub_100004B10();
}

uint64_t sub_100008988()
{
  return sub_100005340();
}

uint64_t sub_1000089A4(unsigned __int8 a1, char a2)
{
  if (a2)
  {
    uint64_t v2 = a1;
    uint64_t result = 6144;
    switch(v2)
    {
      case 1:
        LOBYTE(v2) = 1;
        return 1 << v2;
      case 2:
        LOBYTE(v2) = 2;
        return 1 << v2;
      case 3:
        LOBYTE(v2) = 3;
        return 1 << v2;
      case 4:
        LOBYTE(v2) = 4;
        return 1 << v2;
      case 5:
        LOBYTE(v2) = 5;
        return 1 << v2;
      case 6:
        LOBYTE(v2) = 6;
        return 1 << v2;
      case 7:
        LOBYTE(v2) = 7;
        return 1 << v2;
      case 8:
        LOBYTE(v2) = 8;
        return 1 << v2;
      case 9:
        LOBYTE(v2) = 9;
        return 1 << v2;
      case 10:
        LOBYTE(v2) = 10;
        return 1 << v2;
      case 11:
        LOBYTE(v2) = 11;
        return 1 << v2;
      case 12:
        return result;
      case 13:
        uint64_t result = 14336;
        break;
      case 14:
        uint64_t result = 30720;
        break;
      case 15:
        uint64_t result = 63488;
        break;
      case 16:
        uint64_t result = 129024;
        break;
      case 17:
        uint64_t result = 260096;
        break;
      case 18:
        LOBYTE(v2) = 63;
        return 1 << v2;
      default:
        return 1 << v2;
    }
  }
  else
  {
    uint64_t v2 = qword_10005AB80[(char)a1];
    return 1 << v2;
  }
  return result;
}

uint64_t sub_100008A78()
{
  uint64_t v2 = *(void **)v1;
  *(void *)(*(void *)v1 + 200) = v0;
  swift_task_dealloc();
  (*(void (**)(void, void))(v2[20] + 8))(v2[21], v2[19]);
  if (v0) {
    uint64_t v3 = sub_10003FB94;
  }
  else {
    uint64_t v3 = sub_100005D84;
  }
  return _swift_task_switch(v3, 0, 0);
}

uint64_t sub_100008BE0(int a1)
{
  if ((a1 + 1) > 8) {
    return 9;
  }
  else {
    return byte_100058480[a1 + 1];
  }
}

uint64_t sub_100008C04()
{
  uint64_t v1 = *(void *)(v0 + 80);
  uint64_t v2 = *(void *)(v0 + 88);
  *(void *)(v0 + 192) = v1;
  *(void *)(v0 + 200) = v2;
  uint64_t v4 = *(void *)(v0 + 96);
  uint64_t v3 = *(void *)(v0 + 104);
  *(void *)(v0 + 208) = v4;
  *(void *)(v0 + 216) = v3;
  uint64_t v5 = *(void *)(v0 + 112);
  uint64_t v6 = *(void *)(v0 + 120);
  *(void *)(v0 + 224) = v5;
  *(void *)(v0 + 232) = v6;
  uint64_t v7 = *(void *)(v0 + 128);
  uint64_t v8 = *(void *)(v0 + 136);
  *(void *)(v0 + 240) = v7;
  *(void *)(v0 + 248) = v8;
  if (v6)
  {
    *(void *)(v0 + 16) = v1;
    *(void *)(v0 + 24) = v2;
    *(void *)(v0 + 32) = v4;
    *(_DWORD *)(v0 + 40) = v3;
    *(void *)(v0 + 48) = v5;
    *(void *)(v0 + 56) = v6;
    *(void *)(v0 + 64) = v7;
    *(void *)(v0 + 72) = v8;
    uint64_t v9 = (void *)swift_task_alloc();
    *(void *)(v0 + 256) = v9;
    void *v9 = v0;
    v9[1] = sub_100004BB8;
    uint64_t v10 = *(void *)(v0 + 152);
    v9[9] = v0 + 16;
    v9[10] = v10;
    return _swift_task_switch(sub_100009000, 0, 0);
  }
  else
  {
    (*(void (**)(void, void))(*(void *)(v0 + 168) + 8))(*(void *)(v0 + 176), *(void *)(v0 + 160));
    swift_task_dealloc();
    uint64_t v11 = *(uint64_t (**)(void))(v0 + 8);
    return v11();
  }
}

uint64_t sub_100008D4C()
{
  swift_task_dealloc();
  return _swift_task_switch(sub_100008C04, 0, 0);
}

uint64_t sub_100008E48()
{
  uint64_t v1 = *(void *)(v0 + 88);
  int v2 = *(unsigned __int8 *)(v1 + 128);
  *(unsigned char *)(v0 + 157) = v2;
  if (v2 == 2
    || (int v3 = *(unsigned __int8 *)(v1 + 129), *(unsigned char *)(v0 + 158) = v3, v3 == 2)
    || (*(void *)(v0 + 96) = *(void *)(v1 + 160), (*(unsigned char *)(v1 + 168) & 1) != 0))
  {
    uint64_t v4 = sub_100035F24;
    goto LABEL_5;
  }
  *(void *)(v0 + 104) = *(void *)(v1 + 152);
  unint64_t v5 = *(void *)(v1 + 136);
  if ((*(unsigned char *)(v1 + 144) & 1) == 0)
  {
    __uint64_t v6 = clock_gettime_nsec_np(_CLOCK_MONOTONIC);
    if (v6 >= v5)
    {
      char v11 = 0;
      unint64_t v5 = (v6 - v5) / 0x3B9ACA00;
      goto LABEL_17;
    }
    if (qword_10007A5C0 != -1) {
      swift_once();
    }
    uint64_t v7 = type metadata accessor for Logger();
    sub_10000AF48(v7, (uint64_t)qword_10007DAE0);
    uint64_t v8 = Logger.logObject.getter();
    os_log_type_t v9 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v8, v9))
    {
      uint64_t v10 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, v9, "Unexpected deviceLockTime", v10, 2u);
      swift_slowDealloc();
    }

    unint64_t v5 = 0;
  }
  char v11 = 1;
LABEL_17:
  *(unsigned char *)(v0 + 159) = v11;
  *(void *)(v0 + 112) = v5;
  uint64_t v4 = sub_100005640;
LABEL_5:
  return _swift_task_switch(v4, 0, 0);
}

uint64_t sub_100009000()
{
  uint64_t v20 = v0;
  uint64_t v1 = *(void *)(v0 + 72);
  *(_DWORD *)(v0 + 152) = *(_DWORD *)(v1 + 12);
  int v2 = *(_DWORD *)(v1 + 16);
  char v3 = sub_100008BE0(v2);
  *(unsigned char *)(v0 + 156) = v3;
  uint64_t v4 = *(void *)(v0 + 80);
  if (v3 == 9)
  {
    unint64_t v5 = *(uint64_t (**)(uint64_t))(**(void **)(*(void *)(v4 + 136) + 56) + 136);
    uint64_t v6 = swift_retain();
    atomic_fetch_add_explicit((atomic_ullong *volatile)v5(v6), 1uLL, memory_order_relaxed);
    swift_release();
    if (qword_10007A5C8 != -1) {
      swift_once();
    }
    uint64_t v7 = *(void *)(v0 + 72);
    uint64_t v8 = type metadata accessor for Logger();
    sub_10000AF48(v8, (uint64_t)qword_10007DAF8);
    sub_10000514C(v7);
    os_log_type_t v9 = Logger.logObject.getter();
    os_log_type_t v10 = static os_log_type_t.error.getter();
    BOOL v11 = os_log_type_enabled(v9, v10);
    uint64_t v12 = *(void *)(v0 + 72);
    if (v11)
    {
      uint64_t v13 = swift_slowAlloc();
      uint64_t v19 = swift_slowAlloc();
      *(_DWORD *)uint64_t v13 = 67109378;
      *(_DWORD *)(v0 + 144) = v2;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *(_WORD *)(v13 + 8) = 2080;
      uint64_t v14 = *(void *)(v12 + 32);
      unint64_t v15 = *(void *)(v12 + 40);
      swift_bridgeObjectRetain();
      *(void *)(v0 + 56) = sub_10001EE9C(v14, v15, &v19);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      sub_100037CDC(v12);
      _os_log_impl((void *)&_mh_execute_header, v9, v10, "invalid protection class %u for %s", (uint8_t *)v13, 0x12u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      sub_100037CDC(*(void *)(v0 + 72));
    }

    uint64_t v17 = *(uint64_t (**)(void))(v0 + 8);
    return v17();
  }
  else
  {
    uint64_t v16 = *(void *)(v4 + 72);
    *(void *)(v0 + 88) = v16;
    return _swift_task_switch(sub_100008E48, v16, 0);
  }
}

uint64_t storeEnumTagSinglePayload for AnalyticsEvent(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)uint64_t result = a2 ^ 0x80000000;
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
      *(void *)(result + 40) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 64) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

uint64_t *sub_10000930C(uint64_t *a1)
{
  return a1;
}

uint64_t sub_100009348(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t sub_100009358(uint64_t result, __int16 a2, unint64_t a3, char a4)
{
  switch((char)result)
  {
    case 3:
      if ((a2 & 0x100) != 0) {
        uint64_t result = 3;
      }
      else {
        uint64_t result = 4;
      }
      if ((a2 & 0x100) != 0 && (a4 & 1) == 0)
      {
        if (a3 / 0xE10)
        {
          if (a3 / 0xE10 == 1)
          {
            uint64_t result = 12;
          }
          else if ((a3 - 7200) >> 5 >= 0xE1)
          {
            if ((a3 - 14400) >> 6 >= 0xE1)
            {
              if ((a3 - 28800) >> 6 >= 0xE1)
              {
                if ((a3 - 43200) >> 6 < 0x2A3) {
                  uint64_t result = 16;
                }
                else {
                  uint64_t result = 17;
                }
              }
              else
              {
                uint64_t result = 15;
              }
            }
            else
            {
              uint64_t result = 14;
            }
          }
          else
          {
            uint64_t result = 13;
          }
        }
        else
        {
          uint64_t result = 11;
        }
      }
      break;
    case 4:
      if (a2) {
        uint64_t result = 6;
      }
      else {
        uint64_t result = 5;
      }
      break;
    case 5:
      uint64_t result = 7;
      break;
    case 6:
      uint64_t result = 8;
      break;
    case 7:
      if ((a2 & 0x100) != 0) {
        uint64_t result = 9;
      }
      else {
        uint64_t result = 10;
      }
      break;
    case 8:
      uint64_t result = 18;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_100009478(unsigned int a1)
{
  if (a1 >= 5) {
    return 5;
  }
  else {
    return (0x203030100uLL >> (8 * a1));
  }
}

uint64_t sub_10000949C(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_10000B1E0(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1000094E0()
{
  uint64_t v0 = type metadata accessor for Logger();
  sub_10000AFD4(v0, qword_10007DA80);
  sub_10000AF48(v0, (uint64_t)qword_10007DA80);
  return Logger.init(subsystem:category:)();
}

BOOL sub_10000955C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

Swift::Int sub_100009570()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void sub_1000095B8()
{
  Hasher._combine(_:)(*v0);
}

Swift::Int sub_1000095E4()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

const char *sub_100009628()
{
  return "AppleKeyStore";
}

const char *sub_10000963C()
{
  Swift::UInt v1 = "applekeystored";
  if (*v0 != 1) {
    Swift::UInt v1 = "analytics";
  }
  if (*v0) {
    return v1;
  }
  else {
    return "oti";
  }
}

void sub_100009684(uint64_t a1)
{
}

uint64_t sub_100009690(uint64_t a1)
{
  Swift::UInt v1 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  uint64_t v2 = swift_unknownObjectRetain();
  v1(v2);
  swift_release();

  return swift_unknownObjectRelease();
}

void sub_1000096F0(uint64_t a1)
{
}

void sub_1000096FC(uint64_t a1, const char *a2)
{
  if (qword_10007A5C0 != -1) {
    swift_once();
  }
  uint64_t v3 = type metadata accessor for Logger();
  sub_10000AF48(v3, (uint64_t)qword_10007DAE0);
  oslog = Logger.logObject.getter();
  os_log_type_t v4 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(oslog, v4))
  {
    unint64_t v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)unint64_t v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, oslog, v4, a2, v5, 2u);
    swift_slowDealloc();
  }
}

uint64_t sub_1000097EC()
{
  uint64_t v19 = &type metadata for AppleKeyStore;
  unint64_t v20 = sub_10000AF80();
  LOBYTE(v17) = 2;
  int v0 = isFeatureEnabled(_:)();
  sub_100008540((uint64_t)&v17);
  if (&metaclass for ModelContainer) {
    BOOL v1 = &nominal type descriptor for ModelContainer == 0;
  }
  else {
    BOOL v1 = 1;
  }
  int v6 = !v1
    && &type metadata for ModelContainer != 0
    && &type metadata accessor for ModelContainer != 0
    && &protocol conformance descriptor for ModelContainer != 0
    && &class metadata base offset for ModelContainer != 0;
  uint64_t v7 = v0 & v6;
  if (v7 == 1)
  {
    if (qword_10007A5A0 != -1) {
      swift_once();
    }
    uint64_t v8 = type metadata accessor for Logger();
    sub_10000AF48(v8, (uint64_t)qword_10007DA80);
    os_log_type_t v9 = Logger.logObject.getter();
    os_log_type_t v10 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v9, v10))
    {
      BOOL v11 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)BOOL v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, v10, "analytics ENABLED", v11, 2u);
      swift_slowDealloc();
    }

    long long v17 = xmmword_1000565C0;
    char v18 = 0;
    uint64_t v19 = 0;
    unint64_t v20 = 0;
    uint64_t v21 = 1024;
    char v22 = 0;
    uint64_t v23 = 0;
    uint64_t v24 = 0;
    uint64_t v25 = 86400;
    char v26 = 0;
    uint64_t v27 = 7200;
    char v28 = 0;
    uint64_t v29 = 1800;
    char v30 = 0;
    uint64_t v31 = 600;
    char v32 = 0;
    long long v33 = xmmword_1000565D0;
    char v34 = 0;
    char v35 = 1;
    uint64_t v36 = 4096;
    sub_100046000(&v17);
  }
  else
  {
    if (qword_10007A5A0 != -1) {
      swift_once();
    }
    uint64_t v12 = type metadata accessor for Logger();
    sub_10000AF48(v12, (uint64_t)qword_10007DA80);
    uint64_t v13 = Logger.logObject.getter();
    os_log_type_t v14 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v13, v14))
    {
      unint64_t v15 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v15 = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, v14, "analytics DISABLED", v15, 2u);
      swift_slowDealloc();
    }
  }
  return v7;
}

void sub_100009AB4()
{
  type metadata accessor for AKSDaemon();
  sub_1000082E0(&qword_10007A688);
  Flag.wrappedValue.getter();
  sub_10000ADF8();
  Flag.wrappedValue.getter();
  if (v4 == 1) {
    exit(0);
  }
  Flag.wrappedValue.getter();
  if (qword_10007A5A0 != -1) {
    swift_once();
  }
  uint64_t v0 = type metadata accessor for Logger();
  sub_10000AF48(v0, (uint64_t)qword_10007DA80);
  BOOL v1 = Logger.logObject.getter();
  os_log_type_t v2 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "applekeystored feature flag DISABLED, NOT running applekeystored", v3, 2u);
    swift_slowDealloc();
  }

  if (sub_1000097EC()) {
    CFRunLoopRun();
  }
}

BOOL sub_100009C08(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_100009C20()
{
  if (*v0) {
    return 0x65646F4D74736574;
  }
  else {
    return 0xD000000000000010;
  }
}

uint64_t sub_100009C60@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_10000B8EC(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_100009C88()
{
  return 0;
}

void sub_100009C94(unsigned char *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_100009CA0(uint64_t a1)
{
  unint64_t v2 = sub_10000B0D4();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100009CDC(uint64_t a1)
{
  unint64_t v2 = sub_10000B0D4();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_100009D18@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v24 = a2;
  uint64_t v29 = sub_1000082E0(&qword_10007A688);
  uint64_t v25 = *(void *)(v29 - 8);
  uint64_t v3 = ((uint64_t (*)(void))__chkstk_darwin)();
  uint64_t v27 = (char *)&v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  char v28 = (char *)&v24 - v5;
  uint64_t v30 = sub_1000082E0(&qword_10007A750);
  uint64_t v26 = *(void *)(v30 - 8);
  __chkstk_darwin(v30);
  uint64_t v7 = (char *)&v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_1000082E0(&qword_10007A748);
  __chkstk_darwin(v8 - 8);
  os_log_type_t v10 = (char *)&v24 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for NameSpecification();
  __chkstk_darwin(v11 - 8);
  uint64_t v12 = type metadata accessor for AKSDaemon();
  uint64_t v13 = v12 - 8;
  __chkstk_darwin(v12);
  unint64_t v15 = (char *)&v24 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  static NameSpecification.customLong(_:withSingleDash:)();
  uint64_t v16 = type metadata accessor for ArgumentHelp();
  long long v17 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56);
  v17(v10, 1, 1, v16);
  Flag<A>.init(wrappedValue:name:help:)();
  char v18 = &v15[*(int *)(v13 + 28)];
  static NameSpecification.customLong(_:withSingleDash:)();
  v17(v10, 1, 1, v16);
  Flag<A>.init(wrappedValue:name:help:)();
  sub_10000B090(a1, a1[3]);
  sub_10000B0D4();
  uint64_t v19 = v31;
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (!v19)
  {
    uint64_t v20 = v25;
    char v33 = 0;
    sub_10000B184();
    KeyedDecodingContainer.decode<A>(_:forKey:)();
    uint64_t v31 = *(void (**)(void, void, void))(v20 + 40);
    v31(v15, v28, v29);
    char v32 = 1;
    uint64_t v21 = v30;
    KeyedDecodingContainer.decode<A>(_:forKey:)();
    (*(void (**)(char *, uint64_t))(v26 + 8))(v7, v21);
    uint64_t v22 = v24;
    v31(v18, v27, v29);
    sub_10000B228((uint64_t)v15, v22);
  }
  sub_100008540((uint64_t)a1);
  return sub_10000B128((uint64_t)v15);
}

void sub_10000A178()
{
}

uint64_t sub_10000A1A0()
{
  sub_1000082E0(&qword_10007A748);
  __chkstk_darwin();
  BOOL v1 = (char *)&v5 - ((v0 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for NameSpecification();
  __chkstk_darwin();
  static NameSpecification.customLong(_:withSingleDash:)();
  uint64_t v2 = type metadata accessor for ArgumentHelp();
  uint64_t v3 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56);
  v3(v1, 1, 1, v2);
  Flag<A>.init(wrappedValue:name:help:)();
  static NameSpecification.customLong(_:withSingleDash:)();
  v3(v1, 1, 1, v2);
  return Flag<A>.init(wrappedValue:name:help:)();
}

void sub_10000A32C()
{
}

uint64_t sub_10000A348@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_100009D18(a1, a2);
}

int main(int argc, const char **argv, const char **envp)
{
  return 0;
}

uint64_t type metadata accessor for AKSDaemon()
{
  uint64_t result = qword_10007A6E8;
  if (!qword_10007A6E8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

__n128 sub_10000A418(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t sub_10000A430(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 24)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_10000A450(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)__n128 result = (a2 - 1);
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
  *(unsigned char *)(result + 24) = v3;
  return result;
}

void type metadata accessor for mach_msg_header_t(uint64_t a1)
{
}

uint64_t initializeBufferWithCopyOfBuffer for FileAnalyticsEvent(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

__n128 sub_10000A4D8(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  long long v2 = *(_OWORD *)(a2 + 16);
  long long v3 = *(_OWORD *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v4;
  *(_OWORD *)(a1 + 16) = v2;
  *(_OWORD *)(a1 + 32) = v3;
  long long v5 = *(_OWORD *)(a2 + 80);
  long long v6 = *(_OWORD *)(a2 + 96);
  long long v7 = *(_OWORD *)(a2 + 128);
  *(_OWORD *)(a1 + 112) = *(_OWORD *)(a2 + 112);
  *(_OWORD *)(a1 + 128) = v7;
  *(_OWORD *)(a1 + 80) = v5;
  *(_OWORD *)(a1 + 96) = v6;
  __n128 result = *(__n128 *)(a2 + 144);
  long long v9 = *(_OWORD *)(a2 + 160);
  long long v10 = *(_OWORD *)(a2 + 192);
  *(_OWORD *)(a1 + 176) = *(_OWORD *)(a2 + 176);
  *(_OWORD *)(a1 + 192) = v10;
  *(__n128 *)(a1 + 144) = result;
  *(_OWORD *)(a1 + 160) = v9;
  return result;
}

uint64_t sub_10000A514(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 208)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_10000A534(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 200) = 0;
    *(_OWORD *)(result + 184) = 0u;
    *(_OWORD *)(result + 168) = 0u;
    *(_OWORD *)(result + 152) = 0u;
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = (a2 - 1);
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
  *(unsigned char *)(result + 208) = v3;
  return result;
}

void type metadata accessor for AKSAnalyticsCounters(uint64_t a1)
{
}

uint64_t *sub_10000A5BC(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
    uint64_t v7 = sub_1000082E0(&qword_10007A688);
    uint64_t v8 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16);
    v8(a1, a2, v7);
    v8((uint64_t *)((char *)a1 + *(int *)(a3 + 20)), (uint64_t *)((char *)a2 + *(int *)(a3 + 20)), v7);
  }
  return a1;
}

uint64_t sub_10000A6A8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000082E0(&qword_10007A688);
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8);
  ((void (*)(void *__return_ptr, uint64_t, uint64_t))v7)((void *)(v4 - 8), a1, v4);
  uint64_t v5 = a1 + *(int *)(a2 + 20);

  return v7(v5, v4);
}

uint64_t sub_10000A74C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1000082E0(&qword_10007A688);
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16);
  v7(a1, a2, v6);
  v7(a1 + *(int *)(a3 + 20), a2 + *(int *)(a3 + 20), v6);
  return a1;
}

uint64_t sub_10000A7E8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1000082E0(&qword_10007A688);
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24);
  v7(a1, a2, v6);
  v7(a1 + *(int *)(a3 + 20), a2 + *(int *)(a3 + 20), v6);
  return a1;
}

uint64_t sub_10000A884(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1000082E0(&qword_10007A688);
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32);
  v7(a1, a2, v6);
  v7(a1 + *(int *)(a3 + 20), a2 + *(int *)(a3 + 20), v6);
  return a1;
}

uint64_t sub_10000A920(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1000082E0(&qword_10007A688);
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40);
  v7(a1, a2, v6);
  v7(a1 + *(int *)(a3 + 20), a2 + *(int *)(a3 + 20), v6);
  return a1;
}

uint64_t sub_10000A9BC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10000A9D0);
}

uint64_t sub_10000A9D0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000082E0(&qword_10007A688);
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48);

  return v5(a1, a2, v4);
}

uint64_t sub_10000AA40(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10000AA54);
}

uint64_t sub_10000AA54(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000082E0(&qword_10007A688);
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);

  return v5(a1, a2, a2, v4);
}

void sub_10000AAC8()
{
  sub_10000B6B0(319, (unint64_t *)&unk_10007A6F8, (uint64_t)&type metadata for Bool, (uint64_t (*)(void, uint64_t))&type metadata accessor for Flag);
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

uint64_t sub_10000AB78()
{
  return sub_10000ABC0(&qword_10007A728, (void (*)(uint64_t))type metadata accessor for AKSDaemon);
}

uint64_t sub_10000ABC0(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_10000AC08()
{
  return sub_10000ABC0(&qword_10007A730, (void (*)(uint64_t))type metadata accessor for AKSDaemon);
}

uint64_t sub_10000AC50()
{
  return _CFObject.hashValue.getter();
}

uint64_t sub_10000AC9C()
{
  return _CFObject.hash(into:)();
}

Swift::Int sub_10000ACF4()
{
  return Hasher._finalize()();
}

BOOL sub_10000AD5C(_DWORD *a1, _DWORD *a2)
{
  return *a1 == *a2;
}

uint64_t sub_10000AD70()
{
  swift_getWitnessTable();

  return static _CFObject.== infix(_:_:)();
}

void sub_10000ADDC(_DWORD *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_10000ADE8(uint64_t result, unsigned char **a2)
{
  long long v2 = *a2;
  *long long v2 = result;
  *a2 = v2 + 1;
  return result;
}

void sub_10000ADF8()
{
  sub_10000B038();
  unint64_t v0 = static OS_dispatch_queue.main.getter();
  uint64_t v8 = sub_100009684;
  uint64_t v9 = 0;
  uint64_t v4 = _NSConcreteStackBlock;
  uint64_t v5 = 1107296256;
  uint64_t v6 = sub_100009690;
  uint64_t v7 = &unk_1000733C8;
  BOOL v1 = _Block_copy(&v4);
  xpc_set_event_stream_handler("com.apple.iokit.matching", v0, v1);
  _Block_release(v1);

  long long v2 = static OS_dispatch_queue.main.getter();
  uint64_t v8 = sub_1000096F0;
  uint64_t v9 = 0;
  uint64_t v4 = _NSConcreteStackBlock;
  uint64_t v5 = 1107296256;
  uint64_t v6 = sub_100009690;
  uint64_t v7 = &unk_1000733F0;
  char v3 = _Block_copy(&v4);
  xpc_set_event_stream_handler("com.apple.notifyd.matching", v2, v3);
  _Block_release(v3);
}

uint64_t sub_10000AF48(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

unint64_t sub_10000AF80()
{
  unint64_t result = qword_10007A738;
  if (!qword_10007A738)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007A738);
  }
  return result;
}

uint64_t *sub_10000AFD4(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

unint64_t sub_10000B038()
{
  unint64_t result = qword_10007A740;
  if (!qword_10007A740)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_10007A740);
  }
  return result;
}

uint64_t sub_10000B078(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10000B088()
{
  return swift_release();
}

void *sub_10000B090(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_10000B0D4()
{
  unint64_t result = qword_10007A758;
  if (!qword_10007A758)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007A758);
  }
  return result;
}

uint64_t sub_10000B128(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for AKSDaemon();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_10000B184()
{
  unint64_t result = qword_10007A760;
  if (!qword_10007A760)
  {
    sub_10000B1E0(&qword_10007A688);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007A760);
  }
  return result;
}

uint64_t sub_10000B1E0(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_10000B228(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for AKSDaemon();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

void type metadata accessor for CFNumber(uint64_t a1)
{
}

void type metadata accessor for CFString(uint64_t a1)
{
}

unsigned char *initializeBufferWithCopyOfBuffer for AKSDaemon.CodingKeys(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for AKSDaemon.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for AKSDaemon.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x10000B444);
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

uint64_t sub_10000B46C(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_10000B478(unsigned char *result, char a2)
{
  *uint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for AKSDaemon.CodingKeys()
{
  return &type metadata for AKSDaemon.CodingKeys;
}

uint64_t getEnumTagSinglePayload for AppleKeyStore(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for AppleKeyStore(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x10000B5F0);
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

unsigned char *sub_10000B618(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for AppleKeyStore()
{
  return &type metadata for AppleKeyStore;
}

__n128 sub_10000B630(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t sub_10000B63C(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 32)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_10000B65C(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)__n128 result = (a2 - 1);
    *(void *)(result + 8) = 0;
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
  *(unsigned char *)(result + 32) = v3;
  return result;
}

void type metadata accessor for AKSAnalyticsEventHeader(uint64_t a1)
{
}

void sub_10000B6B0(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t (*a4)(void, uint64_t))
{
  if (!*a2)
  {
    unint64_t v5 = a4(0, a3);
    if (!v6) {
      atomic_store(v5, a2);
    }
  }
}

unint64_t sub_10000B700()
{
  unint64_t result = qword_10007A780;
  if (!qword_10007A780)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007A780);
  }
  return result;
}

unint64_t sub_10000B758()
{
  unint64_t result = qword_10007A788;
  if (!qword_10007A788)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007A788);
  }
  return result;
}

uint64_t sub_10000B7AC()
{
  return sub_10000ABC0(&qword_10007A790, type metadata accessor for CFString);
}

uint64_t sub_10000B7F4()
{
  return sub_10000ABC0(&qword_10007A798, type metadata accessor for CFString);
}

unint64_t sub_10000B840()
{
  unint64_t result = qword_10007A7A0;
  if (!qword_10007A7A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007A7A0);
  }
  return result;
}

unint64_t sub_10000B898()
{
  unint64_t result = qword_10007A7A8;
  if (!qword_10007A7A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007A7A8);
  }
  return result;
}

uint64_t sub_10000B8EC(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000010 && a2 == 0x800000010005CBF0
    || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x65646F4D74736574 && a2 == 0xE800000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v5 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if (v5) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_10000B9E8(uint64_t a1)
{
  return sub_100011EAC(a1, qword_10007DA98);
}

uint64_t sub_10000B9F8@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v4 = *a1;
  swift_getKeyPath();
  sub_100008298(&qword_10007BFA0, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV1.ProcessAnalytics);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  swift_getKeyPath();
  sub_100008298(&qword_10007C008, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV1.ProcessAnalytics);
  PersistentModel.getValue<A>(forKey:)();
  uint64_t result = swift_release();
  *a2 = v4;
  a2[1] = v5;
  return result;
}

uint64_t sub_10000BB04()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_10000BBF0()
{
  swift_getKeyPath();
  sub_100008298(&qword_10007BFA0, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV1.ProcessAnalytics);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  swift_getKeyPath();
  sub_100008298(&qword_10007C008, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV1.ProcessAnalytics);
  PersistentModel.getValue<A>(forKey:)();
  swift_release();
  return v0;
}

uint64_t sub_10000BCF4@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v4 = *a1;
  swift_getKeyPath();
  sub_100008298(&qword_10007BFA0, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV1.ProcessAnalytics);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  swift_getKeyPath();
  sub_100008298(&qword_10007C008, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV1.ProcessAnalytics);
  PersistentModel.getValue<A>(forKey:)();
  uint64_t result = swift_release();
  *a2 = v4;
  a2[1] = v5;
  return result;
}

uint64_t sub_10000BE00()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_10000BEEC()
{
  swift_getKeyPath();
  sub_100008298(&qword_10007BFA0, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV1.ProcessAnalytics);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  swift_getKeyPath();
  sub_100008298(&qword_10007C008, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV1.ProcessAnalytics);
  PersistentModel.getValue<A>(forKey:)();
  swift_release();
  return v0;
}

uint64_t sub_10000BFF0@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v4 = *a1;
  swift_getKeyPath();
  sub_100008298(&qword_10007BFA0, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV1.ProcessAnalytics);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  swift_getKeyPath();
  sub_100008298(&qword_10007C008, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV1.ProcessAnalytics);
  PersistentModel.getValue<A>(forKey:)();
  uint64_t result = swift_release();
  *a2 = v4;
  return result;
}

uint64_t sub_10000C0FC()
{
  return swift_release();
}

uint64_t sub_10000C1C8()
{
  swift_getKeyPath();
  sub_100008298(&qword_10007BFA0, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV1.ProcessAnalytics);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  swift_getKeyPath();
  sub_100008298(&qword_10007C008, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV1.ProcessAnalytics);
  PersistentModel.getValue<A>(forKey:)();
  swift_release();
  return v0;
}

uint64_t sub_10000C2CC()
{
  return swift_release();
}

uint64_t sub_10000C374@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v4 = *a1;
  swift_getKeyPath();
  sub_100008298(&qword_10007BFA0, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV1.ProcessAnalytics);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  swift_getKeyPath();
  sub_100008298(&qword_10007C008, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV1.ProcessAnalytics);
  PersistentModel.getValue<A>(forKey:)();
  uint64_t result = swift_release();
  *a2 = v4;
  return result;
}

uint64_t sub_10000C480()
{
  return swift_release();
}

uint64_t sub_10000C54C()
{
  swift_getKeyPath();
  sub_100008298(&qword_10007BFA0, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV1.ProcessAnalytics);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  swift_getKeyPath();
  sub_100008298(&qword_10007C008, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV1.ProcessAnalytics);
  PersistentModel.getValue<A>(forKey:)();
  swift_release();
  return v0;
}

uint64_t sub_10000C650()
{
  return swift_release();
}

uint64_t sub_10000C6F8(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = (uint64_t *)(v1 + 16);
  uint64_t v5 = type metadata accessor for AnalyticsSchemaV1.ProcessAnalytics(0);
  *(void *)(v2 + 40) = sub_1000082E0(&qword_10007C010);
  *(void *)&long long v7 = v5;
  *((void *)&v7 + 1) = v5;
  uint64_t v8 = sub_100008298(&qword_10007C008, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV1.ProcessAnalytics);
  uint64_t v9 = v8;
  *(void *)(v2 + 48) = swift_getOpaqueTypeConformance2();
  sub_10001FA98(v4);
  static PersistentModel.createBackingData<A>()();
  ObservationRegistrar.init()();
  sub_100008234(a1, (uint64_t)&v7);
  swift_beginAccess();
  sub_100008540((uint64_t)v4);
  sub_10001FA80(&v7, (uint64_t)v4);
  swift_endAccess();
  sub_100008540(a1);
  return v2;
}

uint64_t sub_10000C824()
{
  return sub_10000E428(&OBJC_IVAR____TtCO14applekeystored17AnalyticsSchemaV116ProcessAnalytics___observationRegistrar);
}

uint64_t sub_10000C830()
{
  return type metadata accessor for AnalyticsSchemaV1.ProcessAnalytics(0);
}

uint64_t type metadata accessor for AnalyticsSchemaV1.ProcessAnalytics(uint64_t a1)
{
  return sub_1000195C4(a1, qword_10007A8A0);
}

uint64_t sub_10000C858()
{
  uint64_t result = type metadata accessor for ObservationRegistrar();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_10000C908@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v4 = *a1;
  swift_getKeyPath();
  sub_100008298(&qword_10007BF80, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV1.FileAnalytics);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  swift_getKeyPath();
  sub_100008298(&qword_10007C028, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV1.FileAnalytics);
  PersistentModel.getValue<A>(forKey:)();
  uint64_t result = swift_release();
  *a2 = v4;
  return result;
}

uint64_t sub_10000CA14()
{
  return swift_release();
}

uint64_t sub_10000CAE0()
{
  swift_getKeyPath();
  sub_100008298(&qword_10007BF80, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV1.FileAnalytics);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  swift_getKeyPath();
  sub_100008298(&qword_10007C028, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV1.FileAnalytics);
  PersistentModel.getValue<A>(forKey:)();
  swift_release();
  return v0;
}

uint64_t sub_10000CBE4()
{
  return swift_release();
}

uint64_t sub_10000CC8C@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v4 = *a1;
  swift_getKeyPath();
  sub_100008298(&qword_10007BF80, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV1.FileAnalytics);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  swift_getKeyPath();
  sub_100008298(&qword_10007C028, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV1.FileAnalytics);
  PersistentModel.getValue<A>(forKey:)();
  uint64_t result = swift_release();
  *a2 = v4;
  a2[1] = v5;
  return result;
}

uint64_t sub_10000CD98()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_10000CE84()
{
  swift_getKeyPath();
  sub_100008298(&qword_10007BF80, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV1.FileAnalytics);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  swift_getKeyPath();
  sub_100008298(&qword_10007C028, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV1.FileAnalytics);
  PersistentModel.getValue<A>(forKey:)();
  swift_release();
  return v0;
}

uint64_t sub_10000CF88@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v4 = *a1;
  swift_getKeyPath();
  sub_100008298(&qword_10007BF80, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV1.FileAnalytics);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  swift_getKeyPath();
  sub_100008298(&qword_10007C028, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV1.FileAnalytics);
  PersistentModel.getValue<A>(forKey:)();
  uint64_t result = swift_release();
  *a2 = v4;
  a2[1] = v5;
  return result;
}

uint64_t sub_10000D094()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_10000D180()
{
  swift_getKeyPath();
  sub_100008298(&qword_10007BF80, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV1.FileAnalytics);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  swift_getKeyPath();
  sub_100008298(&qword_10007C028, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV1.FileAnalytics);
  PersistentModel.getValue<A>(forKey:)();
  swift_release();
  return v0;
}

uint64_t sub_10000D284@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v4 = *a1;
  swift_getKeyPath();
  sub_100008298(&qword_10007BF80, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV1.FileAnalytics);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  swift_getKeyPath();
  sub_100008298(&qword_10007C028, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV1.FileAnalytics);
  PersistentModel.getValue<A>(forKey:)();
  uint64_t result = swift_release();
  *a2 = v4;
  a2[1] = v5;
  return result;
}

uint64_t sub_10000D390()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_10000D47C()
{
  swift_getKeyPath();
  sub_100008298(&qword_10007BF80, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV1.FileAnalytics);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  swift_getKeyPath();
  sub_100008298(&qword_10007C028, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV1.FileAnalytics);
  PersistentModel.getValue<A>(forKey:)();
  swift_release();
  return v0;
}

uint64_t sub_10000D580@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v4 = *a1;
  swift_getKeyPath();
  sub_100008298(&qword_10007BF80, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV1.FileAnalytics);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  swift_getKeyPath();
  sub_100008298(&qword_10007C028, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV1.FileAnalytics);
  PersistentModel.getValue<A>(forKey:)();
  uint64_t result = swift_release();
  *a2 = v4;
  return result;
}

uint64_t sub_10000D68C()
{
  return swift_release();
}

uint64_t sub_10000D758()
{
  swift_getKeyPath();
  sub_100008298(&qword_10007BF80, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV1.FileAnalytics);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  swift_getKeyPath();
  sub_100008298(&qword_10007C028, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV1.FileAnalytics);
  PersistentModel.getValue<A>(forKey:)();
  swift_release();
  return v0;
}

uint64_t sub_10000D85C()
{
  return swift_release();
}

uint64_t sub_10000D904()
{
  return sub_10000DAEC();
}

uint64_t sub_10000D910@<X0>(_DWORD *a1@<X8>)
{
  swift_getKeyPath();
  sub_100008298(&qword_10007BF80, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV1.FileAnalytics);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  swift_getKeyPath();
  sub_100008298(&qword_10007C028, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV1.FileAnalytics);
  PersistentModel.getValue<A>(forKey:)();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_10000DA18()
{
  return swift_release();
}

uint64_t sub_10000DAE0()
{
  return sub_10000DAEC();
}

uint64_t sub_10000DAEC()
{
  swift_getKeyPath();
  sub_100008298(&qword_10007BF80, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV1.FileAnalytics);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  swift_getKeyPath();
  sub_100008298(&qword_10007C028, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV1.FileAnalytics);
  PersistentModel.getValue<A>(forKey:)();
  swift_release();
  return v1;
}

uint64_t sub_10000DBE8@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v4 = *a1;
  swift_getKeyPath();
  sub_100008298(&qword_10007BF80, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV1.FileAnalytics);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  swift_getKeyPath();
  sub_100008298(&qword_10007C028, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV1.FileAnalytics);
  PersistentModel.getValue<A>(forKey:)();
  uint64_t result = swift_release();
  *a2 = v4;
  return result;
}

uint64_t sub_10000DCF4()
{
  return swift_release();
}

uint64_t sub_10000DDC0()
{
  swift_getKeyPath();
  sub_100008298(&qword_10007BF80, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV1.FileAnalytics);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  swift_getKeyPath();
  sub_100008298(&qword_10007C028, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV1.FileAnalytics);
  PersistentModel.getValue<A>(forKey:)();
  swift_release();
  return v0;
}

uint64_t sub_10000DEC4()
{
  return swift_release();
}

uint64_t sub_10000DF6C@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v4 = *a1;
  swift_getKeyPath();
  sub_100008298(&qword_10007BF80, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV1.FileAnalytics);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  swift_getKeyPath();
  sub_100008298(&qword_10007C028, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV1.FileAnalytics);
  PersistentModel.getValue<A>(forKey:)();
  uint64_t result = swift_release();
  *a2 = v4;
  return result;
}

uint64_t sub_10000E078()
{
  return swift_release();
}

uint64_t sub_10000E144()
{
  swift_getKeyPath();
  sub_100008298(&qword_10007BF80, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV1.FileAnalytics);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  swift_getKeyPath();
  sub_100008298(&qword_10007C028, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV1.FileAnalytics);
  PersistentModel.getValue<A>(forKey:)();
  swift_release();
  return v0;
}

uint64_t sub_10000E248()
{
  return swift_release();
}

uint64_t sub_10000E2F0(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = (uint64_t *)(v1 + 16);
  uint64_t v5 = type metadata accessor for AnalyticsSchemaV1.FileAnalytics(0);
  *(void *)(v2 + 40) = sub_1000082E0(&qword_10007C030);
  *(void *)&long long v7 = v5;
  *((void *)&v7 + 1) = v5;
  uint64_t v8 = sub_100008298(&qword_10007C028, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV1.FileAnalytics);
  uint64_t v9 = v8;
  *(void *)(v2 + 48) = swift_getOpaqueTypeConformance2();
  sub_10001FA98(v4);
  static PersistentModel.createBackingData<A>()();
  ObservationRegistrar.init()();
  sub_100008234(a1, (uint64_t)&v7);
  swift_beginAccess();
  sub_100008540((uint64_t)v4);
  sub_10001FA80(&v7, (uint64_t)v4);
  swift_endAccess();
  sub_100008540(a1);
  return v2;
}

uint64_t sub_10000E41C()
{
  return sub_10000E428(&OBJC_IVAR____TtCO14applekeystored17AnalyticsSchemaV113FileAnalytics___observationRegistrar);
}

uint64_t sub_10000E428(void *a1)
{
  sub_100008540(v1 + 16);
  uint64_t v3 = v1 + *a1;
  uint64_t v4 = type metadata accessor for ObservationRegistrar();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);

  return swift_deallocClassInstance();
}

uint64_t sub_10000E4D0()
{
  return type metadata accessor for AnalyticsSchemaV1.FileAnalytics(0);
}

uint64_t type metadata accessor for AnalyticsSchemaV1.FileAnalytics(uint64_t a1)
{
  return sub_1000195C4(a1, qword_10007AA88);
}

uint64_t sub_10000E4F8()
{
  uint64_t result = type metadata accessor for ObservationRegistrar();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_10000E5B0@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v4 = *a1;
  swift_getKeyPath();
  sub_100008298(&qword_10007BF60, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV1.PipelineState);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  swift_getKeyPath();
  sub_100008298(&qword_10007C040, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV1.PipelineState);
  PersistentModel.getValue<A>(forKey:)();
  uint64_t result = swift_release();
  *a2 = v4;
  return result;
}

uint64_t sub_10000E6BC()
{
  return swift_release();
}

uint64_t sub_10000E788()
{
  swift_getKeyPath();
  sub_100008298(&qword_10007BF60, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV1.PipelineState);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  swift_getKeyPath();
  sub_100008298(&qword_10007C040, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV1.PipelineState);
  PersistentModel.getValue<A>(forKey:)();
  swift_release();
  return v0;
}

uint64_t sub_10000E88C()
{
  return swift_release();
}

uint64_t sub_10000E934@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = *a1;
  swift_getKeyPath();
  sub_100008298(&qword_10007BF60, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV1.PipelineState);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  swift_getKeyPath();
  sub_100008298(&qword_10007C040, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV1.PipelineState);
  sub_1000204E4((unint64_t *)&qword_10007C078);
  PersistentModel.getValue<A>(forKey:)();
  uint64_t result = swift_release();
  *(void *)a2 = v4;
  *(unsigned char *)(a2 + 8) = v5;
  return result;
}

uint64_t sub_10000EA70()
{
  return swift_release();
}

uint64_t sub_10000EB4C()
{
  swift_getKeyPath();
  sub_100008298(&qword_10007BF60, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV1.PipelineState);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  swift_getKeyPath();
  sub_100008298(&qword_10007C040, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV1.PipelineState);
  sub_1000204E4((unint64_t *)&qword_10007C078);
  PersistentModel.getValue<A>(forKey:)();
  swift_release();
  return v0;
}

uint64_t sub_10000EC7C()
{
  return swift_release();
}

uint64_t sub_10000EDBC(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = sub_1000082E0(&qword_10007C038);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = &v9[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_1000202DC(a1, (uint64_t)v6);
  uint64_t v12 = *a2;
  uint64_t v7 = v12;
  swift_getKeyPath();
  uint64_t v10 = v7;
  uint64_t v11 = v6;
  sub_100008298(&qword_10007BF60, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV1.PipelineState);
  ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)();
  swift_release();
  return sub_100020398((uint64_t)v6);
}

uint64_t sub_10000EEE8()
{
  return swift_release();
}

uint64_t sub_10000F028(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = (uint64_t *)(v1 + 24);
  uint64_t v5 = type metadata accessor for AnalyticsSchemaV1.PipelineState(0);
  *(void *)(v2 + 48) = sub_1000082E0(&qword_10007C080);
  *(void *)&long long v7 = v5;
  *((void *)&v7 + 1) = v5;
  uint64_t v8 = sub_100008298(&qword_10007C040, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV1.PipelineState);
  uint64_t v9 = v8;
  *(void *)(v2 + 56) = swift_getOpaqueTypeConformance2();
  sub_10001FA98(v4);
  static PersistentModel.createBackingData<A>()();
  *(_WORD *)(v2 + 16) = 257;
  ObservationRegistrar.init()();
  *(_WORD *)(v2 + 16) = 0;
  sub_100008234(a1, (uint64_t)&v7);
  swift_beginAccess();
  sub_100008540((uint64_t)v4);
  sub_10001FA80(&v7, (uint64_t)v4);
  swift_endAccess();
  sub_100008540(a1);
  return v2;
}

uint64_t sub_10000F160()
{
  return sub_100016628(&OBJC_IVAR____TtCO14applekeystored17AnalyticsSchemaV113PipelineState___observationRegistrar);
}

uint64_t sub_10000F16C()
{
  return type metadata accessor for AnalyticsSchemaV1.PipelineState(0);
}

uint64_t type metadata accessor for AnalyticsSchemaV1.PipelineState(uint64_t a1)
{
  return sub_1000195C4(a1, qword_10007AD88);
}

uint64_t sub_10000F198@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v4 = *a1;
  swift_getKeyPath();
  sub_100008298(&qword_10007BF40, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV1.AnalyticsCounters);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  swift_getKeyPath();
  sub_100008298(&qword_10007C088, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV1.AnalyticsCounters);
  PersistentModel.getValue<A>(forKey:)();
  uint64_t result = swift_release();
  *a2 = v4;
  return result;
}

uint64_t sub_10000F2A4()
{
  return swift_release();
}

uint64_t sub_10000F370()
{
  swift_getKeyPath();
  sub_100008298(&qword_10007BF40, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV1.AnalyticsCounters);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  swift_getKeyPath();
  sub_100008298(&qword_10007C088, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV1.AnalyticsCounters);
  PersistentModel.getValue<A>(forKey:)();
  swift_release();
  return v0;
}

uint64_t sub_10000F474()
{
  return swift_release();
}

uint64_t sub_10000F51C@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v4 = *a1;
  swift_getKeyPath();
  sub_100008298(&qword_10007BF40, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV1.AnalyticsCounters);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  swift_getKeyPath();
  sub_100008298(&qword_10007C088, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV1.AnalyticsCounters);
  PersistentModel.getValue<A>(forKey:)();
  uint64_t result = swift_release();
  *a2 = v4;
  return result;
}

uint64_t sub_10000F628()
{
  return swift_release();
}

uint64_t sub_10000F6F4()
{
  swift_getKeyPath();
  sub_100008298(&qword_10007BF40, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV1.AnalyticsCounters);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  swift_getKeyPath();
  sub_100008298(&qword_10007C088, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV1.AnalyticsCounters);
  PersistentModel.getValue<A>(forKey:)();
  swift_release();
  return v0;
}

uint64_t sub_10000F7F8()
{
  return swift_release();
}

uint64_t sub_10000F8A0@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v4 = *a1;
  swift_getKeyPath();
  sub_100008298(&qword_10007BF40, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV1.AnalyticsCounters);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  swift_getKeyPath();
  sub_100008298(&qword_10007C088, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV1.AnalyticsCounters);
  PersistentModel.getValue<A>(forKey:)();
  uint64_t result = swift_release();
  *a2 = v4;
  return result;
}

uint64_t sub_10000F9AC()
{
  return swift_release();
}

uint64_t sub_10000FA78()
{
  swift_getKeyPath();
  sub_100008298(&qword_10007BF40, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV1.AnalyticsCounters);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  swift_getKeyPath();
  sub_100008298(&qword_10007C088, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV1.AnalyticsCounters);
  PersistentModel.getValue<A>(forKey:)();
  swift_release();
  return v0;
}

uint64_t sub_10000FB7C()
{
  return swift_release();
}

uint64_t sub_10000FC24@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v4 = *a1;
  swift_getKeyPath();
  sub_100008298(&qword_10007BF40, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV1.AnalyticsCounters);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  swift_getKeyPath();
  sub_100008298(&qword_10007C088, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV1.AnalyticsCounters);
  PersistentModel.getValue<A>(forKey:)();
  uint64_t result = swift_release();
  *a2 = v4;
  return result;
}

uint64_t sub_10000FD30()
{
  return swift_release();
}

uint64_t sub_10000FDFC()
{
  swift_getKeyPath();
  sub_100008298(&qword_10007BF40, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV1.AnalyticsCounters);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  swift_getKeyPath();
  sub_100008298(&qword_10007C088, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV1.AnalyticsCounters);
  PersistentModel.getValue<A>(forKey:)();
  swift_release();
  return v0;
}

uint64_t sub_10000FF00()
{
  return swift_release();
}

uint64_t sub_10000FFA8@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v4 = *a1;
  swift_getKeyPath();
  sub_100008298(&qword_10007BF40, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV1.AnalyticsCounters);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  swift_getKeyPath();
  sub_100008298(&qword_10007C088, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV1.AnalyticsCounters);
  PersistentModel.getValue<A>(forKey:)();
  uint64_t result = swift_release();
  *a2 = v4;
  return result;
}

uint64_t sub_1000100B4()
{
  return swift_release();
}

uint64_t sub_100010180()
{
  swift_getKeyPath();
  sub_100008298(&qword_10007BF40, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV1.AnalyticsCounters);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  swift_getKeyPath();
  sub_100008298(&qword_10007C088, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV1.AnalyticsCounters);
  PersistentModel.getValue<A>(forKey:)();
  swift_release();
  return v0;
}

uint64_t sub_100010284()
{
  return swift_release();
}

uint64_t sub_10001032C@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v4 = *a1;
  swift_getKeyPath();
  sub_100008298(&qword_10007BF40, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV1.AnalyticsCounters);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  swift_getKeyPath();
  sub_100008298(&qword_10007C088, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV1.AnalyticsCounters);
  PersistentModel.getValue<A>(forKey:)();
  uint64_t result = swift_release();
  *a2 = v4;
  return result;
}

uint64_t sub_100010438()
{
  return swift_release();
}

uint64_t sub_100010504()
{
  swift_getKeyPath();
  sub_100008298(&qword_10007BF40, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV1.AnalyticsCounters);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  swift_getKeyPath();
  sub_100008298(&qword_10007C088, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV1.AnalyticsCounters);
  PersistentModel.getValue<A>(forKey:)();
  swift_release();
  return v0;
}

uint64_t sub_100010608()
{
  return swift_release();
}

uint64_t sub_1000106B0@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v4 = *a1;
  swift_getKeyPath();
  sub_100008298(&qword_10007BF40, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV1.AnalyticsCounters);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  swift_getKeyPath();
  sub_100008298(&qword_10007C088, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV1.AnalyticsCounters);
  PersistentModel.getValue<A>(forKey:)();
  uint64_t result = swift_release();
  *a2 = v4;
  return result;
}

uint64_t sub_1000107BC()
{
  return swift_release();
}

uint64_t sub_100010888()
{
  swift_getKeyPath();
  sub_100008298(&qword_10007BF40, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV1.AnalyticsCounters);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  swift_getKeyPath();
  sub_100008298(&qword_10007C088, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV1.AnalyticsCounters);
  PersistentModel.getValue<A>(forKey:)();
  swift_release();
  return v0;
}

uint64_t sub_10001098C()
{
  return swift_release();
}

uint64_t sub_100010A34@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v4 = *a1;
  swift_getKeyPath();
  sub_100008298(&qword_10007BF40, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV1.AnalyticsCounters);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  swift_getKeyPath();
  sub_100008298(&qword_10007C088, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV1.AnalyticsCounters);
  PersistentModel.getValue<A>(forKey:)();
  uint64_t result = swift_release();
  *a2 = v4;
  return result;
}

uint64_t sub_100010B40()
{
  return swift_release();
}

uint64_t sub_100010C0C()
{
  swift_getKeyPath();
  sub_100008298(&qword_10007BF40, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV1.AnalyticsCounters);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  swift_getKeyPath();
  sub_100008298(&qword_10007C088, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV1.AnalyticsCounters);
  PersistentModel.getValue<A>(forKey:)();
  swift_release();
  return v0;
}

uint64_t sub_100010D10()
{
  return swift_release();
}

uint64_t sub_100010DB8@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v4 = *a1;
  swift_getKeyPath();
  sub_100008298(&qword_10007BF40, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV1.AnalyticsCounters);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  swift_getKeyPath();
  sub_100008298(&qword_10007C088, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV1.AnalyticsCounters);
  PersistentModel.getValue<A>(forKey:)();
  uint64_t result = swift_release();
  *a2 = v4;
  return result;
}

uint64_t sub_100010EC4()
{
  return swift_release();
}

uint64_t sub_100010F90()
{
  swift_getKeyPath();
  sub_100008298(&qword_10007BF40, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV1.AnalyticsCounters);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  swift_getKeyPath();
  sub_100008298(&qword_10007C088, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV1.AnalyticsCounters);
  PersistentModel.getValue<A>(forKey:)();
  swift_release();
  return v0;
}

uint64_t sub_100011094()
{
  return swift_release();
}

uint64_t sub_10001113C@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v4 = *a1;
  swift_getKeyPath();
  sub_100008298(&qword_10007BF40, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV1.AnalyticsCounters);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  swift_getKeyPath();
  sub_100008298(&qword_10007C088, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV1.AnalyticsCounters);
  PersistentModel.getValue<A>(forKey:)();
  uint64_t result = swift_release();
  *a2 = v4;
  return result;
}

uint64_t sub_100011248()
{
  return swift_release();
}

uint64_t sub_100011314()
{
  swift_getKeyPath();
  sub_100008298(&qword_10007BF40, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV1.AnalyticsCounters);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  swift_getKeyPath();
  sub_100008298(&qword_10007C088, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV1.AnalyticsCounters);
  PersistentModel.getValue<A>(forKey:)();
  swift_release();
  return v0;
}

uint64_t sub_100011418()
{
  return swift_release();
}

uint64_t sub_1000114C0@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v4 = *a1;
  swift_getKeyPath();
  sub_100008298(&qword_10007BF40, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV1.AnalyticsCounters);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  swift_getKeyPath();
  sub_100008298(&qword_10007C088, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV1.AnalyticsCounters);
  PersistentModel.getValue<A>(forKey:)();
  uint64_t result = swift_release();
  *a2 = v4;
  return result;
}

uint64_t sub_1000115CC()
{
  return swift_release();
}

uint64_t sub_100011698()
{
  swift_getKeyPath();
  sub_100008298(&qword_10007BF40, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV1.AnalyticsCounters);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  swift_getKeyPath();
  sub_100008298(&qword_10007C088, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV1.AnalyticsCounters);
  PersistentModel.getValue<A>(forKey:)();
  swift_release();
  return v0;
}

uint64_t sub_10001179C()
{
  return swift_release();
}

uint64_t sub_100011844(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = (uint64_t *)(v1 + 16);
  uint64_t v5 = type metadata accessor for AnalyticsSchemaV1.AnalyticsCounters(0);
  *(void *)(v2 + 40) = sub_1000082E0(&qword_10007C090);
  *(void *)&long long v7 = v5;
  *((void *)&v7 + 1) = v5;
  uint64_t v8 = sub_100008298(&qword_10007C088, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV1.AnalyticsCounters);
  uint64_t v9 = v8;
  *(void *)(v2 + 48) = swift_getOpaqueTypeConformance2();
  sub_10001FA98(v4);
  static PersistentModel.createBackingData<A>()();
  sub_100008234((uint64_t)v4, (uint64_t)&v7);
  sub_10000B090(&v7, v9);
  swift_getKeyPath();
  dispatch thunk of BackingData.setValue<A>(forKey:to:)();
  swift_release();
  sub_100008540((uint64_t)&v7);
  sub_100008234((uint64_t)v4, (uint64_t)&v7);
  sub_10000B090(&v7, v9);
  swift_getKeyPath();
  dispatch thunk of BackingData.setValue<A>(forKey:to:)();
  swift_release();
  sub_100008540((uint64_t)&v7);
  sub_100008234((uint64_t)v4, (uint64_t)&v7);
  sub_10000B090(&v7, v9);
  swift_getKeyPath();
  dispatch thunk of BackingData.setValue<A>(forKey:to:)();
  swift_release();
  sub_100008540((uint64_t)&v7);
  sub_100008234((uint64_t)v4, (uint64_t)&v7);
  sub_10000B090(&v7, v9);
  swift_getKeyPath();
  dispatch thunk of BackingData.setValue<A>(forKey:to:)();
  swift_release();
  sub_100008540((uint64_t)&v7);
  sub_100008234((uint64_t)v4, (uint64_t)&v7);
  sub_10000B090(&v7, v9);
  swift_getKeyPath();
  dispatch thunk of BackingData.setValue<A>(forKey:to:)();
  swift_release();
  sub_100008540((uint64_t)&v7);
  sub_100008234((uint64_t)v4, (uint64_t)&v7);
  sub_10000B090(&v7, v9);
  swift_getKeyPath();
  dispatch thunk of BackingData.setValue<A>(forKey:to:)();
  swift_release();
  sub_100008540((uint64_t)&v7);
  sub_100008234((uint64_t)v4, (uint64_t)&v7);
  sub_10000B090(&v7, v9);
  swift_getKeyPath();
  dispatch thunk of BackingData.setValue<A>(forKey:to:)();
  swift_release();
  sub_100008540((uint64_t)&v7);
  sub_100008234((uint64_t)v4, (uint64_t)&v7);
  sub_10000B090(&v7, v9);
  swift_getKeyPath();
  dispatch thunk of BackingData.setValue<A>(forKey:to:)();
  swift_release();
  sub_100008540((uint64_t)&v7);
  sub_100008234((uint64_t)v4, (uint64_t)&v7);
  sub_10000B090(&v7, v9);
  swift_getKeyPath();
  dispatch thunk of BackingData.setValue<A>(forKey:to:)();
  swift_release();
  sub_100008540((uint64_t)&v7);
  sub_100008234((uint64_t)v4, (uint64_t)&v7);
  sub_10000B090(&v7, v9);
  swift_getKeyPath();
  dispatch thunk of BackingData.setValue<A>(forKey:to:)();
  swift_release();
  sub_100008540((uint64_t)&v7);
  sub_100008234((uint64_t)v4, (uint64_t)&v7);
  sub_10000B090(&v7, v9);
  swift_getKeyPath();
  dispatch thunk of BackingData.setValue<A>(forKey:to:)();
  swift_release();
  sub_100008540((uint64_t)&v7);
  ObservationRegistrar.init()();
  sub_100008234(a1, (uint64_t)&v7);
  swift_beginAccess();
  sub_100008540((uint64_t)v4);
  sub_10001FA80(&v7, (uint64_t)v4);
  swift_endAccess();
  sub_100008540(a1);
  return v2;
}

uint64_t sub_100011D84()
{
  return sub_10000E428(&OBJC_IVAR____TtCO14applekeystored17AnalyticsSchemaV117AnalyticsCounters___observationRegistrar);
}

uint64_t sub_100011D90()
{
  return type metadata accessor for AnalyticsSchemaV1.AnalyticsCounters(0);
}

uint64_t type metadata accessor for AnalyticsSchemaV1.AnalyticsCounters(uint64_t a1)
{
  return sub_1000195C4(a1, qword_10007AF38);
}

uint64_t sub_100011DB8()
{
  uint64_t result = type metadata accessor for ObservationRegistrar();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_100011E78@<X0>(uint64_t a1@<X8>)
{
  return sub_1000196E4(&qword_10007A5A8, (uint64_t)qword_10007DA98, a1);
}

uint64_t sub_100011E9C(uint64_t a1)
{
  return sub_100011EAC(a1, qword_10007DAB0);
}

uint64_t sub_100011EAC(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = type metadata accessor for Schema.Version();
  sub_10000AFD4(v3, a2);
  sub_10000AF48(v3, (uint64_t)a2);
  return Schema.Version.init(_:_:_:)();
}

uint64_t sub_100011F0C@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v4 = *a1;
  swift_getKeyPath();
  sub_100008298(&qword_10007BF20, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV2.ProcessAnalytics);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  swift_getKeyPath();
  sub_100008298(&qword_10007BFC8, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV2.ProcessAnalytics);
  PersistentModel.getValue<A>(forKey:)();
  uint64_t result = swift_release();
  *a2 = v4;
  a2[1] = v5;
  return result;
}

uint64_t sub_100012018()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_100012104()
{
  swift_getKeyPath();
  sub_100008298(&qword_10007BF20, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV2.ProcessAnalytics);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  swift_getKeyPath();
  sub_100008298(&qword_10007BFC8, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV2.ProcessAnalytics);
  PersistentModel.getValue<A>(forKey:)();
  swift_release();
  return v0;
}

uint64_t sub_100012208@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v4 = *a1;
  swift_getKeyPath();
  sub_100008298(&qword_10007BF20, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV2.ProcessAnalytics);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  swift_getKeyPath();
  sub_100008298(&qword_10007BFC8, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV2.ProcessAnalytics);
  PersistentModel.getValue<A>(forKey:)();
  uint64_t result = swift_release();
  *a2 = v4;
  a2[1] = v5;
  return result;
}

uint64_t sub_100012314()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_100012400()
{
  swift_getKeyPath();
  sub_100008298(&qword_10007BF20, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV2.ProcessAnalytics);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  swift_getKeyPath();
  sub_100008298(&qword_10007BFC8, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV2.ProcessAnalytics);
  PersistentModel.getValue<A>(forKey:)();
  swift_release();
  return v0;
}

uint64_t sub_100012504@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v4 = *a1;
  swift_getKeyPath();
  sub_100008298(&qword_10007BF20, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV2.ProcessAnalytics);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  swift_getKeyPath();
  sub_100008298(&qword_10007BFC8, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV2.ProcessAnalytics);
  PersistentModel.getValue<A>(forKey:)();
  uint64_t result = swift_release();
  *a2 = v4;
  a2[1] = v5;
  return result;
}

uint64_t sub_100012610()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_1000126FC()
{
  swift_getKeyPath();
  sub_100008298(&qword_10007BF20, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV2.ProcessAnalytics);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  swift_getKeyPath();
  sub_100008298(&qword_10007BFC8, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV2.ProcessAnalytics);
  PersistentModel.getValue<A>(forKey:)();
  swift_release();
  return v0;
}

uint64_t sub_100012800@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v4 = *a1;
  swift_getKeyPath();
  sub_100008298(&qword_10007BF20, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV2.ProcessAnalytics);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  swift_getKeyPath();
  sub_100008298(&qword_10007BFC8, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV2.ProcessAnalytics);
  PersistentModel.getValue<A>(forKey:)();
  uint64_t result = swift_release();
  *a2 = v4;
  return result;
}

uint64_t sub_10001290C()
{
  return swift_release();
}

uint64_t sub_1000129D8()
{
  swift_getKeyPath();
  sub_100008298(&qword_10007BF20, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV2.ProcessAnalytics);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  swift_getKeyPath();
  sub_100008298(&qword_10007BFC8, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV2.ProcessAnalytics);
  PersistentModel.getValue<A>(forKey:)();
  swift_release();
  return v0;
}

uint64_t sub_100012ADC()
{
  return swift_release();
}

uint64_t sub_100012B84@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v4 = *a1;
  swift_getKeyPath();
  sub_100008298(&qword_10007BF20, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV2.ProcessAnalytics);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  swift_getKeyPath();
  sub_100008298(&qword_10007BFC8, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV2.ProcessAnalytics);
  PersistentModel.getValue<A>(forKey:)();
  uint64_t result = swift_release();
  *a2 = v4;
  return result;
}

uint64_t sub_100012C90()
{
  return swift_release();
}

uint64_t sub_100012D5C()
{
  swift_getKeyPath();
  sub_100008298(&qword_10007BF20, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV2.ProcessAnalytics);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  swift_getKeyPath();
  sub_100008298(&qword_10007BFC8, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV2.ProcessAnalytics);
  PersistentModel.getValue<A>(forKey:)();
  swift_release();
  return v0;
}

uint64_t sub_100012E60()
{
  return swift_release();
}

uint64_t sub_100012F08(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = v4;
  long long v7 = (uint64_t *)(v4 + 16);
  uint64_t v8 = type metadata accessor for AnalyticsSchemaV2.ProcessAnalytics(0);
  *(void *)(v5 + 40) = sub_1000082E0(&qword_10007C098);
  v10[0] = v8;
  v10[1] = v8;
  uint64_t v11 = sub_100008298(&qword_10007BFC8, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV2.ProcessAnalytics);
  uint64_t v12 = v11;
  *(void *)(v5 + 48) = swift_getOpaqueTypeConformance2();
  sub_10001FA98(v7);
  static PersistentModel.createBackingData<A>()();
  ObservationRegistrar.init()();
  sub_100008234((uint64_t)v7, (uint64_t)v10);
  sub_10000B090(v10, v12);
  swift_getKeyPath();
  dispatch thunk of BackingData.setValue<A>(forKey:to:)();
  swift_bridgeObjectRelease();
  swift_release();
  sub_100008540((uint64_t)v10);
  sub_100008234((uint64_t)v7, (uint64_t)v10);
  sub_10000B090(v10, v12);
  swift_getKeyPath();
  dispatch thunk of BackingData.setValue<A>(forKey:to:)();
  swift_bridgeObjectRelease();
  swift_release();
  sub_100008540((uint64_t)v10);
  sub_10004CCB8(a4);
  sub_100008234((uint64_t)v7, (uint64_t)v10);
  sub_10000B090(v10, v12);
  swift_getKeyPath();
  dispatch thunk of BackingData.setValue<A>(forKey:to:)();
  swift_bridgeObjectRelease();
  swift_release();
  sub_100008540((uint64_t)v10);
  sub_100008234((uint64_t)v7, (uint64_t)v10);
  sub_10000B090(v10, v12);
  swift_getKeyPath();
  dispatch thunk of BackingData.setValue<A>(forKey:to:)();
  swift_release();
  sub_100008540((uint64_t)v10);
  sub_100008234((uint64_t)v7, (uint64_t)v10);
  sub_10000B090(v10, v12);
  swift_getKeyPath();
  dispatch thunk of BackingData.setValue<A>(forKey:to:)();
  swift_release();
  sub_100008540((uint64_t)v10);
  return v5;
}

uint64_t sub_1000132D4(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = (uint64_t *)(v1 + 16);
  uint64_t v5 = type metadata accessor for AnalyticsSchemaV2.ProcessAnalytics(0);
  *(void *)(v2 + 40) = sub_1000082E0(&qword_10007C098);
  *(void *)&long long v7 = v5;
  *((void *)&v7 + 1) = v5;
  uint64_t v8 = sub_100008298(&qword_10007BFC8, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV2.ProcessAnalytics);
  uint64_t v9 = v8;
  *(void *)(v2 + 48) = swift_getOpaqueTypeConformance2();
  sub_10001FA98(v4);
  static PersistentModel.createBackingData<A>()();
  ObservationRegistrar.init()();
  sub_100008234(a1, (uint64_t)&v7);
  swift_beginAccess();
  sub_100008540((uint64_t)v4);
  sub_10001FA80(&v7, (uint64_t)v4);
  swift_endAccess();
  sub_100008540(a1);
  return v2;
}

uint64_t sub_100013400()
{
  return sub_10000E428(&OBJC_IVAR____TtCO14applekeystored17AnalyticsSchemaV216ProcessAnalytics___observationRegistrar);
}

uint64_t sub_10001340C()
{
  return type metadata accessor for AnalyticsSchemaV2.ProcessAnalytics(0);
}

uint64_t type metadata accessor for AnalyticsSchemaV2.ProcessAnalytics(uint64_t a1)
{
  return sub_1000195C4(a1, qword_10007B2A8);
}

uint64_t sub_100013434()
{
  uint64_t result = type metadata accessor for ObservationRegistrar();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_1000134E4@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v4 = *a1;
  swift_getKeyPath();
  sub_100008298(&qword_10007BF00, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV2.FileAnalytics);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  swift_getKeyPath();
  sub_100008298(&qword_10007BFD0, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV2.FileAnalytics);
  PersistentModel.getValue<A>(forKey:)();
  uint64_t result = swift_release();
  *a2 = v4;
  return result;
}

uint64_t sub_1000135F0()
{
  return swift_release();
}

uint64_t sub_1000136BC()
{
  swift_getKeyPath();
  sub_100008298(&qword_10007BF00, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV2.FileAnalytics);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  swift_getKeyPath();
  sub_100008298(&qword_10007BFD0, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV2.FileAnalytics);
  PersistentModel.getValue<A>(forKey:)();
  swift_release();
  return v0;
}

uint64_t sub_1000137C0()
{
  return swift_release();
}

uint64_t sub_100013868@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v4 = *a1;
  swift_getKeyPath();
  sub_100008298(&qword_10007BF00, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV2.FileAnalytics);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  swift_getKeyPath();
  sub_100008298(&qword_10007BFD0, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV2.FileAnalytics);
  PersistentModel.getValue<A>(forKey:)();
  uint64_t result = swift_release();
  *a2 = v4;
  a2[1] = v5;
  return result;
}

uint64_t sub_100013974()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_100013A60()
{
  swift_getKeyPath();
  sub_100008298(&qword_10007BF00, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV2.FileAnalytics);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  swift_getKeyPath();
  sub_100008298(&qword_10007BFD0, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV2.FileAnalytics);
  PersistentModel.getValue<A>(forKey:)();
  swift_release();
  return v0;
}

uint64_t sub_100013B64@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v4 = *a1;
  swift_getKeyPath();
  sub_100008298(&qword_10007BF00, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV2.FileAnalytics);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  swift_getKeyPath();
  sub_100008298(&qword_10007BFD0, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV2.FileAnalytics);
  PersistentModel.getValue<A>(forKey:)();
  uint64_t result = swift_release();
  *a2 = v4;
  a2[1] = v5;
  return result;
}

uint64_t sub_100013C70()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_100013D5C()
{
  swift_getKeyPath();
  sub_100008298(&qword_10007BF00, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV2.FileAnalytics);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  swift_getKeyPath();
  sub_100008298(&qword_10007BFD0, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV2.FileAnalytics);
  PersistentModel.getValue<A>(forKey:)();
  swift_release();
  return v0;
}

uint64_t sub_100013E60@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v4 = *a1;
  swift_getKeyPath();
  sub_100008298(&qword_10007BF00, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV2.FileAnalytics);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  swift_getKeyPath();
  sub_100008298(&qword_10007BFD0, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV2.FileAnalytics);
  PersistentModel.getValue<A>(forKey:)();
  uint64_t result = swift_release();
  *a2 = v4;
  a2[1] = v5;
  return result;
}

uint64_t sub_100013F6C()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_100014058()
{
  swift_getKeyPath();
  sub_100008298(&qword_10007BF00, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV2.FileAnalytics);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  swift_getKeyPath();
  sub_100008298(&qword_10007BFD0, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV2.FileAnalytics);
  PersistentModel.getValue<A>(forKey:)();
  swift_release();
  return v0;
}

uint64_t sub_10001415C@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v4 = *a1;
  swift_getKeyPath();
  sub_100008298(&qword_10007BF00, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV2.FileAnalytics);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  swift_getKeyPath();
  sub_100008298(&qword_10007BFD0, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV2.FileAnalytics);
  PersistentModel.getValue<A>(forKey:)();
  uint64_t result = swift_release();
  *a2 = v4;
  a2[1] = v5;
  return result;
}

uint64_t sub_100014268()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_100014354()
{
  swift_getKeyPath();
  sub_100008298(&qword_10007BF00, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV2.FileAnalytics);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  swift_getKeyPath();
  sub_100008298(&qword_10007BFD0, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV2.FileAnalytics);
  PersistentModel.getValue<A>(forKey:)();
  swift_release();
  return v0;
}

uint64_t sub_100014458(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t *a5, void (*a6)(uint64_t))
{
  return swift_release();
}

uint64_t sub_1000144F8@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v4 = *a1;
  swift_getKeyPath();
  sub_100008298(&qword_10007BF00, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV2.FileAnalytics);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  swift_getKeyPath();
  sub_100008298(&qword_10007BFD0, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV2.FileAnalytics);
  PersistentModel.getValue<A>(forKey:)();
  uint64_t result = swift_release();
  *a2 = v4;
  return result;
}

uint64_t sub_100014604()
{
  return swift_release();
}

uint64_t sub_1000146D0()
{
  swift_getKeyPath();
  sub_100008298(&qword_10007BF00, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV2.FileAnalytics);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  swift_getKeyPath();
  sub_100008298(&qword_10007BFD0, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV2.FileAnalytics);
  PersistentModel.getValue<A>(forKey:)();
  swift_release();
  return v0;
}

uint64_t sub_1000147D4()
{
  return swift_release();
}

uint64_t sub_10001487C@<X0>(_DWORD *a1@<X8>)
{
  return sub_100014888(a1);
}

uint64_t sub_100014888@<X0>(_DWORD *a1@<X8>)
{
  swift_getKeyPath();
  sub_100008298(&qword_10007BF00, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV2.FileAnalytics);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  swift_getKeyPath();
  sub_100008298(&qword_10007BFD0, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV2.FileAnalytics);
  PersistentModel.getValue<A>(forKey:)();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_100014990()
{
  return sub_1000149B0();
}

uint64_t sub_1000149B0()
{
  return swift_release();
}

uint64_t sub_100014A78()
{
  return sub_100014A84();
}

uint64_t sub_100014A84()
{
  swift_getKeyPath();
  sub_100008298(&qword_10007BF00, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV2.FileAnalytics);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  swift_getKeyPath();
  sub_100008298(&qword_10007BFD0, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV2.FileAnalytics);
  PersistentModel.getValue<A>(forKey:)();
  swift_release();
  return v1;
}

uint64_t sub_100014B80@<X0>(_DWORD *a1@<X8>)
{
  return sub_100014888(a1);
}

uint64_t sub_100014B8C()
{
  return sub_1000149B0();
}

uint64_t sub_100014BAC()
{
  return sub_100014A84();
}

uint64_t sub_100014BB8(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t *a4, void (*a5)(uint64_t))
{
  return swift_release();
}

uint64_t sub_100014C4C@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v4 = *a1;
  swift_getKeyPath();
  sub_100008298(&qword_10007BF00, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV2.FileAnalytics);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  swift_getKeyPath();
  sub_100008298(&qword_10007BFD0, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV2.FileAnalytics);
  PersistentModel.getValue<A>(forKey:)();
  uint64_t result = swift_release();
  *a2 = v4;
  return result;
}

uint64_t sub_100014D58()
{
  return swift_release();
}

uint64_t sub_100014E24()
{
  swift_getKeyPath();
  sub_100008298(&qword_10007BF00, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV2.FileAnalytics);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  swift_getKeyPath();
  sub_100008298(&qword_10007BFD0, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV2.FileAnalytics);
  PersistentModel.getValue<A>(forKey:)();
  swift_release();
  return v0;
}

uint64_t sub_100014F28()
{
  return swift_release();
}

uint64_t sub_100014FD0@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v4 = *a1;
  swift_getKeyPath();
  sub_100008298(&qword_10007BF00, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV2.FileAnalytics);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  swift_getKeyPath();
  sub_100008298(&qword_10007BFD0, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV2.FileAnalytics);
  PersistentModel.getValue<A>(forKey:)();
  uint64_t result = swift_release();
  *a2 = v4;
  return result;
}

uint64_t sub_1000150DC()
{
  return swift_release();
}

uint64_t sub_1000151A8()
{
  swift_getKeyPath();
  sub_100008298(&qword_10007BF00, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV2.FileAnalytics);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  swift_getKeyPath();
  sub_100008298(&qword_10007BFD0, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV2.FileAnalytics);
  PersistentModel.getValue<A>(forKey:)();
  swift_release();
  return v0;
}

uint64_t sub_1000152AC()
{
  return swift_release();
}

uint64_t sub_100015354(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = (uint64_t *)(v1 + 16);
  uint64_t v5 = type metadata accessor for AnalyticsSchemaV2.FileAnalytics(0);
  *(void *)(v2 + 40) = sub_1000082E0(&qword_10007C0A0);
  *(void *)&long long v7 = v5;
  *((void *)&v7 + 1) = v5;
  uint64_t v8 = sub_100008298(&qword_10007BFD0, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV2.FileAnalytics);
  uint64_t v9 = v8;
  *(void *)(v2 + 48) = swift_getOpaqueTypeConformance2();
  sub_10001FA98(v4);
  static PersistentModel.createBackingData<A>()();
  ObservationRegistrar.init()();
  sub_100008234(a1, (uint64_t)&v7);
  swift_beginAccess();
  sub_100008540((uint64_t)v4);
  sub_10001FA80(&v7, (uint64_t)v4);
  swift_endAccess();
  sub_100008540(a1);
  return v2;
}

uint64_t sub_100015480()
{
  return sub_10000E428(&OBJC_IVAR____TtCO14applekeystored17AnalyticsSchemaV213FileAnalytics___observationRegistrar);
}

uint64_t sub_10001548C()
{
  return type metadata accessor for AnalyticsSchemaV2.FileAnalytics(0);
}

uint64_t type metadata accessor for AnalyticsSchemaV2.FileAnalytics(uint64_t a1)
{
  return sub_1000195C4(a1, qword_10007B4C8);
}

uint64_t sub_1000154B4()
{
  uint64_t result = type metadata accessor for ObservationRegistrar();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_100015570@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v4 = *a1;
  swift_getKeyPath();
  sub_100008298(&qword_10007BEE0, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV2.PipelineState);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  swift_getKeyPath();
  sub_100008298(&qword_10007BFD8, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV2.PipelineState);
  PersistentModel.getValue<A>(forKey:)();
  uint64_t result = swift_release();
  *a2 = v4;
  return result;
}

uint64_t sub_10001567C()
{
  return swift_release();
}

uint64_t sub_100015748()
{
  swift_getKeyPath();
  sub_100008298(&qword_10007BEE0, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV2.PipelineState);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  swift_getKeyPath();
  sub_100008298(&qword_10007BFD8, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV2.PipelineState);
  PersistentModel.getValue<A>(forKey:)();
  swift_release();
  return v0;
}

uint64_t sub_10001584C()
{
  return swift_release();
}

uint64_t sub_1000158F4@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = *a1;
  swift_getKeyPath();
  sub_100008298(&qword_10007BEE0, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV2.PipelineState);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  swift_getKeyPath();
  sub_100008298(&qword_10007BFD8, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV2.PipelineState);
  sub_1000204E4((unint64_t *)&qword_10007C078);
  PersistentModel.getValue<A>(forKey:)();
  uint64_t result = swift_release();
  *(void *)a2 = v4;
  *(unsigned char *)(a2 + 8) = v5;
  return result;
}

uint64_t sub_100015A30()
{
  return swift_release();
}

uint64_t sub_100015B0C()
{
  swift_getKeyPath();
  sub_100008298(&qword_10007BEE0, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV2.PipelineState);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  swift_getKeyPath();
  sub_100008298(&qword_10007BFD8, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV2.PipelineState);
  sub_1000204E4((unint64_t *)&qword_10007C078);
  PersistentModel.getValue<A>(forKey:)();
  swift_release();
  return v0;
}

uint64_t sub_100015C3C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100015C8C(a1, a2, a3, (uint64_t)&unk_100057DD0, &qword_10007BFD8, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV2.PipelineState);
}

uint64_t sub_100015C8C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t *a5, void (*a6)(uint64_t))
{
  return swift_release();
}

uint64_t sub_100015D5C()
{
  return swift_release();
}

uint64_t sub_100015E9C(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = sub_1000082E0(&qword_10007C038);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = &v9[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_1000202DC(a1, (uint64_t)v6);
  uint64_t v12 = *a2;
  uint64_t v7 = v12;
  swift_getKeyPath();
  uint64_t v10 = v7;
  uint64_t v11 = v6;
  sub_100008298(&qword_10007BEE0, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV2.PipelineState);
  ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)();
  swift_release();
  return sub_100020398((uint64_t)v6);
}

uint64_t sub_100015FC8()
{
  return swift_release();
}

uint64_t sub_100016108(uint64_t a1, uint64_t a2)
{
  return sub_100016158(a1, a2, (uint64_t)&unk_100057DF8, &qword_10007BFD8, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV2.PipelineState);
}

uint64_t sub_100016158(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t *a4, void (*a5)(uint64_t))
{
  return swift_release();
}

uint64_t sub_100016224(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = v4;
  int v16 = a3;
  uint64_t v15 = a2;
  uint64_t v8 = sub_1000082E0(&qword_10007C038);
  __chkstk_darwin(v8 - 8);
  uint64_t v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = (uint64_t *)(v4 + 24);
  uint64_t v12 = type metadata accessor for AnalyticsSchemaV2.PipelineState(0);
  *(void *)(v5 + 48) = sub_1000082E0(&qword_10007C0A8);
  uint64_t v13 = sub_100008298(&qword_10007BFD8, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV2.PipelineState);
  v23[0] = v12;
  v23[1] = v12;
  v23[2] = v13;
  uint64_t v24 = v13;
  *(void *)(v5 + 56) = swift_getOpaqueTypeConformance2();
  sub_10001FA98(v11);
  static PersistentModel.createBackingData<A>()();
  *(_WORD *)(v5 + 16) = 257;
  ObservationRegistrar.init()();
  sub_100008234((uint64_t)v11, (uint64_t)v23);
  sub_10000B090(v23, v24);
  swift_getKeyPath();
  uint64_t v22 = a1;
  dispatch thunk of BackingData.setValue<A>(forKey:to:)();
  swift_release();
  sub_100008540((uint64_t)v23);
  v23[0] = v5;
  swift_getKeyPath();
  uint64_t v19 = v5;
  uint64_t v20 = v15;
  char v21 = v16 & 1;
  sub_100008298(&qword_10007BEE0, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV2.PipelineState);
  ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)();
  swift_release();
  sub_1000202DC(a4, (uint64_t)v10);
  v23[0] = v5;
  swift_getKeyPath();
  uint64_t v17 = v5;
  char v18 = v10;
  ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)();
  swift_release();
  sub_100020398((uint64_t)v10);
  sub_100020398(a4);
  return v5;
}

uint64_t sub_1000164E4(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = (uint64_t *)(v1 + 24);
  uint64_t v5 = type metadata accessor for AnalyticsSchemaV2.PipelineState(0);
  *(void *)(v2 + 48) = sub_1000082E0(&qword_10007C0A8);
  *(void *)&long long v7 = v5;
  *((void *)&v7 + 1) = v5;
  uint64_t v8 = sub_100008298(&qword_10007BFD8, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV2.PipelineState);
  uint64_t v9 = v8;
  *(void *)(v2 + 56) = swift_getOpaqueTypeConformance2();
  sub_10001FA98(v4);
  static PersistentModel.createBackingData<A>()();
  *(_WORD *)(v2 + 16) = 257;
  ObservationRegistrar.init()();
  *(_WORD *)(v2 + 16) = 0;
  sub_100008234(a1, (uint64_t)&v7);
  swift_beginAccess();
  sub_100008540((uint64_t)v4);
  sub_10001FA80(&v7, (uint64_t)v4);
  swift_endAccess();
  sub_100008540(a1);
  return v2;
}

uint64_t sub_10001661C()
{
  return sub_100016628(&OBJC_IVAR____TtCO14applekeystored17AnalyticsSchemaV213PipelineState___observationRegistrar);
}

uint64_t sub_100016628(void *a1)
{
  sub_100008540(v1 + 24);
  uint64_t v3 = v1 + *a1;
  uint64_t v4 = type metadata accessor for ObservationRegistrar();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);

  return swift_deallocClassInstance();
}

uint64_t sub_1000166D0()
{
  return type metadata accessor for AnalyticsSchemaV2.PipelineState(0);
}

uint64_t type metadata accessor for AnalyticsSchemaV2.PipelineState(uint64_t a1)
{
  return sub_1000195C4(a1, qword_10007B800);
}

uint64_t sub_1000166F8()
{
  uint64_t result = type metadata accessor for ObservationRegistrar();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_1000167B0@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v4 = *a1;
  swift_getKeyPath();
  sub_100008298(&qword_10007BEC0, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV2.AnalyticsCounters);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  swift_getKeyPath();
  sub_100008298(&qword_10007BFE0, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV2.AnalyticsCounters);
  PersistentModel.getValue<A>(forKey:)();
  uint64_t result = swift_release();
  *a2 = v4;
  return result;
}

uint64_t sub_1000168BC()
{
  return swift_release();
}

uint64_t sub_100016988()
{
  swift_getKeyPath();
  sub_100008298(&qword_10007BEC0, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV2.AnalyticsCounters);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  swift_getKeyPath();
  sub_100008298(&qword_10007BFE0, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV2.AnalyticsCounters);
  PersistentModel.getValue<A>(forKey:)();
  swift_release();
  return v0;
}

uint64_t sub_100016A8C@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v4 = *a1;
  swift_getKeyPath();
  sub_100008298(&qword_10007BEC0, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV2.AnalyticsCounters);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  swift_getKeyPath();
  sub_100008298(&qword_10007BFE0, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV2.AnalyticsCounters);
  PersistentModel.getValue<A>(forKey:)();
  uint64_t result = swift_release();
  *a2 = v4;
  return result;
}

uint64_t sub_100016B98()
{
  return swift_release();
}

uint64_t sub_100016C64()
{
  swift_getKeyPath();
  sub_100008298(&qword_10007BEC0, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV2.AnalyticsCounters);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  swift_getKeyPath();
  sub_100008298(&qword_10007BFE0, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV2.AnalyticsCounters);
  PersistentModel.getValue<A>(forKey:)();
  swift_release();
  return v0;
}

uint64_t sub_100016D68@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v4 = *a1;
  swift_getKeyPath();
  sub_100008298(&qword_10007BEC0, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV2.AnalyticsCounters);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  swift_getKeyPath();
  sub_100008298(&qword_10007BFE0, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV2.AnalyticsCounters);
  PersistentModel.getValue<A>(forKey:)();
  uint64_t result = swift_release();
  *a2 = v4;
  return result;
}

uint64_t sub_100016E74()
{
  return swift_release();
}

uint64_t sub_100016F40()
{
  swift_getKeyPath();
  sub_100008298(&qword_10007BEC0, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV2.AnalyticsCounters);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  swift_getKeyPath();
  sub_100008298(&qword_10007BFE0, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV2.AnalyticsCounters);
  PersistentModel.getValue<A>(forKey:)();
  swift_release();
  return v0;
}

uint64_t sub_100017044@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v4 = *a1;
  swift_getKeyPath();
  sub_100008298(&qword_10007BEC0, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV2.AnalyticsCounters);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  swift_getKeyPath();
  sub_100008298(&qword_10007BFE0, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV2.AnalyticsCounters);
  PersistentModel.getValue<A>(forKey:)();
  uint64_t result = swift_release();
  *a2 = v4;
  return result;
}

uint64_t sub_100017150()
{
  return swift_release();
}

uint64_t sub_10001721C()
{
  swift_getKeyPath();
  sub_100008298(&qword_10007BEC0, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV2.AnalyticsCounters);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  swift_getKeyPath();
  sub_100008298(&qword_10007BFE0, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV2.AnalyticsCounters);
  PersistentModel.getValue<A>(forKey:)();
  swift_release();
  return v0;
}

uint64_t sub_100017320@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v4 = *a1;
  swift_getKeyPath();
  sub_100008298(&qword_10007BEC0, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV2.AnalyticsCounters);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  swift_getKeyPath();
  sub_100008298(&qword_10007BFE0, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV2.AnalyticsCounters);
  PersistentModel.getValue<A>(forKey:)();
  uint64_t result = swift_release();
  *a2 = v4;
  return result;
}

uint64_t sub_10001742C()
{
  return swift_release();
}

uint64_t sub_1000174F8()
{
  swift_getKeyPath();
  sub_100008298(&qword_10007BEC0, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV2.AnalyticsCounters);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  swift_getKeyPath();
  sub_100008298(&qword_10007BFE0, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV2.AnalyticsCounters);
  PersistentModel.getValue<A>(forKey:)();
  swift_release();
  return v0;
}

uint64_t sub_1000175FC@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v4 = *a1;
  swift_getKeyPath();
  sub_100008298(&qword_10007BEC0, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV2.AnalyticsCounters);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  swift_getKeyPath();
  sub_100008298(&qword_10007BFE0, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV2.AnalyticsCounters);
  PersistentModel.getValue<A>(forKey:)();
  uint64_t result = swift_release();
  *a2 = v4;
  return result;
}

uint64_t sub_100017708()
{
  return swift_release();
}

uint64_t sub_1000177D4()
{
  swift_getKeyPath();
  sub_100008298(&qword_10007BEC0, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV2.AnalyticsCounters);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  swift_getKeyPath();
  sub_100008298(&qword_10007BFE0, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV2.AnalyticsCounters);
  PersistentModel.getValue<A>(forKey:)();
  swift_release();
  return v0;
}

uint64_t sub_1000178D8@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v4 = *a1;
  swift_getKeyPath();
  sub_100008298(&qword_10007BEC0, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV2.AnalyticsCounters);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  swift_getKeyPath();
  sub_100008298(&qword_10007BFE0, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV2.AnalyticsCounters);
  PersistentModel.getValue<A>(forKey:)();
  uint64_t result = swift_release();
  *a2 = v4;
  return result;
}

uint64_t sub_1000179E4()
{
  return swift_release();
}

uint64_t sub_100017AB0()
{
  swift_getKeyPath();
  sub_100008298(&qword_10007BEC0, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV2.AnalyticsCounters);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  swift_getKeyPath();
  sub_100008298(&qword_10007BFE0, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV2.AnalyticsCounters);
  PersistentModel.getValue<A>(forKey:)();
  swift_release();
  return v0;
}

uint64_t sub_100017BB4()
{
  return swift_release();
}

uint64_t sub_100017C5C@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v4 = *a1;
  swift_getKeyPath();
  sub_100008298(&qword_10007BEC0, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV2.AnalyticsCounters);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  swift_getKeyPath();
  sub_100008298(&qword_10007BFE0, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV2.AnalyticsCounters);
  PersistentModel.getValue<A>(forKey:)();
  uint64_t result = swift_release();
  *a2 = v4;
  return result;
}

uint64_t sub_100017D68()
{
  return swift_release();
}

uint64_t sub_100017E34()
{
  swift_getKeyPath();
  sub_100008298(&qword_10007BEC0, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV2.AnalyticsCounters);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  swift_getKeyPath();
  sub_100008298(&qword_10007BFE0, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV2.AnalyticsCounters);
  PersistentModel.getValue<A>(forKey:)();
  swift_release();
  return v0;
}

uint64_t sub_100017F38@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v4 = *a1;
  swift_getKeyPath();
  sub_100008298(&qword_10007BEC0, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV2.AnalyticsCounters);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  swift_getKeyPath();
  sub_100008298(&qword_10007BFE0, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV2.AnalyticsCounters);
  PersistentModel.getValue<A>(forKey:)();
  uint64_t result = swift_release();
  *a2 = v4;
  return result;
}

uint64_t sub_100018044()
{
  return swift_release();
}

uint64_t sub_100018110()
{
  swift_getKeyPath();
  sub_100008298(&qword_10007BEC0, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV2.AnalyticsCounters);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  swift_getKeyPath();
  sub_100008298(&qword_10007BFE0, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV2.AnalyticsCounters);
  PersistentModel.getValue<A>(forKey:)();
  swift_release();
  return v0;
}

uint64_t sub_100018214@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v4 = *a1;
  swift_getKeyPath();
  sub_100008298(&qword_10007BEC0, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV2.AnalyticsCounters);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  swift_getKeyPath();
  sub_100008298(&qword_10007BFE0, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV2.AnalyticsCounters);
  PersistentModel.getValue<A>(forKey:)();
  uint64_t result = swift_release();
  *a2 = v4;
  return result;
}

uint64_t sub_100018320()
{
  return swift_release();
}

uint64_t sub_1000183EC()
{
  swift_getKeyPath();
  sub_100008298(&qword_10007BEC0, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV2.AnalyticsCounters);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  swift_getKeyPath();
  sub_100008298(&qword_10007BFE0, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV2.AnalyticsCounters);
  PersistentModel.getValue<A>(forKey:)();
  swift_release();
  return v0;
}

uint64_t sub_1000184F0@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v4 = *a1;
  swift_getKeyPath();
  sub_100008298(&qword_10007BEC0, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV2.AnalyticsCounters);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  swift_getKeyPath();
  sub_100008298(&qword_10007BFE0, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV2.AnalyticsCounters);
  PersistentModel.getValue<A>(forKey:)();
  uint64_t result = swift_release();
  *a2 = v4;
  return result;
}

uint64_t sub_1000185FC()
{
  return swift_release();
}

uint64_t sub_1000186C8()
{
  swift_getKeyPath();
  sub_100008298(&qword_10007BEC0, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV2.AnalyticsCounters);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  swift_getKeyPath();
  sub_100008298(&qword_10007BFE0, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV2.AnalyticsCounters);
  PersistentModel.getValue<A>(forKey:)();
  swift_release();
  return v0;
}

uint64_t sub_1000187CC@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v4 = *a1;
  swift_getKeyPath();
  sub_100008298(&qword_10007BEC0, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV2.AnalyticsCounters);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  swift_getKeyPath();
  sub_100008298(&qword_10007BFE0, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV2.AnalyticsCounters);
  PersistentModel.getValue<A>(forKey:)();
  uint64_t result = swift_release();
  *a2 = v4;
  return result;
}

uint64_t sub_1000188D8()
{
  return swift_release();
}

uint64_t sub_1000189A4()
{
  swift_getKeyPath();
  sub_100008298(&qword_10007BEC0, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV2.AnalyticsCounters);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  swift_getKeyPath();
  sub_100008298(&qword_10007BFE0, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV2.AnalyticsCounters);
  PersistentModel.getValue<A>(forKey:)();
  swift_release();
  return v0;
}

uint64_t sub_100018AA8()
{
  uint64_t v1 = v0;
  uint64_t v2 = (uint64_t *)(v0 + 16);
  uint64_t v3 = type metadata accessor for AnalyticsSchemaV2.AnalyticsCounters(0);
  *(void *)(v1 + 40) = sub_1000082E0(&qword_10007C0B0);
  v5[0] = v3;
  v5[1] = v3;
  uint64_t v6 = sub_100008298(&qword_10007BFE0, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV2.AnalyticsCounters);
  uint64_t v7 = v6;
  *(void *)(v1 + 48) = swift_getOpaqueTypeConformance2();
  sub_10001FA98(v2);
  static PersistentModel.createBackingData<A>()();
  sub_100008234((uint64_t)v2, (uint64_t)v5);
  sub_10000B090(v5, v7);
  swift_getKeyPath();
  dispatch thunk of BackingData.setValue<A>(forKey:to:)();
  swift_release();
  sub_100008540((uint64_t)v5);
  sub_100008234((uint64_t)v2, (uint64_t)v5);
  sub_10000B090(v5, v7);
  swift_getKeyPath();
  dispatch thunk of BackingData.setValue<A>(forKey:to:)();
  swift_release();
  sub_100008540((uint64_t)v5);
  sub_100008234((uint64_t)v2, (uint64_t)v5);
  sub_10000B090(v5, v7);
  swift_getKeyPath();
  dispatch thunk of BackingData.setValue<A>(forKey:to:)();
  swift_release();
  sub_100008540((uint64_t)v5);
  sub_100008234((uint64_t)v2, (uint64_t)v5);
  sub_10000B090(v5, v7);
  swift_getKeyPath();
  dispatch thunk of BackingData.setValue<A>(forKey:to:)();
  swift_release();
  sub_100008540((uint64_t)v5);
  sub_100008234((uint64_t)v2, (uint64_t)v5);
  sub_10000B090(v5, v7);
  swift_getKeyPath();
  dispatch thunk of BackingData.setValue<A>(forKey:to:)();
  swift_release();
  sub_100008540((uint64_t)v5);
  sub_100008234((uint64_t)v2, (uint64_t)v5);
  sub_10000B090(v5, v7);
  swift_getKeyPath();
  dispatch thunk of BackingData.setValue<A>(forKey:to:)();
  swift_release();
  sub_100008540((uint64_t)v5);
  sub_100008234((uint64_t)v2, (uint64_t)v5);
  sub_10000B090(v5, v7);
  swift_getKeyPath();
  dispatch thunk of BackingData.setValue<A>(forKey:to:)();
  swift_release();
  sub_100008540((uint64_t)v5);
  sub_100008234((uint64_t)v2, (uint64_t)v5);
  sub_10000B090(v5, v7);
  swift_getKeyPath();
  dispatch thunk of BackingData.setValue<A>(forKey:to:)();
  swift_release();
  sub_100008540((uint64_t)v5);
  sub_100008234((uint64_t)v2, (uint64_t)v5);
  sub_10000B090(v5, v7);
  swift_getKeyPath();
  dispatch thunk of BackingData.setValue<A>(forKey:to:)();
  swift_release();
  sub_100008540((uint64_t)v5);
  sub_100008234((uint64_t)v2, (uint64_t)v5);
  sub_10000B090(v5, v7);
  swift_getKeyPath();
  dispatch thunk of BackingData.setValue<A>(forKey:to:)();
  swift_release();
  sub_100008540((uint64_t)v5);
  sub_100008234((uint64_t)v2, (uint64_t)v5);
  sub_10000B090(v5, v7);
  swift_getKeyPath();
  dispatch thunk of BackingData.setValue<A>(forKey:to:)();
  swift_release();
  sub_100008540((uint64_t)v5);
  sub_100008234((uint64_t)v2, (uint64_t)v5);
  sub_10000B090(v5, v7);
  swift_getKeyPath();
  dispatch thunk of BackingData.setValue<A>(forKey:to:)();
  swift_release();
  sub_100008540((uint64_t)v5);
  ObservationRegistrar.init()();
  return v1;
}

uint64_t sub_100018FF4(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = (uint64_t *)(v1 + 16);
  uint64_t v5 = type metadata accessor for AnalyticsSchemaV2.AnalyticsCounters(0);
  *(void *)(v2 + 40) = sub_1000082E0(&qword_10007C0B0);
  *(void *)&long long v7 = v5;
  *((void *)&v7 + 1) = v5;
  uint64_t v8 = sub_100008298(&qword_10007BFE0, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV2.AnalyticsCounters);
  uint64_t v9 = v8;
  *(void *)(v2 + 48) = swift_getOpaqueTypeConformance2();
  sub_10001FA98(v4);
  static PersistentModel.createBackingData<A>()();
  sub_100008234((uint64_t)v4, (uint64_t)&v7);
  sub_10000B090(&v7, v9);
  swift_getKeyPath();
  dispatch thunk of BackingData.setValue<A>(forKey:to:)();
  swift_release();
  sub_100008540((uint64_t)&v7);
  sub_100008234((uint64_t)v4, (uint64_t)&v7);
  sub_10000B090(&v7, v9);
  swift_getKeyPath();
  dispatch thunk of BackingData.setValue<A>(forKey:to:)();
  swift_release();
  sub_100008540((uint64_t)&v7);
  sub_100008234((uint64_t)v4, (uint64_t)&v7);
  sub_10000B090(&v7, v9);
  swift_getKeyPath();
  dispatch thunk of BackingData.setValue<A>(forKey:to:)();
  swift_release();
  sub_100008540((uint64_t)&v7);
  sub_100008234((uint64_t)v4, (uint64_t)&v7);
  sub_10000B090(&v7, v9);
  swift_getKeyPath();
  dispatch thunk of BackingData.setValue<A>(forKey:to:)();
  swift_release();
  sub_100008540((uint64_t)&v7);
  sub_100008234((uint64_t)v4, (uint64_t)&v7);
  sub_10000B090(&v7, v9);
  swift_getKeyPath();
  dispatch thunk of BackingData.setValue<A>(forKey:to:)();
  swift_release();
  sub_100008540((uint64_t)&v7);
  sub_100008234((uint64_t)v4, (uint64_t)&v7);
  sub_10000B090(&v7, v9);
  swift_getKeyPath();
  dispatch thunk of BackingData.setValue<A>(forKey:to:)();
  swift_release();
  sub_100008540((uint64_t)&v7);
  sub_100008234((uint64_t)v4, (uint64_t)&v7);
  sub_10000B090(&v7, v9);
  swift_getKeyPath();
  dispatch thunk of BackingData.setValue<A>(forKey:to:)();
  swift_release();
  sub_100008540((uint64_t)&v7);
  sub_100008234((uint64_t)v4, (uint64_t)&v7);
  sub_10000B090(&v7, v9);
  swift_getKeyPath();
  dispatch thunk of BackingData.setValue<A>(forKey:to:)();
  swift_release();
  sub_100008540((uint64_t)&v7);
  sub_100008234((uint64_t)v4, (uint64_t)&v7);
  sub_10000B090(&v7, v9);
  swift_getKeyPath();
  dispatch thunk of BackingData.setValue<A>(forKey:to:)();
  swift_release();
  sub_100008540((uint64_t)&v7);
  sub_100008234((uint64_t)v4, (uint64_t)&v7);
  sub_10000B090(&v7, v9);
  swift_getKeyPath();
  dispatch thunk of BackingData.setValue<A>(forKey:to:)();
  swift_release();
  sub_100008540((uint64_t)&v7);
  sub_100008234((uint64_t)v4, (uint64_t)&v7);
  sub_10000B090(&v7, v9);
  swift_getKeyPath();
  dispatch thunk of BackingData.setValue<A>(forKey:to:)();
  swift_release();
  sub_100008540((uint64_t)&v7);
  sub_100008234((uint64_t)v4, (uint64_t)&v7);
  sub_10000B090(&v7, v9);
  swift_getKeyPath();
  dispatch thunk of BackingData.setValue<A>(forKey:to:)();
  swift_release();
  sub_100008540((uint64_t)&v7);
  ObservationRegistrar.init()();
  sub_100008234(a1, (uint64_t)&v7);
  swift_beginAccess();
  sub_100008540((uint64_t)v4);
  sub_10001FA80(&v7, (uint64_t)v4);
  swift_endAccess();
  sub_100008540(a1);
  return v2;
}

uint64_t sub_100019590()
{
  return sub_10000E428(&OBJC_IVAR____TtCO14applekeystored17AnalyticsSchemaV217AnalyticsCounters___observationRegistrar);
}

uint64_t sub_10001959C()
{
  return type metadata accessor for AnalyticsSchemaV2.AnalyticsCounters(0);
}

uint64_t type metadata accessor for AnalyticsSchemaV2.AnalyticsCounters(uint64_t a1)
{
  return sub_1000195C4(a1, qword_10007B9B0);
}

uint64_t sub_1000195C4(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1000195FC()
{
  uint64_t result = type metadata accessor for ObservationRegistrar();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_1000196C0@<X0>(uint64_t a1@<X8>)
{
  return sub_1000196E4(&qword_10007A5B0, (uint64_t)qword_10007DAB0, a1);
}

uint64_t sub_1000196E4@<X0>(void *a1@<X2>, uint64_t a2@<X3>, uint64_t a3@<X8>)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v5 = type metadata accessor for Schema.Version();
  uint64_t v6 = sub_10000AF48(v5, a2);
  long long v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);

  return v7(a3, v6, v5);
}

uint64_t sub_100019780()
{
  uint64_t v0 = type metadata accessor for MigrationStage();
  sub_10000AFD4(v0, qword_10007DAC8);
  unint64_t v1 = (void *)sub_10000AF48(v0, (uint64_t)qword_10007DAC8);
  unint64_t v2 = sub_100023038();
  unint64_t v3 = sub_10002308C();
  *unint64_t v1 = &type metadata for AnalyticsSchemaV1;
  v1[1] = v2;
  v1[2] = &type metadata for AnalyticsSchemaV2;
  v1[3] = v3;
  uint64_t v4 = enum case for MigrationStage.lightweight(_:);
  uint64_t v5 = *(uint64_t (**)(void *, uint64_t, uint64_t))(*(void *)(v0 - 8) + 104);

  return v5(v1, v4, v0);
}

uint64_t sub_10001983C()
{
  sub_1000082E0(&qword_10007C2F0);
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_1000569D0;
  unint64_t v1 = sub_100023038();
  *(void *)(v0 + 32) = &type metadata for AnalyticsSchemaV1;
  *(void *)(v0 + 40) = v1;
  unint64_t v2 = sub_10002308C();
  *(void *)(v0 + 48) = &type metadata for AnalyticsSchemaV2;
  *(void *)(v0 + 56) = v2;
  return v0;
}

uint64_t sub_1000198A4()
{
  sub_1000082E0(&qword_10007C2D8);
  uint64_t v0 = type metadata accessor for MigrationStage();
  uint64_t v1 = *(void *)(v0 - 8);
  unint64_t v2 = (*(unsigned __int8 *)(v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_1000569E0;
  if (qword_10007A5B8 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_10000AF48(v0, (uint64_t)qword_10007DAC8);
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v1 + 16))(v3 + v2, v4, v0);
  return v3;
}

uint64_t sub_1000199B8@<X0>(void *a1@<X8>)
{
  swift_getKeyPath();
  sub_100008298(&qword_10007BEC0, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV2.AnalyticsCounters);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  swift_getKeyPath();
  sub_100008298(&qword_10007BFE0, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV2.AnalyticsCounters);
  PersistentModel.getValue<A>(forKey:)();
  swift_release();
  swift_getKeyPath();
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  swift_getKeyPath();
  PersistentModel.getValue<A>(forKey:)();
  swift_release();
  swift_getKeyPath();
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  swift_getKeyPath();
  PersistentModel.getValue<A>(forKey:)();
  swift_release();
  swift_getKeyPath();
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  swift_getKeyPath();
  PersistentModel.getValue<A>(forKey:)();
  swift_release();
  swift_getKeyPath();
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  swift_getKeyPath();
  PersistentModel.getValue<A>(forKey:)();
  swift_release();
  swift_getKeyPath();
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  swift_getKeyPath();
  PersistentModel.getValue<A>(forKey:)();
  swift_release();
  swift_getKeyPath();
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  swift_getKeyPath();
  PersistentModel.getValue<A>(forKey:)();
  swift_release();
  swift_getKeyPath();
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  swift_getKeyPath();
  PersistentModel.getValue<A>(forKey:)();
  swift_release();
  swift_getKeyPath();
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  swift_getKeyPath();
  PersistentModel.getValue<A>(forKey:)();
  swift_release();
  swift_getKeyPath();
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  swift_getKeyPath();
  PersistentModel.getValue<A>(forKey:)();
  swift_release();
  swift_getKeyPath();
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  swift_getKeyPath();
  PersistentModel.getValue<A>(forKey:)();
  swift_release();
  swift_getKeyPath();
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  swift_getKeyPath();
  PersistentModel.getValue<A>(forKey:)();
  uint64_t result = swift_release();
  *a1 = v4;
  a1[1] = v1;
  a1[2] = v1;
  a1[3] = v1;
  a1[4] = v1;
  a1[5] = v1;
  a1[6] = v1;
  a1[7] = v1;
  a1[8] = v1;
  a1[9] = v1;
  a1[10] = v1;
  a1[11] = v1;
  return result;
}

uint64_t sub_100019F5C()
{
  uint64_t v2 = type metadata accessor for URL();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = __chkstk_darwin(v2);
  uint64_t v6 = (char *)&v40 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __chkstk_darwin(v4);
  uint64_t v9 = (char *)&v40 - v8;
  __chkstk_darwin(v7);
  uint64_t v11 = (char *)&v40 - v10;
  uint64_t v12 = type metadata accessor for AnalyticsStore();
  sub_10001A5D0(0, (uint64_t)v11);
  if (!v1)
  {
    uint64_t v40 = v12;
    uint64_t v45 = 0;
    uint64_t v46 = v0;
    if (qword_10007A5C0 != -1) {
      swift_once();
    }
    uint64_t v13 = type metadata accessor for Logger();
    sub_10000AF48(v13, (uint64_t)qword_10007DAE0);
    uint64_t v42 = *(void (**)(char *, char *, uint64_t))(v3 + 16);
    v42(v9, v11, v2);
    uint64_t v14 = Logger.logObject.getter();
    os_log_type_t v15 = static os_log_type_t.info.getter();
    BOOL v16 = os_log_type_enabled(v14, v15);
    uint64_t v47 = v3;
    uint64_t v48 = v2;
    if (v16)
    {
      uint64_t v17 = (uint8_t *)swift_slowAlloc();
      uint64_t v43 = (void *)swift_slowAlloc();
      char v50 = v43;
      *(_DWORD *)uint64_t v17 = 136315138;
      uint64_t v44 = (void (*)(char *, uint64_t))(v17 + 4);
      uint64_t v18 = URL.absoluteString.getter();
      uint64_t v49 = sub_10001EE9C(v18, v19, (uint64_t *)&v50);
      uint64_t v2 = v48;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      uint64_t v44 = *(void (**)(char *, uint64_t))(v47 + 8);
      v44(v9, v2);
      _os_log_impl((void *)&_mh_execute_header, v14, v15, "opening AnalyticsStore at %s", v17, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      uint64_t v44 = *(void (**)(char *, uint64_t))(v3 + 8);
      v44(v9, v2);
    }

    uint64_t v41 = type metadata accessor for ModelConfiguration();
    uint64_t v43 = &v40;
    uint64_t v20 = *(void *)(v41 - 8);
    __chkstk_darwin(v41);
    uint64_t v22 = (char *)&v40 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
    v42(v6, v11, v2);
    uint64_t v23 = type metadata accessor for ModelConfiguration.CloudKitDatabase();
    __chkstk_darwin(v23 - 8);
    static ModelConfiguration.CloudKitDatabase.automatic.getter();
    ModelConfiguration.init(_:schema:url:allowsSave:cloudKitDatabase:)();
    type metadata accessor for ModelContainer();
    sub_1000082E0(&qword_10007BFC0);
    uint64_t v24 = swift_allocObject();
    *(_OWORD *)(v24 + 16) = xmmword_1000569F0;
    uint64_t v25 = type metadata accessor for AnalyticsSchemaV2.ProcessAnalytics(0);
    uint64_t v26 = sub_100008298(&qword_10007BFC8, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV2.ProcessAnalytics);
    *(void *)(v24 + 32) = v25;
    *(void *)(v24 + 40) = v26;
    uint64_t v27 = type metadata accessor for AnalyticsSchemaV2.FileAnalytics(0);
    uint64_t v28 = sub_100008298(&qword_10007BFD0, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV2.FileAnalytics);
    *(void *)(v24 + 48) = v27;
    *(void *)(v24 + 56) = v28;
    uint64_t v29 = type metadata accessor for AnalyticsSchemaV2.PipelineState(0);
    uint64_t v30 = sub_100008298(&qword_10007BFD8, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV2.PipelineState);
    *(void *)(v24 + 64) = v29;
    *(void *)(v24 + 72) = v30;
    uint64_t v31 = type metadata accessor for AnalyticsSchemaV2.AnalyticsCounters(0);
    uint64_t v32 = sub_100008298(&qword_10007BFE0, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV2.AnalyticsCounters);
    *(void *)(v24 + 80) = v31;
    *(void *)(v24 + 88) = v32;
    sub_10001F570();
    sub_1000082E0(&qword_10007BFF0);
    uint64_t v33 = v41;
    unint64_t v34 = (*(unsigned __int8 *)(v20 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v20 + 80);
    uint64_t v35 = swift_allocObject();
    *(_OWORD *)(v35 + 16) = xmmword_1000569E0;
    (*(void (**)(unint64_t, char *, uint64_t))(v20 + 16))(v35 + v34, v22, v33);
    uint64_t v36 = v45;
    uint64_t v37 = ModelContainer.__allocating_init(for:migrationPlan:configurations:)();
    if (!v36)
    {
      uint64_t v39 = v37;
      (*(void (**)(char *, uint64_t))(v20 + 8))(v22, v33);
      v44(v11, v48);
      uint64_t v0 = v46;
      *(void *)(v46 + 16) = v39;
      return v0;
    }
    (*(void (**)(char *, uint64_t))(v20 + 8))(v22, v33);
    v44(v11, v48);
    uint64_t v0 = v46;
  }
  swift_deallocPartialClassInstance();
  return v0;
}

uint64_t sub_10001A5D0@<X0>(char a1@<W0>, uint64_t a2@<X8>)
{
  v36[1] = a2;
  uint64_t v39 = type metadata accessor for URLResourceValues();
  uint64_t v37 = *(void *)(v39 - 8);
  __chkstk_darwin(v39);
  uint64_t v4 = (char *)v36 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for URL();
  uint64_t v40 = *(void *)(v5 - 8);
  uint64_t v6 = __chkstk_darwin(v5);
  uint64_t v8 = (char *)v36 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v10 = (char *)v36 - v9;
  uint64_t v11 = self;
  id v12 = [v11 defaultManager];
  id v41 = 0;
  id v13 = [v12 URLForDirectory:5 inDomain:1 appropriateForURL:0 create:1 error:&v41];

  id v14 = v41;
  if (v13)
  {
    static URL._unconditionallyBridgeFromObjectiveC(_:)();
    id v15 = v14;

    URL.appendingPathComponent(_:isDirectory:)();
    if (a1)
    {
      id v16 = [v11 defaultManager];
      URL._bridgeToObjectiveC()(v17);
      unint64_t v19 = v18;
      id v41 = 0;
      unsigned int v20 = [v16 removeItemAtURL:v18 error:&v41];

      id v21 = v41;
      if (!v20) {
        goto LABEL_9;
      }
      id v22 = v41;
    }
    id v23 = [v11 defaultManager];
    URL._bridgeToObjectiveC()(v24);
    uint64_t v26 = v25;
    id v41 = 0;
    unsigned int v27 = [v23 createDirectoryAtURL:v25 withIntermediateDirectories:1 attributes:0 error:&v41];

    id v21 = v41;
    if (v27)
    {
      id v28 = v41;
      URLResourceValues.init()();
      URLResourceValues.isExcludedFromBackup.setter();
      uint64_t v29 = v38;
      URL.setResourceValues(_:)();
      uint64_t v30 = (void (**)(char *, uint64_t))(v37 + 8);
      uint64_t v31 = (void (**)(char *, uint64_t))(v40 + 8);
      if (!v29) {
        URL.appendingPathComponent(_:)();
      }
      (*v30)(v4, v39);
      uint64_t v32 = *v31;
      (*v31)(v8, v5);
      return ((uint64_t (*)(char *, uint64_t))v32)(v10, v5);
    }
LABEL_9:
    id v33 = v21;
    _convertNSErrorToError(_:)();

    swift_willThrow();
    uint64_t v32 = *(void (**)(char *, uint64_t))(v40 + 8);
    v32(v8, v5);
    return ((uint64_t (*)(char *, uint64_t))v32)(v10, v5);
  }
  id v35 = v41;
  _convertNSErrorToError(_:)();

  return swift_willThrow();
}

uint64_t sub_10001A9B4()
{
  uint64_t v1 = type metadata accessor for URL();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v4 = (char *)v22 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for AnalyticsStore();
  uint64_t v6 = swift_allocObject();
  sub_100019F5C();
  if (v0)
  {
    if (qword_10007A5C0 != -1) {
      swift_once();
    }
    uint64_t v7 = type metadata accessor for Logger();
    uint64_t v8 = sub_10000AF48(v7, (uint64_t)qword_10007DAE0);
    swift_errorRetain();
    swift_errorRetain();
    uint64_t v9 = Logger.logObject.getter();
    os_log_type_t v10 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v9, v10))
    {
      uint64_t v23 = v1;
      uint64_t v11 = swift_slowAlloc();
      v22[0] = v9;
      v22[1] = v8;
      id v12 = (uint8_t *)v11;
      id v13 = (void *)swift_slowAlloc();
      v22[2] = v5;
      *(_DWORD *)id v12 = 138412290;
      swift_errorRetain();
      id v14 = v4;
      uint64_t v15 = v2;
      uint64_t v16 = _swift_stdlib_bridgeErrorToNSError();
      uint64_t v24 = v16;
      uint64_t v1 = v23;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *id v13 = v16;
      uint64_t v2 = v15;
      uint64_t v4 = v14;
      swift_errorRelease();
      swift_errorRelease();
      os_log_t v17 = v22[0];
      _os_log_impl((void *)&_mh_execute_header, v22[0], v10, "failed to open database: %@", v12, 0xCu);
      sub_1000082E0(&qword_10007BFB8);
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
    uint64_t v18 = Logger.logObject.getter();
    os_log_type_t v19 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v18, v19))
    {
      unsigned int v20 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unsigned int v20 = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, v19, "removing old database", v20, 2u);
      swift_slowDealloc();
    }

    sub_10001A5D0(1, (uint64_t)v4);
    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
    uint64_t v6 = swift_allocObject();
    sub_100019F5C();
  }
  return v6;
}

uint64_t type metadata accessor for AnalyticsStore()
{
  return self;
}

uint64_t sub_10001AD34()
{
  uint64_t v1 = sub_1000082E0(&qword_10007C038);
  __chkstk_darwin(v1 - 8);
  uint64_t v3 = (char *)v20 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_1000082E0(&qword_10007C2C0);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)v20 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_1000082E0(&qword_10007C2C8);
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  os_log_type_t v10 = (char *)v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_1000082E0(&qword_10007C2D0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v6, 1, 1, v11);
  type metadata accessor for AnalyticsSchemaV2.PipelineState(0);
  sub_100008298(&qword_10007BFD8, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV2.PipelineState);
  FetchDescriptor.init(predicate:sortBy:)();
  unint64_t v12 = dispatch thunk of ModelContext.fetch<A>(_:)();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  if (v0) {
    return v7;
  }
  if (v12 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v14 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    if (v14) {
      goto LABEL_4;
    }
  }
  else if (*(void *)((v12 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
LABEL_4:
    if ((v12 & 0xC000000000000001) != 0)
    {
      uint64_t v7 = specialized _ArrayBuffer._getElementSlowPath(_:)();
      goto LABEL_7;
    }
    if (*(void *)((v12 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      uint64_t v7 = *(void *)(v12 + 32);
      swift_retain();
LABEL_7:
      swift_bridgeObjectRelease();
      return v7;
    }
    __break(1u);
    goto LABEL_16;
  }
  swift_bridgeObjectRelease();
  if (qword_10007A5C0 != -1) {
LABEL_16:
  }
    swift_once();
  uint64_t v15 = type metadata accessor for Logger();
  sub_10000AF48(v15, (uint64_t)qword_10007DAE0);
  uint64_t v16 = Logger.logObject.getter();
  os_log_type_t v17 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v16, v17))
  {
    uint64_t v18 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v18 = 0;
    _os_log_impl((void *)&_mh_execute_header, v16, v17, "initializing PipelineState", v18, 2u);
    swift_slowDealloc();
  }

  uint64_t v19 = type metadata accessor for Date();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56))(v3, 1, 1, v19);
  uint64_t v7 = swift_allocObject();
  sub_100016224(1, 0, 1, (uint64_t)v3);
  dispatch thunk of ModelContext.insert<A>(_:)();
  dispatch thunk of ModelContext.save()();
  return v7;
}

uint64_t sub_10001B14C()
{
  uint64_t v1 = sub_1000082E0(&qword_10007C2A8);
  __chkstk_darwin(v1 - 8);
  uint64_t v3 = (char *)v16 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_1000082E0(&qword_10007C2B0);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_1000082E0(&qword_10007C2B8);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v3, 1, 1, v8);
  type metadata accessor for AnalyticsSchemaV2.AnalyticsCounters(0);
  sub_100008298(&qword_10007BFE0, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV2.AnalyticsCounters);
  FetchDescriptor.init(predicate:sortBy:)();
  unint64_t v9 = dispatch thunk of ModelContext.fetch<A>(_:)();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  if (v0) {
    return v4;
  }
  if (v9 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v11 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    if (v11) {
      goto LABEL_4;
    }
  }
  else if (*(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
LABEL_4:
    if ((v9 & 0xC000000000000001) != 0)
    {
      uint64_t v4 = specialized _ArrayBuffer._getElementSlowPath(_:)();
      goto LABEL_7;
    }
    if (*(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      uint64_t v4 = *(void *)(v9 + 32);
      swift_retain();
LABEL_7:
      swift_bridgeObjectRelease();
      return v4;
    }
    __break(1u);
    goto LABEL_16;
  }
  swift_bridgeObjectRelease();
  if (qword_10007A5C0 != -1) {
LABEL_16:
  }
    swift_once();
  uint64_t v12 = type metadata accessor for Logger();
  sub_10000AF48(v12, (uint64_t)qword_10007DAE0);
  id v13 = Logger.logObject.getter();
  os_log_type_t v14 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v13, v14))
  {
    uint64_t v15 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v15 = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, v14, "initializing AnalyticsCounters", v15, 2u);
    swift_slowDealloc();
  }

  uint64_t v4 = swift_allocObject();
  sub_100018AA8();
  dispatch thunk of ModelContext.insert<A>(_:)();
  dispatch thunk of ModelContext.save()();
  return v4;
}

unint64_t sub_10001B4CC(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int a4, int a5)
{
  uint64_t v10 = sub_1000082E0(&qword_10007C150);
  __chkstk_darwin(v10 - 8);
  uint64_t v12 = (char *)&v28 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v35 = sub_1000082E0(&qword_10007C158);
  uint64_t v13 = *(void *)(v35 - 8);
  __chkstk_darwin(v35);
  uint64_t v15 = (char *)&v28 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v31 = a2;
  uint64_t v32 = a3;
  uint64_t v37 = a2;
  uint64_t v38 = a3;
  unsigned int v33 = a4;
  int v34 = a5;
  char v39 = a4;
  char v40 = a5;
  uint64_t v41 = a1;
  uint64_t v43 = type metadata accessor for AnalyticsSchemaV2.ProcessAnalytics(0);
  Predicate.init(_:)();
  uint64_t v16 = sub_1000082E0(&qword_10007C160);
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v12, 0, 1, v16);
  sub_100008298(&qword_10007BFC8, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV2.ProcessAnalytics);
  FetchDescriptor.init(predicate:sortBy:)();
  uint64_t v17 = v36;
  unint64_t result = dispatch thunk of ModelContext.fetch<A>(_:)();
  uint64_t v36 = v17;
  if (v17) {
    return (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v15, v35);
  }
  unint64_t v19 = result;
  uint64_t v29 = v13;
  uint64_t v30 = v15;
  uint64_t v20 = v33;
  char v21 = v34;
  if (!(result >> 62))
  {
    uint64_t v22 = v32;
    if (*(void *)((result & 0xFFFFFFFFFFFFFF8) + 0x10)) {
      goto LABEL_5;
    }
LABEL_11:
    swift_bridgeObjectRelease();
    swift_allocObject();
    swift_bridgeObjectRetain();
    sub_100012F08(v31, v22, v20, v21);
    dispatch thunk of ModelContext.insert<A>(_:)();
    swift_release();
    uint64_t v23 = v30;
    return (*(uint64_t (**)(char *, uint64_t))(v29 + 8))(v23, v35);
  }
  swift_bridgeObjectRetain();
  uint64_t v27 = _CocoaArrayWrapper.endIndex.getter();
  unint64_t result = swift_bridgeObjectRelease();
  uint64_t v22 = v32;
  if (!v27) {
    goto LABEL_11;
  }
LABEL_5:
  if ((v19 & 0xC000000000000001) != 0)
  {
    uint64_t v24 = specialized _ArrayBuffer._getElementSlowPath(_:)();
    uint64_t v23 = v30;
  }
  else
  {
    uint64_t v23 = v30;
    if (!*(void *)((v19 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      goto LABEL_16;
    }
    uint64_t v24 = *(void *)(v19 + 32);
    swift_retain();
  }
  swift_bridgeObjectRelease();
  uint64_t v42 = v24;
  swift_getKeyPath();
  sub_100008298(&qword_10007BF20, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV2.ProcessAnalytics);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  swift_getKeyPath();
  PersistentModel.getValue<A>(forKey:)();
  unint64_t result = swift_release();
  uint64_t v25 = v42 + 1;
  if (v42 == -1)
  {
LABEL_16:
    __break(1u);
    return result;
  }
  uint64_t v42 = v24;
  uint64_t KeyPath = swift_getKeyPath();
  __chkstk_darwin(KeyPath);
  *(&v28 - 2) = v24;
  *(&v28 - 1) = v25;
  ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)();
  swift_release();
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v29 + 8))(v23, v35);
}

uint64_t sub_10001B984@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, void *a3@<X2>, int a4@<W3>, int a5@<W4>, uint64_t a6@<X5>, uint64_t *a7@<X8>)
{
  uint64_t v105 = a6;
  int v100 = a5;
  LODWORD(v88) = a4;
  BOOL v117 = a3;
  uint64_t v114 = a2;
  uint64_t v111 = a7;
  uint64_t v8 = sub_1000082E0(&qword_10007C0B8);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v107 = v8;
  uint64_t v108 = v9;
  __chkstk_darwin(v8);
  uint64_t v103 = (char *)&v71 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v104 = sub_1000082E0(&qword_10007C118);
  uint64_t v106 = *(void *)(v104 - 8);
  __chkstk_darwin(v104);
  unint64_t v101 = (char *)&v71 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_1000082E0(&qword_10007C128);
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v109 = v12;
  uint64_t v110 = v13;
  __chkstk_darwin(v12);
  uint64_t v102 = (char *)&v71 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v94 = sub_1000082E0(&qword_10007C168);
  uint64_t v95 = *(void *)(v94 - 8);
  __chkstk_darwin(v94);
  v91 = (char *)&v71 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v96 = sub_1000082E0(&qword_10007C170);
  uint64_t v97 = *(void *)(v96 - 8);
  __chkstk_darwin(v96);
  uint64_t v89 = (char *)&v71 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v98 = sub_1000082E0(&qword_10007C178);
  uint64_t v99 = *(void *)(v98 - 8);
  __chkstk_darwin(v98);
  v92 = (char *)&v71 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v79 = sub_1000082E0(&qword_10007C180);
  uint64_t v80 = *(void *)(v79 - 8);
  __chkstk_darwin(v79);
  v77 = (char *)&v71 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v81 = sub_1000082E0(&qword_10007C188);
  uint64_t v82 = *(void *)(v81 - 8);
  __chkstk_darwin(v81);
  uint64_t v76 = (char *)&v71 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v84 = sub_1000082E0(&qword_10007C190);
  uint64_t v85 = *(void *)(v84 - 8);
  __chkstk_darwin(v84);
  v78 = (char *)&v71 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v72 = sub_1000082E0(&qword_10007C198);
  uint64_t v73 = *(void (***)(char *, uint64_t))(v72 - 8);
  __chkstk_darwin(v72);
  uint64_t v22 = (char *)&v71 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = sub_1000082E0(&qword_10007C110);
  uint64_t v24 = *(void *)(v23 - 8);
  __chkstk_darwin(v23);
  uint64_t v26 = (char *)&v71 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = sub_1000082E0(&qword_10007C1A0);
  uint64_t v28 = *(void *)(v27 - 8);
  uint64_t v120 = v27;
  uint64_t v121 = v28;
  __chkstk_darwin(v27);
  uint64_t v30 = (char *)&v71 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v74 = sub_1000082E0(&qword_10007C1A8);
  uint64_t v75 = *(void *)(v74 - 8);
  __chkstk_darwin(v74);
  char v71 = (char *)&v71 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v86 = sub_1000082E0(&qword_10007C1B0);
  uint64_t v87 = *(void *)(v86 - 8);
  __chkstk_darwin(v86);
  v118 = (char *)&v71 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v90 = sub_1000082E0(&qword_10007C1B8);
  uint64_t v93 = *(void *)(v90 - 8);
  __chkstk_darwin(v90);
  v83 = (char *)&v71 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v113 = *a1;
  uint64_t v119 = sub_10000949C(&qword_10007C120, &qword_10007C110);
  static PredicateExpressions.build_Arg<A>(_:)();
  swift_getKeyPath();
  static PredicateExpressions.build_KeyPath<A, B>(root:keyPath:)();
  swift_release();
  uint64_t v34 = v24 + 8;
  uint64_t v35 = *(void (**)(char *, uint64_t))(v24 + 8);
  v35(v26, v23);
  v115 = v35;
  uint64_t v116 = v34;
  uint64_t v122 = v114;
  v123 = v117;
  static PredicateExpressions.build_Arg<A>(_:)();
  int v112 = &protocol conformance descriptor for PredicateExpressions.KeyPath<A, B>;
  uint64_t v114 = sub_10000949C(&qword_10007C1C0, &qword_10007C1A0);
  BOOL v117 = &protocol conformance descriptor for PredicateExpressions.Value<A>;
  sub_10000949C(&qword_10007C1C8, &qword_10007C198);
  uint64_t v36 = v120;
  uint64_t v37 = v72;
  static PredicateExpressions.build_Equal<A, B>(lhs:rhs:)();
  v73[1](v22, v37);
  uint64_t v38 = *(void (**)(char *, uint64_t))(v121 + 8);
  v121 += 8;
  v38(v30, v36);
  char v39 = v38;
  uint64_t v73 = (void (**)(char *, uint64_t))v38;
  static PredicateExpressions.build_Arg<A>(_:)();
  swift_getKeyPath();
  static PredicateExpressions.build_KeyPath<A, B>(root:keyPath:)();
  swift_release();
  v35(v26, v23);
  LOBYTE(v122) = (_BYTE)v88;
  char v40 = v77;
  static PredicateExpressions.build_Arg<A>(_:)();
  swift_getKeyPath();
  sub_10000949C(&qword_10007C1D0, &qword_10007C180);
  uint64_t v41 = v76;
  uint64_t v42 = v40;
  uint64_t v43 = v79;
  static PredicateExpressions.build_KeyPath<A, B>(root:keyPath:)();
  swift_release();
  (*(void (**)(char *, uint64_t))(v80 + 8))(v42, v43);
  sub_10000949C(&qword_10007C1D8, &qword_10007C188);
  uint64_t v44 = v78;
  uint64_t v45 = v120;
  uint64_t v46 = v81;
  static PredicateExpressions.build_Equal<A, B>(lhs:rhs:)();
  (*(void (**)(char *, uint64_t))(v82 + 8))(v41, v46);
  v39(v30, v45);
  v88 = &protocol conformance descriptor for PredicateExpressions.Equal<A, B>;
  sub_10000949C(&qword_10007C1E0, &qword_10007C1A8);
  sub_10000949C(&qword_10007C1E8, &qword_10007C190);
  uint64_t v47 = v71;
  uint64_t v48 = v74;
  uint64_t v49 = v84;
  static PredicateExpressions.build_Conjunction<A, B>(lhs:rhs:)();
  (*(void (**)(char *, uint64_t))(v85 + 8))(v44, v49);
  (*(void (**)(char *, uint64_t))(v75 + 8))(v47, v48);
  static PredicateExpressions.build_Arg<A>(_:)();
  swift_getKeyPath();
  static PredicateExpressions.build_KeyPath<A, B>(root:keyPath:)();
  swift_release();
  v115(v26, v23);
  LOBYTE(v122) = v100;
  char v50 = v91;
  static PredicateExpressions.build_Arg<A>(_:)();
  swift_getKeyPath();
  sub_10000949C(&qword_10007C1F0, &qword_10007C168);
  uint64_t v51 = v89;
  uint64_t v52 = v94;
  static PredicateExpressions.build_KeyPath<A, B>(root:keyPath:)();
  swift_release();
  (*(void (**)(char *, uint64_t))(v95 + 8))(v50, v52);
  sub_10000949C(&qword_10007C1F8, &qword_10007C170);
  v53 = v92;
  uint64_t v54 = v120;
  uint64_t v55 = v96;
  static PredicateExpressions.build_Equal<A, B>(lhs:rhs:)();
  (*(void (**)(char *, uint64_t))(v97 + 8))(v51, v55);
  ((void (*)(char *, uint64_t))v73)(v30, v54);
  sub_10000949C(&qword_10007C200, &qword_10007C1B0);
  sub_10000949C(&qword_10007C208, &qword_10007C178);
  uint64_t v56 = v83;
  uint64_t v57 = v118;
  uint64_t v58 = v86;
  uint64_t v59 = v98;
  static PredicateExpressions.build_Conjunction<A, B>(lhs:rhs:)();
  (*(void (**)(char *, uint64_t))(v99 + 8))(v53, v59);
  (*(void (**)(char *, uint64_t))(v87 + 8))(v57, v58);
  static PredicateExpressions.build_Arg<A>(_:)();
  swift_getKeyPath();
  v60 = v101;
  static PredicateExpressions.build_KeyPath<A, B>(root:keyPath:)();
  swift_release();
  v115(v26, v23);
  uint64_t v122 = v105;
  uint64_t v61 = v103;
  static PredicateExpressions.build_Arg<A>(_:)();
  sub_10000949C(&qword_10007C148, &qword_10007C118);
  sub_10000949C(&qword_10007C108, &qword_10007C0B8);
  uint64_t v62 = v102;
  uint64_t v63 = v104;
  uint64_t v64 = v107;
  static PredicateExpressions.build_Equal<A, B>(lhs:rhs:)();
  (*(void (**)(char *, uint64_t))(v108 + 8))(v61, v64);
  (*(void (**)(char *, uint64_t))(v106 + 8))(v60, v63);
  uint64_t v65 = sub_1000082E0(&qword_10007C210);
  uint64_t v66 = v111;
  v111[3] = v65;
  v66[4] = sub_100022990();
  sub_10001FA98(v66);
  sub_10000949C(&qword_10007C298, &qword_10007C1B8);
  sub_10000949C(&qword_10007C2A0, &qword_10007C128);
  uint64_t v67 = v56;
  uint64_t v68 = v90;
  uint64_t v69 = v109;
  static PredicateExpressions.build_Conjunction<A, B>(lhs:rhs:)();
  (*(void (**)(char *, uint64_t))(v110 + 8))(v62, v69);
  return (*(uint64_t (**)(char *, uint64_t))(v93 + 8))(v67, v68);
}

uint64_t sub_10001CA1C@<X0>(uint64_t a1@<X1>, uint64_t *a2@<X8>)
{
  uint64_t v17 = a1;
  uint64_t v3 = sub_1000082E0(&qword_10007C0B8);
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v18 = v3;
  uint64_t v19 = v4;
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_1000082E0(&qword_10007C110);
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_1000082E0(&qword_10007C118);
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  uint64_t v14 = (char *)&v17 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000949C(&qword_10007C120, &qword_10007C110);
  static PredicateExpressions.build_Arg<A>(_:)();
  swift_getKeyPath();
  static PredicateExpressions.build_KeyPath<A, B>(root:keyPath:)();
  swift_release();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  uint64_t v20 = v17;
  static PredicateExpressions.build_Arg<A>(_:)();
  a2[3] = sub_1000082E0(&qword_10007C128);
  a2[4] = sub_1000227E4();
  sub_10001FA98(a2);
  sub_10000949C(&qword_10007C148, &qword_10007C118);
  sub_10000949C(&qword_10007C108, &qword_10007C0B8);
  uint64_t v15 = v18;
  static PredicateExpressions.build_Equal<A, B>(lhs:rhs:)();
  (*(void (**)(char *, uint64_t))(v19 + 8))(v6, v15);
  return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v14, v11);
}

uint64_t sub_10001CD5C@<X0>(uint64_t a1@<X1>, uint64_t *a2@<X8>)
{
  uint64_t v17 = a1;
  uint64_t v3 = sub_1000082E0(&qword_10007C0B8);
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v18 = v3;
  uint64_t v19 = v4;
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_1000082E0(&qword_10007C0C0);
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_1000082E0(&qword_10007C0C8);
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  uint64_t v14 = (char *)&v17 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000949C(&qword_10007C0D0, &qword_10007C0C0);
  static PredicateExpressions.build_Arg<A>(_:)();
  swift_getKeyPath();
  static PredicateExpressions.build_KeyPath<A, B>(root:keyPath:)();
  swift_release();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  uint64_t v20 = v17;
  static PredicateExpressions.build_Arg<A>(_:)();
  a2[3] = sub_1000082E0(&qword_10007C0D8);
  a2[4] = sub_100022694();
  sub_10001FA98(a2);
  sub_10000949C(&qword_10007C100, &qword_10007C0C8);
  sub_10000949C(&qword_10007C108, &qword_10007C0B8);
  uint64_t v15 = v18;
  static PredicateExpressions.build_Equal<A, B>(lhs:rhs:)();
  (*(void (**)(char *, uint64_t))(v19 + 8))(v6, v15);
  return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v14, v11);
}

uint64_t sub_10001D09C()
{
  swift_release();

  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for AnalyticsStoreContext()
{
  return self;
}

ValueMetadata *type metadata accessor for AnalyticsSchemaV2.AnalyticsCounters._SwiftDataNoType()
{
  return &type metadata for AnalyticsSchemaV2.AnalyticsCounters._SwiftDataNoType;
}

ValueMetadata *type metadata accessor for AnalyticsSchemaV2.PipelineState._SwiftDataNoType()
{
  return &type metadata for AnalyticsSchemaV2.PipelineState._SwiftDataNoType;
}

ValueMetadata *type metadata accessor for AnalyticsSchemaV2.FileAnalytics._SwiftDataNoType()
{
  return &type metadata for AnalyticsSchemaV2.FileAnalytics._SwiftDataNoType;
}

ValueMetadata *type metadata accessor for AnalyticsSchemaV2()
{
  return &type metadata for AnalyticsSchemaV2;
}

ValueMetadata *type metadata accessor for AnalyticsSchemaV2.ProcessAnalytics._SwiftDataNoType()
{
  return &type metadata for AnalyticsSchemaV2.ProcessAnalytics._SwiftDataNoType;
}

ValueMetadata *type metadata accessor for AnalyticsSchemaV1.AnalyticsCounters._SwiftDataNoType()
{
  return &type metadata for AnalyticsSchemaV1.AnalyticsCounters._SwiftDataNoType;
}

ValueMetadata *type metadata accessor for AnalyticsSchemaV1.PipelineState._SwiftDataNoType()
{
  return &type metadata for AnalyticsSchemaV1.PipelineState._SwiftDataNoType;
}

ValueMetadata *type metadata accessor for AnalyticsSchemaV1.FileAnalytics._SwiftDataNoType()
{
  return &type metadata for AnalyticsSchemaV1.FileAnalytics._SwiftDataNoType;
}

ValueMetadata *type metadata accessor for AnalyticsSchemaV1()
{
  return &type metadata for AnalyticsSchemaV1;
}

ValueMetadata *type metadata accessor for AnalyticsSchemaV1.ProcessAnalytics._SwiftDataNoType()
{
  return &type metadata for AnalyticsSchemaV1.ProcessAnalytics._SwiftDataNoType;
}

uint64_t sub_10001D198(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_10001D3F0(a1, a2, a3, (void (*)(void))type metadata accessor for AnalyticsSchemaV1.ProcessAnalytics, (void (*)(uint64_t))sub_10000C6F8);
}

void (*sub_10001D1C8(void *a1))(uint64_t *a1, char a2)
{
  uint64_t v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[16] = v1;
  swift_beginAccess();
  sub_100008234(v1 + 16, (uint64_t)v3);
  return sub_10001D244;
}

void sub_10001D244(uint64_t *a1, char a2)
{
}

Swift::Int sub_10001D260(uint64_t a1, uint64_t a2)
{
  return sub_10001E250(a1, a2, (void (*)(void))type metadata accessor for AnalyticsSchemaV1.ProcessAnalytics, &qword_10007C008, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV1.ProcessAnalytics);
}

uint64_t sub_10001D2A8()
{
  return PersistentModel.hash(into:)();
}

Swift::Int sub_10001D300()
{
  return sub_10001E34C();
}

uint64_t sub_10001D318(uint64_t a1, uint64_t a2)
{
  return sub_10001E3F8(a1, a2, (void (*)(void))type metadata accessor for AnalyticsSchemaV1.ProcessAnalytics, &qword_10007C008, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV1.ProcessAnalytics);
}

uint64_t sub_10001D360()
{
  return static PersistentModel.== infix(_:_:)() & 1;
}

uint64_t sub_10001D3C4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_10001D3F0(a1, a2, a3, (void (*)(void))type metadata accessor for AnalyticsSchemaV1.FileAnalytics, (void (*)(uint64_t))sub_10000E2F0);
}

uint64_t sub_10001D3F0(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(void), void (*a5)(uint64_t))
{
  a4(0);
  uint64_t v7 = swift_allocObject();
  a5(a1);
  return v7;
}

uint64_t sub_10001D44C@<X0>(uint64_t a1@<X8>)
{
  swift_beginAccess();
  return sub_100008234(v1 + 16, a1);
}

uint64_t sub_10001D498(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t, uint64_t))
{
  uint64_t v7 = v4 + 16;
  swift_beginAccess();
  sub_100008540(v7);
  a4(a1, v7);
  return swift_endAccess();
}

void sub_10001D504(uint64_t *a1, char a2, void (*a3)(uint64_t, uint64_t))
{
  uint64_t v4 = (void *)*a1;
  uint64_t v5 = *a1 + 40;
  if (a2)
  {
    uint64_t v6 = v4[16] + 16;
    sub_100008234(*a1, v5);
    swift_beginAccess();
    sub_100008540(v6);
    a3(v5, v6);
    swift_endAccess();
    sub_100008540((uint64_t)v4);
  }
  else
  {
    uint64_t v7 = v4[16] + 16;
    swift_beginAccess();
    sub_100008540(v7);
    a3((uint64_t)v4, v7);
    swift_endAccess();
  }

  free(v4);
}

Swift::Int sub_10001D5EC(uint64_t a1, uint64_t a2)
{
  return sub_10001E250(a1, a2, (void (*)(void))type metadata accessor for AnalyticsSchemaV1.FileAnalytics, &qword_10007C028, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV1.FileAnalytics);
}

uint64_t sub_10001D634()
{
  return PersistentModel.hash(into:)();
}

Swift::Int sub_10001D68C()
{
  return sub_10001E34C();
}

uint64_t sub_10001D6A4(uint64_t a1, uint64_t a2)
{
  return sub_10001E3F8(a1, a2, (void (*)(void))type metadata accessor for AnalyticsSchemaV1.FileAnalytics, &qword_10007C028, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV1.FileAnalytics);
}

uint64_t sub_10001D6EC()
{
  return static PersistentModel.== infix(_:_:)() & 1;
}

uint64_t sub_10001D750(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_10001D3F0(a1, a2, a3, (void (*)(void))type metadata accessor for AnalyticsSchemaV1.PipelineState, (void (*)(uint64_t))sub_10000F028);
}

uint64_t sub_10001D780(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_10001DEF4(a1, a2, a3, (void (*)(uint64_t, uint64_t))sub_10001FA80);
}

void (*sub_10001D798(void *a1))(uint64_t *a1, char a2)
{
  uint64_t v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[16] = v1;
  swift_beginAccess();
  sub_100008234(v1 + 24, (uint64_t)v3);
  return sub_10001D814;
}

void sub_10001D814(uint64_t *a1, char a2)
{
}

uint64_t sub_10001D82C()
{
  return sub_100021EAC();
}

Swift::Int sub_10001D85C(uint64_t a1, uint64_t a2)
{
  return sub_10001E250(a1, a2, (void (*)(void))type metadata accessor for AnalyticsSchemaV1.PipelineState, &qword_10007C040, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV1.PipelineState);
}

uint64_t sub_10001D8A4()
{
  return PersistentModel.hash(into:)();
}

Swift::Int sub_10001D8FC()
{
  return sub_10001E34C();
}

uint64_t sub_10001D914(uint64_t a1, uint64_t a2)
{
  return sub_10001E3F8(a1, a2, (void (*)(void))type metadata accessor for AnalyticsSchemaV1.PipelineState, &qword_10007C040, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV1.PipelineState);
}

uint64_t sub_10001D95C()
{
  return static PersistentModel.== infix(_:_:)() & 1;
}

uint64_t sub_10001D9C0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_10001D3F0(a1, a2, a3, (void (*)(void))type metadata accessor for AnalyticsSchemaV1.AnalyticsCounters, (void (*)(uint64_t))sub_100011844);
}

Swift::Int sub_10001D9F0(uint64_t a1, uint64_t a2)
{
  return sub_10001E250(a1, a2, (void (*)(void))type metadata accessor for AnalyticsSchemaV1.AnalyticsCounters, &qword_10007C088, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV1.AnalyticsCounters);
}

uint64_t sub_10001DA38()
{
  return PersistentModel.hash(into:)();
}

Swift::Int sub_10001DA90()
{
  return sub_10001E34C();
}

uint64_t sub_10001DAA8(uint64_t a1, uint64_t a2)
{
  return sub_10001E3F8(a1, a2, (void (*)(void))type metadata accessor for AnalyticsSchemaV1.AnalyticsCounters, &qword_10007C088, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV1.AnalyticsCounters);
}

uint64_t sub_10001DAF0()
{
  return static PersistentModel.== infix(_:_:)() & 1;
}

uint64_t sub_10001DB54(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_10001D3F0(a1, a2, a3, (void (*)(void))type metadata accessor for AnalyticsSchemaV2.ProcessAnalytics, (void (*)(uint64_t))sub_1000132D4);
}

Swift::Int sub_10001DB84(uint64_t a1, uint64_t a2)
{
  return sub_10001E250(a1, a2, (void (*)(void))type metadata accessor for AnalyticsSchemaV2.ProcessAnalytics, &qword_10007BFC8, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV2.ProcessAnalytics);
}

uint64_t sub_10001DBCC()
{
  return PersistentModel.hash(into:)();
}

Swift::Int sub_10001DC24()
{
  return sub_10001E34C();
}

uint64_t sub_10001DC3C(uint64_t a1, uint64_t a2)
{
  return sub_10001E3F8(a1, a2, (void (*)(void))type metadata accessor for AnalyticsSchemaV2.ProcessAnalytics, &qword_10007BFC8, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV2.ProcessAnalytics);
}

uint64_t sub_10001DC84()
{
  return static PersistentModel.== infix(_:_:)() & 1;
}

uint64_t sub_10001DCE8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_10001D3F0(a1, a2, a3, (void (*)(void))type metadata accessor for AnalyticsSchemaV2.FileAnalytics, (void (*)(uint64_t))sub_100015354);
}

Swift::Int sub_10001DD18(uint64_t a1, uint64_t a2)
{
  return sub_10001E250(a1, a2, (void (*)(void))type metadata accessor for AnalyticsSchemaV2.FileAnalytics, &qword_10007BFD0, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV2.FileAnalytics);
}

uint64_t sub_10001DD60()
{
  return PersistentModel.hash(into:)();
}

Swift::Int sub_10001DDB8()
{
  return sub_10001E34C();
}

uint64_t sub_10001DDD0(uint64_t a1, uint64_t a2)
{
  return sub_10001E3F8(a1, a2, (void (*)(void))type metadata accessor for AnalyticsSchemaV2.FileAnalytics, &qword_10007BFD0, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV2.FileAnalytics);
}

uint64_t sub_10001DE18()
{
  return static PersistentModel.== infix(_:_:)() & 1;
}

uint64_t sub_10001DE7C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_10001D3F0(a1, a2, a3, (void (*)(void))type metadata accessor for AnalyticsSchemaV2.PipelineState, (void (*)(uint64_t))sub_1000164E4);
}

uint64_t sub_10001DEA8@<X0>(uint64_t a1@<X8>)
{
  swift_beginAccess();
  return sub_100008234(v1 + 24, a1);
}

uint64_t sub_10001DEF4(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t, uint64_t))
{
  uint64_t v7 = v4 + 24;
  swift_beginAccess();
  sub_100008540(v7);
  a4(a1, v7);
  return swift_endAccess();
}

void sub_10001DF60(uint64_t *a1, char a2, void (*a3)(uint64_t, uint64_t))
{
  uint64_t v4 = (void *)*a1;
  uint64_t v5 = *a1 + 40;
  if (a2)
  {
    uint64_t v6 = v4[16] + 24;
    sub_100008234(*a1, v5);
    swift_beginAccess();
    sub_100008540(v6);
    a3(v5, v6);
    swift_endAccess();
    sub_100008540((uint64_t)v4);
  }
  else
  {
    uint64_t v7 = v4[16] + 24;
    swift_beginAccess();
    sub_100008540(v7);
    a3((uint64_t)v4, v7);
    swift_endAccess();
  }

  free(v4);
}

uint64_t sub_10001E044()
{
  return sub_100021EAC();
}

Swift::Int sub_10001E074(uint64_t a1, uint64_t a2)
{
  return sub_10001E250(a1, a2, (void (*)(void))type metadata accessor for AnalyticsSchemaV2.PipelineState, &qword_10007BFD8, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV2.PipelineState);
}

uint64_t sub_10001E0BC()
{
  return PersistentModel.hash(into:)();
}

Swift::Int sub_10001E114()
{
  return sub_10001E34C();
}

uint64_t sub_10001E12C(uint64_t a1, uint64_t a2)
{
  return sub_10001E3F8(a1, a2, (void (*)(void))type metadata accessor for AnalyticsSchemaV2.PipelineState, &qword_10007BFD8, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV2.PipelineState);
}

uint64_t sub_10001E174()
{
  return static PersistentModel.== infix(_:_:)() & 1;
}

uint64_t sub_10001E1D8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_10001D3F0(a1, a2, a3, (void (*)(void))type metadata accessor for AnalyticsSchemaV2.AnalyticsCounters, (void (*)(uint64_t))sub_100018FF4);
}

Swift::Int sub_10001E208(uint64_t a1, uint64_t a2)
{
  return sub_10001E250(a1, a2, (void (*)(void))type metadata accessor for AnalyticsSchemaV2.AnalyticsCounters, &qword_10007BFE0, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV2.AnalyticsCounters);
}

Swift::Int sub_10001E250(uint64_t a1, uint64_t a2, void (*a3)(void), unint64_t *a4, void (*a5)(uint64_t))
{
  return Hasher._finalize()();
}

uint64_t sub_10001E2DC()
{
  return PersistentModel.hash(into:)();
}

Swift::Int sub_10001E334()
{
  return sub_10001E34C();
}

Swift::Int sub_10001E34C()
{
  return Hasher._finalize()();
}

uint64_t sub_10001E3B0(uint64_t a1, uint64_t a2)
{
  return sub_10001E3F8(a1, a2, (void (*)(void))type metadata accessor for AnalyticsSchemaV2.AnalyticsCounters, &qword_10007BFE0, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV2.AnalyticsCounters);
}

uint64_t sub_10001E3F8(uint64_t a1, uint64_t a2, void (*a3)(void), unint64_t *a4, void (*a5)(uint64_t))
{
  return PersistentModel.id.getter();
}

uint64_t sub_10001E468()
{
  return static PersistentModel.== infix(_:_:)() & 1;
}

uint64_t sub_10001E4CC()
{
  return sub_10001FF7C(&qword_10007BEB0, (void (*)(uint64_t))&type metadata accessor for PersistentIdentifier);
}

uint64_t sub_10001E4FC()
{
  return sub_100008298(&qword_10007BEB8, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV2.AnalyticsCounters);
}

uint64_t sub_10001E544()
{
  return sub_100008298(&qword_10007BEC0, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV2.AnalyticsCounters);
}

uint64_t sub_10001E58C()
{
  return sub_100008298(&qword_10007BEC8, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV2.AnalyticsCounters);
}

uint64_t sub_10001E5D4()
{
  return sub_100008298(&qword_10007BED0, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV2.AnalyticsCounters);
}

uint64_t sub_10001E61C()
{
  return sub_100008298(&qword_10007BED8, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV2.PipelineState);
}

uint64_t sub_10001E664()
{
  return sub_100008298(&qword_10007BEE0, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV2.PipelineState);
}

uint64_t sub_10001E6AC()
{
  return sub_100008298(&qword_10007BEE8, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV2.PipelineState);
}

uint64_t sub_10001E6F4()
{
  return sub_100008298(&qword_10007BEF0, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV2.PipelineState);
}

uint64_t sub_10001E73C()
{
  return sub_100008298(&qword_10007BEF8, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV2.FileAnalytics);
}

uint64_t sub_10001E784()
{
  return sub_100008298(&qword_10007BF00, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV2.FileAnalytics);
}

uint64_t sub_10001E7CC()
{
  return sub_100008298(&qword_10007BF08, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV2.FileAnalytics);
}

uint64_t sub_10001E814()
{
  return sub_100008298(&qword_10007BF10, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV2.FileAnalytics);
}

uint64_t sub_10001E85C()
{
  return sub_100008298(&qword_10007BF18, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV2.ProcessAnalytics);
}

uint64_t sub_10001E8A4()
{
  return sub_100008298(&qword_10007BF20, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV2.ProcessAnalytics);
}

uint64_t sub_10001E8EC()
{
  return sub_100008298(&qword_10007BF28, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV2.ProcessAnalytics);
}

uint64_t sub_10001E934()
{
  return sub_100008298(&qword_10007BF30, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV2.ProcessAnalytics);
}

uint64_t sub_10001E97C()
{
  return sub_100008298(&qword_10007BF38, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV1.AnalyticsCounters);
}

uint64_t sub_10001E9C4()
{
  return sub_100008298(&qword_10007BF40, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV1.AnalyticsCounters);
}

uint64_t sub_10001EA0C()
{
  return sub_100008298(&qword_10007BF48, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV1.AnalyticsCounters);
}

uint64_t sub_10001EA54()
{
  return sub_100008298(&qword_10007BF50, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV1.AnalyticsCounters);
}

uint64_t sub_10001EA9C()
{
  return sub_100008298(&qword_10007BF58, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV1.PipelineState);
}

uint64_t sub_10001EAE4()
{
  return sub_100008298(&qword_10007BF60, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV1.PipelineState);
}

uint64_t sub_10001EB2C()
{
  return sub_100008298(&qword_10007BF68, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV1.PipelineState);
}

uint64_t sub_10001EB74()
{
  return sub_100008298(&qword_10007BF70, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV1.PipelineState);
}

uint64_t sub_10001EBBC()
{
  return sub_100008298(&qword_10007BF78, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV1.FileAnalytics);
}

uint64_t sub_10001EC04()
{
  return sub_100008298(&qword_10007BF80, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV1.FileAnalytics);
}

uint64_t sub_10001EC4C()
{
  return sub_100008298(&qword_10007BF88, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV1.FileAnalytics);
}

uint64_t sub_10001EC94()
{
  return sub_100008298(&qword_10007BF90, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV1.FileAnalytics);
}

uint64_t sub_10001ECDC()
{
  return sub_100008298(&qword_10007BF98, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV1.ProcessAnalytics);
}

uint64_t sub_10001ED24()
{
  return sub_100008298(&qword_10007BFA0, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV1.ProcessAnalytics);
}

uint64_t sub_10001ED6C()
{
  return sub_100008298(&qword_10007BFA8, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV1.ProcessAnalytics);
}

uint64_t sub_10001EDB4()
{
  return sub_100008298(&qword_10007BFB0, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV1.ProcessAnalytics);
}

uint64_t sub_10001EDFC(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_10001EE24(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6 = a4();
  sub_10001EE9C(v6, v7, a3);
  uint64_t v8 = *a1 + 8;
  UnsafeMutableRawBufferPointer.copyMemory(from:)();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v8;
  return result;
}

uint64_t sub_10001EE9C(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_10001EF70(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_10001F5C4((uint64_t)v12, *a3);
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
      sub_10001F5C4((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_100008540((uint64_t)v12);
  return v7;
}

uint64_t sub_10001EF70(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            UnsafeMutableRawBufferPointer.subscript.setter();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_10001F12C(a5, a6);
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
  uint64_t v8 = _StringObject.sharedUTF8.getter();
  if (!v8)
  {
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
LABEL_17:
    uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
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

uint64_t sub_10001F12C(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_10001F1C4(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_10001F420(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_10001F420(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_10001F1C4(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_10001F33C(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = _StringGuts.copyUTF8(into:)();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      _assertionFailure(_:_:file:line:flags:)();
      __break(1u);
LABEL_10:
      uint64_t v2 = String.UTF8View._foreignCount()();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    _fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)_assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_10001F33C(uint64_t a1, uint64_t a2)
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
  sub_1000082E0(&qword_10007BFF8);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_10001F3A4(unsigned __int16 a1, uint64_t a2, uint64_t a3)
{
  char v3 = a1;
  uint64_t v4 = a1 >> 14;
  if ((a3 & 0x1000000000000000) == 0 || (a2 & 0x800000000000000) != 0)
  {
    uint64_t v10 = String.UTF16View.index(_:offsetBy:)();
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
    uint64_t v5 = String.UTF8View._foreignIndex(_:offsetBy:)();
    uint64_t v6 = v5 + (v4 << 16);
    unint64_t v7 = v5 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    unint64_t v8 = v6 & 0xFFFFFFFFFFFF0000;
    if (!v4) {
      unint64_t v8 = v7;
    }
    return v8 | 8;
  }
}

uint64_t sub_10001F420(char a1, int64_t a2, char a3, char *a4)
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
    sub_1000082E0(&qword_10007BFF8);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  unint64_t v12 = v10 + 32;
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
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

unint64_t sub_10001F570()
{
  unint64_t result = qword_10007BFE8;
  if (!qword_10007BFE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007BFE8);
  }
  return result;
}

uint64_t sub_10001F5C4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_10001F624()
{
  sub_1000082E0(&qword_10007BFC0);
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_1000569F0;
  uint64_t v1 = type metadata accessor for AnalyticsSchemaV1.ProcessAnalytics(0);
  uint64_t v2 = sub_100008298(&qword_10007C008, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV1.ProcessAnalytics);
  *(void *)(v0 + 32) = v1;
  *(void *)(v0 + 40) = v2;
  uint64_t v3 = type metadata accessor for AnalyticsSchemaV1.FileAnalytics(0);
  uint64_t v4 = sub_100008298(&qword_10007C028, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV1.FileAnalytics);
  *(void *)(v0 + 48) = v3;
  *(void *)(v0 + 56) = v4;
  uint64_t v5 = type metadata accessor for AnalyticsSchemaV1.PipelineState(0);
  uint64_t v6 = sub_100008298(&qword_10007C040, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV1.PipelineState);
  *(void *)(v0 + 64) = v5;
  *(void *)(v0 + 72) = v6;
  uint64_t v7 = type metadata accessor for AnalyticsSchemaV1.AnalyticsCounters(0);
  uint64_t v8 = sub_100008298(&qword_10007C088, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV1.AnalyticsCounters);
  *(void *)(v0 + 80) = v7;
  *(void *)(v0 + 88) = v8;
  return v0;
}

uint64_t sub_10001F77C()
{
  sub_1000082E0(&qword_10007C000);
  type metadata accessor for Schema.PropertyMetadata();
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_1000569F0;
  swift_getKeyPath();
  Schema.PropertyMetadata.init(name:keypath:defaultValue:metadata:)();
  swift_getKeyPath();
  Schema.PropertyMetadata.init(name:keypath:defaultValue:metadata:)();
  swift_getKeyPath();
  Schema.PropertyMetadata.init(name:keypath:defaultValue:metadata:)();
  swift_getKeyPath();
  Schema.PropertyMetadata.init(name:keypath:defaultValue:metadata:)();
  return v0;
}

uint64_t sub_10001F998()
{
  return sub_10000C650();
}

uint64_t sub_10001F9B4()
{
  return sub_10000C2CC();
}

uint64_t sub_10001F9D0()
{
  return sub_100014458(v0[2], v0[3], v0[4], (uint64_t)&unk_100057740, &qword_10007C008, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV1.ProcessAnalytics);
}

uint64_t sub_10001FA28()
{
  return sub_100014458(v0[2], v0[3], v0[4], (uint64_t)&unk_100057718, &qword_10007C008, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV1.ProcessAnalytics);
}

uint64_t sub_10001FA80(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t *sub_10001FA98(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t sub_10001FAFC()
{
  sub_1000082E0(&qword_10007C000);
  type metadata accessor for Schema.PropertyMetadata();
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_100056A00;
  swift_getKeyPath();
  sub_1000082E0(&qword_10007C018);
  type metadata accessor for Schema.Attribute.Option();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_1000569E0;
  static Schema.Attribute.Option.unique.getter();
  type metadata accessor for Schema.Attribute();
  swift_allocObject();
  Schema.Attribute.init(_:originalName:hashModifier:)();
  sub_10001FF7C(&qword_10007C020, (void (*)(uint64_t))&type metadata accessor for Schema.Attribute);
  Schema.PropertyMetadata.init(name:keypath:defaultValue:metadata:)();
  swift_getKeyPath();
  Schema.PropertyMetadata.init(name:keypath:defaultValue:metadata:)();
  swift_getKeyPath();
  Schema.PropertyMetadata.init(name:keypath:defaultValue:metadata:)();
  swift_getKeyPath();
  Schema.PropertyMetadata.init(name:keypath:defaultValue:metadata:)();
  swift_getKeyPath();
  Schema.PropertyMetadata.init(name:keypath:defaultValue:metadata:)();
  swift_getKeyPath();
  Schema.PropertyMetadata.init(name:keypath:defaultValue:metadata:)();
  swift_getKeyPath();
  Schema.PropertyMetadata.init(name:keypath:defaultValue:metadata:)();
  swift_getKeyPath();
  Schema.PropertyMetadata.init(name:keypath:defaultValue:metadata:)();
  swift_getKeyPath();
  Schema.PropertyMetadata.init(name:keypath:defaultValue:metadata:)();
  return v0;
}

uint64_t sub_10001FF7C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_10001FFE4@<X0>(_DWORD *a1@<X8>)
{
  return sub_10000D910(a1);
}

uint64_t sub_100020004()
{
  return sub_10000DA18();
}

uint64_t sub_100020038@<X0>(_DWORD *a1@<X8>)
{
  return sub_10000D910(a1);
}

uint64_t sub_100020058()
{
  return sub_10000DA18();
}

uint64_t sub_10002009C()
{
  return sub_10000E248();
}

uint64_t sub_1000200B8()
{
  return sub_10000DEC4();
}

uint64_t sub_1000200D4()
{
  return sub_100014BB8(*(void *)(v0 + 16), *(unsigned int *)(v0 + 24), (uint64_t)&unk_1000578A8, &qword_10007C028, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV1.FileAnalytics);
}

uint64_t sub_10002012C()
{
  return sub_100014BB8(*(void *)(v0 + 16), *(unsigned int *)(v0 + 24), (uint64_t)&unk_100057880, &qword_10007C028, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV1.FileAnalytics);
}

uint64_t sub_100020184()
{
  return sub_10000D85C();
}

uint64_t sub_1000201A0()
{
  return sub_100014458(v0[2], v0[3], v0[4], (uint64_t)&unk_100057830, &qword_10007C028, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV1.FileAnalytics);
}

uint64_t sub_1000201F8()
{
  return sub_100014458(v0[2], v0[3], v0[4], (uint64_t)&unk_100057808, &qword_10007C028, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV1.FileAnalytics);
}

uint64_t sub_100020250()
{
  return sub_100014458(v0[2], v0[3], v0[4], (uint64_t)&unk_1000577E0, &qword_10007C028, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV1.FileAnalytics);
}

uint64_t sub_1000202A8()
{
  return sub_10000CBE4();
}

uint64_t sub_1000202DC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000082E0(&qword_10007C038);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100020344()
{
  return sub_100016158(*(void *)(v0 + 16), *(void *)(v0 + 24), (uint64_t)&unk_100057970, &qword_10007C040, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV1.PipelineState);
}

uint64_t sub_100020398(uint64_t a1)
{
  uint64_t v2 = sub_1000082E0(&qword_10007C038);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1000203F8(unint64_t *a1, unint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_10000B1E0(&qword_10007C038);
    sub_100008298(a2, (void (*)(uint64_t))&type metadata accessor for Date);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_10002048C()
{
  return sub_100015C8C(*(void *)(v0 + 16), *(void *)(v0 + 24), *(unsigned __int8 *)(v0 + 32), (uint64_t)&unk_100057948, &qword_10007C040, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV1.PipelineState);
}

uint64_t sub_1000204E4(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_10000B1E0(&qword_10007C070);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100020548()
{
  return sub_10000E88C();
}

uint64_t sub_100020564()
{
  sub_1000082E0(&qword_10007C000);
  type metadata accessor for Schema.PropertyMetadata();
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_100056A10;
  swift_getKeyPath();
  Schema.PropertyMetadata.init(name:keypath:defaultValue:metadata:)();
  swift_getKeyPath();
  Schema.PropertyMetadata.init(name:keypath:defaultValue:metadata:)();
  swift_getKeyPath();
  Schema.PropertyMetadata.init(name:keypath:defaultValue:metadata:)();
  swift_getKeyPath();
  Schema.PropertyMetadata.init(name:keypath:defaultValue:metadata:)();
  swift_getKeyPath();
  Schema.PropertyMetadata.init(name:keypath:defaultValue:metadata:)();
  swift_getKeyPath();
  Schema.PropertyMetadata.init(name:keypath:defaultValue:metadata:)();
  swift_getKeyPath();
  Schema.PropertyMetadata.init(name:keypath:defaultValue:metadata:)();
  swift_getKeyPath();
  Schema.PropertyMetadata.init(name:keypath:defaultValue:metadata:)();
  swift_getKeyPath();
  Schema.PropertyMetadata.init(name:keypath:defaultValue:metadata:)();
  swift_getKeyPath();
  Schema.PropertyMetadata.init(name:keypath:defaultValue:metadata:)();
  swift_getKeyPath();
  Schema.PropertyMetadata.init(name:keypath:defaultValue:metadata:)();
  return v0;
}

uint64_t sub_100020A3C()
{
  return sub_10001179C();
}

uint64_t sub_100020A58()
{
  return sub_100011418();
}

uint64_t sub_100020A74()
{
  return sub_100011094();
}

uint64_t sub_100020A90()
{
  return sub_100010D10();
}

uint64_t sub_100020AAC()
{
  return sub_10001098C();
}

uint64_t sub_100020AC8()
{
  return sub_100010608();
}

uint64_t sub_100020AE4()
{
  return sub_100010284();
}

uint64_t sub_100020B00()
{
  return sub_10000FF00();
}

uint64_t sub_100020B1C()
{
  return sub_10000FB7C();
}

uint64_t sub_100020B38()
{
  return sub_10000F7F8();
}

uint64_t sub_100020B54()
{
  return sub_10000F474();
}

uint64_t sub_100020B70()
{
  sub_1000082E0(&qword_10007BFC0);
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_1000569F0;
  uint64_t v1 = type metadata accessor for AnalyticsSchemaV2.ProcessAnalytics(0);
  uint64_t v2 = sub_100008298(&qword_10007BFC8, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV2.ProcessAnalytics);
  *(void *)(v0 + 32) = v1;
  *(void *)(v0 + 40) = v2;
  uint64_t v3 = type metadata accessor for AnalyticsSchemaV2.FileAnalytics(0);
  uint64_t v4 = sub_100008298(&qword_10007BFD0, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV2.FileAnalytics);
  *(void *)(v0 + 48) = v3;
  *(void *)(v0 + 56) = v4;
  uint64_t v5 = type metadata accessor for AnalyticsSchemaV2.PipelineState(0);
  uint64_t v6 = sub_100008298(&qword_10007BFD8, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV2.PipelineState);
  *(void *)(v0 + 64) = v5;
  *(void *)(v0 + 72) = v6;
  uint64_t v7 = type metadata accessor for AnalyticsSchemaV2.AnalyticsCounters(0);
  uint64_t v8 = sub_100008298(&qword_10007BFE0, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV2.AnalyticsCounters);
  *(void *)(v0 + 80) = v7;
  *(void *)(v0 + 88) = v8;
  return v0;
}

uint64_t sub_100020CC8()
{
  sub_1000082E0(&qword_10007C000);
  type metadata accessor for Schema.PropertyMetadata();
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_100056A20;
  swift_getKeyPath();
  Schema.PropertyMetadata.init(name:keypath:defaultValue:metadata:)();
  swift_getKeyPath();
  Schema.PropertyMetadata.init(name:keypath:defaultValue:metadata:)();
  swift_getKeyPath();
  Schema.PropertyMetadata.init(name:keypath:defaultValue:metadata:)();
  swift_getKeyPath();
  Schema.PropertyMetadata.init(name:keypath:defaultValue:metadata:)();
  swift_getKeyPath();
  Schema.PropertyMetadata.init(name:keypath:defaultValue:metadata:)();
  return v0;
}

uint64_t sub_100020F4C()
{
  return sub_100012E60();
}

uint64_t sub_100020F68()
{
  return sub_100012ADC();
}

uint64_t sub_100020F84()
{
  return sub_100014458(v0[2], v0[3], v0[4], (uint64_t)&unk_100057BA0, &qword_10007BFC8, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV2.ProcessAnalytics);
}

uint64_t sub_100020FDC()
{
  return sub_100014458(v0[2], v0[3], v0[4], (uint64_t)&unk_100057B78, &qword_10007BFC8, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV2.ProcessAnalytics);
}

uint64_t sub_100021034()
{
  return sub_100014458(v0[2], v0[3], v0[4], (uint64_t)&unk_100057B50, &qword_10007BFC8, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV2.ProcessAnalytics);
}

uint64_t sub_10002108C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, char a7)
{
  uint64_t v8 = v7;
  int64_t v9 = (uint64_t *)(v7 + 16);
  uint64_t v10 = type metadata accessor for AnalyticsSchemaV2.FileAnalytics(0);
  *(void *)(v8 + 40) = sub_1000082E0(&qword_10007C0A0);
  v13[0] = v10;
  v13[1] = v10;
  uint64_t v14 = sub_100008298(&qword_10007BFD0, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV2.FileAnalytics);
  uint64_t v15 = v14;
  *(void *)(v8 + 48) = swift_getOpaqueTypeConformance2();
  sub_10001FA98(v9);
  static PersistentModel.createBackingData<A>()();
  ObservationRegistrar.init()();
  sub_100008234((uint64_t)v9, (uint64_t)v13);
  sub_10000B090(v13, v15);
  swift_getKeyPath();
  dispatch thunk of BackingData.setValue<A>(forKey:to:)();
  swift_release();
  sub_100008540((uint64_t)v13);
  sub_100008234((uint64_t)v9, (uint64_t)v13);
  sub_10000B090(v13, v15);
  swift_getKeyPath();
  dispatch thunk of BackingData.setValue<A>(forKey:to:)();
  swift_bridgeObjectRelease();
  swift_release();
  sub_100008540((uint64_t)v13);
  sub_100008234((uint64_t)v9, (uint64_t)v13);
  sub_10000B090(v13, v15);
  swift_getKeyPath();
  dispatch thunk of BackingData.setValue<A>(forKey:to:)();
  swift_bridgeObjectRelease();
  swift_release();
  sub_100008540((uint64_t)v13);
  sub_100008234((uint64_t)v9, (uint64_t)v13);
  sub_10000B090(v13, v15);
  swift_getKeyPath();
  dispatch thunk of BackingData.setValue<A>(forKey:to:)();
  swift_bridgeObjectRelease();
  swift_release();
  sub_100008540((uint64_t)v13);
  sub_10004CCB8(a7);
  sub_100008234((uint64_t)v9, (uint64_t)v13);
  sub_10000B090(v13, v15);
  swift_getKeyPath();
  dispatch thunk of BackingData.setValue<A>(forKey:to:)();
  swift_bridgeObjectRelease();
  swift_release();
  sub_100008540((uint64_t)v13);
  sub_100008234((uint64_t)v9, (uint64_t)v13);
  sub_10000B090(v13, v15);
  swift_getKeyPath();
  dispatch thunk of BackingData.setValue<A>(forKey:to:)();
  swift_release();
  sub_100008540((uint64_t)v13);
  sub_100008234((uint64_t)v9, (uint64_t)v13);
  sub_10000B090(v13, v15);
  swift_getKeyPath();
  dispatch thunk of BackingData.setValue<A>(forKey:to:)();
  swift_release();
  sub_100008540((uint64_t)v13);
  sub_100008234((uint64_t)v9, (uint64_t)v13);
  sub_10000B090(v13, v15);
  swift_getKeyPath();
  dispatch thunk of BackingData.setValue<A>(forKey:to:)();
  swift_release();
  sub_100008540((uint64_t)v13);
  sub_100008234((uint64_t)v9, (uint64_t)v13);
  sub_10000B090(v13, v15);
  swift_getKeyPath();
  dispatch thunk of BackingData.setValue<A>(forKey:to:)();
  swift_release();
  sub_100008540((uint64_t)v13);
  sub_100008234((uint64_t)v9, (uint64_t)v13);
  sub_10000B090(v13, v15);
  swift_getKeyPath();
  dispatch thunk of BackingData.setValue<A>(forKey:to:)();
  swift_release();
  sub_100008540((uint64_t)v13);
  return v8;
}

uint64_t sub_100021680()
{
  sub_1000082E0(&qword_10007C000);
  type metadata accessor for Schema.PropertyMetadata();
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_100056A30;
  swift_getKeyPath();
  sub_1000082E0(&qword_10007C018);
  type metadata accessor for Schema.Attribute.Option();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_1000569E0;
  static Schema.Attribute.Option.unique.getter();
  type metadata accessor for Schema.Attribute();
  swift_allocObject();
  Schema.Attribute.init(_:originalName:hashModifier:)();
  sub_10001FF7C(&qword_10007C020, (void (*)(uint64_t))&type metadata accessor for Schema.Attribute);
  Schema.PropertyMetadata.init(name:keypath:defaultValue:metadata:)();
  swift_getKeyPath();
  Schema.PropertyMetadata.init(name:keypath:defaultValue:metadata:)();
  swift_getKeyPath();
  Schema.PropertyMetadata.init(name:keypath:defaultValue:metadata:)();
  swift_getKeyPath();
  Schema.PropertyMetadata.init(name:keypath:defaultValue:metadata:)();
  swift_getKeyPath();
  Schema.PropertyMetadata.init(name:keypath:defaultValue:metadata:)();
  swift_getKeyPath();
  Schema.PropertyMetadata.init(name:keypath:defaultValue:metadata:)();
  swift_getKeyPath();
  Schema.PropertyMetadata.init(name:keypath:defaultValue:metadata:)();
  swift_getKeyPath();
  Schema.PropertyMetadata.init(name:keypath:defaultValue:metadata:)();
  swift_getKeyPath();
  Schema.PropertyMetadata.init(name:keypath:defaultValue:metadata:)();
  swift_getKeyPath();
  Schema.PropertyMetadata.init(name:keypath:defaultValue:metadata:)();
  return v0;
}

uint64_t sub_100021B74@<X0>(_DWORD *a1@<X8>)
{
  return sub_100014888(a1);
}

uint64_t sub_100021B94()
{
  return sub_1000149B0();
}

uint64_t sub_100021BC8@<X0>(_DWORD *a1@<X8>)
{
  return sub_100014888(a1);
}

uint64_t sub_100021BE8()
{
  return sub_1000149B0();
}

uint64_t sub_100021C2C()
{
  return sub_1000152AC();
}

uint64_t sub_100021C48()
{
  return sub_100014F28();
}

uint64_t sub_100021C64()
{
  return sub_100014BB8(*(void *)(v0 + 16), *(unsigned int *)(v0 + 24), (uint64_t)&unk_100057D30, &qword_10007BFD0, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV2.FileAnalytics);
}

uint64_t sub_100021CBC()
{
  return sub_100014BB8(*(void *)(v0 + 16), *(unsigned int *)(v0 + 24), (uint64_t)&unk_100057D08, &qword_10007BFD0, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV2.FileAnalytics);
}

uint64_t sub_100021D14()
{
  return sub_1000147D4();
}

uint64_t sub_100021D30()
{
  return sub_100014458(v0[2], v0[3], v0[4], (uint64_t)&unk_100057CB8, &qword_10007BFD0, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV2.FileAnalytics);
}

uint64_t sub_100021D88()
{
  return sub_100014458(v0[2], v0[3], v0[4], (uint64_t)&unk_100057C90, &qword_10007BFD0, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV2.FileAnalytics);
}

uint64_t sub_100021DE0()
{
  return sub_100014458(v0[2], v0[3], v0[4], (uint64_t)&unk_100057C68, &qword_10007BFD0, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV2.FileAnalytics);
}

uint64_t sub_100021E38()
{
  return sub_100014458(v0[2], v0[3], v0[4], (uint64_t)&unk_100057C40, &qword_10007BFD0, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV2.FileAnalytics);
}

uint64_t sub_100021E90()
{
  return sub_1000137C0();
}

uint64_t sub_100021EAC()
{
  sub_1000082E0(&qword_10007C000);
  type metadata accessor for Schema.PropertyMetadata();
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_100056A40;
  swift_getKeyPath();
  Schema.PropertyMetadata.init(name:keypath:defaultValue:metadata:)();
  swift_getKeyPath();
  Schema.PropertyMetadata.init(name:keypath:defaultValue:metadata:)();
  swift_getKeyPath();
  Schema.PropertyMetadata.init(name:keypath:defaultValue:metadata:)();
  return v0;
}

uint64_t sub_10002207C()
{
  return sub_100016158(*(void *)(v0 + 16), *(void *)(v0 + 24), (uint64_t)&unk_100057DF8, &qword_10007BFD8, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV2.PipelineState);
}

uint64_t sub_1000220D0()
{
  return sub_100015C8C(*(void *)(v0 + 16), *(void *)(v0 + 24), *(unsigned __int8 *)(v0 + 32), (uint64_t)&unk_100057DD0, &qword_10007BFD8, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV2.PipelineState);
}

uint64_t sub_100022128()
{
  return sub_10001584C();
}

uint64_t sub_100022144()
{
  sub_1000082E0(&qword_10007C000);
  type metadata accessor for Schema.PropertyMetadata();
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_100056A50;
  swift_getKeyPath();
  Schema.PropertyMetadata.init(name:keypath:defaultValue:metadata:)();
  swift_getKeyPath();
  Schema.PropertyMetadata.init(name:keypath:defaultValue:metadata:)();
  swift_getKeyPath();
  Schema.PropertyMetadata.init(name:keypath:defaultValue:metadata:)();
  swift_getKeyPath();
  Schema.PropertyMetadata.init(name:keypath:defaultValue:metadata:)();
  swift_getKeyPath();
  Schema.PropertyMetadata.init(name:keypath:defaultValue:metadata:)();
  swift_getKeyPath();
  Schema.PropertyMetadata.init(name:keypath:defaultValue:metadata:)();
  swift_getKeyPath();
  Schema.PropertyMetadata.init(name:keypath:defaultValue:metadata:)();
  swift_getKeyPath();
  Schema.PropertyMetadata.init(name:keypath:defaultValue:metadata:)();
  swift_getKeyPath();
  Schema.PropertyMetadata.init(name:keypath:defaultValue:metadata:)();
  swift_getKeyPath();
  Schema.PropertyMetadata.init(name:keypath:defaultValue:metadata:)();
  swift_getKeyPath();
  Schema.PropertyMetadata.init(name:keypath:defaultValue:metadata:)();
  swift_getKeyPath();
  Schema.PropertyMetadata.init(name:keypath:defaultValue:metadata:)();
  return v0;
}

uint64_t sub_100022678()
{
  return sub_100017BB4();
}

unint64_t sub_100022694()
{
  unint64_t result = qword_10007C0E0;
  if (!qword_10007C0E0)
  {
    sub_10000B1E0(&qword_10007C0D8);
    sub_100022750(&qword_10007C0E8, &qword_10007C0C8, &qword_10007C0F0, &qword_10007C0C0);
    sub_100022C08(&qword_10007C0F8, &qword_10007C0B8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007C0E0);
  }
  return result;
}

uint64_t sub_100022750(unint64_t *a1, uint64_t *a2, unint64_t *a3, uint64_t *a4)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_10000B1E0(a2);
    sub_10000949C(a3, a4);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_1000227E4()
{
  unint64_t result = qword_10007C130;
  if (!qword_10007C130)
  {
    sub_10000B1E0(&qword_10007C128);
    sub_100022750(&qword_10007C138, &qword_10007C118, &qword_10007C140, &qword_10007C110);
    sub_100022C08(&qword_10007C0F8, &qword_10007C0B8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007C130);
  }
  return result;
}

uint64_t sub_1000228A0@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_10001B984(a1, *(void *)(v2 + 16), *(void **)(v2 + 24), *(unsigned __int8 *)(v2 + 32), *(unsigned __int8 *)(v2 + 33), *(void *)(v2 + 40), a2);
}

unsigned char *sub_1000228B4@<X0>(unsigned char *result@<X0>, uint64_t *a2@<X8>)
{
  unint64_t v2 = 0xE400000000000000;
  uint64_t v3 = 1684104562;
  switch(*result)
  {
    case 1:
      unint64_t v2 = 0xE500000000000000;
      uint64_t v3 = 0x6574697277;
      goto LABEL_3;
    case 2:
      *a2 = 0x657461657263;
      a2[1] = 0xE600000000000000;
      break;
    case 3:
      *a2 = 0xD000000000000015;
      a2[1] = 0x800000010005AC20;
      break;
    case 4:
      *a2 = 0x6E776F6E6B6E75;
      a2[1] = 0xE700000000000000;
      break;
    default:
LABEL_3:
      *a2 = v3;
      a2[1] = v2;
      break;
  }
  return result;
}

unint64_t sub_100022964@<X0>(char *a1@<X0>, unint64_t *a2@<X8>)
{
  unint64_t result = sub_10004CCB8(*a1);
  *a2 = result;
  a2[1] = v4;
  return result;
}

unint64_t sub_100022990()
{
  unint64_t result = qword_10007C218;
  if (!qword_10007C218)
  {
    sub_10000B1E0(&qword_10007C210);
    sub_100022A0C();
    sub_1000227E4();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007C218);
  }
  return result;
}

unint64_t sub_100022A0C()
{
  unint64_t result = qword_10007C220;
  if (!qword_10007C220)
  {
    sub_10000B1E0(&qword_10007C1B8);
    sub_100022AAC();
    sub_100022DC4(&qword_10007C270, &qword_10007C178, (void (*)(void))sub_100022E64);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007C220);
  }
  return result;
}

unint64_t sub_100022AAC()
{
  unint64_t result = qword_10007C228;
  if (!qword_10007C228)
  {
    sub_10000B1E0(&qword_10007C1B0);
    sub_100022B4C();
    sub_100022DC4(&qword_10007C248, &qword_10007C190, (void (*)(void))sub_100022C78);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007C228);
  }
  return result;
}

unint64_t sub_100022B4C()
{
  unint64_t result = qword_10007C230;
  if (!qword_10007C230)
  {
    sub_10000B1E0(&qword_10007C1A8);
    sub_100022750(&qword_10007C238, &qword_10007C1A0, &qword_10007C140, &qword_10007C110);
    sub_100022C08(&qword_10007C240, &qword_10007C198);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007C230);
  }
  return result;
}

uint64_t sub_100022C08(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_10000B1E0(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100022C78()
{
  return sub_100022E8C(&qword_10007C250, &qword_10007C188, (void (*)(void))sub_100022CA0);
}

unint64_t sub_100022CA0()
{
  unint64_t result = qword_10007C258;
  if (!qword_10007C258)
  {
    sub_10000B1E0(&qword_10007C180);
    sub_100022D1C();
    sub_100022D70();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007C258);
  }
  return result;
}

unint64_t sub_100022D1C()
{
  unint64_t result = qword_10007C260;
  if (!qword_10007C260)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007C260);
  }
  return result;
}

unint64_t sub_100022D70()
{
  unint64_t result = qword_10007C268;
  if (!qword_10007C268)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007C268);
  }
  return result;
}

uint64_t sub_100022DC4(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_10000B1E0(a2);
    sub_100022750(&qword_10007C238, &qword_10007C1A0, &qword_10007C140, &qword_10007C110);
    a3();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100022E64()
{
  return sub_100022E8C(&qword_10007C278, &qword_10007C170, (void (*)(void))sub_100022F04);
}

uint64_t sub_100022E8C(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_10000B1E0(a2);
    a3();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_100022F04()
{
  unint64_t result = qword_10007C280;
  if (!qword_10007C280)
  {
    sub_10000B1E0(&qword_10007C168);
    sub_100022F80();
    sub_100022FD4();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007C280);
  }
  return result;
}

unint64_t sub_100022F80()
{
  unint64_t result = qword_10007C288;
  if (!qword_10007C288)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007C288);
  }
  return result;
}

unint64_t sub_100022FD4()
{
  unint64_t result = qword_10007C290;
  if (!qword_10007C290)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007C290);
  }
  return result;
}

ValueMetadata *type metadata accessor for AnalyticsMigrationPlan()
{
  return &type metadata for AnalyticsMigrationPlan;
}

unint64_t sub_100023038()
{
  unint64_t result = qword_10007C2E0;
  if (!qword_10007C2E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007C2E0);
  }
  return result;
}

unint64_t sub_10002308C()
{
  unint64_t result = qword_10007C2E8;
  if (!qword_10007C2E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007C2E8);
  }
  return result;
}

uint64_t sub_1000230E0()
{
  return sub_1000220D0();
}

uint64_t sub_1000230F8()
{
  return sub_100008988();
}

uint64_t sub_100023110()
{
  return sub_10000896C();
}

uint64_t sub_100023128()
{
  return sub_1000047C0();
}

uint64_t sub_100023140()
{
  return sub_1000044B0();
}

uint64_t sub_100023158()
{
  return sub_1000043EC();
}

uint64_t sub_100023170()
{
  return sub_100004884();
}

uint64_t sub_100023188()
{
  return sub_100004574();
}

uint64_t sub_1000231A0()
{
  return sub_100004328();
}

uint64_t sub_1000231B8()
{
  return sub_100004948();
}

uint64_t sub_1000231D0()
{
  return sub_1000046FC();
}

uint64_t sub_1000231E8()
{
  return sub_100004638();
}

uint64_t sub_100023200()
{
  return sub_100020F68();
}

uint64_t sub_100023218()
{
  return sub_10002207C();
}

uint64_t sub_100023248()
{
  uint64_t v1 = type metadata accessor for String.Encoding();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  unint64_t v4 = (char *)&v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  static String.Encoding.utf8.getter();
  uint64_t v5 = String.data(using:allowLossyConversion:)();
  unint64_t v7 = v6;
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  if (v7 >> 60 != 15)
  {
    int64_t v9 = *v0;
    Class isa = Data._bridgeToObjectiveC()().super.isa;
    [v9 writeData:isa];

    return sub_100024464(v5, v7);
  }
  return result;
}

uint64_t sub_10002337C()
{
  uint64_t v0 = type metadata accessor for Logger();
  sub_10000AFD4(v0, qword_10007DAE0);
  sub_10000AF48(v0, (uint64_t)qword_10007DAE0);
  return Logger.init(subsystem:category:)();
}

BOOL sub_1000233FC(char *a1, char *a2)
{
  return dword_10005845C[*a1] == dword_10005845C[*a2];
}

Swift::Int sub_100023420()
{
  uint64_t v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(dword_10005845C[v1]);
  return Hasher._finalize()();
}

void sub_100023470()
{
  Hasher._combine(_:)(dword_10005845C[*v0]);
}

Swift::Int sub_1000234A8()
{
  uint64_t v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(dword_10005845C[v1]);
  return Hasher._finalize()();
}

uint64_t sub_1000234F4@<X0>(int *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_100008BE0(*a1);
  *a2 = result;
  return result;
}

void sub_100023520(_DWORD *a1@<X8>)
{
  *a1 = dword_10005845C[*v1];
}

uint64_t sub_100023538()
{
  return RawRepresentable<>.init(from:)();
}

uint64_t sub_100023598()
{
  return RawRepresentable<>.encode(to:)();
}

uint64_t sub_1000235E8(char a1)
{
  uint64_t result = 0x7269447373616C43;
  switch(a1)
  {
    case 1:
      uint64_t result = 0x417373616C43;
      break;
    case 2:
      uint64_t result = 0x427373616C43;
      break;
    case 3:
      uint64_t result = 0x437373616C43;
      break;
    case 4:
      uint64_t result = 0x447373616C43;
      break;
    case 5:
      uint64_t result = 0x457373616C43;
      break;
    case 6:
      uint64_t result = 0x467373616C43;
      break;
    case 7:
      uint64_t result = 0x58437373616C43;
      break;
    case 8:
      uint64_t result = 0x6365746F72506F4ELL;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_100023700()
{
  return sub_1000235E8(*v0);
}

uint64_t sub_100023708()
{
  swift_bridgeObjectRelease();

  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for ProtectionClassCounter()
{
  return self;
}

ValueMetadata *type metadata accessor for FileHandlerOutputStream()
{
  return &type metadata for FileHandlerOutputStream;
}

uint64_t getEnumTagSinglePayload for ProtectionClass(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xF8) {
    goto LABEL_17;
  }
  if (a2 + 8 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 8) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 8;
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
      return (*a1 | (v4 << 8)) - 8;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 8;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 9;
  int v8 = v6 - 9;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for ProtectionClass(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 8 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 8) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF8) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF7)
  {
    unsigned int v6 = ((a2 - 248) >> 8) + 1;
    *uint64_t result = a2 + 8;
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
        JUMPOUT(0x1000238D0);
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
          *uint64_t result = a2 + 8;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ProtectionClass()
{
  return &type metadata for ProtectionClass;
}

unint64_t sub_10002390C()
{
  unint64_t result = qword_10007C3C8;
  if (!qword_10007C3C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007C3C8);
  }
  return result;
}

uint64_t sub_100023960()
{
  uint64_t v1 = v0;
  id v2 = [objc_allocWithZone((Class)NSNumberFormatter) init];
  [v2 setFormatWidth:4];
  [v2 setPaddingPosition:3];
  if (*(void *)(*(void *)(v0 + 16) + 16)) {
    sub_100036E20(0);
  }
  Class isa = UInt64._bridgeToObjectiveC()().super.super.isa;
  id v4 = [v2 stringForObjectValue:isa];

  if (v4)
  {
    v52._countAndFlagsBits = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v52._object = v5;
  }
  else
  {
    v52._countAndFlagsBits = 4271950;
    v52._object = (void *)0xE300000000000000;
  }
  if (*(void *)(*(void *)(v1 + 16) + 16)) {
    sub_100036E20(1);
  }
  Class v6 = UInt64._bridgeToObjectiveC()().super.super.isa;
  id v7 = [v2 stringForObjectValue:v6];

  if (v7)
  {
    v51._countAndFlagsBits = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v51._object = v8;
  }
  else
  {
    v51._countAndFlagsBits = 4271950;
    v51._object = (void *)0xE300000000000000;
  }
  if (*(void *)(*(void *)(v1 + 16) + 16)) {
    sub_100036E20(2);
  }
  Class v9 = UInt64._bridgeToObjectiveC()().super.super.isa;
  id v10 = [v2 stringForObjectValue:v9];

  if (v10)
  {
    uint64_t v11 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    char v50 = v12;
  }
  else
  {
    char v50 = (void *)0xE300000000000000;
    uint64_t v11 = 4271950;
  }
  if (*(void *)(*(void *)(v1 + 16) + 16)) {
    sub_100036E20(3);
  }
  Class v13 = UInt64._bridgeToObjectiveC()().super.super.isa;
  id v14 = [v2 stringForObjectValue:v13];

  if (v14)
  {
    v49._countAndFlagsBits = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v49._object = v15;
  }
  else
  {
    v49._countAndFlagsBits = 4271950;
    v49._object = (void *)0xE300000000000000;
  }
  if (*(void *)(*(void *)(v1 + 16) + 16)) {
    sub_100036E20(4);
  }
  Class v16 = UInt64._bridgeToObjectiveC()().super.super.isa;
  id v17 = [v2 stringForObjectValue:v16];

  if (v17)
  {
    uint64_t v48 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v19 = v18;
  }
  else
  {
    uint64_t v19 = (void *)0xE300000000000000;
    uint64_t v48 = 4271950;
  }
  if (*(void *)(*(void *)(v1 + 16) + 16)) {
    sub_100036E20(5);
  }
  Class v20 = UInt64._bridgeToObjectiveC()().super.super.isa;
  id v21 = [v2 stringForObjectValue:v20];

  if (v21)
  {
    uint64_t v47 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v23 = v22;
  }
  else
  {
    uint64_t v23 = (void *)0xE300000000000000;
    uint64_t v47 = 4271950;
  }
  if (*(void *)(*(void *)(v1 + 16) + 16)) {
    sub_100036E20(6);
  }
  Class v24 = UInt64._bridgeToObjectiveC()().super.super.isa;
  id v25 = [v2 stringForObjectValue:v24];

  if (v25)
  {
    uint64_t v26 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v28 = v27;
  }
  else
  {
    uint64_t v28 = (void *)0xE300000000000000;
    uint64_t v26 = 4271950;
  }
  if (*(void *)(*(void *)(v1 + 16) + 16)) {
    sub_100036E20(7);
  }
  Class v29 = UInt64._bridgeToObjectiveC()().super.super.isa;
  id v30 = [v2 stringForObjectValue:v29];

  if (v30)
  {
    uint64_t v31 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v33 = v32;
  }
  else
  {
    uint64_t v33 = (void *)0xE300000000000000;
    uint64_t v31 = 4271950;
  }
  _StringGuts.grow(_:)(43);
  swift_bridgeObjectRelease();
  String.append(_:)(v51);
  swift_bridgeObjectRelease();
  v34._countAndFlagsBits = 4014624;
  v34._object = (void *)0xE300000000000000;
  String.append(_:)(v34);
  v35._countAndFlagsBits = v11;
  v35._object = v50;
  String.append(_:)(v35);
  swift_bridgeObjectRelease();
  v36._countAndFlagsBits = 4014880;
  v36._object = (void *)0xE300000000000000;
  String.append(_:)(v36);
  String.append(_:)(v49);
  swift_bridgeObjectRelease();
  v37._countAndFlagsBits = 4015136;
  v37._object = (void *)0xE300000000000000;
  String.append(_:)(v37);
  v38._countAndFlagsBits = v48;
  v38._object = v19;
  String.append(_:)(v38);
  swift_bridgeObjectRelease();
  v39._countAndFlagsBits = 4015392;
  v39._object = (void *)0xE300000000000000;
  String.append(_:)(v39);
  v40._countAndFlagsBits = v47;
  v40._object = v23;
  String.append(_:)(v40);
  swift_bridgeObjectRelease();
  v41._countAndFlagsBits = 4015648;
  v41._object = (void *)0xE300000000000000;
  String.append(_:)(v41);
  v42._countAndFlagsBits = v26;
  v42._object = v28;
  String.append(_:)(v42);
  swift_bridgeObjectRelease();
  v43._countAndFlagsBits = 1029194528;
  v43._object = (void *)0xE400000000000000;
  String.append(_:)(v43);
  v44._countAndFlagsBits = v31;
  v44._object = v33;
  String.append(_:)(v44);
  swift_bridgeObjectRelease();
  v45._countAndFlagsBits = 0x3D656E6F4E20;
  v45._object = (void *)0xE600000000000000;
  String.append(_:)(v45);
  String.append(_:)(v52);

  swift_bridgeObjectRelease();
  return 15681;
}

unint64_t sub_100023F34(char a1)
{
  unint64_t result = 1701869940;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x69746365746F7270;
      break;
    case 2:
      unint64_t result = 0x737365636F7270;
      break;
    case 3:
      unint64_t result = 1752457584;
      break;
    case 4:
    case 6:
      unint64_t result = 0xD000000000000010;
      break;
    case 5:
      unint64_t result = 0x6F4C656369766564;
      break;
    case 7:
      unint64_t result = 0xD000000000000011;
      break;
    case 8:
      unint64_t result = 0x745367616279656BLL;
      break;
    case 9:
      unint64_t result = 0x6279654B65726F6DLL;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_100024084(void *a1)
{
  uint64_t v3 = sub_1000082E0(&qword_10007C3E8);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  Class v6 = &v8[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_10000B090(a1, a1[3]);
  sub_100025244();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  v8[15] = 0;
  KeyedEncodingContainer.encode(_:forKey:)();
  if (!v1)
  {
    v8[14] = 1;
    KeyedEncodingContainer.encode(_:forKey:)();
    v8[13] = 2;
    KeyedEncodingContainer.encode(_:forKey:)();
    v8[12] = 3;
    KeyedEncodingContainer.encode(_:forKey:)();
    v8[11] = 4;
    KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
    v8[10] = 5;
    KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
    v8[9] = 6;
    KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
    v8[8] = 7;
    KeyedEncodingContainer.encode(_:forKey:)();
    v8[7] = 8;
    KeyedEncodingContainer.encode(_:forKey:)();
    v8[6] = 9;
    KeyedEncodingContainer.encode(_:forKey:)();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t sub_100024328()
{
  return sub_100023960();
}

unint64_t sub_10002434C()
{
  return sub_100023F34(*v0);
}

uint64_t sub_100024354@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1000249A0(a1, a2);
  *a3 = result;
  return result;
}

void sub_10002437C(unsigned char *a1@<X8>)
{
  *a1 = 10;
}

uint64_t sub_100024388(uint64_t a1)
{
  unint64_t v2 = sub_100025244();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_1000243C4(uint64_t a1)
{
  unint64_t v2 = sub_100025244();

  return CodingKey.debugDescription.getter(a1, v2);
}

__n128 sub_100024400@<Q0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  sub_100024DF0(a1, (uint64_t)v6);
  if (!v2)
  {
    long long v5 = v6[3];
    *(_OWORD *)(a2 + 32) = v6[2];
    *(_OWORD *)(a2 + 48) = v5;
    *(_OWORD *)(a2 + 64) = v6[4];
    __n128 result = (__n128)v6[1];
    *(_OWORD *)a2 = v6[0];
    *(__n128 *)(a2 + 16) = result;
  }
  return result;
}

uint64_t sub_10002444C(void *a1)
{
  return sub_100024084(a1);
}

uint64_t sub_100024464(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_100024478(a1, a2);
  }
  return a1;
}

uint64_t sub_100024478(uint64_t a1, unint64_t a2)
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

unint64_t sub_1000244D0()
{
  unint64_t result = qword_10007C3D0;
  if (!qword_10007C3D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007C3D0);
  }
  return result;
}

unint64_t *initializeBufferWithCopyOfBuffer for AnalyticsError(unint64_t *a1, unint64_t *a2)
{
  unint64_t v3 = *a2;
  sub_100024558(*a2);
  *a1 = v3;
  return a1;
}

unint64_t sub_100024558(unint64_t result)
{
  if (!(result >> 62)) {
    return swift_errorRetain();
  }
  return result;
}

unint64_t destroy for AnalyticsError(unint64_t *a1)
{
  return sub_100024570(*a1);
}

unint64_t sub_100024570(unint64_t result)
{
  if (!(result >> 62)) {
    return swift_errorRelease();
  }
  return result;
}

unint64_t *assignWithCopy for AnalyticsError(unint64_t *a1, unint64_t *a2)
{
  unint64_t v3 = *a2;
  sub_100024558(*a2);
  unint64_t v4 = *a1;
  *a1 = v3;
  sub_100024570(v4);
  return a1;
}

void *initializeWithTake for AnalyticsError(void *result, void *a2)
{
  *unint64_t result = *a2;
  return result;
}

unint64_t *assignWithTake for AnalyticsError(unint64_t *a1, unint64_t *a2)
{
  unint64_t v3 = *a1;
  *a1 = *a2;
  sub_100024570(v3);
  return a1;
}

uint64_t getEnumTagSinglePayload for AnalyticsError(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xD && *(unsigned char *)(a1 + 8)) {
    return (*(_DWORD *)a1 + 13);
  }
  unsigned int v3 = (((*(void *)a1 >> 60) >> 2) & 0xFFFFFFF3 | (4 * ((*(void *)a1 >> 60) & 3))) ^ 0xF;
  if (v3 >= 0xC) {
    unsigned int v3 = -1;
  }
  return v3 + 1;
}

uint64_t storeEnumTagSinglePayload for AnalyticsError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xC)
  {
    *(void *)unint64_t result = a2 - 13;
    if (a3 >= 0xD) {
      *(unsigned char *)(result + 8) = 1;
    }
  }
  else
  {
    if (a3 >= 0xD) {
      *(unsigned char *)(result + 8) = 0;
    }
    if (a2) {
      *(void *)unint64_t result = (unint64_t)(((-a2 >> 2) & 3) - 4 * a2) << 60;
    }
  }
  return result;
}

uint64_t sub_10002469C(void *a1)
{
  uint64_t v1 = *a1 >> 62;
  if (v1 == 3) {
    return *a1 + 3;
  }
  else {
    return v1;
  }
}

void *sub_1000246B4(void *result)
{
  *result &= 0x3FFFFFFFFFFFFFFFuLL;
  return result;
}

void *sub_1000246C4(void *result, uint64_t a2)
{
  if (a2 < 3) {
    *unint64_t result = *result & 0xFFFFFFFFFFFFFFFLL | (a2 << 62);
  }
  else {
    *unint64_t result = (a2 - 3) | 0xC000000000000000;
  }
  return result;
}

ValueMetadata *type metadata accessor for AnalyticsError()
{
  return &type metadata for AnalyticsError;
}

uint64_t destroy for FileAnalyticsEvent()
{
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for FileAnalyticsEvent(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  uint64_t v3 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v3;
  uint64_t v4 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v4;
  *(_WORD *)(a1 + 40) = *(_WORD *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
  *(void *)(a1 + 60) = *(void *)(a2 + 60);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for FileAnalyticsEvent(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(_DWORD *)(a1 + 4) = *(_DWORD *)(a2 + 4);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  *(unsigned char *)(a1 + 41) = *(unsigned char *)(a2 + 41);
  uint64_t v4 = *(void *)(a2 + 48);
  *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
  *(void *)(a1 + 48) = v4;
  *(_DWORD *)(a1 + 60) = *(_DWORD *)(a2 + 60);
  *(_DWORD *)(a1 + 64) = *(_DWORD *)(a2 + 64);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  return a1;
}

__n128 initializeWithTake for FileAnalyticsEvent(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  __n128 result = *(__n128 *)(a2 + 16);
  long long v3 = *(_OWORD *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v4;
  *(__n128 *)(a1 + 16) = result;
  *(_OWORD *)(a1 + 32) = v3;
  return result;
}

uint64_t assignWithTake for FileAnalyticsEvent(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v5;
  swift_bridgeObjectRelease();
  *(_WORD *)(a1 + 40) = *(_WORD *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
  *(void *)(a1 + 60) = *(void *)(a2 + 60);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  return a1;
}

uint64_t getEnumTagSinglePayload for FileAnalyticsEvent(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 80)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for FileAnalyticsEvent(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 72) = 0;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 80) = 1;
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
      *(void *)(result + 16) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 80) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for FileAnalyticsEvent()
{
  return &type metadata for FileAnalyticsEvent;
}

uint64_t sub_1000249A0(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 1701869940 && a2 == 0xE400000000000000;
  if (v2 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x69746365746F7270 && a2 == 0xEF7373616C436E6FLL {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x737365636F7270 && a2 == 0xE700000000000000 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 1752457584 && a2 == 0xE400000000000000 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0xD000000000000010 && a2 == 0x800000010005D460 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0x6F4C656369766564 && a2 == 0xEC00000064656B63 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0xD000000000000010 && a2 == 0x800000010005D480 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x800000010005D310 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 7;
  }
  else if (a1 == 0x745367616279656BLL && a2 == 0xEB00000000657461 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 8;
  }
  else if (a1 == 0x6279654B65726F6DLL && a2 == 0xEF65746174536761)
  {
    swift_bridgeObjectRelease();
    return 9;
  }
  else
  {
    char v6 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if (v6) {
      return 9;
    }
    else {
      return 10;
    }
  }
}

uint64_t sub_100024DF0@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = sub_1000082E0(&qword_10007C3D8);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  int v8 = (char *)&v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000B090(a1, a1[3]);
  sub_100025244();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v2) {
    return sub_100008540((uint64_t)a1);
  }
  char v43 = 0;
  int v9 = KeyedDecodingContainer.decode(_:forKey:)();
  char v42 = 1;
  int v33 = KeyedDecodingContainer.decode(_:forKey:)();
  char v41 = 2;
  uint64_t v10 = KeyedDecodingContainer.decode(_:forKey:)();
  uint64_t v12 = v11;
  uint64_t v31 = v10;
  char v40 = 3;
  swift_bridgeObjectRetain();
  uint64_t v13 = KeyedDecodingContainer.decode(_:forKey:)();
  uint64_t v32 = v14;
  uint64_t v28 = v13;
  uint64_t v30 = v12;
  char v39 = 4;
  swift_bridgeObjectRetain();
  uint64_t v29 = 0;
  int v27 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
  char v38 = 5;
  LOBYTE(v12) = KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
  char v37 = 6;
  uint64_t v15 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
  int v25 = v16;
  uint64_t v26 = v15;
  char v36 = 7;
  int v24 = KeyedDecodingContainer.decode(_:forKey:)();
  char v35 = 8;
  HIDWORD(v23) = KeyedDecodingContainer.decode(_:forKey:)();
  char v34 = 9;
  uint64_t v17 = KeyedDecodingContainer.decode(_:forKey:)();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  sub_100008540((uint64_t)a1);
  uint64_t v18 = v32;
  swift_bridgeObjectRelease();
  uint64_t v19 = v30;
  uint64_t result = swift_bridgeObjectRelease();
  int v21 = v33;
  *(_DWORD *)a2 = v9;
  *(_DWORD *)(a2 + 4) = v21;
  *(void *)(a2 + 8) = v31;
  *(void *)(a2 + 16) = v19;
  *(void *)(a2 + 24) = v28;
  *(void *)(a2 + 32) = v18;
  *(unsigned char *)(a2 + 40) = v27;
  *(unsigned char *)(a2 + 41) = v12;
  *(void *)(a2 + 48) = v26;
  *(unsigned char *)(a2 + 56) = v25 & 1;
  int v22 = HIDWORD(v23);
  *(_DWORD *)(a2 + 60) = v24;
  *(_DWORD *)(a2 + 64) = v22;
  *(void *)(a2 + 72) = v17;
  return result;
}

unint64_t sub_100025244()
{
  unint64_t result = qword_10007C3E0;
  if (!qword_10007C3E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007C3E0);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for FileAnalyticsEvent.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xF7) {
    goto LABEL_17;
  }
  if (a2 + 9 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 9) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 9;
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
      return (*a1 | (v4 << 8)) - 9;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 9;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0xA;
  int v8 = v6 - 10;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for FileAnalyticsEvent.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 9 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 9) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF7) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF6)
  {
    unsigned int v6 = ((a2 - 247) >> 8) + 1;
    *unint64_t result = a2 + 9;
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
        JUMPOUT(0x1000253F4);
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
          *unint64_t result = a2 + 9;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for FileAnalyticsEvent.CodingKeys()
{
  return &type metadata for FileAnalyticsEvent.CodingKeys;
}

unint64_t sub_100025430()
{
  unint64_t result = qword_10007C3F0;
  if (!qword_10007C3F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007C3F0);
  }
  return result;
}

unint64_t sub_100025488()
{
  unint64_t result = qword_10007C3F8;
  if (!qword_10007C3F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007C3F8);
  }
  return result;
}

unint64_t sub_1000254E0()
{
  unint64_t result = qword_10007C400;
  if (!qword_10007C400)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007C400);
  }
  return result;
}

uint64_t AKSAnalyticsCounters.description.getter()
{
  _StringGuts.grow(_:)(186);
  v0._countAndFlagsBits = 0x646165526E65706FLL;
  v0._object = (void *)0xED00003D656C6261;
  String.append(_:)(v0);
  v1._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
  String.append(_:)(v1);
  swift_bridgeObjectRelease();
  v2._countAndFlagsBits = 47;
  v2._object = (void *)0xE100000000000000;
  String.append(_:)(v2);
  v3._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
  String.append(_:)(v3);
  swift_bridgeObjectRelease();
  v4._countAndFlagsBits = 0x6972576E65706F20;
  v4._object = (void *)0xEE003D656C626174;
  String.append(_:)(v4);
  v5._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
  String.append(_:)(v5);
  swift_bridgeObjectRelease();
  v6._countAndFlagsBits = 47;
  v6._object = (void *)0xE100000000000000;
  String.append(_:)(v6);
  v7._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
  String.append(_:)(v7);
  swift_bridgeObjectRelease();
  v8._countAndFlagsBits = 0x3D65746165726320;
  v8._object = (void *)0xE800000000000000;
  String.append(_:)(v8);
  v9._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
  String.append(_:)(v9);
  swift_bridgeObjectRelease();
  v10._countAndFlagsBits = 47;
  v10._object = (void *)0xE100000000000000;
  String.append(_:)(v10);
  v11._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
  String.append(_:)(v11);
  swift_bridgeObjectRelease();
  v12._countAndFlagsBits = 0xD000000000000014;
  v12._object = (void *)0x800000010005D4A0;
  String.append(_:)(v12);
  v13._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
  String.append(_:)(v13);
  swift_bridgeObjectRelease();
  v14._countAndFlagsBits = 47;
  v14._object = (void *)0xE100000000000000;
  String.append(_:)(v14);
  v15._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
  String.append(_:)(v15);
  swift_bridgeObjectRelease();
  v16._countAndFlagsBits = 0xD000000000000015;
  v16._object = (void *)0x800000010005D4C0;
  String.append(_:)(v16);
  v17._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
  String.append(_:)(v17);
  swift_bridgeObjectRelease();
  v18._countAndFlagsBits = 47;
  v18._object = (void *)0xE100000000000000;
  String.append(_:)(v18);
  v19._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
  String.append(_:)(v19);
  swift_bridgeObjectRelease();
  v20._countAndFlagsBits = 0x656C626173696420;
  v20._object = (void *)0xEA00000000003D64;
  String.append(_:)(v20);
  v21._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
  String.append(_:)(v21);
  swift_bridgeObjectRelease();
  v22._object = (void *)0xEA00000000003D79;
  v22._countAndFlagsBits = 0x6C6E4F6461657220;
  String.append(_:)(v22);
  v23._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
  String.append(_:)(v23);
  swift_bridgeObjectRelease();
  v24._object = (void *)0x800000010005D4E0;
  v24._countAndFlagsBits = 0xD000000000000013;
  String.append(_:)(v24);
  v25._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
  String.append(_:)(v25);
  swift_bridgeObjectRelease();
  v26._countAndFlagsBits = 0x6F74636572696420;
  v26._object = (void *)0xEB000000003D7972;
  String.append(_:)(v26);
  v27._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
  String.append(_:)(v27);
  swift_bridgeObjectRelease();
  v28._countAndFlagsBits = 0x3D706F726420;
  v28._object = (void *)0xE600000000000000;
  String.append(_:)(v28);
  v29._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
  String.append(_:)(v29);
  swift_bridgeObjectRelease();
  v30._countAndFlagsBits = 0x3D7265746C696620;
  v30._object = (void *)0xE800000000000000;
  String.append(_:)(v30);
  v31._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
  String.append(_:)(v31);
  swift_bridgeObjectRelease();
  v32._countAndFlagsBits = 0x3D726F72726520;
  v32._object = (void *)0xE700000000000000;
  String.append(_:)(v32);
  v33._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
  String.append(_:)(v33);
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t sub_100025A6C(void *a1)
{
  uint64_t v3 = sub_1000082E0(&qword_10007C6A0);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  Swift::String v6 = &v8[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_10000B090(a1, a1[3]);
  sub_100027954();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  v8[15] = 0;
  KeyedEncodingContainer.encode(_:forKey:)();
  if (!v1)
  {
    v8[14] = 1;
    KeyedEncodingContainer.encode(_:forKey:)();
    v8[13] = 2;
    KeyedEncodingContainer.encode(_:forKey:)();
    v8[12] = 3;
    KeyedEncodingContainer.encode(_:forKey:)();
    v8[11] = 4;
    KeyedEncodingContainer.encode(_:forKey:)();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t sub_100025C44()
{
  uint64_t result = 0x6576456C61746F74;
  switch(*v0)
  {
    case 1:
      uint64_t result = 0x646574726F706572;
      break;
    case 2:
      uint64_t result = 0x646570706F7264;
      break;
    case 3:
      uint64_t result = 0x64657265746C6966;
      break;
    case 4:
      uint64_t result = 0x726F727265;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_100025D00@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_100027458(a1, a2);
  *a3 = result;
  return result;
}

void sub_100025D28(unsigned char *a1@<X8>)
{
  *a1 = 5;
}

uint64_t sub_100025D34(uint64_t a1)
{
  unint64_t v2 = sub_100027954();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100025D70(uint64_t a1)
{
  unint64_t v2 = sub_100027954();

  return CodingKey.debugDescription.getter(a1, v2);
}

double sub_100025DAC@<D0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  sub_1000276AC(a1, (uint64_t *)v6);
  if (!v2)
  {
    double result = *(double *)v6;
    long long v5 = v6[1];
    *(_OWORD *)a2 = v6[0];
    *(_OWORD *)(a2 + 16) = v5;
    *(void *)(a2 + 32) = v7;
  }
  return result;
}

uint64_t sub_100025DF4(void *a1)
{
  return sub_100025A6C(a1);
}

void *sub_100025E0C()
{
  *(void *)(v0 + 64) = 0;
  *(unsigned char *)(v0 + 72) = 0;
  *(void *)(v0 + 16) = 0;
  *(void *)(v0 + 24) = 0;
  *(_DWORD *)(v0 + 32) = 0;
  *(void *)(v0 + 40) = 0;
  *(void *)(v0 + 48) = 0;
  *(_DWORD *)(v0 + 56) = 0;
  *(void *)(v0 + 80) = 32;
  double result = calloc(1uLL, 0x20uLL);
  if (result)
  {
    *(void *)(v0 + 88) = result;
    return (void *)v0;
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_100025E5C()
{
  CFDictionaryRef v1 = IOServiceMatching("AKSAnalytics");
  io_service_t MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v1);
  if (MatchingService)
  {
    io_connect_t connect = 0;
    if (IOServiceOpen(MatchingService, mach_task_self_, 0, &connect))
    {
      if (qword_10007A5C0 != -1) {
        swift_once();
      }
      uint64_t v3 = type metadata accessor for Logger();
      sub_10000AF48(v3, (uint64_t)qword_10007DAE0);
      uint64_t v4 = Logger.logObject.getter();
      os_log_type_t v5 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v4, v5))
      {
        Swift::String v6 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)Swift::String v6 = 0;
        _os_log_impl((void *)&_mh_execute_header, v4, v5, "Failed to open AKSAnalytics service", v6, 2u);
        swift_slowDealloc();
      }
    }
    else
    {
      *(_DWORD *)(v0 + 32) = connect;
    }
  }
  else
  {
    if (qword_10007A5C0 != -1) {
      swift_once();
    }
    uint64_t v7 = type metadata accessor for Logger();
    sub_10000AF48(v7, (uint64_t)qword_10007DAE0);
    oslog = Logger.logObject.getter();
    os_log_type_t v8 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(oslog, v8))
    {
      Swift::String v9 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)Swift::String v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, oslog, v8, "AKSAnalytics service not found", v9, 2u);
      swift_slowDealloc();
    }
  }
}

void sub_1000260AC()
{
  kern_return_t v17;
  uint64_t v18;
  NSObject *v19;
  os_log_type_t v20;
  uint8_t *v21;
  const char *v22;
  NSObject *v23;
  os_log_type_t v24;
  uint8_t *v25;
  uint32_t v26;
  uint64_t v27;
  os_log_type_t v28;
  uint8_t *v29;
  os_log_t v30;
  uint64_t v31;
  void *v32;
  id v33;
  uint64_t v34;
  void *v35;
  char *v36;
  kern_return_t v37;
  kern_return_t v38;
  uint64_t v39;
  os_log_type_t v40;
  uint8_t *v41;
  uint64_t v42;
  os_log_type_t v43;
  uint8_t *v44;
  uint64_t v45;
  os_log_type_t v46;
  uint8_t *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  char *v52;
  uint64_t v53;
  os_log_t v54;
  uint64_t aBlock[6];
  mach_vm_size_t ofSize;
  mach_vm_address_t atAddress;
  uint64_t vars8;

  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  os_log_type_t v5 = (char *)&v48 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  Swift::String v9 = (char *)&v48 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for OS_dispatch_queue.Attributes();
  __chkstk_darwin(v10);
  uint64_t v11 = type metadata accessor for DispatchQoS();
  Swift::String v12 = __chkstk_darwin(v11);
  Swift::String v15 = (char *)&v48 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(_DWORD *)(v0 + 56))
  {
    __break(1u);
    goto LABEL_35;
  }
  v53 = v13;
  uint64_t v54 = v12;
  mach_port_t NotificationPort = IODataQueueAllocateNotificationPort();
  *(_DWORD *)(v0 + 56) = NotificationPort;
  if (NotificationPort)
  {
    Swift::String v52 = v5;
    ofSize = 0;
    atAddress = 0;
    Swift::String v17 = IOConnectMapMemory64(*(_DWORD *)(v0 + 32), 0, mach_task_self_, &atAddress, &ofSize, 1u);
    if (v17)
    {
      LODWORD(v5) = v17;
      if (qword_10007A5C0 == -1)
      {
LABEL_5:
        Swift::String v18 = type metadata accessor for Logger();
        sub_10000AF48(v18, (uint64_t)qword_10007DAE0);
        Swift::String v19 = Logger.logObject.getter();
        Swift::String v20 = static os_log_type_t.error.getter();
        if (!os_log_type_enabled(v19, v20))
        {
LABEL_31:

          return;
        }
        Swift::String v21 = (uint8_t *)swift_slowAlloc();
        *(_DWORD *)Swift::String v21 = 67109120;
        LODWORD(aBlock[0]) = v5;
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        Swift::String v22 = "IOConnectMapMemory64 failed: %d";
        Swift::String v23 = v19;
        Swift::String v24 = v20;
        Swift::String v25 = v21;
        Swift::String v26 = 8;
LABEL_7:
        _os_log_impl((void *)&_mh_execute_header, v23, v24, v22, v25, v26);
        swift_slowDealloc();
        goto LABEL_31;
      }
LABEL_35:
      swift_once();
      goto LABEL_5;
    }
    Swift::String v49 = v3;
    char v50 = v2;
    *(void *)(v0 + 40) = atAddress;
    Swift::String v51 = sub_1000273BC(0, (unint64_t *)&qword_10007A740);
    static DispatchQoS.unspecified.getter();
    aBlock[0] = (uint64_t)&_swiftEmptyArrayStorage;
    sub_100027410(&qword_10007C640, (void (*)(uint64_t))&type metadata accessor for OS_dispatch_queue.Attributes);
    sub_1000082E0(&qword_10007C648);
    sub_10000949C((unint64_t *)&qword_10007C650, &qword_10007C648);
    dispatch thunk of SetAlgebra.init<A>(_:)();
    (*(void (**)(char *, void, uint64_t))(v7 + 104))(v9, enum case for OS_dispatch_queue.AutoreleaseFrequency.inherit(_:), v6);
    Swift::String v31 = OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
    Swift::String v32 = *(void **)(v0 + 48);
    *(void *)(v0 + 48) = v31;

    sub_1000273BC(0, &qword_10007C658);
    Swift::String v33 = *(id *)(v0 + 48);
    char v34 = static OS_dispatch_source.makeMachReceiveSource(port:queue:)();

    *(void *)(v1 + 64) = v34;
    swift_unknownObjectRelease();
    if (!*(void *)(v1 + 64))
    {
      if (qword_10007A5C0 != -1) {
        swift_once();
      }
      char v42 = type metadata accessor for Logger();
      sub_10000AF48(v42, (uint64_t)qword_10007DAE0);
      Swift::String v19 = Logger.logObject.getter();
      char v43 = static os_log_type_t.error.getter();
      if (!os_log_type_enabled(v19, v43)) {
        goto LABEL_31;
      }
      Swift::String v44 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)Swift::String v44 = 0;
      Swift::String v22 = "cannot create notification source";
      Swift::String v23 = v19;
      Swift::String v24 = v43;
      Swift::String v25 = v44;
      Swift::String v26 = 2;
      goto LABEL_7;
    }
    swift_getObjectType();
    aBlock[4] = (uint64_t)sub_100008938;
    aBlock[5] = v1;
    aBlock[0] = (uint64_t)_NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_1000085EC;
    aBlock[3] = (uint64_t)&unk_100073AB0;
    char v35 = _Block_copy(aBlock);
    swift_unknownObjectRetain();
    swift_retain();
    static DispatchQoS.unspecified.getter();
    char v36 = v52;
    sub_1000269FC();
    OS_dispatch_source.setEventHandler(qos:flags:handler:)();
    _Block_release(v35);
    (*(void (**)(char *, uint64_t))(v49 + 8))(v36, v50);
    (*(void (**)(char *, os_log_t))(v53 + 8))(v15, v54);
    swift_release();
    OS_dispatch_source.activate()();
    char v37 = IOConnectSetNotificationPort(*(_DWORD *)(v1 + 32), 0, *(_DWORD *)(v1 + 56), 0);
    if (v37)
    {
      char v38 = v37;
      if (qword_10007A5C0 != -1) {
        swift_once();
      }
      char v39 = type metadata accessor for Logger();
      sub_10000AF48(v39, (uint64_t)qword_10007DAE0);
      Swift::String v19 = Logger.logObject.getter();
      char v40 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v19, v40))
      {
        char v41 = (uint8_t *)swift_slowAlloc();
        *(_DWORD *)char v41 = 67109120;
        LODWORD(aBlock[0]) = v38;
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        _os_log_impl((void *)&_mh_execute_header, v19, v40, "IOConnectSetNotificationPort failed: %d", v41, 8u);
LABEL_30:
        swift_slowDealloc();
        swift_unknownObjectRelease();
        goto LABEL_31;
      }
LABEL_32:

      swift_unknownObjectRelease();
      return;
    }
    aBlock[0] = 1;
    if (IOConnectCallScalarMethod(*(_DWORD *)(v1 + 32), 0, aBlock, 1u, 0, 0))
    {
      if (qword_10007A5C0 != -1) {
        swift_once();
      }
      Swift::String v45 = type metadata accessor for Logger();
      sub_10000AF48(v45, (uint64_t)qword_10007DAE0);
      Swift::String v19 = Logger.logObject.getter();
      uint64_t v46 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v19, v46))
      {
        uint64_t v47 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v47 = 0;
        _os_log_impl((void *)&_mh_execute_header, v19, v46, "Failed to enable analytics", v47, 2u);
        goto LABEL_30;
      }
      goto LABEL_32;
    }
    swift_unknownObjectRelease();
    *(unsigned char *)(v1 + 72) = 1;
  }
  else
  {
    if (qword_10007A5C0 != -1) {
      swift_once();
    }
    Swift::String v27 = type metadata accessor for Logger();
    sub_10000AF48(v27, (uint64_t)qword_10007DAE0);
    uint64_t v54 = (os_log_t)Logger.logObject.getter();
    Swift::String v28 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v54, v28))
    {
      Swift::String v29 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)Swift::String v29 = 0;
      _os_log_impl((void *)&_mh_execute_header, v54, v28, "failed to allocate mach port", v29, 2u);
      swift_slowDealloc();
    }
    Swift::String v30 = v54;
  }
}

uint64_t sub_1000269FC()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
}

void sub_100026AD8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000082E0(&qword_10007C618);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  __chkstk_darwin(v4);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))((char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v4);
  unint64_t v7 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v8 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))(v8 + v7, (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v4);
  uint64_t v9 = *(void *)(a2 + 16);
  *(void *)(a2 + 16) = sub_1000088C4;
  *(void *)(a2 + 24) = v8;
  sub_100009348(v9);
  sub_1000260AC();
}

char *sub_100026C14@<X0>(uint64_t a1@<X8>)
{
  kern_return_t v8;
  mach_error_t v9;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  char *result;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  NSObject *v18;
  os_log_type_t v19;
  uint8_t *v20;
  long long v21;
  long long v22;
  long long v23;
  long long v24;
  long long v25;
  long long v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  size_t v30;
  _OWORD v31[14];
  uint64_t v32[27];

  uint64_t v3 = type metadata accessor for Logger();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v27 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(_DWORD *)(v1 + 32))
  {
    if (qword_10007A5C0 != -1) {
      swift_once();
    }
    sub_10000AF48(v3, (uint64_t)qword_10007DAE0);
    Swift::String v18 = Logger.logObject.getter();
    Swift::String v19 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v18, v19))
    {
      Swift::String v20 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)Swift::String v20 = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, v19, "no connection for kext counters", v20, 2u);
      swift_slowDealloc();
    }

    sub_100027334((uint64_t)v31);
    goto LABEL_20;
  }
  unint64_t v7 = (_OWORD *)swift_slowAlloc();
  Swift::String v30 = 208;
  uint64_t v8 = IOConnectCallStructMethod(*(_DWORD *)(v1 + 32), 1u, 0, 0, v7, &v30);
  if (!v8)
  {
    Swift::String v21 = v7[11];
    v31[10] = v7[10];
    v31[11] = v21;
    v31[12] = v7[12];
    Swift::String v22 = v7[7];
    v31[6] = v7[6];
    v31[7] = v22;
    Swift::String v23 = v7[9];
    v31[8] = v7[8];
    v31[9] = v23;
    Swift::String v24 = v7[3];
    v31[2] = v7[2];
    v31[3] = v24;
    Swift::String v25 = v7[5];
    v31[4] = v7[4];
    v31[5] = v25;
    Swift::String v26 = v7[1];
    v31[0] = *v7;
    v31[1] = v26;
    sub_100027360((uint64_t)v31);
LABEL_19:
    swift_slowDealloc();
LABEL_20:
    sub_1000084C8((uint64_t)v31, (uint64_t)v32, &qword_10007C628);
    return (char *)sub_1000084C8((uint64_t)v32, a1, &qword_10007C628);
  }
  uint64_t v9 = v8;
  if (qword_10007A5C0 != -1) {
    swift_once();
  }
  uint64_t v10 = sub_10000AF48(v3, (uint64_t)qword_10007DAE0);
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, v10, v3);
  uint64_t v11 = Logger.logObject.getter();
  Swift::String v12 = static os_log_type_t.error.getter();
  if (!os_log_type_enabled(v11, v12))
  {

    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
LABEL_18:
    sub_100027334((uint64_t)v31);
    goto LABEL_19;
  }
  Swift::String v29 = a1;
  uint64_t v13 = (uint8_t *)swift_slowAlloc();
  Swift::String v28 = swift_slowAlloc();
  v32[0] = v28;
  *(_DWORD *)uint64_t v13 = 136315138;
  double result = mach_error_string(v9);
  if (result)
  {
    Swift::String v15 = String.init(validatingUTF8:)();
    if (v16)
    {
      Swift::String v17 = v16;
    }
    else
    {
      Swift::String v15 = 0x206E776F6E6B6E55;
      Swift::String v17 = 0xED0000726F727265;
    }
    *(void *)&v31[0] = sub_10001EE9C(v15, v17, v32);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v11, v12, "failed to get kext counters: %s", v13, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    a1 = v29;
    goto LABEL_18;
  }
  __break(1u);
  return result;
}

uint64_t sub_100027058()
{
  sub_100009348(*(void *)(v0 + 16));

  swift_unknownObjectRelease();

  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for AnalyticsEventSource()
{
  return self;
}

uint64_t destroy for AnalyticsEvent()
{
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for AnalyticsEvent(uint64_t a1, uint64_t a2)
{
  long long v3 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v3;
  uint64_t v4 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v4;
  uint64_t v5 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v5;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for AnalyticsEvent(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(_DWORD *)(a1 + 8) = *(_DWORD *)(a2 + 8);
  *(_DWORD *)(a1 + 12) = *(_DWORD *)(a2 + 12);
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  *(_DWORD *)(a1 + 20) = *(_DWORD *)(a2 + 20);
  *(_DWORD *)(a1 + 24) = *(_DWORD *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for AnalyticsEvent(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_DWORD *)(a1 + 24) = *(_DWORD *)(a2 + 24);
  uint64_t v4 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v5;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for AnalyticsEvent(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 64)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 40);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

ValueMetadata *type metadata accessor for AnalyticsEvent()
{
  return &type metadata for AnalyticsEvent;
}

uint64_t sub_1000272A0()
{
  uint64_t v1 = sub_1000082E0(&qword_10007C618);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return _swift_deallocObject(v0, v5, v6);
}

double sub_100027334(uint64_t a1)
{
  double result = 0.0;
  *(_OWORD *)(a1 + 176) = 0u;
  *(_OWORD *)(a1 + 192) = 0u;
  *(_OWORD *)(a1 + 144) = 0u;
  *(_OWORD *)(a1 + 160) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 128) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)a1 = 0u;
  *(unsigned char *)(a1 + 208) = 1;
  return result;
}

uint64_t sub_100027360(uint64_t result)
{
  *(unsigned char *)(result + 208) = 0;
  return result;
}

unint64_t sub_100027368()
{
  unint64_t result = qword_10007C630;
  if (!qword_10007C630)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007C630);
  }
  return result;
}

uint64_t sub_1000273BC(uint64_t a1, unint64_t *a2)
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

uint64_t sub_1000273F8(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100027408()
{
  return swift_release();
}

uint64_t sub_100027410(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_100027458(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x6576456C61746F74 && a2 == 0xEB0000000073746ELL;
  if (v2 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x646574726F706572 && a2 == 0xEE0073746E657645 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x646570706F7264 && a2 == 0xE700000000000000 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x64657265746C6966 && a2 == 0xE800000000000000 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x726F727265 && a2 == 0xE500000000000000)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else
  {
    char v6 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if (v6) {
      return 4;
    }
    else {
      return 5;
    }
  }
}

uint64_t sub_1000276AC@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v5 = sub_1000082E0(&qword_10007C690);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000B090(a1, a1[3]);
  sub_100027954();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v2) {
    return sub_100008540((uint64_t)a1);
  }
  char v20 = 0;
  uint64_t v9 = KeyedDecodingContainer.decode(_:forKey:)();
  char v19 = 1;
  uint64_t v10 = KeyedDecodingContainer.decode(_:forKey:)();
  char v18 = 2;
  uint64_t v15 = KeyedDecodingContainer.decode(_:forKey:)();
  char v17 = 3;
  uint64_t v14 = KeyedDecodingContainer.decode(_:forKey:)();
  char v16 = 4;
  uint64_t v11 = KeyedDecodingContainer.decode(_:forKey:)();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  uint64_t result = sub_100008540((uint64_t)a1);
  *a2 = v9;
  a2[1] = v10;
  uint64_t v13 = v14;
  a2[2] = v15;
  a2[3] = v13;
  a2[4] = v11;
  return result;
}

__n128 initializeWithCopy for KernelCounters(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t getEnumTagSinglePayload for KernelCounters(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 40)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for KernelCounters(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(void *)__n128 result = (a2 - 1);
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
  *(unsigned char *)(result + 40) = v3;
  return result;
}

ValueMetadata *type metadata accessor for KernelCounters()
{
  return &type metadata for KernelCounters;
}

unint64_t sub_100027954()
{
  unint64_t result = qword_10007C698;
  if (!qword_10007C698)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007C698);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for KernelCounters.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for KernelCounters.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x100027B04);
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

ValueMetadata *type metadata accessor for KernelCounters.CodingKeys()
{
  return &type metadata for KernelCounters.CodingKeys;
}

unint64_t sub_100027B40()
{
  unint64_t result = qword_10007C6A8;
  if (!qword_10007C6A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007C6A8);
  }
  return result;
}

unint64_t sub_100027B98()
{
  unint64_t result = qword_10007C6B0;
  if (!qword_10007C6B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007C6B0);
  }
  return result;
}

unint64_t sub_100027BF0()
{
  unint64_t result = qword_10007C6B8;
  if (!qword_10007C6B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007C6B8);
  }
  return result;
}

unint64_t sub_100027C44(char a1)
{
  unint64_t result = 0xD000000000000015;
  switch(a1)
  {
    case 1:
      unint64_t result = 0xD000000000000014;
      break;
    case 2:
    case 7:
      unint64_t result = 0xD000000000000012;
      break;
    case 3:
      unint64_t result = 0xD000000000000011;
      break;
    case 4:
      unint64_t result = 0xD000000000000010;
      break;
    case 5:
      unint64_t result = 0x63746142656C6966;
      break;
    case 6:
      unint64_t result = 0x726F706552676F6CLL;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_100027D48(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = sub_1000082E0(&qword_10007C818);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  int v8 = &v10[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_10000B090(a1, a1[3]);
  sub_10002F7EC();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  LOBYTE(v11) = 0;
  KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
  if (!v2)
  {
    LOBYTE(v11) = 1;
    KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
    LOBYTE(v11) = 2;
    KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
    LOBYTE(v11) = 3;
    KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
    LOBYTE(v11) = 4;
    KeyedEncodingContainer.encode(_:forKey:)();
    LOBYTE(v11) = 5;
    KeyedEncodingContainer.encode(_:forKey:)();
    LOBYTE(v11) = 6;
    KeyedEncodingContainer.encode(_:forKey:)();
    long long v11 = *(_OWORD *)(v3 + 88);
    v10[15] = 7;
    sub_10002F894();
    KeyedEncodingContainer.encode<A>(_:forKey:)();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v6 + 8))(v8, v5);
}

unint64_t sub_100027FC8()
{
  return sub_100027C44(*v0);
}

uint64_t sub_100027FD0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_10002C744(a1, a2);
  *a3 = result;
  return result;
}

void sub_100027FF8(unsigned char *a1@<X8>)
{
  *a1 = 8;
}

uint64_t sub_100028004(uint64_t a1)
{
  unint64_t v2 = sub_10002F7EC();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100028040(uint64_t a1)
{
  unint64_t v2 = sub_10002F7EC();

  return CodingKey.debugDescription.getter(a1, v2);
}

__n128 sub_10002807C@<Q0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  sub_10002CA88(a1, (uint64_t)v7);
  if (!v2)
  {
    long long v5 = v7[5];
    *(_OWORD *)(a2 + 64) = v7[4];
    *(_OWORD *)(a2 + 80) = v5;
    *(void *)(a2 + 96) = v8;
    long long v6 = v7[1];
    *(_OWORD *)a2 = v7[0];
    *(_OWORD *)(a2 + 16) = v6;
    __n128 result = (__n128)v7[3];
    *(_OWORD *)(a2 + 32) = v7[2];
    *(__n128 *)(a2 + 48) = result;
  }
  return result;
}

uint64_t sub_1000280DC(void *a1)
{
  return sub_100027D48(a1);
}

uint64_t sub_1000280F4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = type metadata accessor for Date();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  Date.init()();
  Date.timeIntervalSince1970.getter();
  double v11 = v10;
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  if ((~*(void *)&v11 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_7;
  }
  if (v11 <= -1.0)
  {
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }
  if (v11 >= 1.84467441e19)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  v20[0] = a1;
  v20[1] = a2;
  if (qword_10007A5F0 != -1) {
LABEL_9:
  }
    swift_once();
  long long v12 = xmmword_10007DB10;
  uint64_t v14 = qword_10007DB20;
  uint64_t v13 = unk_10007DB28;
  long long v15 = xmmword_10007DB30;
  uint64_t v16 = qword_10007DB40;
  uint64_t v17 = unk_10007DB48;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t result = swift_bridgeObjectRetain();
  *(void *)a3 = (unint64_t)v11;
  *(_OWORD *)(a3 + 8) = v12;
  *(void *)(a3 + 24) = v14;
  *(void *)(a3 + 32) = v13;
  *(_OWORD *)(a3 + 40) = v15;
  *(void *)(a3 + 56) = v16;
  uint64_t v19 = v20[0];
  *(void *)(a3 + 64) = v17;
  *(void *)(a3 + 72) = v19;
  *(void *)(a3 + 80) = result;
  return result;
}

uint64_t sub_1000282B8(char a1)
{
  uint64_t result = 1701669236;
  switch(a1)
  {
    case 1:
      uint64_t result = 0x6C65646F4D7768;
      break;
    case 2:
      uint64_t result = 0x754E6C6169726573;
      break;
    case 3:
      uint64_t result = 0x4449656369766564;
      break;
    case 4:
      uint64_t result = 0x726556646C697562;
      break;
    case 5:
      uint64_t result = 0x795474726F706572;
      break;
    case 6:
      uint64_t result = 0x737365636F7270;
      break;
    case 7:
      uint64_t result = 1701080941;
      break;
    case 8:
      uint64_t result = 0x79726F6765746163;
      break;
    case 9:
      uint64_t result = 0x746E756F63;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_1000283F0(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = sub_1000082E0(&qword_10007C8D0);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = &v10[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_10000B090(a1, a1[3]);
  sub_10003105C();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  v10[15] = 0;
  KeyedEncodingContainer.encode(_:forKey:)();
  if (!v2)
  {
    v10[14] = 1;
    KeyedEncodingContainer.encode(_:forKey:)();
    v10[13] = 2;
    KeyedEncodingContainer.encode(_:forKey:)();
    v10[12] = 3;
    KeyedEncodingContainer.encode(_:forKey:)();
    v10[11] = 4;
    KeyedEncodingContainer.encode(_:forKey:)();
    v10[10] = 5;
    KeyedEncodingContainer.encode(_:forKey:)();
    v10[9] = 6;
    KeyedEncodingContainer.encode(_:forKey:)();
    v10[8] = *(unsigned char *)(v3 + 104);
    v10[7] = 7;
    sub_100022D70();
    KeyedEncodingContainer.encode<A>(_:forKey:)();
    v10[6] = *(unsigned char *)(v3 + 105);
    v10[5] = 8;
    sub_100022FD4();
    KeyedEncodingContainer.encode<A>(_:forKey:)();
    v10[4] = 9;
    KeyedEncodingContainer.encode(_:forKey:)();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t sub_1000286C0()
{
  return sub_1000282B8(*v0);
}

uint64_t sub_1000286C8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_10002CDB0(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1000286F0(uint64_t a1)
{
  unint64_t v2 = sub_10003105C();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10002872C(uint64_t a1)
{
  unint64_t v2 = sub_10003105C();

  return CodingKey.debugDescription.getter(a1, v2);
}

double sub_100028768@<D0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  sub_10002D1D8(a1, (uint64_t)v8);
  if (!v2)
  {
    long long v5 = v12;
    *(_OWORD *)(a2 + 64) = v11;
    *(_OWORD *)(a2 + 80) = v5;
    *(_OWORD *)(a2 + 96) = v13;
    *(void *)(a2 + 112) = v14;
    long long v6 = v8[1];
    *(_OWORD *)a2 = v8[0];
    *(_OWORD *)(a2 + 16) = v6;
    double result = *(double *)&v9;
    long long v7 = v10;
    *(_OWORD *)(a2 + 32) = v9;
    *(_OWORD *)(a2 + 48) = v7;
  }
  return result;
}

uint64_t sub_1000287D0(void *a1)
{
  return sub_1000283F0(a1);
}

unint64_t sub_1000287E8(char a1)
{
  unint64_t result = 1701669236;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x6C65646F4D7768;
      break;
    case 2:
      unint64_t result = 0x754E6C6169726573;
      break;
    case 3:
      unint64_t result = 0x4449656369766564;
      break;
    case 4:
      unint64_t result = 0x726556646C697562;
      break;
    case 5:
      unint64_t result = 0x795474726F706572;
      break;
    case 6:
      unint64_t result = 0x737365636F7270;
      break;
    case 7:
      unint64_t result = 1752457584;
      break;
    case 8:
      unint64_t result = 1701080941;
      break;
    case 9:
      unint64_t result = 0x79726F6765746163;
      break;
    case 10:
      unint64_t result = 0xD000000000000011;
      break;
    case 11:
      unint64_t result = 0x745367616279656BLL;
      break;
    case 12:
      unint64_t result = 0x6279654B65726F6DLL;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_100028984(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = sub_1000082E0(&qword_10007C8B8);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = &v10[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_10000B090(a1, a1[3]);
  sub_100030F7C();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  v10[15] = 0;
  KeyedEncodingContainer.encode(_:forKey:)();
  if (!v2)
  {
    v10[14] = 1;
    KeyedEncodingContainer.encode(_:forKey:)();
    v10[13] = 2;
    KeyedEncodingContainer.encode(_:forKey:)();
    v10[12] = 3;
    KeyedEncodingContainer.encode(_:forKey:)();
    v10[11] = 4;
    KeyedEncodingContainer.encode(_:forKey:)();
    v10[10] = 5;
    KeyedEncodingContainer.encode(_:forKey:)();
    v10[9] = 6;
    KeyedEncodingContainer.encode(_:forKey:)();
    v10[8] = 7;
    KeyedEncodingContainer.encode(_:forKey:)();
    v10[7] = *(unsigned char *)(v3 + 120);
    v10[6] = 8;
    sub_100022D70();
    KeyedEncodingContainer.encode<A>(_:forKey:)();
    v10[5] = *(unsigned char *)(v3 + 121);
    v10[4] = 9;
    sub_100022FD4();
    KeyedEncodingContainer.encode<A>(_:forKey:)();
    v10[3] = 10;
    KeyedEncodingContainer.encode(_:forKey:)();
    void v10[2] = 11;
    KeyedEncodingContainer.encode(_:forKey:)();
    v10[1] = 12;
    KeyedEncodingContainer.encode(_:forKey:)();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v6 + 8))(v8, v5);
}

unint64_t sub_100028CCC()
{
  return sub_1000287E8(*v0);
}

uint64_t sub_100028CD4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_10002D8AC(a1, a2);
  *a3 = result;
  return result;
}

void sub_100028CFC(unsigned char *a1@<X8>)
{
  *a1 = 13;
}

uint64_t sub_100028D08(uint64_t a1)
{
  unint64_t v2 = sub_100030F7C();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100028D44(uint64_t a1)
{
  unint64_t v2 = sub_100030F7C();

  return CodingKey.debugDescription.getter(a1, v2);
}

__n128 sub_100028D80@<Q0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  sub_10002DE2C(a1, v8);
  if (!v2)
  {
    long long v5 = v8[7];
    *(_OWORD *)(a2 + 96) = v8[6];
    *(_OWORD *)(a2 + 112) = v5;
    *(_OWORD *)(a2 + 128) = v8[8];
    long long v6 = v8[3];
    *(_OWORD *)(a2 + 32) = v8[2];
    *(_OWORD *)(a2 + 48) = v6;
    long long v7 = v8[5];
    *(_OWORD *)(a2 + 64) = v8[4];
    *(_OWORD *)(a2 + 80) = v7;
    __n128 result = (__n128)v8[1];
    *(_OWORD *)a2 = v8[0];
    *(__n128 *)(a2 + 16) = result;
  }
  return result;
}

uint64_t sub_100028DDC(void *a1)
{
  return sub_100028984(a1);
}

uint64_t sub_100028DF4(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = sub_1000082E0(&qword_10007C870);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = &v11[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_10000B090(a1, a1[3]);
  sub_100030CAC();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  LOBYTE(v12) = 0;
  KeyedEncodingContainer.encode(_:forKey:)();
  if (!v2)
  {
    LOBYTE(v12) = 1;
    KeyedEncodingContainer.encode(_:forKey:)();
    LOBYTE(v12) = 2;
    KeyedEncodingContainer.encode(_:forKey:)();
    LOBYTE(v12) = 3;
    KeyedEncodingContainer.encode(_:forKey:)();
    LOBYTE(v12) = 4;
    KeyedEncodingContainer.encode(_:forKey:)();
    LOBYTE(v12) = 5;
    KeyedEncodingContainer.encode(_:forKey:)();
    long long v9 = *(_OWORD *)(v3 + 104);
    long long v12 = *(_OWORD *)(v3 + 88);
    long long v13 = v9;
    uint64_t v14 = *(void *)(v3 + 120);
    v11[15] = 6;
    sub_100030D54();
    KeyedEncodingContainer.encode<A>(_:forKey:)();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v6 + 8))(v8, v5);
}

void sub_100029044(unsigned char *a1@<X8>)
{
  *a1 = 7;
}

uint64_t sub_100029050(uint64_t a1)
{
  unint64_t v2 = sub_100030CAC();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10002908C(uint64_t a1)
{
  unint64_t v2 = sub_100030CAC();

  return CodingKey.debugDescription.getter(a1, v2);
}

double sub_1000290C8@<D0>(void *a1@<X0>, _OWORD *a2@<X8>)
{
  sub_10002E730(a1, v9);
  if (!v2)
  {
    long long v5 = v13;
    a2[4] = v12;
    a2[5] = v5;
    long long v6 = v15;
    a2[6] = v14;
    a2[7] = v6;
    long long v7 = v9[1];
    *a2 = v9[0];
    a2[1] = v7;
    double result = *(double *)&v10;
    long long v8 = v11;
    a2[2] = v10;
    a2[3] = v8;
  }
  return result;
}

uint64_t sub_10002911C(void *a1)
{
  return sub_100028DF4(a1);
}

uint64_t sub_100029134(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = sub_1000082E0(&qword_10007C898);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  long long v8 = &v13[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_10000B090(a1, a1[3]);
  sub_100030DA8();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  LOBYTE(v14) = 0;
  KeyedEncodingContainer.encode(_:forKey:)();
  if (!v2)
  {
    LOBYTE(v14) = 1;
    KeyedEncodingContainer.encode(_:forKey:)();
    LOBYTE(v14) = 2;
    KeyedEncodingContainer.encode(_:forKey:)();
    LOBYTE(v14) = 3;
    KeyedEncodingContainer.encode(_:forKey:)();
    LOBYTE(v14) = 4;
    KeyedEncodingContainer.encode(_:forKey:)();
    LOBYTE(v14) = 5;
    KeyedEncodingContainer.encode(_:forKey:)();
    long long v9 = *(_OWORD *)(v3 + 136);
    long long v16 = *(_OWORD *)(v3 + 120);
    long long v17 = v9;
    long long v10 = *(_OWORD *)(v3 + 168);
    long long v18 = *(_OWORD *)(v3 + 152);
    long long v19 = v10;
    long long v11 = *(_OWORD *)(v3 + 104);
    long long v14 = *(_OWORD *)(v3 + 88);
    long long v15 = v11;
    v13[15] = 6;
    sub_100030F28();
    KeyedEncodingContainer.encode<A>(_:forKey:)();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t sub_100029390()
{
  uint64_t result = 1701669236;
  switch(*v0)
  {
    case 1:
      uint64_t result = 0x6C65646F4D7768;
      break;
    case 2:
      uint64_t result = 0x754E6C6169726573;
      break;
    case 3:
      uint64_t result = 0x4449656369766564;
      break;
    case 4:
      uint64_t result = 0x726556646C697562;
      break;
    case 5:
      uint64_t result = 0x795474726F706572;
      break;
    case 6:
      uint64_t result = 0x737265746E756F63;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_100029480@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_10002ECE8(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1000294A8(uint64_t a1)
{
  unint64_t v2 = sub_100030DA8();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_1000294E4(uint64_t a1)
{
  unint64_t v2 = sub_100030DA8();

  return CodingKey.debugDescription.getter(a1, v2);
}

double sub_100029520@<D0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  sub_10002EFFC(a1, (uint64_t)v10);
  if (!v2)
  {
    long long v5 = v18;
    *(_OWORD *)(a2 + 128) = v17;
    *(_OWORD *)(a2 + 144) = v5;
    *(_OWORD *)(a2 + 160) = v19;
    *(void *)(a2 + 176) = v20;
    long long v6 = v14;
    *(_OWORD *)(a2 + 64) = v13;
    *(_OWORD *)(a2 + 80) = v6;
    long long v7 = v16;
    *(_OWORD *)(a2 + 96) = v15;
    *(_OWORD *)(a2 + 112) = v7;
    long long v8 = v10[1];
    *(_OWORD *)a2 = v10[0];
    *(_OWORD *)(a2 + 16) = v8;
    double result = *(double *)&v11;
    long long v9 = v12;
    *(_OWORD *)(a2 + 32) = v11;
    *(_OWORD *)(a2 + 48) = v9;
  }
  return result;
}

uint64_t sub_1000295A0(void *a1)
{
  return sub_100029134(a1);
}

uint64_t sub_1000295B8(uint64_t a1, uint64_t a2)
{
  v3[4] = a2;
  v3[5] = v2;
  v3[3] = a1;
  return _swift_task_switch(sub_1000295DC, 0, 0);
}

uint64_t sub_1000295DC()
{
  if (qword_10007A5C0 != -1) {
    swift_once();
  }
  uint64_t v1 = type metadata accessor for Logger();
  sub_10000AF48(v1, (uint64_t)qword_10007DAE0);
  uint64_t v2 = Logger.logObject.getter();
  os_log_type_t v3 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = v0[4];
    long long v5 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)long long v5 = 134217984;
    v0[2] = v4;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "preparing analytics report for generation %ld", v5, 0xCu);
    swift_slowDealloc();
  }

  long long v6 = (void *)swift_task_alloc();
  v0[6] = v6;
  *long long v6 = v0;
  v6[1] = sub_100029764;
  uint64_t v7 = v0[4];
  uint64_t v8 = v0[3];
  return sub_1000299DC(v8, v7);
}

uint64_t sub_100029764(char a1)
{
  os_log_type_t v3 = (void *)*v1;
  uint64_t v4 = (void *)*v1;
  swift_task_dealloc();
  if (a1)
  {
    long long v5 = (void *)swift_task_alloc();
    v3[7] = v5;
    void *v5 = v4;
    v5[1] = sub_1000298E0;
    uint64_t v6 = v3[4];
    uint64_t v7 = v3[3];
    return sub_10002AB2C(v7, v6);
  }
  else
  {
    long long v9 = (uint64_t (*)(void))v4[1];
    return v9(0);
  }
}

uint64_t sub_1000298E0(uint64_t a1)
{
  uint64_t v5 = *v1;
  swift_task_dealloc();
  os_log_type_t v3 = *(uint64_t (**)(uint64_t))(v5 + 8);
  return v3(a1);
}

uint64_t sub_1000299DC(uint64_t a1, uint64_t a2)
{
  v3[5] = a2;
  v3[6] = v2;
  v3[4] = a1;
  sub_1000082E0(&qword_10007C150);
  v3[7] = swift_task_alloc();
  return _swift_task_switch(sub_100029A74, 0, 0);
}

uint64_t sub_100029A74()
{
  uint64_t v1 = v0[4];
  uint64_t v2 = v0[5];
  v0[8] = *(void *)(v0[6] + 80);
  v0[9] = *(void *)(v1 + 16);
  uint64_t v3 = v0[7];
  uint64_t v16 = sub_1000082E0(&qword_10007C158);
  uint64_t v4 = *(void *)(v16 - 8);
  uint64_t v5 = swift_task_alloc();
  v0[10] = v5;
  uint64_t v6 = swift_task_alloc();
  v0[11] = v6;
  *(void *)(v6 + 16) = v2;
  uint64_t v7 = type metadata accessor for AnalyticsSchemaV2.ProcessAnalytics(0);
  v0[2] = v7;
  v0[12] = v7;
  Predicate.init(_:)();
  uint64_t v8 = sub_1000082E0(&qword_10007C160);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v3, 0, 1, v8);
  v0[13] = sub_100005CF4(&qword_10007BFC8, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV2.ProcessAnalytics);
  FetchDescriptor.init(predicate:sortBy:)();
  FetchDescriptor.fetchLimit.setter();
  unint64_t v9 = dispatch thunk of ModelContext.fetch<A>(_:)();
  v0[14] = v9;
  v0[15] = 0;
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8))(v5, v16);
  if (v9 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v11 = _CocoaArrayWrapper.endIndex.getter();
    uint64_t result = swift_bridgeObjectRelease();
    v0[16] = v11;
    if (v11)
    {
LABEL_3:
      if (v11 < 1)
      {
        __break(1u);
      }
      else
      {
        swift_bridgeObjectRetain();
        for (uint64_t i = 0; i != v11; ++i)
        {
          if ((v9 & 0xC000000000000001) != 0)
          {
            uint64_t v13 = specialized _ArrayBuffer._getElementSlowPath(_:)();
          }
          else
          {
            uint64_t v13 = *(void *)(v9 + 8 * i + 32);
            swift_retain();
          }
          sub_10002A6C8(v13);
          swift_release();
        }
        swift_bridgeObjectRelease();
        long long v15 = (void *)swift_task_alloc();
        v0[17] = v15;
        *long long v15 = v0;
        v15[1] = sub_100029FE0;
        return sub_100039F54();
      }
      return result;
    }
  }
  else
  {
    uint64_t v11 = *(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10);
    v0[16] = v11;
    if (v11) {
      goto LABEL_3;
    }
  }
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  long long v14 = (uint64_t (*)(uint64_t))v0[1];
  return v14(1);
}

uint64_t sub_100029FE0(char a1)
{
  *(unsigned char *)(*(void *)v1 + 144) = a1;
  swift_task_dealloc();
  return _swift_task_switch(sub_10002A0E0, 0, 0);
}

uint64_t sub_10002A0E0()
{
  if ((*(unsigned char *)(v0 + 144) & 1) == 0)
  {
    swift_bridgeObjectRelease();
LABEL_23:
    uint64_t v26 = 0;
LABEL_24:
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    Swift::String v27 = *(uint64_t (**)(uint64_t))(v0 + 8);
    return v27(v26);
  }
  swift_bridgeObjectRetain();
  uint64_t v1 = 0;
  do
  {
    if ((*(void *)(v0 + 112) & 0xC000000000000001) != 0) {
      specialized _ArrayBuffer._getElementSlowPath(_:)();
    }
    else {
      swift_retain();
    }
    uint64_t v2 = *(void *)(v0 + 128);
    ++v1;
    dispatch thunk of ModelContext.delete<A>(_:)();
    swift_release();
  }
  while (v1 != v2);
  swift_bridgeObjectRelease_n();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v0 + 120);
  uint64_t v4 = *(void *)(v0 + 56);
  uint64_t v5 = *(void *)(v0 + 40);
  uint64_t v6 = sub_1000082E0(&qword_10007C158);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = swift_task_alloc();
  *(void *)(v0 + 80) = v8;
  uint64_t v9 = swift_task_alloc();
  *(void *)(v0 + 88) = v9;
  *(void *)(v9 + 16) = v5;
  uint64_t v10 = type metadata accessor for AnalyticsSchemaV2.ProcessAnalytics(0);
  *(void *)(v0 + 96) = v10;
  *(void *)(v0 + 16) = v10;
  Predicate.init(_:)();
  uint64_t v11 = sub_1000082E0(&qword_10007C160);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v4, 0, 1, v11);
  *(void *)(v0 + 104) = sub_100005CF4(&qword_10007BFC8, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV2.ProcessAnalytics);
  FetchDescriptor.init(predicate:sortBy:)();
  FetchDescriptor.fetchLimit.setter();
  unint64_t v12 = dispatch thunk of ModelContext.fetch<A>(_:)();
  *(void *)(v0 + 112) = v12;
  *(void *)(v0 + 120) = v3;
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 8))(v8, v6);
  if (v3)
  {
    if (qword_10007A5C0 != -1) {
      swift_once();
    }
    uint64_t v14 = type metadata accessor for Logger();
    sub_10000AF48(v14, (uint64_t)qword_10007DAE0);
    swift_errorRetain();
    swift_errorRetain();
    long long v15 = Logger.logObject.getter();
    os_log_type_t v16 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v15, v16))
    {
      uint64_t v17 = (uint8_t *)swift_slowAlloc();
      long long v18 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v17 = 138412290;
      swift_errorRetain();
      uint64_t v19 = _swift_stdlib_bridgeErrorToNSError();
      *(void *)(v0 + 24) = v19;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *long long v18 = v19;
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v15, v16, "fetchProcessAnalyticsBatch failed: %@", v17, 0xCu);
      sub_1000082E0(&qword_10007BFB8);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      swift_errorRelease();
      swift_errorRelease();
    }
    uint64_t v23 = *(void *)(v0 + 48);

    Swift::String v24 = *(uint64_t (**)(uint64_t))(**(void **)(*(void *)(v23 + 120) + 80) + 136);
    uint64_t v25 = swift_retain();
    atomic_fetch_add_explicit((atomic_ullong *volatile)v24(v25), 1uLL, memory_order_relaxed);
    swift_errorRelease();
    swift_release();
    goto LABEL_23;
  }
  if (!(v12 >> 62))
  {
    uint64_t v20 = *(void *)((v12 & 0xFFFFFFFFFFFFFF8) + 0x10);
    *(void *)(v0 + 128) = v20;
    if (v20) {
      goto LABEL_15;
    }
LABEL_31:
    swift_bridgeObjectRelease();
    uint64_t v26 = 1;
    goto LABEL_24;
  }
  swift_bridgeObjectRetain();
  uint64_t v20 = _CocoaArrayWrapper.endIndex.getter();
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v0 + 128) = v20;
  if (!v20) {
    goto LABEL_31;
  }
LABEL_15:
  if (v20 < 1)
  {
    __break(1u);
  }
  else
  {
    swift_bridgeObjectRetain();
    for (uint64_t i = 0; i != v20; ++i)
    {
      if ((v12 & 0xC000000000000001) != 0)
      {
        uint64_t v22 = specialized _ArrayBuffer._getElementSlowPath(_:)();
      }
      else
      {
        uint64_t v22 = *(void *)(v12 + 8 * i + 32);
        swift_retain();
      }
      sub_10002A6C8(v22);
      swift_release();
    }
    swift_bridgeObjectRelease();
    Swift::String v28 = (void *)swift_task_alloc();
    *(void *)(v0 + 136) = v28;
    *Swift::String v28 = v0;
    v28[1] = sub_100029FE0;
    return sub_100039F54();
  }
  return result;
}

void sub_10002A6C8(uint64_t a1)
{
  v13._countAndFlagsBits = a1;
  swift_getKeyPath();
  sub_100005CF4(&qword_10007BF20, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV2.ProcessAnalytics);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  swift_getKeyPath();
  sub_100005CF4(&qword_10007BFC8, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV2.ProcessAnalytics);
  PersistentModel.getValue<A>(forKey:)();
  swift_release();
  char v2 = sub_1000524F8(v13);
  if (v2 == 5)
  {
    if (qword_10007A5C0 != -1) {
      swift_once();
    }
    uint64_t v3 = type metadata accessor for Logger();
    sub_10000AF48(v3, (uint64_t)qword_10007DAE0);
    uint64_t v4 = Logger.logObject.getter();
    os_log_type_t v5 = static os_log_type_t.error.getter();
    if (!os_log_type_enabled(v4, v5)) {
      goto LABEL_12;
    }
    uint64_t v6 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v6 = 0;
    uint64_t v7 = "invalid access mode in ProcessAnalytics record";
LABEL_11:
    _os_log_impl((void *)&_mh_execute_header, v4, v5, v7, v6, 2u);
    swift_slowDealloc();
LABEL_12:

    return;
  }
  char v8 = v2;
  v13._countAndFlagsBits = a1;
  swift_getKeyPath();
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  swift_getKeyPath();
  PersistentModel.getValue<A>(forKey:)();
  swift_release();
  char v9 = sub_100052544();
  if (v9 == 19)
  {
    if (qword_10007A5C0 != -1) {
      swift_once();
    }
    uint64_t v10 = type metadata accessor for Logger();
    sub_10000AF48(v10, (uint64_t)qword_10007DAE0);
    uint64_t v4 = Logger.logObject.getter();
    os_log_type_t v5 = static os_log_type_t.error.getter();
    if (!os_log_type_enabled(v4, v5)) {
      goto LABEL_12;
    }
    uint64_t v6 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v6 = 0;
    uint64_t v7 = "invalid access category in ProcessAnalytics record";
    goto LABEL_11;
  }
  char v11 = v9;
  swift_getKeyPath();
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  swift_getKeyPath();
  PersistentModel.getValue<A>(forKey:)();
  swift_release();
  object = v13._object;
  v13._countAndFlagsBits = a1;
  swift_getKeyPath();
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  swift_getKeyPath();
  PersistentModel.getValue<A>(forKey:)();
  swift_release();
  sub_1000280F4(0x737365636F7250, 0xE700000000000000, (uint64_t)&v13);
  uint64_t v14 = a1;
  long long v15 = object;
  char v16 = v8;
  char v17 = v11;
  uint64_t v18 = a1;
  sub_10003C6B4((uint64_t)&v13);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

uint64_t sub_10002AB2C(uint64_t a1, uint64_t a2)
{
  v3[5] = a2;
  v3[6] = v2;
  v3[4] = a1;
  sub_1000082E0(&qword_10007C828);
  v3[7] = swift_task_alloc();
  return _swift_task_switch(sub_10002ABC4, 0, 0);
}

uint64_t sub_10002ABC4()
{
  uint64_t v1 = v0[4];
  uint64_t v2 = v0[5];
  v0[8] = *(void *)(v0[6] + 88);
  v0[9] = *(void *)(v1 + 16);
  uint64_t v3 = v0[7];
  uint64_t v16 = sub_1000082E0(&qword_10007C830);
  uint64_t v4 = *(void *)(v16 - 8);
  uint64_t v5 = swift_task_alloc();
  v0[10] = v5;
  uint64_t v6 = swift_task_alloc();
  v0[11] = v6;
  *(void *)(v6 + 16) = v2;
  uint64_t v7 = type metadata accessor for AnalyticsSchemaV2.FileAnalytics(0);
  v0[2] = v7;
  v0[12] = v7;
  Predicate.init(_:)();
  uint64_t v8 = sub_1000082E0(&qword_10007C838);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v3, 0, 1, v8);
  v0[13] = sub_100005CF4(&qword_10007BFD0, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV2.FileAnalytics);
  FetchDescriptor.init(predicate:sortBy:)();
  FetchDescriptor.fetchLimit.setter();
  unint64_t v9 = dispatch thunk of ModelContext.fetch<A>(_:)();
  v0[14] = v9;
  v0[15] = 0;
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8))(v5, v16);
  if (v9 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v11 = _CocoaArrayWrapper.endIndex.getter();
    uint64_t result = swift_bridgeObjectRelease();
    v0[16] = v11;
    if (v11)
    {
LABEL_3:
      if (v11 < 1)
      {
        __break(1u);
      }
      else
      {
        swift_bridgeObjectRetain();
        for (uint64_t i = 0; i != v11; ++i)
        {
          if ((v9 & 0xC000000000000001) != 0)
          {
            uint64_t v13 = specialized _ArrayBuffer._getElementSlowPath(_:)();
          }
          else
          {
            uint64_t v13 = *(void *)(v9 + 8 * i + 32);
            swift_retain();
          }
          sub_10002B818(v13);
          swift_release();
        }
        swift_bridgeObjectRelease();
        long long v15 = (void *)swift_task_alloc();
        v0[17] = v15;
        *long long v15 = v0;
        v15[1] = sub_10002B130;
        return sub_100039F54();
      }
      return result;
    }
  }
  else
  {
    uint64_t v11 = *(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10);
    v0[16] = v11;
    if (v11) {
      goto LABEL_3;
    }
  }
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v14 = (uint64_t (*)(uint64_t))v0[1];
  return v14(1);
}

uint64_t sub_10002B130(char a1)
{
  *(unsigned char *)(*(void *)v1 + 144) = a1;
  swift_task_dealloc();
  return _swift_task_switch(sub_10002B230, 0, 0);
}

uint64_t sub_10002B230()
{
  if ((*(unsigned char *)(v0 + 144) & 1) == 0)
  {
    swift_bridgeObjectRelease();
LABEL_23:
    uint64_t v26 = 0;
LABEL_24:
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    Swift::String v27 = *(uint64_t (**)(uint64_t))(v0 + 8);
    return v27(v26);
  }
  swift_bridgeObjectRetain();
  uint64_t v1 = 0;
  do
  {
    if ((*(void *)(v0 + 112) & 0xC000000000000001) != 0) {
      specialized _ArrayBuffer._getElementSlowPath(_:)();
    }
    else {
      swift_retain();
    }
    uint64_t v2 = *(void *)(v0 + 128);
    ++v1;
    dispatch thunk of ModelContext.delete<A>(_:)();
    swift_release();
  }
  while (v1 != v2);
  swift_bridgeObjectRelease_n();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v0 + 120);
  uint64_t v4 = *(void *)(v0 + 56);
  uint64_t v5 = *(void *)(v0 + 40);
  uint64_t v6 = sub_1000082E0(&qword_10007C830);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = swift_task_alloc();
  *(void *)(v0 + 80) = v8;
  uint64_t v9 = swift_task_alloc();
  *(void *)(v0 + 88) = v9;
  *(void *)(v9 + 16) = v5;
  uint64_t v10 = type metadata accessor for AnalyticsSchemaV2.FileAnalytics(0);
  *(void *)(v0 + 96) = v10;
  *(void *)(v0 + 16) = v10;
  Predicate.init(_:)();
  uint64_t v11 = sub_1000082E0(&qword_10007C838);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v4, 0, 1, v11);
  *(void *)(v0 + 104) = sub_100005CF4(&qword_10007BFD0, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV2.FileAnalytics);
  FetchDescriptor.init(predicate:sortBy:)();
  FetchDescriptor.fetchLimit.setter();
  unint64_t v12 = dispatch thunk of ModelContext.fetch<A>(_:)();
  *(void *)(v0 + 112) = v12;
  *(void *)(v0 + 120) = v3;
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 8))(v8, v6);
  if (v3)
  {
    if (qword_10007A5C0 != -1) {
      swift_once();
    }
    uint64_t v14 = type metadata accessor for Logger();
    sub_10000AF48(v14, (uint64_t)qword_10007DAE0);
    swift_errorRetain();
    swift_errorRetain();
    long long v15 = Logger.logObject.getter();
    os_log_type_t v16 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v15, v16))
    {
      uint64_t v17 = (uint8_t *)swift_slowAlloc();
      uint64_t v18 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v17 = 138412290;
      swift_errorRetain();
      uint64_t v19 = _swift_stdlib_bridgeErrorToNSError();
      *(void *)(v0 + 24) = v19;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *uint64_t v18 = v19;
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v15, v16, "fetchFileAnalyticsBatch failed: %@", v17, 0xCu);
      sub_1000082E0(&qword_10007BFB8);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      swift_errorRelease();
      swift_errorRelease();
    }
    uint64_t v23 = *(void *)(v0 + 48);

    Swift::String v24 = *(uint64_t (**)(uint64_t))(**(void **)(*(void *)(v23 + 120) + 80) + 136);
    uint64_t v25 = swift_retain();
    atomic_fetch_add_explicit((atomic_ullong *volatile)v24(v25), 1uLL, memory_order_relaxed);
    swift_errorRelease();
    swift_release();
    goto LABEL_23;
  }
  if (!(v12 >> 62))
  {
    uint64_t v20 = *(void *)((v12 & 0xFFFFFFFFFFFFFF8) + 0x10);
    *(void *)(v0 + 128) = v20;
    if (v20) {
      goto LABEL_15;
    }
LABEL_31:
    swift_bridgeObjectRelease();
    uint64_t v26 = 1;
    goto LABEL_24;
  }
  swift_bridgeObjectRetain();
  uint64_t v20 = _CocoaArrayWrapper.endIndex.getter();
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v0 + 128) = v20;
  if (!v20) {
    goto LABEL_31;
  }
LABEL_15:
  if (v20 < 1)
  {
    __break(1u);
  }
  else
  {
    swift_bridgeObjectRetain();
    for (uint64_t i = 0; i != v20; ++i)
    {
      if ((v12 & 0xC000000000000001) != 0)
      {
        uint64_t v22 = specialized _ArrayBuffer._getElementSlowPath(_:)();
      }
      else
      {
        uint64_t v22 = *(void *)(v12 + 8 * i + 32);
        swift_retain();
      }
      sub_10002B818(v22);
      swift_release();
    }
    swift_bridgeObjectRelease();
    Swift::String v28 = (void *)swift_task_alloc();
    *(void *)(v0 + 136) = v28;
    *Swift::String v28 = v0;
    v28[1] = sub_10002B130;
    return sub_100039F54();
  }
  return result;
}

void sub_10002B818(uint64_t a1)
{
  v19[0]._countAndFlagsBits = a1;
  swift_getKeyPath();
  sub_100005CF4(&qword_10007BF00, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV2.FileAnalytics);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  swift_getKeyPath();
  sub_100005CF4(&qword_10007BFD0, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV2.FileAnalytics);
  PersistentModel.getValue<A>(forKey:)();
  swift_release();
  char v2 = sub_1000524F8(v19[0]);
  if (v2 == 5)
  {
    if (qword_10007A5C0 != -1) {
      swift_once();
    }
    uint64_t v3 = type metadata accessor for Logger();
    sub_10000AF48(v3, (uint64_t)qword_10007DAE0);
    uint64_t v4 = Logger.logObject.getter();
    os_log_type_t v5 = static os_log_type_t.error.getter();
    if (!os_log_type_enabled(v4, v5)) {
      goto LABEL_12;
    }
    uint64_t v6 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v6 = 0;
    uint64_t v7 = "invalid access mode in FileAnalytics record";
LABEL_11:
    _os_log_impl((void *)&_mh_execute_header, v4, v5, v7, v6, 2u);
    swift_slowDealloc();
LABEL_12:

    return;
  }
  char v8 = v2;
  v19[0]._countAndFlagsBits = a1;
  swift_getKeyPath();
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  swift_getKeyPath();
  PersistentModel.getValue<A>(forKey:)();
  swift_release();
  char v9 = sub_100052544();
  if (v9 == 19)
  {
    if (qword_10007A5C0 != -1) {
      swift_once();
    }
    uint64_t v10 = type metadata accessor for Logger();
    sub_10000AF48(v10, (uint64_t)qword_10007DAE0);
    uint64_t v4 = Logger.logObject.getter();
    os_log_type_t v5 = static os_log_type_t.error.getter();
    if (!os_log_type_enabled(v4, v5)) {
      goto LABEL_12;
    }
    uint64_t v6 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v6 = 0;
    uint64_t v7 = "invalid access category in FileAnalytics record";
    goto LABEL_11;
  }
  char v11 = v9;
  swift_getKeyPath();
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  swift_getKeyPath();
  PersistentModel.getValue<A>(forKey:)();
  swift_release();
  object = v19[0]._object;
  swift_getKeyPath();
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  swift_getKeyPath();
  PersistentModel.getValue<A>(forKey:)();
  swift_release();
  unint64_t v12 = v19[0]._object;
  swift_getKeyPath();
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  swift_getKeyPath();
  PersistentModel.getValue<A>(forKey:)();
  swift_release();
  swift_getKeyPath();
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  swift_getKeyPath();
  PersistentModel.getValue<A>(forKey:)();
  swift_release();
  v19[0]._countAndFlagsBits = a1;
  swift_getKeyPath();
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  swift_getKeyPath();
  PersistentModel.getValue<A>(forKey:)();
  swift_release();
  sub_1000280F4(1701603654, 0xE400000000000000, (uint64_t)v19);
  v14[0] = v19[0];
  v14[1] = v19[1];
  v14[2] = v19[2];
  v14[3] = v19[3];
  v14[4] = v19[4];
  *(void *)&long long v15 = v20;
  *((void *)&v15 + 1) = a1;
  *(void *)&long long v16 = object;
  *((void *)&v16 + 1) = a1;
  *(void *)&long long v17 = v12;
  BYTE8(v17) = v8;
  BYTE9(v17) = v11;
  HIDWORD(v17) = a1;
  LODWORD(v18) = a1;
  *((void *)&v18 + 1) = a1;
  long long v22 = v17;
  long long v23 = v18;
  long long v20 = v15;
  long long v21 = v16;
  sub_10003CAC4((long long *)&v19[0]._countAndFlagsBits);
  sub_10002FAA8((uint64_t)v14);
}

uint64_t sub_10002BDB8(uint64_t a1)
{
  uint64_t v4 = sub_1000082E0(&qword_10007C038);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = &v33[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v7 = type metadata accessor for Date();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  char v36 = &v33[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v10 = *(void *)(v1 + 16);
  if ((*(unsigned char *)(v1 + 24) & 1) == 0 && (*(unsigned char *)(v1 + 40) & 1) == 0)
  {
    uint64_t v11 = *(void *)(v1 + 32);
    BOOL v12 = __OFADD__(v10, v11);
    v10 += v11;
    if (v12)
    {
      __break(1u);
      goto LABEL_35;
    }
  }
  int v34 = *(unsigned __int8 *)(v1 + 24);
  uint64_t v35 = v10;
  uint64_t v37 = a1;
  swift_getKeyPath();
  sub_100005CF4(&qword_10007BEE0, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV2.PipelineState);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  swift_getKeyPath();
  uint64_t v2 = v8;
  sub_100005CF4(&qword_10007BFD8, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV2.PipelineState);
  sub_10002F958();
  PersistentModel.getValue<A>(forKey:)();
  swift_release();
  uint64_t v13 = *(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v8 + 48);
  uint64_t v8 = v7;
  if (v13(v6, 1, v7) == 1)
  {
    sub_100020398((uint64_t)v6);
    return 0;
  }
  uint64_t v7 = (uint64_t)v36;
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v2 + 32))(v36, v6, v8);
  Date.timeIntervalSinceNow.getter();
  double v15 = round(v14);
  if (v15 <= -9.22337204e18 || v15 >= 9.22337204e18)
  {
    uint64_t v37 = a1;
    swift_getKeyPath();
    ObservationRegistrar.access<A, B>(_:keyPath:)();
    swift_release();
    swift_getKeyPath();
    sub_10002FA04();
    PersistentModel.getValue<A>(forKey:)();
    swift_release();
    if ((v38 & 1) == 0)
    {
      if (qword_10007A5C0 == -1)
      {
LABEL_12:
        uint64_t v17 = type metadata accessor for Logger();
        sub_10000AF48(v17, (uint64_t)qword_10007DAE0);
        long long v18 = Logger.logObject.getter();
        os_log_type_t v19 = static os_log_type_t.error.getter();
        if (os_log_type_enabled(v18, v19))
        {
          long long v20 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)long long v20 = 0;
          _os_log_impl((void *)&_mh_execute_header, v18, v19, "invalid report time from database", v20, 2u);
          swift_slowDealloc();
        }

LABEL_25:
        (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v7, v8);
        return 0;
      }
LABEL_35:
      swift_once();
      goto LABEL_12;
    }
LABEL_31:
    (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v7, v8);
    return 0;
  }
  uint64_t v21 = (uint64_t)v15;
  if (v35 >= (uint64_t)v15) {
    char v22 = 1;
  }
  else {
    char v22 = v34;
  }
  if ((v22 & 1) == 0)
  {
    if (qword_10007A5C0 != -1) {
      swift_once();
    }
    uint64_t v28 = type metadata accessor for Logger();
    sub_10000AF48(v28, (uint64_t)qword_10007DAE0);
    uint64_t v29 = Logger.logObject.getter();
    os_log_type_t v30 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v29, v30))
    {
      Swift::String v31 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)Swift::String v31 = 0;
      _os_log_impl((void *)&_mh_execute_header, v29, v30, "discarding report time from database (too large)", v31, 2u);
      swift_slowDealloc();
    }

    goto LABEL_31;
  }
  if (qword_10007A5C0 != -1) {
    swift_once();
  }
  uint64_t v23 = type metadata accessor for Logger();
  sub_10000AF48(v23, (uint64_t)qword_10007DAE0);
  Swift::String v24 = Logger.logObject.getter();
  os_log_type_t v25 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v24, v25))
  {
    uint64_t v26 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v26 = 134217984;
    uint64_t v7 = (uint64_t)v36;
    uint64_t v37 = v21;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v24, v25, "first report time from database: %ld", v26, 0xCu);
    swift_slowDealloc();
  }

  if (v21 <= 0) {
    goto LABEL_25;
  }
  uint64_t v27 = 1000000000000000000 * v21;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v7, v8);
  return v27;
}

uint64_t sub_10002C3A4(char a1)
{
  if (*(unsigned char *)(v1 + 24)) {
    return 0;
  }
  if ((a1 & 1) != 0 && (*(unsigned char *)(v1 + 56) & 1) == 0)
  {
    unint64_t v3 = sub_10002F8E8(*(void *)(v1 + 48), *(void *)(v1 + 64), *(unsigned char *)(v1 + 72));
    if (qword_10007A5C0 != -1) {
      swift_once();
    }
    uint64_t v9 = type metadata accessor for Logger();
    sub_10000AF48(v9, (uint64_t)qword_10007DAE0);
    uint64_t v5 = Logger.logObject.getter();
    os_log_type_t v6 = static os_log_type_t.info.getter();
    if (!os_log_type_enabled(v5, v6)) {
      goto LABEL_14;
    }
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v7 = 134217984;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    uint64_t v8 = "next report retry in %ld seconds";
  }
  else
  {
    unint64_t v3 = sub_10002F8E8(*(void *)(v1 + 16), *(void *)(v1 + 32), *(unsigned char *)(v1 + 40));
    if (qword_10007A5C0 != -1) {
      swift_once();
    }
    uint64_t v4 = type metadata accessor for Logger();
    sub_10000AF48(v4, (uint64_t)qword_10007DAE0);
    uint64_t v5 = Logger.logObject.getter();
    os_log_type_t v6 = static os_log_type_t.info.getter();
    if (!os_log_type_enabled(v5, v6)) {
      goto LABEL_14;
    }
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v7 = 134217984;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    uint64_t v8 = "next report in %ld seconds";
  }
  _os_log_impl((void *)&_mh_execute_header, v5, v6, v8, v7, 0xCu);
  swift_slowDealloc();
LABEL_14:

  return 1000000000000000000 * v3;
}

uint64_t sub_10002C5E4()
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for AnalyticsReporter()
{
  return self;
}

__n128 initializeWithCopy for AnalyticsReporterConfig(uint64_t a1, long long *a2)
{
  long long v2 = *a2;
  long long v3 = a2[2];
  *(_OWORD *)(a1 + 16) = a2[1];
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)a1 = v2;
  __n128 result = (__n128)a2[3];
  long long v5 = a2[4];
  long long v6 = a2[5];
  *(void *)(a1 + 96) = *((void *)a2 + 12);
  *(_OWORD *)(a1 + 64) = v5;
  *(_OWORD *)(a1 + 80) = v6;
  *(__n128 *)(a1 + 48) = result;
  return result;
}

uint64_t getEnumTagSinglePayload for AnalyticsReporterConfig(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFF && *(unsigned char *)(a1 + 104)) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 80);
  BOOL v4 = v3 >= 2;
  int v5 = (v3 + 2147483646) & 0x7FFFFFFF;
  if (!v4) {
    int v5 = -1;
  }
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for AnalyticsReporterConfig(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 - 255;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 104) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 104) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 80) = a2 + 1;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AnalyticsReporterConfig()
{
  return &type metadata for AnalyticsReporterConfig;
}

uint64_t sub_10002C744(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000015 && a2 == 0x800000010005D6D0
    || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000014 && a2 == 0x800000010005D6F0 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD000000000000012 && a2 == 0x800000010005D710 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x800000010005D730 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0xD000000000000010 && a2 == 0x800000010005D750 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0x63746142656C6966 && a2 == 0xED0000657A695368 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0x726F706552676F6CLL && a2 == 0xEA00000000007374 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else if (a1 == 0xD000000000000012 && a2 == 0x800000010005D770)
  {
    swift_bridgeObjectRelease();
    return 7;
  }
  else
  {
    char v5 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if (v5) {
      return 7;
    }
    else {
      return 8;
    }
  }
}

uint64_t sub_10002CA88@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = sub_1000082E0(&qword_10007C800);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000B090(a1, a1[3]);
  sub_10002F7EC();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v2) {
    return sub_100008540((uint64_t)a1);
  }
  char v30 = 0;
  uint64_t v9 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
  char v11 = v10;
  char v30 = 1;
  uint64_t v12 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
  int v32 = v13;
  uint64_t v29 = v12;
  char v30 = 2;
  uint64_t v14 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
  int v27 = v15;
  uint64_t v28 = v14;
  char v30 = 3;
  uint64_t v16 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
  int v25 = v17;
  uint64_t v26 = v16;
  char v30 = 4;
  uint64_t v24 = KeyedDecodingContainer.decode(_:forKey:)();
  char v30 = 5;
  uint64_t v23 = KeyedDecodingContainer.decode(_:forKey:)();
  char v30 = 6;
  HIDWORD(v22) = KeyedDecodingContainer.decode(_:forKey:)();
  char v33 = 7;
  sub_10002F840();
  KeyedDecodingContainer.decode<A>(_:forKey:)();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  char v18 = v30;
  uint64_t v19 = v31;
  uint64_t result = sub_100008540((uint64_t)a1);
  *(void *)a2 = v9;
  *(unsigned char *)(a2 + 8) = v11 & 1;
  *(void *)(a2 + 16) = v29;
  *(unsigned char *)(a2 + 24) = v32 & 1;
  *(void *)(a2 + 32) = v28;
  *(unsigned char *)(a2 + 40) = v27 & 1;
  *(void *)(a2 + 48) = v26;
  *(unsigned char *)(a2 + 56) = v25 & 1;
  uint64_t v21 = v23;
  *(void *)(a2 + 64) = v24;
  *(void *)(a2 + 72) = v21;
  *(unsigned char *)(a2 + 80) = BYTE4(v22) & 1;
  *(unsigned char *)(a2 + 88) = v18;
  *(void *)(a2 + 96) = v19;
  return result;
}

uint64_t sub_10002CDB0(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 1701669236 && a2 == 0xE400000000000000;
  if (v2 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6C65646F4D7768 && a2 == 0xE700000000000000 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x754E6C6169726573 && a2 == 0xEC0000007265626DLL {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x4449656369766564 && a2 == 0xE800000000000000 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x726556646C697562 && a2 == 0xEC0000006E6F6973 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0x795474726F706572 && a2 == 0xEA00000000006570 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0x737365636F7270 && a2 == 0xE700000000000000 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else if (a1 == 1701080941 && a2 == 0xE400000000000000 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 7;
  }
  else if (a1 == 0x79726F6765746163 && a2 == 0xE800000000000000 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 8;
  }
  else if (a1 == 0x746E756F63 && a2 == 0xE500000000000000)
  {
    swift_bridgeObjectRelease();
    return 9;
  }
  else
  {
    char v6 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if (v6) {
      return 9;
    }
    else {
      return 10;
    }
  }
}

uint64_t sub_10002D1D8@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = sub_1000082E0(&qword_10007C8C0);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v38 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000B090(a1, a1[3]);
  sub_10003105C();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v2) {
    return sub_100008540((uint64_t)a1);
  }
  char v65 = 0;
  uint64_t v9 = KeyedDecodingContainer.decode(_:forKey:)();
  char v64 = 1;
  uint64_t v49 = KeyedDecodingContainer.decode(_:forKey:)();
  char v63 = 2;
  uint64_t v11 = v10;
  swift_bridgeObjectRetain();
  uint64_t v12 = KeyedDecodingContainer.decode(_:forKey:)();
  uint64_t v53 = v11;
  uint64_t v48 = v12;
  char v62 = 3;
  uint64_t v14 = v13;
  swift_bridgeObjectRetain();
  uint64_t v15 = KeyedDecodingContainer.decode(_:forKey:)();
  uint64_t v52 = v14;
  uint64_t v47 = v15;
  char v61 = 4;
  uint64_t v17 = v16;
  swift_bridgeObjectRetain();
  uint64_t v18 = KeyedDecodingContainer.decode(_:forKey:)();
  uint64_t v51 = v17;
  uint64_t v46 = v18;
  char v60 = 5;
  uint64_t v50 = v19;
  swift_bridgeObjectRetain();
  uint64_t v44 = KeyedDecodingContainer.decode(_:forKey:)();
  uint64_t v45 = v20;
  char v59 = 6;
  swift_bridgeObjectRetain();
  uint64_t v42 = KeyedDecodingContainer.decode(_:forKey:)();
  uint64_t v21 = v45;
  char v57 = 7;
  uint64_t v23 = v22;
  sub_100022D1C();
  uint64_t v43 = v23;
  swift_bridgeObjectRetain();
  KeyedDecodingContainer.decode<A>(_:forKey:)();
  uint64_t v41 = v9;
  uint64_t v24 = v43;
  int v40 = v58;
  char v55 = 8;
  sub_100022F80();
  KeyedDecodingContainer.decode<A>(_:forKey:)();
  int v39 = v56;
  char v54 = 9;
  uint64_t v25 = KeyedDecodingContainer.decode(_:forKey:)();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  sub_100008540((uint64_t)a1);
  swift_bridgeObjectRelease();
  uint64_t v26 = v21;
  swift_bridgeObjectRelease();
  uint64_t v27 = v50;
  swift_bridgeObjectRelease();
  uint64_t v28 = v51;
  swift_bridgeObjectRelease();
  uint64_t v29 = v52;
  swift_bridgeObjectRelease();
  uint64_t v30 = v53;
  uint64_t result = swift_bridgeObjectRelease();
  uint64_t v32 = v49;
  *(void *)a2 = v41;
  *(void *)(a2 + 8) = v32;
  uint64_t v33 = v48;
  *(void *)(a2 + 16) = v30;
  *(void *)(a2 + 24) = v33;
  uint64_t v34 = v47;
  *(void *)(a2 + 32) = v29;
  *(void *)(a2 + 40) = v34;
  uint64_t v35 = v46;
  *(void *)(a2 + 48) = v28;
  *(void *)(a2 + 56) = v35;
  uint64_t v36 = v44;
  *(void *)(a2 + 64) = v27;
  *(void *)(a2 + 72) = v36;
  uint64_t v37 = v42;
  *(void *)(a2 + 80) = v26;
  *(void *)(a2 + 88) = v37;
  *(void *)(a2 + 96) = v24;
  *(unsigned char *)(a2 + 104) = v40;
  *(unsigned char *)(a2 + 105) = v39;
  *(void *)(a2 + 112) = v25;
  return result;
}

uint64_t sub_10002D8AC(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 1701669236 && a2 == 0xE400000000000000;
  if (v2 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6C65646F4D7768 && a2 == 0xE700000000000000 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x754E6C6169726573 && a2 == 0xEC0000007265626DLL {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x4449656369766564 && a2 == 0xE800000000000000 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x726556646C697562 && a2 == 0xEC0000006E6F6973 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0x795474726F706572 && a2 == 0xEA00000000006570 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0x737365636F7270 && a2 == 0xE700000000000000 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else if (a1 == 1752457584 && a2 == 0xE400000000000000 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 7;
  }
  else if (a1 == 1701080941 && a2 == 0xE400000000000000 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 8;
  }
  else if (a1 == 0x79726F6765746163 && a2 == 0xE800000000000000 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 9;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x800000010005D310 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 10;
  }
  else if (a1 == 0x745367616279656BLL && a2 == 0xEB00000000657461 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 11;
  }
  else if (a1 == 0x6279654B65726F6DLL && a2 == 0xEF65746174536761)
  {
    swift_bridgeObjectRelease();
    return 12;
  }
  else
  {
    char v6 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if (v6) {
      return 12;
    }
    else {
      return 13;
    }
  }
}

uint64_t sub_10002DE2C@<X0>(void *a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v5 = sub_1000082E0(&qword_10007C8A8);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v42 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = a1[3];
  char v61 = a1;
  sub_10000B090(a1, v9);
  sub_100030F7C();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v2) {
    return sub_100008540((uint64_t)v61);
  }
  uint64_t v10 = v6;
  char v54 = a2;
  LOBYTE(v71[0]) = 0;
  uint64_t v11 = KeyedDecodingContainer.decode(_:forKey:)();
  LOBYTE(v71[0]) = 1;
  uint64_t v12 = KeyedDecodingContainer.decode(_:forKey:)();
  LOBYTE(v71[0]) = 2;
  uint64_t v14 = v13;
  swift_bridgeObjectRetain();
  uint64_t v15 = KeyedDecodingContainer.decode(_:forKey:)();
  uint64_t v60 = v14;
  uint64_t v53 = v15;
  LOBYTE(v71[0]) = 3;
  uint64_t v17 = v16;
  swift_bridgeObjectRetain();
  uint64_t v18 = KeyedDecodingContainer.decode(_:forKey:)();
  uint64_t v59 = v17;
  uint64_t v52 = v18;
  LOBYTE(v71[0]) = 4;
  uint64_t v20 = v19;
  swift_bridgeObjectRetain();
  uint64_t v21 = KeyedDecodingContainer.decode(_:forKey:)();
  uint64_t v58 = v20;
  uint64_t v51 = v21;
  LOBYTE(v71[0]) = 5;
  uint64_t v23 = v22;
  swift_bridgeObjectRetain();
  uint64_t v24 = KeyedDecodingContainer.decode(_:forKey:)();
  uint64_t v57 = v23;
  uint64_t v49 = v24;
  uint64_t v50 = v10;
  LOBYTE(v71[0]) = 6;
  uint64_t v56 = v25;
  swift_bridgeObjectRetain();
  uint64_t v48 = KeyedDecodingContainer.decode(_:forKey:)();
  LOBYTE(v71[0]) = 7;
  uint64_t v55 = v26;
  swift_bridgeObjectRetain();
  uint64_t v46 = KeyedDecodingContainer.decode(_:forKey:)();
  LOBYTE(v62) = 8;
  uint64_t v28 = v27;
  sub_100022D1C();
  uint64_t v47 = v28;
  swift_bridgeObjectRetain();
  KeyedDecodingContainer.decode<A>(_:forKey:)();
  uint64_t v29 = v47;
  LODWORD(v50) = LOBYTE(v71[0]);
  LOBYTE(v62) = 9;
  sub_100022F80();
  KeyedDecodingContainer.decode<A>(_:forKey:)();
  int v77 = LOBYTE(v71[0]);
  LOBYTE(v71[0]) = 10;
  int v45 = KeyedDecodingContainer.decode(_:forKey:)();
  LOBYTE(v71[0]) = 11;
  int v44 = KeyedDecodingContainer.decode(_:forKey:)();
  char v78 = 12;
  uint64_t v30 = KeyedDecodingContainer.decode(_:forKey:)();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v8, v5);
  *(void *)&long long v62 = v11;
  *((void *)&v62 + 1) = v12;
  *(void *)&long long v63 = v60;
  *((void *)&v63 + 1) = v53;
  *(void *)&long long v64 = v59;
  *((void *)&v64 + 1) = v52;
  uint64_t v31 = v58;
  *(void *)&long long v65 = v58;
  *((void *)&v65 + 1) = v51;
  *(void *)&long long v66 = v57;
  *((void *)&v66 + 1) = v49;
  *(void *)&long long v67 = v56;
  *((void *)&v67 + 1) = v48;
  *(void *)&long long v68 = v55;
  *((void *)&v68 + 1) = v46;
  *(void *)&long long v69 = v29;
  BYTE8(v69) = v50;
  BYTE9(v69) = v77;
  HIDWORD(v69) = v45;
  LODWORD(v70) = v44;
  uint64_t v43 = v30;
  *((void *)&v70 + 1) = v30;
  sub_100030FD0((uint64_t)&v62);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v32 = v57;
  swift_bridgeObjectRelease();
  uint64_t v33 = v56;
  swift_bridgeObjectRelease();
  uint64_t v34 = v55;
  swift_bridgeObjectRelease();
  uint64_t v35 = v47;
  swift_bridgeObjectRelease();
  sub_100008540((uint64_t)v61);
  v71[0] = v11;
  v71[1] = v12;
  v71[2] = v60;
  v71[3] = v53;
  v71[4] = v59;
  v71[5] = v52;
  v71[6] = v31;
  v71[7] = v51;
  v71[8] = v32;
  v71[9] = v49;
  v71[10] = v33;
  v71[11] = v48;
  v71[12] = v34;
  v71[13] = v46;
  v71[14] = v35;
  char v72 = v50;
  char v73 = v77;
  int v74 = v45;
  int v75 = v44;
  uint64_t v76 = v43;
  uint64_t result = sub_10002FAA8((uint64_t)v71);
  long long v37 = v69;
  uint64_t v38 = v54;
  v54[6] = v68;
  v38[7] = v37;
  v38[8] = v70;
  long long v39 = v65;
  v38[2] = v64;
  v38[3] = v39;
  long long v40 = v67;
  v38[4] = v66;
  v38[5] = v40;
  long long v41 = v63;
  *uint64_t v38 = v62;
  v38[1] = v41;
  return result;
}

uint64_t sub_10002E730@<X0>(void *a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v5 = sub_1000082E0(&qword_10007C858);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v39 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = a1[3];
  char v54 = a1;
  sub_10000B090(a1, v9);
  sub_100030CAC();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v2)
  {
    sub_100008540((uint64_t)v54);
    return (uint64_t)v8;
  }
  else
  {
    uint64_t v10 = v6;
    uint64_t v52 = a2;
    LOBYTE(v63[0]) = 0;
    uint64_t v11 = KeyedDecodingContainer.decode(_:forKey:)();
    LOBYTE(v63[0]) = 1;
    uint64_t v51 = KeyedDecodingContainer.decode(_:forKey:)();
    LOBYTE(v63[0]) = 2;
    uint64_t v13 = v12;
    swift_bridgeObjectRetain();
    uint64_t v14 = KeyedDecodingContainer.decode(_:forKey:)();
    uint64_t v49 = v11;
    uint64_t v50 = v14;
    uint64_t v15 = v13;
    LOBYTE(v63[0]) = 3;
    uint64_t v17 = v16;
    swift_bridgeObjectRetain();
    uint64_t v18 = KeyedDecodingContainer.decode(_:forKey:)();
    uint64_t v53 = v17;
    uint64_t v19 = v18;
    LOBYTE(v63[0]) = 4;
    uint64_t v21 = v20;
    swift_bridgeObjectRetain();
    uint64_t v46 = KeyedDecodingContainer.decode(_:forKey:)();
    uint64_t v47 = v19;
    uint64_t v22 = v21;
    LOBYTE(v63[0]) = 5;
    uint64_t v48 = v23;
    swift_bridgeObjectRetain();
    uint64_t v24 = KeyedDecodingContainer.decode(_:forKey:)();
    uint64_t v26 = v25;
    uint64_t v44 = v24;
    char v67 = 6;
    sub_100030D00();
    uint64_t v45 = v26;
    swift_bridgeObjectRetain();
    KeyedDecodingContainer.decode<A>(_:forKey:)();
    (*(void (**)(char *, uint64_t))(v10 + 8))(v8, v5);
    uint64_t v42 = v65;
    uint64_t v43 = v64;
    uint64_t v40 = v66;
    uint64_t v41 = *((void *)&v65 + 1);
    uint64_t v39 = *((void *)&v66 + 1);
    uint64_t v28 = v48;
    uint64_t v27 = v49;
    *(void *)&long long v55 = v49;
    *((void *)&v55 + 1) = v51;
    uint64_t v29 = v15;
    *(void *)&long long v56 = v15;
    uint64_t v30 = v50;
    uint64_t v31 = v53;
    *((void *)&v56 + 1) = v50;
    *(void *)&long long v57 = v53;
    *((void *)&v57 + 1) = v47;
    *(void *)&long long v58 = v22;
    uint64_t v32 = v45;
    *((void *)&v58 + 1) = v46;
    *(void *)&long long v59 = v48;
    *((void *)&v59 + 1) = v44;
    *(void *)&long long v60 = v45;
    *((void *)&v60 + 1) = v64;
    long long v61 = v65;
    long long v62 = v66;
    sub_100030E50((uint64_t)&v55);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_100008540((uint64_t)v54);
    v63[0] = v27;
    v63[1] = v51;
    v63[2] = v29;
    v63[3] = v30;
    v63[4] = v31;
    v63[5] = v47;
    v63[6] = v22;
    v63[7] = v46;
    v63[8] = v28;
    v63[9] = v44;
    v63[10] = v32;
    v63[11] = v43;
    v63[12] = v42;
    v63[13] = v41;
    v63[14] = v40;
    v63[15] = v39;
    uint64_t result = sub_100030EBC((uint64_t)v63);
    long long v34 = v60;
    uint64_t v35 = v52;
    v52[4] = v59;
    v35[5] = v34;
    long long v36 = v62;
    v35[6] = v61;
    v35[7] = v36;
    long long v37 = v56;
    *uint64_t v35 = v55;
    v35[1] = v37;
    long long v38 = v58;
    v35[2] = v57;
    v35[3] = v38;
  }
  return result;
}

uint64_t sub_10002ECE8(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 1701669236 && a2 == 0xE400000000000000;
  if (v2 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6C65646F4D7768 && a2 == 0xE700000000000000 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x754E6C6169726573 && a2 == 0xEC0000007265626DLL {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x4449656369766564 && a2 == 0xE800000000000000 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x726556646C697562 && a2 == 0xEC0000006E6F6973 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0x795474726F706572 && a2 == 0xEA00000000006570 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0x737265746E756F63 && a2 == 0xE800000000000000)
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else
  {
    char v6 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if (v6) {
      return 6;
    }
    else {
      return 7;
    }
  }
}

uint64_t sub_10002EFFC@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = sub_1000082E0(&qword_10007C880);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v40 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = a1[3];
  long long v62 = a1;
  sub_10000B090(a1, v9);
  sub_100030DA8();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v2)
  {
    sub_100008540((uint64_t)v62);
    return (uint64_t)v8;
  }
  else
  {
    uint64_t v10 = v6;
    uint64_t v60 = a2;
    LOBYTE(v75[0]) = 0;
    uint64_t v11 = KeyedDecodingContainer.decode(_:forKey:)();
    LOBYTE(v75[0]) = 1;
    uint64_t v59 = KeyedDecodingContainer.decode(_:forKey:)();
    LOBYTE(v75[0]) = 2;
    uint64_t v13 = v12;
    swift_bridgeObjectRetain();
    uint64_t v14 = KeyedDecodingContainer.decode(_:forKey:)();
    uint64_t v57 = v11;
    uint64_t v58 = v14;
    uint64_t v15 = v13;
    LOBYTE(v75[0]) = 3;
    uint64_t v17 = v16;
    swift_bridgeObjectRetain();
    uint64_t v18 = KeyedDecodingContainer.decode(_:forKey:)();
    uint64_t v61 = v17;
    uint64_t v19 = v18;
    LOBYTE(v75[0]) = 4;
    uint64_t v21 = v20;
    swift_bridgeObjectRetain();
    uint64_t v54 = KeyedDecodingContainer.decode(_:forKey:)();
    uint64_t v55 = v19;
    uint64_t v22 = v21;
    LOBYTE(v75[0]) = 5;
    uint64_t v56 = v23;
    swift_bridgeObjectRetain();
    uint64_t v24 = KeyedDecodingContainer.decode(_:forKey:)();
    uint64_t v26 = v25;
    uint64_t v52 = v24;
    char v83 = 6;
    sub_100030DFC();
    uint64_t v53 = v26;
    swift_bridgeObjectRetain();
    KeyedDecodingContainer.decode<A>(_:forKey:)();
    (*(void (**)(char *, uint64_t))(v10 + 8))(v8, v5);
    uint64_t v50 = v77;
    uint64_t v51 = v76;
    uint64_t v48 = v78;
    uint64_t v49 = *((void *)&v77 + 1);
    uint64_t v46 = v79;
    uint64_t v47 = *((void *)&v78 + 1);
    uint64_t v44 = v80;
    uint64_t v45 = *((void *)&v79 + 1);
    uint64_t v42 = v81;
    uint64_t v43 = *((void *)&v80 + 1);
    uint64_t v40 = v82;
    uint64_t v41 = *((void *)&v81 + 1);
    uint64_t v28 = v56;
    uint64_t v27 = v57;
    *(void *)&long long v63 = v57;
    *((void *)&v63 + 1) = v59;
    uint64_t v29 = v15;
    *(void *)&long long v64 = v15;
    uint64_t v30 = v58;
    uint64_t v31 = v61;
    *((void *)&v64 + 1) = v58;
    *(void *)&long long v65 = v61;
    *((void *)&v65 + 1) = v55;
    *(void *)&long long v66 = v22;
    uint64_t v32 = v53;
    *((void *)&v66 + 1) = v54;
    *(void *)&long long v67 = v56;
    *((void *)&v67 + 1) = v52;
    *(void *)&long long v68 = v53;
    *((void *)&v68 + 1) = v76;
    long long v69 = v77;
    long long v70 = v78;
    long long v71 = v79;
    long long v72 = v80;
    long long v73 = v81;
    uint64_t v74 = v82;
    sub_100030E50((uint64_t)&v63);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_100008540((uint64_t)v62);
    v75[0] = v27;
    v75[1] = v59;
    v75[2] = v29;
    v75[3] = v30;
    v75[4] = v31;
    v75[5] = v55;
    v75[6] = v22;
    v75[7] = v54;
    v75[8] = v28;
    v75[9] = v52;
    v75[10] = v32;
    v75[11] = v51;
    v75[12] = v50;
    v75[13] = v49;
    v75[14] = v48;
    v75[15] = v47;
    v75[16] = v46;
    v75[17] = v45;
    v75[18] = v44;
    v75[19] = v43;
    v75[20] = v42;
    v75[21] = v41;
    v75[22] = v40;
    uint64_t result = sub_100030EBC((uint64_t)v75);
    long long v34 = v72;
    uint64_t v35 = v60;
    *(_OWORD *)(v60 + 128) = v71;
    *(_OWORD *)(v35 + 144) = v34;
    *(_OWORD *)(v35 + 160) = v73;
    *(void *)(v35 + 176) = v74;
    long long v36 = v68;
    *(_OWORD *)(v35 + 64) = v67;
    *(_OWORD *)(v35 + 80) = v36;
    long long v37 = v70;
    *(_OWORD *)(v35 + 96) = v69;
    *(_OWORD *)(v35 + 112) = v37;
    long long v38 = v64;
    *(_OWORD *)uint64_t v35 = v63;
    *(_OWORD *)(v35 + 16) = v38;
    long long v39 = v66;
    *(_OWORD *)(v35 + 32) = v65;
    *(_OWORD *)(v35 + 48) = v39;
  }
  return result;
}

uint64_t sub_10002F654(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = type metadata accessor for JSONEncoder.OutputFormatting();
  __chkstk_darwin(v7 - 8);
  type metadata accessor for MessageEncoder();
  uint64_t v8 = swift_allocObject();
  type metadata accessor for JSONEncoder();
  swift_allocObject();
  *(void *)(v8 + 16) = JSONEncoder.init()();
  swift_retain();
  static JSONEncoder.OutputFormatting.sortedKeys.getter();
  dispatch thunk of JSONEncoder.outputFormatting.setter();
  swift_release();
  *(void *)(v3 + 144) = v8;
  long long v9 = *(_OWORD *)(a1 + 80);
  *(_OWORD *)(v3 + 80) = *(_OWORD *)(a1 + 64);
  *(_OWORD *)(v3 + 96) = v9;
  long long v10 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(v3 + 16) = *(_OWORD *)a1;
  *(_OWORD *)(v3 + 32) = v10;
  long long v11 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)(v3 + 48) = *(_OWORD *)(a1 + 32);
  *(_OWORD *)(v3 + 64) = v11;
  uint64_t v13 = *(void *)(a1 + 88);
  Swift::Int v12 = *(void *)(a1 + 96);
  *(void *)(v3 + 112) = v12;
  *(void *)(v3 + 120) = a3;
  *(void *)(v3 + 128) = a2;
  type metadata accessor for SplunkLogger();
  uint64_t v14 = swift_allocObject();
  swift_allocObject();
  swift_retain();
  swift_retain();
  uint64_t v15 = JSONEncoder.init()();
  *(void *)(v14 + 24) = v12;
  *(void *)(v14 + 32) = v15;
  *(_OWORD *)(v14 + 40) = xmmword_1000586F0;
  *(void *)(v14 + 16) = v13;
  swift_beginAccess();
  Data._Representation.reserveCapacity(_:)(v12);
  swift_endAccess();
  *(void *)(v3 + 136) = v14;
  return v3;
}

unint64_t sub_10002F7EC()
{
  unint64_t result = qword_10007C808;
  if (!qword_10007C808)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007C808);
  }
  return result;
}

unint64_t sub_10002F840()
{
  unint64_t result = qword_10007C810;
  if (!qword_10007C810)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007C810);
  }
  return result;
}

unint64_t sub_10002F894()
{
  unint64_t result = qword_10007C820;
  if (!qword_10007C820)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007C820);
  }
  return result;
}

unint64_t sub_10002F8E8(unint64_t result, uint64_t a2, char a3)
{
  unint64_t v3 = result;
  if (a3) {
    return v3;
  }
  if (a2 + 0x4000000000000000 < 0)
  {
    __break(1u);
    goto LABEL_8;
  }
  if (2 * a2 < 0)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  unint64_t result = sub_100037514((2 * a2) | 1);
  uint64_t v5 = result - a2;
  if (__OFSUB__(result, a2))
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  BOOL v6 = __OFADD__(v3, v5);
  v3 += v5;
  if (!v6) {
    return v3;
  }
LABEL_10:
  __break(1u);
  return result;
}

unint64_t sub_10002F958()
{
  unint64_t result = qword_10007C058;
  if (!qword_10007C058)
  {
    sub_10000B1E0(&qword_10007C038);
    sub_100005CF4(&qword_10007C060, (void (*)(uint64_t))&type metadata accessor for Date);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007C058);
  }
  return result;
}

unint64_t sub_10002FA04()
{
  unint64_t result = qword_10007C078;
  if (!qword_10007C078)
  {
    sub_10000B1E0(&qword_10007C070);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007C078);
  }
  return result;
}

uint64_t sub_10002FAA8(uint64_t a1)
{
  return a1;
}

uint64_t sub_10002FB34@<X0>(uint64_t *a1@<X8>)
{
  return sub_10001CD5C(*(void *)(v1 + 16), a1);
}

uint64_t sub_10002FB5C@<X0>(uint64_t *a1@<X8>)
{
  return sub_10001CA1C(*(void *)(v1 + 16), a1);
}

uint64_t destroy for ProcessAnalyticsReport()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for ProcessAnalyticsReport(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  uint64_t v3 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v3;
  uint64_t v4 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v4;
  uint64_t v5 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v5;
  uint64_t v6 = *(void *)(a2 + 72);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = v6;
  uint64_t v7 = *(void *)(a2 + 88);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = v7;
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(_WORD *)(a1 + 104) = *(_WORD *)(a2 + 104);
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for ProcessAnalyticsReport(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 104) = *(unsigned char *)(a2 + 104);
  *(unsigned char *)(a1 + 105) = *(unsigned char *)(a2 + 105);
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  return a1;
}

__n128 initializeWithTake for ProcessAnalyticsReport(uint64_t a1, long long *a2)
{
  long long v2 = *a2;
  long long v3 = a2[1];
  long long v4 = a2[3];
  *(_OWORD *)(a1 + 32) = a2[2];
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)a1 = v2;
  *(_OWORD *)(a1 + 16) = v3;
  __n128 result = (__n128)a2[4];
  long long v6 = a2[5];
  long long v7 = a2[6];
  *(void *)(a1 + 112) = *((void *)a2 + 14);
  *(_OWORD *)(a1 + 80) = v6;
  *(_OWORD *)(a1 + 96) = v7;
  *(__n128 *)(a1 + 64) = result;
  return result;
}

uint64_t assignWithTake for ProcessAnalyticsReport(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v5;
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(a2 + 64);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void *)(a2 + 80);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = v7;
  swift_bridgeObjectRelease();
  uint64_t v8 = *(void *)(a2 + 96);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  *(void *)(a1 + 96) = v8;
  swift_bridgeObjectRelease();
  *(_WORD *)(a1 + 104) = *(_WORD *)(a2 + 104);
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  return a1;
}

uint64_t getEnumTagSinglePayload for ProcessAnalyticsReport(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 120)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ProcessAnalyticsReport(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 120) = 1;
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
      *(void *)(result + 16) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 120) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ProcessAnalyticsReport()
{
  return &type metadata for ProcessAnalyticsReport;
}

uint64_t destroy for FileAnalyticsReport()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for FileAnalyticsReport(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  uint64_t v3 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v3;
  uint64_t v4 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v4;
  uint64_t v5 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v5;
  uint64_t v6 = *(void *)(a2 + 72);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = v6;
  uint64_t v7 = *(void *)(a2 + 88);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = v7;
  uint64_t v8 = *(void *)(a2 + 104);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(void *)(a1 + 104) = v8;
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  *(_WORD *)(a1 + 120) = *(_WORD *)(a2 + 120);
  *(void *)(a1 + 124) = *(void *)(a2 + 124);
  *(void *)(a1 + 136) = *(void *)(a2 + 136);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for FileAnalyticsReport(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 120) = *(unsigned char *)(a2 + 120);
  *(unsigned char *)(a1 + 121) = *(unsigned char *)(a2 + 121);
  *(_DWORD *)(a1 + 124) = *(_DWORD *)(a2 + 124);
  *(_DWORD *)(a1 + 128) = *(_DWORD *)(a2 + 128);
  *(void *)(a1 + 136) = *(void *)(a2 + 136);
  return a1;
}

__n128 initializeWithTake for FileAnalyticsReport(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  long long v2 = *(_OWORD *)(a2 + 16);
  long long v3 = *(_OWORD *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v4;
  *(_OWORD *)(a1 + 16) = v2;
  *(_OWORD *)(a1 + 32) = v3;
  __n128 result = *(__n128 *)(a2 + 80);
  long long v6 = *(_OWORD *)(a2 + 96);
  long long v7 = *(_OWORD *)(a2 + 128);
  *(_OWORD *)(a1 + 112) = *(_OWORD *)(a2 + 112);
  *(_OWORD *)(a1 + 128) = v7;
  *(__n128 *)(a1 + 80) = result;
  *(_OWORD *)(a1 + 96) = v6;
  return result;
}

uint64_t assignWithTake for FileAnalyticsReport(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v5;
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(a2 + 64);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void *)(a2 + 80);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = v7;
  swift_bridgeObjectRelease();
  uint64_t v8 = *(void *)(a2 + 96);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  *(void *)(a1 + 96) = v8;
  swift_bridgeObjectRelease();
  uint64_t v9 = *(void *)(a2 + 112);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  *(void *)(a1 + 112) = v9;
  swift_bridgeObjectRelease();
  *(_WORD *)(a1 + 120) = *(_WORD *)(a2 + 120);
  *(void *)(a1 + 124) = *(void *)(a2 + 124);
  *(void *)(a1 + 136) = *(void *)(a2 + 136);
  return a1;
}

uint64_t getEnumTagSinglePayload for FileAnalyticsReport(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 144)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for FileAnalyticsReport(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 136) = 0;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 144) = 1;
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
      *(void *)(result + 16) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 144) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for FileAnalyticsReport()
{
  return &type metadata for FileAnalyticsReport;
}

uint64_t initializeWithCopy for EventCounterReport(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  uint64_t v3 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v3;
  uint64_t v4 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v4;
  uint64_t v5 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v5;
  uint64_t v6 = *(void *)(a2 + 72);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = v6;
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(_OWORD *)(a1 + 168) = *(_OWORD *)(a2 + 168);
  *(_OWORD *)(a1 + 152) = *(_OWORD *)(a2 + 152);
  *(_OWORD *)(a1 + 136) = *(_OWORD *)(a2 + 136);
  *(_OWORD *)(a1 + 120) = *(_OWORD *)(a2 + 120);
  *(_OWORD *)(a1 + 104) = *(_OWORD *)(a2 + 104);
  *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for EventCounterReport(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[3] = a2[3];
  a1[4] = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[5] = a2[5];
  a1[6] = a2[6];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[7] = a2[7];
  a1[8] = a2[8];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[9] = a2[9];
  a1[10] = a2[10];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[11] = a2[11];
  a1[12] = a2[12];
  a1[13] = a2[13];
  a1[14] = a2[14];
  a1[15] = a2[15];
  a1[16] = a2[16];
  a1[17] = a2[17];
  a1[18] = a2[18];
  a1[19] = a2[19];
  a1[20] = a2[20];
  a1[21] = a2[21];
  a1[22] = a2[22];
  return a1;
}

__n128 initializeWithTake for EventCounterReport(uint64_t a1, long long *a2)
{
  long long v2 = *a2;
  long long v3 = a2[1];
  long long v4 = a2[3];
  *(_OWORD *)(a1 + 32) = a2[2];
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)a1 = v2;
  *(_OWORD *)(a1 + 16) = v3;
  long long v5 = a2[4];
  long long v6 = a2[5];
  long long v7 = a2[7];
  *(_OWORD *)(a1 + 96) = a2[6];
  *(_OWORD *)(a1 + 112) = v7;
  *(_OWORD *)(a1 + 64) = v5;
  *(_OWORD *)(a1 + 80) = v6;
  __n128 result = (__n128)a2[8];
  long long v9 = a2[9];
  long long v10 = a2[10];
  *(void *)(a1 + 176) = *((void *)a2 + 22);
  *(_OWORD *)(a1 + 144) = v9;
  *(_OWORD *)(a1 + 160) = v10;
  *(__n128 *)(a1 + 128) = result;
  return result;
}

uint64_t assignWithTake for EventCounterReport(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v5;
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(a2 + 64);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void *)(a2 + 80);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = v7;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
  *(_OWORD *)(a1 + 104) = *(_OWORD *)(a2 + 104);
  *(_OWORD *)(a1 + 120) = *(_OWORD *)(a2 + 120);
  *(_OWORD *)(a1 + 136) = *(_OWORD *)(a2 + 136);
  *(_OWORD *)(a1 + 152) = *(_OWORD *)(a2 + 152);
  *(_OWORD *)(a1 + 168) = *(_OWORD *)(a2 + 168);
  return a1;
}

uint64_t getEnumTagSinglePayload for EventCounterReport(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 184)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for EventCounterReport(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 168) = 0u;
    *(_OWORD *)(result + 152) = 0u;
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 184) = 1;
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
      *(void *)(result + 16) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 184) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for EventCounterReport()
{
  return &type metadata for EventCounterReport;
}

uint64_t _s14applekeystored18EventCounterReportVwxx_0()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for KernelCounterReport(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  uint64_t v3 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v3;
  uint64_t v4 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v4;
  uint64_t v5 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v5;
  uint64_t v6 = *(void *)(a2 + 72);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = v6;
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 120) = *(void *)(a2 + 120);
  *(_OWORD *)(a1 + 104) = *(_OWORD *)(a2 + 104);
  *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for KernelCounterReport(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[3] = a2[3];
  a1[4] = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[5] = a2[5];
  a1[6] = a2[6];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[7] = a2[7];
  a1[8] = a2[8];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[9] = a2[9];
  a1[10] = a2[10];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[11] = a2[11];
  a1[12] = a2[12];
  a1[13] = a2[13];
  a1[14] = a2[14];
  a1[15] = a2[15];
  return a1;
}

__n128 initializeWithTake for KernelCounterReport(uint64_t a1, long long *a2)
{
  long long v2 = *a2;
  long long v3 = a2[1];
  long long v4 = a2[3];
  *(_OWORD *)(a1 + 32) = a2[2];
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)a1 = v2;
  *(_OWORD *)(a1 + 16) = v3;
  __n128 result = (__n128)a2[4];
  long long v6 = a2[5];
  long long v7 = a2[7];
  *(_OWORD *)(a1 + 96) = a2[6];
  *(_OWORD *)(a1 + 112) = v7;
  *(__n128 *)(a1 + 64) = result;
  *(_OWORD *)(a1 + 80) = v6;
  return result;
}

uint64_t assignWithTake for KernelCounterReport(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v5;
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(a2 + 64);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void *)(a2 + 80);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = v7;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
  *(_OWORD *)(a1 + 104) = *(_OWORD *)(a2 + 104);
  *(void *)(a1 + 120) = *(void *)(a2 + 120);
  return a1;
}

uint64_t getEnumTagSinglePayload for KernelCounterReport(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 128)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for KernelCounterReport(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 120) = 0;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 128) = 1;
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
      *(void *)(result + 16) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 128) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for KernelCounterReport()
{
  return &type metadata for KernelCounterReport;
}

uint64_t getEnumTagSinglePayload for AnalyticsReporterConfig.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xF9) {
    goto LABEL_17;
  }
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
    if (v4) {
      return (*a1 | (v4 << 8)) - 7;
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
      return (*a1 | (v4 << 8)) - 7;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 7;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 8;
  int v8 = v6 - 8;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for AnalyticsReporterConfig.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *__n128 result = a2 + 7;
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
        JUMPOUT(0x100030B6CLL);
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
          *__n128 result = a2 + 7;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AnalyticsReporterConfig.CodingKeys()
{
  return &type metadata for AnalyticsReporterConfig.CodingKeys;
}

unint64_t sub_100030BA8()
{
  unint64_t result = qword_10007C840;
  if (!qword_10007C840)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007C840);
  }
  return result;
}

unint64_t sub_100030C00()
{
  unint64_t result = qword_10007C848;
  if (!qword_10007C848)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007C848);
  }
  return result;
}

unint64_t sub_100030C58()
{
  unint64_t result = qword_10007C850;
  if (!qword_10007C850)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007C850);
  }
  return result;
}

unint64_t sub_100030CAC()
{
  unint64_t result = qword_10007C860;
  if (!qword_10007C860)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007C860);
  }
  return result;
}

unint64_t sub_100030D00()
{
  unint64_t result = qword_10007C868;
  if (!qword_10007C868)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007C868);
  }
  return result;
}

unint64_t sub_100030D54()
{
  unint64_t result = qword_10007C878;
  if (!qword_10007C878)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007C878);
  }
  return result;
}

unint64_t sub_100030DA8()
{
  unint64_t result = qword_10007C888;
  if (!qword_10007C888)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007C888);
  }
  return result;
}

unint64_t sub_100030DFC()
{
  unint64_t result = qword_10007C890;
  if (!qword_10007C890)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007C890);
  }
  return result;
}

uint64_t sub_100030E50(uint64_t a1)
{
  return a1;
}

uint64_t sub_100030EBC(uint64_t a1)
{
  return a1;
}

unint64_t sub_100030F28()
{
  unint64_t result = qword_10007C8A0;
  if (!qword_10007C8A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007C8A0);
  }
  return result;
}

unint64_t sub_100030F7C()
{
  unint64_t result = qword_10007C8B0;
  if (!qword_10007C8B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007C8B0);
  }
  return result;
}

uint64_t sub_100030FD0(uint64_t a1)
{
  return a1;
}

unint64_t sub_10003105C()
{
  unint64_t result = qword_10007C8C8;
  if (!qword_10007C8C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007C8C8);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for ProcessAnalyticsReport.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 9 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 9) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF7) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF6)
  {
    unsigned int v6 = ((a2 - 247) >> 8) + 1;
    *unint64_t result = a2 + 9;
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
        JUMPOUT(0x10003117CLL);
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
          *unint64_t result = a2 + 9;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ProcessAnalyticsReport.CodingKeys()
{
  return &type metadata for ProcessAnalyticsReport.CodingKeys;
}

uint64_t getEnumTagSinglePayload for FileAnalyticsReport.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xF4) {
    goto LABEL_17;
  }
  if (a2 + 12 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 12) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 12;
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
      return (*a1 | (v4 << 8)) - 12;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 12;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0xD;
  int v8 = v6 - 13;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for FileAnalyticsReport.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 12 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 12) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF4) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF3)
  {
    unsigned int v6 = ((a2 - 244) >> 8) + 1;
    *unint64_t result = a2 + 12;
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
        JUMPOUT(0x100031310);
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
          *unint64_t result = a2 + 12;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for FileAnalyticsReport.CodingKeys()
{
  return &type metadata for FileAnalyticsReport.CodingKeys;
}

ValueMetadata *type metadata accessor for EventCounterReport.CodingKeys()
{
  return &type metadata for EventCounterReport.CodingKeys;
}

uint64_t _s14applekeystored18EventCounterReportV10CodingKeysOwet_0(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFA) {
    goto LABEL_17;
  }
  if (a2 + 6 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 6) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 6;
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
      return (*a1 | (v4 << 8)) - 6;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 6;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 7;
  int v8 = v6 - 7;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *_s14applekeystored18EventCounterReportV10CodingKeysOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *unint64_t result = a2 + 6;
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
        JUMPOUT(0x1000314BCLL);
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
          *unint64_t result = a2 + 6;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for KernelCounterReport.CodingKeys()
{
  return &type metadata for KernelCounterReport.CodingKeys;
}

unint64_t sub_1000314F8()
{
  unint64_t result = qword_10007C8D8;
  if (!qword_10007C8D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007C8D8);
  }
  return result;
}

unint64_t sub_100031550()
{
  unint64_t result = qword_10007C8E0;
  if (!qword_10007C8E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007C8E0);
  }
  return result;
}

unint64_t sub_1000315A8()
{
  unint64_t result = qword_10007C8E8;
  if (!qword_10007C8E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007C8E8);
  }
  return result;
}

unint64_t sub_100031600()
{
  unint64_t result = qword_10007C8F0;
  if (!qword_10007C8F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007C8F0);
  }
  return result;
}

unint64_t sub_100031658()
{
  unint64_t result = qword_10007C8F8;
  if (!qword_10007C8F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007C8F8);
  }
  return result;
}

unint64_t sub_1000316B0()
{
  unint64_t result = qword_10007C900;
  if (!qword_10007C900)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007C900);
  }
  return result;
}

unint64_t sub_100031708()
{
  unint64_t result = qword_10007C908;
  if (!qword_10007C908)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007C908);
  }
  return result;
}

unint64_t sub_100031760()
{
  unint64_t result = qword_10007C910;
  if (!qword_10007C910)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007C910);
  }
  return result;
}

unint64_t sub_1000317B8()
{
  unint64_t result = qword_10007C918;
  if (!qword_10007C918)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007C918);
  }
  return result;
}

unint64_t sub_100031810()
{
  unint64_t result = qword_10007C920;
  if (!qword_10007C920)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007C920);
  }
  return result;
}

unint64_t sub_100031868()
{
  unint64_t result = qword_10007C928;
  if (!qword_10007C928)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007C928);
  }
  return result;
}

unint64_t sub_1000318C0()
{
  unint64_t result = qword_10007C930;
  if (!qword_10007C930)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007C930);
  }
  return result;
}

Swift::Int sub_100031920()
{
  return Hasher._finalize()();
}

Swift::Int sub_100031A34()
{
  return Hasher._finalize()();
}

uint64_t sub_100031B20(unsigned __int8 *a1, char *a2)
{
  return sub_10003390C(*a1, *a2);
}

Swift::Int sub_100031B2C()
{
  return sub_100031920();
}

uint64_t sub_100031B34()
{
  String.hash(into:)();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_100031C30()
{
  return sub_100033DAC();
}

unint64_t sub_100031C38@<X0>(Swift::String *a1@<X0>, unsigned char *a2@<X8>)
{
  unint64_t result = sub_100033734(*a1);
  *a2 = result;
  return result;
}

void sub_100031C68(uint64_t *a1@<X8>)
{
  unint64_t v2 = 0xE700000000000000;
  uint64_t v3 = 0x61746144707061;
  switch(*v1)
  {
    case 1:
      uint64_t v3 = 0x61446E6967756C70;
      unint64_t v2 = 0xEA00000000006174;
      goto LABEL_3;
    case 2:
      *a1 = 0x6E6F6D656164;
      a1[1] = 0xE600000000000000;
      break;
    case 3:
      *a1 = 0x61446D6574737973;
      a1[1] = 0xEA00000000006174;
      break;
    case 4:
      *a1 = 0x70756F7247707061;
      a1[1] = 0xE800000000000000;
      break;
    case 5:
      *a1 = 0x72476D6574737973;
      a1[1] = 0xEB0000000070756FLL;
      break;
    default:
LABEL_3:
      *a1 = v3;
      a1[1] = v2;
      break;
  }
}

uint64_t sub_100031D50()
{
  return RawRepresentable<>.init(from:)();
}

uint64_t sub_100031DB0()
{
  return RawRepresentable<>.encode(to:)();
}

uint64_t sub_100031E00()
{
  swift_bridgeObjectRelease();

  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for ContainerClassIndex()
{
  return self;
}

void sub_100031E5C(unsigned __int8 a1)
{
  type metadata accessor for ContainerClassIndex();
  uint64_t v3 = swift_allocObject();
  *(void *)(v3 + 24) = sub_100033EBC((uint64_t)&_swiftEmptyArrayStorage);
  *(unsigned char *)(v3 + 16) = a1;
  swift_beginAccess();
  swift_retain();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v35[0] = *(void *)(v1 + 24);
  *(void *)(v1 + 24) = 0x8000000000000000;
  sub_1000512D8(v3, a1, isUniquelyReferenced_nonNull_native);
  *(void *)(v1 + 24) = v35[0];
  swift_bridgeObjectRelease();
  swift_endAccess();
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = 0;
  if (container_query_create())
  {
    long long v34 = (uint64_t *)(v1 + 24);
    container_query_set_class();
    container_query_set_include_other_owners();
    container_query_operation_set_flags();
    uint64_t v6 = swift_allocObject();
    *(void *)(v6 + 16) = v1;
    *(void *)(v6 + 24) = v3;
    *(unsigned char *)(v6 + 32) = a1;
    *(void *)(v6 + 40) = v5;
    aBlock[4] = (uint64_t)sub_10003382C;
    aBlock[5] = v6;
    aBlock[0] = (uint64_t)_NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_1000331F4;
    aBlock[3] = (uint64_t)&unk_1000743A0;
    BOOL v7 = _Block_copy(aBlock);
    swift_retain();
    swift_retain();
    swift_retain();
    swift_release();
    container_query_iterate_results_sync();
    _Block_release(v7);
    swift_beginAccess();
    if (*(uint64_t *)(v5 + 16) >= 2)
    {
      if (qword_10007A5C0 != -1) {
        swift_once();
      }
      uint64_t v8 = type metadata accessor for Logger();
      sub_10000AF48(v8, (uint64_t)qword_10007DAE0);
      long long v9 = Logger.logObject.getter();
      os_log_type_t v10 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v9, v10))
      {
        long long v11 = (uint8_t *)swift_slowAlloc();
        v35[0] = swift_slowAlloc();
        *(_DWORD *)long long v11 = 136315138;
        unint64_t v12 = 0xE700000000000000;
        uint64_t v13 = 0x61746144707061;
        switch(a1)
        {
          case 1u:
            uint64_t v14 = 0x6E6967756C70;
            goto LABEL_23;
          case 2u:
            unint64_t v12 = 0xE600000000000000;
            uint64_t v13 = 0x6E6F6D656164;
            break;
          case 3u:
            uint64_t v14 = 0x6D6574737973;
LABEL_23:
            uint64_t v13 = v14 & 0xFFFFFFFFFFFFLL | 0x6144000000000000;
            unint64_t v12 = 0xEA00000000006174;
            break;
          case 4u:
            unint64_t v12 = 0xE800000000000000;
            uint64_t v13 = 0x70756F7247707061;
            break;
          case 5u:
            uint64_t v13 = 0x72476D6574737973;
            unint64_t v12 = 0xEB0000000070756FLL;
            break;
          default:
            break;
        }
        uint64_t v37 = sub_10001EE9C(v13, v12, v35);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease();
        _os_log_impl((void *)&_mh_execute_header, v9, v10, "container class %s has multiple base directories", v11, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {
      }
    }
    if (qword_10007A5C0 != -1) {
      swift_once();
    }
    uint64_t v22 = type metadata accessor for Logger();
    sub_10000AF48(v22, (uint64_t)qword_10007DAE0);
    swift_retain();
    uint64_t v23 = Logger.logObject.getter();
    os_log_type_t v24 = static os_log_type_t.info.getter();
    if (!os_log_type_enabled(v23, v24))
    {

      swift_release();
LABEL_44:
      container_query_free();
      swift_release();
      goto LABEL_45;
    }
    uint64_t v25 = swift_slowAlloc();
    uint64_t v37 = swift_slowAlloc();
    *(_DWORD *)uint64_t v25 = 134218242;
    uint64_t v26 = *v34;
    if (*(void *)(*v34 + 16))
    {
      swift_bridgeObjectRetain();
      unint64_t v27 = sub_100036E98(a1);
      if (v28)
      {
        uint64_t v29 = *(void *)(*(void *)(v26 + 56) + 8 * v27);
        swift_retain();
        swift_bridgeObjectRelease();
        swift_beginAccess();
        uint64_t v30 = *(void *)(*(void *)(v29 + 24) + 16);
        swift_release();
LABEL_36:
        uint64_t v31 = 0x61746144707061;
        uint64_t v36 = v30;
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_release();
        *(_WORD *)(v25 + 12) = 2080;
        unint64_t v32 = 0xE700000000000000;
        switch(a1)
        {
          case 1u:
            uint64_t v33 = 0x6E6967756C70;
            goto LABEL_40;
          case 2u:
            unint64_t v32 = 0xE600000000000000;
            uint64_t v31 = 0x6E6F6D656164;
            break;
          case 3u:
            uint64_t v33 = 0x6D6574737973;
LABEL_40:
            uint64_t v31 = v33 & 0xFFFFFFFFFFFFLL | 0x6144000000000000;
            unint64_t v32 = 0xEA00000000006174;
            break;
          case 4u:
            unint64_t v32 = 0xE800000000000000;
            uint64_t v31 = 0x70756F7247707061;
            break;
          case 5u:
            uint64_t v31 = 0x72476D6574737973;
            unint64_t v32 = 0xEB0000000070756FLL;
            break;
          default:
            break;
        }
        uint64_t v36 = sub_10001EE9C(v31, v32, &v37);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease();
        _os_log_impl((void *)&_mh_execute_header, v23, v24, "found %ld %s containers", (uint8_t *)v25, 0x16u);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();

        goto LABEL_44;
      }
      swift_bridgeObjectRelease();
    }
    uint64_t v30 = 0;
    goto LABEL_36;
  }
  if (qword_10007A5C0 != -1) {
    swift_once();
  }
  uint64_t v15 = type metadata accessor for Logger();
  sub_10000AF48(v15, (uint64_t)qword_10007DAE0);
  uint64_t v16 = Logger.logObject.getter();
  os_log_type_t v17 = static os_log_type_t.error.getter();
  if (!os_log_type_enabled(v16, v17))
  {
    swift_release();

LABEL_45:
    swift_release();
    return;
  }
  uint64_t v18 = 0x61746144707061;
  uint64_t v19 = (uint8_t *)swift_slowAlloc();
  aBlock[0] = swift_slowAlloc();
  *(_DWORD *)uint64_t v19 = 136315138;
  unint64_t v20 = 0xE700000000000000;
  switch(a1)
  {
    case 1u:
      uint64_t v21 = 0x6E6967756C70;
      goto LABEL_17;
    case 2u:
      unint64_t v20 = 0xE600000000000000;
      uint64_t v18 = 0x6E6F6D656164;
      break;
    case 3u:
      uint64_t v21 = 0x6D6574737973;
LABEL_17:
      uint64_t v18 = v21 & 0xFFFFFFFFFFFFLL | 0x6144000000000000;
      unint64_t v20 = 0xEA00000000006174;
      break;
    case 4u:
      unint64_t v20 = 0xE800000000000000;
      uint64_t v18 = 0x70756F7247707061;
      break;
    case 5u:
      uint64_t v18 = 0x72476D6574737973;
      unint64_t v20 = 0xEB0000000070756FLL;
      break;
    default:
      break;
  }
  v35[0] = sub_10001EE9C(v18, v20, aBlock);
  UnsafeMutableRawBufferPointer.copyMemory(from:)();
  swift_bridgeObjectRelease();
  _os_log_impl((void *)&_mh_execute_header, v16, v17, "failed to create container query for %s", v19, 0xCu);
  swift_arrayDestroy();
  swift_slowDealloc();
  swift_slowDealloc();
  swift_release();
  swift_release();
}

uint64_t sub_10003275C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v84 = a4;
  uint64_t v85 = a5;
  uint64_t v86 = a2;
  uint64_t v6 = sub_1000082E0(&qword_10007CB18);
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = (char *)&v74 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for FilePath();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = __chkstk_darwin(v9);
  uint64_t v13 = (char *)&v74 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __chkstk_darwin(v11);
  uint64_t v16 = (char *)&v74 - v15;
  uint64_t v17 = __chkstk_darwin(v14);
  uint64_t v19 = (char *)&v74 - v18;
  uint64_t v20 = __chkstk_darwin(v17);
  uint64_t v22 = (char *)&v74 - v21;
  __chkstk_darwin(v20);
  os_log_type_t v24 = (char *)&v74 - v23;
  if (!container_get_identifier()) {
    return 1;
  }
  uint64_t v83 = a3;
  uint64_t v82 = String.init(cString:)();
  unint64_t v26 = v25;
  if (!container_get_path())
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  long long v80 = v13;
  unint64_t v81 = v26;
  String.init(cString:)();
  FilePath.init(_:)();
  (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v24, v22, v9);
  FilePath.lastComponent.getter();
  uint64_t v27 = type metadata accessor for FilePath.Component();
  uint64_t v28 = v9;
  uint64_t v29 = v10;
  uint64_t v30 = *(void *)(v27 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v30 + 48))(v8, 1, v27) == 1)
  {
    swift_bridgeObjectRelease();
    sub_100033854((uint64_t)v8);
    (*(void (**)(char *, uint64_t))(v29 + 8))(v24, v28);
    return 1;
  }
  uint64_t v75 = FilePath.Component.string.getter();
  uint64_t v76 = v31;
  (*(void (**)(char *, uint64_t))(v30 + 8))(v8, v27);
  unint64_t v32 = v29 + 16;
  uint64_t v33 = *(uint64_t **)(v29 + 16);
  long long v78 = v24;
  ((void (*)(char *, char *, uint64_t))v33)(v16, v24, v28);
  FilePath.removingLastComponent()();
  uint64_t v34 = FilePath.string.getter();
  uint64_t v36 = v35;
  uint64_t v37 = *(void (**)(char *, uint64_t))(v29 + 8);
  uint64_t v74 = v29 + 8;
  uint64_t v79 = v28;
  long long v77 = v37;
  v37(v19, v28);
  uint64_t v38 = v86;
  long long v39 = (uint64_t *)(v86 + 16);
  swift_beginAccess();
  uint64_t v40 = *(void *)(v38 + 16);
  uint64_t v42 = v80;
  unint64_t v41 = v81;
  if (*(void *)(v40 + 16))
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t v43 = sub_10000836C(v34, v36);
    if (v44)
    {
      unint64_t v45 = *(void *)(*(void *)(v40 + 56) + 8 * v43);
      swift_retain();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      uint64_t v46 = v83;
      if (v45 != v83)
      {
        long long v39 = v33;
        uint64_t v34 = v79;
        if (qword_10007A5C0 == -1)
        {
LABEL_10:
          uint64_t v47 = type metadata accessor for Logger();
          sub_10000AF48(v47, (uint64_t)qword_10007DAE0);
          swift_retain_n();
          uint64_t v48 = Logger.logObject.getter();
          os_log_type_t v49 = static os_log_type_t.error.getter();
          if (os_log_type_enabled(v48, v49))
          {
            uint64_t v50 = swift_slowAlloc();
            v89[0] = swift_slowAlloc();
            *(_DWORD *)uint64_t v50 = 136315394;
            unint64_t v51 = 0xE700000000000000;
            uint64_t v52 = 0x61746144707061;
            switch(*(unsigned char *)(v45 + 16))
            {
              case 1:
                uint64_t v53 = 0x6E6967756C70;
                goto LABEL_20;
              case 2:
                unint64_t v51 = 0xE600000000000000;
                uint64_t v52 = 0x6E6F6D656164;
                break;
              case 3:
                uint64_t v53 = 0x6D6574737973;
LABEL_20:
                uint64_t v52 = v53 & 0xFFFFFFFFFFFFLL | 0x6144000000000000;
                unint64_t v51 = 0xEA00000000006174;
                break;
              case 4:
                unint64_t v51 = 0xE800000000000000;
                uint64_t v52 = 0x70756F7247707061;
                break;
              case 5:
                uint64_t v52 = 0x72476D6574737973;
                unint64_t v51 = 0xEB0000000070756FLL;
                break;
              default:
                break;
            }
            v88[0] = sub_10001EE9C(v52, v51, v89);
            UnsafeMutableRawBufferPointer.copyMemory(from:)();
            swift_release_n();
            swift_bridgeObjectRelease();
            *(_WORD *)(v50 + 12) = 2080;
            unint64_t v59 = 0xE700000000000000;
            uint64_t v60 = 0x61746144707061;
            switch((char)v84)
            {
              case 1:
                uint64_t v61 = 0x6E6967756C70;
                goto LABEL_27;
              case 2:
                unint64_t v59 = 0xE600000000000000;
                uint64_t v60 = 0x6E6F6D656164;
                break;
              case 3:
                uint64_t v61 = 0x6D6574737973;
LABEL_27:
                uint64_t v60 = v61 & 0xFFFFFFFFFFFFLL | 0x6144000000000000;
                unint64_t v59 = 0xEA00000000006174;
                break;
              case 4:
                unint64_t v59 = 0xE800000000000000;
                uint64_t v60 = 0x70756F7247707061;
                break;
              case 5:
                uint64_t v60 = 0x72476D6574737973;
                unint64_t v59 = 0xEB0000000070756FLL;
                break;
              default:
                break;
            }
            v88[0] = sub_10001EE9C(v60, v59, v89);
            UnsafeMutableRawBufferPointer.copyMemory(from:)();
            swift_bridgeObjectRelease();
            _os_log_impl((void *)&_mh_execute_header, v48, v49, "container classes %s and %s share the same directory", (uint8_t *)v50, 0x16u);
            swift_arrayDestroy();
            swift_slowDealloc();
            swift_slowDealloc();
            swift_release();

            uint64_t v34 = v79;
            uint64_t v58 = v80;
          }
          else
          {

            swift_release_n();
            uint64_t v58 = v80;
          }
          uint64_t v46 = v83;
          uint64_t v33 = v39;
          goto LABEL_32;
        }
LABEL_39:
        swift_once();
        goto LABEL_10;
      }
      swift_release();
      uint64_t v34 = v79;
      uint64_t v58 = v80;
      goto LABEL_32;
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  unint64_t v45 = v41;
  unint64_t v41 = v32;
  uint64_t v54 = v33;
  uint64_t v55 = (void *)(v85 + 16);
  swift_beginAccess();
  uint64_t v56 = v83;
  swift_retain();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v88[0] = *v39;
  uint64_t *v39 = 0x8000000000000000;
  sub_100051410(v56, v34, v36, isUniquelyReferenced_nonNull_native);
  uint64_t *v39 = v88[0];
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_endAccess();
  swift_beginAccess();
  if (__OFADD__(*v55, 1))
  {
    __break(1u);
    goto LABEL_39;
  }
  ++*v55;
  uint64_t v34 = v79;
  uint64_t v46 = v83;
  uint64_t v33 = v54;
  unint64_t v41 = v45;
  uint64_t v58 = v42;
LABEL_32:
  swift_beginAccess();
  uint64_t v62 = v76;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  char v63 = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v87 = *(void *)(v46 + 24);
  *(void *)(v46 + 24) = 0x8000000000000000;
  sub_100051150(v82, v41, v75, v62, v63);
  *(void *)(v46 + 24) = v87;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_endAccess();
  swift_bridgeObjectRelease();
  if (qword_10007A5C0 != -1) {
    swift_once();
  }
  uint64_t v64 = type metadata accessor for Logger();
  sub_10000AF48(v64, (uint64_t)qword_10007DAE0);
  long long v65 = v78;
  ((void (*)(char *, char *, uint64_t))v33)(v58, v78, v34);
  swift_bridgeObjectRetain();
  long long v66 = Logger.logObject.getter();
  os_log_type_t v67 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v66, v67))
  {
    uint64_t v68 = swift_slowAlloc();
    v88[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v68 = 136315394;
    swift_bridgeObjectRetain();
    uint64_t v87 = sub_10001EE9C(v82, v41, v88);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v68 + 12) = 2080;
    sub_1000338B4();
    uint64_t v69 = dispatch thunk of CustomStringConvertible.description.getter();
    uint64_t v87 = sub_10001EE9C(v69, v70, v88);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    long long v71 = v77;
    v77(v58, v34);
    _os_log_impl((void *)&_mh_execute_header, v66, v67, "found container %s at path %s", (uint8_t *)v68, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    v71(v65, v34);
  }
  else
  {

    long long v72 = v77;
    v77(v58, v34);
    swift_bridgeObjectRelease_n();
    v72(v65, v34);
  }
  return 1;
}

uint64_t sub_1000331F4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(uint64_t (**)(uint64_t))(a1 + 32);
  swift_retain();
  LOBYTE(a2) = v3(a2);
  swift_release();
  return a2 & 1;
}

uint64_t sub_100033244(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  uint64_t v4 = v3;
  swift_beginAccess();
  uint64_t v8 = *(void *)(v3 + 24);
  if (!*(void *)(v8 + 16))
  {
LABEL_10:
    unint64_t v16 = sub_100033FE0((uint64_t)&_swiftEmptyArrayStorage);
    swift_beginAccess();
    *(void *)(v4 + 16) = v16;
    swift_bridgeObjectRelease();
    *(void *)(v4 + 24) = sub_100033FEC((uint64_t)&_swiftEmptyArrayStorage);
    swift_bridgeObjectRelease();
    sub_100031E5C(0);
    sub_100031E5C(1u);
    sub_100031E5C(2u);
    sub_100031E5C(3u);
    sub_100031E5C(4u);
    sub_100031E5C(5u);
    uint64_t v17 = *(void *)(v4 + 24);
    if (*(void *)(v17 + 16))
    {
      swift_bridgeObjectRetain();
      unint64_t v18 = sub_100036E98(a3);
      if ((v19 & 1) == 0)
      {
LABEL_18:
        swift_bridgeObjectRelease();
        return 0;
      }
      uint64_t v20 = *(void *)(*(void *)(v17 + 56) + 8 * v18);
      swift_retain();
      swift_bridgeObjectRelease();
      swift_beginAccess();
      uint64_t v21 = *(void *)(v20 + 24);
      if (*(void *)(v21 + 16))
      {
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        unint64_t v22 = sub_10000836C(a1, a2);
        if (v23)
        {
          uint64_t v15 = *(void *)(*(void *)(v21 + 56) + 16 * v22);
          swift_bridgeObjectRetain();
          swift_release();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          return v15;
        }
        swift_release();
        swift_bridgeObjectRelease();
        goto LABEL_18;
      }
      swift_release();
    }
    return 0;
  }
  swift_bridgeObjectRetain();
  unint64_t v9 = sub_100036E98(a3);
  if ((v10 & 1) == 0)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    goto LABEL_10;
  }
  uint64_t v11 = *(void *)(*(void *)(v8 + 56) + 8 * v9);
  swift_retain();
  swift_bridgeObjectRelease();
  swift_beginAccess();
  uint64_t v12 = *(void *)(v11 + 24);
  if (!*(void *)(v12 + 16))
  {
    swift_release();
    goto LABEL_10;
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  unint64_t v13 = sub_10000836C(a1, a2);
  if ((v14 & 1) == 0)
  {
    swift_release();
    swift_bridgeObjectRelease();
    goto LABEL_9;
  }
  uint64_t v15 = *(void *)(*(void *)(v12 + 56) + 16 * v13);
  swift_bridgeObjectRetain();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v15;
}

uint64_t sub_1000334E4()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for ContainerIndex()
{
  return self;
}

uint64_t getEnumTagSinglePayload for ContainerClass(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for ContainerClass(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1000336A4);
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

ValueMetadata *type metadata accessor for ContainerClass()
{
  return &type metadata for ContainerClass;
}

unint64_t sub_1000336E0()
{
  unint64_t result = qword_10007CB08;
  if (!qword_10007CB08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007CB08);
  }
  return result;
}

unint64_t sub_100033734(Swift::String string)
{
  object = string._object;
  v2._countAndFlagsBits = string._countAndFlagsBits;
  v2._object = object;
  unint64_t v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_10006D9A0, v2);
  swift_bridgeObjectRelease();
  if (v3 >= 6) {
    return 6;
  }
  else {
    return v3;
  }
}

unint64_t sub_100033780()
{
  unint64_t result = qword_10007CB10;
  if (!qword_10007CB10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007CB10);
  }
  return result;
}

uint64_t sub_1000337D4()
{
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_1000337E4()
{
  swift_release();
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_10003382C(uint64_t a1)
{
  return sub_10003275C(a1, *(void *)(v1 + 16), *(void *)(v1 + 24), *(unsigned __int8 *)(v1 + 32), *(void *)(v1 + 40));
}

uint64_t sub_10003383C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10003384C()
{
  return swift_release();
}

uint64_t sub_100033854(uint64_t a1)
{
  uint64_t v2 = sub_1000082E0(&qword_10007CB18);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_1000338B4()
{
  unint64_t result = qword_10007CB20;
  if (!qword_10007CB20)
  {
    type metadata accessor for FilePath();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007CB20);
  }
  return result;
}

uint64_t sub_10003390C(unsigned __int8 a1, char a2)
{
  uint64_t v2 = 0x61746144707061;
  unint64_t v3 = 0xE700000000000000;
  uint64_t v4 = a1;
  uint64_t v5 = 0x61746144707061;
  switch(v4)
  {
    case 1:
      uint64_t v6 = 0x6E6967756C70;
      goto LABEL_5;
    case 2:
      unint64_t v3 = 0xE600000000000000;
      uint64_t v5 = 0x6E6F6D656164;
      break;
    case 3:
      uint64_t v6 = 0x6D6574737973;
LABEL_5:
      uint64_t v5 = v6 & 0xFFFFFFFFFFFFLL | 0x6144000000000000;
      unint64_t v3 = 0xEA00000000006174;
      break;
    case 4:
      unint64_t v3 = 0xE800000000000000;
      uint64_t v5 = 0x70756F7247707061;
      break;
    case 5:
      uint64_t v5 = 0x72476D6574737973;
      unint64_t v3 = 0xEB0000000070756FLL;
      break;
    default:
      break;
  }
  unint64_t v7 = 0xE700000000000000;
  switch(a2)
  {
    case 1:
      uint64_t v8 = 0x6E6967756C70;
      goto LABEL_13;
    case 2:
      unint64_t v7 = 0xE600000000000000;
      if (v5 != 0x6E6F6D656164) {
        goto LABEL_20;
      }
      goto LABEL_17;
    case 3:
      uint64_t v8 = 0x6D6574737973;
LABEL_13:
      unint64_t v7 = 0xEA00000000006174;
      if (v5 != (v8 & 0xFFFFFFFFFFFFLL | 0x6144000000000000)) {
        goto LABEL_20;
      }
      goto LABEL_17;
    case 4:
      unint64_t v7 = 0xE800000000000000;
      uint64_t v2 = 0x70756F7247707061;
      goto LABEL_16;
    case 5:
      unint64_t v7 = 0xEB0000000070756FLL;
      if (v5 != 0x72476D6574737973) {
        goto LABEL_20;
      }
      goto LABEL_17;
    default:
LABEL_16:
      if (v5 != v2) {
        goto LABEL_20;
      }
LABEL_17:
      if (v3 == v7) {
        char v9 = 1;
      }
      else {
LABEL_20:
      }
        char v9 = _stringCompareWithSmolCheck(_:_:expecting:)();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v9 & 1;
  }
}

uint64_t sub_100033B10(unsigned __int8 a1, char a2)
{
  unint64_t v2 = 1684104562;
  unint64_t v3 = 0xE400000000000000;
  uint64_t v4 = a1;
  unint64_t v5 = 1684104562;
  switch(v4)
  {
    case 1:
      unint64_t v3 = 0xE500000000000000;
      unint64_t v5 = 0x6574697277;
      break;
    case 2:
      unint64_t v3 = 0xE600000000000000;
      unint64_t v5 = 0x657461657263;
      break;
    case 3:
      unint64_t v3 = 0x800000010005AC20;
      unint64_t v5 = 0xD000000000000015;
      break;
    case 4:
      unint64_t v3 = 0xE700000000000000;
      unint64_t v5 = 0x6E776F6E6B6E75;
      break;
    default:
      break;
  }
  unint64_t v6 = 0xE400000000000000;
  switch(a2)
  {
    case 1:
      unint64_t v6 = 0xE500000000000000;
      if (v5 == 0x6574697277) {
        goto LABEL_13;
      }
      goto LABEL_16;
    case 2:
      unint64_t v6 = 0xE600000000000000;
      if (v5 != 0x657461657263) {
        goto LABEL_16;
      }
      goto LABEL_13;
    case 3:
      unint64_t v6 = 0x800000010005AC20;
      unint64_t v2 = 0xD000000000000015;
      goto LABEL_12;
    case 4:
      unint64_t v6 = 0xE700000000000000;
      if (v5 != 0x6E776F6E6B6E75) {
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
        char v7 = _stringCompareWithSmolCheck(_:_:expecting:)();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v7 & 1;
  }
}

Swift::Int sub_100033CC4()
{
  return Hasher._finalize()();
}

Swift::Int sub_100033DAC()
{
  return Hasher._finalize()();
}

unint64_t sub_100033EBC(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    unint64_t v2 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_1000082E0(&qword_10007CD00);
  unint64_t v2 = (void *)static _DictionaryStorage.allocate(capacity:)();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (uint64_t *)(a1 + 56);
  while (1)
  {
    uint64_t v5 = *(v4 - 3);
    uint64_t v6 = *(v4 - 2);
    uint64_t v8 = *(v4 - 1);
    uint64_t v7 = *v4;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t result = sub_10000836C(v5, v6);
    if (v10) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v2[6] + 16 * result);
    uint64_t *v11 = v5;
    v11[1] = v6;
    uint64_t v12 = (void *)(v2[7] + 16 * result);
    *uint64_t v12 = v8;
    v12[1] = v7;
    uint64_t v13 = v2[2];
    BOOL v14 = __OFADD__(v13, 1);
    uint64_t v15 = v13 + 1;
    if (v14) {
      goto LABEL_11;
    }
    v4 += 4;
    v2[2] = v15;
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

unint64_t sub_100033FE0(uint64_t a1)
{
  return sub_100034230(a1, &qword_10007CC98);
}

unint64_t sub_100033FEC(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    unint64_t v2 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_1000082E0(&qword_10007CC90);
  unint64_t v2 = (void *)static _DictionaryStorage.allocate(capacity:)();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (void *)(a1 + 40);
  while (1)
  {
    unsigned __int8 v5 = *((unsigned char *)v4 - 8);
    uint64_t v6 = *v4;
    swift_retain();
    unint64_t result = sub_100036E98(v5);
    if (v8) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    *(unsigned char *)(v2[6] + result) = v5;
    *(void *)(v2[7] + 8 * result) = v6;
    uint64_t v9 = v2[2];
    BOOL v10 = __OFADD__(v9, 1);
    uint64_t v11 = v9 + 1;
    if (v10) {
      goto LABEL_11;
    }
    v2[2] = v11;
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

unint64_t sub_1000340F0(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    unint64_t v2 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_1000082E0(&qword_10007CCA8);
  unint64_t v2 = (void *)static _DictionaryStorage.allocate(capacity:)();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (unsigned char *)(a1 + 64);
  while (1)
  {
    uint64_t v5 = *((void *)v4 - 4);
    uint64_t v6 = *((void *)v4 - 3);
    uint64_t v8 = *((void *)v4 - 2);
    uint64_t v7 = *((void *)v4 - 1);
    char v9 = *v4;
    swift_bridgeObjectRetain();
    unint64_t result = sub_10000836C(v5, v6);
    if (v11) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v12 = (uint64_t *)(v2[6] + 16 * result);
    *uint64_t v12 = v5;
    v12[1] = v6;
    uint64_t v13 = v2[7] + 24 * result;
    *(void *)uint64_t v13 = v8;
    *(void *)(v13 + 8) = v7;
    *(unsigned char *)(v13 + 16) = v9;
    uint64_t v14 = v2[2];
    BOOL v15 = __OFADD__(v14, 1);
    uint64_t v16 = v14 + 1;
    if (v15) {
      goto LABEL_11;
    }
    v2[2] = v16;
    v4 += 40;
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

unint64_t sub_100034224(uint64_t a1)
{
  return sub_100034230(a1, &qword_10007CCA0);
}

unint64_t sub_100034230(uint64_t a1, uint64_t *a2)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_1000082E0(a2);
  uint64_t v3 = (void *)static _DictionaryStorage.allocate(capacity:)();
  uint64_t v4 = *(void *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  swift_retain();
  uint64_t v5 = (uint64_t *)(a1 + 48);
  while (1)
  {
    uint64_t v6 = *(v5 - 2);
    uint64_t v7 = *(v5 - 1);
    uint64_t v8 = *v5;
    swift_bridgeObjectRetain();
    swift_retain();
    unint64_t result = sub_10000836C(v6, v7);
    if (v10) {
      break;
    }
    *(void *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    char v11 = (uint64_t *)(v3[6] + 16 * result);
    uint64_t *v11 = v6;
    v11[1] = v7;
    *(void *)(v3[7] + 8 * result) = v8;
    uint64_t v12 = v3[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v3[2] = v14;
    v5 += 3;
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

uint64_t sub_100034348()
{
  uint64_t v0 = type metadata accessor for Logger();
  sub_10000AFD4(v0, qword_10007DAF8);
  sub_10000AF48(v0, (uint64_t)qword_10007DAF8);
  return Logger.init(subsystem:category:)();
}

uint64_t sub_1000343C0(void *a1)
{
  uint64_t v3 = sub_1000082E0(&qword_10007CCC0);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = &v8[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_10000B090(a1, a1[3]);
  sub_100037BEC();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  v8[15] = 0;
  KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
  if (!v1)
  {
    v8[14] = 1;
    KeyedEncodingContainer.encode(_:forKey:)();
    v8[13] = 2;
    KeyedEncodingContainer.encode(_:forKey:)();
    v8[12] = 3;
    KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v4 + 8))(v6, v3);
}

unint64_t sub_100034570()
{
  unint64_t result = 0x69467963696C6F70;
  switch(*v0)
  {
    case 1:
      unint64_t result = 0xD000000000000016;
      break;
    case 2:
      unint64_t result = 0x746E657645676F6CLL;
      break;
    case 3:
      unint64_t result = 0xD000000000000012;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_100034614@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1000375A0(a1, a2);
  *a3 = result;
  return result;
}

void sub_10003463C(unsigned char *a1@<X8>)
{
  *a1 = 4;
}

uint64_t sub_100034648(uint64_t a1)
{
  unint64_t v2 = sub_100037BEC();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100034684(uint64_t a1)
{
  unint64_t v2 = sub_100037BEC();

  return CodingKey.debugDescription.getter(a1, v2);
}

double sub_1000346C0@<D0>(void *a1@<X0>, _OWORD *a2@<X8>)
{
  sub_100037768(a1, (uint64_t)v6);
  if (!v2)
  {
    long long v5 = v6[1];
    *a2 = v6[0];
    a2[1] = v5;
    double result = *(double *)&v7;
    a2[2] = v7;
  }
  return result;
}

uint64_t sub_100034704(void *a1)
{
  return sub_1000343C0(a1);
}

uint64_t sub_10003471C()
{
  *(void *)(v1 + 152) = v0;
  return _swift_task_switch(sub_10003473C, 0, 0);
}

uint64_t sub_10003473C()
{
  uint64_t v55 = v0;
  uint64_t v2 = v0 + 19;
  uint64_t v1 = v0[19];
  uint64_t v3 = *(void *)(v1 + 16);
  v0[20] = v3;
  uint64_t v4 = *(__objc2_ivar **)(v1 + 24);
  v0[21] = v4;
  if (!v4)
  {
    if (qword_10007A5C0 != -1) {
      swift_once();
    }
    uint64_t v51 = type metadata accessor for Logger();
    sub_10000AF48(v51, (uint64_t)qword_10007DAE0);
    char v10 = Logger.logObject.getter();
    os_log_type_t v11 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v10, v11))
    {
      uint64_t v12 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v12 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, v11, "loading built-in policy", v12, 2u);
      swift_slowDealloc();
    }
    uint64_t v3 = (uint64_t)(v0 + 11);

    if (qword_10007A5F8 != -1) {
      swift_once();
    }
    uint64_t v48 = v0 + 14;
    uint64_t v47 = v0 + 15;
    uint64_t v13 = qword_10007DB50;
    uint64_t v0 = *(void **)(qword_10007DB50 + 16);
    if (v0)
    {
      uint64_t v14 = v2 - 17;
      swift_bridgeObjectRetain();
      uint64_t v15 = v13 + 40;
      do
      {
        uint64_t v16 = *(void *)v15;
        uint64_t v17 = *(void *)(v15 + 8);
        char v18 = *(unsigned char *)(v15 + 32);
        long long v19 = *(_OWORD *)(v15 + 16);
        *(void *)(v45 + 16) = *(void *)(v15 - 8);
        *(void *)(v45 + 24) = v16;
        *(void *)(v45 + 32) = v17;
        *(_OWORD *)(v45 + 40) = v19;
        *(unsigned char *)(v45 + 56) = v18;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        sub_10004F020(v14);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        v15 += 48;
        uint64_t v0 = (void *)((char *)v0 - 1);
      }
      while (v0);
      swift_bridgeObjectRelease();
    }
    uint64_t v20 = *(void *)(*(void *)(v45 + 152) + 112);
    unint64_t v21 = sub_100034230((uint64_t)&_swiftEmptyArrayStorage, &qword_10007CC98);
    swift_beginAccess();
    *(void *)(v20 + 16) = v21;
    swift_bridgeObjectRelease();
    unint64_t v22 = sub_100033FEC((uint64_t)&_swiftEmptyArrayStorage);
    swift_beginAccess();
    *(void *)(v20 + 24) = v22;
    swift_bridgeObjectRelease();
    sub_100031E5C(0);
    sub_100031E5C(1u);
    sub_100031E5C(2u);
    sub_100031E5C(3u);
    sub_100031E5C(4u);
    sub_100031E5C(5u);
    uint64_t v23 = *(void *)(v20 + 16);
    uint64_t v49 = v23 + 64;
    uint64_t v24 = -1;
    uint64_t v25 = -1 << *(unsigned char *)(v23 + 32);
    if (-v25 < 64) {
      uint64_t v24 = ~(-1 << -(char)v25);
    }
    unint64_t v26 = v24 & *(void *)(v23 + 64);
    int64_t v50 = (unint64_t)(63 - v25) >> 6;
    swift_bridgeObjectRetain();
    int64_t v27 = 0;
    uint64_t v2 = qword_10007DAE0;
    uint64_t v4 = &stru_10007A000;
    uint64_t v46 = v23;
    while (1)
    {
      if (v26)
      {
        uint64_t v53 = (v26 - 1) & v26;
        unint64_t v28 = __clz(__rbit64(v26)) | (v27 << 6);
      }
      else
      {
        int64_t v29 = v27 + 1;
        if (__OFADD__(v27, 1))
        {
          __break(1u);
LABEL_55:
          __break(1u);
          goto LABEL_56;
        }
        uint64_t v0 = (void *)v45;
        if (v29 >= v50) {
          goto LABEL_47;
        }
        unint64_t v30 = *(void *)(v49 + 8 * v29);
        ++v27;
        if (!v30)
        {
          int64_t v27 = v29 + 1;
          if (v29 + 1 >= v50) {
            goto LABEL_47;
          }
          unint64_t v30 = *(void *)(v49 + 8 * v27);
          if (!v30)
          {
            int64_t v27 = v29 + 2;
            if (v29 + 2 >= v50) {
              goto LABEL_47;
            }
            unint64_t v30 = *(void *)(v49 + 8 * v27);
            if (!v30)
            {
              int64_t v31 = v29 + 3;
              if (v31 >= v50)
              {
LABEL_47:
                swift_release();
                uint64_t v42 = *(uint64_t (**)(void))(v45 + 8);
                return v42();
              }
              unint64_t v30 = *(void *)(v49 + 8 * v31);
              if (!v30)
              {
                while (1)
                {
                  int64_t v27 = v31 + 1;
                  if (__OFADD__(v31, 1)) {
                    goto LABEL_55;
                  }
                  if (v27 >= v50) {
                    goto LABEL_47;
                  }
                  unint64_t v30 = *(void *)(v49 + 8 * v27);
                  ++v31;
                  if (v30) {
                    goto LABEL_35;
                  }
                }
              }
              int64_t v27 = v31;
            }
          }
        }
LABEL_35:
        uint64_t v53 = (v30 - 1) & v30;
        unint64_t v28 = __clz(__rbit64(v30)) + (v27 << 6);
      }
      int64_t v52 = v27;
      uint64_t v32 = *(void *)(v23 + 48) + 16 * v28;
      uint64_t v0 = *(void **)v32;
      unint64_t v33 = *(void *)(v32 + 8);
      uint64_t v34 = *(void *)(*(void *)(v23 + 56) + 8 * v28);
      offs = v4[46].offs;
      swift_bridgeObjectRetain();
      swift_retain();
      if (offs != (int32_t *)-1) {
        swift_once();
      }
      sub_10000AF48(v51, (uint64_t)qword_10007DAE0);
      swift_bridgeObjectRetain_n();
      swift_retain_n();
      uint64_t v36 = Logger.logObject.getter();
      os_log_type_t v37 = static os_log_type_t.debug.getter();
      if (os_log_type_enabled(v36, v37))
      {
        uint64_t v38 = swift_slowAlloc();
        uint64_t v54 = swift_slowAlloc();
        *(_DWORD *)uint64_t v38 = 136315394;
        unint64_t v39 = 0xE700000000000000;
        uint64_t v40 = 0x61746144707061;
        switch(*(unsigned char *)(v34 + 16))
        {
          case 1:
            uint64_t v41 = 0x6E6967756C70;
            goto LABEL_43;
          case 2:
            unint64_t v39 = 0xE600000000000000;
            uint64_t v40 = 0x6E6F6D656164;
            break;
          case 3:
            uint64_t v41 = 0x6D6574737973;
LABEL_43:
            uint64_t v40 = v41 & 0xFFFFFFFFFFFFLL | 0x6144000000000000;
            unint64_t v39 = 0xEA00000000006174;
            break;
          case 4:
            unint64_t v39 = 0xE800000000000000;
            uint64_t v40 = 0x70756F7247707061;
            break;
          case 5:
            unint64_t v39 = 0xEB0000000070756FLL;
            uint64_t v40 = 0x72476D6574737973;
            break;
          default:
            break;
        }
        *uint64_t v48 = sub_10001EE9C(v40, v39, &v54);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease();
        swift_release_n();
        *(_WORD *)(v38 + 12) = 2080;
        swift_bridgeObjectRetain();
        *uint64_t v47 = sub_10001EE9C((uint64_t)v0, v33, &v54);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease_n();
        _os_log_impl((void *)&_mh_execute_header, v36, v37, "container class %s directory is %s", (uint8_t *)v38, 0x16u);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();

        uint64_t v4 = &stru_10007A000;
        uint64_t v23 = v46;
        uint64_t v2 = qword_10007DAE0;
      }
      else
      {
        swift_release_n();
        swift_bridgeObjectRelease_n();
      }
      int64_t v27 = v52;
      uint64_t v3 = *(unsigned __int8 *)(v34 + 16);
      *(unsigned char *)(sub_10004E79C((uint64_t)v0) + 56) = v3;
      swift_release();
      swift_release();
      swift_bridgeObjectRelease();
      unint64_t v26 = v53;
    }
  }
  uint64_t v5 = qword_10007A5C0;
  swift_bridgeObjectRetain();
  if (v5 != -1) {
LABEL_56:
  }
    swift_once();
  uint64_t v6 = type metadata accessor for Logger();
  v0[22] = sub_10000AF48(v6, (uint64_t)qword_10007DAE0);
  swift_bridgeObjectRetain_n();
  long long v7 = Logger.logObject.getter();
  os_log_type_t v8 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v7, v8))
  {
    char v9 = (uint8_t *)swift_slowAlloc();
    uint64_t v54 = swift_slowAlloc();
    *(_DWORD *)char v9 = 136315138;
    uint64_t v0 = (void *)v45;
    swift_bridgeObjectRetain();
    *(v2 - 1) = sub_10001EE9C(v3, (unint64_t)v4, &v54);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v7, v8, "loading policy from %s", v9, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  v0[23] = *(void *)(v0[19] + 64);
  char v44 = (void *)swift_task_alloc();
  v0[24] = v44;
  *char v44 = v0;
  v44[1] = sub_10003504C;
  return sub_10004F5E0(v3, (uint64_t)v4);
}

uint64_t sub_10003504C()
{
  *(void *)(*(void *)v1 + 200) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_1000356E4;
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v2 = sub_100035168;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_100035168()
{
  unint64_t v39 = v0;
  uint64_t v32 = v0 + 15;
  unint64_t v33 = v0 + 14;
  uint64_t v1 = *(void *)(v0[19] + 112);
  unint64_t v2 = sub_100034230((uint64_t)&_swiftEmptyArrayStorage, &qword_10007CC98);
  swift_beginAccess();
  *(void *)(v1 + 16) = v2;
  swift_bridgeObjectRelease();
  unint64_t v3 = sub_100033FEC((uint64_t)&_swiftEmptyArrayStorage);
  swift_beginAccess();
  *(void *)(v1 + 24) = v3;
  swift_bridgeObjectRelease();
  sub_100031E5C(0);
  sub_100031E5C(1u);
  sub_100031E5C(2u);
  sub_100031E5C(3u);
  sub_100031E5C(4u);
  sub_100031E5C(5u);
  uint64_t v4 = *(void *)(v1 + 16);
  uint64_t v34 = v4 + 64;
  uint64_t v5 = -1;
  uint64_t v6 = -1 << *(unsigned char *)(v4 + 32);
  if (-v6 < 64) {
    uint64_t v5 = ~(-1 << -(char)v6);
  }
  unint64_t v7 = v5 & *(void *)(v4 + 64);
  int64_t v35 = (unint64_t)(63 - v6) >> 6;
  unint64_t v30 = v0;
  swift_bridgeObjectRetain();
  int64_t v8 = 0;
  char v9 = &stru_10007A000;
  uint64_t v31 = v4;
  while (1)
  {
    if (v7)
    {
      unint64_t v12 = __clz(__rbit64(v7));
      v7 &= v7 - 1;
      unint64_t v13 = v12 | (v8 << 6);
      goto LABEL_22;
    }
    int64_t v14 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
      __break(1u);
      goto LABEL_37;
    }
    if (v14 >= v35) {
      goto LABEL_33;
    }
    unint64_t v15 = *(void *)(v34 + 8 * v14);
    ++v8;
    if (!v15)
    {
      int64_t v8 = v14 + 1;
      if (v14 + 1 >= v35) {
        goto LABEL_33;
      }
      unint64_t v15 = *(void *)(v34 + 8 * v8);
      if (!v15)
      {
        int64_t v8 = v14 + 2;
        if (v14 + 2 >= v35) {
          goto LABEL_33;
        }
        unint64_t v15 = *(void *)(v34 + 8 * v8);
        if (!v15) {
          break;
        }
      }
    }
LABEL_21:
    unint64_t v7 = (v15 - 1) & v15;
    unint64_t v13 = __clz(__rbit64(v15)) + (v8 << 6);
LABEL_22:
    uint64_t v17 = (uint64_t *)(*(void *)(v4 + 48) + 16 * v13);
    unint64_t v18 = v17[1];
    uint64_t v36 = *v17;
    uint64_t v19 = *(void *)(*(void *)(v4 + 56) + 8 * v13);
    offs = v9[46].offs;
    swift_bridgeObjectRetain();
    swift_retain();
    if (offs != (int32_t *)-1) {
      swift_once();
    }
    uint64_t v21 = type metadata accessor for Logger();
    sub_10000AF48(v21, (uint64_t)qword_10007DAE0);
    swift_bridgeObjectRetain_n();
    swift_retain_n();
    unint64_t v22 = Logger.logObject.getter();
    os_log_type_t v23 = static os_log_type_t.debug.getter();
    int64_t v37 = v8;
    if (os_log_type_enabled(v22, v23))
    {
      uint64_t v24 = swift_slowAlloc();
      uint64_t v38 = swift_slowAlloc();
      *(_DWORD *)uint64_t v24 = 136315394;
      unint64_t v25 = 0xE700000000000000;
      uint64_t v26 = 0x61746144707061;
      switch(*(unsigned char *)(v19 + 16))
      {
        case 1:
          uint64_t v27 = 0x6E6967756C70;
          goto LABEL_29;
        case 2:
          unint64_t v25 = 0xE600000000000000;
          uint64_t v26 = 0x6E6F6D656164;
          break;
        case 3:
          uint64_t v27 = 0x6D6574737973;
LABEL_29:
          uint64_t v26 = v27 & 0xFFFFFFFFFFFFLL | 0x6144000000000000;
          unint64_t v25 = 0xEA00000000006174;
          break;
        case 4:
          unint64_t v25 = 0xE800000000000000;
          uint64_t v26 = 0x70756F7247707061;
          break;
        case 5:
          unint64_t v25 = 0xEB0000000070756FLL;
          uint64_t v26 = 0x72476D6574737973;
          break;
        default:
          break;
      }
      *unint64_t v33 = sub_10001EE9C(v26, v25, &v38);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      swift_release_n();
      *(_WORD *)(v24 + 12) = 2080;
      swift_bridgeObjectRetain();
      *uint64_t v32 = sub_10001EE9C(v36, v18, &v38);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v22, v23, "container class %s directory is %s", (uint8_t *)v24, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      uint64_t v10 = v36;
      uint64_t v4 = v31;
      char v9 = &stru_10007A000;
    }
    else
    {
      swift_release_n();
      swift_bridgeObjectRelease_n();

      uint64_t v10 = v36;
    }
    char v11 = *(unsigned char *)(v19 + 16);
    *(unsigned char *)(sub_10004E79C(v10) + 56) = v11;
    swift_release();
    swift_release();
    swift_bridgeObjectRelease();
    int64_t v8 = v37;
  }
  int64_t v16 = v14 + 3;
  if (v16 < v35)
  {
    unint64_t v15 = *(void *)(v34 + 8 * v16);
    if (!v15)
    {
      while (1)
      {
        int64_t v8 = v16 + 1;
        if (__OFADD__(v16, 1)) {
          break;
        }
        if (v8 >= v35) {
          goto LABEL_33;
        }
        unint64_t v15 = *(void *)(v34 + 8 * v8);
        ++v16;
        if (v15) {
          goto LABEL_21;
        }
      }
LABEL_37:
      __break(1u);
      JUMPOUT(0x1000356CCLL);
    }
    int64_t v8 = v16;
    goto LABEL_21;
  }
LABEL_33:
  swift_release();
  unint64_t v28 = (uint64_t (*)(void))v30[1];
  return v28();
}

uint64_t sub_1000356E4()
{
  unint64_t v13 = v0;
  swift_errorRetain();
  swift_bridgeObjectRetain();
  swift_errorRetain();
  uint64_t v1 = Logger.logObject.getter();
  os_log_type_t v2 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v4 = v0[20];
    unint64_t v3 = v0[21];
    uint64_t v5 = swift_slowAlloc();
    uint64_t v6 = (void *)swift_slowAlloc();
    uint64_t v12 = swift_slowAlloc();
    *(_DWORD *)uint64_t v5 = 136315394;
    swift_bridgeObjectRetain();
    v0[16] = sub_10001EE9C(v4, v3, &v12);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v5 + 12) = 2112;
    swift_errorRetain();
    uint64_t v7 = _swift_stdlib_bridgeErrorToNSError();
    v0[17] = v7;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *uint64_t v6 = v7;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "failed to load policy from %s: %@", (uint8_t *)v5, 0x16u);
    sub_1000082E0(&qword_10007BFB8);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_bridgeObjectRelease_n();
    swift_errorRelease();
    swift_errorRelease();
  }

  uint64_t v8 = v0[25];
  sub_100037D14();
  swift_allocError();
  void *v9 = v8;
  swift_willThrow();
  uint64_t v10 = (uint64_t (*)(void))v0[1];
  return v10();
}

void sub_100035954()
{
  unint64_t v1 = v0[7];
  if (v1)
  {
    uint64_t v2 = v0[6];
    unint64_t v3 = self;
    swift_bridgeObjectRetain();
    id v4 = [v3 defaultManager];
    NSString v5 = String._bridgeToObjectiveC()();
    [v4 createFileAtPath:v5 contents:0 attributes:0];

    swift_bridgeObjectRetain();
    NSString v6 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    id v7 = [self fileHandleForWritingAtPath:v6];

    if (v7)
    {
      uint64_t v8 = (void *)v0[16];
      v0[16] = v7;
      id v17 = v7;

      if (qword_10007A5C0 != -1) {
        swift_once();
      }
      uint64_t v9 = type metadata accessor for Logger();
      sub_10000AF48(v9, (uint64_t)qword_10007DAE0);
      swift_bridgeObjectRetain();
      uint64_t v10 = Logger.logObject.getter();
      os_log_type_t v11 = static os_log_type_t.info.getter();
      if (os_log_type_enabled(v10, v11))
      {
        uint64_t v12 = (uint8_t *)swift_slowAlloc();
        uint64_t v18 = swift_slowAlloc();
        *(_DWORD *)uint64_t v12 = 136315138;
        swift_bridgeObjectRetain();
        sub_10001EE9C(v2, v1, &v18);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease_n();
        _os_log_impl((void *)&_mh_execute_header, v10, v11, "recording events to %s", v12, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
    }
    else
    {
      if (qword_10007A5C0 != -1) {
        swift_once();
      }
      uint64_t v13 = type metadata accessor for Logger();
      sub_10000AF48(v13, (uint64_t)qword_10007DAE0);
      swift_bridgeObjectRetain();
      uint64_t v14 = Logger.logObject.getter();
      os_log_type_t v15 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v14, v15))
      {
        int64_t v16 = (uint8_t *)swift_slowAlloc();
        uint64_t v18 = swift_slowAlloc();
        *(_DWORD *)int64_t v16 = 136315138;
        swift_bridgeObjectRetain();
        sub_10001EE9C(v2, v1, &v18);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease_n();
        _os_log_impl((void *)&_mh_execute_header, v14, v15, "failed to open event recording file %s", v16, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
    }
  }
}

uint64_t sub_100035D60(uint64_t a1)
{
  *(void *)(v2 + 72) = a1;
  *(void *)(v2 + 80) = v1;
  return _swift_task_switch(sub_100009000, 0, 0);
}

uint64_t sub_100035D80()
{
  uint64_t v1 = *v0 + 16;
  swift_task_dealloc();
  sub_100008940(v1);
  return _swift_task_switch(sub_100035E88, 0, 0);
}

uint64_t sub_100035E88()
{
  uint64_t v1 = *(void *)(v0 + 80);
  if ((*(unsigned char *)(v1 + 40) & 1) != 0 || *(void *)(v1 + 128)) {
    sub_1000365F0(*(void **)(v0 + 72), *(void *)(v0 + 120), *(void *)(v0 + 128), *(unsigned char *)(v0 + 157) & 1 | ((*(unsigned char *)(v0 + 158) & 1) << 8), *(void *)(v0 + 112), *(unsigned char *)(v0 + 159), *(void *)(v0 + 104), *(void *)(v0 + 96));
  }
  sub_100008940(v0 + 16);
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_100035F24()
{
  uint64_t v1 = *(uint64_t (**)(uint64_t))(**(void **)(*(void *)(*(void *)(v0 + 80) + 136) + 72) + 136);
  uint64_t v2 = swift_retain();
  atomic_fetch_add_explicit((atomic_ullong *volatile)v1(v2), 1uLL, memory_order_relaxed);
  swift_release();
  uint64_t v3 = *(uint64_t (**)(void))(v0 + 8);
  return v3();
}

uint64_t sub_100035FCC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, char a6, uint64_t a7, uint64_t a8)
{
  *(void *)(v9 + 64) = a8;
  *(void *)(v9 + 72) = v8;
  *(void *)(v9 + 48) = a4;
  *(void *)(v9 + 56) = a7;
  *(unsigned char *)(v9 + 81) = a6;
  *(unsigned char *)(v9 + 80) = a5;
  *(void *)(v9 + 32) = a2;
  *(void *)(v9 + 40) = a3;
  *(void *)(v9 + 24) = a1;
  return _swift_task_switch(sub_100036000, 0, 0);
}

uint64_t sub_100036000()
{
  uint64_t v1 = *(void *)(v0 + 24);
  uint64_t v2 = *(void *)(v0 + 72);
  uint64_t v3 = *(void *)(v0 + 32);
  uint64_t v4 = *(uint64_t (**)(uint64_t))(**(void **)(*(void *)(v2 + 136) + 16) + 136);
  unsigned int v5 = *(unsigned __int8 *)(v0 + 80);
  int v6 = *(unsigned __int8 *)(v0 + 81);
  uint64_t v7 = swift_retain();
  uint64_t v8 = *(void *)v4(v7);
  swift_release();
  sub_10001B4CC(v8, v1, v3, v5, v6);
  unint64_t v9 = sub_1000364F4();
  if (v10)
  {
    uint64_t v14 = *(uint64_t (**)(uint64_t))(**(void **)(*(void *)(v2 + 136) + 104) + 136);
    uint64_t v15 = swift_retain();
    atomic_fetch_add_explicit((atomic_ullong *volatile)v14(v15), 1uLL, memory_order_relaxed);
  }
  else
  {
    uint64_t v11 = v9;
    uint64_t v12 = *(void *)(v0 + 48);
    uint64_t v21 = *(void *)(v0 + 40);
    uint64_t v13 = *(void *)(v0 + 32);
    uint64_t v20 = *(void *)(v0 + 24);
    char v18 = *(unsigned char *)(v0 + 81);
    unsigned int v19 = *(unsigned __int8 *)(v0 + 80);
    type metadata accessor for AnalyticsSchemaV2.FileAnalytics(0);
    swift_allocObject();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_10002108C(v11, v21, v12, v20, v13, v19, v18);
    sub_100037C94(&qword_10007BFD0, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV2.FileAnalytics);
    dispatch thunk of ModelContext.insert<A>(_:)();
  }
  swift_release();
  dispatch thunk of ModelContext.save()();
  int64_t v16 = *(uint64_t (**)(void))(v0 + 8);
  return v16();
}

unint64_t sub_1000364F4()
{
  uint64_t v1 = *(uint64_t (**)(uint64_t))(**(void **)(*(void *)(v0 + 136) + 32) + 136);
  uint64_t v2 = swift_retain();
  unint64_t add_explicit = atomic_fetch_add_explicit((atomic_ullong *volatile)v1(v2), 1uLL, memory_order_relaxed);
  swift_release();
  int64_t v4 = *(void *)(v0 + 32);
  if (v4 <= (uint64_t)(add_explicit + 1)) {
    unint64_t result = add_explicit + 1;
  }
  else {
    unint64_t result = *(void *)(v0 + 32);
  }
  if ((result & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_10;
  }
  if (!result)
  {
LABEL_10:
    __break(1u);
    return result;
  }
  int64_t v6 = sub_100037514(result);
  if (v6 >= v4) {
    return 0;
  }
  uint64_t v7 = *(uint64_t (**)(uint64_t))(**(void **)(*(void *)(v0 + 136) + 96) + 136);
  uint64_t v8 = swift_retain();
  atomic_fetch_add_explicit((atomic_ullong *volatile)v7(v8), 1uLL, memory_order_relaxed);
  swift_release();
  return v6;
}

void sub_1000365F0(void *a1, uint64_t a2, uint64_t a3, __int16 a4, uint64_t a5, char a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9 = v8;
  uint64_t v10 = a1[6];
  uint64_t v11 = a1[7];
  *(void *)&long long v23 = *(void *)((char *)a1 + 12);
  *((void *)&v23 + 1) = v10;
  uint64_t v24 = v11;
  uint64_t v25 = a2;
  uint64_t v26 = a3;
  __int16 v27 = a4 & 0x101;
  uint64_t v28 = a5;
  char v29 = a6 & 1;
  uint64_t v30 = a7;
  uint64_t v31 = a8;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v12 = sub_100045D10(&v23);
  unint64_t v14 = v13;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v14)
  {
    if (*(unsigned char *)(v8 + 40) == 1)
    {
      if (qword_10007A5C8 != -1) {
        swift_once();
      }
      uint64_t v15 = type metadata accessor for Logger();
      sub_10000AF48(v15, (uint64_t)qword_10007DAF8);
      swift_bridgeObjectRetain_n();
      int64_t v16 = Logger.logObject.getter();
      os_log_type_t v17 = static os_log_type_t.info.getter();
      if (!os_log_type_enabled(v16, v17))
      {

        swift_bridgeObjectRelease_n();
        unsigned int v19 = *(void **)(v9 + 128);
        if (v19) {
          goto LABEL_8;
        }
LABEL_10:
        swift_bridgeObjectRelease();
        return;
      }
      char v18 = (uint8_t *)swift_slowAlloc();
      id v22 = (id)swift_slowAlloc();
      *(_DWORD *)char v18 = 136315138;
      swift_bridgeObjectRetain();
      sub_10001EE9C(v12, v14, (uint64_t *)&v22);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v16, v17, "Event: %s", v18, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    unsigned int v19 = *(void **)(v9 + 128);
    if (v19)
    {
LABEL_8:
      id v22 = v19;
      sub_1000082E0(&qword_10007CCE8);
      uint64_t v20 = swift_allocObject();
      *(_OWORD *)(v20 + 16) = xmmword_1000569E0;
      *(void *)(v20 + 56) = &type metadata for String;
      *(void *)(v20 + 32) = v12;
      *(void *)(v20 + 40) = v14;
      sub_100037C40();
      id v21 = v19;
      print<A>(_:separator:terminator:to:)();
      swift_bridgeObjectRelease();

      return;
    }
    goto LABEL_10;
  }
}

uint64_t sub_1000368D0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[18] = a4;
  v5[19] = a5;
  uint64_t v6 = sub_1000082E0(&qword_10007CCD0);
  v5[20] = v6;
  v5[21] = *(void *)(v6 - 8);
  v5[22] = swift_task_alloc();
  return _swift_task_switch(sub_100036994, 0, 0);
}

uint64_t sub_100036994()
{
  if (qword_10007A5C0 != -1) {
    swift_once();
  }
  uint64_t v1 = type metadata accessor for Logger();
  sub_10000AF48(v1, (uint64_t)qword_10007DAE0);
  uint64_t v2 = Logger.logObject.getter();
  os_log_type_t v3 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v2, v3))
  {
    int64_t v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)int64_t v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "starting analytics collection", v4, 2u);
    swift_slowDealloc();
  }

  sub_1000082E0(&qword_10007CCD8);
  AsyncStream.makeAsyncIterator()();
  unsigned int v5 = (void *)swift_task_alloc();
  *(void *)(v0 + 184) = v5;
  void *v5 = v0;
  v5[1] = sub_100008D4C;
  uint64_t v6 = *(void *)(v0 + 160);
  return AsyncStream.Iterator.next(isolation:)(v0 + 80, 0, 0, v6);
}

uint64_t sub_100036B18()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  swift_release();
  return v0;
}

uint64_t sub_100036B84()
{
  sub_100036B18();

  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for EventCollector()
{
  return self;
}

uint64_t destroy for EventCollectorConfig()
{
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for EventCollectorConfig(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  uint64_t v4 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for EventCollectorConfig(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 initializeWithTake for EventCollectorConfig(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v3;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for EventCollectorConfig(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  uint64_t v5 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v5;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for EventCollectorConfig(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 48)) {
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

uint64_t storeEnumTagSinglePayload for EventCollectorConfig(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 48) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 48) = 0;
    }
    if (a2) {
      *(void *)(result + 8) = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for EventCollectorConfig()
{
  return &type metadata for EventCollectorConfig;
}

unint64_t sub_100036E20(char a1)
{
  Hasher.init(_seed:)();
  Hasher._combine(_:)(dword_1000594B0[a1]);
  Swift::Int v2 = Hasher._finalize()();

  return sub_100037084(a1, v2);
}

unint64_t sub_100036E98(unsigned __int8 a1)
{
  Hasher.init(_seed:)();
  String.hash(into:)();
  swift_bridgeObjectRelease();
  Swift::Int v2 = Hasher._finalize()();

  return sub_100037138(a1, v2);
}

unint64_t sub_100036FD0(uint64_t a1)
{
  Hasher.init(_seed:)();
  type metadata accessor for CFString(0);
  sub_100037C94(&qword_10007CCE0, type metadata accessor for CFString);
  _CFObject.hash(into:)();
  Swift::Int v2 = Hasher._finalize()();

  return sub_1000373B8(a1, v2);
}

unint64_t sub_100037084(char a1, uint64_t a2)
{
  uint64_t v4 = v2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t result = a2 & ~v5;
  if ((*(void *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result))
  {
    int v7 = dword_1000594B0[a1];
    uint64_t v8 = *(void *)(v2 + 48);
    if (dword_1000594B0[*(char *)(v8 + result)] != v7)
    {
      uint64_t v9 = ~v5;
      for (unint64_t result = (result + 1) & v9;
            ((*(void *)(v4 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result) & 1) != 0;
            unint64_t result = (result + 1) & v9)
      {
        if (dword_1000594B0[*(char *)(v8 + result)] == v7) {
          break;
        }
      }
    }
  }
  return result;
}

unint64_t sub_100037138(unsigned __int8 a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v5 = ~v3;
    uint64_t v6 = a1;
    while (1)
    {
      unint64_t v7 = 0xE700000000000000;
      uint64_t v8 = 0x61746144707061;
      switch(*(unsigned char *)(*(void *)(v2 + 48) + v4))
      {
        case 1:
          uint64_t v9 = 0x6E6967756C70;
          goto LABEL_7;
        case 2:
          unint64_t v7 = 0xE600000000000000;
          uint64_t v8 = 0x6E6F6D656164;
          break;
        case 3:
          uint64_t v9 = 0x6D6574737973;
LABEL_7:
          uint64_t v8 = v9 & 0xFFFFFFFFFFFFLL | 0x6144000000000000;
          unint64_t v7 = 0xEA00000000006174;
          break;
        case 4:
          unint64_t v7 = 0xE800000000000000;
          uint64_t v8 = 0x70756F7247707061;
          break;
        case 5:
          uint64_t v8 = 0x72476D6574737973;
          unint64_t v7 = 0xEB0000000070756FLL;
          break;
        default:
          break;
      }
      unint64_t v10 = 0xE700000000000000;
      uint64_t v11 = 0x61746144707061;
      switch(v6)
      {
        case 1:
          uint64_t v12 = 0x6E6967756C70;
          goto LABEL_15;
        case 2:
          unint64_t v10 = 0xE600000000000000;
          if (v8 != 0x6E6F6D656164) {
            goto LABEL_20;
          }
          goto LABEL_19;
        case 3:
          uint64_t v12 = 0x6D6574737973;
LABEL_15:
          unint64_t v10 = 0xEA00000000006174;
          if (v8 != (v12 & 0xFFFFFFFFFFFFLL | 0x6144000000000000)) {
            goto LABEL_20;
          }
          goto LABEL_19;
        case 4:
          unint64_t v10 = 0xE800000000000000;
          uint64_t v11 = 0x70756F7247707061;
          goto LABEL_18;
        case 5:
          unint64_t v10 = 0xEB0000000070756FLL;
          if (v8 != 0x72476D6574737973) {
            goto LABEL_20;
          }
          goto LABEL_19;
        default:
LABEL_18:
          if (v8 != v11) {
            goto LABEL_20;
          }
LABEL_19:
          if (v7 == v10)
          {
            swift_bridgeObjectRelease_n();
            return v4;
          }
LABEL_20:
          char v13 = _stringCompareWithSmolCheck(_:_:expecting:)();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if (v13) {
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

unint64_t sub_1000373B8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t i = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i))
  {
    type metadata accessor for CFString(0);
    uint64_t v6 = *(void **)(*(void *)(v2 + 48) + 8 * i);
    sub_100037C94(&qword_10007CCE0, type metadata accessor for CFString);
    id v7 = v6;
    char v8 = static _CFObject.== infix(_:_:)();

    if ((v8 & 1) == 0)
    {
      uint64_t v9 = ~v4;
      for (unint64_t i = (i + 1) & v9; ((*(void *)(v3 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i) & 1) != 0; unint64_t i = (i + 1) & v9)
      {
        id v10 = *(id *)(*(void *)(v2 + 48) + 8 * i);
        char v11 = static _CFObject.== infix(_:_:)();

        if (v11) {
          break;
        }
      }
    }
  }
  return i;
}

unint64_t sub_100037514(unint64_t result)
{
  if (result)
  {
    unint64_t v1 = result;
    swift_stdlib_random();
    unint64_t result = (0 * (unsigned __int128)v1) >> 64;
    if (-(uint64_t)v1 % v1)
    {
      while (1)
        swift_stdlib_random();
    }
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_1000375A0(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x69467963696C6F70 && a2 == 0xEA0000000000656CLL;
  if (v2 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000016 && a2 == 0x800000010005D8F0 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x746E657645676F6CLL && a2 == 0xE900000000000073 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0xD000000000000012 && a2 == 0x800000010005D910)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else
  {
    char v6 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if (v6) {
      return 3;
    }
    else {
      return 4;
    }
  }
}

uint64_t sub_100037768@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = sub_1000082E0(&qword_10007CCB0);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  char v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000B090(a1, a1[3]);
  sub_100037BEC();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v2) {
    return sub_100008540((uint64_t)a1);
  }
  char v23 = 0;
  uint64_t v9 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
  uint64_t v11 = v10;
  char v22 = 1;
  swift_bridgeObjectRetain();
  uint64_t v18 = KeyedDecodingContainer.decode(_:forKey:)();
  char v21 = 2;
  int v19 = KeyedDecodingContainer.decode(_:forKey:)();
  char v20 = 3;
  uint64_t v12 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
  uint64_t v14 = v13;
  uint64_t v15 = *(void (**)(char *, uint64_t))(v6 + 8);
  uint64_t v17 = v12;
  v15(v8, v5);
  swift_bridgeObjectRetain();
  sub_100008540((uint64_t)a1);
  swift_bridgeObjectRelease();
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)a2 = v9;
  *(void *)(a2 + 8) = v11;
  *(void *)(a2 + 16) = v18;
  *(unsigned char *)(a2 + 24) = v19 & 1;
  *(void *)(a2 + 32) = v17;
  *(void *)(a2 + 40) = v14;
  return result;
}

uint64_t sub_1000379D8(_OWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v7 = type metadata accessor for JSONEncoder.OutputFormatting();
  __chkstk_darwin(v7 - 8);
  type metadata accessor for AnalyticsPolicy();
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = 0;
  *(void *)(v8 + 24) = 0;
  *(_WORD *)(v8 + 32) = 256;
  *(void *)(v8 + 40) = sub_1000340F0((uint64_t)&_swiftEmptyArrayStorage);
  *(void *)(v8 + 48) = sub_100034230((uint64_t)&_swiftEmptyArrayStorage, &qword_10007CCA0);
  *(unsigned char *)(v8 + 56) = 6;
  *(void *)(v4 + 64) = v8;
  type metadata accessor for LockStateObserver();
  swift_allocObject();
  *(void *)(v4 + 72) = sub_1000380CC();
  *(_OWORD *)(v4 + 80) = xmmword_1000592B0;
  *(unsigned char *)(v4 + 96) = 1;
  type metadata accessor for ContainerIndex();
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = sub_100034230((uint64_t)&_swiftEmptyArrayStorage, &qword_10007CC98);
  *(void *)(v9 + 24) = sub_100033FEC((uint64_t)&_swiftEmptyArrayStorage);
  *(void *)(v4 + 112) = v9;
  type metadata accessor for MessageEncoder();
  uint64_t v10 = swift_allocObject();
  type metadata accessor for JSONEncoder();
  swift_allocObject();
  *(void *)(v10 + 16) = JSONEncoder.init()();
  swift_retain();
  static JSONEncoder.OutputFormatting.sortedKeys.getter();
  dispatch thunk of JSONEncoder.outputFormatting.setter();
  swift_release();
  *(void *)(v4 + 120) = v10;
  *(void *)(v4 + 128) = 0;
  long long v11 = a1[1];
  *(_OWORD *)(v4 + 16) = *a1;
  *(_OWORD *)(v4 + 32) = v11;
  *(_OWORD *)(v4 + 48) = a1[2];
  type metadata accessor for AnalyticsStoreContext();
  uint64_t v12 = swift_allocObject();
  type metadata accessor for ModelContext();
  swift_allocObject();
  swift_retain();
  *(void *)(v12 + 16) = ModelContext.init(_:)();
  *(void *)(v4 + 104) = v12;
  *(void *)(v4 + 136) = a3;
  return v4;
}

unint64_t sub_100037BEC()
{
  unint64_t result = qword_10007CCB8;
  if (!qword_10007CCB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007CCB8);
  }
  return result;
}

unint64_t sub_100037C40()
{
  unint64_t result = qword_10007CCF0;
  if (!qword_10007CCF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007CCF0);
  }
  return result;
}

uint64_t sub_100037C94(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_100037CDC(uint64_t a1)
{
  return a1;
}

unint64_t sub_100037D14()
{
  unint64_t result = qword_10007CCF8;
  if (!qword_10007CCF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007CCF8);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for EventCollectorConfig.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for EventCollectorConfig.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x100037EC4);
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

ValueMetadata *type metadata accessor for EventCollectorConfig.CodingKeys()
{
  return &type metadata for EventCollectorConfig.CodingKeys;
}

unint64_t sub_100037F00()
{
  unint64_t result = qword_10007CD08;
  if (!qword_10007CD08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007CD08);
  }
  return result;
}

unint64_t sub_100037F58()
{
  unint64_t result = qword_10007CD10;
  if (!qword_10007CD10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007CD10);
  }
  return result;
}

unint64_t sub_100037FB0()
{
  unint64_t result = qword_10007CD18;
  if (!qword_10007CD18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007CD18);
  }
  return result;
}

void *sub_100038004(void *a1, uint64_t a2)
{
  if ((a2 & 0xC000000000000001) == 0)
  {
    if (*(void *)(a2 + 16))
    {
      unint64_t v6 = sub_100036FD0((uint64_t)a1);
      if (v7)
      {
        uint64_t v5 = *(void **)(*(void *)(a2 + 56) + 8 * v6);
        id v8 = v5;
        return v5;
      }
    }
    return 0;
  }
  id v3 = a1;
  uint64_t v4 = __CocoaDictionary.lookup(_:)();

  if (!v4) {
    return 0;
  }
  type metadata accessor for CFNumber(0);
  swift_unknownObjectRetain();
  swift_dynamicCast();
  uint64_t v5 = v10;
  swift_unknownObjectRelease();
  return v5;
}

uint64_t sub_1000380CC()
{
  uint64_t v1 = type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v4 = (char *)v8 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for OS_dispatch_queue.Attributes();
  __chkstk_darwin(v5);
  uint64_t v6 = type metadata accessor for DispatchQoS();
  __chkstk_darwin(v6 - 8);
  swift_defaultActor_initialize();
  *(void *)(v0 + 120) = 0;
  *(_WORD *)(v0 + 128) = 514;
  *(void *)(v0 + 136) = 0;
  *(unsigned char *)(v0 + 144) = 1;
  *(void *)(v0 + 152) = 0;
  *(void *)(v0 + 160) = 0;
  *(unsigned char *)(v0 + 168) = 1;
  sub_10000B038();
  static DispatchQoS.unspecified.getter();
  v8[1] = &_swiftEmptyArrayStorage;
  sub_1000391D8(&qword_10007C640, (void (*)(uint64_t))&type metadata accessor for OS_dispatch_queue.Attributes);
  sub_1000082E0(&qword_10007C648);
  sub_1000390EC();
  dispatch thunk of SetAlgebra.init<A>(_:)();
  (*(void (**)(char *, void, uint64_t))(v2 + 104))(v4, enum case for OS_dispatch_queue.AutoreleaseFrequency.inherit(_:), v1);
  *(void *)(v0 + 112) = OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
  return v0;
}

uint64_t sub_100038328()
{
  uint64_t v1 = v0;
  uint64_t v2 = *(void **)(v0 + 112);
  uint64_t v15 = _NSConcreteStackBlock;
  uint64_t v16 = 1107296256;
  uint64_t v17 = sub_100038CA4;
  uint64_t v18 = &unk_100074568;
  uint64_t v3 = _Block_copy(&v15);
  id v4 = v2;
  swift_retain();
  swift_release();
  uint64_t v5 = AKSEventsRegister();
  _Block_release(v3);

  *(void *)(v1 + 120) = v5;
  if (v5) {
    goto LABEL_6;
  }
  if (qword_10007A5C0 != -1) {
    goto LABEL_8;
  }
  while (1)
  {
    uint64_t v6 = type metadata accessor for Logger();
    sub_10000AF48(v6, (uint64_t)qword_10007DAE0);
    char v7 = Logger.logObject.getter();
    os_log_type_t v8 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v7, v8))
    {
      uint64_t v9 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, v8, "Failed to register for AKS events", v9, 2u);
      swift_slowDealloc();
    }

LABEL_6:
    uint64_t v10 = *(void **)(v1 + 112);
    uint64_t v11 = swift_allocObject();
    *(void *)(v11 + 16) = sub_100039168;
    *(void *)(v11 + 24) = v1;
    int v19 = sub_100039180;
    uint64_t v20 = v11;
    uint64_t v15 = _NSConcreteStackBlock;
    uint64_t v16 = 1107296256;
    uint64_t v17 = sub_100038FF8;
    uint64_t v18 = &unk_1000745B8;
    uint64_t v12 = _Block_copy(&v15);
    swift_retain();
    uint64_t v13 = v10;
    swift_retain();
    swift_release();
    dispatch_sync(v13, v12);

    _Block_release(v12);
    LOBYTE(v12) = swift_isEscapingClosureAtFileLocation();
    swift_release();
    uint64_t result = swift_release();
    if ((v12 & 1) == 0) {
      break;
    }
    __break(1u);
LABEL_8:
    swift_once();
  }
  return result;
}

void sub_1000385C8(int a1, void *a2, uint64_t a3)
{
  if (a1 == 1)
  {
    if (a2)
    {
      type metadata accessor for CFString(0);
      type metadata accessor for CFNumber(0);
      sub_1000391D8(&qword_10007A790, type metadata accessor for CFString);
      id v4 = a2;
      static Dictionary._conditionallyBridgeFromObjectiveC(_:result:)();
    }
  }
  else if (!a1)
  {
    *(_WORD *)(a3 + 128) = 1;
    *(void *)(a3 + 136) = 0;
    *(unsigned char *)(a3 + 144) = 1;
  }
}

void sub_100038CA4(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  swift_retain();
  id v6 = a3;
  v5(a2, a3);
  swift_release();
}

void sub_100038D1C(uint64_t a1)
{
  if (aks_get_lock_state())
  {
    if (qword_10007A5C0 != -1) {
      swift_once();
    }
    uint64_t v2 = type metadata accessor for Logger();
    sub_10000AF48(v2, (uint64_t)qword_10007DAE0);
    uint64_t v3 = Logger.logObject.getter();
    os_log_type_t v4 = static os_log_type_t.error.getter();
    if (!os_log_type_enabled(v3, v4)) {
      goto LABEL_14;
    }
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v5 = 0;
    id v6 = "Failed to get initial lock state";
    goto LABEL_13;
  }
  if (qword_10007A5C0 != -1) {
    swift_once();
  }
  uint64_t v7 = type metadata accessor for Logger();
  sub_10000AF48(v7, (uint64_t)qword_10007DAE0);
  os_log_type_t v8 = Logger.logObject.getter();
  os_log_type_t v9 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v10 = swift_slowAlloc();
    *(_DWORD *)uint64_t v10 = 67109376;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *(_WORD *)(v10 + 8) = 1024;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "Initial lock state: %{BOOL}d, beenUnlocked=%{BOOL}d", (uint8_t *)v10, 0xEu);
    swift_slowDealloc();
  }

  if (aks_get_internal_state())
  {
    uint64_t v3 = Logger.logObject.getter();
    os_log_type_t v4 = static os_log_type_t.error.getter();
    if (!os_log_type_enabled(v3, v4))
    {
LABEL_14:

      return;
    }
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v5 = 0;
    id v6 = "Failed to get initial internal lock state";
LABEL_13:
    _os_log_impl((void *)&_mh_execute_header, v3, v4, v6, v5, 2u);
    swift_slowDealloc();
    goto LABEL_14;
  }
  *(unsigned char *)(a1 + 128) = 0;
  *(unsigned char *)(a1 + 129) = 0;
  *(void *)(a1 + 136) = 0;
  *(unsigned char *)(a1 + 144) = 1;
  *(void *)(a1 + 152) = 0;
  *(void *)(a1 + 160) = 0;
  *(unsigned char *)(a1 + 168) = 0;
}

uint64_t sub_100038FF8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))();
}

uint64_t sub_100039020()
{
  swift_defaultActor_destroy();

  return _swift_defaultActor_deallocate(v0);
}

uint64_t type metadata accessor for LockStateObserver()
{
  return self;
}

__n128 initializeBufferWithCopyOfBuffer for SplunkLoggerConfig(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for RawLockState(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for RawLockState(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)__n128 result = (a2 - 1);
    *(void *)(result + 8) = 0;
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
  *(unsigned char *)(result + 16) = v3;
  return result;
}

ValueMetadata *type metadata accessor for RawLockState()
{
  return &type metadata for RawLockState;
}

uint64_t sub_1000390E0()
{
  return v0;
}

unint64_t sub_1000390EC()
{
  unint64_t result = qword_10007C650;
  if (!qword_10007C650)
  {
    sub_10000B1E0(&qword_10007C648);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007C650);
  }
  return result;
}

void sub_100039148(int a1, void *a2)
{
  sub_1000385C8(a1, a2, v2);
}

uint64_t sub_100039150(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100039160()
{
  return swift_release();
}

void sub_100039168()
{
  sub_100038D1C(v0);
}

uint64_t sub_100039170()
{
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100039180()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_1000391A8@<X0>(uint64_t (*a1)(void)@<X0>, _DWORD *a2@<X8>)
{
  uint64_t result = a1();
  *a2 = result;
  return result;
}

uint64_t sub_1000391D8(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t type metadata accessor for MessageEncoder()
{
  return self;
}

uint64_t sub_10003924C(void *a1)
{
  uint64_t v3 = sub_1000082E0(&qword_10007D0B0);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  id v6 = (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000B090(a1, a1[3]);
  sub_10003B2E8();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  char v10 = 0;
  KeyedEncodingContainer.encode(_:forKey:)();
  if (!v1)
  {
    char v9 = 1;
    KeyedEncodingContainer.encode(_:forKey:)();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

BOOL sub_1000393B4(char a1, char a2)
{
  return a1 == a2;
}

void sub_1000393C4(uint64_t a1, unsigned __int8 a2)
{
}

uint64_t sub_1000393EC(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 1701669236 && a2 == 0xE400000000000000;
  if (v2 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x7974656372756F73 && a2 == 0xEA00000000006570 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x7865646E69 && a2 == 0xE500000000000000 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x746E657665 && a2 == 0xE500000000000000)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else
  {
    char v6 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if (v6) {
      return 3;
    }
    else {
      return 4;
    }
  }
}

Swift::Int sub_100039594(unsigned __int8 a1)
{
  return Hasher._finalize()();
}

uint64_t sub_1000395DC(char a1)
{
  uint64_t result = 1701669236;
  switch(a1)
  {
    case 1:
      uint64_t result = 0x7974656372756F73;
      break;
    case 2:
      uint64_t result = 0x7865646E69;
      break;
    case 3:
      uint64_t result = 0x746E657665;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_100039664(void *a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 16);
  v11[0] = *(void *)(a2 + 32);
  v11[1] = v4;
  type metadata accessor for SplunkMessage.CodingKeys();
  swift_getWitnessTable();
  uint64_t v5 = type metadata accessor for KeyedEncodingContainer();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)v11 - v7;
  sub_10000B090(a1, a1[3]);
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  char v15 = 0;
  uint64_t v9 = v11[3];
  KeyedEncodingContainer.encode(_:forKey:)();
  if (!v9)
  {
    char v14 = 1;
    KeyedEncodingContainer.encode(_:forKey:)();
    char v13 = 2;
    KeyedEncodingContainer.encode(_:forKey:)();
    char v12 = 3;
    KeyedEncodingContainer.encode<A>(_:forKey:)();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t sub_100039860@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v25 = a4;
  uint64_t v24 = *(void *)(a2 - 8);
  __chkstk_darwin(a1);
  __int16 v27 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for SplunkMessage.CodingKeys();
  swift_getWitnessTable();
  uint64_t v30 = type metadata accessor for KeyedDecodingContainer();
  uint64_t v26 = *(void *)(v30 - 8);
  __chkstk_darwin(v30);
  uint64_t v9 = (char *)&v22 - v8;
  uint64_t v28 = a3;
  uint64_t v10 = type metadata accessor for SplunkMessage();
  uint64_t v23 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  char v12 = (uint64_t *)((char *)&v22 - v11);
  sub_10000B090(a1, a1[3]);
  char v29 = v9;
  uint64_t v13 = (uint64_t)v31;
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v13) {
    return sub_100008540((uint64_t)a1);
  }
  char v14 = v12;
  uint64_t v16 = v26;
  char v15 = v27;
  char v35 = 0;
  *char v14 = KeyedDecodingContainer.decode(_:forKey:)();
  char v34 = 1;
  v14[1] = KeyedDecodingContainer.decode(_:forKey:)();
  v14[2] = v17;
  char v33 = 2;
  uint64_t v18 = KeyedDecodingContainer.decode(_:forKey:)();
  uint64_t v31 = a1;
  v14[3] = v18;
  v14[4] = v19;
  char v32 = 3;
  KeyedDecodingContainer.decode<A>(_:forKey:)();
  (*(void (**)(char *, uint64_t))(v16 + 8))(v29, v30);
  (*(void (**)(char *, char *, uint64_t))(v24 + 32))((char *)v14 + *(int *)(v10 + 52), v15, a2);
  uint64_t v20 = v23;
  (*(void (**)(uint64_t, uint64_t *, uint64_t))(v23 + 16))(v25, v14, v10);
  sub_100008540((uint64_t)v31);
  return (*(uint64_t (**)(uint64_t *, uint64_t))(v20 + 8))(v14, v10);
}

unint64_t sub_100039C40()
{
  if (*v0) {
    return 0xD000000000000011;
  }
  else {
    return 0xD000000000000010;
  }
}

uint64_t sub_100039C80@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_10003B058(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_100039CA8(uint64_t a1)
{
  unint64_t v2 = sub_10003B2E8();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100039CE4(uint64_t a1)
{
  unint64_t v2 = sub_10003B2E8();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_100039D20@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = sub_10003B144(a1);
  if (!v2)
  {
    *(unsigned char *)a2 = result & 1;
    *(void *)(a2 + 8) = v5;
  }
  return result;
}

uint64_t sub_100039D54(void *a1)
{
  return sub_10003924C(a1);
}

BOOL sub_100039D74(char *a1, char *a2)
{
  return sub_1000393B4(*a1, *a2);
}

Swift::Int sub_100039D8C()
{
  return sub_100039594(*v0);
}

void sub_100039D9C(uint64_t a1)
{
  sub_1000393C4(a1, *v1);
}

Swift::Int sub_100039DAC()
{
  Hasher.init(_seed:)();
  sub_1000393C4((uint64_t)v2, *v0);
  return Hasher._finalize()();
}

uint64_t sub_100039DF8()
{
  return sub_1000395DC(*v0);
}

uint64_t sub_100039E08@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1000393EC(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_100039E3C@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_10003C144();
  *a1 = result;
  return result;
}

uint64_t sub_100039E70(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();

  return CodingKey.description.getter(a1, WitnessTable);
}

uint64_t sub_100039EC4(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();

  return CodingKey.debugDescription.getter(a1, WitnessTable);
}

uint64_t sub_100039F18@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return sub_100039860(a1, *(void *)(a2 + 16), *(void *)(a2 + 24), a3);
}

uint64_t sub_100039F3C(void *a1, uint64_t a2)
{
  return sub_100039664(a1, a2);
}

uint64_t sub_100039F54()
{
  v1[11] = v0;
  uint64_t v2 = type metadata accessor for URL();
  v1[12] = v2;
  v1[13] = *(void *)(v2 - 8);
  v1[14] = swift_task_alloc();
  uint64_t v3 = type metadata accessor for URLRequest();
  v1[15] = v3;
  v1[16] = *(void *)(v3 - 8);
  v1[17] = swift_task_alloc();
  return _swift_task_switch(sub_10003A070, 0, 0);
}

uint64_t sub_10003A070()
{
  uint64_t v1 = *(void *)(v0 + 88);
  swift_beginAccess();
  uint64_t v3 = *(void *)(v1 + 40);
  unint64_t v2 = *(void *)(v1 + 48);
  switch(v2 >> 62)
  {
    case 1uLL:
      if ((int)v3 != v3 >> 32) {
        goto LABEL_3;
      }
      goto LABEL_10;
    case 2uLL:
      if (*(void *)(v3 + 16) == *(void *)(v3 + 24)) {
        goto LABEL_10;
      }
      goto LABEL_3;
    case 3uLL:
      goto LABEL_10;
    default:
      if ((v2 & 0xFF000000000000) != 0)
      {
LABEL_3:
        int v4 = *(unsigned __int8 *)(*(void *)(v0 + 88) + 16);
        *(unsigned char *)(v0 + 176) = v4;
        if (v4 == 1)
        {
          if (qword_10007A5D0 != -1) {
            swift_once();
          }
          uint64_t v5 = qword_10007CF58;
        }
        else
        {
          if (qword_10007A5D8 != -1) {
            swift_once();
          }
          uint64_t v5 = qword_10007CF70;
        }
        uint64_t v9 = *(void *)(v0 + 104);
        uint64_t v8 = *(void *)(v0 + 112);
        uint64_t v10 = *(void *)(v0 + 96);
        uint64_t v11 = sub_10000AF48(v10, (uint64_t)v5);
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 16))(v8, v11, v10);
        URLRequest.init(url:cachePolicy:timeoutInterval:)();
        URLRequest.httpMethod.setter();
        sub_10003B33C(*(void *)(v1 + 40), *(void *)(v1 + 48));
        URLRequest.httpBody.setter();
        if (v4)
        {
          if (qword_10007A5E0 != -1) {
            swift_once();
          }
          char v12 = &qword_10007CF88;
        }
        else
        {
          if (qword_10007A5E8 != -1) {
            swift_once();
          }
          char v12 = &qword_10007CF98;
        }
        uint64_t v14 = *v12;
        uint64_t v13 = (void *)v12[1];
        swift_bridgeObjectRetain();
        v15._countAndFlagsBits = v14;
        v15._object = v13;
        String.append(_:)(v15);
        swift_bridgeObjectRelease();
        v16.value._countAndFlagsBits = 0x206B6E756C7053;
        v16.value._object = (void *)0xE700000000000000;
        v17._countAndFlagsBits = 0x7A69726F68747541;
        v17._object = (void *)0xED00006E6F697461;
        URLRequest.setValue(_:forHTTPHeaderField:)(v16, v17);
        swift_bridgeObjectRelease();
        *(void *)(v0 + 144) = [self sharedSession];
        uint64_t v18 = (void *)swift_task_alloc();
        *(void *)(v0 + 152) = v18;
        *uint64_t v18 = v0;
        v18[1] = sub_10003A404;
        uint64_t v19 = *(void *)(v0 + 136);
        return NSURLSession.data(for:delegate:)(v19, 0);
      }
      else
      {
LABEL_10:
        swift_task_dealloc();
        swift_task_dealloc();
        uint64_t v6 = *(uint64_t (**)(uint64_t))(v0 + 8);
        return v6(1);
      }
  }
}

uint64_t sub_10003A404(uint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t v7 = *v4;
  *(void *)(v7 + 160) = a3;
  *(void *)(v7 + 168) = v3;
  swift_task_dealloc();
  if (v3)
  {
    uint64_t v8 = sub_10003A9CC;
  }
  else
  {

    sub_100024478(a1, a2);
    uint64_t v8 = sub_10003A53C;
  }
  return _swift_task_switch(v8, 0, 0);
}

uint64_t sub_10003A53C()
{
  uint64_t v32 = v0;
  self;
  uint64_t v1 = swift_dynamicCastObjCClass();
  if (v1)
  {
    unint64_t v2 = (void *)v1;
    id v3 = *(id *)(v0 + 160);
    if ([v2 statusCode] != (id)200)
    {
      if (qword_10007A5C0 != -1) {
        swift_once();
      }
      uint64_t v13 = *(void **)(v0 + 160);
      uint64_t v14 = type metadata accessor for Logger();
      sub_10000AF48(v14, (uint64_t)qword_10007DAE0);
      id v15 = v13;
      Swift::String_optional v16 = Logger.logObject.getter();
      os_log_type_t v17 = static os_log_type_t.error.getter();
      BOOL v18 = os_log_type_enabled(v16, v17);
      uint64_t v19 = *(void **)(v0 + 160);
      if (v18)
      {
        uint64_t v20 = (uint8_t *)swift_slowAlloc();
        *(_DWORD *)uint64_t v20 = 134217984;
        *(void *)(v0 + 80) = [v2 statusCode];
        UnsafeMutableRawBufferPointer.copyMemory(from:)();

        _os_log_impl((void *)&_mh_execute_header, v16, v17, "failed to post telemetry: %ld", v20, 0xCu);
        swift_slowDealloc();
      }
      else
      {
      }
      uint64_t v12 = 0;
      goto LABEL_20;
    }
  }
  if (qword_10007A5C0 != -1) {
    goto LABEL_28;
  }
  while (1)
  {
    uint64_t v4 = type metadata accessor for Logger();
    sub_10000AF48(v4, (uint64_t)qword_10007DAE0);
    swift_retain_n();
    uint64_t v5 = Logger.logObject.getter();
    os_log_type_t v6 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v5, v6))
    {
      int v7 = *(unsigned __int8 *)(v0 + 176);
      uint64_t v30 = *(void **)(v0 + 160);
      uint64_t v8 = (uint8_t *)swift_slowAlloc();
      uint64_t v9 = swift_slowAlloc();
      *(_DWORD *)uint64_t v8 = 136315138;
      uint64_t v31 = v9;
      if (v7) {
        uint64_t v10 = 0x69746375646F7270;
      }
      else {
        uint64_t v10 = 24945;
      }
      if (v7) {
        unint64_t v11 = 0xEA00000000006E6FLL;
      }
      else {
        unint64_t v11 = 0xE200000000000000;
      }
      *(void *)(v0 + 72) = sub_10001EE9C(v10, v11, &v31);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      swift_release_n();
      _os_log_impl((void *)&_mh_execute_header, v5, v6, "successfully posted telemetry to %s server", v8, 0xCu);
      uint64_t v12 = 1;
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_release_n();
      uint64_t v12 = 1;
    }
LABEL_20:
    uint64_t v21 = *(void *)(v0 + 88);
    swift_beginAccess();
    uint64_t v22 = *(void *)(v21 + 40);
    switch(*(void *)(v21 + 48) >> 62)
    {
      case 1:
        uint64_t v28 = (int)v22;
        uint64_t v29 = v22 >> 32;
        goto LABEL_26;
      case 2:
        uint64_t v28 = *(void *)(v22 + 16);
        uint64_t v29 = *(void *)(v22 + 24);
LABEL_26:
        if (v29 >= v28) {
          goto LABEL_21;
        }
        __break(1u);
        break;
      default:
LABEL_21:
        uint64_t v24 = *(void *)(v0 + 128);
        uint64_t v23 = *(void *)(v0 + 136);
        uint64_t v25 = *(void *)(v0 + 120);
        Data._Representation.replaceSubrange(_:with:count:)();
        swift_endAccess();
        (*(void (**)(uint64_t, uint64_t))(v24 + 8))(v23, v25);
        swift_task_dealloc();
        swift_task_dealloc();
        uint64_t v26 = *(uint64_t (**)(uint64_t))(v0 + 8);
        return v26(v12);
    }
LABEL_28:
    swift_once();
  }
}

uint64_t sub_10003A9CC()
{
  uint64_t v1 = v0 + 40;

  if (qword_10007A5C0 != -1) {
    goto LABEL_13;
  }
  while (1)
  {
    uint64_t v2 = type metadata accessor for Logger();
    sub_10000AF48(v2, (uint64_t)qword_10007DAE0);
    swift_errorRetain();
    swift_errorRetain();
    id v3 = Logger.logObject.getter();
    os_log_type_t v4 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v3, v4))
    {
      uint64_t v5 = (uint8_t *)swift_slowAlloc();
      uint64_t v17 = v1;
      os_log_type_t v6 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v5 = 138412290;
      swift_errorRetain();
      uint64_t v7 = _swift_stdlib_bridgeErrorToNSError();
      *(void *)(v0 + 64) = v7;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *os_log_type_t v6 = v7;
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v3, v4, "failed to post telemetry: %@", v5, 0xCu);
      sub_1000082E0(&qword_10007BFB8);
      swift_arrayDestroy();
      uint64_t v1 = v17;
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
    uint64_t v8 = *(void *)(v0 + 88);
    swift_beginAccess();
    uint64_t v9 = *(void *)(v8 + 40);
    switch(*(void *)(v8 + 48) >> 62)
    {
      case 1:
        uint64_t v15 = (int)v9;
        uint64_t v16 = v9 >> 32;
        goto LABEL_11;
      case 2:
        uint64_t v15 = *(void *)(v9 + 16);
        uint64_t v16 = *(void *)(v9 + 24);
LABEL_11:
        if (v16 >= v15) {
          goto LABEL_6;
        }
        __break(1u);
        break;
      default:
LABEL_6:
        uint64_t v10 = *(void *)(v0 + 128);
        uint64_t v11 = *(void *)(v0 + 136);
        uint64_t v12 = *(void *)(v0 + 120);
        Data._Representation.replaceSubrange(_:with:count:)();
        swift_endAccess();
        (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v11, v12);
        swift_task_dealloc();
        swift_task_dealloc();
        uint64_t v13 = *(uint64_t (**)(void))(v0 + 8);
        return v13(0);
    }
LABEL_13:
    swift_once();
  }
}

uint64_t sub_10003ACB4(uint64_t a1)
{
  return sub_10003ACFC(a1, qword_10007CF58);
}

uint64_t sub_10003ACD8(uint64_t a1)
{
  return sub_10003ACFC(a1, qword_10007CF70);
}

uint64_t sub_10003ACFC(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_1000082E0(qword_10007D0B8);
  __chkstk_darwin(v3 - 8);
  uint64_t v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for URL();
  sub_10000AFD4(v6, a2);
  uint64_t v7 = sub_10000AF48(v6, (uint64_t)a2);
  URL.init(string:)();
  uint64_t v8 = *(void *)(v6 - 8);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v8 + 48))(v5, 1, v6);
  if (result != 1) {
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v8 + 32))(v7, v5, v6);
  }
  __break(1u);
  return result;
}

uint64_t sub_10003AE28(uint64_t a1)
{
  return sub_10003AE68(a1, 0x800000010005DAE0, &qword_10007CF88, &qword_10007CF90);
}

uint64_t sub_10003AE48(uint64_t a1)
{
  return sub_10003AE68(a1, 0x800000010005DB20, &qword_10007CF98, &qword_10007CFA0);
}

uint64_t sub_10003AE68(uint64_t a1, uint64_t a2, uint64_t *a3, void *a4)
{
  uint64_t v6 = type metadata accessor for String.Encoding();
  __chkstk_darwin(v6 - 8);
  uint64_t result = Data.init(base64Encoded:options:)();
  if (v8 >> 60 == 15)
  {
    __break(1u);
  }
  else
  {
    uint64_t v9 = result;
    unint64_t v10 = v8;
    static String.Encoding.utf8.getter();
    uint64_t v11 = String.init(data:encoding:)();
    uint64_t v13 = v12;
    uint64_t result = sub_100024464(v9, v10);
    if (v13)
    {
      *a3 = v11;
      *a4 = v13;
      return result;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_10003AF50()
{
  swift_release();
  sub_100024478(*(void *)(v0 + 40), *(void *)(v0 + 48));

  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for SplunkLogger()
{
  return self;
}

uint64_t getEnumTagSinglePayload for SplunkLoggerConfig(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFF && a1[16]) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *a1;
  BOOL v4 = v3 >= 2;
  int v5 = (v3 + 2147483646) & 0x7FFFFFFF;
  if (!v4) {
    int v5 = -1;
  }
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for SplunkLoggerConfig(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(void *)uint64_t result = a2 - 255;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 16) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 16) = 0;
    }
    if (a2) {
      *(unsigned char *)uint64_t result = a2 + 1;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SplunkLoggerConfig()
{
  return &type metadata for SplunkLoggerConfig;
}

uint64_t sub_10003B058(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000010 && a2 == 0x800000010005DBA0
    || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x800000010005DBC0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v5 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if (v5) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_10003B144(void *a1)
{
  uint64_t v3 = sub_1000082E0(&qword_10007D0A0);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = &v9[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v7 = a1[3];
  sub_10000B090(a1, v7);
  sub_10003B2E8();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (!v1)
  {
    v9[15] = 0;
    LOBYTE(v7) = KeyedDecodingContainer.decode(_:forKey:)();
    v9[14] = 1;
    KeyedDecodingContainer.decode(_:forKey:)();
    (*(void (**)(unsigned char *, uint64_t))(v4 + 8))(v6, v3);
  }
  sub_100008540((uint64_t)a1);
  return v7 & 1;
}

unint64_t sub_10003B2E8()
{
  unint64_t result = qword_10007D0A8;
  if (!qword_10007D0A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007D0A8);
  }
  return result;
}

uint64_t sub_10003B33C(uint64_t a1, unint64_t a2)
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

uint64_t sub_10003B394(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_allocateGenericValueMetadata(a1, a2, a3, 40);
}

uint64_t sub_10003B39C()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_10003B448(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v3 = a1;
  uint64_t v4 = *(void *)(a3 + 16);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(_DWORD *)(v5 + 80);
  if (v6 > 7
    || (*(_DWORD *)(v5 + 80) & 0x100000) != 0
    || ((v6 + 40) & (unint64_t)~v6) + *(void *)(v5 + 64) > 0x18)
  {
    uint64_t v9 = *a2;
    *uint64_t v3 = *a2;
    uint64_t v3 = (uint64_t *)(v9 + ((v6 & 0xF8 ^ 0x1F8) & (v6 + 16)));
    swift_retain();
  }
  else
  {
    uint64_t v11 = *a2;
    unint64_t v10 = (unint64_t)a2 + 15;
    *a1 = v11;
    uint64_t v12 = (void *)(((unint64_t)a1 + 15) & 0xFFFFFFFFFFFFFFF8);
    *uint64_t v12 = *(void *)(v10 & 0xFFFFFFFFFFFFFFF8);
    v12[1] = *(void *)((v10 & 0xFFFFFFFFFFFFFFF8) + 8);
    uint64_t v13 = (void *)(((unint64_t)v12 + 23) & 0xFFFFFFFFFFFFFFF8);
    uint64_t v14 = (void *)(((v10 & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8);
    *uint64_t v13 = *v14;
    v13[1] = v14[1];
    uint64_t v15 = ((unint64_t)v13 + v6 + 16) & ~v6;
    uint64_t v16 = ((unint64_t)v14 + v6 + 16) & ~v6;
    uint64_t v17 = *(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v17(v15, v16, v4);
  }
  return v3;
}

uint64_t sub_10003B5A0(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = (a1 + 15) & 0xFFFFFFFFFFFFFFF8;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(*(void *)(a2 + 16) - 8);
  uint64_t v5 = *(uint64_t (**)(unint64_t))(v4 + 8);
  unint64_t v6 = (((v3 + 23) & 0xFFFFFFFFFFFFFFF8) + *(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);

  return v5(v6);
}

void *sub_10003B628(void *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5 = *a2;
  unint64_t v4 = (unint64_t)a2 + 15;
  *a1 = v5;
  unint64_t v6 = (void *)(((unint64_t)a1 + 15) & 0xFFFFFFFFFFFFFFF8);
  *unint64_t v6 = *(void *)(v4 & 0xFFFFFFFFFFFFFFF8);
  v6[1] = *(void *)((v4 & 0xFFFFFFFFFFFFFFF8) + 8);
  uint64_t v7 = (void *)(((unint64_t)v6 + 23) & 0xFFFFFFFFFFFFFFF8);
  unint64_t v8 = (void *)(((v4 & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8);
  *uint64_t v7 = *v8;
  v7[1] = v8[1];
  uint64_t v9 = *(void *)(a3 + 16);
  unint64_t v10 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 16);
  uint64_t v11 = *(unsigned __int8 *)(*(void *)(v9 - 8) + 80);
  uint64_t v12 = ((unint64_t)v7 + v11 + 16) & ~v11;
  uint64_t v13 = ((unint64_t)v8 + v11 + 16) & ~v11;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v10(v12, v13, v9);
  return a1;
}

void *sub_10003B704(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v5 = (void *)(((unint64_t)a1 + 15) & 0xFFFFFFFFFFFFFFF8);
  unint64_t v6 = (void *)(((unint64_t)a2 + 15) & 0xFFFFFFFFFFFFFFF8);
  void *v5 = *v6;
  v5[1] = v6[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v7 = (void *)(((unint64_t)v5 + 23) & 0xFFFFFFFFFFFFFFF8);
  unint64_t v8 = (void *)(((unint64_t)v6 + 23) & 0xFFFFFFFFFFFFFFF8);
  *uint64_t v7 = *v8;
  v7[1] = v8[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v9 = *(void *)(*(void *)(a3 + 16) - 8);
  (*(void (**)(unint64_t, unint64_t))(v9 + 24))(((unint64_t)v7 + *(unsigned __int8 *)(v9 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80), ((unint64_t)v8 + *(unsigned __int8 *)(v9 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80));
  return a1;
}

void *sub_10003B7E4(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  unint64_t v4 = (_OWORD *)(((unint64_t)a1 + 15) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v5 = (_OWORD *)(((unint64_t)a2 + 15) & 0xFFFFFFFFFFFFFFF8);
  *unint64_t v4 = *v5;
  unint64_t v6 = (_OWORD *)(((unint64_t)v4 + 23) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v7 = (_OWORD *)(((unint64_t)v5 + 23) & 0xFFFFFFFFFFFFFFF8);
  *unint64_t v6 = *v7;
  uint64_t v8 = *(void *)(*(void *)(a3 + 16) - 8);
  (*(void (**)(unint64_t, unint64_t))(v8 + 32))(((unint64_t)v6 + *(unsigned __int8 *)(v8 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80), ((unint64_t)v7 + *(unsigned __int8 *)(v8 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80));
  return a1;
}

void *sub_10003B878(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v5 = (void *)(((unint64_t)a1 + 15) & 0xFFFFFFFFFFFFFFF8);
  unint64_t v6 = (void *)(((unint64_t)a2 + 15) & 0xFFFFFFFFFFFFFFF8);
  void *v5 = *v6;
  v5[1] = v6[1];
  swift_bridgeObjectRelease();
  uint64_t v7 = (void *)(((unint64_t)v5 + 23) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v8 = (void *)(((unint64_t)v6 + 23) & 0xFFFFFFFFFFFFFFF8);
  *uint64_t v7 = *v8;
  v7[1] = v8[1];
  swift_bridgeObjectRelease();
  uint64_t v9 = *(void *)(*(void *)(a3 + 16) - 8);
  (*(void (**)(unint64_t, unint64_t))(v9 + 40))(((unint64_t)v7 + *(unsigned __int8 *)(v9 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80), ((unint64_t)v8 + *(unsigned __int8 *)(v9 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80));
  return a1;
}

uint64_t sub_10003B940(unsigned __int16 *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  unsigned int v5 = *(_DWORD *)(v4 + 84);
  uint64_t v6 = *(unsigned __int8 *)(v4 + 80);
  if (v5 <= 0x7FFFFFFF) {
    unsigned int v7 = 0x7FFFFFFF;
  }
  else {
    unsigned int v7 = *(_DWORD *)(v4 + 84);
  }
  if (!a2) {
    return 0;
  }
  int v8 = a2 - v7;
  if (a2 <= v7) {
    goto LABEL_23;
  }
  uint64_t v9 = ((v6 + 40) & ~v6) + *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64);
  char v10 = 8 * v9;
  if (v9 <= 3)
  {
    unsigned int v13 = ((v8 + ~(-1 << v10)) >> v10) + 1;
    if (HIWORD(v13))
    {
      int v11 = *(_DWORD *)((char *)a1 + v9);
      if (!v11) {
        goto LABEL_23;
      }
      goto LABEL_15;
    }
    if (v13 > 0xFF)
    {
      int v11 = *(unsigned __int16 *)((char *)a1 + v9);
      if (!*(unsigned __int16 *)((char *)a1 + v9)) {
        goto LABEL_23;
      }
      goto LABEL_15;
    }
    if (v13 < 2)
    {
LABEL_23:
      unint64_t v15 = ((unint64_t)a1 + 15) & 0xFFFFFFFFFFFFFFF8;
      if ((v5 & 0x80000000) != 0) {
        return (*(uint64_t (**)(unint64_t))(v4 + 48))((((v15 + 23) & 0xFFFFFFFFFFFFFFF8) + v6 + 16) & ~v6);
      }
      unint64_t v16 = *(void *)(v15 + 8);
      if (v16 >= 0xFFFFFFFF) {
        LODWORD(v16) = -1;
      }
      return (v16 + 1);
    }
  }
  int v11 = *((unsigned __int8 *)a1 + v9);
  if (!*((unsigned char *)a1 + v9)) {
    goto LABEL_23;
  }
LABEL_15:
  int v14 = (v11 - 1) << v10;
  if (v9 > 3) {
    int v14 = 0;
  }
  if (v9)
  {
    if (v9 > 3) {
      LODWORD(v9) = 4;
    }
    switch((int)v9)
    {
      case 2:
        LODWORD(v9) = *a1;
        break;
      case 3:
        LODWORD(v9) = *a1 | (*((unsigned __int8 *)a1 + 2) << 16);
        break;
      case 4:
        LODWORD(v9) = *(_DWORD *)a1;
        break;
      default:
        LODWORD(v9) = *(unsigned __int8 *)a1;
        break;
    }
  }
  return v7 + (v9 | v14) + 1;
}

void sub_10003BAF0(char *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(*(void *)(a4 + 16) - 8);
  unsigned int v7 = *(_DWORD *)(v6 + 84);
  if (v7 <= 0x7FFFFFFF) {
    unsigned int v8 = 0x7FFFFFFF;
  }
  else {
    unsigned int v8 = *(_DWORD *)(v6 + 84);
  }
  uint64_t v9 = *(unsigned __int8 *)(v6 + 80);
  size_t v10 = ((v9 + 40) & ~v9) + *(void *)(*(void *)(*(void *)(a4 + 16) - 8) + 64);
  BOOL v11 = a3 >= v8;
  unsigned int v12 = a3 - v8;
  if (v12 != 0 && v11)
  {
    if (v10 <= 3)
    {
      unsigned int v16 = ((v12 + ~(-1 << (8 * v10))) >> (8 * v10)) + 1;
      if (HIWORD(v16))
      {
        int v13 = 4;
      }
      else if (v16 >= 0x100)
      {
        int v13 = 2;
      }
      else
      {
        int v13 = v16 > 1;
      }
    }
    else
    {
      int v13 = 1;
    }
  }
  else
  {
    int v13 = 0;
  }
  if (v8 < a2)
  {
    unsigned int v14 = ~v8 + a2;
    if (v10 < 4)
    {
      int v15 = (v14 >> (8 * v10)) + 1;
      if (v10)
      {
        int v17 = v14 & ~(-1 << (8 * v10));
        bzero(a1, v10);
        if (v10 == 3)
        {
          *(_WORD *)a1 = v17;
          a1[2] = BYTE2(v17);
        }
        else if (v10 == 2)
        {
          *(_WORD *)a1 = v17;
        }
        else
        {
          *a1 = v17;
        }
      }
    }
    else
    {
      bzero(a1, v10);
      *(_DWORD *)a1 = v14;
      int v15 = 1;
    }
    switch(v13)
    {
      case 1:
        a1[v10] = v15;
        return;
      case 2:
        *(_WORD *)&a1[v10] = v15;
        return;
      case 3:
        goto LABEL_41;
      case 4:
        *(_DWORD *)&a1[v10] = v15;
        return;
      default:
        return;
    }
  }
  switch(v13)
  {
    case 1:
      a1[v10] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_24;
    case 2:
      *(_WORD *)&a1[v10] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_24;
    case 3:
LABEL_41:
      __break(1u);
      JUMPOUT(0x10003BD60);
    case 4:
      *(_DWORD *)&a1[v10] = 0;
      goto LABEL_23;
    default:
LABEL_23:
      if (a2)
      {
LABEL_24:
        uint64_t v18 = (void *)((unint64_t)(a1 + 15) & 0xFFFFFFFFFFFFFFF8);
        if ((v7 & 0x80000000) != 0)
        {
          uint64_t v19 = *(void (**)(unint64_t))(v6 + 56);
          v19(((((unint64_t)v18 + 23) & 0xFFFFFFFFFFFFFFF8) + v9 + 16) & ~v9);
        }
        else if ((a2 & 0x80000000) != 0)
        {
          *uint64_t v18 = a2 ^ 0x80000000;
          v18[1] = 0;
        }
        else
        {
          v18[1] = a2 - 1;
        }
      }
      return;
  }
}

uint64_t type metadata accessor for SplunkMessage()
{
  return sub_10003BFC4();
}

unsigned char *storeEnumTagSinglePayload for SplunkLoggerConfig.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x10003BE6CLL);
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

ValueMetadata *type metadata accessor for SplunkLoggerConfig.CodingKeys()
{
  return &type metadata for SplunkLoggerConfig.CodingKeys;
}

unint64_t sub_10003BEA8()
{
  unint64_t result = qword_10007D140;
  if (!qword_10007D140)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007D140);
  }
  return result;
}

unint64_t sub_10003BF00()
{
  unint64_t result = qword_10007D148;
  if (!qword_10007D148)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007D148);
  }
  return result;
}

unint64_t sub_10003BF58()
{
  unint64_t result = qword_10007D150[0];
  if (!qword_10007D150[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_10007D150);
  }
  return result;
}

uint64_t type metadata accessor for SplunkMessage.CodingKeys()
{
  return sub_10003BFC4();
}

uint64_t sub_10003BFC4()
{
  return swift_getGenericMetadata();
}

uint64_t sub_10003BFF4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_allocateGenericValueMetadata(a1, a2, a3, 24);
}

unsigned char *sub_10003BFFC(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x10003C0C8);
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

uint64_t sub_10003C0F0()
{
  return swift_getWitnessTable();
}

uint64_t sub_10003C10C()
{
  return swift_getWitnessTable();
}

uint64_t sub_10003C128()
{
  return swift_getWitnessTable();
}

uint64_t sub_10003C144()
{
  return 4;
}

double sub_10003C14C()
{
  sub_10003C420(v1);
  xmmword_10007DB10 = v1[0];
  *(_OWORD *)&qword_10007DB20 = v1[1];
  double result = *(double *)&v2;
  xmmword_10007DB30 = v2;
  *(_OWORD *)&qword_10007DB40 = v3;
  return result;
}

double sub_10003C188@<D0>(uint64_t a1@<X8>)
{
  NSString v2 = String._bridgeToObjectiveC()();
  uint64_t v3 = MGCopyAnswerWithError();

  if (v3)
  {
    *(void *)(a1 + 24) = swift_getObjectType();
    *(void *)a1 = v3;
  }
  else
  {
    double result = 0.0;
    *(_OWORD *)a1 = 0u;
    *(_OWORD *)(a1 + 16) = 0u;
  }
  return result;
}

uint64_t sub_10003C3F0@<X0>(uint64_t (*a1)(void)@<X0>, _DWORD *a2@<X8>)
{
  uint64_t result = a1();
  *a2 = result;
  return result;
}

uint64_t sub_10003C420@<X0>(void *a1@<X8>)
{
  sub_10003C188((uint64_t)v17);
  if (v18)
  {
    if (swift_dynamicCast())
    {
      uint64_t v3 = v15;
      unint64_t v4 = v16;
      goto LABEL_6;
    }
  }
  else
  {
    sub_10003C654((uint64_t)v17);
  }
  uint64_t v3 = 0;
  unint64_t v4 = 0xE000000000000000;
LABEL_6:
  sub_10003C188((uint64_t)v17);
  if (v18)
  {
    if (swift_dynamicCast())
    {
      uint64_t v6 = v15;
      unint64_t v7 = v16;
      goto LABEL_11;
    }
  }
  else
  {
    sub_10003C654((uint64_t)v17);
  }
  uint64_t v6 = 0;
  unint64_t v7 = 0xE000000000000000;
LABEL_11:
  sub_10003C188((uint64_t)v17);
  if (v18)
  {
    if (swift_dynamicCast())
    {
      uint64_t v9 = v15;
      unint64_t v10 = v16;
      goto LABEL_16;
    }
  }
  else
  {
    sub_10003C654((uint64_t)v17);
  }
  uint64_t v9 = 0;
  unint64_t v10 = 0xE000000000000000;
LABEL_16:
  sub_10003C188((uint64_t)v17);
  if (!v18)
  {
    uint64_t result = sub_10003C654((uint64_t)v17);
    goto LABEL_20;
  }
  uint64_t result = swift_dynamicCast();
  if (!result)
  {
LABEL_20:
    uint64_t v13 = 0;
    unint64_t v14 = 0xE000000000000000;
    goto LABEL_21;
  }
  uint64_t v13 = v15;
  unint64_t v14 = v16;
LABEL_21:
  *a1 = v3;
  a1[1] = v4;
  a1[2] = v6;
  a1[3] = v7;
  a1[4] = v9;
  a1[5] = v10;
  a1[6] = v13;
  a1[7] = v14;
  return result;
}

uint64_t sub_10003C654(uint64_t a1)
{
  uint64_t v2 = sub_1000082E0(&qword_10007D1D8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10003C6B4(uint64_t a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = *(void *)a1;
  uint64_t v6 = *(void *)(a1 + 8);
  uint64_t v7 = *(void *)(a1 + 16);
  uint64_t v45 = *(void *)(a1 + 24);
  uint64_t v46 = v7;
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v43 = *(void *)(a1 + 40);
  uint64_t v44 = v8;
  uint64_t v9 = *(void *)(a1 + 48);
  uint64_t v41 = *(void *)(a1 + 56);
  uint64_t v42 = v9;
  uint64_t v10 = *(void *)(a1 + 64);
  uint64_t v39 = *(void *)(a1 + 72);
  uint64_t v40 = v10;
  uint64_t v11 = *(void *)(a1 + 80);
  uint64_t v37 = *(void *)(a1 + 88);
  uint64_t v38 = v11;
  uint64_t v36 = *(void *)(a1 + 96);
  LODWORD(v11) = *(unsigned __int8 *)(a1 + 104);
  int v34 = *(unsigned __int8 *)(a1 + 105);
  int v35 = v11;
  uint64_t v33 = *(void *)(a1 + 112);
  uint64_t v12 = type metadata accessor for Date();
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  uint64_t v15 = (char *)v27 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(unsigned char *)(v1 + 96) != 1) {
    goto LABEL_8;
  }
  uint64_t v16 = sub_100045108(a1);
  if (!v17) {
    goto LABEL_8;
  }
  os_log_t v2 = v17;
  uint64_t v31 = v16;
  uint64_t v32 = v6;
  if (qword_10007A5C0 != -1) {
    goto LABEL_15;
  }
  while (1)
  {
    uint64_t v18 = type metadata accessor for Logger();
    sub_10000AF48(v18, (uint64_t)qword_10007DAE0);
    swift_bridgeObjectRetain();
    uint64_t v19 = Logger.logObject.getter();
    os_log_type_t v20 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v19, v20))
    {
      uint64_t v21 = swift_slowAlloc();
      os_log_t v28 = v19;
      uint64_t v22 = (uint8_t *)v21;
      uint64_t v29 = swift_slowAlloc();
      *(void *)&v56[0] = v29;
      uint64_t v30 = v5;
      *(_DWORD *)uint64_t v22 = 136315138;
      v27[1] = v22 + 4;
      swift_bridgeObjectRetain();
      *(void *)&long long v47 = sub_10001EE9C(v31, (unint64_t)v2, (uint64_t *)v56);
      uint64_t v5 = v30;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      os_log_t v2 = v28;
      _os_log_impl((void *)&_mh_execute_header, v28, v20, "splunk event: %s", v22, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    uint64_t v6 = v32;
LABEL_8:
    uint64_t v3 = *(void *)(v3 + 136);
    sub_100047768(a1);
    Date.init()();
    Date.timeIntervalSince1970.getter();
    double v24 = v23;
    uint64_t v25 = *(void (**)(char *, uint64_t))(v13 + 8);
    v13 += 8;
    v25(v15, v12);
    if ((~*(void *)&v24 & 0x7FF0000000000000) == 0)
    {
      __break(1u);
LABEL_13:
      __break(1u);
      goto LABEL_14;
    }
    if (v24 <= -1.0) {
      goto LABEL_13;
    }
    if (v24 < 1.84467441e19) {
      break;
    }
LABEL_14:
    __break(1u);
LABEL_15:
    swift_once();
  }
  *(void *)&long long v47 = (unint64_t)v24;
  *((void *)&v47 + 1) = 7633012;
  *(void *)uint64_t v48 = 0xE300000000000000;
  strcpy(&v48[8], "dataprotection");
  v48[23] = -18;
  *(void *)&v48[24] = v5;
  *(void *)&long long v49 = v6;
  *((void *)&v49 + 1) = v46;
  *(void *)&long long v50 = v45;
  *((void *)&v50 + 1) = v44;
  *(void *)&long long v51 = v43;
  *((void *)&v51 + 1) = v42;
  *(void *)&long long v52 = v41;
  *((void *)&v52 + 1) = v40;
  *(void *)&long long v53 = v39;
  *((void *)&v53 + 1) = v38;
  *(void *)&long long v54 = v37;
  *((void *)&v54 + 1) = v36;
  LOBYTE(v55) = v35;
  BYTE1(v55) = v34;
  *((void *)&v55 + 1) = v33;
  v56[4] = v50;
  v56[5] = v51;
  v56[6] = v52;
  v56[7] = v53;
  v56[2] = *(_OWORD *)&v48[16];
  v56[3] = v49;
  v56[0] = v47;
  v56[1] = *(_OWORD *)v48;
  v56[8] = v54;
  v56[9] = v55;
  sub_10003D7F0();
  return sub_1000477E0((uint64_t)&v47);
}

uint64_t sub_10003CAC4(long long *a1)
{
  uint64_t v3 = v1;
  long long v5 = a1[7];
  long long v38 = a1[6];
  long long v39 = v5;
  long long v40 = a1[8];
  long long v6 = a1[3];
  long long v34 = a1[2];
  long long v35 = v6;
  long long v7 = a1[5];
  long long v36 = a1[4];
  long long v37 = v7;
  long long v8 = a1[1];
  long long v32 = *a1;
  long long v33 = v8;
  uint64_t v9 = type metadata accessor for Date();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v23 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(unsigned char *)(v1 + 96) != 1) {
    goto LABEL_7;
  }
  uint64_t v13 = sub_100045408(a1);
  if (!v14) {
    goto LABEL_7;
  }
  os_log_t v2 = v14;
  uint64_t v27 = v13;
  if (qword_10007A5C0 != -1) {
    goto LABEL_14;
  }
  while (1)
  {
    uint64_t v15 = type metadata accessor for Logger();
    sub_10000AF48(v15, (uint64_t)qword_10007DAE0);
    swift_bridgeObjectRetain();
    uint64_t v16 = Logger.logObject.getter();
    os_log_type_t v17 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v16, v17))
    {
      uint64_t v26 = (uint8_t *)swift_slowAlloc();
      uint64_t v25 = swift_slowAlloc();
      *(void *)&v30[0] = v25;
      os_log_t v24 = v16;
      uint64_t v18 = v26;
      *(_DWORD *)uint64_t v26 = 136315138;
      double v23 = v18 + 4;
      swift_bridgeObjectRetain();
      *(void *)&long long v28 = sub_10001EE9C(v27, (unint64_t)v2, (uint64_t *)v30);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      os_log_t v2 = v24;
      _os_log_impl((void *)&_mh_execute_header, v24, v17, "splunk event: %s", v26, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
LABEL_7:
    uint64_t v3 = *(void *)(v3 + 136);
    sub_100030FD0((uint64_t)a1);
    Date.init()();
    Date.timeIntervalSince1970.getter();
    double v20 = v19;
    uint64_t v21 = *(void (**)(char *, uint64_t))(v10 + 8);
    v10 += 8;
    v21(v12, v9);
    if ((~*(void *)&v20 & 0x7FF0000000000000) == 0)
    {
      __break(1u);
LABEL_12:
      __break(1u);
      goto LABEL_13;
    }
    if (v20 <= -1.0) {
      goto LABEL_12;
    }
    if (v20 < 1.84467441e19) {
      break;
    }
LABEL_13:
    __break(1u);
LABEL_14:
    swift_once();
  }
  *(_OWORD *)&v29[120] = v38;
  *(_OWORD *)&v29[104] = v37;
  *(_OWORD *)&v29[136] = v39;
  *(_OWORD *)&v29[152] = v40;
  *(_OWORD *)&v29[40] = v33;
  *(_OWORD *)&v29[56] = v34;
  *(_OWORD *)&v29[72] = v35;
  *(_OWORD *)&v29[88] = v36;
  *(void *)&long long v28 = (unint64_t)v20;
  *((void *)&v28 + 1) = 7633012;
  *(void *)uint64_t v29 = 0xE300000000000000;
  strcpy(&v29[8], "dataprotection");
  v29[23] = -18;
  *(_OWORD *)&v29[24] = v32;
  v30[8] = *(_OWORD *)&v29[112];
  v30[9] = *(_OWORD *)&v29[128];
  v30[10] = *(_OWORD *)&v29[144];
  uint64_t v31 = *((void *)&v40 + 1);
  v30[4] = *(_OWORD *)&v29[48];
  v30[5] = *(_OWORD *)&v29[64];
  v30[6] = *(_OWORD *)&v29[80];
  v30[7] = *(_OWORD *)&v29[96];
  v30[0] = v28;
  v30[1] = *(_OWORD *)v29;
  v30[2] = *(_OWORD *)&v29[16];
  v30[3] = *(_OWORD *)&v29[32];
  sub_10003D990();
  return sub_1000475AC((uint64_t)&v28);
}

uint64_t sub_10003CE9C(long long *a1)
{
  uint64_t v3 = v1;
  long long v5 = a1[5];
  long long v36 = a1[4];
  long long v37 = v5;
  long long v6 = a1[7];
  long long v38 = a1[6];
  long long v39 = v6;
  long long v7 = a1[1];
  long long v32 = *a1;
  long long v33 = v7;
  long long v8 = a1[3];
  long long v34 = a1[2];
  long long v35 = v8;
  uint64_t v9 = type metadata accessor for Date();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v23 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(unsigned char *)(v1 + 96) != 1) {
    goto LABEL_7;
  }
  uint64_t v13 = sub_100045A18(a1);
  if (!v14) {
    goto LABEL_7;
  }
  os_log_t v2 = v14;
  uint64_t v27 = v13;
  if (qword_10007A5C0 != -1) {
    goto LABEL_14;
  }
  while (1)
  {
    uint64_t v15 = type metadata accessor for Logger();
    sub_10000AF48(v15, (uint64_t)qword_10007DAE0);
    swift_bridgeObjectRetain();
    uint64_t v16 = Logger.logObject.getter();
    os_log_type_t v17 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v16, v17))
    {
      uint64_t v26 = (uint8_t *)swift_slowAlloc();
      uint64_t v25 = swift_slowAlloc();
      *(void *)&v30[0] = v25;
      os_log_t v24 = v16;
      uint64_t v18 = v26;
      *(_DWORD *)uint64_t v26 = 136315138;
      double v23 = v18 + 4;
      swift_bridgeObjectRetain();
      *(void *)&long long v28 = sub_10001EE9C(v27, (unint64_t)v2, (uint64_t *)v30);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      os_log_t v2 = v24;
      _os_log_impl((void *)&_mh_execute_header, v24, v17, "splunk event: %s", v26, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
LABEL_7:
    uint64_t v3 = *(void *)(v3 + 136);
    sub_100030E50((uint64_t)a1);
    Date.init()();
    Date.timeIntervalSince1970.getter();
    double v20 = v19;
    uint64_t v21 = *(void (**)(char *, uint64_t))(v10 + 8);
    v10 += 8;
    v21(v12, v9);
    if ((~*(void *)&v20 & 0x7FF0000000000000) == 0)
    {
      __break(1u);
LABEL_12:
      __break(1u);
      goto LABEL_13;
    }
    if (v20 <= -1.0) {
      goto LABEL_12;
    }
    if (v20 < 1.84467441e19) {
      break;
    }
LABEL_13:
    __break(1u);
LABEL_14:
    swift_once();
  }
  *(void *)&long long v28 = (unint64_t)v20;
  *((void *)&v28 + 1) = 7633012;
  *(void *)uint64_t v29 = 0xE300000000000000;
  strcpy(&v29[8], "dataprotection");
  v29[23] = -18;
  *(_OWORD *)&v29[24] = v32;
  *(_OWORD *)&v29[40] = v33;
  *(_OWORD *)&v29[88] = v36;
  *(_OWORD *)&v29[104] = v37;
  *(_OWORD *)&v29[120] = v38;
  *(_OWORD *)&v29[136] = v39;
  *(_OWORD *)&v29[56] = v34;
  *(_OWORD *)&v29[72] = v35;
  v30[2] = *(_OWORD *)&v29[16];
  v30[1] = *(_OWORD *)v29;
  v30[0] = v28;
  v30[5] = *(_OWORD *)&v29[64];
  v30[6] = *(_OWORD *)&v29[80];
  v30[3] = *(_OWORD *)&v29[32];
  v30[4] = *(_OWORD *)&v29[48];
  uint64_t v31 = *((void *)&v39 + 1);
  v30[8] = *(_OWORD *)&v29[112];
  v30[9] = *(_OWORD *)&v29[128];
  v30[7] = *(_OWORD *)&v29[96];
  sub_10003DCF0();
  return sub_10004713C((uint64_t)&v28);
}

uint64_t sub_10003D260(uint64_t a1)
{
  uint64_t v3 = v1;
  long long v5 = *(_OWORD *)(a1 + 144);
  long long v38 = *(_OWORD *)(a1 + 128);
  long long v39 = v5;
  long long v40 = *(_OWORD *)(a1 + 160);
  uint64_t v41 = *(void *)(a1 + 176);
  long long v6 = *(_OWORD *)(a1 + 80);
  long long v34 = *(_OWORD *)(a1 + 64);
  long long v35 = v6;
  long long v7 = *(_OWORD *)(a1 + 112);
  long long v36 = *(_OWORD *)(a1 + 96);
  long long v37 = v7;
  long long v8 = *(_OWORD *)(a1 + 16);
  long long v30 = *(_OWORD *)a1;
  long long v31 = v8;
  long long v9 = *(_OWORD *)(a1 + 48);
  long long v32 = *(_OWORD *)(a1 + 32);
  long long v33 = v9;
  uint64_t v10 = type metadata accessor for Date();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)&v23 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(unsigned char *)(v1 + 96) != 1) {
    goto LABEL_7;
  }
  uint64_t v26 = sub_100045708(a1);
  if (!v14) {
    goto LABEL_7;
  }
  os_log_t v2 = v14;
  if (qword_10007A5C0 != -1) {
    goto LABEL_14;
  }
  while (1)
  {
    uint64_t v15 = type metadata accessor for Logger();
    sub_10000AF48(v15, (uint64_t)qword_10007DAE0);
    swift_bridgeObjectRetain();
    uint64_t v16 = Logger.logObject.getter();
    os_log_type_t v17 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v16, v17))
    {
      uint64_t v18 = (uint8_t *)swift_slowAlloc();
      uint64_t v25 = swift_slowAlloc();
      *(void *)&v29[0] = v25;
      os_log_t v24 = v16;
      *(_DWORD *)uint64_t v18 = 136315138;
      double v23 = v18 + 4;
      swift_bridgeObjectRetain();
      *(void *)&long long v27 = sub_10001EE9C(v26, (unint64_t)v2, (uint64_t *)v29);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      os_log_t v2 = v24;
      _os_log_impl((void *)&_mh_execute_header, v24, v17, "splunk event: %s", v18, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
LABEL_7:
    uint64_t v3 = *(void *)(v3 + 136);
    sub_100030E50(a1);
    Date.init()();
    Date.timeIntervalSince1970.getter();
    double v20 = v19;
    uint64_t v21 = *(void (**)(char *, uint64_t))(v11 + 8);
    v11 += 8;
    v21(v13, v10);
    if ((~*(void *)&v20 & 0x7FF0000000000000) == 0)
    {
      __break(1u);
LABEL_12:
      __break(1u);
      goto LABEL_13;
    }
    if (v20 <= -1.0) {
      goto LABEL_12;
    }
    if (v20 < 1.84467441e19) {
      break;
    }
LABEL_13:
    __break(1u);
LABEL_14:
    swift_once();
  }
  *(void *)&long long v27 = (unint64_t)v20;
  *((void *)&v27 + 1) = 7633012;
  *(void *)long long v28 = 0xE300000000000000;
  strcpy(&v28[8], "dataprotection");
  v28[23] = -18;
  *(_OWORD *)&v28[152] = v38;
  *(_OWORD *)&v28[168] = v39;
  *(_OWORD *)&v28[184] = v40;
  *(void *)&v28[200] = v41;
  *(_OWORD *)&v28[88] = v34;
  *(_OWORD *)&v28[104] = v35;
  *(_OWORD *)&v28[120] = v36;
  *(_OWORD *)&v28[136] = v37;
  *(_OWORD *)&v28[24] = v30;
  *(_OWORD *)&v28[40] = v31;
  *(_OWORD *)&v28[56] = v32;
  *(_OWORD *)&v28[72] = v33;
  v29[10] = *(_OWORD *)&v28[144];
  v29[11] = *(_OWORD *)&v28[160];
  v29[12] = *(_OWORD *)&v28[176];
  v29[13] = *(_OWORD *)&v28[192];
  v29[6] = *(_OWORD *)&v28[80];
  v29[7] = *(_OWORD *)&v28[96];
  v29[8] = *(_OWORD *)&v28[112];
  v29[9] = *(_OWORD *)&v28[128];
  v29[2] = *(_OWORD *)&v28[16];
  v29[3] = *(_OWORD *)&v28[32];
  v29[4] = *(_OWORD *)&v28[48];
  v29[5] = *(_OWORD *)&v28[64];
  v29[0] = v27;
  v29[1] = *(_OWORD *)v28;
  sub_10003DB40();
  return sub_10004713C((uint64_t)&v27);
}

uint64_t sub_10003D644(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for TaskPriority();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    TaskPriority.rawValue.getter();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_100008590(a1, &qword_10007D440);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    dispatch thunk of Actor.unownedExecutor.getter();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_10003D7F0()
{
  sub_1000082E0(&qword_10007D588);
  sub_100047980(&qword_10007D590, &qword_10007D588);
  uint64_t v0 = dispatch thunk of JSONEncoder.encode<A>(_:)();
  unint64_t v2 = v1;
  swift_beginAccess();
  Data.append(_:)();
  swift_endAccess();
  return sub_100024478(v0, v2);
}

uint64_t sub_10003D990()
{
  sub_1000082E0(&qword_10007D568);
  sub_100047980(&qword_10007D570, &qword_10007D568);
  uint64_t v0 = dispatch thunk of JSONEncoder.encode<A>(_:)();
  unint64_t v2 = v1;
  swift_beginAccess();
  Data.append(_:)();
  swift_endAccess();
  return sub_100024478(v0, v2);
}

uint64_t sub_10003DB40()
{
  sub_1000082E0(&qword_10007D510);
  sub_100047980(&qword_10007D518, &qword_10007D510);
  uint64_t v0 = dispatch thunk of JSONEncoder.encode<A>(_:)();
  unint64_t v2 = v1;
  swift_beginAccess();
  Data.append(_:)();
  swift_endAccess();
  return sub_100024478(v0, v2);
}

uint64_t sub_10003DCF0()
{
  sub_1000082E0(&qword_10007D4F0);
  sub_100047980(&qword_10007D4F8, &qword_10007D4F0);
  uint64_t v0 = dispatch thunk of JSONEncoder.encode<A>(_:)();
  unint64_t v2 = v1;
  swift_beginAccess();
  Data.append(_:)();
  swift_endAccess();
  return sub_100024478(v0, v2);
}

uint64_t sub_10003DE98(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = sub_1000082E0(&qword_10007D498);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000B090(a1, a1[3]);
  sub_100046B20();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  LOBYTE(v15) = 0;
  KeyedEncodingContainer.encode(_:forKey:)();
  if (!v2)
  {
    LOBYTE(v15) = 1;
    KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
    long long v9 = *(_OWORD *)(v3 + 40);
    long long v22 = *(_OWORD *)(v3 + 24);
    long long v23 = v9;
    long long v24 = *(_OWORD *)(v3 + 56);
    sub_1000084C8((uint64_t)&v24, (uint64_t)v26, &qword_10007D4A0);
    sub_1000084C8((uint64_t)&v22, (uint64_t)v25, &qword_10007D4A0);
    long long v15 = v22;
    long long v16 = v23;
    long long v17 = v24;
    char v27 = 2;
    sub_100046368(v3);
    sub_100046C1C();
    KeyedEncodingContainer.encode<A>(_:forKey:)();
    sub_100046C70((uint64_t)v25);
    sub_100046C70((uint64_t)v26);
    long long v10 = *(_OWORD *)(v3 + 120);
    long long v11 = *(_OWORD *)(v3 + 152);
    long long v19 = *(_OWORD *)(v3 + 136);
    long long v20 = v11;
    uint64_t v21 = *(void *)(v3 + 168);
    long long v12 = *(_OWORD *)(v3 + 88);
    long long v15 = *(_OWORD *)(v3 + 72);
    long long v13 = *(_OWORD *)(v3 + 104);
    long long v18 = v10;
    long long v16 = v12;
    long long v17 = v13;
    char v27 = 3;
    sub_100046C9C();
    KeyedEncodingContainer.encode<A>(_:forKey:)();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

unint64_t sub_10003E11C()
{
  unint64_t result = 0xD000000000000019;
  switch(*v0)
  {
    case 1:
      unint64_t result = 0xD000000000000015;
      break;
    case 2:
      unint64_t result = 0x6F7463656C6C6F63;
      break;
    case 3:
      unint64_t result = 0x726574726F706572;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_10003E1D0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1000464C8(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_10003E1F8(uint64_t a1)
{
  unint64_t v2 = sub_100046B20();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10003E234(uint64_t a1)
{
  unint64_t v2 = sub_100046B20();

  return CodingKey.debugDescription.getter(a1, v2);
}

__n128 sub_10003E270@<Q0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  sub_1000466C4(a1, (uint64_t)v9);
  if (!v2)
  {
    long long v5 = v9[9];
    *(_OWORD *)(a2 + 128) = v9[8];
    *(_OWORD *)(a2 + 144) = v5;
    *(_OWORD *)(a2 + 160) = v9[10];
    long long v6 = v9[5];
    *(_OWORD *)(a2 + 64) = v9[4];
    *(_OWORD *)(a2 + 80) = v6;
    long long v7 = v9[7];
    *(_OWORD *)(a2 + 96) = v9[6];
    *(_OWORD *)(a2 + 112) = v7;
    long long v8 = v9[1];
    *(_OWORD *)a2 = v9[0];
    *(_OWORD *)(a2 + 16) = v8;
    __n128 result = (__n128)v9[3];
    *(_OWORD *)(a2 + 32) = v9[2];
    *(__n128 *)(a2 + 48) = result;
  }
  return result;
}

uint64_t sub_10003E2D4(void *a1)
{
  return sub_10003DE98(a1);
}

unint64_t sub_10003E330(char a1)
{
  unint64_t result = 0x69746172656E6567;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x656C626967696C65;
      break;
    case 2:
      unint64_t result = 0x656C626967696C65;
      break;
    case 3:
      unint64_t result = 0x6465746365707865;
      break;
    case 4:
      unint64_t result = 0x4564657070696B73;
      break;
    case 5:
      unint64_t result = 0xD000000000000016;
      break;
    case 6:
    case 7:
    case 8:
    case 9:
      unint64_t result = 0xD000000000000010;
      break;
    case 10:
      unint64_t result = 0xD000000000000012;
      break;
    case 11:
      unint64_t result = 0xD000000000000011;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_10003E4B0(void *a1)
{
  uint64_t v3 = sub_1000082E0(&qword_10007D5C0);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  long long v6 = &v8[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_10000B090(a1, a1[3]);
  sub_1000484DC();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  v8[15] = 0;
  KeyedEncodingContainer.encode(_:forKey:)();
  if (!v1)
  {
    v8[14] = 1;
    KeyedEncodingContainer.encode(_:forKey:)();
    v8[13] = 2;
    KeyedEncodingContainer.encode(_:forKey:)();
    v8[12] = 3;
    KeyedEncodingContainer.encode(_:forKey:)();
    v8[11] = 4;
    KeyedEncodingContainer.encode(_:forKey:)();
    v8[10] = 5;
    KeyedEncodingContainer.encode(_:forKey:)();
    _OWORD v8[9] = 6;
    KeyedEncodingContainer.encode(_:forKey:)();
    v8[8] = 7;
    KeyedEncodingContainer.encode(_:forKey:)();
    v8[7] = 8;
    KeyedEncodingContainer.encode(_:forKey:)();
    v8[6] = 9;
    KeyedEncodingContainer.encode(_:forKey:)();
    v8[5] = 10;
    KeyedEncodingContainer.encode(_:forKey:)();
    v8[4] = 11;
    KeyedEncodingContainer.encode(_:forKey:)();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v4 + 8))(v6, v3);
}

unint64_t sub_10003E7A0()
{
  return sub_10003E330(*v0);
}

uint64_t sub_10003E7A8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_100047C6C(a1, a2);
  *a3 = result;
  return result;
}

void sub_10003E7D0(unsigned char *a1@<X8>)
{
  *a1 = 12;
}

uint64_t sub_10003E7DC(uint64_t a1)
{
  unint64_t v2 = sub_1000484DC();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10003E818(uint64_t a1)
{
  unint64_t v2 = sub_1000484DC();

  return CodingKey.debugDescription.getter(a1, v2);
}

double sub_10003E854@<D0>(void *a1@<X0>, _OWORD *a2@<X8>)
{
  sub_10004816C(a1, (uint64_t *)v8);
  if (!v2)
  {
    long long v5 = v8[3];
    a2[2] = v8[2];
    a2[3] = v5;
    long long v6 = v8[5];
    a2[4] = v8[4];
    a2[5] = v6;
    double result = *(double *)v8;
    long long v7 = v8[1];
    *a2 = v8[0];
    a2[1] = v7;
  }
  return result;
}

uint64_t sub_10003E8A0(void *a1)
{
  return sub_10003E4B0(a1);
}

unsigned int *sub_10003E8B8@<X0>(unint64_t *a1@<X8>)
{
  unint64_t add_explicit = atomic_fetch_add_explicit((atomic_ullong *volatile)(*(uint64_t (**)(void))(*v1[2] + 136))(), 1uLL, memory_order_relaxed);
  long long v10 = (unsigned int *)(*(uint64_t (**)(void))(*v1[3] + 136))();
  __swp(v11, v10);
  unint64_t v20 = v11;
  long long v12 = (unsigned int *)(*(uint64_t (**)(void))(*v1[4] + 136))();
  __swp(v13, v12);
  unint64_t v19 = v13;
  uint64_t v14 = (unsigned int *)(*(uint64_t (**)(void))(*v1[5] + 136))();
  __swp(v15, v14);
  unint64_t v18 = v15;
  __swp(v6, (unsigned int *)(*(uint64_t (**)(void))(*v1[6] + 136))());
  __swp(v7, (unsigned int *)(*(uint64_t (**)(void))(*v1[7] + 136))());
  __swp(v8, (unsigned int *)(*(uint64_t (**)(void))(*v1[8] + 136))());
  __swp(v2, (unsigned int *)(*(uint64_t (**)(void))(*v1[9] + 136))());
  __swp(v3, (unsigned int *)(*(uint64_t (**)(void))(*v1[10] + 136))());
  __swp(v4, (unsigned int *)(*(uint64_t (**)(void))(*v1[11] + 136))());
  __swp(v5, (unsigned int *)(*(uint64_t (**)(void))(*v1[12] + 136))());
  double result = (unsigned int *)(*(uint64_t (**)(void))(*v1[13] + 136))();
  __swp(v17, result);
  *a1 = add_explicit;
  a1[1] = v20;
  a1[2] = v19;
  a1[3] = v18;
  a1[4] = v6;
  a1[5] = v7;
  a1[6] = v8;
  a1[7] = v2;
  a1[8] = v3;
  a1[9] = v4;
  a1[10] = v5;
  a1[11] = v17;
  return result;
}

void *sub_10003EB50(uint64_t *a1)
{
  uint64_t v3 = *a1;
  *(void *)(*(uint64_t (**)(void))(*v1[2] + 136))() = v3;
  uint64_t v4 = a1[1];
  *(void *)(*(uint64_t (**)(void))(*v1[3] + 136))() = v4;
  uint64_t v5 = a1[2];
  *(void *)(*(uint64_t (**)(void))(*v1[4] + 136))() = v5;
  uint64_t v6 = a1[3];
  *(void *)(*(uint64_t (**)(void))(*v1[5] + 136))() = v6;
  uint64_t v7 = a1[4];
  *(void *)(*(uint64_t (**)(void))(*v1[6] + 136))() = v7;
  uint64_t v8 = a1[5];
  *(void *)(*(uint64_t (**)(void))(*v1[7] + 136))() = v8;
  uint64_t v9 = a1[6];
  *(void *)(*(uint64_t (**)(void))(*v1[8] + 136))() = v9;
  uint64_t v10 = a1[7];
  *(void *)(*(uint64_t (**)(void))(*v1[9] + 136))() = v10;
  uint64_t v11 = a1[8];
  *(void *)(*(uint64_t (**)(void))(*v1[10] + 136))() = v11;
  uint64_t v12 = a1[9];
  *(void *)(*(uint64_t (**)(void))(*v1[11] + 136))() = v12;
  uint64_t v13 = a1[10];
  *(void *)(*(uint64_t (**)(void))(*v1[12] + 136))() = v13;
  uint64_t v14 = a1[11];
  double result = (void *)(*(uint64_t (**)(void))(*v1[13] + 136))();
  *double result = v14;
  return result;
}

uint64_t sub_10003EDBC()
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return v0;
}

uint64_t sub_10003EE34()
{
  sub_10003EDBC();

  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for AnalyticsManagerCounters()
{
  return self;
}

void *sub_10003EE8C()
{
  sub_1000082E0(&qword_10007D468);
  uint64_t v1 = swift_allocObject();
  *(void *)(v1 + 16) = 0;
  v0[2] = v1;
  uint64_t v2 = swift_allocObject();
  *(void *)(v2 + 16) = 0;
  v0[3] = v2;
  uint64_t v3 = swift_allocObject();
  *(void *)(v3 + 16) = 0;
  v0[4] = v3;
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = 0;
  v0[5] = v4;
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = 0;
  v0[6] = v5;
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = 0;
  v0[7] = v6;
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = 0;
  v0[8] = v7;
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = 0;
  v0[9] = v8;
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = 0;
  v0[10] = v9;
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = 0;
  v0[11] = v10;
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = 0;
  v0[12] = v11;
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = 0;
  v0[13] = v12;
  return v0;
}

uint64_t sub_10003EFD8()
{
  _StringGuts.grow(_:)(232);
  v0._countAndFlagsBits = 0x69746172656E6567;
  v0._object = (void *)0xEB000000003D6E6FLL;
  String.append(_:)(v0);
  v1._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
  String.append(_:)(v1);
  swift_bridgeObjectRelease();
  v2._object = (void *)0x800000010005DCC0;
  v2._countAndFlagsBits = 0xD000000000000010;
  String.append(_:)(v2);
  v3._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
  String.append(_:)(v3);
  swift_bridgeObjectRelease();
  v4._countAndFlagsBits = 0x6C626967696C6520;
  v4._object = (void *)0xEF3D73656C694665;
  String.append(_:)(v4);
  v5._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
  String.append(_:)(v5);
  swift_bridgeObjectRelease();
  v6._object = (void *)0x800000010005DCE0;
  v6._countAndFlagsBits = 0xD000000000000010;
  String.append(_:)(v6);
  v7._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
  String.append(_:)(v7);
  swift_bridgeObjectRelease();
  v8._countAndFlagsBits = 0x64657070696B7320;
  v8._object = (void *)0xEF3D73746E657645;
  String.append(_:)(v8);
  v9._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
  String.append(_:)(v9);
  swift_bridgeObjectRelease();
  v10._countAndFlagsBits = 0xD000000000000018;
  v10._object = (void *)0x800000010005DD00;
  String.append(_:)(v10);
  v11._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
  String.append(_:)(v11);
  swift_bridgeObjectRelease();
  v12._object = (void *)0x800000010005DD20;
  v12._countAndFlagsBits = 0xD000000000000012;
  String.append(_:)(v12);
  v13._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
  String.append(_:)(v13);
  swift_bridgeObjectRelease();
  v14._object = (void *)0x800000010005DD40;
  v14._countAndFlagsBits = 0xD000000000000012;
  String.append(_:)(v14);
  v15._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
  String.append(_:)(v15);
  swift_bridgeObjectRelease();
  v16._object = (void *)0x800000010005DD60;
  v16._countAndFlagsBits = 0xD000000000000012;
  String.append(_:)(v16);
  v17._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
  String.append(_:)(v17);
  swift_bridgeObjectRelease();
  v18._object = (void *)0x800000010005DD80;
  v18._countAndFlagsBits = 0xD000000000000012;
  String.append(_:)(v18);
  v19._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
  String.append(_:)(v19);
  swift_bridgeObjectRelease();
  v20._countAndFlagsBits = 0xD000000000000014;
  v20._object = (void *)0x800000010005DDA0;
  String.append(_:)(v20);
  v21._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
  String.append(_:)(v21);
  swift_bridgeObjectRelease();
  v22._countAndFlagsBits = 0xD000000000000013;
  v22._object = (void *)0x800000010005DDC0;
  String.append(_:)(v22);
  v23._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
  String.append(_:)(v23);
  swift_bridgeObjectRelease();
  return 0;
}

void *sub_10003F3E8(uint64_t a1)
{
  Swift::String v3 = (void *)v1;
  *(_OWORD *)(v1 + 16) = xmmword_1000565C0;
  uint64_t v5 = v1 + 16;
  char v42 = 0;
  char v40 = 0;
  char v39 = 0;
  char v38 = 0;
  char v37 = 0;
  *(unsigned char *)(v1 + 32) = 0;
  *(void *)(v1 + 40) = 0;
  *(void *)(v1 + 48) = 0;
  *(void *)(v1 + 56) = 1024;
  *(unsigned char *)(v1 + 64) = 0;
  *(void *)(v1 + 72) = 0;
  *(void *)(v1 + 80) = 0;
  *(void *)(v1 + 88) = 86400;
  *(unsigned char *)(v1 + 96) = 0;
  *(void *)(v1 + 104) = 7200;
  *(unsigned char *)(v1 + 112) = 0;
  *(void *)(v1 + 120) = 1800;
  *(unsigned char *)(v1 + 128) = 0;
  *(void *)(v1 + 136) = 600;
  *(unsigned char *)(v1 + 144) = v37;
  *(_OWORD *)(v1 + 152) = xmmword_1000565D0;
  *(unsigned char *)(v1 + 168) = 0;
  *(unsigned char *)(v1 + 176) = 1;
  *(void *)(v1 + 184) = 4096;
  type metadata accessor for AnalyticsEventSource();
  swift_allocObject();
  *(void *)(v1 + 192) = sub_100025E0C();
  type metadata accessor for AnalyticsManagerCounters();
  uint64_t v6 = swift_allocObject();
  sub_10003EE8C();
  *(void *)(v5 + 208) = v6;
  long long v7 = *(_OWORD *)(v5 + 144);
  v41[8] = *(_OWORD *)(v5 + 128);
  v41[9] = v7;
  v41[10] = *(_OWORD *)(v5 + 160);
  long long v8 = *(_OWORD *)(v5 + 80);
  v41[4] = *(_OWORD *)(v5 + 64);
  v41[5] = v8;
  long long v9 = *(_OWORD *)(v5 + 112);
  v41[6] = *(_OWORD *)(v5 + 96);
  v41[7] = v9;
  long long v10 = *(_OWORD *)(v5 + 16);
  v41[0] = *(_OWORD *)v5;
  v41[1] = v10;
  long long v11 = *(_OWORD *)(v5 + 48);
  v41[2] = *(_OWORD *)(v5 + 32);
  v41[3] = v11;
  long long v12 = *(_OWORD *)(a1 + 144);
  *(_OWORD *)(v5 + 128) = *(_OWORD *)(a1 + 128);
  *(_OWORD *)(v5 + 144) = v12;
  *(_OWORD *)(v5 + 160) = *(_OWORD *)(a1 + 160);
  long long v13 = *(_OWORD *)(a1 + 80);
  *(_OWORD *)(v5 + 64) = *(_OWORD *)(a1 + 64);
  *(_OWORD *)(v5 + 80) = v13;
  long long v14 = *(_OWORD *)(a1 + 112);
  *(_OWORD *)(v5 + 96) = *(_OWORD *)(a1 + 96);
  *(_OWORD *)(v5 + 112) = v14;
  long long v15 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)uint64_t v5 = *(_OWORD *)a1;
  *(_OWORD *)(v5 + 16) = v15;
  long long v16 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)(v5 + 32) = *(_OWORD *)(a1 + 32);
  *(_OWORD *)(v5 + 48) = v16;
  sub_100046368(a1);
  sub_100046490((uint64_t)v41);
  type metadata accessor for AnalyticsStore();
  uint64_t v17 = sub_10001A9B4();
  if (v2)
  {
    sub_100046490(a1);
    long long v18 = *(_OWORD *)(v5 + 144);
    v33[8] = *(_OWORD *)(v5 + 128);
    v33[9] = v18;
    v33[10] = *(_OWORD *)(v5 + 160);
    long long v19 = *(_OWORD *)(v5 + 80);
    v33[4] = *(_OWORD *)(v5 + 64);
    v33[5] = v19;
    long long v20 = *(_OWORD *)(v5 + 112);
    v33[6] = *(_OWORD *)(v5 + 96);
    v33[7] = v20;
    long long v21 = *(_OWORD *)(v5 + 16);
    v33[0] = *(_OWORD *)v5;
    v33[1] = v21;
    long long v22 = *(_OWORD *)(v5 + 48);
    v33[2] = *(_OWORD *)(v5 + 32);
    v33[3] = v22;
    sub_100046490((uint64_t)v33);
    swift_release();
    swift_release();
    type metadata accessor for AnalyticsManager();
    swift_deallocPartialClassInstance();
  }
  else
  {
    uint64_t v23 = v17;
    v3[25] = v17;
    long long v24 = *(_OWORD *)(a1 + 40);
    v36[0] = *(_OWORD *)(a1 + 24);
    v36[1] = v24;
    void v36[2] = *(_OWORD *)(a1 + 56);
    uint64_t v25 = v3[28];
    type metadata accessor for EventCollector();
    swift_allocObject();
    sub_100046368(a1);
    swift_retain();
    swift_retain();
    uint64_t v26 = sub_1000379D8(v36, v23, v25);
    swift_release();
    v3[26] = v26;
    long long v27 = *(_OWORD *)(a1 + 120);
    long long v28 = *(_OWORD *)(a1 + 152);
    v34[4] = *(_OWORD *)(a1 + 136);
    v34[5] = v28;
    uint64_t v35 = *(void *)(a1 + 168);
    long long v29 = *(_OWORD *)(a1 + 88);
    v34[0] = *(_OWORD *)(a1 + 72);
    v34[1] = v29;
    v34[2] = *(_OWORD *)(a1 + 104);
    v34[3] = v27;
    uint64_t v30 = v3[28];
    type metadata accessor for AnalyticsReporter();
    swift_allocObject();
    swift_retain();
    swift_retain();
    uint64_t v31 = sub_10002F654((uint64_t)v34, v23, v30);
    swift_release();
    swift_release();
    sub_100046490(a1);
    v3[27] = v31;
  }
  return v3;
}

uint64_t sub_10003F6FC()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_1000082E0(&qword_10007D440);
  __chkstk_darwin(v2 - 8);
  Swift::String v4 = (char *)v13 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for TaskPriority();
  uint64_t v6 = *(void *)(v5 - 8);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56))(v4, 1, 1, v5);
  long long v7 = (void *)swift_allocObject();
  v7[2] = 0;
  v7[3] = 0;
  v7[4] = v1;
  int v8 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5);
  swift_retain();
  if (v8 == 1)
  {
    sub_100008590((uint64_t)v4, &qword_10007D440);
  }
  else
  {
    TaskPriority.rawValue.getter();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v4, v5);
    if (v7[2])
    {
      swift_getObjectType();
      swift_unknownObjectRetain();
      uint64_t v9 = dispatch thunk of Actor.unownedExecutor.getter();
      uint64_t v11 = v10;
      swift_unknownObjectRelease();
      if (v11 | v9)
      {
        v13[0] = 0;
        v13[1] = 0;
        void v13[2] = v9;
        v13[3] = v11;
      }
    }
  }
  swift_task_create();
  return swift_release();
}

uint64_t sub_10003F924(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[18] = a4;
  uint64_t v5 = type metadata accessor for ContinuousClock();
  v4[19] = v5;
  v4[20] = *(void *)(v5 - 8);
  v4[21] = swift_task_alloc();
  return _swift_task_switch(sub_10003F9E4, 0, 0);
}

uint64_t sub_10003F9E4()
{
  type metadata accessor for AnalyticsStoreContext();
  uint64_t inited = swift_initStackObject();
  v0[22] = inited;
  type metadata accessor for ModelContext();
  swift_allocObject();
  swift_retain();
  *(void *)(inited + 16) = ModelContext.init(_:)();
  v0[23] = sub_10001B14C();
  uint64_t v2 = *(void *)(v0[18] + 16);
  uint64_t v3 = 1000000000000000000 * v2;
  uint64_t v4 = ((v2 >> 63) & 0xF21F494C589C0000) + (((unint64_t)v2 * (unsigned __int128)0xDE0B6B3A7640000uLL) >> 64);
  ContinuousClock.init()();
  uint64_t v7 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, char))((char *)&dword_10007D4C8 + dword_10007D4C8);
  uint64_t v5 = (void *)swift_task_alloc();
  v0[24] = v5;
  void *v5 = v0;
  v5[1] = sub_100008A78;
  return v7(v3, v4, 0, 0, 1);
}

uint64_t sub_10003FB94()
{
  swift_release();
  swift_release();
  swift_errorRelease();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_10003FC20()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_1000082E0(&qword_10007D440);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)v14 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for TaskPriority();
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
    sub_100008590((uint64_t)v4, &qword_10007D440);
    uint64_t v9 = 0;
    uint64_t v10 = 0;
  }
  else
  {
    TaskPriority.rawValue.getter();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v4, v5);
    if (v7[2])
    {
      swift_getObjectType();
      swift_unknownObjectRetain();
      uint64_t v9 = dispatch thunk of Actor.unownedExecutor.getter();
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
  *(void *)(v12 + 16) = &unk_10007D528;
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

uint64_t sub_10003FE64(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[100] = a4;
  uint64_t v5 = type metadata accessor for ContinuousClock.Instant();
  v4[101] = v5;
  v4[102] = *(void *)(v5 - 8);
  v4[103] = swift_task_alloc();
  v4[104] = swift_task_alloc();
  uint64_t v6 = type metadata accessor for ContinuousClock();
  v4[105] = v6;
  v4[106] = *(void *)(v6 - 8);
  v4[107] = swift_task_alloc();
  return _swift_task_switch(sub_10003FF90, 0, 0);
}

uint64_t sub_10003FF90()
{
  uint64_t v1 = *(void *)(v0 + 800);
  if (*(unsigned char *)(v1 + 32) == 1)
  {
    if (qword_10007A5C0 != -1) {
      swift_once();
    }
    uint64_t v2 = type metadata accessor for Logger();
    sub_10000AF48(v2, (uint64_t)qword_10007DAE0);
    uint64_t v3 = Logger.logObject.getter();
    os_log_type_t v4 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v3, v4))
    {
      uint64_t v5 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, v4, "status reporting disabled", v5, 2u);
      swift_slowDealloc();
    }

    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v6 = *(uint64_t (**)(void))(v0 + 8);
    return v6();
  }
  else
  {
    uint64_t v8 = *(void *)(v0 + 816);
    uint64_t v9 = *(void *)(v1 + 24);
    *(void *)(v0 + 864) = v9;
    uint64_t v10 = 1000000000000000000 * v9;
    uint64_t v11 = *(void *)(v0 + 824);
    uint64_t v12 = *(void *)(v0 + 808);
    uint64_t v13 = ((v9 >> 63) & 0xF21F494C589C0000) + (((unint64_t)v9 * (unsigned __int128)0xDE0B6B3A7640000uLL) >> 64);
    ContinuousClock.init()();
    *(void *)(v0 + 776) = v10;
    *(void *)(v0 + 784) = v13;
    *(_OWORD *)(v0 + 752) = 0u;
    *(unsigned char *)(v0 + 768) = 1;
    uint64_t v14 = sub_100005D3C(&qword_10007D4D0, (void (*)(uint64_t))&type metadata accessor for ContinuousClock);
    dispatch thunk of Clock.now.getter();
    sub_100005D3C(&qword_10007D4D8, (void (*)(uint64_t))&type metadata accessor for ContinuousClock.Instant);
    dispatch thunk of InstantProtocol.advanced(by:)();
    long long v15 = *(void (**)(uint64_t, uint64_t))(v8 + 8);
    *(void *)(v0 + 872) = v15;
    *(void *)(v0 + 880) = (v8 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
    v15(v11, v12);
    long long v16 = (void *)swift_task_alloc();
    *(void *)(v0 + 888) = v16;
    *long long v16 = v0;
    v16[1] = sub_1000402AC;
    uint64_t v17 = *(void *)(v0 + 840);
    uint64_t v18 = *(void *)(v0 + 832);
    return dispatch thunk of Clock.sleep(until:tolerance:)(v18, v0 + 752, v17, v14);
  }
}

uint64_t sub_1000402AC()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 896) = v0;
  swift_task_dealloc();
  if (v0)
  {
    (*(void (**)(void, void))(v2 + 872))(*(void *)(v2 + 832), *(void *)(v2 + 808));
    uint64_t v3 = sub_10004092C;
  }
  else
  {
    uint64_t v4 = *(void *)(v2 + 856);
    uint64_t v5 = *(void *)(v2 + 848);
    uint64_t v6 = *(void *)(v2 + 840);
    (*(void (**)(void, void))(v2 + 872))(*(void *)(v2 + 832), *(void *)(v2 + 808));
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
    uint64_t v3 = sub_100040414;
  }
  return _swift_task_switch(v3, 0, 0);
}

uint64_t sub_100040414()
{
  uint64_t v33 = v0;
  sub_100026C14(v0 + 16);
  sub_1000084C8(v0 + 16, v0 + 232, &qword_10007C628);
  if (sub_100047070(v0 + 232) != 1)
  {
    long long v1 = *(_OWORD *)(v0 + 408);
    *(_OWORD *)(v0 + 608) = *(_OWORD *)(v0 + 392);
    *(_OWORD *)(v0 + 624) = v1;
    *(_OWORD *)(v0 + 640) = *(_OWORD *)(v0 + 424);
    long long v2 = *(_OWORD *)(v0 + 344);
    *(_OWORD *)(v0 + 544) = *(_OWORD *)(v0 + 328);
    *(_OWORD *)(v0 + 560) = v2;
    long long v3 = *(_OWORD *)(v0 + 376);
    *(_OWORD *)(v0 + 576) = *(_OWORD *)(v0 + 360);
    *(_OWORD *)(v0 + 592) = v3;
    long long v4 = *(_OWORD *)(v0 + 280);
    *(_OWORD *)(v0 + 480) = *(_OWORD *)(v0 + 264);
    *(_OWORD *)(v0 + 496) = v4;
    long long v5 = *(_OWORD *)(v0 + 312);
    *(_OWORD *)(v0 + 512) = *(_OWORD *)(v0 + 296);
    *(_OWORD *)(v0 + 528) = v5;
    long long v6 = *(_OWORD *)(v0 + 248);
    *(_OWORD *)(v0 + 448) = *(_OWORD *)(v0 + 232);
    *(_OWORD *)(v0 + 464) = v6;
    if (qword_10007A5C0 != -1) {
      swift_once();
    }
    uint64_t v7 = type metadata accessor for Logger();
    sub_10000AF48(v7, (uint64_t)qword_10007DAE0);
    uint64_t v8 = Logger.logObject.getter();
    os_log_type_t v9 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v8, v9))
    {
      uint64_t v10 = (uint8_t *)swift_slowAlloc();
      uint64_t v11 = swift_slowAlloc();
      *(_DWORD *)uint64_t v10 = 136315138;
      uint64_t v32 = v11;
      uint64_t v12 = AKSAnalyticsCounters.description.getter();
      *(void *)(v0 + 792) = sub_10001EE9C(v12, v13, &v32);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v8, v9, "kernel: %s", v10, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
  }
  if (qword_10007A5C0 != -1) {
    swift_once();
  }
  uint64_t v14 = type metadata accessor for Logger();
  sub_10000AF48(v14, (uint64_t)qword_10007DAE0);
  swift_retain_n();
  long long v15 = Logger.logObject.getter();
  os_log_type_t v16 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v15, v16))
  {
    uint64_t v17 = swift_slowAlloc();
    uint64_t v32 = swift_slowAlloc();
    *(_DWORD *)uint64_t v17 = 136315138;
    swift_retain();
    sub_100008630((void *)(v0 + 656));
    swift_release();
    uint64_t v18 = sub_10003EFD8();
    *(void *)(v17 + 4) = sub_10001EE9C(v18, v19, &v32);
    swift_bridgeObjectRelease();
    swift_release_n();
    _os_log_impl((void *)&_mh_execute_header, v15, v16, "events: %s", (uint8_t *)v17, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_release_n();
  }

  uint64_t v20 = *(void *)(v0 + 864);
  uint64_t v21 = *(void *)(v0 + 824);
  uint64_t v22 = *(void *)(v0 + 816);
  uint64_t v23 = *(void *)(v0 + 808);
  uint64_t v24 = 1000000000000000000 * v20;
  uint64_t v25 = ((v20 >> 63) & 0xF21F494C589C0000) + (((unint64_t)v20 * (unsigned __int128)0xDE0B6B3A7640000uLL) >> 64);
  ContinuousClock.init()();
  *(void *)(v0 + 776) = v24;
  *(void *)(v0 + 784) = v25;
  *(_OWORD *)(v0 + 752) = 0u;
  *(unsigned char *)(v0 + 768) = 1;
  uint64_t v26 = sub_100005D3C(&qword_10007D4D0, (void (*)(uint64_t))&type metadata accessor for ContinuousClock);
  dispatch thunk of Clock.now.getter();
  sub_100005D3C(&qword_10007D4D8, (void (*)(uint64_t))&type metadata accessor for ContinuousClock.Instant);
  dispatch thunk of InstantProtocol.advanced(by:)();
  long long v27 = *(void (**)(uint64_t, uint64_t))(v22 + 8);
  *(void *)(v0 + 872) = v27;
  *(void *)(v0 + 880) = (v22 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v27(v21, v23);
  long long v28 = (void *)swift_task_alloc();
  *(void *)(v0 + 888) = v28;
  *long long v28 = v0;
  v28[1] = sub_1000402AC;
  uint64_t v29 = *(void *)(v0 + 840);
  uint64_t v30 = *(void *)(v0 + 832);
  return dispatch thunk of Clock.sleep(until:tolerance:)(v30, v0 + 752, v29, v26);
}

uint64_t sub_10004092C()
{
  (*(void (**)(void, void))(v0[106] + 8))(v0[107], v0[105]);
  swift_errorRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  long long v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

uint64_t sub_1000409CC(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, char a6)
{
  *(void *)(v7 + 1312) = v6;
  *(unsigned char *)(v7 + 226) = a6;
  *(void *)(v7 + 1304) = a5;
  *(unsigned char *)(v7 + 225) = a4;
  *(void *)(v7 + 1296) = a3;
  *(void *)(v7 + 1288) = a2;
  *(void *)(v7 + 1280) = a1;
  uint64_t v8 = type metadata accessor for ContinuousClock();
  *(void *)(v7 + 1320) = v8;
  *(void *)(v7 + 1328) = *(void *)(v8 - 8);
  *(void *)(v7 + 1336) = swift_task_alloc();
  return _swift_task_switch(sub_100040AA4, 0, 0);
}

uint64_t sub_100040AA4()
{
  uint64_t v101 = v0;
  if (*(unsigned char *)(v0 + 225) & 1) == 0 && (static Duration.< infix(_:_:)())
  {
    ContinuousClock.init()();
    v91 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, char))((char *)&dword_10007D4C8 + dword_10007D4C8);
    long long v1 = (void *)swift_task_alloc();
    *(void *)(v0 + 1344) = v1;
    *long long v1 = v0;
    v1[1] = sub_10004129C;
    uint64_t v2 = *(void *)(v0 + 1296);
    uint64_t v3 = *(void *)(v0 + 1288);
    return v91(v3, v2, 0, 0, 1);
  }
  uint64_t v5 = v0 + 16;
  uint64_t v92 = v0 + 232;
  uint64_t v6 = *(void *)(v0 + 1312);
  char v7 = *(unsigned char *)(v0 + 226);
  swift_retain();
  uint64_t v8 = &stru_10007A000;
  if (v7)
  {
    sub_10003E8B8((unint64_t *)(v0 + 1168));
    uint64_t v18 = *(void *)(v0 + 1168);
    uint64_t v10 = *(void *)(v0 + 1184);
    uint64_t v89 = *(void *)(v0 + 1192);
    uint64_t v90 = *(void *)(v0 + 1176);
    uint64_t v79 = *(void *)(v0 + 1200);
    uint64_t v87 = *(void *)(v0 + 1216);
    uint64_t v88 = *(void *)(v0 + 1208);
    uint64_t v85 = *(void *)(v0 + 1232);
    uint64_t v86 = *(void *)(v0 + 1224);
    uint64_t v83 = *(void *)(v0 + 1248);
    uint64_t v84 = *(void *)(v0 + 1240);
    uint64_t v82 = *(void *)(v0 + 1256);
    swift_release();
    if (qword_10007A5C0 != -1) {
      swift_once();
    }
    uint64_t v19 = type metadata accessor for Logger();
    sub_10000AF48(v19, (uint64_t)qword_10007DAE0);
    swift_retain();
    uint64_t v20 = Logger.logObject.getter();
    os_log_type_t v21 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v20, v21))
    {
      uint64_t v80 = v10;
      uint64_t v22 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)uint64_t v22 = 134217984;
      uint64_t v23 = *(uint64_t (**)(uint64_t))(**(void **)(*(void *)(v6 + 224) + 16) + 136);
      uint64_t v24 = v18;
      uint64_t v25 = swift_retain();
      uint64_t v26 = *(void *)v23(v25);
      swift_release();
      *(void *)(v0 + 1264) = v26;
      uint64_t v18 = v24;
      uint64_t v8 = &stru_10007A000;
      uint64_t v5 = v0 + 16;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_release();
      _os_log_impl((void *)&_mh_execute_header, v20, v21, "starting new generation %ld", v22, 0xCu);
      uint64_t v10 = v80;
      swift_slowDealloc();
    }
    else
    {
      swift_release();
    }

    uint64_t v9 = v18;
    uint64_t v11 = v79;
  }
  else
  {
    sub_100008630((void *)(v0 + 1072));
    uint64_t v9 = *(void *)(v0 + 1072);
    uint64_t v10 = *(void *)(v0 + 1088);
    uint64_t v89 = *(void *)(v0 + 1096);
    uint64_t v90 = *(void *)(v0 + 1080);
    uint64_t v11 = *(void *)(v0 + 1104);
    uint64_t v87 = *(void *)(v0 + 1120);
    uint64_t v88 = *(void *)(v0 + 1112);
    uint64_t v85 = *(void *)(v0 + 1136);
    uint64_t v86 = *(void *)(v0 + 1128);
    uint64_t v83 = *(void *)(v0 + 1152);
    uint64_t v84 = *(void *)(v0 + 1144);
    uint64_t v82 = *(void *)(v0 + 1160);
    swift_release();
    if (qword_10007A5C0 != -1) {
      swift_once();
    }
    uint64_t v12 = type metadata accessor for Logger();
    sub_10000AF48(v12, (uint64_t)qword_10007DAE0);
    unint64_t v13 = Logger.logObject.getter();
    os_log_type_t v14 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v13, v14))
    {
      uint64_t v15 = *(void *)(v0 + 1304);
      uint64_t v16 = v9;
      uint64_t v17 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)uint64_t v17 = 134217984;
      *(void *)(v0 + 1272) = v15;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl((void *)&_mh_execute_header, v13, v14, "retrying report for generation %ld", v17, 0xCu);
      uint64_t v9 = v16;
      uint64_t v5 = v0 + 16;
      uint64_t v8 = &stru_10007A000;
      swift_slowDealloc();
    }

    uint64_t v18 = *(void *)(v0 + 1304);
  }
  *(void *)(v0 + 1360) = v18;
  sub_100026C14(v92);
  sub_1000084C8(v92, v5, &qword_10007C628);
  uint64_t result = sub_100047070(v5);
  if (result == 1)
  {
    if (v8[46].offs != (int32_t *)-1) {
      swift_once();
    }
    uint64_t v27 = type metadata accessor for Logger();
    sub_10000AF48(v27, (uint64_t)qword_10007DAE0);
    long long v28 = Logger.logObject.getter();
    os_log_type_t v29 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v28, v29))
    {
      uint64_t v30 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v30 = 0;
      _os_log_impl((void *)&_mh_execute_header, v28, v29, "missing kernel counters for splunk report", v30, 2u);
      swift_slowDealloc();
    }
    uint64_t v31 = *(void *)(v0 + 1312);

    uint64_t v32 = *(void *)(v31 + 216);
    goto LABEL_31;
  }
  uint64_t v33 = *(void *)(v0 + 16);
  uint64_t v34 = *(void *)(v0 + 24);
  BOOL v35 = __CFADD__(v33, v34);
  uint64_t v36 = v33 + v34;
  if (v35)
  {
    __break(1u);
    goto LABEL_35;
  }
  uint64_t v37 = *(void *)(v0 + 32);
  BOOL v35 = __CFADD__(v36, v37);
  uint64_t v38 = v36 + v37;
  if (v35)
  {
LABEL_35:
    __break(1u);
    goto LABEL_36;
  }
  uint64_t v39 = *(void *)(v0 + 40);
  uint64_t v40 = v38 + v39;
  if (__CFADD__(v38, v39))
  {
LABEL_36:
    __break(1u);
    goto LABEL_37;
  }
  uint64_t v41 = *(void *)(v0 + 56);
  uint64_t v42 = *(void *)(v0 + 64);
  BOOL v35 = __CFADD__(v41, v42);
  uint64_t v43 = v41 + v42;
  if (v35)
  {
LABEL_37:
    __break(1u);
    goto LABEL_38;
  }
  uint64_t v44 = *(void *)(v0 + 72);
  BOOL v35 = __CFADD__(v43, v44);
  uint64_t v45 = v43 + v44;
  if (v35)
  {
LABEL_38:
    __break(1u);
    goto LABEL_39;
  }
  uint64_t v46 = *(void *)(v0 + 80);
  BOOL v35 = __CFADD__(v45, v46);
  uint64_t v47 = v45 + v46;
  if (v35)
  {
LABEL_39:
    __break(1u);
    return result;
  }
  uint64_t v48 = v11;
  uint64_t v49 = *(void *)(v0 + 128);
  uint64_t v81 = v10;
  uint64_t v50 = *(void *)(v0 + 144);
  uint64_t v51 = *(void *)(v0 + 152);
  uint64_t v93 = v9;
  uint64_t v52 = v47;
  uint64_t v32 = *(void *)(*(void *)(v0 + 1312) + 216);
  uint64_t v53 = v40;
  sub_1000280F4(0x6F436C656E72654BLL, 0xEE00737265746E75, (uint64_t)&v94);
  long long v54 = v95;
  long long v55 = v96;
  uint64_t v56 = v97;
  uint64_t v57 = v98;
  long long v58 = v99;
  uint64_t v59 = v100;
  *(_OWORD *)(v0 + 944) = v94;
  *(_OWORD *)(v0 + 960) = v54;
  *(_OWORD *)(v0 + 976) = v55;
  *(void *)(v0 + 992) = v56;
  *(void *)(v0 + 1000) = v57;
  *(_OWORD *)(v0 + 1008) = v58;
  *(void *)(v0 + 1024) = v59;
  *(void *)(v0 + 1032) = v53;
  *(void *)(v0 + 1040) = v52;
  *(void *)(v0 + 1048) = v49;
  uint64_t v11 = v48;
  *(void *)(v0 + 1056) = v50;
  uint64_t v10 = v81;
  *(void *)(v0 + 1064) = v51;
  uint64_t v9 = v93;
  long long v60 = *(_OWORD *)(v0 + 944);
  long long v61 = *(_OWORD *)(v0 + 960);
  long long v62 = *(_OWORD *)(v0 + 992);
  *(_OWORD *)(v0 + 848) = *(_OWORD *)(v0 + 976);
  *(_OWORD *)(v0 + 864) = v62;
  *(_OWORD *)(v0 + 816) = v60;
  *(_OWORD *)(v0 + 832) = v61;
  long long v63 = *(_OWORD *)(v0 + 1008);
  long long v64 = *(_OWORD *)(v0 + 1024);
  long long v65 = *(_OWORD *)(v0 + 1056);
  *(_OWORD *)(v0 + 912) = *(_OWORD *)(v0 + 1040);
  *(_OWORD *)(v0 + 928) = v65;
  *(_OWORD *)(v0 + 880) = v63;
  *(_OWORD *)(v0 + 896) = v64;
  sub_10003CE9C((long long *)(v0 + 816));
  sub_100030EBC(v0 + 944);
LABEL_31:
  *(void *)(v0 + 1368) = v32;
  sub_1000280F4(0x756F43746E657645, 0xED0000737265746ELL, (uint64_t)&v94);
  long long v67 = v95;
  long long v66 = v96;
  uint64_t v68 = v97;
  uint64_t v69 = v98;
  long long v70 = v99;
  uint64_t v71 = v100;
  *(_OWORD *)(v0 + 632) = v94;
  *(_OWORD *)(v0 + 648) = v67;
  *(_OWORD *)(v0 + 664) = v66;
  *(void *)(v0 + 680) = v68;
  *(void *)(v0 + 688) = v69;
  *(_OWORD *)(v0 + 696) = v70;
  *(void *)(v0 + 712) = v71;
  *(void *)(v0 + 720) = v9;
  *(void *)(v0 + 728) = v90;
  *(void *)(v0 + 736) = v10;
  *(void *)(v0 + 744) = v89;
  *(void *)(v0 + 752) = v11;
  *(void *)(v0 + 760) = v88;
  *(void *)(v0 + 768) = v87;
  *(void *)(v0 + 776) = v86;
  *(void *)(v0 + 784) = v85;
  *(void *)(v0 + 792) = v84;
  *(void *)(v0 + 800) = v83;
  *(void *)(v0 + 808) = v82;
  *(void *)(v0 + 624) = v82;
  long long v72 = *(_OWORD *)(v0 + 680);
  *(_OWORD *)(v0 + 480) = *(_OWORD *)(v0 + 664);
  *(_OWORD *)(v0 + 496) = v72;
  long long v73 = *(_OWORD *)(v0 + 744);
  *(_OWORD *)(v0 + 544) = *(_OWORD *)(v0 + 728);
  *(_OWORD *)(v0 + 560) = v73;
  long long v74 = *(_OWORD *)(v0 + 712);
  *(_OWORD *)(v0 + 512) = *(_OWORD *)(v0 + 696);
  *(_OWORD *)(v0 + 528) = v74;
  long long v75 = *(_OWORD *)(v0 + 792);
  long long v76 = *(_OWORD *)(v0 + 760);
  *(_OWORD *)(v0 + 592) = *(_OWORD *)(v0 + 776);
  *(_OWORD *)(v0 + 608) = v75;
  *(_OWORD *)(v0 + 576) = v76;
  long long v77 = *(_OWORD *)(v0 + 648);
  *(_OWORD *)(v0 + 448) = *(_OWORD *)(v0 + 632);
  *(_OWORD *)(v0 + 464) = v77;
  sub_10003D260(v0 + 448);
  sub_100030EBC(v0 + 632);
  long long v78 = (void *)swift_task_alloc();
  *(void *)(v0 + 1376) = v78;
  void *v78 = v0;
  v78[1] = sub_100041B9C;
  return sub_100039F54();
}

uint64_t sub_10004129C()
{
  uint64_t v2 = *(void *)(*(void *)v1 + 1336);
  uint64_t v3 = *(void *)(*(void *)v1 + 1328);
  uint64_t v4 = *(void *)(*(void *)v1 + 1320);
  *(void *)(*(void *)v1 + 1352) = v0;
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  if (v0) {
    uint64_t v5 = sub_100041B38;
  }
  else {
    uint64_t v5 = sub_10004140C;
  }
  return _swift_task_switch(v5, 0, 0);
}

uint64_t sub_10004140C()
{
  uint64_t v97 = v0;
  uint64_t v1 = v0 + 16;
  uint64_t v88 = v0 + 232;
  uint64_t v2 = *(void *)(v0 + 1312);
  char v3 = *(unsigned char *)(v0 + 226);
  swift_retain();
  uint64_t v4 = &stru_10007A000;
  if (v3)
  {
    sub_10003E8B8((unint64_t *)(v0 + 1168));
    uint64_t v14 = *(void *)(v0 + 1168);
    uint64_t v6 = *(void *)(v0 + 1184);
    uint64_t v86 = *(void *)(v0 + 1192);
    uint64_t v87 = *(void *)(v0 + 1176);
    uint64_t v76 = *(void *)(v0 + 1200);
    uint64_t v84 = *(void *)(v0 + 1216);
    uint64_t v85 = *(void *)(v0 + 1208);
    uint64_t v82 = *(void *)(v0 + 1232);
    uint64_t v83 = *(void *)(v0 + 1224);
    uint64_t v80 = *(void *)(v0 + 1248);
    uint64_t v81 = *(void *)(v0 + 1240);
    uint64_t v79 = *(void *)(v0 + 1256);
    swift_release();
    if (qword_10007A5C0 != -1) {
      swift_once();
    }
    uint64_t v15 = type metadata accessor for Logger();
    sub_10000AF48(v15, (uint64_t)qword_10007DAE0);
    swift_retain();
    uint64_t v16 = Logger.logObject.getter();
    os_log_type_t v17 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v16, v17))
    {
      uint64_t v77 = v6;
      uint64_t v18 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)uint64_t v18 = 134217984;
      uint64_t v19 = *(uint64_t (**)(uint64_t))(**(void **)(*(void *)(v2 + 224) + 16) + 136);
      uint64_t v20 = v14;
      uint64_t v21 = swift_retain();
      uint64_t v22 = *(void *)v19(v21);
      swift_release();
      *(void *)(v0 + 1264) = v22;
      uint64_t v14 = v20;
      uint64_t v4 = &stru_10007A000;
      uint64_t v1 = v0 + 16;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_release();
      _os_log_impl((void *)&_mh_execute_header, v16, v17, "starting new generation %ld", v18, 0xCu);
      uint64_t v6 = v77;
      swift_slowDealloc();
    }
    else
    {
      swift_release();
    }

    uint64_t v5 = v14;
    uint64_t v7 = v76;
  }
  else
  {
    sub_100008630((void *)(v0 + 1072));
    uint64_t v5 = *(void *)(v0 + 1072);
    uint64_t v6 = *(void *)(v0 + 1088);
    uint64_t v86 = *(void *)(v0 + 1096);
    uint64_t v87 = *(void *)(v0 + 1080);
    uint64_t v7 = *(void *)(v0 + 1104);
    uint64_t v84 = *(void *)(v0 + 1120);
    uint64_t v85 = *(void *)(v0 + 1112);
    uint64_t v82 = *(void *)(v0 + 1136);
    uint64_t v83 = *(void *)(v0 + 1128);
    uint64_t v80 = *(void *)(v0 + 1152);
    uint64_t v81 = *(void *)(v0 + 1144);
    uint64_t v79 = *(void *)(v0 + 1160);
    swift_release();
    if (qword_10007A5C0 != -1) {
      swift_once();
    }
    uint64_t v8 = type metadata accessor for Logger();
    sub_10000AF48(v8, (uint64_t)qword_10007DAE0);
    uint64_t v9 = Logger.logObject.getter();
    os_log_type_t v10 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v9, v10))
    {
      uint64_t v11 = *(void *)(v0 + 1304);
      uint64_t v12 = v5;
      unint64_t v13 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)unint64_t v13 = 134217984;
      *(void *)(v0 + 1272) = v11;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl((void *)&_mh_execute_header, v9, v10, "retrying report for generation %ld", v13, 0xCu);
      uint64_t v5 = v12;
      uint64_t v1 = v0 + 16;
      uint64_t v4 = &stru_10007A000;
      swift_slowDealloc();
    }

    uint64_t v14 = *(void *)(v0 + 1304);
  }
  *(void *)(v0 + 1360) = v14;
  sub_100026C14(v88);
  sub_1000084C8(v88, v1, &qword_10007C628);
  uint64_t result = sub_100047070(v1);
  if (result == 1)
  {
    if (v4[46].offs != (int32_t *)-1) {
      swift_once();
    }
    uint64_t v24 = type metadata accessor for Logger();
    sub_10000AF48(v24, (uint64_t)qword_10007DAE0);
    uint64_t v25 = Logger.logObject.getter();
    os_log_type_t v26 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v25, v26))
    {
      uint64_t v27 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v27 = 0;
      _os_log_impl((void *)&_mh_execute_header, v25, v26, "missing kernel counters for splunk report", v27, 2u);
      swift_slowDealloc();
    }
    uint64_t v28 = *(void *)(v0 + 1312);

    uint64_t v29 = *(void *)(v28 + 216);
    goto LABEL_26;
  }
  uint64_t v30 = *(void *)(v0 + 16);
  uint64_t v31 = *(void *)(v0 + 24);
  BOOL v32 = __CFADD__(v30, v31);
  uint64_t v33 = v30 + v31;
  if (v32)
  {
    __break(1u);
    goto LABEL_30;
  }
  uint64_t v34 = *(void *)(v0 + 32);
  BOOL v32 = __CFADD__(v33, v34);
  uint64_t v35 = v33 + v34;
  if (v32)
  {
LABEL_30:
    __break(1u);
    goto LABEL_31;
  }
  uint64_t v36 = *(void *)(v0 + 40);
  uint64_t v37 = v35 + v36;
  if (__CFADD__(v35, v36))
  {
LABEL_31:
    __break(1u);
    goto LABEL_32;
  }
  uint64_t v38 = *(void *)(v0 + 56);
  uint64_t v39 = *(void *)(v0 + 64);
  BOOL v32 = __CFADD__(v38, v39);
  uint64_t v40 = v38 + v39;
  if (v32)
  {
LABEL_32:
    __break(1u);
    goto LABEL_33;
  }
  uint64_t v41 = *(void *)(v0 + 72);
  BOOL v32 = __CFADD__(v40, v41);
  uint64_t v42 = v40 + v41;
  if (v32)
  {
LABEL_33:
    __break(1u);
    goto LABEL_34;
  }
  uint64_t v43 = *(void *)(v0 + 80);
  BOOL v32 = __CFADD__(v42, v43);
  uint64_t v44 = v42 + v43;
  if (v32)
  {
LABEL_34:
    __break(1u);
    return result;
  }
  uint64_t v45 = v7;
  uint64_t v46 = *(void *)(v0 + 128);
  uint64_t v78 = v6;
  uint64_t v47 = *(void *)(v0 + 144);
  uint64_t v48 = *(void *)(v0 + 152);
  uint64_t v89 = v5;
  uint64_t v49 = v44;
  uint64_t v29 = *(void *)(*(void *)(v0 + 1312) + 216);
  uint64_t v50 = v37;
  sub_1000280F4(0x6F436C656E72654BLL, 0xEE00737265746E75, (uint64_t)&v90);
  long long v51 = v91;
  long long v52 = v92;
  uint64_t v53 = v93;
  uint64_t v54 = v94;
  long long v55 = v95;
  uint64_t v56 = v96;
  *(_OWORD *)(v0 + 944) = v90;
  *(_OWORD *)(v0 + 960) = v51;
  *(_OWORD *)(v0 + 976) = v52;
  *(void *)(v0 + 992) = v53;
  *(void *)(v0 + 1000) = v54;
  *(_OWORD *)(v0 + 1008) = v55;
  *(void *)(v0 + 1024) = v56;
  *(void *)(v0 + 1032) = v50;
  *(void *)(v0 + 1040) = v49;
  *(void *)(v0 + 1048) = v46;
  uint64_t v7 = v45;
  *(void *)(v0 + 1056) = v47;
  uint64_t v6 = v78;
  *(void *)(v0 + 1064) = v48;
  uint64_t v5 = v89;
  long long v57 = *(_OWORD *)(v0 + 944);
  long long v58 = *(_OWORD *)(v0 + 960);
  long long v59 = *(_OWORD *)(v0 + 992);
  *(_OWORD *)(v0 + 848) = *(_OWORD *)(v0 + 976);
  *(_OWORD *)(v0 + 864) = v59;
  *(_OWORD *)(v0 + 816) = v57;
  *(_OWORD *)(v0 + 832) = v58;
  long long v60 = *(_OWORD *)(v0 + 1008);
  long long v61 = *(_OWORD *)(v0 + 1024);
  long long v62 = *(_OWORD *)(v0 + 1056);
  *(_OWORD *)(v0 + 912) = *(_OWORD *)(v0 + 1040);
  *(_OWORD *)(v0 + 928) = v62;
  *(_OWORD *)(v0 + 880) = v60;
  *(_OWORD *)(v0 + 896) = v61;
  sub_10003CE9C((long long *)(v0 + 816));
  sub_100030EBC(v0 + 944);
LABEL_26:
  *(void *)(v0 + 1368) = v29;
  sub_1000280F4(0x756F43746E657645, 0xED0000737265746ELL, (uint64_t)&v90);
  long long v64 = v91;
  long long v63 = v92;
  uint64_t v65 = v93;
  uint64_t v66 = v94;
  long long v67 = v95;
  uint64_t v68 = v96;
  *(_OWORD *)(v0 + 632) = v90;
  *(_OWORD *)(v0 + 648) = v64;
  *(_OWORD *)(v0 + 664) = v63;
  *(void *)(v0 + 680) = v65;
  *(void *)(v0 + 688) = v66;
  *(_OWORD *)(v0 + 696) = v67;
  *(void *)(v0 + 712) = v68;
  *(void *)(v0 + 720) = v5;
  *(void *)(v0 + 728) = v87;
  *(void *)(v0 + 736) = v6;
  *(void *)(v0 + 744) = v86;
  *(void *)(v0 + 752) = v7;
  *(void *)(v0 + 760) = v85;
  *(void *)(v0 + 768) = v84;
  *(void *)(v0 + 776) = v83;
  *(void *)(v0 + 784) = v82;
  *(void *)(v0 + 792) = v81;
  *(void *)(v0 + 800) = v80;
  *(void *)(v0 + 808) = v79;
  *(void *)(v0 + 624) = v79;
  long long v69 = *(_OWORD *)(v0 + 680);
  *(_OWORD *)(v0 + 480) = *(_OWORD *)(v0 + 664);
  *(_OWORD *)(v0 + 496) = v69;
  long long v70 = *(_OWORD *)(v0 + 744);
  *(_OWORD *)(v0 + 544) = *(_OWORD *)(v0 + 728);
  *(_OWORD *)(v0 + 560) = v70;
  long long v71 = *(_OWORD *)(v0 + 712);
  *(_OWORD *)(v0 + 512) = *(_OWORD *)(v0 + 696);
  *(_OWORD *)(v0 + 528) = v71;
  long long v72 = *(_OWORD *)(v0 + 792);
  long long v73 = *(_OWORD *)(v0 + 760);
  *(_OWORD *)(v0 + 592) = *(_OWORD *)(v0 + 776);
  *(_OWORD *)(v0 + 608) = v72;
  *(_OWORD *)(v0 + 576) = v73;
  long long v74 = *(_OWORD *)(v0 + 648);
  *(_OWORD *)(v0 + 448) = *(_OWORD *)(v0 + 632);
  *(_OWORD *)(v0 + 464) = v74;
  sub_10003D260(v0 + 448);
  sub_100030EBC(v0 + 632);
  long long v75 = (void *)swift_task_alloc();
  *(void *)(v0 + 1376) = v75;
  *long long v75 = v0;
  v75[1] = sub_100041B9C;
  return sub_100039F54();
}

uint64_t sub_100041B38()
{
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_100041B9C()
{
  uint64_t v1 = (void *)*v0;
  uint64_t v2 = (void *)*v0;
  swift_task_dealloc();
  uint64_t v3 = (void *)swift_task_alloc();
  v1[173] = v3;
  *uint64_t v3 = v2;
  v3[1] = sub_100041D08;
  uint64_t v4 = v1[170];
  uint64_t v5 = v1[160];
  return sub_1000295B8(v5, v4);
}

uint64_t sub_100041D08(char a1)
{
  uint64_t v3 = *(void *)(*v1 + 1360);
  uint64_t v4 = *v1;
  swift_task_dealloc();
  uint64_t v5 = a1 & 1;
  if (v5) {
    uint64_t v3 = 0;
  }
  swift_task_dealloc();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(v4 + 8);
  return v6(v3, v5);
}

uint64_t sub_100041E4C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6)
{
  *(unsigned char *)(v7 + 104) = a6;
  *(void *)(v7 + 80) = a5;
  *(void *)(v7 + 88) = v6;
  *(void *)(v7 + 64) = a3;
  *(void *)(v7 + 72) = a4;
  *(void *)(v7 + 48) = a1;
  *(void *)(v7 + 56) = a2;
  sub_1000082E0(&qword_10007C038);
  *(void *)(v7 + 96) = swift_task_alloc();
  return _swift_task_switch(sub_100041EEC, 0, 0);
}

uint64_t sub_100041EEC()
{
  uint64_t v1 = *(void *)(v0 + 96);
  char v13 = *(unsigned char *)(v0 + 104);
  uint64_t v12 = *(void *)(v0 + 80);
  uint64_t v2 = *(void *)(v0 + 56);
  uint64_t v3 = *(uint64_t (**)(uint64_t))(**(void **)(*(void *)(*(void *)(v0 + 88) + 224) + 16) + 136);
  uint64_t v4 = swift_retain();
  uint64_t v5 = *(void *)v3(v4);
  swift_release();
  *(void *)(v0 + 16) = v2;
  swift_getKeyPath();
  uint64_t v6 = swift_task_alloc();
  *(void *)(v6 + 16) = v2;
  *(void *)(v6 + 24) = v5;
  sub_100005D3C(&qword_10007BEE0, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV2.PipelineState);
  ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)();
  swift_release();
  swift_task_dealloc();
  Duration.components.getter();
  Date.init(timeIntervalSinceNow:)();
  uint64_t v7 = type metadata accessor for Date();
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v1, 0, 1, v7);
  *(void *)(v0 + 24) = v2;
  swift_getKeyPath();
  uint64_t v8 = swift_task_alloc();
  *(void *)(v8 + 16) = v2;
  *(void *)(v8 + 24) = v1;
  ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)();
  swift_release();
  swift_task_dealloc();
  sub_100008590(v1, &qword_10007C038);
  *(void *)(v0 + 32) = v2;
  swift_getKeyPath();
  uint64_t v9 = swift_task_alloc();
  *(void *)(v9 + 16) = v2;
  *(void *)(v9 + 24) = v12;
  *(unsigned char *)(v9 + 32) = v13 & 1;
  ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)();
  swift_release();
  swift_task_dealloc();
  dispatch thunk of ModelContext.save()();
  swift_task_dealloc();
  os_log_type_t v10 = *(uint64_t (**)(void))(v0 + 8);
  return v10();
}

uint64_t sub_10004239C(uint64_t a1)
{
  *(void *)(v2 + 120) = a1;
  *(void *)(v2 + 128) = v1;
  return _swift_task_switch(sub_1000423BC, 0, 0);
}

uint64_t sub_1000423BC()
{
  sub_10001B14C();
  uint64_t v1 = v0[16];
  swift_retain();
  sub_1000199B8(v0 + 2);
  sub_10003EB50(v0 + 2);
  swift_release();
  uint64_t v2 = sub_10001AD34();
  uint64_t v3 = *(void *)(v1 + 224);
  v0[14] = v2;
  swift_getKeyPath();
  sub_100005D3C(&qword_10007BEE0, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV2.PipelineState);
  swift_retain();
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  swift_getKeyPath();
  sub_100005D3C(&qword_10007BFD8, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV2.PipelineState);
  PersistentModel.getValue<A>(forKey:)();
  uint64_t v4 = swift_release();
  uint64_t v5 = v0[14];
  *(void *)(*(uint64_t (**)(uint64_t))(**(void **)(v3 + 16) + 136))(v4) = v5;
  swift_release();
  swift_release();
  uint64_t v6 = (uint64_t (*)(uint64_t))v0[1];
  return v6(v2);
}

uint64_t sub_1000425FC()
{
  v1[9] = v0;
  sub_1000082E0(&qword_10007D440);
  v1[10] = swift_task_alloc();
  uint64_t v2 = sub_1000082E0(&qword_10007D4B8);
  v1[11] = v2;
  v1[12] = *(void *)(v2 - 8);
  v1[13] = swift_task_alloc();
  uint64_t v3 = sub_1000082E0(&qword_10007CCD8);
  v1[14] = v3;
  uint64_t v4 = *(void *)(v3 - 8);
  v1[15] = v4;
  v1[16] = *(void *)(v4 + 64);
  v1[17] = swift_task_alloc();
  v1[18] = swift_task_alloc();
  return _swift_task_switch(sub_100042768, 0, 0);
}

uint64_t sub_100042768()
{
  type metadata accessor for AnalyticsStoreContext();
  uint64_t inited = swift_initStackObject();
  v0[19] = inited;
  type metadata accessor for ModelContext();
  swift_allocObject();
  swift_retain();
  *(void *)(inited + 16) = ModelContext.init(_:)();
  uint64_t v2 = (void *)swift_task_alloc();
  v0[20] = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_100042870;
  uint64_t v3 = v0[9];
  v2[15] = inited;
  v2[16] = v3;
  return _swift_task_switch(sub_1000423BC, 0, 0);
}

uint64_t sub_100042870(uint64_t a1)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 168) = a1;
  *(void *)(v3 + 176) = v1;
  swift_task_dealloc();
  if (v1) {
    uint64_t v4 = sub_100043BFC;
  }
  else {
    uint64_t v4 = sub_100042984;
  }
  return _swift_task_switch(v4, 0, 0);
}

uint64_t sub_100042984()
{
  v0[23] = *(void *)(v0[9] + 208);
  uint64_t v1 = (void *)swift_task_alloc();
  v0[24] = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_100042A1C;
  return sub_10003471C();
}

uint64_t sub_100042A1C()
{
  *(void *)(*(void *)v1 + 200) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_100043C90;
  }
  else {
    uint64_t v2 = sub_100042B30;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_100042B30()
{
  uint64_t v1 = v0[23];
  uint64_t v3 = v0[12];
  uint64_t v2 = (void *)v0[13];
  uint64_t v4 = v0[11];
  sub_100025E5C();
  *uint64_t v2 = 1024;
  (*(void (**)(void *, void, uint64_t))(v3 + 104))(v2, enum case for AsyncStream.Continuation.BufferingPolicy.bufferingNewest<A>(_:), v4);
  AsyncStream.init(_:bufferingPolicy:_:)();
  sub_100035954();
  uint64_t v5 = *(void *)(v1 + 72);
  v0[26] = v5;
  return _swift_task_switch(sub_100042C24, v5, 0);
}

uint64_t sub_100042C24()
{
  sub_100038328();
  return _swift_task_switch(sub_100042C8C, 0, 0);
}

uint64_t sub_100042C8C()
{
  uint64_t v1 = *(void *)(v0 + 184);
  uint64_t v3 = *(void *)(v0 + 136);
  uint64_t v2 = *(void *)(v0 + 144);
  uint64_t v36 = v2;
  uint64_t v37 = *(void *)(v0 + 168);
  uint64_t v5 = *(void *)(v0 + 120);
  uint64_t v4 = *(void *)(v0 + 128);
  uint64_t v6 = *(void *)(v0 + 112);
  uint64_t v7 = *(void *)(v0 + 72);
  uint64_t v8 = *(void *)(v0 + 80);
  uint64_t v9 = type metadata accessor for TaskPriority();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v8, 1, 1, v9);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(v3, v2, v6);
  unint64_t v10 = (*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  unint64_t v11 = (v4 + v10 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = 0;
  *(void *)(v12 + 24) = 0;
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v5 + 32))(v12 + v10, v3, v6);
  *(void *)(v12 + v11) = v1;
  swift_retain();
  *(void *)(v0 + 216) = sub_10003D644(v8, (uint64_t)&unk_10007D4C0, v12);
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v36, v6);
  sub_10003F6FC();
  sub_10003FC20();
  *(void *)(v0 + 224) = *(void *)(v7 + 216);
  uint64_t v13 = sub_10002BDB8(v37);
  if (v15)
  {
    *(unsigned char *)(v0 + 50) = 1;
    *(void *)(v0 + 256) = 0;
    uint64_t v23 = sub_10002C3A4(0);
    if (v25)
    {
      if (qword_10007A5C0 != -1) {
        swift_once();
      }
      uint64_t v31 = type metadata accessor for Logger();
      *(void *)(v0 + 312) = sub_10000AF48(v31, (uint64_t)qword_10007DAE0);
      BOOL v32 = Logger.logObject.getter();
      os_log_type_t v33 = static os_log_type_t.info.getter();
      if (os_log_type_enabled(v32, v33))
      {
        uint64_t v34 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v34 = 0;
        _os_log_impl((void *)&_mh_execute_header, v32, v33, "reporting disabled", v34, 2u);
        swift_slowDealloc();
      }

      uint64_t v35 = (void *)swift_task_alloc();
      *(void *)(v0 + 320) = v35;
      *uint64_t v35 = v0;
      v35[1] = sub_1000439C8;
      return Task<>.value.getter();
    }
    else
    {
      uint64_t v26 = v23;
      uint64_t v27 = v24;
      *(void *)(v0 + 264) = v24;
      *(void *)(v0 + 272) = v23;
      uint64_t v28 = (void *)swift_task_alloc();
      *(void *)(v0 + 280) = v28;
      *uint64_t v28 = v0;
      v28[1] = sub_1000434CC;
      uint64_t v29 = *(void *)(v0 + 168);
      uint64_t v30 = *(void *)(v0 + 152);
      return sub_100041E4C(v30, v29, v26, v27, 0, 1);
    }
  }
  else
  {
    uint64_t v16 = v13;
    uint64_t v17 = v14;
    *(void *)(v0 + 64) = *(void *)(v0 + 168);
    swift_getKeyPath();
    sub_100005D3C(&qword_10007BEE0, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV2.PipelineState);
    ObservationRegistrar.access<A, B>(_:keyPath:)();
    swift_release();
    swift_getKeyPath();
    sub_100005D3C(&qword_10007BFD8, (void (*)(uint64_t))type metadata accessor for AnalyticsSchemaV2.PipelineState);
    sub_10002FA04();
    PersistentModel.getValue<A>(forKey:)();
    swift_release();
    uint64_t v18 = *(void *)(v0 + 40);
    char v19 = *(unsigned char *)(v0 + 48);
    uint64_t v20 = (void *)swift_task_alloc();
    *(void *)(v0 + 232) = v20;
    *uint64_t v20 = v0;
    v20[1] = sub_100043170;
    uint64_t v21 = *(void *)(v0 + 152);
    return sub_1000409CC(v21, v16, v17, 0, v18, v19);
  }
}

uint64_t sub_100043170(uint64_t a1, char a2)
{
  uint64_t v6 = *v3;
  *(void *)(*v3 + 240) = v2;
  swift_task_dealloc();
  if (v2)
  {
    uint64_t v7 = sub_100043D30;
  }
  else
  {
    *(unsigned char *)(v6 + 49) = a2;
    *(void *)(v6 + 248) = a1;
    uint64_t v7 = sub_1000432A8;
  }
  return _swift_task_switch(v7, 0, 0);
}

uint64_t sub_1000432A8()
{
  uint64_t v1 = *(void *)(v0 + 248);
  char v2 = *(unsigned char *)(v0 + 49) & 1;
  *(unsigned char *)(v0 + 50) = v2;
  *(void *)(v0 + 256) = v1;
  uint64_t v3 = sub_10002C3A4(v2 == 0);
  if (v5)
  {
    if (qword_10007A5C0 != -1) {
      swift_once();
    }
    uint64_t v12 = type metadata accessor for Logger();
    *(void *)(v0 + 312) = sub_10000AF48(v12, (uint64_t)qword_10007DAE0);
    uint64_t v13 = Logger.logObject.getter();
    os_log_type_t v14 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v13, v14))
    {
      char v15 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)char v15 = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, v14, "reporting disabled", v15, 2u);
      swift_slowDealloc();
    }

    uint64_t v16 = (void *)swift_task_alloc();
    *(void *)(v0 + 320) = v16;
    *uint64_t v16 = v0;
    v16[1] = sub_1000439C8;
    return Task<>.value.getter();
  }
  else
  {
    uint64_t v6 = v3;
    uint64_t v7 = v4;
    *(void *)(v0 + 264) = v4;
    *(void *)(v0 + 272) = v3;
    uint64_t v8 = (void *)swift_task_alloc();
    *(void *)(v0 + 280) = v8;
    *uint64_t v8 = v0;
    v8[1] = sub_1000434CC;
    uint64_t v9 = *(void *)(v0 + 168);
    uint64_t v10 = *(void *)(v0 + 152);
    return sub_100041E4C(v10, v9, v6, v7, v1, v2);
  }
}

uint64_t sub_1000434CC()
{
  uint64_t v1 = (void *)*v0;
  char v2 = (void *)*v0;
  char v3 = *(unsigned char *)(*v0 + 50);
  uint64_t v4 = *v0;
  swift_task_dealloc();
  char v5 = (void *)swift_task_alloc();
  v2[36] = v5;
  void *v5 = v4;
  v5[1] = sub_10004366C;
  uint64_t v6 = v1[34];
  uint64_t v7 = v1[33];
  uint64_t v8 = v1[32];
  uint64_t v9 = v1[19];
  return sub_1000409CC(v9, v6, v7, 0, v8, v3);
}

uint64_t sub_10004366C(uint64_t a1, char a2)
{
  uint64_t v6 = *v3;
  *(void *)(*v3 + 296) = v2;
  swift_task_dealloc();
  if (v2)
  {
    uint64_t v7 = sub_100043DDC;
  }
  else
  {
    *(unsigned char *)(v6 + 51) = a2;
    *(void *)(v6 + 304) = a1;
    uint64_t v7 = sub_1000437A4;
  }
  return _swift_task_switch(v7, 0, 0);
}

uint64_t sub_1000437A4()
{
  uint64_t v1 = *(void *)(v0 + 304);
  char v2 = *(unsigned char *)(v0 + 51) & 1;
  *(unsigned char *)(v0 + 50) = v2;
  *(void *)(v0 + 256) = v1;
  uint64_t v3 = sub_10002C3A4(v2 == 0);
  if (v5)
  {
    if (qword_10007A5C0 != -1) {
      swift_once();
    }
    uint64_t v12 = type metadata accessor for Logger();
    *(void *)(v0 + 312) = sub_10000AF48(v12, (uint64_t)qword_10007DAE0);
    uint64_t v13 = Logger.logObject.getter();
    os_log_type_t v14 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v13, v14))
    {
      char v15 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)char v15 = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, v14, "reporting disabled", v15, 2u);
      swift_slowDealloc();
    }

    uint64_t v16 = (void *)swift_task_alloc();
    *(void *)(v0 + 320) = v16;
    *uint64_t v16 = v0;
    v16[1] = sub_1000439C8;
    return Task<>.value.getter();
  }
  else
  {
    uint64_t v6 = v3;
    uint64_t v7 = v4;
    *(void *)(v0 + 264) = v4;
    *(void *)(v0 + 272) = v3;
    uint64_t v8 = (void *)swift_task_alloc();
    *(void *)(v0 + 280) = v8;
    *uint64_t v8 = v0;
    v8[1] = sub_1000434CC;
    uint64_t v9 = *(void *)(v0 + 168);
    uint64_t v10 = *(void *)(v0 + 152);
    return sub_100041E4C(v10, v9, v6, v7, v1, v2);
  }
}

uint64_t sub_1000439C8()
{
  swift_task_dealloc();
  return _swift_task_switch(sub_100043AC4, 0, 0);
}

uint64_t sub_100043AC4()
{
  uint64_t v1 = Logger.logObject.getter();
  os_log_type_t v2 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "analytics collector task terminated unexpectedly", v3, 2u);
    swift_slowDealloc();
  }
  swift_release();
  swift_release();
  swift_setDeallocating();
  swift_release();

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
  return v4();
}

uint64_t sub_100043BFC()
{
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_100043C90()
{
  swift_release();
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_100043D30()
{
  swift_release();
  swift_release();
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_100043DDC()
{
  uint64_t v1 = &stru_10007A000;
  if (qword_10007A5C0 != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for Logger();
  sub_10000AF48(v2, (uint64_t)qword_10007DAE0);
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v3 = Logger.logObject.getter();
  os_log_type_t v4 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v3, v4))
  {
    char v5 = (uint8_t *)swift_slowAlloc();
    uint64_t v6 = (void *)swift_slowAlloc();
    *(_DWORD *)char v5 = 138412290;
    swift_errorRetain();
    uint64_t v7 = _swift_stdlib_bridgeErrorToNSError();
    *(void *)(v0 + 56) = v7;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *uint64_t v6 = v7;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "report failed: %@", v5, 0xCu);
    sub_1000082E0(&qword_10007BFB8);
    char v8 = 1;
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    swift_errorRelease();
    uint64_t v9 = *(void *)(v0 + 256);
    if (*(unsigned char *)(v0 + 50))
    {
      uint64_t v1 = &stru_10007A000;
LABEL_7:
      char v8 = 0;
      char v10 = 1;
      goto LABEL_10;
    }
    char v10 = 0;
    uint64_t v1 = &stru_10007A000;
  }
  else
  {
    swift_errorRelease();
    swift_errorRelease();
    swift_errorRelease();

    uint64_t v9 = *(void *)(v0 + 256);
    if (*(unsigned char *)(v0 + 50)) {
      goto LABEL_7;
    }
    char v10 = 0;
    char v8 = 1;
  }
LABEL_10:
  *(unsigned char *)(v0 + 50) = v10;
  *(void *)(v0 + 256) = v9;
  uint64_t v11 = sub_10002C3A4(v8);
  if (v13)
  {
    if (v1[46].offs != (int32_t *)-1) {
      swift_once();
    }
    *(void *)(v0 + 312) = sub_10000AF48(v2, (uint64_t)qword_10007DAE0);
    uint64_t v20 = Logger.logObject.getter();
    os_log_type_t v21 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v20, v21))
    {
      uint64_t v22 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v22 = 0;
      _os_log_impl((void *)&_mh_execute_header, v20, v21, "reporting disabled", v22, 2u);
      swift_slowDealloc();
    }

    uint64_t v23 = (void *)swift_task_alloc();
    *(void *)(v0 + 320) = v23;
    void *v23 = v0;
    v23[1] = sub_1000439C8;
    return Task<>.value.getter();
  }
  else
  {
    uint64_t v14 = v11;
    uint64_t v15 = v12;
    *(void *)(v0 + 264) = v12;
    *(void *)(v0 + 272) = v11;
    uint64_t v16 = (void *)swift_task_alloc();
    *(void *)(v0 + 280) = v16;
    *uint64_t v16 = v0;
    v16[1] = sub_1000434CC;
    uint64_t v17 = *(void *)(v0 + 168);
    uint64_t v18 = *(void *)(v0 + 152);
    return sub_100041E4C(v18, v17, v14, v15, v9, v10);
  }
}

uint64_t sub_1000441E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 24) = a4;
  return _swift_task_switch(sub_100044200, 0, 0);
}

uint64_t sub_100044200()
{
  uint64_t v1 = v0[3];
  type metadata accessor for AnalyticsManager();
  v0[4] = swift_allocObject();
  sub_100046368(v1);
  sub_10003F3E8(v1);
  uint64_t v2 = (void *)swift_task_alloc();
  v0[5] = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_1000444AC;
  return sub_1000425FC();
}

uint64_t sub_1000444AC()
{
  *(void *)(*(void *)v1 + 48) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_100044620;
  }
  else {
    uint64_t v2 = sub_1000445C0;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_1000445C0()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_100044620()
{
  swift_release();
  if (qword_10007A5C0 != -1) {
    swift_once();
  }
  uint64_t v1 = type metadata accessor for Logger();
  sub_10000AF48(v1, (uint64_t)qword_10007DAE0);
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v2 = Logger.logObject.getter();
  os_log_type_t v3 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    char v5 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v4 = 138412290;
    swift_errorRetain();
    uint64_t v6 = _swift_stdlib_bridgeErrorToNSError();
    *(void *)(v0 + 16) = v6;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    void *v5 = v6;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "failed to init AnalyticsManager: %@", v4, 0xCu);
    sub_1000082E0(&qword_10007BFB8);
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
  uint64_t v7 = *(uint64_t (**)(void))(v0 + 8);
  return v7();
}

uint64_t sub_100044824()
{
  long long v1 = v0[10];
  v7[8] = v0[9];
  v7[9] = v1;
  v7[10] = v0[11];
  long long v2 = v0[6];
  v7[4] = v0[5];
  v7[5] = v2;
  long long v3 = v0[8];
  _OWORD v7[6] = v0[7];
  v7[7] = v3;
  long long v4 = v0[2];
  v7[0] = v0[1];
  v7[1] = v4;
  long long v5 = v0[4];
  v7[2] = v0[3];
  v7[3] = v5;
  sub_100046490((uint64_t)v7);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for AnalyticsManager()
{
  return self;
}

uint64_t destroy for AnalyticsConfig()
{
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for AnalyticsConfig(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  uint64_t v4 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v4;
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  uint64_t v5 = *(void *)(a2 + 64);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = v5;
  *(_OWORD *)(a1 + 120) = *(_OWORD *)(a2 + 120);
  *(_OWORD *)(a1 + 136) = *(_OWORD *)(a2 + 136);
  *(_OWORD *)(a1 + 152) = *(_OWORD *)(a2 + 152);
  *(void *)(a1 + 168) = *(void *)(a2 + 168);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
  *(_OWORD *)(a1 + 104) = *(_OWORD *)(a2 + 104);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for AnalyticsConfig(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 72);
  *(unsigned char *)(a1 + 80) = *(unsigned char *)(a2 + 80);
  *(void *)(a1 + 72) = v5;
  uint64_t v6 = *(void *)(a2 + 88);
  *(unsigned char *)(a1 + 96) = *(unsigned char *)(a2 + 96);
  *(void *)(a1 + 88) = v6;
  uint64_t v7 = *(void *)(a2 + 104);
  *(unsigned char *)(a1 + 112) = *(unsigned char *)(a2 + 112);
  *(void *)(a1 + 104) = v7;
  uint64_t v8 = *(void *)(a2 + 120);
  *(unsigned char *)(a1 + 128) = *(unsigned char *)(a2 + 128);
  *(void *)(a1 + 120) = v8;
  *(void *)(a1 + 136) = *(void *)(a2 + 136);
  *(void *)(a1 + 144) = *(void *)(a2 + 144);
  *(unsigned char *)(a1 + 152) = *(unsigned char *)(a2 + 152);
  *(unsigned char *)(a1 + 160) = *(unsigned char *)(a2 + 160);
  *(void *)(a1 + 168) = *(void *)(a2 + 168);
  return a1;
}

__n128 initializeWithTake for AnalyticsConfig(uint64_t a1, long long *a2)
{
  long long v2 = *a2;
  long long v3 = a2[2];
  *(_OWORD *)(a1 + 16) = a2[1];
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)a1 = v2;
  long long v4 = a2[3];
  long long v5 = a2[4];
  long long v6 = a2[6];
  *(_OWORD *)(a1 + 80) = a2[5];
  *(_OWORD *)(a1 + 96) = v6;
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)(a1 + 64) = v5;
  __n128 result = (__n128)a2[7];
  long long v8 = a2[8];
  long long v9 = a2[10];
  *(_OWORD *)(a1 + 144) = a2[9];
  *(_OWORD *)(a1 + 160) = v9;
  *(__n128 *)(a1 + 112) = result;
  *(_OWORD *)(a1 + 128) = v8;
  return result;
}

uint64_t assignWithTake for AnalyticsConfig(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  uint64_t v5 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v5;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  uint64_t v6 = *(void *)(a2 + 64);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = v6;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(unsigned char *)(a1 + 80) = *(unsigned char *)(a2 + 80);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  *(unsigned char *)(a1 + 96) = *(unsigned char *)(a2 + 96);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  *(unsigned char *)(a1 + 112) = *(unsigned char *)(a2 + 112);
  *(unsigned char *)(a1 + 128) = *(unsigned char *)(a2 + 128);
  *(void *)(a1 + 120) = *(void *)(a2 + 120);
  *(_OWORD *)(a1 + 136) = *(_OWORD *)(a2 + 136);
  *(unsigned char *)(a1 + 152) = *(unsigned char *)(a2 + 152);
  *(unsigned char *)(a1 + 160) = *(unsigned char *)(a2 + 160);
  *(void *)(a1 + 168) = *(void *)(a2 + 168);
  return a1;
}

uint64_t getEnumTagSinglePayload for AnalyticsConfig(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 176)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  unint64_t v3 = *(void *)(a1 + 32);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for AnalyticsConfig(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)(result + 168) = 0;
    *(_OWORD *)(result + 152) = 0u;
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 176) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 176) = 0;
    }
    if (a2) {
      *(void *)(result + 32) = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AnalyticsConfig()
{
  return &type metadata for AnalyticsConfig;
}

uint64_t sub_100044C90(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

uint64_t sub_100044CCC(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  int v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *int v4 = v2;
  v4[1] = sub_100044DA8;
  return v6(a1);
}

uint64_t sub_100044DA8()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  long long v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_100044EA0(void (*a1)(void))
{
  a1();

  return _swift_stdlib_bridgeErrorToNSError();
}

uint64_t sub_100044ED8(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_100044F00()
{
  swift_task_dealloc();
  swift_task_dealloc();
  long long v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

unsigned char **sub_100044F6C(unsigned char **result, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v4 = *result;
  *uint64_t v4 = a4;
  *__n128 result = v4 + 1;
  return result;
}

void *sub_100044F7C(void *__src, uint64_t a2, void *__dst, uint64_t a4)
{
  if (__src) {
    uint64_t v5 = a2 - (void)__src;
  }
  else {
    uint64_t v5 = 0;
  }
  if (!__dst)
  {
    if (v5 <= 0) {
      return __src;
    }
LABEL_12:
    __src = (void *)_fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
    return __src;
  }
  if (a4 - (uint64_t)__dst < v5) {
    goto LABEL_12;
  }
  if (__src)
  {
    return memmove(__dst, __src, a2 - (void)__src);
  }
  return __src;
}

void sub_100045020(uint64_t *a1, void **a2, uint64_t a3, uint64_t (*a4)(void))
{
  uint64_t v6 = (void *)a4();
  uint64_t v7 = *a1 + 8;
  UnsafeMutableRawBufferPointer.copyMemory(from:)();
  *a1 = v7;
  long long v8 = *a2;
  if (*a2)
  {
    *long long v8 = v6;
    *a2 = v8 + 1;
  }
  else
  {
  }
}

uint64_t sub_1000450D8@<X0>(uint64_t (*a1)(void)@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = a1();
  *a2 = result;
  return result;
}

uint64_t sub_100045108(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for String.Encoding();
  __chkstk_darwin(v2 - 8);
  v18[3] = &type metadata for ProcessAnalyticsReport;
  v18[4] = sub_100047878();
  v18[5] = sub_1000478CC();
  uint64_t v3 = swift_allocObject();
  v18[0] = v3;
  long long v4 = *(_OWORD *)(a1 + 80);
  *(_OWORD *)(v3 + 80) = *(_OWORD *)(a1 + 64);
  *(_OWORD *)(v3 + 96) = v4;
  *(_OWORD *)(v3 + 112) = *(_OWORD *)(a1 + 96);
  *(void *)(v3 + 128) = *(void *)(a1 + 112);
  long long v5 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(v3 + 16) = *(_OWORD *)a1;
  *(_OWORD *)(v3 + 32) = v5;
  long long v6 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)(v3 + 48) = *(_OWORD *)(a1 + 32);
  *(_OWORD *)(v3 + 64) = v6;
  sub_10000B090(v18, (uint64_t)&type metadata for ProcessAnalyticsReport);
  sub_100047768(a1);
  swift_retain();
  uint64_t v7 = dispatch thunk of JSONEncoder.encode<A>(_:)();
  unint64_t v9 = v8;
  swift_release();
  static String.Encoding.utf8.getter();
  uint64_t v10 = String.init(data:encoding:)();
  if (v11)
  {
    uint64_t v12 = v10;
    sub_100024478(v7, v9);
  }
  else
  {
    if (qword_10007A5C0 != -1) {
      swift_once();
    }
    uint64_t v14 = type metadata accessor for Logger();
    sub_10000AF48(v14, (uint64_t)qword_10007DAE0);
    uint64_t v15 = Logger.logObject.getter();
    os_log_type_t v16 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v15, v16))
    {
      uint64_t v17 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v17 = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, v16, "JSON utf8 conversion failed", v17, 2u);
      swift_slowDealloc();
    }
    sub_100024478(v7, v9);

    uint64_t v12 = 0;
  }
  sub_100008540((uint64_t)v18);
  return v12;
}

uint64_t sub_100045408(_OWORD *a1)
{
  uint64_t v2 = type metadata accessor for String.Encoding();
  __chkstk_darwin(v2 - 8);
  v19[3] = &type metadata for FileAnalyticsReport;
  v19[4] = sub_100047658();
  Swift::String v19[5] = sub_1000476AC();
  uint64_t v3 = (_OWORD *)swift_allocObject();
  v19[0] = v3;
  long long v4 = a1[7];
  v3[7] = a1[6];
  v3[8] = v4;
  v3[9] = a1[8];
  long long v5 = a1[3];
  v3[3] = a1[2];
  v3[4] = v5;
  long long v6 = a1[5];
  v3[5] = a1[4];
  v3[6] = v6;
  long long v7 = a1[1];
  v3[1] = *a1;
  v3[2] = v7;
  sub_10000B090(v19, (uint64_t)&type metadata for FileAnalyticsReport);
  sub_100030FD0((uint64_t)a1);
  swift_retain();
  uint64_t v8 = dispatch thunk of JSONEncoder.encode<A>(_:)();
  unint64_t v10 = v9;
  swift_release();
  static String.Encoding.utf8.getter();
  uint64_t v11 = String.init(data:encoding:)();
  if (v12)
  {
    uint64_t v13 = v11;
    sub_100024478(v8, v10);
  }
  else
  {
    if (qword_10007A5C0 != -1) {
      swift_once();
    }
    uint64_t v15 = type metadata accessor for Logger();
    sub_10000AF48(v15, (uint64_t)qword_10007DAE0);
    os_log_type_t v16 = Logger.logObject.getter();
    os_log_type_t v17 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v16, v17))
    {
      uint64_t v18 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v18 = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, v17, "JSON utf8 conversion failed", v18, 2u);
      swift_slowDealloc();
    }
    sub_100024478(v8, v10);

    uint64_t v13 = 0;
  }
  sub_100008540((uint64_t)v19);
  return v13;
}

uint64_t sub_100045708(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for String.Encoding();
  __chkstk_darwin(v2 - 8);
  v20[3] = &type metadata for EventCounterReport;
  v20[4] = sub_1000471C8();
  v20[5] = sub_10004721C();
  uint64_t v3 = swift_allocObject();
  v20[0] = v3;
  long long v4 = *(_OWORD *)(a1 + 144);
  *(_OWORD *)(v3 + 144) = *(_OWORD *)(a1 + 128);
  *(_OWORD *)(v3 + 160) = v4;
  *(_OWORD *)(v3 + 176) = *(_OWORD *)(a1 + 160);
  *(void *)(v3 + 192) = *(void *)(a1 + 176);
  long long v5 = *(_OWORD *)(a1 + 80);
  *(_OWORD *)(v3 + 80) = *(_OWORD *)(a1 + 64);
  *(_OWORD *)(v3 + 96) = v5;
  long long v6 = *(_OWORD *)(a1 + 112);
  *(_OWORD *)(v3 + 112) = *(_OWORD *)(a1 + 96);
  *(_OWORD *)(v3 + 128) = v6;
  long long v7 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(v3 + 16) = *(_OWORD *)a1;
  *(_OWORD *)(v3 + 32) = v7;
  long long v8 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)(v3 + 48) = *(_OWORD *)(a1 + 32);
  *(_OWORD *)(v3 + 64) = v8;
  sub_10000B090(v20, (uint64_t)&type metadata for EventCounterReport);
  sub_100030E50(a1);
  swift_retain();
  uint64_t v9 = dispatch thunk of JSONEncoder.encode<A>(_:)();
  unint64_t v11 = v10;
  swift_release();
  static String.Encoding.utf8.getter();
  uint64_t v12 = String.init(data:encoding:)();
  if (v13)
  {
    uint64_t v14 = v12;
    sub_100024478(v9, v11);
  }
  else
  {
    if (qword_10007A5C0 != -1) {
      swift_once();
    }
    uint64_t v16 = type metadata accessor for Logger();
    sub_10000AF48(v16, (uint64_t)qword_10007DAE0);
    os_log_type_t v17 = Logger.logObject.getter();
    os_log_type_t v18 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v17, v18))
    {
      char v19 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)char v19 = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, v18, "JSON utf8 conversion failed", v19, 2u);
      swift_slowDealloc();
    }
    sub_100024478(v9, v11);

    uint64_t v14 = 0;
  }
  sub_100008540((uint64_t)v20);
  return v14;
}

uint64_t sub_100045A18(_OWORD *a1)
{
  uint64_t v2 = type metadata accessor for String.Encoding();
  __chkstk_darwin(v2 - 8);
  v19[3] = &type metadata for KernelCounterReport;
  v19[4] = sub_10004708C();
  Swift::String v19[5] = sub_1000470E0();
  uint64_t v3 = (_OWORD *)swift_allocObject();
  v19[0] = v3;
  long long v4 = a1[5];
  v3[5] = a1[4];
  v3[6] = v4;
  long long v5 = a1[7];
  v3[7] = a1[6];
  v3[8] = v5;
  long long v6 = a1[1];
  v3[1] = *a1;
  v3[2] = v6;
  long long v7 = a1[3];
  v3[3] = a1[2];
  v3[4] = v7;
  sub_10000B090(v19, (uint64_t)&type metadata for KernelCounterReport);
  sub_100030E50((uint64_t)a1);
  swift_retain();
  uint64_t v8 = dispatch thunk of JSONEncoder.encode<A>(_:)();
  unint64_t v10 = v9;
  swift_release();
  static String.Encoding.utf8.getter();
  uint64_t v11 = String.init(data:encoding:)();
  if (v12)
  {
    uint64_t v13 = v11;
    sub_100024478(v8, v10);
  }
  else
  {
    if (qword_10007A5C0 != -1) {
      swift_once();
    }
    uint64_t v15 = type metadata accessor for Logger();
    sub_10000AF48(v15, (uint64_t)qword_10007DAE0);
    uint64_t v16 = Logger.logObject.getter();
    os_log_type_t v17 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v16, v17))
    {
      os_log_type_t v18 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)os_log_type_t v18 = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, v17, "JSON utf8 conversion failed", v18, 2u);
      swift_slowDealloc();
    }
    sub_100024478(v8, v10);

    uint64_t v13 = 0;
  }
  sub_100008540((uint64_t)v19);
  return v13;
}

uint64_t sub_100045D10(_OWORD *a1)
{
  uint64_t v2 = type metadata accessor for String.Encoding();
  __chkstk_darwin(v2 - 8);
  v17[3] = &type metadata for FileAnalyticsEvent;
  v17[4] = sub_10004748C();
  v17[5] = sub_1000474E0();
  uint64_t v3 = (_OWORD *)swift_allocObject();
  v17[0] = v3;
  long long v4 = a1[3];
  v3[3] = a1[2];
  v3[4] = v4;
  v3[5] = a1[4];
  long long v5 = a1[1];
  v3[1] = *a1;
  v3[2] = v5;
  sub_10000B090(v17, (uint64_t)&type metadata for FileAnalyticsEvent);
  sub_100047574((uint64_t)a1);
  swift_retain();
  uint64_t v6 = dispatch thunk of JSONEncoder.encode<A>(_:)();
  unint64_t v8 = v7;
  swift_release();
  static String.Encoding.utf8.getter();
  uint64_t v9 = String.init(data:encoding:)();
  if (v10)
  {
    uint64_t v11 = v9;
    sub_100024478(v6, v8);
  }
  else
  {
    if (qword_10007A5C0 != -1) {
      swift_once();
    }
    uint64_t v13 = type metadata accessor for Logger();
    sub_10000AF48(v13, (uint64_t)qword_10007DAE0);
    uint64_t v14 = Logger.logObject.getter();
    os_log_type_t v15 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v14, v15))
    {
      uint64_t v16 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v16 = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, v15, "JSON utf8 conversion failed", v16, 2u);
      swift_slowDealloc();
    }
    sub_100024478(v6, v8);

    uint64_t v11 = 0;
  }
  sub_100008540((uint64_t)v17);
  return v11;
}

uint64_t sub_100046000(_OWORD *a1)
{
  sub_1000082E0(&qword_10007D440);
  __chkstk_darwin();
  uint64_t v3 = (char *)v18 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for TaskPriority();
  uint64_t v5 = *(void *)(v4 - 8);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56))(v3, 1, 1, v4);
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = 0;
  *(void *)(v6 + 24) = 0;
  long long v7 = a1[9];
  *(_OWORD *)(v6 + 160) = a1[8];
  *(_OWORD *)(v6 + 176) = v7;
  *(_OWORD *)(v6 + 192) = a1[10];
  long long v8 = a1[5];
  *(_OWORD *)(v6 + 96) = a1[4];
  *(_OWORD *)(v6 + 112) = v8;
  long long v9 = a1[7];
  *(_OWORD *)(v6 + 128) = a1[6];
  *(_OWORD *)(v6 + 144) = v9;
  long long v10 = a1[1];
  *(_OWORD *)(v6 + 32) = *a1;
  *(_OWORD *)(v6 + 48) = v10;
  long long v11 = a1[3];
  *(_OWORD *)(v6 + 64) = a1[2];
  *(_OWORD *)(v6 + 80) = v11;
  int v12 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v5 + 48))(v3, 1, v4);
  sub_100046368((uint64_t)a1);
  if (v12 == 1)
  {
    sub_100008590((uint64_t)v3, &qword_10007D440);
    uint64_t v13 = 0;
    uint64_t v14 = 0;
  }
  else
  {
    TaskPriority.rawValue.getter();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v3, v4);
    if (*(void *)(v6 + 16))
    {
      swift_getObjectType();
      swift_unknownObjectRetain();
      uint64_t v13 = dispatch thunk of Actor.unownedExecutor.getter();
      uint64_t v14 = v15;
      swift_unknownObjectRelease();
    }
    else
    {
      uint64_t v13 = 0;
      uint64_t v14 = 0;
    }
  }
  uint64_t v16 = swift_allocObject();
  *(void *)(v16 + 16) = &unk_10007D450;
  *(void *)(v16 + 24) = v6;
  if (v14 | v13)
  {
    v18[0] = 0;
    v18[1] = 0;
    _DWORD v18[2] = v13;
    v18[3] = v14;
  }
  swift_task_create();
  return swift_release();
}

uint64_t sub_100046274()
{
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 208, 7);
}

uint64_t sub_1000462BC()
{
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_1000487CC;
  v2[3] = v0 + 32;
  return _swift_task_switch(sub_100044200, 0, 0);
}

uint64_t sub_100046368(uint64_t a1)
{
  return a1;
}

uint64_t sub_1000463A0()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_1000463D8(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_1000487CC;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_10007D458 + dword_10007D458);
  return v6(a1, v4);
}

uint64_t sub_100046490(uint64_t a1)
{
  return a1;
}

uint64_t sub_1000464C8(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000019 && a2 == 0x800000010005DE60
    || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000015 && a2 == 0x800000010005DE80 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x6F7463656C6C6F63 && a2 == 0xEF6769666E6F4372 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x726574726F706572 && a2 == 0xEE006769666E6F43)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else
  {
    char v5 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if (v5) {
      return 3;
    }
    else {
      return 4;
    }
  }
}

uint64_t sub_1000466C4@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v37 = sub_1000082E0(&qword_10007D478);
  uint64_t v5 = *(void *)(v37 - 8);
  __chkstk_darwin(v37);
  long long v7 = (char *)&v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000B090(a1, a1[3]);
  sub_100046B20();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v2) {
    return sub_100008540((uint64_t)a1);
  }
  uint64_t v8 = v5;
  LOBYTE(v43) = 0;
  uint64_t v9 = v37;
  uint64_t v10 = KeyedDecodingContainer.decode(_:forKey:)();
  LOBYTE(v43) = 1;
  uint64_t v36 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
  char v82 = v11 & 1;
  LOBYTE(v65) = 2;
  int v35 = v11;
  sub_100046B74();
  KeyedDecodingContainer.decode<A>(_:forKey:)();
  uint64_t v34 = v44;
  uint64_t v29 = v45;
  uint64_t v30 = v43;
  int v32 = v46;
  uint64_t v12 = v48;
  uint64_t v31 = v47;
  char v83 = 3;
  sub_100046BC8();
  swift_bridgeObjectRetain();
  uint64_t v33 = v12;
  swift_bridgeObjectRetain();
  KeyedDecodingContainer.decode<A>(_:forKey:)();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v7, v9);
  uint64_t v21 = v65;
  uint64_t v22 = v67;
  uint64_t v23 = v69;
  uint64_t v24 = v71;
  uint64_t v37 = v73;
  uint64_t v28 = v74;
  int v26 = v76;
  int v27 = v75;
  uint64_t v25 = v77;
  char v81 = v66;
  char v80 = v68;
  char v79 = v70;
  char v78 = v72;
  char v42 = v35 & 1;
  char v41 = v66;
  char v40 = v68;
  char v39 = v70;
  char v38 = v72;
  sub_100008540((uint64_t)a1);
  uint64_t v13 = v36;
  uint64_t v43 = v10;
  uint64_t v44 = v36;
  LOBYTE(v45) = v82;
  uint64_t v15 = v29;
  uint64_t v14 = v30;
  uint64_t v16 = v33;
  uint64_t v17 = v34;
  uint64_t v46 = v30;
  uint64_t v47 = v34;
  uint64_t v48 = v29;
  char v49 = v32;
  uint64_t v50 = v31;
  uint64_t v51 = v33;
  uint64_t v52 = v21;
  char v53 = v81;
  uint64_t v54 = v22;
  char v55 = v80;
  uint64_t v56 = v23;
  char v57 = v79;
  uint64_t v58 = v24;
  char v59 = v78;
  uint64_t v60 = v37;
  uint64_t v61 = v28;
  char v62 = v27;
  char v63 = v26;
  uint64_t v64 = v25;
  uint64_t result = sub_100046490((uint64_t)&v43);
  *(void *)a2 = v10;
  *(void *)(a2 + 8) = v13;
  *(unsigned char *)(a2 + 16) = v42;
  *(void *)(a2 + 24) = v14;
  *(void *)(a2 + 32) = v17;
  *(void *)(a2 + 40) = v15;
  *(unsigned char *)(a2 + 48) = v32;
  *(void *)(a2 + 56) = v31;
  *(void *)(a2 + 64) = v16;
  *(void *)(a2 + 72) = v21;
  *(unsigned char *)(a2 + 80) = v41;
  *(void *)(a2 + 88) = v22;
  *(unsigned char *)(a2 + 96) = v40;
  *(void *)(a2 + 104) = v23;
  *(unsigned char *)(a2 + 112) = v39;
  *(void *)(a2 + 120) = v24;
  *(unsigned char *)(a2 + 128) = v38;
  uint64_t v19 = v28;
  *(void *)(a2 + 136) = v37;
  *(void *)(a2 + 144) = v19;
  *(unsigned char *)(a2 + 152) = v27;
  *(unsigned char *)(a2 + 160) = v26;
  *(void *)(a2 + 168) = v25;
  return result;
}

unint64_t sub_100046B20()
{
  unint64_t result = qword_10007D480;
  if (!qword_10007D480)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007D480);
  }
  return result;
}

unint64_t sub_100046B74()
{
  unint64_t result = qword_10007D488;
  if (!qword_10007D488)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007D488);
  }
  return result;
}

unint64_t sub_100046BC8()
{
  unint64_t result = qword_10007D490;
  if (!qword_10007D490)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007D490);
  }
  return result;
}

unint64_t sub_100046C1C()
{
  unint64_t result = qword_10007D4A8;
  if (!qword_10007D4A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007D4A8);
  }
  return result;
}

uint64_t sub_100046C70(uint64_t a1)
{
  return a1;
}

unint64_t sub_100046C9C()
{
  unint64_t result = qword_10007D4B0;
  if (!qword_10007D4B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007D4B0);
  }
  return result;
}

void sub_100046CF0(uint64_t a1)
{
  sub_100026AD8(a1, v1);
}

uint64_t sub_100046CF8()
{
  uint64_t v1 = sub_1000082E0(&qword_10007CCD8);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 32) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = ((*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 8;
  swift_unknownObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_release();

  return _swift_deallocObject(v0, v6, v5);
}

uint64_t sub_100046DE4(uint64_t a1)
{
  uint64_t v4 = *(void *)(sub_1000082E0(&qword_10007CCD8) - 8);
  unint64_t v5 = (*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v6 = *(void *)(v1 + 16);
  uint64_t v7 = *(void *)(v1 + 24);
  uint64_t v8 = v1 + v5;
  uint64_t v9 = *(void *)(v1 + ((*(void *)(v4 + 64) + v5 + 7) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v10 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v10;
  *uint64_t v10 = v2;
  v10[1] = sub_100046F0C;
  return sub_1000368D0(a1, v6, v7, v8, v9);
}

uint64_t sub_100046F0C()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_100047010()
{
  return sub_10001584C();
}

uint64_t sub_100047034()
{
  return sub_100016108(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_100047050()
{
  return sub_100015C3C(*(void *)(v0 + 16), *(void *)(v0 + 24), *(unsigned __int8 *)(v0 + 32));
}

uint64_t sub_100047070(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 208)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

unint64_t sub_10004708C()
{
  unint64_t result = qword_10007D4E0;
  if (!qword_10007D4E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007D4E0);
  }
  return result;
}

unint64_t sub_1000470E0()
{
  unint64_t result = qword_10007D4E8;
  if (!qword_10007D4E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007D4E8);
  }
  return result;
}

uint64_t sub_100047134()
{
  return sub_100047278(144);
}

uint64_t sub_10004713C(uint64_t a1)
{
  return a1;
}

unint64_t sub_1000471C8()
{
  unint64_t result = qword_10007D500;
  if (!qword_10007D500)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007D500);
  }
  return result;
}

unint64_t sub_10004721C()
{
  unint64_t result = qword_10007D508;
  if (!qword_10007D508)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007D508);
  }
  return result;
}

uint64_t sub_100047270()
{
  return sub_100047278(200);
}

uint64_t sub_100047278(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v1, a1, 7);
}

uint64_t sub_1000472E0(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_1000487CC;
  return sub_10003FE64(a1, v4, v5, v6);
}

uint64_t sub_100047398()
{
  swift_unknownObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_1000473D8(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_100046F0C;
  return sub_10003F924(a1, v4, v5, v6);
}

unint64_t sub_10004748C()
{
  unint64_t result = qword_10007D548;
  if (!qword_10007D548)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007D548);
  }
  return result;
}

unint64_t sub_1000474E0()
{
  unint64_t result = qword_10007D550;
  if (!qword_10007D550)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007D550);
  }
  return result;
}

uint64_t sub_100047534()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 96, 7);
}

uint64_t sub_100047574(uint64_t a1)
{
  return a1;
}

uint64_t sub_1000475AC(uint64_t a1)
{
  return a1;
}

unint64_t sub_100047658()
{
  unint64_t result = qword_10007D558;
  if (!qword_10007D558)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007D558);
  }
  return result;
}

unint64_t sub_1000476AC()
{
  unint64_t result = qword_10007D560;
  if (!qword_10007D560)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007D560);
  }
  return result;
}

uint64_t sub_100047700()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 160, 7);
}

uint64_t sub_100047768(uint64_t a1)
{
  return a1;
}

uint64_t sub_1000477E0(uint64_t a1)
{
  return a1;
}

unint64_t sub_100047878()
{
  unint64_t result = qword_10007D578;
  if (!qword_10007D578)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007D578);
  }
  return result;
}

unint64_t sub_1000478CC()
{
  unint64_t result = qword_10007D580;
  if (!qword_10007D580)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007D580);
  }
  return result;
}

uint64_t sub_100047920()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 136, 7);
}

uint64_t sub_100047980(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_10000B1E0(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for AnalyticsConfig.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x100047A9CLL);
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

ValueMetadata *type metadata accessor for AnalyticsConfig.CodingKeys()
{
  return &type metadata for AnalyticsConfig.CodingKeys;
}

__n128 initializeWithCopy for AnalyticsManagerCounters.Snapshot(uint64_t a1, uint64_t a2)
{
  long long v2 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v2;
  __n128 result = *(__n128 *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 48);
  long long v5 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v5;
  *(__n128 *)(a1 + 32) = result;
  *(_OWORD *)(a1 + 48) = v4;
  return result;
}

uint64_t getEnumTagSinglePayload for AnalyticsManagerCounters.Snapshot(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 96)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for AnalyticsManagerCounters.Snapshot(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 88) = 0;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = (a2 - 1);
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
  *(unsigned char *)(result + 96) = v3;
  return result;
}

ValueMetadata *type metadata accessor for AnalyticsManagerCounters.Snapshot()
{
  return &type metadata for AnalyticsManagerCounters.Snapshot;
}

unint64_t sub_100047B68()
{
  unint64_t result = qword_10007D598;
  if (!qword_10007D598)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007D598);
  }
  return result;
}

unint64_t sub_100047BC0()
{
  unint64_t result = qword_10007D5A0;
  if (!qword_10007D5A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007D5A0);
  }
  return result;
}

unint64_t sub_100047C18()
{
  unint64_t result = qword_10007D5A8;
  if (!qword_10007D5A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007D5A8);
  }
  return result;
}

uint64_t sub_100047C6C(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x69746172656E6567 && a2 == 0xEA00000000006E6FLL;
  if (v2 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x656C626967696C65 && a2 == 0xEE0073746E657645 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x656C626967696C65 && a2 == 0xED000073656C6946 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x6465746365707865 && a2 == 0xEE0073746E657645 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x4564657070696B73 && a2 == 0xED000073746E6576 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0xD000000000000016 && a2 == 0x800000010005D350 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0xD000000000000010 && a2 == 0x800000010005D410 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else if (a1 == 0xD000000000000010 && a2 == 0x800000010005D370 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 7;
  }
  else if (a1 == 0xD000000000000010 && a2 == 0x800000010005D390 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 8;
  }
  else if (a1 == 0xD000000000000010 && a2 == 0x800000010005D3B0 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 9;
  }
  else if (a1 == 0xD000000000000012 && a2 == 0x800000010005D3D0 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 10;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x800000010005D3F0)
  {
    swift_bridgeObjectRelease();
    return 11;
  }
  else
  {
    char v6 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if (v6) {
      return 11;
    }
    else {
      return 12;
    }
  }
}

uint64_t sub_10004816C@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v5 = sub_1000082E0(&qword_10007D5B0);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000B090(a1, a1[3]);
  sub_1000484DC();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v2) {
    return sub_100008540((uint64_t)a1);
  }
  char v37 = 0;
  uint64_t v9 = KeyedDecodingContainer.decode(_:forKey:)();
  char v36 = 1;
  uint64_t v10 = KeyedDecodingContainer.decode(_:forKey:)();
  char v35 = 2;
  uint64_t v25 = KeyedDecodingContainer.decode(_:forKey:)();
  char v34 = 3;
  uint64_t v24 = KeyedDecodingContainer.decode(_:forKey:)();
  char v33 = 4;
  uint64_t v23 = KeyedDecodingContainer.decode(_:forKey:)();
  char v32 = 5;
  uint64_t v22 = KeyedDecodingContainer.decode(_:forKey:)();
  char v31 = 6;
  uint64_t v21 = KeyedDecodingContainer.decode(_:forKey:)();
  char v30 = 7;
  uint64_t v20 = KeyedDecodingContainer.decode(_:forKey:)();
  char v29 = 8;
  uint64_t v19 = KeyedDecodingContainer.decode(_:forKey:)();
  char v28 = 9;
  uint64_t v18 = KeyedDecodingContainer.decode(_:forKey:)();
  char v27 = 10;
  uint64_t v17 = KeyedDecodingContainer.decode(_:forKey:)();
  char v26 = 11;
  uint64_t v11 = KeyedDecodingContainer.decode(_:forKey:)();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  uint64_t result = sub_100008540((uint64_t)a1);
  *a2 = v9;
  a2[1] = v10;
  uint64_t v13 = v24;
  a2[2] = v25;
  a2[3] = v13;
  uint64_t v14 = v22;
  a2[4] = v23;
  a2[5] = v14;
  uint64_t v15 = v20;
  a2[6] = v21;
  a2[7] = v15;
  uint64_t v16 = v18;
  a2[8] = v19;
  a2[9] = v16;
  a2[10] = v17;
  a2[11] = v11;
  return result;
}

unint64_t sub_1000484DC()
{
  unint64_t result = qword_10007D5B8;
  if (!qword_10007D5B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007D5B8);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for AnalyticsManagerCounters.Snapshot.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xF5) {
    goto LABEL_17;
  }
  if (a2 + 11 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 11) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 11;
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
      return (*a1 | (v4 << 8)) - 11;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 11;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0xC;
  int v8 = v6 - 12;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for AnalyticsManagerCounters.Snapshot.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 11 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 11) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF5) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF4)
  {
    unsigned int v6 = ((a2 - 245) >> 8) + 1;
    *unint64_t result = a2 + 11;
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
        JUMPOUT(0x10004868CLL);
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
          *unint64_t result = a2 + 11;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AnalyticsManagerCounters.Snapshot.CodingKeys()
{
  return &type metadata for AnalyticsManagerCounters.Snapshot.CodingKeys;
}

unint64_t sub_1000486C8()
{
  unint64_t result = qword_10007D5C8;
  if (!qword_10007D5C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007D5C8);
  }
  return result;
}

unint64_t sub_100048720()
{
  unint64_t result = qword_10007D5D0;
  if (!qword_10007D5D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007D5D0);
  }
  return result;
}

unint64_t sub_100048778()
{
  unint64_t result = qword_10007D5D8;
  if (!qword_10007D5D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007D5D8);
  }
  return result;
}

double sub_1000487D8()
{
  sub_1000082E0(&qword_10007D5E0);
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_100059D50;
  strcpy((char *)(v0 + 32), "/private/var");
  *(unsigned char *)(v0 + 45) = 0;
  *(_WORD *)(v0 + 46) = -5120;
  *(void *)(v0 + 56) = 0;
  *(void *)(v0 + 64) = 0;
  *(void *)(v0 + 48) = &off_10006DA50;
  *(unsigned char *)(v0 + 72) = 1;
  *(void *)(v0 + 80) = 0xD000000000000017;
  *(void *)(v0 + 88) = 0x800000010005DEA0;
  *(void *)(v0 + 96) = &off_10006DAB0;
  *(_OWORD *)(v0 + 104) = xmmword_100059D60;
  *(unsigned char *)(v0 + 120) = 0;
  *(void *)(v0 + 128) = 0xD000000000000018;
  *(void *)(v0 + 136) = 0x800000010005DEC0;
  *(void *)(v0 + 144) = &_swiftEmptyArrayStorage;
  *(_OWORD *)(v0 + 152) = xmmword_100059D70;
  *(unsigned char *)(v0 + 168) = 0;
  *(void *)(v0 + 176) = 0xD000000000000018;
  *(void *)(v0 + 184) = 0x800000010005DEC0;
  *(void *)(v0 + 192) = &off_10006DAE0;
  *(_OWORD *)(v0 + 200) = xmmword_100059D80;
  *(unsigned char *)(v0 + 216) = 0;
  *(void *)(v0 + 224) = 0xD000000000000018;
  *(void *)(v0 + 232) = 0x800000010005DEC0;
  *(void *)(v0 + 240) = &off_10006DB20;
  *(void *)&double result = 7;
  *(_OWORD *)(v0 + 248) = xmmword_100059D90;
  *(unsigned char *)(v0 + 264) = 0;
  *(void *)(v0 + 272) = 0xD000000000000018;
  *(void *)(v0 + 280) = 0x800000010005DEC0;
  *(void *)(v0 + 288) = &off_10006DB50;
  *(void *)(v0 + 296) = 14;
  *(void *)(v0 + 304) = 2128;
  *(unsigned char *)(v0 + 312) = 0;
  *(void *)(v0 + 320) = 0xD000000000000021;
  *(void *)(v0 + 328) = 0x800000010005DEE0;
  *(void *)(v0 + 336) = &off_10006DB80;
  *(void *)(v0 + 344) = 5;
  *(void *)(v0 + 352) = 1;
  *(unsigned char *)(v0 + 360) = 0;
  *(void *)(v0 + 368) = 0xD000000000000017;
  *(void *)(v0 + 376) = 0x800000010005DF10;
  *(void *)(v0 + 392) = 0;
  *(void *)(v0 + 400) = 0;
  *(void *)(v0 + 384) = &_swiftEmptyArrayStorage;
  *(unsigned char *)(v0 + 408) = 1;
  *(void *)(v0 + 416) = 0xD000000000000015;
  *(void *)(v0 + 424) = 0x800000010005DF30;
  *(void *)(v0 + 432) = &off_10006DBC0;
  *(void *)(v0 + 440) = 1;
  *(void *)(v0 + 448) = 64;
  *(unsigned char *)(v0 + 456) = 0;
  *(void *)(v0 + 464) = 0xD000000000000015;
  *(void *)(v0 + 472) = 0x800000010005DF30;
  *(void *)(v0 + 480) = &off_10006DBF0;
  *(void *)(v0 + 488) = 9;
  *(void *)(v0 + 496) = 64;
  *(unsigned char *)(v0 + 504) = 0;
  *(void *)(v0 + 512) = 0xD000000000000010;
  *(void *)(v0 + 520) = 0x800000010005DF50;
  *(void *)(v0 + 528) = &off_10006DC20;
  *(void *)(v0 + 536) = 1;
  *(void *)(v0 + 544) = 64;
  *(unsigned char *)(v0 + 552) = 0;
  *(void *)(v0 + 560) = 0xD000000000000011;
  *(void *)(v0 + 568) = 0x800000010005DF70;
  *(void *)(v0 + 576) = &off_10006DC50;
  *(void *)(v0 + 584) = 2;
  *(void *)(v0 + 592) = 64;
  *(unsigned char *)(v0 + 600) = 0;
  *(void *)(v0 + 608) = 0xD000000000000018;
  *(void *)(v0 + 616) = 0x800000010005DF90;
  *(void *)(v0 + 624) = &_swiftEmptyArrayStorage;
  *(void *)(v0 + 632) = 1;
  *(void *)(v0 + 640) = 64;
  *(unsigned char *)(v0 + 648) = 0;
  *(void *)(v0 + 656) = 0xD000000000000018;
  *(void *)(v0 + 664) = 0x800000010005DF90;
  *(void *)(v0 + 672) = &off_10006DC80;
  *(void *)(v0 + 680) = 4;
  *(void *)(v0 + 688) = 64;
  *(unsigned char *)(v0 + 696) = 0;
  *(void *)(v0 + 704) = 0xD000000000000018;
  *(void *)(v0 + 712) = 0x800000010005DF90;
  *(void *)(v0 + 720) = &off_10006DCC0;
  *(void *)(v0 + 728) = 5;
  *(void *)(v0 + 736) = 64;
  *(unsigned char *)(v0 + 744) = 0;
  *(void *)(v0 + 752) = 0xD000000000000018;
  *(void *)(v0 + 760) = 0x800000010005DF90;
  *(void *)(v0 + 768) = &off_10006DCF0;
  *(void *)(v0 + 776) = 5;
  *(void *)(v0 + 784) = 2112;
  *(unsigned char *)(v0 + 792) = 0;
  *(void *)(v0 + 800) = 0xD000000000000010;
  *(void *)(v0 + 808) = 0x800000010005DFB0;
  *(void *)(v0 + 816) = &off_10006DD20;
  *(void *)(v0 + 824) = 1;
  *(void *)(v0 + 832) = 64;
  *(unsigned char *)(v0 + 840) = 0;
  *(void *)(v0 + 848) = 0xD000000000000010;
  *(void *)(v0 + 856) = 0x800000010005DFB0;
  *(void *)(v0 + 864) = &off_10006DD60;
  *(void *)(v0 + 872) = 4;
  *(void *)(v0 + 880) = 64;
  *(unsigned char *)(v0 + 888) = 0;
  *(void *)(v0 + 896) = 0xD000000000000010;
  *(void *)(v0 + 904) = 0x800000010005DFB0;
  *(void *)(v0 + 912) = &off_10006DE50;
  *(void *)(v0 + 920) = 4;
  *(void *)(v0 + 928) = 2068;
  *(unsigned char *)(v0 + 936) = 0;
  *(void *)(v0 + 944) = 0xD000000000000010;
  *(void *)(v0 + 952) = 0x800000010005DFB0;
  *(void *)(v0 + 960) = &off_10006DE80;
  *(void *)(v0 + 968) = 14;
  *(void *)(v0 + 976) = 2130;
  *(unsigned char *)(v0 + 984) = 0;
  *(void *)(v0 + 992) = 0xD000000000000015;
  *(void *)(v0 + 1000) = 0x800000010005DFD0;
  *(void *)(v0 + 1008) = &off_10006DEB0;
  *(void *)(v0 + 1016) = 4;
  *(void *)(v0 + 1024) = 64;
  *(unsigned char *)(v0 + 1032) = 0;
  *(void *)(v0 + 1040) = 0xD000000000000015;
  *(void *)(v0 + 1048) = 0x800000010005DFD0;
  *(void *)(v0 + 1056) = &off_10006DEE0;
  *(void *)(v0 + 1064) = 5;
  *(void *)(v0 + 1072) = 64;
  *(unsigned char *)(v0 + 1080) = 0;
  *(void *)(v0 + 1088) = 0xD000000000000020;
  *(void *)(v0 + 1096) = 0x800000010005DFF0;
  *(void *)(v0 + 1104) = &off_10006DF20;
  *(void *)(v0 + 1112) = 2;
  *(void *)(v0 + 1120) = 16;
  *(unsigned char *)(v0 + 1128) = 0;
  *(void *)(v0 + 1136) = 0xD000000000000020;
  *(void *)(v0 + 1144) = 0x800000010005DFF0;
  *(void *)(v0 + 1152) = &off_10006DF50;
  *(void *)(v0 + 1160) = 2;
  *(void *)(v0 + 1168) = 2064;
  *(unsigned char *)(v0 + 1176) = 0;
  *(void *)(v0 + 1184) = 0xD000000000000030;
  *(void *)(v0 + 1192) = 0x800000010005E020;
  *(void *)(v0 + 1200) = &off_10006DF80;
  *(void *)(v0 + 1208) = 2;
  *(void *)(v0 + 1216) = 2;
  *(unsigned char *)(v0 + 1224) = 0;
  *(void *)(v0 + 1232) = 0xD00000000000001ALL;
  *(void *)(v0 + 1240) = 0x800000010005E060;
  *(void *)(v0 + 1248) = &off_10006DFB0;
  *(void *)(v0 + 1256) = 5;
  *(void *)(v0 + 1264) = 64;
  *(unsigned char *)(v0 + 1272) = 0;
  *(void *)(v0 + 1280) = 0xD000000000000015;
  *(void *)(v0 + 1288) = 0x800000010005E080;
  *(void *)(v0 + 1296) = &off_10006DFE0;
  *(void *)(v0 + 1304) = 15;
  *(void *)(v0 + 1312) = 2128;
  *(unsigned char *)(v0 + 1320) = 0;
  *(void *)(v0 + 1328) = 0xD000000000000022;
  *(void *)(v0 + 1336) = 0x800000010005E0A0;
  *(void *)(v0 + 1344) = &off_10006E010;
  *(void *)(v0 + 1352) = 1;
  *(void *)(v0 + 1360) = 64;
  *(unsigned char *)(v0 + 1368) = 0;
  *(void *)(v0 + 1384) = 0x800000010005E0D0;
  *(void *)(v0 + 1392) = &off_10006E080;
  *(void *)(v0 + 1424) = 0xD00000000000001BLL;
  *(void *)(v0 + 1432) = 0x800000010005E110;
  *(void *)(v0 + 1440) = &off_10006E100;
  *(void *)(v0 + 1448) = 1;
  *(void *)(v0 + 1456) = 80;
  *(unsigned char *)(v0 + 1464) = 0;
  *(void *)(v0 + 1472) = 0xD00000000000001BLL;
  *(void *)(v0 + 1480) = 0x800000010005E110;
  *(void *)(v0 + 1488) = &off_10006E130;
  *(void *)(v0 + 1496) = 1;
  *(void *)(v0 + 1504) = 2128;
  *(void *)(v0 + 1520) = 0xD00000000000001BLL;
  *(void *)(v0 + 1528) = 0x800000010005E110;
  *(void *)(v0 + 1536) = &off_10006E170;
  *(void *)(v0 + 1544) = 12;
  *(void *)(v0 + 1552) = 2128;
  *(unsigned char *)(v0 + 1560) = 0;
  *(void *)(v0 + 1568) = 0xD000000000000016;
  *(void *)(v0 + 1576) = 0x800000010005E130;
  *(void *)(v0 + 1584) = &off_10006E1A0;
  *(void *)(v0 + 1592) = 1;
  *(void *)(v0 + 1600) = 64;
  *(unsigned char *)(v0 + 1608) = 0;
  *(void *)(v0 + 1616) = 0xD00000000000001CLL;
  *(void *)(v0 + 1624) = 0x800000010005E150;
  *(void *)(v0 + 1632) = &off_10006E1D0;
  *(void *)(v0 + 1640) = 1;
  *(void *)(v0 + 1648) = 64;
  *(unsigned char *)(v0 + 1656) = 0;
  *(void *)(v0 + 1664) = 0xD00000000000001CLL;
  *(void *)(v0 + 1672) = 0x800000010005E150;
  *(void *)(v0 + 1680) = &off_10006E220;
  *(void *)(v0 + 1688) = 4;
  *(void *)(v0 + 1696) = 64;
  *(unsigned char *)(v0 + 1704) = 0;
  *(void *)(v0 + 1712) = 0xD00000000000001ELL;
  *(void *)(v0 + 1720) = 0x800000010005E170;
  *(void *)(v0 + 1728) = &off_10006E250;
  *(void *)(v0 + 1736) = 1;
  *(void *)(v0 + 1744) = 64;
  *(void *)(v0 + 1768) = 0x800000010005E170;
  *(void *)(v0 + 1776) = &off_10006E2D0;
  *(void *)(v0 + 1816) = 0x800000010005E190;
  *(void *)(v0 + 1824) = &off_10006E300;
  *(void *)(v0 + 1856) = 0xD000000000000018;
  *(void *)(v0 + 1864) = 0x800000010005E1C0;
  *(void *)(v0 + 1872) = &off_10006E330;
  *(void *)(v0 + 1904) = 0xD00000000000001BLL;
  *(void *)(v0 + 1920) = &off_10006E380;
  *(void *)(v0 + 1912) = 0x800000010005E1E0;
  *(void *)(v0 + 1952) = 0xD00000000000001BLL;
  *(void *)(v0 + 1960) = 0x800000010005E1E0;
  *(void *)(v0 + 1968) = &off_10006E3B0;
  *(void *)(v0 + 2008) = 0x800000010005E200;
  *(void *)(v0 + 2016) = &off_10006E3E0;
  *(void *)(v0 + 2048) = 0xD000000000000015;
  *(void *)(v0 + 2056) = 0x800000010005E230;
  *(void *)(v0 + 2064) = &off_10006E410;
  *(void *)(v0 + 2096) = 0xD000000000000018;
  *(void *)(v0 + 2104) = 0x800000010005E250;
  *(void *)(v0 + 2144) = 0xD000000000000018;
  *(void *)(v0 + 2152) = 0x800000010005E270;
  *(void *)(v0 + 2160) = &off_10006E440;
  *(void *)(v0 + 2192) = 0xD000000000000018;
  *(void *)(v0 + 2200) = 0x800000010005E270;
  *(void *)(v0 + 2208) = &off_10006E4C0;
  *(void *)(v0 + 2240) = 0xD00000000000001BLL;
  *(void *)(v0 + 2248) = 0x800000010005E290;
  *(void *)(v0 + 2256) = &off_10006E4F0;
  *(void *)(v0 + 2296) = 0x800000010005E2B0;
  *(void *)(v0 + 2304) = &off_10006E520;
  *(void *)(v0 + 2344) = 0x800000010005E2E0;
  *(void *)(v0 + 2352) = &off_10006E550;
  *(unsigned char *)(v0 + 2376) = 0;
  *(void *)(v0 + 2384) = 0xD000000000000017;
  *(void *)(v0 + 2392) = 0x800000010005E300;
  *(void *)(v0 + 2400) = &off_10006E580;
  *(void *)(v0 + 2408) = 1;
  *(void *)(v0 + 2416) = 16;
  *(unsigned char *)(v0 + 2424) = 0;
  *(void *)(v0 + 2440) = 0x800000010005E300;
  *(void *)(v0 + 2944) = 64;
  *(unsigned char *)(v0 + 2952) = 0;
  *(void *)(v0 + 2960) = 0xD000000000000017;
  *(void *)(v0 + 2912) = 0xD000000000000017;
  *(void *)(v0 + 2920) = 0x800000010005E300;
  *(void *)(v0 + 2928) = &off_10006E950;
  *(void *)(v0 + 2936) = 5;
  *(void *)(v0 + 2872) = 0x800000010005E300;
  *(void *)(v0 + 2880) = &off_10006E920;
  *(void *)(v0 + 2888) = 4;
  *(void *)(v0 + 2896) = 2132;
  *(unsigned char *)(v0 + 2904) = 0;
  *(void *)(v0 + 2840) = 4;
  *(void *)(v0 + 2848) = 2128;
  *(unsigned char *)(v0 + 2856) = 0;
  *(void *)(v0 + 2864) = 0xD000000000000017;
  *(void *)(v0 + 2832) = &off_10006E8E0;
  *(unsigned char *)(v0 + 2808) = 0;
  *(void *)(v0 + 2816) = 0xD000000000000017;
  *(void *)(v0 + 2824) = 0x800000010005E300;
  *(void *)(v0 + 2784) = &off_10006E8B0;
  *(void *)(v0 + 2776) = 0x800000010005E300;
  *(void *)(v0 + 2792) = 4;
  *(void *)(v0 + 2800) = 2064;
  *(void *)(v0 + 2448) = &off_10006E5B0;
  *(void *)(v0 + 2736) = &off_10006E870;
  *(void *)(v0 + 2744) = 4;
  *(void *)(v0 + 2752) = 80;
  *(unsigned char *)(v0 + 2760) = 0;
  *(void *)(v0 + 2768) = 0xD000000000000017;
  *(void *)(v0 + 2632) = 0x800000010005E300;
  *(void *)(v0 + 2704) = 68;
  *(unsigned char *)(v0 + 2712) = 0;
  *(void *)(v0 + 2720) = 0xD000000000000017;
  *(void *)(v0 + 2728) = 0x800000010005E300;
  *(void *)(v0 + 2672) = 0xD000000000000017;
  *(void *)(v0 + 2680) = 0x800000010005E300;
  *(void *)(v0 + 2688) = &off_10006E840;
  *(void *)(v0 + 2696) = 4;
  *(void *)(v0 + 2640) = &off_10006E6C0;
  *(void *)(v0 + 2648) = 4;
  *(void *)(v0 + 2656) = 64;
  *(unsigned char *)(v0 + 2664) = 0;
  *(void *)(v0 + 2600) = 4;
  *(void *)(v0 + 2608) = 16;
  *(unsigned char *)(v0 + 2616) = 0;
  *(void *)(v0 + 2624) = 0xD000000000000017;
  *(void *)(v0 + 2592) = &off_10006E660;
  *(unsigned char *)(v0 + 2568) = 0;
  *(void *)(v0 + 2576) = 0xD000000000000017;
  *(void *)(v0 + 2584) = 0x800000010005E300;
  *(void *)(v0 + 2544) = &off_10006E620;
  *(void *)(v0 + 2536) = 0x800000010005E300;
  *(void *)(v0 + 2552) = 4;
  *(void *)(v0 + 2560) = 4;
  *(void *)(v0 + 2456) = 1;
  *(void *)(v0 + 2496) = &off_10006E5F0;
  *(void *)(v0 + 2504) = 3;
  *(void *)(v0 + 2512) = 64;
  *(unsigned char *)(v0 + 2520) = 0;
  *(void *)(v0 + 2528) = 0xD000000000000017;
  *(void *)(v0 + 2464) = 64;
  *(unsigned char *)(v0 + 2472) = 0;
  *(void *)(v0 + 2480) = 0xD000000000000017;
  *(void *)(v0 + 2488) = 0x800000010005E300;
  *(void *)(v0 + 2976) = &off_10006E980;
  *(void *)(v0 + 3024) = &off_10006E9B0;
  *(void *)(v0 + 3072) = &off_10006E9E0;
  *(void *)(v0 + 3120) = &off_10006EA10;
  *(void *)(v0 + 2432) = 0xD000000000000017;
  *(void *)(v0 + 3168) = &off_10006EA40;
  *(void *)(v0 + 3216) = &off_10006EA70;
  *(void *)(v0 + 3232) = 320;
  *(void *)(v0 + 3264) = &off_10006EAA0;
  *(void *)(v0 + 3312) = &off_10006EAD0;
  *(void *)(v0 + 3360) = &off_10006EB00;
  *(unsigned char *)(v0 + 1752) = 0;
  *(void *)(v0 + 3408) = &off_10006EB50;
  *(void *)(v0 + 2336) = 0xD00000000000001ELL;
  *(void *)(v0 + 2360) = 6;
  *(void *)(v0 + 2368) = 64;
  *(void *)(v0 + 1784) = 4;
  *(void *)(v0 + 2288) = 0xD00000000000002BLL;
  *(void *)(v0 + 2312) = 2;
  *(void *)(v0 + 2320) = 16;
  *(unsigned char *)(v0 + 2328) = 0;
  *(void *)(v0 + 1792) = 64;
  *(unsigned char *)(v0 + 1800) = 0;
  *(void *)(v0 + 1808) = 0xD000000000000020;
  *(void *)(v0 + 2264) = 6;
  *(void *)(v0 + 2272) = 2064;
  *(unsigned char *)(v0 + 2280) = 0;
  *(void *)(v0 + 1832) = 1;
  *(void *)(v0 + 1880) = 3;
  *(void *)(v0 + 1888) = 64;
  *(void *)(v0 + 2216) = 4;
  *(void *)(v0 + 2224) = 64;
  *(unsigned char *)(v0 + 2232) = 0;
  *(unsigned char *)(v0 + 1896) = 0;
  *(void *)(v0 + 1928) = 1;
  *(void *)(v0 + 1976) = 4;
  *(void *)(v0 + 2168) = 1;
  *(void *)(v0 + 2176) = 64;
  *(unsigned char *)(v0 + 2184) = 0;
  *(void *)(v0 + 1984) = 64;
  *(unsigned char *)(v0 + 1992) = 0;
  *(void *)(v0 + 2112) = &_swiftEmptyArrayStorage;
  *(void *)(v0 + 2120) = 1;
  *(void *)(v0 + 2128) = 64;
  *(unsigned char *)(v0 + 2136) = 0;
  *(void *)(v0 + 2024) = 1;
  *(void *)(v0 + 2032) = 64;
  *(unsigned char *)(v0 + 2040) = 0;
  *(void *)(v0 + 2072) = 5;
  *(void *)(v0 + 2080) = 64;
  *(unsigned char *)(v0 + 2088) = 0;
  *(void *)(v0 + 3008) = 0xD000000000000017;
  *(void *)(v0 + 3056) = 0xD000000000000017;
  *(void *)(v0 + 3104) = 0xD000000000000017;
  *(void *)(v0 + 3152) = 0xD000000000000017;
  *(void *)(v0 + 3200) = 0xD000000000000017;
  *(void *)(v0 + 3248) = 0xD000000000000017;
  *(void *)(v0 + 3296) = 0xD000000000000017;
  *(void *)(v0 + 3344) = 0xD000000000000017;
  *(void *)(v0 + 3392) = 0xD000000000000017;
  *(void *)(v0 + 3440) = 0xD000000000000017;
  *(void *)(v0 + 2000) = 0xD000000000000025;
  *(void *)(v0 + 1936) = 64;
  *(unsigned char *)(v0 + 1944) = 0;
  *(void *)(v0 + 2968) = 0x800000010005E300;
  *(void *)(v0 + 3016) = 0x800000010005E300;
  *(void *)(v0 + 3064) = 0x800000010005E300;
  *(void *)(v0 + 3112) = 0x800000010005E300;
  *(void *)(v0 + 3160) = 0x800000010005E300;
  *(void *)(v0 + 3208) = 0x800000010005E300;
  *(void *)(v0 + 3256) = 0x800000010005E300;
  *(void *)(v0 + 3304) = 0x800000010005E300;
  *(void *)(v0 + 3352) = 0x800000010005E300;
  *(void *)(v0 + 3400) = 0x800000010005E300;
  *(void *)(v0 + 3448) = 0x800000010005E300;
  *(void *)(v0 + 3456) = &off_10006EB80;
  *(void *)(v0 + 1840) = 64;
  *(void *)(v0 + 3496) = 0x800000010005E320;
  *(unsigned char *)(v0 + 1848) = 0;
  *(void *)(v0 + 3504) = &off_10006EBB0;
  *(void *)(v0 + 3544) = 0x800000010005E350;
  *(void *)(v0 + 3552) = &off_10006EBE0;
  *(void *)(v0 + 3592) = 0x800000010005E370;
  *(void *)(v0 + 3600) = &off_10006EC10;
  *(void *)(v0 + 3632) = 0xD000000000000043;
  *(void *)(v0 + 3640) = 0x800000010005E3C0;
  *(void *)(v0 + 3648) = &off_10006ECA0;
  *(void *)(v0 + 3688) = 0x800000010005E410;
  *(void *)(v0 + 3736) = 0x800000010005E410;
  *(void *)(v0 + 1760) = 0xD00000000000001ELL;
  *(void *)(v0 + 3744) = &off_10006ECD0;
  *(void *)(v0 + 3784) = 0x800000010005E440;
  *(void *)(v0 + 3792) = &off_10006ED00;
  *(void *)(v0 + 3840) = &off_10006ED30;
  *(void *)(v0 + 3888) = &off_10006ED60;
  *(void *)(v0 + 3936) = &off_10006EE00;
  *(void *)(v0 + 3832) = 0x800000010005E470;
  *(void *)(v0 + 3880) = 0x800000010005E470;
  *(void *)(v0 + 3928) = 0x800000010005E470;
  *(void *)(v0 + 3976) = 0x800000010005E470;
  *(void *)(v0 + 3984) = &off_10006EE30;
  *(void *)(v0 + 4016) = 0xD00000000000002ELL;
  *(void *)(v0 + 4024) = 0x800000010005E4A0;
  *(void *)(v0 + 4032) = &off_10006EE60;
  *(void *)(v0 + 4080) = &off_10006EE90;
  *(unsigned char *)(v0 + 4104) = 0;
  *(void *)(v0 + 4128) = &off_10006EED0;
  *(unsigned char *)(v0 + 4152) = 0;
  *(void *)(v0 + 4176) = &off_10006EF20;
  *(unsigned char *)(v0 + 4200) = 0;
  *(void *)(v0 + 4224) = &off_10006EF50;
  *(unsigned char *)(v0 + 4248) = 0;
  *(void *)(v0 + 4272) = &off_10006EF80;
  *(unsigned char *)(v0 + 4296) = 0;
  *(void *)(v0 + 4320) = &off_10006EFB0;
  *(unsigned char *)(v0 + 4344) = 0;
  *(unsigned char *)(v0 + 1512) = 0;
  *(void *)(v0 + 4072) = 0x800000010005E4D0;
  *(void *)(v0 + 4120) = 0x800000010005E4D0;
  *(void *)(v0 + 4168) = 0x800000010005E4D0;
  *(void *)(v0 + 4216) = 0x800000010005E4D0;
  *(void *)(v0 + 4264) = 0x800000010005E4D0;
  *(void *)(v0 + 4312) = 0x800000010005E4D0;
  *(void *)(v0 + 4360) = 0x800000010005E4D0;
  *(void *)(v0 + 4368) = &off_10006EFE0;
  *(void *)(v0 + 4416) = &off_10006F010;
  *(void *)(v0 + 4464) = &off_10006F040;
  *(void *)(v0 + 4512) = &off_10006F070;
  *(void *)(v0 + 4560) = &off_10006F0A0;
  *(void *)(v0 + 4608) = &off_10006F0D0;
  *(unsigned char *)(v0 + 1416) = 0;
  *(void *)(v0 + 1376) = 0xD000000000000037;
  *(void *)(v0 + 1400) = 1;
  *(void *)(v0 + 1408) = 64;
  *(void *)(v0 + 2984) = 5;
  *(void *)(v0 + 2992) = 2064;
  *(unsigned char *)(v0 + 3000) = 0;
  *(void *)(v0 + 3032) = 5;
  *(void *)(v0 + 3040) = 2128;
  *(unsigned char *)(v0 + 3048) = 0;
  *(void *)(v0 + 3080) = 6;
  *(void *)(v0 + 3088) = 64;
  *(unsigned char *)(v0 + 4392) = 0;
  *(unsigned char *)(v0 + 4440) = 0;
  *(unsigned char *)(v0 + 4488) = 0;
  *(unsigned char *)(v0 + 4536) = 0;
  *(unsigned char *)(v0 + 4584) = 0;
  *(unsigned char *)(v0 + 4632) = 0;
  *(void *)(v0 + 4408) = 0x800000010005E500;
  *(void *)(v0 + 4456) = 0x800000010005E500;
  *(void *)(v0 + 4504) = 0x800000010005E500;
  *(void *)(v0 + 4552) = 0x800000010005E500;
  *(void *)(v0 + 4600) = 0x800000010005E500;
  *(void *)(v0 + 4648) = 0x800000010005E500;
  *(void *)(v0 + 4656) = &off_10006F100;
  *(unsigned char *)(v0 + 4680) = 0;
  *(void *)(v0 + 4704) = &off_10006F130;
  *(unsigned char *)(v0 + 4728) = 0;
  *(void *)(v0 + 4752) = &off_10006F160;
  *(unsigned char *)(v0 + 4776) = 0;
  *(void *)(v0 + 4800) = &off_10006F3F0;
  *(unsigned char *)(v0 + 4824) = 0;
  *(void *)(v0 + 4848) = &off_10006F470;
  *(unsigned char *)(v0 + 4872) = 0;
  *(void *)(v0 + 4896) = &off_10006F4A0;
  *(unsigned char *)(v0 + 4920) = 0;
  *(void *)(v0 + 4944) = &off_10006F4D0;
  *(unsigned char *)(v0 + 4968) = 0;
  *(void *)(v0 + 4992) = &off_10006F510;
  *(unsigned char *)(v0 + 5016) = 0;
  *(void *)(v0 + 5040) = &off_10006F570;
  *(unsigned char *)(v0 + 5064) = 0;
  *(void *)(v0 + 5088) = &off_10006F5B0;
  *(unsigned char *)(v0 + 5112) = 0;
  *(void *)(v0 + 5136) = &off_10006F640;
  *(unsigned char *)(v0 + 5160) = 0;
  *(void *)(v0 + 5184) = &off_10006F670;
  *(unsigned char *)(v0 + 5208) = 0;
  *(void *)(v0 + 5232) = &off_10006F6F0;
  *(unsigned char *)(v0 + 5256) = 0;
  *(void *)(v0 + 5280) = &off_10006F730;
  *(unsigned char *)(v0 + 5304) = 0;
  *(void *)(v0 + 5328) = &off_10006F770;
  *(unsigned char *)(v0 + 5352) = 0;
  *(void *)(v0 + 5376) = &off_10006F7A0;
  *(unsigned char *)(v0 + 5400) = 0;
  *(void *)(v0 + 5424) = &off_10006F7E0;
  *(unsigned char *)(v0 + 5448) = 0;
  *(void *)(v0 + 5472) = &off_10006F820;
  *(unsigned char *)(v0 + 5496) = 0;
  *(void *)(v0 + 5520) = &off_10006F8C0;
  *(unsigned char *)(v0 + 5544) = 0;
  *(void *)(v0 + 5568) = &off_10006F8F0;
  *(unsigned char *)(v0 + 5592) = 0;
  *(void *)(v0 + 5616) = &off_10006F940;
  *(unsigned char *)(v0 + 5640) = 0;
  *(void *)(v0 + 5664) = &off_10006F970;
  *(unsigned char *)(v0 + 5688) = 0;
  *(void *)(v0 + 4696) = 0x800000010005E530;
  *(void *)(v0 + 4744) = 0x800000010005E530;
  *(void *)(v0 + 4792) = 0x800000010005E530;
  *(void *)(v0 + 4840) = 0x800000010005E530;
  *(void *)(v0 + 4888) = 0x800000010005E530;
  *(void *)(v0 + 4936) = 0x800000010005E530;
  *(void *)(v0 + 4984) = 0x800000010005E530;
  *(void *)(v0 + 5032) = 0x800000010005E530;
  *(void *)(v0 + 5080) = 0x800000010005E530;
  *(void *)(v0 + 5128) = 0x800000010005E530;
  *(void *)(v0 + 5176) = 0x800000010005E530;
  *(void *)(v0 + 5224) = 0x800000010005E530;
  *(void *)(v0 + 5272) = 0x800000010005E530;
  *(void *)(v0 + 5320) = 0x800000010005E530;
  *(void *)(v0 + 5368) = 0x800000010005E530;
  *(void *)(v0 + 5416) = 0x800000010005E530;
  *(void *)(v0 + 5464) = 0x800000010005E530;
  *(void *)(v0 + 5512) = 0x800000010005E530;
  *(void *)(v0 + 5560) = 0x800000010005E530;
  *(void *)(v0 + 5608) = 0x800000010005E530;
  *(void *)(v0 + 5656) = 0x800000010005E530;
  *(void *)(v0 + 5704) = 0x800000010005E530;
  *(void *)(v0 + 5712) = &off_10006F9B0;
  *(unsigned char *)(v0 + 5736) = 0;
  *(void *)(v0 + 5760) = &off_10006F9E0;
  *(unsigned char *)(v0 + 5784) = 0;
  *(void *)(v0 + 5808) = &off_10006FA10;
  *(unsigned char *)(v0 + 5832) = 0;
  *(void *)(v0 + 5856) = &off_10006FA40;
  *(unsigned char *)(v0 + 5880) = 0;
  *(void *)(v0 + 5752) = 0x800000010005E560;
  *(void *)(v0 + 5800) = 0x800000010005E560;
  *(void *)(v0 + 5848) = 0x800000010005E560;
  *(void *)(v0 + 5896) = 0x800000010005E560;
  *(void *)(v0 + 5904) = &off_10006FA70;
  *(unsigned char *)(v0 + 5928) = 0;
  *(void *)(v0 + 5944) = 0x800000010005E590;
  *(unsigned char *)(v0 + 5976) = 0;
  *(void *)(v0 + 5952) = &off_10006FAA0;
  *(void *)(v0 + 5992) = 0x800000010005E5C0;
  *(void *)(v0 + 6000) = &off_10006FAD0;
  *(unsigned char *)(v0 + 6024) = 0;
  *(void *)(v0 + 5744) = 0xD000000000000024;
  *(void *)(v0 + 5792) = 0xD000000000000024;
  *(void *)(v0 + 6032) = 0xD00000000000002BLL;
  *(void *)(v0 + 5840) = 0xD000000000000024;
  *(void *)(v0 + 6040) = 0x800000010005E5F0;
  *(void *)(v0 + 6048) = &off_10006FB10;
  *(unsigned char *)(v0 + 6072) = 0;
  *(void *)(v0 + 5888) = 0xD000000000000024;
  *(void *)(v0 + 6088) = 0x800000010005E620;
  *(void *)(v0 + 6096) = &off_10006FB50;
  *(unsigned char *)(v0 + 6120) = 0;
  *(void *)(v0 + 6144) = &off_10006FB80;
  *(unsigned char *)(v0 + 6168) = 0;
  *(void *)(v0 + 6192) = &off_10006FBC0;
  *(unsigned char *)(v0 + 6216) = 0;
  *(void *)(v0 + 6240) = &off_10006FBF0;
  *(unsigned char *)(v0 + 6264) = 0;
  *(void *)(v0 + 6128) = 0xD000000000000024;
  *(void *)(v0 + 6136) = 0x800000010005E650;
  *(void *)(v0 + 6176) = 0xD000000000000024;
  *(void *)(v0 + 6184) = 0x800000010005E650;
  *(void *)(v0 + 6224) = 0xD000000000000024;
  *(void *)(v0 + 6232) = 0x800000010005E650;
  *(void *)(v0 + 6272) = 0xD000000000000024;
  *(void *)(v0 + 6280) = 0x800000010005E650;
  *(void *)(v0 + 6288) = &off_10006FC20;
  *(unsigned char *)(v0 + 6312) = 0;
  *(void *)(v0 + 6328) = 0x800000010005E680;
  *(void *)(v0 + 6336) = &off_10006FC50;
  *(unsigned char *)(v0 + 6360) = 0;
  *(void *)(v0 + 6376) = 0x800000010005E6B0;
  *(void *)(v0 + 6384) = &off_10006FC80;
  *(unsigned char *)(v0 + 6408) = 0;
  *(void *)(v0 + 6432) = &off_10006FCB0;
  *(unsigned char *)(v0 + 6456) = 0;
  *(void *)(v0 + 6424) = 0x800000010005E6F0;
  *(void *)(v0 + 6472) = 0x800000010005E6F0;
  *(void *)(v0 + 6480) = &off_10006FCE0;
  *(unsigned char *)(v0 + 6504) = 0;
  *(void *)(v0 + 6512) = 0xD000000000000024;
  *(void *)(v0 + 6520) = 0x800000010005E720;
  *(void *)(v0 + 6528) = &off_10006FD20;
  *(unsigned char *)(v0 + 6552) = 0;
  *(void *)(v0 + 6568) = 0x800000010005E750;
  *(unsigned char *)(v0 + 6600) = 0;
  *(void *)(v0 + 6576) = &off_10006FD50;
  *(void *)(v0 + 6616) = 0x800000010005E780;
  *(void *)(v0 + 6624) = &off_10006FD80;
  *(unsigned char *)(v0 + 6648) = 0;
  *(void *)(v0 + 6664) = 0x800000010005E780;
  *(unsigned char *)(v0 + 6696) = 0;
  *(void *)(v0 + 6672) = &off_10006FDB0;
  *(void *)(v0 + 6712) = 0x800000010005E780;
  *(void *)(v0 + 6720) = &off_10006FE50;
  *(unsigned char *)(v0 + 6744) = 0;
  *(void *)(v0 + 6760) = 0x800000010005E780;
  *(void *)(v0 + 6768) = &off_10006FE80;
  *(unsigned char *)(v0 + 6792) = 0;
  *(void *)(v0 + 6808) = 0x800000010005E780;
  *(void *)(v0 + 6816) = &off_10006FEB0;
  *(unsigned char *)(v0 + 6840) = 0;
  *(void *)(v0 + 6864) = &off_10006FEF0;
  *(unsigned char *)(v0 + 6888) = 0;
  *(unsigned char *)(v0 + 6936) = 0;
  *(unsigned char *)(v0 + 6984) = 0;
  *(void *)(v0 + 6912) = &off_10006FF20;
  *(unsigned char *)(v0 + 7080) = 0;
  *(void *)(v0 + 7096) = 0x800000010005E800;
  *(unsigned char *)(v0 + 10200) = 0;
  *(unsigned char *)(v0 + 10296) = 0;
  *(unsigned char *)(v0 + 10440) = 0;
  *(unsigned char *)(v0 + 10488) = 0;
  *(unsigned char *)(v0 + 10536) = 0;
  *(unsigned char *)(v0 + 10584) = 0;
  *(unsigned char *)(v0 + 10632) = 0;
  *(unsigned char *)(v0 + 10680) = 0;
  *(unsigned char *)(v0 + 10728) = 0;
  *(unsigned char *)(v0 + 10776) = 0;
  *(unsigned char *)(v0 + 10824) = 0;
  *(unsigned char *)(v0 + 10872) = 0;
  *(void *)(v0 + 10880) = 0xD00000000000003FLL;
  *(unsigned char *)(v0 + 10920) = 0;
  *(void *)(v0 + 10912) = 64;
  *(void *)(v0 + 10888) = 0x800000010005F1A0;
  *(void *)(v0 + 10904) = 1;
  *(void *)(v0 + 10896) = &off_100071110;
  *(void *)(v0 + 10552) = 0x800000010005F0B0;
  *(void *)(v0 + 10600) = 0x800000010005F0B0;
  *(void *)(v0 + 10848) = &off_1000710E0;
  *(void *)(v0 + 10856) = 7;
  *(void *)(v0 + 10864) = 64;
  *(void *)(v0 + 10832) = 0xD000000000000025;
  *(void *)(v0 + 10840) = 0x800000010005F170;
  *(void *)(v0 + 10792) = 0x800000010005F170;
  *(void *)(v0 + 10800) = &off_1000710B0;
  *(void *)(v0 + 10808) = 1;
  *(void *)(v0 + 10816) = 64;
  *(void *)(v0 + 3776) = 0xD000000000000026;
  *(void *)(v0 + 10768) = 64;
  *(void *)(v0 + 10784) = 0xD000000000000025;
  *(void *)(v0 + 10736) = 0xD000000000000026;
  *(void *)(v0 + 10752) = &off_100071080;
  *(void *)(v0 + 10760) = 2;
  *(void *)(v0 + 10744) = 0x800000010005F140;
  *(void *)(v0 + 10608) = &off_100070FF0;
  *(void *)(v0 + 10704) = &off_100071050;
  *(void *)(v0 + 10712) = 5;
  *(void *)(v0 + 10720) = 64;
  *(void *)(v0 + 10696) = 0x800000010005F110;
  *(void *)(v0 + 10672) = 64;
  *(void *)(v0 + 10688) = 0xD000000000000025;
  *(void *)(v0 + 5936) = 0xD000000000000029;
  *(void *)(v0 + 5984) = 0xD000000000000029;
  *(void *)(v0 + 10640) = 0xD000000000000029;
  *(void *)(v0 + 10664) = 5;
  *(void *)(v0 + 10648) = 0x800000010005F0E0;
  *(void *)(v0 + 10656) = &off_100071020;
  *(void *)(v0 + 10592) = 0xD000000000000028;
  *(void *)(v0 + 10616) = 4;
  *(void *)(v0 + 10624) = 64;
  *(void *)(v0 + 10560) = &off_100070FA0;
  *(void *)(v0 + 6608) = 0xD000000000000028;
  *(void *)(v0 + 6656) = 0xD000000000000028;
  *(void *)(v0 + 6704) = 0xD000000000000028;
  *(void *)(v0 + 10568) = 2;
  *(void *)(v0 + 10576) = 64;
  *(void *)(v0 + 6752) = 0xD000000000000028;
  *(void *)(v0 + 6800) = 0xD000000000000028;
  *(void *)(v0 + 10544) = 0xD000000000000028;
  *(void *)(v0 + 10528) = 2128;
  *(void *)(v0 + 6960) = &off_10006FF50;
  *(void *)(v0 + 10520) = 7;
  *(void *)(v0 + 10512) = &off_100070F70;
  *(void *)(v0 + 10496) = 0xD000000000000023;
  *(void *)(v0 + 10504) = 0x800000010005F080;
  *(void *)(v0 + 10472) = 3;
  *(void *)(v0 + 10480) = 80;
  *(void *)(v0 + 7048) = 0x800000010005E7E0;
  *(void *)(v0 + 10464) = &off_100070F30;
  *(void *)(v0 + 10448) = 0xD000000000000023;
  *(void *)(v0 + 10456) = 0x800000010005F080;
  *(void *)(v0 + 10416) = &off_100070F00;
  *(void *)(v0 + 10408) = 0x800000010005F080;
  *(void *)(v0 + 10424) = 2;
  *(void *)(v0 + 10432) = 16;
  *(unsigned char *)(v0 + 10392) = 0;
  *(void *)(v0 + 10376) = 1;
  *(void *)(v0 + 10384) = 2064;
  *(void *)(v0 + 10400) = 0xD000000000000023;
  *(void *)(v0 + 10368) = &off_100070ED0;
  *(void *)(v0 + 10352) = 0xD000000000000023;
  *(void *)(v0 + 10360) = 0x800000010005F080;
  *(unsigned char *)(v0 + 10344) = 0;
  *(void *)(v0 + 10328) = 1;
  *(void *)(v0 + 10336) = 80;
  *(void *)(v0 + 7056) = &off_10006FFB0;
  *(void *)(v0 + 10320) = &off_100070EA0;
  *(void *)(v0 + 10304) = 0xD000000000000023;
  *(void *)(v0 + 10312) = 0x800000010005F080;
  *(void *)(v0 + 10272) = &off_100070E70;
  *(void *)(v0 + 10264) = 0x800000010005F080;
  *(void *)(v0 + 10280) = 1;
  *(void *)(v0 + 10288) = 64;
  *(unsigned char *)(v0 + 10248) = 0;
  *(void *)(v0 + 10232) = 1;
  *(void *)(v0 + 10240) = 16;
  *(void *)(v0 + 10256) = 0xD000000000000023;
  *(void *)(v0 + 10216) = 0x800000010005F080;
  *(void *)(v0 + 10224) = &off_100070E30;
  *(void *)(v0 + 3536) = 0xD00000000000001ELL;
  *(void *)(v0 + 10208) = 0xD000000000000023;
  *(void *)(v0 + 10112) = 0xD00000000000001ELL;
  *(void *)(v0 + 10184) = 4;
  *(void *)(v0 + 10192) = 16;
  *(void *)(v0 + 10160) = 0xD000000000000022;
  *(void *)(v0 + 10168) = 0x800000010005F050;
  *(void *)(v0 + 10176) = &off_100070E00;
  *(unsigned char *)(v0 + 10152) = 0;
  *(void *)(v0 + 10144) = 16;
  *(void *)(v0 + 10128) = &off_100070DD0;
  *(void *)(v0 + 10136) = 1;
  *(void *)(v0 + 10120) = 0x800000010005F030;
  *(void *)(v0 + 7072) = 16;
  *(void *)(v0 + 6856) = 0x800000010005E7B0;
  *(void *)(v0 + 6904) = 0x800000010005E7B0;
  *(void *)(v0 + 6952) = 0x800000010005E7B0;
  *(void *)(v0 + 7040) = 0xD00000000000001FLL;
  *(void *)(v0 + 7064) = 1;
  *(void *)(v0 + 7000) = 0x800000010005E7B0;
  *(unsigned char *)(v0 + 7032) = 0;
  *(void *)(v0 + 7016) = 15;
  *(void *)(v0 + 7024) = 2068;
  *(void *)(v0 + 7008) = &off_10006FF80;
  *(void *)(v0 + 3424) = 84;
  *(void *)(v0 + 6992) = 0xD000000000000022;
  *(void *)(v0 + 6976) = 84;
  *(void *)(v0 + 7104) = &off_10006FFE0;
  *(void *)(v0 + 6968) = 7;
  *(unsigned char *)(v0 + 7128) = 0;
  *(void *)(v0 + 6872) = 1;
  *(void *)(v0 + 6920) = 3;
  *(void *)(v0 + 6928) = 4;
  *(void *)(v0 + 6944) = 0xD000000000000022;
  *(void *)(v0 + 6880) = 4;
  *(void *)(v0 + 6896) = 0xD000000000000022;
  *(void *)(v0 + 7144) = 0x800000010005E800;
  *(void *)(v0 + 7152) = &off_100070010;
  *(void *)(v0 + 6488) = 15;
  *(void *)(v0 + 6496) = 2128;
  *(void *)(v0 + 6824) = 4;
  *(void *)(v0 + 6832) = 16;
  *(void *)(v0 + 6848) = 0xD000000000000022;
  *(void *)(v0 + 6536) = 4;
  *(void *)(v0 + 6544) = 64;
  *(void *)(v0 + 6560) = 0xD000000000000025;
  *(void *)(v0 + 6584) = 2;
  *(void *)(v0 + 6592) = 16;
  *(void *)(v0 + 6784) = 2064;
  *(void *)(v0 + 6632) = 1;
  *(void *)(v0 + 6640) = 16;
  *(void *)(v0 + 6680) = 2;
  *(void *)(v0 + 6728) = 2;
  *(void *)(v0 + 6736) = 2048;
  *(void *)(v0 + 6776) = 2;
  *(void *)(v0 + 7168) = 2130;
  *(unsigned char *)(v0 + 7176) = 0;
  *(void *)(v0 + 7200) = &off_100070040;
  *(unsigned char *)(v0 + 7224) = 0;
  *(void *)(v0 + 7192) = 0x800000010005E830;
  *(void *)(v0 + 7240) = 0x800000010005E830;
  *(void *)(v0 + 7248) = &off_100070070;
  *(unsigned char *)(v0 + 7272) = 0;
  *(void *)(v0 + 6688) = 16;
  *(void *)(v0 + 7288) = 0x800000010005E870;
  *(void *)(v0 + 7296) = &off_1000700C0;
  *(unsigned char *)(v0 + 7320) = 0;
  *(void *)(v0 + 7336) = 0x800000010005E8A0;
  *(void *)(v0 + 7344) = &off_1000700F0;
  *(unsigned char *)(v0 + 7368) = 0;
  *(void *)(v0 + 7392) = &off_100070120;
  *(unsigned char *)(v0 + 7416) = 0;
  *(void *)(v0 + 7440) = &off_100070180;
  *(unsigned char *)(v0 + 7464) = 0;
  *(void *)(v0 + 7488) = &off_1000701D0;
  *(unsigned char *)(v0 + 7512) = 0;
  *(void *)(v0 + 7536) = &off_100070200;
  *(unsigned char *)(v0 + 7560) = 0;
  *(void *)(v0 + 7384) = 0x800000010005E8D0;
  *(void *)(v0 + 7432) = 0x800000010005E8D0;
  *(void *)(v0 + 7480) = 0x800000010005E8D0;
  *(void *)(v0 + 7528) = 0x800000010005E8D0;
  *(void *)(v0 + 7576) = 0x800000010005E8D0;
  *(void *)(v0 + 7584) = &off_100070230;
  *(unsigned char *)(v0 + 7608) = 0;
  *(void *)(v0 + 7632) = &off_100070270;
  *(unsigned char *)(v0 + 7656) = 0;
  *(void *)(v0 + 7680) = &off_1000702A0;
  *(unsigned char *)(v0 + 7704) = 0;
  *(void *)(v0 + 6440) = 1;
  *(void *)(v0 + 6448) = 2064;
  *(void *)(v0 + 6464) = 0xD00000000000002CLL;
  *(void *)(v0 + 7624) = 0x800000010005E900;
  *(void *)(v0 + 7672) = 0x800000010005E900;
  *(void *)(v0 + 7720) = 0x800000010005E900;
  *(void *)(v0 + 7728) = &off_1000702D0;
  *(void *)(v0 + 7744) = 2134;
  *(void *)(v0 + 6416) = 0xD00000000000002CLL;
  *(unsigned char *)(v0 + 7752) = 0;
  *(void *)(v0 + 6400) = 2128;
  *(void *)(v0 + 7768) = 0x800000010005E930;
  *(void *)(v0 + 6392) = 11;
  *(void *)(v0 + 7776) = &off_100070300;
  *(unsigned char *)(v0 + 7800) = 0;
  *(void *)(v0 + 6368) = 0xD000000000000031;
  *(void *)(v0 + 6344) = 1;
  *(void *)(v0 + 6352) = 64;
  *(void *)(v0 + 7816) = 0x800000010005E960;
  *(void *)(v0 + 7824) = &off_100070330;
  *(void *)(v0 + 6320) = 0xD00000000000002ALL;
  *(unsigned char *)(v0 + 7848) = 0;
  *(void *)(v0 + 6296) = 11;
  *(void *)(v0 + 6304) = 16;
  *(unsigned char *)(v0 + 7896) = 0;
  *(void *)(v0 + 7872) = &off_100070360;
  *(void *)(v0 + 7864) = 0x800000010005E990;
  *(void *)(v0 + 7912) = 0x800000010005E990;
  *(void *)(v0 + 6256) = 2064;
  *(unsigned char *)(v0 + 7944) = 0;
  *(void *)(v0 + 6248) = 3;
  *(void *)(v0 + 7920) = &off_1000703A0;
  *(void *)(v0 + 6152) = 1;
  *(void *)(v0 + 6160) = 2064;
  *(void *)(v0 + 6200) = 3;
  *(void *)(v0 + 6208) = 2048;
  *(void *)(v0 + 7328) = 0xD000000000000020;
  *(void *)(v0 + 7376) = 0xD000000000000020;
  *(void *)(v0 + 7424) = 0xD000000000000020;
  *(void *)(v0 + 7472) = 0xD000000000000020;
  *(void *)(v0 + 7520) = 0xD000000000000020;
  *(void *)(v0 + 7568) = 0xD000000000000020;
  *(void *)(v0 + 7616) = 0xD000000000000020;
  *(void *)(v0 + 7664) = 0xD000000000000020;
  *(void *)(v0 + 7712) = 0xD000000000000020;
  *(void *)(v0 + 7952) = 0xD000000000000020;
  *(void *)(v0 + 6112) = 16;
  *(void *)(v0 + 7960) = 0x800000010005E9C0;
  *(void *)(v0 + 6104) = 4;
  *(void *)(v0 + 7968) = &off_1000703D0;
  *(unsigned char *)(v0 + 7992) = 0;
  *(void *)(v0 + 6064) = 64;
  *(void *)(v0 + 6080) = 0xD000000000000023;
  *(unsigned char *)(v0 + 8040) = 0;
  *(void *)(v0 + 6056) = 1;
  *(void *)(v0 + 8016) = &off_100070410;
  *(unsigned char *)(v0 + 8088) = 0;
  *(void *)(v0 + 8064) = &off_100070440;
  *(void *)(v0 + 6008) = 3;
  *(void *)(v0 + 6016) = 2112;
  *(void *)(v0 + 8008) = 0x800000010005E9F0;
  *(void *)(v0 + 8056) = 0x800000010005E9F0;
  *(void *)(v0 + 8104) = 0x800000010005E9F0;
  *(void *)(v0 + 8112) = &off_100070490;
  *(unsigned char *)(v0 + 8136) = 0;
  *(void *)(v0 + 5960) = 2;
  *(void *)(v0 + 5968) = 2048;
  *(void *)(v0 + 8152) = 0x800000010005EA20;
  *(unsigned char *)(v0 + 8184) = 0;
  *(void *)(v0 + 8160) = &off_1000704C0;
  *(void *)(v0 + 8200) = 0x800000010005EA50;
  *(void *)(v0 + 5912) = 3;
  *(void *)(v0 + 5920) = 16;
  *(void *)(v0 + 8208) = &off_1000704F0;
  *(unsigned char *)(v0 + 8232) = 0;
  *(void *)(v0 + 8256) = &off_100070520;
  *(void *)(v0 + 5864) = 2;
  *(void *)(v0 + 5872) = 2064;
  *(unsigned char *)(v0 + 8280) = 0;
  *(void *)(v0 + 8304) = &off_100070560;
  *(unsigned char *)(v0 + 8328) = 0;
  *(void *)(v0 + 5816) = 2;
  *(void *)(v0 + 5824) = 16;
  *(void *)(v0 + 8248) = 0x800000010005EA90;
  *(void *)(v0 + 8296) = 0x800000010005EA90;
  *(void *)(v0 + 8344) = 0x800000010005EA90;
  *(void *)(v0 + 8352) = &off_100070590;
  *(void *)(v0 + 8400) = &off_1000705C0;
  *(void *)(v0 + 5776) = 64;
  *(unsigned char *)(v0 + 8424) = 0;
  *(void *)(v0 + 5768) = 1;
  *(void *)(v0 + 8448) = &off_100070660;
  *(unsigned char *)(v0 + 8472) = 0;
  *(void *)(v0 + 8488) = 0x800000010005EAF0;
  *(void *)(v0 + 5720) = 14;
  *(void *)(v0 + 5728) = 2128;
  *(unsigned char *)(v0 + 8376) = 0;
  *(void *)(v0 + 8496) = &off_100070690;
  *(void *)(v0 + 8536) = 0x800000010005EB20;
  *(void *)(v0 + 5680) = 64;
  *(void *)(v0 + 5696) = 0xD000000000000022;
  *(void *)(v0 + 8544) = &off_1000706C0;
  *(void *)(v0 + 5672) = 14;
  *(void *)(v0 + 8584) = 0x800000010005EB40;
  *(void *)(v0 + 5648) = 0xD000000000000022;
  *(void *)(v0 + 8592) = &off_1000706F0;
  *(void *)(v0 + 5624) = 13;
  *(void *)(v0 + 5632) = 2064;
  *(void *)(v0 + 8640) = &off_100070720;
  *(void *)(v0 + 5600) = 0xD000000000000022;
  *(void *)(v0 + 8632) = 0x800000010005EB70;
  *(void *)(v0 + 8680) = 0x800000010005EB70;
  *(void *)(v0 + 5576) = 7;
  *(void *)(v0 + 5584) = 2128;
  *(void *)(v0 + 8688) = &off_100070750;
  *(void *)(v0 + 5552) = 0xD000000000000022;
  *(void *)(v0 + 8728) = 0x800000010005EBA0;
  *(void *)(v0 + 8736) = &off_100070780;
  *(void *)(v0 + 5528) = 7;
  *(void *)(v0 + 5536) = 2064;
  *(void *)(v0 + 5440) = 64;
  *(void *)(v0 + 5480) = 7;
  *(void *)(v0 + 5488) = 80;
  *(void *)(v0 + 5504) = 0xD000000000000022;
  *(void *)(v0 + 5456) = 0xD000000000000022;
  *(unsigned char *)(v0 + 8520) = 0;
  *(unsigned char *)(v0 + 8568) = 0;
  *(unsigned char *)(v0 + 8616) = 0;
  *(unsigned char *)(v0 + 8664) = 0;
  *(unsigned char *)(v0 + 8712) = 0;
  *(unsigned char *)(v0 + 8760) = 0;
  *(void *)(v0 + 8784) = &off_1000707B0;
  *(void *)(v0 + 5432) = 7;
  *(unsigned char *)(v0 + 8808) = 0;
  *(void *)(v0 + 5392) = 80;
  *(void *)(v0 + 5408) = 0xD000000000000022;
  *(void *)(v0 + 8776) = 0x800000010005EBD0;
  *(void *)(v0 + 8824) = 0x800000010005EBD0;
  *(void *)(v0 + 5384) = 5;
  *(unsigned char *)(v0 + 8856) = 0;
  *(void *)(v0 + 5344) = 64;
  *(void *)(v0 + 5360) = 0xD000000000000022;
  *(void *)(v0 + 8832) = &off_1000707E0;
  *(void *)(v0 + 5336) = 5;
  *(void *)(v0 + 8800) = 3158;
  *(void *)(v0 + 8848) = 3158;
  *(void *)(v0 + 8872) = 0x800000010005EC00;
  *(void *)(v0 + 5296) = 16;
  *(void *)(v0 + 5312) = 0xD000000000000022;
  *(unsigned char *)(v0 + 8904) = 0;
  *(void *)(v0 + 5288) = 5;
  *(void *)(v0 + 8880) = &off_100070810;
  *(void *)(v0 + 5264) = 0xD000000000000022;
  *(void *)(v0 + 8920) = 0x800000010005EC30;
  *(void *)(v0 + 8928) = &off_100070840;
  *(void *)(v0 + 5240) = 4;
  *(void *)(v0 + 5248) = 64;
  *(unsigned char *)(v0 + 8952) = 0;
  *(void *)(v0 + 5200) = 80;
  *(void *)(v0 + 5216) = 0xD000000000000022;
  *(unsigned char *)(v0 + 9000) = 0;
  *(void *)(v0 + 5168) = 0xD000000000000022;
  *(void *)(v0 + 5192) = 3;
  *(void *)(v0 + 8976) = &off_100070870;
  *(void *)(v0 + 4400) = 0xD000000000000021;
  *(void *)(v0 + 4448) = 0xD000000000000021;
  *(void *)(v0 + 5120) = 0xD000000000000022;
  *(void *)(v0 + 5144) = 3;
  *(void *)(v0 + 5152) = 68;
  *(void *)(v0 + 4496) = 0xD000000000000021;
  *(void *)(v0 + 4544) = 0xD000000000000021;
  *(void *)(v0 + 4592) = 0xD000000000000021;
  *(void *)(v0 + 5072) = 0xD000000000000022;
  *(void *)(v0 + 5096) = 3;
  *(void *)(v0 + 5104) = 64;
  *(void *)(v0 + 4640) = 0xD000000000000021;
  *(void *)(v0 + 5000) = 2;
  *(void *)(v0 + 5008) = 64;
  *(void *)(v0 + 5024) = 0xD000000000000022;
  *(void *)(v0 + 5048) = 3;
  *(void *)(v0 + 5056) = 16;
  *(void *)(v0 + 8000) = 0xD000000000000021;
  *(void *)(v0 + 8048) = 0xD000000000000021;
  *(void *)(v0 + 8096) = 0xD000000000000021;
  *(void *)(v0 + 8960) = 0xD000000000000021;
  *(void *)(v0 + 9008) = 0xD000000000000021;
  *(void *)(v0 + 8968) = 0x800000010005EC60;
  *(void *)(v0 + 9016) = 0x800000010005EC60;
  *(void *)(v0 + 4976) = 0xD000000000000022;
  *(void *)(v0 + 9024) = &off_100070970;
  *(void *)(v0 + 4952) = 2;
  *(void *)(v0 + 4960) = 16;
  *(unsigned char *)(v0 + 9048) = 0;
  *(unsigned char *)(v0 + 9096) = 0;
  *(void *)(v0 + 4928) = 0xD000000000000022;
  *(void *)(v0 + 4904) = 1;
  *(void *)(v0 + 4912) = 2064;
  *(void *)(v0 + 9064) = 0x800000010005EC90;
  *(unsigned char *)(v0 + 9144) = 0;
  *(void *)(v0 + 4880) = 0xD000000000000022;
  *(unsigned char *)(v0 + 9192) = 0;
  *(void *)(v0 + 4856) = 1;
  *(void *)(v0 + 4864) = 2048;
  *(void *)(v0 + 9120) = &off_1000709A0;
  *(void *)(v0 + 4808) = 1;
  *(void *)(v0 + 4816) = 80;
  *(void *)(v0 + 4832) = 0xD000000000000022;
  *(void *)(v0 + 9168) = &off_1000709D0;
  *(void *)(v0 + 4760) = 1;
  *(void *)(v0 + 4768) = 64;
  *(void *)(v0 + 4784) = 0xD000000000000022;
  *(void *)(v0 + 7808) = 0xD000000000000025;
  *(void *)(v0 + 8768) = 0xD000000000000025;
  *(void *)(v0 + 8816) = 0xD000000000000025;
  *(void *)(v0 + 8864) = 0xD000000000000025;
  *(void *)(v0 + 9104) = 0xD000000000000025;
  *(void *)(v0 + 9152) = 0xD000000000000025;
  *(void *)(v0 + 9200) = 0xD000000000000025;
  *(void *)(v0 + 4736) = 0xD000000000000022;
  *(void *)(v0 + 4712) = 1;
  *(void *)(v0 + 4720) = 16;
  *(void *)(v0 + 9112) = 0x800000010005ECD0;
  *(void *)(v0 + 9160) = 0x800000010005ECD0;
  *(void *)(v0 + 9208) = 0x800000010005ECD0;
  *(void *)(v0 + 4688) = 0xD000000000000022;
  *(void *)(v0 + 9216) = &off_100070A00;
  *(unsigned char *)(v0 + 9240) = 0;
  *(void *)(v0 + 4664) = 15;
  *(void *)(v0 + 4672) = 2132;
  *(void *)(v0 + 9248) = 0xD00000000000002DLL;
  *(void *)(v0 + 9256) = 0x800000010005ED00;
  *(void *)(v0 + 9264) = &off_100070A30;
  *(void *)(v0 + 4616) = 3;
  *(void *)(v0 + 4624) = 16;
  *(unsigned char *)(v0 + 9288) = 0;
  *(void *)(v0 + 4568) = 2;
  *(void *)(v0 + 4576) = 2064;
  *(void *)(v0 + 4064) = 0xD00000000000002FLL;
  *(void *)(v0 + 4112) = 0xD00000000000002FLL;
  *(void *)(v0 + 4160) = 0xD00000000000002FLL;
  *(void *)(v0 + 4208) = 0xD00000000000002FLL;
  *(void *)(v0 + 4256) = 0xD00000000000002FLL;
  *(void *)(v0 + 4528) = 2048;
  *(void *)(v0 + 4304) = 0xD00000000000002FLL;
  *(void *)(v0 + 4352) = 0xD00000000000002FLL;
  *(void *)(v0 + 9296) = 0xD00000000000002FLL;
  *(void *)(v0 + 4520) = 2;
  *(void *)(v0 + 9304) = 0x800000010005ED30;
  *(void *)(v0 + 9312) = &off_100070A60;
  *(unsigned char *)(v0 + 9336) = 0;
  *(void *)(v0 + 4472) = 1;
  *(void *)(v0 + 4480) = 2064;
  *(unsigned char *)(v0 + 9384) = 0;
  *(void *)(v0 + 9360) = &off_100070A90;
  *(void *)(v0 + 9408) = &off_100070AC0;
  *(unsigned char *)(v0 + 9432) = 0;
  *(void *)(v0 + 4432) = 16;
  *(unsigned char *)(v0 + 9480) = 0;
  *(void *)(v0 + 4424) = 1;
  *(void *)(v0 + 9456) = &off_100070B00;
  *(void *)(v0 + 4328) = 7;
  *(void *)(v0 + 4336) = 2064;
  *(void *)(v0 + 4376) = 7;
  *(void *)(v0 + 4384) = 2128;
  *(void *)(v0 + 7280) = 0xD000000000000023;
  *(void *)(v0 + 8480) = 0xD000000000000023;
  *(void *)(v0 + 8624) = 0xD000000000000023;
  *(void *)(v0 + 8672) = 0xD000000000000023;
  *(void *)(v0 + 9344) = 0xD000000000000023;
  *(void *)(v0 + 9392) = 0xD000000000000023;
  *(void *)(v0 + 9440) = 0xD000000000000023;
  *(void *)(v0 + 9488) = 0xD000000000000023;
  *(void *)(v0 + 4280) = 6;
  *(void *)(v0 + 4288) = 16;
  *(void *)(v0 + 9352) = 0x800000010005ED60;
  *(void *)(v0 + 9400) = 0x800000010005ED60;
  *(void *)(v0 + 9448) = 0x800000010005ED60;
  *(void *)(v0 + 9496) = 0x800000010005ED60;
  *(void *)(v0 + 9504) = &off_100070B30;
  *(unsigned char *)(v0 + 9528) = 0;
  *(void *)(v0 + 4240) = 2048;
  *(unsigned char *)(v0 + 9576) = 0;
  *(void *)(v0 + 4232) = 2;
  *(void *)(v0 + 9552) = &off_100070B60;
  *(void *)(v0 + 9544) = 0x800000010005ED90;
  *(void *)(v0 + 9592) = 0x800000010005ED90;
  *(void *)(v0 + 9600) = &off_100070B90;
  *(void *)(v0 + 4184) = 2;
  *(void *)(v0 + 4192) = 16;
  *(unsigned char *)(v0 + 9624) = 0;
  *(void *)(v0 + 9640) = 0x800000010005EDC0;
  *(void *)(v0 + 9648) = &off_100070BC0;
  *(void *)(v0 + 4144) = 64;
  *(unsigned char *)(v0 + 9672) = 0;
  *(void *)(v0 + 9680) = 0xD000000000000038;
  *(void *)(v0 + 4136) = 1;
  *(void *)(v0 + 9688) = 0x800000010005EE00;
  *(void *)(v0 + 9696) = &off_100070BF0;
  *(unsigned char *)(v0 + 9720) = 0;
  *(void *)(v0 + 4096) = 16;
  *(void *)(v0 + 9736) = 0x800000010005EE40;
  *(void *)(v0 + 4088) = 1;
  *(void *)(v0 + 9744) = &off_100070C20;
  *(void *)(v0 + 4048) = 2128;
  *(unsigned char *)(v0 + 4056) = 0;
  *(unsigned char *)(v0 + 9768) = 0;
  *(unsigned char *)(v0 + 9816) = 0;
  *(void *)(v0 + 4040) = 7;
  *(void *)(v0 + 4000) = 80;
  *(unsigned char *)(v0 + 4008) = 0;
  *(void *)(v0 + 9784) = 0x800000010005EE80;
  *(void *)(v0 + 3968) = 0xD000000000000027;
  *(void *)(v0 + 3992) = 3;
  *(void *)(v0 + 9792) = &off_100070C50;
  *(void *)(v0 + 3944) = 2;
  *(void *)(v0 + 3952) = 2064;
  *(unsigned char *)(v0 + 3960) = 0;
  *(void *)(v0 + 9056) = 0xD000000000000035;
  *(void *)(v0 + 9824) = 0xD000000000000035;
  *(unsigned char *)(v0 + 3912) = 0;
  *(void *)(v0 + 3920) = 0xD000000000000027;
  *(void *)(v0 + 9832) = 0x800000010005EEC0;
  *(void *)(v0 + 3896) = 2;
  *(void *)(v0 + 3904) = 16;
  *(void *)(v0 + 9840) = &off_100070C80;
  *(unsigned char *)(v0 + 9864) = 0;
  *(unsigned char *)(v0 + 3864) = 0;
  *(void *)(v0 + 3872) = 0xD000000000000027;
  *(void *)(v0 + 3848) = 1;
  *(void *)(v0 + 3856) = 16;
  *(void *)(v0 + 9880) = 0x800000010005EF00;
  *(void *)(v0 + 3808) = 64;
  *(unsigned char *)(v0 + 3816) = 0;
  *(void *)(v0 + 3824) = 0xD000000000000027;
  *(void *)(v0 + 9888) = &off_100070CE0;
  *(unsigned char *)(v0 + 9912) = 0;
  *(void *)(v0 + 9920) = 0xD000000000000031;
  *(void *)(v0 + 3800) = 4;
  *(unsigned char *)(v0 + 9960) = 0;
  *(void *)(v0 + 3752) = 4;
  *(void *)(v0 + 3760) = 64;
  *(unsigned char *)(v0 + 3768) = 0;
  *(unsigned char *)(v0 + 3720) = 0;
  *(void *)(v0 + 3728) = 0xD00000000000002ALL;
  *(void *)(v0 + 9928) = 0x800000010005EF50;
  *(void *)(v0 + 3696) = &_swiftEmptyArrayStorage;
  *(void *)(v0 + 3704) = 1;
  *(void *)(v0 + 3712) = 64;
  *(void *)(v0 + 9936) = &off_100070D10;
  *(void *)(v0 + 3664) = 64;
  *(unsigned char *)(v0 + 3672) = 0;
  *(void *)(v0 + 3680) = 0xD00000000000002ALL;
  *(void *)(v0 + 9776) = 0xD000000000000039;
  *(void *)(v0 + 9968) = 0xD000000000000039;
  *(void *)(v0 + 3656) = 1;
  *(void *)(v0 + 9976) = 0x800000010005EF90;
  *(void *)(v0 + 9984) = &off_100070D40;
  *(void *)(v0 + 3616) = 64;
  *(unsigned char *)(v0 + 3624) = 0;
  *(unsigned char *)(v0 + 10008) = 0;
  *(void *)(v0 + 3584) = 0xD000000000000040;
  *(void *)(v0 + 3608) = 1;
  *(void *)(v0 + 0x2000) = 0xD000000000000033;
  *(void *)(v0 + 10016) = 0xD000000000000033;
  *(void *)(v0 + 3568) = 64;
  *(unsigned char *)(v0 + 3576) = 0;
  *(void *)(v0 + 10024) = 0x800000010005EFD0;
  *(void *)(v0 + 3560) = 2;
  *(void *)(v0 + 10032) = &off_100070D70;
  *(void *)(v0 + 3512) = 1;
  *(void *)(v0 + 3520) = 64;
  *(unsigned char *)(v0 + 3528) = 0;
  *(unsigned char *)(v0 + 10056) = 0;
  *(void *)(v0 + 3472) = 2128;
  *(unsigned char *)(v0 + 3480) = 0;
  *(void *)(v0 + 3488) = 0xD000000000000022;
  *(void *)(v0 + 8528) = 0xD00000000000001FLL;
  *(void *)(v0 + 10064) = 0xD00000000000001FLL;
  *(void *)(v0 + 3464) = 15;
  *(void *)(v0 + 10072) = 0x800000010005F010;
  *(void *)(v0 + 10080) = &off_100070DA0;
  *(unsigned char *)(v0 + 3432) = 0;
  *(unsigned char *)(v0 + 10104) = 0;
  *(void *)(v0 + 3416) = 15;
  *(void *)(v0 + 10944) = &off_100071140;
  *(unsigned char *)(v0 + 10968) = 0;
  *(unsigned char *)(v0 + 3384) = 0;
  *(unsigned char *)(v0 + 11016) = 0;
  *(void *)(v0 + 3368) = 15;
  *(void *)(v0 + 3376) = 80;
  *(void *)(v0 + 10992) = &off_100071170;
  *(unsigned char *)(v0 + 3096) = 0;
  *(void *)(v0 + 3128) = 6;
  *(void *)(v0 + 3320) = 14;
  *(void *)(v0 + 3328) = 80;
  *(unsigned char *)(v0 + 3336) = 0;
  *(void *)(v0 + 3136) = 80;
  *(unsigned char *)(v0 + 3144) = 0;
  *(void *)(v0 + 3176) = 7;
  *(void *)(v0 + 3272) = 12;
  *(void *)(v0 + 3280) = 2132;
  *(unsigned char *)(v0 + 3288) = 0;
  *(void *)(v0 + 3184) = 64;
  *(unsigned char *)(v0 + 3192) = 0;
  *(void *)(v0 + 3224) = 12;
  *(unsigned char *)(v0 + 3240) = 0;
  *(void *)(v0 + 7088) = 0xD00000000000002CLL;
  *(void *)(v0 + 9856) = 64;
  *(void *)(v0 + 9896) = 3;
  *(void *)(v0 + 9944) = 1;
  *(void *)(v0 + 9952) = 64;
  *(void *)(v0 + 9992) = 11;
  *(void *)(v0 + 10000) = 2128;
  *(void *)(v0 + 10040) = 1;
  *(void *)(v0 + 10088) = 5;
  *(void *)(v0 + 10928) = 0xD000000000000040;
  *(void *)(v0 + 10976) = 0xD000000000000040;
  *(void *)(v0 + 11024) = 0xD000000000000040;
  *(void *)(v0 + 10096) = 16;
  *(void *)(v0 + 10936) = 0x800000010005F1E0;
  *(void *)(v0 + 10984) = 0x800000010005F1E0;
  *(void *)(v0 + 11032) = 0x800000010005F1E0;
  *(void *)(v0 + 11040) = &off_1000711A0;
  *(unsigned char *)(v0 + 11064) = 0;
  *(void *)(v0 + 11072) = 0xD00000000000006BLL;
  *(void *)(v0 + 11080) = 0x800000010005F230;
  *(void *)(v0 + 11088) = &off_1000711D0;
  *(unsigned char *)(v0 + 11112) = 0;
  *(void *)(v0 + 11128) = 0x800000010005F2A0;
  *(unsigned char *)(v0 + 11160) = 0;
  *(void *)(v0 + 11136) = &off_100071200;
  *(void *)(v0 + 11120) = 0xD000000000000064;
  *(void *)(v0 + 11168) = 0xD000000000000064;
  *(void *)(v0 + 10048) = 80;
  *(void *)(v0 + 11176) = 0x800000010005F310;
  *(void *)(v0 + 11184) = &off_100071230;
  *(unsigned char *)(v0 + 11208) = 0;
  *(void *)(v0 + 11224) = 0x800000010005F380;
  *(void *)(v0 + 11232) = &off_100071300;
  *(unsigned char *)(v0 + 11256) = 0;
  *(void *)(v0 + 11280) = &off_100071330;
  *(unsigned char *)(v0 + 11304) = 0;
  *(void *)(v0 + 11264) = 0xD00000000000005DLL;
  *(void *)(v0 + 11312) = 0xD00000000000005DLL;
  *(void *)(v0 + 11272) = 0x800000010005F3E0;
  *(void *)(v0 + 11320) = 0x800000010005F3E0;
  *(void *)(v0 + 11328) = &off_100071360;
  *(unsigned char *)(v0 + 11352) = 0;
  *(void *)(v0 + 11368) = 0x800000010005F440;
  *(unsigned char *)(v0 + 11400) = 0;
  *(void *)(v0 + 11408) = 0xD000000000000065;
  *(void *)(v0 + 9904) = 80;
  *(void *)(v0 + 11416) = 0x800000010005F4B0;
  *(void *)(v0 + 11424) = &off_100071390;
  *(unsigned char *)(v0 + 11448) = 0;
  *(void *)(v0 + 11456) = 0xD00000000000005ALL;
  *(void *)(v0 + 9872) = 0xD00000000000004DLL;
  *(void *)(v0 + 11464) = 0x800000010005F520;
  *(void *)(v0 + 11472) = &off_100071410;
  *(void *)(v0 + 9848) = 1;
  *(unsigned char *)(v0 + 11496) = 0;
  *(void *)(v0 + 11520) = &off_100071440;
  *(unsigned char *)(v0 + 11544) = 0;
  *(void *)(v0 + 9800) = 1;
  *(void *)(v0 + 9808) = 16;
  *(void *)(v0 + 11568) = &off_100071470;
  *(unsigned char *)(v0 + 11592) = 0;
  *(void *)(v0 + 9752) = 1;
  *(void *)(v0 + 9760) = 16;
  *(void *)(v0 + 11512) = 0x800000010005F580;
  *(void *)(v0 + 11560) = 0x800000010005F580;
  *(void *)(v0 + 11608) = 0x800000010005F580;
  *(unsigned char *)(v0 + 11640) = 0;
  *(void *)(v0 + 9728) = 0xD000000000000032;
  *(unsigned char *)(v0 + 11688) = 0;
  *(void *)(v0 + 9712) = 16;
  *(void *)(v0 + 11616) = &off_1000714A0;
  *(void *)(v0 + 9704) = 1;
  *(void *)(v0 + 11656) = 0x800000010005F5E0;
  *(void *)(v0 + 11696) = 0xD000000000000053;
  *(unsigned char *)(v0 + 11736) = 0;
  *(void *)(v0 + 9656) = 1;
  *(void *)(v0 + 9664) = 64;
  *(void *)(v0 + 11704) = 0x800000010005F640;
  *(void *)(v0 + 9608) = 3;
  *(void *)(v0 + 9616) = 2048;
  *(void *)(v0 + 9632) = 0xD000000000000032;
  *(void *)(v0 + 11504) = 0xD000000000000057;
  *(void *)(v0 + 11552) = 0xD000000000000057;
  *(void *)(v0 + 11600) = 0xD000000000000057;
  *(void *)(v0 + 11744) = 0xD000000000000057;
  *(void *)(v0 + 9584) = 0xD000000000000022;
  *(void *)(v0 + 11752) = 0x800000010005F6A0;
  *(void *)(v0 + 9536) = 0xD000000000000022;
  *(void *)(v0 + 9560) = 1;
  *(void *)(v0 + 9568) = 2048;
  *(void *)(v0 + 9072) = &_swiftEmptyArrayStorage;
  *(void *)(v0 + 9512) = 6;
  *(void *)(v0 + 9520) = 18;
  *(void *)(v0 + 11376) = &_swiftEmptyArrayStorage;
  *(void *)(v0 + 11664) = &_swiftEmptyArrayStorage;
  *(void *)(v0 + 11712) = &_swiftEmptyArrayStorage;
  *(void *)(v0 + 11760) = &_swiftEmptyArrayStorage;
  *(unsigned char *)(v0 + 11784) = 0;
  *(void *)(v0 + 9472) = 16;
  *(void *)(v0 + 11800) = 0x800000010005F700;
  *(void *)(v0 + 11808) = &off_1000714D0;
  *(unsigned char *)(v0 + 11832) = 0;
  *(void *)(v0 + 9464) = 6;
  *(void *)(v0 + 11840) = 0xD00000000000003CLL;
  *(void *)(v0 + 11848) = 0x800000010005F740;
  *(void *)(v0 + 11856) = &off_100071500;
  *(void *)(v0 + 9416) = 2;
  *(void *)(v0 + 9424) = 16;
  *(unsigned char *)(v0 + 11880) = 0;
  *(void *)(v0 + 11888) = 0xD00000000000003DLL;
  *(void *)(v0 + 9376) = 16;
  *(void *)(v0 + 11896) = 0x800000010005F780;
  *(void *)(v0 + 11904) = &off_100071530;
  *(unsigned char *)(v0 + 11928) = 0;
  *(void *)(v0 + 9368) = 1;
  *(void *)(v0 + 11944) = 0x800000010005F7C0;
  *(unsigned char *)(v0 + 11976) = 0;
  *(void *)(v0 + 9320) = 2;
  *(void *)(v0 + 9328) = 2064;
  *(void *)(v0 + 11952) = &off_100071560;
  *(void *)(v0 + 11792) = 0xD000000000000034;
  *(void *)(v0 + 11984) = 0xD000000000000034;
  *(void *)(v0 + 9272) = 1;
  *(void *)(v0 + 9280) = 2128;
  *(void *)(v0 + 11992) = 0x800000010005F800;
  *(void *)(v0 + 12000) = &off_100071590;
  *(unsigned char *)(v0 + 12024) = 0;
  *(void *)(v0 + 9232) = 80;
  *(void *)(v0 + 7184) = 0xD000000000000030;
  *(void *)(v0 + 7232) = 0xD000000000000030;
  *(void *)(v0 + 12032) = 0xD000000000000030;
  *(void *)(v0 + 9224) = 15;
  *(void *)(v0 + 12040) = 0x800000010005F840;
  *(void *)(v0 + 12048) = &off_1000715C0;
  *(unsigned char *)(v0 + 12072) = 0;
  *(void *)(v0 + 9176) = 5;
  *(void *)(v0 + 9184) = 64;
  *(unsigned char *)(v0 + 12120) = 0;
  *(void *)(v0 + 12096) = &off_1000715F0;
  *(void *)(v0 + 12088) = 0x800000010005F880;
  *(void *)(v0 + 12136) = 0x800000010005F880;
  *(void *)(v0 + 9136) = 64;
  *(unsigned char *)(v0 + 12168) = 0;
  *(void *)(v0 + 9128) = 1;
  *(void *)(v0 + 12144) = &off_100071620;
  *(unsigned char *)(v0 + 12216) = 0;
  *(void *)(v0 + 12192) = &off_100071650;
  *(void *)(v0 + 9080) = 1;
  *(void *)(v0 + 9088) = 64;
  *(void *)(v0 + 12184) = 0x800000010005F8B0;
  *(void *)(v0 + 12232) = 0x800000010005F8B0;
  *(void *)(v0 + 12240) = &off_100071680;
  *(unsigned char *)(v0 + 12264) = 0;
  *(void *)(v0 + 8704) = 2132;
  *(void *)(v0 + 9032) = 3;
  *(void *)(v0 + 9040) = 2128;
  *(void *)(v0 + 12256) = 2132;
  *(void *)(v0 + 8888) = 2;
  *(void *)(v0 + 8984) = 1;
  *(void *)(v0 + 8992) = 64;
  *(void *)(v0 + 8896) = 16;
  *(void *)(v0 + 8912) = 0xD000000000000027;
  *(void *)(v0 + 8936) = 5;
  *(void *)(v0 + 8944) = 2068;
  *(void *)(v0 + 12176) = 0xD00000000000002ALL;
  *(void *)(v0 + 12224) = 0xD00000000000002ALL;
  *(void *)(v0 + 12272) = 0xD00000000000002ALL;
  *(void *)(v0 + 12280) = 0x800000010005F8E0;
  *(void *)(v0 + 12288) = &off_1000716B0;
  *(unsigned char *)(v0 + 12312) = 0;
  *(void *)(v0 + 7112) = 1;
  *(void *)(v0 + 7120) = 64;
  *(void *)(v0 + 7136) = 0xD00000000000002CLL;
  *(void *)(v0 + 8840) = 15;
  *(void *)(v0 + 7160) = 3;
  *(void *)(v0 + 7208) = 1;
  *(void *)(v0 + 7216) = 2048;
  *(void *)(v0 + 7856) = 0xD00000000000002CLL;
  *(void *)(v0 + 7904) = 0xD00000000000002CLL;
  *(void *)(v0 + 8720) = 0xD000000000000027;
  *(void *)(v0 + 8792) = 7;
  *(void *)(v0 + 12080) = 0xD00000000000002CLL;
  *(void *)(v0 + 12128) = 0xD00000000000002CLL;
  *(void *)(v0 + 12320) = 0xD00000000000002CLL;
  *(void *)(v0 + 12328) = 0x800000010005F910;
  *(void *)(v0 + 12336) = &off_1000716E0;
  *(unsigned char *)(v0 + 12360) = 0;
  *(void *)(v0 + 8744) = 13;
  *(void *)(v0 + 8752) = 20;
  *(void *)(v0 + 7256) = 3;
  *(void *)(v0 + 7264) = 2064;
  *(void *)(v0 + 7304) = 4;
  *(void *)(v0 + 7312) = 2064;
  *(void *)(v0 + 7352) = 1;
  *(void *)(v0 + 8696) = 3;
  *(void *)(v0 + 7360) = 2064;
  *(void *)(v0 + 7400) = 2;
  *(void *)(v0 + 7408) = 64;
  *(void *)(v0 + 7448) = 4;
  *(void *)(v0 + 8648) = 1;
  *(void *)(v0 + 8656) = 16;
  *(void *)(v0 + 7456) = 64;
  *(void *)(v0 + 7496) = 4;
  *(void *)(v0 + 7504) = 2064;
  *(void *)(v0 + 8576) = 0xD000000000000022;
  *(void *)(v0 + 8600) = 2;
  *(void *)(v0 + 8608) = 16;
  *(void *)(v0 + 7544) = 5;
  *(void *)(v0 + 7552) = 64;
  *(void *)(v0 + 7592) = 6;
  *(void *)(v0 + 7600) = 64;
  *(void *)(v0 + 8552) = 2;
  *(void *)(v0 + 8560) = 2048;
  *(void *)(v0 + 7640) = 1;
  *(void *)(v0 + 8512) = 16;
  *(void *)(v0 + 11936) = 0xD000000000000037;
  *(void *)(v0 + 12368) = 0xD000000000000037;
  *(void *)(v0 + 12376) = 0x800000010005F940;
  *(void *)(v0 + 12384) = &off_100071710;
  *(unsigned char *)(v0 + 12408) = 0;
  *(void *)(v0 + 8504) = 2;
  *(void *)(v0 + 7648) = 16;
  *(void *)(v0 + 8440) = 0x800000010005EAC0;
  *(void *)(v0 + 8456) = 7;
  *(void *)(v0 + 8464) = 2128;
  *(void *)(v0 + 7688) = 14;
  *(void *)(v0 + 7696) = 68;
  *(void *)(v0 + 8368) = 2128;
  *(void *)(v0 + 8408) = 1;
  *(void *)(v0 + 8416) = 64;
  *(void *)(v0 + 8432) = 0xD000000000000027;
  *(void *)(v0 + 7736) = 15;
  *(void *)(v0 + 7760) = 0xD000000000000027;
  *(void *)(v0 + 7784) = 6;
  *(void *)(v0 + 8320) = 2048;
  *(void *)(v0 + 8336) = 0xD000000000000022;
  *(void *)(v0 + 8360) = 7;
  *(void *)(v0 + 7792) = 64;
  *(void *)(v0 + 7832) = 1;
  *(void *)(v0 + 7840) = 64;
  *(void *)(v0 + 8272) = 16;
  *(void *)(v0 + 8288) = 0xD000000000000022;
  *(void *)(v0 + 8312) = 1;
  *(void *)(v0 + 7880) = 1;
  *(void *)(v0 + 7888) = 16;
  *(void *)(v0 + 7928) = 5;
  *(void *)(v0 + 8224) = 16;
  *(void *)(v0 + 8240) = 0xD000000000000022;
  *(void *)(v0 + 8264) = 1;
  *(void *)(v0 + 7936) = 16;
  *(void *)(v0 + 7976) = 1;
  *(void *)(v0 + 7984) = 16;
  *(void *)(v0 + 8024) = 1;
  *(void *)(v0 + 8176) = 80;
  *(void *)(v0 + 8216) = 5;
  *(void *)(v0 + 8032) = 2064;
  *(void *)(v0 + 8072) = 3;
  *(void *)(v0 + 8080) = 16;
  *(void *)(v0 + 8128) = 2048;
  *(void *)(v0 + 8144) = 0xD000000000000022;
  *(void *)(v0 + 8168) = 1;
  *(void *)(v0 + 8120) = 3;
  *(void *)(v0 + 10952) = 1;
  *(void *)(v0 + 10960) = 2064;
  *(void *)(v0 + 11000) = 1;
  *(void *)(v0 + 11008) = 2128;
  *(void *)(v0 + 11048) = 11;
  *(void *)(v0 + 11056) = 80;
  *(void *)(v0 + 11096) = 2;
  *(void *)(v0 + 11104) = 2064;
  *(void *)(v0 + 12416) = 0xD000000000000032;
  *(void *)(v0 + 12424) = 0x800000010005F980;
  *(void *)(v0 + 12432) = &off_100071740;
  *(unsigned char *)(v0 + 12456) = 0;
  *(void *)(v0 + 12480) = &off_100071770;
  *(unsigned char *)(v0 + 12504) = 0;
  *(void *)(v0 + 12528) = &off_1000717A0;
  *(unsigned char *)(v0 + 12552) = 0;
  *(void *)(v0 + 12576) = &off_1000717D0;
  *(unsigned char *)(v0 + 12600) = 0;
  *(void *)(v0 + 12624) = &off_100071800;
  *(void *)(v0 + 8384) = 0xD000000000000027;
  *(void *)(v0 + 12464) = 0xD00000000000004CLL;
  *(void *)(v0 + 12472) = 0x800000010005F9C0;
  *(void *)(v0 + 12512) = 0xD00000000000004CLL;
  *(void *)(v0 + 12520) = 0x800000010005F9C0;
  *(void *)(v0 + 12560) = 0xD00000000000004CLL;
  *(void *)(v0 + 12568) = 0x800000010005F9C0;
  *(void *)(v0 + 12608) = 0xD00000000000004CLL;
  *(void *)(v0 + 12616) = 0x800000010005F9C0;
  *(unsigned char *)(v0 + 12648) = 0;
  *(void *)(v0 + 12664) = 0x800000010005F9C0;
  *(void *)(v0 + 12656) = 0xD00000000000004CLL;
  *(void *)(v0 + 12672) = &off_100071830;
  *(unsigned char *)(v0 + 12696) = 0;
  *(void *)(v0 + 12712) = 0x800000010005FA10;
  *(void *)(v0 + 12720) = &off_100071860;
  *(unsigned char *)(v0 + 12744) = 0;
  *(void *)(v0 + 12768) = &off_100071890;
  *(void *)(v0 + 12816) = &off_1000718C0;
  *(void *)(v0 + 12864) = &off_1000718F0;
  *(void *)(v0 + 12760) = 0x800000010005FA60;
  *(unsigned char *)(v0 + 12792) = 0;
  *(void *)(v0 + 12808) = 0x800000010005FA60;
  *(unsigned char *)(v0 + 12840) = 0;
  *(void *)(v0 + 12856) = 0x800000010005FA60;
  *(unsigned char *)(v0 + 12888) = 0;
  *(void *)(v0 + 12904) = 0x800000010005FA60;
  *(void *)(v0 + 12912) = &off_100071920;
  *(unsigned char *)(v0 + 12936) = 0;
  *(void *)(v0 + 12960) = &off_100071950;
  *(unsigned char *)(v0 + 12984) = 0;
  *(void *)(v0 + 13008) = &off_100071980;
  *(unsigned char *)(v0 + 13032) = 0;
  *(void *)(v0 + 13056) = &off_1000719B0;
  *(unsigned char *)(v0 + 13080) = 0;
  *(void *)(v0 + 13104) = &off_1000719E0;
  *(unsigned char *)(v0 + 13128) = 0;
  *(void *)(v0 + 12952) = 0x800000010005FAB0;
  *(void *)(v0 + 13000) = 0x800000010005FAB0;
  *(void *)(v0 + 13048) = 0x800000010005FAB0;
  *(void *)(v0 + 13096) = 0x800000010005FAB0;
  *(void *)(v0 + 13144) = 0x800000010005FAB0;
  *(void *)(v0 + 13152) = &off_100071A10;
  *(void *)(v0 + 13168) = 22;
  *(unsigned char *)(v0 + 13176) = 0;
  *(void *)(v0 + 13200) = &off_100071A40;
  *(unsigned char *)(v0 + 13224) = 0;
  *(void *)(v0 + 13248) = &off_100071A70;
  *(unsigned char *)(v0 + 13272) = 0;
  *(void *)(v0 + 13296) = &off_100071AA0;
  *(unsigned char *)(v0 + 13320) = 0;
  *(void *)(v0 + 13184) = 0xD000000000000048;
  *(void *)(v0 + 13232) = 0xD000000000000048;
  *(void *)(v0 + 13280) = 0xD000000000000048;
  *(void *)(v0 + 13328) = 0xD000000000000048;
  *(void *)(v0 + 13192) = 0x800000010005FB00;
  *(void *)(v0 + 13240) = 0x800000010005FB00;
  *(void *)(v0 + 13288) = 0x800000010005FB00;
  *(void *)(v0 + 13336) = 0x800000010005FB00;
  *(void *)(v0 + 13344) = &off_100071AD0;
  *(unsigned char *)(v0 + 13368) = 0;
  *(void *)(v0 + 13392) = &off_100071B00;
  *(unsigned char *)(v0 + 13416) = 0;
  *(void *)(v0 + 13440) = &off_100071B30;
  *(unsigned char *)(v0 + 13464) = 0;
  *(void *)(v0 + 13384) = 0x800000010005FB50;
  *(void *)(v0 + 13432) = 0x800000010005FB50;
  *(void *)(v0 + 13480) = 0x800000010005FB50;
  *(void *)(v0 + 13488) = &off_100071B60;
  *(unsigned char *)(v0 + 13512) = 0;
  *(void *)(v0 + 13536) = &off_100071B90;
  *(unsigned char *)(v0 + 13560) = 0;
  *(void *)(v0 + 13520) = 0xD00000000000004CLL;
  *(void *)(v0 + 13568) = 0xD00000000000004CLL;
  *(void *)(v0 + 13528) = 0x800000010005FBB0;
  *(void *)(v0 + 13576) = 0x800000010005FBB0;
  *(void *)(v0 + 13584) = &off_100071BC0;
  *(unsigned char *)(v0 + 13608) = 0;
  *(void *)(v0 + 13624) = 0x800000010005FC00;
  *(unsigned char *)(v0 + 13656) = 0;
  *(void *)(v0 + 13632) = &off_100071BF0;
  *(void *)(v0 + 13672) = 0x800000010005FC50;
  *(void *)(v0 + 13680) = &off_100071C20;
  *(unsigned char *)(v0 + 13704) = 0;
  *(void *)(v0 + 13728) = &off_100071C50;
  *(unsigned char *)(v0 + 13752) = 0;
  *(void *)(v0 + 13720) = 0x800000010005FC50;
  *(void *)(v0 + 13768) = 0x800000010005FC50;
  *(void *)(v0 + 13776) = &off_100071C80;
  *(unsigned char *)(v0 + 13800) = 0;
  *(void *)(v0 + 13824) = &off_100071CB0;
  *(unsigned char *)(v0 + 13848) = 0;
  *(void *)(v0 + 13816) = 0x800000010005FCA0;
  *(void *)(v0 + 13864) = 0x800000010005FCA0;
  *(void *)(v0 + 13872) = &off_100071CE0;
  *(unsigned char *)(v0 + 13896) = 0;
  *(void *)(v0 + 13920) = &off_100071D10;
  *(unsigned char *)(v0 + 13944) = 0;
  *(unsigned char *)(v0 + 13992) = 0;
  *(unsigned char *)(v0 + 14040) = 0;
  *(unsigned char *)(v0 + 14088) = 0;
  *(unsigned char *)(v0 + 14136) = 0;
  *(unsigned char *)(v0 + 14184) = 0;
  *(unsigned char *)(v0 + 14232) = 0;
  *(unsigned char *)(v0 + 14328) = 0;
  *(unsigned char *)(v0 + 14376) = 0;
  *(unsigned char *)(v0 + 14424) = 0;
  *(unsigned char *)(v0 + 14472) = 0;
  *(unsigned char *)(v0 + 14568) = 0;
  *(unsigned char *)(v0 + 14664) = 0;
  *(unsigned char *)(v0 + 14760) = 0;
  *(unsigned char *)(v0 + 14856) = 0;
  *(unsigned char *)(v0 + 14904) = 0;
  *(unsigned char *)(v0 + 14952) = 0;
  *(void *)(v0 + 15104) = 0xD00000000000004ALL;
  *(unsigned char *)(v0 + 15144) = 0;
  *(unsigned char *)(v0 + 15192) = 0;
  *(unsigned char *)(v0 + 15240) = 0;
  *(unsigned char *)(v0 + 15288) = 0;
  *(unsigned char *)(v0 + 15384) = 0;
  *(unsigned char *)(v0 + 15528) = 0;
  *(unsigned char *)(v0 + 15672) = 0;
  *(unsigned char *)(v0 + 15720) = 0;
  *(unsigned char *)(v0 + 15768) = 0;
  *(unsigned char *)(v0 + 15864) = 0;
  *(unsigned char *)(v0 + 16200) = 0;
  *(void *)(v0 + 13968) = &off_100071D50;
  *(void *)(v0 + 16304) = 0xD000000000000075;
  *(void *)(v0 + 16368) = &off_1000726D0;
  *(unsigned char *)(v0 + 16440) = 0;
  *(unsigned char *)(v0 + 16488) = 0;
  *(unsigned char *)(v0 + 16632) = 0;
  *(unsigned char *)(v0 + 16680) = 0;
  *(void *)(v0 + 16832) = 0xD00000000000006CLL;
  *(void *)(v0 + 16880) = 0xD00000000000006ELL;
  *(void *)(v0 + 16928) = 0xD000000000000066;
  *(void *)(v0 + 17032) = 0x8000000100060890;
  *(void *)(v0 + 16976) = 0xD00000000000006DLL;
  *(void *)(v0 + 17008) = 2064;
  *(unsigned char *)(v0 + 17016) = 0;
  *(void *)(v0 + 17024) = 0xD000000000000058;
  *(void *)(v0 + 16992) = &off_100072990;
  *(void *)(v0 + 17000) = 1;
  *(void *)(v0 + 16984) = 0x8000000100060820;
  *(unsigned char *)(v0 + 16968) = 0;
  *(void *)(v0 + 16944) = &off_100072950;
  *(void *)(v0 + 16952) = 1;
  *(void *)(v0 + 16960) = 16;
  *(void *)(v0 + 16936) = 0x80000001000607B0;
  *(void *)(v0 + 11360) = 0xD000000000000061;
  *(void *)(v0 + 12632) = 12;
  *(unsigned char *)(v0 + 16920) = 0;
  *(void *)(v0 + 16912) = 2112;
  *(void *)(v0 + 16904) = 4;
  *(void *)(v0 + 16888) = 0x8000000100060740;
  *(void *)(v0 + 16896) = &off_100072920;
  *(void *)(v0 + 16840) = 0x80000001000606D0;
  *(void *)(v0 + 16856) = 1;
  *(void *)(v0 + 16864) = 16;
  *(unsigned char *)(v0 + 16872) = 0;
  *(void *)(v0 + 16848) = &off_1000728E0;
  *(unsigned char *)(v0 + 16824) = 0;
  *(unsigned char *)(v0 + 16776) = 0;
  *(void *)(v0 + 16808) = 1;
  *(void *)(v0 + 16816) = 64;
  *(void *)(v0 + 16784) = 0xD000000000000061;
  *(void *)(v0 + 16792) = 0x8000000100060660;
  *(void *)(v0 + 16800) = &off_1000728B0;
  *(void *)(v0 + 16752) = &off_100072880;
  *(void *)(v0 + 16768) = 80;
  *(void *)(v0 + 8392) = 0x800000010005EAC0;
  *(void *)(v0 + 16736) = 0xD000000000000084;
  *(void *)(v0 + 16744) = 0x80000001000605D0;
  *(void *)(v0 + 16760) = 12;
  *(void *)(v0 + 16696) = 0x80000001000605D0;
  *(void *)(v0 + 16712) = 1;
  *(void *)(v0 + 16720) = 64;
  *(unsigned char *)(v0 + 16728) = 0;
  *(void *)(v0 + 16704) = &off_100072840;
  *(void *)(v0 + 16688) = 0xD000000000000084;
  *(void *)(v0 + 13496) = 12;
  *(void *)(v0 + 16664) = 12;
  *(void *)(v0 + 16672) = 80;
  *(void *)(v0 + 16656) = &off_100072810;
  *(void *)(v0 + 16640) = 0xD000000000000084;
  *(void *)(v0 + 16648) = 0x8000000100060540;
  *(void *)(v0 + 16608) = &off_1000727E0;
  *(void *)(v0 + 16616) = 1;
  *(void *)(v0 + 16624) = 64;
  *(void *)(v0 + 16592) = 0xD000000000000084;
  *(void *)(v0 + 16600) = 0x8000000100060540;
  *(unsigned char *)(v0 + 16584) = 0;
  *(void *)(v0 + 16576) = 2;
  *(void *)(v0 + 16552) = 0x80000001000604B0;
  *(void *)(v0 + 16560) = &off_1000727A0;
  *(void *)(v0 + 16568) = 1;
  *(void *)(v0 + 16528) = 16;
  *(unsigned char *)(v0 + 16536) = 0;
  *(void *)(v0 + 16544) = 0xD000000000000080;
  *(void *)(v0 + 16512) = &off_100072770;
  *(void *)(v0 + 16520) = 4;
  *(void *)(v0 + 13912) = 0x800000010005FCF0;
  *(void *)(v0 + 16480) = 16;
  *(void *)(v0 + 16496) = 0xD000000000000061;
  *(void *)(v0 + 16504) = 0x8000000100060440;
  *(void *)(v0 + 13960) = 0x800000010005FCF0;
  *(void *)(v0 + 16456) = 0x8000000100060440;
  *(void *)(v0 + 16464) = &off_100072730;
  *(void *)(v0 + 16472) = 1;
  *(void *)(v0 + 16432) = 16;
  *(void *)(v0 + 16448) = 0xD000000000000061;
  *(void *)(v0 + 16416) = &off_100072700;
  *(void *)(v0 + 16408) = 0x80000001000603C0;
  *(void *)(v0 + 16424) = 5;
  *(unsigned char *)(v0 + 16392) = 0;
  *(void *)(v0 + 16376) = 1;
  *(void *)(v0 + 0x4000) = 16;
  *(void *)(v0 + 16400) = 0xD000000000000070;
  *(void *)(v0 + 14008) = 0x800000010005FCF0;
  *(void *)(v0 + 16352) = 0xD000000000000070;
  *(void *)(v0 + 16360) = 0x80000001000603C0;
  *(unsigned char *)(v0 + 16344) = 0;
  *(void *)(v0 + 16336) = 16;
  *(void *)(v0 + 16312) = 0x8000000100060340;
  *(void *)(v0 + 16320) = &off_100072690;
  *(void *)(v0 + 16328) = 1;
  *(void *)(v0 + 14056) = 0x800000010005FCF0;
  *(unsigned char *)(v0 + 16296) = 0;
  *(void *)(v0 + 16288) = 64;
  *(unsigned char *)(v0 + 16248) = 0;
  *(void *)(v0 + 16272) = &off_100072660;
  *(void *)(v0 + 16280) = 1;
  *(void *)(v0 + 16256) = 0xD00000000000004ALL;
  *(void *)(v0 + 16264) = 0x80000001000602F0;
  *(void *)(v0 + 16232) = 7;
  *(void *)(v0 + 16240) = 2128;
  *(void *)(v0 + 16216) = 0x80000001000602A0;
  *(void *)(v0 + 16224) = &off_100072630;
  *(void *)(v0 + 14064) = &off_100071DB0;
  *(void *)(v0 + 16192) = 2128;
  *(void *)(v0 + 16208) = 0xD000000000000049;
  *(void *)(v0 + 16168) = 0x8000000100060250;
  *(void *)(v0 + 16176) = &off_100072600;
  *(void *)(v0 + 16184) = 1;
  *(unsigned char *)(v0 + 16152) = 0;
  *(void *)(v0 + 16144) = 64;
  *(void *)(v0 + 16160) = 0xD000000000000049;
  *(void *)(v0 + 14104) = 0x800000010005FCF0;
  *(unsigned char *)(v0 + 16104) = 0;
  *(void *)(v0 + 16136) = 5;
  *(void *)(v0 + 16112) = 0xD00000000000004ELL;
  *(void *)(v0 + 16120) = 0x8000000100060200;
  *(void *)(v0 + 16128) = &off_1000725D0;
  *(void *)(v0 + 16080) = &off_1000725A0;
  *(void *)(v0 + 16088) = 1;
  *(void *)(v0 + 16096) = 64;
  *(unsigned char *)(v0 + 15960) = 0;
  *(void *)(v0 + 16064) = 0xD00000000000004ELL;
  *(void *)(v0 + 16072) = 0x8000000100060200;
  *(void *)(v0 + 14112) = &off_100071DE0;
  *(void *)(v0 + 16048) = 80;
  *(unsigned char *)(v0 + 16056) = 0;
  *(void *)(v0 + 16024) = 0x80000001000601A0;
  *(void *)(v0 + 16032) = &off_100072570;
  *(void *)(v0 + 16040) = 3;
  *(void *)(v0 + 16000) = 80;
  *(unsigned char *)(v0 + 16008) = 0;
  *(void *)(v0 + 16016) = 0xD000000000000054;
  *(void *)(v0 + 15984) = &off_100072540;
  *(void *)(v0 + 15992) = 3;
  *(void *)(v0 + 15968) = 0xD000000000000059;
  *(void *)(v0 + 15976) = 0x8000000100060140;
  *(void *)(v0 + 15944) = 6;
  *(void *)(v0 + 15952) = 2048;
  *(void *)(v0 + 15928) = 0x80000001000600E0;
  *(void *)(v0 + 15936) = &off_100072510;
  *(void *)(v0 + 15744) = &off_100072450;
  *(void *)(v0 + 15904) = 20;
  *(unsigned char *)(v0 + 15912) = 0;
  *(void *)(v0 + 15920) = 0xD000000000000050;
  *(void *)(v0 + 15888) = &off_1000724E0;
  *(void *)(v0 + 15896) = 13;
  *(void *)(v0 + 15856) = 16;
  *(void *)(v0 + 15872) = 0xD000000000000056;
  *(void *)(v0 + 15880) = 0x8000000100060080;
  *(void *)(v0 + 15840) = &off_1000724B0;
  *(void *)(v0 + 15824) = 0xD000000000000056;
  *(void *)(v0 + 15832) = 0x8000000100060080;
  *(void *)(v0 + 15848) = 7;
  *(void *)(v0 + 15784) = 0x8000000100060080;
  *(unsigned char *)(v0 + 15816) = 0;
  *(void *)(v0 + 15800) = 5;
  *(void *)(v0 + 15808) = 16;
  *(void *)(v0 + 15792) = &off_100072480;
  *(void *)(v0 + 15776) = 0xD000000000000056;
  *(void *)(v0 + 12248) = 15;
  *(void *)(v0 + 15736) = 0x8000000100060030;
  *(void *)(v0 + 15752) = 15;
  *(void *)(v0 + 15760) = 80;
  *(void *)(v0 + 13160) = 15;
  *(void *)(v0 + 13592) = 15;
  *(void *)(v0 + 15704) = 13;
  *(void *)(v0 + 15712) = 20;
  *(void *)(v0 + 15728) = 0xD00000000000004BLL;
  *(void *)(v0 + 14120) = 15;
  *(void *)(v0 + 15696) = &off_100072420;
  *(void *)(v0 + 15680) = 0xD00000000000004BLL;
  *(void *)(v0 + 15688) = 0x8000000100060030;
  *(void *)(v0 + 15648) = &off_1000723F0;
  *(void *)(v0 + 15640) = 0x8000000100060030;
  *(void *)(v0 + 15656) = 5;
  *(void *)(v0 + 15664) = 16;
  *(unsigned char *)(v0 + 15624) = 0;
  *(void *)(v0 + 15608) = 4;
  *(void *)(v0 + 15616) = 16;
  *(void *)(v0 + 15632) = 0xD00000000000004BLL;
  *(void *)(v0 + 15544) = 0x8000000100060030;
  *(void *)(v0 + 15592) = 0x8000000100060030;
  *(void *)(v0 + 15600) = &off_1000723C0;
  *(void *)(v0 + 15584) = 0xD00000000000004BLL;
  *(unsigned char *)(v0 + 15576) = 0;
  *(void *)(v0 + 15568) = 80;
  *(void *)(v0 + 15552) = &off_100072390;
  *(void *)(v0 + 15560) = 1;
  *(void *)(v0 + 14152) = 0x800000010005FD40;
  *(void *)(v0 + 15536) = 0xD00000000000004BLL;
  *(void *)(v0 + 15504) = &off_100072360;
  *(void *)(v0 + 15496) = 0x800000010005FFE0;
  *(void *)(v0 + 15512) = 13;
  *(void *)(v0 + 15520) = 20;
  *(unsigned char *)(v0 + 15480) = 0;
  *(void *)(v0 + 15464) = 7;
  *(void *)(v0 + 15472) = 80;
  *(void *)(v0 + 15488) = 0xD00000000000004ELL;
  *(void *)(v0 + 15456) = &off_100072330;
  *(void *)(v0 + 15440) = 0xD00000000000004ELL;
  *(void *)(v0 + 15448) = 0x800000010005FFE0;
  *(unsigned char *)(v0 + 15432) = 0;
  *(void *)(v0 + 15416) = 5;
  *(void *)(v0 + 15424) = 64;
  *(void *)(v0 + 14208) = &off_100071E40;
  *(void *)(v0 + 15408) = &off_100072300;
  *(void *)(v0 + 15392) = 0xD00000000000004ELL;
  *(void *)(v0 + 15400) = 0x800000010005FFE0;
  *(void *)(v0 + 15360) = &off_1000722D0;
  *(void *)(v0 + 15352) = 0x800000010005FFE0;
  *(void *)(v0 + 15368) = 4;
  *(void *)(v0 + 15376) = 16;
  *(void *)(v0 + 15304) = 0x800000010005FFE0;
  *(unsigned char *)(v0 + 15336) = 0;
  *(void *)(v0 + 15328) = 64;
  *(void *)(v0 + 15344) = 0xD00000000000004ELL;
  *(void *)(v0 + 15312) = &off_1000722A0;
  *(void *)(v0 + 15320) = 1;
  *(void *)(v0 + 14256) = &off_100071E70;
  *(void *)(v0 + 15296) = 0xD00000000000004ELL;
  *(void *)(v0 + 15264) = &off_100072270;
  *(void *)(v0 + 15256) = 0x800000010005FF90;
  *(void *)(v0 + 15272) = 13;
  *(void *)(v0 + 15280) = 20;
  *(void *)(v0 + 15232) = 16;
  *(void *)(v0 + 15248) = 0xD00000000000004ALL;
  *(void *)(v0 + 15168) = &off_100072210;
  *(void *)(v0 + 15216) = &off_100072240;
  *(void *)(v0 + 15208) = 0x800000010005FF90;
  *(void *)(v0 + 15224) = 7;
  *(void *)(v0 + 14200) = 0x800000010005FDA0;
  *(void *)(v0 + 15176) = 6;
  *(void *)(v0 + 15184) = 16;
  *(void *)(v0 + 15200) = 0xD00000000000004ALL;
  *(void *)(v0 + 14248) = 0x800000010005FDA0;
  *(void *)(v0 + 15136) = 16;
  *(void *)(v0 + 15152) = 0xD00000000000004ALL;
  *(void *)(v0 + 15160) = 0x800000010005FF90;
  *(void *)(v0 + 14296) = 0x800000010005FDA0;
  *(void *)(v0 + 15120) = &off_1000721E0;
  *(void *)(v0 + 15112) = 0x800000010005FF90;
  *(void *)(v0 + 15128) = 5;
  *(void *)(v0 + 15072) = &off_1000721B0;
  *(unsigned char *)(v0 + 15096) = 0;
  *(void *)(v0 + 15080) = 2;
  *(void *)(v0 + 15088) = 16;
  *(unsigned char *)(v0 + 15048) = 0;
  *(void *)(v0 + 15040) = 64;
  *(void *)(v0 + 15056) = 0xD00000000000004ALL;
  *(void *)(v0 + 15064) = 0x800000010005FF90;
  *(void *)(v0 + 15016) = 0x800000010005FF90;
  *(void *)(v0 + 15024) = &off_100072170;
  *(void *)(v0 + 15032) = 1;
  *(unsigned char *)(v0 + 15000) = 0;
  *(void *)(v0 + 14992) = 4;
  *(void *)(v0 + 15008) = 0xD00000000000004ALL;
  *(void *)(v0 + 14896) = 18;
  *(void *)(v0 + 14976) = &off_100072140;
  *(void *)(v0 + 14984) = 1;
  *(void *)(v0 + 14968) = 0x800000010005FF40;
  *(void *)(v0 + 14960) = 0xD00000000000004FLL;
  *(void *)(v0 + 14928) = &off_100072110;
  *(void *)(v0 + 14936) = 5;
  *(void *)(v0 + 14944) = 16;
  *(void *)(v0 + 14888) = 2;
  *(void *)(v0 + 14912) = 0xD000000000000050;
  *(void *)(v0 + 14920) = 0x800000010005FEE0;
  *(void *)(v0 + 14872) = 0x800000010005FEE0;
  *(void *)(v0 + 14880) = &off_1000720E0;
  *(void *)(v0 + 11144) = 14;
  *(void *)(v0 + 12920) = 14;
  *(void *)(v0 + 13112) = 14;
  *(void *)(v0 + 14864) = 0xD000000000000050;
  *(void *)(v0 + 14840) = 14;
  *(void *)(v0 + 14848) = 2128;
  *(void *)(v0 + 14800) = 2068;
  *(void *)(v0 + 14816) = 0xD00000000000004FLL;
  *(void *)(v0 + 14824) = 0x800000010005FE90;
  *(void *)(v0 + 14832) = &off_1000720B0;
  *(unsigned char *)(v0 + 14808) = 0;
  *(void *)(v0 + 14792) = 13;
  *(void *)(v0 + 14304) = &off_100071EA0;
  *(void *)(v0 + 14768) = 0xD00000000000004FLL;
  *(void *)(v0 + 14776) = 0x800000010005FE90;
  *(void *)(v0 + 14784) = &off_100072080;
  *(void *)(v0 + 14736) = &off_100072050;
  *(void *)(v0 + 14744) = 7;
  *(void *)(v0 + 14752) = 2064;
  *(unsigned char *)(v0 + 14712) = 0;
  *(void *)(v0 + 14720) = 0xD00000000000004FLL;
  *(void *)(v0 + 14728) = 0x800000010005FE90;
  *(void *)(v0 + 14352) = &off_100071ED0;
  *(void *)(v0 + 14688) = &off_100072020;
  *(void *)(v0 + 14696) = 1;
  *(void *)(v0 + 14704) = 16;
  *(void *)(v0 + 14672) = 0xD00000000000004FLL;
  *(void *)(v0 + 14680) = 0x800000010005FE90;
  *(void *)(v0 + 14632) = 0x800000010005FE40;
  *(void *)(v0 + 14640) = &off_100071FF0;
  *(void *)(v0 + 14648) = 13;
  *(void *)(v0 + 14656) = 20;
  *(void *)(v0 + 14600) = 4;
  *(void *)(v0 + 14608) = 16;
  *(unsigned char *)(v0 + 14616) = 0;
  *(void *)(v0 + 14624) = 0xD00000000000004ELL;
  *(void *)(v0 + 14592) = &off_100071FC0;
  *(void *)(v0 + 14488) = 0x800000010005FE40;
  *(void *)(v0 + 14576) = 0xD00000000000004ELL;
  *(void *)(v0 + 14584) = 0x800000010005FE40;
  *(void *)(v0 + 14536) = 0x800000010005FE40;
  *(void *)(v0 + 14544) = &off_100071F90;
  *(void *)(v0 + 14552) = 1;
  *(void *)(v0 + 14560) = 80;
  *(void *)(v0 + 14504) = 1;
  *(void *)(v0 + 14512) = 64;
  *(unsigned char *)(v0 + 14520) = 0;
  *(void *)(v0 + 14528) = 0xD00000000000004ELL;
  *(void *)(v0 + 14496) = &off_100071F60;
  *(void *)(v0 + 14336) = 0xD00000000000004DLL;
  *(void *)(v0 + 14384) = 0xD00000000000004DLL;
  *(void *)(v0 + 14480) = 0xD00000000000004ELL;
  *(void *)(v0 + 14432) = 0xD00000000000004DLL;
  *(void *)(v0 + 14448) = &off_100071F30;
  *(void *)(v0 + 14456) = 13;
  *(void *)(v0 + 14464) = 20;
  *(void *)(v0 + 14344) = 0x800000010005FDF0;
  *(void *)(v0 + 14440) = 0x800000010005FDF0;
  *(void *)(v0 + 14392) = 0x800000010005FDF0;
  *(void *)(v0 + 14400) = &off_100071F00;
  *(void *)(v0 + 14408) = 6;
  *(void *)(v0 + 14416) = 16;
  *(void *)(v0 + 12688) = 20;
  *(void *)(v0 + 12880) = 20;
  *(void *)(v0 + 13072) = 20;
  *(void *)(v0 + 13312) = 20;
  *(void *)(v0 + 14360) = 1;
  *(void *)(v0 + 14368) = 64;
  *(void *)(v0 + 13552) = 20;
  *(void *)(v0 + 13792) = 20;
  *(void *)(v0 + 13888) = 20;
  *(void *)(v0 + 14080) = 20;
  *(void *)(v0 + 14312) = 13;
  *(void *)(v0 + 14320) = 20;
  *(unsigned char *)(v0 + 14280) = 0;
  *(void *)(v0 + 14264) = 6;
  *(void *)(v0 + 14272) = 80;
  *(void *)(v0 + 14288) = 0xD00000000000004BLL;
  *(void *)(v0 + 12752) = 0xD00000000000004BLL;
  *(void *)(v0 + 12800) = 0xD00000000000004BLL;
  *(void *)(v0 + 12848) = 0xD00000000000004BLL;
  *(void *)(v0 + 14216) = 5;
  *(void *)(v0 + 14224) = 16;
  *(void *)(v0 + 14240) = 0xD00000000000004BLL;
  *(void *)(v0 + 12896) = 0xD00000000000004BLL;
  *(void *)(v0 + 13808) = 0xD00000000000004BLL;
  *(void *)(v0 + 13856) = 0xD00000000000004BLL;
  *(void *)(v0 + 14168) = 1;
  *(void *)(v0 + 14176) = 4;
  *(void *)(v0 + 14192) = 0xD00000000000004BLL;
  *(void *)(v0 + 14160) = &off_100071E10;
  *(void *)(v0 + 12680) = 13;
  *(void *)(v0 + 14128) = 80;
  *(void *)(v0 + 14144) = 0xD000000000000054;
  *(void *)(v0 + 12872) = 13;
  *(void *)(v0 + 13064) = 13;
  *(void *)(v0 + 13304) = 13;
  *(void *)(v0 + 13352) = 13;
  *(void *)(v0 + 13544) = 13;
  *(void *)(v0 + 14096) = 0xD00000000000004ALL;
  *(void *)(v0 + 13784) = 13;
  *(void *)(v0 + 13880) = 13;
  *(void *)(v0 + 14072) = 13;
  *(void *)(v0 + 14048) = 0xD00000000000004ALL;
  *(void *)(v0 + 14016) = &off_100071D80;
  *(void *)(v0 + 12944) = 0xD00000000000004ALL;
  *(void *)(v0 + 12992) = 0xD00000000000004ALL;
  *(void *)(v0 + 14000) = 0xD00000000000004ALL;
  *(void *)(v0 + 14024) = 5;
  *(void *)(v0 + 14032) = 16;
  *(void *)(v0 + 13040) = 0xD00000000000004ALL;
  *(void *)(v0 + 13088) = 0xD00000000000004ALL;
  *(void *)(v0 + 13136) = 0xD00000000000004ALL;
  *(void *)(v0 + 13904) = 0xD00000000000004ALL;
  *(void *)(v0 + 13976) = 4;
  *(void *)(v0 + 13984) = 16;
  *(void *)(v0 + 13928) = 1;
  *(void *)(v0 + 13936) = 64;
  *(void *)(v0 + 13952) = 0xD00000000000004ALL;
  *(void *)(v0 + 17040) = &off_1000729D0;
  *(unsigned char *)(v0 + 17064) = 0;
  *(void *)(v0 + 17088) = &off_100072A10;
  *(unsigned char *)(v0 + 17112) = 0;
  *(void *)(v0 + 13832) = 4;
  *(void *)(v0 + 13840) = 80;
  *(void *)(v0 + 17080) = 0x8000000100060890;
  *(void *)(v0 + 17128) = 0x8000000100060890;
  *(unsigned char *)(v0 + 17160) = 0;
  *(void *)(v0 + 17136) = &off_100072A40;
  *(void *)(v0 + 17168) = 0xD00000000000006FLL;
  *(void *)(v0 + 17176) = 0x80000001000608F0;
  *(void *)(v0 + 17184) = &off_100072A70;
  *(unsigned char *)(v0 + 17208) = 0;
  *(void *)(v0 + 17232) = &off_100072AA0;
  *(unsigned char *)(v0 + 17256) = 0;
  *(void *)(v0 + 13736) = 6;
  *(void *)(v0 + 13744) = 80;
  *(void *)(v0 + 13760) = 0xD00000000000004ELL;
  *(void *)(v0 + 17216) = 0xD000000000000059;
  *(void *)(v0 + 17264) = 0xD000000000000059;
  *(void *)(v0 + 17224) = 0x8000000100060960;
  *(void *)(v0 + 17272) = 0x8000000100060960;
  *(void *)(v0 + 17280) = &off_100072B00;
  *(unsigned char *)(v0 + 17304) = 0;
  *(void *)(v0 + 13400) = 1;
  *(void *)(v0 + 13696) = 16;
  *(void *)(v0 + 13712) = 0xD00000000000004ELL;
  *(void *)(v0 + 13408) = 64;
  *(void *)(v0 + 13424) = 0xD000000000000051;
  *(void *)(v0 + 13448) = 4;
  *(void *)(v0 + 13648) = 64;
  *(void *)(v0 + 13664) = 0xD00000000000004ELL;
  *(void *)(v0 + 13688) = 5;
  *(void *)(v0 + 13456) = 16;
  *(void *)(v0 + 13472) = 0xD000000000000051;
  *(void *)(v0 + 13504) = 80;
  *(void *)(v0 + 13600) = 80;
  *(void *)(v0 + 13616) = 0xD00000000000004FLL;
  *(void *)(v0 + 13640) = 5;
  *(void *)(v0 + 17072) = 0xD000000000000058;
  *(void *)(v0 + 17120) = 0xD000000000000058;
  *(void *)(v0 + 17312) = 0xD000000000000058;
  *(void *)(v0 + 17320) = 0x80000001000609C0;
  *(void *)(v0 + 17328) = &off_100072B30;
  *(unsigned char *)(v0 + 17352) = 0;
  *(void *)(v0 + 17368) = 0x8000000100060A20;
  *(unsigned char *)(v0 + 17400) = 0;
  *(void *)(v0 + 17376) = &off_100072B60;
  *(unsigned char *)(v0 + 17448) = 0;
  *(void *)(v0 + 17424) = &off_100072B90;
  *(unsigned char *)(v0 + 17496) = 0;
  *(void *)(v0 + 17472) = &off_100072BC0;
  *(unsigned char *)(v0 + 17544) = 0;
  *(void *)(v0 + 17520) = &off_100072BF0;
  *(void *)(v0 + 17416) = 0x8000000100060A80;
  *(void *)(v0 + 17464) = 0x8000000100060A80;
  *(void *)(v0 + 17512) = 0x8000000100060A80;
  *(void *)(v0 + 17560) = 0x8000000100060A80;
  *(void *)(v0 + 17568) = &off_100072C20;
  *(unsigned char *)(v0 + 17592) = 0;
  *(void *)(v0 + 17616) = &off_100072C50;
  *(unsigned char *)(v0 + 17640) = 0;
  *(void *)(v0 + 17600) = 0xD00000000000005ELL;
  *(void *)(v0 + 17648) = 0xD00000000000005ELL;
  *(void *)(v0 + 17608) = 0x8000000100060AD0;
  *(void *)(v0 + 17656) = 0x8000000100060AD0;
  *(void *)(v0 + 17664) = &off_100072C80;
  *(void *)(v0 + 12728) = 11;
  *(void *)(v0 + 13376) = 0xD000000000000051;
  *(void *)(v0 + 17672) = 11;
  *(unsigned char *)(v0 + 17688) = 0;
  *(void *)(v0 + 11864) = 4;
  *(void *)(v0 + 11912) = 4;
  *(void *)(v0 + 13360) = 80;
  *(void *)(v0 + 11960) = 4;
  *(void *)(v0 + 12152) = 4;
  *(void *)(v0 + 12392) = 4;
  *(void *)(v0 + 12536) = 4;
  *(void *)(v0 + 12968) = 1;
  *(void *)(v0 + 12976) = 64;
  *(void *)(v0 + 13016) = 5;
  *(void *)(v0 + 13024) = 16;
  *(void *)(v0 + 13120) = 80;
  *(void *)(v0 + 13208) = 2;
  *(void *)(v0 + 13256) = 5;
  *(void *)(v0 + 13264) = 16;
  *(void *)(v0 + 13216) = 16;
  *(void *)(v0 + 17696) = 0xD000000000000054;
  *(void *)(v0 + 17704) = 0x8000000100060B30;
  *(unsigned char *)(v0 + 17736) = 0;
  *(void *)(v0 + 17712) = &off_100072CB0;
  *(unsigned char *)(v0 + 17784) = 0;
  *(void *)(v0 + 17760) = &off_100072CE0;
  *(unsigned char *)(v0 + 17832) = 0;
  *(void *)(v0 + 17808) = &off_100072D20;
  *(unsigned char *)(v0 + 17880) = 0;
  *(void *)(v0 + 17856) = &off_100072D50;
  *(void *)(v0 + 17752) = 0x8000000100060B90;
  *(void *)(v0 + 17800) = 0x8000000100060B90;
  *(void *)(v0 + 17848) = 0x8000000100060B90;
  *(void *)(v0 + 17896) = 0x8000000100060B90;
  *(void *)(v0 + 17904) = &off_100072D80;
  *(unsigned char *)(v0 + 17928) = 0;
  *(void *)(v0 + 17952) = &off_100072DC0;
  *(unsigned char *)(v0 + 17976) = 0;
  *(void *)(v0 + 17944) = 0x8000000100060BF0;
  *(void *)(v0 + 17992) = 0x8000000100060BF0;
  *(void *)(v0 + 18000) = &off_100072DF0;
  *(unsigned char *)(v0 + 18024) = 0;
  *(void *)(v0 + 18048) = &off_100072E20;
  *(unsigned char *)(v0 + 18072) = 0;
  *(void *)(v0 + 18040) = 0x8000000100060C40;
  *(void *)(v0 + 18064) = 4;
  *(void *)(v0 + 18088) = 0x8000000100060C40;
  *(void *)(v0 + 18096) = &off_100072E50;
  *(unsigned char *)(v0 + 18120) = 0;
  *(void *)(v0 + 18112) = 4;
  *(unsigned char *)(v0 + 18168) = 0;
  *(void *)(v0 + 18144) = &off_100072E90;
  *(unsigned char *)(v0 + 18216) = 0;
  *(void *)(v0 + 18192) = &off_100072EC0;
  *(unsigned char *)(v0 + 18264) = 0;
  *(void *)(v0 + 18240) = &off_100072EF0;
  *(unsigned char *)(v0 + 18312) = 0;
  *(void *)(v0 + 18288) = &off_100072F20;
  *(void *)(v0 + 18336) = &off_100072F50;
  *(unsigned char *)(v0 + 18360) = 0;
  *(void *)(v0 + 12928) = 80;
  *(void *)(v0 + 18352) = 2048;
  *(unsigned char *)(v0 + 18408) = 0;
  *(void *)(v0 + 18384) = &off_100072F80;
  *(void *)(v0 + 12736) = 80;
  *(void *)(v0 + 12776) = 1;
  *(void *)(v0 + 12784) = 64;
  *(void *)(v0 + 12824) = 5;
  *(void *)(v0 + 12832) = 16;
  *(void *)(v0 + 18128) = 0xD00000000000004FLL;
  *(void *)(v0 + 18176) = 0xD00000000000004FLL;
  *(void *)(v0 + 18224) = 0xD00000000000004FLL;
  *(void *)(v0 + 18272) = 0xD00000000000004FLL;
  *(void *)(v0 + 18320) = 0xD00000000000004FLL;
  *(void *)(v0 + 18368) = 0xD00000000000004FLL;
  *(void *)(v0 + 18416) = 0xD00000000000004FLL;
  *(void *)(v0 + 18136) = 0x8000000100060CA0;
  *(void *)(v0 + 18184) = 0x8000000100060CA0;
  *(void *)(v0 + 18232) = 0x8000000100060CA0;
  *(void *)(v0 + 18280) = 0x8000000100060CA0;
  *(void *)(v0 + 18328) = 0x8000000100060CA0;
  *(void *)(v0 + 18376) = 0x8000000100060CA0;
  *(void *)(v0 + 18424) = 0x8000000100060CA0;
  *(void *)(v0 + 18432) = &off_100072FB0;
  *(void *)(v0 + 11336) = 7;
  *(void *)(v0 + 12344) = 7;
  *(void *)(v0 + 12704) = 0xD00000000000004ELL;
  *(void *)(v0 + 12584) = 7;
  *(void *)(v0 + 17144) = 7;
  *(void *)(v0 + 17288) = 7;
  *(void *)(v0 + 17912) = 7;
  *(void *)(v0 + 18440) = 7;
  *(unsigned char *)(v0 + 18456) = 0;
  *(void *)(v0 + 11152) = 2128;
  *(void *)(v0 + 11344) = 2128;
  *(void *)(v0 + 12592) = 16;
  *(void *)(v0 + 12640) = 80;
  *(void *)(v0 + 18448) = 2128;
  *(void *)(v0 + 18464) = 0xD000000000000055;
  *(void *)(v0 + 18472) = 0x8000000100060CF0;
  *(void *)(v0 + 18480) = &off_100072FE0;
  *(void *)(v0 + 18488) = 10;
  *(unsigned char *)(v0 + 18504) = 0;
  *(void *)(v0 + 18528) = &off_100073010;
  *(unsigned char *)(v0 + 18552) = 0;
  *(void *)(v0 + 12448) = 64;
  *(void *)(v0 + 12544) = 16;
  *(void *)(v0 + 12488) = 1;
  *(void *)(v0 + 12496) = 64;
  *(void *)(v0 + 17744) = 0xD000000000000050;
  *(void *)(v0 + 17792) = 0xD000000000000050;
  *(void *)(v0 + 17840) = 0xD000000000000050;
  *(void *)(v0 + 17888) = 0xD000000000000050;
  *(void *)(v0 + 18512) = 0xD000000000000050;
  *(void *)(v0 + 18560) = 0xD000000000000050;
  *(void *)(v0 + 18520) = 0x8000000100060D50;
  *(void *)(v0 + 18568) = 0x8000000100060D50;
  *(void *)(v0 + 18576) = &off_100073050;
  *(unsigned char *)(v0 + 18600) = 0;
  *(void *)(v0 + 18616) = 0x8000000100060DB0;
  *(void *)(v0 + 18624) = &off_100073080;
  *(void *)(v0 + 12400) = 64;
  *(void *)(v0 + 12440) = 2;
  *(void *)(v0 + 11528) = 2;
  *(void *)(v0 + 12008) = 2;
  *(void *)(v0 + 12296) = 2;
  *(void *)(v0 + 12352) = 2064;
  *(void *)(v0 + 17720) = 2;
  *(void *)(v0 + 17816) = 2;
  *(void *)(v0 + 17960) = 2;
  *(void *)(v0 + 18104) = 2;
  *(void *)(v0 + 18584) = 2;
  *(void *)(v0 + 18632) = 2;
  *(void *)(v0 + 11200) = 64;
  *(void *)(v0 + 12304) = 16;
  *(void *)(v0 + 11392) = 64;
  *(void *)(v0 + 11440) = 64;
  *(void *)(v0 + 11488) = 64;
  *(void *)(v0 + 11680) = 64;
  *(void *)(v0 + 11728) = 64;
  *(void *)(v0 + 11776) = 64;
  *(void *)(v0 + 11824) = 64;
  *(void *)(v0 + 11872) = 64;
  *(void *)(v0 + 11920) = 64;
  *(void *)(v0 + 12064) = 64;
  *(void *)(v0 + 12104) = 3;
  *(void *)(v0 + 12208) = 64;
  *(void *)(v0 + 12112) = 64;
  *(void *)(v0 + 12160) = 64;
  *(void *)(v0 + 12200) = 1;
  *(void *)(v0 + 17200) = 64;
  *(void *)(v0 + 17344) = 64;
  *(void *)(v0 + 17440) = 64;
  *(void *)(v0 + 17632) = 64;
  *(void *)(v0 + 18208) = 64;
  *(void *)(v0 + 18640) = 64;
  *(unsigned char *)(v0 + 18648) = 0;
  *(void *)(v0 + 18672) = &off_1000730B0;
  *(unsigned char *)(v0 + 18696) = 0;
  *(void *)(v0 + 18720) = &off_1000730E0;
  *(unsigned char *)(v0 + 18744) = 0;
  *(void *)(v0 + 11216) = 0xD00000000000005BLL;
  *(void *)(v0 + 12056) = 3;
  *(void *)(v0 + 18656) = 0xD00000000000005BLL;
  *(void *)(v0 + 18704) = 0xD00000000000005BLL;
  *(void *)(v0 + 18752) = 0xD00000000000005BLL;
  *(void *)(v0 + 18664) = 0x8000000100060E10;
  *(void *)(v0 + 18712) = 0x8000000100060E10;
  *(void *)(v0 + 18760) = 0x8000000100060E10;
  *(void *)(v0 + 18768) = &off_100073110;
  *(void *)(v0 + 11968) = 16;
  *(void *)(v0 + 12016) = 16;
  *(void *)(v0 + 17408) = 0xD00000000000004ELL;
  *(void *)(v0 + 17456) = 0xD00000000000004ELL;
  *(void *)(v0 + 17504) = 0xD00000000000004ELL;
  *(void *)(v0 + 17552) = 0xD00000000000004ELL;
  *(void *)(v0 + 17936) = 0xD00000000000004ELL;
  *(void *)(v0 + 17984) = 0xD00000000000004ELL;
  *(void *)(v0 + 18776) = 6;
  *(unsigned char *)(v0 + 18792) = 0;
  *(void *)(v0 + 18800) = 0xD00000000000004ELL;
  *(void *)(v0 + 18808) = 0x8000000100060E70;
  *(void *)(v0 + 18816) = &off_100073140;
  *(unsigned char *)(v0 + 18840) = 0;
  *(void *)(v0 + 18864) = &off_100073170;
  *(unsigned char *)(v0 + 18888) = 0;
  *(void *)(v0 + 18608) = 0xD000000000000052;
  *(void *)(v0 + 18848) = 0xD000000000000052;
  *(void *)(v0 + 18896) = 0xD000000000000052;
  *(void *)(v0 + 18856) = 0x8000000100060EC0;
  *(void *)(v0 + 18904) = 0x8000000100060EC0;
  *(void *)(v0 + 18912) = &off_1000731A0;
  *(void *)(v0 + 11248) = 80;
  *(void *)(v0 + 11576) = 3;
  *(void *)(v0 + 11768) = 1;
  *(void *)(v0 + 11816) = 1;
  *(void *)(v0 + 17488) = 80;
  *(void *)(v0 + 17528) = 3;
  *(void *)(v0 + 17536) = 80;
  *(void *)(v0 + 17680) = 80;
  *(void *)(v0 + 17776) = 80;
  *(void *)(v0 + 17920) = 80;
  *(void *)(v0 + 18296) = 3;
  *(void *)(v0 + 18344) = 3;
  *(void *)(v0 + 18496) = 80;
  *(void *)(v0 + 18920) = 3;
  *(unsigned char *)(v0 + 18936) = 0;
  *(void *)(v0 + 18928) = 80;
  *(void *)(v0 + 18960) = &off_1000731D0;
  *(unsigned char *)(v0 + 18984) = 0;
  *(void *)(v0 + 11720) = 1;
  *(void *)(v0 + 11648) = 0xD000000000000056;
  *(void *)(v0 + 11672) = 1;
  *(void *)(v0 + 17360) = 0xD000000000000051;
  *(void *)(v0 + 18032) = 0xD000000000000051;
  *(void *)(v0 + 18080) = 0xD000000000000051;
  *(void *)(v0 + 18944) = 0xD000000000000051;
  *(void *)(v0 + 18992) = 0xD000000000000051;
  *(void *)(v0 + 18952) = 0x8000000100060F20;
  *(void *)(v0 + 19000) = 0x8000000100060F20;
  *(void *)(v0 + 19008) = &off_100073210;
  *(void *)(v0 + 11624) = 5;
  *(void *)(v0 + 11632) = 2064;
  *(void *)(v0 + 11480) = 5;
  *(void *)(v0 + 11536) = 2064;
  *(void *)(v0 + 11584) = 2064;
  *(void *)(v0 + 17096) = 5;
  *(void *)(v0 + 17192) = 5;
  *(void *)(v0 + 17336) = 5;
  *(void *)(v0 + 17576) = 5;
  *(void *)(v0 + 17864) = 5;
  *(void *)(v0 + 18008) = 5;
  *(void *)(v0 + 18392) = 5;
  *(void *)(v0 + 18728) = 5;
  *(void *)(v0 + 18824) = 5;
  *(void *)(v0 + 19016) = 5;
  *(void *)(v0 + 11296) = 16;
  *(void *)(v0 + 11384) = 1;
  *(void *)(v0 + 11432) = 1;
  *(void *)(v0 + 17056) = 16;
  *(void *)(v0 + 17104) = 16;
  *(void *)(v0 + 17152) = 16;
  *(void *)(v0 + 17248) = 16;
  *(void *)(v0 + 17296) = 16;
  *(void *)(v0 + 17392) = 16;
  *(void *)(v0 + 17728) = 16;
  *(void *)(v0 + 17824) = 16;
  *(void *)(v0 + 17872) = 16;
  *(void *)(v0 + 18160) = 16;
  *(void *)(v0 + 18304) = 16;
  *(void *)(v0 + 18544) = 16;
  *(void *)(v0 + 18592) = 16;
  *(void *)(v0 + 18688) = 16;
  *(void *)(v0 + 18736) = 16;
  *(void *)(v0 + 18784) = 16;
  *(void *)(v0 + 18880) = 16;
  *(void *)(v0 + 18976) = 16;
  *(void *)(v0 + 19024) = 16;
  *(unsigned char *)(v0 + 19032) = 0;
  *(void *)(v0 + 19040) = 0xD000000000000056;
  *(void *)(v0 + 19048) = 0x8000000100060F80;
  *(void *)(v0 + 19056) = &off_100073240;
  *(void *)(v0 + 11288) = 1;
  *(void *)(v0 + 11192) = 1;
  *(void *)(v0 + 11240) = 1;
  *(void *)(v0 + 17048) = 1;
  *(void *)(v0 + 17240) = 1;
  *(void *)(v0 + 17384) = 1;
  *(void *)(v0 + 17432) = 1;
  *(void *)(v0 + 17480) = 1;
  *(void *)(v0 + 17624) = 1;
  *(void *)(v0 + 17768) = 1;
  *(void *)(v0 + 18056) = 1;
  *(void *)(v0 + 18152) = 1;
  *(void *)(v0 + 18200) = 1;
  *(void *)(v0 + 18248) = 1;
  *(void *)(v0 + 18536) = 1;
  *(void *)(v0 + 18680) = 1;
  *(void *)(v0 + 18872) = 1;
  *(void *)(v0 + 18968) = 1;
  *(void *)(v0 + 19064) = 1;
  *(void *)(v0 + 17584) = 2064;
  *(void *)(v0 + 17968) = 2064;
  *(void *)(v0 + 18016) = 2064;
  *(void *)(v0 + 18256) = 2064;
  *(void *)(v0 + 18400) = 2064;
  *(void *)(v0 + 18832) = 2064;
  *(void *)(v0 + 19072) = 2064;
  *(unsigned char *)(v0 + 19080) = 0;
  qword_10007DB50 = v0;
  return result;
}

unint64_t sub_10004CCB8(char a1)
{
  unint64_t result = 0x726568746FLL;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x417373616C63;
      break;
    case 2:
      unint64_t result = 0x427373616C63;
      break;
    case 3:
      unint64_t result = 0xD000000000000011;
      break;
    case 4:
      unint64_t result = 0xD000000000000013;
      break;
    case 5:
    case 13:
    case 14:
    case 15:
      unint64_t result = 0xD000000000000017;
      break;
    case 6:
      unint64_t result = 0xD000000000000016;
      break;
    case 7:
      unint64_t result = 0x457373616C63;
      break;
    case 8:
      unint64_t result = 0x467373616C63;
      break;
    case 9:
      unint64_t result = 0xD000000000000012;
      break;
    case 10:
      unint64_t result = 0xD000000000000014;
      break;
    case 11:
      unint64_t result = 0xD00000000000001BLL;
      break;
    case 12:
      unint64_t result = 0xD000000000000016;
      break;
    case 16:
      unint64_t result = 0xD000000000000018;
      break;
    case 17:
      unint64_t result = 0xD000000000000018;
      break;
    case 18:
      unint64_t result = 0x6365746F72506F6ELL;
      break;
    default:
      return result;
  }
  return result;
}

unint64_t sub_10004CECC(char a1)
{
  unint64_t result = 1684104562;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x6574697277;
      break;
    case 2:
      unint64_t result = 0x657461657263;
      break;
    case 3:
      unint64_t result = 0xD000000000000015;
      break;
    case 4:
      unint64_t result = 0x6E776F6E6B6E75;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_10004CF70(unsigned __int8 *a1, char *a2)
{
  return sub_100033B10(*a1, *a2);
}

Swift::Int sub_10004CF7C()
{
  return sub_100031A34();
}

uint64_t sub_10004CF84()
{
  String.hash(into:)();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_10004D058()
{
  return sub_100033CC4();
}

unint64_t sub_10004D060@<X0>(Swift::String *a1@<X0>, unsigned char *a2@<X8>)
{
  unint64_t result = sub_1000524F8(*a1);
  *a2 = result;
  return result;
}

void sub_10004D090(uint64_t *a1@<X8>)
{
  unint64_t v2 = 0xE400000000000000;
  uint64_t v3 = 1684104562;
  switch(*v1)
  {
    case 1:
      unint64_t v2 = 0xE500000000000000;
      uint64_t v3 = 0x6574697277;
      goto LABEL_3;
    case 2:
      *a1 = 0x657461657263;
      a1[1] = 0xE600000000000000;
      break;
    case 3:
      *a1 = 0xD000000000000015;
      a1[1] = 0x800000010005AC20;
      break;
    case 4:
      *a1 = 0x6E776F6E6B6E75;
      a1[1] = 0xE700000000000000;
      break;
    default:
LABEL_3:
      *a1 = v3;
      a1[1] = v2;
      break;
  }
}

uint64_t sub_10004D140()
{
  return RawRepresentable<>.init(from:)();
}

uint64_t sub_10004D1A0()
{
  return RawRepresentable<>.encode(to:)();
}

BOOL sub_10004D1F0(void *a1, void *a2)
{
  return *a1 < *a2;
}

BOOL sub_10004D204(void *a1, void *a2)
{
  return *a2 >= *a1;
}

BOOL sub_10004D218(void *a1, void *a2)
{
  return *a1 >= *a2;
}

BOOL sub_10004D22C(void *a1, void *a2)
{
  return *a2 < *a1;
}

BOOL sub_10004D240(void *a1, void *a2)
{
  return *a1 == *a2;
}

void *sub_10004D254@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *result;
  return result;
}

uint64_t sub_10004D260()
{
  return RawRepresentable<>.init(from:)();
}

uint64_t sub_10004D2C0()
{
  return RawRepresentable<>.encode(to:)();
}

void sub_10004D314()
{
  Hasher._combine(_:)(*v0);
}

void sub_10004D344(void *a1@<X8>)
{
  *a1 = 0;
}

void *sub_10004D34C@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 | *result;
  return result;
}

void *sub_10004D360@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 & *result;
  return result;
}

void *sub_10004D374@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 ^ *result;
  return result;
}

BOOL sub_10004D388(void *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = *v2 & *a2;
  if (v4 != *a2) {
    *v2 |= v3;
  }
  *a1 = v3;
  return v4 != v3;
}

void *sub_10004D3B8@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *v2 & *result;
  if (v3) {
    *v2 &= ~*result;
  }
  *(void *)a2 = v3;
  *(unsigned char *)(a2 + 8) = v3 == 0;
  return result;
}

uint64_t *sub_10004D3E4@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *result;
  uint64_t v4 = *v2;
  *v2 |= *result;
  uint64_t v5 = v4 & v3;
  *(void *)a2 = v5;
  *(unsigned char *)(a2 + 8) = v5 == 0;
  return result;
}

void *sub_10004D408(void *result)
{
  *v1 |= *result;
  return result;
}

void *sub_10004D41C(void *result)
{
  *v1 &= *result;
  return result;
}

void *sub_10004D430(void *result)
{
  *v1 ^= *result;
  return result;
}

void *sub_10004D444@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 & ~*result;
  return result;
}

BOOL sub_10004D458(void *a1)
{
  return (*v1 & ~*a1) == 0;
}

BOOL sub_10004D46C(void *a1)
{
  return (*v1 & *a1) == 0;
}

BOOL sub_10004D480(void *a1)
{
  return (*a1 & ~*v1) == 0;
}

BOOL sub_10004D494()
{
  return *v0 == 0;
}

uint64_t sub_10004D4A4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return SetAlgebra.init<A>(_:)(a1, a4, a2, a5, a3);
}

void *sub_10004D4BC(void *result)
{
  *v1 &= ~*result;
  return result;
}

void *sub_10004D4D0@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

void sub_10004D4E0(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_10004D4EC@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3 = sub_1000528D0(a1);
  uint64_t result = swift_bridgeObjectRelease();
  *a2 = v3;
  return result;
}

uint64_t sub_10004D52C(char *a1, char *a2)
{
  char v2 = *a2;
  unint64_t v3 = sub_10004CCB8(*a1);
  uint64_t v5 = v4;
  if (v3 == sub_10004CCB8(v2) && v5 == v6) {
    char v8 = 1;
  }
  else {
    char v8 = _stringCompareWithSmolCheck(_:_:expecting:)();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

Swift::Int sub_10004D5B8()
{
  char v1 = *v0;
  Hasher.init(_seed:)();
  sub_10004CCB8(v1);
  String.hash(into:)();
  swift_bridgeObjectRelease();
  return Hasher._finalize()();
}

uint64_t sub_10004D61C()
{
  sub_10004CCB8(*v0);
  String.hash(into:)();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_10004D670()
{
  char v1 = *v0;
  Hasher.init(_seed:)();
  sub_10004CCB8(v1);
  String.hash(into:)();
  swift_bridgeObjectRelease();
  return Hasher._finalize()();
}

uint64_t sub_10004D6D0@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_100052544();
  *a1 = result;
  return result;
}

unint64_t sub_10004D700@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = sub_10004CCB8(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_10004D72C()
{
  return RawRepresentable<>.init(from:)();
}

uint64_t sub_10004D78C()
{
  return RawRepresentable<>.encode(to:)();
}

uint64_t sub_10004D7DC()
{
  return RawRepresentable<>.init(from:)();
}

uint64_t sub_10004D83C()
{
  return RawRepresentable<>.encode(to:)();
}

Swift::Int sub_10004D88C()
{
  Swift::UInt64 v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

Swift::Int sub_10004D8D4()
{
  Swift::UInt64 v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

uint64_t sub_10004D918(void *a1, uint64_t a2, uint64_t a3, int a4)
{
  *((void *)&v31 + 1) = a2;
  int v30 = a4;
  *(void *)&long long v31 = a3;
  uint64_t v5 = sub_1000082E0(&qword_10007D890);
  uint64_t v26 = *(void *)(v5 - 8);
  uint64_t v27 = v5;
  __chkstk_darwin(v5);
  uint64_t v25 = (char *)&v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_1000082E0(&qword_10007D898);
  uint64_t v28 = *(void *)(v7 - 8);
  uint64_t v29 = v7;
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)&v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_1000082E0(&qword_10007D8A0);
  uint64_t v24 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v12 = (char *)&v23 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_1000082E0(&qword_10007D8A8);
  uint64_t v14 = *(void *)(v13 - 8);
  __chkstk_darwin(v13);
  uint64_t v16 = (char *)&v23 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000B090(a1, a1[3]);
  sub_1000531A4();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  if (v30)
  {
    uint64_t v21 = (uint64_t (**)(char *, uint64_t))(v14 + 8);
    if (v31 == 0)
    {
      LOBYTE(v34) = 0;
      sub_100053348();
      KeyedEncodingContainer.nestedContainer<A>(keyedBy:forKey:)();
      (*(void (**)(char *, uint64_t))(v24 + 8))(v12, v10);
    }
    else
    {
      LOBYTE(v34) = 2;
      sub_1000531F8();
      uint64_t v22 = v25;
      KeyedEncodingContainer.nestedContainer<A>(keyedBy:forKey:)();
      (*(void (**)(char *, uint64_t))(v26 + 8))(v22, v27);
    }
    return (*v21)(v16, v13);
  }
  else
  {
    uint64_t v17 = v31;
    LOBYTE(v34) = 1;
    sub_10005324C();
    KeyedEncodingContainer.nestedContainer<A>(keyedBy:forKey:)();
    uint64_t v34 = *((void *)&v31 + 1);
    char v33 = 0;
    sub_10005339C();
    uint64_t v18 = v29;
    uint64_t v19 = v32;
    KeyedEncodingContainer.encode<A>(_:forKey:)();
    if (!v19)
    {
      uint64_t v34 = v17;
      char v33 = 1;
      sub_1000533F0();
      KeyedEncodingContainer.encode<A>(_:forKey:)();
    }
    (*(void (**)(char *, uint64_t))(v28 + 8))(v9, v18);
    return (*(uint64_t (**)(char *, uint64_t))(v14 + 8))(v16, v13);
  }
}

uint64_t sub_10004DD38()
{
  uint64_t v1 = 0x746365707845;
  if (*v0 != 1) {
    uint64_t v1 = 0x74726F706552;
  }
  if (*v0) {
    return v1;
  }
  else {
    return 1885956947;
  }
}

uint64_t sub_10004DD84@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_100052908(a1, a2);
  *a3 = result;
  return result;
}

void sub_10004DDAC(unsigned char *a1@<X8>)
{
  *a1 = 3;
}

uint64_t sub_10004DDB8(uint64_t a1)
{
  unint64_t v2 = sub_1000531A4();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10004DDF4(uint64_t a1)
{
  unint64_t v2 = sub_1000531A4();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_10004DE30()
{
  if (*v0) {
    return 0x69726F6765746163;
  }
  else {
    return 0x7365646F6DLL;
  }
}

uint64_t sub_10004DE6C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_100052A40(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_10004DE94(uint64_t a1)
{
  unint64_t v2 = sub_10005324C();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10004DED0(uint64_t a1)
{
  unint64_t v2 = sub_10005324C();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_10004DF0C()
{
  return 0;
}

void sub_10004DF18(unsigned char *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_10004DF24(uint64_t a1)
{
  unint64_t v2 = sub_1000531F8();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10004DF60(uint64_t a1)
{
  unint64_t v2 = sub_1000531F8();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_10004DF9C@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = 1;
  return result;
}

uint64_t sub_10004DFCC(uint64_t a1)
{
  unint64_t v2 = sub_100053348();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10004E008(uint64_t a1)
{
  unint64_t v2 = sub_100053348();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_10004E044@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = sub_100052B38(a1);
  if (!v2)
  {
    *(void *)a2 = result;
    *(void *)(a2 + 8) = v5;
    *(unsigned char *)(a2 + 16) = v6 & 1;
  }
  return result;
}

uint64_t sub_10004E078(void *a1)
{
  return sub_10004D918(a1, *(void *)v1, *(void *)(v1 + 8), *(unsigned __int8 *)(v1 + 16));
}

Swift::Int sub_10004E098()
{
  Swift::UInt64 v2 = *(void *)v0;
  Swift::UInt64 v1 = *(void *)(v0 + 8);
  int v3 = *(unsigned __int8 *)(v0 + 16);
  Hasher.init(_seed:)();
  if (v3 == 1)
  {
    if (v2 | v1) {
      Swift::UInt v4 = 2;
    }
    else {
      Swift::UInt v4 = 0;
    }
    Hasher._combine(_:)(v4);
  }
  else
  {
    Hasher._combine(_:)(1uLL);
    Hasher._combine(_:)(v2);
    Hasher._combine(_:)(v1);
  }
  return Hasher._finalize()();
}

void sub_10004E12C()
{
  Swift::UInt64 v2 = *(void *)v0;
  Swift::UInt64 v1 = *(void *)(v0 + 8);
  if (*(unsigned char *)(v0 + 16) == 1)
  {
    if (v2 | v1) {
      Swift::UInt v3 = 2;
    }
    else {
      Swift::UInt v3 = 0;
    }
    Hasher._combine(_:)(v3);
  }
  else
  {
    Hasher._combine(_:)(1uLL);
    Hasher._combine(_:)(v2);
    Hasher._combine(_:)(v1);
  }
}

Swift::Int sub_10004E19C()
{
  Swift::UInt64 v2 = *(void *)v0;
  Swift::UInt64 v1 = *(void *)(v0 + 8);
  int v3 = *(unsigned __int8 *)(v0 + 16);
  Hasher.init(_seed:)();
  if (v3 == 1)
  {
    if (v2 | v1) {
      Swift::UInt v4 = 2;
    }
    else {
      Swift::UInt v4 = 0;
    }
    Hasher._combine(_:)(v4);
  }
  else
  {
    Hasher._combine(_:)(1uLL);
    Hasher._combine(_:)(v2);
    Hasher._combine(_:)(v1);
  }
  return Hasher._finalize()();
}

uint64_t sub_10004E22C(uint64_t a1, uint64_t *a2)
{
  uint64_t v2 = *(void *)(a1 + 8);
  uint64_t v3 = *a2;
  uint64_t v4 = a2[1];
  unsigned int v5 = (*(void *)a1 == *a2) & ~*((unsigned __int8 *)a2 + 16);
  if (v2 != v4) {
    unsigned int v5 = 0;
  }
  uint64_t v6 = *(void *)a1 | v2;
  uint64_t v7 = v3 | v4;
  BOOL v8 = (v3 | v4) != 0;
  if (!*((unsigned char *)a2 + 16)) {
    BOOL v8 = 0;
  }
  BOOL v9 = v7 == 0;
  if (!*((unsigned char *)a2 + 16)) {
    BOOL v9 = 0;
  }
  if (v6) {
    BOOL v10 = v8;
  }
  else {
    BOOL v10 = v9;
  }
  if (*(unsigned char *)(a1 + 16) == 1) {
    return v10;
  }
  else {
    return v5;
  }
}

uint64_t sub_10004E28C(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = sub_1000082E0(&qword_10007DA50);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  BOOL v8 = (char *)v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000B090(a1, a1[3]);
  sub_10005495C();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  LOBYTE(v10[0]) = 0;
  KeyedEncodingContainer.encode(_:forKey:)();
  if (!v2)
  {
    v10[0] = *(void *)(v3 + 16);
    char v11 = 1;
    sub_1000082E0(&qword_10007DA28);
    sub_100054AAC(&qword_10007DA58);
    KeyedEncodingContainer.encode<A>(_:forKey:)();
    sub_100054B10((long long *)(v3 + 24), (uint64_t)&v12);
    sub_100054B10(&v12, (uint64_t)v10);
    char v11 = 2;
    sub_100054B28();
    KeyedEncodingContainer.encode<A>(_:forKey:)();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t sub_10004E484(uint64_t a1, uint64_t a2)
{
  unint64_t v2 = *(void *)(a2 + 8);
  BOOL v3 = *(void *)a1 < *(void *)a2;
  if (*(void *)a1 == *(void *)a2) {
    BOOL v3 = *(void *)(a1 + 8) < v2;
  }
  uint64_t v4 = *(void *)a2 | v2;
  BOOL v5 = v4 != 0;
  if (!*(unsigned char *)(a2 + 16)) {
    BOOL v5 = v3;
  }
  BOOL v6 = *(_OWORD *)a1 == 0;
  unsigned int v7 = v6;
  if (v6) {
    int v8 = *(unsigned __int8 *)(a2 + 16);
  }
  else {
    int v8 = 0;
  }
  BOOL v9 = v4 != 0;
  if (v8 == 1) {
    unsigned int v7 = v9;
  }
  if (*(unsigned char *)(a1 + 16) == 1) {
    return v7;
  }
  else {
    return v5;
  }
}

BOOL sub_10004E4EC(uint64_t a1, uint64_t a2)
{
  unint64_t v2 = *(void *)(a1 + 8);
  int v3 = *(unsigned __int8 *)(a1 + 16);
  BOOL v4 = *(void *)a2 < *(void *)a1;
  if (*(void *)a2 == *(void *)a1) {
    BOOL v4 = *(void *)(a2 + 8) < v2;
  }
  uint64_t v5 = *(void *)a1 | v2;
  BOOL v6 = v5 != 0;
  if (!*(unsigned char *)(a1 + 16)) {
    BOOL v6 = v4;
  }
  BOOL v7 = *(_OWORD *)a2 == 0;
  if (!v7) {
    int v3 = 0;
  }
  BOOL v8 = v5 != 0;
  if (v3 != 1) {
    BOOL v8 = v7;
  }
  if (*(unsigned char *)(a2 + 16) != 1) {
    BOOL v8 = v6;
  }
  return !v8;
}

uint64_t sub_10004E558(uint64_t a1, uint64_t a2)
{
  unint64_t v2 = *(void *)(a2 + 8);
  BOOL v3 = *(void *)a1 < *(void *)a2;
  if (*(void *)a1 == *(void *)a2) {
    BOOL v3 = *(void *)(a1 + 8) < v2;
  }
  uint64_t v4 = *(void *)a2 | v2;
  BOOL v5 = v4 != 0;
  if (!*(unsigned char *)(a2 + 16)) {
    BOOL v5 = v3;
  }
  BOOL v6 = *(_OWORD *)a1 == 0;
  int v7 = v6;
  if (v6) {
    int v8 = *(unsigned __int8 *)(a2 + 16);
  }
  else {
    int v8 = 0;
  }
  BOOL v9 = v4 != 0;
  if (v8 == 1) {
    int v7 = v9;
  }
  if (*(unsigned char *)(a1 + 16) != 1) {
    int v7 = v5;
  }
  return v7 ^ 1u;
}

BOOL sub_10004E5C4(uint64_t a1, uint64_t a2)
{
  unint64_t v2 = *(void *)(a1 + 8);
  int v3 = *(unsigned __int8 *)(a1 + 16);
  BOOL v4 = *(void *)a2 < *(void *)a1;
  if (*(void *)a2 == *(void *)a1) {
    BOOL v4 = *(void *)(a2 + 8) < v2;
  }
  uint64_t v5 = *(void *)a1 | v2;
  BOOL v6 = v5 != 0;
  if (!*(unsigned char *)(a1 + 16)) {
    BOOL v6 = v4;
  }
  BOOL v7 = *(_OWORD *)a2 == 0;
  if (!v7) {
    int v3 = 0;
  }
  BOOL v8 = v5 != 0;
  if (v3 != 1) {
    BOOL v8 = v7;
  }
  if (*(unsigned char *)(a2 + 16) == 1) {
    return v8;
  }
  else {
    return v6;
  }
}

uint64_t sub_10004E62C()
{
  uint64_t v1 = 0x737365636F7270;
  if (*v0 != 1) {
    uint64_t v1 = 0x6E6F69746361;
  }
  if (*v0) {
    return v1;
  }
  else {
    return 1752457584;
  }
}

uint64_t sub_10004E67C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_100054530(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_10004E6A4(uint64_t a1)
{
  unint64_t v2 = sub_10005495C();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10004E6E0(uint64_t a1)
{
  unint64_t v2 = sub_10005495C();

  return CodingKey.debugDescription.getter(a1, v2);
}

double sub_10004E71C@<D0>(void *a1@<X0>, _OWORD *a2@<X8>)
{
  sub_100054670(a1, (uint64_t)&v6);
  if (!v2)
  {
    long long v5 = v7[0];
    *a2 = v6;
    a2[1] = v5;
    double result = *(double *)((char *)v7 + 9);
    *(_OWORD *)((char *)a2 + 25) = *(_OWORD *)((char *)v7 + 9);
  }
  return result;
}

uint64_t sub_10004E760(void *a1)
{
  return sub_10004E28C(a1);
}

uint64_t sub_10004E79C(uint64_t a1)
{
  uint64_t v73 = a1;
  uint64_t v65 = type metadata accessor for FilePath.Component();
  uint64_t v80 = *(void *)(v65 - 8);
  uint64_t v1 = __chkstk_darwin(v65);
  char v79 = (char *)&v57 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v1);
  char v70 = (char *)&v57 - v3;
  uint64_t v76 = type metadata accessor for FilePath.ComponentView.Index();
  uint64_t v78 = *(void *)(v76 - 8);
  uint64_t v4 = __chkstk_darwin(v76);
  unsigned __int8 v75 = (char *)&v57 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v77 = (char *)&v57 - v6;
  uint64_t v7 = type metadata accessor for FilePath.ComponentView();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  BOOL v10 = (char *)&v57 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_1000082E0(&qword_10007D940);
  uint64_t v12 = v11 - 8;
  uint64_t v13 = __chkstk_darwin(v11);
  uint64_t v15 = (char *)&v57 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  uint64_t v74 = (char *)&v57 - v16;
  uint64_t v17 = type metadata accessor for FilePath();
  uint64_t v18 = *(void *)(v17 - 8);
  uint64_t v19 = __chkstk_darwin(v17);
  uint64_t v21 = (char *)&v57 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v19);
  uint64_t v23 = (char *)&v57 - v22;
  swift_bridgeObjectRetain();
  FilePath.init(_:)();
  uint64_t v58 = v18;
  uint64_t v24 = *(void (**)(char *, char *, uint64_t))(v18 + 16);
  char v57 = v23;
  uint64_t v59 = v17;
  v24(v21, v23, v17);
  FilePath.components.getter();
  uint64_t v25 = *(void (**)(char *, uint64_t, uint64_t))(v8 + 16);
  uint64_t v67 = v8 + 16;
  char v66 = v25;
  v25(v15, (uint64_t)v10, v7);
  sub_100008324(&qword_10007D948, (void (*)(uint64_t))&type metadata accessor for FilePath.ComponentView);
  uint64_t v26 = v77;
  dispatch thunk of Collection.startIndex.getter();
  uint64_t v27 = (uint64_t)v74;
  uint64_t v28 = *(void (**)(char *, uint64_t))(v8 + 8);
  char v68 = v10;
  uint64_t v73 = v7;
  uint64_t v69 = v8 + 8;
  uint64_t v64 = v28;
  v28(v10, v7);
  uint64_t v29 = v78;
  (*(void (**)(char *, char *, uint64_t))(v78 + 32))(&v15[*(int *)(v12 + 44)], v26, v76);
  sub_1000084C8((uint64_t)v15, v27, &qword_10007D940);
  uint64_t v30 = v27 + *(int *)(v12 + 44);
  long long v31 = *(void (**)(char *, uint64_t, uint64_t))(v29 + 16);
  uint64_t v78 = v29 + 16;
  uint64_t v71 = (void (**)(char *, uint64_t))(v29 + 8);
  char v72 = v31;
  char v62 = (void (**)(char *))(v80 + 16);
  uint64_t v61 = (void (**)(char *, char *, uint64_t))(v80 + 32);
  uint64_t v60 = (void (**)(char *, uint64_t))(v80 + 8);
  swift_retain();
  LODWORD(v80) = 1;
  for (i = v30; ; uint64_t v30 = i)
  {
    uint64_t v39 = v76;
    char v38 = v77;
    v72(v77, v30, v76);
    char v40 = v75;
    uint64_t v41 = v73;
    dispatch thunk of Collection.endIndex.getter();
    sub_100008324(&qword_10007D950, (void (*)(uint64_t))&type metadata accessor for FilePath.ComponentView.Index);
    char v42 = dispatch thunk of static Equatable.== infix(_:_:)();
    uint64_t v43 = *v71;
    (*v71)(v40, v39);
    v43(v38, v39);
    if (v42) {
      break;
    }
    uint64_t v44 = (void (*)(char *, void))dispatch thunk of Collection.subscript.read();
    uint64_t v45 = v70;
    uint64_t v46 = v65;
    (*v62)(v70);
    v44(v83, 0);
    uint64_t v47 = v68;
    v66(v68, v27, v41);
    dispatch thunk of Collection.formIndex(after:)();
    v64(v47, v41);
    uint64_t v32 = v79;
    (*v61)(v79, v45, v46);
    uint64_t v48 = v81;
    if ((v80 & 1) == 0) {
      goto LABEL_4;
    }
    uint64_t v49 = FilePath.Component.string.getter();
    uint64_t v51 = v50;
    swift_beginAccess();
    uint64_t v52 = *(void *)(v48 + 48);
    if (!*(void *)(v52 + 16)) {
      goto LABEL_3;
    }
    swift_bridgeObjectRetain();
    unint64_t v53 = sub_10000836C(v49, v51);
    if ((v54 & 1) == 0)
    {
      swift_bridgeObjectRelease();
LABEL_3:
      swift_bridgeObjectRelease();
      uint64_t v32 = v79;
LABEL_4:
      type metadata accessor for AnalyticsPolicy();
      uint64_t v33 = swift_allocObject();
      *(void *)(v33 + 16) = 0;
      *(void *)(v33 + 24) = 0;
      *(_WORD *)(v33 + 32) = 256;
      *(void *)(v33 + 40) = sub_1000340F0((uint64_t)&_swiftEmptyArrayStorage);
      *(void *)(v33 + 48) = sub_100034224((uint64_t)&_swiftEmptyArrayStorage);
      *(unsigned char *)(v33 + 56) = 6;
      uint64_t v34 = FilePath.Component.string.getter();
      uint64_t v36 = v35;
      swift_beginAccess();
      swift_retain();
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v82 = *(void *)(v48 + 48);
      *(void *)(v48 + 48) = 0x8000000000000000;
      sub_100051430(v33, v34, v36, isUniquelyReferenced_nonNull_native, (void (*)(void))sub_100051C50, &qword_10007CCA0);
      *(void *)(v48 + 48) = v82;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_endAccess();
      swift_release();
      (*v60)(v32, v46);
      LODWORD(v80) = 0;
      uint64_t v81 = v33;
      goto LABEL_5;
    }
    uint64_t v55 = *(void *)(*(void *)(v52 + 56) + 8 * v53);
    swift_retain();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    (*v60)(v79, v46);
    swift_release();
    LODWORD(v80) = 1;
    uint64_t v81 = v55;
LABEL_5:
    uint64_t v27 = (uint64_t)v74;
  }
  sub_100008590(v27, &qword_10007D940);
  (*(void (**)(char *, uint64_t))(v58 + 8))(v57, v59);
  return v81;
}

uint64_t sub_10004F020(uint64_t *a1)
{
  uint64_t v1 = a1;
  uint64_t v2 = sub_10004E79C(*a1);
  uint64_t v3 = v1[2];
  uint64_t v48 = v3;
  uint64_t v4 = *(void *)(v3 + 16);
  if (v4)
  {
    uint64_t v5 = v2 + 40;
    swift_bridgeObjectRetain();
    swift_beginAccess();
    uint64_t v6 = (uint64_t *)(v3 + 40);
    uint64_t v44 = v1;
    while (1)
    {
      uint64_t v9 = *(v6 - 1);
      uint64_t v8 = *v6;
      uint64_t v10 = *(void *)v5;
      if (*(void *)(*(void *)v5 + 16))
      {
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        unint64_t v11 = sub_10000836C(v9, v8);
        if (v12)
        {
          uint64_t v13 = *(void *)(v10 + 56) + 24 * v11;
          uint64_t v14 = *(void *)v13;
          uint64_t v15 = *(void *)(v13 + 8);
          int v16 = *(unsigned __int8 *)(v13 + 16);
          swift_bridgeObjectRelease();
          uint64_t v18 = v1[3];
          uint64_t v17 = v1[4];
          if (*((unsigned char *)v1 + 40) == 1)
          {
            if (!(v18 | v17))
            {
              uint64_t v14 = v1[3];
              uint64_t v15 = v1[4];
            }
            uint64_t v46 = v15;
            if (v18 | v17) {
              char v19 = v16;
            }
            else {
              char v19 = 1;
            }
          }
          else
          {
            if (!v16)
            {
              char v45 = 0;
              v14 |= v18;
              uint64_t v46 = v17 | v15;
              goto LABEL_16;
            }
            if (v14 | v15)
            {
              char v45 = 0;
              uint64_t v14 = v1[3];
              uint64_t v46 = v1[4];
              goto LABEL_16;
            }
            uint64_t v46 = v15;
            char v19 = 1;
          }
        }
        else
        {
          swift_bridgeObjectRelease();
          uint64_t v14 = v1[3];
          uint64_t v46 = v1[4];
          char v19 = *((unsigned char *)v1 + 40);
        }
        char v45 = v19;
      }
      else
      {
        uint64_t v14 = v1[3];
        uint64_t v46 = v1[4];
        char v45 = *((unsigned char *)v1 + 40);
        swift_bridgeObjectRetain();
      }
LABEL_16:
      swift_beginAccess();
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v21 = *(void **)v5;
      uint64_t v47 = *(void **)v5;
      *(void *)uint64_t v5 = 0x8000000000000000;
      unint64_t v23 = sub_10000836C(v9, v8);
      uint64_t v24 = v21[2];
      BOOL v25 = (v22 & 1) == 0;
      uint64_t v26 = v24 + v25;
      if (__OFADD__(v24, v25))
      {
        __break(1u);
LABEL_46:
        __break(1u);
LABEL_47:
        KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
        __break(1u);
        JUMPOUT(0x10004F3C0);
      }
      char v27 = v22;
      if (v21[3] >= v26)
      {
        if ((isUniquelyReferenced_nonNull_native & 1) == 0)
        {
          sub_100051E08();
          uint64_t v21 = v47;
        }
      }
      else
      {
        sub_100050E38(v26, isUniquelyReferenced_nonNull_native);
        uint64_t v21 = v47;
        unint64_t v28 = sub_10000836C(v9, v8);
        if ((v27 & 1) != (v29 & 1)) {
          goto LABEL_47;
        }
        unint64_t v23 = v28;
      }
      if (v27)
      {
        uint64_t v7 = v21[7] + 24 * v23;
        *(void *)uint64_t v7 = v14;
        *(void *)(v7 + 8) = v46;
        *(unsigned char *)(v7 + 16) = v45;
      }
      else
      {
        v21[(v23 >> 6) + 8] |= 1 << v23;
        uint64_t v30 = (uint64_t *)(v21[6] + 16 * v23);
        *uint64_t v30 = v9;
        v30[1] = v8;
        uint64_t v31 = v21[7] + 24 * v23;
        *(void *)uint64_t v31 = v14;
        *(void *)(v31 + 8) = v46;
        *(unsigned char *)(v31 + 16) = v45;
        uint64_t v32 = v21[2];
        BOOL v33 = __OFADD__(v32, 1);
        uint64_t v34 = v32 + 1;
        if (v33) {
          goto LABEL_46;
        }
        v21[2] = v34;
        swift_bridgeObjectRetain();
      }
      v6 += 2;
      *(void *)uint64_t v5 = v21;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_endAccess();
      --v4;
      uint64_t v1 = v44;
      if (!v4)
      {
        sub_1000534EC((uint64_t)&v48);
        return swift_release();
      }
    }
  }
  uint64_t v36 = v1[3];
  uint64_t v37 = v1[4];
  char v38 = *((unsigned char *)v1 + 40);
  if ((*(unsigned char *)(v2 + 33) & 1) == 0)
  {
    uint64_t v40 = *(void *)(v2 + 16);
    uint64_t v39 = *(void *)(v2 + 24);
    if (*((unsigned char *)v1 + 40))
    {
      char v38 = *(unsigned char *)(v2 + 32) & 1;
      if (v36 | v37)
      {
        uint64_t v36 = *(void *)(v2 + 16);
        uint64_t v37 = *(void *)(v2 + 24);
      }
      else
      {
        char v38 = 1;
      }
    }
    else
    {
      uint64_t v41 = v36 | v40;
      uint64_t v42 = v37 | v39;
      if (v40 | v39)
      {
        char v43 = 0;
      }
      else
      {
        uint64_t v36 = *(void *)(v2 + 16);
        uint64_t v37 = *(void *)(v2 + 24);
        char v43 = 1;
      }
      if (*(unsigned char *)(v2 + 32))
      {
        char v38 = v43;
      }
      else
      {
        uint64_t v36 = v41;
        uint64_t v37 = v42;
        char v38 = 0;
      }
    }
  }
  *(void *)(v2 + 16) = v36;
  *(void *)(v2 + 24) = v37;
  *(unsigned char *)(v2 + 32) = v38;
  *(unsigned char *)(v2 + 33) = 0;

  return swift_release();
}

uint64_t sub_10004F3D8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = type metadata accessor for FilePath.ComponentView.Index();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  char v12 = (char *)&v16 - v11;
  uint64_t v13 = *(void (**)(char *, uint64_t, uint64_t))(v7 + 16);
  if (a2 < 0)
  {
    v13((char *)&v16 - v11, a1, v6);
    type metadata accessor for FilePath.ComponentView();
    sub_100008324(&qword_10007D980, (void (*)(uint64_t))&type metadata accessor for FilePath.ComponentView);
    uint64_t v14 = 0;
    do
    {
      --v14;
      dispatch thunk of BidirectionalCollection.formIndex(before:)();
    }
    while (v14 > a2);
    uint64_t v10 = v12;
  }
  else
  {
    v13(v10, a1, v6);
    if (a2)
    {
      type metadata accessor for FilePath.ComponentView();
      sub_100008324(&qword_10007D948, (void (*)(uint64_t))&type metadata accessor for FilePath.ComponentView);
      do
      {
        dispatch thunk of Collection.formIndex(after:)();
        --a2;
      }
      while (a2);
    }
  }
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v7 + 32))(a3, v10, v6);
}

uint64_t sub_10004F5E0(uint64_t a1, uint64_t a2)
{
  v3[21] = a2;
  v3[22] = v2;
  v3[20] = a1;
  uint64_t v4 = sub_1000082E0(&qword_10007D8C0);
  v3[23] = v4;
  v3[24] = *(void *)(v4 - 8);
  v3[25] = swift_task_alloc();
  uint64_t v5 = sub_1000082E0(&qword_10007D8C8);
  v3[26] = v5;
  v3[27] = *(void *)(v5 - 8);
  v3[28] = swift_task_alloc();
  uint64_t v6 = type metadata accessor for URL();
  v3[29] = v6;
  v3[30] = *(void *)(v6 - 8);
  v3[31] = swift_task_alloc();
  return _swift_task_switch(sub_10004F764, 0, 0);
}

uint64_t sub_10004F764()
{
  uint64_t v2 = v0[24];
  uint64_t v1 = v0[25];
  uint64_t v3 = v0[23];
  URL.init(fileURLWithPath:)();
  type metadata accessor for JSONDecoder();
  swift_allocObject();
  v0[32] = JSONDecoder.init()();
  URL.lines.getter();
  AsyncLineSequence.makeAsyncIterator()();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  uint64_t v4 = sub_10000949C(&qword_10007D8D0, &qword_10007D8C8);
  uint64_t v5 = (void *)swift_task_alloc();
  v0[33] = v5;
  void *v5 = v0;
  v5[1] = sub_10004F8C4;
  uint64_t v6 = v0[26];
  return dispatch thunk of AsyncIteratorProtocol.next()(v0 + 16, v6, v4);
}

uint64_t sub_10004F8C4()
{
  *(void *)(*(void *)v1 + 272) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_10004FD14;
  }
  else {
    uint64_t v2 = sub_10004F9D8;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_10004F9D8()
{
  *(_OWORD *)(v0 + 280) = *(_OWORD *)(v0 + 128);
  return _swift_task_switch(sub_10004FA00, 0, 0);
}

uint64_t sub_10004FA00()
{
  unint64_t v1 = *(void *)(v0 + 288);
  if (!v1)
  {
    uint64_t v16 = *(void *)(v0 + 248);
    uint64_t v17 = *(void *)(v0 + 232);
    uint64_t v18 = *(void *)(v0 + 240);
    uint64_t v20 = *(void *)(v0 + 216);
    uint64_t v19 = *(void *)(v0 + 224);
    uint64_t v21 = *(void *)(v0 + 208);
    swift_release();
    (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v19, v21);
    (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v16, v17);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v15 = *(uint64_t (**)(void))(v0 + 8);
    goto LABEL_5;
  }
  uint64_t v3 = *(void *)(v0 + 272);
  unint64_t v2 = *(void *)(v0 + 280);
  swift_bridgeObjectRetain();
  uint64_t v4 = sub_10004FE68(v2, v1);
  unint64_t v6 = v5;
  sub_100053444();
  dispatch thunk of JSONDecoder.decode<A>(_:from:)();
  if (v3)
  {
    uint64_t v8 = *(void *)(v0 + 280);
    uint64_t v7 = *(void *)(v0 + 288);
    uint64_t v10 = *(void *)(v0 + 160);
    uint64_t v9 = *(void *)(v0 + 168);
    swift_errorRelease();
    sub_100024478(v4, v6);
    sub_100053498();
    swift_allocError();
    *(void *)uint64_t v11 = v10;
    *(void *)(v11 + 8) = v9;
    *(void *)(v11 + 16) = v8;
    *(void *)(v11 + 24) = v7;
    *(void *)(v11 + 32) = 0;
    *(unsigned char *)(v11 + 40) = 64;
    swift_bridgeObjectRetain();
    swift_willThrow();
    swift_release();
    uint64_t v13 = *(void *)(v0 + 240);
    uint64_t v12 = *(void *)(v0 + 248);
    uint64_t v14 = *(void *)(v0 + 232);
    (*(void (**)(void, void))(*(void *)(v0 + 216) + 8))(*(void *)(v0 + 224), *(void *)(v0 + 208));
    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v12, v14);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v15 = *(uint64_t (**)(void))(v0 + 8);
LABEL_5:
    return v15();
  }
  swift_bridgeObjectRelease();
  sub_100024478(v4, v6);
  long long v23 = *(_OWORD *)(v0 + 80);
  *(_OWORD *)(v0 + 16) = *(_OWORD *)(v0 + 64);
  *(_OWORD *)(v0 + 32) = v23;
  *(_OWORD *)(v0 + 41) = *(_OWORD *)(v0 + 89);
  sub_10004F020((uint64_t *)(v0 + 16));
  *(_OWORD *)(v0 + 112) = *(_OWORD *)(v0 + 16);
  sub_100046C70(v0 + 112);
  *(void *)(v0 + 144) = *(void *)(v0 + 32);
  sub_1000534EC(v0 + 144);
  uint64_t v24 = sub_10000949C(&qword_10007D8D0, &qword_10007D8C8);
  BOOL v25 = (void *)swift_task_alloc();
  *(void *)(v0 + 264) = v25;
  *BOOL v25 = v0;
  v25[1] = sub_10004F8C4;
  uint64_t v26 = *(void *)(v0 + 208);
  return dispatch thunk of AsyncIteratorProtocol.next()(v0 + 128, v26, v24);
}

uint64_t sub_10004FD14()
{
  *(void *)(v0 + 152) = *(void *)(v0 + 272);
  sub_1000082E0(&qword_10007D8D8);
  swift_willThrowTypedImpl();
  return _swift_task_switch(sub_10004FDA0, 0, 0);
}

uint64_t sub_10004FDA0()
{
  swift_release();
  uint64_t v2 = v0[30];
  uint64_t v1 = v0[31];
  uint64_t v3 = v0[29];
  (*(void (**)(void, void))(v0[27] + 8))(v0[28], v0[26]);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t sub_10004FE68(unint64_t a1, unint64_t a2)
{
  *(void *)&long long v40 = a1;
  *((void *)&v40 + 1) = a2;
  swift_bridgeObjectRetain();
  sub_1000082E0(&qword_10007D8F0);
  if (swift_dynamicCast())
  {
    sub_10001FA80(v38, (uint64_t)&v41);
    sub_10000B090(&v41, v43);
    dispatch thunk of ContiguousBytes.withUnsafeBytes<A>(_:)();
    swift_bridgeObjectRelease();
    v38[0] = v40;
    sub_100008540((uint64_t)&v41);
    return *(void *)&v38[0];
  }
  uint64_t v39 = 0;
  memset(v38, 0, sizeof(v38));
  sub_100008590((uint64_t)v38, &qword_10007D8F8);
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
        uint64_t v4 = _StringObject.sharedUTF8.getter();
      }
      if (v4) {
        uint64_t v6 = (unsigned char *)(v4 + v5);
      }
      else {
        uint64_t v6 = 0;
      }
      uint64_t v7 = (uint64_t *)v4;
    }
    uint64_t v8 = sub_10005275C(v7, v6);
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
    Swift::Int v11 = String.UTF8View._foreignCount()();
    goto LABEL_17;
  }
LABEL_69:
  uint64_t v8 = 0;
  unint64_t v10 = 0xF000000000000000;
  if ((v3 & 0x1000000000000000) != 0) {
    goto LABEL_70;
  }
LABEL_14:
  if ((v3 & 0x2000000000000000) != 0) {
    Swift::Int v11 = HIBYTE(v3) & 0xF;
  }
  else {
    Swift::Int v11 = v2 & 0xFFFFFFFFFFFFLL;
  }
LABEL_17:
  *(void *)&v38[0] = sub_1000527C0(v11);
  *((void *)&v38[0] + 1) = v12;
  __chkstk_darwin(*(void *)&v38[0]);
  unint64_t v13 = (unint64_t)sub_100051FCC((void *(*)(uint64_t *__return_ptr, char *, char *))sub_100053518);
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
        Data._Representation.replaceSubrange(_:with:count:)();
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
      unint64_t v2 = sub_10001F3A4(v19, v17, v18);
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
      unint64_t v2 = String.UTF8View._foreignSubscript(position:)();
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
        unint64_t v2 = _StringObject.sharedUTF8.getter();
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
    unint64_t v2 = sub_10001F3A4(v19, v17, v18);
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
    unint64_t v2 = String.UTF8View._foreignIndex(after:)();
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
      Data._Representation.append(contentsOf:)();
      LOBYTE(v26) = 0;
      BYTE14(v40) = 0;
    }
  }
  while (4 * v25 != v19 >> 14);
  uint64_t v8 = (unsigned char *)v33;
  if ((_BYTE)v26)
  {
    uint64_t v41 = v40;
    LODWORD(v42) = DWORD2(v40);
    WORD2(v42) = WORD6(v40);
    Data._Representation.append(contentsOf:)();
    sub_100024464(v33, v10);
    goto LABEL_63;
  }
LABEL_58:
  swift_bridgeObjectRelease();
  sub_100024464((uint64_t)v8, v10);
LABEL_64:
  swift_bridgeObjectRelease();
  return *(void *)&v38[0];
}

uint64_t sub_100050398()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for AnalyticsPolicy()
{
  return self;
}

uint64_t sub_1000503FC()
{
  swift_release();

  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for PolicyWriter()
{
  return self;
}

__n128 initializeBufferWithCopyOfBuffer for AnalyticsAction(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t getEnumTagSinglePayload for AnalyticsAction(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 17)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for AnalyticsAction(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)__n128 result = 0;
    *(void *)(result + 8) = 0;
    *(unsigned char *)(result + 16) = 0;
    *(_DWORD *)__n128 result = a2 - 1;
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
  *(unsigned char *)(result + 17) = v3;
  return result;
}

uint64_t sub_1000504C4(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_1000504E0(uint64_t result, int a2)
{
  if (a2)
  {
    *(void *)__n128 result = (a2 - 1);
    *(void *)(result + 8) = 0;
    *(unsigned char *)(result + 16) = 1;
  }
  else
  {
    *(unsigned char *)(result + 16) = 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for AnalyticsAction()
{
  return &type metadata for AnalyticsAction;
}

unint64_t sub_100050514()
{
  unint64_t result = qword_10007D820;
  if (!qword_10007D820)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007D820);
  }
  return result;
}

unint64_t sub_10005056C()
{
  unint64_t result = qword_10007D828;
  if (!qword_10007D828)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007D828);
  }
  return result;
}

unint64_t sub_1000505C4()
{
  unint64_t result = qword_10007D830;
  if (!qword_10007D830)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007D830);
  }
  return result;
}

uint64_t sub_100050618(uint64_t a1, char a2)
{
  char v3 = v2;
  uint64_t v5 = *v2;
  sub_1000082E0(&qword_10007CD00);
  char v42 = a2;
  uint64_t v6 = static _DictionaryStorage.resize(original:capacity:move:)();
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
          char v3 = v39;
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
    uint64_t v35 = (uint64_t *)(*(void *)(v5 + 56) + v31);
    uint64_t v36 = *v35;
    uint64_t v37 = v35[1];
    if ((v42 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    Hasher.init(_seed:)();
    String.hash(into:)();
    uint64_t result = Hasher._finalize()();
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
    unint64_t v19 = (void *)(*(void *)(v7 + 48) + v18);
    *unint64_t v19 = v34;
    v19[1] = v33;
    uint64_t v20 = (void *)(*(void *)(v7 + 56) + v18);
    *uint64_t v20 = v36;
    v20[1] = v37;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  char v3 = v39;
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
    *uint64_t v24 = -1 << v38;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *char v3 = v7;
  return result;
}

unint64_t sub_100050940(uint64_t a1, char a2)
{
  char v3 = v2;
  uint64_t v5 = *v2;
  sub_1000082E0(&qword_10007CC90);
  uint64_t v6 = (void *)static _DictionaryStorage.resize(original:capacity:move:)();
  if (*(void *)(v5 + 16))
  {
    uint64_t v7 = 1 << *(unsigned char *)(v5 + 32);
    uint64_t v8 = (void *)(v5 + 64);
    uint64_t v9 = -1;
    if (v7 < 64) {
      uint64_t v9 = ~(-1 << v7);
    }
    unint64_t v10 = v9 & *(void *)(v5 + 64);
    int64_t v11 = (unint64_t)(v7 + 63) >> 6;
    unint64_t result = swift_retain();
    int64_t v13 = 0;
    while (1)
    {
      if (v10)
      {
        unint64_t v14 = __clz(__rbit64(v10));
        v10 &= v10 - 1;
        unint64_t v15 = v14 | (v13 << 6);
      }
      else
      {
        int64_t v16 = v13 + 1;
        if (__OFADD__(v13, 1))
        {
          __break(1u);
LABEL_29:
          __break(1u);
          return result;
        }
        if (v16 >= v11) {
          goto LABEL_22;
        }
        unint64_t v17 = v8[v16];
        ++v13;
        if (!v17)
        {
          int64_t v13 = v16 + 1;
          if (v16 + 1 >= v11) {
            goto LABEL_22;
          }
          unint64_t v17 = v8[v13];
          if (!v17)
          {
            int64_t v18 = v16 + 2;
            if (v18 >= v11)
            {
LABEL_22:
              swift_release();
              if (a2)
              {
                uint64_t v21 = 1 << *(unsigned char *)(v5 + 32);
                if (v21 > 63) {
                  bzero((void *)(v5 + 64), ((unint64_t)(v21 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *uint64_t v8 = -1 << v21;
                }
                *(void *)(v5 + 16) = 0;
              }
              break;
            }
            unint64_t v17 = v8[v18];
            if (!v17)
            {
              while (1)
              {
                int64_t v13 = v18 + 1;
                if (__OFADD__(v18, 1)) {
                  goto LABEL_29;
                }
                if (v13 >= v11) {
                  goto LABEL_22;
                }
                unint64_t v17 = v8[v13];
                ++v18;
                if (v17) {
                  goto LABEL_19;
                }
              }
            }
            int64_t v13 = v18;
          }
        }
LABEL_19:
        unint64_t v10 = (v17 - 1) & v17;
        unint64_t v15 = __clz(__rbit64(v17)) + (v13 << 6);
      }
      char v19 = *(unsigned char *)(*(void *)(v5 + 48) + v15);
      uint64_t v20 = *(void *)(*(void *)(v5 + 56) + 8 * v15);
      if ((a2 & 1) == 0) {
        swift_retain();
      }
      unint64_t result = sub_1000515BC(v19, v20, v6);
    }
  }
  unint64_t result = swift_release();
  *char v3 = v6;
  return result;
}

uint64_t sub_100050B24(uint64_t a1, char a2, uint64_t *a3)
{
  uint64_t v4 = v3;
  uint64_t v6 = *v3;
  sub_1000082E0(a3);
  char v37 = a2;
  uint64_t v7 = static _DictionaryStorage.resize(original:capacity:move:)();
  uint64_t v8 = v7;
  if (!*(void *)(v6 + 16)) {
    goto LABEL_40;
  }
  uint64_t v9 = 1 << *(unsigned char *)(v6 + 32);
  uint64_t v36 = v6 + 64;
  if (v9 < 64) {
    uint64_t v10 = ~(-1 << v9);
  }
  else {
    uint64_t v10 = -1;
  }
  unint64_t v11 = v10 & *(void *)(v6 + 64);
  int64_t v35 = (unint64_t)(v9 + 63) >> 6;
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
    if (v22 >= v35) {
      break;
    }
    int64_t v23 = (void *)(v6 + 64);
    unint64_t v24 = *(void *)(v36 + 8 * v22);
    ++v14;
    if (!v24)
    {
      int64_t v14 = v22 + 1;
      if (v22 + 1 >= v35) {
        goto LABEL_33;
      }
      unint64_t v24 = *(void *)(v36 + 8 * v14);
      if (!v24)
      {
        int64_t v25 = v22 + 2;
        if (v25 >= v35)
        {
LABEL_33:
          swift_release();
          if ((v37 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v24 = *(void *)(v36 + 8 * v25);
        if (!v24)
        {
          while (1)
          {
            int64_t v14 = v25 + 1;
            if (__OFADD__(v25, 1)) {
              goto LABEL_42;
            }
            if (v14 >= v35) {
              goto LABEL_33;
            }
            unint64_t v24 = *(void *)(v36 + 8 * v14);
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
    uint64_t v33 = *(void *)(*(void *)(v6 + 56) + 8 * v21);
    if ((v37 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_retain();
    }
    Hasher.init(_seed:)();
    String.hash(into:)();
    uint64_t result = Hasher._finalize()();
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
    char v19 = (void *)(*(void *)(v8 + 48) + 16 * v18);
    *char v19 = v32;
    v19[1] = v31;
    *(void *)(*(void *)(v8 + 56) + 8 * v18) = v33;
    ++*(void *)(v8 + 16);
  }
  swift_release();
  int64_t v23 = (void *)(v6 + 64);
  if ((v37 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v34 = 1 << *(unsigned char *)(v6 + 32);
  if (v34 >= 64) {
    bzero(v23, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    void *v23 = -1 << v34;
  }
  *(void *)(v6 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v4 = v8;
  return result;
}

uint64_t sub_100050E38(uint64_t a1, char a2)
{
  char v3 = v2;
  uint64_t v5 = *v2;
  sub_1000082E0(&qword_10007CCA8);
  char v37 = a2;
  uint64_t v6 = static _DictionaryStorage.resize(original:capacity:move:)();
  uint64_t v7 = v6;
  if (*(void *)(v5 + 16))
  {
    uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
    uint64_t v36 = (void *)(v5 + 64);
    if (v8 < 64) {
      uint64_t v9 = ~(-1 << v8);
    }
    else {
      uint64_t v9 = -1;
    }
    unint64_t v10 = v9 & *(void *)(v5 + 64);
    int64_t v35 = (unint64_t)(v8 + 63) >> 6;
    uint64_t v11 = v6 + 64;
    uint64_t result = swift_retain();
    int64_t v13 = 0;
    while (1)
    {
      if (v10)
      {
        unint64_t v20 = __clz(__rbit64(v10));
        v10 &= v10 - 1;
        unint64_t v21 = v20 | (v13 << 6);
      }
      else
      {
        int64_t v22 = v13 + 1;
        if (__OFADD__(v13, 1))
        {
LABEL_39:
          __break(1u);
LABEL_40:
          __break(1u);
          return result;
        }
        if (v22 >= v35) {
          goto LABEL_33;
        }
        unint64_t v23 = v36[v22];
        ++v13;
        if (!v23)
        {
          int64_t v13 = v22 + 1;
          if (v22 + 1 >= v35) {
            goto LABEL_33;
          }
          unint64_t v23 = v36[v13];
          if (!v23)
          {
            int64_t v24 = v22 + 2;
            if (v24 >= v35)
            {
LABEL_33:
              swift_release();
              char v3 = v2;
              if (v37)
              {
                uint64_t v34 = 1 << *(unsigned char *)(v5 + 32);
                if (v34 >= 64) {
                  bzero(v36, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *uint64_t v36 = -1 << v34;
                }
                *(void *)(v5 + 16) = 0;
              }
              break;
            }
            unint64_t v23 = v36[v24];
            if (!v23)
            {
              while (1)
              {
                int64_t v13 = v24 + 1;
                if (__OFADD__(v24, 1)) {
                  goto LABEL_40;
                }
                if (v13 >= v35) {
                  goto LABEL_33;
                }
                unint64_t v23 = v36[v13];
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
        unint64_t v21 = __clz(__rbit64(v23)) + (v13 << 6);
      }
      uint64_t v29 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v21);
      uint64_t v31 = *v29;
      uint64_t v30 = v29[1];
      uint64_t v32 = *(void *)(v5 + 56) + 24 * v21;
      long long v38 = *(_OWORD *)v32;
      char v33 = *(unsigned char *)(v32 + 16);
      if ((v37 & 1) == 0) {
        swift_bridgeObjectRetain();
      }
      Hasher.init(_seed:)();
      String.hash(into:)();
      uint64_t result = Hasher._finalize()();
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
            goto LABEL_39;
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
      uint64_t v19 = *(void *)(v7 + 56) + 24 * v17;
      *(_OWORD *)uint64_t v19 = v38;
      *(unsigned char *)(v19 + 16) = v33;
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
  *char v3 = v7;
  return result;
}

uint64_t sub_100051150(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  uint64_t v6 = v5;
  uint64_t v12 = *v5;
  unint64_t v14 = sub_10000836C(a3, a4);
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
    sub_100051738();
LABEL_7:
    unint64_t v20 = (void *)*v6;
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
  sub_100050618(v17, a5 & 1);
  unint64_t v23 = sub_10000836C(a3, a4);
  if ((v18 & 1) != (v24 & 1))
  {
LABEL_17:
    uint64_t result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
    __break(1u);
    return result;
  }
  unint64_t v14 = v23;
  unint64_t v20 = (void *)*v6;
  if (v18) {
    goto LABEL_8;
  }
LABEL_11:
  v20[(v14 >> 6) + 8] |= 1 << v14;
  char v25 = (uint64_t *)(v20[6] + 16 * v14);
  *char v25 = a3;
  v25[1] = a4;
  unint64_t v26 = (void *)(v20[7] + 16 * v14);
  *unint64_t v26 = a1;
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
  void v20[2] = v29;

  return swift_bridgeObjectRetain();
}

uint64_t sub_1000512D8(uint64_t a1, unsigned __int8 a2, char a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = *v3;
  unint64_t v10 = sub_100036E98(a2);
  uint64_t v11 = *(void *)(v8 + 16);
  BOOL v12 = (v9 & 1) == 0;
  uint64_t result = v11 + v12;
  if (__OFADD__(v11, v12))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  char v14 = v9;
  uint64_t v15 = *(void *)(v8 + 24);
  if (v15 >= result && (a3 & 1) != 0) {
    goto LABEL_7;
  }
  if (v15 >= result && (a3 & 1) == 0)
  {
    uint64_t result = (uint64_t)sub_1000518F4();
LABEL_7:
    BOOL v16 = (void *)*v4;
    if (v14)
    {
LABEL_8:
      uint64_t v17 = v16[7];
      uint64_t result = swift_release();
      *(void *)(v17 + 8 * v10) = a1;
      return result;
    }
LABEL_11:
    v16[(v10 >> 6) + 8] |= 1 << v10;
    *(unsigned char *)(v16[6] + v10) = a2;
    *(void *)(v16[7] + 8 * v10) = a1;
    uint64_t v19 = v16[2];
    BOOL v20 = __OFADD__(v19, 1);
    uint64_t v21 = v19 + 1;
    if (!v20)
    {
      void v16[2] = v21;
      return result;
    }
    goto LABEL_14;
  }
  sub_100050940(result, a3 & 1);
  uint64_t result = sub_100036E98(a2);
  if ((v14 & 1) == (v18 & 1))
  {
    unint64_t v10 = result;
    BOOL v16 = (void *)*v4;
    if (v14) {
      goto LABEL_8;
    }
    goto LABEL_11;
  }
LABEL_15:
  uint64_t result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
  __break(1u);
  return result;
}

uint64_t sub_100051410(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  return sub_100051430(a1, a2, a3, a4, (void (*)(void))sub_100051A98, &qword_10007CC98);
}

uint64_t sub_100051430(uint64_t a1, uint64_t a2, uint64_t a3, char a4, void (*a5)(void), uint64_t *a6)
{
  char v9 = v6;
  uint64_t v14 = *v6;
  unint64_t v16 = sub_10000836C(a2, a3);
  uint64_t v17 = *(void *)(v14 + 16);
  BOOL v18 = (v15 & 1) == 0;
  uint64_t v19 = v17 + v18;
  if (__OFADD__(v17, v18))
  {
    __break(1u);
    goto LABEL_16;
  }
  char v20 = v15;
  uint64_t v21 = *(void *)(v14 + 24);
  if (v21 >= v19 && (a4 & 1) != 0) {
    goto LABEL_7;
  }
  if (v21 >= v19 && (a4 & 1) == 0)
  {
    a5();
LABEL_7:
    int64_t v22 = (void *)*v9;
    if (v20)
    {
LABEL_8:
      uint64_t v23 = v22[7];
      uint64_t result = swift_release();
      *(void *)(v23 + 8 * v16) = a1;
      return result;
    }
    goto LABEL_11;
  }
  sub_100050B24(v19, a4 & 1, a6);
  unint64_t v25 = sub_10000836C(a2, a3);
  if ((v20 & 1) != (v26 & 1))
  {
LABEL_17:
    uint64_t result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
    __break(1u);
    return result;
  }
  unint64_t v16 = v25;
  int64_t v22 = (void *)*v9;
  if (v20) {
    goto LABEL_8;
  }
LABEL_11:
  v22[(v16 >> 6) + 8] |= 1 << v16;
  uint64_t v27 = (uint64_t *)(v22[6] + 16 * v16);
  *uint64_t v27 = a2;
  v27[1] = a3;
  *(void *)(v22[7] + 8 * v16) = a1;
  uint64_t v28 = v22[2];
  BOOL v29 = __OFADD__(v28, 1);
  uint64_t v30 = v28 + 1;
  if (v29)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v22[2] = v30;

  return swift_bridgeObjectRetain();
}

unint64_t sub_1000515BC(char a1, uint64_t a2, void *a3)
{
  Hasher.init(_seed:)();
  String.hash(into:)();
  swift_bridgeObjectRelease();
  Hasher._finalize()();
  unint64_t result = _HashTable.nextHole(atOrAfter:)();
  *(void *)((char *)a3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
  *(unsigned char *)(a3[6] + result) = a1;
  *(void *)(a3[7] + 8 * result) = a2;
  ++a3[2];
  return result;
}

void *sub_100051738()
{
  uint64_t v1 = v0;
  sub_1000082E0(&qword_10007CD00);
  uint64_t v2 = *v0;
  uint64_t v3 = static _DictionaryStorage.copy(original:)();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    unint64_t result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  unint64_t result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    unint64_t result = memmove(result, (const void *)(v2 + 64), 8 * v7);
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
    char v20 = (uint64_t *)(*(void *)(v2 + 56) + v16);
    uint64_t v21 = *v20;
    uint64_t v22 = v20[1];
    uint64_t v23 = (void *)(*(void *)(v4 + 48) + v16);
    void *v23 = v19;
    v23[1] = v18;
    char v24 = (void *)(*(void *)(v4 + 56) + v16);
    *char v24 = v21;
    v24[1] = v22;
    swift_bridgeObjectRetain();
    unint64_t result = (void *)swift_bridgeObjectRetain();
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

void *sub_1000518F4()
{
  uint64_t v1 = v0;
  sub_1000082E0(&qword_10007CC90);
  uint64_t v2 = *v0;
  uint64_t v3 = static _DictionaryStorage.copy(original:)();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    unint64_t result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  unint64_t result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    unint64_t result = memmove(result, (const void *)(v2 + 64), 8 * v7);
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
    int64_t v17 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v17 >= v13) {
      goto LABEL_26;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    ++v9;
    if (!v18)
    {
      int64_t v9 = v17 + 1;
      if (v17 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v18 = *(void *)(v6 + 8 * v9);
      if (!v18) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v18 - 1) & v18;
    unint64_t v15 = __clz(__rbit64(v18)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = *(void *)(*(void *)(v2 + 56) + 8 * v15);
    *(unsigned char *)(*(void *)(v4 + 48) + v15) = *(unsigned char *)(*(void *)(v2 + 48) + v15);
    *(void *)(*(void *)(v4 + 56) + 8 * v15) = v16;
    unint64_t result = (void *)swift_retain();
  }
  int64_t v19 = v17 + 2;
  if (v19 >= v13) {
    goto LABEL_26;
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
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v9);
    ++v19;
    if (v18) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_100051A98()
{
  uint64_t v1 = v0;
  sub_1000082E0(&qword_10007CC98);
  uint64_t v2 = *v0;
  uint64_t v3 = static _DictionaryStorage.copy(original:)();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    unint64_t result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  unint64_t result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    unint64_t result = memmove(result, (const void *)(v2 + 64), 8 * v7);
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
    int64_t v17 = (void *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v18 = v17[1];
    uint64_t v19 = 8 * v15;
    uint64_t v20 = *(void *)(*(void *)(v2 + 56) + v19);
    uint64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    *uint64_t v21 = *v17;
    v21[1] = v18;
    *(void *)(*(void *)(v4 + 56) + v19) = v20;
    swift_bridgeObjectRetain();
    unint64_t result = (void *)swift_retain();
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

void *sub_100051C50()
{
  uint64_t v1 = v0;
  sub_1000082E0(&qword_10007CCA0);
  uint64_t v2 = *v0;
  uint64_t v3 = static _DictionaryStorage.copy(original:)();
  uint64_t v4 = v3;
  uint64_t v5 = *(void *)(v2 + 16);
  if (!v5)
  {
LABEL_26:
    unint64_t result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  unint64_t result = (void *)(v3 + 64);
  uint64_t v7 = v2 + 64;
  unint64_t v8 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v8)
  {
    unint64_t result = memmove(result, (const void *)(v2 + 64), 8 * v8);
    uint64_t v5 = *(void *)(v2 + 16);
  }
  int64_t v10 = 0;
  *(void *)(v4 + 16) = v5;
  uint64_t v11 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v12 = -1;
  if (v11 < 64) {
    uint64_t v12 = ~(-1 << v11);
  }
  unint64_t v13 = v12 & *(void *)(v2 + 64);
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
    uint64_t v18 = (void *)(*(void *)(v2 + 48) + 16 * v16);
    uint64_t v19 = v18[1];
    uint64_t v20 = 8 * v16;
    uint64_t v21 = *(void *)(*(void *)(v2 + 56) + v20);
    int64_t v22 = (void *)(*(void *)(v4 + 48) + v17);
    void *v22 = *v18;
    v22[1] = v19;
    *(void *)(*(void *)(v4 + 56) + v20) = v21;
    swift_bridgeObjectRetain();
    unint64_t result = (void *)swift_retain();
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

void *sub_100051E08()
{
  uint64_t v1 = v0;
  sub_1000082E0(&qword_10007CCA8);
  uint64_t v2 = *v0;
  uint64_t v3 = static _DictionaryStorage.copy(original:)();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    unint64_t result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  unint64_t result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    unint64_t result = memmove(result, (const void *)(v2 + 64), 8 * v7);
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
    int64_t v26 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v26 >= v13) {
      goto LABEL_26;
    }
    unint64_t v27 = *(void *)(v6 + 8 * v26);
    ++v9;
    if (!v27)
    {
      int64_t v9 = v26 + 1;
      if (v26 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v27 = *(void *)(v6 + 8 * v9);
      if (!v27) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v27 - 1) & v27;
    unint64_t v15 = __clz(__rbit64(v27)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    uint64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    uint64_t v20 = 24 * v15;
    uint64_t v21 = *(void *)(v2 + 56) + v20;
    char v22 = *(unsigned char *)(v21 + 16);
    int64_t v23 = (void *)(*(void *)(v4 + 48) + v16);
    long long v24 = *(_OWORD *)v21;
    void *v23 = v19;
    v23[1] = v18;
    uint64_t v25 = *(void *)(v4 + 56) + v20;
    *(_OWORD *)uint64_t v25 = v24;
    *(unsigned char *)(v25 + 16) = v22;
    unint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v28 = v26 + 2;
  if (v28 >= v13) {
    goto LABEL_26;
  }
  unint64_t v27 = *(void *)(v6 + 8 * v28);
  if (v27)
  {
    int64_t v9 = v28;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v28 + 1;
    if (__OFADD__(v28, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v27 = *(void *)(v6 + 8 * v9);
    ++v28;
    if (v27) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

char *sub_100051FCC(void *(*a1)(uint64_t *__return_ptr, char *, char *))
{
  uint64_t v4 = *v1;
  unint64_t v3 = v1[1];
  uint64_t v5 = v1;
  switch(v3 >> 62)
  {
    case 1uLL:
      uint64_t v9 = v3 & 0x3FFFFFFFFFFFFFFFLL;
      *(_OWORD *)uint64_t v1 = xmmword_1000586F0;
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v11 = v4 >> 32;
      if (isUniquelyReferenced_nonNull_native) {
        goto LABEL_16;
      }
      if (v11 < (int)v4) {
        goto LABEL_23;
      }
      if (__DataStorage._bytes.getter() && __OFSUB__((int)v4, __DataStorage._offset.getter())) {
        goto LABEL_24;
      }
      type metadata accessor for __DataStorage();
      swift_allocObject();
      uint64_t v13 = __DataStorage.init(bytes:length:copy:deallocator:offset:)();
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
      unint64_t result = sub_1000523B8((int)v4, v11, a1);
      unint64_t v12 = v9 | 0x4000000000000000;
      if (v2)
      {
        uint64_t *v5 = v4;
        goto LABEL_19;
      }
      uint64_t *v5 = v4;
      v5[1] = v12;
      break;
    case 2uLL:
      uint64_t v14 = *v1;
      uint64_t v15 = v3 & 0x3FFFFFFFFFFFFFFFLL;
      Data.LargeSlice.ensureUniqueReference()();
      unint64_t result = sub_1000523B8(*(void *)(v14 + 16), *(void *)(v14 + 24), a1);
      unint64_t v12 = v15 | 0x8000000000000000;
      if (v2)
      {
        *uint64_t v1 = v14;
LABEL_19:
        v5[1] = v12;
      }
      else
      {
        *uint64_t v1 = v14;
        v1[1] = v12;
      }
      break;
    case 3uLL:
      memset(v16, 0, 15);
      unint64_t result = (char *)a1(&v14, (char *)v16, (char *)v16);
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
      unint64_t result = (char *)a1(&v14, (char *)v16, (char *)v16 + BYTE6(v3));
      if (!v2) {
        unint64_t result = (char *)v14;
      }
      unint64_t v8 = LODWORD(v16[1]) | ((unint64_t)BYTE4(v16[1]) << 32) | ((unint64_t)BYTE5(v16[1]) << 40) | ((unint64_t)BYTE6(v16[1]) << 48);
      *uint64_t v1 = v16[0];
      v1[1] = v8;
      return result;
  }
  return result;
}

unsigned char *sub_1000522D0@<X0>(unsigned char *result@<X0>, unsigned char *a2@<X1>, void *a3@<X8>)
{
  if (!result) {
    goto LABEL_4;
  }
  uint64_t v4 = a2 - result;
  if (a2 == result)
  {
    unint64_t result = 0;
LABEL_4:
    unint64_t v5 = 0xC000000000000000;
    goto LABEL_5;
  }
  if (v4 <= 14)
  {
    unint64_t result = (unsigned char *)sub_100052598(result, a2);
    unint64_t v5 = v7 & 0xFFFFFFFFFFFFFFLL;
  }
  else if ((unint64_t)v4 >= 0x7FFFFFFF)
  {
    unint64_t result = (unsigned char *)sub_10005265C((uint64_t)result, (uint64_t)a2);
    unint64_t v5 = v8 | 0x8000000000000000;
  }
  else
  {
    unint64_t result = (unsigned char *)sub_1000526D8((uint64_t)result, (uint64_t)a2);
    unint64_t v5 = v6 | 0x4000000000000000;
  }
LABEL_5:
  *a3 = result;
  a3[1] = v5;
  return result;
}

void *sub_100052348(void *(*a1)(uint64_t *__return_ptr, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a3)
  {
    unint64_t result = a1(&v6, a3, a4 - a3);
    if (v4) {
      return result;
    }
    return (void *)v6;
  }
  unint64_t result = a1(&v6, 0, 0);
  if (!v4) {
    return (void *)v6;
  }
  return result;
}

char *sub_1000523B8(uint64_t a1, uint64_t a2, void *(*a3)(uint64_t *__return_ptr, char *, char *))
{
  unint64_t result = (char *)__DataStorage._bytes.getter();
  if (!result) {
    goto LABEL_12;
  }
  uint64_t v8 = result;
  unint64_t result = (char *)__DataStorage._offset.getter();
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
  uint64_t v12 = __DataStorage._length.getter();
  if (v12 >= v11) {
    uint64_t v13 = v11;
  }
  else {
    uint64_t v13 = v12;
  }
  unint64_t result = (char *)a3(&v14, &v8[v9], &v8[v9 + v13]);
  if (!v3) {
    return (char *)v14;
  }
  return result;
}

uint64_t sub_10005246C@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  if (result)
  {
    swift_bridgeObjectRetain();
    unint64_t result = _StringGuts.copyUTF8(into:)();
    if ((v3 & 1) == 0)
    {
      uint64_t v4 = result;
      unint64_t result = swift_bridgeObjectRelease();
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

unint64_t sub_1000524F8(Swift::String string)
{
  object = string._object;
  v2._countAndFlagsBits = string._countAndFlagsBits;
  v2._object = object;
  unint64_t v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_10006D720, v2);
  swift_bridgeObjectRelease();
  if (v3 >= 5) {
    return 5;
  }
  else {
    return v3;
  }
}

uint64_t sub_100052544()
{
  unint64_t v0 = _findStringSwitchCaseWithCache(cases:string:cache:)();
  swift_bridgeObjectRelease();
  if (v0 >= 0x13) {
    return 19;
  }
  else {
    return v0;
  }
}

uint64_t sub_100052598(unsigned char *__src, unsigned char *a2)
{
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

uint64_t sub_10005265C(uint64_t a1, uint64_t a2)
{
  if (a1) {
    uint64_t v2 = a2 - a1;
  }
  else {
    uint64_t v2 = 0;
  }
  type metadata accessor for __DataStorage();
  swift_allocObject();
  uint64_t result = __DataStorage.init(bytes:length:)();
  if (v2 < 0)
  {
    __break(1u);
  }
  else
  {
    type metadata accessor for Data.RangeReference();
    uint64_t result = swift_allocObject();
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = v2;
  }
  return result;
}

uint64_t sub_1000526D8(uint64_t a1, uint64_t a2)
{
  if (a1) {
    uint64_t v2 = a2 - a1;
  }
  else {
    uint64_t v2 = 0;
  }
  type metadata accessor for __DataStorage();
  swift_allocObject();
  uint64_t result = __DataStorage.init(bytes:length:)();
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

unsigned char *sub_10005275C(unsigned char *result, unsigned char *a2)
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
      return (unsigned char *)sub_100052598(result, a2);
    }
    else if ((unint64_t)v2 >= 0x7FFFFFFF)
    {
      return (unsigned char *)sub_10005265C((uint64_t)result, (uint64_t)a2);
    }
    else
    {
      return (unsigned char *)sub_1000526D8((uint64_t)result, (uint64_t)a2);
    }
  }
  return result;
}

uint64_t sub_1000527C0(uint64_t result)
{
  if (result)
  {
    unint64_t v1 = result;
    if (result <= 14)
    {
      if (result < 0)
      {
        __break(1u);
        JUMPOUT(0x100052860);
      }
      return 0;
    }
    else
    {
      type metadata accessor for __DataStorage();
      swift_allocObject();
      __DataStorage.init(length:)();
      if (v1 >= 0x7FFFFFFF)
      {
        type metadata accessor for Data.RangeReference();
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

uint64_t sub_1000528D0(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return 0;
  }
  uint64_t result = 0;
  uint64_t v4 = (uint64_t *)(a1 + 32);
  do
  {
    uint64_t v6 = *v4++;
    uint64_t v5 = v6;
    if ((v6 & ~result) == 0) {
      uint64_t v5 = 0;
    }
    result |= v5;
    --v1;
  }
  while (v1);
  return result;
}

uint64_t sub_100052908(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 1885956947 && a2 == 0xE400000000000000;
  if (v2 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x746365707845 && a2 == 0xE600000000000000 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x74726F706552 && a2 == 0xE600000000000000)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    char v6 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if (v6) {
      return 2;
    }
    else {
      return 3;
    }
  }
}

uint64_t sub_100052A40(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x7365646F6DLL && a2 == 0xE500000000000000;
  if (v2 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x69726F6765746163 && a2 == 0xEA00000000007365)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_100052B38(void *a1)
{
  uint64_t v2 = sub_1000082E0(&qword_10007D838);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v27 = v2;
  uint64_t v28 = v3;
  __chkstk_darwin(v2);
  uint64_t v30 = (char *)&v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = sub_1000082E0(&qword_10007D840);
  uint64_t v29 = *(void *)(v25 - 8);
  __chkstk_darwin(v25);
  char v6 = (char *)&v25 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_1000082E0(&qword_10007D848);
  uint64_t v26 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)&v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_1000082E0(&qword_10007D850);
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)&v25 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = a1[3];
  uint64_t v31 = a1;
  sub_10000B090(a1, v14);
  sub_1000531A4();
  uint64_t v15 = v32;
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (!v15)
  {
    uint64_t v16 = v30;
    uint64_t v32 = v11;
    uint64_t v17 = KeyedDecodingContainer.allKeys.getter();
    if (*(void *)(v17 + 16) == 1)
    {
      if (*(unsigned char *)(v17 + 32))
      {
        if (*(unsigned char *)(v17 + 32) == 1)
        {
          uint64_t v18 = v32;
          LOBYTE(v35) = 1;
          sub_10005324C();
          KeyedDecodingContainer.nestedContainer<A>(keyedBy:forKey:)();
          LOBYTE(v34) = 0;
          sub_1000532A0();
          uint64_t v24 = v25;
          KeyedDecodingContainer.decode<A>(_:forKey:)();
          uint64_t v7 = v35;
          char v33 = 1;
          sub_1000532F4();
          KeyedDecodingContainer.decode<A>(_:forKey:)();
          (*(void (**)(char *, uint64_t))(v29 + 8))(v6, v24);
          swift_bridgeObjectRelease();
          (*(void (**)(char *, uint64_t))(v18 + 8))(v13, v10);
        }
        else
        {
          uint64_t v23 = v32;
          LOBYTE(v35) = 2;
          sub_1000531F8();
          KeyedDecodingContainer.nestedContainer<A>(keyedBy:forKey:)();
          (*(void (**)(char *, uint64_t))(v28 + 8))(v16, v27);
          swift_bridgeObjectRelease();
          (*(void (**)(char *, uint64_t))(v23 + 8))(v13, v10);
          uint64_t v7 = 1;
        }
      }
      else
      {
        uint64_t v22 = v32;
        LOBYTE(v35) = 0;
        sub_100053348();
        KeyedDecodingContainer.nestedContainer<A>(keyedBy:forKey:)();
        (*(void (**)(char *, uint64_t))(v26 + 8))(v9, v7);
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v22 + 8))(v13, v10);
        uint64_t v7 = 0;
      }
    }
    else
    {
      uint64_t v19 = type metadata accessor for DecodingError();
      swift_allocError();
      uint64_t v7 = v20;
      sub_1000082E0(&qword_10007D860);
      *(void *)uint64_t v7 = &type metadata for AnalyticsAction;
      KeyedDecodingContainer.codingPath.getter();
      DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
      (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v19 - 8) + 104))(v7, enum case for DecodingError.typeMismatch(_:), v19);
      swift_willThrow();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v32 + 8))(v13, v10);
    }
  }
  sub_100008540((uint64_t)v31);
  return v7;
}

unint64_t sub_1000531A4()
{
  unint64_t result = qword_10007D858;
  if (!qword_10007D858)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007D858);
  }
  return result;
}

unint64_t sub_1000531F8()
{
  unint64_t result = qword_10007D868;
  if (!qword_10007D868)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007D868);
  }
  return result;
}

unint64_t sub_10005324C()
{
  unint64_t result = qword_10007D870;
  if (!qword_10007D870)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007D870);
  }
  return result;
}

unint64_t sub_1000532A0()
{
  unint64_t result = qword_10007D878;
  if (!qword_10007D878)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007D878);
  }
  return result;
}

unint64_t sub_1000532F4()
{
  unint64_t result = qword_10007D880;
  if (!qword_10007D880)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007D880);
  }
  return result;
}

unint64_t sub_100053348()
{
  unint64_t result = qword_10007D888;
  if (!qword_10007D888)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007D888);
  }
  return result;
}

unint64_t sub_10005339C()
{
  unint64_t result = qword_10007D8B0;
  if (!qword_10007D8B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007D8B0);
  }
  return result;
}

unint64_t sub_1000533F0()
{
  unint64_t result = qword_10007D8B8;
  if (!qword_10007D8B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007D8B8);
  }
  return result;
}

unint64_t sub_100053444()
{
  unint64_t result = qword_10007D8E0;
  if (!qword_10007D8E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007D8E0);
  }
  return result;
}

unint64_t sub_100053498()
{
  unint64_t result = qword_10007D8E8;
  if (!qword_10007D8E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007D8E8);
  }
  return result;
}

uint64_t sub_1000534EC(uint64_t a1)
{
  return a1;
}

void *sub_100053518@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  uint64_t v5 = *(uint64_t **)(v3 + 16);
  uint64_t v7 = *v5;
  uint64_t v6 = v5[1];
  v13[0] = v7;
  v13[1] = v6;
  v12[2] = v13;
  unint64_t result = sub_100052348((void *(*)(uint64_t *__return_ptr, uint64_t, uint64_t))sub_100053584, (uint64_t)v12, a1, a2);
  *a3 = result;
  a3[1] = v9;
  a3[2] = v10;
  a3[3] = v11;
  return result;
}

uint64_t sub_100053584@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  return sub_10005246C(a1, a2);
}

unsigned char *storeEnumTagSinglePayload for AccessMode(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x100053670);
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

ValueMetadata *type metadata accessor for AccessMode()
{
  return &type metadata for AccessMode;
}

uint64_t getEnumTagSinglePayload for AccessCategory(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xEE) {
    goto LABEL_17;
  }
  if (a2 + 18 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 18) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 18;
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
      return (*a1 | (v4 << 8)) - 18;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 18;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0x13;
  int v8 = v6 - 19;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for AccessCategory(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 18 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 18) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xEE) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xED)
  {
    unsigned int v6 = ((a2 - 238) >> 8) + 1;
    *unint64_t result = a2 + 18;
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
        JUMPOUT(0x100053804);
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
          *unint64_t result = a2 + 18;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AccessCategory()
{
  return &type metadata for AccessCategory;
}

uint64_t sub_10005383C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unsigned __int8 a6)
{
  switch(a6 >> 6)
  {
    case 1:
    case 2:
    case 3:
      swift_bridgeObjectRetain();
      break;
    default:
      break;
  }

  return swift_bridgeObjectRetain();
}

uint64_t destroy for AnalyticsPolicyError(uint64_t a1)
{
  return sub_1000538C8(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(void *)(a1 + 24), *(void *)(a1 + 32), *(unsigned char *)(a1 + 40));
}

uint64_t sub_1000538C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unsigned __int8 a6)
{
  switch(a6 >> 6)
  {
    case 1:
    case 2:
    case 3:
      swift_bridgeObjectRelease();
      break;
    default:
      break;
  }

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for AnalyticsPolicyError(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  uint64_t v7 = *(void *)(a2 + 32);
  unsigned __int8 v8 = *(unsigned char *)(a2 + 40);
  sub_10005383C(*(void *)a2, v4, v5, v6, v7, v8);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  *(void *)(a1 + 32) = v7;
  *(unsigned char *)(a1 + 40) = v8;
  return a1;
}

uint64_t assignWithCopy for AnalyticsPolicyError(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  uint64_t v7 = *(void *)(a2 + 32);
  unsigned __int8 v8 = *(unsigned char *)(a2 + 40);
  sub_10005383C(*(void *)a2, v4, v5, v6, v7, v8);
  uint64_t v9 = *(void *)a1;
  uint64_t v10 = *(void *)(a1 + 8);
  uint64_t v11 = *(void *)(a1 + 16);
  uint64_t v12 = *(void *)(a1 + 24);
  uint64_t v13 = *(void *)(a1 + 32);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  *(void *)(a1 + 32) = v7;
  unsigned __int8 v14 = *(unsigned char *)(a1 + 40);
  *(unsigned char *)(a1 + 40) = v8;
  sub_1000538C8(v9, v10, v11, v12, v13, v14);
  return a1;
}

__n128 initializeWithTake for AnalyticsPolicyRule(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 25) = *(_OWORD *)(a2 + 25);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for AnalyticsPolicyError(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 32);
  char v4 = *(unsigned char *)(a2 + 40);
  uint64_t v5 = *(void *)a1;
  uint64_t v7 = *(void *)(a1 + 8);
  uint64_t v6 = *(void *)(a1 + 16);
  uint64_t v8 = *(void *)(a1 + 24);
  uint64_t v9 = *(void *)(a1 + 32);
  long long v10 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v10;
  *(void *)(a1 + 32) = v3;
  unsigned __int8 v11 = *(unsigned char *)(a1 + 40);
  *(unsigned char *)(a1 + 40) = v4;
  sub_1000538C8(v5, v7, v6, v8, v9, v11);
  return a1;
}

uint64_t getEnumTagSinglePayload for AnalyticsPolicyError(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7D && *(unsigned char *)(a1 + 41)) {
    return (*(_DWORD *)a1 + 125);
  }
  unsigned int v3 = ((*(unsigned __int8 *)(a1 + 40) >> 6) & 0xFFFFFF83 | (4 * ((*(unsigned __int8 *)(a1 + 40) >> 1) & 0x1F))) ^ 0x7F;
  if (v3 >= 0x7C) {
    unsigned int v3 = -1;
  }
  return v3 + 1;
}

uint64_t storeEnumTagSinglePayload for AnalyticsPolicyError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7C)
  {
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 40) = 0;
    *(void *)__n128 result = a2 - 125;
    if (a3 >= 0x7D) {
      *(unsigned char *)(result + 41) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7D) {
      *(unsigned char *)(result + 41) = 0;
    }
    if (a2)
    {
      *(void *)(result + 32) = 0;
      *(_OWORD *)__n128 result = 0u;
      *(_OWORD *)(result + 16) = 0u;
      *(unsigned char *)(result + 40) = 2 * (((-a2 >> 2) & 0x1F) - 32 * a2);
    }
  }
  return result;
}

uint64_t sub_100053B64(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 40) >> 6;
}

uint64_t sub_100053B70(uint64_t result)
{
  *(unsigned char *)(result + 40) &= 0x3Fu;
  return result;
}

uint64_t sub_100053B80(uint64_t result, char a2)
{
  *(unsigned char *)(result + 40) = *(unsigned char *)(result + 40) & 1 | (a2 << 6);
  return result;
}

ValueMetadata *type metadata accessor for AnalyticsPolicyError()
{
  return &type metadata for AnalyticsPolicyError;
}

uint64_t destroy for AnalyticsPolicyRule()
{
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for AnalyticsPolicyRule(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for AnalyticsPolicyRule(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  long long v4 = *(_OWORD *)(a2 + 24);
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  *(_OWORD *)(a1 + 24) = v4;
  return a1;
}

uint64_t assignWithTake for AnalyticsPolicyRule(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  return a1;
}

uint64_t getEnumTagSinglePayload for AnalyticsPolicyRule(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 41)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for AnalyticsPolicyRule(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 40) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 41) = 1;
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
    *(unsigned char *)(result + 41) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AnalyticsPolicyRule()
{
  return &type metadata for AnalyticsPolicyRule;
}

ValueMetadata *type metadata accessor for AnalyticsAction.CodingKeys()
{
  return &type metadata for AnalyticsAction.CodingKeys;
}

ValueMetadata *type metadata accessor for AnalyticsAction.SkipCodingKeys()
{
  return &type metadata for AnalyticsAction.SkipCodingKeys;
}

unsigned char *storeEnumTagSinglePayload for AnalyticsAction.ExpectCodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *__n128 result = a2 + 1;
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
        JUMPOUT(0x100053E98);
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
          *__n128 result = a2 + 1;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AnalyticsAction.ExpectCodingKeys()
{
  return &type metadata for AnalyticsAction.ExpectCodingKeys;
}

ValueMetadata *type metadata accessor for AnalyticsAction.ReportCodingKeys()
{
  return &type metadata for AnalyticsAction.ReportCodingKeys;
}

ValueMetadata *type metadata accessor for AccessCategorySet()
{
  return &type metadata for AccessCategorySet;
}

ValueMetadata *type metadata accessor for AccessModeSet()
{
  return &type metadata for AccessModeSet;
}

unint64_t sub_100053F04()
{
  unint64_t result = qword_10007D988;
  if (!qword_10007D988)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007D988);
  }
  return result;
}

unint64_t sub_100053F5C()
{
  unint64_t result = qword_10007D990;
  if (!qword_10007D990)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007D990);
  }
  return result;
}

unint64_t sub_100053FB4()
{
  unint64_t result = qword_10007D998;
  if (!qword_10007D998)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007D998);
  }
  return result;
}

unint64_t sub_10005400C()
{
  unint64_t result = qword_10007D9A0;
  if (!qword_10007D9A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007D9A0);
  }
  return result;
}

unint64_t sub_100054064()
{
  unint64_t result = qword_10007D9A8;
  if (!qword_10007D9A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007D9A8);
  }
  return result;
}

unint64_t sub_1000540BC()
{
  unint64_t result = qword_10007D9B0;
  if (!qword_10007D9B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007D9B0);
  }
  return result;
}

unint64_t sub_100054114()
{
  unint64_t result = qword_10007D9B8;
  if (!qword_10007D9B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007D9B8);
  }
  return result;
}

unint64_t sub_10005416C()
{
  unint64_t result = qword_10007D9C0;
  if (!qword_10007D9C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007D9C0);
  }
  return result;
}

unint64_t sub_1000541C4()
{
  unint64_t result = qword_10007D9C8;
  if (!qword_10007D9C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007D9C8);
  }
  return result;
}

unint64_t sub_10005421C()
{
  unint64_t result = qword_10007D9D0;
  if (!qword_10007D9D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007D9D0);
  }
  return result;
}

unint64_t sub_100054274()
{
  unint64_t result = qword_10007D9D8;
  if (!qword_10007D9D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007D9D8);
  }
  return result;
}

unint64_t sub_1000542CC()
{
  unint64_t result = qword_10007D9E0;
  if (!qword_10007D9E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007D9E0);
  }
  return result;
}

unint64_t sub_100054324()
{
  unint64_t result = qword_10007D9E8;
  if (!qword_10007D9E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007D9E8);
  }
  return result;
}

unint64_t sub_10005437C()
{
  unint64_t result = qword_10007D9F0;
  if (!qword_10007D9F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007D9F0);
  }
  return result;
}

unint64_t sub_1000543D4()
{
  unint64_t result = qword_10007D9F8;
  if (!qword_10007D9F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007D9F8);
  }
  return result;
}

unint64_t sub_10005442C()
{
  unint64_t result = qword_10007DA00;
  if (!qword_10007DA00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007DA00);
  }
  return result;
}

unint64_t sub_100054484()
{
  unint64_t result = qword_10007DA08;
  if (!qword_10007DA08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007DA08);
  }
  return result;
}

unint64_t sub_1000544DC()
{
  unint64_t result = qword_10007DA10;
  if (!qword_10007DA10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007DA10);
  }
  return result;
}

uint64_t sub_100054530(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 1752457584 && a2 == 0xE400000000000000;
  if (v2 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x737365636F7270 && a2 == 0xE700000000000000 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x6E6F69746361 && a2 == 0xE600000000000000)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    char v6 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if (v6) {
      return 2;
    }
    else {
      return 3;
    }
  }
}

uint64_t sub_100054670@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = sub_1000082E0(&qword_10007DA18);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000B090(a1, a1[3]);
  sub_10005495C();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v2) {
    return sub_100008540((uint64_t)a1);
  }
  LOBYTE(v21) = 0;
  uint64_t v9 = KeyedDecodingContainer.decode(_:forKey:)();
  uint64_t v11 = v10;
  uint64_t v20 = v9;
  sub_1000082E0(&qword_10007DA28);
  char v24 = 1;
  sub_100054AAC(&qword_10007DA30);
  swift_bridgeObjectRetain();
  KeyedDecodingContainer.decode<A>(_:forKey:)();
  uint64_t v12 = v21;
  char v24 = 2;
  sub_1000549B0();
  uint64_t v19 = v12;
  swift_bridgeObjectRetain();
  KeyedDecodingContainer.decode<A>(_:forKey:)();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  uint64_t v13 = v21;
  uint64_t v14 = v22;
  char v15 = v23;
  sub_100008540((uint64_t)a1);
  uint64_t v16 = v19;
  swift_bridgeObjectRelease();
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)a2 = v20;
  *(void *)(a2 + 8) = v11;
  *(void *)(a2 + 16) = v16;
  *(void *)(a2 + 24) = v13;
  *(void *)(a2 + 32) = v14;
  *(unsigned char *)(a2 + 40) = v15;
  return result;
}

unint64_t sub_10005495C()
{
  unint64_t result = qword_10007DA20;
  if (!qword_10007DA20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007DA20);
  }
  return result;
}

unint64_t sub_1000549B0()
{
  unint64_t result = qword_10007DA38;
  if (!qword_10007DA38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007DA38);
  }
  return result;
}

unint64_t sub_100054A04()
{
  unint64_t result = qword_10007DA40;
  if (!qword_10007DA40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007DA40);
  }
  return result;
}

unint64_t sub_100054A58()
{
  unint64_t result = qword_10007DA48;
  if (!qword_10007DA48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007DA48);
  }
  return result;
}

uint64_t sub_100054AAC(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_10000B1E0(&qword_10007DA28);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100054B10(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  *(unsigned char *)(a2 + 16) = *((unsigned char *)a1 + 16);
  *(_OWORD *)a2 = v2;
  return a2;
}

unint64_t sub_100054B28()
{
  unint64_t result = qword_10007DA60;
  if (!qword_10007DA60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007DA60);
  }
  return result;
}

unsigned char *_s14applekeystored15AnalyticsActionO10CodingKeysOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x100054C48);
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

ValueMetadata *type metadata accessor for AnalyticsPolicyRule.CodingKeys()
{
  return &type metadata for AnalyticsPolicyRule.CodingKeys;
}

unint64_t sub_100054C84()
{
  unint64_t result = qword_10007DA68;
  if (!qword_10007DA68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007DA68);
  }
  return result;
}

unint64_t sub_100054CDC()
{
  unint64_t result = qword_10007DA70;
  if (!qword_10007DA70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007DA70);
  }
  return result;
}

unint64_t sub_100054D34()
{
  unint64_t result = qword_10007DA78;
  if (!qword_10007DA78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007DA78);
  }
  return result;
}

uint64_t URLRequest.httpMethod.setter()
{
  return URLRequest.httpMethod.setter();
}

uint64_t URLRequest.init(url:cachePolicy:timeoutInterval:)()
{
  return URLRequest.init(url:cachePolicy:timeoutInterval:)();
}

uint64_t URLRequest.httpBody.setter()
{
  return URLRequest.httpBody.setter();
}

Swift::Void __swiftcall URLRequest.setValue(_:forHTTPHeaderField:)(Swift::String_optional _, Swift::String forHTTPHeaderField)
{
}

uint64_t type metadata accessor for URLRequest()
{
  return type metadata accessor for URLRequest();
}

uint64_t dispatch thunk of JSONDecoder.decode<A>(_:from:)()
{
  return dispatch thunk of JSONDecoder.decode<A>(_:from:)();
}

uint64_t JSONDecoder.init()()
{
  return JSONDecoder.init()();
}

uint64_t type metadata accessor for JSONDecoder()
{
  return type metadata accessor for JSONDecoder();
}

uint64_t static JSONEncoder.OutputFormatting.sortedKeys.getter()
{
  return static JSONEncoder.OutputFormatting.sortedKeys.getter();
}

uint64_t type metadata accessor for JSONEncoder.OutputFormatting()
{
  return type metadata accessor for JSONEncoder.OutputFormatting();
}

uint64_t dispatch thunk of JSONEncoder.outputFormatting.setter()
{
  return dispatch thunk of JSONEncoder.outputFormatting.setter();
}

uint64_t dispatch thunk of JSONEncoder.encode<A>(_:)()
{
  return dispatch thunk of JSONEncoder.encode<A>(_:)();
}

uint64_t JSONEncoder.init()()
{
  return JSONEncoder.init()();
}

uint64_t type metadata accessor for JSONEncoder()
{
  return type metadata accessor for JSONEncoder();
}

uint64_t __DataStorage.init(bytes:length:copy:deallocator:offset:)()
{
  return __DataStorage.init(bytes:length:copy:deallocator:offset:)();
}

uint64_t __DataStorage.init(bytes:length:)()
{
  return __DataStorage.init(bytes:length:)();
}

uint64_t __DataStorage._bytes.getter()
{
  return __DataStorage._bytes.getter();
}

uint64_t __DataStorage.init(length:)()
{
  return __DataStorage.init(length:)();
}

uint64_t __DataStorage._length.getter()
{
  return __DataStorage._length.getter();
}

uint64_t __DataStorage._offset.getter()
{
  return __DataStorage._offset.getter();
}

uint64_t type metadata accessor for __DataStorage()
{
  return type metadata accessor for __DataStorage();
}

uint64_t dispatch thunk of ContiguousBytes.withUnsafeBytes<A>(_:)()
{
  return dispatch thunk of ContiguousBytes.withUnsafeBytes<A>(_:)();
}

uint64_t AsyncLineSequence.makeAsyncIterator()()
{
  return AsyncLineSequence.makeAsyncIterator()();
}

uint64_t URLResourceValues.isExcludedFromBackup.setter()
{
  return URLResourceValues.isExcludedFromBackup.setter();
}

uint64_t URLResourceValues.init()()
{
  return URLResourceValues.init()();
}

uint64_t type metadata accessor for URLResourceValues()
{
  return type metadata accessor for URLResourceValues();
}

uint64_t static PredicateExpressions.build_Equal<A, B>(lhs:rhs:)()
{
  return static PredicateExpressions.build_Equal<A, B>(lhs:rhs:)();
}

uint64_t static PredicateExpressions.build_KeyPath<A, B>(root:keyPath:)()
{
  return static PredicateExpressions.build_KeyPath<A, B>(root:keyPath:)();
}

uint64_t static PredicateExpressions.build_Conjunction<A, B>(lhs:rhs:)()
{
  return static PredicateExpressions.build_Conjunction<A, B>(lhs:rhs:)();
}

uint64_t static PredicateExpressions.build_Arg<A>(_:)()
{
  return static PredicateExpressions.build_Arg<A>(_:)();
}

{
  return static PredicateExpressions.build_Arg<A>(_:)();
}

uint64_t _convertNSErrorToError(_:)()
{
  return _convertNSErrorToError(_:)();
}

uint64_t URL.absoluteString.getter()
{
  return URL.absoluteString.getter();
}

uint64_t URL.init(fileURLWithPath:)()
{
  return URL.init(fileURLWithPath:)();
}

uint64_t URL.setResourceValues(_:)()
{
  return URL.setResourceValues(_:)();
}

void __swiftcall URL._bridgeToObjectiveC()(NSURL *__return_ptr retstr)
{
}

uint64_t URL.appendingPathComponent(_:isDirectory:)()
{
  return URL.appendingPathComponent(_:isDirectory:)();
}

uint64_t URL.appendingPathComponent(_:)()
{
  return URL.appendingPathComponent(_:)();
}

uint64_t static URL._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static URL._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t URL.lines.getter()
{
  return URL.lines.getter();
}

uint64_t URL.init(string:)()
{
  return URL.init(string:)();
}

uint64_t type metadata accessor for URL()
{
  return type metadata accessor for URL();
}

Swift::Void __swiftcall Data.LargeSlice.ensureUniqueReference()()
{
}

uint64_t Data.init(base64Encoded:options:)()
{
  return Data.init(base64Encoded:options:)();
}

uint64_t type metadata accessor for Data.RangeReference()
{
  return type metadata accessor for Data.RangeReference();
}

uint64_t Data._Representation.replaceSubrange(_:with:count:)()
{
  return Data._Representation.replaceSubrange(_:with:count:)();
}

Swift::Void __swiftcall Data._Representation.reserveCapacity(_:)(Swift::Int a1)
{
}

uint64_t Data._Representation.append(contentsOf:)()
{
  return Data._Representation.append(contentsOf:)();
}

NSData __swiftcall Data._bridgeToObjectiveC()()
{
  return (NSData)Data._bridgeToObjectiveC()();
}

uint64_t Data.append(_:)()
{
  return Data.append(_:)();
}

uint64_t Date.init(timeIntervalSinceNow:)()
{
  return Date.init(timeIntervalSinceNow:)();
}

uint64_t Date.timeIntervalSinceNow.getter()
{
  return Date.timeIntervalSinceNow.getter();
}

uint64_t Date.timeIntervalSince1970.getter()
{
  return Date.timeIntervalSince1970.getter();
}

uint64_t Date.init()()
{
  return Date.init()();
}

uint64_t type metadata accessor for Date()
{
  return type metadata accessor for Date();
}

uint64_t Predicate.init(_:)()
{
  return Predicate.init(_:)();
}

uint64_t ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)()
{
  return ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)();
}

uint64_t ObservationRegistrar.access<A, B>(_:keyPath:)()
{
  return ObservationRegistrar.access<A, B>(_:keyPath:)();
}

uint64_t ObservationRegistrar.init()()
{
  return ObservationRegistrar.init()();
}

uint64_t type metadata accessor for ObservationRegistrar()
{
  return type metadata accessor for ObservationRegistrar();
}

uint64_t isFeatureEnabled(_:)()
{
  return isFeatureEnabled(_:)();
}

uint64_t static _CFObject.== infix(_:_:)()
{
  return static _CFObject.== infix(_:_:)();
}

uint64_t _CFObject.hash(into:)()
{
  return _CFObject.hash(into:)();
}

uint64_t _CFObject.hashValue.getter()
{
  return _CFObject.hashValue.getter();
}

uint64_t type metadata accessor for ArgumentHelp()
{
  return type metadata accessor for ArgumentHelp();
}

uint64_t static ParsableCommand._commandName.getter()
{
  return static ParsableCommand._commandName.getter();
}

uint64_t static ParsableCommand.configuration.getter()
{
  return static ParsableCommand.configuration.getter();
}

uint64_t static ParsableCommand.main()()
{
  return static ParsableCommand.main()();
}

uint64_t static NameSpecification.customLong(_:withSingleDash:)()
{
  return static NameSpecification.customLong(_:withSingleDash:)();
}

uint64_t type metadata accessor for NameSpecification()
{
  return type metadata accessor for NameSpecification();
}

uint64_t static ParsableArguments._errorLabel.getter()
{
  return static ParsableArguments._errorLabel.getter();
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> ParsableArguments.validate()()
{
}

uint64_t Flag.wrappedValue.getter()
{
  return Flag.wrappedValue.getter();
}

uint64_t Flag<A>.init(wrappedValue:name:help:)()
{
  return Flag<A>.init(wrappedValue:name:help:)();
}

uint64_t Logger.logObject.getter()
{
  return Logger.logObject.getter();
}

uint64_t Logger.init(subsystem:category:)()
{
  return Logger.init(subsystem:category:)();
}

uint64_t type metadata accessor for Logger()
{
  return type metadata accessor for Logger();
}

uint64_t FilePath.components.modify()
{
  return FilePath.components.modify();
}

uint64_t FilePath.components.getter()
{
  return FilePath.components.getter();
}

uint64_t FilePath.ComponentView.startIndex.getter()
{
  return FilePath.ComponentView.startIndex.getter();
}

uint64_t type metadata accessor for FilePath.ComponentView.Index()
{
  return type metadata accessor for FilePath.ComponentView.Index();
}

uint64_t type metadata accessor for FilePath.ComponentView()
{
  return type metadata accessor for FilePath.ComponentView();
}

uint64_t FilePath.lastComponent.getter()
{
  return FilePath.lastComponent.getter();
}

uint64_t FilePath.removingLastComponent()()
{
  return FilePath.removingLastComponent()();
}

uint64_t FilePath.string.getter()
{
  return FilePath.string.getter();
}

uint64_t FilePath.Component.string.getter()
{
  return FilePath.Component.string.getter();
}

uint64_t type metadata accessor for FilePath.Component()
{
  return type metadata accessor for FilePath.Component();
}

uint64_t FilePath.Component.init(_:)()
{
  return FilePath.Component.init(_:)();
}

uint64_t type metadata accessor for FilePath()
{
  return type metadata accessor for FilePath();
}

uint64_t FilePath.init(_:)()
{
  return FilePath.init(_:)();
}

uint64_t type metadata accessor for DispatchWorkItemFlags()
{
  return type metadata accessor for DispatchWorkItemFlags();
}

uint64_t static DispatchQoS.unspecified.getter()
{
  return static DispatchQoS.unspecified.getter();
}

uint64_t type metadata accessor for DispatchQoS()
{
  return type metadata accessor for DispatchQoS();
}

uint64_t dispatch thunk of BackingData.setValue<A>(forKey:to:)()
{
  return dispatch thunk of BackingData.setValue<A>(forKey:to:)();
}

uint64_t dispatch thunk of ModelContext.save()()
{
  return dispatch thunk of ModelContext.save()();
}

uint64_t dispatch thunk of ModelContext.fetch<A>(_:)()
{
  return dispatch thunk of ModelContext.fetch<A>(_:)();
}

uint64_t dispatch thunk of ModelContext.delete<A>(_:)()
{
  return dispatch thunk of ModelContext.delete<A>(_:)();
}

uint64_t dispatch thunk of ModelContext.insert<A>(_:)()
{
  return dispatch thunk of ModelContext.insert<A>(_:)();
}

uint64_t type metadata accessor for ModelContext()
{
  return type metadata accessor for ModelContext();
}

uint64_t ModelContext.init(_:)()
{
  return ModelContext.init(_:)();
}

uint64_t type metadata accessor for MigrationStage()
{
  return type metadata accessor for MigrationStage();
}

uint64_t ModelContainer.__allocating_init(for:migrationPlan:configurations:)()
{
  return ModelContainer.__allocating_init(for:migrationPlan:configurations:)();
}

uint64_t type metadata accessor for ModelContainer()
{
  return type metadata accessor for ModelContainer();
}

uint64_t FetchDescriptor.fetchLimit.setter()
{
  return FetchDescriptor.fetchLimit.setter();
}

uint64_t FetchDescriptor.init(predicate:sortBy:)()
{
  return FetchDescriptor.init(predicate:sortBy:)();
}

uint64_t static PersistentModel.createBackingData<A>()()
{
  return static PersistentModel.createBackingData<A>()();
}

uint64_t static PersistentModel.== infix(_:_:)()
{
  return static PersistentModel.== infix(_:_:)();
}

uint64_t PersistentModel.id.getter()
{
  return PersistentModel.id.getter();
}

uint64_t PersistentModel.hash(into:)()
{
  return PersistentModel.hash(into:)();
}

uint64_t PersistentModel.getValue<A>(forKey:)()
{
  return PersistentModel.getValue<A>(forKey:)();
}

uint64_t PersistentModel.setValue<A>(forKey:to:)()
{
  return PersistentModel.setValue<A>(forKey:to:)();
}

uint64_t static ModelConfiguration.CloudKitDatabase.automatic.getter()
{
  return static ModelConfiguration.CloudKitDatabase.automatic.getter();
}

uint64_t type metadata accessor for ModelConfiguration.CloudKitDatabase()
{
  return type metadata accessor for ModelConfiguration.CloudKitDatabase();
}

uint64_t type metadata accessor for ModelConfiguration()
{
  return type metadata accessor for ModelConfiguration();
}

uint64_t ModelConfiguration.init(_:schema:url:allowsSave:cloudKitDatabase:)()
{
  return ModelConfiguration.init(_:schema:url:allowsSave:cloudKitDatabase:)();
}

uint64_t Schema.PropertyMetadata.init(name:keypath:defaultValue:metadata:)()
{
  return Schema.PropertyMetadata.init(name:keypath:defaultValue:metadata:)();
}

uint64_t type metadata accessor for Schema.PropertyMetadata()
{
  return type metadata accessor for Schema.PropertyMetadata();
}

uint64_t type metadata accessor for Schema.Version()
{
  return type metadata accessor for Schema.Version();
}

uint64_t Schema.Version.init(_:_:_:)()
{
  return Schema.Version.init(_:_:_:)();
}

uint64_t static Schema.Attribute.Option.unique.getter()
{
  return static Schema.Attribute.Option.unique.getter();
}

uint64_t type metadata accessor for Schema.Attribute.Option()
{
  return type metadata accessor for Schema.Attribute.Option();
}

uint64_t type metadata accessor for Schema.Attribute()
{
  return type metadata accessor for Schema.Attribute();
}

uint64_t Schema.Attribute.init(_:originalName:hashModifier:)()
{
  return Schema.Attribute.init(_:originalName:hashModifier:)();
}

uint64_t static Dictionary._conditionallyBridgeFromObjectiveC(_:result:)()
{
  return static Dictionary._conditionallyBridgeFromObjectiveC(_:result:)();
}

uint64_t dispatch thunk of BidirectionalCollection.formIndex(before:)()
{
  return dispatch thunk of BidirectionalCollection.formIndex(before:)();
}

uint64_t dispatch thunk of static Comparable.<= infix(_:_:)()
{
  return dispatch thunk of static Comparable.<= infix(_:_:)();
}

uint64_t dispatch thunk of static Equatable.== infix(_:_:)()
{
  return dispatch thunk of static Equatable.== infix(_:_:)();
}

NSString __swiftcall String._bridgeToObjectiveC()()
{
  return (NSString)String._bridgeToObjectiveC()();
}

uint64_t static String._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t String.data(using:allowLossyConversion:)()
{
  return String.data(using:allowLossyConversion:)();
}

uint64_t String.init(data:encoding:)()
{
  return String.init(data:encoding:)();
}

uint64_t String.init<A>(bytes:encoding:)()
{
  return String.init<A>(bytes:encoding:)();
}

uint64_t static String.Encoding.utf8.getter()
{
  return static String.Encoding.utf8.getter();
}

uint64_t type metadata accessor for String.Encoding()
{
  return type metadata accessor for String.Encoding();
}

uint64_t String.init(validatingUTF8:)()
{
  return String.init(validatingUTF8:)();
}

uint64_t String.hash(into:)()
{
  return String.hash(into:)();
}

Swift::Void __swiftcall String.append(_:)(Swift::String a1)
{
}

uint64_t String.init(cString:)()
{
  return String.init(cString:)();
}

Swift::Int __swiftcall String.UTF8View._foreignCount()()
{
  return String.UTF8View._foreignCount()();
}

uint64_t String.UTF8View._foreignIndex(after:)()
{
  return String.UTF8View._foreignIndex(after:)();
}

uint64_t String.UTF8View._foreignIndex(_:offsetBy:)()
{
  return String.UTF8View._foreignIndex(_:offsetBy:)();
}

uint64_t String.UTF8View._foreignSubscript(position:)()
{
  return String.UTF8View._foreignSubscript(position:)();
}

uint64_t String.UTF16View.index(_:offsetBy:)()
{
  return String.UTF16View.index(_:offsetBy:)();
}

uint64_t String.init<A>(_:radix:uppercase:)()
{
  return String.init<A>(_:radix:uppercase:)();
}

uint64_t String.init<A>(_:)()
{
  return String.init<A>(_:)();
}

uint64_t dispatch thunk of Sequence.makeIterator()()
{
  return dispatch thunk of Sequence.makeIterator()();
}

uint64_t RawRepresentable<>.encode(to:)()
{
  return RawRepresentable<>.encode(to:)();
}

{
  return RawRepresentable<>.encode(to:)();
}

{
  return RawRepresentable<>.encode(to:)();
}

uint64_t RawRepresentable<>.init(from:)()
{
  return RawRepresentable<>.init(from:)();
}

{
  return RawRepresentable<>.init(from:)();
}

{
  return RawRepresentable<>.init(from:)();
}

uint64_t dispatch thunk of Actor.unownedExecutor.getter()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t TaskPriority.rawValue.getter()
{
  return TaskPriority.rawValue.getter();
}

uint64_t type metadata accessor for TaskPriority()
{
  return type metadata accessor for TaskPriority();
}

uint64_t AsyncStream.Continuation.yield(_:)()
{
  return AsyncStream.Continuation.yield(_:)();
}

uint64_t AsyncStream.makeAsyncIterator()()
{
  return AsyncStream.makeAsyncIterator()();
}

uint64_t AsyncStream.init(_:bufferingPolicy:_:)()
{
  return AsyncStream.init(_:bufferingPolicy:_:)();
}

uint64_t dispatch thunk of Collection.startIndex.getter()
{
  return dispatch thunk of Collection.startIndex.getter();
}

uint64_t dispatch thunk of Collection.index(after:)()
{
  return dispatch thunk of Collection.index(after:)();
}

uint64_t dispatch thunk of Collection.endIndex.getter()
{
  return dispatch thunk of Collection.endIndex.getter();
}

uint64_t dispatch thunk of Collection.formIndex(after:)()
{
  return dispatch thunk of Collection.formIndex(after:)();
}

uint64_t dispatch thunk of Collection.subscript.read()
{
  return dispatch thunk of Collection.subscript.read();
}

uint64_t dispatch thunk of RangeReplaceableCollection.replaceSubrange<A>(_:with:)()
{
  return dispatch thunk of RangeReplaceableCollection.replaceSubrange<A>(_:with:)();
}

uint64_t static os_log_type_t.info.getter()
{
  return static os_log_type_t.info.getter();
}

uint64_t static os_log_type_t.debug.getter()
{
  return static os_log_type_t.debug.getter();
}

uint64_t static os_log_type_t.error.getter()
{
  return static os_log_type_t.error.getter();
}

uint64_t static os_log_type_t.default.getter()
{
  return static os_log_type_t.default.getter();
}

uint64_t type metadata accessor for OS_dispatch_queue.Attributes()
{
  return type metadata accessor for OS_dispatch_queue.Attributes();
}

uint64_t type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency()
{
  return type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
}

uint64_t static OS_dispatch_queue.main.getter()
{
  return static OS_dispatch_queue.main.getter();
}

uint64_t OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)()
{
  return OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
}

uint64_t static OS_dispatch_source.makeMachReceiveSource(port:queue:)()
{
  return static OS_dispatch_source.makeMachReceiveSource(port:queue:)();
}

uint64_t OS_dispatch_source.setEventHandler(qos:flags:handler:)()
{
  return OS_dispatch_source.setEventHandler(qos:flags:handler:)();
}

Swift::Void __swiftcall OS_dispatch_source.activate()()
{
}

uint64_t UnsafeMutableRawBufferPointer.copyMemory(from:)()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t UnsafeMutableRawBufferPointer.subscript.setter()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t dispatch thunk of SetAlgebra.init<A>(_:)()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
}

uint64_t _HashTable.nextHole(atOrAfter:)()
{
  return _HashTable.nextHole(atOrAfter:)();
}

Swift::Void __swiftcall _StringGuts.grow(_:)(Swift::Int a1)
{
}

uint64_t _StringGuts.copyUTF8(into:)()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t specialized _ArrayBuffer._getElementSlowPath(_:)()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t DecodingError.Context.init(codingPath:debugDescription:underlyingError:)()
{
  return DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
}

uint64_t type metadata accessor for DecodingError()
{
  return type metadata accessor for DecodingError();
}

uint64_t _StringObject.sharedUTF8.getter()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t type metadata accessor for ContinuousClock.Instant()
{
  return type metadata accessor for ContinuousClock.Instant();
}

uint64_t ContinuousClock.init()()
{
  return ContinuousClock.init()();
}

uint64_t type metadata accessor for ContinuousClock()
{
  return type metadata accessor for ContinuousClock();
}

uint64_t dispatch thunk of InstantProtocol.advanced(by:)()
{
  return dispatch thunk of InstantProtocol.advanced(by:)();
}

uint64_t TextOutputStream._writeASCII(_:)()
{
  return TextOutputStream._writeASCII(_:)();
}

Swift::Void __swiftcall TextOutputStream._lock()()
{
}

Swift::Void __swiftcall TextOutputStream._unlock()()
{
}

uint64_t __CocoaDictionary.lookup(_:)()
{
  return __CocoaDictionary.lookup(_:)();
}

uint64_t _assertionFailure(_:_:file:line:flags:)()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t _CocoaArrayWrapper.endIndex.getter()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t static _DictionaryStorage.copy(original:)()
{
  return static _DictionaryStorage.copy(original:)();
}

uint64_t static _DictionaryStorage.resize(original:capacity:move:)()
{
  return static _DictionaryStorage.resize(original:capacity:move:)();
}

uint64_t static _DictionaryStorage.allocate(capacity:)()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t _fatalErrorMessage(_:_:file:line:flags:)()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

Swift::Int __swiftcall _findStringSwitchCase(cases:string:)(Swift::OpaquePointer cases, Swift::String string)
{
  return _findStringSwitchCase(cases:string:)(cases._rawValue, string._countAndFlagsBits, string._object);
}

uint64_t KeyedDecodingContainer.nestedContainer<A>(keyedBy:forKey:)()
{
  return KeyedDecodingContainer.nestedContainer<A>(keyedBy:forKey:)();
}

uint64_t KeyedDecodingContainer.codingPath.getter()
{
  return KeyedDecodingContainer.codingPath.getter();
}

uint64_t KeyedDecodingContainer.decodeIfPresent(_:forKey:)()
{
  return KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
}

{
  return KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
}

{
  return KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
}

{
  return KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
}

uint64_t KeyedDecodingContainer.decode(_:forKey:)()
{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

uint64_t KeyedDecodingContainer.decode<A>(_:forKey:)()
{
  return KeyedDecodingContainer.decode<A>(_:forKey:)();
}

uint64_t KeyedDecodingContainer.allKeys.getter()
{
  return KeyedDecodingContainer.allKeys.getter();
}

uint64_t type metadata accessor for KeyedDecodingContainer()
{
  return type metadata accessor for KeyedDecodingContainer();
}

uint64_t KeyedEncodingContainer.nestedContainer<A>(keyedBy:forKey:)()
{
  return KeyedEncodingContainer.nestedContainer<A>(keyedBy:forKey:)();
}

uint64_t KeyedEncodingContainer.encodeIfPresent(_:forKey:)()
{
  return KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
}

{
  return KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
}

{
  return KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
}

{
  return KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
}

uint64_t KeyedEncodingContainer.encode(_:forKey:)()
{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

uint64_t KeyedEncodingContainer.encode<A>(_:forKey:)()
{
  return KeyedEncodingContainer.encode<A>(_:forKey:)();
}

uint64_t type metadata accessor for KeyedEncodingContainer()
{
  return type metadata accessor for KeyedEncodingContainer();
}

uint64_t dispatch thunk of CustomStringConvertible.description.getter()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t _findStringSwitchCaseWithCache(cases:string:cache:)()
{
  return _findStringSwitchCaseWithCache(cases:string:cache:)();
}

uint64_t KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)()
{
  return KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t dispatch thunk of Clock.now.getter()
{
  return dispatch thunk of Clock.now.getter();
}

uint64_t Error._getEmbeddedNSError()()
{
  return Error._getEmbeddedNSError()();
}

uint64_t Error._code.getter()
{
  return Error._code.getter();
}

uint64_t Error._domain.getter()
{
  return Error._domain.getter();
}

uint64_t Error._userInfo.getter()
{
  return Error._userInfo.getter();
}

uint64_t print<A>(_:separator:terminator:to:)()
{
  return print<A>(_:separator:terminator:to:)();
}

uint64_t Hasher.init(_seed:)()
{
  return Hasher.init(_seed:)();
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt a1)
{
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt32 a1)
{
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt64 a1)
{
}

Swift::Int __swiftcall Hasher._finalize()()
{
  return Hasher._finalize()();
}

uint64_t UInt32.init(truncating:)()
{
  return UInt32.init(truncating:)();
}

uint64_t UInt64.init(truncating:)()
{
  return UInt64.init(truncating:)();
}

NSNumber __swiftcall UInt64._bridgeToObjectiveC()()
{
  return (NSNumber)UInt64._bridgeToObjectiveC()();
}

uint64_t dispatch thunk of Decoder.container<A>(keyedBy:)()
{
  return dispatch thunk of Decoder.container<A>(keyedBy:)();
}

uint64_t dispatch thunk of Encoder.container<A>(keyedBy:)()
{
  return dispatch thunk of Encoder.container<A>(keyedBy:)();
}

uint64_t Duration.components.getter()
{
  return Duration.components.getter();
}

uint64_t static Duration.< infix(_:_:)()
{
  return static Duration.< infix(_:_:)();
}

uint64_t AKSEventsRegister()
{
  return _AKSEventsRegister();
}

void CFRunLoopRun(void)
{
}

kern_return_t IOConnectCallScalarMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, uint64_t *output, uint32_t *outputCnt)
{
  return _IOConnectCallScalarMethod(connection, selector, input, inputCnt, output, outputCnt);
}

kern_return_t IOConnectCallStructMethod(mach_port_t connection, uint32_t selector, const void *inputStruct, size_t inputStructCnt, void *outputStruct, size_t *outputStructCnt)
{
  return _IOConnectCallStructMethod(connection, selector, inputStruct, inputStructCnt, outputStruct, outputStructCnt);
}

kern_return_t IOConnectMapMemory64(io_connect_t connect, uint32_t memoryType, task_port_t intoTask, mach_vm_address_t *atAddress, mach_vm_size_t *ofSize, IOOptionBits options)
{
  return _IOConnectMapMemory64(connect, memoryType, intoTask, atAddress, ofSize, options);
}

kern_return_t IOConnectSetNotificationPort(io_connect_t connect, uint32_t type, mach_port_t port, uintptr_t reference)
{
  return _IOConnectSetNotificationPort(connect, type, port, reference);
}

mach_port_t IODataQueueAllocateNotificationPort(void)
{
  return _IODataQueueAllocateNotificationPort();
}

IOReturn IODataQueueDequeue(IODataQueueMemory *dataQueue, void *data, uint32_t *dataSize)
{
  return _IODataQueueDequeue(dataQueue, data, dataSize);
}

IODataQueueEntry *__cdecl IODataQueuePeek(IODataQueueMemory *dataQueue)
{
  return _IODataQueuePeek(dataQueue);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return _IOServiceGetMatchingService(mainPort, matching);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return _IOServiceMatching(name);
}

kern_return_t IOServiceOpen(io_service_t service, task_port_t owningTask, uint32_t type, io_connect_t *connect)
{
  return _IOServiceOpen(service, owningTask, type, connect);
}

uint64_t MGCopyAnswerWithError()
{
  return _MGCopyAnswerWithError();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_release(const void *aBlock)
{
}

{
}

{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return __swift_stdlib_bridgeErrorToNSError();
}

uint64_t aks_get_internal_state()
{
  return _aks_get_internal_state();
}

uint64_t aks_get_lock_state()
{
  return _aks_get_lock_state();
}

void bzero(void *a1, size_t a2)
{
}

void *__cdecl calloc(size_t __count, size_t __size)
{
  return _calloc(__count, __size);
}

__uint64_t clock_gettime_nsec_np(clockid_t __clock_id)
{
  return _clock_gettime_nsec_np(__clock_id);
}

uint64_t container_get_identifier()
{
  return _container_get_identifier();
}

uint64_t container_get_path()
{
  return _container_get_path();
}

uint64_t container_query_create()
{
  return _container_query_create();
}

uint64_t container_query_free()
{
  return _container_query_free();
}

uint64_t container_query_iterate_results_sync()
{
  return _container_query_iterate_results_sync();
}

uint64_t container_query_operation_set_flags()
{
  return _container_query_operation_set_flags();
}

uint64_t container_query_set_class()
{
  return _container_query_set_class();
}

uint64_t container_query_set_include_other_owners()
{
  return _container_query_set_include_other_owners();
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

void exit(int a1)
{
}

void free(void *a1)
{
}

char *__cdecl mach_error_string(mach_error_t error_value)
{
  return _mach_error_string(error_value);
}

mach_msg_return_t mach_msg(mach_msg_header_t *msg, mach_msg_option_t option, mach_msg_size_t send_size, mach_msg_size_t rcv_size, mach_port_name_t rcv_name, mach_msg_timeout_t timeout, mach_port_name_t notify)
{
  return _mach_msg(msg, option, send_size, rcv_size, rcv_name, timeout, notify);
}

void *__cdecl malloc(size_t __size)
{
  return _malloc(__size);
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

uint64_t swift_deallocClassInstance()
{
  return _swift_deallocClassInstance();
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

uint64_t swift_dynamicCastObjCClass()
{
  return _swift_dynamicCastObjCClass();
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

uint64_t swift_getGenericMetadata()
{
  return _swift_getGenericMetadata();
}

uint64_t swift_getKeyPath()
{
  return _swift_getKeyPath();
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

uint64_t swift_initStackObject()
{
  return _swift_initStackObject();
}

uint64_t swift_initStructMetadata()
{
  return _swift_initStructMetadata();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return _swift_isEscapingClosureAtFileLocation();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return _swift_isUniquelyReferenced_nonNull_native();
}

uint64_t swift_once()
{
  return _swift_once();
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

uint64_t swift_stdlib_random()
{
  return _swift_stdlib_random();
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

uint64_t swift_updateClassMetadata2()
{
  return _swift_updateClassMetadata2();
}

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}

uint64_t swift_willThrowTypedImpl()
{
  return _swift_willThrowTypedImpl();
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
}