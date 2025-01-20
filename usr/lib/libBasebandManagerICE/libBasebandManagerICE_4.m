void sub_1C5BA8CC8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, xpc_object_t object)
{
  if (!a2) {
    _Unwind_Resume(exception_object);
  }
  __clang_call_terminate(exception_object);
}

BOOL StatsAWD::fillMetric_sync(uint64_t a1, uint64_t *a2, void *a3)
{
  xpc_object_t v5 = (xpc_object_t)*a3;
  uint64_t v6 = MEMORY[0x1E4F14590];
  if (*a3 && MEMORY[0x1C8795EB0](*a3) == v6) {
    xpc_retain(v5);
  }
  else {
    xpc_object_t v5 = xpc_null_create();
  }
  uint64_t v7 = MEMORY[0x1C8795EB0](v5);
  if (v7 != v6)
  {
    v8 = *(NSObject **)(a1 + 40);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1C59C6000, v8, OS_LOG_TYPE_ERROR, "Invalid AWD Wake Reason Info dictionary", buf, 2u);
    }
    goto LABEL_160;
  }
  uint64_t v9 = *a2;
  xpc_object_t value = xpc_dictionary_get_value(v5, (const char *)*MEMORY[0x1E4F4D100]);
  xpc_object_t object = value;
  if (value) {
    xpc_retain(value);
  }
  else {
    xpc_object_t object = xpc_null_create();
  }
  xpc::dyn_cast_or_default((uint64_t *)buf, (xpc *)&object, (const object *)"Unknown", v11);
  *(_DWORD *)(v9 + 96) |= 2u;
  v12 = *(uint8_t **)(v9 + 16);
  v13 = (uint8_t *)MEMORY[0x1E4FBA920];
  if (v12 == (uint8_t *)MEMORY[0x1E4FBA920])
  {
    v12 = (uint8_t *)operator new(0x18uLL);
    *(void *)v12 = 0;
    *((void *)v12 + 1) = 0;
    *((void *)v12 + 2) = 0;
    *(void *)(v9 + 16) = v12;
    size_t v14 = HIBYTE(v87);
    if (((char)v12[23] & 0x80000000) == 0)
    {
LABEL_14:
      if ((v14 & 0x80) != 0)
      {
        std::string::__assign_no_alias<true>(v12, *(void **)buf, *(size_t *)&buf[8]);
      }
      else
      {
        long long v15 = *(_OWORD *)buf;
        *((void *)v12 + 2) = v87;
        *(_OWORD *)v12 = v15;
      }
      goto LABEL_25;
    }
  }
  else
  {
    if (v12 == buf) {
      goto LABEL_25;
    }
    size_t v14 = HIBYTE(v87);
    if (((char)v12[23] & 0x80000000) == 0) {
      goto LABEL_14;
    }
  }
  if ((v14 & 0x80u) == 0) {
    v16 = buf;
  }
  else {
    v16 = *(uint8_t **)buf;
  }
  if ((v14 & 0x80u) == 0) {
    size_t v17 = v14;
  }
  else {
    size_t v17 = *(void *)&buf[8];
  }
  std::string::__assign_no_alias<false>((void **)v12, v16, v17);
LABEL_25:
  if (SHIBYTE(v87) < 0) {
    operator delete(*(void **)buf);
  }
  xpc_release(object);
  uint64_t v18 = *a2;
  xpc_object_t v19 = xpc_dictionary_get_value(v5, (const char *)*MEMORY[0x1E4F4CFE8]);
  *(void *)buf = v19;
  if (v19) {
    xpc_retain(v19);
  }
  else {
    *(void *)buf = xpc_null_create();
  }
  char v20 = xpc::dyn_cast_or_default((xpc *)buf, 0);
  *(_DWORD *)(v18 + 96) |= 4u;
  *(unsigned char *)(v18 + 52) = v20;
  xpc_release(*(xpc_object_t *)buf);
  uint64_t v21 = *a2;
  xpc_object_t v22 = xpc_dictionary_get_value(v5, (const char *)*MEMORY[0x1E4F4D1B8]);
  xpc_object_t object = v22;
  if (v22) {
    xpc_retain(v22);
  }
  else {
    xpc_object_t object = xpc_null_create();
  }
  xpc::dyn_cast_or_default((uint64_t *)buf, (xpc *)&object, (const object *)"Unknown", v23);
  *(_DWORD *)(v21 + 96) |= 8u;
  v24 = *(uint8_t **)(v21 + 24);
  if (v24 == v13)
  {
    v24 = (uint8_t *)operator new(0x18uLL);
    *(void *)v24 = 0;
    *((void *)v24 + 1) = 0;
    *((void *)v24 + 2) = 0;
    *(void *)(v21 + 24) = v24;
    size_t v25 = HIBYTE(v87);
    if (((char)v24[23] & 0x80000000) == 0)
    {
LABEL_36:
      if ((v25 & 0x80) != 0)
      {
        std::string::__assign_no_alias<true>(v24, *(void **)buf, *(size_t *)&buf[8]);
      }
      else
      {
        long long v26 = *(_OWORD *)buf;
        *((void *)v24 + 2) = v87;
        *(_OWORD *)v24 = v26;
      }
      goto LABEL_47;
    }
  }
  else
  {
    if (v24 == buf) {
      goto LABEL_47;
    }
    size_t v25 = HIBYTE(v87);
    if (((char)v24[23] & 0x80000000) == 0) {
      goto LABEL_36;
    }
  }
  if ((v25 & 0x80u) == 0) {
    v27 = buf;
  }
  else {
    v27 = *(uint8_t **)buf;
  }
  if ((v25 & 0x80u) == 0) {
    size_t v28 = v25;
  }
  else {
    size_t v28 = *(void *)&buf[8];
  }
  std::string::__assign_no_alias<false>((void **)v24, v27, v28);
LABEL_47:
  if (SHIBYTE(v87) < 0) {
    operator delete(*(void **)buf);
  }
  xpc_release(object);
  uint64_t v29 = *a2;
  xpc_object_t v30 = xpc_dictionary_get_value(v5, (const char *)*MEMORY[0x1E4F4D090]);
  *(void *)buf = v30;
  if (v30) {
    xpc_retain(v30);
  }
  else {
    *(void *)buf = xpc_null_create();
  }
  int v31 = xpc::dyn_cast_or_default((xpc *)buf, 0);
  *(_DWORD *)(v29 + 96) |= 0x10u;
  *(_DWORD *)(v29 + 48) = v31;
  xpc_release(*(xpc_object_t *)buf);
  uint64_t v32 = *a2;
  xpc_object_t v33 = xpc_dictionary_get_value(v5, (const char *)*MEMORY[0x1E4F4CF10]);
  xpc_object_t object = v33;
  if (v33) {
    xpc_retain(v33);
  }
  else {
    xpc_object_t object = xpc_null_create();
  }
  xpc::dyn_cast_or_default((uint64_t *)buf, (xpc *)&object, (const object *)"Unknown", v34);
  *(_DWORD *)(v32 + 96) |= 0x20u;
  v35 = *(uint8_t **)(v32 + 32);
  if (v35 == v13)
  {
    v35 = (uint8_t *)operator new(0x18uLL);
    *(void *)v35 = 0;
    *((void *)v35 + 1) = 0;
    *((void *)v35 + 2) = 0;
    *(void *)(v32 + 32) = v35;
    size_t v36 = HIBYTE(v87);
    if (((char)v35[23] & 0x80000000) == 0)
    {
LABEL_58:
      if ((v36 & 0x80) != 0)
      {
        std::string::__assign_no_alias<true>(v35, *(void **)buf, *(size_t *)&buf[8]);
      }
      else
      {
        long long v37 = *(_OWORD *)buf;
        *((void *)v35 + 2) = v87;
        *(_OWORD *)v35 = v37;
      }
      goto LABEL_69;
    }
  }
  else
  {
    if (v35 == buf) {
      goto LABEL_69;
    }
    size_t v36 = HIBYTE(v87);
    if (((char)v35[23] & 0x80000000) == 0) {
      goto LABEL_58;
    }
  }
  if ((v36 & 0x80u) == 0) {
    v38 = buf;
  }
  else {
    v38 = *(uint8_t **)buf;
  }
  if ((v36 & 0x80u) == 0) {
    size_t v39 = v36;
  }
  else {
    size_t v39 = *(void *)&buf[8];
  }
  std::string::__assign_no_alias<false>((void **)v35, v38, v39);
LABEL_69:
  if (SHIBYTE(v87) < 0) {
    operator delete(*(void **)buf);
  }
  xpc_release(object);
  uint64_t v40 = *a2;
  xpc_object_t v41 = xpc_dictionary_get_value(v5, (const char *)*MEMORY[0x1E4F4D098]);
  xpc_object_t object = v41;
  if (v41) {
    xpc_retain(v41);
  }
  else {
    xpc_object_t object = xpc_null_create();
  }
  xpc::dyn_cast_or_default((uint64_t *)buf, (xpc *)&object, (const object *)"Unknown", v42);
  *(_DWORD *)(v40 + 96) |= 0x40u;
  v43 = *(uint8_t **)(v40 + 40);
  if (v43 == v13)
  {
    v43 = (uint8_t *)operator new(0x18uLL);
    *(void *)v43 = 0;
    *((void *)v43 + 1) = 0;
    *((void *)v43 + 2) = 0;
    *(void *)(v40 + 40) = v43;
    size_t v44 = HIBYTE(v87);
    if (((char)v43[23] & 0x80000000) == 0)
    {
LABEL_77:
      if ((v44 & 0x80) != 0)
      {
        std::string::__assign_no_alias<true>(v43, *(void **)buf, *(size_t *)&buf[8]);
      }
      else
      {
        long long v45 = *(_OWORD *)buf;
        *((void *)v43 + 2) = v87;
        *(_OWORD *)v43 = v45;
      }
      goto LABEL_88;
    }
  }
  else
  {
    if (v43 == buf) {
      goto LABEL_88;
    }
    size_t v44 = HIBYTE(v87);
    if (((char)v43[23] & 0x80000000) == 0) {
      goto LABEL_77;
    }
  }
  if ((v44 & 0x80u) == 0) {
    v46 = buf;
  }
  else {
    v46 = *(uint8_t **)buf;
  }
  if ((v44 & 0x80u) == 0) {
    size_t v47 = v44;
  }
  else {
    size_t v47 = *(void *)&buf[8];
  }
  std::string::__assign_no_alias<false>((void **)v43, v46, v47);
LABEL_88:
  if (SHIBYTE(v87) < 0) {
    operator delete(*(void **)buf);
  }
  xpc_release(object);
  uint64_t v48 = *a2;
  xpc_object_t v49 = xpc_dictionary_get_value(v5, (const char *)*MEMORY[0x1E4F4CFE0]);
  xpc_object_t object = v49;
  if (v49) {
    xpc_retain(v49);
  }
  else {
    xpc_object_t object = xpc_null_create();
  }
  xpc::dyn_cast_or_default((uint64_t *)buf, (xpc *)&object, (const object *)"Unknown", v50);
  *(_DWORD *)(v48 + 96) |= 0x80u;
  v51 = *(uint8_t **)(v48 + 56);
  if (v51 == v13)
  {
    v51 = (uint8_t *)operator new(0x18uLL);
    *(void *)v51 = 0;
    *((void *)v51 + 1) = 0;
    *((void *)v51 + 2) = 0;
    *(void *)(v48 + 56) = v51;
    size_t v52 = HIBYTE(v87);
    if (((char)v51[23] & 0x80000000) == 0)
    {
LABEL_96:
      if ((v52 & 0x80) != 0)
      {
        std::string::__assign_no_alias<true>(v51, *(void **)buf, *(size_t *)&buf[8]);
      }
      else
      {
        long long v53 = *(_OWORD *)buf;
        *((void *)v51 + 2) = v87;
        *(_OWORD *)v51 = v53;
      }
      goto LABEL_107;
    }
  }
  else
  {
    if (v51 == buf) {
      goto LABEL_107;
    }
    size_t v52 = HIBYTE(v87);
    if (((char)v51[23] & 0x80000000) == 0) {
      goto LABEL_96;
    }
  }
  if ((v52 & 0x80u) == 0) {
    v54 = buf;
  }
  else {
    v54 = *(uint8_t **)buf;
  }
  if ((v52 & 0x80u) == 0) {
    size_t v55 = v52;
  }
  else {
    size_t v55 = *(void *)&buf[8];
  }
  std::string::__assign_no_alias<false>((void **)v51, v54, v55);
LABEL_107:
  if (SHIBYTE(v87) < 0) {
    operator delete(*(void **)buf);
  }
  xpc_release(object);
  uint64_t v56 = *a2;
  xpc_object_t v57 = xpc_dictionary_get_value(v5, (const char *)*MEMORY[0x1E4F4CF58]);
  xpc_object_t object = v57;
  if (v57) {
    xpc_retain(v57);
  }
  else {
    xpc_object_t object = xpc_null_create();
  }
  xpc::dyn_cast_or_default((uint64_t *)buf, (xpc *)&object, (const object *)"Unknown", v58);
  *(_DWORD *)(v56 + 96) |= 0x100u;
  v59 = *(uint8_t **)(v56 + 64);
  if (v59 == v13)
  {
    v59 = (uint8_t *)operator new(0x18uLL);
    *(void *)v59 = 0;
    *((void *)v59 + 1) = 0;
    *((void *)v59 + 2) = 0;
    *(void *)(v56 + 64) = v59;
    size_t v60 = HIBYTE(v87);
    if (((char)v59[23] & 0x80000000) == 0)
    {
LABEL_115:
      if ((v60 & 0x80) != 0)
      {
        std::string::__assign_no_alias<true>(v59, *(void **)buf, *(size_t *)&buf[8]);
      }
      else
      {
        long long v61 = *(_OWORD *)buf;
        *((void *)v59 + 2) = v87;
        *(_OWORD *)v59 = v61;
      }
      goto LABEL_126;
    }
  }
  else
  {
    if (v59 == buf) {
      goto LABEL_126;
    }
    size_t v60 = HIBYTE(v87);
    if (((char)v59[23] & 0x80000000) == 0) {
      goto LABEL_115;
    }
  }
  if ((v60 & 0x80u) == 0) {
    v62 = buf;
  }
  else {
    v62 = *(uint8_t **)buf;
  }
  if ((v60 & 0x80u) == 0) {
    size_t v63 = v60;
  }
  else {
    size_t v63 = *(void *)&buf[8];
  }
  std::string::__assign_no_alias<false>((void **)v59, v62, v63);
LABEL_126:
  if (SHIBYTE(v87) < 0) {
    operator delete(*(void **)buf);
  }
  xpc_release(object);
  uint64_t v64 = *a2;
  xpc_object_t v65 = xpc_dictionary_get_value(v5, (const char *)*MEMORY[0x1E4F4CC48]);
  *(void *)buf = v65;
  if (v65) {
    xpc_retain(v65);
  }
  else {
    *(void *)buf = xpc_null_create();
  }
  int v66 = xpc::dyn_cast_or_default((xpc *)buf, 0);
  *(_DWORD *)(v64 + 96) |= 0x200u;
  *(_DWORD *)(v64 + 80) = v66;
  xpc_release(*(xpc_object_t *)buf);
  uint64_t v67 = *a2;
  xpc_object_t v68 = xpc_dictionary_get_value(v5, (const char *)*MEMORY[0x1E4F4CE10]);
  xpc_object_t object = v68;
  if (v68) {
    xpc_retain(v68);
  }
  else {
    xpc_object_t object = xpc_null_create();
  }
  xpc::dyn_cast_or_default((uint64_t *)buf, (xpc *)&object, (const object *)"Unknown", v69);
  *(_DWORD *)(v67 + 96) |= 0x400u;
  v70 = *(uint8_t **)(v67 + 72);
  if (v70 == v13)
  {
    v70 = (uint8_t *)operator new(0x18uLL);
    *(void *)v70 = 0;
    *((void *)v70 + 1) = 0;
    *((void *)v70 + 2) = 0;
    *(void *)(v67 + 72) = v70;
    size_t v71 = HIBYTE(v87);
    if (((char)v70[23] & 0x80000000) == 0)
    {
LABEL_137:
      if ((v71 & 0x80) != 0)
      {
        std::string::__assign_no_alias<true>(v70, *(void **)buf, *(size_t *)&buf[8]);
      }
      else
      {
        long long v72 = *(_OWORD *)buf;
        *((void *)v70 + 2) = v87;
        *(_OWORD *)v70 = v72;
      }
      goto LABEL_148;
    }
LABEL_140:
    if ((v71 & 0x80u) == 0) {
      v73 = buf;
    }
    else {
      v73 = *(uint8_t **)buf;
    }
    if ((v71 & 0x80u) == 0) {
      size_t v74 = v71;
    }
    else {
      size_t v74 = *(void *)&buf[8];
    }
    std::string::__assign_no_alias<false>((void **)v70, v73, v74);
    goto LABEL_148;
  }
  if (v70 != buf)
  {
    size_t v71 = HIBYTE(v87);
    if (((char)v70[23] & 0x80000000) == 0) {
      goto LABEL_137;
    }
    goto LABEL_140;
  }
LABEL_148:
  if (SHIBYTE(v87) < 0) {
    operator delete(*(void **)buf);
  }
  xpc_release(object);
  uint64_t v75 = *a2;
  xpc_object_t v76 = xpc_dictionary_get_value(v5, (const char *)*MEMORY[0x1E4F4CF08]);
  *(void *)buf = v76;
  if (v76) {
    xpc_retain(v76);
  }
  else {
    *(void *)buf = xpc_null_create();
  }
  int v77 = xpc::dyn_cast_or_default((xpc *)buf, 0);
  *(_DWORD *)(v75 + 96) |= 0x800u;
  *(_DWORD *)(v75 + 84) = v77;
  xpc_release(*(xpc_object_t *)buf);
  uint64_t v78 = *a2;
  xpc_object_t v79 = xpc_dictionary_get_value(v5, (const char *)*MEMORY[0x1E4F4CE08]);
  *(void *)buf = v79;
  if (v79) {
    xpc_retain(v79);
  }
  else {
    *(void *)buf = xpc_null_create();
  }
  int v80 = xpc::dyn_cast_or_default((xpc *)buf, 0);
  *(_DWORD *)(v78 + 96) |= 0x1000u;
  *(_DWORD *)(v78 + 88) = v80;
  xpc_release(*(xpc_object_t *)buf);
  uint64_t v81 = *a2;
  xpc_object_t v82 = xpc_dictionary_get_value(v5, (const char *)*MEMORY[0x1E4F4CB38]);
  *(void *)buf = v82;
  if (v82) {
    xpc_retain(v82);
  }
  else {
    *(void *)buf = xpc_null_create();
  }
  char v83 = xpc::dyn_cast_or_default((xpc *)buf, 0);
  *(_DWORD *)(v81 + 96) |= 0x2000u;
  *(unsigned char *)(v81 + 53) = v83;
  xpc_release(*(xpc_object_t *)buf);
LABEL_160:
  xpc_release(v5);
  return v7 == v6;
}

void sub_1C5BA96B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, xpc_object_t object, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  if (a16 < 0) {
    operator delete(__p);
  }
  xpc_release(object);
  xpc_release(v16);
  _Unwind_Resume(a1);
}

uint64_t StatsAWD::fillMetric_sync(uint64_t a1, int **a2, void *a3)
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  xpc_object_t v5 = (xpc_object_t)*a3;
  uint64_t v6 = MEMORY[0x1E4F14568];
  if (*a3 && MEMORY[0x1C8795EB0](*a3) == v6) {
    xpc_retain(v5);
  }
  else {
    xpc_object_t v5 = xpc_null_create();
  }
  if (MEMORY[0x1C8795EB0](v5) != v6)
  {
    uint64_t v7 = *(NSObject **)(a1 + 40);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)__dst = 0;
      _os_log_error_impl(&dword_1C59C6000, v7, OS_LOG_TYPE_ERROR, "Failed: Expected data needs to be dictionary in bb crash handling", __dst, 2u);
    }
    uint64_t v8 = 0;
    goto LABEL_25;
  }
  if (v5)
  {
    xpc_retain(v5);
    xpc_object_t object = v5;
    xpc_object_t v9 = v5;
LABEL_12:
    xpc_retain(v9);
    goto LABEL_13;
  }
  xpc_object_t v9 = xpc_null_create();
  xpc_object_t object = v9;
  if (v9) {
    goto LABEL_12;
  }
  xpc_object_t v9 = 0;
  xpc_object_t object = xpc_null_create();
LABEL_13:
  uint64_t v59 = 0;
  xpc_release(v9);
  if (v5)
  {
    xpc_retain(v5);
    xpc_object_t v10 = v5;
  }
  else
  {
    xpc_object_t v10 = xpc_null_create();
  }
  if (MEMORY[0x1C8795EB0](v5) == v6)
  {
    size_t count = xpc_array_get_count(v5);
    if (v10) {
      goto LABEL_18;
    }
LABEL_20:
    xpc_object_t v12 = xpc_null_create();
    goto LABEL_21;
  }
  size_t count = 0;
  if (!v10) {
    goto LABEL_20;
  }
LABEL_18:
  xpc_retain(v10);
  xpc_object_t v12 = v10;
LABEL_21:
  xpc_release(v10);
  uint64_t v13 = v59;
  if (v59 != count || object != v12)
  {
    size_t v55 = a2;
    long long v15 = (const char *)*MEMORY[0x1E4F4C8C0];
    v16 = (const char *)*MEMORY[0x1E4F4C798];
    size_t v17 = (const char *)*MEMORY[0x1E4F4C538];
    while (1)
    {
      xpc_object_t xdict = (xpc_object_t)0xAAAAAAAAAAAAAAAALL;
      *(void *)__dst = &object;
      *(void *)&__dst[8] = v13;
      xpc::array::object_proxy::operator xpc::dict((uint64_t)__dst, &xdict);
      if (MEMORY[0x1C8795EB0](xdict) == MEMORY[0x1E4F14590]
        && xpc_dictionary_get_value(xdict, v15)
        && xpc_dictionary_get_value(xdict, v16)
        && xpc_dictionary_get_value(xdict, v17))
      {
        xpc_object_t v19 = *v55;
        int v20 = (*v55)[7];
        uint64_t v21 = (*v55)[6];
        if ((int)v21 >= v20)
        {
          if (v20 == v19[8])
          {
            wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::Reserve((wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase *)(v19 + 4));
            int v20 = v19[7];
          }
          v19[7] = v20 + 1;
          v23 = operator new(0x28uLL);
          void *v23 = &unk_1F210D040;
          uint64_t v30 = MEMORY[0x1E4FBA920];
          v23[1] = MEMORY[0x1E4FBA920];
          v23[2] = v30;
          v23[3] = 0;
          *((_DWORD *)v23 + 8) = 0;
          uint64_t v31 = *((void *)v19 + 2);
          uint64_t v32 = v19[6];
          v19[6] = v32 + 1;
          *(void *)(v31 + 8 * v32) = v23;
LABEL_49:
          xpc_object_t value = xpc_dictionary_get_value(xdict, v15);
          *(void *)buf = value;
          if (value) {
            xpc_retain(value);
          }
          else {
            *(void *)buf = xpc_null_create();
          }
          xpc::dyn_cast_or_default((uint64_t *)__dst, (xpc *)buf, (const object *)"", v34);
          *((_DWORD *)v23 + 8) |= 1u;
          v35 = (void **)v23[1];
          if (v35 == (void **)MEMORY[0x1E4FBA920])
          {
            v35 = (void **)operator new(0x18uLL);
            uint8_t *v35 = 0;
            v35[1] = 0;
            v35[2] = 0;
            v23[1] = v35;
            size_t v36 = __dst[23];
            if ((*((char *)v35 + 23) & 0x80000000) == 0) {
              goto LABEL_55;
            }
          }
          else
          {
            if (v35 == (void **)__dst) {
              goto LABEL_75;
            }
            size_t v36 = __dst[23];
            if ((*((char *)v35 + 23) & 0x80000000) == 0)
            {
LABEL_55:
              if ((v36 & 0x80) != 0)
              {
                std::string::__assign_no_alias<true>(v35, *(void **)__dst, *(size_t *)&__dst[8]);
              }
              else
              {
                long long v37 = *(_OWORD *)__dst;
                v35[2] = *(void **)&__dst[16];
                *(_OWORD *)v35 = v37;
              }
              goto LABEL_75;
            }
          }
          if ((v36 & 0x80u) == 0) {
            v38 = __dst;
          }
          else {
            v38 = *(unsigned char **)__dst;
          }
          if ((v36 & 0x80u) == 0) {
            size_t v39 = v36;
          }
          else {
            size_t v39 = *(void *)&__dst[8];
          }
          std::string::__assign_no_alias<false>(v35, v38, v39);
LABEL_75:
          if ((__dst[23] & 0x80000000) != 0) {
            operator delete(*(void **)__dst);
          }
          xpc_release(*(xpc_object_t *)buf);
          xpc_object_t v43 = xpc_dictionary_get_value(xdict, v16);
          *(void *)__dst = v43;
          if (v43) {
            xpc_retain(v43);
          }
          else {
            *(void *)__dst = xpc_null_create();
          }
          int v44 = xpc::dyn_cast_or_default((xpc *)__dst, 0);
          *((_DWORD *)v23 + 8) |= 2u;
          *((_DWORD *)v23 + 6) = v44;
          xpc_release(*(xpc_object_t *)__dst);
          xpc_object_t v45 = xpc_dictionary_get_value(xdict, v17);
          *(void *)buf = v45;
          if (v45) {
            xpc_retain(v45);
          }
          else {
            *(void *)buf = xpc_null_create();
          }
          xpc::dyn_cast_or_default((uint64_t *)__dst, (xpc *)buf, (const object *)"", v46);
          *((_DWORD *)v23 + 8) |= 4u;
          size_t v47 = (void **)v23[2];
          if (v47 == (void **)MEMORY[0x1E4FBA920])
          {
            size_t v47 = (void **)operator new(0x18uLL);
            *size_t v47 = 0;
            v47[1] = 0;
            v47[2] = 0;
            v23[2] = v47;
            size_t v48 = __dst[23];
            if ((*((char *)v47 + 23) & 0x80000000) == 0) {
              goto LABEL_86;
            }
          }
          else
          {
            if (v47 == (void **)__dst)
            {
LABEL_97:
              if ((__dst[23] & 0x80000000) != 0) {
                operator delete(*(void **)__dst);
              }
              xpc_release(*(xpc_object_t *)buf);
              uint64_t v8 = 1;
              goto LABEL_30;
            }
            size_t v48 = __dst[23];
            if ((*((char *)v47 + 23) & 0x80000000) == 0)
            {
LABEL_86:
              if ((v48 & 0x80) != 0)
              {
                std::string::__assign_no_alias<true>(v47, *(void **)__dst, *(size_t *)&__dst[8]);
              }
              else
              {
                long long v49 = *(_OWORD *)__dst;
                v47[2] = *(void **)&__dst[16];
                *(_OWORD *)size_t v47 = v49;
              }
              goto LABEL_97;
            }
          }
          if ((v48 & 0x80u) == 0) {
            v50 = __dst;
          }
          else {
            v50 = *(unsigned char **)__dst;
          }
          if ((v48 & 0x80u) == 0) {
            size_t v51 = v48;
          }
          else {
            size_t v51 = *(void *)&__dst[8];
          }
          std::string::__assign_no_alias<false>(v47, v50, v51);
          goto LABEL_97;
        }
        uint64_t v22 = *((void *)v19 + 2);
        v19[6] = v21 + 1;
        v23 = *(void **)(v22 + 8 * v21);
        if (v23) {
          goto LABEL_49;
        }
        v24 = *(NSObject **)(a1 + 40);
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)__dst = 0;
          _os_log_error_impl(&dword_1C59C6000, v24, OS_LOG_TYPE_ERROR, "Failed: Creating crash record", __dst, 2u);
        }
        uint64_t v8 = 0;
      }
      else
      {
        uint64_t v18 = *(NSObject **)(a1 + 40);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          long long v53 = v17;
          uint64_t v52 = a1;
          size_t v25 = v16;
          xpc_object_t v54 = v12;
          long long v26 = (char *)MEMORY[0x1C8795DE0](xdict);
          memset(__dst, 170, sizeof(__dst));
          size_t v27 = strlen(v26);
          if (v27 >= 0x7FFFFFFFFFFFFFF8) {
            std::string::__throw_length_error[abi:ne180100]();
          }
          size_t v28 = v27;
          if (v27 >= 0x17)
          {
            uint64_t v40 = (v27 & 0xFFFFFFFFFFFFFFF8) + 8;
            if ((v27 | 7) != 0x17) {
              uint64_t v40 = v27 | 7;
            }
            uint64_t v41 = v40 + 1;
            uint64_t v29 = operator new(v40 + 1);
            *(void *)&__dst[8] = v28;
            *(void *)&__dst[16] = v41 | 0x8000000000000000;
            *(void *)__dst = v29;
          }
          else
          {
            __dst[23] = v27;
            uint64_t v29 = __dst;
            if (!v27) {
              goto LABEL_69;
            }
          }
          memcpy(v29, v26, v28);
LABEL_69:
          v29[v28] = 0;
          free(v26);
          v42 = __dst;
          if (__dst[23] < 0) {
            v42 = *(unsigned char **)__dst;
          }
          *(_DWORD *)buf = 136315138;
          *(void *)&buf[4] = v42;
          _os_log_error_impl(&dword_1C59C6000, v18, OS_LOG_TYPE_ERROR, "Failed: One of elements of bb crash is missing: %s", buf, 0xCu);
          if ((__dst[23] & 0x80000000) != 0) {
            operator delete(*(void **)__dst);
          }
          uint64_t v8 = 0;
          xpc_object_t v12 = v54;
          v16 = v25;
          a1 = v52;
          size_t v17 = v53;
          goto LABEL_30;
        }
        uint64_t v8 = 0;
      }
LABEL_30:
      xpc_release(xdict);
      if (v8)
      {
        uint64_t v13 = v59 + 1;
        uint64_t v59 = v13;
        if (v13 != count || object != v12) {
          continue;
        }
      }
      goto LABEL_24;
    }
  }
  uint64_t v8 = 1;
LABEL_24:
  xpc_release(v12);
  xpc_release(object);
LABEL_25:
  xpc_release(v5);
  return v8;
}

void sub_1C5BAA00C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, xpc_object_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *__p, uint64_t a18, int a19, __int16 a20,char a21,char a22,xpc_object_t a23,xpc_object_t a24,uint64_t a25,xpc_object_t object)
{
  if (a22 < 0) {
    operator delete(__p);
  }
  xpc_release(object);
  xpc_release(a23);
  xpc_release(v27);
  xpc_release(a24);
  xpc_release(v26);
  _Unwind_Resume(a1);
}

uint64_t StatsAWD::fillMetric_sync(uint64_t a1, int **a2, void **a3)
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  xpc_object_t v5 = *a3;
  xpc_object_t xdict = v5;
  uint64_t v6 = MEMORY[0x1E4F14590];
  if (v5 && MEMORY[0x1C8795EB0](v5) == v6) {
    xpc_retain(v5);
  }
  else {
    xpc_object_t xdict = xpc_null_create();
  }
  if (MEMORY[0x1C8795EB0]() != v6)
  {
    uint64_t v7 = *(NSObject **)(a1 + 40);
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
LABEL_20:
      uint64_t v18 = 0;
      goto LABEL_21;
    }
    *(_WORD *)buf = 0;
    uint64_t v8 = "Failed: Expected data needs to be dictionary in low power stats handling";
LABEL_8:
    _os_log_error_impl(&dword_1C59C6000, v7, OS_LOG_TYPE_ERROR, v8, buf, 2u);
    goto LABEL_20;
  }
  uint64_t v9 = *MEMORY[0x1E4F4CD38];
  if (!xpc_dictionary_get_value(xdict, (const char *)*MEMORY[0x1E4F4CD38])
    || (uint64_t v10 = *MEMORY[0x1E4F4C670], !xpc_dictionary_get_value(xdict, (const char *)*MEMORY[0x1E4F4C670]))
    || (uint64_t v11 = *MEMORY[0x1E4F4CA20], !xpc_dictionary_get_value(xdict, (const char *)*MEMORY[0x1E4F4CA20]))
    || (uint64_t v12 = *MEMORY[0x1E4F4C350], !xpc_dictionary_get_value(xdict, (const char *)*MEMORY[0x1E4F4C350]))
    || (uint64_t v13 = *MEMORY[0x1E4F4C790], !xpc_dictionary_get_value(xdict, (const char *)*MEMORY[0x1E4F4C790]))
    || (uint64_t v14 = *MEMORY[0x1E4F4C8A8], !xpc_dictionary_get_value(xdict, (const char *)*MEMORY[0x1E4F4C8A8]))
    || (uint64_t v65 = *MEMORY[0x1E4F4CC40], !xpc_dictionary_get_value(xdict, (const char *)*MEMORY[0x1E4F4CC40])))
  {
    size_t v17 = *(NSObject **)(a1 + 40);
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      goto LABEL_20;
    }
    int v20 = (char *)MEMORY[0x1C8795DE0](xdict);
    memset(buf, 170, sizeof(buf));
    size_t v21 = strlen(v20);
    if (v21 >= 0x7FFFFFFFFFFFFFF8) {
      std::string::__throw_length_error[abi:ne180100]();
    }
    size_t v22 = v21;
    if (v21 >= 0x17)
    {
      uint64_t v24 = (v21 & 0xFFFFFFFFFFFFFFF8) + 8;
      if ((v21 | 7) != 0x17) {
        uint64_t v24 = v21 | 7;
      }
      uint64_t v25 = v24 + 1;
      v23 = operator new(v24 + 1);
      *(void *)&buf[8] = v22;
      *(void *)&uint8_t buf[16] = v25 | 0x8000000000000000;
      *(void *)buf = v23;
    }
    else
    {
      buf[23] = v21;
      v23 = buf;
      if (!v21) {
        goto LABEL_30;
      }
    }
    memcpy(v23, v20, v22);
LABEL_30:
    *((unsigned char *)v23 + v22) = 0;
    free(v20);
    long long v26 = buf;
    if ((buf[23] & 0x80u) != 0) {
      long long v26 = *(uint8_t **)buf;
    }
    LODWORD(v74) = 136315138;
    *(void *)((char *)&v74 + 4) = v26;
    _os_log_error_impl(&dword_1C59C6000, v17, OS_LOG_TYPE_ERROR, "Failed: One of elements of low power stats is missing: %s", (uint8_t *)&v74, 0xCu);
    if ((char)buf[23] < 0) {
      operator delete(*(void **)buf);
    }
    goto LABEL_20;
  }
  uint64_t v15 = *MEMORY[0x1E4F4C8B0];
  xpc_object_t value = xpc_dictionary_get_value(xdict, (const char *)*MEMORY[0x1E4F4C8B0]);
  if (MEMORY[0x1C8795EB0](value) != MEMORY[0x1E4F14568])
  {
    uint64_t v7 = *(NSObject **)(a1 + 40);
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      goto LABEL_20;
    }
    *(_WORD *)buf = 0;
    uint64_t v8 = "Failed: Expected data needs to be array in missed MT message handling";
    goto LABEL_8;
  }
  uint64_t v64 = v15;
  size_t v27 = *a2;
  *(void *)buf = &xdict;
  *(void *)&buf[8] = v9;
  xpc::dict::object_proxy::operator xpc::object((uint64_t)buf, &v74);
  int v28 = xpc::dyn_cast_or_default((xpc *)&v74, 0);
  v27[18] |= 4u;
  v27[5] = v28;
  xpc_release((xpc_object_t)v74);
  uint64_t v29 = *a2;
  *(void *)buf = &xdict;
  *(void *)&buf[8] = v10;
  xpc::dict::object_proxy::operator xpc::object((uint64_t)buf, &v74);
  int v30 = xpc::dyn_cast_or_default((xpc *)&v74, 0);
  v29[18] |= 8u;
  v29[6] = v30;
  xpc_release((xpc_object_t)v74);
  uint64_t v31 = *a2;
  *(void *)buf = &xdict;
  *(void *)&buf[8] = v11;
  xpc::dict::object_proxy::operator xpc::object((uint64_t)buf, &v74);
  int v32 = xpc::dyn_cast_or_default((xpc *)&v74, 0);
  v31[18] |= 0x10u;
  v31[7] = v32;
  xpc_release((xpc_object_t)v74);
  xpc_object_t v33 = *a2;
  *(void *)buf = &xdict;
  *(void *)&buf[8] = v12;
  xpc::dict::object_proxy::operator xpc::object((uint64_t)buf, &v74);
  int v34 = xpc::dyn_cast_or_default((xpc *)&v74, 0);
  v33[18] |= 0x20u;
  v33[8] = v34;
  xpc_release((xpc_object_t)v74);
  v35 = *a2;
  *(void *)buf = &xdict;
  *(void *)&buf[8] = v13;
  xpc::dict::object_proxy::operator xpc::object((uint64_t)buf, &v74);
  int v36 = xpc::dyn_cast_or_default((xpc *)&v74, 0);
  v35[18] |= 0x40u;
  v35[9] = v36;
  xpc_release((xpc_object_t)v74);
  long long v37 = *a2;
  *(void *)buf = &xdict;
  *(void *)&buf[8] = v14;
  xpc::dict::object_proxy::operator xpc::object((uint64_t)buf, &v74);
  int v38 = xpc::dyn_cast_or_default((xpc *)&v74, 0);
  v37[18] |= 0x80u;
  v37[16] = v38;
  xpc_release((xpc_object_t)v74);
  xpc_object_t xarray = (xpc_object_t)0xAAAAAAAAAAAAAAAALL;
  *(void *)buf = &xdict;
  *(void *)&buf[8] = v64;
  xpc::dict::object_proxy::operator xpc::array((uint64_t)buf, &xarray);
  xpc::array::array((xpc_object_t *)buf, xarray);
  xpc::array::iterator::iterator((xpc_object_t *)&v74, *(xpc_object_t *)buf, 0);
  xpc_release(*(xpc_object_t *)buf);
  xpc::array::array((xpc_object_t *)buf, xarray);
  if (MEMORY[0x1C8795EB0](xarray) == MEMORY[0x1E4F14568]) {
    size_t count = (void *)xpc_array_get_count(xarray);
  }
  else {
    size_t count = 0;
  }
  xpc::array::iterator::iterator(&v67, *(xpc_object_t *)buf, count);
  xpc_release(*(xpc_object_t *)buf);
  uint64_t v40 = (const char *)*MEMORY[0x1E4F4CA18];
  uint64_t v41 = (const char *)*MEMORY[0x1E4F4C8B8];
  v42 = (const char *)*MEMORY[0x1E4F4C348];
  xpc_object_t v43 = (const char *)*MEMORY[0x1E4F4C340];
  uint64_t v44 = *((void *)&v74 + 1);
  if (*((void *)&v74 + 1) == v68)
  {
LABEL_38:
    if ((xpc_object_t)v74 != v67) {
      goto LABEL_39;
    }
    xpc_release((xpc_object_t)v74);
    xpc_release((xpc_object_t)v74);
    uint64_t v61 = *a2;
    *(void *)buf = &xdict;
    *(void *)&buf[8] = v65;
    xpc::dict::object_proxy::operator xpc::object((uint64_t)buf, &v74);
    int v62 = xpc::dyn_cast_or_default((xpc *)&v74, 0);
    v61[18] |= 2u;
    v61[4] = v62;
    xpc_release((xpc_object_t)v74);
    uint64_t v18 = 1;
  }
  else
  {
LABEL_39:
    while (1)
    {
      xpc_object_t object = (xpc_object_t)0xAAAAAAAAAAAAAAAALL;
      *(void *)buf = &v74;
      *(void *)&buf[8] = v44;
      xpc::array::object_proxy::operator xpc::dict((uint64_t)buf, &object);
      if (MEMORY[0x1C8795EB0](object) != v6
        || !xpc_dictionary_get_value(object, v40)
        || !xpc_dictionary_get_value(object, v41)
        || !xpc_dictionary_get_value(object, v42)
        || !xpc_dictionary_get_value(object, v43))
      {
        break;
      }
      xpc_object_t v45 = *a2;
      int v46 = (*a2)[13];
      uint64_t v47 = (*a2)[12];
      if ((int)v47 >= v46)
      {
        if (v46 == v45[14])
        {
          wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::Reserve((wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase *)(v45 + 10));
          int v46 = v45[13];
        }
        v45[13] = v46 + 1;
        long long v49 = operator new(0x20uLL);
        *long long v49 = &unk_1F21118B0;
        v49[1] = 0;
        v49[2] = 0;
        v49[3] = 0;
        uint64_t v50 = *((void *)v45 + 5);
        uint64_t v51 = v45[12];
        v45[12] = v51 + 1;
        *(void *)(v50 + 8 * v51) = v49;
      }
      else
      {
        uint64_t v48 = *((void *)v45 + 5);
        v45[12] = v47 + 1;
        long long v49 = *(void **)(v48 + 8 * v47);
      }
      xpc_object_t v52 = xpc_dictionary_get_value(object, v40);
      *(void *)buf = v52;
      if (v52) {
        xpc_retain(v52);
      }
      else {
        *(void *)buf = xpc_null_create();
      }
      int v53 = xpc::dyn_cast_or_default((xpc *)buf, 0);
      *((_DWORD *)v49 + 7) |= 1u;
      *((_DWORD *)v49 + 2) = v53;
      xpc_release(*(xpc_object_t *)buf);
      xpc_object_t v54 = xpc_dictionary_get_value(object, v41);
      *(void *)buf = v54;
      if (v54) {
        xpc_retain(v54);
      }
      else {
        *(void *)buf = xpc_null_create();
      }
      int v55 = xpc::dyn_cast_or_default((xpc *)buf, 0);
      *((_DWORD *)v49 + 7) |= 2u;
      *((_DWORD *)v49 + 3) = v55;
      xpc_release(*(xpc_object_t *)buf);
      xpc_object_t v56 = xpc_dictionary_get_value(object, v42);
      *(void *)buf = v56;
      if (v56) {
        xpc_retain(v56);
      }
      else {
        *(void *)buf = xpc_null_create();
      }
      int v57 = xpc::dyn_cast_or_default((xpc *)buf, 0);
      *((_DWORD *)v49 + 7) |= 4u;
      *((_DWORD *)v49 + 4) = v57;
      xpc_release(*(xpc_object_t *)buf);
      xpc_object_t v58 = xpc_dictionary_get_value(object, v43);
      *(void *)buf = v58;
      if (v58) {
        xpc_retain(v58);
      }
      else {
        *(void *)buf = xpc_null_create();
      }
      int v59 = xpc::dyn_cast_or_default((xpc *)buf, 0);
      *((_DWORD *)v49 + 7) |= 8u;
      *((_DWORD *)v49 + 5) = v59;
      xpc_release(*(xpc_object_t *)buf);
      xpc_release(object);
      uint64_t v44 = *((void *)&v74 + 1) + 1;
      *((void *)&v74 + 1) = v44;
      if (v44 == v68) {
        goto LABEL_38;
      }
    }
    size_t v60 = *(NSObject **)(a1 + 40);
    if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
    {
      xpc::dict::to_debug_string((xpc::dict *)&object, buf);
      size_t v63 = (buf[23] & 0x80u) == 0 ? buf : *(uint8_t **)buf;
      *(_DWORD *)long long v72 = 136315138;
      v73 = v63;
      _os_log_error_impl(&dword_1C59C6000, v60, OS_LOG_TYPE_ERROR, "Failed: One of elements of missed MT message is missing: %s", v72, 0xCu);
      if ((char)buf[23] < 0) {
        operator delete(*(void **)buf);
      }
    }
    xpc_release(object);
    xpc_release(v67);
    xpc_release((xpc_object_t)v74);
    uint64_t v18 = 0;
  }
  xpc_release(xarray);
LABEL_21:
  xpc_release(xdict);
  return v18;
}

void sub_1C5BAAA4C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, xpc_object_t a11, xpc_object_t a12, uint64_t a13, xpc_object_t a14, xpc_object_t a15, uint64_t a16, uint64_t a17, xpc_object_t a18, uint64_t a19, uint64_t a20,xpc_object_t object)
{
  if (!a2) {
    _Unwind_Resume(exception_object);
  }
  __clang_call_terminate(exception_object);
}

void sub_1C5BAB068(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, xpc_object_t object)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  xpc_release(object);
  xpc_release(v16);
  _Unwind_Resume(a1);
}

void sub_1C5BAB468(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, xpc_object_t object)
{
  if (!a2) {
    _Unwind_Resume(exception_object);
  }
  __clang_call_terminate(exception_object);
}

void sub_1C5BAB920(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, xpc_object_t object)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  xpc_release(object);
  xpc_release(v16);
  _Unwind_Resume(a1);
}

void sub_1C5BABCAC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, xpc_object_t object)
{
  if (!a2) {
    _Unwind_Resume(exception_object);
  }
  __clang_call_terminate(exception_object);
}

BOOL StatsAWD::fillMetric_sync(uint64_t a1, uint64_t *a2, xpc_object_t *a3)
{
  uint64_t v87 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = MEMORY[0x1C8795EB0](*a3);
  uint64_t v7 = MEMORY[0x1E4F14590];
  if (v6 == MEMORY[0x1E4F14590])
  {
    memset(v76, 170, 24);
    xpc_object_t value = xpc_dictionary_get_value(*a3, (const char *)*MEMORY[0x1E4F4C8F0]);
    object[0] = value;
    if (value) {
      xpc_retain(value);
    }
    else {
      object[0] = xpc_null_create();
    }
    xpc::dyn_cast_or_default((uint64_t *)&buf, (xpc *)object, (const object *)"no-reset-reason", v10);
    uint64_t v11 = std::string::insert(&buf, 0, "modem reset: ", 0xDuLL);
    long long v12 = *(_OWORD *)&v11->__r_.__value_.__l.__data_;
    v76[2] = (void *)v11->__r_.__value_.__r.__words[2];
    *(_OWORD *)xpc_object_t v76 = v12;
    v11->__r_.__value_.__l.__size_ = 0;
    v11->__r_.__value_.__r.__words[2] = 0;
    v11->__r_.__value_.__r.__words[0] = 0;
    if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(buf.__r_.__value_.__l.__data_);
    }
    xpc_release(object[0]);
    xpc_object_t v13 = xpc_dictionary_get_value(*a3, (const char *)*MEMORY[0x1E4F4C8E8]);
    buf.__r_.__value_.__r.__words[0] = (std::string::size_type)v13;
    if (v13) {
      xpc_retain(v13);
    }
    else {
      buf.__r_.__value_.__r.__words[0] = (std::string::size_type)xpc_null_create();
    }
    int v14 = xpc::dyn_cast_or_default((xpc *)&buf, 0);
    xpc_release(buf.__r_.__value_.__l.__data_);
    xpc_object_t v15 = xpc_dictionary_get_value(*a3, (const char *)*MEMORY[0x1E4F4C1B0]);
    buf.__r_.__value_.__r.__words[0] = (std::string::size_type)v15;
    if (v15) {
      xpc_retain(v15);
    }
    else {
      buf.__r_.__value_.__r.__words[0] = (std::string::size_type)xpc_null_create();
    }
    int v16 = xpc::dyn_cast_or_default((xpc *)&buf, 0);
    xpc_release(buf.__r_.__value_.__l.__data_);
    xpc_object_t v17 = xpc_dictionary_get_value(*a3, (const char *)*MEMORY[0x1E4F4D2E0]);
    buf.__r_.__value_.__r.__words[0] = (std::string::size_type)v17;
    if (v17) {
      xpc_retain(v17);
    }
    else {
      buf.__r_.__value_.__r.__words[0] = (std::string::size_type)xpc_null_create();
    }
    int v18 = xpc::dyn_cast_or_default((xpc *)&buf, (const object *)0xB);
    xpc_release(buf.__r_.__value_.__l.__data_);
    xpc_object_t v19 = xpc_dictionary_get_value(*a3, (const char *)*MEMORY[0x1E4F4D2E8]);
    buf.__r_.__value_.__r.__words[0] = (std::string::size_type)v19;
    if (v19) {
      xpc_retain(v19);
    }
    else {
      buf.__r_.__value_.__r.__words[0] = (std::string::size_type)xpc_null_create();
    }
    int v20 = xpc::dyn_cast_or_default((xpc *)&buf, (const object *)0xB);
    xpc_release(buf.__r_.__value_.__l.__data_);
    memset(object, 170, sizeof(object));
    xpc_object_t v21 = xpc_dictionary_get_value(*a3, (const char *)*MEMORY[0x1E4F4D320]);
    buf.__r_.__value_.__r.__words[0] = (std::string::size_type)v21;
    if (v21) {
      xpc_retain(v21);
    }
    else {
      buf.__r_.__value_.__r.__words[0] = (std::string::size_type)xpc_null_create();
    }
    xpc::dyn_cast_or_default((uint64_t *)object, (xpc *)&buf, (const object *)"", v22);
    xpc_release(buf.__r_.__value_.__l.__data_);
    memset(v74, 170, sizeof(v74));
    xpc_object_t v23 = xpc_dictionary_get_value(*a3, (const char *)*MEMORY[0x1E4F4D328]);
    buf.__r_.__value_.__r.__words[0] = (std::string::size_type)v23;
    if (v23) {
      xpc_retain(v23);
    }
    else {
      buf.__r_.__value_.__r.__words[0] = (std::string::size_type)xpc_null_create();
    }
    xpc::dyn_cast_or_default((uint64_t *)v74, (xpc *)&buf, (const object *)"", v24);
    xpc_release(buf.__r_.__value_.__l.__data_);
    memset(v73, 170, sizeof(v73));
    xpc_object_t v25 = xpc_dictionary_get_value(*a3, (const char *)*MEMORY[0x1E4F4D2D8]);
    buf.__r_.__value_.__r.__words[0] = (std::string::size_type)v25;
    if (v25) {
      xpc_retain(v25);
    }
    else {
      buf.__r_.__value_.__r.__words[0] = (std::string::size_type)xpc_null_create();
    }
    xpc::dyn_cast_or_default((uint64_t *)v73, (xpc *)&buf, (const object *)"", v26);
    xpc_release(buf.__r_.__value_.__l.__data_);
    xpc_object_t v27 = xpc_dictionary_get_value(*a3, (const char *)*MEMORY[0x1E4F4C150]);
    buf.__r_.__value_.__r.__words[0] = (std::string::size_type)v27;
    if (v27) {
      xpc_retain(v27);
    }
    else {
      buf.__r_.__value_.__r.__words[0] = (std::string::size_type)xpc_null_create();
    }
    int v28 = xpc::dyn_cast_or_default((xpc *)&buf, (const object *)8);
    xpc_release(buf.__r_.__value_.__l.__data_);
    uint64_t v29 = *(NSObject **)(a1 + 40);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      v70 = a2;
      uint64_t v30 = v6;
      int v31 = v20;
      int v32 = v14;
      int v33 = SHIBYTE(v76[2]);
      int v34 = (void **)v76[0];
      abm::asString();
      v35 = v76;
      p_p = __p;
      long long v37 = "NO";
      if (v33 < 0) {
        v35 = v34;
      }
      if (v16) {
        int v38 = "YES";
      }
      else {
        int v38 = "NO";
      }
      LOBYTE(v14) = v32;
      if (v32) {
        long long v37 = "YES";
      }
      size_t v39 = (void **)v74[0];
      if (v72 >= 0) {
        p_p = &__p;
      }
      uint64_t v40 = object;
      if (SHIBYTE(object[2]) < 0) {
        uint64_t v40 = (xpc_object_t *)object[0];
      }
      uint64_t v41 = (void **)v73[0];
      LODWORD(buf.__r_.__value_.__l.__data_) = 136316674;
      if (SHIBYTE(v74[2]) >= 0) {
        size_t v39 = v74;
      }
      *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = (std::string::size_type)v35;
      WORD2(buf.__r_.__value_.__r.__words[1]) = 2080;
      if (SHIBYTE(v73[2]) >= 0) {
        uint64_t v41 = v73;
      }
      *(std::string::size_type *)((char *)&buf.__r_.__value_.__r.__words[1] + 6) = (std::string::size_type)v37;
      HIWORD(buf.__r_.__value_.__r.__words[2]) = 2080;
      uint64_t v78 = v38;
      __int16 v79 = 2080;
      int v80 = p_p;
      __int16 v81 = 2080;
      xpc_object_t v82 = v40;
      __int16 v83 = 2080;
      v84 = v39;
      __int16 v85 = 2080;
      v86 = v41;
      _os_log_impl(&dword_1C59C6000, v29, OS_LOG_TYPE_DEFAULT, "#I CCBasebandReset Metric Submission: Baseband Reset Reason: %s, Is MTBF: %s, Was In Voice Call: %s, RAT: %s, PLMN1: %s, PLMN2: %s, SKU: %s", (uint8_t *)&buf, 0x48u);
      if (v72 < 0) {
        operator delete(__p);
      }
      uint64_t v7 = MEMORY[0x1E4F14590];
      int v20 = v31;
      uint64_t v6 = v30;
      a2 = v70;
    }
    uint64_t v42 = *a2;
    *(_DWORD *)(v42 + 68) = *(_DWORD *)(*a2 + 68) | 1;
    xpc_object_t v43 = *(void ***)(v42 + 8);
    uint64_t v44 = (xpc_object_t *)MEMORY[0x1E4FBA920];
    if (v43 == (void **)MEMORY[0x1E4FBA920])
    {
      xpc_object_t v43 = (void **)operator new(0x18uLL);
      const char *v43 = 0;
      v43[1] = 0;
      v43[2] = 0;
      *(void *)(v42 + 8) = v43;
      xpc_object_t v45 = (void *)HIBYTE(v76[2]);
      if ((*((char *)v43 + 23) & 0x80000000) == 0)
      {
LABEL_55:
        if ((v45 & 0x80) != 0)
        {
          std::string::__assign_no_alias<true>(v43, v76[0], (size_t)v76[1]);
        }
        else
        {
          long long v46 = *(_OWORD *)v76;
          v43[2] = v76[2];
          *(_OWORD *)xpc_object_t v43 = v46;
        }
        goto LABEL_66;
      }
    }
    else
    {
      if (v43 == v76) {
        goto LABEL_66;
      }
      xpc_object_t v45 = (void *)HIBYTE(v76[2]);
      if ((*((char *)v43 + 23) & 0x80000000) == 0) {
        goto LABEL_55;
      }
    }
    if ((char)v45 >= 0) {
      uint64_t v47 = v76;
    }
    else {
      uint64_t v47 = (void **)v76[0];
    }
    if ((char)v45 >= 0) {
      uint64_t v48 = v45;
    }
    else {
      uint64_t v48 = v76[1];
    }
    std::string::__assign_no_alias<false>(v43, v47, (size_t)v48);
LABEL_66:
    uint64_t v49 = *a2;
    int v50 = *(_DWORD *)(*a2 + 68);
    *(unsigned char *)(v49 + 41) = v14;
    *(unsigned char *)(v49 + 40) = v16;
    *(_DWORD *)(v49 + 16) = v18;
    *(_DWORD *)(v49 + 20) = v20;
    *(_DWORD *)(v49 + 68) = v50 | 0x21E;
    uint64_t v51 = *(xpc_object_t **)(v49 + 24);
    if (v51 == v44)
    {
      uint64_t v51 = (xpc_object_t *)operator new(0x18uLL);
      xpc_object_t *v51 = 0;
      v51[1] = 0;
      v51[2] = 0;
      *(void *)(v49 + 24) = v51;
      xpc_object_t v52 = (void *)HIBYTE(object[2]);
      if ((*((char *)v51 + 23) & 0x80000000) == 0)
      {
LABEL_69:
        if ((v52 & 0x80) != 0)
        {
          std::string::__assign_no_alias<true>(v51, object[0], (size_t)object[1]);
        }
        else
        {
          long long v53 = *(_OWORD *)object;
          v51[2] = object[2];
          *(_OWORD *)uint64_t v51 = v53;
        }
        goto LABEL_80;
      }
    }
    else
    {
      if (v51 == object) {
        goto LABEL_80;
      }
      xpc_object_t v52 = (void *)HIBYTE(object[2]);
      if ((*((char *)v51 + 23) & 0x80000000) == 0) {
        goto LABEL_69;
      }
    }
    if ((char)v52 >= 0) {
      xpc_object_t v54 = object;
    }
    else {
      xpc_object_t v54 = (xpc_object_t *)object[0];
    }
    if ((char)v52 >= 0) {
      xpc_object_t v55 = v52;
    }
    else {
      xpc_object_t v55 = object[1];
    }
    std::string::__assign_no_alias<false>(v51, v54, (size_t)v55);
LABEL_80:
    uint64_t v56 = *a2;
    *(_DWORD *)(v56 + 68) = *(_DWORD *)(*a2 + 68) | 0x20;
    int v57 = *(void ***)(v56 + 32);
    if (v57 == v44)
    {
      int v57 = (void **)operator new(0x18uLL);
      *int v57 = 0;
      v57[1] = 0;
      v57[2] = 0;
      *(void *)(v56 + 32) = v57;
      xpc_object_t v58 = (void *)HIBYTE(v74[2]);
      if ((*((char *)v57 + 23) & 0x80000000) == 0)
      {
LABEL_83:
        if ((v58 & 0x80) != 0)
        {
          std::string::__assign_no_alias<true>(v57, v74[0], (size_t)v74[1]);
        }
        else
        {
          long long v59 = *(_OWORD *)v74;
          v57[2] = v74[2];
          *(_OWORD *)int v57 = v59;
        }
        goto LABEL_94;
      }
    }
    else
    {
      if (v57 == v74) {
        goto LABEL_94;
      }
      xpc_object_t v58 = (void *)HIBYTE(v74[2]);
      if ((*((char *)v57 + 23) & 0x80000000) == 0) {
        goto LABEL_83;
      }
    }
    if ((char)v58 >= 0) {
      size_t v60 = v74;
    }
    else {
      size_t v60 = (void **)v74[0];
    }
    if ((char)v58 >= 0) {
      uint64_t v61 = v58;
    }
    else {
      uint64_t v61 = v74[1];
    }
    std::string::__assign_no_alias<false>(v57, v60, (size_t)v61);
LABEL_94:
    uint64_t v62 = *a2;
    *(_DWORD *)(v62 + 68) = *(_DWORD *)(*a2 + 68) | 0x40;
    size_t v63 = *(void ***)(v62 + 48);
    if (v63 == v44)
    {
      size_t v63 = (void **)operator new(0x18uLL);
      *size_t v63 = 0;
      v63[1] = 0;
      v63[2] = 0;
      *(void *)(v62 + 48) = v63;
      uint64_t v64 = (void *)HIBYTE(v73[2]);
      if ((*((char *)v63 + 23) & 0x80000000) == 0)
      {
LABEL_97:
        if ((v64 & 0x80) != 0)
        {
          std::string::__assign_no_alias<true>(v63, v73[0], (size_t)v73[1]);
        }
        else
        {
          long long v65 = *(_OWORD *)v73;
          v63[2] = v73[2];
          *(_OWORD *)size_t v63 = v65;
        }
        goto LABEL_108;
      }
    }
    else
    {
      if (v63 == v73) {
        goto LABEL_108;
      }
      uint64_t v64 = (void *)HIBYTE(v73[2]);
      if ((*((char *)v63 + 23) & 0x80000000) == 0) {
        goto LABEL_97;
      }
    }
    if ((char)v64 >= 0) {
      int v66 = v73;
    }
    else {
      int v66 = (void **)v73[0];
    }
    if ((char)v64 >= 0) {
      xpc_object_t v67 = v64;
    }
    else {
      xpc_object_t v67 = v73[1];
    }
    std::string::__assign_no_alias<false>(v63, v66, (size_t)v67);
LABEL_108:
    uint64_t v68 = *a2;
    *(_DWORD *)(v68 + 68) = *(_DWORD *)(*a2 + 68) | 0x80;
    *(_DWORD *)(v68 + 44) = v28;
    if (SHIBYTE(v73[2]) < 0)
    {
      operator delete(v73[0]);
      if ((SHIBYTE(v74[2]) & 0x80000000) == 0)
      {
LABEL_110:
        if ((SHIBYTE(object[2]) & 0x80000000) == 0) {
          goto LABEL_111;
        }
        goto LABEL_115;
      }
    }
    else if ((SHIBYTE(v74[2]) & 0x80000000) == 0)
    {
      goto LABEL_110;
    }
    operator delete(v74[0]);
    if ((SHIBYTE(object[2]) & 0x80000000) == 0)
    {
LABEL_111:
      if ((SHIBYTE(v76[2]) & 0x80000000) == 0) {
        return v6 == v7;
      }
LABEL_116:
      operator delete(v76[0]);
      return v6 == v7;
    }
LABEL_115:
    operator delete(object[0]);
    if ((SHIBYTE(v76[2]) & 0x80000000) == 0) {
      return v6 == v7;
    }
    goto LABEL_116;
  }
  uint64_t v8 = *(NSObject **)(a1 + 40);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    LOWORD(buf.__r_.__value_.__l.__data_) = 0;
    _os_log_error_impl(&dword_1C59C6000, v8, OS_LOG_TYPE_ERROR, "Failed to get the metric information for CCBasebandReset", (uint8_t *)&buf, 2u);
  }
  return v6 == v7;
}

void sub_1C5BAC50C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *__p, uint64_t a15, int a16, __int16 a17, char a18, char a19, void *a20,uint64_t a21,int a22,__int16 a23,char a24,char a25,xpc_object_t a26,uint64_t a27,int a28,__int16 a29,char a30,char a31,void *a32,uint64_t a33,int a34,__int16 a35,char a36,char a37,uint64_t a38,xpc_object_t object,uint64_t a40,int a41,__int16 a42,char a43,char a44)
{
  if (a19 < 0) {
    operator delete(__p);
  }
  if (a25 < 0) {
    operator delete(a20);
  }
  if (a31 < 0) {
    operator delete(a26);
  }
  if (a37 < 0) {
    operator delete(a32);
  }
  _Unwind_Resume(exception_object);
}

uint64_t ctu::Loggable<StatsAWD,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::updateTrackedConfig(uint64_t a1)
{
  return MEMORY[0x1F417DA50](a1 + 8);
}

void ctu::Loggable<StatsAWD,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::getTrackedLoggerName(char *a1@<X8>)
{
  a1[23] = 9;
  strcpy(a1, "stats.awd");
}

uint64_t ctu::Loggable<StatsAWD,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::getTrackedLogLevel(uint64_t a1)
{
  return MEMORY[0x1F417DD10](a1 + 8);
}

void *ctu::Loggable<StatsAWD,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::~Loggable(void *a1)
{
  *a1 = &unk_1F2111C98;
  MEMORY[0x1C87940C0](a1 + 1);
  return a1;
}

void ctu::Loggable<StatsAWD,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::~Loggable(void *a1)
{
  *a1 = &unk_1F2111C98;
  MEMORY[0x1C87940C0](a1 + 1);

  operator delete(a1);
}

xpc_object_t *xpc::array::array(xpc_object_t *a1, xpc_object_t object)
{
  *a1 = object;
  if (object) {
    xpc_retain(object);
  }
  else {
    *a1 = xpc_null_create();
  }
  return a1;
}

xpc_object_t *xpc::array::iterator::iterator(xpc_object_t *a1, xpc_object_t object, void *a3)
{
  *a1 = object;
  if (object) {
    xpc_retain(object);
  }
  else {
    *a1 = xpc_null_create();
  }
  a1[1] = a3;
  return a1;
}

void ctu::Loggable<StatsAWD,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::connectToLogServer_sync(uint64_t a1)
{
  uint64_t v1 = a1 + 56;
  if (*(void *)(a1 + 56))
  {
    if (!*(void *)(a1 + 80) || (v2 = std::__shared_weak_count::lock(*(std::__shared_weak_count **)(a1 + 80))) == 0) {
      std::__throw_bad_weak_ptr[abi:ne180100]();
    }
    v3 = v2;
    ctu::LoggerCommonBase::getLogDomain((ctu::LoggerCommonBase *)(v1 - 48));
    ctu::TrackedLogger::registerLoggerToServer();
    if (!atomic_fetch_add(&v3->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
      std::__shared_weak_count::__release_weak(v3);
    }
  }
}

void sub_1C5BAC950(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, char a11)
{
}

void sub_1C5BAC96C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  std::shared_ptr<Registry>::~shared_ptr[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

void *std::shared_ptr<StatsAWD>::shared_ptr[abi:ne180100]<StatsAWD,std::shared_ptr<StatsAWD> ctu::SharedSynchronizable<StatsAWD>::make_shared_ptr<StatsAWD>(StatsAWD*)::{lambda(StatsAWD*)#1},void>(void *a1, uint64_t a2)
{
  *a1 = a2;
  v4 = (std::__shared_weak_count *)operator new(0x20uLL);
  v4->__shared_owners_ = 0;
  p_shared_owners = &v4->__shared_owners_;
  v4->__vftable = (std::__shared_weak_count_vtbl *)&unk_1F2111CD8;
  v4->__shared_weak_owners_ = 0;
  v4[1].__vftable = (std::__shared_weak_count_vtbl *)a2;
  a1[1] = v4;
  if (!a2) {
    return a1;
  }
  uint64_t v6 = *(std::__shared_weak_count **)(a2 + 80);
  if (v6)
  {
    if (v6->__shared_owners_ == -1)
    {
      atomic_fetch_add_explicit(&v4->__shared_owners_, 1uLL, memory_order_relaxed);
      atomic_fetch_add_explicit(&v4->__shared_weak_owners_, 1uLL, memory_order_relaxed);
      *(void *)(a2 + 72) = a2;
      *(void *)(a2 + 80) = v4;
      std::__shared_weak_count::__release_weak(v6);
      if (!atomic_fetch_add(p_shared_owners, 0xFFFFFFFFFFFFFFFFLL)) {
        goto LABEL_8;
      }
    }
    return a1;
  }
  atomic_fetch_add_explicit(&v4->__shared_owners_, 1uLL, memory_order_relaxed);
  atomic_fetch_add_explicit(&v4->__shared_weak_owners_, 1uLL, memory_order_relaxed);
  *(void *)(a2 + 72) = a2;
  *(void *)(a2 + 80) = v4;
  if (atomic_fetch_add(p_shared_owners, 0xFFFFFFFFFFFFFFFFLL)) {
    return a1;
  }
LABEL_8:
  ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
  std::__shared_weak_count::__release_weak(v4);
  return a1;
}

void sub_1C5BACA98(void *a1)
{
  __cxa_begin_catch(a1);
  dispatch_barrier_async_f(v1[11], v1, (dispatch_function_t)std::shared_ptr<StatsAWD> ctu::SharedSynchronizable<StatsAWD>::make_shared_ptr<StatsAWD>(StatsAWD*)::{lambda(StatsAWD*)#1}::operator() const(StatsAWD*)::{lambda(void *)#1}::__invoke);
  __cxa_rethrow();
}

void sub_1C5BACAC0(_Unwind_Exception *a1)
{
}

void std::__shared_ptr_pointer<StatsAWD *,std::shared_ptr<StatsAWD> ctu::SharedSynchronizable<StatsAWD>::make_shared_ptr<StatsAWD>(StatsAWD*)::{lambda(StatsAWD *)#1},std::allocator<StatsAWD>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);

  operator delete(v1);
}

void std::__shared_ptr_pointer<StatsAWD *,std::shared_ptr<StatsAWD> ctu::SharedSynchronizable<StatsAWD>::make_shared_ptr<StatsAWD>(StatsAWD*)::{lambda(StatsAWD *)#1},std::allocator<StatsAWD>>::__on_zero_shared(uint64_t a1)
{
}

uint64_t std::__shared_ptr_pointer<StatsAWD *,std::shared_ptr<StatsAWD> ctu::SharedSynchronizable<StatsAWD>::make_shared_ptr<StatsAWD>(StatsAWD*)::{lambda(StatsAWD *)#1},std::allocator<StatsAWD>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = *(void *)(a2 + 8);
  if ((char *)v3 == "ZN3ctu20SharedSynchronizableI8StatsAWDE15make_shared_ptrIS1_EENSt3__110shared_ptrIT_EEPS6_EUlPS1_E_") {
    return a1 + 24;
  }
  if (((v3 & (unint64_t)"ZN3ctu20SharedSynchronizableI8StatsAWDE15make_shared_ptrIS1_EENSt3__110shared_ptrIT_EEPS6_EUlPS1_E_" & 0x8000000000000000) != 0) == __OFSUB__(v3, "ZN3ctu20SharedSynchronizableI8StatsAWDE15make_shared_ptrIS1_EENSt3__110shared_ptrIT_EEPS6_EUlPS1_E_"))return 0; {
  if (!strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)((unint64_t)"ZN3ctu20SharedSynchronizableI8StatsAWDE15make_shared_ptrIS1_EENSt3__110shared_ptrIT_EEPS6_EUlPS1_E_" & 0x7FFFFFFFFFFFFFFFLL)))return a1 + 24;
  }
  return 0;
}

uint64_t std::shared_ptr<StatsAWD> ctu::SharedSynchronizable<StatsAWD>::make_shared_ptr<StatsAWD>(StatsAWD*)::{lambda(StatsAWD*)#1}::operator() const(StatsAWD*)::{lambda(void *)#1}::__invoke(uint64_t result)
{
  if (result) {
    return (*(uint64_t (**)(void))(*(void *)result + 8))();
  }
  return result;
}

void *ctu::SharedLoggable<StatsAWD,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::~SharedLoggable(void *a1)
{
  *a1 = &unk_1F2111C98;
  MEMORY[0x1C87940C0](a1 + 1);
  v2 = a1[12];
  if (v2) {
    dispatch_release(v2);
  }
  unint64_t v3 = a1[11];
  if (v3) {
    dispatch_release(v3);
  }
  v4 = (std::__shared_weak_count *)a1[10];
  if (v4) {
    std::__shared_weak_count::__release_weak(v4);
  }
  return a1;
}

void ctu::SharedLoggable<StatsAWD,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::~SharedLoggable(void *a1)
{
  *a1 = &unk_1F2111C98;
  MEMORY[0x1C87940C0](a1 + 1);
  v2 = a1[12];
  if (v2) {
    dispatch_release(v2);
  }
  unint64_t v3 = a1[11];
  if (v3) {
    dispatch_release(v3);
  }
  v4 = (std::__shared_weak_count *)a1[10];
  if (v4) {
    std::__shared_weak_count::__release_weak(v4);
  }

  operator delete(a1);
}

void dispatch::async<void ctu::SharedSynchronizable<StatsAWD>::execute_wrapped<StatsAWD::submit(unsigned int,xpc::object)::$_0>(StatsAWD::submit(unsigned int,xpc::object)::$_0 &&)::{lambda(void)#1}>(dispatch_queue_s *,std::unique_ptr<StatsAWD::submit(unsigned int,xpc::object)::$_0,dispatch_queue_s *::default_delete<StatsAWD::submit(unsigned int,xpc::object)::$_0>>)::{lambda(void *)#1}::__invoke(void *a1)
{
  v2 = *(uint64_t **)a1;
  uint64_t v3 = **(void **)a1;
  if (*(void *)(v3 + 104))
  {
    int v4 = *((_DWORD *)v2 + 2);
    xpc_object_t v5 = (void *)v2[2];
    xpc_object_t object = v5;
    if (v5) {
      xpc_retain(v5);
    }
    else {
      xpc_object_t object = xpc_null_create();
    }
    StatsAWD::submit_sync(v3, v4, &object);
    xpc_release(object);
  }
  else
  {
    uint64_t v6 = *(NSObject **)(v3 + 40);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)std::string buf = 0;
      _os_log_error_impl(&dword_1C59C6000, v6, OS_LOG_TYPE_ERROR, "Failed: AWD connection setup failed", buf, 2u);
    }
  }
  xpc_release((xpc_object_t)v2[2]);
  operator delete(v2);
  uint64_t v7 = (std::__shared_weak_count *)*((void *)a1 + 2);
  if (v7 && !atomic_fetch_add(&v7->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
    std::__shared_weak_count::__release_weak(v7);
  }
  operator delete(a1);
}

void sub_1C5BACDB8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, xpc_object_t object)
{
  xpc_release(object);
  xpc_release(v11[2]);
  operator delete(v11);
  xpc_object_t v13 = (std::__shared_weak_count *)v10[2];
  if (v13)
  {
    if (!atomic_fetch_add(&v13->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
      std::__shared_weak_count::__release_weak(v13);
    }
  }
  operator delete(v10);
  _Unwind_Resume(a1);
}

void DataStallDetection::create(capabilities::abs *a1@<X0>, uint64_t *a2@<X8>)
{
  if (capabilities::abs::supportsRadioHealth(a1))
  {
    int v4 = operator new(0xA0uLL);
    uint64_t v5 = (uint64_t)v4;
    uint64_t v6 = (std::__shared_weak_count *)*((void *)a1 + 1);
    uint64_t v8 = *(void *)a1;
    uint64_t v9 = v6;
    if (v6) {
      atomic_fetch_add_explicit(&v6->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    DataStallDetection::DataStallDetection((uint64_t)v4, &v8);
    *a2 = 0xAAAAAAAAAAAAAAAALL;
    a2[1] = 0xAAAAAAAAAAAAAAAALL;
    std::shared_ptr<DataStallDetection>::shared_ptr[abi:ne180100]<DataStallDetection,std::shared_ptr<DataStallDetection> ctu::SharedSynchronizable<DataStallDetection>::make_shared_ptr<DataStallDetection>(DataStallDetection*)::{lambda(DataStallDetection*)#1},void>(a2, v5);
    ctu::Loggable<DataStallDetection,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::connectToLogServer_sync(*a2);
    uint64_t v7 = v9;
    if (v9 && !atomic_fetch_add(&v9->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
    }
  }
  else
  {
    *a2 = 0;
    a2[1] = 0;
  }
}

void sub_1C5BACF44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::shared_ptr<Registry>::~shared_ptr[abi:ne180100](v9);
  std::shared_ptr<ctu::LogServer>::~shared_ptr[abi:ne180100]((uint64_t)&a9);
  _Unwind_Resume(a1);
}

void sub_1C5BACF60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_1C5BACF74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::shared_ptr<ctu::LogServer>::~shared_ptr[abi:ne180100]((uint64_t)&a9);
  operator delete(v9);
  _Unwind_Resume(a1);
}

uint64_t DataStallDetection::DataStallDetection(uint64_t a1, void *a2)
{
  *(void *)a1 = &unk_1F2111D68;
  ctu::OsLogContext::OsLogContext((ctu::OsLogContext *)v24, "com.apple.telephony.abm", "net.stall");
  initially_inactive = dispatch_queue_attr_make_initially_inactive(0);
  uint64_t v5 = dispatch_queue_create_with_target_V2("net.stall", initially_inactive, 0);
  dispatch_set_qos_class_floor(v5, QOS_CLASS_DEFAULT, 0);
  dispatch_activate(v5);
  *(void *)(a1 + 72) = 0;
  *(void *)(a1 + 80) = 0;
  *(void *)(a1 + 88) = v5;
  if (v5)
  {
    dispatch_retain(v5);
    *(void *)(a1 + 96) = 0;
    dispatch_release(v5);
  }
  else
  {
    *(void *)(a1 + 96) = 0;
  }
  *(void *)a1 = &unk_1F2111EB8;
  ctu::OsLogContext::OsLogContext();
  ctu::OsLogContext::OsLogContext();
  ctu::LoggerCommonBase::LoggerCommonBase();
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)&v26);
  *(void *)(a1 + 8) = &unk_1F2102CB8;
  *(void *)(a1 + 56) = *a2;
  uint64_t v6 = a2[1];
  *(void *)(a1 + 64) = v6;
  if (v6) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v6 + 8), 1uLL, memory_order_relaxed);
  }
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)v25);
  *(void *)a1 = &unk_1F2111F48;
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)v24);
  *(void *)a1 = &unk_1F2111D68;
  *(void *)(a1 + 104) = *a2;
  uint64_t v7 = a2[1];
  *(void *)(a1 + 112) = v7;
  if (v7) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v7 + 8), 1uLL, memory_order_relaxed);
  }
  pthread_mutex_lock(&ctu::Singleton<ABMServer,ABMServer,ctu::PthreadMutexGuardPolicy<ABMServer>>::sInstance);
  uint64_t v8 = off_1EBBDC878;
  if (!off_1EBBDC878)
  {
    ABMServer::create_default_global(&v26);
    long long v9 = v26;
    long long v26 = 0uLL;
    uint64_t v10 = (std::__shared_weak_count *)*(&off_1EBBDC878 + 1);
    off_1EBBDC878 = v9;
    if (v10 && !atomic_fetch_add(&v10->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
      std::__shared_weak_count::__release_weak(v10);
    }
    uint64_t v11 = (std::__shared_weak_count *)*((void *)&v26 + 1);
    if (*((void *)&v26 + 1)
      && !atomic_fetch_add((atomic_ullong *volatile)(*((void *)&v26 + 1) + 8), 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
      std::__shared_weak_count::__release_weak(v11);
    }
    uint64_t v8 = off_1EBBDC878;
  }
  long long v12 = (std::__shared_weak_count *)*(&off_1EBBDC878 + 1);
  if (*(&off_1EBBDC878 + 1)) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(*(&off_1EBBDC878 + 1) + 8), 1uLL, memory_order_relaxed);
  }
  pthread_mutex_unlock(&ctu::Singleton<ABMServer,ABMServer,ctu::PthreadMutexGuardPolicy<ABMServer>>::sInstance);
  uint64_t v13 = *(void *)(*(void *)v8 + 208);
  if (v12 && !atomic_fetch_add(&v12->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
    std::__shared_weak_count::__release_weak(v12);
  }
  *(void *)(a1 + 120) = v13;
  int v14 = _Block_copy(&__block_literal_global_6);
  uint64_t v15 = *(void *)(a1 + 88);
  if (v15) {
    dispatch_retain(*(dispatch_object_t *)(a1 + 88));
  }
  *(void *)(a1 + 128) = v14;
  *(void *)(a1 + 136) = v15;
  int v16 = (std::__shared_weak_count *)a2[1];
  xpc_object_t v23 = v16;
  if (v16) {
    atomic_fetch_add_explicit(&v16->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  pthread_mutex_lock(&ctu::Singleton<ABMServer,ABMServer,ctu::PthreadMutexGuardPolicy<ABMServer>>::sInstance);
  uint64_t v17 = off_1EBBDC878;
  if (!off_1EBBDC878)
  {
    ABMServer::create_default_global(&v26);
    long long v18 = v26;
    long long v26 = 0uLL;
    xpc_object_t v19 = (std::__shared_weak_count *)*(&off_1EBBDC878 + 1);
    off_1EBBDC878 = v18;
    if (v19 && !atomic_fetch_add(&v19->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
      std::__shared_weak_count::__release_weak(v19);
    }
    int v20 = (std::__shared_weak_count *)*((void *)&v26 + 1);
    if (*((void *)&v26 + 1)
      && !atomic_fetch_add((atomic_ullong *volatile)(*((void *)&v26 + 1) + 8), 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v20->__on_zero_shared)(v20);
      std::__shared_weak_count::__release_weak(v20);
    }
    uint64_t v17 = off_1EBBDC878;
  }
  xpc_object_t v21 = (std::__shared_weak_count *)*(&off_1EBBDC878 + 1);
  v25[0] = v17;
  v25[1] = *(&off_1EBBDC878 + 1);
  if (*(&off_1EBBDC878 + 1)) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(*(&off_1EBBDC878 + 1) + 8), 1uLL, memory_order_relaxed);
  }
  pthread_mutex_unlock(&ctu::Singleton<ABMServer,ABMServer,ctu::PthreadMutexGuardPolicy<ABMServer>>::sInstance);
  ctu::iokit::Controller::create();
  if (v21 && !atomic_fetch_add(&v21->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v21->__on_zero_shared)(v21);
    std::__shared_weak_count::__release_weak(v21);
  }
  if (v23 && !atomic_fetch_add(&v23->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v23->__on_zero_shared)(v23);
    std::__shared_weak_count::__release_weak(v23);
  }
  return a1;
}

void sub_1C5BAD438(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  pthread_mutex_unlock(&ctu::Singleton<ABMServer,ABMServer,ctu::PthreadMutexGuardPolicy<ABMServer>>::sInstance);
  std::shared_ptr<ctu::LogServer>::~shared_ptr[abi:ne180100]((uint64_t)&a9);
  dispatch::callback<void({block_pointer})(std::string)>::~callback((uint64_t)(v9 + 16));
  std::shared_ptr<ctu::LogServer>::~shared_ptr[abi:ne180100](v10);
  ctu::SharedLoggable<DataStallDetection,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::~SharedLoggable(v9);
  _Unwind_Resume(a1);
}

void sub_1C5BAD4D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va2, a3);
  va_start(va1, a3);
  va_start(va, a3);
  uint64_t v5 = va_arg(va1, void);
  uint64_t v7 = va_arg(va1, void);
  va_copy(va2, va1);
  uint64_t v8 = va_arg(va2, void);
  uint64_t v10 = va_arg(va2, void);
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)va2);
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)va1);
  ctu::SharedSynchronizable<data::TransportService::State>::~SharedSynchronizable(v3);
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)va);
  _Unwind_Resume(a1);
}

const char *DataStallDetection::getName(DataStallDetection *this)
{
  return "net.stall";
}

void *ctu::SharedLoggable<DataStallDetection,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::~SharedLoggable(void *a1)
{
  *a1 = &unk_1F2111EB8;
  MEMORY[0x1C87940C0](a1 + 1);
  v2 = a1[12];
  if (v2) {
    dispatch_release(v2);
  }
  uint64_t v3 = a1[11];
  if (v3) {
    dispatch_release(v3);
  }
  int v4 = (std::__shared_weak_count *)a1[10];
  if (v4) {
    std::__shared_weak_count::__release_weak(v4);
  }
  return a1;
}

{
  NSObject *v2;
  NSObject *v3;
  std::__shared_weak_count *v4;

  *a1 = &unk_1F2111EB8;
  MEMORY[0x1C87940C0](a1 + 1);
  v2 = a1[12];
  if (v2) {
    dispatch_release(v2);
  }
  uint64_t v3 = a1[11];
  if (v3) {
    dispatch_release(v3);
  }
  int v4 = (std::__shared_weak_count *)a1[10];
  if (v4) {
    std::__shared_weak_count::__release_weak(v4);
  }
  return a1;
}

void DataStallDetection::~DataStallDetection(DataStallDetection *this)
{
  *(void *)this = &unk_1F2111D68;
  v2 = (std::__shared_weak_count *)*((void *)this + 19);
  *((void *)this + 18) = 0;
  *((void *)this + 19) = 0;
  if (v2 && !atomic_fetch_add(&v2->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
    std::__shared_weak_count::__release_weak(v2);
    uint64_t v3 = (__CFRunLoop *)*((void *)this + 15);
    if (!v3) {
      goto LABEL_17;
    }
  }
  else
  {
    uint64_t v3 = (__CFRunLoop *)*((void *)this + 15);
    if (!v3) {
      goto LABEL_17;
    }
  }
  if (CFRunLoopIsWaiting(v3))
  {
    int v4 = dispatch_group_create();
    uint64_t v5 = v4;
    if (v4)
    {
      dispatch_retain(v4);
      dispatch_group_enter(v5);
    }
    uint64_t v6 = (__CFRunLoop *)*((void *)this + 15);
    uint64_t v7 = (const void *)*MEMORY[0x1E4F1D418];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 1174405120;
    block[2] = ___ZN18DataStallDetectionD2Ev_block_invoke;
    block[3] = &__block_descriptor_tmp_3_6;
    dispatch_group_t group = v5;
    if (v5)
    {
      dispatch_retain(v5);
      dispatch_group_enter(group);
    }
    CFRunLoopPerformBlock(v6, v7, block);
    CFRunLoopWakeUp(*((CFRunLoopRef *)this + 15));
    if (group)
    {
      dispatch_group_leave(group);
      if (group) {
        dispatch_release(group);
      }
    }
    if (v5)
    {
      dispatch_group_leave(v5);
      dispatch_release(v5);
      dispatch_group_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
      dispatch_release(v5);
    }
    else
    {
      dispatch_group_wait(0, 0xFFFFFFFFFFFFFFFFLL);
    }
  }
LABEL_17:
  uint64_t v8 = (std::__shared_weak_count *)*((void *)this + 19);
  if (v8 && !atomic_fetch_add(&v8->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
    std::__shared_weak_count::__release_weak(v8);
  }
  long long v9 = *((void *)this + 17);
  if (v9) {
    dispatch_release(v9);
  }
  uint64_t v10 = (const void *)*((void *)this + 16);
  if (v10) {
    _Block_release(v10);
  }
  uint64_t v11 = (std::__shared_weak_count *)*((void *)this + 14);
  if (v11 && !atomic_fetch_add(&v11->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
    std::__shared_weak_count::__release_weak(v11);
  }
  *(void *)this = &unk_1F2111EB8;
  MEMORY[0x1C87940C0]((char *)this + 8);
  long long v12 = *((void *)this + 12);
  if (v12) {
    dispatch_release(v12);
  }
  uint64_t v13 = *((void *)this + 11);
  if (v13) {
    dispatch_release(v13);
  }
  int v14 = (std::__shared_weak_count *)*((void *)this + 10);
  if (v14) {
    std::__shared_weak_count::__release_weak(v14);
  }
}

{
  void *v1;
  uint64_t vars8;

  DataStallDetection::~DataStallDetection(this);

  operator delete(v1);
}

void DataStallDetection::start(DataStallDetection *this)
{
  v2 = (std::__shared_weak_count *)*((void *)this + 10);
  if (!v2 || (uint64_t v3 = std::__shared_weak_count::lock(v2)) == 0) {
    std::__throw_bad_weak_ptr[abi:ne180100]();
  }
  int v4 = v3;
  atomic_fetch_add_explicit(&v3->__shared_weak_owners_, 1uLL, memory_order_relaxed);
  if (!atomic_fetch_add(&v3->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
    std::__shared_weak_count::__release_weak(v4);
  }
  xpc_object_t v27 = 0;
  int v28 = 0;
  unint64_t v29 = 0;
  uint64_t v5 = *((void *)this + 5);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)std::string buf = 0;
    _os_log_impl(&dword_1C59C6000, v5, OS_LOG_TYPE_DEFAULT, "#I Start", buf, 2u);
  }
  xpc_object_t v25 = (NetworkStatsInterface *)0xAAAAAAAAAAAAAAAALL;
  unint64_t v26 = 0xAAAAAAAAAAAAAAAALL;
  uint64_t v6 = (std::__shared_weak_count *)*((void *)this + 14);
  v24[0] = *((void *)this + 13);
  v24[1] = (uint64_t)v6;
  if (v6) {
    atomic_fetch_add_explicit(&v6->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  NetworkStatsInterface::create(v24, (uint64_t *)&v25);
  if (v6 && !atomic_fetch_add(&v6->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
    std::__shared_weak_count::__release_weak(v6);
  }
  size_t v22 = (void *)0xAAAAAAAAAAAAAAAALL;
  unint64_t v23 = 0xAAAAAAAAAAAAAAAALL;
  NetworkStatsInterface::query(v25, &v22);
  uint64_t v7 = v22 + 1;
  uint64_t v8 = (void *)*v22;
  if ((void *)*v22 != v22 + 1)
  {
    do
    {
      *(void *)&long long v9 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v9 + 1) = 0xAAAAAAAAAAAAAAAALL;
      *(_OWORD *)std::string buf = v9;
      *(_OWORD *)int v32 = v9;
      *(_OWORD *)&v32[16] = v9;
      *(_DWORD *)std::string buf = *((_DWORD *)v8 + 8);
      v32[0] = *((unsigned char *)v8 + 48);
      *(void *)&buf[8] = v8[5];
      if (*((char *)v8 + 79) < 0)
      {
        std::string::__init_copy_ctor_external((std::string *)&v32[8], (const std::string::value_type *)v8[7], v8[8]);
      }
      else
      {
        *(_OWORD *)&v32[8] = *(_OWORD *)(v8 + 7);
        *(void *)&v32[24] = v8[9];
      }
      uint64_t v10 = v28;
      if ((unint64_t)v28 >= v29)
      {
        int v28 = std::vector<std::string>::__push_back_slow_path<std::string const&>((char **)&v27, (uint64_t)&v32[8]);
        if ((v32[31] & 0x80000000) == 0) {
          goto LABEL_23;
        }
      }
      else if ((v32[31] & 0x80000000) != 0)
      {
        std::string::__init_copy_ctor_external(v28, *(const std::string::value_type **)&v32[8], *(std::string::size_type *)&v32[16]);
        int v28 = v10 + 1;
        if ((v32[31] & 0x80000000) == 0)
        {
LABEL_23:
          long long v12 = (void *)v8[1];
          if (!v12) {
            goto LABEL_29;
          }
          goto LABEL_27;
        }
      }
      else
      {
        long long v11 = *(_OWORD *)&v32[8];
        v28->__r_.__value_.__r.__words[2] = *(void *)&v32[24];
        *(_OWORD *)&v10->__r_.__value_.__l.__data_ = v11;
        int v28 = v10 + 1;
        if ((v32[31] & 0x80000000) == 0) {
          goto LABEL_23;
        }
      }
      operator delete(*(void **)&v32[8]);
      long long v12 = (void *)v8[1];
      if (!v12)
      {
        do
        {
LABEL_29:
          uint64_t v13 = (void *)v8[2];
          BOOL v14 = *v13 == (void)v8;
          uint64_t v8 = v13;
        }
        while (!v14);
        goto LABEL_14;
      }
      do
      {
LABEL_27:
        uint64_t v13 = v12;
        long long v12 = (void *)*v12;
      }
      while (v12);
LABEL_14:
      uint64_t v8 = v13;
    }
    while (v13 != v7);
  }
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 0x40000000;
  v21[2] = ___ZN18DataStallDetection5startEv_block_invoke;
  v21[3] = &__block_descriptor_tmp_5_7;
  v21[4] = this;
  uint64_t v30 = v21;
  *(void *)std::string buf = MEMORY[0x1E4F143A8];
  *(void *)&buf[8] = 0x40000000;
  *(void *)int v32 = ___ZNK3ctu20SharedSynchronizableI18DataStallDetectionE20execute_wrapped_syncIRU13block_pointerFvvEEEDTclsr8dispatchE4syncLDnEclsr3stdE7forwardIT_Efp_EEEOS7__block_invoke;
  *(void *)&v32[8] = &__block_descriptor_tmp_21_1;
  *(void *)&v32[16] = (char *)this + 72;
  *(void *)&v32[24] = &v30;
  uint64_t v15 = *((void *)this + 11);
  if (*((void *)this + 12))
  {
    dispatch_async_and_wait(v15, buf);
    int v16 = (std::__shared_weak_count *)v23;
    if (!v23) {
      goto LABEL_38;
    }
  }
  else
  {
    dispatch_sync(v15, buf);
    int v16 = (std::__shared_weak_count *)v23;
    if (!v23) {
      goto LABEL_38;
    }
  }
  if (!atomic_fetch_add(&v16->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
    std::__shared_weak_count::__release_weak(v16);
  }
LABEL_38:
  uint64_t v17 = (std::__shared_weak_count *)v26;
  if (v26 && !atomic_fetch_add((atomic_ullong *volatile)(v26 + 8), 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
    std::__shared_weak_count::__release_weak(v17);
  }
  long long v18 = (std::string *)v27;
  if (v27)
  {
    xpc_object_t v19 = v28;
    int v20 = v27;
    if (v28 != v27)
    {
      do
      {
        if (SHIBYTE(v19[-1].__r_.__value_.__r.__words[2]) < 0) {
          operator delete(v19[-1].__r_.__value_.__l.__data_);
        }
        --v19;
      }
      while (v19 != v18);
      int v20 = v27;
    }
    int v28 = v18;
    operator delete(v20);
  }
  std::__shared_weak_count::__release_weak(v4);
}

void sub_1C5BADC80(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, char a17, uint64_t a18, char a19, uint64_t a20,void *a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,void *__p,uint64_t a29,int a30,__int16 a31,char a32,char a33)
{
  std::shared_ptr<Registry>::~shared_ptr[abi:ne180100]((uint64_t)&a19);
  std::vector<std::string>::~vector[abi:ne180100](&a21);
  std::__shared_weak_count::__release_weak(v33);
  _Unwind_Resume(a1);
}

void ___ZN18DataStallDetection5startEv_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(NSObject **)(*(void *)(a1 + 32) + 40);
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl(&dword_1C59C6000, v1, OS_LOG_TYPE_DEFAULT, "#I Started", v2, 2u);
  }
}

void DataStallDetection::setCallback(uint64_t a1, uint64_t a2)
{
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 1174405120;
  v7[2] = ___ZN18DataStallDetection11setCallbackEN8dispatch8callbackIU13block_pointerFvNSt3__112basic_stringIcNS2_11char_traitsIcEENS2_9allocatorIcEEEEEEE_block_invoke;
  v7[3] = &__block_descriptor_tmp_6_12;
  v7[4] = a1;
  int v4 = *(void **)a2;
  if (*(void *)a2) {
    int v4 = _Block_copy(v4);
  }
  uint64_t v5 = (uint64_t *)(a1 + 72);
  uint64_t v6 = *(NSObject **)(a2 + 8);
  aBlock = v4;
  dispatch_object_t object = v6;
  if (v6) {
    dispatch_retain(v6);
  }
  ctu::SharedSynchronizable<DataStallDetection>::execute_wrapped(v5, (uint64_t)v7);
  if (object) {
    dispatch_release(object);
  }
  if (aBlock) {
    _Block_release(aBlock);
  }
}

void ___ZN18DataStallDetection11setCallbackEN8dispatch8callbackIU13block_pointerFvNSt3__112basic_stringIcNS2_11char_traitsIcEENS2_9allocatorIcEEEEEEE_block_invoke(void *a1)
{
  v2 = (void *)a1[4];
  uint64_t v3 = v2[5];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl(&dword_1C59C6000, v3, OS_LOG_TYPE_DEFAULT, "#I setCallback", v8, 2u);
  }
  int v4 = (void *)a1[5];
  if (v4) {
    int v4 = _Block_copy(v4);
  }
  uint64_t v5 = (const void *)v2[16];
  uint8_t v2[16] = v4;
  if (v5) {
    _Block_release(v5);
  }
  uint64_t v6 = a1[6];
  if (v6) {
    dispatch_retain(v6);
  }
  uint64_t v7 = v2[17];
  v2[17] = v6;
  if (v7) {
    dispatch_release(v7);
  }
}

void __copy_helper_block_e8_40c109_ZTSN8dispatch8callbackIU13block_pointerFvNSt3__112basic_stringIcNS1_11char_traitsIcEENS1_9allocatorIcEEEEEEE(uint64_t a1, uint64_t a2)
{
  int v4 = *(void **)(a2 + 40);
  if (v4) {
    int v4 = _Block_copy(v4);
  }
  uint64_t v5 = *(NSObject **)(a2 + 48);
  *(void *)(a1 + 40) = v4;
  *(void *)(a1 + 48) = v5;
  if (v5)
  {
    dispatch_retain(v5);
  }
}

void __destroy_helper_block_e8_40c109_ZTSN8dispatch8callbackIU13block_pointerFvNSt3__112basic_stringIcNS1_11char_traitsIcEENS1_9allocatorIcEEEEEEE(uint64_t a1)
{
  v2 = *(NSObject **)(a1 + 48);
  if (v2) {
    dispatch_release(v2);
  }
  uint64_t v3 = *(const void **)(a1 + 40);
  if (v3) {
    _Block_release(v3);
  }
}

uint64_t ctu::Loggable<DataStallDetection,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::updateTrackedConfig(uint64_t a1)
{
  return MEMORY[0x1F417DA50](a1 + 8);
}

void ctu::Loggable<DataStallDetection,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::getTrackedLoggerName(char *a1@<X8>)
{
  a1[23] = 9;
  strcpy(a1, "net.stall");
}

uint64_t ctu::Loggable<DataStallDetection,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::getTrackedLogLevel(uint64_t a1)
{
  return MEMORY[0x1F417DD10](a1 + 8);
}

void *ctu::Loggable<DataStallDetection,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::~Loggable(void *a1)
{
  *a1 = &unk_1F2111EB8;
  MEMORY[0x1C87940C0](a1 + 1);
  return a1;
}

void ctu::Loggable<DataStallDetection,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::~Loggable(void *a1)
{
  *a1 = &unk_1F2111EB8;
  MEMORY[0x1C87940C0](a1 + 1);

  operator delete(a1);
}

void ctu::Loggable<DataStallDetection,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::connectToLogServer_sync(uint64_t a1)
{
  uint64_t v1 = a1 + 56;
  if (*(void *)(a1 + 56))
  {
    if (!*(void *)(a1 + 80) || (v2 = std::__shared_weak_count::lock(*(std::__shared_weak_count **)(a1 + 80))) == 0) {
      std::__throw_bad_weak_ptr[abi:ne180100]();
    }
    uint64_t v3 = v2;
    ctu::LoggerCommonBase::getLogDomain((ctu::LoggerCommonBase *)(v1 - 48));
    ctu::TrackedLogger::registerLoggerToServer();
    if (!atomic_fetch_add(&v3->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
      std::__shared_weak_count::__release_weak(v3);
    }
  }
}

void sub_1C5BAE168(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, char a11)
{
}

void sub_1C5BAE184(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  std::shared_ptr<Registry>::~shared_ptr[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

void *std::shared_ptr<DataStallDetection>::shared_ptr[abi:ne180100]<DataStallDetection,std::shared_ptr<DataStallDetection> ctu::SharedSynchronizable<DataStallDetection>::make_shared_ptr<DataStallDetection>(DataStallDetection*)::{lambda(DataStallDetection*)#1},void>(void *a1, uint64_t a2)
{
  *a1 = a2;
  int v4 = (std::__shared_weak_count *)operator new(0x20uLL);
  v4->__shared_owners_ = 0;
  p_shared_owners = &v4->__shared_owners_;
  v4->__vftable = (std::__shared_weak_count_vtbl *)&unk_1F2111EF8;
  v4->__shared_weak_owners_ = 0;
  v4[1].__vftable = (std::__shared_weak_count_vtbl *)a2;
  a1[1] = v4;
  if (!a2) {
    return a1;
  }
  uint64_t v6 = *(std::__shared_weak_count **)(a2 + 80);
  if (v6)
  {
    if (v6->__shared_owners_ == -1)
    {
      atomic_fetch_add_explicit(&v4->__shared_owners_, 1uLL, memory_order_relaxed);
      atomic_fetch_add_explicit(&v4->__shared_weak_owners_, 1uLL, memory_order_relaxed);
      *(void *)(a2 + 72) = a2;
      *(void *)(a2 + 80) = v4;
      std::__shared_weak_count::__release_weak(v6);
      if (!atomic_fetch_add(p_shared_owners, 0xFFFFFFFFFFFFFFFFLL)) {
        goto LABEL_8;
      }
    }
    return a1;
  }
  atomic_fetch_add_explicit(&v4->__shared_owners_, 1uLL, memory_order_relaxed);
  atomic_fetch_add_explicit(&v4->__shared_weak_owners_, 1uLL, memory_order_relaxed);
  *(void *)(a2 + 72) = a2;
  *(void *)(a2 + 80) = v4;
  if (atomic_fetch_add(p_shared_owners, 0xFFFFFFFFFFFFFFFFLL)) {
    return a1;
  }
LABEL_8:
  ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
  std::__shared_weak_count::__release_weak(v4);
  return a1;
}

void sub_1C5BAE2B0(void *a1)
{
  __cxa_begin_catch(a1);
  dispatch_barrier_async_f(v1[11], v1, (dispatch_function_t)std::shared_ptr<DataStallDetection> ctu::SharedSynchronizable<DataStallDetection>::make_shared_ptr<DataStallDetection>(DataStallDetection*)::{lambda(DataStallDetection*)#1}::operator() const(DataStallDetection*)::{lambda(void *)#1}::__invoke);
  __cxa_rethrow();
}

void sub_1C5BAE2D8(_Unwind_Exception *a1)
{
}

void std::__shared_ptr_pointer<DataStallDetection *,std::shared_ptr<DataStallDetection> ctu::SharedSynchronizable<DataStallDetection>::make_shared_ptr<DataStallDetection>(DataStallDetection*)::{lambda(DataStallDetection *)#1},std::allocator<DataStallDetection>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);

  operator delete(v1);
}

void std::__shared_ptr_pointer<DataStallDetection *,std::shared_ptr<DataStallDetection> ctu::SharedSynchronizable<DataStallDetection>::make_shared_ptr<DataStallDetection>(DataStallDetection*)::{lambda(DataStallDetection *)#1},std::allocator<DataStallDetection>>::__on_zero_shared(uint64_t a1)
{
}

uint64_t std::__shared_ptr_pointer<DataStallDetection *,std::shared_ptr<DataStallDetection> ctu::SharedSynchronizable<DataStallDetection>::make_shared_ptr<DataStallDetection>(DataStallDetection*)::{lambda(DataStallDetection *)#1},std::allocator<DataStallDetection>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = *(void *)(a2 + 8);
  if ((char *)v3 == "ZN3ctu20SharedSynchronizableI18DataStallDetectionE15make_shared_ptrIS1_EENSt3__110shared_ptrIT_EEPS6_EUlPS1_E_") {
    return a1 + 24;
  }
  if (((v3 & (unint64_t)"ZN3ctu20SharedSynchronizableI18DataStallDetectionE15make_shared_ptrIS1_EENSt3__110shared"
                                "_ptrIT_EEPS6_EUlPS1_E_" & 0x8000000000000000) != 0) == __OFSUB__(v3, "ZN3ctu20SharedSynchronizableI18DataStallDetectionE15make_shared_ptrIS1_EENSt3__110shared_ptrIT_EEPS6_EUlPS1_E_"))return 0;
  if (!strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)((unint64_t)"ZN3ctu20SharedSynchronizableI18DataStallDetectionE15make_shared_ptrIS1_EENSt3__110shared_ptrIT_EEPS6_EUlPS1_E_" & 0x7FFFFFFFFFFFFFFFLL)))return a1 + 24; {
  return 0;
  }
}

uint64_t std::shared_ptr<DataStallDetection> ctu::SharedSynchronizable<DataStallDetection>::make_shared_ptr<DataStallDetection>(DataStallDetection*)::{lambda(DataStallDetection*)#1}::operator() const(DataStallDetection*)::{lambda(void *)#1}::__invoke(uint64_t result)
{
  if (result) {
    return (*(uint64_t (**)(void))(*(void *)result + 8))();
  }
  return result;
}

void ctu::SharedLoggable<DataStallDetection,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::~SharedLoggable(void *a1)
{
  *a1 = &unk_1F2111EB8;
  MEMORY[0x1C87940C0](a1 + 1);
  v2 = a1[12];
  if (v2) {
    dispatch_release(v2);
  }
  unint64_t v3 = a1[11];
  if (v3) {
    dispatch_release(v3);
  }
  int v4 = (std::__shared_weak_count *)a1[10];
  if (v4) {
    std::__shared_weak_count::__release_weak(v4);
  }

  operator delete(a1);
}

void *___ZNK3ctu20SharedSynchronizableI18DataStallDetectionE20execute_wrapped_syncIRU13block_pointerFvvEEEDTclsr8dispatchE4syncLDnEclsr3stdE7forwardIT_Efp_EEEOS7__block_invoke(uint64_t a1)
{
  return (*(void *(**)(void *__return_ptr))(**(void **)(a1 + 40) + 16))(*(void **)(a1 + 40));
}

void ctu::SharedSynchronizable<DataStallDetection>::execute_wrapped(uint64_t *a1, uint64_t a2)
{
  unint64_t v3 = (std::__shared_weak_count *)a1[1];
  if (!v3 || (uint64_t v5 = *a1, (v6 = std::__shared_weak_count::lock(v3)) == 0)) {
    std::__throw_bad_weak_ptr[abi:ne180100]();
  }
  uint64_t v7 = v6;
  uint64_t v8 = a1[2];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 1174405120;
  block[2] = ___ZNK3ctu20SharedSynchronizableI18DataStallDetectionE15execute_wrappedEU13block_pointerFvvE_block_invoke;
  block[3] = &unk_1F2111F80;
  block[5] = v5;
  long long v12 = v7;
  p_shared_owners = &v7->__shared_owners_;
  atomic_fetch_add_explicit(&v7->__shared_owners_, 1uLL, memory_order_relaxed);
  void block[4] = a2;
  dispatch_async(v8, block);
  uint64_t v10 = v12;
  if (!v12 || atomic_fetch_add(&v12->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    if (atomic_fetch_add(p_shared_owners, 0xFFFFFFFFFFFFFFFFLL)) {
      return;
    }
LABEL_8:
    ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
    std::__shared_weak_count::__release_weak(v7);
    return;
  }
  ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
  std::__shared_weak_count::__release_weak(v10);
  if (!atomic_fetch_add(p_shared_owners, 0xFFFFFFFFFFFFFFFFLL)) {
    goto LABEL_8;
  }
}

uint64_t ___ZNK3ctu20SharedSynchronizableI18DataStallDetectionE15execute_wrappedEU13block_pointerFvvE_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __copy_helper_block_e8_40c47_ZTSNSt3__110shared_ptrIK18DataStallDetectionEE(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 48);
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(result + 48) = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 8), 1uLL, memory_order_relaxed);
  }
  return result;
}

void __destroy_helper_block_e8_40c47_ZTSNSt3__110shared_ptrIK18DataStallDetectionEE(uint64_t a1)
{
  uint64_t v1 = *(std::__shared_weak_count **)(a1 + 48);
  if (v1 && !atomic_fetch_add(&v1->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v1->__on_zero_shared)(v1);
    std::__shared_weak_count::__release_weak(v1);
  }
}

void BootController::BootController(BootController *this)
{
  *(void *)this = &unk_1F2111FC0;
  uint64_t v7 = "boot.ctrl";
  GetABMLogServer(&v5);
  ctu::Loggable<BootController,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::Loggable<char const*,std::shared_ptr<ctu::LogServer>>(this, &v7, &v5);
  uint64_t v2 = v6;
  if (v6 && !atomic_fetch_add(&v6->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
    std::__shared_weak_count::__release_weak(v2);
  }
  *((void *)this + 9) = 0;
  *(void *)this = &unk_1F2111FC0;
  *((unsigned char *)this + 80) = 1;
  uint64_t Controller = TelephonyBasebandCreateController();
  int v4 = (const void *)*((void *)this + 9);
  *((void *)this + 9) = Controller;
  if (v4) {
    CFRelease(v4);
  }
}

void sub_1C5BAE80C(_Unwind_Exception *a1)
{
  ctu::cf::CFSharedRef<__TelephonyBasebandControllerHandle_tag>::~CFSharedRef(v2);
  *uint64_t v1 = &unk_1F210B810;
  MEMORY[0x1C87940C0](v1 + 1);
  _Unwind_Resume(a1);
}

void sub_1C5BAE844(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::shared_ptr<ctu::LogServer>::~shared_ptr[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

const char *BootController::getName(BootController *this)
{
  return "boot.ctrl";
}

void *ctu::Loggable<BootController,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::Loggable<char const*,std::shared_ptr<ctu::LogServer>>(void *a1, const char **a2, void *a3)
{
  *a1 = &unk_1F210B810;
  uint64_t v5 = *a2;
  size_t v6 = strlen(*a2);
  if (v6 >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  uint64_t v7 = (void *)v6;
  if (v6 >= 0x17)
  {
    uint64_t v9 = (v6 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v6 | 7) != 0x17) {
      uint64_t v9 = v6 | 7;
    }
    uint64_t v10 = v9 + 1;
    uint64_t v8 = (void **)operator new(v9 + 1);
    __dst[1] = v7;
    unint64_t v14 = v10 | 0x8000000000000000;
    __dst[0] = v8;
    goto LABEL_8;
  }
  HIBYTE(v14) = v6;
  uint64_t v8 = __dst;
  if (v6) {
LABEL_8:
  }
    memmove(v8, v5, (size_t)v7);
  *((unsigned char *)v7 + (void)v8) = 0;
  ctu::LoggerCommonBase::LoggerCommonBase();
  a1[1] = &unk_1F2102CB8;
  a1[7] = *a3;
  uint64_t v11 = a3[1];
  a1[8] = v11;
  if (v11) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v11 + 8), 1uLL, memory_order_relaxed);
  }
  if (SHIBYTE(v14) < 0) {
    operator delete(__dst[0]);
  }
  return a1;
}

void sub_1C5BAE9A0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t BootController::prepare()
{
  return 1;
}

uint64_t BootController::resetModem(BootController *this)
{
  uint64_t v2 = _os_activity_create(&dword_1C59C6000, "Reset baseband", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v2, &state);
  os_activity_scope_leave(&state);
  unint64_t v3 = *((void *)this + 5);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(state.opaque[0]) = 0;
    _os_log_impl(&dword_1C59C6000, v3, OS_LOG_TYPE_DEFAULT, "#I Reset baseband", (uint8_t *)&state, 2u);
  }
  uint64_t v4 = TelephonyBasebandResetModem();
  if ((v4 & 1) == 0)
  {
    uint64_t v5 = *((void *)this + 5);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      LOWORD(state.opaque[0]) = 0;
      _os_log_error_impl(&dword_1C59C6000, v5, OS_LOG_TYPE_ERROR, "Failed Resetting Modem", (uint8_t *)&state, 2u);
      if (!v2) {
        return v4;
      }
      goto LABEL_6;
    }
  }
  if (v2) {
LABEL_6:
  }
    os_release(v2);
  return v4;
}

void sub_1C5BAEAD8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  ctu::os::scoped_activity::~scoped_activity((void **)va);
  _Unwind_Resume(a1);
}

uint64_t BootController::powerCycleModem(BootController *this)
{
  uint64_t v2 = _os_activity_create(&dword_1C59C6000, "Powercycle baseband", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v2, &state);
  os_activity_scope_leave(&state);
  unint64_t v3 = *((void *)this + 5);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(state.opaque[0]) = 0;
    _os_log_impl(&dword_1C59C6000, v3, OS_LOG_TYPE_DEFAULT, "#I Powercycle baseband", (uint8_t *)&state, 2u);
  }
  uint64_t v4 = TelephonyBasebandPowercycleModem();
  if ((v4 & 1) == 0)
  {
    uint64_t v5 = *((void *)this + 5);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      LOWORD(state.opaque[0]) = 0;
      _os_log_error_impl(&dword_1C59C6000, v5, OS_LOG_TYPE_ERROR, "Failed to powercycle baseband", (uint8_t *)&state, 2u);
      if (!v2) {
        return v4;
      }
      goto LABEL_6;
    }
  }
  if (v2) {
LABEL_6:
  }
    os_release(v2);
  return v4;
}

void sub_1C5BAEC00(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  ctu::os::scoped_activity::~scoped_activity((void **)va);
  _Unwind_Resume(a1);
}

uint64_t BootController::powerOffModem(BootController *this)
{
  uint64_t v2 = _os_activity_create(&dword_1C59C6000, "Poweroff baseband", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v2, &state);
  os_activity_scope_leave(&state);
  unint64_t v3 = *((void *)this + 5);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(state.opaque[0]) = 0;
    _os_log_impl(&dword_1C59C6000, v3, OS_LOG_TYPE_DEFAULT, "#I Poweroff baseband", (uint8_t *)&state, 2u);
  }
  uint64_t v4 = TelephonyBasebandPowerOnModem();
  if ((v4 & 1) == 0)
  {
    uint64_t v5 = *((void *)this + 5);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      LOWORD(state.opaque[0]) = 0;
      _os_log_error_impl(&dword_1C59C6000, v5, OS_LOG_TYPE_ERROR, "Failed to poweroff baseband", (uint8_t *)&state, 2u);
      if (!v2) {
        return v4;
      }
      goto LABEL_6;
    }
  }
  if (v2) {
LABEL_6:
  }
    os_release(v2);
  return v4;
}

void sub_1C5BAED2C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  ctu::os::scoped_activity::~scoped_activity((void **)va);
  _Unwind_Resume(a1);
}

void BootController::markNonvolatileDataErased(BootController *this)
{
  uint64_t v2 = *((void *)this + 5);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unint64_t v3 = 0;
    _os_log_impl(&dword_1C59C6000, v2, OS_LOG_TYPE_DEFAULT, "#I Marking EFS as erased", v3, 2u);
  }
  *((unsigned char *)this + 80) = 1;
}

uint64_t BootController::setManagerState(uint64_t a1)
{
  uint64_t v2 = TelephonyBasebandSetManagerState();
  if (v2) {
    return v2;
  }
  unint64_t v3 = *(NSObject **)(a1 + 40);
  if (!os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    return v2;
  }
  *(_WORD *)uint64_t v5 = 0;
  _os_log_error_impl(&dword_1C59C6000, v3, OS_LOG_TYPE_ERROR, "Failed to set manager state", v5, 2u);
  return v2;
}

uint64_t BootController::getManagerState(uint64_t a1)
{
  uint64_t ManagerState = TelephonyBasebandGetManagerState();
  if (ManagerState) {
    return ManagerState;
  }
  unint64_t v3 = *(NSObject **)(a1 + 40);
  if (!os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    return ManagerState;
  }
  *(_WORD *)uint64_t v5 = 0;
  _os_log_error_impl(&dword_1C59C6000, v3, OS_LOG_TYPE_ERROR, "Failed to get manager state", v5, 2u);
  return ManagerState;
}

BOOL BootController::setBasebandState(capabilities::radio *a1)
{
  if (!capabilities::radio::supportsBasebandStateController(a1)) {
    return 1;
  }
  if (TelephonyBasebandSetBasebandState()) {
    return 1;
  }
  unint64_t v3 = *((void *)a1 + 5);
  BOOL result = os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);
  if (result)
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_error_impl(&dword_1C59C6000, v3, OS_LOG_TYPE_ERROR, "Failed to set baseband state", v4, 2u);
    return 0;
  }
  return result;
}

BOOL BootController::getBasebandState(capabilities::radio *a1, _DWORD *a2)
{
  *a2 = 0;
  if (!capabilities::radio::supportsBasebandStateController(a1)) {
    return 1;
  }
  if (TelephonyBasebandGetBasebandState()) {
    return 1;
  }
  uint64_t v4 = *((void *)a1 + 5);
  BOOL result = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);
  if (result)
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_error_impl(&dword_1C59C6000, v4, OS_LOG_TYPE_ERROR, "Failed to get baseband state", v5, 2u);
    return 0;
  }
  return result;
}

void *Capabilities::create_default_global@<X0>(void *a1@<X8>)
{
  unint64_t v3 = operator new(1uLL);
  *a1 = v3;
  BOOL result = operator new(0x20uLL);
  *BOOL result = &unk_1F2112060;
  result[1] = 0;
  result[2] = 0;
  result[3] = v3;
  a1[1] = result;
  return result;
}

void sub_1C5BAF084(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void std::__shared_ptr_pointer<Capabilities *,std::shared_ptr<Capabilities>::__shared_ptr_default_delete<Capabilities,Capabilities>,std::allocator<Capabilities>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);

  operator delete(v1);
}

void std::__shared_ptr_pointer<Capabilities *,std::shared_ptr<Capabilities>::__shared_ptr_default_delete<Capabilities,Capabilities>,std::allocator<Capabilities>>::__on_zero_shared(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 24);
  if (v1) {
    operator delete(v1);
  }
}

uint64_t std::__shared_ptr_pointer<Capabilities *,std::shared_ptr<Capabilities>::__shared_ptr_default_delete<Capabilities,Capabilities>,std::allocator<Capabilities>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  if (v3 == 0x80000001C5BCEA3FLL) {
    return a1 + 24;
  }
  if (((v3 & 0x80000001C5BCEA3FLL & 0x8000000000000000) != 0) == __OFSUB__(v3, 0x80000001C5BCEA3FLL)) {
    return 0;
  }
  if (!strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)(0x80000001C5BCEA3FLL & 0x7FFFFFFFFFFFFFFFLL))) {
    return a1 + 24;
  }
  return 0;
}

uint64_t config::hw::watch(config::hw *this)
{
  uint64_t v1 = (ctu::Gestalt *)pthread_mutex_lock(&ctu::Singleton<ctu::Gestalt,ctu::Gestalt,ctu::PthreadMutexGuardPolicy<ctu::Gestalt>>::sInstance);
  uint64_t v2 = off_1EBBDC9B8;
  if (!off_1EBBDC9B8)
  {
    ctu::Gestalt::create_default_global((uint64_t *)&v9, v1);
    long long v3 = v9;
    long long v9 = 0uLL;
    uint64_t v4 = (std::__shared_weak_count *)*(&off_1EBBDC9B8 + 1);
    off_1EBBDC9B8 = v3;
    if (v4 && !atomic_fetch_add(&v4->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
      std::__shared_weak_count::__release_weak(v4);
    }
    uint64_t v5 = (std::__shared_weak_count *)*((void *)&v9 + 1);
    if (*((void *)&v9 + 1)
      && !atomic_fetch_add((atomic_ullong *volatile)(*((void *)&v9 + 1) + 8), 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
      std::__shared_weak_count::__release_weak(v5);
    }
    uint64_t v2 = off_1EBBDC9B8;
  }
  size_t v6 = (std::__shared_weak_count *)*(&off_1EBBDC9B8 + 1);
  if (*(&off_1EBBDC9B8 + 1)) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(*(&off_1EBBDC9B8 + 1) + 8), 1uLL, memory_order_relaxed);
  }
  pthread_mutex_unlock(&ctu::Singleton<ctu::Gestalt,ctu::Gestalt,ctu::PthreadMutexGuardPolicy<ctu::Gestalt>>::sInstance);
  uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)v2 + 144))(v2);
  uint64_t v8 = result;
  if (v6)
  {
    if (!atomic_fetch_add(&v6->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
      return v8;
    }
  }
  return result;
}

void sub_1C5BAF2F0(_Unwind_Exception *a1)
{
}

void sub_1C5BAF30C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t config::hw::iPad(config::hw *this)
{
  uint64_t v1 = (ctu::Gestalt *)pthread_mutex_lock(&ctu::Singleton<ctu::Gestalt,ctu::Gestalt,ctu::PthreadMutexGuardPolicy<ctu::Gestalt>>::sInstance);
  uint64_t v2 = off_1EBBDC9B8;
  if (!off_1EBBDC9B8)
  {
    ctu::Gestalt::create_default_global((uint64_t *)&v9, v1);
    long long v3 = v9;
    long long v9 = 0uLL;
    uint64_t v4 = (std::__shared_weak_count *)*(&off_1EBBDC9B8 + 1);
    off_1EBBDC9B8 = v3;
    if (v4 && !atomic_fetch_add(&v4->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
      std::__shared_weak_count::__release_weak(v4);
    }
    uint64_t v5 = (std::__shared_weak_count *)*((void *)&v9 + 1);
    if (*((void *)&v9 + 1)
      && !atomic_fetch_add((atomic_ullong *volatile)(*((void *)&v9 + 1) + 8), 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
      std::__shared_weak_count::__release_weak(v5);
    }
    uint64_t v2 = off_1EBBDC9B8;
  }
  size_t v6 = (std::__shared_weak_count *)*(&off_1EBBDC9B8 + 1);
  if (*(&off_1EBBDC9B8 + 1)) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(*(&off_1EBBDC9B8 + 1) + 8), 1uLL, memory_order_relaxed);
  }
  pthread_mutex_unlock(&ctu::Singleton<ctu::Gestalt,ctu::Gestalt,ctu::PthreadMutexGuardPolicy<ctu::Gestalt>>::sInstance);
  uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)v2 + 136))(v2);
  uint64_t v8 = result;
  if (v6)
  {
    if (!atomic_fetch_add(&v6->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
      return v8;
    }
  }
  return result;
}

void sub_1C5BAF4B4(_Unwind_Exception *a1)
{
}

void sub_1C5BAF4D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void config::hw::product(config::hw *this)
{
  uint64_t v1 = (ctu::Gestalt *)pthread_mutex_lock(&ctu::Singleton<ctu::Gestalt,ctu::Gestalt,ctu::PthreadMutexGuardPolicy<ctu::Gestalt>>::sInstance);
  uint64_t v2 = off_1EBBDC9B8;
  if (!off_1EBBDC9B8)
  {
    ctu::Gestalt::create_default_global((uint64_t *)&v7, v1);
    long long v3 = v7;
    long long v7 = 0uLL;
    uint64_t v4 = (std::__shared_weak_count *)*(&off_1EBBDC9B8 + 1);
    off_1EBBDC9B8 = v3;
    if (v4 && !atomic_fetch_add(&v4->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
      std::__shared_weak_count::__release_weak(v4);
    }
    uint64_t v5 = (std::__shared_weak_count *)*((void *)&v7 + 1);
    if (*((void *)&v7 + 1)
      && !atomic_fetch_add((atomic_ullong *volatile)(*((void *)&v7 + 1) + 8), 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
      std::__shared_weak_count::__release_weak(v5);
    }
    uint64_t v2 = off_1EBBDC9B8;
  }
  size_t v6 = (std::__shared_weak_count *)*(&off_1EBBDC9B8 + 1);
  if (*(&off_1EBBDC9B8 + 1)) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(*(&off_1EBBDC9B8 + 1) + 8), 1uLL, memory_order_relaxed);
  }
  pthread_mutex_unlock(&ctu::Singleton<ctu::Gestalt,ctu::Gestalt,ctu::PthreadMutexGuardPolicy<ctu::Gestalt>>::sInstance);
  (*(void (**)(uint64_t))(*(void *)v2 + 48))(v2);
  if (v6)
  {
    if (!atomic_fetch_add(&v6->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
    }
  }
}

void sub_1C5BAF680(_Unwind_Exception *a1)
{
}

void sub_1C5BAF69C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void config::hw::deviceMaterial(config::hw *this)
{
  uint64_t v1 = (ctu::Gestalt *)pthread_mutex_lock(&ctu::Singleton<ctu::Gestalt,ctu::Gestalt,ctu::PthreadMutexGuardPolicy<ctu::Gestalt>>::sInstance);
  uint64_t v2 = off_1EBBDC9B8;
  if (!off_1EBBDC9B8)
  {
    ctu::Gestalt::create_default_global((uint64_t *)&v7, v1);
    long long v3 = v7;
    long long v7 = 0uLL;
    uint64_t v4 = (std::__shared_weak_count *)*(&off_1EBBDC9B8 + 1);
    off_1EBBDC9B8 = v3;
    if (v4 && !atomic_fetch_add(&v4->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
      std::__shared_weak_count::__release_weak(v4);
    }
    uint64_t v5 = (std::__shared_weak_count *)*((void *)&v7 + 1);
    if (*((void *)&v7 + 1)
      && !atomic_fetch_add((atomic_ullong *volatile)(*((void *)&v7 + 1) + 8), 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
      std::__shared_weak_count::__release_weak(v5);
    }
    uint64_t v2 = off_1EBBDC9B8;
  }
  size_t v6 = (std::__shared_weak_count *)*(&off_1EBBDC9B8 + 1);
  if (*(&off_1EBBDC9B8 + 1)) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(*(&off_1EBBDC9B8 + 1) + 8), 1uLL, memory_order_relaxed);
  }
  pthread_mutex_unlock(&ctu::Singleton<ctu::Gestalt,ctu::Gestalt,ctu::PthreadMutexGuardPolicy<ctu::Gestalt>>::sInstance);
  (*(void (**)(uint64_t))(*(void *)v2 + 104))(v2);
  if (v6)
  {
    if (!atomic_fetch_add(&v6->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
    }
  }
}

void sub_1C5BAF84C(_Unwind_Exception *a1)
{
}

void sub_1C5BAF868(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void config::hw::getBootArgs(std::string *a1@<X8>)
{
  memset(v27, 170, 24);
  long long v3 = (ctu::Gestalt *)pthread_mutex_lock(&ctu::Singleton<ctu::Gestalt,ctu::Gestalt,ctu::PthreadMutexGuardPolicy<ctu::Gestalt>>::sInstance);
  uint64_t v4 = off_1EBBDC9B8;
  if (!off_1EBBDC9B8)
  {
    ctu::Gestalt::create_default_global((uint64_t *)__p, v3);
    long long v5 = *(_OWORD *)__p;
    __p[0] = 0;
    __p[1] = 0;
    size_t v6 = (std::__shared_weak_count *)*(&off_1EBBDC9B8 + 1);
    off_1EBBDC9B8 = v5;
    if (v6 && !atomic_fetch_add(&v6->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
    }
    long long v7 = (std::__shared_weak_count *)__p[1];
    if (__p[1] && !atomic_fetch_add((atomic_ullong *volatile)__p[1] + 1, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
    }
    uint64_t v4 = off_1EBBDC9B8;
  }
  uint64_t v8 = (std::__shared_weak_count *)*(&off_1EBBDC9B8 + 1);
  v27[3] = v4;
  v27[4] = *(&off_1EBBDC9B8 + 1);
  if (*(&off_1EBBDC9B8 + 1)) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(*(&off_1EBBDC9B8 + 1) + 8), 1uLL, memory_order_relaxed);
  }
  pthread_mutex_unlock(&ctu::Singleton<ctu::Gestalt,ctu::Gestalt,ctu::PthreadMutexGuardPolicy<ctu::Gestalt>>::sInstance);
  (*(void (**)(void *__return_ptr, uint64_t))(*(void *)v4 + 112))(v27, v4);
  if (v8 && !atomic_fetch_add(&v8->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
    std::__shared_weak_count::__release_weak(v8);
  }
  HIBYTE(v26) = 9;
  strcpy((char *)__p, "boot-args");
  long long v9 = (uint64_t *)v27[1];
  if (v27[1])
  {
    while (1)
    {
      uint64_t v11 = (uint64_t **)v9;
      unint64_t v14 = (const void *)v9[4];
      long long v12 = v9 + 4;
      uint64_t v13 = v14;
      int v15 = *((char *)v12 + 23);
      if (v15 >= 0) {
        int v16 = v12;
      }
      else {
        int v16 = v13;
      }
      if (v15 >= 0) {
        unint64_t v17 = *((unsigned __int8 *)v12 + 23);
      }
      else {
        unint64_t v17 = v12[1];
      }
      if (v17 >= 9) {
        size_t v18 = 9;
      }
      else {
        size_t v18 = v17;
      }
      int v19 = memcmp(__p, v16, v18);
      if (v19)
      {
        if (v19 < 0) {
          goto LABEL_16;
        }
LABEL_30:
        int v20 = memcmp(v16, __p, v18);
        if (v20)
        {
          if ((v20 & 0x80000000) == 0) {
            goto LABEL_41;
          }
        }
        else if (v17 >= 9)
        {
LABEL_41:
          xpc_object_t v21 = (char *)v11;
          if (*((char *)v11 + 79) < 0) {
            goto LABEL_42;
          }
LABEL_40:
          long long v24 = *(_OWORD *)(v21 + 56);
          a1->__r_.__value_.__r.__words[2] = *((void *)v21 + 9);
          *(_OWORD *)&a1->__r_.__value_.__l.__data_ = v24;
          goto LABEL_43;
        }
        long long v9 = v11[1];
        if (!v9)
        {
          uint64_t v10 = v11 + 1;
          goto LABEL_37;
        }
      }
      else
      {
        if (v17 <= 9) {
          goto LABEL_30;
        }
LABEL_16:
        long long v9 = *v11;
        uint64_t v10 = v11;
        if (!*v11) {
          goto LABEL_37;
        }
      }
    }
  }
  uint64_t v10 = (uint64_t **)&v27[1];
  uint64_t v11 = (uint64_t **)&v27[1];
LABEL_37:
  xpc_object_t v21 = (char *)operator new(0x50uLL);
  *((_OWORD *)v21 + 2) = *(_OWORD *)__p;
  uint64_t v22 = v26;
  __p[1] = 0;
  uint64_t v26 = 0;
  __p[0] = 0;
  *((void *)v21 + 6) = v22;
  *((void *)v21 + 7) = 0;
  *((void *)v21 + 8) = 0;
  *((void *)v21 + 9) = 0;
  *(void *)xpc_object_t v21 = 0;
  *((void *)v21 + 1) = 0;
  *((void *)v21 + 2) = v11;
  *uint64_t v10 = (uint64_t *)v21;
  unint64_t v23 = (uint64_t *)v21;
  if (*(void *)v27[0])
  {
    v27[0] = *(void *)v27[0];
    unint64_t v23 = *v10;
  }
  std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>((uint64_t *)v27[1], v23);
  ++v27[2];
  if ((v21[79] & 0x80000000) == 0) {
    goto LABEL_40;
  }
LABEL_42:
  std::string::__init_copy_ctor_external(a1, *((const std::string::value_type **)v21 + 7), *((void *)v21 + 8));
LABEL_43:
  if (SHIBYTE(v26) < 0) {
    operator delete(__p[0]);
  }
  std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::destroy(v27[1]);
}

void sub_1C5BAFB90(_Unwind_Exception *a1)
{
}

void sub_1C5BAFBAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  std::shared_ptr<Registry>::~shared_ptr[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_1C5BAFBC4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, uint64_t a16)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::destroy(a16);
  _Unwind_Resume(a1);
}

void config::hw::regionCode(config::hw *this)
{
  uint64_t v1 = (ctu::Gestalt *)pthread_mutex_lock(&ctu::Singleton<ctu::Gestalt,ctu::Gestalt,ctu::PthreadMutexGuardPolicy<ctu::Gestalt>>::sInstance);
  uint64_t v2 = off_1EBBDC9B8;
  if (!off_1EBBDC9B8)
  {
    ctu::Gestalt::create_default_global((uint64_t *)&v7, v1);
    long long v3 = v7;
    long long v7 = 0uLL;
    uint64_t v4 = (std::__shared_weak_count *)*(&off_1EBBDC9B8 + 1);
    off_1EBBDC9B8 = v3;
    if (v4 && !atomic_fetch_add(&v4->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
      std::__shared_weak_count::__release_weak(v4);
    }
    long long v5 = (std::__shared_weak_count *)*((void *)&v7 + 1);
    if (*((void *)&v7 + 1)
      && !atomic_fetch_add((atomic_ullong *volatile)(*((void *)&v7 + 1) + 8), 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
      std::__shared_weak_count::__release_weak(v5);
    }
    uint64_t v2 = off_1EBBDC9B8;
  }
  size_t v6 = (std::__shared_weak_count *)*(&off_1EBBDC9B8 + 1);
  if (*(&off_1EBBDC9B8 + 1)) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(*(&off_1EBBDC9B8 + 1) + 8), 1uLL, memory_order_relaxed);
  }
  pthread_mutex_unlock(&ctu::Singleton<ctu::Gestalt,ctu::Gestalt,ctu::PthreadMutexGuardPolicy<ctu::Gestalt>>::sInstance);
  (*(void (**)(uint64_t))(*(void *)v2 + 72))(v2);
  if (v6)
  {
    if (!atomic_fetch_add(&v6->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
    }
  }
}

void sub_1C5BAFD80(_Unwind_Exception *a1)
{
}

void sub_1C5BAFD9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void config::hw::regionInfo(config::hw *this)
{
  uint64_t v1 = (ctu::Gestalt *)pthread_mutex_lock(&ctu::Singleton<ctu::Gestalt,ctu::Gestalt,ctu::PthreadMutexGuardPolicy<ctu::Gestalt>>::sInstance);
  uint64_t v2 = off_1EBBDC9B8;
  if (!off_1EBBDC9B8)
  {
    ctu::Gestalt::create_default_global((uint64_t *)&v7, v1);
    long long v3 = v7;
    long long v7 = 0uLL;
    uint64_t v4 = (std::__shared_weak_count *)*(&off_1EBBDC9B8 + 1);
    off_1EBBDC9B8 = v3;
    if (v4 && !atomic_fetch_add(&v4->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
      std::__shared_weak_count::__release_weak(v4);
    }
    long long v5 = (std::__shared_weak_count *)*((void *)&v7 + 1);
    if (*((void *)&v7 + 1)
      && !atomic_fetch_add((atomic_ullong *volatile)(*((void *)&v7 + 1) + 8), 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
      std::__shared_weak_count::__release_weak(v5);
    }
    uint64_t v2 = off_1EBBDC9B8;
  }
  size_t v6 = (std::__shared_weak_count *)*(&off_1EBBDC9B8 + 1);
  if (*(&off_1EBBDC9B8 + 1)) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(*(&off_1EBBDC9B8 + 1) + 8), 1uLL, memory_order_relaxed);
  }
  pthread_mutex_unlock(&ctu::Singleton<ctu::Gestalt,ctu::Gestalt,ctu::PthreadMutexGuardPolicy<ctu::Gestalt>>::sInstance);
  (*(void (**)(uint64_t))(*(void *)v2 + 64))(v2);
  if (v6)
  {
    if (!atomic_fetch_add(&v6->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
    }
  }
}

void sub_1C5BAFF4C(_Unwind_Exception *a1)
{
}

void sub_1C5BAFF68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t config::build::carrier(config::build *this)
{
  uint64_t result = TelephonyUtilIsCarrierBuild();
  if (result) {
    return TelephonyUtilIsInternalBuild() ^ 1;
  }
  return result;
}

uint64_t config::build::internal_or_carrier(config::build *this)
{
  if (TelephonyUtilIsInternalBuild()) {
    return 1;
  }

  return TelephonyUtilIsCarrierBuild();
}

void config::build::version(config::build *this)
{
  uint64_t v1 = (ctu::Gestalt *)pthread_mutex_lock(&ctu::Singleton<ctu::Gestalt,ctu::Gestalt,ctu::PthreadMutexGuardPolicy<ctu::Gestalt>>::sInstance);
  uint64_t v2 = (void (***)(void))off_1EBBDC9B8;
  if (!off_1EBBDC9B8)
  {
    ctu::Gestalt::create_default_global((uint64_t *)&v7, v1);
    long long v3 = v7;
    long long v7 = 0uLL;
    uint64_t v4 = (std::__shared_weak_count *)*(&off_1EBBDC9B8 + 1);
    off_1EBBDC9B8 = v3;
    if (v4 && !atomic_fetch_add(&v4->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
      std::__shared_weak_count::__release_weak(v4);
    }
    long long v5 = (std::__shared_weak_count *)*((void *)&v7 + 1);
    if (*((void *)&v7 + 1)
      && !atomic_fetch_add((atomic_ullong *volatile)(*((void *)&v7 + 1) + 8), 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
      std::__shared_weak_count::__release_weak(v5);
    }
    uint64_t v2 = (void (***)(void))off_1EBBDC9B8;
  }
  size_t v6 = (std::__shared_weak_count *)*(&off_1EBBDC9B8 + 1);
  if (*(&off_1EBBDC9B8 + 1)) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(*(&off_1EBBDC9B8 + 1) + 8), 1uLL, memory_order_relaxed);
  }
  pthread_mutex_unlock(&ctu::Singleton<ctu::Gestalt,ctu::Gestalt,ctu::PthreadMutexGuardPolicy<ctu::Gestalt>>::sInstance);
  (**v2)(v2);
  if (v6)
  {
    if (!atomic_fetch_add(&v6->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
    }
  }
}

void sub_1C5BB0178(_Unwind_Exception *a1)
{
}

void sub_1C5BB0194(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::destroy(uint64_t a1)
{
  if (a1)
  {
    std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::destroy(*(void *)a1);
    std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::destroy(*(void *)(a1 + 8));
    if (*(char *)(a1 + 79) < 0)
    {
      operator delete(*(void **)(a1 + 56));
      if ((*(char *)(a1 + 55) & 0x80000000) == 0)
      {
LABEL_4:
        uint64_t v2 = (void *)a1;
LABEL_6:
        operator delete(v2);
        return;
      }
    }
    else if ((*(char *)(a1 + 55) & 0x80000000) == 0)
    {
      goto LABEL_4;
    }
    operator delete(*(void **)(a1 + 32));
    uint64_t v2 = (void *)a1;
    goto LABEL_6;
  }
}

std::__shared_weak_count_vtbl **TraceCAReporter::create@<X0>(uint64_t a1@<X8>)
{
  *(void *)a1 = 0xAAAAAAAAAAAAAAAALL;
  *(void *)(a1 + 8) = 0xAAAAAAAAAAAAAAAALL;
  long long v3 = (TraceCAReporter *)operator new(0x68uLL);
  TraceCAReporter::TraceCAReporter(v3);
  *(void *)a1 = 0xAAAAAAAAAAAAAAAALL;
  *(void *)(a1 + 8) = 0xAAAAAAAAAAAAAAAALL;

  return std::shared_ptr<TraceCAReporter>::shared_ptr[abi:ne180100]<TraceCAReporter,std::shared_ptr<TraceCAReporter> ctu::SharedSynchronizable<TraceCAReporter>::make_shared_ptr<TraceCAReporter>(TraceCAReporter*)::{lambda(TraceCAReporter*)#1},void>((std::__shared_weak_count_vtbl **)a1, (std::__shared_weak_count_vtbl *)v3);
}

void sub_1C5BB02DC(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void TraceCAReporter::TraceCAReporter(TraceCAReporter *this)
{
  uint64_t v90 = *MEMORY[0x1E4F143B8];
  ctu::OsLogContext::OsLogContext((ctu::OsLogContext *)&v74, "com.apple.telephony.abm", "ca.trace.reporter");
  initially_inactive = dispatch_queue_attr_make_initially_inactive(0);
  long long v3 = dispatch_queue_create_with_target_V2("TraceCAReporter", initially_inactive, 0);
  dispatch_set_qos_class_floor(v3, QOS_CLASS_UTILITY, 0);
  dispatch_activate(v3);
  *(void *)this = 0;
  *((void *)this + 1) = 0;
  *((void *)this + 2) = v3;
  if (v3)
  {
    dispatch_retain(v3);
    *((void *)this + 3) = 0;
    dispatch_release(v3);
  }
  else
  {
    *((void *)this + 3) = 0;
  }
  ctu::OsLogLogger::OsLogLogger();
  ctu::OsLogLogger::OsLogLogger((TraceCAReporter *)((char *)this + 32), (const ctu::OsLogLogger *)&__dst);
  MEMORY[0x1C8794100](&__dst);
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)&v74);
  uint64_t v4 = (const char *)*MEMORY[0x1E4F4C2D8];
  std::pair<std::string const,std::string>::pair[abi:ne180100]<char const* const&,char const* const&,0>((uint64_t)&v74, (char *)*MEMORY[0x1E4F4C2D8], MEMORY[0x1E4F4D238]);
  uint64_t v68 = v4;
  std::pair<std::string const,std::string>::pair[abi:ne180100]<char const* const&,char const* const&,0>((uint64_t)&v78, (char *)*MEMORY[0x1E4F4C2E0], MEMORY[0x1E4F4C7C0]);
  std::pair<std::string const,std::string>::pair[abi:ne180100]<char const* const&,char const* const&,0>((uint64_t)&v82, (char *)*MEMORY[0x1E4F4CD88], MEMORY[0x1E4F4CA70]);
  std::pair<std::string const,std::string>::pair[abi:ne180100]<char const* const&,char const* const&,0>((uint64_t)&v86, (char *)*MEMORY[0x1E4F4C198], MEMORY[0x1E4F4C238]);
  uint64_t v5 = 0;
  size_t v6 = (void *)((char *)this + 64);
  v69 = (char *)this + 64;
  v70 = (void ***)((char *)this + 80);
  *((_OWORD *)this + 4) = 0u;
  *((_OWORD *)this + 5) = 0u;
  *((_DWORD *)this + 24) = 1065353216;
  do
  {
    long long v7 = &v74 + 2 * v5;
    int v8 = SHIBYTE(v7->__r_.__value_.__r.__words[2]);
    if (v8 >= 0) {
      long long v9 = &v74 + 2 * v5;
    }
    else {
      long long v9 = (std::string *)v7->__r_.__value_.__r.__words[0];
    }
    if (v8 >= 0) {
      unint64_t size = HIBYTE(v7->__r_.__value_.__r.__words[2]);
    }
    else {
      unint64_t size = v7->__r_.__value_.__l.__size_;
    }
    unint64_t v11 = std::__murmur2_or_cityhash<unsigned long,64ul>::operator()[abi:ne180100]((uint64_t)&__dst, (uint64_t *)v9, size);
    unint64_t v12 = v11;
    unint64_t v13 = *((void *)this + 9);
    if (!v13)
    {
      unint64_t v15 = 0xAAAAAAAAAAAAAAAALL;
      goto LABEL_63;
    }
    uint8x8_t v14 = (uint8x8_t)vcnt_s8((int8x8_t)v13);
    v14.i16[0] = vaddlv_u8(v14);
    if (v14.u32[0] > 1uLL)
    {
      unint64_t v15 = v11;
      if (v11 >= v13) {
        unint64_t v15 = v11 % v13;
      }
    }
    else
    {
      unint64_t v15 = (v13 - 1) & v11;
    }
    int v16 = *(uint64_t ***)(*v6 + 8 * v15);
    if (v16)
    {
      unint64_t v17 = *v16;
      if (*v16)
      {
        char v18 = HIBYTE(v7->__r_.__value_.__r.__words[2]);
        if (v18 >= 0) {
          std::string::size_type v19 = HIBYTE(v7->__r_.__value_.__r.__words[2]);
        }
        else {
          std::string::size_type v19 = v7->__r_.__value_.__l.__size_;
        }
        if (v18 >= 0) {
          int v20 = &v74 + 2 * v5;
        }
        else {
          int v20 = (std::string *)v7->__r_.__value_.__r.__words[0];
        }
        if (v14.u32[0] < 2uLL)
        {
          while (1)
          {
            uint64_t v26 = v17[1];
            if (v26 == v12)
            {
              uint64_t v27 = *((unsigned __int8 *)v17 + 39);
              if ((v27 & 0x80u) == 0) {
                uint64_t v28 = *((unsigned __int8 *)v17 + 39);
              }
              else {
                uint64_t v28 = v17[3];
              }
              if (v28 == v19)
              {
                unint64_t v29 = (const void **)(v17 + 2);
                if ((v27 & 0x80) != 0)
                {
                  if (!memcmp(*v29, v20, v17[3])) {
                    goto LABEL_7;
                  }
                }
                else
                {
                  if (!*((unsigned char *)v17 + 39)) {
                    goto LABEL_7;
                  }
                  uint64_t v30 = v20;
                  while (*(unsigned __int8 *)v29 == v30->__r_.__value_.__s.__data_[0])
                  {
                    unint64_t v29 = (const void **)((char *)v29 + 1);
                    uint64_t v30 = (std::string *)((char *)v30 + 1);
                    if (!--v27) {
                      goto LABEL_7;
                    }
                  }
                }
              }
            }
            else if ((v26 & (v13 - 1)) != v15)
            {
              goto LABEL_62;
            }
            unint64_t v17 = (uint64_t *)*v17;
            if (!v17) {
              goto LABEL_62;
            }
          }
        }
        while (1)
        {
          unint64_t v21 = v17[1];
          if (v21 == v12)
          {
            uint64_t v22 = *((unsigned __int8 *)v17 + 39);
            if ((v22 & 0x80u) == 0) {
              uint64_t v23 = *((unsigned __int8 *)v17 + 39);
            }
            else {
              uint64_t v23 = v17[3];
            }
            if (v23 == v19)
            {
              long long v24 = (const void **)(v17 + 2);
              if ((v22 & 0x80) != 0)
              {
                if (!memcmp(*v24, v20, v17[3])) {
                  goto LABEL_7;
                }
              }
              else
              {
                if (!*((unsigned char *)v17 + 39)) {
                  goto LABEL_7;
                }
                xpc_object_t v25 = v20;
                while (*(unsigned __int8 *)v24 == v25->__r_.__value_.__s.__data_[0])
                {
                  long long v24 = (const void **)((char *)v24 + 1);
                  xpc_object_t v25 = (std::string *)((char *)v25 + 1);
                  if (!--v22) {
                    goto LABEL_7;
                  }
                }
              }
            }
          }
          else
          {
            if (v21 >= v13) {
              v21 %= v13;
            }
            if (v21 != v15)
            {
LABEL_62:
              size_t v6 = (void *)((char *)this + 64);
              break;
            }
          }
          unint64_t v17 = (uint64_t *)*v17;
          if (!v17) {
            goto LABEL_62;
          }
        }
      }
    }
LABEL_63:
    unint64_t v73 = 0xAAAAAAAAAAAAAAAALL;
    int v31 = operator new(0x40uLL);
    int v32 = v31;
    __dst = (void **)v31;
    char v72 = (char *)this + 80;
    LOBYTE(v73) = 0;
    *int v31 = 0;
    v31[1] = v12;
    if (SHIBYTE(v7->__r_.__value_.__r.__words[2]) < 0)
    {
      std::string::__init_copy_ctor_external((std::string *)(v31 + 2), v7->__r_.__value_.__l.__data_, v7->__r_.__value_.__l.__size_);
    }
    else
    {
      *((_OWORD *)v31 + 1) = *(_OWORD *)&v7->__r_.__value_.__l.__data_;
      v31[4] = *((void *)&v7->__r_.__value_.__l + 2);
    }
    int v33 = (std::string *)(v32 + 5);
    int v34 = &v74 + 2 * v5 + 1;
    if (SHIBYTE(v7[1].__r_.__value_.__r.__words[2]) < 0)
    {
      std::string::__init_copy_ctor_external(v33, v34->__r_.__value_.__l.__data_, *(&v76 + 6 * v5));
    }
    else
    {
      *(_OWORD *)&v33->__r_.__value_.__l.__data_ = *(_OWORD *)&v34->__r_.__value_.__l.__data_;
      v32[7] = *(&v77 + 6 * v5);
    }
    LOBYTE(v73) = 1;
    float v35 = (float)(unint64_t)(*((void *)this + 11) + 1);
    float v36 = *((float *)this + 24);
    if (v13 && (float)(v36 * (float)v13) >= v35) {
      goto LABEL_97;
    }
    BOOL v37 = (v13 & (v13 - 1)) != 0;
    if (v13 < 3) {
      BOOL v37 = 1;
    }
    unint64_t v38 = v37 | (2 * v13);
    unint64_t v39 = vcvtps_u32_f32(v35 / v36);
    if (v38 <= v39) {
      size_t prime = v39;
    }
    else {
      size_t prime = v38;
    }
    if (prime == 1)
    {
      size_t prime = 2;
    }
    else if ((prime & (prime - 1)) != 0)
    {
      size_t prime = std::__next_prime(prime);
    }
    int8x8_t v41 = *(int8x8_t *)((char *)this + 72);
    if (prime > *(void *)&v41) {
      goto LABEL_81;
    }
    if (prime < *(void *)&v41)
    {
      unint64_t v42 = vcvtps_u32_f32((float)*((unint64_t *)this + 11) / *((float *)this + 24));
      if (*(void *)&v41 < 3uLL || (uint8x8_t v43 = (uint8x8_t)vcnt_s8(v41), v43.i16[0] = vaddlv_u8(v43), v43.u32[0] > 1uLL))
      {
        unint64_t v42 = std::__next_prime(v42);
      }
      else
      {
        uint64_t v44 = 1 << -(char)__clz(v42 - 1);
        if (v42 >= 2) {
          unint64_t v42 = v44;
        }
      }
      if (prime <= v42) {
        size_t prime = v42;
      }
      if (prime < *(void *)&v41) {
LABEL_81:
      }
        std::__hash_table<std::__hash_value_type<ctu::iokit::TelephonyIOKitPowerSource,abm::AccessoryInfo>,std::__unordered_map_hasher<ctu::iokit::TelephonyIOKitPowerSource,std::__hash_value_type<ctu::iokit::TelephonyIOKitPowerSource,abm::AccessoryInfo>,std::hash<ctu::iokit::TelephonyIOKitPowerSource>,std::equal_to<ctu::iokit::TelephonyIOKitPowerSource>,true>,std::__unordered_map_equal<ctu::iokit::TelephonyIOKitPowerSource,std::__hash_value_type<ctu::iokit::TelephonyIOKitPowerSource,abm::AccessoryInfo>,std::equal_to<ctu::iokit::TelephonyIOKitPowerSource>,std::hash<ctu::iokit::TelephonyIOKitPowerSource>,true>,std::allocator<std::__hash_value_type<ctu::iokit::TelephonyIOKitPowerSource,abm::AccessoryInfo>>>::__do_rehash<true>((uint64_t)v6, prime);
    }
    unint64_t v13 = *((void *)this + 9);
    unint64_t v45 = v13 - 1;
    if ((v13 & (v13 - 1)) == 0)
    {
      unint64_t v15 = v45 & v12;
      long long v46 = *(void ****)(*v6 + 8 * (v45 & v12));
      uint64_t v47 = __dst;
      if (!v46) {
        goto LABEL_98;
      }
      goto LABEL_5;
    }
    if (v12 < v13)
    {
      unint64_t v15 = v12;
LABEL_97:
      long long v46 = *(void ****)(*v6 + 8 * v15);
      uint64_t v47 = __dst;
      if (!v46) {
        goto LABEL_98;
      }
      goto LABEL_5;
    }
    unint64_t v15 = v12 % v13;
    long long v46 = *(void ****)(*v6 + 8 * (v12 % v13));
    uint64_t v47 = __dst;
    if (!v46)
    {
LABEL_98:
      *uint64_t v47 = *v70;
      uint64_t *v70 = __dst;
      *(void *)(*v6 + 8 * v15) = v70;
      if (*__dst)
      {
        unint64_t v48 = *((void *)*__dst + 1);
        if ((v13 & (v13 - 1)) != 0)
        {
          if (v48 >= v13) {
            v48 %= v13;
          }
        }
        else
        {
          v48 &= v13 - 1;
        }
        *(void *)(*v6 + 8 * v48) = __dst;
      }
      goto LABEL_6;
    }
LABEL_5:
    *uint64_t v47 = *v46;
    const char *v46 = __dst;
LABEL_6:
    ++*((void *)this + 11);
LABEL_7:
    ++v5;
    size_t v6 = (void *)((char *)this + 64);
  }
  while (v5 != 4);
  if ((v89 & 0x80000000) == 0)
  {
    uint64_t v49 = v68;
    if ((v87 & 0x80000000) == 0) {
      goto LABEL_108;
    }
LABEL_133:
    operator delete(v86);
    if (v85 < 0) {
      goto LABEL_134;
    }
LABEL_109:
    if ((v83 & 0x80000000) == 0) {
      goto LABEL_110;
    }
LABEL_135:
    operator delete(v82);
    if (v81 < 0) {
      goto LABEL_136;
    }
LABEL_111:
    if ((v79 & 0x80000000) == 0) {
      goto LABEL_112;
    }
LABEL_137:
    operator delete(v78);
    if (SHIBYTE(v77) < 0) {
      goto LABEL_138;
    }
LABEL_113:
    if ((SHIBYTE(v74.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
      goto LABEL_114;
    }
LABEL_139:
    operator delete(v74.__r_.__value_.__l.__data_);
    goto LABEL_114;
  }
  operator delete(__p);
  uint64_t v49 = v68;
  if (v87 < 0) {
    goto LABEL_133;
  }
LABEL_108:
  if ((v85 & 0x80000000) == 0) {
    goto LABEL_109;
  }
LABEL_134:
  operator delete(v84);
  if (v83 < 0) {
    goto LABEL_135;
  }
LABEL_110:
  if ((v81 & 0x80000000) == 0) {
    goto LABEL_111;
  }
LABEL_136:
  operator delete(v80);
  if (v79 < 0) {
    goto LABEL_137;
  }
LABEL_112:
  if ((SHIBYTE(v77) & 0x80000000) == 0) {
    goto LABEL_113;
  }
LABEL_138:
  operator delete(v75);
  if (SHIBYTE(v74.__r_.__value_.__r.__words[2]) < 0) {
    goto LABEL_139;
  }
LABEL_114:
  gettimeofday((timeval *)this + 3, 0);
  size_t v50 = strlen(v49);
  if (v50 > 0x7FFFFFFFFFFFFFF7) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  size_t v51 = v50;
  if (v50 >= 0x17)
  {
    uint64_t v53 = (v50 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v50 | 7) != 0x17) {
      uint64_t v53 = v50 | 7;
    }
    uint64_t v54 = v53 + 1;
    p_dst = (void **)operator new(v53 + 1);
    char v72 = (char *)v51;
    unint64_t v73 = v54 | 0x8000000000000000;
    __dst = p_dst;
    goto LABEL_121;
  }
  HIBYTE(v73) = v50;
  p_dst = (void **)&__dst;
  if (v50) {
LABEL_121:
  }
    memmove(p_dst, v49, v51);
  *((unsigned char *)p_dst + v51) = 0;
  memset(&v74, 0, sizeof(v74));
  uint64_t v55 = prop::bbtrace::get((char *)&__dst, (uint64_t)&v74);
  if (v55) {
    uint64_t v55 = util::convert<BOOL>(&v74, (BOOL *)this + 40, 0);
  }
  if (SHIBYTE(v74.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v74.__r_.__value_.__l.__data_);
    if (SHIBYTE(v73) < 0) {
      goto LABEL_141;
    }
  }
  else
  {
    if ((SHIBYTE(v73) & 0x80000000) == 0) {
      goto LABEL_126;
    }
LABEL_141:
    operator delete(__dst);
  }
LABEL_126:
  if (!capabilities::radio::maverick((capabilities::radio *)v55))
  {
    std::pair<std::string const,std::string>::pair[abi:ne180100]<char const* const&,char const* const&,0>((uint64_t)&v74, (char *)*MEMORY[0x1E4F4F9B8], MEMORY[0x1E4F4C7C8]);
    std::__hash_table<std::__hash_value_type<std::string,std::string>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::string>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::string>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::string>>>::__emplace_unique_key_args<std::string,std::pair<std::string const,std::string>>((uint64_t)v69, (uint64_t)&v74, (uint64_t)&v74);
    goto LABEL_155;
  }
  uint64_t v56 = (const void *)*MEMORY[0x1E4F47280];
  size_t v57 = strlen((const char *)*MEMORY[0x1E4F47280]);
  if (v57 > 0x7FFFFFFFFFFFFFF7) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  std::string::size_type v58 = v57;
  if (v57 >= 0x17)
  {
    uint64_t v60 = (v57 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v57 | 7) != 0x17) {
      uint64_t v60 = v57 | 7;
    }
    uint64_t v61 = v60 + 1;
    long long v59 = (std::string *)operator new(v60 + 1);
    v74.__r_.__value_.__l.__size_ = v58;
    v74.__r_.__value_.__r.__words[2] = v61 | 0x8000000000000000;
    v74.__r_.__value_.__r.__words[0] = (std::string::size_type)v59;
    goto LABEL_145;
  }
  *((unsigned char *)&v74.__r_.__value_.__s + 23) = v57;
  long long v59 = &v74;
  if (v57) {
LABEL_145:
  }
    memmove(v59, v56, v58);
  v59->__r_.__value_.__s.__data_[v58] = 0;
  uint64_t v62 = &v75;
  size_t v63 = (const void *)*MEMORY[0x1E4F4C7C8];
  size_t v64 = strlen((const char *)*MEMORY[0x1E4F4C7C8]);
  if (v64 > 0x7FFFFFFFFFFFFFF7) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  size_t v65 = v64;
  if (v64 >= 0x17)
  {
    uint64_t v66 = (v64 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v64 | 7) != 0x17) {
      uint64_t v66 = v64 | 7;
    }
    uint64_t v67 = v66 + 1;
    uint64_t v62 = operator new(v66 + 1);
    size_t v76 = v65;
    unint64_t v77 = v67 | 0x8000000000000000;
    uint64_t v75 = v62;
    goto LABEL_153;
  }
  HIBYTE(v77) = v64;
  if (v64) {
LABEL_153:
  }
    memmove(v62, v63, v65);
  *((unsigned char *)v62 + v65) = 0;
  std::__hash_table<std::__hash_value_type<std::string,std::string>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::string>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::string>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::string>>>::__emplace_unique_key_args<std::string,std::pair<std::string const,std::string>>((uint64_t)v69, (uint64_t)&v74, (uint64_t)&v74);
LABEL_155:
  if ((SHIBYTE(v77) & 0x80000000) == 0)
  {
    if ((SHIBYTE(v74.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
      return;
    }
LABEL_159:
    operator delete(v74.__r_.__value_.__l.__data_);
    return;
  }
  operator delete(v75);
  if (SHIBYTE(v74.__r_.__value_.__r.__words[2]) < 0) {
    goto LABEL_159;
  }
}

void sub_1C5BB0C60(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,void *__p,uint64_t a23,int a24,__int16 a25,char a26,char a27)
{
  std::pair<std::string,std::string>::~pair((uint64_t)&__p);
  std::unordered_map<std::string,std::string>::~unordered_map[abi:ne180100](a14);
  ctu::SharedLoggable<AccessoriesDelegateBase,ctu::OsLogLogger>::~SharedLoggable(v27);
  _Unwind_Resume(a1);
}

void sub_1C5BB0D34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19)
{
  do
  {
    v20 -= 48;
    std::pair<std::string,std::string>::~pair((uint64_t)v20);
  }
  while (v20 != &a19);
  ctu::SharedLoggable<AccessoriesDelegateBase,ctu::OsLogLogger>::~SharedLoggable(v19);
  _Unwind_Resume(a1);
}

void sub_1C5BB0E18(_Unwind_Exception *exception_object, int a2)
{
  if (!a2) {
    _Unwind_Resume(exception_object);
  }
  __clang_call_terminate(exception_object);
}

uint64_t std::unordered_map<std::string,std::string>::~unordered_map[abi:ne180100](uint64_t a1)
{
  uint64_t v2 = *(void ***)(a1 + 16);
  if (v2)
  {
    do
    {
      uint64_t v5 = (void **)*v2;
      if (*((char *)v2 + 63) < 0)
      {
        operator delete(v2[5]);
        if (*((char *)v2 + 39) < 0) {
LABEL_10:
        }
          operator delete(v2[2]);
      }
      else if (*((char *)v2 + 39) < 0)
      {
        goto LABEL_10;
      }
      operator delete(v2);
      uint64_t v2 = v5;
    }
    while (v5);
  }
  long long v3 = *(void **)a1;
  *(void *)a1 = 0;
  if (v3) {
    operator delete(v3);
  }
  return a1;
}

void TraceCAReporter::prepTraceStats(TraceCAReporter *a1@<X0>, xpc_object_t *a2@<X1>, xpc_object_t *a3@<X8>)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  memset(v37, 170, sizeof(v37));
  xpc_object_t value = xpc_dictionary_get_value(*a2, (const char *)*MEMORY[0x1E4F4C6A8]);
  object[0] = value;
  if (value) {
    xpc_retain(value);
  }
  else {
    object[0] = xpc_null_create();
  }
  long long __p = 0uLL;
  uint64_t v39 = 0;
  xpc::dyn_cast_or_default();
  xpc_release(object[0]);
  memset(object, 170, sizeof(object));
  xpc_object_t v7 = xpc_dictionary_get_value(*a2, (const char *)*MEMORY[0x1E4F4C1A0]);
  xpc_object_t v35 = v7;
  if (v7) {
    xpc_retain(v7);
  }
  else {
    xpc_object_t v35 = xpc_null_create();
  }
  long long __p = 0uLL;
  uint64_t v39 = 0;
  xpc::dyn_cast_or_default();
  xpc_release(v35);
  if (!TraceCAReporter::supportedTraceDomainToReport((uint64_t)a1, (char *)object)) {
    goto LABEL_14;
  }
  if (SHIBYTE(v37[2]) >= 0) {
    int v8 = v37;
  }
  else {
    int v8 = (void **)v37[0];
  }
  long long v9 = (const char *)*MEMORY[0x1E4F4C2D8];
  if (strcasecmp((const char *)v8, (const char *)*MEMORY[0x1E4F4C2D8]))
  {
    uint64_t v10 = *((void *)a1 + 4);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      LODWORD(__p) = 136315138;
      *(void *)((char *)&__p + 4) = v8;
      _os_log_error_impl(&dword_1C59C6000, v10, OS_LOG_TYPE_ERROR, "Trace property %s is not supported to report to CA", (uint8_t *)&__p, 0xCu);
    }
LABEL_14:
    *a3 = xpc_null_create();
    goto LABEL_15;
  }
  xpc_object_t v11 = xpc_dictionary_create(0, 0, 0);
  uint64_t v12 = MEMORY[0x1E4F14590];
  if (v11 || (xpc_object_t v11 = xpc_null_create()) != 0)
  {
    if (MEMORY[0x1C8795EB0](v11) == v12)
    {
      xpc_retain(v11);
      xpc_object_t v13 = v11;
    }
    else
    {
      xpc_object_t v13 = xpc_null_create();
    }
  }
  else
  {
    xpc_object_t v13 = xpc_null_create();
    xpc_object_t v11 = 0;
  }
  xpc_release(v11);
  xpc_object_t v14 = xpc_string_create((const char *)*MEMORY[0x1E4F4CA68]);
  if (!v14) {
    xpc_object_t v14 = xpc_null_create();
  }
  xpc_dictionary_set_value(v13, (const char *)*MEMORY[0x1E4F4C3C8], v14);
  xpc_object_t v15 = xpc_null_create();
  xpc_release(v14);
  xpc_release(v15);
  xpc_object_t v16 = xpc_string_create((const char *)*MEMORY[0x1E4F4C410]);
  if (!v16) {
    xpc_object_t v16 = xpc_null_create();
  }
  xpc_dictionary_set_value(v13, (const char *)*MEMORY[0x1E4F4C548], v16);
  xpc_object_t v17 = xpc_null_create();
  xpc_release(v16);
  xpc_release(v17);
  xpc_object_t v18 = xpc_string_create((const char *)*MEMORY[0x1E4F4C4C0]);
  if (!v18) {
    xpc_object_t v18 = xpc_null_create();
  }
  xpc_dictionary_set_value(v13, (const char *)*MEMORY[0x1E4F4C540], v18);
  xpc_object_t v19 = xpc_null_create();
  xpc_release(v18);
  xpc_release(v19);
  *(void *)&long long __p = 0xAAAAAAAAAAAAAAAALL;
  xpc_object_t v20 = xpc_null_create();
  *(void *)&long long __p = v20;
  if (SHIBYTE(v37[2]) >= 0) {
    unint64_t v21 = v37;
  }
  else {
    unint64_t v21 = (void **)v37[0];
  }
  if (!strcasecmp((const char *)v21, v9))
  {
    xpc_object_t v23 = *a2;
    xpc_object_t v34 = v23;
    if (v23)
    {
      xpc_retain(v23);
    }
    else
    {
      xpc_object_t v23 = xpc_null_create();
      xpc_object_t v34 = v23;
    }
    TraceCAReporter::prepTraceStatsEnabled((uint64_t)a1, &v34, &v35);
    xpc_object_t v22 = v35;
    xpc_object_t v35 = xpc_null_create();
    *(void *)&long long __p = v22;
    xpc_release(v20);
    xpc_release(v35);
    xpc_object_t v35 = 0;
    xpc_release(v23);
    xpc_object_t v34 = 0;
  }
  else
  {
    xpc_object_t v22 = v20;
  }
  if (MEMORY[0x1C8795EB0](v22) == v12)
  {
    TraceCAReporter::gatherMissingBasebandTraceState(a1, (xpc_object_t *)&__p);
    xpc_object_t v24 = (xpc_object_t)__p;
    if ((void)__p) {
      xpc_retain((xpc_object_t)__p);
    }
    else {
      xpc_object_t v24 = xpc_null_create();
    }
    xpc_dictionary_set_value(v13, (const char *)*MEMORY[0x1E4F4CB40], v24);
    xpc_object_t v25 = xpc_null_create();
    xpc_release(v24);
    xpc_release(v25);
    *a3 = (xpc_object_t)0xAAAAAAAAAAAAAAAALL;
    xpc_object_t v26 = xpc_dictionary_create(0, 0, 0);
    xpc_object_t v27 = v26;
    if (v26)
    {
      *a3 = v26;
    }
    else
    {
      xpc_object_t v27 = xpc_null_create();
      *a3 = v27;
      if (!v27)
      {
        xpc_object_t v28 = xpc_null_create();
        xpc_object_t v27 = 0;
        goto LABEL_53;
      }
    }
    if (MEMORY[0x1C8795EB0](v27) == v12)
    {
      xpc_retain(v27);
LABEL_54:
      xpc_release(v27);
      xpc_object_t v29 = xpc_string_create((const char *)*MEMORY[0x1E4F4C158]);
      if (!v29) {
        xpc_object_t v29 = xpc_null_create();
      }
      xpc_object_t v30 = *a3;
      xpc_dictionary_set_value(*a3, (const char *)*MEMORY[0x1E4F4C190], v29);
      xpc_object_t v31 = xpc_null_create();
      xpc_release(v29);
      xpc_release(v31);
      if (v13)
      {
        xpc_retain(v13);
        xpc_object_t v30 = *a3;
        xpc_object_t v32 = v13;
      }
      else
      {
        xpc_object_t v32 = xpc_null_create();
      }
      xpc_dictionary_set_value(v30, (const char *)*MEMORY[0x1E4F4C188], v32);
      xpc_object_t v33 = xpc_null_create();
      xpc_release(v32);
      xpc_release(v33);
      xpc_object_t v22 = (xpc_object_t)__p;
      goto LABEL_60;
    }
    xpc_object_t v28 = xpc_null_create();
LABEL_53:
    *a3 = v28;
    goto LABEL_54;
  }
  *a3 = xpc_null_create();
LABEL_60:
  xpc_release(v22);
  xpc_release(v13);
LABEL_15:
  if ((SHIBYTE(object[2]) & 0x80000000) == 0)
  {
    if ((SHIBYTE(v37[2]) & 0x80000000) == 0) {
      return;
    }
LABEL_19:
    operator delete(v37[0]);
    return;
  }
  operator delete(object[0]);
  if (SHIBYTE(v37[2]) < 0) {
    goto LABEL_19;
  }
}

void sub_1C5BB146C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, xpc_object_t object, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16, void *a17, uint64_t a18, int a19, __int16 a20,char a21,char a22,void *a23,uint64_t a24,int a25,__int16 a26,char a27,char a28)
{
  if (!a2) {
    _Unwind_Resume(exception_object);
  }
  __clang_call_terminate(exception_object);
}

BOOL TraceCAReporter::supportedTraceDomainToReport(uint64_t a1, char *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  int v4 = a2[23];
  if ((v4 & 0x80000000) == 0)
  {
    uint64_t v5 = a2;
    if (strcasecmp(a2, (const char *)*MEMORY[0x1E4F4C1F8])) {
      goto LABEL_3;
    }
    return 1;
  }
  uint64_t v5 = *(const char **)a2;
  if (!strcasecmp(*(const char **)a2, (const char *)*MEMORY[0x1E4F4C1F8])) {
    return 1;
  }
LABEL_3:
  if (!strcasecmp(v5, (const char *)*MEMORY[0x1E4F4F978])) {
    return 1;
  }
  size_t v6 = *(NSObject **)(a1 + 32);
  BOOL result = os_log_type_enabled(v6, OS_LOG_TYPE_ERROR);
  if (result)
  {
    int v8 = *(char **)a2;
    if (v4 >= 0) {
      int v8 = a2;
    }
    int v9 = 136315138;
    uint64_t v10 = v8;
    _os_log_error_impl(&dword_1C59C6000, v6, OS_LOG_TYPE_ERROR, "Trace domain %s is not supported to report to CA", (uint8_t *)&v9, 0xCu);
    return 0;
  }
  return result;
}

BOOL TraceCAReporter::supportedTracePropertyToReport(uint64_t a1, uint64_t a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (*(char *)(a2 + 23) >= 0) {
    long long v3 = (const char *)a2;
  }
  else {
    long long v3 = *(const char **)a2;
  }
  int v4 = strcasecmp(v3, (const char *)*MEMORY[0x1E4F4C2D8]);
  if (v4)
  {
    uint64_t v5 = *(NSObject **)(a1 + 32);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v7 = 136315138;
      int v8 = v3;
      _os_log_error_impl(&dword_1C59C6000, v5, OS_LOG_TYPE_ERROR, "Trace property %s is not supported to report to CA", (uint8_t *)&v7, 0xCu);
    }
  }
  return v4 == 0;
}

void TraceCAReporter::prepTraceStatsEnabled(uint64_t a1@<X0>, xpc_object_t *a2@<X1>, xpc_object_t *a3@<X8>)
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  memset(v54, 170, sizeof(v54));
  size_t v6 = (char *)*MEMORY[0x1E4F4C6A8];
  char v53 = 12;
  strcpy((char *)__p, "NotSpecified");
  TraceCAReporter::getOrDefault<std::string>((uint64_t)v54, *a2, v6, (uint64_t)__p);
  if (v53 < 0) {
    operator delete(__p[0]);
  }
  memset(&v51, 170, sizeof(v51));
  int v7 = (char *)*MEMORY[0x1E4F4C800];
  char v50 = 12;
  strcpy((char *)v49, "NotSpecified");
  TraceCAReporter::getOrDefault<std::string>((uint64_t)&v51, *a2, v7, (uint64_t)v49);
  if (v50 < 0) {
    operator delete(v49[0]);
  }
  memset(__s1, 170, sizeof(__s1));
  int v8 = (char *)*MEMORY[0x1E4F4D120];
  char v47 = 12;
  strcpy((char *)v46, "NotSpecified");
  TraceCAReporter::getOrDefault<std::string>((uint64_t)__s1, *a2, v8, (uint64_t)v46);
  if (v47 < 0) {
    operator delete(v46[0]);
  }
  uint64_t v9 = v54[23];
  int v10 = v54[23];
  if (v54[23] < 0) {
    uint64_t v9 = *(void *)&v54[8];
  }
  if (v9 == 12)
  {
    uint64_t v11 = *(char **)v54;
    if (v54[23] >= 0) {
      uint64_t v11 = v54;
    }
    uint64_t v12 = *(void *)v11;
    int v13 = *((_DWORD *)v11 + 2);
    if (v12 == 0x6963657053746F4ELL && v13 == 1684367718) {
      goto LABEL_48;
    }
  }
  std::string::size_type size = HIBYTE(v51.__r_.__value_.__r.__words[2]);
  if ((v51.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
  {
    xpc_object_t v16 = &v51;
  }
  else
  {
    std::string::size_type size = v51.__r_.__value_.__l.__size_;
    xpc_object_t v16 = (std::string *)v51.__r_.__value_.__r.__words[0];
  }
  if (size == 12
    && v16->__r_.__value_.__r.__words[0] == 0x6963657053746F4ELL
    && LODWORD(v16->__r_.__value_.__r.__words[1]) == 1684367718)
  {
LABEL_48:
    xpc_object_t v31 = *(NSObject **)(a1 + 32);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      unint64_t v42 = *(char **)v54;
      if (v10 >= 0) {
        unint64_t v42 = v54;
      }
      uint8x8_t v43 = &v51;
      if ((v51.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
        uint8x8_t v43 = (std::string *)v51.__r_.__value_.__r.__words[0];
      }
      *(_DWORD *)std::string buf = 136315394;
      *(void *)&buf[4] = v42;
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = v43;
      _os_log_error_impl(&dword_1C59C6000, v31, OS_LOG_TYPE_ERROR, "Missing one of the key/value: key is %s, value is %s", buf, 0x16u);
    }
    goto LABEL_52;
  }
  if (!strcmp((const char *)v16, "default") && !defaults::bbtrace::get(v54, (std::string::size_type *)&v51))
  {
LABEL_52:
    xpc_object_t v30 = xpc_null_create();
    goto LABEL_53;
  }
  BOOL v45 = 0;
  util::convert<BOOL>(&v51, &v45, 0);
  if (*(unsigned char *)(a1 + 40) != v45) {
    goto LABEL_64;
  }
  abm::asString();
  if (SHIBYTE(__s1[2]) >= 0) {
    xpc_object_t v18 = (void *)HIBYTE(__s1[2]);
  }
  else {
    xpc_object_t v18 = __s1[1];
  }
  unint64_t v19 = v56;
  int v20 = (char)v56;
  if ((v56 & 0x80u) != 0) {
    unint64_t v19 = *(void *)&buf[8];
  }
  if (v18 != (void *)v19)
  {
    BOOL v27 = 1;
    if (((char)v56 & 0x80000000) == 0) {
      goto LABEL_45;
    }
    goto LABEL_63;
  }
  if ((v56 & 0x80u) == 0) {
    unint64_t v21 = buf;
  }
  else {
    unint64_t v21 = *(uint8_t **)buf;
  }
  if ((HIBYTE(__s1[2]) & 0x80) != 0)
  {
    BOOL v27 = memcmp(__s1[0], v21, (size_t)__s1[1]) != 0;
    if ((v20 & 0x80000000) == 0) {
      goto LABEL_45;
    }
    goto LABEL_63;
  }
  if (!HIBYTE(__s1[2]))
  {
    BOOL v27 = 0;
    if (((char)v56 & 0x80000000) == 0) {
      goto LABEL_45;
    }
LABEL_63:
    operator delete(*(void **)buf);
    if (v27) {
      goto LABEL_46;
    }
    goto LABEL_64;
  }
  uint64_t v22 = HIBYTE(__s1[2]) - 1;
  xpc_object_t v23 = __s1;
  do
  {
    int v25 = *(unsigned __int8 *)v23;
    xpc_object_t v23 = (void **)((char *)v23 + 1);
    int v24 = v25;
    int v26 = *v21++;
    BOOL v27 = v24 != v26;
  }
  while (v24 == v26 && v22-- != 0);
  if ((char)v56 < 0) {
    goto LABEL_63;
  }
LABEL_45:
  if (v27)
  {
LABEL_46:
    xpc_object_t v29 = *(NSObject **)(a1 + 32);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v44 = __s1;
      if (SHIBYTE(__s1[2]) < 0) {
        uint64_t v44 = (void **)__s1[0];
      }
      *(_DWORD *)std::string buf = 67109378;
      *(_DWORD *)&buf[4] = v45;
      *(_WORD *)&buf[8] = 2080;
      *(void *)&buf[10] = v44;
      _os_log_debug_impl(&dword_1C59C6000, v29, OS_LOG_TYPE_DEBUG, "#D No state transistion, not reporting to CA(state: %d, triggerInterface: %s)", buf, 0x12u);
    }
    xpc_object_t v30 = xpc_null_create();
LABEL_53:
    *a3 = v30;
    if ((SHIBYTE(__s1[2]) & 0x80000000) == 0) {
      goto LABEL_55;
    }
    goto LABEL_54;
  }
LABEL_64:
  *a3 = (xpc_object_t)0xAAAAAAAAAAAAAAAALL;
  xpc_object_t v32 = xpc_dictionary_create(0, 0, 0);
  xpc_object_t v33 = v32;
  if (v32)
  {
    *a3 = v32;
  }
  else
  {
    xpc_object_t v33 = xpc_null_create();
    *a3 = v33;
    if (!v33)
    {
      xpc_object_t v34 = xpc_null_create();
      xpc_object_t v33 = 0;
      goto LABEL_71;
    }
  }
  if (MEMORY[0x1C8795EB0](v33) == MEMORY[0x1E4F14590])
  {
    xpc_retain(v33);
    goto LABEL_72;
  }
  xpc_object_t v34 = xpc_null_create();
LABEL_71:
  *a3 = v34;
LABEL_72:
  xpc_release(v33);
  TraceCAReporter::gatherDurationInformation((TraceCAReporter *)a1, a3);
  if (*(unsigned char *)(a1 + 40)) {
    xpc_object_t v35 = "On";
  }
  else {
    xpc_object_t v35 = "Off";
  }
  xpc_object_t v36 = xpc_string_create(v35);
  if (!v36) {
    xpc_object_t v36 = xpc_null_create();
  }
  xpc_object_t v37 = *a3;
  xpc_dictionary_set_value(v37, (const char *)*MEMORY[0x1E4F4D238], v36);
  xpc_object_t v38 = xpc_null_create();
  xpc_release(v36);
  xpc_release(v38);
  if (SHIBYTE(__s1[2]) >= 0) {
    uint64_t v39 = __s1;
  }
  else {
    uint64_t v39 = (void **)__s1[0];
  }
  xpc_object_t v40 = xpc_string_create((const char *)v39);
  if (!v40) {
    xpc_object_t v40 = xpc_null_create();
  }
  xpc_dictionary_set_value(v37, (const char *)*MEMORY[0x1E4F4C7D0], v40);
  xpc_object_t v41 = xpc_null_create();
  xpc_release(v40);
  xpc_release(v41);
  *(unsigned char *)(a1 + 40) = v45;
  if (SHIBYTE(__s1[2]) < 0) {
LABEL_54:
  }
    operator delete(__s1[0]);
LABEL_55:
  if ((SHIBYTE(v51.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
    if ((v54[23] & 0x80000000) == 0) {
      return;
    }
LABEL_59:
    operator delete(*(void **)v54);
    return;
  }
  operator delete(v51.__r_.__value_.__l.__data_);
  if (v54[23] < 0) {
    goto LABEL_59;
  }
}

void sub_1C5BB1E24(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, int a13, __int16 a14, char a15, char a16, char a17, uint64_t a18, int a19, __int16 a20,char a21,char a22,char a23,uint64_t a24,int a25,__int16 a26,char a27,char a28,char a29,uint64_t a30,int a31,__int16 a32,char a33,char a34,char a35,uint64_t a36,int a37,__int16 a38,char a39,char a40)
{
  if (a2) {
    __clang_call_terminate(exception_object);
  }
  _Unwind_Resume(exception_object);
}

void TraceCAReporter::gatherMissingBasebandTraceState(TraceCAReporter *this, xpc_object_t *a2)
{
  uint64_t v4 = MEMORY[0x1C8795EB0](*a2);
  uint64_t v5 = MEMORY[0x1E4F14590];
  if (v4 != MEMORY[0x1E4F14590])
  {
    xpc_object_t v6 = xpc_dictionary_create(0, 0, 0);
    if (v6 || (xpc_object_t v6 = xpc_null_create()) != 0)
    {
      if (MEMORY[0x1C8795EB0](v6) == v5)
      {
        xpc_retain(v6);
        xpc_object_t v7 = v6;
      }
      else
      {
        xpc_object_t v7 = xpc_null_create();
      }
    }
    else
    {
      xpc_object_t v7 = xpc_null_create();
      xpc_object_t v6 = 0;
    }
    xpc_release(v6);
    xpc_object_t v8 = xpc_null_create();
    xpc_object_t v9 = *a2;
    *a2 = v7;
    xpc_release(v9);
    xpc_release(v8);
  }
  for (i = (uint64_t *)*((void *)this + 10); i; i = (uint64_t *)*i)
  {
    *(void *)&long long v11 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v11 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)xpc_object_t v23 = v11;
    *(_OWORD *)&v23[16] = v11;
    long long v22 = v11;
    if (*((char *)i + 39) < 0)
    {
      std::string::__init_copy_ctor_external((std::string *)&v22, (const std::string::value_type *)i[2], i[3]);
      if ((*((char *)i + 63) & 0x80000000) == 0)
      {
LABEL_14:
        *(_OWORD *)&v23[8] = *(_OWORD *)(i + 5);
        *(void *)&v23[24] = i[7];
        goto LABEL_17;
      }
    }
    else
    {
      long long v22 = *((_OWORD *)i + 1);
      *(void *)xpc_object_t v23 = i[4];
      if ((*((char *)i + 63) & 0x80000000) == 0) {
        goto LABEL_14;
      }
    }
    std::string::__init_copy_ctor_external((std::string *)&v23[8], (const std::string::value_type *)i[5], i[6]);
LABEL_17:
    memset(&v21, 170, sizeof(v21));
    if ((v23[7] & 0x80000000) != 0)
    {
      std::string::__init_copy_ctor_external(&v21, (const std::string::value_type *)v22, *((std::string::size_type *)&v22 + 1));
    }
    else
    {
      *(_OWORD *)&v21.__r_.__value_.__l.__data_ = v22;
      v21.__r_.__value_.__r.__words[2] = *(void *)v23;
    }
    memset(&v20, 170, sizeof(v20));
    if ((v23[31] & 0x80000000) != 0) {
      std::string::__init_copy_ctor_external(&v20, *(const std::string::value_type **)&v23[8], *(std::string::size_type *)&v23[16]);
    }
    else {
      std::string v20 = *(std::string *)&v23[8];
    }
    if ((v20.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      uint64_t v12 = &v20;
    }
    else {
      uint64_t v12 = (std::string *)v20.__r_.__value_.__r.__words[0];
    }
    if (xpc_dictionary_get_value(*a2, (const char *)v12))
    {
LABEL_37:
      if ((SHIBYTE(v20.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
        goto LABEL_38;
      }
      goto LABEL_44;
    }
    v18[0] = 0;
    v18[1] = 0;
    uint64_t v19 = 0;
    prop::bbtrace::get((char *)&v21, (uint64_t)v18);
    TraceCAReporter::convertPlistValToCAInformation((char *)&v21, (uint64_t)v18, &__p);
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      p_p = &__p;
    }
    else {
      p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
    }
    xpc_object_t v14 = xpc_string_create((const char *)p_p);
    if (!v14) {
      xpc_object_t v14 = xpc_null_create();
    }
    if ((v20.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      xpc_object_t v15 = &v20;
    }
    else {
      xpc_object_t v15 = (std::string *)v20.__r_.__value_.__r.__words[0];
    }
    xpc_dictionary_set_value(*a2, (const char *)v15, v14);
    xpc_object_t v16 = xpc_null_create();
    xpc_release(v14);
    xpc_release(v16);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    {
      operator delete(__p.__r_.__value_.__l.__data_);
      if ((SHIBYTE(v19) & 0x80000000) == 0) {
        goto LABEL_37;
      }
    }
    else if ((SHIBYTE(v19) & 0x80000000) == 0)
    {
      goto LABEL_37;
    }
    operator delete(v18[0]);
    if ((SHIBYTE(v20.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
    {
LABEL_38:
      if ((SHIBYTE(v21.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
        goto LABEL_39;
      }
      goto LABEL_45;
    }
LABEL_44:
    operator delete(v20.__r_.__value_.__l.__data_);
    if ((SHIBYTE(v21.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
    {
LABEL_39:
      if ((v23[31] & 0x80000000) == 0) {
        goto LABEL_40;
      }
      goto LABEL_46;
    }
LABEL_45:
    operator delete(v21.__r_.__value_.__l.__data_);
    if ((v23[31] & 0x80000000) == 0)
    {
LABEL_40:
      if ((v23[7] & 0x80000000) != 0) {
        goto LABEL_47;
      }
      continue;
    }
LABEL_46:
    operator delete(*(void **)&v23[8]);
    if ((v23[7] & 0x80000000) != 0) {
LABEL_47:
    }
      operator delete((void *)v22);
  }
}

void sub_1C5BB2240(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17, void *a18, uint64_t a19, int a20,__int16 a21,char a22,char a23,uint64_t a24,void *a25,uint64_t a26,int a27,__int16 a28,char a29,char a30,uint64_t a31,void *a32,uint64_t a33,int a34,__int16 a35,char a36,char a37)
{
  if (a17 < 0)
  {
    operator delete(__p);
    if ((a23 & 0x80000000) == 0)
    {
LABEL_3:
      if ((a30 & 0x80000000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_7;
    }
  }
  else if ((a23 & 0x80000000) == 0)
  {
    goto LABEL_3;
  }
  operator delete(a18);
  if ((a30 & 0x80000000) == 0)
  {
LABEL_4:
    std::pair<std::string,std::string>::~pair((uint64_t)&a32);
    _Unwind_Resume(a1);
  }
LABEL_7:
  operator delete(a25);
  std::pair<std::string,std::string>::~pair((uint64_t)&a32);
  _Unwind_Resume(a1);
}

void TraceCAReporter::getOrDefault<std::string>(uint64_t a1, xpc_object_t xdict, char *key, uint64_t a4)
{
  memset(v10, 170, 24);
  xpc_object_t value = xpc_dictionary_get_value(xdict, key);
  xpc_object_t object = value;
  if (value) {
    xpc_retain(value);
  }
  else {
    xpc_object_t object = xpc_null_create();
  }
  memset(&v10[3], 0, 24);
  xpc::dyn_cast_or_default();
  xpc_release(object);
  xpc_object_t v7 = (void *)HIBYTE(v10[2]);
  int v8 = SHIBYTE(v10[2]);
  if (SHIBYTE(v10[2]) < 0) {
    xpc_object_t v7 = v10[1];
  }
  if (v7)
  {
    *(_OWORD *)a1 = *(_OWORD *)v10;
    *(void **)(a1 + 16) = v10[2];
  }
  else
  {
    *(_OWORD *)a1 = *(_OWORD *)a4;
    *(void *)(a1 + 16) = *(void *)(a4 + 16);
    *(void *)(a4 + 8) = 0;
    *(void *)(a4 + 16) = 0;
    *(void *)a4 = 0;
    if (v8 < 0) {
      operator delete(v10[0]);
    }
  }
}

void sub_1C5BB23E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, xpc_object_t object, uint64_t a11, uint64_t a12, uint64_t a13, void *__p, uint64_t a15, int a16, __int16 a17, char a18, char a19)
{
  if (a19 < 0) {
    operator delete(__p);
  }
  xpc_release(object);
  _Unwind_Resume(a1);
}

double TraceCAReporter::gatherDurationInformation(TraceCAReporter *this, xpc_object_t *a2)
{
  uint64_t v4 = MEMORY[0x1C8795EB0](*a2);
  uint64_t v5 = MEMORY[0x1E4F14590];
  if (v4 != MEMORY[0x1E4F14590])
  {
    xpc_object_t v6 = xpc_dictionary_create(0, 0, 0);
    if (v6 || (xpc_object_t v6 = xpc_null_create()) != 0)
    {
      if (MEMORY[0x1C8795EB0](v6) == v5)
      {
        xpc_retain(v6);
        xpc_object_t v7 = v6;
      }
      else
      {
        xpc_object_t v7 = xpc_null_create();
      }
    }
    else
    {
      xpc_object_t v7 = xpc_null_create();
      xpc_object_t v6 = 0;
    }
    xpc_release(v6);
    xpc_object_t v8 = xpc_null_create();
    xpc_object_t v9 = *a2;
    *a2 = v7;
    xpc_release(v9);
    xpc_release(v8);
  }
  v15.tv_sec = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&v15.tv_usec = 0xAAAAAAAAAAAAAAAALL;
  gettimeofday(&v15, 0);
  uint64_t v11 = *((void *)this + 6);
  int v10 = (timeval *)((char *)this + 48);
  xpc_object_t v12 = xpc_int64_create(v15.tv_sec - v11);
  if (!v12) {
    xpc_object_t v12 = xpc_null_create();
  }
  xpc_dictionary_set_value(*a2, (const char *)*MEMORY[0x1E4F4C4A0], v12);
  xpc_object_t v13 = xpc_null_create();
  xpc_release(v12);
  xpc_release(v13);
  double result = *(double *)&v15.tv_sec;
  *int v10 = v15;
  return result;
}

std::string *TraceCAReporter::convertPlistValToCAInformation@<X0>(char *a1@<X1>, uint64_t a2@<X2>, std::string *a3@<X8>)
{
  uint64_t v4 = a1;
  uint64_t v5 = a3;
  memset(a3, 170, sizeof(std::string));
  if (*(char *)(a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(a3, *(const std::string::value_type **)a2, *(void *)(a2 + 8));
    if ((v4[23] & 0x80000000) == 0)
    {
LABEL_3:
      double result = (std::string *)strcasecmp(v4, (const char *)*MEMORY[0x1E4F4CD88]);
      if (result) {
        goto LABEL_4;
      }
      goto LABEL_19;
    }
  }
  else
  {
    *(_OWORD *)&a3->__r_.__value_.__l.__data_ = *(_OWORD *)a2;
    a3->__r_.__value_.__r.__words[2] = *(void *)(a2 + 16);
    if ((a1[23] & 0x80000000) == 0) {
      goto LABEL_3;
    }
  }
  uint64_t v4 = *(char **)v4;
  double result = (std::string *)strcasecmp(v4, (const char *)*MEMORY[0x1E4F4CD88]);
  if (result)
  {
LABEL_4:
    if (!strcasecmp(v4, (const char *)*MEMORY[0x1E4F4C198]))
    {
      int v14 = -1431655766;
      util::convert<int>((const std::string *)a2, &v14, 0);
      xpc_object_t v13 = (const std::string::value_type *)trace::toString();
      return std::string::__assign_external(v5, v13);
    }
    else if (!strcasecmp(v4, (const char *)*MEMORY[0x1E4F4C2D8]) {
           || !strcasecmp(v4, (const char *)*MEMORY[0x1E4F4F9B8])
    }
           || (double result = (std::string *)strcasecmp(v4, (const char *)*MEMORY[0x1E4F47280]), !result))
    {
      uint64_t v7 = *(unsigned __int8 *)(a2 + 23);
      if (*(char *)(a2 + 23) < 0) {
        uint64_t v7 = *(void *)(a2 + 8);
      }
      if (v7 == 1)
      {
        if (*(char *)(a2 + 23) >= 0) {
          xpc_object_t v8 = (unsigned char *)a2;
        }
        else {
          xpc_object_t v8 = *(unsigned char **)a2;
        }
        if (*v8 == 48) {
          xpc_object_t v9 = "Off";
        }
        else {
          xpc_object_t v9 = "On";
        }
      }
      else
      {
        xpc_object_t v9 = "On";
      }
      return std::string::__assign_external(v5, v9);
    }
    return result;
  }
LABEL_19:
  uint64_t v10 = *(unsigned __int8 *)(a2 + 23);
  int v11 = (char)v10;
  if ((v10 & 0x80u) != 0) {
    uint64_t v10 = *(void *)(a2 + 8);
  }
  if (v10 == 1)
  {
    xpc_object_t v12 = v11 >= 0 ? (unsigned char *)a2 : *(unsigned char **)a2;
    if (*v12 == 48)
    {
      if (SHIBYTE(v5->__r_.__value_.__r.__words[2]) < 0)
      {
        v5->__r_.__value_.__l.__size_ = 8;
        uint64_t v5 = (std::string *)v5->__r_.__value_.__r.__words[0];
      }
      else
      {
        *((unsigned char *)&v5->__r_.__value_.__s + 23) = 8;
      }
      strcpy((char *)v5, "No limit");
    }
  }
  return result;
}

void sub_1C5BB27A0(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

uint64_t std::pair<std::string const,std::string>::pair[abi:ne180100]<char const* const&,char const* const&,0>(uint64_t a1, char *__s, const char **a3)
{
  size_t v6 = strlen(__s);
  if (v6 > 0x7FFFFFFFFFFFFFF7) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  size_t v7 = v6;
  if (v6 >= 0x17)
  {
    uint64_t v9 = (v6 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v6 | 7) != 0x17) {
      uint64_t v9 = v6 | 7;
    }
    uint64_t v10 = v9 + 1;
    xpc_object_t v8 = operator new(v9 + 1);
    *(void *)(a1 + 8) = v7;
    *(void *)(a1 + 16) = v10 | 0x8000000000000000;
    *(void *)a1 = v8;
    goto LABEL_8;
  }
  *(unsigned char *)(a1 + 23) = v6;
  xpc_object_t v8 = (void *)a1;
  if (v6) {
LABEL_8:
  }
    memmove(v8, __s, v7);
  *((unsigned char *)v8 + v7) = 0;
  int v11 = (void *)(a1 + 24);
  xpc_object_t v12 = *a3;
  size_t v13 = strlen(*a3);
  if (v13 > 0x7FFFFFFFFFFFFFF7) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  size_t v14 = v13;
  if (v13 >= 0x17)
  {
    uint64_t v15 = (v13 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v13 | 7) != 0x17) {
      uint64_t v15 = v13 | 7;
    }
    uint64_t v16 = v15 + 1;
    int v11 = operator new(v15 + 1);
    *(void *)(a1 + 32) = v14;
    *(void *)(a1 + 40) = v16 | 0x8000000000000000;
    *(void *)(a1 + 24) = v11;
  }
  else
  {
    *(unsigned char *)(a1 + 47) = v13;
    if (!v13) {
      goto LABEL_17;
    }
  }
  memmove(v11, v12, v14);
LABEL_17:
  *((unsigned char *)v11 + v14) = 0;
  return a1;
}

void sub_1C5BB2904(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

std::__shared_weak_count_vtbl **std::shared_ptr<TraceCAReporter>::shared_ptr[abi:ne180100]<TraceCAReporter,std::shared_ptr<TraceCAReporter> ctu::SharedSynchronizable<TraceCAReporter>::make_shared_ptr<TraceCAReporter>(TraceCAReporter*)::{lambda(TraceCAReporter*)#1},void>(std::__shared_weak_count_vtbl **a1, std::__shared_weak_count_vtbl *a2)
{
  *a1 = a2;
  uint64_t v4 = (std::__shared_weak_count *)operator new(0x20uLL);
  v4->__shared_owners_ = 0;
  p_shared_owners = &v4->__shared_owners_;
  v4->__vftable = (std::__shared_weak_count_vtbl *)&unk_1F21120B0;
  v4->__shared_weak_owners_ = 0;
  v4[1].__vftable = a2;
  a1[1] = (std::__shared_weak_count_vtbl *)v4;
  if (!a2) {
    return a1;
  }
  size_t v6 = (std::__shared_weak_count *)a2->~__shared_weak_count_0;
  if (v6)
  {
    if (v6->__shared_owners_ == -1)
    {
      atomic_fetch_add_explicit(&v4->__shared_owners_, 1uLL, memory_order_relaxed);
      atomic_fetch_add_explicit(&v4->__shared_weak_owners_, 1uLL, memory_order_relaxed);
      a2->~__shared_weak_size_t count = (void (__cdecl *)(std::__shared_weak_count *__hidden))a2;
      a2->~__shared_weak_count_0 = (void (__cdecl *)(std::__shared_weak_count *__hidden))v4;
      std::__shared_weak_count::__release_weak(v6);
      if (!atomic_fetch_add(p_shared_owners, 0xFFFFFFFFFFFFFFFFLL)) {
        goto LABEL_8;
      }
    }
    return a1;
  }
  atomic_fetch_add_explicit(&v4->__shared_owners_, 1uLL, memory_order_relaxed);
  atomic_fetch_add_explicit(&v4->__shared_weak_owners_, 1uLL, memory_order_relaxed);
  a2->~__shared_weak_size_t count = (void (__cdecl *)(std::__shared_weak_count *__hidden))a2;
  a2->~__shared_weak_count_0 = (void (__cdecl *)(std::__shared_weak_count *__hidden))v4;
  if (atomic_fetch_add(p_shared_owners, 0xFFFFFFFFFFFFFFFFLL)) {
    return a1;
  }
LABEL_8:
  ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
  std::__shared_weak_count::__release_weak(v4);
  return a1;
}

void sub_1C5BB2A38(void *a1)
{
  __cxa_begin_catch(a1);
  dispatch_barrier_async_f(v1[2], v1, (dispatch_function_t)std::shared_ptr<TraceCAReporter> ctu::SharedSynchronizable<TraceCAReporter>::make_shared_ptr<TraceCAReporter>(TraceCAReporter*)::{lambda(TraceCAReporter*)#1}::operator() const(TraceCAReporter*)::{lambda(void *)#1}::__invoke);
  __cxa_rethrow();
}

void sub_1C5BB2A60(_Unwind_Exception *a1)
{
}

void std::__shared_ptr_pointer<TraceCAReporter *,std::shared_ptr<TraceCAReporter> ctu::SharedSynchronizable<TraceCAReporter>::make_shared_ptr<TraceCAReporter>(TraceCAReporter*)::{lambda(TraceCAReporter *)#1},std::allocator<TraceCAReporter>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);

  operator delete(v1);
}

void std::__shared_ptr_pointer<TraceCAReporter *,std::shared_ptr<TraceCAReporter> ctu::SharedSynchronizable<TraceCAReporter>::make_shared_ptr<TraceCAReporter>(TraceCAReporter*)::{lambda(TraceCAReporter *)#1},std::allocator<TraceCAReporter>>::__on_zero_shared(uint64_t a1)
{
}

uint64_t std::__shared_ptr_pointer<TraceCAReporter *,std::shared_ptr<TraceCAReporter> ctu::SharedSynchronizable<TraceCAReporter>::make_shared_ptr<TraceCAReporter>(TraceCAReporter*)::{lambda(TraceCAReporter *)#1},std::allocator<TraceCAReporter>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = *(void *)(a2 + 8);
  if ((char *)v3 == "ZN3ctu20SharedSynchronizableI15TraceCAReporterE15make_shared_ptrIS1_EENSt3__110shared_ptrIT_EEPS6_EUlPS1_E_") {
    return a1 + 24;
  }
  if (((v3 & (unint64_t)"ZN3ctu20SharedSynchronizableI15TraceCAReporterE15make_shared_ptrIS1_EENSt3__110shared_pt"
                                "rIT_EEPS6_EUlPS1_E_" & 0x8000000000000000) != 0) == __OFSUB__(v3, "ZN3ctu20SharedSynchronizableI15TraceCAReporterE15make_shared_ptrIS1_EENSt3__110shared_ptrIT_EEPS6_EUlPS1_E_"))return 0;
  if (!strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)((unint64_t)"ZN3ctu20SharedSynchronizableI15TraceCAReporterE15make_shared_ptrIS1_EENSt3__110shared_ptrIT_EEPS6_EUlPS1_E_" & 0x7FFFFFFFFFFFFFFFLL)))return a1 + 24; {
  return 0;
  }
}

void std::shared_ptr<TraceCAReporter> ctu::SharedSynchronizable<TraceCAReporter>::make_shared_ptr<TraceCAReporter>(TraceCAReporter*)::{lambda(TraceCAReporter*)#1}::operator() const(TraceCAReporter*)::{lambda(void *)#1}::__invoke(void *a1)
{
  if (!a1) {
    return;
  }
  uint64_t v2 = (void **)a1[10];
  if (v2)
  {
    do
    {
      size_t v7 = (void **)*v2;
      if (*((char *)v2 + 63) < 0)
      {
        operator delete(v2[5]);
        if (*((char *)v2 + 39) < 0) {
LABEL_19:
        }
          operator delete(v2[2]);
      }
      else if (*((char *)v2 + 39) < 0)
      {
        goto LABEL_19;
      }
      operator delete(v2);
      uint64_t v2 = v7;
    }
    while (v7);
  }
  unint64_t v3 = (void *)a1[8];
  a1[8] = 0;
  if (v3) {
    operator delete(v3);
  }
  MEMORY[0x1C8794100](a1 + 4);
  uint64_t v4 = a1[3];
  if (v4) {
    dispatch_release(v4);
  }
  uint64_t v5 = a1[2];
  if (v5) {
    dispatch_release(v5);
  }
  size_t v6 = (std::__shared_weak_count *)a1[1];
  if (v6) {
    std::__shared_weak_count::__release_weak(v6);
  }

  operator delete(a1);
}

uint64_t *std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,std::string>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,std::string>,void *>>>>::~unique_ptr[abi:ne180100](uint64_t *a1)
{
  uint64_t v2 = *a1;
  *a1 = 0;
  if (v2)
  {
    if (*((unsigned char *)a1 + 16))
    {
      if (*(char *)(v2 + 63) < 0)
      {
        operator delete(*(void **)(v2 + 40));
        if ((*(char *)(v2 + 39) & 0x80000000) == 0) {
          goto LABEL_5;
        }
      }
      else if ((*(char *)(v2 + 39) & 0x80000000) == 0)
      {
        goto LABEL_5;
      }
      operator delete(*(void **)(v2 + 16));
    }
LABEL_5:
    operator delete((void *)v2);
  }
  return a1;
}

void std::__hash_table<std::__hash_value_type<std::string,std::string>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::string>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::string>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::string>>>::__emplace_unique_key_args<std::string,std::pair<std::string const,std::string>>(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = (unsigned char *)a2;
  unint64_t v6 = *(void *)(a2 + 8);
  if (*(char *)(a2 + 23) >= 0)
  {
    unint64_t v7 = *(unsigned __int8 *)(a2 + 23);
  }
  else
  {
    a2 = *(void *)a2;
    unint64_t v7 = v6;
  }
  unint64_t v8 = std::__murmur2_or_cityhash<unsigned long,64ul>::operator()[abi:ne180100]((uint64_t)v43, (uint64_t *)a2, v7);
  unint64_t v9 = v8;
  unint64_t v10 = *(void *)(a1 + 8);
  if (v10)
  {
    uint8x8_t v11 = (uint8x8_t)vcnt_s8((int8x8_t)v10);
    v11.i16[0] = vaddlv_u8(v11);
    if (v11.u32[0] > 1uLL)
    {
      unint64_t v12 = v8;
      if (v8 >= v10) {
        unint64_t v12 = v8 % v10;
      }
    }
    else
    {
      unint64_t v12 = (v10 - 1) & v8;
    }
    size_t v13 = *(uint64_t ***)(*(void *)a1 + 8 * v12);
    if (v13)
    {
      size_t v14 = *v13;
      if (*v13)
      {
        char v15 = v4[23];
        if (v15 >= 0) {
          uint64_t v16 = v4[23];
        }
        else {
          uint64_t v16 = *((void *)v4 + 1);
        }
        if (v15 < 0) {
          uint64_t v4 = *(unsigned char **)v4;
        }
        if (v11.u32[0] < 2uLL)
        {
          while (1)
          {
            uint64_t v22 = v14[1];
            if (v22 == v9)
            {
              uint64_t v23 = *((unsigned __int8 *)v14 + 39);
              if ((v23 & 0x80u) == 0) {
                uint64_t v24 = *((unsigned __int8 *)v14 + 39);
              }
              else {
                uint64_t v24 = v14[3];
              }
              if (v24 == v16)
              {
                int v25 = (const void **)(v14 + 2);
                if ((v23 & 0x80) != 0)
                {
                  if (!memcmp(*v25, v4, v14[3])) {
                    return;
                  }
                }
                else
                {
                  if (!*((unsigned char *)v14 + 39)) {
                    return;
                  }
                  for (i = v4; *(unsigned __int8 *)v25 == *i; ++i)
                  {
                    int v25 = (const void **)((char *)v25 + 1);
                    if (!--v23) {
                      return;
                    }
                  }
                }
              }
            }
            else if ((v22 & (v10 - 1)) != v12)
            {
              goto LABEL_51;
            }
            size_t v14 = (uint64_t *)*v14;
            if (!v14) {
              goto LABEL_51;
            }
          }
        }
        do
        {
          unint64_t v17 = v14[1];
          if (v17 == v9)
          {
            uint64_t v18 = *((unsigned __int8 *)v14 + 39);
            if ((v18 & 0x80u) == 0) {
              uint64_t v19 = *((unsigned __int8 *)v14 + 39);
            }
            else {
              uint64_t v19 = v14[3];
            }
            if (v19 == v16)
            {
              std::string v20 = (const void **)(v14 + 2);
              if ((v18 & 0x80) != 0)
              {
                if (!memcmp(*v20, v4, v14[3])) {
                  return;
                }
              }
              else
              {
                if (!*((unsigned char *)v14 + 39)) {
                  return;
                }
                for (j = v4; *(unsigned __int8 *)v20 == *j; ++j)
                {
                  std::string v20 = (const void **)((char *)v20 + 1);
                  if (!--v18) {
                    return;
                  }
                }
              }
            }
          }
          else
          {
            if (v17 >= v10) {
              v17 %= v10;
            }
            if (v17 != v12) {
              break;
            }
          }
          size_t v14 = (uint64_t *)*v14;
        }
        while (v14);
      }
    }
  }
  else
  {
    unint64_t v12 = 0xAAAAAAAAAAAAAAAALL;
  }
LABEL_51:
  unint64_t v44 = 0xAAAAAAAAAAAAAA00;
  BOOL v27 = (char *)operator new(0x40uLL);
  v43[0] = v27;
  v43[1] = a1 + 16;
  *(void *)BOOL v27 = 0;
  *((void *)v27 + 1) = v9;
  xpc_object_t v28 = (std::string *)(v27 + 16);
  if (*(char *)(a3 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(v28, *(const std::string::value_type **)a3, *(void *)(a3 + 8));
  }
  else
  {
    *(_OWORD *)&v28->__r_.__value_.__l.__data_ = *(_OWORD *)a3;
    *((void *)v27 + 4) = *(void *)(a3 + 16);
  }
  *(_OWORD *)(v27 + 40) = *(_OWORD *)(a3 + 24);
  *((void *)v27 + 7) = *(void *)(a3 + 40);
  *(void *)(a3 + 32) = 0;
  *(void *)(a3 + 40) = 0;
  *(void *)(a3 + 24) = 0;
  LOBYTE(v44) = 1;
  float v29 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v30 = *(float *)(a1 + 32);
  if (v10 && (float)(v30 * (float)v10) >= v29) {
    goto LABEL_82;
  }
  BOOL v31 = 1;
  if (v10 >= 3) {
    BOOL v31 = (v10 & (v10 - 1)) != 0;
  }
  unint64_t v32 = v31 | (2 * v10);
  unint64_t v33 = vcvtps_u32_f32(v29 / v30);
  if (v32 <= v33) {
    size_t prime = v33;
  }
  else {
    size_t prime = v32;
  }
  if (prime == 1)
  {
    size_t prime = 2;
  }
  else if ((prime & (prime - 1)) != 0)
  {
    size_t prime = std::__next_prime(prime);
  }
  int8x8_t v35 = *(int8x8_t *)(a1 + 8);
  if (prime > *(void *)&v35) {
    goto LABEL_66;
  }
  if (prime < *(void *)&v35)
  {
    unint64_t v36 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 24) / *(float *)(a1 + 32));
    if (*(void *)&v35 < 3uLL || (uint8x8_t v37 = (uint8x8_t)vcnt_s8(v35), v37.i16[0] = vaddlv_u8(v37), v37.u32[0] > 1uLL))
    {
      unint64_t v36 = std::__next_prime(v36);
    }
    else
    {
      uint64_t v38 = 1 << -(char)__clz(v36 - 1);
      if (v36 >= 2) {
        unint64_t v36 = v38;
      }
    }
    if (prime <= v36) {
      size_t prime = v36;
    }
    if (prime < *(void *)&v35) {
LABEL_66:
    }
      std::__hash_table<std::__hash_value_type<ctu::iokit::TelephonyIOKitPowerSource,abm::AccessoryInfo>,std::__unordered_map_hasher<ctu::iokit::TelephonyIOKitPowerSource,std::__hash_value_type<ctu::iokit::TelephonyIOKitPowerSource,abm::AccessoryInfo>,std::hash<ctu::iokit::TelephonyIOKitPowerSource>,std::equal_to<ctu::iokit::TelephonyIOKitPowerSource>,true>,std::__unordered_map_equal<ctu::iokit::TelephonyIOKitPowerSource,std::__hash_value_type<ctu::iokit::TelephonyIOKitPowerSource,abm::AccessoryInfo>,std::equal_to<ctu::iokit::TelephonyIOKitPowerSource>,std::hash<ctu::iokit::TelephonyIOKitPowerSource>,true>,std::allocator<std::__hash_value_type<ctu::iokit::TelephonyIOKitPowerSource,abm::AccessoryInfo>>>::__do_rehash<true>(a1, prime);
  }
  unint64_t v10 = *(void *)(a1 + 8);
  unint64_t v39 = v10 - 1;
  if ((v10 & (v10 - 1)) != 0)
  {
    if (v9 >= v10)
    {
      unint64_t v12 = v9 % v10;
      xpc_object_t v40 = *(void **)(*(void *)a1 + 8 * (v9 % v10));
      xpc_object_t v41 = (void *)v43[0];
      if (!v40) {
        goto LABEL_85;
      }
      goto LABEL_83;
    }
    unint64_t v12 = v9;
LABEL_82:
    xpc_object_t v40 = *(void **)(*(void *)a1 + 8 * v12);
    xpc_object_t v41 = (void *)v43[0];
    if (!v40) {
      goto LABEL_85;
    }
    goto LABEL_83;
  }
  unint64_t v12 = v39 & v9;
  xpc_object_t v40 = *(void **)(*(void *)a1 + 8 * (v39 & v9));
  xpc_object_t v41 = (void *)v43[0];
  if (!v40)
  {
LABEL_85:
    *xpc_object_t v41 = *(void *)(a1 + 16);
    *(void *)(a1 + 16) = v43[0];
    *(void *)(*(void *)a1 + 8 * v12) = a1 + 16;
    if (*(void *)v43[0])
    {
      unint64_t v42 = *(void *)(*(void *)v43[0] + 8);
      if ((v10 & (v10 - 1)) != 0)
      {
        if (v42 >= v10) {
          v42 %= v10;
        }
      }
      else
      {
        v42 &= v10 - 1;
      }
      *(void *)(*(void *)a1 + 8 * v42) = v43[0];
    }
    goto LABEL_91;
  }
LABEL_83:
  *xpc_object_t v41 = *v40;
  *xpc_object_t v40 = v43[0];
LABEL_91:
  ++*(void *)(a1 + 24);
}

void sub_1C5BB30B0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,std::string>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,std::string>,void *>>>>::~unique_ptr[abi:ne180100]((uint64_t *)va);
  _Unwind_Resume(a1);
}

void sub_1C5BB30C4(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,std::string>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,std::string>,void *>>>>::~unique_ptr[abi:ne180100]((uint64_t *)va);
  _Unwind_Resume(a1);
}

void *BasebandCrashReasonFilter::create@<X0>(void *a1@<X8>)
{
  *a1 = 0xAAAAAAAAAAAAAAAALL;
  a1[1] = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v3 = (BasebandCrashReasonFilter *)operator new(0x60uLL);
  BasebandCrashReasonFilter::BasebandCrashReasonFilter(v3);
  *a1 = 0xAAAAAAAAAAAAAAAALL;
  a1[1] = 0xAAAAAAAAAAAAAAAALL;

  return std::shared_ptr<BasebandCrashReasonFilter>::shared_ptr[abi:ne180100]<BasebandCrashReasonFilter,std::shared_ptr<BasebandCrashReasonFilter> ctu::SharedSynchronizable<BasebandCrashReasonFilter>::make_shared_ptr<BasebandCrashReasonFilter>(BasebandCrashReasonFilter*)::{lambda(BasebandCrashReasonFilter*)#1},void>(a1, (uint64_t)v3);
}

void sub_1C5BB3138(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void BasebandCrashReasonFilter::~BasebandCrashReasonFilter(BasebandCrashReasonFilter *this)
{
  *(void *)this = &unk_1F2112100;
  uint64_t v2 = (char *)this + 40;
  unint64_t v3 = *((void *)this + 5);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)size_t v13 = 0;
    _os_log_impl(&dword_1C59C6000, v3, OS_LOG_TYPE_DEFAULT, "#I Gone!", v13, 2u);
  }
  uint64_t v4 = *((void *)this + 9);
  if (v4)
  {
    uint64_t v5 = *((void *)this + 10);
    unint64_t v6 = (void *)*((void *)this + 9);
    if (v5 != v4)
    {
      do
      {
        if (*(char *)(v5 - 9) < 0) {
          operator delete(*(void **)(v5 - 32));
        }
        v5 -= 32;
      }
      while (v5 != v4);
      unint64_t v6 = (void *)*((void *)this + 9);
    }
    *((void *)this + 10) = v4;
    operator delete(v6);
  }
  uint64_t v7 = *((void *)this + 6);
  if (v7)
  {
    uint64_t v8 = *((void *)this + 7);
    unint64_t v9 = (void *)*((void *)this + 6);
    if (v8 != v7)
    {
      do
      {
        if (*(char *)(v8 - 9) < 0) {
          operator delete(*(void **)(v8 - 32));
        }
        v8 -= 32;
      }
      while (v8 != v7);
      unint64_t v9 = (void *)*((void *)this + 6);
    }
    *((void *)this + 7) = v7;
    operator delete(v9);
  }
  MEMORY[0x1C8794100](v2);
  unint64_t v10 = *((void *)this + 4);
  if (v10) {
    dispatch_release(v10);
  }
  uint8x8_t v11 = *((void *)this + 3);
  if (v11) {
    dispatch_release(v11);
  }
  unint64_t v12 = (std::__shared_weak_count *)*((void *)this + 2);
  if (v12) {
    std::__shared_weak_count::__release_weak(v12);
  }
}

{
  void *v1;
  uint64_t vars8;

  BasebandCrashReasonFilter::~BasebandCrashReasonFilter(this);

  operator delete(v1);
}

void BasebandCrashReasonFilter::BasebandCrashReasonFilter(BasebandCrashReasonFilter *this)
{
  ctu::OsLogContext::OsLogContext((ctu::OsLogContext *)&v12, "com.apple.telephony.abm", "bb.crashreason.fltr");
  initially_inactive = dispatch_queue_attr_make_initially_inactive(0);
  unint64_t v3 = dispatch_queue_create_with_target_V2("BasebandCrashReasonFilter", initially_inactive, 0);
  dispatch_set_qos_class_floor(v3, QOS_CLASS_UTILITY, 0);
  dispatch_activate(v3);
  *((void *)this + 1) = 0;
  *((void *)this + 2) = 0;
  *((void *)this + 3) = v3;
  if (v3)
  {
    dispatch_retain(v3);
    *((void *)this + 4) = 0;
    dispatch_release(v3);
  }
  else
  {
    *((void *)this + 4) = 0;
  }
  ctu::OsLogLogger::OsLogLogger();
  ctu::OsLogLogger::OsLogLogger((BasebandCrashReasonFilter *)((char *)this + 40), (const ctu::OsLogLogger *)v14);
  MEMORY[0x1C8794100](v14);
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)&v12);
  *(void *)this = &unk_1F2112100;
  *((_OWORD *)this + 3) = 0u;
  uint64_t v4 = (void **)((char *)this + 48);
  *((_OWORD *)this + 4) = 0u;
  *((_OWORD *)this + 5) = 0u;
  uint64_t v5 = *((void *)this + 5);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v12) = 0;
    _os_log_impl(&dword_1C59C6000, v5, OS_LOG_TYPE_DEFAULT, "#I initializing baseband crash reason patterns and masks from preferences file", (uint8_t *)&v12, 2u);
  }
  BasebandCrashReasonFilter::readBasebandCrashReasonPatternsFromPreferences(this, &v12);
  unint64_t v6 = (void **)*v4;
  if (*v4)
  {
    uint64_t v7 = (void **)*((void *)this + 7);
    uint64_t v8 = *v4;
    if (v7 != v6)
    {
      do
      {
        if (*((char *)v7 - 9) < 0) {
          operator delete(*(v7 - 4));
        }
        v7 -= 4;
      }
      while (v7 != v6);
      uint64_t v8 = *v4;
    }
    *((void *)this + 7) = v6;
    operator delete(v8);
    unsigned char *v4 = 0;
    *((void *)this + 7) = 0;
    *((void *)this + 8) = 0;
  }
  unint64_t v9 = v12;
  *((void *)this + 6) = v12;
  unint64_t v10 = (void *)v13;
  *(_OWORD *)((char *)this + 56) = v13;
  if (v10 == v9)
  {
    uint8x8_t v11 = *((void *)this + 5);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v12) = 0;
      _os_log_impl(&dword_1C59C6000, v11, OS_LOG_TYPE_DEFAULT, "#I default pattern masks for baseband crash reason patterns and masks will be used", (uint8_t *)&v12, 2u);
    }
    std::vector<ResetInfo::RegexPatternAndReasonMask>::__assign_with_size[abi:ne180100]<ResetInfo::RegexPatternAndReasonMask*,ResetInfo::RegexPatternAndReasonMask*>((void **)this + 6, *((void ***)this + 9), *((char **)this + 10), (uint64_t)(*((void *)this + 10) - *((void *)this + 9)) >> 5);
  }
}

void sub_1C5BB34D8(_Unwind_Exception *a1)
{
  std::vector<ResetInfo::RegexPatternAndReasonMask>::~vector[abi:ne180100]((void **)(v1 + 72));
  std::vector<ResetInfo::RegexPatternAndReasonMask>::~vector[abi:ne180100](v3);
  ctu::SharedLoggable<AccessoriesDelegateBase,ctu::OsLogLogger>::~SharedLoggable(v2);
  _Unwind_Resume(a1);
}

void BasebandCrashReasonFilter::readBasebandCrashReasonPatternsFromPreferences(BasebandCrashReasonFilter *this@<X0>, void **a2@<X8>)
{
  CFArrayRef v20 = 0;
  CFTypeRef cf = 0;
  a2[1] = 0;
  a2[2] = 0;
  *a2 = 0;
  pthread_mutex_lock(&ctu::Singleton<ABMProperties,ABMProperties,ctu::PthreadMutexGuardPolicy<ABMProperties>>::sInstance);
  if (!qword_1EBBDC7D8)
  {
    uint64_t v5 = (uint64_t (***)(void, uint64_t))operator new(0x18uLL);
    MEMORY[0x1C87942F0](v5, @"com.apple.AppleBasebandManager", *MEMORY[0x1E4F1D3F0]);
    uint64_t v4 = operator new(0x20uLL);
    void *v4 = &unk_1F210A638;
    v4[1] = 0;
    v4[2] = 0;
    v4[3] = v5;
    unint64_t v6 = (std::__shared_weak_count *)off_1EBBDC7E0;
    qword_1EBBDC7D8 = (uint64_t)v5;
    off_1EBBDC7E0 = v4;
    if (!v6)
    {
      uint64_t v17 = (uint64_t)v5;
      uint64_t v18 = (std::__shared_weak_count *)v4;
      goto LABEL_8;
    }
    if (!atomic_fetch_add(&v6->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
    }
  }
  uint64_t v5 = (uint64_t (***)(void, uint64_t))qword_1EBBDC7D8;
  uint64_t v4 = off_1EBBDC7E0;
  uint64_t v17 = qword_1EBBDC7D8;
  uint64_t v18 = (std::__shared_weak_count *)off_1EBBDC7E0;
  if (off_1EBBDC7E0) {
LABEL_8:
  }
    atomic_fetch_add_explicit(v4 + 1, 1uLL, memory_order_relaxed);
  pthread_mutex_unlock(&ctu::Singleton<ABMProperties,ABMProperties,ctu::PthreadMutexGuardPolicy<ABMProperties>>::sInstance);
  __p[0] = operator new(0x28uLL);
  *(_OWORD *)&__p[1] = xmmword_1C5BC6F90;
  strcpy((char *)__p[0], "BasebandCrashReasonRegexPatterns");
  BOOL v7 = Preferences::getPreference<__CFArray const*>(v5, (const char *)__p, &v20);
  if (v20) {
    BOOL v8 = v7;
  }
  else {
    BOOL v8 = 0;
  }
  if (SHIBYTE(__p[2]) < 0) {
    operator delete(__p[0]);
  }
  unint64_t v9 = v18;
  if (v18 && !atomic_fetch_add(&v18->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
    std::__shared_weak_count::__release_weak(v9);
    if (v8) {
      goto LABEL_17;
    }
  }
  else if (v8)
  {
LABEL_17:
    CFArrayRef v10 = v20;
    CFTypeRef v11 = cf;
    CFTypeRef cf = v20;
    if (v11) {
      CFRelease(v11);
    }
    CFArrayRef v15 = v10;
    if (v10) {
      CFRetain(v10);
    }
    BasebandCrashReasonFilter::convertBasebandCrashReasonPatternsFromCFSharedArrayToVector(&v15, __p);
    unint64_t v12 = (void **)*a2;
    if (*a2)
    {
      for (i = (void **)a2[1]; i != v12; i -= 4)
      {
        if (*((char *)i - 9) < 0) {
          operator delete(*(i - 4));
        }
      }
      operator delete(v12);
      *a2 = 0;
      a2[1] = 0;
      a2[2] = 0;
    }
    *(_OWORD *)a2 = *(_OWORD *)__p;
    a2[2] = __p[2];
    memset(__p, 0, 24);
    if (v10) {
      CFRelease(v10);
    }
    goto LABEL_33;
  }
  size_t v14 = *((void *)this + 5);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(__p[0]) = 0;
    _os_log_impl(&dword_1C59C6000, v14, OS_LOG_TYPE_DEFAULT, "#I no baseband crash reason patterns entry found in ABMProperties", (uint8_t *)__p, 2u);
  }
LABEL_33:
  if (cf) {
    CFRelease(cf);
  }
}

uint64_t BasebandCrashReasonFilter::shouldSetSCD(uint64_t a1, uint64_t a2)
{
  return ResetInfo::reasonMatchesAtLeastOneApplicablePattern(2, a2, (long long **)(a1 + 48));
}

uint64_t BasebandCrashReasonFilter::shouldSetCOF(uint64_t a1, uint64_t a2)
{
  return ResetInfo::reasonMatchesAtLeastOneApplicablePattern(4, a2, (long long **)(a1 + 48));
}

uint64_t BasebandCrashReasonFilter::readBasebandCrashReasonPatternsFromFactoryFile@<X0>(void *a1@<X8>)
{
  memset(v10, 170, sizeof(v10));
  MEMORY[0x1C87942F0](v10, @"/AppleInternal/Cellular/Factory/BasebandCOFSCD.plist", *MEMORY[0x1E4F1D3F0]);
  CFArrayRef v9 = 0;
  a1[1] = 0;
  a1[2] = 0;
  *a1 = 0;
  ctu::cf::MakeCFString::MakeCFString((ctu::cf::MakeCFString *)v7, "BasebandCrashReasonRegexPatterns");
  CFArrayRef v3 = (const __CFArray *)ctu::cf::map_adapter::copyCFArrayRef((ctu::cf::map_adapter *)v10, v7[0]);
  MEMORY[0x1C8794290](v7);
  CFArrayRef v9 = v3;
  CFArrayRef v6 = v3;
  if (v3) {
    CFRetain(v3);
  }
  BasebandCrashReasonFilter::convertBasebandCrashReasonPatternsFromCFSharedArrayToVector(&v6, (void **)v7);
  uint64_t v4 = v8;
  *(_OWORD *)a1 = *(_OWORD *)v7;
  a1[2] = v4;
  v7[1] = 0;
  uint64_t v8 = 0;
  v7[0] = 0;
  if (v3)
  {
    CFRelease(v3);
    CFRelease(v3);
  }
  return MEMORY[0x1C8794300](v10);
}

void sub_1C5BB39B8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va1, a2);
  va_start(va, a2);
  uint64_t v5 = va_arg(va1, const void *);
  uint64_t v7 = va_arg(va1, void);
  uint64_t v8 = va_arg(va1, void);
  uint64_t v9 = va_arg(va1, void);
  uint64_t v10 = va_arg(va1, void);
  ctu::cf::CFSharedRef<__CFArray const>::~CFSharedRef((const void **)va);
  std::vector<ResetInfo::RegexPatternAndReasonMask>::~vector[abi:ne180100](v2);
  ctu::cf::CFSharedRef<__CFArray const>::~CFSharedRef((const void **)va1);
  MEMORY[0x1C8794300](v3 - 40);
  _Unwind_Resume(a1);
}

void BasebandCrashReasonFilter::convertBasebandCrashReasonPatternsFromCFSharedArrayToVector(CFArrayRef *a1@<X1>, void **a2@<X8>)
{
  *a2 = 0;
  a2[1] = 0;
  a2[2] = 0;
  if (!*a1) {
    return;
  }
  uint64_t v2 = a1;
  unint64_t Count = CFArrayGetCount(*a1);
  uint64_t v4 = a2;
  uint64_t v5 = (void **)*a2;
  if (Count > ((unsigned char *)a2[2] - (unsigned char *)*a2) >> 5)
  {
    CFArrayRef v6 = (void **)a2[1];
    uint64_t v7 = (char *)operator new(32 * Count);
    uint64_t v8 = &v7[32 * Count];
    uint64_t v9 = &v7[(char *)v6 - (char *)v5];
    if (v6 == v5)
    {
      uint64_t v4 = a2;
      *a2 = v9;
      a2[1] = v9;
      a2[2] = v8;
      if (v5) {
LABEL_12:
      }
        operator delete(v5);
    }
    else
    {
      uint64_t v10 = &v7[(char *)v6 - (char *)v5];
      do
      {
        long long v11 = *((_OWORD *)v6 - 2);
        *((void *)v10 - 2) = *(v6 - 2);
        *((_OWORD *)v10 - 2) = v11;
        *(v6 - 3) = 0;
        *(v6 - 2) = 0;
        *(v6 - 4) = 0;
        *((_DWORD *)v10 - 2) = *((_DWORD *)v6 - 2);
        v10 -= 32;
        v6 -= 4;
      }
      while (v6 != v5);
      uint64_t v5 = (void **)*a2;
      unint64_t v12 = (void **)a2[1];
      *a2 = v10;
      a2[1] = v9;
      a2[2] = v8;
      while (v12 != v5)
      {
        if (*((char *)v12 - 9) < 0) {
          operator delete(*(v12 - 4));
        }
        v12 -= 4;
      }
      uint64_t v4 = a2;
      if (v5) {
        goto LABEL_12;
      }
    }
  }
  if (Count)
  {
    for (CFIndex i = 0; i != Count; ++i)
    {
      ValueAtIndex = CFArrayGetValueAtIndex(*v2, i);
      CFArrayRef v15 = ValueAtIndex;
      if (ValueAtIndex && (CFTypeID v16 = CFGetTypeID(ValueAtIndex), v16 == CFDictionaryGetTypeID()))
      {
        xpc_object_t v40 = v15;
        CFRetain(v15);
      }
      else
      {
        CFArrayRef v15 = 0;
        xpc_object_t v40 = 0;
      }
      v39[0] = 0xAAAAAAAAAAAAAAAALL;
      v39[1] = 0xAAAAAAAAAAAAAAAALL;
      ctu::cf::dict_adapter::dict_adapter((ctu::cf::dict_adapter *)v39, (const __CFDictionary *)v15);
      memset(&v38, 170, sizeof(v38));
      memset(&__p, 0, sizeof(__p));
      ctu::cf::MakeCFString::MakeCFString((ctu::cf::MakeCFString *)&v41, "BasebandCrashReasonRegexPattern");
      ctu::cf::map_adapter::getString();
      MEMORY[0x1C8794290](&v41);
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(__p.__r_.__value_.__l.__data_);
      }
      ctu::cf::MakeCFString::MakeCFString((ctu::cf::MakeCFString *)&__p, "BasebandCrashReasonRegexPatternMask");
      int Int = ctu::cf::map_adapter::getInt((ctu::cf::map_adapter *)v39, (const __CFString *)__p.__r_.__value_.__l.__data_);
      MEMORY[0x1C8794290](&__p);
      if (SHIBYTE(v38.__r_.__value_.__r.__words[2]) < 0) {
        std::string::__init_copy_ctor_external(&__p, v38.__r_.__value_.__l.__data_, v38.__r_.__value_.__l.__size_);
      }
      else {
        std::string __p = v38;
      }
      int v37 = Int;
      uint64_t v19 = (void **)v4[1];
      unint64_t v18 = (unint64_t)v4[2];
      if ((unint64_t)v19 < v18)
      {
        long long v20 = *(_OWORD *)&__p.__r_.__value_.__l.__data_;
        v19[2] = (void *)__p.__r_.__value_.__r.__words[2];
        *(_OWORD *)uint64_t v19 = v20;
        memset(&__p, 0, sizeof(__p));
        *((_DWORD *)v19 + 6) = v37;
        v4[1] = v19 + 4;
        if ((SHIBYTE(v38.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
          goto LABEL_42;
        }
        goto LABEL_50;
      }
      unint64_t v21 = Count;
      uint64_t v22 = (void **)*v4;
      uint64_t v23 = ((char *)v19 - (char *)v22) >> 5;
      unint64_t v24 = v23 + 1;
      if ((unint64_t)(v23 + 1) >> 59) {
        std::vector<dispatch::callback<void({block_pointer})(sar::OBDState,sar::TunerState)>>::__throw_length_error[abi:ne180100]();
      }
      int v25 = v2;
      uint64_t v26 = v18 - (void)v22;
      if (v26 >> 4 > v24) {
        unint64_t v24 = v26 >> 4;
      }
      if ((unint64_t)v26 >= 0x7FFFFFFFFFFFFFE0) {
        unint64_t v27 = 0x7FFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v27 = v24;
      }
      if (v27 >> 59) {
        std::__throw_bad_array_new_length[abi:ne180100]();
      }
      xpc_object_t v28 = (char *)operator new(32 * v27);
      float v29 = &v28[32 * v23];
      *(std::string *)float v29 = __p;
      float v30 = &v28[32 * v27];
      memset(&__p, 0, sizeof(__p));
      *((_DWORD *)v29 + 6) = Int;
      BOOL v31 = v29 + 32;
      if (v19 == v22)
      {
        uint64_t v4 = a2;
        *a2 = v29;
        a2[1] = v31;
        a2[2] = v30;
        uint64_t v2 = v25;
        unint64_t Count = v21;
        if (v19) {
          goto LABEL_39;
        }
      }
      else
      {
        do
        {
          long long v32 = *((_OWORD *)v19 - 2);
          *((void *)v29 - 2) = *(v19 - 2);
          *((_OWORD *)v29 - 2) = v32;
          *(v19 - 3) = 0;
          *(v19 - 2) = 0;
          *(v19 - 4) = 0;
          *((_DWORD *)v29 - 2) = *((_DWORD *)v19 - 2);
          v29 -= 32;
          v19 -= 4;
        }
        while (v19 != v22);
        uint64_t v19 = (void **)*a2;
        unint64_t v33 = (void **)a2[1];
        *a2 = v29;
        a2[1] = v31;
        a2[2] = v30;
        uint64_t v2 = v25;
        for (unint64_t Count = v21; v33 != v19; v33 -= 4)
        {
          if (*((char *)v33 - 9) < 0) {
            operator delete(*(v33 - 4));
          }
        }
        uint64_t v4 = a2;
        if (v19) {
LABEL_39:
        }
          operator delete(v19);
      }
      int v34 = SHIBYTE(__p.__r_.__value_.__r.__words[2]);
      v4[1] = v31;
      if (v34 < 0)
      {
        operator delete(__p.__r_.__value_.__l.__data_);
        if ((SHIBYTE(v38.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
        {
LABEL_42:
          MEMORY[0x1C87942E0](v39);
          if (!v15) {
            continue;
          }
LABEL_51:
          CFRelease(v15);
          continue;
        }
      }
      else if ((SHIBYTE(v38.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
      {
        goto LABEL_42;
      }
LABEL_50:
      operator delete(v38.__r_.__value_.__l.__data_);
      MEMORY[0x1C87942E0](v39);
      if (v15) {
        goto LABEL_51;
      }
    }
  }
}

void sub_1C5BB3E24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void **a10)
{
}

void sub_1C5BB3E3C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void **a10, void *a11, uint64_t a12, int a13, __int16 a14, char a15, char a16, uint64_t a17, uint64_t a18, void *__p, uint64_t a20,int a21,__int16 a22,char a23,char a24,char a25,uint64_t a26,const void *a27)
{
  if (a24 < 0) {
    operator delete(__p);
  }
  MEMORY[0x1C87942E0](&a25);
  ctu::cf::CFSharedRef<__CFDictionary const>::~CFSharedRef(&a27);
  std::vector<ResetInfo::RegexPatternAndReasonMask>::~vector[abi:ne180100](a10);
  _Unwind_Resume(a1);
}

void sub_1C5BB3ED4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void **a10)
{
}

void *std::shared_ptr<BasebandCrashReasonFilter>::shared_ptr[abi:ne180100]<BasebandCrashReasonFilter,std::shared_ptr<BasebandCrashReasonFilter> ctu::SharedSynchronizable<BasebandCrashReasonFilter>::make_shared_ptr<BasebandCrashReasonFilter>(BasebandCrashReasonFilter*)::{lambda(BasebandCrashReasonFilter*)#1},void>(void *a1, uint64_t a2)
{
  *a1 = a2;
  uint64_t v4 = (std::__shared_weak_count *)operator new(0x20uLL);
  v4->__shared_owners_ = 0;
  p_shared_owners = &v4->__shared_owners_;
  v4->__vftable = (std::__shared_weak_count_vtbl *)&unk_1F21121B8;
  v4->__shared_weak_owners_ = 0;
  v4[1].__vftable = (std::__shared_weak_count_vtbl *)a2;
  a1[1] = v4;
  if (!a2) {
    return a1;
  }
  CFArrayRef v6 = *(std::__shared_weak_count **)(a2 + 16);
  if (v6)
  {
    if (v6->__shared_owners_ == -1)
    {
      atomic_fetch_add_explicit(&v4->__shared_owners_, 1uLL, memory_order_relaxed);
      atomic_fetch_add_explicit(&v4->__shared_weak_owners_, 1uLL, memory_order_relaxed);
      *(void *)(a2 + 8) = a2;
      *(void *)(a2 + 16) = v4;
      std::__shared_weak_count::__release_weak(v6);
      if (!atomic_fetch_add(p_shared_owners, 0xFFFFFFFFFFFFFFFFLL)) {
        goto LABEL_8;
      }
    }
    return a1;
  }
  atomic_fetch_add_explicit(&v4->__shared_owners_, 1uLL, memory_order_relaxed);
  atomic_fetch_add_explicit(&v4->__shared_weak_owners_, 1uLL, memory_order_relaxed);
  *(void *)(a2 + 8) = a2;
  *(void *)(a2 + 16) = v4;
  if (atomic_fetch_add(p_shared_owners, 0xFFFFFFFFFFFFFFFFLL)) {
    return a1;
  }
LABEL_8:
  ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
  std::__shared_weak_count::__release_weak(v4);
  return a1;
}

void sub_1C5BB4000(void *a1)
{
  __cxa_begin_catch(a1);
  dispatch_barrier_async_f(v1[3], v1, (dispatch_function_t)std::shared_ptr<BasebandCrashReasonFilter> ctu::SharedSynchronizable<BasebandCrashReasonFilter>::make_shared_ptr<BasebandCrashReasonFilter>(BasebandCrashReasonFilter*)::{lambda(BasebandCrashReasonFilter*)#1}::operator() const(BasebandCrashReasonFilter*)::{lambda(void *)#1}::__invoke);
  __cxa_rethrow();
}

void sub_1C5BB4028(_Unwind_Exception *a1)
{
}

void std::__shared_ptr_pointer<BasebandCrashReasonFilter *,std::shared_ptr<BasebandCrashReasonFilter> ctu::SharedSynchronizable<BasebandCrashReasonFilter>::make_shared_ptr<BasebandCrashReasonFilter>(BasebandCrashReasonFilter*)::{lambda(BasebandCrashReasonFilter *)#1},std::allocator<BasebandCrashReasonFilter>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);

  operator delete(v1);
}

void std::__shared_ptr_pointer<BasebandCrashReasonFilter *,std::shared_ptr<BasebandCrashReasonFilter> ctu::SharedSynchronizable<BasebandCrashReasonFilter>::make_shared_ptr<BasebandCrashReasonFilter>(BasebandCrashReasonFilter*)::{lambda(BasebandCrashReasonFilter *)#1},std::allocator<BasebandCrashReasonFilter>>::__on_zero_shared(uint64_t a1)
{
}

uint64_t std::__shared_ptr_pointer<BasebandCrashReasonFilter *,std::shared_ptr<BasebandCrashReasonFilter> ctu::SharedSynchronizable<BasebandCrashReasonFilter>::make_shared_ptr<BasebandCrashReasonFilter>(BasebandCrashReasonFilter*)::{lambda(BasebandCrashReasonFilter *)#1},std::allocator<BasebandCrashReasonFilter>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = *(void *)(a2 + 8);
  if ((char *)v3 == "ZN3ctu20SharedSynchronizableI25BasebandCrashReasonFilterE15make_shared_ptrIS1_EENSt3__110shared_ptr"
                     "IT_EEPS6_EUlPS1_E_")
    return a1 + 24;
  if (((v3 & (unint64_t)"ZN3ctu20SharedSynchronizableI25BasebandCrashReasonFilterE15make_shared_ptrIS1_EENSt3__11"
                                "0shared_ptrIT_EEPS6_EUlPS1_E_" & 0x8000000000000000) != 0) == __OFSUB__(v3, "ZN3ctu20SharedSynchronizableI25BasebandCrashReasonFilterE15make_shared_ptrIS1_EENSt3__110shared_ptrIT_EEPS6_EUlPS1_E_"))return 0;
  if (!strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)((unint64_t)"ZN3ctu20SharedSynchronizableI25BasebandCrashReasonFilterE15make_shared_ptrIS1_EENSt3__110shared_ptrIT_EEPS6_EUlPS1_E_" & 0x7FFFFFFFFFFFFFFFLL)))return a1 + 24; {
  return 0;
  }
}

uint64_t std::shared_ptr<BasebandCrashReasonFilter> ctu::SharedSynchronizable<BasebandCrashReasonFilter>::make_shared_ptr<BasebandCrashReasonFilter>(BasebandCrashReasonFilter*)::{lambda(BasebandCrashReasonFilter*)#1}::operator() const(BasebandCrashReasonFilter*)::{lambda(void *)#1}::__invoke(uint64_t result)
{
  if (result) {
    return (*(uint64_t (**)(void))(*(void *)result + 8))();
  }
  return result;
}

uint64_t __cxx_global_var_init_24()
{
  {
    return __cxa_atexit((void (*)(void *))ctu::PthreadMutexGuardPolicy<ABMProperties>::~PthreadMutexGuardPolicy, &ctu::Singleton<ABMProperties,ABMProperties,ctu::PthreadMutexGuardPolicy<ABMProperties>>::sInstance, &dword_1C59C6000);
  }
  return result;
}

void HandDetectionManager::create(char *a1@<X0>, NSObject **a2@<X1>, NSObject **a3@<X2>, uint64_t *a4@<X3>, uint64_t *a5@<X4>, uint64_t *a6@<X5>, HandDetectionManager **a7@<X8>)
{
  std::string v38 = (HandDetectionManager *)0xAAAAAAAAAAAAAAAALL;
  unint64_t v39 = 0xAAAAAAAAAAAAAAAALL;
  size_t v14 = (HandDetectionManager *)operator new(0xA0uLL);
  CFArrayRef v15 = *a2;
  dispatch_object_t v37 = v15;
  if (v15) {
    dispatch_retain(v15);
  }
  CFTypeID v16 = *a3;
  dispatch_object_t object = v16;
  if (v16) {
    dispatch_retain(v16);
  }
  uint64_t v17 = (std::__shared_weak_count *)a4[1];
  uint64_t v34 = *a4;
  int8x8_t v35 = v17;
  if (v17) {
    atomic_fetch_add_explicit(&v17->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  unint64_t v18 = (std::__shared_weak_count *)a5[1];
  uint64_t v32 = *a5;
  unint64_t v33 = v18;
  if (v18) {
    atomic_fetch_add_explicit(&v18->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  uint64_t v19 = *a6;
  long long v20 = (std::__shared_weak_count *)a6[1];
  v31[0] = v19;
  v31[1] = v20;
  if (v20) {
    atomic_fetch_add_explicit(&v20->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  HandDetectionManager::HandDetectionManager((uint64_t)v14, a1, &v37, &object, &v34, &v32, v31);
  std::string v38 = v14;
  *(void *)std::string buf = v14;
  unint64_t v21 = (std::__shared_weak_count *)operator new(0x20uLL);
  v21->__shared_owners_ = 0;
  p_shared_owners = &v21->__shared_owners_;
  v21->__vftable = (std::__shared_weak_count_vtbl *)&unk_1F21122C8;
  v21->__shared_weak_owners_ = 0;
  v21[1].__vftable = (std::__shared_weak_count_vtbl *)v14;
  unint64_t v39 = (unint64_t)v21;
  *(void *)std::string buf = 0;
  uint64_t v23 = (std::__shared_weak_count *)*((void *)v14 + 2);
  if (!v23)
  {
    atomic_fetch_add_explicit(&v21->__shared_owners_, 1uLL, memory_order_relaxed);
    atomic_fetch_add_explicit(&v21->__shared_weak_owners_, 1uLL, memory_order_relaxed);
    *((void *)v14 + 1) = v14;
    *((void *)v14 + 2) = v21;
    if (atomic_fetch_add(p_shared_owners, 0xFFFFFFFFFFFFFFFFLL)) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }
  if (v23->__shared_owners_ == -1)
  {
    atomic_fetch_add_explicit(&v21->__shared_owners_, 1uLL, memory_order_relaxed);
    atomic_fetch_add_explicit(&v21->__shared_weak_owners_, 1uLL, memory_order_relaxed);
    *((void *)v14 + 1) = v14;
    *((void *)v14 + 2) = v21;
    std::__shared_weak_count::__release_weak(v23);
    if (!atomic_fetch_add(p_shared_owners, 0xFFFFFFFFFFFFFFFFLL))
    {
LABEL_16:
      ((void (*)(std::__shared_weak_count *))v21->__on_zero_shared)(v21);
      std::__shared_weak_count::__release_weak(v21);
    }
  }
LABEL_17:
  if (*(void *)buf)
  {
    HandDetectionManager::~HandDetectionManager(*(HandDetectionManager **)buf);
    operator delete(v24);
  }
  if (v20 && !atomic_fetch_add(&v20->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v20->__on_zero_shared)(v20);
    std::__shared_weak_count::__release_weak(v20);
  }
  int v25 = v33;
  if (v33 && !atomic_fetch_add(&v33->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v25->__on_zero_shared)(v25);
    std::__shared_weak_count::__release_weak(v25);
  }
  uint64_t v26 = v35;
  if (v35 && !atomic_fetch_add(&v35->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v26->__on_zero_shared)(v26);
    std::__shared_weak_count::__release_weak(v26);
  }
  if (object) {
    dispatch_release(object);
  }
  if (v37) {
    dispatch_release(v37);
  }
  unint64_t v27 = v38;
  if (v38 && (HandDetectionManager::init(v38) & 1) != 0)
  {
    unint64_t v28 = v39;
    *a7 = v27;
    a7[1] = (HandDetectionManager *)v28;
    return;
  }
  float v29 = GetOsLogContext()[1];
  if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)std::string buf = 0;
    _os_log_error_impl(&dword_1C59C6000, v29, OS_LOG_TYPE_ERROR, "Failed to create Power Source Manager!", buf, 2u);
    *a7 = 0;
    a7[1] = 0;
    float v30 = (std::__shared_weak_count *)v39;
    if (!v39) {
      return;
    }
  }
  else
  {
    *a7 = 0;
    a7[1] = 0;
    float v30 = (std::__shared_weak_count *)v39;
    if (!v39) {
      return;
    }
  }
  if (!atomic_fetch_add(&v30->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v30->__on_zero_shared)(v30);
    std::__shared_weak_count::__release_weak(v30);
  }
}

void sub_1C5BB44EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  std::shared_ptr<Registry>::~shared_ptr[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_1C5BB4504(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, char a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, HandDetectionManager *a19)
{
  std::unique_ptr<HandDetectionManager>::~unique_ptr[abi:ne180100](&a19);
  std::shared_ptr<Registry>::~shared_ptr[abi:ne180100]((uint64_t)&a9);
  std::shared_ptr<Registry>::~shared_ptr[abi:ne180100]((uint64_t)&a11);
  std::shared_ptr<Registry>::~shared_ptr[abi:ne180100]((uint64_t)&a13);
  if (v20)
  {
    dispatch_release(v20);
    if (!v19) {
LABEL_6:
    }
      _Unwind_Resume(a1);
  }
  else if (!v19)
  {
    goto LABEL_6;
  }
  dispatch_release(v19);
  goto LABEL_6;
}

uint64_t HandDetectionManager::init(HandDetectionManager *this)
{
  uint64_t v3 = *((void *)this + 1);
  uint64_t v2 = (std::__shared_weak_count *)*((void *)this + 2);
  if (v2) {
    atomic_fetch_add_explicit(&v2->__shared_weak_owners_, 1uLL, memory_order_relaxed);
  }
  if (!*((void *)this + 6))
  {
    uint64_t v10 = *(NSObject **)this;
    if (!os_log_type_enabled(*(os_log_t *)this, OS_LOG_TYPE_ERROR)) {
      goto LABEL_23;
    }
    *(_WORD *)std::string buf = 0;
    long long v11 = "Failed to create hand detection manager";
    goto LABEL_22;
  }
  if (!*((void *)this + 9))
  {
    uint64_t v10 = *(NSObject **)this;
    if (!os_log_type_enabled(*(os_log_t *)this, OS_LOG_TYPE_ERROR)) {
      goto LABEL_23;
    }
    *(_WORD *)std::string buf = 0;
    long long v11 = "Failed to create audio manager";
    goto LABEL_22;
  }
  if (!*((void *)this + 12))
  {
    uint64_t v10 = *(NSObject **)this;
    if (!os_log_type_enabled(*(os_log_t *)this, OS_LOG_TYPE_ERROR)) {
      goto LABEL_23;
    }
    *(_WORD *)std::string buf = 0;
    long long v11 = "Failed to create proximity sensor instance";
LABEL_22:
    _os_log_error_impl(&dword_1C59C6000, v10, OS_LOG_TYPE_ERROR, v11, buf, 2u);
LABEL_23:
    uint64_t v12 = 0;
    if (!v2) {
      return v12;
    }
LABEL_24:
    std::__shared_weak_count::__release_weak(v2);
    return v12;
  }
  uint64_t v4 = (void *)*((void *)this + 15);
  if (v4)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 1174405120;
    aBlock[2] = ___ZN20HandDetectionManager4initEv_block_invoke;
    aBlock[3] = &__block_descriptor_tmp_44;
    aBlock[4] = this;
    aBlock[5] = v3;
    uint64_t v34 = v2;
    if (v2) {
      atomic_fetch_add_explicit(&v2->__shared_weak_owners_, 1uLL, memory_order_relaxed);
    }
    uint64_t v5 = _Block_copy(aBlock);
    CFArrayRef v6 = *((void *)this + 18);
    if (v6) {
      dispatch_retain(*((dispatch_object_t *)this + 18));
    }
    int8x8_t v35 = v5;
    dispatch_object_t v36 = v6;
    uint64_t v7 = (void *)v4[4];
    if ((unint64_t)v7 >= v4[5])
    {
      uint64_t v9 = std::vector<dispatch::callback<void({block_pointer})(CMOnBodyDelegate::CMOnBodyResult,CMOnBodyDelegate::CMOnBodyResultConfidence)>>::__push_back_slow_path<dispatch::callback<void({block_pointer})(CMOnBodyDelegate::CMOnBodyResult,CMOnBodyDelegate::CMOnBodyResultConfidence)> const&>(v4 + 3, (uint64_t)&v35);
      goto LABEL_29;
    }
    if (v5)
    {
      uint64_t v8 = _Block_copy(v5);
      CFArrayRef v6 = v36;
      *uint64_t v7 = v8;
      v7[1] = v6;
      if (!v6)
      {
LABEL_15:
        uint64_t v9 = v7 + 2;
LABEL_29:
        v4[4] = v9;
        if (v36) {
          dispatch_release(v36);
        }
        if (v35) {
          _Block_release(v35);
        }
        if (v34) {
          std::__shared_weak_count::__release_weak(v34);
        }
        goto LABEL_35;
      }
    }
    else
    {
      *uint64_t v7 = 0;
      v7[1] = v6;
      if (!v6) {
        goto LABEL_15;
      }
    }
    dispatch_retain(v6);
    goto LABEL_15;
  }
  size_t v14 = *(NSObject **)this;
  if (os_log_type_enabled(*(os_log_t *)this, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)std::string buf = 0;
    _os_log_error_impl(&dword_1C59C6000, v14, OS_LOG_TYPE_ERROR, "On-Body handler is not created", buf, 2u);
  }
LABEL_35:
  CFArrayRef v15 = (uint64_t **)*((void *)this + 6);
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 1174405120;
  v30[2] = ___ZN20HandDetectionManager4initEv_block_invoke_3;
  v30[3] = &__block_descriptor_tmp_7_4;
  v30[4] = this;
  v30[5] = v3;
  BOOL v31 = v2;
  if (v2) {
    atomic_fetch_add_explicit(&v2->__shared_weak_owners_, 1uLL, memory_order_relaxed);
  }
  CFTypeID v16 = _Block_copy(v30);
  uint64_t v32 = v16;
  CMHandDetectionDelegate::registerCallback(v15, &v32);
  if (v16) {
    _Block_release(v16);
  }
  uint64_t v17 = (void *)*((void *)this + 9);
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 1174405120;
  v26[2] = ___ZN20HandDetectionManager4initEv_block_invoke_8;
  v26[3] = &__block_descriptor_tmp_12_2;
  v26[4] = this;
  v26[5] = v3;
  unint64_t v27 = v2;
  if (v2) {
    atomic_fetch_add_explicit(&v2->__shared_weak_owners_, 1uLL, memory_order_relaxed);
  }
  unint64_t v18 = _Block_copy(v26);
  uint64_t v19 = *((void *)this + 18);
  if (v19) {
    dispatch_retain(*((dispatch_object_t *)this + 18));
  }
  unint64_t v28 = v18;
  dispatch_object_t object = v19;
  long long v20 = (void *)v17[9];
  if ((unint64_t)v20 < v17[10])
  {
    if (v18)
    {
      unint64_t v21 = _Block_copy(v18);
      uint64_t v19 = object;
      *long long v20 = v21;
      v20[1] = v19;
      if (!v19)
      {
LABEL_47:
        uint64_t v22 = v20 + 2;
        goto LABEL_49;
      }
    }
    else
    {
      *long long v20 = 0;
      v20[1] = v19;
      if (!v19) {
        goto LABEL_47;
      }
    }
    dispatch_retain(v19);
    goto LABEL_47;
  }
  uint64_t v22 = std::vector<dispatch::callback<void({block_pointer})(AudioManager::AudioOutputState)>>::__push_back_slow_path<dispatch::callback<void({block_pointer})(AudioManager::AudioOutputState)> const&>(v17 + 8, (uint64_t)&v28);
LABEL_49:
  v17[9] = v22;
  if (object) {
    dispatch_release(object);
  }
  if (v28) {
    _Block_release(v28);
  }
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 1174405120;
  v23[2] = ___ZN20HandDetectionManager4initEv_block_invoke_13;
  v23[3] = &__block_descriptor_tmp_19_1;
  v23[4] = this;
  v23[5] = v3;
  unint64_t v24 = v2;
  if (v2) {
    atomic_fetch_add_explicit(&v2->__shared_weak_owners_, 1uLL, memory_order_relaxed);
  }
  int v25 = _Block_copy(v23);
  ctu::iokit::IOHIDController::registerProxCallback();
  if (v25) {
    _Block_release(v25);
  }
  ctu::iokit::IOHIDController::start(*((ctu::iokit::IOHIDController **)this + 12));
  if (v24) {
    std::__shared_weak_count::__release_weak(v24);
  }
  if (v27) {
    std::__shared_weak_count::__release_weak(v27);
  }
  if (v31) {
    std::__shared_weak_count::__release_weak(v31);
  }
  uint64_t v12 = 1;
  if (v2) {
    goto LABEL_24;
  }
  return v12;
}

void sub_1C5BB49FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, std::__shared_weak_count *a15, void *aBlock, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,std::__shared_weak_count *a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,std::__shared_weak_count *a32)
{
  dispatch::callback<void({block_pointer})(CMOnBodyDelegate::CMOnBodyResult,CMOnBodyDelegate::CMOnBodyResultConfidence)>::~callback(v33 - 128);
  int8x8_t v35 = *(std::__shared_weak_count **)(v33 - 136);
  if (v35) {
    std::__shared_weak_count::__release_weak(v35);
  }
  if (v32) {
    std::__shared_weak_count::__release_weak(v32);
  }
  _Unwind_Resume(a1);
}

uint64_t HandDetectionManager::HandDetectionManager(uint64_t a1, char *__s, NSObject **a3, NSObject **a4, void *a5, void *a6, void *a7)
{
  size_t v14 = strlen(__s);
  if (v14 >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  std::string::size_type v15 = v14;
  if (v14 >= 0x17)
  {
    uint64_t v17 = (v14 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v14 | 7) != 0x17) {
      uint64_t v17 = v14 | 7;
    }
    uint64_t v18 = v17 + 1;
    p_dst = (std::string *)operator new(v17 + 1);
    __dst.__r_.__value_.__l.__size_ = v15;
    __dst.__r_.__value_.__r.__words[2] = v18 | 0x8000000000000000;
    __dst.__r_.__value_.__r.__words[0] = (std::string::size_type)p_dst;
    goto LABEL_8;
  }
  *((unsigned char *)&__dst.__r_.__value_.__s + 23) = v14;
  p_dst = &__dst;
  if (v14) {
LABEL_8:
  }
    memcpy(p_dst, __s, v15);
  p_dst->__r_.__value_.__s.__data_[v15] = 0;
  uint64_t v19 = std::string::append(&__dst, ".", 1uLL);
  long long v20 = *(_OWORD *)&v19->__r_.__value_.__l.__data_;
  v49.__r_.__value_.__r.__words[2] = v19->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v49.__r_.__value_.__l.__data_ = v20;
  v19->__r_.__value_.__l.__size_ = 0;
  v19->__r_.__value_.__r.__words[2] = 0;
  v19->__r_.__value_.__r.__words[0] = 0;
  unint64_t v21 = std::string::append(&v49, "HandDetectionManager", 0x14uLL);
  long long v22 = *(_OWORD *)&v21->__r_.__value_.__l.__data_;
  int64_t v51 = v21->__r_.__value_.__r.__words[2];
  *(_OWORD *)std::string __p = v22;
  v21->__r_.__value_.__l.__size_ = 0;
  v21->__r_.__value_.__r.__words[2] = 0;
  v21->__r_.__value_.__r.__words[0] = 0;
  if (v51 >= 0) {
    uint64_t v23 = __p;
  }
  else {
    uint64_t v23 = (void **)__p[0];
  }
  ctu::OsLogLogger::OsLogLogger((ctu::OsLogLogger *)a1, "com.apple.telephony.abm", (const char *)v23);
  if ((SHIBYTE(v51) & 0x80000000) == 0)
  {
    if ((SHIBYTE(v49.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
      goto LABEL_14;
    }
LABEL_58:
    operator delete(v49.__r_.__value_.__l.__data_);
    if ((SHIBYTE(__dst.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_59;
  }
  operator delete(__p[0]);
  if (SHIBYTE(v49.__r_.__value_.__r.__words[2]) < 0) {
    goto LABEL_58;
  }
LABEL_14:
  if ((SHIBYTE(__dst.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
    goto LABEL_15;
  }
LABEL_59:
  operator delete(__dst.__r_.__value_.__l.__data_);
LABEL_15:
  *(_OWORD *)(a1 + 24) = 0u;
  *(void *)(a1 + 40) = 0;
  *(_OWORD *)(a1 + 8) = 0u;
  unint64_t v24 = *a3;
  dispatch_object_t v47 = v24;
  if (v24) {
    dispatch_retain(v24);
  }
  int v25 = *a4;
  dispatch_object_t object = v25;
  if (v25) {
    dispatch_retain(v25);
  }
  CMHandDetectionDelegate::create(&v47, &object, (void *)(a1 + 48));
  if (object) {
    dispatch_release(object);
  }
  if (v47) {
    dispatch_release(v47);
  }
  *(void *)(a1 + 72) = *a5;
  uint64_t v27 = a5[1];
  *(void *)(a1 + 80) = v27;
  if (v27) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v27 + 8), 1uLL, memory_order_relaxed);
  }
  *(void *)(a1 + 96) = *a6;
  *(unsigned char *)(a1 + 88) = 0;
  uint64_t v28 = a6[1];
  *(void *)(a1 + 104) = v28;
  if (v28) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v28 + 8), 1uLL, memory_order_relaxed);
  }
  *(void *)(a1 + 120) = *a7;
  *(unsigned char *)(a1 + 112) = 0;
  uint64_t v29 = a7[1];
  *(void *)(a1 + 128) = v29;
  if (v29) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v29 + 8), 1uLL, memory_order_relaxed);
  }
  *(_DWORD *)(a1 + 136) = 1;
  float v30 = *a3;
  *(void *)(a1 + 144) = *a3;
  if (v30) {
    dispatch_retain(v30);
  }
  *(unsigned char *)(a1 + 152) = 0;
  if (!*(void *)(a1 + 72))
  {
    AudioManager::create((AudioManager *)__s, (AudioManager **)__p);
    long long v40 = *(_OWORD *)__p;
    __p[0] = 0;
    __p[1] = 0;
    uint64_t v41 = *(std::__shared_weak_count **)(a1 + 80);
    *(_OWORD *)(a1 + 72) = v40;
    if (v41 && !atomic_fetch_add(&v41->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v41->__on_zero_shared)(v41);
      std::__shared_weak_count::__release_weak(v41);
    }
    unint64_t v42 = (std::__shared_weak_count *)__p[1];
    if (__p[1] && !atomic_fetch_add((atomic_ullong *volatile)__p[1] + 1, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v42->__on_zero_shared)(v42);
      std::__shared_weak_count::__release_weak(v42);
    }
  }
  if (!*(void *)(a1 + 96))
  {
    BOOL v31 = *a3;
    dispatch_object_t v45 = v31;
    if (v31) {
      dispatch_retain(v31);
    }
    dispatch_object_t v44 = 0;
    ctu::iokit::IOHIDController::create();
    long long v32 = *(_OWORD *)__p;
    __p[0] = 0;
    __p[1] = 0;
    uint64_t v33 = *(std::__shared_weak_count **)(a1 + 104);
    *(_OWORD *)(a1 + 96) = v32;
    if (v33 && !atomic_fetch_add(&v33->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v33->__on_zero_shared)(v33);
      std::__shared_weak_count::__release_weak(v33);
    }
    uint64_t v34 = (std::__shared_weak_count *)__p[1];
    if (__p[1] && !atomic_fetch_add((atomic_ullong *volatile)__p[1] + 1, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v34->__on_zero_shared)(v34);
      std::__shared_weak_count::__release_weak(v34);
    }
    if (v44) {
      dispatch_release(v44);
    }
    if (v45) {
      dispatch_release(v45);
    }
  }
  if (!*(void *)(a1 + 120))
  {
    int8x8_t v35 = *a3;
    dispatch_object_t v43 = v35;
    if (v35) {
      dispatch_retain(v35);
    }
    CMOnBodyDelegate::create(&v43, v26, __p);
    long long v36 = *(_OWORD *)__p;
    __p[0] = 0;
    __p[1] = 0;
    dispatch_object_t v37 = *(std::__shared_weak_count **)(a1 + 128);
    *(_OWORD *)(a1 + 120) = v36;
    if (v37 && !atomic_fetch_add(&v37->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v37->__on_zero_shared)(v37);
      std::__shared_weak_count::__release_weak(v37);
    }
    std::string v38 = (std::__shared_weak_count *)__p[1];
    if (__p[1] && !atomic_fetch_add((atomic_ullong *volatile)__p[1] + 1, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v38->__on_zero_shared)(v38);
      std::__shared_weak_count::__release_weak(v38);
    }
    if (v43) {
      dispatch_release(v43);
    }
  }
  return a1;
}

void sub_1C5BB4FA4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, dispatch_object_t object, dispatch_object_t a10, dispatch_object_t a11, dispatch_object_t a12, dispatch_object_t a13)
{
  long long v20 = *(NSObject **)(v13 + 144);
  if (v20) {
    dispatch_release(v20);
  }
  std::shared_ptr<Registry>::~shared_ptr[abi:ne180100](v18);
  std::shared_ptr<Registry>::~shared_ptr[abi:ne180100](v17);
  std::shared_ptr<Registry>::~shared_ptr[abi:ne180100](v16);
  std::shared_ptr<Registry>::~shared_ptr[abi:ne180100](v15);
  std::vector<dispatch::callback<void({block_pointer})(CMHandDetectionDelegate::CMHandDetectionResult)>>::~vector[abi:ne180100](v14);
  unint64_t v21 = *(std::__shared_weak_count **)(v13 + 16);
  if (v21) {
    std::__shared_weak_count::__release_weak(v21);
  }
  MEMORY[0x1C8794100](v13);
  _Unwind_Resume(a1);
}

void sub_1C5BB5074(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, int a16, __int16 a17, char a18, char a19, void *a20,uint64_t a21,int a22,__int16 a23,char a24,char a25,uint64_t a26,void *__p,uint64_t a28,int a29,__int16 a30,char a31,char a32)
{
  if (a32 < 0)
  {
    operator delete(__p);
    if (a25 < 0)
    {
LABEL_5:
      operator delete(a20);
      if ((a19 & 0x80000000) == 0) {
LABEL_9:
      }
        _Unwind_Resume(a1);
LABEL_8:
      operator delete(a14);
      _Unwind_Resume(a1);
    }
  }
  else if (a25 < 0)
  {
    goto LABEL_5;
  }
  if ((a19 & 0x80000000) == 0) {
    goto LABEL_9;
  }
  goto LABEL_8;
}

void **std::vector<dispatch::callback<void({block_pointer})(CMHandDetectionDelegate::CMHandDetectionResult)>>::~vector[abi:ne180100](void **a1)
{
  uint64_t v2 = (char *)*a1;
  if (*a1)
  {
    uint64_t v3 = (char *)a1[1];
    uint64_t v4 = *a1;
    if (v3 != v2)
    {
      do
      {
        uint64_t v5 = *((void *)v3 - 1);
        if (v5) {
          dispatch_release(v5);
        }
        CFArrayRef v6 = (const void *)*((void *)v3 - 2);
        if (v6) {
          _Block_release(v6);
        }
        v3 -= 16;
      }
      while (v3 != v2);
      uint64_t v4 = *a1;
    }
    a1[1] = v2;
    operator delete(v4);
  }
  return a1;
}

void HandDetectionManager::~HandDetectionManager(HandDetectionManager *this)
{
  uint64_t v2 = *((void *)this + 3);
  for (uint64_t i = *((void *)this + 4); i != v2; i -= 16)
  {
    uint64_t v4 = *(NSObject **)(i - 8);
    if (v4) {
      dispatch_release(v4);
    }
    uint64_t v5 = *(const void **)(i - 16);
    if (v5) {
      _Block_release(v5);
    }
  }
  *((void *)this + 4) = v2;
  CFArrayRef v6 = (ctu::iokit::IOHIDController *)*((void *)this + 12);
  if (v6) {
    ctu::iokit::IOHIDController::stop(v6);
  }
  uint64_t v7 = (uint64_t **)*((void *)this + 6);
  if (v7)
  {
    uint64_t v19 = *v7;
    ctu::SharedSynchronizable<CMHandDetectionHandler>::execute_wrapped<CMHandDetectionHandler::stop(void)::{lambda(void)#1}>(v19, &v19);
    uint64_t v19 = (uint64_t *)**((void **)this + 6);
    ctu::SharedSynchronizable<CMHandDetectionHandler>::execute_wrapped<CMHandDetectionHandler::shutdown(void)::{lambda(void)#1}>(v19, &v19);
  }
  uint64_t v8 = *((void *)this + 18);
  if (v8) {
    dispatch_release(v8);
  }
  uint64_t v9 = (std::__shared_weak_count *)*((void *)this + 16);
  if (v9 && !atomic_fetch_add(&v9->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
    std::__shared_weak_count::__release_weak(v9);
  }
  uint64_t v10 = (std::__shared_weak_count *)*((void *)this + 13);
  if (v10 && !atomic_fetch_add(&v10->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
    std::__shared_weak_count::__release_weak(v10);
  }
  long long v11 = (std::__shared_weak_count *)*((void *)this + 10);
  if (v11 && !atomic_fetch_add(&v11->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
    std::__shared_weak_count::__release_weak(v11);
  }
  uint64_t v12 = (std::__shared_weak_count *)*((void *)this + 7);
  if (v12 && !atomic_fetch_add(&v12->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
    std::__shared_weak_count::__release_weak(v12);
    uint64_t v13 = (char *)*((void *)this + 3);
    if (!v13) {
      goto LABEL_35;
    }
  }
  else
  {
    uint64_t v13 = (char *)*((void *)this + 3);
    if (!v13) {
      goto LABEL_35;
    }
  }
  size_t v14 = (char *)*((void *)this + 4);
  uint64_t v15 = v13;
  if (v14 != v13)
  {
    do
    {
      uint64_t v16 = *((void *)v14 - 1);
      if (v16) {
        dispatch_release(v16);
      }
      uint64_t v17 = (const void *)*((void *)v14 - 2);
      if (v17) {
        _Block_release(v17);
      }
      v14 -= 16;
    }
    while (v14 != v13);
    uint64_t v15 = (char *)*((void *)this + 3);
  }
  *((void *)this + 4) = v13;
  operator delete(v15);
LABEL_35:
  uint64_t v18 = (std::__shared_weak_count *)*((void *)this + 2);
  if (v18) {
    std::__shared_weak_count::__release_weak(v18);
  }

  JUMPOUT(0x1C8794100);
}

void ___ZN20HandDetectionManager4initEv_block_invoke(void *a1, unsigned int a2, int a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (std::__shared_weak_count *)a1[6];
  if (v4)
  {
    uint64_t v7 = a1[4];
    uint64_t v8 = std::__shared_weak_count::lock(v4);
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = a1[5];
      if (!atomic_fetch_add(&v8->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
        std::__shared_weak_count::__release_weak(v9);
      }
      if (v10)
      {
        *(_DWORD *)(v7 + 136) = a2;
        long long v11 = *(NSObject **)v7;
        if (os_log_type_enabled(*(os_log_t *)v7, OS_LOG_TYPE_DEFAULT))
        {
          if (a2 > 2) {
            uint64_t v12 = "Unknown";
          }
          else {
            uint64_t v12 = off_1E651C6B8[a2];
          }
          uint64_t v13 = "Confidence Level Unknown";
          if (a3 == 1) {
            uint64_t v13 = "Confidence Level High";
          }
          if (!a3) {
            uint64_t v13 = "Confidence Level Low";
          }
          int v14 = 136315394;
          uint64_t v15 = v12;
          __int16 v16 = 2080;
          uint64_t v17 = v13;
          _os_log_impl(&dword_1C59C6000, v11, OS_LOG_TYPE_DEFAULT, "#I On Body Callback: OnBody: %s, confidence: %s", (uint8_t *)&v14, 0x16u);
        }
        HandDetectionManager::updateHandDetection((os_log_t *)v7);
      }
    }
  }
}

void HandDetectionManager::updateHandDetection(os_log_t *this)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *((char *)this + 88);
  if (v2 != 1 || *((_DWORD *)this + 34) != 1 || !*((unsigned char *)this + 112) || !*((unsigned char *)this + 152))
  {
    unsigned int v3 = 0;
    uint64_t v4 = *this;
    if (!os_log_type_enabled(*this, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_24;
    }
LABEL_8:
    if (v2 > 3) {
      uint64_t v5 = "Unknown Audio Output";
    }
    else {
      uint64_t v5 = off_1E651C6E8[v2];
    }
    CFArrayRef v6 = "On";
    if (*((unsigned char *)this + 112)) {
      uint64_t v7 = "On";
    }
    else {
      uint64_t v7 = "Off";
    }
    uint64_t v8 = *((int *)this + 34);
    if (v8 > 2)
    {
      uint64_t v9 = "Unknown";
      if (!*((unsigned char *)this + 152)) {
        CFArrayRef v6 = "Off";
      }
      if (v3 > 2) {
        goto LABEL_18;
      }
    }
    else
    {
      uint64_t v9 = off_1E651C6B8[v8];
      if (!*((unsigned char *)this + 152)) {
        CFArrayRef v6 = "Off";
      }
      if (v3 > 2)
      {
LABEL_18:
        uint64_t v10 = "Unknown Hand Detection";
LABEL_23:
        *(_DWORD *)uint64_t v18 = 136316162;
        *(void *)&v18[4] = v5;
        *(_WORD *)&v18[12] = 2080;
        *(void *)&v18[14] = v7;
        *(_WORD *)&v18[22] = 2080;
        uint64_t v19 = v9;
        *(_WORD *)aBlock = 2080;
        *(void *)&aBlock[2] = v6;
        *(_WORD *)&aBlock[10] = 2080;
        unint64_t v21 = v10;
        _os_log_impl(&dword_1C59C6000, v4, OS_LOG_TYPE_DEFAULT, "#I Audio State: %s, Proximity Sensor: %s, Motion State: %s, Tx State: %s -> Notifying Hand Detection: %s", v18, 0x34u);
        goto LABEL_24;
      }
    }
    uint64_t v10 = off_1E651C6D0[v3];
    goto LABEL_23;
  }
  unsigned int v3 = *((_DWORD *)this + 16);
  uint64_t v4 = *this;
  if (os_log_type_enabled(*this, OS_LOG_TYPE_DEFAULT)) {
    goto LABEL_8;
  }
LABEL_24:
  os_log_t v11 = this[3];
  os_log_t v12 = this[4];
  if (v11 != v12)
  {
    while (!v11->isa)
    {
      uint64_t v13 = 0;
      isa = v11[1].isa;
      if (isa) {
        goto LABEL_29;
      }
LABEL_30:
      if (!v13)
      {
        __int16 v16 = 0;
        *(void *)uint64_t v18 = MEMORY[0x1E4F143A8];
        *(void *)&v18[8] = 1174405120;
        *(void *)&v18[16] = ___ZNK8dispatch8callbackIU13block_pointerFvN23CMHandDetectionDelegate21CMHandDetectionResultEEEclIJS2_EEEvDpT__block_invoke;
        uint64_t v19 = (const char *)&__block_descriptor_tmp_27_3;
LABEL_36:
        uint64_t v17 = 0;
        goto LABEL_37;
      }
      uint64_t v15 = _Block_copy(v13);
      __int16 v16 = v15;
      *(void *)uint64_t v18 = MEMORY[0x1E4F143A8];
      *(void *)&v18[8] = 1174405120;
      *(void *)&v18[16] = ___ZNK8dispatch8callbackIU13block_pointerFvN23CMHandDetectionDelegate21CMHandDetectionResultEEEclIJS2_EEEvDpT__block_invoke;
      uint64_t v19 = (const char *)&__block_descriptor_tmp_27_3;
      if (!v15) {
        goto LABEL_36;
      }
      uint64_t v17 = _Block_copy(v15);
LABEL_37:
      *(void *)aBlock = v17;
      *(_DWORD *)&aBlock[8] = v3;
      dispatch_async(isa, v18);
      if (*(void *)aBlock) {
        _Block_release(*(const void **)aBlock);
      }
      if (v16) {
        _Block_release(v16);
      }
      if (isa) {
        dispatch_release(isa);
      }
      if (v13) {
        _Block_release(v13);
      }
      v11 += 2;
      if (v11 == v12) {
        return;
      }
    }
    uint64_t v13 = _Block_copy(v11->isa);
    isa = v11[1].isa;
    if (!isa) {
      goto LABEL_30;
    }
LABEL_29:
    dispatch_retain(isa);
    goto LABEL_30;
  }
}

void sub_1C5BB582C(_Unwind_Exception *a1, int a2)
{
  if (a2) {
    __clang_call_terminate(a1);
  }
  _Unwind_Resume(a1);
}

uint64_t __copy_helper_block_e8_40c45_ZTSNSt3__18weak_ptrI20HandDetectionManagerEE(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 48);
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(result + 48) = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 16), 1uLL, memory_order_relaxed);
  }
  return result;
}

void __destroy_helper_block_e8_40c45_ZTSNSt3__18weak_ptrI20HandDetectionManagerEE(uint64_t a1)
{
  uint64_t v1 = *(std::__shared_weak_count **)(a1 + 48);
  if (v1) {
    std::__shared_weak_count::__release_weak(v1);
  }
}

void ___ZN20HandDetectionManager4initEv_block_invoke_3(void *a1, unsigned int a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  unsigned int v3 = (std::__shared_weak_count *)a1[6];
  if (v3)
  {
    uint64_t v5 = a1[4];
    CFArrayRef v6 = std::__shared_weak_count::lock(v3);
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = a1[5];
      if (!atomic_fetch_add(&v6->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
        std::__shared_weak_count::__release_weak(v7);
      }
      if (v8)
      {
        uint64_t v9 = *(NSObject **)v5;
        if (os_log_type_enabled(*(os_log_t *)v5, OS_LOG_TYPE_DEFAULT))
        {
          if (a2 > 2) {
            uint64_t v10 = "Unknown Hand Detection";
          }
          else {
            uint64_t v10 = off_1E651C6D0[a2];
          }
          int v11 = 136315138;
          os_log_t v12 = v10;
          _os_log_impl(&dword_1C59C6000, v9, OS_LOG_TYPE_DEFAULT, "#I Hand Detection State: %s", (uint8_t *)&v11, 0xCu);
        }
        *(_DWORD *)(v5 + 64) = a2;
        HandDetectionManager::updateHandDetection((os_log_t *)v5);
      }
    }
  }
}

void ___ZN20HandDetectionManager4initEv_block_invoke_8(void *a1, unsigned int a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  unsigned int v3 = (std::__shared_weak_count *)a1[6];
  if (v3)
  {
    uint64_t v5 = a1[4];
    CFArrayRef v6 = std::__shared_weak_count::lock(v3);
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = a1[5];
      if (!atomic_fetch_add(&v6->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
        std::__shared_weak_count::__release_weak(v7);
      }
      if (v8)
      {
        *(unsigned char *)(v5 + 88) = a2;
        uint64_t v9 = *(NSObject **)v5;
        if (os_log_type_enabled(*(os_log_t *)v5, OS_LOG_TYPE_DEFAULT))
        {
          if (a2 > 3) {
            uint64_t v10 = "Unknown Audio Output";
          }
          else {
            uint64_t v10 = off_1E651C6E8[(char)a2];
          }
          int v11 = 136315138;
          os_log_t v12 = v10;
          _os_log_impl(&dword_1C59C6000, v9, OS_LOG_TYPE_DEFAULT, "#I Audio State: %s", (uint8_t *)&v11, 0xCu);
        }
        HandDetectionManager::updateHandDetection((os_log_t *)v5);
      }
    }
  }
}

uint64_t dispatch::callback<void({block_pointer})(AudioManager::AudioOutputState)>::~callback(uint64_t a1)
{
  uint64_t v2 = *(NSObject **)(a1 + 8);
  if (v2) {
    dispatch_release(v2);
  }
  if (*(void *)a1) {
    _Block_release(*(const void **)a1);
  }
  return a1;
}

void ___ZN20HandDetectionManager4initEv_block_invoke_13(void *a1, int a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  unsigned int v3 = (std::__shared_weak_count *)a1[6];
  if (v3)
  {
    uint64_t v5 = a1[4];
    CFArrayRef v6 = std::__shared_weak_count::lock(v3);
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = a1[5];
      if (!atomic_fetch_add(&v6->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
        std::__shared_weak_count::__release_weak(v7);
      }
      if (v8)
      {
        int isProxCovered = ctu::iokit::IOHIDController::isProxCovered(*(ctu::iokit::IOHIDController **)(v5 + 96));
        uint64_t v10 = *(NSObject **)v5;
        if (!os_log_type_enabled(*(os_log_t *)v5, OS_LOG_TYPE_DEBUG))
        {
          if (*(unsigned __int8 *)(v5 + 112) == isProxCovered) {
            return;
          }
          goto LABEL_8;
        }
        uint64_t v13 = "Off";
        if (isProxCovered) {
          uint64_t v13 = "On";
        }
        int v14 = 136315394;
        uint64_t v15 = v13;
        __int16 v16 = 1024;
        int v17 = a2;
        _os_log_debug_impl(&dword_1C59C6000, v10, OS_LOG_TYPE_DEBUG, "#D Received proximity information: %s (mask: 0x%x)", (uint8_t *)&v14, 0x12u);
        if (*(unsigned __int8 *)(v5 + 112) != isProxCovered)
        {
LABEL_8:
          *(unsigned char *)(v5 + 112) = isProxCovered;
          int v11 = *(NSObject **)v5;
          if (os_log_type_enabled(*(os_log_t *)v5, OS_LOG_TYPE_DEFAULT))
          {
            os_log_t v12 = "Off";
            if (isProxCovered) {
              os_log_t v12 = "On";
            }
            int v14 = 136315138;
            uint64_t v15 = v12;
            _os_log_impl(&dword_1C59C6000, v11, OS_LOG_TYPE_DEFAULT, "#I Proximity Sensor: %s", (uint8_t *)&v14, 0xCu);
          }
          HandDetectionManager::updateHandDetection((os_log_t *)v5);
        }
      }
    }
  }
}

void *HandDetectionManager::registerCallback(void *a1, void **a2)
{
  uint64_t v4 = (void *)a1[4];
  if ((unint64_t)v4 >= a1[5])
  {
    uint64_t result = std::vector<dispatch::callback<void({block_pointer})(CMHandDetectionDelegate::CMHandDetectionResult)>>::__push_back_slow_path<dispatch::callback<void({block_pointer})(CMHandDetectionDelegate::CMHandDetectionResult)> const&>(a1 + 3, (uint64_t)a2);
    a1[4] = result;
  }
  else
  {
    uint64_t v5 = *a2;
    if (*a2) {
      uint64_t v5 = _Block_copy(v5);
    }
    CFArrayRef v6 = a2[1];
    void *v4 = v5;
    v4[1] = v6;
    if (v6) {
      dispatch_retain(v6);
    }
    uint64_t result = v4 + 2;
    a1[4] = v4 + 2;
  }
  return result;
}

void HandDetectionManager::setMotionParameter(uint64_t a1, ctu **a2)
{
  if (!*(void *)(a1 + 120)) {
    goto LABEL_10;
  }
  ctu::xpc_to_cf((uint64_t *)&cf, *a2, a2);
  CFTypeRef v3 = cf;
  if (!cf || (CFTypeID v4 = CFGetTypeID(cf), v4 != CFDictionaryGetTypeID()))
  {
    CFTypeRef v3 = 0;
    CFTypeRef v7 = 0;
    CFTypeRef v5 = cf;
    if (!cf) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  CFTypeRef v7 = v3;
  CFRetain(v3);
  CFTypeRef v5 = cf;
  if (cf) {
LABEL_7:
  }
    CFRelease(v5);
LABEL_8:
  CMOnBodyDelegate::setThresholds(*(CMOnBodyDelegate **)(a1 + 120), v3);
  if (v3) {
    CFRelease(v3);
  }
LABEL_10:
  HandDetectionManager::updateHandDetection((os_log_t *)a1);
}

void sub_1C5BB5E38(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  ctu::cf::CFSharedRef<__CFDictionary const>::~CFSharedRef((const void **)va);
  _Unwind_Resume(a1);
}

void sub_1C5BB5E4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, const void *a9)
{
}

void HandDetectionManager::setTxState(HandDetectionManager *this, int a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  *((unsigned char *)this + 152) = a2;
  CFTypeID v4 = *(NSObject **)this;
  if (os_log_type_enabled(*(os_log_t *)this, OS_LOG_TYPE_DEBUG))
  {
    CFTypeRef v7 = "Off";
    if (a2) {
      CFTypeRef v7 = "On";
    }
    *(_DWORD *)uint64_t v9 = 136315138;
    *(void *)&v9[4] = v7;
    _os_log_debug_impl(&dword_1C59C6000, v4, OS_LOG_TYPE_DEBUG, "#D Tx is %s", v9, 0xCu);
    CFTypeRef v5 = (uint64_t **)*((void *)this + 6);
    if (v5) {
      goto LABEL_3;
    }
  }
  else
  {
    CFTypeRef v5 = (uint64_t **)*((void *)this + 6);
    if (v5)
    {
LABEL_3:
      CFArrayRef v6 = *v5;
      *(void *)uint64_t v9 = *v5;
      if (a2) {
        ctu::SharedSynchronizable<CMHandDetectionHandler>::execute_wrapped<CMHandDetectionHandler::start(void)::{lambda(void)#1}>(v6, v9);
      }
      else {
        ctu::SharedSynchronizable<CMHandDetectionHandler>::execute_wrapped<CMHandDetectionHandler::stop(void)::{lambda(void)#1}>(v6, v9);
      }
      goto LABEL_11;
    }
  }
  uint64_t v8 = *(NSObject **)this;
  if (os_log_type_enabled(*(os_log_t *)this, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)uint64_t v9 = 0;
    _os_log_error_impl(&dword_1C59C6000, v8, OS_LOG_TYPE_ERROR, "Handed detection instance is not created yet", v9, 2u);
  }
LABEL_11:
  HandDetectionManager::updateHandDetection((os_log_t *)this);
}

void *std::vector<dispatch::callback<void({block_pointer})(CMHandDetectionDelegate::CMHandDetectionResult)>>::__push_back_slow_path<dispatch::callback<void({block_pointer})(CMHandDetectionDelegate::CMHandDetectionResult)> const&>(void *a1, uint64_t a2)
{
  uint64_t v2 = a1[1] - *a1;
  unint64_t v3 = (v2 >> 4) + 1;
  if (v3 >> 60) {
    std::vector<dispatch::callback<void({block_pointer})(sar::OBDState,sar::TunerState)>>::__throw_length_error[abi:ne180100]();
  }
  uint64_t v6 = a1[2] - *a1;
  if (v6 >> 3 > v3) {
    unint64_t v3 = v6 >> 3;
  }
  if ((unint64_t)v6 >= 0x7FFFFFFFFFFFFFF0) {
    unint64_t v7 = 0xFFFFFFFFFFFFFFFLL;
  }
  else {
    unint64_t v7 = v3;
  }
  if (!v7)
  {
    uint64_t v8 = 0;
    uint64_t v9 = *(void **)a2;
    if (!*(void *)a2) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  if (v7 >> 60) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  uint64_t v8 = (char *)operator new(16 * v7);
  uint64_t v9 = *(void **)a2;
  if (*(void *)a2) {
LABEL_12:
  }
    uint64_t v9 = _Block_copy(v9);
LABEL_13:
  uint64_t v10 = *(NSObject **)(a2 + 8);
  int v11 = &v8[16 * (v2 >> 4)];
  *(void *)int v11 = v9;
  *((void *)v11 + 1) = v10;
  if (v10) {
    dispatch_retain(v10);
  }
  os_log_t v12 = &v8[16 * v7];
  uint64_t v13 = v11 + 16;
  int v14 = (char *)*a1;
  uint64_t v15 = (char *)a1[1];
  if (v15 == (char *)*a1)
  {
    *a1 = v11;
    a1[1] = v13;
    a1[2] = v12;
  }
  else
  {
    unint64_t v16 = (unint64_t)&v15[-*a1 - 16];
    if (v16 < 0xD0) {
      goto LABEL_17;
    }
    uint64_t v23 = &v15[-(v16 & 0xFFFFFFFFFFFFFFF0)];
    BOOL v24 = &v8[v2 - 8 - (v16 & 0xFFFFFFFFFFFFFFF0)] >= v15 || v23 - 8 >= v11;
    BOOL v25 = !v24;
    if (v23 - 16 < &v8[v2 - 8] && &v8[v2 - (v16 & 0xFFFFFFFFFFFFFFF0) - 16] < v15 - 8) {
      goto LABEL_17;
    }
    if (v25) {
      goto LABEL_17;
    }
    uint64_t v27 = (v16 >> 4) + 1;
    uint64_t v28 = 16 * (v27 & 0x1FFFFFFFFFFFFFFELL);
    int v17 = &v11[-v28];
    uint64_t v29 = &v15[-v28];
    float v30 = (double *)(v11 - 32);
    BOOL v31 = (const double *)(v15 - 32);
    uint64_t v32 = v27 & 0x1FFFFFFFFFFFFFFELL;
    do
    {
      float64x2x2_t v33 = vld2q_f64(v31);
      vst2q_f64(v30, v33);
      *(_OWORD *)BOOL v31 = 0uLL;
      *((_OWORD *)v31 + 1) = 0uLL;
      v31 -= 4;
      v30 -= 4;
      v32 -= 2;
    }
    while (v32);
    int v11 = v17;
    uint64_t v15 = v29;
    if (v27 != (v27 & 0x1FFFFFFFFFFFFFFELL))
    {
LABEL_17:
      int v17 = v11;
      do
      {
        long long v18 = *((_OWORD *)v15 - 1);
        v15 -= 16;
        *((_OWORD *)v17 - 1) = v18;
        v17 -= 16;
        *(void *)uint64_t v15 = 0;
        *((void *)v15 + 1) = 0;
      }
      while (v15 != v14);
    }
    uint64_t v15 = (char *)*a1;
    uint64_t v19 = (char *)a1[1];
    *a1 = v17;
    a1[1] = v13;
    a1[2] = v12;
    while (v19 != v15)
    {
      long long v20 = *((void *)v19 - 1);
      if (v20) {
        dispatch_release(v20);
      }
      unint64_t v21 = (const void *)*((void *)v19 - 2);
      if (v21) {
        _Block_release(v21);
      }
      v19 -= 16;
    }
  }
  if (v15) {
    operator delete(v15);
  }
  return v13;
}

HandDetectionManager **std::unique_ptr<HandDetectionManager>::~unique_ptr[abi:ne180100](HandDetectionManager **a1)
{
  uint64_t v2 = *a1;
  *a1 = 0;
  if (v2)
  {
    HandDetectionManager::~HandDetectionManager(v2);
    operator delete(v3);
  }
  return a1;
}

void std::__shared_ptr_pointer<HandDetectionManager *,std::shared_ptr<HandDetectionManager>::__shared_ptr_default_delete<HandDetectionManager,HandDetectionManager>,std::allocator<HandDetectionManager>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);

  operator delete(v1);
}

void std::__shared_ptr_pointer<HandDetectionManager *,std::shared_ptr<HandDetectionManager>::__shared_ptr_default_delete<HandDetectionManager,HandDetectionManager>,std::allocator<HandDetectionManager>>::__on_zero_shared(uint64_t a1)
{
  uint64_t v1 = *(HandDetectionManager **)(a1 + 24);
  if (v1)
  {
    HandDetectionManager::~HandDetectionManager(v1);
    operator delete(v2);
  }
}

uint64_t std::__shared_ptr_pointer<HandDetectionManager *,std::shared_ptr<HandDetectionManager>::__shared_ptr_default_delete<HandDetectionManager,HandDetectionManager>,std::allocator<HandDetectionManager>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  if (v3 == 0x80000001C5BCEE4ELL) {
    return a1 + 24;
  }
  if (((v3 & 0x80000001C5BCEE4ELL & 0x8000000000000000) != 0) == __OFSUB__(v3, 0x80000001C5BCEE4ELL)) {
    return 0;
  }
  if (!strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)(0x80000001C5BCEE4ELL & 0x7FFFFFFFFFFFFFFFLL))) {
    return a1 + 24;
  }
  return 0;
}

uint64_t ___ZNK8dispatch8callbackIU13block_pointerFvN23CMHandDetectionDelegate21CMHandDetectionResultEEEclIJS2_EEEvDpT__block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned int *)(a1 + 40));
}

void *__copy_helper_block_e8_32c92_ZTSN8dispatch5blockIU13block_pointerFvN23CMHandDetectionDelegate21CMHandDetectionResultEEEE(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void **)(a2 + 32);
  if (result) {
    uint64_t result = _Block_copy(result);
  }
  *(void *)(a1 + 32) = result;
  return result;
}

void __destroy_helper_block_e8_32c92_ZTSN8dispatch5blockIU13block_pointerFvN23CMHandDetectionDelegate21CMHandDetectionResultEEEE(uint64_t a1)
{
  uint64_t v1 = *(const void **)(a1 + 32);
  if (v1) {
    _Block_release(v1);
  }
}

void *Service::Service(void *result, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v2 = a2[1];
  *uint64_t result = &unk_1F2112348;
  result[1] = v3;
  result[2] = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 16), 1uLL, memory_order_relaxed);
  }
  result[3] = 0;
  result[4] = 0;
  result[5] = 0;
  return result;
}

void Service::~Service(Service *this)
{
  *(void *)this = &unk_1F2112348;
  uint64_t v2 = *((void *)this + 3);
  if (v2)
  {
    uint64_t v3 = *((void *)this + 4);
    CFTypeID v4 = (void *)*((void *)this + 3);
    if (v3 != v2)
    {
      do
      {
        if (*(char *)(v3 - 1) < 0) {
          operator delete(*(void **)(v3 - 24));
        }
        v3 -= 24;
      }
      while (v3 != v2);
      CFTypeID v4 = (void *)*((void *)this + 3);
    }
    *((void *)this + 4) = v2;
    operator delete(v4);
  }
  CFTypeRef v5 = (std::__shared_weak_count *)*((void *)this + 2);
  if (v5) {
    std::__shared_weak_count::__release_weak(v5);
  }
}

std::__shared_weak_count *Service::getServiceManager@<X0>(Service *this@<X0>, void *a2@<X8>)
{
  *a2 = 0;
  a2[1] = 0;
  uint64_t result = (std::__shared_weak_count *)*((void *)this + 2);
  if (result)
  {
    uint64_t result = std::__shared_weak_count::lock(result);
    a2[1] = result;
    if (result) {
      *a2 = *((void *)this + 1);
    }
  }
  return result;
}

void Service::registerCommandHandler(uint64_t a1, uint64_t a2, const void **a3)
{
  unint64_t v6 = *(void *)(a1 + 32);
  if (v6 >= *(void *)(a1 + 40))
  {
    *(void *)(a1 + 32) = std::vector<std::string>::__emplace_back_slow_path<std::string const&>((char **)(a1 + 24), a2);
    uint64_t v8 = *(std::__shared_weak_count **)(a1 + 16);
    if (!v8) {
      return;
    }
  }
  else
  {
    if (*(char *)(a2 + 23) < 0)
    {
      std::string::__init_copy_ctor_external(*(std::string **)(a1 + 32), *(const std::string::value_type **)a2, *(void *)(a2 + 8));
    }
    else
    {
      long long v7 = *(_OWORD *)a2;
      *(void *)(v6 + 16) = *(void *)(a2 + 16);
      *(_OWORD *)unint64_t v6 = v7;
    }
    *(void *)(a1 + 32) = v6 + 24;
    *(void *)(a1 + 32) = v6 + 24;
    uint64_t v8 = *(std::__shared_weak_count **)(a1 + 16);
    if (!v8) {
      return;
    }
  }
  uint64_t v9 = std::__shared_weak_count::lock(v8);
  v13[2] = v9;
  if (v9)
  {
    uint64_t v10 = v9;
    int v11 = *(void **)(a1 + 8);
    v13[1] = v11;
    if (v11)
    {
      os_log_t v12 = *a3 ? _Block_copy(*a3) : 0;
      v13[0] = v12;
      ServiceManager::registerCommandHandler((uint64_t)v11, a2, v13);
      if (v12) {
        _Block_release(v12);
      }
    }
    if (!atomic_fetch_add(&v10->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
      std::__shared_weak_count::__release_weak(v10);
    }
  }
}

void sub_1C5BB65B0(_Unwind_Exception *a1)
{
  *(void *)(v2 + 32) = v1;
  _Unwind_Resume(a1);
}

void sub_1C5BB65B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11)
{
  if (v11) {
    _Block_release(v11);
  }
  std::shared_ptr<Registry>::~shared_ptr[abi:ne180100]((uint64_t)&a11);
  _Unwind_Resume(a1);
}

void ServiceManager::registerCommandHandler(uint64_t a1, uint64_t a2, void **a3)
{
  uint64_t v4 = *(void *)(a1 + 168);
  CFTypeRef v5 = *a3;
  if (*a3) {
    CFTypeRef v5 = _Block_copy(v5);
  }
  aBlock = v5;
  ServiceCtrl::registerCommandHandler(v4, a2, &aBlock);
  if (aBlock) {
    _Block_release(aBlock);
  }
}

void sub_1C5BB663C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *aBlock)
{
  if (aBlock) {
    _Block_release(aBlock);
  }
  _Unwind_Resume(exception_object);
}

void ServiceManager::broadcastEvent(uint64_t a1, uint64_t a2, const void **a3, void **a4)
{
  uint64_t v4 = *(void *)(a1 + 184);
  if (v4) {
    dispatch::block<void({block_pointer})(std::string,ctu::cf::CFSharedRef<__CFDictionary const>,dispatch::block<void({block_pointer})(void)>)>::operator()<std::string const&,ctu::cf::CFSharedRef<__CFDictionary const>&,dispatch::block<void({block_pointer})(void)>&>(v4, a2, a3, a4);
  }
}

void Service::broadcastEvent(uint64_t a1, uint64_t a2, void **a3, const void **a4)
{
  CFTypeRef v5 = *(std::__shared_weak_count **)(a1 + 16);
  if (v5)
  {
    uint64_t v9 = std::__shared_weak_count::lock(v5);
    queue v26 = v9;
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)(a1 + 8);
      uint64_t v25 = v11;
      if (!v11) {
        goto LABEL_32;
      }
      unint64_t v24 = 0xAAAAAAAAAAAAAAAALL;
      os_log_t v12 = *a3;
      xpc_object_t object = v12;
      if (v12) {
        xpc_retain(v12);
      }
      else {
        xpc_object_t object = xpc_null_create();
      }
      xpc::bridge((uint64_t *)&cf, (xpc *)&object, v13);
      CFTypeRef v14 = cf;
      if (cf && (CFTypeID v15 = CFGetTypeID(cf), v15 == CFDictionaryGetTypeID()))
      {
        unint64_t v24 = (unint64_t)v14;
        CFRetain(v14);
        CFTypeRef v16 = cf;
        if (!cf)
        {
LABEL_13:
          xpc_release(object);
          if (*(char *)(a2 + 23) < 0) {
            std::string::__init_copy_ctor_external(&v21, *(const std::string::value_type **)a2, *(void *)(a2 + 8));
          }
          else {
            std::string v21 = *(std::string *)a2;
          }
          long long v20 = v14;
          if (v14) {
            CFRetain(v14);
          }
          if (*a4)
          {
            int v17 = _Block_copy(*a4);
            uint64_t v19 = v17;
            uint64_t v18 = *(void *)(v11 + 184);
            if (!v18)
            {
LABEL_23:
              if (v17) {
                _Block_release(v17);
              }
              if (v14) {
                CFRelease(v14);
              }
              if (SHIBYTE(v21.__r_.__value_.__r.__words[2]) < 0)
              {
                operator delete(v21.__r_.__value_.__l.__data_);
                if (!v14) {
                  goto LABEL_32;
                }
              }
              else if (!v14)
              {
LABEL_32:
                if (!atomic_fetch_add(&v10->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
                {
                  ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
                  std::__shared_weak_count::__release_weak(v10);
                }
                return;
              }
              CFRelease(v14);
              goto LABEL_32;
            }
          }
          else
          {
            int v17 = 0;
            uint64_t v19 = 0;
            uint64_t v18 = *(void *)(v11 + 184);
            if (!v18) {
              goto LABEL_23;
            }
          }
          dispatch::block<void({block_pointer})(std::string,ctu::cf::CFSharedRef<__CFDictionary const>,dispatch::block<void({block_pointer})(void)>)>::operator()<std::string const&,ctu::cf::CFSharedRef<__CFDictionary const>&,dispatch::block<void({block_pointer})(void)>&>(v18, (uint64_t)&v21, &v20, &v19);
          goto LABEL_23;
        }
      }
      else
      {
        CFTypeRef v14 = 0;
        unint64_t v24 = 0;
        CFTypeRef v16 = cf;
        if (!cf) {
          goto LABEL_13;
        }
      }
      CFRelease(v16);
      goto LABEL_13;
    }
  }
}

void sub_1C5BB6864(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16, uint64_t a17, uint64_t a18, const void *a19, __int16 a20,char a21,char a22)
{
}

void sub_1C5BB68CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, xpc_object_t object, char a15, uint64_t a16, char a17)
{
}

void Service::getRegisteredCommands(Service *this@<X0>, void *a2@<X8>)
{
  *a2 = 0;
  a2[1] = 0;
  a2[2] = 0;
  std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>(a2, *((void *)this + 3), *((void *)this + 4), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((void *)this + 4) - *((void *)this + 3)) >> 3));
}

void ServiceManager::~ServiceManager(ServiceManager *this)
{
  *(void *)this = &unk_1F21123B8;
  uint64_t v2 = (const void *)*((void *)this + 23);
  if (v2) {
    _Block_release(v2);
  }
  uint64_t v3 = (std::__shared_weak_count *)*((void *)this + 22);
  if (v3 && !atomic_fetch_add(&v3->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
    std::__shared_weak_count::__release_weak(v3);
  }
  uint64_t v4 = *((void *)this + 18);
  if (v4)
  {
    uint64_t v5 = *((void *)this + 19);
    unint64_t v6 = (void *)*((void *)this + 18);
    if (v5 != v4)
    {
      do
      {
        long long v7 = *(std::__shared_weak_count **)(v5 - 8);
        if (v7 && !atomic_fetch_add(&v7->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
        {
          ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
          std::__shared_weak_count::__release_weak(v7);
        }
        v5 -= 16;
      }
      while (v5 != v4);
      unint64_t v6 = (void *)*((void *)this + 18);
    }
    *((void *)this + 19) = v4;
    operator delete(v6);
  }
  uint64_t v8 = *((void *)this + 15);
  if (v8)
  {
    uint64_t v9 = *((void *)this + 16);
    uint64_t v10 = (void *)*((void *)this + 15);
    if (v9 != v8)
    {
      do
      {
        uint64_t v11 = *(std::__shared_weak_count **)(v9 - 8);
        if (v11 && !atomic_fetch_add(&v11->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
        {
          ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
          std::__shared_weak_count::__release_weak(v11);
        }
        v9 -= 16;
      }
      while (v9 != v8);
      uint64_t v10 = (void *)*((void *)this + 15);
    }
    *((void *)this + 16) = v8;
    operator delete(v10);
  }
  os_log_t v12 = (std::__shared_weak_count *)*((void *)this + 14);
  if (v12 && !atomic_fetch_add(&v12->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
    std::__shared_weak_count::__release_weak(v12);
  }
  *(void *)this = &unk_1F21124D0;
  MEMORY[0x1C87940C0]((char *)this + 8);
  uint64_t v13 = *((void *)this + 12);
  if (v13) {
    dispatch_release(v13);
  }
  CFTypeRef v14 = *((void *)this + 11);
  if (v14) {
    dispatch_release(v14);
  }
  CFTypeID v15 = (std::__shared_weak_count *)*((void *)this + 10);
  if (v15) {
    std::__shared_weak_count::__release_weak(v15);
  }
}

void ServiceManager::ServiceManager(ServiceManager *this, const char *a2)
{
  ctu::OsLogContext::OsLogContext((ctu::OsLogContext *)v7, "com.apple.telephony.abm", a2);
  GetABMLogServer(&v5);
  dispatch_object_t object = 0;
  ctu::SharedSynchronizable<NetworkStatsInterface>::SharedSynchronizable((void *)this + 9, a2, QOS_CLASS_DEFAULT, &object);
  if (object) {
    dispatch_release(object);
  }
  ctu::Loggable<ServiceManager,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::Loggable<ctu::OsLogContext,std::shared_ptr<ctu::LogServer>>(this, (uint64_t)v7, &v5);
  *(void *)this = &unk_1F2112700;
  uint64_t v4 = v6;
  if (v6 && !atomic_fetch_add(&v6->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
    std::__shared_weak_count::__release_weak(v4);
  }
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)v7);
  *(void *)this = &unk_1F21123B8;
  *(_OWORD *)((char *)this + 104) = 0u;
  *(_OWORD *)((char *)this + 120) = 0u;
  *(_OWORD *)((char *)this + 136) = 0u;
  *(_OWORD *)((char *)this + 152) = 0u;
  *(_OWORD *)((char *)this + 168) = 0u;
  *((void *)this + 23) = 0;
  *((unsigned char *)this + 192) = 1;
}

void sub_1C5BB6CA0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, char a12, uint64_t a13, dispatch_object_t object)
{
  ctu::SharedSynchronizable<data::TransportService::State>::~SharedSynchronizable(v14);
  std::shared_ptr<ctu::LogServer>::~shared_ptr[abi:ne180100]((uint64_t)&a10);
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)&a12);
  _Unwind_Resume(a1);
}

void sub_1C5BB6CD8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_start(va, a4);
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)va);
  _Unwind_Resume(a1);
}

void ServiceManager::init(void *a1, uint64_t *a2)
{
  uint64_t v3 = (std::__shared_weak_count *)a1[10];
  if (!v3
    || (uint64_t v5 = (const void *(__cdecl *)(const std::__shared_weak_count *__hidden, const std::type_info *))a1[9],
        (unint64_t v6 = std::__shared_weak_count::lock(v3)) == 0))
  {
    std::__throw_bad_weak_ptr[abi:ne180100]();
  }
  long long v7 = v6;
  atomic_fetch_add_explicit(&v6->__shared_weak_owners_, 1uLL, memory_order_relaxed);
  if (!atomic_fetch_add(&v6->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
    std::__shared_weak_count::__release_weak(v7);
  }
  unint64_t v31 = 0xAAAAAAAAAAAAAAAALL;
  uint64_t v32 = (std::__shared_weak_count *)0xAAAAAAAAAAAAAAAALL;
  uint64_t v8 = (std::__shared_weak_count_vtbl *)operator new(0x90uLL);
  atomic_fetch_add_explicit(&v7->__shared_weak_owners_, 1uLL, memory_order_relaxed);
  v8->~__shared_weak_size_t count = (void (__cdecl *)(std::__shared_weak_count *__hidden))&unk_1F2112560;
  ctu::OsLogContext::OsLogContext((ctu::OsLogContext *)v35, "com.apple.telephony.abm", "svc.ctrl");
  GetABMLogServer(&v33);
  initially_inactive = dispatch_queue_attr_make_initially_inactive(0);
  uint64_t v10 = dispatch_queue_create_with_target_V2("svc.ctrl", initially_inactive, 0);
  dispatch_set_qos_class_floor(v10, QOS_CLASS_DEFAULT, 0);
  dispatch_activate(v10);
  v8[1].__on_zero_shared_weak = 0;
  v8[2].~__shared_weak_size_t count = 0;
  v8[2].~__shared_weak_count_0 = (void (__cdecl *)(std::__shared_weak_count *__hidden))v10;
  if (v10)
  {
    dispatch_retain(v10);
    v8[2].__on_zero_shared = 0;
    dispatch_release(v10);
  }
  else
  {
    v8[2].__on_zero_shared = 0;
  }
  v8->~__shared_weak_size_t count = (void (__cdecl *)(std::__shared_weak_count *__hidden))&unk_1F2112670;
  ctu::OsLogContext::OsLogContext();
  ctu::OsLogContext::OsLogContext();
  ctu::LoggerCommonBase::LoggerCommonBase();
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)&v38);
  v8->~__shared_weak_count_0 = (void (__cdecl *)(std::__shared_weak_count *__hidden))&unk_1F2102CB8;
  uint64_t v11 = v34;
  v8[1].__on_zero_shared = v33;
  v8[1].__get_deleter = (const void *(__cdecl *)(const std::__shared_weak_count *__hidden, const std::type_info *))v11;
  if (v11) {
    atomic_fetch_add_explicit(&v11->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)&v36);
  v8->~__shared_weak_size_t count = (void (__cdecl *)(std::__shared_weak_count *__hidden))&unk_1F2112630;
  os_log_t v12 = v34;
  if (v34 && !atomic_fetch_add(&v34->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
    std::__shared_weak_count::__release_weak(v12);
  }
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)v35);
  v8->~__shared_weak_size_t count = (void (__cdecl *)(std::__shared_weak_count *__hidden))&unk_1F2112560;
  v8[2].__get_deleter = v5;
  v8[2].__on_zero_shared_weak = (void (__cdecl *)(std::__shared_weak_count *__hidden))v7;
  atomic_fetch_add_explicit(&v7->__shared_weak_owners_, 1uLL, memory_order_relaxed);
  v8[3].__on_zero_shared = 0;
  v8[3].~__shared_weak_count_0 = 0;
  v8[3].~__shared_weak_size_t count = (void (__cdecl *)(std::__shared_weak_count *__hidden))&v8[3].~__shared_weak_count_0;
  unint64_t v31 = (unint64_t)v8;
  uint64_t v13 = (std::__shared_weak_count *)operator new(0x20uLL);
  v13->__shared_owners_ = 0;
  p_shared_owners = &v13->__shared_owners_;
  v13->__vftable = (std::__shared_weak_count_vtbl *)&unk_1F2112510;
  v13->__shared_weak_owners_ = 0;
  v13[1].__vftable = v8;
  uint64_t v32 = v13;
  CFTypeID v15 = (std::__shared_weak_count *)v8[2].~__shared_weak_count;
  if (!v15)
  {
    atomic_fetch_add_explicit(&v13->__shared_owners_, 1uLL, memory_order_relaxed);
    atomic_fetch_add_explicit(&v13->__shared_weak_owners_, 1uLL, memory_order_relaxed);
    v8[1].__on_zero_shared_weak = (void (__cdecl *)(std::__shared_weak_count *__hidden))v8;
    v8[2].~__shared_weak_size_t count = (void (__cdecl *)(std::__shared_weak_count *__hidden))v13;
    if (!atomic_fetch_add(p_shared_owners, 0xFFFFFFFFFFFFFFFFLL)) {
      goto LABEL_44;
    }
LABEL_18:
    CFTypeRef v16 = (void *)v31;
    if (!*(void *)(v31 + 56)) {
      goto LABEL_28;
    }
    goto LABEL_19;
  }
  if (v15->__shared_owners_ != -1) {
    goto LABEL_18;
  }
  atomic_fetch_add_explicit(&v13->__shared_owners_, 1uLL, memory_order_relaxed);
  atomic_fetch_add_explicit(&v13->__shared_weak_owners_, 1uLL, memory_order_relaxed);
  v8[1].__on_zero_shared_weak = (void (__cdecl *)(std::__shared_weak_count *__hidden))v8;
  v8[2].~__shared_weak_size_t count = (void (__cdecl *)(std::__shared_weak_count *__hidden))v13;
  std::__shared_weak_count::__release_weak(v15);
  if (atomic_fetch_add(p_shared_owners, 0xFFFFFFFFFFFFFFFFLL)) {
    goto LABEL_18;
  }
LABEL_44:
  ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
  std::__shared_weak_count::__release_weak(v13);
  CFTypeRef v16 = (void *)v31;
  if (!*(void *)(v31 + 56)) {
    goto LABEL_28;
  }
LABEL_19:
  int v17 = (std::__shared_weak_count *)v16[10];
  if (!v17 || (uint64_t v18 = v16[9], (v19 = std::__shared_weak_count::lock(v17)) == 0)) {
    std::__throw_bad_weak_ptr[abi:ne180100]();
  }
  long long v20 = v19;
  uint64_t v38 = v18;
  unint64_t v39 = v19;
  ctu::LoggerCommonBase::getLogDomain((ctu::LoggerCommonBase *)(v16 + 1));
  uint64_t v36 = v18;
  dispatch_object_t v37 = v20;
  uint64_t v38 = 0;
  unint64_t v39 = 0;
  ctu::TrackedLogger::registerLoggerToServer();
  std::string v21 = v37;
  if (v37 && !atomic_fetch_add(&v37->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v21->__on_zero_shared)(v21);
    std::__shared_weak_count::__release_weak(v21);
  }
  uint64_t v22 = v39;
  if (v39 && !atomic_fetch_add(&v39->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v22->__on_zero_shared)(v22);
    std::__shared_weak_count::__release_weak(v22);
  }
  CFTypeRef v16 = (void *)v31;
LABEL_28:
  std::__shared_weak_count::__release_weak(v7);
  uint64_t v23 = v32;
  unint64_t v31 = 0;
  uint64_t v32 = 0;
  unint64_t v24 = (std::__shared_weak_count *)a1[22];
  a1[21] = v16;
  a1[22] = v23;
  if (v24 && !atomic_fetch_add(&v24->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v24->__on_zero_shared)(v24);
    std::__shared_weak_count::__release_weak(v24);
  }
  if (v32 && !atomic_fetch_add(&v32->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v32->__on_zero_shared)(v32);
    std::__shared_weak_count::__release_weak(v32);
    std::__shared_weak_count::__release_weak(v7);
    uint64_t v25 = *a2;
    if (!*a2) {
      return;
    }
  }
  else
  {
    std::__shared_weak_count::__release_weak(v7);
    uint64_t v25 = *a2;
    if (!*a2) {
      return;
    }
  }
  uint64_t v26 = a2[1];
  if (v26) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v26 + 8), 1uLL, memory_order_relaxed);
  }
  uint64_t v27 = (std::__shared_weak_count *)a1[14];
  a1[13] = v25;
  a1[14] = v26;
  if (v27 && !atomic_fetch_add(&v27->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v27->__on_zero_shared)(v27);
    std::__shared_weak_count::__release_weak(v27);
  }
  uint64_t v28 = a1[13];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 0x40000000;
  v29[2] = ___ZN14ServiceManager4initENSt3__110shared_ptrI14PowerInterfaceEE_block_invoke;
  v29[3] = &__block_descriptor_tmp_21;
  v29[4] = a1;
  aBlock = _Block_copy(v29);
  (*(void (**)(uint64_t, void **))(*(void *)v28 + 16))(v28, &aBlock);
  if (aBlock) {
    _Block_release(aBlock);
  }
}

void sub_1C5BB72F4(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *aBlock, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21)
{
}

void sub_1C5BB7360()
{
}

void sub_1C5BB7370(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va2, a8);
  va_start(va1, a8);
  va_start(va, a8);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  va_copy(va2, va1);
  uint64_t v15 = va_arg(va2, void);
  uint64_t v17 = va_arg(va2, void);
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)(v11 - 80));
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)va2);
  ctu::SharedSynchronizable<data::TransportService::State>::~SharedSynchronizable(v10);
  std::shared_ptr<ctu::LogServer>::~shared_ptr[abi:ne180100]((uint64_t)va);
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)va1);
  std::__shared_weak_count::__release_weak(v8);
  operator delete(v9);
  JUMPOUT(0x1C5BB73DCLL);
}

void sub_1C5BB73C0()
{
}

void ___ZN14ServiceManager4initENSt3__110shared_ptrI14PowerInterfaceEE_block_invoke(uint64_t a1, int a2, NSObject **a3)
{
  uint64_t v3 = *(void **)(a1 + 32);
  if (a2 == 1)
  {
    uint64_t v4 = *a3;
    dispatch_object_t v5 = v4;
    if (!v4)
    {
      ServiceManager::wake(v3, &v5);
      return;
    }
    dispatch_retain(v4);
    dispatch_group_enter(v4);
    ServiceManager::wake(v3, &v5);
  }
  else
  {
    if (a2) {
      return;
    }
    uint64_t v4 = *a3;
    dispatch_object_t v6 = v4;
    if (!v4)
    {
      ServiceManager::sleep(v3, &v6);
      return;
    }
    dispatch_retain(v4);
    dispatch_group_enter(v4);
    ServiceManager::sleep(v3, &v6);
  }
  dispatch_group_leave(v4);

  dispatch_release(v4);
}

void ServiceManager::sleep(void *a1, dispatch_object_t *a2)
{
  uint64_t v3 = *a2;
  if (*a2)
  {
    dispatch_retain(*a2);
    dispatch_group_enter(v3);
  }
  uint64_t v4 = (std::__shared_weak_count *)a1[10];
  if (!v4 || (uint64_t v5 = a1[9], (v6 = std::__shared_weak_count::lock(v4)) == 0)) {
    std::__throw_bad_weak_ptr[abi:ne180100]();
  }
  long long v7 = v6;
  uint64_t v8 = operator new(0x10uLL);
  void *v8 = a1;
  v8[1] = v3;
  uint64_t v9 = a1[11];
  atomic_fetch_add_explicit(&v7->__shared_owners_, 1uLL, memory_order_relaxed);
  uint64_t v10 = operator new(0x18uLL);
  *uint64_t v10 = v8;
  v10[1] = v5;
  v10[2] = v7;
  dispatch_async_f(v9, v10, (dispatch_function_t)dispatch::async<void ctu::SharedSynchronizable<ServiceManager>::execute_wrapped<ServiceManager::sleep(dispatch::group_session)::$_0>(ServiceManager::sleep(dispatch::group_session)::$_0 &&)::{lambda(void)#1}>(dispatch_queue_s *,std::unique_ptr<ServiceManager::sleep(dispatch::group_session)::$_0,dispatch_queue_s *::default_delete<ServiceManager::sleep(dispatch::group_session)::$_0>>)::{lambda(void *)#1}::__invoke);
  if (!atomic_fetch_add(&v7->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
    std::__shared_weak_count::__release_weak(v7);
  }
}

void ServiceManager::wake(void *a1, dispatch_object_t *a2)
{
  uint64_t v3 = *a2;
  if (*a2)
  {
    dispatch_retain(*a2);
    dispatch_group_enter(v3);
  }
  uint64_t v4 = (std::__shared_weak_count *)a1[10];
  if (!v4 || (uint64_t v5 = a1[9], (v6 = std::__shared_weak_count::lock(v4)) == 0)) {
    std::__throw_bad_weak_ptr[abi:ne180100]();
  }
  long long v7 = v6;
  uint64_t v8 = operator new(0x10uLL);
  void *v8 = a1;
  v8[1] = v3;
  uint64_t v9 = a1[11];
  atomic_fetch_add_explicit(&v7->__shared_owners_, 1uLL, memory_order_relaxed);
  uint64_t v10 = operator new(0x18uLL);
  *uint64_t v10 = v8;
  v10[1] = v5;
  v10[2] = v7;
  dispatch_async_f(v9, v10, (dispatch_function_t)dispatch::async<void ctu::SharedSynchronizable<ServiceManager>::execute_wrapped<ServiceManager::wake(dispatch::group_session)::$_0>(ServiceManager::wake(dispatch::group_session)::$_0 &&)::{lambda(void)#1}>(dispatch_queue_s *,std::unique_ptr<ServiceManager::wake(dispatch::group_session)::$_0,dispatch_queue_s *::default_delete<ServiceManager::wake(dispatch::group_session)::$_0>>)::{lambda(void *)#1}::__invoke);
  if (!atomic_fetch_add(&v7->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
    std::__shared_weak_count::__release_weak(v7);
  }
}

void ServiceManager::createPowerAssertion(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 104);
  if (*(char *)(a2 + 23) < 0) {
    std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)a2, *(void *)(a2 + 8));
  }
  else {
    std::string __p = *(std::string *)a2;
  }
  (*(void (**)(uint64_t, std::string *, uint64_t))(*(void *)v4 + 24))(v4, &__p, a3);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
}

void sub_1C5BB77B4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void ServiceManager::releasePowerAssertion(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 104);
  if (*(char *)(a2 + 23) < 0) {
    std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)a2, *(void *)(a2 + 8));
  }
  else {
    std::string __p = *(std::string *)a2;
  }
  (*(void (**)(uint64_t, std::string *))(*(void *)v2 + 32))(v2, &__p);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
}

void sub_1C5BB7870(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void ServiceCtrl::registerCommandHandler(uint64_t a1, uint64_t a2, void **a3)
{
  uint64_t v8 = a1;
  if (*(char *)(a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)a2, *(void *)(a2 + 8));
    uint64_t v5 = *a3;
    if (!*a3) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  std::string __p = *(std::string *)a2;
  uint64_t v5 = *a3;
  if (*a3) {
LABEL_5:
  }
    uint64_t v5 = _Block_copy(v5);
LABEL_6:
  aBlock = v5;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 0x40000000;
  block[2] = ___ZNK3ctu20SharedSynchronizableI11ServiceCtrlE20execute_wrapped_syncIZNS1_22registerCommandHandlerERKNSt3__112basic_stringIcNS4_11char_traitsIcEENS4_9allocatorIcEEEEN8dispatch5blockIU13block_pointerFvN3xpc4dictENSE_IU13block_pointerFviSG_EEEEEEEUlvE_EEDTclsr8dispatchE4syncLDnEclsr3stdE7forwardIT_Efp_EEEOSO__block_invoke;
  block[3] = &__block_descriptor_tmp_39_1;
  void block[4] = a1 + 72;
  block[5] = &v8;
  dispatch_object_t v6 = *(NSObject **)(a1 + 88);
  if (!*(void *)(a1 + 96))
  {
    dispatch_sync(v6, block);
    long long v7 = aBlock;
    if (!aBlock) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  dispatch_async_and_wait(v6, block);
  long long v7 = aBlock;
  if (aBlock) {
LABEL_10:
  }
    _Block_release(v7);
LABEL_11:
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
}

void ServiceManager::registerEventDispatcher(uint64_t a1, void **a2)
{
  uint64_t v3 = *a2;
  if (*a2) {
    uint64_t v3 = _Block_copy(v3);
  }
  uint64_t v4 = *(const void **)(a1 + 184);
  *(void *)(a1 + 184) = v3;
  if (v4) {
    _Block_release(v4);
  }
}

void ServiceManager::initializeGlobalServices(ServiceManager *this@<X0>, NSObject **a2@<X8>)
{
  uint64_t v4 = dispatch_group_create();
  uint64_t v5 = v4;
  *a2 = v4;
  if (v4)
  {
    dispatch_retain(v4);
    dispatch_group_enter(v5);
  }
  dispatch_object_t v6 = (std::__shared_weak_count *)*((void *)this + 10);
  if (!v6 || (uint64_t v7 = *((void *)this + 9), (v8 = std::__shared_weak_count::lock(v6)) == 0)) {
    std::__throw_bad_weak_ptr[abi:ne180100]();
  }
  uint64_t v9 = v8;
  uint64_t v10 = operator new(0x10uLL);
  *uint64_t v10 = this;
  v10[1] = v5;
  uint64_t v11 = *((void *)this + 11);
  atomic_fetch_add_explicit(&v9->__shared_owners_, 1uLL, memory_order_relaxed);
  uint64_t v12 = operator new(0x18uLL);
  void *v12 = v10;
  v12[1] = v7;
  v12[2] = v9;
  dispatch_async_f(v11, v12, (dispatch_function_t)dispatch::async<void ctu::SharedSynchronizable<ServiceManager>::execute_wrapped<ServiceManager::initializeGlobalServices(void)::$_0>(ServiceManager::initializeGlobalServices(void)::$_0 &&)::{lambda(void)#1}>(dispatch_queue_s *,std::unique_ptr<ServiceManager::initializeGlobalServices(void)::$_0,dispatch_queue_s *::default_delete<ServiceManager::initializeGlobalServices(void)::$_0>>)::{lambda(void *)#1}::__invoke);
  if (!atomic_fetch_add(&v9->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
    std::__shared_weak_count::__release_weak(v9);
  }
}

void ServiceManager::shutdownGlobalServices(ServiceManager *this@<X0>, NSObject **a2@<X8>)
{
  uint64_t v4 = dispatch_group_create();
  uint64_t v5 = v4;
  *a2 = v4;
  if (v4)
  {
    dispatch_retain(v4);
    dispatch_group_enter(v5);
  }
  dispatch_object_t v6 = (std::__shared_weak_count *)*((void *)this + 10);
  if (!v6 || (uint64_t v7 = *((void *)this + 9), (v8 = std::__shared_weak_count::lock(v6)) == 0)) {
    std::__throw_bad_weak_ptr[abi:ne180100]();
  }
  uint64_t v9 = v8;
  uint64_t v10 = operator new(0x10uLL);
  *uint64_t v10 = this;
  v10[1] = v5;
  uint64_t v11 = *((void *)this + 11);
  atomic_fetch_add_explicit(&v9->__shared_owners_, 1uLL, memory_order_relaxed);
  uint64_t v12 = operator new(0x18uLL);
  void *v12 = v10;
  v12[1] = v7;
  v12[2] = v9;
  dispatch_async_f(v11, v12, (dispatch_function_t)dispatch::async<void ctu::SharedSynchronizable<ServiceManager>::execute_wrapped<ServiceManager::shutdownGlobalServices(void)::$_0>(ServiceManager::shutdownGlobalServices(void)::$_0 &&)::{lambda(void)#1}>(dispatch_queue_s *,std::unique_ptr<ServiceManager::shutdownGlobalServices(void)::$_0,dispatch_queue_s *::default_delete<ServiceManager::shutdownGlobalServices(void)::$_0>>)::{lambda(void *)#1}::__invoke);
  if (!atomic_fetch_add(&v9->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
    std::__shared_weak_count::__release_weak(v9);
  }
}

void ServiceManager::initializeDynamicServices(ServiceManager *this@<X0>, NSObject **a2@<X8>)
{
  uint64_t v4 = dispatch_group_create();
  *a2 = v4;
  dispatch_object_t object = (dispatch_object_t)0xAAAAAAAAAAAAAAAALL;
  uint64_t v5 = *((void *)this + 13);
  std::string __p = operator new(0x30uLL);
  long long v11 = xmmword_1C5BCB080;
  strcpy((char *)__p, "com.apple.AppleBasebandManager.ServerNotReady");
  (*(void (**)(dispatch_object_t *__return_ptr, uint64_t, void **, void))(*(void *)v5 + 24))(&object, v5, &__p, 0);
  if (SHIBYTE(v11) < 0) {
    operator delete(__p);
  }
  dispatch_object_t v6 = object;
  if (object) {
    dispatch_retain(object);
  }
  if (v4)
  {
    dispatch_retain(v4);
    dispatch_group_enter(v4);
  }
  uint64_t v7 = object;
  uint64_t v8 = *((void *)this + 11);
  uint64_t v9 = operator new(0x18uLL);
  *uint64_t v9 = this;
  v9[1] = v6;
  v9[2] = v4;
  dispatch_group_notify_f(v7, v8, v9, (dispatch_function_t)dispatch::detail::group_notify<ServiceManager::initializeDynamicServices(void)::$_0>(dispatch_group_s *,dispatch_queue_s *,ServiceManager::initializeDynamicServices(void)::$_0 &&,std::integral_constant<BOOL,false>)::{lambda(void *)#1}::__invoke);
  if (object) {
    dispatch_release(object);
  }
}

void sub_1C5BB7D70(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18, dispatch_object_t object)
{
  ServiceManager::initializeDynamicServices(void)::$_0::~$_0((uint64_t)&a10);
  if (object) {
    dispatch_release(object);
  }
  if (v19) {
    dispatch_release(v19);
  }
  _Unwind_Resume(a1);
}

uint64_t ServiceManager::initializeDynamicServices(void)::$_0::~$_0(uint64_t a1)
{
  uint64_t v2 = *(NSObject **)(a1 + 16);
  if (v2)
  {
    dispatch_group_leave(v2);
    uint64_t v3 = *(NSObject **)(a1 + 16);
    if (v3) {
      dispatch_release(v3);
    }
  }
  uint64_t v4 = *(NSObject **)(a1 + 8);
  if (v4) {
    dispatch_release(v4);
  }
  return a1;
}

void ServiceManager::shutdownDynamicServices(ServiceManager *this@<X0>, NSObject **a2@<X8>)
{
  uint64_t v4 = dispatch_group_create();
  *a2 = v4;
  dispatch_object_t object = (dispatch_object_t)0xAAAAAAAAAAAAAAAALL;
  uint64_t v5 = *((void *)this + 13);
  std::string __p = operator new(0x30uLL);
  long long v11 = xmmword_1C5BCB080;
  strcpy((char *)__p, "com.apple.AppleBasebandManager.ServerNotReady");
  (*(void (**)(dispatch_object_t *__return_ptr, uint64_t, void **, void))(*(void *)v5 + 24))(&object, v5, &__p, 0);
  if (SHIBYTE(v11) < 0) {
    operator delete(__p);
  }
  dispatch_object_t v6 = object;
  if (object) {
    dispatch_retain(object);
  }
  if (v4)
  {
    dispatch_retain(v4);
    dispatch_group_enter(v4);
  }
  uint64_t v7 = object;
  uint64_t v8 = *((void *)this + 11);
  uint64_t v9 = operator new(0x18uLL);
  *uint64_t v9 = this;
  v9[1] = v6;
  v9[2] = v4;
  dispatch_group_notify_f(v7, v8, v9, (dispatch_function_t)dispatch::detail::group_notify<ServiceManager::shutdownDynamicServices(void)::$_0>(dispatch_group_s *,dispatch_queue_s *,ServiceManager::shutdownDynamicServices(void)::$_0 &&,std::integral_constant<BOOL,false>)::{lambda(void *)#1}::__invoke);
  if (object) {
    dispatch_release(object);
  }
}

void sub_1C5BB7F40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18, dispatch_object_t object)
{
  ServiceManager::initializeDynamicServices(void)::$_0::~$_0((uint64_t)&a10);
  if (object) {
    dispatch_release(object);
  }
  if (v19) {
    dispatch_release(v19);
  }
  _Unwind_Resume(a1);
}

void *ctu::Loggable<ServiceManager,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::~Loggable(void *a1)
{
  *a1 = &unk_1F21124D0;
  MEMORY[0x1C87940C0](a1 + 1);
  return a1;
}

void ctu::Loggable<ServiceManager,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::~Loggable(void *a1)
{
  *a1 = &unk_1F21124D0;
  MEMORY[0x1C87940C0](a1 + 1);

  operator delete(a1);
}

void std::__shared_ptr_pointer<ServiceCtrl *,std::shared_ptr<ServiceCtrl> ctu::SharedSynchronizable<ServiceCtrl>::make_shared_ptr<ServiceCtrl>(ServiceCtrl*)::{lambda(ServiceCtrl *)#1},std::allocator<ServiceCtrl>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);

  operator delete(v1);
}

void std::__shared_ptr_pointer<ServiceCtrl *,std::shared_ptr<ServiceCtrl> ctu::SharedSynchronizable<ServiceCtrl>::make_shared_ptr<ServiceCtrl>(ServiceCtrl*)::{lambda(ServiceCtrl *)#1},std::allocator<ServiceCtrl>>::__on_zero_shared(uint64_t a1)
{
}

uint64_t std::__shared_ptr_pointer<ServiceCtrl *,std::shared_ptr<ServiceCtrl> ctu::SharedSynchronizable<ServiceCtrl>::make_shared_ptr<ServiceCtrl>(ServiceCtrl*)::{lambda(ServiceCtrl *)#1},std::allocator<ServiceCtrl>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = *(void *)(a2 + 8);
  if ((char *)v3 == "ZN3ctu20SharedSynchronizableI11ServiceCtrlE15make_shared_ptrIS1_EENSt3__110shared_ptrIT_EEPS6_EUlPS1_E_") {
    return a1 + 24;
  }
  if (((v3 & (unint64_t)"ZN3ctu20SharedSynchronizableI11ServiceCtrlE15make_shared_ptrIS1_EENSt3__110shared_ptrIT_EEPS6_EUlPS1_E_" & 0x8000000000000000) != 0) == __OFSUB__(v3, "ZN3ctu20SharedSynchronizableI11ServiceCtrlE15make_shared_ptrIS1_EENSt3__110shared_ptrIT_EEPS6_EUlPS1_E_"))return 0; {
  if (!strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)((unint64_t)"ZN3ctu20SharedSynchronizableI11ServiceCtrlE15make_shared_ptrIS1_EENSt3__110shared_ptrIT_EEPS6_EUlPS1_E_" & 0x7FFFFFFFFFFFFFFFLL)))return a1 + 24;
  }
  return 0;
}

uint64_t std::shared_ptr<ServiceCtrl> ctu::SharedSynchronizable<ServiceCtrl>::make_shared_ptr<ServiceCtrl>(ServiceCtrl*)::{lambda(ServiceCtrl*)#1}::operator() const(ServiceCtrl*)::{lambda(void *)#1}::__invoke(uint64_t result)
{
  if (result) {
    return (*(uint64_t (**)(void))(*(void *)result + 8))();
  }
  return result;
}

void ServiceCtrl::~ServiceCtrl(char **this)
{
  ServiceCtrl::~ServiceCtrl(this);

  operator delete(v1);
}

{
  std::__shared_weak_count *v2;
  NSObject *v3;
  NSObject *v4;
  std::__shared_weak_count *v5;

  *this = (char *)&unk_1F2112560;
  std::__tree<std::__value_type<std::string,dispatch::block<void({block_pointer})(xpc::dict,dispatch::block<void({block_pointer})(int,xpc::dict)>)>>,std::__map_value_compare<std::string,std::__value_type<std::string,dispatch::block<void({block_pointer})(xpc::dict,dispatch::block<void({block_pointer})(int,xpc::dict)>)>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,dispatch::block<void({block_pointer})(xpc::dict,dispatch::block<void({block_pointer})(int,xpc::dict)>)>>>>::destroy(this[16]);
  uint64_t v2 = (std::__shared_weak_count *)this[14];
  if (v2) {
    std::__shared_weak_count::__release_weak(v2);
  }
  *this = (char *)&unk_1F2112670;
  MEMORY[0x1C87940C0](this + 1);
  unint64_t v3 = this[12];
  if (v3) {
    dispatch_release(v3);
  }
  uint64_t v4 = this[11];
  if (v4) {
    dispatch_release(v4);
  }
  uint64_t v5 = (std::__shared_weak_count *)this[10];
  if (v5) {
    std::__shared_weak_count::__release_weak(v5);
  }
}

uint64_t ctu::Loggable<ServiceCtrl,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::updateTrackedConfig(uint64_t a1)
{
  return MEMORY[0x1F417DA50](a1 + 8);
}

void ctu::Loggable<ServiceCtrl,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::getTrackedLoggerName(char *a1@<X8>)
{
  a1[23] = 8;
  strcpy(a1, "svc.ctrl");
}

uint64_t ctu::Loggable<ServiceCtrl,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::getTrackedLogLevel(uint64_t a1)
{
  return MEMORY[0x1F417DD10](a1 + 8);
}

void *ctu::SharedLoggable<ServiceCtrl,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::~SharedLoggable(void *a1)
{
  *a1 = &unk_1F2112670;
  MEMORY[0x1C87940C0](a1 + 1);
  uint64_t v2 = a1[12];
  if (v2) {
    dispatch_release(v2);
  }
  unint64_t v3 = a1[11];
  if (v3) {
    dispatch_release(v3);
  }
  uint64_t v4 = (std::__shared_weak_count *)a1[10];
  if (v4) {
    std::__shared_weak_count::__release_weak(v4);
  }
  return a1;
}

void ctu::SharedLoggable<ServiceCtrl,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::~SharedLoggable(void *a1)
{
  *a1 = &unk_1F2112670;
  MEMORY[0x1C87940C0](a1 + 1);
  uint64_t v2 = a1[12];
  if (v2) {
    dispatch_release(v2);
  }
  unint64_t v3 = a1[11];
  if (v3) {
    dispatch_release(v3);
  }
  uint64_t v4 = (std::__shared_weak_count *)a1[10];
  if (v4) {
    std::__shared_weak_count::__release_weak(v4);
  }

  operator delete(a1);
}

void *ctu::Loggable<ServiceCtrl,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::~Loggable(void *a1)
{
  *a1 = &unk_1F2112670;
  MEMORY[0x1C87940C0](a1 + 1);
  return a1;
}

void ctu::Loggable<ServiceCtrl,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::~Loggable(void *a1)
{
  *a1 = &unk_1F2112670;
  MEMORY[0x1C87940C0](a1 + 1);

  operator delete(a1);
}

void std::__tree<std::__value_type<std::string,dispatch::block<void({block_pointer})(xpc::dict,dispatch::block<void({block_pointer})(int,xpc::dict)>)>>,std::__map_value_compare<std::string,std::__value_type<std::string,dispatch::block<void({block_pointer})(xpc::dict,dispatch::block<void({block_pointer})(int,xpc::dict)>)>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,dispatch::block<void({block_pointer})(xpc::dict,dispatch::block<void({block_pointer})(int,xpc::dict)>)>>>>::destroy(char *a1)
{
  if (a1)
  {
    std::__tree<std::__value_type<std::string,dispatch::block<void({block_pointer})(xpc::dict,dispatch::block<void({block_pointer})(int,xpc::dict)>)>>,std::__map_value_compare<std::string,std::__value_type<std::string,dispatch::block<void({block_pointer})(xpc::dict,dispatch::block<void({block_pointer})(int,xpc::dict)>)>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,dispatch::block<void({block_pointer})(xpc::dict,dispatch::block<void({block_pointer})(int,xpc::dict)>)>>>>::destroy(*(void *)a1);
    std::__tree<std::__value_type<std::string,dispatch::block<void({block_pointer})(xpc::dict,dispatch::block<void({block_pointer})(int,xpc::dict)>)>>,std::__map_value_compare<std::string,std::__value_type<std::string,dispatch::block<void({block_pointer})(xpc::dict,dispatch::block<void({block_pointer})(int,xpc::dict)>)>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,dispatch::block<void({block_pointer})(xpc::dict,dispatch::block<void({block_pointer})(int,xpc::dict)>)>>>>::destroy(*((void *)a1 + 1));
    uint64_t v2 = (const void *)*((void *)a1 + 7);
    if (v2) {
      _Block_release(v2);
    }
    if (a1[55] < 0)
    {
      operator delete(*((void **)a1 + 4));
      unint64_t v3 = a1;
    }
    else
    {
      unint64_t v3 = a1;
    }
    operator delete(v3);
  }
}

void ___ZNK3ctu20SharedSynchronizableI11ServiceCtrlE20execute_wrapped_syncIZNS1_22registerCommandHandlerERKNSt3__112basic_stringIcNS4_11char_traitsIcEENS4_9allocatorIcEEEEN8dispatch5blockIU13block_pointerFvN3xpc4dictENSE_IU13block_pointerFviSG_EEEEEEEUlvE_EEDTclsr8dispatchE4syncLDnEclsr3stdE7forwardIT_Efp_EEEOSO__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(uint64_t **)(a1 + 40);
  uint64_t v2 = *v1;
  unint64_t v3 = (const void *)v1[4];
  if (v3)
  {
    uint64_t v4 = _Block_copy(v3);
    uint64_t v5 = v1 + 1;
    uint64_t v7 = (void *)(v2 + 128);
    dispatch_object_t v6 = *(void **)(v2 + 128);
    if (v6)
    {
LABEL_3:
      int v8 = *((char *)v1 + 31);
      if (v8 >= 0) {
        uint64_t v9 = v5;
      }
      else {
        uint64_t v9 = (const void *)v1[1];
      }
      if (v8 >= 0) {
        size_t v10 = *((unsigned __int8 *)v1 + 31);
      }
      else {
        size_t v10 = v1[2];
      }
      while (1)
      {
        long long v11 = v6;
        uint64_t v14 = (const void *)v6[4];
        uint64_t v12 = v6 + 4;
        uint64_t v13 = v14;
        int v15 = *((char *)v12 + 23);
        if (v15 >= 0) {
          CFTypeRef v16 = v12;
        }
        else {
          CFTypeRef v16 = v13;
        }
        if (v15 >= 0) {
          size_t v17 = *((unsigned __int8 *)v12 + 23);
        }
        else {
          size_t v17 = v12[1];
        }
        if (v17 >= v10) {
          size_t v18 = v10;
        }
        else {
          size_t v18 = v17;
        }
        int v19 = memcmp(v9, v16, v18);
        if (v19)
        {
          if (v19 < 0) {
            goto LABEL_9;
          }
LABEL_23:
          int v20 = memcmp(v16, v9, v18);
          if (v20)
          {
            if ((v20 & 0x80000000) == 0) {
              goto LABEL_38;
            }
          }
          else if (v17 >= v10)
          {
LABEL_38:
            uint64_t v26 = (const void *)v11[7];
            v11[7] = v4;
            if (v26) {
              goto LABEL_39;
            }
            return;
          }
          dispatch_object_t v6 = (void *)v11[1];
          if (!v6)
          {
            uint64_t v7 = v11 + 1;
            goto LABEL_31;
          }
        }
        else
        {
          if (v10 >= v17) {
            goto LABEL_23;
          }
LABEL_9:
          dispatch_object_t v6 = (void *)*v11;
          uint64_t v7 = v11;
          if (!*v11) {
            goto LABEL_31;
          }
        }
      }
    }
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v5 = v1 + 1;
    uint64_t v7 = (void *)(v2 + 128);
    dispatch_object_t v6 = *(void **)(v2 + 128);
    if (v6) {
      goto LABEL_3;
    }
  }
  long long v11 = v7;
LABEL_31:
  std::string v21 = operator new(0x40uLL);
  uint64_t v22 = (std::string *)(v21 + 4);
  if (*((char *)v1 + 31) < 0)
  {
    std::string::__init_copy_ctor_external(v22, (const std::string::value_type *)v1[1], v1[2]);
  }
  else
  {
    long long v23 = *(_OWORD *)v5;
    v21[6] = v5[2];
    *(_OWORD *)&v22->__r_.__value_.__l.__data_ = v23;
  }
  v21[7] = 0;
  *std::string v21 = 0;
  v21[1] = 0;
  v21[2] = v11;
  *uint64_t v7 = v21;
  uint64_t v24 = **(void **)(v2 + 120);
  uint64_t v25 = v21;
  if (v24)
  {
    *(void *)(v2 + 120) = v24;
    uint64_t v25 = (uint64_t *)*v7;
  }
  std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(*(uint64_t **)(v2 + 128), v25);
  ++*(void *)(v2 + 136);
  uint64_t v26 = (const void *)v21[7];
  v21[7] = v4;
  if (v26) {
LABEL_39:
  }
    _Block_release(v26);
}

void sub_1C5BB85D0(_Unwind_Exception *a1)
{
  operator delete(v2);
  if (v1) {
    _Block_release(v1);
  }
  _Unwind_Resume(a1);
}

void ___ZZN11ServiceCtrl13handleCommandERKNSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEEN3xpc4dictEN8dispatch5blockIU13block_pointerFviSA_EEEENKUlvE_clEv_block_invoke_42(uint64_t a1, unsigned int a2, void **a3)
{
  unsigned int v3 = a2;
  dispatch::block<void({block_pointer})(int,xpc::dict)>::operator()<int &,xpc::dict&>((uint64_t *)(a1 + 32), &v3, a3);
}

void ___ZZN11ServiceCtrl13handleCommandERKNSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEEN3xpc4dictEN8dispatch5blockIU13block_pointerFviSA_EEEENKUlvE_clEv_block_invoke_44(uint64_t a1, unsigned int a2, void **a3)
{
  unsigned int v9 = a2;
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v6 = *(void *)(v4 + 40);
  uint64_t v5 = (uint64_t *)(v4 + 40);
  if (v6)
  {
    dispatch::block<void({block_pointer})(int,xpc::dict)>::operator()<int &,xpc::dict&>(v5, &v9, a3);
    uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
    int v8 = *(const void **)(v7 + 40);
    *(void *)(v7 + 40) = 0;
    if (v8) {
      _Block_release(v8);
    }
  }
}

uint64_t *std::unique_ptr<ServiceCtrl::handleCommand(std::string const&,xpc::dict,dispatch::block<void({block_pointer})(int,xpc::dict)>)::{lambda(void)#1},std::default_delete<ServiceCtrl::handleCommand(std::string const&,xpc::dict,dispatch::block<void({block_pointer})(int,xpc::dict)>)::{lambda(void)#1}>>::~unique_ptr[abi:ne180100](uint64_t *a1)
{
  uint64_t v2 = *a1;
  *a1 = 0;
  if (v2)
  {
    unsigned int v3 = *(const void **)(v2 + 40);
    if (v3) {
      _Block_release(v3);
    }
    xpc_release(*(xpc_object_t *)(v2 + 32));
    *(void *)(v2 + 32) = 0;
    if (*(char *)(v2 + 31) < 0) {
      operator delete(*(void **)(v2 + 8));
    }
    operator delete((void *)v2);
  }
  return a1;
}

void *ctu::Loggable<ServiceManager,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::Loggable<ctu::OsLogContext,std::shared_ptr<ctu::LogServer>>(void *a1, uint64_t a2, void *a3)
{
  *a1 = &unk_1F21124D0;
  ctu::OsLogContext::OsLogContext();
  ctu::OsLogContext::OsLogContext();
  ctu::LoggerCommonBase::LoggerCommonBase();
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)v8);
  a1[1] = &unk_1F2102CB8;
  a1[7] = *a3;
  uint64_t v5 = a3[1];
  a1[8] = v5;
  if (v5) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v5 + 8), 1uLL, memory_order_relaxed);
  }
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)&v7);
  return a1;
}

void sub_1C5BB87C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, char a11)
{
}

void *ctu::SharedLoggable<ServiceManager,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::~SharedLoggable(void *a1)
{
  *a1 = &unk_1F21124D0;
  MEMORY[0x1C87940C0](a1 + 1);
  uint64_t v2 = a1[12];
  if (v2) {
    dispatch_release(v2);
  }
  unsigned int v3 = a1[11];
  if (v3) {
    dispatch_release(v3);
  }
  uint64_t v4 = (std::__shared_weak_count *)a1[10];
  if (v4) {
    std::__shared_weak_count::__release_weak(v4);
  }
  return a1;
}

void ctu::SharedLoggable<ServiceManager,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::~SharedLoggable(void *a1)
{
  *a1 = &unk_1F21124D0;
  MEMORY[0x1C87940C0](a1 + 1);
  uint64_t v2 = a1[12];
  if (v2) {
    dispatch_release(v2);
  }
  unsigned int v3 = a1[11];
  if (v3) {
    dispatch_release(v3);
  }
  uint64_t v4 = (std::__shared_weak_count *)a1[10];
  if (v4) {
    std::__shared_weak_count::__release_weak(v4);
  }

  operator delete(a1);
}

void dispatch::async<void ctu::SharedSynchronizable<ServiceManager>::execute_wrapped<ServiceManager::sleep(dispatch::group_session)::$_0>(ServiceManager::sleep(dispatch::group_session)::$_0 &&)::{lambda(void)#1}>(dispatch_queue_s *,std::unique_ptr<ServiceManager::sleep(dispatch::group_session)::$_0,dispatch_queue_s *::default_delete<ServiceManager::sleep(dispatch::group_session)::$_0>>)::{lambda(void *)#1}::__invoke(uint64_t **a1)
{
  uint64_t v1 = a1;
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  uint64_t v3 = **a1;
  unsigned __int8 v4 = atomic_load((unsigned __int8 *)(v3 + 192));
  uint64_t v5 = *(NSObject **)(v3 + 40);
  if ((v4 & 1) == 0)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = (uint64_t)(*(void *)(v3 + 152) - *(void *)(v3 + 144)) >> 4;
      *(_DWORD *)std::string buf = 134217984;
      *(void *)&buf[4] = v6;
      _os_log_impl(&dword_1C59C6000, v5, OS_LOG_TYPE_DEFAULT, "#I Request %zd services to sleep", buf, 0xCu);
    }
    dispatch_object_t v47 = v2;
    unint64_t v48 = v1;
    uint64_t v7 = dispatch_group_create();
    int v8 = (std::__shared_weak_count *)operator new(0x38uLL);
    unsigned int v9 = &v8->__vftable;
    v8->__shared_owners_ = 0;
    dispatch_object_t v45 = v8;
    p_shared_owners = &v8->__shared_owners_;
    v8->__shared_weak_owners_ = 0;
    v8->__vftable = (std::__shared_weak_count_vtbl *)&unk_1F2112740;
    v8[1].__vftable = (std::__shared_weak_count_vtbl *)v7;
    size_t v10 = (NSObject **)&v8[1];
    if (v7)
    {
      dispatch_retain(v7);
      v9[4] = 0;
      v9[5] = 0;
      v9[6] = 0;
      dispatch_release(v7);
      long long v11 = *(uint64_t **)(v3 + 144);
      uint64_t v12 = *(uint64_t **)(v3 + 152);
      if (v11 != v12) {
        goto LABEL_12;
      }
LABEL_33:
      long long v23 = *v10;
      uint64_t v24 = (*(uint64_t (**)(uint64_t))(*(void *)v3 + 104))(v3);
      dispatch_time_t v25 = dispatch_time(0, 1000000000 * v24);
      if (!dispatch_group_wait(v23, v25)) {
        goto LABEL_58;
      }
      memset(buf, 0, sizeof(buf));
      *(void *)&long long v56 = 0;
      shared_owners = (uint64_t *)v45[1].__shared_owners_;
      shared_weak_owners = (uint64_t *)v45[1].__shared_weak_owners_;
      if (shared_owners == shared_weak_owners)
      {
        int8x8_t v35 = 0;
        uint64_t v36 = *(NSObject **)(v3 + 40);
        if (!os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
          goto LABEL_50;
        }
      }
      else
      {
        do
        {
          uint64_t v28 = (std::__shared_weak_count *)shared_owners[1];
          if (v28)
          {
            uint64_t v29 = std::__shared_weak_count::lock(v28);
            if (v29)
            {
              float v30 = v29;
              uint64_t v31 = *shared_owners;
              if (*shared_owners)
              {
                uint64_t v32 = *(_OWORD **)&buf[8];
                if (*(void *)&buf[8] >= (unint64_t)v56)
                {
                  uint64_t v34 = std::vector<std::string>::__emplace_back_slow_path<std::string const&>((char **)buf, v31);
                }
                else
                {
                  if (*(char *)(v31 + 23) < 0)
                  {
                    std::string::__init_copy_ctor_external(*(std::string **)&buf[8], *(const std::string::value_type **)v31, *(void *)(v31 + 8));
                  }
                  else
                  {
                    long long v33 = *(_OWORD *)v31;
                    *(void *)(*(void *)&buf[8] + 16) = *(void *)(v31 + 16);
                    *uint64_t v32 = v33;
                  }
                  uint64_t v34 = (std::string *)((char *)v32 + 24);
                }
                *(void *)&uint8_t buf[8] = v34;
              }
              if (!atomic_fetch_add(&v30->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
              {
                ((void (*)(std::__shared_weak_count *))v30->__on_zero_shared)(v30);
                std::__shared_weak_count::__release_weak(v30);
              }
            }
          }
          shared_owners += 2;
        }
        while (shared_owners != shared_weak_owners);
        int8x8_t v35 = *(std::string **)buf;
        uint64_t v36 = *(NSObject **)(v3 + 40);
        if (!os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
        {
LABEL_50:
          if (v35)
          {
LABEL_51:
            dispatch_object_t v37 = *(std::string **)&buf[8];
            uint64_t v38 = v35;
            if (*(std::string **)&buf[8] != v35)
            {
              do
              {
                if (SHIBYTE(v37[-1].__r_.__value_.__r.__words[2]) < 0) {
                  operator delete(v37[-1].__r_.__value_.__l.__data_);
                }
                --v37;
              }
              while (v37 != v35);
              uint64_t v38 = *(std::string **)buf;
            }
            *(void *)&uint8_t buf[8] = v35;
            operator delete(v38);
          }
LABEL_58:
          unint64_t v39 = *(NSObject **)(v3 + 40);
          uint64_t v2 = v47;
          uint64_t v1 = v48;
          if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)std::string buf = 0;
            _os_log_impl(&dword_1C59C6000, v39, OS_LOG_TYPE_DEFAULT, "#I All services acknowledged for sleep request", buf, 2u);
          }
          if (!atomic_fetch_add(p_shared_owners, 0xFFFFFFFFFFFFFFFFLL))
          {
            ((void (*)(std::__shared_weak_count *))v45->__on_zero_shared)(v45);
            std::__shared_weak_count::__release_weak(v45);
          }
          goto LABEL_62;
        }
      }
      uint64_t v43 = *(void *)&buf[8];
      ctu::join<std::__wrap_iter<std::string *>>(&__p, v35, *(long long **)&buf[8]);
      if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        p_p = &__p;
      }
      else {
        p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
      }
      *(_DWORD *)dispatch_object_t object = 134218242;
      *(void *)&object[4] = 0xAAAAAAAAAAAAAAABLL * ((v43 - (uint64_t)v35) >> 3);
      __int16 v53 = 2080;
      uint64_t v54 = p_p;
      _os_log_error_impl(&dword_1C59C6000, v36, OS_LOG_TYPE_ERROR, "Sleep TIMEOUT: %zd clients failed to complete sleep request: %s", object, 0x16u);
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(__p.__r_.__value_.__l.__data_);
      }
      int8x8_t v35 = *(std::string **)buf;
      if (!*(void *)buf) {
        goto LABEL_58;
      }
      goto LABEL_51;
    }
    v8[1].__shared_owners_ = 0;
    v8[1].__shared_weak_owners_ = 0;
    v8[2].__vftable = 0;
    long long v11 = *(uint64_t **)(v3 + 144);
    uint64_t v12 = *(uint64_t **)(v3 + 152);
    if (v11 == v12) {
      goto LABEL_33;
    }
    while (1)
    {
LABEL_12:
      uint64_t v13 = *(NSObject **)(v3 + 40);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v14 = (*(uint64_t (**)(void))(*(void *)*v11 + 16))();
        *(_DWORD *)std::string buf = 136315138;
        *(void *)&buf[4] = v14;
        _os_log_impl(&dword_1C59C6000, v13, OS_LOG_TYPE_DEFAULT, "#I Requesting '%s' to sleep", buf, 0xCu);
      }
      *(void *)dispatch_object_t object = 0xAAAAAAAAAAAAAAAALL;
      int v15 = (const char *)(*(uint64_t (**)(void))(*(void *)*v11 + 16))();
      size_t v16 = strlen(v15);
      if (v16 >= 0x7FFFFFFFFFFFFFF8) {
        std::string::__throw_length_error[abi:ne180100]();
      }
      std::string::size_type v17 = v16;
      if (v16 >= 0x17) {
        break;
      }
      *((unsigned char *)&__dst.__r_.__value_.__s + 23) = v16;
      p_dst = &__dst;
      if (v16) {
        goto LABEL_21;
      }
LABEL_22:
      p_dst->__r_.__value_.__s.__data_[v17] = 0;
      std::string __p = __dst;
      memset(&__dst, 0, sizeof(__dst));
      *(_OWORD *)std::string buf = 0u;
      long long v56 = 0u;
      long long v57 = 0u;
      ctu::TrackedGroup::fork((NSObject **)object, (uint64_t)v10, (uint64_t)&__p, (uint64_t)buf);
      ctu::os::signpost_interval::~signpost_interval((ctu::os::signpost_interval *)buf);
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      {
        operator delete(__p.__r_.__value_.__l.__data_);
        uint64_t v21 = *v11;
        uint64_t v22 = *(NSObject **)object;
        dispatch_group_t group = *(dispatch_group_t *)object;
        if (*(void *)object)
        {
LABEL_26:
          dispatch_retain(v22);
          if (group) {
            dispatch_group_enter(group);
          }
        }
      }
      else
      {
        uint64_t v21 = *v11;
        uint64_t v22 = *(NSObject **)object;
        dispatch_group_t group = *(dispatch_group_t *)object;
        if (*(void *)object) {
          goto LABEL_26;
        }
      }
      (*(void (**)(uint64_t, dispatch_group_t *))(*(void *)v21 + 48))(v21, &group);
      if (group)
      {
        dispatch_group_leave(group);
        if (group) {
          dispatch_release(group);
        }
      }
      if (v22)
      {
        dispatch_group_leave(v22);
        dispatch_release(v22);
      }
      v11 += 2;
      if (v11 == v12) {
        goto LABEL_33;
      }
    }
    uint64_t v19 = (v16 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v16 | 7) != 0x17) {
      uint64_t v19 = v16 | 7;
    }
    uint64_t v20 = v19 + 1;
    p_dst = (std::string *)operator new(v19 + 1);
    __dst.__r_.__value_.__l.__size_ = v17;
    __dst.__r_.__value_.__r.__words[2] = v20 | 0x8000000000000000;
    __dst.__r_.__value_.__r.__words[0] = (std::string::size_type)p_dst;
LABEL_21:
    memmove(p_dst, v15, v17);
    goto LABEL_22;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)std::string buf = 0;
    _os_log_debug_impl(&dword_1C59C6000, v5, OS_LOG_TYPE_DEBUG, "#D Server is down; ignoring sleep request", buf, 2u);
  }
LABEL_62:
  long long v40 = v2[1];
  if (v40)
  {
    dispatch_group_leave(v40);
    uint64_t v41 = v2[1];
    if (v41) {
      dispatch_release(v41);
    }
  }
  operator delete(v2);
  unint64_t v42 = (std::__shared_weak_count *)v1[2];
  if (v42 && !atomic_fetch_add(&v42->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v42->__on_zero_shared)(v42);
    std::__shared_weak_count::__release_weak(v42);
  }
  operator delete(v1);
}

void sub_1C5BB8F98(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, std::__shared_weak_count *a9, atomic_ullong *a10, void *a11, void *a12, uint64_t a13, uint64_t a14, dispatch_group_t group, uint64_t a16, uint64_t a17, uint64_t a18, void *a19, uint64_t a20,int a21,__int16 a22,char a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,void **__p,uint64_t a31)
{
  if (!atomic_fetch_add(&v31->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v31->__on_zero_shared)(v31);
    std::__shared_weak_count::__release_weak(v31);
  }
  if (__p)
  {
    uint64_t v34 = v32;
    int8x8_t v35 = __p;
    if (v32 != __p)
    {
      do
      {
        if (*((char *)v34 - 1) < 0) {
          operator delete(*(v34 - 3));
        }
        v34 -= 3;
      }
      while (v34 != __p);
      int8x8_t v35 = __p;
    }
    operator delete(v35);
  }
  if (!atomic_fetch_add(a10, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))a9->__on_zero_shared)(a9);
    std::__shared_weak_count::__release_weak(a9);
  }
  uint64_t v36 = a11[1];
  if (v36)
  {
    dispatch_group_leave(v36);
    dispatch_object_t v37 = a11[1];
    if (v37) {
      dispatch_release(v37);
    }
  }
  operator delete(a11);
  uint64_t v38 = (std::__shared_weak_count *)a12[2];
  if (v38)
  {
    if (!atomic_fetch_add(&v38->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v38->__on_zero_shared)(v38);
      std::__shared_weak_count::__release_weak(v38);
    }
  }
  operator delete(a12);
  _Unwind_Resume(a1);
}

void std::__shared_ptr_emplace<ctu::TrackedGroup>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_1F2112740;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<ctu::TrackedGroup>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_1F2112740;
  std::__shared_weak_count::~__shared_weak_count(a1);

  operator delete(v1);
}

void std::__shared_ptr_emplace<ctu::TrackedGroup>::__on_zero_shared(void *a1)
{
  uint64_t v2 = a1[4];
  if (v2)
  {
    uint64_t v3 = a1[5];
    unsigned __int8 v4 = (void *)a1[4];
    if (v3 != v2)
    {
      do
      {
        uint64_t v5 = *(std::__shared_weak_count **)(v3 - 8);
        if (v5) {
          std::__shared_weak_count::__release_weak(v5);
        }
        v3 -= 16;
      }
      while (v3 != v2);
      unsigned __int8 v4 = (void *)a1[4];
    }
    a1[5] = v2;
    operator delete(v4);
  }
  uint64_t v6 = a1[3];
  if (v6)
  {
    dispatch_release(v6);
  }
}

void ctu::TrackedGroup::fork(NSObject **a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  int v8 = dispatch_group_create();
  unsigned int v9 = v8;
  *a1 = v8;
  if (v8)
  {
    dispatch_retain(v8);
    dispatch_group_enter(v9);
    dispatch_release(v9);
  }
  size_t v10 = (char *)operator new(0x30uLL);
  *((void *)v10 + 1) = 0;
  *((void *)v10 + 2) = 0;
  *(void *)size_t v10 = &unk_1F2112790;
  *(_OWORD *)(v10 + 24) = *(_OWORD *)a3;
  *((void *)v10 + 5) = *(void *)(a3 + 16);
  *(void *)(a3 + 8) = 0;
  *(void *)(a3 + 16) = 0;
  *(void *)a3 = 0;
  *(void *)&long long v37 = v10 + 24;
  *((void *)&v37 + 1) = v10;
  long long v11 = *(NSObject **)a2;
  if (*(void *)a2)
  {
    dispatch_retain(*(dispatch_object_t *)a2);
    dispatch_group_enter(v11);
  }
  global_queue = dispatch_get_global_queue(0, 0);
  uint64_t v13 = global_queue;
  if (global_queue) {
    dispatch_retain(global_queue);
  }
  *(void *)&long long v38 = v10 + 24;
  *((void *)&v38 + 1) = v10;
  atomic_fetch_add_explicit((atomic_ullong *volatile)v10 + 1, 1uLL, memory_order_relaxed);
  group[0] = v11;
  if (v11)
  {
    dispatch_retain(v11);
    dispatch_group_enter(v11);
  }
  uint64_t v14 = *(void *)(a4 + 8);
  group[1] = *(dispatch_group_t *)a4;
  uint64_t v40 = v14;
  uint64_t v15 = a4 + 16;
  uint64_t v16 = *(void *)(a4 + 40);
  if (v16)
  {
    if (v16 == v15)
    {
      unint64_t v42 = v41;
      (*(void (**)(uint64_t, void *))(*(void *)v15 + 24))(a4 + 16, v41);
    }
    else
    {
      unint64_t v42 = *(void **)(a4 + 40);
      *(void *)(a4 + 40) = 0;
    }
  }
  else
  {
    unint64_t v42 = 0;
  }
  *(void *)a4 = 0;
  *(void *)(a4 + 8) = 0;
  uint64_t v17 = *(void *)(a4 + 40);
  *(void *)(a4 + 40) = 0;
  if (v17 == v15)
  {
    (*(void (**)(uint64_t))(*(void *)v15 + 32))(a4 + 16);
  }
  else if (v17)
  {
    (*(void (**)(uint64_t))(*(void *)v17 + 40))(v17);
  }
  size_t v18 = (char *)operator new(0x48uLL);
  uint64_t v19 = v18;
  long long v20 = *(_OWORD *)group;
  *(_OWORD *)size_t v18 = v38;
  *((_OWORD *)v18 + 1) = v20;
  uint64_t v21 = v42;
  *((void *)v18 + 4) = v40;
  if (v21)
  {
    if (v21 == v41)
    {
      *((void *)v18 + 8) = v18 + 40;
      (*(void (**)(void *))(v41[0] + 24))(v41);
    }
    else
    {
      *((void *)v18 + 8) = v21;
      unint64_t v42 = 0;
    }
  }
  else
  {
    *((void *)v18 + 8) = 0;
  }
  group[1] = 0;
  uint64_t v40 = 0;
  uint64_t v22 = v42;
  unint64_t v42 = 0;
  if (v22 == v41)
  {
    (*(void (**)(void *))(v41[0] + 32))(v41);
  }
  else if (v22)
  {
    (*(void (**)(void *))(*v22 + 40))(v22);
  }
  dispatch_group_notify_f(v9, v13, v19, (dispatch_function_t)dispatch::detail::group_notify<ctu::TrackedGroup::fork(std::string,ctu::os::signpost_interval)::{lambda(void)#1}>(dispatch_group_s *,dispatch_queue_s *,ctu::TrackedGroup::fork(std::string,ctu::os::signpost_interval)::{lambda(void)#1} &&,std::integral_constant<BOOL,false>)::{lambda(void *)#1}::__invoke);
  ctu::os::signpost_interval::~signpost_interval((ctu::os::signpost_interval *)&group[1]);
  if (v13) {
    dispatch_release(v13);
  }
  uint64_t v24 = *(char **)(a2 + 16);
  unint64_t v23 = *(void *)(a2 + 24);
  if ((unint64_t)v24 >= v23)
  {
    uint64_t v26 = *(char **)(a2 + 8);
    uint64_t v27 = (v24 - v26) >> 4;
    unint64_t v28 = v27 + 1;
    if ((unint64_t)(v27 + 1) >> 60) {
      std::vector<dispatch::callback<void({block_pointer})(sar::OBDState,sar::TunerState)>>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v29 = v23 - (void)v26;
    if (v29 >> 3 > v28) {
      unint64_t v28 = v29 >> 3;
    }
    if ((unint64_t)v29 >= 0x7FFFFFFFFFFFFFF0) {
      unint64_t v30 = 0xFFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v30 = v28;
    }
    if (v30 >> 60) {
      std::__throw_bad_array_new_length[abi:ne180100]();
    }
    uint64_t v31 = (char *)operator new(16 * v30);
    uint64_t v32 = &v31[16 * v27];
    *(_OWORD *)uint64_t v32 = v37;
    if (*((void *)&v37 + 1))
    {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(*((void *)&v37 + 1) + 16), 1uLL, memory_order_relaxed);
      uint64_t v26 = *(char **)(a2 + 8);
      uint64_t v24 = *(char **)(a2 + 16);
    }
    long long v33 = &v31[16 * v30];
    dispatch_time_t v25 = v32 + 16;
    if (v24 == v26)
    {
      *(void *)(a2 + 8) = v32;
      *(void *)(a2 + 16) = v25;
      *(void *)(a2 + 24) = v33;
    }
    else
    {
      do
      {
        long long v34 = *((_OWORD *)v24 - 1);
        v24 -= 16;
        *((_OWORD *)v32 - 1) = v34;
        v32 -= 16;
        *(void *)uint64_t v24 = 0;
        *((void *)v24 + 1) = 0;
      }
      while (v24 != v26);
      uint64_t v26 = *(char **)(a2 + 8);
      int8x8_t v35 = *(char **)(a2 + 16);
      *(void *)(a2 + 8) = v32;
      *(void *)(a2 + 16) = v25;
      *(void *)(a2 + 24) = v33;
      while (v35 != v26)
      {
        uint64_t v36 = (std::__shared_weak_count *)*((void *)v35 - 1);
        if (v36) {
          std::__shared_weak_count::__release_weak(v36);
        }
        v35 -= 16;
      }
    }
    if (v26) {
      operator delete(v26);
    }
  }
  else
  {
    *(void *)uint64_t v24 = v37;
    *((void *)v24 + 1) = v10;
    if (v10) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)v10 + 2, 1uLL, memory_order_relaxed);
    }
    dispatch_time_t v25 = v24 + 16;
  }
  *(void *)(a2 + 16) = v25;
  if (v11)
  {
    dispatch_group_leave(v11);
    dispatch_release(v11);
  }
  if (*((void *)&v37 + 1))
  {
    if (!atomic_fetch_add((atomic_ullong *volatile)(*((void *)&v37 + 1) + 8), 0xFFFFFFFFFFFFFFFFLL))
    {
      (*(void (**)(void))(**((void **)&v37 + 1) + 16))(*((void *)&v37 + 1));
      std::__shared_weak_count::__release_weak(*((std::__shared_weak_count **)&v37 + 1));
    }
  }
}

void sub_1C5BB9798(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, char a13)
{
  if (a2) {
    __clang_call_terminate(exception_object);
  }
  _Unwind_Resume(exception_object);
}

void *ctu::TrackedGroup::fork(std::string,ctu::os::signpost_interval)::{lambda(void)#1}::~signpost_interval(void *a1)
{
  ctu::os::signpost_interval::~signpost_interval((ctu::os::signpost_interval *)(a1 + 3));
  uint64_t v2 = a1[2];
  if (v2)
  {
    dispatch_group_leave(v2);
    uint64_t v3 = a1[2];
    if (v3) {
      dispatch_release(v3);
    }
  }
  unsigned __int8 v4 = (std::__shared_weak_count *)a1[1];
  if (!v4 || atomic_fetch_add(&v4->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL)) {
    return a1;
  }
  ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
  std::__shared_weak_count::__release_weak(v4);
  return a1;
}

void std::__shared_ptr_emplace<std::string>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_1F2112790;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<std::string>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_1F2112790;
  std::__shared_weak_count::~__shared_weak_count(a1);

  operator delete(v1);
}

void std::__shared_ptr_emplace<std::string>::__on_zero_shared(uint64_t a1)
{
  if (*(char *)(a1 + 47) < 0) {
    operator delete(*(void **)(a1 + 24));
  }
}

void dispatch::detail::group_notify<ctu::TrackedGroup::fork(std::string,ctu::os::signpost_interval)::{lambda(void)#1}>(dispatch_group_s *,dispatch_queue_s *,ctu::TrackedGroup::fork(std::string,ctu::os::signpost_interval)::{lambda(void)#1} &&,std::integral_constant<BOOL,false>)::{lambda(void *)#1}::__invoke(void *a1)
{
  if (a1)
  {
    ctu::os::signpost_interval::~signpost_interval((ctu::os::signpost_interval *)(a1 + 3));
    uint64_t v2 = a1[2];
    if (v2)
    {
      dispatch_group_leave(v2);
      uint64_t v3 = a1[2];
      if (v3) {
        dispatch_release(v3);
      }
    }
    unsigned __int8 v4 = (std::__shared_weak_count *)a1[1];
    if (v4 && !atomic_fetch_add(&v4->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
      std::__shared_weak_count::__release_weak(v4);
      uint64_t v5 = a1;
    }
    else
    {
      uint64_t v5 = a1;
    }
    operator delete(v5);
  }
}

void ctu::os::signpost_interval::~signpost_interval(ctu::os::signpost_interval *this)
{
  uint64_t v2 = *((void *)this + 5);
  if (v2 && *(void *)this)
  {
    uint64_t v3 = *((void *)this + 1);
    uint64_t v8 = *(void *)this;
    uint64_t v9 = v3;
    (*(void (**)(uint64_t, uint64_t *, uint64_t *))(*(void *)v2 + 48))(v2, &v9, &v8);
  }
  unsigned __int8 v4 = (void *)*((void *)this + 1);
  if (v4) {
    os_release(v4);
  }
  uint64_t v5 = (char *)this + 16;
  *((void *)this + 1) = 0;
  uint64_t v6 = (ctu::os::signpost_interval *)*((void *)this + 5);
  *((void *)this + 5) = 0;
  if (v6 == (ctu::os::signpost_interval *)((char *)this + 16))
  {
    (*(void (**)(char *))(*(void *)v5 + 32))((char *)this + 16);
    uint64_t v7 = (char *)*((void *)this + 5);
    *(void *)this = 0;
    if (v7 != v5) {
      goto LABEL_9;
    }
LABEL_13:
    (*(void (**)(char *))(*(void *)v5 + 32))((char *)this + 16);
    return;
  }
  if (!v6)
  {
    *(void *)this = 0;
    return;
  }
  (*(void (**)(ctu::os::signpost_interval *))(*(void *)v6 + 40))(v6);
  uint64_t v7 = (char *)*((void *)this + 5);
  *(void *)this = 0;
  if (v7 == v5) {
    goto LABEL_13;
  }
LABEL_9:
  if (v7) {
    (*(void (**)(char *))(*(void *)v7 + 40))(v7);
  }
}

std::string *ctu::join<std::__wrap_iter<std::string *>>(std::string *__dst, std::string *a2, long long *a3)
{
  __dst->__r_.__value_.__r.__words[0] = 0;
  __dst->__r_.__value_.__l.__size_ = 0;
  __dst->__r_.__value_.__r.__words[2] = 0;
  if (a2 != (std::string *)a3)
  {
    uint64_t v5 = __dst;
    if (a2 != __dst)
    {
      if (SHIBYTE(a2->__r_.__value_.__r.__words[2]) < 0)
      {
        std::string __dst = (std::string *)std::string::__assign_no_alias<true>(__dst, a2->__r_.__value_.__l.__data_, a2->__r_.__value_.__l.__size_);
      }
      else
      {
        long long v6 = *(_OWORD *)&a2->__r_.__value_.__l.__data_;
        __dst->__r_.__value_.__r.__words[2] = a2->__r_.__value_.__r.__words[2];
        *(_OWORD *)&__dst->__r_.__value_.__l.__data_ = v6;
      }
    }
    if (",")
    {
      for (uint64_t i = a2 + 1; i != (std::string *)a3; ++i)
      {
        HIBYTE(v19) = 1;
        memmove(__s, ",", 1uLL);
        __s[1] = 0;
        if (v19 >= 0) {
          uint64_t v15 = __s;
        }
        else {
          uint64_t v15 = *(std::string::value_type **)__s;
        }
        if (v19 >= 0) {
          std::string::size_type v16 = HIBYTE(v19);
        }
        else {
          std::string::size_type v16 = v18;
        }
        std::string::append(v5, v15, v16);
        if (SHIBYTE(v19) < 0) {
          operator delete(*(void **)__s);
        }
        int v12 = SHIBYTE(i->__r_.__value_.__r.__words[2]);
        if (v12 >= 0) {
          uint64_t v13 = (const std::string::value_type *)i;
        }
        else {
          uint64_t v13 = (const std::string::value_type *)i->__r_.__value_.__r.__words[0];
        }
        if (v12 >= 0) {
          std::string::size_type size = HIBYTE(i->__r_.__value_.__r.__words[2]);
        }
        else {
          std::string::size_type size = i->__r_.__value_.__l.__size_;
        }
        std::string __dst = std::string::append(v5, v13, size);
      }
    }
    else
    {
      for (j = a2 + 1; j != (std::string *)a3; ++j)
      {
        *(void *)__s = 0;
        std::string::size_type v18 = 0;
        uint64_t v19 = 0;
        std::string::append(v5, __s, 0);
        if (SHIBYTE(v19) < 0) {
          operator delete(*(void **)__s);
        }
        int v8 = SHIBYTE(j->__r_.__value_.__r.__words[2]);
        if (v8 >= 0) {
          uint64_t v9 = (const std::string::value_type *)j;
        }
        else {
          uint64_t v9 = (const std::string::value_type *)j->__r_.__value_.__r.__words[0];
        }
        if (v8 >= 0) {
          std::string::size_type v10 = HIBYTE(j->__r_.__value_.__r.__words[2]);
        }
        else {
          std::string::size_type v10 = j->__r_.__value_.__l.__size_;
        }
        std::string __dst = std::string::append(v5, v9, v10);
      }
    }
  }
  return __dst;
}

void sub_1C5BB9E20(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (*(char *)(v15 + 23) < 0)
  {
    operator delete(*(void **)v15);
    _Unwind_Resume(exception_object);
  }
  _Unwind_Resume(exception_object);
}

void dispatch::async<void ctu::SharedSynchronizable<ServiceManager>::execute_wrapped<ServiceManager::wake(dispatch::group_session)::$_0>(ServiceManager::wake(dispatch::group_session)::$_0 &&)::{lambda(void)#1}>(dispatch_queue_s *,std::unique_ptr<ServiceManager::wake(dispatch::group_session)::$_0,dispatch_queue_s *::default_delete<ServiceManager::wake(dispatch::group_session)::$_0>>)::{lambda(void *)#1}::__invoke(uint64_t **a1)
{
  uint64_t v1 = a1;
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  uint64_t v3 = **a1;
  unsigned __int8 v4 = atomic_load((unsigned __int8 *)(v3 + 192));
  uint64_t v5 = *(NSObject **)(v3 + 40);
  if ((v4 & 1) == 0)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = (uint64_t)(*(void *)(v3 + 152) - *(void *)(v3 + 144)) >> 4;
      *(_DWORD *)std::string buf = 134217984;
      *(void *)&buf[4] = v6;
      _os_log_impl(&dword_1C59C6000, v5, OS_LOG_TYPE_DEFAULT, "#I Request %zd services to wake", buf, 0xCu);
    }
    dispatch_object_t v47 = v2;
    unint64_t v48 = v1;
    uint64_t v7 = dispatch_group_create();
    int v8 = (std::__shared_weak_count *)operator new(0x38uLL);
    uint64_t v9 = &v8->__vftable;
    v8->__shared_owners_ = 0;
    dispatch_object_t v45 = v8;
    p_shared_owners = &v8->__shared_owners_;
    v8->__shared_weak_owners_ = 0;
    v8->__vftable = (std::__shared_weak_count_vtbl *)&unk_1F2112740;
    v8[1].__vftable = (std::__shared_weak_count_vtbl *)v7;
    std::string::size_type v10 = (NSObject **)&v8[1];
    if (v7)
    {
      dispatch_retain(v7);
      v9[4] = 0;
      v9[5] = 0;
      v9[6] = 0;
      dispatch_release(v7);
      long long v11 = *(uint64_t **)(v3 + 144);
      int v12 = *(uint64_t **)(v3 + 152);
      if (v11 != v12) {
        goto LABEL_12;
      }
LABEL_33:
      unint64_t v23 = *v10;
      uint64_t v24 = (*(uint64_t (**)(uint64_t))(*(void *)v3 + 104))(v3);
      dispatch_time_t v25 = dispatch_time(0, 2000000000 * v24);
      if (!dispatch_group_wait(v23, v25)) {
        goto LABEL_58;
      }
      memset(buf, 0, sizeof(buf));
      *(void *)&long long v56 = 0;
      shared_owners = (uint64_t *)v45[1].__shared_owners_;
      shared_weak_owners = (uint64_t *)v45[1].__shared_weak_owners_;
      if (shared_owners == shared_weak_owners)
      {
        int8x8_t v35 = 0;
        uint64_t v36 = *(NSObject **)(v3 + 40);
        if (!os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
          goto LABEL_50;
        }
      }
      else
      {
        do
        {
          unint64_t v28 = (std::__shared_weak_count *)shared_owners[1];
          if (v28)
          {
            uint64_t v29 = std::__shared_weak_count::lock(v28);
            if (v29)
            {
              unint64_t v30 = v29;
              uint64_t v31 = *shared_owners;
              if (*shared_owners)
              {
                uint64_t v32 = *(_OWORD **)&buf[8];
                if (*(void *)&buf[8] >= (unint64_t)v56)
                {
                  long long v34 = std::vector<std::string>::__emplace_back_slow_path<std::string const&>((char **)buf, v31);
                }
                else
                {
                  if (*(char *)(v31 + 23) < 0)
                  {
                    std::string::__init_copy_ctor_external(*(std::string **)&buf[8], *(const std::string::value_type **)v31, *(void *)(v31 + 8));
                  }
                  else
                  {
                    long long v33 = *(_OWORD *)v31;
                    *(void *)(*(void *)&buf[8] + 16) = *(void *)(v31 + 16);
                    *uint64_t v32 = v33;
                  }
                  long long v34 = (std::string *)((char *)v32 + 24);
                }
                *(void *)&uint8_t buf[8] = v34;
              }
              if (!atomic_fetch_add(&v30->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
              {
                ((void (*)(std::__shared_weak_count *))v30->__on_zero_shared)(v30);
                std::__shared_weak_count::__release_weak(v30);
              }
            }
          }
          shared_owners += 2;
        }
        while (shared_owners != shared_weak_owners);
        int8x8_t v35 = *(std::string **)buf;
        uint64_t v36 = *(NSObject **)(v3 + 40);
        if (!os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
        {
LABEL_50:
          if (v35)
          {
LABEL_51:
            long long v37 = *(std::string **)&buf[8];
            long long v38 = v35;
            if (*(std::string **)&buf[8] != v35)
            {
              do
              {
                if (SHIBYTE(v37[-1].__r_.__value_.__r.__words[2]) < 0) {
                  operator delete(v37[-1].__r_.__value_.__l.__data_);
                }
                --v37;
              }
              while (v37 != v35);
              long long v38 = *(std::string **)buf;
            }
            *(void *)&uint8_t buf[8] = v35;
            operator delete(v38);
          }
LABEL_58:
          unint64_t v39 = *(NSObject **)(v3 + 40);
          uint64_t v2 = v47;
          uint64_t v1 = v48;
          if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)std::string buf = 0;
            _os_log_impl(&dword_1C59C6000, v39, OS_LOG_TYPE_DEFAULT, "#I All services acknowledged for wake request", buf, 2u);
          }
          if (!atomic_fetch_add(p_shared_owners, 0xFFFFFFFFFFFFFFFFLL))
          {
            ((void (*)(std::__shared_weak_count *))v45->__on_zero_shared)(v45);
            std::__shared_weak_count::__release_weak(v45);
          }
          goto LABEL_62;
        }
      }
      uint64_t v43 = *(void *)&buf[8];
      ctu::join<std::__wrap_iter<std::string *>>(&__p, v35, *(long long **)&buf[8]);
      if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        p_p = &__p;
      }
      else {
        p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
      }
      *(_DWORD *)dispatch_object_t object = 134218242;
      *(void *)&object[4] = 0xAAAAAAAAAAAAAAABLL * ((v43 - (uint64_t)v35) >> 3);
      __int16 v53 = 2080;
      uint64_t v54 = p_p;
      _os_log_error_impl(&dword_1C59C6000, v36, OS_LOG_TYPE_ERROR, "Wake TIMEOUT: %zd clients failed to complete wake request: %s", object, 0x16u);
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(__p.__r_.__value_.__l.__data_);
      }
      int8x8_t v35 = *(std::string **)buf;
      if (!*(void *)buf) {
        goto LABEL_58;
      }
      goto LABEL_51;
    }
    v8[1].__shared_owners_ = 0;
    v8[1].__shared_weak_owners_ = 0;
    v8[2].__vftable = 0;
    long long v11 = *(uint64_t **)(v3 + 144);
    int v12 = *(uint64_t **)(v3 + 152);
    if (v11 == v12) {
      goto LABEL_33;
    }
    while (1)
    {
LABEL_12:
      uint64_t v13 = *(NSObject **)(v3 + 40);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v14 = (*(uint64_t (**)(void))(*(void *)*v11 + 16))();
        *(_DWORD *)std::string buf = 136315138;
        *(void *)&buf[4] = v14;
        _os_log_impl(&dword_1C59C6000, v13, OS_LOG_TYPE_DEFAULT, "#I Requesting '%s' to wake", buf, 0xCu);
      }
      *(void *)dispatch_object_t object = 0xAAAAAAAAAAAAAAAALL;
      uint64_t v15 = (const char *)(*(uint64_t (**)(void))(*(void *)*v11 + 16))();
      size_t v16 = strlen(v15);
      if (v16 >= 0x7FFFFFFFFFFFFFF8) {
        std::string::__throw_length_error[abi:ne180100]();
      }
      std::string::size_type v17 = v16;
      if (v16 >= 0x17) {
        break;
      }
      *((unsigned char *)&__dst.__r_.__value_.__s + 23) = v16;
      p_dst = &__dst;
      if (v16) {
        goto LABEL_21;
      }
LABEL_22:
      p_dst->__r_.__value_.__s.__data_[v17] = 0;
      std::string __p = __dst;
      memset(&__dst, 0, sizeof(__dst));
      *(_OWORD *)std::string buf = 0u;
      long long v56 = 0u;
      long long v57 = 0u;
      ctu::TrackedGroup::fork((NSObject **)object, (uint64_t)v10, (uint64_t)&__p, (uint64_t)buf);
      ctu::os::signpost_interval::~signpost_interval((ctu::os::signpost_interval *)buf);
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      {
        operator delete(__p.__r_.__value_.__l.__data_);
        uint64_t v21 = *v11;
        uint64_t v22 = *(NSObject **)object;
        dispatch_group_t group = *(dispatch_group_t *)object;
        if (*(void *)object)
        {
LABEL_26:
          dispatch_retain(v22);
          if (group) {
            dispatch_group_enter(group);
          }
        }
      }
      else
      {
        uint64_t v21 = *v11;
        uint64_t v22 = *(NSObject **)object;
        dispatch_group_t group = *(dispatch_group_t *)object;
        if (*(void *)object) {
          goto LABEL_26;
        }
      }
      (*(void (**)(uint64_t, dispatch_group_t *))(*(void *)v21 + 56))(v21, &group);
      if (group)
      {
        dispatch_group_leave(group);
        if (group) {
          dispatch_release(group);
        }
      }
      if (v22)
      {
        dispatch_group_leave(v22);
        dispatch_release(v22);
      }
      v11 += 2;
      if (v11 == v12) {
        goto LABEL_33;
      }
    }
    uint64_t v19 = (v16 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v16 | 7) != 0x17) {
      uint64_t v19 = v16 | 7;
    }
    uint64_t v20 = v19 + 1;
    p_dst = (std::string *)operator new(v19 + 1);
    __dst.__r_.__value_.__l.__size_ = v17;
    __dst.__r_.__value_.__r.__words[2] = v20 | 0x8000000000000000;
    __dst.__r_.__value_.__r.__words[0] = (std::string::size_type)p_dst;
LABEL_21:
    memmove(p_dst, v15, v17);
    goto LABEL_22;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)std::string buf = 0;
    _os_log_debug_impl(&dword_1C59C6000, v5, OS_LOG_TYPE_DEBUG, "#D Server is down; ignoring wake request", buf, 2u);
  }
LABEL_62:
  uint64_t v40 = v2[1];
  if (v40)
  {
    dispatch_group_leave(v40);
    uint64_t v41 = v2[1];
    if (v41) {
      dispatch_release(v41);
    }
  }
  operator delete(v2);
  unint64_t v42 = (std::__shared_weak_count *)v1[2];
  if (v42 && !atomic_fetch_add(&v42->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v42->__on_zero_shared)(v42);
    std::__shared_weak_count::__release_weak(v42);
  }
  operator delete(v1);
}

void sub_1C5BBA56C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, std::__shared_weak_count *a9, atomic_ullong *a10, void *a11, void *a12, uint64_t a13, uint64_t a14, dispatch_group_t group, uint64_t a16, uint64_t a17, uint64_t a18, void *a19, uint64_t a20,int a21,__int16 a22,char a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,void **__p,uint64_t a31)
{
  if (!atomic_fetch_add(&v31->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v31->__on_zero_shared)(v31);
    std::__shared_weak_count::__release_weak(v31);
  }
  if (__p)
  {
    long long v34 = v32;
    int8x8_t v35 = __p;
    if (v32 != __p)
    {
      do
      {
        if (*((char *)v34 - 1) < 0) {
          operator delete(*(v34 - 3));
        }
        v34 -= 3;
      }
      while (v34 != __p);
      int8x8_t v35 = __p;
    }
    operator delete(v35);
  }
  if (!atomic_fetch_add(a10, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))a9->__on_zero_shared)(a9);
    std::__shared_weak_count::__release_weak(a9);
  }
  uint64_t v36 = a11[1];
  if (v36)
  {
    dispatch_group_leave(v36);
    long long v37 = a11[1];
    if (v37) {
      dispatch_release(v37);
    }
  }
  operator delete(a11);
  long long v38 = (std::__shared_weak_count *)a12[2];
  if (v38)
  {
    if (!atomic_fetch_add(&v38->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v38->__on_zero_shared)(v38);
      std::__shared_weak_count::__release_weak(v38);
    }
  }
  operator delete(a12);
  _Unwind_Resume(a1);
}

void dispatch::async<void ctu::SharedSynchronizable<ServiceManager>::execute_wrapped<ServiceManager::initializeGlobalServices(void)::$_0>(ServiceManager::initializeGlobalServices(void)::$_0 &&)::{lambda(void)#1}>(dispatch_queue_s *,std::unique_ptr<ServiceManager::initializeGlobalServices(void)::$_0,dispatch_queue_s *::default_delete<ServiceManager::initializeGlobalServices(void)::$_0>>)::{lambda(void *)#1}::__invoke(void **a1)
{
  uint64_t v79 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void **)*a1;
  uint64_t v61 = (void *)**a1;
  uint64_t v3 = v61[5];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = (uint64_t)(v61[16] - v61[15]) >> 4;
    *(_DWORD *)std::string buf = 134217984;
    *(void *)&buf[4] = v4;
    _os_log_impl(&dword_1C59C6000, v3, OS_LOG_TYPE_DEFAULT, "#I Initializing %zd global services", buf, 0xCu);
  }
  uint64_t v5 = dispatch_group_create();
  uint64_t v58 = v2;
  long long v59 = a1;
  uint64_t v6 = operator new(0x38uLL);
  uint64_t v7 = v6;
  v6[1] = 0;
  long long v57 = v6 + 1;
  v6[2] = 0;
  *uint64_t v6 = &unk_1F2112740;
  v6[3] = v5;
  int v8 = (NSObject **)(v6 + 3);
  uint64_t v60 = (std::__shared_weak_count *)v6;
  if (!v5)
  {
    v6[4] = 0;
    v6[5] = 0;
    v6[6] = 0;
    uint64_t v9 = (uint64_t *)v61[15];
    std::string::size_type v10 = (uint64_t *)v61[16];
    if (v9 == v10) {
      goto LABEL_30;
    }
    while (1)
    {
LABEL_9:
      long long v11 = v61[5];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v12 = (*(uint64_t (**)(void))(*(void *)*v9 + 16))();
        *(_DWORD *)std::string buf = 136315138;
        *(void *)&buf[4] = v12;
        _os_log_impl(&dword_1C59C6000, v11, OS_LOG_TYPE_DEFAULT, "#I Initializing '%s'", buf, 0xCu);
      }
      object.__r_.__value_.__r.__words[0] = 0xAAAAAAAAAAAAAAAALL;
      uint64_t v13 = (const char *)(*(uint64_t (**)(void))(*(void *)*v9 + 16))();
      size_t v14 = strlen(v13);
      if (v14 > 0x7FFFFFFFFFFFFFF7) {
        std::string::__throw_length_error[abi:ne180100]();
      }
      size_t v15 = v14;
      if (v14 >= 0x17) {
        break;
      }
      HIBYTE(v65) = v14;
      p_dst = &__dst;
      if (v14) {
        goto LABEL_18;
      }
LABEL_19:
      *((unsigned char *)p_dst + v15) = 0;
      *(_OWORD *)std::string __p = __dst;
      uint64_t v67 = (void *)v65;
      long long __dst = 0uLL;
      unint64_t v65 = 0;
      *(_OWORD *)std::string buf = 0u;
      long long v71 = 0u;
      long long v72 = 0u;
      ctu::TrackedGroup::fork((NSObject **)&object, (uint64_t)v8, (uint64_t)__p, (uint64_t)buf);
      ctu::os::signpost_interval::~signpost_interval((ctu::os::signpost_interval *)buf);
      if (SHIBYTE(v67) < 0)
      {
        operator delete(__p[0]);
        uint64_t v19 = *v9;
        uint64_t v20 = object.__r_.__value_.__r.__words[0];
        dispatch_group_t group = (dispatch_group_t)object.__r_.__value_.__r.__words[0];
        if (object.__r_.__value_.__r.__words[0])
        {
LABEL_23:
          dispatch_retain(v20);
          if (group) {
            dispatch_group_enter(group);
          }
        }
      }
      else
      {
        uint64_t v19 = *v9;
        uint64_t v20 = object.__r_.__value_.__r.__words[0];
        dispatch_group_t group = (dispatch_group_t)object.__r_.__value_.__r.__words[0];
        if (object.__r_.__value_.__r.__words[0]) {
          goto LABEL_23;
        }
      }
      (*(void (**)(uint64_t, dispatch_group_t *))(*(void *)v19 + 32))(v19, &group);
      if (group)
      {
        dispatch_group_leave(group);
        if (group) {
          dispatch_release(group);
        }
      }
      if (v20)
      {
        dispatch_group_leave(v20);
        dispatch_release(v20);
      }
      v9 += 2;
      if (v9 == v10) {
        goto LABEL_30;
      }
    }
    uint64_t v17 = (v14 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v14 | 7) != 0x17) {
      uint64_t v17 = v14 | 7;
    }
    uint64_t v18 = v17 + 1;
    p_dst = (long long *)operator new(v17 + 1);
    *((void *)&__dst + 1) = v15;
    unint64_t v65 = v18 | 0x8000000000000000;
    *(void *)&long long __dst = p_dst;
LABEL_18:
    memmove(p_dst, v13, v15);
    goto LABEL_19;
  }
  dispatch_retain(v5);
  v7[4] = 0;
  void v7[5] = 0;
  v7[6] = 0;
  dispatch_release(v5);
  uint64_t v9 = (uint64_t *)v61[15];
  std::string::size_type v10 = (uint64_t *)v61[16];
  if (v9 != v10) {
    goto LABEL_9;
  }
LABEL_30:
  uint64_t v21 = *v8;
  uint64_t v22 = (*(uint64_t (**)(void *))(*v61 + 88))(v61);
  dispatch_time_t v23 = dispatch_time(0, 1000000000 * v22);
  uint64_t v24 = v59;
  dispatch_time_t v25 = v60;
  if (!dispatch_group_wait(v21, v23)) {
    goto LABEL_61;
  }
  __p[0] = 0;
  __p[1] = 0;
  uint64_t v67 = 0;
  shared_owners = (uint64_t *)v60[1].__shared_owners_;
  for (uint64_t i = (uint64_t *)v60[1].__shared_weak_owners_; shared_owners != i; shared_owners += 2)
  {
    unint64_t v28 = (std::__shared_weak_count *)shared_owners[1];
    if (v28)
    {
      uint64_t v29 = std::__shared_weak_count::lock(v28);
      if (v29)
      {
        unint64_t v30 = v29;
        uint64_t v31 = *shared_owners;
        if (*shared_owners)
        {
          uint64_t v32 = __p[1];
          if (__p[1] >= v67)
          {
            long long v34 = std::vector<std::string>::__emplace_back_slow_path<std::string const&>((char **)__p, v31);
          }
          else
          {
            if (*(char *)(v31 + 23) < 0)
            {
              std::string::__init_copy_ctor_external((std::string *)__p[1], *(const std::string::value_type **)v31, *(void *)(v31 + 8));
            }
            else
            {
              long long v33 = *(_OWORD *)v31;
              *((void *)__p[1] + 2) = *(void *)(v31 + 16);
              *uint64_t v32 = v33;
            }
            long long v34 = (std::string *)((char *)v32 + 24);
          }
          __p[1] = v34;
        }
        if (!atomic_fetch_add(&v30->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
        {
          ((void (*)(std::__shared_weak_count *))v30->__on_zero_shared)(v30);
          std::__shared_weak_count::__release_weak(v30);
        }
      }
    }
  }
  unint64_t v78 = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&long long v35 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v35 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v77[7] = v35;
  v77[8] = v35;
  v77[5] = v35;
  v77[6] = v35;
  v77[3] = v35;
  v77[4] = v35;
  v77[1] = v35;
  v77[2] = v35;
  long long v76 = v35;
  v77[0] = v35;
  long long v74 = v35;
  long long v75 = v35;
  long long v72 = v35;
  long long v73 = v35;
  *(_OWORD *)std::string buf = v35;
  long long v71 = v35;
  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)buf);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(buf, (uint64_t)"Initialization TIMEOUT: ", 24);
  uint64_t v36 = (void *)std::ostream::operator<<();
  long long v37 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v36, (uint64_t)" clients failed to complete init stage: ", 40);
  p_std::string object = &object;
  ctu::join<std::__wrap_iter<std::string *>>(&object, (std::string *)__p[0], (long long *)__p[1]);
  if ((object.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
    p_std::string object = (std::string *)object.__r_.__value_.__r.__words[0];
  }
  size_t v39 = strlen((const char *)p_object);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v37, (uint64_t)p_object, v39);
  if (SHIBYTE(object.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(object.__r_.__value_.__l.__data_);
  }
  uint64_t v40 = v61[5];
  if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
  {
    if ((BYTE8(v76) & 0x10) != 0)
    {
      uint64_t v51 = v76;
      if ((unint64_t)v76 < *((void *)&v73 + 1))
      {
        *(void *)&long long v76 = *((void *)&v73 + 1);
        uint64_t v51 = *((void *)&v73 + 1);
      }
      xpc_object_t v52 = (const void **)&v73;
    }
    else
    {
      if ((BYTE8(v76) & 8) == 0)
      {
        std::string::size_type v49 = 0;
        *((unsigned char *)&object.__r_.__value_.__s + 23) = 0;
        char v50 = &object;
LABEL_89:
        v50->__r_.__value_.__s.__data_[v49] = 0;
        long long v56 = &object;
        if ((object.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
          long long v56 = (std::string *)object.__r_.__value_.__r.__words[0];
        }
        *(_DWORD *)uint64_t v68 = 136315138;
        v69 = v56;
        _os_log_error_impl(&dword_1C59C6000, v40, OS_LOG_TYPE_ERROR, "%s", v68, 0xCu);
        if (SHIBYTE(object.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(object.__r_.__value_.__l.__data_);
        }
        dispatch_time_t v25 = v60;
        goto LABEL_51;
      }
      xpc_object_t v52 = (const void **)&v71 + 1;
      uint64_t v51 = *((void *)&v72 + 1);
    }
    __int16 v53 = *v52;
    std::string::size_type v49 = v51 - (void)*v52;
    if (v49 > 0x7FFFFFFFFFFFFFF7) {
      std::string::__throw_length_error[abi:ne180100]();
    }
    if (v49 >= 0x17)
    {
      uint64_t v54 = (v49 & 0xFFFFFFFFFFFFFFF8) + 8;
      if ((v49 | 7) != 0x17) {
        uint64_t v54 = v49 | 7;
      }
      uint64_t v55 = v54 + 1;
      char v50 = (std::string *)operator new(v54 + 1);
      object.__r_.__value_.__l.__size_ = v49;
      object.__r_.__value_.__r.__words[2] = v55 | 0x8000000000000000;
      object.__r_.__value_.__r.__words[0] = (std::string::size_type)v50;
    }
    else
    {
      *((unsigned char *)&object.__r_.__value_.__s + 23) = v51 - *(unsigned char *)v52;
      char v50 = &object;
      if (!v49) {
        goto LABEL_88;
      }
    }
    memmove(v50, v53, v49);
LABEL_88:
    uint64_t v24 = v59;
    goto LABEL_89;
  }
LABEL_51:
  *(void *)std::string buf = *MEMORY[0x1E4FBA418];
  *(void *)&buf[*(void *)(*(void *)buf - 24)] = *(void *)(MEMORY[0x1E4FBA418] + 24);
  *(void *)&uint8_t buf[8] = MEMORY[0x1E4FBA470] + 16;
  if (SHIBYTE(v75) < 0) {
    operator delete(*((void **)&v74 + 1));
  }
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  MEMORY[0x1C8795140](v77);
  uint64_t v41 = (void **)__p[0];
  if (__p[0])
  {
    unint64_t v42 = (void **)__p[1];
    uint64_t v43 = __p[0];
    if (__p[1] != __p[0])
    {
      do
      {
        if (*((char *)v42 - 1) < 0) {
          operator delete(*(v42 - 3));
        }
        v42 -= 3;
      }
      while (v42 != v41);
      uint64_t v43 = __p[0];
    }
    __p[1] = v41;
    operator delete(v43);
  }
LABEL_61:
  dispatch_object_t v44 = v61[5];
  if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)std::string buf = 0;
    _os_log_impl(&dword_1C59C6000, v44, OS_LOG_TYPE_DEFAULT, "#I All global services initialized", buf, 2u);
    dispatch_object_t v45 = v58;
    if (!atomic_fetch_add(v57, 0xFFFFFFFFFFFFFFFFLL)) {
      goto LABEL_63;
    }
LABEL_66:
    long long v46 = v45[1];
    if (!v46) {
      goto LABEL_69;
    }
    goto LABEL_67;
  }
  dispatch_object_t v45 = v58;
  if (atomic_fetch_add(v57, 0xFFFFFFFFFFFFFFFFLL)) {
    goto LABEL_66;
  }
LABEL_63:
  ((void (*)(std::__shared_weak_count *))v25->__on_zero_shared)(v25);
  std::__shared_weak_count::__release_weak(v25);
  long long v46 = v45[1];
  if (!v46) {
    goto LABEL_69;
  }
LABEL_67:
  dispatch_group_leave(v46);
  dispatch_object_t v47 = v45[1];
  if (v47) {
    dispatch_release(v47);
  }
LABEL_69:
  operator delete(v45);
  unint64_t v48 = (std::__shared_weak_count *)v24[2];
  if (v48 && !atomic_fetch_add(&v48->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v48->__on_zero_shared)(v48);
    std::__shared_weak_count::__release_weak(v48);
  }
  operator delete(v24);
}

void sub_1C5BBB044(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, atomic_ullong *a9, void *a10, void *a11, std::__shared_weak_count *a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,dispatch_group_t group,uint64_t a23,uint64_t a24,uint64_t a25,void **__p,uint64_t a27,int a28,__int16 a29,char a30,char a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,void *a44,uint64_t a45,int a46,__int16 a47,char a48,char a49)
{
  if (!atomic_fetch_add(&v49->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v49->__on_zero_shared)(v49);
    std::__shared_weak_count::__release_weak(v49);
  }
  if (__p)
  {
    xpc_object_t v52 = v50;
    __int16 v53 = __p;
    if (v50 != __p)
    {
      do
      {
        if (*((char *)v52 - 1) < 0) {
          operator delete(*(v52 - 3));
        }
        v52 -= 3;
      }
      while (v52 != __p);
      __int16 v53 = __p;
    }
    operator delete(v53);
  }
  if (!atomic_fetch_add(a9, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))a12->__on_zero_shared)(a12);
    std::__shared_weak_count::__release_weak(a12);
  }
  uint64_t v54 = a10[1];
  if (v54)
  {
    dispatch_group_leave(v54);
    uint64_t v55 = a10[1];
    if (v55) {
      dispatch_release(v55);
    }
  }
  operator delete(a10);
  long long v56 = (std::__shared_weak_count *)a11[2];
  if (v56)
  {
    if (!atomic_fetch_add(&v56->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v56->__on_zero_shared)(v56);
      std::__shared_weak_count::__release_weak(v56);
    }
  }
  operator delete(a11);
  _Unwind_Resume(a1);
}

void dispatch::async<void ctu::SharedSynchronizable<ServiceManager>::execute_wrapped<ServiceManager::shutdownGlobalServices(void)::$_0>(ServiceManager::shutdownGlobalServices(void)::$_0 &&)::{lambda(void)#1}>(dispatch_queue_s *,std::unique_ptr<ServiceManager::shutdownGlobalServices(void)::$_0,dispatch_queue_s *::default_delete<ServiceManager::shutdownGlobalServices(void)::$_0>>)::{lambda(void *)#1}::__invoke(void **a1)
{
  uint64_t v90 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = (void **)*a1;
  uint64_t v2 = (void *)**a1;
  uint64_t v3 = v2[5];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = (uint64_t)(v2[16] - v2[15]) >> 4;
    *(_DWORD *)std::string buf = 134217984;
    *(void *)&buf[4] = v4;
    _os_log_impl(&dword_1C59C6000, v3, OS_LOG_TYPE_DEFAULT, "#I Shutdown %zd global services", buf, 0xCu);
  }
  uint64_t v5 = dispatch_group_create();
  uint64_t v6 = operator new(0x38uLL);
  uint64_t v7 = v6;
  v6[1] = 0;
  v69 = v6 + 1;
  v70 = v1;
  v6[2] = 0;
  *uint64_t v6 = &unk_1F2112740;
  v6[3] = v5;
  int v8 = (NSObject **)(v6 + 3);
  long long v72 = (std::__shared_weak_count *)v6;
  if (!v5)
  {
    v6[4] = 0;
    v6[5] = 0;
    v6[6] = 0;
    uint64_t v9 = (uint64_t *)v2[15];
    std::string::size_type v10 = (uint64_t *)v2[16];
    if (v9 == v10) {
      goto LABEL_30;
    }
    while (1)
    {
LABEL_9:
      long long v11 = v2[5];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v12 = (*(uint64_t (**)(void))(*(void *)*v9 + 16))();
        *(_DWORD *)std::string buf = 136315138;
        *(void *)&buf[4] = v12;
        _os_log_impl(&dword_1C59C6000, v11, OS_LOG_TYPE_DEFAULT, "#I Shutdown global service '%s'", buf, 0xCu);
      }
      object.__r_.__value_.__r.__words[0] = 0xAAAAAAAAAAAAAAAALL;
      uint64_t v13 = (const char *)(*(uint64_t (**)(void))(*(void *)*v9 + 16))();
      size_t v14 = strlen(v13);
      if (v14 > 0x7FFFFFFFFFFFFFF7) {
        std::string::__throw_length_error[abi:ne180100]();
      }
      size_t v15 = v14;
      if (v14 >= 0x17) {
        break;
      }
      HIBYTE(v76) = v14;
      p_dst = &__dst;
      if (v14) {
        goto LABEL_18;
      }
LABEL_19:
      *((unsigned char *)p_dst + v15) = 0;
      *(_OWORD *)std::string __p = __dst;
      unint64_t v78 = (void *)v76;
      long long __dst = 0uLL;
      unint64_t v76 = 0;
      *(_OWORD *)std::string buf = 0u;
      long long v82 = 0u;
      long long v83 = 0u;
      ctu::TrackedGroup::fork((NSObject **)&object, (uint64_t)v8, (uint64_t)__p, (uint64_t)buf);
      ctu::os::signpost_interval::~signpost_interval((ctu::os::signpost_interval *)buf);
      if (SHIBYTE(v78) < 0)
      {
        operator delete(__p[0]);
        uint64_t v19 = *v9;
        uint64_t v20 = object.__r_.__value_.__r.__words[0];
        dispatch_group_t group = (dispatch_group_t)object.__r_.__value_.__r.__words[0];
        if (object.__r_.__value_.__r.__words[0])
        {
LABEL_23:
          dispatch_retain(v20);
          if (group) {
            dispatch_group_enter(group);
          }
        }
      }
      else
      {
        uint64_t v19 = *v9;
        uint64_t v20 = object.__r_.__value_.__r.__words[0];
        dispatch_group_t group = (dispatch_group_t)object.__r_.__value_.__r.__words[0];
        if (object.__r_.__value_.__r.__words[0]) {
          goto LABEL_23;
        }
      }
      (*(void (**)(uint64_t, dispatch_group_t *))(*(void *)v19 + 64))(v19, &group);
      if (group)
      {
        dispatch_group_leave(group);
        if (group) {
          dispatch_release(group);
        }
      }
      if (v20)
      {
        dispatch_group_leave(v20);
        dispatch_release(v20);
      }
      v9 += 2;
      if (v9 == v10) {
        goto LABEL_30;
      }
    }
    uint64_t v17 = (v14 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v14 | 7) != 0x17) {
      uint64_t v17 = v14 | 7;
    }
    uint64_t v18 = v17 + 1;
    p_dst = (long long *)operator new(v17 + 1);
    *((void *)&__dst + 1) = v15;
    unint64_t v76 = v18 | 0x8000000000000000;
    *(void *)&long long __dst = p_dst;
LABEL_18:
    memmove(p_dst, v13, v15);
    goto LABEL_19;
  }
  dispatch_retain(v5);
  v7[4] = 0;
  void v7[5] = 0;
  v7[6] = 0;
  dispatch_release(v5);
  uint64_t v9 = (uint64_t *)v2[15];
  std::string::size_type v10 = (uint64_t *)v2[16];
  if (v9 != v10) {
    goto LABEL_9;
  }
LABEL_30:
  uint64_t v21 = *v8;
  uint64_t v22 = (*(uint64_t (**)(void *))(*v2 + 112))(v2);
  dispatch_time_t v23 = dispatch_time(0, 1000000000 * v22);
  uint64_t v24 = v72;
  if (!dispatch_group_wait(v21, v23)) {
    goto LABEL_61;
  }
  __p[0] = 0;
  __p[1] = 0;
  unint64_t v78 = 0;
  shared_owners = (uint64_t *)v72[1].__shared_owners_;
  for (uint64_t i = (uint64_t *)v72[1].__shared_weak_owners_; shared_owners != i; shared_owners += 2)
  {
    uint64_t v27 = (std::__shared_weak_count *)shared_owners[1];
    if (v27)
    {
      unint64_t v28 = std::__shared_weak_count::lock(v27);
      if (v28)
      {
        uint64_t v29 = v28;
        uint64_t v30 = *shared_owners;
        if (*shared_owners)
        {
          uint64_t v31 = __p[1];
          if (__p[1] >= v78)
          {
            long long v33 = std::vector<std::string>::__emplace_back_slow_path<std::string const&>((char **)__p, v30);
          }
          else
          {
            if (*(char *)(v30 + 23) < 0)
            {
              std::string::__init_copy_ctor_external((std::string *)__p[1], *(const std::string::value_type **)v30, *(void *)(v30 + 8));
            }
            else
            {
              long long v32 = *(_OWORD *)v30;
              *((void *)__p[1] + 2) = *(void *)(v30 + 16);
              *uint64_t v31 = v32;
            }
            long long v33 = (std::string *)((char *)v31 + 24);
          }
          __p[1] = v33;
        }
        if (!atomic_fetch_add(&v29->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
        {
          ((void (*)(std::__shared_weak_count *))v29->__on_zero_shared)(v29);
          std::__shared_weak_count::__release_weak(v29);
        }
      }
    }
  }
  unint64_t v89 = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&long long v34 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v34 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v88[7] = v34;
  v88[8] = v34;
  v88[5] = v34;
  v88[6] = v34;
  v88[3] = v34;
  v88[4] = v34;
  v88[1] = v34;
  v88[2] = v34;
  long long v87 = v34;
  v88[0] = v34;
  long long v85 = v34;
  long long v86 = v34;
  long long v83 = v34;
  long long v84 = v34;
  *(_OWORD *)std::string buf = v34;
  long long v82 = v34;
  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)buf);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(buf, (uint64_t)"Shutdown global service: TIMEOUT: ", 34);
  long long v35 = (void *)std::ostream::operator<<();
  uint64_t v36 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v35, (uint64_t)" clients failed to complete shutdown: ", 38);
  p_std::string object = &object;
  ctu::join<std::__wrap_iter<std::string *>>(&object, (std::string *)__p[0], (long long *)__p[1]);
  if ((object.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
    p_std::string object = (std::string *)object.__r_.__value_.__r.__words[0];
  }
  size_t v38 = strlen((const char *)p_object);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v36, (uint64_t)p_object, v38);
  if (SHIBYTE(object.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(object.__r_.__value_.__l.__data_);
  }
  size_t v39 = v2[5];
  if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
  {
    if ((BYTE8(v87) & 0x10) != 0)
    {
      uint64_t v63 = v87;
      if ((unint64_t)v87 < *((void *)&v84 + 1))
      {
        *(void *)&long long v87 = *((void *)&v84 + 1);
        uint64_t v63 = *((void *)&v84 + 1);
      }
      size_t v64 = (const void **)&v84;
    }
    else
    {
      if ((BYTE8(v87) & 8) == 0)
      {
        std::string::size_type v61 = 0;
        *((unsigned char *)&object.__r_.__value_.__s + 23) = 0;
        uint64_t v62 = &object;
LABEL_114:
        v62->__r_.__value_.__s.__data_[v61] = 0;
        uint64_t v68 = &object;
        if ((object.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
          uint64_t v68 = (std::string *)object.__r_.__value_.__r.__words[0];
        }
        *(_DWORD *)uint64_t v79 = 136315138;
        int v80 = v68;
        _os_log_error_impl(&dword_1C59C6000, v39, OS_LOG_TYPE_ERROR, "%s", v79, 0xCu);
        if (SHIBYTE(object.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(object.__r_.__value_.__l.__data_);
        }
        goto LABEL_51;
      }
      size_t v64 = (const void **)&v82 + 1;
      uint64_t v63 = *((void *)&v83 + 1);
    }
    unint64_t v65 = *v64;
    std::string::size_type v61 = v63 - (void)*v64;
    if (v61 > 0x7FFFFFFFFFFFFFF7) {
      std::string::__throw_length_error[abi:ne180100]();
    }
    if (v61 >= 0x17)
    {
      uint64_t v66 = (v61 & 0xFFFFFFFFFFFFFFF8) + 8;
      if ((v61 | 7) != 0x17) {
        uint64_t v66 = v61 | 7;
      }
      uint64_t v67 = v66 + 1;
      uint64_t v62 = (std::string *)operator new(v66 + 1);
      object.__r_.__value_.__l.__size_ = v61;
      object.__r_.__value_.__r.__words[2] = v67 | 0x8000000000000000;
      object.__r_.__value_.__r.__words[0] = (std::string::size_type)v62;
    }
    else
    {
      *((unsigned char *)&object.__r_.__value_.__s + 23) = v63 - *(unsigned char *)v64;
      uint64_t v62 = &object;
      if (!v61) {
        goto LABEL_113;
      }
    }
    memmove(v62, v65, v61);
LABEL_113:
    uint64_t v24 = v72;
    goto LABEL_114;
  }
LABEL_51:
  *(void *)std::string buf = *MEMORY[0x1E4FBA418];
  *(void *)&buf[*(void *)(*(void *)buf - 24)] = *(void *)(MEMORY[0x1E4FBA418] + 24);
  *(void *)&uint8_t buf[8] = MEMORY[0x1E4FBA470] + 16;
  if (SHIBYTE(v86) < 0) {
    operator delete(*((void **)&v85 + 1));
  }
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  MEMORY[0x1C8795140](v88);
  uint64_t v40 = (void **)__p[0];
  if (__p[0])
  {
    uint64_t v41 = (void **)__p[1];
    unint64_t v42 = __p[0];
    if (__p[1] != __p[0])
    {
      do
      {
        if (*((char *)v41 - 1) < 0) {
          operator delete(*(v41 - 3));
        }
        v41 -= 3;
      }
      while (v41 != v40);
      unint64_t v42 = __p[0];
    }
    __p[1] = v40;
    operator delete(v42);
  }
LABEL_61:
  uint64_t v43 = v2[16];
  if (v43 != v2[15])
  {
    do
    {
      uint64_t v45 = v43;
      uint64_t v46 = *(void *)(v43 - 16);
      v43 -= 16;
      memset(buf, 0, sizeof(buf));
      *(void *)&long long v82 = 0;
      std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>(buf, *(void *)(v46 + 24), *(void *)(v46 + 32), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)(v46 + 32) - *(void *)(v46 + 24)) >> 3));
      uint64_t v47 = v2[21];
      __p[1] = 0;
      unint64_t v78 = 0;
      __p[0] = 0;
      std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>(__p, *(uint64_t *)buf, *(uint64_t *)&buf[8], 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)&buf[8] - *(void *)buf) >> 3));
      ServiceCtrl::clearCommandHandlers(v47, (uint64_t)__p[0], (uint64_t)__p[1]);
      unint64_t v48 = (void **)__p[0];
      if (__p[0])
      {
        std::string::size_type v49 = (void **)__p[1];
        char v50 = __p[0];
        if (__p[1] != __p[0])
        {
          do
          {
            if (*((char *)v49 - 1) < 0) {
              operator delete(*(v49 - 3));
            }
            v49 -= 3;
          }
          while (v49 != v48);
          char v50 = __p[0];
        }
        __p[1] = v48;
        operator delete(v50);
      }
      uint64_t v51 = *(void *)buf;
      if (*(void *)buf)
      {
        uint64_t v52 = *(void *)&buf[8];
        dispatch_object_t v44 = *(void **)buf;
        if (*(void *)&buf[8] != *(void *)buf)
        {
          do
          {
            if (*(char *)(v52 - 1) < 0) {
              operator delete(*(void **)(v52 - 24));
            }
            v52 -= 24;
          }
          while (v52 != v51);
          dispatch_object_t v44 = *(void **)buf;
        }
        *(void *)&uint8_t buf[8] = v51;
        operator delete(v44);
      }
    }
    while (v43 != v2[15]);
    uint64_t v53 = v2[16];
    if (v53 != v43)
    {
      uint64_t v54 = v53 + 16;
      do
      {
        uint64_t v55 = *(std::__shared_weak_count **)(v54 - 24);
        if (v55 && !atomic_fetch_add(&v55->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
        {
          ((void (*)(std::__shared_weak_count *))v55->__on_zero_shared)(v55);
          std::__shared_weak_count::__release_weak(v55);
        }
        v54 -= 16;
      }
      while (v54 != v45);
    }
  }
  uint8_t v2[16] = v43;
  long long v56 = v2[5];
  if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)std::string buf = 0;
    _os_log_impl(&dword_1C59C6000, v56, OS_LOG_TYPE_DEFAULT, "#I All global services have shutdown", buf, 2u);
    if (!atomic_fetch_add(v69, 0xFFFFFFFFFFFFFFFFLL)) {
      goto LABEL_88;
    }
LABEL_91:
    long long v57 = v70[1];
    uint64_t v58 = a1;
    if (!v57) {
      goto LABEL_94;
    }
    goto LABEL_92;
  }
  if (atomic_fetch_add(v69, 0xFFFFFFFFFFFFFFFFLL)) {
    goto LABEL_91;
  }
LABEL_88:
  ((void (*)(std::__shared_weak_count *))v24->__on_zero_shared)(v24);
  std::__shared_weak_count::__release_weak(v24);
  long long v57 = v70[1];
  uint64_t v58 = a1;
  if (!v57) {
    goto LABEL_94;
  }
LABEL_92:
  dispatch_group_leave(v57);
  long long v59 = v70[1];
  if (v59) {
    dispatch_release(v59);
  }
LABEL_94:
  operator delete(v70);
  uint64_t v60 = (std::__shared_weak_count *)v58[2];
  if (v60 && !atomic_fetch_add(&v60->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v60->__on_zero_shared)(v60);
    std::__shared_weak_count::__release_weak(v60);
  }
  operator delete(v58);
}

void sub_1C5BBBD84(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, atomic_ullong *a9, void *a10, void *a11, std::__shared_weak_count *a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,dispatch_group_t group,uint64_t a23,uint64_t a24,uint64_t a25,void **__p,uint64_t a27,int a28,__int16 a29,char a30,char a31,uint64_t a32,uint64_t a33,uint64_t a34,void *a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,void *a44,uint64_t a45,int a46,__int16 a47,char a48,char a49)
{
  if (!atomic_fetch_add(&v49->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v49->__on_zero_shared)(v49);
    std::__shared_weak_count::__release_weak(v49);
  }
  if (__p)
  {
    uint64_t v52 = v50;
    uint64_t v53 = __p;
    if (v50 != __p)
    {
      do
      {
        if (*((char *)v52 - 1) < 0) {
          operator delete(*(v52 - 3));
        }
        v52 -= 3;
      }
      while (v52 != __p);
      uint64_t v53 = __p;
    }
    operator delete(v53);
  }
  if (!atomic_fetch_add(a9, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))a12->__on_zero_shared)(a12);
    std::__shared_weak_count::__release_weak(a12);
  }
  uint64_t v54 = a10[1];
  if (v54)
  {
    dispatch_group_leave(v54);
    uint64_t v55 = a10[1];
    if (v55) {
      dispatch_release(v55);
    }
  }
  operator delete(a10);
  long long v56 = (std::__shared_weak_count *)a11[2];
  if (v56)
  {
    if (!atomic_fetch_add(&v56->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v56->__on_zero_shared)(v56);
      std::__shared_weak_count::__release_weak(v56);
    }
  }
  operator delete(a11);
  _Unwind_Resume(a1);
}

void ServiceCtrl::clearCommandHandlers(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = a1 + 72;
  uint64_t v9 = a1;
  std::string __p = 0;
  long long v11 = 0;
  uint64_t v12 = 0;
  std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>(&__p, a2, a3, 0xAAAAAAAAAAAAAAABLL * ((a3 - a2) >> 3));
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 0x40000000;
  block[2] = ___ZNK3ctu20SharedSynchronizableI11ServiceCtrlE20execute_wrapped_syncIZNS1_20clearCommandHandlersENSt3__16vectorINS4_12basic_stringIcNS4_11char_traitsIcEENS4_9allocatorIcEEEENS9_ISB_EEEEEUlvE_EEDTclsr8dispatchE4syncLDnEclsr3stdE7forwardIT_Efp_EEEOSF__block_invoke;
  block[3] = &__block_descriptor_tmp_59_1;
  void block[4] = v4;
  block[5] = &v9;
  uint64_t v5 = *(NSObject **)(a1 + 88);
  if (*(void *)(a1 + 96))
  {
    dispatch_async_and_wait(v5, block);
    uint64_t v6 = (void **)__p;
    if (!__p) {
      return;
    }
  }
  else
  {
    dispatch_sync(v5, block);
    uint64_t v6 = (void **)__p;
    if (!__p) {
      return;
    }
  }
  uint64_t v7 = v11;
  int v8 = v6;
  if (v11 != v6)
  {
    do
    {
      if (*((char *)v7 - 1) < 0) {
        operator delete(*(v7 - 3));
      }
      v7 -= 3;
    }
    while (v7 != v6);
    int v8 = __p;
  }
  long long v11 = v6;
  operator delete(v8);
}

void ___ZNK3ctu20SharedSynchronizableI11ServiceCtrlE20execute_wrapped_syncIZNS1_20clearCommandHandlersENSt3__16vectorINS4_12basic_stringIcNS4_11char_traitsIcEENS4_9allocatorIcEEEENS9_ISB_EEEEEUlvE_EEDTclsr8dispatchE4syncLDnEclsr3stdE7forwardIT_Efp_EEEOSF__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 40);
  uint64_t v2 = (const void **)v1[1];
  uint64_t v3 = (const void **)v1[2];
  if (v2 != v3)
  {
    uint64_t v4 = *v1;
    uint64_t v5 = (uint64_t **)(*v1 + 120);
    uint64_t v6 = *v1 + 128;
    do
    {
      uint64_t v7 = std::__tree<std::__value_type<std::string,std::map<std::string,xpc::dict>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::map<std::string,xpc::dict>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::map<std::string,xpc::dict>>>>::find<std::string>((uint64_t)v5, v2);
      if ((uint64_t *)v6 != v7)
      {
        int v8 = v7;
        uint64_t v9 = (uint64_t *)v7[1];
        if (v9)
        {
          do
          {
            std::string::size_type v10 = v9;
            uint64_t v9 = (uint64_t *)*v9;
          }
          while (v9);
        }
        else
        {
          long long v11 = v7;
          do
          {
            std::string::size_type v10 = (uint64_t *)v11[2];
            BOOL v12 = *v10 == (void)v11;
            long long v11 = v10;
          }
          while (!v12);
        }
        if (*v5 == v7) {
          *uint64_t v5 = v10;
        }
        uint64_t v13 = *(uint64_t **)(v4 + 128);
        --*(void *)(v4 + 136);
        std::__tree_remove[abi:ne180100]<std::__tree_node_base<void *> *>(v13, v8);
        size_t v14 = (const void *)v8[7];
        if (v14) {
          _Block_release(v14);
        }
        if (*((char *)v8 + 55) < 0) {
          operator delete((void *)v8[4]);
        }
        operator delete(v8);
      }
      v2 += 3;
    }
    while (v2 != v3);
  }
}

void dispatch::detail::group_notify<ServiceManager::initializeDynamicServices(void)::$_0>(dispatch_group_s *,dispatch_queue_s *,ServiceManager::initializeDynamicServices(void)::$_0 &&,std::integral_constant<BOOL,false>)::{lambda(void *)#1}::__invoke(void *a1)
{
  uint64_t v2 = *(void **)a1;
  uint64_t v3 = *((void *)a1 + 2);
  if (v3)
  {
    dispatch_retain(*((dispatch_object_t *)a1 + 2));
    dispatch_group_enter(v3);
  }
  uint64_t v4 = (std::__shared_weak_count *)v2[10];
  if (!v4 || (uint64_t v5 = v2[9], (v6 = std::__shared_weak_count::lock(v4)) == 0)) {
    std::__throw_bad_weak_ptr[abi:ne180100]();
  }
  uint64_t v7 = v6;
  int v8 = operator new(0x10uLL);
  void *v8 = v2;
  v8[1] = v3;
  uint64_t v9 = v2[11];
  atomic_fetch_add_explicit(&v7->__shared_owners_, 1uLL, memory_order_relaxed);
  std::string::size_type v10 = operator new(0x18uLL);
  *std::string::size_type v10 = v8;
  v10[1] = v5;
  v10[2] = v7;
  dispatch_async_f(v9, v10, (dispatch_function_t)dispatch::async<void ctu::SharedSynchronizable<ServiceManager>::execute_wrapped<ServiceManager::initializeDynamicServices(void)::$_0::operator() const(void)::{lambda(void)#1}>(ServiceManager::initializeDynamicServices(void)::$_0::operator() const(void)::{lambda(void)#1} &&)::{lambda(void)#1}>(dispatch_queue_s *,std::unique_ptr<ServiceManager::initializeDynamicServices(void)::$_0::operator() const(void)::{lambda(void)#1},dispatch_queue_s *::default_delete<ServiceManager::initializeDynamicServices(void)::$_0::operator() const(void)::{lambda(void)#1}>>)::{lambda(void *)#1}::__invoke);
  if (!atomic_fetch_add(&v7->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
    std::__shared_weak_count::__release_weak(v7);
  }
  long long v11 = *((void *)a1 + 2);
  if (v11)
  {
    dispatch_group_leave(v11);
    BOOL v12 = *((void *)a1 + 2);
    if (v12) {
      dispatch_release(v12);
    }
  }
  uint64_t v13 = *((void *)a1 + 1);
  if (v13) {
    dispatch_release(v13);
  }

  operator delete(a1);
}

void dispatch::async<void ctu::SharedSynchronizable<ServiceManager>::execute_wrapped<ServiceManager::initializeDynamicServices(void)::$_0::operator() const(void)::{lambda(void)#1}>(ServiceManager::initializeDynamicServices(void)::$_0::operator() const(void)::{lambda(void)#1} &&)::{lambda(void)#1}>(dispatch_queue_s *,std::unique_ptr<ServiceManager::initializeDynamicServices(void)::$_0::operator() const(void)::{lambda(void)#1},dispatch_queue_s *::default_delete<ServiceManager::initializeDynamicServices(void)::$_0::operator() const(void)::{lambda(void)#1}>>)::{lambda(void *)#1}::__invoke(uint64_t **a1)
{
  uint64_t v134 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  uint64_t v3 = **a1;
  (***(void (****)(void))(v3 + 104))(*(void *)(v3 + 104));
  uint64_t v4 = *(NSObject **)(v3 + 40);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = (uint64_t)(*(void *)(v3 + 152) - *(void *)(v3 + 144)) >> 4;
    *(_DWORD *)std::string buf = 134217984;
    *(void *)&buf[4] = v5;
    _os_log_impl(&dword_1C59C6000, v4, OS_LOG_TYPE_DEFAULT, "#I Initializing %zd services", buf, 0xCu);
  }
  v106 = a1;
  uint64_t v6 = dispatch_group_create();
  v107 = v2;
  uint64_t v7 = (std::__shared_weak_count *)operator new(0x38uLL);
  int v8 = &v7->__vftable;
  v7->__shared_owners_ = 0;
  p_shared_owners = &v7->__shared_owners_;
  v7->__shared_weak_owners_ = 0;
  v7->__vftable = (std::__shared_weak_count_vtbl *)&unk_1F2112740;
  v7[1].__vftable = (std::__shared_weak_count_vtbl *)v6;
  uint64_t v9 = (NSObject **)&v7[1];
  v109 = v7;
  if (!v6)
  {
    v7[1].__shared_owners_ = 0;
    v7[1].__shared_weak_owners_ = 0;
    v7[2].__vftable = 0;
    std::string::size_type v10 = *(uint64_t **)(v3 + 144);
    long long v11 = *(uint64_t **)(v3 + 152);
    if (v10 == v11) {
      goto LABEL_30;
    }
    while (1)
    {
LABEL_9:
      BOOL v12 = *(NSObject **)(v3 + 40);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v13 = (*(uint64_t (**)(void))(*(void *)*v10 + 16))();
        *(_DWORD *)std::string buf = 136315138;
        *(void *)&buf[4] = v13;
        _os_log_impl(&dword_1C59C6000, v12, OS_LOG_TYPE_DEFAULT, "#I Initializing '%s'", buf, 0xCu);
      }
      object.__r_.__value_.__r.__words[0] = 0xAAAAAAAAAAAAAAAALL;
      size_t v14 = (const char *)(*(uint64_t (**)(void))(*(void *)*v10 + 16))();
      size_t v15 = strlen(v14);
      if (v15 > 0x7FFFFFFFFFFFFFF7) {
        std::string::__throw_length_error[abi:ne180100]();
      }
      std::string::size_type v16 = v15;
      if (v15 >= 0x17) {
        break;
      }
      *((unsigned char *)&__dst.__r_.__value_.__s + 23) = v15;
      p_dst = &__dst;
      if (v15) {
        goto LABEL_18;
      }
LABEL_19:
      p_dst->__r_.__value_.__s.__data_[v16] = 0;
      std::string __p = __dst;
      memset(&__dst, 0, sizeof(__dst));
      memset(buf, 0, sizeof(buf));
      long long v119 = 0u;
      ctu::TrackedGroup::fork((NSObject **)&object, (uint64_t)v9, (uint64_t)&__p, (uint64_t)buf);
      ctu::os::signpost_interval::~signpost_interval((ctu::os::signpost_interval *)buf);
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      {
        operator delete(__p.__r_.__value_.__l.__data_);
        uint64_t v20 = *v10;
        uint64_t v21 = object.__r_.__value_.__r.__words[0];
        dispatch_group_t group = (dispatch_group_t)object.__r_.__value_.__r.__words[0];
        if (object.__r_.__value_.__r.__words[0])
        {
LABEL_23:
          dispatch_retain(v21);
          if (group) {
            dispatch_group_enter(group);
          }
        }
      }
      else
      {
        uint64_t v20 = *v10;
        uint64_t v21 = object.__r_.__value_.__r.__words[0];
        dispatch_group_t group = (dispatch_group_t)object.__r_.__value_.__r.__words[0];
        if (object.__r_.__value_.__r.__words[0]) {
          goto LABEL_23;
        }
      }
      (*(void (**)(uint64_t, dispatch_group_t *))(*(void *)v20 + 32))(v20, &group);
      if (group)
      {
        dispatch_group_leave(group);
        if (group) {
          dispatch_release(group);
        }
      }
      if (v21)
      {
        dispatch_group_leave(v21);
        dispatch_release(v21);
      }
      v10 += 2;
      if (v10 == v11) {
        goto LABEL_30;
      }
    }
    uint64_t v18 = (v15 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v15 | 7) != 0x17) {
      uint64_t v18 = v15 | 7;
    }
    uint64_t v19 = v18 + 1;
    p_dst = (std::string *)operator new(v18 + 1);
    __dst.__r_.__value_.__l.__size_ = v16;
    __dst.__r_.__value_.__r.__words[2] = v19 | 0x8000000000000000;
    __dst.__r_.__value_.__r.__words[0] = (std::string::size_type)p_dst;
LABEL_18:
    memmove(p_dst, v14, v16);
    goto LABEL_19;
  }
  dispatch_retain(v6);
  v8[4] = 0;
  v8[5] = 0;
  v8[6] = 0;
  dispatch_release(v6);
  std::string::size_type v10 = *(uint64_t **)(v3 + 144);
  long long v11 = *(uint64_t **)(v3 + 152);
  if (v10 != v11) {
    goto LABEL_9;
  }
LABEL_30:
  uint64_t v22 = *v9;
  uint64_t v23 = (*(uint64_t (**)(uint64_t))(*(void *)v3 + 88))(v3);
  dispatch_time_t v24 = dispatch_time(0, 1000000000 * v23);
  if (!dispatch_group_wait(v22, v24)) {
    goto LABEL_61;
  }
  memset(&__p, 0, sizeof(__p));
  shared_owners = (uint64_t *)v109[1].__shared_owners_;
  for (uint64_t i = (uint64_t *)v109[1].__shared_weak_owners_; shared_owners != i; shared_owners += 2)
  {
    uint64_t v27 = (std::__shared_weak_count *)shared_owners[1];
    if (v27)
    {
      unint64_t v28 = std::__shared_weak_count::lock(v27);
      if (v28)
      {
        uint64_t v29 = v28;
        uint64_t v30 = *shared_owners;
        if (*shared_owners)
        {
          std::string::size_type size = (_OWORD *)__p.__r_.__value_.__l.__size_;
          if (__p.__r_.__value_.__l.__size_ >= __p.__r_.__value_.__r.__words[2])
          {
            long long v33 = std::vector<std::string>::__emplace_back_slow_path<std::string const&>(&__p.__r_.__value_.__l.__data_, v30);
          }
          else
          {
            if (*(char *)(v30 + 23) < 0)
            {
              std::string::__init_copy_ctor_external((std::string *)__p.__r_.__value_.__l.__size_, *(const std::string::value_type **)v30, *(void *)(v30 + 8));
            }
            else
            {
              long long v32 = *(_OWORD *)v30;
              *(void *)(__p.__r_.__value_.__l.__size_ + 16) = *(void *)(v30 + 16);
              *std::string::size_type size = v32;
            }
            long long v33 = (std::string *)((char *)size + 24);
          }
          __p.__r_.__value_.__l.__size_ = (std::string::size_type)v33;
        }
        if (!atomic_fetch_add(&v29->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
        {
          ((void (*)(std::__shared_weak_count *))v29->__on_zero_shared)(v29);
          std::__shared_weak_count::__release_weak(v29);
        }
      }
    }
  }
  unint64_t v133 = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&long long v34 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v34 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v131 = v34;
  long long v132 = v34;
  long long v129 = v34;
  long long v130 = v34;
  long long v127 = v34;
  long long v128 = v34;
  long long v125 = v34;
  long long v126 = v34;
  long long v123 = v34;
  long long v124 = v34;
  *(_OWORD *)v121 = v34;
  long long v122 = v34;
  long long v119 = v34;
  long long v120 = v34;
  *(_OWORD *)std::string buf = v34;
  *(_OWORD *)&uint8_t buf[16] = v34;
  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)buf);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(buf, (uint64_t)"Initialization TIMEOUT: ", 24);
  long long v35 = (void *)std::ostream::operator<<();
  uint64_t v36 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v35, (uint64_t)" clients failed to complete init stage: ", 40);
  p_std::string object = &object;
  ctu::join<std::__wrap_iter<std::string *>>(&object, (std::string *)__p.__r_.__value_.__l.__data_, (long long *)__p.__r_.__value_.__l.__size_);
  if ((object.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
    p_std::string object = (std::string *)object.__r_.__value_.__r.__words[0];
  }
  size_t v38 = strlen((const char *)p_object);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v36, (uint64_t)p_object, v38);
  if (SHIBYTE(object.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(object.__r_.__value_.__l.__data_);
  }
  size_t v39 = *(NSObject **)(v3 + 40);
  if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
  {
    if ((BYTE8(v123) & 0x10) != 0)
    {
      uint64_t v92 = v123;
      if ((unint64_t)v123 < *((void *)&v120 + 1))
      {
        *(void *)&long long v123 = *((void *)&v120 + 1);
        uint64_t v92 = *((void *)&v120 + 1);
      }
      v93 = (const void **)&v120;
    }
    else
    {
      if ((BYTE8(v123) & 8) == 0)
      {
        std::string::size_type v88 = 0;
        *((unsigned char *)&object.__r_.__value_.__s + 23) = 0;
        unint64_t v89 = &object;
        goto LABEL_158;
      }
      v93 = (const void **)&buf[24];
      uint64_t v92 = *((void *)&v119 + 1);
    }
    v96 = *v93;
    std::string::size_type v88 = v92 - (void)*v93;
    if (v88 > 0x7FFFFFFFFFFFFFF7) {
      std::string::__throw_length_error[abi:ne180100]();
    }
    if (v88 >= 0x17)
    {
      uint64_t v97 = (v88 & 0xFFFFFFFFFFFFFFF8) + 8;
      if ((v88 | 7) != 0x17) {
        uint64_t v97 = v88 | 7;
      }
      uint64_t v98 = v97 + 1;
      unint64_t v89 = (std::string *)operator new(v97 + 1);
      object.__r_.__value_.__l.__size_ = v88;
      object.__r_.__value_.__r.__words[2] = v98 | 0x8000000000000000;
      object.__r_.__value_.__r.__words[0] = (std::string::size_type)v89;
    }
    else
    {
      *((unsigned char *)&object.__r_.__value_.__s + 23) = v92 - *(unsigned char *)v93;
      unint64_t v89 = &object;
      if (!v88) {
        goto LABEL_158;
      }
    }
    memmove(v89, v96, v88);
LABEL_158:
    v89->__r_.__value_.__s.__data_[v88] = 0;
    v99 = &object;
    if ((object.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
      v99 = (std::string *)object.__r_.__value_.__r.__words[0];
    }
    LODWORD(v117.__r_.__value_.__l.__data_) = 136315138;
    *(std::string::size_type *)((char *)v117.__r_.__value_.__r.__words + 4) = (std::string::size_type)v99;
    _os_log_error_impl(&dword_1C59C6000, v39, OS_LOG_TYPE_ERROR, "%s", (uint8_t *)&v117, 0xCu);
    if (SHIBYTE(object.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(object.__r_.__value_.__l.__data_);
    }
  }
  *(void *)std::string buf = *MEMORY[0x1E4FBA418];
  *(void *)&buf[*(void *)(*(void *)buf - 24)] = *(void *)(MEMORY[0x1E4FBA418] + 24);
  *(void *)&uint8_t buf[8] = MEMORY[0x1E4FBA470] + 16;
  if (SHIBYTE(v122) < 0) {
    operator delete(v121[1]);
  }
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  MEMORY[0x1C8795140](&v124);
  std::string::size_type v40 = __p.__r_.__value_.__r.__words[0];
  if (__p.__r_.__value_.__r.__words[0])
  {
    std::string::size_type v41 = __p.__r_.__value_.__l.__size_;
    unint64_t v42 = (void *)__p.__r_.__value_.__r.__words[0];
    if (__p.__r_.__value_.__l.__size_ != __p.__r_.__value_.__r.__words[0])
    {
      do
      {
        if (*(char *)(v41 - 1) < 0) {
          operator delete(*(void **)(v41 - 24));
        }
        v41 -= 24;
      }
      while (v41 != v40);
      unint64_t v42 = (void *)__p.__r_.__value_.__r.__words[0];
    }
    __p.__r_.__value_.__l.__size_ = v40;
    operator delete(v42);
  }
LABEL_61:
  uint64_t v43 = *(NSObject **)(v3 + 40);
  if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)std::string buf = 0;
    _os_log_impl(&dword_1C59C6000, v43, OS_LOG_TYPE_DEFAULT, "#I All services initialized; Starting them now!", buf, 2u);
  }
  dispatch_object_t v44 = dispatch_group_create();
  uint64_t v45 = operator new(0x38uLL);
  uint64_t v46 = v45;
  v45[1] = 0;
  v104 = v45 + 1;
  v45[2] = 0;
  *uint64_t v45 = &unk_1F2112740;
  v45[3] = v44;
  uint64_t v47 = (NSObject **)(v45 + 3);
  v108 = (std::__shared_weak_count *)v45;
  if (!v44)
  {
    v45[4] = 0;
    v45[5] = 0;
    v45[6] = 0;
    std::string::size_type v49 = *(uint64_t **)(v3 + 144);
    unint64_t v48 = *(uint64_t **)(v3 + 152);
    if (v49 == v48) {
      goto LABEL_90;
    }
    while (1)
    {
LABEL_69:
      char v50 = *(NSObject **)(v3 + 40);
      if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v51 = (*(uint64_t (**)(void))(*(void *)*v49 + 16))();
        *(_DWORD *)std::string buf = 136315138;
        *(void *)&buf[4] = v51;
        _os_log_impl(&dword_1C59C6000, v50, OS_LOG_TYPE_DEFAULT, "#I Starting '%s'", buf, 0xCu);
      }
      v117.__r_.__value_.__r.__words[0] = 0xAAAAAAAAAAAAAAAALL;
      uint64_t v52 = (const char *)(*(uint64_t (**)(void))(*(void *)*v49 + 16))();
      size_t v53 = strlen(v52);
      if (v53 > 0x7FFFFFFFFFFFFFF7) {
        std::string::__throw_length_error[abi:ne180100]();
      }
      std::string::size_type v54 = v53;
      if (v53 >= 0x17) {
        break;
      }
      *((unsigned char *)&object.__r_.__value_.__s + 23) = v53;
      uint64_t v55 = &object;
      if (v53) {
        goto LABEL_78;
      }
LABEL_79:
      v55->__r_.__value_.__s.__data_[v54] = 0;
      std::string __p = object;
      memset(&object, 0, sizeof(object));
      memset(buf, 0, sizeof(buf));
      long long v119 = 0u;
      ctu::TrackedGroup::fork((NSObject **)&v117, (uint64_t)v47, (uint64_t)&__p, (uint64_t)buf);
      ctu::os::signpost_interval::~signpost_interval((ctu::os::signpost_interval *)buf);
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      {
        operator delete(__p.__r_.__value_.__l.__data_);
        uint64_t v58 = *v49;
        long long v59 = v117.__r_.__value_.__r.__words[0];
        dispatch_group_t v110 = (dispatch_group_t)v117.__r_.__value_.__r.__words[0];
        if (v117.__r_.__value_.__r.__words[0])
        {
LABEL_83:
          dispatch_retain(v59);
          if (v110) {
            dispatch_group_enter(v110);
          }
        }
      }
      else
      {
        uint64_t v58 = *v49;
        long long v59 = v117.__r_.__value_.__r.__words[0];
        dispatch_group_t v110 = (dispatch_group_t)v117.__r_.__value_.__r.__words[0];
        if (v117.__r_.__value_.__r.__words[0]) {
          goto LABEL_83;
        }
      }
      (*(void (**)(uint64_t, dispatch_group_t *))(*(void *)v58 + 40))(v58, &v110);
      if (v110)
      {
        dispatch_group_leave(v110);
        if (v110) {
          dispatch_release(v110);
        }
      }
      if (v59)
      {
        dispatch_group_leave(v59);
        dispatch_release(v59);
      }
      v49 += 2;
      if (v49 == v48) {
        goto LABEL_90;
      }
    }
    uint64_t v56 = (v53 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v53 | 7) != 0x17) {
      uint64_t v56 = v53 | 7;
    }
    uint64_t v57 = v56 + 1;
    uint64_t v55 = (std::string *)operator new(v56 + 1);
    object.__r_.__value_.__l.__size_ = v54;
    object.__r_.__value_.__r.__words[2] = v57 | 0x8000000000000000;
    object.__r_.__value_.__r.__words[0] = (std::string::size_type)v55;
LABEL_78:
    memmove(v55, v52, v54);
    goto LABEL_79;
  }
  dispatch_retain(v44);
  v46[4] = 0;
  v46[5] = 0;
  v46[6] = 0;
  dispatch_release(v44);
  std::string::size_type v49 = *(uint64_t **)(v3 + 144);
  unint64_t v48 = *(uint64_t **)(v3 + 152);
  if (v49 != v48) {
    goto LABEL_69;
  }
LABEL_90:
  atomic_store(0, (unsigned __int8 *)(v3 + 192));
  uint64_t v60 = *v47;
  std::string::size_type v61 = v107;
  uint64_t v62 = v108;
  uint64_t v63 = (*(uint64_t (**)(uint64_t))(*(void *)v3 + 96))(v3);
  dispatch_time_t v64 = dispatch_time(0, 1000000000 * v63);
  if (!dispatch_group_wait(v60, v64)) {
    goto LABEL_121;
  }
  memset(&__p, 0, sizeof(__p));
  unint64_t v65 = (uint64_t *)v108[1].__shared_owners_;
  for (j = (uint64_t *)v108[1].__shared_weak_owners_; v65 != j; v65 += 2)
  {
    uint64_t v67 = (std::__shared_weak_count *)v65[1];
    if (v67)
    {
      uint64_t v68 = std::__shared_weak_count::lock(v67);
      if (v68)
      {
        v69 = v68;
        uint64_t v70 = *v65;
        if (*v65)
        {
          long long v71 = (_OWORD *)__p.__r_.__value_.__l.__size_;
          if (__p.__r_.__value_.__l.__size_ >= __p.__r_.__value_.__r.__words[2])
          {
            long long v73 = std::vector<std::string>::__emplace_back_slow_path<std::string const&>(&__p.__r_.__value_.__l.__data_, v70);
          }
          else
          {
            if (*(char *)(v70 + 23) < 0)
            {
              std::string::__init_copy_ctor_external((std::string *)__p.__r_.__value_.__l.__size_, *(const std::string::value_type **)v70, *(void *)(v70 + 8));
            }
            else
            {
              long long v72 = *(_OWORD *)v70;
              *(void *)(__p.__r_.__value_.__l.__size_ + 16) = *(void *)(v70 + 16);
              *long long v71 = v72;
            }
            long long v73 = (std::string *)((char *)v71 + 24);
          }
          __p.__r_.__value_.__l.__size_ = (std::string::size_type)v73;
        }
        if (!atomic_fetch_add(&v69->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
        {
          ((void (*)(std::__shared_weak_count *))v69->__on_zero_shared)(v69);
          std::__shared_weak_count::__release_weak(v69);
        }
      }
    }
  }
  unint64_t v133 = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&long long v74 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v74 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v131 = v74;
  long long v132 = v74;
  long long v129 = v74;
  long long v130 = v74;
  long long v127 = v74;
  long long v128 = v74;
  long long v125 = v74;
  long long v126 = v74;
  long long v123 = v74;
  long long v124 = v74;
  *(_OWORD *)v121 = v74;
  long long v122 = v74;
  long long v119 = v74;
  long long v120 = v74;
  *(_OWORD *)std::string buf = v74;
  *(_OWORD *)&uint8_t buf[16] = v74;
  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)buf);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(buf, (uint64_t)"Start TIMEOUT: ", 15);
  long long v75 = (void *)std::ostream::operator<<();
  unint64_t v76 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v75, (uint64_t)" clients failed to complete start stage: ", 41);
  unint64_t v77 = &v117;
  ctu::join<std::__wrap_iter<std::string *>>(&v117, (std::string *)__p.__r_.__value_.__l.__data_, (long long *)__p.__r_.__value_.__l.__size_);
  if ((v117.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
    unint64_t v77 = (std::string *)v117.__r_.__value_.__r.__words[0];
  }
  size_t v78 = strlen((const char *)v77);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v76, (uint64_t)v77, v78);
  if (SHIBYTE(v117.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v117.__r_.__value_.__l.__data_);
  }
  uint64_t v79 = *(NSObject **)(v3 + 40);
  if (os_log_type_enabled(v79, OS_LOG_TYPE_ERROR))
  {
    if ((BYTE8(v123) & 0x10) != 0)
    {
      uint64_t v94 = v123;
      if ((unint64_t)v123 < *((void *)&v120 + 1))
      {
        *(void *)&long long v123 = *((void *)&v120 + 1);
        uint64_t v94 = *((void *)&v120 + 1);
      }
      v95 = (const void **)&v120;
    }
    else
    {
      if ((BYTE8(v123) & 8) == 0)
      {
        std::string::size_type v90 = 0;
        *((unsigned char *)&v117.__r_.__value_.__s + 23) = 0;
        v91 = &v117;
LABEL_172:
        v91->__r_.__value_.__s.__data_[v90] = 0;
        v103 = &v117;
        if ((v117.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
          v103 = (std::string *)v117.__r_.__value_.__r.__words[0];
        }
        *(_DWORD *)v115 = 136315138;
        v116 = v103;
        _os_log_error_impl(&dword_1C59C6000, v79, OS_LOG_TYPE_ERROR, "%s", v115, 0xCu);
        if (SHIBYTE(v117.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(v117.__r_.__value_.__l.__data_);
        }
        uint64_t v62 = v108;
        goto LABEL_111;
      }
      v95 = (const void **)&buf[24];
      uint64_t v94 = *((void *)&v119 + 1);
    }
    v100 = *v95;
    std::string::size_type v90 = v94 - (void)*v95;
    if (v90 > 0x7FFFFFFFFFFFFFF7) {
      std::string::__throw_length_error[abi:ne180100]();
    }
    if (v90 >= 0x17)
    {
      uint64_t v101 = (v90 & 0xFFFFFFFFFFFFFFF8) + 8;
      if ((v90 | 7) != 0x17) {
        uint64_t v101 = v90 | 7;
      }
      uint64_t v102 = v101 + 1;
      v91 = (std::string *)operator new(v101 + 1);
      v117.__r_.__value_.__l.__size_ = v90;
      v117.__r_.__value_.__r.__words[2] = v102 | 0x8000000000000000;
      v117.__r_.__value_.__r.__words[0] = (std::string::size_type)v91;
    }
    else
    {
      *((unsigned char *)&v117.__r_.__value_.__s + 23) = v94 - *(unsigned char *)v95;
      v91 = &v117;
      if (!v90) {
        goto LABEL_171;
      }
    }
    memmove(v91, v100, v90);
LABEL_171:
    std::string::size_type v61 = v107;
    goto LABEL_172;
  }
LABEL_111:
  *(void *)std::string buf = *MEMORY[0x1E4FBA418];
  *(void *)&buf[*(void *)(*(void *)buf - 24)] = *(void *)(MEMORY[0x1E4FBA418] + 24);
  *(void *)&uint8_t buf[8] = MEMORY[0x1E4FBA470] + 16;
  if (SHIBYTE(v122) < 0) {
    operator delete(v121[1]);
  }
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  MEMORY[0x1C8795140](&v124);
  std::string::size_type v80 = __p.__r_.__value_.__r.__words[0];
  if (__p.__r_.__value_.__r.__words[0])
  {
    std::string::size_type v81 = __p.__r_.__value_.__l.__size_;
    long long v82 = (void *)__p.__r_.__value_.__r.__words[0];
    if (__p.__r_.__value_.__l.__size_ != __p.__r_.__value_.__r.__words[0])
    {
      do
      {
        if (*(char *)(v81 - 1) < 0) {
          operator delete(*(void **)(v81 - 24));
        }
        v81 -= 24;
      }
      while (v81 != v80);
      long long v82 = (void *)__p.__r_.__value_.__r.__words[0];
    }
    __p.__r_.__value_.__l.__size_ = v80;
    operator delete(v82);
  }
LABEL_121:
  long long v83 = *(NSObject **)(v3 + 40);
  if (os_log_type_enabled(v83, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)std::string buf = 0;
    _os_log_impl(&dword_1C59C6000, v83, OS_LOG_TYPE_DEFAULT, "#I All services started", buf, 2u);
  }
  uint64_t v84 = *(void *)(v3 + 104);
  *(void *)std::string buf = operator new(0x30uLL);
  *(_OWORD *)&uint8_t buf[8] = xmmword_1C5BCB080;
  strcpy(*(char **)buf, "com.apple.AppleBasebandManager.ServerNotReady");
  (*(void (**)(uint64_t, uint8_t *))(*(void *)v84 + 32))(v84, buf);
  if ((char)buf[23] < 0)
  {
    operator delete(*(void **)buf);
    if (atomic_fetch_add(v104, 0xFFFFFFFFFFFFFFFFLL))
    {
LABEL_125:
      if (atomic_fetch_add(p_shared_owners, 0xFFFFFFFFFFFFFFFFLL)) {
        goto LABEL_126;
      }
LABEL_130:
      ((void (*)(std::__shared_weak_count *))v109->__on_zero_shared)(v109);
      std::__shared_weak_count::__release_weak(v109);
      long long v85 = v61[1];
      if (!v85) {
        goto LABEL_133;
      }
      goto LABEL_131;
    }
  }
  else if (atomic_fetch_add(v104, 0xFFFFFFFFFFFFFFFFLL))
  {
    goto LABEL_125;
  }
  ((void (*)(std::__shared_weak_count *))v62->__on_zero_shared)(v62);
  std::__shared_weak_count::__release_weak(v62);
  if (!atomic_fetch_add(p_shared_owners, 0xFFFFFFFFFFFFFFFFLL)) {
    goto LABEL_130;
  }
LABEL_126:
  long long v85 = v61[1];
  if (!v85) {
    goto LABEL_133;
  }
LABEL_131:
  dispatch_group_leave(v85);
  long long v86 = v61[1];
  if (v86) {
    dispatch_release(v86);
  }
LABEL_133:
  operator delete(v61);
  long long v87 = (std::__shared_weak_count *)v106[2];
  if (v87 && !atomic_fetch_add(&v87->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v87->__on_zero_shared)(v87);
    std::__shared_weak_count::__release_weak(v87);
  }
  operator delete(v106);
}

void sub_1C5BBD558(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, atomic_ullong *a9, atomic_ullong *a10, void *a11, void *a12, std::__shared_weak_count *a13, std::__shared_weak_count *a14, uint64_t a15, uint64_t a16, dispatch_group_t group, void *a18, uint64_t a19, int a20,__int16 a21,char a22,char a23,dispatch_group_t object,uint64_t a25,uint64_t a26,uint64_t a27,void **__p,uint64_t a29,int a30,__int16 a31,char a32,char a33,uint64_t a34,uint64_t a35,uint64_t a36,void *a37,uint64_t a38,int a39,__int16 a40,char a41,char a42,uint64_t a43,uint64_t a44,uint64_t a45,int a46,__int16 a47,char a48,char a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,void *a56,uint64_t a57,int a58,__int16 a59,char a60,char a61)
{
  if (!atomic_fetch_add(&v61->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v61->__on_zero_shared)(v61);
    std::__shared_weak_count::__release_weak(v61);
  }
  if (__p)
  {
    dispatch_time_t v64 = v62;
    unint64_t v65 = __p;
    if (v62 != __p)
    {
      do
      {
        if (*((char *)v64 - 1) < 0) {
          operator delete(*(v64 - 3));
        }
        v64 -= 3;
      }
      while (v64 != __p);
      unint64_t v65 = __p;
    }
    operator delete(v65);
  }
  if (!atomic_fetch_add(a9, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))a13->__on_zero_shared)(a13);
    std::__shared_weak_count::__release_weak(a13);
  }
  if (!atomic_fetch_add(a10, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))a14->__on_zero_shared)(a14);
    std::__shared_weak_count::__release_weak(a14);
  }
  uint64_t v66 = a12[1];
  if (v66)
  {
    dispatch_group_leave(v66);
    uint64_t v67 = a12[1];
    if (v67) {
      dispatch_release(v67);
    }
  }
  operator delete(a12);
  uint64_t v68 = (std::__shared_weak_count *)a11[2];
  if (v68)
  {
    if (!atomic_fetch_add(&v68->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v68->__on_zero_shared)(v68);
      std::__shared_weak_count::__release_weak(v68);
    }
  }
  operator delete(a11);
  _Unwind_Resume(a1);
}

void dispatch::detail::group_notify<ServiceManager::shutdownDynamicServices(void)::$_0>(dispatch_group_s *,dispatch_queue_s *,ServiceManager::shutdownDynamicServices(void)::$_0 &&,std::integral_constant<BOOL,false>)::{lambda(void *)#1}::__invoke(void *a1)
{
  uint64_t v2 = *(void **)a1;
  uint64_t v3 = *((void *)a1 + 2);
  if (v3)
  {
    dispatch_retain(*((dispatch_object_t *)a1 + 2));
    dispatch_group_enter(v3);
  }
  uint64_t v4 = (std::__shared_weak_count *)v2[10];
  if (!v4 || (uint64_t v5 = v2[9], (v6 = std::__shared_weak_count::lock(v4)) == 0)) {
    std::__throw_bad_weak_ptr[abi:ne180100]();
  }
  uint64_t v7 = v6;
  int v8 = operator new(0x10uLL);
  void *v8 = v2;
  v8[1] = v3;
  uint64_t v9 = v2[11];
  atomic_fetch_add_explicit(&v7->__shared_owners_, 1uLL, memory_order_relaxed);
  std::string::size_type v10 = operator new(0x18uLL);
  *std::string::size_type v10 = v8;
  v10[1] = v5;
  v10[2] = v7;
  dispatch_async_f(v9, v10, (dispatch_function_t)dispatch::async<void ctu::SharedSynchronizable<ServiceManager>::execute_wrapped<ServiceManager::shutdownDynamicServices(void)::$_0::operator() const(void)::{lambda(void)#1}>(ServiceManager::shutdownDynamicServices(void)::$_0::operator() const(void)::{lambda(void)#1} &&)::{lambda(void)#1}>(dispatch_queue_s *,std::unique_ptr<ServiceManager::shutdownDynamicServices(void)::$_0::operator() const(void)::{lambda(void)#1},dispatch_queue_s *::default_delete<ServiceManager::shutdownDynamicServices(void)::$_0::operator() const(void)::{lambda(void)#1}>>)::{lambda(void *)#1}::__invoke);
  if (!atomic_fetch_add(&v7->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
    std::__shared_weak_count::__release_weak(v7);
  }
  long long v11 = *((void *)a1 + 2);
  if (v11)
  {
    dispatch_group_leave(v11);
    BOOL v12 = *((void *)a1 + 2);
    if (v12) {
      dispatch_release(v12);
    }
  }
  uint64_t v13 = *((void *)a1 + 1);
  if (v13) {
    dispatch_release(v13);
  }

  operator delete(a1);
}

void dispatch::async<void ctu::SharedSynchronizable<ServiceManager>::execute_wrapped<ServiceManager::shutdownDynamicServices(void)::$_0::operator() const(void)::{lambda(void)#1}>(ServiceManager::shutdownDynamicServices(void)::$_0::operator() const(void)::{lambda(void)#1} &&)::{lambda(void)#1}>(dispatch_queue_s *,std::unique_ptr<ServiceManager::shutdownDynamicServices(void)::$_0::operator() const(void)::{lambda(void)#1},dispatch_queue_s *::default_delete<ServiceManager::shutdownDynamicServices(void)::$_0::operator() const(void)::{lambda(void)#1}>>)::{lambda(void *)#1}::__invoke(std::__shared_weak_count **a1)
{
  uint64_t v159 = *MEMORY[0x1E4F143B8];
  unint64_t v133 = *a1;
  uint64_t v1 = (*a1)->__vftable;
  uint64_t v2 = v1[1].~__shared_weak_count;
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = ((char *)v1[3].__on_zero_shared_weak - (char *)v1[3].__get_deleter) >> 4;
    *(_DWORD *)std::string buf = 134217984;
    *(void *)&buf[4] = v3;
    _os_log_impl(&dword_1C59C6000, v2, OS_LOG_TYPE_DEFAULT, "#I Shutdown %zd dynamic services", buf, 0xCu);
  }
  atomic_store(1u, (unsigned __int8 *)&v1[4].__on_zero_shared_weak);
  v146 = 0;
  uint64_t v147 = 0;
  v145 = &v146;
  on_zero_shared_weak = v1[3].__on_zero_shared_weak;
  if (on_zero_shared_weak == (void (__cdecl *)(std::__shared_weak_count *__hidden))v1[3].__get_deleter) {
    goto LABEL_189;
  }
  while (2)
  {
    memset(buf, 170, 24);
    uint64_t v5 = *((void *)on_zero_shared_weak - 2);
    on_zero_shared_weak = (void (__cdecl *)(std::__shared_weak_count *__hidden))((char *)on_zero_shared_weak - 16);
    (*(void (**)(uint8_t *__return_ptr))(*(void *)v5 + 24))(buf);
    uint64_t v6 = *(unsigned __int8 **)buf;
    v139 = *(unsigned __int8 **)&buf[8];
    v137 = on_zero_shared_weak;
    if (*(void *)buf == *(void *)&buf[8])
    {
      if (*(void *)buf) {
        goto LABEL_73;
      }
      goto LABEL_5;
    }
    do
    {
      while (1)
      {
        unsigned int v7 = *v6;
        int v8 = v146;
        uint64_t v9 = &v146;
LABEL_12:
        std::string::size_type v10 = v9;
        if (v8) {
          break;
        }
LABEL_17:
        BOOL v12 = operator new(0x40uLL);
        uint64_t v13 = v12;
        *((unsigned char *)v12 + 32) = v7;
        v12[6] = 0;
        v12[7] = 0;
        v12[5] = 0;
        void *v12 = 0;
        v12[1] = 0;
        v12[2] = v9;
        *std::string::size_type v10 = v12;
        size_t v14 = v12;
        if (*v145)
        {
          v145 = (void **)*v145;
          size_t v14 = (void *)*v10;
        }
        size_t v15 = v146;
        BOOL v16 = v14 == v146;
        *((unsigned char *)v14 + 24) = v14 == v146;
        if (!v16)
        {
          do
          {
            uint64_t v17 = v14[2];
            if (*(unsigned char *)(v17 + 24)) {
              break;
            }
            uint64_t v18 = *(void **)(v17 + 16);
            uint64_t v19 = *v18;
            if (*v18 == v17)
            {
              uint64_t v22 = v18[1];
              if (!v22 || (v23 = *(unsigned __int8 *)(v22 + 24), uint64_t v20 = (unsigned char *)(v22 + 24), v23))
              {
                if (*(void **)v17 == v14)
                {
                  *(unsigned char *)(v17 + 24) = 1;
                  *((unsigned char *)v18 + 24) = 0;
                  uint64_t v26 = *(void *)(v17 + 8);
                  *uint64_t v18 = v26;
                  if (v26) {
                    goto LABEL_34;
                  }
                }
                else
                {
                  dispatch_time_t v24 = *(uint64_t **)(v17 + 8);
                  uint64_t v25 = *v24;
                  *(void *)(v17 + 8) = *v24;
                  if (v25)
                  {
                    *(void *)(v25 + 16) = v17;
                    uint64_t v18 = *(void **)(v17 + 16);
                  }
                  uint64_t v24[2] = (uint64_t)v18;
                  *(void *)(*(void *)(v17 + 16) + 8 * (**(void **)(v17 + 16) != v17)) = v24;
                  uint64_t *v24 = v17;
                  *(void *)(v17 + 16) = v24;
                  uint64_t v18 = (void *)v24[2];
                  uint64_t v17 = *v18;
                  *((unsigned char *)v24 + 24) = 1;
                  *((unsigned char *)v18 + 24) = 0;
                  uint64_t v26 = *(void *)(v17 + 8);
                  *uint64_t v18 = v26;
                  if (v26) {
LABEL_34:
                  }
                    *(void *)(v26 + 16) = v18;
                }
                *(void *)(v17 + 16) = v18[2];
                *(void *)(v18[2] + 8 * (*(void *)v18[2] != (void)v18)) = v17;
                *(void *)(v17 + 8) = v18;
LABEL_42:
                v18[2] = v17;
                break;
              }
            }
            else if (!v19 || (v21 = *(unsigned __int8 *)(v19 + 24), uint64_t v20 = (unsigned char *)(v19 + 24), v21))
            {
              if (*(void **)v17 == v14)
              {
                uint64_t v50 = v14[1];
                *(void *)uint64_t v17 = v50;
                if (v50)
                {
                  *(void *)(v50 + 16) = v17;
                  uint64_t v18 = *(void **)(v17 + 16);
                }
                v14[2] = v18;
                *(void *)(*(void *)(v17 + 16) + 8 * (**(void **)(v17 + 16) != v17)) = v14;
                v14[1] = v17;
                *(void *)(v17 + 16) = v14;
                uint64_t v18 = (void *)v14[2];
                *((unsigned char *)v14 + 24) = 1;
                *((unsigned char *)v18 + 24) = 0;
                uint64_t v17 = v18[1];
                uint64_t v30 = *(void **)v17;
                v18[1] = *(void *)v17;
                if (v30) {
LABEL_40:
                }
                  v30[2] = v18;
              }
              else
              {
                *(unsigned char *)(v17 + 24) = 1;
                *((unsigned char *)v18 + 24) = 0;
                uint64_t v17 = v18[1];
                uint64_t v30 = *(void **)v17;
                v18[1] = *(void *)v17;
                if (v30) {
                  goto LABEL_40;
                }
              }
              *(void *)(v17 + 16) = v18[2];
              *(void *)(v18[2] + 8 * (*(void *)v18[2] != (void)v18)) = v17;
              *(void *)uint64_t v17 = v18;
              goto LABEL_42;
            }
            *(unsigned char *)(v17 + 24) = 1;
            size_t v14 = v18;
            *((unsigned char *)v18 + 24) = v18 == v15;
            *uint64_t v20 = 1;
          }
          while (v18 != v15);
        }
        ++v147;
        uint64_t v27 = *(void *)on_zero_shared_weak;
        uint64_t v29 = (char *)v12[6];
        unint64_t v28 = (char *)v12[7];
        if (v29 >= v28) {
          goto LABEL_44;
        }
LABEL_9:
        *(void *)uint64_t v29 = v27;
        v13[6] = v29 + 8;
        if (++v6 == v139) {
          goto LABEL_72;
        }
      }
      while (1)
      {
        uint64_t v9 = (void **)v8;
        unsigned int v11 = *((unsigned __int8 *)v8 + 32);
        if (v7 < v11)
        {
          int v8 = *v9;
          goto LABEL_12;
        }
        if (v11 >= v7) {
          break;
        }
        int v8 = v9[1];
        if (!v8)
        {
          std::string::size_type v10 = v9 + 1;
          goto LABEL_17;
        }
      }
      uint64_t v13 = v9;
      uint64_t v27 = *(void *)on_zero_shared_weak;
      uint64_t v29 = (char *)v9[6];
      unint64_t v28 = (char *)v9[7];
      if (v29 < v28) {
        goto LABEL_9;
      }
LABEL_44:
      uint64_t v31 = v1;
      long long v32 = (char *)v13[5];
      uint64_t v33 = (v29 - v32) >> 3;
      unint64_t v34 = v33 + 1;
      if ((unint64_t)(v33 + 1) >> 61) {
        std::vector<dispatch::callback<void({block_pointer})(sar::OBDState,sar::TunerState)>>::__throw_length_error[abi:ne180100]();
      }
      uint64_t v35 = v28 - v32;
      if (v35 >> 2 > v34) {
        unint64_t v34 = v35 >> 2;
      }
      if ((unint64_t)v35 >= 0x7FFFFFFFFFFFFFF8) {
        unint64_t v36 = 0x1FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v36 = v34;
      }
      if (v36)
      {
        if (v36 >> 61) {
          std::__throw_bad_array_new_length[abi:ne180100]();
        }
        long long v37 = (char *)operator new(8 * v36);
        size_t v38 = &v37[8 * v33];
        *(void *)size_t v38 = v27;
        uint64_t v39 = (uint64_t)(v38 + 8);
        std::string::size_type v40 = (char *)(v29 - v32);
        if (v29 == v32)
        {
LABEL_62:
          v13[5] = v38;
          v13[6] = v39;
          v13[7] = &v37[8 * v36];
          uint64_t v1 = v31;
          if (!v29) {
            goto LABEL_64;
          }
LABEL_63:
          operator delete(v29);
          goto LABEL_64;
        }
      }
      else
      {
        long long v37 = 0;
        size_t v38 = (char *)(8 * v33);
        *(void *)(8 * v33) = v27;
        uint64_t v39 = 8 * v33 + 8;
        std::string::size_type v40 = (char *)(v29 - v32);
        if (v29 == v32) {
          goto LABEL_62;
        }
      }
      unint64_t v41 = (unint64_t)(v40 - 8);
      if (v41 < 0x58) {
        goto LABEL_231;
      }
      if ((unint64_t)(v32 - v37) < 0x20) {
        goto LABEL_231;
      }
      uint64_t v42 = (v41 >> 3) + 1;
      uint64_t v43 = 8 * (v42 & 0x3FFFFFFFFFFFFFFCLL);
      dispatch_object_t v44 = &v29[-v43];
      v38 -= v43;
      uint64_t v45 = &v37[8 * v33 - 16];
      uint64_t v46 = v29 - 16;
      uint64_t v47 = v42 & 0x3FFFFFFFFFFFFFFCLL;
      do
      {
        long long v48 = *(_OWORD *)v46;
        *((_OWORD *)v45 - 1) = *((_OWORD *)v46 - 1);
        *(_OWORD *)uint64_t v45 = v48;
        v45 -= 32;
        v46 -= 32;
        v47 -= 4;
      }
      while (v47);
      uint64_t v29 = v44;
      if (v42 != (v42 & 0x3FFFFFFFFFFFFFFCLL))
      {
LABEL_231:
        do
        {
          uint64_t v49 = *((void *)v29 - 1);
          v29 -= 8;
          *((void *)v38 - 1) = v49;
          v38 -= 8;
        }
        while (v29 != v32);
      }
      uint64_t v29 = (char *)v13[5];
      v13[5] = v38;
      v13[6] = v39;
      v13[7] = &v37[8 * v36];
      uint64_t v1 = v31;
      if (v29) {
        goto LABEL_63;
      }
LABEL_64:
      on_zero_shared_weak = v137;
      v13[6] = v39;
      ++v6;
    }
    while (v6 != v139);
LABEL_72:
    uint64_t v6 = *(unsigned __int8 **)buf;
    if (*(void *)buf)
    {
LABEL_73:
      *(void *)&uint8_t buf[8] = v6;
      operator delete(v6);
    }
LABEL_5:
    if (on_zero_shared_weak != (void (__cdecl *)(std::__shared_weak_count *__hidden))v1[3].__get_deleter) {
      continue;
    }
    break;
  }
  uint64_t v51 = v145;
  if (v145 == &v146) {
    goto LABEL_189;
  }
  uint64_t v134 = *MEMORY[0x1E4FBA418];
  uint64_t v135 = *(void *)(MEMORY[0x1E4FBA418] + 24);
  while (2)
  {
    uint64_t v52 = dispatch_group_create();
    size_t v53 = operator new(0x38uLL);
    std::string::size_type v54 = v53;
    v53[1] = 0;
    v136 = v53 + 1;
    v138 = (std::__shared_weak_count *)v53;
    v53[2] = 0;
    *size_t v53 = &unk_1F2112740;
    v53[3] = v52;
    uint64_t v55 = (NSObject **)(v53 + 3);
    if (v52)
    {
      dispatch_retain(v52);
      v54[4] = 0;
      v54[5] = 0;
      v54[6] = 0;
      dispatch_release(v52);
    }
    else
    {
      v53[4] = 0;
      v53[5] = 0;
      v53[6] = 0;
    }
    uint64_t v56 = v51[5];
    uint64_t v57 = v51[6];
    while (2)
    {
      if (v56 != v57)
      {
        uint64_t v58 = v1[1].~__shared_weak_count;
        if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
        {
          unint64_t v59 = *((char *)v51 + 32);
          uint64_t v60 = "???";
          if (v59 <= 3) {
            uint64_t v60 = off_1E651C7B0[v59];
          }
          uint64_t v61 = (*(uint64_t (**)(void))(*(void *)*v56 + 16))();
          *(_DWORD *)std::string buf = 136315394;
          *(void *)&buf[4] = v60;
          *(_WORD *)&buf[12] = 2080;
          *(void *)&buf[14] = v61;
          _os_log_impl(&dword_1C59C6000, v58, OS_LOG_TYPE_DEFAULT, "#I Shutdown dynamic service: Stage=%s Service=%s", buf, 0x16u);
        }
        dispatch_object_t object = (dispatch_object_t)0xAAAAAAAAAAAAAAAALL;
        uint64_t v62 = (const char *)(*(uint64_t (**)(void))(*(void *)*v56 + 16))();
        size_t v63 = strlen(v62);
        if (v63 > 0x7FFFFFFFFFFFFFF7) {
          std::string::__throw_length_error[abi:ne180100]();
        }
        size_t v64 = v63;
        if (v63 >= 0x17)
        {
          uint64_t v66 = (v63 & 0xFFFFFFFFFFFFFFF8) + 8;
          if ((v63 | 7) != 0x17) {
            uint64_t v66 = v63 | 7;
          }
          uint64_t v67 = v66 + 1;
          p_dst = (long long *)operator new(v66 + 1);
          *((void *)&__dst + 1) = v64;
          unint64_t v143 = v67 | 0x8000000000000000;
          *(void *)&long long __dst = p_dst;
        }
        else
        {
          HIBYTE(v143) = v63;
          p_dst = &__dst;
          if (!v63) {
            goto LABEL_95;
          }
        }
        memmove(p_dst, v62, v64);
LABEL_95:
        *((unsigned char *)p_dst + v64) = 0;
        *(_OWORD *)std::string __p = __dst;
        v149 = (void *)v143;
        long long __dst = 0uLL;
        unint64_t v143 = 0;
        memset(buf, 0, sizeof(buf));
        long long v152 = 0u;
        ctu::TrackedGroup::fork(&object, (uint64_t)v55, (uint64_t)__p, (uint64_t)buf);
        if (*((void *)&v152 + 1) && *(void *)buf)
        {
          v140.__r_.__value_.__r.__words[0] = *(void *)&buf[8];
          *(void *)v150 = *(void *)buf;
          (*(void (**)(void))(**((void **)&v152 + 1) + 48))();
        }
        if (*(void *)&buf[8]) {
          os_release(*(void **)&buf[8]);
        }
        uint64_t v68 = (uint8_t *)*((void *)&v152 + 1);
        *(void *)&uint8_t buf[8] = 0;
        *((void *)&v152 + 1) = 0;
        if (v68 == &buf[16])
        {
          (*(void (**)(uint8_t *))(*(void *)&buf[16] + 32))(&buf[16]);
          uint64_t v69 = *((void *)&v152 + 1);
          *(void *)std::string buf = 0;
          if (*((uint8_t **)&v152 + 1) == &buf[16]) {
            goto LABEL_108;
          }
LABEL_103:
          if (v69)
          {
            (*(void (**)(uint64_t))(*(void *)v69 + 40))(v69);
            if (SHIBYTE(v149) < 0) {
              goto LABEL_105;
            }
          }
          else
          {
LABEL_109:
            if (SHIBYTE(v149) < 0) {
              goto LABEL_105;
            }
          }
        }
        else
        {
          if (v68)
          {
            (*(void (**)(uint8_t *))(*(void *)v68 + 40))(v68);
            uint64_t v69 = *((void *)&v152 + 1);
            *(void *)std::string buf = 0;
            if (*((uint8_t **)&v152 + 1) != &buf[16]) {
              goto LABEL_103;
            }
LABEL_108:
            (*(void (**)(uint8_t *))(*(void *)&buf[16] + 32))(&buf[16]);
            goto LABEL_109;
          }
          *(void *)std::string buf = 0;
          if (SHIBYTE(v149) < 0)
          {
LABEL_105:
            operator delete(__p[0]);
            uint64_t v70 = *v56;
            uint64_t v71 = *((unsigned __int8 *)v51 + 32);
            long long v72 = object;
            dispatch_group_t group = object;
            if (!object)
            {
LABEL_113:
              (*(void (**)(uint64_t, uint64_t, dispatch_group_t *))(*(void *)v70 + 72))(v70, v71, &group);
              if (group)
              {
                dispatch_group_leave(group);
                if (group) {
                  dispatch_release(group);
                }
              }
              if (v72)
              {
                dispatch_group_leave(v72);
                dispatch_release(v72);
              }
              ++v56;
              continue;
            }
LABEL_111:
            dispatch_retain(v72);
            if (group) {
              dispatch_group_enter(group);
            }
            goto LABEL_113;
          }
        }
        uint64_t v70 = *v56;
        uint64_t v71 = *((unsigned __int8 *)v51 + 32);
        long long v72 = object;
        dispatch_group_t group = object;
        if (!object) {
          goto LABEL_113;
        }
        goto LABEL_111;
      }
      break;
    }
    long long v73 = *v55;
    uint64_t v74 = (*((uint64_t (**)(std::__shared_weak_count_vtbl *, void))v1->~__shared_weak_count + 15))(v1, *((unsigned __int8 *)v51 + 32));
    dispatch_time_t v75 = dispatch_time(0, 1000000000 * v74);
    unint64_t v76 = v138;
    if (dispatch_group_wait(v73, v75))
    {
      __p[0] = 0;
      __p[1] = 0;
      v149 = 0;
      shared_owners = (uint64_t *)v138[1].__shared_owners_;
      shared_weak_owners = (uint64_t *)v138[1].__shared_weak_owners_;
      while (shared_owners != shared_weak_owners)
      {
        uint64_t v79 = (std::__shared_weak_count *)shared_owners[1];
        if (v79)
        {
          std::string::size_type v80 = std::__shared_weak_count::lock(v79);
          if (v80)
          {
            std::string::size_type v81 = v80;
            uint64_t v82 = *shared_owners;
            if (*shared_owners)
            {
              long long v83 = __p[1];
              if (__p[1] >= v149)
              {
                long long v85 = std::vector<std::string>::__emplace_back_slow_path<std::string const&>((char **)__p, v82);
              }
              else
              {
                if (*(char *)(v82 + 23) < 0)
                {
                  std::string::__init_copy_ctor_external((std::string *)__p[1], *(const std::string::value_type **)v82, *(void *)(v82 + 8));
                }
                else
                {
                  long long v84 = *(_OWORD *)v82;
                  *((void *)__p[1] + 2) = *(void *)(v82 + 16);
                  *long long v83 = v84;
                }
                long long v85 = (std::string *)((char *)v83 + 24);
              }
              __p[1] = v85;
            }
            if (!atomic_fetch_add(&v81->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
            {
              ((void (*)(std::__shared_weak_count *))v81->__on_zero_shared)(v81);
              std::__shared_weak_count::__release_weak(v81);
            }
          }
        }
        shared_owners += 2;
      }
      unint64_t v158 = 0xAAAAAAAAAAAAAAAALL;
      *(void *)&long long v86 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v86 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v157[7] = v86;
      v157[8] = v86;
      v157[5] = v86;
      v157[6] = v86;
      v157[3] = v86;
      v157[4] = v86;
      v157[1] = v86;
      v157[2] = v86;
      long long v156 = v86;
      v157[0] = v86;
      *(_OWORD *)v154 = v86;
      long long v155 = v86;
      long long v152 = v86;
      long long v153 = v86;
      *(_OWORD *)std::string buf = v86;
      *(_OWORD *)&uint8_t buf[16] = v86;
      std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)buf);
      long long v87 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(buf, (uint64_t)"Shutdown dynamic service: Stage=", 32);
      unint64_t v88 = *((char *)v51 + 32);
      unint64_t v89 = "???";
      if (v88 <= 3) {
        unint64_t v89 = off_1E651C7B0[v88];
      }
      size_t v90 = strlen(v89);
      v91 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v87, (uint64_t)v89, v90);
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v91, (uint64_t)" TIMEOUT: ", 10);
      uint64_t v92 = (void *)std::ostream::operator<<();
      v93 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v92, (uint64_t)" clients failed to complete shutdown stage: ", 44);
      ctu::join<std::__wrap_iter<std::string *>>(&v140, (std::string *)__p[0], (long long *)__p[1]);
      if ((v140.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        uint64_t v94 = &v140;
      }
      else {
        uint64_t v94 = (std::string *)v140.__r_.__value_.__r.__words[0];
      }
      size_t v95 = strlen((const char *)v94);
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v93, (uint64_t)v94, v95);
      if (SHIBYTE(v140.__r_.__value_.__r.__words[2]) < 0)
      {
        operator delete(v140.__r_.__value_.__l.__data_);
        v96 = v1[1].~__shared_weak_count;
        if (!os_log_type_enabled(v96, OS_LOG_TYPE_ERROR)) {
          goto LABEL_170;
        }
      }
      else
      {
        v96 = v1[1].~__shared_weak_count;
        if (!os_log_type_enabled(v96, OS_LOG_TYPE_ERROR)) {
          goto LABEL_170;
        }
      }
      if ((BYTE8(v156) & 0x10) != 0)
      {
        uint64_t v101 = v156;
        uint64_t v102 = (const void **)&v153;
        if ((unint64_t)v156 < *((void *)&v153 + 1))
        {
          *(void *)&long long v156 = *((void *)&v153 + 1);
          uint64_t v101 = *((void *)&v153 + 1);
          uint64_t v102 = (const void **)&v153;
        }
LABEL_158:
        v103 = *v102;
        std::string::size_type v104 = v101 - (void)*v102;
        if (v104 > 0x7FFFFFFFFFFFFFF7) {
          std::string::__throw_length_error[abi:ne180100]();
        }
        if (v104 >= 0x17)
        {
          uint64_t v106 = (v104 & 0xFFFFFFFFFFFFFFF8) + 8;
          if ((v104 | 7) != 0x17) {
            uint64_t v106 = v104 | 7;
          }
          uint64_t v107 = v106 + 1;
          v105 = (std::string *)operator new(v106 + 1);
          v140.__r_.__value_.__l.__size_ = v104;
          v140.__r_.__value_.__r.__words[2] = v107 | 0x8000000000000000;
          v140.__r_.__value_.__r.__words[0] = (std::string::size_type)v105;
        }
        else
        {
          *((unsigned char *)&v140.__r_.__value_.__s + 23) = v101 - *(unsigned char *)v102;
          v105 = &v140;
          if (!v104) {
            goto LABEL_166;
          }
        }
        memmove(v105, v103, v104);
      }
      else
      {
        if ((BYTE8(v156) & 8) != 0)
        {
          uint64_t v101 = *((void *)&v152 + 1);
          uint64_t v102 = (const void **)&buf[24];
          goto LABEL_158;
        }
        std::string::size_type v104 = 0;
        *((unsigned char *)&v140.__r_.__value_.__s + 23) = 0;
        v105 = &v140;
      }
LABEL_166:
      v105->__r_.__value_.__s.__data_[v104] = 0;
      v108 = &v140;
      if ((v140.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
        v108 = (std::string *)v140.__r_.__value_.__r.__words[0];
      }
      *(_DWORD *)v150 = 136315138;
      *(void *)&v150[4] = v108;
      _os_log_error_impl(&dword_1C59C6000, v96, OS_LOG_TYPE_ERROR, "%s", v150, 0xCu);
      if (SHIBYTE(v140.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v140.__r_.__value_.__l.__data_);
      }
LABEL_170:
      *(void *)std::string buf = v134;
      *(void *)&buf[*(void *)(v134 - 24)] = v135;
      *(void *)&uint8_t buf[8] = MEMORY[0x1E4FBA470] + 16;
      if (SHIBYTE(v155) < 0) {
        operator delete(v154[1]);
      }
      std::streambuf::~streambuf();
      std::ostream::~ostream();
      MEMORY[0x1C8795140](v157);
      v109 = (void **)__p[0];
      if (__p[0])
      {
        dispatch_group_t v110 = (void **)__p[1];
        v111 = __p[0];
        if (__p[1] != __p[0])
        {
          do
          {
            if (*((char *)v110 - 1) < 0) {
              operator delete(*(v110 - 3));
            }
            v110 -= 3;
          }
          while (v110 != v109);
          v111 = __p[0];
        }
        __p[1] = v109;
        operator delete(v111);
      }
      unint64_t v76 = v138;
      if (!atomic_fetch_add(v136, 0xFFFFFFFFFFFFFFFFLL))
      {
LABEL_181:
        ((void (*)(std::__shared_weak_count *))v76->__on_zero_shared)(v76);
        std::__shared_weak_count::__release_weak(v76);
        v100 = v51[1];
        if (v100) {
          goto LABEL_182;
        }
        do
        {
LABEL_184:
          v112 = (void **)v51[2];
          BOOL v16 = *v112 == v51;
          uint64_t v51 = v112;
        }
        while (!v16);
        goto LABEL_76;
      }
    }
    else
    {
      uint64_t v97 = v1[1].~__shared_weak_count;
      if (os_log_type_enabled(v97, OS_LOG_TYPE_DEFAULT))
      {
        unint64_t v98 = *((char *)v51 + 32);
        v99 = "???";
        if (v98 <= 3) {
          v99 = off_1E651C7B0[v98];
        }
        *(_DWORD *)std::string buf = 136315138;
        *(void *)&buf[4] = v99;
        _os_log_impl(&dword_1C59C6000, v97, OS_LOG_TYPE_DEFAULT, "#I Shutdown dynamic service: Stage=%s SUCCESS", buf, 0xCu);
        if (!atomic_fetch_add(v136, 0xFFFFFFFFFFFFFFFFLL)) {
          goto LABEL_181;
        }
      }
      else if (!atomic_fetch_add(v136, 0xFFFFFFFFFFFFFFFFLL))
      {
        goto LABEL_181;
      }
    }
    v100 = v51[1];
    if (!v100) {
      goto LABEL_184;
    }
    do
    {
LABEL_182:
      v112 = (void **)v100;
      v100 = (void *)*v100;
    }
    while (v100);
LABEL_76:
    uint64_t v51 = v112;
    if (v112 != &v146) {
      continue;
    }
    break;
  }
  on_zero_shared_weak = (void (__cdecl *)(std::__shared_weak_count *__hidden))v1[3].__get_deleter;
LABEL_189:
  if (v1[3].__on_zero_shared_weak != on_zero_shared_weak)
  {
    on_zero_shared_weak = v1[3].__on_zero_shared_weak;
    do
    {
      v114 = on_zero_shared_weak;
      uint64_t v115 = *((void *)on_zero_shared_weak - 2);
      on_zero_shared_weak = (void (__cdecl *)(std::__shared_weak_count *__hidden))((char *)on_zero_shared_weak - 16);
      memset(buf, 0, 24);
      std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>(buf, *(void *)(v115 + 24), *(void *)(v115 + 32), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)(v115 + 32) - *(void *)(v115 + 24)) >> 3));
      uint64_t v116 = (uint64_t)v1[4].~__shared_weak_count_0;
      __p[1] = 0;
      v149 = 0;
      __p[0] = 0;
      std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>(__p, *(uint64_t *)buf, *(uint64_t *)&buf[8], 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)&buf[8] - *(void *)buf) >> 3));
      ServiceCtrl::clearCommandHandlers(v116, (uint64_t)__p[0], (uint64_t)__p[1]);
      std::string v117 = (void **)__p[0];
      if (__p[0])
      {
        v118 = (void **)__p[1];
        long long v119 = __p[0];
        if (__p[1] != __p[0])
        {
          do
          {
            if (*((char *)v118 - 1) < 0) {
              operator delete(*(v118 - 3));
            }
            v118 -= 3;
          }
          while (v118 != v117);
          long long v119 = __p[0];
        }
        __p[1] = v117;
        operator delete(v119);
      }
      uint64_t v120 = *(void *)buf;
      if (*(void *)buf)
      {
        uint64_t v121 = *(void *)&buf[8];
        v113 = *(void **)buf;
        if (*(void *)&buf[8] != *(void *)buf)
        {
          do
          {
            if (*(char *)(v121 - 1) < 0) {
              operator delete(*(void **)(v121 - 24));
            }
            v121 -= 24;
          }
          while (v121 != v120);
          v113 = *(void **)buf;
        }
        *(void *)&uint8_t buf[8] = v120;
        operator delete(v113);
      }
    }
    while (on_zero_shared_weak != (void (__cdecl *)(std::__shared_weak_count *__hidden))v1[3].__get_deleter);
    long long v122 = v1[3].__on_zero_shared_weak;
    if (v122 != on_zero_shared_weak)
    {
      long long v123 = (void (__cdecl *)(std::__shared_weak_count *__hidden))((char *)v122 + 16);
      do
      {
        long long v124 = (std::__shared_weak_count *)*((void *)v123 - 3);
        if (v124 && !atomic_fetch_add(&v124->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
        {
          ((void (*)(std::__shared_weak_count *))v124->__on_zero_shared)(v124);
          std::__shared_weak_count::__release_weak(v124);
        }
        long long v123 = (void (__cdecl *)(std::__shared_weak_count *__hidden))((char *)v123 - 16);
      }
      while (v123 != v114);
    }
  }
  v1[3].__on_zero_shared_weak = on_zero_shared_weak;
  get_deleter = v1[2].__get_deleter;
  *(void *)std::string buf = operator new(0x30uLL);
  *(_OWORD *)&uint8_t buf[8] = xmmword_1C5BCB080;
  strcpy(*(char **)buf, "com.apple.AppleBasebandManager.ServerNotReady");
  (*(void (**)(const void *(__cdecl *)(const std::__shared_weak_count *__hidden, const std::type_info *), uint8_t *))(*(void *)get_deleter + 32))(get_deleter, buf);
  if ((char)buf[23] < 0) {
    operator delete(*(void **)buf);
  }
  (*(void (**)(const void *(__cdecl *)(const std::__shared_weak_count *__hidden, const std::type_info *)))(*(void *)v1[2].__get_deleter + 8))(v1[2].__get_deleter);
  long long v126 = v1[1].~__shared_weak_count;
  if (os_log_type_enabled(v126, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v140.__r_.__value_.__l.__data_) = 0;
    _os_log_impl(&dword_1C59C6000, v126, OS_LOG_TYPE_DEFAULT, "#I All dynamic services have shutdown", (uint8_t *)&v140, 2u);
  }
  std::__tree<std::__value_type<ShutdownStage,std::vector<Service *>>,std::__map_value_compare<ShutdownStage,std::__value_type<ShutdownStage,std::vector<Service *>>,std::less<ShutdownStage>,true>,std::allocator<std::__value_type<ShutdownStage,std::vector<Service *>>>>::destroy(v146);
  long long v127 = v133;
  long long v128 = v133->__shared_owners_;
  if (v128)
  {
    dispatch_group_leave(v128);
    long long v127 = v133;
    long long v129 = v133->__shared_owners_;
    if (v129)
    {
      dispatch_release(v129);
      long long v127 = v133;
    }
  }
  operator delete(v127);
  long long v130 = a1;
  long long v131 = a1[2];
  if (v131 && !atomic_fetch_add(&v131->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v131->__on_zero_shared)(v131);
    std::__shared_weak_count::__release_weak(v131);
    long long v130 = a1;
  }
  operator delete(v130);
}

void sub_1C5BBEE54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, std::__shared_weak_count **a10, NSObject **a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,void *a25,uint64_t a26,uint64_t a27,uint64_t a28,dispatch_group_t group,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,void *a35,uint64_t a36,void *a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,void *__p,uint64_t a44,int a45,__int16 a46,char a47,char a48)
{
  if (a48 < 0) {
    operator delete(__p);
  }
  std::__tree<std::__value_type<ShutdownStage,std::vector<Service *>>,std::__map_value_compare<ShutdownStage,std::__value_type<ShutdownStage,std::vector<Service *>>,std::less<ShutdownStage>,true>,std::allocator<std::__value_type<ShutdownStage,std::vector<Service *>>>>::destroy(a35);
  uint64_t v49 = a11;
  uint64_t v50 = a11[1];
  if (v50)
  {
    dispatch_group_leave(v50);
    uint64_t v49 = a11;
    uint64_t v51 = a11[1];
    if (v51)
    {
      dispatch_release(v51);
      uint64_t v49 = a11;
    }
  }
  operator delete(v49);
  uint64_t v52 = a10;
  size_t v53 = a10[2];
  if (v53)
  {
    if (!atomic_fetch_add(&v53->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v53->__on_zero_shared)(v53);
      std::__shared_weak_count::__release_weak(v53);
      uint64_t v52 = a10;
    }
  }
  operator delete(v52);
  _Unwind_Resume(a1);
}

void std::__tree<std::__value_type<ShutdownStage,std::vector<Service *>>,std::__map_value_compare<ShutdownStage,std::__value_type<ShutdownStage,std::vector<Service *>>,std::less<ShutdownStage>,true>,std::allocator<std::__value_type<ShutdownStage,std::vector<Service *>>>>::destroy(void *a1)
{
  if (a1)
  {
    std::__tree<std::__value_type<ShutdownStage,std::vector<Service *>>,std::__map_value_compare<ShutdownStage,std::__value_type<ShutdownStage,std::vector<Service *>>,std::less<ShutdownStage>,true>,std::allocator<std::__value_type<ShutdownStage,std::vector<Service *>>>>::destroy(*a1);
    std::__tree<std::__value_type<ShutdownStage,std::vector<Service *>>,std::__map_value_compare<ShutdownStage,std::__value_type<ShutdownStage,std::vector<Service *>>,std::less<ShutdownStage>,true>,std::allocator<std::__value_type<ShutdownStage,std::vector<Service *>>>>::destroy(a1[1]);
    uint64_t v2 = (void *)a1[5];
    if (v2)
    {
      a1[6] = v2;
      operator delete(v2);
    }
    operator delete(a1);
  }
}

uint64_t APFSVolumeNeedsCryptoMigration()
{
  return MEMORY[0x1F4105388]();
}

uint64_t APFSVolumeRole()
{
  return MEMORY[0x1F4105390]();
}

void AudioServicesPlaySystemSound(SystemSoundID inSystemSoundID)
{
}

uint64_t BBUFSServerCopyDefaultDestination()
{
  return MEMORY[0x1F4179F70]();
}

uint64_t BBUFSServerCreate()
{
  return MEMORY[0x1F4179F78]();
}

uint64_t BBUFSServerFlush()
{
  return MEMORY[0x1F4179F80]();
}

uint64_t BBUFSServerFlushInProgress()
{
  return MEMORY[0x1F4179F88]();
}

uint64_t BBUFSServerParametersInit()
{
  return MEMORY[0x1F4179F90]();
}

uint64_t BBUFSServerRelease()
{
  return MEMORY[0x1F4179F98]();
}

uint64_t BBUFSServerSetConfig()
{
  return MEMORY[0x1F4179FA0]();
}

uint64_t BBUFSServerStart()
{
  return MEMORY[0x1F4179FA8]();
}

uint64_t BBUFSServerStop()
{
  return MEMORY[0x1F4179FB0]();
}

uint64_t BBUpdaterExecCommand()
{
  return MEMORY[0x1F4179FB8]();
}

uint64_t BBUpdaterExtremeCreate()
{
  return MEMORY[0x1F4179FC0]();
}

uint64_t BBUpdaterRegisterGlobalLogSink()
{
  return MEMORY[0x1F4179FC8]();
}

uint64_t BBUpdaterSetOptions()
{
  return MEMORY[0x1F4179FD0]();
}

uint64_t BasebandUpdaterCreate()
{
  return MEMORY[0x1F4179FD8]();
}

uint64_t BasebandUpdaterExecCommand()
{
  return MEMORY[0x1F4179FE0]();
}

int CC_SHA256_Final(unsigned __int8 *md, CC_SHA256_CTX *c)
{
  return MEMORY[0x1F40C9778](md, c);
}

int CC_SHA256_Init(CC_SHA256_CTX *c)
{
  return MEMORY[0x1F40C9780](c);
}

int CC_SHA256_Update(CC_SHA256_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1F40C9788](c, data, *(void *)&len);
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

void CFArrayApplyFunction(CFArrayRef theArray, CFRange range, CFArrayApplierFunction applier, void *context)
{
}

Boolean CFArrayContainsValue(CFArrayRef theArray, CFRange range, const void *value)
{
  return MEMORY[0x1F40D7160](theArray, range.location, range.length, value);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x1F40D7190](allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x1F40D71B8](theArray);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x1F40D71D8]();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x1F40D71F0](theArray, idx);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x1F40D7420]();
}

CFStringRef CFCopyDescription(CFTypeRef cf)
{
  return (CFStringRef)MEMORY[0x1F40D77A8](cf);
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x1F40D77E8](allocator, bytes, length);
}

void CFDataGetBytes(CFDataRef theData, CFRange range, UInt8 *buffer)
{
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x1F40D7850](theData);
}

CFTypeID CFDataGetTypeID(void)
{
  return MEMORY[0x1F40D7860]();
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

Boolean CFDictionaryContainsKey(CFDictionaryRef theDict, const void *key)
{
  return MEMORY[0x1F40D7968](theDict, key);
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x1F40D7978](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x1F40D7998](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDictionaryRef theDict)
{
  return (CFMutableDictionaryRef)MEMORY[0x1F40D79A8](allocator, capacity, theDict);
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return MEMORY[0x1F40D79C0](theDict);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x1F40D7A00]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1F40D7A10](theDict, key);
}

void CFDictionaryRemoveValue(CFMutableDictionaryRef theDict, const void *key)
{
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFErrorRef CFErrorCreateWithUserInfoKeysAndValues(CFAllocatorRef allocator, CFErrorDomain domain, CFIndex code, const void *const *userInfoKeys, const void *const *userInfoValues, CFIndex numUserInfoValues)
{
  return (CFErrorRef)MEMORY[0x1F40D7AA0](allocator, domain, code, userInfoKeys, userInfoValues, numUserInfoValues);
}

CFIndex CFErrorGetCode(CFErrorRef err)
{
  return MEMORY[0x1F40D7AA8](err);
}

CFErrorDomain CFErrorGetDomain(CFErrorRef err)
{
  return (CFErrorDomain)MEMORY[0x1F40D7AB8](err);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1F40D7B80](cf);
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1F40D7D08]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x1F40D7D80](allocator, theType, valuePtr);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x1F40D7E10]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x1F40D7E20](number, theType, valuePtr);
}

void CFPreferencesSetValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
}

Boolean CFPreferencesSynchronize(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return MEMORY[0x1F40D7F10](applicationID, userName, hostName);
}

CFPropertyListRef CFPropertyListCreateWithStream(CFAllocatorRef allocator, CFReadStreamRef stream, CFIndex streamLength, CFOptionFlags options, CFPropertyListFormat *format, CFErrorRef *error)
{
  return (CFPropertyListRef)MEMORY[0x1F40D7F58](allocator, stream, streamLength, options, format, error);
}

void CFReadStreamClose(CFReadStreamRef stream)
{
}

CFReadStreamRef CFReadStreamCreateWithFile(CFAllocatorRef alloc, CFURLRef fileURL)
{
  return (CFReadStreamRef)MEMORY[0x1F40D7FC0](alloc, fileURL);
}

Boolean CFReadStreamOpen(CFReadStreamRef stream)
{
  return MEMORY[0x1F40D7FF8](stream);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1F40D8048](cf);
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return (CFRunLoopRef)MEMORY[0x1F40D80B0]();
}

Boolean CFRunLoopIsWaiting(CFRunLoopRef rl)
{
  return MEMORY[0x1F40D80D0](rl);
}

void CFRunLoopPerformBlock(CFRunLoopRef rl, CFTypeRef mode, void *block)
{
}

void CFRunLoopRemoveSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

CFRunLoopRunResult CFRunLoopRunInMode(CFRunLoopMode mode, CFTimeInterval seconds, Boolean returnAfterSourceHandled)
{
  return MEMORY[0x1F40D8128](mode, returnAfterSourceHandled, seconds);
}

CFRunLoopSourceRef CFRunLoopSourceCreate(CFAllocatorRef allocator, CFIndex order, CFRunLoopSourceContext *context)
{
  return (CFRunLoopSourceRef)MEMORY[0x1F40D8140](allocator, order, context);
}

void CFRunLoopStop(CFRunLoopRef rl)
{
}

void CFRunLoopWakeUp(CFRunLoopRef rl)
{
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1F40D8388](theString1, theString2, compareOptions);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x1F40D8448](alloc, cStr, *(void *)&encoding);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x1F40D85F0]();
}

CFURLRef CFURLCreateWithFileSystemPath(CFAllocatorRef allocator, CFStringRef filePath, CFURLPathStyle pathStyle, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x1F40D88A0](allocator, filePath, pathStyle, isDirectory);
}

uint64_t IOPMClaimSystemWakeEvent()
{
  return MEMORY[0x1F40E8FC8]();
}

uint64_t KTLDebugRegisterDelegate()
{
  return MEMORY[0x1F417A838]();
}

uint64_t KTLDebugSetFlags()
{
  return MEMORY[0x1F417A840]();
}

uint64_t KTLInitOptions()
{
  return MEMORY[0x1F417A848]();
}

uint64_t KTLOpenChannel()
{
  return MEMORY[0x1F417A850]();
}

uint64_t NEHelperCacheCopyAppUUIDMapping()
{
  return MEMORY[0x1F40C98D8]();
}

uint64_t SBSGetScreenLockStatus()
{
  return MEMORY[0x1F415C380]();
}

uint64_t TelephonyBasebandCreateController()
{
  return MEMORY[0x1F417D178]();
}

uint64_t TelephonyBasebandGetBasebandState()
{
  return MEMORY[0x1F417D190]();
}

uint64_t TelephonyBasebandGetManagerState()
{
  return MEMORY[0x1F417D198]();
}

uint64_t TelephonyBasebandGetPowerDebugOptions()
{
  return MEMORY[0x1F417D1A0]();
}

uint64_t TelephonyBasebandGetReset()
{
  return MEMORY[0x1F417D1A8]();
}

uint64_t TelephonyBasebandPCITransportCreate()
{
  return MEMORY[0x1F417CF18]();
}

uint64_t TelephonyBasebandPCITransportInitParameters()
{
  return MEMORY[0x1F417CF20]();
}

uint64_t TelephonyBasebandPowerDebugUnblock()
{
  return MEMORY[0x1F417D1B0]();
}

uint64_t TelephonyBasebandPowerOnModem()
{
  return MEMORY[0x1F417D1B8]();
}

uint64_t TelephonyBasebandPowercycleModem()
{
  return MEMORY[0x1F417D1C0]();
}

uint64_t TelephonyBasebandRegisterForReset()
{
  return MEMORY[0x1F417D1C8]();
}

uint64_t TelephonyBasebandReportThermalData()
{
  return MEMORY[0x1F417D1D0]();
}

uint64_t TelephonyBasebandResetModem()
{
  return MEMORY[0x1F417D1D8]();
}

uint64_t TelephonyBasebandResetSPMI()
{
  return MEMORY[0x1F417D1E0]();
}

uint64_t TelephonyBasebandSetBasebandProperty()
{
  return MEMORY[0x1F417D1E8]();
}

uint64_t TelephonyBasebandSetBasebandState()
{
  return MEMORY[0x1F417D1F0]();
}

uint64_t TelephonyBasebandSetChargerDesense()
{
  return MEMORY[0x1F417D1F8]();
}

uint64_t TelephonyBasebandSetManagerState()
{
  return MEMORY[0x1F417D200]();
}

uint64_t TelephonyBasebandSetPowerDebugOptions()
{
  return MEMORY[0x1F417D210]();
}

uint64_t TelephonyBasebandWatchdogStart()
{
  return MEMORY[0x1F417D740]();
}

uint64_t TelephonyBasebandWatchdogStop()
{
  return MEMORY[0x1F417D748]();
}

uint64_t TelephonyUtilDebugRegisterDelegate()
{
  return MEMORY[0x1F417D8C0]();
}

uint64_t TelephonyUtilDebugSetFlags()
{
  return MEMORY[0x1F417D8C8]();
}

uint64_t TelephonyUtilGetSystemTime()
{
  return MEMORY[0x1F417D750]();
}

uint64_t TelephonyUtilGetSystemWakeReason()
{
  return MEMORY[0x1F417D758]();
}

uint64_t TelephonyUtilIsCarrierBuild()
{
  return MEMORY[0x1F417D760]();
}

uint64_t TelephonyUtilIsInternalBuild()
{
  return MEMORY[0x1F417D768]();
}

uint64_t TelephonyUtilIsVendorBuild()
{
  return MEMORY[0x1F417D770]();
}

uint64_t TelephonyUtilSystemMachTime()
{
  return MEMORY[0x1F417D778]();
}

uint64_t TelephonyUtilTransportFree()
{
  return MEMORY[0x1F417D940]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1F40C9A70](aBlock);
}

void _Block_object_assign(void *a1, const void *a2, const int a3)
{
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

uint64_t asString()
{
  return MEMORY[0x1F4178590]();
}

uint64_t TelephonyXPC::Client::create()
{
  return MEMORY[0x1F4163B10]();
}

uint64_t TelephonyXPC::Client::perform()
{
  return MEMORY[0x1F4163B18]();
}

uint64_t TelephonyXPC::Command::create()
{
  return MEMORY[0x1F4163B38]();
}

uint64_t capabilities::abs::shouldBoot(capabilities::abs *this)
{
  return MEMORY[0x1F417D218](this);
}

uint64_t capabilities::abs::TUDebugFlags(capabilities::abs *this)
{
  return MEMORY[0x1F417D228](this);
}

uint64_t capabilities::abs::supportsCoex(capabilities::abs *this)
{
  return MEMORY[0x1F417D230](this);
}

uint64_t capabilities::abs::getCPMSVariant(capabilities::abs *this)
{
  return MEMORY[0x1F417D238](this);
}

uint64_t capabilities::abs::logScratchPath(capabilities::abs *this)
{
  return MEMORY[0x1F417D240](this);
}

uint64_t capabilities::abs::logSnapshotPath(capabilities::abs *this)
{
  return MEMORY[0x1F417D248](this);
}

uint64_t capabilities::abs::shouldSetRegion(capabilities::abs *this)
{
  return MEMORY[0x1F417D250](this);
}

uint64_t capabilities::abs::supportsDesense(capabilities::abs *this)
{
  return MEMORY[0x1F417D258](this);
}

uint64_t capabilities::abs::supportsMagSafe(capabilities::abs *this)
{
  return MEMORY[0x1F417D260](this);
}

uint64_t capabilities::abs::CPMSDebounceTimer(capabilities::abs *this)
{
  return MEMORY[0x1F417D280](this);
}

uint64_t capabilities::abs::supportsCoexEur5G(capabilities::abs *this)
{
  return MEMORY[0x1F417D290](this);
}

uint64_t capabilities::abs::shouldIgnoreResets(capabilities::abs *this)
{
  return MEMORY[0x1F417D2A0](this);
}

uint64_t capabilities::abs::supportsRFSelfTest(capabilities::abs *this)
{
  return MEMORY[0x1F417D2A8](this);
}

uint64_t capabilities::abs::supportsETSProtocol(capabilities::abs *this)
{
  return MEMORY[0x1F417D2B0](this);
}

uint64_t capabilities::abs::supportsRadioHealth(capabilities::abs *this)
{
  return MEMORY[0x1F417D2B8](this);
}

uint64_t capabilities::abs::supportedSARFeatures(capabilities::abs *this)
{
  return MEMORY[0x1F417D2C8](this);
}

uint64_t capabilities::abs::supportsCellularCert(capabilities::abs *this)
{
  return MEMORY[0x1F417D2D0](this);
}

uint64_t capabilities::abs::supportsRFFEScanData(capabilities::abs *this)
{
  return MEMORY[0x1F417D2D8](this);
}

uint64_t capabilities::abs::supportsNetworkPolicy(capabilities::abs *this)
{
  return MEMORY[0x1F417D2F0](this);
}

uint64_t capabilities::abs::thermalSensorMaxCount(capabilities::abs *this)
{
  return MEMORY[0x1F417D2F8](this);
}

uint64_t capabilities::abs::fileSystemFlushTimeout(capabilities::abs *this)
{
  return MEMORY[0x1F417D310](this);
}

uint64_t capabilities::abs::supportsChargerDesense(capabilities::abs *this)
{
  return MEMORY[0x1F417D318](this);
}

uint64_t capabilities::abs::supportsResetSPMIEvent(capabilities::abs *this)
{
  return MEMORY[0x1F417D320](this);
}

uint64_t capabilities::abs::fileSystemFlushInterval(capabilities::abs *this)
{
  return MEMORY[0x1F417D330](this);
}

uint64_t capabilities::abs::supportsAccessoryModule(capabilities::abs *this)
{
  return MEMORY[0x1F417D338](this);
}

uint64_t capabilities::abs::supportsCMHandDetection(capabilities::abs *this)
{
  return MEMORY[0x1F417D340](this);
}

uint64_t capabilities::abs::supportsFieldTestConfig(capabilities::abs *this)
{
  return MEMORY[0x1F417D350](this);
}

uint64_t capabilities::abs::SMCThermalReportInterval(capabilities::abs *this)
{
  return MEMORY[0x1F417D358](this);
}

uint64_t capabilities::abs::defaultSystemLogsHistory(capabilities::abs *this)
{
  return MEMORY[0x1F417D360](this);
}

uint64_t capabilities::abs::supportsCalibrationQuery(capabilities::abs *this)
{
  return MEMORY[0x1F417D370](this);
}

uint64_t capabilities::abs::supportsCoexGPSReporting(capabilities::abs *this)
{
  return MEMORY[0x1F417D378](this);
}

uint64_t capabilities::abs::supportsSMCThermalReport(capabilities::abs *this)
{
  return MEMORY[0x1F417D388](this);
}

uint64_t capabilities::abs::shouldForceSyncFileSystem(capabilities::abs *this)
{
  return MEMORY[0x1F417D390](this);
}

uint64_t capabilities::abs::engageTimeoutScalingFactor(capabilities::abs *this)
{
  return MEMORY[0x1F417D398](this);
}

uint64_t capabilities::abs::supportsCPMSConnectedState(capabilities::abs *this)
{
  return MEMORY[0x1F417D3A0](this);
}

uint64_t capabilities::abs::supportsCPMSGetPowerFromBB(capabilities::abs *this)
{
  return MEMORY[0x1F417D3A8](this);
}

uint64_t capabilities::abs::supportsEFSEraseOnBootLoop(capabilities::abs *this)
{
  return MEMORY[0x1F417D3B0](this);
}

uint64_t capabilities::abs::supportsDataTransportService(capabilities::abs *this)
{
  return MEMORY[0x1F417D3C8](this);
}

uint64_t capabilities::abs::supportsBatteryInfoMonitoring(capabilities::abs *this)
{
  return MEMORY[0x1F417D3D8](this);
}

uint64_t capabilities::abs::supportsDisplayCoverAccessory(capabilities::abs *this)
{
  return MEMORY[0x1F417D3E0](this);
}

uint64_t capabilities::abs::ARIMessageTimeoutScalingFactor(capabilities::abs *this)
{
  return MEMORY[0x1F417D3E8](this);
}

uint64_t capabilities::abs::serviceInitTimeoutScalingFactor(capabilities::abs *this)
{
  return MEMORY[0x1F417D3F8](this);
}

uint64_t capabilities::abs::supportsSmartConnectorAccessory(capabilities::abs *this)
{
  return MEMORY[0x1F417D400](this);
}

uint64_t capabilities::abs::serviceSleepTimeoutScalingFactor(capabilities::abs *this)
{
  return MEMORY[0x1F417D408](this);
}

uint64_t capabilities::abs::serviceStartTimeoutScalingFactor(capabilities::abs *this)
{
  return MEMORY[0x1F417D410](this);
}

uint64_t capabilities::abs::resetAssertionTimeoutScalingFactor(capabilities::abs *this)
{
  return MEMORY[0x1F417D420](this);
}

uint64_t capabilities::abs::traceTransportTimeoutScalingFactor(capabilities::abs *this)
{
  return MEMORY[0x1F417D428](this);
}

uint64_t capabilities::abs::bootupAssertionTimeoutScalingFactor(capabilities::abs *this)
{
  return MEMORY[0x1F417D430](this);
}

uint64_t capabilities::abs::serviceShutdownTimeoutScalingFactor(capabilities::abs *this)
{
  return MEMORY[0x1F417D438](this);
}

uint64_t capabilities::abs::shutdownAssertionTimeoutScalingFactor(capabilities::abs *this)
{
  return MEMORY[0x1F417D440](this);
}

uint64_t capabilities::abs::shouldUseMinBasebandTransportIOReadSize(capabilities::abs *this)
{
  return MEMORY[0x1F417D448](this);
}

uint64_t capabilities::abs::shouldUseMinBasebandTransportIOReadCount(capabilities::abs *this)
{
  return MEMORY[0x1F417D450](this);
}

uint64_t capabilities::abs::supportsWirelessTelemetryUsingMultiClientModel(capabilities::abs *this)
{
  return MEMORY[0x1F417D458](this);
}

uint64_t capabilities::abs::operator&()
{
  return MEMORY[0x1F417D460]();
}

uint64_t capabilities::ipc::supportsPCI(capabilities::ipc *this)
{
  return MEMORY[0x1F417D488](this);
}

uint64_t capabilities::ipc::defaultLogLevel(capabilities::ipc *this)
{
  return MEMORY[0x1F417D490](this);
}

uint64_t capabilities::ipc::supportsIPMetadataTrailer(capabilities::ipc *this)
{
  return MEMORY[0x1F417D4A8](this);
}

uint64_t capabilities::ipc::defaultMHIConfigPayloadSizeBytes(capabilities::ipc *this)
{
  return MEMORY[0x1F417D4B0](this);
}

uint64_t capabilities::ipc::defaultPCIBinaryTraceHistorySizeMB(capabilities::ipc *this)
{
  return MEMORY[0x1F417D4B8](this);
}

uint64_t capabilities::pci::controlChannelCount(capabilities::pci *this)
{
  return MEMORY[0x1F417D4C0](this);
}

uint64_t capabilities::radio::supportsMESA(capabilities::radio *this)
{
  return MEMORY[0x1F417D540](this);
}

uint64_t capabilities::radio::supportsUMTS(capabilities::radio *this)
{
  return MEMORY[0x1F417D548](this);
}

uint64_t capabilities::radio::supportsDeviceMaterial(capabilities::radio *this)
{
  return MEMORY[0x1F417D568](this);
}

uint64_t capabilities::radio::supportsMultiClientAWD(capabilities::radio *this)
{
  return MEMORY[0x1F417D578](this);
}

uint64_t capabilities::radio::personalizedFirmwarePath(capabilities::radio *this)
{
  return MEMORY[0x1F417D588](this);
}

uint64_t capabilities::radio::supportsAccessoryDetection(capabilities::radio *this)
{
  return MEMORY[0x1F417D590](this);
}

uint64_t capabilities::radio::supportsAutomaticRadarFiling(capabilities::radio *this)
{
  return MEMORY[0x1F417D5A0](this);
}

uint64_t capabilities::radio::supportsFactoryCalibrationV2(capabilities::radio *this)
{
  return MEMORY[0x1F417D5A8](this);
}

uint64_t capabilities::radio::supportsBasebandStateController(capabilities::radio *this)
{
  return MEMORY[0x1F417D5B0](this);
}

uint64_t capabilities::radio::supportsAccessoryDetectionForARTD(capabilities::radio *this)
{
  return MEMORY[0x1F417D5B8](this);
}

uint64_t capabilities::radio::supportsAccessoryTypeDetectionForRF(capabilities::radio *this)
{
  return MEMORY[0x1F417D5C0](this);
}

uint64_t capabilities::radio::supportsAccessoryTypeDetectionForARTD(capabilities::radio *this)
{
  return MEMORY[0x1F417D5C8](this);
}

uint64_t capabilities::radio::ice(capabilities::radio *this)
{
  return MEMORY[0x1F417D5D0](this);
}

uint64_t capabilities::radio::vendor(capabilities::radio *this)
{
  return MEMORY[0x1F417D5D8](this);
}

uint64_t capabilities::radio::product(capabilities::radio *this)
{
  return MEMORY[0x1F417D5E0](this);
}

uint64_t capabilities::radio::maverick(capabilities::radio *this)
{
  return MEMORY[0x1F417D5E8](this);
}

uint64_t capabilities::radio::C2KDevice(capabilities::radio *this)
{
  return MEMORY[0x1F417D5F0](this);
}

uint64_t capabilities::radio::mav20Plus(capabilities::radio *this)
{
  return MEMORY[0x1F417D5F8](this);
}

uint64_t capabilities::radio::radioType(capabilities::radio *this)
{
  return MEMORY[0x1F417D608](this);
}

uint64_t capabilities::trace::enabledByDefault(capabilities::trace *this)
{
  return MEMORY[0x1F417D610](this);
}

uint64_t capabilities::trace::getCompressionMode(capabilities::trace *this)
{
  return MEMORY[0x1F417D618](this);
}

uint64_t capabilities::trace::defaultFileSizeBytes(capabilities::trace *this)
{
  return MEMORY[0x1F417D620](this);
}

uint64_t capabilities::trace::defaultHistorySizeMB(capabilities::trace *this)
{
  return MEMORY[0x1F417D628](this);
}

uint64_t capabilities::trace::defaultMemoryFileMaxCount(capabilities::trace *this)
{
  return MEMORY[0x1F417D650](this);
}

uint64_t capabilities::trace::supportsDumpLogIndication(capabilities::trace *this)
{
  return MEMORY[0x1F417D658](this);
}

uint64_t capabilities::trace::supportsHighTPutByDefault(capabilities::trace *this)
{
  return MEMORY[0x1F417D660](this);
}

uint64_t capabilities::trace::supportsDataLoggingByDefault(capabilities::trace *this)
{
  return MEMORY[0x1F417D668](this);
}

uint64_t capabilities::trace::supportsDuplicateSignatureDetection(capabilities::trace *this)
{
  return MEMORY[0x1F417D678](this);
}

uint64_t capabilities::trace::allowed(capabilities::trace *this)
{
  return MEMORY[0x1F417D688](this);
}

uint64_t capabilities::txpower::supportsPPM(capabilities::txpower *this)
{
  return MEMORY[0x1F417D698](this);
}

uint64_t capabilities::txpower::timeoutConfig(capabilities::txpower *this)
{
  return MEMORY[0x1F417D6A0](this);
}

uint64_t capabilities::txpower::supportsMotion(capabilities::txpower *this)
{
  return MEMORY[0x1F417D6A8](this);
}

uint64_t capabilities::txpower::supportedFaceID(capabilities::txpower *this)
{
  return MEMORY[0x1F417D6B0](this);
}

uint64_t capabilities::txpower::supportsKeyboard(capabilities::txpower *this)
{
  return MEMORY[0x1F417D6B8](this);
}

uint64_t capabilities::txpower::supportsFrontCamera(capabilities::txpower *this)
{
  return MEMORY[0x1F417D6C0](this);
}

uint64_t capabilities::txpower::supportsAudioSpeaker(capabilities::txpower *this)
{
  return MEMORY[0x1F417D6C8](this);
}

uint64_t capabilities::txpower::supportsMotionAlways(capabilities::txpower *this)
{
  return MEMORY[0x1F417D6D0](this);
}

uint64_t capabilities::txpower::supportedControlInput(capabilities::txpower *this)
{
  return MEMORY[0x1F417D6D8](this);
}

uint64_t capabilities::txpower::supportsAudioJackReport(capabilities::txpower *this)
{
  return MEMORY[0x1F417D6E0](this);
}

uint64_t capabilities::txpower::supportsPowerChargerDesense(capabilities::txpower *this)
{
  return MEMORY[0x1F417D6E8](this);
}

uint64_t capabilities::txpower::supportsPowerSourceDetection(capabilities::txpower *this)
{
  return MEMORY[0x1F417D6F0](this);
}

uint64_t capabilities::txpower::supportsVideoAntennaSwitching(capabilities::txpower *this)
{
  return MEMORY[0x1F417D6F8](this);
}

uint64_t capabilities::txpower::supportsAntennaFreeSpaceConfig(capabilities::txpower *this)
{
  return MEMORY[0x1F417D700](this);
}

uint64_t capabilities::txpower::operator&()
{
  return MEMORY[0x1F417D708]();
}

uint64_t capabilities::coredump::supportsSPMISignalling(capabilities::coredump *this)
{
  return MEMORY[0x1F417D728](this);
}

uint64_t capabilities::coredump::recoveryForControlMessageTimeout(capabilities::coredump *this)
{
  return MEMORY[0x1F417D730](this);
}

uint64_t capabilities::coredump::operator&()
{
  return MEMORY[0x1F417D738]();
}

uint64_t AppleSARHelper::callUserClientMethod(AppleSARHelper *this, uint64_t a2, const unint64_t *a3, uint64_t a4, const void *a5, uint64_t a6, unint64_t *a7, unsigned int *a8, void *a9, unint64_t a10)
{
  return MEMORY[0x1F410AAB8](this, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t AppleSARHelper::create_default_global(AppleSARHelper *this)
{
  return MEMORY[0x1F410AAC0](this);
}

uint64_t AppleSARHelper::registerSARServiceCallback()
{
  return MEMORY[0x1F410AAC8]();
}

uint64_t AppleBasebandManager::setEventHandler()
{
  return MEMORY[0x1F4109990]();
}

uint64_t AppleBasebandManager::create()
{
  return MEMORY[0x1F4109998]();
}

uint64_t AppleBasebandManager::perform()
{
  return MEMORY[0x1F41099A0]();
}

uint64_t AppleBasebandManager::eventsOn(AppleBasebandManager *this)
{
  return MEMORY[0x1F41099A8](this);
}

uint64_t CommandDriverFactory::setRegistry()
{
  return MEMORY[0x1F4179FF0]();
}

uint64_t CommandDriverFactory::create_default_global(CommandDriverFactory *this)
{
  return MEMORY[0x1F4179FF8](this);
}

void wireless_diagnostics::google::protobuf::MessageLite::~MessageLite(wireless_diagnostics::google::protobuf::MessageLite *this)
{
}

uint64_t wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadTagFallback(wireless_diagnostics::google::protobuf::io::CodedInputStream *this)
{
  return MEMORY[0x1F4181C68](this);
}

uint64_t wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(wireless_diagnostics::google::protobuf::io::CodedInputStream *this, unsigned int *a2)
{
  return MEMORY[0x1F4181C70](this, a2);
}

uint64_t wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint64Fallback(wireless_diagnostics::google::protobuf::io::CodedInputStream *this, unint64_t *a2)
{
  return MEMORY[0x1F4181C78](this, a2);
}

uint64_t wireless_diagnostics::google::protobuf::io::CodedInputStream::PopLimit(wireless_diagnostics::google::protobuf::io::CodedInputStream *this)
{
  return MEMORY[0x1F4181CA0](this);
}

uint64_t wireless_diagnostics::google::protobuf::io::CodedInputStream::PushLimit(wireless_diagnostics::google::protobuf::io::CodedInputStream *this)
{
  return MEMORY[0x1F4181CA8](this);
}

uint64_t wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize64(wireless_diagnostics::google::protobuf::io::CodedOutputStream *this)
{
  return MEMORY[0x1F4181CC8](this);
}

uint64_t wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize32Fallback(wireless_diagnostics::google::protobuf::io::CodedOutputStream *this)
{
  return MEMORY[0x1F4181CE8](this);
}

uint64_t wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage()
{
  return MEMORY[0x1F4181D10]();
}

void wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage(wireless_diagnostics::google::protobuf::internal::LogMessage *this)
{
}

uint64_t wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<()
{
  return MEMORY[0x1F4181D20]();
}

uint64_t wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=()
{
  return MEMORY[0x1F4181D30]();
}

uint64_t wireless_diagnostics::google::protobuf::internal::VerifyVersion(wireless_diagnostics::google::protobuf::internal *this, uint64_t a2, uint64_t a3, const char *a4)
{
  return MEMORY[0x1F4181D68](this, a2, a3, a4);
}

uint64_t wireless_diagnostics::google::protobuf::internal::WireFormatLite::ReadString()
{
  return MEMORY[0x1F4181D70]();
}

uint64_t wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteString()
{
  return MEMORY[0x1F4181DA8]();
}

uint64_t wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteUInt32(wireless_diagnostics::google::protobuf::internal::WireFormatLite *this, uint64_t a2, uint64_t a3, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a4)
{
  return MEMORY[0x1F4181DB0](this, a2, a3, a4);
}

uint64_t wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteUInt64(wireless_diagnostics::google::protobuf::internal::WireFormatLite *this, uint64_t a2, uint64_t a3, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a4)
{
  return MEMORY[0x1F4181DB8](this, a2, a3, a4);
}

uint64_t wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteMessage(wireless_diagnostics::google::protobuf::internal::WireFormatLite *this, uint64_t a2, const wireless_diagnostics::google::protobuf::MessageLite *a3, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a4)
{
  return MEMORY[0x1F4181DD0](this, a2, a3, a4);
}

uint64_t wireless_diagnostics::google::protobuf::internal::WireFormatLite::SkipField(wireless_diagnostics::google::protobuf::internal::WireFormatLite *this, wireless_diagnostics::google::protobuf::io::CodedInputStream *a2)
{
  return MEMORY[0x1F4181DE8](this, a2);
}

uint64_t wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteBool(wireless_diagnostics::google::protobuf::internal::WireFormatLite *this, uint64_t a2, uint64_t a3, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a4)
{
  return MEMORY[0x1F4181DF0](this, a2, a3, a4);
}

uint64_t wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::Swap()
{
  return MEMORY[0x1F4181E08]();
}

uint64_t wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::Reserve(wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase *this)
{
  return MEMORY[0x1F4181E10](this);
}

uint64_t ApplePDPHelperInterface::getInstance(ApplePDPHelperInterface *this)
{
  return MEMORY[0x1F410AA60](this);
}

uint64_t ApplePDPHelperInterface::enableMetadataTrailer(ApplePDPHelperInterface *this, uint64_t a2, BOOL *a3)
{
  return MEMORY[0x1F410AA68](this, a2, a3);
}

uint64_t ApplePDPHelperInterface::enableLowPowerPDPThrottle(ApplePDPHelperInterface *this)
{
  return MEMORY[0x1F410AA70](this);
}

uint64_t ApplePDPHelperInterface::activateLowPowerPDPThrottle(ApplePDPHelperInterface *this)
{
  return MEMORY[0x1F410AA78](this);
}

uint64_t ApplePDPHelperInterface::getNumLowPowerPDPThrottleStats()
{
  return MEMORY[0x1F410AA80]();
}

uint64_t Ari::MsgDefById(Ari *this)
{
  return MEMORY[0x1F4178210](this);
}

uint64_t Ari::LogConfigRt()
{
  return MEMORY[0x1F4178598]();
}

uint64_t Ari::MsgNameById(Ari *this)
{
  return MEMORY[0x1F4178218](this);
}

uint64_t Ari::GetLogLevels(Ari *this)
{
  return MEMORY[0x1F4178220](this);
}

uint64_t Ari::LogConfig(Ari *this, uint64_t a2, void (*a3)(unsigned int, const char *))
{
  return MEMORY[0x1F4178230](this, a2, a3);
}

uint64_t abm::HelperClient::registerForHelperReady()
{
  return MEMORY[0x1F4104E68]();
}

uint64_t abm::HelperClient::create()
{
  return MEMORY[0x1F4104E70]();
}

uint64_t abm::HelperClient::perform()
{
  return MEMORY[0x1F4104E78]();
}

{
  return MEMORY[0x1F4104E80]();
}

uint64_t abm::AccessoryInfo::create()
{
  return MEMORY[0x1F41099B0]();
}

uint64_t abm::AccessorySimulate::create()
{
  return MEMORY[0x1F41099B8]();
}

uint64_t abm::AccessorySimulate::create(abm::AccessorySimulate *this)
{
  return MEMORY[0x1F41099C0](this);
}

uint64_t abm::AccessorySimulate::toDict(abm::AccessorySimulate *this)
{
  return MEMORY[0x1F41099C8](this);
}

uint64_t abm::trace::isSupported()
{
  return MEMORY[0x1F410C7B0]();
}

uint64_t abm::client::Command::create()
{
  return MEMORY[0x1F4109A20]();
}

uint64_t abm::helper::asEnum(abm::helper *this, const char *a2)
{
  return MEMORY[0x1F4104E88](this, a2);
}

uint64_t abm::helper::asString()
{
  return MEMORY[0x1F4104E90]();
}

{
  return MEMORY[0x1F4104E98]();
}

{
  return MEMORY[0x1F4104EA0]();
}

{
  return MEMORY[0x1F4104EA8]();
}

uint64_t abm::asString()
{
  return MEMORY[0x1F4109A38]();
}

{
  return MEMORY[0x1F4109A40]();
}

{
  return MEMORY[0x1F4109A48]();
}

{
  return MEMORY[0x1F4109A50]();
}

{
  return MEMORY[0x1F4109A58]();
}

{
  return MEMORY[0x1F4109A60]();
}

{
  return MEMORY[0x1F4109A68]();
}

{
  return MEMORY[0x1F4109A70]();
}

{
  return MEMORY[0x1F4109A78]();
}

{
  return MEMORY[0x1F4109A80]();
}

uint64_t awd::AppContext::setHandler()
{
  return MEMORY[0x1F417A008]();
}

{
  return MEMORY[0x1F417A010]();
}

{
  return MEMORY[0x1F417A018]();
}

uint64_t awd::AppContext::setProperties()
{
  return MEMORY[0x1F417A020]();
}

uint64_t awd::AwdCommandDriver::checkIn()
{
  return MEMORY[0x1F417A028]();
}

uint64_t awd::asString()
{
  return MEMORY[0x1F417A040]();
}

{
  return MEMORY[0x1F417A050]();
}

uint64_t ctu::LogMessage::LogMessage()
{
  return MEMORY[0x1F417D950]();
}

uint64_t ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::~LoggerBase()
{
  return MEMORY[0x1F417D958]();
}

uint64_t ctu::OsLogLogger::OsLogLogger(ctu::OsLogLogger *this, const char *a2, const char *a3)
{
  return MEMORY[0x1F417D968](this, a2, a3);
}

uint64_t ctu::OsLogLogger::OsLogLogger()
{
  return MEMORY[0x1F417D970]();
}

uint64_t ctu::OsLogLogger::OsLogLogger(ctu::OsLogLogger *this, const ctu::OsLogLogger *a2)
{
  return MEMORY[0x1F417D978](this, a2);
}

void ctu::OsLogLogger::~OsLogLogger(ctu::OsLogLogger *this)
{
}

uint64_t ctu::OsLogContext::OsLogContext()
{
  return MEMORY[0x1F417D988]();
}

uint64_t ctu::OsLogContext::OsLogContext(ctu::OsLogContext *this, const char *a2, const char *a3)
{
  return MEMORY[0x1F417D990](this, a2, a3);
}

uint64_t ctu::OsLogContext::OsLogContext(ctu::OsLogContext *this, const ctu::OsLogContext *a2)
{
  return MEMORY[0x1F417D998](this, a2);
}

void ctu::OsLogContext::~OsLogContext(ctu::OsLogContext *this)
{
}

uint64_t ctu::OsLogContext::operator=()
{
  return MEMORY[0x1F417D9A8]();
}

uint64_t ctu::StaticLogger::StaticLogger()
{
  return MEMORY[0x1F417D9B0]();
}

uint64_t ctu::StaticLogger::StaticLogger(ctu::StaticLogger *this)
{
  return MEMORY[0x1F417D9B8](this);
}

void ctu::StaticLogger::~StaticLogger(ctu::StaticLogger *this)
{
}

uint64_t ctu::TrackedLogger::registerLoggerToServer()
{
  return MEMORY[0x1F417D9C8]();
}

uint64_t ctu::split_any_copy()
{
  return MEMORY[0x1F417D9D8]();
}

uint64_t ctu::LogMessageBuffer::takeString(ctu::LogMessageBuffer *this)
{
  return MEMORY[0x1F417DA10](this);
}

uint64_t ctu::LogMessageBuffer::takeMetadata(ctu::LogMessageBuffer *this)
{
  return MEMORY[0x1F417DA18](this);
}

uint64_t ctu::LogMessageBuffer::vprintf(ctu::LogMessageBuffer *this, const char *a2, char *a3)
{
  return MEMORY[0x1F417DA28](this, a2, a3);
}

uint64_t ctu::LogMessageBuffer::LogMessageBuffer(ctu::LogMessageBuffer *this)
{
  return MEMORY[0x1F417DA30](this);
}

void ctu::LogMessageBuffer::~LogMessageBuffer(ctu::LogMessageBuffer *this)
{
}

uint64_t ctu::LoggerCommonBase::setLogLevel()
{
  return MEMORY[0x1F417DA48]();
}

uint64_t ctu::LoggerCommonBase::LoggerCommonBase()
{
  return MEMORY[0x1F417DA58]();
}

{
  return MEMORY[0x1F417DA60]();
}

uint64_t ctu::LoggerCommonBase::operator=()
{
  return MEMORY[0x1F417DA68]();
}

uint64_t ctu::XpcJetsamAssertion::createActivity()
{
  return MEMORY[0x1F417DA78]();
}

uint64_t ctu::XpcJetsamAssertion::create_default_global(ctu::XpcJetsamAssertion *this)
{
  return MEMORY[0x1F417DA80](this);
}

uint64_t ctu::DispatchTimerService::create()
{
  return MEMORY[0x1F417DA88]();
}

uint64_t ctu::cf::MakeCFString::MakeCFString(ctu::cf::MakeCFString *this, const char *a2)
{
  return MEMORY[0x1F417DA90](this, a2);
}

void ctu::cf::MakeCFString::~MakeCFString(ctu::cf::MakeCFString *this)
{
}

uint64_t ctu::cf::convert_copy(ctu::cf *this, const __CFString **a2, const char *a3, uint64_t a4, const __CFAllocator *a5)
{
  return MEMORY[0x1F417DAA0](this, a2, a3, a4, a5);
}

uint64_t ctu::cf::convert_copy()
{
  return MEMORY[0x1F417DAA8]();
}

uint64_t ctu::cf::dict_adapter::dict_adapter(ctu::cf::dict_adapter *this, const __CFDictionary *a2)
{
  return MEMORY[0x1F417DAB8](this, a2);
}

uint64_t ctu::cf::dict_adapter::dict_adapter(ctu::cf::dict_adapter *this, const ctu::cf::dict_adapter *a2)
{
  return MEMORY[0x1F417DAC0](this, a2);
}

void ctu::cf::dict_adapter::~dict_adapter(ctu::cf::dict_adapter *this)
{
}

uint64_t ctu::cf::plist_adapter::plist_adapter(ctu::cf::plist_adapter *this, const __CFString *a2, const __CFString *a3)
{
  return MEMORY[0x1F417DAD0](this, a2, a3);
}

void ctu::cf::plist_adapter::~plist_adapter(ctu::cf::plist_adapter *this)
{
}

uint64_t ctu::cf::show(ctu::cf *this, const void *a2)
{
  return MEMORY[0x1F417DAE0](this, a2);
}

uint64_t ctu::cf::assign()
{
  return MEMORY[0x1F417DAE8]();
}

{
  return MEMORY[0x1F417DAF0]();
}

{
  return MEMORY[0x1F417DAF8]();
}

uint64_t ctu::cf::assign(ctu::cf *this, signed __int8 *a2, const __CFNumber *a3)
{
  return MEMORY[0x1F417DB08](this, a2, a3);
}

uint64_t ctu::cf::assign(ctu::cf *this, BOOL *a2, const __CFBoolean *a3)
{
  return MEMORY[0x1F417DB10](this, a2, a3);
}

uint64_t ctu::cf::assign(ctu::cf *this, int *a2, const __CFNumber *a3)
{
  return MEMORY[0x1F417DB28](this, a2, a3);
}

uint64_t ctu::cf::assign(ctu::cf *this, unsigned int *a2, const __CFNumber *a3)
{
  return MEMORY[0x1F417DB30](this, a2, a3);
}

uint64_t ctu::cf::assign(ctu::cf *this, uint64_t *a2, const __CFNumber *a3)
{
  return MEMORY[0x1F417DB38](this, a2, a3);
}

{
  return MEMORY[0x1F417DB50](this, a2, a3);
}

uint64_t ctu::cf::assign(ctu::cf *this, unsigned __int16 *a2, const __CFNumber *a3)
{
  return MEMORY[0x1F417DB48](this, a2, a3);
}

uint64_t ctu::fs::remove_dir()
{
  return MEMORY[0x1F417DB58]();
}

uint64_t ctu::fs::file_exists()
{
  return MEMORY[0x1F417DB60]();
}

uint64_t ctu::fs::is_directory()
{
  return MEMORY[0x1F417DB70]();
}

uint64_t ctu::fs::get_file_size()
{
  return MEMORY[0x1F417DB78]();
}

uint64_t ctu::fs::create_directory()
{
  return MEMORY[0x1F417DB80]();
}

uint64_t ctu::fs::get_filtered_files()
{
  return MEMORY[0x1F417DB88]();
}

uint64_t ctu::fs::get_unique_filename()
{
  return MEMORY[0x1F417DB90]();
}

uint64_t ctu::fs::rename()
{
  return MEMORY[0x1F417DBA8]();
}

uint64_t ctu::Clock::now_in_nanoseconds(ctu::Clock *this)
{
  return MEMORY[0x1F417DBD8](this);
}

uint64_t ctu::iokit::Controller::setMesaQuality()
{
  return MEMORY[0x1F417D780]();
}

uint64_t ctu::iokit::Controller::setMesaCallback()
{
  return MEMORY[0x1F417D788]();
}

uint64_t ctu::iokit::Controller::queryPowerSource(ctu::iokit::Controller *this)
{
  return MEMORY[0x1F417D790](this);
}

uint64_t ctu::iokit::Controller::setFaceIDCallback()
{
  return MEMORY[0x1F417D798]();
}

uint64_t ctu::iokit::Controller::acquireMesaService(ctu::iokit::Controller *this)
{
  return MEMORY[0x1F417D7A0](this);
}

uint64_t ctu::iokit::Controller::setDisplayCallback()
{
  return MEMORY[0x1F417D7A8]();
}

uint64_t ctu::iokit::Controller::setupCameraService(ctu::iokit::Controller *this)
{
  return MEMORY[0x1F417D7B0](this);
}

uint64_t ctu::iokit::Controller::setAccessoryCallback()
{
  return MEMORY[0x1F417D7B8]();
}

uint64_t ctu::iokit::Controller::setFrontCameraCallback()
{
  return MEMORY[0x1F417D7C0]();
}

uint64_t ctu::iokit::Controller::setPowerSourceCallback()
{
  return MEMORY[0x1F417D7C8]();
}

uint64_t ctu::iokit::Controller::registerForBatteryInfoChange()
{
  return MEMORY[0x1F417D7D0]();
}

uint64_t ctu::iokit::Controller::stopBatteryInfoNotifications(ctu::iokit::Controller *this)
{
  return MEMORY[0x1F417D7D8](this);
}

uint64_t ctu::iokit::Controller::stopPowerSourceNotifications(ctu::iokit::Controller *this)
{
  return MEMORY[0x1F417D7E0](this);
}

uint64_t ctu::iokit::Controller::getAccessoryPrimaryPortNumber(ctu::iokit::Controller *this)
{
  return MEMORY[0x1F417D7E8](this);
}

uint64_t ctu::iokit::Controller::stopDisplayCoverStateNotifications(ctu::iokit::Controller *this)
{
  return MEMORY[0x1F417D7F0](this);
}

uint64_t ctu::iokit::Controller::registerForDisplayCoverStateChanged()
{
  return MEMORY[0x1F417D7F8]();
}

uint64_t ctu::iokit::Controller::create()
{
  return MEMORY[0x1F417D800]();
}

uint64_t ctu::iokit::IOHIDController::isProxCovered(ctu::iokit::IOHIDController *this)
{
  return MEMORY[0x1F417D808](this);
}

uint64_t ctu::iokit::IOHIDController::queryHIDEventTrigger(ctu::iokit::IOHIDController *this)
{
  return MEMORY[0x1F417D810](this);
}

uint64_t ctu::iokit::IOHIDController::registerProxCallback()
{
  return MEMORY[0x1F417D818]();
}

uint64_t ctu::iokit::IOHIDController::registerKeyboardCallback()
{
  return MEMORY[0x1F417D820]();
}

uint64_t ctu::iokit::IOHIDController::stop(ctu::iokit::IOHIDController *this)
{
  return MEMORY[0x1F417D828](this);
}

uint64_t ctu::iokit::IOHIDController::start(ctu::iokit::IOHIDController *this)
{
  return MEMORY[0x1F417D830](this);
}

uint64_t ctu::iokit::IOHIDController::create()
{
  return MEMORY[0x1F417D838]();
}

uint64_t ctu::iokit::IOPortUSBCController::registerCallback()
{
  return MEMORY[0x1F417D840]();
}

uint64_t ctu::iokit::IOPortUSBCController::create(ctu::iokit::IOPortUSBCController *this, queue a2, const char *a3, const char *a4)
{
  return MEMORY[0x1F417D848](this, a2.fObj.fObj, a3, a4);
}

uint64_t ctu::iokit::IOPortUSBCController::asString()
{
  return MEMORY[0x1F417D850]();
}

uint64_t ctu::iokit::asString()
{
  return MEMORY[0x1F417D858]();
}

{
  return MEMORY[0x1F417D860]();
}

{
  return MEMORY[0x1F417D868]();
}

{
  return MEMORY[0x1F417D870]();
}

uint64_t ctu::iokit::operator&()
{
  return MEMORY[0x1F417D878]();
}

uint64_t ctu::power::manager::registerListener()
{
  return MEMORY[0x1F417D880]();
}

uint64_t ctu::power::manager::get(ctu::power::manager *this)
{
  return MEMORY[0x1F417D888](this);
}

uint64_t ctu::power::manager::asCString(ctu::power::manager *this)
{
  return MEMORY[0x1F417D890](this);
}

uint64_t ctu::power::assertion::createInternal()
{
  return MEMORY[0x1F417D898]();
}

uint64_t ctu::power::assertion::assertion(ctu::power::assertion *this)
{
  return MEMORY[0x1F417D8A0](this);
}

uint64_t ctu::asChar()
{
  return MEMORY[0x1F417DBE0]();
}

uint64_t ctu::assign()
{
  return MEMORY[0x1F417DBE8]();
}

uint64_t ctu::Gestalt::create_default_global(ctu::Gestalt *this)
{
  return MEMORY[0x1F417DBF0](this);
}

uint64_t ctu::tokenize()
{
  return MEMORY[0x1F417DBF8]();
}

uint64_t ctu::LogServer::setEnabled(ctu::LogServer *this)
{
  return MEMORY[0x1F417DC00](this);
}

uint64_t ctu::LogServer::updateConfig()
{
  return MEMORY[0x1F417DC08]();
}

uint64_t ctu::LogServer::log()
{
  return MEMORY[0x1F417DC10]();
}

uint64_t ctu::LogServer::start(ctu::LogServer *this)
{
  return MEMORY[0x1F417DC18](this);
}

uint64_t ctu::LogServer::create()
{
  return MEMORY[0x1F417DC20]();
}

uint64_t ctu::LogServer::addWriter()
{
  return MEMORY[0x1F417DC28]();
}

uint64_t ctu::XpcClient::setServer_sync()
{
  return MEMORY[0x1F417DC30]();
}

uint64_t ctu::XpcClient::XpcClient()
{
  return MEMORY[0x1F417DC38]();
}

void ctu::XpcClient::~XpcClient(ctu::XpcClient *this)
{
}

uint64_t ctu::XpcServer::setListener_sync()
{
  return MEMORY[0x1F417DC50]();
}

uint64_t ctu::XpcServer::startListener_sync(ctu::XpcServer *this)
{
  return MEMORY[0x1F417DC58](this);
}

uint64_t ctu::XpcServer::XpcServer()
{
  return MEMORY[0x1F417DC60]();
}

void ctu::XpcServer::~XpcServer(ctu::XpcServer *this)
{
}

uint64_t ctu::cf_to_xpc(ctu *this, const void *a2)
{
  return MEMORY[0x1F417DC70](this, a2);
}

uint64_t ctu::xpc_to_cf(ctu *this, void *a2)
{
  return MEMORY[0x1F417DC78](this, a2);
}

uint64_t ctu::operator<<()
{
  return MEMORY[0x1F417DC80]();
}

{
  return MEMORY[0x1F417DC88]();
}

{
  return MEMORY[0x1F417DC90]();
}

{
  return MEMORY[0x1F417DC98]();
}

uint64_t pci::event::Listener::create()
{
  return MEMORY[0x1F417CF28]();
}

uint64_t sar::toStringAccessory(sar *this)
{
  return MEMORY[0x1F410AAD0](this);
}

uint64_t sar::toString()
{
  return MEMORY[0x1F410AAD8]();
}

{
  return MEMORY[0x1F410AAE0]();
}

uint64_t wis::MetricFactory::getSharedMetricFactory(wis::MetricFactory *this)
{
  return MEMORY[0x1F4176C78](this);
}

uint64_t wis::MetricFactory::newMetricContainerWithIdentifier(wis::MetricFactory *this)
{
  return MEMORY[0x1F4176C80](this);
}

uint64_t wis::MetricContainer::storeMetric(wis::MetricContainer *this, uint64_t a2, uint64_t a3, const wireless_diagnostics::google::protobuf::MessageLite *a4)
{
  return MEMORY[0x1F4176C88](this, a2, a3, a4);
}

void wis::MetricContainer::~MetricContainer(wis::MetricContainer *this)
{
}

uint64_t wis::getWISTimestamp(wis *this)
{
  return MEMORY[0x1F4176C98](this);
}

uint64_t wis::WISServerConnection::SubmitMetric(wis::WISServerConnection *this, wis::MetricContainer *a2)
{
  return MEMORY[0x1F4176CA0](this, a2);
}

uint64_t wis::WISServerConnection::RegisterCallbackForTimer()
{
  return MEMORY[0x1F4176CA8]();
}

uint64_t wis::WISServerConnection::RegisterQueriableMetricCallbackForIdentifier()
{
  return MEMORY[0x1F4176CB0]();
}

uint64_t wis::WISServerConnection::WISServerConnection(wis::WISServerConnection *this)
{
  return MEMORY[0x1F4176CB8](this);
}

void wis::WISServerConnection::~WISServerConnection(wis::WISServerConnection *this)
{
}

uint64_t xpc::dyn_cast_or_default(xpc *this, const object *a2, const char *a3)
{
  return MEMORY[0x1F417DCA8](this, a2, a3);
}

uint64_t xpc::dyn_cast_or_default()
{
  return MEMORY[0x1F417DCB0]();
}

{
  return MEMORY[0x1F417DCB8]();
}

uint64_t xpc::dyn_cast_or_default(xpc *this, const object *a2)
{
  return MEMORY[0x1F417DCC0](this, a2);
}

{
  return MEMORY[0x1F417DCD0](this, a2);
}

{
  return MEMORY[0x1F417DCD8](this, a2);
}

{
  return MEMORY[0x1F417DCE0](this, a2);
}

{
  return MEMORY[0x1F417DCE8](this, a2);
}

{
  return MEMORY[0x1F417DCF0](this, a2);
}

uint64_t xpc::dyn_cast_or_default(xpc *this, const object *a2, double a3)
{
  return MEMORY[0x1F417DCC8](this, a2, a3);
}

uint64_t xpc::bridge(xpc *this, const object *a2)
{
  return MEMORY[0x1F417DCF8](this, a2);
}

uint64_t diag::config::asEnum()
{
  return MEMORY[0x1F4104EB0]();
}

uint64_t util::writeJSON()
{
  return MEMORY[0x1F410C7D8]();
}

uint64_t radio::asStringV2()
{
  return MEMORY[0x1F417A088]();
}

uint64_t radio::CommandDriver::watchClientState()
{
  return MEMORY[0x1F417A090]();
}

uint64_t radio::CommandDriver::watchOperatingMode()
{
  return MEMORY[0x1F417A098]();
}

uint64_t radio::RFCalibration_t::fill()
{
  return MEMORY[0x1F417A0B8]();
}

uint64_t radio::RFCalibration_t::toString(radio::RFCalibration_t *this)
{
  return MEMORY[0x1F417A0C0](this);
}

uint64_t radio::RFCalibration_t::RFCalibration_t(radio::RFCalibration_t *this)
{
  return MEMORY[0x1F417A0C8](this);
}

uint64_t radio::BasebandProperties::create()
{
  return MEMORY[0x1F417A0E0]();
}

uint64_t radio::HealthCommandDriver::LinkStats::LinkStats(radio::HealthCommandDriver::LinkStats *this)
{
  return MEMORY[0x1F417A0F8](this);
}

uint64_t radio::asString()
{
  return MEMORY[0x1F417A118]();
}

{
  return MEMORY[0x1F417A120]();
}

uint64_t trace::toString()
{
  return MEMORY[0x1F410C7E0]();
}

uint64_t AriMsg::GetBufGmid(AriMsg *this, const unsigned __int8 *a2)
{
  return MEMORY[0x1F4178238](this, a2);
}

uint64_t AriMsg::GetBufMsgSz(AriMsg *this, const unsigned __int8 *a2)
{
  return MEMORY[0x1F4178240](this, a2);
}

uint64_t AriMsg::GetBufCtx(AriMsg *this, const unsigned __int8 *a2)
{
  return MEMORY[0x1F4178248](this, a2);
}

uint64_t AriMsg::GetBufSeq(AriMsg *this, const unsigned __int8 *a2, uint64_t a3, unsigned int *a4)
{
  return MEMORY[0x1F4178250](this, a2, a3, a4);
}

uint64_t AriHost::StartStream()
{
  return MEMORY[0x1F4178540]();
}

uint64_t AriHost::RegisterClient(AriHost *this, const char *a2, int *a3, dispatch_queue_s *a4)
{
  return MEMORY[0x1F4178550](this, a2, a3, a4);
}

uint64_t AriHost::DeregisterClient(AriHost *this)
{
  return MEMORY[0x1F4178558](this);
}

uint64_t AriHost::ReRegisterClient()
{
  return MEMORY[0x1F4178560]();
}

uint64_t AriHost::SetRTEventHandler()
{
  return MEMORY[0x1F4178568]();
}

uint64_t AriHost::Send()
{
  return MEMORY[0x1F4178578]();
}

uint64_t AriHost::EndStream(AriHost *this)
{
  return MEMORY[0x1F4178580](this);
}

void Factory::Factory(Factory *this)
{
}

void Factory::~Factory(Factory *this)
{
}

uint64_t antenna::CommandDriver::registerHandler()
{
  return MEMORY[0x1F417A128]();
}

void antenna::AntennaCommandDriverDelegateInterface::~AntennaCommandDriverDelegateInterface(antenna::AntennaCommandDriverDelegateInterface *this)
{
}

void Registry::Registry(Registry *this)
{
}

uint64_t AriHostRt::CancelAllTransactions(AriHostRt *this)
{
  return MEMORY[0x1F41785A0](this);
}

uint64_t AriHostRt::RegisterEntitlementChecker()
{
  return MEMORY[0x1F41785A8]();
}

uint64_t AriHostRt::RegisterBasebandResetDelegate()
{
  return MEMORY[0x1F41785B0]();
}

uint64_t AriHostRt::Init()
{
  return MEMORY[0x1F41785B8]();
}

uint64_t AriHostRt::Init(AriHostRt *this, const char *a2)
{
  return MEMORY[0x1F41785C0](this, a2);
}

uint64_t AriHostRt::Shutdown(AriHostRt *this)
{
  return MEMORY[0x1F41785C8](this);
}

uint64_t AriHostRt::SetOPMode()
{
  return MEMORY[0x1F41785D8]();
}

uint64_t HSFilerRT::basebandReadyEventHandler(HSFilerRT *this)
{
  return MEMORY[0x1F417A628](this);
}

uint64_t HSFilerRT::basebandResetEventHandler(HSFilerRT *this)
{
  return MEMORY[0x1F417A630](this);
}

uint64_t HSFilerRT::registerBasebandResetDelegate()
{
  return MEMORY[0x1F417A638]();
}

uint64_t HSFilerRT::dumpState(HSFilerRT *this)
{
  return MEMORY[0x1F417A640](this);
}

uint64_t abm::client::Event::name(abm::client::Event *this)
{
  return MEMORY[0x1F4109A88](this);
}

uint64_t abm::client::Event::getData(abm::client::Event *this)
{
  return MEMORY[0x1F4109A90](this);
}

uint64_t awd::AppContext::getProperties(awd::AppContext *this)
{
  return MEMORY[0x1F417A158](this);
}

uint64_t awd::AppContext::getAppID(awd::AppContext *this)
{
  return MEMORY[0x1F417A160](this);
}

uint64_t ctu::LoggerCommonBase::getLogDomain(ctu::LoggerCommonBase *this)
{
  return MEMORY[0x1F417DD08](this);
}

uint64_t ctu::cf::map_adapter::copyCFDataRef(ctu::cf::map_adapter *this, const __CFString *a2)
{
  return MEMORY[0x1F417DD18](this, a2);
}

uint64_t ctu::cf::map_adapter::copyCFArrayRef(ctu::cf::map_adapter *this, const __CFString *a2)
{
  return MEMORY[0x1F417DD20](this, a2);
}

uint64_t ctu::cf::map_adapter::copyCFNumberRef(ctu::cf::map_adapter *this, const __CFString *a2)
{
  return MEMORY[0x1F417DD28](this, a2);
}

uint64_t ctu::cf::map_adapter::copyCFDictionaryRef(ctu::cf::map_adapter *this, const __CFString *a2)
{
  return MEMORY[0x1F417DD30](this, a2);
}

uint64_t ctu::cf::map_adapter::getInt(ctu::cf::map_adapter *this, const __CFString *a2)
{
  return MEMORY[0x1F417DD38](this, a2);
}

uint64_t ctu::cf::map_adapter::getBool(ctu::cf::map_adapter *this, const __CFString *a2)
{
  return MEMORY[0x1F417DD40](this, a2);
}

uint64_t ctu::cf::map_adapter::getDouble(ctu::cf::map_adapter *this, const __CFString *a2, double a3)
{
  return MEMORY[0x1F417DD48](this, a2, a3);
}

uint64_t ctu::cf::map_adapter::getString()
{
  return MEMORY[0x1F417DD50]();
}

uint64_t ctu::LogServer::getConfig(ctu::LogServer *this)
{
  return MEMORY[0x1F417DD68](this);
}

uint64_t ctu::XpcServer::getListener_sync(ctu::XpcServer *this)
{
  return MEMORY[0x1F417DD70](this);
}

uint64_t xpc::object::to_string(xpc::object *this)
{
  return MEMORY[0x1F417DD78](this);
}

uint64_t Registry::getRegistryModel(Registry *this)
{
  return MEMORY[0x1F417A258](this);
}

int std::string::compare(const std::string *this, const std::string::value_type *__s)
{
  return MEMORY[0x1F417E390](this, __s);
}

std::string *__cdecl std::locale::name(std::string *__return_ptr retstr, const std::locale *this)
{
  return (std::string *)MEMORY[0x1F417E400](retstr, this);
}

const std::locale::facet *__cdecl std::locale::use_facet(const std::locale *this, std::locale::id *a2)
{
  return (const std::locale::facet *)MEMORY[0x1F417E408](this, a2);
}

std::locale std::ios_base::getloc(const std::ios_base *this)
{
  return (std::locale)MEMORY[0x1F417E418](this);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x1F417E448](this, a2);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const std::logic_error *a2)
{
  return (std::logic_error *)MEMORY[0x1F417E458](this, a2);
}

void std::length_error::~length_error(std::length_error *this)
{
}

{
  MEMORY[0x1F417E488](this);
}

std::runtime_error *__cdecl std::runtime_error::runtime_error(std::runtime_error *this, const char *a2)
{
  return (std::runtime_error *)MEMORY[0x1F417E4B8](this, a2);
}

{
  return (std::runtime_error *)MEMORY[0x1F417E4D0](this, a2);
}

std::runtime_error *__cdecl std::runtime_error::runtime_error(std::runtime_error *this, const std::runtime_error *a2)
{
  return (std::runtime_error *)MEMORY[0x1F417E4E0](this, a2);
}

void std::runtime_error::~runtime_error(std::runtime_error *this)
{
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x1F417E530](this);
}

std::regex_error *__cdecl std::regex_error::regex_error(std::regex_error *this, std::regex_constants::error_type __ecode)
{
  return (std::regex_error *)MEMORY[0x1F417E550](this, *(void *)&__ecode);
}

size_t std::__next_prime(size_t __n)
{
  return MEMORY[0x1F417E588](__n);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x1F417E5C0](this, __s, __n);
}

std::string *__cdecl std::string::append(std::string *this, std::string::size_type __n, std::string::value_type __c)
{
  return (std::string *)MEMORY[0x1F417E5D0](this, __n, __c);
}

std::string *__cdecl std::string::insert(std::string *this, std::string::size_type __pos, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x1F417E608](this, __pos, __s, __n);
}

void std::string::push_back(std::string *this, std::string::value_type __c)
{
}

std::string *__cdecl std::string::operator=(std::string *this, const std::string *__str)
{
  return (std::string *)MEMORY[0x1F417E670](this, __str);
}

uint64_t std::filebuf::open()
{
  return MEMORY[0x1F417E728]();
}

uint64_t std::filebuf::close()
{
  return MEMORY[0x1F417E730]();
}

uint64_t std::filebuf::basic_filebuf()
{
  return MEMORY[0x1F417E740]();
}

uint64_t std::filebuf::~filebuf()
{
  return MEMORY[0x1F417E748]();
}

uint64_t std::istream::peek()
{
  return MEMORY[0x1F417E760]();
}

uint64_t std::istream::read()
{
  return MEMORY[0x1F417E768]();
}

uint64_t std::istream::seekg()
{
  return MEMORY[0x1F417E780]();
}

uint64_t std::istream::tellg()
{
  return MEMORY[0x1F417E788]();
}

uint64_t std::istream::sentry::sentry()
{
  return MEMORY[0x1F417E7A0]();
}

uint64_t std::istream::~istream()
{
  return MEMORY[0x1F417E7C0]();
}

uint64_t std::ostream::put()
{
  return MEMORY[0x1F417E830]();
}

uint64_t std::ostream::flush()
{
  return MEMORY[0x1F417E838]();
}

uint64_t std::ostream::write()
{
  return MEMORY[0x1F417E840]();
}

uint64_t std::ostream::sentry::sentry()
{
  return MEMORY[0x1F417E848]();
}

uint64_t std::ostream::sentry::~sentry()
{
  return MEMORY[0x1F417E850]();
}

uint64_t std::ostream::~ostream()
{
  return MEMORY[0x1F417E860]();
}

uint64_t std::ostream::operator<<()
{
  return MEMORY[0x1F417E878]();
}

{
  return MEMORY[0x1F417E880]();
}

{
  return MEMORY[0x1F417E898]();
}

{
  return MEMORY[0x1F417E8A0]();
}

{
  return MEMORY[0x1F417E8A8]();
}

{
  return MEMORY[0x1F417E8B0]();
}

{
  return MEMORY[0x1F417E8C8]();
}

{
  return MEMORY[0x1F417E8D0]();
}

uint64_t std::iostream::~basic_iostream()
{
  return MEMORY[0x1F417E940]();
}

std::regex_traits<char>::char_class_type std::__get_classname(const char *__s, BOOL __icase)
{
  return MEMORY[0x1F417E960](__s, __icase);
}

uint64_t std::streambuf::basic_streambuf()
{
  return MEMORY[0x1F417E978]();
}

uint64_t std::streambuf::~streambuf()
{
  return MEMORY[0x1F417E980]();
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
}

std::__shared_weak_count *__cdecl std::__shared_weak_count::lock(std::__shared_weak_count *this)
{
  return (std::__shared_weak_count *)MEMORY[0x1F417EA90](this);
}

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
{
}

std::string *__cdecl std::__get_collation_name(std::string *__return_ptr retstr, const char *__s)
{
  return (std::string *)MEMORY[0x1F417EAA8](retstr, __s);
}

uint64_t std::stol(const std::string *__str, size_t *__idx, int __base)
{
  return MEMORY[0x1F417EBE8](__str, __idx, *(void *)&__base);
}

void std::mutex::lock(std::mutex *this)
{
}

void std::mutex::unlock(std::mutex *this)
{
}

void std::mutex::~mutex(std::mutex *this)
{
}

unint64_t std::stoul(const std::string *__str, size_t *__idx, int __base)
{
  return MEMORY[0x1F417EC20](__str, __idx, *(void *)&__base);
}

std::locale *__cdecl std::locale::locale(std::locale *this, const std::locale *a2)
{
  return (std::locale *)MEMORY[0x1F417ECE0](this, a2);
}

std::locale *__cdecl std::locale::locale(std::locale *this)
{
  return (std::locale *)MEMORY[0x1F417ECE8](this);
}

void std::locale::~locale(std::locale *this)
{
}

void std::ios_base::__set_badbit_and_consider_rethrow(std::ios_base *this)
{
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

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, unsigned int __val)
{
  return (std::string *)MEMORY[0x1F417EE78](retstr, *(void *)&__val);
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, unint64_t __val)
{
  return (std::string *)MEMORY[0x1F417EE88](retstr, __val);
}

void std::exception::~exception(std::exception *this)
{
}

void std::terminate(void)
{
}

void operator delete[](void *__p)
{
  while (1)
    ;
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void *__cdecl operator new[](size_t __sz)
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x1F417EF30](thrown_size);
}

int __cxa_atexit(void (*lpfunc)(void *), void *obj, void *lpdso_handle)
{
  return MEMORY[0x1F40C9B60](lpfunc, obj, lpdso_handle);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x1F417EF48](a1);
}

void __cxa_end_catch(void)
{
}

void __cxa_free_exception(void *a1)
{
}

void __cxa_guard_abort(__guard *a1)
{
}

int __cxa_guard_acquire(__guard *a1)
{
  return MEMORY[0x1F417EF80](a1);
}

void __cxa_guard_release(__guard *a1)
{
}

void __cxa_rethrow(void)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

int *__error(void)
{
  return (int *)MEMORY[0x1F40C9B88]();
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x1F40C9C18](*(void *)&a1, a2);
}

__darwin_ct_rune_t __tolower(__darwin_ct_rune_t a1)
{
  return MEMORY[0x1F40C9CF8](*(void *)&a1);
}

__darwin_ct_rune_t __toupper(__darwin_ct_rune_t a1)
{
  return MEMORY[0x1F40C9D00](*(void *)&a1);
}

os_activity_t _os_activity_create(void *dso, const char *description, os_activity_t activity, os_activity_flag_t flags)
{
  return (os_activity_t)MEMORY[0x1F40C9F70](dso, description, activity, *(void *)&flags);
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

uint64_t analytics_send_event_lazy()
{
  return MEMORY[0x1F41138D8]();
}

void bzero(void *a1, size_t a2)
{
}

int chmod(const char *a1, mode_t a2)
{
  return MEMORY[0x1F40CB3A0](a1, a2);
}

int chown(const char *a1, uid_t a2, gid_t a3)
{
  return MEMORY[0x1F40CB3A8](a1, *(void *)&a2, *(void *)&a3);
}

int close(int a1)
{
  return MEMORY[0x1F40CB3F8](*(void *)&a1);
}

int closedir(DIR *a1)
{
  return MEMORY[0x1F40CB400](a1);
}

double difftime(time_t a1, time_t a2)
{
  MEMORY[0x1F40CB8F8](a1, a2);
  return result;
}

void dispatch_activate(dispatch_object_t object)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async_and_wait(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async_f(dispatch_queue_t queue, void *context, dispatch_function_t work)
{
}

void dispatch_barrier_async_f(dispatch_queue_t queue, void *context, dispatch_function_t work)
{
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

void dispatch_group_notify_f(dispatch_group_t group, dispatch_queue_t queue, void *context, dispatch_function_t work)
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

void dispatch_release(dispatch_object_t object)
{
}

void dispatch_resume(dispatch_object_t object)
{
}

void dispatch_retain(dispatch_object_t object)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1F40CBC30](value);
}

void dispatch_set_qos_class_floor(dispatch_object_t object, dispatch_qos_class_t qos_class, int relative_priority)
{
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1F40CBC98](type, handle, mask, queue);
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

dispatch_workloop_t dispatch_workloop_create(const char *label)
{
  return (dispatch_workloop_t)MEMORY[0x1F40CBD50](label);
}

uint64_t dispatch_workloop_is_current()
{
  return MEMORY[0x1F40CBD60]();
}

int fchmod(int a1, mode_t a2)
{
  return MEMORY[0x1F40CC028](*(void *)&a1, a2);
}

int fclose(FILE *a1)
{
  return MEMORY[0x1F40CC050](a1);
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x1F40CC058](*(void *)&a1, *(void *)&a2);
}

int fflush(FILE *a1)
{
  return MEMORY[0x1F40CC0C8](a1);
}

int ffsctl(int a1, unint64_t a2, void *a3, unsigned int a4)
{
  return MEMORY[0x1F40CC0D8](*(void *)&a1, a2, a3, *(void *)&a4);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x1F40CC1C0](__filename, __mode);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x1F40CC1D8](a1, a2);
}

size_t fread(void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1F40CC200](__ptr, __size, __nitems, __stream);
}

void free(void *a1)
{
}

void freeifaddrs(ifaddrs *a1)
{
}

int fseek(FILE *a1, uint64_t a2, int a3)
{
  return MEMORY[0x1F40CC290](a1, a2, *(void *)&a3);
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x1F40CC2B8](*(void *)&a1, a2);
}

uint64_t ftell(FILE *a1)
{
  return MEMORY[0x1F40CC2E0](a1);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1F40CC338](__ptr, __size, __nitems, __stream);
}

int getifaddrs(ifaddrs **a1)
{
  return MEMORY[0x1F40CC410](a1);
}

pid_t getpid(void)
{
  return MEMORY[0x1F40CC4A0]();
}

const char *getprogname(void)
{
  return (const char *)MEMORY[0x1F40CC4C0]();
}

passwd *__cdecl getpwnam(const char *a1)
{
  return (passwd *)MEMORY[0x1F40CC4D8](a1);
}

int gettimeofday(timeval *a1, void *a2)
{
  return MEMORY[0x1F40CC568](a1, a2);
}

const char *__cdecl inet_ntop(int a1, const void *a2, char *a3, socklen_t a4)
{
  return (const char *)MEMORY[0x1F40CC678](*(void *)&a1, a2, a3, *(void *)&a4);
}

tm *__cdecl localtime_r(const time_t *a1, tm *a2)
{
  return (tm *)MEMORY[0x1F40CC870](a1, a2);
}

int lstat(const char *a1, stat *a2)
{
  return MEMORY[0x1F40CC900](a1, a2);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB98](size, type_id);
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCD8](__s, *(void *)&__c, __n);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x1F40CCCE8](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCF0](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD10](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD20](__b, *(void *)&__c, __len);
}

int mkdir(const char *a1, mode_t a2)
{
  return MEMORY[0x1F40CCDD0](a1, a2);
}

time_t mktime(tm *a1)
{
  return MEMORY[0x1F40CCE30](a1);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1F40CD028](*(void *)&token);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x1F40CD050](name);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1F40CD060](name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1F4181648]();
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

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
}

void objc_copyCppObjectAtomic(void *dest, const void *src, void (__cdecl *copyHelper)(void *, const void *))
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1F4181748](self, _cmd, offset, atomic);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F41817A8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1F41817B0]();
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

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1F41818D0](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1F40CD0E0](a1, *(void *)&a2);
}

DIR *__cdecl opendir(const char *a1)
{
  return (DIR *)MEMORY[0x1F40CD120](a1);
}

void os_activity_scope_enter(os_activity_t activity, os_activity_scope_state_t state)
{
}

void os_activity_scope_leave(os_activity_scope_state_t state)
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

void os_release(void *object)
{
}

uint64_t os_state_add_handler()
{
  return MEMORY[0x1F40CD570]();
}

uint64_t os_state_remove_handler()
{
  return MEMORY[0x1F40CD578]();
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

int pthread_attr_init(pthread_attr_t *a1)
{
  return MEMORY[0x1F40CD930](a1);
}

int pthread_attr_set_qos_class_np(pthread_attr_t *__attr, qos_class_t __qos_class, int __relative_priority)
{
  return MEMORY[0x1F40CD938](__attr, *(void *)&__qos_class, *(void *)&__relative_priority);
}

int pthread_create(pthread_t *a1, const pthread_attr_t *a2, void *(__cdecl *a3)(void *), void *a4)
{
  return MEMORY[0x1F40CD9B8](a1, a2, a3, a4);
}

int pthread_join(pthread_t a1, void **a2)
{
  return MEMORY[0x1F40CDA38](a1, a2);
}

int pthread_mutex_destroy(pthread_mutex_t *a1)
{
  return MEMORY[0x1F40CDA78](a1);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return MEMORY[0x1F40CDA80](a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x1F40CDA88](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x1F40CDA98](a1);
}

int pthread_set_qos_class_self_np(qos_class_t __qos_class, int __relative_priority)
{
  return MEMORY[0x1F40CDB48](*(void *)&__qos_class, *(void *)&__relative_priority);
}

int pthread_setname_np(const char *a1)
{
  return MEMORY[0x1F40CDB60](a1);
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x1F40CDC50](*(void *)&a1, a2, a3);
}

dirent *__cdecl readdir(DIR *a1)
{
  return (dirent *)MEMORY[0x1F40CDC60](a1);
}

BOOL remove(const std::__fs::filesystem::path *__p, std::error_code *__ec)
{
  return MEMORY[0x1F40CDD10](__p, __ec);
}

void rename(const std::__fs::filesystem::path *__from, const std::__fs::filesystem::path *__to, std::error_code *__ec)
{
}

void rewind(FILE *a1)
{
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1F40CE080](__str, __size, __format);
}

int sprintf(char *a1, const char *a2, ...)
{
  return MEMORY[0x1F40CE0A0](a1, a2);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x1F40CE110](a1, a2);
}

int statfs(const char *a1, statfs *a2)
{
  return MEMORY[0x1F40CE118](a1, a2);
}

int statvfs(const char *a1, statvfs *a2)
{
  return MEMORY[0x1F40CE120](a1, a2);
}

int strcasecmp(const char *a1, const char *a2)
{
  return MEMORY[0x1F40CE138](a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1F40CE158](__s1, __s2);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1F40CE188](*(void *)&__errnum);
}

size_t strftime(char *a1, size_t a2, const char *a3, const tm *a4)
{
  return MEMORY[0x1F40CE198](a1, a2, a3, a4);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1F40CE1C8](__s);
}

int strncasecmp(const char *a1, const char *a2, size_t a3)
{
  return MEMORY[0x1F40CE1D8](a1, a2, a3);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x1F40CE1F0](__s1, __s2, __n);
}

char *__cdecl strptime(const char *a1, const char *a2, tm *a3)
{
  return (char *)MEMORY[0x1F40CE220](a1, a2, a3);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1F40CE2A0](__str, __endptr, *(void *)&__base);
}

unint64_t strtoul(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1F40CE2E0](__str, __endptr, *(void *)&__base);
}

int symlink(const char *a1, const char *a2)
{
  return MEMORY[0x1F40CE360](a1, a2);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x1F40CE3D0](a1, a2, a3, a4, a5);
}

void syslog(int a1, const char *a2, ...)
{
}

time_t time(time_t *a1)
{
  return MEMORY[0x1F40CE588](a1);
}

int unlink(const char *a1)
{
  return MEMORY[0x1F40CE5E0](a1);
}

int usleep(useconds_t a1)
{
  return MEMORY[0x1F40CE608](*(void *)&a1);
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return MEMORY[0x1F40CE928](*(void *)&__fd, __buf, __nbyte);
}

void xpc_array_append_value(xpc_object_t xarray, xpc_object_t value)
{
}

BOOL xpc_array_apply(xpc_object_t xarray, xpc_array_applier_t applier)
{
  return MEMORY[0x1F40CEA18](xarray, applier);
}

xpc_object_t xpc_array_create(xpc_object_t *objects, size_t count)
{
  return (xpc_object_t)MEMORY[0x1F40CEA30](objects, count);
}

size_t xpc_array_get_count(xpc_object_t xarray)
{
  return MEMORY[0x1F40CEA58](xarray);
}

xpc_object_t xpc_array_get_value(xpc_object_t xarray, size_t index)
{
  return (xpc_object_t)MEMORY[0x1F40CEAA8](xarray, index);
}

xpc_object_t xpc_BOOL_create(BOOL value)
{
  return (xpc_object_t)MEMORY[0x1F40CEB10](value);
}

void xpc_connection_cancel(xpc_connection_t connection)
{
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x1F40CEBD0](name, targetq, flags);
}

uint64_t xpc_connection_get_audit_token()
{
  return MEMORY[0x1F40CEBE8]();
}

pid_t xpc_connection_get_pid(xpc_connection_t connection)
{
  return MEMORY[0x1F40CEC20](connection);
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
}

void xpc_connection_send_message_with_reply(xpc_connection_t connection, xpc_object_t message, dispatch_queue_t replyq, xpc_handler_t handler)
{
}

char *__cdecl xpc_copy_description(xpc_object_t object)
{
  return (char *)MEMORY[0x1F40CED28](object);
}

uint64_t xpc_copy_entitlement_for_token()
{
  return MEMORY[0x1F40CED38]();
}

xpc_object_t xpc_data_create(const void *bytes, size_t length)
{
  return (xpc_object_t)MEMORY[0x1F40CED90](bytes, length);
}

const void *__cdecl xpc_data_get_bytes_ptr(xpc_object_t xdata)
{
  return (const void *)MEMORY[0x1F40CEDB0](xdata);
}

size_t xpc_data_get_length(xpc_object_t xdata)
{
  return MEMORY[0x1F40CEDC0](xdata);
}

BOOL xpc_dictionary_apply(xpc_object_t xdict, xpc_dictionary_applier_t applier)
{
  return MEMORY[0x1F40CEE08](xdict, applier);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1F40CEE20](keys, values, count);
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return (xpc_object_t)MEMORY[0x1F40CEE40](original);
}

xpc_connection_t xpc_dictionary_get_remote_connection(xpc_object_t xdict)
{
  return (xpc_connection_t)MEMORY[0x1F40CEEE0](xdict);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1F40CEF10](xdict, key);
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
}

xpc_object_t xpc_double_create(double value)
{
  return (xpc_object_t)MEMORY[0x1F40CEFE8](value);
}

BOOL xpc_equal(xpc_object_t object1, xpc_object_t object2)
{
  return MEMORY[0x1F40CF040](object1, object2);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x1F40CF148](object);
}

xpc_object_t xpc_int64_create(int64_t value)
{
  return (xpc_object_t)MEMORY[0x1F40CF188](value);
}

xpc_object_t xpc_null_create(void)
{
  return (xpc_object_t)MEMORY[0x1F40CF208]();
}

void xpc_release(xpc_object_t object)
{
}

xpc_object_t xpc_retain(xpc_object_t object)
{
  return (xpc_object_t)MEMORY[0x1F40CF248](object);
}

xpc_object_t xpc_string_create(const char *string)
{
  return (xpc_object_t)MEMORY[0x1F40CF290](string);
}

xpc_object_t xpc_uint64_create(uint64_t value)
{
  return (xpc_object_t)MEMORY[0x1F40CF320](value);
}

const uint8_t *__cdecl xpc_uuid_get_bytes(xpc_object_t xuuid)
{
  return (const uint8_t *)MEMORY[0x1F40CF368](xuuid);
}