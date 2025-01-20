uint64_t sub_25ACDBC9C()
{
  sub_25AD14B70();
  sub_25AD14570();
  swift_bridgeObjectRelease();
  return sub_25AD14B90();
}

uint64_t sub_25ACDBD3C()
{
  sub_25AD14570();
  return swift_bridgeObjectRelease();
}

uint64_t sub_25ACDBDC0()
{
  return sub_25AD14B90();
}

uint64_t sub_25ACDBE5C@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_25ACDC630();
  *a1 = result;
  return result;
}

void sub_25ACDBE8C(uint64_t *a1@<X8>)
{
  uint64_t v2 = 0x702D6F626D697761;
  unint64_t v3 = 0xE700000000000000;
  if (*v1 == 1) {
    unint64_t v3 = 0xEA0000000000636DLL;
  }
  else {
    uint64_t v2 = 0x65636172746170;
  }
  if (*v1) {
    uint64_t v4 = v2;
  }
  else {
    uint64_t v4 = 0x702D6F626D697761;
  }
  if (*v1) {
    unint64_t v5 = v3;
  }
  else {
    unint64_t v5 = 0xEA0000000000696DLL;
  }
  *a1 = v4;
  a1[1] = v5;
}

uint64_t sub_25ACDBEF0(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_25ACFC024(*a1, *a2);
}

unint64_t sub_25ACDBEFC(unint64_t a1)
{
  if (a1 >> 62)
  {
    if (a1 >> 62 != 1) {
      return 0xD000000000000011;
    }
    sub_25AD14860();
    sub_25AD145A0();
    swift_bridgeObjectRelease();
    sub_25AD145A0();
  }
  else
  {
    sub_25AD14860();
    sub_25AD145A0();
    swift_bridgeObjectRelease();
  }
  sub_25AD145A0();
  return 0;
}

uint64_t sub_25ACDC0C0(uint64_t a1, uint64_t a2)
{
  return sub_25ACDC67C(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(void *)a2, *(void *)(a2 + 8), *(void *)(a2 + 16));
}

unint64_t sub_25ACDC0DC()
{
  return sub_25ACDBEFC(*v0);
}

unint64_t sub_25ACDC0E8(uint64_t a1, unint64_t a2)
{
  if (a1 == 2) {
    return 0xD00000000000005ELL;
  }
  sub_25AD14860();
  if (a1)
  {
    if (a1 == 1)
    {
      uint64_t v5 = 0x65636172544150;
      swift_bridgeObjectRelease();
    }
    else
    {
      MEMORY[0x2611549E0](a1, MEMORY[0x263F8D310]);
      sub_25AD145A0();
      swift_bridgeObjectRelease();
      sub_25AD145A0();
      swift_bridgeObjectRelease();
      uint64_t v5 = 0x28206D6F74737563;
    }
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v5 = 0x746963696C706D69;
  }
  sub_25AD145A0();
  if (a2 > 1)
  {
    MEMORY[0x2611549E0](a2, MEMORY[0x263F8D310]);
    sub_25AD145A0();
    swift_bridgeObjectRelease();
    sub_25AD145A0();
  }
  sub_25AD145A0();
  swift_bridgeObjectRelease();
  return v5;
}

unint64_t sub_25ACDC2D8()
{
  return sub_25ACDC0E8(*(void *)v0, *(void *)(v0 + 8));
}

uint64_t sub_25ACDC2FC(uint64_t a1, uint64_t a2)
{
  if (*(unsigned char *)(a1 + 25)) {
    __int16 v2 = 256;
  }
  else {
    __int16 v2 = 0;
  }
  if (*(unsigned char *)(a2 + 25)) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  return sub_25ACDC910(*(void **)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), v2 | *(unsigned __int8 *)(a1 + 24), *(void **)a2, *(void *)(a2 + 8), *(void *)(a2 + 16), v3 | *(unsigned __int8 *)(a2 + 24));
}

unint64_t sub_25ACDC34C()
{
  sub_25ACDE290(v0, (uint64_t)v6);
  unint64_t result = 0xD00000000000004ELL;
  switch(v7)
  {
    case 2:
      unint64_t v4 = v6[0];
      sub_25AD14860();
      swift_bridgeObjectRelease();
      v5[0] = 0xD000000000000014;
      v5[1] = 0x800000025AD18600;
      sub_25ACDBEFC(v4);
      sub_25AD145A0();
      swift_bridgeObjectRelease();
      sub_25AD145A0();
      sub_25AD145A0();
      swift_bridgeObjectRelease();
      return v5[0];
    case 3:
      sub_25AD14860();
      swift_bridgeObjectRelease();
      strcpy((char *)v5, "cannot parse ");
      HIWORD(v5[1]) = -4864;
      sub_25AD145A0();
      sub_25AD145A0();
      goto LABEL_5;
    case 4:
      return result;
    default:
      uint64_t v3 = v6[0];
      uint64_t v2 = v6[1];
      sub_25AD14860();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      v5[0] = v3;
      v5[1] = v2;
LABEL_5:
      sub_25AD145A0();
      return v5[0];
  }
}

unint64_t sub_25ACDC5F8()
{
  sub_25ACDE290(v0, (uint64_t)v2);
  return sub_25ACDC34C();
}

uint64_t sub_25ACDC630()
{
  unint64_t v0 = sub_25AD14990();
  swift_bridgeObjectRelease();
  if (v0 >= 3) {
    return 3;
  }
  else {
    return v0;
  }
}

uint64_t sub_25ACDC67C(unint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5, uint64_t a6)
{
  if (!(a1 >> 62))
  {
    if (a4 >> 62) {
      return 0;
    }
    uint64_t v16 = 0x702D6F626D697761;
    unint64_t v17 = 0xEA0000000000696DLL;
    int v18 = a1;
    if ((_BYTE)a1)
    {
      if (a1 == 1) {
        uint64_t v19 = 0x702D6F626D697761;
      }
      else {
        uint64_t v19 = 0x65636172746170;
      }
      if (v18 == 1) {
        unint64_t v20 = 0xEA0000000000636DLL;
      }
      else {
        unint64_t v20 = 0xE700000000000000;
      }
      int v21 = a4;
      if (!(_BYTE)a4) {
        goto LABEL_30;
      }
    }
    else
    {
      uint64_t v19 = 0x702D6F626D697761;
      unint64_t v20 = 0xEA0000000000696DLL;
      int v21 = a4;
      if (!(_BYTE)a4) {
        goto LABEL_30;
      }
    }
    if (v21 == 1)
    {
      unint64_t v17 = 0xEA0000000000636DLL;
    }
    else
    {
      uint64_t v16 = 0x65636172746170;
      unint64_t v17 = 0xE700000000000000;
    }
LABEL_30:
    if (v19 == v16 && v20 == v17)
    {
      swift_bridgeObjectRelease_n();
      return 1;
    }
    else
    {
      char v24 = sub_25AD14AF0();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v24 & 1;
    }
  }
  if (a1 >> 62 != 1) {
    return a4 >> 62 == 2 && a4 == 0x8000000000000000 && !(a6 | a5);
  }
  if (a4 >> 62 != 1) {
    return 0;
  }
  uint64_t v10 = 0x702D6F626D697761;
  unint64_t v11 = 0xEA0000000000696DLL;
  int v12 = a1;
  if ((_BYTE)a1)
  {
    if (a1 == 1) {
      uint64_t v13 = 0x702D6F626D697761;
    }
    else {
      uint64_t v13 = 0x65636172746170;
    }
    if (v12 == 1) {
      unint64_t v14 = 0xEA0000000000636DLL;
    }
    else {
      unint64_t v14 = 0xE700000000000000;
    }
    int v15 = a4;
    if (!(_BYTE)a4) {
      goto LABEL_15;
    }
    goto LABEL_12;
  }
  uint64_t v13 = 0x702D6F626D697761;
  unint64_t v14 = 0xEA0000000000696DLL;
  int v15 = a4;
  if ((_BYTE)a4)
  {
LABEL_12:
    if (v15 == 1)
    {
      unint64_t v11 = 0xEA0000000000636DLL;
    }
    else
    {
      uint64_t v10 = 0x65636172746170;
      unint64_t v11 = 0xE700000000000000;
    }
  }
LABEL_15:
  if (v13 == v10 && v14 == v11)
  {
    swift_bridgeObjectRelease_n();
  }
  else
  {
    char v23 = sub_25AD14AF0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t result = 0;
    if ((v23 & 1) == 0) {
      return result;
    }
  }
  if (a2 == a5 && a3 == a6) {
    return 1;
  }
  return sub_25AD14AF0();
}

uint64_t sub_25ACDC910(void *a1, uint64_t a2, uint64_t a3, __int16 a4, void *a5, uint64_t a6, uint64_t a7, __int16 a8)
{
  if (a1)
  {
    if (a1 == (void *)1)
    {
      if (a5 != (void *)1) {
        return 0;
      }
    }
    else if ((unint64_t)a5 < 2 || (sub_25ACE6F44(a1, a5) & 1) == 0)
    {
      return 0;
    }
  }
  else if (a5)
  {
    return 0;
  }
  if (a4)
  {
    if (a8) {
      return ((a4 & 0x100) == 0) ^ ((unsigned __int16)(a8 & 0x100) >> 8);
    }
    return 0;
  }
  if ((a8 & 1) != 0 || (sub_25AD14BE0() & 1) == 0) {
    return 0;
  }
  return ((a4 & 0x100) == 0) ^ ((unsigned __int16)(a8 & 0x100) >> 8);
}

uint64_t sub_25ACDC9C4(uint64_t a1)
{
  uint64_t v76 = 0;
  unint64_t v84 = 0;
  unint64_t v85 = 0;
  uint64_t v2 = 0;
  uint64_t v3 = 0;
  int64_t v4 = 0;
  int v78 = 0;
  uint64_t v79 = 0;
  uint64_t v82 = 0;
  uint64_t v5 = *(void *)(a1 + 64);
  uint64_t v86 = a1 + 64;
  uint64_t v6 = 1;
  uint64_t v7 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v8 = -1;
  if (v7 < 64) {
    uint64_t v8 = ~(-1 << v7);
  }
  unint64_t v9 = v8 & v5;
  int64_t v87 = (unint64_t)(v7 + 63) >> 6;
  uint64_t v88 = a1;
  unint64_t v10 = 0x8000000000000000;
  v77 = "ms";
  unint64_t v80 = 0x800000025AD184D0;
  v73 = "awimbo-pmc-sched";
  unint64_t v74 = 0x800000025AD18510;
  unint64_t v75 = (unint64_t)"awimbo-pmc-config";
LABEL_4:
  uint64_t v81 = v6;
LABEL_5:
  for (uint64_t i = v3; ; uint64_t i = 0)
  {
    if (v9)
    {
      unint64_t v13 = __clz(__rbit64(v9));
      v9 &= v9 - 1;
      unint64_t v14 = v13 | (v4 << 6);
      goto LABEL_22;
    }
    if (__OFADD__(v4++, 1))
    {
      __break(1u);
      goto LABEL_120;
    }
    if (v4 >= v87) {
      goto LABEL_103;
    }
    unint64_t v16 = *(void *)(v86 + 8 * v4);
    if (!v16) {
      break;
    }
LABEL_21:
    unint64_t v9 = (v16 - 1) & v16;
    unint64_t v14 = __clz(__rbit64(v16)) + (v4 << 6);
LABEL_22:
    uint64_t v18 = 16 * v14;
    uint64_t v19 = (uint64_t *)(*(void *)(v88 + 48) + v18);
    uint64_t v20 = v19[1];
    int v21 = (uint64_t *)(*(void *)(v88 + 56) + v18);
    uint64_t v1 = *v21;
    unint64_t v22 = v21[1];
    BOOL v23 = *v19 == 1701080941 && v20 == 0xE400000000000000;
    if (!v23)
    {
      uint64_t v90 = *v19;
      if ((sub_25AD14AF0() & 1) == 0)
      {
        BOOL v31 = v90 == 0x702D6F626D697761 && v20 == 0xEF656C69662D696DLL;
        uint64_t v70 = v2;
        uint64_t v72 = v20;
        if (v31 || (uint64_t v32 = v90, v33 = sub_25AD14AF0(), (v33 & 1) != 0))
        {
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRelease();
          if ((v10 & 0x8000000000000000) == 0)
          {
            if ((_BYTE)v10)
            {
              uint64_t v69 = i;
              char v54 = sub_25AD14AF0();
              swift_bridgeObjectRelease();
              uint64_t i = v69;
              if ((v54 & 1) == 0) {
                goto LABEL_123;
              }
            }
            else
            {
              swift_bridgeObjectRelease();
            }
            sub_25ACDD924(v10);
          }
          unint64_t v10 = 0x4000000000000000;
          uint64_t v76 = v1;
          unint64_t v84 = v22;
          uint64_t v6 = v81;
          uint64_t v3 = v72;
          uint64_t v2 = v90;
        }
        else
        {
          uint64_t v3 = v72;
          if (v32 == 0xD000000000000011 && v72 == v80 || (uint64_t v33 = sub_25AD14AF0(), v34 = v90, (v33 & 1) != 0))
          {
            unint64_t v71 = v10;
            v89[0] = 58;
            v89[1] = 0xE100000000000000;
            MEMORY[0x270FA5388](v33);
            v68[2] = v89;
            swift_bridgeObjectRetain_n();
            swift_bridgeObjectRetain();
            uint64_t v35 = v83;
            uint64_t v36 = sub_25ACFEDAC(0x7FFFFFFFFFFFFFFFLL, 1, sub_25ACDD9B8, (uint64_t)v68, v1, v22);
            uint64_t v83 = v35;
            swift_bridgeObjectRelease();
            int64_t v37 = *(void *)(v36 + 16);
            if (v37)
            {
              uint64_t v69 = i;
              v89[0] = MEMORY[0x263F8EE78];
              sub_25AD0FAB0(0, v37, 0);
              unint64_t v38 = v89[0];
              v68[4] = v36;
              v39 = (uint64_t *)(v36 + 56);
              do
              {
                uint64_t v41 = *(v39 - 3);
                uint64_t v40 = *(v39 - 2);
                uint64_t v42 = *(v39 - 1);
                uint64_t v43 = *v39;
                swift_bridgeObjectRetain();
                uint64_t v1 = MEMORY[0x2611548A0](v41, v40, v42, v43);
                uint64_t v45 = v44;
                swift_bridgeObjectRelease();
                v89[0] = v38;
                unint64_t v47 = *(void *)(v38 + 16);
                unint64_t v46 = *(void *)(v38 + 24);
                if (v47 >= v46 >> 1)
                {
                  sub_25AD0FAB0(v46 > 1, v47 + 1, 1);
                  unint64_t v38 = v89[0];
                }
                *(void *)(v38 + 16) = v47 + 1;
                unint64_t v48 = v38 + 16 * v47;
                *(void *)(v48 + 32) = v1;
                *(void *)(v48 + 40) = v45;
                v39 += 4;
                --v37;
              }
              while (v37);
              swift_bridgeObjectRelease();
              unint64_t v10 = v71;
              uint64_t v3 = v72;
              uint64_t i = v69;
            }
            else
            {
              swift_bridgeObjectRelease();
              unint64_t v38 = MEMORY[0x263F8EE78];
              unint64_t v10 = v71;
            }
            if ((v10 & 0x8000000000000000) != 0) {
              goto LABEL_68;
            }
            if ((_BYTE)v10)
            {
              uint64_t v2 = v70;
              if (v10 == 1)
              {
                swift_bridgeObjectRelease();
                goto LABEL_67;
              }
            }
            else
            {
              uint64_t v2 = v70;
            }
            uint64_t v1 = sub_25AD14AF0();
            swift_bridgeObjectRelease();
            unint64_t v10 = v71;
            if (v1)
            {
LABEL_67:
              sub_25ACDD924(v10);
LABEL_68:
              unint64_t v10 = 0x4000000000000001;
              sub_25ACDD990(v85);
              unint64_t v85 = v38;
              uint64_t v2 = v90;
              goto LABEL_5;
            }
LABEL_120:
            sub_25ACDD93C();
            swift_allocError();
            *(void *)uint64_t v63 = v10;
            *(void *)(v63 + 8) = v2;
            *(void *)(v63 + 16) = i;
            *(void *)(v63 + 24) = 1;
            *(unsigned char *)(v63 + 32) = 2;
            sub_25ACDD9A0(v10);
            swift_willThrow();
            swift_release();
            swift_bridgeObjectRelease();
            sub_25ACDD924(v10);
            swift_bridgeObjectRelease();
LABEL_121:
            swift_bridgeObjectRelease();
LABEL_112:
            unint64_t v59 = v85;
LABEL_113:
            sub_25ACDD990(v59);
            return v1;
          }
          if ((v90 != 0xD000000000000010 || v72 != (v75 | 0x8000000000000000)) && (sub_25AD14AF0() & 1) == 0)
          {
            BOOL v23 = v34 == 0xD000000000000013;
            uint64_t v49 = v72;
            if (v23 && v72 == v74 || (sub_25AD14AF0() & 1) != 0)
            {
              swift_bridgeObjectRetain_n();
              swift_bridgeObjectRetain();
              unint64_t v50 = sub_25ACE1DC0(v1, v22);
              if ((v51 & 1) == 0)
              {
                unint64_t v52 = v50;
                swift_bridgeObjectRelease();
                if ((v10 & 0x8000000000000000) == 0)
                {
                  if ((_BYTE)v10)
                  {
                    if (v10 == 1)
                    {
                      swift_bridgeObjectRelease();
                      goto LABEL_84;
                    }
                    uint64_t v1 = v10;
                  }
                  else
                  {
                    uint64_t v1 = v10;
                  }
                  char v53 = sub_25AD14AF0();
                  swift_bridgeObjectRelease();
                  unint64_t v10 = v1;
                  if ((v53 & 1) == 0)
                  {
                    sub_25ACDD93C();
                    swift_allocError();
                    *(void *)uint64_t v66 = v1;
                    *(void *)(v66 + 8) = v2;
                    *(void *)(v66 + 16) = i;
                    *(void *)(v66 + 24) = 1;
                    *(unsigned char *)(v66 + 32) = 2;
                    sub_25ACDD9A0(v1);
                    swift_willThrow();
                    swift_release();
                    swift_bridgeObjectRelease();
                    sub_25ACDD924(v1);
                    goto LABEL_121;
                  }
LABEL_84:
                  sub_25ACDD924(v10);
                }
                uint64_t v6 = 0;
                unint64_t v10 = 0x4000000000000001;
                uint64_t v79 = 1000000000000 * v52;
                uint64_t v82 = (v52 * (unsigned __int128)0xE8D4A51000uLL) >> 64;
                uint64_t v3 = v72;
                uint64_t v2 = v90;
                goto LABEL_4;
              }
              swift_bridgeObjectRelease();
              sub_25ACDD924(v10);
              swift_bridgeObjectRelease();
              sub_25ACDD93C();
              swift_allocError();
              *(void *)uint64_t v56 = v1;
              *(void *)(v56 + 8) = v22;
              *(void *)(v56 + 16) = 0xD00000000000001ALL;
              *(void *)(v56 + 24) = 0x800000025AD18530;
              char v57 = 3;
LABEL_101:
              *(unsigned char *)(v56 + 32) = v57;
            }
            else
            {
              swift_bridgeObjectRetain();
              swift_bridgeObjectRetain();
              swift_bridgeObjectRelease();
              sub_25ACDD924(v10);
              swift_bridgeObjectRelease();
              sub_25ACDD93C();
              swift_allocError();
              *(void *)uint64_t v65 = v90;
              *(void *)(v65 + 8) = v49;
              *(void *)(v65 + 16) = 0;
              *(void *)(v65 + 24) = 0;
              *(unsigned char *)(v65 + 32) = 0;
            }
            swift_willThrow();
            swift_release();
            goto LABEL_112;
          }
          if ((v10 & 0x8000000000000000) != 0)
          {
            swift_bridgeObjectRetain();
          }
          else
          {
            uint64_t v69 = i;
            uint64_t v1 = v10;
            if (v10 == 1)
            {
              swift_bridgeObjectRetain();
              swift_bridgeObjectRelease();
              sub_25ACDD924(v10);
            }
            else
            {
              char v55 = sub_25AD14AF0();
              swift_bridgeObjectRetain();
              swift_bridgeObjectRelease();
              if ((v55 & 1) == 0)
              {
                sub_25ACDD93C();
                swift_allocError();
                *(void *)uint64_t v67 = v10;
                *(void *)(v67 + 8) = v2;
                *(void *)(v67 + 16) = v69;
                *(void *)(v67 + 24) = 1;
                *(unsigned char *)(v67 + 32) = 2;
                sub_25ACDD9A0(v10);
                swift_willThrow();
                swift_release();
                swift_bridgeObjectRelease();
                sub_25ACDD924(v10);
                goto LABEL_121;
              }
              sub_25ACDD924(v10);
            }
          }
          uint64_t v6 = v81;
          uint64_t v3 = v72;
          int v78 = 1;
          unint64_t v10 = 0x4000000000000001;
          uint64_t v2 = v90;
        }
        goto LABEL_4;
      }
    }
    swift_bridgeObjectRetain_n();
    unint64_t v24 = sub_25AD14990();
    swift_bridgeObjectRelease();
    if (v24 >= 3)
    {
      swift_bridgeObjectRelease();
      sub_25ACDD924(v10);
      sub_25ACDD93C();
      swift_allocError();
      *(void *)uint64_t v56 = v1;
      *(void *)(v56 + 8) = v22;
      *(void *)(v56 + 16) = 0;
      *(void *)(v56 + 24) = 0;
      char v57 = 1;
      goto LABEL_101;
    }
    swift_bridgeObjectRelease();
    if ((v10 & 0x8000000000000000) == 0)
    {
      unint64_t v25 = 0xEA0000000000696DLL;
      if ((_BYTE)v10)
      {
        if (v10 == 1)
        {
          uint64_t v26 = 0x702D6F626D697761;
          uint64_t v1 = 0xEA0000000000636DLL;
        }
        else
        {
          uint64_t v1 = 0xE700000000000000;
          uint64_t v26 = 0x65636172746170;
        }
      }
      else
      {
        uint64_t v26 = 0x702D6F626D697761;
        uint64_t v1 = 0xEA0000000000696DLL;
      }
      uint64_t v27 = v2;
      uint64_t v28 = i;
      if ((_BYTE)v24)
      {
        if (v24 == 1)
        {
          uint64_t v29 = 0x702D6F626D697761;
          unint64_t v25 = 0xEA0000000000636DLL;
        }
        else
        {
          unint64_t v25 = 0xE700000000000000;
          uint64_t v29 = 0x65636172746170;
        }
      }
      else
      {
        uint64_t v29 = 0x702D6F626D697761;
      }
      unint64_t v30 = v10;
      if (v26 == v29 && v1 == v25)
      {
        swift_bridgeObjectRelease_n();
      }
      else
      {
        char v12 = sub_25AD14AF0();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v12 & 1) == 0)
        {
          sub_25ACDD93C();
          swift_allocError();
          *(void *)uint64_t v58 = v30;
          *(void *)(v58 + 8) = v27;
          *(void *)(v58 + 16) = v28;
          *(void *)(v58 + 24) = v24;
          *(unsigned char *)(v58 + 32) = 2;
          sub_25ACDD9A0(v30);
          swift_willThrow();
          swift_release();
          swift_bridgeObjectRelease();
          sub_25ACDD924(v30);
          goto LABEL_112;
        }
      }
      sub_25ACDD924(v30);
    }
    uint64_t v2 = 0;
    unint64_t v10 = v24;
  }
  int64_t v17 = v4 + 1;
  if (v4 + 1 >= v87) {
    goto LABEL_103;
  }
  unint64_t v16 = *(void *)(v86 + 8 * v17);
  if (v16) {
    goto LABEL_20;
  }
  int64_t v17 = v4 + 2;
  if (v4 + 2 >= v87) {
    goto LABEL_103;
  }
  unint64_t v16 = *(void *)(v86 + 8 * v17);
  if (v16)
  {
LABEL_20:
    int64_t v4 = v17;
    goto LABEL_21;
  }
  int64_t v17 = v4 + 3;
  if (v4 + 3 < v87)
  {
    unint64_t v16 = *(void *)(v86 + 8 * v17);
    if (!v16)
    {
      while (1)
      {
        int64_t v4 = v17 + 1;
        if (__OFADD__(v17, 1)) {
          break;
        }
        if (v4 >= v87) {
          goto LABEL_103;
        }
        unint64_t v16 = *(void *)(v86 + 8 * v4);
        ++v17;
        if (v16) {
          goto LABEL_21;
        }
      }
      __break(1u);
LABEL_123:
      sub_25ACDD93C();
      swift_allocError();
      uint64_t v1 = v70;
      *(void *)uint64_t v64 = v10;
      *(void *)(v64 + 8) = v1;
      *(void *)(v64 + 16) = i;
      *(void *)(v64 + 24) = 0;
      *(unsigned char *)(v64 + 32) = 2;
      sub_25ACDD9A0(v10);
      swift_willThrow();
      swift_release();
      sub_25ACDD924(v10);
      swift_bridgeObjectRelease();
      goto LABEL_121;
    }
    goto LABEL_20;
  }
LABEL_103:
  swift_release();
  uint64_t v1 = v85;
  if (v10 >> 62)
  {
    if (v10 >> 62 != 1)
    {
      swift_bridgeObjectRelease();
      sub_25ACDD93C();
      swift_allocError();
      *(_OWORD *)uint64_t v61 = 0u;
      *(_OWORD *)(v61 + 16) = 0u;
      *(unsigned char *)(v61 + 32) = 4;
      swift_willThrow();
      unint64_t v59 = v1;
      goto LABEL_113;
    }
    sub_25ACDD924(v10);
  }
  if ((_BYTE)v10)
  {
    if (v10 == 1)
    {
      swift_bridgeObjectRelease();
      if (!(v78 & 1 | ((v81 & 1) == 0)) && !v1)
      {
        sub_25ACDD9D8();
        swift_allocError();
        _OWORD *v62 = xmmword_25AD152F0;
        swift_willThrow();
      }
    }
    else
    {
      swift_bridgeObjectRelease();
      sub_25ACDD990(v1);
      return 1;
    }
  }
  else
  {
    sub_25ACDD990(v1);
    return v76;
  }
  return v1;
}

unint64_t sub_25ACDD924(unint64_t result)
{
  if (result >> 62 == 1) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

unint64_t sub_25ACDD93C()
{
  unint64_t result = qword_26A4B2FB8;
  if (!qword_26A4B2FB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4B2FB8);
  }
  return result;
}

unint64_t sub_25ACDD990(unint64_t result)
{
  if (result >= 2) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

unint64_t sub_25ACDD9A0(unint64_t result)
{
  if (result >> 62 == 1) {
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_25ACDD9B8(void *a1)
{
  return sub_25AD02164(a1, *(void **)(v1 + 16)) & 1;
}

unint64_t sub_25ACDD9D8()
{
  unint64_t result = qword_26A4B2FC0;
  if (!qword_26A4B2FC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4B2FC0);
  }
  return result;
}

unint64_t destroy for AwimboPMCOptions.UsageError(unint64_t *a1)
{
  unint64_t result = *a1;
  int v3 = -1;
  if (result < 0xFFFFFFFF) {
    int v3 = result;
  }
  if (v3 - 2 < 0)
  {
    if (result >= 2) {
      swift_bridgeObjectRelease();
    }
    unint64_t result = a1[1];
    if (result >= 2)
    {
      return swift_bridgeObjectRelease();
    }
  }
  return result;
}

unint64_t *_s7Recount16AwimboPMCOptionsV10UsageErrorOwCP_0(unint64_t *a1, unint64_t *a2)
{
  unint64_t v4 = *a2;
  LODWORD(v5) = -1;
  if (*a2 < 0xFFFFFFFF) {
    unint64_t v5 = *a2;
  }
  if ((int)v5 - 2 < 0)
  {
    if (v4 >= 2) {
      unint64_t v4 = swift_bridgeObjectRetain();
    }
    *a1 = v4;
    unint64_t v6 = a2[1];
    if (v6 >= 2) {
      unint64_t v6 = swift_bridgeObjectRetain();
    }
    a1[1] = v6;
  }
  else
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
  }
  return a1;
}

unint64_t *assignWithCopy for AwimboPMCOptions.UsageError(unint64_t *a1, unint64_t *a2)
{
  unint64_t v4 = *a1;
  LODWORD(v5) = -1;
  if (*a1 >= 0xFFFFFFFF) {
    LODWORD(v6) = -1;
  }
  else {
    unint64_t v6 = *a1;
  }
  int v7 = v6 - 2;
  unint64_t v8 = *a2;
  if (*a2 < 0xFFFFFFFF) {
    unint64_t v5 = *a2;
  }
  int v9 = v5 - 2;
  if ((v7 & 0x80000000) == 0)
  {
    if (v9 < 0)
    {
      if (v8 >= 2) {
        unint64_t v8 = swift_bridgeObjectRetain();
      }
      *a1 = v8;
      unint64_t v10 = a2[1];
      if (v10 >= 2) {
        unint64_t v10 = swift_bridgeObjectRetain();
      }
      a1[1] = v10;
      return a1;
    }
LABEL_18:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    return a1;
  }
  if ((v9 & 0x80000000) == 0)
  {
    if (v4 >= 2) {
      swift_bridgeObjectRelease();
    }
    if (a1[1] >= 2) {
      swift_bridgeObjectRelease();
    }
    goto LABEL_18;
  }
  if (v4 >= 2)
  {
    if (v8 >= 2)
    {
      *a1 = v8;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
    }
    else
    {
      sub_25ACDDC68((uint64_t)a1);
      *a1 = *a2;
    }
  }
  else
  {
    *a1 = v8;
    if (v8 >= 2) {
      swift_bridgeObjectRetain();
    }
  }
  char v12 = a1 + 1;
  unint64_t v13 = a2[1];
  if (a1[1] >= 2)
  {
    if (v13 >= 2)
    {
      *char v12 = v13;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
    }
    else
    {
      sub_25ACDDC68((uint64_t)(a1 + 1));
      *char v12 = a2[1];
    }
  }
  else
  {
    *char v12 = v13;
    if (v13 >= 2) {
      swift_bridgeObjectRetain();
    }
  }
  return a1;
}

uint64_t sub_25ACDDC68(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B2FC8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
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

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

unint64_t *assignWithTake for AwimboPMCOptions.UsageError(unint64_t *a1, unint64_t *a2)
{
  unint64_t v4 = *a1;
  int v5 = -1;
  if (v4 < 0xFFFFFFFF) {
    int v5 = v4;
  }
  if (v5 - 2 >= 0) {
    goto LABEL_4;
  }
  unint64_t v7 = *a2;
  LODWORD(v8) = -1;
  if (*a2 < 0xFFFFFFFF) {
    unint64_t v8 = *a2;
  }
  if ((int)v8 - 2 >= 0)
  {
    if (v4 >= 2) {
      swift_bridgeObjectRelease();
    }
    if (a1[1] >= 2) {
      swift_bridgeObjectRelease();
    }
LABEL_4:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    return a1;
  }
  if (v4 >= 2)
  {
    if (v7 >= 2)
    {
      *a1 = v7;
      swift_bridgeObjectRelease();
      goto LABEL_18;
    }
    sub_25ACDDC68((uint64_t)a1);
  }
  *a1 = v7;
LABEL_18:
  int v9 = a1 + 1;
  unint64_t v10 = a2[1];
  if (a1[1] >= 2)
  {
    if (v10 >= 2)
    {
      *int v9 = v10;
      swift_bridgeObjectRelease();
      return a1;
    }
    sub_25ACDDC68((uint64_t)(a1 + 1));
  }
  *int v9 = v10;
  return a1;
}

uint64_t getEnumTagSinglePayload for AwimboPMCOptions.UsageError(uint64_t *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFD && *((unsigned char *)a1 + 16)) {
    return (*(_DWORD *)a1 + 2147483645);
  }
  uint64_t v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  int v4 = v3 - 2;
  if (v4 < 0) {
    int v4 = -1;
  }
  if ((v4 + 1) >= 2) {
    return v4;
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for AwimboPMCOptions.UsageError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 >= 0x7FFFFFFD)
  {
    *(void *)__n128 result = 0;
    *(void *)(result + 8) = 0;
    *(_DWORD *)__n128 result = a2 - 2147483645;
    if (a3 >= 0x7FFFFFFD) {
      *(unsigned char *)(result + 16) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFD) {
      *(unsigned char *)(result + 16) = 0;
    }
    if (a2) {
      *(void *)__n128 result = a2 + 2;
    }
  }
  return result;
}

uint64_t sub_25ACDDEB4(uint64_t *a1)
{
  uint64_t v1 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v1) = -1;
  }
  int v2 = v1 - 2;
  if (v2 < 0) {
    int v2 = -1;
  }
  return (v2 + 1);
}

void *sub_25ACDDEDC(void *result, unsigned int a2)
{
  if (a2 > 0x7FFFFFFD)
  {
    uint64_t v2 = a2 - 2147483646;
    result[1] = 0;
  }
  else
  {
    if (!a2) {
      return result;
    }
    uint64_t v2 = a2 + 1;
  }
  *__n128 result = v2;
  return result;
}

ValueMetadata *type metadata accessor for AwimboPMCOptions.UsageError()
{
  return &type metadata for AwimboPMCOptions.UsageError;
}

unint64_t sub_25ACDDF20(unint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  switch(a5)
  {
    case 0:
    case 1:
      goto LABEL_4;
    case 2:
      __n128 result = sub_25ACDD9A0(result);
      break;
    case 3:
      swift_bridgeObjectRetain();
LABEL_4:
      __n128 result = swift_bridgeObjectRetain();
      break;
    default:
      return result;
  }
  return result;
}

unint64_t destroy for ProviderOptions.UsageError(uint64_t a1)
{
  return sub_25ACDDFD8(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(void *)(a1 + 24), *(unsigned char *)(a1 + 32));
}

unint64_t sub_25ACDDFD8(unint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  switch(a5)
  {
    case 0:
    case 1:
      goto LABEL_4;
    case 2:
      __n128 result = sub_25ACDD924(result);
      break;
    case 3:
      swift_bridgeObjectRelease();
LABEL_4:
      __n128 result = swift_bridgeObjectRelease();
      break;
    default:
      return result;
  }
  return result;
}

uint64_t initializeWithCopy for ProviderOptions.UsageError(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  char v7 = *(unsigned char *)(a2 + 32);
  sub_25ACDDF20(*(void *)a2, v4, v5, v6, v7);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  *(unsigned char *)(a1 + 32) = v7;
  return a1;
}

uint64_t assignWithCopy for ProviderOptions.UsageError(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  char v7 = *(unsigned char *)(a2 + 32);
  sub_25ACDDF20(*(void *)a2, v4, v5, v6, v7);
  unint64_t v8 = *(void *)a1;
  uint64_t v9 = *(void *)(a1 + 8);
  uint64_t v10 = *(void *)(a1 + 16);
  uint64_t v11 = *(void *)(a1 + 24);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  char v12 = *(unsigned char *)(a1 + 32);
  *(unsigned char *)(a1 + 32) = v7;
  sub_25ACDDFD8(v8, v9, v10, v11, v12);
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

uint64_t assignWithTake for ProviderOptions.UsageError(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 32);
  unint64_t v4 = *(void *)a1;
  uint64_t v6 = *(void *)(a1 + 8);
  uint64_t v5 = *(void *)(a1 + 16);
  uint64_t v7 = *(void *)(a1 + 24);
  long long v8 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v8;
  char v9 = *(unsigned char *)(a1 + 32);
  *(unsigned char *)(a1 + 32) = v3;
  sub_25ACDDFD8(v4, v6, v5, v7, v9);
  return a1;
}

uint64_t getEnumTagSinglePayload for ProviderOptions.UsageError(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFC && *(unsigned char *)(a1 + 33)) {
    return (*(_DWORD *)a1 + 252);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 32);
  if (v3 <= 4) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for ProviderOptions.UsageError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFB)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(unsigned char *)(result + 32) = 0;
    *(void *)__n128 result = a2 - 252;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xFC) {
      *(unsigned char *)(result + 33) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFC) {
      *(unsigned char *)(result + 33) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 32) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_25ACDE244(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 32) <= 3u) {
    return *(unsigned __int8 *)(a1 + 32);
  }
  else {
    return (*(_DWORD *)a1 + 4);
  }
}

uint64_t sub_25ACDE25C(uint64_t result, unsigned int a2)
{
  if (a2 >= 4)
  {
    *(void *)__n128 result = a2 - 4;
    *(void *)(result + 8) = 0;
    LOBYTE(a2) = 4;
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
  }
  *(unsigned char *)(result + 32) = a2;
  return result;
}

ValueMetadata *type metadata accessor for ProviderOptions.UsageError()
{
  return &type metadata for ProviderOptions.UsageError;
}

uint64_t sub_25ACDE290(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(unsigned char *)(a2 + 32) = *((unsigned char *)a1 + 32);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *__n128 result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for ModeName(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for ModeName(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x25ACDE414);
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

uint64_t sub_25ACDE43C(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_25ACDE444(unsigned char *result, char a2)
{
  *__n128 result = a2;
  return result;
}

ValueMetadata *type metadata accessor for ModeName()
{
  return &type metadata for ModeName;
}

unint64_t destroy for ModeSelection(unint64_t *a1)
{
  return sub_25ACDD924(*a1);
}

unint64_t *_s7Recount13ModeSelectionOwCP_0(unint64_t *a1, unint64_t *a2)
{
  unint64_t v3 = *a2;
  unint64_t v4 = a2[1];
  unint64_t v5 = a2[2];
  sub_25ACDD9A0(*a2);
  *a1 = v3;
  a1[1] = v4;
  a1[2] = v5;
  return a1;
}

unint64_t *assignWithCopy for ModeSelection(unint64_t *a1, unint64_t *a2)
{
  unint64_t v3 = *a2;
  unint64_t v4 = a2[1];
  unint64_t v5 = a2[2];
  sub_25ACDD9A0(*a2);
  unint64_t v6 = *a1;
  *a1 = v3;
  a1[1] = v4;
  a1[2] = v5;
  sub_25ACDD924(v6);
  return a1;
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

unint64_t *assignWithTake for ModeSelection(unint64_t *a1, uint64_t a2)
{
  unint64_t v3 = *(void *)(a2 + 16);
  unint64_t v4 = *a1;
  *(_OWORD *)a1 = *(_OWORD *)a2;
  a1[2] = v3;
  sub_25ACDD924(v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for ModeSelection(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 24)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *(void *)a1 >> 2;
  if (v2 > 0x80000000) {
    int v3 = ~v2;
  }
  else {
    int v3 = -1;
  }
  return (v3 + 1);
}

uint64_t storeEnumTagSinglePayload for ModeSelection(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 24) = 1;
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
      *(void *)(result + 8) = 0;
      *(void *)(result + 16) = 0;
      *(void *)__n128 result = 4 * -a2;
      return result;
    }
    *(unsigned char *)(result + 24) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

uint64_t sub_25ACDE604(uint64_t a1)
{
  uint64_t v1 = *(void *)a1 >> 62;
  if (v1 <= 1) {
    return v1;
  }
  else {
    return (*(void *)a1 & 3 | (4 * *(_DWORD *)(a1 + 8))) + 2;
  }
}

void *sub_25ACDE624(void *result)
{
  *result &= 0x3FFFFFFFFFFFFFFFuLL;
  return result;
}

void *sub_25ACDE634(void *result, uint64_t a2)
{
  if (a2 < 2)
  {
    *__n128 result = *result & 3 | (a2 << 62);
  }
  else
  {
    result[1] = (unint64_t)(a2 - 2) >> 2;
    result[2] = 0;
    *__n128 result = ((_BYTE)a2 - 2) & 3 | 0x8000000000000000;
  }
  return result;
}

ValueMetadata *type metadata accessor for ModeSelection()
{
  return &type metadata for ModeSelection;
}

uint64_t initializeBufferWithCopyOfBuffer for ModeOption(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

unint64_t sub_25ACDE6AC(unint64_t a1, uint64_t a2, uint64_t a3, __int16 a4)
{
  if (a4 < 0) {
    return sub_25ACDE6BC(a1);
  }
  else {
    return swift_bridgeObjectRetain();
  }
}

unint64_t sub_25ACDE6BC(unint64_t result)
{
  if (result >= 2) {
    return swift_bridgeObjectRetain();
  }
  return result;
}

unint64_t destroy for ModeOption(uint64_t a1)
{
  return sub_25ACDE6E0(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(_WORD *)(a1 + 24));
}

unint64_t sub_25ACDE6E0(unint64_t a1, uint64_t a2, uint64_t a3, __int16 a4)
{
  if (a4 < 0) {
    return sub_25ACDD990(a1);
  }
  else {
    return swift_bridgeObjectRelease();
  }
}

uint64_t initializeWithCopy for ModeOption(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  __int16 v6 = *(_WORD *)(a2 + 24);
  sub_25ACDE6AC(*(void *)a2, v4, v5, v6);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(_WORD *)(a1 + 24) = v6;
  return a1;
}

uint64_t assignWithCopy for ModeOption(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  __int16 v6 = *(_WORD *)(a2 + 24);
  sub_25ACDE6AC(*(void *)a2, v4, v5, v6);
  unint64_t v7 = *(void *)a1;
  uint64_t v8 = *(void *)(a1 + 8);
  uint64_t v9 = *(void *)(a1 + 16);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  __int16 v10 = *(_WORD *)(a1 + 24);
  *(_WORD *)(a1 + 24) = v6;
  sub_25ACDE6E0(v7, v8, v9, v10);
  return a1;
}

__n128 __swift_memcpy26_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  *(_OWORD *)(a1 + 10) = *(_OWORD *)(a2 + 10);
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for ModeOption(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 16);
  __int16 v4 = *(_WORD *)(a2 + 24);
  unint64_t v5 = *(void *)a1;
  uint64_t v7 = *(void *)(a1 + 8);
  uint64_t v6 = *(void *)(a1 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = v3;
  __int16 v8 = *(_WORD *)(a1 + 24);
  *(_WORD *)(a1 + 24) = v4;
  sub_25ACDE6E0(v5, v7, v6, v8);
  return a1;
}

uint64_t getEnumTagSinglePayload for ModeOption(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x3FFF && *(unsigned char *)(a1 + 26)) {
    return (*(_DWORD *)a1 + 0x3FFF);
  }
  unsigned int v3 = (*(_WORD *)(a1 + 24) & 0xFE | (*(unsigned __int16 *)(a1 + 24) >> 15) | (*(unsigned __int16 *)(a1 + 24) >> 1) & 0x3F00) ^ 0x3FFF;
  if (v3 >= 0x3FFE) {
    unsigned int v3 = -1;
  }
  return v3 + 1;
}

uint64_t storeEnumTagSinglePayload for ModeOption(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x3FFE)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(_WORD *)(result + 24) = 0;
    *(void *)__n128 result = a2 - 0x3FFF;
    if (a3 >= 0x3FFF) {
      *(unsigned char *)(result + 26) = 1;
    }
  }
  else
  {
    if (a3 >= 0x3FFF) {
      *(unsigned char *)(result + 26) = 0;
    }
    if (a2)
    {
      unsigned int v3 = ((-a2 >> 1) & 0x1FFF) - (a2 << 13);
      *(void *)__n128 result = 0;
      *(void *)(result + 8) = 0;
      *(void *)(result + 16) = 0;
      *(_WORD *)(result + 24) = (4 * v3) & 0xFE00 | (2 * (v3 & 0x7F));
    }
  }
  return result;
}

uint64_t sub_25ACDE900(uint64_t a1)
{
  return *(unsigned __int16 *)(a1 + 24) >> 15;
}

uint64_t sub_25ACDE90C(uint64_t result)
{
  *(_WORD *)(result + 24) &= ~0x8000u;
  return result;
}

uint64_t sub_25ACDE91C(uint64_t result, __int16 a2)
{
  *(_WORD *)(result + 24) = *(_WORD *)(result + 24) & 0x101 | (a2 << 15);
  return result;
}

ValueMetadata *type metadata accessor for ModeOption()
{
  return &type metadata for ModeOption;
}

unint64_t sub_25ACDE944()
{
  unint64_t result = qword_26A4B2FD0;
  if (!qword_26A4B2FD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4B2FD0);
  }
  return result;
}

unint64_t destroy for AwimboPMCOptions(unint64_t *a1)
{
  unint64_t result = *a1;
  if (result >= 2) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t initializeWithCopy for AwimboPMCOptions(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)a2;
  if (*(void *)a2 >= 2uLL) {
    uint64_t v4 = swift_bridgeObjectRetain();
  }
  *(void *)a1 = v4;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_WORD *)(a1 + 24) = *(_WORD *)(a2 + 24);
  return a1;
}

uint64_t assignWithCopy for AwimboPMCOptions(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = *(void *)a1;
  unint64_t v5 = *(void *)a2;
  if (v4 >= 2)
  {
    if (v5 >= 2)
    {
      *(void *)a1 = v5;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
    }
    else
    {
      sub_25ACDDC68(a1);
      *(void *)a1 = *(void *)a2;
    }
  }
  else
  {
    *(void *)a1 = v5;
    if (v5 >= 2) {
      swift_bridgeObjectRetain();
    }
  }
  long long v6 = *(_OWORD *)(a2 + 8);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  *(_OWORD *)(a1 + 8) = v6;
  *(unsigned char *)(a1 + 25) = *(unsigned char *)(a2 + 25);
  return a1;
}

uint64_t assignWithTake for AwimboPMCOptions(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = *(void *)a2;
  if (*(void *)a1 >= 2uLL)
  {
    if (v4 >= 2)
    {
      *(void *)a1 = v4;
      swift_bridgeObjectRelease();
      goto LABEL_6;
    }
    sub_25ACDDC68(a1);
  }
  *(void *)a1 = v4;
LABEL_6:
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  *(unsigned char *)(a1 + 25) = *(unsigned char *)(a2 + 25);
  return a1;
}

uint64_t getEnumTagSinglePayload for AwimboPMCOptions(uint64_t *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 > 0x7FFFFFFD && *((unsigned char *)a1 + 26)) {
    return (*(_DWORD *)a1 + 2147483646);
  }
  uint64_t v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  int v4 = v3 - 2;
  if (v4 < 0) {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for AwimboPMCOptions(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFD)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(_WORD *)(result + 24) = 0;
    *(void *)unint64_t result = a2 - 2147483646;
    if (a3 > 0x7FFFFFFD) {
      *(unsigned char *)(result + 26) = 1;
    }
  }
  else
  {
    if (a3 > 0x7FFFFFFD) {
      *(unsigned char *)(result + 26) = 0;
    }
    if (a2) {
      *(void *)unint64_t result = a2 + 1;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AwimboPMCOptions()
{
  return &type metadata for AwimboPMCOptions;
}

uint64_t TraceProvider.__allocating_init(options:session:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = swift_allocObject();
  TraceProvider.init(options:session:)(a1, a2);
  return v4;
}

void *TraceProvider.init(options:session:)(uint64_t a1, uint64_t a2)
{
  uint64_t v49 = a2;
  uint64_t v4 = sub_25AD14360();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v40 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B30A0);
  MEMORY[0x270FA5388](v8 - 8);
  __int16 v10 = (char *)&v40 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_25AD143E0();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  unint64_t v14 = (char *)&v40 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v15 = sub_25ACDC9C4(a1);
  if (v2)
  {
    uint64_t v19 = v50;
    type metadata accessor for TraceProvider();
    swift_deallocPartialClassInstance();
  }
  else
  {
    uint64_t v21 = v17;
    uint64_t v44 = v14;
    uint64_t v45 = v7;
    uint64_t v46 = v12;
    __int16 v22 = v18;
    if (v18 < 0)
    {
      sub_25ACE87CC(v15, v16, v17, v18 & 0x101, (uint64_t)v57);
      uint64_t v23 = type metadata accessor for AwimboPMC(0);
      swift_allocObject();
      sub_25ACDF3CC(v57);
      uint64_t v28 = sub_25ACE3DA4((uint64_t)v57);
      uint64_t v52 = v23;
      char v53 = &off_270894E90;
      sub_25ACDF4E8(v57);
    }
    else
    {
      unint64_t v47 = v15;
      uint64_t v48 = v16;
      sub_25ACFA070((uint64_t)v54);
      sub_25ACDF660((uint64_t)v54);
      unint64_t v24 = sub_25ACED62C((uint64_t)v54);
      if (v48)
      {
        uint64_t v43 = v24;
        uint64_t v42 = v55;
        unint64_t v41 = v56;
        uint64_t v26 = v46 + 56;
        unint64_t v25 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v46 + 56);
        uint64_t v46 = v11;
        v25(v10, 1, 1, v11);
        (*(void (**)(char *, void, uint64_t))(v5 + 104))(v45, *MEMORY[0x263F06E50], v4);
        swift_bridgeObjectRetain();
        uint64_t v27 = v44;
        sub_25AD143C0();
        uint64_t v32 = sub_25AD143F0();
        unint64_t v34 = v33;
        (*(void (**)(char *, uint64_t))(v26 - 48))(v27, v46);
        uint64_t v35 = type metadata accessor for AwimboPMI(0);
        swift_allocObject();
        uint64_t v36 = swift_retain();
        uint64_t v28 = sub_25ACE4E54(v36, v41, v42, v32, v34);
        swift_release();
        sub_25ACDE6E0(v47, v48, v21, v22);
      }
      else
      {
        uint64_t v29 = v55;
        unint64_t v30 = v56;
        uint64_t v31 = (uint64_t)v24;
        uint64_t v35 = type metadata accessor for AwimboPMI(0);
        swift_allocObject();
        uint64_t v28 = sub_25ACE4E54(v31, v30, v29, 0, 0xF000000000000000);
      }
      sub_25ACDF6AC((uint64_t)v54);
      type metadata accessor for AwimboPMI(0);
      char v53 = &off_270894E68;
      uint64_t v52 = v35;
    }
    *(void *)&long long v51 = v28;
    uint64_t v19 = v50;
    sub_25ACDF604(&v51, (uint64_t)(v50 + 2));
    uint64_t v37 = v49;
    uint64_t v38 = v19[5];
    uint64_t v39 = v19[6];
    __swift_project_boxed_opaque_existential_1(v19 + 2, v38);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v39 + 8))(v37, v38, v39);
  }
  return v19;
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> TraceProvider.activate()()
{
  uint64_t v1 = v0[5];
  uint64_t v2 = v0[6];
  __swift_project_boxed_opaque_existential_1(v0 + 2, v1);
  (*(void (**)(uint64_t, uint64_t))(v2 + 16))(v1, v2);
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> TraceProvider.cancel()()
{
  uint64_t v1 = v0[5];
  uint64_t v2 = v0[6];
  __swift_project_boxed_opaque_existential_1(v0 + 2, v1);
  (*(void (**)(uint64_t, uint64_t))(v2 + 24))(v1, v2);
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> TraceProvider.append(file:)(Swift::OpaquePointer file)
{
  uint64_t v3 = v1[5];
  uint64_t v4 = v1[6];
  __swift_project_boxed_opaque_existential_1(v1 + 2, v3);
  (*(void (**)(void *, uint64_t, uint64_t))(v4 + 32))(file._rawValue, v3, v4);
}

uint64_t TraceProvider.deinit()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  return v0;
}

uint64_t TraceProvider.__deallocating_deinit()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  return MEMORY[0x270FA0228](v0, 56, 7);
}

uint64_t type metadata accessor for TraceProvider()
{
  return self;
}

void *sub_25ACDF3CC(void *a1)
{
  uint64_t v2 = a1[5];
  unint64_t v3 = a1[6];
  uint64_t v4 = a1[7];
  swift_bridgeObjectRetain();
  sub_25ACDF43C(v2, v3);
  sub_25ACDF4A8(v4);
  return a1;
}

uint64_t sub_25ACDF43C(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_25ACDF450(a1, a2);
  }
  return a1;
}

uint64_t sub_25ACDF450(uint64_t a1, unint64_t a2)
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

uint64_t sub_25ACDF4A8(uint64_t result)
{
  if (result)
  {
    swift_bridgeObjectRetain();
    return swift_bridgeObjectRetain();
  }
  return result;
}

void *sub_25ACDF4E8(void *a1)
{
  uint64_t v2 = a1[5];
  unint64_t v3 = a1[6];
  uint64_t v4 = a1[7];
  swift_bridgeObjectRelease();
  sub_25ACDF558(v2, v3);
  sub_25ACDF5C4(v4);
  return a1;
}

uint64_t sub_25ACDF558(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_25ACDF56C(a1, a2);
  }
  return a1;
}

uint64_t sub_25ACDF56C(uint64_t a1, unint64_t a2)
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

uint64_t sub_25ACDF5C4(uint64_t result)
{
  if (result)
  {
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_25ACDF604(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_25ACDF660(uint64_t a1)
{
  return a1;
}

uint64_t sub_25ACDF6AC(uint64_t a1)
{
  return a1;
}

unint64_t sub_25ACDF6F8()
{
  unint64_t result = qword_26A4B30A8;
  if (!qword_26A4B30A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4B30A8);
  }
  return result;
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

char *sub_25ACDF79C(int a1)
{
  sub_25AD14860();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_25AD145A0();
  swift_bridgeObjectRelease();
  sub_25AD145A0();
  unint64_t result = strerror(a1);
  if (result)
  {
    sub_25AD145B0();
    sub_25AD145A0();
    swift_bridgeObjectRelease();
    return (char *)543387755;
  }
  else
  {
    __break(1u);
  }
  return result;
}

char *sub_25ACDF86C()
{
  return sub_25ACDF79C(*v0);
}

uint64_t sub_25ACDF878(int a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = sub_25AD14420();
  uint64_t v45 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v12 = (char *)&v41 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25AD14410();
  swift_bridgeObjectRetain();
  sub_25ACDF4A8(a3);
  swift_bridgeObjectRetain();
  sub_25ACDF4A8(a3);
  uint64_t v44 = v12;
  uint64_t v13 = sub_25AD14400();
  os_log_type_t v14 = sub_25AD14700();
  if (os_log_type_enabled(v13, v14))
  {
    int v42 = a1;
    uint64_t v43 = v10;
    uint64_t v15 = swift_slowAlloc();
    uint64_t v41 = swift_slowAlloc();
    uint64_t v48 = v41;
    *(_DWORD *)uint64_t v15 = 136315394;
    uint64_t v16 = swift_bridgeObjectRetain();
    uint64_t v17 = MEMORY[0x2611549E0](v16, MEMORY[0x263F8E970]);
    unint64_t v19 = v18;
    swift_bridgeObjectRelease();
    uint64_t v46 = sub_25ACE700C(v17, v19, &v48);
    sub_25AD147E0();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v15 + 12) = 2080;
    if (a3)
    {
      uint64_t v46 = 2112112;
      unint64_t v47 = 0xE300000000000000;
      MEMORY[0x2611549E0](a3, MEMORY[0x263F8E970]);
      sub_25AD145A0();
      swift_bridgeObjectRelease();
      sub_25AD145A0();
      MEMORY[0x2611549E0](a4, MEMORY[0x263F8E8F8]);
      sub_25AD145A0();
      swift_bridgeObjectRelease();
      uint64_t v20 = v46;
      unint64_t v21 = v47;
    }
    else
    {
      unint64_t v21 = 0xE400000000000000;
      uint64_t v20 = 1701736302;
    }
    uint64_t v46 = sub_25ACE700C(v20, v21, &v48);
    sub_25AD147E0();
    swift_bridgeObjectRelease();
    sub_25ACDF5C4(a3);
    sub_25ACDF5C4(a3);
    _os_log_impl(&dword_25ACDA000, v13, v14, "configs: %s, samplers: %s", (uint8_t *)v15, 0x16u);
    uint64_t v22 = v41;
    swift_arrayDestroy();
    MEMORY[0x261155570](v22, -1, -1);
    MEMORY[0x261155570](v15, -1, -1);

    uint64_t v10 = v43;
    a1 = v42;
  }
  else
  {
    swift_bridgeObjectRelease_n();

    sub_25ACDF5C4(a3);
    sub_25ACDF5C4(a3);
  }
  *(_DWORD *)(v5 + 16) = a1;
  unint64_t v23 = *(void *)(a2 + 16);
  if (v23 >> 60)
  {
    __break(1u);
    goto LABEL_30;
  }
  unint64_t v24 = (char *)swift_slowAlloc();
  *(void *)(v5 + 24) = v24;
  *(void *)(v5 + 32) = v23;
  unint64_t v25 = *(void *)(a2 + 16);
  if (!v25) {
    goto LABEL_13;
  }
  if (v23 < v25)
  {
LABEL_30:
    __break(1u);
LABEL_31:
    __break(1u);
    goto LABEL_32;
  }
  uint64_t v26 = (char *)(a2 + 32);
  size_t v27 = 8 * v25;
  if (a2 + 32 < (unint64_t)&v24[8 * v25] && v24 < &v26[v27]) {
    goto LABEL_35;
  }
  memcpy(v24, v26, v27);
LABEL_13:
  swift_bridgeObjectRelease();
  if (!a3)
  {
    (*(void (**)(char *, uint64_t))(v45 + 8))(v44, v10);
    *(_OWORD *)(v5 + 56) = 0u;
    *(_OWORD *)(v5 + 40) = 0u;
    *(unsigned char *)(v5 + 72) = 1;
    return v5;
  }
  unint64_t v28 = *(void *)(a3 + 16);
  if (v28 >> 60) {
    goto LABEL_31;
  }
  uint64_t v29 = (char *)swift_slowAlloc();
  unint64_t v30 = v29;
  unint64_t v31 = *(void *)(a3 + 16);
  if (v31)
  {
    if (v28 < v31)
    {
LABEL_33:
      __break(1u);
LABEL_34:
      __break(1u);
      goto LABEL_35;
    }
    uint64_t v32 = (char *)(a3 + 32);
    size_t v33 = 8 * v31;
    if (a3 + 32 < (unint64_t)&v29[8 * v31] && v29 < &v32[v33]) {
      goto LABEL_35;
    }
    memcpy(v29, v32, v33);
  }
  swift_bridgeObjectRelease();
  unint64_t v34 = *(void *)(a4 + 16);
  if (v34 >> 61)
  {
LABEL_32:
    __break(1u);
    goto LABEL_33;
  }
  uint64_t v35 = (char *)swift_slowAlloc();
  uint64_t v36 = v35;
  unint64_t v37 = *(void *)(a4 + 16);
  if (!v37)
  {
LABEL_26:
    (*(void (**)(char *, uint64_t))(v45 + 8))(v44, v10);
    swift_bridgeObjectRelease();
    *(void *)(v5 + 40) = v30;
    *(void *)(v5 + 48) = v28;
    *(void *)(v5 + 56) = v36;
    *(void *)(v5 + 64) = v34;
    *(unsigned char *)(v5 + 72) = 0;
    return v5;
  }
  if (v34 < v37) {
    goto LABEL_34;
  }
  uint64_t v38 = (char *)(a4 + 32);
  size_t v39 = 4 * v37;
  if (a4 + 32 >= (unint64_t)&v35[4 * v37] || v35 >= &v38[v39])
  {
    memcpy(v35, v38, v39);
    goto LABEL_26;
  }
LABEL_35:
  uint64_t result = sub_25AD14980();
  __break(1u);
  return result;
}

uint64_t sub_25ACDFDA4()
{
  uint64_t v1 = *(void *)(v0 + 24);
  if (v1) {
    MEMORY[0x261155570](v1, -1, -1);
  }
  if ((*(unsigned char *)(v0 + 72) & 1) == 0)
  {
    uint64_t v2 = *(void *)(v0 + 40);
    uint64_t v3 = *(void *)(v0 + 56);
    if (v2) {
      MEMORY[0x261155570](v2, -1, -1);
    }
    if (v3) {
      MEMORY[0x261155570](v3, -1, -1);
    }
  }
  return MEMORY[0x270FA0228](v0, 73, 7);
}

uint64_t type metadata accessor for KPCSet()
{
  return self;
}

uint64_t sub_25ACDFE48()
{
  uint64_t result = kpc_set_config();
  if (result)
  {
    int v2 = MEMORY[0x261154780]();
    sub_25ACE0ECC();
    swift_allocError();
    *(_DWORD *)uint64_t v3 = v2;
    unint64_t v4 = 0xEA00000000006769;
    uint64_t v5 = 0x666E6F632D746573;
LABEL_3:
    *(void *)(v3 + 8) = v5;
    *(void *)(v3 + 16) = v4;
    return swift_willThrow();
  }
  if ((*(unsigned char *)(v0 + 72) & 1) == 0)
  {
    if (kpc_set_period())
    {
      int v6 = MEMORY[0x261154780]();
      sub_25ACE0ECC();
      swift_allocError();
      *(_DWORD *)uint64_t v3 = v6;
      uint64_t v5 = 0x697265702D746573;
      unint64_t v4 = 0xEA0000000000646FLL;
      goto LABEL_3;
    }
    uint64_t result = kpc_set_actionid();
    if (result)
    {
      int v7 = MEMORY[0x261154780]();
      sub_25ACE0ECC();
      swift_allocError();
      *(_DWORD *)uint64_t v3 = v7;
      unint64_t v4 = 0xEC00000064696E6FLL;
      uint64_t v5 = 0x697463612D746573;
      goto LABEL_3;
    }
  }
  return result;
}

uint64_t sub_25ACDFF9C(unint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = sub_25AD14450();
  uint64_t v33 = *(void *)(v10 - 8);
  uint64_t v34 = v10;
  MEMORY[0x270FA5388](v10);
  uint64_t v12 = (char *)v29 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_25AD14470();
  uint64_t v31 = *(void *)(v13 - 8);
  uint64_t v32 = v13;
  MEMORY[0x270FA5388](v13);
  unint64_t v30 = (char *)v29 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_25AD14720();
  uint64_t v16 = *(void *)(v15 - 8);
  MEMORY[0x270FA5388](v15);
  unint64_t v18 = (char *)v29 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)(v5 + 72) = 0;
  *(void *)(v5 + 16) = 0;
  *(void *)(v5 + 24) = a1;
  swift_bridgeObjectRetain();
  dispatch_semaphore_t v19 = dispatch_semaphore_create(0);
  *(void *)(v5 + 40) = a2;
  *(void *)(v5 + 48) = a3;
  *(unsigned char *)(v5 + 56) = a4 & 1;
  uint64_t v20 = *(void *)(v5 + 72);
  *(void *)(v5 + 64) = v19;
  *(void *)(v5 + 72) = 0;
  MEMORY[0x261155470](v20);
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v21 = sub_25AD14940();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v21 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();
  if (v21 < 2)
  {
    *(void *)(v5 + 32) = 0;
  }
  else
  {
    sub_25ACE0F20();
    uint64_t aBlock = MEMORY[0x263F8EE78];
    sub_25ACE1010(&qword_26A4B30C8, MEMORY[0x263F8F148]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B30D0);
    sub_25ACE1058(&qword_26A4B30D8, &qword_26A4B30D0);
    sub_25AD14800();
    uint64_t v22 = sub_25AD14730();
    (*(void (**)(char *, uint64_t))(v16 + 8))(v18, v15);
    *(void *)(v5 + 32) = v22;
    swift_getObjectType();
    uint64_t v23 = swift_allocObject();
    *(void *)(v23 + 16) = v5;
    *(void *)(v23 + 24) = v22;
    size_t v39 = sub_25ACE0FE8;
    uint64_t v40 = v23;
    uint64_t aBlock = MEMORY[0x263EF8330];
    uint64_t v36 = 1107296256;
    v29[1] = &v37;
    unint64_t v37 = sub_25ACE0730;
    uint64_t v38 = &block_descriptor;
    unint64_t v24 = _Block_copy(&aBlock);
    swift_unknownObjectRetain_n();
    swift_retain();
    unint64_t v25 = v30;
    sub_25AD14460();
    sub_25ACE0814();
    sub_25AD14740();
    _Block_release(v24);
    uint64_t v33 = *(void *)(v33 + 8);
    ((void (*)(char *, uint64_t))v33)(v12, v34);
    uint64_t v26 = v32;
    uint64_t v31 = *(void *)(v31 + 8);
    ((void (*)(char *, uint64_t))v31)(v25, v32);
    swift_release();
    size_t v39 = sub_25ACE1008;
    uint64_t v40 = v5;
    uint64_t aBlock = MEMORY[0x263EF8330];
    uint64_t v36 = 1107296256;
    unint64_t v37 = sub_25ACE0730;
    uint64_t v38 = &block_descriptor_16;
    size_t v27 = _Block_copy(&aBlock);
    swift_retain();
    sub_25AD14460();
    sub_25ACE0814();
    sub_25AD14750();
    _Block_release(v27);
    swift_unknownObjectRelease();
    ((void (*)(char *, uint64_t))v33)(v12, v34);
    ((void (*)(char *, uint64_t))v31)(v25, v26);
    swift_release();
  }
  return v5;
}

uint64_t sub_25ACE04A0(void *a1)
{
  if (kpc_set_counting())
  {
    int v3 = MEMORY[0x261154780]();
    sub_25ACE0ECC();
    uint64_t v4 = swift_allocError();
    *(_DWORD *)uint64_t v5 = v3;
    *(void *)(v5 + 8) = 0xD000000000000010;
    *(void *)(v5 + 16) = 0x800000025AD18840;
    swift_willThrow();
    goto LABEL_20;
  }
  uint64_t v6 = a1[2];
  uint64_t v7 = v6 + 1;
  if (__OFADD__(v6, 1))
  {
    __break(1u);
  }
  else
  {
    a1[2] = v7;
    unint64_t v1 = a1[3];
    if (!(v1 >> 62))
    {
      uint64_t v8 = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
      goto LABEL_6;
    }
  }
  swift_bridgeObjectRetain();
  uint64_t v8 = sub_25AD14940();
  swift_bridgeObjectRelease();
LABEL_6:
  unint64_t v9 = v1 & 0xC000000000000001;
  if (v7 >= v8) {
    goto LABEL_10;
  }
  unint64_t v10 = a1[2];
  if (v9) {
    goto LABEL_28;
  }
  if ((v10 & 0x8000000000000000) != 0)
  {
    __break(1u);
LABEL_10:
    unint64_t v10 = 0;
    a1[2] = 0;
    if (!v9) {
      goto LABEL_11;
    }
LABEL_28:
    MEMORY[0x261154BD0](v10, v1);
    int v11 = 0;
    goto LABEL_13;
  }
LABEL_11:
  if (v10 >= *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    __break(1u);
    goto LABEL_30;
  }
  swift_retain();
  int v11 = 1;
LABEL_13:
  sub_25ACDFE48();
  swift_release();
  unint64_t v12 = a1[2];
  if (v11)
  {
    if ((v12 & 0x8000000000000000) == 0)
    {
      if (v12 < *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10))
      {
        swift_retain();
        goto LABEL_18;
      }
LABEL_31:
      __break(1u);
      goto LABEL_32;
    }
LABEL_30:
    __break(1u);
    goto LABEL_31;
  }
  MEMORY[0x261154BD0](v12, v1);
LABEL_18:
  if (kpc_set_counting())
  {
    int v13 = MEMORY[0x261154780]();
    sub_25ACE0ECC();
    uint64_t v4 = swift_allocError();
    *(_DWORD *)uint64_t v14 = v13;
    *(void *)(v14 + 8) = 0x6E756F632D746573;
    *(void *)(v14 + 16) = 0xEF6E6F20676E6974;
    swift_willThrow();
    swift_release();
LABEL_20:
    uint64_t v15 = a1[9];
    a1[9] = v4;
    MEMORY[0x261155480](v4);
    MEMORY[0x261155470](v15);
    swift_getObjectType();
    sub_25AD14760();
LABEL_32:
    JUMPOUT(0x261155470);
  }
  return swift_release();
}

uint64_t sub_25ACE0730(uint64_t a1)
{
  unint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);
  return swift_release();
}

uint64_t sub_25ACE0774(uint64_t a1)
{
  if (kpc_set_counting())
  {
    int v2 = MEMORY[0x261154780]();
    sub_25ACE0ECC();
    uint64_t v3 = swift_allocError();
    *(_DWORD *)uint64_t v4 = v2;
    *(void *)(v4 + 8) = 0xD000000000000010;
    *(void *)(v4 + 16) = 0x800000025AD18840;
    swift_willThrow();
    uint64_t v5 = *(void *)(a1 + 72);
    *(void *)(a1 + 72) = v3;
    MEMORY[0x261155470](v5);
  }
  return sub_25AD14790();
}

uint64_t sub_25ACE0814()
{
  return sub_25AD14800();
}

uint64_t sub_25ACE08DC(int a1)
{
  uint64_t v2 = v1;
  LODWORD(v46) = a1;
  uint64_t v3 = sub_25AD144A0();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = MEMORY[0x270FA5388](v3);
  uint64_t v7 = (char *)&v36 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  unint64_t v9 = (char *)&v36 - v8;
  uint64_t v10 = sub_25AD14440();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)&v36 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  uint64_t v16 = (char *)&v36 - v15;
  uint64_t result = kpc_force_all_ctrs_set();
  if (result)
  {
    int v18 = MEMORY[0x261154780]();
    sub_25ACE0ECC();
    swift_allocError();
    *(_DWORD *)uint64_t v19 = v18;
    strcpy((char *)(v19 + 8), "force-counters");
    *(unsigned char *)(v19 + 23) = -18;
    return swift_willThrow();
  }
  uint64_t v43 = v9;
  uint64_t v44 = (uint64_t *)v14;
  uint64_t v41 = v3;
  int v42 = (uint64_t *)v16;
  uint64_t v39 = v4;
  uint64_t v40 = v11;
  uint64_t v20 = *(void *)(v2 + 24);
  if ((v20 & 0xC000000000000001) != 0)
  {
    MEMORY[0x261154BD0](0, *(void *)(v2 + 24));
    uint64_t v23 = v7;
    char v21 = v46;
    uint64_t v22 = v45;
  }
  else
  {
    char v21 = v46;
    uint64_t v22 = v45;
    if (!*(void *)((v20 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      goto LABEL_23;
    }
    uint64_t v23 = v7;
    swift_retain();
  }
  sub_25ACDFE48();
  uint64_t result = swift_release();
  unint64_t v24 = v44;
  if (v22) {
    return result;
  }
  if ((v21 & 1) == 0)
  {
    if ((v20 & 0xC000000000000001) != 0)
    {
      MEMORY[0x261154BD0](0, v20);
    }
    else
    {
      if (!*(void *)((v20 & 0xFFFFFFFFFFFFFF8) + 0x10))
      {
LABEL_25:
        __break(1u);
        return result;
      }
      swift_retain();
    }
    if (kpc_set_counting())
    {
      int v25 = MEMORY[0x261154780]();
      sub_25ACE0ECC();
      swift_allocError();
      *(_DWORD *)uint64_t v26 = v25;
      *(void *)(v26 + 8) = 0x6E756F632D746573;
      *(void *)(v26 + 16) = 0xEF6E6F20676E6974;
      swift_willThrow();
      return swift_release();
    }
    uint64_t result = swift_release();
  }
  if ((*(unsigned char *)(v2 + 56) & 1) == 0)
  {
    uint64_t v27 = *(void *)(v2 + 32);
    if (v27)
    {
      swift_unknownObjectRetain();
      uint64_t result = sub_25AD14BC0();
      uint64_t v29 = 1000000000 * result;
      if ((unsigned __int128)(result * (__int128)1000000000) >> 64 == (1000000000 * result) >> 63)
      {
        uint64_t v46 = v27;
        BOOL v30 = __OFADD__(v29, v28 / 1000000000);
        uint64_t v31 = v29 + v28 / 1000000000;
        uint64_t v32 = v40;
        uint64_t v33 = v42;
        if (!v30)
        {
          *int v42 = v31;
          LODWORD(v45) = *MEMORY[0x263F8EFE0];
          unint64_t v37 = *(void (**)(uint64_t *))(v32 + 104);
          v37(v33);
          uint64_t ObjectType = swift_getObjectType();
          sub_25AD14480();
          sub_25AD14490();
          uint64_t v39 = *(void *)(v39 + 8);
          ((void (*)(char *, uint64_t))v39)(v23, v41);
          *unint64_t v24 = 0;
          ((void (*)(uint64_t *, void, uint64_t))v37)(v24, v45, v10);
          uint64_t v34 = v43;
          MEMORY[0x261154AF0](v43, v33, v24, ObjectType);
          uint64_t v35 = *(uint64_t (**)(uint64_t *, uint64_t))(v32 + 8);
          v35(v24, v10);
          ((void (*)(char *, uint64_t))v39)(v34, v41);
          sub_25AD14770();
          swift_unknownObjectRelease();
          return v35(v42, v10);
        }
        goto LABEL_24;
      }
LABEL_23:
      __break(1u);
LABEL_24:
      __break(1u);
      goto LABEL_25;
    }
  }
  return result;
}

uint64_t sub_25ACE0D68()
{
  if (*(void *)(v0 + 32))
  {
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_25AD14760();
    sub_25AD14780();
    if (*(void *)(v0 + 72))
    {
      MEMORY[0x261155480](*(void *)(v0 + 72));
      swift_willThrow();
    }
    return swift_unknownObjectRelease();
  }
  else
  {
    uint64_t result = kpc_set_counting();
    if (result)
    {
      int v2 = MEMORY[0x261154780]();
      sub_25ACE0ECC();
      swift_allocError();
      *(_DWORD *)uint64_t v3 = v2;
      *(void *)(v3 + 8) = 0xD000000000000010;
      *(void *)(v3 + 16) = 0x800000025AD18840;
      return swift_willThrow();
    }
  }
  return result;
}

uint64_t sub_25ACE0E58()
{
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();

  MEMORY[0x261155470](*(void *)(v0 + 72));
  return MEMORY[0x270FA0228](v0, 80, 7);
}

uint64_t type metadata accessor for KPCConfiguration()
{
  return self;
}

unint64_t sub_25ACE0ECC()
{
  unint64_t result = qword_26A4B30B8;
  if (!qword_26A4B30B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4B30B8);
  }
  return result;
}

unint64_t sub_25ACE0F20()
{
  unint64_t result = qword_26A4B30C0;
  if (!qword_26A4B30C0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26A4B30C0);
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

uint64_t sub_25ACE0FA8()
{
  swift_release();
  swift_unknownObjectRelease();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_25ACE0FE8()
{
  return sub_25ACE04A0(*(void **)(v0 + 16));
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

uint64_t sub_25ACE1008()
{
  return sub_25ACE0774(v0);
}

uint64_t sub_25ACE1010(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_25ACE1058(unint64_t *a1, uint64_t *a2)
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

uint64_t destroy for KPCError()
{
  return swift_bridgeObjectRelease();
}

uint64_t _s7Recount8KPCErrorVwCP_0(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  uint64_t v3 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for KPCError(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for KPCError(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  uint64_t v3 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for KPCError(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 24)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for KPCError(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)uint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 24) = 1;
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
    *(unsigned char *)(result + 24) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for KPCError()
{
  return &type metadata for KPCError;
}

char *sub_25ACE1218(int a1)
{
  sub_25AD14860();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_25AD145A0();
  swift_bridgeObjectRelease();
  sub_25AD145A0();
  uint64_t result = strerror(a1);
  if (result)
  {
    sub_25AD145B0();
    sub_25AD145A0();
    swift_bridgeObjectRelease();
    return (char *)0x20667265706BLL;
  }
  else
  {
    __break(1u);
  }
  return result;
}

char *sub_25ACE12EC()
{
  return sub_25ACE1218(*v0);
}

unint64_t sub_25ACE12F8()
{
  return 0xD000000000000010;
}

unint64_t sub_25ACE13B4()
{
  return sub_25ACE12F8();
}

uint64_t sub_25ACE13BC()
{
  if (kperf_timer_action_set())
  {
    int v0 = MEMORY[0x261154780]();
    sub_25ACE171C();
    swift_allocError();
    *(_DWORD *)uint64_t v1 = v0;
    unint64_t v2 = "timer-action-set";
LABEL_3:
    *(void *)(v1 + 8) = 0xD000000000000010;
    *(void *)(v1 + 16) = (unint64_t)(v2 - 32) | 0x8000000000000000;
    return swift_willThrow();
  }
  unint64_t v4 = sub_25AD14BC0();
  if ((v4 & 0x8000000000000000) != 0) {
    goto LABEL_16;
  }
  if (!is_mul_ok(v4, 0xF4240uLL))
  {
    __break(1u);
    goto LABEL_15;
  }
  if ((v5 & 0x8000000000000000) != 0)
  {
LABEL_16:
    uint64_t result = sub_25AD14920();
    __break(1u);
    return result;
  }
  unint64_t v6 = 1000000 * v4 + v5 / 0x3B9ACA00;
  if (__CFADD__(1000000 * v4, v5 / 0x3B9ACA00))
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  if (!kperf_ns_to_ticks())
  {
    sub_25ACE197C();
    swift_allocError();
    *uint64_t v8 = v6;
    return swift_willThrow();
  }
  uint64_t result = kperf_timer_period_set();
  if (result)
  {
    int v7 = MEMORY[0x261154780]();
    sub_25ACE171C();
    swift_allocError();
    *(_DWORD *)uint64_t v1 = v7;
    unint64_t v2 = "timer-period-set";
    goto LABEL_3;
  }
  return result;
}

uint64_t sub_25ACE157C(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 16);
  if (v1)
  {
    swift_bridgeObjectRetain();
    if (kperf_kdebug_filter_add_debugid())
    {
LABEL_6:
      int v4 = MEMORY[0x261154780]();
      sub_25ACE171C();
      swift_allocError();
      *(_DWORD *)uint64_t v5 = v4;
      *(void *)(v5 + 8) = 0xD000000000000019;
      *(void *)(v5 + 16) = 0x800000025AD18920;
      swift_willThrow();
    }
    else
    {
      uint64_t v2 = 0;
      uint64_t v3 = v1 - 1;
      while (v3 != v2)
      {
        ++v2;
        if (kperf_kdebug_filter_add_debugid()) {
          goto LABEL_6;
        }
      }
    }
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_25ACE1658()
{
  if (kperf_kdebug_filter_set())
  {
    int v0 = MEMORY[0x261154780]();
    sub_25ACE171C();
    swift_allocError();
    *(_DWORD *)uint64_t v1 = v0;
    uint64_t v2 = "kdebug-filter-set";
  }
  else
  {
    uint64_t result = kperf_kdebug_action_set();
    if (!result) {
      return result;
    }
    int v4 = MEMORY[0x261154780]();
    sub_25ACE171C();
    swift_allocError();
    *(_DWORD *)uint64_t v1 = v4;
    uint64_t v2 = "kdebug-action-set";
  }
  *(void *)(v1 + 8) = 0xD000000000000011;
  *(void *)(v1 + 16) = (unint64_t)(v2 - 32) | 0x8000000000000000;
  return swift_willThrow();
}

unint64_t sub_25ACE171C()
{
  unint64_t result = qword_26A4B3100;
  if (!qword_26A4B3100)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4B3100);
  }
  return result;
}

uint64_t sub_25ACE1770()
{
  uint64_t v0 = kperf_kdebug_filter_get();
  if (v0 || (uint64_t result = kperf_kdebug_filter_create(), (v0 = result) != 0))
  {
    if (kperf_kdebug_action_get())
    {
      uint64_t v0 = MEMORY[0x261154780]();
      sub_25ACE171C();
      swift_allocError();
      *(_DWORD *)uint64_t v2 = v0;
      *(void *)(v2 + 8) = 0xD000000000000011;
      *(void *)(v2 + 16) = 0x800000025AD18940;
      swift_willThrow();
    }
    return v0;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_25ACE1850()
{
  if (kperf_kdebug_filter_get_n_filters())
  {
    if (kperf_kdebug_filter_get_filter())
    {
      int v1 = MEMORY[0x261154780]();
      sub_25ACE171C();
      swift_allocError();
      *(_DWORD *)uint64_t v2 = v1;
      *(void *)(v2 + 8) = 0x746C69662D746567;
      *(void *)(v2 + 16) = 0xEA00000000007265;
      swift_willThrow();
    }
    else
    {
      char v0 = 1;
    }
  }
  else
  {
    char v0 = 0;
  }
  return v0 & 1;
}

unint64_t sub_25ACE197C()
{
  unint64_t result = qword_26A4B3108;
  if (!qword_26A4B3108)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4B3108);
  }
  return result;
}

void *__swift_memcpy8_4(void *result, void *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t storeEnumTagSinglePayload for KPerfTimer(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)unint64_t result = (a2 - 1);
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
  *(unsigned char *)(result + 8) = v3;
  return result;
}

ValueMetadata *type metadata accessor for KPerfTimer()
{
  return &type metadata for KPerfTimer;
}

void *__swift_memcpy8_8(void *result, void *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for KPerfTimer.Err(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 8)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_25ACE1A40()
{
  return 0;
}

ValueMetadata *type metadata accessor for KPerfTimer.Err()
{
  return &type metadata for KPerfTimer.Err;
}

ValueMetadata *type metadata accessor for KPerfError()
{
  return &type metadata for KPerfError;
}

uint64_t sub_25ACE1A74()
{
  return sub_25AD14B90();
}

uint64_t sub_25ACE1B60(uint64_t a1)
{
  int64_t v1 = *(void *)(a1 + 16);
  uint64_t v2 = MEMORY[0x263F8EE78];
  if (!v1) {
    return v2;
  }
  uint64_t v28 = MEMORY[0x263F8EE78];
  sub_25AD0FBC0(0, v1, 0);
  uint64_t v2 = v28;
  uint64_t result = sub_25AD0C038(a1);
  uint64_t v6 = result;
  uint64_t v7 = 0;
  uint64_t v8 = a1 + 64;
  int64_t v25 = v1;
  int v26 = v5;
  uint64_t v27 = a1 + 64;
  while ((v6 & 0x8000000000000000) == 0 && v6 < 1 << *(unsigned char *)(a1 + 32))
  {
    unint64_t v11 = (unint64_t)v6 >> 6;
    if ((*(void *)(v8 + 8 * ((unint64_t)v6 >> 6)) & (1 << v6)) == 0) {
      goto LABEL_23;
    }
    if (*(_DWORD *)(a1 + 36) != v5) {
      goto LABEL_24;
    }
    uint64_t v12 = (uint64_t *)(*(void *)(a1 + 48) + 16 * v6);
    uint64_t v13 = *v12;
    uint64_t v14 = v12[1];
    uint64_t v15 = *(void *)(*(void *)(a1 + 56) + 8 * v6);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B31E8);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_25AD15810;
    *(void *)(inited + 32) = v13;
    *(void *)(inited + 40) = v14;
    *(void *)(inited + 48) = v15;
    swift_bridgeObjectRetain_n();
    unint64_t v17 = sub_25ACFC4C8(inited);
    uint64_t result = swift_bridgeObjectRelease();
    unint64_t v19 = *(void *)(v28 + 16);
    unint64_t v18 = *(void *)(v28 + 24);
    if (v19 >= v18 >> 1) {
      uint64_t result = sub_25AD0FBC0(v18 > 1, v19 + 1, 1);
    }
    *(void *)(v28 + 16) = v19 + 1;
    *(void *)(v28 + 8 * v19 + 32) = v17;
    int64_t v9 = 1 << *(unsigned char *)(a1 + 32);
    if (v6 >= v9) {
      goto LABEL_25;
    }
    uint64_t v8 = a1 + 64;
    uint64_t v20 = *(void *)(v27 + 8 * v11);
    if ((v20 & (1 << v6)) == 0) {
      goto LABEL_26;
    }
    int v5 = v26;
    if (*(_DWORD *)(a1 + 36) != v26) {
      goto LABEL_27;
    }
    unint64_t v21 = v20 & (-2 << (v6 & 0x3F));
    if (v21)
    {
      int64_t v9 = __clz(__rbit64(v21)) | v6 & 0xFFFFFFFFFFFFFFC0;
      int64_t v10 = v25;
    }
    else
    {
      unint64_t v22 = v11 + 1;
      unint64_t v23 = (unint64_t)(v9 + 63) >> 6;
      int64_t v10 = v25;
      if (v11 + 1 < v23)
      {
        unint64_t v24 = *(void *)(v27 + 8 * v22);
        if (v24)
        {
LABEL_20:
          int64_t v9 = __clz(__rbit64(v24)) + (v22 << 6);
        }
        else
        {
          while (v23 - 2 != v11)
          {
            unint64_t v24 = *(void *)(a1 + 80 + 8 * v11++);
            if (v24)
            {
              unint64_t v22 = v11 + 1;
              goto LABEL_20;
            }
          }
        }
      }
    }
    ++v7;
    uint64_t v6 = v9;
    if (v7 == v10) {
      return v2;
    }
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
LABEL_27:
  __break(1u);
  return result;
}

unint64_t sub_25ACE1DC0(uint64_t a1, unint64_t a2)
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
    unint64_t v8 = (unint64_t)sub_25ACE76E0(a1, a2, 10);
    char v10 = v22;
    goto LABEL_39;
  }
  if ((a2 & 0x2000000000000000) == 0)
  {
    if ((a1 & 0x1000000000000000) != 0) {
      uint64_t v7 = (unsigned __int8 *)((a2 & 0xFFFFFFFFFFFFFFFLL) + 32);
    }
    else {
      uint64_t v7 = (unsigned __int8 *)sub_25AD148B0();
    }
    unint64_t v8 = (unint64_t)sub_25ACE77C8(v7, v5, 10);
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
      uint64_t v16 = (unsigned __int8 *)v23 + 2;
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
      uint64_t v20 = (unsigned __int8 *)v23 + 1;
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
          uint64_t v12 = (unsigned __int8 *)v23 + 2;
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

uint64_t sub_25ACE2020()
{
  return 1;
}

uint64_t sub_25ACE2028()
{
  return sub_25AD14B90();
}

uint64_t sub_25ACE2080()
{
  return sub_25AD14570();
}

uint64_t sub_25ACE209C()
{
  return sub_25AD14B90();
}

uint64_t sub_25ACE20F0@<X0>(BOOL *a1@<X8>)
{
  uint64_t v2 = sub_25AD14990();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2 != 0;
  return result;
}

void sub_25ACE2144(void *a1@<X8>)
{
  *a1 = 0x69666E6F4343504BLL;
  a1[1] = 0xE900000000000067;
}

uint64_t sub_25ACE2164()
{
  return 0x69666E6F4343504BLL;
}

uint64_t sub_25ACE2180@<X0>(BOOL *a1@<X8>)
{
  uint64_t v2 = sub_25AD14990();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2 != 0;
  return result;
}

uint64_t sub_25ACE21D8()
{
  return 0;
}

void sub_25ACE21E4(unsigned char *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_25ACE21F0(uint64_t a1)
{
  unint64_t v2 = sub_25ACEA080();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25ACE222C(uint64_t a1)
{
  unint64_t v2 = sub_25ACEA080();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_25ACE2268(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B3250);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25ACEA080();
  sub_25AD14BB0();
  long long v8 = *(_OWORD *)(v2 + 48);
  v11[2] = *(_OWORD *)(v2 + 32);
  v11[3] = v8;
  v11[4] = *(_OWORD *)(v2 + 64);
  uint64_t v12 = *(void *)(v2 + 80);
  long long v9 = *(_OWORD *)(v2 + 16);
  v11[0] = *(_OWORD *)v2;
  v11[1] = v9;
  sub_25ACEA0D4();
  sub_25AD14AA0();
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t sub_25ACE23C8(void *a1)
{
  return sub_25ACE2268(a1);
}

BOOL sub_25ACE23E0(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_25ACE23F4()
{
  return sub_25AD14B90();
}

uint64_t sub_25ACE243C()
{
  return sub_25AD14B80();
}

uint64_t sub_25ACE2468()
{
  return sub_25AD14B90();
}

uint64_t sub_25ACE24AC(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v11[0] = a3;
  v11[1] = a4;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B3240);
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  long long v9 = (char *)v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25ACEA02C();
  sub_25AD14BB0();
  char v14 = 0;
  sub_25AD14AC0();
  if (!v4)
  {
    char v13 = 1;
    sub_25AD14A60();
    char v12 = 2;
    sub_25AD14AC0();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

unint64_t sub_25ACE2644(char a1)
{
  unint64_t result = 0xD00000000000001ALL;
  switch(a1)
  {
    case 1:
      unint64_t result = 0xD000000000000010;
      break;
    case 2:
      unint64_t result = 0xD000000000000021;
      break;
    case 3:
      unint64_t result = 0xD000000000000016;
      break;
    default:
      return result;
  }
  return result;
}

unint64_t sub_25ACE26E0(char a1)
{
  unint64_t result = 0xD00000000000001ALL;
  switch(a1)
  {
    case 1:
      unint64_t result = 0xD000000000000010;
      break;
    case 2:
      unint64_t result = 0xD000000000000021;
      break;
    case 3:
      unint64_t result = 0xD000000000000016;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_25ACE277C(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B3168);
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  char v10 = (char *)&v12 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25ACE6B30();
  sub_25AD14BB0();
  uint64_t v14 = a2;
  char v13 = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B3178);
  sub_25ACE8A98(&qword_26A4B3180, &qword_26A4B3178, (void (*)(void))sub_25ACE6B84);
  sub_25AD14AA0();
  if (!v3)
  {
    uint64_t v14 = a3;
    char v13 = 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B3158);
    sub_25ACE6AC4();
    sub_25AD14AA0();
    LOBYTE(v14) = 2;
    sub_25AD14A80();
    LOBYTE(v14) = 3;
    sub_25AD14A80();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

unint64_t sub_25ACE29C0(char a1)
{
  unint64_t result = 0x6D615372656D6954;
  switch(a1)
  {
    case 1:
    case 3:
      unint64_t result = 0xD000000000000011;
      break;
    case 2:
      unint64_t result = 0x65646F435F43504BLL;
      break;
    case 4:
      unint64_t result = 0xD000000000000010;
      break;
    case 5:
      unint64_t result = 0x6C706D6153494D50;
      break;
    case 6:
      unint64_t result = 0xD000000000000017;
      break;
    default:
      return result;
  }
  return result;
}

unint64_t sub_25ACE2AB8(char a1)
{
  unint64_t result = 0x6D615372656D6954;
  switch(a1)
  {
    case 1:
    case 3:
      unint64_t result = 0xD000000000000011;
      break;
    case 2:
      unint64_t result = 0x65646F435F43504BLL;
      break;
    case 4:
      unint64_t result = 0xD000000000000010;
      break;
    case 5:
      unint64_t result = 0x6C706D6153494D50;
      break;
    case 6:
      unint64_t result = 0xD000000000000017;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_25ACE2BB0()
{
  uint64_t v1 = 1701667182;
  if (*v0 != 1) {
    uint64_t v1 = 0x646F69726570;
  }
  if (*v0) {
    return v1;
  }
  else {
    return 1701080931;
  }
}

uint64_t sub_25ACE2BF8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_25ACE9E64(a1, a2);
  *a3 = result;
  return result;
}

void sub_25ACE2C20(unsigned char *a1@<X8>)
{
  *a1 = 3;
}

uint64_t sub_25ACE2C2C(uint64_t a1)
{
  unint64_t v2 = sub_25ACEA02C();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25ACE2C68(uint64_t a1)
{
  unint64_t v2 = sub_25ACEA02C();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_25ACE2CA4(void *a1)
{
  return sub_25ACE24AC(a1, *v1, v1[1], v1[2]);
}

uint64_t sub_25ACE2CC4(char *a1, char *a2)
{
  return sub_25ACFBA10(*a1, *a2);
}

uint64_t sub_25ACE2CD0()
{
  return sub_25ACE1A74();
}

uint64_t sub_25ACE2CD8()
{
  return sub_25ACFB218();
}

uint64_t sub_25ACE2CE0()
{
  return sub_25ACFB550();
}

uint64_t sub_25ACE2CE8@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_25ACE9F94();
  *a1 = result;
  return result;
}

unint64_t sub_25ACE2D18@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = sub_25ACE2644(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

unint64_t sub_25ACE2D44()
{
  return sub_25ACE26E0(*v0);
}

uint64_t sub_25ACE2D4C@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_25ACE9F94();
  *a1 = result;
  return result;
}

void sub_25ACE2D74(unsigned char *a1@<X8>)
{
  *a1 = 4;
}

uint64_t sub_25ACE2D80(uint64_t a1)
{
  unint64_t v2 = sub_25ACE6B30();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25ACE2DBC(uint64_t a1)
{
  unint64_t v2 = sub_25ACE6B30();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_25ACE2DF8(void *a1)
{
  return sub_25ACE277C(a1, *v1, v1[1]);
}

uint64_t sub_25ACE2E18(unsigned __int8 *a1, char *a2)
{
  return sub_25ACFBB8C(*a1, *a2);
}

uint64_t sub_25ACE2E24()
{
  return sub_25ACFB414();
}

uint64_t sub_25ACE2E30()
{
  return sub_25ACFB2E8();
}

uint64_t sub_25ACE2E38()
{
  return sub_25ACFB414();
}

uint64_t sub_25ACE2E40@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_25ACE9FE0();
  *a1 = result;
  return result;
}

unint64_t sub_25ACE2E70@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = sub_25ACE29C0(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

unint64_t sub_25ACE2E9C()
{
  return sub_25ACE2AB8(*v0);
}

uint64_t sub_25ACE2EA4@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_25ACE9FE0();
  *a1 = result;
  return result;
}

void sub_25ACE2ECC(unsigned char *a1@<X8>)
{
  *a1 = 7;
}

uint64_t sub_25ACE2ED8(uint64_t a1)
{
  unint64_t v2 = sub_25ACE69B8();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25ACE2F14(uint64_t a1)
{
  unint64_t v2 = sub_25ACE69B8();
  return MEMORY[0x270FA00B8](a1, v2);
}

unint64_t sub_25ACE2F50()
{
  sub_25ACDF604(v0, (uint64_t)&v2);
  sub_25AD14860();
  swift_bridgeObjectRelease();
  sub_25AD145A0();
  sub_25AD145A0();
  sub_25AD14AE0();
  sub_25AD145A0();
  swift_bridgeObjectRelease();
  sub_25AD145A0();
  sub_25AD145A0();
  return 0xD000000000000011;
}

unint64_t sub_25ACE3064()
{
  sub_25ACDF604(v0, (uint64_t)v2);
  return sub_25ACE2F50();
}

uint64_t sub_25ACE309C(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B3130);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25ACE69B8();
  sub_25AD14BB0();
  LOBYTE(v12) = 4;
  sub_25AD14AB0();
  if (!v2)
  {
    LOBYTE(v12) = 3;
    sub_25AD14AB0();
    LOBYTE(v12) = 0;
    sub_25AD14A90();
    LOBYTE(v12) = 5;
    sub_25AD14A90();
    LOBYTE(v12) = 1;
    sub_25AD14A70();
    sub_25ACE6A0C(v3, (uint64_t)v15, &qword_26A4B3140);
    sub_25ACE6A0C((uint64_t)v15, (uint64_t)&v16, &qword_26A4B3140);
    if (v16)
    {
      *(void *)&long long v12 = v16;
      char v11 = 2;
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B3158);
      sub_25ACE6AC4();
      sub_25AD14AA0();
    }
    sub_25ACE6A0C(v3 + 56, (uint64_t)v14, &qword_26A4B3148);
    sub_25ACE6A0C((uint64_t)v14, (uint64_t)v17, &qword_26A4B3148);
    if (*(void *)&v17[0])
    {
      long long v12 = v17[0];
      long long v13 = v17[1];
      char v11 = 6;
      sub_25ACE6A70();
      sub_25AD14AA0();
    }
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t sub_25ACE336C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6)
{
  unint64_t v7 = a6 >> 62;
  uint64_t v9 = a4;
  switch(a6 >> 62)
  {
    case 1uLL:
      if ((int)a5 > a5 >> 32)
      {
        __break(1u);
LABEL_26:
        __break(1u);
        goto LABEL_27;
      }
      sub_25ACDF450(a5, a6);
      uint64_t v10 = sub_25AD14270();
      if (v10)
      {
        uint64_t v11 = sub_25AD14290();
        if (__OFSUB__((int)a5, v11))
        {
LABEL_28:
          __break(1u);
LABEL_29:
          __break(1u);
LABEL_30:
          __break(1u);
LABEL_31:
          __break(1u);
        }
        v10 += (int)a5 - v11;
      }
      uint64_t v9 = a4;
      sub_25AD14280();
      sub_25ACDF56C(a5, a6);
      if (!v10)
      {
LABEL_32:
        __break(1u);
        JUMPOUT(0x25ACE35F4);
      }
      if (__OFSUB__(HIDWORD(a5), a5))
      {
LABEL_27:
        __break(1u);
        goto LABEL_28;
      }
LABEL_14:
      uint64_t result = ktrace_file_append_chunk();
      if (!result)
      {
        int v16 = MEMORY[0x261154780]();
        if (strerror(v16))
        {
          uint64_t v17 = sub_25AD145B0();
          unint64_t v19 = v18;
        }
        else
        {
          unint64_t v19 = 0xE300000000000000;
          uint64_t v17 = 4144959;
        }
        uint64_t v20 = 0;
        switch((int)v7)
        {
          case 0:
            uint64_t v20 = BYTE6(a6);
            goto LABEL_23;
          case 1:
            if (__OFSUB__(HIDWORD(a5), a5)) {
              goto LABEL_30;
            }
            uint64_t v20 = HIDWORD(a5) - (int)a5;
LABEL_23:
            sub_25ACE6C68();
            swift_allocError();
            *unint64_t v23 = a3;
            v23[1] = v9;
            v23[2] = v17;
            void v23[3] = v19;
            v23[4] = v20;
            swift_bridgeObjectRetain();
            uint64_t result = swift_willThrow();
            break;
          case 2:
            uint64_t v22 = *(void *)(a5 + 16);
            uint64_t v21 = *(void *)(a5 + 24);
            uint64_t v20 = v21 - v22;
            if (!__OFSUB__(v21, v22)) {
              goto LABEL_23;
            }
            goto LABEL_31;
          case 3:
            goto LABEL_23;
          default:
            JUMPOUT(0);
        }
      }
      return result;
    case 2uLL:
      uint64_t v12 = *(void *)(a5 + 16);
      swift_retain();
      swift_retain();
      uint64_t v13 = sub_25AD14270();
      if (!v13) {
        goto LABEL_12;
      }
      uint64_t v14 = sub_25AD14290();
      if (__OFSUB__(v12, v14)) {
        goto LABEL_29;
      }
      v13 += v12 - v14;
LABEL_12:
      uint64_t v9 = a4;
      sub_25AD14280();
      swift_release();
      swift_release();
      if (!v13) {
        goto LABEL_32;
      }
      if (!__OFSUB__(*(void *)(a5 + 24), *(void *)(a5 + 16))) {
        goto LABEL_14;
      }
      goto LABEL_26;
    default:
      goto LABEL_14;
  }
}

uint64_t sub_25ACE3614(void *a1)
{
  return sub_25ACE309C(a1);
}

uint64_t sub_25ACE3660(void *a1, uint64_t a2, uint64_t a3)
{
  if (!a3)
  {
    unint64_t v7 = &unk_270894200;
LABEL_5:
    uint64_t v8 = a1[6];
    uint64_t v9 = a1[7];
    int64_t v4 = a1[8];
    swift_retain();
    sub_25ACF4B38(v8, v9, v4, (uint64_t)v7, a2, v14);
    if (!v3)
    {
      uint64_t v17 = v15;
      uint64_t v10 = sub_25ACF4DB8(v14[1], v14[3], v15);
      uint64_t v12 = v11;
      uint64_t v16 = v14[0];
      sub_25ACE8B90((uint64_t)&v16);
      sub_25ACE8B90((uint64_t)&v17);
      int64_t v4 = sub_25ACF0C58(v8, v9, v4, v10, v12);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    return v4;
  }
  if (a3 == 1)
  {
    unint64_t v7 = &unk_2708942A0;
    goto LABEL_5;
  }
  swift_retain();
  sub_25ACE8424(a3, a2);
  swift_release();
  if (!v3) {
    return 2;
  }
  return v4;
}

unint64_t sub_25ACE37AC(uint64_t a1, uint64_t a2, unint64_t a3)
{
  if (!(a3 >> 62))
  {
    MEMORY[0x261155480](a3);
    sub_25AD14860();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    uint64_t v6 = a1;
    sub_25AD145A0();
    MEMORY[0x261155480](a3);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B31A0);
    sub_25AD14530();
    sub_25AD145A0();
    swift_bridgeObjectRelease();
    MEMORY[0x261155470](a3);
    return v6;
  }
  if (a3 >> 62 == 1)
  {
    sub_25AD14860();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    uint64_t v6 = a1;
    sub_25AD145A0();
    return v6;
  }
  return 0xD000000000000027;
}

unint64_t sub_25ACE3900()
{
  return sub_25ACE37AC(*(void *)v0, *(void *)(v0 + 8), *(void *)(v0 + 16));
}

uint64_t *sub_25ACE390C@<X0>(uint64_t *result@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X2>, void *a4@<X8>)
{
  uint64_t v7 = *result;
  unint64_t v6 = result[1];
  uint64_t v8 = *(void *)(a2 + 16);
  if (*(void *)(v8 + 16))
  {
    swift_bridgeObjectRetain();
    unint64_t v9 = sub_25AD0A230(v7, v6);
    if (v10)
    {
      uint64_t v11 = *(void *)(*(void *)(v8 + 56) + 32 * v9 + 16);
      uint64_t result = (uint64_t *)swift_bridgeObjectRelease();
      *a4 = v11;
      return result;
    }
    uint64_t result = (uint64_t *)swift_bridgeObjectRelease();
  }
  uint64_t v12 = HIBYTE(v6) & 0xF;
  uint64_t v13 = v7 & 0xFFFFFFFFFFFFLL;
  if ((v6 & 0x2000000000000000) != 0) {
    uint64_t v14 = HIBYTE(v6) & 0xF;
  }
  else {
    uint64_t v14 = v7 & 0xFFFFFFFFFFFFLL;
  }
  if (!v14) {
    goto LABEL_64;
  }
  if ((v6 & 0x1000000000000000) != 0)
  {
    swift_bridgeObjectRetain();
    unint64_t v18 = (unint64_t)sub_25ACE76E0(v7, v6, 10);
    char v33 = v32;
    uint64_t result = (uint64_t *)swift_bridgeObjectRelease();
    if ((v33 & 1) == 0) {
      goto LABEL_43;
    }
    goto LABEL_64;
  }
  if ((v6 & 0x2000000000000000) == 0)
  {
    if ((v7 & 0x1000000000000000) != 0) {
      uint64_t v15 = (unsigned __int8 *)((v6 & 0xFFFFFFFFFFFFFFFLL) + 32);
    }
    else {
      uint64_t v15 = (unsigned __int8 *)sub_25AD148B0();
    }
    uint64_t result = (uint64_t *)sub_25ACE77C8(v15, v13, 10);
    if ((v16 & 1) == 0)
    {
      *a4 = result;
      return result;
    }
    goto LABEL_64;
  }
  v36[0] = v7;
  v36[1] = v6 & 0xFFFFFFFFFFFFFFLL;
  if (v7 == 43)
  {
    if (!v12) {
      goto LABEL_68;
    }
    if (v12 == 1) {
      goto LABEL_66;
    }
    if ((BYTE1(v7) - 48) > 9u) {
      goto LABEL_38;
    }
    unint64_t v18 = (BYTE1(v7) - 48);
    if (v12 != 2)
    {
      if ((BYTE2(v7) - 48) > 9u) {
        goto LABEL_38;
      }
      unint64_t v18 = 10 * (BYTE1(v7) - 48) + (BYTE2(v7) - 48);
      uint64_t v21 = v12 - 3;
      if (v12 != 3)
      {
        uint64_t v22 = (unsigned __int8 *)v36 + 3;
        while (1)
        {
          unsigned int v23 = *v22 - 48;
          if (v23 > 9) {
            goto LABEL_38;
          }
          if (!is_mul_ok(v18, 0xAuLL)) {
            goto LABEL_38;
          }
          BOOL v19 = __CFADD__(10 * v18, v23);
          unint64_t v18 = 10 * v18 + v23;
          if (v19) {
            goto LABEL_38;
          }
          LOBYTE(v12) = 0;
          ++v22;
          if (!--v21) {
            goto LABEL_42;
          }
        }
      }
    }
LABEL_41:
    LOBYTE(v12) = 0;
    goto LABEL_42;
  }
  if (v7 != 45)
  {
    if (!v12 || (v7 - 48) > 9u) {
      goto LABEL_38;
    }
    unint64_t v18 = (v7 - 48);
    if (v12 != 1)
    {
      if ((BYTE1(v7) - 48) > 9u) {
        goto LABEL_38;
      }
      unint64_t v18 = 10 * (v7 - 48) + (BYTE1(v7) - 48);
      uint64_t v24 = v12 - 2;
      if (v12 != 2)
      {
        int64_t v25 = (unsigned __int8 *)v36 + 2;
        while (1)
        {
          unsigned int v26 = *v25 - 48;
          if (v26 > 9) {
            goto LABEL_38;
          }
          if (!is_mul_ok(v18, 0xAuLL)) {
            goto LABEL_38;
          }
          BOOL v19 = __CFADD__(10 * v18, v26);
          unint64_t v18 = 10 * v18 + v26;
          if (v19) {
            goto LABEL_38;
          }
          LOBYTE(v12) = 0;
          ++v25;
          if (!--v24) {
            goto LABEL_42;
          }
        }
      }
    }
    goto LABEL_41;
  }
  if (v12)
  {
    if (v12 != 1)
    {
      unsigned __int8 v17 = BYTE1(v7) - 48;
      if ((BYTE1(v7) - 48) <= 9u)
      {
        unint64_t v18 = 0;
        BOOL v19 = v17 == 0;
        unint64_t v20 = -(uint64_t)v17;
        if (!v19) {
          goto LABEL_39;
        }
        if (v12 == 2)
        {
          LOBYTE(v12) = 0;
          unint64_t v18 = v20;
          goto LABEL_42;
        }
        unsigned __int8 v27 = BYTE2(v7) - 48;
        if ((BYTE2(v7) - 48) <= 9u && is_mul_ok(v20, 0xAuLL))
        {
          unint64_t v28 = 10 * v20;
          unint64_t v18 = v28 - v27;
          if (v28 >= v27)
          {
            uint64_t v29 = v12 - 3;
            if (v12 != 3)
            {
              BOOL v30 = (unsigned __int8 *)v36 + 3;
              while (1)
              {
                unsigned int v31 = *v30 - 48;
                if (v31 > 9) {
                  goto LABEL_38;
                }
                if (!is_mul_ok(v18, 0xAuLL)) {
                  goto LABEL_38;
                }
                BOOL v19 = 10 * v18 >= v31;
                unint64_t v18 = 10 * v18 - v31;
                if (!v19) {
                  goto LABEL_38;
                }
                LOBYTE(v12) = 0;
                ++v30;
                if (!--v29) {
                  goto LABEL_42;
                }
              }
            }
            goto LABEL_41;
          }
        }
      }
LABEL_38:
      unint64_t v18 = 0;
LABEL_39:
      LOBYTE(v12) = 1;
      goto LABEL_42;
    }
LABEL_66:
    unint64_t v18 = 0;
LABEL_42:
    if ((v12 & 1) == 0)
    {
LABEL_43:
      *a4 = v18;
      return result;
    }
LABEL_64:
    sub_25ACE7F30();
    uint64_t v34 = swift_allocError();
    *uint64_t v35 = v7;
    v35[1] = v6;
    v35[2] = 0x4000000000000000;
    swift_bridgeObjectRetain();
    uint64_t result = (uint64_t *)swift_willThrow();
    *a3 = v34;
    return result;
  }
  __break(1u);
LABEL_68:
  __break(1u);
  return result;
}

uint64_t sub_25ACE3CB4(void **a1, void **a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = *a2;
  if (!v2) {
    return !v3;
  }
  if (v2 == (void *)1) {
    return v3 == (void *)1;
  }
  if ((unint64_t)v3 < 2) {
    return 0;
  }
  return sub_25ACE6F44(v2, v3);
}

uint64_t sub_25ACE3CF4()
{
  uint64_t v1 = *v0;
  if (!*v0) {
    return 0x746963696C706D69;
  }
  if (v1 == 1) {
    return 0x65636172544150;
  }
  MEMORY[0x2611549E0](v1, MEMORY[0x263F8D310]);
  sub_25AD145A0();
  swift_bridgeObjectRelease();
  sub_25AD145A0();
  return 0x28206D6F74737563;
}

uint64_t sub_25ACE3DA4(uint64_t a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = sub_25AD14420();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25AD14410();
  uint64_t v9 = v3 + OBJC_IVAR____TtC7Recount9AwimboPMC_logger;
  (*(void (**)(uint64_t, char *, uint64_t))(v6 + 32))(v3 + OBJC_IVAR____TtC7Recount9AwimboPMC_logger, v8, v5);
  long long v10 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)(v3 + 56) = *(_OWORD *)(a1 + 32);
  *(_OWORD *)(v3 + 72) = v10;
  *(_OWORD *)(v3 + 88) = *(_OWORD *)(a1 + 64);
  *(void *)(v3 + 104) = *(void *)(a1 + 80);
  long long v11 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(v3 + 24) = *(_OWORD *)a1;
  *(_OWORD *)(v3 + 40) = v11;
  sub_25ACE6A0C(a1, (uint64_t)v24, &qword_26A4B3140);
  uint64_t result = sub_25ACE6A0C((uint64_t)v24, (uint64_t)&v25, &qword_26A4B3140);
  uint64_t v13 = v25;
  if (v25)
  {
    type metadata accessor for KPCSet();
    swift_allocObject();
    sub_25ACDF3CC((void *)a1);
    sub_25ACE8B64((uint64_t)v24);
    uint64_t v14 = sub_25ACDF878(3, v13, 0, 0);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B31F8);
    uint64_t v15 = swift_allocObject();
    *(_OWORD *)(v15 + 16) = xmmword_25AD15820;
    *(void *)(v15 + 32) = v14;
    unint64_t v23 = v15;
    sub_25AD146A0();
    unint64_t v16 = v23;
    type metadata accessor for KPCConfiguration();
    swift_allocObject();
    swift_retain();
    uint64_t v17 = sub_25ACDFF9C(v16, 0, 0, 1);
    v22[1] = v2;
    if (v2)
    {
      sub_25ACDF4E8((void *)a1);
      swift_release();
      uint64_t v18 = *(void *)(v3 + 64);
      unint64_t v19 = *(void *)(v3 + 72);
      v22[0] = v9;
      uint64_t v20 = *(void *)(v3 + 80);
      swift_bridgeObjectRelease();
      sub_25ACDF558(v18, v19);
      sub_25ACDF5C4(v20);
      (*(void (**)(void, uint64_t))(v6 + 8))(v22[0], v5);
      type metadata accessor for AwimboPMC(0);
      swift_deallocPartialClassInstance();
    }
    else
    {
      uint64_t v21 = v17;
      sub_25ACDF4E8((void *)a1);
      swift_release();
      *(void *)(v3 + 16) = v21;
    }
    return v3;
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_25ACE40B4()
{
  uint64_t v2 = v1;
  uint64_t v3 = v0;
  uint64_t v61 = *MEMORY[0x263EF8340];
  int v60 = 0;
  if (kperf_sample_get())
  {
    int v4 = MEMORY[0x261154780]();
    sub_25ACE171C();
    swift_allocError();
    *(_DWORD *)uint64_t v5 = v4;
    *(void *)(v5 + 8) = 0x672D656C706D6173;
    *(void *)(v5 + 16) = 0xEA00000000007465;
    swift_willThrow();
    return;
  }
  int v6 = *(unsigned __int8 *)(v0 + 49);
  if (v6 == 1)
  {
    sub_25ACE1770();
    if (v1) {
      return;
    }
    char v7 = sub_25ACE1850();
    uint64_t v2 = 0;
    if ((v7 & 1) == 0)
    {
      uint64_t aBlock = MEMORY[0x263F8EE78];
      sub_25AD0FBF0(0, 4, 0);
      uint64_t v15 = aBlock;
      int v16 = dword_270894360;
      unint64_t v18 = *(void *)(aBlock + 16);
      unint64_t v17 = *(void *)(aBlock + 24);
      int64_t v19 = v17 >> 1;
      unint64_t v20 = v18 + 1;
      if (v17 >> 1 <= v18)
      {
        int v47 = dword_270894360;
        sub_25AD0FBF0(v17 > 1, v18 + 1, 1);
        int v16 = v47;
        unint64_t v20 = v18 + 1;
        uint64_t v15 = aBlock;
        unint64_t v17 = *(void *)(aBlock + 24);
        int64_t v19 = v17 >> 1;
      }
      *(void *)(v15 + 16) = v20;
      *(_DWORD *)(v15 + 4 * v18 + 32) = (4 * v16) | 0x1400000;
      int v21 = dword_270894364;
      int64_t v22 = v18 + 2;
      if (v19 < v22)
      {
        unint64_t v51 = v20;
        int v48 = dword_270894364;
        sub_25AD0FBF0(v17 > 1, v22, 1);
        int v21 = v48;
        unint64_t v20 = v51;
        uint64_t v15 = aBlock;
      }
      *(void *)(v15 + 16) = v22;
      *(_DWORD *)(v15 + 4 * v20 + 32) = (4 * v21) | 0x1400000;
      int v23 = dword_270894368;
      unint64_t v25 = *(void *)(v15 + 16);
      unint64_t v24 = *(void *)(v15 + 24);
      unint64_t v26 = v25 + 1;
      if (v25 >= v24 >> 1)
      {
        int v49 = dword_270894368;
        sub_25AD0FBF0(v24 > 1, v25 + 1, 1);
        int v23 = v49;
        unint64_t v26 = v25 + 1;
      }
      uint64_t v27 = aBlock;
      *(void *)(aBlock + 16) = v26;
      *(_DWORD *)(v27 + 4 * v25 + 32) = (4 * v23) | 0x1400000;
      int v28 = dword_27089436C;
      unint64_t v29 = *(void *)(v27 + 24);
      unint64_t v30 = v25 + 2;
      if ((uint64_t)(v25 + 2) > (uint64_t)(v29 >> 1))
      {
        unint64_t v50 = v25 + 2;
        unint64_t v52 = v26;
        int64_t v45 = v25 + 2;
        int v46 = dword_27089436C;
        sub_25AD0FBF0(v29 > 1, v45, 1);
        int v28 = v46;
        unint64_t v30 = v50;
        unint64_t v26 = v52;
        uint64_t v27 = aBlock;
      }
      *(void *)(v27 + 16) = v30;
      *(_DWORD *)(v27 + 4 * v26 + 32) = (4 * v28) | 0x1400000;
      sub_25ACE157C(v27);
      if (!*(void *)(v27 + 16)) {
        __break(1u);
      }
      swift_release();
      uint64_t v58 = nullsub_1;
      uint64_t v59 = 0;
      uint64_t aBlock = MEMORY[0x263EF8330];
      uint64_t v55 = 1107296256;
      unint64_t v56 = sub_25ACE48BC;
      char v57 = &block_descriptor_22;
      uint64_t v41 = _Block_copy(&aBlock);
      ktrace_events_single();
      _Block_release(v41);
    }
    LODWORD(aBlock) = 0;
    if (kperf_action_samplers_get() && kperf_action_count_set()) {
      goto LABEL_50;
    }
    if ((aBlock & 0x20) == 0 && kperf_action_samplers_set()) {
      goto LABEL_57;
    }
    sub_25ACE1658();
  }
  if (*(unsigned char *)(v3 + 48)) {
    goto LABEL_9;
  }
  if (kperf_timer_count_get())
  {
    int v9 = MEMORY[0x261154780]();
    sub_25ACE171C();
    swift_allocError();
    *(_DWORD *)uint64_t v10 = v9;
    unint64_t v11 = 0x6F632D72656D6974;
    uint64_t v12 = 0x65672D746E75;
LABEL_13:
    unint64_t v13 = v12 & 0xFFFFFFFFFFFFLL | 0xEF74000000000000;
LABEL_14:
    *(void *)(v10 + 8) = v11;
    *(void *)(v10 + 16) = v13;
LABEL_15:
    swift_willThrow();
    goto LABEL_16;
  }
  if (kperf_timer_count_set())
  {
    int v14 = MEMORY[0x261154780]();
    sub_25ACE171C();
    swift_allocError();
    *(_DWORD *)uint64_t v10 = v14;
    unint64_t v11 = 0x6F632D72656D6974;
    uint64_t v12 = 0x65732D746E75;
    goto LABEL_13;
  }
  uint64_t v53 = MEMORY[0x263F8EE78];
  sub_25AD0FCB0(0, 8, 0);
  for (uint64_t i = 0; i != 8; ++i)
  {
    if (kperf_timer_action_get())
    {
      int v37 = MEMORY[0x261154780]();
      sub_25ACE171C();
      swift_allocError();
      *(_DWORD *)uint64_t v38 = v37;
      *(void *)(v38 + 8) = 0xD000000000000010;
      *(void *)(v38 + 16) = 0x800000025AD18B40;
      swift_willThrow();
      swift_release();
      goto LABEL_16;
    }
    unint64_t v33 = *(void *)(v53 + 16);
    unint64_t v32 = *(void *)(v53 + 24);
    unint64_t v34 = v33 + 1;
    if (v33 >= v32 >> 1)
    {
      sub_25AD0FCB0(v32 > 1, v33 + 1, 1);
      unint64_t v34 = v33 + 1;
    }
    *(void *)(v53 + 16) = v34;
    uint64_t v35 = (unsigned int *)(v53 + 32);
    uint64_t v36 = (_DWORD *)(v53 + 32 + 8 * v33);
    *uint64_t v36 = i;
    v36[1] = 0;
  }
  if (*(_DWORD *)(v53 + 36))
  {
    if (!v33)
    {
LABEL_42:
      swift_release();
      sub_25ACE7F30();
      swift_allocError();
      void *v39 = 0;
      v39[1] = 0;
      v39[2] = 0x8000000000000000;
      goto LABEL_15;
    }
    uint64_t v35 = (unsigned int *)(v53 + 40);
    while (v35[1])
    {
      v35 += 2;
      if (!--v33) {
        goto LABEL_42;
      }
    }
  }
  unsigned int v40 = *v35;
  swift_release();
  uint64_t aBlock = v40;
  if ((v6 & 1) == 0)
  {
    if (kperf_action_samplers_get() && kperf_action_count_set())
    {
LABEL_50:
      int v42 = MEMORY[0x261154780]();
      sub_25ACE171C();
      swift_allocError();
      *(_DWORD *)uint64_t v10 = v42;
      unint64_t v11 = 0xD000000000000010;
      uint64_t v43 = "action-count-set";
LABEL_58:
      unint64_t v13 = (unint64_t)(v43 - 32) | 0x8000000000000000;
      goto LABEL_14;
    }
    if (kperf_action_samplers_set())
    {
LABEL_57:
      int v44 = MEMORY[0x261154780]();
      sub_25ACE171C();
      swift_allocError();
      *(_DWORD *)uint64_t v10 = v44;
      unint64_t v11 = 0xD000000000000013;
      uint64_t v43 = "action-samplers-set";
      goto LABEL_58;
    }
  }
  sub_25ACE13BC();
  if (v2)
  {
LABEL_16:
    if (v60) {
      goto LABEL_17;
    }
    return;
  }
LABEL_9:
  uint64_t v58 = nullsub_1;
  uint64_t v59 = 0;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v55 = 1107296256;
  unint64_t v56 = sub_25ACE48BC;
  char v57 = &block_descriptor_19;
  uint64_t v8 = _Block_copy(&aBlock);
  ktrace_events_range();
  _Block_release(v8);
  if (v60) {
LABEL_17:
  }
    kperf_sample_on();
}

uint64_t sub_25ACE48BC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v3(a2);
  return swift_release();
}

uint64_t sub_25ACE4910(uint64_t a1)
{
  return sub_25ACE6170(a1);
}

uint64_t sub_25ACE4928()
{
  swift_release();
  uint64_t v1 = v0[8];
  unint64_t v2 = v0[9];
  uint64_t v3 = v0[10];
  swift_bridgeObjectRelease();
  sub_25ACDF558(v1, v2);
  sub_25ACDF5C4(v3);
  int v4 = (char *)v0 + OBJC_IVAR____TtC7Recount9AwimboPMC_logger;
  uint64_t v5 = sub_25AD14420();
  (*(void (**)(char *, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  uint64_t v6 = *(unsigned int *)(*v0 + 48);
  uint64_t v7 = *(unsigned __int16 *)(*v0 + 52);
  return MEMORY[0x270FA0228](v0, v6, v7);
}

uint64_t sub_25ACE4A1C()
{
  return type metadata accessor for AwimboPMC(0);
}

uint64_t type metadata accessor for AwimboPMC(uint64_t a1)
{
  return sub_25ACE64D8(a1, (uint64_t *)&unk_26A4B3110);
}

uint64_t sub_25ACE4A44()
{
  uint64_t result = sub_25AD14420();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

void sub_25ACE4AEC()
{
}

uint64_t sub_25ACE4B10()
{
  return sub_25ACE08DC(0);
}

uint64_t sub_25ACE4B3C()
{
  return sub_25ACE0D68();
}

uint64_t sub_25ACE4B64(uint64_t a1)
{
  return sub_25ACE4910(a1);
}

unint64_t sub_25ACE4B88(uint64_t a1, uint64_t a2, unint64_t a3)
{
  if (!(a3 >> 62))
  {
    MEMORY[0x261155480](a3);
    sub_25AD14860();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    uint64_t v6 = a1;
    sub_25AD145A0();
    MEMORY[0x261155480](a3);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B31A0);
    sub_25AD14530();
    sub_25AD145A0();
    swift_bridgeObjectRelease();
    MEMORY[0x261155470](a3);
    return v6;
  }
  if (a3 >> 62 == 1)
  {
    sub_25AD14860();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    uint64_t v6 = a1;
    sub_25AD145A0();
    return v6;
  }
  return 0xD000000000000020;
}

unint64_t sub_25ACE4CDC()
{
  return sub_25ACE4B88(*(void *)v0, *(void *)(v0 + 8), *(void *)(v0 + 16));
}

void sub_25ACE4CE8()
{
  qword_26A4B9AE0 = (uint64_t)&unk_2708940C0;
}

uint64_t sub_25ACE4CFC()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

BOOL sub_25ACE4D2C(long long *a1, long long *a2)
{
  long long v2 = a1[1];
  long long v5 = *a1;
  v6[0] = v2;
  *(_OWORD *)((char *)v6 + 12) = *(long long *)((char *)a1 + 28);
  long long v3 = a2[1];
  long long v7 = *a2;
  v8[0] = v3;
  *(_OWORD *)((char *)v8 + 12) = *(long long *)((char *)a2 + 28);
  return sub_25ACE823C((uint64_t)&v5, (uint64_t)&v7);
}

uint64_t sub_25ACE4D78(uint64_t a1, uint64_t a2, char a3)
{
  double v3 = *(double *)&a2;
  if (a3) {
    double v3 = *(double *)&a2 / (double)a1;
  }
  double v4 = floor(v3);
  double v7 = fmod(v3, 1.0);
  if (v4 <= -9.22337204e18)
  {
    __break(1u);
    goto LABEL_13;
  }
  if (v4 >= 9.22337204e18)
  {
LABEL_13:
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  if ((*(void *)&v4 & 0x7FF0000000000000) == 0x7FF0000000000000) {
    goto LABEL_14;
  }
  double v8 = v7 * 1.0e18;
  if ((*(void *)&v8 & 0x7FF0000000000000) == 0x7FF0000000000000) {
    goto LABEL_14;
  }
  if (v8 <= -9.22337204e18)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  if (v8 >= 9.22337204e18)
  {
LABEL_16:
    __break(1u);
    return MEMORY[0x270F9FF90](v5, v6);
  }
  uint64_t v5 = (uint64_t)v4;
  uint64_t v6 = (uint64_t)v8;
  return MEMORY[0x270F9FF90](v5, v6);
}

uint64_t sub_25ACE4E54(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5)
{
  uint64_t v7 = v6;
  int64_t v8 = v5;
  uint64_t v129 = a3;
  uint64_t v126 = a2;
  uint64_t v127 = a1;
  uint64_t v11 = sub_25AD148A0();
  uint64_t v130 = *(void *)(v11 - 8);
  v131 = (uint8_t *)v11;
  MEMORY[0x270FA5388](v11);
  unint64_t v13 = (char *)&v117 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_25AD14420();
  uint64_t v15 = *(void *)(v14 - 8);
  MEMORY[0x270FA5388](v14);
  *(void *)(v5 + 112) = 0;
  sub_25AD14410();
  uint64_t v123 = v15;
  int v16 = *(void (**)(void))(v15 + 32);
  int64_t v125 = v5 + OBJC_IVAR____TtC7Recount9AwimboPMI_logger;
  uint64_t v124 = v14;
  v16();
  unint64_t v128 = a5;
  if (a5 >> 60 == 15)
  {
    uint64_t v17 = a4;
    if (qword_26A4B2F20 != -1) {
LABEL_124:
    }
      swift_once();
    uint64_t v18 = qword_26A4B9AE0;
    swift_bridgeObjectRetain();
    int v19 = 0;
    uint64_t v20 = 0x3FE0000000000000;
  }
  else
  {
    sub_25AD141D0();
    swift_allocObject();
    uint64_t v17 = a5;
    sub_25ACDF450(a4, a5);
    uint64_t v21 = sub_25AD141C0();
    sub_25AD14180();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B31C8);
    sub_25ACE8A24();
    uint64_t v122 = v21;
    sub_25AD141B0();
    uint64_t v22 = a4;
    if (v6)
    {
      uint64_t v133 = v6;
      MEMORY[0x261155480](v6);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B31A0);
      int v23 = v131;
      if ((swift_dynamicCast() & 1) == 0)
      {
        uint64_t v25 = a4;
        unint64_t v26 = v128;
        sub_25ACDF558(v25, v128);
        swift_release();
        swift_release();
        sub_25ACDF558(v22, v26);
        MEMORY[0x261155470](v133);
        goto LABEL_113;
      }
      MEMORY[0x261155470](v6);
      uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B31D8);
      sub_25ACE8A98(&qword_26A4B31E0, &qword_26A4B31D8, (void (*)(void))sub_25ACE8A24);
      unint64_t v24 = v128;
      sub_25AD141B0();
      uint64_t v7 = 0;
      uint64_t v118 = a4;
      v134 = (void *)v132;
      (*(void (**)(char *, uint8_t *))(v130 + 8))(v13, v23);
      MEMORY[0x261155470](v133);
      uint64_t v27 = v134;
    }
    else
    {
      uint64_t v118 = a4;
      uint64_t v27 = (void *)sub_25ACE1B60(v133);
      uint64_t v7 = 0;
      swift_bridgeObjectRelease();
      v134 = v27;
      unint64_t v24 = v128;
    }
    int64_t v119 = v8;
    uint64_t v28 = v27[2];
    if (v28)
    {
      uint64_t v130 = 0;
      swift_bridgeObjectRetain();
      int64_t v8 = 0;
      uint64_t v29 = 4;
      uint64_t v17 = (uint64_t)"FixedCounterPMIs";
      do
      {
        if (*(void *)(v27[v29] + 16))
        {
          swift_bridgeObjectRetain();
          sub_25AD0A230(0xD000000000000021, 0x800000025AD18340);
          if (v30)
          {
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            unint64_t v32 = -v8;
            if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
              uint64_t v27 = sub_25AD0BB28(v27);
            }
            uint64_t v7 = v130;
            if (v32 >= v27[2])
            {
              __break(1u);
              goto LABEL_127;
            }
            uint64_t result = sub_25ACE7F84(0xD000000000000021, 0x800000025AD18340);
            v134 = v27;
            if (v36) {
              goto LABEL_133;
            }
            if (v32 < v27[2])
            {
              uint64_t v121 = result;
              if (!*(void *)(v27[v29] + 16))
              {
                sub_25ACE5F5C(-v8);
                swift_bridgeObjectRelease();
              }
              int v120 = 1;
              goto LABEL_41;
            }
LABEL_127:
            __break(1u);
LABEL_128:
            uint64_t v27 = sub_25AD0BB28(v27);
LABEL_35:
            if (v32 >= v27[2])
            {
              __break(1u);
              goto LABEL_130;
            }
            uint64_t result = sub_25ACE7F84(0xD000000000000016, v17 | 0x8000000000000000);
            v134 = v27;
            if ((v37 & 1) == 0)
            {
              if (v32 < v27[2])
              {
                uint64_t v121 = result;
                if (!*(void *)(v27[v32 + 4] + 16))
                {
                  sub_25ACE5F5C(v32);
                  swift_bridgeObjectRelease();
                }
                int v120 = 0;
LABEL_41:
                unint64_t v24 = v128;
                goto LABEL_42;
              }
LABEL_130:
              __break(1u);
LABEL_131:
              __break(1u);
LABEL_132:
              uint64_t result = swift_bridgeObjectRelease();
              __break(1u);
LABEL_133:
              __break(1u);
            }
            __break(1u);
            return result;
          }
          swift_bridgeObjectRelease();
        }
        --v8;
        ++v29;
      }
      while (-v28 != v8);
      swift_bridgeObjectRelease();
      uint64_t v31 = v27[2];
      if (v31)
      {
        swift_bridgeObjectRetain();
        unint64_t v32 = 0;
        uint64_t v17 = (uint64_t)"tersPeriodSeconds";
        uint64_t v7 = v130;
        while (1)
        {
          if (*(void *)(v27[v32 + 4] + 16))
          {
            swift_bridgeObjectRetain();
            sub_25AD0A230(0xD000000000000016, 0x800000025AD18370);
            if (v33)
            {
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
                goto LABEL_128;
              }
              goto LABEL_35;
            }
            swift_bridgeObjectRelease();
          }
          if (__OFADD__(v32++, 1))
          {
LABEL_123:
            __break(1u);
            goto LABEL_124;
          }
          if (v32 == v31)
          {
            swift_bridgeObjectRelease();
            int v120 = 0;
            uint64_t v121 = 0x3FE0000000000000;
            goto LABEL_33;
          }
        }
      }
      int v120 = 0;
      uint64_t v121 = 0x3FE0000000000000;
      uint64_t v7 = v130;
LABEL_33:
      unint64_t v24 = v128;
    }
    else
    {
      int v120 = 0;
      uint64_t v121 = 0x3FE0000000000000;
    }
LABEL_42:
    uint64_t v38 = (uint64_t)v134;
    int64_t v8 = v134[2];
    if (v8)
    {
      uint64_t v130 = v7;
      uint64_t v133 = MEMORY[0x263F8EE78];
      swift_bridgeObjectRetain();
      sub_25AD0FBA0(0, v8, 0);
      uint64_t v39 = 0;
      uint64_t v18 = v133;
      v131 = (uint8_t *)v38;
      uint64_t v7 = v38 + 32;
      while (1)
      {
        uint64_t v40 = *(void *)(v7 + 8 * v39);
        char v41 = *(unsigned char *)(v40 + 32);
        uint64_t v42 = 1 << v41;
        unint64_t v43 = *(void *)(v40 + 64);
        if (v43)
        {
          uint64_t v44 = 0;
        }
        else
        {
          unsigned int v45 = v41 & 0x3F;
          if (v45 < 7) {
            goto LABEL_131;
          }
          unint64_t v43 = *(void *)(v40 + 72);
          if (v43)
          {
            uint64_t v44 = 1;
          }
          else
          {
            if (v45 < 8) {
              goto LABEL_131;
            }
            unint64_t v43 = *(void *)(v40 + 80);
            if (v43)
            {
              uint64_t v44 = 2;
            }
            else
            {
              unint64_t v43 = *(void *)(v40 + 88);
              if (!v43)
              {
                uint64_t v46 = 0;
                unint64_t v47 = (unint64_t)(v42 + 63) >> 6;
                if (v47 <= 4) {
                  unint64_t v47 = 4;
                }
                unint64_t v48 = v47 - 4;
                while (v48 != v46)
                {
                  unint64_t v43 = *(void *)(v40 + 96 + 8 * v46++);
                  if (v43)
                  {
                    uint64_t v44 = v46 + 3;
                    goto LABEL_60;
                  }
                }
                goto LABEL_131;
              }
              uint64_t v44 = 3;
            }
          }
        }
LABEL_60:
        unint64_t v49 = __clz(__rbit64(v43));
        uint64_t v50 = v49 + (v44 << 6);
        if (v50 == v42) {
          goto LABEL_131;
        }
        if (v50 < 0)
        {
          __break(1u);
LABEL_117:
          __break(1u);
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
          goto LABEL_123;
        }
        if (v50 >= v42) {
          goto LABEL_117;
        }
        if (((*(void *)(v40 + 64 + (((unint64_t)v50 >> 3) & 0x1FFFFFFFFFFFFFF8)) >> v49) & 1) == 0) {
          goto LABEL_118;
        }
        if (!*(void *)(v40 + 16)) {
          goto LABEL_119;
        }
        unint64_t v51 = (uint64_t *)(*(void *)(v40 + 48) + 16 * v50);
        uint64_t v53 = *v51;
        uint64_t v52 = v51[1];
        swift_bridgeObjectRetain_n();
        swift_bridgeObjectRetain();
        unint64_t v54 = sub_25AD0A230(v53, v52);
        if ((v55 & 1) == 0) {
          goto LABEL_132;
        }
        double v56 = *(double *)(*(void *)(v40 + 56) + 8 * v54);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((~*(void *)&v56 & 0x7FF0000000000000) == 0) {
          goto LABEL_120;
        }
        if (v56 <= -9.22337204e18) {
          goto LABEL_121;
        }
        if (v56 >= 9.22337204e18) {
          goto LABEL_122;
        }
        uint64_t v133 = v18;
        unint64_t v58 = *(void *)(v18 + 16);
        unint64_t v57 = *(void *)(v18 + 24);
        uint64_t v17 = v58 + 1;
        if (v58 >= v57 >> 1)
        {
          sub_25AD0FBA0(v57 > 1, v58 + 1, 1);
          uint64_t v18 = v133;
        }
        ++v39;
        *(void *)(v18 + 16) = v17;
        uint64_t v59 = (void *)(v18 + 24 * v58);
        v59[4] = v53;
        v59[5] = v52;
        v59[6] = (uint64_t)v56;
        if (v39 == v8)
        {
          swift_release();
          uint64_t v17 = v118;
          sub_25ACDF558(v118, v128);
          swift_bridgeObjectRelease_n();
          int64_t v8 = v119;
          uint64_t v7 = v130;
          goto LABEL_74;
        }
      }
    }
    swift_bridgeObjectRetain();
    swift_release();
    uint64_t v17 = v118;
    sub_25ACDF558(v118, v24);
    swift_bridgeObjectRelease_n();
    uint64_t v18 = MEMORY[0x263F8EE78];
    int64_t v8 = v119;
LABEL_74:
    uint64_t v20 = v121;
    int v19 = v120;
  }
  uint64_t v60 = sub_25ACE82E8(v18, (void (*)(long long *__return_ptr, uint64_t, uint64_t, uint64_t))sub_25ACE89AC);
  if (v7)
  {
    sub_25ACDF558(v17, v128);
    swift_release();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v61 = v60;
    swift_bridgeObjectRelease();
    uint64_t v62 = sub_25ACF0D88(v61, v126, v129, 1);
    int v120 = v19;
    uint64_t v121 = v20;
    uint64_t v118 = v17;
    swift_bridgeObjectRetain_n();
    uint64_t v63 = sub_25AD14400();
    os_log_type_t v64 = sub_25AD14710();
    BOOL v65 = os_log_type_enabled(v63, v64);
    int64_t v119 = v8;
    if (v65)
    {
      uint64_t v66 = (uint8_t *)swift_slowAlloc();
      uint64_t v67 = swift_slowAlloc();
      v134 = (void *)v67;
      *(_DWORD *)uint64_t v66 = 136315138;
      v131 = v66 + 4;
      uint64_t v68 = swift_bridgeObjectRetain();
      uint64_t v69 = sub_25ACE6CBC(v68);
      uint64_t v130 = 0;
      swift_bridgeObjectRelease();
      uint64_t v133 = v69;
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B2FC8);
      sub_25ACE89C8();
      uint64_t v70 = sub_25AD144B0();
      unint64_t v72 = v71;
      swift_bridgeObjectRelease();
      uint64_t v133 = sub_25ACE700C(v70, v72, (uint64_t *)&v134);
      int64_t v8 = v119;
      sub_25AD147E0();
      swift_bridgeObjectRelease_n();
      uint64_t v7 = v130;
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_25ACDA000, v63, v64, "Placing events at %s", v66, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x261155570](v67, -1, -1);
      MEMORY[0x261155570](v66, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    uint64_t v73 = v121;
    char v74 = v120;
    uint64_t v75 = *(void *)(v62 + 16);
    unint64_t v76 = MEMORY[0x263F8EE78];
    if (v75)
    {
      v134 = (void *)MEMORY[0x263F8EE78];
      swift_bridgeObjectRetain();
      sub_25AD148E0();
      uint64_t v77 = 0;
      uint64_t v117 = v62;
      uint64_t v126 = v62 + 32;
      uint64_t v78 = v75;
      uint64_t v122 = v75;
      do
      {
        uint64_t v79 = *(void *)(v126 + 8 * v77);
        int64_t v80 = *(void *)(v79 + 16);
        if (v80)
        {
          uint64_t v129 = v77;
          uint64_t v130 = v7;
          uint64_t v81 = MEMORY[0x263F8EE78];
          uint64_t v133 = MEMORY[0x263F8EE78];
          swift_bridgeObjectRetain();
          sub_25AD0FC10(0, v80, 0);
          uint64_t v82 = v133;
          uint64_t v83 = v79;
          unint64_t v84 = *(void *)(v133 + 16);
          v131 = (uint8_t *)v83;
          unint64_t v85 = (uint64_t *)(v83 + 48);
          int64_t v86 = v80;
          do
          {
            if (*(v85 - 1)) {
              uint64_t v87 = *v85;
            }
            else {
              uint64_t v87 = 0;
            }
            uint64_t v133 = v82;
            unint64_t v88 = *(void *)(v82 + 24);
            if (v84 >= v88 >> 1)
            {
              sub_25AD0FC10(v88 > 1, v84 + 1, 1);
              uint64_t v82 = v133;
            }
            v85 += 6;
            *(void *)(v82 + 16) = v84 + 1;
            *(void *)(v82 + 8 * v84++ + 32) = v87;
            --v86;
          }
          while (v86);
          uint64_t v133 = v81;
          sub_25AD0FC10(0, v80, 0);
          uint64_t v89 = v133;
          unint64_t v90 = *(void *)(v133 + 16);
          v91 = (uint64_t *)(v131 + 64);
          int64_t v92 = v80;
          do
          {
            if (*(v91 - 3)) {
              uint64_t v93 = *v91;
            }
            else {
              uint64_t v93 = 0;
            }
            uint64_t v133 = v89;
            unint64_t v94 = *(void *)(v89 + 24);
            if (v90 >= v94 >> 1)
            {
              sub_25AD0FC10(v94 > 1, v90 + 1, 1);
              uint64_t v89 = v133;
            }
            v91 += 6;
            *(void *)(v89 + 16) = v90 + 1;
            *(void *)(v89 + 8 * v90++ + 32) = v93;
            --v92;
          }
          while (v92);
          uint64_t v133 = MEMORY[0x263F8EE78];
          sub_25AD0FBF0(0, v80, 0);
          uint64_t v95 = v133;
          unint64_t v96 = *(void *)(v133 + 16);
          uint64_t v7 = v130;
          v97 = v131 + 72;
          do
          {
            if (*((void *)v97 - 4)) {
              int v98 = *v97;
            }
            else {
              int v98 = 0;
            }
            uint64_t v133 = v95;
            unint64_t v99 = *(void *)(v95 + 24);
            if (v96 >= v99 >> 1)
            {
              sub_25AD0FBF0(v99 > 1, v96 + 1, 1);
              uint64_t v95 = v133;
            }
            v97 += 12;
            *(void *)(v95 + 16) = v96 + 1;
            *(_DWORD *)(v95 + 4 * v96++ + 32) = v98;
            --v80;
          }
          while (v80);
          uint64_t v78 = v122;
          uint64_t v77 = v129;
        }
        else
        {
          swift_bridgeObjectRetain();
          uint64_t v82 = MEMORY[0x263F8EE78];
          uint64_t v95 = MEMORY[0x263F8EE78];
          uint64_t v89 = MEMORY[0x263F8EE78];
        }
        ++v77;
        type metadata accessor for KPCSet();
        swift_allocObject();
        sub_25ACDF878(2, v82, v89, v95);
        swift_bridgeObjectRelease();
        sub_25AD148C0();
        sub_25AD148F0();
        sub_25AD14900();
        sub_25AD148D0();
      }
      while (v77 != v78);
      unint64_t v76 = (unint64_t)v134;
      uint64_t v62 = v117;
      swift_bridgeObjectRelease();
      int64_t v8 = v119;
      uint64_t v100 = v127;
      uint64_t v73 = v121;
      char v74 = v120;
    }
    else
    {
      uint64_t v100 = v127;
    }
    uint64_t v101 = *(void *)(v100 + 24);
    unint64_t v102 = *(void *)(v100 + 32);
    sub_25ACDF43C(v101, v102);
    sub_25ACE8544(v62, *(double *)&v73, v74, v101, v102, (uint64_t)v135);
    long long v103 = v135[3];
    *(_OWORD *)(v8 + 56) = v135[2];
    *(_OWORD *)(v8 + 72) = v103;
    *(_OWORD *)(v8 + 88) = v135[4];
    *(void *)(v8 + 104) = v136;
    long long v104 = v135[1];
    *(_OWORD *)(v8 + 24) = v135[0];
    *(_OWORD *)(v8 + 40) = v104;
    uint64_t v105 = v118;
    if (v76 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v106 = sub_25AD14940();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v106 = *(void *)((v76 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    uint64_t v107 = sub_25ACE4D78(v106, v73, v74);
    uint64_t v109 = v108;
    type metadata accessor for KPCConfiguration();
    swift_allocObject();
    uint64_t v110 = sub_25ACDFF9C(v76, v107, v109, 0);
    if (!v7)
    {
      uint64_t v116 = v110;
      sub_25ACDF558(v105, v128);
      swift_release();
      *(void *)(v8 + 16) = v116;
      return v8;
    }
    sub_25ACDF558(v105, v128);
    swift_release();
    uint64_t v111 = *(void *)(v8 + 64);
    unint64_t v112 = *(void *)(v8 + 72);
    uint64_t v113 = *(void *)(v8 + 80);
    swift_bridgeObjectRelease();
    sub_25ACDF558(v111, v112);
    sub_25ACDF5C4(v113);
  }
LABEL_113:
  uint64_t v114 = v124;
  uint64_t v115 = v123;
  MEMORY[0x261155470](*(void *)(v8 + 112));
  (*(void (**)(int64_t, uint64_t))(v115 + 8))(v125, v114);
  type metadata accessor for AwimboPMI(0);
  swift_deallocPartialClassInstance();
  return v8;
}

uint64_t sub_25ACE5F5C(unint64_t a1)
{
  double v3 = *v1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    double v3 = sub_25AD0BB28(v3);
  }
  unint64_t v4 = v3[2];
  if (v4 <= a1)
  {
    __break(1u);
  }
  else
  {
    unint64_t v5 = v4 - 1;
    uint64_t v6 = v4 - 1 - a1;
    if (v6 >= 0)
    {
      uint64_t v7 = &v3[a1];
      uint64_t v8 = v7[4];
      memmove(v7 + 4, v7 + 5, 8 * v6);
      v3[2] = v5;
      char *v1 = v3;
      return v8;
    }
  }
  uint64_t result = sub_25AD14980();
  __break(1u);
  return result;
}

uint64_t sub_25ACE6030@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v8 = *(void *)(a4 + 16);
  if (!*(void *)(v8 + 16)) {
    goto LABEL_6;
  }
  swift_bridgeObjectRetain();
  unint64_t v10 = sub_25AD0A230(a1, a2);
  if ((v11 & 1) == 0)
  {
    swift_bridgeObjectRelease();
LABEL_6:
    sub_25ACE7F30();
    swift_allocError();
    *uint64_t v18 = a1;
    v18[1] = a2;
    v18[2] = 0x4000000000000000;
    swift_bridgeObjectRetain();
    return swift_willThrow();
  }
  uint64_t v12 = (uint64_t *)(*(void *)(v8 + 56) + 32 * v10);
  uint64_t v14 = *v12;
  uint64_t v13 = v12[1];
  uint64_t v15 = v12[2];
  uint64_t v16 = v12[3];
  swift_bridgeObjectRetain();
  uint64_t result = swift_bridgeObjectRelease();
  if (a3 < 0)
  {
    uint64_t result = sub_25AD14920();
    __break(1u);
  }
  else
  {
    *(void *)a5 = v14;
    *(void *)(a5 + 8) = v13;
    *(void *)(a5 + 16) = v15;
    *(void *)(a5 + 24) = v16;
    *(void *)(a5 + 32) = a3;
    *(_DWORD *)(a5 + 40) = 16;
  }
  return result;
}

uint64_t sub_25ACE6170(uint64_t a1)
{
  uint64_t v4 = v1[8];
  unint64_t v3 = v1[9];
  uint64_t v5 = v1[10];
  if (v3 >> 60 == 15
    || (sub_25ACDF450(v4, v3),
        sub_25ACE336C(a1, 20992, 0x696C70207065706BLL, 0xEA00000000007473, v4, v3),
        uint64_t result = sub_25ACDF558(v4, v3),
        !v2))
  {
    sub_25AD14330();
    swift_allocObject();
    sub_25AD14320();
    swift_bridgeObjectRetain();
    sub_25ACDF43C(v4, v3);
    sub_25ACDF4A8(v5);
    sub_25ACE6C14();
    uint64_t v8 = sub_25AD14310();
    if (v2)
    {
      swift_bridgeObjectRelease();
      swift_release();
      sub_25ACDF558(v4, v3);
      return sub_25ACDF5C4(v5);
    }
    else
    {
      uint64_t v10 = v8;
      unint64_t v11 = v9;
      sub_25ACE336C(a1, 20482, 0x6174656D20434D50, 0xEC00000061746164, v8, v9);
      sub_25ACDF56C(v10, v11);
      swift_bridgeObjectRelease();
      sub_25ACDF558(v4, v3);
      sub_25ACDF5C4(v5);
      return swift_release();
    }
  }
  return result;
}

uint64_t sub_25ACE63B4()
{
  swift_release();
  uint64_t v1 = v0[8];
  unint64_t v2 = v0[9];
  uint64_t v3 = v0[10];
  swift_bridgeObjectRelease();
  sub_25ACDF558(v1, v2);
  sub_25ACDF5C4(v3);
  MEMORY[0x261155470](v0[14]);
  uint64_t v4 = (char *)v0 + OBJC_IVAR____TtC7Recount9AwimboPMI_logger;
  uint64_t v5 = sub_25AD14420();
  (*(void (**)(char *, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  uint64_t v6 = *(unsigned int *)(*v0 + 48);
  uint64_t v7 = *(unsigned __int16 *)(*v0 + 52);
  return MEMORY[0x270FA0228](v0, v6, v7);
}

uint64_t sub_25ACE64B0()
{
  return type metadata accessor for AwimboPMI(0);
}

uint64_t type metadata accessor for AwimboPMI(uint64_t a1)
{
  return sub_25ACE64D8(a1, (uint64_t *)&unk_26A4B3120);
}

uint64_t sub_25ACE64D8(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_25ACE6510()
{
  uint64_t result = sub_25AD14420();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_25ACE65D0(uint64_t a1)
{
  return a1;
}

uint64_t sub_25ACE6624(uint64_t a1)
{
  return a1;
}

__n128 __swift_memcpy88_8(uint64_t a1, uint64_t a2)
{
  long long v2 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v2;
  __n128 result = *(__n128 *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 48);
  long long v5 = *(_OWORD *)(a2 + 64);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)(a1 + 64) = v5;
  *(__n128 *)(a1 + 32) = result;
  return result;
}

ValueMetadata *type metadata accessor for AwimboConfiguration()
{
  return &type metadata for AwimboConfiguration;
}

uint64_t destroy for AwimboPMIMultiplexing()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for AwimboPMIMultiplexing(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for AwimboPMIMultiplexing(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  return a1;
}

__n128 __swift_memcpy32_8(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

_OWORD *assignWithTake for AwimboPMIMultiplexing(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  return a1;
}

uint64_t getEnumTagSinglePayload for AwimboPMIMultiplexing(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 32)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for AwimboPMIMultiplexing(uint64_t result, int a2, int a3)
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
LABEL_8:
      *(void *)__n128 result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 32) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AwimboPMIMultiplexing()
{
  return &type metadata for AwimboPMIMultiplexing;
}

uint64_t *sub_25ACE6874(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = a2[1];
  unint64_t v5 = a2[2];
  sub_25ACE8D84(*a2, v4, v5);
  *a1 = v3;
  a1[1] = v4;
  a1[2] = v5;
  return a1;
}

ValueMetadata *type metadata accessor for AwimboPMIError()
{
  return &type metadata for AwimboPMIError;
}

void sub_25ACE68E8()
{
  v1[4] = nullsub_1;
  v1[0] = MEMORY[0x263EF8330];
  v1[1] = 1107296256;
  v1[2] = sub_25ACE48BC;
  v1[3] = &block_descriptor_0;
  uint64_t v0 = _Block_copy(v1);
  ktrace_events_range();
  _Block_release(v0);
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

unint64_t sub_25ACE69B8()
{
  unint64_t result = qword_26A4B3138;
  if (!qword_26A4B3138)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4B3138);
  }
  return result;
}

uint64_t sub_25ACE6A0C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

unint64_t sub_25ACE6A70()
{
  unint64_t result = qword_26A4B3150;
  if (!qword_26A4B3150)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4B3150);
  }
  return result;
}

unint64_t sub_25ACE6AC4()
{
  unint64_t result = qword_26A4B3160;
  if (!qword_26A4B3160)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A4B3158);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4B3160);
  }
  return result;
}

unint64_t sub_25ACE6B30()
{
  unint64_t result = qword_26A4B3170;
  if (!qword_26A4B3170)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4B3170);
  }
  return result;
}

uint64_t sub_25ACE6B84()
{
  return sub_25ACE8A98(&qword_26A4B3188, &qword_26A4B3190, (void (*)(void))sub_25ACE6BC0);
}

unint64_t sub_25ACE6BC0()
{
  unint64_t result = qword_26A4B3198;
  if (!qword_26A4B3198)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4B3198);
  }
  return result;
}

unint64_t sub_25ACE6C14()
{
  unint64_t result = qword_26A4B31A8;
  if (!qword_26A4B31A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4B31A8);
  }
  return result;
}

unint64_t sub_25ACE6C68()
{
  unint64_t result = qword_26A4B31B0;
  if (!qword_26A4B31B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4B31B0);
  }
  return result;
}

uint64_t sub_25ACE6CBC(uint64_t a1)
{
  uint64_t v12 = MEMORY[0x263F8EE78];
  sub_25AD0FAB0(0, 0, 0);
  uint64_t v2 = *(void *)(a1 + 16);
  swift_bridgeObjectRetain();
  if (v2)
  {
    uint64_t v3 = 0;
    do
    {
      uint64_t v4 = *(void *)(a1 + 32 + 8 * v3);
      swift_bridgeObjectRetain();
      uint64_t v5 = sub_25ACE6DC4(v3, v4);
      uint64_t v7 = v6;
      swift_bridgeObjectRelease();
      unint64_t v9 = *(void *)(v12 + 16);
      unint64_t v8 = *(void *)(v12 + 24);
      if (v9 >= v8 >> 1) {
        sub_25AD0FAB0(v8 > 1, v9 + 1, 1);
      }
      ++v3;
      *(void *)(v12 + 16) = v9 + 1;
      uint64_t v10 = v12 + 16 * v9;
      *(void *)(v10 + 32) = v5;
      *(void *)(v10 + 40) = v7;
    }
    while (v2 != v3);
  }
  swift_bridgeObjectRelease();
  return v12;
}

uint64_t sub_25ACE6DC4(uint64_t a1, uint64_t a2)
{
  uint64_t v12 = sub_25AD14AE0();
  sub_25AD145A0();
  int64_t v3 = *(void *)(a2 + 16);
  if (v3)
  {
    uint64_t v11 = MEMORY[0x263F8EE78];
    sub_25AD0FAB0(0, v3, 0);
    uint64_t v4 = (unint64_t *)(a2 + 40);
    do
    {
      if (*v4)
      {
        uint64_t v5 = *(v4 - 1);
        unint64_t v6 = *v4;
      }
      else
      {
        unint64_t v6 = 0xE100000000000000;
        uint64_t v5 = 45;
      }
      unint64_t v8 = *(void *)(v11 + 16);
      unint64_t v7 = *(void *)(v11 + 24);
      swift_bridgeObjectRetain();
      if (v8 >= v7 >> 1) {
        sub_25AD0FAB0(v7 > 1, v8 + 1, 1);
      }
      *(void *)(v11 + 16) = v8 + 1;
      uint64_t v9 = v11 + 16 * v8;
      *(void *)(v9 + 32) = v5;
      *(void *)(v9 + 40) = v6;
      v4 += 6;
      --v3;
    }
    while (v3);
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B2FC8);
  sub_25ACE89C8();
  sub_25AD144B0();
  swift_bridgeObjectRelease();
  sub_25AD145A0();
  swift_bridgeObjectRelease();
  sub_25AD145A0();
  return v12;
}

uint64_t sub_25ACE6F44(void *a1, void *a2)
{
  uint64_t v2 = a1[2];
  if (v2 != a2[2]) {
    return 0;
  }
  if (!v2 || a1 == a2) {
    return 1;
  }
  BOOL v5 = a1[4] == a2[4] && a1[5] == a2[5];
  if (v5 || (v6 = sub_25AD14AF0(), uint64_t result = 0, (v6 & 1) != 0))
  {
    uint64_t v8 = v2 - 1;
    if (!v8) {
      return 1;
    }
    uint64_t v9 = a2 + 7;
    for (uint64_t i = a1 + 7; ; i += 2)
    {
      BOOL v11 = *(i - 1) == *(v9 - 1) && *i == *v9;
      if (!v11 && (sub_25AD14AF0() & 1) == 0) {
        break;
      }
      v9 += 2;
      if (!--v8) {
        return 1;
      }
    }
    return 0;
  }
  return result;
}

uint64_t sub_25ACE700C(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_25ACE70E0(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_25ACE8B04((uint64_t)v12, *a3);
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
      sub_25ACE8B04((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
}

uint64_t sub_25ACE70E0(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_25AD147F0();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_25ACE729C(a5, a6);
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
  uint64_t v8 = sub_25AD148B0();
  if (!v8)
  {
    sub_25AD14920();
    __break(1u);
LABEL_17:
    uint64_t result = sub_25AD14980();
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

uint64_t sub_25ACE729C(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_25ACE7334(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_25ACE7590(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_25ACE7590(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_25ACE7334(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_25ACE74AC(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_25AD14870();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_25AD14920();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_25AD145C0();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_25AD14980();
    __break(1u);
LABEL_14:
    uint64_t result = sub_25AD14920();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_25ACE74AC(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B31F0);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_25ACE7514(unint64_t a1, uint64_t a2, uint64_t a3)
{
  char v3 = a1;
  uint64_t v4 = (unsigned __int16)a1 >> 14;
  if ((a3 & 0x1000000000000000) == 0 || (a2 & 0x800000000000000) != 0)
  {
    uint64_t v10 = sub_25AD14610();
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
    uint64_t v5 = MEMORY[0x261154930](15, a1 >> 16);
    uint64_t v6 = v5 + (v4 << 16);
    unint64_t v7 = v5 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    unint64_t v8 = v6 & 0xFFFFFFFFFFFF0000;
    if (!v4) {
      unint64_t v8 = v7;
    }
    return v8 | 8;
  }
}

uint64_t sub_25ACE7590(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B31F0);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
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
  uint64_t result = sub_25AD14980();
  __break(1u);
  return result;
}

unsigned __int8 *sub_25ACE76E0(uint64_t a1, uint64_t a2, int64_t a3)
{
  uint64_t v13 = a1;
  uint64_t v14 = a2;
  swift_bridgeObjectRetain();
  uint64_t v5 = sub_25AD14630();
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
    int64_t v7 = (unsigned __int8 *)&v13;
    goto LABEL_7;
  }
  uint64_t v5 = sub_25ACE7A44();
  unint64_t v10 = v9;
  swift_bridgeObjectRelease();
  unint64_t v6 = v10;
  if ((v10 & 0x2000000000000000) != 0) {
    goto LABEL_6;
  }
LABEL_3:
  if ((v5 & 0x1000000000000000) != 0)
  {
    int64_t v7 = (unsigned __int8 *)((v6 & 0xFFFFFFFFFFFFFFFLL) + 32);
    uint64_t v8 = v5 & 0xFFFFFFFFFFFFLL;
  }
  else
  {
    int64_t v7 = (unsigned __int8 *)sub_25AD148B0();
  }
LABEL_7:
  size_t v11 = sub_25ACE77C8(v7, v8, a3);
  swift_bridgeObjectRelease();
  return v11;
}

unsigned __int8 *sub_25ACE77C8(unsigned __int8 *result, uint64_t a2, int64_t a3)
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
  uint64_t v20 = result + 1;
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

uint64_t sub_25ACE7A44()
{
  unint64_t v0 = sub_25AD14640();
  uint64_t v4 = sub_25ACE7AC4(v0, v1, v2, v3);
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_25ACE7AC4(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  if ((a4 & 0x1000000000000000) != 0)
  {
    uint64_t v9 = sub_25ACE7C1C(a1, a2, a3, a4);
    if (v9)
    {
      uint64_t v10 = v9;
      unsigned int v11 = sub_25ACE74AC(v9, 0);
      unint64_t v12 = sub_25ACE7D1C((unint64_t)v14, (uint64_t)(v11 + 4), v10, a1, a2, a3, a4);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      if (v12 != v10)
      {
        __break(1u);
LABEL_11:
        sub_25AD148B0();
LABEL_4:
        JUMPOUT(0x2611548B0);
      }
    }
    else
    {
      unsigned int v11 = (void *)MEMORY[0x263F8EE78];
    }
    uint64_t v13 = MEMORY[0x2611548B0](v11 + 4, v11[2]);
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
    return MEMORY[0x2611548B0]((char *)v14 + (a1 >> 16), (a2 >> 16) - (a1 >> 16));
  }
}

uint64_t sub_25ACE7C1C(unint64_t a1, unint64_t a2, unint64_t a3, uint64_t a4)
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
    a1 = sub_25ACE7514(a1, a3, a4);
    unint64_t v7 = a1;
  }
  if ((v6 & 0xC) == v9)
  {
    a1 = sub_25ACE7514(v6, v5, v4);
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

unint64_t sub_25ACE7D1C(unint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6, unint64_t a7)
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
    unint64_t v17 = v12 & 0xC;
    uint64_t result = v12;
    if (v17 == v15) {
      uint64_t result = sub_25ACE7514(v12, a6, a7);
    }
    if (result >> 14 < v27 || result >> 14 >= v10) {
      break;
    }
    if ((a7 & 0x1000000000000000) != 0)
    {
      uint64_t result = sub_25AD14600();
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
          uint64_t result = sub_25AD148B0();
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
    uint64_t result = sub_25ACE7514(v12, a6, a7);
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
    unint64_t v12 = sub_25AD145D0();
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

unint64_t sub_25ACE7F30()
{
  unint64_t result = qword_26A4B31B8;
  if (!qword_26A4B31B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4B31B8);
  }
  return result;
}

uint64_t sub_25ACE7F84(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = v2;
  swift_bridgeObjectRetain();
  unint64_t v6 = sub_25AD0A230(a1, a2);
  LOBYTE(a1) = v7;
  swift_bridgeObjectRelease();
  if ((a1 & 1) == 0) {
    return 0;
  }
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v9 = *v3;
  uint64_t v12 = *v3;
  *unint64_t v3 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_25AD0AC94();
    uint64_t v9 = v12;
  }
  swift_bridgeObjectRelease();
  uint64_t v10 = *(void *)(*(void *)(v9 + 56) + 8 * v6);
  sub_25ACE8064(v6, v9);
  *unint64_t v3 = v9;
  swift_bridgeObjectRelease();
  return v10;
}

unint64_t sub_25ACE8064(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    unint64_t result = sub_25AD14810();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        sub_25AD14B70();
        swift_bridgeObjectRetain();
        sub_25AD14570();
        uint64_t v9 = sub_25AD14B90();
        unint64_t result = swift_bridgeObjectRelease();
        unint64_t v10 = v9 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v10 < v8) {
            goto LABEL_5;
          }
        }
        else if (v10 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v10)
        {
LABEL_11:
          uint64_t v11 = *(void *)(a2 + 48);
          uint64_t v12 = (_OWORD *)(v11 + 16 * v3);
          uint64_t v13 = (_OWORD *)(v11 + 16 * v6);
          if (v3 != v6 || v12 >= v13 + 1) {
            *uint64_t v12 = *v13;
          }
          uint64_t v14 = *(void *)(a2 + 56);
          uint64_t v15 = (void *)(v14 + 8 * v3);
          uint64_t v16 = (void *)(v14 + 8 * v6);
          if (v3 != v6 || (int64_t v3 = v6, v15 >= v16 + 1))
          {
            *uint64_t v15 = *v16;
            int64_t v3 = v6;
          }
        }
LABEL_5:
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    unint64_t v17 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v18 = *v17;
    uint64_t v19 = (-1 << v3) - 1;
  }
  else
  {
    unint64_t v17 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v19 = *v17;
    uint64_t v18 = (-1 << result) - 1;
  }
  *unint64_t v17 = v19 & v18;
  uint64_t v20 = *(void *)(a2 + 16);
  BOOL v21 = __OFSUB__(v20, 1);
  uint64_t v22 = v20 - 1;
  if (v21)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v22;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

BOOL sub_25ACE823C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a1 + 16);
  uint64_t v5 = *(void *)(a1 + 24);
  uint64_t v7 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  if (*(void *)a1 == *(void *)a2 && *(void *)(a1 + 8) == *(void *)(a2 + 8))
  {
    if (v4 != v7 || v5 != v6) {
      return 0;
    }
LABEL_16:
    if (*(void *)(a1 + 32) == *(void *)(a2 + 32)) {
      return *(_DWORD *)(a1 + 40) == *(_DWORD *)(a2 + 40);
    }
    return 0;
  }
  char v9 = sub_25AD14AF0();
  BOOL result = 0;
  if ((v9 & 1) != 0 && v4 == v7 && v5 == v6) {
    goto LABEL_16;
  }
  return result;
}

uint64_t sub_25ACE82E8(uint64_t a1, void (*a2)(long long *__return_ptr, uint64_t, uint64_t, uint64_t))
{
  uint64_t v3 = v2;
  int64_t v4 = *(void *)(a1 + 16);
  uint64_t v5 = MEMORY[0x263F8EE78];
  if (v4)
  {
    uint64_t v20 = MEMORY[0x263F8EE78];
    sub_25AD0FB80(0, v4, 0);
    uint64_t v5 = v20;
    unint64_t v8 = (uint64_t *)(a1 + 48);
    while (1)
    {
      uint64_t v9 = *(v8 - 2);
      uint64_t v10 = *(v8 - 1);
      uint64_t v11 = *v8;
      swift_bridgeObjectRetain();
      a2(&v18, v9, v10, v11);
      if (v3) {
        break;
      }
      swift_bridgeObjectRelease();
      uint64_t v20 = v5;
      unint64_t v13 = *(void *)(v5 + 16);
      unint64_t v12 = *(void *)(v5 + 24);
      if (v13 >= v12 >> 1)
      {
        sub_25AD0FB80(v12 > 1, v13 + 1, 1);
        uint64_t v5 = v20;
      }
      v8 += 3;
      *(void *)(v5 + 16) = v13 + 1;
      uint64_t v14 = (_OWORD *)(v5 + 48 * v13);
      long long v15 = v18;
      long long v16 = v19[0];
      *(_OWORD *)((char *)v14 + 60) = *(_OWORD *)((char *)v19 + 12);
      v14[2] = v15;
      void v14[3] = v16;
      if (!--v4) {
        return v5;
      }
    }
    swift_release();
    swift_bridgeObjectRelease();
  }
  return v5;
}

uint64_t sub_25ACE8424(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  int64_t v4 = *(void *)(a1 + 16);
  uint64_t v5 = MEMORY[0x263F8EE78];
  if (v4)
  {
    uint64_t v17 = MEMORY[0x263F8EE78];
    sub_25AD0FC10(0, v4, 0);
    uint64_t v5 = v17;
    unint64_t v8 = (uint64_t *)(a1 + 40);
    while (1)
    {
      uint64_t v9 = *v8;
      v15[0] = *(v8 - 1);
      v15[1] = v9;
      swift_bridgeObjectRetain();
      sub_25ACE390C(v15, a2, &v14, &v16);
      if (v3) {
        break;
      }
      uint64_t v3 = 0;
      swift_bridgeObjectRelease();
      uint64_t v10 = v16;
      uint64_t v17 = v5;
      unint64_t v12 = *(void *)(v5 + 16);
      unint64_t v11 = *(void *)(v5 + 24);
      if (v12 >= v11 >> 1)
      {
        sub_25AD0FC10(v11 > 1, v12 + 1, 1);
        uint64_t v5 = v17;
      }
      v8 += 2;
      *(void *)(v5 + 16) = v12 + 1;
      *(void *)(v5 + 8 * v12 + 32) = v10;
      if (!--v4) {
        return v5;
      }
    }
    swift_release();
    swift_bridgeObjectRelease();
  }
  return v5;
}

uint64_t sub_25ACE8544@<X0>(uint64_t a1@<X0>, double a2@<X1>, char a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  int counter_count = kpc_get_counter_count();
  int v39 = kpc_get_counter_count();
  int64_t v13 = *(void *)(a1 + 16);
  double v14 = a2 / (double)v13;
  if ((a3 & 1) == 0) {
    double v14 = a2;
  }
  double v38 = v14;
  if (a3) {
    double v15 = a2;
  }
  else {
    double v15 = a2 * (double)v13;
  }
  uint64_t v16 = MEMORY[0x263F8EE78];
  if (v13)
  {
    double v33 = v15;
    int v34 = counter_count;
    uint64_t v35 = a4;
    uint64_t v36 = a6;
    uint64_t v37 = a5;
    uint64_t v44 = MEMORY[0x263F8EE78];
    sub_25AD0FAD0(0, v13, 0);
    uint64_t v17 = 0;
    uint64_t v18 = v44;
    uint64_t v41 = a1 + 32;
    int64_t v40 = v13;
    do
    {
      uint64_t v19 = *(void *)(v41 + 8 * v17);
      int64_t v20 = *(void *)(v19 + 16);
      if (v20)
      {
        uint64_t v42 = v17;
        uint64_t v43 = v18;
        swift_bridgeObjectRetain();
        sub_25AD0FB00(0, v20, 0);
        uint64_t v21 = v16;
        uint64_t v22 = (uint64_t *)(v19 + 64);
        do
        {
          if (*(v22 - 3))
          {
            uint64_t v23 = *v22;
            uint64_t v24 = *(v22 - 2);
            unint64_t v25 = *(v22 - 3);
            uint64_t v26 = *(v22 - 4);
          }
          else
          {
            uint64_t v24 = 0;
            unint64_t v25 = 0xE800000000000000;
            uint64_t v26 = 0x544E4556455F4F4ELL;
            uint64_t v23 = 1000000000;
          }
          unint64_t v28 = *(void *)(v21 + 16);
          unint64_t v27 = *(void *)(v21 + 24);
          swift_bridgeObjectRetain();
          if (v28 >= v27 >> 1) {
            sub_25AD0FB00(v27 > 1, v28 + 1, 1);
          }
          *(void *)(v21 + 16) = v28 + 1;
          unsigned int v29 = (void *)(v21 + 32 * v28);
          v29[4] = v24;
          v29[5] = v26;
          v29[6] = v25;
          v29[7] = v23;
          v22 += 6;
          --v20;
        }
        while (v20);
        swift_bridgeObjectRelease();
        int64_t v13 = v40;
        uint64_t v16 = MEMORY[0x263F8EE78];
        uint64_t v17 = v42;
        uint64_t v18 = v43;
      }
      else
      {
        uint64_t v21 = v16;
      }
      unint64_t v31 = *(void *)(v18 + 16);
      unint64_t v30 = *(void *)(v18 + 24);
      if (v31 >= v30 >> 1) {
        sub_25AD0FAD0(v30 > 1, v31 + 1, 1);
      }
      ++v17;
      *(void *)(v18 + 16) = v31 + 1;
      *(void *)(v18 + 8 * v31 + 32) = v21;
    }
    while (v17 != v13);
    uint64_t result = swift_bridgeObjectRelease();
    a6 = v36;
    a5 = v37;
    a4 = v35;
    int counter_count = v34;
    double v15 = v33;
  }
  else
  {
    uint64_t result = swift_bridgeObjectRelease();
    uint64_t v18 = MEMORY[0x263F8EE78];
  }
  *(void *)a6 = 0;
  *(void *)(a6 + 8) = 0;
  *(void *)(a6 + 16) = 0;
  *(unsigned char *)(a6 + 24) = 1;
  *(_WORD *)(a6 + 25) = 256;
  *(_DWORD *)(a6 + 28) = counter_count;
  *(_DWORD *)(a6 + 32) = v39;
  *(void *)(a6 + 40) = a4;
  *(void *)(a6 + 48) = a5;
  *(void *)(a6 + 56) = v18;
  *(void *)(a6 + 64) = v16;
  *(double *)(a6 + 72) = v15;
  *(double *)(a6 + 80) = v38;
  return result;
}

unint64_t sub_25ACE87CC@<X0>(unint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, unsigned __int16 a4@<W3>, uint64_t a5@<X8>)
{
  sub_25ACFA070((uint64_t)v19);
  if (v5) {
    return sub_25ACDD990(a1);
  }
  sub_25ACDF660((uint64_t)v19);
  unint64_t v12 = sub_25ACED62C((uint64_t)v19);
  sub_25ACE3660(v19, (uint64_t)v12, a1);
  uint64_t v14 = v13;
  int v21 = a4;
  sub_25ACDF6AC((uint64_t)v19);
  sub_25ACDD990(a1);
  uint64_t v15 = v12[3];
  unint64_t v16 = v12[4];
  sub_25ACDF43C(v15, v16);
  sub_25ACDF43C(v15, v16);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  int counter_count = kpc_get_counter_count();
  int v17 = kpc_get_counter_count();
  swift_release();
  swift_bridgeObjectRetain();
  sub_25ACDF43C(v15, v16);
  sub_25ACDF4A8(0);
  sub_25ACDF558(v15, v16);
  swift_bridgeObjectRelease_n();
  sub_25ACDF558(v15, v16);
  unint64_t result = sub_25ACDF5C4(0);
  *(void *)a5 = v14;
  *(void *)(a5 + 8) = a2;
  *(void *)(a5 + 16) = a3;
  char v18 = BYTE1(v21);
  *(unsigned char *)(a5 + 24) = v21 & 1;
  *(unsigned char *)(a5 + 25) = v18 & 1;
  *(unsigned char *)(a5 + 26) = 0;
  *(_DWORD *)(a5 + 28) = counter_count;
  *(_DWORD *)(a5 + 32) = v17;
  *(void *)(a5 + 40) = v15;
  *(void *)(a5 + 48) = v16;
  *(_OWORD *)(a5 + 56) = 0u;
  *(_OWORD *)(a5 + 72) = 0u;
  return result;
}

uint64_t sub_25ACE89AC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  return sub_25ACE6030(a1, a2, a3, v4, a4);
}

unint64_t sub_25ACE89C8()
{
  unint64_t result = qword_26A4B31C0;
  if (!qword_26A4B31C0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A4B2FC8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4B31C0);
  }
  return result;
}

unint64_t sub_25ACE8A24()
{
  unint64_t result = qword_26A4B31D0;
  if (!qword_26A4B31D0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A4B31C8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4B31D0);
  }
  return result;
}

uint64_t sub_25ACE8A98(unint64_t *a1, uint64_t *a2, void (*a3)(void))
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

uint64_t sub_25ACE8B04(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_25ACE8B64(uint64_t a1)
{
  return a1;
}

uint64_t sub_25ACE8B90(uint64_t a1)
{
  return a1;
}

uint64_t destroy for Event()
{
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for EventSampler(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(_DWORD *)(a1 + 40) = *(_DWORD *)(a2 + 40);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for EventSampler(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(_DWORD *)(a1 + 40) = *(_DWORD *)(a2 + 40);
  return a1;
}

__n128 __swift_memcpy44_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 28) = *(_OWORD *)(a2 + 28);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for EventSampler(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(_DWORD *)(a1 + 40) = *(_DWORD *)(a2 + 40);
  return a1;
}

uint64_t getEnumTagSinglePayload for EventSampler(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 44)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for EventSampler(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_DWORD *)(result + 40) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 44) = 1;
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
    *(unsigned char *)(result + 44) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for EventSampler()
{
  return &type metadata for EventSampler;
}

uint64_t sub_25ACE8D84(uint64_t a1, uint64_t a2, unint64_t a3)
{
  if (a3 >> 62 == 1)
  {
    return swift_bridgeObjectRetain();
  }
  else if (!(a3 >> 62))
  {
    swift_bridgeObjectRetain();
    JUMPOUT(0x261155480);
  }
  return result;
}

uint64_t destroy for AwimboPMCError(uint64_t a1)
{
  return sub_25ACE8E0C(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16));
}

uint64_t sub_25ACE8E0C(uint64_t a1, uint64_t a2, unint64_t a3)
{
  if (a3 >> 62 == 1)
  {
    return swift_bridgeObjectRelease();
  }
  else if (!(a3 >> 62))
  {
    swift_bridgeObjectRelease();
    JUMPOUT(0x261155470);
  }
  return result;
}

uint64_t *_s7Recount14AwimboPMIErrorOwca_0(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = a2[1];
  unint64_t v5 = a2[2];
  sub_25ACE8D84(*a2, v4, v5);
  uint64_t v6 = *a1;
  uint64_t v7 = a1[1];
  unint64_t v8 = a1[2];
  *a1 = v3;
  a1[1] = v4;
  a1[2] = v5;
  sub_25ACE8E0C(v6, v7, v8);
  return a1;
}

uint64_t *_s7Recount14AwimboPMIErrorOwta_0(uint64_t *a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 16);
  uint64_t v4 = *a1;
  uint64_t v6 = a1[1];
  unint64_t v5 = a1[2];
  *(_OWORD *)a1 = *(_OWORD *)a2;
  a1[2] = v3;
  sub_25ACE8E0C(v4, v6, v5);
  return a1;
}

uint64_t _s7Recount14AwimboPMIErrorOwet_0(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7E && *(unsigned char *)(a1 + 24)) {
    return (*(_DWORD *)a1 + 126);
  }
  unsigned int v3 = (((*(void *)(a1 + 16) >> 57) >> 5) | (4
                                                           * ((*(void *)(a1 + 16) >> 57) & 0x18 | *(void *)(a1 + 16) & 7))) ^ 0x7F;
  if (v3 >= 0x7D) {
    unsigned int v3 = -1;
  }
  return v3 + 1;
}

uint64_t _s7Recount14AwimboPMIErrorOwst_0(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7D)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)uint64_t result = a2 - 126;
    if (a3 >= 0x7E) {
      *(unsigned char *)(result + 24) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7E) {
      *(unsigned char *)(result + 24) = 0;
    }
    if (a2)
    {
      uint64_t v3 = (-a2 >> 2) & 0x1F | (32 * (-a2 & 0x7F));
      *(void *)uint64_t result = 0;
      *(void *)(result + 8) = 0;
      *(void *)(result + 16) = (v3 | (v3 << 57)) & 0xF000000000000007;
    }
  }
  return result;
}

uint64_t sub_25ACE8FC0(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16) >> 62;
  if (v1 <= 1) {
    return v1;
  }
  else {
    return (*(_DWORD *)a1 + 2);
  }
}

uint64_t sub_25ACE8FDC(uint64_t result)
{
  *(void *)(result + 16) &= 0x3FFFFFFFFFFFFFFFuLL;
  return result;
}

uint64_t sub_25ACE8FEC(uint64_t result, uint64_t a2)
{
  if (a2 < 2)
  {
    *(void *)(result + 16) = *(void *)(result + 16) & 0xFFFFFFFFFFFFFF8 | (a2 << 62);
  }
  else
  {
    *(void *)uint64_t result = (a2 - 2);
    *(_OWORD *)(result + 8) = xmmword_25AD15830;
  }
  return result;
}

ValueMetadata *type metadata accessor for AwimboPMCError()
{
  return &type metadata for AwimboPMCError;
}

uint64_t destroy for AwimboConfiguration.Err()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for AwimboConfiguration.Err(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  a1[4] = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for AwimboConfiguration.Err(void *a1, void *a2)
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
  return a1;
}

__n128 __swift_memcpy40_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

void *assignWithTake for AwimboConfiguration.Err(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  return a1;
}

uint64_t getEnumTagSinglePayload for AwimboConfiguration.Err(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 40)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for AwimboConfiguration.Err(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 40) = 1;
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
    *(unsigned char *)(result + 40) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AwimboConfiguration.Err()
{
  return &type metadata for AwimboConfiguration.Err;
}

uint64_t _s7Recount19AwimboConfigurationVwxx_0(uint64_t *a1)
{
  swift_bridgeObjectRelease();
  unint64_t v2 = a1[6];
  if (v2 >> 60 != 15) {
    sub_25ACDF56C(a1[5], v2);
  }
  uint64_t result = a1[7];
  if (result)
  {
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t _s7Recount19AwimboConfigurationVwcp_0(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  *(_WORD *)(a1 + 25) = *(_WORD *)(a2 + 25);
  *(void *)(a1 + 28) = *(void *)(a2 + 28);
  uint64_t v4 = (_OWORD *)(a2 + 40);
  unint64_t v5 = *(void *)(a2 + 48);
  swift_bridgeObjectRetain();
  if (v5 >> 60 == 15)
  {
    *(_OWORD *)(a1 + 40) = *v4;
  }
  else
  {
    uint64_t v6 = *(void *)v4;
    sub_25ACDF450(v6, v5);
    *(void *)(a1 + 40) = v6;
    *(void *)(a1 + 48) = v5;
  }
  uint64_t v7 = *(void *)(a2 + 56);
  if (v7)
  {
    uint64_t v8 = *(void *)(a2 + 64);
    *(void *)(a1 + 56) = v7;
    *(void *)(a1 + 64) = v8;
    *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  else
  {
    long long v9 = *(_OWORD *)(a2 + 72);
    *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
    *(_OWORD *)(a1 + 72) = v9;
  }
  return a1;
}

uint64_t _s7Recount19AwimboConfigurationVwca_0(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  long long v4 = *(_OWORD *)(a2 + 8);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  *(_OWORD *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 25) = *(unsigned char *)(a2 + 25);
  *(unsigned char *)(a1 + 26) = *(unsigned char *)(a2 + 26);
  *(_DWORD *)(a1 + 28) = *(_DWORD *)(a2 + 28);
  *(_DWORD *)(a1 + 32) = *(_DWORD *)(a2 + 32);
  unint64_t v5 = (uint64_t *)(a2 + 40);
  unint64_t v6 = *(void *)(a2 + 48);
  if (*(void *)(a1 + 48) >> 60 == 15)
  {
    if (v6 >> 60 != 15)
    {
      uint64_t v7 = *v5;
      sub_25ACDF450(*v5, *(void *)(a2 + 48));
      *(void *)(a1 + 40) = v7;
      *(void *)(a1 + 48) = v6;
      goto LABEL_8;
    }
    goto LABEL_6;
  }
  if (v6 >> 60 == 15)
  {
    sub_25ACE65D0(a1 + 40);
LABEL_6:
    *(_OWORD *)(a1 + 40) = *(_OWORD *)v5;
    goto LABEL_8;
  }
  uint64_t v8 = *v5;
  sub_25ACDF450(*v5, *(void *)(a2 + 48));
  uint64_t v9 = *(void *)(a1 + 40);
  unint64_t v10 = *(void *)(a1 + 48);
  *(void *)(a1 + 40) = v8;
  *(void *)(a1 + 48) = v6;
  sub_25ACDF56C(v9, v10);
LABEL_8:
  unint64_t v11 = (_OWORD *)(a1 + 56);
  uint64_t v13 = (_OWORD *)(a2 + 56);
  uint64_t v12 = *(void *)(a2 + 56);
  if (*(void *)(a1 + 56))
  {
    if (v12)
    {
      *(void *)(a1 + 56) = v12;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *(void *)(a1 + 64) = *(void *)(a2 + 64);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *(void *)(a1 + 72) = *(void *)(a2 + 72);
      *(void *)(a1 + 80) = *(void *)(a2 + 80);
    }
    else
    {
      sub_25ACE6624(a1 + 56);
      long long v14 = *(_OWORD *)(a2 + 72);
      *unint64_t v11 = *v13;
      *(_OWORD *)(a1 + 72) = v14;
    }
  }
  else if (v12)
  {
    *(void *)(a1 + 56) = v12;
    *(void *)(a1 + 64) = *(void *)(a2 + 64);
    *(void *)(a1 + 72) = *(void *)(a2 + 72);
    *(void *)(a1 + 80) = *(void *)(a2 + 80);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  else
  {
    long long v15 = *(_OWORD *)(a2 + 72);
    *unint64_t v11 = *v13;
    *(_OWORD *)(a1 + 72) = v15;
  }
  return a1;
}

uint64_t _s7Recount19AwimboConfigurationVwta_0(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  *(unsigned char *)(a1 + 25) = *(unsigned char *)(a2 + 25);
  *(unsigned char *)(a1 + 26) = *(unsigned char *)(a2 + 26);
  *(void *)(a1 + 28) = *(void *)(a2 + 28);
  long long v4 = (_OWORD *)(a2 + 40);
  unint64_t v5 = *(void *)(a1 + 48);
  if (v5 >> 60 == 15) {
    goto LABEL_4;
  }
  unint64_t v6 = *(void *)(a2 + 48);
  if (v6 >> 60 == 15)
  {
    sub_25ACE65D0(a1 + 40);
LABEL_4:
    *(_OWORD *)(a1 + 40) = *v4;
    goto LABEL_6;
  }
  uint64_t v7 = *(void *)(a1 + 40);
  *(void *)(a1 + 40) = *(void *)v4;
  *(void *)(a1 + 48) = v6;
  sub_25ACDF56C(v7, v5);
LABEL_6:
  uint64_t v8 = *(void *)(a2 + 56);
  if (!*(void *)(a1 + 56))
  {
LABEL_10:
    long long v9 = *(_OWORD *)(a2 + 72);
    *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
    *(_OWORD *)(a1 + 72) = v9;
    return a1;
  }
  if (!v8)
  {
    sub_25ACE6624(a1 + 56);
    goto LABEL_10;
  }
  *(void *)(a1 + 56) = v8;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  return a1;
}

uint64_t _s7Recount19AwimboConfigurationVwet_0(uint64_t *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *((unsigned char *)a1 + 88)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  uint64_t v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t _s7Recount19AwimboConfigurationVwst_0(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)uint64_t result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 88) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 88) = 0;
    }
    if (a2) {
      *(void *)uint64_t result = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AwimboInfo()
{
  return &type metadata for AwimboInfo;
}

uint64_t getEnumTagSinglePayload for AwimboPMIMultiplexing.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for AwimboPMIMultiplexing.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x25ACE9830);
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

ValueMetadata *type metadata accessor for AwimboPMIMultiplexing.CodingKeys()
{
  return &type metadata for AwimboPMIMultiplexing.CodingKeys;
}

uint64_t getEnumTagSinglePayload for AwimboConfiguration.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for AwimboConfiguration.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x25ACE99C4);
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

ValueMetadata *type metadata accessor for AwimboConfiguration.CodingKeys()
{
  return &type metadata for AwimboConfiguration.CodingKeys;
}

uint64_t initializeWithCopy for AwimboEvent(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  uint64_t v3 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v3;
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for AwimboEvent(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[3] = a2[3];
  return a1;
}

uint64_t assignWithTake for AwimboEvent(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  return a1;
}

uint64_t getEnumTagSinglePayload for AwimboEvent(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 32)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for AwimboEvent(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)uint64_t result = a2 ^ 0x80000000;
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
LABEL_8:
      *(void *)(result + 16) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 32) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AwimboEvent()
{
  return &type metadata for AwimboEvent;
}

unint64_t sub_25ACE9B78()
{
  unint64_t result = qword_26A4B3200;
  if (!qword_26A4B3200)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4B3200);
  }
  return result;
}

unint64_t sub_25ACE9BD0()
{
  unint64_t result = qword_26A4B3208;
  if (!qword_26A4B3208)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4B3208);
  }
  return result;
}

unint64_t sub_25ACE9C2C(uint64_t a1)
{
  *(void *)(a1 + 8) = sub_25ACE9C5C();
  unint64_t result = sub_25ACE9CB0();
  *(void *)(a1 + 16) = result;
  return result;
}

unint64_t sub_25ACE9C5C()
{
  unint64_t result = qword_26A4B3210;
  if (!qword_26A4B3210)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4B3210);
  }
  return result;
}

unint64_t sub_25ACE9CB0()
{
  unint64_t result = qword_26A4B3218;
  if (!qword_26A4B3218)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4B3218);
  }
  return result;
}

unint64_t sub_25ACE9D08()
{
  unint64_t result = qword_26A4B3220;
  if (!qword_26A4B3220)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4B3220);
  }
  return result;
}

unint64_t sub_25ACE9D60()
{
  unint64_t result = qword_26A4B3228;
  if (!qword_26A4B3228)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4B3228);
  }
  return result;
}

unint64_t sub_25ACE9DB8()
{
  unint64_t result = qword_26A4B3230;
  if (!qword_26A4B3230)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4B3230);
  }
  return result;
}

unint64_t sub_25ACE9E10()
{
  unint64_t result = qword_26A4B3238;
  if (!qword_26A4B3238)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4B3238);
  }
  return result;
}

uint64_t sub_25ACE9E64(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 1701080931 && a2 == 0xE400000000000000;
  if (v2 || (sub_25AD14AF0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 1701667182 && a2 == 0xE400000000000000 || (sub_25AD14AF0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x646F69726570 && a2 == 0xE600000000000000)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    char v6 = sub_25AD14AF0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 2;
    }
    else {
      return 3;
    }
  }
}

uint64_t sub_25ACE9F94()
{
  unint64_t v0 = sub_25AD14990();
  swift_bridgeObjectRelease();
  if (v0 >= 4) {
    return 4;
  }
  else {
    return v0;
  }
}

uint64_t sub_25ACE9FE0()
{
  unint64_t v0 = sub_25AD14990();
  swift_bridgeObjectRelease();
  if (v0 >= 7) {
    return 7;
  }
  else {
    return v0;
  }
}

unint64_t sub_25ACEA02C()
{
  unint64_t result = qword_26A4B3248;
  if (!qword_26A4B3248)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4B3248);
  }
  return result;
}

unint64_t sub_25ACEA080()
{
  unint64_t result = qword_26A4B3258;
  if (!qword_26A4B3258)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4B3258);
  }
  return result;
}

unint64_t sub_25ACEA0D4()
{
  unint64_t result = qword_26A4B3260;
  if (!qword_26A4B3260)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4B3260);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for AwimboInfo.CodingKeys(unsigned int *a1, int a2)
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

unsigned char *storeEnumTagSinglePayload for AwimboInfo.CodingKeys(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x25ACEA218);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for AwimboInfo.CodingKeys()
{
  return &type metadata for AwimboInfo.CodingKeys;
}

unsigned char *storeEnumTagSinglePayload for AwimboEvent.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x25ACEA31CLL);
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

ValueMetadata *type metadata accessor for AwimboEvent.CodingKeys()
{
  return &type metadata for AwimboEvent.CodingKeys;
}

uint64_t *initializeBufferWithCopyOfBuffer for AwimboPMCEvents(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  if ((unint64_t)*a2 >= 0xFFFFFFFF) {
    uint64_t v3 = swift_bridgeObjectRetain();
  }
  *a1 = v3;
  return a1;
}

unint64_t destroy for AwimboPMCEvents(unint64_t *a1)
{
  unint64_t result = *a1;
  if (result >= 0xFFFFFFFF) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

unint64_t *assignWithCopy for AwimboPMCEvents(unint64_t *a1, unint64_t *a2)
{
  unint64_t v3 = *a1;
  unint64_t v4 = *a2;
  if (v3 < 0xFFFFFFFF)
  {
    *a1 = v4;
    if (v4 >= 0xFFFFFFFF) {
      swift_bridgeObjectRetain();
    }
  }
  else if (v4 < 0xFFFFFFFF)
  {
    swift_bridgeObjectRelease();
    *a1 = *a2;
  }
  else
  {
    *a1 = v4;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  return a1;
}

unint64_t *assignWithTake for AwimboPMCEvents(unint64_t *a1, unint64_t *a2)
{
  unint64_t v3 = *a2;
  if (*a1 < 0xFFFFFFFF) {
    goto LABEL_5;
  }
  if (v3 < 0xFFFFFFFF)
  {
    swift_bridgeObjectRelease();
LABEL_5:
    *a1 = v3;
    return a1;
  }
  *a1 = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for AwimboPMCEvents(uint64_t *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFE && *((unsigned char *)a1 + 8)) {
    return (*(_DWORD *)a1 + 2147483646);
  }
  uint64_t v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  unsigned int v4 = v3 + 1;
  unsigned int v5 = v3 - 1;
  if (v4 >= 3) {
    return v5;
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for AwimboPMCEvents(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFD)
  {
    *(void *)unint64_t result = 0;
    *(_DWORD *)unint64_t result = a2 - 2147483646;
    if (a3 >= 0x7FFFFFFE) {
      *(unsigned char *)(result + 8) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFE) {
      *(unsigned char *)(result + 8) = 0;
    }
    if (a2) {
      *(void *)unint64_t result = a2 + 1;
    }
  }
  return result;
}

uint64_t sub_25ACEA544(uint64_t *a1)
{
  uint64_t v1 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v1) = -1;
  }
  return (v1 + 1);
}

void *sub_25ACEA55C(void *result, int a2)
{
  if (a2 < 0)
  {
    unsigned int v2 = a2 ^ 0x80000000;
  }
  else
  {
    if (!a2) {
      return result;
    }
    unsigned int v2 = a2 - 1;
  }
  *unint64_t result = v2;
  return result;
}

ValueMetadata *type metadata accessor for AwimboPMCEvents()
{
  return &type metadata for AwimboPMCEvents;
}

unint64_t sub_25ACEA590()
{
  unint64_t result = qword_26A4B3268;
  if (!qword_26A4B3268)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4B3268);
  }
  return result;
}

unint64_t sub_25ACEA5E8()
{
  unint64_t result = qword_26A4B3270;
  if (!qword_26A4B3270)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4B3270);
  }
  return result;
}

unint64_t sub_25ACEA640()
{
  unint64_t result = qword_26A4B3278;
  if (!qword_26A4B3278)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4B3278);
  }
  return result;
}

unint64_t sub_25ACEA698()
{
  unint64_t result = qword_26A4B3280;
  if (!qword_26A4B3280)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4B3280);
  }
  return result;
}

unint64_t sub_25ACEA6F0()
{
  unint64_t result = qword_26A4B3288;
  if (!qword_26A4B3288)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4B3288);
  }
  return result;
}

unint64_t sub_25ACEA748()
{
  unint64_t result = qword_26A4B3290;
  if (!qword_26A4B3290)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4B3290);
  }
  return result;
}

uint64_t sub_25ACEA7B4()
{
  return sub_25ACE4B10();
}

uint64_t sub_25ACEA7CC()
{
  return sub_25ACE4B3C();
}

uint64_t sub_25ACEA7F4(uint64_t a1)
{
  return sub_25ACE4B64(a1);
}

uint64_t destroy for MetricSpec()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for MetricSpec(void *a1, void *a2)
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
  uint64_t v7 = a2[9];
  a1[8] = a2[8];
  a1[9] = v7;
  uint64_t v8 = a2[11];
  a1[10] = a2[10];
  a1[11] = v8;
  a1[12] = a2[12];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for MetricSpec(void *a1, void *a2)
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
  a1[8] = a2[8];
  a1[9] = a2[9];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[10] = a2[10];
  a1[11] = a2[11];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[12] = a2[12];
  return a1;
}

__n128 __swift_memcpy104_8(uint64_t a1, long long *a2)
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

void *assignWithTake for MetricSpec(void *a1, void *a2)
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
  uint64_t v8 = a2[9];
  a1[8] = a2[8];
  a1[9] = v8;
  swift_bridgeObjectRelease();
  uint64_t v9 = a2[11];
  a1[10] = a2[10];
  a1[11] = v9;
  swift_bridgeObjectRelease();
  a1[12] = a2[12];
  return a1;
}

uint64_t getEnumTagSinglePayload for MetricSpec(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 104)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for MetricSpec(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 104) = 1;
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
    *(unsigned char *)(result + 104) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for MetricSpec()
{
  return &type metadata for MetricSpec;
}

unint64_t sub_25ACEAB64(char a1)
{
  unint64_t result = 1701667182;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x4E79616C70736964;
      break;
    case 2:
      unint64_t result = 0xD000000000000012;
      break;
    case 3:
      unint64_t result = 0xD000000000000014;
      break;
    case 4:
      unint64_t result = 0xD000000000000011;
      break;
    case 5:
      unint64_t result = 0x4379616C70736964;
      break;
    case 6:
      unint64_t result = 0x4F79616C70736964;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_25ACEAC68(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B32A8);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = &v8[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25ACEB80C();
  sub_25AD14BB0();
  v8[15] = 0;
  sub_25AD14A60();
  if (!v1)
  {
    v8[14] = 1;
    sub_25AD14A60();
    v8[13] = 2;
    sub_25AD14A60();
    v8[12] = 3;
    sub_25AD14A60();
    v8[11] = 4;
    sub_25AD14A50();
    v8[10] = 5;
    sub_25AD14A60();
    v8[9] = 6;
    sub_25AD14A90();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v4 + 8))(v6, v3);
}

unint64_t sub_25ACEAE90()
{
  return sub_25ACEAB64(*v0);
}

uint64_t sub_25ACEAE98@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_25ACEAFB0(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_25ACEAEC0(uint64_t a1)
{
  unint64_t v2 = sub_25ACEB80C();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25ACEAEFC(uint64_t a1)
{
  unint64_t v2 = sub_25ACEB80C();
  return MEMORY[0x270FA00B8](a1, v2);
}

__n128 sub_25ACEAF38@<Q0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  sub_25ACEB2B8(a1, (uint64_t *)v7);
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

uint64_t sub_25ACEAF98(void *a1)
{
  return sub_25ACEAC68(a1);
}

uint64_t sub_25ACEAFB0(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 1701667182 && a2 == 0xE400000000000000;
  if (v2 || (sub_25AD14AF0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x4E79616C70736964 && a2 == 0xEB00000000656D61 || (sub_25AD14AF0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD000000000000012 && a2 == 0x800000025AD18470 || (sub_25AD14AF0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0xD000000000000014 && a2 == 0x800000025AD18E10 || (sub_25AD14AF0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x800000025AD18E30 || (sub_25AD14AF0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0x4379616C70736964 && a2 == 0xEC000000726F6C6FLL || (sub_25AD14AF0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0x4F79616C70736964 && a2 == 0xEC00000072656472)
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else
  {
    char v6 = sub_25AD14AF0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 6;
    }
    else {
      return 7;
    }
  }
}

uint64_t sub_25ACEB2B8@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B3298);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v30 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25ACEB80C();
  sub_25AD14BA0();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  char v48 = 0;
  uint64_t v9 = sub_25AD149E0();
  uint64_t v11 = v10;
  uint64_t v41 = v9;
  char v47 = 1;
  swift_bridgeObjectRetain();
  uint64_t v12 = sub_25AD149E0();
  uint64_t v14 = v13;
  uint64_t v39 = v12;
  uint64_t v40 = v11;
  char v46 = 2;
  swift_bridgeObjectRetain();
  uint64_t v36 = sub_25AD149E0();
  uint64_t v38 = v14;
  char v45 = 3;
  uint64_t v16 = v15;
  swift_bridgeObjectRetain();
  uint64_t v17 = sub_25AD149E0();
  uint64_t v37 = v18;
  uint64_t v33 = v17;
  char v44 = 4;
  swift_bridgeObjectRetain();
  uint64_t v35 = 0;
  uint64_t v32 = sub_25AD149C0();
  char v43 = 5;
  uint64_t v20 = v19;
  swift_bridgeObjectRetain();
  uint64_t v21 = sub_25AD149E0();
  uint64_t v34 = v20;
  uint64_t v30 = v21;
  uint64_t v31 = v22;
  char v42 = 6;
  swift_bridgeObjectRetain();
  uint64_t v23 = sub_25AD149F0();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  uint64_t v24 = v31;
  swift_bridgeObjectRelease();
  uint64_t v25 = v34;
  swift_bridgeObjectRelease();
  uint64_t v26 = v37;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v27 = v38;
  swift_bridgeObjectRelease();
  uint64_t v28 = v40;
  uint64_t result = swift_bridgeObjectRelease();
  *a2 = v41;
  a2[1] = v28;
  a2[2] = v39;
  a2[3] = v27;
  a2[4] = v36;
  a2[5] = v16;
  a2[6] = v33;
  a2[7] = v26;
  a2[8] = v32;
  a2[9] = v25;
  a2[10] = v30;
  a2[11] = v24;
  a2[12] = v23;
  return result;
}

unint64_t sub_25ACEB80C()
{
  unint64_t result = qword_26A4B32A0;
  if (!qword_26A4B32A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4B32A0);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for MetricSpec.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x25ACEB92CLL);
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

ValueMetadata *type metadata accessor for MetricSpec.CodingKeys()
{
  return &type metadata for MetricSpec.CodingKeys;
}

unint64_t sub_25ACEB968()
{
  unint64_t result = qword_26A4B32B0;
  if (!qword_26A4B32B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4B32B0);
  }
  return result;
}

unint64_t sub_25ACEB9C0()
{
  unint64_t result = qword_26A4B32B8;
  if (!qword_26A4B32B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4B32B8);
  }
  return result;
}

unint64_t sub_25ACEBA18()
{
  unint64_t result = qword_26A4B32C0;
  if (!qword_26A4B32C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4B32C0);
  }
  return result;
}

BOOL sub_25ACEBA6C(void *a1, void *a2)
{
  uint64_t v2 = a1[2];
  uint64_t v3 = a1[3];
  uint64_t v5 = a2[2];
  uint64_t v4 = a2[3];
  if (*a1 == *a2 && a1[1] == a2[1])
  {
    if (v2 != v5) {
      return 0;
    }
    return v3 == v4;
  }
  char v7 = sub_25AD14AF0();
  BOOL result = 0;
  if ((v7 & 1) != 0 && v2 == v5) {
    return v3 == v4;
  }
  return result;
}

uint64_t sub_25ACEBAF4()
{
  return sub_25AD14B80();
}

unint64_t sub_25ACEBB20()
{
  sub_25ACEEFAC(v0, &v2);
  sub_25AD14860();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_25AD145A0();
  swift_bridgeObjectRelease();
  return 0xD000000000000026;
}

unint64_t sub_25ACEBBB8()
{
  sub_25ACEEFAC(v0, v2);
  return sub_25ACEBB20();
}

uint64_t sub_25ACEBBF0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  swift_bridgeObjectRetain();
  uint64_t v6 = sub_25ACED36C(a4, (void (*)(void *__return_ptr, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void))sub_25ACEDEAC);
  swift_bridgeObjectRelease();
  if (*(void *)(v6 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B32E0);
    uint64_t v7 = sub_25AD14970();
  }
  else
  {
    uint64_t v7 = MEMORY[0x263F8EE80];
  }
  unint64_t v51 = (void *)v7;
  uint64_t v8 = swift_bridgeObjectRetain();
  sub_25ACECE1C(v8, 1, (uint64_t *)&v51);
  swift_bridgeObjectRelease();
  uint64_t v9 = v51;
  uint64_t v10 = a3 + 64;
  uint64_t v11 = 1 << *(unsigned char *)(a3 + 32);
  uint64_t v12 = -1;
  if (v11 < 64) {
    uint64_t v12 = ~(-1 << v11);
  }
  unint64_t v13 = v12 & *(void *)(a3 + 64);
  int64_t v14 = (unint64_t)(v11 + 63) >> 6;
  swift_bridgeObjectRetain();
  int64_t v15 = 0;
  while (1)
  {
    while (v13)
    {
      unint64_t v16 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      unint64_t v17 = v16 | (v15 << 6);
      if (v9[2])
      {
LABEL_24:
        uint64_t v21 = 16 * v17;
        uint64_t v22 = (uint64_t *)(*(void *)(a3 + 48) + v21);
        uint64_t v23 = (uint64_t *)(*(void *)(a3 + 56) + v21);
        uint64_t v25 = *v22;
        uint64_t v24 = v22[1];
        uint64_t v27 = *v23;
        uint64_t v26 = v23[1];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        unint64_t v28 = sub_25AD0A230(v27, v26);
        if (v29)
        {
          uint64_t v30 = v9[7] + 32 * v28;
          uint64_t v49 = *(void *)(v30 + 16);
          uint64_t v50 = *(void *)(v30 + 24);
          swift_bridgeObjectRelease();
          swift_bridgeObjectRetain_n();
          char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
          unint64_t v51 = v9;
          unint64_t v33 = sub_25AD0A230(v25, v24);
          uint64_t v34 = v9[2];
          BOOL v35 = (v32 & 1) == 0;
          uint64_t v36 = v34 + v35;
          if (__OFADD__(v34, v35)) {
            goto LABEL_40;
          }
          if (v9[3] >= v36)
          {
            if ((isUniquelyReferenced_nonNull_native & 1) == 0)
            {
              char v46 = v32;
              sub_25AD0AACC();
              char v32 = v46;
            }
          }
          else
          {
            char v48 = v32;
            sub_25AD0B1AC(v36, isUniquelyReferenced_nonNull_native);
            unint64_t v37 = sub_25AD0A230(v25, v24);
            int v39 = v38 & 1;
            char v32 = v48;
            if ((v48 & 1) != v39) {
              goto LABEL_42;
            }
            unint64_t v33 = v37;
          }
          uint64_t v9 = v51;
          if (v32)
          {
            uint64_t v40 = (uint64_t *)(v51[7] + 32 * v33);
            swift_bridgeObjectRelease();
            *uint64_t v40 = v25;
            v40[1] = v24;
            v40[2] = v49;
            v40[3] = v50;
          }
          else
          {
            v51[(v33 >> 6) + 8] |= 1 << v33;
            uint64_t v41 = (uint64_t *)(v9[6] + 16 * v33);
            *uint64_t v41 = v25;
            v41[1] = v24;
            char v42 = (uint64_t *)(v9[7] + 32 * v33);
            *char v42 = v25;
            v42[1] = v24;
            v42[2] = v49;
            v42[3] = v50;
            uint64_t v43 = v9[2];
            BOOL v44 = __OFADD__(v43, 1);
            uint64_t v45 = v43 + 1;
            if (v44) {
              goto LABEL_41;
            }
            v9[2] = v45;
            swift_bridgeObjectRetain();
          }
          swift_bridgeObjectRelease_n();
          swift_bridgeObjectRelease();
        }
        else
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
        }
      }
    }
    int64_t v18 = v15 + 1;
    if (__OFADD__(v15, 1))
    {
      __break(1u);
      goto LABEL_39;
    }
    if (v18 >= v14) {
      goto LABEL_37;
    }
    unint64_t v19 = *(void *)(v10 + 8 * v18);
    ++v15;
    if (!v19)
    {
      int64_t v15 = v18 + 1;
      if (v18 + 1 >= v14) {
        goto LABEL_37;
      }
      unint64_t v19 = *(void *)(v10 + 8 * v15);
      if (!v19)
      {
        int64_t v15 = v18 + 2;
        if (v18 + 2 >= v14) {
          goto LABEL_37;
        }
        unint64_t v19 = *(void *)(v10 + 8 * v15);
        if (!v19) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v13 = (v19 - 1) & v19;
    unint64_t v17 = __clz(__rbit64(v19)) + (v15 << 6);
    if (v9[2]) {
      goto LABEL_24;
    }
  }
  int64_t v20 = v18 + 3;
  if (v20 >= v14)
  {
LABEL_37:
    swift_release();
    return (uint64_t)v9;
  }
  unint64_t v19 = *(void *)(v10 + 8 * v20);
  if (v19)
  {
    int64_t v15 = v20;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v15 = v20 + 1;
    if (__OFADD__(v20, 1)) {
      break;
    }
    if (v15 >= v14) {
      goto LABEL_37;
    }
    unint64_t v19 = *(void *)(v10 + 8 * v15);
    ++v20;
    if (v19) {
      goto LABEL_23;
    }
  }
LABEL_39:
  __break(1u);
LABEL_40:
  __break(1u);
LABEL_41:
  __break(1u);
LABEL_42:
  sub_25AD14B20();
  __break(1u);
  uint64_t result = swift_unexpectedError();
  __break(1u);
  return result;
}

uint64_t sub_25ACEBFB4()
{
  swift_bridgeObjectRelease();
  sub_25ACDF558(*(void *)(v0 + 24), *(void *)(v0 + 32));
  return MEMORY[0x270FA0228](v0, 40, 7);
}

uint64_t type metadata accessor for EventStore()
{
  return self;
}

uint64_t initializeWithCopy for Event(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for Event(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  return a1;
}

uint64_t assignWithTake for Event(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  return a1;
}

uint64_t getEnumTagSinglePayload for Event(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 32)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for Event(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)uint64_t result = a2 ^ 0x80000000;
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
LABEL_8:
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 32) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for Event()
{
  return &type metadata for Event;
}

unint64_t sub_25ACEC188()
{
  sub_25ACEEF4C(v0, (uint64_t)v7);
  sub_25ACDF604(v7, (uint64_t)v6);
  v3[0] = 0;
  v3[1] = 0xE000000000000000;
  sub_25AD14860();
  swift_bridgeObjectRelease();
  unint64_t v4 = 0xD00000000000001ELL;
  unint64_t v5 = 0x800000025AD18F40;
  sub_25ACEE04C((uint64_t)v6, (uint64_t)v3);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B32F8);
  sub_25AD14530();
  sub_25AD145A0();
  swift_bridgeObjectRelease();
  unint64_t v1 = v4;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v6);
  return v1;
}

uint64_t sub_25ACEC24C(char *a1, char *a2)
{
  return sub_25ACFBDBC(*a1, *a2);
}

uint64_t sub_25ACEC258()
{
  return sub_25AD14B90();
}

uint64_t sub_25ACEC2E4()
{
  sub_25AD14570();
  return swift_bridgeObjectRelease();
}

uint64_t sub_25ACEC35C()
{
  return sub_25AD14B90();
}

uint64_t sub_25ACEC3E4@<X0>(char *a1@<X8>)
{
  uint64_t v2 = sub_25AD14990();
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

void sub_25ACEC444(uint64_t *a1@<X8>)
{
  uint64_t v2 = 0x7265626D756ELL;
  if (*v1) {
    uint64_t v2 = 0x737265746E756F63;
  }
  unint64_t v3 = 0xE600000000000000;
  if (*v1) {
    unint64_t v3 = 0xED00006B73616D5FLL;
  }
  *a1 = v2;
  a1[1] = v3;
}

uint64_t sub_25ACEC48C()
{
  if (*v0) {
    return 0x737265746E756F63;
  }
  else {
    return 0x7265626D756ELL;
  }
}

uint64_t sub_25ACEC4D0@<X0>(char *a1@<X8>)
{
  uint64_t v2 = sub_25AD14990();
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

void sub_25ACEC534(unsigned char *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_25ACEC540(uint64_t a1)
{
  unint64_t v2 = sub_25ACEF93C();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25ACEC57C(uint64_t a1)
{
  unint64_t v2 = sub_25ACEF93C();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_25ACEC5B8@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = sub_25ACEE714(a1);
  if (!v2)
  {
    *(void *)a2 = result;
    *(unsigned char *)(a2 + 8) = v5 & 1;
    *(void *)(a2 + 16) = v6;
    *(unsigned char *)(a2 + 24) = v7 & 1;
  }
  return result;
}

uint64_t sub_25ACEC5F8(unsigned __int8 *a1, char *a2)
{
  return sub_25ACFBE6C(*a1, *a2);
}

uint64_t sub_25ACEC604()
{
  return sub_25AD14B90();
}

uint64_t sub_25ACEC6F4()
{
  sub_25AD14570();
  return swift_bridgeObjectRelease();
}

uint64_t sub_25ACEC7CC()
{
  return sub_25AD14B90();
}

uint64_t sub_25ACEC8B8@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_25ACEE8D8();
  *a1 = result;
  return result;
}

void sub_25ACEC8E8(uint64_t *a1@<X8>)
{
  unint64_t v2 = 0xEE00737265746E75;
  uint64_t v3 = 0x6F635F6465786966;
  switch(*v1)
  {
    case 1:
      unint64_t v2 = 0xEF737265746E756FLL;
      uint64_t v3 = 0x635F6769666E6F63;
      goto LABEL_3;
    case 2:
      *a1 = 0x73657361696C61;
      a1[1] = 0xE700000000000000;
      break;
    case 3:
      *a1 = 0x73746E657665;
      a1[1] = 0xE600000000000000;
      break;
    default:
LABEL_3:
      *a1 = v3;
      a1[1] = v2;
      break;
  }
}

uint64_t sub_25ACEC998()
{
  uint64_t result = 0x6F635F6465786966;
  switch(*v0)
  {
    case 1:
      uint64_t result = 0x635F6769666E6F63;
      break;
    case 2:
      uint64_t result = 0x73657361696C61;
      break;
    case 3:
      uint64_t result = 0x73746E657665;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_25ACECA3C@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_25ACEE8D8();
  *a1 = result;
  return result;
}

uint64_t sub_25ACECA64(uint64_t a1)
{
  unint64_t v2 = sub_25ACEF52C();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25ACECAA0(uint64_t a1)
{
  unint64_t v2 = sub_25ACEF52C();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_25ACECADC@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = sub_25ACEE924(a1);
  if (!v2)
  {
    *a2 = result;
    a2[1] = v5;
    a2[2] = v6;
    a2[3] = v7;
  }
  return result;
}

uint64_t sub_25ACECB0C()
{
  return 7696483;
}

uint64_t sub_25ACECB1C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  if (a1 == 7696483 && a2 == 0xE300000000000000)
  {
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = 0;
  }
  else
  {
    char v5 = sub_25AD14AF0();
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

uint64_t sub_25ACECBA4(uint64_t a1)
{
  unint64_t v2 = sub_25ACEF164();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25ACECBE0(uint64_t a1)
{
  unint64_t v2 = sub_25ACEF164();
  return MEMORY[0x270FA00B8](a1, v2);
}

void *sub_25ACECC1C@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t result = sub_25ACEEBAC(a1);
  if (!v2)
  {
    *a2 = result;
    a2[1] = v5;
    a2[2] = v6;
    a2[3] = v7;
  }
  return result;
}

uint64_t sub_25ACECC4C()
{
  return sub_25AD14B90();
}

uint64_t sub_25ACECC90()
{
  return sub_25AD14B90();
}

uint64_t sub_25ACECCD0()
{
  return 0x6D6574737973;
}

uint64_t sub_25ACECCE4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  if (a1 == 0x6D6574737973 && a2 == 0xE600000000000000)
  {
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = 0;
  }
  else
  {
    char v5 = sub_25AD14AF0();
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

uint64_t sub_25ACECD74(uint64_t a1)
{
  unint64_t v2 = sub_25ACEEEA4();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25ACECDB0(uint64_t a1)
{
  unint64_t v2 = sub_25ACEEEA4();
  return MEMORY[0x270FA00B8](a1, v2);
}

void *sub_25ACECDEC@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t result = sub_25ACEED28(a1);
  if (!v2)
  {
    *a2 = result;
    a2[1] = v5;
    a2[2] = v6;
    a2[3] = v7;
  }
  return result;
}

uint64_t sub_25ACECE1C(uint64_t a1, char a2, uint64_t *a3)
{
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3) {
    return swift_bridgeObjectRelease();
  }
  uint64_t v6 = (void *)swift_bridgeObjectRetain();
  uint64_t v8 = v6[4];
  uint64_t v7 = v6[5];
  uint64_t v10 = v6[6];
  uint64_t v9 = v6[7];
  uint64_t v51 = v6[8];
  uint64_t v52 = v6;
  uint64_t v50 = v6[9];
  uint64_t v53 = a3;
  uint64_t v11 = *a3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  unint64_t v13 = sub_25AD0A230(v8, v7);
  uint64_t v14 = *(void *)(v11 + 16);
  BOOL v15 = (v12 & 1) == 0;
  uint64_t v16 = v14 + v15;
  if (__OFADD__(v14, v15)) {
    goto LABEL_23;
  }
  char v17 = v12;
  if (*(void *)(v11 + 24) >= v16)
  {
    if (a2)
    {
      if (v12) {
        goto LABEL_10;
      }
    }
    else
    {
      sub_25AD0AACC();
      if (v17) {
        goto LABEL_10;
      }
    }
LABEL_13:
    uint64_t v22 = a3;
    uint64_t v23 = (void *)*a3;
    *(void *)(*a3 + 8 * (v13 >> 6) + 64) |= 1 << v13;
    uint64_t v24 = (uint64_t *)(v23[6] + 16 * v13);
    *uint64_t v24 = v8;
    v24[1] = v7;
    uint64_t v25 = (void *)(v23[7] + 32 * v13);
    *uint64_t v25 = v10;
    v25[1] = v9;
    v25[2] = v51;
    v25[3] = v50;
    uint64_t v26 = v23[2];
    BOOL v27 = __OFADD__(v26, 1);
    uint64_t v28 = v26 + 1;
    if (v27)
    {
LABEL_24:
      __break(1u);
      goto LABEL_25;
    }
    v23[2] = v28;
    uint64_t v29 = v3 - 1;
    if (v3 == 1) {
      return swift_bridgeObjectRelease_n();
    }
    for (uint64_t i = v52 + 15; ; i += 6)
    {
      uint64_t v32 = *(i - 5);
      uint64_t v31 = *(i - 4);
      uint64_t v34 = *(i - 3);
      uint64_t v33 = *(i - 2);
      uint64_t v35 = *(i - 1);
      uint64_t v36 = *i;
      uint64_t v37 = *v22;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      unint64_t v38 = sub_25AD0A230(v32, v31);
      uint64_t v40 = *(void *)(v37 + 16);
      BOOL v41 = (v39 & 1) == 0;
      BOOL v27 = __OFADD__(v40, v41);
      uint64_t v42 = v40 + v41;
      if (v27) {
        break;
      }
      char v43 = v39;
      if (*(void *)(v37 + 24) < v42)
      {
        sub_25AD0B1AC(v42, 1);
        unint64_t v38 = sub_25AD0A230(v32, v31);
        if ((v43 & 1) != (v44 & 1)) {
          goto LABEL_25;
        }
      }
      if (v43) {
        goto LABEL_10;
      }
      uint64_t v22 = v53;
      uint64_t v45 = (void *)*v53;
      *(void *)(*v53 + 8 * (v38 >> 6) + 64) |= 1 << v38;
      char v46 = (uint64_t *)(v45[6] + 16 * v38);
      *char v46 = v32;
      v46[1] = v31;
      char v47 = (void *)(v45[7] + 32 * v38);
      *char v47 = v34;
      v47[1] = v33;
      v47[2] = v35;
      v47[3] = v36;
      uint64_t v48 = v45[2];
      BOOL v27 = __OFADD__(v48, 1);
      uint64_t v49 = v48 + 1;
      if (v27) {
        goto LABEL_24;
      }
      v45[2] = v49;
      if (!--v29) {
        return swift_bridgeObjectRelease_n();
      }
    }
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  sub_25AD0B1AC(v16, a2 & 1);
  unint64_t v18 = sub_25AD0A230(v8, v7);
  if ((v17 & 1) == (v19 & 1))
  {
    unint64_t v13 = v18;
    if ((v17 & 1) == 0) {
      goto LABEL_13;
    }
LABEL_10:
    uint64_t v21 = swift_allocError();
    swift_willThrow();
    MEMORY[0x261155480](v21);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B31A0);
    if ((swift_dynamicCast() & 1) == 0)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease_n();
      return MEMORY[0x261155470](v21);
    }
    goto LABEL_26;
  }
LABEL_25:
  sub_25AD14B20();
  __break(1u);
LABEL_26:
  sub_25AD14860();
  sub_25AD145A0();
  sub_25AD14910();
  sub_25AD145A0();
  uint64_t result = sub_25AD14930();
  __break(1u);
  return result;
}

uint64_t sub_25ACED1F0(uint64_t a1, unint64_t a2)
{
  sub_25AD14300();
  swift_allocObject();
  sub_25AD142F0();
  sub_25ACEDFA4();
  sub_25AD142E0();
  if (v2)
  {
    uint64_t v9 = v2;
    MEMORY[0x261155480](v2);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B31A0);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B32F8);
    if (swift_dynamicCast())
    {
      MEMORY[0x261155470](v2);
      sub_25ACDF604(&v8, (uint64_t)v7);
      sub_25ACEDFF8();
      swift_allocError();
      sub_25ACEE04C((uint64_t)v7, v5);
      swift_willThrow();
      swift_release();
      sub_25ACDF56C(a1, a2);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v7);
    }
    else
    {
      sub_25ACDF56C(a1, a2);
      swift_release();
    }
    return MEMORY[0x261155470](v9);
  }
  else
  {
    sub_25ACDF56C(a1, a2);
    swift_release();
    return v8;
  }
}

uint64_t sub_25ACED36C(uint64_t a1, void (*a2)(void *__return_ptr, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void))
{
  uint64_t v31 = a1 + 64;
  uint64_t v2 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v3 = -1;
  if (v2 < 64) {
    uint64_t v3 = ~(-1 << v2);
  }
  unint64_t v4 = v3 & *(void *)(a1 + 64);
  int64_t v32 = (unint64_t)(v2 + 63) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v35 = 0;
  uint64_t v30 = (void *)MEMORY[0x263F8EE78];
  if (!v4) {
    goto LABEL_7;
  }
LABEL_4:
  unint64_t v6 = __clz(__rbit64(v4));
  v4 &= v4 - 1;
  for (unint64_t i = v6 | (v35 << 6); ; unint64_t i = __clz(__rbit64(v23)) + (v24 << 6))
  {
    long long v8 = (uint64_t *)(*(void *)(a1 + 48) + 16 * i);
    uint64_t v9 = *v8;
    uint64_t v10 = v8[1];
    uint64_t v11 = *(void *)(a1 + 56) + 32 * i;
    uint64_t v12 = *(void *)v11;
    uint64_t v13 = *(unsigned __int8 *)(v11 + 8);
    uint64_t v14 = *(void *)(v11 + 16);
    unsigned __int8 v15 = *(unsigned char *)(v11 + 24);
    swift_bridgeObjectRetain();
    char v39 = v13;
    a2(v36, v9, v10, v12, v13, v14, v15);
    uint64_t v16 = v36[0];
    uint64_t v17 = v36[1];
    uint64_t v19 = v36[2];
    uint64_t v18 = v36[3];
    uint64_t v21 = v36[4];
    uint64_t v20 = v36[5];
    swift_bridgeObjectRelease();
    uint64_t result = sub_25ACEDF3C((uint64_t)v36, (uint64_t)v37);
    if (v38)
    {
      uint64_t result = swift_isUniquelyReferenced_nonNull_native();
      if ((result & 1) == 0)
      {
        uint64_t result = (uint64_t)sub_25ACFF4BC(0, v30[2] + 1, 1, v30);
        uint64_t v30 = (void *)result;
      }
      unint64_t v27 = v30[2];
      unint64_t v26 = v30[3];
      unint64_t v28 = v27 + 1;
      if (v27 >= v26 >> 1)
      {
        uint64_t result = (uint64_t)sub_25ACFF4BC((void *)(v26 > 1), v27 + 1, 1, v30);
        unint64_t v28 = v27 + 1;
        uint64_t v30 = (void *)result;
      }
      v30[2] = v28;
      uint64_t v29 = &v30[6 * v27];
      v29[4] = v16;
      v29[5] = v17;
      v29[6] = v19;
      v29[7] = v18;
      v29[8] = v21;
      v29[9] = v20;
      if (v4) {
        goto LABEL_4;
      }
    }
    else if (v4)
    {
      goto LABEL_4;
    }
LABEL_7:
    int64_t v22 = v35 + 1;
    if (__OFADD__(v35, 1))
    {
      __break(1u);
      goto LABEL_31;
    }
    if (v22 >= v32) {
      goto LABEL_29;
    }
    unint64_t v23 = *(void *)(v31 + 8 * v22);
    int64_t v24 = v35 + 1;
    if (!v23)
    {
      int64_t v24 = v35 + 2;
      if (v35 + 2 >= v32) {
        goto LABEL_29;
      }
      unint64_t v23 = *(void *)(v31 + 8 * v24);
      if (!v23)
      {
        int64_t v24 = v35 + 3;
        if (v35 + 3 >= v32) {
          goto LABEL_29;
        }
        unint64_t v23 = *(void *)(v31 + 8 * v24);
        if (!v23)
        {
          int64_t v24 = v35 + 4;
          if (v35 + 4 >= v32) {
            goto LABEL_29;
          }
          unint64_t v23 = *(void *)(v31 + 8 * v24);
          if (!v23) {
            break;
          }
        }
      }
    }
LABEL_22:
    unint64_t v4 = (v23 - 1) & v23;
    int64_t v35 = v24;
  }
  int64_t v25 = v35 + 5;
  if (v35 + 5 >= v32)
  {
LABEL_29:
    swift_release();
    return (uint64_t)v30;
  }
  unint64_t v23 = *(void *)(v31 + 8 * v25);
  if (v23)
  {
    int64_t v24 = v35 + 5;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v24 = v25 + 1;
    if (__OFADD__(v25, 1)) {
      break;
    }
    if (v24 >= v32) {
      goto LABEL_29;
    }
    unint64_t v23 = *(void *)(v31 + 8 * v24);
    ++v25;
    if (v23) {
      goto LABEL_22;
    }
  }
LABEL_31:
  __break(1u);
  return result;
}

void *sub_25ACED62C(uint64_t a1)
{
  uint64_t v2 = *(void *)a1;
  uint64_t v86 = *(void *)(a1 + 8);
  uint64_t v87 = v2;
  uint64_t v3 = *(void *)(a1 + 16);
  uint64_t v84 = *(void *)(a1 + 24);
  uint64_t v85 = v3;
  uint64_t v4 = *(void *)(a1 + 32);
  int v83 = *(_DWORD *)(a1 + 40);
  uint64_t v82 = *(void *)(a1 + 48);
  uint64_t v81 = *(void *)(a1 + 56);
  uint64_t v80 = *(void *)(a1 + 64);
  uint64_t v79 = *(void *)(a1 + 72);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B30A0);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v79 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_25AD14360();
  uint64_t v94 = *(void *)(v8 - 8);
  uint64_t v9 = v94;
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v79 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v91 = v11;
  uint64_t v98 = sub_25AD143E0();
  uint64_t v12 = *(void *)(v98 - 8);
  uint64_t v13 = MEMORY[0x270FA5388](v98);
  uint64_t v95 = (char *)&v79 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = MEMORY[0x270FA5388](v13);
  unint64_t v96 = (char *)&v79 - v16;
  uint64_t v17 = MEMORY[0x270FA5388](v15);
  unint64_t v99 = (char *)&v79 - v18;
  uint64_t v19 = MEMORY[0x270FA5388](v17);
  uint64_t v100 = (char *)&v79 - v20;
  MEMORY[0x270FA5388](v19);
  v97 = (char *)&v79 - v21;
  uint64_t v22 = *MEMORY[0x263F06E30];
  unint64_t v23 = *(void (**)(char *, uint64_t, uint64_t))(v9 + 104);
  uint64_t v101 = v9 + 104;
  v23(v11, v22, v8);
  uint64_t v93 = v23;
  uint64_t v90 = v12;
  int64_t v24 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v12 + 56);
  uint64_t v25 = v98;
  v24(v7, 1, 1, v98);
  unint64_t v26 = v91;
  sub_25AD143C0();
  v23(v26, v22, v8);
  v24(v7, 1, 1, v25);
  sub_25AD143C0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B32C8);
  uint64_t v27 = swift_allocObject();
  *(_OWORD *)(v27 + 16) = xmmword_25AD162C0;
  uint64_t v28 = MEMORY[0x263F8E8F8];
  int v29 = *(_DWORD *)(a1 + 36);
  *(_DWORD *)(v27 + 32) = *(_DWORD *)(a1 + 32);
  uint64_t v30 = MEMORY[0x263F8E960];
  *(void *)(v27 + 56) = v28;
  *(void *)(v27 + 64) = v30;
  *(void *)(v27 + 96) = v28;
  *(void *)(v27 + 104) = v30;
  *(_DWORD *)(v27 + 72) = v29;
  uint64_t v88 = a1;
  int v31 = *(_DWORD *)(a1 + 40);
  *(void *)(v27 + 136) = v28;
  *(void *)(v27 + 144) = v30;
  *(_DWORD *)(v27 + 112) = v31;
  uint64_t v32 = sub_25AD144F0();
  uint64_t v92 = v33;
  uint64_t v102 = v32;
  uint64_t v103 = v33;
  uint64_t v34 = *MEMORY[0x263F06E50];
  int64_t v35 = v26;
  uint64_t v36 = v26;
  uint64_t v37 = v8;
  uint64_t v38 = v8;
  char v39 = v93;
  v93(v36, v34, v37);
  sub_25ACEDE04();
  sub_25AD143D0();
  uint64_t v40 = *(void (**)(char *, uint64_t))(v94 + 8);
  v40(v35, v38);
  uint64_t v102 = v32;
  uint64_t v103 = v92;
  uint64_t v41 = v34;
  uint64_t v42 = v38;
  v39(v35, v41, v38);
  char v43 = v96;
  sub_25AD143D0();
  v40(v35, v42);
  char v44 = v43;
  swift_bridgeObjectRelease();
  uint64_t v45 = (void *)0x263F08000;
  id v46 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08850]), sel_init);
  char v47 = v99;
  sub_25AD143B0();
  uint64_t v48 = (void *)sub_25AD144C0();
  swift_bridgeObjectRelease();
  LOBYTE(v39) = objc_msgSend(v46, sel_fileExistsAtPath_, v48);

  uint64_t v49 = v47;
  if ((v39 & 1) == 0)
  {
    id v50 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08850]), sel_init);
    sub_25AD143B0();
    uint64_t v51 = (void *)sub_25AD144C0();
    swift_bridgeObjectRelease();
    unsigned __int8 v52 = objc_msgSend(v50, sel_fileExistsAtPath_, v51);

    uint64_t v49 = v44;
    if ((v52 & 1) == 0)
    {
      sub_25ACEDE58();
      swift_allocError();
      uint64_t v68 = v86;
      *(void *)uint64_t v69 = v87;
      *(void *)(v69 + 8) = v68;
      uint64_t v70 = v84;
      *(void *)(v69 + 16) = v85;
      *(void *)(v69 + 24) = v70;
      *(void *)(v69 + 32) = v4;
      *(_DWORD *)(v69 + 40) = v83;
      uint64_t v71 = v81;
      *(void *)(v69 + 48) = v82;
      *(void *)(v69 + 56) = v71;
      uint64_t v72 = v79;
      *(void *)(v69 + 64) = v80;
      *(void *)(v69 + 72) = v72;
      swift_willThrow();
      uint64_t v59 = *(void (**)(char *, uint64_t))(v90 + 8);
      uint64_t v60 = v97;
      uint64_t v55 = v98;
      uint64_t v66 = v99;
      uint64_t v61 = v100;
      uint64_t v67 = v44;
      goto LABEL_7;
    }
  }
  sub_25ACDF6AC(v88);
  uint64_t v53 = v90;
  unint64_t v54 = v95;
  uint64_t v55 = v98;
  (*(void (**)(char *, char *, uint64_t))(v90 + 16))(v95, v49, v98);
  uint64_t v56 = v89;
  uint64_t v57 = sub_25AD143F0();
  if (v56)
  {
    uint64_t v59 = *(void (**)(char *, uint64_t))(v53 + 8);
    v59(v54, v55);
    uint64_t v60 = v97;
    uint64_t v61 = v100;
    uint64_t v66 = v99;
    uint64_t v67 = v96;
LABEL_7:
    v59(v67, v55);
    v59(v66, v55);
    v59(v61, v55);
    v59(v60, v55);
    return v45;
  }
  uint64_t v62 = v57;
  unint64_t v63 = v58;
  sub_25ACDF450(v57, v58);
  uint64_t v64 = sub_25ACED1F0(v62, v63);
  BOOL v65 = v100;
  uint64_t v77 = sub_25ACEBBF0(v64, v74, v75, v76);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  type metadata accessor for EventStore();
  uint64_t v45 = (void *)swift_allocObject();
  v45[2] = v77;
  v45[3] = v62;
  v45[4] = v63;
  uint64_t v78 = *(void (**)(char *, uint64_t))(v53 + 8);
  v78(v95, v55);
  v78(v96, v55);
  v78(v99, v55);
  v78(v65, v55);
  v78(v97, v55);
  return v45;
}

unint64_t sub_25ACEDE04()
{
  unint64_t result = qword_26A4B32D0;
  if (!qword_26A4B32D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4B32D0);
  }
  return result;
}

unint64_t sub_25ACEDE58()
{
  unint64_t result = qword_26A4B32D8;
  if (!qword_26A4B32D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4B32D8);
  }
  return result;
}

uint64_t sub_25ACEDEAC@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char a4@<W3>, uint64_t a5@<X4>, char a6@<W5>, uint64_t *a7@<X8>)
{
  if (a4)
  {
    uint64_t v11 = 0;
    a2 = 0;
    a3 = 0;
    a5 = 0;
  }
  else
  {
    uint64_t v11 = result;
    if (a6) {
      a5 = *(void *)(v7 + 24);
    }
    unint64_t result = swift_bridgeObjectRetain_n();
  }
  *a7 = v11;
  a7[1] = a2;
  a7[2] = v11;
  a7[3] = a2;
  a7[4] = a3;
  a7[5] = a5;
  return result;
}

uint64_t sub_25ACEDF3C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B32E8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_25ACEDFA4()
{
  unint64_t result = qword_26A4B32F0;
  if (!qword_26A4B32F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4B32F0);
  }
  return result;
}

unint64_t sub_25ACEDFF8()
{
  unint64_t result = qword_26A4B3300;
  if (!qword_26A4B3300)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4B3300);
  }
  return result;
}

uint64_t sub_25ACEE04C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t initializeWithCopy for KPEPError(uint64_t a1, uint64_t a2)
{
  long long v3 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v3;
  (**(void (***)(void))(v3 - 8))();
  return a1;
}

uint64_t *assignWithCopy for KPEPError(uint64_t *a1, uint64_t *a2)
{
  return a1;
}

uint64_t *__swift_assign_boxed_opaque_existential_1(uint64_t *result, uint64_t *a2)
{
  if (result != a2)
  {
    long long v3 = result;
    uint64_t v4 = result[3];
    uint64_t v5 = a2[3];
    if (v4 == v5)
    {
      uint64_t v10 = *(void *)(v4 - 8);
      if ((*(unsigned char *)(v10 + 82) & 2) != 0)
      {
        uint64_t v12 = *a2;
        swift_retain();
        unint64_t result = (uint64_t *)swift_release();
        *long long v3 = v12;
      }
      else
      {
        uint64_t v11 = *(uint64_t (**)(void))(v10 + 24);
        return (uint64_t *)v11();
      }
    }
    else
    {
      result[3] = v5;
      result[4] = a2[4];
      uint64_t v6 = *(void *)(v4 - 8);
      uint64_t v7 = *(void *)(v5 - 8);
      uint64_t v8 = v7;
      int v9 = *(_DWORD *)(v7 + 80);
      if ((*(unsigned char *)(v6 + 82) & 2) != 0)
      {
        if ((v9 & 0x20000) != 0)
        {
          *unint64_t result = *a2;
          swift_retain();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v7 + 16))(result, a2, v5);
        }
        return (uint64_t *)swift_release();
      }
      else
      {
        (*(void (**)(unsigned char *, uint64_t *, uint64_t))(v6 + 32))(v13, result, v4);
        if ((v9 & 0x20000) != 0)
        {
          *long long v3 = *a2;
          swift_retain();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v8 + 16))(v3, a2, v5);
        }
        return (uint64_t *)(*(uint64_t (**)(unsigned char *, uint64_t))(v6 + 8))(v13, v4);
      }
    }
  }
  return result;
}

uint64_t assignWithTake for KPEPError(uint64_t a1, uint64_t a2)
{
  __swift_destroy_boxed_opaque_existential_1(a1);
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  return a1;
}

uint64_t getEnumTagSinglePayload for KPEPError(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 40)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for KPEPError(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(void *)unint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 40) = 1;
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
      *(void *)(result + 24) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 40) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for KPEPError()
{
  return &type metadata for KPEPError;
}

ValueMetadata *type metadata accessor for KPEPPropertyList()
{
  return &type metadata for KPEPPropertyList;
}

uint64_t destroy for Silicon()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for Silicon(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(_DWORD *)(a1 + 40) = *(_DWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  uint64_t v5 = *(void *)(a2 + 72);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = v5;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for Silicon(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_DWORD *)(a1 + 32) = *(_DWORD *)(a2 + 32);
  *(_DWORD *)(a1 + 36) = *(_DWORD *)(a2 + 36);
  *(_DWORD *)(a1 + 40) = *(_DWORD *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy80_8(uint64_t a1, uint64_t a2)
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

uint64_t assignWithTake for Silicon(uint64_t a1, uint64_t a2)
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
  *(_DWORD *)(a1 + 40) = *(_DWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  uint64_t v6 = *(void *)(a2 + 72);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = v6;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for Silicon(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 80)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for Silicon(uint64_t result, int a2, int a3)
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
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 80) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for EventStoreError()
{
  return &type metadata for EventStoreError;
}

uint64_t sub_25ACEE714(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B33C0);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = &v13[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v7 = a1[3];
  __swift_project_boxed_opaque_existential_1(a1, v7);
  sub_25ACEF93C();
  sub_25AD14BA0();
  if (v1)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  else
  {
    v13[31] = 0;
    uint64_t v7 = sub_25AD149D0();
    char v9 = v8;
    v13[30] = 1;
    sub_25AD149D0();
    char v12 = v11;
    (*(void (**)(unsigned char *, uint64_t))(v4 + 8))(v6, v3);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    unsigned char v13[24] = v9 & 1;
    v13[8] = v12 & 1;
  }
  return v7;
}

uint64_t sub_25ACEE8D8()
{
  unint64_t v0 = sub_25AD14990();
  swift_bridgeObjectRelease();
  if (v0 >= 4) {
    return 4;
  }
  else {
    return v0;
  }
}

uint64_t sub_25ACEE924(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B3370);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = a1[3];
  __swift_project_boxed_opaque_existential_1(a1, v7);
  sub_25ACEF52C();
  sub_25AD14BA0();
  if (v1)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  else
  {
    LOBYTE(v11) = 0;
    uint64_t v7 = sub_25AD14A20();
    LOBYTE(v11) = 1;
    sub_25AD14A20();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B3380);
    char v10 = 2;
    sub_25ACEF580();
    sub_25AD14A00();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B3390);
    char v10 = 3;
    sub_25ACEF5EC();
    swift_bridgeObjectRetain();
    sub_25AD14A00();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    swift_bridgeObjectRetain();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return v7;
}

void *sub_25ACEEBAC(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B3340);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25ACEF164();
  sub_25AD14BA0();
  if (v1)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  else
  {
    sub_25ACEF1B8();
    sub_25AD14A00();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    uint64_t v7 = v9;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  return v7;
}

void *sub_25ACEED28(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B3308);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25ACEEEA4();
  sub_25AD14BA0();
  if (v1)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  else
  {
    sub_25ACEEEF8();
    sub_25AD14A00();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    uint64_t v7 = v9;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  return v7;
}

unint64_t sub_25ACEEEA4()
{
  unint64_t result = qword_26A4B3310;
  if (!qword_26A4B3310)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4B3310);
  }
  return result;
}

unint64_t sub_25ACEEEF8()
{
  unint64_t result = qword_26A4B3318;
  if (!qword_26A4B3318)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4B3318);
  }
  return result;
}

uint64_t sub_25ACEEF4C(uint64_t a1, uint64_t a2)
{
  long long v3 = *(_OWORD *)(a1 + 24);
  *(_OWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

_OWORD *sub_25ACEEFAC(_OWORD *a1, _OWORD *a2)
{
  *a2 = *a1;
  long long v2 = a1[1];
  long long v3 = a1[2];
  long long v4 = a1[4];
  a2[3] = a1[3];
  a2[4] = v4;
  a2[1] = v2;
  a2[2] = v3;
  return a2;
}

ValueMetadata *type metadata accessor for KPEPPropertyList.CodingKeys()
{
  return &type metadata for KPEPPropertyList.CodingKeys;
}

ValueMetadata *type metadata accessor for KPEPPropertyList.SystemList()
{
  return &type metadata for KPEPPropertyList.SystemList;
}

ValueMetadata *type metadata accessor for EventSource()
{
  return &type metadata for EventSource;
}

unint64_t sub_25ACEF008()
{
  unint64_t result = qword_26A4B3320;
  if (!qword_26A4B3320)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4B3320);
  }
  return result;
}

unint64_t sub_25ACEF060()
{
  unint64_t result = qword_26A4B3328;
  if (!qword_26A4B3328)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4B3328);
  }
  return result;
}

unint64_t sub_25ACEF0B8()
{
  unint64_t result = qword_26A4B3330;
  if (!qword_26A4B3330)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4B3330);
  }
  return result;
}

unint64_t sub_25ACEF110()
{
  unint64_t result = qword_26A4B3338;
  if (!qword_26A4B3338)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4B3338);
  }
  return result;
}

unint64_t sub_25ACEF164()
{
  unint64_t result = qword_26A4B3348;
  if (!qword_26A4B3348)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4B3348);
  }
  return result;
}

unint64_t sub_25ACEF1B8()
{
  unint64_t result = qword_26A4B3350;
  if (!qword_26A4B3350)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4B3350);
  }
  return result;
}

unsigned char *_s7Recount11EventSourceOwst_0(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x25ACEF2A8);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for KPEPPropertyList.SystemList.CodingKeys()
{
  return &type metadata for KPEPPropertyList.SystemList.CodingKeys;
}

uint64_t _s7Recount16KPEPPropertyListV6SystemVwxx_0()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t _s7Recount16KPEPPropertyListV6SystemVwcp_0(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  uint64_t v3 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *_s7Recount16KPEPPropertyListV6SystemVwca_0(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_OWORD *_s7Recount16KPEPPropertyListV6SystemVwta_0(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_bridgeObjectRelease();
  return a1;
}

ValueMetadata *type metadata accessor for KPEPPropertyList.System()
{
  return &type metadata for KPEPPropertyList.System;
}

unint64_t sub_25ACEF428()
{
  unint64_t result = qword_26A4B3358;
  if (!qword_26A4B3358)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4B3358);
  }
  return result;
}

unint64_t sub_25ACEF480()
{
  unint64_t result = qword_26A4B3360;
  if (!qword_26A4B3360)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4B3360);
  }
  return result;
}

unint64_t sub_25ACEF4D8()
{
  unint64_t result = qword_26A4B3368;
  if (!qword_26A4B3368)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4B3368);
  }
  return result;
}

unint64_t sub_25ACEF52C()
{
  unint64_t result = qword_26A4B3378;
  if (!qword_26A4B3378)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4B3378);
  }
  return result;
}

unint64_t sub_25ACEF580()
{
  unint64_t result = qword_26A4B3388;
  if (!qword_26A4B3388)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A4B3380);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4B3388);
  }
  return result;
}

unint64_t sub_25ACEF5EC()
{
  unint64_t result = qword_26A4B3398;
  if (!qword_26A4B3398)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A4B3390);
    sub_25ACEF668();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4B3398);
  }
  return result;
}

unint64_t sub_25ACEF668()
{
  unint64_t result = qword_26A4B33A0;
  if (!qword_26A4B33A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4B33A0);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for KPEPPropertyList.System.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x25ACEF788);
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

ValueMetadata *type metadata accessor for KPEPPropertyList.System.CodingKeys()
{
  return &type metadata for KPEPPropertyList.System.CodingKeys;
}

__n128 __swift_memcpy25_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  *(_OWORD *)(a1 + 9) = *(_OWORD *)(a2 + 9);
  *(__n128 *)a1 = result;
  return result;
}

uint64_t getEnumTagSinglePayload for KPEPPropertyList.KPEPEvent(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 25)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for KPEPPropertyList.KPEPEvent(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(unsigned char *)(result + 24) = 0;
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
  *(unsigned char *)(result + 25) = v3;
  return result;
}

ValueMetadata *type metadata accessor for KPEPPropertyList.KPEPEvent()
{
  return &type metadata for KPEPPropertyList.KPEPEvent;
}

unint64_t sub_25ACEF838()
{
  unint64_t result = qword_26A4B33A8;
  if (!qword_26A4B33A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4B33A8);
  }
  return result;
}

unint64_t sub_25ACEF890()
{
  unint64_t result = qword_26A4B33B0;
  if (!qword_26A4B33B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4B33B0);
  }
  return result;
}

unint64_t sub_25ACEF8E8()
{
  unint64_t result = qword_26A4B33B8;
  if (!qword_26A4B33B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4B33B8);
  }
  return result;
}

unint64_t sub_25ACEF93C()
{
  unint64_t result = qword_26A4B33C8;
  if (!qword_26A4B33C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4B33C8);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for KPEPPropertyList.KPEPEvent.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for KPEPPropertyList.KPEPEvent.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x25ACEFAECLL);
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

unsigned char *sub_25ACEFB14(unsigned char *result, char a2)
{
  *unint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for KPEPPropertyList.KPEPEvent.CodingKeys()
{
  return &type metadata for KPEPPropertyList.KPEPEvent.CodingKeys;
}

unint64_t sub_25ACEFB34()
{
  unint64_t result = qword_26A4B33D0;
  if (!qword_26A4B33D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4B33D0);
  }
  return result;
}

unint64_t sub_25ACEFB8C()
{
  unint64_t result = qword_26A4B33D8;
  if (!qword_26A4B33D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4B33D8);
  }
  return result;
}

unint64_t sub_25ACEFBE4()
{
  unint64_t result = qword_26A4B33E0;
  if (!qword_26A4B33E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4B33E0);
  }
  return result;
}

uint64_t destroy for ModeSpec()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for ModeSpec(void *a1, void *a2)
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
  uint64_t v7 = a2[9];
  a1[8] = a2[8];
  a1[9] = v7;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for ModeSpec(void *a1, void *a2)
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
  a1[8] = a2[8];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[9] = a2[9];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for ModeSpec(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v6;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  swift_bridgeObjectRelease();
  return a1;
}

ValueMetadata *type metadata accessor for ModeSpec()
{
  return &type metadata for ModeSpec;
}

unint64_t sub_25ACEFE98(char a1)
{
  unint64_t result = 1701667182;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x4E79616C70736964;
      break;
    case 2:
      unint64_t result = 0xD000000000000012;
      break;
    case 3:
      unint64_t result = 0xD000000000000014;
      break;
    case 4:
      unint64_t result = 0x7363697274656DLL;
      break;
    case 5:
      unint64_t result = 1937007987;
      break;
    default:
      return result;
  }
  return result;
}

unint64_t sub_25ACEFF64()
{
  return sub_25ACEFE98(*v0);
}

uint64_t sub_25ACEFF6C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_25ACF0064(a1, a2);
  *a3 = result;
  return result;
}

void sub_25ACEFF94(unsigned char *a1@<X8>)
{
  *a1 = 6;
}

uint64_t sub_25ACEFFA0(uint64_t a1)
{
  unint64_t v2 = sub_25ACF083C();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25ACEFFDC(uint64_t a1)
{
  unint64_t v2 = sub_25ACF083C();
  return MEMORY[0x270FA00B8](a1, v2);
}

__n128 sub_25ACF0018@<Q0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  sub_25ACF02D4(a1, (uint64_t *)v6);
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

uint64_t sub_25ACF0064(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 1701667182 && a2 == 0xE400000000000000;
  if (v2 || (sub_25AD14AF0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x4E79616C70736964 && a2 == 0xEB00000000656D61 || (sub_25AD14AF0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD000000000000012 && a2 == 0x800000025AD18470 || (sub_25AD14AF0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0xD000000000000014 && a2 == 0x800000025AD18E10 || (sub_25AD14AF0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x7363697274656DLL && a2 == 0xE700000000000000 || (sub_25AD14AF0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 1937007987 && a2 == 0xE400000000000000)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else
  {
    char v6 = sub_25AD14AF0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 5;
    }
    else {
      return 6;
    }
  }
}

uint64_t sub_25ACF02D4@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B33E8);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  int v8 = (char *)&v25 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25ACF083C();
  sub_25AD14BA0();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  LOBYTE(v35) = 0;
  uint64_t v9 = sub_25AD149E0();
  uint64_t v11 = v10;
  LOBYTE(v35) = 1;
  swift_bridgeObjectRetain();
  uint64_t v31 = sub_25AD149E0();
  uint64_t v32 = v9;
  LOBYTE(v35) = 2;
  uint64_t v13 = v12;
  swift_bridgeObjectRetain();
  uint64_t v14 = sub_25AD149E0();
  uint64_t v33 = v15;
  uint64_t v27 = v14;
  uint64_t v29 = v13;
  LOBYTE(v35) = 3;
  swift_bridgeObjectRetain();
  uint64_t v28 = 0;
  uint64_t v26 = sub_25AD149E0();
  uint64_t v17 = v16;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B33F8);
  char v34 = 4;
  sub_25ACF08E4(&qword_26A4B3400, &qword_26A4B33F8, (void (*)(void))sub_25ACF0890);
  uint64_t v30 = v17;
  swift_bridgeObjectRetain();
  sub_25AD14A00();
  uint64_t v18 = v35;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B3410);
  char v34 = 5;
  sub_25ACF08E4(&qword_26A4B3418, &qword_26A4B3410, (void (*)(void))sub_25ACF095C);
  uint64_t v25 = v18;
  swift_bridgeObjectRetain();
  sub_25AD14A00();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  uint64_t v19 = v35;
  swift_bridgeObjectRetain();
  uint64_t v20 = v29;
  swift_bridgeObjectRetain();
  uint64_t v21 = v33;
  swift_bridgeObjectRetain();
  uint64_t v22 = v30;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  swift_bridgeObjectRelease();
  uint64_t v23 = v25;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t result = swift_bridgeObjectRelease();
  *a2 = v32;
  a2[1] = v11;
  a2[2] = v31;
  a2[3] = v20;
  a2[4] = v27;
  a2[5] = v21;
  a2[6] = v26;
  a2[7] = v22;
  a2[8] = v23;
  a2[9] = v19;
  return result;
}

unint64_t sub_25ACF083C()
{
  unint64_t result = qword_26A4B33F0;
  if (!qword_26A4B33F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4B33F0);
  }
  return result;
}

unint64_t sub_25ACF0890()
{
  unint64_t result = qword_26A4B3408;
  if (!qword_26A4B3408)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4B3408);
  }
  return result;
}

uint64_t sub_25ACF08E4(unint64_t *a1, uint64_t *a2, void (*a3)(void))
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

unint64_t sub_25ACF095C()
{
  unint64_t result = qword_26A4B3420;
  if (!qword_26A4B3420)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4B3420);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for ModeSpec.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for ModeSpec.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x25ACF0B0CLL);
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

ValueMetadata *type metadata accessor for ModeSpec.CodingKeys()
{
  return &type metadata for ModeSpec.CodingKeys;
}

unint64_t sub_25ACF0B48()
{
  unint64_t result = qword_26A4B3428;
  if (!qword_26A4B3428)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4B3428);
  }
  return result;
}

unint64_t sub_25ACF0BA0()
{
  unint64_t result = qword_26A4B3430;
  if (!qword_26A4B3430)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4B3430);
  }
  return result;
}

unint64_t sub_25ACF0BF8()
{
  unint64_t result = qword_26A4B3438;
  if (!qword_26A4B3438)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4B3438);
  }
  return result;
}

uint64_t Settings.kpc.getter()
{
  return sub_25ACF4DB8(v0[1], v0[3], v0[4]);
}

uint64_t sub_25ACF0C58(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v7 = a4;
  if (a4)
  {
    uint64_t v8 = a1 - a2;
    if (__OFSUB__(a1, a2))
    {
      __break(1u);
    }
    else
    {
      uint64_t v5 = *(void *)(a5 + 16);
      if (v5 >= v8)
      {
        if ((v8 & 0x8000000000000000) == 0)
        {
          sub_25AD14B00();
          swift_bridgeObjectRetain();
          swift_unknownObjectRetain_n();
          uint64_t v9 = swift_dynamicCastClass();
          if (!v9)
          {
            swift_bridgeObjectRelease();
            uint64_t v9 = MEMORY[0x263F8EE78];
          }
          uint64_t v10 = *(void *)(v9 + 16);
          swift_release();
          if (v10 == v5 - v8)
          {
            if (!swift_dynamicCastClass()) {
              swift_bridgeObjectRelease();
            }
            goto LABEL_11;
          }
LABEL_16:
          swift_bridgeObjectRelease();
          sub_25AD00580(a5, a5 + 32, v8, (2 * v5) | 1);
LABEL_11:
          swift_bridgeObjectRelease();
          uint64_t v7 = v7 & 0xFFFFFFFE;
          goto LABEL_12;
        }
LABEL_15:
        __break(1u);
        goto LABEL_16;
      }
    }
    __break(1u);
    goto LABEL_15;
  }
  swift_bridgeObjectRetain();
LABEL_12:
  swift_bridgeObjectRetain();
  return v7;
}

uint64_t sub_25ACF0D88(uint64_t a1, unint64_t a2, uint64_t a3, char a4)
{
  uint64_t v106 = *MEMORY[0x263EF8340];
  unint64_t v5 = a3 - a2;
  if (__OFSUB__(a3, a2)) {
    goto LABEL_110;
  }
  uint64_t v6 = v4;
  uint64_t v7 = a3;
  uint64_t v9 = sub_25ACFC714(0, a3 - a2);
  long long v104 = (void *)v9;
  uint64_t v10 = *(void *)(a1 + 16);
  if (v10)
  {
    uint64_t v11 = (void *)v9;
    uint64_t v97 = v4;
    uint64_t v98 = v7;
    unint64_t v12 = a2;
    uint64_t v96 = -(uint64_t)a2;
    swift_bridgeObjectRetain();
    unint64_t v13 = 0;
    uint64_t v14 = -1;
    do
    {
      if (v13 >= *(void *)(a1 + 16))
      {
LABEL_103:
        __break(1u);
LABEL_104:
        __break(1u);
LABEL_105:
        __break(1u);
        goto LABEL_106;
      }
      if (a2 - 65 > 0xFFFFFFFFFFFFFF7ELL)
      {
        unint64_t v15 = *(void *)(a1 + 32 + 48 * v13 + 24);
        if ((v12 & 0x8000000000000000) != 0)
        {
          if (v12 > 0xFFFFFFFFFFFFFFC0)
          {
            unint64_t v16 = v15 << v96;
            if (v15 << v96)
            {
LABEL_10:
              swift_bridgeObjectRetain();
              if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
                uint64_t v11 = sub_25AD0BB00(v11);
              }
              uint64_t v17 = v11 + 4;
              unint64_t v18 = v11[2];
              while (1)
              {
                unint64_t v19 = __clz(__rbit64(v16));
                if (v19 >= v18) {
                  break;
                }
                uint64_t v20 = v17[v19];
                BOOL v21 = __OFADD__(v20, 1);
                uint64_t v22 = v20 + 1;
                if (v21) {
                  goto LABEL_98;
                }
                v17[v19] = v22;
                if (v19 >= 0x40) {
                  uint64_t v23 = -1;
                }
                else {
                  uint64_t v23 = (-1 << v19) - 1;
                }
                v16 &= v23;
                if (!v16)
                {
                  swift_bridgeObjectRelease();
                  long long v104 = v11;
                  unint64_t v12 = a2;
                  goto LABEL_4;
                }
              }
              __break(1u);
LABEL_98:
              __break(1u);
LABEL_99:
              uint64_t v67 = MEMORY[0x263F8EE78];
LABEL_100:
              swift_bridgeObjectRelease();
              uint64_t v78 = sub_25ACF1E30(v67);
              swift_release();
              swift_release();
              sub_25ACF5EC4();
              swift_allocError();
              *uint64_t v79 = v96;
              v79[1] = v97;
              v79[2] = (uint64_t)v78;
              swift_willThrow();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              return v14;
            }
          }
        }
        else if (v12 < 0x40)
        {
          unint64_t v16 = v15 >> v12;
          if (v15 >> v12) {
            goto LABEL_10;
          }
        }
      }
LABEL_4:
      ++v13;
    }
    while (v13 != v10);
    swift_bridgeObjectRelease();
    uint64_t v6 = v97;
    uint64_t v7 = v98;
  }
  uint64_t v24 = v6;
  uint64_t v25 = sub_25ACF43A0(a1, a2, (uint64_t)&v104);
  swift_bridgeObjectRelease();
  uint64_t v103 = v25;
  swift_bridgeObjectRetain();
  sub_25ACF296C(&v103, (uint64_t (*)(uint64_t))sub_25ACF4378, sub_25ACF29F0);
  if (v24) {
    goto LABEL_114;
  }
  swift_bridgeObjectRelease();
  uint64_t v26 = v103;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B3540);
  uint64_t v14 = swift_allocObject();
  *(_OWORD *)(v14 + 16) = xmmword_25AD15810;
  memset(v105, 0, 44);
  *(void *)(v14 + 32) = sub_25ACFC800((uint64_t)v105, v5);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B34E0);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_25AD15810;
  uint64_t v28 = 1 << v5;
  if (v5 >= 0x40) {
    uint64_t v28 = 0;
  }
  if (v5 > 0x40) {
    uint64_t v28 = 0;
  }
  BOOL v29 = v28 != 0;
  uint64_t v30 = v28 - 1;
  if (!v29) {
    goto LABEL_111;
  }
  uint64_t v31 = (void *)inited;
  *(void *)(inited + 32) = v30;
  uint64_t v83 = *(void *)(v26 + 16);
  if (!v83) {
    goto LABEL_77;
  }
  unint64_t v32 = 0;
  uint64_t v33 = a2;
  uint64_t v82 = v26 + 32;
  if (v5 + 64 >= 0x80) {
    uint64_t v34 = 0;
  }
  else {
    uint64_t v34 = 1 << v5;
  }
  uint64_t v99 = v34 - 1;
  BOOL v101 = v34 == 0;
  uint64_t v80 = ~a2 + v7;
  uint64_t v81 = v26;
LABEL_36:
  if (v32 >= *(void *)(v26 + 16)) {
    goto LABEL_104;
  }
  uint64_t v35 = v82 + 56 * v32;
  unint64_t v36 = *(void *)(v35 + 32);
  if (a2 - 65 > 0xFFFFFFFFFFFFFF7ELL)
  {
    unint64_t v38 = v36 >> v33;
    if ((unint64_t)v33 >= 0x40) {
      unint64_t v38 = 0;
    }
    uint64_t v39 = v36 << -(char)a2;
    if ((unint64_t)v33 <= 0xFFFFFFFFFFFFFFC0) {
      uint64_t v39 = 0;
    }
    if (v33 < 0) {
      unint64_t v37 = v39;
    }
    else {
      unint64_t v37 = v38;
    }
  }
  else
  {
    unint64_t v37 = 0;
  }
  unint64_t v40 = v31[2];
  if (!v40) {
    goto LABEL_105;
  }
  uint64_t v42 = *(void *)(v35 + 8);
  uint64_t v41 = *(void *)(v35 + 16);
  uint64_t v43 = *(void *)(v35 + 24);
  uint64_t v44 = *(void *)(v35 + 40);
  int v45 = *(_DWORD *)(v35 + 48);
  uint64_t v46 = v31[4];
  unint64_t v47 = v46 & v37;
  uint64_t v96 = v42;
  uint64_t v97 = v41;
  uint64_t v92 = v44;
  unint64_t v94 = v36;
  int v90 = v45;
  uint64_t v88 = v43;
  if ((a4 & 1) == 0)
  {
    if (v47)
    {
LABEL_68:
      unint64_t v56 = __clz(__rbit64(v47));
      swift_bridgeObjectRetain();
      unint64_t v48 = 0;
      goto LABEL_69;
    }
    if (!*(void *)(v14 + 16)) {
      goto LABEL_112;
    }
    uint64_t v62 = *(void *)(v14 + 32);
    unint64_t v63 = *(void *)(v62 + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (!v63) {
      goto LABEL_99;
    }
    unint64_t v64 = 0;
    uint64_t v65 = v62 + 72;
    unint64_t v66 = v63 - 1;
    uint64_t v67 = MEMORY[0x263F8EE78];
    do
    {
      if (v64 <= v63) {
        unint64_t v68 = v63;
      }
      else {
        unint64_t v68 = v64;
      }
      uint64_t v69 = (_DWORD *)(v65 + 48 * v64);
      unint64_t v70 = v64;
      while (1)
      {
        if (v68 == v70) {
          goto LABEL_109;
        }
        if (v70 <= 0x3F && ((v37 >> v70) & 1) != 0) {
          break;
        }
        ++v70;
        v69 += 12;
        if (v63 == v70) {
          goto LABEL_100;
        }
      }
      unint64_t v100 = v66;
      uint64_t v102 = v65;
      uint64_t v71 = *((void *)v69 - 5);
      uint64_t v91 = *((void *)v69 - 2);
      uint64_t v93 = *((void *)v69 - 3);
      uint64_t v89 = *((void *)v69 - 1);
      int v87 = *v69;
      uint64_t v95 = *((void *)v69 - 4);
      swift_bridgeObjectRetain();
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v103 = v67;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        sub_25AD0FB20(0, *(void *)(v67 + 16) + 1, 1);
        uint64_t v67 = v103;
      }
      unint64_t v66 = v100;
      uint64_t v65 = v102;
      unint64_t v74 = *(void *)(v67 + 16);
      unint64_t v73 = *(void *)(v67 + 24);
      unint64_t v75 = v74 + 1;
      if (v74 >= v73 >> 1)
      {
        unint64_t v84 = *(void *)(v67 + 16);
        unint64_t v77 = v74 + 1;
        sub_25AD0FB20(v73 > 1, v74 + 1, 1);
        unint64_t v75 = v77;
        unint64_t v74 = v84;
        unint64_t v66 = v100;
        uint64_t v65 = v102;
        uint64_t v67 = v103;
      }
      unint64_t v64 = v70 + 1;
      *(void *)(v67 + 16) = v75;
      uint64_t v76 = v67 + 56 * v74;
      *(void *)(v76 + 32) = v70;
      *(void *)(v76 + 40) = v71;
      *(void *)(v76 + 48) = v95;
      *(void *)(v76 + 56) = v93;
      *(void *)(v76 + 64) = v91;
      *(void *)(v76 + 72) = v89;
      *(_DWORD *)(v76 + 80) = v87;
    }
    while (v66 != v70);
    goto LABEL_100;
  }
  if (v47) {
    goto LABEL_68;
  }
  swift_bridgeObjectRetain();
  unint64_t v48 = 0;
  while (1)
  {
    if (++v48 < *(void *)(v14 + 16)) {
      goto LABEL_64;
    }
    if ((v5 & 0x8000000000000000) != 0) {
      break;
    }
    if (v5)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B3548);
      uint64_t v49 = sub_25AD146C0();
      *(void *)(v49 + 16) = v5;
      sub_25ACF60B8((uint64_t)v105, v49 + 32);
      if (v5 != 1)
      {
        uint64_t v50 = v49 + 80;
        uint64_t v51 = v80;
        do
        {
          sub_25ACF60B8((uint64_t)v105, v50);
          v50 += 48;
          --v51;
        }
        while (v51);
      }
    }
    else
    {
      uint64_t v49 = MEMORY[0x263F8EE78];
    }
    unint64_t v53 = *(void *)(v14 + 16);
    unint64_t v52 = *(void *)(v14 + 24);
    if (v53 >= v52 >> 1) {
      uint64_t v14 = (uint64_t)sub_25ACFF954((void *)(v52 > 1), v53 + 1, 1, (void *)v14);
    }
    *(void *)(v14 + 16) = v53 + 1;
    *(void *)(v14 + 8 * v53 + 32) = v49;
    if (v101) {
      goto LABEL_102;
    }
    unint64_t v55 = v31[2];
    unint64_t v54 = v31[3];
    unint64_t v40 = v55 + 1;
    if (v55 >= v54 >> 1) {
      uint64_t v31 = sub_25ACFF5E4((void *)(v54 > 1), v55 + 1, 1, v31);
    }
    v31[2] = v40;
    v31[v55 + 4] = v99;
LABEL_64:
    if (v48 >= v40)
    {
      __break(1u);
LABEL_102:
      __break(1u);
      goto LABEL_103;
    }
    uint64_t v46 = v31[v48 + 4];
    if ((v46 & v37) != 0)
    {
      unint64_t v56 = __clz(__rbit64(v46 & v37));
      if (v48 >= v40)
      {
LABEL_106:
        __break(1u);
LABEL_107:
        __break(1u);
        goto LABEL_108;
      }
LABEL_69:
      v31[v48 + 4] = v46 & ((-1 << v56) - 1);
      unint64_t v57 = *(void *)(v14 + 16);
      swift_bridgeObjectRetain();
      if (v48 >= v57) {
        goto LABEL_107;
      }
      unint64_t v58 = *(void **)(v14 + 32 + 8 * v48);
      char v59 = swift_isUniquelyReferenced_nonNull_native();
      *(void *)(v14 + 32 + 8 * v48) = v58;
      if ((v59 & 1) == 0)
      {
        unint64_t v58 = sub_25AD0BB14(v58);
        *(void *)(v14 + 32 + 8 * v48) = v58;
      }
      uint64_t v26 = v81;
      if (v56 < v58[2])
      {
        ++v32;
        uint64_t v60 = &v58[6 * v56];
        swift_bridgeObjectRelease();
        v60[4] = v96;
        v60[5] = v97;
        v60[6] = v88;
        v60[7] = v94;
        v60[8] = v92;
        *((_DWORD *)v60 + 18) = v90;
        swift_bridgeObjectRelease();
        uint64_t v33 = a2;
        if (v32 == v83)
        {
LABEL_77:
          swift_release();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          return v14;
        }
        goto LABEL_36;
      }
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
    }
  }
  sub_25AD14920();
  __break(1u);
LABEL_114:
  uint64_t result = swift_release();
  __break(1u);
  return result;
}

uint64_t sub_25ACF1604(void *a1, int64_t a2, uint64_t a3, int a4)
{
  v101[6] = *MEMORY[0x263EF8340];
  unint64_t v5 = a3 - a2;
  if (__OFSUB__(a3, a2)) {
    goto LABEL_107;
  }
  uint64_t v6 = v4;
  uint64_t v96 = a3;
  int64_t v92 = a2;
  uint64_t v9 = sub_25ACFC714(0, a3 - a2);
  v101[0] = v9;
  uint64_t v10 = a1[2];
  unint64_t v99 = v5;
  if (v10)
  {
    uint64_t v11 = (void *)v9;
    int v12 = a4;
    uint64_t v97 = v4;
    *(void *)&long long v98 = a1 + 4;
    unint64_t v13 = v92;
    unint64_t v14 = v92 - 65;
    uint64_t v95 = -v92;
    swift_bridgeObjectRetain();
    for (unint64_t i = 0; i != v10; ++i)
    {
      if (i >= a1[2])
      {
LABEL_100:
        __break(1u);
LABEL_101:
        __break(1u);
LABEL_102:
        __break(1u);
        goto LABEL_103;
      }
      if (v14 > 0xFFFFFFFFFFFFFF7ELL)
      {
        unint64_t v16 = *(void *)(v98 + 32 * i + 24);
        if ((v13 & 0x8000000000000000) != 0)
        {
          if (v13 > 0xFFFFFFFFFFFFFFC0)
          {
            unint64_t v17 = v16 << v95;
            if (v16 << v95)
            {
LABEL_10:
              swift_bridgeObjectRetain();
              if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
                uint64_t v11 = sub_25AD0BB00(v11);
              }
              unint64_t v18 = v11 + 4;
              unint64_t v19 = v11[2];
              while (1)
              {
                unint64_t v20 = __clz(__rbit64(v17));
                if (v20 >= v19) {
                  break;
                }
                uint64_t v21 = v18[v20];
                BOOL v22 = __OFADD__(v21, 1);
                uint64_t v23 = v21 + 1;
                if (v22) {
                  goto LABEL_95;
                }
                v18[v20] = v23;
                if (v20 >= 0x40) {
                  uint64_t v24 = -1;
                }
                else {
                  uint64_t v24 = (-1 << v20) - 1;
                }
                v17 &= v24;
                if (!v17)
                {
                  swift_bridgeObjectRelease();
                  v101[0] = v11;
                  unint64_t v13 = v92;
                  goto LABEL_4;
                }
              }
              __break(1u);
LABEL_95:
              __break(1u);
LABEL_96:
              uint64_t v67 = MEMORY[0x263F8EE78];
LABEL_97:
              swift_bridgeObjectRelease();
              uint64_t v78 = sub_25ACF1F4C(v67);
              swift_release();
              swift_release();
              sub_25ACF5EC4();
              swift_allocError();
              uint64_t v79 = v96;
              *uint64_t v80 = v95;
              v80[1] = v79;
              v80[2] = (uint64_t)v78;
              swift_willThrow();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              return (uint64_t)a1;
            }
          }
        }
        else if (v13 < 0x40)
        {
          unint64_t v17 = v16 >> v13;
          if (v16 >> v13) {
            goto LABEL_10;
          }
        }
      }
LABEL_4:
      ;
    }
    swift_bridgeObjectRelease();
    a4 = v12;
    unint64_t v5 = v99;
    uint64_t v6 = v97;
  }
  uint64_t v25 = sub_25ACF46EC((uint64_t)a1, v92, (uint64_t)v101);
  swift_bridgeObjectRelease();
  uint64_t v100 = v25;
  swift_bridgeObjectRetain();
  sub_25ACF296C(&v100, (uint64_t (*)(uint64_t))sub_25ACF438C, sub_25ACF3178);
  if (v6) {
    goto LABEL_111;
  }
  swift_bridgeObjectRelease();
  uint64_t v26 = v100;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B34D8);
  a1 = (void *)swift_allocObject();
  long long v98 = xmmword_25AD15810;
  *((_OWORD *)a1 + 1) = xmmword_25AD15810;
  a1[4] = sub_25ACFC92C(0, 0, 0, 0, v5);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B34E0);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = v98;
  uint64_t v28 = 1 << v5;
  if (v5 >= 0x40) {
    uint64_t v28 = 0;
  }
  if (v5 > 0x40) {
    uint64_t v28 = 0;
  }
  BOOL v29 = v28 != 0;
  uint64_t v30 = v28 - 1;
  if (!v29) {
    goto LABEL_108;
  }
  uint64_t v31 = (void *)inited;
  *(void *)(inited + 32) = v30;
  uint64_t v91 = *(void *)(v26 + 16);
  if (!v91) {
    goto LABEL_75;
  }
  uint64_t v84 = 0;
  unint64_t v32 = 0;
  uint64_t v33 = v92;
  unint64_t v89 = v92 - 65;
  uint64_t v90 = v26 + 32;
  uint64_t v86 = -v92;
  if (v5 + 64 >= 0x80) {
    uint64_t v34 = 0;
  }
  else {
    uint64_t v34 = 1 << v5;
  }
  uint64_t v97 = (char *)(v34 - 1);
  LODWORD(v98) = v34 == 0;
  size_t v87 = 32 * (~v92 + v96);
  uint64_t v88 = v26;
  int v85 = a4;
LABEL_36:
  if (v32 >= *(void *)(v26 + 16)) {
    goto LABEL_101;
  }
  uint64_t v35 = (void *)(v90 + 40 * v32);
  unint64_t v36 = v35[4];
  if (v89 > 0xFFFFFFFFFFFFFF7ELL)
  {
    unint64_t v38 = v36 >> v33;
    if ((unint64_t)v33 >= 0x40) {
      unint64_t v38 = 0;
    }
    uint64_t v39 = v36 << v86;
    if ((unint64_t)v33 <= 0xFFFFFFFFFFFFFFC0) {
      uint64_t v39 = 0;
    }
    if (v33 < 0) {
      unint64_t v37 = v39;
    }
    else {
      unint64_t v37 = v38;
    }
  }
  else
  {
    unint64_t v37 = 0;
  }
  unint64_t v40 = v31[2];
  if (!v40) {
    goto LABEL_102;
  }
  uint64_t v42 = v35[1];
  uint64_t v41 = v35[2];
  uint64_t v43 = v35[3];
  uint64_t v44 = v31[4];
  unint64_t v45 = v44 & v37;
  uint64_t v95 = v42;
  uint64_t v96 = v41;
  uint64_t v93 = v43;
  unint64_t v94 = v36;
  if ((a4 & 1) == 0)
  {
    if (v45)
    {
LABEL_66:
      unint64_t v53 = __clz(__rbit64(v45));
      swift_bridgeObjectRetain();
      unint64_t v46 = 0;
      goto LABEL_67;
    }
    if (!a1[2]) {
      goto LABEL_109;
    }
    uint64_t v61 = &v81;
    uint64_t v62 = a1[4];
    unint64_t v63 = *(void *)(v62 + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (!v63) {
      goto LABEL_96;
    }
    unint64_t v64 = 0;
    unint64_t v65 = v63 - 1;
    uint64_t v66 = v62 + 56;
    uint64_t v67 = MEMORY[0x263F8EE78];
    do
    {
      if (v64 <= v63) {
        unint64_t v68 = v63;
      }
      else {
        unint64_t v68 = v64;
      }
      uint64_t v69 = (uint64_t *)(v66 + 32 * v64);
      unint64_t v70 = v64;
      while (1)
      {
        if (v68 == v70) {
          goto LABEL_106;
        }
        if (v70 <= 0x3F && ((v37 >> v70) & 1) != 0) {
          break;
        }
        ++v70;
        v69 += 4;
        if (v63 == v70) {
          goto LABEL_97;
        }
      }
      *(void *)&long long v98 = v66;
      unint64_t v99 = v65;
      unint64_t v71 = *(v69 - 3);
      uint64_t v93 = *(v69 - 2);
      unint64_t v94 = v71;
      int64_t v72 = *(v69 - 1);
      uint64_t v91 = *v69;
      int64_t v92 = v72;
      swift_bridgeObjectRetain();
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v100 = v67;
      uint64_t v97 = v61;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        sub_25AD0FC50(0, *(void *)(v67 + 16) + 1, 1);
        uint64_t v67 = v100;
      }
      unint64_t v65 = v99;
      unint64_t v75 = *(void *)(v67 + 16);
      unint64_t v74 = *(void *)(v67 + 24);
      uint64_t v66 = v98;
      if (v75 >= v74 >> 1)
      {
        sub_25AD0FC50(v74 > 1, v75 + 1, 1);
        uint64_t v66 = v98;
        unint64_t v65 = v99;
        uint64_t v67 = v100;
      }
      unint64_t v64 = v70 + 1;
      *(void *)(v67 + 16) = v75 + 1;
      uint64_t v76 = (void *)(v67 + 40 * v75);
      unint64_t v77 = v94;
      v76[4] = v70;
      v76[5] = v77;
      v76[6] = v93;
      v76[7] = v92;
      v76[8] = v91;
      uint64_t v61 = v97;
    }
    while (v65 != v70);
    goto LABEL_97;
  }
  if (v45) {
    goto LABEL_66;
  }
  swift_bridgeObjectRetain();
  unint64_t v46 = 0;
  while (1)
  {
    if (v46 + 1 < a1[2]) {
      goto LABEL_62;
    }
    if ((v5 & 0x8000000000000000) != 0) {
      break;
    }
    if (v5)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B34F0);
      uint64_t v47 = sub_25AD146C0();
      uint64_t v48 = v47;
      *(void *)(v47 + 16) = v5;
      *(_OWORD *)(v47 + 32) = 0u;
      *(_OWORD *)(v47 + 48) = 0u;
      if (v5 != 1) {
        bzero((void *)(v47 + 64), v87);
      }
    }
    else
    {
      uint64_t v48 = MEMORY[0x263F8EE78];
    }
    unint64_t v50 = a1[2];
    unint64_t v49 = a1[3];
    if (v50 >= v49 >> 1) {
      a1 = sub_25ACFFCD0((void *)(v49 > 1), v50 + 1, 1, a1);
    }
    a1[2] = v50 + 1;
    a1[v50 + 4] = v48;
    if (v98) {
      goto LABEL_99;
    }
    unint64_t v52 = v31[2];
    unint64_t v51 = v31[3];
    unint64_t v40 = v52 + 1;
    if (v52 >= v51 >> 1) {
      uint64_t v31 = sub_25ACFF5E4((void *)(v51 > 1), v52 + 1, 1, v31);
    }
    unint64_t v5 = v99;
    v31[2] = v40;
    v31[v52 + 4] = v97;
LABEL_62:
    if (v46 + 1 >= v40)
    {
      __break(1u);
LABEL_99:
      __break(1u);
      goto LABEL_100;
    }
    uint64_t v44 = v31[v46++ + 5];
    if ((v44 & v37) != 0)
    {
      unint64_t v53 = __clz(__rbit64(v44 & v37));
      LOBYTE(a4) = v85;
      if (v46 >= v40)
      {
LABEL_103:
        __break(1u);
LABEL_104:
        __break(1u);
        goto LABEL_105;
      }
LABEL_67:
      v31[v46 + 4] = v44 & ((-1 << v53) - 1);
      unint64_t v54 = a1[2];
      swift_bridgeObjectRetain();
      if (v46 >= v54) {
        goto LABEL_104;
      }
      unint64_t v55 = (void *)a1[v46 + 4];
      char v56 = swift_isUniquelyReferenced_nonNull_native();
      a1[v46 + 4] = v55;
      if ((v56 & 1) == 0)
      {
        unint64_t v55 = sub_25AD0BB3C(v55);
        a1[v46 + 4] = v55;
      }
      unint64_t v5 = v99;
      uint64_t v26 = v88;
      if (v53 < v55[2])
      {
        ++v32;
        unint64_t v57 = &v55[4 * v53];
        swift_bridgeObjectRelease();
        uint64_t v58 = v96;
        v57[4] = v95;
        v57[5] = v58;
        unint64_t v59 = v94;
        v57[6] = v93;
        void v57[7] = v59;
        swift_bridgeObjectRelease();
        uint64_t v33 = v92;
        if (v32 == v91)
        {
LABEL_75:
          swift_release();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          return (uint64_t)a1;
        }
        goto LABEL_36;
      }
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
    }
  }
  int v83 = 0;
  uint64_t v82 = 936;
  char v81 = 2;
  sub_25AD14920();
  __break(1u);
LABEL_111:
  uint64_t result = swift_release();
  __break(1u);
  return result;
}

void *sub_25ACF1E30(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return (void *)MEMORY[0x263F8EE78];
  }
  int v2 = (void *)(swift_bridgeObjectRetain() + 48);
  int v3 = (void *)MEMORY[0x263F8EE78];
  do
  {
    uint64_t v5 = *v2;
    if (*v2)
    {
      long long v9 = *((_OWORD *)v2 - 1);
      swift_bridgeObjectRetain();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        int v3 = sub_25ACFF708(0, v3[2] + 1, 1, v3);
      }
      unint64_t v7 = v3[2];
      unint64_t v6 = v3[3];
      if (v7 >= v6 >> 1) {
        int v3 = sub_25ACFF708((void *)(v6 > 1), v7 + 1, 1, v3);
      }
      v3[2] = v7 + 1;
      uint64_t v4 = &v3[3 * v7];
      *((_OWORD *)v4 + 2) = v9;
      v4[6] = v5;
    }
    v2 += 7;
    --v1;
  }
  while (v1);
  swift_bridgeObjectRelease();
  return v3;
}

void *sub_25ACF1F4C(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return (void *)MEMORY[0x263F8EE78];
  }
  int v2 = (void *)(swift_bridgeObjectRetain() + 48);
  int v3 = (void *)MEMORY[0x263F8EE78];
  do
  {
    uint64_t v5 = *v2;
    if (*v2)
    {
      long long v9 = *((_OWORD *)v2 - 1);
      swift_bridgeObjectRetain();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        int v3 = sub_25ACFF708(0, v3[2] + 1, 1, v3);
      }
      unint64_t v7 = v3[2];
      unint64_t v6 = v3[3];
      if (v7 >= v6 >> 1) {
        int v3 = sub_25ACFF708((void *)(v6 > 1), v7 + 1, 1, v3);
      }
      v3[2] = v7 + 1;
      uint64_t v4 = &v3[3 * v7];
      *((_OWORD *)v4 + 2) = v9;
      v4[6] = v5;
    }
    v2 += 5;
    --v1;
  }
  while (v1);
  swift_bridgeObjectRelease();
  return v3;
}

uint64_t sub_25ACF2068(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v12[0] = a5;
  v12[1] = a4;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B34B8);
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)v12 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25ACF5E70();
  sub_25AD14BB0();
  char v15 = 0;
  sub_25AD14A60();
  if (!v5)
  {
    char v14 = 1;
    sub_25AD14A90();
    char v13 = 2;
    sub_25AD14AC0();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

uint64_t sub_25ACF220C()
{
  uint64_t v1 = 0x7265746E756F63;
  if (*v0 != 1) {
    uint64_t v1 = 0x726F7463656C6573;
  }
  if (*v0) {
    return v1;
  }
  else {
    return 1701667182;
  }
}

uint64_t sub_25ACF2260@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_25ACF509C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_25ACF2288(uint64_t a1)
{
  unint64_t v2 = sub_25ACF5E70();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25ACF22C4(uint64_t a1)
{
  unint64_t v2 = sub_25ACF5E70();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_25ACF2300@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = sub_25ACF51E4(a1);
  if (!v2)
  {
    *a2 = result;
    a2[1] = v5;
    a2[2] = v6;
    a2[3] = v7;
  }
  return result;
}

uint64_t sub_25ACF2330(void *a1)
{
  return sub_25ACF2068(a1, *v1, v1[1], v1[2], v1[3]);
}

uint64_t KPCSettings.config.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t KPCSettings.periods.getter()
{
  return swift_bridgeObjectRetain();
}

unint64_t sub_25ACF2364()
{
  return 0xD00000000000001ALL;
}

unint64_t sub_25ACF2408()
{
  return sub_25ACF2364();
}

uint64_t sub_25ACF2410(void *a1, void *a2)
{
  if (*a1 == *a2 && a1[1] == a2[1]) {
    return 1;
  }
  else {
    return sub_25AD14AF0();
  }
}

uint64_t sub_25ACF2440(uint64_t a1)
{
  uint64_t v14 = MEMORY[0x263F8EE78];
  sub_25AD0FC30(0, 0, 0);
  uint64_t v2 = *(void *)(a1 + 16);
  swift_bridgeObjectRetain();
  uint64_t v13 = v2;
  if (v2)
  {
    uint64_t v3 = 0;
    uint64_t v4 = (uint64_t *)(a1 + 48);
    do
    {
      uint64_t v5 = *(v4 - 1);
      if (v5) {
        uint64_t v6 = *(v4 - 2);
      }
      else {
        uint64_t v6 = 0;
      }
      if (v5) {
        uint64_t v7 = v3;
      }
      else {
        uint64_t v7 = 0;
      }
      if (v5) {
        uint64_t v8 = *v4;
      }
      else {
        uint64_t v8 = 0;
      }
      unint64_t v10 = *(void *)(v14 + 16);
      unint64_t v9 = *(void *)(v14 + 24);
      swift_bridgeObjectRetain();
      if (v10 >= v9 >> 1) {
        sub_25AD0FC30(v9 > 1, v10 + 1, 1);
      }
      ++v3;
      v4 += 4;
      *(void *)(v14 + 16) = v10 + 1;
      uint64_t v11 = (void *)(v14 + 32 * v10);
      v11[4] = v6;
      _OWORD v11[5] = v5;
      v11[6] = v7;
      v11[7] = v8;
    }
    while (v13 != v3);
  }
  swift_bridgeObjectRelease();
  return v14;
}

uint64_t sub_25ACF255C()
{
  uint64_t v1 = 0x6F666E49756D70;
  if (*v0 != 1) {
    uint64_t v1 = 0x746553746E657665;
  }
  if (*v0) {
    return v1;
  }
  else {
    return 0x436F5473656D616ELL;
  }
}

uint64_t sub_25ACF25D0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_25ACF5400(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_25ACF25F8(uint64_t a1)
{
  unint64_t v2 = sub_25ACF4EF8();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25ACF2634(uint64_t a1)
{
  unint64_t v2 = sub_25ACF4EF8();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t Settings.encode(to:)(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B3440);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25ACF4EF8();
  sub_25AD14BB0();
  *(void *)&long long v10 = *(void *)v3;
  char v12 = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B3450);
  sub_25ACF5F6C(&qword_26A4B3458);
  sub_25AD14AA0();
  if (!v2)
  {
    long long v10 = *(_OWORD *)(v3 + 8);
    uint64_t v11 = *(void *)(v3 + 24);
    char v12 = 1;
    sub_25ACF4F4C();
    sub_25AD14AA0();
    *(void *)&long long v10 = *(void *)(v3 + 32);
    char v12 = 2;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B3468);
    sub_25ACF4FDC(&qword_26A4B3470, &qword_26A4B3468, (void (*)(void))sub_25ACF4FA0);
    sub_25AD14AA0();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

double Settings.init(from:)@<D0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  sub_25ACF55A0(a1, v6);
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

double sub_25ACF290C@<D0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  sub_25ACF55A0(a1, v6);
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

uint64_t sub_25ACF2954(void *a1)
{
  return Settings.encode(to:)(a1);
}

uint64_t sub_25ACF296C(uint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t (*a3)(void *))
{
  uint64_t v6 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v6 = a2(v6);
  }
  uint64_t v7 = *(void *)(v6 + 16);
  v9[0] = v6 + 32;
  v9[1] = v7;
  uint64_t result = a3(v9);
  *a1 = v6;
  return result;
}

uint64_t sub_25ACF29F0(uint64_t *a1)
{
  uint64_t v3 = a1[1];
  uint64_t result = sub_25AD14AD0();
  if (result >= v3)
  {
    if (v3 < 0) {
      goto LABEL_136;
    }
    if (v3) {
      return sub_25ACF38DC(0, v3, 1, a1);
    }
    return result;
  }
  if (v3 >= 0) {
    uint64_t v5 = v3;
  }
  else {
    uint64_t v5 = v3 + 1;
  }
  if (v3 < -1) {
    goto LABEL_144;
  }
  uint64_t v6 = result;
  uint64_t v130 = v1;
  uint64_t v123 = a1;
  if (v3 < 2)
  {
    uint64_t v9 = MEMORY[0x263F8EE78];
    __dst = (int8x8_t *)(MEMORY[0x263F8EE78] + 32);
    if (v3 != 1)
    {
      unint64_t v13 = *(void *)(MEMORY[0x263F8EE78] + 16);
      char v12 = (char *)MEMORY[0x263F8EE78];
LABEL_102:
      uint64_t v114 = v12;
      uint64_t v125 = v9;
      if (v13 >= 2)
      {
        uint64_t v115 = *v123;
        do
        {
          unint64_t v116 = v13 - 2;
          if (v13 < 2) {
            goto LABEL_131;
          }
          if (!v115) {
            goto LABEL_143;
          }
          uint64_t v117 = v114;
          uint64_t v118 = *(void *)&v114[16 * v116 + 32];
          uint64_t v119 = *(void *)&v114[16 * v13 + 24];
          sub_25ACF3A80((int8x8_t *)(v115 + 56 * v118), (int8x8_t *)(v115 + 56 * *(void *)&v114[16 * v13 + 16]), v115 + 56 * v119, __dst);
          if (v130) {
            break;
          }
          if (v119 < v118) {
            goto LABEL_132;
          }
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            uint64_t v117 = sub_25ACF4364((uint64_t)v117);
          }
          if (v116 >= *((void *)v117 + 2)) {
            goto LABEL_133;
          }
          int v120 = &v117[16 * v116 + 32];
          *(void *)int v120 = v118;
          *((void *)v120 + 1) = v119;
          unint64_t v121 = *((void *)v117 + 2);
          if (v13 > v121) {
            goto LABEL_134;
          }
          memmove(&v117[16 * v13 + 16], &v117[16 * v13 + 32], 16 * (v121 - v13));
          uint64_t v114 = v117;
          *((void *)v117 + 2) = v121 - 1;
          unint64_t v13 = v121 - 1;
        }
        while (v121 > 2);
      }
LABEL_99:
      swift_bridgeObjectRelease();
      *(void *)(v125 + 16) = 0;
      return swift_bridgeObjectRelease();
    }
    uint64_t v125 = MEMORY[0x263F8EE78];
  }
  else
  {
    uint64_t v7 = v5 >> 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B3550);
    uint64_t v8 = sub_25AD146C0();
    *(void *)(v8 + 16) = v7;
    uint64_t v125 = v8;
    __dst = (int8x8_t *)(v8 + 32);
  }
  uint64_t v10 = 0;
  uint64_t v11 = *a1;
  uint64_t v124 = *a1 + 88;
  uint64_t v122 = *a1 - 56;
  char v12 = (char *)MEMORY[0x263F8EE78];
  uint64_t v126 = v6;
  uint64_t v127 = v3;
  uint64_t v128 = v11;
  while (1)
  {
    uint64_t v14 = v10++;
    if (v10 < v3)
    {
      char v15 = (int8x8_t *)(v11 + 56 * v10);
      int8x8_t v16 = *v15;
      unint64_t v17 = (int8x8_t *)(v11 + 56 * v14);
      uint8x8_t v18 = (uint8x8_t)vcnt_s8(v15[4]);
      v18.i16[0] = vaddlv_u8(v18);
      unint64_t v19 = v18.u32[0];
      uint8x8_t v20 = (uint8x8_t)vcnt_s8(v17[4]);
      v20.i16[0] = vaddlv_u8(v20);
      BOOL v21 = *(void *)&v16 < *(uint64_t *)v17;
      BOOL v22 = v19 == v20.u32[0];
      int v23 = v19 < v20.u32[0];
      if (v22) {
        int v23 = v21;
      }
      uint64_t v10 = v14 + 2;
      if (v14 + 2 < v3)
      {
        uint64_t v24 = (int8x8_t *)(v124 + 56 * v14);
        uint64_t v25 = v24;
        while (1)
        {
          int8x8_t v26 = v25[7];
          v25 += 7;
          uint8x8_t v27 = (uint8x8_t)vcnt_s8(v26);
          v27.i16[0] = vaddlv_u8(v27);
          unint64_t v28 = v27.u32[0];
          uint8x8_t v29 = (uint8x8_t)vcnt_s8(*v24);
          v29.i16[0] = vaddlv_u8(v29);
          BOOL v30 = *(void *)&v24[3] < *(void *)&v24[-4];
          int v31 = v28 < v29.u32[0];
          if (v28 == v29.u32[0]) {
            int v31 = v30;
          }
          if (v23 != v31) {
            break;
          }
          ++v10;
          uint64_t v24 = v25;
          if (v3 == v10)
          {
            uint64_t v10 = v3;
            break;
          }
        }
      }
      if (v23)
      {
        if (v10 < v14) {
          goto LABEL_137;
        }
        if (v14 < v10)
        {
          uint64_t v32 = 56 * v10;
          uint64_t v33 = v10;
          uint64_t v34 = v14;
          uint64_t v35 = 56 * v14;
          do
          {
            if (v34 != --v33)
            {
              if (!v11) {
                goto LABEL_142;
              }
              uint64_t v36 = v11 + v35;
              uint64_t v37 = *(void *)(v11 + v35 + 16);
              uint64_t v38 = v11 + v32;
              uint64_t v39 = *(void *)(v11 + v35 + 40);
              int v40 = *(_DWORD *)(v11 + v35 + 48);
              long long v41 = *(_OWORD *)(v11 + v35);
              long long v42 = *(_OWORD *)(v11 + v35 + 24);
              long long v43 = *(_OWORD *)(v11 + v32 - 40);
              long long v44 = *(_OWORD *)(v11 + v32 - 24);
              long long v45 = *(_OWORD *)(v11 + v32 - 56);
              *(void *)(v36 + 48) = *(void *)(v11 + v32 - 8);
              *(_OWORD *)(v36 + 16) = v43;
              *(_OWORD *)(v36 + 32) = v44;
              *(_OWORD *)uint64_t v36 = v45;
              *(_OWORD *)(v38 - 56) = v41;
              *(void *)(v38 - 40) = v37;
              *(_OWORD *)(v38 - 32) = v42;
              *(void *)(v38 - 16) = v39;
              *(_DWORD *)(v38 - 8) = v40;
            }
            ++v34;
            v32 -= 56;
            v35 += 56;
          }
          while (v34 < v33);
        }
      }
    }
    if (v10 >= v3) {
      goto LABEL_52;
    }
    if (__OFSUB__(v10, v14)) {
      goto LABEL_135;
    }
    if (v10 - v14 >= v6) {
      goto LABEL_52;
    }
    uint64_t v46 = v14 + v6;
    if (__OFADD__(v14, v6)) {
      goto LABEL_138;
    }
    if (v46 >= v3) {
      uint64_t v46 = v3;
    }
    if (v46 < v14) {
      break;
    }
    if (v10 != v46)
    {
      uint64_t v47 = v122 + 56 * v10;
      do
      {
        uint64_t v48 = v14;
        uint64_t v49 = v47;
        do
        {
          uint64_t v50 = v49 + 56;
          uint64_t v51 = *(void *)(v49 + 56);
          int8x8_t v52 = *(int8x8_t *)(v49 + 88);
          uint8x8_t v53 = (uint8x8_t)vcnt_s8(v52);
          v53.i16[0] = vaddlv_u8(v53);
          unint64_t v54 = v53.u32[0];
          uint8x8_t v55 = (uint8x8_t)vcnt_s8(*(int8x8_t *)(v49 + 32));
          v55.i16[0] = vaddlv_u8(v55);
          BOOL v56 = v51 < *(void *)v49;
          BOOL v22 = v54 == v55.u32[0];
          BOOL v57 = v54 < v55.u32[0];
          if (!v22) {
            BOOL v56 = v57;
          }
          if (!v56) {
            break;
          }
          if (!v11) {
            goto LABEL_140;
          }
          long long v58 = *(_OWORD *)(v49 + 64);
          uint64_t v59 = *(void *)(v49 + 80);
          uint64_t v60 = *(void *)(v49 + 96);
          int v61 = *(_DWORD *)(v49 + 104);
          long long v62 = *(_OWORD *)(v49 + 16);
          *(_OWORD *)uint64_t v50 = *(_OWORD *)v49;
          *(_OWORD *)(v49 + 72) = v62;
          *(_OWORD *)(v49 + 88) = *(_OWORD *)(v49 + 32);
          uint64_t v63 = *(void *)(v49 + 48);
          *(void *)uint64_t v49 = v51;
          *(_OWORD *)(v49 + 8) = v58;
          *(void *)(v49 + 24) = v59;
          *(int8x8_t *)(v49 + 32) = v52;
          *(void *)(v49 + 40) = v60;
          *(_DWORD *)(v49 + 48) = v61;
          v49 -= 56;
          ++v48;
          *(void *)(v50 + 48) = v63;
        }
        while (v10 != v48);
        ++v10;
        v47 += 56;
      }
      while (v10 != v46);
      uint64_t v10 = v46;
    }
LABEL_52:
    if (v10 < v14) {
      goto LABEL_130;
    }
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      char v12 = sub_25ACF40CC(0, *((void *)v12 + 2) + 1, 1, v12);
    }
    unint64_t v65 = *((void *)v12 + 2);
    unint64_t v64 = *((void *)v12 + 3);
    unint64_t v13 = v65 + 1;
    uint64_t v11 = v128;
    if (v65 >= v64 >> 1)
    {
      uint64_t v113 = sub_25ACF40CC((char *)(v64 > 1), v65 + 1, 1, v12);
      uint64_t v11 = v128;
      char v12 = v113;
    }
    *((void *)v12 + 2) = v13;
    uint64_t v66 = v12 + 32;
    uint64_t v67 = &v12[16 * v65 + 32];
    *(void *)uint64_t v67 = v14;
    *((void *)v67 + 1) = v10;
    if (v65)
    {
      while (1)
      {
        unint64_t v68 = v13 - 1;
        if (v13 >= 4)
        {
          unint64_t v73 = &v66[16 * v13];
          uint64_t v74 = *((void *)v73 - 8);
          uint64_t v75 = *((void *)v73 - 7);
          BOOL v79 = __OFSUB__(v75, v74);
          uint64_t v76 = v75 - v74;
          if (v79) {
            goto LABEL_119;
          }
          uint64_t v78 = *((void *)v73 - 6);
          uint64_t v77 = *((void *)v73 - 5);
          BOOL v79 = __OFSUB__(v77, v78);
          uint64_t v71 = v77 - v78;
          char v72 = v79;
          if (v79) {
            goto LABEL_120;
          }
          unint64_t v80 = v13 - 2;
          char v81 = &v66[16 * v13 - 32];
          uint64_t v83 = *(void *)v81;
          uint64_t v82 = *((void *)v81 + 1);
          BOOL v79 = __OFSUB__(v82, v83);
          uint64_t v84 = v82 - v83;
          if (v79) {
            goto LABEL_122;
          }
          BOOL v79 = __OFADD__(v71, v84);
          uint64_t v85 = v71 + v84;
          if (v79) {
            goto LABEL_125;
          }
          if (v85 >= v76)
          {
            uint64_t v103 = &v66[16 * v68];
            uint64_t v105 = *(void *)v103;
            uint64_t v104 = *((void *)v103 + 1);
            BOOL v79 = __OFSUB__(v104, v105);
            uint64_t v106 = v104 - v105;
            if (v79) {
              goto LABEL_129;
            }
            BOOL v96 = v71 < v106;
            goto LABEL_89;
          }
        }
        else
        {
          if (v13 != 3)
          {
            uint64_t v97 = *((void *)v12 + 4);
            uint64_t v98 = *((void *)v12 + 5);
            BOOL v79 = __OFSUB__(v98, v97);
            uint64_t v90 = v98 - v97;
            char v91 = v79;
            goto LABEL_83;
          }
          uint64_t v70 = *((void *)v12 + 4);
          uint64_t v69 = *((void *)v12 + 5);
          BOOL v79 = __OFSUB__(v69, v70);
          uint64_t v71 = v69 - v70;
          char v72 = v79;
        }
        if (v72) {
          goto LABEL_121;
        }
        unint64_t v80 = v13 - 2;
        uint64_t v86 = &v66[16 * v13 - 32];
        uint64_t v88 = *(void *)v86;
        uint64_t v87 = *((void *)v86 + 1);
        BOOL v89 = __OFSUB__(v87, v88);
        uint64_t v90 = v87 - v88;
        char v91 = v89;
        if (v89) {
          goto LABEL_124;
        }
        int64_t v92 = &v66[16 * v68];
        uint64_t v94 = *(void *)v92;
        uint64_t v93 = *((void *)v92 + 1);
        BOOL v79 = __OFSUB__(v93, v94);
        uint64_t v95 = v93 - v94;
        if (v79) {
          goto LABEL_127;
        }
        if (__OFADD__(v90, v95)) {
          goto LABEL_128;
        }
        if (v90 + v95 >= v71)
        {
          BOOL v96 = v71 < v95;
LABEL_89:
          if (v96) {
            unint64_t v68 = v80;
          }
          goto LABEL_91;
        }
LABEL_83:
        if (v91) {
          goto LABEL_123;
        }
        unint64_t v99 = &v66[16 * v68];
        uint64_t v101 = *(void *)v99;
        uint64_t v100 = *((void *)v99 + 1);
        BOOL v79 = __OFSUB__(v100, v101);
        uint64_t v102 = v100 - v101;
        if (v79) {
          goto LABEL_126;
        }
        if (v102 < v90) {
          goto LABEL_15;
        }
LABEL_91:
        unint64_t v107 = v68 - 1;
        if (v68 - 1 >= v13)
        {
          __break(1u);
LABEL_116:
          __break(1u);
LABEL_117:
          __break(1u);
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
LABEL_134:
          __break(1u);
LABEL_135:
          __break(1u);
LABEL_136:
          __break(1u);
LABEL_137:
          __break(1u);
LABEL_138:
          __break(1u);
          goto LABEL_139;
        }
        if (!v11) {
          goto LABEL_141;
        }
        uint64_t v108 = &v66[16 * v107];
        uint64_t v109 = *(void *)v108;
        uint64_t v110 = &v66[16 * v68];
        uint64_t v111 = *((void *)v110 + 1);
        sub_25ACF3A80((int8x8_t *)(v11 + 56 * *(void *)v108), (int8x8_t *)(v11 + 56 * *(void *)v110), v11 + 56 * v111, __dst);
        if (v130) {
          goto LABEL_99;
        }
        if (v111 < v109) {
          goto LABEL_116;
        }
        if (v68 > *((void *)v12 + 2)) {
          goto LABEL_117;
        }
        *(void *)uint64_t v108 = v109;
        *(void *)&v66[16 * v107 + 8] = v111;
        unint64_t v112 = *((void *)v12 + 2);
        if (v68 >= v112) {
          goto LABEL_118;
        }
        unint64_t v13 = v112 - 1;
        memmove(&v66[16 * v68], v110 + 16, 16 * (v112 - 1 - v68));
        *((void *)v12 + 2) = v112 - 1;
        uint64_t v11 = v128;
        if (v112 <= 2) {
          goto LABEL_15;
        }
      }
    }
    unint64_t v13 = 1;
LABEL_15:
    uint64_t v6 = v126;
    uint64_t v3 = v127;
    if (v10 >= v127)
    {
      uint64_t v9 = v125;
      goto LABEL_102;
    }
  }
LABEL_139:
  __break(1u);
LABEL_140:
  __break(1u);
LABEL_141:
  __break(1u);
LABEL_142:
  __break(1u);
LABEL_143:
  __break(1u);
LABEL_144:
  uint64_t result = sub_25AD14920();
  __break(1u);
  return result;
}

uint64_t sub_25ACF3178(uint64_t *a1)
{
  uint64_t v3 = a1[1];
  uint64_t result = sub_25AD14AD0();
  if (result >= v3)
  {
    if (v3 < 0) {
      goto LABEL_136;
    }
    if (v3) {
      return sub_25ACF39B8(0, v3, 1, a1);
    }
    return result;
  }
  if (v3 >= 0) {
    uint64_t v5 = v3;
  }
  else {
    uint64_t v5 = v3 + 1;
  }
  if (v3 < -1) {
    goto LABEL_144;
  }
  uint64_t v6 = result;
  uint64_t v125 = v1;
  uint64_t v118 = a1;
  if (v3 < 2)
  {
    uint64_t v9 = MEMORY[0x263F8EE78];
    __dst = (int8x8_t *)(MEMORY[0x263F8EE78] + 32);
    if (v3 != 1)
    {
      unint64_t v13 = *(void *)(MEMORY[0x263F8EE78] + 16);
      char v12 = (char *)MEMORY[0x263F8EE78];
LABEL_102:
      uint64_t v109 = v12;
      uint64_t v120 = v9;
      if (v13 >= 2)
      {
        uint64_t v110 = *v118;
        do
        {
          unint64_t v111 = v13 - 2;
          if (v13 < 2) {
            goto LABEL_131;
          }
          if (!v110) {
            goto LABEL_143;
          }
          unint64_t v112 = v109;
          uint64_t v113 = *(void *)&v109[16 * v111 + 32];
          uint64_t v114 = *(void *)&v109[16 * v13 + 24];
          sub_25ACF3DB0((int8x8_t *)(v110 + 40 * v113), (int8x8_t *)(v110 + 40 * *(void *)&v109[16 * v13 + 16]), v110 + 40 * v114, __dst);
          if (v125) {
            break;
          }
          if (v114 < v113) {
            goto LABEL_132;
          }
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            unint64_t v112 = sub_25ACF4364((uint64_t)v112);
          }
          if (v111 >= *((void *)v112 + 2)) {
            goto LABEL_133;
          }
          uint64_t v115 = &v112[16 * v111 + 32];
          *(void *)uint64_t v115 = v113;
          *((void *)v115 + 1) = v114;
          unint64_t v116 = *((void *)v112 + 2);
          if (v13 > v116) {
            goto LABEL_134;
          }
          memmove(&v112[16 * v13 + 16], &v112[16 * v13 + 32], 16 * (v116 - v13));
          uint64_t v109 = v112;
          *((void *)v112 + 2) = v116 - 1;
          unint64_t v13 = v116 - 1;
        }
        while (v116 > 2);
      }
LABEL_99:
      swift_bridgeObjectRelease();
      *(void *)(v120 + 16) = 0;
      return swift_bridgeObjectRelease();
    }
    uint64_t v120 = MEMORY[0x263F8EE78];
  }
  else
  {
    uint64_t v7 = v5 >> 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B34F8);
    uint64_t v8 = sub_25AD146C0();
    *(void *)(v8 + 16) = v7;
    uint64_t v120 = v8;
    __dst = (int8x8_t *)(v8 + 32);
  }
  uint64_t v10 = 0;
  uint64_t v11 = *a1;
  uint64_t v119 = *a1 + 112;
  uint64_t v117 = *a1 - 8;
  char v12 = (char *)MEMORY[0x263F8EE78];
  uint64_t v121 = v6;
  uint64_t v122 = v3;
  uint64_t v123 = v11;
  while (1)
  {
    uint64_t v14 = v10++;
    if (v10 < v3)
    {
      char v15 = (uint64_t *)(v11 + 40 * v10);
      uint64_t v16 = *v15;
      int8x8_t v17 = (int8x8_t)v15[4];
      uint8x8_t v18 = (int8x8_t *)(v11 + 40 * v14);
      uint8x8_t v19 = (uint8x8_t)vcnt_s8(v17);
      v19.i16[0] = vaddlv_u8(v19);
      unint64_t v20 = v19.u32[0];
      uint8x8_t v21 = (uint8x8_t)vcnt_s8(v18[4]);
      v21.i16[0] = vaddlv_u8(v21);
      BOOL v22 = v16 < *(void *)v18;
      int v23 = v20 < v21.u32[0];
      if (v20 == v21.u32[0]) {
        int v23 = v22;
      }
      uint64_t v10 = v14 + 2;
      if (v14 + 2 < v3)
      {
        uint64_t v24 = (int8x8_t *)(v119 + 40 * v14);
        while (1)
        {
          int8x8_t v25 = v24[-4];
          int8x8_t v26 = *v24;
          uint8x8_t v27 = (uint8x8_t)vcnt_s8(*v24);
          v27.i16[0] = vaddlv_u8(v27);
          unint64_t v28 = v27.u32[0];
          uint8x8_t v29 = (uint8x8_t)vcnt_s8(v17);
          v29.i16[0] = vaddlv_u8(v29);
          int v30 = *(void *)&v25 < v16;
          if (v28 != v29.u32[0]) {
            int v30 = v28 < v29.u32[0];
          }
          if (v23 != v30) {
            break;
          }
          v24 += 5;
          ++v10;
          int8x8_t v17 = v26;
          uint64_t v16 = (uint64_t)v25;
          if (v3 == v10)
          {
            uint64_t v10 = v3;
            break;
          }
        }
      }
      if (v23)
      {
        if (v10 < v14) {
          goto LABEL_137;
        }
        if (v14 < v10)
        {
          uint64_t v31 = 40 * v10;
          uint64_t v32 = 40 * v14;
          uint64_t v33 = v10;
          uint64_t v34 = v14;
          do
          {
            if (v34 != --v33)
            {
              if (!v11) {
                goto LABEL_142;
              }
              uint64_t v35 = v11 + v32;
              uint64_t v36 = *(void *)(v11 + v32 + 16);
              uint64_t v37 = v11 + v31;
              long long v38 = *(_OWORD *)(v11 + v32);
              long long v39 = *(_OWORD *)(v11 + v32 + 24);
              uint64_t v40 = *(void *)(v11 + v31 - 8);
              long long v41 = *(_OWORD *)(v11 + v31 - 24);
              *(_OWORD *)uint64_t v35 = *(_OWORD *)(v11 + v31 - 40);
              *(_OWORD *)(v35 + 16) = v41;
              *(void *)(v35 + 32) = v40;
              *(_OWORD *)(v37 - 40) = v38;
              *(void *)(v37 - 24) = v36;
              *(_OWORD *)(v37 - 16) = v39;
            }
            ++v34;
            v31 -= 40;
            v32 += 40;
          }
          while (v34 < v33);
        }
      }
    }
    if (v10 >= v3) {
      goto LABEL_52;
    }
    if (__OFSUB__(v10, v14)) {
      goto LABEL_135;
    }
    if (v10 - v14 >= v6) {
      goto LABEL_52;
    }
    uint64_t v42 = v14 + v6;
    if (__OFADD__(v14, v6)) {
      goto LABEL_138;
    }
    if (v42 >= v3) {
      uint64_t v42 = v3;
    }
    if (v42 < v14) {
      break;
    }
    if (v10 != v42)
    {
      uint64_t v43 = v117 + 40 * v10;
      do
      {
        long long v44 = (int8x8_t *)(v11 + 40 * v10);
        int8x8_t v45 = *v44;
        int8x8_t v46 = v44[4];
        uint8x8_t v47 = (uint8x8_t)vcnt_s8(v46);
        v47.i16[0] = vaddlv_u8(v47);
        unint64_t v48 = v47.u32[0];
        uint64_t v49 = v14;
        uint64_t v50 = (int8x8_t *)v43;
        do
        {
          uint8x8_t v51 = (uint8x8_t)vcnt_s8(*v50);
          v51.i16[0] = vaddlv_u8(v51);
          BOOL v52 = *(void *)&v45 < *(void *)&v50[-4];
          if (v48 != v51.u32[0]) {
            BOOL v52 = v48 < v51.u32[0];
          }
          if (!v52) {
            break;
          }
          if (!v11) {
            goto LABEL_140;
          }
          uint8x8_t v53 = v50 + 1;
          int8x8_t v54 = v50[2];
          int8x8_t v55 = v50[3];
          int8x8_t v56 = v50[4];
          long long v57 = *(_OWORD *)v50[-2].i8;
          *(_OWORD *)v50[1].i8 = *(_OWORD *)v50[-4].i8;
          *(_OWORD *)v50[3].i8 = v57;
          int8x8_t v58 = *v50;
          v50[-4] = v45;
          v50[-3] = v54;
          v50[-2] = v55;
          v50[-1] = v56;
          *uint64_t v50 = v46;
          v50 -= 5;
          ++v49;
          v53[4] = v58;
        }
        while (v10 != v49);
        ++v10;
        v43 += 40;
      }
      while (v10 != v42);
      uint64_t v10 = v42;
    }
LABEL_52:
    if (v10 < v14) {
      goto LABEL_130;
    }
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      char v12 = sub_25ACF40CC(0, *((void *)v12 + 2) + 1, 1, v12);
    }
    unint64_t v60 = *((void *)v12 + 2);
    unint64_t v59 = *((void *)v12 + 3);
    unint64_t v13 = v60 + 1;
    uint64_t v11 = v123;
    if (v60 >= v59 >> 1)
    {
      uint64_t v108 = sub_25ACF40CC((char *)(v59 > 1), v60 + 1, 1, v12);
      uint64_t v11 = v123;
      char v12 = v108;
    }
    *((void *)v12 + 2) = v13;
    int v61 = v12 + 32;
    long long v62 = &v12[16 * v60 + 32];
    *(void *)long long v62 = v14;
    *((void *)v62 + 1) = v10;
    if (v60)
    {
      while (1)
      {
        unint64_t v63 = v13 - 1;
        if (v13 >= 4)
        {
          unint64_t v68 = &v61[16 * v13];
          uint64_t v69 = *((void *)v68 - 8);
          uint64_t v70 = *((void *)v68 - 7);
          BOOL v74 = __OFSUB__(v70, v69);
          uint64_t v71 = v70 - v69;
          if (v74) {
            goto LABEL_119;
          }
          uint64_t v73 = *((void *)v68 - 6);
          uint64_t v72 = *((void *)v68 - 5);
          BOOL v74 = __OFSUB__(v72, v73);
          uint64_t v66 = v72 - v73;
          char v67 = v74;
          if (v74) {
            goto LABEL_120;
          }
          unint64_t v75 = v13 - 2;
          uint64_t v76 = &v61[16 * v13 - 32];
          uint64_t v78 = *(void *)v76;
          uint64_t v77 = *((void *)v76 + 1);
          BOOL v74 = __OFSUB__(v77, v78);
          uint64_t v79 = v77 - v78;
          if (v74) {
            goto LABEL_122;
          }
          BOOL v74 = __OFADD__(v66, v79);
          uint64_t v80 = v66 + v79;
          if (v74) {
            goto LABEL_125;
          }
          if (v80 >= v71)
          {
            uint64_t v98 = &v61[16 * v63];
            uint64_t v100 = *(void *)v98;
            uint64_t v99 = *((void *)v98 + 1);
            BOOL v74 = __OFSUB__(v99, v100);
            uint64_t v101 = v99 - v100;
            if (v74) {
              goto LABEL_129;
            }
            BOOL v91 = v66 < v101;
            goto LABEL_89;
          }
        }
        else
        {
          if (v13 != 3)
          {
            uint64_t v92 = *((void *)v12 + 4);
            uint64_t v93 = *((void *)v12 + 5);
            BOOL v74 = __OFSUB__(v93, v92);
            uint64_t v85 = v93 - v92;
            char v86 = v74;
            goto LABEL_83;
          }
          uint64_t v65 = *((void *)v12 + 4);
          uint64_t v64 = *((void *)v12 + 5);
          BOOL v74 = __OFSUB__(v64, v65);
          uint64_t v66 = v64 - v65;
          char v67 = v74;
        }
        if (v67) {
          goto LABEL_121;
        }
        unint64_t v75 = v13 - 2;
        char v81 = &v61[16 * v13 - 32];
        uint64_t v83 = *(void *)v81;
        uint64_t v82 = *((void *)v81 + 1);
        BOOL v84 = __OFSUB__(v82, v83);
        uint64_t v85 = v82 - v83;
        char v86 = v84;
        if (v84) {
          goto LABEL_124;
        }
        uint64_t v87 = &v61[16 * v63];
        uint64_t v89 = *(void *)v87;
        uint64_t v88 = *((void *)v87 + 1);
        BOOL v74 = __OFSUB__(v88, v89);
        uint64_t v90 = v88 - v89;
        if (v74) {
          goto LABEL_127;
        }
        if (__OFADD__(v85, v90)) {
          goto LABEL_128;
        }
        if (v85 + v90 >= v66)
        {
          BOOL v91 = v66 < v90;
LABEL_89:
          if (v91) {
            unint64_t v63 = v75;
          }
          goto LABEL_91;
        }
LABEL_83:
        if (v86) {
          goto LABEL_123;
        }
        uint64_t v94 = &v61[16 * v63];
        uint64_t v96 = *(void *)v94;
        uint64_t v95 = *((void *)v94 + 1);
        BOOL v74 = __OFSUB__(v95, v96);
        uint64_t v97 = v95 - v96;
        if (v74) {
          goto LABEL_126;
        }
        if (v97 < v85) {
          goto LABEL_15;
        }
LABEL_91:
        unint64_t v102 = v63 - 1;
        if (v63 - 1 >= v13)
        {
          __break(1u);
LABEL_116:
          __break(1u);
LABEL_117:
          __break(1u);
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
LABEL_134:
          __break(1u);
LABEL_135:
          __break(1u);
LABEL_136:
          __break(1u);
LABEL_137:
          __break(1u);
LABEL_138:
          __break(1u);
          goto LABEL_139;
        }
        if (!v11) {
          goto LABEL_141;
        }
        uint64_t v103 = &v61[16 * v102];
        uint64_t v104 = *(void *)v103;
        uint64_t v105 = &v61[16 * v63];
        uint64_t v106 = *((void *)v105 + 1);
        sub_25ACF3DB0((int8x8_t *)(v11 + 40 * *(void *)v103), (int8x8_t *)(v11 + 40 * *(void *)v105), v11 + 40 * v106, __dst);
        if (v125) {
          goto LABEL_99;
        }
        if (v106 < v104) {
          goto LABEL_116;
        }
        if (v63 > *((void *)v12 + 2)) {
          goto LABEL_117;
        }
        *(void *)uint64_t v103 = v104;
        *(void *)&v61[16 * v102 + 8] = v106;
        unint64_t v107 = *((void *)v12 + 2);
        if (v63 >= v107) {
          goto LABEL_118;
        }
        unint64_t v13 = v107 - 1;
        memmove(&v61[16 * v63], v105 + 16, 16 * (v107 - 1 - v63));
        *((void *)v12 + 2) = v107 - 1;
        uint64_t v11 = v123;
        if (v107 <= 2) {
          goto LABEL_15;
        }
      }
    }
    unint64_t v13 = 1;
LABEL_15:
    uint64_t v6 = v121;
    uint64_t v3 = v122;
    if (v10 >= v122)
    {
      uint64_t v9 = v120;
      goto LABEL_102;
    }
  }
LABEL_139:
  __break(1u);
LABEL_140:
  __break(1u);
LABEL_141:
  __break(1u);
LABEL_142:
  __break(1u);
LABEL_143:
  __break(1u);
LABEL_144:
  uint64_t result = sub_25AD14920();
  __break(1u);
  return result;
}

uint64_t sub_25ACF38DC(uint64_t result, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  if (a3 != a2)
  {
    uint64_t v4 = *a4;
    uint64_t v5 = *a4 + 56 * a3 - 56;
LABEL_5:
    uint64_t v6 = result;
    uint64_t v7 = v5;
    while (1)
    {
      uint64_t v8 = v7 + 56;
      uint64_t v9 = *(void *)(v7 + 56);
      int8x8_t v10 = *(int8x8_t *)(v7 + 88);
      uint8x8_t v11 = (uint8x8_t)vcnt_s8(v10);
      v11.i16[0] = vaddlv_u8(v11);
      unint64_t v12 = v11.u32[0];
      uint8x8_t v13 = (uint8x8_t)vcnt_s8(*(int8x8_t *)(v7 + 32));
      v13.i16[0] = vaddlv_u8(v13);
      BOOL v14 = v9 < *(void *)v7;
      BOOL v15 = v12 == v13.u32[0];
      BOOL v16 = v12 < v13.u32[0];
      if (!v15) {
        BOOL v14 = v16;
      }
      if (!v14)
      {
LABEL_4:
        ++a3;
        v5 += 56;
        if (a3 == a2) {
          return result;
        }
        goto LABEL_5;
      }
      if (!v4) {
        break;
      }
      long long v17 = *(_OWORD *)(v7 + 64);
      uint64_t v18 = *(void *)(v7 + 80);
      uint64_t v19 = *(void *)(v7 + 96);
      int v20 = *(_DWORD *)(v7 + 104);
      long long v21 = *(_OWORD *)(v7 + 16);
      *(_OWORD *)uint64_t v8 = *(_OWORD *)v7;
      *(_OWORD *)(v7 + 72) = v21;
      *(_OWORD *)(v7 + 88) = *(_OWORD *)(v7 + 32);
      uint64_t v22 = *(void *)(v7 + 48);
      *(void *)uint64_t v7 = v9;
      *(_OWORD *)(v7 + 8) = v17;
      *(void *)(v7 + 24) = v18;
      *(int8x8_t *)(v7 + 32) = v10;
      *(void *)(v7 + 40) = v19;
      *(_DWORD *)(v7 + 48) = v20;
      v7 -= 56;
      ++v6;
      *(void *)(v8 + 48) = v22;
      if (a3 == v6) {
        goto LABEL_4;
      }
    }
    __break(1u);
  }
  return result;
}

uint64_t sub_25ACF39B8(uint64_t result, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  if (a3 != a2)
  {
    uint64_t v4 = *a4;
    uint64_t v5 = *a4 + 40 * a3 - 8;
LABEL_5:
    uint64_t v6 = (uint64_t *)(v4 + 40 * a3);
    uint64_t v7 = *v6;
    int8x8_t v8 = (int8x8_t)v6[4];
    uint8x8_t v9 = (uint8x8_t)vcnt_s8(v8);
    v9.i16[0] = vaddlv_u8(v9);
    unint64_t v10 = v9.u32[0];
    uint64_t v11 = result;
    uint64_t v12 = v5;
    while (1)
    {
      uint8x8_t v13 = (uint8x8_t)vcnt_s8(*(int8x8_t *)v12);
      v13.i16[0] = vaddlv_u8(v13);
      BOOL v14 = v7 < *(void *)(v12 - 32);
      if (v10 != v13.u32[0]) {
        BOOL v14 = v10 < v13.u32[0];
      }
      if (!v14)
      {
LABEL_4:
        ++a3;
        v5 += 40;
        if (a3 == a2) {
          return result;
        }
        goto LABEL_5;
      }
      if (!v4) {
        break;
      }
      BOOL v15 = (int8x8_t *)(v12 + 8);
      uint64_t v16 = *(void *)(v12 + 16);
      uint64_t v17 = *(void *)(v12 + 24);
      uint64_t v18 = *(void *)(v12 + 32);
      long long v19 = *(_OWORD *)(v12 - 16);
      *(_OWORD *)(v12 + 8) = *(_OWORD *)(v12 - 32);
      *(_OWORD *)(v12 + 24) = v19;
      int8x8_t v20 = *(int8x8_t *)v12;
      *(void *)(v12 - 32) = v7;
      *(void *)(v12 - 24) = v16;
      *(void *)(v12 - 16) = v17;
      *(void *)(v12 - 8) = v18;
      *(int8x8_t *)uint64_t v12 = v8;
      v12 -= 40;
      ++v11;
      v15[4] = v20;
      if (a3 == v11) {
        goto LABEL_4;
      }
    }
    __break(1u);
  }
  return result;
}

uint64_t sub_25ACF3A80(int8x8_t *__src, int8x8_t *a2, unint64_t a3, int8x8_t *__dst)
{
  uint64_t v4 = __dst;
  uint64_t v6 = a2;
  uint64_t v7 = __src;
  int64_t v8 = (char *)a2 - (char *)__src;
  int64_t v9 = ((char *)a2 - (char *)__src) / 56;
  uint64_t v10 = a3 - (void)a2;
  uint64_t v11 = (uint64_t)(a3 - (void)a2) / 56;
  uint64_t v43 = __dst;
  long long v44 = __src;
  if (v9 >= v11)
  {
    if (v10 >= -55)
    {
      uint64_t v25 = 7 * v11;
      if (__dst != a2 || &a2[v25] <= __dst) {
        memmove(__dst, a2, 56 * v11);
      }
      int8x8_t v26 = &v4[v25];
      uint64_t v42 = &v4[v25];
      long long v44 = v6;
      if (v7 < v6 && v10 >= 56)
      {
        unint64_t v27 = a3 - 56;
        unint64_t v28 = v6;
        while (1)
        {
          uint8x8_t v29 = (int8x8_t *)(v27 + 56);
          int8x8_t v30 = v28[-7];
          v28 -= 7;
          uint8x8_t v31 = (uint8x8_t)vcnt_s8(v26[-3]);
          v31.i16[0] = vaddlv_u8(v31);
          unint64_t v32 = v31.u32[0];
          uint8x8_t v33 = (uint8x8_t)vcnt_s8(v28[4]);
          v33.i16[0] = vaddlv_u8(v33);
          BOOL v34 = *(void *)&v26[-7] < *(void *)&v30;
          if (v32 != v33.u32[0]) {
            BOOL v34 = v32 < v33.u32[0];
          }
          if (v34)
          {
            if (v29 != v6 || v27 >= (unint64_t)v6)
            {
              long long v35 = *(_OWORD *)v28->i8;
              long long v36 = *(_OWORD *)v28[2].i8;
              long long v37 = *(_OWORD *)v28[4].i8;
              *(int8x8_t *)(v27 + 48) = v28[6];
              *(_OWORD *)(v27 + 16) = v36;
              *(_OWORD *)(v27 + 32) = v37;
              *(_OWORD *)unint64_t v27 = v35;
            }
            long long v44 = v28;
            if (v28 <= v7) {
              goto LABEL_42;
            }
          }
          else
          {
            uint64_t v42 = v26 - 7;
            if (v29 < v26 || v27 >= (unint64_t)v26 || v29 != v26)
            {
              long long v38 = *(_OWORD *)v26[-7].i8;
              long long v39 = *(_OWORD *)v26[-5].i8;
              long long v40 = *(_OWORD *)v26[-3].i8;
              *(int8x8_t *)(v27 + 48) = v26[-1];
              *(_OWORD *)(v27 + 16) = v39;
              *(_OWORD *)(v27 + 32) = v40;
              *(_OWORD *)unint64_t v27 = v38;
            }
            unint64_t v28 = v6;
            v26 -= 7;
            if (v6 <= v7) {
              goto LABEL_42;
            }
          }
          v27 -= 56;
          uint64_t v6 = v28;
          if (v26 <= v4) {
            goto LABEL_42;
          }
        }
      }
      goto LABEL_42;
    }
  }
  else if (v8 >= -55)
  {
    size_t v12 = 7 * v9;
    if (__dst != __src || &__src[v12] <= __dst) {
      memmove(__dst, __src, v12 * 8);
    }
    uint8x8_t v13 = &v4[v12];
    uint64_t v42 = &v4[v12];
    if ((unint64_t)v6 < a3 && v8 >= 56)
    {
      do
      {
        uint8x8_t v14 = (uint8x8_t)vcnt_s8(v6[4]);
        v14.i16[0] = vaddlv_u8(v14);
        unint64_t v15 = v14.u32[0];
        uint8x8_t v16 = (uint8x8_t)vcnt_s8(v4[4]);
        v16.i16[0] = vaddlv_u8(v16);
        BOOL v17 = *(uint64_t *)v6 < *(void *)v4;
        if (v15 != v16.u32[0]) {
          BOOL v17 = v15 < v16.u32[0];
        }
        if (v17)
        {
          uint64_t v18 = v6 + 7;
          if (v7 < v6 || v7 >= v18 || v7 != v6)
          {
            long long v19 = *(_OWORD *)v6->i8;
            long long v20 = *(_OWORD *)v6[2].i8;
            long long v21 = *(_OWORD *)v6[4].i8;
            _OWORD v7[6] = v6[6];
            *(_OWORD *)v7[2].i8 = v20;
            *(_OWORD *)v7[4].i8 = v21;
            *(_OWORD *)v7->i8 = v19;
          }
        }
        else
        {
          if (v7 != v4)
          {
            long long v22 = *(_OWORD *)v4->i8;
            long long v23 = *(_OWORD *)v4[2].i8;
            long long v24 = *(_OWORD *)v4[4].i8;
            _OWORD v7[6] = v4[6];
            *(_OWORD *)v7[2].i8 = v23;
            *(_OWORD *)v7[4].i8 = v24;
            *(_OWORD *)v7->i8 = v22;
          }
          v4 += 7;
          uint64_t v43 = v4;
          uint64_t v18 = v6;
        }
        v7 += 7;
        if (v4 >= v13) {
          break;
        }
        uint64_t v6 = v18;
      }
      while ((unint64_t)v18 < a3);
      long long v44 = v7;
    }
LABEL_42:
    sub_25ACF41C8((void **)&v44, (const void **)&v43, &v42);
    return 1;
  }
  uint64_t result = sub_25AD14980();
  __break(1u);
  return result;
}

uint64_t sub_25ACF3DB0(int8x8_t *__src, int8x8_t *a2, unint64_t a3, int8x8_t *__dst)
{
  uint64_t v4 = __dst;
  uint64_t v6 = a2;
  uint64_t v7 = __src;
  int64_t v8 = (char *)a2 - (char *)__src;
  int64_t v9 = ((char *)a2 - (char *)__src) / 40;
  uint64_t v10 = a3 - (void)a2;
  uint64_t v11 = (uint64_t)(a3 - (void)a2) / 40;
  long long v38 = __src;
  long long v37 = __dst;
  if (v9 >= v11)
  {
    if (v10 >= -39)
    {
      if (__dst != a2 || &a2[5 * v11] <= __dst) {
        memmove(__dst, a2, 40 * v11);
      }
      long long v22 = &v4[5 * v11];
      long long v36 = (char *)v22;
      long long v38 = v6;
      if (v7 < v6 && v10 >= 40)
      {
        unint64_t v23 = a3 - 40;
        long long v24 = v6;
        while (1)
        {
          uint64_t v25 = (int8x8_t *)(v23 + 40);
          int8x8_t v26 = v24[-5];
          v24 -= 5;
          uint8x8_t v27 = (uint8x8_t)vcnt_s8(v22[-1]);
          v27.i16[0] = vaddlv_u8(v27);
          unint64_t v28 = v27.u32[0];
          uint8x8_t v29 = (uint8x8_t)vcnt_s8(v24[4]);
          v29.i16[0] = vaddlv_u8(v29);
          BOOL v30 = *(void *)&v22[-5] < *(void *)&v26;
          if (v28 != v29.u32[0]) {
            BOOL v30 = v28 < v29.u32[0];
          }
          if (v30)
          {
            if (v25 != v6 || v23 >= (unint64_t)v6)
            {
              long long v31 = *(_OWORD *)v24->i8;
              long long v32 = *(_OWORD *)v24[2].i8;
              *(int8x8_t *)(v23 + 32) = v24[4];
              *(_OWORD *)unint64_t v23 = v31;
              *(_OWORD *)(v23 + 16) = v32;
            }
            long long v38 = v24;
            if (v24 <= v7) {
              goto LABEL_42;
            }
          }
          else
          {
            long long v36 = (char *)&v22[-5];
            if (v25 < v22 || v23 >= (unint64_t)v22 || v25 != v22)
            {
              long long v33 = *(_OWORD *)v22[-5].i8;
              long long v34 = *(_OWORD *)v22[-3].i8;
              *(int8x8_t *)(v23 + 32) = v22[-1];
              *(_OWORD *)unint64_t v23 = v33;
              *(_OWORD *)(v23 + 16) = v34;
            }
            long long v24 = v6;
            v22 -= 5;
            if (v6 <= v7) {
              goto LABEL_42;
            }
          }
          v23 -= 40;
          uint64_t v6 = v24;
          if (v22 <= v4) {
            goto LABEL_42;
          }
        }
      }
      goto LABEL_42;
    }
  }
  else if (v8 >= -39)
  {
    if (__dst != __src || &__src[5 * v9] <= __dst) {
      memmove(__dst, __src, 40 * v9);
    }
    size_t v12 = &v4[5 * v9];
    long long v36 = (char *)v12;
    if ((unint64_t)v6 < a3 && v8 >= 40)
    {
      do
      {
        uint8x8_t v13 = (uint8x8_t)vcnt_s8(v6[4]);
        v13.i16[0] = vaddlv_u8(v13);
        unint64_t v14 = v13.u32[0];
        uint8x8_t v15 = (uint8x8_t)vcnt_s8(v4[4]);
        v15.i16[0] = vaddlv_u8(v15);
        BOOL v16 = *(uint64_t *)v6 < *(void *)v4;
        if (v14 != v15.u32[0]) {
          BOOL v16 = v14 < v15.u32[0];
        }
        if (v16)
        {
          BOOL v17 = v6 + 5;
          if (v7 < v6 || v7 >= v17 || v7 != v6)
          {
            long long v18 = *(_OWORD *)v6->i8;
            long long v19 = *(_OWORD *)v6[2].i8;
            v7[4] = v6[4];
            *(_OWORD *)v7->i8 = v18;
            *(_OWORD *)v7[2].i8 = v19;
          }
        }
        else
        {
          if (v7 != v4)
          {
            long long v20 = *(_OWORD *)v4->i8;
            long long v21 = *(_OWORD *)v4[2].i8;
            v7[4] = v4[4];
            *(_OWORD *)v7->i8 = v20;
            *(_OWORD *)v7[2].i8 = v21;
          }
          v4 += 5;
          long long v37 = v4;
          BOOL v17 = v6;
        }
        v7 += 5;
        if (v4 >= v12) {
          break;
        }
        uint64_t v6 = v17;
      }
      while ((unint64_t)v17 < a3);
      long long v38 = v7;
    }
LABEL_42:
    sub_25ACF4298((void **)&v38, (const void **)&v37, &v36);
    return 1;
  }
  uint64_t result = sub_25AD14980();
  __break(1u);
  return result;
}

char *sub_25ACF40CC(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
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
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B3500);
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
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint8x8_t v13 = v10 + 32;
  unint64_t v14 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, 16 * v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

char *sub_25ACF41C8(void **a1, const void **a2, void *a3)
{
  uint64_t v3 = (char *)*a2;
  uint64_t v4 = *a3 - (void)v3;
  if (v4 <= -56)
  {
    uint64_t result = (char *)sub_25AD14980();
    __break(1u);
  }
  else
  {
    uint64_t result = (char *)*a1;
    size_t v6 = 56 * (v4 / 56);
    if (result != v3 || result >= &v3[v6])
    {
      return (char *)memmove(result, v3, v6);
    }
  }
  return result;
}

char *sub_25ACF4298(void **a1, const void **a2, void *a3)
{
  uint64_t v3 = (char *)*a2;
  uint64_t v4 = *a3 - (void)v3;
  if (v4 <= -40)
  {
    uint64_t result = (char *)sub_25AD14980();
    __break(1u);
  }
  else
  {
    uint64_t result = (char *)*a1;
    uint64_t v6 = v4 / 40;
    if (result != v3 || result >= &v3[40 * v6])
    {
      return (char *)memmove(result, v3, 40 * v6);
    }
  }
  return result;
}

char *sub_25ACF4364(uint64_t a1)
{
  return sub_25ACF40CC(0, *(void *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_25ACF4378(void *a1)
{
  return sub_25AD100E8(0, a1[2], 0, a1);
}

uint64_t sub_25ACF438C(void *a1)
{
  return sub_25AD10D44(0, a1[2], 0, a1);
}

uint64_t sub_25ACF43A0(uint64_t a1, unint64_t a2, uint64_t a3)
{
  int64_t v3 = *(void *)(a1 + 16);
  uint64_t v4 = MEMORY[0x263F8EE78];
  if (!v3) {
    return v4;
  }
  uint64_t v30 = MEMORY[0x263F8EE78];
  uint64_t result = sub_25AD0FB50(0, v3, 0);
  uint64_t v8 = 0;
  uint64_t v4 = v30;
  unint64_t v27 = a2 - 65;
  uint64_t v28 = a1 + 32;
  uint64_t v24 = -(uint64_t)a2;
  unint64_t v26 = a2;
  while (1)
  {
    uint64_t v9 = (uint64_t *)(v28 + 48 * v8);
    uint64_t v11 = *v9;
    uint64_t v10 = v9[1];
    uint64_t v12 = v9[2];
    long long v13 = *(_OWORD *)(v9 + 3);
    int v14 = *((_DWORD *)v9 + 10);
    if (v27 <= 0xFFFFFFFFFFFFFF7ELL) {
      goto LABEL_17;
    }
    if ((a2 & 0x8000000000000000) != 0) {
      break;
    }
    if (a2 < 0x40)
    {
      unint64_t v15 = (unint64_t)v13 >> a2;
      if ((unint64_t)v13 >> a2) {
        goto LABEL_7;
      }
    }
LABEL_17:
    uint64_t v16 = 0;
LABEL_18:
    long long v29 = v13;
    unint64_t v21 = *(void *)(v30 + 16);
    unint64_t v22 = *(void *)(v30 + 24);
    uint64_t result = swift_bridgeObjectRetain();
    if (v21 >= v22 >> 1) {
      uint64_t result = sub_25AD0FB50(v22 > 1, v21 + 1, 1);
    }
    ++v8;
    *(void *)(v30 + 16) = v21 + 1;
    uint64_t v23 = v30 + 56 * v21;
    *(void *)(v23 + 32) = v16;
    *(void *)(v23 + 40) = v11;
    *(void *)(v23 + 48) = v10;
    *(void *)(v23 + 56) = v12;
    *(_OWORD *)(v23 + 64) = v29;
    *(_DWORD *)(v23 + 80) = v14;
    a2 = v26;
    if (v8 == v3) {
      return v4;
    }
  }
  if (a2 <= 0xFFFFFFFFFFFFFFC0) {
    goto LABEL_17;
  }
  unint64_t v15 = (void)v13 << v24;
  if (!((void)v13 << v24)) {
    goto LABEL_17;
  }
LABEL_7:
  uint64_t v16 = 0;
  while (1)
  {
    unint64_t v17 = __clz(__rbit64(v15));
    if (v17 >= *(void *)(*(void *)a3 + 16)) {
      break;
    }
    uint64_t v18 = *(void *)(*(void *)a3 + 32 + 8 * v17);
    BOOL v19 = __OFADD__(v16, v18);
    v16 += v18;
    if (v19) {
      goto LABEL_23;
    }
    if (v17 >= 0x40) {
      uint64_t v20 = -1;
    }
    else {
      uint64_t v20 = (-1 << v17) - 1;
    }
    v15 &= v20;
    if (!v15) {
      goto LABEL_18;
    }
  }
  __break(1u);
LABEL_23:
  __break(1u);
  return result;
}

uint64_t sub_25ACF4578(uint64_t a1, uint64_t a2)
{
  int64_t v2 = *(void *)(a1 + 16);
  uint64_t v3 = MEMORY[0x263F8EE78];
  if (v2)
  {
    uint64_t v19 = MEMORY[0x263F8EE78];
    sub_25AD0FC90(0, v2, 0);
    uint64_t v3 = v19;
    uint64_t v6 = *(void *)(a2 + 16);
    int64_t v7 = (uint64_t *)(a1 + 40);
    while (1)
    {
      uint64_t v9 = *(v7 - 1);
      uint64_t v8 = *v7;
      uint64_t v10 = *(void *)(v6 + 16);
      swift_bridgeObjectRetain();
      if (!v10) {
        break;
      }
      swift_bridgeObjectRetain();
      unint64_t v11 = sub_25AD0A230(v9, v8);
      if ((v12 & 1) == 0)
      {
        swift_bridgeObjectRelease();
        break;
      }
      long long v18 = *(_OWORD *)(*(void *)(v6 + 56) + 32 * v11 + 16);
      swift_bridgeObjectRelease();
      unint64_t v14 = *(void *)(v19 + 16);
      unint64_t v13 = *(void *)(v19 + 24);
      if (v14 >= v13 >> 1) {
        sub_25AD0FC90(v13 > 1, v14 + 1, 1);
      }
      v7 += 2;
      *(void *)(v19 + 16) = v14 + 1;
      uint64_t v15 = v19 + 32 * v14;
      *(void *)(v15 + 32) = v9;
      *(void *)(v15 + 40) = v8;
      *(_OWORD *)(v15 + 48) = v18;
      if (!--v2) {
        return v3;
      }
    }
    sub_25ACF5F18();
    swift_allocError();
    *uint64_t v16 = v9;
    v16[1] = v8;
    swift_willThrow();
    swift_release();
  }
  return v3;
}

uint64_t sub_25ACF46EC(uint64_t a1, unint64_t a2, uint64_t a3)
{
  int64_t v3 = *(void *)(a1 + 16);
  uint64_t v4 = MEMORY[0x263F8EE78];
  if (!v3) {
    return v4;
  }
  uint64_t v25 = MEMORY[0x263F8EE78];
  uint64_t result = sub_25AD0FC70(0, v3, 0);
  uint64_t v8 = 0;
  uint64_t v4 = v25;
  uint64_t v22 = -(uint64_t)a2;
  while (1)
  {
    uint64_t v9 = a1 + 32 + 32 * v8;
    uint64_t v10 = *(void *)v9;
    uint64_t v11 = *(void *)(v9 + 8);
    long long v12 = *(_OWORD *)(v9 + 16);
    if (a2 - 65 <= 0xFFFFFFFFFFFFFF7ELL) {
      goto LABEL_17;
    }
    if ((a2 & 0x8000000000000000) != 0) {
      break;
    }
    if (a2 < 0x40)
    {
      unint64_t v13 = *((void *)&v12 + 1) >> a2;
      if (*((void *)&v12 + 1) >> a2) {
        goto LABEL_7;
      }
    }
LABEL_17:
    uint64_t v14 = 0;
LABEL_18:
    long long v24 = v12;
    unint64_t v20 = *(void *)(v25 + 16);
    unint64_t v19 = *(void *)(v25 + 24);
    uint64_t result = swift_bridgeObjectRetain();
    if (v20 >= v19 >> 1) {
      uint64_t result = sub_25AD0FC70(v19 > 1, v20 + 1, 1);
    }
    ++v8;
    *(void *)(v25 + 16) = v20 + 1;
    uint64_t v21 = v25 + 40 * v20;
    *(void *)(v21 + 32) = v14;
    *(void *)(v21 + 40) = v10;
    *(void *)(v21 + 48) = v11;
    *(_OWORD *)(v21 + 56) = v24;
    if (v8 == v3) {
      return v4;
    }
  }
  if (a2 <= 0xFFFFFFFFFFFFFFC0) {
    goto LABEL_17;
  }
  unint64_t v13 = *((void *)&v12 + 1) << v22;
  if (!(*((void *)&v12 + 1) << v22)) {
    goto LABEL_17;
  }
LABEL_7:
  uint64_t v14 = 0;
  while (1)
  {
    unint64_t v15 = __clz(__rbit64(v13));
    if (v15 >= *(void *)(*(void *)a3 + 16)) {
      break;
    }
    uint64_t v16 = *(void *)(*(void *)a3 + 32 + 8 * v15);
    BOOL v17 = __OFADD__(v14, v16);
    v14 += v16;
    if (v17) {
      goto LABEL_23;
    }
    if (v15 >= 0x40) {
      uint64_t v18 = -1;
    }
    else {
      uint64_t v18 = (-1 << v15) - 1;
    }
    v13 &= v18;
    if (!v13) {
      goto LABEL_18;
    }
  }
  __break(1u);
LABEL_23:
  __break(1u);
  return result;
}

void *sub_25ACF48B4(void *result, char a2, void *a3)
{
  uint64_t v3 = result[2];
  if (v3)
  {
    uint64_t v6 = result;
    uint64_t v8 = result[4];
    uint64_t v7 = result[5];
    uint64_t v41 = result[6];
    uint64_t v9 = (void *)*a3;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t v11 = sub_25AD0A230(v8, v7);
    uint64_t v12 = v9[2];
    BOOL v13 = (v10 & 1) == 0;
    uint64_t v14 = v12 + v13;
    if (__OFADD__(v12, v13))
    {
LABEL_26:
      __break(1u);
      goto LABEL_27;
    }
    char v15 = v10;
    if (v9[3] < v14)
    {
      sub_25AD0B4DC(v14, a2 & 1);
      unint64_t v16 = sub_25AD0A230(v8, v7);
      if ((v15 & 1) != (v17 & 1))
      {
LABEL_28:
        uint64_t result = (void *)sub_25AD14B20();
        __break(1u);
        return result;
      }
      unint64_t v11 = v16;
      uint64_t v18 = (void *)*a3;
      if ((v15 & 1) == 0) {
        goto LABEL_12;
      }
LABEL_9:
      swift_bridgeObjectRelease();
      *(void *)(v18[7] + 8 * v11) = v41;
      uint64_t v19 = v3 - 1;
      if (v3 == 1) {
        return (void *)swift_bridgeObjectRelease();
      }
LABEL_16:
      for (unint64_t i = v6 + 9; ; i += 3)
      {
        uint64_t v26 = *(i - 2);
        uint64_t v25 = *(i - 1);
        uint64_t v27 = *i;
        uint64_t v28 = (void *)*a3;
        swift_bridgeObjectRetain();
        unint64_t v30 = sub_25AD0A230(v26, v25);
        uint64_t v31 = v28[2];
        BOOL v32 = (v29 & 1) == 0;
        uint64_t v33 = v31 + v32;
        if (__OFADD__(v31, v32)) {
          break;
        }
        char v34 = v29;
        if (v28[3] < v33)
        {
          sub_25AD0B4DC(v33, 1);
          unint64_t v35 = sub_25AD0A230(v26, v25);
          if ((v34 & 1) != (v36 & 1)) {
            goto LABEL_28;
          }
          unint64_t v30 = v35;
        }
        long long v37 = (void *)*a3;
        if (v34)
        {
          swift_bridgeObjectRelease();
          *(void *)(v37[7] + 8 * v30) = v27;
        }
        else
        {
          v37[(v30 >> 6) + 8] |= 1 << v30;
          long long v38 = (uint64_t *)(v37[6] + 16 * v30);
          *long long v38 = v26;
          v38[1] = v25;
          *(void *)(v37[7] + 8 * v30) = v27;
          uint64_t v39 = v37[2];
          BOOL v22 = __OFADD__(v39, 1);
          uint64_t v40 = v39 + 1;
          if (v22) {
            goto LABEL_27;
          }
          v37[2] = v40;
        }
        if (!--v19) {
          return (void *)swift_bridgeObjectRelease();
        }
      }
      goto LABEL_26;
    }
    if (a2)
    {
      uint64_t v18 = (void *)*a3;
      if (v10) {
        goto LABEL_9;
      }
    }
    else
    {
      sub_25AD0AE44();
      uint64_t v18 = (void *)*a3;
      if (v15) {
        goto LABEL_9;
      }
    }
LABEL_12:
    v18[(v11 >> 6) + 8] |= 1 << v11;
    unint64_t v20 = (uint64_t *)(v18[6] + 16 * v11);
    *unint64_t v20 = v8;
    v20[1] = v7;
    *(void *)(v18[7] + 8 * v11) = v41;
    uint64_t v21 = v18[2];
    BOOL v22 = __OFADD__(v21, 1);
    uint64_t v23 = v21 + 1;
    if (v22)
    {
LABEL_27:
      __break(1u);
      goto LABEL_28;
    }
    v18[2] = v23;
    uint64_t v19 = v3 - 1;
    if (v3 == 1) {
      return (void *)swift_bridgeObjectRelease();
    }
    goto LABEL_16;
  }
  return result;
}

uint64_t sub_25ACF4B38@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, int64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t *a6@<X8>)
{
  swift_retain();
  BOOL v13 = (void *)sub_25ACF4578(a4, a5);
  swift_bridgeObjectRelease();
  swift_release();
  if (v6) {
    return swift_release();
  }
  uint64_t v14 = sub_25ACF1604(v13, a3, a1, 0);
  if (*(void *)(v14 + 16))
  {
    uint64_t v31 = a1;
    uint64_t v16 = *(void *)(v14 + 32);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    uint64_t v17 = sub_25ACF2440(v16);
    swift_bridgeObjectRelease();
    uint64_t v18 = *(void *)(v17 + 16);
    uint64_t v32 = v17;
    if (v18)
    {
      uint64_t v28 = a2;
      char v29 = a6;
      int64_t v30 = a3;
      swift_bridgeObjectRetain_n();
      uint64_t v19 = (uint64_t *)(v17 + 48);
      unint64_t v20 = (void *)MEMORY[0x263F8EE78];
      do
      {
        uint64_t v22 = *(v19 - 1);
        if (v22)
        {
          uint64_t v23 = *(v19 - 2);
          uint64_t v24 = *v19;
          swift_bridgeObjectRetain();
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            unint64_t v20 = sub_25ACFFA98(0, v20[2] + 1, 1, v20);
          }
          unint64_t v26 = v20[2];
          unint64_t v25 = v20[3];
          if (v26 >= v25 >> 1) {
            unint64_t v20 = sub_25ACFFA98((void *)(v25 > 1), v26 + 1, 1, v20);
          }
          v20[2] = v26 + 1;
          uint64_t v21 = &v20[3 * v26];
          v21[4] = v23;
          v21[5] = v22;
          v21[6] = v24;
        }
        v19 += 4;
        --v18;
      }
      while (v18);
      swift_bridgeObjectRelease_n();
      a6 = v29;
      a3 = v30;
      a2 = v28;
      if (v20[2]) {
        goto LABEL_15;
      }
    }
    else
    {
      unint64_t v20 = (void *)MEMORY[0x263F8EE78];
      if (*(void *)(MEMORY[0x263F8EE78] + 16))
      {
LABEL_15:
        __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B34D0);
        uint64_t v27 = sub_25AD14970();
LABEL_18:
        uint64_t v33 = v27;
        sub_25ACF48B4(v20, 1, &v33);
        swift_release();
        uint64_t result = swift_bridgeObjectRelease();
        *a6 = v33;
        a6[1] = v31;
        a6[2] = a2;
        a6[3] = a3;
        a6[4] = v32;
        return result;
      }
    }
    uint64_t v27 = MEMORY[0x263F8EE80];
    goto LABEL_18;
  }
  swift_bridgeObjectRelease();
  __break(1u);
  swift_bridgeObjectRelease();
  uint64_t result = swift_release();
  __break(1u);
  return result;
}

uint64_t sub_25ACF4DB8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = a1 - a2;
  if (__OFSUB__(a1, a2))
  {
LABEL_17:
    __break(1u);
  }
  else if ((v3 & 0x8000000000000000) == 0)
  {
    if (v3)
    {
      uint64_t v5 = sub_25AD146C0();
      *(void *)(v5 + 16) = v3;
      bzero((void *)(v5 + 32), 8 * v3);
      uint64_t v6 = *(void *)(a3 + 16);
      if (!v6) {
        return 3;
      }
    }
    else
    {
      uint64_t v5 = MEMORY[0x263F8EE78];
      uint64_t v6 = *(void *)(a3 + 16);
      if (!v6) {
        return 3;
      }
    }
    swift_bridgeObjectRetain();
    uint64_t v7 = (uint64_t *)(a3 + 56);
    while (1)
    {
      if (*(v7 - 2))
      {
        unint64_t v8 = *(v7 - 1);
        uint64_t v9 = *v7;
        swift_bridgeObjectRetain();
        if ((v8 & 0x8000000000000000) != 0)
        {
          __break(1u);
          goto LABEL_17;
        }
        if (v8 >= *(void *)(v5 + 16))
        {
          __break(1u);
LABEL_14:
          swift_bridgeObjectRelease();
          return 3;
        }
        *(void *)(v5 + 32 + 8 * v8) = v9;
        swift_bridgeObjectRelease();
      }
      v7 += 4;
      if (!--v6) {
        goto LABEL_14;
      }
    }
  }
  uint64_t result = sub_25AD14920();
  __break(1u);
  return result;
}

unint64_t sub_25ACF4EF8()
{
  unint64_t result = qword_26A4B3448;
  if (!qword_26A4B3448)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4B3448);
  }
  return result;
}

unint64_t sub_25ACF4F4C()
{
  unint64_t result = qword_26A4B3460;
  if (!qword_26A4B3460)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4B3460);
  }
  return result;
}

uint64_t sub_25ACF4FA0()
{
  return sub_25ACF4FDC(&qword_26A4B3478, &qword_26A4B3480, (void (*)(void))sub_25ACF5048);
}

uint64_t sub_25ACF4FDC(unint64_t *a1, uint64_t *a2, void (*a3)(void))
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

unint64_t sub_25ACF5048()
{
  unint64_t result = qword_26A4B3488;
  if (!qword_26A4B3488)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4B3488);
  }
  return result;
}

uint64_t sub_25ACF509C(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 1701667182 && a2 == 0xE400000000000000;
  if (v2 || (sub_25AD14AF0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x7265746E756F63 && a2 == 0xE700000000000000 || (sub_25AD14AF0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x726F7463656C6573 && a2 == 0xE800000000000000)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    char v6 = sub_25AD14AF0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 2;
    }
    else {
      return 3;
    }
  }
}

uint64_t sub_25ACF51E4(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B34C8);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  char v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25ACF5E70();
  sub_25AD14BA0();
  if (v1)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  else
  {
    char v12 = 0;
    uint64_t v7 = sub_25AD149E0();
    char v11 = 1;
    swift_bridgeObjectRetain();
    sub_25AD149F0();
    char v10 = 2;
    sub_25AD14A20();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    swift_bridgeObjectRelease();
  }
  return v7;
}

uint64_t sub_25ACF5400(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x436F5473656D616ELL && a2 == 0xEF737265746E756FLL;
  if (v2 || (sub_25AD14AF0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6F666E49756D70 && a2 == 0xE700000000000000 || (sub_25AD14AF0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x746553746E657665 && a2 == 0xED000073676E6974)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    char v6 = sub_25AD14AF0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 2;
    }
    else {
      return 3;
    }
  }
}

uint64_t sub_25ACF55A0@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B3510);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  unint64_t v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25ACF4EF8();
  sub_25AD14BA0();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B3450);
  char v20 = 0;
  sub_25ACF5F6C(&qword_26A4B3518);
  sub_25AD14A00();
  uint64_t v9 = v17;
  char v20 = 1;
  sub_25ACF5FD4();
  swift_bridgeObjectRetain();
  sub_25AD14A00();
  uint64_t v15 = v18;
  uint64_t v16 = v17;
  uint64_t v14 = v19;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B3468);
  char v20 = 2;
  sub_25ACF4FDC(&qword_26A4B3528, &qword_26A4B3468, (void (*)(void))sub_25ACF6028);
  sub_25AD14A00();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  uint64_t v10 = v17;
  swift_bridgeObjectRetain();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  swift_bridgeObjectRelease();
  uint64_t result = swift_bridgeObjectRelease();
  uint64_t v12 = v16;
  *a2 = v9;
  a2[1] = v12;
  uint64_t v13 = v14;
  a2[2] = v15;
  a2[3] = v13;
  a2[4] = v10;
  return result;
}

uint64_t destroy for KPCSettings()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t _s7Recount11KPCSettingsVwCP_0(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  uint64_t v3 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for KPCSettings(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for KPCSettings(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for KPCSettings(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 24)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for KPCSettings(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)uint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 24) = 1;
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
    *(unsigned char *)(result + 24) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for KPCSettings()
{
  return &type metadata for KPCSettings;
}

uint64_t destroy for Settings()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for Settings(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  uint64_t v3 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for Settings(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  a1[2] = a2[2];
  a1[3] = a2[3];
  a1[4] = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for Settings(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  uint64_t v4 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v4;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for Settings(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 40)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for Settings(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(void *)uint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 40) = 1;
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
    *(unsigned char *)(result + 40) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for Settings()
{
  return &type metadata for Settings;
}

ValueMetadata *type metadata accessor for EventSetting()
{
  return &type metadata for EventSetting;
}

ValueMetadata *type metadata accessor for Settings.CodingKeys()
{
  return &type metadata for Settings.CodingKeys;
}

unint64_t sub_25ACF5C94()
{
  unint64_t result = qword_26A4B3490;
  if (!qword_26A4B3490)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4B3490);
  }
  return result;
}

unint64_t sub_25ACF5CE8(uint64_t a1)
{
  *(void *)(a1 + 8) = sub_25ACF5D18();
  unint64_t result = sub_25ACF5D6C();
  *(void *)(a1 + 16) = result;
  return result;
}

unint64_t sub_25ACF5D18()
{
  unint64_t result = qword_26A4B3498;
  if (!qword_26A4B3498)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4B3498);
  }
  return result;
}

unint64_t sub_25ACF5D6C()
{
  unint64_t result = qword_26A4B34A0;
  if (!qword_26A4B34A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4B34A0);
  }
  return result;
}

unint64_t sub_25ACF5DC4()
{
  unint64_t result = qword_26A4B34A8;
  if (!qword_26A4B34A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4B34A8);
  }
  return result;
}

unint64_t sub_25ACF5E1C()
{
  unint64_t result = qword_26A4B34B0;
  if (!qword_26A4B34B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4B34B0);
  }
  return result;
}

unint64_t sub_25ACF5E70()
{
  unint64_t result = qword_26A4B34C0;
  if (!qword_26A4B34C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4B34C0);
  }
  return result;
}

unint64_t sub_25ACF5EC4()
{
  unint64_t result = qword_26A4B34E8;
  if (!qword_26A4B34E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4B34E8);
  }
  return result;
}

unint64_t sub_25ACF5F18()
{
  unint64_t result = qword_26A4B3508;
  if (!qword_26A4B3508)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4B3508);
  }
  return result;
}

uint64_t sub_25ACF5F6C(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A4B3450);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_25ACF5FD4()
{
  unint64_t result = qword_26A4B3520;
  if (!qword_26A4B3520)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4B3520);
  }
  return result;
}

uint64_t sub_25ACF6028()
{
  return sub_25ACF4FDC(&qword_26A4B3530, &qword_26A4B3480, (void (*)(void))sub_25ACF6064);
}

unint64_t sub_25ACF6064()
{
  unint64_t result = qword_26A4B3538;
  if (!qword_26A4B3538)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4B3538);
  }
  return result;
}

uint64_t sub_25ACF60B8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B3548);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void *initializeBufferWithCopyOfBuffer for Settings.EventError(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for Settings.EventError(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

void *assignWithTake for Settings.EventError(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for Settings.EventError(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for Settings.EventError(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for Settings.EventError()
{
  return &type metadata for Settings.EventError;
}

unsigned char *_s7Recount8SettingsV10CodingKeysOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x25ACF6328);
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

ValueMetadata *type metadata accessor for EventSetting.CodingKeys()
{
  return &type metadata for EventSetting.CodingKeys;
}

unint64_t sub_25ACF6364()
{
  unint64_t result = qword_26A4B3558;
  if (!qword_26A4B3558)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4B3558);
  }
  return result;
}

unint64_t sub_25ACF63C0()
{
  unint64_t result = qword_26A4B3560;
  if (!qword_26A4B3560)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4B3560);
  }
  return result;
}

unint64_t sub_25ACF6418()
{
  unint64_t result = qword_26A4B3568;
  if (!qword_26A4B3568)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4B3568);
  }
  return result;
}

void *sub_25ACF6480(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for PlacementError(void *a1, void *a2)
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

uint64_t assignWithTake for PlacementError(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_bridgeObjectRelease();
  return a1;
}

ValueMetadata *type metadata accessor for PlacementError()
{
  return &type metadata for PlacementError;
}

BOOL static CPUKind.__derived_enum_equals(_:_:)(char a1, char a2)
{
  return a1 == a2;
}

uint64_t CPUKind.hash(into:)()
{
  return sub_25AD14B80();
}

uint64_t sub_25ACF65B8()
{
  uint64_t v1 = 0x6E65696369666665;
  if (*v0 != 1) {
    uint64_t v1 = 0x616D726F66726570;
  }
  if (*v0) {
    return v1;
  }
  else {
    return 0x647261646E617473;
  }
}

uint64_t sub_25ACF6620@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_25ACF6DC8(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_25ACF6648(uint64_t a1)
{
  unint64_t v2 = sub_25ACF6BD0();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25ACF6684(uint64_t a1)
{
  unint64_t v2 = sub_25ACF6BD0();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_25ACF66C0()
{
  return 0;
}

uint64_t sub_25ACF66CC(uint64_t a1)
{
  unint64_t v2 = sub_25ACF6C78();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25ACF6708(uint64_t a1)
{
  unint64_t v2 = sub_25ACF6C78();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_25ACF6744(uint64_t a1)
{
  unint64_t v2 = sub_25ACF6C24();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25ACF6780(uint64_t a1)
{
  unint64_t v2 = sub_25ACF6C24();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_25ACF67BC@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = 1;
  return result;
}

uint64_t sub_25ACF67EC(uint64_t a1)
{
  unint64_t v2 = sub_25ACF6CCC();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25ACF6828(uint64_t a1)
{
  unint64_t v2 = sub_25ACF6CCC();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t CPUKind.encode(to:)(void *a1, int a2)
{
  int v24 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B3570);
  uint64_t v22 = *(void *)(v3 - 8);
  uint64_t v23 = v3;
  MEMORY[0x270FA5388](v3);
  uint64_t v21 = (char *)&v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B3578);
  uint64_t v19 = *(void *)(v5 - 8);
  uint64_t v20 = v5;
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B3580);
  uint64_t v18 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B3588);
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)&v17 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25ACF6BD0();
  sub_25AD14BB0();
  if ((_BYTE)v24)
  {
    if (v24 == 1)
    {
      char v26 = 1;
      sub_25ACF6C78();
      sub_25AD14A40();
      (*(void (**)(char *, uint64_t))(v19 + 8))(v7, v20);
    }
    else
    {
      char v27 = 2;
      sub_25ACF6C24();
      uint64_t v15 = v21;
      sub_25AD14A40();
      (*(void (**)(char *, uint64_t))(v22 + 8))(v15, v23);
    }
  }
  else
  {
    char v25 = 0;
    sub_25ACF6CCC();
    sub_25AD14A40();
    (*(void (**)(char *, uint64_t))(v18 + 8))(v10, v8);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v14, v11);
}

unint64_t sub_25ACF6BD0()
{
  unint64_t result = qword_26A4B3590;
  if (!qword_26A4B3590)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4B3590);
  }
  return result;
}

unint64_t sub_25ACF6C24()
{
  unint64_t result = qword_26A4B3598;
  if (!qword_26A4B3598)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4B3598);
  }
  return result;
}

unint64_t sub_25ACF6C78()
{
  unint64_t result = qword_26A4B35A0;
  if (!qword_26A4B35A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4B35A0);
  }
  return result;
}

unint64_t sub_25ACF6CCC()
{
  unint64_t result = qword_26A4B35A8;
  if (!qword_26A4B35A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4B35A8);
  }
  return result;
}

uint64_t CPUKind.hashValue.getter()
{
  return sub_25AD14B90();
}

void *CPUKind.init(from:)(void *a1)
{
  return sub_25ACF6F44(a1);
}

void *sub_25ACF6D80@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  unint64_t result = sub_25ACF6F44(a1);
  if (!v2) {
    *a2 = (_BYTE)result;
  }
  return result;
}

uint64_t sub_25ACF6DAC(void *a1)
{
  return CPUKind.encode(to:)(a1, *v1);
}

uint64_t sub_25ACF6DC8(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x647261646E617473 && a2 == 0xE800000000000000;
  if (v2 || (sub_25AD14AF0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6E65696369666665 && a2 == 0xEA00000000007963 || (sub_25AD14AF0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x616D726F66726570 && a2 == 0xEB0000000065636ELL)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    char v6 = sub_25AD14AF0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 2;
    }
    else {
      return 3;
    }
  }
}

void *sub_25ACF6F44(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B3600);
  uint64_t v25 = *(void *)(v2 - 8);
  uint64_t v26 = v2;
  MEMORY[0x270FA5388](v2);
  char v29 = (char *)&v21 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B3608);
  uint64_t v24 = *(void *)(v27 - 8);
  MEMORY[0x270FA5388](v27);
  uint64_t v5 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B3610);
  uint64_t v23 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)&v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B3618);
  uint64_t v28 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = (uint64_t *)((char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25ACF6BD0();
  uint64_t v12 = (uint64_t)v30;
  sub_25AD14BA0();
  if (v12) {
    goto LABEL_7;
  }
  uint64_t v22 = v6;
  uint64_t v13 = v29;
  int64_t v30 = a1;
  uint64_t v14 = v11;
  uint64_t v15 = sub_25AD14A30();
  if (*(void *)(v15 + 16) != 1)
  {
    uint64_t v17 = sub_25AD148A0();
    swift_allocError();
    uint64_t v11 = v18;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B3620);
    *uint64_t v11 = &type metadata for CPUKind;
    sub_25AD149B0();
    sub_25AD14890();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v17 - 8) + 104))(v11, *MEMORY[0x263F8DCB0], v17);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(void *, uint64_t))(v28 + 8))(v14, v9);
    a1 = v30;
LABEL_7:
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    return v11;
  }
  uint64_t v11 = (void *)*(unsigned __int8 *)(v15 + 32);
  if (*(unsigned char *)(v15 + 32))
  {
    if (v11 == 1)
    {
      char v32 = 1;
      sub_25ACF6C78();
      sub_25AD149A0();
      uint64_t v16 = v28;
      (*(void (**)(char *, uint64_t))(v24 + 8))(v5, v27);
      swift_bridgeObjectRelease();
      (*(void (**)(void *, uint64_t))(v16 + 8))(v14, v9);
    }
    else
    {
      char v33 = 2;
      sub_25ACF6C24();
      sub_25AD149A0();
      uint64_t v20 = v28;
      (*(void (**)(char *, uint64_t))(v25 + 8))(v13, v26);
      swift_bridgeObjectRelease();
      (*(void (**)(void *, uint64_t))(v20 + 8))(v14, v9);
    }
  }
  else
  {
    char v31 = 0;
    sub_25ACF6CCC();
    sub_25AD149A0();
    (*(void (**)(char *, uint64_t))(v23 + 8))(v8, v22);
    swift_bridgeObjectRelease();
    (*(void (**)(void *, uint64_t))(v28 + 8))(v14, v9);
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v30);
  return v11;
}

unint64_t sub_25ACF74B8()
{
  unint64_t result = qword_26A4B35B0;
  if (!qword_26A4B35B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4B35B0);
  }
  return result;
}

ValueMetadata *type metadata accessor for CPUKind()
{
  return &type metadata for CPUKind;
}

unsigned char *_s7Recount7CPUKindOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x25ACF75ECLL);
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

ValueMetadata *type metadata accessor for CPUKind.CodingKeys()
{
  return &type metadata for CPUKind.CodingKeys;
}

ValueMetadata *type metadata accessor for CPUKind.StandardCodingKeys()
{
  return &type metadata for CPUKind.StandardCodingKeys;
}

ValueMetadata *type metadata accessor for CPUKind.EfficiencyCodingKeys()
{
  return &type metadata for CPUKind.EfficiencyCodingKeys;
}

ValueMetadata *type metadata accessor for CPUKind.PerformanceCodingKeys()
{
  return &type metadata for CPUKind.PerformanceCodingKeys;
}

unint64_t sub_25ACF7658()
{
  unint64_t result = qword_26A4B35B8;
  if (!qword_26A4B35B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4B35B8);
  }
  return result;
}

unint64_t sub_25ACF76B0()
{
  unint64_t result = qword_26A4B35C0;
  if (!qword_26A4B35C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4B35C0);
  }
  return result;
}

unint64_t sub_25ACF7708()
{
  unint64_t result = qword_26A4B35C8;
  if (!qword_26A4B35C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4B35C8);
  }
  return result;
}

unint64_t sub_25ACF7760()
{
  unint64_t result = qword_26A4B35D0;
  if (!qword_26A4B35D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4B35D0);
  }
  return result;
}

unint64_t sub_25ACF77B8()
{
  unint64_t result = qword_26A4B35D8;
  if (!qword_26A4B35D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4B35D8);
  }
  return result;
}

unint64_t sub_25ACF7810()
{
  unint64_t result = qword_26A4B35E0;
  if (!qword_26A4B35E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4B35E0);
  }
  return result;
}

unint64_t sub_25ACF7868()
{
  unint64_t result = qword_26A4B35E8;
  if (!qword_26A4B35E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4B35E8);
  }
  return result;
}

unint64_t sub_25ACF78C0()
{
  unint64_t result = qword_26A4B35F0;
  if (!qword_26A4B35F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4B35F0);
  }
  return result;
}

unint64_t sub_25ACF7918()
{
  unint64_t result = qword_26A4B35F8;
  if (!qword_26A4B35F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4B35F8);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for PMUInfo(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 24)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for PMUInfo(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)unint64_t result = (a2 - 1);
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

ValueMetadata *type metadata accessor for PMUInfo()
{
  return &type metadata for PMUInfo;
}

uint64_t sub_25ACF79CC(void *a1, uint64_t a2, uint64_t a3)
{
  v10[1] = a3;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B3628);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25ACF7CB8();
  sub_25AD14BB0();
  char v13 = 0;
  sub_25AD14A90();
  if (!v3)
  {
    char v12 = 1;
    sub_25AD14A90();
    char v11 = 2;
    sub_25AD14A90();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t sub_25ACF7B64()
{
  int v1 = *v0;
  unint64_t v2 = 0xD000000000000011;
  if (v1 != 1) {
    unint64_t v2 = 0xD000000000000012;
  }
  if (*v0) {
    return v2;
  }
  else {
    return 0x437265746E756F63;
  }
}

uint64_t sub_25ACF7BC8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_25ACF7D0C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_25ACF7BF0(uint64_t a1)
{
  unint64_t v2 = sub_25ACF7CB8();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25ACF7C2C(uint64_t a1)
{
  unint64_t v2 = sub_25ACF7CB8();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_25ACF7C68@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = sub_25ACF7E70(a1);
  if (!v2)
  {
    *a2 = result;
    a2[1] = v5;
    a2[2] = v6;
  }
  return result;
}

uint64_t sub_25ACF7C98(void *a1)
{
  return sub_25ACF79CC(a1, *v1, v1[1]);
}

unint64_t sub_25ACF7CB8()
{
  unint64_t result = qword_26A4B3630;
  if (!qword_26A4B3630)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4B3630);
  }
  return result;
}

uint64_t sub_25ACF7D0C(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x437265746E756F63 && a2 == 0xEC000000746E756FLL;
  if (v2 || (sub_25AD14AF0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x800000025AD19050 || (sub_25AD14AF0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD000000000000012 && a2 == 0x800000025AD19070)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    char v6 = sub_25AD14AF0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 2;
    }
    else {
      return 3;
    }
  }
}

uint64_t sub_25ACF7E70(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B3638);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = &v8[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25ACF7CB8();
  sub_25AD14BA0();
  v8[15] = 0;
  uint64_t v6 = sub_25AD149F0();
  v8[14] = 1;
  sub_25AD149F0();
  v8[13] = 2;
  sub_25AD149F0();
  (*(void (**)(unsigned char *, uint64_t))(v3 + 8))(v5, v2);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return v6;
}

unsigned char *storeEnumTagSinglePayload for PMUInfo.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x25ACF8108);
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

ValueMetadata *type metadata accessor for PMUInfo.CodingKeys()
{
  return &type metadata for PMUInfo.CodingKeys;
}

unint64_t sub_25ACF8144()
{
  unint64_t result = qword_26A4B3640;
  if (!qword_26A4B3640)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4B3640);
  }
  return result;
}

unint64_t sub_25ACF819C()
{
  unint64_t result = qword_26A4B3648;
  if (!qword_26A4B3648)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4B3648);
  }
  return result;
}

unint64_t sub_25ACF81F4()
{
  unint64_t result = qword_26A4B3650;
  if (!qword_26A4B3650)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4B3650);
  }
  return result;
}

uint64_t Metric.name.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t Metric.displayName.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t Metric.displayDescription.getter()
{
  uint64_t v1 = *(void *)(v0 + 32);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t Metric.displayColor.getter()
{
  uint64_t v1 = *(void *)(v0 + 48);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t Metric.displayOrder.getter()
{
  return *(void *)(v0 + 64);
}

uint64_t Metric.displayDocumentation.getter()
{
  uint64_t v1 = *(void *)(v0 + 72);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t Metric.displayCommentary.getter()
{
  uint64_t v1 = *(void *)(v0 + 88);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t Metric.expression.getter()
{
  uint64_t v1 = *(void *)(v0 + 104);
  swift_bridgeObjectRetain();
  return v1;
}

unint64_t sub_25ACF83A0(char a1)
{
  unint64_t result = 1701667182;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x4E79616C70736964;
      break;
    case 2:
      unint64_t result = 0xD000000000000012;
      break;
    case 3:
      unint64_t result = 0x4379616C70736964;
      break;
    case 4:
      unint64_t result = 0x4F79616C70736964;
      break;
    case 5:
      unint64_t result = 0xD000000000000014;
      break;
    case 6:
      unint64_t result = 0xD000000000000011;
      break;
    case 7:
      unint64_t result = 0x6973736572707865;
      break;
    default:
      return result;
  }
  return result;
}

unint64_t sub_25ACF84C4()
{
  return sub_25ACF83A0(*v0);
}

uint64_t sub_25ACF84CC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_25ACF8904(a1, a2);
  *a3 = result;
  return result;
}

void sub_25ACF84F4(unsigned char *a1@<X8>)
{
  *a1 = 8;
}

uint64_t sub_25ACF8500(uint64_t a1)
{
  unint64_t v2 = sub_25ACF87C8();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25ACF853C(uint64_t a1)
{
  unint64_t v2 = sub_25ACF87C8();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t Metric.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B3658);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  unsigned int v6 = &v8[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25ACF87C8();
  sub_25AD14BB0();
  v8[15] = 0;
  sub_25AD14A60();
  if (!v1)
  {
    v8[14] = 1;
    sub_25AD14A60();
    v8[13] = 2;
    sub_25AD14A60();
    v8[12] = 3;
    sub_25AD14A60();
    v8[11] = 4;
    sub_25AD14A90();
    v8[10] = 5;
    sub_25AD14A60();
    v8[9] = 6;
    sub_25AD14A50();
    v8[8] = 7;
    sub_25AD14A60();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v4 + 8))(v6, v3);
}

unint64_t sub_25ACF87C8()
{
  unint64_t result = qword_26A4B3660;
  if (!qword_26A4B3660)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4B3660);
  }
  return result;
}

double Metric.init(from:)@<D0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  sub_25ACF8C7C(a1, (uint64_t *)v8);
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

double sub_25ACF8884@<D0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  sub_25ACF8C7C(a1, (uint64_t *)v8);
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

uint64_t sub_25ACF88EC(void *a1)
{
  return Metric.encode(to:)(a1);
}

uint64_t sub_25ACF8904(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 1701667182 && a2 == 0xE400000000000000;
  if (v2 || (sub_25AD14AF0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x4E79616C70736964 && a2 == 0xEB00000000656D61 || (sub_25AD14AF0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD000000000000012 && a2 == 0x800000025AD18470 || (sub_25AD14AF0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x4379616C70736964 && a2 == 0xEC000000726F6C6FLL || (sub_25AD14AF0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x4F79616C70736964 && a2 == 0xEC00000072656472 || (sub_25AD14AF0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0xD000000000000014 && a2 == 0x800000025AD18E10 || (sub_25AD14AF0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x800000025AD18E30 || (sub_25AD14AF0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else if (a1 == 0x6973736572707865 && a2 == 0xEA00000000006E6FLL)
  {
    swift_bridgeObjectRelease();
    return 7;
  }
  else
  {
    char v6 = sub_25AD14AF0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 7;
    }
    else {
      return 8;
    }
  }
}

uint64_t sub_25ACF8C7C@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B3680);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v34 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25ACF87C8();
  sub_25AD14BA0();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  char v53 = 0;
  uint64_t v9 = sub_25AD149E0();
  uint64_t v11 = v10;
  char v52 = 1;
  swift_bridgeObjectRetain();
  uint64_t v43 = sub_25AD149E0();
  uint64_t v44 = v9;
  char v51 = 2;
  uint64_t v13 = v12;
  swift_bridgeObjectRetain();
  uint64_t v14 = sub_25AD149E0();
  uint64_t v45 = v13;
  uint64_t v42 = v14;
  char v50 = 3;
  uint64_t v16 = v15;
  swift_bridgeObjectRetain();
  uint64_t v40 = sub_25AD149E0();
  uint64_t v41 = v16;
  char v49 = 4;
  uint64_t v18 = v17;
  swift_bridgeObjectRetain();
  uint64_t v38 = sub_25AD149F0();
  char v48 = 5;
  uint64_t v37 = sub_25AD149E0();
  char v47 = 6;
  uint64_t v39 = v19;
  swift_bridgeObjectRetain();
  uint64_t v35 = sub_25AD149C0();
  uint64_t v36 = v20;
  char v46 = 7;
  swift_bridgeObjectRetain();
  uint64_t v21 = sub_25AD149E0();
  uint64_t v23 = v22;
  uint64_t v24 = *(void (**)(char *, uint64_t))(v6 + 8);
  uint64_t v34 = v21;
  v24(v8, v5);
  swift_bridgeObjectRetain();
  uint64_t v25 = v45;
  swift_bridgeObjectRetain();
  uint64_t v26 = v41;
  swift_bridgeObjectRetain();
  uint64_t v27 = v18;
  swift_bridgeObjectRetain();
  uint64_t v28 = v39;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  swift_bridgeObjectRelease();
  uint64_t v29 = v36;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t result = swift_bridgeObjectRelease();
  *a2 = v44;
  a2[1] = v11;
  a2[2] = v43;
  a2[3] = v25;
  a2[4] = v42;
  a2[5] = v26;
  a2[6] = v40;
  a2[7] = v27;
  uint64_t v31 = v37;
  a2[8] = v38;
  a2[9] = v31;
  uint64_t v32 = v35;
  a2[10] = v28;
  a2[11] = v32;
  uint64_t v33 = v34;
  a2[12] = v29;
  a2[13] = v33;
  a2[14] = v23;
  return result;
}

uint64_t destroy for Metric()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for Metric(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  uint64_t v5 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v5;
  uint64_t v6 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v6;
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  uint64_t v7 = *(void *)(a2 + 88);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = v7;
  uint64_t v8 = *(void *)(a2 + 104);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(void *)(a1 + 104) = v8;
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for Metric(void *a1, void *a2)
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
  a1[8] = a2[8];
  a1[9] = a2[9];
  a1[10] = a2[10];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[11] = a2[11];
  a1[12] = a2[12];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[13] = a2[13];
  a1[14] = a2[14];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy120_8(uint64_t a1, long long *a2)
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

uint64_t assignWithTake for Metric(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v7;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  swift_bridgeObjectRelease();
  uint64_t v8 = *(void *)(a2 + 96);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  *(void *)(a1 + 96) = v8;
  swift_bridgeObjectRelease();
  uint64_t v9 = *(void *)(a2 + 112);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  *(void *)(a1 + 112) = v9;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for Metric(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 120)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for Metric(uint64_t result, int a2, int a3)
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
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 120) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for Metric()
{
  return &type metadata for Metric;
}

uint64_t getEnumTagSinglePayload for Metric.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for Metric.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x25ACF9758);
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

ValueMetadata *type metadata accessor for Metric.CodingKeys()
{
  return &type metadata for Metric.CodingKeys;
}

unint64_t sub_25ACF9794()
{
  unint64_t result = qword_26A4B3668;
  if (!qword_26A4B3668)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4B3668);
  }
  return result;
}

unint64_t sub_25ACF97EC()
{
  unint64_t result = qword_26A4B3670;
  if (!qword_26A4B3670)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4B3670);
  }
  return result;
}

unint64_t sub_25ACF9844()
{
  unint64_t result = qword_26A4B3678;
  if (!qword_26A4B3678)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4B3678);
  }
  return result;
}

__n128 Silicon.init()@<Q0>(uint64_t a1@<X8>)
{
  sub_25ACFA070((uint64_t)v5);
  if (!v1)
  {
    long long v4 = v5[3];
    *(_OWORD *)(a1 + 32) = v5[2];
    *(_OWORD *)(a1 + 48) = v4;
    *(_OWORD *)(a1 + 64) = v5[4];
    __n128 result = (__n128)v5[1];
    *(_OWORD *)a1 = v5[0];
    *(__n128 *)(a1 + 16) = result;
  }
  return result;
}

uint64_t Silicon.marketingName.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t Silicon.platform.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

char *sub_25ACF9944(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if ((a3 & 0x100000000) == 0)
  {
    sub_25AD14860();
    swift_bridgeObjectRelease();
    unint64_t v5 = 0xD00000000000001DLL;
    sub_25AD145A0();
    return (char *)v5;
  }
  int v3 = a3;
  sub_25AD14860();
  swift_bridgeObjectRelease();
  unint64_t v5 = 0xD000000000000010;
  sub_25AD145A0();
  sub_25AD145A0();
  __n128 result = strerror(v3);
  if (result)
  {
    sub_25AD145B0();
    sub_25AD145A0();
    swift_bridgeObjectRelease();
    return (char *)v5;
  }
  __break(1u);
  return result;
}

char *sub_25ACF9A68()
{
  return sub_25ACF9944(*(void *)v0, *(void *)(v0 + 8), *(unsigned int *)(v0 + 16) | ((unint64_t)*(unsigned __int8 *)(v0 + 20) << 32));
}

uint64_t sub_25ACF9A8C()
{
  v8[1] = *MEMORY[0x263EF8340];
  v8[0] = 4;
  unsigned int v7 = 0;
  sub_25AD145A0();
  uint64_t v0 = sub_25AD14540();
  int v1 = sysctlbyname((const char *)(v0 + 32), &v7, v8, 0, 0);
  uint64_t v2 = v7;
  swift_release();
  if (v1 < 0)
  {
    uint64_t v3 = swift_bridgeObjectRetain();
    int v4 = MEMORY[0x261154780](v3);
    sub_25ACFAE70();
    swift_allocError();
    *(void *)uint64_t v5 = 0x206C7463737973;
    *(void *)(v5 + 8) = 0xE700000000000000;
    *(_DWORD *)(v5 + 16) = v4;
    *(unsigned char *)(v5 + 20) = 1;
    swift_willThrow();
  }
  swift_bridgeObjectRelease();
  return v2;
}

uint64_t sub_25ACF9BBC()
{
  uint64_t result = 0x6E6974656B72616DLL;
  switch(*v0)
  {
    case 1:
      uint64_t result = 0x6D726F6674616C70;
      break;
    case 2:
      uint64_t result = 0x65707954757063;
      break;
    case 3:
      uint64_t result = 0x7974627553757063;
      break;
    case 4:
      uint64_t result = 0x6C696D6146757063;
      break;
    case 5:
      uint64_t result = 1970106467;
      break;
    case 6:
      uint64_t result = 0x746E6174736E6F63;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_25ACF9CB4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_25ACFA43C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_25ACF9CDC(uint64_t a1)
{
  unint64_t v2 = sub_25ACFA348();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25ACF9D18(uint64_t a1)
{
  unint64_t v2 = sub_25ACFA348();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t Silicon.encode(to:)(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B3688);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  int v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25ACFA348();
  sub_25AD14BB0();
  LOBYTE(v12) = 0;
  sub_25AD14A60();
  if (!v2)
  {
    LOBYTE(v12) = 1;
    sub_25AD14A60();
    LOBYTE(v12) = 2;
    sub_25AD14AB0();
    LOBYTE(v12) = 3;
    sub_25AD14AB0();
    LOBYTE(v12) = 4;
    sub_25AD14AB0();
    long long v12 = *(_OWORD *)(v3 + 48);
    uint64_t v13 = *(void *)(v3 + 64);
    char v11 = 5;
    sub_25ACF4F4C();
    sub_25AD14AA0();
    *(void *)&long long v12 = *(void *)(v3 + 72);
    char v11 = 6;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B3698);
    sub_25ACFA39C();
    sub_25AD14AA0();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

__n128 Silicon.init(from:)@<Q0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  sub_25ACFA754(a1, (uint64_t)v6);
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

__n128 sub_25ACFA00C@<Q0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  sub_25ACFA754(a1, (uint64_t)v6);
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

uint64_t sub_25ACFA058(void *a1)
{
  return Silicon.encode(to:)(a1);
}

void sub_25ACFA070(uint64_t a1@<X8>)
{
  id v3 = (id)MobileGestalt_get_current_device();
  if (!v3 || (id v4 = (id)MobileGestalt_copy_hardwarePlatform_obj()) == 0)
  {
    sub_25ACFAE70();
    swift_allocError();
    *(void *)uint64_t v16 = 0xD000000000000010;
    *(void *)(v16 + 8) = 0x800000025AD19090;
    *(_DWORD *)(v16 + 16) = 0;
    *(unsigned char *)(v16 + 20) = 0;
    swift_willThrow();

    return;
  }
  long long v5 = v4;
  uint64_t v6 = sub_25AD144D0();
  uint64_t v8 = v7;

  swift_bridgeObjectRetain();
  id v9 = (id)MobileGestalt_copy_marketingSOCNameString_obj();
  if (!v9)
  {
    id v9 = (id)MobileGestalt_copy_physicalHardwareNameString_obj();
    if (!v9)
    {
      swift_bridgeObjectRelease();
      sub_25ACFAE70();
      swift_allocError();
      *(void *)uint64_t v17 = 0xD000000000000030;
      *(void *)(v17 + 8) = 0x800000025AD190B0;
      *(_DWORD *)(v17 + 16) = 0;
      *(unsigned char *)(v17 + 20) = 0;
      swift_willThrow();
      goto LABEL_8;
    }
  }
  uint64_t v10 = sub_25AD144D0();
  uint64_t v12 = v11;

  swift_bridgeObjectRetain();
  int v13 = sub_25ACF9A8C();
  if (v1)
  {
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
LABEL_8:

    swift_bridgeObjectRelease();
    return;
  }
  int v14 = v13;
  int v15 = sub_25ACF9A8C();
  int v22 = sub_25ACF9A8C();
  unsigned int counter_count = kpc_get_counter_count();
  unsigned int v18 = kpc_get_counter_count();
  uint64_t v21 = counter_count + v18;
  if (__CFADD__(counter_count, v18))
  {
    __break(1u);
  }
  else
  {
    uint64_t v20 = v18;
    unint64_t v19 = sub_25ACFC3AC(MEMORY[0x263F8EE78]);

    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    *(void *)a1 = v10;
    *(void *)(a1 + 8) = v12;
    *(void *)(a1 + 16) = v6;
    *(void *)(a1 + 24) = v8;
    *(_DWORD *)(a1 + 32) = v14;
    *(_DWORD *)(a1 + 36) = v15;
    *(_DWORD *)(a1 + 40) = v22;
    *(void *)(a1 + 48) = v21;
    *(void *)(a1 + 56) = counter_count;
    *(void *)(a1 + 64) = v20;
    *(void *)(a1 + 72) = v19;
  }
}

unint64_t sub_25ACFA348()
{
  unint64_t result = qword_26A4B3690;
  if (!qword_26A4B3690)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4B3690);
  }
  return result;
}

unint64_t sub_25ACFA39C()
{
  unint64_t result = qword_26A4B36A0;
  if (!qword_26A4B36A0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A4B3698);
    sub_25ACFAE0C(&qword_26A4B36A8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4B36A0);
  }
  return result;
}

uint64_t sub_25ACFA43C(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x6E6974656B72616DLL && a2 == 0xED0000656D614E67;
  if (v2 || (sub_25AD14AF0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6D726F6674616C70 && a2 == 0xE800000000000000 || (sub_25AD14AF0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x65707954757063 && a2 == 0xE700000000000000 || (sub_25AD14AF0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x7974627553757063 && a2 == 0xEA00000000006570 || (sub_25AD14AF0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x6C696D6146757063 && a2 == 0xE900000000000079 || (sub_25AD14AF0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 1970106467 && a2 == 0xE400000000000000 || (sub_25AD14AF0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0x746E6174736E6F63 && a2 == 0xE900000000000073)
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else
  {
    char v6 = sub_25AD14AF0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 6;
    }
    else {
      return 7;
    }
  }
}

uint64_t sub_25ACFA754@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B36D0);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25ACFA348();
  sub_25AD14BA0();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  LOBYTE(v29) = 0;
  uint64_t v9 = sub_25AD149E0();
  uint64_t v11 = v10;
  uint64_t v28 = v9;
  LOBYTE(v29) = 1;
  swift_bridgeObjectRetain();
  uint64_t v12 = sub_25AD149E0();
  uint64_t v14 = v13;
  uint64_t v26 = v12;
  uint64_t v27 = v11;
  LOBYTE(v29) = 2;
  swift_bridgeObjectRetain();
  uint64_t v15 = v14;
  int v16 = sub_25AD14A10();
  LOBYTE(v29) = 3;
  int v32 = sub_25AD14A10();
  LOBYTE(v29) = 4;
  int v25 = sub_25AD14A10();
  char v33 = 5;
  sub_25ACF5FD4();
  sub_25AD14A00();
  uint64_t v23 = v30;
  uint64_t v24 = v29;
  uint64_t v22 = v31;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B3698);
  char v33 = 6;
  sub_25ACFAD6C();
  sub_25AD14A00();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  uint64_t v17 = v29;
  uint64_t v18 = v27;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)a2 = v28;
  *(void *)(a2 + 8) = v18;
  *(void *)(a2 + 16) = v26;
  *(void *)(a2 + 24) = v15;
  int v20 = v32;
  *(_DWORD *)(a2 + 32) = v16;
  *(_DWORD *)(a2 + 36) = v20;
  *(_DWORD *)(a2 + 40) = v25;
  uint64_t v21 = v23;
  *(void *)(a2 + 48) = v24;
  *(void *)(a2 + 56) = v21;
  *(void *)(a2 + 64) = v22;
  *(void *)(a2 + 72) = v17;
  return result;
}

ValueMetadata *type metadata accessor for Silicon()
{
  return &type metadata for Silicon;
}

unsigned char *storeEnumTagSinglePayload for Silicon.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x25ACFAC2CLL);
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

ValueMetadata *type metadata accessor for Silicon.CodingKeys()
{
  return &type metadata for Silicon.CodingKeys;
}

unint64_t sub_25ACFAC68()
{
  unint64_t result = qword_26A4B36B8;
  if (!qword_26A4B36B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4B36B8);
  }
  return result;
}

unint64_t sub_25ACFACC0()
{
  unint64_t result = qword_26A4B36C0;
  if (!qword_26A4B36C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4B36C0);
  }
  return result;
}

unint64_t sub_25ACFAD18()
{
  unint64_t result = qword_26A4B36C8;
  if (!qword_26A4B36C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4B36C8);
  }
  return result;
}

unint64_t sub_25ACFAD6C()
{
  unint64_t result = qword_26A4B36D8;
  if (!qword_26A4B36D8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A4B3698);
    sub_25ACFAE0C(&qword_26A4B36E0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4B36D8);
  }
  return result;
}

uint64_t sub_25ACFAE0C(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A4B36B0);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_25ACFAE70()
{
  unint64_t result = qword_26A4B36E8;
  if (!qword_26A4B36E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4B36E8);
  }
  return result;
}

uint64_t sub_25ACFAEC8()
{
  return swift_bridgeObjectRetain();
}

uint64_t destroy for Silicon.CurrentSiliconError()
{
  return sub_25ACFAEE4();
}

uint64_t sub_25ACFAEE4()
{
  return swift_bridgeObjectRelease();
}

uint64_t _s7Recount7SiliconV19CurrentSiliconErrorOwCP_0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = a2[1];
  int v5 = *((_DWORD *)a2 + 4);
  char v6 = *((unsigned char *)a2 + 20);
  sub_25ACFAEC8();
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(_DWORD *)(a1 + 16) = v5;
  *(unsigned char *)(a1 + 20) = v6;
  return a1;
}

uint64_t assignWithCopy for Silicon.CurrentSiliconError(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = a2[1];
  int v5 = *((_DWORD *)a2 + 4);
  char v6 = *((unsigned char *)a2 + 20);
  sub_25ACFAEC8();
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(_DWORD *)(a1 + 16) = v5;
  *(unsigned char *)(a1 + 20) = v6;
  sub_25ACFAEE4();
  return a1;
}

__n128 __swift_memcpy21_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  *(void *)(a1 + 13) = *(void *)(a2 + 13);
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for Silicon.CurrentSiliconError(uint64_t a1, uint64_t a2)
{
  int v3 = *(_DWORD *)(a2 + 16);
  char v4 = *(unsigned char *)(a2 + 20);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_DWORD *)(a1 + 16) = v3;
  *(unsigned char *)(a1 + 20) = v4;
  sub_25ACFAEE4();
  return a1;
}

uint64_t getEnumTagSinglePayload for Silicon.CurrentSiliconError(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFF && *(unsigned char *)(a1 + 21)) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 20);
  if (v3 <= 1) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for Silicon.CurrentSiliconError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(unsigned char *)(result + 20) = 0;
    *(_DWORD *)(result + 16) = 0;
    *(void *)__n128 result = a2 - 255;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 21) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 21) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 20) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_25ACFB0B4(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 20);
}

uint64_t sub_25ACFB0BC(uint64_t result, char a2)
{
  *(unsigned char *)(result + 20) = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for Silicon.CurrentSiliconError()
{
  return &type metadata for Silicon.CurrentSiliconError;
}

uint64_t sub_25ACFB0DC()
{
  sub_25AD14570();
  return swift_bridgeObjectRelease();
}

uint64_t sub_25ACFB218()
{
  sub_25AD14570();
  return swift_bridgeObjectRelease();
}

uint64_t sub_25ACFB2E8()
{
  sub_25AD14570();
  return swift_bridgeObjectRelease();
}

uint64_t sub_25ACFB414()
{
  return sub_25AD14B90();
}

uint64_t sub_25ACFB550()
{
  return sub_25AD14B90();
}

uint64_t sub_25ACFB638()
{
  return sub_25AD14B90();
}

uint64_t sub_25ACFB784(unsigned __int8 a1, char a2)
{
  unint64_t v2 = 1701667182;
  unint64_t v3 = 0xE400000000000000;
  uint64_t v4 = a1;
  unint64_t v5 = 1701667182;
  switch(v4)
  {
    case 1:
      unint64_t v5 = 0x4E79616C70736964;
      unint64_t v3 = 0xEB00000000656D61;
      break;
    case 2:
      char v6 = "displayDescription";
      goto LABEL_8;
    case 3:
      unint64_t v3 = 0xE700000000000000;
      unint64_t v5 = 0x7363697274656DLL;
      break;
    case 4:
      unint64_t v3 = 0xE800000000000000;
      unint64_t v5 = 0x73676E6974746573;
      break;
    case 5:
      unint64_t v3 = 0xE700000000000000;
      unint64_t v5 = 0x6E6F63696C6973;
      break;
    case 6:
      char v6 = "supportedPlatforms";
LABEL_8:
      unint64_t v3 = (unint64_t)(v6 - 32) | 0x8000000000000000;
      unint64_t v5 = 0xD000000000000012;
      break;
    case 7:
      unint64_t v5 = 0x6369666963657073;
      unint64_t v3 = 0xED00006E6F697461;
      break;
    default:
      break;
  }
  unint64_t v7 = 0xE400000000000000;
  switch(a2)
  {
    case 1:
      unint64_t v7 = 0xEB00000000656D61;
      if (v5 == 0x4E79616C70736964) {
        goto LABEL_23;
      }
      goto LABEL_26;
    case 2:
      uint64_t v8 = "displayDescription";
      goto LABEL_21;
    case 3:
      unint64_t v7 = 0xE700000000000000;
      if (v5 != 0x7363697274656DLL) {
        goto LABEL_26;
      }
      goto LABEL_23;
    case 4:
      unint64_t v7 = 0xE800000000000000;
      if (v5 != 0x73676E6974746573) {
        goto LABEL_26;
      }
      goto LABEL_23;
    case 5:
      unint64_t v7 = 0xE700000000000000;
      if (v5 != 0x6E6F63696C6973) {
        goto LABEL_26;
      }
      goto LABEL_23;
    case 6:
      uint64_t v8 = "supportedPlatforms";
LABEL_21:
      unint64_t v7 = (unint64_t)(v8 - 32) | 0x8000000000000000;
      unint64_t v2 = 0xD000000000000012;
      goto LABEL_22;
    case 7:
      unint64_t v7 = 0xED00006E6F697461;
      if (v5 != 0x6369666963657073) {
        goto LABEL_26;
      }
      goto LABEL_23;
    default:
LABEL_22:
      if (v5 != v2) {
        goto LABEL_26;
      }
LABEL_23:
      if (v3 == v7) {
        char v9 = 1;
      }
      else {
LABEL_26:
      }
        char v9 = sub_25AD14AF0();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v9 & 1;
  }
}

uint64_t sub_25ACFBA10(char a1, char a2)
{
  unint64_t v3 = 0xD00000000000001ALL;
  unint64_t v4 = 0x800000025AD18300;
  switch(a1)
  {
    case 1:
      unint64_t v4 = 0x800000025AD18320;
      unint64_t v3 = 0xD000000000000010;
      break;
    case 2:
      unint64_t v3 = 0xD000000000000021;
      unint64_t v5 = "MultiplexAllCountersPeriodSeconds";
      goto LABEL_5;
    case 3:
      unint64_t v3 = 0xD000000000000016;
      unint64_t v5 = "MultiplexPeriodSeconds";
LABEL_5:
      unint64_t v4 = (unint64_t)(v5 - 32) | 0x8000000000000000;
      break;
    default:
      break;
  }
  unint64_t v6 = 0xD00000000000001ALL;
  unint64_t v7 = 0x800000025AD18300;
  switch(a2)
  {
    case 1:
      unint64_t v7 = 0x800000025AD18320;
      unint64_t v6 = 0xD000000000000010;
      break;
    case 2:
      unint64_t v6 = 0xD000000000000021;
      uint64_t v8 = "MultiplexAllCountersPeriodSeconds";
      goto LABEL_10;
    case 3:
      unint64_t v6 = 0xD000000000000016;
      uint64_t v8 = "MultiplexPeriodSeconds";
LABEL_10:
      unint64_t v7 = (unint64_t)(v8 - 32) | 0x8000000000000000;
      break;
    default:
      break;
  }
  if (v3 == v6 && v4 == v7) {
    char v9 = 1;
  }
  else {
    char v9 = sub_25AD14AF0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v9 & 1;
}

uint64_t sub_25ACFBB8C(unsigned __int8 a1, char a2)
{
  unint64_t v2 = 0xEC00000073656C70;
  unint64_t v3 = 0x6D615372656D6954;
  uint64_t v4 = a1;
  unint64_t v5 = 0x6D615372656D6954;
  unint64_t v6 = 0xEC00000073656C70;
  switch(v4)
  {
    case 1:
      unint64_t v7 = "SchedulingSamples";
      goto LABEL_5;
    case 2:
      unint64_t v5 = 0x65646F435F43504BLL;
      unint64_t v6 = 0xE900000000000073;
      break;
    case 3:
      unint64_t v7 = "MaxConfigCounters";
LABEL_5:
      unint64_t v6 = (unint64_t)(v7 - 32) | 0x8000000000000000;
      unint64_t v5 = 0xD000000000000011;
      break;
    case 4:
      unint64_t v5 = 0xD000000000000010;
      uint64_t v8 = "NumFixedCounters";
      goto LABEL_9;
    case 5:
      unint64_t v5 = 0x6C706D6153494D50;
      unint64_t v6 = 0xEA00000000007365;
      break;
    case 6:
      unint64_t v5 = 0xD000000000000017;
      uint64_t v8 = "PMI_Multiplexing_Config";
LABEL_9:
      unint64_t v6 = (unint64_t)(v8 - 32) | 0x8000000000000000;
      break;
    default:
      break;
  }
  switch(a2)
  {
    case 1:
      char v9 = "SchedulingSamples";
      goto LABEL_14;
    case 2:
      unint64_t v3 = 0x65646F435F43504BLL;
      unint64_t v2 = 0xE900000000000073;
      break;
    case 3:
      char v9 = "MaxConfigCounters";
LABEL_14:
      unint64_t v2 = (unint64_t)(v9 - 32) | 0x8000000000000000;
      unint64_t v3 = 0xD000000000000011;
      break;
    case 4:
      unint64_t v3 = 0xD000000000000010;
      uint64_t v10 = "NumFixedCounters";
      goto LABEL_18;
    case 5:
      unint64_t v3 = 0x6C706D6153494D50;
      unint64_t v2 = 0xEA00000000007365;
      break;
    case 6:
      unint64_t v3 = 0xD000000000000017;
      uint64_t v10 = "PMI_Multiplexing_Config";
LABEL_18:
      unint64_t v2 = (unint64_t)(v10 - 32) | 0x8000000000000000;
      break;
    default:
      break;
  }
  if (v5 == v3 && v6 == v2) {
    char v11 = 1;
  }
  else {
    char v11 = sub_25AD14AF0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v11 & 1;
}

uint64_t sub_25ACFBDBC(char a1, char a2)
{
  BOOL v2 = (a1 & 1) == 0;
  if (a1) {
    uint64_t v3 = 0x737265746E756F63;
  }
  else {
    uint64_t v3 = 0x7265626D756ELL;
  }
  if (v2) {
    unint64_t v4 = 0xE600000000000000;
  }
  else {
    unint64_t v4 = 0xED00006B73616D5FLL;
  }
  if (a2) {
    uint64_t v5 = 0x737265746E756F63;
  }
  else {
    uint64_t v5 = 0x7265626D756ELL;
  }
  if (a2) {
    unint64_t v6 = 0xED00006B73616D5FLL;
  }
  else {
    unint64_t v6 = 0xE600000000000000;
  }
  if (v3 == v5 && v4 == v6) {
    char v7 = 1;
  }
  else {
    char v7 = sub_25AD14AF0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_25ACFBE6C(unsigned __int8 a1, char a2)
{
  unint64_t v2 = 0xEE00737265746E75;
  uint64_t v3 = 0x6F635F6465786966;
  uint64_t v4 = a1;
  uint64_t v5 = 0x6F635F6465786966;
  unint64_t v6 = 0xEE00737265746E75;
  switch(v4)
  {
    case 1:
      uint64_t v5 = 0x635F6769666E6F63;
      unint64_t v6 = 0xEF737265746E756FLL;
      break;
    case 2:
      unint64_t v6 = 0xE700000000000000;
      uint64_t v5 = 0x73657361696C61;
      break;
    case 3:
      unint64_t v6 = 0xE600000000000000;
      uint64_t v5 = 0x73746E657665;
      break;
    default:
      break;
  }
  switch(a2)
  {
    case 1:
      unint64_t v2 = 0xEF737265746E756FLL;
      if (v5 == 0x635F6769666E6F63) {
        goto LABEL_12;
      }
      goto LABEL_14;
    case 2:
      unint64_t v2 = 0xE700000000000000;
      uint64_t v3 = 0x73657361696C61;
      goto LABEL_9;
    case 3:
      unint64_t v2 = 0xE600000000000000;
      if (v5 == 0x73746E657665) {
        goto LABEL_12;
      }
      goto LABEL_14;
    default:
LABEL_9:
      if (v5 != v3) {
        goto LABEL_14;
      }
LABEL_12:
      if (v6 == v2) {
        char v7 = 1;
      }
      else {
LABEL_14:
      }
        char v7 = sub_25AD14AF0();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v7 & 1;
  }
}

uint64_t sub_25ACFC024(unsigned __int8 a1, unsigned __int8 a2)
{
  uint64_t v2 = 0x702D6F626D697761;
  unint64_t v3 = 0xEA0000000000696DLL;
  int v4 = a1;
  if (a1)
  {
    if (a1 == 1) {
      uint64_t v5 = 0x702D6F626D697761;
    }
    else {
      uint64_t v5 = 0x65636172746170;
    }
    if (v4 == 1) {
      unint64_t v6 = 0xEA0000000000636DLL;
    }
    else {
      unint64_t v6 = 0xE700000000000000;
    }
    int v7 = a2;
    if (!a2) {
      goto LABEL_12;
    }
  }
  else
  {
    uint64_t v5 = 0x702D6F626D697761;
    unint64_t v6 = 0xEA0000000000696DLL;
    int v7 = a2;
    if (!a2) {
      goto LABEL_12;
    }
  }
  if (v7 == 1)
  {
    unint64_t v3 = 0xEA0000000000636DLL;
  }
  else
  {
    uint64_t v2 = 0x65636172746170;
    unint64_t v3 = 0xE700000000000000;
  }
LABEL_12:
  if (v5 == v2 && v6 == v3) {
    char v8 = 1;
  }
  else {
    char v8 = sub_25AD14AF0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_25ACFC118(uint64_t a1)
{
  uint64_t v2 = v1;
  int64_t v3 = *(void *)(a1 + 16);
  uint64_t v4 = MEMORY[0x263F8EE78];
  if (!v3) {
    return v4;
  }
  uint64_t v5 = a1;
  uint64_t v40 = MEMORY[0x263F8EE78];
  sub_25AD0FDB0(0, v3, 0);
  uint64_t v4 = v40;
  uint64_t result = sub_25AD0C038(v5);
  uint64_t v8 = result;
  uint64_t v9 = 0;
  uint64_t v10 = v5 + 64;
  uint64_t v34 = v5 + 80;
  int64_t v35 = v3;
  uint64_t v37 = v5 + 64;
  uint64_t v38 = v5;
  int v36 = v7;
  while ((v8 & 0x8000000000000000) == 0 && v8 < 1 << *(unsigned char *)(v5 + 32))
  {
    unint64_t v13 = (unint64_t)v8 >> 6;
    if ((*(void *)(v10 + 8 * ((unint64_t)v8 >> 6)) & (1 << v8)) == 0) {
      goto LABEL_25;
    }
    if (*(_DWORD *)(v5 + 36) != v7) {
      goto LABEL_26;
    }
    uint64_t v39 = v9;
    uint64_t v14 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v8);
    uint64_t v15 = *v14;
    uint64_t v16 = v14[1];
    uint64_t v17 = (uint64_t *)(*(void *)(v5 + 56) + 16 * v8);
    uint64_t v18 = *v17;
    uint64_t v19 = v17[1];
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain();
    int v20 = (void *)sub_25ACFC5DC(MEMORY[0x263F8EE78]);
    uint64_t v21 = sub_25AD1228C(v18, v19, v20);
    if (v2)
    {
      swift_release();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v4;
    }
    uint64_t v23 = v21;
    uint64_t v24 = v22;
    uint64_t result = swift_bridgeObjectRelease();
    unint64_t v26 = *(void *)(v40 + 16);
    unint64_t v25 = *(void *)(v40 + 24);
    unint64_t v27 = v26 + 1;
    if (v26 >= v25 >> 1)
    {
      uint64_t result = sub_25AD0FDB0(v25 > 1, v26 + 1, 1);
      unint64_t v27 = v26 + 1;
    }
    *(void *)(v40 + 16) = v27;
    uint64_t v28 = (void *)(v40 + 32 * v26);
    v28[4] = v15;
    v28[5] = v16;
    v28[6] = v23;
    v28[7] = v24;
    uint64_t v5 = v38;
    int64_t v11 = 1 << *(unsigned char *)(v38 + 32);
    if (v8 >= v11) {
      goto LABEL_27;
    }
    uint64_t v10 = v37;
    uint64_t v29 = *(void *)(v37 + 8 * v13);
    if ((v29 & (1 << v8)) == 0) {
      goto LABEL_28;
    }
    int v7 = v36;
    if (*(_DWORD *)(v38 + 36) != v36) {
      goto LABEL_29;
    }
    unint64_t v30 = v29 & (-2 << (v8 & 0x3F));
    if (v30)
    {
      int64_t v11 = __clz(__rbit64(v30)) | v8 & 0xFFFFFFFFFFFFFFC0;
      uint64_t v2 = 0;
      int64_t v12 = v35;
    }
    else
    {
      unint64_t v31 = v13 + 1;
      unint64_t v32 = (unint64_t)(v11 + 63) >> 6;
      uint64_t v2 = 0;
      int64_t v12 = v35;
      if (v13 + 1 < v32)
      {
        unint64_t v33 = *(void *)(v37 + 8 * v31);
        if (v33)
        {
LABEL_21:
          int64_t v11 = __clz(__rbit64(v33)) + (v31 << 6);
        }
        else
        {
          while (v32 - 2 != v13)
          {
            unint64_t v33 = *(void *)(v34 + 8 * v13++);
            if (v33)
            {
              unint64_t v31 = v13 + 1;
              goto LABEL_21;
            }
          }
        }
      }
    }
    uint64_t v9 = v39 + 1;
    uint64_t v8 = v11;
    if (v39 + 1 == v12) {
      return v4;
    }
  }
  __break(1u);
LABEL_25:
  __break(1u);
LABEL_26:
  __break(1u);
LABEL_27:
  __break(1u);
LABEL_28:
  __break(1u);
LABEL_29:
  __break(1u);
  return result;
}

unint64_t sub_25ACFC3AC(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B3880);
  uint64_t v2 = (void *)sub_25AD14970();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (uint64_t *)(a1 + 48);
  while (1)
  {
    uint64_t v5 = *(v4 - 2);
    uint64_t v6 = *(v4 - 1);
    uint64_t v7 = *v4;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t result = sub_25AD0A230(v5, v6);
    if (v9) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v10 = (uint64_t *)(v2[6] + 16 * result);
    *uint64_t v10 = v5;
    v10[1] = v6;
    *(void *)(v2[7] + 8 * result) = v7;
    uint64_t v11 = v2[2];
    BOOL v12 = __OFADD__(v11, 1);
    uint64_t v13 = v11 + 1;
    if (v12) {
      goto LABEL_11;
    }
    v2[2] = v13;
    v4 += 3;
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

unint64_t sub_25ACFC4C8(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B3850);
  uint64_t v2 = (void *)sub_25AD14970();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (uint64_t *)(a1 + 48);
  while (1)
  {
    uint64_t v5 = *(v4 - 2);
    uint64_t v6 = *(v4 - 1);
    uint64_t v7 = *v4;
    swift_bridgeObjectRetain();
    unint64_t result = sub_25AD0A230(v5, v6);
    if (v9) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v10 = (uint64_t *)(v2[6] + 16 * result);
    *uint64_t v10 = v5;
    v10[1] = v6;
    *(void *)(v2[7] + 8 * result) = v7;
    uint64_t v11 = v2[2];
    BOOL v12 = __OFADD__(v11, 1);
    uint64_t v13 = v11 + 1;
    if (v12) {
      goto LABEL_11;
    }
    v2[2] = v13;
    v4 += 3;
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

unint64_t sub_25ACFC5DC(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B3808);
  uint64_t v2 = (void *)sub_25AD14970();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (_OWORD *)(a1 + 48);
  while (1)
  {
    uint64_t v5 = *((void *)v4 - 2);
    uint64_t v6 = *((void *)v4 - 1);
    long long v13 = *v4;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t result = sub_25AD0A230(v5, v6);
    if (v8) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    char v9 = (uint64_t *)(v2[6] + 16 * result);
    *char v9 = v5;
    v9[1] = v6;
    *(_OWORD *)(v2[7] + 16 * result) = v13;
    uint64_t v10 = v2[2];
    BOOL v11 = __OFADD__(v10, 1);
    uint64_t v12 = v10 + 1;
    if (v11) {
      goto LABEL_11;
    }
    v2[2] = v12;
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

uint64_t sub_25ACFC714(unint64_t a1, unint64_t a2)
{
  if ((a2 & 0x8000000000000000) != 0)
  {
    uint64_t result = sub_25AD14920();
    __break(1u);
    return result;
  }
  if (!a2) {
    return MEMORY[0x263F8EE78];
  }
  uint64_t result = sub_25AD146C0();
  *(void *)(result + 16) = a2;
  uint64_t v5 = (unint64_t *)(result + 32);
  if (a2 < 4)
  {
    unint64_t v6 = 0;
LABEL_9:
    unint64_t v10 = a2 - v6;
    do
    {
      *v5++ = a1;
      --v10;
    }
    while (v10);
    return result;
  }
  unint64_t v6 = a2 & 0xFFFFFFFFFFFFFFFCLL;
  v5 += a2 & 0xFFFFFFFFFFFFFFFCLL;
  int64x2_t v7 = vdupq_n_s64(a1);
  char v8 = (int64x2_t *)(result + 48);
  unint64_t v9 = a2 & 0xFFFFFFFFFFFFFFFCLL;
  do
  {
    v8[-1] = v7;
    *char v8 = v7;
    v8 += 2;
    v9 -= 4;
  }
  while (v9);
  if (v6 != a2) {
    goto LABEL_9;
  }
  return result;
}

uint64_t sub_25ACFC800(uint64_t a1, uint64_t a2)
{
  if (a2 < 0)
  {
    uint64_t result = sub_25AD14920();
    __break(1u);
  }
  else
  {
    if (a2)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B3548);
      uint64_t v4 = sub_25AD146C0();
      *(void *)(v4 + 16) = a2;
      sub_25ACE6A0C(a1, v4 + 32, &qword_26A4B3548);
      if (a2 != 1)
      {
        sub_25ACE6A0C(a1, v4 + 80, &qword_26A4B3548);
        uint64_t v5 = a2 - 2;
        if (a2 != 2)
        {
          uint64_t v6 = v4 + 128;
          do
          {
            sub_25AD07C54(a1);
            sub_25ACE6A0C(a1, v6, &qword_26A4B3548);
            v6 += 48;
            --v5;
          }
          while (v5);
        }
        sub_25AD07C54(a1);
      }
    }
    else
    {
      sub_25AD07C80(a1);
      return MEMORY[0x263F8EE78];
    }
    return v4;
  }
  return result;
}

uint64_t sub_25ACFC92C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (a5 < 0)
  {
    uint64_t result = sub_25AD14920();
    __break(1u);
  }
  else
  {
    if (a5)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B34F0);
      unint64_t v10 = (void *)sub_25AD146C0();
      BOOL v11 = v10;
      void v10[2] = a5;
      v10[4] = a1;
      v10[5] = a2;
      v10[6] = a3;
      v10[7] = a4;
      if (a5 != 1)
      {
        v10[8] = a1;
        v10[9] = a2;
        v10[10] = a3;
        v10[11] = a4;
        uint64_t v12 = a5 - 2;
        if (v12)
        {
          long long v13 = v10 + 15;
          do
          {
            *(v13 - 3) = a1;
            *(v13 - 2) = a2;
            *(v13 - 1) = a3;
            *long long v13 = a4;
            swift_bridgeObjectRetain();
            v13 += 4;
            --v12;
          }
          while (v12);
        }
        swift_bridgeObjectRetain();
      }
    }
    else
    {
      swift_bridgeObjectRelease();
      return MEMORY[0x263F8EE78];
    }
    return (uint64_t)v11;
  }
  return result;
}

uint64_t sub_25ACFCA4C(int a1, size_t a2)
{
  if ((a2 & 0x8000000000000000) != 0)
  {
    uint64_t result = sub_25AD14920();
    __break(1u);
  }
  else
  {
    if (!a2) {
      return MEMORY[0x263F8EE78];
    }
    uint64_t v4 = sub_25AD146C0();
    *(void *)(v4 + 16) = a2;
    memset((void *)(v4 + 32), a1, a2);
    return v4;
  }
  return result;
}

uint64_t sub_25ACFCB08(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3 < 0)
  {
    uint64_t result = sub_25AD14920();
    __break(1u);
  }
  else
  {
    if (a3)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B37C0);
      uint64_t v6 = (void *)sub_25AD146C0();
      int64x2_t v7 = v6;
      _OWORD v6[2] = a3;
      v6[4] = a1;
      _OWORD v6[5] = a2;
      if (a3 != 1)
      {
        v6[6] = a1;
        v6[7] = a2;
        uint64_t v8 = a3 - 2;
        if (v8)
        {
          unint64_t v9 = v6 + 9;
          do
          {
            *(v9 - 1) = a1;
            *unint64_t v9 = a2;
            swift_bridgeObjectRetain();
            v9 += 2;
            --v8;
          }
          while (v8);
        }
        swift_bridgeObjectRetain();
      }
    }
    else
    {
      swift_bridgeObjectRelease();
      return MEMORY[0x263F8EE78];
    }
    return (uint64_t)v7;
  }
  return result;
}

uint64_t sub_25ACFCC0C(unint64_t a1, double a2)
{
  if ((a1 & 0x8000000000000000) != 0)
  {
    uint64_t result = sub_25AD14920();
    __break(1u);
    return result;
  }
  if (!a1) {
    return MEMORY[0x263F8EE78];
  }
  uint64_t result = sub_25AD146C0();
  *(void *)(result + 16) = a1;
  uint64_t v4 = (double *)(result + 32);
  if (a1 < 4)
  {
    unint64_t v5 = 0;
    double v6 = a2;
LABEL_9:
    unint64_t v10 = a1 - v5;
    do
    {
      *v4++ = v6;
      --v10;
    }
    while (v10);
    return result;
  }
  unint64_t v5 = a1 & 0xFFFFFFFFFFFFFFFCLL;
  v4 += a1 & 0xFFFFFFFFFFFFFFFCLL;
  double v6 = a2;
  int64x2_t v7 = vdupq_lane_s64(*(uint64_t *)&a2, 0);
  uint64_t v8 = (int64x2_t *)(result + 48);
  unint64_t v9 = a1 & 0xFFFFFFFFFFFFFFFCLL;
  do
  {
    v8[-1] = v7;
    *uint64_t v8 = v7;
    v8 += 2;
    v9 -= 4;
  }
  while (v9);
  if (v5 != a1) {
    goto LABEL_9;
  }
  return result;
}

uint64_t sub_25ACFCD00()
{
  sub_25AD080EC(v0, &v5);
  if (v6 < 0)
  {
    v6 &= ~0x8000000000000000;
    uint64_t v2 = v5;
    sub_25AD14860();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    uint64_t v4 = v2;
    sub_25AD145A0();
  }
  else
  {
    uint64_t v1 = v5;
    sub_25AD14860();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    uint64_t v4 = v1;
    sub_25AD145A0();
    swift_bridgeObjectRetain();
    sub_25AD145A0();
    swift_bridgeObjectRelease();
  }
  sub_25AD145A0();
  return v4;
}

uint64_t sub_25ACFCE44()
{
  sub_25AD080EC(v0, v2);
  return sub_25ACFCD00();
}

uint64_t Mode.name.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t Mode.displayName.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t Mode.displayDescription.getter()
{
  uint64_t v1 = *(void *)(v0 + 32);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t Mode.metrics.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t Mode.silicon.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_25ACFCF20(v1 + 56, a1);
}

uint64_t sub_25ACFCF20(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t Mode.settings.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = *(void *)(v1 + 160);
  uint64_t v3 = *(void *)(v1 + 168);
  *(void *)a1 = *(void *)(v1 + 136);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(v1 + 144);
  *(void *)(a1 + 24) = v2;
  *(void *)(a1 + 32) = v3;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

uint64_t Mode.supportedPlatforms.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t Mode.specification.getter()
{
  uint64_t v1 = *(void *)(v0 + 192);
  swift_bridgeObjectRetain();
  return v1;
}

void sub_25ACFD000()
{
  uint64_t v0 = (void *)sub_25AD144C0();
  id v1 = objc_msgSend(self, sel_bundleWithIdentifier_, v0);

  if (v1) {
    qword_26A4B9AF8 = (uint64_t)v1;
  }
  else {
    __break(1u);
  }
}

uint64_t sub_25ACFD078()
{
  uint64_t v0 = sub_25AD14360();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)v19 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B30A0);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_25AD143E0();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  BOOL v11 = (char *)v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = MEMORY[0x270FA5388](v9);
  uint64_t v14 = (char *)v19 - v13;
  __swift_allocate_value_buffer(v12, qword_26A4B9B00);
  __swift_project_value_buffer(v7, (uint64_t)qword_26A4B9B00);
  if (qword_26A4B2F28 != -1) {
    swift_once();
  }
  id v15 = objc_msgSend((id)qword_26A4B9AF8, sel_resourceURL);
  if (v15)
  {
    uint64_t v16 = v15;
    sub_25AD143A0();

    (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v6, v11, v7);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v8 + 56))(v6, 0, 1, v7);
    uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7);
    if (result != 1)
    {
      v19[0] = 0x7365646F4DLL;
      v19[1] = 0xE500000000000000;
      (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, *MEMORY[0x263F06E30], v0);
      sub_25ACEDE04();
      sub_25AD143D0();
      (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
      swift_bridgeObjectRelease();
      uint64_t v18 = *(void (**)(char *, uint64_t))(v8 + 8);
      v18(v6, v7);
      sub_25AD14350();
      return ((uint64_t (*)(char *, uint64_t))v18)(v14, v7);
    }
  }
  else
  {
    uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v8 + 56))(v6, 1, 1, v7);
  }
  __break(1u);
  return result;
}

uint64_t sub_25ACFD3D8()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B30A0);
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v2 = (char *)&v9 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_25AD14360();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_25AD143E0();
  __swift_allocate_value_buffer(v7, qword_26A4B9B18);
  __swift_project_value_buffer(v7, (uint64_t)qword_26A4B9B18);
  (*(void (**)(char *, void, uint64_t))(v4 + 104))(v6, *MEMORY[0x263F06E30], v3);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v2, 1, 1, v7);
  return sub_25AD143C0();
}

uint64_t sub_25ACFD578(uint64_t a1)
{
  uint64_t result = sub_25AD146F0();
  int64_t v3 = 0;
  uint64_t v18 = result;
  uint64_t v4 = a1 + 64;
  uint64_t v5 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v6 = -1;
  if (v5 < 64) {
    uint64_t v6 = ~(-1 << v5);
  }
  unint64_t v7 = v6 & *(void *)(a1 + 64);
  int64_t v8 = (unint64_t)(v5 + 63) >> 6;
  while (1)
  {
    if (v7)
    {
      unint64_t v9 = __clz(__rbit64(v7));
      v7 &= v7 - 1;
      unint64_t v10 = v9 | (v3 << 6);
      goto LABEL_5;
    }
    int64_t v14 = v3 + 1;
    if (__OFADD__(v3, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v14 >= v8) {
      goto LABEL_23;
    }
    unint64_t v15 = *(void *)(v4 + 8 * v14);
    ++v3;
    if (!v15)
    {
      int64_t v3 = v14 + 1;
      if (v14 + 1 >= v8) {
        goto LABEL_23;
      }
      unint64_t v15 = *(void *)(v4 + 8 * v3);
      if (!v15)
      {
        int64_t v3 = v14 + 2;
        if (v14 + 2 >= v8) {
          goto LABEL_23;
        }
        unint64_t v15 = *(void *)(v4 + 8 * v3);
        if (!v15)
        {
          int64_t v3 = v14 + 3;
          if (v14 + 3 >= v8) {
            goto LABEL_23;
          }
          unint64_t v15 = *(void *)(v4 + 8 * v3);
          if (!v15) {
            break;
          }
        }
      }
    }
LABEL_22:
    unint64_t v7 = (v15 - 1) & v15;
    unint64_t v10 = __clz(__rbit64(v15)) + (v3 << 6);
LABEL_5:
    BOOL v11 = (uint64_t *)(*(void *)(a1 + 48) + 16 * v10);
    uint64_t v12 = *v11;
    uint64_t v13 = v11[1];
    swift_bridgeObjectRetain();
    sub_25AD007D4(&v17, v12, v13);
    uint64_t result = swift_bridgeObjectRelease();
  }
  int64_t v16 = v14 + 4;
  if (v16 >= v8)
  {
LABEL_23:
    swift_release();
    return v18;
  }
  unint64_t v15 = *(void *)(v4 + 8 * v16);
  if (v15)
  {
    int64_t v3 = v16;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v3 = v16 + 1;
    if (__OFADD__(v16, 1)) {
      break;
    }
    if (v3 >= v8) {
      goto LABEL_23;
    }
    unint64_t v15 = *(void *)(v4 + 8 * v3);
    ++v16;
    if (v15) {
      goto LABEL_22;
    }
  }
LABEL_25:
  __break(1u);
  return result;
}

uint64_t sub_25ACFD710(uint64_t result, uint64_t a2)
{
  uint64_t v2 = result;
  int64_t v3 = 0;
  uint64_t v18 = a2;
  uint64_t v4 = result + 64;
  uint64_t v5 = 1 << *(unsigned char *)(result + 32);
  uint64_t v6 = -1;
  if (v5 < 64) {
    uint64_t v6 = ~(-1 << v5);
  }
  unint64_t v7 = v6 & *(void *)(result + 64);
  int64_t v8 = (unint64_t)(v5 + 63) >> 6;
  while (1)
  {
    if (v7)
    {
      unint64_t v9 = __clz(__rbit64(v7));
      v7 &= v7 - 1;
      unint64_t v10 = v9 | (v3 << 6);
      goto LABEL_5;
    }
    int64_t v14 = v3 + 1;
    if (__OFADD__(v3, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v14 >= v8) {
      goto LABEL_23;
    }
    unint64_t v15 = *(void *)(v4 + 8 * v14);
    ++v3;
    if (!v15)
    {
      int64_t v3 = v14 + 1;
      if (v14 + 1 >= v8) {
        goto LABEL_23;
      }
      unint64_t v15 = *(void *)(v4 + 8 * v3);
      if (!v15)
      {
        int64_t v3 = v14 + 2;
        if (v14 + 2 >= v8) {
          goto LABEL_23;
        }
        unint64_t v15 = *(void *)(v4 + 8 * v3);
        if (!v15)
        {
          int64_t v3 = v14 + 3;
          if (v14 + 3 >= v8) {
            goto LABEL_23;
          }
          unint64_t v15 = *(void *)(v4 + 8 * v3);
          if (!v15) {
            break;
          }
        }
      }
    }
LABEL_22:
    unint64_t v7 = (v15 - 1) & v15;
    unint64_t v10 = __clz(__rbit64(v15)) + (v3 << 6);
LABEL_5:
    BOOL v11 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v10);
    uint64_t v12 = *v11;
    uint64_t v13 = v11[1];
    swift_bridgeObjectRetain();
    sub_25AD007D4(&v17, v12, v13);
    uint64_t result = swift_bridgeObjectRelease();
  }
  int64_t v16 = v14 + 4;
  if (v16 >= v8)
  {
LABEL_23:
    swift_release();
    return v18;
  }
  unint64_t v15 = *(void *)(v4 + 8 * v16);
  if (v15)
  {
    int64_t v3 = v16;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v3 = v16 + 1;
    if (__OFADD__(v16, 1)) {
      break;
    }
    if (v3 >= v8) {
      goto LABEL_23;
    }
    unint64_t v15 = *(void *)(v4 + 8 * v3);
    ++v16;
    if (v15) {
      goto LABEL_22;
    }
  }
LABEL_25:
  __break(1u);
  return result;
}

uint64_t Mode.metricValues(cpuKind:counterValues:)(unsigned __int8 a1, uint64_t a2)
{
  uint64_t v8 = sub_25ACFCC0C(*(void *)(*(void *)(v2 + 48) + 16), 0.0);
  sub_25AD09CB0(a1, a2, &v8);
  uint64_t v6 = v8;
  if (v3) {
    swift_bridgeObjectRelease();
  }
  return v6;
}

uint64_t sub_25ACFD910(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a3 + 16))
  {
    sub_25AD14B70();
    sub_25AD14570();
    uint64_t v6 = sub_25AD14B90();
    uint64_t v7 = -1 << *(unsigned char *)(a3 + 32);
    unint64_t v8 = v6 & ~v7;
    uint64_t v9 = a3 + 56;
    if ((*(void *)(a3 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8))
    {
      uint64_t v10 = *(void *)(a3 + 48);
      BOOL v11 = (void *)(v10 + 16 * v8);
      BOOL v12 = *v11 == a1 && v11[1] == a2;
      if (v12 || (sub_25AD14AF0() & 1) != 0) {
        return 1;
      }
      uint64_t v14 = ~v7;
      unint64_t v15 = (v8 + 1) & v14;
      if ((*(void *)(v9 + ((v15 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v15))
      {
        while (1)
        {
          int64_t v16 = (void *)(v10 + 16 * v15);
          BOOL v17 = *v16 == a1 && v16[1] == a2;
          if (v17 || (sub_25AD14AF0() & 1) != 0) {
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

uint64_t sub_25ACFDA48(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t v3 = *(void **)v1;
  int64_t v4 = *(void *)(*(void *)v1 + 16);
  int64_t v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  char isUniquelyReferenced_nonNull_native = (void *)swift_isUniquelyReferenced_nonNull_native();
  if (isUniquelyReferenced_nonNull_native && v5 <= v3[3] >> 1)
  {
    if (*(void *)(a1 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_18;
  }
  if (v4 <= v5) {
    int64_t v14 = v4 + v2;
  }
  else {
    int64_t v14 = v4;
  }
  uint64_t v3 = sub_25ACFFA98(isUniquelyReferenced_nonNull_native, v14, 1, v3);
  if (!*(void *)(a1 + 16))
  {
LABEL_18:
    if (!v2) {
      goto LABEL_19;
    }
    goto LABEL_21;
  }
LABEL_5:
  uint64_t v8 = v3[2];
  if ((v3[3] >> 1) - v8 < v2)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  unint64_t v9 = (unint64_t)&v3[3 * v8 + 4];
  if (a1 + 32 < v9 + 24 * v2 && v9 < a1 + 32 + 24 * v2) {
    goto LABEL_24;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B37A8);
  swift_arrayInitWithCopy();
  if (!v2)
  {
LABEL_19:
    uint64_t result = swift_bridgeObjectRelease();
    *(void *)uint64_t v1 = v3;
    return result;
  }
  uint64_t v11 = v3[2];
  BOOL v12 = __OFADD__(v11, v2);
  uint64_t v13 = v11 + v2;
  if (!v12)
  {
    v3[2] = v13;
    goto LABEL_19;
  }
LABEL_23:
  __break(1u);
LABEL_24:
  uint64_t result = sub_25AD14980();
  __break(1u);
  return result;
}

uint64_t sub_25ACFDBB4(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t v3 = *(void **)v1;
  int64_t v4 = *(void *)(*(void *)v1 + 16);
  int64_t v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  char isUniquelyReferenced_nonNull_native = (void *)swift_isUniquelyReferenced_nonNull_native();
  if (isUniquelyReferenced_nonNull_native && v5 <= v3[3] >> 1)
  {
    if (*(void *)(a1 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_18;
  }
  if (v4 <= v5) {
    int64_t v14 = v4 + v2;
  }
  else {
    int64_t v14 = v4;
  }
  uint64_t v3 = sub_25ACFFF04(isUniquelyReferenced_nonNull_native, v14, 1, v3);
  if (!*(void *)(a1 + 16))
  {
LABEL_18:
    if (!v2) {
      goto LABEL_19;
    }
    goto LABEL_21;
  }
LABEL_5:
  uint64_t v8 = v3[2];
  if ((v3[3] >> 1) - v8 < v2)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  unint64_t v9 = (unint64_t)&v3[2 * v8 + 4];
  if (a1 + 32 < v9 + 16 * v2 && v9 < a1 + 32 + 16 * v2) {
    goto LABEL_24;
  }
  swift_arrayInitWithCopy();
  if (!v2)
  {
LABEL_19:
    uint64_t result = swift_bridgeObjectRelease();
    *(void *)uint64_t v1 = v3;
    return result;
  }
  uint64_t v11 = v3[2];
  BOOL v12 = __OFADD__(v11, v2);
  uint64_t v13 = v11 + v2;
  if (!v12)
  {
    v3[2] = v13;
    goto LABEL_19;
  }
LABEL_23:
  __break(1u);
LABEL_24:
  uint64_t result = sub_25AD14980();
  __break(1u);
  return result;
}

uint64_t sub_25ACFDD08(uint64_t a1)
{
  unint64_t v2 = *(void *)(a1 + 16);
  uint64_t v3 = *(void **)v1;
  int64_t v4 = *(void *)(*(void *)v1 + 16);
  int64_t v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
    goto LABEL_21;
  }
  char isUniquelyReferenced_nonNull_native = (void *)swift_isUniquelyReferenced_nonNull_native();
  if (isUniquelyReferenced_nonNull_native && v5 <= v3[3] >> 1)
  {
    unint64_t v8 = *(void *)(a1 + 16);
    if (v8) {
      goto LABEL_5;
    }
LABEL_18:
    if (!v2) {
      goto LABEL_19;
    }
    goto LABEL_21;
  }
  if (v4 <= v5) {
    int64_t v15 = v4 + v2;
  }
  else {
    int64_t v15 = v4;
  }
  uint64_t v3 = sub_25AD00014(isUniquelyReferenced_nonNull_native, v15, 1, v3);
  unint64_t v8 = *(void *)(a1 + 16);
  if (!v8) {
    goto LABEL_18;
  }
LABEL_5:
  uint64_t v9 = v3[2];
  if ((v3[3] >> 1) - v9 < (uint64_t)v8)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  unint64_t v10 = (unint64_t)&v3[2 * v9 + 4];
  if (a1 + 32 < v10 + 16 * v8 && v10 < a1 + 32 + 16 * v8) {
    goto LABEL_24;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B37C0);
  swift_arrayInitWithCopy();
  if (v8 < v2)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  uint64_t v12 = v3[2];
  BOOL v13 = __OFADD__(v12, v8);
  uint64_t v14 = v12 + v8;
  if (!v13)
  {
    v3[2] = v14;
LABEL_19:
    uint64_t result = swift_bridgeObjectRelease();
    *(void *)uint64_t v1 = v3;
    return result;
  }
LABEL_23:
  __break(1u);
LABEL_24:
  uint64_t result = sub_25AD14980();
  __break(1u);
  return result;
}

uint64_t sub_25ACFDE78(uint64_t result)
{
  uint64_t v3 = *(void *)(result + 16);
  int64_t v4 = *(void **)v1;
  int64_t v5 = *(void *)(*(void *)v1 + 16);
  int64_t v6 = v5 + v3;
  if (__OFADD__(v5, v3))
  {
    __break(1u);
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  uint64_t v7 = result;
  char isUniquelyReferenced_nonNull_native = (void *)swift_isUniquelyReferenced_nonNull_native();
  if (!isUniquelyReferenced_nonNull_native || (int64_t v9 = v4[3] >> 1, v9 < v6))
  {
    if (v5 <= v6) {
      int64_t v10 = v5 + v3;
    }
    else {
      int64_t v10 = v5;
    }
    int64_t v4 = sub_25ACFFF04(isUniquelyReferenced_nonNull_native, v10, 1, v4);
    int64_t v9 = v4[3] >> 1;
  }
  uint64_t v11 = v4[2];
  uint64_t v12 = v9 - v11;
  uint64_t result = sub_25AD021BC((uint64_t)v38, &v4[2 * v11 + 4], v9 - v11, v7);
  if (result < v3) {
    goto LABEL_15;
  }
  if (result)
  {
    uint64_t v14 = v4[2];
    BOOL v15 = __OFADD__(v14, result);
    uint64_t v16 = v14 + result;
    if (v15)
    {
      __break(1u);
      goto LABEL_48;
    }
    v4[2] = v16;
  }
  if (result != v12)
  {
LABEL_13:
    uint64_t result = sub_25AD07A28();
    *(void *)uint64_t v1 = v4;
    return result;
  }
LABEL_16:
  int64_t v2 = v4[2];
  uint64_t v3 = v38[0];
  uint64_t v37 = v38[1];
  uint64_t v13 = v39;
  int64_t v6 = v40;
  if (v41)
  {
    unint64_t v17 = (v41 - 1) & v41;
    unint64_t v18 = __clz(__rbit64(v41)) | (v40 << 6);
    int64_t v36 = (unint64_t)(v39 + 64) >> 6;
    goto LABEL_18;
  }
LABEL_48:
  int64_t v32 = v6 + 1;
  if (__OFADD__(v6, 1)) {
    goto LABEL_66;
  }
  int64_t v36 = (unint64_t)(v13 + 64) >> 6;
  if (v32 >= v36) {
    goto LABEL_13;
  }
  unint64_t v33 = *(void *)(v37 + 8 * v32);
  int64_t v34 = v6 + 1;
  if (!v33)
  {
    int64_t v34 = v6 + 2;
    if (v6 + 2 >= v36) {
      goto LABEL_13;
    }
    unint64_t v33 = *(void *)(v37 + 8 * v34);
    if (!v33)
    {
      int64_t v34 = v6 + 3;
      if (v6 + 3 >= v36) {
        goto LABEL_13;
      }
      unint64_t v33 = *(void *)(v37 + 8 * v34);
      if (!v33)
      {
        int64_t v34 = v6 + 4;
        if (v6 + 4 >= v36) {
          goto LABEL_13;
        }
        unint64_t v33 = *(void *)(v37 + 8 * v34);
        if (!v33)
        {
          int64_t v34 = v6 + 5;
          if (v6 + 5 >= v36) {
            goto LABEL_13;
          }
          unint64_t v33 = *(void *)(v37 + 8 * v34);
          if (!v33)
          {
            int64_t v35 = v6 + 6;
            do
            {
              if (v36 == v35) {
                goto LABEL_13;
              }
              unint64_t v33 = *(void *)(v37 + 8 * v35++);
            }
            while (!v33);
            int64_t v34 = v35 - 1;
          }
        }
      }
    }
  }
  unint64_t v17 = (v33 - 1) & v33;
  unint64_t v18 = __clz(__rbit64(v33)) + (v34 << 6);
  int64_t v6 = v34;
LABEL_18:
  uint64_t v19 = (uint64_t *)(*(void *)(v3 + 48) + 16 * v18);
  uint64_t v21 = *v19;
  uint64_t v20 = v19[1];
  uint64_t result = swift_bridgeObjectRetain();
  while (1)
  {
    unint64_t v22 = v4[3];
    int64_t v23 = v22 >> 1;
    if ((uint64_t)(v22 >> 1) < v2 + 1) {
      break;
    }
    if (v2 < v23) {
      goto LABEL_23;
    }
LABEL_20:
    v4[2] = v2;
  }
  uint64_t result = (uint64_t)sub_25ACFFF04((void *)(v22 > 1), v2 + 1, 1, v4);
  int64_t v4 = (void *)result;
  int64_t v23 = *(void *)(result + 24) >> 1;
  if (v2 >= v23) {
    goto LABEL_20;
  }
  while (1)
  {
LABEL_23:
    uint64_t v24 = &v4[2 * v2 + 4];
    *uint64_t v24 = v21;
    v24[1] = v20;
    ++v2;
    if (v17)
    {
      unint64_t v25 = __clz(__rbit64(v17));
      v17 &= v17 - 1;
      unint64_t v26 = v25 | (v6 << 6);
      goto LABEL_41;
    }
    int64_t v27 = v6 + 1;
    if (__OFADD__(v6, 1)) {
      break;
    }
    if (v27 >= v36) {
      goto LABEL_45;
    }
    unint64_t v28 = *(void *)(v37 + 8 * v27);
    int64_t v29 = v6 + 1;
    if (!v28)
    {
      int64_t v29 = v6 + 2;
      if (v6 + 2 >= v36) {
        goto LABEL_45;
      }
      unint64_t v28 = *(void *)(v37 + 8 * v29);
      if (!v28)
      {
        int64_t v29 = v6 + 3;
        if (v6 + 3 >= v36) {
          goto LABEL_45;
        }
        unint64_t v28 = *(void *)(v37 + 8 * v29);
        if (!v28)
        {
          int64_t v29 = v6 + 4;
          if (v6 + 4 >= v36) {
            goto LABEL_45;
          }
          unint64_t v28 = *(void *)(v37 + 8 * v29);
          if (!v28)
          {
            int64_t v29 = v6 + 5;
            if (v6 + 5 >= v36) {
              goto LABEL_45;
            }
            unint64_t v28 = *(void *)(v37 + 8 * v29);
            if (!v28)
            {
              int64_t v30 = v6 + 6;
              while (v36 != v30)
              {
                unint64_t v28 = *(void *)(v37 + 8 * v30++);
                if (v28)
                {
                  int64_t v29 = v30 - 1;
                  goto LABEL_40;
                }
              }
LABEL_45:
              v4[2] = v2;
              goto LABEL_13;
            }
          }
        }
      }
    }
LABEL_40:
    unint64_t v17 = (v28 - 1) & v28;
    unint64_t v26 = __clz(__rbit64(v28)) + (v29 << 6);
    int64_t v6 = v29;
LABEL_41:
    unint64_t v31 = (uint64_t *)(*(void *)(v3 + 48) + 16 * v26);
    uint64_t v21 = *v31;
    uint64_t v20 = v31[1];
    if (v2 >= v23)
    {
      uint64_t result = swift_bridgeObjectRetain();
      goto LABEL_20;
    }
    uint64_t result = swift_bridgeObjectRetain();
  }
  __break(1u);
LABEL_66:
  __break(1u);
  return result;
}

uint64_t sub_25ACFE244(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t v3 = *(void **)v1;
  int64_t v4 = *(void *)(*(void *)v1 + 16);
  int64_t v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  char isUniquelyReferenced_nonNull_native = (void *)swift_isUniquelyReferenced_nonNull_native();
  if (isUniquelyReferenced_nonNull_native && v5 <= v3[3] >> 1)
  {
    if (*(void *)(a1 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_18;
  }
  if (v4 <= v5) {
    int64_t v14 = v4 + v2;
  }
  else {
    int64_t v14 = v4;
  }
  uint64_t v3 = sub_25AD00124(isUniquelyReferenced_nonNull_native, v14, 1, v3);
  if (!*(void *)(a1 + 16))
  {
LABEL_18:
    if (!v2) {
      goto LABEL_19;
    }
    goto LABEL_21;
  }
LABEL_5:
  uint64_t v8 = v3[2];
  if ((v3[3] >> 1) - v8 < v2)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  unint64_t v9 = (unint64_t)&v3[4 * v8 + 4];
  if (a1 + 32 < v9 + 32 * v2 && v9 < a1 + 32 + 32 * v2) {
    goto LABEL_24;
  }
  swift_arrayInitWithCopy();
  if (!v2)
  {
LABEL_19:
    uint64_t result = swift_bridgeObjectRelease();
    *(void *)uint64_t v1 = v3;
    return result;
  }
  uint64_t v11 = v3[2];
  BOOL v12 = __OFADD__(v11, v2);
  uint64_t v13 = v11 + v2;
  if (!v12)
  {
    v3[2] = v13;
    goto LABEL_19;
  }
LABEL_23:
  __break(1u);
LABEL_24:
  uint64_t result = sub_25AD14980();
  __break(1u);
  return result;
}

uint64_t sub_25ACFE398(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t v3 = *(void **)v1;
  int64_t v4 = *(void *)(*(void *)v1 + 16);
  int64_t v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  char isUniquelyReferenced_nonNull_native = (void *)swift_isUniquelyReferenced_nonNull_native();
  if (isUniquelyReferenced_nonNull_native && v5 <= v3[3] >> 1)
  {
    if (*(void *)(a1 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_18;
  }
  if (v4 <= v5) {
    int64_t v14 = v4 + v2;
  }
  else {
    int64_t v14 = v4;
  }
  uint64_t v3 = sub_25AD00344(isUniquelyReferenced_nonNull_native, v14, 1, v3);
  if (!*(void *)(a1 + 16))
  {
LABEL_18:
    if (!v2) {
      goto LABEL_19;
    }
    goto LABEL_21;
  }
LABEL_5:
  uint64_t v8 = v3[2];
  if ((v3[3] >> 1) - v8 < v2)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  unint64_t v9 = &v3[v8 + 4];
  if (a1 + 32 < (unint64_t)&v9[v2] && (unint64_t)v9 < a1 + 32 + 8 * v2) {
    goto LABEL_24;
  }
  memcpy(v9, (const void *)(a1 + 32), 8 * v2);
  if (!v2)
  {
LABEL_19:
    uint64_t result = swift_bridgeObjectRelease();
    *(void *)uint64_t v1 = v3;
    return result;
  }
  uint64_t v11 = v3[2];
  BOOL v12 = __OFADD__(v11, v2);
  uint64_t v13 = v11 + v2;
  if (!v12)
  {
    v3[2] = v13;
    goto LABEL_19;
  }
LABEL_23:
  __break(1u);
LABEL_24:
  uint64_t result = sub_25AD14980();
  __break(1u);
  return result;
}

uint64_t sub_25ACFE4E0(uint64_t a1)
{
  unint64_t v2 = *(void *)(a1 + 16);
  uint64_t v3 = *(void **)v1;
  int64_t v4 = *(void *)(*(void *)v1 + 16);
  int64_t v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
    goto LABEL_21;
  }
  char isUniquelyReferenced_nonNull_native = (void *)swift_isUniquelyReferenced_nonNull_native();
  if (isUniquelyReferenced_nonNull_native && v5 <= v3[3] >> 1)
  {
    unint64_t v8 = *(void *)(a1 + 16);
    if (v8) {
      goto LABEL_5;
    }
LABEL_18:
    if (!v2) {
      goto LABEL_19;
    }
    goto LABEL_21;
  }
  if (v4 <= v5) {
    int64_t v15 = v4 + v2;
  }
  else {
    int64_t v15 = v4;
  }
  uint64_t v3 = sub_25AD00454(isUniquelyReferenced_nonNull_native, v15, 1, v3);
  unint64_t v8 = *(void *)(a1 + 16);
  if (!v8) {
    goto LABEL_18;
  }
LABEL_5:
  uint64_t v9 = v3[2];
  if ((v3[3] >> 1) - v9 < (uint64_t)v8)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  unint64_t v10 = (unint64_t)&v3[26 * v9 + 4];
  if (a1 + 32 < v10 + 208 * v8 && v10 < a1 + 32 + 208 * v8) {
    goto LABEL_24;
  }
  swift_arrayInitWithCopy();
  if (v8 < v2)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  uint64_t v12 = v3[2];
  BOOL v13 = __OFADD__(v12, v8);
  uint64_t v14 = v12 + v8;
  if (!v13)
  {
    v3[2] = v14;
LABEL_19:
    uint64_t result = swift_bridgeObjectRelease();
    *(void *)uint64_t v1 = v3;
    return result;
  }
LABEL_23:
  __break(1u);
LABEL_24:
  uint64_t result = sub_25AD14980();
  __break(1u);
  return result;
}

unint64_t sub_25ACFE640(char a1)
{
  unint64_t result = 1701667182;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x4E79616C70736964;
      break;
    case 2:
    case 6:
      unint64_t result = 0xD000000000000012;
      break;
    case 3:
      unint64_t result = 0x7363697274656DLL;
      break;
    case 4:
      unint64_t result = 0x73676E6974746573;
      break;
    case 5:
      unint64_t result = 0x6E6F63696C6973;
      break;
    case 7:
      unint64_t result = 0x6369666963657073;
      break;
    default:
      return result;
  }
  return result;
}

unint64_t sub_25ACFE748(char a1)
{
  unint64_t result = 1701667182;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x4E79616C70736964;
      break;
    case 2:
    case 6:
      unint64_t result = 0xD000000000000012;
      break;
    case 3:
      unint64_t result = 0x7363697274656DLL;
      break;
    case 4:
      unint64_t result = 0x73676E6974746573;
      break;
    case 5:
      unint64_t result = 0x6E6F63696C6973;
      break;
    case 7:
      unint64_t result = 0x6369666963657073;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_25ACFE850(unsigned __int8 *a1, char *a2)
{
  return sub_25ACFB784(*a1, *a2);
}

uint64_t sub_25ACFE85C()
{
  return sub_25ACFB638();
}

uint64_t sub_25ACFE868()
{
  return sub_25ACFB0DC();
}

uint64_t sub_25ACFE870()
{
  return sub_25ACFB638();
}

uint64_t sub_25ACFE878@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_25AD05A9C();
  *a1 = result;
  return result;
}

unint64_t sub_25ACFE8A8@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = sub_25ACFE640(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

unint64_t sub_25ACFE8D4()
{
  return sub_25ACFE748(*v0);
}

uint64_t sub_25ACFE8DC@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_25AD05A9C();
  *a1 = result;
  return result;
}

uint64_t sub_25ACFE904(uint64_t a1)
{
  unint64_t v2 = sub_25AD06A14();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25ACFE940(uint64_t a1)
{
  unint64_t v2 = sub_25AD06A14();
  return MEMORY[0x270FA00B8](a1, v2);
}

__n128 Mode.init(from:)@<Q0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  result.n128_u64[0] = sub_25AD05AE8(a1, (uint64_t)v10).n128_u64[0];
  if (!v2)
  {
    long long v5 = v10[11];
    *(_OWORD *)(a2 + 160) = v10[10];
    *(_OWORD *)(a2 + 176) = v5;
    *(_OWORD *)(a2 + 192) = v10[12];
    long long v6 = v10[7];
    *(_OWORD *)(a2 + 96) = v10[6];
    *(_OWORD *)(a2 + 112) = v6;
    long long v7 = v10[9];
    *(_OWORD *)(a2 + 128) = v10[8];
    *(_OWORD *)(a2 + 144) = v7;
    long long v8 = v10[3];
    *(_OWORD *)(a2 + 32) = v10[2];
    *(_OWORD *)(a2 + 48) = v8;
    long long v9 = v10[5];
    *(_OWORD *)(a2 + 64) = v10[4];
    *(_OWORD *)(a2 + 80) = v9;
    __n128 result = (__n128)v10[1];
    *(_OWORD *)a2 = v10[0];
    *(__n128 *)(a2 + 16) = result;
  }
  return result;
}

uint64_t Mode.encode(to:)(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B36F0);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  long long v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25AD06A14();
  sub_25AD14BB0();
  LOBYTE(v13) = 0;
  sub_25AD14A60();
  if (!v2)
  {
    LOBYTE(v13) = 1;
    sub_25AD14A60();
    LOBYTE(v13) = 2;
    sub_25AD14A60();
    *(void *)&long long v13 = *(void *)(v3 + 48);
    char v18 = 3;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B3700);
    sub_25AD07A84(&qword_26A4B3708, (void (*)(void))sub_25AD06A68);
    sub_25AD14AA0();
    long long v9 = *(_OWORD *)(v3 + 152);
    long long v13 = *(_OWORD *)(v3 + 136);
    long long v14 = v9;
    *(void *)&long long v15 = *(void *)(v3 + 168);
    char v18 = 4;
    sub_25AD06ABC();
    sub_25AD14AA0();
    long long v10 = *(_OWORD *)(v3 + 72);
    long long v11 = *(_OWORD *)(v3 + 104);
    long long v15 = *(_OWORD *)(v3 + 88);
    long long v16 = v11;
    long long v17 = *(_OWORD *)(v3 + 120);
    long long v13 = *(_OWORD *)(v3 + 56);
    long long v14 = v10;
    char v18 = 5;
    sub_25AD06B10();
    sub_25AD14AA0();
    *(void *)&long long v13 = *(void *)(v3 + 184);
    char v18 = 6;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B2FC8);
    sub_25AD07BF0(&qword_26A4B3728);
    sub_25AD14AA0();
    LOBYTE(v13) = 7;
    sub_25AD14A60();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

__n128 sub_25ACFED28@<Q0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  result.n128_u64[0] = sub_25AD05AE8(a1, (uint64_t)v10).n128_u64[0];
  if (!v2)
  {
    long long v5 = v10[11];
    *(_OWORD *)(a2 + 160) = v10[10];
    *(_OWORD *)(a2 + 176) = v5;
    *(_OWORD *)(a2 + 192) = v10[12];
    long long v6 = v10[7];
    *(_OWORD *)(a2 + 96) = v10[6];
    *(_OWORD *)(a2 + 112) = v6;
    long long v7 = v10[9];
    *(_OWORD *)(a2 + 128) = v10[8];
    *(_OWORD *)(a2 + 144) = v7;
    long long v8 = v10[3];
    *(_OWORD *)(a2 + 32) = v10[2];
    *(_OWORD *)(a2 + 48) = v8;
    long long v9 = v10[5];
    *(_OWORD *)(a2 + 64) = v10[4];
    *(_OWORD *)(a2 + 80) = v9;
    __n128 result = (__n128)v10[1];
    *(_OWORD *)a2 = v10[0];
    *(__n128 *)(a2 + 16) = result;
  }
  return result;
}

uint64_t sub_25ACFED94(void *a1)
{
  return Mode.encode(to:)(a1);
}

uint64_t sub_25ACFEDAC(uint64_t a1, char a2, uint64_t (*a3)(void *), uint64_t a4, uint64_t a5, unint64_t a6)
{
  v50[3] = a4;
  if (a1 < 0) {
    goto LABEL_42;
  }
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = MEMORY[0x263F8EE78];
  uint64_t v47 = swift_allocObject();
  *(void *)(v47 + 16) = 15;
  uint64_t v11 = HIBYTE(a6) & 0xF;
  if (!a1 || ((a6 & 0x2000000000000000) != 0 ? (uint64_t v12 = HIBYTE(a6) & 0xF) : (uint64_t v12 = a5 & 0xFFFFFFFFFFFFLL), !v12))
  {
    if ((a6 & 0x2000000000000000) == 0) {
      uint64_t v11 = a5 & 0xFFFFFFFFFFFFLL;
    }
    uint64_t v30 = 7;
    if (((a6 >> 60) & ((a5 & 0x800000000000000) == 0)) != 0) {
      uint64_t v30 = 11;
    }
    sub_25ACFF250(v30 | (v11 << 16), v47, a2 & 1, v10);
    swift_bridgeObjectRelease();
    long long v13 = *(void **)(v10 + 16);
    swift_bridgeObjectRetain();
    swift_release();
LABEL_39:
    swift_release();
    return (uint64_t)v13;
  }
  uint64_t v42 = a1;
  uint64_t v43 = v10;
  unint64_t v48 = 4 * v12;
  long long v13 = (void *)MEMORY[0x263F8EE78];
  unint64_t v14 = 15;
  unint64_t v15 = 15;
  unint64_t v16 = 15;
  while (1)
  {
    v50[0] = sub_25AD14620();
    v50[1] = v17;
    char v18 = a3(v50);
    if (v6)
    {
      swift_release();
      swift_release();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return (uint64_t)v13;
    }
    char v19 = v18;
    swift_bridgeObjectRelease();
    if (v19) {
      break;
    }
    unint64_t v14 = sub_25AD14590();
LABEL_9:
    if (v48 == v14 >> 14) {
      goto LABEL_29;
    }
  }
  if (v15 >> 14 == v14 >> 14 && (a2 & 1) != 0)
  {
    unint64_t v14 = sub_25AD14590();
    *(void *)(v47 + 16) = v14;
    unint64_t v15 = v14;
    unint64_t v16 = v14;
    goto LABEL_9;
  }
  if (v14 >> 14 < v15 >> 14) {
    goto LABEL_41;
  }
  uint64_t v20 = sub_25AD14640();
  uint64_t v44 = v21;
  uint64_t v45 = v20;
  uint64_t v23 = v22;
  uint64_t v25 = v24;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    long long v13 = sub_25ACFF3AC(0, v13[2] + 1, 1, v13);
  }
  unint64_t v27 = v13[2];
  unint64_t v26 = v13[3];
  if (v27 >= v26 >> 1) {
    long long v13 = sub_25ACFF3AC((void *)(v26 > 1), v27 + 1, 1, v13);
  }
  v13[2] = v27 + 1;
  unint64_t v28 = &v13[4 * v27];
  v28[4] = v45;
  v28[5] = v23;
  v28[6] = v25;
  v28[7] = v44;
  *(void *)(v43 + 16) = v13;
  uint64_t v29 = sub_25AD14590();
  unint64_t v14 = v29;
  *(void *)(v47 + 16) = v29;
  if (v13[2] != v42)
  {
    unint64_t v15 = v29;
    unint64_t v16 = v29;
    goto LABEL_9;
  }
  unint64_t v16 = v29;
  unint64_t v15 = v29;
LABEL_29:
  if (v48 == v15 >> 14 && (a2 & 1) != 0)
  {
    swift_bridgeObjectRelease();
LABEL_38:
    swift_bridgeObjectRetain();
    swift_release();
    goto LABEL_39;
  }
  if (v48 >= v16 >> 14)
  {
    uint64_t v31 = sub_25AD14640();
    uint64_t v33 = v32;
    uint64_t v35 = v34;
    uint64_t v37 = v36;
    swift_bridgeObjectRelease();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      long long v13 = sub_25ACFF3AC(0, v13[2] + 1, 1, v13);
    }
    unint64_t v39 = v13[2];
    unint64_t v38 = v13[3];
    if (v39 >= v38 >> 1) {
      long long v13 = sub_25ACFF3AC((void *)(v38 > 1), v39 + 1, 1, v13);
    }
    v13[2] = v39 + 1;
    int64_t v40 = &v13[4 * v39];
    v40[4] = v31;
    v40[5] = v33;
    v40[6] = v35;
    v40[7] = v37;
    *(void *)(v43 + 16) = v13;
    goto LABEL_38;
  }
LABEL_41:
  sub_25AD14920();
  __break(1u);
LABEL_42:
  uint64_t result = sub_25AD14920();
  __break(1u);
  return result;
}

uint64_t sub_25ACFF250(unint64_t a1, uint64_t a2, unsigned __int8 a3, uint64_t a4)
{
  unint64_t v4 = *(void *)(a2 + 16) >> 14;
  int v5 = (v4 == a1 >> 14) & a3;
  if (v5 == 1) {
    return v5 ^ 1u;
  }
  if (a1 >> 14 >= v4)
  {
    uint64_t v7 = sub_25AD14640();
    uint64_t v9 = v8;
    uint64_t v11 = v10;
    uint64_t v13 = v12;
    unint64_t v14 = *(void **)(a4 + 16);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *(void *)(a4 + 16) = v14;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      unint64_t v14 = sub_25ACFF3AC(0, v14[2] + 1, 1, v14);
      *(void *)(a4 + 16) = v14;
    }
    unint64_t v17 = v14[2];
    unint64_t v16 = v14[3];
    if (v17 >= v16 >> 1)
    {
      unint64_t v14 = sub_25ACFF3AC((void *)(v16 > 1), v17 + 1, 1, v14);
      *(void *)(a4 + 16) = v14;
    }
    v14[2] = v17 + 1;
    char v18 = &v14[4 * v17];
    v18[4] = v7;
    v18[5] = v9;
    v18[6] = v11;
    v18[7] = v13;
    return v5 ^ 1u;
  }
  uint64_t result = sub_25AD14920();
  __break(1u);
  return result;
}

void *sub_25ACFF3AC(void *result, int64_t a2, char a3, void *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B3758);
      uint64_t v10 = (void *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 1;
      }
      void v10[2] = v8;
      v10[3] = 2 * (v12 >> 5);
      uint64_t v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = (void *)MEMORY[0x263F8EE78];
      uint64_t v13 = (void *)(MEMORY[0x263F8EE78] + 32);
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[4 * v8 + 4]) {
          memmove(v13, a4 + 4, 32 * v8);
        }
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_25AD023BC(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

void *sub_25ACFF4BC(void *result, int64_t a2, char a3, void *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B3870);
      uint64_t v10 = (void *)swift_allocObject();
      size_t v11 = _swift_stdlib_malloc_size(v10);
      void v10[2] = v8;
      v10[3] = 2 * ((uint64_t)(v11 - 32) / 48);
      uint64_t v12 = v10 + 4;
      if (v5)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[6 * v8 + 4]) {
          memmove(v12, a4 + 4, 48 * v8);
        }
        a4[2] = 0;
        goto LABEL_22;
      }
    }
    else
    {
      uint64_t v10 = (void *)MEMORY[0x263F8EE78];
      uint64_t v12 = (void *)(MEMORY[0x263F8EE78] + 32);
      if (result) {
        goto LABEL_13;
      }
    }
    sub_25AD02990(0, v8, (unint64_t)v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

void *sub_25ACFF5E4(void *a1, int64_t a2, char a3, void *a4)
{
  return sub_25ACFF5FC(a1, a2, a3, a4, &qword_26A4B34E0);
}

void *sub_25ACFF5F0(void *a1, int64_t a2, char a3, void *a4)
{
  return sub_25ACFF5FC(a1, a2, a3, a4, &qword_26A4B37D0);
}

void *sub_25ACFF5FC(void *result, int64_t a2, char a3, void *a4, uint64_t *a5)
{
  char v6 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v8 = a2;
    goto LABEL_8;
  }
  unint64_t v7 = a4[3];
  uint64_t v8 = v7 >> 1;
  if ((uint64_t)(v7 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v8 + 0x4000000000000000 >= 0)
  {
    uint64_t v8 = v7 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v7 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      uint64_t v8 = a2;
    }
LABEL_8:
    uint64_t v9 = a4[2];
    if (v8 <= v9) {
      uint64_t v10 = a4[2];
    }
    else {
      uint64_t v10 = v8;
    }
    if (v10)
    {
      __swift_instantiateConcreteTypeFromMangledName(a5);
      size_t v11 = (void *)swift_allocObject();
      int64_t v12 = _swift_stdlib_malloc_size(v11);
      uint64_t v13 = v12 - 32;
      if (v12 < 32) {
        uint64_t v13 = v12 - 25;
      }
      void v11[2] = v9;
      v11[3] = 2 * (v13 >> 3);
      unint64_t v14 = v11 + 4;
      if (v6) {
        goto LABEL_15;
      }
    }
    else
    {
      size_t v11 = (void *)MEMORY[0x263F8EE78];
      unint64_t v14 = (void *)(MEMORY[0x263F8EE78] + 32);
      if (result)
      {
LABEL_15:
        if (v11 != a4 || v14 >= &a4[v9 + 4]) {
          memmove(v14, a4 + 4, 8 * v9);
        }
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_25AD02CC0(0, v9, (char *)v14, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v11;
  }
  __break(1u);
  return result;
}

void *sub_25ACFF708(void *result, int64_t a2, char a3, void *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B37E0);
      uint64_t v10 = (void *)swift_allocObject();
      size_t v11 = _swift_stdlib_malloc_size(v10);
      void v10[2] = v8;
      v10[3] = 2 * ((uint64_t)(v11 - 32) / 24);
      int64_t v12 = v10 + 4;
      if (v5)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[3 * v8 + 4]) {
          memmove(v12, a4 + 4, 24 * v8);
        }
        a4[2] = 0;
        goto LABEL_22;
      }
    }
    else
    {
      uint64_t v10 = (void *)MEMORY[0x263F8EE78];
      int64_t v12 = (void *)(MEMORY[0x263F8EE78] + 32);
      if (result) {
        goto LABEL_13;
      }
    }
    sub_25AD02BB0(0, v8, (unint64_t)v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

void *sub_25ACFF830(void *result, int64_t a2, char a3, void *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B3868);
      uint64_t v10 = (void *)swift_allocObject();
      size_t v11 = _swift_stdlib_malloc_size(v10);
      void v10[2] = v8;
      v10[3] = 2 * ((uint64_t)(v11 - 32) / 48);
      int64_t v12 = v10 + 4;
      if (v5)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[6 * v8 + 4]) {
          memmove(v12, a4 + 4, 48 * v8);
        }
        a4[2] = 0;
        goto LABEL_22;
      }
    }
    else
    {
      uint64_t v10 = (void *)MEMORY[0x263F8EE78];
      int64_t v12 = (void *)(MEMORY[0x263F8EE78] + 32);
      if (result) {
        goto LABEL_13;
      }
    }
    sub_25AD02AA0(0, v8, (unint64_t)v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

void *sub_25ACFF954(void *a1, int64_t a2, char a3, void *a4)
{
  return sub_25ACFF97C(a1, a2, a3, a4, &qword_26A4B3540, &qword_26A4B3860);
}

void *sub_25ACFF968(void *a1, int64_t a2, char a3, void *a4)
{
  return sub_25ACFF97C(a1, a2, a3, a4, &qword_26A4B3858, &qword_26A4B31C8);
}

void *sub_25ACFF97C(void *result, int64_t a2, char a3, void *a4, uint64_t *a5, uint64_t *a6)
{
  char v8 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v10 = a2;
    goto LABEL_8;
  }
  unint64_t v9 = a4[3];
  uint64_t v10 = v9 >> 1;
  if ((uint64_t)(v9 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v10 + 0x4000000000000000 >= 0)
  {
    uint64_t v10 = v9 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v9 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      uint64_t v10 = a2;
    }
LABEL_8:
    uint64_t v11 = a4[2];
    if (v10 <= v11) {
      uint64_t v12 = a4[2];
    }
    else {
      uint64_t v12 = v10;
    }
    if (v12)
    {
      __swift_instantiateConcreteTypeFromMangledName(a5);
      uint64_t v13 = (void *)swift_allocObject();
      int64_t v14 = _swift_stdlib_malloc_size(v13);
      uint64_t v15 = v14 - 32;
      if (v14 < 32) {
        uint64_t v15 = v14 - 25;
      }
      v13[2] = v11;
      v13[3] = 2 * (v15 >> 3);
      unint64_t v16 = v13 + 4;
      if (v8) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v13 = (void *)MEMORY[0x263F8EE78];
      unint64_t v16 = (void *)(MEMORY[0x263F8EE78] + 32);
      if (result)
      {
LABEL_15:
        if (v13 != a4 || v16 >= &a4[v11 + 4]) {
          memmove(v16, a4 + 4, 8 * v11);
        }
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_25AD035A0(0, v11, (unint64_t)v16, (uint64_t)a4, a6);
LABEL_24:
    swift_bridgeObjectRelease();
    return v13;
  }
  __break(1u);
  return result;
}

void *sub_25ACFFA98(void *result, int64_t a2, char a3, void *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B37B0);
      uint64_t v10 = (void *)swift_allocObject();
      size_t v11 = _swift_stdlib_malloc_size(v10);
      void v10[2] = v8;
      v10[3] = 2 * ((uint64_t)(v11 - 32) / 24);
      uint64_t v12 = v10 + 4;
      if (v5)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[3 * v8 + 4]) {
          memmove(v12, a4 + 4, 24 * v8);
        }
        a4[2] = 0;
        goto LABEL_22;
      }
    }
    else
    {
      uint64_t v10 = (void *)MEMORY[0x263F8EE78];
      uint64_t v12 = (void *)(MEMORY[0x263F8EE78] + 32);
      if (result) {
        goto LABEL_13;
      }
    }
    sub_25AD02EB8(0, v8, (unint64_t)v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

void *sub_25ACFFBC0(void *result, int64_t a2, char a3, void *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B37F0);
      uint64_t v10 = (void *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 1;
      }
      void v10[2] = v8;
      v10[3] = 2 * (v12 >> 5);
      uint64_t v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = (void *)MEMORY[0x263F8EE78];
      uint64_t v13 = (void *)(MEMORY[0x263F8EE78] + 32);
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[4 * v8 + 4]) {
          memmove(v13, a4 + 4, 32 * v8);
        }
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_25AD02DAC(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

void *sub_25ACFFCD0(void *a1, int64_t a2, char a3, void *a4)
{
  return sub_25ACFF97C(a1, a2, a3, a4, &qword_26A4B34D8, &qword_26A4B37D8);
}

char *sub_25ACFFCE4(char *result, int64_t a2, char a3, char *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B37B8);
      uint64_t v10 = (char *)swift_allocObject();
      size_t v11 = _swift_stdlib_malloc_size(v10);
      *((void *)v10 + 2) = v8;
      *((void *)v10 + 3) = 2 * v11 - 64;
      uint64_t v12 = v10 + 32;
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
      uint64_t v10 = (char *)MEMORY[0x263F8EE78];
      uint64_t v12 = (char *)(MEMORY[0x263F8EE78] + 32);
      if (result) {
        goto LABEL_13;
      }
    }
    sub_25AD033C4(0, v8, v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

void *sub_25ACFFDE0(void *a1, int64_t a2, char a3, void *a4)
{
  return sub_25ACFF97C(a1, a2, a3, a4, &qword_26A4B3798, &qword_26A4B36B0);
}

void *sub_25ACFFDF4(void *result, int64_t a2, char a3, void *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B37A0);
      uint64_t v10 = (void *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 17;
      }
      void v10[2] = v8;
      v10[3] = 2 * (v12 >> 4);
      uint64_t v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = (void *)MEMORY[0x263F8EE78];
      uint64_t v13 = (void *)(MEMORY[0x263F8EE78] + 32);
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
    sub_25AD034AC(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

void *sub_25ACFFF04(void *result, int64_t a2, char a3, void *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B3790);
      uint64_t v10 = (void *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 17;
      }
      void v10[2] = v8;
      v10[3] = 2 * (v12 >> 4);
      uint64_t v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = (void *)MEMORY[0x263F8EE78];
      uint64_t v13 = (void *)(MEMORY[0x263F8EE78] + 32);
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
    sub_25AD031C4(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

void *sub_25AD00014(void *result, int64_t a2, char a3, void *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B37C8);
      uint64_t v10 = (void *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 17;
      }
      void v10[2] = v8;
      v10[3] = 2 * (v12 >> 4);
      uint64_t v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = (void *)MEMORY[0x263F8EE78];
      uint64_t v13 = (void *)(MEMORY[0x263F8EE78] + 32);
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
    sub_25AD032B8(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

void *sub_25AD00124(void *result, int64_t a2, char a3, void *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B3800);
      uint64_t v10 = (void *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 1;
      }
      void v10[2] = v8;
      v10[3] = 2 * (v12 >> 5);
      uint64_t v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = (void *)MEMORY[0x263F8EE78];
      uint64_t v13 = (void *)(MEMORY[0x263F8EE78] + 32);
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[4 * v8 + 4]) {
          memmove(v13, a4 + 4, 32 * v8);
        }
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_25AD0289C(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

void *sub_25AD00234(void *result, int64_t a2, char a3, void *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B37F8);
      uint64_t v10 = (void *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 17;
      }
      void v10[2] = v8;
      v10[3] = 2 * (v12 >> 4);
      uint64_t v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = (void *)MEMORY[0x263F8EE78];
      uint64_t v13 = (void *)(MEMORY[0x263F8EE78] + 32);
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
    sub_25AD027B0(0, v8, (char *)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

void *sub_25AD00344(void *result, int64_t a2, char a3, void *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B3848);
      uint64_t v10 = (void *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 25;
      }
      void v10[2] = v8;
      v10[3] = 2 * (v12 >> 3);
      uint64_t v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = (void *)MEMORY[0x263F8EE78];
      uint64_t v13 = (void *)(MEMORY[0x263F8EE78] + 32);
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[v8 + 4]) {
          memmove(v13, a4 + 4, 8 * v8);
        }
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_25AD02CC0(0, v8, (char *)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

void *sub_25AD00454(void *result, int64_t a2, char a3, void *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B3760);
      uint64_t v10 = (void *)swift_allocObject();
      size_t v11 = _swift_stdlib_malloc_size(v10);
      void v10[2] = v8;
      v10[3] = 2 * ((uint64_t)(v11 - 32) / 208);
      uint64_t v12 = v10 + 4;
      if (v5)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[26 * v8 + 4]) {
          memmove(v12, a4 + 4, 208 * v8);
        }
        a4[2] = 0;
        goto LABEL_22;
      }
    }
    else
    {
      uint64_t v10 = (void *)MEMORY[0x263F8EE78];
      uint64_t v12 = (void *)(MEMORY[0x263F8EE78] + 32);
      if (result) {
        goto LABEL_13;
      }
    }
    sub_25AD0446C(0, v8, (unint64_t)v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_25AD00580(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  unint64_t v4 = a4 >> 1;
  uint64_t v5 = (a4 >> 1) - a3;
  if (!__OFSUB__(a4 >> 1, a3))
  {
    if (!v5) {
      return MEMORY[0x263F8EE78];
    }
    uint64_t v8 = 8 * v5;
    if (v5 <= 0)
    {
      uint64_t v9 = (char *)MEMORY[0x263F8EE78];
      if (v4 != a3)
      {
LABEL_7:
        if (v5 < 0) {
          goto LABEL_19;
        }
        uint64_t v12 = v9 + 32;
        uint64_t v13 = (char *)(a2 + 8 * a3);
        if (v13 < &v9[v8 + 32] && v12 < &v13[v8]) {
          goto LABEL_19;
        }
        memcpy(v12, v13, 8 * v5);
        return (uint64_t)v9;
      }
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B34E0);
      uint64_t v9 = (char *)swift_allocObject();
      int64_t v10 = _swift_stdlib_malloc_size(v9);
      uint64_t v11 = v10 - 32;
      if (v10 < 32) {
        uint64_t v11 = v10 - 25;
      }
      *((void *)v9 + 2) = v5;
      *((void *)v9 + 3) = 2 * (v11 >> 3);
      if (v4 != a3) {
        goto LABEL_7;
      }
    }
    __break(1u);
  }
  __break(1u);
LABEL_19:
  uint64_t result = sub_25AD14980();
  __break(1u);
  return result;
}

void *sub_25AD006EC(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return (void *)MEMORY[0x263F8EE78];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B3790);
  uint64_t v3 = (void *)swift_allocObject();
  int64_t v4 = _swift_stdlib_malloc_size(v3);
  uint64_t v5 = v4 - 32;
  if (v4 < 32) {
    uint64_t v5 = v4 - 17;
  }
  v3[2] = v1;
  v3[3] = 2 * (v5 >> 4);
  uint64_t v6 = sub_25AD021BC((uint64_t)&v8, v3 + 4, v1, a1);
  swift_bridgeObjectRetain();
  sub_25AD07A28();
  if (v6 != v1)
  {
    __break(1u);
    return (void *)MEMORY[0x263F8EE78];
  }
  return v3;
}

uint64_t sub_25AD007D4(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = *v3;
  sub_25AD14B70();
  swift_bridgeObjectRetain();
  sub_25AD14570();
  uint64_t v8 = sub_25AD14B90();
  uint64_t v9 = -1 << *(unsigned char *)(v7 + 32);
  unint64_t v10 = v8 & ~v9;
  if ((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10))
  {
    uint64_t v11 = *(void *)(v7 + 48);
    uint64_t v12 = (void *)(v11 + 16 * v10);
    BOOL v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (sub_25AD14AF0() & 1) != 0)
    {
LABEL_7:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      int64_t v14 = (uint64_t *)(*(void *)(*v3 + 48) + 16 * v10);
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
      char v18 = (void *)(v11 + 16 * v10);
      BOOL v19 = *v18 == a2 && v18[1] == a3;
      if (v19 || (sub_25AD14AF0() & 1) != 0) {
        goto LABEL_7;
      }
    }
  }
  swift_bridgeObjectRelease();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v21 = *v3;
  *uint64_t v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_25AD01FC8(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  *uint64_t v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t sub_25AD00984(uint64_t result)
{
  if (!*(void *)(*(void *)v1 + 16)) {
    return result;
  }
  uint64_t v2 = result;
  uint64_t v3 = result + 56;
  uint64_t v4 = 1 << *(unsigned char *)(result + 32);
  uint64_t v5 = -1;
  if (v4 < 64) {
    uint64_t v5 = ~(-1 << v4);
  }
  unint64_t v6 = v5 & *(void *)(result + 56);
  int64_t v7 = (unint64_t)(v4 + 63) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v8 = 0;
  while (1)
  {
    if (v6)
    {
      unint64_t v9 = __clz(__rbit64(v6));
      v6 &= v6 - 1;
      unint64_t v10 = v9 | (v8 << 6);
      goto LABEL_6;
    }
    int64_t v14 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
      __break(1u);
LABEL_29:
      __break(1u);
      return result;
    }
    if (v14 >= v7) {
      goto LABEL_24;
    }
    unint64_t v15 = *(void *)(v3 + 8 * v14);
    ++v8;
    if (!v15)
    {
      int64_t v8 = v14 + 1;
      if (v14 + 1 >= v7) {
        goto LABEL_24;
      }
      unint64_t v15 = *(void *)(v3 + 8 * v8);
      if (!v15)
      {
        int64_t v8 = v14 + 2;
        if (v14 + 2 >= v7) {
          goto LABEL_24;
        }
        unint64_t v15 = *(void *)(v3 + 8 * v8);
        if (!v15)
        {
          int64_t v8 = v14 + 3;
          if (v14 + 3 >= v7) {
            goto LABEL_24;
          }
          unint64_t v15 = *(void *)(v3 + 8 * v8);
          if (!v15) {
            break;
          }
        }
      }
    }
LABEL_23:
    unint64_t v6 = (v15 - 1) & v15;
    unint64_t v10 = __clz(__rbit64(v15)) + (v8 << 6);
LABEL_6:
    uint64_t v11 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v10);
    uint64_t v12 = *v11;
    uint64_t v13 = v11[1];
    swift_bridgeObjectRetain();
    sub_25AD00F9C(v12, v13);
    swift_bridgeObjectRelease();
    uint64_t result = swift_bridgeObjectRelease();
  }
  int64_t v16 = v14 + 4;
  if (v16 < v7)
  {
    unint64_t v15 = *(void *)(v3 + 8 * v16);
    if (!v15)
    {
      while (1)
      {
        int64_t v8 = v16 + 1;
        if (__OFADD__(v16, 1)) {
          goto LABEL_29;
        }
        if (v8 >= v7) {
          goto LABEL_24;
        }
        unint64_t v15 = *(void *)(v3 + 8 * v8);
        ++v16;
        if (v15) {
          goto LABEL_23;
        }
      }
    }
    int64_t v8 = v16;
    goto LABEL_23;
  }
LABEL_24:
  return swift_release();
}

uint64_t sub_25AD00B2C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a2;
  uint64_t v43 = *MEMORY[0x263EF8340];
  if (*(void *)(a2 + 16))
  {
    uint64_t v4 = *(void *)(a1 + 56);
    uint64_t v37 = a1 + 56;
    uint64_t v5 = -1 << *(unsigned char *)(a1 + 32);
    uint64_t v35 = ~v5;
    if (-v5 < 64) {
      uint64_t v6 = ~(-1 << -(char)v5);
    }
    else {
      uint64_t v6 = -1;
    }
    unint64_t v7 = v6 & v4;
    int64_t v36 = (unint64_t)(63 - v5) >> 6;
    uint64_t v8 = a2 + 56;
    swift_bridgeObjectRetain();
    int64_t v9 = 0;
    while (1)
    {
      if (v7)
      {
        unint64_t v10 = __clz(__rbit64(v7));
        v7 &= v7 - 1;
        unint64_t v11 = v10 | (v9 << 6);
      }
      else
      {
        int64_t v12 = v9 + 1;
        if (__OFADD__(v9, 1))
        {
          __break(1u);
          goto LABEL_49;
        }
        if (v12 >= v36) {
          goto LABEL_47;
        }
        unint64_t v13 = *(void *)(v37 + 8 * v12);
        int64_t v14 = v9 + 1;
        if (!v13)
        {
          int64_t v14 = v9 + 2;
          if (v9 + 2 >= v36) {
            goto LABEL_47;
          }
          unint64_t v13 = *(void *)(v37 + 8 * v14);
          if (!v13)
          {
            int64_t v14 = v9 + 3;
            if (v9 + 3 >= v36) {
              goto LABEL_47;
            }
            unint64_t v13 = *(void *)(v37 + 8 * v14);
            if (!v13)
            {
              int64_t v14 = v9 + 4;
              if (v9 + 4 >= v36) {
                goto LABEL_47;
              }
              unint64_t v13 = *(void *)(v37 + 8 * v14);
              if (!v13)
              {
                int64_t v15 = v9 + 5;
                if (v9 + 5 >= v36)
                {
LABEL_47:
                  sub_25AD07A28();
                  return v2;
                }
                unint64_t v13 = *(void *)(v37 + 8 * v15);
                if (!v13)
                {
                  while (1)
                  {
                    int64_t v14 = v15 + 1;
                    if (__OFADD__(v15, 1)) {
                      break;
                    }
                    if (v14 >= v36) {
                      goto LABEL_47;
                    }
                    unint64_t v13 = *(void *)(v37 + 8 * v14);
                    ++v15;
                    if (v13) {
                      goto LABEL_24;
                    }
                  }
LABEL_49:
                  __break(1u);
                }
                int64_t v14 = v9 + 5;
              }
            }
          }
        }
LABEL_24:
        unint64_t v7 = (v13 - 1) & v13;
        unint64_t v11 = __clz(__rbit64(v13)) + (v14 << 6);
        int64_t v9 = v14;
      }
      int64_t v16 = (uint64_t *)(*(void *)(a1 + 48) + 16 * v11);
      uint64_t v18 = *v16;
      uint64_t v17 = v16[1];
      sub_25AD14B70();
      swift_bridgeObjectRetain();
      sub_25AD14570();
      uint64_t v19 = sub_25AD14B90();
      uint64_t v20 = -1 << *(unsigned char *)(v2 + 32);
      unint64_t v21 = v19 & ~v20;
      if ((*(void *)(v8 + ((v21 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v21)) {
        break;
      }
LABEL_6:
      swift_bridgeObjectRelease();
    }
    uint64_t v22 = *(void *)(v2 + 48);
    uint64_t v23 = (void *)(v22 + 16 * v21);
    BOOL v24 = *v23 == v18 && v23[1] == v17;
    if (v24 || (sub_25AD14AF0() & 1) != 0)
    {
      uint64_t isStackAllocationSafe = swift_bridgeObjectRelease();
      uint64_t v38 = a1;
      uint64_t v39 = v37;
      uint64_t v40 = v35;
      int64_t v41 = v9;
      unint64_t v42 = v7;
    }
    else
    {
      uint64_t v25 = ~v20;
      do
      {
        unint64_t v21 = (v21 + 1) & v25;
        if (((*(void *)(v8 + ((v21 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v21) & 1) == 0) {
          goto LABEL_6;
        }
        unint64_t v26 = (void *)(v22 + 16 * v21);
        BOOL v27 = *v26 == v18 && v26[1] == v17;
      }
      while (!v27 && (sub_25AD14AF0() & 1) == 0);
      uint64_t v38 = a1;
      uint64_t v39 = v37;
      uint64_t v40 = v35;
      int64_t v41 = v9;
      unint64_t v42 = v7;
      uint64_t isStackAllocationSafe = swift_bridgeObjectRelease();
    }
    char v29 = *(unsigned char *)(v2 + 32);
    unint64_t v30 = (unint64_t)((1 << v29) + 63) >> 6;
    size_t v31 = 8 * v30;
    if ((v29 & 0x3Fu) < 0xE
      || (uint64_t isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), isStackAllocationSafe))
    {
      MEMORY[0x270FA5388](isStackAllocationSafe);
      memcpy((char *)&v35 - ((v31 + 15) & 0x3FFFFFFFFFFFFFF0), (const void *)(v2 + 56), v31);
      uint64_t v32 = sub_25AD0140C((uint64_t)&v35 - ((v31 + 15) & 0x3FFFFFFFFFFFFFF0), v30, v2, v21, &v38);
      swift_release();
      sub_25AD07A28();
    }
    else
    {
      uint64_t v33 = (void *)swift_slowAlloc();
      memcpy(v33, (const void *)(v2 + 56), v31);
      uint64_t v32 = sub_25AD0140C((uint64_t)v33, v30, v2, v21, &v38);
      swift_release();
      sub_25AD07A28();
      MEMORY[0x261155570](v33, -1, -1);
    }
    return v32;
  }
  else
  {
    swift_release();
    return MEMORY[0x263F8EE88];
  }
}

uint64_t sub_25AD00F9C(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *v2;
  sub_25AD14B70();
  swift_bridgeObjectRetain();
  sub_25AD14570();
  uint64_t v6 = sub_25AD14B90();
  uint64_t v7 = -1 << *(unsigned char *)(v5 + 32);
  unint64_t v8 = v6 & ~v7;
  if (((*(void *)(v5 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8) & 1) == 0)
  {
LABEL_18:
    swift_bridgeObjectRelease();
    return 0;
  }
  uint64_t v9 = *(void *)(v5 + 48);
  unint64_t v10 = (void *)(v9 + 16 * v8);
  BOOL v11 = *v10 == a1 && v10[1] == a2;
  if (!v11 && (sub_25AD14AF0() & 1) == 0)
  {
    uint64_t v15 = ~v7;
    do
    {
      unint64_t v8 = (v8 + 1) & v15;
      if (((*(void *)(v5 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8) & 1) == 0) {
        goto LABEL_18;
      }
      int64_t v16 = (void *)(v9 + 16 * v8);
      BOOL v17 = *v16 == a1 && v16[1] == a2;
    }
    while (!v17 && (sub_25AD14AF0() & 1) == 0);
  }
  swift_bridgeObjectRelease();
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v13 = *v2;
  uint64_t v19 = *v2;
  *uint64_t v2 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_25AD0199C();
    uint64_t v13 = v19;
  }
  uint64_t v14 = *(void *)(*(void *)(v13 + 48) + 16 * v8);
  sub_25AD01E00(v8);
  *uint64_t v2 = v19;
  swift_bridgeObjectRelease();
  return v14;
}

uint64_t sub_25AD0112C()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B3788);
  uint64_t v3 = sub_25AD14830();
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
    while (1)
    {
      if (v7)
      {
        unint64_t v14 = __clz(__rbit64(v7));
        v7 &= v7 - 1;
        unint64_t v15 = v14 | (v11 << 6);
      }
      else
      {
        int64_t v16 = v11 + 1;
        if (__OFADD__(v11, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v16 >= v8) {
          goto LABEL_33;
        }
        unint64_t v17 = v30[v16];
        ++v11;
        if (!v17)
        {
          int64_t v11 = v16 + 1;
          if (v16 + 1 >= v8) {
            goto LABEL_33;
          }
          unint64_t v17 = v30[v11];
          if (!v17)
          {
            int64_t v11 = v16 + 2;
            if (v16 + 2 >= v8) {
              goto LABEL_33;
            }
            unint64_t v17 = v30[v11];
            if (!v17)
            {
              int64_t v18 = v16 + 3;
              if (v18 >= v8)
              {
LABEL_33:
                swift_release();
                uint64_t v1 = v0;
                uint64_t v29 = 1 << *(unsigned char *)(v2 + 32);
                if (v29 > 63) {
                  bzero(v30, ((unint64_t)(v29 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *unint64_t v30 = -1 << v29;
                }
                *(void *)(v2 + 16) = 0;
                break;
              }
              unint64_t v17 = v30[v18];
              if (!v17)
              {
                while (1)
                {
                  int64_t v11 = v18 + 1;
                  if (__OFADD__(v18, 1)) {
                    goto LABEL_39;
                  }
                  if (v11 >= v8) {
                    goto LABEL_33;
                  }
                  unint64_t v17 = v30[v11];
                  ++v18;
                  if (v17) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v11 = v18;
            }
          }
        }
LABEL_23:
        unint64_t v7 = (v17 - 1) & v17;
        unint64_t v15 = __clz(__rbit64(v17)) + (v11 << 6);
      }
      uint64_t v19 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
      uint64_t v20 = *v19;
      uint64_t v21 = v19[1];
      sub_25AD14B70();
      sub_25AD14570();
      uint64_t result = sub_25AD14B90();
      uint64_t v22 = -1 << *(unsigned char *)(v4 + 32);
      unint64_t v23 = result & ~v22;
      unint64_t v24 = v23 >> 6;
      if (((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6))) != 0)
      {
        unint64_t v12 = __clz(__rbit64((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v25 = 0;
        unint64_t v26 = (unint64_t)(63 - v22) >> 6;
        do
        {
          if (++v24 == v26 && (v25 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          BOOL v27 = v24 == v26;
          if (v24 == v26) {
            unint64_t v24 = 0;
          }
          v25 |= v27;
          uint64_t v28 = *(void *)(v9 + 8 * v24);
        }
        while (v28 == -1);
        unint64_t v12 = __clz(__rbit64(~v28)) + (v24 << 6);
      }
      *(void *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
      uint64_t v13 = (void *)(*(void *)(v4 + 48) + 16 * v12);
      *uint64_t v13 = v20;
      v13[1] = v21;
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = swift_release();
  uint64_t *v1 = v4;
  return result;
}

uint64_t sub_25AD0140C(uint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, void *a5)
{
  uint64_t v7 = *(void *)(a3 + 16);
  uint64_t v39 = (unint64_t *)result;
  *(void *)(result + ((a4 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << a4) - 1;
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
          goto LABEL_16;
        }
        int64_t v13 = v9 + 1;
        if (__OFADD__(v9, 1))
        {
          __break(1u);
          goto LABEL_47;
        }
        int64_t v14 = (unint64_t)(a5[2] + 64) >> 6;
        int64_t v15 = a5[3];
        if (v13 >= v14) {
          goto LABEL_45;
        }
        uint64_t v16 = a5[1];
        unint64_t v17 = *(void *)(v16 + 8 * v13);
        if (!v17)
        {
          int64_t v18 = v9 + 2;
          int64_t v15 = v9 + 1;
          if (v9 + 2 >= v14) {
            goto LABEL_45;
          }
          unint64_t v17 = *(void *)(v16 + 8 * v18);
          if (!v17)
          {
            int64_t v15 = v9 + 2;
            if (v9 + 3 >= v14) {
              goto LABEL_45;
            }
            unint64_t v17 = *(void *)(v16 + 8 * (v9 + 3));
            if (v17)
            {
              int64_t v13 = v9 + 3;
              goto LABEL_15;
            }
            int64_t v18 = v9 + 4;
            int64_t v15 = v9 + 3;
            if (v9 + 4 >= v14) {
              goto LABEL_45;
            }
            unint64_t v17 = *(void *)(v16 + 8 * v18);
            if (!v17)
            {
              int64_t v13 = v9 + 5;
              int64_t v15 = v9 + 4;
              if (v9 + 5 >= v14) {
                goto LABEL_45;
              }
              unint64_t v17 = *(void *)(v16 + 8 * v13);
              if (!v17)
              {
                int64_t v15 = v14 - 1;
                int64_t v36 = v9 + 6;
                while (v14 != v36)
                {
                  unint64_t v17 = *(void *)(v16 + 8 * v36++);
                  if (v17)
                  {
                    int64_t v13 = v36 - 1;
                    goto LABEL_15;
                  }
                }
LABEL_45:
                a5[3] = v15;
                a5[4] = 0;
                swift_retain();
                return sub_25AD01704(v39, a2, v38, a3);
              }
              goto LABEL_15;
            }
          }
          int64_t v13 = v18;
        }
LABEL_15:
        uint64_t v11 = (v17 - 1) & v17;
        unint64_t v12 = __clz(__rbit64(v17)) + (v13 << 6);
        int64_t v9 = v13;
LABEL_16:
        uint64_t v19 = (uint64_t *)(*(void *)(*a5 + 48) + 16 * v12);
        uint64_t v21 = *v19;
        uint64_t v20 = v19[1];
        a5[3] = v9;
        a5[4] = v11;
        sub_25AD14B70();
        swift_bridgeObjectRetain();
        sub_25AD14570();
        uint64_t v22 = sub_25AD14B90();
        uint64_t v23 = -1 << *(unsigned char *)(a3 + 32);
        unint64_t v24 = v22 & ~v23;
        unint64_t v25 = v24 >> 6;
        uint64_t v26 = 1 << v24;
        if (((1 << v24) & *(void *)(v40 + 8 * (v24 >> 6))) == 0) {
          goto LABEL_3;
        }
        uint64_t v27 = *(void *)(a3 + 48);
        uint64_t v28 = (void *)(v27 + 16 * v24);
        BOOL v29 = *v28 == v21 && v28[1] == v20;
        if (v29 || (sub_25AD14AF0() & 1) != 0) {
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
          if (v35 || (sub_25AD14AF0() & 1) != 0)
          {
            uint64_t result = swift_bridgeObjectRelease();
            unint64_t v25 = v33 >> 6;
            uint64_t v26 = 1 << v33;
            goto LABEL_23;
          }
        }
LABEL_3:
        uint64_t result = swift_bridgeObjectRelease();
      }
      uint64_t result = swift_bridgeObjectRelease();
LABEL_23:
      unint64_t v30 = v39[v25];
      v39[v25] = v30 & ~v26;
    }
    while ((v26 & v30) == 0);
    uint64_t v8 = v38 - 1;
    if (__OFSUB__(v38, 1))
    {
LABEL_47:
      __break(1u);
      return result;
    }
    if (v38 != 1) {
      continue;
    }
    return MEMORY[0x263F8EE88];
  }
}

uint64_t sub_25AD01704(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = a4;
  if (!a3)
  {
    uint64_t v8 = MEMORY[0x263F8EE88];
LABEL_36:
    swift_release();
    return v8;
  }
  uint64_t v5 = a3;
  if (*(void *)(a4 + 16) == a3) {
    return v4;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B3788);
  uint64_t result = sub_25AD14840();
  uint64_t v8 = result;
  uint64_t v30 = a2;
  if (a2 < 1) {
    unint64_t v9 = 0;
  }
  else {
    unint64_t v9 = *a1;
  }
  uint64_t v10 = 0;
  uint64_t v11 = result + 56;
  while (1)
  {
    if (v9)
    {
      unint64_t v12 = __clz(__rbit64(v9));
      v9 &= v9 - 1;
      unint64_t v13 = v12 | (v10 << 6);
      goto LABEL_24;
    }
    uint64_t v14 = v10 + 1;
    if (__OFADD__(v10, 1)) {
      goto LABEL_39;
    }
    if (v14 >= v30) {
      goto LABEL_36;
    }
    unint64_t v15 = a1[v14];
    ++v10;
    if (!v15)
    {
      uint64_t v10 = v14 + 1;
      if (v14 + 1 >= v30) {
        goto LABEL_36;
      }
      unint64_t v15 = a1[v10];
      if (!v15)
      {
        uint64_t v10 = v14 + 2;
        if (v14 + 2 >= v30) {
          goto LABEL_36;
        }
        unint64_t v15 = a1[v10];
        if (!v15) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v9 = (v15 - 1) & v15;
    unint64_t v13 = __clz(__rbit64(v15)) + (v10 << 6);
LABEL_24:
    unint64_t v17 = (uint64_t *)(*(void *)(v4 + 48) + 16 * v13);
    uint64_t v18 = *v17;
    uint64_t v19 = v17[1];
    sub_25AD14B70();
    swift_bridgeObjectRetain();
    sub_25AD14570();
    uint64_t result = sub_25AD14B90();
    uint64_t v20 = -1 << *(unsigned char *)(v8 + 32);
    unint64_t v21 = result & ~v20;
    unint64_t v22 = v21 >> 6;
    if (((-1 << v21) & ~*(void *)(v11 + 8 * (v21 >> 6))) != 0)
    {
      unint64_t v23 = __clz(__rbit64((-1 << v21) & ~*(void *)(v11 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v24 = 0;
      unint64_t v25 = (unint64_t)(63 - v20) >> 6;
      do
      {
        if (++v22 == v25 && (v24 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }
        BOOL v26 = v22 == v25;
        if (v22 == v25) {
          unint64_t v22 = 0;
        }
        v24 |= v26;
        uint64_t v27 = *(void *)(v11 + 8 * v22);
      }
      while (v27 == -1);
      unint64_t v23 = __clz(__rbit64(~v27)) + (v22 << 6);
    }
    *(void *)(v11 + ((v23 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v23;
    uint64_t v28 = (void *)(*(void *)(v8 + 48) + 16 * v23);
    *uint64_t v28 = v18;
    v28[1] = v19;
    ++*(void *)(v8 + 16);
    if (__OFSUB__(v5--, 1))
    {
LABEL_38:
      __break(1u);
LABEL_39:
      __break(1u);
      goto LABEL_40;
    }
    if (!v5) {
      goto LABEL_36;
    }
  }
  uint64_t v16 = v14 + 3;
  if (v16 >= v30) {
    goto LABEL_36;
  }
  unint64_t v15 = a1[v16];
  if (v15)
  {
    uint64_t v10 = v16;
    goto LABEL_23;
  }
  while (1)
  {
    uint64_t v10 = v16 + 1;
    if (__OFADD__(v16, 1)) {
      break;
    }
    if (v10 >= v30) {
      goto LABEL_36;
    }
    unint64_t v15 = a1[v10];
    ++v16;
    if (v15) {
      goto LABEL_23;
    }
  }
LABEL_40:
  __break(1u);
  return result;
}

void *sub_25AD0199C()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B3788);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_25AD14820();
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
    unint64_t v17 = (void *)(*(void *)(v2 + 48) + v16);
    uint64_t v18 = v17[1];
    uint64_t v19 = (void *)(*(void *)(v4 + 48) + v16);
    *uint64_t v19 = *v17;
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

uint64_t sub_25AD01B50()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B3788);
  uint64_t v3 = sub_25AD14830();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
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
  while (1)
  {
    if (v8)
    {
      unint64_t v14 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      unint64_t v15 = v14 | (v11 << 6);
      goto LABEL_24;
    }
    int64_t v16 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v16 >= v29) {
      goto LABEL_33;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v16);
    ++v11;
    if (!v17)
    {
      int64_t v11 = v16 + 1;
      if (v16 + 1 >= v29) {
        goto LABEL_33;
      }
      unint64_t v17 = *(void *)(v6 + 8 * v11);
      if (!v17)
      {
        int64_t v11 = v16 + 2;
        if (v16 + 2 >= v29) {
          goto LABEL_33;
        }
        unint64_t v17 = *(void *)(v6 + 8 * v11);
        if (!v17) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v8 = (v17 - 1) & v17;
    unint64_t v15 = __clz(__rbit64(v17)) + (v11 << 6);
LABEL_24:
    uint64_t v19 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v20 = *v19;
    uint64_t v21 = v19[1];
    sub_25AD14B70();
    swift_bridgeObjectRetain();
    sub_25AD14570();
    uint64_t result = sub_25AD14B90();
    uint64_t v22 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v23 = result & ~v22;
    unint64_t v24 = v23 >> 6;
    if (((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6))) != 0)
    {
      unint64_t v12 = __clz(__rbit64((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v25 = 0;
      unint64_t v26 = (unint64_t)(63 - v22) >> 6;
      do
      {
        if (++v24 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        BOOL v27 = v24 == v26;
        if (v24 == v26) {
          unint64_t v24 = 0;
        }
        v25 |= v27;
        uint64_t v28 = *(void *)(v9 + 8 * v24);
      }
      while (v28 == -1);
      unint64_t v12 = __clz(__rbit64(~v28)) + (v24 << 6);
    }
    *(void *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
    int64_t v13 = (void *)(*(void *)(v4 + 48) + 16 * v12);
    *int64_t v13 = v20;
    v13[1] = v21;
    ++*(void *)(v4 + 16);
  }
  int64_t v18 = v16 + 3;
  if (v18 >= v29)
  {
LABEL_33:
    uint64_t result = swift_release_n();
    uint64_t v1 = v0;
    goto LABEL_35;
  }
  unint64_t v17 = *(void *)(v6 + 8 * v18);
  if (v17)
  {
    int64_t v11 = v18;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v11 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v11 >= v29) {
      goto LABEL_33;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v11);
    ++v18;
    if (v17) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

unint64_t sub_25AD01E00(unint64_t result)
{
  int64_t v2 = result;
  uint64_t v3 = *v1;
  uint64_t v4 = *v1 + 56;
  uint64_t v5 = -1 << *(unsigned char *)(*v1 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(v4 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    swift_retain();
    uint64_t v8 = sub_25AD14810();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v9 = (v8 + 1) & v7;
      do
      {
        sub_25AD14B70();
        swift_bridgeObjectRetain();
        sub_25AD14570();
        uint64_t v10 = sub_25AD14B90();
        swift_bridgeObjectRelease();
        unint64_t v11 = v10 & v7;
        if (v2 >= (uint64_t)v9)
        {
          if (v11 < v9) {
            goto LABEL_5;
          }
        }
        else if (v11 >= v9)
        {
          goto LABEL_11;
        }
        if (v2 >= (uint64_t)v11)
        {
LABEL_11:
          uint64_t v12 = *(void *)(v3 + 48);
          int64_t v13 = (_OWORD *)(v12 + 16 * v2);
          unint64_t v14 = (_OWORD *)(v12 + 16 * v6);
          if (v2 != v6 || (int64_t v2 = v6, v13 >= v14 + 1))
          {
            *int64_t v13 = *v14;
            int64_t v2 = v6;
          }
        }
LABEL_5:
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    *(void *)(v4 + (((unint64_t)v2 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << v2) - 1;
    uint64_t result = swift_release();
  }
  else
  {
    *(void *)(v4 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << result) - 1;
  }
  uint64_t v15 = *(void *)(v3 + 16);
  BOOL v16 = __OFSUB__(v15, 1);
  uint64_t v17 = v15 - 1;
  if (v16)
  {
    __break(1u);
  }
  else
  {
    *(void *)(v3 + 16) = v17;
    ++*(_DWORD *)(v3 + 36);
  }
  return result;
}

uint64_t sub_25AD01FC8(uint64_t result, uint64_t a2, unint64_t a3, char a4)
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
    sub_25AD0112C();
  }
  else
  {
    if (v10 > v9)
    {
      uint64_t result = (uint64_t)sub_25AD0199C();
      goto LABEL_22;
    }
    sub_25AD01B50();
  }
  uint64_t v11 = *v4;
  sub_25AD14B70();
  sub_25AD14570();
  uint64_t result = sub_25AD14B90();
  uint64_t v12 = -1 << *(unsigned char *)(v11 + 32);
  a3 = result & ~v12;
  uint64_t v13 = v11 + 56;
  if ((*(void *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3))
  {
    uint64_t v14 = *(void *)(v11 + 48);
    uint64_t v15 = (void *)(v14 + 16 * a3);
    BOOL v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (uint64_t result = sub_25AD14AF0(), (result & 1) != 0))
    {
LABEL_21:
      uint64_t result = sub_25AD14B10();
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
        int64_t v18 = (void *)(v14 + 16 * a3);
        if (*v18 != v8 || v18[1] != a2)
        {
          uint64_t result = sub_25AD14AF0();
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
  uint64_t v21 = (uint64_t *)(*(void *)(v20 + 48) + 16 * a3);
  *uint64_t v21 = v8;
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

uint64_t sub_25AD02164(void *a1, void *a2)
{
  if (*a1 == *a2 && a1[1] == a2[1]) {
    return 1;
  }
  else {
    return sub_25AD14AF0() & 1;
  }
}

uint64_t sub_25AD021BC(uint64_t result, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = (void *)result;
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
    *uint64_t v5 = a4;
    v5[1] = v6;
    void v5[2] = ~v7;
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

uint64_t sub_25AD023BC(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 32 * a1 + 32;
    unint64_t v6 = a3 + 32 * v4;
    if (v5 >= v6 || v5 + 32 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_25AD14980();
  __break(1u);
  return result;
}

uint64_t sub_25AD024B0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  int64_t v3 = *(void *)(a1 + 16);
  uint64_t v4 = MEMORY[0x263F8EE78];
  if (v3)
  {
    uint64_t v42 = MEMORY[0x263F8EE78];
    sub_25AD0FDD0(0, v3, 0);
    uint64_t v4 = v42;
    unint64_t v6 = (uint64_t *)(a1 + 64);
    while (1)
    {
      int64_t v38 = v3;
      uint64_t v8 = *(v6 - 4);
      uint64_t v7 = *(v6 - 3);
      uint64_t v9 = *(v6 - 1);
      uint64_t v10 = v6[1];
      uint64_t v34 = *v6;
      uint64_t v35 = *(v6 - 2);
      uint64_t v11 = v6[3];
      uint64_t v36 = v6[4];
      uint64_t v37 = v6[2];
      uint64_t v12 = v6[7];
      uint64_t v32 = v6[8];
      uint64_t v33 = v6[6];
      uint64_t v13 = *(void *)(a2 + 16);
      uint64_t v40 = v6[5];
      swift_bridgeObjectRetain();
      uint64_t v39 = v12;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      uint64_t v41 = v9;
      if (!v13)
      {
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        goto LABEL_11;
      }
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      uint64_t v14 = v10;
      swift_bridgeObjectRetain();
      uint64_t v15 = v11;
      swift_bridgeObjectRetain();
      unint64_t v16 = sub_25AD0A230(v8, v7);
      if ((v17 & 1) == 0) {
        break;
      }
      uint64_t v31 = v8;
      unint64_t v18 = (uint64_t *)(*(void *)(a2 + 56) + 16 * v16);
      uint64_t v20 = *v18;
      uint64_t v19 = v18[1];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      unint64_t v22 = *(void *)(v4 + 16);
      unint64_t v21 = *(void *)(v4 + 24);
      uint64_t v23 = v4;
      if (v22 >= v21 >> 1)
      {
        sub_25AD0FDD0(v21 > 1, v22 + 1, 1);
        uint64_t v23 = v4;
      }
      *(void *)(v23 + 16) = v22 + 1;
      uint64_t v24 = (void *)(v23 + 120 * v22);
      v24[4] = v31;
      v24[5] = v7;
      v24[6] = v35;
      v24[7] = v41;
      unsigned char v24[8] = v34;
      v24[9] = v14;
      v24[10] = v33;
      v24[11] = v39;
      v24[12] = v32;
      v24[13] = v37;
      v24[14] = v15;
      v24[15] = v36;
      v24[16] = v40;
      v24[17] = v20;
      v6 += 13;
      v24[18] = v19;
      int64_t v3 = v38 - 1;
      uint64_t v4 = v23;
      if (v38 == 1) {
        return v4;
      }
    }
    swift_bridgeObjectRelease();
LABEL_11:
    uint64_t v26 = *a3;
    uint64_t v25 = a3[1];
    swift_bridgeObjectRetain();
    sub_25AD14860();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    sub_25AD145A0();
    swift_bridgeObjectRelease();
    sub_25AD07A30();
    swift_allocError();
    *(void *)uint64_t v27 = v26;
    *(void *)(v27 + 8) = v25;
    *(void *)(v27 + 16) = 0xD000000000000017;
    *(void *)(v27 + 24) = 0x800000025AD19250;
    *(void *)(v27 + 32) = 0;
    *(void *)(v27 + 40) = 0;
    *(void *)(v27 + 48) = 0;
    *(void *)(v27 + 56) = 0x8000000000000000;
    *(_OWORD *)(v27 + 64) = 0u;
    *(_OWORD *)(v27 + 80) = 0u;
    swift_willThrow();
    swift_release();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return v4;
}

char *sub_25AD027B0(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = (char *)(a4 + 16 * a1 + 32);
    size_t v6 = 16 * v4;
    uint64_t v7 = &__dst[v6];
    if (v5 >= &__dst[v6] || &v5[v6] <= __dst)
    {
      memcpy(__dst, v5, v6);
      return v7;
    }
  }
  uint64_t result = (char *)sub_25AD14980();
  __break(1u);
  return result;
}

uint64_t sub_25AD0289C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 32 * a1 + 32;
    unint64_t v6 = a3 + 32 * v4;
    if (v5 >= v6 || v5 + 32 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_25AD14980();
  __break(1u);
  return result;
}

uint64_t sub_25AD02990(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 48 * a1 + 32;
    unint64_t v6 = a3 + 48 * v4;
    if (v5 >= v6 || v5 + 48 * v4 <= a3)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B3878);
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_25AD14980();
  __break(1u);
  return result;
}

uint64_t sub_25AD02AA0(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 48 * a1 + 32;
    unint64_t v6 = a3 + 48 * v4;
    if (v5 >= v6 || v5 + 48 * v4 <= a3)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B3548);
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_25AD14980();
  __break(1u);
  return result;
}

uint64_t sub_25AD02BB0(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 24 * a1 + 32;
    unint64_t v6 = a3 + 24 * v4;
    if (v5 >= v6 || v5 + 24 * v4 <= a3)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B37E8);
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_25AD14980();
  __break(1u);
  return result;
}

char *sub_25AD02CC0(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = (char *)(a4 + 8 * a1 + 32);
    size_t v6 = 8 * v4;
    uint64_t v7 = &__dst[v6];
    if (v5 >= &__dst[v6] || &v5[v6] <= __dst)
    {
      memcpy(__dst, v5, v6);
      return v7;
    }
  }
  uint64_t result = (char *)sub_25AD14980();
  __break(1u);
  return result;
}

uint64_t sub_25AD02DAC(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 32 * a1 + 32;
    unint64_t v6 = a3 + 32 * v4;
    if (v5 >= v6 || v5 + 32 * v4 <= a3)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B34F0);
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_25AD14980();
  __break(1u);
  return result;
}

uint64_t sub_25AD02EB8(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 24 * a1 + 32;
    unint64_t v6 = a3 + 24 * v4;
    if (v5 >= v6 || v5 + 24 * v4 <= a3)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B37A8);
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_25AD14980();
  __break(1u);
  return result;
}

uint64_t sub_25AD02FC8(uint64_t a1, uint64_t a2)
{
  uint64_t v15 = *(void *)(a1 + 16);
  if (v15)
  {
    uint64_t v2 = 0;
    uint64_t v16 = a1 + 32;
    while (1)
    {
      uint64_t v3 = v16 + 24 * v2;
      uint64_t v4 = *(void **)v3;
      uint64_t v5 = *(void *)(*(void *)v3 + 16);
      if (v5)
      {
        uint64_t v6 = *(void *)(a2 + 16);
        uint64_t v7 = *(void *)(a2 + 24);
        BOOL v8 = v4[4] == v6 && v4[5] == v7;
        if (v8 || (uint64_t result = sub_25AD14AF0(), (result & 1) != 0))
        {
LABEL_20:
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          return (uint64_t)v4;
        }
        if (v5 != 1) {
          break;
        }
      }
LABEL_3:
      if (++v2 == v15) {
        return 0;
      }
    }
    uint64_t v10 = v4 + 7;
    uint64_t v11 = 1;
    while (1)
    {
      uint64_t v12 = v11 + 1;
      if (__OFADD__(v11, 1)) {
        break;
      }
      if (*(v10 - 1) == v6 && *v10 == v7) {
        goto LABEL_20;
      }
      uint64_t result = sub_25AD14AF0();
      if (result) {
        goto LABEL_20;
      }
      v10 += 2;
      ++v11;
      if (v12 == v5) {
        goto LABEL_3;
      }
    }
    __break(1u);
  }
  else
  {
    return 0;
  }
  return result;
}

uint64_t sub_25AD0312C(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t result = sub_25AD146F0();
  uint64_t v8 = result;
  if (v2)
  {
    uint64_t v4 = (uint64_t *)(a1 + 40);
    do
    {
      uint64_t v5 = *(v4 - 1);
      uint64_t v6 = *v4;
      swift_bridgeObjectRetain();
      sub_25AD007D4(&v7, v5, v6);
      swift_bridgeObjectRelease();
      v4 += 2;
      --v2;
    }
    while (v2);
    return v8;
  }
  return result;
}

uint64_t sub_25AD031C4(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
      return v6;
    }
  }
  uint64_t result = sub_25AD14980();
  __break(1u);
  return result;
}

uint64_t sub_25AD032B8(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B37C0);
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_25AD14980();
  __break(1u);
  return result;
}

char *sub_25AD033C4(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  size_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = (char *)(a4 + a1 + 32);
    unint64_t v6 = &__dst[v4];
    if (v5 >= &__dst[v4] || &v5[v4] <= __dst)
    {
      memcpy(__dst, v5, v4);
      return v6;
    }
  }
  uint64_t result = (char *)sub_25AD14980();
  __break(1u);
  return result;
}

uint64_t sub_25AD034AC(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
      return v6;
    }
  }
  uint64_t result = sub_25AD14980();
  __break(1u);
  return result;
}

uint64_t sub_25AD035A0(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t *a5)
{
  uint64_t v5 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v5 & 0x8000000000000000) == 0)
  {
    unint64_t v6 = a4 + 8 * a1 + 32;
    unint64_t v7 = a3 + 8 * v5;
    if (v6 >= v7 || v6 + 8 * v5 <= a3)
    {
      __swift_instantiateConcreteTypeFromMangledName(a5);
      swift_arrayInitWithCopy();
      return v7;
    }
  }
  uint64_t result = sub_25AD14980();
  __break(1u);
  return result;
}

uint64_t sub_25AD036A8@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v193 = a4;
  uint64_t v139 = a5;
  uint64_t v8 = *(void *)a3;
  uint64_t v134 = *(void *)(a3 + 8);
  uint64_t v135 = v8;
  uint64_t v9 = *(void *)(a3 + 16);
  uint64_t v132 = *(void *)(a3 + 24);
  uint64_t v133 = v9;
  LODWORD(v9) = *(_DWORD *)(a3 + 32);
  unsigned int v130 = *(_DWORD *)(a3 + 36);
  unsigned int v131 = v9;
  int v129 = *(_DWORD *)(a3 + 40);
  uint64_t v10 = *(void *)(a3 + 48);
  uint64_t v127 = *(void *)(a3 + 56);
  uint64_t v128 = v10;
  uint64_t v11 = *(void *)(a3 + 64);
  uint64_t v125 = *(void *)(a3 + 72);
  uint64_t v126 = v11;
  uint64_t v12 = sub_25AD14520();
  MEMORY[0x270FA5388](v12 - 8);
  uint64_t v136 = (char *)&v102 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B3768);
  uint64_t v137 = *(void *)(v14 - 8);
  uint64_t v138 = v14;
  MEMORY[0x270FA5388](v14);
  uint64_t v16 = (char *)&v102 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_25AD14190();
  uint64_t v18 = *(void *)(v17 - 8);
  MEMORY[0x270FA5388](v17);
  uint64_t v20 = (char *)&v102 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25AD141D0();
  swift_allocObject();
  uint64_t v21 = sub_25AD141C0();
  sub_25AD14180();
  (*(void (**)(char *, void, uint64_t))(v18 + 104))(v20, *MEMORY[0x263F060B8], v17);
  sub_25AD141A0();
  sub_25AD076E4();
  uint64_t v22 = v140;
  sub_25AD141B0();
  if (v22)
  {
    swift_release();
    sub_25ACDF56C(a1, a2);
    swift_release();
    return sub_25ACDF6AC(a3);
  }
  uint64_t v119 = v16;
  long long v191 = v182[16];
  long long v192 = v183;
  long long v189 = v182[14];
  long long v190 = v182[15];
  long long v188 = v182[13];
  uint64_t v24 = *((void *)&v183 + 1);
  uint64_t v25 = sub_25AD02FC8(*((uint64_t *)&v183 + 1), a3);
  if (!v25)
  {
    swift_release();
    sub_25ACDF56C(a1, a2);
    sub_25ACDF6AC(a3);
    swift_release();
    sub_25AD07738((uint64_t)&v188);
    sub_25AD077AC(&v156);
    sub_25ACE6A0C((uint64_t)&v156, (uint64_t)v182, &qword_26A4B3750);
    uint64_t v35 = v139;
    return sub_25ACE6A0C((uint64_t)v182, v35, &qword_26A4B3750);
  }
  unint64_t v122 = a2;
  uint64_t v123 = (void *)a3;
  uint64_t v120 = v21;
  uint64_t v121 = a1;
  uint64_t v28 = *((void *)&v188 + 1);
  uint64_t v29 = v26;
  uint64_t v30 = *((void *)&v189 + 1);
  uint64_t v117 = v189;
  uint64_t v118 = v188;
  uint64_t v115 = v24;
  uint64_t v31 = *((void *)&v190 + 1);
  uint64_t v116 = v190;
  uint64_t v32 = v25;
  uint64_t v33 = v27;
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  uint64_t v140 = v32;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v124 = v33;
  swift_bridgeObjectRetain();
  sub_25AD077D0((uint64_t)&v188);
  uint64_t v34 = swift_bridgeObjectRetain();
  uint64_t v36 = sub_25AD024B0(v34, v29, (uint64_t *)&v188);
  uint64_t v112 = v31;
  uint64_t v113 = v28;
  uint64_t v111 = v30;
  sub_25AD07738((uint64_t)&v188);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *(void *)&long long v156 = v36;
  swift_getKeyPath();
  uint64_t v37 = v119;
  sub_25AD142D0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B3700);
  sub_25AD07844(&qword_26A4B3778, &qword_26A4B3700);
  sub_25AD07844(&qword_26A4B3780, &qword_26A4B3768);
  uint64_t v38 = v138;
  uint64_t v39 = sub_25AD14650();
  (*(void (**)(char *, uint64_t))(v137 + 8))(v37, v38);
  swift_bridgeObjectRelease();
  uint64_t v40 = (uint64_t)v123;
  uint64_t v119 = (char *)v123[1];
  uint64_t v138 = v123[3];
  uint64_t v41 = v123[9];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_25ACDF660(v40);
  uint64_t v42 = sub_25ACFC118(v29);
  uint64_t v114 = v39;
  uint64_t v137 = v41;
  uint64_t v43 = v42;
  uint64_t v108 = 0;
  uint64_t v110 = 0;
  swift_bridgeObjectRelease();
  uint64_t v44 = MEMORY[0x263F8EE78];
  *(void *)&long long v156 = MEMORY[0x263F8EE78];
  uint64_t v45 = *(void *)(v43 + 16);
  if (v45)
  {
    swift_bridgeObjectRetain();
    uint64_t v46 = 56;
    do
    {
      uint64_t v47 = swift_bridgeObjectRetain();
      sub_25ACFDE78(v47);
      v46 += 32;
      --v45;
    }
    while (v45);
    swift_bridgeObjectRelease();
    uint64_t v44 = v156;
  }
  uint64_t v48 = sub_25AD0312C(v44);
  swift_bridgeObjectRelease();
  uint64_t v107 = swift_bridgeObjectRetain();
  uint64_t v49 = sub_25ACFD578(v107);
  uint64_t v50 = swift_bridgeObjectRetain();
  uint64_t v51 = sub_25ACFD710(v50, v49);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  unint64_t v52 = *(void *)(v51 + 16);
  unint64_t v53 = *(void *)(v48 + 16);
  uint64_t v54 = v110;
  uint64_t v109 = v43;
  if (v52 <= v53 >> 3)
  {
    *(void *)&long long v156 = v48;
    sub_25AD00984(v51);
    swift_bridgeObjectRelease();
    uint64_t v55 = v156;
  }
  else
  {
    uint64_t v55 = sub_25AD00B2C(v51, v48);
    swift_bridgeObjectRelease();
  }
  uint64_t v56 = (uint64_t)v123;
  uint64_t v57 = v123[6];
  uint64_t v58 = v123[7];
  int64_t v59 = v123[8];
  unint64_t v60 = sub_25AD006EC(v55);
  swift_bridgeObjectRelease();
  uint64_t v61 = v193;
  swift_retain();
  sub_25ACF4B38(v57, v58, v59, (uint64_t)v60, v61, v184);
  if (!v54)
  {
    uint64_t v105 = v184[2];
    uint64_t v106 = v184[1];
    uint64_t v63 = v185;
    uint64_t v104 = v184[3];
    uint64_t v186 = v184[0];
    uint64_t v187 = v185;
    uint64_t v140 = v184[0];
    sub_25ACE8B64((uint64_t)&v187);
    sub_25ACE8B64((uint64_t)&v186);
    uint64_t v64 = sub_25ACFCB08(0, 0, v59);
    int64_t v65 = *(void *)(v63 + 16);
    uint64_t v66 = MEMORY[0x263F8EE78];
    uint64_t v67 = v113;
    uint64_t v110 = 0;
    uint64_t v124 = v63;
    if (v65)
    {
      uint64_t v103 = v64;
      *(void *)&long long v156 = MEMORY[0x263F8EE78];
      sub_25AD0FD90(0, v65, 0);
      uint64_t v66 = v156;
      unint64_t v68 = (uint64_t *)(v63 + 40);
      do
      {
        uint64_t v69 = *v68;
        if (*v68) {
          uint64_t v70 = *(v68 - 1);
        }
        else {
          uint64_t v70 = 0;
        }
        *(void *)&long long v156 = v66;
        unint64_t v72 = *(void *)(v66 + 16);
        unint64_t v71 = *(void *)(v66 + 24);
        swift_bridgeObjectRetain();
        if (v72 >= v71 >> 1)
        {
          sub_25AD0FD90(v71 > 1, v72 + 1, 1);
          uint64_t v66 = v156;
        }
        v68 += 4;
        *(void *)(v66 + 16) = v72 + 1;
        uint64_t v73 = v66 + 16 * v72;
        *(void *)(v73 + 32) = v70;
        *(void *)(v73 + 40) = v69;
        --v65;
      }
      while (v65);
      uint64_t v67 = v113;
      uint64_t v54 = v110;
      uint64_t v64 = v103;
    }
    *(void *)&long long v156 = v64;
    sub_25ACFDD08(v66);
    uint64_t v74 = v156;
    int64_t v75 = *(void *)(v114 + 16);
    unint64_t v76 = MEMORY[0x263F8EE78];
    if (v75)
    {
      uint64_t v103 = v156;
      *(void *)&long long v156 = MEMORY[0x263F8EE78];
      uint64_t v77 = v114;
      swift_bridgeObjectRetain();
      sub_25AD0FAB0(0, v75, 0);
      unint64_t v76 = v156;
      uint64_t v78 = (uint64_t *)(v77 + 40);
      do
      {
        uint64_t v80 = *(v78 - 1);
        uint64_t v79 = *v78;
        *(void *)&long long v156 = v76;
        unint64_t v82 = *(void *)(v76 + 16);
        unint64_t v81 = *(void *)(v76 + 24);
        swift_bridgeObjectRetain();
        if (v82 >= v81 >> 1)
        {
          sub_25AD0FAB0(v81 > 1, v82 + 1, 1);
          unint64_t v76 = v156;
        }
        v78 += 15;
        *(void *)(v76 + 16) = v82 + 1;
        unint64_t v83 = v76 + 16 * v82;
        *(void *)(v83 + 32) = v80;
        *(void *)(v83 + 40) = v79;
        --v75;
      }
      while (v75);
      swift_bridgeObjectRelease();
      uint64_t v84 = v113;
      uint64_t v54 = v110;
      uint64_t v74 = v103;
    }
    else
    {
      uint64_t v84 = v67;
    }
    type metadata accessor for Evaluator();
    swift_allocObject();
    uint64_t v85 = v107;
    swift_bridgeObjectRetain();
    uint64_t v86 = sub_25AD08CF8(v109, v76, v85, v74);
    uint64_t v87 = v118;
    if (v54)
    {
      swift_release();
      sub_25ACDF56C(v121, v122);
      sub_25ACE8B90((uint64_t)&v186);
      sub_25ACE8B90((uint64_t)&v187);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_25ACDF6AC(v56);
      swift_bridgeObjectRelease();
      sub_25AD07738((uint64_t)&v188);
      swift_release();
      int v62 = 1;
      goto LABEL_35;
    }
    uint64_t v138 = v86;
    swift_retain();
    sub_25AD14510();
    uint64_t v90 = v121;
    unint64_t v89 = v122;
    uint64_t result = sub_25AD144E0();
    if (!v91)
    {
      __break(1u);
      return result;
    }
    uint64_t v137 = result;
    uint64_t v155 = MEMORY[0x263F8EE78];
    uint64_t v92 = *(void *)(v115 + 16);
    uint64_t v110 = 0;
    uint64_t v136 = v91;
    if (v92)
    {
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain();
      uint64_t v93 = 32;
      do
      {
        uint64_t v94 = swift_bridgeObjectRetain();
        sub_25ACFDBB4(v94);
        v93 += 24;
        --v92;
      }
      while (v92);
      swift_release();
      swift_release();
      swift_bridgeObjectRelease();
      uint64_t v95 = v155;
      uint64_t v84 = v113;
      uint64_t v90 = v121;
      unint64_t v89 = v122;
    }
    else
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_release();
      swift_release();
      uint64_t v95 = MEMORY[0x263F8EE78];
    }
    sub_25ACDF56C(v90, v89);
    sub_25AD07738((uint64_t)&v188);
    swift_bridgeObjectRelease();
    *(void *)&long long v141 = v87;
    *((void *)&v141 + 1) = v84;
    uint64_t v96 = v111;
    uint64_t v97 = v112;
    *(void *)&long long v142 = v117;
    *((void *)&v142 + 1) = v111;
    *(void *)&long long v143 = v116;
    *((void *)&v143 + 1) = v112;
    uint64_t v98 = v114;
    *(void *)&long long v144 = v114;
    *((void *)&v144 + 1) = v135;
    *(void *)&long long v145 = v134;
    *((void *)&v145 + 1) = v133;
    *(void *)&long long v146 = v132;
    *((void *)&v146 + 1) = __PAIR64__(v130, v131);
    LODWORD(v147) = v129;
    *((void *)&v147 + 1) = v128;
    *(void *)&long long v148 = v127;
    *((void *)&v148 + 1) = v126;
    *(void *)&long long v149 = v125;
    *((void *)&v149 + 1) = v140;
    *(void *)&long long v150 = v106;
    *((void *)&v150 + 1) = v105;
    *(void *)&long long v151 = v104;
    uint64_t v99 = v138;
    *((void *)&v151 + 1) = v124;
    *(void *)&long long v152 = v138;
    uint64_t v193 = v95;
    *((void *)&v152 + 1) = v95;
    uint64_t v100 = v136;
    uint64_t v101 = v137;
    *(void *)&long long v153 = v137;
    *((void *)&v153 + 1) = v136;
    sub_25AD07888((uint64_t)&v141);
    swift_release();
    swift_bridgeObjectRelease();
    sub_25ACE8B90((uint64_t)&v186);
    sub_25ACE8B90((uint64_t)&v187);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_25ACDF6AC(v56);
    v154[10] = v151;
    v154[11] = v152;
    v154[12] = v153;
    v154[6] = v147;
    v154[7] = v148;
    v154[8] = v149;
    v154[9] = v150;
    v154[2] = v143;
    v154[3] = v144;
    v154[4] = v145;
    v154[5] = v146;
    v154[0] = v141;
    v154[1] = v142;
    nullsub_1(v154);
    *(void *)&long long v156 = v118;
    *((void *)&v156 + 1) = v84;
    uint64_t v157 = v117;
    uint64_t v158 = v96;
    uint64_t v159 = v116;
    uint64_t v160 = v97;
    uint64_t v161 = v98;
    uint64_t v162 = v135;
    uint64_t v163 = v134;
    uint64_t v164 = v133;
    uint64_t v165 = v132;
    unsigned int v166 = v131;
    unsigned int v167 = v130;
    int v168 = v129;
    uint64_t v169 = v128;
    uint64_t v170 = v127;
    uint64_t v171 = v126;
    uint64_t v172 = v125;
    uint64_t v173 = v140;
    uint64_t v174 = v106;
    uint64_t v175 = v105;
    uint64_t v176 = v104;
    uint64_t v177 = v124;
    uint64_t v178 = v99;
    uint64_t v179 = v193;
    uint64_t v180 = v101;
    v181 = v100;
    sub_25AD07958((uint64_t)&v156);
    sub_25ACE6A0C((uint64_t)v154, (uint64_t)v182, &qword_26A4B3750);
    uint64_t v35 = v139;
    return sub_25ACE6A0C((uint64_t)v182, v35, &qword_26A4B3750);
  }
  swift_release();
  sub_25ACDF56C(v121, v122);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_25ACDF6AC(v56);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_25AD07738((uint64_t)&v188);
  swift_release();
  int v62 = 0;
LABEL_35:
  uint64_t v88 = v108;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t result = swift_bridgeObjectRelease();
  if (!v88)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t result = swift_bridgeObjectRelease();
  }
  if (v62)
  {
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_25AD0446C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 208 * a1 + 32;
    unint64_t v6 = a3 + 208 * v4;
    if (v5 >= v6 || v5 + 208 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_25AD14980();
  __break(1u);
  return result;
}

void *sub_25AD04560(void *a1, uint64_t a2)
{
  uint64_t v167 = a2;
  uint64_t v177 = a1;
  v195[26] = *MEMORY[0x263EF8340];
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B30A0);
  uint64_t v3 = MEMORY[0x270FA5388](v2 - 8);
  long long v156 = (char *)v155 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = MEMORY[0x270FA5388](v3);
  unint64_t v7 = (char *)v155 - v6;
  uint64_t v8 = MEMORY[0x270FA5388](v5);
  uint64_t v10 = (char *)v155 - v9;
  MEMORY[0x270FA5388](v8);
  long long v188 = (char *)v155 - v11;
  unint64_t v12 = sub_25AD14360();
  v182 = *(void (***)(void (**)(char *, uint64_t), void, unint64_t))(v12 - 8);
  MEMORY[0x270FA5388](v12);
  uint64_t v14 = (void (**)(char *, uint64_t))((char *)v155 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v15 = sub_25AD143E0();
  uint64_t v16 = *(void (***)(unint64_t, char *, uint64_t))(v15 - 8);
  uint64_t v17 = MEMORY[0x270FA5388](v15);
  uint64_t v165 = (char *)v155 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = MEMORY[0x270FA5388](v17);
  uint64_t v164 = (char *)v155 - v20;
  uint64_t v21 = MEMORY[0x270FA5388](v19);
  long long v183 = (char *)v155 - v22;
  uint64_t v23 = MEMORY[0x270FA5388](v21);
  uint64_t v176 = (char *)v155 - v24;
  uint64_t v25 = MEMORY[0x270FA5388](v23);
  uint64_t v172 = (void (**)(unint64_t, char *, uint64_t))((char *)v155 - v26);
  uint64_t v27 = MEMORY[0x270FA5388](v25);
  uint64_t v170 = (char *)v155 - v28;
  uint64_t v29 = MEMORY[0x270FA5388](v27);
  uint64_t v163 = (char *)v155 - v30;
  MEMORY[0x270FA5388](v29);
  uint64_t v32 = (char *)v155 - v31;
  uint64_t v33 = sub_25AD14520();
  MEMORY[0x270FA5388](v33 - 8);
  uint64_t v34 = (void *)MEMORY[0x263F8EE78];
  uint64_t v185 = v15;
  uint64_t v171 = v7;
  int v168 = v16;
  if (v177)
  {
    uint64_t v35 = swift_bridgeObjectRetain();
    uint64_t v36 = v163;
    uint64_t v37 = v179;
    uint64_t v38 = v167;
  }
  else
  {
    uint64_t v178 = v32;
    uint64_t v186 = v14;
    unint64_t v187 = v12;
    if (getenv("RECOUNT_MODES_PATH") && (sub_25AD14510(), uint64_t v39 = sub_25AD14500(), v40))
    {
      uint64_t v41 = v39;
      unint64_t v42 = v40;
      v193[0] = (id)59;
      v193[1] = (id)0xE100000000000000;
      MEMORY[0x270FA5388](v39);
      v155[-2] = v193;
      swift_bridgeObjectRetain();
      uint64_t v43 = v41;
      uint64_t v44 = v179;
      unint64_t v12 = sub_25ACFEDAC(0x7FFFFFFFFFFFFFFFLL, 1, sub_25AD075E0, (uint64_t)&v155[-4], v43, v42);
      uint64_t v37 = v44;
      swift_bridgeObjectRelease();
      int64_t v45 = *(void *)(v12 + 16);
      uint64_t v38 = v167;
      if (v45)
      {
        uint64_t v179 = v44;
        uint64_t v158 = v10;
        v193[0] = (id)MEMORY[0x263F8EE78];
        long long v189 = (void (*)(unint64_t, char *, uint64_t))v45;
        sub_25AD0FDF0(0, v45, 0);
        uint64_t v35 = (uint64_t)v193[0];
        LODWORD(v184) = *MEMORY[0x263F06E58];
        v181 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(v16 + 7);
        v182 += 13;
        uint64_t v180 = (char *)(v16 + 4);
        unint64_t v175 = v12;
        uint64_t v46 = (uint64_t *)(v12 + 56);
        uint64_t v15 = v185;
        uint64_t v47 = v186;
        unint64_t v48 = v187;
        uint64_t v49 = v178;
        do
        {
          uint64_t v177 = (void *)v35;
          uint64_t v51 = *(v46 - 3);
          uint64_t v50 = *(v46 - 2);
          uint64_t v53 = *(v46 - 1);
          uint64_t v52 = *v46;
          swift_bridgeObjectRetain();
          MEMORY[0x2611548A0](v51, v50, v53, v52);
          (*v182)(v47, v184, v48);
          (*v181)(v188, 1, 1, v15);
          uint64_t v35 = (uint64_t)v177;
          sub_25AD143C0();
          swift_bridgeObjectRelease();
          v193[0] = (id)v35;
          uint64_t v54 = v15;
          unint64_t v56 = *(void *)(v35 + 16);
          unint64_t v55 = *(void *)(v35 + 24);
          unint64_t v12 = v56 + 1;
          if (v56 >= v55 >> 1)
          {
            sub_25AD0FDF0(v55 > 1, v56 + 1, 1);
            uint64_t v35 = (uint64_t)v193[0];
          }
          *(void *)(v35 + 16) = v12;
          v168[4](v35+ ((*((unsigned __int8 *)v168 + 80) + 32) & ~(unint64_t)*((unsigned __int8 *)v168 + 80))+ (void)v168[9] * v56, v49, v54);
          v46 += 4;
          long long v189 = (void (*)(unint64_t, char *, uint64_t))((char *)v189 - 1);
          uint64_t v15 = v54;
          unint64_t v48 = v187;
        }
        while (v189);
        swift_bridgeObjectRelease();
        uint64_t v38 = v167;
        uint64_t v16 = v168;
        uint64_t v10 = v158;
        uint64_t v36 = v163;
        goto LABEL_19;
      }
      swift_bridgeObjectRelease();
      uint64_t v35 = MEMORY[0x263F8EE78];
      uint64_t v15 = v185;
    }
    else
    {
      int has_internal_content = os_variant_has_internal_content();
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B3748);
      uint64_t v36 = (char *)v16[9];
      unint64_t v58 = (*((unsigned __int8 *)v16 + 80) + 32) & ~(unint64_t)*((unsigned __int8 *)v16 + 80);
      uint64_t v38 = v167;
      if (has_internal_content)
      {
        unint64_t v12 = v167;
        int64_t v59 = v10;
        uint64_t v60 = swift_allocObject();
        *(_OWORD *)(v60 + 16) = xmmword_25AD17910;
        uint64_t v61 = v60;
        uint64_t v35 = v60 + v58;
        if (qword_26A4B2F38 != -1) {
          goto LABEL_107;
        }
        goto LABEL_13;
      }
      uint64_t v66 = swift_allocObject();
      *(_OWORD *)(v66 + 16) = xmmword_25AD15810;
      uint64_t v67 = (void *)v66;
      unint64_t v68 = v66 + v58;
      uint64_t v37 = v179;
      if (qword_26A4B2F30 != -1) {
        swift_once();
      }
      uint64_t v15 = v185;
      uint64_t v69 = __swift_project_value_buffer(v185, (uint64_t)qword_26A4B9B00);
      v16[2](v68, (char *)v69, v15);
      uint64_t v35 = (uint64_t)v67;
    }
    uint64_t v36 = v163;
    uint64_t v34 = (void *)MEMORY[0x263F8EE78];
  }
LABEL_22:
  long long v191 = v34;
  long long v190 = (void *)MEMORY[0x263F8EE88];
  sub_25ACDF660(v38);
  uint64_t v70 = sub_25ACED62C(v38);
  uint64_t v169 = v37;
  if (!v37)
  {
    uint64_t v162 = v70;
    uint64_t v157 = *(void *)(v35 + 16);
    if (!v157)
    {
      ((void (*)(char *, uint64_t, uint64_t, uint64_t))v16[7])(v10, 1, 1, v15);
LABEL_102:
      swift_release();
      swift_bridgeObjectRelease();
      uint64_t v35 = (uint64_t)v191;
      swift_bridgeObjectRelease();
      return (void *)v35;
    }
    unint64_t v71 = 0;
    unint64_t v166 = (*((unsigned __int8 *)v16 + 80) + 32) & ~(unint64_t)*((unsigned __int8 *)v16 + 80);
    uint64_t v158 = v10;
    uint64_t v159 = (char *)(v35 + v166);
    uint64_t v180 = (char *)(v16 + 6);
    int64_t v59 = (char *)(v16 + 4);
    uint64_t v61 = (uint64_t)(v16 + 1);
    v182 = (void (**)(void (**)(char *, uint64_t), void, unint64_t))(v16 + 7);
    v155[1] = (unint64_t)(v16 + 7) & 0xFFFFFFFFFFFFLL | 0xA0D1000000000000;
    uint64_t v177 = (void *)v35;
    uint64_t v178 = (char *)(v16 + 4);
    uint64_t v186 = (void (**)(char *, uint64_t))(v16 + 1);
    unint64_t v187 = (unint64_t)(v16 + 2);
    while (1)
    {
      if (v71 >= *(void *)(v35 + 16)) {
        goto LABEL_106;
      }
      uint64_t v73 = (char *)v16[9];
      unint64_t v160 = v71;
      long long v188 = v73;
      long long v189 = v16[2];
      v189((unint64_t)v10, &v159[(void)v73 * v71], v15);
      v181 = (void (**)(char *, uint64_t, uint64_t, uint64_t))v16[7];
      ((void (*)(char *, void, uint64_t, uint64_t))v181)(v10, 0, 1, v15);
      uint64_t v179 = v16[6];
      if (((unsigned int (*)(char *, uint64_t, uint64_t))v179)(v10, 1, v15) == 1) {
        goto LABEL_102;
      }
      v184 = *(void (**)(void))v59;
      ((void (*)(char *, char *, uint64_t))v184)(v36, v10, v15);
      uint64_t v74 = v36;
      int64_t v75 = self;
      unint64_t v12 = 0x265484000uLL;
      id v76 = objc_msgSend(v75, sel_defaultManager);
      sub_25AD143B0();
      uint64_t v77 = (void *)sub_25AD144C0();
      swift_bridgeObjectRelease();
      unsigned int v78 = objc_msgSend(v76, sel_fileExistsAtPath_, v77);

      if (v78) {
        break;
      }
      uint64_t v36 = v74;
      uint64_t v61 = (uint64_t)v186;
LABEL_27:
      unint64_t v72 = v160 + 1;
      (*(void (**)(char *, uint64_t))v61)(v36, v15);
      unint64_t v71 = v72;
      uint64_t v10 = v158;
      BOOL v101 = v72 == v157;
      uint64_t v35 = (uint64_t)v177;
      uint64_t v16 = v168;
      if (v101)
      {
        ((void (*)(char *, uint64_t, uint64_t, uint64_t))v181)(v158, 1, 1, v15);
        goto LABEL_102;
      }
    }
    id v79 = objc_msgSend(v75, sel_defaultManager);
    uint64_t v80 = (void *)sub_25AD14390();
    v193[0] = 0;
    id v81 = objc_msgSend(v79, sel_contentsOfDirectoryAtURL_includingPropertiesForKeys_options_error_, v80, 0, 0, v193);

    id v82 = v193[0];
    uint64_t v16 = v172;
    if (!v81)
    {
      id v154 = v193[0];
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_25AD14340();

      swift_willThrow();
      swift_release();
      (*v186)(v163, v15);
      goto LABEL_100;
    }
    uint64_t v61 = sub_25AD14680();
    id v83 = v82;

    *(void *)&v192[0] = MEMORY[0x263F8EE78];
    unint64_t v175 = *(void *)(v61 + 16);
    if (v175)
    {
      unint64_t v12 = 0;
      uint64_t v173 = v61;
      unint64_t v174 = v61 + v166;
      uint64_t v84 = v170;
      uint64_t v35 = (uint64_t)v171;
      uint64_t v36 = (char *)v187;
      uint64_t v85 = v189;
      while (1)
      {
        if (v12 >= *(void *)(v61 + 16))
        {
          __break(1u);
LABEL_106:
          __break(1u);
LABEL_107:
          swift_once();
LABEL_13:
          uint64_t v15 = v185;
          uint64_t v62 = __swift_project_value_buffer(v185, (uint64_t)qword_26A4B9B18);
          uint64_t v63 = v16[2];
          v63(v35, (char *)v62, v15);
          uint64_t v64 = &v36[v35];
          if (qword_26A4B2F30 != -1) {
            swift_once();
          }
          uint64_t v65 = __swift_project_value_buffer(v15, (uint64_t)qword_26A4B9B00);
          v63((unint64_t)v64, (char *)v65, v15);
          uint64_t v10 = v59;
          uint64_t v35 = v61;
          uint64_t v36 = v163;
          uint64_t v16 = v168;
          uint64_t v38 = v12;
LABEL_19:
          uint64_t v34 = (void *)MEMORY[0x263F8EE78];
          uint64_t v37 = v179;
          goto LABEL_22;
        }
        v85(v35, (char *)(v174 + v12 * (void)v188), v15);
        ((void (*)(uint64_t, void, uint64_t, uint64_t))v181)(v35, 0, 1, v15);
        if (((unsigned int (*)(uint64_t, uint64_t, uint64_t))v179)(v35, 1, v15) == 1) {
          goto LABEL_70;
        }
        uint64_t v87 = (void *)v35;
        ((void (*)(char *, uint64_t, uint64_t))v184)(v84, v35, v15);
        if (sub_25AD14370() == 1852797802 && v88 == 0xE400000000000000)
        {
          swift_bridgeObjectRelease();
          v189((unint64_t)v16, v84, v15);
        }
        else
        {
          char v89 = sub_25AD14AF0();
          swift_bridgeObjectRelease();
          v189((unint64_t)v16, v84, v15);
          if ((v89 & 1) == 0)
          {
            uint64_t v86 = *v186;
            (*v186)((char *)v16, v15);
            goto LABEL_35;
          }
        }
        uint64_t v90 = v190;
        swift_bridgeObjectRetain();
        uint64_t v91 = sub_25AD14380();
        uint64_t v93 = v92;
        if (!v90[2]) {
          goto LABEL_62;
        }
        uint64_t v94 = v91;
        sub_25AD14B70();
        sub_25AD14570();
        uint64_t v95 = sub_25AD14B90();
        uint64_t v96 = -1 << *((unsigned char *)v90 + 32);
        unint64_t v97 = v95 & ~v96;
        uint64_t v98 = v90 + 7;
        if (((*(void *)((char *)v90 + ((v97 >> 3) & 0xFFFFFFFFFFFFFF8) + 56) >> v97) & 1) == 0)
        {
LABEL_61:
          uint64_t v15 = v185;
LABEL_62:
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          uint64_t v16 = v172;
          (*v186)((char *)v172, v15);
          uint64_t v84 = v170;
          int64_t v59 = v178;
          ((void (*)(char *, char *, uint64_t))v184)(v176, v170, v15);
          uint64_t v105 = *(void *)&v192[0];
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          {
            sub_25AD0FDF0(0, *(void *)(v105 + 16) + 1, 1);
            uint64_t v105 = *(void *)&v192[0];
          }
          uint64_t v87 = v171;
          unint64_t v107 = *(void *)(v105 + 16);
          unint64_t v106 = *(void *)(v105 + 24);
          if (v107 >= v106 >> 1)
          {
            sub_25AD0FDF0(v106 > 1, v107 + 1, 1);
            uint64_t v105 = *(void *)&v192[0];
          }
          *(void *)(v105 + 16) = v107 + 1;
          unint64_t v108 = v105 + v166 + v107 * (void)v188;
          uint64_t v15 = v185;
          ((void (*)(unint64_t, char *, uint64_t))v184)(v108, v176, v185);
          *(void *)&v192[0] = v105;
          goto LABEL_36;
        }
        uint64_t v99 = v90[6];
        uint64_t v100 = (void *)(v99 + 16 * v97);
        BOOL v101 = *v100 == v94 && v100[1] == v93;
        if (v101 || (sub_25AD14AF0() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          uint64_t v15 = v185;
        }
        else
        {
          uint64_t v161 = ~v96;
          unint64_t v102 = (v97 + 1) & ~v96;
          if (((*(void *)((char *)v98 + ((v102 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v102) & 1) == 0) {
            goto LABEL_61;
          }
          uint64_t v15 = v185;
          while (1)
          {
            uint64_t v103 = (void *)(v99 + 16 * v102);
            BOOL v104 = *v103 == v94 && v103[1] == v93;
            if (v104 || (sub_25AD14AF0() & 1) != 0) {
              break;
            }
            unint64_t v102 = (v102 + 1) & v161;
            if (((*(void *)((char *)v98 + ((v102 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v102) & 1) == 0) {
              goto LABEL_62;
            }
          }
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
        }
        uint64_t v86 = *v186;
        uint64_t v16 = v172;
        (*v186)((char *)v172, v15);
        uint64_t v84 = v170;
        uint64_t v87 = v171;
LABEL_35:
        int64_t v59 = v178;
        v86(v84, v15);
LABEL_36:
        ++v12;
        uint64_t v36 = (char *)v187;
        uint64_t v85 = v189;
        uint64_t v35 = (uint64_t)v87;
        uint64_t v61 = v173;
        if (v12 == v175) {
          goto LABEL_69;
        }
      }
    }
    uint64_t v35 = (uint64_t)v171;
LABEL_69:
    ((void (*)(uint64_t, uint64_t, uint64_t, uint64_t))v181)(v35, 1, 1, v15);
LABEL_70:
    swift_bridgeObjectRelease();
    sub_25AD07334(v35);
    uint64_t v109 = *(void *)&v192[0];
    int64_t v110 = *(void *)(*(void *)&v192[0] + 16);
    unint64_t v12 = MEMORY[0x263F8EE78];
    uint64_t v173 = *(void *)&v192[0];
    if (v110)
    {
      v193[0] = (id)MEMORY[0x263F8EE78];
      sub_25AD0FAB0(0, v110, 0);
      unint64_t v111 = v109 + v166;
      do
      {
        uint64_t v112 = v183;
        v189((unint64_t)v183, (char *)v111, v15);
        uint64_t v113 = sub_25AD14380();
        uint64_t v115 = v114;
        (*v186)(v112, v15);
        uint64_t v116 = v193[0];
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_25AD0FAB0(0, v116[2] + 1, 1);
          uint64_t v116 = v193[0];
        }
        unint64_t v118 = v116[2];
        unint64_t v117 = v116[3];
        unint64_t v119 = v118 + 1;
        if (v118 >= v117 >> 1)
        {
          sub_25AD0FAB0(v117 > 1, v118 + 1, 1);
          uint64_t v116 = v193[0];
        }
        v116[2] = v119;
        uint64_t v120 = (char *)&v116[2 * v118];
        *((void *)v120 + 4) = v113;
        *((void *)v120 + 5) = v115;
        v111 += (unint64_t)v188;
        --v110;
        uint64_t v15 = v185;
      }
      while (v110);
      unint64_t v12 = MEMORY[0x263F8EE78];
      uint64_t v109 = v173;
    }
    else
    {
      unint64_t v119 = *(void *)(MEMORY[0x263F8EE78] + 16);
      uint64_t v116 = (void *)MEMORY[0x263F8EE78];
      if (!v119)
      {
LABEL_81:
        swift_bridgeObjectRelease();
        unint64_t v124 = *(void *)(v109 + 16);
        if (v124)
        {
          unint64_t v125 = v109 + v166;
          sub_25ACDF660(v167);
          swift_retain();
          swift_retain();
          uint64_t v126 = v156;
          v189((unint64_t)v156, (char *)v125, v15);
          ((void (*)(char *, void, uint64_t, uint64_t))v181)(v126, 0, 1, v15);
          unsigned int v127 = ((uint64_t (*)(char *, uint64_t, uint64_t))v179)(v126, 1, v15);
          uint64_t v36 = v163;
          if (v127 != 1)
          {
            unint64_t v174 = (unint64_t)&v188[v125];
            uint64_t v128 = v189;
            while (1)
            {
              unint64_t v175 = v124;
              unsigned int v131 = v164;
              v184(v164);
              v128((unint64_t)v165, v131, v15);
              uint64_t v132 = v167;
              sub_25ACDF660(v167);
              uint64_t v133 = (uint64_t)v162;
              swift_retain();
              uint64_t v134 = v169;
              uint64_t v135 = sub_25AD143F0();
              if (v134) {
                break;
              }
              sub_25AD036A8(v135, v136, v132, v133, (uint64_t)v194);
              uint64_t v169 = 0;
              sub_25ACE6A0C((uint64_t)v194, (uint64_t)v193, &qword_26A4B3750);
              sub_25AD0748C(v194, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))sub_25AD07394);
              uint64_t v61 = (uint64_t)v186;
              uint64_t v137 = *v186;
              (*v186)(v165, v15);
              sub_25ACE6A0C((uint64_t)v194, (uint64_t)v195, &qword_26A4B3750);
              if (sub_25AD07474((uint64_t)v195) == 1)
              {
                v137(v164, v15);
                uint64_t v128 = v189;
                unint64_t v124 = v175 - 1;
                if (v175 == 1) {
                  goto LABEL_97;
                }
              }
              else
              {
                sub_25AD0748C(v194, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))sub_25AD07500);
                v137(v164, v15);
                char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
                uint64_t v128 = v189;
                if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
                  unint64_t v12 = (unint64_t)sub_25AD00454(0, *(void *)(v12 + 16) + 1, 1, (void *)v12);
                }
                unint64_t v139 = v175;
                unint64_t v141 = *(void *)(v12 + 16);
                unint64_t v140 = *(void *)(v12 + 24);
                if (v141 >= v140 >> 1) {
                  unint64_t v12 = (unint64_t)sub_25AD00454((void *)(v140 > 1), v141 + 1, 1, (void *)v12);
                }
                sub_25ACE6A0C((uint64_t)v193, (uint64_t)v192, &qword_26A4B3750);
                *(void *)(v12 + 16) = v141 + 1;
                long long v142 = (_OWORD *)(v12 + 208 * v141);
                v142[2] = v192[0];
                long long v143 = v192[4];
                long long v145 = v192[1];
                long long v144 = v192[2];
                v142[5] = v192[3];
                v142[6] = v143;
                v142[3] = v145;
                v142[4] = v144;
                long long v146 = v192[8];
                long long v148 = v192[5];
                long long v147 = v192[6];
                v142[9] = v192[7];
                v142[10] = v146;
                v142[7] = v148;
                v142[8] = v147;
                long long v149 = v192[12];
                long long v151 = v192[9];
                long long v150 = v192[10];
                v142[13] = v192[11];
                v142[14] = v149;
                v142[11] = v151;
                v142[12] = v150;
                uint64_t v15 = v185;
                unint64_t v124 = v139 - 1;
                if (!v124)
                {
LABEL_97:
                  uint64_t v36 = v163;
                  goto LABEL_85;
                }
              }
              int v129 = &v188[v174];
              ((void (*)(char *))v128)(v126);
              ((void (*)(char *, void, uint64_t, uint64_t))v181)(v126, 0, 1, v15);
              unsigned int v130 = ((uint64_t (*)(char *, uint64_t, uint64_t))v179)(v126, 1, v15);
              unint64_t v174 = (unint64_t)v129;
              uint64_t v36 = v163;
              if (v130 == 1) {
                goto LABEL_86;
              }
            }
            sub_25ACDF6AC(v132);
            swift_release();
            long long v152 = *v186;
            (*v186)(v165, v15);
            v152(v164, v15);
            swift_release();
            swift_bridgeObjectRelease();
            swift_release();
            sub_25ACDF6AC(v167);
            v152(v36, v15);
            swift_bridgeObjectRelease();
            swift_release();
            swift_release();
            swift_bridgeObjectRelease();
LABEL_100:
            uint64_t v35 = (uint64_t)v190;
            goto LABEL_23;
          }
          uint64_t v61 = (uint64_t)v186;
        }
        else
        {
          sub_25ACDF660(v167);
          swift_retain();
          swift_retain();
          uint64_t v126 = v156;
          uint64_t v36 = v163;
          uint64_t v61 = (uint64_t)v186;
LABEL_85:
          ((void (*)(char *, uint64_t, uint64_t, uint64_t))v181)(v126, 1, 1, v15);
        }
LABEL_86:
        swift_release();
        swift_release();
        sub_25ACDF6AC(v167);
        swift_release();
        sub_25ACFE4E0(v12);
        int64_t v59 = v178;
        goto LABEL_27;
      }
    }
    uint64_t v121 = v116 + 5;
    do
    {
      uint64_t v122 = *(v121 - 1);
      uint64_t v123 = *v121;
      swift_bridgeObjectRetain();
      sub_25AD007D4((uint64_t *)v193, v122, v123);
      swift_bridgeObjectRelease();
      v121 += 2;
      --v119;
    }
    while (v119);
    goto LABEL_81;
  }
LABEL_23:
  swift_bridgeObjectRelease();
  return (void *)v35;
}

uint64_t sub_25AD05A9C()
{
  unint64_t v0 = sub_25AD14990();
  swift_bridgeObjectRelease();
  if (v0 >= 8) {
    return 8;
  }
  else {
    return v0;
  }
}

__n128 sub_25AD05AE8@<Q0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v102 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B3768);
  uint64_t v103 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v5 = (char *)&v69 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B3818);
  uint64_t v104 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)&v69 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25AD06A14();
  uint64_t v9 = (uint64_t)v105;
  sub_25AD14BA0();
  if (v9)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  else
  {
    uint64_t v105 = a1;
    LOBYTE(v119) = 0;
    uint64_t v11 = sub_25AD149E0();
    uint64_t v13 = v12;
    uint64_t v98 = v11;
    LOBYTE(v119) = 1;
    swift_bridgeObjectRetain();
    uint64_t v14 = sub_25AD149E0();
    unint64_t v100 = v15;
    uint64_t v101 = v13;
    uint64_t v90 = v14;
    LOBYTE(v119) = 2;
    swift_bridgeObjectRetain();
    uint64_t v96 = 0;
    uint64_t v83 = sub_25AD149E0();
    uint64_t v97 = v16;
    uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B3700);
    LOBYTE(v106) = 3;
    sub_25AD07A84(&qword_26A4B3820, (void (*)(void))sub_25AD07AF4);
    swift_bridgeObjectRetain();
    uint64_t v99 = v17;
    sub_25AD14A00();
    *(void *)&long long v106 = v119;
    swift_getKeyPath();
    uint64_t v94 = v5;
    sub_25AD142D0();
    uint64_t v95 = sub_25AD07844(&qword_26A4B3778, &qword_26A4B3700);
    sub_25AD07844(&qword_26A4B3780, &qword_26A4B3768);
    uint64_t v18 = v3;
    uint64_t v19 = sub_25AD14650();
    (*(void (**)(char *, uint64_t))(v103 + 8))(v94, v18);
    swift_bridgeObjectRelease();
    LOBYTE(v106) = 4;
    sub_25AD07B48();
    swift_bridgeObjectRetain();
    sub_25AD14A00();
    uint64_t v95 = v19;
    uint64_t v20 = v6;
    uint64_t v22 = v119;
    uint64_t v21 = v120;
    unint64_t v81 = v122;
    uint64_t v82 = v121;
    uint64_t v23 = v8;
    uint64_t v24 = (char *)v123;
    LOBYTE(v106) = 5;
    sub_25AD07B9C();
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain();
    sub_25AD14A00();
    unint64_t v25 = v100;
    uint64_t v103 = v22;
    uint64_t v94 = v24;
    uint64_t v78 = v21;
    uint64_t v79 = v20;
    uint64_t v80 = v23;
    uint64_t v76 = v121;
    uint64_t v77 = v119;
    unsigned int v74 = HIDWORD(v123);
    unsigned int v75 = v123;
    int v73 = v124;
    uint64_t v71 = v126;
    uint64_t v72 = v125;
    uint64_t v70 = v127;
    int64_t v26 = *(void *)(v95 + 16);
    uint64_t v27 = MEMORY[0x263F8EE78];
    unint64_t v92 = v122;
    uint64_t v93 = v128;
    uint64_t v99 = v120;
    if (v26)
    {
      uint64_t v119 = MEMORY[0x263F8EE78];
      uint64_t v28 = v95;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_25AD0FDB0(0, v26, 0);
      uint64_t v91 = v119;
      uint64_t v29 = (uint64_t *)(v28 + 144);
      do
      {
        uint64_t v30 = *(v29 - 13);
        uint64_t v84 = *(v29 - 14);
        int64_t v85 = v26;
        uint64_t v31 = *(v29 - 11);
        uint64_t v32 = *(v29 - 2);
        uint64_t v86 = *(v29 - 1);
        uint64_t v87 = v32;
        uint64_t v33 = *v29;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain_n();
        uint64_t v88 = v30;
        swift_bridgeObjectRetain_n();
        uint64_t v89 = v31;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        uint64_t v34 = sub_25AD1228C(v86, v33, MEMORY[0x263F8EE80]);
        uint64_t v36 = v35;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t v37 = v88;
        swift_bridgeObjectRelease();
        uint64_t v38 = v91;
        uint64_t v119 = v91;
        unint64_t v40 = *(void *)(v91 + 16);
        unint64_t v39 = *(void *)(v91 + 24);
        if (v40 >= v39 >> 1)
        {
          sub_25AD0FDB0(v39 > 1, v40 + 1, 1);
          uint64_t v38 = v119;
        }
        v29 += 15;
        *(void *)(v38 + 16) = v40 + 1;
        uint64_t v91 = v38;
        uint64_t v41 = (void *)(v38 + 32 * v40);
        v41[4] = v84;
        v41[5] = v37;
        v41[6] = v34;
        v41[7] = v36;
        int64_t v26 = v85 - 1;
        unint64_t v25 = v100;
      }
      while (v85 != 1);
      swift_bridgeObjectRelease();
      uint64_t v27 = MEMORY[0x263F8EE78];
    }
    else
    {
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      uint64_t v91 = MEMORY[0x263F8EE78];
    }
    int64_t v42 = *((void *)v94 + 2);
    if (v42)
    {
      uint64_t v119 = v27;
      uint64_t v43 = v94;
      sub_25AD0FD90(0, v42, 0);
      uint64_t v44 = v119;
      int64_t v45 = (uint64_t *)(v43 + 40);
      do
      {
        uint64_t v46 = *v45;
        if (*v45) {
          uint64_t v47 = *(v45 - 1);
        }
        else {
          uint64_t v47 = 0;
        }
        uint64_t v119 = v44;
        unint64_t v49 = *(void *)(v44 + 16);
        unint64_t v48 = *(void *)(v44 + 24);
        swift_bridgeObjectRetain();
        if (v49 >= v48 >> 1)
        {
          sub_25AD0FD90(v48 > 1, v49 + 1, 1);
          uint64_t v44 = v119;
        }
        v45 += 4;
        *(void *)(v44 + 16) = v49 + 1;
        uint64_t v50 = v44 + 16 * v49;
        *(void *)(v50 + 32) = v47;
        *(void *)(v50 + 40) = v46;
        --v42;
      }
      while (v42);
      swift_bridgeObjectRelease();
      unint64_t v25 = v100;
    }
    else
    {
      swift_bridgeObjectRelease();
      uint64_t v44 = MEMORY[0x263F8EE78];
    }
    type metadata accessor for Evaluator();
    swift_allocObject();
    uint64_t v51 = sub_25AD08CF8(v91, 0, v93, v44);
    uint64_t v52 = v80;
    LOBYTE(v119) = 7;
    uint64_t v53 = v51;
    swift_retain();
    uint64_t v54 = v79;
    uint64_t v55 = sub_25AD149E0();
    uint64_t v91 = v53;
    uint64_t v89 = v55;
    uint64_t v57 = v56;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B2FC8);
    char v146 = 6;
    sub_25AD07BF0(&qword_26A4B3840);
    swift_bridgeObjectRetain();
    sub_25AD14A00();
    (*(void (**)(char *, uint64_t))(v104 + 8))(v52, v54);
    uint64_t v104 = v147;
    *(void *)&long long v106 = v98;
    *((void *)&v106 + 1) = v101;
    v107.n128_u64[0] = v90;
    v107.n128_u64[1] = v25;
    *(void *)&long long v108 = v83;
    *((void *)&v108 + 1) = v97;
    *(void *)&long long v109 = v95;
    *((void *)&v109 + 1) = v77;
    *(void *)&long long v110 = v99;
    *((void *)&v110 + 1) = v76;
    *(void *)&long long v111 = v92;
    *((void *)&v111 + 1) = __PAIR64__(v74, v75);
    LODWORD(v112) = v73;
    *((void *)&v112 + 1) = v72;
    *(void *)&long long v113 = v71;
    *((void *)&v113 + 1) = v70;
    *(void *)&long long v114 = v93;
    *((void *)&v114 + 1) = v103;
    *(void *)&long long v115 = v78;
    *((void *)&v115 + 1) = v82;
    *(void *)&long long v116 = v81;
    unint64_t v58 = v94;
    *((void *)&v116 + 1) = v94;
    *(void *)&long long v117 = v91;
    *((void *)&v117 + 1) = v147;
    *(void *)&long long v118 = v89;
    *((void *)&v118 + 1) = v57;
    sub_25AD07888((uint64_t)&v106);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    unint64_t v59 = v92;
    swift_bridgeObjectRelease();
    uint64_t v60 = v99;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v61 = v103;
    swift_bridgeObjectRelease();
    uint64_t v62 = v91;
    swift_release();
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v105);
    uint64_t v119 = v98;
    uint64_t v120 = v101;
    uint64_t v121 = v90;
    unint64_t v122 = v25;
    uint64_t v123 = v83;
    uint64_t v124 = v97;
    uint64_t v125 = v95;
    uint64_t v126 = v77;
    uint64_t v127 = v60;
    uint64_t v128 = v76;
    unint64_t v129 = v59;
    unsigned int v130 = v75;
    unsigned int v131 = v74;
    int v132 = v73;
    uint64_t v133 = v72;
    uint64_t v134 = v71;
    uint64_t v135 = v70;
    uint64_t v136 = v93;
    uint64_t v137 = v61;
    uint64_t v138 = v78;
    uint64_t v139 = v82;
    unint64_t v140 = v81;
    unint64_t v141 = v58;
    uint64_t v142 = v62;
    uint64_t v143 = v104;
    uint64_t v144 = v89;
    uint64_t v145 = v57;
    sub_25AD07958((uint64_t)&v119);
    long long v63 = v117;
    uint64_t v64 = v102;
    *(_OWORD *)(v102 + 160) = v116;
    *(_OWORD *)(v64 + 176) = v63;
    *(_OWORD *)(v64 + 192) = v118;
    long long v65 = v113;
    *(_OWORD *)(v64 + 96) = v112;
    *(_OWORD *)(v64 + 112) = v65;
    long long v66 = v115;
    *(_OWORD *)(v64 + 128) = v114;
    *(_OWORD *)(v64 + 144) = v66;
    long long v67 = v109;
    *(_OWORD *)(v64 + 32) = v108;
    *(_OWORD *)(v64 + 48) = v67;
    long long v68 = v111;
    *(_OWORD *)(v64 + 64) = v110;
    *(_OWORD *)(v64 + 80) = v68;
    __n128 result = v107;
    *(_OWORD *)uint64_t v64 = v106;
    *(__n128 *)(v64 + 16) = result;
  }
  return result;
}

unint64_t sub_25AD06A14()
{
  unint64_t result = qword_26A4B36F8;
  if (!qword_26A4B36F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4B36F8);
  }
  return result;
}

unint64_t sub_25AD06A68()
{
  unint64_t result = qword_26A4B3710;
  if (!qword_26A4B3710)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4B3710);
  }
  return result;
}

unint64_t sub_25AD06ABC()
{
  unint64_t result = qword_26A4B3718;
  if (!qword_26A4B3718)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4B3718);
  }
  return result;
}

unint64_t sub_25AD06B10()
{
  unint64_t result = qword_26A4B3720;
  if (!qword_26A4B3720)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4B3720);
  }
  return result;
}

uint64_t destroy for Mode()
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
  swift_release();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for Mode(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  uint64_t v5 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v5;
  uint64_t v6 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v6;
  uint64_t v7 = *(void *)(a2 + 72);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = v7;
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  *(_DWORD *)(a1 + 96) = *(_DWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 104) = *(_OWORD *)(a2 + 104);
  uint64_t v8 = *(void *)(a2 + 128);
  *(void *)(a1 + 120) = *(void *)(a2 + 120);
  *(void *)(a1 + 128) = v8;
  *(void *)(a1 + 136) = *(void *)(a2 + 136);
  *(_OWORD *)(a1 + 144) = *(_OWORD *)(a2 + 144);
  uint64_t v9 = *(void *)(a2 + 168);
  *(void *)(a1 + 160) = *(void *)(a2 + 160);
  *(void *)(a1 + 168) = v9;
  uint64_t v10 = *(void *)(a2 + 184);
  *(void *)(a1 + 176) = *(void *)(a2 + 176);
  *(void *)(a1 + 184) = v10;
  uint64_t v11 = *(void *)(a2 + 200);
  *(void *)(a1 + 192) = *(void *)(a2 + 192);
  *(void *)(a1 + 200) = v11;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for Mode(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
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
  *(_DWORD *)(a1 + 88) = *(_DWORD *)(a2 + 88);
  *(_DWORD *)(a1 + 92) = *(_DWORD *)(a2 + 92);
  *(_DWORD *)(a1 + 96) = *(_DWORD *)(a2 + 96);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  *(void *)(a1 + 120) = *(void *)(a2 + 120);
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 136) = *(void *)(a2 + 136);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 144) = *(void *)(a2 + 144);
  *(void *)(a1 + 152) = *(void *)(a2 + 152);
  *(void *)(a1 + 160) = *(void *)(a2 + 160);
  *(void *)(a1 + 168) = *(void *)(a2 + 168);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 176) = *(void *)(a2 + 176);
  swift_retain();
  swift_release();
  *(void *)(a1 + 184) = *(void *)(a2 + 184);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 192) = *(void *)(a2 + 192);
  *(void *)(a1 + 200) = *(void *)(a2 + 200);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy208_8(uint64_t a1, uint64_t a2)
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

uint64_t assignWithTake for Mode(uint64_t a1, uint64_t a2)
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
  uint64_t v6 = *(void *)(a2 + 64);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void *)(a2 + 80);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = v7;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  *(_DWORD *)(a1 + 96) = *(_DWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 104) = *(_OWORD *)(a2 + 104);
  *(void *)(a1 + 120) = *(void *)(a2 + 120);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 128) = *(_OWORD *)(a2 + 128);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 144) = *(_OWORD *)(a2 + 144);
  *(void *)(a1 + 160) = *(void *)(a2 + 160);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 168) = *(_OWORD *)(a2 + 168);
  swift_release();
  *(void *)(a1 + 184) = *(void *)(a2 + 184);
  swift_bridgeObjectRelease();
  uint64_t v8 = *(void *)(a2 + 200);
  *(void *)(a1 + 192) = *(void *)(a2 + 192);
  *(void *)(a1 + 200) = v8;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for Mode(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 208)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for Mode(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
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
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 208) = 1;
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
    *(unsigned char *)(result + 208) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for Mode()
{
  return &type metadata for Mode;
}

unsigned char *storeEnumTagSinglePayload for Mode.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x25AD071BCLL);
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

ValueMetadata *type metadata accessor for Mode.CodingKeys()
{
  return &type metadata for Mode.CodingKeys;
}

unint64_t sub_25AD071F8()
{
  unint64_t result = qword_26A4B3730;
  if (!qword_26A4B3730)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4B3730);
  }
  return result;
}

unint64_t sub_25AD07250()
{
  unint64_t result = qword_26A4B3738;
  if (!qword_26A4B3738)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4B3738);
  }
  return result;
}

unint64_t sub_25AD072A8()
{
  unint64_t result = qword_26A4B3740;
  if (!qword_26A4B3740)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4B3740);
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

uint64_t sub_25AD07334(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B30A0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_25AD07394(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_retain();
    swift_bridgeObjectRetain();
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_25AD07474(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 8);
  if (v1 >= 0xFFFFFFFF) {
    LODWORD(v1) = -1;
  }
  return (v1 + 1);
}

void *sub_25AD0748C(void *a1, void (*a2)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))
{
  a2(*a1, a1[1], a1[2], a1[3], a1[4], a1[5], a1[6], a1[7], a1[8], a1[9], a1[10], a1[11], a1[12], a1[13], a1[14], a1[15], a1[16], a1[17], a1[18],
    a1[19],
    a1[20],
    a1[21],
    a1[22],
    a1[23],
    a1[24],
    a1[25]);
  return a1;
}

uint64_t sub_25AD07500(uint64_t a1, uint64_t a2)
{
  if (a2)
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
    swift_release();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_25AD075E0(void *a1)
{
  uint64_t v2 = *(void **)(v1 + 16);
  if (*a1 == *v2 && a1[1] == v2[1]) {
    return 1;
  }
  else {
    return sub_25AD14AF0() & 1;
  }
}

uint64_t sub_25AD07638()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_25AD07670()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
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

unint64_t sub_25AD076E4()
{
  unint64_t result = qword_26A4B3770;
  if (!qword_26A4B3770)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4B3770);
  }
  return result;
}

uint64_t sub_25AD07738(uint64_t a1)
{
  return a1;
}

double sub_25AD077AC(_OWORD *a1)
{
  double result = 0.0;
  a1[11] = 0u;
  a1[12] = 0u;
  a1[9] = 0u;
  a1[10] = 0u;
  a1[7] = 0u;
  a1[8] = 0u;
  a1[5] = 0u;
  a1[6] = 0u;
  a1[3] = 0u;
  a1[4] = 0u;
  a1[1] = 0u;
  a1[2] = 0u;
  *a1 = 0u;
  return result;
}

uint64_t sub_25AD077D0(uint64_t a1)
{
  return a1;
}

uint64_t sub_25AD07844(unint64_t *a1, uint64_t *a2)
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

uint64_t sub_25AD07888(uint64_t a1)
{
  return a1;
}

uint64_t sub_25AD07958(uint64_t a1)
{
  return a1;
}

uint64_t sub_25AD07A28()
{
  return swift_release();
}

unint64_t sub_25AD07A30()
{
  unint64_t result = qword_26A4B3810;
  if (!qword_26A4B3810)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4B3810);
  }
  return result;
}

uint64_t sub_25AD07A84(unint64_t *a1, void (*a2)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A4B3700);
    a2();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_25AD07AF4()
{
  unint64_t result = qword_26A4B3828;
  if (!qword_26A4B3828)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4B3828);
  }
  return result;
}

unint64_t sub_25AD07B48()
{
  unint64_t result = qword_26A4B3830;
  if (!qword_26A4B3830)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4B3830);
  }
  return result;
}

unint64_t sub_25AD07B9C()
{
  unint64_t result = qword_26A4B3838;
  if (!qword_26A4B3838)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4B3838);
  }
  return result;
}

uint64_t sub_25AD07BF0(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A4B2FC8);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_25AD07C54(uint64_t a1)
{
  return a1;
}

uint64_t sub_25AD07C80(uint64_t a1)
{
  return a1;
}

uint64_t sub_25AD07CAC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if ((a8 & 0x8000000000000000) == 0)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

uint64_t destroy for ModeError(uint64_t *a1)
{
  return sub_25AD07D54(*a1, a1[1], a1[2], a1[3], a1[4], a1[5], a1[6], a1[7]);
}

uint64_t sub_25AD07D54(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  swift_bridgeObjectRelease();
  uint64_t result = swift_bridgeObjectRelease();
  if ((a8 & 0x8000000000000000) == 0)
  {
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t *initializeWithCopy for ModeError(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = a2[1];
  uint64_t v5 = a2[2];
  uint64_t v6 = a2[3];
  uint64_t v7 = a2[4];
  uint64_t v8 = a2[5];
  uint64_t v9 = a2[6];
  uint64_t v10 = a2[7];
  uint64_t v11 = a2[8];
  uint64_t v13 = a2[9];
  uint64_t v14 = a2[10];
  uint64_t v15 = a2[11];
  sub_25AD07CAC(*a2, v4, v5, v6, v7, v8, v9, v10);
  *a1 = v3;
  a1[1] = v4;
  a1[2] = v5;
  a1[3] = v6;
  a1[4] = v7;
  a1[5] = v8;
  a1[6] = v9;
  a1[7] = v10;
  a1[8] = v11;
  a1[9] = v13;
  a1[10] = v14;
  a1[11] = v15;
  return a1;
}

uint64_t *assignWithCopy for ModeError(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = a2[1];
  uint64_t v5 = a2[2];
  uint64_t v6 = a2[3];
  uint64_t v7 = a2[4];
  uint64_t v8 = a2[5];
  uint64_t v9 = a2[6];
  uint64_t v10 = a2[7];
  uint64_t v11 = a2[8];
  uint64_t v21 = a2[9];
  uint64_t v22 = a2[10];
  uint64_t v23 = a2[11];
  sub_25AD07CAC(*a2, v4, v5, v6, v7, v8, v9, v10);
  uint64_t v12 = *a1;
  uint64_t v13 = a1[1];
  uint64_t v14 = a1[2];
  uint64_t v15 = a1[3];
  uint64_t v16 = a1[4];
  uint64_t v17 = a1[5];
  uint64_t v18 = a1[6];
  uint64_t v19 = a1[7];
  *a1 = v3;
  a1[1] = v4;
  a1[2] = v5;
  a1[3] = v6;
  a1[4] = v7;
  a1[5] = v8;
  a1[6] = v9;
  a1[7] = v10;
  a1[8] = v11;
  a1[9] = v21;
  a1[10] = v22;
  a1[11] = v23;
  sub_25AD07D54(v12, v13, v14, v15, v16, v17, v18, v19);
  return a1;
}

__n128 __swift_memcpy96_8(uint64_t a1, uint64_t a2)
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

uint64_t assignWithTake for ModeError(uint64_t a1, _OWORD *a2)
{
  uint64_t v3 = *(void *)a1;
  uint64_t v5 = *(void *)(a1 + 8);
  uint64_t v4 = *(void *)(a1 + 16);
  uint64_t v6 = *(void *)(a1 + 24);
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 40);
  uint64_t v9 = *(void *)(a1 + 48);
  uint64_t v10 = *(void *)(a1 + 56);
  long long v11 = a2[1];
  *(_OWORD *)a1 = *a2;
  *(_OWORD *)(a1 + 16) = v11;
  long long v12 = a2[3];
  *(_OWORD *)(a1 + 32) = a2[2];
  *(_OWORD *)(a1 + 48) = v12;
  long long v13 = a2[5];
  *(_OWORD *)(a1 + 64) = a2[4];
  *(_OWORD *)(a1 + 80) = v13;
  sub_25AD07D54(v3, v5, v4, v6, v7, v8, v9, v10);
  return a1;
}

uint64_t getEnumTagSinglePayload for ModeError(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 96)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  HIDWORD(v3) = *(_DWORD *)(a1 + 60);
  LODWORD(v3) = HIDWORD(v3);
  unsigned int v2 = v3 >> 31;
  if (v2 > 0x80000000) {
    int v4 = ~v2;
  }
  else {
    int v4 = -1;
  }
  return (v4 + 1);
}

double storeEnumTagSinglePayload for ModeError(uint64_t a1, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(a1 + 88) = 0;
    double result = 0.0;
    *(_OWORD *)(a1 + 72) = 0u;
    *(_OWORD *)(a1 + 56) = 0u;
    *(_OWORD *)(a1 + 40) = 0u;
    *(_OWORD *)(a1 + 24) = 0u;
    *(_OWORD *)(a1 + 8) = 0u;
    *(void *)a1 = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(a1 + 96) = 1;
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
      double result = 0.0;
      *(_OWORD *)(a1 + 16) = 0u;
      *(_OWORD *)(a1 + 32) = 0u;
      HIDWORD(v4) = -a2;
      LODWORD(v4) = -a2;
      *(_OWORD *)a1 = 0u;
      *(void *)(a1 + 48) = 0;
      *(void *)(a1 + 56) = (unint64_t)(v4 >> 1) << 32;
      *(_OWORD *)(a1 + 64) = 0u;
      *(_OWORD *)(a1 + 80) = 0u;
      return result;
    }
    *(unsigned char *)(a1 + 96) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

uint64_t sub_25AD080B0(uint64_t a1)
{
  return *(void *)(a1 + 56) >> 63;
}

uint64_t sub_25AD080BC(uint64_t result)
{
  *(void *)(result + 56) &= ~0x8000000000000000;
  return result;
}

uint64_t sub_25AD080CC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 60) = a2 << 31;
  return result;
}

ValueMetadata *type metadata accessor for ModeError()
{
  return &type metadata for ModeError;
}

_OWORD *sub_25AD080EC(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  long long v3 = a1[2];
  long long v4 = a1[3];
  long long v5 = a1[5];
  a2[4] = a1[4];
  a2[5] = v5;
  a2[2] = v3;
  a2[3] = v4;
  return a2;
}

uint64_t sub_25AD0810C(uint64_t a1)
{
  int64_t v1 = *(void *)(a1 + 16);
  uint64_t v2 = MEMORY[0x263F8EE78];
  if (!v1) {
    return v2;
  }
  uint64_t v3 = a1;
  uint64_t v30 = MEMORY[0x263F8EE78];
  sub_25AD0FD50(0, v1, 0);
  uint64_t v2 = v30;
  uint64_t result = sub_25AD0C03C(v3);
  uint64_t v6 = result;
  uint64_t v7 = 0;
  uint64_t v8 = v3 + 64;
  uint64_t v24 = v3 + 80;
  int64_t v25 = v1;
  int v26 = v5;
  uint64_t v27 = v3 + 64;
  while ((v6 & 0x8000000000000000) == 0 && v6 < 1 << *(unsigned char *)(v3 + 32))
  {
    unint64_t v11 = (unint64_t)v6 >> 6;
    if ((*(void *)(v8 + 8 * ((unint64_t)v6 >> 6)) & (1 << v6)) == 0) {
      goto LABEL_23;
    }
    if (*(_DWORD *)(v3 + 36) != v5) {
      goto LABEL_24;
    }
    uint64_t v28 = v7;
    long long v12 = (uint64_t *)(*(void *)(v3 + 48) + 16 * v6);
    uint64_t v13 = v12[1];
    uint64_t v29 = *v12;
    uint64_t v14 = *(void *)(*(void *)(v3 + 56) + 8 * v6);
    uint64_t v15 = v3;
    unint64_t v17 = *(void *)(v30 + 16);
    unint64_t v16 = *(void *)(v30 + 24);
    swift_bridgeObjectRetain();
    uint64_t result = swift_bridgeObjectRetain();
    if (v17 >= v16 >> 1) {
      uint64_t result = sub_25AD0FD50(v16 > 1, v17 + 1, 1);
    }
    *(void *)(v30 + 16) = v17 + 1;
    uint64_t v18 = (void *)(v30 + 24 * v17);
    v18[4] = v29;
    v18[5] = v13;
    v18[6] = v14;
    int64_t v9 = 1 << *(unsigned char *)(v15 + 32);
    if (v6 >= v9) {
      goto LABEL_25;
    }
    uint64_t v8 = v27;
    uint64_t v19 = *(void *)(v27 + 8 * v11);
    if ((v19 & (1 << v6)) == 0) {
      goto LABEL_26;
    }
    uint64_t v3 = v15;
    int v5 = v26;
    if (*(_DWORD *)(v15 + 36) != v26) {
      goto LABEL_27;
    }
    unint64_t v20 = v19 & (-2 << (v6 & 0x3F));
    if (v20)
    {
      int64_t v9 = __clz(__rbit64(v20)) | v6 & 0xFFFFFFFFFFFFFFC0;
      int64_t v10 = v25;
    }
    else
    {
      unint64_t v21 = v11 + 1;
      unint64_t v22 = (unint64_t)(v9 + 63) >> 6;
      int64_t v10 = v25;
      if (v11 + 1 < v22)
      {
        unint64_t v23 = *(void *)(v27 + 8 * v21);
        if (v23)
        {
LABEL_20:
          int64_t v9 = __clz(__rbit64(v23)) + (v21 << 6);
        }
        else
        {
          while (v22 - 2 != v11)
          {
            unint64_t v23 = *(void *)(v24 + 8 * v11++);
            if (v23)
            {
              unint64_t v21 = v11 + 1;
              goto LABEL_20;
            }
          }
        }
      }
    }
    uint64_t v7 = v28 + 1;
    uint64_t v6 = v9;
    if (v28 + 1 == v10) {
      return v2;
    }
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
LABEL_27:
  __break(1u);
  return result;
}

uint64_t sub_25AD0833C(uint64_t a1)
{
  uint64_t v2 = MEMORY[0x263F8EE78];
  uint64_t v13 = MEMORY[0x263F8EE78];
  sub_25AD148E0();
  uint64_t v3 = *(void *)(a1 + 16);
  swift_bridgeObjectRetain();
  if (v3)
  {
    type metadata accessor for ExpressionNode();
    uint64_t v12 = v3;
    uint64_t v4 = 0;
    int v5 = (uint64_t *)(a1 + 56);
    do
    {
      uint64_t v7 = *(v5 - 1);
      uint64_t v6 = *v5;
      uint64_t v9 = *(v5 - 3);
      uint64_t v8 = *(v5 - 2);
      int64_t v10 = (void *)swift_allocObject();
      void v10[2] = v9;
      v10[3] = v8;
      v10[4] = v7;
      v10[5] = v6;
      v10[6] = v4;
      v10[7] = v2;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_25AD148C0();
      sub_25AD148F0();
      sub_25AD14900();
      sub_25AD148D0();
      v5 += 4;
      ++v4;
    }
    while (v12 != v4);
  }
  swift_bridgeObjectRelease();
  return v13;
}

unint64_t sub_25AD08460()
{
  return sub_25AD0CD58(*v0, v0[1], v0[2]);
}

uint64_t sub_25AD0846C()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0228](v0, 64, 7);
}

uint64_t type metadata accessor for ExpressionNode()
{
  return self;
}

unint64_t sub_25AD084F4(unint64_t a1)
{
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = MEMORY[0x263F8EE78];
  uint64_t v3 = a1 >> 62;
  if (a1 >> 62) {
    goto LABEL_23;
  }
  size_t v4 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
LABEL_3:
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = sub_25ACFCA4C(0, v4);
  uint64_t v6 = v5 + 16;
  if (v3)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_25AD14940();
    if (v7) {
      goto LABEL_5;
    }
  }
  else
  {
    uint64_t v7 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v7)
    {
LABEL_5:
      swift_beginAccess();
      uint64_t v3 = 4;
      do
      {
        uint64_t v8 = v3 - 4;
        if ((a1 & 0xC000000000000001) != 0)
        {
          unint64_t v9 = MEMORY[0x261154BD0](v3 - 4, a1);
          BOOL v10 = __OFADD__(v8, 1);
          uint64_t v11 = v3 - 3;
          if (v10) {
            goto LABEL_20;
          }
        }
        else
        {
          unint64_t v9 = *(void *)(a1 + 8 * v3);
          swift_retain();
          BOOL v10 = __OFADD__(v8, 1);
          uint64_t v11 = v3 - 3;
          if (v10)
          {
LABEL_20:
            __break(1u);
LABEL_21:
            __break(1u);
LABEL_22:
            __break(1u);
LABEL_23:
            swift_bridgeObjectRetain();
            size_t v4 = sub_25AD14940();
            swift_bridgeObjectRelease();
            goto LABEL_3;
          }
        }
        unint64_t v12 = *(void *)(v9 + 48);
        if ((v12 & 0x8000000000000000) != 0) {
          goto LABEL_21;
        }
        if (v12 >= *(void *)(*(void *)v6 + 16)) {
          goto LABEL_22;
        }
        if (!*(unsigned char *)(*(void *)v6 + v12 + 32))
        {
          sub_25AD08734(v9, v5, v14);
          if (v1)
          {
            swift_release();
            swift_release();
            swift_bridgeObjectRelease();
            goto LABEL_19;
          }
        }
        swift_release();
        ++v3;
      }
      while (v11 != v7);
    }
  }
  swift_bridgeObjectRelease();
  swift_beginAccess();
  a1 = *(void *)(v14 + 16);
  swift_bridgeObjectRetain();
  swift_release();
LABEL_19:
  swift_release();
  return a1;
}

uint64_t sub_25AD08734(unint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v5 = a1;
  uint64_t v6 = (uint64_t *)(a2 + 16);
  unint64_t v7 = *(void *)(a1 + 48);
  swift_beginAccess();
  unint64_t v8 = *(void *)(a2 + 16);
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *(void *)(a2 + 16) = v8;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
    goto LABEL_24;
  }
  if ((v7 & 0x8000000000000000) == 0) {
    goto LABEL_3;
  }
LABEL_25:
  __break(1u);
LABEL_26:
  __break(1u);
  do
  {
    swift_bridgeObjectRetain();
    uint64_t v10 = sub_25AD14940();
    int64_t v23 = v7;
    if (!v10) {
      goto LABEL_28;
    }
LABEL_6:
    unint64_t v5 = v8 & 0xC000000000000001;
    swift_beginAccess();
    unint64_t v7 = 4;
    while (1)
    {
      unint64_t v11 = v7 - 4;
      if (!v5) {
        break;
      }
      uint64_t v12 = MEMORY[0x261154BD0](v7 - 4, v8);
      BOOL v13 = __OFADD__(v11, 1);
      unint64_t v14 = v7 - 3;
      if (v13) {
        goto LABEL_21;
      }
LABEL_14:
      unint64_t v15 = *(void *)(v12 + 48);
      if ((v15 & 0x8000000000000000) != 0) {
        goto LABEL_22;
      }
      if (v15 >= *(void *)(*v6 + 16)) {
        goto LABEL_23;
      }
      int v16 = *(unsigned __int8 *)(*v6 + v15 + 32);
      if (v16)
      {
        if (v16 != 2)
        {
          swift_bridgeObjectRelease();
          uint64_t v18 = *(void *)(v24 + 16);
          uint64_t v17 = *(void *)(v24 + 24);
          sub_25AD0CE88();
          swift_allocError();
          *(void *)uint64_t v19 = v18;
          *(void *)(v19 + 8) = v17;
          *(_OWORD *)(v19 + 16) = 0u;
          *(_OWORD *)(v19 + 32) = 0u;
          *(unsigned char *)(v19 + 48) = 0;
          swift_bridgeObjectRetain();
          swift_willThrow();
          return swift_release();
        }
      }
      else
      {
        sub_25AD08734(v12, a2, a3);
        if (v3)
        {
          swift_bridgeObjectRelease();
          return swift_release();
        }
      }
      swift_release();
      ++v7;
      if (v14 == v10) {
        goto LABEL_28;
      }
    }
    uint64_t v12 = *(void *)(v8 + 8 * v7);
    swift_retain();
    BOOL v13 = __OFADD__(v11, 1);
    unint64_t v14 = v7 - 3;
    if (!v13) {
      goto LABEL_14;
    }
LABEL_21:
    __break(1u);
LABEL_22:
    __break(1u);
LABEL_23:
    __break(1u);
LABEL_24:
    unint64_t v8 = (unint64_t)sub_25AD0BB50(v8);
    *uint64_t v6 = v8;
    if ((v7 & 0x8000000000000000) != 0) {
      goto LABEL_25;
    }
LABEL_3:
    if (v7 >= *(void *)(v8 + 16)) {
      goto LABEL_26;
    }
    *(unsigned char *)(v8 + v7 + 32) = 1;
    swift_endAccess();
    unint64_t v24 = v5;
    unint64_t v8 = *(void *)(v5 + 56);
  }
  while (v8 >> 62);
  uint64_t v10 = *(void *)((v8 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  int64_t v23 = v7;
  if (v10) {
    goto LABEL_6;
  }
LABEL_28:
  swift_bridgeObjectRelease();
  swift_beginAccess();
  uint64_t v21 = swift_retain();
  MEMORY[0x2611549C0](v21);
  if (*(void *)((*(void *)(a3 + 16) & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*(void *)(a3 + 16) & 0xFFFFFFFFFFFFFF8)
                                                                                     + 0x18) >> 1)
    sub_25AD146B0();
  sub_25AD146D0();
  sub_25AD146A0();
  swift_endAccess();
  swift_beginAccess();
  uint64_t v22 = *v6;
  uint64_t result = swift_isUniquelyReferenced_nonNull_native();
  *uint64_t v6 = v22;
  if ((result & 1) == 0)
  {
    uint64_t result = (uint64_t)sub_25AD0BB50(v22);
    uint64_t v22 = result;
    *uint64_t v6 = result;
  }
  if (v23 >= *(void *)(v22 + 16))
  {
    __break(1u);
  }
  else
  {
    *(unsigned char *)(v22 + v23 + 32) = 2;
    return swift_endAccess();
  }
  return result;
}

unint64_t sub_25AD08A4C()
{
  sub_25AD0D444(v0, (uint64_t)v5);
  switch(v6)
  {
    case 1:
      sub_25AD14860();
      swift_bridgeObjectRelease();
      unint64_t v4 = 0xD00000000000002BLL;
      break;
    case 2:
      unint64_t v1 = v5[4];
      sub_25AD14860();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      unint64_t v4 = v1;
      sub_25AD145A0();
      sub_25AD145A0();
      sub_25AD145A0();
      break;
    case 3:
      unint64_t v2 = v5[0];
      sub_25AD14860();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      unint64_t v4 = v2;
      break;
    default:
      sub_25AD14860();
      swift_bridgeObjectRelease();
      unint64_t v4 = 0xD000000000000011;
      sub_25AD145A0();
      break;
  }
  sub_25AD145A0();
  return v4;
}

unint64_t sub_25AD08C74()
{
  sub_25AD0D444(v0, (uint64_t)v2);
  return sub_25AD08A4C();
}

uint64_t sub_25AD08CAC(long long *a1, long long *a2)
{
  sub_25AD0D444(a1, (uint64_t)v4);
  sub_25AD0D444(a2, (uint64_t)v5);
  return sub_25AD0C0C4(v4, v5) & 1;
}

uint64_t sub_25AD08CF8(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
  char v6 = v4;
  uint64_t v10 = swift_bridgeObjectRetain();
  unint64_t v132 = sub_25AD0833C(v10);
  uint64_t v129 = a1;
  swift_bridgeObjectRelease();
  uint64_t v11 = *(void *)(a4 + 16);
  uint64_t v12 = (void *)MEMORY[0x263F8EE78];
  uint64_t v130 = a4;
  if (v11)
  {
    uint64_t v127 = a3;
    BOOL v13 = v6;
    swift_bridgeObjectRetain();
    unint64_t v14 = (uint64_t *)(a4 + 40);
    do
    {
      uint64_t v16 = *v14;
      if (*v14)
      {
        uint64_t v17 = *(v14 - 1);
        swift_bridgeObjectRetain();
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v12 = sub_25ACFFF04(0, v12[2] + 1, 1, v12);
        }
        unint64_t v19 = v12[2];
        unint64_t v18 = v12[3];
        if (v19 >= v18 >> 1) {
          uint64_t v12 = sub_25ACFFF04((void *)(v18 > 1), v19 + 1, 1, v12);
        }
        void v12[2] = v19 + 1;
        unint64_t v15 = &v12[2 * v19];
        v15[4] = v17;
        v15[5] = v16;
      }
      v14 += 2;
      --v11;
    }
    while (v11);
    a4 = v130;
    swift_bridgeObjectRelease();
    char v6 = v13;
    a3 = v127;
  }
  uint64_t v20 = sub_25AD0312C((uint64_t)v12);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v21 = sub_25AD0C288(v132, v20, a3);
  if (v5)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    goto LABEL_15;
  }
  uint64_t v22 = (void *)v21;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  uint64_t v23 = swift_bridgeObjectRetain();
  uint64_t v24 = sub_25AD0BBA0(v23, v20);
  swift_bridgeObjectRelease();
  if (*(void *)(v24 + 16))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v137 = v24;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B3888);
    sub_25AD0CE2C();
    sub_25ACEDE04();
    uint64_t v25 = sub_25AD14660();
    uint64_t v27 = v26;
    swift_release();
    sub_25AD0CE88();
    swift_allocError();
    *(_OWORD *)uint64_t v28 = xmmword_25AD17B80;
    *(_OWORD *)(v28 + 16) = xmmword_25AD17B90;
    *(void *)(v28 + 32) = v25;
    *(void *)(v28 + 40) = v27;
    *(unsigned char *)(v28 + 48) = 2;
    swift_willThrow();
    goto LABEL_15;
  }
  swift_release();
  if (v22[2])
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B38A0);
    uint64_t v30 = sub_25AD14970();
  }
  else
  {
    uint64_t v30 = MEMORY[0x263F8EE80];
  }
  uint64_t v137 = v30;
  sub_25AD0A70C(v22, 1, &v137);
  unint64_t v31 = v132;
  uint64_t v32 = v137;
  if (v132 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v33 = sub_25AD14940();
    uint64_t v123 = v6;
    if (v33) {
      goto LABEL_22;
    }
  }
  else
  {
    uint64_t v33 = *(void *)((v132 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    uint64_t v123 = v6;
    if (v33)
    {
LABEL_22:
      if (v33 < 1) {
        goto LABEL_112;
      }
      uint64_t v34 = 0;
      do
      {
        if ((v132 & 0xC000000000000001) != 0)
        {
          uint64_t v35 = MEMORY[0x261154BD0](v34, v132);
        }
        else
        {
          uint64_t v35 = *(void *)(v132 + 8 * v34 + 32);
          swift_retain();
        }
        ++v34;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_retain();
        uint64_t v36 = swift_bridgeObjectRetain();
        uint64_t v37 = sub_25AD0C6F0(v36, a3, v20, v32);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_release();
        *(void *)(v35 + 56) = v37;
        swift_release();
        swift_bridgeObjectRelease();
        a4 = v130;
      }
      while (v33 != v34);
    }
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  unint64_t v125 = sub_25AD084F4(v132);
  swift_bridgeObjectRelease();
  uint64_t v38 = sub_25AD0810C(a3);
  uint64_t v137 = MEMORY[0x263F8EE78];
  swift_bridgeObjectRetain();
  sub_25AD0FBA0(0, 0, 0);
  uint64_t v39 = v137;
  uint64_t v120 = v38;
  uint64_t v126 = *(void *)(v38 + 16);
  uint64_t v127 = a3;
  if (v126)
  {
    swift_bridgeObjectRetain();
    uint64_t v40 = 0;
    uint64_t v41 = (uint64_t *)(v38 + 40);
    do
    {
      uint64_t v43 = *(v41 - 1);
      uint64_t v42 = *v41;
      uint64_t v137 = v39;
      unint64_t v45 = *(void *)(v39 + 16);
      unint64_t v44 = *(void *)(v39 + 24);
      swift_bridgeObjectRetain();
      if (v45 >= v44 >> 1)
      {
        sub_25AD0FBA0(v44 > 1, v45 + 1, 1);
        uint64_t v39 = v137;
      }
      v41 += 3;
      *(void *)(v39 + 16) = v45 + 1;
      uint64_t v46 = (void *)(v39 + 24 * v45);
      v46[5] = v42;
      v46[6] = v40;
      v46[4] = v43;
      ++v40;
    }
    while (v126 != v40);
    swift_bridgeObjectRelease();
    a3 = v127;
    a4 = v130;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  unint64_t v47 = swift_bridgeObjectRetain();
  uint64_t v48 = sub_25AD0CBAC(v47, a3);
  swift_bridgeObjectRelease();
  uint64_t v49 = swift_bridgeObjectRelease();
  MEMORY[0x270FA5388](v49);
  uint64_t v50 = sub_25AD0CA5C(a4, sub_25AD0CEDC);
  swift_bridgeObjectRelease();
  uint64_t v137 = v39;
  sub_25ACFDA48(v48);
  sub_25ACFDA48((uint64_t)v50);
  if (*(void *)(v137 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B34D0);
    uint64_t v51 = sub_25AD14970();
  }
  else
  {
    uint64_t v51 = MEMORY[0x263F8EE80];
  }
  uint64_t v137 = v51;
  uint64_t v52 = (void *)swift_bridgeObjectRetain();
  sub_25AD0A38C(v52, 1, &v137);
  unint64_t v31 = v125;
  swift_bridgeObjectRelease();
  uint64_t v124 = v137;
  if (v125 >> 62) {
    goto LABEL_113;
  }
  uint64_t v53 = *(void *)((v125 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    char v6 = v123;
    uint64_t v54 = (void *)MEMORY[0x263F8EE78];
    uint64_t v131 = v53;
    if (v53)
    {
      uint64_t v137 = MEMORY[0x263F8EE78];
      sub_25AD0FD30(0, v53 & ~(v53 >> 63), 0);
      if (v53 < 0)
      {
        __break(1u);
LABEL_115:
        __break(1u);
        goto LABEL_116;
      }
      uint64_t v55 = (void *)v137;
      unint64_t v31 = v125;
      if ((v125 & 0xC000000000000001) != 0)
      {
        uint64_t v56 = 0;
        do
        {
          uint64_t v57 = v55;
          long long v133 = *(_OWORD *)(MEMORY[0x261154BD0](v56, v31) + 32);
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_unknownObjectRelease();
          uint64_t v55 = v57;
          uint64_t v137 = (uint64_t)v57;
          unint64_t v58 = v57[2];
          unint64_t v59 = v55[3];
          if (v58 >= v59 >> 1)
          {
            sub_25AD0FD30(v59 > 1, v58 + 1, 1);
            unint64_t v31 = v125;
            uint64_t v55 = (void *)v137;
          }
          ++v56;
          v55[2] = v58 + 1;
          *(_OWORD *)&v55[2 * v58 + 4] = v133;
        }
        while (v131 != v56);
      }
      else
      {
        unint64_t v60 = v125 + 32;
        uint64_t v61 = v53;
        do
        {
          long long v134 = *(_OWORD *)(*(void *)v60 + 32);
          uint64_t v137 = (uint64_t)v55;
          unint64_t v63 = v55[2];
          unint64_t v62 = v55[3];
          uint64_t v64 = v55;
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          if (v63 >= v62 >> 1)
          {
            sub_25AD0FD30(v62 > 1, v63 + 1, 1);
            unint64_t v31 = v125;
            uint64_t v64 = (void *)v137;
          }
          v64[2] = v63 + 1;
          *(_OWORD *)&v64[2 * v63 + 4] = v134;
          v60 += 8;
          --v61;
          uint64_t v55 = v64;
        }
        while (v61);
      }
      char v6 = v123;
      uint64_t v54 = (void *)MEMORY[0x263F8EE78];
    }
    else
    {
      uint64_t v55 = (void *)MEMORY[0x263F8EE78];
    }
    uint64_t v65 = v55[2];
    if (!v65)
    {
LABEL_72:
      unint64_t v122 = v55;
      swift_release();
      _OWORD v6[2] = v122;
      if (v126)
      {
        int64_t v136 = *(void *)(v120 + 16);
        if (!v136)
        {
LABEL_116:
          __break(1u);
          goto LABEL_117;
        }
        int64_t v85 = *(void **)(*(void *)(v120 + 48) + 16);
        swift_bridgeObjectRetain();
        if (v85)
        {
          char v6 = 0;
          uint64_t v86 = v54;
LABEL_76:
          uint64_t v87 = a3;
          unint64_t v88 = (unint64_t)v6;
          char v6 = (void *)((char *)v6 + 1);
          uint64_t v137 = MEMORY[0x263F8EE78];
          a3 = v136;
          sub_25AD0FD10(0, v136, 0);
          uint64_t v89 = v137;
          uint64_t v90 = 48;
          uint64_t v91 = v120;
          while (1)
          {
            uint64_t v92 = *(void *)(v91 + v90);
            if (v88 >= *(void *)(v92 + 16)) {
              break;
            }
            uint64_t v93 = *(void *)(v92 + 8 * v88 + 32);
            uint64_t v137 = v89;
            unint64_t v95 = *(void *)(v89 + 16);
            unint64_t v94 = *(void *)(v89 + 24);
            if (v95 >= v94 >> 1)
            {
              sub_25AD0FD10(v94 > 1, v95 + 1, 1);
              uint64_t v91 = v120;
              uint64_t v89 = v137;
            }
            *(void *)(v89 + 16) = v95 + 1;
            *(void *)(v89 + 8 * v95 + 32) = v93;
            v90 += 24;
            if (!--a3)
            {
              if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
                uint64_t v86 = sub_25ACFFDE0(0, v86[2] + 1, 1, v86);
              }
              a3 = v87;
              unint64_t v97 = v86[2];
              unint64_t v96 = v86[3];
              if (v97 >= v96 >> 1) {
                uint64_t v86 = sub_25ACFFDE0((void *)(v96 > 1), v97 + 1, 1, v86);
              }
              v86[2] = v97 + 1;
              v86[v97 + 4] = v89;
              if (v6 == v85)
              {
                swift_bridgeObjectRelease();
                char v6 = v123;
                unint64_t v31 = v125;
                uint64_t v54 = (void *)MEMORY[0x263F8EE78];
                goto LABEL_92;
              }
              goto LABEL_76;
            }
          }
          __break(1u);
          goto LABEL_103;
        }
      }
      else
      {
        swift_bridgeObjectRetain();
      }
      swift_bridgeObjectRelease();
      uint64_t v86 = (void *)MEMORY[0x263F8EE78];
LABEL_92:
      if (a2)
      {
        swift_bridgeObjectRetain();
        uint64_t v99 = sub_25AD0C508(v31, a2);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease_n();
        goto LABEL_109;
      }
      if (v131)
      {
        uint64_t v100 = a3;
        uint64_t v137 = (uint64_t)v54;
        sub_25AD0FCF0(0, v131 & ~(v131 >> 63), 0);
        uint64_t v101 = v131;
        if (v131 < 0)
        {
LABEL_117:
          __break(1u);
          uint64_t result = swift_unexpectedError();
          __break(1u);
          return result;
        }
        uint64_t v102 = v6;
        uint64_t v99 = v137;
        if ((v125 & 0xC000000000000001) != 0)
        {
          uint64_t v103 = 0;
          do
          {
            uint64_t v104 = *(void *)(MEMORY[0x261154BD0](v103, v125) + 48);
            swift_unknownObjectRelease();
            uint64_t v137 = v99;
            unint64_t v106 = *(void *)(v99 + 16);
            unint64_t v105 = *(void *)(v99 + 24);
            if (v106 >= v105 >> 1)
            {
              sub_25AD0FCF0(v105 > 1, v106 + 1, 1);
              uint64_t v99 = v137;
            }
            ++v103;
            *(void *)(v99 + 16) = v106 + 1;
            uint64_t v107 = v99 + 16 * v106;
            *(void *)(v107 + 32) = v104;
            *(unsigned char *)(v107 + 40) = 0;
          }
          while (v131 != v103);
        }
        else
        {
          uint64_t v108 = 0;
          uint64_t v109 = *(void *)(v137 + 16);
          uint64_t v110 = 16 * v109;
          do
          {
            uint64_t v111 = *(void *)(*(void *)(v125 + 8 * v108 + 32) + 48);
            uint64_t v137 = v99;
            unint64_t v112 = *(void *)(v99 + 24);
            uint64_t v113 = v109 + v108 + 1;
            if (v109 + v108 >= v112 >> 1)
            {
              sub_25AD0FCF0(v112 > 1, v109 + v108 + 1, 1);
              uint64_t v101 = v131;
              uint64_t v99 = v137;
            }
            ++v108;
            *(void *)(v99 + 16) = v113;
            uint64_t v114 = v99 + v110;
            *(void *)(v114 + 32) = v111;
            *(unsigned char *)(v114 + 40) = 0;
            v110 += 16;
          }
          while (v101 != v108);
        }
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        char v6 = v102;
        a3 = v100;
        goto LABEL_109;
      }
LABEL_103:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v99 = MEMORY[0x263F8EE78];
LABEL_109:
      _OWORD v6[5] = v99;
      v6[3] = v86;
      uint64_t v115 = *(void *)(a3 + 16);
      swift_bridgeObjectRelease();
      uint64_t v116 = *(void *)(v129 + 16);
      swift_bridgeObjectRelease();
      if (!__OFADD__(v115, v116))
      {
        v6[4] = v115 + v116;
        return (uint64_t)v6;
      }
      goto LABEL_115;
    }
    unint64_t v66 = 0;
    uint64_t v117 = v55[2];
LABEL_56:
    uint64_t v121 = v55;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v121 = sub_25AD0BB64(v121);
    }
    if (v66 < v121[2]) {
      break;
    }
    __break(1u);
LABEL_112:
    __break(1u);
LABEL_113:
    swift_bridgeObjectRetain();
    uint64_t v53 = sub_25AD14940();
    swift_bridgeObjectRelease();
  }
  long long v67 = &v121[2 * v66];
  uint64_t v70 = v67[4];
  uint64_t v69 = v67 + 4;
  uint64_t v68 = v70;
  int64_t v71 = *(void *)(v70 + 16);
  if (!v71)
  {
    uint64_t v72 = v54;
LABEL_71:
    ++v66;
    swift_bridgeObjectRelease();
    *uint64_t v69 = v72;
    uint64_t v55 = v121;
    char v6 = v123;
    if (v66 == v65) {
      goto LABEL_72;
    }
    goto LABEL_56;
  }
  long long v118 = v69;
  unint64_t v119 = v66;
  uint64_t v137 = (uint64_t)v54;
  swift_bridgeObjectRetain();
  sub_25AD0FCD0(0, v71, 0);
  unint64_t v31 = v125;
  uint64_t v72 = (void *)v137;
  int v73 = (unsigned __int8 *)(v68 + 56);
  while (1)
  {
    uint64_t v74 = *((void *)v73 - 3);
    uint64_t v75 = *((void *)v73 - 2);
    uint64_t v76 = *((void *)v73 - 1);
    int v77 = *v73;
    uint64_t v135 = v74;
    if (v77 != 1)
    {
      sub_25AD0CEE4(v74, v75, v76, v77);
      goto LABEL_66;
    }
    uint64_t v78 = *(void *)(v124 + 16);
    sub_25AD0CEE4(v74, v75, v76, 1u);
    if (!v78)
    {
      swift_bridgeObjectRetain();
      goto LABEL_89;
    }
    sub_25AD0CEE4(v74, v75, v76, 1u);
    swift_bridgeObjectRetain();
    unint64_t v79 = sub_25AD0A230(v74, v75);
    if ((v80 & 1) == 0) {
      break;
    }
    uint64_t v81 = *(void *)(*(void *)(v124 + 56) + 8 * v79);
    sub_25AD0CF00(v74, v75, v76, 1u);
    sub_25AD0CF00(v74, v75, v76, 1u);
    LOBYTE(v77) = 2;
    uint64_t v76 = v81;
    unint64_t v31 = v125;
LABEL_66:
    uint64_t v137 = (uint64_t)v72;
    unint64_t v83 = v72[2];
    unint64_t v82 = v72[3];
    if (v83 >= v82 >> 1)
    {
      sub_25AD0FCD0(v82 > 1, v83 + 1, 1);
      unint64_t v31 = v125;
      uint64_t v72 = (void *)v137;
    }
    v73 += 32;
    v72[2] = v83 + 1;
    uint64_t v84 = &v72[4 * v83];
    v84[4] = v135;
    v84[5] = v75;
    v84[6] = v76;
    *((unsigned char *)v84 + 56) = v77;
    --v71;
    a3 = v127;
    if (!v71)
    {
      swift_bridgeObjectRelease();
      uint64_t v69 = v118;
      unint64_t v66 = v119;
      uint64_t v54 = (void *)MEMORY[0x263F8EE78];
      uint64_t v65 = v117;
      goto LABEL_71;
    }
  }
  sub_25AD0CF00(v74, v75, v76, 1u);
LABEL_89:
  sub_25AD0CF1C();
  swift_allocError();
  *(void *)uint64_t v98 = v74;
  *(void *)(v98 + 8) = v75;
  *(unsigned char *)(v98 + 16) = 0;
  swift_willThrow();
  sub_25AD0CF00(v74, v75, v76, 1u);
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  char v6 = v123;
LABEL_15:
  type metadata accessor for Evaluator();
  swift_deallocPartialClassInstance();
  return (uint64_t)v6;
}

uint64_t sub_25AD09C40(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (!a3)
  {
    a2 = 0;
LABEL_6:
    swift_bridgeObjectRetain();
    return a2;
  }
  uint64_t v5 = *(void *)(a4 + 16);
  uint64_t v6 = *(void *)(a5 + 16);
  BOOL v7 = __OFADD__(v5, v6);
  uint64_t v8 = v5 + v6;
  if (v7)
  {
    __break(1u);
  }
  else if (!__OFADD__(v8, result))
  {
    goto LABEL_6;
  }
  __break(1u);
  return result;
}

uint64_t sub_25AD09CB0(unsigned __int8 a1, uint64_t a2, void *a3)
{
  uint64_t v5 = v4;
  uint64_t v6 = v3;
  BOOL v9 = a1 > 1u;
  uint64_t v10 = v3[3];
  uint64_t v11 = (void *)MEMORY[0x263F8EE78];
  uint64_t v12 = (void *)MEMORY[0x263F8EE78];
  if (*(void *)(v10 + 16) > (unint64_t)v9)
  {
    uint64_t v12 = *(void **)(v10 + 8 * v9 + 32);
    swift_bridgeObjectRetain();
  }
  uint64_t v13 = v3[4];
  uint64_t v37 = v12[2];
  if (__OFSUB__(v13, v37))
  {
LABEL_32:
    __break(1u);
    goto LABEL_33;
  }
  uint64_t v14 = sub_25ACFCC0C(v13 - v37, 0.0);
  uint64_t v40 = v12;
  swift_bridgeObjectRetain();
  sub_25ACFE398(v14);
  uint64_t v15 = swift_bridgeObjectRetain();
  sub_25ACFE398(v15);
  uint64_t v3 = v12;
  a2 = v6[2];
  uint64_t v36 = *(void *)(a2 + 16);
  if (v36)
  {
    uint64_t v16 = (void *)*a3;
    swift_bridgeObjectRetain();
    uint64_t v39 = v16;
    uint64_t v34 = a3;
    if (swift_isUniquelyReferenced_nonNull_native())
    {
LABEL_6:
      unint64_t v17 = 0;
      uint64_t v38 = a2 + 32;
      uint64_t v35 = a2;
      uint64_t v33 = v6;
      while (1)
      {
        uint64_t v18 = *(void *)(v38 + 16 * v17);
        uint64_t v40 = v11;
        uint64_t v19 = *(void *)(v18 + 16);
        if (v19)
        {
          swift_bridgeObjectRetain_n();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          uint64_t v20 = (unsigned __int8 *)(v18 + 56);
          while (1)
          {
            uint64_t v21 = (void *)*((void *)v20 - 3);
            uint64_t v22 = *((void *)v20 - 2);
            uint64_t v23 = *((void *)v20 - 1);
            unsigned __int8 v24 = *v20;
            sub_25AD0CEE4((uint64_t)v21, v22, v23, *v20);
            sub_25AD0E8DC((uint64_t)&v40, (uint64_t)v3, v21, v22, v23, v24);
            if (v5) {
              break;
            }
            v20 += 32;
            sub_25AD0CF00((uint64_t)v21, v22, v23, v24);
            if (!--v19)
            {
              swift_bridgeObjectRelease();
              uint64_t v25 = v40;
              uint64_t v6 = v33;
              uint64_t v11 = (void *)MEMORY[0x263F8EE78];
              a2 = v35;
              goto LABEL_13;
            }
          }
          sub_25AD0CF00((uint64_t)v21, v22, v23, v24);
          swift_bridgeObjectRelease();
          *uint64_t v34 = v39;
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          return swift_bridgeObjectRelease();
        }
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        uint64_t v25 = v11;
LABEL_13:
        uint64_t v26 = v25[2];
        if (!v26)
        {
          __break(1u);
LABEL_29:
          __break(1u);
LABEL_30:
          __break(1u);
LABEL_31:
          __break(1u);
          goto LABEL_32;
        }
        uint64_t v27 = v25[4];
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t result = swift_bridgeObjectRelease();
        if (v26 != 1) {
          goto LABEL_29;
        }
        uint64_t v29 = v6[5];
        if (v17 >= *(void *)(v29 + 16)) {
          goto LABEL_30;
        }
        uint64_t v30 = v29 + 16 * v17;
        if ((*(unsigned char *)(v30 + 40) & 1) == 0)
        {
          unint64_t v31 = *(void *)(v30 + 32);
          if ((v31 & 0x8000000000000000) != 0)
          {
            __break(1u);
LABEL_35:
            __break(1u);
            return result;
          }
          if (v31 >= v39[2]) {
            goto LABEL_35;
          }
          v39[v31 + 4] = v27;
        }
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v3 = sub_25AD0BB8C(v3);
        }
        uint64_t v32 = v37 + v17;
        if (v37 + v17 >= v3[2]) {
          goto LABEL_31;
        }
        ++v17;
        v3[v32 + 4] = v27;
        if (v17 == v36)
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          uint64_t result = swift_bridgeObjectRelease();
          *uint64_t v34 = v39;
          return result;
        }
      }
    }
LABEL_33:
    uint64_t v39 = sub_25AD0BB8C(v39);
    goto LABEL_6;
  }
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_25AD0A048()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0228](v0, 48, 7);
}

uint64_t type metadata accessor for Evaluator()
{
  return self;
}

uint64_t destroy for NamedExpression()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for NamedExpression(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for NamedExpression(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for NamedExpression(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRelease();
  return a1;
}

ValueMetadata *type metadata accessor for NamedExpression()
{
  return &type metadata for NamedExpression;
}

unint64_t sub_25AD0A230(uint64_t a1, uint64_t a2)
{
  sub_25AD14B70();
  sub_25AD14570();
  uint64_t v4 = sub_25AD14B90();
  return sub_25AD0A2A8(a1, a2, v4);
}

unint64_t sub_25AD0A2A8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_25AD14AF0() & 1) == 0)
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
      while (!v14 && (sub_25AD14AF0() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_25AD0A38C(void *a1, char a2, void *a3)
{
  uint64_t v4 = a1[2];
  if (!v4) {
    return swift_bridgeObjectRelease();
  }
  uint64_t v8 = a1[4];
  uint64_t v7 = a1[5];
  uint64_t v42 = a1[6];
  swift_bridgeObjectRetain();
  uint64_t v9 = (void *)*a3;
  swift_bridgeObjectRetain();
  unint64_t v11 = sub_25AD0A230(v8, v7);
  uint64_t v12 = v9[2];
  BOOL v13 = (v10 & 1) == 0;
  uint64_t v14 = v12 + v13;
  if (__OFADD__(v12, v13)) {
    goto LABEL_23;
  }
  char v15 = v10;
  if (v9[3] >= v14)
  {
    if (a2)
    {
      if (v10) {
        goto LABEL_10;
      }
    }
    else
    {
      sub_25AD0AE44();
      if (v15) {
        goto LABEL_10;
      }
    }
LABEL_13:
    uint64_t v20 = (void *)*a3;
    *(void *)(*a3 + 8 * (v11 >> 6) + 64) |= 1 << v11;
    uint64_t v21 = (uint64_t *)(v20[6] + 16 * v11);
    *uint64_t v21 = v8;
    v21[1] = v7;
    *(void *)(v20[7] + 8 * v11) = v42;
    uint64_t v22 = v20[2];
    BOOL v23 = __OFADD__(v22, 1);
    uint64_t v24 = v22 + 1;
    if (v23)
    {
LABEL_24:
      __break(1u);
      goto LABEL_25;
    }
    v20[2] = v24;
    uint64_t v25 = v4 - 1;
    if (v4 == 1) {
      return swift_bridgeObjectRelease_n();
    }
    for (unint64_t i = a1 + 9; ; i += 3)
    {
      uint64_t v28 = *(i - 2);
      uint64_t v27 = *(i - 1);
      uint64_t v29 = *i;
      uint64_t v30 = (void *)*a3;
      swift_bridgeObjectRetain();
      unint64_t v31 = sub_25AD0A230(v28, v27);
      uint64_t v33 = v30[2];
      BOOL v34 = (v32 & 1) == 0;
      BOOL v23 = __OFADD__(v33, v34);
      uint64_t v35 = v33 + v34;
      if (v23) {
        break;
      }
      char v36 = v32;
      if (v30[3] < v35)
      {
        sub_25AD0B4DC(v35, 1);
        unint64_t v31 = sub_25AD0A230(v28, v27);
        if ((v36 & 1) != (v37 & 1)) {
          goto LABEL_25;
        }
      }
      if (v36) {
        goto LABEL_10;
      }
      uint64_t v38 = (void *)*a3;
      *(void *)(*a3 + 8 * (v31 >> 6) + 64) |= 1 << v31;
      uint64_t v39 = (uint64_t *)(v38[6] + 16 * v31);
      uint64_t *v39 = v28;
      v39[1] = v27;
      *(void *)(v38[7] + 8 * v31) = v29;
      uint64_t v40 = v38[2];
      BOOL v23 = __OFADD__(v40, 1);
      uint64_t v41 = v40 + 1;
      if (v23) {
        goto LABEL_24;
      }
      void v38[2] = v41;
      if (!--v25) {
        return swift_bridgeObjectRelease_n();
      }
    }
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  sub_25AD0B4DC(v14, a2 & 1);
  unint64_t v16 = sub_25AD0A230(v8, v7);
  if ((v15 & 1) == (v17 & 1))
  {
    unint64_t v11 = v16;
    if ((v15 & 1) == 0) {
      goto LABEL_13;
    }
LABEL_10:
    uint64_t v19 = swift_allocError();
    swift_willThrow();
    MEMORY[0x261155480](v19);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B31A0);
    if ((swift_dynamicCast() & 1) == 0)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease_n();
      return MEMORY[0x261155470](v19);
    }
    goto LABEL_26;
  }
LABEL_25:
  sub_25AD14B20();
  __break(1u);
LABEL_26:
  sub_25AD14860();
  sub_25AD145A0();
  sub_25AD14910();
  sub_25AD145A0();
  uint64_t result = sub_25AD14930();
  __break(1u);
  return result;
}

uint64_t sub_25AD0A70C(void *a1, char a2, void *a3)
{
  if (!a1[2]) {
    return swift_bridgeObjectRelease();
  }
  uint64_t v44 = a1[2];
  uint64_t v6 = a1[4];
  uint64_t v7 = a1[5];
  uint64_t v8 = a1[6];
  swift_bridgeObjectRetain();
  uint64_t v9 = (void *)*a3;
  swift_bridgeObjectRetain();
  swift_retain();
  unint64_t v11 = sub_25AD0A230(v6, v7);
  uint64_t v12 = v9[2];
  BOOL v13 = (v10 & 1) == 0;
  uint64_t v14 = v12 + v13;
  if (__OFADD__(v12, v13)) {
    goto LABEL_23;
  }
  char v15 = v10;
  if (v9[3] >= v14)
  {
    if (a2)
    {
      if (v10) {
        goto LABEL_10;
      }
    }
    else
    {
      sub_25AD0AFF4();
      if (v15) {
        goto LABEL_10;
      }
    }
LABEL_13:
    BOOL v23 = (void *)*a3;
    *(void *)(*a3 + 8 * (v11 >> 6) + 64) |= 1 << v11;
    uint64_t v24 = (uint64_t *)(v23[6] + 16 * v11);
    *uint64_t v24 = v6;
    v24[1] = v7;
    *(void *)(v23[7] + 8 * v11) = v8;
    uint64_t v25 = v23[2];
    BOOL v26 = __OFADD__(v25, 1);
    uint64_t v27 = v25 + 1;
    if (v26)
    {
LABEL_24:
      __break(1u);
      goto LABEL_25;
    }
    v23[2] = v27;
    uint64_t v28 = v44 - 1;
    if (v44 == 1) {
      return swift_bridgeObjectRelease_n();
    }
    for (unint64_t i = a1 + 9; ; i += 3)
    {
      uint64_t v30 = *(i - 2);
      uint64_t v31 = *(i - 1);
      uint64_t v8 = *i;
      char v32 = (void *)*a3;
      swift_bridgeObjectRetain();
      swift_retain();
      unint64_t v33 = sub_25AD0A230(v30, v31);
      uint64_t v35 = v32[2];
      BOOL v36 = (v34 & 1) == 0;
      BOOL v26 = __OFADD__(v35, v36);
      uint64_t v37 = v35 + v36;
      if (v26) {
        break;
      }
      char v38 = v34;
      if (v32[3] < v37)
      {
        sub_25AD0B7E8(v37, 1);
        unint64_t v33 = sub_25AD0A230(v30, v31);
        if ((v38 & 1) != (v39 & 1)) {
          goto LABEL_25;
        }
      }
      if (v38) {
        goto LABEL_10;
      }
      uint64_t v40 = (void *)*a3;
      *(void *)(*a3 + 8 * (v33 >> 6) + 64) |= 1 << v33;
      uint64_t v41 = (uint64_t *)(v40[6] + 16 * v33);
      *uint64_t v41 = v30;
      v41[1] = v31;
      *(void *)(v40[7] + 8 * v33) = v8;
      uint64_t v42 = v40[2];
      BOOL v26 = __OFADD__(v42, 1);
      uint64_t v43 = v42 + 1;
      if (v26) {
        goto LABEL_24;
      }
      v40[2] = v43;
      if (!--v28) {
        return swift_bridgeObjectRelease_n();
      }
    }
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  sub_25AD0B7E8(v14, a2 & 1);
  unint64_t v16 = sub_25AD0A230(v6, v7);
  if ((v15 & 1) == (v17 & 1))
  {
    unint64_t v11 = v16;
    if ((v15 & 1) == 0) {
      goto LABEL_13;
    }
LABEL_10:
    uint64_t v20 = *(void *)(v8 + 16);
    uint64_t v19 = *(void *)(v8 + 24);
    sub_25AD0CE88();
    uint64_t v21 = swift_allocError();
    *(void *)uint64_t v22 = v20;
    *(void *)(v22 + 8) = v19;
    *(_OWORD *)(v22 + 16) = 0u;
    *(_OWORD *)(v22 + 32) = 0u;
    *(unsigned char *)(v22 + 48) = 1;
    swift_bridgeObjectRetain();
    swift_willThrow();
    MEMORY[0x261155480](v21);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B31A0);
    if ((swift_dynamicCast() & 1) == 0)
    {
      swift_release();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return MEMORY[0x261155470](v21);
    }
    goto LABEL_26;
  }
LABEL_25:
  sub_25AD14B20();
  __break(1u);
LABEL_26:
  sub_25AD14860();
  sub_25AD145A0();
  sub_25AD14910();
  sub_25AD145A0();
  uint64_t result = sub_25AD14930();
  __break(1u);
  return result;
}

void *sub_25AD0AACC()
{
  unint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B32E0);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_25AD14950();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    uint64_t *v1 = v4;
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
    int64_t v27 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v27 >= v13) {
      goto LABEL_26;
    }
    unint64_t v28 = *(void *)(v6 + 8 * v27);
    ++v9;
    if (!v28)
    {
      int64_t v9 = v27 + 1;
      if (v27 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v28 = *(void *)(v6 + 8 * v9);
      if (!v28) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v28 - 1) & v28;
    unint64_t v15 = __clz(__rbit64(v28)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    char v17 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    uint64_t v20 = 32 * v15;
    uint64_t v21 = *(void *)(v2 + 56) + v20;
    uint64_t v22 = *(void *)v21;
    uint64_t v23 = *(void *)(v21 + 8);
    uint64_t v24 = (void *)(*(void *)(v4 + 48) + v16);
    long long v25 = *(_OWORD *)(v21 + 16);
    *uint64_t v24 = v19;
    v24[1] = v18;
    uint64_t v26 = *(void *)(v4 + 56) + v20;
    *(void *)uint64_t v26 = v22;
    *(void *)(v26 + 8) = v23;
    *(_OWORD *)(v26 + 16) = v25;
    swift_bridgeObjectRetain();
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v29 = v27 + 2;
  if (v29 >= v13) {
    goto LABEL_26;
  }
  unint64_t v28 = *(void *)(v6 + 8 * v29);
  if (v28)
  {
    int64_t v9 = v29;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v29 + 1;
    if (__OFADD__(v29, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v28 = *(void *)(v6 + 8 * v9);
    ++v29;
    if (v28) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_25AD0AC94()
{
  unint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B3850);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_25AD14950();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    uint64_t *v1 = v4;
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
    char v17 = (void *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v18 = v17[1];
    uint64_t v19 = 8 * v15;
    uint64_t v20 = *(void *)(*(void *)(v2 + 56) + v19);
    uint64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    *uint64_t v21 = *v17;
    v21[1] = v18;
    *(void *)(*(void *)(v4 + 56) + v19) = v20;
    uint64_t result = (void *)swift_bridgeObjectRetain();
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

void *sub_25AD0AE44()
{
  unint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B34D0);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_25AD14950();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    uint64_t *v1 = v4;
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
    int64_t v23 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v23 >= v13) {
      goto LABEL_26;
    }
    unint64_t v24 = *(void *)(v6 + 8 * v23);
    ++v9;
    if (!v24)
    {
      int64_t v9 = v23 + 1;
      if (v23 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v24 = *(void *)(v6 + 8 * v9);
      if (!v24) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v24 - 1) & v24;
    unint64_t v15 = __clz(__rbit64(v24)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    char v17 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    uint64_t v20 = 8 * v15;
    uint64_t v21 = *(void *)(*(void *)(v2 + 56) + v20);
    int64_t v22 = (void *)(*(void *)(v4 + 48) + v16);
    *int64_t v22 = v19;
    v22[1] = v18;
    *(void *)(*(void *)(v4 + 56) + v20) = v21;
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v25 = v23 + 2;
  if (v25 >= v13) {
    goto LABEL_26;
  }
  unint64_t v24 = *(void *)(v6 + 8 * v25);
  if (v24)
  {
    int64_t v9 = v25;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v25 + 1;
    if (__OFADD__(v25, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v24 = *(void *)(v6 + 8 * v9);
    ++v25;
    if (v24) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_25AD0AFF4()
{
  unint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B38A0);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_25AD14950();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    uint64_t *v1 = v4;
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
    char v17 = (void *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v18 = v17[1];
    uint64_t v19 = 8 * v15;
    uint64_t v20 = *(void *)(*(void *)(v2 + 56) + v19);
    uint64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    *uint64_t v21 = *v17;
    v21[1] = v18;
    *(void *)(*(void *)(v4 + 56) + v19) = v20;
    swift_bridgeObjectRetain();
    uint64_t result = (void *)swift_retain();
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

uint64_t sub_25AD0B1AC(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B32E0);
  char v40 = a2;
  uint64_t v6 = sub_25AD14960();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v39 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  uint64_t v37 = v2;
  int64_t v38 = (unint64_t)(v8 + 63) >> 6;
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
      goto LABEL_31;
    }
    int64_t v22 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v22 >= v38) {
      break;
    }
    unint64_t v23 = (void *)(v5 + 64);
    unint64_t v24 = *(void *)(v39 + 8 * v22);
    ++v13;
    if (!v24)
    {
      int64_t v13 = v22 + 1;
      if (v22 + 1 >= v38) {
        goto LABEL_33;
      }
      unint64_t v24 = *(void *)(v39 + 8 * v13);
      if (!v24)
      {
        int64_t v25 = v22 + 2;
        if (v25 >= v38)
        {
LABEL_33:
          swift_release();
          uint64_t v3 = v37;
          if ((v40 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v24 = *(void *)(v39 + 8 * v25);
        if (!v24)
        {
          while (1)
          {
            int64_t v13 = v25 + 1;
            if (__OFADD__(v25, 1)) {
              goto LABEL_42;
            }
            if (v13 >= v38) {
              goto LABEL_33;
            }
            unint64_t v24 = *(void *)(v39 + 8 * v13);
            ++v25;
            if (v24) {
              goto LABEL_30;
            }
          }
        }
        int64_t v13 = v25;
      }
    }
LABEL_30:
    unint64_t v10 = (v24 - 1) & v24;
    unint64_t v21 = __clz(__rbit64(v24)) + (v13 << 6);
LABEL_31:
    uint64_t v30 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v21);
    uint64_t v32 = *v30;
    uint64_t v31 = v30[1];
    uint64_t v33 = *(void *)(v5 + 56) + 32 * v21;
    uint64_t v34 = *(void *)v33;
    uint64_t v35 = *(void *)(v33 + 8);
    long long v41 = *(_OWORD *)(v33 + 16);
    if ((v40 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    sub_25AD14B70();
    sub_25AD14570();
    uint64_t result = sub_25AD14B90();
    uint64_t v14 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v15 = result & ~v14;
    unint64_t v16 = v15 >> 6;
    if (((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      unint64_t v17 = __clz(__rbit64((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v26 = 0;
      unint64_t v27 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v27 && (v26 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v28 = v16 == v27;
        if (v16 == v27) {
          unint64_t v16 = 0;
        }
        v26 |= v28;
        uint64_t v29 = *(void *)(v11 + 8 * v16);
      }
      while (v29 == -1);
      unint64_t v17 = __clz(__rbit64(~v29)) + (v16 << 6);
    }
    *(void *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    uint64_t v18 = (void *)(*(void *)(v7 + 48) + 16 * v17);
    *uint64_t v18 = v32;
    v18[1] = v31;
    uint64_t v19 = *(void *)(v7 + 56) + 32 * v17;
    *(void *)uint64_t v19 = v34;
    *(void *)(v19 + 8) = v35;
    *(_OWORD *)(v19 + 16) = v41;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v37;
  unint64_t v23 = (void *)(v5 + 64);
  if ((v40 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v36 = 1 << *(unsigned char *)(v5 + 32);
  if (v36 >= 64) {
    bzero(v23, ((unint64_t)(v36 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *unint64_t v23 = -1 << v36;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_25AD0B4DC(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B34D0);
  char v37 = a2;
  uint64_t v6 = sub_25AD14960();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
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
  uint64_t v34 = v2;
  int64_t v35 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v11 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v13 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v19 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v20 = v19 | (v13 << 6);
      goto LABEL_31;
    }
    int64_t v21 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v21 >= v35) {
      break;
    }
    int64_t v22 = (void *)(v5 + 64);
    unint64_t v23 = *(void *)(v36 + 8 * v21);
    ++v13;
    if (!v23)
    {
      int64_t v13 = v21 + 1;
      if (v21 + 1 >= v35) {
        goto LABEL_33;
      }
      unint64_t v23 = *(void *)(v36 + 8 * v13);
      if (!v23)
      {
        int64_t v24 = v21 + 2;
        if (v24 >= v35)
        {
LABEL_33:
          swift_release();
          uint64_t v3 = v34;
          if ((v37 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v23 = *(void *)(v36 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            int64_t v13 = v24 + 1;
            if (__OFADD__(v24, 1)) {
              goto LABEL_42;
            }
            if (v13 >= v35) {
              goto LABEL_33;
            }
            unint64_t v23 = *(void *)(v36 + 8 * v13);
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
    unint64_t v20 = __clz(__rbit64(v23)) + (v13 << 6);
LABEL_31:
    uint64_t v29 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v20);
    uint64_t v31 = *v29;
    uint64_t v30 = v29[1];
    uint64_t v32 = *(void *)(*(void *)(v5 + 56) + 8 * v20);
    if ((v37 & 1) == 0) {
      swift_bridgeObjectRetain();
    }
    sub_25AD14B70();
    sub_25AD14570();
    uint64_t result = sub_25AD14B90();
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
          goto LABEL_41;
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
    uint64_t v18 = (void *)(*(void *)(v7 + 48) + 16 * v17);
    *uint64_t v18 = v31;
    v18[1] = v30;
    *(void *)(*(void *)(v7 + 56) + 8 * v17) = v32;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v34;
  int64_t v22 = (void *)(v5 + 64);
  if ((v37 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v33 = 1 << *(unsigned char *)(v5 + 32);
  if (v33 >= 64) {
    bzero(v22, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *int64_t v22 = -1 << v33;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_25AD0B7E8(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B38A0);
  char v36 = a2;
  uint64_t v6 = sub_25AD14960();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v35 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  int64_t v34 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v11 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v13 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v19 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v20 = v19 | (v13 << 6);
      goto LABEL_31;
    }
    int64_t v21 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v21 >= v34) {
      break;
    }
    int64_t v22 = (void *)(v5 + 64);
    unint64_t v23 = *(void *)(v35 + 8 * v21);
    ++v13;
    if (!v23)
    {
      int64_t v13 = v21 + 1;
      if (v21 + 1 >= v34) {
        goto LABEL_33;
      }
      unint64_t v23 = *(void *)(v35 + 8 * v13);
      if (!v23)
      {
        int64_t v24 = v21 + 2;
        if (v24 >= v34)
        {
LABEL_33:
          swift_release();
          if ((v36 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v23 = *(void *)(v35 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            int64_t v13 = v24 + 1;
            if (__OFADD__(v24, 1)) {
              goto LABEL_42;
            }
            if (v13 >= v34) {
              goto LABEL_33;
            }
            unint64_t v23 = *(void *)(v35 + 8 * v13);
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
    unint64_t v20 = __clz(__rbit64(v23)) + (v13 << 6);
LABEL_31:
    uint64_t v29 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v20);
    uint64_t v31 = *v29;
    uint64_t v30 = v29[1];
    uint64_t v32 = *(void *)(*(void *)(v5 + 56) + 8 * v20);
    if ((v36 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_retain();
    }
    sub_25AD14B70();
    sub_25AD14570();
    uint64_t result = sub_25AD14B90();
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
          goto LABEL_41;
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
    uint64_t v18 = (void *)(*(void *)(v7 + 48) + 16 * v17);
    *uint64_t v18 = v31;
    v18[1] = v30;
    *(void *)(*(void *)(v7 + 56) + 8 * v17) = v32;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  int64_t v22 = (void *)(v5 + 64);
  if ((v36 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v33 = 1 << *(unsigned char *)(v5 + 32);
  if (v33 >= 64) {
    bzero(v22, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *int64_t v22 = -1 << v33;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

void *sub_25AD0BB00(void *a1)
{
  return sub_25ACFF5F0(0, a1[2], 0, a1);
}

void *sub_25AD0BB14(void *a1)
{
  return sub_25ACFF830(0, a1[2], 0, a1);
}

void *sub_25AD0BB28(void *a1)
{
  return sub_25ACFF968(0, a1[2], 0, a1);
}

void *sub_25AD0BB3C(void *a1)
{
  return sub_25ACFFBC0(0, a1[2], 0, a1);
}

char *sub_25AD0BB50(uint64_t a1)
{
  return sub_25ACFFCE4(0, *(void *)(a1 + 16), 0, (char *)a1);
}

void *sub_25AD0BB64(void *a1)
{
  return sub_25ACFFDF4(0, a1[2], 0, a1);
}

void *sub_25AD0BB78(void *a1)
{
  return sub_25AD00234(0, a1[2], 0, a1);
}

void *sub_25AD0BB8C(void *a1)
{
  return sub_25AD00344(0, a1[2], 0, a1);
}

uint64_t sub_25AD0BBA0(uint64_t isStackAllocationSafe, uint64_t a2)
{
  uint64_t v3 = isStackAllocationSafe;
  v10[1] = *MEMORY[0x263EF8340];
  char v4 = *(unsigned char *)(a2 + 32);
  unint64_t v5 = (unint64_t)((1 << v4) + 63) >> 6;
  size_t v6 = 8 * v5;
  if ((v4 & 0x3Fu) <= 0xD
    || (uint64_t isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), (isStackAllocationSafe & 1) != 0))
  {
    MEMORY[0x270FA5388](isStackAllocationSafe);
    bzero((char *)v10 - ((v6 + 15) & 0x3FFFFFFFFFFFFFF0), v6);
    uint64_t v7 = sub_25AD0BD28((void *)((char *)v10 - ((v6 + 15) & 0x3FFFFFFFFFFFFFF0)), v5, v3, a2);
    swift_release();
  }
  else
  {
    uint64_t v8 = (void *)swift_slowAlloc();
    bzero(v8, v6);
    uint64_t v7 = sub_25AD0BD28((unint64_t *)v8, v5, v3, a2);
    swift_release();
    MEMORY[0x261155570](v8, -1, -1);
  }
  return v7;
}

uint64_t sub_25AD0BD28(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v35 = a3 + 64;
  uint64_t v4 = 1 << *(unsigned char *)(a3 + 32);
  if (v4 < 64) {
    uint64_t v5 = ~(-1 << v4);
  }
  else {
    uint64_t v5 = -1;
  }
  unint64_t v6 = v5 & *(void *)(a3 + 64);
  int64_t v36 = (unint64_t)(v4 + 63) >> 6;
  uint64_t v39 = a4 + 56;
  uint64_t result = swift_bridgeObjectRetain();
  uint64_t v8 = 0;
  int64_t v9 = 0;
LABEL_5:
  uint64_t v33 = v8;
  while (1)
  {
    if (v6)
    {
      unint64_t v10 = __clz(__rbit64(v6));
      v6 &= v6 - 1;
      unint64_t v11 = v10 | (v9 << 6);
      goto LABEL_25;
    }
    int64_t v12 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_48;
    }
    if (v12 >= v36) {
      goto LABEL_46;
    }
    unint64_t v13 = *(void *)(v35 + 8 * v12);
    ++v9;
    if (!v13)
    {
      int64_t v9 = v12 + 1;
      if (v12 + 1 >= v36) {
        goto LABEL_46;
      }
      unint64_t v13 = *(void *)(v35 + 8 * v9);
      if (!v13)
      {
        int64_t v9 = v12 + 2;
        if (v12 + 2 >= v36) {
          goto LABEL_46;
        }
        unint64_t v13 = *(void *)(v35 + 8 * v9);
        if (!v13)
        {
          int64_t v9 = v12 + 3;
          if (v12 + 3 >= v36) {
            goto LABEL_46;
          }
          unint64_t v13 = *(void *)(v35 + 8 * v9);
          if (!v13) {
            break;
          }
        }
      }
    }
LABEL_24:
    unint64_t v6 = (v13 - 1) & v13;
    unint64_t v11 = __clz(__rbit64(v13)) + (v9 << 6);
LABEL_25:
    unint64_t v15 = (uint64_t *)(*(void *)(a3 + 48) + 16 * v11);
    uint64_t v17 = *v15;
    uint64_t v16 = v15[1];
    sub_25AD14B70();
    swift_bridgeObjectRetain();
    sub_25AD14570();
    uint64_t v18 = sub_25AD14B90();
    uint64_t v19 = -1 << *(unsigned char *)(a4 + 32);
    unint64_t v20 = v18 & ~v19;
    unint64_t v21 = v20 >> 6;
    uint64_t v22 = 1 << v20;
    if (((1 << v20) & *(void *)(v39 + 8 * (v20 >> 6))) == 0) {
      goto LABEL_6;
    }
    uint64_t v23 = *(void *)(a4 + 48);
    int64_t v24 = (void *)(v23 + 16 * v20);
    BOOL v25 = *v24 == v17 && v24[1] == v16;
    if (v25 || (sub_25AD14AF0() & 1) != 0)
    {
      uint64_t result = swift_bridgeObjectRelease();
LABEL_32:
      unint64_t v26 = a1[v21];
      a1[v21] = v22 | v26;
      if ((v22 & v26) == 0)
      {
        uint64_t v8 = v33 + 1;
        if (!__OFADD__(v33, 1)) {
          goto LABEL_5;
        }
        __break(1u);
LABEL_46:
        swift_release();
        swift_retain();
        return sub_25AD01704(a1, a2, v33, a4);
      }
    }
    else
    {
      uint64_t v27 = ~v19;
      for (unint64_t i = v20 + 1; ; unint64_t i = v29 + 1)
      {
        unint64_t v29 = i & v27;
        if (((*(void *)(v39 + (((i & v27) >> 3) & 0xFFFFFFFFFFFFFF8)) >> (i & v27)) & 1) == 0) {
          break;
        }
        uint64_t v30 = (void *)(v23 + 16 * v29);
        BOOL v31 = *v30 == v17 && v30[1] == v16;
        if (v31 || (sub_25AD14AF0() & 1) != 0)
        {
          uint64_t result = swift_bridgeObjectRelease();
          unint64_t v21 = v29 >> 6;
          uint64_t v22 = 1 << v29;
          goto LABEL_32;
        }
      }
LABEL_6:
      uint64_t result = swift_bridgeObjectRelease();
    }
  }
  int64_t v14 = v12 + 4;
  if (v14 >= v36) {
    goto LABEL_46;
  }
  unint64_t v13 = *(void *)(v35 + 8 * v14);
  if (v13)
  {
    int64_t v9 = v14;
    goto LABEL_24;
  }
  while (1)
  {
    int64_t v9 = v14 + 1;
    if (__OFADD__(v14, 1)) {
      break;
    }
    if (v9 >= v36) {
      goto LABEL_46;
    }
    unint64_t v13 = *(void *)(v35 + 8 * v9);
    ++v14;
    if (v13) {
      goto LABEL_24;
    }
  }
LABEL_48:
  __break(1u);
  return result;
}

uint64_t sub_25AD0C03C(uint64_t a1)
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
  unint64_t v7 = (unint64_t)(v3 + 63) >> 6;
  if (v7 <= 2) {
    unint64_t v7 = 2;
  }
  unint64_t v8 = v7 - 2;
  int64_t v9 = (unint64_t *)(a1 + 80);
  uint64_t v2 = 64;
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

uint64_t sub_25AD0C0C4(long long *a1, long long *a2)
{
  sub_25AD0D444(a1, (uint64_t)&v27);
  switch(v33)
  {
    case 1:
      uint64_t v3 = v27;
      uint64_t v4 = v28;
      sub_25AD0D444(a2, (uint64_t)&v20);
      if (v26 != 1) {
        goto LABEL_22;
      }
      goto LABEL_17;
    case 2:
      uint64_t v5 = v27;
      uint64_t v6 = v28;
      uint64_t v7 = v29;
      uint64_t v8 = v30;
      uint64_t v9 = v31;
      uint64_t v10 = v32;
      sub_25AD0D444(a2, (uint64_t)&v20);
      if (v26 != 2) {
        goto LABEL_22;
      }
      uint64_t v11 = v22;
      uint64_t v12 = v23;
      uint64_t v13 = v24;
      uint64_t v14 = v25;
      if (v5 != v20 || v6 != v21)
      {
        char v15 = sub_25AD14AF0();
        char v16 = 0;
        if ((v15 & 1) == 0) {
          return v16 & 1;
        }
      }
      if (v7 != v11 || v8 != v12)
      {
        char v17 = sub_25AD14AF0();
        char v16 = 0;
        if ((v17 & 1) == 0) {
          return v16 & 1;
        }
      }
      if (v9 != v13 || v10 != v14) {
        goto LABEL_21;
      }
      goto LABEL_23;
    case 3:
      uint64_t v3 = v27;
      uint64_t v4 = v28;
      sub_25AD0D444(a2, (uint64_t)&v20);
      if (v26 == 3) {
        goto LABEL_17;
      }
      goto LABEL_22;
    default:
      uint64_t v3 = v27;
      uint64_t v4 = v28;
      sub_25AD0D444(a2, (uint64_t)&v20);
      if (v26)
      {
LABEL_22:
        char v16 = 0;
      }
      else
      {
LABEL_17:
        if (v3 == v20 && v4 == v21) {
LABEL_23:
        }
          char v16 = 1;
        else {
LABEL_21:
        }
          char v16 = sub_25AD14AF0();
      }
      return v16 & 1;
  }
}

uint64_t sub_25AD0C288(unint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a1 >> 62) {
    goto LABEL_22;
  }
  uint64_t v5 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    uint64_t result = MEMORY[0x263F8EE78];
    if (!v5) {
      return result;
    }
    uint64_t v21 = MEMORY[0x263F8EE78];
    uint64_t result = sub_25AD0FD70(0, v5 & ~(v5 >> 63), 0);
    if (v5 < 0)
    {
      __break(1u);
      return result;
    }
    uint64_t v19 = v5;
    uint64_t v7 = 0;
    uint64_t result = v21;
    while (v5 != v7)
    {
      uint64_t v8 = result;
      if ((a1 & 0xC000000000000001) != 0)
      {
        uint64_t v9 = MEMORY[0x261154BD0](v7, a1);
      }
      else
      {
        uint64_t v9 = *(void *)(a1 + 8 * v7 + 32);
        swift_retain();
      }
      uint64_t v11 = *(void *)(v9 + 16);
      uint64_t v10 = *(void *)(v9 + 24);
      swift_bridgeObjectRetain();
      if (sub_25ACFD910(v11, v10, a2))
      {
        sub_25AD0CE88();
        swift_allocError();
        *(void *)uint64_t v17 = 0x746E657665;
        unint64_t v18 = 0xE500000000000000;
LABEL_19:
        *(void *)(v17 + 8) = v18;
        *(_OWORD *)(v17 + 16) = xmmword_25AD17BA0;
        *(void *)(v17 + 32) = v11;
        *(void *)(v17 + 40) = v10;
        *(unsigned char *)(v17 + 48) = 2;
        swift_willThrow();
        swift_release();
        return swift_release();
      }
      if (*(void *)(a3 + 16))
      {
        swift_bridgeObjectRetain();
        sub_25AD0A230(v11, v10);
        char v13 = v12;
        swift_bridgeObjectRelease();
        if (v13)
        {
          sub_25AD0CE88();
          swift_allocError();
          *(void *)uint64_t v17 = 0x746E6174736E6F63;
          unint64_t v18 = 0xE800000000000000;
          goto LABEL_19;
        }
      }
      uint64_t result = v8;
      uint64_t v22 = v8;
      unint64_t v14 = *(void *)(v8 + 16);
      unint64_t v15 = *(void *)(result + 24);
      if (v14 >= v15 >> 1)
      {
        sub_25AD0FD70(v15 > 1, v14 + 1, 1);
        uint64_t result = v22;
      }
      ++v7;
      *(void *)(result + 16) = v14 + 1;
      char v16 = (void *)(result + 24 * v14);
      v16[4] = v11;
      v16[5] = v10;
      v16[6] = v9;
      uint64_t v5 = v19;
      if (v19 == v7) {
        return result;
      }
    }
    __break(1u);
LABEL_22:
    swift_bridgeObjectRetain();
    uint64_t v5 = sub_25AD14940();
    swift_bridgeObjectRelease();
  }
}

uint64_t sub_25AD0C508(unint64_t a1, unint64_t a2)
{
  unint64_t v3 = a1;
  if (a1 >> 62)
  {
LABEL_26:
    swift_bridgeObjectRetain();
    uint64_t v4 = sub_25AD14940();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v4 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  uint64_t v5 = MEMORY[0x263F8EE78];
  if (!v4) {
    return v5;
  }
  uint64_t v24 = MEMORY[0x263F8EE78];
  uint64_t result = sub_25AD0FCF0(0, v4 & ~(v4 >> 63), 0);
  if ((v4 & 0x8000000000000000) == 0)
  {
    uint64_t v7 = 0;
    uint64_t v5 = v24;
    uint64_t v8 = *(void *)(a2 + 16);
    unint64_t v20 = v3 + 32;
    uint64_t v21 = v4;
    uint64_t v22 = (void *)(a2 + 40);
    unint64_t v23 = v3 & 0xC000000000000001;
    while (1)
    {
      if (v7 == v4)
      {
        __break(1u);
        goto LABEL_26;
      }
      if (v23)
      {
        uint64_t v9 = MEMORY[0x261154BD0](v7, v3);
        if (v8) {
          goto LABEL_9;
        }
      }
      else
      {
        uint64_t v9 = *(void *)(v20 + 8 * v7);
        swift_retain();
        if (v8)
        {
LABEL_9:
          unint64_t v10 = v3;
          uint64_t v11 = 0;
          uint64_t v12 = *(void *)(v9 + 16);
          uint64_t v13 = *(void *)(v9 + 24);
          unint64_t v14 = v22;
          while (1)
          {
            BOOL v15 = v12 == *(v14 - 1) && v13 == *v14;
            if (v15 || (sub_25AD14AF0() & 1) != 0) {
              break;
            }
            v14 += 2;
            if (v8 == ++v11)
            {
              uint64_t v11 = 0;
              char v16 = 1;
              goto LABEL_18;
            }
          }
          char v16 = 0;
LABEL_18:
          unint64_t v3 = v10;
          uint64_t v4 = v21;
          goto LABEL_21;
        }
      }
      uint64_t v11 = 0;
      char v16 = 1;
LABEL_21:
      swift_release();
      unint64_t v18 = *(void *)(v24 + 16);
      unint64_t v17 = *(void *)(v24 + 24);
      a2 = v18 + 1;
      if (v18 >= v17 >> 1) {
        sub_25AD0FCF0(v17 > 1, v18 + 1, 1);
      }
      ++v7;
      *(void *)(v24 + 16) = a2;
      uint64_t v19 = v24 + 16 * v18;
      *(void *)(v19 + 32) = v11;
      *(unsigned char *)(v19 + 40) = v16;
      if (v7 == v4) {
        return v5;
      }
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_25AD0C6F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v34 = a1 + 56;
  uint64_t v38 = MEMORY[0x263F8EE78];
  uint64_t v6 = 1 << *(unsigned char *)(a1 + 32);
  if (v6 < 64) {
    uint64_t v7 = ~(-1 << v6);
  }
  else {
    uint64_t v7 = -1;
  }
  unint64_t v8 = v7 & *(void *)(a1 + 56);
  int64_t v35 = (unint64_t)(v6 + 63) >> 6;
  uint64_t v36 = a3 + 56;
  swift_bridgeObjectRetain();
  int64_t v9 = 0;
  if (v8) {
    goto LABEL_7;
  }
LABEL_8:
  while (2)
  {
    int64_t v12 = v9 + 1;
    if (!__OFADD__(v9, 1))
    {
      if (v12 < v35)
      {
        unint64_t v13 = *(void *)(v34 + 8 * v12);
        ++v9;
        if (v13) {
          goto LABEL_22;
        }
        int64_t v9 = v12 + 1;
        if (v12 + 1 >= v35) {
          goto LABEL_46;
        }
        unint64_t v13 = *(void *)(v34 + 8 * v9);
        if (v13) {
          goto LABEL_22;
        }
        int64_t v9 = v12 + 2;
        if (v12 + 2 >= v35) {
          goto LABEL_46;
        }
        unint64_t v13 = *(void *)(v34 + 8 * v9);
        if (v13) {
          goto LABEL_22;
        }
        int64_t v9 = v12 + 3;
        if (v12 + 3 >= v35) {
          goto LABEL_46;
        }
        unint64_t v13 = *(void *)(v34 + 8 * v9);
        if (v13)
        {
LABEL_22:
          unint64_t v8 = (v13 - 1) & v13;
          for (unint64_t i = __clz(__rbit64(v13)) + (v9 << 6); ; unint64_t i = v10 | (v9 << 6))
          {
            BOOL v15 = (uint64_t *)(*(void *)(a1 + 48) + 16 * i);
            uint64_t v17 = *v15;
            uint64_t v16 = v15[1];
            uint64_t v18 = *(void *)(a2 + 16);
            swift_bridgeObjectRetain();
            if (v18)
            {
              swift_bridgeObjectRetain();
              sub_25AD0A230(v17, v16);
              char v20 = v19;
              swift_bridgeObjectRelease();
              if (v20) {
                break;
              }
            }
            if (*(void *)(a3 + 16))
            {
              sub_25AD14B70();
              sub_25AD14570();
              uint64_t v21 = sub_25AD14B90();
              uint64_t v22 = -1 << *(unsigned char *)(a3 + 32);
              unint64_t v23 = v21 & ~v22;
              if ((*(void *)(v36 + ((v23 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v23))
              {
                uint64_t v24 = *(void *)(a3 + 48);
                uint64_t v25 = (void *)(v24 + 16 * v23);
                BOOL v26 = *v25 == v17 && v25[1] == v16;
                if (v26 || (sub_25AD14AF0() & 1) != 0) {
                  break;
                }
                uint64_t v27 = ~v22;
                while (1)
                {
                  unint64_t v23 = (v23 + 1) & v27;
                  if (((*(void *)(v36 + ((v23 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v23) & 1) == 0) {
                    break;
                  }
                  uint64_t v28 = (void *)(v24 + 16 * v23);
                  BOOL v29 = *v28 == v17 && v28[1] == v16;
                  if (v29 || (sub_25AD14AF0() & 1) != 0) {
                    goto LABEL_6;
                  }
                }
              }
            }
            if (!*(void *)(a4 + 16))
            {
              __break(1u);
              goto LABEL_48;
            }
            swift_bridgeObjectRetain();
            sub_25AD0A230(v17, v16);
            if ((v30 & 1) == 0) {
              goto LABEL_50;
            }
            swift_retain();
            uint64_t v31 = swift_bridgeObjectRelease_n();
            MEMORY[0x2611549C0](v31);
            if (*(void *)((v38 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v38 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
              sub_25AD146B0();
            }
            sub_25AD146D0();
            sub_25AD146A0();
            if (!v8) {
              goto LABEL_8;
            }
LABEL_7:
            unint64_t v10 = __clz(__rbit64(v8));
            v8 &= v8 - 1;
          }
LABEL_6:
          swift_bridgeObjectRelease();
          if (!v8) {
            continue;
          }
          goto LABEL_7;
        }
        int64_t v14 = v12 + 4;
        if (v14 < v35)
        {
          unint64_t v13 = *(void *)(v34 + 8 * v14);
          int64_t v9 = v14;
          if (!v13)
          {
            while (1)
            {
              int64_t v9 = v14 + 1;
              if (__OFADD__(v14, 1)) {
                goto LABEL_49;
              }
              if (v9 >= v35) {
                goto LABEL_46;
              }
              unint64_t v13 = *(void *)(v34 + 8 * v9);
              ++v14;
              if (v13) {
                goto LABEL_22;
              }
            }
          }
          goto LABEL_22;
        }
      }
LABEL_46:
      swift_release();
      return v38;
    }
    break;
  }
LABEL_48:
  __break(1u);
LABEL_49:
  __break(1u);
LABEL_50:
  uint64_t result = swift_bridgeObjectRelease();
  __break(1u);
  return result;
}

void *sub_25AD0CA5C(uint64_t a1, uint64_t (*a2)(uint64_t, uint64_t, uint64_t))
{
  uint64_t v16 = *(void *)(a1 + 16);
  if (!v16) {
    return (void *)MEMORY[0x263F8EE78];
  }
  uint64_t v2 = 0;
  unint64_t v3 = (uint64_t *)(swift_bridgeObjectRetain() + 40);
  uint64_t v4 = (void *)MEMORY[0x263F8EE78];
  do
  {
    uint64_t v7 = *(v3 - 1);
    uint64_t v6 = *v3;
    swift_bridgeObjectRetain();
    uint64_t v8 = a2(v2, v7, v6);
    uint64_t v10 = v9;
    uint64_t v12 = v11;
    swift_bridgeObjectRelease();
    if (v10)
    {
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v4 = sub_25ACFFA98(0, v4[2] + 1, 1, v4);
      }
      unint64_t v14 = v4[2];
      unint64_t v13 = v4[3];
      if (v14 >= v13 >> 1) {
        uint64_t v4 = sub_25ACFFA98((void *)(v13 > 1), v14 + 1, 1, v4);
      }
      v4[2] = v14 + 1;
      uint64_t v5 = &v4[3 * v14];
      v5[4] = v8;
      void v5[5] = v10;
      v5[6] = v12;
    }
    ++v2;
    v3 += 2;
  }
  while (v16 != v2);
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_25AD0CBAC(unint64_t a1, uint64_t a2)
{
  uint64_t v19 = MEMORY[0x263F8EE78];
  sub_25AD0FBA0(0, 0, 0);
  if (a1 >> 62) {
    goto LABEL_18;
  }
  uint64_t v3 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  if (v3)
  {
    while (1)
    {
      unint64_t v4 = 0;
      uint64_t v16 = a1 & 0xFFFFFFFFFFFFFF8;
      unint64_t v17 = a1 & 0xC000000000000001;
      unint64_t v15 = a1;
      while (v17)
      {
        uint64_t v5 = MEMORY[0x261154BD0](v4, a1);
        unint64_t v6 = v4 + 1;
        if (__OFADD__(v4, 1)) {
          goto LABEL_17;
        }
LABEL_7:
        uint64_t v7 = *(void *)(a2 + 16);
        uint64_t v8 = v7 + v4;
        if (__OFADD__(v7, v4)) {
          goto LABEL_16;
        }
        uint64_t v9 = *(void *)(v5 + 16);
        uint64_t v10 = *(void *)(v5 + 24);
        swift_bridgeObjectRetain();
        swift_release();
        unint64_t v12 = *(void *)(v19 + 16);
        unint64_t v11 = *(void *)(v19 + 24);
        if (v12 >= v11 >> 1) {
          sub_25AD0FBA0(v11 > 1, v12 + 1, 1);
        }
        *(void *)(v19 + 16) = v12 + 1;
        unint64_t v13 = (void *)(v19 + 24 * v12);
        v13[4] = v9;
        v13[5] = v10;
        v13[6] = v8;
        ++v4;
        a1 = v15;
        if (v6 == v3) {
          goto LABEL_19;
        }
      }
      if (v4 < *(void *)(v16 + 16)) {
        break;
      }
      __break(1u);
LABEL_16:
      __break(1u);
LABEL_17:
      __break(1u);
LABEL_18:
      swift_bridgeObjectRetain();
      uint64_t v3 = sub_25AD14940();
      if (!v3) {
        goto LABEL_19;
      }
    }
    uint64_t v5 = *(void *)(a1 + 8 * v4 + 32);
    swift_retain();
    unint64_t v6 = v4 + 1;
    if (__OFADD__(v4, 1)) {
      goto LABEL_17;
    }
    goto LABEL_7;
  }
LABEL_19:
  swift_bridgeObjectRelease();
  return v19;
}

unint64_t sub_25AD0CD58(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return 0xD000000000000011;
}

unint64_t sub_25AD0CE2C()
{
  unint64_t result = qword_26A4B3890;
  if (!qword_26A4B3890)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A4B3888);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4B3890);
  }
  return result;
}

unint64_t sub_25AD0CE88()
{
  unint64_t result = qword_26A4B3898;
  if (!qword_26A4B3898)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4B3898);
  }
  return result;
}

uint64_t sub_25AD0CEDC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_25AD09C40(a1, a2, a3, *(void *)(v3 + 16), *(void *)(v3 + 24));
}

uint64_t sub_25AD0CEE4(uint64_t a1, uint64_t a2, uint64_t a3, unsigned __int8 a4)
{
  if (a4 - 1 <= 1) {
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_25AD0CF00(uint64_t a1, uint64_t a2, uint64_t a3, unsigned __int8 a4)
{
  if (a4 - 1 <= 1) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

unint64_t sub_25AD0CF1C()
{
  unint64_t result = qword_26A4B38A8;
  if (!qword_26A4B38A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4B38A8);
  }
  return result;
}

uint64_t sub_25AD0CF70()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

unsigned char *storeEnumTagSinglePayload for VisitState(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x25AD0D074);
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

ValueMetadata *type metadata accessor for VisitState()
{
  return &type metadata for VisitState;
}

uint64_t sub_25AD0D0AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unsigned __int8 a7)
{
  if (a7 >= 2u && a7 != 3)
  {
    if (a7 != 2) {
      return result;
    }
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return swift_bridgeObjectRetain();
}

uint64_t destroy for EvaluatorError(uint64_t a1)
{
  return sub_25AD0D138(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(void *)(a1 + 24), *(void *)(a1 + 32), *(void *)(a1 + 40), *(unsigned char *)(a1 + 48));
}

uint64_t sub_25AD0D138(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unsigned __int8 a7)
{
  if (a7 >= 2u && a7 != 3)
  {
    if (a7 != 2) {
      return result;
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for EvaluatorError(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  uint64_t v7 = *(void *)(a2 + 32);
  uint64_t v8 = *(void *)(a2 + 40);
  unsigned __int8 v9 = *(unsigned char *)(a2 + 48);
  sub_25AD0D0AC(*(void *)a2, v4, v5, v6, v7, v8, v9);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  *(void *)(a1 + 32) = v7;
  *(void *)(a1 + 40) = v8;
  *(unsigned char *)(a1 + 48) = v9;
  return a1;
}

uint64_t assignWithCopy for EvaluatorError(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  uint64_t v7 = *(void *)(a2 + 32);
  uint64_t v8 = *(void *)(a2 + 40);
  unsigned __int8 v9 = *(unsigned char *)(a2 + 48);
  sub_25AD0D0AC(*(void *)a2, v4, v5, v6, v7, v8, v9);
  uint64_t v10 = *(void *)a1;
  uint64_t v11 = *(void *)(a1 + 8);
  uint64_t v12 = *(void *)(a1 + 16);
  uint64_t v13 = *(void *)(a1 + 24);
  uint64_t v14 = *(void *)(a1 + 32);
  uint64_t v15 = *(void *)(a1 + 40);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  *(void *)(a1 + 32) = v7;
  *(void *)(a1 + 40) = v8;
  unsigned __int8 v16 = *(unsigned char *)(a1 + 48);
  *(unsigned char *)(a1 + 48) = v9;
  sub_25AD0D138(v10, v11, v12, v13, v14, v15, v16);
  return a1;
}

__n128 __swift_memcpy49_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  long long v4 = *(_OWORD *)(a2 + 32);
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for EvaluatorError(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 48);
  uint64_t v4 = *(void *)a1;
  uint64_t v6 = *(void *)(a1 + 8);
  uint64_t v5 = *(void *)(a1 + 16);
  uint64_t v7 = *(void *)(a1 + 24);
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = *(void *)(a1 + 40);
  long long v10 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v10;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  unsigned __int8 v11 = *(unsigned char *)(a1 + 48);
  *(unsigned char *)(a1 + 48) = v3;
  sub_25AD0D138(v4, v6, v5, v7, v8, v9, v11);
  return a1;
}

uint64_t getEnumTagSinglePayload for EvaluatorError(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFD && *(unsigned char *)(a1 + 49)) {
    return (*(_DWORD *)a1 + 253);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 48);
  if (v3 <= 3) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for EvaluatorError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFC)
  {
    *(void *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 48) = 0;
    *(void *)__n128 result = a2 - 253;
    if (a3 >= 0xFD) {
      *(unsigned char *)(result + 49) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFD) {
      *(unsigned char *)(result + 49) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 48) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_25AD0D3C8(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 48);
}

uint64_t sub_25AD0D3D0(uint64_t result, char a2)
{
  *(unsigned char *)(result + 48) = a2;
  return result;
}

ValueMetadata *type metadata accessor for EvaluatorError()
{
  return &type metadata for EvaluatorError;
}

unint64_t sub_25AD0D3F0()
{
  unint64_t result = qword_26A4B38B0;
  if (!qword_26A4B38B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4B38B0);
  }
  return result;
}

uint64_t sub_25AD0D444(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  long long v4 = a1[2];
  *(unsigned char *)(a2 + 48) = *((unsigned char *)a1 + 48);
  *(_OWORD *)(a2 + 16) = v3;
  *(_OWORD *)(a2 + 32) = v4;
  *(_OWORD *)a2 = v2;
  return a2;
}

void *ModeList.init(for:modesDirectories:)(uint64_t a1, void *a2)
{
  long long v3 = sub_25AD04560(a2, a1);
  swift_bridgeObjectRelease();
  sub_25ACDF6AC(a1);
  return v3;
}

uint64_t ModeList.init(decoding:)(uint64_t a1, unint64_t a2)
{
  sub_25AD141D0();
  swift_allocObject();
  sub_25AD141C0();
  sub_25AD14180();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B38B8);
  sub_25AD0D6EC(&qword_26A4B38C0, (void (*)(void))sub_25AD0D698);
  sub_25AD141B0();
  sub_25ACDF56C(a1, a2);
  uint64_t result = swift_release();
  if (!v2) {
    return v6;
  }
  return result;
}

uint64_t ModeList.encode()()
{
  sub_25AD14200();
  swift_allocObject();
  sub_25AD141F0();
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B38B8);
  sub_25AD0D6EC(&qword_26A4B38D0, (void (*)(void))sub_25AD0D75C);
  uint64_t v0 = sub_25AD141E0();
  swift_release();
  swift_bridgeObjectRelease();
  return v0;
}

unint64_t sub_25AD0D698()
{
  unint64_t result = qword_26A4B38C8;
  if (!qword_26A4B38C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4B38C8);
  }
  return result;
}

uint64_t sub_25AD0D6EC(unint64_t *a1, void (*a2)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A4B38B8);
    a2();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_25AD0D75C()
{
  unint64_t result = qword_26A4B38D8;
  if (!qword_26A4B38D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4B38D8);
  }
  return result;
}

ValueMetadata *type metadata accessor for ModeList()
{
  return &type metadata for ModeList;
}

uint64_t destroy for SetSpec()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void *_s7Recount7SetSpecVwCP_0(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for SetSpec(void *a1, void *a2)
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
  return a1;
}

uint64_t assignWithTake for SetSpec(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for SetSpec(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 24)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for SetSpec(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)unint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 24) = 1;
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
      *(void *)unint64_t result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 24) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SetSpec()
{
  return &type metadata for SetSpec;
}

uint64_t sub_25AD0D9B8(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v13 = a3;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B38F0);
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  unsigned __int8 v11 = (char *)&v13 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25AD0E1D8();
  sub_25AD14BB0();
  uint64_t v15 = a2;
  char v14 = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B2FC8);
  sub_25AD07BF0(&qword_26A4B3728);
  sub_25AD14AA0();
  if (!v4)
  {
    uint64_t v15 = v13;
    char v14 = 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B3380);
    sub_25AD0E22C(&qword_26A4B38F8);
    sub_25AD14AA0();
    uint64_t v15 = a4;
    char v14 = 2;
    sub_25AD14AA0();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

uint64_t sub_25AD0DBEC()
{
  uint64_t v1 = 0x6973736572707865;
  if (*v0 != 1) {
    uint64_t v1 = 0x746E6174736E6F63;
  }
  if (*v0) {
    return v1;
  }
  else {
    return 0x6D726F6674616C70;
  }
}

uint64_t sub_25AD0DC50@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_25AD0DD40(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_25AD0DC78(uint64_t a1)
{
  unint64_t v2 = sub_25AD0E1D8();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25AD0DCB4(uint64_t a1)
{
  unint64_t v2 = sub_25AD0E1D8();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_25AD0DCF0@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = sub_25AD0DEC8(a1);
  if (!v2)
  {
    *a2 = result;
    a2[1] = v5;
    a2[2] = v6;
  }
  return result;
}

uint64_t sub_25AD0DD20(void *a1)
{
  return sub_25AD0D9B8(a1, *v1, v1[1], v1[2]);
}

uint64_t sub_25AD0DD40(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x6D726F6674616C70 && a2 == 0xE900000000000073;
  if (v2 || (sub_25AD14AF0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6973736572707865 && a2 == 0xEB00000000736E6FLL || (sub_25AD14AF0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x746E6174736E6F63 && a2 == 0xE900000000000073)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    char v6 = sub_25AD14AF0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 2;
    }
    else {
      return 3;
    }
  }
}

uint64_t sub_25AD0DEC8(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B38E0);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  char v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = a1[3];
  __swift_project_boxed_opaque_existential_1(a1, v7);
  sub_25AD0E1D8();
  sub_25AD14BA0();
  if (v1)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B2FC8);
    char v10 = 0;
    sub_25AD07BF0(&qword_26A4B3840);
    sub_25AD14A00();
    uint64_t v7 = v11;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B3380);
    char v10 = 1;
    sub_25AD0E22C((unint64_t *)&qword_26A4B3388);
    swift_bridgeObjectRetain();
    sub_25AD14A00();
    char v10 = 2;
    swift_bridgeObjectRetain();
    sub_25AD14A00();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    swift_bridgeObjectRetain();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return v7;
}

unint64_t sub_25AD0E1D8()
{
  unint64_t result = qword_26A4B38E8;
  if (!qword_26A4B38E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4B38E8);
  }
  return result;
}

uint64_t sub_25AD0E22C(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A4B3380);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for SetSpec.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x25AD0E35CLL);
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

ValueMetadata *type metadata accessor for SetSpec.CodingKeys()
{
  return &type metadata for SetSpec.CodingKeys;
}

unint64_t sub_25AD0E398()
{
  unint64_t result = qword_26A4B3900;
  if (!qword_26A4B3900)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4B3900);
  }
  return result;
}

unint64_t sub_25AD0E3F0()
{
  unint64_t result = qword_26A4B3908;
  if (!qword_26A4B3908)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4B3908);
  }
  return result;
}

unint64_t sub_25AD0E448()
{
  unint64_t result = qword_26A4B3910;
  if (!qword_26A4B3910)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4B3910);
  }
  return result;
}

void *sub_25AD0E4A0(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for Expression(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_OWORD *assignWithTake for Expression(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for Expression(uint64_t *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for Expression(uint64_t result, int a2, int a3)
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
LABEL_8:
      *(void *)unint64_t result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 16) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for Expression()
{
  return &type metadata for Expression;
}

uint64_t sub_25AD0E60C(uint64_t result)
{
  uint64_t v1 = result;
  int64_t v2 = 0;
  uint64_t v3 = result + 56;
  uint64_t v4 = 1 << *(unsigned char *)(result + 32);
  uint64_t v5 = -1;
  if (v4 < 64) {
    uint64_t v5 = ~(-1 << v4);
  }
  unint64_t v6 = v5 & *(void *)(result + 56);
  int64_t v7 = (unint64_t)(v4 + 63) >> 6;
  while (1)
  {
    if (v6)
    {
      unint64_t v8 = __clz(__rbit64(v6));
      v6 &= v6 - 1;
      unint64_t v9 = v8 | (v2 << 6);
      goto LABEL_5;
    }
    int64_t v13 = v2 + 1;
    if (__OFADD__(v2, 1))
    {
      __break(1u);
LABEL_27:
      __break(1u);
      return result;
    }
    if (v13 >= v7) {
      goto LABEL_23;
    }
    unint64_t v14 = *(void *)(v3 + 8 * v13);
    ++v2;
    if (!v14)
    {
      int64_t v2 = v13 + 1;
      if (v13 + 1 >= v7) {
        goto LABEL_23;
      }
      unint64_t v14 = *(void *)(v3 + 8 * v2);
      if (!v14)
      {
        int64_t v2 = v13 + 2;
        if (v13 + 2 >= v7) {
          goto LABEL_23;
        }
        unint64_t v14 = *(void *)(v3 + 8 * v2);
        if (!v14)
        {
          int64_t v2 = v13 + 3;
          if (v13 + 3 >= v7) {
            goto LABEL_23;
          }
          unint64_t v14 = *(void *)(v3 + 8 * v2);
          if (!v14) {
            break;
          }
        }
      }
    }
LABEL_22:
    unint64_t v6 = (v14 - 1) & v14;
    unint64_t v9 = __clz(__rbit64(v14)) + (v2 << 6);
LABEL_5:
    char v10 = (uint64_t *)(*(void *)(v1 + 48) + 16 * v9);
    uint64_t v11 = *v10;
    uint64_t v12 = v10[1];
    swift_bridgeObjectRetain();
    sub_25AD007D4(&v16, v11, v12);
    unint64_t result = swift_bridgeObjectRelease();
  }
  int64_t v15 = v13 + 4;
  if (v15 < v7)
  {
    unint64_t v14 = *(void *)(v3 + 8 * v15);
    if (!v14)
    {
      while (1)
      {
        int64_t v2 = v15 + 1;
        if (__OFADD__(v15, 1)) {
          goto LABEL_27;
        }
        if (v2 >= v7) {
          goto LABEL_23;
        }
        unint64_t v14 = *(void *)(v3 + 8 * v2);
        ++v15;
        if (v14) {
          goto LABEL_22;
        }
      }
    }
    int64_t v2 = v15;
    goto LABEL_22;
  }
LABEL_23:
  return swift_release();
}

uint64_t sub_25AD0E78C(uint64_t a1, uint64_t a2)
{
  if (a1 == 43 && a2 == 0xE100000000000000 || (sub_25AD14AF0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 45 && a2 == 0xE100000000000000 || (sub_25AD14AF0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 42 && a2 == 0xE100000000000000 || (sub_25AD14AF0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 47 && a2 == 0xE100000000000000)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else
  {
    char v5 = sub_25AD14AF0();
    swift_bridgeObjectRelease();
    if (v5) {
      return 5;
    }
    else {
      return 6;
    }
  }
}

uint64_t sub_25AD0E8DC(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, char a6)
{
  switch(a6)
  {
    case 1:
      sub_25AD0CF1C();
      swift_allocError();
      *(void *)uint64_t v15 = a3;
      *(void *)(v15 + 8) = a4;
      *(unsigned char *)(v15 + 16) = 0;
      swift_bridgeObjectRetain();
      return swift_willThrow();
    case 2:
      a3 = *(void **)(a2 + 16);
      if ((uint64_t)a3 <= a5)
      {
        sub_25AD0CF1C();
        swift_allocError();
        *(void *)uint64_t v26 = a3;
        *(void *)(v26 + 8) = a5;
        *(unsigned char *)(v26 + 16) = 1;
        return swift_willThrow();
      }
      if (a5 < 0) {
        goto LABEL_31;
      }
      uint64_t v6 = *(void *)(a2 + 8 * a5 + 32);
      a3 = *(void **)a1;
      uint64_t result = swift_isUniquelyReferenced_nonNull_native();
      if (result) {
        goto LABEL_11;
      }
      goto LABEL_32;
    case 3:
      unint64_t v9 = *(void **)a1;
      if (*(void *)(*(void *)a1 + 16))
      {
        uint64_t result = swift_isUniquelyReferenced_nonNull_native();
        if (result)
        {
          uint64_t v19 = v9[2];
          if (v19) {
            goto LABEL_17;
          }
LABEL_29:
          __break(1u);
          goto LABEL_30;
        }
      }
      else
      {
        __break(1u);
      }
      uint64_t result = (uint64_t)sub_25AD0BB8C(v9);
      unint64_t v9 = (void *)result;
      uint64_t v19 = *(void *)(result + 16);
      if (!v19) {
        goto LABEL_29;
      }
LABEL_17:
      uint64_t v20 = v19 - 1;
      uint64_t v21 = v9 + 4;
      double v22 = *(double *)&v9[v20 + 4];
      void v9[2] = v20;
      *(void *)a1 = v9;
      uint64_t v23 = v9[2];
      if (v23)
      {
        switch((char)a3)
        {
          case 2:
            uint64_t v24 = (double *)&v21[v23];
            double v25 = v22 + *(v24 - 1);
            goto LABEL_25;
          case 3:
            uint64_t v24 = (double *)&v21[v23];
            double v25 = *(v24 - 1) - v22;
            goto LABEL_25;
          case 4:
            uint64_t v24 = (double *)&v21[v23];
            double v25 = v22 * *(v24 - 1);
            goto LABEL_25;
          case 5:
            uint64_t v24 = (double *)&v21[v23];
            double v25 = *(v24 - 1) / v22;
LABEL_25:
            *(v24 - 1) = v25;
            goto LABEL_26;
          default:
            return result;
        }
      }
LABEL_30:
      __break(1u);
LABEL_31:
      __break(1u);
LABEL_32:
      uint64_t result = (uint64_t)sub_25AD00344(0, a3[2] + 1, 1, a3);
      a3 = (void *)result;
LABEL_11:
      unint64_t v18 = a3[2];
      unint64_t v17 = a3[3];
      if (v18 >= v17 >> 1)
      {
        uint64_t result = (uint64_t)sub_25AD00344((void *)(v17 > 1), v18 + 1, 1, a3);
        a3 = (void *)result;
      }
      a3[2] = v18 + 1;
      a3[v18 + 4] = v6;
      *(void *)a1 = a3;
      return result;
    default:
      unint64_t v9 = *(void **)a1;
      uint64_t result = swift_isUniquelyReferenced_nonNull_native();
      if ((result & 1) == 0)
      {
        uint64_t result = (uint64_t)sub_25AD00344(0, v9[2] + 1, 1, v9);
        unint64_t v9 = (void *)result;
      }
      unint64_t v11 = v9[2];
      unint64_t v12 = v9[3];
      unint64_t v13 = v11 + 1;
      if (v11 >= v12 >> 1)
      {
        uint64_t v27 = v9;
        unint64_t v28 = v9[2];
        uint64_t result = (uint64_t)sub_25AD00344((void *)(v12 > 1), v11 + 1, 1, v27);
        unint64_t v11 = v28;
        unint64_t v9 = (void *)result;
      }
      void v9[2] = v13;
      v9[v11 + 4] = a3;
LABEL_26:
      *(void *)a1 = v9;
      return result;
  }
}

uint64_t sub_25AD0EBAC(uint64_t a1, char a2, uint64_t a3, unint64_t a4, char a5)
{
  switch(a5)
  {
    case 1:
      uint64_t v6 = 2238582;
      goto LABEL_8;
    case 2:
      if (!a1)
      {
        uint64_t v6 = 2238582;
        sub_25AD145A0();
        sub_25AD145A0();
        sub_25AD14AE0();
        sub_25AD145A0();
        swift_bridgeObjectRelease();
        goto LABEL_9;
      }
      uint64_t v6 = 0;
      if ((a4 & 0x8000000000000000) != 0)
      {
        __break(1u);
        goto LABEL_19;
      }
      if (*(void *)(a1 + 16) <= a4)
      {
LABEL_19:
        __break(1u);
        JUMPOUT(0x25AD0ED7CLL);
      }
      sub_25AD146E0();
      sub_25AD145A0();
LABEL_8:
      sub_25AD145A0();
LABEL_9:
      sub_25AD145A0();
      return v6;
    case 3:
      uint64_t result = 43;
      switch(a2)
      {
        case 2:
          return result;
        case 3:
          uint64_t result = 45;
          break;
        case 4:
          uint64_t result = 42;
          break;
        case 5:
          uint64_t result = 47;
          break;
        default:
          uint64_t result = 40;
          break;
      }
      return result;
    default:
      uint64_t v6 = 0;
      sub_25AD146E0();
      return v6;
  }
}

uint64_t sub_25AD0EDA4()
{
  return sub_25AD0EBAC(0, *(void *)v0, *(void *)(v0 + 8), *(void *)(v0 + 16), *(unsigned char *)(v0 + 24));
}

unint64_t sub_25AD0EDB8(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  unint64_t result = 0xD00000000000003FLL;
  switch(a4)
  {
    case 3:
      sub_25AD14860();
      swift_bridgeObjectRelease();
      sub_25AD14AE0();
      sub_25AD145A0();
      swift_bridgeObjectRelease();
      sub_25AD145A0();
      goto LABEL_4;
    case 4:
      return result;
    default:
      sub_25AD14860();
      swift_bridgeObjectRelease();
      sub_25AD14AE0();
      sub_25AD145A0();
      swift_bridgeObjectRelease();
LABEL_4:
      sub_25AD145A0();
      unint64_t result = 14897;
      break;
  }
  return result;
}

unint64_t sub_25AD0F02C()
{
  return sub_25AD0EDB8(*(void *)v0, *(void *)(v0 + 8), *(void *)(v0 + 16), *(unsigned char *)(v0 + 24));
}

uint64_t sub_25AD0F03C(uint64_t a1, uint64_t a2)
{
  return sub_25AD121B4(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(unsigned char *)(a1 + 24), *(void *)a2, *(void *)(a2 + 8), *(void *)(a2 + 16), *(unsigned char *)(a2 + 24));
}

uint64_t sub_25AD0F060(uint64_t a1)
{
  return sub_25AD0F08C(a1, qword_26A4B9B30);
}

uint64_t sub_25AD0F078(uint64_t a1)
{
  return sub_25AD0F08C(a1, qword_26A4B9B48);
}

uint64_t sub_25AD0F08C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_25AD14260();
  __swift_allocate_value_buffer(v3, a2);
  __swift_project_value_buffer(v3, (uint64_t)a2);
  return sub_25AD14220();
}

uint64_t sub_25AD0F0EC()
{
  uint64_t v0 = sub_25AD14260();
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = MEMORY[0x270FA5388](v0);
  uint64_t v4 = (char *)&v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = MEMORY[0x270FA5388](v2);
  int64_t v7 = (char *)&v10 - v6;
  __swift_allocate_value_buffer(v5, qword_26A4B9B60);
  __swift_project_value_buffer(v0, (uint64_t)qword_26A4B9B60);
  sub_25AD14210();
  if (qword_26A4B2F40 != -1) {
    swift_once();
  }
  __swift_project_value_buffer(v0, (uint64_t)qword_26A4B9B30);
  sub_25AD14230();
  unint64_t v8 = *(void (**)(char *, uint64_t))(v1 + 8);
  v8(v4, v0);
  if (qword_26A4B2F48 != -1) {
    swift_once();
  }
  __swift_project_value_buffer(v0, (uint64_t)qword_26A4B9B48);
  sub_25AD14230();
  return ((uint64_t (*)(char *, uint64_t))v8)(v7, v0);
}

uint64_t sub_25AD0F29C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, void *a6, unint64_t a7, unint64_t a8)
{
  uint64_t v15 = a1;
  if ((a2 & 0x1000000000000000) != 0 || !(a2 & 0x2000000000000000 | a1 & 0x1000000000000000))
  {
    swift_bridgeObjectRetain();
    sub_25AD14850();
    swift_bridgeObjectRelease();
    goto LABEL_11;
  }
  MEMORY[0x270FA5388](a1);
  if ((a2 & 0x2000000000000000) != 0)
  {
    v49[2] = v15;
    v49[3] = a2 & 0xFFFFFFFFFFFFFFLL;
    switch((char)v15)
    {
      case 0:
      case 9:
      case 10:
      case 11:
      case 12:
      case 13:
      case 32:
        swift_bridgeObjectRetain();
        goto LABEL_9;
      default:
        swift_bridgeObjectRetain();
        unint64_t v45 = (unsigned char *)_swift_stdlib_strtod_clocale();
        if (v45) {
          BOOL v20 = *v45 == 0;
        }
        else {
LABEL_9:
        }
          BOOL v20 = 0;
        LOBYTE(v49[0]) = v20;
        swift_bridgeObjectRelease();
        break;
    }
    goto LABEL_11;
  }
  unint64_t v47 = a5;
  uint64_t v48 = a4;
  uint64_t result = v15;
  a4 = a7;
  a5 = a6;
  uint64_t v17 = a3;
  a7 = a8;
  if ((v15 & 0x1000000000000000) == 0) {
    goto LABEL_43;
  }
  uint64_t v18 = (a2 & 0xFFFFFFFFFFFFFFFLL) + 32;
  for (uint64_t i = v15 & 0xFFFFFFFFFFFFLL; ; uint64_t i = v46)
  {
    swift_bridgeObjectRetain();
    LOBYTE(v49[0]) = sub_25AD12154(v18, i, (void (*)(uint64_t *__return_ptr))sub_25AD13A1C) & 1;
    swift_bridgeObjectRelease();
    a8 = a7;
    a3 = v17;
    a6 = a5;
    a7 = a4;
    a5 = v47;
    a4 = v48;
LABEL_11:
    uint64_t v21 = (void *)(a4 + 16);
    double v22 = a5 + 2;
    if (v49[0])
    {
      if (a3) {
        double v23 = -0.0;
      }
      else {
        double v23 = 0.0;
      }
      swift_beginAccess();
      if (__OFADD__(*v21, 1))
      {
        __break(1u);
      }
      else
      {
        ++*v21;
        swift_beginAccess();
        a6 = (void *)*v22;
        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        *double v22 = a6;
        if (isUniquelyReferenced_nonNull_native)
        {
LABEL_17:
          unint64_t v26 = a6[2];
          unint64_t v25 = a6[3];
          a4 = v26 + 1;
          if (v26 >= v25 >> 1)
          {
            a6 = sub_25AD00124((void *)(v25 > 1), v26 + 1, 1, a6);
            *double v22 = a6;
          }
          a6[2] = a4;
          uint64_t v27 = (double *)&a6[4 * v26];
          v27[4] = v23;
          v27[5] = 0.0;
          v27[6] = 0.0;
          *((unsigned char *)v27 + 56) = 0;
          goto LABEL_36;
        }
      }
      a6 = sub_25AD00124(0, a6[2] + 1, 1, a6);
      *double v22 = a6;
      goto LABEL_17;
    }
    a7 += 16;
    if (a6[2])
    {
      swift_bridgeObjectRetain();
      unint64_t v28 = sub_25AD0A230(v15, a2);
      if (v29)
      {
        char v30 = (uint64_t *)(a6[7] + 16 * v28);
        a4 = *v30;
        a5 = (void *)v30[1];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        swift_beginAccess();
        if (!__OFADD__(*v21, 1))
        {
          ++*v21;
          swift_beginAccess();
          uint64_t v31 = swift_bridgeObjectRetain();
          sub_25AD0E60C(v31);
          swift_endAccess();
          swift_beginAccess();
          uint64_t v32 = swift_bridgeObjectRetain();
          sub_25ACFE244(v32);
          swift_endAccess();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          goto LABEL_37;
        }
        __break(1u);
LABEL_49:
        a6 = sub_25AD00124(0, a6[2] + 1, 1, a6);
        *double v22 = a6;
LABEL_31:
        unint64_t v39 = a6[2];
        unint64_t v38 = a6[3];
        a4 = v39 + 1;
        if (v39 >= v38 >> 1)
        {
          a6 = sub_25AD00124((void *)(v38 > 1), v39 + 1, 1, a6);
          *double v22 = a6;
        }
        a6[2] = a4;
        char v40 = &a6[4 * v39];
        v40[5] = 0;
        v40[6] = 0;
        v40[4] = 0xBFF0000000000000;
        *((unsigned char *)v40 + 56) = 0;
        long long v41 = (void *)*v22;
        unint64_t v43 = *(void *)(*v22 + 16);
        unint64_t v42 = *(void *)(*v22 + 24);
        if (v43 >= v42 >> 1)
        {
          long long v41 = sub_25AD00124((void *)(v42 > 1), v43 + 1, 1, v41);
          *double v22 = v41;
        }
        v41[2] = v43 + 1;
        uint64_t v44 = &v41[4 * v43];
        v44[5] = 0;
        v44[6] = 0;
        v44[4] = 4;
        *((unsigned char *)v44 + 56) = 3;
LABEL_36:
        swift_endAccess();
        goto LABEL_37;
      }
      swift_bridgeObjectRelease();
    }
    swift_beginAccess();
    if (__OFADD__(*v21, 1))
    {
      __break(1u);
    }
    else
    {
      ++*v21;
      swift_beginAccess();
      swift_bridgeObjectRetain();
      sub_25AD007D4(v49, v15, a2);
      swift_endAccess();
      swift_bridgeObjectRelease();
      swift_beginAccess();
      a6 = (void *)*v22;
      swift_bridgeObjectRetain();
      char v33 = swift_isUniquelyReferenced_nonNull_native();
      *double v22 = a6;
      a4 = a3;
      if (v33) {
        goto LABEL_27;
      }
    }
    a6 = sub_25AD00124(0, a6[2] + 1, 1, a6);
    *double v22 = a6;
LABEL_27:
    unint64_t v35 = a6[2];
    unint64_t v34 = a6[3];
    a7 = v35 + 1;
    if (v35 >= v34 >> 1)
    {
      a6 = sub_25AD00124((void *)(v34 > 1), v35 + 1, 1, a6);
      *double v22 = a6;
    }
    a6[2] = a7;
    uint64_t v36 = &a6[4 * v35];
    v36[4] = v15;
    v36[5] = a2;
    void v36[6] = 0;
    *((unsigned char *)v36 + 56) = 1;
    swift_endAccess();
    if (a4)
    {
      swift_beginAccess();
      a6 = (void *)*v22;
      char v37 = swift_isUniquelyReferenced_nonNull_native();
      *double v22 = a6;
      if (v37) {
        goto LABEL_31;
      }
      goto LABEL_49;
    }
LABEL_37:
    uint64_t v17 = sub_25AD14580();
    uint64_t result = swift_beginAccess();
    if (!__OFADD__(*(void *)(a8 + 16), v17)) {
      break;
    }
    __break(1u);
LABEL_43:
    uint64_t v15 = result;
    uint64_t v18 = sub_25AD148B0();
  }
  *(void *)(a8 + 16) += v17;
  return result;
}

unint64_t sub_25AD0F954(unint64_t a1, uint64_t a2, char a3)
{
  if (a3)
  {
    sub_25AD14860();
    swift_bridgeObjectRelease();
    unint64_t v5 = 0xD000000000000013;
    sub_25AD14AE0();
    sub_25AD145A0();
    swift_bridgeObjectRelease();
    sub_25AD145A0();
    sub_25AD14AE0();
    sub_25AD145A0();
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_25AD14860();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    unint64_t v5 = a1;
    sub_25AD145A0();
  }
  return v5;
}

unint64_t sub_25AD0FA9C()
{
  return sub_25AD0F954(*(void *)v0, *(void *)(v0 + 8), *(unsigned char *)(v0 + 16));
}

uint64_t sub_25AD0FAA8()
{
  return sub_25AD13658(*v0);
}

uint64_t sub_25AD0FAB0(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_25AD0FE10(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_25AD0FAD0(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_25AD105C4(a1, a2, a3, (void *)*v3, &qword_26A4B3998, &qword_26A4B3190);
  *uint64_t v3 = result;
  return result;
}

uint64_t sub_25AD0FB00(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_25AD0FF7C(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_25AD0FB20(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_25AD100FC(a1, a2, a3, (void *)*v3, &qword_26A4B39A0, &qword_26A4B39A8);
  *uint64_t v3 = result;
  return result;
}

uint64_t sub_25AD0FB50(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_25AD100FC(a1, a2, a3, (void *)*v3, &qword_26A4B39B0, &qword_26A4B3550);
  *uint64_t v3 = result;
  return result;
}

uint64_t sub_25AD0FB80(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_25AD102A0(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_25AD0FBA0(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_25AD1041C(a1, a2, a3, (void *)*v3);
  *uint64_t v3 = result;
  return result;
}

uint64_t sub_25AD0FBC0(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_25AD105C4(a1, a2, a3, (void *)*v3, &qword_26A4B3858, &qword_26A4B31C8);
  *uint64_t v3 = result;
  return result;
}

uint64_t sub_25AD0FBF0(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_25AD10754(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_25AD0FC10(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_25AD108B4(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_25AD0FC30(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_25AD10A14(a1, a2, a3, (void *)*v3);
  *uint64_t v3 = result;
  return result;
}

uint64_t sub_25AD0FC50(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_25AD10BA0(a1, a2, a3, (void *)*v3);
  *uint64_t v3 = result;
  return result;
}

uint64_t sub_25AD0FC70(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_25AD10D44(a1, a2, a3, (void *)*v3);
  *uint64_t v3 = result;
  return result;
}

uint64_t sub_25AD0FC90(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_25AD10EE8(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_25AD0FCB0(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_25AD11054(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_25AD0FCD0(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_25AD111B4(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_25AD0FCF0(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_25AD1131C(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_25AD0FD10(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_25AD11478(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_25AD0FD30(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_25AD115D8(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_25AD0FD50(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_25AD11744(a1, a2, a3, (void *)*v3);
  *uint64_t v3 = result;
  return result;
}

uint64_t sub_25AD0FD70(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_25AD118EC(a1, a2, a3, (void *)*v3);
  *uint64_t v3 = result;
  return result;
}

uint64_t sub_25AD0FD90(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_25AD11A94(a1, a2, a3, (void *)*v3);
  *uint64_t v3 = result;
  return result;
}

uint64_t sub_25AD0FDB0(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_25AD11C20(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_25AD0FDD0(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_25AD11D8C(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_25AD0FDF0(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_25AD11F14(a1, a2, a3, (void *)*v3);
  *uint64_t v3 = result;
  return result;
}

uint64_t sub_25AD0FE10(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B3790);
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
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
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
  uint64_t result = sub_25AD14980();
  __break(1u);
  return result;
}

uint64_t sub_25AD0FF7C(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B3990);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 1;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 5);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  unint64_t v13 = v10 + 32;
  unint64_t v14 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[32 * v8]) {
      memmove(v13, v14, 32 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[32 * v8] || v13 >= &v14[32 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_25AD14980();
  __break(1u);
  return result;
}

uint64_t sub_25AD100E8(char a1, int64_t a2, char a3, void *a4)
{
  return sub_25AD100FC(a1, a2, a3, a4, &qword_26A4B39B0, &qword_26A4B3550);
}

uint64_t sub_25AD100FC(char a1, int64_t a2, char a3, void *a4, uint64_t *a5, uint64_t *a6)
{
  if (a3)
  {
    unint64_t v9 = a4[3];
    int64_t v10 = v9 >> 1;
    if ((uint64_t)(v9 >> 1) < a2)
    {
      if (v10 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
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
  if (v12)
  {
    __swift_instantiateConcreteTypeFromMangledName(a5);
    unint64_t v13 = (void *)swift_allocObject();
    size_t v14 = _swift_stdlib_malloc_size(v13);
    v13[2] = v11;
    v13[3] = 2 * ((uint64_t)(v14 - 32) / 56);
  }
  else
  {
    unint64_t v13 = (void *)MEMORY[0x263F8EE78];
  }
  uint64_t v15 = v13 + 4;
  uint64_t v16 = a4 + 4;
  size_t v17 = 7 * v11;
  if (a1)
  {
    if (v13 != a4 || v15 >= &v16[v17]) {
      memmove(v13 + 4, a4 + 4, v17 * 8);
    }
    a4[2] = 0;
    goto LABEL_28;
  }
  if (v16 >= &v15[v17] || v15 >= &v16[v17])
  {
    __swift_instantiateConcreteTypeFromMangledName(a6);
    swift_arrayInitWithCopy();
LABEL_28:
    swift_release();
    return (uint64_t)v13;
  }
LABEL_30:
  uint64_t result = sub_25AD14980();
  __break(1u);
  return result;
}

uint64_t sub_25AD102A0(char a1, int64_t a2, char a3, char *a4)
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
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B39B8);
    int64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 48);
  }
  else
  {
    int64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v12 = v10 + 32;
  unint64_t v13 = a4 + 32;
  size_t v14 = 48 * v8;
  if (a1)
  {
    if (v10 != a4 || v12 >= &v13[v14]) {
      memmove(v12, v13, v14);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[v14] || v12 >= &v13[v14])
  {
    swift_arrayInitWithCopy();
LABEL_28:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = sub_25AD14980();
  __break(1u);
  return result;
}

uint64_t sub_25AD1041C(char a1, int64_t a2, char a3, void *a4)
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
  uint64_t v8 = a4[2];
  if (v7 <= v8) {
    uint64_t v9 = a4[2];
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B37B0);
    int64_t v10 = (void *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    void v10[2] = v8;
    v10[3] = 2 * ((uint64_t)(v11 - 32) / 24);
  }
  else
  {
    int64_t v10 = (void *)MEMORY[0x263F8EE78];
  }
  unint64_t v12 = (unint64_t)(v10 + 4);
  unint64_t v13 = (unint64_t)(a4 + 4);
  if (a1)
  {
    if (v10 != a4 || v12 >= v13 + 24 * v8) {
      memmove(v10 + 4, a4 + 4, 24 * v8);
    }
    a4[2] = 0;
    goto LABEL_28;
  }
  if (v13 >= v12 + 24 * v8 || v12 >= v13 + 24 * v8)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B37A8);
    swift_arrayInitWithCopy();
LABEL_28:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = sub_25AD14980();
  __break(1u);
  return result;
}

uint64_t sub_25AD105C4(char a1, int64_t a2, char a3, void *a4, uint64_t *a5, uint64_t *a6)
{
  if (a3)
  {
    unint64_t v9 = a4[3];
    int64_t v10 = v9 >> 1;
    if ((uint64_t)(v9 >> 1) < a2)
    {
      if (v10 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_32;
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
  if (v12)
  {
    __swift_instantiateConcreteTypeFromMangledName(a5);
    unint64_t v13 = (void *)swift_allocObject();
    int64_t v14 = _swift_stdlib_malloc_size(v13);
    uint64_t v15 = v14 - 32;
    if (v14 < 32) {
      uint64_t v15 = v14 - 25;
    }
    v13[2] = v11;
    v13[3] = 2 * (v15 >> 3);
  }
  else
  {
    unint64_t v13 = (void *)MEMORY[0x263F8EE78];
  }
  unint64_t v16 = (unint64_t)(v13 + 4);
  unint64_t v17 = (unint64_t)(a4 + 4);
  if (a1)
  {
    if (v13 != a4 || v16 >= v17 + 8 * v11) {
      memmove(v13 + 4, a4 + 4, 8 * v11);
    }
    a4[2] = 0;
    goto LABEL_30;
  }
  if (v17 >= v16 + 8 * v11 || v16 >= v17 + 8 * v11)
  {
    __swift_instantiateConcreteTypeFromMangledName(a6);
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v13;
  }
LABEL_32:
  uint64_t result = sub_25AD14980();
  __break(1u);
  return result;
}

uint64_t sub_25AD10754(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B3918);
    int64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 29;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 2);
  }
  else
  {
    int64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  unint64_t v13 = v10 + 32;
  int64_t v14 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[4 * v8]) {
      memmove(v13, v14, 4 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[4 * v8] || v13 >= &v14[4 * v8])
  {
    memcpy(v13, v14, 4 * v8);
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_25AD14980();
  __break(1u);
  return result;
}

uint64_t sub_25AD108B4(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B34E0);
    int64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 25;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 3);
  }
  else
  {
    int64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  unint64_t v13 = v10 + 32;
  int64_t v14 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[8 * v8]) {
      memmove(v13, v14, 8 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[8 * v8] || v13 >= &v14[8 * v8])
  {
    memcpy(v13, v14, 8 * v8);
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_25AD14980();
  __break(1u);
  return result;
}

uint64_t sub_25AD10A14(char a1, int64_t a2, char a3, void *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B3950);
    int64_t v10 = (void *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 1;
    }
    void v10[2] = v8;
    v10[3] = 2 * (v12 >> 5);
  }
  else
  {
    int64_t v10 = (void *)MEMORY[0x263F8EE78];
  }
  unint64_t v13 = (unint64_t)(v10 + 4);
  unint64_t v14 = (unint64_t)(a4 + 4);
  if (a1)
  {
    if (v10 != a4 || v13 >= v14 + 32 * v8) {
      memmove(v10 + 4, a4 + 4, 32 * v8);
    }
    a4[2] = 0;
    goto LABEL_30;
  }
  if (v14 >= v13 + 32 * v8 || v13 >= v14 + 32 * v8)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B3480);
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_25AD14980();
  __break(1u);
  return result;
}

uint64_t sub_25AD10BA0(char a1, int64_t a2, char a3, void *a4)
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
  uint64_t v8 = a4[2];
  if (v7 <= v8) {
    uint64_t v9 = a4[2];
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B3958);
    int64_t v10 = (void *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    void v10[2] = v8;
    v10[3] = 2 * ((uint64_t)(v11 - 32) / 40);
  }
  else
  {
    int64_t v10 = (void *)MEMORY[0x263F8EE78];
  }
  unint64_t v12 = (unint64_t)(v10 + 4);
  unint64_t v13 = (unint64_t)(a4 + 4);
  if (a1)
  {
    if (v10 != a4 || v12 >= v13 + 40 * v8) {
      memmove(v10 + 4, a4 + 4, 40 * v8);
    }
    a4[2] = 0;
    goto LABEL_28;
  }
  if (v13 >= v12 + 40 * v8 || v12 >= v13 + 40 * v8)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B3960);
    swift_arrayInitWithCopy();
LABEL_28:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = sub_25AD14980();
  __break(1u);
  return result;
}

uint64_t sub_25AD10D44(char a1, int64_t a2, char a3, void *a4)
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
  uint64_t v8 = a4[2];
  if (v7 <= v8) {
    uint64_t v9 = a4[2];
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B3968);
    int64_t v10 = (void *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    void v10[2] = v8;
    v10[3] = 2 * ((uint64_t)(v11 - 32) / 40);
  }
  else
  {
    int64_t v10 = (void *)MEMORY[0x263F8EE78];
  }
  unint64_t v12 = (unint64_t)(v10 + 4);
  unint64_t v13 = (unint64_t)(a4 + 4);
  if (a1)
  {
    if (v10 != a4 || v12 >= v13 + 40 * v8) {
      memmove(v10 + 4, a4 + 4, 40 * v8);
    }
    a4[2] = 0;
    goto LABEL_28;
  }
  if (v13 >= v12 + 40 * v8 || v12 >= v13 + 40 * v8)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B34F8);
    swift_arrayInitWithCopy();
LABEL_28:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = sub_25AD14980();
  __break(1u);
  return result;
}

uint64_t sub_25AD10EE8(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B3970);
    int64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 1;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 5);
  }
  else
  {
    int64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  unint64_t v13 = v10 + 32;
  unint64_t v14 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[32 * v8]) {
      memmove(v13, v14, 32 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[32 * v8] || v13 >= &v14[32 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_25AD14980();
  __break(1u);
  return result;
}

uint64_t sub_25AD11054(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B3920);
    int64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 25;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 3);
  }
  else
  {
    int64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  unint64_t v13 = v10 + 32;
  unint64_t v14 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[8 * v8]) {
      memmove(v13, v14, 8 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[8 * v8] || v13 >= &v14[8 * v8])
  {
    memcpy(v13, v14, 8 * v8);
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_25AD14980();
  __break(1u);
  return result;
}

uint64_t sub_25AD111B4(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B3800);
    int64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 1;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 5);
  }
  else
  {
    int64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  unint64_t v13 = v10 + 32;
  unint64_t v14 = a4 + 32;
  size_t v15 = 32 * v8;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[v15]) {
      memmove(v13, v14, v15);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[v15] || v13 >= &v14[v15])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_25AD14980();
  __break(1u);
  return result;
}

uint64_t sub_25AD1131C(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B3928);
    int64_t v10 = (char *)swift_allocObject();
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
    int64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  unint64_t v13 = v10 + 32;
  unint64_t v14 = a4 + 32;
  size_t v15 = 16 * v8;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[v15]) {
      memmove(v13, v14, v15);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[v15] || v13 >= &v14[v15])
  {
    memcpy(v13, v14, v15);
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_25AD14980();
  __break(1u);
  return result;
}

uint64_t sub_25AD11478(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B3848);
    int64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 25;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 3);
  }
  else
  {
    int64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  unint64_t v13 = v10 + 32;
  unint64_t v14 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[8 * v8]) {
      memmove(v13, v14, 8 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[8 * v8] || v13 >= &v14[8 * v8])
  {
    memcpy(v13, v14, 8 * v8);
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_25AD14980();
  __break(1u);
  return result;
}

uint64_t sub_25AD115D8(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B37A0);
    int64_t v10 = (char *)swift_allocObject();
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
    int64_t v10 = (char *)MEMORY[0x263F8EE78];
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
  uint64_t result = sub_25AD14980();
  __break(1u);
  return result;
}

uint64_t sub_25AD11744(char a1, int64_t a2, char a3, void *a4)
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
  uint64_t v8 = a4[2];
  if (v7 <= v8) {
    uint64_t v9 = a4[2];
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B3930);
    int64_t v10 = (void *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    void v10[2] = v8;
    v10[3] = 2 * ((uint64_t)(v11 - 32) / 24);
  }
  else
  {
    int64_t v10 = (void *)MEMORY[0x263F8EE78];
  }
  unint64_t v12 = (unint64_t)(v10 + 4);
  unint64_t v13 = (unint64_t)(a4 + 4);
  if (a1)
  {
    if (v10 != a4 || v12 >= v13 + 24 * v8) {
      memmove(v10 + 4, a4 + 4, 24 * v8);
    }
    a4[2] = 0;
    goto LABEL_28;
  }
  if (v13 >= v12 + 24 * v8 || v12 >= v13 + 24 * v8)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B3938);
    swift_arrayInitWithCopy();
LABEL_28:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = sub_25AD14980();
  __break(1u);
  return result;
}

uint64_t sub_25AD118EC(char a1, int64_t a2, char a3, void *a4)
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
  uint64_t v8 = a4[2];
  if (v7 <= v8) {
    uint64_t v9 = a4[2];
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B3940);
    int64_t v10 = (void *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    void v10[2] = v8;
    v10[3] = 2 * ((uint64_t)(v11 - 32) / 24);
  }
  else
  {
    int64_t v10 = (void *)MEMORY[0x263F8EE78];
  }
  unint64_t v12 = (unint64_t)(v10 + 4);
  unint64_t v13 = (unint64_t)(a4 + 4);
  if (a1)
  {
    if (v10 != a4 || v12 >= v13 + 24 * v8) {
      memmove(v10 + 4, a4 + 4, 24 * v8);
    }
    a4[2] = 0;
    goto LABEL_28;
  }
  if (v13 >= v12 + 24 * v8 || v12 >= v13 + 24 * v8)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B3948);
    swift_arrayInitWithCopy();
LABEL_28:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = sub_25AD14980();
  __break(1u);
  return result;
}

uint64_t sub_25AD11A94(char a1, int64_t a2, char a3, void *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B37C8);
    int64_t v10 = (void *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    void v10[2] = v8;
    v10[3] = 2 * (v12 >> 4);
  }
  else
  {
    int64_t v10 = (void *)MEMORY[0x263F8EE78];
  }
  unint64_t v13 = (unint64_t)(v10 + 4);
  unint64_t v14 = (unint64_t)(a4 + 4);
  if (a1)
  {
    if (v10 != a4 || v13 >= v14 + 16 * v8) {
      memmove(v10 + 4, a4 + 4, 16 * v8);
    }
    a4[2] = 0;
    goto LABEL_30;
  }
  if (v14 >= v13 + 16 * v8 || v13 >= v14 + 16 * v8)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B37C0);
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_25AD14980();
  __break(1u);
  return result;
}

uint64_t sub_25AD11C20(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B3980);
    int64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 1;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 5);
  }
  else
  {
    int64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  unint64_t v13 = v10 + 32;
  unint64_t v14 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[32 * v8]) {
      memmove(v13, v14, 32 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[32 * v8] || v13 >= &v14[32 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_25AD14980();
  __break(1u);
  return result;
}

uint64_t sub_25AD11D8C(char a1, int64_t a2, char a3, char *a4)
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
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B3988);
    int64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 120);
  }
  else
  {
    int64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v12 = v10 + 32;
  unint64_t v13 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v12 >= &v13[120 * v8]) {
      memmove(v12, v13, 120 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[120 * v8] || v12 >= &v13[120 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_28:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = sub_25AD14980();
  __break(1u);
  return result;
}

uint64_t sub_25AD11F14(char a1, int64_t a2, char a3, void *a4)
{
  if (a3)
  {
    unint64_t v6 = a4[3];
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
LABEL_35:
        __break(1u);
        goto LABEL_36;
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
  if (!v9)
  {
    unint64_t v13 = (void *)MEMORY[0x263F8EE78];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B3748);
  uint64_t v10 = *(void *)(sub_25AD143E0() - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  unint64_t v13 = (void *)swift_allocObject();
  size_t v14 = _swift_stdlib_malloc_size(v13);
  if (!v11)
  {
    __break(1u);
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  if (v14 - v12 == 0x8000000000000000 && v11 == -1) {
    goto LABEL_34;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  uint64_t v16 = *(void *)(sub_25AD143E0() - 8);
  unint64_t v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  uint64_t v18 = (char *)v13 + v17;
  uint64_t v19 = (char *)a4 + v17;
  if (a1)
  {
    if (v13 < a4 || v18 >= &v19[*(void *)(v16 + 72) * v8])
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
    goto LABEL_32;
  }
  uint64_t v20 = *(void *)(v16 + 72) * v8;
  uint64_t v21 = &v18[v20];
  unint64_t v22 = (unint64_t)&v19[v20];
  if (v19 >= v21 || (unint64_t)v18 >= v22)
  {
    swift_arrayInitWithCopy();
LABEL_32:
    swift_release();
    return (uint64_t)v13;
  }
LABEL_36:
  uint64_t result = sub_25AD14980();
  __break(1u);
  return result;
}

uint64_t sub_25AD12154(uint64_t a1, uint64_t a2, void (*a3)(uint64_t *__return_ptr))
{
  if (a1)
  {
    a3(&var2);
    if (!v3) {
      char v4 = var2;
    }
  }
  else
  {
    ((void (*)(uint64_t *__return_ptr, void, void))a3)((uint64_t *)((char *)&var2 + 1), 0, 0);
    if (!v3) {
      char v4 = BYTE1(var2);
    }
  }
  return v4 & 1;
}

uint64_t sub_25AD121B4(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6, uint64_t a7, char a8)
{
  switch(a4)
  {
    case 1:
      if (a8 != 1) {
        goto LABEL_16;
      }
      goto LABEL_15;
    case 2:
      if (a8 != 2) {
        goto LABEL_16;
      }
      goto LABEL_15;
    case 3:
      if (a8 != 3 || a1 != a5) {
        goto LABEL_16;
      }
      if (a2 == a6 && a3 == a7) {
        uint64_t result = 1;
      }
      else {
        uint64_t result = sub_25AD14AF0();
      }
      break;
    case 4:
      if (a8 != 4 || a6 | a5 | a7) {
        goto LABEL_16;
      }
      uint64_t result = 1;
      break;
    default:
      if (a8) {
LABEL_16:
      }
        uint64_t result = 0;
      else {
LABEL_15:
      }
        uint64_t result = a1 == a5;
      break;
  }
  return result;
}

uint64_t sub_25AD1228C(uint64_t a1, uint64_t a2, void *a3)
{
  unint64_t v166 = a3;
  uint64_t v3 = sub_25AD14260();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = MEMORY[0x270FA5388](v3);
  uint64_t v155 = (char *)&v154 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v154 - v7;
  uint64_t v9 = (void *)swift_allocObject();
  void v9[2] = MEMORY[0x263F8EE78];
  uint64_t v171 = v9 + 2;
  uint64_t v10 = swift_allocObject();
  uint64_t v165 = v10;
  *(void *)(v10 + 16) = 0;
  uint64_t v161 = (uint64_t *)(v10 + 16);
  id v11 = objc_allocWithZone(MEMORY[0x263F08B08]);
  unint64_t v12 = (void *)sub_25AD144C0();
  swift_bridgeObjectRelease();
  unint64_t v13 = v11;
  uint64_t v14 = v3;
  id v15 = objc_msgSend(v13, sel_initWithString_, v12);

  objc_msgSend(v15, sel_setCharactersToBeSkipped_, 0);
  uint64_t v16 = swift_allocObject();
  unint64_t v164 = v16;
  *(void *)(v16 + 16) = 1;
  unint64_t v17 = (unint64_t *)(v16 + 16);
  sub_25AD14210();
  sub_25AD147C0();
  uint64_t v19 = v18;
  uint64_t v20 = *(void (**)(char *, uint64_t))(v4 + 8);
  int v168 = v8;
  uint64_t v169 = v4 + 8;
  uint64_t v167 = v20;
  v20(v8, v3);
  if (v19)
  {
    uint64_t v21 = sub_25AD14580();
    uint64_t result = swift_bridgeObjectRelease();
    if (__OFADD__(*v17, v21)) {
      goto LABEL_185;
    }
    *v17 += v21;
  }
  uint64_t v23 = swift_allocObject();
  unint64_t v163 = v23;
  *(void *)(v23 + 16) = MEMORY[0x263F8EE88];
  uint64_t v156 = v23 + 16;
  uint64_t v173 = v17;
  swift_beginAccess();
  swift_beginAccess();
  unsigned __int8 v24 = objc_msgSend(v15, sel_isAtEnd);
  uint64_t v162 = (void *)MEMORY[0x263F8EE78];
  uint64_t v158 = v9;
  if (v24)
  {
LABEL_5:
    swift_bridgeObjectRelease();
    int64_t v25 = v162[2];
    unint64_t v26 = (unint64_t)v161;
    uint64_t result = swift_beginAccess();
    uint64_t v27 = *(void *)v26 - v25;
    if (__OFSUB__(*(void *)v26, v25)) {
      goto LABEL_181;
    }
    *(void *)unint64_t v26 = v27;
    if (v27 >= 1)
    {
      uint64_t result = (uint64_t)v162;
      if (v27 != 1)
      {
        swift_bridgeObjectRelease();
        sub_25AD13958();
        swift_allocError();
        *(void *)(v140 + 8) = 0;
        *(void *)(v140 + 16) = 0;
        *(void *)uint64_t v140 = 0;
        char v141 = 4;
LABEL_159:
        *(unsigned char *)(v140 + 24) = v141;
        goto LABEL_160;
      }
      if (!v25)
      {
        swift_bridgeObjectRelease();
        uint64_t v32 = MEMORY[0x263F8EE78];
LABEL_155:
        uint64_t v145 = v158;
        swift_beginAccess();
        sub_25ACFE244(v32);
        swift_endAccess();

        unint64_t v26 = v145[2];
        swift_beginAccess();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_release();
        swift_release();
        swift_release();
        swift_release();
        return v26;
      }
      if (*((unsigned char *)v162 + 32))
      {
        unint64_t v28 = v25 - 1;
        if (v25 == 1)
        {
LABEL_16:
          uint64_t v172 = MEMORY[0x263F8EE78];
          swift_bridgeObjectRetain();
          uint64_t result = sub_25AD0FCD0(0, v25, 0);
          uint64_t v32 = v172;
          uint64_t v33 = 16 * v25 + 16;
          while (v28 != -1)
          {
            if (v28 >= v162[2]) {
              goto LABEL_177;
            }
            uint64_t v34 = *((unsigned __int8 *)v162 + v33);
            uint64_t v172 = v32;
            unint64_t v36 = *(void *)(v32 + 16);
            unint64_t v35 = *(void *)(v32 + 24);
            if (v36 >= v35 >> 1)
            {
              uint64_t result = sub_25AD0FCD0(v35 > 1, v36 + 1, 1);
              uint64_t v32 = v172;
            }
            *(void *)(v32 + 16) = v36 + 1;
            uint64_t v37 = v32 + 32 * v36;
            *(void *)(v37 + 40) = 0;
            *(void *)(v37 + 48) = 0;
            *(void *)(v37 + 32) = v34;
            *(unsigned char *)(v37 + 56) = 3;
            --v28;
            v33 -= 16;
            if (v28 == -1)
            {
              swift_bridgeObjectRelease_n();
              goto LABEL_155;
            }
          }
          goto LABEL_176;
        }
        char v29 = v162 + 7;
        uint64_t v30 = 1;
        while (1)
        {
          uint64_t v31 = v30 + 1;
          if (__OFADD__(v30, 1)) {
            goto LABEL_182;
          }
          if (!*((unsigned char *)v29 - 8)) {
            goto LABEL_157;
          }
          v29 += 2;
          ++v30;
          if (v31 == v25) {
            goto LABEL_16;
          }
        }
      }
      char v29 = v162 + 5;
LABEL_157:
      unint64_t v26 = *v29;
      swift_bridgeObjectRelease();
LABEL_158:
      sub_25AD13958();
      swift_allocError();
      *(void *)(v140 + 8) = 0;
      *(void *)(v140 + 16) = 0;
      *(void *)uint64_t v140 = v26;
      char v141 = 1;
      goto LABEL_159;
    }
    if (v25)
    {
      unsigned int v139 = *((unsigned __int8 *)v162 + 32);
      unint64_t v26 = v162[5];
      swift_bridgeObjectRelease();
      if (v139 <= 1) {
        goto LABEL_158;
      }
    }
    else
    {
      swift_bridgeObjectRelease();
      uint64_t v142 = v173;
      swift_beginAccess();
      unint64_t v26 = *v142;
    }
    sub_25AD13958();
    swift_allocError();
    *(void *)(v143 + 8) = 0;
    *(void *)(v143 + 16) = 0;
    *(void *)uint64_t v143 = v26;
    char v144 = 2;
LABEL_153:
    *(unsigned char *)(v143 + 24) = v144;
LABEL_160:
    swift_willThrow();
    swift_release();
    swift_release();
    swift_release();
    swift_release();

    return v26;
  }
  uint64_t v162 = (void *)MEMORY[0x263F8EE78];
  BOOL v170 = 1;
  id v160 = v15;
  uint64_t v159 = v3;
  while (1)
  {
    while (1)
    {
      sub_25AD147B0();
      uint64_t v39 = v38;
      swift_bridgeObjectRelease();
      if (v39)
      {
        unint64_t v58 = *v173;
        uint64_t result = swift_isUniquelyReferenced_nonNull_native();
        if (result)
        {
          unint64_t v59 = v162;
        }
        else
        {
          uint64_t result = (uint64_t)sub_25AD00234(0, v162[2] + 1, 1, v162);
          unint64_t v59 = (void *)result;
        }
        unint64_t v61 = v59[2];
        unint64_t v60 = v59[3];
        unint64_t v62 = (uint64_t *)v173;
        if (v61 >= v60 >> 1)
        {
          uint64_t result = (uint64_t)sub_25AD00234((void *)(v60 > 1), v61 + 1, 1, v59);
          unint64_t v62 = (uint64_t *)v173;
          unint64_t v59 = (void *)result;
        }
        v59[2] = v61 + 1;
        unint64_t v63 = &v59[2 * v61];
        *((unsigned char *)v63 + 32) = 0;
        v63[5] = v58;
        uint64_t v64 = *v62 + 1;
        if (__OFADD__(*v62, 1)) {
          goto LABEL_186;
        }
        uint64_t v162 = v59;
        BOOL v170 = 0;
        uint64_t *v62 = v64;
        goto LABEL_88;
      }
      sub_25AD147B0();
      uint64_t v41 = v40;
      swift_bridgeObjectRelease();
      if (!v41) {
        break;
      }
      if (!v162[2]) {
        goto LABEL_169;
      }
      uint64_t result = swift_isUniquelyReferenced_nonNull_native();
      if (result)
      {
        uint64_t v65 = v162;
      }
      else
      {
        uint64_t result = (uint64_t)sub_25AD0BB78(v162);
        uint64_t v65 = (void *)result;
      }
      long long v67 = v65 + 2;
      uint64_t v66 = v65[2];
      if (!v66) {
        goto LABEL_178;
      }
      uint64_t v68 = v66 - 1;
      uint64_t v69 = (unsigned __int8 *)(v65 + 4);
      uint64_t v70 = (unsigned __int8 *)&v65[2 * v68 + 4];
      unint64_t v71 = *v70;
      unint64_t v26 = *((void *)v70 + 1);
      v65[2] = v68;
      LODWORD(v72) = 1;
      if (v71)
      {
        if (v71 != 1)
        {
          uint64_t v114 = v65;
          uint64_t v115 = (void **)v171;
          swift_beginAccess();
          uint64_t v116 = *v115;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            uint64_t v116 = sub_25AD00124(0, v116[2] + 1, 1, v116);
          }
          id v15 = v160;
          unint64_t v118 = v116[2];
          unint64_t v117 = v116[3];
          if (v118 >= v117 >> 1) {
            uint64_t v116 = sub_25AD00124((void *)(v117 > 1), v118 + 1, 1, v116);
          }
          v116[2] = v118 + 1;
          unint64_t v119 = &v116[4 * v118];
          v119[5] = 0;
          v119[6] = 0;
          v119[4] = v71;
          *((unsigned char *)v119 + 56) = 3;
          *uint64_t v171 = v116;
          uint64_t result = swift_endAccess();
          if (__OFSUB__(*v161, 1)) {
            goto LABEL_180;
          }
          --*v161;
          if (*v67)
          {
            unint64_t v71 = v26;
            uint64_t v120 = v114;
            do
            {
              uint64_t v65 = v120;
              uint64_t result = swift_isUniquelyReferenced_nonNull_native();
              if ((result & 1) == 0)
              {
                uint64_t result = (uint64_t)sub_25AD0BB78(v120);
                uint64_t v65 = (void *)result;
              }
              long long v67 = v65 + 2;
              uint64_t v121 = v65[2];
              if (!v121) {
                goto LABEL_178;
              }
              uint64_t v122 = v121 - 1;
              uint64_t v69 = (unsigned __int8 *)(v65 + 4);
              uint64_t v123 = (unsigned __int8 *)&v65[2 * v122 + 4];
              uint64_t v72 = *v123;
              unint64_t v26 = *((void *)v123 + 1);
              v65[2] = v122;
              if (!v72) {
                goto LABEL_130;
              }
              if (v72 == 1)
              {
                uint64_t v162 = v65;
                LODWORD(v72) = 0;
                goto LABEL_132;
              }
              uint64_t v124 = v65;
              unint64_t v125 = (void **)v171;
              swift_beginAccess();
              uint64_t v126 = *v125;
              if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
                uint64_t v126 = sub_25AD00124(0, v126[2] + 1, 1, v126);
              }
              id v15 = v160;
              unint64_t v128 = v126[2];
              unint64_t v127 = v126[3];
              if (v128 >= v127 >> 1) {
                uint64_t v126 = sub_25AD00124((void *)(v127 > 1), v128 + 1, 1, v126);
              }
              v126[2] = v128 + 1;
              uint64_t v129 = &v126[4 * v128];
              v129[5] = 0;
              v129[6] = 0;
              v129[4] = v72;
              *((unsigned char *)v129 + 56) = 3;
              *uint64_t v171 = v126;
              uint64_t result = swift_endAccess();
              uint64_t v14 = v159;
              if (__OFSUB__(*v161, 1)) {
                goto LABEL_180;
              }
              --*v161;
              unint64_t v71 = v26;
              uint64_t v120 = v124;
            }
            while (*v67);
          }
LABEL_169:
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          unint64_t v26 = *v173;
          sub_25AD13958();
          swift_allocError();
          *(void *)(v153 + 8) = 0;
          *(void *)(v153 + 16) = 0;
          *(void *)uint64_t v153 = v26;
          *(unsigned char *)(v153 + 24) = 0;
          goto LABEL_160;
        }
        uint64_t v162 = v65;
        unint64_t v71 = 0;
LABEL_132:
        uint64_t v131 = (void **)v171;
        swift_beginAccess();
        unint64_t v132 = *v131;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          unint64_t v132 = sub_25AD00124(0, v132[2] + 1, 1, v132);
        }
        unint64_t v26 = v132[2];
        unint64_t v133 = v132[3];
        unint64_t v134 = v133 >> 1;
        unint64_t v135 = v26 + 1;
        if (v133 >> 1 <= v26)
        {
          unint64_t v132 = sub_25AD00124((void *)(v133 > 1), v26 + 1, 1, v132);
          unint64_t v133 = v132[3];
          unint64_t v134 = v133 >> 1;
        }
        v132[2] = v135;
        int64_t v136 = &v132[4 * v26];
        v136[5] = 0;
        v136[6] = 0;
        v136[4] = 0xBFF0000000000000;
        *((unsigned char *)v136 + 56) = 0;
        if (v134 <= v135) {
          unint64_t v132 = sub_25AD00124((void *)(v133 > 1), v26 + 2, 1, v132);
        }
        v132[2] = v26 + 2;
        uint64_t v137 = &v132[4 * v135];
        v137[5] = 0;
        v137[6] = 0;
        v137[4] = 4;
        *((unsigned char *)v137 + 56) = 3;
        *uint64_t v171 = v132;
        uint64_t result = swift_endAccess();
        uint64_t v130 = (uint64_t *)v173;
        uint64_t v65 = v162;
      }
      else
      {
LABEL_130:
        uint64_t v130 = (uint64_t *)v173;
      }
      if (*v161 < 1)
      {
        swift_bridgeObjectRelease();
        if (*v67)
        {
          unint64_t v26 = *v69;
          unint64_t v71 = v65[5];
          swift_bridgeObjectRelease();
          if (v26 <= 1)
          {
            sub_25AD13958();
            swift_allocError();
            *(void *)(v152 + 8) = 0;
            *(void *)(v152 + 16) = 0;
            *(void *)uint64_t v152 = v71;
            *(unsigned char *)(v152 + 24) = 1;
            id v15 = v160;
            goto LABEL_160;
          }
          id v15 = v160;
        }
        else
        {
          swift_bridgeObjectRelease();
          id v15 = v160;
          if (v72) {
            unint64_t v71 = *v173;
          }
        }
        sub_25AD13958();
        swift_allocError();
        *(void *)(v140 + 16) = 0;
        *(void *)uint64_t v140 = v71;
LABEL_150:
        *(void *)(v140 + 8) = 0;
        char v141 = 2;
        goto LABEL_159;
      }
      uint64_t v138 = *v130 + 1;
      if (__OFADD__(*v130, 1)) {
        goto LABEL_188;
      }
      uint64_t v162 = v65;
      BOOL v170 = 0;
      *uint64_t v130 = v138;
      uint64_t v9 = v158;
      id v15 = v160;
LABEL_89:
      uint64_t v98 = v168;
      sub_25AD14210();
      sub_25AD147C0();
      uint64_t v100 = v99;
      v167(v98, v14);
      if (v100)
      {
        uint64_t v101 = sub_25AD14580();
        uint64_t result = swift_bridgeObjectRelease();
        if (__OFADD__(*v173, v101)) {
          goto LABEL_179;
        }
        *v173 += v101;
        BOOL v170 = 1;
      }
      if (objc_msgSend(v15, sel_isAtEnd)) {
        goto LABEL_5;
      }
    }
    if (qword_26A4B2F40 != -1) {
      swift_once();
    }
    __swift_project_value_buffer(v14, (uint64_t)qword_26A4B9B30);
    uint64_t v42 = sub_25AD147C0();
    if (!v43) {
      goto LABEL_58;
    }
    uint64_t v44 = v42;
    uint64_t v45 = v43;
    swift_bridgeObjectRetain();
    unsigned __int8 v46 = sub_25AD0E78C(v44, v45);
    if (v46 - 2 >= 2)
    {
      if (v46 != 6)
      {
LABEL_71:
        BOOL v170 = 0;
        uint64_t v50 = 0;
        goto LABEL_72;
      }
      swift_bridgeObjectRelease();
LABEL_58:
      if (qword_26A4B2F50 != -1) {
        swift_once();
      }
      __swift_project_value_buffer(v14, (uint64_t)qword_26A4B9B60);
      uint64_t v73 = sub_25AD147D0();
      if (!v74)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        char v146 = v168;
        sub_25AD14250();
        uint64_t v147 = v155;
        sub_25AD14240();
        long long v148 = v167;
        v167(v146, v14);
        unint64_t v26 = sub_25AD147C0();
        unint64_t v150 = v149;
        v148(v147, v14);
        if (!v150)
        {
          unint64_t v26 = 0;
          unint64_t v150 = 0xE000000000000000;
        }
        unint64_t v151 = *v173;
        sub_25AD13958();
        swift_allocError();
        *(void *)uint64_t v143 = v151;
        *(void *)(v143 + 8) = v26;
        *(void *)(v143 + 16) = v150;
        char v144 = 3;
        goto LABEL_153;
      }
      sub_25AD0F29C(v73, v74, 0, v165, v9, v166, v163, v164);
      swift_bridgeObjectRelease();
      BOOL v170 = 0;
      goto LABEL_89;
    }
    unint64_t v47 = v168;
    sub_25AD14210();
    sub_25AD147C0();
    uint64_t v49 = v48;
    v167(v47, v14);
    if (v49)
    {
      uint64_t v50 = sub_25AD14580();
      swift_bridgeObjectRelease();
      if (!v170 || v50 != 0) {
        goto LABEL_63;
      }
    }
    else if (!v170)
    {
      goto LABEL_71;
    }
    if (objc_msgSend(v15, sel_isAtEnd)) {
      break;
    }
    uint64_t v51 = sub_25AD14580();
    uint64_t v52 = *v173 + v51;
    if (__OFADD__(*v173, v51))
    {
      __break(1u);
      goto LABEL_169;
    }
    *uint64_t v173 = v52;
    sub_25AD147B0();
    uint64_t v54 = v53;
    swift_bridgeObjectRelease();
    if (v54)
    {
      swift_bridgeObjectRelease();
      uint64_t result = swift_isUniquelyReferenced_nonNull_native();
      if (result)
      {
        uint64_t v75 = v162;
      }
      else
      {
        uint64_t result = (uint64_t)sub_25AD00234(0, v162[2] + 1, 1, v162);
        uint64_t v75 = (void *)result;
      }
      unint64_t v77 = v75[2];
      unint64_t v76 = v75[3];
      uint64_t v78 = (uint64_t *)v173;
      if (v77 >= v76 >> 1)
      {
        uint64_t result = (uint64_t)sub_25AD00234((void *)(v76 > 1), v77 + 1, 1, v75);
        uint64_t v78 = (uint64_t *)v173;
        uint64_t v75 = (void *)result;
      }
      v75[2] = v77 + 1;
      unint64_t v79 = &v75[2 * v77];
      *((unsigned char *)v79 + 32) = 1;
      v79[5] = v52;
      uint64_t v80 = *v78 + 1;
      if (__OFADD__(*v78, 1)) {
        goto LABEL_187;
      }
      uint64_t v162 = v75;
      *uint64_t v78 = v80;
      unsigned __int8 v81 = objc_msgSend(v15, sel_isAtEnd);
      uint64_t v9 = v158;
      if (v81) {
        goto LABEL_5;
      }
    }
    else
    {
      if (qword_26A4B2F50 != -1) {
        swift_once();
      }
      __swift_project_value_buffer(v14, (uint64_t)qword_26A4B9B60);
      uint64_t v55 = sub_25AD147D0();
      uint64_t v50 = v56;
      if (!v56) {
        goto LABEL_63;
      }
      uint64_t v57 = v55;
      swift_bridgeObjectRelease();
      sub_25AD0F29C(v57, v50, v46 == 3, v165, v9, v166, v163, v164);
      swift_bridgeObjectRelease();
      if (objc_msgSend(v15, sel_isAtEnd)) {
        goto LABEL_5;
      }
    }
  }
  uint64_t v50 = 0;
LABEL_63:
  BOOL v170 = v50 != 0;
LABEL_72:
  unint64_t v82 = v162;
  uint64_t v83 = v162[2];
  if (!v83) {
    goto LABEL_81;
  }
  uint64_t v162 = (v46 - 2) > 3u ? 0 : (void *)qword_25AD18120[(char)(v46 - 2)];
  uint64_t v84 = &v82[2 * v83];
  int v85 = *((unsigned __int8 *)v84 + 16);
  uint64_t v86 = v84[3];
  if ((v85 - 2) < 2)
  {
    unint64_t v87 = 5;
  }
  else
  {
    if ((v85 - 4) < 2) {
      goto LABEL_95;
    }
    unint64_t v87 = 0;
  }
  if (v87 < (unint64_t)v162)
  {
LABEL_81:
    unint64_t v88 = *v173;
    uint64_t v89 = v82;
    if (swift_isUniquelyReferenced_nonNull_native()) {
      uint64_t v90 = v89;
    }
    else {
      uint64_t v90 = sub_25AD00234(0, v89[2] + 1, 1, v89);
    }
    unint64_t v92 = v90[2];
    unint64_t v91 = v90[3];
    if (v92 >= v91 >> 1) {
      uint64_t v90 = sub_25AD00234((void *)(v91 > 1), v92 + 1, 1, v90);
    }
    v90[2] = v92 + 1;
    uint64_t v162 = v90;
    uint64_t v93 = &v90[2 * v92];
    *((unsigned char *)v93 + 32) = v46;
    v93[5] = v88;
    uint64_t v94 = sub_25AD14580();
    uint64_t result = swift_bridgeObjectRelease();
    uint64_t v95 = v94 + v50;
    if (__OFADD__(v94, v50)) {
      goto LABEL_183;
    }
    BOOL v96 = __OFADD__(*v173, v95);
    uint64_t v97 = *v173 + v95;
    if (v96) {
      goto LABEL_184;
    }
    *uint64_t v173 = v97;
LABEL_88:
    uint64_t v9 = v158;
    goto LABEL_89;
  }
  while (1)
  {
LABEL_95:
    uint64_t v157 = v86;
    uint64_t v103 = v82;
    uint64_t v104 = (void **)v171;
    swift_beginAccess();
    unint64_t v105 = *v104;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      unint64_t v105 = sub_25AD00124(0, v105[2] + 1, 1, v105);
    }
    unint64_t v107 = v105[2];
    unint64_t v106 = v105[3];
    if (v107 >= v106 >> 1) {
      unint64_t v105 = sub_25AD00124((void *)(v106 > 1), v107 + 1, 1, v105);
    }
    v105[2] = v107 + 1;
    uint64_t v108 = &v105[4 * v107];
    v108[5] = 0;
    v108[6] = 0;
    v108[4] = v85;
    *((unsigned char *)v108 + 56) = 3;
    *uint64_t v171 = v105;
    uint64_t result = swift_endAccess();
    unint64_t v82 = v103;
    if (v103[2])
    {
      uint64_t result = swift_isUniquelyReferenced_nonNull_native();
      id v15 = v160;
      uint64_t v14 = v159;
      if (result)
      {
        unint64_t v82 = v103;
      }
      else
      {
        uint64_t result = (uint64_t)sub_25AD0BB78(v103);
        unint64_t v82 = (void *)result;
      }
      uint64_t v109 = v82[2];
      uint64_t v110 = v161;
      if (!v109) {
        goto LABEL_175;
      }
      v82[2] = v109 - 1;
    }
    else
    {
      id v15 = v160;
      uint64_t v14 = v159;
      uint64_t v110 = v161;
    }
    uint64_t v111 = *v110 - 1;
    if (__OFSUB__(*v110, 1)) {
      break;
    }
    *uint64_t v110 = v111;
    if (v111 < 0)
    {
      unint64_t v26 = (unint64_t)v82;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_25AD13958();
      swift_allocError();
      *(void *)(v140 + 16) = 0;
      *(void *)uint64_t v140 = v157;
      goto LABEL_150;
    }
    uint64_t v112 = v82[2];
    if (v112)
    {
      uint64_t v113 = &v82[2 * v112];
      LOBYTE(v85) = *((unsigned char *)v113 + 16);
      unint64_t v102 = (v85 - 2) <= 3u ? qword_25AD18120[(char)(v85 - 2)] : 0;
      uint64_t v86 = v113[3];
      if (v102 >= (unint64_t)v162) {
        continue;
      }
    }
    goto LABEL_81;
  }
  __break(1u);
LABEL_175:
  __break(1u);
LABEL_176:
  __break(1u);
LABEL_177:
  __break(1u);
LABEL_178:
  __break(1u);
LABEL_179:
  __break(1u);
LABEL_180:
  __break(1u);
LABEL_181:
  __break(1u);
LABEL_182:
  __break(1u);
LABEL_183:
  __break(1u);
LABEL_184:
  __break(1u);
LABEL_185:
  __break(1u);
LABEL_186:
  __break(1u);
LABEL_187:
  __break(1u);
LABEL_188:
  __break(1u);
  return result;
}

uint64_t sub_25AD13658(uint64_t a1)
{
  int64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    uint64_t v21 = MEMORY[0x263F8EE78];
    swift_bridgeObjectRetain();
    sub_25AD0FAB0(0, v1, 0);
    uint64_t v3 = (unsigned __int8 *)(a1 + 56);
    while (2)
    {
      uint64_t v4 = *((void *)v3 - 3);
      uint64_t v5 = *((void *)v3 - 2);
      uint64_t v6 = *((void *)v3 - 1);
      int v7 = *v3;
      v3 += 32;
      switch(v7)
      {
        case 1:
          uint64_t v19 = 2238582;
          unint64_t v20 = 0xE300000000000000;
          swift_bridgeObjectRetain();
          sub_25AD145A0();
          sub_25AD145A0();
          uint64_t v8 = v4;
          uint64_t v9 = v5;
          uint64_t v10 = v6;
          unsigned __int8 v11 = 1;
          goto LABEL_7;
        case 2:
          uint64_t v19 = 2238582;
          unint64_t v20 = 0xE300000000000000;
          swift_bridgeObjectRetain();
          sub_25AD145A0();
          sub_25AD145A0();
          sub_25AD14AE0();
          sub_25AD145A0();
          swift_bridgeObjectRelease();
          sub_25AD145A0();
          uint64_t v8 = v4;
          uint64_t v9 = v5;
          uint64_t v10 = v6;
          unsigned __int8 v11 = 2;
LABEL_7:
          sub_25AD0CF00(v8, v9, v10, v11);
          goto LABEL_8;
        case 3:
          unint64_t v12 = 0xE100000000000000;
          uint64_t v13 = 43;
          switch((char)v4)
          {
            case 2:
              goto LABEL_9;
            case 3:
              uint64_t v13 = 45;
              break;
            case 4:
              uint64_t v13 = 42;
              break;
            case 5:
              uint64_t v13 = 47;
              break;
            default:
              uint64_t v13 = 40;
              break;
          }
          goto LABEL_9;
        default:
          uint64_t v19 = 0;
          unint64_t v20 = 0xE000000000000000;
          sub_25AD146E0();
LABEL_8:
          uint64_t v13 = v19;
          unint64_t v12 = v20;
LABEL_9:
          unint64_t v15 = *(void *)(v21 + 16);
          unint64_t v14 = *(void *)(v21 + 24);
          if (v15 >= v14 >> 1) {
            sub_25AD0FAB0(v14 > 1, v15 + 1, 1);
          }
          *(void *)(v21 + 16) = v15 + 1;
          uint64_t v16 = v21 + 16 * v15;
          *(void *)(v16 + 32) = v13;
          *(void *)(v16 + 40) = v12;
          if (--v1) {
            continue;
          }
          swift_bridgeObjectRelease();
          break;
      }
      break;
    }
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B2FC8);
  sub_25ACE89C8();
  uint64_t v17 = sub_25AD144B0();
  swift_bridgeObjectRelease();
  return v17;
}

uint64_t sub_25AD13910()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_25AD13948()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

unint64_t sub_25AD13958()
{
  unint64_t result = qword_26A4B3978;
  if (!qword_26A4B3978)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4B3978);
  }
  return result;
}

unsigned char *sub_25AD139AC@<X0>(unsigned char *result@<X0>, BOOL *a2@<X8>)
{
  unsigned int v3 = *result;
  BOOL v4 = v3 > 0x20;
  uint64_t v5 = (1 << v3) & 0x100003E01;
  BOOL v6 = v4 || v5 == 0;
  v7 = v6 && (unint64_t result = (unsigned char *)_swift_stdlib_strtod_clocale()) != 0 && *result == 0;
  *a2 = v7;
  return result;
}

void *sub_25AD13A1C@<X0>(unsigned char *a1@<X8>)
{
  unint64_t result = (*(void *(**)(uint64_t *__return_ptr))(v1 + 16))(&v5);
  if (!v2) {
    *a1 = v5;
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for Operator(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x25AD13B2CLL);
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

ValueMetadata *type metadata accessor for Operator()
{
  return &type metadata for Operator;
}

uint64_t sub_25AD13B64(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  if (a4 == 3) {
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t destroy for Expression.ParseError(uint64_t a1)
{
  return sub_25AD13B90(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(unsigned char *)(a1 + 24));
}

uint64_t sub_25AD13B90(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  if (a4 == 3) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t initializeWithCopy for Expression.ParseError(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  return sub_25AD13EE8(a1, a2, a3, (void (*)(void, uint64_t, uint64_t, uint64_t))sub_25AD13B64);
}

uint64_t *assignWithCopy for Expression.ParseError(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  return sub_25AD13F7C(a1, a2, a3, (void (*)(void, uint64_t, uint64_t, uint64_t))sub_25AD13B64, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_25AD13B90);
}

uint64_t *assignWithTake for Expression.ParseError(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  return sub_25AD14014(a1, a2, a3, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_25AD13B90);
}

uint64_t getEnumTagSinglePayload for Expression.ParseError(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFC && *(unsigned char *)(a1 + 25)) {
    return (*(_DWORD *)a1 + 252);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 24);
  if (v3 <= 4) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for Expression.ParseError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFB)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(unsigned char *)(result + 24) = 0;
    *(void *)uint64_t result = a2 - 252;
    if (a3 >= 0xFC) {
      *(unsigned char *)(result + 25) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFC) {
      *(unsigned char *)(result + 25) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 24) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_25AD13C94(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 24) <= 3u) {
    return *(unsigned __int8 *)(a1 + 24);
  }
  else {
    return (*(_DWORD *)a1 + 4);
  }
}

uint64_t sub_25AD13CAC(uint64_t result, unsigned int a2)
{
  uint64_t v2 = a2 - 4;
  if (a2 >= 4)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    LOBYTE(a2) = 4;
    *(void *)uint64_t result = v2;
  }
  *(unsigned char *)(result + 24) = a2;
  return result;
}

ValueMetadata *type metadata accessor for Expression.ParseError()
{
  return &type metadata for Expression.ParseError;
}

uint64_t sub_25AD13CDC(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) == 0) {
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t destroy for Expression.EvaluationError(uint64_t a1)
{
  return sub_25AD13CFC(*(void *)a1, *(void *)(a1 + 8), *(unsigned char *)(a1 + 16));
}

uint64_t sub_25AD13CFC(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) == 0) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t _s7Recount10ExpressionV15EvaluationErrorOwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  char v5 = *(unsigned char *)(a2 + 16);
  sub_25AD13CDC(*(void *)a2, v4, v5);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for Expression.EvaluationError(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  char v5 = *(unsigned char *)(a2 + 16);
  sub_25AD13CDC(*(void *)a2, v4, v5);
  uint64_t v6 = *(void *)a1;
  uint64_t v7 = *(void *)(a1 + 8);
  char v8 = *(unsigned char *)(a1 + 16);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  sub_25AD13CFC(v6, v7, v8);
  return a1;
}

__n128 __swift_memcpy17_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for Expression.EvaluationError(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 16);
  uint64_t v4 = *(void *)a1;
  uint64_t v5 = *(void *)(a1 + 8);
  char v6 = *(unsigned char *)(a1 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(unsigned char *)(a1 + 16) = v3;
  sub_25AD13CFC(v4, v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for Expression.EvaluationError(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFF && *(unsigned char *)(a1 + 17)) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 1) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for Expression.EvaluationError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)__n128 result = a2 - 255;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 17) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 17) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 16) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_25AD13E98(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 16);
}

uint64_t sub_25AD13EA0(uint64_t result, char a2)
{
  *(unsigned char *)(result + 16) = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for Expression.EvaluationError()
{
  return &type metadata for Expression.EvaluationError;
}

uint64_t destroy for Operation(uint64_t a1)
{
  return sub_25AD0CF00(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(unsigned char *)(a1 + 24));
}

uint64_t initializeWithCopy for Operation(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  return sub_25AD13EE8(a1, a2, a3, (void (*)(void, uint64_t, uint64_t, uint64_t))sub_25AD0CEE4);
}

uint64_t sub_25AD13EE8(uint64_t a1, uint64_t *a2, uint64_t a3, void (*a4)(void, uint64_t, uint64_t, uint64_t))
{
  uint64_t v5 = *a2;
  uint64_t v6 = a2[1];
  uint64_t v7 = a2[2];
  uint64_t v8 = *((unsigned __int8 *)a2 + 24);
  a4(*a2, v6, v7, v8);
  *(void *)a1 = v5;
  *(void *)(a1 + 8) = v6;
  *(void *)(a1 + 16) = v7;
  *(unsigned char *)(a1 + 24) = v8;
  return a1;
}

uint64_t *assignWithCopy for Operation(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  return sub_25AD13F7C(a1, a2, a3, (void (*)(void, uint64_t, uint64_t, uint64_t))sub_25AD0CEE4, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_25AD0CF00);
}

uint64_t *sub_25AD13F7C(uint64_t *a1, uint64_t *a2, uint64_t a3, void (*a4)(void, uint64_t, uint64_t, uint64_t), void (*a5)(uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v7 = *a2;
  uint64_t v8 = a2[1];
  uint64_t v9 = a2[2];
  uint64_t v10 = *((unsigned __int8 *)a2 + 24);
  a4(*a2, v8, v9, v10);
  uint64_t v11 = *a1;
  uint64_t v12 = a1[1];
  uint64_t v13 = a1[2];
  *a1 = v7;
  a1[1] = v8;
  a1[2] = v9;
  uint64_t v14 = *((unsigned __int8 *)a1 + 24);
  *((unsigned char *)a1 + 24) = v10;
  a5(v11, v12, v13, v14);
  return a1;
}

uint64_t *assignWithTake for Operation(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  return sub_25AD14014(a1, a2, a3, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_25AD0CF00);
}

uint64_t *sub_25AD14014(uint64_t *a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v6 = *(void *)(a2 + 16);
  char v7 = *(unsigned char *)(a2 + 24);
  uint64_t v8 = *a1;
  uint64_t v10 = a1[1];
  uint64_t v9 = a1[2];
  *(_OWORD *)a1 = *(_OWORD *)a2;
  a1[2] = v6;
  uint64_t v11 = *((unsigned __int8 *)a1 + 24);
  *((unsigned char *)a1 + 24) = v7;
  a4(v8, v10, v9, v11);
  return a1;
}

uint64_t getEnumTagSinglePayload for Operation(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFD && *(unsigned char *)(a1 + 25)) {
    return (*(_DWORD *)a1 + 253);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 24);
  if (v3 <= 3) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for Operation(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFC)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(unsigned char *)(result + 24) = 0;
    *(void *)__n128 result = a2 - 253;
    if (a3 >= 0xFD) {
      *(unsigned char *)(result + 25) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFD) {
      *(unsigned char *)(result + 25) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 24) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_25AD140FC(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 24);
}

uint64_t sub_25AD14104(uint64_t result, char a2)
{
  *(unsigned char *)(result + 24) = a2;
  return result;
}

ValueMetadata *type metadata accessor for Operation()
{
  return &type metadata for Operation;
}

unint64_t sub_25AD14128()
{
  unint64_t result = qword_26A4B39C0;
  if (!qword_26A4B39C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4B39C0);
  }
  return result;
}

uint64_t sub_25AD14180()
{
  return MEMORY[0x270EEDD60]();
}

uint64_t sub_25AD14190()
{
  return MEMORY[0x270EEDD68]();
}

uint64_t sub_25AD141A0()
{
  return MEMORY[0x270EEDD70]();
}

uint64_t sub_25AD141B0()
{
  return MEMORY[0x270EEDDD0]();
}

uint64_t sub_25AD141C0()
{
  return MEMORY[0x270EEDE10]();
}

uint64_t sub_25AD141D0()
{
  return MEMORY[0x270EEDE18]();
}

uint64_t sub_25AD141E0()
{
  return MEMORY[0x270EEDEE8]();
}

uint64_t sub_25AD141F0()
{
  return MEMORY[0x270EEDF30]();
}

uint64_t sub_25AD14200()
{
  return MEMORY[0x270EEDF38]();
}

uint64_t sub_25AD14210()
{
  return MEMORY[0x270EEE098]();
}

uint64_t sub_25AD14220()
{
  return MEMORY[0x270EEE0C0]();
}

uint64_t sub_25AD14230()
{
  return MEMORY[0x270EEE1A8]();
}

uint64_t sub_25AD14240()
{
  return MEMORY[0x270EEE208]();
}

uint64_t sub_25AD14250()
{
  return MEMORY[0x270EEE248]();
}

uint64_t sub_25AD14260()
{
  return MEMORY[0x270EEE258]();
}

uint64_t sub_25AD14270()
{
  return MEMORY[0x270EEE638]();
}

uint64_t sub_25AD14280()
{
  return MEMORY[0x270EEE658]();
}

uint64_t sub_25AD14290()
{
  return MEMORY[0x270EEE670]();
}

uint64_t sub_25AD142A0()
{
  return MEMORY[0x270EEE920]();
}

uint64_t sub_25AD142B0()
{
  return MEMORY[0x270EEE930]();
}

uint64_t sub_25AD142C0()
{
  return MEMORY[0x270EEE950]();
}

uint64_t sub_25AD142D0()
{
  return MEMORY[0x270EEEEA8]();
}

uint64_t sub_25AD142E0()
{
  return MEMORY[0x270EEF238]();
}

uint64_t sub_25AD142F0()
{
  return MEMORY[0x270EEF250]();
}

uint64_t sub_25AD14300()
{
  return MEMORY[0x270EEF268]();
}

uint64_t sub_25AD14310()
{
  return MEMORY[0x270EEF288]();
}

uint64_t sub_25AD14320()
{
  return MEMORY[0x270EEF2A8]();
}

uint64_t sub_25AD14330()
{
  return MEMORY[0x270EEF2B8]();
}

uint64_t sub_25AD14340()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_25AD14350()
{
  return MEMORY[0x270EEFBD0]();
}

uint64_t sub_25AD14360()
{
  return MEMORY[0x270EEFC10]();
}

uint64_t sub_25AD14370()
{
  return MEMORY[0x270EEFC48]();
}

uint64_t sub_25AD14380()
{
  return MEMORY[0x270EEFCE0]();
}

uint64_t sub_25AD14390()
{
  return MEMORY[0x270EEFD28]();
}

uint64_t sub_25AD143A0()
{
  return MEMORY[0x270EEFE20]();
}

uint64_t sub_25AD143B0()
{
  return MEMORY[0x270EEFE68]();
}

uint64_t sub_25AD143C0()
{
  return MEMORY[0x270EEFF18]();
}

uint64_t sub_25AD143D0()
{
  return MEMORY[0x270EEFF40]();
}

uint64_t sub_25AD143E0()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_25AD143F0()
{
  return MEMORY[0x270EEFFC8]();
}

uint64_t sub_25AD14400()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_25AD14410()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_25AD14420()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_25AD14430()
{
  return MEMORY[0x270FA2C30]();
}

uint64_t sub_25AD14440()
{
  return MEMORY[0x270FA0970]();
}

uint64_t sub_25AD14450()
{
  return MEMORY[0x270FA09A8]();
}

uint64_t sub_25AD14460()
{
  return MEMORY[0x270FA09E8]();
}

uint64_t sub_25AD14470()
{
  return MEMORY[0x270FA0A48]();
}

uint64_t sub_25AD14480()
{
  return MEMORY[0x270FA0AC0]();
}

uint64_t sub_25AD14490()
{
  return MEMORY[0x270FA0AD0]();
}

uint64_t sub_25AD144A0()
{
  return MEMORY[0x270FA0B00]();
}

uint64_t sub_25AD144B0()
{
  return MEMORY[0x270F9D478]();
}

uint64_t sub_25AD144C0()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_25AD144D0()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_25AD144E0()
{
  return MEMORY[0x270EF1A10]();
}

uint64_t sub_25AD144F0()
{
  return MEMORY[0x270EF1A50]();
}

uint64_t sub_25AD14500()
{
  return MEMORY[0x270EF1A58]();
}

uint64_t sub_25AD14510()
{
  return MEMORY[0x270EF1AA8]();
}

uint64_t sub_25AD14520()
{
  return MEMORY[0x270EF1AD0]();
}

uint64_t sub_25AD14530()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_25AD14540()
{
  return MEMORY[0x270F9D620]();
}

uint64_t sub_25AD14550()
{
  return MEMORY[0x270F9D648]();
}

uint64_t sub_25AD14560()
{
  return MEMORY[0x270F9D6B8]();
}

uint64_t sub_25AD14570()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_25AD14580()
{
  return MEMORY[0x270F9D740]();
}

uint64_t sub_25AD14590()
{
  return MEMORY[0x270F9D748]();
}

uint64_t sub_25AD145A0()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_25AD145B0()
{
  return MEMORY[0x270F9D7C0]();
}

uint64_t sub_25AD145C0()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_25AD145D0()
{
  return MEMORY[0x270F9D7E8]();
}

uint64_t sub_25AD145E0()
{
  return MEMORY[0x270F9D800]();
}

uint64_t sub_25AD14600()
{
  return MEMORY[0x270F9D810]();
}

uint64_t sub_25AD14610()
{
  return MEMORY[0x270F9D860]();
}

uint64_t sub_25AD14620()
{
  return MEMORY[0x270F9D8B0]();
}

uint64_t sub_25AD14630()
{
  return MEMORY[0x270F9D8E0]();
}

uint64_t sub_25AD14640()
{
  return MEMORY[0x270F9D8F0]();
}

uint64_t sub_25AD14650()
{
  return MEMORY[0x270EF1B50]();
}

uint64_t sub_25AD14660()
{
  return MEMORY[0x270F9DA28]();
}

uint64_t sub_25AD14670()
{
  return MEMORY[0x270F9DBA0]();
}

uint64_t sub_25AD14680()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_25AD14690()
{
  return MEMORY[0x270F9DBB0]();
}

uint64_t sub_25AD146A0()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_25AD146B0()
{
  return MEMORY[0x270F9DBF0]();
}

uint64_t sub_25AD146C0()
{
  return MEMORY[0x270F9DC20]();
}

uint64_t sub_25AD146D0()
{
  return MEMORY[0x270F9DC50]();
}

uint64_t sub_25AD146E0()
{
  return MEMORY[0x270F9DDA0]();
}

uint64_t sub_25AD146F0()
{
  return MEMORY[0x270F9DEF0]();
}

uint64_t sub_25AD14700()
{
  return MEMORY[0x270FA2E40]();
}

uint64_t sub_25AD14710()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_25AD14720()
{
  return MEMORY[0x270FA0DE8]();
}

uint64_t sub_25AD14730()
{
  return MEMORY[0x270FA0E28]();
}

uint64_t sub_25AD14740()
{
  return MEMORY[0x270FA0EA0]();
}

uint64_t sub_25AD14750()
{
  return MEMORY[0x270FA0EA8]();
}

uint64_t sub_25AD14760()
{
  return MEMORY[0x270FA0EC0]();
}

uint64_t sub_25AD14770()
{
  return MEMORY[0x270FA0EE0]();
}

uint64_t sub_25AD14780()
{
  return MEMORY[0x270FA0F10]();
}

uint64_t sub_25AD14790()
{
  return MEMORY[0x270FA0F28]();
}

uint64_t sub_25AD147A0()
{
  return MEMORY[0x270FA0F58]();
}

uint64_t sub_25AD147B0()
{
  return MEMORY[0x270EF2350]();
}

uint64_t sub_25AD147C0()
{
  return MEMORY[0x270EF2378]();
}

uint64_t sub_25AD147D0()
{
  return MEMORY[0x270EF2388]();
}

uint64_t sub_25AD147E0()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_25AD147F0()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_25AD14800()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_25AD14810()
{
  return MEMORY[0x270F9E7F0]();
}

uint64_t sub_25AD14820()
{
  return MEMORY[0x270F9E958]();
}

uint64_t sub_25AD14830()
{
  return MEMORY[0x270F9E960]();
}

uint64_t sub_25AD14840()
{
  return MEMORY[0x270F9E970]();
}

uint64_t sub_25AD14850()
{
  return MEMORY[0x270F9E988]();
}

uint64_t sub_25AD14860()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_25AD14870()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_25AD14880()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_25AD14890()
{
  return MEMORY[0x270F9EA78]();
}

uint64_t sub_25AD148A0()
{
  return MEMORY[0x270F9EA98]();
}

uint64_t sub_25AD148B0()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_25AD148C0()
{
  return MEMORY[0x270F9EB98]();
}

uint64_t sub_25AD148D0()
{
  return MEMORY[0x270F9EBC0]();
}

uint64_t sub_25AD148E0()
{
  return MEMORY[0x270F9EBE0]();
}

uint64_t sub_25AD148F0()
{
  return MEMORY[0x270F9EC08]();
}

uint64_t sub_25AD14900()
{
  return MEMORY[0x270F9EC10]();
}

uint64_t sub_25AD14910()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t sub_25AD14920()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_25AD14930()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_25AD14940()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_25AD14950()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_25AD14960()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_25AD14970()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_25AD14980()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_25AD14990()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_25AD149A0()
{
  return MEMORY[0x270F9F250]();
}

uint64_t sub_25AD149B0()
{
  return MEMORY[0x270F9F258]();
}

uint64_t sub_25AD149C0()
{
  return MEMORY[0x270F9F270]();
}

uint64_t sub_25AD149D0()
{
  return MEMORY[0x270F9F2E0]();
}

uint64_t sub_25AD149E0()
{
  return MEMORY[0x270F9F2E8]();
}

uint64_t sub_25AD149F0()
{
  return MEMORY[0x270F9F308]();
}

uint64_t sub_25AD14A00()
{
  return MEMORY[0x270F9F318]();
}

uint64_t sub_25AD14A10()
{
  return MEMORY[0x270F9F350]();
}

uint64_t sub_25AD14A20()
{
  return MEMORY[0x270F9F358]();
}

uint64_t sub_25AD14A30()
{
  return MEMORY[0x270F9F360]();
}

uint64_t sub_25AD14A40()
{
  return MEMORY[0x270F9F390]();
}

uint64_t sub_25AD14A50()
{
  return MEMORY[0x270F9F3B0]();
}

uint64_t sub_25AD14A60()
{
  return MEMORY[0x270F9F428]();
}

uint64_t sub_25AD14A70()
{
  return MEMORY[0x270F9F430]();
}

uint64_t sub_25AD14A80()
{
  return MEMORY[0x270F9F438]();
}

uint64_t sub_25AD14A90()
{
  return MEMORY[0x270F9F448]();
}

uint64_t sub_25AD14AA0()
{
  return MEMORY[0x270F9F458]();
}

uint64_t sub_25AD14AB0()
{
  return MEMORY[0x270F9F490]();
}

uint64_t sub_25AD14AC0()
{
  return MEMORY[0x270F9F498]();
}

uint64_t sub_25AD14AD0()
{
  return MEMORY[0x270F9F4C8]();
}

uint64_t sub_25AD14AE0()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_25AD14AF0()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_25AD14B00()
{
  return MEMORY[0x270F9F920]();
}

uint64_t sub_25AD14B10()
{
  return MEMORY[0x270F9FB10]();
}

uint64_t sub_25AD14B20()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_25AD14B30()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_25AD14B40()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_25AD14B50()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_25AD14B60()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_25AD14B70()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_25AD14B80()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_25AD14B90()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_25AD14BA0()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_25AD14BB0()
{
  return MEMORY[0x270F9FD98]();
}

uint64_t sub_25AD14BC0()
{
  return MEMORY[0x270F9FF68]();
}

uint64_t sub_25AD14BE0()
{
  return MEMORY[0x270F9FFC8]();
}

uint64_t MobileGestalt_copy_hardwarePlatform_obj()
{
  return MEMORY[0x270F96060]();
}

uint64_t MobileGestalt_copy_marketingSOCNameString_obj()
{
  return MEMORY[0x270F96088]();
}

uint64_t MobileGestalt_copy_physicalHardwareNameString_obj()
{
  return MEMORY[0x270F96098]();
}

uint64_t MobileGestalt_get_current_device()
{
  return MEMORY[0x270F960E8]();
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

uint64_t _swift_stdlib_strtod_clocale()
{
  return MEMORY[0x270FA0170]();
}

void bzero(void *a1, size_t a2)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x270ED94B8](value);
}

long double fmod(long double __x, long double __y)
{
  MEMORY[0x270ED99D0](__x, __y);
  return result;
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x270ED9BE8](a1);
}

uint64_t kpc_force_all_ctrs_set()
{
  return MEMORY[0x270F8C1D8]();
}

uint64_t kpc_get_counter_count()
{
  return MEMORY[0x270F8C1E0]();
}

uint64_t kpc_set_actionid()
{
  return MEMORY[0x270F8C1F0]();
}

uint64_t kpc_set_config()
{
  return MEMORY[0x270F8C1F8]();
}

uint64_t kpc_set_counting()
{
  return MEMORY[0x270F8C200]();
}

uint64_t kpc_set_period()
{
  return MEMORY[0x270F8C208]();
}

uint64_t kperf_action_count_set()
{
  return MEMORY[0x270F8C218]();
}

uint64_t kperf_action_samplers_get()
{
  return MEMORY[0x270F8C228]();
}

uint64_t kperf_action_samplers_set()
{
  return MEMORY[0x270F8C230]();
}

uint64_t kperf_kdebug_action_get()
{
  return MEMORY[0x270F8C2A0]();
}

uint64_t kperf_kdebug_action_set()
{
  return MEMORY[0x270F8C2A8]();
}

uint64_t kperf_kdebug_filter_add_debugid()
{
  return MEMORY[0x270F8C2C8]();
}

uint64_t kperf_kdebug_filter_create()
{
  return MEMORY[0x270F8C2D0]();
}

uint64_t kperf_kdebug_filter_get()
{
  return MEMORY[0x270F8C2E0]();
}

uint64_t kperf_kdebug_filter_get_filter()
{
  return MEMORY[0x270F8C2E8]();
}

uint64_t kperf_kdebug_filter_get_n_filters()
{
  return MEMORY[0x270F8C2F0]();
}

uint64_t kperf_kdebug_filter_set()
{
  return MEMORY[0x270F8C2F8]();
}

uint64_t kperf_ns_to_ticks()
{
  return MEMORY[0x270F8C340]();
}

uint64_t kperf_sample_get()
{
  return MEMORY[0x270F8C350]();
}

uint64_t kperf_sample_off()
{
  return MEMORY[0x270F8C358]();
}

uint64_t kperf_sample_on()
{
  return MEMORY[0x270F8C360]();
}

uint64_t kperf_timer_action_get()
{
  return MEMORY[0x270F8C368]();
}

uint64_t kperf_timer_action_set()
{
  return MEMORY[0x270F8C370]();
}

uint64_t kperf_timer_count_get()
{
  return MEMORY[0x270F8C378]();
}

uint64_t kperf_timer_count_set()
{
  return MEMORY[0x270F8C380]();
}

uint64_t kperf_timer_period_set()
{
  return MEMORY[0x270F8C388]();
}

uint64_t ktrace_events_range()
{
  return MEMORY[0x270F8C4F8]();
}

uint64_t ktrace_events_single()
{
  return MEMORY[0x270F8C500]();
}

uint64_t ktrace_file_append_chunk()
{
  return MEMORY[0x270F8C508]();
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

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x270EDA498](__b, *(void *)&__c, __len);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
}

uint64_t self
{
  return MEMORY[0x270F9A730]();
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

uint64_t os_variant_has_internal_content()
{
  return MEMORY[0x270EDAB30]();
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x270EDB5D8](*(void *)&__errnum);
}

uint64_t swift_allocError()
{
  return MEMORY[0x270FA0190]();
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

uint64_t swift_getKeyPath()
{
  return MEMORY[0x270FA03B8]();
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

uint64_t swift_initStackObject()
{
  return MEMORY[0x270FA0478]();
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

uint64_t swift_unexpectedError()
{
  return MEMORY[0x270FA0588]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}

uint64_t swift_unknownObjectRetain_n()
{
  return MEMORY[0x270FA05A8]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x270FA0628]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x270FA0670]();
}