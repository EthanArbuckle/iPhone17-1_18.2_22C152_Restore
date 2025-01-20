uint64_t ByteBuffer.writeAvroUnion(_:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  BOOL v5;
  uint64_t result;
  unsigned char __dst[72];

  v3 = sub_25BE6DEC4((2 * *(void *)(a1 + 80)) ^ (*(uint64_t *)(a1 + 80) >> 63));
  ByteBuffer.writeBytes(_:)((Swift::OpaquePointer)v3);
  OUTLINED_FUNCTION_165_0();
  memcpy(__dst, (const void *)(a1 + 8), 0x41uLL);
  v4 = ByteBuffer.writeAvroValue(_:)(__dst);
  v5 = __OFADD__(v1, v4);
  result = v1 + v4;
  if (v5) {
    __break(1u);
  }
  return result;
}

Swift::Int sub_25BE6DB34(uint64_t a1)
{
  uint64_t v1 = sub_25BE6DEC4((2 * a1) ^ (a1 >> 63));
  Swift::Int v2 = ByteBuffer.writeBytes(_:)((Swift::OpaquePointer)v1);
  swift_bridgeObjectRelease();
  return v2;
}

Swift::Int __swiftcall ByteBuffer.writeAvroString(_:)(Swift::String a1)
{
  object = a1._object;
  uint64_t countAndFlagsBits = a1._countAndFlagsBits;
  if (((uint64_t)a1._object & 0x1000000000000000) != 0)
  {
    uint64_t v3 = sub_25BE7FCF0();
  }
  else if (((uint64_t)a1._object & 0x2000000000000000) != 0)
  {
    uint64_t v3 = HIBYTE(a1._object) & 0xF;
  }
  else
  {
    uint64_t v3 = a1._countAndFlagsBits & 0xFFFFFFFFFFFFLL;
  }
  uint64_t v4 = OUTLINED_FUNCTION_100_0(v3);
  Swift::Int v5 = ByteBuffer.writeBytes(_:)((Swift::OpaquePointer)v4);
  swift_bridgeObjectRelease();
  v6._uint64_t countAndFlagsBits = countAndFlagsBits;
  v6._object = object;
  Swift::Int v7 = ByteBuffer.writeString(_:)(v6);
  BOOL v8 = __OFADD__(v5, v7);
  Swift::Int result = v5 + v7;
  if (v8) {
    __break(1u);
  }
  return result;
}

Swift::Int __swiftcall ByteBuffer.writeAvroLong(_:)(Swift::Int64 a1)
{
  uint64_t v2 = OUTLINED_FUNCTION_100_0(a1);
  ByteBuffer.writeBytes(_:)((Swift::OpaquePointer)v2);
  OUTLINED_FUNCTION_194_0();
  return v1;
}

Swift::Int __swiftcall ByteBuffer.writeAvroBool(_:)(Swift::Bool a1)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  Swift::Bool v2 = a1;
  return sub_25BE66130(&v2);
}

Swift::Int __swiftcall ByteBuffer.writeAvroInt(_:)(Swift::Int32 a1)
{
  uint64_t v2 = sub_25BE6DD9C((2 * a1) ^ (a1 >> 31));
  ByteBuffer.writeBytes(_:)((Swift::OpaquePointer)v2);
  OUTLINED_FUNCTION_194_0();
  return v1;
}

Swift::Int __swiftcall ByteBuffer.writeAvroFloat(_:)(Swift::Float a1)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  Swift::Float v2 = a1;
  return sub_25BE661A4(&v2);
}

Swift::Int __swiftcall ByteBuffer.writeAvroDouble(_:)(Swift::Double a1)
{
  v2[1] = *MEMORY[0x263EF8340];
  *(Swift::Double *)Swift::Float v2 = a1;
  return sub_25BE66218(v2);
}

uint64_t sub_25BE6DD9C(unsigned int a1)
{
  LOBYTE(v1) = a1 & 0x7F;
  if (a1 >= 0x80)
  {
    unsigned int v5 = a1;
    sub_25BE6FF08();
    uint64_t v2 = v6;
    unint64_t v7 = *(void *)(v6 + 16);
    do
    {
      if (v7 >= *(void *)(v2 + 24) >> 1)
      {
        sub_25BE6FF08();
        uint64_t v2 = v10;
      }
      char v8 = v1 | 0x80;
      int v1 = (v5 >> 7) & 0x7F;
      unsigned int v9 = v5 >> 14;
      v5 >>= 7;
      *(void *)(v2 + 16) = v7 + 1;
      *(unsigned char *)(v2 + v7++ + 32) = v8;
    }
    while (v9);
  }
  else
  {
    uint64_t v2 = MEMORY[0x263F8EE78];
  }
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
  {
    sub_25BE6FF08();
    uint64_t v2 = v11;
  }
  unint64_t v3 = *(void *)(v2 + 16);
  if (v3 >= *(void *)(v2 + 24) >> 1)
  {
    sub_25BE6FF08();
    uint64_t v2 = v12;
  }
  *(void *)(v2 + 16) = v3 + 1;
  *(unsigned char *)(v2 + v3 + 32) = v1;
  return v2;
}

uint64_t sub_25BE6DEC4(unint64_t a1)
{
  LOBYTE(v1) = a1 & 0x7F;
  if (a1 >= 0x80)
  {
    unint64_t v5 = a1;
    sub_25BE6FF08();
    uint64_t v2 = v6;
    unint64_t v7 = *(void *)(v6 + 16);
    do
    {
      if (v7 >= *(void *)(v2 + 24) >> 1)
      {
        sub_25BE6FF08();
        uint64_t v2 = v10;
      }
      char v8 = v1 | 0x80;
      uint64_t v1 = (v5 >> 7) & 0x7F;
      unint64_t v9 = v5 >> 14;
      v5 >>= 7;
      *(void *)(v2 + 16) = v7 + 1;
      *(unsigned char *)(v2 + v7++ + 32) = v8;
    }
    while (v9);
  }
  else
  {
    uint64_t v2 = MEMORY[0x263F8EE78];
  }
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
  {
    sub_25BE6FF08();
    uint64_t v2 = v11;
  }
  unint64_t v3 = *(void *)(v2 + 16);
  if (v3 >= *(void *)(v2 + 24) >> 1)
  {
    sub_25BE6FF08();
    uint64_t v2 = v12;
  }
  *(void *)(v2 + 16) = v3 + 1;
  *(unsigned char *)(v2 + v3 + 32) = v1;
  return v2;
}

Swift::Int __swiftcall ByteBuffer.writeAvroBytes(_:)(Swift::OpaquePointer a1)
{
  uint64_t v3 = sub_25BE6DEC4(2 * *((void *)a1._rawValue + 2));
  ByteBuffer.writeBytes(_:)((Swift::OpaquePointer)v3);
  OUTLINED_FUNCTION_165_0();
  Swift::Int v4 = ByteBuffer.writeBytes(_:)(a1);
  BOOL v5 = __OFADD__(v1, v4);
  Swift::Int result = v1 + v4;
  if (v5) {
    __break(1u);
  }
  return result;
}

Swift::Int ByteBuffer.writeAvroBytes(_:)(uint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t v3 = sub_25BE61A20(a1, a2, a3);
  uint64_t v4 = OUTLINED_FUNCTION_100_0(v3);
  Swift::Int v5 = ByteBuffer.writeBytes(_:)((Swift::OpaquePointer)v4);
  swift_bridgeObjectRelease();
  uint64_t v6 = OUTLINED_FUNCTION_608();
  uint64_t v8 = ByteBuffer.writeImmutableBuffer(_:)(v6, v7);
  BOOL v9 = __OFADD__(v5, v8);
  Swift::Int result = v5 + v8;
  if (v9) {
    __break(1u);
  }
  return result;
}

Swift::Int ByteBuffer.writeAvroBytes(_:)(uint64_t a1, unint64_t a2)
{
  uint64_t v4 = sub_25BE7E880();
  uint64_t v5 = OUTLINED_FUNCTION_100_0(v4);
  Swift::Int v6 = ByteBuffer.writeBytes(_:)((Swift::OpaquePointer)v5);
  swift_bridgeObjectRelease();
  uint64_t v7 = ByteBuffer.writeData(_:)(a1, a2);
  BOOL v8 = __OFADD__(v6, v7);
  Swift::Int result = v6 + v7;
  if (v8) {
    __break(1u);
  }
  return result;
}

uint64_t sub_25BE6E114()
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  uint64_t v1 = *v0;
  unint64_t v2 = v0[1];
  ByteBufferView.init(_:)(*v0, v2, v0[2], v36);
  uint64_t v3 = v37;
  uint64_t v4 = v38;
  uint64_t v35 = v37 - v38;
  if (v37 != v38)
  {
    v27 = v0;
    uint64_t v5 = v36[0];
    unint64_t v6 = v36[1];
    uint64_t v7 = v36[2];
    sub_25BCBA6A8(v1, v2);
    uint64_t v8 = 0;
    BOOL v9 = &v39;
    unint64_t v32 = v6 >> 40;
    uint64_t v10 = &v39;
    unint64_t v33 = v6;
    unint64_t v30 = v6 >> 24;
    unint64_t v31 = HIDWORD(v6);
    unint64_t v11 = v6 >> 62;
    unint64_t v34 = v11;
    uint64_t v28 = v7;
    uint64_t v29 = v4;
    while (v3 + v8 < v4)
    {
      if (v3 < v7) {
        goto LABEL_32;
      }
      unint64_t v12 = HIDWORD(v5);
      switch(v11)
      {
        case 1uLL:
          if (v5 >> 32 < (int)v5) {
            goto LABEL_33;
          }
          sub_25BE65034((uint64_t)v36);
          uint64_t v14 = sub_25BE7E620();
          if (!v14) {
            goto LABEL_12;
          }
          uint64_t v15 = sub_25BE7E640();
          if (__OFSUB__((int)v5, v15)) {
            goto LABEL_35;
          }
          v14 += (int)v5 - v15;
LABEL_12:
          sub_25BE7E630();
          char v13 = *(unsigned char *)(v14 + v3 + v8);
          sub_25BE65134((uint64_t)v36);
          unint64_t v11 = v34;
          LODWORD(v12) = HIDWORD(v5);
          uint64_t v7 = v28;
LABEL_18:
          if ((v13 & 0x80) == 0)
          {
            if ((v3 & 0x8000000000000000) == 0)
            {
              uint64_t v21 = v3 + v8;
              uint64_t v22 = v3 + v8 + 1;
              uint64_t v23 = 0;
              switch(v11)
              {
                case 1uLL:
                  if (__OFSUB__(v12, v5)) {
                    goto LABEL_38;
                  }
                  uint64_t v23 = (int)v12 - (int)v5;
LABEL_27:
                  sub_25BE65034((uint64_t)v36);
LABEL_28:
                  if (v23 <= v21) {
                    goto LABEL_37;
                  }
                  *(void *)&long long v39 = v5;
                  *((void *)&v39 + 1) = v33;
                  uint64_t v40 = v7;
                  uint64_t v41 = v3;
                  uint64_t v42 = v22;
                  uint64_t v20 = sub_25BE64B2C((uint64_t)&v39);
                  sub_25BE65134((uint64_t)v36);
                  sub_25BE65134((uint64_t)v36);
                  v27[2] = v22;
                  break;
                case 2uLL:
                  uint64_t v25 = *(void *)(v5 + 16);
                  uint64_t v24 = *(void *)(v5 + 24);
                  uint64_t v23 = v24 - v25;
                  if (!__OFSUB__(v24, v25)) {
                    goto LABEL_27;
                  }
                  goto LABEL_39;
                case 3uLL:
                  goto LABEL_28;
                default:
                  uint64_t v23 = BYTE6(v33);
                  goto LABEL_28;
              }
              return v20;
            }
LABEL_36:
            __break(1u);
LABEL_37:
            __break(1u);
LABEL_38:
            __break(1u);
LABEL_39:
            __break(1u);
          }
          ++v8;
          BOOL v9 = (long long *)((char *)v9 + 1);
          uint64_t v10 = (long long *)((char *)v10 + 1);
          if (!(v35 + v8)) {
            goto LABEL_20;
          }
          break;
        case 2uLL:
          uint64_t v16 = v7;
          uint64_t v17 = *(void *)(v5 + 16);
          swift_retain();
          swift_retain();
          uint64_t v18 = sub_25BE7E620();
          if (!v18) {
            goto LABEL_16;
          }
          uint64_t v19 = sub_25BE7E640();
          if (__OFSUB__(v17, v19)) {
            goto LABEL_34;
          }
          v18 += v17 - v19;
LABEL_16:
          sub_25BE7E630();
          char v13 = *(unsigned char *)(v18 + v3 + v8);
          swift_release();
          swift_release();
          uint64_t v7 = v16;
          uint64_t v4 = v29;
          LODWORD(v12) = HIDWORD(v5);
          unint64_t v11 = v34;
          goto LABEL_18;
        case 3uLL:
          *(void *)((char *)&v39 + 6) = 0;
          *(void *)&long long v39 = 0;
          char v13 = *((unsigned char *)v10 + v3);
          goto LABEL_18;
        default:
          *(void *)&long long v39 = v5;
          WORD4(v39) = v33;
          BYTE10(v39) = BYTE2(v33);
          BYTE11(v39) = v30;
          BYTE12(v39) = v31;
          BYTE13(v39) = v32;
          char v13 = *((unsigned char *)v9 + v3);
          goto LABEL_18;
      }
    }
    __break(1u);
LABEL_32:
    __break(1u);
LABEL_33:
    __break(1u);
LABEL_34:
    __break(1u);
LABEL_35:
    __break(1u);
    goto LABEL_36;
  }
  sub_25BCBA6A8(v1, v2);
LABEL_20:
  sub_25BE65134((uint64_t)v36);
  return 0;
}

uint64_t sub_25BE6E4B0(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    int v2 = 0;
    uint64_t v3 = a1 + 31;
    do
    {
      uint64_t v4 = *(unsigned char *)(v3 + v1) & 0x7F | (v2 << 7);
      int v2 = *(unsigned char *)(v3 + v1--) & 0x7F | (v2 << 7);
    }
    while (v1);
  }
  else
  {
    uint64_t v4 = 0;
  }
  swift_bridgeObjectRelease();
  return v4;
}

unint64_t sub_25BE6E500(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    unint64_t v2 = 0;
    do
    {
      unint64_t v3 = *(unsigned char *)(a1 + 31 + v1) & 0x7F | (v2 << 7);
      unint64_t v2 = v3;
      --v1;
    }
    while (v1);
  }
  else
  {
    unint64_t v3 = 0;
  }
  swift_bridgeObjectRelease();
  return v3;
}

void ByteBuffer.readAvroValue(_:)(unint64_t a1@<X0>, uint64_t a2@<X8>)
{
  switch(a1 >> 61)
  {
    case 1uLL:
      OUTLINED_FUNCTION_118_0();
      swift_bridgeObjectRetain();
      OUTLINED_FUNCTION_148_0();
      ByteBuffer.readAvroArray(_:)();
      goto LABEL_5;
    case 2uLL:
      OUTLINED_FUNCTION_118_0();
      swift_bridgeObjectRetain();
      OUTLINED_FUNCTION_148_0();
      ByteBuffer.readAvroMap(_:)();
LABEL_5:
      char v3 = v13;
      swift_release();
      swift_bridgeObjectRelease();
      long long v5 = v12;
      long long v4 = v11;
      long long v7 = v10;
      long long v6 = v9;
      goto LABEL_9;
    case 3uLL:
      long long v8 = *(_OWORD *)((a1 & 0x1FFFFFFFFFFFFFFFLL) + 0x20);
      long long v14 = *(_OWORD *)((a1 & 0x1FFFFFFFFFFFFFFFLL) + 0x10);
      long long v15 = v8;
      long long v16 = *(_OWORD *)((a1 & 0x1FFFFFFFFFFFFFFFLL) + 0x30);
      uint64_t v17 = *(void *)((a1 & 0x1FFFFFFFFFFFFFFFLL) + 0x40);
      ByteBuffer.readAvroRecord(_:)();
      goto LABEL_8;
    case 4uLL:
      ByteBuffer.readAvroUnion(_:)(*(void *)((a1 & 0x1FFFFFFFFFFFFFFFLL) + 0x10), (uint64_t)&v9);
      goto LABEL_8;
    default:
      ByteBuffer.readAvroPrimitive(_:)(&v9, *(unsigned __int8 *)(a1 + 16));
LABEL_8:
      long long v6 = v9;
      long long v7 = v10;
      long long v4 = v11;
      long long v5 = v12;
      char v3 = v13;
LABEL_9:
      *(_OWORD *)a2 = v6;
      *(_OWORD *)(a2 + 16) = v7;
      *(_OWORD *)(a2 + 32) = v4;
      *(_OWORD *)(a2 + 48) = v5;
      *(unsigned char *)(a2 + 64) = v3;
      return;
  }
}

#error "25BE6E7B8: call analysis failed (funcsize=127)"

void ByteBuffer.readAvroArray(_:)()
{
  OUTLINED_FUNCTION_68();
  unint64_t v46 = v4;
  unint64_t v6 = v5;
  uint64_t v45 = v7;
  uint64_t v55 = v8;
  if (!sub_25BE6E114()) {
    goto LABEL_35;
  }
  OUTLINED_FUNCTION_64_0();
  if (v10)
  {
    swift_bridgeObjectRelease();
LABEL_35:
    unint64_t v19 = 0;
    uint64_t v20 = 0;
    OUTLINED_FUNCTION_171_0();
LABEL_36:
    char v35 = -1;
    goto LABEL_37;
  }
  unint64_t v11 = sub_25BE6E500(v9);
  unint64_t v2 = -(uint64_t)(v11 & 1) ^ (v11 >> 1);
  if ((v2 & 0x8000000000000000) != 0)
  {
LABEL_43:
    __break(1u);
    JUMPOUT(0x25BE6EE40);
  }
  unint64_t v44 = v6;
  if (!v2)
  {
    swift_retain();
    swift_bridgeObjectRetain();
    uint64_t v12 = MEMORY[0x263F8EE78];
LABEL_30:
    uint64_t v39 = sub_25BE6FBFC();
    if ((v40 & 1) == 0 && !v39)
    {
      OUTLINED_FUNCTION_171_0();
      uint64_t v20 = v12;
      char v35 = 1;
      unint64_t v19 = v44;
      uint64_t v41 = v55;
      uint64_t v42 = v45;
      unint64_t v43 = v46;
      goto LABEL_38;
    }
LABEL_33:
    swift_bridgeObjectRelease();
    goto LABEL_34;
  }
  swift_bridgeObjectRetain();
  swift_retain();
  uint64_t v12 = MEMORY[0x263F8EE78];
  while (2)
  {
    if (!v2)
    {
      __break(1u);
      goto LABEL_43;
    }
    unint64_t v58 = v2;
    switch(v46 >> 61)
    {
      case 1uLL:
        OUTLINED_FUNCTION_91_0();
        swift_bridgeObjectRetain();
        uint64_t v17 = OUTLINED_FUNCTION_206_0();
        ByteBuffer.readAvroArray(_:)(v17);
        long long v56 = v64;
        long long v49 = v62;
        long long v52 = v63;
        long long v47 = v61;
        uint64_t v0 = v65;
        goto LABEL_13;
      case 2uLL:
        OUTLINED_FUNCTION_91_0();
        swift_bridgeObjectRetain();
        OUTLINED_FUNCTION_206_0();
        ByteBuffer.readAvroMap(_:)();
        long long v56 = v69;
        long long v49 = v67;
        long long v52 = v68;
        long long v47 = v66;
        uint64_t v0 = v70;
LABEL_13:
        swift_release();
        swift_bridgeObjectRelease();
        long long v16 = v47;
        long long v15 = v49;
        long long v14 = v52;
        long long v13 = v56;
        goto LABEL_15;
      case 3uLL:
        long long v18 = *(_OWORD *)((v46 & 0x1FFFFFFFFFFFFFFFLL) + 0x20);
        long long v90 = *(_OWORD *)((v46 & 0x1FFFFFFFFFFFFFFFLL) + 0x10);
        long long v91 = v18;
        long long v92 = *(_OWORD *)((v46 & 0x1FFFFFFFFFFFFFFFLL) + 0x30);
        uint64_t v93 = *(void *)((v46 & 0x1FFFFFFFFFFFFFFFLL) + 0x40);
        ByteBuffer.readAvroRecord(_:)();
        long long v13 = v74;
        long long v14 = v73;
        long long v15 = v72;
        long long v16 = v71;
        uint64_t v0 = v75;
        goto LABEL_15;
      case 4uLL:
        uint64_t v30 = *(void *)((v46 & 0x1FFFFFFFFFFFFFFFLL) + 0x10);
        uint64_t v31 = sub_25BE6E114();
        if (!v31) {
          goto LABEL_33;
        }
        if (*(void *)(v31 + 16) > 0xAuLL)
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
LABEL_34:
          swift_bridgeObjectRelease();
          swift_release();
          goto LABEL_35;
        }
        unint64_t v32 = sub_25BE6E500(v31);
        uint64_t v33 = -(uint64_t)(v32 & 1) ^ (v32 >> 1);
        if (v33 < 0 || v33 >= *(void *)(v30 + 16)) {
          goto LABEL_33;
        }
        uint64_t v53 = v12;
        uint64_t v34 = *(void *)(v30 + 8 * v33 + 32);
        swift_retain();
        ByteBuffer.readAvroValue(_:)(v76, v34);
        unint64_t v19 = v76[1];
        *(void *)&long long v56 = v76[0];
        uint64_t v20 = v76[3];
        unint64_t v50 = v76[2];
        uint64_t v0 = v76[4];
        unint64_t v1 = v76[5];
        unint64_t v2 = v76[6];
        uint64_t v3 = v76[7];
        char v35 = v77;
        sub_25BE70388((uint64_t)v76, (uint64_t)__src);
        if (__src[64] != 255)
        {
          memcpy(v89, __src, 0x41uLL);
          uint64_t v36 = swift_bridgeObjectRetain();
          sub_25BE727C8(v36, (uint64_t)v89, v33, (uint64_t)v78);
          swift_release();
          uint64_t v21 = v79;
          unint64_t v19 = v80;
          uint64_t v22 = v81;
          uint64_t v23 = v83;
          unint64_t v1 = v84;
          uint64_t v24 = v85;
          uint64_t v3 = v86;
          uint64_t v0 = v87;
          sub_25BE03DEC(v79, v80, v81, v82, v83, v84, v85, v86, v87);
          sub_25BE60950((uint64_t)v78);
          OUTLINED_FUNCTION_40_3();
          uint64_t v12 = v53;
          goto LABEL_17;
        }
        swift_release();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_release();
        uint64_t v42 = v56;
        unint64_t v43 = v50;
LABEL_37:
        uint64_t v41 = v55;
LABEL_38:
        *(void *)uint64_t v41 = v42;
        *(void *)(v41 + 8) = v19;
        *(void *)(v41 + 16) = v43;
        *(void *)(v41 + 24) = v20;
        *(void *)(v41 + 32) = v0;
        *(void *)(v41 + 40) = v1;
        *(void *)(v41 + 48) = v2;
        *(void *)(v41 + 56) = v3;
        *(unsigned char *)(v41 + 64) = v35;
        OUTLINED_FUNCTION_70();
        return;
      default:
        ByteBuffer.readAvroPrimitive(_:)(v59, *(unsigned __int8 *)(v46 + 16));
        long long v14 = v59[2];
        long long v13 = v59[3];
        long long v16 = v59[0];
        long long v15 = v59[1];
        uint64_t v0 = v60;
LABEL_15:
        unint64_t v19 = *((void *)&v16 + 1);
        uint64_t v20 = *((void *)&v15 + 1);
        unint64_t v1 = *((void *)&v14 + 1);
        uint64_t v3 = *((void *)&v13 + 1);
        if (v0 == 255)
        {
          unint64_t v57 = v13;
          unint64_t v51 = v15;
          uint64_t v54 = v14;
          uint64_t v48 = v16;
          swift_release();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          uint64_t v42 = v48;
          unint64_t v43 = v51;
          uint64_t v0 = v54;
          unint64_t v2 = v57;
          goto LABEL_36;
        }
        uint64_t v21 = v16;
        uint64_t v22 = v15;
        uint64_t v23 = v14;
        uint64_t v24 = v13;
        OUTLINED_FUNCTION_40_3();
LABEL_17:
        uint64_t v25 = v1;
        unint64_t v1 = v19;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_25BE6FE20();
          uint64_t v12 = v37;
        }
        unint64_t v27 = *(void *)(v12 + 16);
        unint64_t v26 = *(void *)(v12 + 24);
        uint64_t v28 = v12;
        if (v27 >= v26 >> 1)
        {
          OUTLINED_FUNCTION_122_0(v26);
          sub_25BE6FE20();
          uint64_t v28 = v38;
        }
        *(void *)(v28 + 16) = v27 + 1;
        uint64_t v12 = v28;
        uint64_t v29 = v28 + 72 * v27;
        *(void *)(v29 + 32) = v21;
        *(void *)(v29 + 40) = v1;
        *(void *)(v29 + 48) = v22;
        *(void *)(v29 + 56) = v56;
        *(void *)(v29 + 64) = v23;
        *(void *)(v29 + 72) = v25;
        *(void *)(v29 + 80) = v24;
        *(void *)(v29 + 88) = v3;
        *(unsigned char *)(v29 + 96) = v0;
        sub_25BE03FA4(v21, v1, v22, v56, v23, v25, v24, v3, v0);
        unint64_t v2 = v58 - 1;
        if (v58 == 1) {
          goto LABEL_30;
        }
        continue;
    }
  }
}

void ByteBuffer.readAvroMap(_:)()
{
  OUTLINED_FUNCTION_68();
  unint64_t v1 = v0;
  uint64_t v46 = v2;
  uint64_t v42 = v3;
  uint64_t v5 = v4;
  if (!sub_25BE6E114()) {
    goto LABEL_27;
  }
  OUTLINED_FUNCTION_64_0();
  if (v7)
  {
LABEL_26:
    swift_bridgeObjectRelease();
LABEL_27:
    OUTLINED_FUNCTION_136_0();
    goto LABEL_28;
  }
  unint64_t v8 = sub_25BE6E500(v6);
  unint64_t v9 = -(uint64_t)(v8 & 1) ^ (v8 >> 1);
  uint64_t v47 = v1 & 0x1FFFFFFFFFFFFFFFLL;
  swift_retain();
  swift_bridgeObjectRetain();
  uint64_t v10 = sub_25BE7FB40();
  unint64_t v49 = v9;
  if ((v9 & 0x8000000000000000) != 0) {
    goto LABEL_31;
  }
  uint64_t v48 = v10;
  if (v9)
  {
    uint64_t v41 = (uint64_t *)(v47 + 16);
    uint64_t v44 = v5;
    unint64_t v45 = v1 >> 61;
    unint64_t v43 = v1;
    while (v49)
    {
      if (!sub_25BE6E114()) {
        goto LABEL_25;
      }
      OUTLINED_FUNCTION_64_0();
      if (v7) {
        goto LABEL_24;
      }
      unint64_t v12 = sub_25BE6E500(v11);
      Swift::String_optional v13 = ByteBuffer.readString(length:)(-(uint64_t)(v12 & 1) ^ (v12 >> 1));
      if (!v13.value._object) {
        goto LABEL_25;
      }
      switch(v45)
      {
        case 1uLL:
          uint64_t v19 = *(void *)(v47 + 16);
          OUTLINED_FUNCTION_91_0();
          swift_bridgeObjectRetain();
          ByteBuffer.readAvroArray(_:)(v19);
          long long v50 = v60;
          long long v52 = v61;
          long long v54 = v62;
          long long v56 = v63;
          int v18 = v64;
          goto LABEL_14;
        case 2uLL:
          uint64_t v20 = *(void *)(v47 + 16);
          OUTLINED_FUNCTION_91_0();
          swift_bridgeObjectRetain();
          ByteBuffer.readAvroMap(_:)(v20);
          long long v50 = v65;
          long long v52 = v66;
          long long v54 = v67;
          long long v56 = v68;
          int v18 = v69;
LABEL_14:
          swift_release();
          swift_bridgeObjectRelease();
          long long v16 = v54;
          long long v17 = v56;
          long long v14 = v50;
          long long v15 = v52;
          break;
        case 3uLL:
          long long v21 = *(_OWORD *)(v47 + 32);
          long long v79 = *(_OWORD *)v41;
          long long v80 = v21;
          long long v81 = *(_OWORD *)(v47 + 48);
          uint64_t v82 = *(void *)(v47 + 64);
          ByteBuffer.readAvroRecord(_:)();
          long long v14 = v70;
          long long v15 = v71;
          long long v16 = v72;
          long long v17 = v73;
          int v18 = v74;
          break;
        case 4uLL:
          ByteBuffer.readAvroUnion(_:)(*v41, (uint64_t)v75);
          long long v14 = v75[0];
          long long v15 = v75[1];
          long long v16 = v75[2];
          long long v17 = v75[3];
          int v18 = v76;
          break;
        default:
          ByteBuffer.readAvroPrimitive(_:)(v58, *(unsigned __int8 *)(v1 + 16));
          long long v14 = v58[0];
          long long v15 = v58[1];
          long long v16 = v58[2];
          long long v17 = v58[3];
          int v18 = v59;
          break;
      }
      if (v18 == 255)
      {
LABEL_24:
        swift_bridgeObjectRelease();
        goto LABEL_25;
      }
      v77[0] = v14;
      v77[1] = v15;
      v77[2] = v16;
      v77[3] = v17;
      char v78 = v18;
      long long v51 = v14;
      long long v53 = v15;
      long long v55 = v16;
      long long v57 = v17;
      swift_retain();
      char v22 = sub_25BE58C30((uint64_t)v77, v1);
      swift_release();
      if ((v22 & 1) == 0)
      {
        unint64_t v1 = v47;
        swift_retain();
        AvroValue.schema.getter();
        swift_bridgeObjectRelease();
        swift_release();
        swift_bridgeObjectRelease();
        sub_25BE703F0(v51, *((unint64_t *)&v51 + 1), v53, SBYTE8(v53), v55, *((uint64_t *)&v55 + 1), v57, *((uint64_t *)&v57 + 1), v18);
        swift_release();
        swift_bridgeObjectRelease();
        swift_release();
        OUTLINED_FUNCTION_136_0();
        uint64_t v5 = v44;
        goto LABEL_28;
      }
      swift_bridgeObjectRetain();
      OUTLINED_FUNCTION_157_0();
      sub_25BE70408(v23, v24, v25, v26, v27, *((uint64_t *)&v55 + 1), v28, *((uint64_t *)&v57 + 1), v18);
      swift_isUniquelyReferenced_nonNull_native();
      sub_25BE701D0(v77, v13.value._countAndFlagsBits, (uint64_t)v13.value._object);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_157_0();
      unint64_t v1 = v43;
      sub_25BE703F0(v29, v30, v31, v32, v33, *((uint64_t *)&v55 + 1), v57, *((uint64_t *)&v57 + 1), v18);
      swift_bridgeObjectRelease();
      BOOL v34 = v49-- == 1;
      uint64_t v5 = v44;
      if (v34) {
        goto LABEL_21;
      }
    }
    __break(1u);
LABEL_31:
    __break(1u);
    JUMPOUT(0x25BE6F2B8);
  }
LABEL_21:
  uint64_t v35 = sub_25BE6FBFC();
  if ((v36 & 1) != 0 || v35)
  {
LABEL_25:
    swift_bridgeObjectRelease();
    swift_release();
    goto LABEL_26;
  }
  char v37 = 2;
  uint64_t v38 = v46;
  uint64_t v39 = v42;
  uint64_t v40 = v48;
LABEL_28:
  *(void *)uint64_t v5 = v39;
  *(void *)(v5 + 8) = v38;
  *(void *)(v5 + 16) = v1;
  *(void *)(v5 + 24) = v40;
  *(_OWORD *)(v5 + 32) = 0u;
  *(_OWORD *)(v5 + 48) = 0u;
  *(unsigned char *)(v5 + 64) = v37;
  OUTLINED_FUNCTION_70();
}

void ByteBuffer.readAvroRecord(_:)()
{
  OUTLINED_FUNCTION_68();
  uint64_t v93 = v0;
  uint64_t v3 = (SwiftAvro::AvroRecordSchema *)v2;
  uint64_t v88 = v4;
  sub_25BE03D68(v2);
  AvroRecord.init(schema:)(&v105, v3);
  uint64_t countAndFlagsBits = v105.schema.type._countAndFlagsBits;
  uint64_t object = (uint64_t)v105.schema.type._object;
  uint64_t v8 = v105.schema.name._countAndFlagsBits;
  char v7 = v105.schema.name._object;
  uint64_t v10 = v105.schema.namespace.value._countAndFlagsBits;
  uint64_t v9 = (uint64_t)v105.schema.namespace.value._object;
  rawValue = v105.schema.fields._rawValue;
  uint64_t v11 = v105.fields._rawValue;
  Swift::String_optional v13 = v3->fields._rawValue;
  v134 = v13;
  unint64_t v14 = v13[2];
  if (!v14)
  {
LABEL_42:
    char v75 = 3;
    goto LABEL_49;
  }
  uint64_t v81 = v105.schema.namespace.value._countAndFlagsBits;
  uint64_t v82 = v105.schema.name._countAndFlagsBits;
  uint64_t v83 = v105.schema.type._countAndFlagsBits;
  unint64_t v84 = v105.schema.name._object;
  uint64_t v85 = v105.schema.type._object;
  uint64_t v86 = v105.schema.namespace.value._object;
  swift_bridgeObjectRetain();
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    goto LABEL_54;
  }
LABEL_3:
  uint64_t v15 = 0;
  uint64_t v91 = (uint64_t)v11;
  uint64_t v92 = (uint64_t)(v13 + 4);
  uint64_t v89 = v14;
  uint64_t v90 = (uint64_t)v11 + 32;
  uint64_t v87 = (uint64_t)(rawValue + 8);
  while (2)
  {
    if (v15 == v14) {
      goto LABEL_52;
    }
    long long v16 = (void **)(v92 + 24 * v15);
    uint64_t v11 = *v16;
    unint64_t v17 = (unint64_t)v16[2];
    int v18 = (void *)(v15 + 1);
    uint64_t v101 = v17;
    v104 = v16[1];
    uint64_t v94 = (uint64_t)v18;
    switch(v17 >> 61)
    {
      case 1uLL:
        OUTLINED_FUNCTION_102_0();
        swift_bridgeObjectRetain();
        swift_retain();
        swift_bridgeObjectRetain();
        uint64_t v25 = OUTLINED_FUNCTION_179_0();
        ByteBuffer.readAvroArray(_:)(v25);
        long long v103 = v111;
        long long v98 = v109;
        long long v100 = v110;
        long long v96 = v108;
        int v26 = v112;
        goto LABEL_9;
      case 2uLL:
        OUTLINED_FUNCTION_102_0();
        swift_bridgeObjectRetain();
        swift_retain();
        swift_bridgeObjectRetain();
        uint64_t v27 = OUTLINED_FUNCTION_179_0();
        ByteBuffer.readAvroMap(_:)(v27);
        long long v103 = v116;
        long long v98 = v114;
        long long v100 = v115;
        long long v96 = v113;
        int v26 = v117;
LABEL_9:
        swift_release();
        swift_bridgeObjectRelease();
        long long v23 = v96;
        long long v22 = v98;
        long long v21 = v100;
        long long v20 = v103;
        int v24 = v26;
        goto LABEL_11;
      case 3uLL:
        long long v28 = *(_OWORD *)((v17 & 0x1FFFFFFFFFFFFFFFLL) + 0x20);
        v137[0] = *(_OWORD *)((v17 & 0x1FFFFFFFFFFFFFFFLL) + 0x10);
        v137[1] = v28;
        v137[2] = *(_OWORD *)((v17 & 0x1FFFFFFFFFFFFFFFLL) + 0x30);
        uint64_t v138 = *(void *)((v17 & 0x1FFFFFFFFFFFFFFFLL) + 0x40);
        swift_bridgeObjectRetain();
        swift_retain();
        ByteBuffer.readAvroRecord(_:)(v118, v137);
        long long v20 = v118[3];
        long long v21 = v118[2];
        long long v22 = v118[1];
        long long v23 = v118[0];
        int v24 = v119;
        goto LABEL_11;
      case 4uLL:
        uint64_t v33 = v17 & 0x1FFFFFFFFFFFFFFFLL;
        uint64_t v50 = *(void *)((v17 & 0x1FFFFFFFFFFFFFFFLL) + 0x10);
        swift_bridgeObjectRetain();
        swift_retain();
        uint64_t object = v93;
        uint64_t v51 = sub_25BE6E114();
        if (!v51) {
          goto LABEL_44;
        }
        if (*(void *)(v51 + 16) > 0xAuLL)
        {
          swift_release();
          swift_bridgeObjectRelease();
          goto LABEL_46;
        }
        unint64_t v52 = sub_25BE6E500(v51);
        uint64_t v53 = -(uint64_t)(v52 & 1) ^ (v52 >> 1);
        if ((v53 & 0x8000000000000000) == 0 && v53 < *(void *)(v50 + 16))
        {
          uint64_t v80 = v17 & 0x1FFFFFFFFFFFFFFFLL;
          v99 = rawValue;
          v97 = v11;
          uint64_t v54 = *(void *)(v50 + 8 * v53 + 32);
          swift_retain();
          ByteBuffer.readAvroValue(_:)(v120, v54);
          uint64_t v79 = v120[0];
          uint64_t v55 = v120[1];
          uint64_t v1 = v120[2];
          int v18 = (void *)v120[3];
          uint64_t v33 = v120[4];
          uint64_t v102 = v120[5];
          unint64_t v56 = v120[6];
          uint64_t v11 = (void *)v120[7];
          char v57 = v121;
          sub_25BE70388((uint64_t)v120, (uint64_t)__src);
          if (__src[64] == 255)
          {
            char v75 = v57;
            unint64_t v17 = v56;
            uint64_t object = v55;
            uint64_t v50 = v79;
            swift_release();
            swift_bridgeObjectRelease();
            swift_release();
            goto LABEL_48;
          }
          memcpy(__dst, __src, 0x41uLL);
          uint64_t v58 = swift_bridgeObjectRetain();
          sub_25BE727C8(v58, (uint64_t)__dst, v53, (uint64_t)v122);
          swift_release();
          uint64_t v29 = v123;
          uint64_t object = v124;
          uint64_t v31 = v125;
          uint64_t v59 = v126;
          uint64_t v33 = v127;
          uint64_t v60 = v128;
          uint64_t v61 = v129;
          uint64_t v62 = v130;
          char v63 = v131;
          sub_25BE03DEC(v123, v124, v125, v126, v127, v128, v129, v130, v131);
          sub_25BE60950((uint64_t)v122);
          LOBYTE(v24) = v63;
          uint64_t v32 = v60;
          uint64_t v35 = v62;
          uint64_t v34 = v61;
          uint64_t v30 = v59;
          uint64_t v36 = (uint64_t)v104;
          uint64_t v11 = v97;
          rawValue = v99;
LABEL_13:
          v135[0] = v29;
          v135[1] = object;
          uint64_t v1 = v31;
          v135[2] = v31;
          v135[3] = v30;
          v135[4] = v33;
          v135[5] = v32;
          uint64_t v102 = v32;
          *(void *)&long long v100 = v34;
          v135[6] = v34;
          v135[7] = v35;
          *(void *)&long long v98 = v35;
          char v136 = v24;
          Swift::String_optional v13 = rawValue;
          uint64_t v37 = rawValue[2];
          if (!v37) {
            goto LABEL_41;
          }
          BOOL v38 = (void *)rawValue[4] == v11 && rawValue[5] == v36;
          if (v38 || (sub_25BE80440() & 1) != 0)
          {
            unint64_t v14 = 0;
          }
          else
          {
            uint64_t v36 = (uint64_t)v104;
            if (v37 == 1) {
              goto LABEL_41;
            }
            rawValue = (void *)v87;
            unint64_t v14 = 1;
            while ((void *)*(rawValue - 1) != v11 || *rawValue != v36)
            {
              char v48 = sub_25BE80440();
              uint64_t v36 = (uint64_t)v104;
              if (v48) {
                break;
              }
              unint64_t v49 = v14 + 1;
              if (__OFADD__(v14, 1))
              {
                __break(1u);
LABEL_52:
                __break(1u);
LABEL_53:
                __break(1u);
LABEL_54:
                sub_25BE77404();
                uint64_t v11 = v76;
                goto LABEL_3;
              }
              rawValue += 3;
              ++v14;
              if (v49 == v37) {
                goto LABEL_41;
              }
            }
            rawValue = v13;
            if ((v14 & 0x8000000000000000) != 0)
            {
              __break(1u);
LABEL_41:
              uint64_t v64 = v36;
              sub_25BE70420();
              long long v65 = (void *)swift_allocError();
              *long long v66 = v11;
              v66[1] = v64;
              swift_bridgeObjectRetain();
              uint64_t v67 = swift_willThrow();
              OUTLINED_FUNCTION_54_3(v67, v68, v69, v70, v71, v72, v73, v74, v77, v78, v79, v80, v81, v82, v83, (uint64_t)v84, (uint64_t)v85, (uint64_t)v86, v87,
                v88,
                v89,
                v90,
                v91,
                v92,
                v93,
                v94,
                v33,
                *((uint64_t *)&v96 + 1),
                v98,
                *((uint64_t *)&v98 + 1),
                v100,
                *((uint64_t *)&v100 + 1),
                v101,
                0,
                v102);
              swift_bridgeObjectRelease();
              swift_release();
              sub_25BE03DC0((uint64_t)&v134);
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();

              uint64_t countAndFlagsBits = 0;
              uint64_t object = 0;
              uint64_t v8 = 0;
              char v7 = 0;
              uint64_t v10 = 0;
              uint64_t v9 = 0;
              rawValue = 0;
              uint64_t v11 = 0;
              char v75 = -1;
              goto LABEL_49;
            }
          }
          uint64_t v11 = (void *)v91;
          if (v14 >= *(void *)(v91 + 16)) {
            goto LABEL_53;
          }
          uint64_t v39 = AvroValue.update(_:)(v135);
          OUTLINED_FUNCTION_54_3(v39, v40, v41, v42, v43, v44, v45, v46, v77, v78, v79, v80, v81, v82, v83, (uint64_t)v84, (uint64_t)v85, (uint64_t)v86, v87,
            v88,
            v89,
            v90,
            v91,
            v92,
            v93,
            v94,
            v33,
            *((uint64_t *)&v96 + 1),
            v98,
            *((uint64_t *)&v98 + 1),
            v100,
            *((uint64_t *)&v100 + 1),
            v101,
            0,
            v102);
          swift_bridgeObjectRelease();
          swift_release();
          unint64_t v14 = v89;
          uint64_t v15 = v95;
          if (v95 == v89)
          {
            sub_25BE03DC0((uint64_t)&v134);
            uint64_t object = (uint64_t)v85;
            uint64_t v9 = (uint64_t)v86;
            uint64_t countAndFlagsBits = v83;
            char v7 = v84;
            uint64_t v10 = v81;
            uint64_t v8 = v82;
            goto LABEL_42;
          }
          continue;
        }
LABEL_44:
        swift_release();
LABEL_46:
        swift_bridgeObjectRelease();
        OUTLINED_FUNCTION_65_2();
LABEL_47:
        char v75 = -1;
LABEL_48:
        sub_25BE03DC0((uint64_t)&v134);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t v9 = v102;
        uint64_t countAndFlagsBits = v50;
        uint64_t v8 = v1;
        char v7 = v18;
        uint64_t v10 = v33;
        rawValue = (void *)v17;
LABEL_49:
        *(void *)uint64_t v88 = countAndFlagsBits;
        *(void *)(v88 + 8) = object;
        *(void *)(v88 + 16) = v8;
        *(void *)(v88 + 24) = v7;
        *(void *)(v88 + 32) = v10;
        *(void *)(v88 + 40) = v9;
        *(void *)(v88 + 48) = rawValue;
        *(void *)(v88 + 56) = v11;
        *(unsigned char *)(v88 + 64) = v75;
        OUTLINED_FUNCTION_70();
        return;
      default:
        uint64_t v19 = *(unsigned __int8 *)(v17 + 16);
        swift_retain();
        swift_bridgeObjectRetain();
        ByteBuffer.readAvroPrimitive(_:)(v106, v19);
        long long v21 = v106[2];
        long long v20 = v106[3];
        long long v23 = v106[0];
        long long v22 = v106[1];
        int v24 = v107;
LABEL_11:
        uint64_t object = *((void *)&v23 + 1);
        uint64_t v29 = v23;
        uint64_t v30 = *((void *)&v22 + 1);
        uint64_t v31 = v22;
        uint64_t v32 = *((void *)&v21 + 1);
        uint64_t v33 = v21;
        uint64_t v35 = *((void *)&v20 + 1);
        uint64_t v34 = v20;
        if (v24 == 255)
        {
          uint64_t v11 = (void *)*((void *)&v20 + 1);
          unint64_t v17 = v20;
          int v18 = (void *)*((void *)&v22 + 1);
          uint64_t v1 = v22;
          uint64_t v50 = v23;
          uint64_t v102 = *((void *)&v21 + 1);
          swift_bridgeObjectRelease();
          swift_release();
          goto LABEL_47;
        }
        uint64_t v36 = (uint64_t)v104;
        goto LABEL_13;
    }
  }
}

void ByteBuffer.readAvroUnion(_:)(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  if (!sub_25BE6E114()) {
    goto LABEL_5;
  }
  OUTLINED_FUNCTION_64_0();
  if (v10)
  {
    swift_bridgeObjectRelease();
LABEL_5:
    uint64_t v11 = 0;
    uint64_t v12 = 0;
    a1 = 0;
    uint64_t v2 = 0;
    uint64_t v3 = 0;
    uint64_t v4 = 0;
    uint64_t v5 = 0;
    uint64_t v6 = 0;
    char v13 = -1;
    goto LABEL_6;
  }
  uint64_t v11 = 0;
  char v13 = -1;
  unint64_t v14 = sub_25BE6E500(v9);
  if (((-(uint64_t)(v14 & 1) ^ (v14 >> 1)) & 0x8000000000000000) != 0)
  {
    OUTLINED_FUNCTION_96_0();
  }
  else
  {
    OUTLINED_FUNCTION_96_0();
    if (v15 < v17)
    {
      uint64_t v29 = v15;
      uint64_t v18 = *(void *)(v16 + 8 * v15 + 32);
      swift_retain();
      ByteBuffer.readAvroValue(_:)(v30, v18);
      uint64_t v11 = v30[0];
      uint64_t v19 = v30[1];
      a1 = v30[2];
      uint64_t v2 = v30[3];
      uint64_t v3 = v30[4];
      uint64_t v4 = v30[5];
      uint64_t v5 = v30[6];
      uint64_t v6 = v30[7];
      char v13 = v31;
      sub_25BE70388((uint64_t)v30, (uint64_t)__src);
      if (__src[64] == 255)
      {
        swift_release();
      }
      else
      {
        memcpy(__dst, __src, 0x41uLL);
        uint64_t v20 = swift_bridgeObjectRetain();
        sub_25BE727C8(v20, (uint64_t)__dst, v29, (uint64_t)v32);
        swift_release();
        uint64_t v11 = v33;
        uint64_t v19 = v34;
        a1 = v35;
        uint64_t v2 = v36;
        uint64_t v3 = v37;
        uint64_t v4 = v38;
        uint64_t v5 = v39;
        uint64_t v6 = v40;
        char v13 = v41;
        char v28 = v41;
        OUTLINED_FUNCTION_111_0();
        sub_25BE03DEC(v21, v22, v23, v24, v25, v26, v27, v6, v28);
        sub_25BE60950((uint64_t)v32);
      }
      uint64_t v12 = v19;
    }
  }
LABEL_6:
  *(void *)a2 = v11;
  *(void *)(a2 + 8) = v12;
  *(void *)(a2 + 16) = a1;
  *(void *)(a2 + 24) = v2;
  *(void *)(a2 + 32) = v3;
  *(void *)(a2 + 40) = v4;
  *(void *)(a2 + 48) = v5;
  *(void *)(a2 + 56) = v6;
  *(unsigned char *)(a2 + 64) = v13;
}

uint64_t sub_25BE6FBFC()
{
  uint64_t result = sub_25BE6E114();
  if (result)
  {
    OUTLINED_FUNCTION_64_0();
    if (v2)
    {
      swift_bridgeObjectRelease();
      return 0;
    }
    else
    {
      unint64_t v3 = sub_25BE6E500(v1);
      return -(uint64_t)(v3 & 1) ^ (v3 >> 1);
    }
  }
  return result;
}

unint64_t sub_25BE6FC44(unint64_t result, char a2, uint64_t a3)
{
  if (a2)
  {
    if ((result & 0x8000000000000000) != 0)
    {
      __break(1u);
    }
    else if (*(void *)(a3 + 16) > result)
    {
      return result;
    }
    __break(1u);
  }
  return result;
}

void sub_25BE6FC64()
{
  OUTLINED_FUNCTION_182_0();
  if (v3)
  {
    OUTLINED_FUNCTION_16_5();
    if (v5 != v6)
    {
      OUTLINED_FUNCTION_7_16();
      if (v5)
      {
        __break(1u);
        return;
      }
      OUTLINED_FUNCTION_15_4();
    }
  }
  else
  {
    int64_t v4 = v2;
  }
  int64_t v7 = *((void *)v0 + 2);
  if (v4 <= v7) {
    int64_t v8 = *((void *)v0 + 2);
  }
  else {
    int64_t v8 = v4;
  }
  if (v8)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A55B860);
    uint64_t v9 = (char *)swift_allocObject();
    size_t v10 = _swift_stdlib_malloc_size_0(v9);
    *((void *)v9 + 2) = v7;
    *((void *)v9 + 3) = 2 * v10 - 64;
  }
  else
  {
    uint64_t v9 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v11 = v9 + 32;
  uint64_t v12 = v0 + 32;
  if (v1)
  {
    if (v9 != v0 || &v12[v7] <= v11) {
      memmove(v11, v12, v7);
    }
    *((void *)v0 + 2) = 0;
  }
  else
  {
    memcpy(v11, v12, v7);
  }
  swift_bridgeObjectRelease();
}

void sub_25BE6FD38()
{
  OUTLINED_FUNCTION_182_0();
  if (v3)
  {
    OUTLINED_FUNCTION_16_5();
    if (v5 != v6)
    {
      OUTLINED_FUNCTION_7_16();
      if (v5)
      {
        __break(1u);
        return;
      }
      OUTLINED_FUNCTION_15_4();
    }
  }
  else
  {
    uint64_t v4 = v2;
  }
  uint64_t v7 = *((void *)v0 + 2);
  if (v4 <= v7) {
    uint64_t v8 = *((void *)v0 + 2);
  }
  else {
    uint64_t v8 = v4;
  }
  if (v8)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A55B868);
    uint64_t v9 = (char *)swift_allocObject();
    size_t v10 = _swift_stdlib_malloc_size_0(v9);
    OUTLINED_FUNCTION_177_0(v10);
  }
  else
  {
    uint64_t v9 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v11 = v9 + 32;
  uint64_t v12 = v0 + 32;
  if (v1)
  {
    if (v9 != v0 || &v12[24 * v7] <= v11) {
      memmove(v11, v12, 24 * v7);
    }
    *((void *)v0 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
}

void sub_25BE6FE20()
{
  OUTLINED_FUNCTION_182_0();
  if (v3)
  {
    OUTLINED_FUNCTION_16_5();
    if (v5 != v6)
    {
      OUTLINED_FUNCTION_7_16();
      if (v5)
      {
        __break(1u);
        return;
      }
      OUTLINED_FUNCTION_15_4();
    }
  }
  else
  {
    uint64_t v4 = v2;
  }
  uint64_t v7 = *((void *)v0 + 2);
  if (v4 <= v7) {
    uint64_t v8 = *((void *)v0 + 2);
  }
  else {
    uint64_t v8 = v4;
  }
  if (v8)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A55B878);
    uint64_t v9 = (char *)swift_allocObject();
    size_t v10 = _swift_stdlib_malloc_size_0(v9);
    OUTLINED_FUNCTION_177_0(v10);
  }
  else
  {
    uint64_t v9 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v11 = v9 + 32;
  uint64_t v12 = v0 + 32;
  if (v1)
  {
    if (v9 != v0 || &v12[72 * v7] <= v11) {
      memmove(v11, v12, 72 * v7);
    }
    *((void *)v0 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
}

void sub_25BE6FF08()
{
  OUTLINED_FUNCTION_182_0();
  if (v3)
  {
    OUTLINED_FUNCTION_16_5();
    if (v5 != v6)
    {
      OUTLINED_FUNCTION_7_16();
      if (v5)
      {
        __break(1u);
        return;
      }
      OUTLINED_FUNCTION_15_4();
    }
  }
  else
  {
    int64_t v4 = v2;
  }
  int64_t v7 = *((void *)v0 + 2);
  if (v4 <= v7) {
    int64_t v8 = *((void *)v0 + 2);
  }
  else {
    int64_t v8 = v4;
  }
  if (v8)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A55A950);
    uint64_t v9 = (char *)swift_allocObject();
    size_t v10 = _swift_stdlib_malloc_size_0(v9);
    *((void *)v9 + 2) = v7;
    *((void *)v9 + 3) = 2 * v10 - 64;
  }
  else
  {
    uint64_t v9 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v11 = v9 + 32;
  uint64_t v12 = v0 + 32;
  if (v1)
  {
    if (v9 != v0 || &v12[v7] <= v11) {
      memmove(v11, v12, v7);
    }
    *((void *)v0 + 2) = 0;
  }
  else
  {
    memcpy(v11, v12, v7);
  }
  swift_bridgeObjectRelease();
}

char *sub_25BE6FFDC(char *__src, uint64_t a2, char *__dst)
{
  if (__dst != __src || &__src[72 * a2] <= __dst) {
    return (char *)memmove(__dst, __src, 72 * a2);
  }
  return __src;
}

uint64_t sub_25BE7000C()
{
  return sub_25BE70054((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_25BE6FC64);
}

uint64_t sub_25BE70024()
{
  return sub_25BE70054((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_25BE6FD38);
}

uint64_t sub_25BE7003C()
{
  return sub_25BE70054((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_25BE6FE20);
}

uint64_t sub_25BE70054(uint64_t (*a1)(uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v3 = *v1;
  uint64_t result = swift_isUniquelyReferenced_nonNull_native();
  *char v1 = v3;
  if (!result)
  {
    uint64_t result = a1(result, *(void *)(v3 + 16) + 1, 1, v3);
    *char v1 = result;
  }
  return result;
}

uint64_t sub_25BE700B0(uint64_t a1)
{
  return sub_25BE700F8(a1, (uint64_t (*)(BOOL))sub_25BE6FC64);
}

uint64_t sub_25BE700C8(uint64_t a1)
{
  return sub_25BE700F8(a1, (uint64_t (*)(BOOL))sub_25BE6FD38);
}

uint64_t sub_25BE700E0(uint64_t a1)
{
  return sub_25BE700F8(a1, (uint64_t (*)(BOOL))sub_25BE6FE20);
}

uint64_t sub_25BE700F8(uint64_t result, uint64_t (*a2)(BOOL))
{
  unint64_t v3 = *(void *)(*(void *)v2 + 24);
  if (result + 1 > (uint64_t)(v3 >> 1))
  {
    uint64_t result = a2(v3 > 1);
    *(void *)uint64_t v2 = result;
  }
  return result;
}

uint64_t sub_25BE70140(void *a1, uint64_t a2, uint64_t a3)
{
  swift_isUniquelyReferenced_nonNull_native();
  uint64_t v8 = *v3;
  *unint64_t v3 = 0x8000000000000000;
  sub_25BE701D0(a1, a2, a3);
  *unint64_t v3 = v8;

  return swift_bridgeObjectRelease();
}

uint64_t sub_25BE701D0(void *a1, uint64_t a2, uint64_t a3)
{
  int64_t v4 = (void **)v3;
  uint64_t v8 = (void *)*v3;
  unint64_t v9 = sub_25BE1158C(a2, a3);
  if (__OFADD__(v8[2], (v10 & 1) == 0))
  {
    __break(1u);
    goto LABEL_13;
  }
  unint64_t v11 = v9;
  char v12 = v10;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A55B870);
  if ((sub_25BE800E0() & 1) == 0) {
    goto LABEL_5;
  }
  unint64_t v13 = sub_25BE1158C(a2, a3);
  if ((v12 & 1) != (v14 & 1))
  {
LABEL_13:
    uint64_t result = sub_25BE80580();
    __break(1u);
    return result;
  }
  unint64_t v11 = v13;
LABEL_5:
  uint64_t v15 = *v4;
  if (v12)
  {
    uint64_t v16 = v15[7] + 72 * v11;
    return sub_25BE7046C((uint64_t)a1, v16);
  }
  else
  {
    sub_25BE7DE4C(v11, a2, a3, a1, v15);
    return swift_bridgeObjectRetain();
  }
}

void *sub_25BE70308(unsigned char *a1, unsigned char *a2)
{
  if (!a1) {
    return (void *)MEMORY[0x263F8EE78];
  }
  size_t v4 = a2 - a1;
  if (a2 == a1) {
    return (void *)MEMORY[0x263F8EE78];
  }
  uint64_t result = sub_25BE0F834(a2 - a1, 0);
  if (a2 && a1 < a2)
  {
    if ((v4 & 0x8000000000000000) == 0)
    {
      char v5 = result;
      memmove(result + 4, a1, v4);
      return v5;
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_25BE70388(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A55B850);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_25BE703F0(uint64_t result, unint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, unsigned __int8 a9)
{
  if (a9 != 255) {
    return sub_25BE03FA4(result, a2, a3, a4, a5, a6, a7, a8, a9);
  }
  return result;
}

uint64_t sub_25BE70408(uint64_t result, unint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, unsigned __int8 a9)
{
  if (a9 != 255) {
    return sub_25BE03DEC(result, a2, a3, a4, a5, a6, a7, a8, a9);
  }
  return result;
}

unint64_t sub_25BE70420()
{
  unint64_t result = qword_26A55B858;
  if (!qword_26A55B858)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A55B858);
  }
  return result;
}

uint64_t sub_25BE7046C(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t OUTLINED_FUNCTION_0_14()
{
  uint64_t v3 = *(void *)(*(void *)(v0 + 480) + 16);
  return sub_25BE700F8(v3, v1);
}

uint64_t OUTLINED_FUNCTION_1_31(uint64_t a1, unint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  return sub_25BE03FA4(a1, a2, a3, a4, v12, v11, v10, v9, a9);
}

uint64_t OUTLINED_FUNCTION_2_34(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  return sub_25BE03FA4(v10, v16, v13, v11, v14, v9, v12, v15, a9);
}

uint64_t OUTLINED_FUNCTION_3_22(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  unint64_t v15 = *(void *)(v13 - 328);
  uint64_t v16 = *(void *)(v13 - 360);
  uint64_t v17 = *(void *)(v13 - 320);
  uint64_t v18 = *(void *)(v13 - 312);
  return sub_25BE03DEC(v10, v15, v16, v17, v18, v9, v12, v11, a9);
}

uint64_t OUTLINED_FUNCTION_4_20(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t v15 = v9[47];
  uint64_t v16 = v9[53];
  uint64_t v17 = v9[52];
  uint64_t v18 = v9[51];
  return sub_25BE03DEC(v11, v12, v13, v10, v15, v16, v17, v18, a9);
}

uint64_t OUTLINED_FUNCTION_5_20@<X0>(uint64_t a1@<X8>, char a2)
{
  uint64_t v9 = *(void *)(v2 + 360);
  uint64_t v10 = *(void *)(v2 + 296);
  return sub_25BE03FA4(v4, v7, a1, v3, v9, v10, v5, v6, a2);
}

uint64_t OUTLINED_FUNCTION_6_22(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  return sub_25BE03FA4(v11, v16, v14, v9, v10, v12, v13, v15, a9);
}

uint64_t OUTLINED_FUNCTION_7_20(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  return sub_25BE03FA4(a1, a2, a3, v9, v10, v11, v12, v13, a9);
}

uint64_t OUTLINED_FUNCTION_8_20(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  unint64_t v17 = *(void *)(v15 - 480);
  uint64_t v18 = *(void *)(v15 - 472);
  return sub_25BE03DEC(v13, v17, v12, v9, v18, v14, v11, v10, a9);
}

uint64_t OUTLINED_FUNCTION_9_15(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t v16 = v9[39];
  unint64_t v17 = v9[29];
  uint64_t v18 = v9[24];
  return sub_25BE03FA4(v16, v17, v12, v10, v13, v11, v18, v14, a9);
}

uint64_t OUTLINED_FUNCTION_10_16(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t v16 = *(void *)(v9 + 312);
  uint64_t v17 = *(void *)(v9 + 304);
  return sub_25BE03DEC(v14, v11, a3, v10, v16, v12, v13, v17, a9);
}

uint64_t OUTLINED_FUNCTION_11_12(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  return sub_25BE03FA4(v13, v12, v9, v11, v15, v14, v10, v16, a9);
}

uint64_t OUTLINED_FUNCTION_12_10(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  return sub_25BE03FA4(v16, v13, v9, v11, v14, v12, v10, v15, a9);
}

uint64_t OUTLINED_FUNCTION_13_12(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  return sub_25BE03FA4(v9, v10, v11, v15, v16, v13, v12, v14, a9);
}

uint64_t OUTLINED_FUNCTION_14_9(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  return sub_25BE03FA4(v9, v15, v10, v16, v13, v12, v11, v14, a9);
}

uint64_t OUTLINED_FUNCTION_15_9(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  return sub_25BE03DEC(v15, v9, v14, v11, v13, v16, v12, v10, a9);
}

uint64_t OUTLINED_FUNCTION_16_10(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t v15 = v9[17];
  uint64_t v16 = v9[18];
  uint64_t v17 = v9[22];
  uint64_t v18 = v9[19];
  return sub_25BE03DEC(v10, v11, v15, v12, v16, v17, v18, v13, a9);
}

uint64_t OUTLINED_FUNCTION_17_7(uint64_t a1, unint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  return sub_25BE03FA4(a1, a2, a3, a4, v11, v10, v9, v12, a9);
}

uint64_t OUTLINED_FUNCTION_19_7(uint64_t a1, unint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t v12 = v9[52];
  uint64_t v13 = v9[51];
  uint64_t v14 = v9[50];
  return sub_25BE03DEC(a1, a2, a3, a4, v10, v12, v13, v14, a9);
}

void OUTLINED_FUNCTION_20_6()
{
  *(void *)(v1 + 184) = v0;
  *(void *)(v1 + 240) = v2;
}

uint64_t OUTLINED_FUNCTION_21_7(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t v14 = v9[39];
  unint64_t v15 = v9[29];
  uint64_t v16 = v9[35];
  uint64_t v17 = v9[36];
  uint64_t v18 = v9[37];
  return sub_25BE03FA4(v14, v15, v16, v10, v11, v18, v12, v17, a9);
}

uint64_t OUTLINED_FUNCTION_22_7(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  return sub_25BE03DEC(a1, a2, a3, v10, v13, v12, v9, v11, a9);
}

uint64_t OUTLINED_FUNCTION_23_5(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t v16 = v9[33];
  uint64_t v17 = v9[42];
  uint64_t v18 = v9[29];
  return sub_25BE03FA4(v16, v11, v10, v17, v12, v14, v18, v13, a9);
}

uint64_t OUTLINED_FUNCTION_24_6(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t v15 = v9[50];
  unint64_t v16 = v9[51];
  uint64_t v17 = v9[54];
  uint64_t v18 = v9[49];
  return sub_25BE03DEC(v15, v16, v17, v13, v12, v10, v11, v18, a9);
}

uint64_t OUTLINED_FUNCTION_25_4@<X0>(uint64_t a1@<X2>, uint64_t a2@<X6>, uint64_t a3@<X7>, uint64_t a4@<X8>, char a5)
{
  v6[45] = v9;
  v6[46] = v11;
  v6[43] = v8;
  v6[44] = a4;
  return sub_25BE03DEC(v5, v12, a1, v7, v9, v10, a2, a3, a5);
}

uint64_t OUTLINED_FUNCTION_26_3()
{
  return sub_25BE7E830();
}

uint64_t OUTLINED_FUNCTION_28_4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  return sub_25BE03FA4(a1, v13, v9, v10, v14, v15, v12, v11, a9);
}

uint64_t OUTLINED_FUNCTION_29_4(uint64_t a1, unint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  return sub_25BE03DEC(a1, a2, a3, a4, v10, v11, v12, v9, a9);
}

uint64_t OUTLINED_FUNCTION_30_6(uint64_t a1, unint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  return sub_25BE03DEC(v12, a2, a3, a4, v9, v11, v13, v10, a9);
}

uint64_t OUTLINED_FUNCTION_31_7()
{
  uint64_t v3 = *(void *)(*(void *)(v0 + 480) + 16);
  return sub_25BE700F8(v3, v1);
}

uint64_t OUTLINED_FUNCTION_34_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t v18 = *(void *)(v9 + 400);
  return sub_25BE03DEC(v12, v13, v16, v10, v15, v18, v14, v11, a9);
}

uint64_t OUTLINED_FUNCTION_35_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  *(void *)(v10 + 400) = v12;
  return sub_25BE03DEC(v13, v14, v17, v11, v16, v12, v15, v9, a9);
}

uint64_t OUTLINED_FUNCTION_36_1(uint64_t a1, unint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  return sub_25BE03FA4(a1, a2, a3, a4, a5, a6, v9, v10, a9);
}

uint64_t OUTLINED_FUNCTION_37_3(uint64_t a1, unint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t v12 = *(void *)(v9 + 232);
  return sub_25BE03FA4(a1, a2, a3, a4, a5, a6, v12, v10, a9);
}

uint64_t OUTLINED_FUNCTION_38_4(uint64_t a1, unint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  return sub_25BE03FA4(a1, a2, a3, a4, v12, v11, v10, v9, a9);
}

uint64_t OUTLINED_FUNCTION_39_2(uint64_t a1, unint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  return sub_25BE03DEC(a1, a2, a3, a4, v12, v11, v10, v9, a9);
}

uint64_t OUTLINED_FUNCTION_40_3()
{
  return sub_25BE03DEC(v4, v1, v6, v7, v0, v5, v3, v8, v2);
}

uint64_t OUTLINED_FUNCTION_41_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t v16 = v9[34];
  unint64_t v17 = v9[35];
  uint64_t v18 = v9[50];
  return sub_25BE03DEC(v16, v17, v11, v12, v18, v14, v10, v13, a9);
}

uint64_t OUTLINED_FUNCTION_42_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t v16 = v9[30];
  uint64_t v17 = v9[31];
  uint64_t v18 = v9[38];
  return sub_25BE03DEC(v13, v10, v14, v12, v11, v16, v17, v18, a9);
}

uint64_t OUTLINED_FUNCTION_43_2()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_44_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  return sub_25BE03FA4(v16, v13, v15, v11, v14, v12, v10, v9, a9);
}

uint64_t OUTLINED_FUNCTION_45_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  return sub_25BE03FA4(v11, v10, v14, v13, v16, v15, v12, v9, a9);
}

uint64_t OUTLINED_FUNCTION_46_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t v18 = *(void *)(v9 + 360);
  return sub_25BE03DEC(v11, v16, v14, v10, v18, v12, v13, v15, a9);
}

uint64_t OUTLINED_FUNCTION_47_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  return sub_25BE03DEC(v9, v12, v11, v14, v13, v16, v10, v15, a9);
}

uint64_t OUTLINED_FUNCTION_50_3()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_51_3()
{
  uint64_t result = v2;
  *(void *)(v1 + 416) = v0;
  return result;
}

uint64_t OUTLINED_FUNCTION_53_2()
{
  return sub_25BE70054(v0);
}

uint64_t OUTLINED_FUNCTION_54_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35)
{
  return sub_25BE03FA4(v37, v39, v38, v35, a27, a35, a31, a29, v36);
}

uint64_t OUTLINED_FUNCTION_55_2()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_56_2()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_58_3()
{
  sub_25BE040D0(v0, v2, v1, 6);
  return sub_25BE040D0(v0, v2, v1, 6);
}

uint64_t OUTLINED_FUNCTION_59_2()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_63_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t v17 = *(void *)(v9 + 400);
  return sub_25BE03DEC(a1, v15, v11, v12, v17, v14, v10, v13, a9);
}

uint64_t OUTLINED_FUNCTION_66_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  return sub_25BE03FA4(v12, v10, v14, v9, v15, v16, v13, v11, a9);
}

void OUTLINED_FUNCTION_67_1()
{
  uint64_t v3 = *(void *)(v0 + 480);
  *(void *)(v3 + 16) = v1 + 1;
  *(unsigned char *)(v3 + v1 + 32) = v2;
}

uint64_t OUTLINED_FUNCTION_68_2()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_69_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  unint64_t v14 = v9[48];
  uint64_t v15 = v9[49];
  uint64_t v16 = v9[51];
  uint64_t v17 = v9[52];
  uint64_t v18 = v9[53];
  return sub_25BE03DEC(v10, v14, v15, v12, v16, v11, v17, v18, a9);
}

uint64_t OUTLINED_FUNCTION_70_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  return sub_25BE03FA4(v16, v13, v12, v11, v9, v10, v15, v14, a9);
}

uint64_t OUTLINED_FUNCTION_71_1()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_72_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  return sub_25BE03FA4(v10, v16, v14, v12, v9, v11, v15, v13, a9);
}

uint64_t OUTLINED_FUNCTION_73_0()
{
  return sub_25BE7E830();
}

uint64_t OUTLINED_FUNCTION_74_0(uint64_t result)
{
  *(void *)(v1 + 224) = result;
  return result;
}

void OUTLINED_FUNCTION_77_0()
{
  sub_25BE6FF08();
}

uint64_t OUTLINED_FUNCTION_78_0(uint64_t a1, unint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  return sub_25BE03FA4(a1, a2, a3, a4, a5, a6, v9, v10, a9);
}

uint64_t OUTLINED_FUNCTION_79_0()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_80_0()
{
  return v0;
}

size_t OUTLINED_FUNCTION_81_0(const void *a1)
{
  *(void *)(v1 + 216) = v2;
  return _swift_stdlib_malloc_size_0(a1);
}

uint64_t OUTLINED_FUNCTION_82_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  unint64_t v14 = v9[48];
  uint64_t v15 = v9[49];
  uint64_t v16 = v9[51];
  uint64_t v17 = v9[52];
  return sub_25BE03DEC(a1, v14, v12, v15, v11, v10, v16, v17, a9);
}

Swift::Int OUTLINED_FUNCTION_85_0()
{
  v3._rawValue = *(void **)(v0 + 480);
  *((void *)v3._rawValue + 2) = v1 + 1;
  *((unsigned char *)v3._rawValue + v1 + 32) = 0;
  return ByteBuffer.writeBytes(_:)(v3);
}

uint64_t OUTLINED_FUNCTION_87(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  return sub_25BE03FA4(a1, v9, v11, v13, v14, v10, v15, v12, a9);
}

uint64_t OUTLINED_FUNCTION_88()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_91_0()
{
  return swift_retain();
}

uint64_t OUTLINED_FUNCTION_93_0(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  return sub_25BE03DEC(a1, a2, a3, v10, v13, v11, v12, v9, a9);
}

uint64_t OUTLINED_FUNCTION_100_0(uint64_t a1)
{
  unint64_t v2 = (2 * a1) ^ (a1 >> 63);
  return sub_25BE6DEC4(v2);
}

uint64_t OUTLINED_FUNCTION_101_0()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_102_0()
{
  return swift_retain();
}

uint64_t OUTLINED_FUNCTION_103_0()
{
  uint64_t v2 = *(void *)(v0 + 480);
  *(void *)(v2 + 16) = v1 + 1;
  *(unsigned char *)(v2 + v1 + 32) = 0;
  return v2;
}

uint64_t OUTLINED_FUNCTION_104_0()
{
  return sub_25BE70054(v0);
}

uint64_t OUTLINED_FUNCTION_105_0(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  return sub_25BE03FA4(a1, a2, v11, v9, v12, v13, v14, v10, a9);
}

uint64_t OUTLINED_FUNCTION_106_0()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_107_0(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t v12 = v9[32];
  uint64_t v13 = v9[33];
  uint64_t v14 = v9[48];
  return sub_25BE03DEC(v12, a2, a3, v14, v13, v10, a7, a8, a9);
}

Swift::Int OUTLINED_FUNCTION_108_0()
{
  *((void *)v0._rawValue + 2) = v1;
  *((unsigned char *)v0._rawValue + v2 + 32) = 0;
  return ByteBuffer.writeBytes(_:)(v0);
}

uint64_t OUTLINED_FUNCTION_109_0()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_112_0@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X7>, uint64_t a4@<X8>)
{
  v4[35] = a2;
  v4[36] = a3;
  v4[29] = v5;
  v4[44] = a4;
  return __swift_instantiateConcreteTypeFromMangledName(a1);
}

uint64_t OUTLINED_FUNCTION_113_0(uint64_t result)
{
  *(void *)(v1 + 280) = result;
  return result;
}

uint64_t OUTLINED_FUNCTION_114_0(uint64_t a1, unint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  *(void *)(v9 + 184) = v10;
  return sub_25BE03DEC(a1, a2, a3, a4, a5, a6, v11, v10, a9);
}

uint64_t OUTLINED_FUNCTION_115_0(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  return sub_25BE03FA4(a1, a2, a3, v13, v10, v11, v12, v9, a9);
}

uint64_t OUTLINED_FUNCTION_117_0()
{
  return *(void *)(v0 + 16);
}

uint64_t OUTLINED_FUNCTION_118_0()
{
  return swift_retain();
}

uint64_t OUTLINED_FUNCTION_121_0()
{
  return v0;
}

BOOL OUTLINED_FUNCTION_122_0@<W0>(unint64_t a1@<X8>)
{
  return a1 > 1;
}

void OUTLINED_FUNCTION_123_0()
{
  sub_25BE6FF08();
}

Swift::Int OUTLINED_FUNCTION_124_0(Swift::OpaquePointer a1)
{
  return ByteBuffer.writeBytes(_:)(a1);
}

void OUTLINED_FUNCTION_125_0()
{
  *(void *)(v0 + 160) = v1;
}

uint64_t OUTLINED_FUNCTION_126_0()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_127_0(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  return sub_25BE03DEC(a1, a2, a3, v11, v13, v12, v10, v9, a9);
}

uint64_t OUTLINED_FUNCTION_128_0()
{
  return v0;
}

void OUTLINED_FUNCTION_131_0()
{
  uint64_t v3 = *(void *)(v0 + 480);
  *(void *)(v3 + 16) = v1 + 1;
  *(unsigned char *)(v3 + v1 + 32) = v2;
}

uint64_t OUTLINED_FUNCTION_132_0()
{
  uint64_t v3 = *(void *)(*(void *)(v0 + 480) + 16);
  return sub_25BE700F8(v3, v1);
}

uint64_t OUTLINED_FUNCTION_139_0()
{
  return v0;
}

void OUTLINED_FUNCTION_141_0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v6[16] = a3;
  v6[17] = v5;
  v6[20] = v3;
  v6[23] = v4;
  v6[30] = v7;
}

uint64_t OUTLINED_FUNCTION_142_0()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_143_0()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_144_0()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_146_0()
{
  return sub_25BE6DEC4(v0);
}

uint64_t OUTLINED_FUNCTION_148_0()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_150_0(uint64_t a1, unint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  return sub_25BE03FA4(a1, a2, a3, a4, a5, a6, v10, v9, a9);
}

Swift::Int OUTLINED_FUNCTION_153_0()
{
  return sub_25BE6DB34(0);
}

uint64_t OUTLINED_FUNCTION_155_0()
{
  return *(void *)(v0 + 312);
}

uint64_t OUTLINED_FUNCTION_159_0()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_160_0()
{
  return sub_25BCB9998(v1, v0);
}

uint64_t OUTLINED_FUNCTION_161_0()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_164_0(uint64_t a1, unint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t v11 = *(void *)(v9 + 232);
  uint64_t v12 = *(void *)(v9 + 184);
  return sub_25BE03FA4(a1, a2, a3, a4, a5, a6, v11, v12, a9);
}

uint64_t OUTLINED_FUNCTION_165_0()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_166_0()
{
  uint64_t result = 0;
  *(void *)(v1 + 16) = v0;
  return result;
}

uint64_t OUTLINED_FUNCTION_167_0(uint64_t a1, unint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  return sub_25BE03DEC(a1, a2, a3, a4, v10, v9, a7, a8, a9);
}

uint64_t OUTLINED_FUNCTION_169_0()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_170_0()
{
  return *(void *)(v0 + 264);
}

uint64_t OUTLINED_FUNCTION_176_0()
{
  return sub_25BCB9998(v1, v0);
}

uint64_t OUTLINED_FUNCTION_177_0(uint64_t result)
{
  *(void *)(v1 + 16) = v2;
  *(void *)(v1 + 24) = 2 * ((result - 32) / v3);
  return result;
}

uint64_t OUTLINED_FUNCTION_179_0()
{
  return v0;
}

void OUTLINED_FUNCTION_183_0()
{
  *(void *)(*(void *)(v0 + 480) + 16) = v1 + 1;
}

uint64_t OUTLINED_FUNCTION_184_0()
{
  uint64_t v2 = *(void *)(v0 + 480);
  *(void *)(v2 + 16) = v1 + 1;
  return v2 + 32;
}

uint64_t OUTLINED_FUNCTION_185_0()
{
  return *(void *)(*(void *)(v0 + 480) + 16);
}

uint64_t OUTLINED_FUNCTION_191_0()
{
  return sub_25BCB9998(v1, v0);
}

uint64_t OUTLINED_FUNCTION_194_0()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_195_0()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_201_0()
{
  return sub_25BE6DEC4(v0);
}

uint64_t OUTLINED_FUNCTION_203_0(uint64_t a1)
{
  sub_25BE03F04(a1, v3, v2, 6);
  return sub_25BCBA6A8(v1, v4);
}

uint64_t OUTLINED_FUNCTION_204_0()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_205_0()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_206_0()
{
  return v0;
}

unint64_t AvroValue.schema.getter()
{
  sub_25BE660D4(v0, (uint64_t)&v29);
  sub_25BE660D4((uint64_t)&v29, (uint64_t)v38);
  switch(v41)
  {
    case 1:
      uint64_t v2 = *(void *)&v38[24];
      unint64_t v3 = (__n128 *)swift_allocObject();
      OUTLINED_FUNCTION_63_2(v3, v4, v5, v6, v7, v8, v9, v10, v29, v30, v31, v32, v33, v34, v35, v36, v37, v11, *(unint64_t *)v38);
      unint64_t v13 = v12 | 0x2000000000000000;
      goto LABEL_6;
    case 2:
      uint64_t v2 = *(void *)&v38[24];
      uint64_t v14 = (__n128 *)swift_allocObject();
      OUTLINED_FUNCTION_63_2(v14, v15, v16, v17, v18, v19, v20, v21, v29, v30, v31, v32, v33, v34, v35, v36, v37, v22, *(unint64_t *)v38);
      unint64_t v13 = v23 | 0x4000000000000000;
LABEL_6:
      *(void *)&long long v43 = v2;
      sub_25BE79E14(v0, (void (*)(void, void, void, void, void, void, void, void, char))sub_25BE03DEC);
      sub_25BE03DC0((uint64_t)&v43);
      break;
    case 3:
      long long v43 = *(_OWORD *)v38;
      long long v44 = *(_OWORD *)&v38[16];
      long long v45 = v39;
      uint64_t v46 = v40;
      uint64_t v24 = swift_allocObject();
      long long v25 = *(_OWORD *)&v38[16];
      *(_OWORD *)(v24 + 16) = *(_OWORD *)v38;
      *(_OWORD *)(v24 + 32) = v25;
      *(_OWORD *)(v24 + 48) = v39;
      *(void *)(v24 + 64) = v40;
      unint64_t v13 = v24 | 0x6000000000000000;
      sub_25BE03D68((uint64_t)&v43);
      break;
    case 4:
      uint64_t v26 = *(void *)(*(void *)v38 + 16);
      uint64_t v27 = swift_allocObject();
      *(void *)(v27 + 16) = v26;
      unint64_t v13 = v27 | 0x8000000000000000;
      swift_bridgeObjectRetain();
      break;
    default:
      v42[0] = *(_OWORD *)v38;
      *(long long *)((char *)v42 + 9) = *(_OWORD *)&v38[9];
      sub_25BE721EC(v42, v47);
      sub_25BE721EC(v47, &v43);
      char v1 = 6;
      switch(BYTE8(v44))
      {
        case 1:
          sub_25BE79E14(v0, (void (*)(void, void, void, void, void, void, void, void, char))sub_25BE03FA4);
          char v1 = 2;
          break;
        case 2:
          sub_25BE79E14(v0, (void (*)(void, void, void, void, void, void, void, void, char))sub_25BE03FA4);
          char v1 = 3;
          break;
        case 3:
          sub_25BE79E14(v0, (void (*)(void, void, void, void, void, void, void, void, char))sub_25BE03FA4);
          char v1 = 4;
          break;
        case 4:
          sub_25BE79E14(v0, (void (*)(void, void, void, void, void, void, void, void, char))sub_25BE03FA4);
          char v1 = 5;
          break;
        case 5:
          break;
        case 6:
          sub_25BE72204(&v43, (uint64_t)v48);
          char v1 = 7;
          break;
        case 7:
          sub_25BE79E14(v0, (void (*)(void, void, void, void, void, void, void, void, char))sub_25BE03FA4);
          char v1 = 0;
          break;
        default:
          sub_25BE79E14(v0, (void (*)(void, void, void, void, void, void, void, void, char))sub_25BE03FA4);
          char v1 = 1;
          break;
      }
      unint64_t v13 = swift_allocObject();
      *(unsigned char *)(v13 + 16) = v1;
      break;
  }
  return v13;
}

void AvroValue.init(_:)(uint64_t a1@<X8>, uint64_t a2@<X0>, uint64_t a3@<X1>, uint64_t a4@<X2>, uint64_t a5@<X3>)
{
  *(void *)a1 = a2;
  *(void *)(a1 + 8) = a3;
  *(void *)(a1 + 16) = a4;
  *(void *)(a1 + 24) = a5;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  OUTLINED_FUNCTION_53_3(a1);
}

{
  *(void *)a1 = a2;
  *(void *)(a1 + 8) = a3;
  *(void *)(a1 + 16) = a4;
  *(void *)(a1 + 24) = a5;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  OUTLINED_FUNCTION_53_3(a1);
}

uint64_t AvroMap.init(schema:)()
{
  return OUTLINED_FUNCTION_42_2();
}

void __swiftcall AvroRecord.init(schema:)(SwiftAvro::AvroRecord *__return_ptr retstr, SwiftAvro::AvroRecordSchema *schema)
{
  uint64_t countAndFlagsBits = schema->type._countAndFlagsBits;
  uint64_t object = schema->type._object;
  uint64_t v5 = schema->name._countAndFlagsBits;
  uint64_t v6 = schema->name._object;
  Swift::String_optional v7 = schema->namespace;
  rawValue = (unint64_t *)schema->fields._rawValue;
  __n128 v22 = rawValue;
  int64_t v9 = rawValue[2];
  uint64_t v10 = (void *)MEMORY[0x263F8EE78];
  if (v9)
  {
    uint64_t v16 = v6;
    uint64_t v17 = v5;
    uint64_t v18 = object;
    uint64_t v19 = countAndFlagsBits;
    Swift::String_optional v20 = v7;
    sub_25BE03D68((uint64_t)schema);
    sub_25BE72584((uint64_t)&v22);
    sub_25BE7742C(0, v9, 0);
    uint64_t v12 = rawValue + 6;
    do
    {
      unint64_t v13 = *v12;
      swift_retain();
      swift_bridgeObjectRetain();
      sub_25BE58DA0(v13, (uint64_t)__src);
      swift_release();
      swift_bridgeObjectRelease();
      unint64_t v15 = v10[2];
      unint64_t v14 = v10[3];
      if (v15 >= v14 >> 1) {
        sub_25BE7742C(v14 > 1, v15 + 1, 1);
      }
      v10[2] = v15 + 1;
      memcpy(&v10[9 * v15 + 4], __src, 0x41uLL);
      v12 += 3;
      --v9;
    }
    while (v9);
    sub_25BE5E10C((uint64_t)schema);
    sub_25BE03DC0((uint64_t)&v22);
    Swift::String_optional v7 = v20;
    uint64_t object = v18;
    uint64_t countAndFlagsBits = v19;
    uint64_t v6 = v16;
    uint64_t v5 = v17;
  }
  retstr->schema.type._uint64_t countAndFlagsBits = countAndFlagsBits;
  retstr->schema.type._uint64_t object = object;
  retstr->schema.name._uint64_t countAndFlagsBits = v5;
  retstr->schema.name._uint64_t object = v6;
  retstr->schema.namespace = v7;
  retstr->schema.fields._rawValue = rawValue;
  retstr->fields._rawValue = v10;
}

void AvroValue.init(_:)(uint64_t a1@<X8>, uint64_t a2@<X0>)
{
  uint64_t v2 = *(void *)(a2 + 16);
  uint64_t v3 = *(void *)(a2 + 24);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = v2;
  *(void *)(a1 + 24) = v3;
  long long v4 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v4;
  OUTLINED_FUNCTION_53_3(a1);
}

double AvroValue.init(_:)()
{
  uint64_t v0 = swift_allocObject();
  OUTLINED_FUNCTION_52_2(v0);
  return OUTLINED_FUNCTION_11_13();
}

uint64_t sub_25BE7215C()
{
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_25BE72194()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 72, 7);
}

_OWORD *sub_25BE721EC(long long *a1, _OWORD *a2)
{
  long long v2 = *a1;
  *(_OWORD *)((char *)a2 + 9) = *(long long *)((char *)a1 + 9);
  *a2 = v2;
  return a2;
}

uint64_t sub_25BE72204(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  *(void *)(a2 + 16) = *((void *)a1 + 2);
  *(_OWORD *)a2 = v2;
  return a2;
}

uint64_t sub_25BE7221C()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

void *AvroValue.null.unsafeMutableAddressor()
{
  return &static AvroValue.null;
}

double static AvroValue.int(_:)@<D0>(void *a1@<X8>, unsigned int a2@<W0>)
{
  *a1 = a2;
  a1[1] = 0;
  a1[2] = 0;
  a1[3] = 1;
  return OUTLINED_FUNCTION_0_15((uint64_t)a1);
}

double static AvroValue.long(_:)@<D0>(void *a1@<X8>, uint64_t a2@<X0>)
{
  *a1 = a2;
  a1[1] = 0;
  a1[2] = 0;
  a1[3] = 2;
  return OUTLINED_FUNCTION_0_15((uint64_t)a1);
}

double static AvroValue.float(_:)@<D0>(void *a1@<X8>, unsigned int a2@<S0>)
{
  *a1 = a2;
  a1[1] = 0;
  a1[2] = 0;
  a1[3] = 3;
  return OUTLINED_FUNCTION_0_15((uint64_t)a1);
}

double static AvroValue.double(_:)@<D0>(uint64_t a1@<X8>, double a2@<D0>)
{
  *(double *)a1 = a2;
  *(void *)(a1 + 8) = 0;
  *(void *)(a1 + 16) = 0;
  *(void *)(a1 + 24) = 4;
  return OUTLINED_FUNCTION_0_15(a1);
}

uint64_t static AvroValue.string(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  *(void *)a3 = a1;
  *(void *)(a3 + 8) = a2;
  *(_OWORD *)(a3 + 16) = xmmword_25BE99130;
  *(_OWORD *)(a3 + 32) = 0u;
  *(_OWORD *)(a3 + 48) = 0u;
  *(unsigned char *)(a3 + 64) = 0;
  return swift_bridgeObjectRetain();
}

uint64_t static AvroValue.bytes(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = a1;
  *(void *)(a2 + 8) = 0;
  *(void *)(a2 + 16) = 0;
  *(void *)(a2 + 24) = 6;
  *(_OWORD *)(a2 + 32) = 0u;
  *(_OWORD *)(a2 + 48) = 0u;
  *(unsigned char *)(a2 + 64) = 0;
  return swift_bridgeObjectRetain();
}

void AvroRecord.set(_:forField:)(const void *a1, uint64_t a2, uint64_t a3)
{
  swift_bridgeObjectRetain();
  uint64_t v7 = swift_bridgeObjectRetain();
  unint64_t v8 = sub_25BE725C8(v7, a2, a3);
  char v10 = v9;
  swift_bridgeObjectRelease();
  if (v10)
  {
    sub_25BE70420();
    OUTLINED_FUNCTION_2_1();
    *uint64_t v12 = a2;
    v12[1] = a3;
    swift_bridgeObjectRetain();
    swift_willThrow();
    return;
  }
  uint64_t v11 = *(void *)(v3 + 56);
  if (swift_isUniquelyReferenced_nonNull_native())
  {
    if ((v8 & 0x8000000000000000) == 0) {
      goto LABEL_4;
    }
  }
  else
  {
    sub_25BE77404();
    uint64_t v11 = v13;
    if ((v8 & 0x8000000000000000) == 0)
    {
LABEL_4:
      if (v8 < *(void *)(v11 + 16))
      {
        AvroValue.update(_:)(a1);
        *(void *)(v3 + 56) = v11;
        return;
      }
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_9:
  __break(1u);
}

__n128 static AvroValue.record(_:)@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  long long v7 = *(_OWORD *)(a1 + 16);
  long long v8 = *(_OWORD *)a1;
  __n128 v6 = *(__n128 *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 48);
  uint64_t v4 = *(void *)(a1 + 56);
  sub_25BE612E8(a1);
  *(_OWORD *)a2 = v8;
  *(_OWORD *)(a2 + 16) = v7;
  __n128 result = v6;
  *(__n128 *)(a2 + 32) = v6;
  *(void *)(a2 + 48) = v3;
  *(void *)(a2 + 56) = v4;
  *(unsigned char *)(a2 + 64) = 3;
  return result;
}

uint64_t sub_25BE72444(unint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 16);
  if (!v2) {
    return 0;
  }
  unint64_t v5 = *(void *)(a2 + 32);
  swift_retain();
  LOBYTE(v5) = _s9SwiftAvro0B6SchemaV23__derived_struct_equalsySbAC_ACtFZ_0(v5, a1);
  swift_release();
  if (v5) {
    return 0;
  }
  uint64_t v6 = 0;
  while (v2 - 1 != v6)
  {
    unint64_t v7 = *(void *)(a2 + 40 + 8 * v6);
    swift_retain();
    LOBYTE(v7) = _s9SwiftAvro0B6SchemaV23__derived_struct_equalsySbAC_ACtFZ_0(v7, a1);
    swift_release();
    ++v6;
    if (v7) {
      return v6;
    }
  }
  return 0;
}

uint64_t sub_25BE72524(unsigned __int8 a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = 0;
  uint64_t v5 = a3 - a2;
  if (a2)
  {
    while (1)
    {
      if (v5 == result) {
        return 0;
      }
      if (*(unsigned __int8 *)(a2 + result) == a1) {
        return result;
      }
      if (v5 <= result) {
        break;
      }
      ++result;
    }
    __break(1u);
  }
  return result;
}

uint64_t sub_25BE72584(uint64_t a1)
{
  return a1;
}

BOOL AvroMap.isEmpty.getter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return *(void *)(a4 + 16) == 0;
}

uint64_t AvroMap.count.getter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return *(void *)(a4 + 16);
}

uint64_t sub_25BE725C8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 16);
  if (v4)
  {
    uint64_t v6 = 0;
    unint64_t v7 = (void *)(a1 + 40);
    while (1)
    {
      BOOL v8 = *(v7 - 1) == a2 && *v7 == a3;
      if (v8 || (sub_25BE80440() & 1) != 0) {
        break;
      }
      v7 += 3;
      if (v4 == ++v6) {
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    uint64_t v6 = 0;
  }
  swift_bridgeObjectRelease();
  return v6;
}

uint64_t static AvroValue.array(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  return sub_25BE7276C(a1, a2, a3, a4, 1, a5);
}

uint64_t AvroMap.set(_:forKey:)(void *a1, uint64_t a2, uint64_t a3)
{
  unint64_t v7 = *(void *)(v3 + 16);
  swift_retain();
  char v8 = sub_25BE58C30((uint64_t)a1, v7);
  swift_release();
  if (v8)
  {
    swift_bridgeObjectRetain();
    sub_25BE79E14((uint64_t)a1, (void (*)(void, void, void, void, void, void, void, void, char))sub_25BE03DEC);
    sub_25BE70140(a1, a2, a3);
    return swift_bridgeObjectRelease();
  }
  else
  {
    swift_retain();
    unint64_t v10 = AvroValue.schema.getter();
    sub_25BE774A8();
    OUTLINED_FUNCTION_2_1();
    *uint64_t v11 = v7;
    v11[1] = v10;
    return swift_willThrow();
  }
}

uint64_t static AvroValue.map(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  return sub_25BE7276C(a1, a2, a3, a4, 2, a5);
}

uint64_t sub_25BE7276C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, char a5@<W4>, uint64_t a6@<X8>)
{
  *(void *)a6 = a1;
  *(void *)(a6 + 8) = a2;
  *(void *)(a6 + 16) = a3;
  *(void *)(a6 + 24) = a4;
  *(_OWORD *)(a6 + 32) = 0u;
  *(_OWORD *)(a6 + 48) = 0u;
  *(unsigned char *)(a6 + 64) = a5;
  swift_bridgeObjectRetain();
  swift_retain();

  return swift_bridgeObjectRetain();
}

uint64_t sub_25BE727C8@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  if (a3 < 0 || *(void *)(result + 16) <= a3)
  {
    sub_25BE80060();
    sub_25BE7FCD0();
    swift_bridgeObjectRelease();
    sub_25BE802D0();
    sub_25BE7FCD0();
    swift_bridgeObjectRelease();
    sub_25BE7FCD0();
    sub_25BE802D0();
    sub_25BE7FCD0();
    swift_bridgeObjectRelease();
    sub_25BE7FCD0();
    sub_25BE79E68();
    OUTLINED_FUNCTION_2_1();
    *char v8 = 0;
    v8[1] = 0xE000000000000000;
    swift_willThrow();
    return sub_25BE79E14(a2, (void (*)(void, void, void, void, void, void, void, void, char))sub_25BE03FA4);
  }
  else
  {
    char v5 = *(unsigned char *)(a2 + 64);
    *(void *)a4 = result;
    long long v6 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)(a4 + 8) = *(_OWORD *)a2;
    *(_OWORD *)(a4 + 24) = v6;
    long long v7 = *(_OWORD *)(a2 + 48);
    *(_OWORD *)(a4 + 40) = *(_OWORD *)(a2 + 32);
    *(_OWORD *)(a4 + 56) = v7;
    *(unsigned char *)(a4 + 72) = v5;
    *(void *)(a4 + 80) = a3;
  }
  return result;
}

uint64_t SchemaMismatchError.expected.getter(uint64_t a1)
{
  return a1;
}

uint64_t SchemaMismatchError.expected.setter(uint64_t a1)
{
  uint64_t result = swift_release();
  *char v1 = a1;
  return result;
}

uint64_t (*SchemaMismatchError.expected.modify())()
{
  return nullsub_1;
}

uint64_t SchemaMismatchError.actual.getter(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t SchemaMismatchError.actual.setter(uint64_t a1)
{
  uint64_t result = swift_release();
  *(void *)(v1 + 8) = a1;
  return result;
}

uint64_t (*SchemaMismatchError.actual.modify())()
{
  return nullsub_1;
}

uint64_t SchemaMismatchError.description.getter()
{
  OUTLINED_FUNCTION_40_4();
  sub_25BE80060();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_17_8();
  swift_retain();
  AvroSchema.description.getter(v1);
  OUTLINED_FUNCTION_36_2();
  swift_release();
  swift_bridgeObjectRelease();
  sub_25BE7FCD0();
  swift_retain();
  AvroSchema.description.getter(v0);
  sub_25BE7FCD0();
  swift_release();
  swift_bridgeObjectRelease();
  sub_25BE7FCD0();
  return v3;
}

uint64_t SchemaMismatchError.hash(into:)()
{
  OUTLINED_FUNCTION_16_9();
  swift_retain();
  sub_25BE59B50(v2, v1);
  swift_release();
  OUTLINED_FUNCTION_34_4();
  sub_25BE59B50(v2, v0);

  return swift_release();
}

uint64_t static SchemaMismatchError.__derived_struct_equals(_:_:)(unint64_t a1, uint64_t a2, unint64_t a3)
{
  if ((_s9SwiftAvro0B6SchemaV23__derived_struct_equalsySbAC_ACtFZ_0(a1, a3) & 1) == 0) {
    return 0;
  }
  unint64_t v3 = OUTLINED_FUNCTION_7();

  return _s9SwiftAvro0B6SchemaV23__derived_struct_equalsySbAC_ACtFZ_0(v3, v4);
}

uint64_t SchemaMismatchError.hashValue.getter(unint64_t a1, unint64_t a2)
{
  OUTLINED_FUNCTION_2_25();
  swift_retain();
  sub_25BE59B50((uint64_t)v5, a1);
  swift_release();
  OUTLINED_FUNCTION_34_4();
  sub_25BE59B50((uint64_t)v5, a2);
  swift_release();
  return sub_25BE80640();
}

uint64_t sub_25BE72C90()
{
  return SchemaMismatchError.hashValue.getter(*v0, v0[1]);
}

uint64_t sub_25BE72C98()
{
  return SchemaMismatchError.hash(into:)();
}

uint64_t sub_25BE72CA0()
{
  unint64_t v1 = *v0;
  unint64_t v2 = v0[1];
  sub_25BE805F0();
  swift_retain();
  sub_25BE59B50((uint64_t)v4, v1);
  swift_release();
  swift_retain();
  sub_25BE59B50((uint64_t)v4, v2);
  swift_release();
  return sub_25BE80640();
}

uint64_t sub_25BE72D20()
{
  return SchemaMismatchError.description.getter();
}

uint64_t sub_25BE72D28(uint64_t a1, unint64_t *a2)
{
  return static SchemaMismatchError.__derived_struct_equals(_:_:)(*(void *)a1, *(void *)(a1 + 8), *a2);
}

uint64_t (*InvalidFieldError.name.modify())()
{
  return nullsub_1;
}

unint64_t InvalidFieldError.description.getter()
{
  return 0xD000000000000018;
}

unint64_t sub_25BE72DFC()
{
  return InvalidFieldError.description.getter();
}

uint64_t InternalError.description.getter()
{
  return OUTLINED_FUNCTION_7();
}

uint64_t InternalError.description.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *unint64_t v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*InternalError.description.modify())()
{
  return nullsub_1;
}

uint64_t _s9SwiftAvro17InvalidFieldErrorV4hash4intoys6HasherVz_tF_0()
{
  OUTLINED_FUNCTION_16_9();
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_42_2();
  sub_25BE7FCB0();

  return swift_bridgeObjectRelease();
}

uint64_t _s9SwiftAvro17InvalidFieldErrorV23__derived_struct_equalsySbAC_ACtFZ_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a1 == a3 && a2 == a4) {
    return 1;
  }
  else {
    return sub_25BE80440();
  }
}

uint64_t _s9SwiftAvro17InvalidFieldErrorV9hashValueSivg_0()
{
  return sub_25BE80640();
}

uint64_t sub_25BE72F5C(uint64_t a1)
{
  sub_25BE660D4(v1, (uint64_t)v22);
  uint64_t v3 = v22[0];
  unint64_t v4 = v22[1];
  uint64_t v5 = v22[2];
  char v6 = v23;
  sub_25BE660D4(v1, (uint64_t)&v24);
  switch(v29)
  {
    case 1:
      sub_25BE80600();
      swift_retain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      uint64_t v10 = OUTLINED_FUNCTION_45_2();
      AvroArray.hash(into:)(v10, v11, v12, v13, v14);
      goto LABEL_5;
    case 2:
      sub_25BE80600();
      swift_retain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      uint64_t v15 = OUTLINED_FUNCTION_45_2();
      AvroMap.hash(into:)(v15, v16, v17, v18, v19);
LABEL_5:
      swift_bridgeObjectRelease();
      swift_release();
      goto LABEL_7;
    case 3:
      long long v30 = v24;
      long long v31 = v25;
      long long v32 = v26;
      uint64_t v20 = v28;
      uint64_t v33 = v27;
      sub_25BE80600();
      __dst[0] = v30;
      __dst[1] = v31;
      __dst[2] = v32;
      *(void *)&__dst[3] = v33;
      sub_25BE03D68((uint64_t)__dst);
      AvroRecordSchema.hash(into:)();
      sub_25BE5E10C((uint64_t)__dst);
      swift_bridgeObjectRetain();
      sub_25BE5E1DC(a1, v20);
LABEL_7:
      uint64_t result = swift_bridgeObjectRelease();
      break;
    case 4:
      memcpy(__dst, (const void *)(v24 + 16), 0x58uLL);
      sub_25BE80600();
      sub_25BE608C0((uint64_t)__dst);
      AvroUnion.hash(into:)(a1);
      uint64_t result = sub_25BE60950((uint64_t)__dst);
      break;
    default:
      long long v7 = v24;
      uint64_t v8 = v25;
      char v21 = BYTE8(v25);
      sub_25BE80600();
      sub_25BE03F04(v3, v4, v5, v6);
      sub_25BE763E4(a1, v7, *((unint64_t *)&v7 + 1), v8, v21);
      uint64_t result = sub_25BE79E14(v1, (void (*)(void, void, void, void, void, void, void, void, char))sub_25BE03FA4);
      break;
  }
  return result;
}

uint64_t sub_25BE731AC(uint64_t a1, uint64_t a2)
{
  sub_25BE660D4(a1, (uint64_t)&v140);
  switch((char)v145)
  {
    case 1:
      long long v146 = v140;
      long long v14 = v141;
      uint64_t v15 = OUTLINED_FUNCTION_21_8();
      if (v23 != 1) {
        goto LABEL_33;
      }
      OUTLINED_FUNCTION_12_11(v15, v16, v17, v18, v19, v20, v21, v22, v91, v95, v98, v101, v103, v105, v107, v109, v111, v113, v115,
        v117,
        v119,
        v120,
        v121,
        v123,
        v124,
        v126,
        v127,
        v128,
        v129,
        v131,
        v134,
        *((uint64_t *)&v134 + 1),
        v135,
        *((uint64_t *)&v135 + 1),
        v136,
        *((uint64_t *)&v136 + 1),
        v137,
        v138,
        v139,
        v140,
        *((uint64_t *)&v140 + 1),
        v141,
        *((uint64_t *)&v141 + 1),
        v142,
        *((uint64_t *)&v142 + 1),
        v143,
        v144,
        v145,
        v146);
      BOOL v26 = v26 && v24 == v25;
      if (!v26 && (sub_25BE80440() & 1) == 0) {
        goto LABEL_33;
      }
      unint64_t v150 = v14;
      unint64_t v151 = v2;
      sub_25BE4DBE8((uint64_t)&v134);
      sub_25BE7766C((uint64_t)&v150);
      swift_bridgeObjectRetain();
      sub_25BE4DBE8((uint64_t)&v152);
      sub_25BE7766C((uint64_t)&v151);
      swift_bridgeObjectRetain();
      if ((_s9SwiftAvro0B6SchemaV23__derived_struct_equalsySbAC_ACtFZ_0(v14, v2) & 1) == 0) {
        goto LABEL_31;
      }
      char v27 = sub_25BE5B45C(*((uint64_t *)&v14 + 1), (uint64_t)&v158);
      goto LABEL_20;
    case 2:
      long long v146 = v140;
      unint64_t v28 = v141;
      uint64_t v29 = OUTLINED_FUNCTION_21_8();
      if (v37 != 2) {
        goto LABEL_33;
      }
      OUTLINED_FUNCTION_12_11(v29, v30, v31, v32, v33, v34, v35, v36, v91, v95, v98, v101, v103, v105, v107, v109, v111, v113, v115,
        v117,
        v119,
        v120,
        v121,
        v123,
        v124,
        v126,
        v127,
        v128,
        v129,
        v131,
        v134,
        *((uint64_t *)&v134 + 1),
        v135,
        *((uint64_t *)&v135 + 1),
        v136,
        *((uint64_t *)&v136 + 1),
        v137,
        v138,
        v139,
        v140,
        *((uint64_t *)&v140 + 1),
        v141,
        *((uint64_t *)&v141 + 1),
        v142,
        *((uint64_t *)&v142 + 1),
        v143,
        v144,
        v145,
        v146);
      BOOL v40 = v26 && v38 == v39;
      if (!v40 && (sub_25BE80440() & 1) == 0) {
        goto LABEL_33;
      }
      unint64_t v150 = v28;
      unint64_t v151 = v2;
      sub_25BE4DBE8((uint64_t)&v134);
      sub_25BE7766C((uint64_t)&v150);
      swift_bridgeObjectRetain();
      sub_25BE4DBE8((uint64_t)&v152);
      sub_25BE7766C((uint64_t)&v151);
      swift_bridgeObjectRetain();
      if ((_s9SwiftAvro0B6SchemaV23__derived_struct_equalsySbAC_ACtFZ_0(v28, v2) & 1) == 0)
      {
LABEL_31:
        sub_25BE776CC((uint64_t)&v152);
        sub_25BE7769C((uint64_t)&v151);
        swift_bridgeObjectRelease();
        sub_25BE776CC((uint64_t)&v134);
        sub_25BE7769C((uint64_t)&v150);
        swift_bridgeObjectRelease();
        goto LABEL_33;
      }
      uint64_t v41 = OUTLINED_FUNCTION_135();
      char v27 = sub_25BE75E64(v41, v42);
LABEL_20:
      char v43 = v27;
      sub_25BE776CC((uint64_t)&v152);
      sub_25BE7769C((uint64_t)&v151);
      swift_bridgeObjectRelease();
      sub_25BE776CC((uint64_t)&v134);
      sub_25BE7769C((uint64_t)&v150);
      swift_bridgeObjectRelease();
      if ((v43 & 1) == 0) {
        goto LABEL_33;
      }
      goto LABEL_30;
    case 3:
      long long v146 = v140;
      long long v147 = v141;
      long long v148 = v142;
      uint64_t v44 = v144;
      uint64_t v149 = v143;
      OUTLINED_FUNCTION_21_8();
      if (v45 != 3) {
        goto LABEL_33;
      }
      long long v152 = v158;
      long long v153 = v159;
      long long v154 = v160;
      uint64_t v46 = v162;
      uint64_t v155 = v161;
      long long v134 = v146;
      long long v135 = v147;
      long long v136 = v148;
      uint64_t v137 = v149;
      if ((static AvroRecordSchema.__derived_struct_equals(_:_:)() & 1) == 0 || (sub_25BE5B45C(v44, v46) & 1) == 0) {
        goto LABEL_33;
      }
      goto LABEL_30;
    case 4:
      uint64_t v47 = *(void *)(v140 + 24);
      uint64_t v48 = *(void *)(v140 + 40);
      uint64_t v130 = *(void *)(v140 + 16);
      unint64_t v133 = *(void *)(v140 + 32);
      uint64_t v50 = *(void *)(v140 + 48);
      uint64_t v49 = *(void *)(v140 + 56);
      uint64_t v52 = *(void *)(v140 + 64);
      uint64_t v51 = *(void *)(v140 + 72);
      uint64_t v53 = *(void *)(v140 + 80);
      char v54 = *(unsigned char *)(v140 + 88);
      uint64_t v55 = *(void *)(v140 + 96);
      sub_25BE660D4(a2, (uint64_t)&v134);
      if (v139 != 4) {
        goto LABEL_33;
      }
      uint64_t v99 = v55;
      char v56 = v54;
      uint64_t v116 = *(void *)(v134 + 32);
      uint64_t v118 = *(void *)(v134 + 24);
      uint64_t v114 = *(void *)(v134 + 40);
      uint64_t v110 = *(void *)(v134 + 16);
      uint64_t v112 = *(void *)(v134 + 48);
      uint64_t v106 = *(void *)(v134 + 64);
      uint64_t v108 = *(void *)(v134 + 56);
      uint64_t v102 = *(void *)(v134 + 80);
      uint64_t v104 = *(void *)(v134 + 72);
      int v57 = *(unsigned __int8 *)(v134 + 88);
      uint64_t v96 = *(void *)(v134 + 96);
      swift_bridgeObjectRetain();
      *(void *)&long long v122 = v48;
      *((void *)&v122 + 1) = v50;
      *(void *)&long long v125 = v49;
      *((void *)&v125 + 1) = v52;
      sub_25BE03DEC(v47, v133, v48, v50, v49, v52, v51, v53, v56);
      swift_bridgeObjectRetain();
      OUTLINED_FUNCTION_61_1();
      sub_25BE03DEC(v58, v59, v114, v112, v108, v106, v104, v102, v57);
      if (_s9SwiftAvro0B11UnionSchemaV23__derived_struct_equalsySbAC_ACtFZ_0(v130, v110))
      {
        *(void *)&long long v152 = v47;
        *((void *)&v152 + 1) = v133;
        long long v153 = v122;
        long long v154 = v125;
        uint64_t v155 = v51;
        uint64_t v156 = v53;
        char v157 = v56;
        *(void *)&long long v158 = v53;
        *((void *)&v158 + 1) = v51;
        *(void *)&long long v159 = v114;
        *((void *)&v159 + 1) = v112;
        *(void *)&long long v160 = v108;
        *((void *)&v160 + 1) = v106;
        uint64_t v161 = v104;
        uint64_t v162 = v102;
        char v163 = v57;
        sub_25BE731AC(&v152, &v158);
        swift_bridgeObjectRelease();
        uint64_t v60 = OUTLINED_FUNCTION_28_5();
        sub_25BE03FA4(v60, v61, v62, v63, v64, v65, v66, v102, v57);
        uint64_t v67 = swift_bridgeObjectRelease();
        OUTLINED_FUNCTION_27_6(v67, v68, v69, v70, v71, v72, v73, v74, v92, v96, v99, v102, v104, v106, v108, v110, v112, v114, v116,
          v118,
          v57,
          v56,
          v47,
          v122,
          v50,
          v125,
          v52,
          v51,
          v53,
          v130,
          v133);
        if ((v94 & 1) != 0 && v100 == v97)
        {
LABEL_30:
          char v13 = 1;
          return v13 & 1;
        }
      }
      else
      {
        swift_bridgeObjectRelease();
        uint64_t v75 = OUTLINED_FUNCTION_28_5();
        sub_25BE03FA4(v75, v76, v77, v78, v79, v80, v81, v102, v57);
        uint64_t v82 = swift_bridgeObjectRelease();
        OUTLINED_FUNCTION_27_6(v82, v83, v84, v85, v86, v87, v88, v89, v93, v96, v99, v102, v104, v106, v108, v110, v112, v114, v116,
          v118,
          v57,
          v56,
          v47,
          v48,
          v50,
          v49,
          v52,
          v51,
          v53,
          v130,
          v133);
      }
LABEL_33:
      char v13 = 0;
      return v13 & 1;
    default:
      OUTLINED_FUNCTION_21_8();
      if (v5) {
        goto LABEL_33;
      }
      unint64_t v6 = *((void *)&v158 + 1);
      uint64_t v132 = v158;
      uint64_t v7 = v159;
      char v8 = BYTE8(v159);
      sub_25BE79E14(a1, (void (*)(void, void, void, void, void, void, void, void, char))sub_25BE03DEC);
      sub_25BE79E14(a2, (void (*)(void, void, void, void, void, void, void, void, char))sub_25BE03DEC);
      uint64_t v9 = OUTLINED_FUNCTION_66_2();
      char v13 = _s9SwiftAvro0B9PrimitiveV23__derived_struct_equalsySbAC_ACtFZ_0(v9, v10, v11, v12, v132, v6, v7, v8);
      sub_25BE79E14(a2, (void (*)(void, void, void, void, void, void, void, void, char))sub_25BE03FA4);
      sub_25BE79E14(a1, (void (*)(void, void, void, void, void, void, void, void, char))sub_25BE03FA4);
      return v13 & 1;
  }
}

uint64_t sub_25BE736C8()
{
  sub_25BE660D4(v0, (uint64_t)v17);
  uint64_t v1 = v17[0];
  unint64_t v2 = v17[1];
  uint64_t v3 = v17[2];
  char v4 = v18;
  OUTLINED_FUNCTION_2_25();
  sub_25BE660D4(v0, (uint64_t)&v19);
  switch(v23)
  {
    case 1:
      unint64_t v8 = v20;
      *(void *)&__dst[0] = v20;
      sub_25BE80600();
      swift_bridgeObjectRetain();
      sub_25BE7766C((uint64_t)__dst);
      swift_bridgeObjectRetain();
      sub_25BE7766C((uint64_t)__dst);
      swift_bridgeObjectRetain();
      OUTLINED_FUNCTION_46_3();
      swift_retain();
      sub_25BE59B50((uint64_t)v16, v8);
      sub_25BE7769C((uint64_t)__dst);
      swift_bridgeObjectRelease();
      sub_25BE7769C((uint64_t)__dst);
      uint64_t v9 = swift_bridgeObjectRetain();
      OUTLINED_FUNCTION_72_1(v9);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_25BE7769C((uint64_t)__dst);
      goto LABEL_6;
    case 2:
      long long v10 = v20;
      sub_25BE80600();
      swift_retain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      OUTLINED_FUNCTION_37_4();
      AvroMap.hash(into:)(v11, v12, v13, v10, *((uint64_t *)&v10 + 1));
      swift_bridgeObjectRelease();
      swift_release();
      goto LABEL_6;
    case 3:
      long long v24 = v19;
      long long v25 = v20;
      long long v26 = v21;
      uint64_t v27 = v22;
      sub_25BE80600();
      __dst[0] = v24;
      __dst[1] = v25;
      __dst[2] = v26;
      *(void *)&__dst[3] = v27;
      sub_25BE03D68((uint64_t)__dst);
      AvroRecordSchema.hash(into:)();
      sub_25BE5E10C((uint64_t)__dst);
      uint64_t v14 = swift_bridgeObjectRetain();
      OUTLINED_FUNCTION_72_1(v14);
LABEL_6:
      swift_bridgeObjectRelease();
      break;
    case 4:
      memcpy(__dst, (const void *)(v19 + 16), 0x58uLL);
      sub_25BE80600();
      sub_25BE608C0((uint64_t)__dst);
      AvroUnion.hash(into:)((uint64_t)v16);
      sub_25BE60950((uint64_t)__dst);
      break;
    default:
      long long v5 = v19;
      uint64_t v6 = v20;
      char v7 = BYTE8(v20);
      sub_25BE80600();
      sub_25BE03F04(v1, v2, v3, v4);
      sub_25BE763E4((uint64_t)v16, v5, *((unint64_t *)&v5 + 1), v6, v7);
      sub_25BE79E14(v0, (void (*)(void, void, void, void, void, void, void, void, char))sub_25BE03FA4);
      break;
  }
  return sub_25BE80640();
}

uint64_t sub_25BE73980()
{
  return InternalError.hashValue.getter(*v0, v0[1]);
}

uint64_t sub_25BE73988(uint64_t a1)
{
  return InternalError.hash(into:)(a1, *v1, v1[1]);
}

uint64_t sub_25BE73990()
{
  return sub_25BE80640();
}

uint64_t sub_25BE739E8()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_25BE73A18(void *a1, void *a2)
{
  return static InternalError.__derived_struct_equals(_:_:)(*a1, a1[1], *a2, a2[1]);
}

uint64_t sub_25BE73A2C()
{
  sub_25BE660D4(v0, (uint64_t)v2);
  return sub_25BE736C8();
}

uint64_t sub_25BE73A64(uint64_t a1)
{
  sub_25BE660D4(v1, (uint64_t)v4);
  return sub_25BE72F5C(a1);
}

uint64_t sub_25BE73AA4()
{
  uint64_t v2 = *(void *)v0;
  unint64_t v1 = *(void *)(v0 + 8);
  unint64_t v4 = *(void *)(v0 + 16);
  uint64_t v3 = *(void *)(v0 + 24);
  uint64_t v6 = *(void *)(v0 + 32);
  uint64_t v5 = *(void *)(v0 + 40);
  uint64_t v8 = *(void *)(v0 + 48);
  uint64_t v7 = *(void *)(v0 + 56);
  uint64_t v9 = *(unsigned __int8 *)(v0 + 64);
  sub_25BE805F0();
  switch(v9)
  {
    case 1:
      sub_25BE80600();
      swift_retain_n();
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain();
      sub_25BE7FCB0();
      swift_retain();
      sub_25BE59B50((uint64_t)v11, v4);
      swift_bridgeObjectRelease();
      swift_release_n();
      swift_bridgeObjectRetain();
      sub_25BE5E1DC((uint64_t)v11, v3);
      swift_release();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease_n();
      break;
    case 2:
      sub_25BE80600();
      swift_retain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      AvroMap.hash(into:)((uint64_t)v11, v2, v1, v4, v3);
      swift_bridgeObjectRelease();
      swift_release();
      goto LABEL_6;
    case 3:
      sub_25BE80600();
      __dst[0] = v2;
      __dst[1] = v1;
      __dst[2] = v4;
      __dst[3] = v3;
      __dst[4] = v6;
      __dst[5] = v5;
      _OWORD __dst[6] = v8;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      AvroRecordSchema.hash(into:)();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRetain();
      sub_25BE5E1DC((uint64_t)v11, v7);
LABEL_6:
      swift_bridgeObjectRelease();
      break;
    case 4:
      memcpy(__dst, (const void *)(v2 + 16), sizeof(__dst));
      sub_25BE80600();
      sub_25BE608C0((uint64_t)__dst);
      AvroUnion.hash(into:)((uint64_t)v11);
      sub_25BE60950((uint64_t)__dst);
      break;
    default:
      sub_25BE80600();
      sub_25BE03F04(v2, v1, v4, v3);
      sub_25BE763E4((uint64_t)v11, v2, v1, v4, v3);
      sub_25BE03FA4(v2, v1, v4, v3, v6, v5, v8, v7, 0);
      break;
  }
  return sub_25BE80640();
}

uint64_t sub_25BE73D5C(uint64_t a1, uint64_t a2)
{
  sub_25BE660D4(a1, (uint64_t)v4);
  sub_25BE660D4(a2, (uint64_t)v5);
  return sub_25BE731AC((uint64_t)v4, (uint64_t)v5) & 1;
}

uint64_t AvroValue.hash(into:)(uint64_t a1)
{
  sub_25BE660D4(v1, (uint64_t)v15);
  sub_25BE660D4((uint64_t)v15, (uint64_t)v21);
  switch(v24)
  {
    case 1:
      sub_25BE80600();
      sub_25BE79E14(v1, (void (*)(void, void, void, void, void, void, void, void, char))sub_25BE03DEC);
      OUTLINED_FUNCTION_30_7();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      uint64_t v3 = OUTLINED_FUNCTION_43_3();
      AvroArray.hash(into:)(v3, v4, v5, v6, v7);
      goto LABEL_5;
    case 2:
      sub_25BE80600();
      sub_25BE79E14(v1, (void (*)(void, void, void, void, void, void, void, void, char))sub_25BE03DEC);
      OUTLINED_FUNCTION_30_7();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      uint64_t v8 = OUTLINED_FUNCTION_43_3();
      AvroMap.hash(into:)(v8, v9, v10, v11, v12);
LABEL_5:
      swift_bridgeObjectRelease();
      swift_release();
      goto LABEL_7;
    case 3:
      long long v25 = v21[0];
      long long v26 = v21[1];
      long long v27 = v21[2];
      uint64_t v13 = v23;
      uint64_t v28 = v22;
      sub_25BE80600();
      *(_OWORD *)__dst = v25;
      *(_OWORD *)&__dst[16] = v26;
      *(_OWORD *)&__dst[32] = v27;
      *(void *)&__dst[48] = v28;
      long long v16 = v25;
      long long v17 = v26;
      long long v18 = v27;
      uint64_t v19 = v28;
      sub_25BE79E14(v1, (void (*)(void, void, void, void, void, void, void, void, char))sub_25BE03DEC);
      sub_25BE03D68((uint64_t)__dst);
      AvroRecordSchema.hash(into:)();
      sub_25BE5E10C((uint64_t)__dst);
      swift_bridgeObjectRetain();
      sub_25BE5E1DC(a1, v13);
LABEL_7:
      swift_bridgeObjectRelease();
      break;
    case 4:
      memcpy(__dst, (const void *)(*(void *)&v21[0] + 16), sizeof(__dst));
      sub_25BE80600();
      sub_25BE79E14(v1, (void (*)(void, void, void, void, void, void, void, void, char))sub_25BE03DEC);
      sub_25BE608C0((uint64_t)__dst);
      AvroUnion.hash(into:)(a1);
      sub_25BE60950((uint64_t)__dst);
      break;
    default:
      OUTLINED_FUNCTION_51_4();
      sub_25BE80600();
      sub_25BE79E14(v1, (void (*)(void, void, void, void, void, void, void, void, char))sub_25BE03DEC);
      OUTLINED_FUNCTION_50_4(a1);
      break;
  }
  return sub_25BE79E14(v1, (void (*)(void, void, void, void, void, void, void, void, char))sub_25BE03FA4);
}

uint64_t static AvroValue.__derived_struct_equals(_:_:)(uint64_t a1, uint64_t a2)
{
  sub_25BE660D4(a1, (uint64_t)v5);
  sub_25BE660D4(a2, (uint64_t)v4);
  return sub_25BE731AC((uint64_t)v5, (uint64_t)v4) & 1;
}

uint64_t AvroValue.hashValue.getter()
{
  sub_25BE805F0();
  sub_25BE660D4(v0, (uint64_t)v31);
  sub_25BE660D4((uint64_t)v31, (uint64_t)&v37);
  switch(v42)
  {
    case 1:
      long long v14 = v38;
      *(void *)__dst = v38;
      sub_25BE80600();
      swift_bridgeObjectRetain();
      sub_25BE7766C((uint64_t)__dst);
      sub_25BE79E14(v0, (void (*)(void, void, void, void, void, void, void, void, char))sub_25BE03DEC);
      swift_bridgeObjectRetain();
      sub_25BE7766C((uint64_t)__dst);
      swift_bridgeObjectRetain();
      sub_25BE7FCB0();
      swift_retain();
      sub_25BE59B50((uint64_t)v30, v14);
      sub_25BE7769C((uint64_t)__dst);
      swift_bridgeObjectRelease();
      sub_25BE7769C((uint64_t)__dst);
      swift_bridgeObjectRetain();
      sub_25BE5E1DC((uint64_t)v30, *((uint64_t *)&v14 + 1));
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_25BE7769C((uint64_t)__dst);
      goto LABEL_6;
    case 2:
      uint64_t v15 = *((void *)&v38 + 1);
      sub_25BE80600();
      sub_25BE79E14(v0, (void (*)(void, void, void, void, void, void, void, void, char))sub_25BE03DEC);
      swift_retain();
      swift_bridgeObjectRetain();
      uint64_t v16 = swift_bridgeObjectRetain();
      char v24 = OUTLINED_FUNCTION_64_1(v16, v17, v18, v19, v20, v21, v22, v23, v30[0]);
      AvroMap.hash(into:)((uint64_t)v24, v25, v26, v27, v15);
      swift_bridgeObjectRelease();
      swift_release();
      goto LABEL_6;
    case 3:
      long long v43 = v37;
      long long v44 = v38;
      long long v45 = v39;
      uint64_t v28 = v41;
      uint64_t v46 = v40;
      sub_25BE80600();
      *(_OWORD *)__dst = v43;
      *(_OWORD *)&__dst[16] = v44;
      *(_OWORD *)&__dst[32] = v45;
      *(void *)&__dst[48] = v46;
      long long v32 = v43;
      long long v33 = v44;
      long long v34 = v45;
      uint64_t v35 = v46;
      sub_25BE79E14(v0, (void (*)(void, void, void, void, void, void, void, void, char))sub_25BE03DEC);
      sub_25BE03D68((uint64_t)__dst);
      AvroRecordSchema.hash(into:)();
      sub_25BE5E10C((uint64_t)__dst);
      swift_bridgeObjectRetain();
      sub_25BE5E1DC((uint64_t)v30, v28);
LABEL_6:
      swift_bridgeObjectRelease();
      break;
    case 4:
      memcpy(__dst, (const void *)(v37 + 16), sizeof(__dst));
      sub_25BE80600();
      sub_25BE79E14(v0, (void (*)(void, void, void, void, void, void, void, void, char))sub_25BE03DEC);
      sub_25BE608C0((uint64_t)__dst);
      AvroUnion.hash(into:)((uint64_t)v30);
      sub_25BE60950((uint64_t)__dst);
      break;
    default:
      char v1 = BYTE8(v38);
      sub_25BE80600();
      uint64_t v2 = sub_25BE79E14(v0, (void (*)(void, void, void, void, void, void, void, void, char))sub_25BE03DEC);
      uint64_t v10 = OUTLINED_FUNCTION_64_1(v2, v3, v4, v5, v6, v7, v8, v9, v30[0]);
      sub_25BE763E4((uint64_t)v10, v11, v12, v13, v1);
      break;
  }
  sub_25BE79E14(v0, (void (*)(void, void, void, void, void, void, void, void, char))sub_25BE03FA4);
  return sub_25BE80640();
}

uint64_t sub_25BE743C4()
{
  memcpy(__dst, v0, sizeof(__dst));
  return AvroValue.hashValue.getter();
}

uint64_t sub_25BE74400(uint64_t a1)
{
  memcpy(__dst, v1, sizeof(__dst));
  return AvroValue.hash(into:)(a1);
}

uint64_t sub_25BE74444()
{
  memcpy(__dst, v0, sizeof(__dst));
  sub_25BE805F0();
  AvroValue.hash(into:)((uint64_t)&v2);
  return sub_25BE80640();
}

uint64_t sub_25BE7449C(void *__src, const void *a2)
{
  memcpy(v4, __src, 0x41uLL);
  memcpy(__dst, a2, 0x41uLL);
  return static AvroValue.__derived_struct_equals(_:_:)((uint64_t)v4, (uint64_t)__dst) & 1;
}

uint64_t static AvroPrimitive.BOOLean(_:)(char a1)
{
  return a1 & 1;
}

double AvroValue.init(_:)@<D0>(void *a1@<X8>, unsigned int a2@<W0>)
{
  *a1 = a2;
  a1[1] = 0;
  a1[2] = 0;
  a1[3] = 1;
  return OUTLINED_FUNCTION_0_15((uint64_t)a1);
}

uint64_t static AvroPrimitive.int(_:)(uint64_t result)
{
  return result;
}

double AvroValue.init(_:)@<D0>(void *a1@<X8>, unsigned int a2@<S0>)
{
  *a1 = a2;
  a1[1] = 0;
  a1[2] = 0;
  a1[3] = 3;
  return OUTLINED_FUNCTION_0_15((uint64_t)a1);
}

void AvroValue.init(_:)(uint64_t a1@<X8>, uint64_t a2@<X0>, uint64_t a3@<X1>)
{
  *(void *)a1 = a2;
  *(void *)(a1 + 8) = a3;
  *(_OWORD *)(a1 + 16) = xmmword_25BE99130;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  OUTLINED_FUNCTION_3_23(a1);
}

{
  *(void *)a1 = a2;
  *(void *)(a1 + 8) = a3 | 0x2000000000000000;
  *(_OWORD *)(a1 + 16) = xmmword_25BE99140;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  OUTLINED_FUNCTION_3_23(a1);
}

uint64_t static AvroPrimitive.string(_:)()
{
  return OUTLINED_FUNCTION_7();
}

double AvroValue.init(_:)@<D0>(void *a1@<X8>, uint64_t a2@<X0>)
{
  *a1 = a2;
  a1[1] = 0;
  a1[2] = 0;
  a1[3] = 6;
  return OUTLINED_FUNCTION_0_15((uint64_t)a1);
}

uint64_t static AvroPrimitive.bytes(_:)()
{
  return swift_bridgeObjectRetain();
}

double AvroValue.init(_:)@<D0>(void *a1@<X8>, uint64_t a2@<X0>, uint64_t a3@<X1>, uint64_t a4@<X2>)
{
  *a1 = a2;
  a1[1] = a3 | 0x1000000000000000;
  a1[2] = a4;
  a1[3] = 6;
  return OUTLINED_FUNCTION_0_15((uint64_t)a1);
}

uint64_t static AvroPrimitive.bytes(_:)(uint64_t a1, unint64_t a2)
{
  return a1;
}

{
  sub_25BCBA6A8(a1, a2);
  return OUTLINED_FUNCTION_135();
}

double static AvroValue.bytes(_:)@<D0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v7 = a2 | 0x1000000000000000;
  sub_25BCBA6A8(a1, a2);
  *(void *)a4 = a1;
  *(void *)(a4 + 8) = v7;
  *(void *)(a4 + 16) = a3;
  *(void *)(a4 + 24) = 6;
  double result = 0.0;
  *(_OWORD *)(a4 + 32) = 0u;
  *(_OWORD *)(a4 + 48) = 0u;
  *(unsigned char *)(a4 + 64) = 0;
  return result;
}

double static AvroValue.bytes(_:)@<D0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5 = a2 | 0x2000000000000000;
  sub_25BCBA6A8(a1, a2);
  *(void *)a3 = a1;
  *(void *)(a3 + 8) = v5;
  double result = 0.0;
  *(_OWORD *)(a3 + 16) = xmmword_25BE99140;
  *(_OWORD *)(a3 + 32) = 0u;
  *(_OWORD *)(a3 + 48) = 0u;
  *(unsigned char *)(a3 + 64) = 0;
  return result;
}

void *AvroPrimitive.null.unsafeMutableAddressor()
{
  return &static AvroPrimitive.null;
}

double static AvroValue.null.getter@<D0>(void *a1@<X8>)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  a1[3] = 7;
  return OUTLINED_FUNCTION_0_15((uint64_t)a1);
}

double static AvroValue.union(_:)(uint64_t a1)
{
  uint64_t v2 = swift_allocObject();
  OUTLINED_FUNCTION_52_2(v2);
  sub_25BE608C0(a1);
  return OUTLINED_FUNCTION_11_13();
}

uint64_t sub_25BE747D0(unsigned __int8 *a1)
{
  return AvroValue.init(BOOLeanLiteral:)(*a1);
}

double _s9SwiftAvro0B5ValueVyACs5Int64VcfC_0@<D0>(void *a1@<X8>, uint64_t a2@<X0>)
{
  *a1 = a2;
  a1[1] = 0;
  a1[2] = 0;
  a1[3] = 2;
  return OUTLINED_FUNCTION_0_15((uint64_t)a1);
}

uint64_t sub_25BE747EC(void *a1)
{
  return AvroValue.init(integerLiteral:)(*a1);
}

double _s9SwiftAvro0B5ValueVyACSdcfC_0@<D0>(uint64_t a1@<X8>, double a2@<D0>)
{
  *(double *)a1 = a2;
  *(void *)(a1 + 8) = 0;
  *(void *)(a1 + 16) = 0;
  *(void *)(a1 + 24) = 4;
  return OUTLINED_FUNCTION_0_15(a1);
}

uint64_t sub_25BE7480C(double *a1)
{
  return AvroValue.init(floatLiteral:)(*a1);
}

void AvroValue.init(stringLiteral:)(uint64_t a1@<X8>, uint64_t a2@<X0>, uint64_t a3@<X1>)
{
  *(void *)a1 = a2;
  *(void *)(a1 + 8) = a3;
  *(_OWORD *)(a1 + 16) = xmmword_25BE99130;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  OUTLINED_FUNCTION_3_23(a1);
}

void sub_25BE74830(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
}

double AvroValue.init(arrayLiteral:)@<D0>(void *a1@<X8>, uint64_t a2@<X0>)
{
  *a1 = a2;
  a1[1] = 0;
  a1[2] = 0;
  a1[3] = 6;
  return OUTLINED_FUNCTION_0_15((uint64_t)a1);
}

uint64_t sub_25BE74850(void *a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270F9FA58](*a1, a1[1], a2, a3);
}

uint64_t AvroValue.update(_:)(const void *a1)
{
  uint64_t v3 = v1;
  memcpy(__dst, v1, 0x41uLL);
  unint64_t v5 = AvroValue.schema.getter();
  char v6 = sub_25BE58C30((uint64_t)a1, v5);
  swift_release();
  if (v6)
  {
    sub_25BE660D4((uint64_t)__dst, (uint64_t)v34);
    sub_25BE660D4((uint64_t)v34, (uint64_t)&v35);
    switch(v38)
    {
      case 1:
        long long v43 = v35;
        uint64_t v7 = v36;
        uint64_t v8 = v37;
        sub_25BE79E14((uint64_t)__dst, (void (*)(void, void, void, void, void, void, void, void, char))sub_25BE03DEC);
        sub_25BE776CC((uint64_t)&v43);
        uint64_t v42 = v7;
        sub_25BE7769C((uint64_t)&v42);
        uint64_t v44 = v8;
        uint64_t v9 = &v44;
        goto LABEL_6;
      case 2:
        long long v40 = v35;
        uint64_t v14 = v36;
        uint64_t v15 = v37;
        sub_25BE79E14((uint64_t)__dst, (void (*)(void, void, void, void, void, void, void, void, char))sub_25BE03DEC);
        sub_25BE776CC((uint64_t)&v40);
        uint64_t v39 = v14;
        sub_25BE7769C((uint64_t)&v39);
        uint64_t v41 = v15;
        uint64_t v9 = &v41;
LABEL_6:
        sub_25BE03DC0((uint64_t)v9);
        goto LABEL_7;
      case 4:
        uint64_t v27 = *(void *)(v35 + 24);
        unint64_t v18 = *(void *)(v35 + 32);
        uint64_t v19 = *(void *)(v35 + 40);
        uint64_t v20 = *(void *)(v35 + 48);
        uint64_t v21 = *(void *)(v35 + 56);
        uint64_t v26 = *(void *)(v35 + 64);
        uint64_t v25 = *(void *)(v35 + 72);
        uint64_t v24 = *(void *)(v35 + 80);
        char v22 = *(unsigned char *)(v35 + 88);
        *(void *)&long long v28 = *(void *)(v35 + 16);
        *((void *)&v28 + 1) = v27;
        *(void *)&long long v29 = v18;
        *((void *)&v29 + 1) = v19;
        *(void *)&long long v30 = v20;
        *((void *)&v30 + 1) = v21;
        *(void *)&long long v31 = v26;
        *((void *)&v31 + 1) = v25;
        uint64_t v32 = *(void *)(v35 + 96);
        sub_25BE79E14((uint64_t)__dst, (void (*)(void, void, void, void, void, void, void, void, char))sub_25BE03DEC);
        swift_bridgeObjectRetain();
        sub_25BE03DEC(v27, v18, v19, v20, v21, v26, v25, v24, v22);
        AvroUnion.update(_:)((uint64_t)a1);
        if (v2)
        {
          swift_bridgeObjectRelease();
          sub_25BE03FA4(v27, v18, v19, v20, v21, v26, v25, v24, v22);
          uint64_t v16 = sub_25BE03FA4;
          uint64_t v17 = __dst;
LABEL_8:
          uint64_t result = sub_25BE79E14((uint64_t)v17, (void (*)(void, void, void, void, void, void, void, void, char))v16);
        }
        else
        {
          sub_25BE79E14((uint64_t)__dst, (void (*)(void, void, void, void, void, void, void, void, char))sub_25BE03FA4);
          uint64_t v23 = swift_allocObject();
          *(_OWORD *)(v23 + 16) = v28;
          *(_OWORD *)(v23 + 32) = v29;
          *(_OWORD *)(v23 + 48) = v30;
          *(_OWORD *)(v23 + 64) = v31;
          *(void *)(v23 + 80) = v24;
          *(unsigned char *)(v23 + 88) = v22;
          *(void *)(v23 + 96) = v32;
          uint64_t result = sub_25BE79E14((uint64_t)__dst, (void (*)(void, void, void, void, void, void, void, void, char))sub_25BE03FA4);
          *char v1 = v23;
          *(_OWORD *)(v1 + 1) = 0u;
          *(_OWORD *)(v1 + 3) = 0u;
          *(_OWORD *)(v1 + 5) = 0u;
          v1[7] = 0;
          *((unsigned char *)v1 + 64) = 4;
        }
        break;
      default:
LABEL_7:
        sub_25BE79E14((uint64_t)__dst, (void (*)(void, void, void, void, void, void, void, void, char))sub_25BE03FA4);
        memcpy(v3, a1, 0x41uLL);
        uint64_t v16 = sub_25BE03DEC;
        uint64_t v17 = a1;
        goto LABEL_8;
    }
  }
  else
  {
    unint64_t v10 = AvroValue.schema.getter();
    unint64_t v11 = AvroValue.schema.getter();
    sub_25BE774A8();
    OUTLINED_FUNCTION_2_1();
    *unint64_t v12 = v10;
    v12[1] = v11;
    return swift_willThrow();
  }
  return result;
}

uint64_t AvroUnion.update(_:)(uint64_t a1)
{
  uint64_t v3 = v2;
  uint64_t v4 = v1;
  unint64_t v5 = (const void *)a1;
  sub_25BE660D4(a1, (uint64_t)v68);
  sub_25BE660D4((uint64_t)v68, (uint64_t)v69);
  if (v70 == 4)
  {
    uint64_t v60 = v5;
    uint64_t v71 = v2;
    uint64_t v7 = *(void *)(v69[0] + 16);
    uint64_t v6 = *(void *)(v69[0] + 24);
    uint64_t v8 = *(void *)(v69[0] + 32);
    uint64_t v9 = *(void *)(v69[0] + 56);
    uint64_t v62 = *(void *)(v69[0] + 48);
    uint64_t v63 = *(void *)(v69[0] + 40);
    uint64_t v11 = *(void *)(v69[0] + 64);
    uint64_t v10 = *(void *)(v69[0] + 72);
    uint64_t v12 = *(void *)(v69[0] + 80);
    char v13 = *(unsigned char *)(v69[0] + 88);
    uint64_t v59 = *(void *)(v69[0] + 96);
    uint64_t v14 = *(void *)v4;
    swift_bridgeObjectRetain();
    OUTLINED_FUNCTION_35_3();
    uint64_t v64 = v12;
    uint64_t v15 = v12;
    uint64_t v16 = v7;
    sub_25BE03DEC(v17, v18, v19, v20, v21, v22, v23, v15, v13);
    if (_s9SwiftAvro0B11UnionSchemaV23__derived_struct_equalsySbAC_ACtFZ_0(v7, v14))
    {
      uint64_t v61 = *(void *)(v4 + 8);
      uint64_t v57 = *(void *)(v4 + 24);
      unint64_t v58 = *(void *)(v4 + 16);
      uint64_t v55 = *(void *)(v4 + 40);
      uint64_t v56 = *(void *)(v4 + 32);
      uint64_t v53 = *(void *)(v4 + 56);
      uint64_t v54 = *(void *)(v4 + 48);
      uint64_t v52 = *(void *)(v4 + 64);
      char v24 = *(unsigned char *)(v4 + 72);
      swift_bridgeObjectRelease();
      uint64_t result = sub_25BE03FA4(v61, v58, v57, v56, v55, v54, v53, v52, v24);
      *(void *)uint64_t v4 = v16;
      *(void *)(v4 + 8) = v6;
      *(void *)(v4 + 16) = v8;
      *(void *)(v4 + 24) = v63;
      *(void *)(v4 + 32) = v62;
      *(void *)(v4 + 40) = v9;
      *(void *)(v4 + 48) = v11;
      *(void *)(v4 + 56) = v10;
      *(void *)(v4 + 64) = v64;
      *(unsigned char *)(v4 + 72) = v13;
      *(void *)(v4 + 80) = v59;
      return result;
    }
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_35_3();
    sub_25BE03FA4(v26, v27, v28, v29, v30, v31, v32, v64, v13);
    uint64_t v3 = v71;
    unint64_t v5 = v60;
  }
  uint64_t v33 = *(void *)v4;
  swift_bridgeObjectRetain();
  unint64_t v34 = AvroValue.schema.getter();
  unint64_t v35 = sub_25BE72444(v34, v33);
  char v37 = v36;
  swift_bridgeObjectRelease();
  uint64_t result = swift_release();
  if (v37)
  {
LABEL_10:
    uint64_t v48 = swift_allocObject();
    *(void *)(v48 + 16) = v33;
    unint64_t v49 = v48 | 0x8000000000000000;
    swift_bridgeObjectRetain();
    unint64_t v50 = AvroValue.schema.getter();
    sub_25BE774A8();
    OUTLINED_FUNCTION_2_1();
    *uint64_t v51 = v49;
    v51[1] = v50;
    return swift_willThrow();
  }
  if ((v35 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (v35 < *(void *)(v33 + 16))
  {
    unint64_t v38 = *(void *)(v33 + 8 * v35 + 32);
    swift_retain();
    char v39 = sub_25BE58C30((uint64_t)v5, v38);
    swift_release();
    if (v39)
    {
      uint64_t v40 = *(void *)(v4 + 8);
      unint64_t v42 = *(void *)(v4 + 16);
      uint64_t v41 = v4 + 8;
      uint64_t v67 = v40;
      uint64_t v71 = v3;
      uint64_t v43 = *(void *)(v41 + 16);
      uint64_t v44 = *(void *)(v41 + 24);
      uint64_t v45 = *(void *)(v41 + 32);
      uint64_t v46 = *(void *)(v41 + 40);
      uint64_t v65 = *(void *)(v41 + 56);
      uint64_t v66 = *(void *)(v41 + 48);
      char v47 = *(unsigned char *)(v41 + 64);
      sub_25BE79E14((uint64_t)v5, (void (*)(void, void, void, void, void, void, void, void, char))sub_25BE03DEC);
      sub_25BE03FA4(v67, v42, v43, v44, v45, v46, v66, v65, v47);
      uint64_t result = (uint64_t)memcpy((void *)v41, v5, 0x41uLL);
      *(void *)(v41 + 72) = v35;
      return result;
    }
    goto LABEL_10;
  }
  __break(1u);
  return result;
}

unsigned char *AvroValue.description.getter()
{
  uint64_t v1 = v0;
  sub_25BE660D4(v0, (uint64_t)v8);
  sub_25BE660D4((uint64_t)v8, (uint64_t)v10);
  switch(v11)
  {
    case 1:
      uint64_t v2 = *(unsigned char **)&v10[0];
      sub_25BE79E14(v1, (void (*)(void, void, void, void, void, void, void, void, char))sub_25BE03DEC);
      swift_retain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      OUTLINED_FUNCTION_69_2();
      AvroArray.description.getter();
      goto LABEL_5;
    case 2:
      uint64_t v2 = *(unsigned char **)&v10[0];
      sub_25BE79E14(v1, (void (*)(void, void, void, void, void, void, void, void, char))sub_25BE03DEC);
      swift_retain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      OUTLINED_FUNCTION_69_2();
      AvroMap.description.getter();
LABEL_5:
      OUTLINED_FUNCTION_61_1();
      swift_bridgeObjectRelease_n();
      swift_release_n();
      swift_bridgeObjectRelease_n();
      return v2;
    case 3:
      *(_OWORD *)__dst = v10[0];
      *(_OWORD *)&__dst[16] = v10[1];
      *(_OWORD *)&__dst[32] = v10[2];
      *(_OWORD *)&__dst[48] = v10[3];
      sub_25BE79E14(v0, (void (*)(void, void, void, void, void, void, void, void, char))sub_25BE03DEC);
      uint64_t v2 = __dst;
      AvroRecord.description.getter();
      goto LABEL_7;
    case 4:
      memcpy(__dst, (const void *)(*(void *)&v10[0] + 16), sizeof(__dst));
      sub_25BE79E14(v0, (void (*)(void, void, void, void, void, void, void, void, char))sub_25BE03DEC);
      sub_25BE608C0((uint64_t)__dst);
      uint64_t v2 = __dst;
      AvroUnion.description.getter();
      OUTLINED_FUNCTION_61_1();
      sub_25BE60950((uint64_t)__dst);
      goto LABEL_9;
    default:
      uint64_t v2 = *(unsigned char **)&v10[0];
      sub_25BE79E14(v1, (void (*)(void, void, void, void, void, void, void, void, char))sub_25BE03DEC);
      char v3 = OUTLINED_FUNCTION_66_2();
      AvroPrimitive.description.getter(v3, v4, v5, v6);
LABEL_7:
      OUTLINED_FUNCTION_61_1();
LABEL_9:
      sub_25BE79E14(v1, (void (*)(void, void, void, void, void, void, void, void, char))sub_25BE03FA4);
      return v2;
  }
}

unsigned char *sub_25BE75148()
{
  memcpy(__dst, v0, sizeof(__dst));
  return AvroValue.description.getter();
}

uint64_t AvroRecord.schema.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_25BE776F8(v1, a1);
}

#error "25BE752A4: call analysis failed (funcsize=81)"

uint64_t AvroRecord.hash(into:)(uint64_t a1)
{
  long long v3 = *(_OWORD *)(v1 + 16);
  v6[0] = *(_OWORD *)v1;
  v6[1] = v3;
  v6[2] = *(_OWORD *)(v1 + 32);
  uint64_t v7 = *(void *)(v1 + 48);
  sub_25BE03D68((uint64_t)v6);
  AvroRecordSchema.hash(into:)();
  sub_25BE5E10C((uint64_t)v6);
  uint64_t v4 = *(void *)(v1 + 56);
  swift_bridgeObjectRetain();
  sub_25BE5E1DC(a1, v4);
  return swift_bridgeObjectRelease();
}

uint64_t static AvroRecord.__derived_struct_equals(_:_:)()
{
  OUTLINED_FUNCTION_13_10();
  if ((static AvroRecordSchema.__derived_struct_equals(_:_:)() & 1) == 0) {
    return 0;
  }
  uint64_t v2 = *(void *)(v1 + 56);
  uint64_t v3 = *(void *)(v0 + 56);

  return sub_25BE5B45C(v2, v3);
}

uint64_t AvroRecord.hashValue.getter()
{
  OUTLINED_FUNCTION_2_25();
  long long v1 = *(_OWORD *)(v0 + 16);
  v4[0] = *(_OWORD *)v0;
  v4[1] = v1;
  v4[2] = *(_OWORD *)(v0 + 32);
  uint64_t v5 = *(void *)(v0 + 48);
  sub_25BE03D68((uint64_t)v4);
  AvroRecordSchema.hash(into:)();
  sub_25BE5E10C((uint64_t)v4);
  uint64_t v2 = swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_72_1(v2);
  swift_bridgeObjectRelease();
  return sub_25BE80640();
}

uint64_t sub_25BE75478()
{
  long long v1 = *(_OWORD *)(v0 + 16);
  v5[0] = *(_OWORD *)v0;
  v5[1] = v1;
  v5[2] = *(_OWORD *)(v0 + 32);
  uint64_t v2 = *(void *)(v0 + 56);
  uint64_t v6 = *(void *)(v0 + 48);
  sub_25BE805F0();
  sub_25BE03D68((uint64_t)v5);
  AvroRecordSchema.hash(into:)();
  sub_25BE5E10C((uint64_t)v5);
  swift_bridgeObjectRetain();
  sub_25BE5E1DC((uint64_t)v4, v2);
  swift_bridgeObjectRelease();
  return sub_25BE80640();
}

uint64_t AvroRecord.description.getter()
{
  *(void *)&v5[0] = 0;
  *((void *)&v5[0] + 1) = 0xE000000000000000;
  sub_25BE80060();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_17_8();
  uint64_t v1 = swift_bridgeObjectRetain();
  MEMORY[0x261176310](v1, &type metadata for AvroValue);
  sub_25BE7FCD0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_2_35();
  long long v2 = *(_OWORD *)(v0 + 16);
  v5[0] = *(_OWORD *)v0;
  v5[1] = v2;
  v5[2] = *(_OWORD *)(v0 + 32);
  uint64_t v6 = *(void *)(v0 + 48);
  sub_25BE03D68((uint64_t)v5);
  AvroRecordSchema.description.getter();
  sub_25BE7FCD0();
  swift_bridgeObjectRelease();
  sub_25BE5E10C((uint64_t)v5);
  OUTLINED_FUNCTION_18_8();
  return v4;
}

void *AvroArray.append(_:)(const void *a1)
{
  uint64_t v2 = v1;
  unint64_t v4 = *(void *)(v1 + 16);
  OUTLINED_FUNCTION_30_7();
  char v5 = sub_25BE58C30((uint64_t)a1, v4);
  swift_release();
  if (v5)
  {
    sub_25BE79E14((uint64_t)a1, (void (*)(void, void, void, void, void, void, void, void, char))sub_25BE03DEC);
    sub_25BE7003C();
    uint64_t v6 = *(void *)(*(void *)(v1 + 24) + 16);
    sub_25BE700E0(v6);
    uint64_t v7 = *(void *)(v1 + 24);
    *(void *)(v7 + 16) = v6 + 1;
    uint64_t result = memcpy((void *)(v7 + 72 * v6 + 32), a1, 0x41uLL);
    *(void *)(v2 + 24) = v7;
  }
  else
  {
    swift_retain();
    unint64_t v9 = AvroValue.schema.getter();
    sub_25BE774A8();
    OUTLINED_FUNCTION_2_1();
    *uint64_t v10 = v4;
    v10[1] = v9;
    return (void *)swift_willThrow();
  }
  return result;
}

uint64_t AvroArray.append<A>(contentsOf:)()
{
  uint64_t v2 = *(void *)(v0 + 24);
  swift_bridgeObjectRetain();
  sub_25BE7FD20();
  if (!v1) {
    return swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  *(void *)(v0 + 24) = v2;
  return swift_willThrow();
}

void *sub_25BE7578C(void *__src)
{
  memcpy(__dst, __src, 0x41uLL);
  return AvroArray.append(_:)(__dst);
}

#error "25BE75898: call analysis failed (funcsize=62)"

uint64_t AvroArray.hash(into:)(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5)
{
  return sub_25BE75CC0(a1, a2, a3, a4, a5, (void (*)(uint64_t, uint64_t))sub_25BE5E1DC);
}

uint64_t static AvroArray.__derived_struct_equals(_:_:)(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unint64_t a7, uint64_t a8)
{
  return sub_25BE75DBC(a1, a2, a3, a4, a5, a6, a7, a8, (uint64_t (*)(uint64_t))sub_25BE5B45C) & 1;
}

uint64_t AvroArray.hashValue.getter()
{
  OUTLINED_FUNCTION_8_21();
  swift_retain();
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_46_3();
  swift_retain();
  sub_25BE59B50((uint64_t)v3, v0);
  swift_bridgeObjectRelease();
  swift_release_n();
  uint64_t v1 = swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_72_1(v1);
  swift_bridgeObjectRelease();
  return sub_25BE80640();
}

uint64_t sub_25BE759B4()
{
  return AvroArray.hashValue.getter();
}

uint64_t sub_25BE759C0(uint64_t a1)
{
  return AvroArray.hash(into:)(a1, *(void *)v1, *(void *)(v1 + 8), *(void *)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_25BE759CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_25BE76260(a1, a2, a3, (void (*)(unsigned char *, uint64_t, uint64_t, uint64_t, uint64_t))AvroArray.hash(into:));
}

uint64_t sub_25BE759E4(void *a1, void *a2, uint64_t a3, uint64_t a4)
{
  return sub_25BE762E4(a1, a2, a3, a4, static AvroArray.__derived_struct_equals(_:_:));
}

uint64_t AvroArray.description.getter()
{
  OUTLINED_FUNCTION_16_11();
  sub_25BE80060();
  swift_bridgeObjectRelease();
  uint64_t v0 = OUTLINED_FUNCTION_65_3();
  MEMORY[0x261176310](v0, &type metadata for AvroValue);
  sub_25BE7FCD0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_2_35();
  swift_retain();
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_37_4();
  AvroArraySchema.description.getter(v1, v2, v3);
  OUTLINED_FUNCTION_36_2();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_18_8();
  return v5;
}

uint64_t sub_25BE75AC8()
{
  return AvroArray.description.getter();
}

uint64_t _s9SwiftAvro0B5ArrayV6schemaAA0bC6SchemaVvg_0()
{
  return OUTLINED_FUNCTION_42_2();
}

uint64_t AvroMap.subscript.getter@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X5>, uint64_t a4@<X8>)
{
  unint64_t v5 = *(void *)(a3 + 16);
  if (!v5)
  {
    uint64_t v12 = 0;
LABEL_7:
    uint64_t v13 = 0;
    uint64_t v14 = 0;
    uint64_t v15 = 0;
    uint64_t v16 = 0;
    uint64_t v17 = 0;
    uint64_t v18 = 0;
    LOBYTE(v19) = -1;
    goto LABEL_8;
  }
  uint64_t v8 = result;
  swift_bridgeObjectRetain();
  unint64_t v9 = sub_25BE1158C(v8, a2);
  if ((v10 & 1) == 0)
  {
    uint64_t result = swift_bridgeObjectRelease();
    uint64_t v12 = 0;
    unint64_t v5 = 0;
    goto LABEL_7;
  }
  uint64_t v11 = *(void *)(a3 + 56) + 72 * v9;
  uint64_t v12 = *(void *)v11;
  uint64_t v13 = *(void *)(v11 + 16);
  uint64_t v14 = *(void *)(v11 + 24);
  uint64_t v15 = *(void *)(v11 + 32);
  uint64_t v16 = *(void *)(v11 + 40);
  uint64_t v17 = *(void *)(v11 + 48);
  uint64_t v18 = *(void *)(v11 + 56);
  int v19 = *(unsigned __int8 *)(v11 + 64);
  unint64_t v28 = *(void *)(v11 + 8);
  sub_25BE03DEC(*(void *)v11, v28, v13, v14, v15, v16, v17, v18, *(unsigned char *)(v11 + 64));
  uint64_t result = swift_bridgeObjectRelease();
  if (v19 == 4)
  {
    unint64_t v26 = *(void *)(v12 + 32);
    uint64_t v27 = *(void *)(v12 + 24);
    uint64_t v24 = *(void *)(v12 + 48);
    uint64_t v25 = *(void *)(v12 + 40);
    uint64_t v22 = *(void *)(v12 + 64);
    uint64_t v23 = *(void *)(v12 + 56);
    uint64_t v20 = *(void *)(v12 + 80);
    uint64_t v21 = *(void *)(v12 + 72);
    LOBYTE(v19) = *(unsigned char *)(v12 + 88);
    sub_25BE03DEC(v27, v26, v25, v24, v23, v22, v21, v20, v19);
    uint64_t result = sub_25BE03FA4(v12, v28, v13, v14, v15, v16, v17, v18, 4);
    unint64_t v5 = v26;
    uint64_t v12 = v27;
    uint64_t v14 = v24;
    uint64_t v13 = v25;
    uint64_t v16 = v22;
    uint64_t v15 = v23;
    uint64_t v17 = v21;
    uint64_t v18 = v20;
  }
  else
  {
    unint64_t v5 = v28;
  }
LABEL_8:
  *(void *)a4 = v12;
  *(void *)(a4 + 8) = v5;
  *(void *)(a4 + 16) = v13;
  *(void *)(a4 + 24) = v14;
  *(void *)(a4 + 32) = v15;
  *(void *)(a4 + 40) = v16;
  *(void *)(a4 + 48) = v17;
  *(void *)(a4 + 56) = v18;
  *(unsigned char *)(a4 + 64) = v19;
  return result;
}

uint64_t AvroMap.hash(into:)(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5)
{
  return sub_25BE75CC0(a1, a2, a3, a4, a5, (void (*)(uint64_t, uint64_t))sub_25BE77770);
}

uint64_t sub_25BE75CC0(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5, void (*a6)(uint64_t, uint64_t))
{
  swift_retain();
  swift_bridgeObjectRetain();
  sub_25BE7FCB0();
  swift_retain();
  sub_25BE59B50(a1, a4);
  swift_bridgeObjectRelease();
  swift_release_n();
  swift_bridgeObjectRetain();
  a6(a1, a5);

  return swift_bridgeObjectRelease();
}

uint64_t static AvroMap.__derived_struct_equals(_:_:)(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unint64_t a7, uint64_t a8)
{
  return sub_25BE75DBC(a1, a2, a3, a4, a5, a6, a7, a8, (uint64_t (*)(uint64_t))sub_25BE75E64) & 1;
}

uint64_t sub_25BE75DBC(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unint64_t a7, uint64_t a8, uint64_t (*a9)(uint64_t))
{
  BOOL v11 = a1 == a5 && a2 == a6;
  if (!v11 && (sub_25BE80440() & 1) == 0
    || (_s9SwiftAvro0B6SchemaV23__derived_struct_equalsySbAC_ACtFZ_0(a3, a7) & 1) == 0)
  {
    return 0;
  }
  uint64_t v12 = OUTLINED_FUNCTION_7();

  return a9(v12);
}

uint64_t sub_25BE75E64(uint64_t result, uint64_t a2)
{
  uint64_t v40 = result;
  if (result == a2) {
    return 1;
  }
  if (*(void *)(result + 16) != *(void *)(a2 + 16)) {
    return 0;
  }
  int64_t v46 = 0;
  uint64_t v37 = result + 64;
  uint64_t v2 = 1 << *(unsigned char *)(result + 32);
  uint64_t v3 = -1;
  if (v2 < 64) {
    uint64_t v3 = ~(-1 << v2);
  }
  unint64_t v4 = v3 & *(void *)(result + 64);
  int64_t v38 = (unint64_t)(v2 + 63) >> 6;
  while (1)
  {
    if (v4)
    {
      uint64_t v42 = (v4 - 1) & v4;
      unint64_t v5 = __clz(__rbit64(v4)) | (v46 << 6);
      goto LABEL_22;
    }
    int64_t v6 = v46 + 1;
    if (__OFADD__(v46, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v6 >= v38) {
      return 1;
    }
    unint64_t v7 = *(void *)(v37 + 8 * v6);
    ++v46;
    if (!v7)
    {
      int64_t v46 = v6 + 1;
      if (v6 + 1 >= v38) {
        return 1;
      }
      unint64_t v7 = *(void *)(v37 + 8 * v46);
      if (!v7)
      {
        int64_t v46 = v6 + 2;
        if (v6 + 2 >= v38) {
          return 1;
        }
        unint64_t v7 = *(void *)(v37 + 8 * v46);
        if (!v7) {
          break;
        }
      }
    }
LABEL_21:
    uint64_t v42 = (v7 - 1) & v7;
    unint64_t v5 = __clz(__rbit64(v7)) + (v46 << 6);
LABEL_22:
    unint64_t v9 = (uint64_t *)(*(void *)(v40 + 48) + 16 * v5);
    uint64_t v10 = v9[1];
    uint64_t v44 = *v9;
    uint64_t v11 = *(void *)(v40 + 56) + 72 * v5;
    uint64_t v13 = *(void *)v11;
    unint64_t v12 = *(void *)(v11 + 8);
    uint64_t v14 = *(void *)(v11 + 16);
    uint64_t v15 = *(void *)(v11 + 24);
    uint64_t v16 = *(void *)(v11 + 32);
    uint64_t v17 = *(void *)(v11 + 40);
    uint64_t v18 = *(void *)(v11 + 48);
    uint64_t v19 = *(void *)(v11 + 56);
    char v20 = *(unsigned char *)(v11 + 64);
    swift_bridgeObjectRetain();
    char v43 = v20;
    char v36 = v20;
    uint64_t v47 = v13;
    uint64_t v48 = v14;
    unint64_t v21 = v12;
    uint64_t v51 = v16;
    uint64_t v52 = v15;
    uint64_t v49 = v18;
    uint64_t v50 = v17;
    sub_25BE03DEC(v13, v12, v14, v15, v16, v17, v18, v19, v36);
    unint64_t v22 = sub_25BE1158C(v44, v10);
    LOBYTE(v14) = v23;
    swift_bridgeObjectRelease();
    if ((v14 & 1) == 0)
    {
      sub_25BE03FA4(v13, v12, v48, v15, v51, v17, v18, v19, v43);
      return 0;
    }
    uint64_t v24 = *(void *)(a2 + 56) + 72 * v22;
    uint64_t v25 = *(void *)v24;
    unint64_t v26 = *(void *)(v24 + 8);
    uint64_t v27 = *(void *)(v24 + 16);
    uint64_t v28 = *(void *)(v24 + 24);
    uint64_t v29 = *(void *)(v24 + 32);
    uint64_t v30 = *(void *)(v24 + 40);
    unint64_t v31 = v21;
    unint64_t v41 = v21;
    uint64_t v32 = *(void *)(v24 + 48);
    uint64_t v33 = *(void *)(v24 + 56);
    char v34 = *(unsigned char *)(v24 + 64);
    v53[0] = v25;
    v53[1] = v26;
    v53[2] = v27;
    v53[3] = v28;
    v53[4] = v29;
    v53[5] = v30;
    v53[6] = v32;
    v53[7] = v33;
    char v54 = v34;
    v55[0] = v47;
    v55[1] = v31;
    v55[2] = v48;
    v55[3] = v52;
    v55[4] = v51;
    v55[5] = v50;
    v55[6] = v49;
    v55[7] = v19;
    char v56 = v43;
    sub_25BE03DEC(v25, v26, v27, v28, v29, v30, v32, v33, v34);
    char v45 = sub_25BE731AC(v53, v55);
    uint64_t v35 = v25;
    unint64_t v4 = v42;
    sub_25BE03FA4(v35, v26, v27, v28, v29, v30, v32, v33, v34);
    uint64_t result = sub_25BE03FA4(v47, v41, v48, v52, v51, v50, v49, v19, v43);
    if ((v45 & 1) == 0) {
      return 0;
    }
  }
  int64_t v8 = v6 + 3;
  if (v8 >= v38) {
    return 1;
  }
  unint64_t v7 = *(void *)(v37 + 8 * v8);
  if (v7)
  {
    int64_t v46 = v8;
    goto LABEL_21;
  }
  while (1)
  {
    int64_t v46 = v8 + 1;
    if (__OFADD__(v8, 1)) {
      break;
    }
    if (v46 >= v38) {
      return 1;
    }
    unint64_t v7 = *(void *)(v37 + 8 * v46);
    ++v8;
    if (v7) {
      goto LABEL_21;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t AvroMap.hashValue.getter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  OUTLINED_FUNCTION_8_21();
  AvroMap.hash(into:)((uint64_t)v9, v6, v5, v4, a4);
  return sub_25BE80640();
}

uint64_t sub_25BE76230()
{
  return AvroMap.hashValue.getter(*v0, v0[1], v0[2], v0[3]);
}

uint64_t sub_25BE7623C(uint64_t a1)
{
  return AvroMap.hash(into:)(a1, *(void *)v1, *(void *)(v1 + 8), *(void *)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_25BE76248(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_25BE76260(a1, a2, a3, (void (*)(unsigned char *, uint64_t, uint64_t, uint64_t, uint64_t))AvroMap.hash(into:));
}

uint64_t sub_25BE76260(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(unsigned char *, uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v6 = *v4;
  uint64_t v7 = v4[1];
  uint64_t v9 = v4[2];
  uint64_t v8 = v4[3];
  sub_25BE805F0();
  a4(v11, v6, v7, v9, v8);
  return sub_25BE80640();
}

uint64_t sub_25BE762CC(void *a1, void *a2, uint64_t a3, uint64_t a4)
{
  return sub_25BE762E4(a1, a2, a3, a4, static AvroMap.__derived_struct_equals(_:_:));
}

uint64_t sub_25BE762E4(void *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(void, void, void, void, void, void, void, void))
{
  return a5(*a1, a1[1], a1[2], a1[3], *a2, a2[1], a2[2], a2[3]);
}

uint64_t AvroMap.description.getter()
{
  OUTLINED_FUNCTION_16_11();
  sub_25BE80060();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_65_3();
  sub_25BE7FB20();
  sub_25BE7FCD0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_2_35();
  swift_retain();
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_37_4();
  AvroMapSchema.description.getter(v0, v1, v2);
  OUTLINED_FUNCTION_36_2();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_18_8();
  return v4;
}

uint64_t sub_25BE763E4(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, char a5)
{
  switch(a5)
  {
    case 1:
    case 3:
      sub_25BE80600();
      uint64_t result = sub_25BE80620();
      break;
    case 2:
    case 4:
      sub_25BE80600();
      uint64_t result = sub_25BE80630();
      break;
    case 5:
      sub_25BE80600();
      OUTLINED_FUNCTION_7();
      uint64_t result = sub_25BE7FCB0();
      break;
    case 6:
      sub_25BE80600();
      sub_25BE03F28(a2, a3);
      sub_25BE76830(a2, a3);
      sub_25BE80600();
      uint64_t result = sub_25BE040D0(a2, a3, a4, 6);
      break;
    case 7:
      uint64_t result = sub_25BE80600();
      break;
    default:
      sub_25BE80600();
      uint64_t result = sub_25BE80610();
      break;
  }
  return result;
}

uint64_t _s9SwiftAvro0B9PrimitiveV23__derived_struct_equalsySbAC_ACtFZ_0(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, unint64_t a6, uint64_t a7, char a8)
{
  switch(a4)
  {
    case 1:
      if (a8 != 1) {
        goto LABEL_31;
      }
      BOOL v11 = a1 == a5;
      goto LABEL_28;
    case 2:
      if (a8 != 2) {
        goto LABEL_31;
      }
      BOOL v11 = a1 == a5;
      goto LABEL_28;
    case 3:
      if (a8 != 3) {
        goto LABEL_31;
      }
      BOOL v12 = *(float *)&a1 == *(float *)&a5;
      goto LABEL_12;
    case 4:
      if (a8 != 4) {
        goto LABEL_31;
      }
      BOOL v12 = *(double *)&a1 == *(double *)&a5;
LABEL_12:
      char v10 = v12;
      return v10 & 1;
    case 5:
      if (a8 != 5) {
        goto LABEL_31;
      }
      if (a1 == a5 && a2 == a6)
      {
LABEL_33:
        char v10 = 1;
        return v10 & 1;
      }
      else
      {
        OUTLINED_FUNCTION_63_0();
        return sub_25BE80440();
      }
    case 6:
      if (a8 != 6) {
        goto LABEL_31;
      }
      uint64_t v16 = OUTLINED_FUNCTION_63_0();
      sub_25BE03F04(v16, v17, v18, 6);
      uint64_t v19 = OUTLINED_FUNCTION_54_4();
      sub_25BE03F04(v19, v20, v21, v22);
      uint64_t v23 = OUTLINED_FUNCTION_63_0();
      uint64_t v25 = sub_25BE76830(v23, v24);
      uint64_t v26 = sub_25BE76830(a5, a6);
      uint64_t v27 = OUTLINED_FUNCTION_54_4();
      sub_25BE040D0(v27, v28, v29, v30);
      uint64_t v31 = OUTLINED_FUNCTION_63_0();
      sub_25BE040D0(v31, v32, a3, 6);
      BOOL v11 = v25 == v26;
LABEL_28:
      char v10 = v11;
      return v10 & 1;
    case 7:
      if (a8 == 7 && !(a6 | a5 | a7)) {
        goto LABEL_33;
      }
      goto LABEL_31;
    default:
      if (a8) {
LABEL_31:
      }
        char v10 = 0;
      else {
        char v10 = ((a1 & 1) == 0) ^ a5;
      }
      return v10 & 1;
  }
}

uint64_t sub_25BE76748()
{
  OUTLINED_FUNCTION_8_21();
  OUTLINED_FUNCTION_20_7((uint64_t)v1);
  return sub_25BE80640();
}

uint64_t sub_25BE7678C()
{
  return AvroMap.description.getter();
}

uint64_t sub_25BE76798()
{
  return sub_25BE76748();
}

uint64_t sub_25BE767A8(uint64_t a1)
{
  return sub_25BE763E4(a1, *(void *)v1, *(void *)(v1 + 8), *(void *)(v1 + 16), *(unsigned char *)(v1 + 24));
}

uint64_t sub_25BE767B8()
{
  uint64_t v1 = *(void *)v0;
  unint64_t v2 = *(void *)(v0 + 8);
  uint64_t v3 = *(void *)(v0 + 16);
  char v4 = *(unsigned char *)(v0 + 24);
  sub_25BE805F0();
  sub_25BE763E4((uint64_t)v6, v1, v2, v3, v4);
  return sub_25BE80640();
}

uint64_t sub_25BE76818(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_25BE76B20(a1, a2, a3, a4, (uint64_t (*)(void, void, void, void, void, void, void, void))_s9SwiftAvro0B9PrimitiveV23__derived_struct_equalsySbAC_ACtFZ_0);
}

uint64_t sub_25BE76830(uint64_t a1, unint64_t a2)
{
  if (((a2 >> 60) & 3) != 0)
  {
    uint64_t v2 = OUTLINED_FUNCTION_135();
    sub_25BCBA6A8(v2, v3);
  }
  else
  {
    uint64_t v4 = swift_bridgeObjectRetain();
    sub_25BE7A72C(v4);
  }
  OUTLINED_FUNCTION_135();
  uint64_t v5 = sub_25BE7E8C0();
  uint64_t v6 = OUTLINED_FUNCTION_135();
  sub_25BCB9998(v6, v7);
  return v5;
}

BOOL sub_25BE768A0(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_25BE76830(a1, a2);
  uint64_t v3 = OUTLINED_FUNCTION_7();
  return v2 == sub_25BE76830(v3, v4);
}

uint64_t sub_25BE768E4(uint64_t a1, uint64_t a2, unint64_t a3)
{
  return sub_25BE80600();
}

uint64_t sub_25BE76914()
{
  return sub_25BE76830(*(void *)v0, *(void *)(v0 + 8));
}

uint64_t sub_25BE7691C(uint64_t a1)
{
  return sub_25BE768E4(a1, *(void *)v1, *(void *)(v1 + 8));
}

uint64_t sub_25BE76924()
{
  uint64_t v1 = *v0;
  unint64_t v2 = v0[1];
  sub_25BE805F0();
  sub_25BE76830(v1, v2);
  sub_25BE80600();
  return sub_25BE80640();
}

BOOL sub_25BE76970(uint64_t a1)
{
  return sub_25BE768A0(*(void *)a1, *(void *)(a1 + 8));
}

uint64_t static AvroPrimitive.null.getter()
{
  return 0;
}

uint64_t AvroPrimitive.hash(into:)(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, char a5)
{
  sub_25BE03F04(a2, a3, a4, a5);
  OUTLINED_FUNCTION_20_7(a1);
  uint64_t v6 = OUTLINED_FUNCTION_26_4();

  return sub_25BE040D0(v6, v7, v8, v9);
}

uint64_t AvroPrimitive.hashValue.getter()
{
  OUTLINED_FUNCTION_8_21();
  uint64_t v0 = OUTLINED_FUNCTION_26_4();
  sub_25BE03F04(v0, v1, v2, v3);
  OUTLINED_FUNCTION_20_7((uint64_t)v9);
  uint64_t v4 = OUTLINED_FUNCTION_26_4();
  sub_25BE040D0(v4, v5, v6, v7);
  return sub_25BE80640();
}

uint64_t sub_25BE76A60()
{
  return AvroPrimitive.hashValue.getter();
}

uint64_t sub_25BE76A70(uint64_t a1)
{
  return AvroPrimitive.hash(into:)(a1, *(void *)v1, *(void *)(v1 + 8), *(void *)(v1 + 16), *(unsigned char *)(v1 + 24));
}

uint64_t sub_25BE76A80()
{
  uint64_t v1 = *(void *)v0;
  unint64_t v2 = *(void *)(v0 + 8);
  uint64_t v3 = *(void *)(v0 + 16);
  char v4 = *(unsigned char *)(v0 + 24);
  sub_25BE805F0();
  sub_25BE03F04(v1, v2, v3, v4);
  sub_25BE763E4((uint64_t)v6, v1, v2, v3, v4);
  sub_25BE040D0(v1, v2, v3, v4);
  return sub_25BE80640();
}

uint64_t sub_25BE76B08(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_25BE76B20(a1, a2, a3, a4, (uint64_t (*)(void, void, void, void, void, void, void, void))static AvroPrimitive.__derived_struct_equals(_:_:));
}

uint64_t sub_25BE76B20(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(void, void, void, void, void, void, void, void))
{
  return a5(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(unsigned __int8 *)(a1 + 24), *(void *)a2, *(void *)(a2 + 8), *(void *)(a2 + 16), *(unsigned __int8 *)(a2 + 24));
}

uint64_t AvroPrimitive.description.getter(char a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t result = 7104878;
  switch(a4)
  {
    case 1:
    case 2:
      uint64_t result = sub_25BE802D0();
      break;
    case 3:
      uint64_t result = sub_25BE7FE20();
      break;
    case 4:
      uint64_t result = sub_25BE7FE10();
      break;
    case 5:
      uint64_t v6 = OUTLINED_FUNCTION_135();
      sub_25BE03F04(v6, v7, v8, 5);
      uint64_t result = OUTLINED_FUNCTION_135();
      break;
    case 6:
      uint64_t v9 = OUTLINED_FUNCTION_135();
      sub_25BE03F04(v9, v10, v11, 6);
      uint64_t result = sub_25BE7FC40();
      break;
    case 7:
      return result;
    default:
      if (a1) {
        uint64_t result = 1702195828;
      }
      else {
        uint64_t result = 0x65736C6166;
      }
      break;
  }
  return result;
}

uint64_t sub_25BE76C7C()
{
  return AvroPrimitive.description.getter(*(void *)v0, *(void *)(v0 + 8), *(void *)(v0 + 16), *(unsigned char *)(v0 + 24));
}

uint64_t AvroUnion.value.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_25BE788C4(v1 + 8, a1);
}

uint64_t AvroUnion.init(schema:value:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = *(void *)a2;
  uint64_t v7 = *(void *)(a2 + 8);
  uint64_t v25 = *(void *)(a2 + 16);
  uint64_t v23 = *(void *)(a2 + 32);
  uint64_t v24 = *(void *)(a2 + 24);
  uint64_t v21 = *(void *)(a2 + 48);
  uint64_t v22 = *(void *)(a2 + 40);
  uint64_t v20 = *(void *)(a2 + 56);
  char v19 = *(unsigned char *)(a2 + 64);
  swift_bridgeObjectRetain();
  unint64_t v8 = AvroValue.schema.getter();
  unint64_t v9 = sub_25BE72444(v8, a1);
  char v11 = v10;
  swift_bridgeObjectRelease();
  uint64_t result = swift_release();
  if (v11)
  {
LABEL_6:
    uint64_t v15 = swift_allocObject();
    *(void *)(v15 + 16) = a1;
    unint64_t v16 = v15 | 0x8000000000000000;
    unint64_t v17 = AvroValue.schema.getter();
    sub_25BE774A8();
    OUTLINED_FUNCTION_2_1();
    *uint64_t v18 = v16;
    v18[1] = v17;
    swift_willThrow();
    return sub_25BE79E14(a2, (void (*)(void, void, void, void, void, void, void, void, char))sub_25BE03FA4);
  }
  if ((v9 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (v9 < *(void *)(a1 + 16))
  {
    unint64_t v13 = *(void *)(a1 + 8 * v9 + 32);
    swift_retain();
    char v14 = sub_25BE58C30(a2, v13);
    uint64_t result = swift_release();
    if (v14)
    {
      *(void *)a3 = a1;
      *(void *)(a3 + 8) = v6;
      *(void *)(a3 + 16) = v7;
      *(void *)(a3 + 24) = v25;
      *(void *)(a3 + 32) = v24;
      *(void *)(a3 + 40) = v23;
      *(void *)(a3 + 48) = v22;
      *(void *)(a3 + 56) = v21;
      *(void *)(a3 + 64) = v20;
      *(unsigned char *)(a3 + 72) = v19;
      *(void *)(a3 + 80) = v9;
      return result;
    }
    goto LABEL_6;
  }
  __break(1u);
  return result;
}

uint64_t AvroUnion.hash(into:)(uint64_t a1)
{
  uint64_t v10 = *v1;
  swift_bridgeObjectRetain();
  sub_25BE5E17C();
  sub_25BE03DC0((uint64_t)&v10);
  memcpy(__dst, v1 + 1, 0x41uLL);
  sub_25BE660D4((uint64_t)__dst, (uint64_t)v9);
  sub_25BE660D4((uint64_t)v9, (uint64_t)&v16);
  switch(v21)
  {
    case 1:
      long long v3 = v17;
      *(void *)uint64_t v15 = v17;
      sub_25BE80600();
      swift_bridgeObjectRetain();
      sub_25BE7766C((uint64_t)v15);
      sub_25BE79E14((uint64_t)__dst, (void (*)(void, void, void, void, void, void, void, void, char))sub_25BE03DEC);
      swift_bridgeObjectRetain();
      sub_25BE7766C((uint64_t)v15);
      swift_bridgeObjectRetain();
      sub_25BE7FCB0();
      swift_retain();
      sub_25BE59B50(a1, v3);
      sub_25BE7769C((uint64_t)v15);
      swift_bridgeObjectRelease();
      sub_25BE7769C((uint64_t)v15);
      swift_bridgeObjectRetain();
      sub_25BE5E1DC(a1, *((void *)&v3 + 1));
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_25BE7769C((uint64_t)v15);
      goto LABEL_6;
    case 2:
      long long v4 = v16;
      long long v5 = v17;
      sub_25BE80600();
      sub_25BE79E14((uint64_t)__dst, (void (*)(void, void, void, void, void, void, void, void, char))sub_25BE03DEC);
      OUTLINED_FUNCTION_30_7();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      AvroMap.hash(into:)(a1, v4, *((void *)&v4 + 1), v5, *((void *)&v5 + 1));
      swift_bridgeObjectRelease();
      swift_release();
      goto LABEL_6;
    case 3:
      long long v22 = v16;
      long long v23 = v17;
      long long v24 = v18;
      uint64_t v6 = v20;
      uint64_t v25 = v19;
      sub_25BE80600();
      *(_OWORD *)uint64_t v15 = v22;
      *(_OWORD *)&v15[16] = v23;
      *(_OWORD *)&v15[32] = v24;
      *(void *)&v15[48] = v25;
      long long v11 = v22;
      long long v12 = v23;
      long long v13 = v24;
      uint64_t v14 = v25;
      sub_25BE79E14((uint64_t)__dst, (void (*)(void, void, void, void, void, void, void, void, char))sub_25BE03DEC);
      sub_25BE03D68((uint64_t)v15);
      AvroRecordSchema.hash(into:)();
      sub_25BE5E10C((uint64_t)v15);
      swift_bridgeObjectRetain();
      sub_25BE5E1DC(a1, v6);
LABEL_6:
      swift_bridgeObjectRelease();
      break;
    case 4:
      memcpy(v15, (const void *)(v16 + 16), sizeof(v15));
      sub_25BE80600();
      sub_25BE79E14((uint64_t)__dst, (void (*)(void, void, void, void, void, void, void, void, char))sub_25BE03DEC);
      sub_25BE608C0((uint64_t)v15);
      AvroUnion.hash(into:)(a1);
      sub_25BE60950((uint64_t)v15);
      break;
    default:
      OUTLINED_FUNCTION_51_4();
      sub_25BE80600();
      sub_25BE79E14((uint64_t)__dst, (void (*)(void, void, void, void, void, void, void, void, char))sub_25BE03DEC);
      OUTLINED_FUNCTION_50_4(a1);
      break;
  }
  sub_25BE79E14((uint64_t)__dst, (void (*)(void, void, void, void, void, void, void, void, char))sub_25BE03FA4);
  return sub_25BE80600();
}

BOOL static AvroUnion.__derived_struct_equals(_:_:)()
{
  OUTLINED_FUNCTION_13_10();
  if ((_s9SwiftAvro0B11UnionSchemaV23__derived_struct_equalsySbAC_ACtFZ_0(*v2, *v3) & 1) != 0
    && (memcpy(__dst, (const void *)(v1 + 8), 0x41uLL),
        memcpy(v5, (const void *)(v0 + 8), 0x41uLL),
        sub_25BE660D4((uint64_t)__dst, (uint64_t)v8),
        sub_25BE660D4((uint64_t)v5, (uint64_t)v6),
        (sub_25BE731AC((uint64_t)v8, (uint64_t)v6) & 1) != 0))
  {
    return *(void *)(v1 + 80) == *(void *)(v0 + 80);
  }
  else
  {
    return 0;
  }
}

uint64_t AvroUnion.hashValue.getter()
{
  OUTLINED_FUNCTION_2_25();
  AvroUnion.hash(into:)((uint64_t)v1);
  return sub_25BE80640();
}

uint64_t sub_25BE7727C()
{
  sub_25BE805F0();
  AvroUnion.hash(into:)((uint64_t)v1);
  return sub_25BE80640();
}

uint64_t AvroUnion.description.getter()
{
  __dst[0] = 0;
  __dst[1] = 0xE000000000000000;
  sub_25BE80060();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_17_8();
  memcpy(__dst, v0 + 1, 0x41uLL);
  uint64_t v1 = sub_25BE79E14((uint64_t)__dst, (void (*)(void, void, void, void, void, void, void, void, char))sub_25BE03DEC);
  AvroValue.description.getter(v1);
  OUTLINED_FUNCTION_36_2();
  swift_bridgeObjectRelease();
  sub_25BE79E14((uint64_t)__dst, (void (*)(void, void, void, void, void, void, void, void, char))sub_25BE03FA4);
  sub_25BE7FCD0();
  uint64_t v5 = v0[10];
  sub_25BE802D0();
  OUTLINED_FUNCTION_36_2();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_2_35();
  uint64_t v5 = *v0;
  uint64_t v2 = swift_bridgeObjectRetain();
  MEMORY[0x261176310](v2, &type metadata for AvroSchema);
  sub_25BE7FCD0();
  swift_bridgeObjectRelease();
  sub_25BE03DC0((uint64_t)&v5);
  OUTLINED_FUNCTION_18_8();
  return v4;
}

void sub_25BE77404()
{
}

void sub_25BE77418()
{
}

uint64_t sub_25BE7742C(uint64_t a1, int64_t a2, char a3)
{
  uint64_t result = sub_25BE774F4(a1, a2, a3, *v3);
  *long long v3 = result;
  return result;
}

uint64_t sub_25BE7744C()
{
  swift_bridgeObjectRelease();
  sub_25BE03FA4(*(void *)(v0 + 24), *(void *)(v0 + 32), *(void *)(v0 + 40), *(void *)(v0 + 48), *(void *)(v0 + 56), *(void *)(v0 + 64), *(void *)(v0 + 72), *(void *)(v0 + 80), *(unsigned char *)(v0 + 88));

  return MEMORY[0x270FA0238](v0, 104, 7);
}

unint64_t sub_25BE774A8()
{
  unint64_t result = qword_26A55B880;
  if (!qword_26A55B880)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A55B880);
  }
  return result;
}

uint64_t sub_25BE774F4(uint64_t result, int64_t a2, char a3, uint64_t a4)
{
  char v5 = result;
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A55B878);
    uint64_t v10 = swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size_0((const void *)v10);
    *(void *)(v10 + 16) = v8;
    *(void *)(v10 + 24) = 2 * ((uint64_t)(v11 - 32) / 72);
  }
  else
  {
    uint64_t v10 = MEMORY[0x263F8EE78];
  }
  if (v5)
  {
    sub_25BE6FFDC((char *)(a4 + 32), v8, (char *)(v10 + 32));
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

uint64_t sub_25BE775F4@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
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
    unint64_t result = sub_25BE7E7C0();
    unint64_t v5 = v7 & 0xFFFFFFFFFFFFFFLL;
  }
  else if ((unint64_t)v4 >= 0x7FFFFFFF)
  {
    unint64_t result = MEMORY[0x261174D60]();
    unint64_t v5 = v8 | 0x8000000000000000;
  }
  else
  {
    unint64_t result = MEMORY[0x261174D80]();
    unint64_t v5 = v6 | 0x4000000000000000;
  }
LABEL_5:
  *a3 = result;
  a3[1] = v5;
  return result;
}

uint64_t sub_25BE7766C(uint64_t a1)
{
  return a1;
}

uint64_t sub_25BE7769C(uint64_t a1)
{
  return a1;
}

uint64_t sub_25BE776CC(uint64_t a1)
{
  return a1;
}

uint64_t sub_25BE776F8(uint64_t a1, uint64_t a2)
{
  return a2;
}

void *sub_25BE77754(void *a1)
{
  return sub_25BE7578C(a1);
}

uint64_t sub_25BE77770(uint64_t a1, uint64_t a2)
{
  uint64_t v264 = a1;
  uint64_t v289 = *MEMORY[0x263EF8340];
  uint64_t v3 = a2 + 64;
  uint64_t v4 = 1 << *(unsigned char *)(a2 + 32);
  uint64_t v5 = -1;
  if (v4 < 64) {
    uint64_t v5 = ~(-1 << v4);
  }
  unint64_t v6 = v5 & *(void *)(a2 + 64);
  int64_t v214 = (unint64_t)(v4 + 63) >> 6;
  swift_bridgeObjectRetain();
  uint64_t v7 = 0;
  uint64_t v8 = 0;
  uint64_t v261 = a2;
  uint64_t v217 = v3;
  while (1)
  {
    uint64_t v273 = v7;
    if (v6)
    {
      uint64_t v271 = (v6 - 1) & v6;
      uint64_t v272 = v8;
      unint64_t v9 = __clz(__rbit64(v6)) | (v8 << 6);
      goto LABEL_18;
    }
    int64_t v10 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
      __break(1u);
      goto LABEL_96;
    }
    if (v10 >= v214) {
      goto LABEL_94;
    }
    unint64_t v11 = *(void *)(v217 + 8 * v10);
    int64_t v12 = v8 + 1;
    if (!v11)
    {
      int64_t v12 = v8 + 2;
      if (v8 + 2 >= v214) {
        goto LABEL_94;
      }
      unint64_t v11 = *(void *)(v217 + 8 * v12);
      if (!v11) {
        break;
      }
    }
LABEL_17:
    uint64_t v271 = (v11 - 1) & v11;
    uint64_t v272 = v12;
    unint64_t v9 = __clz(__rbit64(v11)) + (v12 << 6);
LABEL_18:
    uint64_t v14 = *(void *)(v261 + 56) + 72 * v9;
    uint64_t v16 = *(void *)v14;
    unint64_t v15 = *(void *)(v14 + 8);
    uint64_t v17 = *(void *)(v14 + 16);
    uint64_t v18 = *(void *)(v14 + 24);
    uint64_t v20 = *(void *)(v14 + 32);
    uint64_t v19 = *(void *)(v14 + 40);
    uint64_t v21 = *(void *)(v14 + 48);
    uint64_t v22 = *(void *)(v14 + 56);
    uint64_t v23 = *(unsigned __int8 *)(v14 + 64);
    uint64_t v24 = *(void *)(v264 + 64);
    long long v25 = *(_OWORD *)(v264 + 16);
    v283[0] = *(_OWORD *)v264;
    v283[1] = v25;
    long long v26 = *(_OWORD *)(v264 + 48);
    v283[2] = *(_OWORD *)(v264 + 32);
    v283[3] = v26;
    uint64_t v284 = v24;
    swift_bridgeObjectRetain();
    uint64_t v274 = v16;
    unint64_t v276 = v17;
    uint64_t v27 = v16;
    unint64_t v28 = v15;
    uint64_t v29 = v18;
    uint64_t v30 = v22;
    uint64_t v278 = v20;
    uint64_t v280 = v29;
    sub_25BE03DEC(v27, v15, v17, v29, v20, v19, v21, v22, v23);
    sub_25BE7FCB0();
    swift_bridgeObjectRelease();
    char v31 = v23;
    switch(v23)
    {
      case 1:
        OUTLINED_FUNCTION_57_3();
        uint64_t v32 = v276;
        OUTLINED_FUNCTION_34_4();
        unint64_t v34 = v15;
        swift_bridgeObjectRetain();
        uint64_t v33 = v274;
        unint64_t v36 = v28;
        uint64_t v37 = v20;
        OUTLINED_FUNCTION_1_32(v274, v36, v276, v280, v20, v38, v39, v40, 1);
        swift_bridgeObjectRetain();
        swift_retain();
        swift_bridgeObjectRetain();
        OUTLINED_FUNCTION_24_7();
        swift_retain();
        sub_25BE59B50((uint64_t)v283, v276);
        swift_bridgeObjectRelease();
        OUTLINED_FUNCTION_37_2();
        swift_bridgeObjectRetain();
        sub_25BE5E1DC((uint64_t)v283, v280);
        goto LABEL_23;
      case 2:
        OUTLINED_FUNCTION_56_3();
        uint64_t v32 = v276;
        OUTLINED_FUNCTION_34_4();
        unint64_t v34 = v15;
        swift_bridgeObjectRetain();
        uint64_t v33 = v274;
        unint64_t v41 = v28;
        uint64_t v37 = v20;
        OUTLINED_FUNCTION_1_32(v274, v41, v276, v280, v20, v42, v43, v44, 2);
        swift_bridgeObjectRetain();
        swift_retain();
        swift_bridgeObjectRetain();
        OUTLINED_FUNCTION_24_7();
        swift_retain();
        sub_25BE59B50((uint64_t)v283, v276);
        swift_bridgeObjectRelease();
        OUTLINED_FUNCTION_37_2();
        swift_bridgeObjectRetain();
        sub_25BE77770(v283, v280);
LABEL_23:
        uint64_t v45 = v37;
        swift_release();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease_n();
        goto LABEL_77;
      case 3:
        OUTLINED_FUNCTION_58_4();
        uint64_t v33 = v274;
        uint64_t v32 = v276;
        unint64_t v34 = v28;
        OUTLINED_FUNCTION_1_32(v274, v28, v276, v280, v20, v46, v47, v48, 3);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain_n();
        swift_bridgeObjectRetain();
        OUTLINED_FUNCTION_24_7();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRetain();
        sub_25BE7FCB0();
        swift_bridgeObjectRelease();
        sub_25BE80610();
        if (v19)
        {
          swift_bridgeObjectRetain();
          sub_25BE7FCB0();
          swift_bridgeObjectRelease();
        }
        uint64_t v64 = *(void *)(v21 + 16);
        sub_25BE80600();
        if (v64)
        {
          char v251 = v31;
          swift_bridgeObjectRetain();
          uint64_t v65 = (unint64_t *)(v21 + 48);
          do
          {
            unint64_t v66 = *v65;
            v65 += 3;
            swift_retain();
            swift_bridgeObjectRetain();
            sub_25BE7FCB0();
            swift_retain();
            sub_25BE59B50((uint64_t)v283, v66);
            swift_bridgeObjectRelease();
            swift_release_n();
            --v64;
          }
          while (v64);
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease_n();
          uint64_t v32 = v276;
          uint64_t v45 = v20;
          char v31 = v251;
        }
        else
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          uint64_t v45 = v20;
        }
        swift_bridgeObjectRetain();
        sub_25BE5E1DC((uint64_t)v283, v30);
        swift_bridgeObjectRelease();
        goto LABEL_77;
      case 4:
        uint64_t v236 = v19;
        uint64_t v248 = v23;
        uint64_t v253 = v22;
        uint64_t v257 = v21;
        uint64_t v49 = *(void *)(v274 + 16);
        unint64_t v50 = *(void *)(v274 + 32);
        uint64_t v226 = *(void *)(v274 + 40);
        uint64_t v51 = *(void *)(v274 + 48);
        uint64_t v267 = *(void *)(v274 + 56);
        uint64_t v52 = *(void *)(v274 + 72);
        uint64_t v240 = *(void *)(v274 + 80);
        uint64_t v244 = *(void *)(v274 + 24);
        uint64_t v53 = *(unsigned __int8 *)(v274 + 88);
        uint64_t v204 = *(void *)(v274 + 96);
        OUTLINED_FUNCTION_59_3();
        sub_25BE80600();
        uint64_t v54 = *(void *)(v49 + 16);
        if (v54)
        {
          OUTLINED_FUNCTION_32_5(v276, 4, v190, v195, v198, v201, v204, v49, v15, v214, v217, v51, v50, v226, v52, v53, v236, v240, v244,
            v248,
            v253,
            v257,
            v261,
            v264,
            v267,
            v271,
            v272,
            v273,
            v274,
            v276,
            v278,
            v280);
          swift_bridgeObjectRetain();
          uint64_t v55 = v227;
          OUTLINED_FUNCTION_38_5(v245, v50, v227, v56, v57, v58, v59, v241, v53, v196, v199, v202, v205, v208, v211, v215, v218, v220, v223,
            v227,
            v230,
            v233,
            v237,
            v241,
            v245,
            v249,
            v254,
            v258,
            v262,
            v265,
            v268);
          swift_bridgeObjectRetain();
          uint64_t v60 = 0;
          uint64_t v61 = v55;
          do
          {
            unint64_t v62 = *(void *)(v49 + 8 * v60++ + 32);
            OUTLINED_FUNCTION_34_4();
            sub_25BE59B50((uint64_t)v283, v62);
            swift_release();
          }
          while (v54 != v60);
          swift_bridgeObjectRelease();
          uint64_t v63 = v234;
        }
        else
        {
          OUTLINED_FUNCTION_32_5(v276, 4, v190, v195, v198, v201, v204, v49, v15, v214, v217, v51, v50, v226, v52, v53, v236, v240, v244,
            v248,
            v253,
            v257,
            v261,
            v264,
            v267,
            v271,
            v272,
            v273,
            v274,
            v276,
            v278,
            v280);
          swift_bridgeObjectRetain();
          uint64_t v67 = v229;
          OUTLINED_FUNCTION_38_5(v247, v50, v229, v68, v69, v70, v71, v243, v53, v197, v200, v203, v207, v210, v213, v216, v219, v222, v225,
            v229,
            v232,
            v235,
            v239,
            v243,
            v247,
            v252,
            v256,
            v260,
            v263,
            v266,
            v270);
          uint64_t v61 = v67;
          uint64_t v63 = v53;
        }
        switch(v63)
        {
          case 1:
            OUTLINED_FUNCTION_57_3();
            OUTLINED_FUNCTION_30_7();
            swift_bridgeObjectRetain();
            OUTLINED_FUNCTION_6_23(1, v191, v195, v198, v201, v206, v209, v212, v214, v217, v221, v224, v228, v231, v234, v238, v242, v246, v250,
              v255,
              v259,
              v261,
              v264,
              v269);
            swift_bridgeObjectRetain();
            swift_retain();
            swift_bridgeObjectRetain();
            OUTLINED_FUNCTION_62_2();
            swift_retain();
            sub_25BE59B50((uint64_t)v283, v28);
            swift_bridgeObjectRelease();
            OUTLINED_FUNCTION_37_2();
            swift_bridgeObjectRetain();
            sub_25BE5E1DC((uint64_t)v283, v50);
            goto LABEL_42;
          case 2:
            OUTLINED_FUNCTION_56_3();
            OUTLINED_FUNCTION_30_7();
            swift_bridgeObjectRetain();
            OUTLINED_FUNCTION_6_23(2, v191, v195, v198, v201, v206, v209, v212, v214, v217, v221, v224, v228, v231, v234, v238, v242, v246, v250,
              v255,
              v259,
              v261,
              v264,
              v269);
            swift_bridgeObjectRetain();
            swift_retain();
            swift_bridgeObjectRetain();
            OUTLINED_FUNCTION_62_2();
            swift_retain();
            sub_25BE59B50((uint64_t)v283, v28);
            swift_bridgeObjectRelease();
            OUTLINED_FUNCTION_37_2();
            swift_bridgeObjectRetain();
            sub_25BE77770(v283, v50);
LABEL_42:
            swift_release();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease_n();
            break;
          case 3:
            OUTLINED_FUNCTION_58_4();
            sub_25BE03DEC(v246, v224, v61, v221, v269, v50, v231, v242, 3);
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain_n();
            swift_bridgeObjectRetain();
            OUTLINED_FUNCTION_37_4();
            sub_25BE7FCB0();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRetain();
            sub_25BE7FCB0();
            swift_bridgeObjectRelease();
            uint64_t v201 = v50;
            sub_25BE80610();
            if (v50)
            {
              swift_bridgeObjectRetain();
              sub_25BE7FCB0();
              swift_bridgeObjectRelease();
            }
            uint64_t v93 = *(void *)(v231 + 16);
            sub_25BE80600();
            if (v93)
            {
              swift_bridgeObjectRetain();
              char v94 = (unint64_t *)(v231 + 48);
              do
              {
                unint64_t v95 = *v94;
                v94 += 3;
                swift_retain();
                swift_bridgeObjectRetain();
                sub_25BE7FCB0();
                swift_retain();
                sub_25BE59B50((uint64_t)v283, v95);
                swift_bridgeObjectRelease();
                swift_release_n();
                --v93;
              }
              while (v93);
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease_n();
            }
            else
            {
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
            }
            swift_bridgeObjectRetain();
            sub_25BE5E1DC((uint64_t)v283, v242);
            swift_bridgeObjectRelease();
            break;
          case 4:
            memcpy(__dst, (const void *)(v246 + 16), sizeof(__dst));
            OUTLINED_FUNCTION_59_3();
            OUTLINED_FUNCTION_31_8();
            sub_25BE03DEC(v72, v73, v74, v75, v76, v77, v78, v242, 4);
            sub_25BE608C0((uint64_t)__dst);
            AvroUnion.hash(into:)((uint64_t)v283);
            sub_25BE60950((uint64_t)__dst);
            break;
          default:
            OUTLINED_FUNCTION_60_3();
            switch(v221)
            {
              case 1:
                OUTLINED_FUNCTION_56_3();
                goto LABEL_69;
              case 2:
                OUTLINED_FUNCTION_58_4();
                goto LABEL_71;
              case 3:
                OUTLINED_FUNCTION_59_3();
LABEL_69:
                sub_25BE80620();
                goto LABEL_76;
              case 4:
                sub_25BE80600();
LABEL_71:
                sub_25BE80630();
                break;
              case 5:
                sub_25BE80600();
                OUTLINED_FUNCTION_31_8();
                sub_25BE03DEC(v112, v113, v114, v115, v116, v117, v118, v119, 0);
                sub_25BE7FCB0();
                break;
              case 6:
                sub_25BE80600();
                uint64_t v201 = v50;
                if (((v224 >> 60) & 3) != 0)
                {
                  sub_25BE03DEC(v246, v224, v228, v221, v269, v50, v231, v242, 0);
                  uint64_t v120 = OUTLINED_FUNCTION_70_2();
                  sub_25BCBA6A8(v120, v121);
                }
                else
                {
                  uint64_t v171 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A55B7D0);
                  uint64_t v286 = v171;
                  unint64_t v287 = sub_25BE609E0();
                  v285[0] = v246;
                  v172 = __swift_project_boxed_opaque_existential_1(v285, v171);
                  uint64_t v173 = *v172;
                  size_t v174 = *(void *)(*v172 + 16);
                  if (v174)
                  {
                    if (v174 <= 0xE)
                    {
                      memset(v281, 0, sizeof(v281));
                      char v282 = v174;
                      memcpy(v281, (const void *)(v173 + 32), v174);
                      OUTLINED_FUNCTION_29_5();
                      uint64_t v198 = v181 | (v180 << 48);
                      OUTLINED_FUNCTION_71_2();
                      sub_25BE03DEC(v182, v183, v184, v185, v269, v50, v231, v242, 0);
                      sub_25BE03DEC(v246, v50, v228, v221, v269, v50, v231, v242, 0);
                    }
                    else
                    {
                      unint64_t v175 = *(void *)(*v172 + 16);
                      uint64_t v198 = v173 + 32;
                      sub_25BE7E650();
                      uint64_t v195 = swift_allocObject();
                      OUTLINED_FUNCTION_71_2();
                      sub_25BE03DEC(v176, v177, v178, v179, v269, v50, v231, v242, 0);
                      sub_25BE03DEC(v246, v50, v228, v221, v269, v50, v231, v242, 0);
                      sub_25BE7E610();
                      if (v175 >= 0x7FFFFFFF)
                      {
                        sub_25BE7E820();
                        uint64_t v186 = swift_allocObject();
                        *(void *)(v186 + 16) = 0;
                        *(void *)(v186 + 24) = v175;
                      }
                    }
                  }
                  else
                  {
                    sub_25BE03DEC(v246, v224, v228, v221, v269, v50, v231, v242, 0);
                    sub_25BE03DEC(v246, v224, v228, v221, v269, v50, v231, v242, 0);
                  }
                  __swift_destroy_boxed_opaque_existential_1((uint64_t)v285);
                }
                OUTLINED_FUNCTION_70_2();
                sub_25BE7E8C0();
                uint64_t v187 = OUTLINED_FUNCTION_70_2();
                sub_25BCB9998(v187, v188);
                sub_25BE80600();
                break;
              case 7:
                OUTLINED_FUNCTION_60_3();
                break;
              default:
                OUTLINED_FUNCTION_57_3();
                sub_25BE80610();
                break;
            }
            break;
        }
LABEL_76:
        uint64_t v122 = OUTLINED_FUNCTION_49_3();
        OUTLINED_FUNCTION_23_6(v122, v123, v124, v125, v269, v126, v127, v128, v234);
        sub_25BE80600();
        swift_bridgeObjectRelease();
        uint64_t v129 = OUTLINED_FUNCTION_49_3();
        OUTLINED_FUNCTION_23_6(v129, v130, v131, v132, v269, v133, v134, v135, v234);
        uint64_t v33 = v275;
        uint64_t v32 = v277;
        uint64_t v45 = v279;
        char v31 = v250;
        unint64_t v34 = v212;
LABEL_77:
        uint64_t v35 = v273;
        break;
      default:
        OUTLINED_FUNCTION_60_3();
        uint64_t v33 = v274;
        uint64_t v32 = v276;
        unint64_t v34 = v28;
        uint64_t v35 = v273;
        switch((char)v280)
        {
          case 1:
            OUTLINED_FUNCTION_56_3();
            goto LABEL_49;
          case 2:
            OUTLINED_FUNCTION_58_4();
            goto LABEL_51;
          case 3:
            OUTLINED_FUNCTION_59_3();
LABEL_49:
            sub_25BE80620();
            goto LABEL_88;
          case 4:
            sub_25BE80600();
LABEL_51:
            sub_25BE80630();
            goto LABEL_88;
          case 5:
            sub_25BE80600();
            uint64_t v79 = OUTLINED_FUNCTION_41_2();
            uint64_t v45 = v20;
            OUTLINED_FUNCTION_1_32(v79, v80, v81, v280, v20, v82, v83, v84, 0);
            OUTLINED_FUNCTION_24_7();
            goto LABEL_78;
          case 6:
            sub_25BE80600();
            if (((v34 >> 60) & 3) != 0)
            {
              unint64_t v85 = v34 & 0xCFFFFFFFFFFFFFFFLL;
              uint64_t v86 = OUTLINED_FUNCTION_41_2();
              OUTLINED_FUNCTION_1_32(v86, v87, v88, v280, v20, v89, v90, v91, 0);
              sub_25BCBA6A8(v274, v34 & 0xCFFFFFFFFFFFFFFFLL);
              uint64_t v92 = v274;
            }
            else
            {
              uint64_t v96 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A55B7D0);
              uint64_t v286 = v96;
              unint64_t v287 = sub_25BE609E0();
              v285[0] = v274;
              uint64_t v97 = __swift_project_boxed_opaque_existential_1(v285, v96);
              uint64_t v98 = *v97;
              size_t v99 = *(void *)(*v97 + 16);
              if (v99)
              {
                if (v99 <= 0xE)
                {
                  memset(v281, 0, sizeof(v281));
                  char v282 = v99;
                  memcpy(v281, (const void *)(v98 + 32), v99);
                  uint64_t v92 = *(void *)v281;
                  OUTLINED_FUNCTION_29_5();
                  unint64_t v85 = v157 | (v158 << 48);
                  uint64_t v159 = OUTLINED_FUNCTION_19_8();
                  OUTLINED_FUNCTION_1_32(v159, v160, v276, v280, v20, v161, v162, v163, v190);
                  uint64_t v164 = OUTLINED_FUNCTION_39_3();
                  OUTLINED_FUNCTION_1_32(v164, v165, v166, v167, v20, v168, v169, v170, v194);
                }
                else
                {
                  sub_25BE7E650();
                  swift_allocObject();
                  uint64_t v100 = OUTLINED_FUNCTION_19_8();
                  OUTLINED_FUNCTION_1_32(v100, v101, v276, v280, v20, v102, v103, v104, v190);
                  uint64_t v105 = OUTLINED_FUNCTION_19_8();
                  OUTLINED_FUNCTION_1_32(v105, v106, v276, v280, v20, v107, v108, v109, v192);
                  OUTLINED_FUNCTION_135();
                  uint64_t v110 = sub_25BE7E610();
                  uint64_t v111 = v110;
                  if (v99 >= 0x7FFFFFFF)
                  {
                    sub_25BE7E820();
                    uint64_t v92 = swift_allocObject();
                    *(void *)(v92 + 16) = 0;
                    *(void *)(v92 + 24) = v99;
                    unint64_t v85 = v111 | 0x8000000000000000;
                  }
                  else
                  {
                    uint64_t v92 = v99 << 32;
                    unint64_t v85 = v110 | 0x4000000000000000;
                  }
                }
              }
              else
              {
                uint64_t v145 = OUTLINED_FUNCTION_19_8();
                OUTLINED_FUNCTION_1_32(v145, v146, v276, v280, v20, v147, v148, v149, v190);
                uint64_t v150 = OUTLINED_FUNCTION_39_3();
                OUTLINED_FUNCTION_1_32(v150, v151, v152, v153, v20, v154, v155, v156, v193);
                uint64_t v92 = 0;
                unint64_t v85 = 0xC000000000000000;
              }
              __swift_destroy_boxed_opaque_existential_1((uint64_t)v285);
            }
            sub_25BE7E8C0();
            sub_25BCB9998(v92, v85);
            sub_25BE80600();
            uint64_t v32 = v276;
            uint64_t v35 = v273;
            goto LABEL_88;
          case 7:
            OUTLINED_FUNCTION_60_3();
            goto LABEL_88;
          default:
            OUTLINED_FUNCTION_57_3();
            sub_25BE80610();
LABEL_88:
            uint64_t v45 = v20;
            break;
        }
        break;
    }
LABEL_78:
    uint64_t v136 = OUTLINED_FUNCTION_41_2();
    OUTLINED_FUNCTION_23_6(v136, v137, v138, v280, v45, v139, v140, v141, v31);
    OUTLINED_FUNCTION_23_6(v33, v34, v32, v280, v45, v142, v143, v144, v31);
    uint64_t v7 = sub_25BE80640() ^ v35;
    unint64_t v6 = v271;
    uint64_t v8 = v272;
  }
  uint64_t v13 = v8 + 3;
  if (v8 + 3 < v214)
  {
    unint64_t v11 = *(void *)(v217 + 8 * v13);
    if (!v11)
    {
      while (1)
      {
        int64_t v12 = v13 + 1;
        if (__OFADD__(v13, 1)) {
          break;
        }
        if (v12 >= v214) {
          goto LABEL_94;
        }
        unint64_t v11 = *(void *)(v217 + 8 * v12);
        ++v13;
        if (v11) {
          goto LABEL_17;
        }
      }
LABEL_96:
      __break(1u);
    }
    int64_t v12 = v8 + 3;
    goto LABEL_17;
  }
LABEL_94:
  swift_release();
  return sub_25BE80600();
}

uint64_t sub_25BE788C4(uint64_t a1, uint64_t a2)
{
  return a2;
}

unint64_t sub_25BE78900()
{
  unint64_t result = qword_26A55B888;
  if (!qword_26A55B888)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A55B888);
  }
  return result;
}

unint64_t sub_25BE78950()
{
  unint64_t result = qword_26A55B890;
  if (!qword_26A55B890)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A55B890);
  }
  return result;
}

unint64_t sub_25BE789A0()
{
  unint64_t result = qword_26A55B898;
  if (!qword_26A55B898)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A55B898);
  }
  return result;
}

unint64_t sub_25BE789F0()
{
  unint64_t result = qword_26A55B8A0;
  if (!qword_26A55B8A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A55B8A0);
  }
  return result;
}

uint64_t sub_25BE78A3C()
{
  return MEMORY[0x263F8D528];
}

uint64_t sub_25BE78A48()
{
  return MEMORY[0x263F8D748];
}

uint64_t sub_25BE78A54()
{
  return MEMORY[0x263F8D5B0];
}

unint64_t sub_25BE78A64()
{
  unint64_t result = qword_26A55B8A8;
  if (!qword_26A55B8A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A55B8A8);
  }
  return result;
}

uint64_t sub_25BE78AB0()
{
  return MEMORY[0x263F8D388];
}

unint64_t sub_25BE78AC0()
{
  unint64_t result = qword_26A55B8B0;
  if (!qword_26A55B8B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A55B8B0);
  }
  return result;
}

uint64_t sub_25BE78B0C()
{
  return MEMORY[0x263F8D398];
}

uint64_t sub_25BE78B18()
{
  return MEMORY[0x263F8D390];
}

unint64_t sub_25BE78B28()
{
  unint64_t result = qword_26A55B8B8;
  if (!qword_26A55B8B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A55B8B8);
  }
  return result;
}

uint64_t sub_25BE78B74()
{
  return MEMORY[0x263F8E240];
}

unint64_t sub_25BE78B84()
{
  unint64_t result = qword_26A55B8C0;
  if (!qword_26A55B8C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A55B8C0);
  }
  return result;
}

unint64_t sub_25BE78BD4()
{
  unint64_t result = qword_26A55B8C8;
  if (!qword_26A55B8C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A55B8C8);
  }
  return result;
}

unint64_t sub_25BE78C24()
{
  unint64_t result = qword_26A55B8D0;
  if (!qword_26A55B8D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A55B8D0);
  }
  return result;
}

unint64_t sub_25BE78C74()
{
  unint64_t result = qword_26A55B8D8;
  if (!qword_26A55B8D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A55B8D8);
  }
  return result;
}

unint64_t sub_25BE78CC4()
{
  unint64_t result = qword_26A55B8E0;
  if (!qword_26A55B8E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A55B8E0);
  }
  return result;
}

uint64_t destroy for SchemaMismatchError()
{
  swift_release();

  return swift_release();
}

void *_s9SwiftAvro19SchemaMismatchErrorVwCP_0(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain();
  swift_retain();
  return a1;
}

void *assignWithCopy for SchemaMismatchError(void *a1, void *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  return a1;
}

_OWORD *assignWithTake for SchemaMismatchError(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for SchemaMismatchError(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0x7C && *(unsigned char *)(a1 + 16))
    {
      unsigned int v2 = *(_DWORD *)a1 + 123;
    }
    else
    {
      unsigned int v2 = (((*(void *)a1 >> 57) >> 4) | (8 * ((*(void *)a1 >> 57) & 8 | *(void *)a1 & 7))) ^ 0x7F;
      if (v2 >= 0x7B) {
        unsigned int v2 = -1;
      }
    }
  }
  else
  {
    unsigned int v2 = -1;
  }
  return v2 + 1;
}

uint64_t storeEnumTagSinglePayload for SchemaMismatchError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7B)
  {
    *(void *)unint64_t result = a2 - 124;
    *(void *)(result + 8) = 0;
    if (a3 >= 0x7C) {
      *(unsigned char *)(result + 16) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7C) {
      *(unsigned char *)(result + 16) = 0;
    }
    if (a2)
    {
      uint64_t v3 = (-a2 >> 3) & 0xF | (16 * (-a2 & 0x7F));
      *(void *)unint64_t result = (v3 | (v3 << 57)) & 0xF000000000000007;
    }
  }
  return result;
}

void type metadata accessor for SchemaMismatchError()
{
}

void type metadata accessor for InvalidFieldError()
{
}

uint64_t sub_25BE78F18(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)unint64_t result = a2 ^ 0x80000000;
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
      return OUTLINED_FUNCTION_55_3(result, a2);
    }
    *(unsigned char *)(result + 16) = 0;
    if (a2) {
      return OUTLINED_FUNCTION_55_3(result, a2);
    }
  }
  return result;
}

void type metadata accessor for InternalError()
{
}

void *__swift_memcpy65_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x41uLL);
}

void type metadata accessor for AvroValue()
{
}

uint64_t destroy for AvroRecord()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for AvroRecord(void *a1, void *a2)
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
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for AvroRecord(void *a1, void *a2)
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
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
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

uint64_t assignWithTake for AvroRecord(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for AvroRecord(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 64))
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

uint64_t storeEnumTagSinglePayload for AvroRecord(uint64_t result, int a2, int a3)
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

void type metadata accessor for AvroRecord()
{
}

__n128 __swift_memcpy32_8(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

void type metadata accessor for AvroArray()
{
}

uint64_t _s9SwiftAvro9AvroArrayVwxx_0()
{
  swift_bridgeObjectRelease();
  swift_release();

  return swift_bridgeObjectRelease();
}

void *_s9SwiftAvro9AvroArrayVwcp_0(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  swift_bridgeObjectRetain();
  swift_retain();
  swift_bridgeObjectRetain();
  return a1;
}

void *_s9SwiftAvro9AvroArrayVwca_0()
{
  OUTLINED_FUNCTION_13_10();
  *uint64_t v3 = *v2;
  v1[1] = v2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v1[2] = *(void *)(v0 + 16);
  swift_retain();
  swift_release();
  v1[3] = *(void *)(v0 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return v1;
}

void *_s9SwiftAvro9AvroArrayVwta_0()
{
  OUTLINED_FUNCTION_13_10();
  uint64_t v3 = v2[1];
  *uint64_t v1 = *v2;
  v1[1] = v3;
  swift_bridgeObjectRelease();
  v1[2] = *(void *)(v0 + 16);
  swift_release();
  v1[3] = *(void *)(v0 + 24);
  swift_bridgeObjectRelease();
  return v1;
}

uint64_t _s9SwiftAvro9AvroArrayVwet_0(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 32))
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

uint64_t sub_25BE79420(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 32) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
      return OUTLINED_FUNCTION_55_3(result, a2);
    }
    *(unsigned char *)(result + 32) = 0;
    if (a2) {
      return OUTLINED_FUNCTION_55_3(result, a2);
    }
  }
  return result;
}

void type metadata accessor for AvroMap()
{
}

__n128 __swift_memcpy25_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  *(_OWORD *)(a1 + 9) = *(_OWORD *)(a2 + 9);
  *(__n128 *)a1 = result;
  return result;
}

void type metadata accessor for AvroPrimitive()
{
}

uint64_t destroy for AvroUnion(uint64_t a1)
{
  return sub_25BE03FA4(*(void *)(a1 + 8), *(void *)(a1 + 16), *(void *)(a1 + 24), *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64), *(unsigned char *)(a1 + 72));
}

uint64_t initializeWithCopy for AvroUnion(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  unint64_t v5 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  uint64_t v7 = *(void *)(a2 + 32);
  uint64_t v8 = *(void *)(a2 + 40);
  uint64_t v9 = *(void *)(a2 + 48);
  uint64_t v10 = *(void *)(a2 + 56);
  uint64_t v13 = *(void *)(a2 + 64);
  char v11 = *(unsigned char *)(a2 + 72);
  swift_bridgeObjectRetain();
  sub_25BE03DEC(v4, v5, v6, v7, v8, v9, v10, v13, v11);
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  *(void *)(a1 + 32) = v7;
  *(void *)(a1 + 40) = v8;
  *(void *)(a1 + 48) = v9;
  *(void *)(a1 + 56) = v10;
  *(void *)(a1 + 64) = v13;
  *(unsigned char *)(a1 + 72) = v11;
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  return a1;
}

uint64_t assignWithCopy for AvroUnion(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(a2 + 8);
  unint64_t v5 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  uint64_t v7 = *(void *)(a2 + 32);
  uint64_t v8 = *(void *)(a2 + 40);
  uint64_t v9 = *(void *)(a2 + 48);
  uint64_t v10 = *(void *)(a2 + 56);
  uint64_t v11 = *(void *)(a2 + 64);
  char v22 = *(unsigned char *)(a2 + 72);
  sub_25BE03DEC(v4, v5, v6, v7, v8, v9, v10, v11, v22);
  uint64_t v12 = *(void *)(a1 + 8);
  unint64_t v13 = *(void *)(a1 + 16);
  uint64_t v14 = *(void *)(a1 + 24);
  uint64_t v15 = *(void *)(a1 + 32);
  uint64_t v16 = *(void *)(a1 + 40);
  uint64_t v17 = *(void *)(a1 + 48);
  uint64_t v18 = *(void *)(a1 + 56);
  uint64_t v19 = *(void *)(a1 + 64);
  char v20 = *(unsigned char *)(a1 + 72);
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  *(void *)(a1 + 32) = v7;
  *(void *)(a1 + 40) = v8;
  *(void *)(a1 + 48) = v9;
  *(void *)(a1 + 56) = v10;
  *(void *)(a1 + 64) = v11;
  *(unsigned char *)(a1 + 72) = v22;
  sub_25BE03FA4(v12, v13, v14, v15, v16, v17, v18, v19, v20);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  return a1;
}

void *__swift_memcpy88_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x58uLL);
}

uint64_t assignWithTake for AvroUnion(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  char v4 = *(unsigned char *)(a2 + 72);
  uint64_t v5 = *(void *)(a1 + 8);
  unint64_t v6 = *(void *)(a1 + 16);
  uint64_t v7 = *(void *)(a1 + 24);
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = *(void *)(a1 + 40);
  uint64_t v10 = *(void *)(a1 + 48);
  uint64_t v11 = *(void *)(a1 + 56);
  uint64_t v12 = *(void *)(a1 + 64);
  char v13 = *(unsigned char *)(a1 + 72);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(unsigned char *)(a1 + 72) = v4;
  sub_25BE03FA4(v5, v6, v7, v8, v9, v10, v11, v12, v13);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  return a1;
}

uint64_t getEnumTagSinglePayload for AvroUnion(uint64_t *a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *((unsigned char *)a1 + 88))
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

uint64_t storeEnumTagSinglePayload for AvroUnion(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 88) = 1;
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
    *(unsigned char *)(result + 88) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

void type metadata accessor for AvroUnion()
{
}

uint64_t sub_25BE797C4(uint64_t a1)
{
  return sub_25BE040F4(*(void *)a1, *(void *)(a1 + 8));
}

uint64_t *sub_25BE797D4(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  unint64_t v4 = a2[1];
  uint64_t v5 = a2[2];
  sub_25BE03F28(*a2, v4);
  *a1 = v3;
  a1[1] = v4;
  a1[2] = v5;
  return a1;
}

uint64_t *sub_25BE79820(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  unint64_t v4 = a2[1];
  uint64_t v5 = a2[2];
  sub_25BE03F28(*a2, v4);
  uint64_t v6 = *a1;
  unint64_t v7 = a1[1];
  *a1 = v3;
  a1[1] = v4;
  a1[2] = v5;
  sub_25BE040F4(v6, v7);
  return a1;
}

uint64_t *sub_25BE79878(uint64_t *a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 16);
  uint64_t v4 = *a1;
  unint64_t v5 = a1[1];
  *(_OWORD *)a1 = *(_OWORD *)a2;
  a1[2] = v3;
  sub_25BE040F4(v4, v5);
  return a1;
}

uint64_t sub_25BE798BC(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 == 1 || !*(unsigned char *)(a1 + 24))
    {
      if ((~*(void *)(a1 + 8) & 0x3000000000000000) != 0) {
        int v2 = -1;
      }
      else {
        int v2 = 0;
      }
    }
    else
    {
      int v2 = *(_DWORD *)a1 + 1;
    }
  }
  else
  {
    int v2 = -1;
  }
  return (v2 + 1);
}

uint64_t sub_25BE798FC(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 1)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)__n128 result = a2 - 2;
    if (a3 >= 2) {
      *(unsigned char *)(result + 24) = 1;
    }
  }
  else
  {
    if (a3 >= 2) {
      *(unsigned char *)(result + 24) = 0;
    }
    if (a2)
    {
      *(_OWORD *)__n128 result = xmmword_25BE99150;
      *(void *)(result + 16) = 0;
    }
  }
  return result;
}

uint64_t sub_25BE79948(uint64_t a1)
{
  return (*(void *)(a1 + 8) >> 60) & 3;
}

uint64_t sub_25BE79954(uint64_t result)
{
  *(void *)(result + 8) &= 0xCFFFFFFFFFFFFFFFLL;
  return result;
}

uint64_t sub_25BE79964(uint64_t result, char a2)
{
  *(void *)(result + 8) = *(void *)(result + 8) & 0xCFFFFFFFFFFFFFFFLL | ((unint64_t)(a2 & 3) << 60);
  return result;
}

void type metadata accessor for AvroPrimitive.SomeBytes()
{
}

uint64_t _s9SwiftAvro13AvroPrimitiveVwxx_0(uint64_t a1)
{
  return sub_25BE040D0(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(unsigned char *)(a1 + 24));
}

uint64_t _s9SwiftAvro13AvroPrimitiveVwcp_0(uint64_t a1, uint64_t a2)
{
  OUTLINED_FUNCTION_13_13(a1, a2);
  *(void *)uint64_t v2 = v3;
  *(void *)(v2 + 8) = v4;
  *(void *)(v2 + 16) = v5;
  *(unsigned char *)(v2 + 24) = v6;
  return v2;
}

uint64_t _s9SwiftAvro13AvroPrimitiveVwca_0(uint64_t a1, uint64_t a2)
{
  OUTLINED_FUNCTION_13_13(a1, a2);
  uint64_t v7 = *(void *)v2;
  unint64_t v8 = *(void *)(v2 + 8);
  uint64_t v9 = *(void *)(v2 + 16);
  *(void *)uint64_t v2 = v3;
  *(void *)(v2 + 8) = v4;
  *(void *)(v2 + 16) = v5;
  char v10 = *(unsigned char *)(v2 + 24);
  *(unsigned char *)(v2 + 24) = v6;
  sub_25BE040D0(v7, v8, v9, v10);
  return v2;
}

uint64_t _s9SwiftAvro13AvroPrimitiveVwta_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 16);
  char v4 = *(unsigned char *)(a2 + 24);
  uint64_t v5 = *(void *)a1;
  unint64_t v7 = *(void *)(a1 + 8);
  uint64_t v6 = *(void *)(a1 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = v3;
  char v8 = *(unsigned char *)(a1 + 24);
  *(unsigned char *)(a1 + 24) = v4;
  sub_25BE040D0(v5, v7, v6, v8);
  return a1;
}

uint64_t _s9SwiftAvro13AvroPrimitiveVwet_0(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0xF9 && *(unsigned char *)(a1 + 25))
    {
      int v2 = *(_DWORD *)a1 + 248;
    }
    else
    {
      unsigned int v3 = *(unsigned __int8 *)(a1 + 24);
      if (v3 <= 7) {
        int v2 = -1;
      }
      else {
        int v2 = v3 ^ 0xFF;
      }
    }
  }
  else
  {
    int v2 = -1;
  }
  return (v2 + 1);
}

uint64_t _s9SwiftAvro13AvroPrimitiveVwst_0(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xF8)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(unsigned char *)(result + 24) = 0;
    *(void *)__n128 result = a2 - 249;
    if (a3 >= 0xF9) {
      *(unsigned char *)(result + 25) = 1;
    }
  }
  else
  {
    if (a3 >= 0xF9) {
      *(unsigned char *)(result + 25) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 24) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_25BE79B00(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 24) <= 6u) {
    return *(unsigned __int8 *)(a1 + 24);
  }
  else {
    return (*(_DWORD *)a1 + 7);
  }
}

uint64_t sub_25BE79B18(uint64_t result, unsigned int a2)
{
  uint64_t v2 = a2 - 7;
  if (a2 >= 7)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    LOBYTE(a2) = 7;
    *(void *)__n128 result = v2;
  }
  *(unsigned char *)(result + 24) = a2;
  return result;
}

void type metadata accessor for AvroPrimitive.Value()
{
}

uint64_t _s9SwiftAvro9AvroValueVwxx_0(uint64_t a1)
{
  return sub_25BE03FA4(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(void *)(a1 + 24), *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(unsigned char *)(a1 + 64));
}

void _s9SwiftAvro9AvroValueVwcp_0()
{
  OUTLINED_FUNCTION_15_10();
  OUTLINED_FUNCTION_5_21(v0, v1);
  OUTLINED_FUNCTION_44_3();
  OUTLINED_FUNCTION_14_10();
}

#error "25BE79BEC: call analysis failed (funcsize=21)"

uint64_t _s9SwiftAvro9AvroValueVwta_0(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 64);
  uint64_t v4 = *(void *)a1;
  unint64_t v6 = *(void *)(a1 + 8);
  uint64_t v5 = *(void *)(a1 + 16);
  uint64_t v7 = *(void *)(a1 + 24);
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = *(void *)(a1 + 40);
  uint64_t v10 = *(void *)(a1 + 48);
  uint64_t v11 = *(void *)(a1 + 56);
  char v12 = *(unsigned char *)(a1 + 64);
  long long v13 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v13;
  long long v14 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v14;
  *(unsigned char *)(a1 + 64) = v3;
  sub_25BE03FA4(v4, v6, v5, v7, v8, v9, v10, v11, v12);
  return a1;
}

uint64_t _s9SwiftAvro9AvroValueVwet_0(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0xFC && *(unsigned char *)(a1 + 65))
    {
      int v2 = *(_DWORD *)a1 + 251;
    }
    else
    {
      unsigned int v3 = *(unsigned __int8 *)(a1 + 64);
      if (v3 <= 4) {
        int v2 = -1;
      }
      else {
        int v2 = v3 ^ 0xFF;
      }
    }
  }
  else
  {
    int v2 = -1;
  }
  return (v2 + 1);
}

uint64_t _s9SwiftAvro9AvroValueVwst_0(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFB)
  {
    *(void *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 64) = 0;
    *(void *)__n128 result = a2 - 252;
    if (a3 >= 0xFC) {
      *(unsigned char *)(result + 65) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFC) {
      *(unsigned char *)(result + 65) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 64) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_25BE79D08(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 64);
}

uint64_t sub_25BE79D10(uint64_t result, char a2)
{
  *(unsigned char *)(result + 64) = a2;
  return result;
}

void type metadata accessor for AvroValue.Value()
{
}

unint64_t sub_25BE79D28()
{
  unint64_t result = qword_26A55B8E8;
  if (!qword_26A55B8E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A55B8E8);
  }
  return result;
}

unint64_t sub_25BE79D78()
{
  unint64_t result = qword_26A55B8F0;
  if (!qword_26A55B8F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A55B8F0);
  }
  return result;
}

unint64_t sub_25BE79DC8()
{
  unint64_t result = qword_26A55B8F8;
  if (!qword_26A55B8F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A55B8F8);
  }
  return result;
}

uint64_t sub_25BE79E14(uint64_t a1, void (*a2)(void, void, void, void, void, void, void, void, char))
{
  char v4 = *(unsigned char *)(a1 + 64);
  a2(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(void *)(a1 + 24), *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), v4);
  return a1;
}

unint64_t sub_25BE79E68()
{
  unint64_t result = qword_26A55B900;
  if (!qword_26A55B900)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A55B900);
  }
  return result;
}

double OUTLINED_FUNCTION_0_15@<D0>(uint64_t a1@<X8>)
{
  double result = 0.0;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(unsigned char *)(a1 + 64) = 0;
  return result;
}

uint64_t OUTLINED_FUNCTION_1_32(uint64_t a1, unint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  return sub_25BE03DEC(a1, a2, a3, a4, a5, v11, v9, v10, a9);
}

uint64_t OUTLINED_FUNCTION_2_35()
{
  return sub_25BE7FCD0();
}

void OUTLINED_FUNCTION_3_23(uint64_t a1@<X8>)
{
  *(unsigned char *)(a1 + 64) = 0;
}

double OUTLINED_FUNCTION_4_21@<D0>(char a1@<W0>, uint64_t a2@<X8>)
{
  *(void *)a2 = a1 & 1;
  double result = 0.0;
  *(_OWORD *)(a2 + 8) = 0u;
  *(_OWORD *)(a2 + 24) = 0u;
  *(_OWORD *)(a2 + 40) = 0u;
  *(_OWORD *)(a2 + 49) = 0u;
  return result;
}

uint64_t OUTLINED_FUNCTION_5_21(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 16);
  uint64_t v4 = *(void *)(a2 + 24);
  uint64_t v5 = *(void *)(a2 + 32);
  uint64_t v6 = *(void *)(a2 + 40);
  uint64_t v7 = *(void *)(a2 + 48);
  uint64_t v8 = *(void *)(a2 + 56);
  char v12 = *(unsigned char *)(a2 + 64);
  uint64_t v9 = *(void *)a2;
  unint64_t v10 = *(void *)(a2 + 8);
  return sub_25BE03DEC(v9, v10, v3, v4, v5, v6, v7, v8, v12);
}

uint64_t OUTLINED_FUNCTION_6_23@<X0>(char a1@<W8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24)
{
  return sub_25BE03DEC(a18, v25, v26, a11, a24, v24, a14, a17, a1);
}

uint64_t OUTLINED_FUNCTION_8_21()
{
  return sub_25BE805F0();
}

double OUTLINED_FUNCTION_11_13()
{
  *(void *)uint64_t v0 = v1;
  double result = 0.0;
  *(_OWORD *)(v0 + 8) = 0u;
  *(_OWORD *)(v0 + 24) = 0u;
  *(_OWORD *)(v0 + 40) = 0u;
  *(void *)(v0 + 56) = 0;
  *(unsigned char *)(v0 + 64) = 4;
  return result;
}

uint64_t OUTLINED_FUNCTION_12_11(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49)
{
  *(_OWORD *)(v50 - 240) = *v49;
  return a49;
}

uint64_t OUTLINED_FUNCTION_13_13(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 16);
  char v4 = *(unsigned char *)(a2 + 24);
  uint64_t v5 = *(void *)a2;
  unint64_t v6 = *(void *)(a2 + 8);
  return sub_25BE03F04(v5, v6, v3, v4);
}

uint64_t OUTLINED_FUNCTION_18_8()
{
  return sub_25BE7FCD0();
}

uint64_t OUTLINED_FUNCTION_19_8()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_20_7(uint64_t a1)
{
  return sub_25BE763E4(a1, v4, v3, v2, v1);
}

uint64_t OUTLINED_FUNCTION_21_8()
{
  return sub_25BE660D4(v0, v1 - 168);
}

uint64_t OUTLINED_FUNCTION_23_6(uint64_t a1, unint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  return sub_25BE03FA4(a1, a2, a3, a4, a5, v11, v9, v10, a9);
}

uint64_t OUTLINED_FUNCTION_24_7()
{
  return sub_25BE7FCB0();
}

uint64_t OUTLINED_FUNCTION_26_4()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_27_6(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,int a21,char a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,unint64_t a31)
{
  return sub_25BE03FA4(a23, a31, a24, a25, a26, a27, a28, a29, a22);
}

uint64_t OUTLINED_FUNCTION_28_5()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_30_7()
{
  return swift_retain();
}

uint64_t OUTLINED_FUNCTION_32_5@<X0>(uint64_t a1@<X2>, char a2@<W8>, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,char a32)
{
  return sub_25BE03DEC(v32, v33, a1, a32, a31, a17, a22, a21, a2);
}

uint64_t OUTLINED_FUNCTION_34_4()
{
  return swift_retain();
}

uint64_t OUTLINED_FUNCTION_36_2()
{
  return sub_25BE7FCD0();
}

uint64_t OUTLINED_FUNCTION_38_5(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31)
{
  return sub_25BE03DEC(a1, a2, a3, v33, a31, v32, v31, a8, a9);
}

uint64_t OUTLINED_FUNCTION_39_3()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_41_2()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_42_2()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_43_3()
{
  return v0;
}

void OUTLINED_FUNCTION_44_3()
{
  *(void *)uint64_t v0 = v1;
  *(void *)(v0 + 8) = v2;
  *(void *)(v0 + 16) = v3;
  *(void *)(v0 + 24) = v4;
  *(void *)(v0 + 32) = v5;
  *(void *)(v0 + 40) = v6;
  *(void *)(v0 + 48) = v7;
  *(void *)(v0 + 56) = v8;
  *(unsigned char *)(v0 + 64) = v9;
}

uint64_t OUTLINED_FUNCTION_45_2()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_46_3()
{
  return sub_25BE7FCB0();
}

uint64_t OUTLINED_FUNCTION_49_3()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_50_4(uint64_t a1)
{
  return sub_25BE763E4(a1, v1, v2, v3, v4);
}

uint64_t OUTLINED_FUNCTION_51_4()
{
  return 0;
}

void *OUTLINED_FUNCTION_52_2(uint64_t a1)
{
  uint64_t v3 = (void *)(a1 + 16);
  return memcpy(v3, v1, 0x58uLL);
}

void OUTLINED_FUNCTION_53_3(uint64_t a1@<X8>)
{
  *(unsigned char *)(a1 + 64) = v1;
}

uint64_t OUTLINED_FUNCTION_54_4()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_55_3(uint64_t result, int a2)
{
  *(void *)(result + 8) = (a2 - 1);
  return result;
}

uint64_t OUTLINED_FUNCTION_56_3()
{
  return sub_25BE80600();
}

uint64_t OUTLINED_FUNCTION_57_3()
{
  return sub_25BE80600();
}

uint64_t OUTLINED_FUNCTION_58_4()
{
  return sub_25BE80600();
}

uint64_t OUTLINED_FUNCTION_59_3()
{
  return sub_25BE80600();
}

uint64_t OUTLINED_FUNCTION_60_3()
{
  return sub_25BE80600();
}

uint64_t OUTLINED_FUNCTION_62_2()
{
  return sub_25BE7FCB0();
}

__n128 OUTLINED_FUNCTION_63_2(__n128 *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, __n128 a18, unint64_t a19)
{
  __n128 result = a18;
  a1[1] = a18;
  a1[2].n128_u64[0] = a19;
  return result;
}

uint64_t *OUTLINED_FUNCTION_64_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return &a9;
}

uint64_t OUTLINED_FUNCTION_65_3()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_66_2()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_69_2()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_70_2()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_72_1(uint64_t a1, ...)
{
  va_start(va, a1);
  return sub_25BE5E1DC((uint64_t)va, v1);
}

uint64_t AvroPrimitive.get<A>()@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X2>, char a4@<W3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  switch(a4)
  {
    case 5:
      sub_25BE03F04(a1, a2, a3, 5);
      goto LABEL_9;
    case 6:
      if (((a2 >> 60) & 3) != 0)
      {
        sub_25BE03F04(a1, a2, a3, 6);
      }
      else
      {
        sub_25BE03F04(a1, a2, a3, 6);
        sub_25BE7A72C(a1);
      }
      goto LABEL_9;
    case 7:
      return __swift_storeEnumTagSinglePayload(a6, 1, 1, a5);
    default:
LABEL_9:
      int v10 = swift_dynamicCast();
      return __swift_storeEnumTagSinglePayload(a6, v10 ^ 1u, 1, a5);
  }
}

uint64_t sub_25BE7A72C(uint64_t a1)
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A55B7D0);
  unint64_t v10 = sub_25BE609E0();
  v8[0] = a1;
  uint64_t v2 = __swift_project_boxed_opaque_existential_1(v8, v9);
  uint64_t v3 = *v2 + 32;
  uint64_t v4 = v3 + *(void *)(*v2 + 16);
  swift_bridgeObjectRetain();
  sub_25BE775F4(v3, v4, &v7);
  swift_bridgeObjectRelease();
  uint64_t v5 = v7;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v8);
  return v5;
}

uint64_t sub_25BE7A7D0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = *(void *)(a1 + 16);
  if (v4)
  {
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    char v7 = *(unsigned char *)(a1 + 48);
    sub_25BE7D2A8(v5, v6, v7);
    uint64_t v4 = 1;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v6 = 0;
    char v7 = -1;
  }
  *(void *)a2 = a1;
  *(void *)(a2 + 8) = v4;
  *(void *)(a2 + 16) = v5;
  *(void *)(a2 + 24) = v6;
  *(unsigned char *)(a2 + 32) = v7;

  return swift_bridgeObjectRetain();
}

uint64_t AvroSchemaEncoder.outputFormatting.setter(uint64_t result)
{
  *uint64_t v1 = result;
  return result;
}

uint64_t (*AvroSchemaEncoder.outputFormatting.modify())()
{
  return nullsub_1;
}

SwiftAvro::AvroSchemaEncoder::OutputFormatting __swiftcall AvroSchemaEncoder.OutputFormatting.init()()
{
  return 0;
}

uint64_t AvroSchemaEncoder.OutputFormatting.indentation.setter(uint64_t result)
{
  if (result < 0) {
    __break(1u);
  }
  else {
    *uint64_t v1 = result;
  }
  return result;
}

uint64_t *(*AvroSchemaEncoder.OutputFormatting.indentation.modify(void *a1))(uint64_t *result, char a2)
{
  *a1 = *v1;
  a1[1] = v1;
  return sub_25BE7A8CC;
}

uint64_t *sub_25BE7A8CC(uint64_t *result, char a2)
{
  uint64_t v2 = *result;
  if (a2)
  {
    if ((v2 & 0x8000000000000000) == 0)
    {
LABEL_5:
      *(void *)result[1] = v2;
      return result;
    }
    __break(1u);
  }
  if ((v2 & 0x8000000000000000) == 0) {
    goto LABEL_5;
  }
  __break(1u);
  return result;
}

uint64_t AvroSchemaEncoder.OutputFormatting.hash(into:)()
{
  return sub_25BE80600();
}

uint64_t AvroSchemaEncoder.OutputFormatting.hashValue.getter()
{
  return sub_25BE80640();
}

uint64_t sub_25BE7A95C()
{
  return AvroSchemaEncoder.OutputFormatting.hashValue.getter();
}

uint64_t sub_25BE7A964()
{
  return AvroSchemaEncoder.OutputFormatting.hash(into:)();
}

uint64_t sub_25BE7A96C()
{
  return sub_25BE80640();
}

uint64_t sub_25BE7A9B0(void *a1, void *a2)
{
  return static AvroSchemaEncoder.OutputFormatting.__derived_struct_equals(_:_:)(*a1, *a2);
}

uint64_t AvroSchemaEncoder.encodeBytes(_:)(uint64_t a1, uint64_t a2)
{
  type metadata accessor for SchemaEncoder();
  uint64_t result = sub_25BE7AA50();
  if (!v2)
  {
    uint64_t v5 = sub_25BE7AADC(result, a2);
    swift_bridgeObjectRelease();
    return v5;
  }
  return result;
}

uint64_t type metadata accessor for SchemaEncoder()
{
  return self;
}

uint64_t sub_25BE7AA50()
{
  uint64_t v1 = v0;
  swift_allocObject();
  uint64_t v2 = sub_25BE7BD5C();
  swift_retain();
  uint64_t v3 = (void *)swift_retain();
  sub_25BE7BE78(v3);
  if (!v0)
  {
    uint64_t v1 = v2[5];
    swift_bridgeObjectRetain();
  }
  swift_release();
  return v1;
}

uint64_t sub_25BE7AADC(uint64_t a1, uint64_t a2)
{
  sub_25BE7BA40(a1);
  sub_25BE6FF08();
  uint64_t v5 = v4;
  sub_25BE7A7D0(a1, (uint64_t)&v122);
  long long v126 = v122;
  if (v125 == 255) {
    goto LABEL_120;
  }
  uint64_t v6 = 0;
  unint64_t v7 = *((void *)&v126 + 1);
  uint64_t v118 = v126;
  uint64_t v119 = a2;
  uint64_t v117 = v126 + 32;
  uint64_t v115 = -a2;
  uint64_t v8 = v123;
  unint64_t v9 = v124;
LABEL_3:
  unint64_t v10 = *(void *)(v118 + 16);
  uint64_t v11 = v8;
  unint64_t v12 = v9;
  uint64_t v116 = v6;
  uint64_t v13 = v6;
  while (2)
  {
    uint64_t v120 = v13;
    if (v7 == v10)
    {
      uint64_t v8 = 0;
      uint64_t v121 = 0;
      int v14 = 255;
      unint64_t v7 = v10;
    }
    else
    {
      if ((v7 & 0x8000000000000000) != 0) {
        goto LABEL_123;
      }
      if (v7 >= *(void *)(v118 + 16)) {
        goto LABEL_124;
      }
      unint64_t v15 = v7 + 1;
      uint64_t v16 = v117 + 24 * v7;
      int v14 = *(unsigned __int8 *)(v16 + 16);
      uint64_t v17 = *(void *)v16;
      uint64_t v121 = *(void *)(v16 + 8);
      sub_25BE7D2A8(*(void *)v16, v121, *(unsigned char *)(v16 + 16));
      uint64_t v8 = v17;
      unint64_t v7 = v15;
    }
    unint64_t v9 = v121;
    switch(v14)
    {
      case 1:
        if (v14 == 1 || v14 == 255)
        {
          unint64_t v18 = v7;
          if (v11) {
            char v19 = 125;
          }
          else {
            char v19 = 93;
          }
          uint64_t v20 = v8;
          sub_25BE7DE24(v8, v121, v14);
          unint64_t v21 = *(void *)(v5 + 16);
          if (v21 >= *(void *)(v5 + 24) >> 1)
          {
            sub_25BE6FF08();
            uint64_t v5 = v25;
          }
          *(void *)(v5 + 16) = v21 + 1;
          *(unsigned char *)(v5 + v21 + 32) = v19;
          if (v119 < 1)
          {
            sub_25BE7DE38(v20, v121, v14);
            uint64_t v8 = v20;
            uint64_t v6 = v116;
            unint64_t v7 = v18;
            goto LABEL_115;
          }
          if (v14 == 255) {
            goto LABEL_120;
          }
          sub_25BE7DE38(v20, v121, v14);
          uint64_t v22 = v120;
          uint64_t v23 = v120 - v119;
          if (__OFSUB__(v120, v119))
          {
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
            goto LABEL_130;
          }
          if (v23 < 0) {
            goto LABEL_122;
          }
          unint64_t v24 = *(void *)(v5 + 16);
          if (v24 >= *(void *)(v5 + 24) >> 1)
          {
            sub_25BE6FF08();
            uint64_t v22 = v120;
            uint64_t v5 = v26;
          }
          uint64_t v13 = 0;
          *(void *)(v5 + 16) = v24 + 1;
          *(unsigned char *)(v5 + v24 + 32) = 10;
          uint64_t v11 = v20;
          unint64_t v12 = v121;
          unint64_t v7 = v18;
          if (v23)
          {
            uint64_t v8 = v20;
            unint64_t v54 = v24 + 33;
            uint64_t v55 = v115 + v22;
            do
            {
              if (v54 - 32 >= *(void *)(v5 + 24) >> 1)
              {
                sub_25BE6FF08();
                unint64_t v7 = v18;
                uint64_t v5 = v56;
                uint64_t v8 = v20;
              }
              *(void *)(v5 + 16) = v54 - 31;
              *(unsigned char *)(v5 + v54++) = 32;
              --v55;
            }
            while (v55);
            uint64_t v6 = v120 - v119;
            goto LABEL_114;
          }
          continue;
        }
        if (v11) {
          char v57 = 125;
        }
        else {
          char v57 = 93;
        }
        unint64_t v58 = *(void *)(v5 + 16);
        unint64_t v59 = *(void *)(v5 + 24) >> 1;
        unint64_t v60 = v58 + 1;
        if (v59 <= v58)
        {
          uint64_t v97 = v8;
          unint64_t v98 = v7;
          sub_25BE6FF08();
          unint64_t v7 = v98;
          uint64_t v5 = v99;
          uint64_t v8 = v97;
          unint64_t v59 = *(void *)(v5 + 24) >> 1;
        }
        uint64_t v6 = v120;
        *(void *)(v5 + 16) = v60;
        *(unsigned char *)(v5 + v58 + 32) = v57;
        unint64_t v61 = v58 + 2;
        if ((uint64_t)v59 < (uint64_t)(v58 + 2))
        {
          uint64_t v100 = v8;
          unint64_t v101 = v7;
          sub_25BE6FF08();
          uint64_t v6 = v120;
          unint64_t v7 = v101;
          uint64_t v5 = v102;
          uint64_t v8 = v100;
        }
        *(void *)(v5 + 16) = v61;
        *(unsigned char *)(v5 + v60 + 32) = 44;
        if (v119 >= 1)
        {
          if ((int64_t)(v58 + 3) > *(void *)(v5 + 24) >> 1)
          {
            uint64_t v108 = v8;
            unint64_t v109 = v7;
            uint64_t v110 = v6;
            sub_25BE6FF08();
            uint64_t v6 = v110;
            unint64_t v7 = v109;
            uint64_t v5 = v111;
            uint64_t v8 = v108;
          }
          *(void *)(v5 + 16) = v58 + 3;
          *(unsigned char *)(v5 + v61 + 32) = 10;
          if (v6 < 0) {
            goto LABEL_128;
          }
          if (v6)
          {
            for (uint64_t i = 0; i != v6; ++i)
            {
              if (v58 + i + 3 >= *(void *)(v5 + 24) >> 1)
              {
                uint64_t v63 = v8;
                unint64_t v64 = v7;
                uint64_t v65 = v6;
                sub_25BE6FF08();
                uint64_t v6 = v65;
                unint64_t v7 = v64;
                uint64_t v5 = v66;
                uint64_t v8 = v63;
              }
              *(void *)(v5 + 16) = v58 + i + 4;
              *(unsigned char *)(v5 + v58 + i + 35) = 32;
            }
          }
        }
LABEL_114:
        unint64_t v9 = v121;
LABEL_115:
        if (v14 != 255) {
          goto LABEL_3;
        }
LABEL_120:
        sub_25BE03DC0((uint64_t)&v126);
        return v5;
      case 2:
        if (v14 && v14 != 3) {
          goto LABEL_131;
        }
        uint64_t v36 = v8;
        unint64_t v37 = v7;
        unint64_t v38 = *(void *)(v5 + 16);
        if (v38 >= *(void *)(v5 + 24) >> 1)
        {
          sub_25BE6FF08();
          uint64_t v5 = v82;
        }
        *(void *)(v5 + 16) = v38 + 1;
        *(unsigned char *)(v5 + v38 + 32) = 34;
        sub_25BE7B914(v11, v12);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_25BE6FF08();
          uint64_t v5 = v83;
        }
        unint64_t v39 = *(void *)(v5 + 16);
        unint64_t v40 = *(void *)(v5 + 24) >> 1;
        unint64_t v41 = v39 + 1;
        uint64_t v6 = v120;
        if (v40 <= v39)
        {
          sub_25BE6FF08();
          uint64_t v6 = v120;
          uint64_t v5 = v84;
          uint64_t v8 = v36;
          unint64_t v40 = *(void *)(v5 + 24) >> 1;
        }
        else
        {
          uint64_t v8 = v36;
        }
        *(void *)(v5 + 16) = v41;
        *(unsigned char *)(v5 + v39 + 32) = 34;
        unint64_t v42 = v39 + 2;
        if ((uint64_t)v40 < (uint64_t)(v39 + 2))
        {
          uint64_t v85 = v6;
          sub_25BE6FF08();
          uint64_t v6 = v85;
          uint64_t v5 = v86;
          uint64_t v8 = v36;
        }
        *(void *)(v5 + 16) = v42;
        *(unsigned char *)(v5 + v41 + 32) = 58;
        unint64_t v7 = v37;
        if (v119 < 1) {
          goto LABEL_114;
        }
        unint64_t v43 = v39 + 3;
        if ((int64_t)(v39 + 3) > *(void *)(v5 + 24) >> 1)
        {
          uint64_t v87 = v6;
          sub_25BE6FF08();
          uint64_t v6 = v87;
          unint64_t v7 = v37;
          uint64_t v5 = v88;
          uint64_t v8 = v36;
        }
        unint64_t v9 = v121;
        *(void *)(v5 + 16) = v43;
        *(unsigned char *)(v5 + v42 + 32) = 32;
        goto LABEL_115;
      case 3:
        if ((v14 - 2) < 2) {
          goto LABEL_97;
        }
        if (v14)
        {
          unint64_t v44 = v7;
          uint64_t v45 = v8;
          sub_25BE7DE24(v8, v121, v14);
          unint64_t v46 = *(void *)(v5 + 16);
          if (v46 >= *(void *)(v5 + 24) >> 1)
          {
            sub_25BE6FF08();
            uint64_t v5 = v103;
          }
          *(void *)(v5 + 16) = v46 + 1;
          *(unsigned char *)(v5 + v46 + 32) = 34;
          sub_25BE7B914(v11, v12);
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          {
            sub_25BE6FF08();
            uint64_t v5 = v104;
          }
          unint64_t v47 = *(void *)(v5 + 16);
          unint64_t v48 = v47 + 1;
          uint64_t v6 = v120;
          if (v47 >= *(void *)(v5 + 24) >> 1)
          {
            sub_25BE6FF08();
            uint64_t v6 = v120;
            unint64_t v7 = v44;
            uint64_t v5 = v105;
          }
          else
          {
            unint64_t v7 = v44;
          }
          uint64_t v8 = v45;
          *(void *)(v5 + 16) = v48;
          *(unsigned char *)(v5 + v47 + 32) = 34;
          if (v119 >= 1)
          {
            BOOL v49 = __OFSUB__(v6, v119);
            v6 -= v119;
            if (v49) {
              goto LABEL_129;
            }
            if (v6 < 0)
            {
LABEL_130:
              __break(1u);
LABEL_131:
              __break(1u);
              JUMPOUT(0x25BE7B6CCLL);
            }
            if ((int64_t)(v47 + 2) > *(void *)(v5 + 24) >> 1)
            {
              uint64_t v112 = v6;
              sub_25BE6FF08();
              uint64_t v6 = v112;
              unint64_t v7 = v44;
              uint64_t v5 = v113;
              uint64_t v8 = v45;
            }
            *(void *)(v5 + 16) = v47 + 2;
            *(unsigned char *)(v5 + v48 + 32) = 10;
            if (v6)
            {
              unint64_t v50 = v47 + 34;
              uint64_t v51 = v6;
              do
              {
                if (v50 - 32 >= *(void *)(v5 + 24) >> 1)
                {
                  uint64_t v52 = v6;
                  sub_25BE6FF08();
                  uint64_t v6 = v52;
                  unint64_t v7 = v44;
                  uint64_t v5 = v53;
                  uint64_t v8 = v45;
                }
                *(void *)(v5 + 16) = v50 - 31;
                *(unsigned char *)(v5 + v50++) = 32;
                --v51;
              }
              while (v51);
            }
          }
        }
        else
        {
          uint64_t v67 = v8;
          unint64_t v68 = v7;
          sub_25BE7D2A8(v8, v121, 0);
          uint64_t v8 = v67;
          unint64_t v7 = v68;
LABEL_97:
          uint64_t v69 = v8;
          unint64_t v70 = v7;
          unint64_t v71 = *(void *)(v5 + 16);
          if (v71 >= *(void *)(v5 + 24) >> 1)
          {
            sub_25BE6FF08();
            uint64_t v5 = v92;
          }
          *(void *)(v5 + 16) = v71 + 1;
          *(unsigned char *)(v5 + v71 + 32) = 34;
          sub_25BE7B914(v11, v12);
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          {
            sub_25BE6FF08();
            uint64_t v5 = v93;
          }
          unint64_t v72 = *(void *)(v5 + 16);
          unint64_t v73 = *(void *)(v5 + 24) >> 1;
          unint64_t v74 = v72 + 1;
          uint64_t v6 = v120;
          if (v73 <= v72)
          {
            sub_25BE6FF08();
            uint64_t v6 = v120;
            uint64_t v5 = v94;
            uint64_t v8 = v69;
            unint64_t v73 = *(void *)(v5 + 24) >> 1;
          }
          else
          {
            uint64_t v8 = v69;
          }
          *(void *)(v5 + 16) = v74;
          *(unsigned char *)(v5 + v72 + 32) = 34;
          unint64_t v75 = v72 + 2;
          if ((uint64_t)v73 < (uint64_t)(v72 + 2))
          {
            uint64_t v95 = v6;
            sub_25BE6FF08();
            uint64_t v6 = v95;
            uint64_t v5 = v96;
            uint64_t v8 = v69;
          }
          *(void *)(v5 + 16) = v75;
          *(unsigned char *)(v5 + v74 + 32) = 44;
          unint64_t v7 = v70;
          if (v119 >= 1)
          {
            if ((int64_t)(v72 + 3) > *(void *)(v5 + 24) >> 1)
            {
              uint64_t v106 = v6;
              sub_25BE6FF08();
              uint64_t v6 = v106;
              unint64_t v7 = v70;
              uint64_t v5 = v107;
              uint64_t v8 = v69;
            }
            *(void *)(v5 + 16) = v72 + 3;
            *(unsigned char *)(v5 + v75 + 32) = 10;
            if (v6 < 0) {
              goto LABEL_127;
            }
            if (v6)
            {
              for (uint64_t j = 0; j != v6; ++j)
              {
                if (v72 + j + 3 >= *(void *)(v5 + 24) >> 1)
                {
                  uint64_t v77 = v6;
                  sub_25BE6FF08();
                  uint64_t v6 = v77;
                  unint64_t v7 = v70;
                  uint64_t v5 = v78;
                  uint64_t v8 = v69;
                }
                *(void *)(v5 + 16) = v72 + j + 4;
                *(unsigned char *)(v5 + v72 + j + 35) = 32;
              }
            }
          }
        }
        goto LABEL_114;
      default:
        if (v11) {
          char v27 = 123;
        }
        else {
          char v27 = 91;
        }
        unint64_t v28 = *(void *)(v5 + 16);
        unint64_t v29 = v28 + 1;
        if (v28 >= *(void *)(v5 + 24) >> 1)
        {
          uint64_t v79 = v8;
          unint64_t v80 = v7;
          sub_25BE6FF08();
          unint64_t v7 = v80;
          uint64_t v5 = v81;
          uint64_t v8 = v79;
        }
        *(void *)(v5 + 16) = v29;
        *(unsigned char *)(v5 + v28 + 32) = v27;
        uint64_t v6 = v120;
        if (v119 < 1) {
          goto LABEL_114;
        }
        uint64_t v6 = v120 + v119;
        if (__OFADD__(v120, v119)) {
          goto LABEL_125;
        }
        if ((int64_t)(v28 + 2) > *(void *)(v5 + 24) >> 1)
        {
          uint64_t v89 = v8;
          unint64_t v90 = v7;
          sub_25BE6FF08();
          uint64_t v6 = v120 + v119;
          unint64_t v7 = v90;
          uint64_t v5 = v91;
          uint64_t v8 = v89;
        }
        *(void *)(v5 + 16) = v28 + 2;
        *(unsigned char *)(v5 + v29 + 32) = 10;
        if (v6 < 0) {
          goto LABEL_126;
        }
        if (v6)
        {
          unint64_t v30 = v28 + 34;
          uint64_t v31 = v6;
          do
          {
            if (v30 - 32 >= *(void *)(v5 + 24) >> 1)
            {
              uint64_t v32 = v8;
              unint64_t v33 = v7;
              uint64_t v34 = v6;
              sub_25BE6FF08();
              uint64_t v6 = v34;
              unint64_t v7 = v33;
              uint64_t v5 = v35;
              uint64_t v8 = v32;
            }
            *(void *)(v5 + 16) = v30 - 31;
            *(unsigned char *)(v5 + v30++) = 32;
            --v31;
          }
          while (v31);
        }
        goto LABEL_114;
    }
  }
}

uint64_t AvroSchemaEncoder.encode(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SchemaEncoder();
  uint64_t v5 = sub_25BE7AA50();
  if (!v2)
  {
    sub_25BE7AADC(v5, a2);
    swift_bridgeObjectRelease();
    uint64_t v4 = sub_25BE7FCA0();
    swift_bridgeObjectRelease();
  }
  return v4;
}

uint64_t AvroSchemaEncoder.hash(into:)()
{
  return sub_25BE80600();
}

uint64_t AvroSchemaEncoder.hashValue.getter()
{
  return sub_25BE80640();
}

uint64_t sub_25BE7B7DC()
{
  return AvroSchemaEncoder.hashValue.getter();
}

uint64_t sub_25BE7B7E4()
{
  return AvroSchemaEncoder.hash(into:)();
}

unint64_t sub_25BE7B7F0()
{
  unint64_t result = qword_26A55B908;
  if (!qword_26A55B908)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A55B908);
  }
  return result;
}

unint64_t sub_25BE7B840()
{
  unint64_t result = qword_26A55B910;
  if (!qword_26A55B910)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A55B910);
  }
  return result;
}

uint64_t sub_25BE7B88C(void *a1, void *a2)
{
  return static AvroSchemaEncoder.__derived_struct_equals(_:_:)(*a1, *a2);
}

void type metadata accessor for AvroSchemaEncoder()
{
}

void type metadata accessor for AvroSchemaEncoder.OutputFormatting()
{
}

void sub_25BE7B8B0(uint64_t a1)
{
  uint64_t v3 = *v1;
  if (!swift_isUniquelyReferenced_nonNull_native() || a1 > *(void *)(v3 + 24) >> 1)
  {
    sub_25BE6FD38();
    uint64_t v3 = v4;
  }
  *uint64_t v1 = v3;
}

uint64_t sub_25BE7B914(uint64_t result, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0)
  {
    unint64_t result = sub_25BE7FCF0();
    uint64_t v3 = result;
  }
  else if ((a2 & 0x2000000000000000) != 0)
  {
    uint64_t v3 = HIBYTE(a2) & 0xF;
  }
  else
  {
    uint64_t v3 = result & 0xFFFFFFFFFFFFLL;
  }
  uint64_t v4 = *v2;
  uint64_t v5 = *(void *)(*v2 + 16);
  if (__OFADD__(v5, v3))
  {
    __break(1u);
  }
  else
  {
    int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *uint64_t v2 = v4;
    if (!isUniquelyReferenced_nonNull_native || *(void *)(v4 + 24) >> 1 < v5 + v3)
    {
      sub_25BE6FF08();
      uint64_t v4 = v7;
      *uint64_t v2 = v7;
    }
    swift_bridgeObjectRetain();
    unint64_t result = sub_25BE80070();
    if (v8) {
      goto LABEL_19;
    }
    uint64_t v9 = result;
    unint64_t result = swift_bridgeObjectRelease_n();
    if (v9 >= v3)
    {
      if (v9 < 1)
      {
LABEL_14:
        *uint64_t v2 = v4;
        return result;
      }
      uint64_t v10 = *(void *)(v4 + 16);
      BOOL v11 = __OFADD__(v10, v9);
      uint64_t v12 = v10 + v9;
      if (!v11)
      {
        *(void *)(v4 + 16) = v12;
        goto LABEL_14;
      }
      goto LABEL_18;
    }
  }
  __break(1u);
LABEL_18:
  __break(1u);
LABEL_19:
  __break(1u);
  return result;
}

uint64_t sub_25BE7BA40(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 16);
  if (v1)
  {
    uint64_t v2 = 0;
    for (uint64_t i = (unsigned __int8 *)(result + 48); ; i += 24)
    {
      unsigned int v4 = *i;
      if (v4 >= 2)
      {
        uint64_t v6 = *((void *)i - 2);
        unint64_t v7 = *((void *)i - 1);
        if (v4 == 2)
        {
          if ((v7 & 0x1000000000000000) != 0)
          {
            unint64_t result = sub_25BE7FCF0();
          }
          else if ((v7 & 0x2000000000000000) != 0)
          {
            unint64_t result = HIBYTE(v7) & 0xF;
          }
          else
          {
            unint64_t result = v6 & 0xFFFFFFFFFFFFLL;
          }
          uint64_t v5 = result + 3;
          if (__OFADD__(result, 3)) {
            goto LABEL_26;
          }
        }
        else
        {
          if ((v7 & 0x1000000000000000) != 0)
          {
            unint64_t result = sub_25BE7FCF0();
          }
          else if ((v7 & 0x2000000000000000) != 0)
          {
            unint64_t result = HIBYTE(v7) & 0xF;
          }
          else
          {
            unint64_t result = v6 & 0xFFFFFFFFFFFFLL;
          }
          uint64_t v5 = result + 2;
          if (__OFADD__(result, 2)) {
            goto LABEL_27;
          }
        }
      }
      else
      {
        uint64_t v5 = 1;
      }
      BOOL v8 = __OFADD__(v2, v5);
      v2 += v5;
      if (v8) {
        break;
      }
      if (!--v1) {
        return v2;
      }
    }
    __break(1u);
LABEL_26:
    __break(1u);
LABEL_27:
    __break(1u);
  }
  else
  {
    return 0;
  }
  return result;
}

uint64_t sub_25BE7BB04(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  switch(a4)
  {
    case 2:
    case 3:
      sub_25BE80600();
      uint64_t result = sub_25BE7FCB0();
      break;
    default:
      sub_25BE80600();
      uint64_t result = sub_25BE80600();
      break;
  }
  return result;
}

uint64_t sub_25BE7BBC4(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5, char a6)
{
  switch(a3)
  {
    case 1:
      uint64_t result = a6 == 1 && ((a4 ^ a1) & 1) == 0;
      break;
    case 2:
      if (a6 != 2) {
        goto LABEL_15;
      }
      goto LABEL_6;
    case 3:
      if (a6 == 3)
      {
LABEL_6:
        if (a1 == a4 && a2 == a5) {
          uint64_t result = 1;
        }
        else {
          uint64_t result = sub_25BE80440();
        }
      }
      else
      {
LABEL_15:
        uint64_t result = 0;
      }
      break;
    default:
      if (a6) {
        uint64_t result = 0;
      }
      else {
        uint64_t result = ((a4 ^ a1) & 1) == 0;
      }
      break;
  }
  return result;
}

uint64_t sub_25BE7BC70(uint64_t a1, uint64_t a2, char a3)
{
  OUTLINED_FUNCTION_2_25();
  sub_25BE7BB04((uint64_t)v7, a1, a2, a3);
  return sub_25BE80640();
}

uint64_t sub_25BE7BCC8()
{
  return sub_25BE7BC70(*(void *)v0, *(void *)(v0 + 8), *(unsigned char *)(v0 + 16));
}

uint64_t sub_25BE7BCD4(uint64_t a1)
{
  return sub_25BE7BB04(a1, *(void *)v1, *(void *)(v1 + 8), *(unsigned char *)(v1 + 16));
}

uint64_t sub_25BE7BCE0()
{
  uint64_t v1 = *(void *)v0;
  uint64_t v2 = *(void *)(v0 + 8);
  char v3 = *(unsigned char *)(v0 + 16);
  sub_25BE805F0();
  sub_25BE7BB04((uint64_t)v5, v1, v2, v3);
  return sub_25BE80640();
}

uint64_t sub_25BE7BD38(uint64_t a1, uint64_t a2)
{
  return sub_25BE7BBC4(*(void *)a1, *(void *)(a1 + 8), *(unsigned char *)(a1 + 16), *(void *)a2, *(void *)(a2 + 8), *(unsigned char *)(a2 + 16));
}

uint64_t sub_25BE7BD54()
{
  return sub_25BE5C754();
}

void *sub_25BE7BD5C()
{
  sub_25BE800B0();
  uint64_t v1 = MEMORY[0x263F8EE78];
  v0[3] = sub_25BE7FB40();
  v0[4] = sub_25BE7FB40();
  v0[6] = v1;
  v0[2] = v1;
  v0[5] = v1;
  sub_25BE7B8B0(64);
  return v0;
}

void sub_25BE7BDF4()
{
}

void sub_25BE7BE38()
{
}

void sub_25BE7BE78(void *a1)
{
  unint64_t v3 = *(void *)(a1[6] + 16);
  uint64_t v4 = a1[2];
  swift_bridgeObjectRetain();
  sub_25BE7BDF4();
  if (!v1)
  {
    for (uint64_t i = a1[6]; v3 < *(void *)(i + 16); uint64_t i = a1[6])
    {
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      a1[6] = i;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        sub_25BE77418();
        uint64_t i = v34;
        a1[6] = v34;
      }
      uint64_t v24 = *(void *)(i + 16);
      if (!v24) {
        goto LABEL_37;
      }
      uint64_t v25 = v24 - 1;
      char v26 = *(unsigned char *)(i + v25 + 32);
      *(void *)(i + 16) = v25;
      a1[6] = i;
      uint64_t v27 = a1[5];
      char v28 = swift_isUniquelyReferenced_nonNull_native();
      a1[5] = v27;
      if (v26)
      {
        if ((v28 & 1) == 0)
        {
          sub_25BE6FD38();
          uint64_t v27 = v35;
          a1[5] = v35;
        }
        unint64_t v29 = *(void *)(v27 + 16);
        if (v29 >= *(void *)(v27 + 24) >> 1)
        {
          sub_25BE6FD38();
          uint64_t v27 = v36;
          a1[5] = v36;
        }
        *(void *)(v27 + 16) = v29 + 1;
        uint64_t v30 = v27 + 24 * v29;
        *(_OWORD *)(v30 + 32) = xmmword_25BE99B40;
        uint64_t v31 = v30 + 32;
      }
      else
      {
        if ((v28 & 1) == 0)
        {
          sub_25BE6FD38();
          uint64_t v27 = v37;
          a1[5] = v37;
        }
        unint64_t v32 = *(void *)(v27 + 16);
        if (v32 >= *(void *)(v27 + 24) >> 1)
        {
          sub_25BE6FD38();
          uint64_t v27 = v38;
          a1[5] = v38;
        }
        *(void *)(v27 + 16) = v32 + 1;
        uint64_t v33 = v27 + 24 * v32;
        *(void *)(v33 + 32) = 0;
        *(void *)(v33 + 40) = 0;
        uint64_t v31 = v33 + 32;
      }
      *(unsigned char *)(v31 + 16) = 1;
    }
LABEL_35:
    a1[2] = v4;
    swift_release();
    swift_bridgeObjectRelease();
    swift_release();
    return;
  }
  uint64_t v5 = a1[6];
  if (v3 >= *(void *)(v5 + 16)) {
    goto LABEL_35;
  }
  while (1)
  {
    char v6 = swift_isUniquelyReferenced_nonNull_native();
    a1[6] = v5;
    if ((v6 & 1) == 0)
    {
      sub_25BE77418();
      uint64_t v5 = v17;
      a1[6] = v17;
    }
    uint64_t v7 = *(void *)(v5 + 16);
    if (!v7) {
      break;
    }
    uint64_t v8 = v7 - 1;
    char v9 = *(unsigned char *)(v5 + v8 + 32);
    *(void *)(v5 + 16) = v8;
    a1[6] = v5;
    uint64_t v10 = a1[5];
    char v11 = swift_isUniquelyReferenced_nonNull_native();
    a1[5] = v10;
    if (v9)
    {
      if ((v11 & 1) == 0)
      {
        sub_25BE6FD38();
        uint64_t v10 = v18;
        a1[5] = v18;
      }
      unint64_t v12 = *(void *)(v10 + 16);
      if (v12 >= *(void *)(v10 + 24) >> 1)
      {
        sub_25BE6FD38();
        uint64_t v10 = v19;
        a1[5] = v19;
      }
      *(void *)(v10 + 16) = v12 + 1;
      uint64_t v13 = v10 + 24 * v12;
      *(_OWORD *)(v13 + 32) = xmmword_25BE99B40;
      uint64_t v14 = v13 + 32;
    }
    else
    {
      if ((v11 & 1) == 0)
      {
        sub_25BE6FD38();
        uint64_t v10 = v20;
        a1[5] = v20;
      }
      unint64_t v15 = *(void *)(v10 + 16);
      if (v15 >= *(void *)(v10 + 24) >> 1)
      {
        sub_25BE6FD38();
        uint64_t v10 = v21;
        a1[5] = v21;
      }
      *(void *)(v10 + 16) = v15 + 1;
      uint64_t v16 = v10 + 24 * v15;
      *(void *)(v16 + 32) = 0;
      *(void *)(v16 + 40) = 0;
      uint64_t v14 = v16 + 32;
    }
    *(unsigned char *)(v14 + 16) = 1;
    uint64_t v5 = a1[6];
    if (v3 >= *(void *)(v5 + 16)) {
      goto LABEL_35;
    }
  }
  __break(1u);
LABEL_37:
  __break(1u);
}

void sub_25BE7C1F4(void (*a1)(uint64_t))
{
  unint64_t v4 = *(void *)(v1[6] + 16);
  uint64_t v5 = v1[2];
  uint64_t v6 = swift_bridgeObjectRetain();
  a1(v6);
  if (!v2)
  {
    for (uint64_t i = v1[6]; v4 < *(void *)(i + 16); uint64_t i = v1[6])
    {
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v1[6] = i;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        sub_25BE77418();
        uint64_t i = v36;
        v1[6] = v36;
      }
      uint64_t v26 = *(void *)(i + 16);
      if (!v26) {
        goto LABEL_37;
      }
      uint64_t v27 = v26 - 1;
      char v28 = *(unsigned char *)(i + v27 + 32);
      *(void *)(i + 16) = v27;
      v1[6] = i;
      uint64_t v29 = v1[5];
      char v30 = swift_isUniquelyReferenced_nonNull_native();
      v1[5] = v29;
      if (v28)
      {
        if ((v30 & 1) == 0)
        {
          sub_25BE6FD38();
          uint64_t v29 = v37;
          v1[5] = v37;
        }
        unint64_t v31 = *(void *)(v29 + 16);
        if (v31 >= *(void *)(v29 + 24) >> 1)
        {
          sub_25BE6FD38();
          uint64_t v29 = v38;
          v1[5] = v38;
        }
        *(void *)(v29 + 16) = v31 + 1;
        uint64_t v32 = v29 + 24 * v31;
        *(_OWORD *)(v32 + 32) = xmmword_25BE99B40;
        uint64_t v33 = v32 + 32;
      }
      else
      {
        if ((v30 & 1) == 0)
        {
          sub_25BE6FD38();
          uint64_t v29 = v39;
          v1[5] = v39;
        }
        unint64_t v34 = *(void *)(v29 + 16);
        if (v34 >= *(void *)(v29 + 24) >> 1)
        {
          sub_25BE6FD38();
          uint64_t v29 = v40;
          v1[5] = v40;
        }
        *(void *)(v29 + 16) = v34 + 1;
        uint64_t v35 = v29 + 24 * v34;
        *(void *)(v35 + 32) = 0;
        *(void *)(v35 + 40) = 0;
        uint64_t v33 = v35 + 32;
      }
      *(unsigned char *)(v33 + 16) = 1;
    }
LABEL_35:
    v1[2] = v5;
    swift_bridgeObjectRelease();
    return;
  }
  uint64_t v7 = v1[6];
  if (v4 >= *(void *)(v7 + 16)) {
    goto LABEL_35;
  }
  while (1)
  {
    char v8 = swift_isUniquelyReferenced_nonNull_native();
    v1[6] = v7;
    if ((v8 & 1) == 0)
    {
      sub_25BE77418();
      uint64_t v7 = v19;
      v1[6] = v19;
    }
    uint64_t v9 = *(void *)(v7 + 16);
    if (!v9) {
      break;
    }
    uint64_t v10 = v9 - 1;
    char v11 = *(unsigned char *)(v7 + v10 + 32);
    *(void *)(v7 + 16) = v10;
    v1[6] = v7;
    uint64_t v12 = v1[5];
    char v13 = swift_isUniquelyReferenced_nonNull_native();
    v1[5] = v12;
    if (v11)
    {
      if ((v13 & 1) == 0)
      {
        sub_25BE6FD38();
        uint64_t v12 = v20;
        v1[5] = v20;
      }
      unint64_t v14 = *(void *)(v12 + 16);
      if (v14 >= *(void *)(v12 + 24) >> 1)
      {
        sub_25BE6FD38();
        uint64_t v12 = v21;
        v1[5] = v21;
      }
      *(void *)(v12 + 16) = v14 + 1;
      uint64_t v15 = v12 + 24 * v14;
      *(_OWORD *)(v15 + 32) = xmmword_25BE99B40;
      uint64_t v16 = v15 + 32;
    }
    else
    {
      if ((v13 & 1) == 0)
      {
        sub_25BE6FD38();
        uint64_t v12 = v22;
        v1[5] = v22;
      }
      unint64_t v17 = *(void *)(v12 + 16);
      if (v17 >= *(void *)(v12 + 24) >> 1)
      {
        sub_25BE6FD38();
        uint64_t v12 = v23;
        v1[5] = v23;
      }
      *(void *)(v12 + 16) = v17 + 1;
      uint64_t v18 = v12 + 24 * v17;
      *(void *)(v18 + 32) = 0;
      *(void *)(v18 + 40) = 0;
      uint64_t v16 = v18 + 32;
    }
    *(unsigned char *)(v16 + 16) = 1;
    uint64_t v7 = v1[6];
    if (v4 >= *(void *)(v7 + 16)) {
      goto LABEL_35;
    }
  }
  __break(1u);
LABEL_37:
  __break(1u);
}

uint64_t sub_25BE7C550()
{
  sub_25BE70024();
  uint64_t v1 = *(void *)(*(void *)(v0 + 40) + 16);
  sub_25BE700C8(v1);
  OUTLINED_FUNCTION_1_33(v1 + 1);
  uint64_t v4 = v3 + v1 * v2;
  *(_OWORD *)(v4 + 32) = xmmword_25BE99B40;
  *(unsigned char *)(v4 + 48) = 0;
  sub_25BE7000C();
  uint64_t v5 = *(void *)(*(void *)(v0 + 48) + 16);
  sub_25BE700B0(v5);
  uint64_t v6 = *(void *)(v0 + 48);
  *(void *)(v6 + 16) = v5 + 1;
  *(unsigned char *)(v6 + v5 + 32) = 1;
  type metadata accessor for KeyedContainer();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_getWitnessTable();
  return sub_25BE802B0();
}

uint64_t sub_25BE7C65C@<X0>(void *a1@<X8>)
{
  uint64_t v2 = v1;
  sub_25BE70024();
  uint64_t v4 = *(void *)(v1[5] + 16);
  sub_25BE700C8(v4);
  OUTLINED_FUNCTION_1_33(v4 + 1);
  uint64_t v7 = v6 + v4 * v5;
  *(void *)(v7 + 32) = 0;
  *(void *)(v7 + 40) = 0;
  *(unsigned char *)(v7 + 48) = 0;
  sub_25BE7000C();
  uint64_t v8 = *(void *)(v1[6] + 16);
  sub_25BE700B0(v8);
  uint64_t v9 = v1[6];
  *(void *)(v9 + 16) = v8 + 1;
  *(unsigned char *)(v9 + v8 + 32) = 0;
  uint64_t v10 = v1[2];
  a1[3] = &unk_270960EF8;
  a1[4] = sub_25BE7DDC0();
  *a1 = 0;
  a1[1] = v10;
  a1[2] = v2;
  swift_bridgeObjectRetain();

  return swift_retain();
}

uint64_t sub_25BE7C720@<X0>(void *a1@<X8>)
{
  uint64_t v3 = *(void *)(v1 + 16);
  a1[3] = &unk_270960F80;
  a1[4] = sub_25BE7D504();
  *a1 = v3;
  a1[1] = v1;
  swift_bridgeObjectRetain();

  return swift_retain();
}

void sub_25BE7C780(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRetain();
  sub_25BE70024();
  uint64_t v5 = *(void *)(*(void *)(v2 + 40) + 16);
  sub_25BE700C8(v5);
  OUTLINED_FUNCTION_1_33(v5 + 1);
  uint64_t v8 = v7 + v5 * v6;
  *(void *)(v8 + 32) = a1;
  *(void *)(v8 + 40) = a2;
  *(unsigned char *)(v8 + 48) = 3;
}

void sub_25BE7C7F4(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = sub_25BE80680();
  uint64_t v7 = v6;
  sub_25BE70024();
  uint64_t v8 = *(void *)(*(void *)(v2 + 40) + 16);
  sub_25BE700C8(v8);
  OUTLINED_FUNCTION_1_33(v8 + 1);
  uint64_t v11 = v10 + v8 * v9;
  *(void *)(v11 + 32) = v5;
  *(void *)(v11 + 40) = v7;
  *(unsigned char *)(v11 + 48) = 2;
  sub_25BE7C780(a1, a2);
}

uint64_t sub_25BE7C898(unint64_t a1, void *a2)
{
  if (a1 >> 61 == 3)
  {
    long long v5 = *(_OWORD *)((a1 & 0x1FFFFFFFFFFFFFFFLL) + 0x20);
    v8[0] = *(_OWORD *)((a1 & 0x1FFFFFFFFFFFFFFFLL) + 0x10);
    v8[1] = v5;
    v8[2] = *(_OWORD *)((a1 & 0x1FFFFFFFFFFFFFFFLL) + 0x30);
    uint64_t v9 = *(void *)((a1 & 0x1FFFFFFFFFFFFFFFLL) + 0x40);
    swift_retain();
    sub_25BE7CE50((uint64_t)v8);
    return swift_release();
  }
  if (!(a1 >> 61))
  {
    char v4 = *(unsigned char *)(a1 + 16);
    swift_retain();
    sub_25BE7CCE8(v4);
    return swift_release();
  }
  v7[3] = *a2;
  v7[4] = sub_25BE7E170();
  v7[0] = a2;
  swift_retain();
  swift_retain();
  AvroSchema.encode(to:)(v7, a1);
  swift_release();
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v7);
}

uint64_t sub_25BE7C9AC(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v28 = a4;
  uint64_t v19 = *a2;
  uint64_t v7 = *(void *)(a3 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](a1);
  uint64_t v10 = (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = MEMORY[0x270FA5388](v8);
  char v13 = (char *)&v19 - v12;
  MEMORY[0x270FA5388](v11);
  unint64_t v14 = *(void (**)(char *, uint64_t))(v7 + 16);
  v14((char *)&v19 - v15, a1);
  if (swift_dynamicCast())
  {
    if ((unint64_t)v20 >> 61 == 3)
    {
      long long v18 = *(_OWORD *)((v20 & 0x1FFFFFFFFFFFFFFFLL) + 0x20);
      v24[0] = *(_OWORD *)((v20 & 0x1FFFFFFFFFFFFFFFLL) + 0x10);
      v24[1] = v18;
      v24[2] = *(_OWORD *)((v20 & 0x1FFFFFFFFFFFFFFFLL) + 0x30);
      uint64_t v25 = *(void *)((v20 & 0x1FFFFFFFFFFFFFFFLL) + 0x40);
      swift_retain();
      sub_25BE7CE50((uint64_t)v24);
      return swift_release_n();
    }
    if (!((unint64_t)v20 >> 61))
    {
      char v16 = *(unsigned char *)(v20 + 16);
      swift_retain();
      sub_25BE7CCE8(v16);
      return swift_release_n();
    }
    *((void *)&v21 + 1) = v19;
    *(void *)&long long v22 = sub_25BE7E170();
    *(void *)&long long v20 = a2;
    swift_retain();
    sub_25BE7FB50();
    swift_release();
  }
  else
  {
    ((void (*)(char *, uint64_t, uint64_t))v14)(v13, a1, a3);
    if (swift_dynamicCast()) {
      return sub_25BE7CCE8(v20);
    }
    ((void (*)(char *, uint64_t, uint64_t))v14)(v10, a1, a3);
    if (swift_dynamicCast())
    {
      v26[0] = v20;
      v26[1] = v21;
      v26[2] = v22;
      uint64_t v27 = v23;
      sub_25BE7CE50((uint64_t)v26);
      return sub_25BE5E10C((uint64_t)v26);
    }
    *((void *)&v21 + 1) = v19;
    *(void *)&long long v22 = sub_25BE7E170();
    *(void *)&long long v20 = a2;
    swift_retain();
    sub_25BE7FB50();
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)&v20);
}

uint64_t sub_25BE7CCE8(char a1)
{
  uint64_t v4 = *(void *)(v1 + 40);
  uint64_t v3 = (uint64_t *)(v1 + 40);
  if (*(void *)(v4 + 16))
  {
    uint64_t v5 = sub_25BE5D044(a1);
    uint64_t v7 = v6;
    sub_25BE70024();
    uint64_t v8 = *(void *)(*v3 + 16);
    uint64_t result = sub_25BE700C8(v8);
    uint64_t v10 = *v3;
    *(void *)(v10 + 16) = v8 + 1;
    uint64_t v11 = v10 + 24 * v8;
    *(void *)(v11 + 32) = v5;
    uint64_t v12 = v11 + 32;
    char v13 = 3;
  }
  else
  {
    sub_25BE70024();
    uint64_t v14 = *(void *)(*v3 + 16);
    sub_25BE700C8(v14);
    uint64_t v15 = *v3;
    *(void *)(v15 + 16) = v14 + 1;
    uint64_t v16 = v15 + 24 * v14;
    *(_OWORD *)(v16 + 32) = xmmword_25BE99B40;
    *(unsigned char *)(v16 + 48) = 0;
    sub_25BE70024();
    uint64_t v17 = *(void *)(*v3 + 16);
    sub_25BE700C8(v17);
    uint64_t v18 = *v3;
    *(void *)(v18 + 16) = v17 + 1;
    uint64_t v19 = v18 + 24 * v17;
    *(_OWORD *)(v19 + 32) = xmmword_25BE99B50;
    *(unsigned char *)(v19 + 48) = 2;
    uint64_t v20 = sub_25BE5D044(a1);
    uint64_t v22 = v21;
    sub_25BE70024();
    uint64_t v23 = *(void *)(*v3 + 16);
    sub_25BE700C8(v23);
    uint64_t v24 = *v3;
    *(void *)(v24 + 16) = v23 + 1;
    uint64_t v25 = v24 + 24 * v23;
    *(void *)(v25 + 32) = v20;
    *(void *)(v25 + 40) = v22;
    *(unsigned char *)(v25 + 48) = 3;
    sub_25BE70024();
    uint64_t v26 = *(void *)(*v3 + 16);
    uint64_t result = sub_25BE700C8(v26);
    uint64_t v7 = 0;
    uint64_t v27 = *v3;
    *(void *)(v27 + 16) = v26 + 1;
    uint64_t v28 = v27 + 24 * v26;
    char v13 = 1;
    *(void *)(v28 + 32) = 1;
    uint64_t v12 = v28 + 32;
  }
  *(void *)(v12 + 8) = v7;
  *(unsigned char *)(v12 + 16) = v13;
  return result;
}

uint64_t sub_25BE7CE50(uint64_t a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = *(void *)(a1 + 16);
  uint64_t v6 = *(void *)(a1 + 24);
  uint64_t v7 = *v1;
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_25BE03D68(a1);
  sub_25BE7DF24(a1, v5, v6, (uint64_t)&v18);
  swift_endAccess();
  swift_bridgeObjectRelease();
  uint64_t v8 = *((void *)&v18 + 1);
  if (!*((void *)&v18 + 1))
  {
    *((void *)&v19 + 1) = v7;
    *(void *)&long long v20 = sub_25BE7E170();
    *(void *)&long long v18 = v3;
    swift_retain();
    AvroRecordSchema.encode(to:)(&v18);
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)&v18);
  }
  uint64_t v26 = v2;
  uint64_t v9 = v18;
  long long v22 = v18;
  long long v23 = v19;
  long long v24 = v20;
  uint64_t v25 = v21;
  if (static AvroRecordSchema.__derived_struct_equals(_:_:)())
  {
    sub_25BE7E20C(v9, v8);
    *((void *)&v19 + 1) = v7;
    *(void *)&long long v20 = sub_25BE7E170();
    *(void *)&long long v18 = v3;
    swift_retain();
    sub_25BE7FCE0();
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)&v18);
  }
  uint64_t v11 = swift_allocObject();
  long long v12 = v23;
  *(_OWORD *)(v11 + 16) = v22;
  *(_OWORD *)(v11 + 32) = v12;
  *(_OWORD *)(v11 + 48) = v24;
  *(void *)(v11 + 64) = v25;
  uint64_t v13 = v11 | 0x6000000000000000;
  uint64_t v14 = swift_allocObject();
  long long v15 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(v14 + 16) = *(_OWORD *)a1;
  *(_OWORD *)(v14 + 32) = v15;
  *(_OWORD *)(v14 + 48) = *(_OWORD *)(a1 + 32);
  *(void *)(v14 + 64) = *(void *)(a1 + 48);
  uint64_t v16 = v14 | 0x6000000000000000;
  sub_25BE774A8();
  swift_allocError();
  *uint64_t v17 = v13;
  v17[1] = v16;
  sub_25BE03D68(a1);
  return swift_willThrow();
}

void sub_25BE7D07C()
{
  uint64_t v1 = sub_25BE80680();
  uint64_t v3 = v2;
  sub_25BE70024();
  uint64_t v4 = *(void *)(*(void *)(v0 + 40) + 16);
  sub_25BE700C8(v4);
  OUTLINED_FUNCTION_1_33(v4 + 1);
  uint64_t v7 = v6 + v4 * v5;
  *(void *)(v7 + 32) = v1;
  *(void *)(v7 + 40) = v3;
  *(unsigned char *)(v7 + 48) = 2;
  sub_25BE7BE38();
}

uint64_t sub_25BE7D130()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_25BE7D170()
{
  sub_25BE7D130();

  return MEMORY[0x270FA0228](v0, 56, 7);
}

unsigned char *sub_25BE7D1A4(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x25BE7D270);
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

void type metadata accessor for SchemaEncoder.ContainerKind()
{
}

uint64_t sub_25BE7D2A8(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 0xFE) == 2) {
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_25BE7D2C0(uint64_t a1)
{
  return sub_25BE7D2D0(*(void *)a1, *(void *)(a1 + 8), *(unsigned char *)(a1 + 16));
}

uint64_t sub_25BE7D2D0(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 0xFE) == 2) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_25BE7D2E8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  char v5 = *(unsigned char *)(a2 + 16);
  sub_25BE7D2A8(*(void *)a2, v4, v5);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  return a1;
}

uint64_t sub_25BE7D334(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  char v5 = *(unsigned char *)(a2 + 16);
  sub_25BE7D2A8(*(void *)a2, v4, v5);
  uint64_t v6 = *(void *)a1;
  uint64_t v7 = *(void *)(a1 + 8);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  char v8 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v5;
  sub_25BE7D2D0(v6, v7, v8);
  return a1;
}

uint64_t sub_25BE7D38C(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 16);
  uint64_t v4 = *(void *)a1;
  uint64_t v5 = *(void *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  char v6 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v3;
  sub_25BE7D2D0(v4, v5, v6);
  return a1;
}

void type metadata accessor for SchemaEncoder.Token()
{
}

unint64_t sub_25BE7D3E4()
{
  unint64_t result = qword_26A55B918;
  if (!qword_26A55B918)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A55B918);
  }
  return result;
}

unint64_t sub_25BE7D434()
{
  unint64_t result = qword_26A55B920;
  if (!qword_26A55B920)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A55B920);
  }
  return result;
}

uint64_t sub_25BE7D480()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_25BE7D48C()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_25BE7D498()
{
  return sub_25BE7C550();
}

uint64_t sub_25BE7D4BC@<X0>(void *a1@<X8>)
{
  return sub_25BE7C65C(a1);
}

uint64_t sub_25BE7D4E0@<X0>(void *a1@<X8>)
{
  return sub_25BE7C720(a1);
}

unint64_t sub_25BE7D504()
{
  unint64_t result = qword_26A55B928;
  if (!qword_26A55B928)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A55B928);
  }
  return result;
}

void sub_25BE7D550(uint64_t a1, uint64_t a2)
{
}

void sub_25BE7D57C()
{
}

uint64_t sub_25BE7D5B0()
{
  return swift_bridgeObjectRetain();
}

void sub_25BE7D5B8()
{
}

void sub_25BE7D5C8()
{
}

void sub_25BE7D5DC(uint64_t a1, uint64_t a2)
{
}

uint64_t sub_25BE7D5F4()
{
  return sub_25BE80530();
}

uint64_t sub_25BE7D60C()
{
  return sub_25BE80540();
}

void sub_25BE7D624()
{
}

uint64_t sub_25BE7D64C()
{
  return sub_25BE80520();
}

uint64_t sub_25BE7D678()
{
  return sub_25BE80490();
}

uint64_t sub_25BE7D690()
{
  return sub_25BE80480();
}

uint64_t sub_25BE7D6A8()
{
  return sub_25BE804A0();
}

uint64_t sub_25BE7D6C4(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_25BE7D8B8(a1, a2, a3, a4, MEMORY[0x263F8E3C0]);
}

uint64_t sub_25BE7D6F0()
{
  return sub_25BE804B0();
}

uint64_t sub_25BE7D70C(__int16 a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_25BE7D810(a1, a2, a3, a4, MEMORY[0x263F8E3D8]);
}

uint64_t sub_25BE7D738(int a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_25BE7D864(a1, a2, a3, a4, MEMORY[0x263F8E3E0]);
}

uint64_t sub_25BE7D764(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_25BE7D8B8(a1, a2, a3, a4, MEMORY[0x263F8E3E8]);
}

uint64_t sub_25BE7D790()
{
  return sub_25BE804E0();
}

uint64_t sub_25BE7D7AC()
{
  return sub_25BE804F0();
}

uint64_t sub_25BE7D7C8()
{
  return sub_25BE804C0();
}

uint64_t sub_25BE7D7E4(__int16 a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_25BE7D810(a1, a2, a3, a4, MEMORY[0x263F8E3F8]);
}

uint64_t sub_25BE7D810(__int16 a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(void))
{
  return a5(a1 & 0x1FF);
}

uint64_t sub_25BE7D838(int a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_25BE7D864(a1, a2, a3, a4, MEMORY[0x263F8E408]);
}

uint64_t sub_25BE7D864(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(void))
{
  return a5(a1 & 0x1FFFF);
}

uint64_t sub_25BE7D88C(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_25BE7D8B8(a1, a2, a3, a4, MEMORY[0x263F8E410]);
}

uint64_t sub_25BE7D8B8(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(uint64_t))
{
  return a5(a1 | ((HIDWORD(a1) & 1) << 32));
}

uint64_t sub_25BE7D8E8()
{
  return sub_25BE80500();
}

uint64_t sub_25BE7D904()
{
  return sub_25BE80510();
}

uint64_t sub_25BE7D920()
{
  return sub_25BE804D0();
}

void sub_25BE7D94C(uint64_t a1, uint64_t a2)
{
  if (__OFADD__(*v2, 1))
  {
    __break(1u);
  }
  else
  {
    ++*v2;
    sub_25BE7C780(a1, a2);
  }
}

void sub_25BE7D98C()
{
  if (__OFADD__(*v0, 1))
  {
    __break(1u);
  }
  else
  {
    ++*v0;
    sub_25BE7BE38();
  }
}

uint64_t sub_25BE7D9C4()
{
  return swift_bridgeObjectRetain();
}

void sub_25BE7D9CC(uint64_t a1, uint64_t a2)
{
}

uint64_t sub_25BE7D9E4()
{
  return sub_25BE80400();
}

uint64_t sub_25BE7D9FC()
{
  return sub_25BE80410();
}

void sub_25BE7DA14()
{
}

uint64_t sub_25BE7DA2C()
{
  return sub_25BE802E0();
}

uint64_t sub_25BE7DA58()
{
  return sub_25BE80310();
}

uint64_t sub_25BE7DA84()
{
  return sub_25BE80300();
}

uint64_t sub_25BE7DAB0()
{
  return sub_25BE80320();
}

uint64_t sub_25BE7DADC()
{
  return sub_25BE80330();
}

uint64_t sub_25BE7DB08()
{
  return sub_25BE80340();
}

uint64_t sub_25BE7DB34()
{
  return sub_25BE80360();
}

uint64_t sub_25BE7DB60()
{
  return sub_25BE80370();
}

uint64_t sub_25BE7DB8C()
{
  return sub_25BE80380();
}

uint64_t sub_25BE7DBB8()
{
  return sub_25BE80390();
}

uint64_t sub_25BE7DBE4()
{
  return sub_25BE803B0();
}

uint64_t sub_25BE7DC10()
{
  return sub_25BE80350();
}

uint64_t sub_25BE7DC3C()
{
  return sub_25BE803A0();
}

uint64_t sub_25BE7DC68()
{
  return sub_25BE803C0();
}

uint64_t sub_25BE7DC94()
{
  return sub_25BE803D0();
}

uint64_t sub_25BE7DCC0()
{
  return sub_25BE803E0();
}

uint64_t sub_25BE7DCEC()
{
  return sub_25BE803F0();
}

uint64_t sub_25BE7DD18()
{
  return sub_25BE802F0();
}

void sub_25BE7DD4C(uint64_t a1, uint64_t a2)
{
}

void sub_25BE7DD78(uint64_t a1, uint64_t a2)
{
}

uint64_t sub_25BE7DD90()
{
  return sub_25BE80460();
}

uint64_t sub_25BE7DDA8()
{
  return sub_25BE80470();
}

unint64_t sub_25BE7DDC0()
{
  unint64_t result = qword_26A55B930;
  if (!qword_26A55B930)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A55B930);
  }
  return result;
}

uint64_t type metadata accessor for KeyedContainer()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_25BE7DE24(uint64_t a1, uint64_t a2, char a3)
{
  if (a3 != -1) {
    return sub_25BE7D2A8(a1, a2, a3);
  }
  return a1;
}

uint64_t sub_25BE7DE38(uint64_t a1, uint64_t a2, char a3)
{
  if (a3 != -1) {
    return sub_25BE7D2D0(a1, a2, a3);
  }
  return a1;
}

void *sub_25BE7DE4C(unint64_t a1, uint64_t a2, uint64_t a3, void *__src, void *a5)
{
  a5[(a1 >> 6) + 8] |= 1 << a1;
  char v6 = (void *)(a5[6] + 16 * a1);
  *char v6 = a2;
  v6[1] = a3;
  unint64_t result = memcpy((void *)(a5[7] + 72 * a1), __src, 0x41uLL);
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

unint64_t sub_25BE7DEC0(unint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  a5[(result >> 6) + 8] |= 1 << result;
  uint64_t v5 = (void *)(a5[6] + 16 * result);
  *uint64_t v5 = a2;
  v5[1] = a3;
  uint64_t v6 = a5[7] + 56 * result;
  long long v7 = *(_OWORD *)(a4 + 16);
  *(_OWORD *)uint64_t v6 = *(_OWORD *)a4;
  *(_OWORD *)(v6 + 16) = v7;
  *(_OWORD *)(v6 + 32) = *(_OWORD *)(a4 + 32);
  *(void *)(v6 + 48) = *(void *)(a4 + 48);
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

uint64_t sub_25BE7DF24@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  swift_isUniquelyReferenced_nonNull_native();
  uint64_t v10 = *v4;
  *uint64_t v4 = 0x8000000000000000;
  sub_25BE7DFBC(a1, a2, a3, a4);
  *uint64_t v4 = v10;

  return swift_bridgeObjectRelease();
}

uint64_t sub_25BE7DFBC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v5 = (void **)v4;
  uint64_t v10 = (void *)*v4;
  unint64_t v11 = sub_25BE1158C(a2, a3);
  if (__OFADD__(v10[2], (v12 & 1) == 0))
  {
    __break(1u);
    goto LABEL_11;
  }
  unint64_t v13 = v11;
  char v14 = v12;
  __swift_instantiateConcreteTypeFromMangledName(qword_26A55B940);
  uint64_t result = sub_25BE800E0();
  if ((result & 1) == 0) {
    goto LABEL_5;
  }
  uint64_t result = sub_25BE1158C(a2, a3);
  if ((v14 & 1) != (v16 & 1))
  {
LABEL_11:
    uint64_t result = sub_25BE80580();
    __break(1u);
    return result;
  }
  unint64_t v13 = result;
LABEL_5:
  uint64_t v17 = *v5;
  if (v14)
  {
    uint64_t v18 = v17[7] + 56 * v13;
    uint64_t v19 = *(void *)(v18 + 16);
    uint64_t v20 = *(void *)(v18 + 24);
    uint64_t v21 = *(void *)(v18 + 48);
    *(_OWORD *)a4 = *(_OWORD *)v18;
    *(void *)(a4 + 16) = v19;
    *(void *)(a4 + 24) = v20;
    *(_OWORD *)(a4 + 32) = *(_OWORD *)(v18 + 32);
    *(void *)(a4 + 48) = v21;
    long long v22 = *(_OWORD *)(a1 + 32);
    *(_OWORD *)(v18 + 16) = *(_OWORD *)(a1 + 16);
    *(_OWORD *)(v18 + 32) = v22;
    *(_OWORD *)uint64_t v18 = *(_OWORD *)a1;
    *(void *)(v18 + 48) = *(void *)(a1 + 48);
  }
  else
  {
    sub_25BE7DEC0(v13, a2, a3, a1, v17);
    *(void *)(a4 + 48) = 0;
    *(_OWORD *)(a4 + 16) = 0u;
    *(_OWORD *)(a4 + 32) = 0u;
    *(_OWORD *)a4 = 0u;
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_25BE7E138(unint64_t *a1, void *a2)
{
  return sub_25BE7C898(*a1, a2);
}

uint64_t sub_25BE7E154()
{
  return sub_25BE7E138(*(unint64_t **)(v0 + 16), *(void **)(v0 + 24));
}

unint64_t sub_25BE7E170()
{
  unint64_t result = qword_26A55B938;
  if (!qword_26A55B938)
  {
    type metadata accessor for SchemaEncoder();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A55B938);
  }
  return result;
}

uint64_t sub_25BE7E1BC()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 72, 7);
}

uint64_t sub_25BE7E20C(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_25BE7E270()
{
  return sub_25BE7C9AC(*(void *)(v0 + 32), *(uint64_t **)(v0 + 40), *(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_25BE7E290(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 24);
}

uint64_t sub_25BE7E29C()
{
  swift_bridgeObjectRelease();

  return swift_release();
}

uint64_t sub_25BE7E2EC()
{
  swift_bridgeObjectRelease();

  return swift_release();
}

void *sub_25BE7E328(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_retain();
  return a1;
}

void *sub_25BE7E368(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_retain();
  swift_release();
  return a1;
}

uint64_t sub_25BE7E3D0(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_release();
  return a1;
}

void type metadata accessor for UnkeyedContainer()
{
}

void *sub_25BE7E424(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  swift_retain();
  return a1;
}

void *sub_25BE7E45C(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  return a1;
}

_OWORD *sub_25BE7E4BC(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_release();
  return a1;
}

uint64_t sub_25BE7E4FC(uint64_t *a1, int a2)
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

uint64_t sub_25BE7E53C(uint64_t result, int a2, int a3)
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

void type metadata accessor for SingleValueContainer()
{
}

uint64_t sub_25BE7E584(uint64_t a1, uint64_t a2)
{
  return *(void *)(a2 + 24);
}

void OUTLINED_FUNCTION_1_33(uint64_t a1@<X8>)
{
  *(void *)(v1 + 16) = a1;
}

uint64_t sub_25BE7E5A0()
{
  return MEMORY[0x270EEDDD0]();
}

uint64_t sub_25BE7E5B0()
{
  return MEMORY[0x270EEDE10]();
}

uint64_t sub_25BE7E5C0()
{
  return MEMORY[0x270EEDE18]();
}

uint64_t sub_25BE7E5D0()
{
  return MEMORY[0x270EEE2F0]();
}

uint64_t sub_25BE7E5E0()
{
  return MEMORY[0x270EEE308]();
}

uint64_t sub_25BE7E5F0()
{
  return MEMORY[0x270EEE318]();
}

uint64_t sub_25BE7E600()
{
  return MEMORY[0x270EEE338]();
}

uint64_t sub_25BE7E610()
{
  return MEMORY[0x270EEE628]();
}

uint64_t sub_25BE7E620()
{
  return MEMORY[0x270EEE638]();
}

uint64_t sub_25BE7E630()
{
  return MEMORY[0x270EEE658]();
}

uint64_t sub_25BE7E640()
{
  return MEMORY[0x270EEE670]();
}

uint64_t sub_25BE7E650()
{
  return MEMORY[0x270EEE688]();
}

uint64_t sub_25BE7E660()
{
  return MEMORY[0x270EEE8E8]();
}

uint64_t sub_25BE7E670()
{
  return MEMORY[0x270EEE920]();
}

uint64_t sub_25BE7E680()
{
  return MEMORY[0x270EEE930]();
}

uint64_t sub_25BE7E690()
{
  return MEMORY[0x270EEE950]();
}

uint64_t sub_25BE7E6A0()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_25BE7E6B0()
{
  return MEMORY[0x270EEFBD8]();
}

uint64_t sub_25BE7E6C0()
{
  return MEMORY[0x270EEFC10]();
}

uint64_t sub_25BE7E6D0()
{
  return MEMORY[0x270EEFC58]();
}

uint64_t sub_25BE7E6E0()
{
  return MEMORY[0x270EEFCB0]();
}

uint64_t sub_25BE7E6F0()
{
  return MEMORY[0x270EEFCE0]();
}

uint64_t sub_25BE7E700()
{
  return MEMORY[0x270EEFD28]();
}

uint64_t sub_25BE7E710()
{
  return MEMORY[0x270EEFD58]();
}

uint64_t sub_25BE7E720()
{
  return MEMORY[0x270EEFD70]();
}

uint64_t sub_25BE7E730()
{
  return MEMORY[0x270EEFDB8]();
}

uint64_t sub_25BE7E740()
{
  return MEMORY[0x270EEFE08]();
}

uint64_t sub_25BE7E750()
{
  return MEMORY[0x270EEFE20]();
}

uint64_t sub_25BE7E760()
{
  return MEMORY[0x270EEFE68]();
}

uint64_t sub_25BE7E770()
{
  return MEMORY[0x270EEFE80]();
}

uint64_t sub_25BE7E780()
{
  return MEMORY[0x270EEFF18]();
}

uint64_t sub_25BE7E790()
{
  return MEMORY[0x270EEFF30]();
}

uint64_t sub_25BE7E7A0()
{
  return MEMORY[0x270EEFF58]();
}

uint64_t sub_25BE7E7B0()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_25BE7E7C0()
{
  return MEMORY[0x270EEFF98]();
}

uint64_t sub_25BE7E7D0()
{
  return MEMORY[0x270EEFFB8]();
}

uint64_t sub_25BE7E7E0()
{
  return MEMORY[0x270EEFFC8]();
}

uint64_t sub_25BE7E7F0()
{
  return MEMORY[0x270EF0008]();
}

uint64_t sub_25BE7E800()
{
  return MEMORY[0x270EF0048]();
}

uint64_t sub_25BE7E810()
{
  return MEMORY[0x270EF0060]();
}

uint64_t sub_25BE7E820()
{
  return MEMORY[0x270EF0070]();
}

uint64_t sub_25BE7E830()
{
  return MEMORY[0x270EF00B0]();
}

uint64_t sub_25BE7E840()
{
  return MEMORY[0x270EF00F8]();
}

uint64_t sub_25BE7E850()
{
  return MEMORY[0x270EF0120]();
}

uint64_t sub_25BE7E860()
{
  return MEMORY[0x270EF0158]();
}

uint64_t sub_25BE7E870()
{
  return MEMORY[0x270EF0190]();
}

uint64_t sub_25BE7E880()
{
  return MEMORY[0x270EF01B0]();
}

uint64_t sub_25BE7E890()
{
  return MEMORY[0x270EF01C0]();
}

uint64_t sub_25BE7E8A0()
{
  return MEMORY[0x270EF01E0]();
}

uint64_t sub_25BE7E8B0()
{
  return MEMORY[0x270EF0238]();
}

uint64_t sub_25BE7E8C0()
{
  return MEMORY[0x270EF0278]();
}

uint64_t sub_25BE7E8D0()
{
  return MEMORY[0x270EF02C8]();
}

uint64_t sub_25BE7E8E0()
{
  return MEMORY[0x270EF0700]();
}

uint64_t sub_25BE7E8F0()
{
  return MEMORY[0x270EF0780]();
}

uint64_t sub_25BE7E900()
{
  return MEMORY[0x270EF07A0]();
}

uint64_t sub_25BE7E910()
{
  return MEMORY[0x270EF0898]();
}

uint64_t sub_25BE7E920()
{
  return MEMORY[0x270EF0998]();
}

uint64_t sub_25BE7E930()
{
  return MEMORY[0x270EF09E0]();
}

uint64_t sub_25BE7E940()
{
  return MEMORY[0x270EF0AF0]();
}

uint64_t sub_25BE7E950()
{
  return MEMORY[0x270EF0AF8]();
}

uint64_t sub_25BE7E960()
{
  return MEMORY[0x270EF0BB8]();
}

uint64_t sub_25BE7E970()
{
  return MEMORY[0x270EF0C30]();
}

uint64_t sub_25BE7E980()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_25BE7E990()
{
  return MEMORY[0x270EF0C68]();
}

uint64_t sub_25BE7E9A0()
{
  return MEMORY[0x270EF0D08]();
}

uint64_t sub_25BE7E9B0()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_25BE7E9C0()
{
  return MEMORY[0x270EF10A8]();
}

uint64_t sub_25BE7E9D0()
{
  return MEMORY[0x270EF10C8]();
}

uint64_t sub_25BE7E9E0()
{
  return MEMORY[0x270EF10D8]();
}

uint64_t sub_25BE7E9F0()
{
  return MEMORY[0x270EF1100]();
}

uint64_t sub_25BE7EA00()
{
  return MEMORY[0x270EF1108]();
}

uint64_t sub_25BE7EA10()
{
  return MEMORY[0x270EF1258]();
}

uint64_t sub_25BE7EA20()
{
  return MEMORY[0x270EF1280]();
}

uint64_t sub_25BE7EA30()
{
  return MEMORY[0x270EF1368]();
}

uint64_t sub_25BE7EA40()
{
  return MEMORY[0x270EF13C8]();
}

uint64_t sub_25BE7EA50()
{
  return MEMORY[0x270EF1410]();
}

uint64_t sub_25BE7EA60()
{
  return MEMORY[0x270EF1428]();
}

uint64_t sub_25BE7EA70()
{
  return MEMORY[0x270EF1440]();
}

uint64_t sub_25BE7EA80()
{
  return MEMORY[0x270EF15A8]();
}

uint64_t sub_25BE7EA90()
{
  return MEMORY[0x270EF1608]();
}

uint64_t sub_25BE7EAA0()
{
  return MEMORY[0x270F54FC0]();
}

uint64_t sub_25BE7EAB0()
{
  return MEMORY[0x270F54FC8]();
}

uint64_t sub_25BE7EAC0()
{
  return MEMORY[0x270F54FE0]();
}

uint64_t sub_25BE7EAD0()
{
  return MEMORY[0x270F54FF0]();
}

uint64_t sub_25BE7EAE0()
{
  return MEMORY[0x270F54FF8]();
}

uint64_t sub_25BE7EAF0()
{
  return MEMORY[0x270F55008]();
}

uint64_t sub_25BE7EB00()
{
  return MEMORY[0x270F55018]();
}

uint64_t sub_25BE7EB10()
{
  return MEMORY[0x270F55020]();
}

uint64_t sub_25BE7EB20()
{
  return MEMORY[0x270F55028]();
}

uint64_t sub_25BE7EB30()
{
  return MEMORY[0x270F55030]();
}

uint64_t sub_25BE7EB40()
{
  return MEMORY[0x270F55040]();
}

uint64_t sub_25BE7EB50()
{
  return MEMORY[0x270F55048]();
}

uint64_t sub_25BE7EB60()
{
  return MEMORY[0x270F55060]();
}

uint64_t sub_25BE7EB70()
{
  return MEMORY[0x270F55070]();
}

uint64_t sub_25BE7EB80()
{
  return MEMORY[0x270F55088]();
}

uint64_t sub_25BE7EB90()
{
  return MEMORY[0x270F550A0]();
}

uint64_t sub_25BE7EBA0()
{
  return MEMORY[0x270F28690]();
}

uint64_t sub_25BE7EBB0()
{
  return MEMORY[0x270F54830]();
}

uint64_t sub_25BE7EBC0()
{
  return MEMORY[0x270F54838]();
}

uint64_t sub_25BE7EBD0()
{
  return MEMORY[0x270F54840]();
}

uint64_t sub_25BE7EBE0()
{
  return MEMORY[0x270F54848]();
}

uint64_t sub_25BE7EBF0()
{
  return MEMORY[0x270F54850]();
}

uint64_t sub_25BE7EC00()
{
  return MEMORY[0x270F54858]();
}

uint64_t sub_25BE7EC10()
{
  return MEMORY[0x270F54860]();
}

uint64_t sub_25BE7EC20()
{
  return MEMORY[0x270F54868]();
}

uint64_t sub_25BE7EC30()
{
  return MEMORY[0x270F54870]();
}

uint64_t sub_25BE7EC40()
{
  return MEMORY[0x270F54878]();
}

uint64_t sub_25BE7EC50()
{
  return MEMORY[0x270F54880]();
}

uint64_t sub_25BE7EC60()
{
  return MEMORY[0x270F54888]();
}

uint64_t sub_25BE7EC70()
{
  return MEMORY[0x270F54890]();
}

uint64_t sub_25BE7EC80()
{
  return MEMORY[0x270F54898]();
}

uint64_t sub_25BE7EC90()
{
  return MEMORY[0x270F548A0]();
}

uint64_t sub_25BE7ECA0()
{
  return MEMORY[0x270F548A8]();
}

uint64_t sub_25BE7ECB0()
{
  return MEMORY[0x270F548B0]();
}

uint64_t sub_25BE7ECC0()
{
  return MEMORY[0x270F548B8]();
}

uint64_t sub_25BE7ECD0()
{
  return MEMORY[0x270F548C0]();
}

uint64_t sub_25BE7ECE0()
{
  return MEMORY[0x270F548D0]();
}

uint64_t sub_25BE7ECF0()
{
  return MEMORY[0x270F548D8]();
}

uint64_t sub_25BE7ED00()
{
  return MEMORY[0x270F548E0]();
}

uint64_t sub_25BE7ED10()
{
  return MEMORY[0x270F548E8]();
}

uint64_t sub_25BE7ED20()
{
  return MEMORY[0x270F548F0]();
}

uint64_t sub_25BE7ED30()
{
  return MEMORY[0x270F548F8]();
}

uint64_t sub_25BE7ED40()
{
  return MEMORY[0x270F54900]();
}

uint64_t sub_25BE7ED50()
{
  return MEMORY[0x270F54908]();
}

uint64_t sub_25BE7ED60()
{
  return MEMORY[0x270F54910]();
}

uint64_t sub_25BE7ED70()
{
  return MEMORY[0x270F54918]();
}

uint64_t sub_25BE7ED80()
{
  return MEMORY[0x270F54920]();
}

uint64_t sub_25BE7ED90()
{
  return MEMORY[0x270F54928]();
}

uint64_t sub_25BE7EDA0()
{
  return MEMORY[0x270F54930]();
}

uint64_t sub_25BE7EDB0()
{
  return MEMORY[0x270F54938]();
}

uint64_t sub_25BE7EDC0()
{
  return MEMORY[0x270F54940]();
}

uint64_t sub_25BE7EDD0()
{
  return MEMORY[0x270F54948]();
}

uint64_t sub_25BE7EDE0()
{
  return MEMORY[0x270F54950]();
}

uint64_t sub_25BE7EDF0()
{
  return MEMORY[0x270F54958]();
}

uint64_t sub_25BE7EE00()
{
  return MEMORY[0x270F54960]();
}

uint64_t sub_25BE7EE10()
{
  return MEMORY[0x270F54968]();
}

uint64_t sub_25BE7EE20()
{
  return MEMORY[0x270F54970]();
}

uint64_t sub_25BE7EE30()
{
  return MEMORY[0x270F54978]();
}

uint64_t sub_25BE7EE40()
{
  return MEMORY[0x270F54988]();
}

uint64_t sub_25BE7EE50()
{
  return MEMORY[0x270F54990]();
}

uint64_t sub_25BE7EE60()
{
  return MEMORY[0x270F54998]();
}

uint64_t sub_25BE7EE70()
{
  return MEMORY[0x270F549A0]();
}

uint64_t sub_25BE7EE80()
{
  return MEMORY[0x270F549F0]();
}

uint64_t sub_25BE7EE90()
{
  return MEMORY[0x270F549F8]();
}

uint64_t sub_25BE7EEA0()
{
  return MEMORY[0x270F54A00]();
}

uint64_t sub_25BE7EEC0()
{
  return MEMORY[0x270F54A10]();
}

uint64_t sub_25BE7EEE0()
{
  return MEMORY[0x270F54A30]();
}

uint64_t sub_25BE7EF00()
{
  return MEMORY[0x270F54A48]();
}

uint64_t sub_25BE7EF10()
{
  return MEMORY[0x270F54A50]();
}

uint64_t sub_25BE7EF20()
{
  return MEMORY[0x270F54A58]();
}

uint64_t sub_25BE7EF30()
{
  return MEMORY[0x270F54A60]();
}

uint64_t sub_25BE7EF40()
{
  return MEMORY[0x270F54BC8]();
}

uint64_t sub_25BE7EF50()
{
  return MEMORY[0x270F54BE0]();
}

uint64_t sub_25BE7EF60()
{
  return MEMORY[0x270F54BE8]();
}

uint64_t sub_25BE7EF70()
{
  return MEMORY[0x270F54BF8]();
}

uint64_t sub_25BE7EF80()
{
  return MEMORY[0x270F54C00]();
}

uint64_t sub_25BE7EF90()
{
  return MEMORY[0x270F54C08]();
}

uint64_t sub_25BE7EFA0()
{
  return MEMORY[0x270F54C88]();
}

uint64_t sub_25BE7EFB0()
{
  return MEMORY[0x270F54C90]();
}

uint64_t sub_25BE7EFC0()
{
  return MEMORY[0x270F54C98]();
}

uint64_t sub_25BE7EFD0()
{
  return MEMORY[0x270F54CA0]();
}

uint64_t sub_25BE7EFE0()
{
  return MEMORY[0x270F54CA8]();
}

uint64_t sub_25BE7EFF0()
{
  return MEMORY[0x270F54CB0]();
}

uint64_t sub_25BE7F000()
{
  return MEMORY[0x270F54CC0]();
}

uint64_t sub_25BE7F010()
{
  return MEMORY[0x270F54CC8]();
}

uint64_t sub_25BE7F020()
{
  return MEMORY[0x270F54D08]();
}

uint64_t sub_25BE7F030()
{
  return MEMORY[0x270F54D10]();
}

uint64_t sub_25BE7F040()
{
  return MEMORY[0x270F54D18]();
}

uint64_t sub_25BE7F050()
{
  return MEMORY[0x270F54D28]();
}

uint64_t sub_25BE7F060()
{
  return MEMORY[0x270F54D30]();
}

uint64_t sub_25BE7F070()
{
  return MEMORY[0x270F54D38]();
}

uint64_t sub_25BE7F080()
{
  return MEMORY[0x270F54D58]();
}

uint64_t sub_25BE7F090()
{
  return MEMORY[0x270F54D70]();
}

uint64_t sub_25BE7F0A0()
{
  return MEMORY[0x270F54D80]();
}

uint64_t sub_25BE7F0B0()
{
  return MEMORY[0x270F54DA0]();
}

uint64_t sub_25BE7F0C0()
{
  return MEMORY[0x270F54DB8]();
}

uint64_t sub_25BE7F0D0()
{
  return MEMORY[0x270F54DC8]();
}

uint64_t sub_25BE7F0E0()
{
  return MEMORY[0x270F54DD8]();
}

uint64_t sub_25BE7F0F0()
{
  return MEMORY[0x270F54DE0]();
}

uint64_t sub_25BE7F100()
{
  return MEMORY[0x270F54DE8]();
}

uint64_t sub_25BE7F110()
{
  return MEMORY[0x270F54E00]();
}

uint64_t sub_25BE7F120()
{
  return MEMORY[0x270F54E10]();
}

uint64_t sub_25BE7F130()
{
  return MEMORY[0x270F54E18]();
}

uint64_t sub_25BE7F140()
{
  return MEMORY[0x270F54E20]();
}

uint64_t sub_25BE7F150()
{
  return MEMORY[0x270F54E28]();
}

uint64_t sub_25BE7F160()
{
  return MEMORY[0x270F54E48]();
}

uint64_t sub_25BE7F170()
{
  return MEMORY[0x270F54E58]();
}

uint64_t sub_25BE7F180()
{
  return MEMORY[0x270F54E60]();
}

uint64_t sub_25BE7F190()
{
  return MEMORY[0x270F54E70]();
}

uint64_t sub_25BE7F1A0()
{
  return MEMORY[0x270F54E78]();
}

uint64_t sub_25BE7F1B0()
{
  return MEMORY[0x270F54E80]();
}

uint64_t sub_25BE7F1C0()
{
  return MEMORY[0x270F54E88]();
}

uint64_t sub_25BE7F1D0()
{
  return MEMORY[0x270F54E90]();
}

uint64_t sub_25BE7F1E0()
{
  return MEMORY[0x270F54EA8]();
}

uint64_t sub_25BE7F1F0()
{
  return MEMORY[0x270F54FA0]();
}

uint64_t sub_25BE7F200()
{
  return MEMORY[0x270F53378]();
}

uint64_t sub_25BE7F210()
{
  return MEMORY[0x270F53380]();
}

uint64_t sub_25BE7F220()
{
  return MEMORY[0x270F53388]();
}

uint64_t sub_25BE7F230()
{
  return MEMORY[0x270F53390]();
}

uint64_t sub_25BE7F240()
{
  return MEMORY[0x270F53398]();
}

uint64_t sub_25BE7F250()
{
  return MEMORY[0x270F53138]();
}

uint64_t sub_25BE7F260()
{
  return MEMORY[0x270F53140]();
}

uint64_t sub_25BE7F270()
{
  return MEMORY[0x270F53148]();
}

uint64_t sub_25BE7F280()
{
  return MEMORY[0x270F53150]();
}

uint64_t sub_25BE7F290()
{
  return MEMORY[0x270F53158]();
}

uint64_t sub_25BE7F2A0()
{
  return MEMORY[0x270F53160]();
}

uint64_t sub_25BE7F2B0()
{
  return MEMORY[0x270F53168]();
}

uint64_t sub_25BE7F2C0()
{
  return MEMORY[0x270F53170]();
}

uint64_t sub_25BE7F2D0()
{
  return MEMORY[0x270F53178]();
}

uint64_t sub_25BE7F2E0()
{
  return MEMORY[0x270F53180]();
}

uint64_t sub_25BE7F2F0()
{
  return MEMORY[0x270F53188]();
}

uint64_t sub_25BE7F300()
{
  return MEMORY[0x270F53190]();
}

uint64_t sub_25BE7F310()
{
  return MEMORY[0x270F53198]();
}

uint64_t sub_25BE7F320()
{
  return MEMORY[0x270F531A0]();
}

uint64_t sub_25BE7F330()
{
  return MEMORY[0x270F531A8]();
}

uint64_t sub_25BE7F340()
{
  return MEMORY[0x270F531B0]();
}

uint64_t sub_25BE7F350()
{
  return MEMORY[0x270F531B8]();
}

uint64_t sub_25BE7F360()
{
  return MEMORY[0x270F531C0]();
}

uint64_t sub_25BE7F370()
{
  return MEMORY[0x270F531C8]();
}

uint64_t sub_25BE7F380()
{
  return MEMORY[0x270F531D0]();
}

uint64_t sub_25BE7F390()
{
  return MEMORY[0x270F531D8]();
}

uint64_t sub_25BE7F3A0()
{
  return MEMORY[0x270F531E0]();
}

uint64_t sub_25BE7F3B0()
{
  return MEMORY[0x270F531E8]();
}

uint64_t sub_25BE7F3C0()
{
  return MEMORY[0x270F531F0]();
}

uint64_t sub_25BE7F3D0()
{
  return MEMORY[0x270F531F8]();
}

uint64_t sub_25BE7F3E0()
{
  return MEMORY[0x270F53200]();
}

uint64_t sub_25BE7F3F0()
{
  return MEMORY[0x270F53208]();
}

uint64_t sub_25BE7F400()
{
  return MEMORY[0x270F53210]();
}

uint64_t sub_25BE7F410()
{
  return MEMORY[0x270F53218]();
}

uint64_t sub_25BE7F420()
{
  return MEMORY[0x270F53220]();
}

uint64_t sub_25BE7F430()
{
  return MEMORY[0x270F53228]();
}

uint64_t sub_25BE7F440()
{
  return MEMORY[0x270F53230]();
}

uint64_t sub_25BE7F450()
{
  return MEMORY[0x270F53238]();
}

uint64_t sub_25BE7F460()
{
  return MEMORY[0x270F53240]();
}

uint64_t sub_25BE7F470()
{
  return MEMORY[0x270F53248]();
}

uint64_t sub_25BE7F480()
{
  return MEMORY[0x270F53250]();
}

uint64_t sub_25BE7F490()
{
  return MEMORY[0x270F53258]();
}

uint64_t sub_25BE7F4A0()
{
  return MEMORY[0x270F53260]();
}

uint64_t sub_25BE7F4B0()
{
  return MEMORY[0x270F53268]();
}

uint64_t sub_25BE7F4C0()
{
  return MEMORY[0x270F53270]();
}

uint64_t sub_25BE7F4D0()
{
  return MEMORY[0x270F53278]();
}

uint64_t sub_25BE7F4E0()
{
  return MEMORY[0x270F53280]();
}

uint64_t sub_25BE7F4F0()
{
  return MEMORY[0x270F53288]();
}

uint64_t sub_25BE7F500()
{
  return MEMORY[0x270F53290]();
}

uint64_t sub_25BE7F510()
{
  return MEMORY[0x270F53298]();
}

uint64_t sub_25BE7F520()
{
  return MEMORY[0x270F532A0]();
}

uint64_t sub_25BE7F530()
{
  return MEMORY[0x270F532A8]();
}

uint64_t sub_25BE7F540()
{
  return MEMORY[0x270F532B0]();
}

uint64_t sub_25BE7F550()
{
  return MEMORY[0x270F532B8]();
}

uint64_t sub_25BE7F560()
{
  return MEMORY[0x270F532C0]();
}

uint64_t sub_25BE7F570()
{
  return MEMORY[0x270F532C8]();
}

uint64_t sub_25BE7F580()
{
  return MEMORY[0x270F532D0]();
}

uint64_t sub_25BE7F590()
{
  return MEMORY[0x270F532D8]();
}

uint64_t sub_25BE7F5A0()
{
  return MEMORY[0x270F532E0]();
}

uint64_t sub_25BE7F5B0()
{
  return MEMORY[0x270F532E8]();
}

uint64_t sub_25BE7F5C0()
{
  return MEMORY[0x270F532F0]();
}

uint64_t _s23SearchOnDeviceAnalytics17CASupportedRecipeV8rawValueSSvg_0()
{
  return MEMORY[0x270F532F8]();
}

uint64_t sub_25BE7F5E0()
{
  return MEMORY[0x270F53300]();
}

uint64_t sub_25BE7F5F0()
{
  return MEMORY[0x270F53308]();
}

uint64_t sub_25BE7F600()
{
  return MEMORY[0x270F53310]();
}

uint64_t sub_25BE7F610()
{
  return MEMORY[0x270F53318]();
}

uint64_t sub_25BE7F620()
{
  return MEMORY[0x270F53320]();
}

uint64_t sub_25BE7F630()
{
  return MEMORY[0x270F53328]();
}

uint64_t sub_25BE7F640()
{
  return MEMORY[0x270F53330]();
}

uint64_t sub_25BE7F650()
{
  return MEMORY[0x270F53338]();
}

uint64_t sub_25BE7F660()
{
  return MEMORY[0x270F53340]();
}

uint64_t sub_25BE7F670()
{
  return MEMORY[0x270F53348]();
}

uint64_t sub_25BE7F680()
{
  return MEMORY[0x270F53350]();
}

uint64_t sub_25BE7F690()
{
  return MEMORY[0x270F53358]();
}

uint64_t sub_25BE7F6A0()
{
  return MEMORY[0x270F53360]();
}

uint64_t sub_25BE7F6B0()
{
  return MEMORY[0x270F53368]();
}

uint64_t sub_25BE7F6C0()
{
  return MEMORY[0x270F449E8]();
}

uint64_t sub_25BE7F6D0()
{
  return MEMORY[0x270F44A00]();
}

uint64_t sub_25BE7F6E0()
{
  return MEMORY[0x270F44A18]();
}

uint64_t sub_25BE7F6F0()
{
  return MEMORY[0x270F44A20]();
}

uint64_t sub_25BE7F700()
{
  return MEMORY[0x270F44A28]();
}

uint64_t sub_25BE7F710()
{
  return MEMORY[0x270F44A90]();
}

uint64_t sub_25BE7F720()
{
  return MEMORY[0x270F44A98]();
}

uint64_t sub_25BE7F730()
{
  return MEMORY[0x270F44AD8]();
}

uint64_t sub_25BE7F750()
{
  return MEMORY[0x270F44AF0]();
}

uint64_t sub_25BE7F760()
{
  return MEMORY[0x270F44B00]();
}

uint64_t sub_25BE7F770()
{
  return MEMORY[0x270F44B08]();
}

uint64_t sub_25BE7F780()
{
  return MEMORY[0x270F44B10]();
}

uint64_t sub_25BE7F790()
{
  return MEMORY[0x270F44B20]();
}

uint64_t sub_25BE7F7A0()
{
  return MEMORY[0x270F44B38]();
}

uint64_t sub_25BE7F7B0()
{
  return MEMORY[0x270F44B40]();
}

uint64_t sub_25BE7F7C0()
{
  return MEMORY[0x270F44B48]();
}

uint64_t sub_25BE7F7D0()
{
  return MEMORY[0x270F44B50]();
}

uint64_t sub_25BE7F7E0()
{
  return MEMORY[0x270F44B78]();
}

uint64_t sub_25BE7F7F0()
{
  return MEMORY[0x270F44B80]();
}

uint64_t sub_25BE7F800()
{
  return MEMORY[0x270F44B90]();
}

uint64_t sub_25BE7F810()
{
  return MEMORY[0x270F44BA0]();
}

uint64_t sub_25BE7F820()
{
  return MEMORY[0x270F44BB0]();
}

uint64_t sub_25BE7F830()
{
  return MEMORY[0x270F44BC0]();
}

uint64_t sub_25BE7F840()
{
  return MEMORY[0x270F44BC8]();
}

uint64_t sub_25BE7F850()
{
  return MEMORY[0x270F44BD0]();
}

uint64_t sub_25BE7F860()
{
  return MEMORY[0x270F44BD8]();
}

uint64_t sub_25BE7F880()
{
  return MEMORY[0x270F44BF0]();
}

uint64_t sub_25BE7F890()
{
  return MEMORY[0x270F44BF8]();
}

uint64_t sub_25BE7F8A0()
{
  return MEMORY[0x270F44C08]();
}

uint64_t sub_25BE7F8B0()
{
  return MEMORY[0x270F44C18]();
}

uint64_t sub_25BE7F8C0()
{
  return MEMORY[0x270F44C20]();
}

uint64_t sub_25BE7F8D0()
{
  return MEMORY[0x270F44C38]();
}

uint64_t sub_25BE7F8E0()
{
  return MEMORY[0x270F44C80]();
}

uint64_t sub_25BE7F8F0()
{
  return MEMORY[0x270F44C98]();
}

uint64_t sub_25BE7F900()
{
  return MEMORY[0x270F44CA8]();
}

uint64_t sub_25BE7F920()
{
  return MEMORY[0x270F44CD8]();
}

uint64_t sub_25BE7F930()
{
  return MEMORY[0x270F44D00]();
}

uint64_t sub_25BE7F940()
{
  return MEMORY[0x270F44D08]();
}

uint64_t sub_25BE7F950()
{
  return MEMORY[0x270F44D48]();
}

uint64_t sub_25BE7F960()
{
  return MEMORY[0x270F44D50]();
}

uint64_t sub_25BE7F970()
{
  return MEMORY[0x270F44D60]();
}

uint64_t sub_25BE7F980()
{
  return MEMORY[0x270F44D68]();
}

uint64_t sub_25BE7F990()
{
  return MEMORY[0x270F44D88]();
}

uint64_t sub_25BE7F9A0()
{
  return MEMORY[0x270F44D90]();
}

uint64_t sub_25BE7F9B0()
{
  return MEMORY[0x270F44D98]();
}

uint64_t sub_25BE7F9C0()
{
  return MEMORY[0x270F44DA0]();
}

uint64_t sub_25BE7F9D0()
{
  return MEMORY[0x270F44DB0]();
}

uint64_t sub_25BE7F9E0()
{
  return MEMORY[0x270F44DC8]();
}

uint64_t sub_25BE7F9F0()
{
  return MEMORY[0x270F44DD8]();
}

uint64_t sub_25BE7FA00()
{
  return MEMORY[0x270F44DE0]();
}

uint64_t sub_25BE7FA10()
{
  return MEMORY[0x270F44DE8]();
}

uint64_t sub_25BE7FA20()
{
  return MEMORY[0x270F44DF0]();
}

uint64_t sub_25BE7FA30()
{
  return MEMORY[0x270F44E00]();
}

uint64_t sub_25BE7FA40()
{
  return MEMORY[0x270F44E10]();
}

uint64_t sub_25BE7FA50()
{
  return MEMORY[0x270F44E18]();
}

uint64_t sub_25BE7FA60()
{
  return MEMORY[0x270F44E28]();
}

uint64_t sub_25BE7FA70()
{
  return MEMORY[0x270FA2C68]();
}

uint64_t sub_25BE7FA80()
{
  return MEMORY[0x270FA2C90]();
}

uint64_t sub_25BE7FA90()
{
  return MEMORY[0x270FA2C98]();
}

uint64_t sub_25BE7FAA0()
{
  return MEMORY[0x270FA2CB8]();
}

uint64_t sub_25BE7FAB0()
{
  return MEMORY[0x270FA2D00]();
}

uint64_t sub_25BE7FAC0()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_25BE7FAD0()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_25BE7FAE0()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_25BE7FAF0()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_25BE7FB00()
{
  return MEMORY[0x270EF1830]();
}

uint64_t sub_25BE7FB10()
{
  return MEMORY[0x270EF1840]();
}

uint64_t sub_25BE7FB20()
{
  return MEMORY[0x270F9D060]();
}

uint64_t sub_25BE7FB30()
{
  return MEMORY[0x270F9D088]();
}

uint64_t sub_25BE7FB40()
{
  return MEMORY[0x270F9D0A8]();
}

uint64_t sub_25BE7FB50()
{
  return MEMORY[0x270F9D220]();
}

uint64_t sub_25BE7FB60()
{
  return MEMORY[0x270F9D318]();
}

uint64_t sub_25BE7FB70()
{
  return MEMORY[0x270F9D320]();
}

uint64_t sub_25BE7FB80()
{
  return MEMORY[0x270F9D478]();
}

uint64_t sub_25BE7FB90()
{
  return MEMORY[0x270F9D480]();
}

uint64_t sub_25BE7FBA0()
{
  return MEMORY[0x270F9D488]();
}

uint64_t sub_25BE7FBB0()
{
  return MEMORY[0x270F9D490]();
}

uint64_t sub_25BE7FBC0()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_25BE7FBD0()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_25BE7FBE0()
{
  return MEMORY[0x270EF19C8]();
}

uint64_t sub_25BE7FBF0()
{
  return MEMORY[0x270EF19E0]();
}

uint64_t sub_25BE7FC00()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_25BE7FC10()
{
  return MEMORY[0x270EF19F8]();
}

uint64_t sub_25BE7FC20()
{
  return MEMORY[0x270EF1AA8]();
}

uint64_t sub_25BE7FC30()
{
  return MEMORY[0x270EF1AD0]();
}

uint64_t sub_25BE7FC40()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_25BE7FC50()
{
  return MEMORY[0x270F9D5F8]();
}

uint64_t sub_25BE7FC60()
{
  return MEMORY[0x270F9D610]();
}

uint64_t sub_25BE7FC70()
{
  return MEMORY[0x270F9D620]();
}

uint64_t sub_25BE7FC80()
{
  return MEMORY[0x270F54CE0]();
}

uint64_t sub_25BE7FC90()
{
  return MEMORY[0x270F9D648]();
}

uint64_t sub_25BE7FCA0()
{
  return MEMORY[0x270F9D6B0]();
}

uint64_t sub_25BE7FCB0()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_25BE7FCC0()
{
  return MEMORY[0x270F9D748]();
}

uint64_t sub_25BE7FCD0()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_25BE7FCE0()
{
  return MEMORY[0x270F9D7A0]();
}

uint64_t sub_25BE7FCF0()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_25BE7FD00()
{
  return MEMORY[0x270F9D8B0]();
}

uint64_t sub_25BE7FD10()
{
  return MEMORY[0x270F9D8F0]();
}

uint64_t sub_25BE7FD20()
{
  return MEMORY[0x270F9D9D0]();
}

uint64_t sub_25BE7FD30()
{
  return MEMORY[0x270F9DA70]();
}

uint64_t sub_25BE7FD40()
{
  return MEMORY[0x270F9DA80]();
}

uint64_t sub_25BE7FD50()
{
  return MEMORY[0x270F9DB00]();
}

uint64_t sub_25BE7FD60()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_25BE7FD70()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_25BE7FD80()
{
  return MEMORY[0x270F9DBB0]();
}

uint64_t sub_25BE7FD90()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_25BE7FDA0()
{
  return MEMORY[0x270F9DC20]();
}

uint64_t sub_25BE7FDB0()
{
  return MEMORY[0x270F9DCE0]();
}

uint64_t sub_25BE7FDC0()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_25BE7FDD0()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_25BE7FDE0()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_25BE7FDF0()
{
  return MEMORY[0x270FA1FE8]();
}

uint64_t sub_25BE7FE00()
{
  return MEMORY[0x270EF1C18]();
}

uint64_t sub_25BE7FE10()
{
  return MEMORY[0x270F9DD60]();
}

uint64_t sub_25BE7FE20()
{
  return MEMORY[0x270F9DDF8]();
}

uint64_t sub_25BE7FE30()
{
  return MEMORY[0x270F9DEF0]();
}

uint64_t sub_25BE7FE40()
{
  return MEMORY[0x270EF1CE0]();
}

uint64_t sub_25BE7FE50()
{
  return MEMORY[0x270FA2B90]();
}

uint64_t sub_25BE7FE60()
{
  return MEMORY[0x270F53370]();
}

uint64_t sub_25BE7FE70()
{
  return MEMORY[0x270FA2E40]();
}

uint64_t sub_25BE7FE80()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_25BE7FE90()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_25BE7FEA0()
{
  return MEMORY[0x270FA2E70]();
}

uint64_t sub_25BE7FEB0()
{
  return MEMORY[0x270FA0C10]();
}

uint64_t sub_25BE7FEC0()
{
  return MEMORY[0x270FA2E90]();
}

uint64_t sub_25BE7FED0()
{
  return MEMORY[0x270FA2EA8]();
}

uint64_t sub_25BE7FEE0()
{
  return MEMORY[0x270FA2ED0]();
}

uint64_t sub_25BE7FEF0()
{
  return MEMORY[0x270FA2F00]();
}

uint64_t sub_25BE7FF00()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_25BE7FF10()
{
  return MEMORY[0x270F9E4A0]();
}

uint64_t sub_25BE7FF20()
{
  return MEMORY[0x270F9E4A8]();
}

uint64_t sub_25BE7FF30()
{
  return MEMORY[0x270F9E4F8]();
}

uint64_t sub_25BE7FF50()
{
  return MEMORY[0x270EF23C8]();
}

uint64_t sub_25BE7FF60()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_25BE7FF70()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_25BE7FF80()
{
  return MEMORY[0x270EF23E8]();
}

uint64_t sub_25BE7FF90()
{
  return MEMORY[0x270EF24A0]();
}

uint64_t sub_25BE7FFA0()
{
  return MEMORY[0x270F9E5B8]();
}

uint64_t sub_25BE7FFB0()
{
  return MEMORY[0x270F9E640]();
}

uint64_t sub_25BE7FFC0()
{
  return MEMORY[0x270F9E648]();
}

uint64_t sub_25BE7FFD0()
{
  return MEMORY[0x270F9E650]();
}

uint64_t sub_25BE7FFE0()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_25BE7FFF0()
{
  return MEMORY[0x270F9E8C0]();
}

uint64_t sub_25BE80000()
{
  return MEMORY[0x270F9E8C8]();
}

uint64_t sub_25BE80010()
{
  return MEMORY[0x270F9E8E8]();
}

uint64_t sub_25BE80020()
{
  return MEMORY[0x270F9E958]();
}

uint64_t sub_25BE80030()
{
  return MEMORY[0x270F9E960]();
}

uint64_t sub_25BE80040()
{
  return MEMORY[0x270F9E970]();
}

uint64_t sub_25BE80050()
{
  return MEMORY[0x270F9E988]();
}

uint64_t sub_25BE80060()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_25BE80070()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_25BE80080()
{
  return MEMORY[0x270F9E9E8]();
}

uint64_t sub_25BE80090()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_25BE800A0()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t sub_25BE800B0()
{
  return MEMORY[0x270F9EDF8]();
}

uint64_t sub_25BE800C0()
{
  return MEMORY[0x270F9EE20]();
}

uint64_t sub_25BE800D0()
{
  return MEMORY[0x270F9EE78]();
}

uint64_t sub_25BE800E0()
{
  return MEMORY[0x270F9EF08]();
}

uint64_t sub_25BE800F0()
{
  return MEMORY[0x270F9EF18]();
}

uint64_t sub_25BE80100()
{
  return MEMORY[0x270F9EF20]();
}

uint64_t sub_25BE80110()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_25BE80120()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_25BE80130()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_25BE80140()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_25BE80150()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_25BE80160()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_25BE80170()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_25BE80190()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_25BE801A0()
{
  return MEMORY[0x270F9F270]();
}

uint64_t sub_25BE801B0()
{
  return MEMORY[0x270F9F278]();
}

uint64_t sub_25BE801C0()
{
  return MEMORY[0x270F9F280]();
}

uint64_t sub_25BE801D0()
{
  return MEMORY[0x270F9F290]();
}

uint64_t sub_25BE801E0()
{
  return MEMORY[0x270F9F2A0]();
}

uint64_t sub_25BE801F0()
{
  return MEMORY[0x270F9F2E8]();
}

uint64_t sub_25BE80200()
{
  return MEMORY[0x270F9F308]();
}

uint64_t sub_25BE80210()
{
  return MEMORY[0x270F9F310]();
}

uint64_t sub_25BE80220()
{
  return MEMORY[0x270F9F318]();
}

uint64_t sub_25BE80230()
{
  return MEMORY[0x270F9F3B0]();
}

uint64_t sub_25BE80240()
{
  return MEMORY[0x270F9F3C0]();
}

uint64_t sub_25BE80250()
{
  return MEMORY[0x270F9F3D0]();
}

uint64_t sub_25BE80260()
{
  return MEMORY[0x270F9F3E0]();
}

uint64_t sub_25BE80270()
{
  return MEMORY[0x270F9F428]();
}

uint64_t sub_25BE80290()
{
  return MEMORY[0x270F9F450]();
}

uint64_t sub_25BE802A0()
{
  return MEMORY[0x270F9F458]();
}

uint64_t sub_25BE802B0()
{
  return MEMORY[0x270F9F4B0]();
}

uint64_t sub_25BE802C0()
{
  return MEMORY[0x270F9F4C8]();
}

uint64_t sub_25BE802D0()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_25BE802E0()
{
  return MEMORY[0x270F9F688]();
}

uint64_t sub_25BE802F0()
{
  return MEMORY[0x270F9F690]();
}

uint64_t sub_25BE80300()
{
  return MEMORY[0x270F9F698]();
}

uint64_t sub_25BE80310()
{
  return MEMORY[0x270F9F6A0]();
}

uint64_t sub_25BE80320()
{
  return MEMORY[0x270F9F6A8]();
}

uint64_t sub_25BE80330()
{
  return MEMORY[0x270F9F6B0]();
}

uint64_t sub_25BE80340()
{
  return MEMORY[0x270F9F6B8]();
}

uint64_t sub_25BE80350()
{
  return MEMORY[0x270F9F6C0]();
}

uint64_t sub_25BE80360()
{
  return MEMORY[0x270F9F6C8]();
}

uint64_t sub_25BE80370()
{
  return MEMORY[0x270F9F6D0]();
}

uint64_t sub_25BE80380()
{
  return MEMORY[0x270F9F6D8]();
}

uint64_t sub_25BE80390()
{
  return MEMORY[0x270F9F6E0]();
}

uint64_t sub_25BE803A0()
{
  return MEMORY[0x270F9F6E8]();
}

uint64_t sub_25BE803B0()
{
  return MEMORY[0x270F9F6F0]();
}

uint64_t sub_25BE803C0()
{
  return MEMORY[0x270F9F6F8]();
}

uint64_t sub_25BE803D0()
{
  return MEMORY[0x270F9F700]();
}

uint64_t sub_25BE803E0()
{
  return MEMORY[0x270F9F708]();
}

uint64_t sub_25BE803F0()
{
  return MEMORY[0x270F9F710]();
}

uint64_t sub_25BE80400()
{
  return MEMORY[0x270F9F718]();
}

uint64_t sub_25BE80410()
{
  return MEMORY[0x270F9F720]();
}

uint64_t sub_25BE80420()
{
  return MEMORY[0x270F9F7B0]();
}

uint64_t sub_25BE80430()
{
  return MEMORY[0x270F9F7C8]();
}

uint64_t sub_25BE80440()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_25BE80450()
{
  return MEMORY[0x270F9F818]();
}

uint64_t sub_25BE80460()
{
  return MEMORY[0x270F9F8F8]();
}

uint64_t sub_25BE80470()
{
  return MEMORY[0x270F9F900]();
}

uint64_t sub_25BE80480()
{
  return MEMORY[0x270F9F9B0]();
}

uint64_t sub_25BE80490()
{
  return MEMORY[0x270F9F9B8]();
}

uint64_t sub_25BE804A0()
{
  return MEMORY[0x270F9F9C0]();
}

uint64_t sub_25BE804B0()
{
  return MEMORY[0x270F9F9C8]();
}

uint64_t sub_25BE804C0()
{
  return MEMORY[0x270F9F9D0]();
}

uint64_t sub_25BE804D0()
{
  return MEMORY[0x270F9F9D8]();
}

uint64_t sub_25BE804E0()
{
  return MEMORY[0x270F9F9E0]();
}

uint64_t sub_25BE804F0()
{
  return MEMORY[0x270F9F9E8]();
}

uint64_t sub_25BE80500()
{
  return MEMORY[0x270F9F9F0]();
}

uint64_t sub_25BE80510()
{
  return MEMORY[0x270F9F9F8]();
}

uint64_t sub_25BE80520()
{
  return MEMORY[0x270F9FA00]();
}

uint64_t sub_25BE80530()
{
  return MEMORY[0x270F9FA08]();
}

uint64_t sub_25BE80540()
{
  return MEMORY[0x270F9FA10]();
}

uint64_t sub_25BE80560()
{
  return MEMORY[0x270F9FA80]();
}

uint64_t sub_25BE80570()
{
  return MEMORY[0x270F9FB10]();
}

uint64_t sub_25BE80580()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_25BE80590()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_25BE805A0()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_25BE805B0()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_25BE805C0()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_25BE805D0()
{
  return MEMORY[0x270F9FC30]();
}

uint64_t sub_25BE805E0()
{
  return MEMORY[0x270F9FC40]();
}

uint64_t sub_25BE805F0()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_25BE80600()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_25BE80610()
{
  return MEMORY[0x270F9FC68]();
}

uint64_t sub_25BE80620()
{
  return MEMORY[0x270F9FC78]();
}

uint64_t sub_25BE80630()
{
  return MEMORY[0x270F9FC80]();
}

uint64_t sub_25BE80640()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_25BE80650()
{
  return MEMORY[0x270F9FD60]();
}

uint64_t sub_25BE80660()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_25BE80670()
{
  return MEMORY[0x270F9FD98]();
}

uint64_t sub_25BE80680()
{
  return MEMORY[0x270FA0090]();
}

uint64_t sub_25BE806B0()
{
  return MEMORY[0x270FA0128]();
}

uint64_t AnalyticsSendEvent()
{
  return MEMORY[0x270F18A38]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x270F18A48]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x270F95F98]();
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

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x270FA0158]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x270FA0160]();
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

void free(void *a1)
{
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

uint64_t nw_activity_complete_with_reason()
{
  return MEMORY[0x270EF79A8]();
}

uint64_t nw_activity_is_activated()
{
  return MEMORY[0x270EF7A10]();
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

uint64_t os_transaction_create()
{
  return MEMORY[0x270EDAA90]();
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

sqlite3_int64 sqlite3_soft_heap_limit64(sqlite3_int64 N)
{
  return MEMORY[0x270F9B7F0](N);
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

uint64_t swift_conformsToProtocol2()
{
  return MEMORY[0x270FA0218]();
}

uint64_t swift_continuation_init()
{
  return MEMORY[0x270FA23F8]();
}

uint64_t swift_continuation_throwingResume()
{
  return MEMORY[0x270FA2408]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x270FA0240]();
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

uint64_t swift_getDynamicType()
{
  return MEMORY[0x270FA0330]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x270FA0338]();
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

uint64_t swift_setAtWritableKeyPath()
{
  return MEMORY[0x270FA0548]();
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

uint64_t swift_unknownObjectWeakAssign()
{
  return MEMORY[0x270FA05D0]();
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

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x270FA0628]();
}

uint64_t swift_weakAssign()
{
  return MEMORY[0x270FA0630]();
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