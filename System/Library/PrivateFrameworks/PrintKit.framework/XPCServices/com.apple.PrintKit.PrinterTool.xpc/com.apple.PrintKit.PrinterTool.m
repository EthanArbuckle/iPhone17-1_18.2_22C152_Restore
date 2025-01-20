uint64_t ippReadIO(uint64_t a1, uint64_t (*a2)(void *, unsigned __int8 *, unint64_t), ipp_t *a3)
{
  ipp_t *v5;
  ipp_t *v6;
  uint64_t v7;
  int v9;
  unsigned int v10;
  void v11[7];

  v5 = a3;
  v6 = v5;
  v7 = 0xFFFFFFFFLL;
  if (a1 && v5)
  {
    sub_1000067F0(v11, (uint64_t)a2, a1);
    v9 = 0;
    v10 = 19;
    sub_1000053AC((uint64_t)v11, &v9, &v10, 0, v6);
    v7 = 3;
  }
  return v7;
}

void sub_1000053AC(uint64_t a1, _DWORD *a2, unsigned int *a3, int a4, void *a5)
{
  id v104 = a5;
  v105 = a2;
  int v9 = *a2;
  if (*a2 == 2)
  {
LABEL_8:
    v106 = (ipp_t *)v104;
    while (1)
    {
      sub_100006848(a1, __dst, 1uLL);
      uint64_t v12 = validate_enum<ipp_tag_e,unsigned char>(LOBYTE(__dst[0]));
      uint64_t v13 = v12;
      if (v12 != 3) {
        break;
      }
      v17 = 0;
      id v18 = 0;
LABEL_26:
      _DWORD *v105 = 3;
      int v19 = 1;
LABEL_104:

      if (v19 && v19 != 3)
      {

        goto LABEL_107;
      }
    }
    if (v12 == 127)
    {
      sub_100006848(a1, __dst, 4uLL);
      uint64_t v13 = 0xFFFFFFFFLL;
LABEL_21:
      if (a4)
      {
        v67 = +[NSString stringWithFormat:@"ippReadIO: bad tag 0x%02x.", v13];
        sub_10000692C(a1, 662, @"Invalid group tag.", v67);
      }
      if (*a3 == v13) {
        ippAddSeparator(v106);
      }
      v17 = 0;
      id v18 = 0;
      *a3 = v13;
      int v19 = 3;
      goto LABEL_104;
    }
    if (!v12)
    {
      v68 = +[NSString stringWithFormat:@"ippReadIO: bad tag 0x%02x.", 0];
      sub_10000692C(a1, 651, @"Invalid group tag.", v68);
    }
    if ((int)v12 <= 15) {
      goto LABEL_21;
    }
    v14 = v106;
    sub_100006848(a1, __dst, 2uLL);
    unsigned int v15 = bswap32(LOWORD(__dst[0]));
    unint64_t v16 = HIWORD(v15);
    if (v16 > 0x8000)
    {
      v71 = +[NSString stringWithFormat:@"ippReadIO: bad name length %d.", HIWORD(v15)];
      sub_10000692C(a1, 213, @"IPP name larger than 32767 bytes.", v71);
    }
    if (LOWORD(__dst[0]) && a4)
    {
      v70 = +[NSString stringWithFormat:@"ippReadIO: bad attribute name in collection."];
      sub_10000692C(a1, 220, @"Invalid named IPP attribute in collection.", v70);
    }
    if (LOWORD(__dst[0]))
    {
      if (v13 != 55)
      {
        if (v13 == 74)
        {
          v73 = +[NSString stringWithFormat:@"ippReadIO: member name not empty."];
          sub_10000692C(a1, 311, @"IPP member name is not empty.", v73);
        }
        goto LABEL_34;
      }
    }
    else
    {
      if (v13 == 16)
      {
LABEL_34:
        v24 = sub_100006AA8(a1, v16, 1);
        v25 = [(ipp_t *)v14 addNewEmptyAttribute:v24 groupTag:*a3 valueTag:v13];
        v21 = v25;
        if (!v25)
        {
          v72 = +[NSString stringWithFormat:@"ippReadIO: unable to allocate attribute."];
          sub_10000692C(a1, 338, @"ippReadIO: unable to allocate attribute.", v72);
        }
        id v23 = [(ipp_attribute_t *)v25 addNewEmptyValue];

        goto LABEL_57;
      }
      if (v13 != 55)
      {
        if (v13 == 74)
        {
          if ((a4 & 1) == 0)
          {
            v75 = +[NSString stringWithFormat:@"ippReadIO: member attribute outside of collection."];
            sub_10000692C(a1, 315, @"IPP member attribute outside of collection.", v75);
          }
          v20 = [(ipp_t *)v14 addNewEmptyAttribute:0 groupTag:*a3 valueTag:0];
          v21 = v20;
          if (!v20)
          {
            v76 = +[NSString stringWithFormat:@"ippReadIO: unable to allocate attribute."];
            sub_10000692C(a1, 322, @"ippReadIO: unable to allocate attribute.", v76);
          }
          id v22 = [(ipp_attribute_t *)v20 addNewEmptyValue];
        }
        else
        {
          v26 = [(ipp_t *)v14 attrs];
          v21 = [v26 lastObject];

          if (!v21)
          {
            v74 = +[NSString stringWithFormat:@"ippReadIO: Attribute without name and no current."];
            sub_10000692C(a1, 231, @"IPP attribute has no name.", v74);
          }
          id v27 = (id)[(ipp_attribute_t *)v21 value_tag];
          id v28 = v27;
          if (v27)
          {
            if ((v27 - 53) < 2 || (v27 - 65) <= 8)
            {
              if ((v13 - 55) <= 0xFFFFFFFD && v13 != 19 && (v13 - 74) <= 0xFFFFFFF6)
              {
                v98 = ippTagString((int)v27);
                v99 = +[NSString stringWithFormat:@"ippReadIO: 1setOf value tag %x(%s) != %x(%s)", v28, v98, v13, ippTagString(v13)];
                sub_10000692C(a1, 258, @"IPP 1setOf attribute with incompatible value tags.", v99);
              }
              if (v27 != v13 && !ippCoerceAttrToValue(v14, v21, v13))
              {
                uint64_t v95 = [(ipp_attribute_t *)v21 name];
                v96 = ippTagString((int)v28);
                v97 = +[NSString stringWithFormat:@"ippReadIO: Failed to convert %@ attribute from %s to %s.", v95, v96, ippTagString(v13)];
                sub_10000692C(a1, 267, @"IPP 1setOf attribute with incompatible value tags.", v97);
              }
            }
            else if (v27 == 51 || v27 == 33)
            {
              if (v13 != 33 && v13 != 51)
              {
                v102 = ippTagString((int)v27);
                v103 = +[NSString stringWithFormat:@"ippReadIO: 1setOf value tag %x(%s) != %x(%s)", v28, v102, v13, ippTagString(v13)];
                sub_10000692C(a1, 280, @"IPP 1setOf attribute with incompatible value tags.", v103);
              }
              if (v13 == 51 && v27 == 33) {
                ippCoerceAttrToValue(v14, v21, 51);
              }
            }
            else if (v27 != v13)
            {
              v100 = ippTagString((int)v27);
              v101 = +[NSString stringWithFormat:@"ippReadIO: value tag %x(%s) != %x(%s)", v28, v100, v13, ippTagString(v13)];
              sub_10000692C(a1, 295, @"IPP 1setOf attribute with incompatible value tags.", v101);
            }
          }
          else
          {
            [(ipp_attribute_t *)v21 setValueTag:v13];
          }
          id v22 = [(ipp_attribute_t *)v21 addNewEmptyValue];
        }
        id v23 = v22;
        goto LABEL_57;
      }
    }
    v21 = 0;
    id v23 = 0;
LABEL_57:

    v29 = v21;
    id v30 = v23;
    v17 = v29;
    id v18 = v30;
    sub_100006848(a1, __dst, 2uLL);
    int v31 = LOWORD(__dst[0]);
    unint64_t v32 = __rev16(LOWORD(__dst[0]));
    if (v32 > 0x8000)
    {
      v69 = +[NSString stringWithFormat:@"ippReadIO: bad value length %d.", v32];
      sub_10000692C(a1, 372, @"IPP value larger than 32767 bytes.", v69);
    }
    switch((int)v13)
    {
      case 16:
      case 17:
      case 18:
      case 19:
      case 21:
      case 22:
      case 23:
        if ([(ipp_attribute_t *)v17 value_tag] != v13) {
          goto LABEL_62;
        }
        if (!v31) {
          goto LABEL_67;
        }
        [(ipp_attribute_t *)v17 setValueTag:65];
LABEL_62:
        id v33 = [v18 string];
        v35 = v34;
        v36 = sub_100006AA8(a1, v32, ((v13 - 67) < 7) & (0x73u >> (v13 - 67)));

        id v37 = v33;
        id v38 = v36;
        v39 = v38;
        if (v18)
        {
          objc_msgSend(v18, "setString:", v33, v38);
        }
        else
        {
        }
LABEL_66:

LABEL_67:
        if (v13 == 16)
        {
          v40 = [(ipp_attribute_t *)v17 values];
          [v40 removeAllObjects];
        }
LABEL_103:
        int v19 = 0;
        break;
      case 33:
      case 35:
        if (LOWORD(__dst[0]) != 1024)
        {
          if (v13 == 33)
          {
            v83 = +[NSString stringWithFormat:@"ippReadIO: bad integer value length %d.", v32];
            sub_10000692C(a1, 382, @"IPP integer value not 4 bytes.", v83);
          }
          v85 = +[NSString stringWithFormat:@"ippReadIO: bad integer value length %d.", v32];
          sub_10000692C(a1, 384, @"IPP enum value not 4 bytes.", v85);
        }
        sub_100006848(a1, __dst, 4uLL);
        unsigned int v41 = __dst[0];
        unsigned int v42 = [(ipp_attribute_t *)v17 value_tag];
        uint64_t v43 = bswap32(v41);
        if (v42 == 51)
        {
          v109[0] = v43;
          v109[1] = v43;
          [v18 setRange:v109];
        }
        else
        {
          [v18 setInteger:v43];
        }
        goto LABEL_102;
      case 34:
        if (LOWORD(__dst[0]) != 256)
        {
          v93 = +[NSString stringWithFormat:@"ippReadIO: bad BOOLean value length %d.", v32];
          sub_10000692C(a1, 398, @"IPP BOOLean value not 1 byte.", v93);
        }
        sub_100006848(a1, __dst, 1uLL);
        [v18 setBoolean:LOBYTE(__dst[0]) != 0];
        goto LABEL_102;
      case 49:
        if (LOWORD(__dst[0]) != 2816)
        {
          v92 = +[NSString stringWithFormat:@"ippReadIO: bad date value length %d.", v32];
          sub_10000692C(a1, 446, @"IPP date value not 11 bytes.", v92);
        }
        v59 = sub_100006BAC(a1, 0xCuLL);
        sub_100006848(a1, v59, 0xBuLL);
        goto LABEL_102;
      case 50:
        if (LOWORD(__dst[0]) != 2304)
        {
          v91 = +[NSString stringWithFormat:@"ippReadIO: bad resolution value length %d.", v32];
          sub_10000692C(a1, 455, @"IPP resolution value not 9 bytes.", v91);
        }
        sub_100006848(a1, __dst, 4uLL);
        uint64_t v61 = __dst[0];
        sub_100006848(a1, __dst, 4uLL);
        uint64_t v62 = __dst[0];
        sub_100006848(a1, __dst, 1uLL);
        objc_msgSend(v18, "setResolution:", bswap64(v62 | (v61 << 32)), validate_enum<ipp_res_e,unsigned char>(LOBYTE(__dst[0])));
        goto LABEL_102;
      case 51:
        if (LOWORD(__dst[0]) != 2048)
        {
          v90 = +[NSString stringWithFormat:@"ippReadIO: bad rangeOfInteger value length %d.", v32];
          sub_10000692C(a1, 470, @"IPP rangeOfInteger value not 8 bytes.", v90);
        }
        sub_100006848(a1, __dst, 4uLL);
        unsigned int v63 = __dst[0];
        sub_100006848(a1, __dst, 4uLL);
        v108[0] = bswap32(v63);
        v108[1] = bswap32(__dst[0]);
        [v18 setRange:v108];
        goto LABEL_102;
      case 52:
        v64 = objc_opt_new();
        [v18 setCollection:v64];

        if (v31)
        {
          v89 = +[NSString stringWithFormat:@"ippReadIO: begCollection tag with value length > 0."];
          sub_10000692C(a1, 557, @"IPP begCollection value not 0 bytes.", v89);
        }
        __dst[0] = 19;
        int v107 = 0;
        v66 = [v18 collection];
        sub_1000053AC(a1, &v107, __dst, 1, v66);

        goto LABEL_102;
      case 53:
      case 54:
        if (v32 <= 3)
        {
          if (v13 == 53)
          {
            v82 = +[NSString stringWithFormat:@"ippReadIO: bad stringWithLanguage value length %d.", v32];
            sub_10000692C(a1, 485, @"IPP textWithLanguage value less than minimum 4 bytes.", v82);
          }
          v84 = +[NSString stringWithFormat:@"ippReadIO: bad stringWithLanguage value length %d.", v32];
          sub_10000692C(a1, 487, @"IPP nameWithLanguage value less than minimum 4 bytes.", v84);
        }
        v44 = sub_100006BAC(a1, v32 + 1);
        sub_100006848(a1, v44, v32);
        v45 = v44 + 2;
        size_t v46 = __rev16(*(unsigned __int16 *)v44);
        if (v46 > 0x3FF || (unint64_t v47 = (unint64_t)&v44[v32], (unint64_t)v45 + v46 > v47))
        {
          v81 = +[NSString stringWithFormat:@"ippReadIO: bad language value length %d.", v46];
          sub_10000692C(a1, 510, @"IPP language length overflows value.", v81);
        }
        if (v46 >= 0x40)
        {
          v80 = +[NSString stringWithFormat:@"ippReadIO: bad language value length %d.", v46];
          sub_10000692C(a1, 514, @"IPP language length too large.", v80);
        }
        memcpy(__dst, v45, v46);
        *((unsigned char *)__dst + v46) = 0;
        v48 = +[NSString stringWithUTF8String:__dst];
        if (!v48)
        {
          v79 = +[NSString stringWithFormat:@"ippReadIO: language value length %d.", v46];
          sub_10000692C(a1, 522, @"IPP string langauge invalid UTF8.", v79);
        }
        v49 = &v44[v46];
        unsigned int v51 = *((unsigned __int16 *)v49 + 1);
        v50 = v49 + 2;
        uint64_t v52 = __rev16(v51);
        if ((unint64_t)&v50[v52 + 2] > v47)
        {
          v78 = +[NSString stringWithFormat:@"ippReadIO: bad string value length %d.", v52];
          sub_10000692C(a1, 530, @"IPP string length overflows value.", v78);
        }
        v50[v52 + 2] = 0;
        v53 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:");
        if (!v53)
        {
          v77 = +[NSString stringWithFormat:@"ippReadIO: string value length %d.", v52];
          sub_10000692C(a1, 537, @"IPP string text invalid UTF8.", v77);
        }
        id v54 = v48;
        id v55 = v53;
        id v56 = v54;
        id v57 = v55;
        v58 = v57;
        if (v18)
        {
          objc_msgSend(v18, "setString:", v56, v57);
        }
        else
        {
        }
        goto LABEL_102;
      case 55:
        if (LOWORD(__dst[0]))
        {
          v88 = +[NSString stringWithFormat:@"ippReadIO: endCollection tag with value length > 0."];
          sub_10000692C(a1, 572, @"IPP endCollection value not 0 bytes.", v88);
        }

        goto LABEL_26;
      case 65:
      case 66:
      case 67:
      case 68:
      case 69:
      case 70:
      case 71:
      case 72:
      case 73:
        goto LABEL_62;
      case 74:
        if (!v17)
        {
          v87 = +[NSString stringWithFormat:@"ippReadIO: Member name without attribute."];
          sub_10000692C(a1, 586, @"IPP memberName with no attribute.", v87);
        }
        if (!LOWORD(__dst[0]))
        {
          v86 = +[NSString stringWithFormat:@"ippReadIO: Empty member name value."];
          sub_10000692C(a1, 591, @"IPP memberName value is empty.", v86);
        }
        v60 = sub_100006AA8(a1, v32, 1);
        [(ipp_attribute_t *)v17 setNSName:v60];

        [(ipp_attribute_t *)v17 toss_last_value];
LABEL_102:

        goto LABEL_103;
      default:
        if (v13 == 48 && (v32 & 0x8000) != 0)
        {
          v94 = +[NSString stringWithFormat:@"ippReadIO: bad octetString value length %d.", 0x8000];
          sub_10000692C(a1, 610, @"IPP octetString length too large.", v94);
        }
        id v37 = +[NSMutableData dataWithLength:v32];
        sub_100006848(a1, [v37 bytes], v32);
        [v18 setUnknown:v37];
        goto LABEL_66;
    }
    goto LABEL_104;
  }
  if (v9 == 1)
  {
LABEL_5:
    id v10 = v104;
    if ((a4 & 1) == 0)
    {
      sub_100006848(a1, __dst, 8uLL);
      objc_msgSend(v10, "setOp_or_status:", bswap32(HIWORD(__dst[0])) >> 16);
      objc_msgSend(v10, "setRequest_id:", bswap32(__dst[1]));
    }
    _DWORD *v105 = 2;
    *a3 = 0;

    goto LABEL_8;
  }
  if (!v9)
  {
    *a2 = 1;
    goto LABEL_5;
  }
LABEL_107:
}

void sub_100006434(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

void *sub_1000067F0(void *a1, uint64_t a2, uint64_t a3)
{
  *a1 = a3;
  a1[1] = a2;
  a1[2] = 0;
  a1[3] = 0;
  uint64_t v4 = objc_opt_new();
  v5 = (void *)a1[3];
  a1[3] = v4;

  return a1;
}

void sub_100006834(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_100006848(uint64_t a1, void *__b, size_t a3)
{
  memset(__b, 120, a3);
  uint64_t result = (*(uint64_t (**)(void, void *, size_t))(a1 + 8))(*(void *)a1, __b, a3);
  if (result != a3)
  {
    v7 = _PKLogCategory(PKLogCategoryDefault[0]);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)int v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Failed to read data from ipp record", v9, 2u);
    }

    id v8 = +[NSException exceptionWithName:@"IPPInternal" reason:@"failed to read enough" userInfo:0];
    objc_exception_throw(v8);
  }
  *(void *)(a1 + 16) += a3;
  return result;
}

void sub_10000692C(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  id v8 = _PKLogCategory(PKLogCategoryDefault[0]);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109634;
    int v15 = a2;
    __int16 v16 = 2114;
    id v17 = v6;
    __int16 v18 = 2114;
    id v19 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "IPPIOReader: Failure on line %d: %{public}@ - %{public}@", buf, 0x1Cu);
  }

  int v9 = +[NSNumber numberWithInt:a2, @"line"];
  v13[0] = v9;
  v13[1] = v6;
  v12[1] = @"msg";
  v12[2] = @"log";
  v13[2] = v7;
  uint64_t v10 = +[NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:3];

  id v11 = +[NSException exceptionWithName:@"IPPInternal" reason:v6 userInfo:v10];
  objc_exception_throw(v11);
}

void sub_100006A70(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_100006AA8(uint64_t a1, unint64_t a2, int a3)
{
  if (a2 >= 0x101) {
    p_b = sub_100006BAC(a1, a2);
  }
  else {
    p_b = &__b;
  }
  sub_100006848(a1, p_b, a2);
  if (a3)
  {
    internUTF8ByteString(p_b, a2);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v7 = [objc_alloc((Class)NSString) initWithBytes:p_b length:a2 encoding:4];
  }
  if (!v7) {
    sub_10000692C(a1, 91, @"Invalid UTF8 bytes", @"Invalid UTF8 bytes");
  }

  return v7;
}

char *sub_100006BAC(uint64_t a1, unint64_t a2)
{
  if ([*(id *)(a1 + 24) count])
  {
    uint64_t v4 = [*(id *)(a1 + 24) lastObject];
    v5 = v4;
    if (v4 && (unint64_t)[v4 length] + a2 < 0x400) {
      goto LABEL_10;
    }
  }
  else
  {
    v5 = 0;
  }
  if (a2 <= 0x400) {
    uint64_t v6 = 1024;
  }
  else {
    uint64_t v6 = a2;
  }
  uint64_t v7 = +[NSMutableData dataWithCapacity:v6];

  v5 = (void *)v7;
  [*(id *)(a1 + 24) addObject:v7];
LABEL_10:
  id v8 = (char *)[v5 length];
  [v5 setLength:&v8[a2]];
  id v9 = v5;
  uint64_t v10 = &v8[(void)[v9 mutableBytes]];

  return v10;
}

void sub_100006C7C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100006DBC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100006E38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)DocumentCompressor;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_100006E64(void *a1)
{
}

void sub_100006F48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

uint64_t sub_100006F6C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return 1;
}

void sub_100007010(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000070E4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000071B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000727C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

uint64_t sub_100007294(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return 1;
}

void sub_100007310(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000073CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100007554(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18)
{
  _Unwind_Resume(a1);
}

uint64_t sub_100007598(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return 1;
}

uint64_t sub_1000075C0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return 1;
}

void sub_100007800(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000078AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100007908(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  uint64_t v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)PKSecTrustWrapper;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

uint64_t copyMatchingCerts(const __CFString *a1, CFTypeRef *a2)
{
  uint64_t result = sub_100007A30();
  if (result)
  {
    v5 = (const void *)result;
    CFArrayRef Value = (const __CFArray *)CFDictionaryGetValue((CFDictionaryRef)result, a1);
    *a2 = Value;
    if (Value && CFArrayGetCount(Value))
    {
      CFRetain(*a2);
      CFRelease(v5);
      return 1;
    }
    else
    {
      *a2 = 0;
      CFRelease(v5);
      return 0;
    }
  }
  else
  {
    *a2 = 0;
  }
  return result;
}

uint64_t sub_100007A30()
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  CFPropertyListRef v9 = 0;
  CFPropertyListRef v9 = CFPreferencesCopyValue(@"certificates", @"com.apple.PrintKit.PrinterTool", kCFPreferencesCurrentUser, kCFPreferencesAnyHost);
  v0 = (const void *)v7[3];
  if (!v0)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000089AC;
    block[3] = &unk_100095200;
    block[4] = &v6;
    if (qword_1000C8A50 != -1) {
      dispatch_once(&qword_1000C8A50, block);
    }
    v0 = (const void *)v7[3];
    if (!v0) {
      goto LABEL_7;
    }
  }
  CFTypeID v1 = CFGetTypeID(v0);
  CFTypeID TypeID = CFDictionaryGetTypeID();
  uint64_t v3 = v7[3];
  if (v1 != TypeID)
  {
    CFRelease((CFTypeRef)v7[3]);
LABEL_7:
    uint64_t v3 = 0;
  }
  _Block_object_dispose(&v6, 8);
  return v3;
}

void sub_100007B58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void storeCertificate(__SecCertificate *a1, __CFString *a2)
{
  CFDictionaryRef v4 = (const __CFDictionary *)sub_100007A30();
  if (v4)
  {
    CFDictionaryRef v5 = v4;
    CFTypeID v6 = CFGetTypeID(v4);
    if (v6 == CFDictionaryGetTypeID())
    {
      CFIndex Count = CFDictionaryGetCount(v5);
      CFDictionaryRef MutableCopy = CFDictionaryCreateMutableCopy(0, Count + 1, v5);
      CFRelease(v5);
      CFArrayRef Value = (const __CFArray *)CFDictionaryGetValue(MutableCopy, a2);
      if (Value
        && (CFArrayRef v10 = Value, v11 = CFArrayGetCount(Value), (v12 = CFArrayCreateMutableCopy(0, v11 + 1, v10)) != 0))
      {
        uint64_t v13 = v12;
        CFDataRef v14 = SecCertificateCopyData(a1);
        CFArrayAppendValue(v13, v14);
        if (!v14)
        {
LABEL_11:
          CFDictionarySetValue(MutableCopy, a2, v13);
          CFRelease(v13);
          CFPreferencesSetValue(@"certificates", MutableCopy, @"com.apple.PrintKit.PrinterTool", kCFPreferencesCurrentUser, kCFPreferencesAnyHost);
          CFDictionaryRef v18 = MutableCopy;
          goto LABEL_12;
        }
        int v15 = v14;
      }
      else
      {
        values = SecCertificateCopyData(a1);
        uint64_t v13 = CFArrayCreate(0, (const void **)&values, 1, &kCFTypeArrayCallBacks);
        int v15 = values;
      }
      CFRelease(v15);
      goto LABEL_11;
    }
    CFRelease(v5);
  }
  values = SecCertificateCopyData(a1);
  CFArrayRef v16 = CFArrayCreate(0, (const void **)&values, 1, &kCFTypeArrayCallBacks);
  CFArrayRef v19 = v16;
  keys = a2;
  CFDictionaryRef v17 = CFDictionaryCreate(0, (const void **)&keys, (const void **)&v19, 1, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFPreferencesSetValue(@"certificates", v17, @"com.apple.PrintKit.PrinterTool", kCFPreferencesCurrentUser, kCFPreferencesAnyHost);
  CFRelease(v16);
  CFRelease(values);
  CFDictionaryRef v18 = v17;
LABEL_12:
  CFRelease(v18);
}

void deleteCertificate(__SecCertificate *a1, const __CFString *a2)
{
  CFDictionaryRef v4 = (const __CFDictionary *)sub_100007A30();
  if (v4)
  {
    CFDictionaryRef v5 = v4;
    CFTypeID v6 = CFGetTypeID(v4);
    if (v6 == CFDictionaryGetTypeID())
    {
      CFIndex Count = CFDictionaryGetCount(v5);
      CFDictionaryRef MutableCopy = CFDictionaryCreateMutableCopy(0, Count, v5);
      CFRelease(v5);
      CFArrayRef Value = (const __CFArray *)CFDictionaryGetValue(MutableCopy, a2);
      if (Value)
      {
        CFArrayRef v10 = Value;
        CFTypeID v11 = CFGetTypeID(Value);
        if (v11 == CFArrayGetTypeID())
        {
          if (a1)
          {
            CFIndex v12 = CFArrayGetCount(v10);
            CFArrayRef v13 = CFArrayCreateMutableCopy(0, v12, v10);
            if (CFArrayGetCount(v13) >= 1)
            {
              CFIndex v14 = 0;
              do
              {
                CFDataRef ValueAtIndex = (const __CFData *)CFArrayGetValueAtIndex(v13, v14);
                SecCertificateRef v16 = SecCertificateCreateWithData(0, ValueAtIndex);
                if (CFEqual(v16, a1)) {
                  CFArrayRemoveValueAtIndex(v13, v14);
                }
                if (v16) {
                  CFRelease(v16);
                }
                ++v14;
              }
              while (v14 < CFArrayGetCount(v13));
            }
            CFDictionarySetValue(MutableCopy, a2, v13);
            CFRelease(v13);
          }
          else
          {
            CFDictionaryRemoveValue(MutableCopy, a2);
          }
          CFPreferencesSetValue(@"certificates", MutableCopy, @"com.apple.PrintKit.PrinterTool", kCFPreferencesCurrentUser, kCFPreferencesAnyHost);
        }
      }
      CFDictionaryRef v17 = MutableCopy;
    }
    else
    {
      CFDictionaryRef v17 = v5;
    }
    CFRelease(v17);
  }
}

BOOL PKUserAllowsCertTrust(PKSecTrustWrapper *a1, NSString *a2, NSString *a3)
{
  CFDictionaryRef v5 = a1;
  CFTypeID v6 = a2;
  uint64_t v7 = a3;
  CFPropertyListRef v9 = v5;
  CFArrayRef v10 = v6;
  CFTypeID v11 = v7;
  CFIndex v12 = v11;
  if (v9 && v11)
  {
    CertificateAtIndex = SecTrustGetCertificateAtIndex([(PKSecTrustWrapper *)v9 trustRef], 0);
    SecTrustResultType result = kSecTrustResultInvalid;
    OSStatus v14 = SecTrustEvaluate([(PKSecTrustWrapper *)v9 trustRef], &result);
    if (v14)
    {
      int v15 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:v14 userInfo:0];
      SecCertificateRef v16 = _PKLogCategory(PKLogCategoryNetwork[0]);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 138543362;
        *(void *)((char *)&buf + 4) = v15;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "PrintKit trust evaluation failed: %{public}@", (uint8_t *)&buf, 0xCu);
      }

      CFStringRef v17 = PKLocalizedString(@"The security of the connection could not be verified.", "Print job failed due to security failure.");
      PKDisplayNotice(v12, v17, @"allowCertTrust(2)");
      CFRelease(v17);

      goto LABEL_8;
    }
    if (result == kSecTrustResultUnspecified || result == kSecTrustResultProceed)
    {
      storeCertificate(CertificateAtIndex, v12);
      BOOL v19 = 1;
      goto LABEL_9;
    }
    if (qword_1000C8A58 != -1) {
      dispatch_once(&qword_1000C8A58, &stru_100095240);
    }
    if (byte_1000C8A60)
    {
      v21 = _PKLogCategory(PKLogCategoryNetwork[0]);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        LOWORD(buf) = 0;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "PrintKit trust evaluation failed due to MobileDeviceManagement AirPrintTrustedTLSRequirementForced setting enabled and connection is not a trusted chain.", (uint8_t *)&buf, 2u);
      }

      CFStringRef v22 = PKLocalizedString(@"The security of the connection could not be verified.", "Print job failed due to security failure.");
      PKDisplayNotice(v12, v22, @"allowCertTrust(3)");
      CFRelease(v22);
      goto LABEL_8;
    }
    objc_sync_enter(@"PKCertUISynchronization");
    CFArrayRef theArray = 0;
    int v23 = copyMatchingCerts(v12, (CFTypeRef *)&theArray);
    CFArrayRef v24 = theArray;
    if (theArray) {
      int v25 = v23;
    }
    else {
      int v25 = 0;
    }
    if (v25 == 1 && CFArrayGetCount(theArray) >= 1)
    {
      for (CFIndex i = 0; CFArrayGetCount(v24) > i; ++i)
      {
        CFDataRef ValueAtIndex = (const __CFData *)CFArrayGetValueAtIndex(v24, i);
        SecCertificateRef v28 = SecCertificateCreateWithData(0, ValueAtIndex);
        if (CFEqual(v28, CertificateAtIndex))
        {
          CFRelease(v24);
          if (v28) {
            CFRelease(v28);
          }
          goto LABEL_32;
        }
        if (v28) {
          CFRelease(v28);
        }
      }
      if (CFArrayGetCount(v24) == 1)
      {
        CFDataRef v29 = (const __CFData *)CFArrayGetValueAtIndex(v24, 0);
        id v30 = SecCertificateCreateWithData(0, v29);
        SecCertificateNotValidAfter();
        double v32 = v31;
        SecCertificateNotValidAfter();
        double v34 = v33;
        if (CFAbsoluteTimeGetCurrent() > v32 && CFAbsoluteTimeGetCurrent() < v34)
        {
          deleteCertificate(v30, v12);
          storeCertificate(CertificateAtIndex, v12);
          if (v30) {
            CFRelease(v30);
          }
          goto LABEL_31;
        }
        if (v30) {
          CFRelease(v30);
        }
      }
      CFRelease(v24);
      unsigned int v41 = PKLocalizedString(@"The printer \"%@\" appears to be a different printer than the previously used printer with the same name or the connection may not be trustworthy. If this is expected, tap \"Continue\".", "Printing certificate changed alert message");
      v35 = +[NSString stringWithValidatedFormat:validFormatSpecifiers:error:](NSString, "stringWithValidatedFormat:validFormatSpecifiers:error:", v12);
      v45[0] = kCFUserNotificationAlertHeaderKey;
      v36 = PKLocalizedString(@"Security Warning", "Printing certificate changed security alert title");
      *(void *)&long long buf = v36;
      *((void *)&buf + 1) = v35;
      v45[1] = kCFUserNotificationAlertMessageKey;
      v45[2] = kCFUserNotificationDefaultButtonTitleKey;
      id v37 = PKLocalizedString(@"Cancel", "Cancel printing");
      unint64_t v47 = v37;
      v45[3] = kCFUserNotificationAlternateButtonTitleKey;
      id v38 = PKLocalizedString(@"Continue", "Continue printing");
      v45[4] = SBUserNotificationDismissOnLock;
      v45[5] = SBUserNotificationDontDismissOnUnlock;
      v45[6] = SBUserNotificationAllowMenuButtonDismissal;
      v48 = v38;
      CFBooleanRef v49 = kCFBooleanFalse;
      CFBooleanRef v50 = kCFBooleanTrue;
      CFBooleanRef v51 = kCFBooleanFalse;
      CFDictionaryRef v39 = +[NSDictionary dictionaryWithObjects:&buf forKeys:v45 count:7];

      v40 = CFUserNotificationCreate(kCFAllocatorDefault, 0.0, 2uLL, 0, v39);
      CFOptionFlags responseFlags = 0;
      CFUserNotificationReceiveResponse(v40, 0.0, &responseFlags);
      CFRelease(v40);
      BOOL v19 = (responseFlags & 3) != 0;
      if ((responseFlags & 3) != 0) {
        storeCertificate(CertificateAtIndex, v12);
      }

      goto LABEL_33;
    }
    storeCertificate(CertificateAtIndex, v12);
    if (!v24)
    {
LABEL_32:
      BOOL v19 = 1;
LABEL_33:
      objc_sync_exit(@"PKCertUISynchronization");
      goto LABEL_9;
    }
LABEL_31:
    CFRelease(v24);
    goto LABEL_32;
  }
  CFStringRef v18 = PKLocalizedString(@"The security of the connection could not be verified.", "Print job failed due to security failure.");
  PKDisplayNotice(@"Unknown Printer Name", v18, @"allowCertTrust(1)");
  CFRelease(v18);
LABEL_8:
  BOOL v19 = 0;
LABEL_9:

  return v19;
}

void sub_100008558(_Unwind_Exception *a1)
{
  objc_sync_exit(@"PKCertUISynchronization");

  _Unwind_Resume(a1);
}

BOOL PKAllowNonTLSConnection(NSString *a1)
{
  CFTypeID v1 = a1;
  CFStringRef v3 = v1;
  CFDictionaryRef v4 = (__CFString *)v3;
  if (!v3) {
    goto LABEL_12;
  }
  CFArrayRef theArray = 0;
  int v5 = copyMatchingCerts(v3, (CFTypeRef *)&theArray);
  CFArrayRef v6 = theArray;
  if (theArray) {
    int v7 = v5;
  }
  else {
    int v7 = 0;
  }
  if (v7 != 1)
  {
    if (!theArray)
    {
LABEL_12:
      BOOL v15 = 1;
      goto LABEL_13;
    }
LABEL_11:
    CFRelease(v6);
    goto LABEL_12;
  }
  if (CFArrayGetCount(theArray) < 1) {
    goto LABEL_11;
  }
  CFRelease(v6);
  uint64_t v8 = PKLocalizedString(@"The printer \"%@\" appears to be a different printer than the previously used printer with the same name or the connection may not be trustworthy. If this is expected, tap \"Continue\".", "Printing certificate changed alert message");
  CFPropertyListRef v9 = +[NSString stringWithValidatedFormat:v8, @"%@", 0, v4 validFormatSpecifiers error];
  v19[0] = kCFUserNotificationAlertHeaderKey;
  CFArrayRef v10 = PKLocalizedString(@"Security Warning", "Printing certificate changed security alert title");
  v20[0] = v10;
  v20[1] = v9;
  v19[1] = kCFUserNotificationAlertMessageKey;
  v19[2] = kCFUserNotificationDefaultButtonTitleKey;
  CFTypeID v11 = PKLocalizedString(@"Cancel", "Cancel printing");
  v20[2] = v11;
  v19[3] = kCFUserNotificationAlternateButtonTitleKey;
  CFIndex v12 = PKLocalizedString(@"Continue", "Continue printing");
  v19[4] = SBUserNotificationDismissOnLock;
  v19[5] = SBUserNotificationDontDismissOnUnlock;
  v19[6] = SBUserNotificationAllowMenuButtonDismissal;
  v20[3] = v12;
  v20[4] = kCFBooleanFalse;
  v20[5] = kCFBooleanTrue;
  v20[6] = kCFBooleanFalse;
  CFDictionaryRef v13 = +[NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:7];

  OSStatus v14 = CFUserNotificationCreate(kCFAllocatorDefault, 0.0, 2uLL, 0, v13);
  CFOptionFlags responseFlags = 0;
  CFUserNotificationReceiveResponse(v14, 0.0, &responseFlags);
  CFRelease(v14);
  BOOL v15 = (responseFlags & 3) != 0;
  if ((responseFlags & 3) != 0) {
    deleteCertificate(0, v4);
  }

LABEL_13:

  return v15;
}

void sub_1000088CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id PKStoreCredentialsInKeychainAllowed(void)
{
  CFTypeID v1 = [(objc_class *)off_1000C58D0() sharedConnection];
  id v2 = [v1 isAirPrintCredentialsStorageAllowed];

  return v2;
}

void sub_10000899C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000089AC(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = CFPreferencesCopyValue(@"certificates", @"com.apple.printd", kCFPreferencesCurrentUser, kCFPreferencesAnyHost);
  id v2 = *(const void **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  if (v2)
  {
    CFPreferencesSetValue(@"certificates", v2, @"com.apple.PrintKit.PrinterTool", kCFPreferencesCurrentUser, kCFPreferencesAnyHost);
  }
}

void sub_100008A5C(id a1)
{
  id v1 = [(objc_class *)off_1000C58D0() sharedConnection];
  byte_1000C8A60 = [v1 isAirPrintTrustedTLSRequirementEnforced];
}

void sub_100008AB8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

Class sub_100008ACC()
{
  if (qword_1000C8A78 != -1) {
    dispatch_once(&qword_1000C8A78, &stru_100095260);
  }
  Class result = objc_getClass("MCProfileConnection");
  qword_1000C8A68 = (uint64_t)result;
  off_1000C58D0 = (uint64_t (*)())sub_100008B30;
  return result;
}

id sub_100008B30()
{
  return (id)qword_1000C8A68;
}

void sub_100008B3C(id a1)
{
  qword_1000C8A70 = (uint64_t)dlopen("/System/Library/PrivateFrameworks/ManagedConfiguration.framework/ManagedConfiguration", 2);
  if (!qword_1000C8A70) {
    NSLog(@"### Failed to Soft Linked: /System/Library/PrivateFrameworks/ManagedConfiguration.framework/ManagedConfiguration");
  }
}

void sub_100008C10(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100008D18(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100008E20(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100008F3C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_100008F58(void *a1, void *a2, double a3)
{
  uint64_t v11 = 0;
  CFIndex v12 = &v11;
  uint64_t v13 = 0x3032000000;
  OSStatus v14 = sub_10000ACE4;
  BOOL v15 = sub_10000ACF4;
  id v16 = 0;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10000F190;
  v8[3] = &unk_100095688;
  id v9 = a2;
  CFArrayRef v10 = &v11;
  id v5 = v9;
  withDebuggableSemaphore(a1, v8, a3);
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);

  return v6;
}

void sub_100009070(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20)
{
  _Block_object_dispose(&a15, 8);
  _Unwind_Resume(a1);
}

id sub_10000909C(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) withPrinterSessionURL:a2];
}

void sub_10000915C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_100009180(uint64_t a1, void *a2)
{
  id v6 = a2;
  if (v6)
  {
    CFStringRef v3 = [IPPURL alloc];
    CFDictionaryRef v4 = [*(id *)(a1 + 32) session];
    id v5 = [(IPPURL *)v3 initWithSession:v4 url:v6];

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void sub_100009238(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1000093F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000094CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000095C8(id a1)
{
  id v1 = [[IPPSession alloc] initWithBundleIdentifier:0 clientID:0];
  id v2 = (void *)qword_1000C8A80;
  qword_1000C8A80 = (uint64_t)v1;
}

void sub_10000998C(_Unwind_Exception *a1)
{
  int v7 = v6;

  _Unwind_Resume(a1);
}

void sub_100009A74(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)IPPSession;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_100009BBC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100009C50(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100009CBC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100009D28(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100009D94(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100009EF8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100009F0C(id a1, NSURLSessionConfiguration *a2)
{
  id v2 = a2;
  [(NSURLSessionConfiguration *)v2 timeoutIntervalForResource];
  [(NSURLSessionConfiguration *)v2 setTimeoutIntervalForRequest:"setTimeoutIntervalForRequest:"];
}

void sub_100009F58(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10000A104(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000A1C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)IPPSessionTransaction;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_10000A260(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10000A300(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000A5D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

id sub_10000A670(void *a1)
{
  id v1 = a1;
  uint64_t v9 = 0;
  CFArrayRef v10 = &v9;
  uint64_t v11 = 0x3032000000;
  CFIndex v12 = sub_10000E98C;
  uint64_t v13 = sub_10000E9B8;
  id v14 = 0;
  id v2 = [v1 URL];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10000EC00;
  v6[3] = &unk_100095608;
  id v3 = v1;
  id v7 = v3;
  uint64_t v8 = &v9;
  sub_10000E9C0(v2, v6);

  id v4 = objc_retainBlock((id)v10[5]);
  _Block_object_dispose(&v9, 8);

  return v4;
}

void sub_10000A790(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20)
{
  _Block_object_dispose(&a15, 8);
  _Unwind_Resume(a1);
}

void sub_10000A9B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

BOOL sub_10000A9D0(void *a1, unint64_t a2, uint64_t a3)
{
  id v5 = a1;
  unint64_t v6 = a2 + a3;
  do
  {
    unint64_t v7 = a2;
    if (a2 >= v6) {
      break;
    }
    if ((unint64_t)[v5 streamStatus] >= 5)
    {
      uint64_t v9 = _PKLogCategory(PKLogCategoryNetwork[0]);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        int v11 = 136315394;
        CFIndex v12 = "writeLiteralToStreamSync";
        __int16 v13 = 2114;
        id v14 = v5;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%s: stream %{public}@ can't be written to", (uint8_t *)&v11, 0x16u);
      }

      break;
    }
    uint64_t v8 = (uint64_t)[v5 write:a2 maxLength:v6 - a2];
    a2 += v8;
  }
  while (v8 > 0);

  return v7 >= v6;
}

void sub_10000AAF8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL sub_10000AB18(uint64_t a1, unint64_t a2, uint64_t a3)
{
  return sub_10000A9D0(*(void **)(a1 + 32), a2, a3);
}

void sub_10000ACB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id a24)
{
  _Block_object_dispose(&a19, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10000ACE4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10000ACF4(uint64_t a1)
{
}

intptr_t sub_10000ACFC(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) writeDocumentData0:*(void *)(a1 + 56) length:*(void *)(a1 + 64)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  id v5 = *(NSObject **)(a1 + 40);

  return dispatch_semaphore_signal(v5);
}

void sub_10000AE24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

BOOL sub_10000AE3C(uint64_t a1, unint64_t a2, uint64_t a3)
{
  return sub_10000A9D0(*(void **)(a1 + 32), a2, a3);
}

id sub_10000AEB8(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishedWriting0];
}

void sub_10000AF40(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000B330(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000B388(uint64_t a1, void *a2)
{
  uint64_t v3 = a2;
  CFErrorRef error = 0;
  BOOL v4 = SecTrustEvaluateWithError((SecTrustRef)[*(id *)(a1 + 32) trustRef], &error);
  if (error)
  {
    CFRelease(error);
    CFErrorRef error = 0;
  }
  if (v4) {
    goto LABEL_9;
  }
  uint64_t v5 = *(void *)(a1 + 48);
  if (!v5)
  {
    uint64_t v8 = _PKLogCategory(PKLogCategoryDefault[0]);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(a1 + 40);
      *(_DWORD *)long long buf = 138543362;
      uint64_t v15 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "PrintKit: allowing untrusted printer certificate for unafilliated request (%{public}@)", buf, 0xCu);
    }

LABEL_9:
    unint64_t v7 = +[NSURLCredential credentialForTrust:](NSURLCredential, "credentialForTrust:", [*(id *)(a1 + 32) trustRef]);
    v3[2](v3, v7);
    goto LABEL_10;
  }
  uint64_t v6 = *(void *)(a1 + 32);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10000B584;
  v10[3] = &unk_100095388;
  CFIndex v12 = v3;
  id v11 = *(id *)(a1 + 32);
  (*(void (**)(uint64_t, uint64_t, void *))(v5 + 16))(v5, v6, v10);

  unint64_t v7 = v12;
LABEL_10:
}

void sub_10000B544(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000B584(uint64_t a1, char a2)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (a2)
  {
    +[NSURLCredential credentialForTrust:](NSURLCredential, "credentialForTrust:", [*(id *)(a1 + 32) trustRef]);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t))(v2 + 16))(v2);
  }
  else
  {
    uint64_t v3 = *(void (**)(uint64_t, void))(v2 + 16);
    uint64_t v4 = *(void *)(a1 + 40);
    v3(v4, 0);
  }
}

void sub_10000B630(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10000B644(uint64_t a1, void *a2)
{
  id v6 = a2;
  uint64_t v3 = *(void *)(a1 + 48);
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = [*(id *)(a1 + 40) currentRequest];
  (*(void (**)(uint64_t, uint64_t, void *, id))(v3 + 16))(v3, v4, v5, v6);
}

void sub_10000B6C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10000B6E4(uint64_t a1)
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10000B7B4;
  v3[3] = &unk_100095400;
  uint64_t v2 = *(void *)(a1 + 32);
  id v4 = *(id *)(a1 + 40);
  objc_copyWeak(&v5, (id *)(a1 + 48));
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v3);
  objc_destroyWeak(&v5);
}

void sub_10000B798(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  objc_destroyWeak(v13);

  _Unwind_Resume(a1);
}

void sub_10000B7B4(uint64_t a1, void *a2)
{
  id v8 = a2;
  if (v8)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    if (WeakRetained)
    {
      id v4 = WeakRetained;
      unsigned int v5 = [v8 hasPassword];

      if (v5)
      {
        id v6 = objc_loadWeakRetained((id *)(a1 + 40));
        unint64_t v7 = [v8 user];
        [v6 updateInitialPayloadUserName:v7];
      }
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10000B890(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10000B948(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_10000F138((uint64_t)va);

  _Unwind_Resume(a1);
}

void sub_10000B968(uint64_t a1, void *a2)
{
  uint64_t v3 = a2;
  id v4 = *(void **)(a1 + 8);
  if (v4)
  {
    id v5 = v4;
    Printd_Parameters::_del_RequestingUserName(&v5);
    Printd_Parameters::_set_RequestingUserName(&v5, v3);
  }
}

void sub_10000B9C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_10000BBC8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000BE10(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  _Unwind_Resume(a1);
}

void sub_10000BE4C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_send1_sendClearToSendBody:", *(unsigned __int8 *)(a1 + 40));
}

void sub_10000BE9C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10000BFD0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10000C240(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000C338(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10000C4F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000C740(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000C9B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_10000CA0C(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(void *)(v6 + 88);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10000CAE0;
  v10[3] = &unk_100095478;
  void v10[4] = v6;
  id v11 = v5;
  id v8 = *(void (**)(uint64_t, uint64_t, void *))(v7 + 16);
  id v9 = v5;
  v8(v7, a2, v10);
}

void sub_10000CAC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

uint64_t sub_10000CAE0(uint64_t a1, char a2)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 40) = a2 ^ 1;
  uint64_t v3 = _PKLogCategory(PKLogCategoryNetwork[0]);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = *(unsigned __int8 *)(*(void *)(a1 + 32) + 40);
    v6[0] = 67109120;
    v6[1] = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "auth trust completion - canceled? %d", (uint8_t *)v6, 8u);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_10000CBC4(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v7 = a4;
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = *(void *)(v8 + 96);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10000CCA0;
  void v12[3] = &unk_1000954C8;
  v12[4] = v8;
  id v13 = v7;
  CFArrayRef v10 = *(void (**)(uint64_t, uint64_t, uint64_t, void *))(v9 + 16);
  id v11 = v7;
  v10(v9, a2, a3, v12);
}

void sub_10000CC88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_10000CCA0(uint64_t a1, void *a2)
{
  id v3 = a2;
  *(unsigned char *)(*(void *)(a1 + 32) + 40) = v3 == 0;
  int v4 = _PKLogCategory(PKLogCategoryNetwork[0]);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = *(unsigned __int8 *)(*(void *)(a1 + 32) + 40);
    v6[0] = 67109120;
    v6[1] = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "auth cred completion - canceled? %d", (uint8_t *)v6, 8u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_10000CD90(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000CDAC(uint64_t a1, void *a2)
{
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = objc_retainBlock(v6);
    int v5 = (void *)WeakRetained[9];
    WeakRetained[9] = v4;
  }
}

void sub_10000CF08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_10000CF34(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  int v5 = [*(id *)(a1 + 32) createTransactionResult:a2 response:a3 data:a4];
  if (v5)
  {
    id v6 = v5;
    id v7 = *(void **)(a1 + 32);
    uint64_t v8 = [(http_ipp_response_t *)v5 ippResponse];
    [v7 debugLogIPP:"RECV_IPP" ipp:v8];
  }
  else
  {
    uint64_t v9 = _PKLogCategory(PKLogCategoryDefault[0]);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)CFArrayRef v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Network timeout waiting to send request", v10, 2u);
    }

    id v6 = [[http_ipp_response_t alloc] initWithTransportStatus:5];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_10000D038(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000D160(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_10000D17C(void *a1, void *a2, double a3)
{
  uint64_t v11 = 0;
  CFIndex v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = sub_10000ACE4;
  uint64_t v15 = sub_10000ACF4;
  id v16 = 0;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10000F2B0;
  v8[3] = &unk_100095688;
  id v9 = a2;
  CFArrayRef v10 = &v11;
  id v5 = v9;
  withDebuggableSemaphore(a1, v8, a3);
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);

  return v6;
}

void sub_10000D294(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20)
{
  _Block_object_dispose(&a15, 8);
  _Unwind_Resume(a1);
}

id sub_10000D2C0(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) sendSingleIPPRequest:*(void *)(a1 + 40) completionHandler:a2];
}

void sub_10000D474(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

__CFString *toString(uint64_t a1)
{
  if (a1 >= 7)
  {
    id v1 = +[NSString stringWithFormat:@"Unknown http status %d", a1];
  }
  else
  {
    id v1 = off_1000956D0[(int)a1];
  }

  return v1;
}

void sub_10000D974(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000DAA4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10000DCF4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  _Unwind_Resume(a1);
}

intptr_t sub_10000DD50(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

intptr_t sub_10000DD58(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = (id *)(a1 + 40);
  id v8 = a4;
  id v9 = a3;
  id v10 = a2;
  id WeakRetained = objc_loadWeakRetained(v7);
  [WeakRetained _streamedTaskCompleted:v10 response:v9 data:v8];

  CFIndex v12 = *(NSObject **)(a1 + 32);

  return dispatch_semaphore_signal(v12);
}

void sub_10000DDEC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000DF18(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000E0C4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000E190(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10000E258(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000E4C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000E628(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000E6D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10000E7D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void platformHTTP_GetDataForURL(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  id v8 = [[platform_http_get alloc] initWithSession:v5 url:v6 callback:v7];
  id v9 = _PKLogCategory(PKLogCategoryNetwork[0]);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138543362;
    uint64_t v11 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Starting fetch %{public}@", (uint8_t *)&v10, 0xCu);
  }

  [(platform_http_get *)v8 start];
}

void sub_10000E95C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_10000E98C(uint64_t a1, uint64_t a2)
{
  id result = objc_retainBlock(*(id *)(a2 + 40));
  *(void *)(a1 + 40) = result;
  return result;
}

void sub_10000E9B8(uint64_t a1)
{
}

void sub_10000E9C0(void *a1, void *a2)
{
  id v16 = a1;
  id v3 = a2;
  if (v16)
  {
    id v4 = +[NSURLComponents componentsWithURL:v16 resolvingAgainstBaseURL:1];
    id v5 = v4;
    if (v4)
    {
      id v6 = [v4 host];
      id v7 = v6;
      if (v6
        && [v6 hasPrefix:@"["]
        && [v7 hasSuffix:@"]"])
      {
        id v8 = objc_msgSend(v7, "substringWithRange:", 1, (char *)objc_msgSend(v7, "length") - 2);
        id v9 = [v5 port];
        if (!v9)
        {
          int v10 = [v5 scheme];
          id v9 = PKDefaultPortForScheme(v10);
        }
        if (v8 && v9)
        {
          id v11 = v8;
          CFIndex v12 = (const char *)[v11 UTF8String];
          id v13 = [v9 stringValue];
          host = nw_endpoint_create_host(v12, (const char *)[v13 UTF8String]);

          if (host)
          {
            if (nw_endpoint_get_type(host) == nw_endpoint_type_address)
            {
              address = nw_endpoint_get_address(host);
              if (address->sa_family == 30) {
                v3[2](v3, v5, v11, v9, address);
              }
            }
          }
        }
      }
    }
  }
}

void sub_10000EB84(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10000EC00(uint64_t a1, void *a2, void *a3, void *a4, uint64_t a5)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  unsigned int v12 = *(_DWORD *)(a5 + 24);
  if (v12)
  {
    id v13 = if_indextoname(v12, v27);
    if (v13)
    {
      id v14 = _PKLogCategory(PKLogCategoryNetwork[0]);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138543618;
        id v24 = v10;
        __int16 v25 = 2080;
        v26 = v13;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Forcing IPV6 literal bound for %{public}@ interface to %s", buf, 0x16u);
      }

      uint64_t v15 = +[NSString stringWithUTF8String:v13];
      [*(id *)(a1 + 32) setBoundInterfaceIdentifier:v15];
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_10000EE0C;
      v19[3] = &unk_1000955E0;
      id v20 = v10;
      id v21 = v11;
      id v22 = v9;
      id v16 = objc_retainBlock(v19);
      uint64_t v17 = *(void *)(*(void *)(a1 + 40) + 8);
      CFStringRef v18 = *(void **)(v17 + 40);
      *(void *)(v17 + 40) = v16;
    }
  }
}

void sub_10000EDD8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_10000EE0C(id *a1, void *a2)
{
  id v3 = a2;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = sub_10000ACE4;
  id v16 = sub_10000ACF4;
  id v17 = v3;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000EF88;
  v7[3] = &unk_1000955B8;
  id v8 = a1[4];
  id v9 = a1[5];
  id v10 = a1[6];
  id v11 = &v12;
  id v4 = v3;
  sub_10000E9C0(v4, v7);
  id v5 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v5;
}

void sub_10000EF4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14, void *a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id a22)
{
  _Block_object_dispose(&a17, 8);
  _Unwind_Resume(a1);
}

void sub_10000EF88(uint64_t a1, void *a2, void *a3, void *a4, uint64_t a5)
{
  id v15 = a2;
  id v9 = a3;
  id v10 = a4;
  if ([*(id *)(a1 + 32) hasPrefix:v9]
    && [*(id *)(a1 + 40) isEqualToNumber:v10]
    && !*(_DWORD *)(a5 + 24))
  {
    id v11 = [*(id *)(a1 + 48) host];
    [v15 setHost:v11];

    uint64_t v12 = [v15 URL];
    uint64_t v13 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v14 = *(void **)(v13 + 40);
    *(void *)(v13 + 40) = v12;
  }
}

void sub_10000F060(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void *sub_10000F088(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  a1[1] = v5;
  a1[2] = 0;
  *a1 = off_100095638;
  id v7 = v5;
  id v8 = (void *)a1[2];
  a1[2] = v6;

  return a1;
}

void sub_10000F100(uint64_t a1)
{
  sub_10000F138(a1);

  operator delete();
}

uint64_t sub_10000F138(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 8);
  *(void *)a1 = off_100095638;
  *(void *)(a1 + 8) = 0;

  return a1;
}

void sub_10000F190(uint64_t a1, void *a2)
{
  id v3 = a2;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10000F250;
  v8[3] = &unk_100095660;
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v9 = v3;
  uint64_t v10 = v4;
  id v6 = *(void (**)(uint64_t, void *))(v5 + 16);
  id v7 = v3;
  v6(v5, v8);
}

void sub_10000F238(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_10000F250(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_10000F2B0(uint64_t a1, void *a2)
{
  id v3 = a2;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10000F370;
  v8[3] = &unk_1000956B0;
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v9 = v3;
  uint64_t v10 = v4;
  id v6 = *(void (**)(uint64_t, void *))(v5 + 16);
  id v7 = v3;
  v6(v5, v8);
}

void sub_10000F358(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_10000F370(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

BOOL isColorPage(CGPDFPage *a1)
{
  id v3 = objc_alloc_init(ColorInfo);
  id v4 = CGPDFContentStreamCreateWithPage(a1);
  uint64_t v5 = v4;
  if (v4)
  {
    sub_10000F98C(v4, v3);
    CGPDFContentStreamRelease(v5);
  }
  else
  {
    [(ColorInfo *)v3 setColorReason:@"Could not create PDF page stream"];
  }
  id v6 = [(ColorInfo *)v3 colorReason];

  return v6 != 0;
}

void sub_10000F474(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000F518(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000F598(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)ColorInfo;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_10000F6D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10000F7D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10000F8F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)GState;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_10000F98C(CGPDFContentStream *a1, void *a2)
{
  id info = a2;
  id v3 = CGPDFOperatorTableCreate();
  id v4 = v3;
  if (v3)
  {
    CGPDFOperatorTableSetCallback(v3, "cs", (CGPDFOperatorCallback)sub_10000FC44);
    CGPDFOperatorTableSetCallback(v4, "k", (CGPDFOperatorCallback)sub_10000FD08);
    CGPDFOperatorTableSetCallback(v4, "rg", (CGPDFOperatorCallback)sub_10000FD90);
    CGPDFOperatorTableSetCallback(v4, "sc", (CGPDFOperatorCallback)sub_10000FE18);
    CGPDFOperatorTableSetCallback(v4, "scn", (CGPDFOperatorCallback)sub_10000FEB8);
    CGPDFOperatorTableSetCallback(v4, "CS", (CGPDFOperatorCallback)sub_10000FF58);
    CGPDFOperatorTableSetCallback(v4, "K", (CGPDFOperatorCallback)sub_10001001C);
    CGPDFOperatorTableSetCallback(v4, "RG", (CGPDFOperatorCallback)sub_1000100A4);
    CGPDFOperatorTableSetCallback(v4, "SC", (CGPDFOperatorCallback)sub_10001012C);
    CGPDFOperatorTableSetCallback(v4, "SCN", (CGPDFOperatorCallback)sub_1000101CC);
    CGPDFOperatorTableSetCallback(v4, "sh", (CGPDFOperatorCallback)sub_10001026C);
    CGPDFOperatorTableSetCallback(v4, "Do", (CGPDFOperatorCallback)sub_100010388);
    CGPDFOperatorTableSetCallback(v4, "BI", (CGPDFOperatorCallback)sub_1000104E8);
    CGPDFOperatorTableSetCallback(v4, "q", (CGPDFOperatorCallback)sub_1000104F8);
    CGPDFOperatorTableSetCallback(v4, "Q", (CGPDFOperatorCallback)sub_100010500);
    uint64_t v5 = CGPDFScannerCreate(a1, v4, info);
    id v6 = v5;
    if (v5)
    {
      if (!CGPDFScannerScan(v5)) {
        [info setColorReason:@"PDF scanner failed"];
      }
      CGPDFScannerRelease(v6);
    }
    else
    {
      [info setColorReason:@"Unable to create scanner"];
    }
    CGPDFOperatorTableRelease(v4);
  }
  else
  {
    [info setColorReason:@"Unable to create scan table"];
  }
}

void sub_10000FC28(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10000FC44(CGPDFScanner *a1, void *a2)
{
  id v3 = a2;
  value = 0;
  BOOL v4 = CGPDFScannerPopName(a1, (const char **)&value);
  if (value) {
    BOOL v5 = v4;
  }
  else {
    BOOL v5 = 0;
  }
  if (v5)
  {
    id v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:");
    [v3 setNonStrokeColorspace:v6];
  }
  else
  {
    [v3 setNonStrokeColorspace:@"unknown"];
    [v3 setColorReason:@"Didn't understand a null non-stroke colorspace"];
  }
}

void sub_10000FCEC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000FD08(BOOL a1, void *a2)
{
  id v3 = a2;
  [v3 setNonStrokeColorspace:@"DeviceCMKY"];
  if (sub_100010508(a1, "DeviceCMKY")) {
    [v3 setColorReason:@"color CMYK non-stroke"];
  }
}

void sub_10000FD7C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10000FD90(BOOL a1, void *a2)
{
  id v3 = a2;
  [v3 setNonStrokeColorspace:@"DeviceRGB"];
  if (sub_100010508(a1, "DeviceRGB")) {
    [v3 setColorReason:@"color RGB non-stroke"];
  }
}

void sub_10000FE04(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10000FE18(uint64_t a1, void *a2)
{
  id v4 = a2;
  id v3 = [v4 nonStrokeColorspace];
  LODWORD(a1) = sub_100010508(a1, (const char *)[v3 UTF8String]);

  if (a1) {
    [v4 setColorReason:@"color non-stroke"];
  }
}

void sub_10000FE98(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10000FEB8(uint64_t a1, void *a2)
{
  id v4 = a2;
  id v3 = [v4 nonStrokeColorspace];
  LODWORD(a1) = sub_100010508(a1, (const char *)[v3 UTF8String]);

  if (a1) {
    [v4 setColorReason:@"scn color non-stroke"];
  }
}

void sub_10000FF38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10000FF58(CGPDFScanner *a1, void *a2)
{
  id v3 = a2;
  value = 0;
  BOOL v4 = CGPDFScannerPopName(a1, (const char **)&value);
  if (value) {
    BOOL v5 = v4;
  }
  else {
    BOOL v5 = 0;
  }
  if (v5)
  {
    id v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:");
    [v3 setStrokeColorspace:v6];
  }
  else
  {
    [v3 setStrokeColorspace:@"unknown"];
    [v3 setColorReason:@"Didn't understand a null stroke colorspace"];
  }
}

void sub_100010000(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001001C(BOOL a1, void *a2)
{
  id v3 = a2;
  [v3 setStrokeColorspace:@"DeviceCMKY"];
  if (sub_100010508(a1, "DeviceCMKY")) {
    [v3 setColorReason:@"color CMYK stroke"];
  }
}

void sub_100010090(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1000100A4(BOOL a1, void *a2)
{
  id v3 = a2;
  [v3 setStrokeColorspace:@"DeviceRGB"];
  if (sub_100010508(a1, "DeviceRGB")) {
    [v3 setColorReason:@"color RGB stroke"];
  }
}

void sub_100010118(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10001012C(uint64_t a1, void *a2)
{
  id v4 = a2;
  id v3 = [v4 strokeColorspace];
  LODWORD(a1) = sub_100010508(a1, (const char *)[v3 UTF8String]);

  if (a1) {
    [v4 setColorReason:@"color stroke"];
  }
}

void sub_1000101AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1000101CC(uint64_t a1, void *a2)
{
  id v4 = a2;
  id v3 = [v4 strokeColorspace];
  LODWORD(a1) = sub_100010508(a1, (const char *)[v3 UTF8String]);

  if (a1) {
    [v4 setColorReason:@"SCN color stroke"];
  }
}

void sub_10001024C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10001026C(CGPDFScanner *a1, void *a2)
{
  id v3 = a2;
  value = 0;
  BOOL v4 = CGPDFScannerPopName(a1, (const char **)&value);
  BOOL v5 = value;
  if (value) {
    BOOL v6 = v4;
  }
  else {
    BOOL v6 = 0;
  }
  if (v6)
  {
    value = 0;
    ContentStream = CGPDFScannerGetContentStream(a1);
    if (ContentStream
      && (Resource = CGPDFContentStreamGetResource(ContentStream, "Shading", v5)) != 0
      && CGPDFObjectGetValue(Resource, kCGPDFObjectTypeDictionary, &value)
      && (id v9 = value) != 0)
    {
      value = 0;
      if (!CGPDFDictionaryGetObject((CGPDFDictionaryRef)v9, "ColorSpace", (CGPDFObjectRef *)&value))
      {
        CFStringRef v10 = @"shading was not a dictionary";
        goto LABEL_16;
      }
      if (sub_100010C9C((CGPDFObject *)value))
      {
        CFStringRef v10 = @"shading with color colorspace";
LABEL_16:
        [v3 setColorReason:v10];
      }
    }
    else
    {
      [v3 setColorReason:@"shading with unexpected shading type"];
    }
  }
  else
  {
    [v3 setColorReason:@"shading with unexpected parameter"];
  }
}

void sub_100010370(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100010388(CGPDFScanner *a1, void *a2)
{
  id v3 = a2;
  value = 0;
  BOOL v4 = CGPDFScannerPopName(a1, (const char **)&value);
  BOOL v5 = value;
  ContentStream = CGPDFScannerGetContentStream(a1);
  if (v4) {
    id v7 = v5;
  }
  else {
    id v7 = 0;
  }
  Resource = CGPDFContentStreamGetResource(ContentStream, "XObject", v7);
  value = 0;
  CGPDFObjectGetValue(Resource, kCGPDFObjectTypeStream, &value);
  Dictionary = CGPDFStreamGetDictionary((CGPDFStreamRef)value);
  __s1 = 0;
  if (CGPDFDictionaryGetName(Dictionary, "Subtype", (const char **)&__s1) && !strcmp(__s1, "Image"))
  {
    CGPDFObjectRef v14 = 0;
    CGPDFBoolean v13 = 0;
    BOOL Boolean = CGPDFDictionaryGetBoolean(Dictionary, "ImageMask", &v13);
    if (v13) {
      BOOL v11 = Boolean;
    }
    else {
      BOOL v11 = 0;
    }
    if (!v11)
    {
      if (CGPDFDictionaryGetObject(Dictionary, "ColorSpace", &v14))
      {
        if (!sub_100010C9C(v14)) {
          goto LABEL_7;
        }
        CFStringRef v12 = @"image xobject with color colorspace";
      }
      else
      {
        CFStringRef v12 = @"image xobject without colorspace assumed to be color";
      }
      [v3 setColorReason:v12];
    }
  }
  else
  {
    [v3 setColorReason:@"unrecognized direct object assumed to be color"];
  }
LABEL_7:
}

void sub_1000104C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_1000104E8(uint64_t a1, void *a2)
{
  return [a2 setColorReason:@"inline image assumed to be color"];
}

id sub_1000104F8(uint64_t a1, void *a2)
{
  return [a2 gsave];
}

id sub_100010500(uint64_t a1, void *a2)
{
  return [a2 grestore];
}

uint64_t sub_100010508(BOOL a1, const char *a2)
{
  if (!a2) {
    return 1;
  }
  if (!strcmp(a2, "DeviceGray"))
  {
    if (a1)
    {
      __s1 = 0;
      CGPDFScannerPopNumber((CGPDFScannerRef)a1, (CGPDFReal *)&__s1);
      return 0;
    }
    return a1;
  }
  if (strcmp(a2, "DeviceRGB"))
  {
    if (!strcmp(a2, "DeviceCMKY"))
    {
      if (a1)
      {
        unint64_t v10 = 0;
        p_s1 = &__s1;
        do
        {
          BOOL v12 = CGPDFScannerPopNumber((CGPDFScannerRef)a1, (CGPDFReal *)p_s1);
          BOOL v14 = v10++ < 3 && v12;
          ++p_s1;
        }
        while (v14);
        if (v12)
        {
          BOOL v15 = vabdd_f64(v31, v32) >= 0.01;
          return vabdd_f64(v31, v33) >= 0.01 || v15;
        }
      }
    }
    else if (!strcmp(a2, "Pattern"))
    {
      __s1 = 0;
      BOOL v16 = CGPDFScannerPopName((CGPDFScannerRef)a1, (const char **)&__s1);
      id v17 = __s1;
      __s1 = 0;
      ContentStream = CGPDFScannerGetContentStream((CGPDFScannerRef)a1);
      if (ContentStream
        && (!v16 ? (BOOL v19 = 0) : (BOOL v19 = v17),
            (Resource = CGPDFContentStreamGetResource(ContentStream, "Pattern", v19), (id v21 = Resource) != 0)
         && CGPDFObjectGetType(Resource) == kCGPDFObjectTypeStream
         && CGPDFObjectGetValue(v21, kCGPDFObjectTypeStream, &__s1)
         && (id v22 = __s1) != 0
         && (Dictionary = CGPDFStreamGetDictionary((CGPDFStreamRef)__s1), (id v24 = Dictionary) != 0)))
      {
        __s1 = 0;
        if (CGPDFDictionaryGetInteger(Dictionary, "PatternType", (CGPDFInteger *)&__s1))
        {
          if (__s1 == (char *)1)
          {
            __int16 v25 = CGPDFScannerGetContentStream((CGPDFScannerRef)a1);
            v26 = CGPDFContentStreamCreateWithStream((CGPDFStreamRef)v22, v24, v25);
            if (v26)
            {
              id v27 = objc_alloc_init(ColorInfo);
              sub_10000F98C(v26, v27);
              SecCertificateRef v28 = [(ColorInfo *)v27 colorReason];

              CGPDFContentStreamRelease(v26);
              a1 = v28 != 0;

              return a1;
            }
          }
          else
          {
            fprintf(__stderrp, "DEBUG: %s unrecognized pattern type %d", "isColorInPattern", __s1);
            CGPDFDictionaryPrint();
          }
        }
      }
      else
      {
        fprintf(__stderrp, "DEBUG: %s pattern stream without a dictionary.");
      }
    }
    else
    {
      BOOL v4 = CGPDFScannerGetContentStream((CGPDFScannerRef)a1);
      if (v4 && (BOOL v5 = CGPDFContentStreamGetResource(v4, "ColorSpace", a2)) != 0)
      {
        BOOL v6 = v5;
        CGPDFObjectType Type = CGPDFObjectGetType(v5);
        if (Type == kCGPDFObjectTypeArray)
        {
          __s1 = 0;
          if (CGPDFObjectGetValue(v6, kCGPDFObjectTypeArray, &__s1)) {
            return sub_100010998((CGPDFScanner *)a1, (CGPDFArrayRef)__s1);
          }
        }
        else if (Type == kCGPDFObjectTypeName)
        {
          __s1 = 0;
          if (CGPDFObjectGetValue(v6, kCGPDFObjectTypeName, &__s1)) {
            return sub_100010508(a1, __s1);
          }
        }
        else
        {
          CFDataRef v29 = __stderrp;
          CGPDFObjectGetType(v6);
          fprintf(v29, "DEBUG: %s unexpected type for colorspace reference: %d");
        }
      }
      else
      {
        fprintf(__stderrp, "DEBUG: %s couldn't find colorspace dictionary for %s");
      }
    }
    return 1;
  }

  return sub_1000108DC((CGPDFScannerRef)a1);
}

void sub_1000108C4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL sub_1000108DC(CGPDFScannerRef scanner)
{
  if (!scanner) {
    return 1;
  }
  unint64_t v2 = 0;
  id v3 = v7;
  do
  {
    BOOL v4 = CGPDFScannerPopNumber(scanner, v3);
    if (v2 > 1) {
      break;
    }
    ++v2;
    ++v3;
  }
  while (v4);
  if (!v4) {
    return 1;
  }
  BOOL v5 = vabdd_f64(v7[0], v7[1]) >= 0.01;
  return vabdd_f64(v7[0], v7[2]) >= 0.01 || v5;
}

uint64_t sub_100010998(CGPDFScanner *a1, CGPDFArrayRef array)
{
  if (CGPDFArrayGetCount(array) < 2) {
    return 1;
  }
  __s1 = 0;
  if (!CGPDFArrayGetName(array, 0, (const char **)&__s1)) {
    return 1;
  }
  BOOL v4 = __s1;
  if (!strcmp(__s1, "ICCBased")) {
    return sub_100010A94(a1, array);
  }
  if (!strcmp(v4, "CalRGB")) {
    return sub_1000108DC(a1);
  }
  if (strcmp(v4, "CalGray"))
  {
    if (!strcmp(v4, "Indexed")) {
      return sub_100010C3C(a1, array);
    }
    return 1;
  }
  if (a1)
  {
    CGPDFReal value = 0.0;
    CGPDFScannerPopNumber(a1, &value);
  }
  return 0;
}

BOOL sub_100010A94(CGPDFScanner *a1, CGPDFArrayRef array)
{
  CGPDFStreamRef value = 0;
  uint64_t v3 = 1;
  if (!CGPDFArrayGetStream(array, 1uLL, &value)) {
    return v3;
  }
  CGPDFInteger v13 = 0;
  BOOL v14 = 0;
  Dictionary = CGPDFStreamGetDictionary(value);
  if (!Dictionary) {
    return 1;
  }
  BOOL v5 = Dictionary;
  if (!CGPDFDictionaryGetInteger(Dictionary, "N", &v13)) {
    CGPDFInteger v13 = 0;
  }
  if (!CGPDFDictionaryGetName(v5, "Alternate", (const char **)&v14)) {
    BOOL v14 = "Unknown";
  }
  if (v13 == 3)
  {
    if (!strcmp(v14, "DeviceRGB")) {
      return sub_1000108DC(a1);
    }
    return 1;
  }
  if (v13 != 1)
  {
    if (a1)
    {
      __chkstk_darwin();
      BOOL v6 = (CGPDFReal *)&v12;
      int v7 = v13;
      if (v13 >= 10) {
        int v7 = 10;
      }
      if (v7 >= 1)
      {
        unint64_t v8 = v7;
        unint64_t v9 = 1;
        do
        {
          BOOL v10 = CGPDFScannerPopNumber(a1, v6);
          if (v9 >= v8) {
            break;
          }
          ++v9;
          ++v6;
        }
        while (v10);
      }
    }
    return 1;
  }
  if (strcmp(v14, "DeviceGray")) {
    return 1;
  }
  if (a1)
  {
    CGPDFReal v16 = 0.0;
    CGPDFScannerPopNumber(a1, &v16);
  }
  return 0;
}

uint64_t sub_100010C3C(CGPDFScanner *a1, CGPDFArrayRef array)
{
  CGPDFObjectRef v5 = 0;
  CGPDFReal value = 0.0;
  if (a1) {
    CGPDFScannerPopNumber(a1, &value);
  }
  uint64_t v3 = 1;
  if (CGPDFArrayGetObject(array, 1uLL, &v5)) {
    return sub_100010C9C(v5);
  }
  return v3;
}

uint64_t sub_100010C9C(CGPDFObject *a1)
{
  CGPDFObjectType Type = CGPDFObjectGetType(a1);
  if (Type == kCGPDFObjectTypeArray)
  {
    CGPDFReal value = 0;
    if (CGPDFObjectGetValue(a1, kCGPDFObjectTypeArray, &value)) {
      return sub_100010998(0, value);
    }
  }
  else if (Type == kCGPDFObjectTypeName)
  {
    CGPDFReal value = 0;
    if (CGPDFObjectGetValue(a1, kCGPDFObjectTypeName, &value)) {
      return strcmp((const char *)value, "DeviceGray") != 0;
    }
  }
  return 1;
}

void sub_100010E64(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100011220(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100011290(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = +[NSString stringWithFormat:@"[%@:%@]", a2, a3];
  objc_msgSend(v3, "addObject:");
}

void sub_1000112F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  _Unwind_Resume(a1);
}

void liteLockPrinters(void)
{
  pthread_mutex_lock(&stru_1000C5A60);
  if (!qword_1000C8A90)
  {
    uint64_t v0 = objc_opt_new();
    id v1 = (void *)qword_1000C8A90;
    qword_1000C8A90 = v0;
  }
}

uint64_t liteUnlockPrinters(void)
{
  return pthread_mutex_unlock(&stru_1000C5A60);
}

void sub_10001143C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_100011458(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = [a3 logInfo];
  objc_msgSend(v3, "addObject:");
}

void sub_1000114B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100011568(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001166C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000117EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100011840(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if ([v3 provenance] == 2)
  {
    CGPDFObjectRef v5 = [v3 provenanceIdentifier];

    if (v5)
    {
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472;
      _DWORD v6[2] = sub_1000148B8;
      v6[3] = &unk_100095A88;
      id v7 = v3;
      [v4 setPerformAuthenticationForDeviceHTTP:v6];
    }
  }
}

void sub_100011910(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_100011A60(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100011B24(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100011C54(id a1)
{
  id v1 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v2 = dispatch_queue_create("com.apple.printing.PrinterResolution", v1);
  id v3 = (void *)qword_1000C8AA0;
  qword_1000C8AA0 = (uint64_t)v2;

  uint64_t v4 = objc_opt_new();
  CGPDFObjectRef v5 = (void *)qword_1000C8AA8;
  qword_1000C8AA8 = v4;
}

void sub_100011CD0(uint64_t a1)
{
  dispatch_queue_t v2 = +[lite_printer_t existingPrinterWithEndpoint:*(void *)(a1 + 32)];
  if (v2)
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    id v3 = [(id)qword_1000C8AA8 objectForKeyedSubscript:*(void *)(a1 + 32)];
    if (!v3)
    {
      id v3 = objc_opt_new();
      [(id)qword_1000C8AA8 setObject:v3 forKeyedSubscript:*(void *)(a1 + 32)];
      uint64_t v4 = _PKLogCategory(PKLogCategoryDiscovery[0]);
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v5 = *(void *)(a1 + 32);
        *(_DWORD *)long long buf = 138543362;
        uint64_t v13 = v5;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Starting new resolution for %{public}@", buf, 0xCu);
      }

      BOOL v6 = *(void **)(a1 + 32);
      uint64_t v7 = *(void *)(a1 + 40);
      uint64_t v8 = qword_1000C8AA0;
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_100011EFC;
      v10[3] = &unk_1000957D0;
      id v11 = v6;
      +[lite_printer_t _startPrinterResolution:v11 session:v7 queue:v8 completionHandler:v10];
    }
    id v9 = objc_retainBlock(*(id *)(a1 + 48));
    [v3 addObject:v9];
  }
}

void sub_100011EAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_100011EFC(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = _PKLogCategory(PKLogCategoryDiscovery[0]);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    *(_DWORD *)long long buf = 138543618;
    uint64_t v14 = v5;
    __int16 v15 = 2114;
    id v16 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Completed resolution for %{public}@, printer %{public}@", buf, 0x16u);
  }

  BOOL v6 = [(id)qword_1000C8AA8 objectForKeyedSubscript:*(void *)(a1 + 32)];
  [(id)qword_1000C8AA8 removeObjectForKey:*(void *)(a1 + 32)];
  uint64_t v7 = dispatch_get_global_queue(0, 0);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000120BC;
  v10[3] = &unk_1000957A8;
  id v11 = v6;
  id v12 = v3;
  id v8 = v3;
  id v9 = v6;
  dispatch_async(v7, v10);
}

void sub_100012094(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000120BC(uint64_t a1)
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100012158;
  v2[3] = &unk_100095780;
  id v1 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  [v1 enumerateObjectsUsingBlock:v2];
}

void sub_100012144(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

uint64_t sub_100012158(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, void))(a2 + 16))(a2, *(void *)(a1 + 32));
}

void sub_1000122D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, void *a16, void *a17, void *a18)
{
  _Unwind_Resume(a1);
}

void sub_100012334(uint64_t a1, void *a2)
{
  id v2 = a2;
  sub_100014980(v3, 0xBu, @"+_startPrinterResolution");
}

void sub_1000124D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, void *a16, void *a17, void *a18, void *a19)
{
  sub_100014B1C((void *)(v20 - 72));
  _Unwind_Resume(a1);
}

void sub_100012538(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 ippResponse];

  if (v4)
  {
    uint64_t v5 = *(void **)(a1 + 48);
    BOOL v6 = [v3 ippResponse];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1000128B8;
    v11[3] = &unk_100095898;
    id v12 = v3;
    id v13 = *(id *)(a1 + 56);
    id v14 = *(id *)(a1 + 40);
    id v16 = *(id *)(a1 + 72);
    id v15 = *(id *)(a1 + 64);
    sub_1000127D4(v5, v6, v11);

    uint64_t v7 = &v12;
  }
  else
  {
    id v8 = _PKLogCategory(PKLogCategoryDefault[0]);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = [*(id *)(a1 + 32) printerURL];
      *(_DWORD *)long long buf = 138543362;
      uint64_t v20 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Can't create a printer for %{public}@", buf, 0xCu);
    }
    BOOL v10 = *(NSObject **)(a1 + 40);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000127C0;
    block[3] = &unk_100095820;
    uint64_t v7 = &v18;
    id v18 = *(id *)(a1 + 72);
    dispatch_async(v10, block);
  }
}

void sub_100012764(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_1000127C0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_1000127D4(void *a1, void *a2, void *a3)
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100014BBC;
  double v7[3] = &unk_100095B48;
  id v8 = a1;
  id v9 = a3;
  id v5 = v8;
  id v6 = v9;
  sub_100012A00(a2, v7);
}

void sub_100012894(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1000128B8(id *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [a1[4] ippResponse];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  _DWORD v6[2] = sub_100012A88;
  v6[3] = &unk_100095870;
  id v7 = a1[5];
  id v5 = v3;
  id v8 = v5;
  id v9 = a1[6];
  id v11 = a1[8];
  id v10 = a1[7];
  sub_100012A00(v4, v6);
}

void sub_1000129BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, void *a16, void *a17, void *a18)
{
  _Unwind_Resume(a1);
}

void sub_100012A00(void *a1, void *a2)
{
  id v6 = a1;
  id v3 = (void (*)(void *, id *))a2[2];
  id v4 = v6;
  id v5 = a2;
  v3(v5, &v6);
}

void sub_100012A6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_100012A88(uint64_t a1, uint64_t a2)
{
  id v4 = objc_alloc((Class)PKPrinterDescription);
  id v5 = [*(id *)(a1 + 32) resolvedTXT];
  id v6 = [v4 initWithAttributes:a2 txtRecord:v5 translations:*(void *)(a1 + 40)];

  if ([v6 wantsComprehensivePaperList])
  {
    uint64_t v7 = *(void *)(a1 + 56);
    id v8 = *(void **)(a1 + 32);
    id v9 = *(void **)(a1 + 40);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100012EC4;
    v10[3] = &unk_100095848;
    id v11 = v6;
    id v12 = *(id *)(a1 + 48);
    id v13 = *(id *)(a1 + 32);
    id v14 = *(id *)(a1 + 64);
    sub_100012D9C(v8, v7, v9, v10);
  }
  else
  {
    sub_100012C18(*(void **)(a1 + 48), *(void **)(a1 + 32), v6, *(void **)(a1 + 64));
  }
}

void sub_100012BD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_100012C18(void *a1, void *a2, void *a3, void *a4)
{
  uint64_t v7 = a1;
  id v8 = a2;
  id v9 = a3;
  id v10 = a4;
  id v11 = [objc_alloc((Class)PKPrinterBrowseInfo) initWithResolvedBonjourName:v8];
  id v12 = [[lite_printer_t alloc] initWithBrowseInfo:v11 description:v9];
  if (v12)
  {
    liteLockPrinters();
    [(id)qword_1000C8A90 setObject:v12 forKey:v8];
    pthread_mutex_unlock(&stru_1000C5A60);
  }
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100014DC0;
  v15[3] = &unk_100095B70;
  id v16 = v12;
  id v17 = v10;
  id v13 = v12;
  id v14 = v10;
  dispatch_async(v7, v15);
}

void sub_100012D68(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100012D9C(void *a1, uint64_t a2, void *a3, void *a4)
{
  id v7 = a1;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100014DD4;
  v11[3] = &unk_100095BE8;
  id v13 = a3;
  id v14 = a4;
  id v12 = v7;
  id v8 = v13;
  id v9 = v14;
  id v10 = v7;
  +[device_http_t deviceHTTPForSessionURL:a2 completionHandler:v11];
}

void sub_100012E94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_100012EC4(id *a1, void *a2)
{
  id v3 = a2;
  if (v3) {
    [a1[4] replacePaperList:v3];
  }
  sub_100012C18(a1[5], a1[6], a1[4], a1[7]);
}

void sub_100012F24(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100013020(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15)
{
  _Unwind_Resume(a1);
}

void sub_100013050(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v6 = v3;
  if (v3)
  {
    id v4 = [*(id *)(a1 + 48) existingPrinterWithEndpoint:v3];
    if (v4)
    {
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
    else
    {
      id v5 = [*(id *)(a1 + 32) session];
      +[lite_printer_t realizePrinterWithResolvedEndpoint:v6 session:v5 completionHandler:*(void *)(a1 + 40)];
    }
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void sub_10001311C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1000131A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100013398(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_1000133D8(uint64_t a1, void *a2)
{
  id v2 = a2;
  sub_10001515C(v3, 0x3Cu, @"identifyPrinterWithSession");
}

void sub_1000134C4(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);

  sub_100015254((uint64_t *)va);
  _Unwind_Resume(a1);
}

void sub_1000135F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16)
{
  objc_destroyWeak(v16);
  objc_destroyWeak((id *)(v19 - 56));
  _Unwind_Resume(a1);
}

uint64_t sub_100013628(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));

  if (WeakRetained) {
    [*(id *)(a1 + 32) _checkAccessWithSession:*(void *)(a1 + 40)];
  }
  id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);

  return v3();
}

void sub_100013A6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);

  sub_1000153EC((uint64_t *)va);
  _Unwind_Resume(a1);
}

void sub_100013B50(void **a1)
{
  id v2 = +[NSData dataWithBytes:"abcd" length:4];
  Printd_Parameters::_set_JobPassword(a1, v2);
  Printd_Parameters::_set_JobPasswordEncryption(a1, @"none");
}

void sub_100013BC8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100013D6C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100013F84(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, uint64_t a16, void *a17, uint64_t a18, id location, uint64_t a20)
{
  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  sub_100014B1C(&a20);

  _Unwind_Resume(a1);
}

void sub_100013FF4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (v3
    && ![v3 transportStatus]
    && (id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64)), WeakRetained, WeakRetained))
  {
    id v6 = *(void **)(a1 + 40);
    id v7 = [v4 ippResponse];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1000141A0;
    v10[3] = &unk_100095A18;
    id v11 = v4;
    objc_copyWeak(&v15, (id *)(a1 + 64));
    id v14 = *(id *)(a1 + 56);
    id v12 = *(id *)(a1 + 32);
    int8x16_t v9 = *(int8x16_t *)(a1 + 40);
    id v8 = (id)v9.i64[0];
    int8x16_t v13 = vextq_s8(v9, v9, 8uLL);
    sub_1000127D4(v6, v7, v10);

    objc_destroyWeak(&v15);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

void sub_10001415C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16, uint64_t a17, void *a18, void *a19)
{
  objc_destroyWeak(v21);
  _Unwind_Resume(a1);
}

void sub_1000141A0(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) ippResponse];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000142F4;
  v8[3] = &unk_1000959F0;
  objc_copyWeak(&v14, (id *)(a1 + 72));
  id v13 = *(id *)(a1 + 64);
  id v9 = *(id *)(a1 + 40);
  id v5 = v3;
  uint64_t v6 = *(void *)(a1 + 48);
  id v7 = *(void **)(a1 + 56);
  id v10 = v5;
  uint64_t v11 = v6;
  id v12 = v7;
  sub_100012A00(v4, v8);

  objc_destroyWeak(&v14);
}

void sub_1000142B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14, uint64_t a15, void *a16, void *a17)
{
  objc_destroyWeak(v19);
  _Unwind_Resume(a1);
}

void sub_1000142F4(uint64_t a1, uint64_t a2)
{
  id v4 = (id *)(a1 + 72);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));

  if (WeakRetained)
  {
    id v6 = objc_alloc((Class)PKPrinterDescription);
    id v7 = objc_loadWeakRetained(v4);
    id v8 = [v7 txtRecord];
    id v9 = [v6 initWithAttributes:a2 txtRecord:v8 translations:*(void *)(a1 + 40)];

    if ([v9 wantsComprehensivePaperList])
    {
      id v10 = objc_loadWeakRetained(v4);
      uint64_t v11 = [v10 printerDescription];
      unsigned __int8 v12 = [v11 wantsComprehensivePaperList];

      if ((v12 & 1) == 0)
      {
        id v13 = objc_loadWeakRetained(v4);
        id v14 = [v13 printerDescription];
        id v15 = [v14 paperList];
        [v9 replacePaperList:v15];
      }
    }
    if ([v9 wantsComprehensivePaperList])
    {
      id v16 = *(void **)(a1 + 56);
      id v17 = objc_loadWeakRetained(v4);
      id v18 = objc_msgSend(v17, "device_uri");
      uint64_t v19 = [v16 ippURL:v18];

      id v20 = objc_loadWeakRetained(v4);
      id v21 = [v20 bonjourName];
      id v22 = *(void **)(a1 + 40);
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472;
      v24[2] = sub_100014624;
      v24[3] = &unk_1000959C8;
      id v25 = v9;
      objc_copyWeak(&v28, v4);
      id v27 = *(id *)(a1 + 64);
      id v26 = *(id *)(a1 + 32);
      sub_100012D9C(v21, (uint64_t)v19, v22, v24);

      objc_destroyWeak(&v28);
    }
    else
    {
      [*(id *)(a1 + 48) _updateDescPrinterDescription:v9];
      (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
    }
  }
  else
  {
    int v23 = *(void (**)(void))(*(void *)(a1 + 64) + 16);
    v23();
  }
}

void sub_10001458C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100014624(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4) {
    [*(id *)(a1 + 32) replacePaperList:v4];
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  [WeakRetained _updateDescPrinterDescription:*(void *)(a1 + 32)];

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void sub_1000146A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100014738(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100014850(id a1)
{
  id v3 = dispatch_queue_attr_make_with_autorelease_frequency((dispatch_queue_attr_t)&_dispatch_queue_attr_concurrent, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v1 = dispatch_queue_create("com.apple.printing.printer", v3);
  id v2 = (void *)qword_1000C8AB0;
  qword_1000C8AB0 = (uint64_t)v1;
}

void sub_1000148B8(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  id v11 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [*(id *)(a1 + 32) provenanceIdentifier];
  +[Browse_Extension withExtensionIdentifier:v10 request:v11 handleChallenge:v8 completionHandler:v9];
}

void sub_100014958(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100014980(void *a1, unsigned __int16 a2, void *a3)
{
  *sub_100014A3C(a1, a2, a3) = off_100095B08;
  operator new();
}

void sub_1000149F0(_Unwind_Exception *a1)
{
  sub_10000F138(v1);
  _Unwind_Resume(a1);
}

void sub_100014A04(void *a1)
{
  sub_100014B1C(a1);

  operator delete();
}

void *sub_100014A3C(void *a1, unsigned __int16 a2, void *a3)
{
  id v5 = a3;
  a1[1] = 0;
  a1[2] = 0;
  *a1 = off_100095638;
  id v6 = [[ipp_request_t alloc] initWithOp:a2];
  id v7 = (void *)a1[1];
  a1[1] = v6;

  id v8 = (void *)a1[2];
  a1[2] = v5;

  return a1;
}

void sub_100014AC0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100014AE4(void *a1)
{
  sub_100014B1C(a1);

  operator delete();
}

uint64_t sub_100014B1C(void *a1)
{
  *a1 = off_100095B08;
  uint64_t v1 = (id *)a1[3];
  if (v1)
  {

    operator delete();
  }
  id v2 = (id *)a1[4];
  if (v2)
  {

    operator delete();
  }

  return sub_10000F138((uint64_t)a1);
}

void sub_100014BBC(uint64_t a1, void **this)
{
  if (this && Printd_Parameters::_has_PrinterStringsURI(this))
  {
    id v4 = Printd_Parameters::_get_PrinterStringsURI(this);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100014CC8;
    double v7[3] = &unk_100095B20;
    id v5 = *(void **)(a1 + 32);
    id v8 = *(id *)(a1 + 40);
    platformHTTP_GetDataForURL(v5, v4, v7);
  }
  else
  {
    id v6 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v6();
  }
}

void sub_100014CB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_100014CC8(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v6 = v3;
  if (v3)
  {
    id v4 = +[NSPropertyListSerialization propertyListWithData:v3 options:0 format:0 error:0];
    if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
      id v5 = v4;
    }
    else {
      id v5 = 0;
    }
  }
  else
  {
    id v5 = 0;
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100014D94(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

uint64_t sub_100014DC0(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void sub_100014DD4(uint64_t a1, void *a2)
{
  id v2 = a2;
  sub_100014980(v3, 0xBu, @"withUpdatedPaperList");
}

void sub_100014F20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7, void *a8, ...)
{
  va_start(va, a8);

  sub_100014B1C((uint64_t *)va);
  _Unwind_Resume(a1);
}

void sub_100014F68(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 ippResponse];

  if (v4)
  {
    id v5 = [v3 ippResponse];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1000150DC;
    double v7[3] = &unk_100095B98;
    id v8 = *(id *)(a1 + 32);
    id v9 = *(id *)(a1 + 40);
    sub_100012A00(v5, v7);
  }
  else
  {
    id v6 = _PKLogCategory(PKLogCategoryDefault[0]);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Can't fetch media-col attributes", buf, 2u);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void sub_1000150AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000150DC(uint64_t a1, uint64_t a2)
{
  id v3 = +[PKPaperList paperListWithAttrs:a2 translations:*(void *)(a1 + 32)];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_100015148(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10001515C(void *a1, unsigned __int16 a2, void *a3)
{
  *sub_100014A3C(a1, a2, a3) = off_100095C68;
  operator new();
}

void sub_1000151CC(_Unwind_Exception *a1)
{
  sub_10000F138(v1);
  _Unwind_Resume(a1);
}

void sub_1000151E0(void *a1)
{
  sub_100015254(a1);

  operator delete();
}

void sub_10001521C(void *a1)
{
  sub_100015254(a1);

  operator delete();
}

uint64_t sub_100015254(void *a1)
{
  *a1 = off_100095C68;
  uint64_t v1 = (id *)a1[3];
  if (v1)
  {

    operator delete();
  }
  id v2 = (id *)a1[4];
  if (v2)
  {

    operator delete();
  }

  return sub_10000F138((uint64_t)a1);
}

void sub_1000152F4(void *a1, unsigned __int16 a2, void *a3)
{
  *sub_100014A3C(a1, a2, a3) = &off_100095CD8;
  operator new();
}

void sub_100015364(_Unwind_Exception *a1)
{
  sub_10000F138(v1);
  _Unwind_Resume(a1);
}

void sub_100015378(void *a1)
{
  sub_1000153EC(a1);

  operator delete();
}

void sub_1000153B4(void *a1)
{
  sub_1000153EC(a1);

  operator delete();
}

uint64_t sub_1000153EC(void *a1)
{
  *a1 = &off_100095CD8;
  uint64_t v1 = (id *)a1[3];
  if (v1)
  {

    operator delete();
  }
  id v2 = (id *)a1[4];
  if (v2)
  {

    operator delete();
  }

  return sub_10000F138((uint64_t)a1);
}

NSString *internString(NSString *a1)
{
  uint64_t v1 = a1;
  id v2 = [&off_1000B9040 objectForKeyedSubscript:v1];
  id v3 = v2;
  if (v2)
  {
    id v4 = v2;
LABEL_9:
    id v10 = v4;
    goto LABEL_10;
  }
  id v5 = v1;
  id v6 = [(NSString *)v5 UTF8String];
  id v7 = (id)strlen(v6);
  if ((id)[(NSString *)v5 length] != v7)
  {
    id v4 = v5;
    uint64_t v1 = v4;
    goto LABEL_9;
  }
  v12[0] = v6;
  v12[1] = v7;
  v12[2] = sub_1000155F4(v6, (uint64_t)v7);
  void v12[3] = 0;
  if (qword_1000C8AC0 != -1) {
    dispatch_once(&qword_1000C8AC0, &stru_100095CE8);
  }
  CFArrayRef Value = CFDictionaryGetValue((CFDictionaryRef)qword_1000C8AC8, v12);
  if (Value)
  {
    id v9 = (NSString *)Value[3];
  }
  else if (sub_10001563C(v6, (uint64_t)v7))
  {
    sub_1000156B0(v5);
    id v9 = (NSString *)objc_claimAutoreleasedReturnValue();

    id v5 = v9;
  }
  else
  {
    id v9 = v5;
  }
  id v10 = v9;
  uint64_t v1 = v5;
LABEL_10:

  return v10;
}

void sub_1000155D8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_1000155F4(char *a1, uint64_t a2)
{
  if (a2) {
    return 257 * sub_1000155F4(a1 + 1, a2 - 1) + *a1;
  }
  else {
    return 0;
  }
}

BOOL sub_10001563C(char *a1, uint64_t a2)
{
  id v2 = a1;
  unint64_t v3 = (unint64_t)&a1[a2];
  while (1)
  {
    id v4 = v2;
    if ((unint64_t)v2 >= v3) {
      break;
    }
    ++v2;
    __darwin_ct_rune_t v5 = *v4;
    if (v5 < 0)
    {
      if (!__maskrune(v5, 0x40000uLL)) {
        return (unint64_t)v4 >= v3;
      }
    }
    else if ((_DefaultRuneLocale.__runetype[v5] & 0x40000) == 0)
    {
      return (unint64_t)v4 >= v3;
    }
  }
  return (unint64_t)v4 >= v3;
}

id sub_1000156B0(void *a1)
{
  id v1 = a1;
  id v2 = objc_opt_class();
  objc_sync_enter(v2);
  unint64_t v3 = (void *)qword_1000C8AD0;
  if (!qword_1000C8AD0)
  {
    uint64_t v4 = objc_opt_new();
    __darwin_ct_rune_t v5 = (void *)qword_1000C8AD0;
    qword_1000C8AD0 = v4;

    unint64_t v3 = (void *)qword_1000C8AD0;
  }
  id v6 = [v3 objectForKeyedSubscript:v1];
  id v7 = v6;
  if (!v6)
  {
    id v8 = [(id)qword_1000C8AD0 count];
    id v7 = v1;
    if ((unint64_t)v8 <= 0x7F)
    {
      [(id)qword_1000C8AD0 setObject:v1 forKeyedSubscript:v1];
      id v7 = v1;
    }
  }
  id v9 = v7;

  objc_sync_exit(v2);

  return v9;
}

void sub_10001578C(_Unwind_Exception *a1)
{
  objc_sync_exit(v2);

  _Unwind_Resume(a1);
}

id internUTF8ByteString(char *a1, uint64_t a2)
{
  id v9 = a1;
  uint64_t v10 = a2;
  uint64_t v11 = sub_1000155F4(a1, a2);
  uint64_t v12 = 0;
  if (qword_1000C8AC0 != -1) {
    dispatch_once(&qword_1000C8AC0, &stru_100095CE8);
  }
  CFArrayRef Value = (id *)CFDictionaryGetValue((CFDictionaryRef)qword_1000C8AC8, &v9);
  if (Value)
  {
    id v5 = Value[3];
  }
  else
  {
    id v7 = objc_alloc((Class)NSString);
    id v5 = objc_msgSend(v7, "initWithBytes:length:encoding:", a1, a2, 4, v9, v10, v11, v12);
    if (v5 && sub_10001563C(a1, a2))
    {
      uint64_t v8 = sub_1000156B0(v5);

      id v5 = (id)v8;
    }
  }

  return v5;
}

void sub_1000158A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000158B4(id a1)
{
  keyCallBacks.version = 0;
  keyCallBacks.retain = (CFDictionaryRetainCallBack)sub_1000159C8;
  keyCallBacks.release = (CFDictionaryReleaseCallBack)nullsub_4;
  keyCallBacks.copyDescription = (CFDictionaryCopyDescriptionCallBack)sub_1000159D4;
  keyCallBacks.equal = (CFDictionaryEqualCallBack)sub_100015B00;
  keyCallBacks.hash = (CFDictionaryHashCallBack)sub_100015B40;
  valueCallBacks.version = 0;
  valueCallBacks.retain = (CFDictionaryRetainCallBack)sub_100015B48;
  valueCallBacks.release = (CFDictionaryReleaseCallBack)nullsub_5;
  valueCallBacks.copyDescription = (CFDictionaryCopyDescriptionCallBack)sub_100015B84;
  valueCallBacks.equal = (CFDictionaryEqualCallBack)sub_100015C0C;
  if (off_1000C5AA0[0] != &off_100095D08) {
    sub_100064104();
  }
  if (off_1000C8460 != &off_1000A0408) {
    sub_1000640D8();
  }
  qword_1000C8AC8 = (uint64_t)CFDictionaryCreate(kCFAllocatorDefault, (const void **)off_1000C5AA0, (const void **)off_1000C5AA0, 1337, &keyCallBacks, &valueCallBacks);
}

uint64_t sub_1000159C8(uint64_t a1, uint64_t a2)
{
  return a2;
}

CFStringRef sub_1000159D4(char **a1)
{
  uint64_t v2 = sub_100015A5C(a1);
  unint64_t v3 = sub_100015AA8(a1);
  CFStringRef v4 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"key<%d/%@>", v2, v3);

  return v4;
}

void sub_100015A4C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_100015A5C(char **a1)
{
  uint64_t v1 = (char *)a1 - (char *)&off_100095D08;
  if (a1 < &off_100095D08 || a1 >= &qword_1000A0428) {
    return 0xFFFFFFFFLL;
  }
  if (&(&off_100095D08)[4 * (int)(v1 >> 5)] != a1) {
    sub_100064130();
  }
  return (unint64_t)v1 >> 5;
}

id sub_100015AA8(void *a1)
{
  uint64_t v1 = (void *)a1[3];
  if (v1) {
    id v2 = v1;
  }
  else {
    id v2 = [objc_alloc((Class)NSString) initWithBytes:*a1 length:a1[1] encoding:4];
  }

  return v2;
}

BOOL sub_100015B00(uint64_t a1, uint64_t a2)
{
  size_t v2 = *(void *)(a1 + 8);
  return v2 == *(void *)(a2 + 8) && memcmp(*(const void **)a1, *(const void **)a2, v2) == 0;
}

uint64_t sub_100015B40(uint64_t a1)
{
  return *(void *)(a1 + 16);
}

char **sub_100015B48(uint64_t a1, char **a2)
{
  if (sub_100015A5C(a2) == -1) {
    sub_10006415C();
  }
  return a2;
}

CFStringRef sub_100015B84(char **a1)
{
  uint64_t v2 = sub_100015A5C(a1);
  unint64_t v3 = sub_100015AA8(a1);
  CFStringRef v4 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"val<%d/%@>", v2, v3);

  return v4;
}

void sub_100015BFC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL sub_100015C0C(uint64_t a1, uint64_t a2)
{
  size_t v2 = *(void *)(a1 + 8);
  return v2 == *(void *)(a2 + 8) && memcmp(*(const void **)a1, *(const void **)a2, v2) == 0;
}

void sub_100015E54(_Unwind_Exception *a1)
{
  id v6 = v4;

  _Unwind_Resume(a1);
}

void sub_100016078(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100016150(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001628C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100016510(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100016860(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100016C80(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100016D14(uint64_t a1)
{
  size_t v2 = [*(id *)(a1 + 32) URLByDeletingLastPathComponent];
  unint64_t v47 = +[NSString stringWithFormat:@"%@_%d_%d.printSettings", *(void *)(a1 + 40), getpid(), *(unsigned int *)(a1 + 80)];
  +[NSURL fileURLWithPath:relativeToURL:](NSURL, "fileURLWithPath:relativeToURL:");
  id v49 = (id)objc_claimAutoreleasedReturnValue();
  size_t v46 = +[NSString stringWithFormat:@"%@_%d_%d.txt", *(void *)(a1 + 40), getpid(), *(unsigned int *)(a1 + 80)];
  v48 = +[NSURL fileURLWithPath:relativeToURL:](NSURL, "fileURLWithPath:relativeToURL:");
  unint64_t v3 = +[NSOutputStream outputStreamWithURL:append:](NSOutputStream, "outputStreamWithURL:append:");
  CFStringRef v4 = v3;
  if (v3)
  {
    [v3 open];
    if ([v4 hasSpaceAvailable])
    {
      id v5 = +[NSDate date];
      id v6 = +[NSString stringWithFormat:@"Created: %@\n", v5];
      BOOL v7 = sub_1000174E4(v4, v6);

      if (v7)
      {
        uint64_t v8 = +[NSString stringWithFormat:@"ClientID: %@\n", *(void *)(a1 + 40)];
        BOOL v9 = sub_1000174E4(v4, v8);

        if (v9)
        {
          uint64_t v10 = +[NSString stringWithFormat:@"JobID: %d\n", *(unsigned int *)(a1 + 80)];
          BOOL v11 = sub_1000174E4(v4, v10);

          if (v11)
          {
            uint64_t v12 = [*(id *)(a1 + 48) jobName];
            id v13 = +[NSString stringWithFormat:@"Job Name: %@\n", v12];
            BOOL v14 = sub_1000174E4(v4, v13);

            if (v14)
            {
              id v15 = +[NSString stringWithFormat:@"Job Type: %@\n", *(void *)(a1 + 56)];
              BOOL v16 = sub_1000174E4(v4, v15);

              if (v16)
              {
                id v17 = [*(id *)(a1 + 64) debugDescription];
                id v18 = +[NSString stringWithFormat:@"Session: %@\n", v17];
                BOOL v19 = sub_1000174E4(v4, v18);

                if (v19)
                {
                  id v20 = [*(id *)(a1 + 72) debugDescription];
                  id v21 = +[NSString stringWithFormat:@"Printer: %@\n", v20];
                  BOOL v22 = sub_1000174E4(v4, v21);

                  if (v22)
                  {
                    int v23 = [*(id *)(a1 + 72) printerDescription];
                    id v24 = [v23 userCodableDictionary];
                    id v25 = +[NSString stringWithFormat:@"Printer Description: %@\n", v24];
                    BOOL v26 = sub_1000174E4(v4, v25);

                    if (v26)
                    {
                      id v27 = objc_msgSend(*(id *)(a1 + 72), "device_uri");
                      id v28 = +[NSString stringWithFormat:@"Printer Device URI: %@\n", v27];
                      BOOL v29 = sub_1000174E4(v4, v28);

                      if (v29)
                      {
                        id v30 = objc_msgSend(*(id *)(a1 + 72), "device_uri");
                        double v31 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"\n/usr/local/bin/grappler --verbose print --printerURL \"%@\" --file \"%s\" --printSettingsFile \"%s\" --monitor\n", v30, [*(id *)(a1 + 32) fileSystemRepresentation], objc_msgSend(objc_retainAutorelease(v49), "fileSystemRepresentation"));
                        BOOL v32 = sub_1000174E4(v4, v31);

                        if (v32) {
                          sub_1000174E4(v4, @"\n");
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
    [v4 close];
  }
  uint64_t v33 = *(void *)(a1 + 48);
  id v50 = 0;
  double v34 = +[NSKeyedArchiver archivedDataWithRootObject:v33 requiringSecureCoding:1 error:&v50];
  id v35 = v50;
  v36 = v35;
  if (!v34 || v35)
  {
    id v37 = _PKLogCategory(PKLogCategoryDefault[0]);
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      uint64_t v44 = *(void *)(a1 + 40);
      *(_DWORD *)long long buf = 138412546;
      uint64_t v52 = v44;
      __int16 v53 = 2112;
      id v54 = v36;
      _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_ERROR, "Unable to serialize print settings for %@ - %@", buf, 0x16u);
    }
  }
  else
  {
    id v37 = [v34 base64EncodedDataWithOptions:0];
    if ([v37 writeToURL:v49 atomically:1])
    {
      id v38 = _PKLogCategory(PKLogCategoryProgress[0]);
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v39 = *(void *)(a1 + 40);
        id v40 = [v49 lastPathComponent];
        id v41 = [*(id *)(a1 + 32) lastPathComponent];
        unsigned int v42 = [v48 lastPathComponent];
        id v43 = [v2 fileSystemRepresentation];
        *(_DWORD *)long long buf = 138413314;
        uint64_t v52 = v39;
        __int16 v53 = 2112;
        id v54 = v40;
        __int16 v55 = 2112;
        id v56 = v41;
        __int16 v57 = 2112;
        v58 = v42;
        __int16 v59 = 2080;
        id v60 = v43;
        _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "For job from '%@' control '%@', spool '%@', description '%@' in '%s'", buf, 0x34u);
      }
    }
    else
    {
      id v38 = _PKLogCategory(PKLogCategoryDefault[0]);
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        uint64_t v45 = *(void *)(a1 + 40);
        *(_DWORD *)long long buf = 138412546;
        uint64_t v52 = v45;
        __int16 v53 = 2112;
        id v54 = v49;
        _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_ERROR, "Unable to write print settings for %@ to %@", buf, 0x16u);
      }
    }
  }
}

void sub_1000173B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, void *a13, void *a14, void *a15)
{
  _Unwind_Resume(a1);
}

BOOL sub_1000174E4(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  id v5 = (const char *)[v4 UTF8String];
  id v6 = &v5[strlen(v5)];
  do
  {
    BOOL v7 = v5;
    if (v5 >= v6) {
      break;
    }
    uint64_t v8 = (uint64_t)[v3 write:v5 maxLength:v6 - v5];
    v5 += v8;
  }
  while (v8 > 0);

  return v7 >= v6;
}

void sub_100017574(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100017A84(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000180DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_100018178(uint64_t a1)
{
  size_t v2 = *(void **)(a1 + 8);
  *(void *)a1 = off_1000A0480;
  *(void *)(a1 + 8) = 0;

  return a1;
}

void sub_100018264(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100018530(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100018644(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100018954(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100018A7C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100018B48(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100018BE0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100018C48(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100018E10(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100018FB0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100019234(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100019274(uint64_t a1, void *a2)
{
}

void sub_100019280(uint64_t a1, void *a2)
{
}

void sub_1000192EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_100019370(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_10001951C(_Unwind_Exception *a1)
{
  id v5 = v4;

  _Unwind_Resume(a1);
}

void sub_1000196F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000197B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000198D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000199F8(_Unwind_Exception *a1)
{
  id v4 = v3;

  _Unwind_Resume(a1);
}

void sub_100019A7C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_100019AF0(uint64_t a1)
{
  return [*(id *)(a1 + 8) MediaCol];
}

id sub_100019AF8(uint64_t a1)
{
  return [*(id *)(a1 + 8) Media];
}

void sub_100019B00(uint64_t a1)
{
  size_t v2 = *(void **)(a1 + 8);
  *(void *)a1 = off_1000A0480;
  *(void *)(a1 + 8) = 0;

  operator delete();
}

void sub_10001A1B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001A260(id a1)
{
}

void sub_10001A3E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001A3FC()
{
  if (!qword_1000C8AD8)
  {
    uint64_t v0 = objc_opt_new();
    uint64_t v1 = (void *)qword_1000C8AD8;
    qword_1000C8AD8 = v0;
  }
  if (!qword_1000C8AE0)
  {
    uint64_t v2 = objc_opt_new();
    id v3 = (void *)qword_1000C8AE0;
    qword_1000C8AE0 = v2;
  }
  if (!qword_1000C8AE8)
  {
    uint64_t v4 = objc_opt_new();
    id v5 = (void *)qword_1000C8AE8;
    qword_1000C8AE8 = v4;
  }
  if (!qword_1000C8AF0)
  {
    dispatch_source_t v6 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)&_dispatch_main_q);
    BOOL v7 = (void *)qword_1000C8AF0;
    qword_1000C8AF0 = (uint64_t)v6;

    uint64_t v8 = dword_1000C8AF8++;
    BOOL v9 = +[NSString stringWithFormat:@"JobTimer<%d> %@", v8, qword_1000C8AF0];
    uint64_t v10 = qword_1000C8AF0;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_10001F668;
    handler[3] = &unk_100095360;
    id v11 = v9;
    id v34 = v11;
    dispatch_source_set_event_handler(v10, handler);
    v31[0] = 0;
    v31[1] = v31;
    v31[2] = 0x2020000000;
    IOPMAssertionID v32 = 0;
    IOReturn v12 = IOPMAssertionCreateWithName(@"NoIdleSleepAssertion", 0xFFu, @"com.apple.printd - Printing in progress", &v32);
    if (v12)
    {
      id v13 = _PKLogCategory(PKLogCategoryProgress[0]);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 67109120;
        *(_DWORD *)&uint8_t buf[4] = v12;
        BOOL v14 = "Couldn't create power assertion: %d";
        id v15 = v13;
        os_log_type_t v16 = OS_LOG_TYPE_ERROR;
        uint32_t v17 = 8;
LABEL_13:
        _os_log_impl((void *)&_mh_execute_header, v15, v16, v14, buf, v17);
      }
    }
    else
    {
      id v13 = _PKLogCategory(PKLogCategoryProgress[0]);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        BOOL v14 = "Acquire power assertion";
        id v15 = v13;
        os_log_type_t v16 = OS_LOG_TYPE_DEFAULT;
        uint32_t v17 = 2;
        goto LABEL_13;
      }
    }

    *(void *)long long buf = 0;
    id v38 = buf;
    uint64_t v39 = 0x3032000000;
    id v40 = sub_10001F728;
    id v41 = sub_10001F738;
    id v42 = 0;
    id v18 = [objc_alloc((Class)NSXPCConnection) initWithServiceName:@"com.apple.printactivityservice"];
    BOOL v19 = (void *)*((void *)v38 + 5);
    *((void *)v38 + 5) = v18;

    id v20 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___PrintActivityServiceProtocol];
    [*((id *)v38 + 5) setRemoteObjectInterface:v20];

    [*((id *)v38 + 5) resume];
    id v21 = [*((id *)v38 + 5) remoteObjectProxy];
    [v21 startLiveActivity];

    BOOL v22 = qword_1000C8AF0;
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_10001F740;
    v27[3] = &unk_1000A0898;
    id v23 = v11;
    id v28 = v23;
    BOOL v29 = v31;
    id v30 = buf;
    dispatch_source_set_cancel_handler(v22, v27);
    id v24 = qword_1000C8AF0;
    dispatch_time_t v25 = dispatch_time(0, 1000000000);
    dispatch_source_set_timer(v24, v25, 0xFFFFFFFFFFFFFFFFLL, 0x2540BE400uLL);
    BOOL v26 = _PKLogCategory(PKLogCategoryProgress[0]);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)id v35 = 138543362;
      id v36 = v23;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "%{public}@: Resuming", v35, 0xCu);
    }

    dispatch_resume((dispatch_object_t)qword_1000C8AF0);
    _Block_object_dispose(buf, 8);

    _Block_object_dispose(v31, 8);
  }
}

void sub_10001A84C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,id a26)
{
  _Block_object_dispose(&a18, 8);

  _Unwind_Resume(a1);
}

void sub_10001A984(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10001AA6C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10001AD58(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

__CFString *usernameFromPreviouslyAuthedPrinterOrJustMobile(lite_printer_t *a1)
{
  uint64_t v1 = a1;
  uint64_t v2 = [(lite_printer_t *)v1 defaultCredentialForPrinter];

  if (v2)
  {
    id v3 = [(lite_printer_t *)v1 defaultCredentialForPrinter];
    uint64_t v4 = [v3 user];
  }
  else
  {
    uint64_t v4 = @"mobile";
  }

  return v4;
}

void sub_10001AE20(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001B0C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001B3B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  a9.super_class = (Class)lite_job_t;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_10001B64C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001B764(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_10001B780(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void sub_10001B8D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001B9E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001BB94(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001BC18(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  _Unwind_Resume(a1);
}

void sub_10001BF10(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _workAdded:dispatch_source_get_data(*(dispatch_source_t *)(a1 + 32))];
}

void sub_10001BF6C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

id sub_10001BF80(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = [WeakRetained _isCanceled:*(void *)(a1 + 32)];

  return v3;
}

void sub_10001BFC0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001BFD0(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _setCancelFlag:*(void *)(a1 + 32)];
}

void sub_10001C020(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10001C034(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _clearCancelFlag:*(void *)(a1 + 32)];
}

void sub_10001C084(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10001C098(uint64_t a1, uintptr_t a2)
{
}

uint64_t jobStateString(uint64_t a1)
{
  if ((unint64_t)(a1 - 3) >= 8) {
    sub_100064188();
  }
  return *((void *)&off_1000A08B8 + a1 - 3);
}

void sub_10001C320(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001C3C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001C588(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001C8D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_10001CA80(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001CB28(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001CCB0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001D228(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001D584(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_10001D5FC(void *a1, uint64_t a2, id a3)
{
  id result = [a1 writeIPPDocumentPayload:a2 length:a3];
  if (result != a3) {
    return 0;
  }
  return result;
}

void sub_10001D67C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001D6C4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001D730(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);

  _Unwind_Resume(a1);
}

void sub_10001D7B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  _Unwind_Resume(a1);
}

void sub_10001D82C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  _Unwind_Resume(a1);
}

void sub_10001D8A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  _Unwind_Resume(a1);
}

void sub_10001DA78(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t JobRequestAttributes_FromRequestParams::JobRequestAttributes_FromRequestParams(uint64_t a1, void *a2)
{
  id v4 = a2;
  *(void *)a1 = off_1000A0580;
  *(void *)(a1 + 16) = 0;
  *(void *)(a1 + 72) = 0;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)(a1 + 88) = 0u;
  *(_OWORD *)(a1 + 104) = 0u;
  *(void *)(a1 + 120) = 0;
  *(_OWORD *)(a1 + 136) = 0u;
  *(_OWORD *)(a1 + 152) = 0u;
  *(_OWORD *)(a1 + 168) = 0u;
  objc_storeStrong((id *)(a1 + 168), a2);
  uint64_t v5 = objc_opt_new();
  dispatch_source_t v6 = *(void **)(a1 + 176);
  *(void *)(a1 + 176) = v5;

  return a1;
}

void sub_10001DDD0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void JobRequestAttributes_FromRequestParams::~JobRequestAttributes_FromRequestParams(JobRequestAttributes_FromRequestParams *this)
{
  *(void *)this = off_1000A0580;
  uint64_t v2 = (void *)*((void *)this + 21);
  *((void *)this + 21) = 0;

  id v3 = (void *)*((void *)this + 22);
  *((void *)this + 22) = 0;
}

{
  uint64_t vars8;

  JobRequestAttributes_FromRequestParams::~JobRequestAttributes_FromRequestParams(this);

  operator delete();
}

id JobRequestAttributes_FromRequestParams::getMediaCol(id *this)
{
  return [this[21] MediaCol];
}

id JobRequestAttributes_FromRequestParams::getMediaName(id *this)
{
  return [this[21] Media];
}

id sub_10001DF94(uint64_t a1)
{
  if ([*(id *)(a1 + 176) containsObject:@"AppleImagePDFAnnotations"]) {
    return (id)*(unsigned __int8 *)(a1 + 8);
  }
  id v3 = *(void **)(a1 + 168);

  return [v3 AppleImagePDFAnnotations];
}

uint64_t sub_10001DFEC(uint64_t a1)
{
  if ([*(id *)(a1 + 176) containsObject:@"AppleImagePDFAnnotations"]) {
    return 1;
  }
  id v3 = *(void **)(a1 + 168);

  return (uint64_t)[v3 hasAppleImagePDFAnnotations];
}

id sub_10001E044(uint64_t a1, unsigned char *a2)
{
  id result = [*(id *)(a1 + 176) addObject:@"AppleImagePDFAnnotations"];
  *(unsigned char *)(a1 + 8) = *a2;
  return result;
}

id sub_10001E080(uint64_t a1)
{
  return [*(id *)(a1 + 176) removeObject:@"AppleImagePDFAnnotations"];
}

id sub_10001E090(id *a1)
{
  if ([a1[22] containsObject:@"AppleThumbnailPosition"])
  {
    id v2 = a1[2];
  }
  else
  {
    id v2 = [a1[21] AppleThumbnailPosition];
  }

  return v2;
}

uint64_t sub_10001E0EC(uint64_t a1)
{
  if ([*(id *)(a1 + 176) containsObject:@"AppleThumbnailPosition"]) {
    return 1;
  }
  id v3 = *(void **)(a1 + 168);

  return (uint64_t)[v3 hasAppleThumbnailPosition];
}

void sub_10001E144(uint64_t a1, void **a2)
{
  [*(id *)(a1 + 176) addObject:@"AppleThumbnailPosition"];
  id v4 = *a2;

  objc_storeStrong((id *)(a1 + 16), v4);
}

id sub_10001E190(uint64_t a1)
{
  return [*(id *)(a1 + 176) removeObject:@"AppleThumbnailPosition"];
}

id sub_10001E1A0(uint64_t a1)
{
  if ([*(id *)(a1 + 176) containsObject:@"AttributeFidelity"]) {
    return (id)*(unsigned __int8 *)(a1 + 24);
  }
  id v3 = *(void **)(a1 + 168);

  return [v3 AttributeFidelity];
}

uint64_t sub_10001E1F8(uint64_t a1)
{
  if ([*(id *)(a1 + 176) containsObject:@"AttributeFidelity"]) {
    return 1;
  }
  id v3 = *(void **)(a1 + 168);

  return (uint64_t)[v3 hasAttributeFidelity];
}

id sub_10001E250(uint64_t a1, unsigned char *a2)
{
  id result = [*(id *)(a1 + 176) addObject:@"AttributeFidelity"];
  *(unsigned char *)(a1 + 24) = *a2;
  return result;
}

id sub_10001E28C(uint64_t a1)
{
  return [*(id *)(a1 + 176) removeObject:@"AttributeFidelity"];
}

id sub_10001E29C(uint64_t a1)
{
  if ([*(id *)(a1 + 176) containsObject:@"Copies"]) {
    return (id)*(unsigned int *)(a1 + 28);
  }
  id v3 = *(void **)(a1 + 168);

  return [v3 Copies];
}

uint64_t sub_10001E2F4(uint64_t a1)
{
  if ([*(id *)(a1 + 176) containsObject:@"Copies"]) {
    return 1;
  }
  id v3 = *(void **)(a1 + 168);

  return (uint64_t)[v3 hasCopies];
}

id sub_10001E34C(uint64_t a1, _DWORD *a2)
{
  id result = [*(id *)(a1 + 176) addObject:@"Copies"];
  *(_DWORD *)(a1 + 28) = *a2;
  return result;
}

id sub_10001E388(uint64_t a1)
{
  return [*(id *)(a1 + 176) removeObject:@"Copies"];
}

id sub_10001E398(id *a1)
{
  if ([a1[22] containsObject:@"DocumentFormat"])
  {
    id v2 = a1[4];
  }
  else
  {
    id v2 = [a1[21] DocumentFormat];
  }

  return v2;
}

uint64_t sub_10001E3F4(uint64_t a1)
{
  if ([*(id *)(a1 + 176) containsObject:@"DocumentFormat"]) {
    return 1;
  }
  id v3 = *(void **)(a1 + 168);

  return (uint64_t)[v3 hasDocumentFormat];
}

void sub_10001E44C(uint64_t a1, void **a2)
{
  [*(id *)(a1 + 176) addObject:@"DocumentFormat"];
  id v4 = *a2;

  objc_storeStrong((id *)(a1 + 32), v4);
}

id sub_10001E498(uint64_t a1)
{
  return [*(id *)(a1 + 176) removeObject:@"DocumentFormat"];
}

id sub_10001E4A8(id *a1)
{
  if ([a1[22] containsObject:@"DocumentPassword"])
  {
    id v2 = a1[5];
  }
  else
  {
    id v2 = [a1[21] DocumentPassword];
  }

  return v2;
}

uint64_t sub_10001E504(uint64_t a1)
{
  if ([*(id *)(a1 + 176) containsObject:@"DocumentPassword"]) {
    return 1;
  }
  id v3 = *(void **)(a1 + 168);

  return (uint64_t)[v3 hasDocumentPassword];
}

void sub_10001E55C(uint64_t a1, void **a2)
{
  [*(id *)(a1 + 176) addObject:@"DocumentPassword"];
  id v4 = *a2;

  objc_storeStrong((id *)(a1 + 40), v4);
}

id sub_10001E5A8(uint64_t a1)
{
  return [*(id *)(a1 + 176) removeObject:@"DocumentPassword"];
}

id sub_10001E5B8(id *a1)
{
  if ([a1[22] containsObject:@"Finishings"])
  {
    id v2 = a1[6];
  }
  else
  {
    id v2 = [a1[21] Finishings];
  }

  return v2;
}

uint64_t sub_10001E614(uint64_t a1)
{
  if ([*(id *)(a1 + 176) containsObject:@"Finishings"]) {
    return 1;
  }
  id v3 = *(void **)(a1 + 168);

  return (uint64_t)[v3 hasFinishings];
}

void sub_10001E66C(uint64_t a1, void **a2)
{
  [*(id *)(a1 + 176) addObject:@"Finishings"];
  id v4 = *a2;

  objc_storeStrong((id *)(a1 + 48), v4);
}

id sub_10001E6B8(uint64_t a1)
{
  return [*(id *)(a1 + 176) removeObject:@"Finishings"];
}

id sub_10001E6C8(id *a1)
{
  if ([a1[22] containsObject:@"FinishingsCol"])
  {
    id v2 = a1[7];
  }
  else
  {
    id v2 = [a1[21] FinishingsCol];
  }

  return v2;
}

uint64_t sub_10001E724(uint64_t a1)
{
  if ([*(id *)(a1 + 176) containsObject:@"FinishingsCol"]) {
    return 1;
  }
  id v3 = *(void **)(a1 + 168);

  return (uint64_t)[v3 hasFinishingsCol];
}

void sub_10001E77C(uint64_t a1, void **a2)
{
  [*(id *)(a1 + 176) addObject:@"FinishingsCol"];
  id v4 = *a2;

  objc_storeStrong((id *)(a1 + 56), v4);
}

id sub_10001E7C8(uint64_t a1)
{
  return [*(id *)(a1 + 176) removeObject:@"FinishingsCol"];
}

id sub_10001E7D8(uint64_t a1)
{
  if ([*(id *)(a1 + 176) containsObject:@"FitToPage"]) {
    return (id)*(unsigned __int8 *)(a1 + 64);
  }
  id v3 = *(void **)(a1 + 168);

  return [v3 FitToPage];
}

uint64_t sub_10001E830(uint64_t a1)
{
  if ([*(id *)(a1 + 176) containsObject:@"FitToPage"]) {
    return 1;
  }
  id v3 = *(void **)(a1 + 168);

  return (uint64_t)[v3 hasFitToPage];
}

id sub_10001E888(uint64_t a1, unsigned char *a2)
{
  id result = [*(id *)(a1 + 176) addObject:@"FitToPage"];
  *(unsigned char *)(a1 + 64) = *a2;
  return result;
}

id sub_10001E8C4(uint64_t a1)
{
  return [*(id *)(a1 + 176) removeObject:@"FitToPage"];
}

id sub_10001E8D4(id *a1)
{
  if ([a1[22] containsObject:@"JobAccountID"])
  {
    id v2 = a1[9];
  }
  else
  {
    id v2 = [a1[21] JobAccountID];
  }

  return v2;
}

uint64_t sub_10001E930(uint64_t a1)
{
  if ([*(id *)(a1 + 176) containsObject:@"JobAccountID"]) {
    return 1;
  }
  id v3 = *(void **)(a1 + 168);

  return (uint64_t)[v3 hasJobAccountID];
}

void sub_10001E988(uint64_t a1, void **a2)
{
  [*(id *)(a1 + 176) addObject:@"JobAccountID"];
  id v4 = *a2;

  objc_storeStrong((id *)(a1 + 72), v4);
}

id sub_10001E9D4(uint64_t a1)
{
  return [*(id *)(a1 + 176) removeObject:@"JobAccountID"];
}

id sub_10001E9E4(id *a1)
{
  if ([a1[22] containsObject:@"JobName"])
  {
    id v2 = a1[17];
  }
  else
  {
    id v2 = [a1[21] JobName];
  }

  return v2;
}

uint64_t sub_10001EA40(uint64_t a1)
{
  if ([*(id *)(a1 + 176) containsObject:@"JobName"]) {
    return 1;
  }
  id v3 = *(void **)(a1 + 168);

  return (uint64_t)[v3 hasJobName];
}

void sub_10001EA98(uint64_t a1, void **a2)
{
  [*(id *)(a1 + 176) addObject:@"JobName"];
  id v4 = *a2;

  objc_storeStrong((id *)(a1 + 136), v4);
}

id sub_10001EAE4(uint64_t a1)
{
  return [*(id *)(a1 + 176) removeObject:@"JobName"];
}

id sub_10001EAF4(uint64_t a1)
{
  if ([*(id *)(a1 + 176) containsObject:@"OrientationRequested"]) {
    return (id)*(unsigned int *)(a1 + 80);
  }
  id v3 = *(void **)(a1 + 168);

  return [v3 OrientationRequested];
}

uint64_t sub_10001EB4C(uint64_t a1)
{
  if ([*(id *)(a1 + 176) containsObject:@"OrientationRequested"]) {
    return 1;
  }
  id v3 = *(void **)(a1 + 168);

  return (uint64_t)[v3 hasOrientationRequested];
}

id sub_10001EBA4(uint64_t a1, _DWORD *a2)
{
  id result = [*(id *)(a1 + 176) addObject:@"OrientationRequested"];
  *(_DWORD *)(a1 + 80) = *a2;
  return result;
}

id sub_10001EBE0(uint64_t a1)
{
  return [*(id *)(a1 + 176) removeObject:@"OrientationRequested"];
}

id sub_10001EBF0(id *a1)
{
  if ([a1[22] containsObject:@"OutputBin"])
  {
    id v2 = a1[11];
  }
  else
  {
    id v2 = [a1[21] OutputBin];
  }

  return v2;
}

uint64_t sub_10001EC4C(uint64_t a1)
{
  if ([*(id *)(a1 + 176) containsObject:@"OutputBin"]) {
    return 1;
  }
  id v3 = *(void **)(a1 + 168);

  return (uint64_t)[v3 hasOutputBin];
}

void sub_10001ECA4(uint64_t a1, void **a2)
{
  [*(id *)(a1 + 176) addObject:@"OutputBin"];
  id v4 = *a2;

  objc_storeStrong((id *)(a1 + 88), v4);
}

id sub_10001ECF0(uint64_t a1)
{
  return [*(id *)(a1 + 176) removeObject:@"OutputBin"];
}

id sub_10001ED00(id *a1)
{
  if ([a1[22] containsObject:@"OutputMode"])
  {
    id v2 = a1[12];
  }
  else
  {
    id v2 = [a1[21] OutputMode];
  }

  return v2;
}

uint64_t sub_10001ED5C(uint64_t a1)
{
  if ([*(id *)(a1 + 176) containsObject:@"OutputMode"]) {
    return 1;
  }
  id v3 = *(void **)(a1 + 168);

  return (uint64_t)[v3 hasOutputMode];
}

void sub_10001EDB4(uint64_t a1, void **a2)
{
  [*(id *)(a1 + 176) addObject:@"OutputMode"];
  id v4 = *a2;

  objc_storeStrong((id *)(a1 + 96), v4);
}

id sub_10001EE00(uint64_t a1)
{
  return [*(id *)(a1 + 176) removeObject:@"OutputMode"];
}

id sub_10001EE10(id *a1)
{
  if ([a1[22] containsObject:@"PageRanges"])
  {
    id v2 = a1[13];
  }
  else
  {
    id v2 = [a1[21] PageRanges];
  }

  return v2;
}

uint64_t sub_10001EE6C(uint64_t a1)
{
  if ([*(id *)(a1 + 176) containsObject:@"PageRanges"]) {
    return 1;
  }
  id v3 = *(void **)(a1 + 168);

  return (uint64_t)[v3 hasPageRanges];
}

void sub_10001EEC4(uint64_t a1, void **a2)
{
  [*(id *)(a1 + 176) addObject:@"PageRanges"];
  id v4 = *a2;

  objc_storeStrong((id *)(a1 + 104), v4);
}

id sub_10001EF10(uint64_t a1)
{
  return [*(id *)(a1 + 176) removeObject:@"PageRanges"];
}

id sub_10001EF20(id *a1)
{
  if ([a1[22] containsObject:@"PresetName"])
  {
    id v2 = a1[14];
  }
  else
  {
    id v2 = [a1[21] PresetName];
  }

  return v2;
}

uint64_t sub_10001EF7C(uint64_t a1)
{
  if ([*(id *)(a1 + 176) containsObject:@"PresetName"]) {
    return 1;
  }
  id v3 = *(void **)(a1 + 168);

  return (uint64_t)[v3 hasPresetName];
}

void sub_10001EFD4(uint64_t a1, void **a2)
{
  [*(id *)(a1 + 176) addObject:@"PresetName"];
  id v4 = *a2;

  objc_storeStrong((id *)(a1 + 112), v4);
}

id sub_10001F020(uint64_t a1)
{
  return [*(id *)(a1 + 176) removeObject:@"PresetName"];
}

id sub_10001F030(id *a1)
{
  if ([a1[22] containsObject:@"PrintColorMode"])
  {
    id v2 = a1[15];
  }
  else
  {
    id v2 = [a1[21] PrintColorMode];
  }

  return v2;
}

uint64_t sub_10001F08C(uint64_t a1)
{
  if ([*(id *)(a1 + 176) containsObject:@"PrintColorMode"]) {
    return 1;
  }
  id v3 = *(void **)(a1 + 168);

  return (uint64_t)[v3 hasPrintColorMode];
}

void sub_10001F0E4(uint64_t a1, void **a2)
{
  [*(id *)(a1 + 176) addObject:@"PrintColorMode"];
  id v4 = *a2;

  objc_storeStrong((id *)(a1 + 120), v4);
}

id sub_10001F130(uint64_t a1)
{
  return [*(id *)(a1 + 176) removeObject:@"PrintColorMode"];
}

id sub_10001F140(uint64_t a1)
{
  if ([*(id *)(a1 + 176) containsObject:@"PrintQuality"]) {
    return (id)*(unsigned int *)(a1 + 128);
  }
  id v3 = *(void **)(a1 + 168);

  return [v3 PrintQuality];
}

uint64_t sub_10001F198(uint64_t a1)
{
  if ([*(id *)(a1 + 176) containsObject:@"PrintQuality"]) {
    return 1;
  }
  id v3 = *(void **)(a1 + 168);

  return (uint64_t)[v3 hasPrintQuality];
}

id sub_10001F1F0(uint64_t a1, _DWORD *a2)
{
  id result = [*(id *)(a1 + 176) addObject:@"PrintQuality"];
  *(_DWORD *)(a1 + 128) = *a2;
  return result;
}

id sub_10001F22C(uint64_t a1)
{
  return [*(id *)(a1 + 176) removeObject:@"PrintQuality"];
}

id sub_10001F23C(id *a1)
{
  if ([a1[22] containsObject:@"PrintScaling"])
  {
    id v2 = a1[18];
  }
  else
  {
    id v2 = [a1[21] PrintScaling];
  }

  return v2;
}

uint64_t sub_10001F298(uint64_t a1)
{
  if ([*(id *)(a1 + 176) containsObject:@"PrintScaling"]) {
    return 1;
  }
  id v3 = *(void **)(a1 + 168);

  return (uint64_t)[v3 hasPrintScaling];
}

void sub_10001F2F0(uint64_t a1, void **a2)
{
  [*(id *)(a1 + 176) addObject:@"PrintScaling"];
  id v4 = *a2;

  objc_storeStrong((id *)(a1 + 144), v4);
}

id sub_10001F33C(uint64_t a1)
{
  return [*(id *)(a1 + 176) removeObject:@"PrintScaling"];
}

id sub_10001F34C(uint64_t a1)
{
  if ([*(id *)(a1 + 176) containsObject:@"RasterFeedOrientation"]) {
    return (id)*(unsigned int *)(a1 + 132);
  }
  id v3 = *(void **)(a1 + 168);

  return [v3 RasterFeedOrientation];
}

uint64_t sub_10001F3A4(uint64_t a1)
{
  if ([*(id *)(a1 + 176) containsObject:@"RasterFeedOrientation"]) {
    return 1;
  }
  id v3 = *(void **)(a1 + 168);

  return (uint64_t)[v3 hasRasterFeedOrientation];
}

id sub_10001F3FC(uint64_t a1, _DWORD *a2)
{
  id result = [*(id *)(a1 + 176) addObject:@"RasterFeedOrientation"];
  *(_DWORD *)(a1 + 132) = *a2;
  return result;
}

id sub_10001F438(uint64_t a1)
{
  return [*(id *)(a1 + 176) removeObject:@"RasterFeedOrientation"];
}

id sub_10001F448(id *a1)
{
  if ([a1[22] containsObject:@"Sides"])
  {
    id v2 = a1[19];
  }
  else
  {
    id v2 = [a1[21] Sides];
  }

  return v2;
}

uint64_t sub_10001F4A4(uint64_t a1)
{
  if ([*(id *)(a1 + 176) containsObject:@"Sides"]) {
    return 1;
  }
  id v3 = *(void **)(a1 + 168);

  return (uint64_t)[v3 hasSides];
}

void sub_10001F4FC(uint64_t a1, void **a2)
{
  [*(id *)(a1 + 176) addObject:@"Sides"];
  id v4 = *a2;

  objc_storeStrong((id *)(a1 + 152), v4);
}

id sub_10001F548(uint64_t a1)
{
  return [*(id *)(a1 + 176) removeObject:@"Sides"];
}

id sub_10001F558(id *a1)
{
  if ([a1[22] containsObject:@"Media"])
  {
    id v2 = a1[20];
  }
  else
  {
    id v2 = [a1[21] Media];
  }

  return v2;
}

uint64_t sub_10001F5B4(uint64_t a1)
{
  if ([*(id *)(a1 + 176) containsObject:@"Media"]) {
    return 1;
  }
  id v3 = *(void **)(a1 + 168);

  return (uint64_t)[v3 hasMedia];
}

void sub_10001F60C(uint64_t a1, void **a2)
{
  [*(id *)(a1 + 176) addObject:@"Media"];
  id v4 = *a2;

  objc_storeStrong((id *)(a1 + 160), v4);
}

id sub_10001F658(uint64_t a1)
{
  return [*(id *)(a1 + 176) removeObject:@"Media"];
}

id sub_10001F668(uint64_t a1)
{
  id v2 = _PKLogCategory(PKLogCategoryProgress[0]);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138543362;
    uint64_t v6 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%{public}@: Checking Jobs", (uint8_t *)&v5, 0xCu);
  }

  return +[lite_job_t checkJobsOnMainQueue];
}

uint64_t sub_10001F728(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10001F738(uint64_t a1)
{
}

id sub_10001F740(void *a1)
{
  id v2 = _PKLogCategory(PKLogCategoryProgress[0]);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = a1[4];
    int v7 = 138543362;
    uint64_t v8 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%{public}@: Cancel - release system resources", (uint8_t *)&v7, 0xCu);
  }

  IOPMAssertionID v4 = *(_DWORD *)(*(void *)(a1[5] + 8) + 24);
  if (v4)
  {
    IOPMAssertionRelease(v4);
    *(_DWORD *)(*(void *)(a1[5] + 8) + 24) = 0;
  }
  int v5 = [*(id *)(*(void *)(a1[6] + 8) + 40) remoteObjectProxy];
  [v5 stopLiveActivity];

  return [*(id *)(*(void *)(a1[6] + 8) + 40) invalidate];
}

void sub_10001F844(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id PKOpenURL(uint64_t a1)
{
  uint64_t v3 = +[LSApplicationWorkspace defaultWorkspace];
  id v4 = [v3 openURL:a1];

  return v4;
}

void sub_10001F8BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

_UNKNOWN **PKDefaultPortForScheme(void *a1)
{
  id v1 = a1;
  id v2 = [v1 lowercaseString];
  uint64_t v3 = [&off_1000B9068 objectForKeyedSubscript:v2];

  if (v3)
  {
    id v4 = v3;
  }
  else
  {
    int v5 = _PKLogCategory(PKLogCategoryNetwork[0]);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v7 = 138412290;
      id v8 = v1;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Unknown scheme %@ - defaulting to 631", (uint8_t *)&v7, 0xCu);
    }

    id v4 = &off_1000B9168;
  }

  return v4;
}

void sub_10001F9E4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id PKURLWithString(void *a1)
{
  id v1 = a1;
  if (v1)
  {
    id v2 = +[NSURLComponents componentsWithString:v1 encodingInvalidCharacters:0];
    if (!v2)
    {
      id v2 = +[NSURLComponents componentsWithString:v1 encodingInvalidCharacters:1];
    }
    uint64_t v3 = [v2 port];

    if (!v3)
    {
      id v4 = [v2 scheme];
      int v5 = PKDefaultPortForScheme(v4);
      [v2 setPort:v5];
    }
    uint64_t v6 = [v2 URL];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

void sub_10001FBD8()
{
}

id PKURLWithUTF8String(uint64_t a1)
{
  if (a1)
  {
    id v1 = +[NSString stringWithUTF8String:a1];
    id v2 = PKURLWithString(v1);
  }
  else
  {
    id v2 = 0;
  }

  return v2;
}

void sub_10001FC58(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id PKURLWithComponents(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a1;
  id v8 = a2;
  id v9 = a3;
  id v10 = a4;
  id v11 = objc_alloc_init((Class)NSURLComponents);
  IOReturn v12 = [v7 lowercaseString];
  [v11 setScheme:v12];

  [v11 setHost:v8];
  id v13 = v9;
  if (!v9)
  {
    IOReturn v12 = [v11 scheme];
    id v13 = PKDefaultPortForScheme(v12);
  }
  [v11 setPort:v13];
  if (!v9)
  {
  }
  if ([v10 length])
  {
    if ([v10 characterAtIndex:0] != 47)
    {
      uint64_t v14 = [@"/" stringByAppendingString:v10];

      id v10 = (id)v14;
    }
    [v11 setPath:v10];
  }
  id v15 = [v11 URL];

  return v15;
}

void sub_10001FE00(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, long long a9)
{
  if (a2 == 1)
  {
    objc_begin_catch(a1);
    uint32_t v17 = _PKLogCategory(PKLogCategoryDefault[0]);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      LODWORD(a9) = 138543618;
      *(void *)((char *)&a9 + 4) = v10;
      WORD6(a9) = 2114;
      *(void *)((char *)&a9 + 14) = v12;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "NSURLComponents failed for host %{public}@ path %{public}@", (uint8_t *)&a9, 0x16u);
    }

    objc_end_catch();
    JUMPOUT(0x10001FDA0);
  }

  _Unwind_Resume(a1);
}

id PKURLByReplacingScheme(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if (v4)
  {
    int v5 = +[NSURLComponents componentsWithURL:v4 resolvingAgainstBaseURL:1];
    uint64_t v6 = [v3 lowercaseString];
    [v5 setScheme:v6];

    id v7 = [v5 port];

    if (!v7)
    {
      id v8 = [v5 scheme];
      id v9 = PKDefaultPortForScheme(v8);
      [v5 setPort:v9];
    }
    id v10 = [v5 URL];
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

void sub_1000200DC()
{
}

uint64_t pwgInitSize(uint64_t a1, uint64_t a2, unsigned int *a3)
{
  uint64_t v3 = 0;
  if (a1 && a2 && a3)
  {
    *(void *)a1 = 0;
    *(void *)(a1 + 8) = 0;
    *(void *)(a1 + 16) = 0;
    *a3 = 0;
    id v7 = (**(void (***)(uint64_t))a2)(a2);
    id v8 = v7;
    if (v7)
    {
      id v9 = [v7 mediaSize];
      id v10 = v9;
      if (!v9)
      {
        uint64_t v14 = _PKLogCategory(PKLogCategoryDefault[0]);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)BOOL v19 = 136315650;
          *(void *)&void v19[4] = "pwgInitSize";
          *(_WORD *)&v19[12] = 1024;
          *(_DWORD *)&v19[14] = 1280;
          *(_WORD *)&v19[18] = 2080;
          *(void *)&v19[20] = "Missing media-size in media-col.";
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%s: setting ipp status %d error message %s", v19, 0x1Cu);
        }
        uint64_t v3 = 0;
        id v10 = v14;
        goto LABEL_20;
      }
      *(_DWORD *)a1 = [v9 xDimension];
      *(_DWORD *)(a1 + 4) = [v10 yDimension];
      memset(v19, 0, 24);
      unsigned int v11 = [v8 getMargins:v19];
      *a3 = v11;
      if (v11) {
        *(_OWORD *)(a1 + 8) = *(_OWORD *)&v19[8];
      }
      goto LABEL_12;
    }
    IOReturn v12 = (*(void (**)(uint64_t))(*(void *)a2 + 8))(a2);
    id v10 = v12;
    if (v12)
    {
      id v13 = pwgMediaForPWG(v12, (uint64_t)v20);
      if (v13 || (id v13 = sub_100021004(v10)) != 0)
      {
LABEL_11:
        *(void *)a1 = v13[3];
LABEL_12:
        uint64_t v3 = 1;
LABEL_20:

        return v3;
      }
      id v13 = sub_10002071C(v10, (uint64_t)v20);
      if (v13)
      {
        uint32_t v17 = [v10 lowercaseString];
        unsigned int v18 = [v17 hasSuffix:@".FullBleed"];

        if (v18) {
          *a3 = 1;
        }
        goto LABEL_11;
      }
      id v15 = _PKLogCategory(PKLogCategoryDefault[0]);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)BOOL v19 = 136315650;
        *(void *)&void v19[4] = "pwgInitSize";
        *(_WORD *)&v19[12] = 1024;
        *(_DWORD *)&v19[14] = 1280;
        *(_WORD *)&v19[18] = 2080;
        *(void *)&v19[20] = "Unsupported media value.";
        goto LABEL_18;
      }
    }
    else
    {
      id v15 = _PKLogCategory(PKLogCategoryDefault[0]);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)BOOL v19 = 136315650;
        *(void *)&void v19[4] = "pwgInitSize";
        *(_WORD *)&v19[12] = 1024;
        *(_DWORD *)&v19[14] = 1280;
        *(_WORD *)&v19[18] = 2080;
        *(void *)&v19[20] = "Missing media or media-col.";
LABEL_18:
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%s: setting ipp status %d error message %s", v19, 0x1Cu);
      }
    }

    uint64_t v3 = 0;
    goto LABEL_20;
  }
  return v3;
}

void sub_100020460(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

char **pwgMediaForPWG(void *a1, uint64_t a2)
{
  id v3 = a1;
  id v4 = v3;
  int v5 = 0;
  if (v3)
  {
    if (a2)
    {
      *(_OWORD *)(a2 + 112) = 0u;
      *(_OWORD *)(a2 + 128) = 0u;
      *(_OWORD *)(a2 + 80) = 0u;
      *(_OWORD *)(a2 + 96) = 0u;
      *(_OWORD *)(a2 + 48) = 0u;
      *(_OWORD *)(a2 + 64) = 0u;
      *(_OWORD *)(a2 + 16) = 0u;
      *(_OWORD *)(a2 + 32) = 0u;
      *(_OWORD *)a2 = 0u;
      int v5 = sub_100020AAC(v3);
      if (!v5)
      {
        uint64_t v6 = (char *)[v4 UTF8String];
        id v7 = strchr(v6, 95);
        if (!v7) {
          goto LABEL_21;
        }
        id v8 = strchr(v7 + 1, 95);
        if (!v8) {
          goto LABEL_21;
        }
        id v9 = v8;
        id v10 = (unsigned __int8 *)(v8 + 1);
        unsigned int v11 = strchr(v8 + 1, 95);
        if (!v11) {
          unsigned int v11 = (char *)&v9[strlen(v9)];
        }
        IOReturn v12 = v11 - 2;
        id v21 = v10;
        if (v11 - 2 >= (char *)v10 && (!strcmp(v11 - 2, "in") || !strncmp(v12, "in_", 3uLL)))
        {
          int v14 = 0;
          int v13 = 2540;
        }
        else
        {
          int v13 = 100;
          int v14 = 1;
        }
        int v15 = sub_100020B00(v10, &v21, v13, 1);
        if (v21 && *v21 == 120 && (int v16 = v15, v17 = sub_100020B00(v21 + 1, &v21, v13, 1), v21))
        {
          int v18 = v17;
          if (!strncmp(v6, "disc_", 5uLL)) {
            int v19 = v18;
          }
          else {
            int v19 = v16;
          }
          *(_DWORD *)(a2 + 24) = v19;
          *(_DWORD *)(a2 + 28) = v18;
          strlcpy((char *)(a2 + 32), v6, 0x41uLL);
          *(void *)a2 = a2 + 32;
          if (v14)
          {
            sub_100020BE8(__str, 0x20uLL, v19);
            sub_100020BE8(v22, 0x20uLL, v18);
            snprintf((char *)(a2 + 97), 0x29uLL, "%sx%smm");
          }
          else
          {
            sub_100020C94(__str, 0x20uLL, v19);
            sub_100020C94(v22, 0x20uLL, v18);
            snprintf((char *)(a2 + 97), 0x29uLL, "%sx%s");
          }
          *(void *)(a2 + 16) = a2 + 97;
          int v5 = (char **)a2;
        }
        else
        {
LABEL_21:
          int v5 = 0;
        }
      }
    }
  }

  return v5;
}

void sub_1000206FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

char **sub_10002071C(void *a1, uint64_t a2)
{
  id v3 = a1;
  id v4 = v3;
  if (!a2) {
    goto LABEL_45;
  }
  *(_OWORD *)(a2 + 112) = 0u;
  *(_OWORD *)(a2 + 128) = 0u;
  *(_OWORD *)(a2 + 80) = 0u;
  *(_OWORD *)(a2 + 96) = 0u;
  *(_OWORD *)(a2 + 48) = 0u;
  *(_OWORD *)(a2 + 64) = 0u;
  *(_OWORD *)(a2 + 16) = 0u;
  *(_OWORD *)(a2 + 32) = 0u;
  *(_OWORD *)a2 = 0u;
  int v5 = sub_1000210DC(v3);
  if (v5) {
    goto LABEL_46;
  }
  uint64_t v6 = (const char *)[v4 UTF8String];
  int v7 = strncasecmp(v6, "Custom.", 7uLL);
  int v8 = v7;
  id v9 = (uint8_t *)(v6 + 7);
  if (v7) {
    id v10 = (unsigned __int8 *)v6;
  }
  else {
    id v10 = (unsigned __int8 *)(v6 + 7);
  }
  if (v7) {
    int v11 = 1;
  }
  else {
    int v11 = 72;
  }
  dispatch_time_t v25 = v10;
  IOReturn v12 = strchr((char *)v10, 46);
  if (v12)
  {
    while ((_DefaultRuneLocale.__runetype[v12[1]] & 0x400) != 0)
    {
      IOReturn v12 = strchr(v12 + 1, 46);
      if (!v12) {
        goto LABEL_12;
      }
    }
  }
  else
  {
LABEL_12:
    IOReturn v12 = (char *)&v10[strlen((const char *)v10)];
  }
  if (v12 - 2 <= (char *)v10) {
    goto LABEL_32;
  }
  uint64_t v13 = *(v12 - 2);
  BOOL v14 = v13 == 46;
  __uint32_t v15 = (_DefaultRuneLocale.__runetype[v13] >> 10) & 1;
  if (v14) {
    __uint32_t v15 = 1;
  }
  if (v15) {
    int v16 = v12 - 1;
  }
  else {
    int v16 = v12 - 2;
  }
  if (!strncasecmp(v16, "cm", 2uLL))
  {
    int v11 = 1;
    int v17 = 1000;
    goto LABEL_33;
  }
  if (!strncasecmp(v16, "ft", 2uLL))
  {
    int v11 = 1;
    int v17 = 30480;
    goto LABEL_33;
  }
  if (!strncasecmp(v16, "in", 2uLL))
  {
    int v11 = 1;
LABEL_32:
    int v17 = 2540;
    goto LABEL_33;
  }
  if (!strncasecmp(v16, "mm", 2uLL))
  {
    int v11 = 1;
    int v17 = 100;
    goto LABEL_33;
  }
  if ((*(unsigned __int8 *)v16 | 0x20) != 0x6D)
  {
    if (!strncasecmp(v16, "pt", 2uLL)) {
      int v11 = 72;
    }
    goto LABEL_32;
  }
  int v17 = 100000;
  int v11 = 1;
LABEL_33:
  uint64_t v18 = sub_100020B00(v10, &v25, v17, v11);
  int v5 = 0;
  if (!v25 || v25 <= (unsigned __int8 *)v6) {
    goto LABEL_46;
  }
  if (*v25 != 120 || (uint64_t v19 = v18, v20 = sub_100020B00(v25 + 1, &v25, v17, v11), !v25))
  {
LABEL_45:
    int v5 = 0;
    goto LABEL_46;
  }
  int v21 = v20;
  *(_DWORD *)(a2 + 24) = v19;
  *(_DWORD *)(a2 + 28) = v20;
  *(void *)a2 = a2 + 32;
  if (v8) {
    BOOL v22 = 0;
  }
  else {
    BOOL v22 = "custom";
  }
  if (v8) {
    id v23 = 0;
  }
  else {
    id v23 = v9;
  }
  sub_100021130((char *)(a2 + 32), v22, v23, v19, v20);
  if (((int)v19 % 635) | (v21 % 635))
  {
    sub_100020BE8(__str, 0x20uLL, v19);
    sub_100020BE8(v26, 0x20uLL, v21);
    snprintf((char *)(a2 + 97), 0x29uLL, "%sx%smm");
  }
  else
  {
    sub_100020C94(__str, 0x20uLL, v19);
    sub_100020C94(v26, 0x20uLL, v21);
    snprintf((char *)(a2 + 97), 0x29uLL, "%sx%s");
  }
  *(void *)(a2 + 16) = a2 + 97;
  int v5 = (char **)a2;
LABEL_46:

  return v5;
}

void sub_100020A8C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

char **sub_100020AAC(void *a1)
{
  id v1 = a1;
  id v2 = sub_100021058((const char *)[v1 UTF8String], (uint64_t)&stru_1000A2158);

  return v2;
}

void sub_100020AF0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_100020B00(unsigned __int8 *a1, unsigned __int8 **a2, int a3, int a4)
{
  int v4 = *a1;
  if ((v4 - 48) > 9)
  {
    int v5 = 0;
  }
  else
  {
    int v5 = 0;
    int v6 = *a1;
    do
    {
      int v7 = *++a1;
      int v4 = v7;
      int v5 = v6 + 10 * v5 - 48;
      int v6 = v7;
    }
    while ((v7 - 48) < 0xA);
  }
  if (v4 == 46)
  {
    int v8 = 10 * a3 * a4;
    id v9 = a1 + 1;
    if (v8 < 2)
    {
      int v10 = 0;
      int i = 1;
    }
    else
    {
      int v10 = 0;
      for (int i = 1; i < v8; i *= 10)
      {
        int v12 = *v9;
        if ((v12 - 48) > 9) {
          break;
        }
        int v10 = v12 + 10 * v10 - 48;
        ++v9;
      }
    }
    a1 = v9 - 1;
    do
      int v13 = *++a1;
    while ((v13 - 48) < 0xA);
  }
  else
  {
    int v10 = 0;
    int i = 1;
  }
  if (a2) {
    *a2 = a1;
  }
  return (v10 * a3 / a4 / i + v5 * a3 / a4);
}

char *sub_100020BE8(char *__str, size_t a2, int a3)
{
  if (a3 % 100)
  {
    if ((a3 % 100) == 10
                                      * ((((103 * (a3 % 100)) & 0x8000) != 0)
                                       + ((103 * (a3 % 100)) >> 10)))
      snprintf(__str, a2, "%d.%01d");
    else {
      snprintf(__str, a2, "%d.%02d");
    }
  }
  else
  {
    snprintf(__str, a2, "%d");
  }
  return __str;
}

char *sub_100020C94(char *__str, size_t a2, int a3)
{
  int v4 = (1000 * a3 + 1270) / 2540 % 1000;
  if (v4)
  {
    if ((__int16)v4 % 10)
    {
      snprintf(__str, a2, "%d.%03d");
    }
    else if ((__int16)v4 % 100)
    {
      snprintf(__str, a2, "%d.%02d");
    }
    else
    {
      snprintf(__str, a2, "%d.%01d");
    }
  }
  else
  {
    snprintf(__str, a2, "%d");
  }
  return __str;
}

char **pwgMediaForSize(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id result = 0;
  if ((int)a1 >= 1)
  {
    unsigned int v5 = a2;
    if ((int)a2 >= 1)
    {
      if (a3)
      {
        id result = 0;
        *(_OWORD *)(a3 + 112) = 0u;
        *(_OWORD *)(a3 + 128) = 0u;
        *(_OWORD *)(a3 + 80) = 0u;
        *(_OWORD *)(a3 + 96) = 0u;
        *(_OWORD *)(a3 + 48) = 0u;
        *(_OWORD *)(a3 + 64) = 0u;
        *(_OWORD *)(a3 + 16) = 0u;
        *(_OWORD *)(a3 + 32) = 0u;
        int v7 = &off_1000A0B38;
        int v8 = 999;
        unsigned int v9 = 177;
        int v10 = 999;
        *(_OWORD *)a3 = 0u;
        do
        {
          int v11 = *((_DWORD *)v7 + 7);
          int v12 = *((_DWORD *)v7 + 6) - a1;
          if (v12) {
            BOOL v13 = 0;
          }
          else {
            BOOL v13 = v11 == a2;
          }
          if (v13) {
            return v7;
          }
          int v14 = v11 - a2;
          if (v14 < 0) {
            int v14 = -v14;
          }
          if (v12 < 0) {
            int v12 = a1 - *((_DWORD *)v7 + 6);
          }
          if (v12 <= 0x32 && v14 <= 0x32 && v12 <= v10 && v14 <= v8)
          {
            id result = v7;
            int v10 = v12;
            int v8 = v14;
          }
          v7 += 4;
          --v9;
        }
        while (v9 > 1);
        if (!result)
        {
          sub_100021130((char *)(a3 + 32), "custom", 0, a1, a2);
          *(void *)a3 = a3 + 32;
          *(_DWORD *)(a3 + 24) = a1;
          *(_DWORD *)(a3 + 28) = v5;
          if ((v5 % 0x27B) | (a1 % 0x27B))
          {
            sub_100020BE8(__str, 0x20uLL, a1);
            sub_100020BE8(v19, 0x20uLL, v5);
            snprintf((char *)(a3 + 97), 0x29uLL, "%sx%smm");
          }
          else
          {
            sub_100020C94(__str, 0x20uLL, a1);
            sub_100020C94(v19, 0x20uLL, v5);
            snprintf((char *)(a3 + 97), 0x29uLL, "%sx%s");
          }
          *(void *)(a3 + 16) = a3 + 97;
          return (char **)a3;
        }
      }
    }
  }
  return result;
}

id pwgCanonicalName(NSString *a1)
{
  id v1 = a1;
  id v2 = sub_100021058([(NSString *)v1 UTF8String], (uint64_t)&stru_1000A2158);
  if (v2)
  {
    id v3 = +[NSString stringWithUTF8String:*v2];
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

void sub_100020FF4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

char **sub_100021004(void *a1)
{
  id v1 = a1;
  id v2 = sub_100021058((const char *)[v1 UTF8String], (uint64_t)&stru_1000A0B18);

  return v2;
}

void sub_100021048(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

char **sub_100021058(const char *a1, uint64_t a2)
{
  int v4 = &off_1000A0B38;
  while (1)
  {
    unsigned int v5 = (const char *)(*(uint64_t (**)(uint64_t, char **))(a2 + 16))(a2, v4);
    if (v5)
    {
      if (!strcmp(v5, a1)) {
        break;
      }
    }
    v4 += 4;
    if (v4 >= (char **)&stru_1000A2138) {
      return 0;
    }
  }
  return v4;
}

const char *__cdecl sub_1000210D4(id a1, const pwg_media_s *a2)
{
  return a2->legacy;
}

char **sub_1000210DC(void *a1)
{
  id v1 = a1;
  id v2 = sub_100021058((const char *)[v1 UTF8String], (uint64_t)&stru_1000A2138);

  return v2;
}

void sub_100021120(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100021130(char *a1, char *__s1, uint8_t *a3, uint64_t a4, uint64_t a5)
{
  if (!a1 || (uint64_t v6 = a4, *a1 = 0, ((a5 | a4) & 0x80000000) != 0))
  {
    BOOL v13 = _PKLogCategory(PKLogCategoryDefault[0]);
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
LABEL_18:

      return;
    }
    *(_DWORD *)long long buf = 136315650;
    id v30 = "pwgFormatSizeName";
    __int16 v31 = 1024;
    int v32 = 1280;
    __int16 v33 = 2080;
    id v34 = "Invalid media name arguments.";
    int v14 = buf;
LABEL_17:
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%s: setting ipp status %d error message %s", v14, 0x1Cu);
    goto LABEL_18;
  }
  int v8 = a3;
  unsigned int v9 = __s1;
  if (a3)
  {
    int v10 = *a3;
    if (*a3)
    {
      uint64_t v11 = 1;
      while ((v10 - 97) < 0x1A || (v10 - 48) < 0xA || (v10 - 45) < 2)
      {
        int v10 = a3[v11++];
        if (!v10) {
          goto LABEL_10;
        }
      }
      BOOL v13 = _PKLogCategory(PKLogCategoryDefault[0]);
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        goto LABEL_18;
      }
      int v23 = 136315650;
      id v24 = "pwgFormatSizeName";
      __int16 v25 = 1024;
      int v26 = 1280;
      __int16 v27 = 2080;
      id v28 = "Invalid media name arguments.";
      int v14 = (uint8_t *)&v23;
      goto LABEL_17;
    }
LABEL_10:
    if (__s1) {
      goto LABEL_11;
    }
  }
  else
  {
    int v8 = buf;
    if (__s1)
    {
LABEL_11:
      if (!strcmp(__s1, "disc")) {
        uint64_t v6 = 4000;
      }
      else {
        uint64_t v6 = v6;
      }
      int v12 = v9;
      goto LABEL_21;
    }
  }
  int v12 = "oe";
  unsigned int v9 = "om";
LABEL_21:
  if ((v6 % 0x27B) | (a5 % 0x27B)) {
    __uint32_t v15 = "mm";
  }
  else {
    __uint32_t v15 = "in";
  }
  int v16 = *(unsigned __int16 *)v15;
  int v17 = *((unsigned __int8 *)v15 + 2);
  int v18 = v16 ^ 0x6E69 | v17;
  if (v18) {
    uint64_t v19 = sub_100020BE8;
  }
  else {
    uint64_t v19 = sub_100020C94;
  }
  if (!v18) {
    unsigned int v9 = v12;
  }
  v19((char *)buf, 28, v6);
  size_t v20 = strlen((const char *)buf);
  buf[v20] = 120;
  int v21 = (const char *)&buf[v20 + 1];
  v19((char *)v21, 27 - v20, a5);
  BOOL v22 = (char *)&v21[strlen(v21)];
  *(_WORD *)BOOL v22 = v16;
  v22[2] = v17;
  snprintf(a1, 0x41uLL, "%s_%s_%s", v9, (const char *)v8, (const char *)buf);
}

const char *__cdecl sub_100021430(id a1, const pwg_media_s *a2)
{
  return a2->ppd;
}

const char *__cdecl sub_100021438(id a1, const pwg_media_s *a2)
{
  return a2->pwg;
}

uint64_t liteUpdateJobAttrs(void *a1)
{
  id v1 = a1;
  id v2 = [v1 spoolDocumentFormat];
  unsigned int v3 = [v2 caseInsensitiveCompare:@"application/pdf"];

  if (v3)
  {
    int v4 = [v1 spoolDocumentFormat];
    unsigned int v5 = [v4 caseInsensitiveCompare:@"image/urf"];

    if (!v5)
    {
      uint64_t v19 = 0;
      goto LABEL_152;
    }
    document = 0;
    LODWORD(v6) = 1;
LABEL_14:
    id v13 = v1;
    LODWORD(theDict) = 0;
    if (sub_10002770C(v13, v6, (signed int *)&theDict))
    {
      id v14 = objc_msgSend(v13, "request_attrs");
      __uint32_t v15 = (*(void (**)(id))(*(void *)v14 + 672))(v14);
      int v16 = v15;
      uint64_t v17 = theDict;
      if (v15)
      {
        if (theDict == 1 && [v15 compare:@"one-sided"])
        {
          id v18 = objc_msgSend(v13, "request_attrs");
          *(void *)&password[0].a = @"one-sided";
          (*(void (**)(id, CGAffineTransform *))(*(void *)v18 + 688))(v18, password);

          uint64_t v19 = 1;
        }
        else
        {
          uint64_t v19 = 0;
        }
        unsigned int v23 = [v16 compare:@"one-sided"];
        if ((v17 & 1) != 0 && v23)
        {
          id v24 = objc_msgSend(v13, "request_attrs");
          if ((*(int (**)(id))(*(void *)v24 + 128))(v24) <= 1) {
            uint64_t v17 = v17;
          }
          else {
            uint64_t v17 = (v17 + 1);
          }
        }
      }
      else
      {
        uint64_t v19 = 0;
      }
      [v13 setNumberOfSheetsPerCopy:v17];
    }
    else
    {
      uint64_t v19 = 1035;
    }

    if ((int)v19 >= 2)
    {
      if (document) {
        CGPDFDocumentRelease(document);
      }
      goto LABEL_152;
    }
    __int16 v25 = [v13 spoolDocumentFormat];
    BOOL v26 = [v25 caseInsensitiveCompare:@"application/pdf"] == 0;

    if (v26)
    {
      id v41 = v13;
      signed int NumberOfPages = CGPDFDocumentGetNumberOfPages(document);
      id v43 = v41;
      id v44 = objc_msgSend(v43, "request_attrs");
      uint64_t v45 = (*(void (**)(id))(*(void *)v44 + 480))(v44);
      if ([v45 count])
      {
        size_t v46 = [v45 firstObject];
        signed int v47 = [v46 rangeValue];

        if (v47 >= NumberOfPages) {
          size_t v48 = 0;
        }
        else {
          size_t v48 = v47 + 1;
        }
      }
      else
      {
        size_t v48 = 1;
      }

      Page = CGPDFDocumentGetPage(document, v48);
      __int16 v53 = Page;
      if (Page)
      {
        CGRect BoxRect = CGPDFPageGetBoxRect(Page, kCGPDFCropBox);
        double width = BoxRect.size.width;
        double height = BoxRect.size.height;
        int v56 = CGPDFPageGetRotationAngle(v53) % 360;
        if (v56 >= 0) {
          int v57 = v56;
        }
        else {
          int v57 = v56 + 360;
        }
        BOOL v58 = v57 == 90 || v57 == 270;
        if (v58) {
          double v59 = width;
        }
        else {
          double v59 = height;
        }
        if (v58) {
          double v60 = height;
        }
        else {
          double v60 = width;
        }
        BOOL v61 = v59 < v60;
        double v62 = v59 / v60 * 108.0;
        double v63 = v60 / v59 * 108.0;
        if (v61) {
          double v64 = v62;
        }
        else {
          double v64 = 108.0;
        }
        if (v61) {
          double v65 = 108.0;
        }
        else {
          double v65 = v63;
        }
        v66 = sub_10002749C((unint64_t)v65, (unint64_t)v64);
        if (v66)
        {
          v100.origin.x = 0.0;
          v100.origin.y = 0.0;
          v100.size.double width = v65;
          v100.size.double height = v64;
          CGPDFPageGetDrawingTransform(password, v53, kCGPDFCropBox, v100, v57, 1);
          CGContextConcatCTM(v66, password);
          CGContextDrawPDFPage(v66, v53);
        }
      }
      else
      {
        v66 = 0;
      }

LABEL_107:
      if (v66)
      {
        Image = CGBitmapContextCreateImage(v66);
        if (Image)
        {
          Mutable = CFDataCreateMutable(kCFAllocatorDefault, 0);
          CFDataRef v78 = Mutable;
          if (Mutable)
          {
            v79 = CGImageDestinationCreateWithData(Mutable, @"public.png", 1uLL, 0);
            v80 = v79;
            if (v79)
            {
              CGImageDestinationAddImage(v79, Image, 0);
              if (CGImageDestinationFinalize(v80))
              {
                if ((unint64_t)(CFDataGetLength(v78) - 1) <= 0x7FFE) {
                  [v13 updateThumbnail:v78];
                }
                goto LABEL_142;
              }
              v81 = _PKLogCategory(PKLogCategoryProgress[0]);
              if (os_log_type_enabled(v81, OS_LOG_TYPE_ERROR))
              {
                unsigned int v90 = objc_msgSend(v13, "printd_job_id");
                if (v13) {
                  unsigned int v91 = objc_msgSend(v13, "destination_job_id");
                }
                else {
                  unsigned int v91 = -1;
                }
                LODWORD(password[0].a) = 67109376;
                HIDWORD(password[0].a) = v90;
                LOWORD(password[0].b) = 1024;
                *(_DWORD *)((char *)&password[0].b + 2) = v91;
                _os_log_impl((void *)&_mh_execute_header, v81, OS_LOG_TYPE_ERROR, "[Job %d][%d] liteUpdateJobAttrs: Could not create thumbnail.", (uint8_t *)password, 0xEu);
              }
LABEL_141:

LABEL_142:
              if (document) {
                CGPDFDocumentRelease(document);
              }
              if (v78) {
                CFRelease(v78);
              }
              if (v80) {
                CFRelease(v80);
              }
              if (Image) {
                CGImageRelease(Image);
              }
              if (v66) {
                CGContextRelease(v66);
              }
              goto LABEL_152;
            }
            v81 = _PKLogCategory(PKLogCategoryProgress[0]);
            if (os_log_type_enabled(v81, OS_LOG_TYPE_ERROR))
            {
              unsigned int v88 = objc_msgSend(v13, "printd_job_id");
              if (v13) {
                unsigned int v89 = objc_msgSend(v13, "destination_job_id");
              }
              else {
                unsigned int v89 = -1;
              }
              LODWORD(password[0].a) = 67109376;
              HIDWORD(password[0].a) = v88;
              LOWORD(password[0].b) = 1024;
              *(_DWORD *)((char *)&password[0].b + 2) = v89;
              _os_log_impl((void *)&_mh_execute_header, v81, OS_LOG_TYPE_ERROR, "[Job %d][%d] liteUpdateJobAttrs: Unable to create thumbnail destination.", (uint8_t *)password, 0xEu);
            }
          }
          else
          {
            v81 = _PKLogCategory(PKLogCategoryProgress[0]);
            if (os_log_type_enabled(v81, OS_LOG_TYPE_ERROR))
            {
              unsigned int v86 = objc_msgSend(v13, "printd_job_id");
              if (v13) {
                unsigned int v87 = objc_msgSend(v13, "destination_job_id");
              }
              else {
                unsigned int v87 = -1;
              }
              LODWORD(password[0].a) = 67109376;
              HIDWORD(password[0].a) = v86;
              LOWORD(password[0].b) = 1024;
              *(_DWORD *)((char *)&password[0].b + 2) = v87;
              _os_log_impl((void *)&_mh_execute_header, v81, OS_LOG_TYPE_ERROR, "[Job %d][%d] liteUpdateJobAttrs: Can't create CFData to hold thumbnail.", (uint8_t *)password, 0xEu);
            }
            CFDataRef v78 = 0;
          }
          v80 = 0;
          goto LABEL_141;
        }
        v81 = _PKLogCategory(PKLogCategoryProgress[0]);
        if (os_log_type_enabled(v81, OS_LOG_TYPE_ERROR))
        {
          unsigned int v84 = objc_msgSend(v13, "printd_job_id");
          if (v13) {
            unsigned int v85 = objc_msgSend(v13, "destination_job_id");
          }
          else {
            unsigned int v85 = -1;
          }
          LODWORD(password[0].a) = 67109376;
          HIDWORD(password[0].a) = v84;
          LOWORD(password[0].b) = 1024;
          *(_DWORD *)((char *)&password[0].b + 2) = v85;
          v92 = "[Job %d][%d] liteUpdateJobAttrs: Unable to create thumbnail from bitmap context.";
LABEL_133:
          _os_log_impl((void *)&_mh_execute_header, v81, OS_LOG_TYPE_ERROR, v92, (uint8_t *)password, 0xEu);
        }
      }
      else
      {
        v81 = _PKLogCategory(PKLogCategoryProgress[0]);
        if (os_log_type_enabled(v81, OS_LOG_TYPE_ERROR))
        {
          unsigned int v82 = objc_msgSend(v13, "printd_job_id");
          if (v13) {
            unsigned int v83 = objc_msgSend(v13, "destination_job_id");
          }
          else {
            unsigned int v83 = -1;
          }
          LODWORD(password[0].a) = 67109376;
          HIDWORD(password[0].a) = v82;
          LOWORD(password[0].b) = 1024;
          *(_DWORD *)((char *)&password[0].b + 2) = v83;
          v92 = "[Job %d][%d] liteUpdateJobAttrs: Unable to create bitmap context.";
          goto LABEL_133;
        }
      }
      CFDataRef v78 = 0;
      v80 = 0;
      Image = 0;
      goto LABEL_141;
    }
    id v27 = v13;
    CFDictionaryRef theDict = 0;
    id v94 = v27;
    id v28 = [v27 spoolDocumentFilename];
    id v30 = lite_create_image(v28, 1, v29, &theDict);

    if (v30)
    {
      size_t v31 = CGImageGetWidth(v30);
      size_t v32 = CGImageGetHeight(v30);
      unint64_t v33 = v32;
      if (v32 < 2 * v31 && 2 * v32 > v31
        || (CGImageRelease(v30),
            [v94 spoolDocumentFilename],
            id v34 = (NSString *)objc_claimAutoreleasedReturnValue(),
            id v30 = lite_create_image(v34, 0, v35, &theDict),
            v34,
            v30))
      {
        if (theDict)
        {
          LODWORD(password[0].a) = 0;
          CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(theDict, kCGImagePropertyOrientation);
          if (Value)
          {
            if (CFNumberGetValue(Value, kCFNumberIntType, password)) {
              int a_low = LODWORD(password[0].a);
            }
            else {
              int a_low = 1;
            }
          }
          else
          {
            int a_low = 1;
          }
          CFRelease(theDict);
        }
        else
        {
          int a_low = 1;
        }
        if (v33 < v31) {
          size_t v70 = 108 * v33 / v31;
        }
        else {
          size_t v70 = 108;
        }
        if (v33 < v31) {
          size_t v71 = 108;
        }
        else {
          size_t v71 = 108 * v31 / v33;
        }
        v66 = sub_10002749C(v71, v70);
        if (v66)
        {
          v101.size.double width = (double)v71;
          v101.size.double height = (double)v70;
          v101.origin.x = 0.0;
          v101.origin.y = 0.0;
          _lite_page_transform(v101, v31, v33, a_low, 0, 0, (uint64_t)password);
          CGContextConcatCTM(v66, password);
          v102.size.double width = (double)v31;
          v102.size.double height = (double)v33;
          v102.origin.x = 0.0;
          v102.origin.y = 0.0;
          CGContextDrawImage(v66, v102, v30);
        }
        CFRelease(v30);
        goto LABEL_106;
      }
      id v49 = _PKLogCategory(PKLogCategoryProgress[0]);
      if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
      {
        unsigned int v72 = objc_msgSend(v94, "printd_job_id");
        if (v94) {
          unsigned int v73 = objc_msgSend(v94, "destination_job_id");
        }
        else {
          unsigned int v73 = -1;
        }
        LODWORD(password[0].a) = 67109376;
        HIDWORD(password[0].a) = v72;
        LOWORD(password[0].b) = 1024;
        *(_DWORD *)((char *)&password[0].b + 2) = v73;
        v74 = v49;
        os_log_type_t v75 = OS_LOG_TYPE_ERROR;
LABEL_104:
        _os_log_impl((void *)&_mh_execute_header, v74, v75, "[Job %d][%d] lite_draw_image_bitmap: Unable to open image from job file.", (uint8_t *)password, 0xEu);
      }
    }
    else
    {
      id v49 = _PKLogCategory(PKLogCategoryProgress[0]);
      if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v50 = objc_msgSend(v94, "printd_job_id");
        if (v94) {
          unsigned int v51 = objc_msgSend(v94, "destination_job_id");
        }
        else {
          unsigned int v51 = -1;
        }
        LODWORD(password[0].a) = 67109376;
        HIDWORD(password[0].a) = v50;
        LOWORD(password[0].b) = 1024;
        *(_DWORD *)((char *)&password[0].b + 2) = v51;
        v74 = v49;
        os_log_type_t v75 = OS_LOG_TYPE_DEFAULT;
        goto LABEL_104;
      }
    }

    v66 = 0;
LABEL_106:

    goto LABEL_107;
  }
  id v7 = [v1 spoolDocumentFilename];
  int v8 = sub_100022260((const char *)[v7 UTF8String]);

  if (v8)
  {
    document = v8;
    if (CGPDFDocumentIsEncrypted(v8))
    {
      id v9 = objc_msgSend(v1, "request_attrs");
      int v10 = (*(void (**)(id))(*(void *)v9 + 192))(v9);
      if ([v10 length])
      {
        id v11 = [v10 length];
        if ((unint64_t)v11 >= 0x7F) {
          uint64_t v12 = 127;
        }
        else {
          uint64_t v12 = (uint64_t)v11;
        }
        [v10 getBytes:password length:v12];
        *((unsigned char *)&password[0].a + v12) = 0;
        CGPDFDocumentUnlockWithPassword(v8, (const char *)password);
      }
    }
    if (CGPDFDocumentAllowsPrinting(v8))
    {
      size_t v6 = CGPDFDocumentGetNumberOfPages(v8);
      objc_msgSend(v1, "setPdf_pages:", v6);
      goto LABEL_14;
    }
    id v38 = _PKLogCategory(PKLogCategoryProgress[0]);
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      unsigned int v39 = objc_msgSend(v1, "printd_job_id");
      if (v1) {
        unsigned int v40 = objc_msgSend(v1, "destination_job_id");
      }
      else {
        unsigned int v40 = -1;
      }
      id v68 = [v1 spoolDocumentFilename];
      id v69 = [v68 UTF8String];
      LODWORD(password[0].a) = 67109634;
      HIDWORD(password[0].a) = v39;
      LOWORD(password[0].b) = 1024;
      *(_DWORD *)((char *)&password[0].b + 2) = v40;
      HIWORD(password[0].b) = 2080;
      *(void *)&password[0].c = v69;
      _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_ERROR, "[Job %d][%d] liteUpdateJobAttrs: PDF permissions do not allow printing of \"%s\".", (uint8_t *)password, 0x18u);
    }
    CGPDFDocumentRelease(v8);
    uint64_t v19 = 1042;
  }
  else
  {
    size_t v20 = _PKLogCategory(PKLogCategoryProgress[0]);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      unsigned int v21 = objc_msgSend(v1, "printd_job_id");
      if (v1) {
        unsigned int v22 = objc_msgSend(v1, "destination_job_id");
      }
      else {
        unsigned int v22 = -1;
      }
      id v67 = [v1 spoolDocumentFilename];
      LODWORD(password[0].a) = 67109634;
      HIDWORD(password[0].a) = v21;
      LOWORD(password[0].b) = 1024;
      *(_DWORD *)((char *)&password[0].b + 2) = v22;
      HIWORD(password[0].b) = 2080;
      *(void *)&password[0].c = [v67 UTF8String];
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "[Job %d][%d] liteUpdateJobAttrs: Unable to create a CGPDFDocumentRef for \"%s\".", (uint8_t *)password, 0x18u);
    }
    uint64_t v19 = 1041;
  }
LABEL_152:

  return v19;
}

void sub_1000220CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

CFURLRef sub_100022260(const char *a1)
{
  size_t v2 = strlen(a1);
  CFURLRef result = CFURLCreateFromFileSystemRepresentation(kCFAllocatorDefault, (const UInt8 *)a1, v2, 0);
  if (result)
  {
    CFURLRef v4 = result;
    CGPDFDocumentRef v5 = CGPDFDocumentCreateWithURL(result);
    CFRelease(v4);
    return v5;
  }
  return result;
}

CGImageRef lite_create_image(NSString *a1, int a2, int a3, const __CFDictionary **a4)
{
  size_t v6 = a1;
  id v7 = v6;
  if (a4) {
    *a4 = 0;
  }
  if (v6)
  {
    int v8 = [(NSString *)v6 UTF8String];
    size_t v9 = strlen(v8);
    CFURLRef v10 = CFURLCreateFromFileSystemRepresentation(kCFAllocatorDefault, (const UInt8 *)v8, v9, 0);
    CFURLRef v11 = v10;
    if (v10)
    {
      uint64_t v12 = CGImageSourceCreateWithURL(v10, 0);
      id v13 = v12;
      if (!v12)
      {
        CGImageRef ThumbnailAtIndex = 0;
LABEL_15:
        CFRelease(v11);
        goto LABEL_16;
      }
      if (a2)
      {
        int valuePtr = 108;
        CFNumberRef v14 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
        keys[0] = (void *)kCGImageSourceCreateThumbnailFromImageIfAbsent;
        keys[1] = (void *)kCGImageSourceThumbnailMaxPixelSize;
        values[0] = kCFBooleanTrue;
        values[1] = v14;
        CFDictionaryRef v15 = CFDictionaryCreate(0, (const void **)keys, (const void **)values, 2, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
        CGImageRef ThumbnailAtIndex = CGImageSourceCreateThumbnailAtIndex(v13, 0, v15);
        CFRelease(v14);
        CFRelease(v15);
        if (!a4) {
          goto LABEL_14;
        }
      }
      else
      {
        CGImageRef ThumbnailAtIndex = CGImageSourceCreateImageAtIndex(v12, 0, 0);
        if (!a4)
        {
LABEL_14:
          CFRelease(v13);
          goto LABEL_15;
        }
      }
      if (ThumbnailAtIndex) {
        *a4 = CGImageSourceCopyPropertiesAtIndex(v13, 0, 0);
      }
      goto LABEL_14;
    }
  }
  CGImageRef ThumbnailAtIndex = 0;
LABEL_16:

  return ThumbnailAtIndex;
}

void sub_100022490(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t lite_print_image(void *a1)
{
  id v1 = a1;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  uint64_t v14 = 0;
  size_t v2 = _PKLogCategory(PKLogCategoryProgress[0]);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v3 = objc_msgSend(v1, "printd_job_id");
    if (v1) {
      unsigned int v4 = objc_msgSend(v1, "destination_job_id");
    }
    else {
      unsigned int v4 = -1;
    }
    *(_DWORD *)long long buf = 67109634;
    unsigned int v16 = v3;
    __int16 v17 = 1024;
    unsigned int v18 = v4;
    __int16 v19 = 2080;
    size_t v20 = "lite_print_image";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "[Job %d][%d] #### %s.", buf, 0x18u);
  }

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100022688;
  v8[3] = &unk_1000A21A8;
  id v5 = v1;
  id v9 = v5;
  CFURLRef v10 = &v11;
  [v5 _withActivity:v8];

  uint64_t v6 = v12[3];
  _Block_object_dispose(&v11, 8);

  return v6;
}

void sub_100022648(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);

  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100022688(uint64_t a1, os_activity_t activity)
{
  unsigned int v3 = _os_activity_create((void *)&_mh_execute_header, "Thread: Print Image File", activity, OS_ACTIVITY_FLAG_DEFAULT);
  unsigned int v4 = _PKLogCategory(PKLogCategoryProgress[0]);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v5 = objc_msgSend(*(id *)(a1 + 32), "printd_job_id");
    uint64_t v6 = *(void **)(a1 + 32);
    if (v6) {
      unsigned int v7 = objc_msgSend(v6, "destination_job_id");
    }
    else {
      unsigned int v7 = -1;
    }
    *(_DWORD *)long long buf = 67109890;
    unsigned int v21 = v5;
    __int16 v22 = 1024;
    unsigned int v23 = v7;
    __int16 v24 = 2048;
    __int16 v25 = v3;
    __int16 v26 = 2080;
    id v27 = "Thread: Print Image File";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[Job %d][%d] Activity (%p) ENTER: %s", buf, 0x22u);
  }

  uint64_t v14 = _NSConcreteStackBlock;
  uint64_t v15 = 3221225472;
  unsigned int v16 = sub_100022900;
  __int16 v17 = &unk_1000A2180;
  id v8 = *(id *)(a1 + 32);
  uint64_t v9 = *(void *)(a1 + 40);
  id v18 = v8;
  uint64_t v19 = v9;
  os_activity_apply(v3, &v14);
  CFURLRef v10 = _PKLogCategory(PKLogCategoryProgress[0]);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v11 = objc_msgSend(*(id *)(a1 + 32), "printd_job_id", v14, v15, v16, v17);
    uint64_t v12 = *(void **)(a1 + 32);
    if (v12) {
      unsigned int v13 = objc_msgSend(v12, "destination_job_id");
    }
    else {
      unsigned int v13 = -1;
    }
    *(_DWORD *)long long buf = 67109890;
    unsigned int v21 = v11;
    __int16 v22 = 1024;
    unsigned int v23 = v13;
    __int16 v24 = 2048;
    __int16 v25 = v3;
    __int16 v26 = 2080;
    id v27 = "Thread: Print Image File";
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[Job %d][%d] Activity (%p) EXIT: %s", buf, 0x22u);
  }
}

void sub_1000228C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_100022900(uint64_t a1)
{
  if (![*(id *)(a1 + 32) numberOfSheetsPerCopy]) {
    [*(id *)(a1 + 32) setNumberOfSheetsPerCopy:1];
  }
  sub_100022954(*(void **)(a1 + 32), 1, kCGInterpolationNone);
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
}

void sub_100022954(void *a1, int a2, CGInterpolationQuality a3)
{
  id v5 = a1;
  id v361 = 0;
  id v366 = 0;
  dispatch_data_t v373 = 0;
  signed int v334 = 0;
  long long v6 = *(_OWORD *)&CGAffineTransformIdentity.c;
  long long v331 = *(_OWORD *)&CGAffineTransformIdentity.a;
  long long v332 = v6;
  long long v333 = *(_OWORD *)&CGAffineTransformIdentity.tx;
  liteSetThreadPriority(1u);
  unsigned int v7 = _PKLogCategory(PKLogCategoryProgress[0]);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v8 = objc_msgSend(v5, "printd_job_id");
    if (v5) {
      unsigned int v9 = objc_msgSend(v5, "destination_job_id");
    }
    else {
      unsigned int v9 = -1;
    }
    id v10 = [v5 spoolDocumentFilename];
    *(_DWORD *)long long buf = 67109634;
    *(_DWORD *)&uint8_t buf[4] = v8;
    *(_WORD *)&uint8_t buf[8] = 1024;
    *(_DWORD *)&buf[10] = v9;
    *(_WORD *)&buf[14] = 2080;
    *(void *)&uint8_t buf[16] = [v10 UTF8String];
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[Job %d][%d] lite_print_pdf_or_image: filename=%s", buf, 0x18u);
  }
  objc_msgSend(v5, "set_processing");
  id v11 = objc_msgSend(v5, "request_attrs");
  v321 = (*(void (**)(id))(*(void *)v11 + 480))(v11);
  id v12 = objc_msgSend(v5, "request_attrs");
  v320 = (*(void (**)(id))(*(void *)v12 + 608))(v12);
  bzero(&v340, 0x8B0uLL);
  objc_storeStrong(&v366, a1);
  if (a2)
  {
    v387.a = 0.0;
    unsigned int v13 = [v5 spoolDocumentFilename];
    image = lite_create_image(v13, 0, v14, (const __CFDictionary **)&v387);

    if (image)
    {
      signed int v319 = 1;
      if (*(void *)&v387.a)
      {
        *(_DWORD *)long long buf = 0;
        CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(*(CFDictionaryRef *)&v387.a, kCGImagePropertyOrientation);
        if (Value)
        {
          int v16 = CFNumberGetValue(Value, kCFNumberIntType, buf);
          int v17 = *(_DWORD *)buf;
          if (!v16) {
            int v17 = 1;
          }
          int v314 = v17;
        }
        else
        {
          int v314 = 1;
        }
        CFNumberRef v34 = (const __CFNumber *)CFDictionaryGetValue(*(CFDictionaryRef *)&v387.a, kCGImagePropertyDPIWidth);
        if (v34)
        {
          int v35 = CFNumberGetValue(v34, kCFNumberIntType, buf);
          int v36 = *(_DWORD *)buf;
          if (!v35) {
            int v36 = 300;
          }
          int v310 = v36;
        }
        else
        {
          int v310 = 300;
        }
        CFRelease(*(CFTypeRef *)&v387.a);
      }
      else
      {
        int v310 = 300;
        int v314 = 1;
      }
      int v25 = 0;
      int v315 = 0;
      document = 0;
      signed int v334 = 1;
      goto LABEL_41;
    }
    __int16 v26 = _PKLogCategory(PKLogCategoryProgress[0]);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      unsigned int v27 = objc_msgSend(v5, "printd_job_id");
      if (v5) {
        unsigned int v28 = objc_msgSend(v5, "destination_job_id");
      }
      else {
        unsigned int v28 = -1;
      }
      *(_DWORD *)long long buf = 67109376;
      *(_DWORD *)&uint8_t buf[4] = v27;
      *(_WORD *)&uint8_t buf[8] = 1024;
      *(_DWORD *)&buf[10] = v28;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "[Job %d][%d] lite_print_pdf_or_image: Unable to get image from job file.", buf, 0xEu);
    }
LABEL_119:

    image = 0;
    document = 0;
    goto LABEL_123;
  }
  id v18 = [v5 spoolDocumentFilename];
  document = sub_100022260((const char *)[v18 UTF8String]);

  if (!document)
  {
    __int16 v26 = _PKLogCategory(PKLogCategoryProgress[0]);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      unsigned int v29 = objc_msgSend(v5, "printd_job_id");
      if (v5) {
        unsigned int v30 = objc_msgSend(v5, "destination_job_id");
      }
      else {
        unsigned int v30 = -1;
      }
      id v80 = [v5 spoolDocumentFilename];
      id v81 = [v80 UTF8String];
      *(_DWORD *)long long buf = 67109634;
      *(_DWORD *)&uint8_t buf[4] = v29;
      *(_WORD *)&uint8_t buf[8] = 1024;
      *(_DWORD *)&buf[10] = v30;
      *(_WORD *)&buf[14] = 2080;
      *(void *)&uint8_t buf[16] = v81;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "[Job %d][%d] lite_print_pdf_or_image: Unable to create a CGPDFDocumentRef for \"%s\".", buf, 0x18u);
    }
    goto LABEL_119;
  }
  if (CGPDFDocumentIsEncrypted(document))
  {
    id v19 = objc_msgSend(v5, "request_attrs");
    size_t v20 = (*(void (**)(id))(*(void *)v19 + 192))(v19);
    if ([v20 length])
    {
      id v21 = [v20 length];
      if ((unint64_t)v21 >= 0x7F) {
        uint64_t v22 = 127;
      }
      else {
        uint64_t v22 = (uint64_t)v21;
      }
      [v20 getBytes:buf length:v22];
      buf[v22] = 0;
      CGPDFDocumentUnlockWithPassword(document, (const char *)buf);
    }
  }
  if (!CGPDFDocumentAllowsPrinting(document))
  {
    size_t v31 = _PKLogCategory(PKLogCategoryProgress[0]);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      unsigned int v32 = objc_msgSend(v5, "printd_job_id");
      if (v5) {
        unsigned int v33 = objc_msgSend(v5, "destination_job_id");
      }
      else {
        unsigned int v33 = -1;
      }
      id v82 = [v5 spoolDocumentFilename];
      id v83 = [v82 UTF8String];
      *(_DWORD *)long long buf = 67109634;
      *(_DWORD *)&uint8_t buf[4] = v32;
      *(_WORD *)&uint8_t buf[8] = 1024;
      *(_DWORD *)&buf[10] = v33;
      *(_WORD *)&buf[14] = 2080;
      *(void *)&uint8_t buf[16] = v83;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "[Job %d][%d] lite_print_pdf_or_image: PDF permissions do not allow printing of \"%s\".", buf, 0x18u);
    }
    image = 0;
    goto LABEL_123;
  }
  id v23 = objc_msgSend(v5, "request_attrs");
  int v315 = (*(uint64_t (**)(id))(*(void *)v23 + 32))(v23);
  signed int NumberOfPages = CGPDFDocumentGetNumberOfPages(document);
  sub_10002770C(v5, NumberOfPages, &v334);
  image = 0;
  int v314 = 1;
  int v310 = 300;
  signed int v319 = v334;
  int v25 = 1;
LABEL_41:
  id v37 = objc_msgSend(v5, "printer_driverformat");
  BOOL v38 = objc_msgSend(v5, "openDriver:format:orient:num_sheets:passthru:") == 0;

  if (!v38)
  {
    if (a2) {
      unsigned __int8 v349 = 1;
    }
    unsigned int v40 = v351;
    unsigned int v41 = v352;
    double v42 = (double)v351;
    LODWORD(v39) = v353;
    double v43 = (double)v352;
    unsigned int v44 = v354 & 0xFFFFFFFE;
    long long v308 = v356;
    if ((v354 & 0xFFFFFFFE) == 4)
    {
      unsigned int v351 = v352;
      unsigned int v352 = v40;
      int v305 = 1;
      unsigned int v45 = v40;
      unsigned int v40 = v41;
    }
    else
    {
      int v305 = 0;
      unsigned int v45 = v352;
    }
    double v47 = v42 * 72.0;
    double v48 = (double)v39;
    int v51 = v357;
    int v50 = v358;
    unsigned int v52 = v357 / v358;
    int v345 = v357 / v358;
    unsigned int v53 = v40;
    size_t v371 = v40;
    unint64_t v54 = v45;
    unint64_t v343 = v45;
    if (v357 / v358 != 1)
    {
      if (v44 == 4)
      {
        unsigned int v53 = (v40 + 1) / v52;
        size_t v371 = v53;
      }
      else
      {
        unint64_t v54 = (v45 + 1) / v52;
        unint64_t v343 = v54;
      }
    }
    v346 = 0;
    double v49 = v43 * 72.0;
    double v312 = v43 * 72.0 / v48;
    double v313 = v47 / v48;
    if (v354 == 6)
    {
      long long v331 = 0xBFF0000000000000;
      *(void *)&long long v332 = 0;
      *((void *)&v332 + 1) = 0xBFF0000000000000;
      *(double *)&long long v333 = v47 / v48;
      double v55 = v49 / v48;
    }
    else
    {
      if (v354 != 5)
      {
        if (v354 == 4)
        {
          long long v331 = xmmword_10006EC20;
          long long v332 = xmmword_10006EC30;
          *(double *)&long long v333 = v49 / v48;
          *((void *)&v333 + 1) = 0;
        }
LABEL_67:
        *(_OWORD *)&t1.c = v332;
        *(_OWORD *)&t1.tCGFloat x = v333;
        long long v56 = *(_OWORD *)&CGAffineTransformIdentity.c;
        *(_OWORD *)&t2.a = *(_OWORD *)&CGAffineTransformIdentity.a;
        *(_OWORD *)&t2.c = v56;
        *(_OWORD *)&t2.tCGFloat x = *(_OWORD *)&CGAffineTransformIdentity.tx;
        *(_OWORD *)&t1.a = v331;
        if (!CGAffineTransformEqualToTransform(&t1, &t2)) {
          v346 = &v331;
        }
        if (v44 == 4) {
          double v57 = (double)v51 / 72.0;
        }
        else {
          double v57 = (double)v50 / 72.0;
        }
        if (v44 == 4) {
          double v58 = (double)v50 / 72.0;
        }
        else {
          double v58 = (double)v51 / 72.0;
        }
        if (HIBYTE(v348) <= 8u)
        {
          if (((1 << SHIBYTE(v348)) & 0xAA) != 0)
          {
            unsigned int v59 = 3;
LABEL_78:
            int v341 = v59;
            unsigned int v60 = v348 / v59;
            unsigned int v61 = v60 >> 1;
            goto LABEL_81;
          }
          if (((1 << SHIBYTE(v348)) & 0x111) != 0)
          {
            int v341 = 1;
            unsigned int v60 = v348;
            unsigned int v61 = v348 >> 3;
LABEL_81:
            unint64_t v62 = (v53 * (unint64_t)v61 + 15) & 0xFFFFFFFFF0;
            size_t v342 = v62;
            if (v62 <= MaxRenderMemory)
            {
              if (MaxRenderMemory / v62 >= v54) {
                unint64_t v63 = v54;
              }
              else {
                unint64_t v63 = MaxRenderMemory / v62;
              }
            }
            else
            {
              unint64_t v63 = 1;
            }
            size_t v372 = v63;
            double v344 = (double)v63 / v57;
            if (!is_mul_ok(v62, v63))
            {
              double v64 = _PKLogCategory(PKLogCategoryProgress[0]);
              if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)long long buf = 67109376;
                *(_DWORD *)&uint8_t buf[4] = v342;
                *(_WORD *)&uint8_t buf[8] = 1024;
                *(_DWORD *)&buf[10] = v63;
                _os_log_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_DEFAULT, "lite_create_context: Band buffer (%dx%d) too large.", buf, 0xEu);
              }
LABEL_89:

LABEL_123:
              LODWORD(v84) = 1;
LABEL_124:
              if (v340)
              {
                if (CGBitmapContextGetData(v340))
                {
                  dispatch_data_t v85 = v373;
                  if (v373)
                  {
                    dispatch_data_t v373 = 0;
                  }
                }
                CGContextRelease(v340);
              }
              CGPDFDocumentRelease(document);
              CGImageRelease(image);
              if ([v5 closeDriver:v347])
              {
                unsigned int v86 = objc_msgSend(v5, "is_canceled");
                uint64_t v87 = 8;
                if (!v84) {
                  uint64_t v87 = 9;
                }
                if (v86) {
                  uint64_t v88 = 7;
                }
                else {
                  uint64_t v88 = v87;
                }
                [v5 finishJob:v88];
              }
              else
              {
                [v5 resetJob];
              }
              goto LABEL_137;
            }
            size_t v65 = v62 * v63;
            v66 = mmap(0, v62 * v63, 3, 4097, -1, 0);
            id v67 = v66;
            if (v66 == (void *)-1)
            {
              v76 = _PKLogCategory(PKLogCategoryProgress[0]);
              if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
              {
                int v77 = *__error();
                *(_DWORD *)long long buf = 136315394;
                *(void *)&uint8_t buf[4] = "allocRaster";
                *(_WORD *)&buf[12] = 1024;
                *(_DWORD *)&buf[14] = v77;
                _os_log_impl((void *)&_mh_execute_header, v76, OS_LOG_TYPE_DEFAULT, "%s: mmap failure: %d", buf, 0x12u);
              }
            }
            else
            {
              dispatch_data_t v68 = dispatch_data_create(v66, v65, 0, _dispatch_data_destructor_munmap);
              dispatch_data_t v69 = v373;
              dispatch_data_t v373 = v68;

              if (v373)
              {
                if (v67)
                {
                  size_t v70 = _PKLogCategory(PKLogCategoryFramework);
                  if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_WORD *)long long buf = 0;
                    _os_log_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_DEFAULT, "DEBUG: **** Image processing in effect", buf, 2u);
                  }

                  if (v341 == 3) {
                    int v71 = 5;
                  }
                  else {
                    int v71 = 0;
                  }
                  if (v60 == 16) {
                    uint32_t v72 = v71 | 0x1000;
                  }
                  else {
                    uint32_t v72 = v71;
                  }
                  int v73 = HIBYTE(v348);
                  v74 = (CFStringRef *)&kCGColorSpaceAdobeRGB1998;
                  switch(HIBYTE(v348))
                  {
                    case 0:
                    case 4:
                      CGColorSpaceRef DeviceGray = CGColorSpaceCreateDeviceGray();
                      break;
                    case 1:
                    case 2:
                    case 5:
                      goto LABEL_142;
                    case 3:
                      goto LABEL_145;
                    case 6:
                      CGColorSpaceRef DeviceGray = CGColorSpaceCreateDeviceCMYK();
                      break;
                    case 7:
                      v74 = (CFStringRef *)&kCGColorSpaceExtendedLinearDisplayP3;
                      goto LABEL_145;
                    case 8:
                      v74 = (CFStringRef *)&kCGColorSpaceExtendedLinearGray;
LABEL_145:
                      CGColorSpaceRef DeviceGray = CGColorSpaceCreateWithName(*v74);
                      break;
                    default:
                      oslog = _PKLogCategory(PKLogCategoryProgress[0]);
                      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_DWORD *)long long buf = 67109120;
                        *(_DWORD *)&uint8_t buf[4] = v73;
                        _os_log_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_DEFAULT, "lite_create_colorspace: Unsupported color space requested (%d)", buf, 8u);
                      }

LABEL_142:
                      CGColorSpaceRef DeviceGray = CGColorSpaceCreateDeviceRGB();
                      break;
                  }
                  unsigned int v89 = DeviceGray;
                  int v90 = HIBYTE(v348);
                  if (HIBYTE(v348) == 7)
                  {
                    int v341 = 3;
                    size_t v342 = 8 * (v371 & 0x3FFFFFFFFFFFFFFLL);
                    unsigned int v89 = CGColorSpaceCreateWithName(kCGColorSpaceExtendedLinearDisplayP3);
                    if (!v89)
                    {
                      v96 = _PKLogCategory(PKLogCategoryProgress[0]);
                      if (os_log_type_enabled(v96, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_WORD *)long long buf = 0;
                        _os_log_impl((void *)&_mh_execute_header, v96, OS_LOG_TYPE_DEFAULT, "Couldn't create P3E colorspace", buf, 2u);
                      }

                      dispatch_data_t v95 = v373;
                      if (!v373) {
                        goto LABEL_123;
                      }
                      goto LABEL_169;
                    }
                    int v90 = HIBYTE(v348);
                    unsigned int v60 = 16;
                    uint32_t v72 = 4357;
                  }
                  if (v90 == 8)
                  {
                    int v341 = 1;
                    size_t v342 = 2 * (v371 & 0xFFFFFFFFFFFFFFFLL);
                    unsigned int v89 = CGColorSpaceCreateWithName(kCGColorSpaceExtendedLinearGray);
                    if (!v89)
                    {
                      v97 = _PKLogCategory(PKLogCategoryProgress[0]);
                      if (os_log_type_enabled(v97, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_WORD *)long long buf = 0;
                        _os_log_impl((void *)&_mh_execute_header, v97, OS_LOG_TYPE_DEFAULT, "Couldn't create WE colorspace", buf, 2u);
                      }

                      dispatch_data_t v95 = v373;
                      if (!v373) {
                        goto LABEL_123;
                      }
                      goto LABEL_169;
                    }
                    unsigned int v60 = 16;
                    uint32_t v72 = 4357;
                  }
                  unsigned int v91 = CGBitmapContextCreate(v67, v371, v63, v60, v342, v89, v72);
                  CGColorSpaceRelease(v89);
                  if (v91)
                  {
                    CGContextRef v340 = v91;
                    CGContextSetAllowsAntialiasing(v91, 0);
                    CGContextSetInterpolationQuality(v91, a3);
                    CGContextScaleCTM(v91, v58, v57);
                    CGContextTranslateCTM(v91, 0.0, v344 - (double)v343 / v57);
                    CGContextRef v367 = 0;
                    if (v360[104] && v341 != 1)
                    {
                      v92 = CGColorSpaceCreateDeviceGray();
                      if (HIBYTE(v348) == 8)
                      {
                        unsigned int v93 = v348;
                      }
                      else if (HIBYTE(v348) == 7)
                      {
                        unsigned int v93 = v348 / 3u;
                      }
                      else
                      {
                        unsigned int v93 = 8;
                      }
                      size_t v368 = v371 & 0x1FFFFFFFFFFFFFFFLL;
                      size_t v369 = v65 / (v371 & 0x1FFFFFFFFFFFFFFFLL);
                      double v370 = (double)v369 / v57;
                      v98 = CGBitmapContextCreate(v67, v371, v369, v93, v371 & 0x1FFFFFFFFFFFFFFFLL, v92, 0);
                      CGColorSpaceRelease(v92);
                      if (v98)
                      {
                        CGContextRef v367 = v98;
                        v388.size.double width = (double)v371;
                        v388.size.double height = (double)v369;
                        v388.origin.CGFloat x = 0.0;
                        v388.origin.CGFloat y = 0.0;
                        CGContextClipToRect(v98, v388);
                        CGContextSetAllowsAntialiasing(v98, 0);
                        CGContextSetInterpolationQuality(v98, a3);
                        CGContextScaleCTM(v98, v58, v57);
                        CGContextTranslateCTM(v98, 0.0, v370 - (double)v343 / v57);
                      }
                      else
                      {
                        v99 = _PKLogCategory(PKLogCategoryProgress[0]);
                        if (os_log_type_enabled(v99, OS_LOG_TYPE_DEFAULT))
                        {
                          *(_DWORD *)long long buf = 67109888;
                          *(_DWORD *)&uint8_t buf[4] = v371;
                          *(_WORD *)&uint8_t buf[8] = 1024;
                          *(_DWORD *)&buf[10] = v369;
                          *(_WORD *)&buf[14] = 1024;
                          *(_DWORD *)&uint8_t buf[16] = v93;
                          *(_WORD *)&buf[20] = 1024;
                          *(_DWORD *)&buf[22] = v368;
                          _os_log_impl((void *)&_mh_execute_header, v99, OS_LOG_TYPE_DEFAULT, "No Monochrome Optimations: unable to create gray bitmap context: raster_width=%d, band_height=%d, bits_per_component=%d, bytes_per_row=%d.", buf, 0x1Au);
                        }
                      }
                    }
                    CGRect v100 = _PKLogCategory(PKLogCategoryProgress[0]);
                    if (os_log_type_enabled(v100, OS_LOG_TYPE_DEFAULT))
                    {
                      unsigned int v101 = objc_msgSend(v5, "printd_job_id");
                      if (v5) {
                        unsigned int v102 = objc_msgSend(v5, "destination_job_id");
                      }
                      else {
                        unsigned int v102 = -1;
                      }
                      int v103 = v334;
                      *(_DWORD *)long long buf = 67109632;
                      *(_DWORD *)&uint8_t buf[4] = v101;
                      *(_WORD *)&uint8_t buf[8] = 1024;
                      *(_DWORD *)&buf[10] = v102;
                      *(_WORD *)&buf[14] = 1024;
                      *(_DWORD *)&uint8_t buf[16] = v334;
                      _os_log_impl((void *)&_mh_execute_header, v100, OS_LOG_TYPE_DEFAULT, "[Job %d][%d] lite_print_pdf_or_image: numPages=%d", buf, 0x14u);
                    }
                    else
                    {
                      int v103 = v334;
                    }

                    if (v103 <= 0)
                    {
                      v109 = _PKLogCategory(PKLogCategoryProgress[0]);
                      if (os_log_type_enabled(v109, OS_LOG_TYPE_ERROR))
                      {
                        unsigned int v110 = objc_msgSend(v5, "printd_job_id");
                        if (v5) {
                          unsigned int v111 = objc_msgSend(v5, "destination_job_id");
                        }
                        else {
                          unsigned int v111 = -1;
                        }
                        id v132 = [v5 spoolDocumentFilename];
                        id v133 = [v132 UTF8String];
                        *(_DWORD *)long long buf = 67109634;
                        *(_DWORD *)&uint8_t buf[4] = v110;
                        *(_WORD *)&uint8_t buf[8] = 1024;
                        *(_DWORD *)&buf[10] = v111;
                        *(_WORD *)&buf[14] = 2080;
                        *(void *)&uint8_t buf[16] = v133;
                        _os_log_impl((void *)&_mh_execute_header, v109, OS_LOG_TYPE_ERROR, "[Job %d][%d] PDF document \"%s\" has no pages.", buf, 0x18u);
                      }
                    }
                    else
                    {
                      unsigned int v104 = v349;
                      int v105 = v349 == 2;
                      int v303 = v360[v350];
                      v106 = _PKLogCategory(PKLogCategoryProgress[0]);
                      if (os_log_type_enabled(v106, OS_LOG_TYPE_DEFAULT))
                      {
                        unsigned int v107 = objc_msgSend(v5, "printd_job_id");
                        if (v5) {
                          unsigned int v108 = objc_msgSend(v5, "destination_job_id");
                        }
                        else {
                          unsigned int v108 = -1;
                        }
                        v112 = "F";
                        if (v104 <= 1) {
                          v113 = "F";
                        }
                        else {
                          v113 = "T";
                        }
                        v114 = "Rotated";
                        *(_DWORD *)long long buf = 67110658;
                        *(_DWORD *)&uint8_t buf[4] = v107;
                        *(_WORD *)&uint8_t buf[8] = 1024;
                        *(_DWORD *)&buf[10] = v108;
                        if (v359 == 1) {
                          v114 = "Flipped";
                        }
                        *(_WORD *)&buf[14] = 2080;
                        *(void *)&uint8_t buf[16] = v113;
                        if (v359) {
                          v115 = v114;
                        }
                        else {
                          v115 = "Normal";
                        }
                        *(_WORD *)&buf[24] = 1024;
                        if (v104 == 2) {
                          v116 = "T";
                        }
                        else {
                          v116 = "F";
                        }
                        *(_DWORD *)&buf[26] = v355;
                        if (v303) {
                          v112 = "T";
                        }
                        *(_WORD *)&buf[30] = 2080;
                        *(void *)v384 = v115;
                        *(_WORD *)&v384[8] = 2080;
                        *(void *)&v384[10] = v116;
                        __int16 v385 = 2080;
                        v386 = v112;
                        _os_log_impl((void *)&_mh_execute_header, v106, OS_LOG_TYPE_DEFAULT, "[Job %d][%d] lite_print_pdf_or_image: duplex=%s, copies=%d, backside=%s, tumble=%s, reverse_order=%s", buf, 0x3Cu);
                      }

                      if (document) {
                        BOOL v117 = v104 > 1;
                      }
                      else {
                        BOOL v117 = 0;
                      }
                      if (v117)
                      {
                        if (v303) {
                          BOOL v118 = 0;
                        }
                        else {
                          BOOL v118 = v355 <= 1;
                        }
                        int v119 = !v118;
                        v319 += v119 & v319;
                      }
                      if (!v362 || v362(v347, (v355 * v319)))
                      {
                        id v120 = objc_msgSend(v5, "request_attrs");
                        char v121 = (*(uint64_t (**)(id))(*(void *)v120 + 288))(v120);
                        v122.i64[0] = SDWORD2(v308);
                        v122.i64[1] = SHIDWORD(v308);
                        int64x2_t v123 = v122;
                        v122.i64[0] = (int)v308;
                        v122.i64[1] = SDWORD1(v308);
                        float64x2_t v124 = (float64x2_t)vdupq_n_s64(0x4052000000000000uLL);
                        float64x2_t v125 = vmulq_f64(vcvtq_f64_s64(v122), v124);
                        float64x2_t v126 = vmulq_f64(vcvtq_f64_s64(v123), v124);
                        float64x2_t v127 = (float64x2_t)vdupq_n_s64(0x40A3D80000000000uLL);
                        float64x2_t v297 = vdivq_f64(v125, v127);
                        float64x2_t qualitya = vdivq_f64(v126, v127);
                        if (vaddvq_s32((int32x4_t)vbicq_s8((int8x16_t)xmmword_10006EC40, (int8x16_t)vuzp1q_s32((int32x4_t)vceqzq_f64(v297), (int32x4_t)vceqzq_f64(qualitya)))))int v128 = 1; {
                        else
                        }
                          int v128 = 2;
                        int v300 = v128;
                        if (!v320) {
                          goto LABEL_239;
                        }
                        if ([v320 compare:@"fit"])
                        {
                          if (![v320 compare:@"fill"])
                          {
                            int v25 = 0;
                            int v129 = 2;
LABEL_236:
                            int v300 = v129;
                            if ([v320 compare:@"auto"]
                              && [v320 compare:@"auto-fit"])
                            {
                              goto LABEL_240;
                            }

LABEL_239:
                            v320 = 0;
LABEL_240:
                            id v134 = objc_msgSend(v5, "request_attrs");
                            if ((*(unsigned int (**)(id))(*(void *)v134 + 96))(v134)) {
                              int v135 = 0;
                            }
                            else {
                              int v135 = v25;
                            }
                            int v298 = v135;
                            id v136 = objc_msgSend(v5, "request_attrs");
                            int v299 = (*(uint64_t (**)(id))(*(void *)v136 + 392))(v136);
                            if (v299)
                            {
                              id v137 = objc_msgSend(v5, "request_attrs");
                              unsigned int v138 = (*(uint64_t (**)(id))(*(void *)v137 + 384))(v137) - 4;
                              if (v138 > 2) {
                                int v139 = 0;
                              }
                              else {
                                int v139 = dword_10006EC50[v138];
                              }
                              v141 = _PKLogCategory(PKLogCategoryProgress[0]);
                              if (os_log_type_enabled(v141, OS_LOG_TYPE_DEFAULT))
                              {
                                unsigned int v142 = objc_msgSend(v5, "printd_job_id");
                                if (v5) {
                                  unsigned int v143 = objc_msgSend(v5, "destination_job_id");
                                }
                                else {
                                  unsigned int v143 = -1;
                                }
                                *(_DWORD *)long long buf = 67109632;
                                *(_DWORD *)&uint8_t buf[4] = v142;
                                *(_WORD *)&uint8_t buf[8] = 1024;
                                *(_DWORD *)&buf[10] = v143;
                                *(_WORD *)&buf[14] = 1024;
                                *(_DWORD *)&uint8_t buf[16] = v139;
                                _os_log_impl((void *)&_mh_execute_header, v141, OS_LOG_TYPE_DEFAULT, "[Job %d][%d] lite_print_pdf_or_image: orientation-requested found in request, rotation=%d", buf, 0x14u);
                              }

                              int v140 = v139;
                            }
                            else
                            {
                              int v140 = 0;
                            }
                            double v296 = v297.f64[1];
                            double v144 = qualitya.f64[1];
                            if (v349 >= 2u)
                            {
                              if (v297.f64[0] <= qualitya.f64[0])
                              {
                                if (qualitya.f64[0] > v297.f64[0]) {
                                  v297.f64[0] = qualitya.f64[0];
                                }
                              }
                              else
                              {
                                qualitya.f64[0] = v297.f64[0];
                              }
                              if (qualitya.f64[1] <= v297.f64[1])
                              {
                                if (v297.f64[1] > qualitya.f64[1]) {
                                  double v144 = v297.f64[1];
                                }
                              }
                              else
                              {
                                double v296 = qualitya.f64[1];
                              }
                            }
                            BOOL v145 = v359 > 0 && v117;
                            int osloga = v140;
                            if (v145)
                            {
                              if (v359 != 3)
                              {
                                if (v359 != 2)
                                {
                                  if (v305 == v105)
                                  {
                                    unint64_t v335 = 0x3FF0000000000000;
                                    uint64_t v336 = 0;
                                    uint64_t v337 = 0;
                                    long long v338 = xmmword_10006EC30;
                                    double v339 = v312;
                                    v288 = &v335;
                                  }
                                  else
                                  {
                                    unint64_t v335 = 0xBFF0000000000000;
                                    uint64_t v336 = 0;
                                    uint64_t v337 = 0;
                                    *(void *)&long long v338 = 0x3FF0000000000000;
                                    *((double *)&v338 + 1) = v313;
                                    v288 = &v335;
                                    double v339 = 0.0;
                                  }
                                  goto LABEL_271;
                                }
                                if (v104 == 2) {
                                  goto LABEL_270;
                                }
LABEL_566:
                                unint64_t v335 = 0xBFF0000000000000;
                                uint64_t v336 = 0;
                                uint64_t v337 = 0;
                                *(void *)&long long v338 = 0xBFF0000000000000;
                                v288 = &v335;
                                *((double *)&v338 + 1) = v313;
                                double v339 = v312;
LABEL_271:
                                int v277 = time(0);
                                if (document && v367)
                                {
                                  v295 = v340;
                                  int v294 = v341;
                                  size_t v292 = v372;
                                  size_t v293 = v342;
                                  double v291 = v344;
                                  char v289 = HIBYTE(v348);
                                  char v290 = v348;
                                }
                                if (!v355)
                                {
LABEL_557:
                                  LODWORD(v84) = 0;
LABEL_558:
                                  int v273 = time(0);
                                  v274 = _PKLogCategory(PKLogCategoryProgress[0]);
                                  if (os_log_type_enabled(v274, OS_LOG_TYPE_DEFAULT))
                                  {
                                    unsigned int v275 = objc_msgSend(v5, "printd_job_id");
                                    if (v5) {
                                      unsigned int v276 = objc_msgSend(v5, "destination_job_id");
                                    }
                                    else {
                                      unsigned int v276 = -1;
                                    }
                                    *(_DWORD *)long long buf = 67109888;
                                    *(_DWORD *)&uint8_t buf[4] = v275;
                                    *(_WORD *)&uint8_t buf[8] = 1024;
                                    *(_DWORD *)&buf[10] = v276;
                                    *(_WORD *)&buf[14] = 1024;
                                    *(_DWORD *)&uint8_t buf[16] = (v273 - v277) / 60;
                                    *(_WORD *)&buf[20] = 1024;
                                    *(_DWORD *)&buf[22] = (v273 - v277) % 60;
                                    _os_log_impl((void *)&_mh_execute_header, v274, OS_LOG_TYPE_DEFAULT, "[Job %d][%d] lite_print_pdf_or_image: TIME %d:%02d", buf, 0x1Au);
                                  }

                                  if (v363) {
                                    v363(v347);
                                  }
                                  goto LABEL_124;
                                }
                                *(_DWORD *)&v286[8] = 0;
                                double v146 = v313 - v297.f64[0] - qualitya.f64[0];
                                *(void *)v286 = v314 > 4;
                                double v285 = (float)(72.0 / (float)v310);
                                v147 = "fill";
                                if (v300 == 1) {
                                  v147 = "fit";
                                }
                                if (!v300) {
                                  v147 = "none";
                                }
                                v287 = v147;
                                BOOL v148 = v296 > 36.0;
                                if (v144 > 36.0) {
                                  BOOL v148 = 1;
                                }
                                if (v297.f64[0] > 36.0) {
                                  BOOL v148 = 1;
                                }
                                if (qualitya.f64[0] > 36.0) {
                                  BOOL v148 = 1;
                                }
                                double v279 = v312 - v296 - v144;
                                double v280 = v313 - qualitya.f64[0] - v297.f64[0];
                                char v149 = v121 & v148;
                                if (v320) {
                                  char v149 = 1;
                                }
                                char v283 = v149 | v299;
                                char v284 = v149 | v299 ^ 1;
                                double v301 = v312 - v144 - v296;
                                double v302 = v313 - v297.f64[0] - qualitya.f64[0];
                                double v281 = (v313 - qualitya.f64[0] - v297.f64[0]) / (v312 - v296 - v144);
                                double v282 = v146 / v301;
                                double v278 = -v146;
                                double v150 = 0.5;
                                while (1)
                                {
                                  if (objc_msgSend(v5, "is_canceled")) {
                                    goto LABEL_557;
                                  }
                                  if (v319) {
                                    break;
                                  }
LABEL_551:
                                  LODWORD(v84) = 0;
LABEL_552:
                                  if (++*(void *)&v286[4] >= (unint64_t)v355 || v84 != 0) {
                                    goto LABEL_558;
                                  }
                                }
                                uint64_t v151 = 0;
                                while (1)
                                {
                                  if (objc_msgSend(v5, "is_canceled")) {
                                    goto LABEL_551;
                                  }
                                  v152 = _os_activity_create((void *)&_mh_execute_header, "Render Page", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
                                  os_activity_scope_enter(v152, &state);

                                  if (document) {
                                    break;
                                  }
                                  if (!v364 || v364(v347, &v348))
                                  {
                                    size_t Width = CGImageGetWidth(image);
                                    size_t Height = CGImageGetHeight(image);
                                    if (v314 <= 4) {
                                      unint64_t v167 = Width;
                                    }
                                    else {
                                      unint64_t v167 = Height;
                                    }
                                    if (v314 <= 4) {
                                      unint64_t v168 = Height;
                                    }
                                    else {
                                      unint64_t v168 = Width;
                                    }
                                    double v169 = (double)v168;
                                    double v170 = (double)v167;
                                    if (v299)
                                    {
                                      if (osloga == -90) {
                                        int v171 = -1;
                                      }
                                      else {
                                        int v171 = 0;
                                      }
                                      if (osloga == 90) {
                                        int v172 = 1;
                                      }
                                      else {
                                        int v172 = v171;
                                      }
                                    }
                                    else
                                    {
                                      BOOL v177 = v302 < v301;
                                      if (v170 <= v169) {
                                        BOOL v177 = 0;
                                      }
                                      if ((v170 >= v169 || v302 <= v301) && !v177)
                                      {
                                        int v172 = 0;
                                      }
                                      else if (objc_msgSend(v5, "printer_preferred_landscape", v302) == 5)
                                      {
                                        int v172 = -1;
                                      }
                                      else
                                      {
                                        int v172 = 1;
                                      }
                                    }
                                    if (v172) {
                                      double v190 = v169;
                                    }
                                    else {
                                      double v190 = v170;
                                    }
                                    double v191 = v302 / v190;
                                    if (v172) {
                                      double v192 = v170;
                                    }
                                    else {
                                      double v192 = v169;
                                    }
                                    double v193 = v301 / v192;
                                    if (v300 == 1)
                                    {
                                      if (v191 >= v193) {
                                        double v194 = v193;
                                      }
                                      else {
                                        double v194 = v191;
                                      }
                                    }
                                    else
                                    {
                                      double v194 = v285;
                                      if (v300 == 2)
                                      {
                                        if (v191 <= v193) {
                                          double v194 = v193;
                                        }
                                        else {
                                          double v194 = v191;
                                        }
                                      }
                                    }
                                    v389.origin.CGFloat x = v297.f64[0] + (v302 - v170 * v194) * 0.5;
                                    double v150 = 0.5;
                                    v389.origin.CGFloat y = v296 + (v301 - v169 * v194) * 0.5;
                                    v389.size.double width = v194 * v170;
                                    v389.size.double height = v194 * v169;
                                    *(_OWORD *)v384 = 0u;
                                    memset(buf, 0, sizeof(buf));
                                    _lite_page_transform(v389, (unint64_t)v170, (unint64_t)v169, v314, v172, *(int *)v286, (uint64_t)buf);
                                    v195 = _PKLogCategory(PKLogCategoryProgress[0]);
                                    if (os_log_type_enabled(v195, OS_LOG_TYPE_DEFAULT))
                                    {
                                      unsigned int v196 = objc_msgSend(v5, "printd_job_id");
                                      if (v5) {
                                        unsigned int v197 = objc_msgSend(v5, "destination_job_id");
                                      }
                                      else {
                                        unsigned int v197 = -1;
                                      }
                                      LODWORD(v387.a) = 67110146;
                                      HIDWORD(v387.a) = v196;
                                      LOWORD(v387.b) = 1024;
                                      *(_DWORD *)((char *)&v387.b + 2) = v197;
                                      HIWORD(v387.b) = 1024;
                                      LODWORD(v387.c) = osloga;
                                      WORD2(v387.c) = 2080;
                                      *(void *)((char *)&v387.c + 6) = v287;
                                      HIWORD(v387.d) = 1024;
                                      LODWORD(v387.tx) = v298;
                                      _os_log_impl((void *)&_mh_execute_header, v195, OS_LOG_TYPE_DEFAULT, "[Job %d][%d] lite_print_pdf_or_image: Drawing image with rotation:%d scale_type:%s scale_down_only:%d", (uint8_t *)&v387, 0x24u);
                                    }

                                    v324[0] = *(_OWORD *)buf;
                                    v324[1] = *(_OWORD *)&buf[16];
                                    v324[2] = *(_OWORD *)v384;
                                    unint64_t v84 = sub_100027854(0, image, v324, 1, (uint64_t)&v340, 0, v315);
                                    v202 = v201;
                                    int v164 = 0;
                                    if (!v84) {
                                      goto LABEL_473;
                                    }
LABEL_464:
                                    if ((v84 & 0x100000000) != 0)
                                    {
                                      v251 = _PKLogCategory(PKLogCategoryProgress[0]);
                                      if (os_log_type_enabled(v251, OS_LOG_TYPE_DEFAULT))
                                      {
                                        unsigned int v252 = objc_msgSend(v5, "printd_job_id");
                                        if (v5) {
                                          unsigned int v253 = objc_msgSend(v5, "destination_job_id");
                                        }
                                        else {
                                          unsigned int v253 = -1;
                                        }
                                        v254 = "Unknown";
                                        if (v202) {
                                          v254 = v202;
                                        }
                                        *(_DWORD *)long long buf = 67109634;
                                        *(_DWORD *)&uint8_t buf[4] = v252;
                                        *(_WORD *)&uint8_t buf[8] = 1024;
                                        *(_DWORD *)&buf[10] = v253;
                                        *(_WORD *)&buf[14] = 2080;
                                        *(void *)&uint8_t buf[16] = v254;
                                        _os_log_impl((void *)&_mh_execute_header, v251, OS_LOG_TYPE_DEFAULT, "[Job %d][%d] lite_print_pdf_or_image: Setting cancel flag after fatal error: %s.", buf, 0x18u);
                                      }

                                      objc_msgSend(v5, "set_cancel_flag");
                                    }
LABEL_473:
                                    if (v365)
                                    {
                                      BOOL v255 = v365(v347) == 0;
                                      if (!v84) {
                                        LODWORD(v84) = v255;
                                      }
                                    }
                                    unsigned int v256 = [v5 sheetsCompleted];
                                    id v257 = [v5 sheetsCompleted];
                                    v258 = +[NSString stringWithFormat:@"lite_print_pdf_or_image: PAGE %d - %ux%ux%u %udpi", v257, v351, v352, v348, v353];
                                    [v5 updateSheetsAndPostNotification:v256 + 1 logMsg:v258];

                                    if (v164)
                                    {
                                      CGContextRef v340 = v295;
                                      int v341 = v294;
                                      size_t v342 = v293;
                                      size_t v372 = v292;
                                      double v344 = v291;
                                      LOBYTE(v348) = v290;
                                      HIBYTE(v348) = v289;
                                    }
                                    os_activity_scope_leave(&state);
                                    char v259 = 1;
                                    goto LABEL_525;
                                  }
LABEL_524:
                                  char v259 = 0;
                                  LODWORD(v84) = 1;
LABEL_525:
                                  if ((v259 & 1) != 0 && ++v151 < (unint64_t)v319 && !v84) {
                                    continue;
                                  }
                                  goto LABEL_552;
                                }
                                if (v321)
                                {
                                  signed int v153 = v334;
                                  id v154 = v321;
                                  v155 = v154;
                                  int v156 = v151 + 1;
                                  if (v153 == v319 || (v303 || v156 != v319) && (!v303 || (int v156 = v151) != 0))
                                  {
                                    v157 = (char *)[v154 count];
                                    v158 = v157;
                                    if (v303)
                                    {
                                      unsigned int v159 = v157 - 1;
                                      while ((v159 & 0x80000000) == 0)
                                      {
                                        v160 = [v155 objectAtIndexedSubscript:v159];
                                        unsigned int v161 = [v160 rangeValue];
                                        int v163 = v162;

                                        v156 -= v163;
                                        --v159;
                                        if (v156 <= 0)
                                        {
                                          int v164 = v161 - v156 + 1;
                                          goto LABEL_349;
                                        }
                                      }
                                    }
                                    else if (v157)
                                    {
                                      v180 = 0;
                                      while (1)
                                      {
                                        v181 = [v155 objectAtIndexedSubscript:v180];
                                        unsigned int v182 = [v181 rangeValue];
                                        int v184 = v183;

                                        if (v156 - v184 <= 0) {
                                          break;
                                        }
                                        ++v180;
                                        v156 -= v184;
                                        if (v158 == v180) {
                                          goto LABEL_348;
                                        }
                                      }
                                      int v164 = v156 + v182;
LABEL_349:

                                      if (v164) {
                                        goto LABEL_350;
                                      }
                                      goto LABEL_320;
                                    }
                                  }
LABEL_348:
                                  int v164 = 0;
                                  goto LABEL_349;
                                }
                                if (v334 == v319)
                                {
                                  if (v303) {
                                    int v164 = v319 - v151;
                                  }
                                  else {
                                    int v164 = v151 + 1;
                                  }
                                  if (v164) {
                                    goto LABEL_350;
                                  }
LABEL_320:
                                  uint64_t v173 = 0;
LABEL_321:
                                  v174 = v367;
                                  if (!v367)
                                  {
                                    double v189 = 0.0;
                                    v176 = 0;
                                    goto LABEL_387;
                                  }
                                  char v175 = 1;
                                  v176 = 0;
                                  goto LABEL_377;
                                }
                                if (v303)
                                {
                                  if (v151)
                                  {
                                    int v164 = v319 - v151;
                                    if (v319 != v151)
                                    {
LABEL_350:
                                      uint64_t v173 = v164;
                                      Page = CGPDFDocumentGetPage(document, v164);
                                      v176 = Page;
                                      if (!Page)
                                      {
                                        v186 = _PKLogCategory(PKLogCategoryProgress[0]);
                                        if (os_log_type_enabled(v186, OS_LOG_TYPE_ERROR))
                                        {
                                          unsigned int v187 = objc_msgSend(v5, "printd_job_id");
                                          if (v5) {
                                            unsigned int v188 = objc_msgSend(v5, "destination_job_id");
                                          }
                                          else {
                                            unsigned int v188 = -1;
                                          }
                                          *(_DWORD *)long long buf = 67109632;
                                          *(_DWORD *)&uint8_t buf[4] = v187;
                                          *(_WORD *)&uint8_t buf[8] = 1024;
                                          *(_DWORD *)&buf[10] = v188;
                                          *(_WORD *)&buf[14] = 1024;
                                          *(_DWORD *)&uint8_t buf[16] = v164;
                                          _os_log_impl((void *)&_mh_execute_header, v186, OS_LOG_TYPE_ERROR, "[Job %d][%d] Could not get PDF page %d", buf, 0x14u);
                                        }

                                        objc_msgSend(v5, "set_cancel_flag");
                                        goto LABEL_524;
                                      }
                                      if (!v367 || isColorPage(Page))
                                      {
                                        int v164 = 0;
                                        goto LABEL_412;
                                      }
                                      char v175 = 0;
                                      v174 = v367;
LABEL_377:
                                      CGContextRef v340 = v174;
                                      int v341 = 1;
                                      size_t v342 = v368;
                                      size_t v372 = v369;
                                      double v344 = v370;
                                      __int16 v348 = 8;
                                      v198 = _PKLogCategory(PKLogCategoryProgress[0]);
                                      if (os_log_type_enabled(v198, OS_LOG_TYPE_DEFAULT))
                                      {
                                        unsigned int v199 = objc_msgSend(v5, "printd_job_id");
                                        if (v5) {
                                          unsigned int v200 = objc_msgSend(v5, "destination_job_id");
                                        }
                                        else {
                                          unsigned int v200 = -1;
                                        }
                                        *(_DWORD *)long long buf = 67109632;
                                        *(_DWORD *)&uint8_t buf[4] = v199;
                                        *(_WORD *)&uint8_t buf[8] = 1024;
                                        *(_DWORD *)&buf[10] = v200;
                                        *(_WORD *)&buf[14] = 1024;
                                        *(_DWORD *)&uint8_t buf[16] = v164;
                                        _os_log_impl((void *)&_mh_execute_header, v198, OS_LOG_TYPE_DEFAULT, "[Job %d][%d] Optimizing sheet number %d; rendering in monochrome",
                                          buf,
                                          0x14u);
                                      }

                                      double v189 = 0.0;
                                      int v164 = 1;
                                      if (v175) {
                                        goto LABEL_387;
                                      }
LABEL_412:
                                      CGRect BoxRect = CGPDFPageGetBoxRect(v176, kCGPDFCropBox);
                                      double v229 = BoxRect.size.width;
                                      double v230 = BoxRect.size.height;
                                      int v231 = CGPDFPageGetRotationAngle(v176) % 360;
                                      int v232 = v231 + (v231 < 0 ? 0x168 : 0);
                                      BOOL v233 = v232 == 90 || v232 == 270;
                                      if (v233) {
                                        double v204 = v230;
                                      }
                                      else {
                                        double v204 = v229;
                                      }
                                      if (!v233) {
                                        double v229 = v230;
                                      }
                                      if (v300)
                                      {
                                        if (v284) {
                                          goto LABEL_442;
                                        }
                                        BOOL v234 = osloga == 90 || osloga == -90;
                                        int v235 = v234;
                                        double v236 = v313;
                                        if (!v234) {
                                          double v236 = v312;
                                        }
                                        if (vabdd_f64(v229, v236) >= 1.0) {
                                          goto LABEL_442;
                                        }
                                        double v237 = v313;
                                        if (v235) {
                                          double v237 = v312;
                                        }
                                        double v189 = 0.0;
                                        if (vabdd_f64(v204, v237) >= 1.0)
                                        {
LABEL_442:
                                          if (v283) {
                                            goto LABEL_443;
                                          }
                                          double v238 = v312;
                                          double v239 = vabdd_f64(v229, v312);
                                          double v189 = 0.0;
                                          if (vabdd_f64(v204, v313) < 1.0 && v239 < 1.0)
                                          {
                                            int osloga = 0;
                                            double v311 = 0.0;
                                            double v309 = v313;
                                            goto LABEL_550;
                                          }
                                          double v241 = vabdd_f64(v204, v312);
                                          if (vabdd_f64(v229, v313) >= 1.0 || v241 >= 1.0)
                                          {
LABEL_443:
                                            double v243 = v204 / v229;
                                            if (v300 == 2)
                                            {
                                              if (v204 == 0.0 || v229 == 0.0) {
                                                double v245 = v282;
                                              }
                                              else {
                                                double v245 = v204 / v229;
                                              }
                                              if (v299)
                                              {
                                                if (osloga == 90)
                                                {
                                                  double v246 = v296;
                                                }
                                                else
                                                {
                                                  double v246 = v296;
                                                  if (osloga != -90) {
                                                    goto LABEL_545;
                                                  }
                                                }
                                              }
                                              else
                                              {
                                                if (vabdd_f64(v229, v204) <= 1.0)
                                                {
                                                  int osloga = 0;
                                                  double v246 = v296;
LABEL_545:
                                                  if (v282 > v245)
                                                  {
                                                    double v270 = (v302 / v245 - v301) * v150;
                                                    double v311 = v246 - v270;
                                                    double v204 = v301 + v270 * 2.0;
                                                    double v189 = v297.f64[0];
                                                    double v309 = v302;
                                                    goto LABEL_389;
                                                  }
                                                  double v238 = v301;
                                                  double v271 = 0.0;
                                                  if (v301 * (v245 - v282) > 1.0) {
                                                    double v271 = (v278 + v301 * v245) * v150;
                                                  }
                                                  double v189 = v297.f64[0] - v271;
                                                  double v309 = v302 + v271 * 2.0;
                                                  double v311 = v246;
LABEL_550:
                                                  double v204 = v238;
                                                  goto LABEL_389;
                                                }
                                                BOOL v264 = v245 > 1.0;
                                                if (v282 >= 1.0) {
                                                  BOOL v264 = 0;
                                                }
                                                BOOL v266 = (v282 <= 1.0 || v245 >= 1.0) && !v264;
                                                double v246 = v296;
                                                if (v266)
                                                {
                                                  int osloga = 0;
                                                  goto LABEL_545;
                                                }
                                                if (objc_msgSend(v5, "printer_preferred_landscape", v282) == 5) {
                                                  int v267 = -90;
                                                }
                                                else {
                                                  int v267 = 90;
                                                }
                                                int osloga = v267;
                                              }
                                              double v245 = 1.0 / v245;
                                              goto LABEL_545;
                                            }
                                            if (v229 == 0.0) {
                                              double v243 = v281;
                                            }
                                            if ((v299 & 1) == 0)
                                            {
                                              if (vabdd_f64(v229, v204) > 1.0)
                                              {
                                                BOOL v260 = v243 > 1.0;
                                                if (v281 >= 1.0) {
                                                  BOOL v260 = 0;
                                                }
                                                if ((v281 <= 1.0 || v243 >= 1.0) && !v260)
                                                {
                                                  int osloga = 0;
                                                }
                                                else
                                                {
                                                  if (objc_msgSend(v5, "printer_preferred_landscape") == 5) {
                                                    int v263 = -90;
                                                  }
                                                  else {
                                                    int v263 = 90;
                                                  }
                                                  int osloga = v263;
                                                }
                                                double v189 = v297.f64[0];
                                                double v311 = v296;
                                                goto LABEL_543;
                                              }
                                              int osloga = 0;
                                            }
                                            double v189 = v297.f64[0];
                                            double v311 = v296;
LABEL_543:
                                            double v204 = v279;
                                            double v203 = v280;
                                            goto LABEL_388;
                                          }
                                          if (objc_msgSend(v5, "printer_preferred_landscape", v241) == 5) {
                                            int v269 = -90;
                                          }
                                          else {
                                            int v269 = 90;
                                          }
                                          int osloga = v269;
                                        }
LABEL_387:
                                        double v311 = 0.0;
                                        double v204 = v312;
                                        double v203 = v313;
LABEL_388:
                                        double v309 = v203;
LABEL_389:
                                        if (!v364 || v364(v347, &v348))
                                        {
                                          if ((v300 - 1) > 1)
                                          {
                                            v401.origin.CGFloat x = v189;
                                            v401.origin.CGFloat y = v311;
                                            v401.size.double width = v309;
                                            v401.size.double height = v204;
                                            CGPDFPageGetDrawingTransform((CGAffineTransform *)buf, v176, kCGPDFCropBox, v401, -osloga, 1);
                                            *(_OWORD *)&v327.a = *(_OWORD *)buf;
                                            *(_OWORD *)&v327.c = *(_OWORD *)&buf[16];
                                            *(_OWORD *)&v327.tCGFloat x = *(_OWORD *)v384;
                                          }
                                          else
                                          {
                                            CGFloat rect = v204;
                                            CGFloat v205 = v189;
                                            CGRect v390 = CGPDFPageGetBoxRect(v176, kCGPDFCropBox);
                                            CGFloat x = v390.origin.x;
                                            CGFloat y = v390.origin.y;
                                            CGFloat v208 = v390.size.width;
                                            CGFloat v209 = v390.size.height;
                                            CGRect v402 = CGPDFPageGetBoxRect(v176, kCGPDFMediaBox);
                                            v391.origin.CGFloat x = x;
                                            v391.origin.CGFloat y = y;
                                            v391.size.double width = v208;
                                            v391.size.double height = v209;
                                            CGRect v392 = CGRectIntersection(v391, v402);
                                            CGFloat v210 = v392.origin.x;
                                            CGFloat v211 = v392.origin.y;
                                            CGFloat v212 = v392.size.width;
                                            CGFloat v213 = v392.size.height;
                                            double MinX = CGRectGetMinX(v392);
                                            v393.origin.CGFloat x = v210;
                                            v393.origin.CGFloat y = v211;
                                            v393.size.double width = v212;
                                            v393.size.double height = v213;
                                            double MinY = CGRectGetMinY(v393);
                                            v394.origin.CGFloat x = v210;
                                            v394.origin.CGFloat y = v211;
                                            v394.size.double width = v212;
                                            v394.size.double height = v213;
                                            double v216 = CGRectGetWidth(v394);
                                            v395.origin.CGFloat x = v210;
                                            v395.origin.CGFloat y = v211;
                                            v395.size.double width = v212;
                                            v395.size.double height = v213;
                                            double v217 = CGRectGetHeight(v395);
                                            CGAffineTransformMakeTranslation(&v382, -(MinX + v216 * 0.5), -(MinY + v217 * 0.5));
                                            int v218 = (CGPDFPageGetRotationAngle(v176) - osloga) % 360;
                                            if (v218 >= 0) {
                                              int v219 = v218;
                                            }
                                            else {
                                              int v219 = v218 + 360;
                                            }
                                            CGAffineTransformMakeRotation((CGAffineTransform *)buf, (double)v219 * -3.14159265 / 180.0);
                                            BOOL v220 = v219 == 90 || v219 == 270;
                                            if (v220) {
                                              double v221 = v216;
                                            }
                                            else {
                                              double v221 = v217;
                                            }
                                            if (v220) {
                                              double v222 = v217;
                                            }
                                            else {
                                              double v222 = v216;
                                            }
                                            v396.origin.CGFloat x = v205;
                                            v396.origin.CGFloat y = v311;
                                            v396.size.double width = v309;
                                            v396.size.double height = rect;
                                            double v223 = CGRectGetMinX(v396);
                                            v397.origin.CGFloat x = v205;
                                            v397.origin.CGFloat y = v311;
                                            v397.size.double width = v309;
                                            v397.size.double height = rect;
                                            double v224 = CGRectGetMinY(v397);
                                            v398.origin.CGFloat x = v205;
                                            v398.origin.CGFloat y = v311;
                                            v398.size.double width = v309;
                                            v398.size.double height = rect;
                                            double v225 = CGRectGetWidth(v398);
                                            v399.origin.CGFloat x = v205;
                                            v399.origin.CGFloat y = v311;
                                            v399.size.double width = v309;
                                            v399.size.double height = rect;
                                            double v226 = CGRectGetHeight(v399);
                                            double v227 = v225 / v222;
                                            double v228 = v226 / v221;
                                            if (v298)
                                            {
                                              if (v227 > 1.0) {
                                                double v227 = 1.0;
                                              }
                                              if (v228 > 1.0) {
                                                double v228 = 1.0;
                                              }
                                            }
                                            if (v227 >= v228) {
                                              double v227 = v228;
                                            }
                                            CGAffineTransformMakeScale(&v387, v227, v227);
                                            double v150 = 0.5;
                                            CGAffineTransformMakeTranslation(&v381, v223 + v225 * 0.5, v224 + v226 * 0.5);
                                            CGAffineTransform v380 = v382;
                                            *(_OWORD *)&v379.a = *(_OWORD *)buf;
                                            *(_OWORD *)&v379.c = *(_OWORD *)&buf[16];
                                            *(_OWORD *)&v379.tCGFloat x = *(_OWORD *)v384;
                                            CGAffineTransformConcat(&v326, &v380, &v379);
                                            CGAffineTransform v377 = v326;
                                            CGAffineTransform v376 = v387;
                                            CGAffineTransformConcat(&v378, &v377, &v376);
                                            CGAffineTransform v326 = v378;
                                            CGAffineTransform v375 = v378;
                                            CGAffineTransform v374 = v381;
                                            CGAffineTransformConcat(&v378, &v375, &v374);
                                            CGAffineTransform v326 = v378;
                                            CGAffineTransform v327 = v378;
                                          }
                                          v247 = _PKLogCategory(PKLogCategoryProgress[0]);
                                          if (os_log_type_enabled(v247, OS_LOG_TYPE_DEFAULT))
                                          {
                                            unsigned int v248 = objc_msgSend(v5, "printd_job_id");
                                            if (v5) {
                                              unsigned int v249 = objc_msgSend(v5, "destination_job_id");
                                            }
                                            else {
                                              unsigned int v249 = -1;
                                            }
                                            *(_DWORD *)long long buf = 67110402;
                                            *(_DWORD *)&uint8_t buf[4] = v248;
                                            *(_WORD *)&uint8_t buf[8] = 1024;
                                            *(_DWORD *)&buf[10] = v249;
                                            *(_WORD *)&buf[14] = 2048;
                                            *(void *)&uint8_t buf[16] = v173;
                                            *(_WORD *)&buf[24] = 1024;
                                            *(_DWORD *)&buf[26] = osloga;
                                            *(_WORD *)&buf[30] = 2080;
                                            *(void *)v384 = v287;
                                            *(_WORD *)&v384[8] = 1024;
                                            *(_DWORD *)&v384[10] = v298;
                                            _os_log_impl((void *)&_mh_execute_header, v247, OS_LOG_TYPE_DEFAULT, "[Job %d][%d] lite_print_pdf_or_image: Drawing PDF page #%zd rotation:%d scale_type:%s scale_down_only:%d", buf, 0x2Eu);
                                          }

                                          CGAffineTransform v325 = v327;
                                          unint64_t v84 = sub_100027854(v176, 0, &v325, v173, (uint64_t)&v340, (_OWORD *)((v151 << 63 >> 63) & (unint64_t)v288), v315);
                                          v202 = v250;
                                          if (v84) {
                                            goto LABEL_464;
                                          }
                                          goto LABEL_473;
                                        }
                                        goto LABEL_524;
                                      }
                                      if (v299)
                                      {
                                        if (!osloga)
                                        {
LABEL_498:
                                          int osloga = 0;
                                          double v189 = (v313 - v204) * 0.5;
                                          double v150 = 0.5;
                                          double v311 = (v312 - v229) * 0.5;
                                          double v309 = v204;
                                          double v204 = v229;
                                          goto LABEL_389;
                                        }
                                      }
                                      else
                                      {
                                        if (v313 != v312 && v204 <= v229) {
                                          goto LABEL_498;
                                        }
                                        if (objc_msgSend(v5, "printer_preferred_landscape", v313) == 5) {
                                          int v268 = -90;
                                        }
                                        else {
                                          int v268 = 90;
                                        }
                                        int osloga = v268;
                                      }
                                      double v189 = (v313 - v229) * 0.5;
                                      double v150 = 0.5;
                                      double v311 = (v312 - v204) * 0.5;
                                      double v309 = v229;
                                      goto LABEL_389;
                                    }
                                    goto LABEL_320;
                                  }
                                }
                                else if (v334 != v151)
                                {
                                  int v164 = v151 + 1;
                                  if (v151 != -1) {
                                    goto LABEL_350;
                                  }
                                  goto LABEL_320;
                                }
                                uint64_t v173 = 0;
                                int v164 = 0;
                                goto LABEL_321;
                              }
                              if (v104 == 2) {
                                goto LABEL_566;
                              }
                            }
LABEL_270:
                            v288 = 0;
                            goto LABEL_271;
                          }
                          if ([v320 compare:@"auto-fit"])
                          {
                            if ([v320 compare:@"none"]) {
                              int v129 = v300;
                            }
                            else {
                              int v129 = 0;
                            }
                            goto LABEL_236;
                          }
                        }
                        int v25 = 0;
                        int v129 = 1;
                        goto LABEL_236;
                      }
                      v109 = _PKLogCategory(PKLogCategoryProgress[0]);
                      if (os_log_type_enabled(v109, OS_LOG_TYPE_ERROR))
                      {
                        unsigned int v130 = objc_msgSend(v5, "printd_job_id");
                        if (v5) {
                          unsigned int v131 = objc_msgSend(v5, "destination_job_id");
                        }
                        else {
                          unsigned int v131 = -1;
                        }
                        *(_DWORD *)long long buf = 67109376;
                        *(_DWORD *)&uint8_t buf[4] = v130;
                        *(_WORD *)&uint8_t buf[8] = 1024;
                        *(_DWORD *)&buf[10] = v131;
                        _os_log_impl((void *)&_mh_execute_header, v109, OS_LOG_TYPE_ERROR, "[Job %d][%d] lite_print_pdf_or_image: Unable to start job.", buf, 0xEu);
                      }
                    }

                    LODWORD(v84) = 0;
                    goto LABEL_124;
                  }
                  id v94 = _PKLogCategory(PKLogCategoryProgress[0]);
                  if (os_log_type_enabled(v94, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)long long buf = 67109888;
                    *(_DWORD *)&uint8_t buf[4] = v371;
                    *(_WORD *)&uint8_t buf[8] = 1024;
                    *(_DWORD *)&buf[10] = v63;
                    *(_WORD *)&buf[14] = 1024;
                    *(_DWORD *)&uint8_t buf[16] = v60;
                    *(_WORD *)&buf[20] = 1024;
                    *(_DWORD *)&buf[22] = v342;
                    _os_log_impl((void *)&_mh_execute_header, v94, OS_LOG_TYPE_DEFAULT, "lite_create_context: Unable to create bitmap context: raster_width=%d, band_height=%d, bits_per_component=%d, bytes_per_row=%d.", buf, 0x1Au);
                  }

                  dispatch_data_t v95 = v373;
                  if (!v373) {
                    goto LABEL_123;
                  }
LABEL_169:
                  dispatch_data_t v373 = 0;

                  goto LABEL_123;
                }
LABEL_114:
                double v64 = _PKLogCategory(PKLogCategoryProgress[0]);
                if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)long long buf = 134217984;
                  *(void *)&uint8_t buf[4] = v65;
                  _os_log_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_DEFAULT, "Unable to allocate %lld bytes memory.", buf, 0xCu);
                }
                goto LABEL_89;
              }
              CFDataRef v78 = _PKLogCategory(PKLogCategoryProgress[0]);
              if (os_log_type_enabled(v78, OS_LOG_TYPE_DEFAULT))
              {
                int v79 = *__error();
                *(_DWORD *)long long buf = 136315394;
                *(void *)&uint8_t buf[4] = "allocRaster";
                *(_WORD *)&buf[12] = 1024;
                *(_DWORD *)&buf[14] = v79;
                _os_log_impl((void *)&_mh_execute_header, v78, OS_LOG_TYPE_DEFAULT, "%s: dispatch_data_create failure: %d", buf, 0x12u);
              }

              v76 = v373;
              if (!v373) {
                goto LABEL_114;
              }
              dispatch_data_t v373 = 0;
            }

            goto LABEL_114;
          }
        }
        unsigned int v59 = 4;
        goto LABEL_78;
      }
      long long v331 = xmmword_10006EC10;
      *(void *)&long long v333 = 0;
      long long v332 = 0x3FF0000000000000uLL;
      double v55 = v47 / v48;
    }
    *((double *)&v333 + 1) = v55;
    goto LABEL_67;
  }
  if (v340)
  {
    if (CGBitmapContextGetData(v340))
    {
      dispatch_data_t v46 = v373;
      if (v373)
      {
        dispatch_data_t v373 = 0;
      }
    }
    CGContextRelease(v340);
    CGContextRelease(v367);
  }
  CGPDFDocumentRelease(document);
  CGImageRelease(image);
  if ([v5 closeDriver:v347] && objc_msgSend(v5, "is_canceled")) {
    [v5 finishJob:8];
  }
  else {
    [v5 resetJob];
  }
LABEL_137:
}

void sub_1000254B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,void *a60,void *a61)
{
  sub_10002826C((id *)&STACK[0x360]);
  _Unwind_Resume(a1);
}

uint64_t lite_print_pdf(void *a1)
{
  uint64_t v7 = 0;
  unsigned int v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10002580C;
  v4[3] = &unk_1000A21A8;
  id v5 = a1;
  long long v6 = &v7;
  id v1 = v5;
  [v1 _withActivity:v4];

  uint64_t v2 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v2;
}

void sub_1000257E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, uint64_t a7, ...)
{
  va_start(va, a7);

  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10002580C(uint64_t a1, os_activity_t activity)
{
  unsigned int v3 = _os_activity_create((void *)&_mh_execute_header, "Thread: Render and Print PDF", activity, OS_ACTIVITY_FLAG_DEFAULT);
  unsigned int v4 = _PKLogCategory(PKLogCategoryProgress[0]);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v5 = objc_msgSend(*(id *)(a1 + 32), "printd_job_id");
    long long v6 = *(void **)(a1 + 32);
    if (v6) {
      unsigned int v7 = objc_msgSend(v6, "destination_job_id");
    }
    else {
      unsigned int v7 = -1;
    }
    *(_DWORD *)long long buf = 67109890;
    unsigned int v21 = v5;
    __int16 v22 = 1024;
    unsigned int v23 = v7;
    __int16 v24 = 2048;
    int v25 = v3;
    __int16 v26 = 2080;
    unsigned int v27 = "Thread: Render and Print PDF";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[Job %d][%d] Activity (%p) ENTER: %s", buf, 0x22u);
  }

  int v14 = _NSConcreteStackBlock;
  uint64_t v15 = 3221225472;
  int v16 = sub_100025A84;
  int v17 = &unk_1000A2180;
  id v8 = *(id *)(a1 + 32);
  uint64_t v9 = *(void *)(a1 + 40);
  id v18 = v8;
  uint64_t v19 = v9;
  os_activity_apply(v3, &v14);
  uint64_t v10 = _PKLogCategory(PKLogCategoryProgress[0]);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v11 = objc_msgSend(*(id *)(a1 + 32), "printd_job_id", v14, v15, v16, v17);
    id v12 = *(void **)(a1 + 32);
    if (v12) {
      unsigned int v13 = objc_msgSend(v12, "destination_job_id");
    }
    else {
      unsigned int v13 = -1;
    }
    *(_DWORD *)long long buf = 67109890;
    unsigned int v21 = v11;
    __int16 v22 = 1024;
    unsigned int v23 = v13;
    __int16 v24 = 2048;
    int v25 = v3;
    __int16 v26 = 2080;
    unsigned int v27 = "Thread: Render and Print PDF";
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[Job %d][%d] Activity (%p) EXIT: %s", buf, 0x22u);
  }
}

void sub_100025A44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_100025A84(uint64_t a1)
{
  uint64_t v2 = _PKLogCategory(PKLogCategoryProgress[0]);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v3 = objc_msgSend(*(id *)(a1 + 32), "printd_job_id");
    unsigned int v4 = *(void **)(a1 + 32);
    if (v4) {
      unsigned int v5 = objc_msgSend(v4, "destination_job_id");
    }
    else {
      unsigned int v5 = -1;
    }
    v6[0] = 67109634;
    v6[1] = v3;
    __int16 v7 = 1024;
    unsigned int v8 = v5;
    __int16 v9 = 2080;
    uint64_t v10 = "lite_print_pdf_block_invoke";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "[Job %d][%d] #### %s.", (uint8_t *)v6, 0x18u);
  }

  sub_100022954(*(void **)(a1 + 32), 0, kCGInterpolationHigh);
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
}

void sub_100025B98(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t lite_print_redraw_pdf(void *a1)
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100025C58;
  void v3[3] = &unk_1000A21D0;
  id v4 = a1;
  id v1 = v4;
  [v1 _withActivity:v3];

  return 0;
}

void sub_100025C40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_100025C58(uint64_t a1, os_activity_t activity)
{
  unsigned int v3 = _os_activity_create((void *)&_mh_execute_header, "Thread: Print Redrawn PDF File ", activity, OS_ACTIVITY_FLAG_DEFAULT);
  id v4 = _PKLogCategory(PKLogCategoryProgress[0]);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v5 = objc_msgSend(*(id *)(a1 + 32), "printd_job_id");
    long long v6 = *(void **)(a1 + 32);
    if (v6) {
      unsigned int v7 = objc_msgSend(v6, "destination_job_id");
    }
    else {
      unsigned int v7 = -1;
    }
    *(_DWORD *)long long buf = 67109890;
    unsigned int v15 = v5;
    __int16 v16 = 1024;
    unsigned int v17 = v7;
    __int16 v18 = 2048;
    uint64_t v19 = v3;
    __int16 v20 = 2080;
    unsigned int v21 = "Thread: Print Redrawn PDF File ";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[Job %d][%d] Activity (%p) ENTER: %s", buf, 0x22u);
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100025ECC;
  block[3] = &unk_100095360;
  id v13 = *(id *)(a1 + 32);
  os_activity_apply(v3, block);
  unsigned int v8 = _PKLogCategory(PKLogCategoryProgress[0]);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v9 = objc_msgSend(*(id *)(a1 + 32), "printd_job_id");
    uint64_t v10 = *(void **)(a1 + 32);
    if (v10) {
      unsigned int v11 = objc_msgSend(v10, "destination_job_id");
    }
    else {
      unsigned int v11 = -1;
    }
    *(_DWORD *)long long buf = 67109890;
    unsigned int v15 = v9;
    __int16 v16 = 1024;
    unsigned int v17 = v11;
    __int16 v18 = 2048;
    uint64_t v19 = v3;
    __int16 v20 = 2080;
    unsigned int v21 = "Thread: Print Redrawn PDF File ";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[Job %d][%d] Activity (%p) EXIT: %s", buf, 0x22u);
  }
}

void sub_100025E8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_100025ECC(uint64_t a1)
{
  uint64_t v2 = _PKLogCategory(PKLogCategoryProgress[0]);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v3 = objc_msgSend(*(id *)(a1 + 32), "printd_job_id");
    id v4 = *(void **)(a1 + 32);
    if (v4) {
      unsigned int v5 = objc_msgSend(v4, "destination_job_id");
    }
    else {
      unsigned int v5 = -1;
    }
    *(_DWORD *)long long buf = 67109634;
    unsigned int v66 = v3;
    __int16 v67 = 1024;
    unsigned int v68 = v5;
    __int16 v69 = 2080;
    size_t v70 = "lite_print_redraw_pdf_block_invoke";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "[Job %d][%d] #### %s.", buf, 0x18u);
  }

  id v58 = *(id *)(a1 + 32);
  id v71 = 0;
  liteSetThreadPriority(1u);
  long long v6 = _PKLogCategory(PKLogCategoryProgress[0]);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v7 = objc_msgSend(v58, "printd_job_id");
    if (v58) {
      unsigned int v8 = objc_msgSend(v58, "destination_job_id");
    }
    else {
      unsigned int v8 = -1;
    }
    id v9 = [v58 spoolDocumentFilename];
    *(_DWORD *)unsigned int v61 = 67109634;
    *(_DWORD *)&v61[4] = v7;
    LOWORD(v62) = 1024;
    *(_DWORD *)((char *)&v62 + 2) = v8;
    HIWORD(v62) = 2080;
    *(void *)&long long v63 = [v9 UTF8String];
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[Job %d][%d] lite_print_redraw_pdf: filename=%s", v61, 0x18u);
  }
  objc_msgSend(v58, "set_processing");
  id v10 = [v58 spoolDocumentFilename];
  unsigned int v11 = sub_100022260((const char *)[v10 UTF8String]);

  if (v11)
  {
    if (CGPDFDocumentIsEncrypted(v11))
    {
      id v12 = objc_msgSend(v58, "request_attrs");
      id v13 = (*(void (**)(id))(*(void *)v12 + 192))(v12);
      if ([v13 length])
      {
        id v14 = [v13 length];
        if ((unint64_t)v14 >= 0x7F) {
          uint64_t v15 = 127;
        }
        else {
          uint64_t v15 = (uint64_t)v14;
        }
        [v13 getBytes:v61 length:v15];
        v61[v15] = 0;
        CGPDFDocumentUnlockWithPassword(v11, (const char *)v61);
      }
    }
    if (!CGPDFDocumentAllowsPrinting(v11))
    {
      __int16 v22 = _PKLogCategory(PKLogCategoryProgress[0]);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        unsigned int v23 = objc_msgSend(v58, "printd_job_id");
        if (v58) {
          unsigned int v24 = objc_msgSend(v58, "destination_job_id");
        }
        else {
          unsigned int v24 = -1;
        }
        id v44 = [v58 spoolDocumentFilename];
        id v45 = [v44 UTF8String];
        *(_DWORD *)unsigned int v61 = 67109634;
        *(_DWORD *)&v61[4] = v23;
        LOWORD(v62) = 1024;
        *(_DWORD *)((char *)&v62 + 2) = v24;
        HIWORD(v62) = 2080;
        *(void *)&long long v63 = v45;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "[Job %d][%d] lite_print_redraw_pdf: PDF permissions do not allow printing of \"%s\".", v61, 0x18u);
      }
      unsigned int v28 = 0;
      double v57 = 0;
      goto LABEL_71;
    }
    id v16 = objc_msgSend(v58, "request_attrs");
    uint64_t v17 = (*(void (**)(id))(*(void *)v16 + 480))(v16);
    if (v17)
    {
      id v18 = objc_msgSend(v58, "request_attrs");
      double v57 = (void *)v17;
      (*(void (**)(id))(*(void *)v18 + 504))(v18);
    }
    else
    {
      int v25 = +[NSValue valueWithRange:](NSValue, "valueWithRange:", 0, CGPDFDocumentGetNumberOfPages(v11));
      unsigned int v60 = v25;
      double v57 = +[NSArray arrayWithObjects:&v60 count:1];
    }
    if (!objc_msgSend(v58, "openDriver:format:orient:num_sheets:passthru:", buf, @"application/pdf", 0, 0, 1))
    {
      unsigned int v28 = 0;
      uint64_t v41 = 8;
      goto LABEL_73;
    }
    __int16 v26 = (CGDataConsumer *)[v58 createDataConsumer];
    unsigned int v27 = v26;
    if (v26)
    {
      unsigned int v28 = CGPDFContextCreate(v26, 0, 0);
      CGDataConsumerRelease(v27);
      if (v28)
      {
        int v55 = time(0);
        Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
        if (Mutable)
        {
          for (unint64_t i = 0; (unint64_t)[v57 count] > i; ++i)
          {
            unsigned int v30 = objc_msgSend(v57, "objectAtIndexedSubscript:");
            size_t v31 = (char *)[v30 rangeValue];
            uint64_t v33 = v32;

            CFNumberRef v34 = v11;
            int v35 = &v31[v33];
            while (++v31 <= v35)
            {
              Page = CGPDFDocumentGetPage(v34, (size_t)v31);
              *(void *)unsigned int v61 = kCGPDFContextMediaBox;
              CFStringRef v62 = kCGPDFContextCropBox;
              *(void *)&long long v63 = kCGPDFContextBleedBox;
              *((void *)&v63 + 1) = kCGPDFContextTrimBox;
              CFStringRef v64 = kCGPDFContextArtBox;
              CGSize size = CGRectZero.size;
              bytes.origin = CGRectZero.origin;
              bytes.CGSize size = size;
              if (Page)
              {
                CFDictionaryRemoveAllValues(Mutable);
                for (uint64_t j = 0; j != 5; ++j)
                {
                  CGRect bytes = CGPDFPageGetBoxRect(Page, (CGPDFBox)j);
                  CFDataRef v39 = CFDataCreate(0, (const UInt8 *)&bytes, 32);
                  CFDictionarySetValue(Mutable, *(const void **)&v61[8 * j], v39);
                  CFRelease(v39);
                }
              }
              CGPDFContextBeginPage(v28, Mutable);
              if (Page)
              {
                id v40 = objc_msgSend(v58, "request_attrs");
                if ((*(unsigned int (**)(id))(*(void *)v40 + 32))(v40)) {
                  CGContextDrawPDFPageWithAnnotations();
                }
                else {
                  CGContextDrawPDFPage(v28, Page);
                }
              }
              CGContextEndPage(v28);
            }
            unsigned int v11 = v34;
          }
          CFRelease(Mutable);
          CGPDFContextClose(v28);
          int v48 = time(0);
          __int16 v22 = _PKLogCategory(PKLogCategoryProgress[0]);
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            unsigned int v49 = objc_msgSend(v58, "printd_job_id");
            if (v58) {
              unsigned int v50 = objc_msgSend(v58, "destination_job_id");
            }
            else {
              unsigned int v50 = -1;
            }
            *(_DWORD *)unsigned int v61 = 67109888;
            *(_DWORD *)&v61[4] = v49;
            LOWORD(v62) = 1024;
            *(_DWORD *)((char *)&v62 + 2) = v50;
            HIWORD(v62) = 1024;
            LODWORD(v63) = (v48 - v55) / 60;
            WORD2(v63) = 1024;
            *(_DWORD *)((char *)&v63 + 6) = (v48 - v55) % 60;
            _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "[Job %d][%d] lite_print_redraw_pdf: TIME %d:%02d", v61, 0x1Au);
          }
          uint64_t v41 = 9;
          goto LABEL_72;
        }
        __int16 v22 = _PKLogCategory(PKLogCategoryProgress[0]);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          unsigned int v51 = objc_msgSend(v58, "printd_job_id");
          if (v58) {
            unsigned int v52 = objc_msgSend(v58, "destination_job_id");
          }
          else {
            unsigned int v52 = -1;
          }
          *(_DWORD *)unsigned int v61 = 67109376;
          *(_DWORD *)&v61[4] = v51;
          LOWORD(v62) = 1024;
          *(_DWORD *)((char *)&v62 + 2) = v52;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "[Job %d][%d] lite_print_redraw_pdf: Unable to create PDF page dict", v61, 0xEu);
        }
LABEL_71:
        uint64_t v41 = 8;
LABEL_72:

LABEL_73:
        CGPDFDocumentRelease(v11);
        if (v28) {
          CGContextRelease(v28);
        }
        goto LABEL_75;
      }
      __int16 v22 = _PKLogCategory(PKLogCategoryProgress[0]);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        unsigned int v46 = objc_msgSend(v58, "printd_job_id");
        if (v58) {
          unsigned int v47 = objc_msgSend(v58, "destination_job_id");
        }
        else {
          unsigned int v47 = -1;
        }
        *(_DWORD *)unsigned int v61 = 67109376;
        *(_DWORD *)&v61[4] = v46;
        LOWORD(v62) = 1024;
        *(_DWORD *)((char *)&v62 + 2) = v47;
        unsigned int v53 = "[Job %d][%d] lite_print_redraw_pdf: Unable to create PDF context";
LABEL_69:
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, v53, v61, 0xEu);
      }
    }
    else
    {
      __int16 v22 = _PKLogCategory(PKLogCategoryProgress[0]);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        unsigned int v42 = objc_msgSend(v58, "printd_job_id");
        if (v58) {
          unsigned int v43 = objc_msgSend(v58, "destination_job_id");
        }
        else {
          unsigned int v43 = -1;
        }
        *(_DWORD *)unsigned int v61 = 67109376;
        *(_DWORD *)&v61[4] = v42;
        LOWORD(v62) = 1024;
        *(_DWORD *)((char *)&v62 + 2) = v43;
        unsigned int v53 = "[Job %d][%d] lite_print_redraw_pdf: Unable to create data consumer.";
        goto LABEL_69;
      }
    }
    unsigned int v28 = 0;
    goto LABEL_71;
  }
  uint64_t v19 = _PKLogCategory(PKLogCategoryProgress[0]);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    unsigned int v20 = objc_msgSend(v58, "printd_job_id");
    if (v58) {
      unsigned int v21 = objc_msgSend(v58, "destination_job_id");
    }
    else {
      unsigned int v21 = -1;
    }
    *(_DWORD *)unsigned int v61 = 67109376;
    *(_DWORD *)&v61[4] = v20;
    LOWORD(v62) = 1024;
    *(_DWORD *)((char *)&v62 + 2) = v21;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "[Job %d][%d] lite_print_redraw_pdf: Unable to open input PDF", v61, 0xEu);
  }

  double v57 = 0;
  uint64_t v41 = 8;
LABEL_75:
  if ([v58 closeDriver:buf])
  {
    if (objc_msgSend(v58, "is_canceled")) {
      uint64_t v54 = 7;
    }
    else {
      uint64_t v54 = v41;
    }
    [v58 finishJob:v54];
  }
  else
  {
    [v58 resetJob];
  }
}

void sub_1000268AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, void *a13)
{
  _Unwind_Resume(a1);
}

uint64_t lite_print_pdfimage(void *a1)
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100026AEC;
  void v3[3] = &unk_1000A21D0;
  id v4 = a1;
  id v1 = v4;
  [v1 _withActivity:v3];

  return 0;
}

void sub_100026AD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_100026AEC(uint64_t a1, os_activity_t activity)
{
  unsigned int v3 = _os_activity_create((void *)&_mh_execute_header, "Thread: Print PDF Image", activity, OS_ACTIVITY_FLAG_DEFAULT);
  id v4 = _PKLogCategory(PKLogCategoryProgress[0]);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v5 = objc_msgSend(*(id *)(a1 + 32), "printd_job_id");
    long long v6 = *(void **)(a1 + 32);
    if (v6) {
      unsigned int v7 = objc_msgSend(v6, "destination_job_id");
    }
    else {
      unsigned int v7 = -1;
    }
    *(_DWORD *)long long buf = 67109890;
    unsigned int v15 = v5;
    __int16 v16 = 1024;
    unsigned int v17 = v7;
    __int16 v18 = 2048;
    uint64_t v19 = v3;
    __int16 v20 = 2080;
    unsigned int v21 = "Thread: Print PDF Image";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[Job %d][%d] Activity (%p) ENTER: %s", buf, 0x22u);
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100026D60;
  block[3] = &unk_100095360;
  id v13 = *(id *)(a1 + 32);
  os_activity_apply(v3, block);
  unsigned int v8 = _PKLogCategory(PKLogCategoryProgress[0]);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v9 = objc_msgSend(*(id *)(a1 + 32), "printd_job_id");
    id v10 = *(void **)(a1 + 32);
    if (v10) {
      unsigned int v11 = objc_msgSend(v10, "destination_job_id");
    }
    else {
      unsigned int v11 = -1;
    }
    *(_DWORD *)long long buf = 67109890;
    unsigned int v15 = v9;
    __int16 v16 = 1024;
    unsigned int v17 = v11;
    __int16 v18 = 2048;
    uint64_t v19 = v3;
    __int16 v20 = 2080;
    unsigned int v21 = "Thread: Print PDF Image";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[Job %d][%d] Activity (%p) EXIT: %s", buf, 0x22u);
  }
}

void sub_100026D20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_100026D60(uint64_t a1)
{
  uint64_t v2 = _PKLogCategory(PKLogCategoryProgress[0]);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v3 = objc_msgSend(*(id *)(a1 + 32), "printd_job_id");
    id v4 = *(void **)(a1 + 32);
    if (v4) {
      unsigned int v5 = objc_msgSend(v4, "destination_job_id");
    }
    else {
      unsigned int v5 = -1;
    }
    *(_DWORD *)long long buf = 67109634;
    unsigned int v60 = v3;
    __int16 v61 = 1024;
    unsigned int v62 = v5;
    __int16 v63 = 2080;
    CFStringRef v64 = "lite_print_pdfimage_block_invoke";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "[Job %d][%d] #### %s.", buf, 0x18u);
  }

  id v6 = *(id *)(a1 + 32);
  id v72 = 0;
  CFDictionaryRef theDict = 0;
  liteSetThreadPriority(1u);
  unsigned int v7 = _PKLogCategory(PKLogCategoryProgress[0]);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v8 = objc_msgSend(v6, "printd_job_id");
    if (v6) {
      unsigned int v9 = objc_msgSend(v6, "destination_job_id");
    }
    else {
      unsigned int v9 = -1;
    }
    id v10 = [v6 spoolDocumentFilename];
    *(_DWORD *)int valuePtr = 67109634;
    unsigned int v54 = v8;
    __int16 v55 = 1024;
    unsigned int v56 = v9;
    __int16 v57 = 2080;
    v58[0] = [v10 UTF8String];
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[Job %d][%d] lite_print_pdfimage: filename=%s", valuePtr, 0x18u);
  }
  objc_msgSend(v6, "set_processing");
  unsigned int v11 = [v6 spoolDocumentFilename];
  CGImageRef v13 = lite_create_image(v11, 0, v12, &theDict);

  if (v13)
  {
    if (!objc_msgSend(v6, "openDriver:format:orient:num_sheets:passthru:", buf, @"application/pdf", 0, 1, 1))
    {
      uint64_t v19 = 8;
LABEL_63:
      CFRelease(v13);
      goto LABEL_64;
    }
    if (theDict)
    {
      *(_DWORD *)int valuePtr = 0;
      CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(theDict, kCGImagePropertyOrientation);
      if (Value)
      {
        if (CFNumberGetValue(Value, kCFNumberIntType, valuePtr)) {
          int v15 = *(_DWORD *)valuePtr;
        }
        else {
          int v15 = 1;
        }
      }
      else
      {
        int v15 = 1;
      }
      CFRelease(theDict);
    }
    else
    {
      int v15 = 1;
    }
    int Width = CGImageGetWidth(v13);
    int Height = CGImageGetHeight(v13);
    LODWORD(v22) = v67;
    v23.i64[0] = v65;
    v23.i64[1] = v66;
    float64x2_t v24 = vdivq_f64(vmulq_f64(vcvtq_f64_u64(v23), (float64x2_t)vdupq_n_s64(0x4052000000000000uLL)), (float64x2_t)vdupq_lane_s64(COERCE__INT64((double)v22), 0));
    double v25 = v24.f64[1];
    if (v15 <= 4) {
      int v26 = Width;
    }
    else {
      int v26 = Height;
    }
    if (v15 <= 4) {
      int v27 = Height;
    }
    else {
      int v27 = Width;
    }
    if (v24.f64[0] <= v24.f64[1] || (double v28 = v24.f64[1], v29 = v24.f64[0], v26 >= (uint64_t)v27))
    {
      BOOL v30 = v24.f64[0] < v24.f64[1];
      BOOL v31 = v26 > (uint64_t)v27;
      if (v30 && v31) {
        double v28 = v24.f64[1];
      }
      else {
        double v28 = v24.f64[0];
      }
      if (v30 && v31) {
        double v29 = v24.f64[0];
      }
      else {
        double v29 = v24.f64[1];
      }
    }
    int v32 = v70;
    int v33 = v71;
    int v34 = v68;
    int v35 = v69;
    mediaBox.origin.CGFloat x = 0.0;
    mediaBox.origin.CGFloat y = 0.0;
    mediaBox.size.double width = v28;
    mediaBox.size.double height = v29;
    int v36 = (CGDataConsumer *)objc_msgSend(v6, "createDataConsumer", *(_OWORD *)&v24);
    id v37 = v36;
    if (v36)
    {
      BOOL v38 = CGPDFContextCreate(v36, &mediaBox, 0);
      CGDataConsumerRelease(v37);
      if (v38)
      {
        int v39 = time(0);
        CGContextBeginPage(v38, &mediaBox);
        v74.origin.CGFloat x = (double)v34 * 72.0 / 2540.0;
        v74.origin.CGFloat y = (double)v35 * 72.0 / 2540.0;
        v73.double width = v50;
        v74.size.double width = v50 - v74.origin.x - (double)v32 * 72.0 / 2540.0;
        v74.size.double height = v25 - (double)v33 * 72.0 / 2540.0 - v74.origin.y;
        v73.double height = v25;
        _liteDrawImageToSheet(v38, v13, v15, v73, v74);
        CGContextEndPage(v38);
        CGPDFContextClose(v38);
        CGContextRelease(v38);
        int v40 = time(0);
        uint64_t v41 = _PKLogCategory(PKLogCategoryProgress[0]);
        if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
        {
          unsigned int v42 = objc_msgSend(v6, "printd_job_id");
          if (v6) {
            unsigned int v43 = objc_msgSend(v6, "destination_job_id");
          }
          else {
            unsigned int v43 = -1;
          }
          *(_DWORD *)int valuePtr = 67109888;
          unsigned int v54 = v42;
          __int16 v55 = 1024;
          unsigned int v56 = v43;
          __int16 v57 = 1024;
          LODWORD(v58[0]) = (v40 - v39) / 60;
          WORD2(v58[0]) = 1024;
          *(_DWORD *)((char *)v58 + 6) = (v40 - v39) % 60;
          _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "[Job %d][%d] lite_print_pdfimage: TIME %d:%02d", valuePtr, 0x1Au);
        }
        uint64_t v19 = 9;
        goto LABEL_62;
      }
      uint64_t v41 = _PKLogCategory(PKLogCategoryProgress[0]);
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
      {
        unsigned int v46 = objc_msgSend(v6, "printd_job_id");
        if (v6) {
          unsigned int v47 = objc_msgSend(v6, "destination_job_id");
        }
        else {
          unsigned int v47 = -1;
        }
        *(_DWORD *)int valuePtr = 67109376;
        unsigned int v54 = v46;
        __int16 v55 = 1024;
        unsigned int v56 = v47;
        int v48 = "[Job %d][%d] lite_print_pdfimage: Unable to create PDF context";
LABEL_60:
        _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_ERROR, v48, valuePtr, 0xEu);
      }
    }
    else
    {
      uint64_t v41 = _PKLogCategory(PKLogCategoryProgress[0]);
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
      {
        unsigned int v44 = objc_msgSend(v6, "printd_job_id");
        if (v6) {
          unsigned int v45 = objc_msgSend(v6, "destination_job_id");
        }
        else {
          unsigned int v45 = -1;
        }
        *(_DWORD *)int valuePtr = 67109376;
        unsigned int v54 = v44;
        __int16 v55 = 1024;
        unsigned int v56 = v45;
        int v48 = "[Job %d][%d] lite_print_pdfimage: Unable to create data consumer.";
        goto LABEL_60;
      }
    }
    uint64_t v19 = 8;
LABEL_62:

    goto LABEL_63;
  }
  __int16 v16 = _PKLogCategory(PKLogCategoryProgress[0]);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    unsigned int v17 = objc_msgSend(v6, "printd_job_id");
    if (v6) {
      unsigned int v18 = objc_msgSend(v6, "destination_job_id");
    }
    else {
      unsigned int v18 = -1;
    }
    *(_DWORD *)int valuePtr = 67109376;
    unsigned int v54 = v17;
    __int16 v55 = 1024;
    unsigned int v56 = v18;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "[Job %d][%d] lite_print_pdfimage: Unable to get image from job file.", valuePtr, 0xEu);
  }

  uint64_t v19 = 8;
LABEL_64:
  if ([v6 closeDriver:buf])
  {
    if (objc_msgSend(v6, "is_canceled")) {
      uint64_t v49 = 7;
    }
    else {
      uint64_t v49 = v19;
    }
    [v6 finishJob:v49];
  }
  else
  {
    [v6 resetJob];
  }
}

void sub_100027404(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

CGContext *sub_10002749C(size_t a1, size_t a2)
{
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  unsigned int v5 = CGBitmapContextCreate(0, a1, a2, 8uLL, (4 * a1 + 15) & 0xFFFFFFFFFFFFFFF0, DeviceRGB, 1u);
  CGColorSpaceRelease(DeviceRGB);
  sub_100027510(v5);
  return v5;
}

void sub_100027510(CGContext *a1)
{
  CGContextSaveGState(a1);
  ColorSpace = CGBitmapContextGetColorSpace(a1);
  if (ColorSpace)
  {
    unsigned int v3 = ColorSpace;
    CGColorSpaceModel Model = CGColorSpaceGetModel(ColorSpace);
    if (Model != kCGColorSpaceModelCMYK)
    {
      if (Model != kCGColorSpaceModelRGB)
      {
        if (Model == kCGColorSpaceModelMonochrome)
        {
          CGContextSetGrayFillColor(a1, 1.0, 1.0);
LABEL_14:
          CGContextSetCTM();
          size_t Width = CGBitmapContextGetWidth(a1);
          size_t Height = CGBitmapContextGetHeight(a1);
          v11.size.double width = (double)Width;
          v11.size.double height = (double)Height;
          v11.origin.CGFloat x = 0.0;
          v11.origin.CGFloat y = 0.0;
          CGContextFillRect(a1, v11);
          goto LABEL_15;
        }
        id v6 = _PKLogCategory(PKLogCategoryProgress[0]);
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long buf = 67109120;
          CGColorSpaceModel v10 = CGColorSpaceGetModel(v3);
          _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "lite_bitmap_context_erase: Unknown color model: %d", buf, 8u);
        }
      }
      CGContextSetRGBFillColor(a1, 1.0, 1.0, 1.0, 1.0);
      goto LABEL_14;
    }
    CGContextSetCMYKFillColor(a1, 0.0, 0.0, 0.0, 0.0, 1.0);
    goto LABEL_14;
  }
  unsigned int v5 = _PKLogCategory(PKLogCategoryProgress[0]);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "lite_bitmap_context_erase: Bitmap context has no colorspace!", buf, 2u);
  }

LABEL_15:
  CGContextRestoreGState(a1);
}

void sub_1000276F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_10002770C(void *a1, signed int a2, signed int *a3)
{
  id v5 = a1;
  *a3 = 0;
  id v6 = objc_msgSend(v5, "request_attrs");
  unsigned int v7 = (*(void (**)(id))(*(void *)v6 + 480))(v6);
  if (![v7 count])
  {
    *a3 = a2;
    goto LABEL_9;
  }
  int v8 = [v7 count];
  if (v8 < 1)
  {
LABEL_9:
    uint64_t v15 = 1;
    goto LABEL_10;
  }
  uint64_t v9 = 0;
  uint64_t v10 = v8;
  while (1)
  {
    CGRect v11 = [v7 objectAtIndexedSubscript:v9];
    signed int v12 = [v11 rangeValue];
    int v14 = v13;

    uint64_t v15 = 0;
    if (v12 >= a2 || v12 + v14 > a2) {
      break;
    }
    *a3 += v14;
    if (v10 == ++v9) {
      goto LABEL_9;
    }
  }
LABEL_10:

  return v15;
}

void sub_100027824(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

unint64_t sub_100027854(CGPDFPage *a1, CGImage *a2, _OWORD *a3, uint64_t a4, uint64_t a5, _OWORD *a6, int a7)
{
  if (*(_DWORD *)(a5 + 8) == 3)
  {
    id v10 = [objc_alloc((Class)NSXPCConnection) initWithServiceName:@"com.apple.printbandservice"];
    CGRect v11 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___PrintBandServiceProtocol];
    [v10 setRemoteObjectInterface:v11];

    signed int v12 = v10;
    [v10 resume];
  }
  else
  {
    signed int v12 = 0;
  }
  int v13 = _PKLogCategory(PKLogCategoryProgress[0]);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315394;
    *(void *)&uint8_t buf[4] = "lite_render_page";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v12;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%s: znXPC=%@", buf, 0x16u);
  }

  int v14 = _PKLogCategory(PKLogCategoryProgress[0]);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v15 = *(void *)(a5 + 24);
    *(_DWORD *)long long buf = 136315394;
    *(void *)&uint8_t buf[4] = "lite_render_page";
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = v15;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%s: raster_info->page_height=%zu", buf, 0x16u);
  }

  if (a2)
  {
    size_t Width = CGImageGetWidth(a2);
    size_t Height = CGImageGetHeight(a2);
  }
  else
  {
    size_t Height = 0;
    size_t Width = 0;
  }
  if (*(void *)(a5 + 24))
  {
    unint64_t v19 = 0;
    if ((unint64_t)a1 | (unint64_t)a2) {
      BOOL v20 = a4 == 0;
    }
    else {
      BOOL v20 = 1;
    }
    double v21 = (double)Width;
    int v22 = !v20;
    int v89 = v22;
    double v23 = (double)Height;
    double v24 = 0.0;
    *(void *)&long long v16 = 136315650;
    long long v79 = v16;
    id v82 = a2;
    id v83 = v12;
    id v81 = a1;
    while ((objc_msgSend(*(id *)(a5 + 2160), "is_canceled", v79) & 1) == 0)
    {
      sub_100027510(*(CGContext **)a5);
      if (v89)
      {
        CGContextSaveGState(*(CGContextRef *)a5);
        CGContextTranslateCTM(*(CGContextRef *)a5, 0.0, v24);
        double v25 = *(_OWORD **)(a5 + 48);
        if (v25)
        {
          int v26 = *(CGContext **)a5;
          long long v28 = v25[1];
          long long v27 = v25[2];
          *(_OWORD *)&transform.a = *v25;
          *(_OWORD *)&transform.c = v28;
          *(_OWORD *)&transform.tCGFloat x = v27;
          CGContextConcatCTM(v26, &transform);
        }
        if (a6)
        {
          double v29 = *(CGContext **)a5;
          long long v30 = a6[1];
          *(_OWORD *)&v91.a = *a6;
          *(_OWORD *)&v91.c = v30;
          *(_OWORD *)&v91.tCGFloat x = a6[2];
          CGContextConcatCTM(v29, &v91);
        }
        BOOL v31 = *(CGContext **)a5;
        long long v32 = a3[1];
        *(_OWORD *)&v90.a = *a3;
        *(_OWORD *)&v90.c = v32;
        *(_OWORD *)&v90.tCGFloat x = a3[2];
        CGContextConcatCTM(v31, &v90);
        if (a1)
        {
          int v33 = *(CGContext **)a5;
          CGRect BoxRect = CGPDFPageGetBoxRect(a1, kCGPDFCropBox);
          CGContextClipToRect(v33, BoxRect);
          if (a7) {
            CGContextDrawPDFPageWithAnnotations();
          }
          else {
            CGContextDrawPDFPage(*(CGContextRef *)a5, a1);
          }
        }
        else if (a2)
        {
          v117.origin.CGFloat x = 0.0;
          v117.origin.CGFloat y = 0.0;
          v117.size.double width = v21;
          v117.size.double height = v23;
          CGContextDrawImage(*(CGContextRef *)a5, v117, a2);
        }
        CGContextRestoreGState(*(CGContextRef *)a5);
        if (v12)
        {
          id v34 = v12;
          uint64_t v103 = 0;
          unsigned int v104 = &v103;
          uint64_t v105 = 0x2020000000;
          int v106 = 0;
          unint64_t v35 = v19;
          int v36 = *(_DWORD *)(a5 + 2200);
          uint64_t v37 = *(void *)(a5 + 24);
          uint64_t v38 = *(void *)(a5 + 168);
          int v39 = *(unsigned __int8 *)(a5 + 72);
          int v40 = *(_DWORD *)(a5 + 16);
          unint64_t v86 = v35;
          id v87 = v34;
          unint64_t v41 = v37 - v35;
          if (*(void *)(a5 + 2208) >= v41) {
            int v42 = v41;
          }
          else {
            int v42 = *(void *)(a5 + 2208);
          }
          BOOL v43 = *(unsigned char *)(a5 + 73) == 7;
          if (CGBitmapContextGetData(*(CGContextRef *)a5))
          {
            id v44 = *(id *)(a5 + 2216);
            *(void *)long long buf = _NSConcreteStackBlock;
            *(void *)&uint8_t buf[8] = 3221225472;
            *(void *)&uint8_t buf[16] = sub_1000282A8;
            v114 = &unk_1000A21F8;
            id v115 = v87;
            unsigned int v45 = [v115 synchronousRemoteObjectProxyWithErrorHandler:buf];
            v94[0] = v36;
            v94[1] = v37;
            uint64_t v95 = v38;
            unsigned int v96 = (171 * v39) >> 9;
            int v97 = v40;
            int v98 = v42;
            int v99 = v86;
            BOOL v100 = v43;
            __int16 v101 = 0;
            char v102 = 0;
            v93[0] = _NSConcreteStackBlock;
            v93[1] = 3221225472;
            v93[2] = sub_100028394;
            v93[3] = &unk_1000A2220;
            v93[4] = &v103;
            [v45 znProcessBand:v44 withBandDescription:v94 reply:v93];

            unsigned int v46 = _PKLogCategory(PKLogCategoryProgress[0]);
            if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
            {
              int v47 = *((_DWORD *)v104 + 6);
              *(_DWORD *)unsigned int v107 = v79;
              unsigned int v108 = "bandZNConfirm";
              __int16 v109 = 2048;
              unint64_t v110 = v86;
              __int16 v111 = 1024;
              int v112 = v47;
              _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "%s: processBand yOffset=%zu error: %d", v107, 0x1Cu);
            }
          }
          BOOL v48 = *((_DWORD *)v104 + 6) == 0;
          _Block_object_dispose(&v103, 8);

          a2 = v82;
          signed int v12 = v83;
          a1 = v81;
          unint64_t v19 = v86;
          if (!v48)
          {
            uint64_t v67 = _PKLogCategory(PKLogCategoryProgress[0]);
            if (os_log_type_enabled((os_log_t)v67, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)long long buf = 0;
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)v67, OS_LOG_TYPE_ERROR, "printbandservice returns failure result", buf, 2u);
            }

            LOBYTE(v67) = 1;
            unsigned int v52 = -1;
            uint64_t v69 = 1;
            goto LABEL_74;
          }
        }
      }
      Data = CGBitmapContextGetData(*(CGContextRef *)a5);
      if (*(void *)(a5 + 2208) + v19 >= *(void *)(a5 + 24)) {
        unint64_t v50 = *(void *)(a5 + 24);
      }
      else {
        unint64_t v50 = *(void *)(a5 + 2208) + v19;
      }
      if (v19 >= v50)
      {
        unsigned int v52 = 0;
        v19 += *(void *)(a5 + 2208);
      }
      else
      {
        unsigned int v51 = Data;
        unsigned int v52 = 0;
        unint64_t v53 = v19;
        while ((objc_msgSend(*(id *)(a5 + 2160), "is_canceled") & 1) == 0)
        {
          if (*(_DWORD *)(a5 + 8) == 3)
          {
            if (*(unsigned char *)(a5 + 72) == 48)
            {
              if (*(unsigned char *)(a5 + 73) == 7)
              {
                if (!*(void *)(a5 + 16))
                {
                  int v77 = 1143;
                  CFDataRef v78 = "bytes_per_row > 0";
                  goto LABEL_90;
                }
                uint64_t v54 = *(void *)(a5 + 2200);
                __int16 v55 = v51;
                unsigned int v56 = v51;
                if (!v54)
                {
                  int v77 = 1144;
                  CFDataRef v78 = "width > 0";
LABEL_90:
                  __assert_rtn("lite_pack_row48_float16", "print-darwin.mm", v77, v78);
                }
                do
                {
                  *__int16 v55 = *v56;
                  v55[1] = v56[1];
                  v55[2] = v56[2];
                  v56 += 4;
                  v55 += 3;
                  --v54;
                }
                while (v54);
              }
              else
              {
                uint64_t v63 = *(void *)(a5 + 2200);
                if (v63)
                {
                  CFStringRef v64 = v51;
                  unsigned int v65 = v51;
                  do
                  {
                    *(_DWORD *)CFStringRef v64 = *(_DWORD *)v65;
                    v64[2] = v65[2];
                    v65 += 4;
                    v64 += 3;
                    --v63;
                  }
                  while (v63);
                }
              }
            }
            else
            {
              unint64_t v57 = *(void *)(a5 + 2200);
              id v58 = v51;
              unsigned int v59 = v51;
              if (v57 >= 4)
              {
                unint64_t v60 = v57 >> 2;
                __int16 v61 = (int *)v51;
                id v58 = v51;
                do
                {
                  *__int16 v61 = *(_DWORD *)v58 & 0xFFFFFF | (*((_DWORD *)v58 + 1) << 24);
                  v61[1] = *(unsigned __int16 *)((char *)v58 + 5) | (*((_DWORD *)v58 + 2) << 16);
                  unsigned int v59 = v61 + 3;
                  v61[2] = *((unsigned __int8 *)v58 + 10) | (*((_DWORD *)v58 + 3) << 8);
                  v58 += 8;
                  v61 += 3;
                  --v60;
                }
                while (v60);
              }
              for (unint64_t i = v57 & 3; i; --i)
              {
                unsigned char *v59 = *(unsigned char *)v58;
                v59[1] = *((unsigned char *)v58 + 1);
                v59[2] = *((unsigned char *)v58 + 2);
                v59 += 3;
                v58 += 2;
              }
            }
          }
          if (!(v19 % *(unsigned int *)(a5 + 92))) {
            [*(id *)(a5 + 2160) updateProgressAndPostNotification:100 * v19 / *(void *)(a5 + 24) logMsg:0];
          }
          int v66 = (*(uint64_t (**)(uint64_t, _WORD *, void))(a5 + 2152))(a5 + 56, v51, *(unsigned int *)(a5 + 40));
          unsigned int v52 = v66 == 0;
          if (++v19 < v50)
          {
            unsigned int v51 = (_WORD *)((char *)v51 + *(void *)(a5 + 16));
            if (v66) {
              continue;
            }
          }
          break;
        }
        unint64_t v19 = *(void *)(a5 + 2208) + v53;
      }
      double v24 = v24 + *(double *)(a5 + 32);
      LODWORD(v67) = v52 != 0;
      if (v19 >= *(void *)(a5 + 24) || v52 != 0)
      {
        if (!v12) {
          goto LABEL_80;
        }
        goto LABEL_73;
      }
    }
  }
  unsigned int v52 = 0;
  LODWORD(v67) = 0;
  if (v12)
  {
LABEL_73:
    uint64_t v69 = 0;
LABEL_74:
    [v12 invalidate];

    if ((v67 & 1) == 0)
    {
LABEL_81:
      int v70 = _PKLogCategory(PKLogCategoryProgress[0]);
      if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 67109120;
        *(_DWORD *)&uint8_t buf[4] = a4;
        id v72 = "lite_render_page: Finished page %d.";
        CGSize v73 = v70;
        os_log_type_t v74 = OS_LOG_TYPE_DEFAULT;
        uint32_t v75 = 8;
LABEL_83:
        _os_log_impl((void *)&_mh_execute_header, v73, v74, v72, buf, v75);
        goto LABEL_84;
      }
      goto LABEL_84;
    }
  }
  else
  {
LABEL_80:
    uint64_t v69 = 0;
    if (!v67) {
      goto LABEL_81;
    }
  }
  int v70 = _PKLogCategory(PKLogCategoryProgress[0]);
  if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
  {
    int v71 = "(fatal)";
    *(_DWORD *)long long buf = 67109634;
    *(_DWORD *)&uint8_t buf[4] = v52;
    if (!v69) {
      int v71 = "";
    }
    *(_WORD *)&uint8_t buf[8] = 2080;
    *(void *)&buf[10] = v71;
    *(_WORD *)&buf[18] = 1024;
    *(_DWORD *)&buf[20] = a4;
    id v72 = "lite_render_page: Got error %d%s on page %d.";
    CGSize v73 = v70;
    os_log_type_t v74 = OS_LOG_TYPE_ERROR;
    uint32_t v75 = 24;
    goto LABEL_83;
  }
LABEL_84:

  return v52 | (unint64_t)(v69 << 32);
}

void sub_1000281E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,void *a22)
{
  _Unwind_Resume(a1);
}

id *sub_10002826C(id *a1)
{
  return a1;
}

void sub_1000282A8(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _PKLogCategory(PKLogCategoryProgress[0]);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138412546;
    uint64_t v7 = v5;
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "znProcessBand znXPC service connection %@  error  %@", (uint8_t *)&v6, 0x16u);
  }
}

void sub_10002837C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_100028394(uint64_t result, int a2)
{
  *(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

void sub_10002846C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100028514(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)LocalSocketProxy;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_1000287B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v22);
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_1000287F8(uint64_t a1, int a2, void *a3)
{
  id v6 = a3;
  if (a2 == 3)
  {
    [*(id *)(a1 + 32) _cancel];
  }
  else if (a2 == 2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    [WeakRetained _listenerReady];
  }
}

void sub_100028870(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100028894(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _newConnection:v3];
}

void sub_1000288F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100028AC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

id sub_100028B08(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) removeObject:a2];
}

void sub_100028C8C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_100028C9C(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, void))(a2 + 16))(a2, *(unsigned __int16 *)(a1 + 32));
}

void sub_100028D84(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));

  if (WeakRetained)
  {
    id v5 = objc_loadWeakRetained(v2);
    [v5 _withPort:*(void *)(a1 + 32)];
  }
  else
  {
    id v4 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    v4();
  }
}

void sub_100028E28(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100028F30(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100029058(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _cancel];
}

void sub_1000290A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100029204(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000292C8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _start];
}

void sub_100029310(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100029394(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

BOOL sub_1000294F4(uint64_t a1, void *a2, uint64_t a3, char *a4, int64_t a5)
{
  id v8 = a2;
  if (a5 < 1)
  {
    BOOL v11 = 1;
  }
  else
  {
    id v9 = a4;
    do
    {
      ssize_t v10 = write(*(_DWORD *)(*(void *)(a1 + 32) + 32), a4, a5);
      BOOL v11 = v10 != 0;
      if (!v10) {
        break;
      }
      *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) += v10;
      v9 += v10;
    }
    while (v9 < &a4[a5]);
  }

  return v11;
}

void sub_10002959C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10002965C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_100029678(uint64_t a1, void *a2, uint64_t a3, int a4, uint64_t a5)
{
  id v11 = a2;
  id v8 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  ssize_t v10 = WeakRetained;
  if (a5
    || ([WeakRetained _receiveFromHTTP:v11],
        v10,
        id WeakRetained = objc_loadWeakRetained(v8),
        ssize_t v10 = WeakRetained,
        a4))
  {
    [WeakRetained _shutdown];
  }
  else
  {
    [WeakRetained _httpReceive];
  }
}

void sub_100029724(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100029808(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100029820(id a1, OS_nw_error *a2)
{
  uint64_t v2 = a2;
  if (v2)
  {
    id v3 = _PKLogCategory(PKLogCategoryNetwork[0]);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138412290;
      id v8 = v2;
      id v4 = "LocalProxyConnection: couldn't send to http connection: %@";
      id v5 = v3;
      uint32_t v6 = 12;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, v4, (uint8_t *)&v7, v6);
    }
  }
  else
  {
    id v3 = _PKLogCategory(PKLogCategoryNetwork[0]);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v7) = 0;
      id v4 = "LocalProxyConnection: Sent payload from cups back to http.  Need another read event";
      id v5 = v3;
      uint32_t v6 = 2;
      goto LABEL_6;
    }
  }
}

void sub_10002991C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100029CBC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id *location, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,id a32)
{
}

void sub_100029CE4(uint64_t a1, int a2)
{
  if (a2 == 3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [WeakRetained _connectionReady];
  }
}

void sub_100029D44(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100029D58(uint64_t a1)
{
  uint64_t v2 = _PKLogCategory(PKLogCategoryDefault[0]);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = *(_DWORD *)(a1 + 48);
    uint64_t v4 = *(void *)(a1 + 32);
    v6[0] = 67109378;
    v6[1] = v3;
    __int16 v7 = 2112;
    uint64_t v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "can read from fd %d: %@", (uint8_t *)v6, 0x12u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _canReadFromSocket];
}

void sub_100029E30(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100029E48(uint64_t a1)
{
  uint64_t v2 = _PKLogCategory(PKLogCategoryDefault[0]);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = *(_DWORD *)(a1 + 48);
    uint64_t v4 = *(void *)(a1 + 32);
    v6[0] = 67109378;
    v6[1] = v3;
    __int16 v7 = 2112;
    uint64_t v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "can write to fd %d: %@", (uint8_t *)v6, 0x12u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _canWriteToSocket];
}

void sub_100029F20(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10002A028(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10002A0E4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _shutdown];
}

void sub_10002A12C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

uint64_t ippWriteIO(void *a1, uint64_t (*a2)(void *, unsigned __int8 *, unint64_t), ipp_t *a3)
{
  id v5 = a3;
  uint32_t v6 = v5;
  int v13 = 0;
  v14[0] = 19;
  uint64_t v7 = 0xFFFFFFFFLL;
  if (a1 && v5)
  {
    v9[0] = a1;
    v9[1] = a2;
    ssize_t v10 = (char *)malloc_type_malloc(0x8001uLL, 0x11478DC1uLL);
    id v11 = v10;
    signed int v12 = v10 + 32769;
    sub_10002A374((uint64_t)v9, &v13, v14, 0, v6);
    uint64_t v7 = 3;
    sub_10002DE68((uint64_t)v9);
  }

  return v7;
}

void sub_10002A374(uint64_t a1, _DWORD *a2, _DWORD *a3, char a4, void *a5)
{
  id v9 = a5;
  ssize_t v10 = v9;
  int v11 = *a2;
  if (*a2 != 2)
  {
    if (v11 != 1)
    {
      if (v11) {
        goto LABEL_12;
      }
      *a2 = 1;
    }
    id v12 = v9;
    if ((a4 & 1) == 0)
    {
      LOBYTE(v27) = 2;
      unsigned int v18 = _NSConcreteStackBlock;
      uint64_t v19 = 3221225472;
      BOOL v20 = sub_10002AAFC;
      double v21 = &unk_1000A2408;
      int v22 = &v27;
      sub_10002AA30(a1, 1uLL, &v18);
      LOBYTE(v27) = 0;
      unsigned int v18 = _NSConcreteStackBlock;
      uint64_t v19 = 3221225472;
      BOOL v20 = sub_10002AAFC;
      double v21 = &unk_1000A2408;
      int v22 = &v27;
      sub_10002AA30(a1, 1uLL, &v18);
      unsigned __int16 v13 = (unsigned __int16)objc_msgSend(v12, "op_or_status");
      LOBYTE(v27) = HIBYTE(v13);
      unsigned int v18 = _NSConcreteStackBlock;
      uint64_t v19 = 3221225472;
      BOOL v20 = sub_10002AAFC;
      double v21 = &unk_1000A2408;
      int v22 = &v27;
      sub_10002AA30(a1, 1uLL, &v18);
      LOBYTE(v27) = v13;
      unsigned int v18 = _NSConcreteStackBlock;
      uint64_t v19 = 3221225472;
      BOOL v20 = sub_10002AAFC;
      double v21 = &unk_1000A2408;
      int v22 = &v27;
      sub_10002AA30(a1, 1uLL, &v18);
      unsigned int v14 = objc_msgSend(v12, "request_id");
      LOBYTE(v27) = HIBYTE(v14);
      unsigned int v18 = _NSConcreteStackBlock;
      uint64_t v19 = 3221225472;
      BOOL v20 = sub_10002AAFC;
      double v21 = &unk_1000A2408;
      int v22 = &v27;
      sub_10002AA30(a1, 1uLL, &v18);
      LOBYTE(v27) = BYTE2(v14);
      unsigned int v18 = _NSConcreteStackBlock;
      uint64_t v19 = 3221225472;
      BOOL v20 = sub_10002AAFC;
      double v21 = &unk_1000A2408;
      int v22 = &v27;
      sub_10002AA30(a1, 1uLL, &v18);
      LOBYTE(v27) = BYTE1(v14);
      unsigned int v18 = _NSConcreteStackBlock;
      uint64_t v19 = 3221225472;
      BOOL v20 = sub_10002AAFC;
      double v21 = &unk_1000A2408;
      int v22 = &v27;
      sub_10002AA30(a1, 1uLL, &v18);
      LOBYTE(v27) = v14;
      unsigned int v18 = _NSConcreteStackBlock;
      uint64_t v19 = 3221225472;
      BOOL v20 = sub_10002AAFC;
      double v21 = &unk_1000A2408;
      int v22 = &v27;
      sub_10002AA30(a1, 1uLL, &v18);
    }
    sub_10002A9BC(a1);
    *a2 = 2;
    *a3 = 0;

    sub_10002A9BC(a1);
  }
  id v15 = v10;
  unsigned int v18 = _NSConcreteStackBlock;
  uint64_t v19 = 3221225472;
  BOOL v20 = sub_10002AB0C;
  double v21 = &unk_1000A2430;
  char v26 = a4;
  double v23 = a3;
  uint64_t v24 = a1;
  double v25 = a2;
  long long v16 = (void ***)v15;
  int v22 = v16;
  [v16 enumerateAttributes:&v18];
  if (a4)
  {
    char v17 = 55;
    long long v27 = _NSConcreteStackBlock;
    uint64_t v28 = 3221225472;
    double v29 = sub_10002AAFC;
    long long v30 = &unk_1000A2408;
    BOOL v31 = &v17;
    sub_10002AA30(a1, 1uLL, &v27);
    char v17 = 0;
    long long v27 = _NSConcreteStackBlock;
    uint64_t v28 = 3221225472;
    double v29 = sub_10002AAFC;
    long long v30 = &unk_1000A2408;
    BOOL v31 = &v17;
    sub_10002AA30(a1, 1uLL, &v27);
    char v17 = 0;
    long long v27 = _NSConcreteStackBlock;
    uint64_t v28 = 3221225472;
    double v29 = sub_10002AAFC;
    long long v30 = &unk_1000A2408;
    BOOL v31 = &v17;
    sub_10002AA30(a1, 1uLL, &v27);
    char v17 = 0;
    long long v27 = _NSConcreteStackBlock;
    uint64_t v28 = 3221225472;
    double v29 = sub_10002AAFC;
    long long v30 = &unk_1000A2408;
    BOOL v31 = &v17;
    sub_10002AA30(a1, 1uLL, &v27);
    char v17 = 0;
  }
  else
  {
    char v17 = 3;
  }
  long long v27 = _NSConcreteStackBlock;
  uint64_t v28 = 3221225472;
  double v29 = sub_10002AAFC;
  long long v30 = &unk_1000A2408;
  BOOL v31 = &v17;
  sub_10002AA30(a1, 1uLL, &v27);
  sub_10002A9BC(a1);
  *a2 = 3;

  sub_10002A9BC(a1);
LABEL_12:
}

void sub_10002A940(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
  _Unwind_Resume(a1);
}

uint64_t sub_10002A9BC(uint64_t result)
{
  if ((uint64_t)(*(void *)(result + 24) - *(void *)(result + 16)) >= 1)
  {
    uint64_t v1 = result;
    CFURLRef result = (*(uint64_t (**)(void))(result + 8))(*(void *)result);
    if (result <= 0)
    {
      id v2 = +[NSException exceptionWithName:@"IPPInternal" reason:@"ipp stream write failure" userInfo:0];
      objc_exception_throw(v2);
    }
    *(void *)(v1 + 24) = *(void *)(v1 + 16);
  }
  return result;
}

void sub_10002AA30(uint64_t a1, size_t a2, void *a3)
{
  uint32_t v6 = a3;
  id v5 = *(char **)(a1 + 24);
  if ((unint64_t)&v5[a2] >= *(void *)(a1 + 32))
  {
    sub_10002A9BC(a1);
    id v5 = *(char **)(a1 + 24);
    if ((unint64_t)&v5[a2] >= *(void *)(a1 + 32))
    {
      free(*(void **)(a1 + 16));
      id v5 = (char *)malloc_type_malloc(a2, 0x69155969uLL);
      *(void *)(a1 + 16) = v5;
      *(void *)(a1 + 24) = v5;
      *(void *)(a1 + 32) = &v5[a2];
    }
  }
  *(void *)(a1 + 24) = &v5[a2];
  v6[2]();
}

void sub_10002AAE4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

uint64_t sub_10002AAFC(uint64_t result, unsigned char *a2)
{
  *a2 = **(unsigned char **)(result + 32);
  return result;
}

void sub_10002AB0C(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (*(unsigned char *)(a1 + 64)) {
    goto LABEL_2;
  }
  int v24 = **(_DWORD **)(a1 + 40);
  if (v24 == objc_msgSend(v3, "group_tag"))
  {
    if (!objc_msgSend(v4, "group_tag")) {
      goto LABEL_29;
    }
  }
  else
  {
    **(_DWORD **)(a1 + 40) = objc_msgSend(v4, "group_tag");
    if (!objc_msgSend(v4, "group_tag")) {
      goto LABEL_29;
    }
    uint64_t v27 = *(void *)(a1 + 48);
    unsigned __int8 v59 = objc_msgSend(v4, "group_tag");
    unint64_t v60 = _NSConcreteStackBlock;
    uint64_t v61 = 3221225472;
    unsigned int v62 = sub_10002AAFC;
    uint64_t v63 = &unk_1000A2408;
    CFStringRef v64 = &v59;
    sub_10002AA30(v27, 1uLL, &v60);
  }
  if (*(unsigned char *)(a1 + 64))
  {
LABEL_2:
    id v5 = [v4 name];
    int v6 = [v5 length];

    if (v6 >= 32758)
    {
      id v57 = +[NSException exceptionWithName:@"IPPInternal" reason:@"'attr.name' value length too large" userInfo:0];
      objc_exception_throw(v57);
    }
    uint64_t v7 = *(void *)(a1 + 48);
    unsigned __int8 v59 = 74;
    unint64_t v60 = _NSConcreteStackBlock;
    uint64_t v61 = 3221225472;
    unsigned int v62 = sub_10002AAFC;
    uint64_t v63 = &unk_1000A2408;
    CFStringRef v64 = &v59;
    sub_10002AA30(v7, 1uLL, &v60);
    uint64_t v8 = *(void *)(a1 + 48);
    unsigned __int8 v59 = 0;
    unint64_t v60 = _NSConcreteStackBlock;
    uint64_t v61 = 3221225472;
    unsigned int v62 = sub_10002AAFC;
    uint64_t v63 = &unk_1000A2408;
    CFStringRef v64 = &v59;
    sub_10002AA30(v8, 1uLL, &v60);
    uint64_t v9 = *(void *)(a1 + 48);
    unsigned __int8 v59 = 0;
    unint64_t v60 = _NSConcreteStackBlock;
    uint64_t v61 = 3221225472;
    unsigned int v62 = sub_10002AAFC;
    uint64_t v63 = &unk_1000A2408;
    CFStringRef v64 = &v59;
    sub_10002AA30(v9, 1uLL, &v60);
    uint64_t v10 = *(void *)(a1 + 48);
    unsigned __int8 v59 = BYTE1(v6);
    unint64_t v60 = _NSConcreteStackBlock;
    uint64_t v61 = 3221225472;
    unsigned int v62 = sub_10002AAFC;
    uint64_t v63 = &unk_1000A2408;
    CFStringRef v64 = &v59;
    sub_10002AA30(v10, 1uLL, &v60);
    uint64_t v11 = *(void *)(a1 + 48);
    unsigned __int8 v59 = v6;
    unint64_t v60 = _NSConcreteStackBlock;
    uint64_t v61 = 3221225472;
    unsigned int v62 = sub_10002AAFC;
    uint64_t v63 = &unk_1000A2408;
    CFStringRef v64 = &v59;
    sub_10002AA30(v11, 1uLL, &v60);
    uint64_t v12 = *(void *)(a1 + 48);
    id v13 = [v4 name];
    unsigned int v14 = (unsigned __int8 *)[v13 UTF8String];
    unint64_t v60 = _NSConcreteStackBlock;
    uint64_t v61 = 3221225472;
    unsigned int v62 = sub_10002BB04;
    uint64_t v63 = &unk_1000A2450;
    CFStringRef v64 = v14;
    uint64_t v65 = v6;
    sub_10002AA30(v12, v6, &v60);

    int v15 = objc_msgSend(v4, "value_tag");
    uint64_t v16 = *(void *)(a1 + 48);
    if (v15 >= 128)
    {
      unsigned __int8 v59 = 127;
      unint64_t v60 = _NSConcreteStackBlock;
      uint64_t v61 = 3221225472;
      unsigned int v62 = sub_10002AAFC;
      uint64_t v63 = &unk_1000A2408;
      CFStringRef v64 = &v59;
      sub_10002AA30(v16, 1uLL, &v60);
      uint64_t v17 = *(void *)(a1 + 48);
      unsigned __int8 v59 = objc_msgSend(v4, "value_tag") >> 24;
      unint64_t v60 = _NSConcreteStackBlock;
      uint64_t v61 = 3221225472;
      unsigned int v62 = sub_10002AAFC;
      uint64_t v63 = &unk_1000A2408;
      CFStringRef v64 = &v59;
      sub_10002AA30(v17, 1uLL, &v60);
      uint64_t v18 = *(void *)(a1 + 48);
      unsigned __int8 v59 = objc_msgSend(v4, "value_tag") >> 16;
      unint64_t v60 = _NSConcreteStackBlock;
      uint64_t v61 = 3221225472;
      unsigned int v62 = sub_10002AAFC;
      uint64_t v63 = &unk_1000A2408;
      CFStringRef v64 = &v59;
      sub_10002AA30(v18, 1uLL, &v60);
      uint64_t v19 = *(void *)(a1 + 48);
      unsigned __int8 v59 = (unsigned __int16)objc_msgSend(v4, "value_tag") >> 8;
      unint64_t v60 = _NSConcreteStackBlock;
      uint64_t v61 = 3221225472;
      unsigned int v62 = sub_10002AAFC;
      uint64_t v63 = &unk_1000A2408;
      CFStringRef v64 = &v59;
      sub_10002AA30(v19, 1uLL, &v60);
      uint64_t v16 = *(void *)(a1 + 48);
    }
    unsigned __int8 v59 = objc_msgSend(v4, "value_tag");
    unint64_t v60 = _NSConcreteStackBlock;
    uint64_t v61 = 3221225472;
    unsigned int v62 = sub_10002AAFC;
    uint64_t v63 = &unk_1000A2408;
    CFStringRef v64 = &v59;
    sub_10002AA30(v16, 1uLL, &v60);
    uint64_t v20 = *(void *)(a1 + 48);
    unsigned __int8 v59 = 0;
    unint64_t v60 = _NSConcreteStackBlock;
    uint64_t v61 = 3221225472;
    unsigned int v62 = sub_10002AAFC;
    uint64_t v63 = &unk_1000A2408;
    CFStringRef v64 = &v59;
    sub_10002AA30(v20, 1uLL, &v60);
    uint64_t v21 = *(void *)(a1 + 48);
    unsigned __int8 v59 = 0;
    unint64_t v60 = _NSConcreteStackBlock;
    uint64_t v61 = 3221225472;
    unsigned int v62 = sub_10002AAFC;
    uint64_t v63 = &unk_1000A2408;
    CFStringRef v64 = &v59;
    sub_10002AA30(v21, 1uLL, &v60);
    sub_10002A9BC(*(void *)(a1 + 48));
  }
  else
  {
    uint64_t v28 = [v4 name];
    int v29 = [v28 length];

    if (v29 >= 32762)
    {
      id v58 = +[NSException exceptionWithName:@"IPPInternal" reason:@"'attr name' value length too large" userInfo:0];
      objc_exception_throw(v58);
    }
    int v30 = objc_msgSend(v4, "value_tag");
    uint64_t v31 = *(void *)(a1 + 48);
    if (v30 >= 128)
    {
      unsigned __int8 v59 = 127;
      unint64_t v60 = _NSConcreteStackBlock;
      uint64_t v61 = 3221225472;
      unsigned int v62 = sub_10002AAFC;
      uint64_t v63 = &unk_1000A2408;
      CFStringRef v64 = &v59;
      sub_10002AA30(v31, 1uLL, &v60);
      uint64_t v32 = *(void *)(a1 + 48);
      unsigned __int8 v59 = objc_msgSend(v4, "value_tag") >> 24;
      unint64_t v60 = _NSConcreteStackBlock;
      uint64_t v61 = 3221225472;
      unsigned int v62 = sub_10002AAFC;
      uint64_t v63 = &unk_1000A2408;
      CFStringRef v64 = &v59;
      sub_10002AA30(v32, 1uLL, &v60);
      uint64_t v33 = *(void *)(a1 + 48);
      unsigned __int8 v59 = objc_msgSend(v4, "value_tag") >> 16;
      unint64_t v60 = _NSConcreteStackBlock;
      uint64_t v61 = 3221225472;
      unsigned int v62 = sub_10002AAFC;
      uint64_t v63 = &unk_1000A2408;
      CFStringRef v64 = &v59;
      sub_10002AA30(v33, 1uLL, &v60);
      uint64_t v34 = *(void *)(a1 + 48);
      unsigned __int8 v59 = (unsigned __int16)objc_msgSend(v4, "value_tag") >> 8;
      unint64_t v60 = _NSConcreteStackBlock;
      uint64_t v61 = 3221225472;
      unsigned int v62 = sub_10002AAFC;
      uint64_t v63 = &unk_1000A2408;
      CFStringRef v64 = &v59;
      sub_10002AA30(v34, 1uLL, &v60);
      uint64_t v31 = *(void *)(a1 + 48);
    }
    unsigned __int8 v59 = objc_msgSend(v4, "value_tag");
    unint64_t v60 = _NSConcreteStackBlock;
    uint64_t v61 = 3221225472;
    unsigned int v62 = sub_10002AAFC;
    uint64_t v63 = &unk_1000A2408;
    CFStringRef v64 = &v59;
    sub_10002AA30(v31, 1uLL, &v60);
    uint64_t v40 = *(void *)(a1 + 48);
    unsigned __int8 v59 = BYTE1(v29);
    unint64_t v60 = _NSConcreteStackBlock;
    uint64_t v61 = 3221225472;
    unsigned int v62 = sub_10002AAFC;
    uint64_t v63 = &unk_1000A2408;
    CFStringRef v64 = &v59;
    sub_10002AA30(v40, 1uLL, &v60);
    uint64_t v41 = *(void *)(a1 + 48);
    unsigned __int8 v59 = v29;
    unint64_t v60 = _NSConcreteStackBlock;
    uint64_t v61 = 3221225472;
    unsigned int v62 = sub_10002AAFC;
    uint64_t v63 = &unk_1000A2408;
    CFStringRef v64 = &v59;
    sub_10002AA30(v41, 1uLL, &v60);
    uint64_t v42 = *(void *)(a1 + 48);
    id v43 = [v4 name];
    id v44 = (unsigned __int8 *)[v43 UTF8String];
    unint64_t v60 = _NSConcreteStackBlock;
    uint64_t v61 = 3221225472;
    unsigned int v62 = sub_10002BB04;
    uint64_t v63 = &unk_1000A2450;
    CFStringRef v64 = v44;
    uint64_t v65 = v29;
    sub_10002AA30(v42, v29, &v60);

    sub_10002A9BC(*(void *)(a1 + 48));
  }
  switch(objc_msgSend(v4, "value_tag"))
  {
    case 0x10u:
    case 0x11u:
    case 0x12u:
    case 0x13u:
    case 0x15u:
    case 0x16u:
    case 0x17u:
      uint64_t v25 = *(void *)(a1 + 48);
      unsigned __int8 v59 = 0;
      unint64_t v60 = _NSConcreteStackBlock;
      uint64_t v61 = 3221225472;
      unsigned int v62 = sub_10002AAFC;
      uint64_t v63 = &unk_1000A2408;
      CFStringRef v64 = &v59;
      sub_10002AA30(v25, 1uLL, &v60);
      uint64_t v26 = *(void *)(a1 + 48);
      unsigned __int8 v59 = 0;
      unint64_t v60 = _NSConcreteStackBlock;
      uint64_t v61 = 3221225472;
      unsigned int v62 = sub_10002AAFC;
      uint64_t v63 = &unk_1000A2408;
      CFStringRef v64 = &v59;
      sub_10002AA30(v26, 1uLL, &v60);
      goto LABEL_28;
    case 0x21u:
    case 0x23u:
      uint64_t v35 = *(void *)(a1 + 48);
      id v36 = v4;
      unint64_t v60 = _NSConcreteStackBlock;
      uint64_t v61 = 3221225472;
      unsigned int v62 = sub_10002BB14;
      uint64_t v63 = &unk_1000A2478;
      uint64_t v65 = v35;
      uint64_t v37 = (unsigned __int8 *)v36;
      CFStringRef v64 = v37;
      [v37 enumerateValues:&v60];
      sub_10002A9BC(v35);
      goto LABEL_27;
    case 0x22u:
      uint64_t v53 = *(void *)(a1 + 48);
      id v54 = v4;
      unint64_t v60 = _NSConcreteStackBlock;
      uint64_t v61 = 3221225472;
      unsigned int v62 = sub_10002BEB4;
      uint64_t v63 = &unk_1000A2478;
      uint64_t v65 = v53;
      uint64_t v37 = (unsigned __int8 *)v54;
      CFStringRef v64 = v37;
      [v37 enumerateValues:&v60];
      sub_10002A9BC(v53);
LABEL_27:

      goto LABEL_28;
    case 0x31u:
      uint64_t v47 = *(void *)(a1 + 48);
      BOOL v48 = v4;
      unint64_t v60 = _NSConcreteStackBlock;
      uint64_t v61 = 3221225472;
      unsigned int v62 = sub_10002C464;
      uint64_t v63 = &unk_1000A2478;
      CFStringRef v64 = v48;
      uint64_t v65 = v47;
      [v48 enumerateValues:&v60];
      goto LABEL_8;
    case 0x32u:
      uint64_t v51 = *(void *)(a1 + 48);
      unsigned int v52 = v4;
      unint64_t v60 = _NSConcreteStackBlock;
      uint64_t v61 = 3221225472;
      unsigned int v62 = sub_10002C734;
      uint64_t v63 = &unk_1000A2478;
      CFStringRef v64 = v52;
      uint64_t v65 = v51;
      [v52 enumerateValues:&v60];
      goto LABEL_8;
    case 0x33u:
      uint64_t v49 = *(void *)(a1 + 48);
      unint64_t v50 = v4;
      unint64_t v60 = _NSConcreteStackBlock;
      uint64_t v61 = 3221225472;
      unsigned int v62 = sub_10002CCD4;
      uint64_t v63 = &unk_1000A2478;
      CFStringRef v64 = v50;
      uint64_t v65 = v49;
      [v50 enumerateValues:&v60];
      goto LABEL_8;
    case 0x34u:
      uint64_t v45 = *(void *)(a1 + 48);
      unsigned int v46 = v4;
      unint64_t v60 = _NSConcreteStackBlock;
      uint64_t v61 = 3221225472;
      unsigned int v62 = sub_10002D8B0;
      uint64_t v63 = &unk_1000A2478;
      CFStringRef v64 = v46;
      uint64_t v65 = v45;
      [v46 enumerateValues:&v60];
      goto LABEL_8;
    case 0x35u:
    case 0x36u:
      uint64_t v38 = *(void *)(a1 + 48);
      int v39 = v4;
      unint64_t v60 = _NSConcreteStackBlock;
      uint64_t v61 = 3221225472;
      unsigned int v62 = sub_10002D2C8;
      uint64_t v63 = &unk_1000A2478;
      CFStringRef v64 = v39;
      uint64_t v65 = v38;
      [v39 enumerateValues:&v60];
      goto LABEL_8;
    case 0x41u:
    case 0x42u:
    case 0x43u:
    case 0x44u:
    case 0x45u:
    case 0x46u:
    case 0x47u:
    case 0x48u:
    case 0x49u:
      uint64_t v22 = *(void *)(a1 + 48);
      double v23 = v4;
      unint64_t v60 = _NSConcreteStackBlock;
      uint64_t v61 = 3221225472;
      unsigned int v62 = sub_10002C128;
      uint64_t v63 = &unk_1000A2478;
      CFStringRef v64 = v23;
      uint64_t v65 = v22;
      [v23 enumerateValues:&v60];
      goto LABEL_8;
    default:
      uint64_t v55 = *(void *)(a1 + 48);
      unsigned int v56 = v4;
      unint64_t v60 = _NSConcreteStackBlock;
      uint64_t v61 = 3221225472;
      unsigned int v62 = sub_10002DB60;
      uint64_t v63 = &unk_1000A2478;
      CFStringRef v64 = v56;
      uint64_t v65 = v55;
      [v56 enumerateValues:&v60];
LABEL_8:

LABEL_28:
      sub_10002A9BC(*(void *)(a1 + 48));
      break;
  }
LABEL_29:
}

void sub_10002B93C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15)
{
  _Unwind_Resume(a1);
}

void *sub_10002BB04(uint64_t a1, void *__dst)
{
  return memcpy(__dst, *(const void **)(a1 + 32), *(void *)(a1 + 40));
}

void sub_10002BB14(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    uint64_t v6 = *(void *)(a1 + 40);
    unsigned __int8 v15 = objc_msgSend(*(id *)(a1 + 32), "value_tag");
    uint64_t v16 = _NSConcreteStackBlock;
    uint64_t v17 = 3221225472;
    uint64_t v18 = sub_10002AAFC;
    uint64_t v19 = &unk_1000A2408;
    uint64_t v20 = &v15;
    sub_10002AA30(v6, 1uLL, &v16);
    uint64_t v7 = *(void *)(a1 + 40);
    unsigned __int8 v15 = 0;
    uint64_t v16 = _NSConcreteStackBlock;
    uint64_t v17 = 3221225472;
    uint64_t v18 = sub_10002AAFC;
    uint64_t v19 = &unk_1000A2408;
    uint64_t v20 = &v15;
    sub_10002AA30(v7, 1uLL, &v16);
    uint64_t v8 = *(void *)(a1 + 40);
    unsigned __int8 v15 = 0;
    uint64_t v16 = _NSConcreteStackBlock;
    uint64_t v17 = 3221225472;
    uint64_t v18 = sub_10002AAFC;
    uint64_t v19 = &unk_1000A2408;
    uint64_t v20 = &v15;
    sub_10002AA30(v8, 1uLL, &v16);
  }
  uint64_t v9 = *(void *)(a1 + 40);
  unsigned __int8 v15 = 0;
  uint64_t v16 = _NSConcreteStackBlock;
  uint64_t v17 = 3221225472;
  uint64_t v18 = sub_10002AAFC;
  uint64_t v19 = &unk_1000A2408;
  uint64_t v20 = &v15;
  sub_10002AA30(v9, 1uLL, &v16);
  uint64_t v10 = *(void *)(a1 + 40);
  unsigned __int8 v15 = 4;
  uint64_t v16 = _NSConcreteStackBlock;
  uint64_t v17 = 3221225472;
  uint64_t v18 = sub_10002AAFC;
  uint64_t v19 = &unk_1000A2408;
  uint64_t v20 = &v15;
  sub_10002AA30(v10, 1uLL, &v16);
  uint64_t v11 = *(void *)(a1 + 40);
  unsigned __int8 v15 = [v5 integer] >> 24;
  uint64_t v16 = _NSConcreteStackBlock;
  uint64_t v17 = 3221225472;
  uint64_t v18 = sub_10002AAFC;
  uint64_t v19 = &unk_1000A2408;
  uint64_t v20 = &v15;
  sub_10002AA30(v11, 1uLL, &v16);
  uint64_t v12 = *(void *)(a1 + 40);
  unsigned __int8 v15 = [v5 integer] >> 16;
  uint64_t v16 = _NSConcreteStackBlock;
  uint64_t v17 = 3221225472;
  uint64_t v18 = sub_10002AAFC;
  uint64_t v19 = &unk_1000A2408;
  uint64_t v20 = &v15;
  sub_10002AA30(v12, 1uLL, &v16);
  uint64_t v13 = *(void *)(a1 + 40);
  unsigned __int8 v15 = (unsigned __int16)[v5 integer] >> 8;
  uint64_t v16 = _NSConcreteStackBlock;
  uint64_t v17 = 3221225472;
  uint64_t v18 = sub_10002AAFC;
  uint64_t v19 = &unk_1000A2408;
  uint64_t v20 = &v15;
  sub_10002AA30(v13, 1uLL, &v16);
  uint64_t v14 = *(void *)(a1 + 40);
  unsigned __int8 v15 = [v5 integer];
  uint64_t v16 = _NSConcreteStackBlock;
  uint64_t v17 = 3221225472;
  uint64_t v18 = sub_10002AAFC;
  uint64_t v19 = &unk_1000A2408;
  uint64_t v20 = &v15;
  sub_10002AA30(v14, 1uLL, &v16);
}

void sub_10002BE84(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10002BEB4(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    uint64_t v6 = *(void *)(a1 + 40);
    unsigned __int8 v12 = objc_msgSend(*(id *)(a1 + 32), "value_tag");
    uint64_t v13 = _NSConcreteStackBlock;
    uint64_t v14 = 3221225472;
    unsigned __int8 v15 = sub_10002AAFC;
    uint64_t v16 = &unk_1000A2408;
    uint64_t v17 = &v12;
    sub_10002AA30(v6, 1uLL, &v13);
    uint64_t v7 = *(void *)(a1 + 40);
    unsigned __int8 v12 = 0;
    uint64_t v13 = _NSConcreteStackBlock;
    uint64_t v14 = 3221225472;
    unsigned __int8 v15 = sub_10002AAFC;
    uint64_t v16 = &unk_1000A2408;
    uint64_t v17 = &v12;
    sub_10002AA30(v7, 1uLL, &v13);
    uint64_t v8 = *(void *)(a1 + 40);
    unsigned __int8 v12 = 0;
    uint64_t v13 = _NSConcreteStackBlock;
    uint64_t v14 = 3221225472;
    unsigned __int8 v15 = sub_10002AAFC;
    uint64_t v16 = &unk_1000A2408;
    uint64_t v17 = &v12;
    sub_10002AA30(v8, 1uLL, &v13);
  }
  uint64_t v9 = *(void *)(a1 + 40);
  unsigned __int8 v12 = 0;
  uint64_t v13 = _NSConcreteStackBlock;
  uint64_t v14 = 3221225472;
  unsigned __int8 v15 = sub_10002AAFC;
  uint64_t v16 = &unk_1000A2408;
  uint64_t v17 = &v12;
  sub_10002AA30(v9, 1uLL, &v13);
  uint64_t v10 = *(void *)(a1 + 40);
  unsigned __int8 v12 = 1;
  uint64_t v13 = _NSConcreteStackBlock;
  uint64_t v14 = 3221225472;
  unsigned __int8 v15 = sub_10002AAFC;
  uint64_t v16 = &unk_1000A2408;
  uint64_t v17 = &v12;
  sub_10002AA30(v10, 1uLL, &v13);
  uint64_t v11 = *(void *)(a1 + 40);
  unsigned __int8 v12 = [v5 BOOLean];
  uint64_t v13 = _NSConcreteStackBlock;
  uint64_t v14 = 3221225472;
  unsigned __int8 v15 = sub_10002AAFC;
  uint64_t v16 = &unk_1000A2408;
  uint64_t v17 = &v12;
  sub_10002AA30(v11, 1uLL, &v13);
}

void sub_10002C104(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10002C128(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    uint64_t v6 = *(void *)(a1 + 40);
    unsigned __int8 v23 = objc_msgSend(*(id *)(a1 + 32), "value_tag");
    int v24 = _NSConcreteStackBlock;
    uint64_t v25 = 3221225472;
    uint64_t v26 = sub_10002AAFC;
    uint64_t v27 = &unk_1000A2408;
    uint64_t v28 = &v23;
    sub_10002AA30(v6, 1uLL, &v24);
    uint64_t v7 = *(void *)(a1 + 40);
    unsigned __int8 v23 = 0;
    int v24 = _NSConcreteStackBlock;
    uint64_t v25 = 3221225472;
    uint64_t v26 = sub_10002AAFC;
    uint64_t v27 = &unk_1000A2408;
    uint64_t v28 = &v23;
    sub_10002AA30(v7, 1uLL, &v24);
    uint64_t v8 = *(void *)(a1 + 40);
    unsigned __int8 v23 = 0;
    int v24 = _NSConcreteStackBlock;
    uint64_t v25 = 3221225472;
    uint64_t v26 = sub_10002AAFC;
    uint64_t v27 = &unk_1000A2408;
    uint64_t v28 = &v23;
    sub_10002AA30(v8, 1uLL, &v24);
  }
  id v9 = [v5 string];
  uint64_t v11 = v10;

  if (v11)
  {
    id v12 = [v5 string];
    uint64_t v14 = v13;
    LODWORD(v11) = strlen((const char *)[v13 UTF8String]);

    if ((int)v11 >= 0x8000)
    {
      id v22 = +[NSException exceptionWithName:@"IPPInternal" reason:@"'text' value length too large" userInfo:0];
      objc_exception_throw(v22);
    }
  }
  uint64_t v15 = *(void *)(a1 + 40);
  unsigned __int8 v23 = BYTE1(v11);
  int v24 = _NSConcreteStackBlock;
  uint64_t v25 = 3221225472;
  uint64_t v26 = sub_10002AAFC;
  uint64_t v27 = &unk_1000A2408;
  uint64_t v28 = &v23;
  sub_10002AA30(v15, 1uLL, &v24);
  uint64_t v16 = *(void *)(a1 + 40);
  unsigned __int8 v23 = v11;
  int v24 = _NSConcreteStackBlock;
  uint64_t v25 = 3221225472;
  uint64_t v26 = sub_10002AAFC;
  uint64_t v27 = &unk_1000A2408;
  uint64_t v28 = &v23;
  sub_10002AA30(v16, 1uLL, &v24);
  if ((int)v11 >= 1)
  {
    uint64_t v17 = *(void *)(a1 + 40);
    id v18 = [v5 string];
    uint64_t v20 = v19;
    uint64_t v21 = (unsigned __int8 *)[v19 UTF8String];
    int v24 = _NSConcreteStackBlock;
    uint64_t v25 = 3221225472;
    uint64_t v26 = sub_10002BB04;
    uint64_t v27 = &unk_1000A2450;
    uint64_t v28 = v21;
    uint64_t v29 = v11;
    sub_10002AA30(v17, v11, &v24);
  }
  sub_10002A9BC(*(void *)(a1 + 40));
}

void sub_10002C420(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10002C464(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    uint64_t v6 = *(void *)(a1 + 40);
    LOBYTE(v21) = objc_msgSend(*(id *)(a1 + 32), "value_tag");
    uint64_t v15 = _NSConcreteStackBlock;
    uint64_t v16 = 3221225472;
    uint64_t v17 = sub_10002AAFC;
    id v18 = &unk_1000A2408;
    uint64_t v19 = &v21;
    sub_10002AA30(v6, 1uLL, &v15);
    uint64_t v7 = *(void *)(a1 + 40);
    LOBYTE(v21) = 0;
    uint64_t v15 = _NSConcreteStackBlock;
    uint64_t v16 = 3221225472;
    uint64_t v17 = sub_10002AAFC;
    id v18 = &unk_1000A2408;
    uint64_t v19 = &v21;
    sub_10002AA30(v7, 1uLL, &v15);
    uint64_t v8 = *(void *)(a1 + 40);
    LOBYTE(v21) = 0;
    uint64_t v15 = _NSConcreteStackBlock;
    uint64_t v16 = 3221225472;
    uint64_t v17 = sub_10002AAFC;
    id v18 = &unk_1000A2408;
    uint64_t v19 = &v21;
    sub_10002AA30(v8, 1uLL, &v15);
  }
  uint64_t v9 = *(void *)(a1 + 40);
  LOBYTE(v21) = 0;
  uint64_t v15 = _NSConcreteStackBlock;
  uint64_t v16 = 3221225472;
  uint64_t v17 = sub_10002AAFC;
  id v18 = &unk_1000A2408;
  uint64_t v19 = &v21;
  sub_10002AA30(v9, 1uLL, &v15);
  uint64_t v10 = *(void *)(a1 + 40);
  LOBYTE(v21) = 11;
  uint64_t v15 = _NSConcreteStackBlock;
  uint64_t v16 = 3221225472;
  uint64_t v17 = sub_10002AAFC;
  id v18 = &unk_1000A2408;
  uint64_t v19 = &v21;
  sub_10002AA30(v10, 1uLL, &v15);
  uint64_t v11 = *(void *)(a1 + 40);
  id v12 = [v5 date];
  __int16 v22 = v13;
  char v23 = v14;
  uint64_t v15 = _NSConcreteStackBlock;
  uint64_t v16 = 3221225472;
  uint64_t v17 = sub_10002BB04;
  id v18 = &unk_1000A2450;
  uint64_t v19 = &v21;
  uint64_t v20 = 11;
  id v21 = v12;
  sub_10002AA30(v11, 0xBuLL, &v15);
  sub_10002A9BC(*(void *)(a1 + 40));
}

void sub_10002C704(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10002C734(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    uint64_t v6 = *(void *)(a1 + 40);
    unsigned __int8 v21 = objc_msgSend(*(id *)(a1 + 32), "value_tag");
    __int16 v22 = _NSConcreteStackBlock;
    uint64_t v23 = 3221225472;
    int v24 = sub_10002AAFC;
    uint64_t v25 = &unk_1000A2408;
    uint64_t v26 = &v21;
    sub_10002AA30(v6, 1uLL, &v22);
    uint64_t v7 = *(void *)(a1 + 40);
    unsigned __int8 v21 = 0;
    __int16 v22 = _NSConcreteStackBlock;
    uint64_t v23 = 3221225472;
    int v24 = sub_10002AAFC;
    uint64_t v25 = &unk_1000A2408;
    uint64_t v26 = &v21;
    sub_10002AA30(v7, 1uLL, &v22);
    uint64_t v8 = *(void *)(a1 + 40);
    unsigned __int8 v21 = 0;
    __int16 v22 = _NSConcreteStackBlock;
    uint64_t v23 = 3221225472;
    int v24 = sub_10002AAFC;
    uint64_t v25 = &unk_1000A2408;
    uint64_t v26 = &v21;
    sub_10002AA30(v8, 1uLL, &v22);
  }
  uint64_t v9 = *(void *)(a1 + 40);
  unsigned __int8 v21 = 0;
  __int16 v22 = _NSConcreteStackBlock;
  uint64_t v23 = 3221225472;
  int v24 = sub_10002AAFC;
  uint64_t v25 = &unk_1000A2408;
  uint64_t v26 = &v21;
  sub_10002AA30(v9, 1uLL, &v22);
  uint64_t v10 = *(void *)(a1 + 40);
  unsigned __int8 v21 = 9;
  __int16 v22 = _NSConcreteStackBlock;
  uint64_t v23 = 3221225472;
  int v24 = sub_10002AAFC;
  uint64_t v25 = &unk_1000A2408;
  uint64_t v26 = &v21;
  sub_10002AA30(v10, 1uLL, &v22);
  uint64_t v11 = *(void *)(a1 + 40);
  unsigned __int8 v21 = [v5 resolution] >> 24;
  __int16 v22 = _NSConcreteStackBlock;
  uint64_t v23 = 3221225472;
  int v24 = sub_10002AAFC;
  uint64_t v25 = &unk_1000A2408;
  uint64_t v26 = &v21;
  sub_10002AA30(v11, 1uLL, &v22);
  uint64_t v12 = *(void *)(a1 + 40);
  unsigned __int8 v21 = [v5 resolution] >> 16;
  __int16 v22 = _NSConcreteStackBlock;
  uint64_t v23 = 3221225472;
  int v24 = sub_10002AAFC;
  uint64_t v25 = &unk_1000A2408;
  uint64_t v26 = &v21;
  sub_10002AA30(v12, 1uLL, &v22);
  uint64_t v13 = *(void *)(a1 + 40);
  unsigned __int8 v21 = (unsigned __int16)[v5 resolution] >> 8;
  __int16 v22 = _NSConcreteStackBlock;
  uint64_t v23 = 3221225472;
  int v24 = sub_10002AAFC;
  uint64_t v25 = &unk_1000A2408;
  uint64_t v26 = &v21;
  sub_10002AA30(v13, 1uLL, &v22);
  uint64_t v14 = *(void *)(a1 + 40);
  unsigned __int8 v21 = [v5 resolution];
  __int16 v22 = _NSConcreteStackBlock;
  uint64_t v23 = 3221225472;
  int v24 = sub_10002AAFC;
  uint64_t v25 = &unk_1000A2408;
  uint64_t v26 = &v21;
  sub_10002AA30(v14, 1uLL, &v22);
  uint64_t v15 = *(void *)(a1 + 40);
  unsigned __int8 v21 = (unint64_t)[v5 resolution] >> 56;
  __int16 v22 = _NSConcreteStackBlock;
  uint64_t v23 = 3221225472;
  int v24 = sub_10002AAFC;
  uint64_t v25 = &unk_1000A2408;
  uint64_t v26 = &v21;
  sub_10002AA30(v15, 1uLL, &v22);
  uint64_t v16 = *(void *)(a1 + 40);
  unsigned __int8 v21 = (unint64_t)[v5 resolution] >> 48;
  __int16 v22 = _NSConcreteStackBlock;
  uint64_t v23 = 3221225472;
  int v24 = sub_10002AAFC;
  uint64_t v25 = &unk_1000A2408;
  uint64_t v26 = &v21;
  sub_10002AA30(v16, 1uLL, &v22);
  uint64_t v17 = *(void *)(a1 + 40);
  unsigned __int8 v21 = (unsigned __int16)((unint64_t)[v5 resolution] >> 32) >> 8;
  __int16 v22 = _NSConcreteStackBlock;
  uint64_t v23 = 3221225472;
  int v24 = sub_10002AAFC;
  uint64_t v25 = &unk_1000A2408;
  uint64_t v26 = &v21;
  sub_10002AA30(v17, 1uLL, &v22);
  uint64_t v18 = *(void *)(a1 + 40);
  unsigned __int8 v21 = (unint64_t)[v5 resolution] >> 32;
  __int16 v22 = _NSConcreteStackBlock;
  uint64_t v23 = 3221225472;
  int v24 = sub_10002AAFC;
  uint64_t v25 = &unk_1000A2408;
  uint64_t v26 = &v21;
  sub_10002AA30(v18, 1uLL, &v22);
  uint64_t v19 = *(void *)(a1 + 40);
  [v5 resolution];
  unsigned __int8 v21 = v20;
  __int16 v22 = _NSConcreteStackBlock;
  uint64_t v23 = 3221225472;
  int v24 = sub_10002AAFC;
  uint64_t v25 = &unk_1000A2408;
  uint64_t v26 = &v21;
  sub_10002AA30(v19, 1uLL, &v22);
  sub_10002A9BC(*(void *)(a1 + 40));
}

void sub_10002CC8C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10002CCD4(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    uint64_t v6 = *(void *)(a1 + 40);
    LOBYTE(v27) = objc_msgSend(*(id *)(a1 + 32), "value_tag");
    uint64_t v29 = _NSConcreteStackBlock;
    uint64_t v30 = 3221225472;
    uint64_t v31 = sub_10002AAFC;
    uint64_t v32 = &unk_1000A2408;
    uint64_t v33 = &v27;
    sub_10002AA30(v6, 1uLL, &v29);
    uint64_t v7 = *(void *)(a1 + 40);
    LOBYTE(v27) = 0;
    uint64_t v29 = _NSConcreteStackBlock;
    uint64_t v30 = 3221225472;
    uint64_t v31 = sub_10002AAFC;
    uint64_t v32 = &unk_1000A2408;
    uint64_t v33 = &v27;
    sub_10002AA30(v7, 1uLL, &v29);
    uint64_t v8 = *(void *)(a1 + 40);
    LOBYTE(v27) = 0;
    uint64_t v29 = _NSConcreteStackBlock;
    uint64_t v30 = 3221225472;
    uint64_t v31 = sub_10002AAFC;
    uint64_t v32 = &unk_1000A2408;
    uint64_t v33 = &v27;
    sub_10002AA30(v8, 1uLL, &v29);
  }
  uint64_t v9 = *(void *)(a1 + 40);
  LOBYTE(v27) = 0;
  uint64_t v29 = _NSConcreteStackBlock;
  uint64_t v30 = 3221225472;
  uint64_t v31 = sub_10002AAFC;
  uint64_t v32 = &unk_1000A2408;
  uint64_t v33 = &v27;
  sub_10002AA30(v9, 1uLL, &v29);
  uint64_t v10 = *(void *)(a1 + 40);
  LOBYTE(v27) = 8;
  uint64_t v29 = _NSConcreteStackBlock;
  uint64_t v30 = 3221225472;
  uint64_t v31 = sub_10002AAFC;
  uint64_t v32 = &unk_1000A2408;
  uint64_t v33 = &v27;
  sub_10002AA30(v10, 1uLL, &v29);
  uint64_t v11 = *(void *)(a1 + 40);
  if (v5)
  {
    [v5 range];
    char v12 = BYTE3(v27);
  }
  else
  {
    char v12 = 0;
    uint64_t v27 = 0;
  }
  char v28 = v12;
  uint64_t v29 = _NSConcreteStackBlock;
  uint64_t v30 = 3221225472;
  uint64_t v31 = sub_10002AAFC;
  uint64_t v32 = &unk_1000A2408;
  uint64_t v33 = (uint64_t *)&v28;
  sub_10002AA30(v11, 1uLL, &v29);
  uint64_t v13 = *(void *)(a1 + 40);
  if (v5)
  {
    [v5 range];
    char v14 = BYTE2(v27);
  }
  else
  {
    char v14 = 0;
    uint64_t v27 = 0;
  }
  char v28 = v14;
  uint64_t v29 = _NSConcreteStackBlock;
  uint64_t v30 = 3221225472;
  uint64_t v31 = sub_10002AAFC;
  uint64_t v32 = &unk_1000A2408;
  uint64_t v33 = (uint64_t *)&v28;
  sub_10002AA30(v13, 1uLL, &v29);
  uint64_t v15 = *(void *)(a1 + 40);
  if (v5)
  {
    [v5 range];
    char v16 = BYTE1(v27);
  }
  else
  {
    char v16 = 0;
    uint64_t v27 = 0;
  }
  char v28 = v16;
  uint64_t v29 = _NSConcreteStackBlock;
  uint64_t v30 = 3221225472;
  uint64_t v31 = sub_10002AAFC;
  uint64_t v32 = &unk_1000A2408;
  uint64_t v33 = (uint64_t *)&v28;
  sub_10002AA30(v15, 1uLL, &v29);
  uint64_t v17 = *(void *)(a1 + 40);
  if (v5)
  {
    [v5 range];
    char v18 = v27;
  }
  else
  {
    char v18 = 0;
    uint64_t v27 = 0;
  }
  char v28 = v18;
  uint64_t v29 = _NSConcreteStackBlock;
  uint64_t v30 = 3221225472;
  uint64_t v31 = sub_10002AAFC;
  uint64_t v32 = &unk_1000A2408;
  uint64_t v33 = (uint64_t *)&v28;
  sub_10002AA30(v17, 1uLL, &v29);
  uint64_t v19 = *(void *)(a1 + 40);
  if (v5)
  {
    [v5 range];
    char v20 = HIBYTE(v27);
  }
  else
  {
    char v20 = 0;
    uint64_t v27 = 0;
  }
  char v28 = v20;
  uint64_t v29 = _NSConcreteStackBlock;
  uint64_t v30 = 3221225472;
  uint64_t v31 = sub_10002AAFC;
  uint64_t v32 = &unk_1000A2408;
  uint64_t v33 = (uint64_t *)&v28;
  sub_10002AA30(v19, 1uLL, &v29);
  uint64_t v21 = *(void *)(a1 + 40);
  if (v5)
  {
    [v5 range];
    char v22 = BYTE6(v27);
  }
  else
  {
    char v22 = 0;
    uint64_t v27 = 0;
  }
  char v28 = v22;
  uint64_t v29 = _NSConcreteStackBlock;
  uint64_t v30 = 3221225472;
  uint64_t v31 = sub_10002AAFC;
  uint64_t v32 = &unk_1000A2408;
  uint64_t v33 = (uint64_t *)&v28;
  sub_10002AA30(v21, 1uLL, &v29);
  uint64_t v23 = *(void *)(a1 + 40);
  if (v5)
  {
    [v5 range];
    int v24 = HIDWORD(v27) >> 8;
  }
  else
  {
    LOBYTE(v24) = 0;
    uint64_t v27 = 0;
  }
  char v28 = v24;
  uint64_t v29 = _NSConcreteStackBlock;
  uint64_t v30 = 3221225472;
  uint64_t v31 = sub_10002AAFC;
  uint64_t v32 = &unk_1000A2408;
  uint64_t v33 = (uint64_t *)&v28;
  sub_10002AA30(v23, 1uLL, &v29);
  uint64_t v25 = *(void *)(a1 + 40);
  if (v5)
  {
    [v5 range];
    char v26 = BYTE4(v27);
  }
  else
  {
    char v26 = 0;
    uint64_t v27 = 0;
  }
  char v28 = v26;
  uint64_t v29 = _NSConcreteStackBlock;
  uint64_t v30 = 3221225472;
  uint64_t v31 = sub_10002AAFC;
  uint64_t v32 = &unk_1000A2408;
  uint64_t v33 = (uint64_t *)&v28;
  sub_10002AA30(v25, 1uLL, &v29);
  sub_10002A9BC(*(void *)(a1 + 40));
}

void sub_10002D284(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10002D2C8(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    uint64_t v6 = *(void *)(a1 + 40);
    unsigned __int8 v49 = objc_msgSend(*(id *)(a1 + 32), "value_tag");
    unint64_t v50 = _NSConcreteStackBlock;
    uint64_t v51 = 3221225472;
    unsigned int v52 = sub_10002AAFC;
    uint64_t v53 = &unk_1000A2408;
    id v54 = &v49;
    sub_10002AA30(v6, 1uLL, &v50);
    uint64_t v7 = *(void *)(a1 + 40);
    unsigned __int8 v49 = 0;
    unint64_t v50 = _NSConcreteStackBlock;
    uint64_t v51 = 3221225472;
    unsigned int v52 = sub_10002AAFC;
    uint64_t v53 = &unk_1000A2408;
    id v54 = &v49;
    sub_10002AA30(v7, 1uLL, &v50);
    uint64_t v8 = *(void *)(a1 + 40);
    unsigned __int8 v49 = 0;
    unint64_t v50 = _NSConcreteStackBlock;
    uint64_t v51 = 3221225472;
    unsigned int v52 = sub_10002AAFC;
    uint64_t v53 = &unk_1000A2408;
    id v54 = &v49;
    sub_10002AA30(v8, 1uLL, &v50);
  }
  id v9 = [v5 string];

  if (v9)
  {
    id v11 = [v5 string];
    uint64_t v13 = v12;
    int v14 = strlen((const char *)[v11 UTF8String]) + 4;
  }
  else
  {
    int v14 = 4;
  }
  id v15 = [v5 string];
  uint64_t v17 = v16;

  if (v17)
  {
    id v18 = [v5 string];
    char v20 = v19;
    v14 += strlen((const char *)[v19 UTF8String]);
  }
  if (v14 >= 0x8000)
  {
    id v48 = +[NSException exceptionWithName:@"IPPInternal" reason:@"'text' value length too large" userInfo:0];
    objc_exception_throw(v48);
  }
  uint64_t v21 = *(void *)(a1 + 40);
  unsigned __int8 v49 = BYTE1(v14);
  unint64_t v50 = _NSConcreteStackBlock;
  uint64_t v51 = 3221225472;
  unsigned int v52 = sub_10002AAFC;
  uint64_t v53 = &unk_1000A2408;
  id v54 = &v49;
  sub_10002AA30(v21, 1uLL, &v50);
  uint64_t v22 = *(void *)(a1 + 40);
  unsigned __int8 v49 = v14;
  unint64_t v50 = _NSConcreteStackBlock;
  uint64_t v51 = 3221225472;
  unsigned int v52 = sub_10002AAFC;
  uint64_t v53 = &unk_1000A2408;
  id v54 = &v49;
  sub_10002AA30(v22, 1uLL, &v50);
  id v23 = [v5 string];

  if (v23)
  {
    id v25 = [v5 string];
    uint64_t v27 = v26;
    LODWORD(v23) = strlen((const char *)[v25 UTF8String]);
  }
  uint64_t v28 = *(void *)(a1 + 40);
  unsigned __int8 v49 = BYTE1(v23);
  unint64_t v50 = _NSConcreteStackBlock;
  uint64_t v51 = 3221225472;
  unsigned int v52 = sub_10002AAFC;
  uint64_t v53 = &unk_1000A2408;
  id v54 = &v49;
  sub_10002AA30(v28, 1uLL, &v50);
  uint64_t v29 = *(void *)(a1 + 40);
  unsigned __int8 v49 = v23;
  unint64_t v50 = _NSConcreteStackBlock;
  uint64_t v51 = 3221225472;
  unsigned int v52 = sub_10002AAFC;
  uint64_t v53 = &unk_1000A2408;
  id v54 = &v49;
  sub_10002AA30(v29, 1uLL, &v50);
  if ((int)v23 >= 1)
  {
    uint64_t v30 = *(void *)(a1 + 40);
    id v31 = [v5 string];
    uint64_t v33 = v32;
    uint64_t v34 = (unsigned __int8 *)[v31 UTF8String];
    unint64_t v50 = _NSConcreteStackBlock;
    uint64_t v51 = 3221225472;
    unsigned int v52 = sub_10002BB04;
    uint64_t v53 = &unk_1000A2450;
    id v54 = v34;
    uint64_t v55 = v23;
    sub_10002AA30(v30, v23, &v50);
  }
  id v35 = [v5 string];
  uint64_t v37 = v36;

  if (v37)
  {
    id v38 = [v5 string];
    uint64_t v40 = v39;
    LODWORD(v37) = strlen((const char *)[v39 UTF8String]);
  }
  uint64_t v41 = *(void *)(a1 + 40);
  unsigned __int8 v49 = BYTE1(v37);
  unint64_t v50 = _NSConcreteStackBlock;
  uint64_t v51 = 3221225472;
  unsigned int v52 = sub_10002AAFC;
  uint64_t v53 = &unk_1000A2408;
  id v54 = &v49;
  sub_10002AA30(v41, 1uLL, &v50);
  uint64_t v42 = *(void *)(a1 + 40);
  unsigned __int8 v49 = v37;
  unint64_t v50 = _NSConcreteStackBlock;
  uint64_t v51 = 3221225472;
  unsigned int v52 = sub_10002AAFC;
  uint64_t v53 = &unk_1000A2408;
  id v54 = &v49;
  sub_10002AA30(v42, 1uLL, &v50);
  if ((int)v37 >= 1)
  {
    uint64_t v43 = *(void *)(a1 + 40);
    id v44 = [v5 string];
    unsigned int v46 = v45;
    uint64_t v47 = (unsigned __int8 *)[v45 UTF8String];
    unint64_t v50 = _NSConcreteStackBlock;
    uint64_t v51 = 3221225472;
    unsigned int v52 = sub_10002BB04;
    uint64_t v53 = &unk_1000A2450;
    id v54 = v47;
    uint64_t v55 = v37;
    sub_10002AA30(v43, v37, &v50);
  }
  sub_10002A9BC(*(void *)(a1 + 40));
}

void sub_10002D824(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10002D8B0(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    uint64_t v6 = *(void *)(a1 + 40);
    LOBYTE(v15) = objc_msgSend(*(id *)(a1 + 32), "value_tag");
    char v16 = _NSConcreteStackBlock;
    uint64_t v17 = 3221225472;
    id v18 = sub_10002AAFC;
    uint64_t v19 = &unk_1000A2408;
    char v20 = &v15;
    sub_10002AA30(v6, 1uLL, &v16);
    uint64_t v7 = *(void *)(a1 + 40);
    LOBYTE(v15) = 0;
    char v16 = _NSConcreteStackBlock;
    uint64_t v17 = 3221225472;
    id v18 = sub_10002AAFC;
    uint64_t v19 = &unk_1000A2408;
    char v20 = &v15;
    sub_10002AA30(v7, 1uLL, &v16);
    uint64_t v8 = *(void *)(a1 + 40);
    LOBYTE(v15) = 0;
    char v16 = _NSConcreteStackBlock;
    uint64_t v17 = 3221225472;
    id v18 = sub_10002AAFC;
    uint64_t v19 = &unk_1000A2408;
    char v20 = &v15;
    sub_10002AA30(v8, 1uLL, &v16);
  }
  uint64_t v9 = *(void *)(a1 + 40);
  LOBYTE(v15) = 0;
  char v16 = _NSConcreteStackBlock;
  uint64_t v17 = 3221225472;
  id v18 = sub_10002AAFC;
  uint64_t v19 = &unk_1000A2408;
  char v20 = &v15;
  sub_10002AA30(v9, 1uLL, &v16);
  uint64_t v10 = *(void *)(a1 + 40);
  LOBYTE(v15) = 0;
  char v16 = _NSConcreteStackBlock;
  uint64_t v17 = 3221225472;
  id v18 = sub_10002AAFC;
  uint64_t v19 = &unk_1000A2408;
  char v20 = &v15;
  sub_10002AA30(v10, 1uLL, &v16);
  id v11 = [v5 collection];

  if (!v11)
  {
    id v14 = +[NSException exceptionWithName:@"IPPInternal" reason:@"IPP Value nil" userInfo:0];
    objc_exception_throw(v14);
  }
  int v15 = 0;
  LODWORD(v16) = 19;
  uint64_t v12 = *(void *)(a1 + 40);
  uint64_t v13 = [v5 collection];
  sub_10002A374(v12, &v15, &v16, 1, v13);

  sub_10002A9BC(*(void *)(a1 + 40));
}

void sub_10002DB2C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10002DB60(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    uint64_t v6 = *(void *)(a1 + 40);
    unsigned __int8 v17 = objc_msgSend(*(id *)(a1 + 32), "value_tag");
    id v18 = _NSConcreteStackBlock;
    uint64_t v19 = 3221225472;
    char v20 = sub_10002AAFC;
    uint64_t v21 = &unk_1000A2408;
    uint64_t v22 = &v17;
    sub_10002AA30(v6, 1uLL, &v18);
    uint64_t v7 = *(void *)(a1 + 40);
    unsigned __int8 v17 = 0;
    id v18 = _NSConcreteStackBlock;
    uint64_t v19 = 3221225472;
    char v20 = sub_10002AAFC;
    uint64_t v21 = &unk_1000A2408;
    uint64_t v22 = &v17;
    sub_10002AA30(v7, 1uLL, &v18);
    uint64_t v8 = *(void *)(a1 + 40);
    unsigned __int8 v17 = 0;
    id v18 = _NSConcreteStackBlock;
    uint64_t v19 = 3221225472;
    char v20 = sub_10002AAFC;
    uint64_t v21 = &unk_1000A2408;
    uint64_t v22 = &v17;
    sub_10002AA30(v8, 1uLL, &v18);
  }
  uint64_t v9 = [v5 unknown];
  int v10 = [v9 length];

  if (v10 >= 0x8000)
  {
    id v16 = +[NSException exceptionWithName:@"IPPInternal" reason:@"'unknown' value length too large" userInfo:0];
    objc_exception_throw(v16);
  }
  uint64_t v11 = *(void *)(a1 + 40);
  unsigned __int8 v17 = BYTE1(v10);
  id v18 = _NSConcreteStackBlock;
  uint64_t v19 = 3221225472;
  char v20 = sub_10002AAFC;
  uint64_t v21 = &unk_1000A2408;
  uint64_t v22 = &v17;
  sub_10002AA30(v11, 1uLL, &v18);
  uint64_t v12 = *(void *)(a1 + 40);
  unsigned __int8 v17 = v10;
  id v18 = _NSConcreteStackBlock;
  uint64_t v19 = 3221225472;
  char v20 = sub_10002AAFC;
  uint64_t v21 = &unk_1000A2408;
  uint64_t v22 = &v17;
  sub_10002AA30(v12, 1uLL, &v18);
  if (v10 >= 1)
  {
    uint64_t v13 = *(void *)(a1 + 40);
    id v14 = [v5 unknown];
    int v15 = (unsigned __int8 *)[v14 bytes];
    id v18 = _NSConcreteStackBlock;
    uint64_t v19 = 3221225472;
    char v20 = sub_10002BB04;
    uint64_t v21 = &unk_1000A2450;
    uint64_t v22 = v15;
    uint64_t v23 = v10;
    sub_10002AA30(v13, v10, &v18);
  }
  sub_10002A9BC(*(void *)(a1 + 40));
}

void sub_10002DE2C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_10002DE68(uint64_t a1)
{
  return a1;
}

void sub_10002DF40(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10002DFE4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10002E11C(_Unwind_Exception *a1)
{
  id v5 = v3;

  _Unwind_Resume(a1);
}

void sub_10002E2C4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10002E37C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10002E430(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10002E49C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10002E57C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10002E818(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,id location)
{
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_10002E8A4(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v9 = a3;
  id v10 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _browserForServiceType:*(void *)(a1 + 32) changedFrom:v10 to:v9 done:a4];
}

void sub_10002E948(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10002E9C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10002E9D8(id a1, OS_nw_browser *a2, unint64_t a3, BOOL *a4)
{
}

void sub_10002EAE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

uint64_t sub_10002EB08(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5)
{
  if (a3 != 4) {
    return 0;
  }
  id v6 = [objc_alloc((Class)NSString) initWithBytes:a4 length:a5 encoding:4];
  uint64_t v7 = [v6 lowercaseString];
  uint64_t v8 = [v7 componentsSeparatedByString:@","];

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v9 = v8;
  id v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v19;
    while (2)
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v9);
        }
        uint64_t v13 = *(void **)(*((void *)&v18 + 1) + 8 * (void)v12);
        uint64_t v14 = +[NSCharacterSet whitespaceCharacterSet];
        int v15 = [v13 stringByTrimmingCharactersInSet:v14];

        LOBYTE(v14) = [v15 isEqualToString:*(void *)(a1 + 32)];
        if (v14)
        {
          uint64_t v16 = 1;
          goto LABEL_13;
        }
        uint64_t v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
  uint64_t v16 = 0;
LABEL_13:

  return v16;
}

void sub_10002ECB8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10002EEF0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10002F044(_Unwind_Exception *a1)
{
  uint64_t v4 = v2;

  _Unwind_Resume(a1);
}

void sub_10002F120(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

id _PKLogCategory(void *a1)
{
  id v1 = a1;
  if (qword_1000C8B08 != -1) {
    dispatch_once(&qword_1000C8B08, &stru_1000A2528);
  }
  id v2 = [(id)qword_1000C8B00 objectForKeyedSubscript:v1];
  if (!v2)
  {
    id v2 = &_os_log_default;
    id v3 = &_os_log_default;
  }

  return v2;
}

void sub_10002F21C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void withDebuggableSemaphore(void *a1, void *a2, double a3)
{
  id v5 = a1;
  id v6 = a2;
  unsigned int add = atomic_fetch_add(dword_1000C8658, 1u);
  uint64_t v8 = _PKLogCategory(PKLogCategoryDefault[0]);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 67109378;
    unsigned int v15 = add;
    __int16 v16 = 2114;
    id v17 = v5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[%d] synchronous callout from %{public}@ - begin", (uint8_t *)&v14, 0x12u);
  }

  id v9 = dispatch_semaphore_create(0);
  v6[2](v6, v9);
  dispatch_time_t v10 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
  intptr_t v11 = dispatch_semaphore_wait(v9, v10);
  uint64_t v12 = _PKLogCategory(PKLogCategoryDefault[0]);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = "timed out";
    int v14 = 67109634;
    unsigned int v15 = add;
    if (!v11) {
      uint64_t v13 = "completed";
    }
    __int16 v16 = 2114;
    id v17 = v5;
    __int16 v18 = 2082;
    long long v19 = v13;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "[%d] synchronous callout from %{public}@ - %{public}s", (uint8_t *)&v14, 0x1Cu);
  }
}

void sub_10002F3F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10002F424(id a1)
{
  v8[0] = PKLogCategoryDefault[0];
  os_log_t v1 = os_log_create("com.apple.printing", (const char *)[(__CFString *)PKLogCategoryDefault[0] UTF8String]);
  v9[0] = v1;
  v8[1] = PKLogCategoryNetwork[0];
  os_log_t v2 = os_log_create("com.apple.printing", (const char *)[(__CFString *)PKLogCategoryNetwork[0] UTF8String]);
  v9[1] = v2;
  v8[2] = PKLogCategoryDiscovery[0];
  os_log_t v3 = os_log_create("com.apple.printing", (const char *)[(__CFString *)PKLogCategoryDiscovery[0] UTF8String]);
  void v9[2] = v3;
  v8[3] = PKLogCategoryProgress[0];
  os_log_t v4 = os_log_create("com.apple.printing", (const char *)[(__CFString *)PKLogCategoryProgress[0] UTF8String]);
  v9[3] = v4;
  void v8[4] = PKLogCategoryFramework;
  os_log_t v5 = os_log_create("com.apple.printing", (const char *)[PKLogCategoryFramework UTF8String]);
  v9[4] = v5;
  uint64_t v6 = +[NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:5];
  uint64_t v7 = (void *)qword_1000C8B00;
  qword_1000C8B00 = v6;
}

void sub_10002F58C(_Unwind_Exception *a1)
{
  uint64_t v6 = v5;

  _Unwind_Resume(a1);
}

void sub_10002F64C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10002F998(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10002FBA4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10002FC4C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10002FDB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  id v17 = v16;

  _Unwind_Resume(a1);
}

void sub_10002FE24(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  id v6 = [objc_alloc((Class)NSString) initWithData:v5 encoding:4];
  [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:v7];
}

void sub_10002FEB0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100030030(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000300A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  _Unwind_Resume(a1);
}

void sub_100030274(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_1000302BC(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void sub_1000303FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_100030428(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_1000306BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_100030724(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t sub_100030738(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void sub_100030898(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10003095C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100030B40(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100030C20(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100030DAC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_100030DCC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100030F9C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_100030FE4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void sub_10003109C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  _Unwind_Resume(a1);
}

void sub_100031374(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{
  _Unwind_Resume(a1);
}

uint64_t sub_100031410(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void sub_100031564(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_10003159C(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void sub_10003160C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  _Unwind_Resume(a1);
}

void sub_1000316F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1000319C4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100031B8C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100031CC8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v20);

  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  objc_destroyWeak((id *)(v21 - 56));
  _Unwind_Resume(a1);
}

void sub_100031D04(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v5;
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    id v9 = [WeakRetained _extensionContextForUUID:v7];

    dispatch_time_t v10 = v9;
    intptr_t v11 = [v10 _auxiliaryConnection];

    if (v11)
    {
      uint64_t v12 = [v10 _auxiliaryConnection];
      uint64_t v13 = [v12 remoteObjectProxyWithErrorHandler:&stru_1000A2590];

      uint64_t v14 = *(void *)(a1 + 32);
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_1000320AC;
      v15[3] = &unk_1000A25E0;
      objc_copyWeak(&v16, (id *)(a1 + 48));
      objc_copyWeak(&v17, (id *)(a1 + 40));
      [v13 _gatherPrintersForPrintInfo:v14 reply:v15];
      objc_destroyWeak(&v17);
      objc_destroyWeak(&v16);
    }
    else
    {
      uint64_t v13 = _PKLogCategory(PKLogCategoryDiscovery[0]);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Browse_Extension: Unexpected nil aux connection", buf, 2u);
      }
    }
  }
  else
  {
    dispatch_time_t v10 = _PKLogCategory(PKLogCategoryDiscovery[0]);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412290;
      id v19 = v7;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Browse_Extension: Unexpected context identifier %@", buf, 0xCu);
    }
  }
}

void sub_100031F68(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100031FDC(id a1, NSError *a2)
{
  os_log_t v2 = a2;
  os_log_t v3 = _PKLogCategory(PKLogCategoryDiscovery[0]);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v4 = 138412290;
    id v5 = v2;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Extension connection failed with error: '%@'", (uint8_t *)&v4, 0xCu);
  }
}

void sub_100032094(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000320AC(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    id v6 = [v3 count];

    if (v6)
    {
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472;
      v7[2] = sub_1000321C4;
      double v7[3] = &unk_1000A25B8;
      objc_copyWeak(&v8, (id *)(a1 + 32));
      objc_copyWeak(&v9, (id *)(a1 + 40));
      [v3 enumerateObjectsUsingBlock:v7];
      objc_destroyWeak(&v9);
      objc_destroyWeak(&v8);
    }
  }
}

void sub_100032198(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v3);

  _Unwind_Resume(a1);
}

void sub_1000321C4(uint64_t a1, void *a2)
{
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = [v4 identifier];
  objc_msgSend(WeakRetained, "_addPrinterFromDictionary_anyq:extensionIdentifier:", v6, v5);
}

void sub_100032250(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  uint64_t v13 = v12;

  _Unwind_Resume(a1);
}

void sub_1000323D8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000323F0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = _PKLogCategory(PKLogCategoryDiscovery[0]);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      *(_DWORD *)long long buf = 138412546;
      uint64_t v11 = v8;
      __int16 v12 = 2114;
      id v13 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "PrintKitExtension(%@): error %{public}@", buf, 0x16u);
    }
  }
  else
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    void v9[2] = sub_100032554;
    v9[3] = &unk_1000A2630;
    v9[4] = *(void *)(a1 + 32);
    [v5 enumerateObjectsUsingBlock:v9];
  }
}

void sub_100032534(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100032554(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _PKLogCategory(PKLogCategoryDiscovery[0]);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138412546;
    uint64_t v7 = v5;
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "PrintKitExtension(%@): poking at %@", (uint8_t *)&v6, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 32), "_invokeExtension_anyq:", v3);
}

void sub_100032634(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100032A8C()
{
  JUMPOUT(0x100032AD8);
}

void sub_100032AE0(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  os_log_t v2 = [WeakRetained addEntity];
  v2[2](v2, *(void *)(a1 + 32));
}

void sub_100032B48(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100032E7C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100032ED4(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) failureResponse];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    _DWORD v6[2] = sub_100032FF4;
    v6[3] = &unk_1000A2680;
    uint64_t v5 = *(void *)(a1 + 40);
    id v8 = *(id *)(a1 + 48);
    id v7 = *(id *)(a1 + 32);
    [v3 _authenticatedRequestForRequest:v5 challengeResponse:v4 reply:v6];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void sub_100032FC4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100032FF4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v10 = v3;
  if (v3)
  {
    id v4 = [v3 valueForHTTPHeaderField:@"Authorization"];
    uint64_t v5 = v4;
    if (v4 && ![v4 rangeOfString:@"Bearer "])
    {
      int v6 = [v5 substringFromIndex:objc_msgSend(@"Bearer ", "length")];
      if (v6)
      {
        id v7 = [*(id *)(a1 + 32) protectionSpace];
        [v7 realm];
        OAuth2 = (const void *)_CFURLCredentialCreateOAuth2();

        if (OAuth2)
        {
          id v9 = [objc_alloc((Class)NSURLCredential) _initWithCFURLCredential:OAuth2];
          (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
          CFRelease(OAuth2);

          goto LABEL_6;
        }
      }
    }
    else
    {
      int v6 = 0;
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
LABEL_6:

    goto LABEL_8;
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
LABEL_8:
}

void sub_100033154(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100033280(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000332AC(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v5;
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v8 = [*(id *)(a1 + 32) _extensionContextForUUID:v7];
    id v9 = [v8 _auxiliaryConnection];
    id v10 = v9;
    if (v9)
    {
      uint64_t v11 = [v9 remoteObjectProxyWithErrorHandler:&stru_1000A26C8];
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
    else
    {
      uint64_t v14 = _PKLogCategory(PKLogCategoryDiscovery[0]);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v15) = 0;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Browse_Extension: Unexpected nil aux connection", (uint8_t *)&v15, 2u);
      }

      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
  }
  else
  {
    __int16 v12 = _PKLogCategory(PKLogCategoryNetwork[0]);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = *(void *)(a1 + 32);
      int v15 = 138543618;
      id v16 = v7;
      __int16 v17 = 2114;
      uint64_t v18 = v13;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Unexpected context identifier %{public}@ for extension %{public}@", (uint8_t *)&v15, 0x16u);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void sub_1000334A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000334F4(id a1, NSError *a2)
{
  os_log_t v2 = a2;
  id v3 = _PKLogCategory(PKLogCategoryDiscovery[0]);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v4 = 138412290;
    id v5 = v2;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Extension connection failed with error: '%@'", (uint8_t *)&v4, 0xCu);
  }
}

void sub_1000335AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10003362C(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  id v6 = [objc_alloc((Class)NSString) initWithData:v5 encoding:1];
  [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:v7];
}

void sub_1000336B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

uint64_t sub_1000336DC(void *a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = [a1 _findAttribute0:a2 valueTag:0];
  id v7 = v6;
  if (v6 && objc_msgSend(v6, "num_values")) {
    uint64_t v8 = v5[2](v5, v7);
  }
  else {
    uint64_t v8 = 0;
  }

  return v8;
}

void sub_100033764(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL sub_100033780(id a1, ipp_attribute_t *a2)
{
  os_log_t v2 = [(ipp_attribute_t *)a2 values];
  id v3 = [v2 objectAtIndexedSubscript:0];
  unsigned __int8 v4 = [v3 BOOLean];

  return v4;
}

void sub_1000337D8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

int sub_1000337F4(id a1, ipp_attribute_t *a2)
{
  os_log_t v2 = [(ipp_attribute_t *)a2 values];
  id v3 = [v2 objectAtIndexedSubscript:0];
  int v4 = [v3 integer];

  return v4;
}

void sub_10003384C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t getNamedAttr<PKJobState>(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  unsigned __int8 v5 = sub_1000336DC(v3, (uint64_t)v4, &stru_1000A2770);
  uint64_t v6 = validate_enum<PKJobState,unsigned char>(v5);

  return v6;
}

void sub_1000338CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id getNamedAttr<NSString * {__strong}>(void *a1, uint64_t a2)
{
  os_log_t v2 = sub_100033914(a1, a2, &stru_1000A27B0);

  return v2;
}

id sub_100033914(void *a1, uint64_t a2, void *a3)
{
  unsigned __int8 v5 = a3;
  uint64_t v6 = [a1 _findAttribute0:a2 valueTag:0];
  id v7 = v6;
  if (v6 && objc_msgSend(v6, "num_values"))
  {
    uint64_t v8 = v5[2](v5, v7);
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

void sub_1000339B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

NSString *__cdecl sub_1000339CC(id a1, ipp_attribute_t *a2)
{
  os_log_t v2 = a2;
  id v3 = [(ipp_attribute_t *)v2 values];
  if ([v3 count] != (id)1)
  {
LABEL_7:
    id v7 = 0;
    goto LABEL_8;
  }
  id v4 = [v3 objectAtIndexedSubscript:0];
  id v5 = [v4 string];
  id v7 = v6;

  if (v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v8 = _PKLogCategory(PKLogCategoryFramework);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)id v10 = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "attribute value expected to be a string", v10, 2u);
      }

      goto LABEL_7;
    }
  }
LABEL_8:

  return (NSString *)v7;
}

void sub_100033AD4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id getNamedAttr<NSURL * {__strong}>(void *a1, uint64_t a2)
{
  os_log_t v2 = getNamedAttr<NSString * {__strong}>(a1, a2);
  if (v2)
  {
    id v3 = +[NSURL URLWithString:v2];
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

void sub_100033B78(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id getNamedAttr<NSArray<NSString *> * {__strong}>(void *a1, uint64_t a2)
{
  os_log_t v2 = sub_100033914(a1, a2, &stru_1000A27F0);

  return v2;
}

NSMutableArray *__cdecl sub_100033BBC(id a1, ipp_attribute_t *a2)
{
  os_log_t v2 = a2;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100033C9C;
  v5[3] = &unk_1000A2818;
  id v3 = (id)objc_opt_new();
  id v6 = v3;
  [(ipp_attribute_t *)v2 enumerateValues:v5];

  return (NSMutableArray *)v3;
}

void sub_100033C78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_100033C9C(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = *(void **)(a1 + 32);
  id v9 = v4;
  id v6 = [v4 string];
  uint64_t v8 = v7;
  [v5 addObject:v7];
}

void sub_100033D0C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

id getNamedAttr<NSArray<NSNumber *> * {__strong}>(void *a1, uint64_t a2)
{
  os_log_t v2 = sub_100033914(a1, a2, &stru_1000A2838);

  return v2;
}

NSMutableArray *__cdecl sub_100033D64(id a1, ipp_attribute_t *a2)
{
  os_log_t v2 = a2;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100033E44;
  v5[3] = &unk_1000A2818;
  id v3 = (id)objc_opt_new();
  id v6 = v3;
  [(ipp_attribute_t *)v2 enumerateValues:v5];

  return (NSMutableArray *)v3;
}

void sub_100033E20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_100033E44(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = *(void **)(a1 + 32);
  id v7 = v4;
  id v6 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (int)[v4 integer]);
  [v5 addObject:v6];
}

void sub_100033EBC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

id getNamedAttr<NSArray<ipp_collection_t *> * {__strong}>(void *a1, void *a2)
{
  id v3 = a1;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100033FDC;
  v8[3] = &unk_1000A2888;
  id v9 = a2;
  id v10 = v3;
  id v4 = v3;
  id v5 = v9;
  id v6 = sub_100033914(v4, (uint64_t)v5, v8);

  return v6;
}

void sub_100033FB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

id sub_100033FDC(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  id v9 = _NSConcreteStackBlock;
  uint64_t v10 = 3221225472;
  uint64_t v11 = sub_1000341B4;
  __int16 v12 = &unk_1000A2860;
  uint64_t v14 = &v15;
  id v4 = (id)objc_opt_new();
  id v13 = v4;
  [v3 enumerateValues:&v9];
  if (*((unsigned char *)v16 + 24) && objc_msgSend(v4, "count", v9, v10, v11, v12))
  {
    id v5 = _PKLogCategory(PKLogCategoryDefault[0]);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      uint64_t v7 = *(void *)(a1 + 40);
      *(_DWORD *)long long buf = 138412546;
      uint64_t v20 = v6;
      __int16 v21 = 2112;
      uint64_t v22 = v7;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Expected ipp record with empty collection value to be completely empty for %@ (%@)", buf, 0x16u);
    }
  }
  _Block_object_dispose(&v15, 8);

  return v4;
}

void sub_100034174(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, uint64_t a7, ...)
{
  va_start(va, a7);

  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000341B4(uint64_t a1, uint64_t a2, void *a3)
{
  id v7 = a3;
  id v4 = [v7 collection];

  if (v4)
  {
    id v5 = *(void **)(a1 + 32);
    uint64_t v6 = [v7 collection];
    [v5 addObject:v6];
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
}

void sub_100034244(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void Printd_Parameters::_set_PrinterURI(void **this, NSURL *a2)
{
  id v3 = a2;
  id v4 = *this;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  _DWORD v6[2] = sub_100034314;
  v6[3] = &unk_1000A28B0;
  id v7 = v3;
  id v5 = v3;
  [v4 _withGroupingBehavior:v6];
}

void sub_1000342FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_100034314(uint64_t a1, void *a2)
{
}

void sub_10003432C(void *a1, uint64_t a2, void *a3, void *a4)
{
  id v7 = a1;
  id v8 = a3;
  id v9 = [a4 absoluteString];
  if (v9)
  {
    [v7 _addString:a2 valueTag:69 name:v8 lang:0 value:v9];
  }
  else
  {
    uint64_t v10 = _PKLogCategory(PKLogCategoryFramework);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v11 = 138412290;
      id v12 = v8;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "IPP url badly formed for attribute name '%@'", (uint8_t *)&v11, 0xCu);
    }
  }
}

void sub_10003443C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id Printd_Parameters::_set_AttributeFidelity(void **this, char a2)
{
  os_log_t v2 = *this;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000344D8;
  v4[3] = &unk_1000A28D0;
  char v5 = a2;
  return [v2 _withGroupingBehavior:v4];
}

id sub_1000344D8(uint64_t a1, void *a2)
{
  return [a2 _addBoolean:1 name:@"ipp-attribute-fidelity" value:*(unsigned __int8 *)(a1 + 32)];
}

void Printd_Parameters::_set_JobPasswordEncryption(void **this, NSString *a2)
{
  id v3 = a2;
  id v4 = *this;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  _DWORD v6[2] = sub_1000345A0;
  v6[3] = &unk_1000A28B0;
  id v7 = v3;
  char v5 = v3;
  [v4 _withGroupingBehavior:v6];
}

void sub_100034588(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1000345A0(uint64_t a1, void *a2)
{
}

void sub_1000345BC(void *a1, uint64_t a2, uint64_t a3, void *a4, void *a5)
{
  id v11 = a1;
  id v9 = a4;
  uint64_t v10 = a5;
  if (a3 == 257) {
    a3 = canonicalizeTypeTagForNameAndStringValue(v9, v10);
  }
  [v11 _addString:a2 valueTag:a3 name:v9 lang:0 value:v10];
}

void sub_100034660(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void Printd_Parameters::_set_RequestedAttributes(void **a1, void *a2)
{
  id v3 = a2;
  id v4 = *a1;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  _DWORD v6[2] = sub_10003472C;
  v6[3] = &unk_1000A28B0;
  id v7 = v3;
  id v5 = v3;
  [v4 _withGroupingBehavior:v6];
}

void sub_100034714(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

id sub_10003472C(uint64_t a1, void *a2)
{
  return [a2 _addStrings:1 valueTag:68 name:@"requested-attributes" lang:0 values:*(void *)(a1 + 32)];
}

void Printd_Parameters::_set_RequestingUserName(void **this, NSString *a2)
{
  id v3 = a2;
  id v4 = *this;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  _DWORD v6[2] = sub_1000347FC;
  v6[3] = &unk_1000A28B0;
  id v7 = v3;
  id v5 = v3;
  [v4 _withGroupingBehavior:v6];
}

void sub_1000347E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1000347FC(uint64_t a1, void *a2)
{
}

void Printd_Parameters::_del_RequestingUserName(id *this)
{
  id v2 = [*this _findAttribute0:@"requesting-user-name" valueTag:66];
  if (v2) {
    [*this _deleteAttribute:v2];
  }
}

void sub_100034884(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void Printd_Parameters::_set_DocumentPassword(void **this, NSData *a2)
{
  id v3 = a2;
  id v4 = *this;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  _DWORD v6[2] = sub_100034948;
  v6[3] = &unk_1000A28B0;
  id v7 = v3;
  id v5 = v3;
  [v4 _withGroupingBehavior:v6];
}

void sub_100034930(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_100034948(uint64_t a1, void *a2)
{
}

void sub_100034960(void *a1, uint64_t a2, void *a3, void *a4)
{
  id v9 = a1;
  id v7 = a3;
  id v8 = a4;
  objc_msgSend(v9, "_addOctetString:name:data:length:", a2, v7, objc_msgSend(v8, "bytes"), objc_msgSend(v8, "length"));
}

void sub_1000349F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

id Printd_Parameters::_set_MyJobsOnly(void **this, char a2)
{
  id v2 = *this;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100034A84;
  v4[3] = &unk_1000A28D0;
  char v5 = a2;
  return [v2 _withGroupingBehavior:v4];
}

id sub_100034A84(uint64_t a1, void *a2)
{
  return [a2 _addBoolean:1 name:@"my-jobs" value:*(unsigned __int8 *)(a1 + 32)];
}

void Printd_Parameters::_set_WhichJobs(void **this, NSString *a2)
{
  id v3 = a2;
  id v4 = *this;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  _DWORD v6[2] = sub_100034B4C;
  v6[3] = &unk_1000A28B0;
  id v7 = v3;
  char v5 = v3;
  [v4 _withGroupingBehavior:v6];
}

void sub_100034B34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_100034B4C(uint64_t a1, void *a2)
{
}

void Printd_Parameters::_set_JobAccountingUserID(void **this, NSString *a2)
{
  id v3 = a2;
  id v4 = *this;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  _DWORD v6[2] = sub_100034C18;
  v6[3] = &unk_1000A28B0;
  id v7 = v3;
  char v5 = v3;
  [v4 _withGroupingBehavior:v6];
}

void sub_100034C00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_100034C18(uint64_t a1, void *a2)
{
}

id Printd_Parameters::_set_LastDocument(void **this, char a2)
{
  id v2 = *this;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100034CA4;
  v4[3] = &unk_1000A28D0;
  char v5 = a2;
  return [v2 _withGroupingBehavior:v4];
}

id sub_100034CA4(uint64_t a1, void *a2)
{
  return [a2 _addBoolean:1 name:@"last-document" value:*(unsigned __int8 *)(a1 + 32)];
}

void Printd_Parameters::_set_FinishingsCol(void **this, ipp_collection_t *a2)
{
  id v3 = a2;
  id v4 = *this;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  _DWORD v6[2] = sub_100034D6C;
  v6[3] = &unk_1000A28B0;
  id v7 = v3;
  char v5 = v3;
  [v4 _withGroupingBehavior:v6];
}

void sub_100034D54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

id sub_100034D6C(uint64_t a1, void *a2)
{
  return [a2 _addCollection:2 name:@"finishings-col" value:*(void *)(a1 + 32)];
}

void Printd_Parameters::_set_MediaCol(void **this, PKMediaCol *a2)
{
  id v3 = a2;
  id v4 = *this;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  _DWORD v6[2] = sub_100034E34;
  v6[3] = &unk_1000A28B0;
  id v7 = v3;
  char v5 = v3;
  [v4 _withGroupingBehavior:v6];
}

void sub_100034E1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_100034E34(uint64_t a1, void *a2)
{
}

void sub_100034E4C(void *a1, uint64_t a2, void *a3, void *a4)
{
  id v9 = a1;
  id v7 = a3;
  id v8 = [a4 collection];
  [v9 _addCollection:a2 name:v7 value:v8];
}

void sub_100034ED4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void Printd_Parameters::_set_Finishings(void **a1, void *a2)
{
  id v3 = a2;
  id v4 = *a1;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  _DWORD v6[2] = sub_100034FA8;
  v6[3] = &unk_1000A28B0;
  id v7 = v3;
  id v5 = v3;
  [v4 _withGroupingBehavior:v6];
}

void sub_100034F90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_100034FA8(uint64_t a1, void *a2)
{
}

void sub_100034FC4(void *a1, uint64_t a2, uint64_t a3, void *a4, void *a5)
{
  id v9 = a1;
  id v10 = a4;
  id v11 = a5;
  id v12 = [v11 count];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100038450;
  v14[3] = &unk_1000A2918;
  id v13 = v11;
  id v15 = v13;
  [v9 _addIntegers:a2 valueTag:a3 name:v10 count:v12 adder:v14];
}

void sub_1000350B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

BOOL Printd_Parameters::_has_JobState(id *this)
{
  return [*this _findAttribute0:@"job-state" valueTag:35] != 0;
}

uint64_t Printd_Parameters::_get_JobState(void **this)
{
  return getNamedAttr<PKJobState>(*this, @"job-state");
}

id Printd_Parameters::_set_OrientationRequested(void **this, ipp_orient_e a2)
{
  id v2 = *this;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100035288;
  v4[3] = &unk_1000A28F0;
  ipp_orient_e v5 = a2;
  return [v2 _withGroupingBehavior:v4];
}

id sub_100035288(uint64_t a1, void *a2)
{
  return [a2 _addInteger:2 valueTag:35 name:@"orientation-requested" value:*(unsigned int *)(a1 + 32)];
}

id Printd_Parameters::_set_PrintQuality(void **this, ipp_quality_e a2)
{
  id v2 = *this;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100035314;
  v4[3] = &unk_1000A28F0;
  ipp_quality_e v5 = a2;
  return [v2 _withGroupingBehavior:v4];
}

id sub_100035314(uint64_t a1, void *a2)
{
  return [a2 _addInteger:2 valueTag:35 name:@"print-quality" value:*(unsigned int *)(a1 + 32)];
}

id Printd_Parameters::_set_JobPagesPerSet(void **this, int a2)
{
  id v2 = *this;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000353A0;
  v4[3] = &unk_1000A28F0;
  int v5 = a2;
  return [v2 _withGroupingBehavior:v4];
}

id sub_1000353A0(uint64_t a1, void *a2)
{
  return [a2 _addInteger:2 valueTag:33 name:@"job-pages-per-set" value:*(unsigned int *)(a1 + 32)];
}

id Printd_Parameters::_set_Copies(void **this, int a2)
{
  id v2 = *this;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10003542C;
  v4[3] = &unk_1000A28F0;
  int v5 = a2;
  return [v2 _withGroupingBehavior:v4];
}

id sub_10003542C(uint64_t a1, void *a2)
{
  return [a2 _addInteger:2 valueTag:33 name:@"copies" value:*(unsigned int *)(a1 + 32)];
}

BOOL Printd_Parameters::_has_JobImpressionsCompleted(id *this)
{
  return [*this _findAttribute0:@"job-impressions-completed" valueTag:33] != 0;
}

uint64_t Printd_Parameters::_get_JobImpressionsCompleted(void **this)
{
  return sub_1000336DC(*this, @"job-impressions-completed", &stru_1000A2770);
}

BOOL Printd_Parameters::_has_JobMediaSheetsCompleted(id *this)
{
  return [*this _findAttribute0:@"job-media-sheets-completed" valueTag:33] != 0;
}

uint64_t Printd_Parameters::_get_JobMediaSheetsCompleted(void **this)
{
  return sub_1000336DC(*this, @"job-media-sheets-completed", &stru_1000A2770);
}

id Printd_Parameters::_get_JobStateReasons(void **this)
{
  os_log_t v1 = getNamedAttr<NSArray<NSString *> * {__strong}>(*this, @"job-state-reasons");

  return v1;
}

void Printd_Parameters::_set_MultipleDocumentHandling(void **this, NSString *a2)
{
  id v3 = a2;
  id v4 = *this;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  _DWORD v6[2] = sub_1000358AC;
  v6[3] = &unk_1000A28B0;
  id v7 = v3;
  int v5 = v3;
  [v4 _withGroupingBehavior:v6];
}

void sub_100035894(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1000358AC(uint64_t a1, void *a2)
{
}

void Printd_Parameters::_set_OutputBin(void **this, NSString *a2)
{
  id v3 = a2;
  id v4 = *this;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  _DWORD v6[2] = sub_100035978;
  v6[3] = &unk_1000A28B0;
  id v7 = v3;
  int v5 = v3;
  [v4 _withGroupingBehavior:v6];
}

void sub_100035960(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_100035978(uint64_t a1, void *a2)
{
}

void Printd_Parameters::_set_OutputMode(void **this, NSString *a2)
{
  id v3 = a2;
  id v4 = *this;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  _DWORD v6[2] = sub_100035A44;
  v6[3] = &unk_1000A28B0;
  id v7 = v3;
  int v5 = v3;
  [v4 _withGroupingBehavior:v6];
}

void sub_100035A2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_100035A44(uint64_t a1, void *a2)
{
}

void Printd_Parameters::_set_PrintColorMode(void **this, NSString *a2)
{
  id v3 = a2;
  id v4 = *this;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  _DWORD v6[2] = sub_100035B10;
  v6[3] = &unk_1000A28B0;
  id v7 = v3;
  int v5 = v3;
  [v4 _withGroupingBehavior:v6];
}

void sub_100035AF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_100035B10(uint64_t a1, void *a2)
{
}

void Printd_Parameters::_set_PrintScaling(void **this, NSString *a2)
{
  id v3 = a2;
  id v4 = *this;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  _DWORD v6[2] = sub_100035BDC;
  v6[3] = &unk_1000A28B0;
  id v7 = v3;
  int v5 = v3;
  [v4 _withGroupingBehavior:v6];
}

void sub_100035BC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_100035BDC(uint64_t a1, void *a2)
{
}

id Printd_Parameters::_find_Sides(id *this)
{
  return [*this _findAttribute0:@"sides" valueTag:68];
}

void Printd_Parameters::_set_Sides(void **this, NSString *a2)
{
  id v3 = a2;
  id v4 = *this;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  _DWORD v6[2] = sub_100035CBC;
  v6[3] = &unk_1000A28B0;
  id v7 = v3;
  int v5 = v3;
  [v4 _withGroupingBehavior:v6];
}

void sub_100035CA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_100035CBC(uint64_t a1, void *a2)
{
}

void Printd_Parameters::_set_Media(void **this, NSString *a2)
{
  id v3 = a2;
  id v4 = *this;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  _DWORD v6[2] = sub_100035D88;
  v6[3] = &unk_1000A28B0;
  id v7 = v3;
  int v5 = v3;
  [v4 _withGroupingBehavior:v6];
}

void sub_100035D70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_100035D88(uint64_t a1, void *a2)
{
}

void Printd_Parameters::_set_JobAccountID(void **this, NSString *a2)
{
  id v3 = a2;
  id v4 = *this;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  _DWORD v6[2] = sub_100035E54;
  v6[3] = &unk_1000A28B0;
  id v7 = v3;
  int v5 = v3;
  [v4 _withGroupingBehavior:v6];
}

void sub_100035E3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_100035E54(uint64_t a1, void *a2)
{
}

BOOL Printd_Parameters::_has_DestinationJobID(id *this)
{
  return [*this _findAttribute0:@"job-id" valueTag:33] != 0;
}

id Printd_Parameters::_set_DestinationJobID(void **this, int a2)
{
  id v2 = *this;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100035F10;
  v4[3] = &unk_1000A28F0;
  int v5 = a2;
  return [v2 _withGroupingBehavior:v4];
}

id sub_100035F10(uint64_t a1, void *a2)
{
  return [a2 _addInteger:1 valueTag:33 name:@"job-id" value:*(unsigned int *)(a1 + 32)];
}

uint64_t Printd_Parameters::_get_DestinationJobID(void **this)
{
  return sub_1000336DC(*this, @"job-id", &stru_1000A2770);
}

void Printd_Parameters::_set_JobPassword(void **this, NSData *a2)
{
  id v3 = a2;
  id v4 = *this;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  _DWORD v6[2] = sub_1000360F4;
  v6[3] = &unk_1000A28B0;
  id v7 = v3;
  int v5 = v3;
  [v4 _withGroupingBehavior:v6];
}

void sub_1000360DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1000360F4(uint64_t a1, void *a2)
{
}

void Printd_Parameters::_set_DocumentFormat(void **this, NSString *a2)
{
  id v3 = a2;
  id v4 = *this;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  _DWORD v6[2] = sub_1000361BC;
  v6[3] = &unk_1000A28B0;
  id v7 = v3;
  int v5 = v3;
  [v4 _withGroupingBehavior:v6];
}

void sub_1000361A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1000361BC(uint64_t a1, void *a2)
{
}

void Printd_Parameters::_set_JobName(void **this, NSString *a2)
{
  id v3 = a2;
  id v4 = *this;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  _DWORD v6[2] = sub_100036288;
  v6[3] = &unk_1000A28B0;
  id v7 = v3;
  int v5 = v3;
  [v4 _withGroupingBehavior:v6];
}

void sub_100036270(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_100036288(uint64_t a1, void *a2)
{
}

id Printd_Parameters::_get_JobName(void **this)
{
  os_log_t v1 = getNamedAttr<NSString * {__strong}>(*this, @"job-name");

  return v1;
}

id Printd_Parameters::_set_PrinterID(void **this, int a2)
{
  id v2 = *this;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100036438;
  v4[3] = &unk_1000A28F0;
  int v5 = a2;
  return [v2 _withGroupingBehavior:v4];
}

id sub_100036438(uint64_t a1, void *a2)
{
  return [a2 _addInteger:1 valueTag:33 name:@"printer-id" value:*(unsigned int *)(a1 + 32)];
}

void Printd_Parameters::_set_Message(void **this, NSString *a2)
{
  id v3 = a2;
  id v4 = *this;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  _DWORD v6[2] = sub_100036504;
  v6[3] = &unk_1000A28B0;
  id v7 = v3;
  int v5 = v3;
  [v4 _withGroupingBehavior:v6];
}

void sub_1000364EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_100036504(uint64_t a1, void *a2)
{
}

void Printd_Parameters::_set_IdentifyActions(void **a1, void *a2)
{
  id v3 = a2;
  id v4 = *a1;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  _DWORD v6[2] = sub_1000365D0;
  v6[3] = &unk_1000A28B0;
  id v7 = v3;
  id v5 = v3;
  [v4 _withGroupingBehavior:v6];
}

void sub_1000365B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

id sub_1000365D0(uint64_t a1, void *a2)
{
  return [a2 _addStrings:1 valueTag:68 name:@"identify-actions" lang:0 values:*(void *)(a1 + 32)];
}

void Printd_Parameters::_set_JobAuthorizationURI(void **this, NSString *a2)
{
  id v3 = a2;
  id v4 = *this;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  _DWORD v6[2] = sub_1000366A0;
  v6[3] = &unk_1000A28B0;
  id v7 = v3;
  id v5 = v3;
  [v4 _withGroupingBehavior:v6];
}

void sub_100036688(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1000366A0(uint64_t a1, void *a2)
{
}

id Printd_Parameters::_get_JobAuthorizationURI(void **this)
{
  os_log_t v1 = getNamedAttr<NSString * {__strong}>(*this, @"job-authorization-uri");

  return v1;
}

void Printd_Parameters::_set_Compression(void **this, NSString *a2)
{
  id v3 = a2;
  id v4 = *this;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  _DWORD v6[2] = sub_100036890;
  v6[3] = &unk_1000A28B0;
  id v7 = v3;
  id v5 = v3;
  [v4 _withGroupingBehavior:v6];
}

void sub_100036878(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_100036890(uint64_t a1, void *a2)
{
}

BOOL Printd_Parameters::_has_PrinterIsAcceptingJobs(id *this)
{
  return [*this _findAttribute0:@"printer-is-accepting-jobs" valueTag:34] != 0;
}

uint64_t Printd_Parameters::_get_PrinterIsAcceptingJobs(void **this)
{
  return sub_1000336DC(*this, @"printer-is-accepting-jobs", &stru_1000A2730);
}

id Printd_Parameters::_get_PrinterKind(void **this)
{
  os_log_t v1 = getNamedAttr<NSArray<NSString *> * {__strong}>(*this, @"printer-kind");

  return v1;
}

id Printd_Parameters::_get_PrinterStateReasons(void **this)
{
  os_log_t v1 = getNamedAttr<NSArray<NSString *> * {__strong}>(*this, @"printer-state-reasons");

  return v1;
}

double sub_100036C3C(uint64_t a1, uint64_t a2)
{
  double result = *(double *)(a2 + 32);
  *(double *)(a1 + 32) = result;
  return result;
}

id Printd_Parameters::_get_PrinterLocation(void **this)
{
  os_log_t v1 = getNamedAttr<NSString * {__strong}>(*this, @"printer-location");

  return v1;
}

id Printd_Parameters::_get_PrinterMakeAndModel(void **this)
{
  os_log_t v1 = getNamedAttr<NSString * {__strong}>(*this, @"printer-make-and-model");

  return v1;
}

id Printd_Parameters::_get_PrinterStateMessage(void **this)
{
  os_log_t v1 = getNamedAttr<NSString * {__strong}>(*this, @"printer-state-message");

  return v1;
}

BOOL Printd_Parameters::_has_PrinterStringsURI(id *this)
{
  return [*this _findAttribute0:@"printer-strings-uri" valueTag:69] != 0;
}

id Printd_Parameters::_get_PrinterStringsURI(void **this)
{
  os_log_t v1 = getNamedAttr<NSURL * {__strong}>(*this, @"printer-strings-uri");

  return v1;
}

id Printd_Parameters::_get_PrinterMoreInfo(void **this)
{
  os_log_t v1 = getNamedAttr<NSURL * {__strong}>(*this, @"printer-more-info");

  return v1;
}

id Printd_Parameters::_get_OperationsSupported(void **this)
{
  os_log_t v1 = getNamedAttr<NSArray<NSNumber *> * {__strong}>(*this, @"operations-supported");

  return v1;
}

id Printd_Parameters::_get_CompressionSupported(void **this)
{
  os_log_t v1 = getNamedAttr<NSArray<NSString *> * {__strong}>(*this, @"compression-supported");

  return v1;
}

id Printd_Parameters::_get_JobPresetsSupported(void **this)
{
  os_log_t v1 = getNamedAttr<NSArray<ipp_collection_t *> * {__strong}>(*this, @"job-presets-supported");

  return v1;
}

id Printd_Parameters::_get_DocumentFormatSupported(void **this)
{
  os_log_t v1 = getNamedAttr<NSArray<NSString *> * {__strong}>(*this, @"document-format-supported");

  return v1;
}

BOOL Printd_Parameters::_has_PrintColorModeSupported(id *this)
{
  return [*this _findAttribute0:@"print-color-mode-supported" valueTag:68] != 0;
}

id Printd_Parameters::_get_PrintColorModeSupported(void **this)
{
  os_log_t v1 = getNamedAttr<NSArray<NSString *> * {__strong}>(*this, @"print-color-mode-supported");

  return v1;
}

id Printd_Parameters::_get_SidesSupported(void **this)
{
  os_log_t v1 = getNamedAttr<NSArray<NSString *> * {__strong}>(*this, @"sides-supported");

  return v1;
}

id Printd_Parameters::_get_URFSupported(void **this)
{
  os_log_t v1 = getNamedAttr<NSArray<NSString *> * {__strong}>(*this, @"urf-supported");

  return v1;
}

BOOL Printd_Parameters::_has_OutputModeSupported(id *this)
{
  return [*this _findAttribute0:@"output-mode-supported" valueTag:68] != 0;
}

id Printd_Parameters::_get_OutputModeSupported(void **this)
{
  os_log_t v1 = getNamedAttr<NSArray<NSString *> * {__strong}>(*this, @"output-mode-supported");

  return v1;
}

id Printd_Parameters::_get_PrinterUUID(void **this)
{
  os_log_t v1 = getNamedAttr<NSURL * {__strong}>(*this, @"printer-uuid");

  return v1;
}

id Printd_Parameters::_get_PrinterDNS_SD_Name(void **this)
{
  os_log_t v1 = getNamedAttr<NSString * {__strong}>(*this, @"printer-dns-sd-name");

  return v1;
}

id Printd_Parameters::_get_URIAuthenticationSupported(void **this)
{
  os_log_t v1 = getNamedAttr<NSArray<NSString *> * {__strong}>(*this, @"uri-authentication-supported");

  return v1;
}

id Printd_Parameters::_get_PrinterURISupported(void **this)
{
  os_log_t v1 = getNamedAttr<NSURL * {__strong}>(*this, @"printer-uri-supported");

  return v1;
}

void Real_IPP_Message::_Response::_multiResponse(id *a1, void *a2)
{
  char v18 = a2;
  id v3 = sub_100038314(a1);
  id v4 = +[PKIPP makeEmptyResponse];
  objc_msgSend(v4, "setState:", objc_msgSend(v3, "state"));
  objc_msgSend(v4, "setOp_or_status:", objc_msgSend(v3, "op_or_status"));
  for (unint64_t i = 0; ; ++i)
  {
    uint64_t v6 = [v3 attrs];
    id v7 = [v6 count];

    if (i >= (unint64_t)v7) {
      break;
    }
    id v8 = [v3 attrs];
    id v9 = [v8 objectAtIndexedSubscript:i];

    if (objc_msgSend(v9, "group_tag"))
    {
      id v10 = [v4 attrs];
      for (unint64_t j = 0; ; ++j)
      {
        if (j >= (unint64_t)[v10 count])
        {
          id v16 = [v4 attrs];
          [v16 addObject:v9];
          goto LABEL_11;
        }
        id v12 = [v10 objectAtIndexedSubscript:j];
        id v13 = [v12 name];
        uint64_t v14 = [v9 name];
        unsigned __int8 v15 = [v13 isEqualToString:v14];

        if (v15) {
          break;
        }
      }
      id v16 = [v4 attrs];
      [v16 replaceObjectAtIndex:j withObject:v9];
LABEL_11:
    }
    else
    {
      id v19 = v4;
      v18[2](v18, &v19);
    }
  }
  id v17 = v4;
  id v19 = v17;
  v18[2](v18, &v19);
}

void sub_100038260(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12)
{
  _Unwind_Resume(a1);
}

id sub_100038314(id *a1)
{
  return *a1;
}

uint64_t canonicalizeTypeTagForNameAndStringValue(NSString *a1, NSString *a2)
{
  id v3 = a1;
  id v4 = a2;
  if ([(NSString *)v3 isEqualToString:IPPNomenclature::keyMedia])
  {
    id v5 = pwgCanonicalName(v4);
    if (v5) {
      uint64_t v6 = 68;
    }
    else {
      uint64_t v6 = 66;
    }
  }
  else
  {
    id v7 = _PKLogCategory(PKLogCategoryDefault[0]);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412290;
      id v10 = v3;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "ERROR: name %@ has no canonicalization mapping", (uint8_t *)&v9, 0xCu);
    }

    uint64_t v6 = 0;
  }

  return v6;
}

void sub_10003842C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_100038450(uint64_t a1, uint64_t a2)
{
  id v2 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a2];
  id v3 = [v2 integerValue];

  return v3;
}

void sub_100038490(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100038650(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100038780(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)NANBrowse_Entity;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_10003887C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100038994(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100038A9C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100038B64(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  uint64_t v14 = v13;

  _Unwind_Resume(a1);
}

void sub_100038EC4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  _Unwind_Resume(a1);
}

void sub_100038F64(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = _PKLogCategory(PKLogCategoryDiscovery[0]);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    *(_DWORD *)long long buf = 138412802;
    id v16 = v5;
    __int16 v17 = 2112;
    uint64_t v18 = v8;
    __int16 v19 = 2112;
    id v20 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "NAN Resolution result for %@ from %@ txt %@", buf, 0x20u);
  }

  if (v6)
  {
    int v9 = *(NSObject **)(a1 + 40);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100039120;
    v10[3] = &unk_1000A2940;
    objc_copyWeak(&v14, (id *)(a1 + 56));
    id v11 = v5;
    id v12 = v6;
    id v13 = *(id *)(a1 + 48);
    dispatch_async(v9, v10);

    objc_destroyWeak(&v14);
  }
}

void sub_100039104(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100039120(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  [WeakRetained _ingestPrinter:*(void *)(a1 + 32) txt:*(void *)(a1 + 40) dataSession:*(void *)(a1 + 48)];
}

void sub_100039174(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100039374(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, uint64_t a16, id location)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_1000393D0(id a1, NSError *a2)
{
  id v2 = a2;
  id v3 = _PKLogCategory(PKLogCategoryDiscovery[0]);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v4 = 138412290;
    id v5 = v2;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "Browse_NAN: Termination error %@", (uint8_t *)&v4, 0xCu);
  }
}

void sub_100039488(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000394A0(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = _PKLogCategory(PKLogCategoryDiscovery[0]);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v7 = 138412546;
    uint64_t v8 = v5;
    __int16 v9 = 2112;
    id v10 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Browse_NAN: Activated %@ with error %@", (uint8_t *)&v7, 0x16u);
  }

  if (!v3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    [WeakRetained activatedConnection:*(void *)(a1 + 32) forEndpoint:*(void *)(a1 + 40)];
  }
}

void sub_100039590(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10003975C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10003977C(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = _PKLogCategory(PKLogCategoryDiscovery[0]);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Browse_NAN: endpoint found %@", (uint8_t *)&v6, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained startDataSession:v3];
}

void sub_100039858(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10003987C(id a1, PKNANEndpoint *a2)
{
  id v2 = a2;
  id v3 = _PKLogCategory(PKLogCategoryDiscovery[0]);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    uint64_t v5 = v2;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Browse_NAN: endpoint lost %@", (uint8_t *)&v4, 0xCu);
  }
}

void sub_100039934(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10003994C(id a1, PKNANEndpoint *a2, unsigned int a3)
{
  int v4 = a2;
  uint64_t v5 = _PKLogCategory(PKLogCategoryDiscovery[0]);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412546;
    id v7 = v4;
    __int16 v8 = 1024;
    unsigned int v9 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Browse_NAN: endpoint changed %@ 0x%x", (uint8_t *)&v6, 0x12u);
  }
}

void sub_100039A1C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100039A38(id a1, NSError *a2)
{
  id v2 = a2;
  id v3 = _PKLogCategory(PKLogCategoryDiscovery[0]);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    int v6 = v2;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Browse_NAN: Activated, error result %@", (uint8_t *)&v5, 0xCu);
  }

  if (v2)
  {
    int v4 = _PKLogCategory(PKLogCategoryDiscovery[0]);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v5 = 138412290;
      int v6 = v2;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "Browse_NAN: check wifip2p preferences dump=true: %@", (uint8_t *)&v5, 0xCu);
    }
  }
}

void sub_100039B50(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100039C54(id a1)
{
  uint64_t v1 = objc_opt_new();
  id v2 = (void *)qword_1000C8B10;
  qword_1000C8B10 = v1;
}

void sub_100039D34(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100039F20(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10003A040(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10003A344(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10003A3B8(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10003A488;
  v4[3] = &unk_1000A04F0;
  objc_copyWeak(&v6, (id *)(a1 + 48));
  id v5 = *(id *)(a1 + 32);
  [v2 resolveOnQueue:v3 completionHandler:v4];

  objc_destroyWeak(&v6);
}

void sub_10003A46C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  objc_destroyWeak(v13);
  _Unwind_Resume(a1);
}

void sub_10003A488(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _entityResolved:*(void *)(a1 + 32)];
}

void sub_10003A4D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10003A638(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10003A848(_Unwind_Exception *a1)
{
  id v6 = v5;

  _Unwind_Resume(a1);
}

void sub_10003A958(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10003AB14(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, uint64_t a16, id location)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_10003AB58(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = _PKLogCategory(PKLogCategoryDiscovery[0]);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    int v8 = 138412546;
    id v9 = WeakRetained;
    __int16 v10 = 2112;
    id v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Resolution result for %@ %@", (uint8_t *)&v8, 0x16u);
  }
  if (v4)
  {
    id v7 = objc_loadWeakRetained((id *)(a1 + 48));
    [v7 _ingestPrinterAttributes:v4];
  }
  dispatch_async(*(dispatch_queue_t *)(a1 + 32), *(dispatch_block_t *)(a1 + 40));
}

void sub_10003AC5C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10003ADA4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10003B2F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, void *a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34)
{
  sub_10003B8E4(&a34);
  _Block_object_dispose((const void *)(v40 - 192), 8);

  _Unwind_Resume(a1);
}

Class sub_10003B4C4()
{
  if (qword_1000C8B30 != -1) {
    dispatch_once(&qword_1000C8B30, &stru_1000A2B48);
  }
  Class result = objc_getClass("WPDeviceScanner");
  qword_1000C8B20 = (uint64_t)result;
  off_1000C8738 = (uint64_t (*)())sub_10003B528;
  return result;
}

id sub_10003B528()
{
  return (id)qword_1000C8B20;
}

void sub_10003B534(id a1)
{
  qword_1000C8B28 = (uint64_t)dlopen("/System/Library/PrivateFrameworks/WirelessProximity.framework/WirelessProximity", 2);
  if (!qword_1000C8B28) {
    NSLog(@"### Failed to Soft Linked: /System/Library/PrivateFrameworks/WirelessProximity.framework/WirelessProximity");
  }
}

id sub_10003B570(uint64_t a1)
{
  if ((*(unsigned char *)a1 & 0x20) != 0)
  {
    long long v4 = *(_OWORD *)(a1 + 5);
    int v2 = 30;
  }
  else
  {
    if ((*(unsigned char *)a1 & 0x10) == 0)
    {
      uint64_t v1 = 0;
      goto LABEL_7;
    }
    LODWORD(v4) = *(_DWORD *)(a1 + 5);
    int v2 = 2;
  }
  inet_ntop(v2, &v4, v5, 0x400u);
  uint64_t v1 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v5, (void)v4);
LABEL_7:

  return v1;
}

uint64_t sub_10003B62C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10003B63C(uint64_t a1)
{
}

void sub_10003B644(uint64_t a1, void *a2, unsigned char *a3)
{
  id v17 = a2;
  if (objc_msgSend(v17, "group_tag") != 4) {
    goto LABEL_15;
  }
  id v5 = [v17 name];
  if ([v5 compare:@"printer-uri-supported"])
  {
  }
  else
  {
    unsigned int v6 = objc_msgSend(v17, "value_tag");

    if (v6 == 69)
    {
      uint64_t v7 = *(void *)(a1 + 32);
LABEL_9:
      __int16 v10 = (void **)(*(void *)(v7 + 8) + 40);
      id v11 = v17;
      int v8 = *v10;
      *__int16 v10 = v11;
      goto LABEL_10;
    }
  }
  int v8 = [v17 name];
  if ([v8 compare:@"printer-id"])
  {
LABEL_10:

    goto LABEL_11;
  }
  unsigned int v9 = objc_msgSend(v17, "value_tag");

  if (v9 == 33)
  {
    uint64_t v7 = *(void *)(a1 + 40);
    goto LABEL_9;
  }
LABEL_11:
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40))
  {
    id v12 = *(ipp_attribute_t **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    if (v12)
    {
      if (ippGetIXInteger(v12, 0) == *(_DWORD *)(a1 + 56))
      {
        id v13 = ippGetIXString(*(ipp_attribute_t **)(*(void *)(*(void *)(a1 + 32) + 8) + 40), 0);
        uint64_t v14 = PKURLWithString(v13);
        uint64_t v15 = *(void *)(*(void *)(a1 + 48) + 8);
        id v16 = *(void **)(v15 + 40);
        *(void *)(v15 + 40) = v14;

        *a3 = 1;
      }
    }
  }
LABEL_15:
}

void sub_10003B7B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10003B7EC(void *a1, unsigned __int16 a2, void *a3)
{
  *sub_100014A3C(a1, a2, a3) = off_1000A2BF0;
  operator new();
}

void sub_10003B85C(_Unwind_Exception *a1)
{
  sub_10000F138(v1);
  _Unwind_Resume(a1);
}

void sub_10003B870(void *a1)
{
  sub_10003B8E4(a1);

  operator delete();
}

void sub_10003B8AC(void *a1)
{
  sub_10003B8E4(a1);

  operator delete();
}

uint64_t sub_10003B8E4(void *a1)
{
  *a1 = off_1000A2BF0;
  uint64_t v1 = (id *)a1[3];
  if (v1)
  {

    operator delete();
  }
  int v2 = (id *)a1[4];
  if (v2)
  {

    operator delete();
  }

  return sub_10000F138((uint64_t)a1);
}

uint64_t urfWriteLine(uint64_t a1, void *__src, int a3, int a4, int a5)
{
  uint64_t result = 0;
  if (a1 && a3 >= 1 && a4 >= 1)
  {
    unsigned int v8 = *(_DWORD *)(a1 + 80);
    unsigned int v9 = *(_DWORD *)(a1 + 40);
    if (v9 <= v8)
    {
      uint64_t result = 0;
      *(void *)(a1 + 112) = "Too many lines in page image";
      return result;
    }
    id v11 = __src;
    if (v8 + a4 <= v9) {
      int v12 = a4;
    }
    else {
      int v12 = v9 - v8;
    }
    size_t v13 = *(void *)(a1 + 72);
    unsigned int v14 = v12 + v8;
    *(_DWORD *)(a1 + 80) = v12 + v8;
    int v15 = *(_DWORD *)(a1 + 84);
    unint64_t __n = v13 / a3;
    if (v15)
    {
      if (*(_DWORD *)(a1 + 88) == a3)
      {
        id v16 = *(const void **)(a1 + 64);
        if (!memcmp(__src, v16, __n))
        {
          *(_DWORD *)(a1 + 84) = v15 + v12;
          if (a5)
          {
            *(void *)(a1 + 64) = v11;
          }
          else
          {
            id v17 = *(void **)(a1 + 56);
            if (v16 != v17)
            {
              memcpy(v17, v11, v13);
              *(void *)(a1 + 64) = *(void *)(a1 + 56);
              unsigned int v14 = *(_DWORD *)(a1 + 80);
              unsigned int v9 = *(_DWORD *)(a1 + 40);
            }
          }
          if (v14 >= v9)
          {
            while (*(_DWORD *)(a1 + 84))
            {
              int v18 = sub_10003BB3C(a1);
              uint64_t result = 0;
              if (!v18) {
                return result;
              }
            }
          }
          return 1;
        }
      }
      while (*(_DWORD *)(a1 + 84))
      {
        uint64_t result = sub_10003BB3C(a1);
        if (!result) {
          return result;
        }
      }
    }
    *(_DWORD *)(a1 + 84) = v12;
    *(_DWORD *)(a1 + 88) = a3;
    if (!a5 && *(_DWORD *)(a1 + 80) < *(_DWORD *)(a1 + 40))
    {
      memcpy(*(void **)(a1 + 56), v11, __n);
      id v11 = *(const void **)(a1 + 56);
    }
    *(void *)(a1 + 64) = v11;
    if (*(_DWORD *)(a1 + 80) >= *(_DWORD *)(a1 + 40))
    {
      while (*(_DWORD *)(a1 + 84))
      {
        uint64_t result = sub_10003BB3C(a1);
        if (!result) {
          return result;
        }
      }
    }
    return 1;
  }
  return result;
}

uint64_t sub_10003BB3C(uint64_t a1)
{
  unsigned int v1 = *(unsigned __int8 *)(a1 + 24) - 16;
  BOOL v2 = v1 > 0x30;
  uint64_t v3 = (1 << v1) & 0x1000100000001;
  if (v2 || v3 == 0)
  {
    unsigned int v36 = *(_DWORD *)(a1 + 84);
    if (v36 >= 0x100) {
      unsigned int v36 = 256;
    }
    uint64_t v37 = *(unsigned char **)(a1 + 96);
    *uint64_t v37 = v36 - 1;
    id v38 = v37 + 1;
    unint64_t v39 = *(unsigned int *)(a1 + 88);
    *(_DWORD *)(a1 + 84) -= v36;
    uint64_t v40 = *(void *)(a1 + 72) / v39;
    if (v40 >= 1)
    {
      size_t v41 = (unint64_t)*(unsigned __int8 *)(a1 + 24) >> 3;
      unint64_t v42 = *(void *)(a1 + 64);
      uint64_t v43 = (unsigned __int8 *)(v42 + v40);
      id v44 = (unsigned __int8 *)(v42 + v40 - v41);
      if (*(unsigned char *)(a1 + 25) == 6) {
        int v45 = 0;
      }
      else {
        int v45 = 255;
      }
      int v78 = v45;
      uint64_t v46 = 2 * v41;
      unint64_t v47 = 0x80 / v39;
      v76 = v43;
      while (v78 != *(unsigned __int8 *)v42 || memcmp((const void *)v42, (const void *)(v42 + 1), (size_t)&v43[~v42]))
      {
        id v48 = (unsigned __int8 *)(v42 + v41);
        if ((unsigned __int8 *)(v42 + v41) == v43)
        {
          *id v38 = v39 - 1;
          int v68 = v38 + 1;
          memcpy(v68, (const void *)v42, v41);
          id v38 = &v68[v41];
          goto LABEL_99;
        }
        int v49 = memcmp((const void *)v42, (const void *)(v42 + v41), v41);
        BOOL v50 = v48 < v44;
        if (v49)
        {
          unint64_t v51 = 1;
          if (v39 > 0x40)
          {
            BOOL v52 = v39 < 0x41;
          }
          else
          {
            BOOL v52 = v39 < 0x41;
            if (v48 < v44)
            {
              unint64_t v53 = v42;
              unint64_t v51 = 1;
              while (1)
              {
                id v48 = (unsigned __int8 *)(v53 + v41);
                unint64_t v54 = v53 + v46;
                if (!memcmp((const void *)(v53 + v41), (const void *)(v53 + v46), v41)) {
                  break;
                }
                ++v51;
                BOOL v50 = v54 < (unint64_t)v44;
                BOOL v52 = v51 < v47;
                if (v51 < v47)
                {
                  unint64_t v53 = (unint64_t)v48;
                  if (v54 < (unint64_t)v44) {
                    continue;
                  }
                }
                v48 += v41;
                goto LABEL_79;
              }
              BOOL v52 = 1;
              BOOL v50 = 1;
            }
          }
LABEL_79:
          int v60 = v50 || !v52;
          if (v60) {
            size_t v61 = 0;
          }
          else {
            size_t v61 = v41;
          }
          unsigned __int8 v59 = &v48[v61];
          unint64_t v62 = v51 + (v60 ^ 1u);
          *v38++ = 1 - v62 * v39;
          if (v39 == 1)
          {
            size_t v63 = v62 * v41;
            memcpy(v38, (const void *)v42, v63);
            v38 += v63;
          }
          else
          {
            do
            {
              unint64_t v64 = v39;
              do
              {
                memcpy(v38, (const void *)v42, v41);
                v38 += v41;
                --v64;
              }
              while (v64);
              v42 += v41;
              --v62;
            }
            while (v62);
          }
        }
        else
        {
          LOBYTE(v55) = 2;
          if (v39 <= 0x2A && v48 < v44)
          {
            unint64_t v56 = v42;
            uint64_t v55 = 2;
            while (1)
            {
              id v48 = (unsigned __int8 *)(v56 + v41);
              unint64_t v57 = v56 + v46;
              if (memcmp((const void *)(v56 + v41), (const void *)(v56 + v46), v41)) {
                break;
              }
              if (++v55 < v47)
              {
                unint64_t v56 = (unint64_t)v48;
                if (v57 < (unint64_t)v44) {
                  continue;
                }
              }
              v48 += v41;
              break;
            }
          }
          *id v38 = v55 * v39 - 1;
          id v58 = v38 + 1;
          memcpy(v58, (const void *)v42, v41);
          id v38 = &v58[v41];
          unsigned __int8 v59 = &v48[v41];
        }
        unint64_t v42 = (unint64_t)v59;
        BOOL v65 = v59 >= v76;
        uint64_t v43 = v76;
        if (v65) {
          goto LABEL_99;
        }
      }
      *v38++ = 0x80;
    }
LABEL_99:
    uint64_t v66 = a1;
    uint64_t v67 = &v38[-*(void *)(a1 + 96)];
  }
  else
  {
    unsigned int v5 = *(_DWORD *)(a1 + 84);
    if (v5 >= 0x100) {
      unsigned int v5 = 256;
    }
    unsigned int v6 = *(unsigned char **)(a1 + 96);
    *unsigned int v6 = v5 - 1;
    uint64_t v7 = v6 + 1;
    unint64_t v8 = *(unsigned int *)(a1 + 88);
    *(_DWORD *)(a1 + 84) -= v5;
    uint64_t v9 = *(void *)(a1 + 72) / v8;
    if (v9 < 1)
    {
LABEL_94:
      uint64_t v29 = v7;
    }
    else
    {
      unint64_t v10 = *(unsigned __int8 *)(a1 + 24);
      unint64_t v11 = v10 >> 4;
      int v12 = *(unsigned char **)(a1 + 64);
      size_t v13 = &v12[v9];
      unint64_t v14 = (unint64_t)&v12[v9 + -2 * (v10 >> 4)];
      if (*(unsigned char *)(a1 + 25) == 6) {
        int v15 = 0;
      }
      else {
        int v15 = 0xFFFF;
      }
      id v72 = &v12[v9];
      CGSize v73 = v13 - 2;
      size_t v16 = 2 * v11;
      int v74 = v15;
      uint64_t v17 = 4 * v11;
      uint64_t v70 = v11 + 1;
      unint64_t v75 = v10 >> 4;
      unint64_t v77 = 0x80 / v8;
      while (1)
      {
        if (v74 == *(unsigned __int16 *)v12 && !memcmp(v12, v12 + 2, v73 - v12))
        {
          *v7++ = 0x80;
          goto LABEL_94;
        }
        int v18 = &v12[2 * v75];
        if (v18 == v13) {
          break;
        }
        int v19 = memcmp(v12, &v12[2 * v75], v16);
        BOOL v20 = (unint64_t)v18 < v14;
        if (v19)
        {
          LOBYTE(v21) = 1;
          if (v8 > 0x40)
          {
            BOOL v22 = v8 < 0x41;
          }
          else
          {
            BOOL v22 = v8 < 0x41;
            if ((unint64_t)v18 < v14)
            {
              uint64_t v23 = v12;
              unint64_t v21 = 1;
              while (1)
              {
                int v18 = &v23[v16];
                unint64_t v24 = (unint64_t)&v23[v17];
                if (!memcmp(&v23[v16], &v23[v17], v16)) {
                  break;
                }
                ++v21;
                BOOL v20 = v24 < v14;
                BOOL v22 = v21 < v77;
                if (v21 < v77)
                {
                  uint64_t v23 = v18;
                  if (v24 < v14) {
                    continue;
                  }
                }
                v18 += v16;
                goto LABEL_38;
              }
              BOOL v22 = 1;
              BOOL v20 = 1;
LABEL_38:
              size_t v13 = v72;
            }
          }
          int v31 = v20 || !v22;
          unint64_t v32 = v10 >> 4;
          if (v31) {
            unint64_t v32 = 0;
          }
          uint64_t v28 = &v18[2 * v32];
          unsigned char *v7 = 1 - (v21 + (v31 ^ 1)) * v8;
          uint64_t v29 = v7 + 1;
          while (v12 < v28)
          {
            unint64_t v33 = v8;
            do
            {
              if (v10 >= 0x10)
              {
                uint64_t v34 = 0;
                do
                {
                  id v35 = &v29[v34];
                  unsigned char *v35 = v12[v34 + 1];
                  v35[1] = v12[v34];
                  v34 += 2;
                }
                while (v16 != v34);
                v29 += v34;
              }
              --v33;
            }
            while (v33);
            v12 += v16;
          }
        }
        else
        {
          LOBYTE(v25) = 2;
          if (v8 <= 0x2A && (unint64_t)v18 < v14)
          {
            uint64_t v25 = 2;
            while (1)
            {
              int v18 = &v12[v16];
              char v26 = &v12[v17];
              if (memcmp(&v12[v16], &v12[v17], v16)) {
                break;
              }
              if (++v25 < v77)
              {
                v12 += v16;
                if ((unint64_t)v26 < v14) {
                  continue;
                }
              }
              v18 += v16;
              break;
            }
            size_t v13 = v72;
          }
          unsigned char *v7 = v25 * v8 - 1;
          uint64_t v27 = v7 + 1;
          if (v10 >= 0x10)
          {
            uint64_t v30 = v70;
            do
            {
              *uint64_t v27 = v18[1];
              uint64_t v28 = v18 + 2;
              uint64_t v29 = v27 + 2;
              v27[1] = *v18;
              --v30;
              v27 += 2;
              v18 += 2;
            }
            while (v30 > 1);
          }
          else
          {
            uint64_t v28 = v18;
            uint64_t v29 = v27;
          }
        }
        uint64_t v7 = v29;
        int v12 = v28;
        if (v28 >= v13) {
          goto LABEL_95;
        }
      }
      *v7++ = v8 - 1;
      if (v10 < 0x10) {
        goto LABEL_94;
      }
      do
      {
        unsigned char *v7 = v12[1];
        uint64_t v29 = v7 + 2;
        v7[1] = *v12;
        v7 += 2;
        v12 += 2;
      }
      while (v12 < v13);
    }
LABEL_95:
    uint64_t v66 = a1;
    uint64_t v67 = &v29[-*(void *)(a1 + 96)];
    if ((unint64_t)v67 > *(void *)(a1 + 104)) {
      sub_1000641B4();
    }
  }
  if ((char *)(*(uint64_t (**)(void))v66)(*(void *)(v66 + 8)) == v67) {
    return 1;
  }
  uint64_t result = 0;
  *(void *)(v66 + 112) = "Unable to write line";
  return result;
}

uint64_t urfWritePage(uint64_t result, uint64_t *a2)
{
  if (result)
  {
    uint64_t v3 = result;
    if (a2)
    {
      unsigned int v4 = *(_DWORD *)(result + 16);
      if (v4 && *(_DWORD *)(result + 20) >= v4)
      {
        uint64_t result = 0;
        uint64_t v9 = "Done writing all pages";
      }
      else
      {
        uint64_t result = _urfSetLineSize(result, (unsigned __int8 *)a2);
        if (!result) {
          return result;
        }
        uint64_t v10 = *a2;
        int v11 = *((_DWORD *)a2 + 2);
        int8x8_t v12 = vrev32_s8(*(int8x8_t *)((char *)a2 + 12));
        unsigned int v5 = bswap32(*((_DWORD *)a2 + 5));
        uint64_t v14 = 0;
        unsigned int v13 = v5;
        if ((*(uint64_t (**)(void, uint64_t *, uint64_t))v3)(*(void *)(v3 + 8), &v10, 32) == 32)
        {
          ++*(_DWORD *)(v3 + 20);
          *(void *)(v3 + 80) = 0;
          unint64_t v6 = 2 * *(void *)(v3 + 72) + 2;
          if (v6 <= *(void *)(v3 + 104)) {
            return 1;
          }
          uint64_t v7 = *(void **)(v3 + 96);
          if (v7)
          {
            unint64_t v8 = malloc_type_realloc(v7, 2 * *(void *)(v3 + 72) + 2, 0xF73AE04CuLL);
            if (v8)
            {
LABEL_10:
              *(void *)(v3 + 96) = v8;
              *(void *)(v3 + 104) = v6;
              return 1;
            }
          }
          else
          {
            unint64_t v8 = malloc_type_malloc(2 * *(void *)(v3 + 72) + 2, 0x5EA8BDB2uLL);
            if (v8) {
              goto LABEL_10;
            }
          }
          free(*(void **)(v3 + 96));
          uint64_t result = 0;
          *(void *)(v3 + 96) = 0;
          *(void *)(v3 + 104) = 0;
          uint64_t v9 = "Unable to allocate memory for compression buffer";
        }
        else
        {
          uint64_t result = 0;
          uint64_t v9 = "Unable to write page header";
        }
      }
    }
    else
    {
      uint64_t result = 0;
      uint64_t v9 = "NULL page header";
    }
    *(void *)(v3 + 112) = v9;
  }
  return result;
}

uint64_t urfWriteStart(uint64_t result, int a2)
{
  if (result)
  {
    uint64_t v2 = result;
    *(_DWORD *)(result + 16) = a2;
    uint64_t v3 = 0x54534152494E55;
    char v4 = HIBYTE(a2);
    char v5 = BYTE2(a2);
    char v6 = BYTE1(a2);
    char v7 = a2;
    if ((*(uint64_t (**)(void, uint64_t *, uint64_t))result)(*(void *)(result + 8), &v3, 12) == 12)
    {
      return 1;
    }
    else
    {
      uint64_t result = 0;
      *(void *)(v2 + 112) = "Unable to write file header";
    }
  }
  return result;
}

uint64_t liteSetThreadPriority(unsigned int a1)
{
  if (a1 > 5) {
    qos_class_t v1 = QOS_CLASS_UNSPECIFIED;
  }
  else {
    qos_class_t v1 = dword_10006ED10[a1];
  }
  return pthread_set_qos_class_self_np(v1, 0);
}

void sub_10003C56C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10003C920(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10003CA10(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10003CB80(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10003CC9C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10003CDFC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10003CEEC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10003D09C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10003D784(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10003D958(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10003D9B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10003DA40(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10003DB1C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10003DC5C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10003DDBC(_Unwind_Exception *a1)
{
  char v5 = v4;

  _Unwind_Resume(a1);
}

void sub_10003DE8C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10003E0A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15)
{
  _Unwind_Resume(a1);
}

void sub_10003E0DC(uint64_t a1, void *a2)
{
  id v5 = a2;
  uint64_t v3 = objc_msgSend(v5, "loggingValue:", objc_msgSend(*(id *)(a1 + 32), "value_tag"));
  if (v3) {
    char v4 = (__CFString *)v3;
  }
  else {
    char v4 = @"<nil for value tag>";
  }
  [*(id *)(a1 + 40) addObject:v4];
}

void sub_10003E158(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

const char *ippTagString(int a1)
{
  if (a1 > 74) {
    return "UNKNOWN";
  }
  uint64_t v2 = off_1000A2F98[a1];
  return (const char *)[(__CFString *)v2 UTF8String];
}

void sub_10003E264(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10003E318(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

uint64_t sub_10003E330(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10003E450(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10003E4C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10003E540(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10003E5C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10003E70C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10003E83C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10003E8C8(void *a1)
{
  objc_begin_catch(a1);
  *(unsigned char *)(v1 + 16) = v2;
  objc_exception_rethrow();
}

void sub_10003E8D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10003E970(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10003E9FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10003EAC8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10003EB84(_Unwind_Exception *a1)
{
  char v4 = v3;

  _Unwind_Resume(a1);
}

void sub_10003ED3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17)
{
  int v19 = v18;

  _Unwind_Resume(a1);
}

void sub_10003ED88(uint64_t a1, void *a2)
{
  char v2 = *(void **)(a1 + 32);
  id v3 = [a2 loggingDict];
  objc_msgSend(v2, "addObject:");
}

void sub_10003EDE0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10003EE8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

uint64_t sub_10003EEA4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10003EFB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

id sub_10003EFE4(uint64_t a1, void *a2)
{
  char v2 = *(void **)(a1 + 32);
  id v3 = [a2 name];
  id v4 = [v2 isEqualToString:v3];

  return v4;
}

void sub_10003F02C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10003F188(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{
  _Unwind_Resume(a1);
}

char *sub_10003F1BC(uint64_t a1, uint64_t a2, char *a3)
{
  char v6 = (char *)[*(id *)(a1 + 8) length];
  if (&v6[-*(void *)a1] < a3) {
    a3 = &v6[-*(void *)a1];
  }
  objc_msgSend(*(id *)(a1 + 8), "getBytes:range:", a2);
  *(void *)a1 += a3;
  return a3;
}

void sub_10003F2AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_10003F2BC(void *a1, uint64_t a2, uint64_t a3)
{
  return a3;
}

void sub_10003F35C(_Unwind_Exception *a1)
{
  id v4 = v3;

  _Unwind_Resume(a1);
}

void sub_10003F3C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10003F41C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10003F4F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10003F5AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10003F68C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_10003F69C(uint64_t a1, void *a2)
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10003F710;
  void v3[3] = &unk_1000A2CF8;
  void v3[4] = *(void *)(a1 + 32);
  return [a2 withNewEmptyValue:v3];
}

id sub_10003F710(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  return [a2 setRange:&v3];
}

void sub_10003F81C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_10003F840(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  _DWORD v6[2] = sub_10003F8F0;
  v6[3] = &unk_1000A2D70;
  id v7 = v3;
  id v5 = v3;
  [v4 enumerateObjectsUsingBlock:v6];
}

void sub_10003F8D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_10003F8F0(uint64_t a1, void *a2)
{
  id v3 = a2;
  unsigned int v4 = [v3 rangeValue];
  unsigned int v5 = v4 + 1;
  int v7 = v4 + v6;
  unint64_t v8 = *(void **)(a1 + 32);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3321888768;
  void v9[2] = sub_10003F998;
  v9[3] = &unk_1000A2D38;
  unsigned int v10 = v5;
  int v11 = v7;
  [v8 withNewEmptyValue:v9];
}

void sub_10003F984(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_10003F998(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  return [a2 setRange:&v3];
}

void sub_10003FA80(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_10003FA90(uint64_t a1, void *a2)
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10003FB04;
  void v3[3] = &unk_1000A2DB8;
  char v4 = *(unsigned char *)(a1 + 32);
  return [a2 withNewEmptyValue:v3];
}

id sub_10003FB04(uint64_t a1, void *a2)
{
  return [a2 setBoolean:*(unsigned __int8 *)(a1 + 32)];
}

void sub_10003FBD4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_10003FBE4(uint64_t a1, void *a2)
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10003FC58;
  void v3[3] = &unk_1000A2DF8;
  int v4 = *(_DWORD *)(a1 + 32);
  return [a2 withNewEmptyValue:v3];
}

id sub_10003FC58(uint64_t a1, void *a2)
{
  return [a2 setInteger:*(unsigned int *)(a1 + 32)];
}

void sub_10003FD58(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10003FE90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15)
{
  _Unwind_Resume(a1);
}

void sub_10003FEC0(uint64_t a1, void *a2)
{
  id v3 = a2;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  obunint64_t j = *(id *)(a1 + 32);
  id v4 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v20;
    do
    {
      for (unint64_t i = 0; i != v4; unint64_t i = (char *)i + 1)
      {
        if (*(void *)v20 != v5) {
          objc_enumerationMutation(obj);
        }
        int v7 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        unint64_t v8 = *(void **)(a1 + 40);
        if (v8) {
          id v9 = v8;
        }
        int v10 = *(_DWORD *)(a1 + 48);
        if (v10 == 72)
        {
          sub_100040104(v7);
          id v11 = (id)objc_claimAutoreleasedReturnValue();
        }
        else if (v10 == 71)
        {
          id v11 = [v7 stringByReplacingOccurrencesOfString:@"_" withString:@"-"];
        }
        else
        {
          id v11 = v7;
        }
        int8x8_t v12 = v11;
        v16[0] = _NSConcreteStackBlock;
        v16[1] = 3321888768;
        v16[2] = sub_100040190;
        v16[3] = &unk_1000A2E38;
        id v13 = v8;
        id v17 = v13;
        id v14 = v12;
        id v18 = v14;
        [v3 withNewEmptyValue:v16];
      }
      id v4 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v4);
  }
}

void sub_1000400B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

__CFString *sub_100040104(void *a1)
{
  id v1 = a1;
  if ([v1 caseInsensitiveCompare:@"c"])
  {
    char v2 = [v1 stringByReplacingOccurrencesOfString:@"_" withString:@"-"];
  }
  else
  {
    char v2 = @"en";
  }

  return v2;
}

void sub_10004017C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100040190(uint64_t a1, void *a2)
{
  id v5 = a2;
  id v3 = *(id *)(a1 + 32);
  id v4 = *(id *)(a1 + 40);
  if (v5)
  {
    objc_msgSend(v5, "setString:", v3, v4);
  }
  else
  {
  }
}

void sub_100040208(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

id sub_10004021C(uint64_t a1, uint64_t a2)
{
  *(void *)(a1 + 32) = *(id *)(a2 + 32);
  id result = *(id *)(a2 + 40);
  *(void *)(a1 + 40) = result;
  return result;
}

void sub_100040258(uint64_t a1)
{
  char v2 = *(void **)(a1 + 32);
}

void sub_100040370(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_10004038C(uint64_t a1, void *a2)
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10004042C;
  void v3[3] = &unk_1000A2E98;
  id v4 = *(id *)(a1 + 32);
  [a2 withNewEmptyValue:v3];
}

void sub_100040418(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

id sub_10004042C(uint64_t a1, void *a2)
{
  return [a2 setCollection:*(void *)(a1 + 32)];
}

void sub_100040518(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_100040528(uint64_t a1, void *a2)
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000405A4;
  void v3[3] = &unk_1000A2EB8;
  void v3[4] = *(void *)(a1 + 32);
  int v4 = *(_DWORD *)(a1 + 40);
  return [a2 withNewEmptyValue:v3];
}

id sub_1000405A4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setResolution:", *(void *)(a1 + 32), *(unsigned int *)(a1 + 40));
}

void sub_100040684(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_100040694(uint64_t a1, void *a2)
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100040710;
  void v3[3] = &unk_1000A2EB8;
  void v3[4] = *(void *)(a1 + 32);
  int v4 = *(_DWORD *)(a1 + 40);
  return [a2 withNewEmptyValue:v3];
}

void sub_100040710(uint64_t a1, void *a2)
{
  id v4 = a2;
  id v3 = +[NSData dataWithBytes:*(void *)(a1 + 32) length:*(int *)(a1 + 40)];
  [v4 setUnknown:v3];
}

void sub_100040780(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100040808(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10004090C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_100040928(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (*(void *)(a1 + 32) && *(void *)(a1 + 40))
  {
    unint64_t v4 = 0;
    do
    {
      v5[0] = _NSConcreteStackBlock;
      v5[1] = 3221225472;
      v5[2] = sub_100040A20;
      v5[3] = &unk_1000A2F00;
      id v6 = *(id *)(a1 + 32);
      int v7 = v4;
      [v3 withNewEmptyValue:v5];

      ++v4;
    }
    while (*(void *)(a1 + 40) > v4);
  }
}

void sub_100040A08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_100040A20(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setInteger:(*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))()];
}

void sub_100040A84(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100040BD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id a22)
{
  _Block_object_dispose(&a17, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100040C08(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100040C18(uint64_t a1)
{
}

void sub_100040C20(uint64_t a1, void *a2, BOOL *a3)
{
  id v11 = a2;
  id v6 = [v11 name];
  *a3 = [v6 caseInsensitiveCompare:*(void *)(a1 + 32)] == 0;

  if (*a3)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    if (*(_DWORD *)(a1 + 48))
    {
      unsigned int v7 = objc_msgSend(v11, "value_tag");
      int v8 = *(_DWORD *)(a1 + 48);
      if (v7 != v8 && (v7 != 53 || v8 != 65) && (v7 != 65 || v8 != 53))
      {
        uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
        int v10 = *(void **)(v9 + 40);
        *(void *)(v9 + 40) = 0;
      }
    }
  }
}

void sub_100040D04(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100040E4C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100041044(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,id a26)
{
  _Block_object_dispose(&a21, 8);
  _Unwind_Resume(a1);
}

void sub_100041094(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v8 = v3;
  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    unint64_t v4 = *(void **)(a1 + 32);
    id v5 = [v3 loggingDict];
    [v4 addObject:v5];
  }
  else
  {
    uint64_t v6 = [v3 name];
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    id v5 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;
  }
}

void sub_100041124(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1000411F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000412C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1000414B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100041730(_Unwind_Exception *a1)
{
  id v8 = v3;

  _Unwind_Resume(a1);
}

void sub_100041ABC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15)
{
  _Unwind_Resume(a1);
}

void ippAddSeparator(ipp_t *a1)
{
  char v2 = a1;
  if (v2) {
    id v1 = [(ipp_t *)v2 addNewEmptyAttribute:0 groupTag:0 valueTag:0];
  }
}

void sub_100041BD8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

id ippGetIXInteger(ipp_attribute_t *a1, unsigned int a2)
{
  id v3 = a1;
  unint64_t v4 = v3;
  if (!v3) {
    goto LABEL_9;
  }
  if ([(ipp_attribute_t *)v3 value_tag] == 33)
  {
    if ((a2 & 0x80000000) != 0) {
      goto LABEL_9;
    }
  }
  else
  {
    unsigned int v5 = [(ipp_attribute_t *)v4 value_tag];
    id v6 = 0;
    if ((a2 & 0x80000000) != 0 || v5 != 35) {
      goto LABEL_10;
    }
  }
  uint64_t v7 = a2;
  if ([(ipp_attribute_t *)v4 num_values] <= a2)
  {
LABEL_9:
    id v6 = 0;
    goto LABEL_10;
  }
  id v8 = [(ipp_attribute_t *)v4 values];
  uint64_t v9 = [v8 objectAtIndexedSubscript:v7];
  id v6 = [v9 integer];

LABEL_10:
  return v6;
}

void sub_100041CA4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id ippGetIXString(ipp_attribute_t *a1, unsigned int a2)
{
  id v3 = a1;
  unint64_t v4 = v3;
  unsigned int v5 = 0;
  if (v3 && (a2 & 0x80000000) == 0)
  {
    uint64_t v6 = a2;
    if ([(ipp_attribute_t *)v3 num_values] > a2
      && ((unsigned int v7 = [(ipp_attribute_t *)v4 value_tag], v7 - 55 > 0xFFFFFFFD) || v7 - 74 >= 0xFFFFFFF7))
    {
      id v8 = [(ipp_attribute_t *)v4 values];
      uint64_t v9 = [v8 objectAtIndexedSubscript:v6];
      id v10 = [v9 string];
      unsigned int v5 = v11;
    }
    else
    {
      unsigned int v5 = 0;
    }
  }

  return v5;
}

void sub_100041D90(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL ippCoerceAttrToValue(ipp_t *a1, ipp_attribute_t *a2, uint64_t a3)
{
  unsigned int v5 = a1;
  uint64_t v6 = a2;
  unsigned int v7 = v6;
  BOOL v8 = 0;
  if (!v5 || !v6) {
    goto LABEL_11;
  }
  if ([(ipp_attribute_t *)v6 value_tag] == a3)
  {
LABEL_10:
    BOOL v8 = 1;
    goto LABEL_11;
  }
  unsigned int v9 = [(ipp_attribute_t *)v7 value_tag];
  BOOL v8 = 0;
  if ((int)a3 > 50)
  {
    if ((int)a3 <= 53)
    {
      if (a3 == 51)
      {
        if (v9 == 33)
        {
          uint64_t v28 = [(ipp_attribute_t *)v7 num_values];
          if (v28)
          {
            uint64_t v29 = 0;
            do
            {
              uint64_t v30 = [(ipp_attribute_t *)v7 values];
              int v31 = [v30 objectAtIndexedSubscript:v29];
              unsigned int v32 = [v31 integer];

              unint64_t v33 = [(ipp_attribute_t *)v7 values];
              uint64_t v34 = [v33 objectAtIndexedSubscript:v29];
              v52[0] = v32;
              v52[1] = v32;
              [v34 setRange:v52];

              ++v29;
            }
            while (v28 != v29);
          }
          [(ipp_attribute_t *)v7 setValueTag:51];
          goto LABEL_10;
        }
        goto LABEL_41;
      }
      if (a3 != 53) {
        goto LABEL_11;
      }
      if (v9 != 65) {
        goto LABEL_41;
      }
    }
    else
    {
      if (a3 != 54)
      {
        if (a3 != 66)
        {
          if (a3 == 68) {
            BOOL v8 = v9 == 66 || v9 == 54;
          }
          goto LABEL_11;
        }
        if (v9 == 68)
        {
          a3 = 66;
LABEL_9:
          [(ipp_attribute_t *)v7 setValueTag:a3];
          goto LABEL_10;
        }
LABEL_41:
        BOOL v8 = 0;
        goto LABEL_11;
      }
      if (v9 != 66 && v9 != 68) {
        goto LABEL_41;
      }
    }
    id v13 = [(ipp_t *)v5 attrs];
    if ((unint64_t)[v13 count] >= 3)
    {
      id v14 = [(ipp_t *)v5 attrs];
      int v15 = [v14 objectAtIndexedSubscript:1];
      size_t v16 = [v15 name];
      if ([v16 compare:@"attributes-natural-language"])
      {
        id v17 = [(ipp_t *)v5 attrs];
        id v18 = v5;
        long long v19 = [v17 objectAtIndexedSubscript:0];
        if (objc_msgSend(v19, "value_tag") == 72)
        {
          long long v20 = [(ipp_t *)v18 attrs];
          long long v21 = [v20 objectAtIndexedSubscript:0];
          id v50 = objc_msgSend(v21, "num_values");

          unsigned int v5 = v18;
          if (v50)
          {
            long long v22 = [(ipp_t *)v18 attrs];
            uint64_t v23 = [v22 objectAtIndexedSubscript:1];

            if (objc_msgSend(v23, "num_values"))
            {
              unint64_t v24 = [v23 values];
              uint64_t v25 = [v24 objectAtIndexedSubscript:0];
              id v26 = [v25 string];
              unint64_t v51 = v27;
            }
            else
            {
              unint64_t v51 = 0;
            }
            goto LABEL_46;
          }
LABEL_45:
          id v35 = +[NSLocale currentLocale];
          uint64_t v23 = [v35 objectForKey:NSLocaleLanguageCode];

          unint64_t v51 = sub_100040104(v23);
LABEL_46:

          unsigned int v36 = [(ipp_attribute_t *)v7 num_values];
          if (v36)
          {
            uint64_t v37 = 0;
            do
            {
              id v38 = [(ipp_attribute_t *)v7 values];
              unint64_t v39 = [v38 objectAtIndexedSubscript:v37];
              id v40 = [v39 string];
              unint64_t v42 = v41;

              id v43 = v51;
              id v44 = [(ipp_attribute_t *)v7 values];
              int v45 = v5;
              uint64_t v46 = [v44 objectAtIndexedSubscript:v37];
              id v47 = v43;
              id v48 = v42;
              int v49 = v48;
              if (v46)
              {
                objc_msgSend(v46, "setString:", v51, v42);
              }
              else
              {
              }
              ++v37;
              unsigned int v5 = v45;
            }
            while (v36 != v37);
          }
          [(ipp_attribute_t *)v7 setValueTag:54];

          goto LABEL_10;
        }

        unsigned int v5 = v18;
      }
    }
    goto LABEL_45;
  }
  if ((a3 - 16) < 4 || (a3 - 21) < 3)
  {
    if ([(ipp_attribute_t *)v7 num_values])
    {
      id v10 = [(ipp_attribute_t *)v7 values];
      [v10 removeAllObjects];
    }
    goto LABEL_9;
  }
LABEL_11:

  return v8;
}

void sub_100042244(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object, uint64_t a11)
{
  _Unwind_Resume(a1);
}

uint64_t validate_enum<ipp_tag_e,unsigned char>(int a1)
{
  uint64_t result = 0xFFFFFFFFLL;
  switch(a1)
  {
    case 0:
      uint64_t result = 0;
      break;
    case 1:
      uint64_t result = 1;
      break;
    case 2:
      uint64_t result = 2;
      break;
    case 3:
      uint64_t result = 3;
      break;
    case 4:
      uint64_t result = 4;
      break;
    case 5:
      uint64_t result = 5;
      break;
    case 6:
      uint64_t result = 6;
      break;
    case 7:
      uint64_t result = 7;
      break;
    case 8:
      uint64_t result = 8;
      break;
    case 9:
      uint64_t result = 9;
      break;
    case 10:
      uint64_t result = 10;
      break;
    case 11:
    case 12:
    case 13:
    case 14:
    case 15:
    case 20:
    case 24:
    case 25:
    case 26:
    case 27:
    case 28:
    case 29:
    case 30:
    case 31:
    case 32:
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
    case 56:
    case 57:
    case 58:
    case 59:
    case 60:
    case 61:
    case 62:
    case 63:
    case 64:
      return result;
    case 16:
      uint64_t result = 16;
      break;
    case 17:
      uint64_t result = 17;
      break;
    case 18:
      uint64_t result = 18;
      break;
    case 19:
      uint64_t result = 19;
      break;
    case 21:
      uint64_t result = 21;
      break;
    case 22:
      uint64_t result = 22;
      break;
    case 23:
      uint64_t result = 23;
      break;
    case 33:
      uint64_t result = 33;
      break;
    case 34:
      uint64_t result = 34;
      break;
    case 35:
      uint64_t result = 35;
      break;
    case 48:
      uint64_t result = 48;
      break;
    case 49:
      uint64_t result = 49;
      break;
    case 50:
      uint64_t result = 50;
      break;
    case 51:
      uint64_t result = 51;
      break;
    case 52:
      uint64_t result = 52;
      break;
    case 53:
      uint64_t result = 53;
      break;
    case 54:
      uint64_t result = 54;
      break;
    case 55:
      uint64_t result = 55;
      break;
    case 65:
      uint64_t result = 65;
      break;
    case 66:
      uint64_t result = 66;
      break;
    case 67:
      uint64_t result = 67;
      break;
    case 68:
      uint64_t result = 68;
      break;
    case 69:
      uint64_t result = 69;
      break;
    case 70:
      uint64_t result = 70;
      break;
    case 71:
      uint64_t result = 71;
      break;
    case 72:
      uint64_t result = 72;
      break;
    case 73:
      uint64_t result = 73;
      break;
    case 74:
      uint64_t result = 74;
      break;
    default:
      if (a1 == 127) {
        uint64_t result = 127;
      }
      else {
        uint64_t result = 0xFFFFFFFFLL;
      }
      break;
  }
  return result;
}

uint64_t validate_enum<ipp_res_e,unsigned char>(int a1)
{
  if (a1 == 3) {
    return 3;
  }
  else {
    return 4;
  }
}

uint64_t validate_enum<PKJobState,unsigned char>(int a1)
{
  if ((a1 - 3) >= 6) {
    return 9;
  }
  else {
    return (a1 - 3) + 3;
  }
}

uint64_t validate_enum<ipp_orient_e,unsigned char>(char a1)
{
  if (((a1 - 4) & 0xFC) != 0) {
    return 3;
  }
  else {
    return (a1 - 4) + 4;
  }
}

uint64_t validate_enum<ipp_quality_e,unsigned char>(int a1)
{
  if (a1 == 5) {
    unsigned int v1 = 5;
  }
  else {
    unsigned int v1 = 3;
  }
  if (a1 == 4) {
    return 4;
  }
  else {
    return v1;
  }
}

void sub_1000426BC(uint64_t a1, uint64_t a2)
{
  char v2 = *(void **)(a1 + 32);
  id v3 = +[NSString stringWithFormat:@"  %@", a2];
  objc_msgSend(v2, "addObject:");
}

void sub_100042724(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

BOOL liteInitURF(void *a1, uint64_t a2, int a3)
{
  uint64_t v104 = 0;
  id v100 = a1;
  unint64_t v4 = [v100 objectForKeyedSubscript:@"URF"];
  unsigned int v5 = v4;
  if (v4)
  {
    uint64_t v6 = [v4 componentsSeparatedByString:@","];
  }
  else
  {
    uint64_t v6 = 0;
  }

  for (unint64_t i = 0; (unint64_t)[v6 count] > i; ++i)
  {
    id v8 = [v6 objectAtIndexedSubscript:i];
    unsigned int v9 = (char *)[v8 UTF8String];

    if (!strncmp(v9, "CP", 2uLL))
    {
      *(_DWORD *)(a2 + 128) = atoi(v9 + 2) > 1;
    }
    else if (!strncmp(v9, "DM", 2uLL))
    {
      int v12 = v9[2];
      if (v12 >= 49)
      {
        *(unsigned char *)(a2 + 120) |= 1u;
        LOBYTE(v12) = v9[2];
      }
      if (v12 == 51)
      {
        *(_DWORD *)(a2 + 136) = 2;
      }
      else if (v12 == 50)
      {
        *(_DWORD *)(a2 + 136) = 1;
      }
    }
    else if (!strncmp(v9, "FN", 2uLL))
    {
      *(_DWORD *)(a2 + 140) = sub_100043448((unsigned __int8 *)v9 + 2, a2 + 144, 101);
    }
    else if (!strncmp(v9, "IS", 2uLL))
    {
      *(_DWORD *)(a2 + 548) = sub_100043448((unsigned __int8 *)v9 + 2, a2 + 752, 50);
    }
    else if (!strncmp(v9, "MT", 2uLL))
    {
      *(_DWORD *)(a2 + 1524) = sub_100043448((unsigned __int8 *)v9 + 2, a2 + 1528, 14);
    }
    else if (!strncmp(v9, "OB", 2uLL))
    {
      *(_DWORD *)(a2 + 1584) = sub_100043448((unsigned __int8 *)v9 + 2, a2 + 1788, 50);
    }
    else if (!strncmp(v9, "RS", 2uLL))
    {
      *(_DWORD *)(a2 + 2000) = sub_100043448((unsigned __int8 *)v9 + 2, a2 + 2020, 4);
    }
    else if (!strcmp(v9, "SRGB24"))
    {
      *(unsigned char *)(a2 + 120) |= 2u;
    }
    else if (!strncmp(v9, "ADOBERGB", 8uLL))
    {
      int v13 = sub_100043448((unsigned __int8 *)v9 + 8, (uint64_t)v105, 4);
      if (v13 < 1)
      {
        BOOL v16 = 0;
      }
      else
      {
        unint64_t v14 = 0;
        do
          int v15 = v105[v14++];
        while (v14 < v13 && v15 != 48);
        BOOL v16 = v15 == 48;
      }
      *(_DWORD *)(a2 + 2008) = v16;
    }
    else if (!strncmp(v9, "P3E48", 5uLL))
    {
      *(_DWORD *)(a2 + 2012) = 1;
    }
    else if (!strncmp(v9, "WE16", 4uLL))
    {
      *(_DWORD *)(a2 + 2016) = 1;
    }
    else if (*v9 == 86)
    {
      int v10 = sub_100043448((unsigned __int8 *)v9 + 1, (uint64_t)v105, 2);
      if (v10 >= 1)
      {
        BOOL v11 = v10 != 1;
        if (v105[0] != 1) {
          BOOL v11 = 0;
        }
        if (v105[1] <= 1) {
          BOOL v11 = 0;
        }
        if (v105[0] > 1 || v11) {
          *(_DWORD *)(a2 + 2004) = 1;
        }
      }
    }
  }
  uint64_t v17 = *(unsigned int *)(a2 + 548);
  if ((int)v17 >= 2)
  {
    *(_DWORD *)(a2 + 548) = v17 + 1;
    *(_DWORD *)(a2 + 4 * v17 + 752) = 0;
  }
  uint64_t v18 = *(unsigned int *)(a2 + 1524);
  if ((int)v18 >= 2)
  {
    *(_DWORD *)(a2 + 1524) = v18 + 1;
    *(_DWORD *)(a2 + 4 * v18 + 1528) = 0;
  }
  uint64_t v19 = *(unsigned int *)(a2 + 1584);
  if ((int)v19 >= 2)
  {
    *(_DWORD *)(a2 + 1584) = v19 + 1;
    *(_DWORD *)(a2 + 4 * v19 + 1788) = 0;
  }
  for (unint64_t j = 0; (unint64_t)[v6 count] > j; ++j)
  {
    id v21 = [v6 objectAtIndexedSubscript:j];
    long long v22 = (unsigned __int8 *)[v21 UTF8String];

    if (!strncmp((const char *)v22, "OFU", 3uLL))
    {
      int v23 = sub_100043448(v22 + 3, (uint64_t)v105, 50);
      if (v23 != 1 || v105[0])
      {
        if (v23 >= 1)
        {
          uint64_t v25 = v23;
          id v26 = v105;
          do
          {
            uint64_t v28 = *v26++;
            uint64_t v27 = v28;
            if ((int)v28 <= 49) {
              *(_DWORD *)(a2 + 4 * v27 + 1588) = 1;
            }
            --v25;
          }
          while (v25);
        }
      }
      else
      {
        uint64_t v24 = *(unsigned int *)(a2 + 1584);
        if ((int)v24 >= 1) {
          memset_pattern16((void *)(a2 + 1588), &unk_10006ED50, 4 * v24);
        }
      }
    }
  }
  int v29 = *(_DWORD *)(a2 + 2000);
  if (!v29)
  {
    int v29 = 1;
    *(_DWORD *)(a2 + 2000) = 1;
    *(_DWORD *)(a2 + 2020) = 300;
  }
  *(_DWORD *)(a2 + 1996) = *(_DWORD *)(a2 + 4 * (v29 / 2) + 2020);
  unint64_t v30 = *(unsigned int *)(a2 + 1524);
  if ((int)v30 < 1)
  {
    BOOL v31 = 1;
  }
  else if (*(_DWORD *)(a2 + 1528) == 3)
  {
    BOOL v31 = 0;
  }
  else
  {
    uint64_t v32 = 0;
    do
    {
      uint64_t v33 = v32;
      if (v30 - 1 == v32) {
        break;
      }
      int v34 = *(_DWORD *)(a2 + 1532 + 4 * v32++);
    }
    while (v34 != 3);
    BOOL v31 = v33 + 1 >= v30;
  }
  id v35 = [v100 objectForKeyedSubscript:@"MAXSIZE"];
  unsigned int v36 = (const char *)[v35 UTF8String];

  if (!v36) {
    goto LABEL_83;
  }
  LOBYTE(v102) = 0;
  if (sscanf(v36, "%fx%f%2s", (char *)&v104 + 4, &v104, &v102) != 3) {
    goto LABEL_83;
  }
  if (!(v102 ^ 0x6E69 | v103))
  {
    double v94 = *((float *)&v104 + 1);
    double v95 = 2540.0;
LABEL_174:
    int v38 = (int)(v94 * v95);
    int v37 = (int)(*(float *)&v104 * v95);
    goto LABEL_84;
  }
  if (!(v102 ^ 0x6D6D | v103))
  {
    double v94 = *((float *)&v104 + 1);
    double v95 = 100.0;
    goto LABEL_174;
  }
LABEL_83:
  int v37 = 35560;
  int v38 = 21590;
LABEL_84:
  id v39 = [v100 objectForKeyedSubscript:@"MINSIZE"];
  id v40 = (const char *)[v39 UTF8String];

  if (!v40) {
    goto LABEL_88;
  }
  LOBYTE(v102) = 0;
  if (sscanf(v40, "%fx%f%2s", (char *)&v104 + 4, &v104, &v102) != 3) {
    goto LABEL_88;
  }
  if (!(v102 ^ 0x6E69 | v103))
  {
    double v96 = *((float *)&v104 + 1);
    double v97 = 2540.0;
LABEL_176:
    int v42 = (int)(v96 * v97);
    int v41 = (int)(*(float *)&v104 * v97);
    goto LABEL_89;
  }
  if (!(v102 ^ 0x6D6D | v103))
  {
    double v96 = *((float *)&v104 + 1);
    double v97 = 100.0;
    goto LABEL_176;
  }
LABEL_88:
  int v41 = 27940;
  int v42 = 21000;
LABEL_89:
  int v43 = 0;
  id v44 = &dword_10006EB04;
  do
  {
    int v45 = *(v44 - 1);
    if (v45 >= v42 && v45 <= v38 && *v44 >= v41 && *v44 <= v37 && ((v43 - 19) >= 5 || !v31))
    {
      uint64_t v49 = *(int *)(a2 + 992);
      *(_DWORD *)(a2 + 992) = v49 + 1;
      *(_DWORD *)(a2 + 4 * v49 + 996) = v43;
    }
    ++v43;
    v44 += 2;
  }
  while (v43 != 24);
  unint64_t v50 = *(unsigned int *)(a2 + 548);
  if ((int)v50 < 1)
  {
    BOOL v55 = 0;
  }
  else
  {
    int v51 = *(_DWORD *)(a2 + 752);
    unsigned int v52 = v51 - 9;
    unsigned int v53 = v51 - 40;
    if (v52 >= 2 && v53 >= 0xA)
    {
      uint64_t v56 = 0;
      do
      {
        uint64_t v57 = v56;
        if (v50 - 1 == v56) {
          break;
        }
        int v58 = *(_DWORD *)(a2 + 756 + 4 * v56);
        unsigned int v59 = v58 - 9;
        unsigned int v60 = v58 - 40;
        uint64_t v56 = v57 + 1;
      }
      while (v59 >= 2 && v60 > 9);
      BOOL v55 = v57 + 1 < v50;
    }
    else
    {
      BOOL v55 = 1;
    }
  }
  if (v42 != v38 || v41 != v37)
  {
    uint64_t v62 = *(int *)(a2 + 992);
    *(_DWORD *)(a2 + 992) = v62 + 1;
    *(_DWORD *)(a2 + 4 * v62 + 996) = 24;
    *(_DWORD *)(a2 + 1520) = v41;
    *(_DWORD *)(a2 + 1512) = v37;
    if (v55)
    {
      for (uint64_t k = &dword_100000010; k != -4; k -= 4)
      {
        int v64 = *(int *)((char *)RollWidths + k);
        if (v64 >= v42) {
          *(_DWORD *)(a2 + 1516) = v64;
        }
      }
      for (uint64_t m = 0; m != 5; ++m)
      {
        int v66 = RollWidths[m];
        if (v66 <= v38) {
          *(_DWORD *)(a2 + 1508) = v66;
        }
      }
    }
    else
    {
      *(_DWORD *)(a2 + 1516) = v42;
      *(_DWORD *)(a2 + 1508) = v38;
    }
  }
  id v67 = [v100 objectForKeyedSubscript:@"TEST-BORDERLESS"];
  int v68 = (const char *)[v67 UTF8String];

  if (v68) {
    int v69 = atoi(v68);
  }
  else {
    int v69 = 0;
  }
  *(_DWORD *)(a2 + 952) = v69;
  id v70 = [v100 objectForKeyedSubscript:@"TEST-MARGINS"];
  int v71 = (const char *)[v70 UTF8String];

  if (!v71)
  {
    *(_DWORD *)(a2 + 972) = 635;
    *(int32x2_t *)(a2 + 976) = vdup_n_s32(0x27Bu);
    id v72 = (_DWORD *)(a2 + 984);
    goto LABEL_140;
  }
  id v72 = (_DWORD *)(a2 + 984);
  if (sscanf(v71, "%d%d%d%d", a2 + 972, a2 + 976, a2 + 980, a2 + 984) != 4)
  {
    *(int32x2_t *)(a2 + 972) = vdup_n_s32(0x27Bu);
    *(_DWORD *)(a2 + 980) = 635;
LABEL_140:
    _DWORD *v72 = 635;
  }
  id v73 = [v100 objectForKeyedSubscript:@"TEST-DUPLEX"];
  int v74 = (const char *)[v73 UTF8String];

  if (v74 && sscanf(v74, "%d%d%d%d", a2 + 956, a2 + 960, a2 + 964, a2 + 968) != 4)
  {
    *(void *)(a2 + 956) = 0;
    *(void *)(a2 + 964) = 0;
  }
  unint64_t v75 = [v100 objectForKeyedSubscript:@"TEST-MEDIA-READY"];
  if (v75)
  {
    id v99 = v75;
    v76 = [v75 componentsSeparatedByString:@","];
    for (unint64_t n = 0; (unint64_t)[v76 count] > n; ++n)
    {
      id v78 = [v76 objectAtIndexedSubscript:n];
      long long v79 = (const char *)[v78 UTF8String];

      LOBYTE(v102) = 0;
      v105[0] = 0;
      int v101 = 0;
      if (sscanf(v79, "%fx%f%2s IS%d MT%d", (char *)&v104 + 4, &v104, &v102, v105, &v101) != 5) {
        break;
      }
      double v80 = 2540.0;
      if (v102 ^ 0x6E69 | v103)
      {
        if (v102 ^ 0x6D6D | v103) {
          break;
        }
        double v80 = 100.0;
      }
      int v81 = 0;
      int v82 = (int)(v80 * *(float *)&v104);
      int v83 = (int)(v80 * *((float *)&v104 + 1));
      BOOL v84 = v83 <= v82;
      if (v83 >= v82) {
        int v85 = (int)(v80 * *(float *)&v104);
      }
      else {
        int v85 = (int)(v80 * *((float *)&v104 + 1));
      }
      if (v83 > v82) {
        int v82 = (int)(v80 * *((float *)&v104 + 1));
      }
      if (v84) {
        int v86 = 3;
      }
      else {
        int v86 = 4;
      }
      id v87 = &dword_10006EB04;
      do
      {
        if (*(v87 - 1) == v85 && *v87 == v82) {
          break;
        }
        ++v81;
        v87 += 2;
      }
      while (v81 != 24);
      uint64_t v88 = *(int *)(a2 + 1096);
      int v89 = (_DWORD *)(a2 + 4 * v88);
      v89[275] = v81;
      v89[325] = v105[0];
      v89[300] = v101;
      v89[350] = v86;
      *(_DWORD *)(a2 + 1096) = v88 + 1;
      if (v81 == 24)
      {
        *(_DWORD *)(a2 + 1500) = v85;
        *(_DWORD *)(a2 + 1504) = v82;
      }
    }

    unint64_t v75 = v99;
  }

  *(_DWORD *)(a2 + 988) = 10;
  CGAffineTransform v90 = *(void **)(a2 + 2040);
  *(void *)(a2 + 2040) = @"image/urf";

  if (a3)
  {
    BOOL v91 = 1;
  }
  else
  {
    v92 = urfNew((uint64_t)sub_1000434D0, a2);
    *(void *)(a2 + 2048) = v92;
    *(void *)(a2 + 2064) = sub_1000434D8;
    *(void *)(a2 + 2072) = sub_1000434E0;
    *(void *)(a2 + 2080) = sub_100043510;
    *(void *)(a2 + 2088) = sub_100043518;
    *(void *)(a2 + 2096) = sub_100043520;
    BOOL v91 = v92 != 0;
  }

  return v91;
}

void sub_10004335C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18, void *a19)
{
  _Unwind_Resume(a1);
}

uint64_t sub_100043448(unsigned __int8 *a1, uint64_t a2, int a3)
{
  unsigned __int8 v3 = *a1;
  if (!*a1) {
    return 0;
  }
  uint64_t v4 = 0;
  do
  {
    if ((_DefaultRuneLocale.__runetype[v3] & 0x400) != 0)
    {
      int v5 = 0;
      do
      {
        int v5 = 10 * v5 + (char)v3 - 48;
        int v6 = *++a1;
        unsigned __int8 v3 = v6;
      }
      while ((_DefaultRuneLocale.__runetype[v6] & 0x400) != 0);
    }
    else
    {
      int v5 = 0;
    }
    uint64_t v7 = v4 + 1;
    *(_DWORD *)(a2 + 4 * v4) = v5;
    if (*a1 - 45 > 1 || v7 >= a3) {
      break;
    }
    int v9 = *++a1;
    unsigned __int8 v3 = v9;
    ++v4;
  }
  while (v9);
  return v7;
}

uint64_t sub_1000434D0(uint64_t a1)
{
  return (*(uint64_t (**)(void))a1)(*(void *)(a1 + 8));
}

uint64_t sub_1000434D8(uint64_t a1, int a2)
{
  return urfWriteStart(*(void *)(a1 + 2048), a2);
}

uint64_t sub_1000434E0(uint64_t a1)
{
  *(void *)(a1 + 2048) = 0;
  return 1;
}

uint64_t sub_100043510(uint64_t a1, uint64_t *a2)
{
  return urfWritePage(*(void *)(a1 + 2048), a2);
}

uint64_t sub_100043518()
{
  return 1;
}

uint64_t sub_100043520(uint64_t a1, void *a2, int a3)
{
  int v3 = a3;
  unsigned int v5 = *(_DWORD *)(a1 + 84) & 0xFFFFFFFE;
  uint64_t v6 = *(void *)(a1 + 2048);
  uint64_t v7 = 1;
  if (v5 == 4)
  {
    int v8 = 1;
  }
  else
  {
    a3 = 1;
    int v8 = v3;
  }
  if (!urfWriteLine(v6, a2, a3, v8, 0))
  {
    int v9 = _PKLogCategory(PKLogCategoryProgress[0]);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = *(void *)(a1 + 2048);
      int v11 = *(_DWORD *)(v10 + 80);
      int v12 = *(_DWORD *)(v10 + 40);
      int v14 = 136316162;
      int v15 = "urf_sendpixels";
      __int16 v16 = 1024;
      int v17 = v3;
      __int16 v18 = 1024;
      int v19 = v11;
      __int16 v20 = 1024;
      int v21 = v12;
      __int16 v22 = 2080;
      uint64_t v23 = urfErrorString(v10);
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%s: Failed to send %d lines at %d/%d: %s", (uint8_t *)&v14, 0x28u);
    }

    return 0;
  }
  return v7;
}

void sub_10004365C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void _liteNotifyCancel(NSString *a1)
{
  unsigned int v1 = +[NSString stringWithFormat:@"%s/%@", "_liteNotifyCancel", a1];
  PKCancelAlert(v1);

  dword_1000C8B38 = 0;
}

void sub_1000436D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void liteNotifyCheckForCancel(lite_job_t *a1)
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_10004378C;
  v2[3] = &unk_1000A21D0;
  int v3 = a1;
  unsigned int v1 = v3;
  [(lite_job_t *)v1 _withActivity:v2];
}

void sub_100043774(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_10004378C(uint64_t a1, os_activity_t activity)
{
  int v3 = _os_activity_create((void *)&_mh_execute_header, "Thread: Check for Cancel", activity, OS_ACTIVITY_FLAG_DEFAULT);
  uint64_t v4 = _PKLogCategory(PKLogCategoryProgress[0]);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v5 = objc_msgSend(*(id *)(a1 + 32), "printd_job_id");
    uint64_t v6 = *(void **)(a1 + 32);
    if (v6) {
      unsigned int v7 = objc_msgSend(v6, "destination_job_id");
    }
    else {
      unsigned int v7 = -1;
    }
    *(_DWORD *)long long buf = 67109890;
    unsigned int v15 = v5;
    __int16 v16 = 1024;
    unsigned int v17 = v7;
    __int16 v18 = 2048;
    int v19 = v3;
    __int16 v20 = 2080;
    int v21 = "Thread: Check for Cancel";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[Job %d][%d] Activity (%p) ENTER: %s", buf, 0x22u);
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100043A00;
  block[3] = &unk_100095360;
  id v13 = *(id *)(a1 + 32);
  os_activity_apply(v3, block);
  int v8 = _PKLogCategory(PKLogCategoryProgress[0]);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v9 = objc_msgSend(*(id *)(a1 + 32), "printd_job_id");
    uint64_t v10 = *(void **)(a1 + 32);
    if (v10) {
      unsigned int v11 = objc_msgSend(v10, "destination_job_id");
    }
    else {
      unsigned int v11 = -1;
    }
    *(_DWORD *)long long buf = 67109890;
    unsigned int v15 = v9;
    __int16 v16 = 1024;
    unsigned int v17 = v11;
    __int16 v18 = 2048;
    int v19 = v3;
    __int16 v20 = 2080;
    int v21 = "Thread: Check for Cancel";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[Job %d][%d] Activity (%p) EXIT: %s", buf, 0x22u);
  }
}

void sub_1000439C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_100043A00(uint64_t a1)
{
  char v2 = +[NSString stringWithFormat:@"%s:%d", "liteNotifyCheckForCancel_block_invoke", 170];
  int v3 = PKCheckAlert(60, v2);

  if (v3 == 2)
  {
    uint64_t v4 = _PKLogCategory(PKLogCategoryProgress[0]);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v5 = objc_msgSend(*(id *)(a1 + 32), "printd_job_id");
      uint64_t v6 = *(void **)(a1 + 32);
      if (v6) {
        unsigned int v7 = objc_msgSend(v6, "destination_job_id");
      }
      else {
        unsigned int v7 = -1;
      }
      *(_DWORD *)long long buf = 67109376;
      unsigned int v13 = v5;
      __int16 v14 = 1024;
      unsigned int v15 = v7;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[Job %d][%d] Cancelling", buf, 0xEu);
    }

    [*(id *)(a1 + 32) cancelThisJob];
  }
  int v8 = _PKLogCategory(PKLogCategoryProgress[0]);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v9 = objc_msgSend(*(id *)(a1 + 32), "printd_job_id");
    uint64_t v10 = *(void **)(a1 + 32);
    if (v10) {
      unsigned int v11 = objc_msgSend(v10, "destination_job_id");
    }
    else {
      unsigned int v11 = -1;
    }
    *(_DWORD *)long long buf = 67109376;
    unsigned int v13 = v9;
    __int16 v14 = 1024;
    unsigned int v15 = v11;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[Job %d][%d] exiting check cancel thread", buf, 0xEu);
  }
}

void sub_100043BB4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void liteNotifyClearPassword(lite_printer_t *a1)
{
  unsigned int v1 = [(lite_printer_t *)a1 device_uri];
  PKStoreAuthInfo(v1, 0);
}

void sub_100043C28(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void liteNotifyPINRequired(lite_job_t *a1)
{
  unsigned int v1 = a1;
  if (v1 && time(0) - v1->pin_alert_shown >= 60)
  {
    char v2 = [(lite_job_t *)v1 jobPassword];
    int v3 = v2;
    if (v2 && (unint64_t)[v2 length] <= 0x7E)
    {
      objc_msgSend(v3, "getBytes:length:", v34, objc_msgSend(v3, "length"));
      v34[(void)[v3 length]] = 0;
      uint64_t v4 = _PKLogCategory(PKLogCategoryProgress[0]);
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v5 = [(lite_job_t *)v1 printd_job_id];
        unsigned int v6 = [(lite_job_t *)v1 destination_job_id];
        unsigned int v7 = [(lite_job_t *)v1 printer];
        int v8 = [(lite_job_t *)v1 printer];
        unsigned int v9 = [v8 bonjourName];
        *(_DWORD *)long long buf = 67110146;
        unsigned int v25 = v5;
        __int16 v26 = 1024;
        unsigned int v27 = v6;
        __int16 v28 = 2048;
        int v29 = v7;
        __int16 v30 = 2112;
        BOOL v31 = v9;
        __int16 v32 = 2080;
        uint64_t v33 = v34;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[Job %d][%d] liteNotifyPINRequired(printer=%p(%@), PIN=%s)", buf, 0x2Cu);
      }
      uint64_t v10 = [(lite_job_t *)v1 request_attrs];
      uint64_t v11 = (*((void (**)(JobRequestAttributes_Base *))v10->var0 + 44))(v10);
      if (v11) {
        int v12 = (__CFString *)v11;
      }
      else {
        int v12 = @"Unknown";
      }
      id v13 = [(__CFString *)v12 length];
      BOOL v14 = (unint64_t)v13 > 0xFE;
      if ((unint64_t)v13 <= 0xFE) {
        unsigned int v15 = @"Enter \"%s\" on the printer to start printing \"%@\".";
      }
      else {
        unsigned int v15 = @"Enter \"%s\" on the printer to start printing \"%@…\".";
      }
      if (v14) {
        __int16 v16 = "PIN release alert with long job name.";
      }
      else {
        __int16 v16 = "PIN release alert.";
      }
      unsigned int v17 = PKLocalizedString(&v15->isa, v16);
      id v23 = 0;
      __int16 v18 = +[NSString stringWithValidatedFormat:v17, @"%s%@", &v23, v34, v12 validFormatSpecifiers error];
      id v19 = v23;
      if ([(__CFString *)v18 length])
      {
        liteLockPrinters();
        __int16 v20 = [(lite_job_t *)v1 printer];
        int v21 = [v20 displayName];
        __int16 v22 = +[NSString stringWithUTF8String:"liteNotifyPINRequired"];
        PKDisplayAlert(v21, v18, v22);

        v1->pin_alert_showunint64_t n = time(0);
        liteUnlockPrinters();
      }
    }
  }
}

void sub_100043F58(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void liteNotifyPrinter(lite_printer_t *a1, uint64_t a2, NSString *a3)
{
  uint64_t v4 = a1;
  if (v4)
  {
    liteLockPrinters();
    if (![(lite_printer_t *)v4 reasons]) {
      dword_1000C8B38 = 0;
    }
    unsigned int v5 = [(lite_printer_t *)v4 reasons];
    [(lite_printer_t *)v4 setReasonsBits:a2];
    int v6 = a2 & ~v5;
    if (!v6) {
      goto LABEL_11;
    }
    quantized_notify_post(1u);
    if ((v6 & 2) != 0)
    {
      int v12 = _PKLogCategory(PKLogCategoryProgress[0]);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        id v13 = [(lite_printer_t *)v4 displayName];
        *(_DWORD *)long long buf = 138412290;
        __int16 v30 = v13;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%@: Connecting to printer.", buf, 0xCu);
      }
      goto LABEL_11;
    }
    if ((v6 & 0x80000) != 0)
    {
      CFStringRef cf = PKLocalizedString(@"You do not have permission to use this printer.", "User not in access control list alert.");
      int v7 = 0;
      int v8 = 0;
      int v9 = 0;
      int v10 = 0;
      uint64_t v11 = 19;
      goto LABEL_62;
    }
    if ((v6 & 0x400000) != 0)
    {
      CFStringRef cf = PKLocalizedString(@"Your account limit has been reached.", "Quota limit reached alert.");
      int v7 = 0;
      int v8 = 0;
      int v9 = 0;
      uint64_t v11 = 22;
      int v10 = 1;
      goto LABEL_62;
    }
    if ((v6 & 0x40000) != 0)
    {
      CFStringRef cf = PKLocalizedString(@"There is not enough space available to print. You can make more space available by removing apps, songs, photos, or videos.", "Disk full alert.");
      int v7 = 0;
      int v8 = 0;
      int v9 = 0;
      int v10 = 0;
      uint64_t v11 = 18;
      goto LABEL_62;
    }
    if ((v6 & 0x10000) != 0)
    {
      CFStringRef cf = PKLocalizedString(@"The printer is no longer available.", "Connection lost alert.");
      int v8 = 0;
      int v9 = 0;
      int v10 = 0;
      uint64_t v11 = 16;
      int v7 = 1;
      goto LABEL_62;
    }
    if ((v6 & 0x40) != 0)
    {
      CFStringRef cf = PKLocalizedString(@"The printer is out of paper.", "Out of paper alert.");
      int v7 = 0;
      int v8 = 0;
      int v9 = 0;
      int v10 = 0;
      uint64_t v11 = 6;
      goto LABEL_62;
    }
    if ((v6 & 0x80) != 0)
    {
      CFStringRef cf = PKLocalizedString(@"The printer has a paper jam.", "Paper jam alert.");
      int v7 = 0;
      int v8 = 0;
      int v9 = 0;
      int v10 = 0;
      uint64_t v11 = 7;
      goto LABEL_62;
    }
    if ((v6 & 0x100) != 0)
    {
      CFStringRef cf = PKLocalizedString(@"The printer needs paper.", "Paper needed alert.");
      int v7 = 0;
      int v8 = 0;
      int v9 = 0;
      int v10 = 0;
      uint64_t v11 = 8;
      goto LABEL_62;
    }
    if ((v6 & 0x200) != 0)
    {
      CFStringRef cf = PKLocalizedString(@"The printer may be out of toner.", "Out of toner alert.");
      int v7 = 0;
      int v8 = 0;
      int v9 = 0;
      int v10 = 0;
      uint64_t v11 = 9;
      goto LABEL_62;
    }
    if ((v6 & 0x400) != 0)
    {
      CFStringRef cf = PKLocalizedString(@"The printer may be out of ink.", "Out of ink alert.");
      int v7 = 0;
      int v8 = 0;
      int v9 = 0;
      int v10 = 0;
      uint64_t v11 = 10;
      goto LABEL_62;
    }
    if ((v6 & 0x800) != 0)
    {
      CFStringRef cf = PKLocalizedString(@"A paper tray is missing.", "Input tray missing alert.");
      int v7 = 0;
      int v8 = 0;
      int v9 = 0;
      int v10 = 0;
      uint64_t v11 = 11;
      goto LABEL_62;
    }
    if ((v6 & 0x1000) != 0)
    {
      CFStringRef cf = PKLocalizedString(@"The printer door is open.", "Door open alert.");
      int v7 = 0;
      int v8 = 0;
      int v9 = 0;
      int v10 = 0;
      uint64_t v11 = 12;
      goto LABEL_62;
    }
    if ((v6 & 0x2000) != 0)
    {
      CFStringRef cf = PKLocalizedString(@"The printer cover is open.", "Cover open alert.");
      int v7 = 0;
      int v8 = 0;
      int v9 = 0;
      int v10 = 0;
      uint64_t v11 = 13;
      goto LABEL_62;
    }
    if ((v6 & 0x4000) != 0)
    {
      CFStringRef cf = PKLocalizedString(@"The printer is offline.", "Offline/missing printer alert.");
      int v7 = 0;
      int v8 = 0;
      int v9 = 0;
      int v10 = 0;
      uint64_t v11 = 14;
      goto LABEL_62;
    }
    if ((v6 & 0x20) != 0)
    {
      if (![(lite_printer_t *)v4 busy])
      {
        [(lite_printer_t *)v4 setBusy:time(0)];
        goto LABEL_11;
      }
      time_t v16 = time(0);
      if (v16 - [(lite_printer_t *)v4 busy] >= 31)
      {
        CFStringRef cf = PKLocalizedString(@"The printer is busy.", "Busy printer alert.");
        int v7 = 0;
        int v8 = 0;
        int v9 = 0;
        int v10 = 0;
        uint64_t v11 = 5;
        goto LABEL_62;
      }
    }
    if ((v6 & 4) != 0)
    {
      CFStringRef cf = PKLocalizedString(@"The printer is almost out of paper.", "Low paper notice.");
      int v7 = 0;
      int v8 = 0;
      int v9 = 0;
      int v10 = 0;
      uint64_t v11 = 2;
    }
    else if ((v6 & 8) != 0)
    {
      CFStringRef cf = PKLocalizedString(@"The printer is low on toner.", "Low toner notice.");
      int v7 = 0;
      int v8 = 0;
      int v9 = 0;
      int v10 = 0;
      uint64_t v11 = 3;
    }
    else if ((v6 & 0x10) != 0)
    {
      CFStringRef cf = PKLocalizedString(@"The printer is low on ink.", "Low ink notice.");
      int v7 = 0;
      int v8 = 0;
      int v9 = 0;
      int v10 = 0;
      uint64_t v11 = 4;
    }
    else if ((v6 & 0x20000) != 0)
    {
      CFStringRef cf = PKLocalizedString(@"The printer is paused.", "Paused/stopped printer alert.");
      int v7 = 0;
      int v8 = 0;
      int v9 = 0;
      int v10 = 0;
      uint64_t v11 = 17;
    }
    else if ((v6 & 0x100000) != 0)
    {
      CFStringRef cf = PKLocalizedString(@"This printer requires account information to print.", "Missing account id alert.");
      int v7 = 0;
      int v9 = 0;
      int v10 = 0;
      uint64_t v11 = 20;
      int v8 = 1;
    }
    else
    {
      if ((v6 & 0x8000) == 0)
      {
        if ((v6 & 0x200000) != 0)
        {
          CFStringRef cf = PKLocalizedString(@"An error occurred printing this document.", "Print job failed for an unknown reason.");
          int v7 = 0;
          int v8 = 0;
          int v10 = 0;
          uint64_t v11 = 21;
          int v9 = 1;
          goto LABEL_62;
        }
LABEL_11:
        LOBYTE(v11) = 0;
        goto LABEL_12;
      }
      CFStringRef cf = PKLocalizedString(@"Check the printer for errors.", "Unknown/other error alert.");
      int v7 = 0;
      int v8 = 0;
      int v9 = 0;
      int v10 = 0;
      uint64_t v11 = 15;
    }
LABEL_62:
    if (cf)
    {
      int v17 = v8;
      if (!(dword_1000C8B38 >> v11))
      {
        __int16 v18 = [(lite_printer_t *)v4 displayName];
        if (v18)
        {
          int v26 = v7;
          CFStringRef v27 = v18;
          id v19 = sub_1000448CC(&dword_1000C8B38);
          __int16 v20 = +[NSString stringWithFormat:@"%@ for %@", v19, v18];
          int v21 = +[NSString stringWithFormat:@"%s:%d/%@", "liteNotifyPrinter", 413, v20];

          __int16 v18 = (__CFString *)v27;
          if (dword_1000C8B38)
          {
            PKCancelAlert(v21);
            __int16 v22 = +[NSString stringWithFormat:@"%s:%d", "liteNotifyPrinter", 418];
            PKCheckAlert(0, v22);
          }
          sub_100044B0C(&dword_1000C8B38, v11);
          if ((v6 & 0x80000) != 0 || v26 | v17 | v9)
          {
            PKDisplayRetry(v27, cf, v21);
          }
          else if (((1 << v11) & 0x21FFE0) != 0)
          {
            PKCancelAlert(v21);
            PKDisplayAlert(v27, cf, v21);
          }
          else if (v10)
          {
            id v23 = [(lite_printer_t *)v4 quotaManagementURL];

            if (v23)
            {
              uint64_t v24 = [(lite_printer_t *)v4 quotaManagementURL];
              unsigned int v25 = [v24 absoluteString];
            }
            else
            {
              unsigned int v25 = 0;
            }
            PKDisplayQuotaAlert(v27, cf, v25, v21);
          }
          else
          {
            PKDisplayNotice(v27, cf, v21);
          }
        }
      }
      CFRelease(cf);
LABEL_75:
      liteUnlockPrinters();
      goto LABEL_76;
    }
LABEL_12:
    if (dword_1000C8B38 && (dword_1000C8B38 & (1 << v11)) == 0)
    {
      BOOL v14 = +[NSString stringWithFormat:@"%s/shouldCancelAlertSinceThereIsNoMessage", "liteNotifyPrinter"];
      PKCancelAlert(v14);
    }
    if ((a2 & 0x21FFE0) != 0 && !v6)
    {
      time_t v15 = time(0);
      if (v15 - [(lite_printer_t *)v4 reasons_changed] >= 151)
      {
        [(lite_printer_t *)v4 setReasonsBits:[(lite_printer_t *)v4 reasons] & 2];
        dword_1000C8B38 = 0;
      }
    }
    goto LABEL_75;
  }
LABEL_76:
}

void sub_100044844(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

__CFString *sub_1000448CC(int *a1)
{
  int v1 = *a1;
  char v2 = objc_opt_new();
  int v3 = v2;
  if ((v1 & 2) != 0) {
    [v2 addObject:@"CONNECTING"];
  }
  if ((v1 & 4) != 0) {
    [v3 addObject:@"MEDIA_LOW"];
  }
  if ((v1 & 8) != 0) {
    [v3 addObject:@"TONER_LOW"];
  }
  if ((v1 & 0x10) != 0) {
    [v3 addObject:@"MARKER_LOW"];
  }
  if ((v1 & 0x20) != 0) {
    [v3 addObject:@"BUSY"];
  }
  if ((v1 & 0x40) != 0) {
    [v3 addObject:@"MEDIA_EMPTY"];
  }
  if ((v1 & 0x80) != 0) {
    [v3 addObject:@"MEDIA_JAM"];
  }
  if ((v1 & 0x100) != 0) {
    [v3 addObject:@"MEDIA_NEEDED"];
  }
  if ((v1 & 0x200) != 0) {
    [v3 addObject:@"TONER_EMPTY"];
  }
  if ((v1 & 0x400) != 0) {
    [v3 addObject:@"MARKER_EMPTY"];
  }
  if ((v1 & 0x800) != 0) {
    [v3 addObject:@"TRAY_MISSING"];
  }
  if ((v1 & 0x1000) != 0) {
    [v3 addObject:@"DOOR_OPEN"];
  }
  if ((v1 & 0x2000) != 0) {
    [v3 addObject:@"COVER_OPEN"];
  }
  if ((v1 & 0x4000) != 0) {
    [v3 addObject:@"OFFLINE"];
  }
  if ((v1 & 0x8000) != 0) {
    [v3 addObject:@"OTHER"];
  }
  if ((v1 & 0x10000) != 0) {
    [v3 addObject:@"LOST_CONNECTION"];
  }
  if ((v1 & 0x20000) != 0) {
    [v3 addObject:@"STOPPED"];
  }
  if ((v1 & 0x40000) != 0) {
    [v3 addObject:@"SPOOL_AREA_FULL"];
  }
  if ((v1 & 0x80000) != 0) {
    [v3 addObject:@"FORBIDDEN"];
  }
  if ((v1 & 0x100000) != 0) {
    [v3 addObject:@"ACCOUNT_INFO_NEEDED"];
  }
  if ((v1 & 0x200000) != 0) {
    [v3 addObject:@"OTHER_ERROR"];
  }
  if ((v1 & 0x400000) != 0) {
    [v3 addObject:@"LIMIT_REACHED"];
  }
  if ([v3 count])
  {
    uint64_t v4 = [v3 componentsJoinedByString:@"+"];
  }
  else
  {
    uint64_t v4 = @"NONE";
  }

  return v4;
}

void sub_100044AFC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100044B0C(int *a1, uint64_t a2)
{
  sub_1000448CC(a1);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  if (a2 >= 0x17) {
    id v4 = +[NSString stringWithFormat:@"?? INVALID REASON 0x%x", a2];
  }
  *a1 = 1 << a2;
  sub_1000448CC(a1);
}

void sub_100044B9C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

uint64_t liteNotifyRunning(int a1)
{
  int v2 = dword_1000C88C4;
  if (dword_1000C88C4 < 0)
  {
    notify_register_check("com.apple.printd.running", &dword_1000C88C4);
    int v2 = dword_1000C88C4;
  }

  return notify_set_state(v2, a1 != 0);
}

void LaunchPrintCenter(void)
{
  v3[0] = FBSOpenApplicationOptionKeyUnlockDevice;
  v3[1] = FBSOpenApplicationOptionKeyPromptUnlockDevice;
  v4[0] = &__kCFBooleanTrue;
  v4[1] = &__kCFBooleanTrue;
  uint64_t v0 = +[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:2];
  int v1 = +[FBSOpenApplicationService serviceWithDefaultShellEndpoint];
  int v2 = +[FBSOpenApplicationOptions optionsWithDictionary:v0];
  [v1 openApplication:@"com.apple.printcenter" withOptions:v2 completion:0];
}

void sub_100044D04(_Unwind_Exception *a1)
{
  id v4 = v3;

  _Unwind_Resume(a1);
}

uint64_t PKCancelAlert(NSString *a1)
{
  pthread_mutex_lock(&stru_1000C88C8);
  if (qword_1000C8B40)
  {
    CFUserNotificationCancel((CFUserNotificationRef)qword_1000C8B40);
    qword_1000C8B40 = 0;
    dword_1000C8B48 = 0;
  }

  return pthread_mutex_unlock(&stru_1000C88C8);
}

uint64_t PKCheckAlert(int a1, NSString *a2)
{
  if (a1) {
    double v2 = (double)a1;
  }
  else {
    double v2 = 0.001;
  }
  pthread_mutex_lock(&stru_1000C88C8);
  int v3 = (__CFUserNotification *)qword_1000C8B40;
  if (qword_1000C8B40) {
    BOOL v4 = dword_1000C8B48 == 3;
  }
  else {
    BOOL v4 = 0;
  }
  if (v4)
  {
    CFOptionFlags responseFlags = 0;
    uint64_t v6 = 0xFFFFFFFFLL;
    while (1)
    {
      int v7 = (const void *)qword_1000C8B40;
      if (v2 <= 0.0 || qword_1000C8B40 == 0) {
        break;
      }
      if (v2 <= 1.0) {
        double v9 = v2;
      }
      else {
        double v9 = 1.0;
      }
      if (CFUserNotificationReceiveResponse((CFUserNotificationRef)qword_1000C8B40, v9, &responseFlags))
      {
        uint64_t v6 = 0;
      }
      else
      {
        CFOptionFlags v10 = responseFlags & 3;
        if (v10 == 3)
        {
          uint64_t v6 = 0xFFFFFFFFLL;
          goto LABEL_50;
        }
        if (v10 == 1) {
          goto LABEL_49;
        }
        if ((responseFlags & 3) == 0)
        {
          if (qword_1000C8B50)
          {
            PKOpenURL(qword_1000C8B50);
            CFRelease((CFTypeRef)qword_1000C8B50);
            qword_1000C8B50 = 0;
          }
LABEL_49:
          uint64_t v6 = 2;
LABEL_50:
          int v7 = (const void *)qword_1000C8B40;
          if (!qword_1000C8B40) {
            goto LABEL_52;
          }
LABEL_51:
          CFRelease(v7);
          qword_1000C8B40 = 0;
          goto LABEL_52;
        }
      }
      pthread_mutex_unlock(&stru_1000C88C8);
      double v2 = v2 + -1.0;
      pthread_mutex_lock(&stru_1000C88C8);
    }
    if (!v6) {
      goto LABEL_61;
    }
    if (qword_1000C8B40) {
      goto LABEL_51;
    }
LABEL_52:
    dword_1000C8B48 = 0;
  }
  else
  {
    if (qword_1000C8B40) {
      BOOL v5 = dword_1000C8B48 == 4;
    }
    else {
      BOOL v5 = 1;
    }
    if (v5)
    {
      uint64_t v6 = 0xFFFFFFFFLL;
    }
    else
    {
      CFOptionFlags responseFlags = 0;
      int v11 = 0;
      if (v2 <= 0.0)
      {
        uint64_t v6 = 0xFFFFFFFFLL;
      }
      else
      {
        do
        {
          if (v2 <= 1.0) {
            double v12 = v2;
          }
          else {
            double v12 = 1.0;
          }
          SInt32 v13 = CFUserNotificationReceiveResponse(v3, v12, &responseFlags);
          if (!v13)
          {
            CFOptionFlags v14 = responseFlags & 3;
            if (v14 != 2)
            {
              if (v14 == 3) {
                uint64_t v6 = 0xFFFFFFFFLL;
              }
              else {
                uint64_t v6 = (v14 + 1);
              }
              goto LABEL_57;
            }
            int v11 = 1;
          }
          pthread_mutex_unlock(&stru_1000C88C8);
          pthread_mutex_lock(&stru_1000C88C8);
          double v2 = v2 + -1.0;
          int v3 = (__CFUserNotification *)qword_1000C8B40;
        }
        while (v2 > 0.0 && qword_1000C8B40 != 0);
        if (v13)
        {
          uint64_t v6 = 0;
          goto LABEL_61;
        }
        uint64_t v6 = 1;
      }
LABEL_57:
      if (qword_1000C8B40)
      {
        CFRelease((CFTypeRef)qword_1000C8B40);
        qword_1000C8B40 = 0;
      }
      dword_1000C8B48 = 0;
      if (v11) {
        LaunchPrintCenter();
      }
    }
  }
LABEL_61:
  pthread_mutex_unlock(&stru_1000C88C8);
  return v6;
}

void PKDisplayAlert(const __CFString *a1, const __CFString *a2, NSString *a3)
{
  BOOL v5 = a3;
  pthread_mutex_lock(&stru_1000C88C8);
  if (qword_1000C8B40)
  {
    uint64_t v6 = _PKLogCategory(PKLogCategoryDefault[0]);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      if (dword_1000C8B48 > 4) {
        CFStringRef v7 = @"UNKNOWN";
      }
      else {
        CFStringRef v7 = off_1000A3240[dword_1000C8B48];
      }
      int v10 = 136315650;
      int v11 = "PKDisplayAlert";
      __int16 v12 = 2112;
      SInt32 v13 = v5;
      __int16 v14 = 2112;
      CFStringRef v15 = v7;
      double v9 = "#### %s: from %@, already have alert up at level %@";
LABEL_12:
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v10, 0x20u);
    }
  }
  else
  {
    qword_1000C8B40 = (uint64_t)sub_1000451C8(a1, 0, a2, 2, 0);
    dword_1000C8B48 = 2;
    uint64_t v6 = _PKLogCategory(PKLogCategoryDefault[0]);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      if (dword_1000C8B48 > 4) {
        CFStringRef v8 = @"UNKNOWN";
      }
      else {
        CFStringRef v8 = off_1000A3240[dword_1000C8B48];
      }
      int v10 = 136315650;
      int v11 = "PKDisplayAlert";
      __int16 v12 = 2112;
      SInt32 v13 = v5;
      __int16 v14 = 2112;
      CFStringRef v15 = v8;
      double v9 = "#### %s: from %@, created new alert level %@";
      goto LABEL_12;
    }
  }

  pthread_mutex_unlock(&stru_1000C88C8);
}

void sub_1000451A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

CFUserNotificationRef sub_1000451C8(const void *a1, __CFString *a2, CFTypeRef cf, int a4, int a5)
{
  SInt32 error = 0;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  *(_OWORD *)keys = 0u;
  long long v37 = 0u;
  long long v35 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v30 = 0u;
  *(_OWORD *)__int16 v28 = 0u;
  long long v29 = 0u;
  if (a4 != 4)
  {
    keys[0] = (void *)kCFUserNotificationAlertHeaderKey;
    v28[0] = (void *)CFRetain(a1);
    keys[1] = (void *)kCFUserNotificationAlertMessageKey;
    v28[1] = (void *)CFRetain(cf);
    if (a4 == 3)
    {
      *(void *)&long long v37 = kCFUserNotificationDefaultButtonTitleKey;
      *(void *)&long long v29 = PKLocalizedString(@"Details", "Open webpage to manage quota");
      *((void *)&v37 + 1) = kCFUserNotificationAlternateButtonTitleKey;
      int v10 = (void *)PKLocalizedString(@"Cancel", "Cancel printing");
      unsigned int v13 = 4;
      CFOptionFlags v11 = 2;
      uint64_t v12 = 3;
    }
    else
    {
      if (a4 != 1)
      {
        *(void *)&long long v37 = kCFUserNotificationDefaultButtonTitleKey;
        if (!a5)
        {
          CFStringRef v14 = PKLocalizedString(@"Continue", "Continue printing");
          a5 = 1;
          uint64_t v9 = 2;
          goto LABEL_12;
        }
        a5 = 1;
        uint64_t v9 = 2;
        goto LABEL_11;
      }
      *(void *)&long long v37 = kCFUserNotificationDefaultButtonTitleKey;
      int v10 = (void *)PKLocalizedString(@"OK", "Acknowledgement");
      CFOptionFlags v11 = 3;
      uint64_t v12 = 2;
      unsigned int v13 = 3;
    }
LABEL_24:
    v28[v12] = v10;
    goto LABEL_25;
  }
  keys[0] = (void *)kCFUserNotificationAlertMessageKey;
  v28[0] = (void *)CFRetain(cf);
  keys[1] = (void *)kCFUserNotificationDefaultButtonTitleKey;
  if (a5)
  {
    a5 = 0;
    uint64_t v9 = 1;
LABEL_11:
    CFStringRef v14 = PKLocalizedString(@"Try Again", "Retry printing");
    goto LABEL_12;
  }
  CFStringRef v14 = PKLocalizedString(@"OK", "Acknowledgement");
  uint64_t v9 = 1;
LABEL_12:
  v28[v9] = (void *)v14;
  keys[a5 | 2u] = (void *)kCFUserNotificationAlternateButtonTitleKey;
  unsigned int v13 = a5 + 3;
  v28[a5 | 2u] = (void *)PKLocalizedString(@"Cancel Print Job", "Cancel printing");
  int v15 = SBSGetApplicationState();
  if (v15 != 8 && v15 != 32)
  {
    keys[v13] = (void *)kCFUserNotificationOtherButtonTitleKey;
    v28[v13] = (void *)PKLocalizedString(@"Open Print Center", "Open Print Center");
    unsigned int v13 = a5 | 4;
  }
  if (a4 == 4)
  {
    CFOptionFlags v11 = 65538;
    if (a2 && CFStringCompare(a2, @"guest-only", 1uLL) == kCFCompareEqualTo)
    {
      values = (void *)PKLocalizedString(@"password", "Password placeholder text");
      CFArrayRef v18 = CFArrayCreate(kCFAllocatorDefault, (const void **)&values, 1, &kCFTypeArrayCallBacks);
      CFRelease(values);
      keys[v13] = (void *)kCFUserNotificationTextFieldTitlesKey;
      unsigned int v17 = v13 + 1;
      v28[v13] = v18;
    }
    else
    {
      values = (void *)PKLocalizedString(@"user name", "Username placeholder text");
      CFTypeRef cfa = PKLocalizedString(@"password", "Password placeholder text");
      CFArrayRef v16 = CFArrayCreate(kCFAllocatorDefault, (const void **)&values, 2, &kCFTypeArrayCallBacks);
      CFRelease(values);
      CFRelease(cfa);
      keys[v13] = (void *)kCFUserNotificationTextFieldTitlesKey;
      unsigned int v17 = v13 + 1;
      v28[v13] = v16;
      if (a2)
      {
        unsigned int v25 = a2;
        keys[v17] = (void *)kCFUserNotificationTextFieldValuesKey;
        v28[v17] = CFArrayCreate(kCFAllocatorDefault, (const void **)&v25, 1, &kCFTypeArrayCallBacks);
        unsigned int v17 = v13 + 2;
      }
      CFOptionFlags v11 = 131074;
    }
    keys[v17] = (void *)SBUserNotificationTextAutocapitalizationType;
    v28[v17] = kCFBooleanFalse;
    uint64_t v12 = v17 + 1;
    keys[v12] = (void *)SBUserNotificationTextAutocorrectionType;
    int v10 = kCFBooleanTrue;
    unsigned int v13 = v17 + 2;
    goto LABEL_24;
  }
  CFOptionFlags v11 = 2;
LABEL_25:
  keys[v13] = (void *)SBUserNotificationDismissOnLock;
  v28[v13] = kCFBooleanFalse;
  keys[v13 + 1] = (void *)SBUserNotificationDontDismissOnUnlock;
  unsigned int v19 = v13 + 2;
  v28[v13 + 1] = kCFBooleanTrue;
  keys[v19] = (void *)SBUserNotificationAllowMenuButtonDismissal;
  v28[v19] = kCFBooleanFalse;
  CFDictionaryRef v20 = CFDictionaryCreate(kCFAllocatorDefault, (const void **)keys, (const void **)v28, v13 + 3, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  unint64_t v21 = 0;
  do
  {
    CFRelease(v28[v21 / 8]);
    v21 += 8;
  }
  while (8 * v13 + 24 != v21);
  CFUserNotificationRef v22 = CFUserNotificationCreate(kCFAllocatorDefault, 0.0, v11, &error, v20);
  CFRelease(v20);
  return v22;
}

void PKDisplayQuotaAlert(const __CFString *a1, const __CFString *a2, const __CFString *a3, NSString *a4)
{
  CFStringRef v7 = a4;
  if (a3) {
    qword_1000C8B50 = (uint64_t)CFURLCreateWithString(kCFAllocatorDefault, a3, 0);
  }
  pthread_mutex_lock(&stru_1000C88C8);
  if (qword_1000C8B40)
  {
    CFStringRef v8 = _PKLogCategory(PKLogCategoryDefault[0]);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      if (dword_1000C8B48 > 4) {
        CFStringRef v9 = @"UNKNOWN";
      }
      else {
        CFStringRef v9 = off_1000A3240[dword_1000C8B48];
      }
      int v12 = 136315650;
      unsigned int v13 = "PKDisplayQuotaAlert";
      __int16 v14 = 2112;
      int v15 = v7;
      __int16 v16 = 2112;
      CFStringRef v17 = v9;
      CFOptionFlags v11 = "#### %s: from %@, already have alert up at level %@";
LABEL_14:
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v12, 0x20u);
    }
  }
  else
  {
    qword_1000C8B40 = (uint64_t)sub_1000451C8(a1, 0, a2, 3, 0);
    dword_1000C8B48 = 3;
    CFStringRef v8 = _PKLogCategory(PKLogCategoryDefault[0]);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      if (dword_1000C8B48 > 4) {
        CFStringRef v10 = @"UNKNOWN";
      }
      else {
        CFStringRef v10 = off_1000A3240[dword_1000C8B48];
      }
      int v12 = 136315650;
      unsigned int v13 = "PKDisplayQuotaAlert";
      __int16 v14 = 2112;
      int v15 = v7;
      __int16 v16 = 2112;
      CFStringRef v17 = v10;
      CFOptionFlags v11 = "#### %s: from %@, created new alert level %@";
      goto LABEL_14;
    }
  }

  pthread_mutex_unlock(&stru_1000C88C8);
}

void sub_1000458F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void PKDisplayNotice(const __CFString *a1, const __CFString *a2, NSString *a3)
{
  BOOL v5 = a3;
  pthread_mutex_lock(&stru_1000C88C8);
  if (qword_1000C8B40)
  {
    uint64_t v6 = _PKLogCategory(PKLogCategoryDefault[0]);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      if (dword_1000C8B48 > 4) {
        CFStringRef v7 = @"UNKNOWN";
      }
      else {
        CFStringRef v7 = off_1000A3240[dword_1000C8B48];
      }
      int v10 = 136315650;
      CFOptionFlags v11 = "PKDisplayNotice";
      __int16 v12 = 2112;
      unsigned int v13 = v5;
      __int16 v14 = 2112;
      CFStringRef v15 = v7;
      CFStringRef v9 = "#### %s: from %@, already have alert up at level %@";
LABEL_12:
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v10, 0x20u);
    }
  }
  else
  {
    qword_1000C8B40 = (uint64_t)sub_1000451C8(a1, 0, a2, 1, 0);
    dword_1000C8B48 = 1;
    uint64_t v6 = _PKLogCategory(PKLogCategoryDefault[0]);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      if (dword_1000C8B48 > 4) {
        CFStringRef v8 = @"UNKNOWN";
      }
      else {
        CFStringRef v8 = off_1000A3240[dword_1000C8B48];
      }
      int v10 = 136315650;
      CFOptionFlags v11 = "PKDisplayNotice";
      __int16 v12 = 2112;
      unsigned int v13 = v5;
      __int16 v14 = 2112;
      CFStringRef v15 = v8;
      CFStringRef v9 = "#### %s: from %@, created new alert level %@";
      goto LABEL_12;
    }
  }

  pthread_mutex_unlock(&stru_1000C88C8);
}

void sub_100045B00(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void PKDisplayRetry(const __CFString *a1, const __CFString *a2, NSString *a3)
{
  BOOL v5 = a3;
  pthread_mutex_lock(&stru_1000C88C8);
  if (qword_1000C8B40)
  {
    uint64_t v6 = _PKLogCategory(PKLogCategoryDefault[0]);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      if (dword_1000C8B48 > 4) {
        CFStringRef v7 = @"UNKNOWN";
      }
      else {
        CFStringRef v7 = off_1000A3240[dword_1000C8B48];
      }
      int v10 = 136315650;
      CFOptionFlags v11 = "PKDisplayRetry";
      __int16 v12 = 2112;
      unsigned int v13 = v5;
      __int16 v14 = 2112;
      CFStringRef v15 = v7;
      CFStringRef v9 = "#### %s: from %@, already have alert up at level %@";
LABEL_12:
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v10, 0x20u);
    }
  }
  else
  {
    qword_1000C8B40 = (uint64_t)sub_1000451C8(a1, 0, a2, 2, 1);
    dword_1000C8B48 = 2;
    uint64_t v6 = _PKLogCategory(PKLogCategoryDefault[0]);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      if (dword_1000C8B48 > 4) {
        CFStringRef v8 = @"UNKNOWN";
      }
      else {
        CFStringRef v8 = off_1000A3240[dword_1000C8B48];
      }
      int v10 = 136315650;
      CFOptionFlags v11 = "PKDisplayRetry";
      __int16 v12 = 2112;
      unsigned int v13 = v5;
      __int16 v14 = 2112;
      CFStringRef v15 = v8;
      CFStringRef v9 = "#### %s: from %@, created new alert level %@";
      goto LABEL_12;
    }
  }

  pthread_mutex_unlock(&stru_1000C88C8);
}

void sub_100045D08(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

__CFUserNotification *PKPromptAuthInfo(NSString *a1, NSString *a2, int a3)
{
  BOOL v5 = a1;
  uint64_t v6 = a2;
  if (dword_1000C8B48 <= 2)
  {
    pthread_mutex_lock(&stru_1000C88C8);
    if (qword_1000C8B40)
    {
      CFUserNotificationCancel((CFUserNotificationRef)qword_1000C8B40);
      CFRelease((CFTypeRef)qword_1000C8B40);
      qword_1000C8B40 = 0;
    }
    if (a3) {
      CFStringRef v8 = @"Password required for \"%@\"";
    }
    else {
      CFStringRef v8 = @"Incorrect Name or Password for \"%@\"";
    }
    if (a3) {
      CFStringRef v9 = "Password prompt";
    }
    else {
      CFStringRef v9 = "Password prompt, subsequent attempts";
    }
    CFStringRef v10 = PKLocalizedString(v8, v9);
    CFStringRef StringWithValidatedFormat = CFStringCreateStringWithValidatedFormat(kCFAllocatorDefault, 0, @"%@", v10, 0, v5);
    CFRelease(v10);
    CFStringRef v7 = sub_1000451C8(v5, v6, StringWithValidatedFormat, 4, 0);
    CFRelease(StringWithValidatedFormat);
    qword_1000C8B40 = (uint64_t)v7;
    dword_1000C8B48 = 4;
    pthread_mutex_unlock(&stru_1000C88C8);
    CFOptionFlags responseFlags = 3;
    if (v7)
    {
      __int16 v12 = 0;
      unsigned int v13 = 0;
      if (CFUserNotificationReceiveResponse(v7, 0.0, &responseFlags))
      {
        CFOptionFlags responseFlags = 3;
        qword_1000C8B40 = 0;
        dword_1000C8B48 = 0;
      }
      else
      {
        qword_1000C8B40 = 0;
        dword_1000C8B48 = 0;
        if (!responseFlags)
        {
          if (v6 && ![(__CFString *)v6 caseInsensitiveCompare:@"guest-only"])
          {
            unsigned int v13 = v6;
            __int16 v12 = CFUserNotificationGetResponseValue(v7, kCFUserNotificationTextFieldValuesKey, 0);
          }
          else
          {
            uint64_t v14 = CFUserNotificationGetResponseValue(v7, kCFUserNotificationTextFieldValuesKey, 0);
            __int16 v12 = CFUserNotificationGetResponseValue(v7, kCFUserNotificationTextFieldValuesKey, 1);
            unsigned int v13 = (__CFString *)v14;
          }
        }
      }
      CFRelease(v7);
      CFStringRef v7 = 0;
      if (v13 && v12)
      {
        CFStringRef v7 = +[NSURLCredential credentialWithUser:v13 password:v12 persistence:2];
      }
    }
    else
    {
      unsigned int v13 = 0;
      __int16 v12 = 0;
      qword_1000C8B40 = 0;
      dword_1000C8B48 = 0;
    }
  }
  else
  {
    CFStringRef v7 = 0;
  }

  return v7;
}

void sub_100045FB8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void PKPromptAuthInfo(void *a1, void *a2, char a3, void *a4)
{
  id v7 = a1;
  id v8 = a2;
  id v9 = a4;
  CFStringRef v10 = dispatch_get_global_queue(0, 0);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000460F4;
  v14[3] = &unk_1000A3220;
  id v15 = v7;
  id v16 = v8;
  char v18 = a3;
  id v17 = v9;
  id v11 = v9;
  id v12 = v8;
  id v13 = v7;
  dispatch_async(v10, v14);
}

void sub_1000460F4(uint64_t a1)
{
  PKPromptAuthInfo(*(NSString **)(a1 + 32), *(NSString **)(a1 + 40), *(unsigned __int8 *)(a1 + 56));
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void sub_10004615C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

id PKGetAuthInfo(NSString *a1, NSURL *a2)
{
  id v2 = a2;
  int v3 = [(NSURL *)v2 port];
  if (!v3)
  {
    BOOL v4 = [(NSURL *)v2 scheme];
    int v3 = PKDefaultPortForScheme(v4);
  }
  unsigned int v5 = [v3 integerValue];
  id v6 = [(NSURL *)v2 host];
  id v7 = [v6 UTF8String];

  id v8 = [(NSURL *)v2 path];
  id v9 = (const char *)[v8 UTF8String];

  CFStringRef v10 = [(NSURL *)v2 scheme];
  id v11 = [v10 lowercaseString];
  id v12 = [v11 UTF8String];

  CFTypeRef cf = 0;
  CFTypeRef result = 0;
  CFDictionaryRef v13 = sub_100046868((uint64_t)v7, v5, v9, (uint64_t)v12, 3, 0, 0);
  CFDictionaryRef v14 = v13;
  if (v13)
  {
    if (SecItemCopyMatching(v13, &result))
    {
      int v15 = 0;
      CFDictionaryRef v16 = 0;
    }
    else
    {
      CFStringRef Value = (const __CFString *)CFDictionaryGetValue((CFDictionaryRef)result, kSecAttrAccount);
      CFDictionaryRef v16 = sub_100046868((uint64_t)v7, v5, v9, (uint64_t)v12, 4, 0, 0);
      int v15 = 0;
      if (v16 && Value)
      {
        if (CFStringGetCString(Value, buffer, 256, 0x8000100u) && !SecItemCopyMatching(v16, &cf))
        {
          BytePtr = (const char *)CFDataGetBytePtr((CFDataRef)cf);
          strlcpy(__dst, BytePtr, 0x100uLL);
          int v15 = 1;
        }
        else
        {
          int v15 = 0;
        }
      }
    }
    CFRelease(v14);
    if (result) {
      CFRelease(result);
    }
    if (v16) {
      CFRelease(v16);
    }
  }
  else
  {
    int v15 = 0;
  }
  if (cf) {
    CFRelease(cf);
  }

  if (v15)
  {
    id v17 = +[NSString stringWithUTF8String:buffer];
    char v18 = +[NSString stringWithUTF8String:__dst];
    unsigned int v19 = +[NSURLCredential credentialWithUser:v17 password:v18 persistence:2];
  }
  else
  {
    unsigned int v19 = 0;
  }

  return v19;
}

void sub_10004642C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void PKStoreAuthInfo(NSURL *a1, NSURLCredential *a2)
{
  id v8 = a1;
  int v3 = a2;
  BOOL v4 = v3;
  if (v3)
  {
    id v5 = [(NSURLCredential *)v3 user];
    id v6 = (char *)[v5 UTF8String];
    id v7 = [(NSURLCredential *)v4 password];
    sub_1000465A8(v8, v6, (const char *)[v7 UTF8String]);
  }
  else
  {
    sub_1000465A8(v8, 0, 0);
  }
}

void sub_100046578(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1000465A8(void *a1, char *a2, const char *a3)
{
  id v23 = a1;
  id v5 = [v23 port];
  if (!v5)
  {
    id v6 = [v23 scheme];
    id v5 = PKDefaultPortForScheme(v6);
  }
  unsigned int v7 = [v5 integerValue];
  id v8 = [v23 host];
  id v9 = [v8 UTF8String];

  id v10 = [v23 path];
  id v11 = (const char *)[v10 UTF8String];

  id v12 = [v23 scheme];
  id v13 = [v12 lowercaseString];
  id v14 = [v13 UTF8String];

  if (byte_1000C8B58)
  {
    if (byte_1000C8908) {
      goto LABEL_5;
    }
LABEL_17:
    byte_1000C8908 = 0;
    goto LABEL_21;
  }
  AppBooleanCFStringRef Value = CFPreferencesGetAppBooleanValue(@"PrintKitSaveUsernamePassword", @".GlobalPreferences", (Boolean *)&byte_1000C8B58);
  if (byte_1000C8B58) {
    int v22 = AppBooleanValue;
  }
  else {
    int v22 = 1;
  }
  byte_1000C8908 = v22;
  byte_1000C8B58 = 1;
  if (!v22) {
    goto LABEL_17;
  }
LABEL_5:
  unsigned int v15 = PKStoreCredentialsInKeychainAllowed();
  byte_1000C8908 = v15 != 0;
  if (v15)
  {
    CFDictionaryRef v16 = sub_100046868((uint64_t)v9, v7, v11, (uint64_t)v14, 2, 0, 0);
    CFDictionaryRef v17 = v16;
    if (a2 && a3)
    {
      CFDictionaryRef v18 = sub_100046868((uint64_t)v9, v7, v11, (uint64_t)v14, 1, a2, a3);
      OSStatus v19 = SecItemUpdate(v17, v18);
      if (v19)
      {
        CFRelease(v18);
        CFDictionaryRef v20 = sub_100046868((uint64_t)v9, v7, v11, (uint64_t)v14, 0, a2, a3);
        CFDictionaryRef v18 = v20;
        if (v19 == -25300) {
          SecItemAdd(v20, 0);
        }
      }
      if (v18) {
        CFRelease(v18);
      }
    }
    else
    {
      SecItemDelete(v16);
    }
    if (v17) {
      CFRelease(v17);
    }
  }
LABEL_21:
}

void sub_1000467F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

CFDictionaryRef sub_100046868(uint64_t a1, unsigned int a2, const char *a3, uint64_t a4, int a5, char *cStr, const char *a7)
{
  unsigned int valuePtr = a2;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  *(_OWORD *)keys = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  *(_OWORD *)values = 0u;
  long long v28 = 0u;
  if (a5 != 1)
  {
    unsigned int v25 = cStr;
    CFDictionaryRef v17 = +[NSString stringWithUTF8String:a1];
    CopCGFloat y = CFStringCreateCopy(kCFAllocatorDefault, (CFStringRef)[v17 lowercaseString]);

    CFStringRef v9 = CFStringCreateWithCString(kCFAllocatorDefault, a3, 0x8000100u);
    CFNumberRef v8 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, &valuePtr);
    keys[0] = (void *)kSecAttrAuthenticationType;
    keys[1] = (void *)kSecClass;
    values[0] = (void *)kSecAttrAuthenticationTypeHTTPBasic;
    values[1] = (void *)kSecClassInternetPassword;
    *(void *)&long long v34 = kSecAttrProtocol;
    *((void *)&v34 + 1) = kSecAttrServer;
    *(void *)&long long v28 = kSecAttrProtocolIPP;
    *((void *)&v28 + 1) = Copy;
    *(void *)&long long v35 = kSecAttrPort;
    *((void *)&v35 + 1) = kSecAttrPath;
    *(void *)&long long v29 = v8;
    *((void *)&v29 + 1) = v9;
    *(void *)&long long v36 = kSecAttrAccessible;
    *((void *)&v36 + 1) = kSecAttrAccessGroup;
    *(void *)&long long v30 = kSecAttrAccessibleWhenUnlocked;
    *((void *)&v30 + 1) = @"PrintKitAccessGroup";
    if (a5 == 4)
    {
      id v11 = 0;
      *(void *)&long long v37 = kSecReturnData;
      CFDictionaryRef v18 = kCFBooleanTrue;
    }
    else
    {
      cStr = v25;
      if (a5 == 3)
      {
        id v11 = 0;
        *(void *)&long long v37 = kSecReturnAttributes;
        CFDictionaryRef v18 = kCFBooleanTrue;
        goto LABEL_10;
      }
      if (a5)
      {
        id v11 = 0;
        unsigned int v12 = 8;
        goto LABEL_12;
      }
      CFDictionaryRef v18 = (void *)CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"%s://%s:%d%s", a4, a1, valuePtr, a3);
      *(void *)&long long v37 = kSecAttrLabel;
      id v11 = v18;
    }
    cStr = v25;
LABEL_10:
    *(void *)&long long v31 = v18;
    unsigned int v12 = 9;
    goto LABEL_12;
  }
  CFNumberRef v8 = 0;
  CFStringRef v9 = 0;
  CopCGFloat y = 0;
  id v11 = 0;
  unsigned int v12 = 0;
LABEL_12:
  CFStringRef v19 = 0;
  if (cStr && a7)
  {
    CFStringRef v19 = CFStringCreateWithCString(kCFAllocatorDefault, cStr, 0x8000100u);
    size_t v20 = strlen(a7);
    CFDataRef v21 = CFDataCreate(kCFAllocatorDefault, (const UInt8 *)a7, v20 + 1);
    keys[v12] = (void *)kSecAttrAccount;
    unsigned int v22 = v12 + 1;
    values[v12] = (void *)v19;
    keys[v22] = (void *)kSecValueData;
    v12 |= 2u;
    values[v22] = v21;
  }
  else
  {
    CFDataRef v21 = 0;
  }
  CFDictionaryRef v23 = CFDictionaryCreate(kCFAllocatorDefault, (const void **)keys, (const void **)values, v12, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (Copy) {
    CFRelease(Copy);
  }
  if (v11) {
    CFRelease(v11);
  }
  if (v21) {
    CFRelease(v21);
  }
  if (v8) {
    CFRelease(v8);
  }
  if (v9) {
    CFRelease(v9);
  }
  if (v19) {
    CFRelease(v19);
  }
  return v23;
}

void sub_100046BF4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100046CEC(_Unwind_Exception *a1)
{
  BOOL v4 = v3;

  _Unwind_Resume(a1);
}

void sub_100046DA8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100046DB8(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) ubiquitousKeyValueStore];
  [v1 synchronize];
}

void sub_100046E04(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100046E6C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100046F08(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1000470AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_100047110(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  int v3 = [a2 objectForKeyedSubscript:PKPrinterUUIDKey];
  id v4 = [v2 isEqualToString:v3];

  return v4;
}

void sub_100047164(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100047294(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000472D0()
{
}

id sub_1000472D8(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  int v3 = [a2 objectForKeyedSubscript:PKPrinterUUIDKey];
  id v4 = [v2 isEqualToString:v3];

  return v4;
}

void sub_10004732C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000474D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_100047530(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  int v3 = [a2 objectForKeyedSubscript:PKPrinterUUIDKey];
  id v4 = [v2 isEqualToString:v3];

  return v4;
}

void sub_100047584(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100047728(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_100047788(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  int v3 = [a2 objectForKeyedSubscript:PKPrinterUUIDKey];
  id v4 = [v2 isEqualToString:v3];

  return v4;
}

void sub_1000477DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100047858(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100047980(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100047F04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, void *a11, void *a12, void *a13, void *a14, void *a15, void *a16, void *a17, void *a18, void *a19, void *a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,void *a30)
{
  _Unwind_Resume(a1);
}

id sub_100048074(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) isEqualToData:a2];
}

id sub_100048080(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) isEqualToString:a2];
}

__CFString *liteGetCurrentNetwork(void)
{
  uint64_t v0 = WiFiManagerClientCreate();
  if (!v0) {
    goto LABEL_12;
  }
  id v1 = (const void *)v0;
  CFArrayRef v2 = (const __CFArray *)WiFiManagerClientCopyDevices();
  CFArrayRef v3 = v2;
  if (v2)
  {
    if (CFArrayGetCount(v2) >= 1
      && (CFDataRef ValueAtIndex = CFArrayGetValueAtIndex(v3, 0)) != 0
      && (CFTypeID v5 = CFGetTypeID(ValueAtIndex), v5 == WiFiDeviceClientGetTypeID())
      && (id v6 = (const void *)WiFiDeviceClientCopyCurrentNetwork()) != 0)
    {
      WiFiNetworkGetSSID();
      unsigned int v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
      CFRelease(v6);
    }
    else
    {
      unsigned int v7 = 0;
    }
    CFRelease(v3);
  }
  else
  {
    unsigned int v7 = 0;
  }
  CFRelease(v1);
  if (!v7) {
LABEL_12:
  }
    unsigned int v7 = @"<disassociated>";

  return v7;
}

void sub_100048188(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_10004819C(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) isEqualToString:a2];
}

void sub_1000484E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17, void *a18)
{
  _Unwind_Resume(a1);
}

id liteGetPrintersForCurrentNetwork(void)
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100048C44;
  v2[3] = &unk_1000A3310;
  id v0 = (id)objc_opt_new();
  id v3 = v0;
  sub_1000489DC(v2);

  return v0;
}

void sub_10004864C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

uint64_t sub_100048664(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100048674(uint64_t a1)
{
}

void sub_10004867C(uint64_t a1, void *a2, uint64_t a3, BOOL *a4)
{
  id v7 = a2;
  uint64_t v8 = PKPrinterUUIDKey;
  id v12 = v7;
  CFStringRef v9 = [v7 objectForKeyedSubscript:PKPrinterUUIDKey];
  id v10 = [*(id *)(a1 + 32) objectForKeyedSubscript:v8];
  unsigned int v11 = [v9 isEqualToString:v10];

  if (v11) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
  *a4 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) != 0;
}

void sub_100048750(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void liteSetupDefaults(void)
{
  Boolean keyExistsAndHasValidFormat = 0;
  *(void *)id v6 = 0x500000006;
  unsigned int v4 = 0;
  size_t v3 = 4;
  GSInitialize();
  if (CFPreferencesGetAppBooleanValue(@"PrintKitPreserveJobFiles", @".GlobalPreferences", &keyExistsAndHasValidFormat))
  {
    PreserveJobFiles = 1;
  }
  if (CFPreferencesGetAppBooleanValue(@"PrintKitPreserveControlFiles", @".GlobalPreferences", &keyExistsAndHasValidFormat))
  {
    PreserveControlFiles = 1;
  }
  id v0 = objc_alloc_init(PKiCloudDataController);
  id v1 = (void *)iCloudDataController;
  iCloudDataController = (uint64_t)v0;

  if (sysctl(v6, 2u, &v4, &v3, 0, 0))
  {
    unsigned int v4 = 0x7FFFFFFF;
    LODWORD(v2) = 429496729;
  }
  else
  {
    LODWORD(v2) = v4 / 5;
  }
  if (v2 >= 0x8000000) {
    uint64_t v2 = 0x8000000;
  }
  else {
    uint64_t v2 = v2;
  }
  MaxImageMemorCGFloat y = v2;
  MaxRenderMemorCGFloat y = 37748736;
  MaxProcessingJobs = 1;
  liteNotifyRunning(1);
  quantized_notify_post(2u);
}

void quantized_notify_post(unsigned int a1)
{
  if (qword_1000C8B78 != -1) {
    dispatch_once(&qword_1000C8B78, &stru_1000A33A0);
  }
  uint64_t v2 = _PKLogCategory(PKLogCategoryDefault[0]);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3[0] = 67109120;
    v3[1] = a1;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "quantized_notify issue: 0x%x", (uint8_t *)v3, 8u);
  }

  dispatch_source_merge_data((dispatch_source_t)qword_1000C8B70, a1);
}

void sub_1000489DC(void *a1)
{
  id v1 = a1;
  uint64_t v2 = +[NSUserDefaults standardUserDefaults];
  size_t v3 = [v2 dictionaryForKey:@"_per_network_printers"];

  if (!v3)
  {
    size_t v3 = +[NSDictionary dictionary];
  }
  unsigned int v4 = liteGetCurrentNetwork();
  uint64_t v5 = [v3 objectForKeyedSubscript:v4];
  id v6 = &__NSArray0__struct;
  if (v5) {
    id v6 = (void *)v5;
  }
  id v7 = v6;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100049D78;
  v14[3] = &unk_1000A33E8;
  id v8 = (id)objc_opt_new();
  id v15 = v8;
  [v7 enumerateObjectsUsingBlock:v14];

  CFStringRef v9 = v1[2](v1, v4, v8);
  id v10 = v9;
  if (!v9 || ([v9 isEqualToArray:v7] & 1) == 0)
  {
    id v11 = [v3 mutableCopy];
    id v12 = v11;
    if (v10) {
      [v11 setObject:v10 forKey:v4];
    }
    else {
      [v11 removeObjectForKey:v4];
    }
    id v13 = +[NSUserDefaults standardUserDefaults];
    [v13 setObject:v12 forKey:@"_per_network_printers"];
  }
}

void sub_100048BB0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_100048C44(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  [*(id *)(a1 + 32) setNetworkName:v5];
  [*(id *)(a1 + 32) setPrinters:v6];

  return v6;
}

void sub_100048CB0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void liteAddPrinterForCurrentNetwork(NSDictionary *a1)
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100048D68;
  v2[3] = &unk_1000A3310;
  size_t v3 = a1;
  id v1 = v3;
  sub_1000489DC(v2);
}

void sub_100048D50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

id sub_100048D68(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  [*(id *)(a1 + 32) objectForKeyedSubscript:PKPrinterUUIDKey];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100048EF8;
  void v12[3] = &unk_1000A3270;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  id v13 = v5;
  id v6 = [v4 indexesOfObjectsPassingTest:v12];
  id v7 = [v4 mutableCopy];
  [v7 removeObjectsAtIndexes:v6];
  [v7 insertObject:*(void *)(a1 + 32) atIndex:0];
  id v8 = v7;
  if ((unint64_t)[v8 count] > 3)
  {
    objc_msgSend(v8, "subarrayWithRange:", 0, 3);
    id v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v9 = v8;
  }
  id v10 = v9;

  return v10;
}

void sub_100048EAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

id sub_100048EF8(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  size_t v3 = [a2 objectForKeyedSubscript:PKPrinterUUIDKey];
  id v4 = [v2 isEqualToString:v3];

  return v4;
}

void sub_100048F4C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id liteGetiCloudPrinters(void)
{
  return [(id)iCloudDataController getiCloudPrintersList];
}

id liteResetPKCloudData(void)
{
  return [(id)iCloudDataController resetiCloudData];
}

id liteSetiCloudPrinters(NSArray *a1)
{
  return [(id)iCloudDataController setiCloudPrintersList:a1];
}

id liteAddPrinterToiCloudWithInfo(NSDictionary *a1)
{
  return [(id)iCloudDataController addPrinterToiCloudWithInfo:a1];
}

id liteRemovePrinterFromiCloudWithInfo(NSDictionary *a1)
{
  return [(id)iCloudDataController removePrinterFromiCloudWithInfo:a1];
}

id liteUpdateiCloudPrinterDisplayName(NSDictionary *a1, NSString *a2)
{
  return [(id)iCloudDataController updateiCloudPrinter:a1 newDisplayName:a2];
}

id liteUpdateiCloudPrinterLocation(NSDictionary *a1, NSString *a2)
{
  return [(id)iCloudDataController updateiCloudPrinter:a1 newLocation:a2];
}

id liteLogiCloudPrinters(void)
{
  return objc_msgSend((id)iCloudDataController, "log_iCloudPrinters");
}

void sub_1000490E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000492B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000493FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

BOOL sub_10004943C(uint64_t a1, int a2)
{
  if (!sub_1000494DC(a2, *(void **)(a1 + 32)) || !sub_1000494DC(a2, *(void **)(a1 + 40))) {
    return 0;
  }
  unint64_t v4 = (unint64_t)"\n";
  do
  {
    BOOL v5 = v4 >= (unint64_t)"";
    if (v4 >= (unint64_t)"") {
      break;
    }
    ssize_t v6 = write(a2, (const void *)v4, (size_t)&asc_10008524B[-v4 + 1]);
    v4 += v6;
  }
  while (v6 > 0);
  return v5;
}

BOOL sub_1000494DC(int a1, void *a2)
{
  id v3 = a2;
  unint64_t v4 = (const char *)[v3 UTF8String];
  BOOL v5 = &v4[strlen(v4)];
  do
  {
    ssize_t v6 = v4;
    if (v4 >= v5) {
      break;
    }
    ssize_t v7 = write(a1, v4, v5 - v4);
    v4 += v7;
  }
  while (v7 > 0);

  return v6 >= v5;
}

void sub_100049560(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100049600(id a1)
{
  id v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v1 = dispatch_queue_create("com.apple.printing.IPPControlLogging", v3);
  uint64_t v2 = (void *)qword_1000C8B60;
  qword_1000C8B60 = (uint64_t)v1;
}

void sub_100049740(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, void *a15)
{
  _Unwind_Resume(a1);
}

void sub_10004976C(uint64_t a1)
{
  uint64_t v2 = *(unsigned int *)(a1 + 56);
  id v3 = [*(id *)(a1 + 32) debugDescription];
  id v4 = +[NSString stringWithFormat:@"Request (%d): %@", v2, v3];

  [*(id *)(a1 + 40) _now:*(void *)(a1 + 48) appendString:v4];
}

void sub_1000497F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_1000498F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, void *a15)
{
  _Unwind_Resume(a1);
}

void sub_10004991C(uint64_t a1)
{
  uint64_t v2 = *(unsigned int *)(a1 + 56);
  id v3 = [*(id *)(a1 + 32) debugDescription];
  id v4 = +[NSString stringWithFormat:@"Response (%d): %@", v2, v3];

  [*(id *)(a1 + 40) _now:*(void *)(a1 + 48) appendString:v4];
}

void sub_1000499A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_100049AA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, void *a15)
{
  _Unwind_Resume(a1);
}

void sub_100049ACC(uint64_t a1)
{
  id v2 = +[NSString stringWithFormat:@"Response Failure (%d): %@", *(unsigned int *)(a1 + 56), *(void *)(a1 + 32)];
  objc_msgSend(*(id *)(a1 + 40), "_now:appendString:", *(void *)(a1 + 48));
}

void sub_100049B3C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  _Unwind_Resume(a1);
}

void sub_100049C00(id a1)
{
  dispatch_queue_t v1 = dispatch_get_global_queue(-32768, 0);
  dispatch_source_t v2 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_data_or, 0, 0, v1);
  id v3 = (void *)qword_1000C8B70;
  qword_1000C8B70 = (uint64_t)v2;

  dispatch_source_set_event_handler((dispatch_source_t)qword_1000C8B70, &stru_1000A33C0);
  id v4 = qword_1000C8B70;

  dispatch_activate(v4);
}

void sub_100049C80(id a1)
{
  uintptr_t data = dispatch_source_get_data((dispatch_source_t)qword_1000C8B70);
  dispatch_source_t v2 = _PKLogCategory(PKLogCategoryDefault[0]);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 134217984;
    uintptr_t v4 = data;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "quantized_notify drain: 0x%lx", (uint8_t *)&v3, 0xCu);
  }

  if ((data & 4) != 0)
  {
    notify_post("com.apple.printd.job-progress");
    if ((data & 2) == 0)
    {
LABEL_5:
      if ((data & 1) == 0) {
        return;
      }
      goto LABEL_6;
    }
  }
  else if ((data & 2) == 0)
  {
    goto LABEL_5;
  }
  notify_post("com.apple.printd.job-list");
  if ((data & 1) == 0) {
    return;
  }
LABEL_6:
  notify_post("com.apple.printd.printer-reasons-changed");
}

void sub_100049D78(uint64_t a1, void *a2)
{
  id v10 = a2;
  int v3 = [v10 objectForKeyedSubscript:@"printer-dns-sd-name"];
  uintptr_t v4 = [v3 lowercaseString];

  if ((unint64_t)[v4 length] >= 5)
  {
    if (([v4 hasPrefix:@"ipp:"] & 1) != 0
      || [v4 hasPrefix:@"ipps:"])
    {
      BOOL v5 = PKURLWithString(v4);

      if (!v5) {
        goto LABEL_16;
      }
LABEL_15:
      [*(id *)(a1 + 32) addObject:v10];
      goto LABEL_16;
    }
    if ([v4 characterAtIndex:0] != 60
      || [v4 containsString:@"ipp"])
    {
      if (![v4 containsString:@"_ipp."]
        || ([v4 containsString:@"_ipps."] & 1) == 0)
      {
        ssize_t v6 = [v10 objectForKeyedSubscript:PKPrinterEndpointKey];
        if (v6)
        {
          ssize_t v7 = +[PKPrinterBonjourEndpoint endpointWithData:v6];
          id v8 = [v7 persistentNameRepresentationForPrintKitUI];
          if ([v8 length])
          {
            id v9 = [v10 mutableCopy];
            [v9 setObject:v8 forKeyedSubscript:PKPrinterNameKey];

            id v10 = v9;
          }
        }
      }
      goto LABEL_15;
    }
  }
LABEL_16:
}

void sub_100049F28(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

CGFloat _lite_page_transform@<D0>(CGRect a1@<0:D0, 8:D1, 16:D2, 24:D3>, unint64_t a2@<X0>, unint64_t a3@<X1>, int a4@<W2>, int a5@<W3>, int a6@<W4>, uint64_t a7@<X8>)
{
  CGFloat height = a1.size.height;
  CGFloat width = a1.size.width;
  CGFloat y = a1.origin.y;
  CGFloat x = a1.origin.x;
  if (a6) {
    unint64_t v16 = a3;
  }
  else {
    unint64_t v16 = a2;
  }
  double v17 = (double)v16 * -0.5;
  if (a6) {
    unint64_t v18 = a2;
  }
  else {
    unint64_t v18 = a3;
  }
  CGAffineTransformMakeTranslation(&v47, v17, (double)v18 * -0.5);
  switch(a4)
  {
    case 2:
      v48.double a = 0.0;
      v48.double b = 0.0;
      double a = -1.0;
      double d = 1.0;
      goto LABEL_12;
    case 3:
      v48.double a = 0.0;
      v48.double b = 0.0;
      double d = -1.0;
      double b = 0.0;
      double c = 0.0;
      double a = -1.0;
      break;
    case 4:
      v48.double a = 0.0;
      v48.double b = 0.0;
      double a = 1.0;
      double d = -1.0;
LABEL_12:
      double b = 0.0;
      double c = 0.0;
      break;
    case 5:
      v48.double a = 0.0;
      v48.double b = 0.0;
      double d = 0.0;
      double b = -1.0;
      double c = -1.0;
      goto LABEL_17;
    case 6:
      v48.double a = 0.0;
      v48.double b = 0.0;
      double d = 0.0;
      double c = 1.0;
      double b = -1.0;
      goto LABEL_17;
    case 7:
      v48.double a = 0.0;
      v48.double b = 0.0;
      double d = 0.0;
      double b = 1.0;
      double c = 1.0;
      goto LABEL_17;
    case 8:
      v48.double a = 0.0;
      v48.double b = 0.0;
      double d = 0.0;
      double c = -1.0;
      double b = 1.0;
LABEL_17:
      double a = 0.0;
      break;
    default:
      double a = CGAffineTransformIdentity.a;
      double b = CGAffineTransformIdentity.b;
      double c = CGAffineTransformIdentity.c;
      double d = CGAffineTransformIdentity.d;
      *(_OWORD *)&v48.double a = *(_OWORD *)&CGAffineTransformIdentity.tx;
      break;
  }
  long long v49 = *(_OWORD *)&v48.a;
  if (a5 == 1 || a5 == -1)
  {
    memset(&v48, 0, sizeof(v48));
    CGAffineTransformMakeRotation(&v48, (double)a5 * 3.14159265 * 0.5);
    t1.double a = a;
    t1.double b = b;
    t1.double c = c;
    t1.double d = d;
    *(_OWORD *)&t1.tCGFloat x = v49;
    CGAffineTransform t2 = v48;
    CGAffineTransformConcat(&v46, &t1, &t2);
    CGFloat v23 = v46.c;
    CGFloat v34 = v46.a;
    CGFloat v35 = v46.b;
    CGFloat v36 = v46.d;
    long long v49 = *(_OWORD *)&v46.tx;
  }
  else
  {
    CGFloat v35 = b;
    CGFloat v36 = d;
    CGFloat v34 = a;
    CGFloat v23 = c;
  }
  v50.origin.CGFloat x = x;
  v50.origin.CGFloat y = y;
  v50.size.CGFloat width = width;
  v50.size.CGFloat height = height;
  double MinX = CGRectGetMinX(v50);
  v51.origin.CGFloat x = x;
  v51.origin.CGFloat y = y;
  v51.size.CGFloat width = width;
  v51.size.CGFloat height = height;
  double MinY = CGRectGetMinY(v51);
  v52.origin.CGFloat x = x;
  v52.origin.CGFloat y = y;
  v52.size.CGFloat width = width;
  v52.size.CGFloat height = height;
  double v26 = CGRectGetWidth(v52);
  v53.origin.CGFloat x = x;
  v53.origin.CGFloat y = y;
  v53.size.CGFloat width = width;
  v53.size.CGFloat height = height;
  double v27 = CGRectGetHeight(v53);
  double v28 = v26 / (double)a2;
  if (v28 >= v27 / (double)a3) {
    double v28 = v27 / (double)a3;
  }
  CGAffineTransformMakeScale(&v48, v28, v28);
  CGAffineTransformMakeTranslation(&v46, MinX + v26 * 0.5, MinY + v27 * 0.5);
  CGAffineTransform v43 = v47;
  v42.double a = v34;
  v42.double b = v35;
  v42.double c = v23;
  v42.double d = v36;
  *(_OWORD *)&v42.tCGFloat x = v49;
  CGAffineTransformConcat((CGAffineTransform *)a7, &v43, &v42);
  long long v29 = *(_OWORD *)(a7 + 16);
  *(_OWORD *)&v40.double a = *(_OWORD *)a7;
  *(_OWORD *)&v40.double c = v29;
  *(_OWORD *)&v40.tCGFloat x = *(_OWORD *)(a7 + 32);
  CGAffineTransform v39 = v48;
  CGAffineTransformConcat(&v41, &v40, &v39);
  long long v30 = *(_OWORD *)&v41.c;
  *(_OWORD *)a7 = *(_OWORD *)&v41.a;
  *(_OWORD *)(a7 + 16) = v30;
  *(_OWORD *)(a7 + 32) = *(_OWORD *)&v41.tx;
  long long v31 = *(_OWORD *)(a7 + 16);
  *(_OWORD *)&v38.double a = *(_OWORD *)a7;
  *(_OWORD *)&v38.double c = v31;
  *(_OWORD *)&v38.tCGFloat x = *(_OWORD *)(a7 + 32);
  CGAffineTransform v37 = v46;
  CGAffineTransformConcat(&v41, &v38, &v37);
  long long v32 = *(_OWORD *)&v41.c;
  *(_OWORD *)a7 = *(_OWORD *)&v41.a;
  *(_OWORD *)(a7 + 16) = v32;
  CGFloat result = v41.tx;
  *(_OWORD *)(a7 + 32) = *(_OWORD *)&v41.tx;
  return result;
}

void _liteDrawImageToSheet(CGContext *a1, CGImageRef image, int a3, CGSize a4, CGRect a5)
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  double v9 = a4.height;
  double v10 = a4.width;
  unsigned int v14 = CGImageGetWidth(image);
  unsigned int v15 = CGImageGetHeight(image);
  int v16 = v15;
  if (x <= v10 - (x + width)) {
    double v17 = v10 - (x + width);
  }
  else {
    double v17 = x;
  }
  if (v9 - (y + height) <= y) {
    double v18 = y;
  }
  else {
    double v18 = v9 - (y + height);
  }
  if (a3 <= 4) {
    unint64_t v19 = v14;
  }
  else {
    unint64_t v19 = v15;
  }
  if (a3 <= 4) {
    unint64_t v20 = v15;
  }
  else {
    unint64_t v20 = v14;
  }
  double v21 = (double)(int)v20;
  double v22 = (double)(int)v19;
  BOOL v23 = v10 > v9 && v22 < v21;
  if (v23 || v10 < v9 && v22 > v21)
  {
    double v24 = v17;
    double v25 = v10;
  }
  else
  {
    double v24 = v18;
    double v18 = v17;
    double v25 = v9;
    double v9 = v10;
  }
  if (v18 == 0.0 && v24 == 0.0 && v20 < 2 * v19 && 2 * v20 > v19 && (v9 >= v22 ? (BOOL v26 = v25 < v21) : (BOOL v26 = 1), !v26))
  {
    int v27 = 1;
    double v28 = v9;
    double v29 = v25;
  }
  else
  {
    int v27 = 0;
    double v28 = v9 - v18 - v18;
    double v29 = v25 - v24 - v24;
  }
  double v30 = v28 / v22;
  double v31 = v29 / v21;
  if (v30 <= v31) {
    double v32 = v31;
  }
  else {
    double v32 = v30;
  }
  if (v30 >= v31) {
    double v30 = v31;
  }
  if (v27) {
    double v30 = v32;
  }
  CGFloat v33 = (v9 - v22 * v30) * 0.5;
  CGFloat v34 = (v25 - v21 * v30) * 0.5;
  CGFloat v35 = v30 * v22;
  CGFloat v36 = v30 * v21;
  CGContextSaveGState(a1);
  v38.origin.double x = v33;
  v38.origin.double y = v34;
  v38.size.double width = v35;
  v38.size.double height = v36;
  _lite_page_transform(v38, v19, v20, a3, 0, a3 > 4, (uint64_t)&v37);
  CGContextConcatCTM(a1, &v37);
  v39.size.double width = (double)(int)v14;
  v39.size.double height = (double)v16;
  v39.origin.double x = 0.0;
  v39.origin.double y = 0.0;
  CGContextDrawImage(a1, v39, image);
  CGContextRestoreGState(a1);
}

uint64_t liteFigureOutDriverSetupInfo(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  ssize_t v6 = *(void **)(a2 + 2040);
  *(void *)(a2 + 2040) = @"application/octet-stream";

  CGAffineTransform v47 = v5;
  if (!v5)
  {
    BOOL v10 = 0;
    BOOL v8 = 0;
    unsigned int v12 = 0;
LABEL_31:
    int v25 = 0;
    *(void *)(a2 + 2020) = 0x2580000012CLL;
    *(unsigned char *)(a2 + 120) |= 3u;
    *(int32x4_t *)(a2 + 972) = vdupq_n_s32(0x27Bu);
    *(_OWORD *)(a2 + 988) = xmmword_10006ED70;
    *(_DWORD *)(a2 + 128) = 1;
    *(_OWORD *)(a2 + 1988) = xmmword_10006ED80;
LABEL_32:
    *(void *)a1 |= *(void *)(a2 + 120);
    objc_storeStrong((id *)(a1 + 32), *(id *)(a2 + 2040));
    uint64_t v26 = objc_opt_new();
    int v27 = *(void **)(a1 + 8);
    *(void *)(a1 + 8) = v26;

    [*(id *)(a1 + 8) addObject:@"application/octet-stream"];
    [*(id *)(a1 + 8) addObjectsFromArray:*(void *)(a1 + 16)];
    int v28 = v25 ^ 1;
    if ((([*(id *)(a1 + 8) containsObject:@"application/pdf"] | v25 ^ 1 | v8) & 1) == 0) {
      [*(id *)(a1 + 8) addObject:@"application/pdf"];
    }
    if (((objc_msgSend(*(id *)(a1 + 8), "containsObject:", @"image/jpeg", v42, v43) | v28 | v10) & 1) == 0) {
      [*(id *)(a1 + 8) addObject:@"image/jpeg"];
    }
    if ((([*(id *)(a1 + 8) containsObject:@"image/png"] | v28 | v12) & 1) == 0) {
      [*(id *)(a1 + 8) addObject:@"image/png"];
    }
    if ((v25 & ([*(id *)(a1 + 8) containsObject:@"image/urf"] ^ 1)) == 1) {
      [*(id *)(a1 + 8) addObject:@"image/urf"];
    }
    int v29 = *(_DWORD *)(a2 + 1508);
    if (v29 >= 21590)
    {
      int v30 = *(_DWORD *)(a2 + 1512);
      if (v30 < 27940)
      {
LABEL_44:
        if (v30 >= 15240) {
          *(_DWORD *)(a2 + 988) = 5;
        }
      }
    }
    else if (v29 >= 10160)
    {
      int v30 = *(_DWORD *)(a2 + 1512);
      goto LABEL_44;
    }
    if (*(int *)(a2 + 140) < 1)
    {
LABEL_68:
      if (*(_DWORD *)(a2 + 548))
      {
        CGFloat v36 = objc_opt_new();
        if (*(int *)(a2 + 548) >= 1)
        {
          uint64_t v37 = 0;
          do
          {
            CGRect v38 = +[NSString stringWithUTF8String:(&MediaSourceStrings)[*(unsigned int *)(a2 + 752 + 4 * v37)]];
            [v36 addObject:v38];

            ++v37;
          }
          while (v37 < *(int *)(a2 + 548));
        }
        CGRect v39 = *(NSObject **)(a1 + 24);
        *(void *)(a1 + 24) = v36;
      }
      else
      {
        CGRect v39 = *(NSObject **)(a1 + 24);
        *(void *)(a1 + 24) = &off_1000B8F50;
      }
      uint64_t v40 = 1;
      goto LABEL_75;
    }
    uint64_t v31 = 0;
    while (1)
    {
      int v32 = *(_DWORD *)(a2 + 144 + 4 * v31);
      if ((v32 & 0xFFFFFFFC) == 0x14 || ((v32 - 28) >= 8 ? (BOOL v33 = v32 == 4) : (BOOL v33 = 1), v33))
      {
        char v34 = 64;
      }
      else if (v32 != 5 && (v32 - 70) >= 0x14)
      {
        if (v32 == 6)
        {
          char v34 = 16;
        }
        else
        {
          if (v32 != 7 && (v32 - 50) > 3) {
            goto LABEL_56;
          }
          char v34 = 8;
        }
      }
      else
      {
        char v34 = 32;
      }
      *(unsigned char *)a1 |= v34;
LABEL_56:
      if (++v31 >= *(int *)(a2 + 140)) {
        goto LABEL_68;
      }
    }
  }
  ssize_t v7 = [v5 objectForKey:@"TEST-NO-PDF"];
  BOOL v8 = v7 != 0;

  double v9 = [v5 objectForKey:@"TEST-NO-JPEG"];
  BOOL v10 = v9 != 0;

  id v11 = [v5 objectForKey:@"TEST-NO-PNG"];
  unsigned int v12 = v11 != 0;

  id v13 = [v5 objectForKeyedSubscript:@"COMMAND SET"];
  if (v13)
  {
    id v14 = v13;
  }
  else
  {
    id v14 = [v5 objectForKeyedSubscript:@"CMD"];
    if (!v14)
    {
      CGAffineTransform v46 = +[NSArray array];
      id v14 = 0;
      id v15 = [v46 count];
      goto LABEL_7;
    }
  }
  CGAffineTransform v46 = [v14 componentsSeparatedByString:@","];

  id v15 = [v46 count];
LABEL_7:
  if (!v15)
  {

    goto LABEL_31;
  }
  uint64_t v16 = objc_opt_new();
  BOOL v44 = v8;
  double v17 = *(void **)(a1 + 16);
  *(void *)(a1 + 16) = v16;

  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id v18 = v46;
  int v45 = v14;
  id v19 = [v18 countByEnumeratingWithState:&v49 objects:v53 count:16];
  unint64_t v42 = __PAIR64__(v12, v10);
  uint64_t v43 = a2;
  unint64_t v20 = 0;
  if (!v19) {
    goto LABEL_27;
  }
  uint64_t v21 = *(void *)v50;
  do
  {
    for (unint64_t i = 0; i != v19; unint64_t i = (char *)i + 1)
    {
      if (*(void *)v50 != v21) {
        objc_enumerationMutation(v18);
      }
      BOOL v23 = *(void **)(*((void *)&v49 + 1) + 8 * i);
      if (!objc_msgSend(v23, "caseInsensitiveCompare:", @"URF", v42, v43))
      {
        unint64_t v20 = liteInitURF;
        [*(id *)(a1 + 16) addObject:@"image/urf"];
        continue;
      }
      if (![v23 caseInsensitiveCompare:@"PDF"])
      {
        CFStringRef v24 = @"application/pdf";
LABEL_24:
        [*(id *)(a1 + 16) addObject:v24];
        continue;
      }
      if (![v23 caseInsensitiveCompare:@"JPEG"])
      {
        CFStringRef v24 = @"image/jpeg";
        goto LABEL_24;
      }
      if (![v23 caseInsensitiveCompare:@"PNG"])
      {
        CFStringRef v24 = @"image/png";
        goto LABEL_24;
      }
      if ([v23 caseInsensitiveCompare:@"application/octet-stream"]
        && [v23 containsString:@"/"])
      {
        [*(id *)(a1 + 16) addObject:v23];
      }
    }
    id v19 = [v18 countByEnumeratingWithState:&v49 objects:v53 count:16];
  }
  while (v19);
LABEL_27:

  a2 = v43;
  BOOL v10 = v42;
  unsigned int v12 = HIDWORD(v42);
  BOOL v8 = v44;

  if (!v20) {
    goto LABEL_31;
  }
  if (((unsigned int (*)(void *, uint64_t, uint64_t))v20)(v47, v43, 1))
  {
    int v25 = 1;
    goto LABEL_32;
  }
  CGRect v39 = _PKLogCategory(PKLogCategoryProgress[0]);
  if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_ERROR, "Driver initialization failed.", buf, 2u);
  }
  uint64_t v40 = 0;
LABEL_75:

  return v40;
}

void sub_10004ABB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void liteSetupDriverInfoFromDeviceIDs(lite_driver_s *a1, NSDictionary *a2)
{
  id v5 = 0;
  *(_OWORD *)int v3 = 0u;
  long long v4 = 0u;
  liteFigureOutDriverSetupInfo((uint64_t)v3, (uint64_t)a1, a2);

  id v2 = v3[1];
}

void sub_10004ACD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, id a9)
{
}

id *sub_10004ACE4(id *a1)
{
  return a1;
}

void sub_10004ADA4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10004AED8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10004AFD8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10004B128(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10004B384(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  _Unwind_Resume(a1);
}

void sub_10004B3DC(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v12 = a2;
  id v7 = a3;
  BOOL v8 = a4;
  double v9 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained(v9);

  if (WeakRetained)
  {
    id v11 = objc_loadWeakRetained(v9);
    [v11 passwordChallenge:v12 request:v7 completionHandler:v8];
  }
  else
  {
    v8[2](v8, 0);
  }
}

void sub_10004B498(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10004B4C4(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  ssize_t v6 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained(v6);

  if (WeakRetained)
  {
    id v8 = objc_loadWeakRetained(v6);
    id v9 = [v8 trustChallengeWithTrust:v10];
  }
  else
  {
    id v9 = 0;
  }
  v5[2](v5, v9);
}

void sub_10004B570(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10004B768(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10004B95C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_10004B99C(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (a2 == 1)
  {
    ssize_t v6 = _PKLogCategory(PKLogCategoryNetwork[0]);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v10 = 134217984;
      uint64_t v11 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "device_http<%p>: External auth handler deferred", (uint8_t *)&v10, 0xCu);
    }

    [*(id *)(a1 + 32) passwordChallengeContinue:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 48)];
  }
  else
  {
    id v8 = _PKLogCategory(PKLogCategoryNetwork[0]);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      int v10 = 134218240;
      uint64_t v11 = v9;
      __int16 v12 = 2048;
      id v13 = v5;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "device_http<%p>: External auth handler provided %p", (uint8_t *)&v10, 0x16u);
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void sub_10004BAF4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10004BE34(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  _Unwind_Resume(a1);
}

void sub_10004BED8(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));

  if (WeakRetained)
  {
    id v4 = objc_loadWeakRetained((id *)(a1 + 40));
    [v4 _rememberCredentialSent:v5];
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10004BF68(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10004C030(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10004C150(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10004C31C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);

  sub_10000F138((uint64_t)va);
  _Unwind_Resume(a1);
}

id sub_10004C374(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    id v2 = [*(id *)(a1 + 8) _descriptionLeader];
    int v3 = +[NSString stringWithFormat:@"%@: %@", v2, *(void *)(a1 + 16)];
  }
  else
  {
    int v3 = [*(id *)(a1 + 8) _descriptionLeader];
  }

  return v3;
}

void sub_10004C410(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10004C5B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, void *a8, ...)
{
  va_start(va, a8);

  sub_10000F138((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_10004C604(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 description];
  id v5 = _PKLogCategory(PKLogCategoryNetwork[0]);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 134218242;
    uint64_t v8 = v6;
    __int16 v9 = 2114;
    int v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "device_http<%p>: Received response async: %{public}@", (uint8_t *)&v7, 0x16u);
  }

  [*(id *)(a1 + 32) storeCredentialBasedOnTransactionResult:v3];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_10004C708(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10004C9A8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);

  sub_10000F138((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_10004CD3C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10004CDE8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

unsigned char *sub_10004CF0C(const char *a1, char *__s, unsigned char *a3)
{
  size_t v6 = strlen(__s);
  while (1)
  {
    uint64_t v7 = *(unsigned __int8 *)a1;
    if ((*a1 & 0x80000000) == 0) {
      break;
    }
    if (__maskrune(v7, 0x4000uLL)) {
      goto LABEL_31;
    }
LABEL_6:
    if (!*a1) {
      goto LABEL_31;
    }
    ++a1;
  }
  if ((_DefaultRuneLocale.__runetype[v7] & 0x4000) == 0) {
    goto LABEL_6;
  }
LABEL_31:
  while (2)
  {
    unsigned __int8 v8 = *a1;
    if (!*a1)
    {
LABEL_32:
      uint64_t v16 = a3;
      a3 = 0;
      goto LABEL_33;
    }
    while (2)
    {
      if ((v8 & 0x80) != 0)
      {
        if (!__maskrune(v8, 0x4000uLL)) {
          goto LABEL_13;
        }
LABEL_8:
        unsigned __int8 v9 = *++a1;
        unsigned __int8 v8 = v9;
        continue;
      }
      break;
    }
    if ((_DefaultRuneLocale.__runetype[v8] & 0x4000) != 0) {
      goto LABEL_8;
    }
LABEL_13:
    int v10 = *(unsigned __int8 *)a1;
    if (v10 == 44) {
      goto LABEL_8;
    }
    if (strncmp(a1, __s, v6) || a1[v6] != 61)
    {
      int v11 = 0;
      if ((v10 & 0x80) != 0) {
        goto LABEL_19;
      }
      while ((_DefaultRuneLocale.__runetype[v10] & 0x4000) == 0)
      {
        while (1)
        {
          int v12 = *(unsigned __int8 *)a1;
          if (v12 == 34)
          {
            do
            {
              int v14 = *(unsigned __int8 *)++a1;
              int v13 = v14;
            }
            while (v14 && v13 != 34);
          }
          else if (v12 == 61)
          {
            int v11 = 1;
          }
          else if (!*a1)
          {
            goto LABEL_30;
          }
          char v15 = *++a1;
          LOBYTE(v10) = v15;
          if ((v15 & 0x80) == 0) {
            break;
          }
LABEL_19:
          if (__maskrune(v10, 0x4000uLL)) {
            goto LABEL_30;
          }
        }
      }
LABEL_30:
      if (!v11) {
        goto LABEL_32;
      }
      continue;
    }
    break;
  }
  id v18 = &a1[v6 + 1];
  int v19 = *(unsigned __int8 *)v18;
  if (*v18)
  {
    if (v19 == 34)
    {
      unint64_t v20 = 0;
      while (1)
      {
        int v22 = *(unsigned __int8 *)++v18;
        int v21 = v22;
        if (!v22 || v21 == 34) {
          break;
        }
        if (v20 <= 0x7E) {
          a3[v20++] = v21;
        }
      }
      uint64_t v16 = &a3[v20];
    }
    else
    {
      uint64_t v23 = 0;
      size_t v24 = v6 + 2;
      uint64_t v16 = a3;
      do
      {
        if (!memchr("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-._~+/=", (char)v19, 0x46uLL)) {
          break;
        }
        if (v23 <= 126)
        {
          ++v23;
          *uint64_t v16 = v19;
        }
        int v19 = a1[v24];
        uint64_t v16 = &a3[v23];
        ++v24;
      }
      while (v19);
    }
  }
  else
  {
    uint64_t v16 = a3;
  }
LABEL_33:
  *uint64_t v16 = 0;
  return a3;
}

void *sub_10004D114(void *a1, uint64_t a2)
{
  *a1 = off_100095638;
  a1[1] = 0;
  a1[2] = 0;
  id v4 = (id *)(a1 + 2);
  id v5 = [*(id *)(a2 + 8) copy];
  size_t v6 = (void *)a1[1];
  a1[1] = v5;

  objc_storeStrong(v4, *(id *)(a2 + 16));
  return a1;
}

void sub_10004D190(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10004D42C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
  objc_destroyWeak(v25);
  objc_destroyWeak(v24);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_10004D47C(uint64_t a1)
{
  dispatch_assert_queue_not_V2((dispatch_queue_t)&_dispatch_main_q);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _interrupted];
}

void sub_10004D4D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10004D4E8(uint64_t a1)
{
  dispatch_assert_queue_not_V2((dispatch_queue_t)&_dispatch_main_q);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _invalidated];
}

void sub_10004D540(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10004DB40(_Unwind_Exception *a1)
{
  id v5 = v3;

  _Unwind_Resume(a1);
}

void sub_10004DCF8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10004DF34(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14, void *a15, uint64_t a16, id location)
{
  objc_destroyWeak(v22);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_10004DF9C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));

  if (v3 && WeakRetained)
  {
    id v5 = objc_loadWeakRetained((id *)(a1 + 56));
    [v5 startStreamingRequestWithPrinter:v3 printSettings:*(void *)(a1 + 32) completionHandler:*(void *)(a1 + 48)];
  }
  else
  {
    size_t v6 = _PKLogCategory(PKLogCategoryProgress[0]);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = *(void *)(a1 + 40);
      int v8 = 138543362;
      uint64_t v9 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "Can't find printer from endpoint %{public}@", (uint8_t *)&v8, 0xCu);
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void sub_10004E0B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10004E1F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10004E588(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, _Unwind_Exception *exception_object, void *a10, void *a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17)
{
  sub_100014B1C(&a17);
  _Unwind_Resume(a1);
}

void sub_10004E7C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10004E944(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10004EAF0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10004EC34(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10004EDEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_10004EE38(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    id v3 = [objc_alloc((Class)PKPrinterBrowseInfo) initWithResolvedBonjourName:v4];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void sub_10004EEC8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10004EFE0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10004F0D4(_Unwind_Exception *a1)
{
  id v5 = v4;

  _Unwind_Resume(a1);
}

void sub_10004F198(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10004F258(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10004F300(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10004F39C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10004F438(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10004F4F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10004F5AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10004F6E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10004F884(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_10004F8C4(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    id v3 = [*(id *)(a1 + 32) ippNetworkingSession];
    [v4 checkAccessWithSession:v3 completionHandler:*(void *)(a1 + 40)];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void sub_10004F948(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10004FB0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_10004FB58(uint64_t a1, void *a2)
{
  id v4 = a2;
  id v3 = [*(id *)(a1 + 32) ippNetworkingSession];
  [v4 identifyPrinterWithSession:v3 message:*(void *)(a1 + 40) actions:*(void *)(a1 + 48)];
}

void sub_10004FBC0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10004FD64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15)
{
  _Unwind_Resume(a1);
}

void sub_10004FDA4(uint64_t a1, void *a2)
{
  id v5 = a2;
  if (v5)
  {
    id v3 = *(void **)(a1 + 32);
    if (*(unsigned char *)(a1 + 48))
    {
      id v4 = [v3 ippNetworkingSession];
      [v5 forceRefreshCurrentDescriptionForSession:v4 completionHandler:*(void *)(a1 + 40)];
    }
    else
    {
      id v4 = [v3 ippNetworkingSession];
      [v5 refreshCurrentDescriptionForSession:v4 completionHandler:*(void *)(a1 + 40)];
    }
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void sub_10004FE54(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100050098(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17, void *a18, uint64_t a19, void *a20)
{
  _Unwind_Resume(a1);
}

void sub_10005011C(uint64_t a1, void *a2)
{
  if (a2) {
    sub_100014980(v3, 0xBu, *(void **)(a1 + 32));
  }
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

void sub_10005025C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10005029C(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v4 = [a2 ippResponse];
  id v3 = [v4 dataRepresentation];
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v3);
}

void sub_10005030C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10005040C(_Unwind_Exception *a1)
{
  id v3 = v2;

  _Unwind_Resume(a1);
}

void sub_1000504B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  int v12 = v11;

  _Unwind_Resume(a1);
}

void sub_1000505E0(_Unwind_Exception *a1)
{
  id v3 = v2;

  _Unwind_Resume(a1);
}

int main(int argc, const char **argv, const char **envp)
{
  if ((_set_user_dir_suffix() & 1) == 0)
  {
    NSLog(@"Can't set dir suffix");
    exit(-1);
  }
  id v4 = NSTemporaryDirectory();
  id v5 = _PKLogCategory(PKLogCategoryDefault[0]);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    pid_t v6 = getpid();
    uint64_t v7 = *argv;
    v13[0] = 67109634;
    v13[1] = v6;
    __int16 v14 = 2082;
    char v15 = v7;
    __int16 v16 = 2114;
    double v17 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "PrinterTool(%d) starting: %{public}s, spool in %{public}@", (uint8_t *)v13, 0x1Cu);
  }

  atexit_b(&stru_1000A35E8);
  liteSetupDefaults();
  dispatch_source_t v8 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0x1DuLL, 0, (dispatch_queue_t)&_dispatch_main_q);
  uint64_t v9 = (void *)qword_1000C8B80;
  qword_1000C8B80 = (uint64_t)v8;

  if (qword_1000C8B80)
  {
    dispatch_source_set_event_handler((dispatch_source_t)qword_1000C8B80, &stru_1000A3608);
    dispatch_resume((dispatch_object_t)qword_1000C8B80);
  }
  int v10 = +[NSXPCListener serviceListener];
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, v10, (CFNotificationCallback)sub_10005091C, @"AppleLanguagePreferencesChangedNotification", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_1000C8B90, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_1000C8B90))
  {
    qword_1000C8B88 = objc_opt_new();
    __cxa_guard_release(&qword_1000C8B90);
  }
  [v10 setDelegate:qword_1000C8B88];
  [v10 activate];

  return 0;
}

void sub_100050808(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_1000C8B90);

  _Unwind_Resume(a1);
}

void sub_100050854(id a1)
{
  dispatch_queue_t v1 = _PKLogCategory(PKLogCategoryDefault[0]);
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    v2[0] = 67109120;
    v2[1] = getpid();
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "PrinterTool(%d) exiting", (uint8_t *)v2, 8u);
  }
}

void sub_100050904(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10005091C()
{
  id v0 = _PKLogCategory(PKLogCategoryDefault[0]);
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)dispatch_queue_t v1 = 0;
    _os_log_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "LOCALE CHANGED - xpc will re-launch", v1, 2u);
  }

  exit(0);
}

void sub_100050988(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v5 = v3;
  if (v3)
  {
    id v4 = +[NSPropertyListSerialization propertyListWithData:v3 options:0 format:0 error:0];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

      id v4 = 0;
    }
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void sub_100050A48(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100050A6C(id a1)
{
  v20[0] = @"jobs";
  dispatch_queue_t v1 = +[lite_job_t gatherLogInfo];
  v20[1] = @"printers";
  v21[0] = v1;
  uint64_t v2 = +[lite_printer_t gatherLogInfo];
  v21[1] = v2;
  id v3 = +[NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:2];

  id v4 = _PKLogCategory(PKLogCategoryDefault[0]);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "INFO: {", buf, 2u);
  }

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = [v3 description];
  pid_t v6 = [v5 componentsSeparatedByString:@"\n"];

  id v7 = [v6 countByEnumeratingWithState:&v13 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v14;
    do
    {
      for (unint64_t i = 0; i != v7; unint64_t i = (char *)i + 1)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        int v11 = _PKLogCategory(PKLogCategoryDefault[0]);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long buf = 138543362;
          uint64_t v18 = v10;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "INFO:   %{public}@", buf, 0xCu);
        }
      }
      id v7 = [v6 countByEnumeratingWithState:&v13 objects:v19 count:16];
    }
    while (v7);
  }

  int v12 = _PKLogCategory(PKLogCategoryDefault[0]);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "}", buf, 2u);
  }
}

void sub_100050CF0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void _visitHexLines(void *a1, int a2, void *a3)
{
  id v5 = a1;
  id v6 = a3;
  uint64_t v26 = 0;
  int v27 = &v26;
  uint64_t v28 = 0x4812000000;
  int v29 = sub_100050FC4;
  int v30 = nullsub_7;
  uint64_t v31 = &unk_10008EE0A;
  uint64_t v32 = 0;
  uint64_t v33 = 0;
  int v34 = 0;
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x2020000000;
  int v25 = 0;
  if (a2)
  {
    id v7 = "/* ";
    uint64_t v8 = ",";
    uint64_t v9 = "0x";
    uint64_t v10 = " */";
  }
  else
  {
    uint64_t v10 = "";
    uint64_t v9 = "";
    uint64_t v8 = "";
    id v7 = "";
  }
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100050FDC;
  v16[3] = &unk_1000A3630;
  unint64_t v20 = v9;
  int v21 = v8;
  uint64_t v18 = &v26;
  int v19 = v24;
  int v22 = v7;
  uint64_t v23 = v10;
  id v11 = v6;
  id v17 = v11;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  _DWORD v13[2] = sub_100051238;
  void v13[3] = &unk_1000A3658;
  long long v15 = &v26;
  int v12 = objc_retainBlock(v16);
  id v14 = v12;
  [v5 enumerateByteRangesUsingBlock:v13];
  if ((v27[6] & 0x80000000) == 0) {
    ((void (*)(void *))v12[2])(v12);
  }

  _Block_object_dispose(v24, 8);
  _Block_object_dispose(&v26, 8);
}

void sub_100050F78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v30 - 144), 8);

  _Unwind_Resume(a1);
}

__n128 sub_100050FC4(__n128 *a1, __n128 *a2)
{
  __n128 result = a2[3];
  a1[4].n128_u32[0] = a2[4].n128_u32[0];
  a1[3] = result;
  return result;
}

void sub_100050FDC(uint64_t a1)
{
  uint64_t v2 = 0;
  id v3 = __str;
  id v4 = v18;
  do
  {
    if ((v2 & 3) == 0) {
      *v3++ = 32;
    }
    if (v2 >= *(int *)(*(void *)(*(void *)(a1 + 40) + 8) + 48))
    {
      size_t v9 = strlen(*(const char **)(a1 + 56)) + 2;
      if (v9 + strlen(*(const char **)(a1 + 64)))
      {
        size_t v10 = 0;
        do
        {
          v3[v10++] = 32;
          size_t v11 = strlen(*(const char **)(a1 + 56));
        }
        while (v11 + strlen(*(const char **)(a1 + 64)) + 2 > v10);
        v3 += v10;
      }
      *id v4 = 32;
    }
    else
    {
      int v5 = snprintf(v3, (char *)v20 - v3, "%s", *(const char **)(a1 + 56));
      uint64_t v6 = *(char *)(*(void *)(*(void *)(a1 + 40) + 8) + v2 + 52);
      id v7 = &v3[v5];
      char *v7 = a0123456789abcd[*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + v2 + 52) >> 4];
      v7[1] = a0123456789abcd[v6 & 0xF];
      if (v6 < 0) {
        __uint32_t v8 = __maskrune(v6, 0x40000uLL);
      }
      else {
        __uint32_t v8 = _DefaultRuneLocale.__runetype[v6] & 0x40000;
      }
      int v12 = v7 + 2;
      if (v8) {
        char v13 = v6;
      }
      else {
        char v13 = 46;
      }
      *id v4 = v13;
      id v3 = &v12[snprintf(v12, (char *)v20 - v12, "%s", *(const char **)(a1 + 64))];
    }
    ++v4;
    ++v2;
  }
  while (v2 != 16);
  char *v3 = 0;
  *id v4 = 0;
  uint64_t v14 = *(void *)(a1 + 72);
  uint64_t v15 = *(void *)(*(void *)(a1 + 48) + 8);
  int v16 = *(_DWORD *)(v15 + 24);
  *(_DWORD *)(v15 + 24) = v16 + 1;
  id v17 = +[NSString stringWithFormat:@"%s%8.8x%s  %s  %s%s%s", v14, (16 * v16), *(void *)(a1 + 80), __str, v14, v18, *(void *)(a1 + 80)];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 48) = 0;
}

void sub_100051220(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_100051238(uint64_t result, char *a2, uint64_t a3, uint64_t a4)
{
  if (a4 >= 1)
  {
    id v4 = a2;
    uint64_t v5 = result;
    unint64_t v6 = (unint64_t)&a2[a4];
    while (1)
    {
      uint64_t v7 = *(void *)(*(void *)(v5 + 40) + 8);
      uint64_t v8 = *(int *)(v7 + 48);
      if ((int)v8 > 15) {
        break;
      }
      char v9 = *v4++;
      *(_DWORD *)(v7 + 48) = v8 + 1;
      *(unsigned char *)(v7 + 48 + v8 + 4) = v9;
      if ((unint64_t)v4 >= v6)
      {
        if (*(int *)(*(void *)(*(void *)(v5 + 40) + 8) + 48) >= 16) {
          break;
        }
LABEL_7:
        if ((unint64_t)v4 >= v6) {
          return result;
        }
      }
    }
    __n128 result = (*(uint64_t (**)(void))(*(void *)(v5 + 32) + 16))();
    goto LABEL_7;
  }
  return result;
}

id getPrintdRPCProtocolInterface(void)
{
  if (qword_1000C8BA0 != -1) {
    dispatch_once(&qword_1000C8BA0, &stru_1000A3678);
  }
  id v0 = (void *)qword_1000C8B98;

  return v0;
}

void sub_100051324(id a1)
{
  dispatch_queue_t v1 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___PrintdRPCProtocol];
  uint64_t v16 = objc_opt_class();
  uint64_t v2 = +[NSArray arrayWithObjects:&v16 count:1];
  id v3 = [v1 classesForSelector:"getRecentJobsReply:" argumentIndex:1 ofReply:1];
  id v4 = [v3 setByAddingObjectsFromArray:v2];
  [v1 setClasses:v4 forSelector:"getRecentJobsReply:" argumentIndex:1 ofReply:1];

  uint64_t v15 = objc_opt_class();
  uint64_t v5 = +[NSArray arrayWithObjects:&v15 count:1];
  unint64_t v6 = [v1 classesForSelector:"getJobUpdateStatus:includeThumbnail:reply:" argumentIndex:0 ofReply:1];
  uint64_t v7 = [v6 setByAddingObjectsFromArray:v5];
  [v1 setClasses:v7 forSelector:"getJobUpdateStatus:includeThumbnail:reply:" argumentIndex:0 ofReply:1];

  v14[0] = objc_opt_class();
  v14[1] = objc_opt_class();
  v14[2] = objc_opt_class();
  v14[3] = objc_opt_class();
  uint64_t v8 = +[NSArray arrayWithObjects:v14 count:4];
  char v9 = [v1 classesForSelector:"browseInfoForPrinter:timeout:reply:" argumentIndex:0 ofReply:0];
  size_t v10 = [v9 setByAddingObjectsFromArray:v8];
  [v1 setClasses:v10 forSelector:"browseInfoForPrinter:timeout:reply:" argumentIndex:0 ofReply:0];

  size_t v11 = [v1 classesForSelector:"browseInfoForPrinter:timeout:reply:" argumentIndex:0 ofReply:1];
  int v12 = [v11 setByAddingObjectsFromArray:v8];
  [v1 setClasses:v12 forSelector:"browseInfoForPrinter:timeout:reply:" argumentIndex:0 ofReply:1];

  char v13 = (void *)qword_1000C8B98;
  qword_1000C8B98 = (uint64_t)v1;
}

void sub_1000515B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id getPrintdRPCBrowseProtocolInterface(void)
{
  id v0 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___PKPrintdRPC_BrowseClient_ClientProtocol];
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  dispatch_queue_t v1 = +[NSArray arrayWithObjects:&v8 count:3];
  uint64_t v2 = 0;
  char v3 = 1;
  do
  {
    char v4 = v3;
    uint64_t v5 = objc_msgSend(v0, "classesForSelector:argumentIndex:ofReply:", "browserAdded:removed:", v2, 0, v8, v9);
    unint64_t v6 = [v5 setByAddingObjectsFromArray:v1];
    [v0 setClasses:v6 forSelector:"browserAdded:removed:" argumentIndex:v2 ofReply:0];

    char v3 = 0;
    uint64_t v2 = 1;
  }
  while ((v4 & 1) != 0);

  return v0;
}

void sub_1000517B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t _liteCloseDriver(lite_job_t *a1, lite_driver_s *a2)
{
  float64x2_t v126 = a1;
  uint64_t v2 = _PKLogCategory(PKLogCategoryProgress[0]);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v3 = [(lite_job_t *)v126 printd_job_id];
    if (v126) {
      unsigned int v4 = [(lite_job_t *)v126 destination_job_id];
    }
    else {
      unsigned int v4 = -1;
    }
    LODWORD(buf) = 67109376;
    HIDWORD(buf) = v3;
    __int16 v129 = 1024;
    unsigned int v130 = v4;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "[Job %d][%d] Closing job.", (uint8_t *)&buf, 0xEu);
  }

  if (!v126->job_stream_http)
  {
    unsigned int v36 = 1;
LABEL_135:
    unsigned int v125 = v36;
    goto LABEL_136;
  }
  unint64_t v6 = v126;
  uint64_t v7 = _PKLogCategory(PKLogCategoryProgress[0]);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v8 = [(lite_job_t *)v6 printd_job_id];
    unsigned int v9 = [(lite_job_t *)v6 destination_job_id];
    LODWORD(buf) = 67109376;
    HIDWORD(buf) = v8;
    __int16 v129 = 1024;
    unsigned int v130 = v9;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[Job %d][%d] Finishing IPP submission.", (uint8_t *)&buf, 0xEu);
  }

  uint64_t v10 = [(device_http_t *)v6->job_stream_http finishStreamedIPPRequest];
  job_stream_http = v6->job_stream_http;
  v6->job_stream_http = 0;

  int v12 = _PKLogCategory(PKLogCategoryProgress[0]);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v13 = [(lite_job_t *)v6 printd_job_id];
    unsigned int v14 = [(lite_job_t *)v6 destination_job_id];
    if (v6->op_for_print == 6) {
      uint64_t v15 = "Send-Document";
    }
    else {
      uint64_t v15 = "Print-Job";
    }
    LODWORD(buf) = 67109890;
    HIDWORD(buf) = v13;
    __int16 v129 = 1024;
    unsigned int v130 = v14;
    __int16 v131 = 2080;
    id v132 = (void *)v15;
    __int16 v133 = 2112;
    *(void *)id v134 = v10;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "[Job %d][%d] %s result is %@", (uint8_t *)&buf, 0x22u);
  }

  uint64_t v16 = [v10 ippResponse];
  id v17 = [v16 _findAttribute0:@"job-id" valueTag:33];

  if (v17 && (int IXInteger = ippGetIXInteger(v17, 0)) != 0)
  {
    uint64_t v18 = _PKLogCategory(PKLogCategoryProgress[0]);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v19 = [(lite_job_t *)v6 printd_job_id];
      unsigned int v20 = [(lite_job_t *)v6 destination_job_id];
      if (v6->op_for_print == 6) {
        int v21 = "Send-Document";
      }
      else {
        int v21 = "Print-Job";
      }
      LODWORD(buf) = 67109890;
      HIDWORD(buf) = v19;
      __int16 v129 = 1024;
      unsigned int v130 = v20;
      __int16 v131 = 2080;
      id v132 = (void *)v21;
      __int16 v133 = 1024;
      *(_DWORD *)id v134 = IXInteger;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "[Job %d][%d] %s returned job-id is %d.", (uint8_t *)&buf, 0x1Eu);
    }

    [(lite_job_t *)v6 setDestination_job_id:IXInteger];
    v6->concurrent_monitor = 0;
  }
  else
  {
    int v22 = _PKLogCategory(PKLogCategoryProgress[0]);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v23 = [(lite_job_t *)v6 printd_job_id];
      unsigned int v24 = [(lite_job_t *)v6 destination_job_id];
      LODWORD(buf) = 67109376;
      HIDWORD(buf) = v23;
      __int16 v129 = 1024;
      unsigned int v130 = v24;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "[Job %d][%d] No job-id found in response.", (uint8_t *)&buf, 0xEu);
    }

    int IXInteger = 0;
  }
  int v25 = [v10 ippStatus];
  int v26 = 1;
  if (v25 <= 1051)
  {
    switch(v25)
    {
      case 1025:
      case 1026:
      case 1027:
        goto LABEL_64;
      case 1028:
      case 1029:
      case 1030:
      case 1032:
      case 1033:
      case 1034:
      case 1035:
      case 1036:
      case 1037:
      case 1038:
        goto LABEL_92;
      case 1031:
        goto LABEL_58;
      case 1039:
      case 1040:
        id v27 = [v10 ippStatus];
        unsigned int v28 = [(lite_job_t *)v6 is_canceled];
        CFStringRef v29 = @"NO";
        if (v28) {
          CFStringRef v30 = @"YES";
        }
        else {
          CFStringRef v30 = @"NO";
        }
        if (v6->force_uncompressed) {
          CFStringRef v29 = @"YES";
        }
        uint64_t v31 = +[NSString stringWithFormat:@"ipp status 0x%x job_canceled? %@ - force_uncompressed already? %@\x01", v27, v30, v29];
        uint64_t v32 = +[NSString stringWithFormat:@"%s:%d/%@", "_finishJobSubmission", 351, v31];

        uint64_t v33 = _PKLogCategory(PKLogCategoryProgress[0]);
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          unsigned int v34 = [(lite_job_t *)v6 printd_job_id];
          unsigned int v35 = [(lite_job_t *)v6 destination_job_id];
          LODWORD(buf) = 67109634;
          HIDWORD(buf) = v34;
          __int16 v129 = 1024;
          unsigned int v130 = v35;
          __int16 v131 = 2112;
          id v132 = v32;
          _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "[Job %d][%d] Forcing uncompressed: %@", (uint8_t *)&buf, 0x18u);
        }

        v6->force_uncompressedouble d = 1;
        int IXInteger = [(lite_job_t *)v6 is_canceled];
        goto LABEL_125;
      case 1041:
        goto LABEL_44;
      default:
        unsigned int v124 = IXInteger;
        if (v25 < 3) {
          goto LABEL_126;
        }
        if (v25 != 1051) {
          goto LABEL_92;
        }
LABEL_44:
        id v45 = [v10 ippStatus];
        unsigned int v46 = [(lite_job_t *)v6 is_canceled];
        CFStringRef v47 = @"NO";
        if (v46) {
          CFStringRef v48 = @"YES";
        }
        else {
          CFStringRef v48 = @"NO";
        }
        if (v6->force_raster) {
          CFStringRef v47 = @"YES";
        }
        long long v49 = +[NSString stringWithFormat:@"ipp status 0x%x job_canceled? %@ - force_raster already? %@\x01", v45, v48, v47];
        uint64_t v32 = +[NSString stringWithFormat:@"%s:%d/%@", "_finishJobSubmission", 321, v49];

        if (v6->force_raster)
        {
          long long v50 = [(lite_job_t *)v6 printer];
          long long v51 = [(lite_job_t *)v6 printer];
          liteNotifyPrinter(v50, [v51 reasons] | 0x200000, (NSString *)&v32->isa);

          long long v52 = +[NSString stringWithFormat:@"%s:%d", "_finishJobSubmission", 326];
          BOOL v53 = _liteNotifyCheck(86400, v52) == 2;

          if (v53)
          {
            [(lite_job_t *)v6 cancelThisJob];
          }
          else
          {
            _liteNotifyCancel((NSString *)&v32->isa);
            int v101 = _PKLogCategory(PKLogCategoryProgress[0]);
            if (os_log_type_enabled(v101, OS_LOG_TYPE_DEFAULT))
            {
              unsigned int v102 = [(lite_job_t *)v6 printd_job_id];
              unsigned int v103 = [(lite_job_t *)v6 destination_job_id];
              unsigned int v104 = [(lite_job_t *)v6 is_canceled];
              uint64_t v105 = "Retrying";
              LODWORD(buf) = 67110146;
              HIDWORD(buf) = v102;
              __int16 v129 = 1024;
              if (v104) {
                uint64_t v105 = "Canceling";
              }
              unsigned int v130 = v103;
              __int16 v131 = 2080;
              id v132 = (void *)v105;
              __int16 v133 = 1024;
              *(_DWORD *)id v134 = 333;
              *(_WORD *)&v134[4] = 2112;
              *(void *)&v134[6] = v32;
              _os_log_impl((void *)&_mh_execute_header, v101, OS_LOG_TYPE_DEFAULT, "[Job %d][%d] %s job on error response:%d (%@).", (uint8_t *)&buf, 0x28u);
            }
          }
        }
        else
        {
          int v98 = _PKLogCategory(PKLogCategoryProgress[0]);
          if (os_log_type_enabled(v98, OS_LOG_TYPE_DEFAULT))
          {
            unsigned int v99 = [(lite_job_t *)v6 printd_job_id];
            unsigned int v100 = [(lite_job_t *)v6 destination_job_id];
            LODWORD(buf) = 67109634;
            HIDWORD(buf) = v99;
            __int16 v129 = 1024;
            unsigned int v130 = v100;
            __int16 v131 = 2112;
            id v132 = v32;
            _os_log_impl((void *)&_mh_execute_header, v98, OS_LOG_TYPE_DEFAULT, "[Job %d][%d] Possibly retry job on error to force raster: %@", (uint8_t *)&buf, 0x18u);
          }

          v6->force_raster = 1;
        }
        int IXInteger = [(lite_job_t *)v6 is_canceled];
        break;
    }
    goto LABEL_125;
  }
  if (v25 > 1281)
  {
    unsigned int v124 = IXInteger;
    switch(v25)
    {
      case 1282:
        goto LABEL_58;
      case 1283:
      case 1284:
      case 1288:
      case 1289:
      case 1290:
        goto LABEL_92;
      case 1285:
        goto LABEL_126;
      case 1286:
      case 1287:
      case 1291:
        id v37 = [v10 ippStatus];
        unsigned int v38 = [(lite_job_t *)v6 is_canceled];
        CFStringRef v39 = @"NO";
        if (v38) {
          CFStringRef v39 = @"YES";
        }
        uint64_t v40 = +[NSString stringWithFormat:@"ipp status 0x%x job_canceled? %@", v37, v39];
        uint64_t v32 = +[NSString stringWithFormat:@"%s:%d/%@", "_finishJobSubmission", 296, v40];

        CGAffineTransform v41 = [(lite_job_t *)v6 printer];
        unint64_t v42 = [(lite_job_t *)v6 printer];
        liteNotifyPrinter(v41, [v42 reasons] | 0x20, (NSString *)&v32->isa);

        uint64_t v43 = +[NSString stringWithFormat:@"%s:%d", "_finishJobSubmission", 300];
        BOOL v44 = _liteNotifyCheck(86400, v43) == 2;

        if (v44)
        {
          [(lite_job_t *)v6 cancelThisJob];
        }
        else
        {
          _liteNotifyCancel((NSString *)&v32->isa);
          if ([(lite_job_t *)v6 destination_job_id] && v6->op_for_print == 6)
          {
            int v83 = +[NSString stringWithFormat:@"cancel_has_job_id_and_is_send_document(%@)", v32];
            sub_1000543DC(v6, v83);
          }
        }
        id v70 = _PKLogCategory(PKLogCategoryProgress[0]);
        if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
        {
          unsigned int v84 = [(lite_job_t *)v6 printd_job_id];
          unsigned int v85 = [(lite_job_t *)v6 destination_job_id];
          unsigned int v86 = [(lite_job_t *)v6 is_canceled];
          id v87 = "Retrying";
          LODWORD(buf) = 67109890;
          HIDWORD(buf) = v84;
          __int16 v129 = 1024;
          if (v86) {
            id v87 = "Canceling";
          }
          unsigned int v130 = v85;
          __int16 v131 = 2080;
          id v132 = (void *)v87;
          __int16 v133 = 2112;
          *(void *)id v134 = v32;
          _os_log_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_DEFAULT, "[Job %d][%d] %s job on busy error (%@).", (uint8_t *)&buf, 0x22u);
        }
        goto LABEL_124;
      default:
        if (v25 == 4096)
        {
          [(lite_job_t *)v6 cancelThisJob];
          uint64_t v32 = _PKLogCategory(PKLogCategoryProgress[0]);
          if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
          {
            unsigned int v96 = [(lite_job_t *)v6 printd_job_id];
            unsigned int v97 = [(lite_job_t *)v6 destination_job_id];
            LODWORD(buf) = 67109376;
            HIDWORD(buf) = v96;
            __int16 v129 = 1024;
            unsigned int v130 = v97;
            _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "[Job %d][%d] Canceling job on auth canceled.", (uint8_t *)&buf, 0xEu);
          }
          int IXInteger = 1;
          goto LABEL_125;
        }
        if (v25 != 4097) {
          goto LABEL_92;
        }
LABEL_58:
        id v54 = [v10 ippStatus];
        unsigned int v55 = [(lite_job_t *)v6 is_canceled];
        CFStringRef v56 = @"NO";
        if (v55) {
          CFStringRef v56 = @"YES";
        }
        uint64_t v57 = +[NSString stringWithFormat:@"ipp status 0x%x job_canceled? %@", v54, v56];
        uint64_t v32 = +[NSString stringWithFormat:@"%s:%d/%@", "_finishJobSubmission", 228, v57];

        int v58 = [(lite_job_t *)v6 printer];
        liteNotifyPrinter(v58, 0x10000, (NSString *)&v32->isa);

        unsigned int v59 = +[NSString stringWithFormat:@"%s:%d", "_finishJobSubmission", 232];
        BOOL v60 = _liteNotifyCheck(86400, v59) == 2;

        if (v60) {
          [(lite_job_t *)v6 cancelThisJob];
        }
        else {
          _liteNotifyCancel((NSString *)&v32->isa);
        }
        id v70 = _PKLogCategory(PKLogCategoryProgress[0]);
        if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
        {
          unsigned int v88 = [(lite_job_t *)v6 printd_job_id];
          unsigned int v89 = [(lite_job_t *)v6 destination_job_id];
          unsigned int v90 = [(lite_job_t *)v6 is_canceled];
          BOOL v91 = "Retrying";
          LODWORD(buf) = 67109890;
          HIDWORD(buf) = v88;
          __int16 v129 = 1024;
          if (v90) {
            BOOL v91 = "Canceling";
          }
          unsigned int v130 = v89;
          __int16 v131 = 2080;
          id v132 = (void *)v91;
          __int16 v133 = 2112;
          *(void *)id v134 = v32;
          _os_log_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_ERROR, "[Job %d][%d] %s job on lost connection error (%@)", (uint8_t *)&buf, 0x22u);
        }
        break;
    }
    goto LABEL_124;
  }
  if (v25 <= 1179)
  {
    if (v25 != 1052)
    {
      if (v25 != 1055) {
        goto LABEL_92;
      }
      goto LABEL_64;
    }
LABEL_74:
    id v75 = [v10 ippStatus];
    unsigned int v76 = [(lite_job_t *)v6 is_canceled];
    CFStringRef v77 = @"NO";
    if (v76) {
      CFStringRef v77 = @"YES";
    }
    id v78 = +[NSString stringWithFormat:@"ipp status 0x%x job_canceled? %@", v75, v77];
    uint64_t v32 = +[NSString stringWithFormat:@"%s:%d/%@", "_finishJobSubmission", 271, v78];

    long long v79 = [(lite_job_t *)v6 printer];
    double v80 = [(lite_job_t *)v6 printer];
    liteNotifyPrinter(v79, [v80 reasons] | 0x100000, (NSString *)&v32->isa);

    int v81 = +[NSString stringWithFormat:@"%s:%d", "_finishJobSubmission", 274];
    BOOL v82 = _liteNotifyCheck(86400, v81) == 2;

    if (v82) {
      [(lite_job_t *)v6 cancelThisJob];
    }
    else {
      _liteNotifyCancel((NSString *)&v32->isa);
    }
    id v70 = _PKLogCategory(PKLogCategoryProgress[0]);
    if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
    {
      unsigned int v92 = [(lite_job_t *)v6 printd_job_id];
      unsigned int v93 = [(lite_job_t *)v6 destination_job_id];
      unsigned int v94 = [(lite_job_t *)v6 is_canceled];
      double v95 = "Retrying";
      LODWORD(buf) = 67109890;
      HIDWORD(buf) = v92;
      __int16 v129 = 1024;
      if (v94) {
        double v95 = "Canceling";
      }
      unsigned int v130 = v93;
      __int16 v131 = 2080;
      id v132 = (void *)v95;
      __int16 v133 = 2112;
      *(void *)id v134 = v32;
      _os_log_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_ERROR, "[Job %d][%d] %s job on account id missing error (%@).", (uint8_t *)&buf, 0x22u);
    }
    goto LABEL_124;
  }
  if (v25 == 1180) {
    goto LABEL_74;
  }
  if (v25 != 1183)
  {
LABEL_92:
    if ([(lite_job_t *)v6 is_canceled])
    {
      int v26 = 0;
      unsigned int v124 = 0;
      int IXInteger = 1;
      goto LABEL_126;
    }
    int v106 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"ipp status 0x%x", [v10 ippStatus]);
    uint64_t v32 = +[NSString stringWithFormat:@"%s:%d/%@", "_finishJobSubmission", 368, v106];

    if ([v10 ippStatus] == 1182)
    {
      unsigned int v107 = [(lite_job_t *)v6 printer];
      unsigned int v108 = [(lite_job_t *)v6 printer];
      liteNotifyPrinter(v107, [v108 reasons] | 0x400000, (NSString *)&v32->isa);
    }
    else
    {
      unsigned int v107 = [(lite_job_t *)v6 printer];
      unsigned int v108 = [(lite_job_t *)v6 printer];
      liteNotifyPrinter(v107, [v108 reasons] | 0x200000, (NSString *)&v32->isa);
    }

    __int16 v109 = +[NSString stringWithFormat:@"%s:%d", "_finishJobSubmission", 375];
    BOOL v110 = _liteNotifyCheck(86400, v109) == 2;

    if (v110)
    {
      [(lite_job_t *)v6 cancelThisJob];
    }
    else
    {
      _liteNotifyCancel((NSString *)&v32->isa);
      if ([(lite_job_t *)v6 destination_job_id] && v6->op_for_print == 6)
      {
        __int16 v111 = +[NSString stringWithFormat:@"cancel_has_job_id_and_is_send_document(%@)", v32];
        sub_1000543DC(v6, v111);
      }
    }
    id v70 = _PKLogCategory(PKLogCategoryProgress[0]);
    if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v112 = [(lite_job_t *)v6 printd_job_id];
      unsigned int v113 = [(lite_job_t *)v6 destination_job_id];
      unsigned int v114 = [(lite_job_t *)v6 is_canceled];
      id v115 = "Retrying";
      LODWORD(buf) = 67110146;
      HIDWORD(buf) = v112;
      __int16 v129 = 1024;
      if (v114) {
        id v115 = "Canceling";
      }
      unsigned int v130 = v113;
      __int16 v131 = 2080;
      id v132 = (void *)v115;
      __int16 v133 = 1024;
      *(_DWORD *)id v134 = 394;
      *(_WORD *)&v134[4] = 2112;
      *(void *)&v134[6] = v32;
      _os_log_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_DEFAULT, "[Job %d][%d] %s job on error response:%d (%@).", (uint8_t *)&buf, 0x28u);
    }
    goto LABEL_124;
  }
LABEL_64:
  id v61 = [v10 ippStatus];
  unsigned int v62 = [(lite_job_t *)v6 is_canceled];
  CFStringRef v63 = @"NO";
  if (v62) {
    CFStringRef v63 = @"YES";
  }
  int v64 = +[NSString stringWithFormat:@"ipp status 0x%x job_canceled? %@", v61, v63];
  uint64_t v32 = +[NSString stringWithFormat:@"%s:%d/%@", "_finishJobSubmission", 250, v64];

  BOOL v65 = [(lite_job_t *)v6 printer];
  int v66 = [(lite_job_t *)v6 printer];
  liteNotifyPrinter(v65, [v66 reasons] | 0x80000, (NSString *)&v32->isa);

  id v67 = +[NSString stringWithFormat:@"%s:%d", "_finishJobSubmission", 254];
  BOOL v68 = _liteNotifyCheck(86400, v67) == 2;

  if (v68)
  {
    [(lite_job_t *)v6 cancelThisJob];
  }
  else
  {
    _liteNotifyCancel((NSString *)&v32->isa);
    int v69 = [(lite_job_t *)v6 printer];
    liteNotifyClearPassword(v69);
  }
  id v70 = _PKLogCategory(PKLogCategoryProgress[0]);
  if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
  {
    unsigned int v71 = [(lite_job_t *)v6 printd_job_id];
    unsigned int v72 = [(lite_job_t *)v6 destination_job_id];
    unsigned int v73 = [(lite_job_t *)v6 is_canceled];
    int v74 = "Retrying";
    LODWORD(buf) = 67109890;
    HIDWORD(buf) = v71;
    __int16 v129 = 1024;
    if (v73) {
      int v74 = "Canceling";
    }
    unsigned int v130 = v72;
    __int16 v131 = 2080;
    id v132 = (void *)v74;
    __int16 v133 = 2112;
    *(void *)id v134 = v32;
    _os_log_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_ERROR, "[Job %d][%d] %s job on authorization error (%@).", (uint8_t *)&buf, 0x22u);
  }
LABEL_124:

  int IXInteger = [(lite_job_t *)v6 is_canceled];
LABEL_125:

  int v26 = 0;
  unsigned int v124 = 0;
LABEL_126:

  if (v26)
  {
    if (IXInteger >= 1)
    {
      v116 = [(lite_job_t *)v6 printer];
      [v116 setBusy:0];

      if ([(lite_job_t *)v6 is_canceled]) {
        sub_1000543DC(v6, @"cancel_externally");
      }
      BOOL v118 = _PKLogCategory(PKLogCategoryProgress[0]);
      if (os_log_type_enabled(v118, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v119 = [(lite_job_t *)v6 printd_job_id];
        unsigned int v120 = [(lite_job_t *)v6 destination_job_id];
        LODWORD(buf) = 67109376;
        HIDWORD(buf) = v119;
        __int16 v129 = 1024;
        unsigned int v130 = v120;
        _os_log_impl((void *)&_mh_execute_header, v118, OS_LOG_TYPE_DEFAULT, "[Job %d][%d] Checking job status.", (uint8_t *)&buf, 0xEu);
      }

      char v121 = [(lite_job_t *)v6 ippSession];
      int64x2_t v122 = [(lite_job_t *)v6 printer];
      sub_100059484(&buf, v121, v122, v124, &off_1000B8F80, @"checking_job_status");
    }
    unsigned int v36 = [(lite_job_t *)v6 is_canceled];
    goto LABEL_135;
  }
  unsigned int v125 = IXInteger;
LABEL_136:

  return v125;
}

void sub_100053DEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,void *a28)
{
  _Unwind_Resume(a1);
}

void sub_1000543DC(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  uint64_t v5 = _PKLogCategory(PKLogCategoryProgress[0]);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    unsigned int v6 = objc_msgSend(v3, "printd_job_id");
    if (v3) {
      unsigned int v7 = objc_msgSend(v3, "destination_job_id");
    }
    else {
      unsigned int v7 = -1;
    }
    LODWORD(v8) = 67109376;
    HIDWORD(v8) = v6;
    __int16 v9 = 1024;
    unsigned int v10 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "[Job %d][%d] Canceling incomplete job.", (uint8_t *)&v8, 0xEu);
  }

  sub_100059084(&v8, v3, v4);
}

void sub_100054500(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_100054544(uint64_t a1)
{
  return sub_100059708((void *)a1);
}

uint64_t liteCloseDriver(lite_job_t *a1, lite_driver_s *a2)
{
  uint64_t v10 = 0;
  size_t v11 = &v10;
  uint64_t v12 = 0x2020000000;
  int v13 = 0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  int v6[2] = sub_100054670;
  v6[3] = &unk_1000A36C8;
  unsigned int v7 = a1;
  uint64_t v8 = &v10;
  __int16 v9 = a2;
  id v3 = v7;
  [(lite_job_t *)v3 _withActivity:v6];

  uint64_t v4 = *((unsigned int *)v11 + 6);
  _Block_object_dispose(&v10, 8);
  return v4;
}

void sub_10005464C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Block_object_dispose((const void *)(v15 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_100054670(uint64_t a1, os_activity_t activity)
{
  id v3 = _os_activity_create((void *)&_mh_execute_header, "liteCloseDriver", activity, OS_ACTIVITY_FLAG_DEFAULT);
  uint64_t v4 = _PKLogCategory(PKLogCategoryProgress[0]);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v5 = objc_msgSend(*(id *)(a1 + 32), "printd_job_id");
    unsigned int v6 = *(void **)(a1 + 32);
    if (v6) {
      unsigned int v7 = objc_msgSend(v6, "destination_job_id");
    }
    else {
      unsigned int v7 = -1;
    }
    *(_DWORD *)uint64_t buf = 67109890;
    unsigned int v18 = v5;
    __int16 v19 = 1024;
    unsigned int v20 = v7;
    __int16 v21 = 2048;
    int v22 = v3;
    __int16 v23 = 2080;
    unsigned int v24 = "liteCloseDriver";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[Job %d][%d] Activity (%p) ENTER: %s", buf, 0x22u);
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000548F8;
  block[3] = &unk_1000A36A0;
  long long v13 = *(_OWORD *)(a1 + 32);
  id v8 = (id)v13;
  long long v15 = v13;
  uint64_t v16 = *(void *)(a1 + 48);
  os_activity_apply(v3, block);
  __int16 v9 = _PKLogCategory(PKLogCategoryProgress[0]);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v10 = objc_msgSend(*(id *)(a1 + 32), "printd_job_id");
    size_t v11 = *(void **)(a1 + 32);
    if (v11) {
      unsigned int v12 = objc_msgSend(v11, "destination_job_id");
    }
    else {
      unsigned int v12 = -1;
    }
    *(_DWORD *)uint64_t buf = 67109890;
    unsigned int v18 = v10;
    __int16 v19 = 1024;
    unsigned int v20 = v12;
    __int16 v21 = 2048;
    int v22 = v3;
    __int16 v23 = 2080;
    unsigned int v24 = "liteCloseDriver";
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "[Job %d][%d] Activity (%p) EXIT: %s", buf, 0x22u);
  }
}

void sub_1000548B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16)
{
  _Unwind_Resume(a1);
}

uint64_t sub_1000548F8(uint64_t a1, lite_driver_s *a2)
{
  uint64_t result = _liteCloseDriver(*(lite_job_t **)(a1 + 32), a2);
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t liteDoPrint(lite_job_t *a1)
{
  dispatch_queue_t v1 = a1;
  uint64_t v2 = _PKLogCategory(PKLogCategoryProgress[0]);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = [(lite_job_t *)v1 printer];
    uint64_t v4 = [(lite_job_t *)v1 printer];
    id v5 = [v4 displayName];
    id v6 = [v5 UTF8String];
    dev_t v7 = [(lite_job_t *)v1 printd_job_id];
    id v8 = [(lite_job_t *)v1 spoolDocumentFilename];
    buf.st_dev = 134218754;
    *(void *)&buf.st_mode = v3;
    WORD2(buf.st_ino) = 2082;
    *(__darwin_ino64_t *)((char *)&buf.st_ino + 6) = (__darwin_ino64_t)v6;
    HIWORD(buf.st_gvoid (**v5)(id, id) = 1024;
    buf.st_rdev = v7;
    *((_WORD *)&buf.st_rdev + 2) = 2080;
    *(void *)((char *)&buf.st_rdev + 6) = [v8 UTF8String];
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "[Printer<%p> %{public}s] Printing job #%d (\"%s\").", (uint8_t *)&buf, 0x26u);
  }
  __int16 v9 = [(lite_job_t *)v1 spoolDocumentFilename];
  BOOL v10 = v9 == 0;

  if (v10)
  {
    uint64_t v16 = _PKLogCategory(PKLogCategoryProgress[0]);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      unsigned int v17 = [(lite_job_t *)v1 printd_job_id];
      if (v1) {
        unsigned int v18 = [(lite_job_t *)v1 destination_job_id];
      }
      else {
        unsigned int v18 = -1;
      }
      buf.st_dev = 67109376;
      *(_DWORD *)&buf.st_mode = v17;
      LOWORD(buf.st_ino) = 1024;
      *(_DWORD *)((char *)&buf.st_ino + 2) = v18;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "[Job %d][%d] Missing print file.", (uint8_t *)&buf, 0xEu);
    }

    goto LABEL_43;
  }
  uint64_t v118 = 0;
  uint64_t v119 = 0;
  int v120 = 0;
  id v11 = [(lite_job_t *)v1 spoolDocumentFilename];
  BOOL v12 = lstat((const char *)[v11 UTF8String], &buf) == 0;

  if (!v12)
  {
    long long v13 = _PKLogCategory(PKLogCategoryProgress[0]);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      unsigned int v14 = [(lite_job_t *)v1 printd_job_id];
      if (v1) {
        unsigned int v15 = [(lite_job_t *)v1 destination_job_id];
      }
      else {
        unsigned int v15 = -1;
      }
      *(_DWORD *)char v121 = 67109376;
      unsigned int v122 = v14;
      __int16 v123 = 1024;
      unsigned int v124 = v15;
      CFStringRef v29 = "[Job %d][%d] Missing print file.";
LABEL_41:
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, v29, v121, 0xEu);
      goto LABEL_42;
    }
    goto LABEL_42;
  }
  if ((buf.st_mode & 0xF000) == 0xA000)
  {
    long long v13 = _PKLogCategory(PKLogCategoryProgress[0]);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      unsigned int v19 = [(lite_job_t *)v1 printd_job_id];
      if (v1) {
        unsigned int v20 = [(lite_job_t *)v1 destination_job_id];
      }
      else {
        unsigned int v20 = -1;
      }
      *(_DWORD *)char v121 = 67109376;
      unsigned int v122 = v19;
      __int16 v123 = 1024;
      unsigned int v124 = v20;
      CFStringRef v29 = "[Job %d][%d] Job file is a symlink and cannot be printed.";
      goto LABEL_41;
    }
LABEL_42:

LABEL_43:
    [(lite_job_t *)v1 finishJob:8];
    uint64_t v45 = 0;
    goto LABEL_44;
  }
  __int16 v21 = [(lite_job_t *)v1 printer];
  int v22 = objc_msgSend(v21, "attrs_printer_native_formats");

  __int16 v23 = [(lite_job_t *)v1 request_attrs];
  (*((void (**)(JobRequestAttributes_Base *))v23->var0 + 76))(v23);
  CGRect v117 = (__CFString *)objc_claimAutoreleasedReturnValue();
  unsigned int v24 = [(lite_job_t *)v1 request_attrs];
  unsigned int v113 = (*((void (**)(JobRequestAttributes_Base *))v24->var0 + 60))(v24);
  int v25 = [(lite_job_t *)v1 spoolDocumentFormat];
  uint64_t v26 = [v25 compare:@"image/jpeg"];

  if (v26)
  {
    int v27 = 0;
    int v28 = 0;
  }
  else
  {
    CFStringRef v30 = [(lite_job_t *)v1 spoolDocumentFilename];
    int v31 = sub_100055A88(v30, &v118);
    int v28 = v118;
    int v27 = HIDWORD(v118);
    if (v31 && !v117 && v118 && HIDWORD(v118))
    {
      BOOL v33 = (int)v118 >= (unint64_t)(2 * SHIDWORD(v118))
         || SHIDWORD(v118) >= (unint64_t)(2 * (int)v118);

      if (v33)
      {
        unsigned int v34 = v1;
        unsigned int v35 = [(lite_job_t *)v34 request_attrs];
        unsigned int v36 = ((void (*)(JobRequestAttributes_Base *))*v35->var0)(v35);
        id v37 = v36;
        if (v36)
        {
          unsigned int v38 = [v36 mediaSize];
          CFStringRef v39 = v38;
          double v40 = 0.0;
          if (v38)
          {
            int v41 = [v38 xDimension];
            int v42 = [v39 yDimension];
            if (v41)
            {
              if (v42)
              {
                if (v41 <= v42)
                {
                  double v43 = (double)v42;
                  double v44 = (double)v41;
                }
                else
                {
                  double v43 = (double)v41;
                  double v44 = (double)v42;
                }
                double v40 = v43 / v44;
              }
            }
          }
        }
        else
        {
          double v40 = 0.0;
        }

        if (v28 <= v27) {
          int v91 = v27;
        }
        else {
          int v91 = v28;
        }
        if (v28 >= v27) {
          int v92 = v27;
        }
        else {
          int v92 = v28;
        }
        if (vabdd_f64(1.0, v40 / ((double)v91 / (double)v92)) > 0.15)
        {
          unsigned int v93 = v117;
          CGRect v117 = @"fit";

          unsigned int v94 = [(lite_job_t *)v34 request_attrs];
          (*((void (**)(JobRequestAttributes_Base *, __CFString **))v94->var0 + 78))(v94, &v117);
        }
      }
    }
    else
    {
    }
  }
  if (!v22
    || v1->force_raster
    || (long long v50 = [(lite_job_t *)v1 request_attrs],
        (*((int (**)(JobRequestAttributes_Base *))v50->var0 + 16))(v50) >= 2)
    && ([(lite_job_t *)v1 printer],
        long long v51 = objc_claimAutoreleasedReturnValue(),
        BOOL v52 = ((unint64_t)objc_msgSend(v51, "printer_type_from_cups") & 4) == 0,
        v51,
        v52))
  {
    CFStringRef v47 = 0;
    goto LABEL_49;
  }
  BOOL v53 = [(lite_job_t *)v1 spoolDocumentFormat];
  unsigned __int8 v54 = [v22 containsObject:v53];

  if (buf.st_size >= -1023) {
    unint64_t v55 = buf.st_size + 1023;
  }
  else {
    unint64_t v55 = buf.st_size + 2046;
  }
  if ((v54 & 1) == 0) {
    goto LABEL_129;
  }
  CFStringRef v56 = [(lite_job_t *)v1 spoolDocumentFormat];
  unint64_t v111 = v55 >> 10;
  if ([v56 compare:@"application/pdf"]) {
    goto LABEL_66;
  }
  id v70 = [(lite_job_t *)v1 printer];
  if ((int)objc_msgSend(v70, "max_pdf") <= 0)
  {

LABEL_66:
    goto LABEL_67;
  }
  unsigned int v71 = [(lite_job_t *)v1 printer];
  BOOL v72 = (int)objc_msgSend(v71, "max_pdf") < (int)v111;

  if (v72)
  {
LABEL_129:
    long long v79 = 0;
LABEL_130:
    CFStringRef v47 = 0;
    goto LABEL_131;
  }
LABEL_67:
  if (v26)
  {
    CFStringRef v47 = sub_100055D44;
    goto LABEL_69;
  }
  id v75 = [(lite_job_t *)v1 printer];
  if ((int)objc_msgSend(v75, "max_jpeg") <= 0)
  {

    id v78 = sub_100055D44;
  }
  else
  {
    unsigned int v76 = [(lite_job_t *)v1 printer];
    BOOL v77 = (int)objc_msgSend(v76, "max_jpeg") < (int)v111;

    if (v77) {
      id v78 = 0;
    }
    else {
      id v78 = sub_100055D44;
    }
  }
  double v80 = [(lite_job_t *)v1 printer];
  if (v28 <= (int)objc_msgSend(v80, "max_jpeg_x"))
  {
    int v81 = [(lite_job_t *)v1 printer];
    BOOL v82 = v27 > (int)objc_msgSend(v81, "max_jpeg_y");

    if (!v82) {
      goto LABEL_114;
    }
  }
  else
  {
  }
  id v78 = 0;
LABEL_114:
  if (v119 == 3 || v119 == 1 || v78 == 0) {
    CFStringRef v47 = v78;
  }
  else {
    CFStringRef v47 = 0;
  }
  if (v47)
  {
    if (HIDWORD(v119))
    {
      unsigned int v85 = [(lite_job_t *)v1 printer];
      unsigned int v86 = [v85 jpegFeatures];
      unsigned int v87 = [v86 containsObject:@"icc"];

      CFStringRef v47 = v78;
      if (!v87) {
        goto LABEL_129;
      }
    }
  }
  if (v47)
  {
    if (v120)
    {
      unsigned int v88 = [(lite_job_t *)v1 printer];
      unsigned int v89 = [v88 jpegFeatures];
      unsigned __int8 v90 = [v89 containsObject:@"progressive"];

      if ((v90 & 1) == 0) {
        goto LABEL_129;
      }
    }
  }
LABEL_69:
  if (v47 && v117)
  {
    if (![(__CFString *)v117 compare:@"fill"]
      || ![(__CFString *)v117 compare:@"fit"]
      || ![(__CFString *)v117 compare:@"none"])
    {
      uint64_t v57 = [(lite_job_t *)v1 printer];
      BOOL v58 = objc_msgSend(v57, "print_scaling_supported") == 0;

      if (v58) {
        goto LABEL_129;
      }
    }
LABEL_96:
    if ([v113 count])
    {
      unsigned int v73 = [(lite_job_t *)v1 spoolDocumentFormat];
      BOOL v74 = [v73 caseInsensitiveCompare:@"application/pdf"] == 0;

      if (v74)
      {
        if ((unint64_t)[v113 count] <= 1)
        {
          double v95 = [v113 firstObject];
          if ([v95 rangeValue] || v96 != -[lite_job_t pdf_pages](v1, "pdf_pages")) {
            CFStringRef v47 = lite_print_redraw_pdf;
          }
        }
        else
        {
          CFStringRef v47 = lite_print_redraw_pdf;
        }
      }
    }
    unsigned int v112 = [(lite_job_t *)v1 spoolDocumentFormat];
    if ([v112 caseInsensitiveCompare:@"application/pdf"])
    {
      long long v79 = 0;
    }
    else
    {
      int v98 = [(lite_job_t *)v1 request_attrs];
      long long v79 = (*((void (**)(JobRequestAttributes_Base *))v98->var0 + 24))(v98);
      if (v79)
      {
        BOOL v110 = [(lite_job_t *)v1 printer];
        unsigned int v99 = objc_msgSend(v110, "device_uri");
        if (!v99
          || ([(lite_job_t *)v1 printer],
              unsigned int v107 = objc_claimAutoreleasedReturnValue(),
              objc_msgSend(v107, "device_uri"),
              unsigned int v108 = objc_claimAutoreleasedReturnValue(),
              [v108 absoluteString],
              id v109 = objc_claimAutoreleasedReturnValue(),
              strncmp((const char *)[v109 UTF8String], "ipps://", 7uLL)))
        {
          id v102 = [v79 length];
          unsigned int v103 = [(lite_job_t *)v1 printer];
          int v106 = v99;
          BOOL v104 = v99 == 0;
          BOOL v105 = (unint64_t)v102 > (int)[v103 documentPasswordSupported];

          if (!v104)
          {
          }
          if (v105) {
            goto LABEL_130;
          }
LABEL_150:
          if (v47)
          {
            unsigned int v97 = [(lite_job_t *)v1 spoolDocumentFormat];
            if ([v97 caseInsensitiveCompare:@"application/pdf"])
            {
            }
            else
            {
              unsigned int v100 = [(lite_job_t *)v1 request_attrs];
              int v101 = (*((uint64_t (**)(JobRequestAttributes_Base *))v100->var0 + 4))(v100);

              if (v101) {
                CFStringRef v47 = lite_print_redraw_pdf;
              }
            }
          }
          goto LABEL_131;
        }
      }
    }

    goto LABEL_150;
  }
  if (v47) {
    goto LABEL_96;
  }
  long long v79 = 0;
LABEL_131:

LABEL_49:
  if ((v47 || v26)
    && ([(lite_job_t *)v1 spoolDocumentFormat],
        CFStringRef v48 = objc_claimAutoreleasedReturnValue(),
        BOOL v49 = [v48 caseInsensitiveCompare:@"image/png"] == 0,
        v48,
        !v49))
  {
    if (!v47) {
      CFStringRef v47 = lite_print_pdf;
    }
  }
  else if (v22 && !v1->force_raster)
  {
    if ([v22 containsObject:@"application/pdf"]) {
      CFStringRef v47 = lite_print_pdfimage;
    }
    else {
      CFStringRef v47 = lite_print_image;
    }
  }
  else
  {
    if (!v26)
    {
      unsigned int v59 = [(lite_job_t *)v1 spoolDocumentFilename];
      if (sub_100055A88(v59, &v118))
      {
        int v60 = v118;
        int v61 = HIDWORD(v118);
        int v62 = v119;
        BOOL v63 = SHIDWORD(v118) * (uint64_t)(int)v118 * (int)v119 > (unint64_t)MaxImageMemory;

        if (v63)
        {
          int v64 = _PKLogCategory(PKLogCategoryProgress[0]);
          if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
          {
            unsigned int v65 = [(lite_job_t *)v1 printd_job_id];
            if (v1) {
              unsigned int v66 = [(lite_job_t *)v1 destination_job_id];
            }
            else {
              unsigned int v66 = -1;
            }
            *(_DWORD *)char v121 = 67110400;
            unsigned int v122 = v65;
            __int16 v123 = 1024;
            unsigned int v124 = v66;
            __int16 v125 = 1024;
            int v126 = v60;
            __int16 v127 = 1024;
            int v128 = v61;
            __int16 v129 = 1024;
            int v130 = v62;
            __int16 v131 = 2048;
            uint64_t v132 = MaxImageMemory;
            _os_log_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_DEFAULT, "[Job %d][%d] JPEG file is too big to print locally: %dx%dx%d exceeds memory limit of %ld bytes.", v121, 0x2Au);
          }

          goto LABEL_43;
        }
      }
      else
      {
      }
    }
    CFStringRef v47 = lite_print_image;
  }
  id v67 = _PKLogCategory(PKLogCategoryProgress[0]);
  if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v68 = [(lite_job_t *)v1 printd_job_id];
    if (v1) {
      unsigned int v69 = [(lite_job_t *)v1 destination_job_id];
    }
    else {
      unsigned int v69 = -1;
    }
    *(_DWORD *)char v121 = 67109376;
    unsigned int v122 = v68;
    __int16 v123 = 1024;
    unsigned int v124 = v69;
    _os_log_impl((void *)&_mh_execute_header, v67, OS_LOG_TYPE_DEFAULT, "[Job %d][%d] Starting print thread.", v121, 0xEu);
  }

  v114[0] = _NSConcreteStackBlock;
  v114[1] = 3221225472;
  v114[2] = sub_100055DEC;
  v114[3] = &unk_1000A36F0;
  v116 = v47;
  id v115 = v1;
  +[NSThread detachNewThreadWithBlock:v114];

  uint64_t v45 = 1;
LABEL_44:

  return v45;
}

void sub_10005578C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,void *a23)
{
  _Unwind_Resume(a1);
}

uint64_t sub_100055A88(void *a1, _DWORD *a2)
{
  id v3 = a1;
  CFDictionaryRef theDict = 0;
  uint64_t v4 = lite_create_image(v3, 0, 0, &theDict);
  id v5 = v4;
  if (v4)
  {
    ColorSpace = CGImageGetColorSpace(v4);
    if (ColorSpace)
    {
      a2[2] = CGColorSpaceGetNumberOfComponents(ColorSpace);
      if (CGColorSpaceIsICCCompatible())
      {
        CGColorSpaceRef v7 = CGColorSpaceCreateWithName(kCGColorSpaceSRGB);
        CGColorSpaceRef v8 = CGColorSpaceCreateWithName(kCGColorSpaceGenericGrayGamma2_2);
        if (CGColorSpaceEqualToColorSpace())
        {
          a2[3] = 0;
        }
        else
        {
          int v11 = CGColorSpaceEqualToColorSpace();
          a2[3] = v11 ^ 1;
          if (!theDict) {
            LOBYTE(v11) = 1;
          }
          if ((v11 & 1) == 0)
          {
            CFStringRef Value = CFDictionaryGetValue(theDict, kCGImagePropertyProfileName);
            if (Value) {
              BOOL v13 = CFEqual(Value, @"Apple Wide Color Sharing Profile") != 0;
            }
            else {
              BOOL v13 = 0;
            }
            a2[3] = !v13;
          }
        }
        if (v7) {
          CFRelease(v7);
        }
        if (v8) {
          CFRelease(v8);
        }
      }
      else
      {
        a2[3] = 1;
      }
    }
    else
    {
      *((void *)a2 + 1) = 3;
    }
    if (!theDict) {
      goto LABEL_35;
    }
    int valuePtr = 0;
    CFNumberRef v14 = (const __CFNumber *)CFDictionaryGetValue(theDict, kCGImagePropertyOrientation);
    if (v14)
    {
      if (CFNumberGetValue(v14, kCFNumberIntType, &valuePtr)) {
        int v15 = valuePtr;
      }
      else {
        int v15 = 1;
      }
    }
    else
    {
      int v15 = 1;
    }
    CFDictionaryRef v16 = (const __CFDictionary *)CFDictionaryGetValue(theDict, kCGImagePropertyJFIFDictionary);
    if (v16)
    {
      CFBooleanRef v17 = (const __CFBoolean *)CFDictionaryGetValue(v16, kCGImagePropertyJFIFIsProgressive);
      if (v17) {
        BOOL v18 = CFBooleanGetValue(v17) != 0;
      }
      else {
        BOOL v18 = 0;
      }
      a2[4] = v18;
    }
    CFRelease(theDict);
    if (v15 >= 5)
    {
      *a2 = CGImageGetHeight(v5);
      int Width = CGImageGetWidth(v5);
    }
    else
    {
LABEL_35:
      *a2 = CGImageGetWidth(v5);
      int Width = CGImageGetHeight(v5);
    }
    a2[1] = Width;
    CFRelease(v5);
    uint64_t v10 = 1;
  }
  else
  {
    __int16 v9 = _PKLogCategory(PKLogCategoryProgress[0]);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)stat buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "lite_get_jpeg_dimensions: Unable to open image from job file.", buf, 2u);
    }

    uint64_t v10 = 0;
  }

  return v10;
}

void sub_100055D10(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_100055D44(void *a1)
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  id v3[2] = sub_10005D724;
  void v3[3] = &unk_1000A21D0;
  id v4 = a1;
  id v1 = v4;
  [v1 _withActivity:v3];

  return 0;
}

void sub_100055DD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

uint64_t sub_100055DEC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 40))(*(void *)(a1 + 32));
}

uint64_t _liteOpenDriver(lite_job_t *a1, lite_driver_s *a2, NSString *a3, ipp_orient_e a4, int a5, int a6)
{
  double v44 = a1;
  int v42 = a3;
  __int16 v9 = _PKLogCategory(PKLogCategoryProgress[0]);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v10 = [(lite_job_t *)v44 printd_job_id];
    if (v44) {
      unsigned int v11 = [(lite_job_t *)v44 destination_job_id];
    }
    else {
      unsigned int v11 = -1;
    }
    *(_DWORD *)stat buf = 67110146;
    *(_DWORD *)&uint8_t buf[4] = v10;
    __int16 v55 = 1024;
    unsigned int v56 = v11;
    __int16 v57 = 2112;
    BOOL v58 = v42;
    __int16 v59 = 1024;
    ipp_orient_e v60 = a4;
    __int16 v61 = 1024;
    LODWORD(v62) = a5;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "[Job %d][%d] Opening output stream, format=\"%@\", orientation=%d, num_sheets=%d", buf, 0x24u);
  }

  BOOL v12 = [(lite_job_t *)v44 printer];
  BOOL v13 = [(lite_job_t *)v44 printer];
  liteNotifyPrinter(v12, [v13 reasons] | 2, @"_liteOpenDriver:Connecting");

  CFNumberRef v14 = v44;
  int v15 = v42;
  long long v51 = 0u;
  long long v52 = 0u;
  CFDictionaryRef v16 = v14;
  unsigned int v46 = v16;
  ipp_orient_e v47 = a4;
  int v48 = a5;
  int v49 = a6;
  long long v50 = v15;
  uint64_t v45 = v50;
  if (!v50)
  {
    unsigned int v20 = _PKLogCategory(PKLogCategoryProgress[0]);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      unsigned int v21 = [(lite_job_t *)v16 printd_job_id];
      if (v16) {
        unsigned int v22 = [(lite_job_t *)v16 destination_job_id];
      }
      else {
        unsigned int v22 = -1;
      }
      *(_DWORD *)stat buf = 67109376;
      *(_DWORD *)&uint8_t buf[4] = v21;
      __int16 v55 = 1024;
      unsigned int v56 = v22;
      unsigned int v34 = "[Job %d][%d] Unknown job format.";
      goto LABEL_21;
    }
LABEL_22:

    goto LABEL_23;
  }
  CFBooleanRef v17 = [(lite_job_t *)v16 printer];
  BOOL v18 = objc_msgSend(v17, "device_uri");
  id v19 = [v18 absoluteString];
  if (!strncmp((const char *)[v19 UTF8String], "ipp://", 6uLL))
  {
    __int16 v23 = [(lite_job_t *)v16 printer];
    unsigned int v24 = [v23 displayName];
    BOOL v25 = !PKAllowNonTLSConnection(v24);

    if (!v25) {
      goto LABEL_13;
    }
    unsigned int v20 = _PKLogCategory(PKLogCategoryProgress[0]);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      unsigned int v32 = [(lite_job_t *)v16 printd_job_id];
      if (v16) {
        unsigned int v33 = [(lite_job_t *)v16 destination_job_id];
      }
      else {
        unsigned int v33 = -1;
      }
      *(_DWORD *)stat buf = 67109376;
      *(_DWORD *)&uint8_t buf[4] = v32;
      __int16 v55 = 1024;
      unsigned int v56 = v33;
      unsigned int v34 = "[Job %d][%d] Non secure connection is not trusted, aborting job.";
LABEL_21:
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, v34, buf, 0xEu);
      goto LABEL_22;
    }
    goto LABEL_22;
  }

LABEL_13:
  if ([(lite_job_t *)v16 is_canceled]
    || (+[NSString stringWithFormat:@"%s:%d", "_connectAndDoMostOfTheWork", 1339], v26 = (NSString *)objc_claimAutoreleasedReturnValue(), BOOL v27 = _liteNotifyCheck(0, v26) == 2, v26, !v27))
  {
    int v28 = [(lite_job_t *)v16 printer];
    CFStringRef v29 = [(lite_job_t *)v16 printer];
    unsigned int v30 = [v29 reasons];
    int v31 = +[NSString stringWithUTF8String:"_connectAndDoMostOfTheWork"];
    liteNotifyPrinter(v28, v30 & 0xFFFFFFFD, v31);

    sub_10005C240(v53, v16, v50, @"_send_validate_job");
  }
LABEL_23:
  [(lite_job_t *)v16 cancelThisJob];

  unsigned int v35 = [(lite_job_t *)v16 printer];
  unsigned int v36 = [(lite_job_t *)v16 printer];
  liteNotifyPrinter(v35, (unint64_t)[v36 reasons] & 0xFFFFFFFD, @"_liteOpenDriver:PastConnecting");

  id v37 = +[NSString stringWithFormat:@"abort_reason: 0x%x", 0x200000];
  unsigned int v38 = +[NSString stringWithFormat:@"%s:%d/%@", "_liteOpenDriver", 1482, v37];

  CFStringRef v39 = [(lite_job_t *)v16 printer];
  double v40 = [(lite_job_t *)v16 printer];
  liteNotifyPrinter(v39, [v40 reasons] | 0x200000, v38);

  return 0;
}

void sub_1000576FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, _Unwind_Exception *exception_object, void *a16, void *a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,void *a23,uint64_t a24,uint64_t a25,void *a26,id a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,void *a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,char a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59)
{
  sub_10005C1C0((uint64_t)&a37);
  sub_1000153EC(&a45);

  sub_10005B1BC(&a27);
  _Unwind_Resume(a1);
}

uint64_t sub_100057BA4(void *a1, uint64_t a2, uint64_t a3)
{
  id v5 = a1;
  if (objc_msgSend(v5, "is_canceled"))
  {
    uint64_t v6 = -1;
  }
  else
  {
    uint64_t v6 = (uint64_t)[v5[2] writeIPPDocumentPayload:a2 length:a3];
    if (v6 >= 1) {
      objc_msgSend(v5, "make_progress:", v6);
    }
  }

  return v6;
}

void sub_100057C24(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100057C38(uint64_t a1, uint64_t a2)
{
  id v4 = _PKLogCategory(PKLogCategoryProgress[0]);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v5 = objc_msgSend(*(id *)(a1 + 32), "printd_job_id");
    uint64_t v6 = *(void **)(a1 + 32);
    if (v6) {
      unsigned int v7 = objc_msgSend(v6, "destination_job_id");
    }
    else {
      unsigned int v7 = -1;
    }
    v8[0] = 67109634;
    v8[1] = v5;
    __int16 v9 = 1024;
    unsigned int v10 = v7;
    __int16 v11 = 2080;
    uint64_t v12 = a2;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[Job %d][%d] %s", (uint8_t *)v8, 0x18u);
  }
}

void sub_100057D2C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t liteInitializeLiteDriverStruct(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, unsigned int a5)
{
  CGColorSpaceRef v8 = a3;
  unsigned int v79 = 0;
  int v9 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 128))(a1);
  if (v9)
  {
    if (*(_DWORD *)(a4 + 128) && v9 <= 255 && *(_DWORD *)(a4 + 132))
    {
      *(_DWORD *)(a4 + 88) = 1;
    }
    else
    {
      *(_DWORD *)(a4 + 88) = v9;
      LOBYTE(v9) = 1;
    }
  }
  else
  {
    LOBYTE(v9) = 1;
    *(_DWORD *)(a4 + 88) = 1;
  }
  *(unsigned char *)(a4 + 23) = v9;
  unsigned int v10 = (*(void (**)(uint64_t))(*(void *)a1 + 544))(a1);
  if (!v10)
  {
    unsigned int v10 = (*(void (**)(uint64_t))(*(void *)a1 + 448))(a1);
    if (!v10)
    {
      id v78 = 0;
      int v13 = (*(unsigned __int8 *)(a4 + 120) >> 1) & 1;
      goto LABEL_24;
    }
  }
  id v78 = v10;
  if (![v10 compare:@"monochrome"]
    || ![v78 compare:@"auto-monochrome"]
    || ![v78 compare:@"process-monochrome"])
  {
    if ((*(unsigned int (**)(uint64_t))(*(void *)a1 + 584))(a1)
      && (*(unsigned int (**)(uint64_t))(*(void *)a1 + 576))(a1) == 5
      && *(_DWORD *)(a4 + 2016))
    {
      LOBYTE(v13) = 8;
LABEL_24:
      *(unsigned char *)(a4 + 17) = v13;
      if (!(*(unsigned int (**)(uint64_t))(*(void *)a1 + 584))(a1)
        || (*(unsigned int (**)(uint64_t))(*(void *)a1 + 576))(a1) != 5
        || *(unsigned char *)(a4 + 17) != 1)
      {
        goto LABEL_35;
      }
      int v14 = *(_DWORD *)(a4 + 2012);
      if (*(_DWORD *)(a4 + 2008))
      {
        if (!v14)
        {
          char v15 = 3;
LABEL_34:
          *(unsigned char *)(a4 + 17) = v15;
LABEL_35:
          int v16 = *(unsigned __int8 *)(a4 + 19);
          if (v16 == 5) {
            int v17 = 1440;
          }
          else {
            int v17 = 720;
          }
          if (v16 == 3) {
            int v18 = 360;
          }
          else {
            int v18 = v17;
          }
          unsigned int v19 = *(_DWORD *)(a4 + 2020);
          *(_DWORD *)(a4 + 36) = v19;
          uint64_t v20 = *(unsigned int *)(a4 + 2000);
          if ((int)v20 >= 2)
          {
            signed int v21 = *(_DWORD *)(a4 + 2024);
            if (v21 <= v18)
            {
              unsigned int v22 = (int *)(a4 + 2028);
              uint64_t v23 = v20 - 2;
              do
              {
                unsigned int v19 = v21;
                *(_DWORD *)(a4 + 36) = v21;
                if (!v23) {
                  break;
                }
                int v24 = *v22++;
                signed int v21 = v24;
                --v23;
              }
              while (v24 <= v18);
            }
          }
          if (v16 == 3)
          {
            if (v19 >= 0x169)
            {
              unsigned int v25 = v19 >> 1;
              *(_DWORD *)(a4 + 112) = v25;
              *(_DWORD *)(a4 + 116) = v25;
              *(_DWORD *)(a4 + 36) = v25;
              goto LABEL_54;
            }
          }
          else if (v16 != 5)
          {
            *(_DWORD *)(a4 + 112) = v19;
            if (v19 >= 0x169) {
              unsigned int v19 = (int)v19 / 2;
            }
            goto LABEL_53;
          }
          *(_DWORD *)(a4 + 112) = v19;
LABEL_53:
          *(_DWORD *)(a4 + 116) = v19;
LABEL_54:
          BOOL v77 = (*(void (**)(uint64_t))(*(void *)a1 + 672))(a1);
          if (v77)
          {
            if (a5 == 1 || ![v77 compare:@"one-sided"])
            {
              char v26 = 1;
              goto LABEL_63;
            }
            if (*(unsigned char *)(a4 + 120))
            {
              if (![v77 compare:@"two-sided-long-edge"])
              {
                char v26 = 3;
                goto LABEL_63;
              }
              if ((*(unsigned char *)(a4 + 120) & 1) != 0
                && ![v77 compare:@"two-sided-short-edge"])
              {
                char v26 = 2;
LABEL_63:
                *(unsigned char *)(a4 + 18) = v26;
              }
            }
          }
          uint64_t v27 = *(unsigned int *)(a4 + 988);
          *(_DWORD *)(a4 + 80) = v27;
          int v28 = (_DWORD *)((char *)&MediaSizes + 8 * v27);
          LODWORD(v30) = *v28;
          LODWORD(v29) = v28[1];
          unsigned int v79 = 0;
          if (*(unsigned __int8 *)(a4 + 18) >= 2u
            && *(_DWORD *)(a4 + 956)
            && *(_DWORD *)(a4 + 960)
            && *(_DWORD *)(a4 + 964)
            && *(_DWORD *)(a4 + 968))
          {
            int v31 = (_OWORD *)(a4 + 956);
          }
          else
          {
            int v31 = (_OWORD *)(a4 + 972);
          }
          *(_OWORD *)(a4 + 96) = *v31;
          if (!pwgInitSize((uint64_t)v80, a1, &v79)) {
            goto LABEL_77;
          }
          unsigned int v32 = pwgMediaForSize(v80[0], v80[1], (uint64_t)v84);
          uint64_t v30 = *((unsigned int *)v32 + 6);
          uint64_t v29 = *((unsigned int *)v32 + 7);
          uint64_t v33 = v81;
          if (v79)
          {
            unsigned int v34 = v82;
            *(_DWORD *)(a4 + 96) = v81;
            *(_DWORD *)(a4 + 100) = v34;
            unsigned int v35 = v83;
            *(void *)(a4 + 104) = v83;
            uint64_t v36 = v35;
          }
          else
          {
            uint64_t v36 = v83;
          }
          if ((int)v36 + (int)v33 >= (int)v30)
          {
            id v59 = +[NSString stringWithFormat:@"Unsupported margin/width combination: left:%d right:%d width:%d.", v33, v36, v30];
            v8[2](v8, [v59 UTF8String]);
          }
          else
          {
            if ((int)(HIDWORD(v83) + v82) < (int)v29)
            {
LABEL_77:
              char v37 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 640))(a1);
              *(_DWORD *)(a4 + 84) = validate_enum<ipp_orient_e,unsigned char>(v37);
              unsigned int v38 = (**(void (***)(uint64_t))a1)(a1);
              unsigned int v76 = v38;
              if (v38)
              {
                CFStringRef v39 = [v38 mediaSource];
                if (v39)
                {
                  uint64_t v40 = 0;
                  while (1)
                  {
                    int v41 = (&MediaSourceStrings)[v40];
                    id v42 = v39;
                    if (!strcmp((const char *)[v42 UTF8String], v41)) {
                      break;
                    }
                    if (++v40 == 50)
                    {
                      id v43 = +[NSString stringWithFormat:@"Unsupported URF media-source \"%@\".", v42];
                      v8[2](v8, [v43 UTF8String]);

                      LOBYTE(v40) = 0;
                      break;
                    }
                  }
                  *(unsigned char *)(a4 + 21) = v40;
                }
                double v44 = [v76 mediaType];
                if (v44)
                {
                  uint64_t v45 = 0;
                  while (1)
                  {
                    unsigned int v46 = (&MediaTypeStrings)[v45];
                    id v47 = v44;
                    if (!strcmp((const char *)[v47 UTF8String], v46)) {
                      break;
                    }
                    if (++v45 == 14)
                    {
                      id v48 = +[NSString stringWithFormat:@"Unsupported URF media-type \"%@\".", v47];
                      v8[2](v8, [v48 UTF8String]);

                      LOBYTE(v45) = 0;
                      break;
                    }
                  }
                  *(unsigned char *)(a4 + 20) = v45;
                }
              }
              if ((int)v30 >= 1 && (int)v29 >= 1)
              {
                int v49 = 0;
                long long v50 = &dword_10006EB04;
                do
                {
                  int v51 = v30 - *(v50 - 1);
                  if (v51 < 0) {
                    int v51 = *(v50 - 1) - v30;
                  }
                  if (v51 <= 0xAF)
                  {
                    int v52 = v29 - *v50;
                    if (v52 < 0) {
                      int v52 = *v50 - v29;
                    }
                    if (v52 < 0xB0) {
                      break;
                    }
                  }
                  ++v49;
                  v50 += 2;
                }
                while (v49 != 24);
                *(_DWORD *)(a4 + 80) = v49;
                *(_DWORD *)(a4 + 92) = 1;
              }
              if (!v79 && *(_DWORD *)(a4 + 952) && (*(unsigned char *)(a4 + 19) == 5 || *(int *)(a4 + 80) <= 7))
              {
                *(void *)(a4 + 96) = 0;
                *(void *)(a4 + 104) = 0;
              }
              BOOL v53 = *(unsigned int (**)(uint64_t, void))(a4 + 2056);
              if (v53 && !v53(a4, a5))
              {
                id v74 = +[NSString stringWithFormat:@"prepjob method returned 0, aborting."];
                v8[2](v8, [v74 UTF8String]);

                uint64_t v12 = 0;
              }
              else
              {
                unsigned __int8 v54 = (unsigned char *)(a4 + 16);
                int v55 = *(_DWORD *)(a4 + 36);
                *(_DWORD *)(a4 + 28) = v55 * (int)v30 / 0x9ECu;
                *(_DWORD *)(a4 + 32) = v55 * (int)v29 / 0x9ECu;
                unsigned __int8 v56 = *(unsigned char *)(a4 + 17) - 1;
                if (v56 > 7u)
                {
                  LOBYTE(v57) = 8;
                  uint64_t v58 = 8;
                }
                else
                {
                  unint64_t v57 = 0x1030080808300818uLL >> (8 * v56);
                  uint64_t v58 = dword_10006F230[(char)v56];
                }
                *unsigned __int8 v54 = v57;
                +[NSString stringWithFormat:@"header.bitsPerPixel = %u", v58];
                id v60 = objc_claimAutoreleasedReturnValue();
                v8[2](v8, [v60 UTF8String]);

                +[NSString stringWithFormat:@"header.colorSpace = %u", *(unsigned __int8 *)(a4 + 17)];
                id v61 = objc_claimAutoreleasedReturnValue();
                v8[2](v8, [v61 UTF8String]);

                +[NSString stringWithFormat:@"header.duplexMode = %u", *(unsigned __int8 *)(a4 + 18)];
                id v62 = objc_claimAutoreleasedReturnValue();
                v8[2](v8, [v62 UTF8String]);

                +[NSString stringWithFormat:@"header.printQualitdouble y = %u", *(unsigned __int8 *)(a4 + 19)];
                id v63 = objc_claimAutoreleasedReturnValue();
                v8[2](v8, [v63 UTF8String]);

                +[NSString stringWithFormat:@"header.mediaCGPDFObjectType Type = %u", *(unsigned __int8 *)(a4 + 20)];
                id v64 = objc_claimAutoreleasedReturnValue();
                v8[2](v8, [v64 UTF8String]);

                +[NSString stringWithFormat:@"header.inputSlot = %u", *(unsigned __int8 *)(a4 + 21)];
                id v65 = objc_claimAutoreleasedReturnValue();
                v8[2](v8, [v65 UTF8String]);

                +[NSString stringWithFormat:@"header.outputBiunint64_t n = %u", *(unsigned __int8 *)(a4 + 22)];
                id v66 = objc_claimAutoreleasedReturnValue();
                v8[2](v8, [v66 UTF8String]);

                +[NSString stringWithFormat:@"header.finishings = %u %u %u %u", *(unsigned __int8 *)(a4 + 24), *(unsigned __int8 *)(a4 + 25), *(unsigned __int8 *)(a4 + 26), *(unsigned __int8 *)(a4 + 27)];
                id v67 = objc_claimAutoreleasedReturnValue();
                v8[2](v8, [v67 UTF8String]);

                +[NSString stringWithFormat:@"header.double width = %u", *(unsigned int *)(a4 + 28)];
                id v68 = objc_claimAutoreleasedReturnValue();
                v8[2](v8, [v68 UTF8String]);

                +[NSString stringWithFormat:@"header.double height = %u", *(unsigned int *)(a4 + 32)];
                id v69 = objc_claimAutoreleasedReturnValue();
                v8[2](v8, [v69 UTF8String]);

                +[NSString stringWithFormat:@"header.resolutiounint64_t n = %u", *(unsigned int *)(a4 + 36)];
                id v70 = objc_claimAutoreleasedReturnValue();
                v8[2](v8, [v70 UTF8String]);

                +[NSString stringWithFormat:@"xres = %u", *(unsigned int *)(a4 + 112)];
                id v71 = objc_claimAutoreleasedReturnValue();
                v8[2](v8, [v71 UTF8String]);

                +[NSString stringWithFormat:@"yres = %u", *(unsigned int *)(a4 + 116)];
                id v72 = objc_claimAutoreleasedReturnValue();
                v8[2](v8, [v72 UTF8String]);

                long long v73 = *(_OWORD *)(a4 + 32);
                *(_OWORD *)(a4 + 48) = *(_OWORD *)v54;
                *(_OWORD *)(a4 + 64) = v73;
                uint64_t v12 = 1;
              }

              goto LABEL_118;
            }
            id v59 = +[NSString stringWithFormat:@"Unsupported margin/width combination: bottom:%d top:%d height:%d.", v82, HIDWORD(v83), v29];
            v8[2](v8, [v59 UTF8String]);
          }

          uint64_t v12 = 0;
LABEL_118:

          goto LABEL_119;
        }
      }
      else if (!v14)
      {
        goto LABEL_35;
      }
      char v15 = 7;
      goto LABEL_34;
    }
LABEL_23:
    LOBYTE(v13) = 0;
    goto LABEL_24;
  }
  if ((*(unsigned char *)(a4 + 120) & 2) != 0
    && (![v78 compare:@"color"]
     || (*(unsigned char *)(a4 + 120) & 2) != 0 && ![v78 compare:@"auto"]))
  {
    LOBYTE(v13) = 1;
    goto LABEL_24;
  }
  if (![v78 compare:@"auto"]) {
    goto LABEL_23;
  }
  id v11 = +[NSString stringWithFormat:@"Unsupported outputMode %@ ", v78];
  v8[2](v8, [v11 UTF8String]);

  uint64_t v12 = 0;
LABEL_119:

  return v12;
}

void sub_1000589CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

uint64_t liteOpenDriver(lite_job_t *a1, lite_driver_s *a2, NSString *a3, ipp_orient_e a4, int a5, int a6)
{
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x2020000000;
  int v25 = 0;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100058CD0;
  v14[3] = &unk_1000A3768;
  int v17 = &v22;
  int v18 = a2;
  char v15 = a1;
  int v16 = a3;
  ipp_orient_e v19 = a4;
  int v20 = a5;
  int v21 = a6;
  unsigned int v10 = v16;
  id v11 = v15;
  [(lite_job_t *)v11 _withActivity:v14];

  uint64_t v12 = *((unsigned int *)v23 + 6);
  _Block_object_dispose(&v22, 8);
  return v12;
}

void sub_100058CA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, void *a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);

  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100058CD0(uint64_t a1, os_activity_t activity)
{
  id v3 = _os_activity_create((void *)&_mh_execute_header, "liteOpenDriver", activity, OS_ACTIVITY_FLAG_DEFAULT);
  id v4 = _PKLogCategory(PKLogCategoryProgress[0]);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v5 = objc_msgSend(*(id *)(a1 + 32), "printd_job_id");
    uint64_t v6 = *(void **)(a1 + 32);
    if (v6) {
      unsigned int v7 = objc_msgSend(v6, "destination_job_id");
    }
    else {
      unsigned int v7 = -1;
    }
    *(_DWORD *)stat buf = 67109890;
    unsigned int v25 = v5;
    __int16 v26 = 1024;
    unsigned int v27 = v7;
    __int16 v28 = 2048;
    uint64_t v29 = v3;
    __int16 v30 = 2080;
    int v31 = "liteOpenDriver";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[Job %d][%d] Activity (%p) ENTER: %s", buf, 0x22u);
  }

  int v14 = _NSConcreteStackBlock;
  uint64_t v15 = 3221225472;
  int v16 = sub_100058F80;
  int v17 = &unk_1000A3740;
  uint64_t v20 = *(void *)(a1 + 48);
  id v8 = *(id *)(a1 + 32);
  uint64_t v9 = *(void *)(a1 + 56);
  id v18 = v8;
  uint64_t v21 = v9;
  id v19 = *(id *)(a1 + 40);
  uint64_t v22 = *(void *)(a1 + 64);
  int v23 = *(_DWORD *)(a1 + 72);
  os_activity_apply(v3, &v14);
  unsigned int v10 = _PKLogCategory(PKLogCategoryProgress[0]);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v11 = objc_msgSend(*(id *)(a1 + 32), "printd_job_id", v14, v15, v16, v17, v18);
    uint64_t v12 = *(void **)(a1 + 32);
    if (v12) {
      unsigned int v13 = objc_msgSend(v12, "destination_job_id");
    }
    else {
      unsigned int v13 = -1;
    }
    *(_DWORD *)stat buf = 67109890;
    unsigned int v25 = v11;
    __int16 v26 = 1024;
    unsigned int v27 = v13;
    __int16 v28 = 2048;
    uint64_t v29 = v3;
    __int16 v30 = 2080;
    int v31 = "liteOpenDriver";
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[Job %d][%d] Activity (%p) EXIT: %s", buf, 0x22u);
  }
}

void sub_100058F38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

uint64_t sub_100058F80(uint64_t a1)
{
  uint64_t result = _liteOpenDriver(*(lite_job_t **)(a1 + 32), *(lite_driver_s **)(a1 + 56), *(NSString **)(a1 + 40), (ipp_orient_e)*(_DWORD *)(a1 + 64), *(_DWORD *)(a1 + 68), *(_DWORD *)(a1 + 72));
  *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  return result;
}

uint64_t sub_100058FC4(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) ippSession];
  id v3 = [*(id *)(a1 + 40) printer];
  uint64_t v4 = sub_10005937C((uint64_t)v2, v3, a1);

  return v4;
}

void sub_10005902C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_100059048(uint64_t a1)
{
  return sub_1000592DC((void *)a1);
}

void sub_100059084(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  sub_10005921C(a1, 8u, a3);
}

void sub_10005917C(_Unwind_Exception *a1)
{
  sub_1000592DC((void *)v2);
  _Unwind_Resume(a1);
}

void sub_1000591CC(uint64_t a1)
{
  sub_1000592DC((void *)a1);

  operator delete();
}

void sub_10005921C(void *a1, unsigned __int16 a2, void *a3)
{
  *sub_100014A3C(a1, a2, a3) = off_1000A3800;
  operator new();
}

void sub_10005928C(_Unwind_Exception *a1)
{
  sub_10000F138(v1);
  _Unwind_Resume(a1);
}

void sub_1000592A4(void *a1)
{
  sub_1000592DC(a1);

  operator delete();
}

uint64_t sub_1000592DC(void *a1)
{
  *a1 = off_1000A3800;
  uint64_t v1 = (id *)a1[3];
  if (v1)
  {

    operator delete();
  }
  uint64_t v2 = (id *)a1[4];
  if (v2)
  {

    operator delete();
  }

  return sub_10000F138((uint64_t)a1);
}

uint64_t sub_10005937C(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4 = [a2 sendSingleIPPRequest:a3 session:a1];
  if (![v4 transportStatus])
  {
    uint64_t v6 = [v4 ippResponse];
    sub_10005942C(a3, v6);
  }
  if ([v4 transportStatus] == 6) {
    uint64_t v5 = 1026;
  }
  else {
    uint64_t v5 = 1280;
  }

  return v5;
}

void sub_100059410(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10005942C(uint64_t a1, void *a2)
{
  id v2 = a2;
  operator new();
}

void sub_100059474(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100059484(void *a1, void *a2, void *a3, uint64_t a4, void *a5, void *a6)
{
  id v10 = a2;
  id v11 = a3;
  id v12 = a5;
  sub_100059648(a1, 9u, a6);
}

void sub_1000595A0(_Unwind_Exception *a1)
{
  sub_100059708((void *)v2);
  _Unwind_Resume(a1);
}

void sub_1000595F0(uint64_t a1)
{
  sub_100059708((void *)a1);

  operator delete();
}

void sub_100059648(void *a1, unsigned __int16 a2, void *a3)
{
  *sub_100014A3C(a1, a2, a3) = off_1000A3888;
  operator new();
}

void sub_1000596B8(_Unwind_Exception *a1)
{
  sub_10000F138(v1);
  _Unwind_Resume(a1);
}

void sub_1000596D0(void *a1)
{
  sub_100059708(a1);

  operator delete();
}

uint64_t sub_100059708(void *a1)
{
  *a1 = off_1000A3888;
  uint64_t v1 = (id *)a1[3];
  if (v1)
  {

    operator delete();
  }
  uint64_t v2 = (id *)a1[4];
  if (v2)
  {

    operator delete();
  }

  return sub_10000F138((uint64_t)a1);
}

uint64_t sub_1000597A8(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4 = [a2 sendSingleIPPRequest:a3 session:a1];
  if (![v4 transportStatus])
  {
    uint64_t v6 = [v4 ippResponse];
    sub_100059858(a3, v6);
  }
  if ([v4 transportStatus] == 6) {
    uint64_t v5 = 1026;
  }
  else {
    uint64_t v5 = 1280;
  }

  return v5;
}

void sub_10005983C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100059858(uint64_t a1, void *a2)
{
  id v2 = a2;
  operator new();
}

void sub_1000598A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000598B0(void *a1, id *a2, uint64_t a3)
{
  id v38 = a1;
  CFStringRef v39 = v38;
  uint64_t v5 = [*a2 printer];
  objc_msgSend(v5, "device_uri");
  uint64_t v6 = (NSURL *)objc_claimAutoreleasedReturnValue();
  Printd_Parameters::_set_PrinterURI(&v39, v6);

  unsigned int v7 = [*a2 printer];
  usernameFromPreviouslyAuthedPrinterOrJustMobile(v7);
  id v8 = (NSString *)objc_claimAutoreleasedReturnValue();
  Printd_Parameters::_set_RequestingUserName(&v39, v8);

  id v9 = objc_msgSend(*a2, "request_attrs");
  (*(void (**)(id))(*(void *)v9 + 352))(v9);
  id v10 = (NSString *)objc_claimAutoreleasedReturnValue();
  if (v10) {
    Printd_Parameters::_set_JobName(&v39, v10);
  }

  id v11 = [*a2 printer];
  id v12 = [v11 mandatoryJobAttributes];
  BOOL v13 = [v12 count] == 0;

  if (!v13)
  {
    int v14 = [*a2 printer];
    uint64_t v15 = [v14 mandatoryJobAttributes];
    unsigned int v16 = [v15 containsObject:@"job-password"];

    if (v16)
    {
      *(void *)__str = 0;
      uint64_t v45 = 0;
      uint32_t v17 = arc4random();
      snprintf(__str, 0x10uLL, "%04d", v17 % 0x2710);
      id v18 = +[NSData dataWithBytes:__str length:4];
      Printd_Parameters::_set_JobPassword(&v39, v18);
      Printd_Parameters::_set_JobPasswordEncryption(&v39, @"none");
      [*a2 setJobPassword:v18];
      [*a2 setJobPasswordEncryption:@"none"];
    }
  }
  if (*(void *)a3) {
    Printd_Parameters::_set_JobAuthorizationURI(&v39, *(NSString **)a3);
  }
  sub_10005B1F8(v39, (uint64_t)a2);
  id v19 = v39;
  uint64_t v20 = *(void **)(a3 + 8);
  id v21 = objc_msgSend(*a2, "request_attrs");
  uint64_t v22 = (*(void (**)(id))(*(void *)v21 + 512))(v21);
  id v23 = v19;
  id v24 = v20;
  id v25 = v22;
  id v26 = v24;
  id v27 = v25;
  char v37 = v23;
  if (v27)
  {
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id v28 = v26;
    id v29 = [v28 countByEnumeratingWithState:&v40 objects:__str count:16];
    if (v29)
    {
      uint64_t v30 = *(void *)v41;
      while (2)
      {
        for (unint64_t i = 0; i != v29; unint64_t i = (char *)i + 1)
        {
          if (*(void *)v41 != v30) {
            objc_enumerationMutation(v28);
          }
          unsigned int v32 = *(void **)(*((void *)&v40 + 1) + 8 * i);
          uint64_t v33 = [v32 _findAttribute0:@"preset-name" valueTag:0];
          unsigned int v34 = ippGetIXString(v33, 0);

          if (v34 && ![v34 compare:v27])
          {
            id v35 = v32;

            goto LABEL_21;
          }
        }
        id v29 = [v28 countByEnumeratingWithState:&v40 objects:__str count:16];
        if (v29) {
          continue;
        }
        break;
      }
    }
    id v35 = 0;
LABEL_21:
  }
  else
  {
    id v35 = 0;
  }

  *(void *)__str = _NSConcreteStackBlock;
  uint64_t v45 = 3221225472;
  unsigned int v46 = sub_10005C938;
  id v47 = &unk_1000A3980;
  id v36 = v37;
  id v48 = v36;
  [v35 enumerateAttributes:__str];
}

void sub_100059D00(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object, uint64_t a11, uint64_t a12, void *a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27)
{
  _Unwind_Resume(a1);
}

void sub_100059DD0()
{
  JUMPOUT(0x100059DECLL);
}

void sub_100059DDC()
{
  JUMPOUT(0x100059DECLL);
}

void sub_100059DE8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{
  JUMPOUT(0x100059DA0);
}

void sub_100059E18(void *a1, uint64_t a2, uint64_t a3)
{
  id v5 = a1;
  id v11 = v5;
  Printd_Parameters::_set_DocumentFormat(&v11, *(NSString **)(a2 + 24));
  id v6 = objc_msgSend(*(id *)a2, "request_attrs");
  (*(void (**)(id))(*(void *)v6 + 192))(v6);
  unsigned int v7 = (NSData *)objc_claimAutoreleasedReturnValue();
  if (v7) {
    Printd_Parameters::_set_DocumentPassword(&v11, v7);
  }
  id v8 = *(NSString **)(a3 + 24);
  if (v8) {
    Printd_Parameters::_set_Compression(&v11, v8);
  }
  id v9 = [*(id *)a2 printer];
  usernameFromPreviouslyAuthedPrinterOrJustMobile(v9);
  id v10 = (NSString *)objc_claimAutoreleasedReturnValue();
  Printd_Parameters::_set_RequestingUserName(&v11, v10);
}

void sub_100059EFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  int v14 = v13;

  _Unwind_Resume(a1);
}

void sub_100059F44(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  _DWORD v2[2] = sub_100059FDC;
  v2[3] = &unk_1000A21D0;
  id v3 = v1;
  [v3 _withActivity:v2];
}

void sub_100059FC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_100059FDC(uint64_t a1, os_activity_t activity)
{
  id v3 = _os_activity_create((void *)&_mh_execute_header, "Thread: Printer Monitor", activity, OS_ACTIVITY_FLAG_DEFAULT);
  uint64_t v4 = _PKLogCategory(PKLogCategoryProgress[0]);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v5 = objc_msgSend(*(id *)(a1 + 32), "printd_job_id");
    id v6 = *(void **)(a1 + 32);
    if (v6) {
      unsigned int v7 = objc_msgSend(v6, "destination_job_id");
    }
    else {
      unsigned int v7 = -1;
    }
    *(_DWORD *)stat buf = 67109890;
    unsigned int v15 = v5;
    __int16 v16 = 1024;
    unsigned int v17 = v7;
    __int16 v18 = 2048;
    id v19 = v3;
    __int16 v20 = 2080;
    id v21 = "Thread: Printer Monitor";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[Job %d][%d] Activity (%p) ENTER: %s", buf, 0x22u);
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10005A250;
  block[3] = &unk_100095360;
  id v13 = *(id *)(a1 + 32);
  os_activity_apply(v3, block);
  id v8 = _PKLogCategory(PKLogCategoryProgress[0]);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v9 = objc_msgSend(*(id *)(a1 + 32), "printd_job_id");
    id v10 = *(void **)(a1 + 32);
    if (v10) {
      unsigned int v11 = objc_msgSend(v10, "destination_job_id");
    }
    else {
      unsigned int v11 = -1;
    }
    *(_DWORD *)stat buf = 67109890;
    unsigned int v15 = v9;
    __int16 v16 = 1024;
    unsigned int v17 = v11;
    __int16 v18 = 2048;
    id v19 = v3;
    __int16 v20 = 2080;
    id v21 = "Thread: Printer Monitor";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[Job %d][%d] Activity (%p) EXIT: %s", buf, 0x22u);
  }
}

void sub_10005A210(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_10005A250(uint64_t a1)
{
  id v1 = *(id *)(a1 + 32);
  uint64_t v10 = 0;
  unsigned int v11 = &v10;
  uint64_t v12 = 0x2020000000;
  uint64_t v13 = 3;
  id v2 = _PKLogCategory(PKLogCategoryProgress[0]);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)stat buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Starting print monitor", buf, 2u);
  }

  id v3 = objc_msgSend(v1, "request_attrs");
  unsigned int v9 = (*(void (**)(id))(*(void *)v3 + 352))(v3);
  if ((objc_msgSend(v1, "is_canceled") & 1) == 0 && objc_msgSend(v1, "localJobState") == (id)5)
  {
    v11[3] = 3;
    uint64_t v4 = [v1 ippSession];
    unsigned int v5 = [v1 printer];
    sub_10005C4F0(&v15, v4, v5, &off_1000B8FB0, @"monitor_ipp(printer-state-reasons)");
  }
  if (objc_msgSend(v1, "is_canceled"))
  {
    _liteNotifyCancel(@"monitor_ipp(job_canceled)");
    if ((int)objc_msgSend(v1, "destination_job_id") >= 1 && v11[3] <= 6) {
      sub_10005D5D4(&v15, v1, &off_1000B8FF8, @"monitor_ipp(job_was_canceled_had_id)");
    }
  }
  id v6 = _PKLogCategory(PKLogCategoryProgress[0]);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v7 = objc_msgSend(v1, "printd_job_id");
    if (v1) {
      unsigned int v8 = objc_msgSend(v1, "destination_job_id");
    }
    else {
      unsigned int v8 = -1;
    }
    LODWORD(v15) = 67109376;
    HIDWORD(v15) = v7;
    __int16 v16 = 1024;
    unsigned int v17 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[Job %d][%d] exiting print monitor thread", (uint8_t *)&v15, 0xEu);
  }

  _Block_object_dispose(&v10, 8);
}

void sub_10005AF2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39)
{
  sub_100059708((void *)(v41 - 176));
  _Block_object_dispose(&a39, 8);

  _Unwind_Resume(a1);
}

id *sub_10005B1BC(id *a1)
{
  return a1;
}

void sub_10005B1F8(void *a1, uint64_t a2)
{
  id v3 = a1;
  id v61 = v3;
  id v4 = *(id *)a2;
  unsigned int v5 = v4;
  if (*(_DWORD *)(a2 + 16))
  {
    id v6 = objc_msgSend(v4, "request_attrs");
    if ((*(unsigned int (**)(id))(*(void *)v6 + 96))(v6))
    {
      id v7 = objc_msgSend(v5, "request_attrs");
      char v8 = (*(uint64_t (**)(id))(*(void *)v7 + 96))(v7);
      Printd_Parameters::_set_AttributeFidelity(&v61, v8);
    }
    id v9 = objc_msgSend(v5, "request_attrs");
    int v10 = (*(uint64_t (**)(id))(*(void *)v9 + 128))(v9);
    if (v10 >= 1)
    {
      Printd_Parameters::_set_Copies(&v61, v10);
      if (v10 >= 2) {
        Printd_Parameters::_set_MultipleDocumentHandling(&v61, @"separate-documents-collated-copies");
      }
    }
    unsigned int v11 = [v5 printer];
    if (objc_msgSend(v11, "print_scaling_supported"))
    {
      id v12 = objc_msgSend(v5, "request_attrs");
      int v13 = (*(uint64_t (**)(id))(*(void *)v12 + 616))(v12);

      if (!v13) {
        goto LABEL_11;
      }
      id v14 = objc_msgSend(v5, "request_attrs");
      unsigned int v11 = (*(void (**)(id))(*(void *)v14 + 608))(v14);
      Printd_Parameters::_set_PrintScaling(&v61, (NSString *)v11);
    }
  }
LABEL_11:
  id v15 = objc_msgSend(v5, "request_attrs");
  __int16 v16 = (*(void (**)(id))(*(void *)v15 + 256))(v15);

  if (v16)
  {
    id v17 = objc_msgSend(v5, "request_attrs");
    (*(void (**)(id))(*(void *)v17 + 256))(v17);
    __int16 v18 = (ipp_collection_t *)objc_claimAutoreleasedReturnValue();
    Printd_Parameters::_set_FinishingsCol(&v61, v18);
  }
  id v19 = objc_msgSend(v5, "request_attrs");
  __int16 v20 = (*(void (**)(id))(*(void *)v19 + 224))(v19);

  if (v20)
  {
    id v21 = objc_msgSend(v5, "request_attrs");
    uint64_t v22 = (*(void (**)(id))(*(void *)v21 + 224))(v21);
    Printd_Parameters::_set_Finishings(&v61, v22);

    Printd_Parameters::_set_JobPagesPerSet(&v61, (int)[v5 numberOfSheetsPerCopy]);
  }
  id v23 = (void (***)(void))objc_msgSend(v5, "request_attrs");
  id v24 = (**v23)(v23);

  if (v24)
  {
    id v25 = (void (***)(void))objc_msgSend(v5, "request_attrs");
    (**v25)(v25);
    id v26 = (PKMediaCol *)objc_claimAutoreleasedReturnValue();
    Printd_Parameters::_set_MediaCol(&v61, v26);
  }
  else
  {
    id v27 = objc_msgSend(v5, "request_attrs");
    id v28 = (*(void (**)(id))(*(void *)v27 + 704))(v27);

    if (!v28) {
      goto LABEL_20;
    }
    id v29 = objc_msgSend(v5, "request_attrs");
    (*(void (**)(id))(*(void *)v29 + 704))(v29);
    id v26 = (PKMediaCol *)objc_claimAutoreleasedReturnValue();
    Printd_Parameters::_set_Media(&v61, (NSString *)v26);
  }

LABEL_20:
  uint64_t v30 = [v5 spoolDocumentFormat];
  unsigned __int8 v31 = [v30 isEqual:@"image/jpeg"];

  if (v31) {
    goto LABEL_25;
  }
  ipp_orient_e v32 = *(_DWORD *)(a2 + 8);
  if (!v32)
  {
    id v33 = objc_msgSend(v5, "request_attrs");
    if (!(*(unsigned int (**)(id))(*(void *)v33 + 392))(v33)) {
      goto LABEL_25;
    }
    id v34 = objc_msgSend(v5, "request_attrs");
    ipp_orient_e v32 = (*(unsigned int (**)(id))(*(void *)v34 + 384))(v34);
  }
  Printd_Parameters::_set_OrientationRequested(&v61, v32);
LABEL_25:
  id v35 = objc_msgSend(v5, "request_attrs");
  id v36 = (*(void (**)(id))(*(void *)v35 + 416))(v35);

  if (v36)
  {
    id v37 = objc_msgSend(v5, "request_attrs");
    (*(void (**)(id))(*(void *)v37 + 416))(v37);
    id v38 = (NSString *)objc_claimAutoreleasedReturnValue();
    Printd_Parameters::_set_OutputBin(&v61, v38);
  }
  id v39 = objc_msgSend(v5, "request_attrs");
  long long v40 = (*(void (**)(id))(*(void *)v39 + 544))(v39);

  if (v40)
  {
    id v41 = objc_msgSend(v5, "request_attrs");
    (*(void (**)(id))(*(void *)v41 + 544))(v41);
    long long v42 = (NSString *)objc_claimAutoreleasedReturnValue();
    Printd_Parameters::_set_PrintColorMode(&v61, v42);
  }
  else
  {
    id v43 = objc_msgSend(v5, "request_attrs");
    double v44 = (*(void (**)(id))(*(void *)v43 + 448))(v43);

    if (!v44) {
      goto LABEL_32;
    }
    id v45 = objc_msgSend(v5, "request_attrs");
    (*(void (**)(id))(*(void *)v45 + 448))(v45);
    long long v42 = (NSString *)objc_claimAutoreleasedReturnValue();
    Printd_Parameters::_set_OutputMode(&v61, v42);
  }

LABEL_32:
  id v46 = objc_msgSend(v5, "request_attrs");
  if ((*(unsigned int (**)(id))(*(void *)v46 + 584))(v46))
  {
    id v47 = objc_msgSend(v5, "request_attrs");
    ipp_quality_e v48 = (*(unsigned int (**)(id))(*(void *)v47 + 576))(v47);
    Printd_Parameters::_set_PrintQuality(&v61, v48);
  }
  if (*(_DWORD *)(a2 + 12) != 1)
  {
    id v49 = objc_msgSend(v5, "request_attrs");
    if ((*(unsigned int (**)(id))(*(void *)v49 + 680))(v49))
    {
      id v50 = objc_msgSend(v5, "request_attrs");
      (*(void (**)(id))(*(void *)v50 + 672))(v50);
      int v51 = (NSString *)objc_claimAutoreleasedReturnValue();
      Printd_Parameters::_set_Sides(&v61, v51);
    }
  }
  int v52 = [v5 printer];
  BOOL v53 = [v52 mandatoryJobAttributes];
  unsigned int v54 = [v53 containsObject:@"job-accounting-user-id"];

  if (v54)
  {
    int v55 = [v5 printer];
    usernameFromPreviouslyAuthedPrinterOrJustMobile(v55);
    unsigned __int8 v56 = (NSString *)objc_claimAutoreleasedReturnValue();
    Printd_Parameters::_set_JobAccountingUserID(&v61, v56);
  }
  id v57 = objc_msgSend(v5, "request_attrs");
  uint64_t v58 = (*(void (**)(id))(*(void *)v57 + 320))(v57);

  if (v58)
  {
    id v59 = objc_msgSend(*(id *)a2, "request_attrs");
    (*(void (**)(id))(*(void *)v59 + 320))(v59);
    id v60 = (NSString *)objc_claimAutoreleasedReturnValue();
    Printd_Parameters::_set_JobAccountID(&v61, v60);
  }
}

void sub_10005BA58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

uint64_t sub_10005BAC8(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 40) ippSession];
  id v3 = [*(id *)(a1 + 40) printer];
  uint64_t v4 = sub_10005C3E8((uint64_t)v2, v3, a1);

  return v4;
}

void sub_10005BB30(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10005BB4C(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  id v37 = a3;
  if (v5)
  {
    int v7 = [v5 count];
    char v8 = _PKLogCategory(PKLogCategoryProgress[0]);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v9 = objc_msgSend(v6, "printd_job_id");
      if (v6) {
        unsigned int v10 = objc_msgSend(v6, "destination_job_id");
      }
      else {
        unsigned int v10 = -1;
      }
      *(_DWORD *)stat buf = 67109632;
      unsigned int v39 = v9;
      __int16 v40 = 1024;
      unsigned int v41 = v10;
      __int16 v42 = 1024;
      int v43 = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[Job %d][%d] Got %d printer-state-reasons values.", buf, 0x14u);
    }

    unsigned int v11 = [v6 printer];
    id v12 = objc_msgSend(v11, "attrs_media_source_supported");
    if (v12)
    {
      int v13 = [v6 printer];
      id v14 = objc_msgSend(v13, "attrs_media_source_supported");
      id v15 = [v14 count];
      __int16 v16 = [v6 printer];
      id v17 = objc_msgSend(v16, "attrs_media_source_supported");
      unsigned int v18 = [v17 containsObject:@"auto"];
      unint64_t v19 = 1;
      if (v18) {
        unint64_t v19 = 2;
      }
      BOOL v20 = (unint64_t)v15 > v19;

      if (v20) {
        int v21 = 0;
      }
      else {
        int v21 = 64;
      }
    }
    else
    {
      int v21 = 64;
    }
    int v36 = v21;

    if (v7 < 1)
    {
      int v23 = 0;
    }
    else
    {
      uint64_t v22 = 0;
      int v23 = 0;
      do
      {
        id v24 = [v5 objectAtIndexedSubscript:v22];
        id v25 = _PKLogCategory(PKLogCategoryProgress[0]);
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          unsigned int v26 = objc_msgSend(v6, "printd_job_id");
          if (v6) {
            unsigned int v27 = objc_msgSend(v6, "destination_job_id");
          }
          else {
            unsigned int v27 = -1;
          }
          *(_DWORD *)stat buf = 67109890;
          unsigned int v39 = v26;
          __int16 v40 = 1024;
          unsigned int v41 = v27;
          __int16 v42 = 1024;
          int v43 = v22;
          __int16 v44 = 2112;
          id v45 = v24;
          _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "[Job %d][%d] reason[%d] = %@", buf, 0x1Eu);
        }

        if ([v24 hasPrefix:@"toner-empty"])
        {
          v23 |= 0x200u;
        }
        else if ([v24 hasPrefix:@"toner-low"])
        {
          v23 |= 8u;
        }
        else if ([v24 hasPrefix:@"marker-supply-empty"])
        {
          v23 |= 0x400u;
        }
        else if ([v24 hasPrefix:@"marker-supply-low"])
        {
          v23 |= 0x10u;
        }
        else if ([v24 hasPrefix:@"media-empty"])
        {
          v23 |= v36;
        }
        else if ([v24 hasPrefix:@"media-jam"])
        {
          v23 |= 0x80u;
        }
        else if ([v24 hasPrefix:@"media-low"])
        {
          v23 |= 4u;
        }
        else if ([v24 hasPrefix:@"media-needed"])
        {
          v23 |= 0x100u;
        }
        else if ([v24 hasPrefix:@"input-tray-missing"])
        {
          v23 |= 0x800u;
        }
        else if ([v24 hasPrefix:@"door-open"])
        {
          v23 |= 0x1000u;
        }
        else if ([v24 hasPrefix:@"cover-open"])
        {
          v23 |= 0x2000u;
        }
        else if ([v24 hasPrefix:@"offline"])
        {
          v23 |= 0x4000u;
        }
        else if (([v24 hasPrefix:@"paused"] & 1) != 0 {
               || [v24 hasPrefix:@"device-stopped"])
        }
        {
          v23 |= 0x20000u;
        }
        else if ([v24 hasSuffix:@"-report"] {
               && ([v24 hasPrefix:@"spool-area-full"] & 1) == 0
        }
               && ([v24 hasPrefix:@"connecting-to-device"] & 1) == 0
               && ([v24 hasPrefix:@"stopped-partly"] & 1) == 0
               && ![v24 hasPrefix:@"none"])
        {
          v23 |= 0x8000u;
        }

        ++v22;
      }
      while (v7 != v22);
    }
    id v28 = [v6 printer];
    unsigned int v29 = [v28 reasons];

    uint64_t v30 = [v6 printer];
    unsigned int v31 = [v30 reasons];

    uint64_t v32 = v29 & 0x400000 | v23 | v31 & 0x200000;
    id v33 = +[NSString stringWithFormat:@"0x%x/%@", v32, v37];
    id v34 = +[NSString stringWithFormat:@"%s:%d/%@", "lite_notify_printer_state_reasons", 2279, v33];

    id v35 = [v6 printer];
    liteNotifyPrinter(v35, v32, v34);
  }
}

void sub_10005C0D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_10005C1B8(uint64_t a1)
{
}

uint64_t sub_10005C1C0(uint64_t a1)
{
  return sub_100014B1C((void *)a1);
}

uint64_t sub_10005C204(uint64_t a1)
{
  return sub_1000153EC((void *)a1);
}

void sub_10005C240(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  sub_1000152F4(a1, 4u, a4);
}

void sub_10005C344(_Unwind_Exception *a1)
{
  sub_1000153EC((void *)v2);
  _Unwind_Resume(a1);
}

void sub_10005C398(uint64_t a1)
{
  sub_1000153EC((void *)a1);

  operator delete();
}

uint64_t sub_10005C3E8(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4 = [a2 sendSingleIPPRequest:a3 session:a1];
  if (![v4 transportStatus])
  {
    id v6 = [v4 ippResponse];
    sub_10005C498(a3, v6);
  }
  if ([v4 transportStatus] == 6) {
    uint64_t v5 = 1026;
  }
  else {
    uint64_t v5 = 1280;
  }

  return v5;
}

void sub_10005C47C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10005C498(uint64_t a1, void *a2)
{
  id v2 = a2;
  operator new();
}

void sub_10005C4E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10005C4F0(void *a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  sub_100014980(a1, 0xBu, a5);
}

void sub_10005C5F4(_Unwind_Exception *a1)
{
  sub_100014B1C((void *)v2);
  _Unwind_Resume(a1);
}

void sub_10005C63C(uint64_t a1)
{
  sub_100014B1C((void *)a1);

  operator delete();
}

uint64_t sub_10005C694(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4 = [a2 sendSingleIPPRequest:a3 session:a1];
  if (![v4 transportStatus])
  {
    id v6 = [v4 ippResponse];
    sub_10005C744(a3, v6);
  }
  if ([v4 transportStatus] == 6) {
    uint64_t v5 = 1026;
  }
  else {
    uint64_t v5 = 1280;
  }

  return v5;
}

void sub_10005C728(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10005C744(uint64_t a1, void *a2)
{
  id v2 = a2;
  operator new();
}

void sub_10005C78C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10005C79C(void *a1, unsigned __int16 a2, void *a3)
{
  *sub_100014A3C(a1, a2, a3) = off_1000A3968;
  operator new();
}

void sub_10005C80C(_Unwind_Exception *a1)
{
  sub_10000F138(v1);
  _Unwind_Resume(a1);
}

void sub_10005C824(void *a1)
{
  sub_10005C898(a1);

  operator delete();
}

void sub_10005C860(void *a1)
{
  sub_10005C898(a1);

  operator delete();
}

uint64_t sub_10005C898(void *a1)
{
  *a1 = off_1000A3968;
  uint64_t v1 = (id *)a1[3];
  if (v1)
  {

    operator delete();
  }
  id v2 = (id *)a1[4];
  if (v2)
  {

    operator delete();
  }

  return sub_10000F138((uint64_t)a1);
}

void sub_10005C938(uint64_t a1, void *a2)
{
  id v5 = a2;
  id v3 = [v5 name];
  uint64_t v4 = v3;
  if (v3 && [v3 compare:@"preset-name"]) {
    [*(id *)(a1 + 32) replaceOrAddAttribute:v4 withAttribute:v5 settingGroup:2];
  }
}

void sub_10005C9B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10005C9DC(void *a1, unsigned __int16 a2, void *a3)
{
  *sub_100014A3C(a1, a2, a3) = off_1000A3A00;
  operator new();
}

void sub_10005CA4C(_Unwind_Exception *a1)
{
  sub_10000F138(v1);
  _Unwind_Resume(a1);
}

void sub_10005CA60(void *a1)
{
  sub_10005CAD4(a1);

  operator delete();
}

void sub_10005CA9C(void *a1)
{
  sub_10005CAD4(a1);

  operator delete();
}

uint64_t sub_10005CAD4(void *a1)
{
  *a1 = off_1000A3A00;
  uint64_t v1 = (id *)a1[3];
  if (v1)
  {

    operator delete();
  }
  id v2 = (id *)a1[4];
  if (v2)
  {

    operator delete();
  }

  return sub_10000F138((uint64_t)a1);
}

void sub_10005CB74(uint64_t a1, void *a2)
{
  id v2 = a2;
  operator new();
}

void sub_10005CBBC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10005CBCC(void *a1, unsigned __int16 a2, void *a3)
{
  *sub_100014A3C(a1, a2, a3) = off_1000A3A70;
  operator new();
}

void sub_10005CC3C(_Unwind_Exception *a1)
{
  sub_10000F138(v1);
  _Unwind_Resume(a1);
}

void sub_10005CC54(void *a1)
{
  sub_10005CCC8(a1);

  operator delete();
}

void sub_10005CC90(void *a1)
{
  sub_10005CCC8(a1);

  operator delete();
}

uint64_t sub_10005CCC8(void *a1)
{
  *a1 = off_1000A3A70;
  uint64_t v1 = (id *)a1[3];
  if (v1)
  {

    operator delete();
  }
  id v2 = (id *)a1[4];
  if (v2)
  {

    operator delete();
  }

  return sub_10000F138((uint64_t)a1);
}

void sub_10005CD68(id *a1, void *a2)
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  void v4[2] = sub_10005D5C4;
  v4[3] = &unk_1000A3B58;
  id v5 = a2;
  id v3 = v5;
  Real_IPP_Message::_Response::_multiResponse(a1, v4);
}

void sub_10005CDFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_10005CE14(uint64_t a1, void **a2)
{
  if (!objc_msgSend(*(id *)(a1 + 32), "destination_job_id")
    && Printd_Parameters::_has_DestinationJobID(a2))
  {
    objc_msgSend(*(id *)(a1 + 32), "setDestination_job_id:", Printd_Parameters::_get_DestinationJobID(a2));
    if (Printd_Parameters::_has_JobState(a2)) {
      *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = Printd_Parameters::_get_JobState(a2);
    }
    uint64_t v4 = Printd_Parameters::_get_JobName(a2);
    id v5 = v4;
    if (v4 && *(void *)(a1 + 40) && (objc_msgSend(v4, "isEqualToString:") & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "setDestination_job_id:", 0);
      *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 3;
      id v6 = _PKLogCategory(PKLogCategoryProgress[0]);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v7 = objc_msgSend(*(id *)(a1 + 32), "printd_job_id");
        id v8 = *(void **)(a1 + 32);
        if (v8) {
          unsigned int v9 = objc_msgSend(v8, "destination_job_id");
        }
        else {
          unsigned int v9 = -1;
        }
        int v15 = 67109376;
        unsigned int v16 = v7;
        __int16 v17 = 1024;
        unsigned int v18 = v9;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[Job %d][%d] Found one remote job not-completed at printer, but it has a different job-name.", (uint8_t *)&v15, 0xEu);
      }
    }
    if ((int)objc_msgSend(*(id *)(a1 + 32), "destination_job_id") >= 1)
    {
      id v10 = _PKLogCategory(PKLogCategoryProgress[0]);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v11 = objc_msgSend(*(id *)(a1 + 32), "printd_job_id");
        id v12 = *(void **)(a1 + 32);
        if (v12)
        {
          unsigned int v13 = objc_msgSend(v12, "destination_job_id");
          id v12 = *(void **)(a1 + 32);
        }
        else
        {
          unsigned int v13 = -1;
        }
        unsigned int v14 = objc_msgSend(v12, "destination_job_id");
        int v15 = 67109632;
        unsigned int v16 = v11;
        __int16 v17 = 1024;
        unsigned int v18 = v13;
        __int16 v19 = 1024;
        unsigned int v20 = v14;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[Job %d][%d] Got remote job-id value of %d from the printer.", (uint8_t *)&v15, 0x14u);
      }
    }
  }
}

void sub_10005D044(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_10005D07C(uint64_t a1)
{
  return sub_10005D3A4((void *)a1);
}

uint64_t sub_10005D0C0(uint64_t a1)
{
  return sub_100059708((void *)a1);
}

void sub_10005D104(void *a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  sub_10005D24C(a1, a5);
}

void sub_10005D204(_Unwind_Exception *a1)
{
  sub_10005D3A4((void *)v2);
  _Unwind_Resume(a1);
}

void sub_10005D24C(void *a1, void *a2)
{
}

void sub_10005D2B4(_Unwind_Exception *a1)
{
  sub_10005D3A4(v1);
  _Unwind_Resume(a1);
}

void sub_10005D2C8(uint64_t a1)
{
  sub_10005D3A4((void *)a1);

  operator delete();
}

void sub_10005D320(void *a1, unsigned __int16 a2, void *a3)
{
  *sub_100014A3C(a1, a2, a3) = off_1000A3B40;
  operator new();
}

void sub_10005D390(_Unwind_Exception *a1)
{
  sub_10000F138(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_10005D3A4(void *a1)
{
  *a1 = off_1000A3B40;
  uint64_t v1 = (id *)a1[3];
  if (v1)
  {

    operator delete();
  }
  uint64_t v2 = (id *)a1[4];
  if (v2)
  {

    operator delete();
  }

  return sub_10000F138((uint64_t)a1);
}

void sub_10005D448(void *a1)
{
  sub_10005D3A4(a1);

  operator delete();
}

void sub_10005D484(void *a1)
{
  sub_10005D3A4(a1);

  operator delete();
}

uint64_t sub_10005D4BC(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4 = [a2 sendSingleIPPRequest:a3 session:a1];
  if (![v4 transportStatus])
  {
    id v6 = [v4 ippResponse];
    sub_10005D56C(a3, v6);
  }
  if ([v4 transportStatus] == 6) {
    uint64_t v5 = 1026;
  }
  else {
    uint64_t v5 = 1280;
  }

  return v5;
}

void sub_10005D550(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10005D56C(uint64_t a1, void *a2)
{
  id v2 = a2;
  operator new();
}

void sub_10005D5B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_10005D5C4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10005D5D4(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = [v7 ippSession];
  id v11 = [v7 printer];
  sub_100059484(a1, v10, v11, (uint64_t)objc_msgSend(v7, "destination_job_id"), v8, v9);
}

void sub_10005D69C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10005D6CC(uint64_t a1)
{
  sub_100059708((void *)a1);

  operator delete();
}

void sub_10005D724(uint64_t a1, os_activity_t activity)
{
  id v3 = _os_activity_create((void *)&_mh_execute_header, "Thread: Directly Print File", activity, OS_ACTIVITY_FLAG_DEFAULT);
  uint64_t v4 = _PKLogCategory(PKLogCategoryProgress[0]);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v5 = objc_msgSend(*(id *)(a1 + 32), "printd_job_id");
    id v6 = *(void **)(a1 + 32);
    if (v6) {
      unsigned int v7 = objc_msgSend(v6, "destination_job_id");
    }
    else {
      unsigned int v7 = -1;
    }
    *(_DWORD *)stat buf = 67109890;
    unsigned int v15 = v5;
    __int16 v16 = 1024;
    unsigned int v17 = v7;
    __int16 v18 = 2048;
    __int16 v19 = v3;
    __int16 v20 = 2080;
    int v21 = "Thread: Directly Print File";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[Job %d][%d] Activity (%p) ENTER: %s", buf, 0x22u);
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10005D998;
  block[3] = &unk_100095360;
  id v13 = *(id *)(a1 + 32);
  os_activity_apply(v3, block);
  id v8 = _PKLogCategory(PKLogCategoryProgress[0]);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v9 = objc_msgSend(*(id *)(a1 + 32), "printd_job_id");
    id v10 = *(void **)(a1 + 32);
    if (v10) {
      unsigned int v11 = objc_msgSend(v10, "destination_job_id");
    }
    else {
      unsigned int v11 = -1;
    }
    *(_DWORD *)stat buf = 67109890;
    unsigned int v15 = v9;
    __int16 v16 = 1024;
    unsigned int v17 = v11;
    __int16 v18 = 2048;
    __int16 v19 = v3;
    __int16 v20 = 2080;
    int v21 = "Thread: Directly Print File";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[Job %d][%d] Activity (%p) EXIT: %s", buf, 0x22u);
  }
}

void sub_10005D958(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_10005D998()
{
  uint64_t v0 = __chkstk_darwin();
  uint64_t v1 = _PKLogCategory(PKLogCategoryProgress[0]);
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v2 = objc_msgSend(*(id *)(v0 + 32), "printd_job_id");
    id v3 = *(void **)(v0 + 32);
    if (v3) {
      unsigned int v4 = objc_msgSend(v3, "destination_job_id");
    }
    else {
      unsigned int v4 = -1;
    }
    *(_DWORD *)stat buf = 67109634;
    unsigned int v45 = v2;
    __int16 v46 = 1024;
    unsigned int v47 = v4;
    __int16 v48 = 2080;
    id v49 = "lite_print_file_block_invoke";
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "[Job %d][%d] #### %s.", buf, 0x18u);
  }

  id v5 = *(id *)(v0 + 32);
  id v35 = 0;
  liteSetThreadPriority(1u);
  id v6 = _PKLogCategory(PKLogCategoryProgress[0]);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v7 = objc_msgSend(v5, "printd_job_id");
    if (v5) {
      unsigned int v8 = objc_msgSend(v5, "destination_job_id");
    }
    else {
      unsigned int v8 = -1;
    }
    *(_DWORD *)int v36 = 67109376;
    unsigned int v37 = v7;
    __int16 v38 = 1024;
    unsigned int v39 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[Job %d][%d] Spooling file directly to printer.", v36, 0xEu);
  }

  objc_msgSend(v5, "set_processing");
  id v9 = [v5 spoolDocumentFilename];
  int v10 = open((const char *)[v9 UTF8String], 256, 0);

  if (v10 >= 0)
  {
    unsigned int v11 = [v5 spoolDocumentFormat];
    BOOL v12 = objc_msgSend(v5, "openDriver:format:orient:num_sheets:passthru:", v34, v11, 0, 0, 1) == 0;

    if (!v12)
    {
      while (1)
      {
        ssize_t v13 = read(v10, buf, 0x2000uLL);
        uint64_t v14 = v13;
        if (v13 < 1) {
          break;
        }
        if (objc_msgSend(v5, "is_canceled")) {
          goto LABEL_44;
        }
        unsigned int v15 = _PKLogCategory(PKLogCategoryProgress[0]);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          unsigned int v16 = objc_msgSend(v5, "printd_job_id");
          if (v5) {
            unsigned int v17 = objc_msgSend(v5, "destination_job_id");
          }
          else {
            unsigned int v17 = -1;
          }
          *(_DWORD *)int v36 = 67109632;
          unsigned int v37 = v16;
          __int16 v38 = 1024;
          unsigned int v39 = v17;
          __int16 v40 = 2048;
          uint64_t v41 = v14;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "[Job %d][%d] Writing %lld bytes from print file.", v36, 0x18u);
        }

        if (((uint64_t (*)(void, uint8_t *, uint64_t))v34[0])(v34[1], buf, v14) < v14)
        {
          int v21 = _PKLogCategory(PKLogCategoryProgress[0]);
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          {
            unsigned int v24 = objc_msgSend(v5, "printd_job_id");
            if (v5) {
              unsigned int v25 = objc_msgSend(v5, "destination_job_id");
            }
            else {
              unsigned int v25 = -1;
            }
            *(_DWORD *)int v36 = 67109632;
            unsigned int v37 = v24;
            __int16 v38 = 1024;
            unsigned int v39 = v25;
            __int16 v40 = 2048;
            uint64_t v41 = v14;
            unsigned int v31 = "[Job %d][%d] Failed to write %lld bytes to printer.";
            goto LABEL_42;
          }
          goto LABEL_43;
        }
        objc_msgSend(v5, "make_progress:", v14);
      }
      if (v13 < 0 && *__error())
      {
        int v21 = _PKLogCategory(PKLogCategoryProgress[0]);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          unsigned int v22 = objc_msgSend(v5, "printd_job_id");
          if (v5) {
            unsigned int v23 = objc_msgSend(v5, "destination_job_id");
          }
          else {
            unsigned int v23 = -1;
          }
          uint64_t v32 = __error();
          id v33 = strerror(*v32);
          *(_DWORD *)int v36 = 67109634;
          unsigned int v37 = v22;
          __int16 v38 = 1024;
          unsigned int v39 = v23;
          __int16 v40 = 2080;
          uint64_t v41 = (uint64_t)v33;
          unsigned int v31 = "[Job %d][%d] Spooling failed: %s";
LABEL_42:
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, v31, v36, 0x18u);
        }
LABEL_43:
      }
LABEL_44:
      close(v10);
      if ([v5 closeDriver:v34])
      {
        if (objc_msgSend(v5, "is_canceled")) {
          uint64_t v30 = 7;
        }
        else {
          uint64_t v30 = 9;
        }
        goto LABEL_48;
      }
LABEL_49:
      [v5 resetJob];
      goto LABEL_50;
    }
    goto LABEL_36;
  }
  __int16 v18 = _PKLogCategory(PKLogCategoryProgress[0]);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    unsigned int v19 = objc_msgSend(v5, "printd_job_id");
    if (v5) {
      unsigned int v20 = objc_msgSend(v5, "destination_job_id");
    }
    else {
      unsigned int v20 = -1;
    }
    id v26 = [v5 spoolDocumentFilename];
    id v27 = [v26 UTF8String];
    id v28 = __error();
    unsigned int v29 = strerror(*v28);
    *(_DWORD *)int v36 = 67109890;
    unsigned int v37 = v19;
    __int16 v38 = 1024;
    unsigned int v39 = v20;
    __int16 v40 = 2080;
    uint64_t v41 = (uint64_t)v27;
    __int16 v42 = 2080;
    int v43 = v29;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "[Job %d][%d] Unable to open %s: %s", v36, 0x22u);
  }
  if (v10 != -1) {
LABEL_36:
  }
    close(v10);
  if (![v5 closeDriver:v34] || (objc_msgSend(v5, "is_canceled") & 1) == 0) {
    goto LABEL_49;
  }
  uint64_t v30 = 8;
LABEL_48:
  [v5 finishJob:v30];
LABEL_50:
}

void sub_10005DF40(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10005E08C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10005E15C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10005E274(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10005E368(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10005E634(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_10005E6E0(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a1;
  id v8 = a2;
  queue = a3;
  id v9 = a4;
  unsigned int v24 = v8;
  int v10 = [v7 port];
  if (!v10)
  {
    unsigned int v11 = [v7 scheme];
    int v10 = PKDefaultPortForScheme(v11);
  }
  snprintf(__str, 0x20uLL, "%d", [v10 integerValue]);
  id v12 = [v7 host];
  host = nw_endpoint_create_host((const char *)[v12 UTF8String], __str);

  secure_tcp = nw_parameters_create_secure_tcp(_nw_parameters_configure_protocol_disable, _nw_parameters_configure_protocol_default_configuration);
  if (v8)
  {
    [v8 UTF8String];
    nw_parameters_set_attributed_bundle_identifier();
  }
  nw_parameters_set_account_id();
  uint64_t v34 = 0;
  id v35 = &v34;
  uint64_t v36 = 0x3032000000;
  unsigned int v37 = sub_10005ECD8;
  __int16 v38 = sub_10005ECE8;
  nw_connection_t v39 = nw_connection_create(host, secure_tcp);
  uint64_t v15 = dword_1000C8BC0++;
  unsigned int v16 = +[NSString stringWithFormat:@"(seq %d) Checking viability of '%@' with '%@'", v15, v7, v35[5]];
  unsigned int v17 = _PKLogCategory(PKLogCategoryDiscovery[0]);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)stat buf = 138412290;
    uint64_t v41 = v16;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Browse_MDM: addIfReachable: %@", buf, 0xCu);
  }

  __int16 v18 = v35[5];
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_10005ECF0;
  handler[3] = &unk_1000A3C00;
  id v33 = &v34;
  id v19 = v16;
  id v30 = v19;
  id v20 = v7;
  id v31 = v20;
  id v21 = v9;
  id v32 = v21;
  nw_connection_set_state_changed_handler(v18, handler);
  dispatch_time_t v22 = dispatch_time(0, 30000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10005F000;
  block[3] = &unk_1000A3C28;
  id v28 = &v34;
  id v23 = v19;
  id v27 = v23;
  dispatch_after(v22, queue, block);
  nw_connection_set_queue((nw_connection_t)v35[5], queue);
  nw_connection_start((nw_connection_t)v35[5]);

  _Block_object_dispose(&v34, 8);
}

void sub_10005EAA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_10005EB8C(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    [v3 setTXTRecordValue:@"PrintKitManualPrinter" forKey:@"note"];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void sub_10005EC00(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

Class sub_10005EC2C()
{
  if (qword_1000C8BB8 != -1) {
    dispatch_once(&qword_1000C8BB8, &stru_1000A3BD8);
  }
  Class result = objc_getClass("MCProfileConnection");
  qword_1000C8BA8 = (uint64_t)result;
  off_1000C8A48 = (uint64_t (*)())sub_10005EC90;
  return result;
}

id sub_10005EC90()
{
  return (id)qword_1000C8BA8;
}

void sub_10005EC9C(id a1)
{
  qword_1000C8BB0 = (uint64_t)dlopen("/System/Library/PrivateFrameworks/ManagedConfiguration.framework/ManagedConfiguration", 2);
  if (!qword_1000C8BB0) {
    NSLog(@"### Failed to Soft Linked: /System/Library/PrivateFrameworks/ManagedConfiguration.framework/ManagedConfiguration");
  }
}

uint64_t sub_10005ECD8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10005ECE8(uint64_t a1)
{
}

void sub_10005ECF0(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  if (!a2 || a2 == 4)
  {
    if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
    {
      unsigned int v11 = _PKLogCategory(PKLogCategoryDiscovery[0]);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v12 = *(void *)(a1 + 32);
        int v16 = 138412290;
        uint64_t v17 = v12;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Browse_MDM: Not adding as reachable: %@", (uint8_t *)&v16, 0xCu);
      }

      nw_connection_cancel(*(nw_connection_t *)(*(void *)(*(void *)(a1 + 56) + 8) + 40));
      uint64_t v13 = *(void *)(*(void *)(a1 + 56) + 8);
      int v10 = *(void **)(v13 + 40);
      *(void *)(v13 + 40) = 0;
      goto LABEL_17;
    }
  }
  else if (a2 == 3 && *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
  {
    id v6 = _PKLogCategory(PKLogCategoryDiscovery[0]);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v16 = 138412290;
      uint64_t v17 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Browse_MDM: Adding reachable: %@", (uint8_t *)&v16, 0xCu);
    }

    id v8 = [*(id *)(a1 + 40) scheme];
    unsigned int v9 = [v8 isEqualToString:@"ipp"];

    if (v9)
    {
      int v10 = PKURLByReplacingScheme(@"ipps", *(void **)(a1 + 40));
    }
    else
    {
      int v10 = 0;
    }
    sub_10005EF3C(*(void *)(a1 + 40), *(void **)(a1 + 48));
    if (v10) {
      sub_10005EF3C((uint64_t)v10, *(void **)(a1 + 48));
    }
    nw_connection_cancel(*(nw_connection_t *)(*(void *)(*(void *)(a1 + 56) + 8) + 40));
    uint64_t v14 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v15 = *(void **)(v14 + 40);
    *(void *)(v14 + 40) = 0;

LABEL_17:
  }
}

void sub_10005EF04(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10005EF3C(uint64_t a1, void *a2)
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  void v4[2] = sub_10005F0E8;
  v4[3] = &unk_1000A3C50;
  id v5 = a2;
  id v3 = v5;
  +[PKPrinterBonjourEndpoint resolveWithURL:a1 timeout:v4 completionHandler:30.0];
}

void sub_10005EFE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_10005F000(uint64_t a1)
{
  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    unsigned int v2 = _PKLogCategory(PKLogCategoryDiscovery[0]);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v3 = *(void *)(a1 + 32);
      int v6 = 138412290;
      uint64_t v7 = v3;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Browse_MDM: Cancel reachable attempt: %@", (uint8_t *)&v6, 0xCu);
    }

    nw_connection_cancel(*(nw_connection_t *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
    uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
    id v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = 0;
  }
}

void sub_10005F0E8(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  if (v8 && v5)
  {
    id v6 = [objc_alloc((Class)PKPrinterBonjourEndpoint) initWithURL:v8 txtRecord:v5 provenance:1 provenanceIdentifier:0];
    uint64_t v7 = [[MDMBrowse_Entity alloc] initWithBonjourName:v6 txt:v5];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void sub_10005F1AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void urfDelete(void *a1)
{
  if (a1)
  {
    unsigned int v2 = (void *)a1[7];
    if (v2) {
      free(v2);
    }
    uint64_t v3 = (void *)a1[12];
    if (v3) {
      free(v3);
    }
    uint64_t v4 = (void *)a1[15];
    if (v4) {
      free(v4);
    }
    free(a1);
  }
}

uint64_t urfErrorString(uint64_t result)
{
  if (result) {
    return *(void *)(result + 112);
  }
  return result;
}

void *urfNew(uint64_t a1, uint64_t a2)
{
  Class result = malloc_type_calloc(1uLL, 0x90uLL, 0x10D00403A2F05C1uLL);
  if (result)
  {
    *Class result = a1;
    result[1] = a2;
  }
  return result;
}

uint64_t _urfSetLineSize(uint64_t a1, unsigned __int8 *a2)
{
  long long v3 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 40) = *((_OWORD *)a2 + 1);
  *(_OWORD *)(a1 + 24) = v3;
  *(void *)(a1 + 72) = 0;
  *(void *)(a1 + 112) = 0;
  switch(a2[1])
  {
    case 0u:
    case 4u:
      unsigned int v4 = *a2;
      if (v4 == 8 || v4 == 16) {
        goto LABEL_19;
      }
      goto LABEL_32;
    case 1u:
      unsigned int v4 = *a2;
      if (v4 != 24) {
        goto LABEL_32;
      }
      goto LABEL_19;
    case 2u:
      unsigned int v4 = *a2;
      if (v4 != 32) {
        goto LABEL_32;
      }
      goto LABEL_19;
    case 3u:
    case 5u:
      unsigned int v4 = *a2;
      if (v4 == 24) {
        goto LABEL_19;
      }
      goto LABEL_18;
    case 6u:
      unsigned int v4 = *a2;
      if (v4 != 32 && v4 != 64) {
        goto LABEL_32;
      }
      goto LABEL_19;
    case 7u:
      unsigned int v4 = *a2;
LABEL_18:
      if (v4 == 48) {
        goto LABEL_19;
      }
      goto LABEL_32;
    case 8u:
      unsigned int v4 = *a2;
      if (v4 != 16)
      {
LABEL_32:
        uint64_t result = 0;
        uint64_t v7 = "Bad bitsPerPixel in page header";
        goto LABEL_33;
      }
LABEL_19:
      if (a2[2] >= 4u)
      {
        uint64_t result = 0;
        uint64_t v7 = "Bad duplexMode in page header";
LABEL_33:
        *(void *)(a1 + 112) = v7;
        return result;
      }
      unsigned int v8 = a2[3];
      if (v8 > 5 || v8 - 1 <= 1)
      {
        uint64_t result = 0;
        uint64_t v7 = "Bad printQuality in page header";
        goto LABEL_33;
      }
      unsigned int v10 = *((_DWORD *)a2 + 3);
      if (!v10)
      {
        uint64_t result = 0;
        uint64_t v7 = "Bad width in page header";
        goto LABEL_33;
      }
      if (!*((_DWORD *)a2 + 4))
      {
        uint64_t result = 0;
        uint64_t v7 = "Bad height in page header";
        goto LABEL_33;
      }
      if (!*((_DWORD *)a2 + 5))
      {
        uint64_t result = 0;
        uint64_t v7 = "Bad resolution in page header";
        goto LABEL_33;
      }
      unsigned int v11 = v4 >> 3;
      unint64_t v12 = v10 * (unint64_t)v11;
      uint64_t v13 = *(void **)(a1 + 56);
      if (v13) {
        uint64_t v14 = malloc_type_realloc(v13, v10 * (unint64_t)v11, 0x9092D853uLL);
      }
      else {
        uint64_t v14 = malloc_type_malloc(v10 * (unint64_t)v11, 0x62CE6984uLL);
      }
      if (!v14)
      {
        free(*(void **)(a1 + 56));
        uint64_t result = 0;
        *(void *)(a1 + 56) = 0;
        *(void *)(a1 + 72) = 0;
        uint64_t v7 = "Unable to allocate memory for line buffer";
        goto LABEL_33;
      }
      *(void *)(a1 + 56) = v14;
      *(void *)(a1 + 72) = v12;
      return 1;
    default:
      uint64_t result = 0;
      uint64_t v7 = "Bad colorSpace in page header";
      goto LABEL_33;
  }
}

void sub_10005F540(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10005F610(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10005F728(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10005F81C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10005F9EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, void *a8, ...)
{
  va_start(va, a8);
  uint64_t v13 = v11;

  sub_100060508((uint64_t *)va);
  _Unwind_Resume(a1);
}

void sub_10005FA70(uint64_t a1, void *a2)
{
  id v3 = a2;
  unsigned int v4 = _PKLogCategory(PKLogCategoryNetwork[0]);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)stat buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Browse_CUPS: Handle response", buf, 2u);
  }

  if (![v3 transportStatus])
  {
    id v5 = [v3 ippResponse];
    if ([v5 status])
    {
      id v6 = [v3 ippResponse];
      unsigned int v7 = [v6 status];

      if (v7 != 1) {
        goto LABEL_9;
      }
    }
    else
    {
    }
    unsigned int v8 = [v3 ippResponse];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    void v9[2] = sub_10005FC9C;
    v9[3] = &unk_1000A3C78;
    id v10 = *(id *)(a1 + 32);
    sub_10005FC14(v8, v9);
  }
LABEL_9:
}

void sub_10005FBD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_10005FC14(void *a1, void *a2)
{
  id v6 = a1;
  id v3 = (void (*)(void *, id *))a2[2];
  id v4 = v6;
  id v5 = a2;
  v3(v5, &v6);
}

void sub_10005FC80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_10005FC9C(uint64_t a1, id *a2)
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  id v3[2] = sub_10005FDE8;
  void v3[3] = &unk_1000A3C78;
  id v4 = *(id *)(a1 + 32);
  sub_10005FD3C(a2, v3);
}

void sub_10005FD28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_10005FD3C(id *a1, void *a2)
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  void v4[2] = sub_1000605A8;
  v4[3] = &unk_1000A3B58;
  id v5 = a2;
  id v3 = v5;
  Real_IPP_Message::_Response::_multiResponse(a1, v4);
}

void sub_10005FDD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_10005FDE8(uint64_t a1, void **a2)
{
  id v4 = _PKLogCategory(PKLogCategoryNetwork[0]);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)stat buf = 134217984;
    unsigned int v9 = a2;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Browse_CUPS: PRINTER %p", buf, 0xCu);
  }

  id v5 = Printd_Parameters::_get_PrinterURISupported(a2);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  int v6[2] = sub_10005FF4C;
  v6[3] = &unk_1000A3C50;
  id v7 = *(id *)(a1 + 32);
  +[PKPrinterBonjourEndpoint resolveWithURL:v5 timeout:v6 completionHandler:10.0];
}

void sub_10005FF2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_10005FF4C(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  id v6 = [objc_alloc((Class)PKPrinterBonjourEndpoint) initWithURL:v8 txtRecord:v5 provenance:16 provenanceIdentifier:0];
  id v7 = [[CUPSBrowse_Entity alloc] initWithBonjourName:v6 txt:v5];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100060004(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100060224(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19, void *a20)
{
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10006025C(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [WeakRetained _startWithPort:a2];
  }
}

void sub_1000602C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100060384(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100060410(void *a1, unsigned __int16 a2, void *a3)
{
  *sub_100014A3C(a1, a2, a3) = &off_1000A3D20;
  operator new();
}

void sub_100060480(_Unwind_Exception *a1)
{
  sub_10000F138(v1);
  _Unwind_Resume(a1);
}

void sub_100060494(void *a1)
{
  sub_100060508(a1);

  operator delete();
}

void sub_1000604D0(void *a1)
{
  sub_100060508(a1);

  operator delete();
}

uint64_t sub_100060508(void *a1)
{
  *a1 = &off_1000A3D20;
  uint64_t v1 = (id *)a1[3];
  if (v1)
  {

    operator delete();
  }
  unsigned int v2 = (id *)a1[4];
  if (v2)
  {

    operator delete();
  }

  return sub_10000F138((uint64_t)a1);
}

uint64_t sub_1000605A8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_1000605B8(id a1)
{
  uint64_t v1 = [[LocalSocketProxy alloc] initWithLocalSocketPath:@"/var/run/cupsd"];
  unsigned int v2 = (void *)qword_1000C8BC8;
  qword_1000C8BC8 = (uint64_t)v1;

  id v3 = (void *)qword_1000C8BC8;

  [v3 start];
}

void sub_100060610(uint64_t a1, __int16 a2)
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  void v4[2] = sub_1000606A0;
  v4[3] = &unk_1000A3D58;
  id v3 = *(NSObject **)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  __int16 v6 = a2;
  dispatch_async(v3, v4);
}

uint64_t sub_1000606A0(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int16 *)(a1 + 40));
}

CFStringRef PKLocalizedString(const __CFString *a1, const char *a2)
{
  BundleWithIdentifier = CFBundleGetBundleWithIdentifier(@"com.apple.framework.PrintKit");

  return CFBundleCopyLocalizedString(BundleWithIdentifier, a1, a1, @"Localizable");
}

id PKLocalizedString(NSString *a1, const char *a2)
{
  unsigned int v2 = a1;
  id v3 = +[NSBundle bundleWithIdentifier:@"com.apple.framework.PrintKit"];
  id v4 = [v3 localizedStringForKey:v2 value:v2 table:@"Localizable"];

  return v4;
}

void sub_100060784(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000608B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1000608E4(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  if (v6 && v5)
  {
    [*(id *)(a1 + 32) setResolvedURL:v6];
    [*(id *)(a1 + 32) setResolvedTXT:v5];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_100060974(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100060F74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_100061050(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  if (([v6 isEqualToString:@"none"] & 1) == 0
    && ([v6 isEqualToString:@"requesting-user-name"] & 1) == 0)
  {
    [*(id *)(a1 + 32) setObject:@"username,password" forKeyedSubscript:@"air"];
    *a4 = 1;
  }
}

void sub_1000610DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100061200(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100061244(uint64_t a1, void *a2)
{
  id v2 = a2;
  sub_100014980(v3, 0xBu, @"resolveWithURL");
}

void sub_1000613D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, void *a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, ...)
{
  va_start(va, a12);

  sub_100014B1C((uint64_t *)va);
  _Unwind_Resume(a1);
}

uint64_t sub_100061424(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = _PKLogCategory(PKLogCategoryNetwork[0]);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v8 = 138412547;
    id v9 = v4;
    __int16 v10 = 2113;
    uint64_t v11 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "allowing trust %@ result for %{private}@", (uint8_t *)&v8, 0x16u);
  }

  return 1;
}

void sub_1000614FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100061514(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v9 = 0;
  __int16 v10 = &v9;
  uint64_t v11 = 0x3032000000;
  unint64_t v12 = sub_100061678;
  uint64_t v13 = sub_100061688;
  id v14 = 0;
  if (![v3 transportStatus])
  {
    id v5 = [v3 ippResponse];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    int v6[2] = sub_100061690;
    v6[3] = &unk_1000A3E20;
    int v8 = &v9;
    id v7 = *(id *)(a1 + 32);
    sub_100012A00(v5, v6);
  }
  (*(void (**)(void, void, uint64_t, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), v10[5], v4);
  _Block_object_dispose(&v9, 8);
}

void sub_100061640(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20)
{
  _Block_object_dispose(&a15, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100061678(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100061688(uint64_t a1)
{
}

void sub_100061690(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = +[PKPrinterBonjourEndpoint txtFromGetPrinterAttributes:a2 url:*(void *)(a1 + 32)];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void sub_100061A6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_100061DE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,id a30)
{
  _Block_object_dispose(&a25, 8);

  _Unwind_Resume(a1);
}

uint64_t sub_100061E40(uint64_t a1)
{
  uint64_t result = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (result)
  {
    nw_resolver_cancel();
    uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = 0;

    id v5 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
    return v5();
  }
  return result;
}

void sub_100061EB8(uint64_t a1, int a2, void *a3)
{
  id v7 = a3;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 32));
  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    nw_resolver_cancel();
    uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = 0;

    if (a2 && nw_array_get_count()) {
      [*(id *)(a1 + 56) _finishResolveEndpointArray:v7 timeout:*(void *)(a1 + 40) completionHandler:*(double *)(a1 + 64)];
    }
    else {
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
  }
}

void sub_100061F70(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1000621F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100062394(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100062454(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000624C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10006253C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100062650(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100062758(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100062854(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100062A14(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100062CD0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v20);

  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100062D14(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _syncTimerFired];
}

void sub_100062D64(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100063004(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10006312C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1000631E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100063260(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100063410(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1000636F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,void *a22,void *a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,void *a29,void *a30)
{
  objc_destroyWeak(v35);
  objc_destroyWeak(v34);

  objc_destroyWeak(v31);
  objc_destroyWeak((id *)(v36 - 112));

  _Unwind_Resume(a1);
}

void sub_100063778(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));

  if (WeakRetained)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100063860;
    block[3] = &unk_1000A2B00;
    uint64_t v5 = *(NSObject **)(a1 + 32);
    id v7 = *(id *)(a1 + 40);
    id v8 = v3;
    objc_copyWeak(&v9, (id *)(a1 + 48));
    dispatch_async(v5, block);
    objc_destroyWeak(&v9);
  }
}

void sub_100063860(uint64_t a1)
{
  id v2 = _PKLogCategory(PKLogCategoryDiscovery[0]);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v6 = 138412546;
    uint64_t v7 = v3;
    __int16 v8 = 2112;
    uint64_t v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Browser %@ adding %@", (uint8_t *)&v6, 0x16u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained addEntity:*(void *)(a1 + 40)];
}

void sub_100063938(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100063950(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));

  if (WeakRetained)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100063A38;
    block[3] = &unk_1000A2B00;
    uint64_t v5 = *(NSObject **)(a1 + 32);
    id v7 = *(id *)(a1 + 40);
    id v8 = v3;
    objc_copyWeak(&v9, (id *)(a1 + 48));
    dispatch_async(v5, block);
    objc_destroyWeak(&v9);
  }
}

void sub_100063A38(uint64_t a1)
{
  id v2 = _PKLogCategory(PKLogCategoryDiscovery[0]);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v6 = 138412546;
    uint64_t v7 = v3;
    __int16 v8 = 2112;
    uint64_t v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Browser %@ removing %@", (uint8_t *)&v6, 0x16u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained removeEntity:*(void *)(a1 + 40)];
}

void sub_100063B10(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100063B28(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));

  if (WeakRetained)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100063C10;
    block[3] = &unk_1000A2B00;
    uint64_t v5 = *(NSObject **)(a1 + 32);
    id v7 = *(id *)(a1 + 40);
    id v8 = v3;
    objc_copyWeak(&v9, (id *)(a1 + 48));
    dispatch_async(v5, block);
    objc_destroyWeak(&v9);
  }
}

void sub_100063C10(uint64_t a1)
{
  id v2 = _PKLogCategory(PKLogCategoryDiscovery[0]);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v6 = 138412546;
    uint64_t v7 = v3;
    __int16 v8 = 2112;
    uint64_t v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Browser %@ updating %@", (uint8_t *)&v6, 0x16u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained updateEntity:*(void *)(a1 + 40)];
}

void sub_100063CE8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_100063D00(uint64_t a1)
{
  id v2 = _PKLogCategory(PKLogCategoryDiscovery[0]);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v6 = 138412546;
    uint64_t v7 = v3;
    __int16 v8 = 2112;
    uint64_t v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Browse service %@ starting %@", (uint8_t *)&v6, 0x16u);
  }

  return [*(id *)(a1 + 48) start];
}

id sub_100063E5C(uint64_t a1)
{
  id v2 = _PKLogCategory(PKLogCategoryDiscovery[0]);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138412290;
    uint64_t v6 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Browse service %@ stopping all", (uint8_t *)&v5, 0xCu);
  }

  return [*(id *)(a1 + 40) stopBrowsing0];
}

void sub_1000640D8()
{
  __assert_rtn("internEntriesDict_block_invoke", "xcups_strings.mm", 185, "sEntryPtrs[sEntriesCount - 1] == &sEntryValues[sEntriesCount - 1]");
}

void sub_100064104()
{
  __assert_rtn("internEntriesDict_block_invoke", "xcups_strings.mm", 184, "sEntryPtrs[0] == &sEntryValues[0]");
}

void sub_100064130()
{
  __assert_rtn("entryIndex", "xcups_strings.mm", 124, "e == &sEntryValues[ix]");
}

void sub_10006415C()
{
  __assert_rtn("operator()", "xcups_strings.mm", 168, "entryIndex(entry) != -1");
}

void sub_100064188()
{
  __assert_rtn("jobStateString", "job.mm", 748, "\"val out of bounds\" == NULL");
}

void sub_1000641B4()
{
  __assert_rtn("urf_compress16", "urf-write.c", 578, "count <= context->compsize");
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  return _CFAbsoluteTimeGetCurrent();
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return _CFArrayCreate(allocator, values, numValues, callBacks);
}

CFMutableArrayRef CFArrayCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFArrayRef theArray)
{
  return _CFArrayCreateMutableCopy(allocator, capacity, theArray);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return _CFArrayGetCount(theArray);
}

CFTypeID CFArrayGetTypeID(void)
{
  return _CFArrayGetTypeID();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return _CFArrayGetValueAtIndex(theArray, idx);
}

void CFArrayRemoveValueAtIndex(CFMutableArrayRef theArray, CFIndex idx)
{
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return _CFBooleanGetValue(BOOLean);
}

CFStringRef CFBundleCopyLocalizedString(CFBundleRef bundle, CFStringRef key, CFStringRef value, CFStringRef tableName)
{
  return _CFBundleCopyLocalizedString(bundle, key, value, tableName);
}

CFBundleRef CFBundleGetBundleWithIdentifier(CFStringRef bundleID)
{
  return _CFBundleGetBundleWithIdentifier(bundleID);
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return _CFDataCreate(allocator, bytes, length);
}

CFMutableDataRef CFDataCreateMutable(CFAllocatorRef allocator, CFIndex capacity)
{
  return _CFDataCreateMutable(allocator, capacity);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return _CFDataGetBytePtr(theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return _CFDataGetLength(theData);
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return _CFDictionaryCreate(allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return _CFDictionaryCreateMutable(allocator, capacity, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDictionaryRef theDict)
{
  return _CFDictionaryCreateMutableCopy(allocator, capacity, theDict);
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return _CFDictionaryGetCount(theDict);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return _CFDictionaryGetTypeID();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return _CFDictionaryGetValue(theDict, key);
}

void CFDictionaryRemoveAllValues(CFMutableDictionaryRef theDict)
{
}

void CFDictionaryRemoveValue(CFMutableDictionaryRef theDict, const void *key)
{
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return _CFEqual(cf1, cf2);
}

CFIndex CFGetRetainCount(CFTypeRef cf)
{
  return _CFGetRetainCount(cf);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return _CFGetTypeID(cf);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return _CFNotificationCenterGetDarwinNotifyCenter();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return _CFNumberCreate(allocator, theType, valuePtr);
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return _CFNumberGetValue(number, theType, valuePtr);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return _CFPreferencesCopyValue(key, applicationID, userName, hostName);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return _CFPreferencesGetAppBooleanValue(key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return _CFRetain(cf);
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return _CFStringCompare(theString1, theString2, compareOptions);
}

CFStringRef CFStringCreateCopy(CFAllocatorRef alloc, CFStringRef theString)
{
  return _CFStringCreateCopy(alloc, theString);
}

CFStringRef CFStringCreateStringWithValidatedFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef validFormatSpecifiers, CFStringRef format, CFErrorRef *errorPtr, ...)
{
  return _CFStringCreateStringWithValidatedFormat(alloc, formatOptions, validFormatSpecifiers, format, errorPtr);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return _CFStringCreateWithCString(alloc, cStr, encoding);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return _CFStringCreateWithFormat(alloc, formatOptions, format);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return _CFStringGetCString(theString, buffer, bufferSize, encoding);
}

uint64_t CFURLAuthChallengeGetFailureResponse()
{
  return _CFURLAuthChallengeGetFailureResponse();
}

CFURLRef CFURLCreateFromFileSystemRepresentation(CFAllocatorRef allocator, const UInt8 *buffer, CFIndex bufLen, Boolean isDirectory)
{
  return _CFURLCreateFromFileSystemRepresentation(allocator, buffer, bufLen, isDirectory);
}

CFURLRef CFURLCreateWithString(CFAllocatorRef allocator, CFStringRef URLString, CFURLRef baseURL)
{
  return _CFURLCreateWithString(allocator, URLString, baseURL);
}

SInt32 CFUserNotificationCancel(CFUserNotificationRef userNotification)
{
  return _CFUserNotificationCancel(userNotification);
}

CFUserNotificationRef CFUserNotificationCreate(CFAllocatorRef allocator, CFTimeInterval timeout, CFOptionFlags flags, SInt32 *error, CFDictionaryRef dictionary)
{
  return _CFUserNotificationCreate(allocator, timeout, flags, error, dictionary);
}

CFStringRef CFUserNotificationGetResponseValue(CFUserNotificationRef userNotification, CFStringRef key, CFIndex idx)
{
  return _CFUserNotificationGetResponseValue(userNotification, key, idx);
}

SInt32 CFUserNotificationReceiveResponse(CFUserNotificationRef userNotification, CFTimeInterval timeout, CFOptionFlags *responseFlags)
{
  return _CFUserNotificationReceiveResponse(userNotification, timeout, responseFlags);
}

CGAffineTransform *__cdecl CGAffineTransformConcat(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t1, CGAffineTransform *t2)
{
  return _CGAffineTransformConcat(retstr, t1, t2);
}

BOOL CGAffineTransformEqualToTransform(CGAffineTransform *t1, CGAffineTransform *t2)
{
  return _CGAffineTransformEqualToTransform(t1, t2);
}

CGAffineTransform *__cdecl CGAffineTransformMakeRotation(CGAffineTransform *__return_ptr retstr, CGFloat angle)
{
  return _CGAffineTransformMakeRotation(retstr, angle);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return _CGAffineTransformMakeScale(retstr, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformMakeTranslation(CGAffineTransform *__return_ptr retstr, CGFloat tx, CGFloat ty)
{
  return _CGAffineTransformMakeTranslation(retstr, tx, ty);
}

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return _CGBitmapContextCreate(data, width, height, bitsPerComponent, bytesPerRow, space, bitmapInfo);
}

CGImageRef CGBitmapContextCreateImage(CGContextRef context)
{
  return _CGBitmapContextCreateImage(context);
}

CGColorSpaceRef CGBitmapContextGetColorSpace(CGContextRef context)
{
  return _CGBitmapContextGetColorSpace(context);
}

void *__cdecl CGBitmapContextGetData(CGContextRef context)
{
  return _CGBitmapContextGetData(context);
}

size_t CGBitmapContextGetHeight(CGContextRef context)
{
  return _CGBitmapContextGetHeight(context);
}

size_t CGBitmapContextGetWidth(CGContextRef context)
{
  return _CGBitmapContextGetWidth(context);
}

CGColorSpaceRef CGColorSpaceCreateDeviceCMYK(void)
{
  return _CGColorSpaceCreateDeviceCMYK();
}

CGColorSpaceRef CGColorSpaceCreateDeviceGray(void)
{
  return _CGColorSpaceCreateDeviceGray();
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return _CGColorSpaceCreateDeviceRGB();
}

CGColorSpaceRef CGColorSpaceCreateWithName(CFStringRef name)
{
  return _CGColorSpaceCreateWithName(name);
}

uint64_t CGColorSpaceEqualToColorSpace()
{
  return _CGColorSpaceEqualToColorSpace();
}

CGColorSpaceModel CGColorSpaceGetModel(CGColorSpaceRef space)
{
  return _CGColorSpaceGetModel(space);
}

size_t CGColorSpaceGetNumberOfComponents(CGColorSpaceRef space)
{
  return _CGColorSpaceGetNumberOfComponents(space);
}

uint64_t CGColorSpaceIsICCCompatible()
{
  return _CGColorSpaceIsICCCompatible();
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
}

void CGContextBeginPage(CGContextRef c, const CGRect *mediaBox)
{
}

void CGContextClipToRect(CGContextRef c, CGRect rect)
{
}

void CGContextConcatCTM(CGContextRef c, CGAffineTransform *transform)
{
}

void CGContextDrawImage(CGContextRef c, CGRect rect, CGImageRef image)
{
}

void CGContextDrawPDFPage(CGContextRef c, CGPDFPageRef page)
{
}

uint64_t CGContextDrawPDFPageWithAnnotations()
{
  return _CGContextDrawPDFPageWithAnnotations();
}

void CGContextEndPage(CGContextRef c)
{
}

void CGContextFillRect(CGContextRef c, CGRect rect)
{
}

void CGContextRelease(CGContextRef c)
{
}

void CGContextRestoreGState(CGContextRef c)
{
}

void CGContextSaveGState(CGContextRef c)
{
}

void CGContextScaleCTM(CGContextRef c, CGFloat sx, CGFloat sy)
{
}

void CGContextSetAllowsAntialiasing(CGContextRef c, BOOL allowsAntialiasing)
{
}

void CGContextSetCMYKFillColor(CGContextRef c, CGFloat cyan, CGFloat magenta, CGFloat yellow, CGFloat black, CGFloat alpha)
{
}

uint64_t CGContextSetCTM()
{
  return _CGContextSetCTM();
}

void CGContextSetGrayFillColor(CGContextRef c, CGFloat gray, CGFloat alpha)
{
}

void CGContextSetInterpolationQuality(CGContextRef c, CGInterpolationQuality quality)
{
}

void CGContextSetRGBFillColor(CGContextRef c, CGFloat red, CGFloat green, CGFloat blue, CGFloat alpha)
{
}

void CGContextTranslateCTM(CGContextRef c, CGFloat tx, CGFloat ty)
{
}

CGDataConsumerRef CGDataConsumerCreate(void *info, const CGDataConsumerCallbacks *cbks)
{
  return _CGDataConsumerCreate(info, cbks);
}

void CGDataConsumerRelease(CGDataConsumerRef consumer)
{
}

void CGImageDestinationAddImage(CGImageDestinationRef idst, CGImageRef image, CFDictionaryRef properties)
{
}

CGImageDestinationRef CGImageDestinationCreateWithData(CFMutableDataRef data, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return _CGImageDestinationCreateWithData(data, type, count, options);
}

BOOL CGImageDestinationFinalize(CGImageDestinationRef idst)
{
  return _CGImageDestinationFinalize(idst);
}

CGColorSpaceRef CGImageGetColorSpace(CGImageRef image)
{
  return _CGImageGetColorSpace(image);
}

size_t CGImageGetHeight(CGImageRef image)
{
  return _CGImageGetHeight(image);
}

size_t CGImageGetWidth(CGImageRef image)
{
  return _CGImageGetWidth(image);
}

void CGImageRelease(CGImageRef image)
{
}

CFDictionaryRef CGImageSourceCopyPropertiesAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return _CGImageSourceCopyPropertiesAtIndex(isrc, index, options);
}

CGImageRef CGImageSourceCreateImageAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return _CGImageSourceCreateImageAtIndex(isrc, index, options);
}

CGImageRef CGImageSourceCreateThumbnailAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return _CGImageSourceCreateThumbnailAtIndex(isrc, index, options);
}

CGImageSourceRef CGImageSourceCreateWithURL(CFURLRef url, CFDictionaryRef options)
{
  return _CGImageSourceCreateWithURL(url, options);
}

size_t CGPDFArrayGetCount(CGPDFArrayRef array)
{
  return _CGPDFArrayGetCount(array);
}

BOOL CGPDFArrayGetName(CGPDFArrayRef array, size_t index, const char **value)
{
  return _CGPDFArrayGetName(array, index, value);
}

BOOL CGPDFArrayGetObject(CGPDFArrayRef array, size_t index, CGPDFObjectRef *value)
{
  return _CGPDFArrayGetObject(array, index, value);
}

BOOL CGPDFArrayGetStream(CGPDFArrayRef array, size_t index, CGPDFStreamRef *value)
{
  return _CGPDFArrayGetStream(array, index, value);
}

CGPDFContentStreamRef CGPDFContentStreamCreateWithPage(CGPDFPageRef page)
{
  return _CGPDFContentStreamCreateWithPage(page);
}

CGPDFContentStreamRef CGPDFContentStreamCreateWithStream(CGPDFStreamRef stream, CGPDFDictionaryRef streamResources, CGPDFContentStreamRef parent)
{
  return _CGPDFContentStreamCreateWithStream(stream, streamResources, parent);
}

CGPDFObjectRef CGPDFContentStreamGetResource(CGPDFContentStreamRef cs, const char *category, const char *name)
{
  return _CGPDFContentStreamGetResource(cs, category, name);
}

void CGPDFContentStreamRelease(CGPDFContentStreamRef cs)
{
}

void CGPDFContextBeginPage(CGContextRef context, CFDictionaryRef pageInfo)
{
}

void CGPDFContextClose(CGContextRef context)
{
}

CGContextRef CGPDFContextCreate(CGDataConsumerRef consumer, const CGRect *mediaBox, CFDictionaryRef auxiliaryInfo)
{
  return _CGPDFContextCreate(consumer, mediaBox, auxiliaryInfo);
}

BOOL CGPDFDictionaryGetBoolean(CGPDFDictionaryRef dict, const char *key, CGPDFBoolean *value)
{
  return _CGPDFDictionaryGetBoolean(dict, key, value);
}

BOOL CGPDFDictionaryGetInteger(CGPDFDictionaryRef dict, const char *key, CGPDFInteger *value)
{
  return _CGPDFDictionaryGetInteger(dict, key, value);
}

BOOL CGPDFDictionaryGetName(CGPDFDictionaryRef dict, const char *key, const char **value)
{
  return _CGPDFDictionaryGetName(dict, key, value);
}

BOOL CGPDFDictionaryGetObject(CGPDFDictionaryRef dict, const char *key, CGPDFObjectRef *value)
{
  return _CGPDFDictionaryGetObject(dict, key, value);
}

uint64_t CGPDFDictionaryPrint()
{
  return _CGPDFDictionaryPrint();
}

BOOL CGPDFDocumentAllowsPrinting(CGPDFDocumentRef document)
{
  return _CGPDFDocumentAllowsPrinting(document);
}

CGPDFDocumentRef CGPDFDocumentCreateWithURL(CFURLRef url)
{
  return _CGPDFDocumentCreateWithURL(url);
}

size_t CGPDFDocumentGetNumberOfPages(CGPDFDocumentRef document)
{
  return _CGPDFDocumentGetNumberOfPages(document);
}

CGPDFPageRef CGPDFDocumentGetPage(CGPDFDocumentRef document, size_t pageNumber)
{
  return _CGPDFDocumentGetPage(document, pageNumber);
}

BOOL CGPDFDocumentIsEncrypted(CGPDFDocumentRef document)
{
  return _CGPDFDocumentIsEncrypted(document);
}

void CGPDFDocumentRelease(CGPDFDocumentRef document)
{
}

BOOL CGPDFDocumentUnlockWithPassword(CGPDFDocumentRef document, const char *password)
{
  return _CGPDFDocumentUnlockWithPassword(document, password);
}

CGPDFObjectType CGPDFObjectGetType(CGPDFObjectRef object)
{
  return _CGPDFObjectGetType(object);
}

BOOL CGPDFObjectGetValue(CGPDFObjectRef object, CGPDFObjectType type, void *value)
{
  return _CGPDFObjectGetValue(object, type, value);
}

CGPDFOperatorTableRef CGPDFOperatorTableCreate(void)
{
  return _CGPDFOperatorTableCreate();
}

void CGPDFOperatorTableRelease(CGPDFOperatorTableRef table)
{
}

void CGPDFOperatorTableSetCallback(CGPDFOperatorTableRef table, const char *name, CGPDFOperatorCallback callback)
{
}

CGRect CGPDFPageGetBoxRect(CGPDFPageRef page, CGPDFBox box)
{
  return _CGPDFPageGetBoxRect(page, box);
}

CGAffineTransform *__cdecl CGPDFPageGetDrawingTransform(CGAffineTransform *__return_ptr retstr, CGPDFPageRef page, CGPDFBox box, CGRect rect, int rotate, BOOL preserveAspectRatio)
{
  return _CGPDFPageGetDrawingTransform(retstr, page, box, rect, rotate, preserveAspectRatio);
}

int CGPDFPageGetRotationAngle(CGPDFPageRef page)
{
  return _CGPDFPageGetRotationAngle(page);
}

CGPDFScannerRef CGPDFScannerCreate(CGPDFContentStreamRef cs, CGPDFOperatorTableRef table, void *info)
{
  return _CGPDFScannerCreate(cs, table, info);
}

CGPDFContentStreamRef CGPDFScannerGetContentStream(CGPDFScannerRef scanner)
{
  return _CGPDFScannerGetContentStream(scanner);
}

BOOL CGPDFScannerPopName(CGPDFScannerRef scanner, const char **value)
{
  return _CGPDFScannerPopName(scanner, value);
}

BOOL CGPDFScannerPopNumber(CGPDFScannerRef scanner, CGPDFReal *value)
{
  return _CGPDFScannerPopNumber(scanner, value);
}

void CGPDFScannerRelease(CGPDFScannerRef scanner)
{
}

BOOL CGPDFScannerScan(CGPDFScannerRef scanner)
{
  return _CGPDFScannerScan(scanner);
}

CGPDFDictionaryRef CGPDFStreamGetDictionary(CGPDFStreamRef stream)
{
  return _CGPDFStreamGetDictionary(stream);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  return _CGRectGetHeight(rect);
}

CGFloat CGRectGetMinX(CGRect rect)
{
  return _CGRectGetMinX(rect);
}

CGFloat CGRectGetMinY(CGRect rect)
{
  return _CGRectGetMinY(rect);
}

CGFloat CGRectGetWidth(CGRect rect)
{
  return _CGRectGetWidth(rect);
}

CGRect CGRectIntersection(CGRect r1, CGRect r2)
{
  return _CGRectIntersection(r1, r2);
}

uint64_t GSInitialize()
{
  return _GSInitialize();
}

IOReturn IOPMAssertionCreateWithName(CFStringRef AssertionType, IOPMAssertionLevel AssertionLevel, CFStringRef AssertionName, IOPMAssertionID *AssertionID)
{
  return _IOPMAssertionCreateWithName(AssertionType, AssertionLevel, AssertionName, AssertionID);
}

IOReturn IOPMAssertionRelease(IOPMAssertionID AssertionID)
{
  return _IOPMAssertionRelease(AssertionID);
}

void NSLog(NSString *format, ...)
{
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return _NSStringFromSelector(aSelector);
}

NSString *NSTemporaryDirectory(void)
{
  return _NSTemporaryDirectory();
}

uint64_t SBSGetApplicationState()
{
  return _SBSGetApplicationState();
}

CFDataRef SecCertificateCopyData(SecCertificateRef certificate)
{
  return _SecCertificateCopyData(certificate);
}

SecCertificateRef SecCertificateCreateWithData(CFAllocatorRef allocator, CFDataRef data)
{
  return _SecCertificateCreateWithData(allocator, data);
}

uint64_t SecCertificateNotValidAfter()
{
  return _SecCertificateNotValidAfter();
}

OSStatus SecItemAdd(CFDictionaryRef attributes, CFTypeRef *result)
{
  return _SecItemAdd(attributes, result);
}

OSStatus SecItemCopyMatching(CFDictionaryRef query, CFTypeRef *result)
{
  return _SecItemCopyMatching(query, result);
}

OSStatus SecItemDelete(CFDictionaryRef query)
{
  return _SecItemDelete(query);
}

OSStatus SecItemUpdate(CFDictionaryRef query, CFDictionaryRef attributesToUpdate)
{
  return _SecItemUpdate(query, attributesToUpdate);
}

CFStringRef SecTaskCopySigningIdentifier(SecTaskRef task, CFErrorRef *error)
{
  return _SecTaskCopySigningIdentifier(task, error);
}

SecTaskRef SecTaskCreateWithAuditToken(CFAllocatorRef allocator, audit_token_t *token)
{
  return _SecTaskCreateWithAuditToken(allocator, token);
}

OSStatus SecTrustEvaluate(SecTrustRef trust, SecTrustResultType *result)
{
  return _SecTrustEvaluate(trust, result);
}

BOOL SecTrustEvaluateWithError(SecTrustRef trust, CFErrorRef *error)
{
  return _SecTrustEvaluateWithError(trust, error);
}

SecCertificateRef SecTrustGetCertificateAtIndex(SecTrustRef trust, CFIndex ix)
{
  return _SecTrustGetCertificateAtIndex(trust, ix);
}

uint64_t SockAddrGetPort()
{
  return _SockAddrGetPort();
}

uint64_t SockAddrToString()
{
  return _SockAddrToString();
}

uint64_t WiFiDeviceClientCopyCurrentNetwork()
{
  return _WiFiDeviceClientCopyCurrentNetwork();
}

uint64_t WiFiDeviceClientGetTypeID()
{
  return _WiFiDeviceClientGetTypeID();
}

uint64_t WiFiManagerClientCopyDevices()
{
  return _WiFiManagerClientCopyDevices();
}

uint64_t WiFiManagerClientCreate()
{
  return _WiFiManagerClientCreate();
}

uint64_t WiFiNetworkGetSSID()
{
  return _WiFiNetworkGetSSID();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFURLCredentialCreateOAuth2()
{
  return __CFURLCredentialCreateOAuth2();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void std::terminate(void)
{
}

void operator delete()
{
  while (1)
    ;
}

void operator new()
{
  while (1)
    ;
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

void *__cxa_begin_catch(void *a1)
{
  return ___cxa_begin_catch(a1);
}

void __cxa_guard_abort(__guard *a1)
{
}

int __cxa_guard_acquire(__guard *a1)
{
  return ___cxa_guard_acquire((uint64_t *)a1);
}

void __cxa_guard_release(__guard *a1)
{
}

int *__error(void)
{
  return ___error();
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return ___maskrune(a1, a2);
}

os_activity_t _os_activity_create(void *dso, const char *description, os_activity_t activity, os_activity_flag_t flags)
{
  return __os_activity_create(dso, description, activity, flags);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _set_user_dir_suffix()
{
  return __set_user_dir_suffix();
}

void abort(void)
{
}

uint32_t arc4random(void)
{
  return _arc4random();
}

int atexit_b(void *a1)
{
  return _atexit_b(a1);
}

int atoi(const char *a1)
{
  return _atoi(a1);
}

void bzero(void *a1, size_t a2)
{
}

int close(int a1)
{
  return _close(a1);
}

int connect(int a1, const sockaddr *a2, socklen_t a3)
{
  return _connect(a1, a2, a3);
}

int deflate(z_streamp strm, int flush)
{
  return _deflate(strm, flush);
}

int deflateEnd(z_streamp strm)
{
  return _deflateEnd(strm);
}

int deflateInit2_(z_streamp strm, int level, int method, int windowBits, int memLevel, int strategy, const char *version, int stream_size)
{
  return _deflateInit2_(strm, level, method, windowBits, memLevel, strategy, version, stream_size);
}

void dispatch_activate(dispatch_object_t object)
{
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_assert_queue_not_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

BOOL dispatch_data_apply(dispatch_data_t data, dispatch_data_applier_t applier)
{
  return _dispatch_data_apply(data, applier);
}

dispatch_data_t dispatch_data_create(const void *buffer, size_t size, dispatch_queue_t queue, dispatch_block_t destructor)
{
  return _dispatch_data_create(buffer, size, queue, destructor);
}

dispatch_data_t dispatch_data_create_concat(dispatch_data_t data1, dispatch_data_t data2)
{
  return _dispatch_data_create_concat(data1, data2);
}

dispatch_data_t dispatch_data_create_subrange(dispatch_data_t data, size_t offset, size_t length)
{
  return _dispatch_data_create_subrange(data, offset, length);
}

size_t dispatch_data_get_size(dispatch_data_t data)
{
  return _dispatch_data_get_size(data);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return _dispatch_queue_attr_make_with_autorelease_frequency(attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return _dispatch_semaphore_create(value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return _dispatch_semaphore_signal(dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return _dispatch_semaphore_wait(dsema, timeout);
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return _dispatch_source_create(type, handle, mask, queue);
}

uintptr_t dispatch_source_get_data(dispatch_source_t source)
{
  return _dispatch_source_get_data(source);
}

void dispatch_source_merge_data(dispatch_source_t source, uintptr_t value)
{
}

void dispatch_source_set_cancel_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

intptr_t dispatch_source_testcancel(dispatch_source_t source)
{
  return _dispatch_source_testcancel(source);
}

void dispatch_suspend(dispatch_object_t object)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return _dlopen(__path, __mode);
}

void exit(int a1)
{
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return _fprintf(a1, a2);
}

void free(void *a1)
{
}

pid_t getpid(void)
{
  return _getpid();
}

char *__cdecl if_indextoname(unsigned int a1, char *a2)
{
  return _if_indextoname(a1, a2);
}

const char *__cdecl inet_ntop(int a1, const void *a2, char *a3, socklen_t a4)
{
  return _inet_ntop(a1, a2, a3, a4);
}

int inflate(z_streamp strm, int flush)
{
  return _inflate(strm, flush);
}

int inflateInit2_(z_streamp strm, int windowBits, const char *version, int stream_size)
{
  return _inflateInit2_(strm, windowBits, version, stream_size);
}

int lstat(const char *a1, stat *a2)
{
  return _lstat(a1, a2);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_calloc(count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_realloc(ptr, size, type_id);
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return _memchr(__s, __c, __n);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return _memcmp(__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return _memset(__b, __c, __len);
}

void memset_pattern16(void *__b, const void *__pattern16, size_t __len)
{
}

time_t mktime(tm *a1)
{
  return _mktime(a1);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return _mmap(a1, a2, a3, a4, a5, a6);
}

uint32_t notify_post(const char *name)
{
  return _notify_post(name);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return _notify_register_check(name, out_token);
}

uint32_t notify_set_state(int token, uint64_t state64)
{
  return _notify_set_state(token, state64);
}

uint64_t nw_array_get_count()
{
  return _nw_array_get_count();
}

uint64_t nw_array_get_object_at_index()
{
  return _nw_array_get_object_at_index();
}

nw_browse_descriptor_t nw_browse_descriptor_create_bonjour_service(const char *type, const char *domain)
{
  return _nw_browse_descriptor_create_bonjour_service(type, domain);
}

void nw_browse_descriptor_set_include_txt_record(nw_browse_descriptor_t descriptor, BOOL include_txt_record)
{
}

nw_endpoint_t nw_browse_result_copy_endpoint(nw_browse_result_t result)
{
  return _nw_browse_result_copy_endpoint(result);
}

nw_txt_record_t nw_browse_result_copy_txt_record_object(nw_browse_result_t result)
{
  return _nw_browse_result_copy_txt_record_object(result);
}

nw_browse_result_change_t nw_browse_result_get_changes(nw_browse_result_t old_result, nw_browse_result_t new_result)
{
  return _nw_browse_result_get_changes(old_result, new_result);
}

void nw_browser_cancel(nw_browser_t browser)
{
}

nw_browser_t nw_browser_create(nw_browse_descriptor_t descriptor, nw_parameters_t parameters)
{
  return _nw_browser_create(descriptor, parameters);
}

void nw_browser_set_browse_results_changed_handler(nw_browser_t browser, nw_browser_browse_results_changed_handler_t handler)
{
}

void nw_browser_set_queue(nw_browser_t browser, dispatch_queue_t queue)
{
}

void nw_browser_start(nw_browser_t browser)
{
}

void nw_connection_cancel(nw_connection_t connection)
{
}

nw_connection_t nw_connection_create(nw_endpoint_t endpoint, nw_parameters_t parameters)
{
  return _nw_connection_create(endpoint, parameters);
}

void nw_connection_receive(nw_connection_t connection, uint32_t minimum_incomplete_length, uint32_t maximum_length, nw_connection_receive_completion_t completion)
{
}

void nw_connection_send(nw_connection_t connection, dispatch_data_t content, nw_content_context_t context, BOOL is_complete, nw_connection_send_completion_t completion)
{
}

void nw_connection_set_queue(nw_connection_t connection, dispatch_queue_t queue)
{
}

void nw_connection_set_state_changed_handler(nw_connection_t connection, nw_connection_state_changed_handler_t handler)
{
}

void nw_connection_start(nw_connection_t connection)
{
}

nw_content_context_t nw_content_context_create(const char *context_identifier)
{
  return _nw_content_context_create(context_identifier);
}

nw_txt_record_t nw_endpoint_copy_txt_record(nw_endpoint_t endpoint)
{
  return _nw_endpoint_copy_txt_record(endpoint);
}

nw_endpoint_t nw_endpoint_create_host(const char *hostname, const char *port)
{
  return _nw_endpoint_create_host(hostname, port);
}

const sockaddr *__cdecl nw_endpoint_get_address(nw_endpoint_t endpoint)
{
  return _nw_endpoint_get_address(endpoint);
}

const char *__cdecl nw_endpoint_get_bonjour_service_domain(nw_endpoint_t endpoint)
{
  return _nw_endpoint_get_bonjour_service_domain(endpoint);
}

const char *__cdecl nw_endpoint_get_bonjour_service_name(nw_endpoint_t endpoint)
{
  return _nw_endpoint_get_bonjour_service_name(endpoint);
}

const char *__cdecl nw_endpoint_get_bonjour_service_type(nw_endpoint_t endpoint)
{
  return _nw_endpoint_get_bonjour_service_type(endpoint);
}

const char *__cdecl nw_endpoint_get_hostname(nw_endpoint_t endpoint)
{
  return _nw_endpoint_get_hostname(endpoint);
}

uint16_t nw_endpoint_get_port(nw_endpoint_t endpoint)
{
  return _nw_endpoint_get_port(endpoint);
}

nw_endpoint_type_t nw_endpoint_get_type(nw_endpoint_t endpoint)
{
  return _nw_endpoint_get_type(endpoint);
}

const char *__cdecl nw_endpoint_get_url(nw_endpoint_t endpoint)
{
  return _nw_endpoint_get_url(endpoint);
}

void nw_listener_cancel(nw_listener_t listener)
{
}

nw_listener_t nw_listener_create(nw_parameters_t parameters)
{
  return _nw_listener_create(parameters);
}

uint16_t nw_listener_get_port(nw_listener_t listener)
{
  return _nw_listener_get_port(listener);
}

uint64_t nw_listener_set_event_handler()
{
  return _nw_listener_set_event_handler();
}

void nw_listener_set_new_connection_handler(nw_listener_t listener, nw_listener_new_connection_handler_t handler)
{
}

void nw_listener_set_queue(nw_listener_t listener, dispatch_queue_t queue)
{
}

void nw_listener_start(nw_listener_t listener)
{
}

nw_parameters_t nw_parameters_create_secure_tcp(nw_parameters_configure_protocol_block_t configure_tls, nw_parameters_configure_protocol_block_t configure_tcp)
{
  return _nw_parameters_create_secure_tcp(configure_tls, configure_tcp);
}

uint64_t nw_parameters_set_account_id()
{
  return _nw_parameters_set_account_id();
}

uint64_t nw_parameters_set_attributed_bundle_identifier()
{
  return _nw_parameters_set_attributed_bundle_identifier();
}

void nw_parameters_set_required_interface_type(nw_parameters_t parameters, nw_interface_type_t interface_type)
{
}

uint64_t nw_resolver_cancel()
{
  return _nw_resolver_cancel();
}

uint64_t nw_resolver_create_with_endpoint()
{
  return _nw_resolver_create_with_endpoint();
}

uint64_t nw_resolver_set_update_handler()
{
  return _nw_resolver_set_update_handler();
}

BOOL nw_txt_record_access_key(nw_txt_record_t txt_record, const char *key, nw_txt_record_access_key_t access_value)
{
  return _nw_txt_record_access_key(txt_record, key, access_value);
}

nw_txt_record_find_key_t nw_txt_record_find_key(nw_txt_record_t txt_record, const char *key)
{
  return _nw_txt_record_find_key(txt_record, key);
}

size_t nw_txt_record_get_key_count(nw_txt_record_t txt_record)
{
  return _nw_txt_record_get_key_count(txt_record);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
}

{
}

{
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

id objc_begin_catch(void *exc_buf)
{
  return _objc_begin_catch(exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
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

void objc_exception_rethrow(void)
{
}

void objc_exception_throw(id exception)
{
}

Class objc_getClass(const char *name)
{
  return _objc_getClass(name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return _objc_getProperty(self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return _objc_initWeak(location, val);
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
}

int objc_sync_enter(id obj)
{
  return _objc_sync_enter(obj);
}

int objc_sync_exit(id obj)
{
  return _objc_sync_exit(obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

BOOL object_isClass(id obj)
{
  return _object_isClass(obj);
}

int open(const char *a1, int a2, ...)
{
  return _open(a1, a2);
}

void os_activity_apply(os_activity_t activity, os_block_t block)
{
}

void os_activity_scope_enter(os_activity_t activity, os_activity_scope_state_t state)
{
}

void os_activity_scope_leave(os_activity_scope_state_t state)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t os_transaction_create()
{
  return _os_transaction_create();
}

uint64_t os_transaction_needs_more_time()
{
  return _os_transaction_needs_more_time();
}

long double pow(long double __x, long double __y)
{
  return _pow(__x, __y);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return _pthread_mutex_lock(a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return _pthread_mutex_unlock(a1);
}

int pthread_set_qos_class_self_np(qos_class_t __qos_class, int __relative_priority)
{
  return _pthread_set_qos_class_self_np(__qos_class, __relative_priority);
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return _read(a1, a2, a3);
}

unsigned int sleep(unsigned int a1)
{
  return _sleep(a1);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return _snprintf(__str, __size, __format);
}

int socket(int a1, int a2, int a3)
{
  return _socket(a1, a2, a3);
}

int sscanf(const char *a1, const char *a2, ...)
{
  return _sscanf(a1, a2);
}

char *__cdecl strchr(char *__s, int __c)
{
  return _strchr(__s, __c);
}

int strcmp(const char *__s1, const char *__s2)
{
  return _strcmp(__s1, __s2);
}

char *__cdecl strerror(int __errnum)
{
  return _strerror(__errnum);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return _strlcpy(__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return _strlen(__s);
}

int strncasecmp(const char *a1, const char *a2, size_t a3)
{
  return _strncasecmp(a1, a2, a3);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return _strncmp(__s1, __s2, __n);
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return _sysctl(a1, a2, a3, a4, a5, a6);
}

time_t time(time_t *a1)
{
  return _time(a1);
}

int unlink(const char *a1)
{
  return _unlink(a1);
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return _write(__fd, __buf, __nbyte);
}

id objc_msgSend_AppleThumbnailPosition(void *a1, const char *a2, ...)
{
  return [a1 AppleThumbnailPosition];
}

id objc_msgSend_Copies(void *a1, const char *a2, ...)
{
  return [a1 Copies];
}

id objc_msgSend_DocumentFormat(void *a1, const char *a2, ...)
{
  return [a1 DocumentFormat];
}

id objc_msgSend_DocumentPassword(void *a1, const char *a2, ...)
{
  return [a1 DocumentPassword];
}

id objc_msgSend_Finishings(void *a1, const char *a2, ...)
{
  return [a1 Finishings];
}

id objc_msgSend_FinishingsCol(void *a1, const char *a2, ...)
{
  return [a1 FinishingsCol];
}

id objc_msgSend_HTTPAdditionalHeaders(void *a1, const char *a2, ...)
{
  return [a1 HTTPAdditionalHeaders];
}

id objc_msgSend_JobAccountID(void *a1, const char *a2, ...)
{
  return [a1 JobAccountID];
}

id objc_msgSend_JobName(void *a1, const char *a2, ...)
{
  return [a1 JobName];
}

id objc_msgSend_Media(void *a1, const char *a2, ...)
{
  return [a1 Media];
}

id objc_msgSend_OrientationRequested(void *a1, const char *a2, ...)
{
  return [a1 OrientationRequested];
}

id objc_msgSend_OutputBin(void *a1, const char *a2, ...)
{
  return [a1 OutputBin];
}

id objc_msgSend_OutputMode(void *a1, const char *a2, ...)
{
  return [a1 OutputMode];
}

id objc_msgSend_PageRanges(void *a1, const char *a2, ...)
{
  return [a1 PageRanges];
}

id objc_msgSend_PresetName(void *a1, const char *a2, ...)
{
  return [a1 PresetName];
}

id objc_msgSend_PrintColorMode(void *a1, const char *a2, ...)
{
  return [a1 PrintColorMode];
}

id objc_msgSend_PrintQuality(void *a1, const char *a2, ...)
{
  return [a1 PrintQuality];
}

id objc_msgSend_PrintScaling(void *a1, const char *a2, ...)
{
  return [a1 PrintScaling];
}

id objc_msgSend_Sides(void *a1, const char *a2, ...)
{
  return [a1 Sides];
}

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return [a1 URL];
}

id objc_msgSend_URLByDeletingLastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 URLByDeletingLastPathComponent];
}

id objc_msgSend_URLSession(void *a1, const char *a2, ...)
{
  return [a1 URLSession];
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend__auxiliaryConnection(void *a1, const char *a2, ...)
{
  return [a1 _auxiliaryConnection];
}

id objc_msgSend__canReadFromSocket(void *a1, const char *a2, ...)
{
  return [a1 _canReadFromSocket];
}

id objc_msgSend__canWriteToSocket(void *a1, const char *a2, ...)
{
  return [a1 _canWriteToSocket];
}

id objc_msgSend__cancel(void *a1, const char *a2, ...)
{
  return [a1 _cancel];
}

id objc_msgSend__checkSync(void *a1, const char *a2, ...)
{
  return [a1 _checkSync];
}

id objc_msgSend__checkWrite(void *a1, const char *a2, ...)
{
  return [a1 _checkWrite];
}

id objc_msgSend__commonInvalidation(void *a1, const char *a2, ...)
{
  return [a1 _commonInvalidation];
}

id objc_msgSend__connectionReady(void *a1, const char *a2, ...)
{
  return [a1 _connectionReady];
}

id objc_msgSend__createCFAuthChallenge(void *a1, const char *a2, ...)
{
  return [a1 _createCFAuthChallenge];
}

id objc_msgSend__descriptionLeader(void *a1, const char *a2, ...)
{
  return [a1 _descriptionLeader];
}

id objc_msgSend__flushWaiters(void *a1, const char *a2, ...)
{
  return [a1 _flushWaiters];
}

id objc_msgSend__httpReceive(void *a1, const char *a2, ...)
{
  return [a1 _httpReceive];
}

id objc_msgSend__interrupted(void *a1, const char *a2, ...)
{
  return [a1 _interrupted];
}

id objc_msgSend__invalidated(void *a1, const char *a2, ...)
{
  return [a1 _invalidated];
}

id objc_msgSend__listenerReady(void *a1, const char *a2, ...)
{
  return [a1 _listenerReady];
}

id objc_msgSend__logInitialization(void *a1, const char *a2, ...)
{
  return [a1 _logInitialization];
}

id objc_msgSend__setupCancelSource(void *a1, const char *a2, ...)
{
  return [a1 _setupCancelSource];
}

id objc_msgSend__setupCancelSource0(void *a1, const char *a2, ...)
{
  return [a1 _setupCancelSource0];
}

id objc_msgSend__setupCredentials(void *a1, const char *a2, ...)
{
  return [a1 _setupCredentials];
}

id objc_msgSend__setupNewRequest(void *a1, const char *a2, ...)
{
  return [a1 _setupNewRequest];
}

id objc_msgSend__shutdown(void *a1, const char *a2, ...)
{
  return [a1 _shutdown];
}

id objc_msgSend__start(void *a1, const char *a2, ...)
{
  return [a1 _start];
}

id objc_msgSend__syncTimerFired(void *a1, const char *a2, ...)
{
  return [a1 _syncTimerFired];
}

id objc_msgSend__teardownTask(void *a1, const char *a2, ...)
{
  return [a1 _teardownTask];
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return [a1 absoluteString];
}

id objc_msgSend_absoluteURL(void *a1, const char *a2, ...)
{
  return [a1 absoluteURL];
}

id objc_msgSend_activate(void *a1, const char *a2, ...)
{
  return [a1 activate];
}

id objc_msgSend_addEntity(void *a1, const char *a2, ...)
{
  return [a1 addEntity];
}

id objc_msgSend_addJobAndAllowToProceed(void *a1, const char *a2, ...)
{
  return [a1 addJobAndAllowToProceed];
}

id objc_msgSend_addJobAndReturnLogMessageOnFailure(void *a1, const char *a2, ...)
{
  return [a1 addJobAndReturnLogMessageOnFailure];
}

id objc_msgSend_addNewEmptyValue(void *a1, const char *a2, ...)
{
  return [a1 addNewEmptyValue];
}

id objc_msgSend_airPrintBeaconDiscoveryAllowed(void *a1, const char *a2, ...)
{
  return [a1 airPrintBeaconDiscoveryAllowed];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return [a1 allKeys];
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return [a1 allValues];
}

id objc_msgSend_allowThisJobToProceedNoLock(void *a1, const char *a2, ...)
{
  return [a1 allowThisJobToProceedNoLock];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_attributesRequiredForPKPaperList(void *a1, const char *a2, ...)
{
  return [a1 attributesRequiredForPKPaperList];
}

id objc_msgSend_attrs(void *a1, const char *a2, ...)
{
  return [a1 attrs];
}

id objc_msgSend_auditToken(void *a1, const char *a2, ...)
{
  return [a1 auditToken];
}

id objc_msgSend_authenticationMethod(void *a1, const char *a2, ...)
{
  return [a1 authenticationMethod];
}

id objc_msgSend_baseName(void *a1, const char *a2, ...)
{
  return [a1 baseName];
}

id objc_msgSend_bonjourName(void *a1, const char *a2, ...)
{
  return [a1 bonjourName];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_BOOLean(void *a1, const char *a2, ...)
{
  return [a1 BOOLean];
}

id objc_msgSend_browseInfo(void *a1, const char *a2, ...)
{
  return [a1 browseInfo];
}

id objc_msgSend_busy(void *a1, const char *a2, ...)
{
  return [a1 busy];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return [a1 bytes];
}

id objc_msgSend_cancel(void *a1, const char *a2, ...)
{
  return [a1 cancel];
}

id objc_msgSend_cancelNoLock(void *a1, const char *a2, ...)
{
  return [a1 cancelNoLock];
}

id objc_msgSend_cancelThisJob(void *a1, const char *a2, ...)
{
  return [a1 cancelThisJob];
}

id objc_msgSend_checkJobsOnMainQueue(void *a1, const char *a2, ...)
{
  return [a1 checkJobsOnMainQueue];
}

id objc_msgSend_clearCredential(void *a1, const char *a2, ...)
{
  return [a1 clearCredential];
}

id objc_msgSend_clientBundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 clientBundleIdentifier];
}

id objc_msgSend_clientID(void *a1, const char *a2, ...)
{
  return [a1 clientID];
}

id objc_msgSend_close(void *a1, const char *a2, ...)
{
  return [a1 close];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_collection(void *a1, const char *a2, ...)
{
  return [a1 collection];
}

id objc_msgSend_colorReason(void *a1, const char *a2, ...)
{
  return [a1 colorReason];
}

id objc_msgSend_completedTime(void *a1, const char *a2, ...)
{
  return [a1 completedTime];
}

id objc_msgSend_configuration(void *a1, const char *a2, ...)
{
  return [a1 configuration];
}

id objc_msgSend_controlFlags(void *a1, const char *a2, ...)
{
  return [a1 controlFlags];
}

id objc_msgSend_controlLogging(void *a1, const char *a2, ...)
{
  return [a1 controlLogging];
}

id objc_msgSend_copies(void *a1, const char *a2, ...)
{
  return [a1 copies];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_copyCEndpoint(void *a1, const char *a2, ...)
{
  return [a1 copyCEndpoint];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_createDataConsumer(void *a1, const char *a2, ...)
{
  return [a1 createDataConsumer];
}

id objc_msgSend_currentJob(void *a1, const char *a2, ...)
{
  return [a1 currentJob];
}

id objc_msgSend_currentLocale(void *a1, const char *a2, ...)
{
  return [a1 currentLocale];
}

id objc_msgSend_currentRequest(void *a1, const char *a2, ...)
{
  return [a1 currentRequest];
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return [a1 data];
}

id objc_msgSend_dataRepresentation(void *a1, const char *a2, ...)
{
  return [a1 dataRepresentation];
}

id objc_msgSend_datapathSecurityRequired(void *a1, const char *a2, ...)
{
  return [a1 datapathSecurityRequired];
}

id objc_msgSend_datapathSupported(void *a1, const char *a2, ...)
{
  return [a1 datapathSupported];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_debugDescription(void *a1, const char *a2, ...)
{
  return [a1 debugDescription];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_defaultCredentialForPrinter(void *a1, const char *a2, ...)
{
  return [a1 defaultCredentialForPrinter];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_defaultStore(void *a1, const char *a2, ...)
{
  return [a1 defaultStore];
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return [a1 defaultWorkspace];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_deviceID(void *a1, const char *a2, ...)
{
  return [a1 deviceID];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_dids(void *a1, const char *a2, ...)
{
  return [a1 dids];
}

id objc_msgSend_discoveryResult(void *a1, const char *a2, ...)
{
  return [a1 discoveryResult];
}

id objc_msgSend_dispatchQueue(void *a1, const char *a2, ...)
{
  return [a1 dispatchQueue];
}

id objc_msgSend_displayName(void *a1, const char *a2, ...)
{
  return [a1 displayName];
}

id objc_msgSend_displayNameForPrintKitUI(void *a1, const char *a2, ...)
{
  return [a1 displayNameForPrintKitUI];
}

id objc_msgSend_documentPassword(void *a1, const char *a2, ...)
{
  return [a1 documentPassword];
}

id objc_msgSend_documentPasswordSupported(void *a1, const char *a2, ...)
{
  return [a1 documentPasswordSupported];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return [a1 domain];
}

id objc_msgSend_driverformat(void *a1, const char *a2, ...)
{
  return [a1 driverformat];
}

id objc_msgSend_duplex(void *a1, const char *a2, ...)
{
  return [a1 duplex];
}

id objc_msgSend_effectiveUserIdentifier(void *a1, const char *a2, ...)
{
  return [a1 effectiveUserIdentifier];
}

id objc_msgSend_endpoint(void *a1, const char *a2, ...)
{
  return [a1 endpoint];
}

id objc_msgSend_endpointFoundHandler(void *a1, const char *a2, ...)
{
  return [a1 endpointFoundHandler];
}

id objc_msgSend_endpointLostHandler(void *a1, const char *a2, ...)
{
  return [a1 endpointLostHandler];
}

id objc_msgSend_ephemeralSessionConfiguration(void *a1, const char *a2, ...)
{
  return [a1 ephemeralSessionConfiguration];
}

id objc_msgSend_failureResponse(void *a1, const char *a2, ...)
{
  return [a1 failureResponse];
}

id objc_msgSend_fileHandleForStreaming(void *a1, const char *a2, ...)
{
  return [a1 fileHandleForStreaming];
}

id objc_msgSend_fileSystemRepresentation(void *a1, const char *a2, ...)
{
  return [a1 fileSystemRepresentation];
}

id objc_msgSend_fileType(void *a1, const char *a2, ...)
{
  return [a1 fileType];
}

id objc_msgSend_finishStreamedIPPRequest(void *a1, const char *a2, ...)
{
  return [a1 finishStreamedIPPRequest];
}

id objc_msgSend_finishedWriting(void *a1, const char *a2, ...)
{
  return [a1 finishedWriting];
}

id objc_msgSend_finishingTemplate(void *a1, const char *a2, ...)
{
  return [a1 finishingTemplate];
}

id objc_msgSend_finishings(void *a1, const char *a2, ...)
{
  return [a1 finishings];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_furtherServiceDiscoveryRequired(void *a1, const char *a2, ...)
{
  return [a1 furtherServiceDiscoveryRequired];
}

id objc_msgSend_gatherLogInfo(void *a1, const char *a2, ...)
{
  return [a1 gatherLogInfo];
}

id objc_msgSend_getLogLeader(void *a1, const char *a2, ...)
{
  return [a1 getLogLeader];
}

id objc_msgSend_getiCloudPrintersList(void *a1, const char *a2, ...)
{
  return [a1 getiCloudPrintersList];
}

id objc_msgSend_globalSession(void *a1, const char *a2, ...)
{
  return [a1 globalSession];
}

id objc_msgSend_globallyUniqueString(void *a1, const char *a2, ...)
{
  return [a1 globallyUniqueString];
}

id objc_msgSend_gstateStack(void *a1, const char *a2, ...)
{
  return [a1 gstateStack];
}

id objc_msgSend_hasCopies(void *a1, const char *a2, ...)
{
  return [a1 hasCopies];
}

id objc_msgSend_hasFinishings(void *a1, const char *a2, ...)
{
  return [a1 hasFinishings];
}

id objc_msgSend_hasMediaCol(void *a1, const char *a2, ...)
{
  return [a1 hasMediaCol];
}

id objc_msgSend_hasOrientationRequested(void *a1, const char *a2, ...)
{
  return [a1 hasOrientationRequested];
}

id objc_msgSend_hasOutputBin(void *a1, const char *a2, ...)
{
  return [a1 hasOutputBin];
}

id objc_msgSend_hasPageRanges(void *a1, const char *a2, ...)
{
  return [a1 hasPageRanges];
}

id objc_msgSend_hasPassword(void *a1, const char *a2, ...)
{
  return [a1 hasPassword];
}

id objc_msgSend_hasPrintQuality(void *a1, const char *a2, ...)
{
  return [a1 hasPrintQuality];
}

id objc_msgSend_hasSides(void *a1, const char *a2, ...)
{
  return [a1 hasSides];
}

id objc_msgSend_hasSpaceAvailable(void *a1, const char *a2, ...)
{
  return [a1 hasSpaceAvailable];
}

id objc_msgSend_hash(void *a1, const char *a2, ...)
{
  return [a1 hash];
}

id objc_msgSend_host(void *a1, const char *a2, ...)
{
  return [a1 host];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_infoDictionary(void *a1, const char *a2, ...)
{
  return [a1 infoDictionary];
}

id objc_msgSend_init(void *a1, const char *a2, ...)
{
  return [a1 init];
}

id objc_msgSend_inputSlot(void *a1, const char *a2, ...)
{
  return [a1 inputSlot];
}

id objc_msgSend_instanceName(void *a1, const char *a2, ...)
{
  return [a1 instanceName];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_integer(void *a1, const char *a2, ...)
{
  return [a1 integer];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_invalidateAndCancel(void *a1, const char *a2, ...)
{
  return [a1 invalidateAndCancel];
}

id objc_msgSend_ippNetworkingSession(void *a1, const char *a2, ...)
{
  return [a1 ippNetworkingSession];
}

id objc_msgSend_ippNetworkingSessionForStreaming(void *a1, const char *a2, ...)
{
  return [a1 ippNetworkingSessionForStreaming];
}

id objc_msgSend_ippResponse(void *a1, const char *a2, ...)
{
  return [a1 ippResponse];
}

id objc_msgSend_ippSession(void *a1, const char *a2, ...)
{
  return [a1 ippSession];
}

id objc_msgSend_ippStatus(void *a1, const char *a2, ...)
{
  return [a1 ippStatus];
}

id objc_msgSend_ipv6LinkLocalAddress(void *a1, const char *a2, ...)
{
  return [a1 ipv6LinkLocalAddress];
}

id objc_msgSend_isAirPrintCredentialsStorageAllowed(void *a1, const char *a2, ...)
{
  return [a1 isAirPrintCredentialsStorageAllowed];
}

id objc_msgSend_isAirPrintTrustedTLSRequirementEnforced(void *a1, const char *a2, ...)
{
  return [a1 isAirPrintTrustedTLSRequirementEnforced];
}

id objc_msgSend_jobAccountID(void *a1, const char *a2, ...)
{
  return [a1 jobAccountID];
}

id objc_msgSend_jobHoldUntil(void *a1, const char *a2, ...)
{
  return [a1 jobHoldUntil];
}

id objc_msgSend_jobName(void *a1, const char *a2, ...)
{
  return [a1 jobName];
}

id objc_msgSend_jobPassword(void *a1, const char *a2, ...)
{
  return [a1 jobPassword];
}

id objc_msgSend_jobPresetName(void *a1, const char *a2, ...)
{
  return [a1 jobPresetName];
}

id objc_msgSend_jpegFeatures(void *a1, const char *a2, ...)
{
  return [a1 jpegFeatures];
}

id objc_msgSend_knownAirPrintIPPURLStrings(void *a1, const char *a2, ...)
{
  return [a1 knownAirPrintIPPURLStrings];
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return [a1 lastObject];
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 lastPathComponent];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_localInterfaceIndex(void *a1, const char *a2, ...)
{
  return [a1 localInterfaceIndex];
}

id objc_msgSend_localJobState(void *a1, const char *a2, ...)
{
  return [a1 localJobState];
}

id objc_msgSend_location(void *a1, const char *a2, ...)
{
  return [a1 location];
}

id objc_msgSend_logInfo(void *a1, const char *a2, ...)
{
  return [a1 logInfo];
}

id objc_msgSend_loggingDict(void *a1, const char *a2, ...)
{
  return [a1 loggingDict];
}

id objc_msgSend_lowercaseString(void *a1, const char *a2, ...)
{
  return [a1 lowercaseString];
}

id objc_msgSend_makeConnection(void *a1, const char *a2, ...)
{
  return [a1 makeConnection];
}

id objc_msgSend_makeEmptyResponse(void *a1, const char *a2, ...)
{
  return [a1 makeEmptyResponse];
}

id objc_msgSend_makeMediaCol(void *a1, const char *a2, ...)
{
  return [a1 makeMediaCol];
}

id objc_msgSend_mandatoryJobAttributes(void *a1, const char *a2, ...)
{
  return [a1 mandatoryJobAttributes];
}

id objc_msgSend_mediaColSupportedArray(void *a1, const char *a2, ...)
{
  return [a1 mediaColSupportedArray];
}

id objc_msgSend_mediaSize(void *a1, const char *a2, ...)
{
  return [a1 mediaSize];
}

id objc_msgSend_mediaSource(void *a1, const char *a2, ...)
{
  return [a1 mediaSource];
}

id objc_msgSend_mediaType(void *a1, const char *a2, ...)
{
  return [a1 mediaType];
}

id objc_msgSend_mutableBytes(void *a1, const char *a2, ...)
{
  return [a1 mutableBytes];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_networkName(void *a1, const char *a2, ...)
{
  return [a1 networkName];
}

id objc_msgSend_nonStrokeColorspace(void *a1, const char *a2, ...)
{
  return [a1 nonStrokeColorspace];
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return [a1 null];
}

id objc_msgSend_numberOfSheetsPerCopy(void *a1, const char *a2, ...)
{
  return [a1 numberOfSheetsPerCopy];
}

id objc_msgSend_nwEndpoint(void *a1, const char *a2, ...)
{
  return [a1 nwEndpoint];
}

id objc_msgSend_opString(void *a1, const char *a2, ...)
{
  return [a1 opString];
}

id objc_msgSend_open(void *a1, const char *a2, ...)
{
  return [a1 open];
}

id objc_msgSend_orientation(void *a1, const char *a2, ...)
{
  return [a1 orientation];
}

id objc_msgSend_outputBin(void *a1, const char *a2, ...)
{
  return [a1 outputBin];
}

id objc_msgSend_outputMode(void *a1, const char *a2, ...)
{
  return [a1 outputMode];
}

id objc_msgSend_outputModes(void *a1, const char *a2, ...)
{
  return [a1 outputModes];
}

id objc_msgSend_pageRanges(void *a1, const char *a2, ...)
{
  return [a1 pageRanges];
}

id objc_msgSend_pageScale(void *a1, const char *a2, ...)
{
  return [a1 pageScale];
}

id objc_msgSend_paper(void *a1, const char *a2, ...)
{
  return [a1 paper];
}

id objc_msgSend_paperList(void *a1, const char *a2, ...)
{
  return [a1 paperList];
}

id objc_msgSend_passphrase(void *a1, const char *a2, ...)
{
  return [a1 passphrase];
}

id objc_msgSend_password(void *a1, const char *a2, ...)
{
  return [a1 password];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_payloadSent(void *a1, const char *a2, ...)
{
  return [a1 payloadSent];
}

id objc_msgSend_payloadTotal(void *a1, const char *a2, ...)
{
  return [a1 payloadTotal];
}

id objc_msgSend_peerAddress(void *a1, const char *a2, ...)
{
  return [a1 peerAddress];
}

id objc_msgSend_peerEndpoint(void *a1, const char *a2, ...)
{
  return [a1 peerEndpoint];
}

id objc_msgSend_performAuthenticationForDeviceHTTP(void *a1, const char *a2, ...)
{
  return [a1 performAuthenticationForDeviceHTTP];
}

id objc_msgSend_persistentNameRepresentationForPrintKitUI(void *a1, const char *a2, ...)
{
  return [a1 persistentNameRepresentationForPrintKitUI];
}

id objc_msgSend_port(void *a1, const char *a2, ...)
{
  return [a1 port];
}

id objc_msgSend_precomposedStringWithCanonicalMapping(void *a1, const char *a2, ...)
{
  return [a1 precomposedStringWithCanonicalMapping];
}

id objc_msgSend_previousFailureCount(void *a1, const char *a2, ...)
{
  return [a1 previousFailureCount];
}

id objc_msgSend_printQuality(void *a1, const char *a2, ...)
{
  return [a1 printQuality];
}

id objc_msgSend_printSettings(void *a1, const char *a2, ...)
{
  return [a1 printSettings];
}

id objc_msgSend_printTriesCount(void *a1, const char *a2, ...)
{
  return [a1 printTriesCount];
}

id objc_msgSend_printer(void *a1, const char *a2, ...)
{
  return [a1 printer];
}

id objc_msgSend_printerDescription(void *a1, const char *a2, ...)
{
  return [a1 printerDescription];
}

id objc_msgSend_printerStateMessage(void *a1, const char *a2, ...)
{
  return [a1 printerStateMessage];
}

id objc_msgSend_printerStateReasons(void *a1, const char *a2, ...)
{
  return [a1 printerStateReasons];
}

id objc_msgSend_printerURL(void *a1, const char *a2, ...)
{
  return [a1 printerURL];
}

id objc_msgSend_printers(void *a1, const char *a2, ...)
{
  return [a1 printers];
}

id objc_msgSend_processIdentifier(void *a1, const char *a2, ...)
{
  return [a1 processIdentifier];
}

id objc_msgSend_processInfo(void *a1, const char *a2, ...)
{
  return [a1 processInfo];
}

id objc_msgSend_proposedCredential(void *a1, const char *a2, ...)
{
  return [a1 proposedCredential];
}

id objc_msgSend_protectionSpace(void *a1, const char *a2, ...)
{
  return [a1 protectionSpace];
}

id objc_msgSend_provenance(void *a1, const char *a2, ...)
{
  return [a1 provenance];
}

id objc_msgSend_provenanceIdentifier(void *a1, const char *a2, ...)
{
  return [a1 provenanceIdentifier];
}

id objc_msgSend_publishID(void *a1, const char *a2, ...)
{
  return [a1 publishID];
}

id objc_msgSend_publisherAddress(void *a1, const char *a2, ...)
{
  return [a1 publisherAddress];
}

id objc_msgSend_queue(void *a1, const char *a2, ...)
{
  return [a1 queue];
}

id objc_msgSend_quotaManagementURL(void *a1, const char *a2, ...)
{
  return [a1 quotaManagementURL];
}

id objc_msgSend_range(void *a1, const char *a2, ...)
{
  return [a1 range];
}

id objc_msgSend_rangeValue(void *a1, const char *a2, ...)
{
  return [a1 rangeValue];
}

id objc_msgSend_readyTime(void *a1, const char *a2, ...)
{
  return [a1 readyTime];
}

id objc_msgSend_realm(void *a1, const char *a2, ...)
{
  return [a1 realm];
}

id objc_msgSend_reasons(void *a1, const char *a2, ...)
{
  return [a1 reasons];
}

id objc_msgSend_remoteObjectProxy(void *a1, const char *a2, ...)
{
  return [a1 remoteObjectProxy];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return [a1 removeAllObjects];
}

id objc_msgSend_removeEntity(void *a1, const char *a2, ...)
{
  return [a1 removeEntity];
}

id objc_msgSend_removeLastObject(void *a1, const char *a2, ...)
{
  return [a1 removeLastObject];
}

id objc_msgSend_requiredPDL(void *a1, const char *a2, ...)
{
  return [a1 requiredPDL];
}

id objc_msgSend_resetJob(void *a1, const char *a2, ...)
{
  return [a1 resetJob];
}

id objc_msgSend_resolution(void *a1, const char *a2, ...)
{
  return [a1 resolution];
}

id objc_msgSend_resolvedTXT(void *a1, const char *a2, ...)
{
  return [a1 resolvedTXT];
}

id objc_msgSend_resolvedURL(void *a1, const char *a2, ...)
{
  return [a1 resolvedURL];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_rssi(void *a1, const char *a2, ...)
{
  return [a1 rssi];
}

id objc_msgSend_scheme(void *a1, const char *a2, ...)
{
  return [a1 scheme];
}

id objc_msgSend_serverCertificateCheckForDeviceHTTP(void *a1, const char *a2, ...)
{
  return [a1 serverCertificateCheckForDeviceHTTP];
}

id objc_msgSend_serverTrust(void *a1, const char *a2, ...)
{
  return [a1 serverTrust];
}

id objc_msgSend_serviceListener(void *a1, const char *a2, ...)
{
  return [a1 serviceListener];
}

id objc_msgSend_servicePort(void *a1, const char *a2, ...)
{
  return [a1 servicePort];
}

id objc_msgSend_serviceSpecificInfo(void *a1, const char *a2, ...)
{
  return [a1 serviceSpecificInfo];
}

id objc_msgSend_serviceType(void *a1, const char *a2, ...)
{
  return [a1 serviceType];
}

id objc_msgSend_serviceWithDefaultShellEndpoint(void *a1, const char *a2, ...)
{
  return [a1 serviceWithDefaultShellEndpoint];
}

id objc_msgSend_session(void *a1, const char *a2, ...)
{
  return [a1 session];
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return [a1 set];
}

id objc_msgSend_sharedConnection(void *a1, const char *a2, ...)
{
  return [a1 sharedConnection];
}

id objc_msgSend_sheetsCompleted(void *a1, const char *a2, ...)
{
  return [a1 sheetsCompleted];
}

id objc_msgSend_sides(void *a1, const char *a2, ...)
{
  return [a1 sides];
}

id objc_msgSend_specialFeedOrientation(void *a1, const char *a2, ...)
{
  return [a1 specialFeedOrientation];
}

id objc_msgSend_spoolDocumentFilename(void *a1, const char *a2, ...)
{
  return [a1 spoolDocumentFilename];
}

id objc_msgSend_spoolDocumentFormat(void *a1, const char *a2, ...)
{
  return [a1 spoolDocumentFormat];
}

id objc_msgSend_standardRequestedAttributes(void *a1, const char *a2, ...)
{
  return [a1 standardRequestedAttributes];
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return [a1 standardUserDefaults];
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return [a1 start];
}

id objc_msgSend_startLiveActivity(void *a1, const char *a2, ...)
{
  return [a1 startLiveActivity];
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return [a1 state];
}

id objc_msgSend_status(void *a1, const char *a2, ...)
{
  return [a1 status];
}

id objc_msgSend_statusCode(void *a1, const char *a2, ...)
{
  return [a1 statusCode];
}

id objc_msgSend_stop(void *a1, const char *a2, ...)
{
  return [a1 stop];
}

id objc_msgSend_stopBrowsing(void *a1, const char *a2, ...)
{
  return [a1 stopBrowsing];
}

id objc_msgSend_stopBrowsing0(void *a1, const char *a2, ...)
{
  return [a1 stopBrowsing0];
}

id objc_msgSend_stopLiveActivity(void *a1, const char *a2, ...)
{
  return [a1 stopLiveActivity];
}

id objc_msgSend_streamStatus(void *a1, const char *a2, ...)
{
  return [a1 streamStatus];
}

id objc_msgSend_string(void *a1, const char *a2, ...)
{
  return [a1 string];
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return [a1 stringValue];
}

id objc_msgSend_strokeColorspace(void *a1, const char *a2, ...)
{
  return [a1 strokeColorspace];
}

id objc_msgSend_supportsPrintColorMode(void *a1, const char *a2, ...)
{
  return [a1 supportsPrintColorMode];
}

id objc_msgSend_synchronize(void *a1, const char *a2, ...)
{
  return [a1 synchronize];
}

id objc_msgSend_synchronizeiCloudData(void *a1, const char *a2, ...)
{
  return [a1 synchronizeiCloudData];
}

id objc_msgSend_temporaryDirectory(void *a1, const char *a2, ...)
{
  return [a1 temporaryDirectory];
}

id objc_msgSend_terminationHandler(void *a1, const char *a2, ...)
{
  return [a1 terminationHandler];
}

id objc_msgSend_textInfo(void *a1, const char *a2, ...)
{
  return [a1 textInfo];
}

id objc_msgSend_timeoutIntervalForRequest(void *a1, const char *a2, ...)
{
  return [a1 timeoutIntervalForRequest];
}

id objc_msgSend_timeoutIntervalForResource(void *a1, const char *a2, ...)
{
  return [a1 timeoutIntervalForResource];
}

id objc_msgSend_transportError(void *a1, const char *a2, ...)
{
  return [a1 transportError];
}

id objc_msgSend_transportStatus(void *a1, const char *a2, ...)
{
  return [a1 transportStatus];
}

id objc_msgSend_trustRef(void *a1, const char *a2, ...)
{
  return [a1 trustRef];
}

id objc_msgSend_txtRecord(void *a1, const char *a2, ...)
{
  return [a1 txtRecord];
}

id objc_msgSend_txtRecordData(void *a1, const char *a2, ...)
{
  return [a1 txtRecordData];
}

id objc_msgSend_txtRecordDictionary(void *a1, const char *a2, ...)
{
  return [a1 txtRecordDictionary];
}

id objc_msgSend_txtRecordReconstructingAttributes(void *a1, const char *a2, ...)
{
  return [a1 txtRecordReconstructingAttributes];
}

id objc_msgSend_ubiquitousKeyValueStore(void *a1, const char *a2, ...)
{
  return [a1 ubiquitousKeyValueStore];
}

id objc_msgSend_uniquedBrowseInfos(void *a1, const char *a2, ...)
{
  return [a1 uniquedBrowseInfos];
}

id objc_msgSend_unknown(void *a1, const char *a2, ...)
{
  return [a1 unknown];
}

id objc_msgSend_unregisterAllDeviceChanges(void *a1, const char *a2, ...)
{
  return [a1 unregisterAllDeviceChanges];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntegerValue];
}

id objc_msgSend_urfIsOptional(void *a1, const char *a2, ...)
{
  return [a1 urfIsOptional];
}

id objc_msgSend_url(void *a1, const char *a2, ...)
{
  return [a1 url];
}

id objc_msgSend_user(void *a1, const char *a2, ...)
{
  return [a1 user];
}

id objc_msgSend_userCodableDictionary(void *a1, const char *a2, ...)
{
  return [a1 userCodableDictionary];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_uuid(void *a1, const char *a2, ...)
{
  return [a1 uuid];
}

id objc_msgSend_values(void *a1, const char *a2, ...)
{
  return [a1 values];
}

id objc_msgSend_wantsComprehensivePaperList(void *a1, const char *a2, ...)
{
  return [a1 wantsComprehensivePaperList];
}

id objc_msgSend_whitespaceCharacterSet(void *a1, const char *a2, ...)
{
  return [a1 whitespaceCharacterSet];
}

id objc_msgSend_workQueue(void *a1, const char *a2, ...)
{
  return [a1 workQueue];
}

id objc_msgSend_xDimension(void *a1, const char *a2, ...)
{
  return [a1 xDimension];
}

id objc_msgSend_yDimension(void *a1, const char *a2, ...)
{
  return [a1 yDimension];
}

id objc_msgSend_znProcessBand_withBandDescription_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "znProcessBand:withBandDescription:reply:");
}