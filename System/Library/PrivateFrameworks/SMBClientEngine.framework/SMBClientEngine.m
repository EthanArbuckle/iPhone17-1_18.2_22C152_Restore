void piston_set_info(void *a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  void (**v12)(id, uint64_t);
  void *v13;
  void *v14;

  v9 = a1;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = [v9 pd];
  v14 = [v13 sock];

  if (!v14)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      piston_set_info_cold_1();
      if (!v12) {
        goto LABEL_8;
      }
    }
    else if (!v12)
    {
      goto LABEL_8;
    }
    v12[2](v12, 57);
    goto LABEL_8;
  }
  if (smb2_smb_set_info(v9, a2, v10, v11, 0, v12)
    && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    piston_set_info_cold_2();
  }
LABEL_8:
}

uint64_t smb2_smb_set_info(void *a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6)
{
  uint64_t v68 = *MEMORY[0x263EF8340];
  id v11 = a1;
  id v12 = a3;
  id v13 = a4;
  v14 = a6;
  uint64_t v63 = 0;
  v64 = &v63;
  uint64_t v65 = 0x2020000000;
  uint64_t v66 = 0;
  uint64_t v59 = 0;
  v60 = &v59;
  uint64_t v61 = 0x2020000000;
  __int16 v62 = 0;
  memset(__src, 0, 20);
  unsigned int v57 = 0;
  uint64_t v15 = [v11 treeID];
  uint64_t v16 = [v11 onEncryptedShare];
  v17 = [v11 pd];
  id v56 = 0;
  uint64_t uint16le = smb2_rq_alloc(17, v15, v16, 0, v17, &v56);
  id v19 = v56;

  if (!uint16le)
  {
    uint64_t v20 = objc_msgSend(v19, "smb_rq_getrequest");
    mb_put_uint16le(v20, 33);
    mb_put_uint8(v20, *(unsigned char *)(a2 + 4));
    mb_put_uint8(v20, *(unsigned char *)(a2 + 5));
    v49 = (_DWORD *)mb_reserve(v20, 4uLL);
    mb_put_uint16le(v20, 96);
    mb_put_uint16le(v20, 0);
    mb_put_uint32le(v20, *(_DWORD *)(a2 + 8));
    if (a5)
    {
      uint64_t v21 = -1;
      mb_put_uint64le(v20, -1);
    }
    else
    {
      mb_put_uint64le(v20, [v11 fid]);
      [v11 fid];
      uint64_t v21 = v22;
    }
    mb_put_uint64le(v20, v21);
    unsigned int v23 = *(unsigned __int8 *)(a2 + 5);
    if (v23 > 0x12)
    {
      if (v23 - 19 >= 2) {
        goto LABEL_25;
      }
      _DWORD *v49 = 8;
      mb_put_uint64le(v20, *(void *)(a2 + 32));
    }
    else
    {
      if (v23 != 4)
      {
        if (v23 == 10)
        {
          cstring_len = (char *)smb_get_cstring_len(v13, &v57);
          mb_put_uint8(v20, *(_DWORD *)(a2 + 80) & 1);
          v25 = (_DWORD *)mb_reserve(v20, 7uLL);
          *(_DWORD *)((char *)v25 + 3) = 0;
          _DWORD *v25 = 0;
          mb_put_uint64le(v20, 0);
          uint64_t v26 = mb_reserve(v20, 4uLL);
          if (cstring_len)
          {
            v27 = (_DWORD *)v26;
            smb2_rq_bstart32(v19, v26);
            uint64_t uint16le = smb2fs_fullpath(v20, cstring_len, v57, 0, 0, 32);
            if (uint16le)
            {
              if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
                smb2_smb_set_info_cold_5();
              }
              if (v19) {
                objc_msgSend(v19, "smb_rq_done");
              }
              if (v14) {
                goto LABEL_5;
              }
              goto LABEL_77;
            }
            smb_rq_bend32(v19);
            mb_put_mem(v20, 0, 4uLL, 3);
            _DWORD *v49 = *v27 + 24;
            goto LABEL_37;
          }
          if (v19) {
            objc_msgSend(v19, "smb_rq_done");
          }
          if (v14) {
            goto LABEL_31;
          }
          goto LABEL_35;
        }
        if (v23 == 13)
        {
          _DWORD *v49 = 1;
          mb_put_uint8(v20, *(void *)(a2 + 32) == 1);
LABEL_37:
          objc_msgSend(v19, "smb_rq_set_extflag:", 8);
          goto LABEL_38;
        }
LABEL_25:
        if (*(unsigned char *)(a2 + 4) == 3) {
          goto LABEL_37;
        }
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          smb2_smb_set_info_cold_4();
        }
        if (v19) {
          objc_msgSend(v19, "smb_rq_done");
        }
        if (v14)
        {
LABEL_31:
          uint64_t uint16le = 22;
          v14[2](v14, 22);
          goto LABEL_77;
        }
LABEL_35:
        uint64_t uint16le = 22;
        goto LABEL_77;
      }
      _DWORD *v49 = 40;
      mb_put_uint64le(v20, *(void *)(a2 + 40));
      mb_put_uint64le(v20, *(void *)(a2 + 48));
      mb_put_uint64le(v20, *(void *)(a2 + 56));
      mb_put_uint64le(v20, *(void *)(a2 + 64));
      mb_put_uint32le(v20, *(_DWORD *)(a2 + 72));
      mb_put_uint32le(v20, 0);
    }
LABEL_38:
    if (*(unsigned char *)(a2 + 4) == 3)
    {
      uint64_t v28 = [v12 bytes];
      v29 = (void *)v28;
      memset((char *)__src + 1, 0, 19);
      LOBYTE(__src[0]) = 1;
      __int16 v30 = *(_WORD *)(v28 + 4);
      int v31 = 20;
      uint64_t v32 = *(void *)(v28 + 8);
      if (v32)
      {
        HIDWORD(__src[0]) = 20;
        int v31 = 4 * *(unsigned __int8 *)(v32 + 1) + 28;
      }
      uint64_t v33 = *(void *)(v28 + 16);
      if (v33)
      {
        LODWORD(__src[1]) = v31;
        v31 += 4 * *(unsigned __int8 *)(v33 + 1) + 8;
      }
      uint64_t v34 = *(void *)(v28 + 24);
      if (v34)
      {
        __int16 v35 = v30 | 0x8A10;
        HIDWORD(__src[1]) = v31;
        v31 += *(unsigned __int16 *)(v34 + 2);
      }
      else
      {
        __int16 v35 = v30 | 0x8000;
      }
      uint64_t v36 = *(void *)(v28 + 32);
      if (v36)
      {
        v35 |= 0x504u;
        LODWORD(__src[2]) = v31;
        v31 += *(unsigned __int16 *)(v36 + 2);
      }
      _DWORD *v49 = v31;
      WORD1(__src[0]) = v35;
      mb_put_mem(v20, (char *)__src, 0x14uLL, 0);
      uint64_t v37 = v29[1];
      if (v37) {
        mb_put_mem(v20, (char *)v37, 4 * *(unsigned __int8 *)(v37 + 1) + 8, 0);
      }
      uint64_t v38 = v29[2];
      if (v38) {
        mb_put_mem(v20, (char *)v38, 4 * *(unsigned __int8 *)(v38 + 1) + 8, 0);
      }
      uint64_t v39 = v29[3];
      if (v39) {
        mb_put_mem(v20, (char *)v39, *(unsigned __int16 *)(v39 + 2), 0);
      }
      uint64_t v40 = v29[4];
      if (v40) {
        mb_put_mem(v20, (char *)v40, *(unsigned __int16 *)(v40 + 2), 0);
      }
    }
    if (a5)
    {
      smb2_rq_align8(v19);
      objc_msgSend(v19, "smb_rq_set_srflags:", 256);
      uint64_t uint16le = 0;
      *a5 = v19;
    }
    else if (v14)
    {
      v41 = [v11 pd];
      v50[0] = MEMORY[0x263EF8330];
      v50[1] = 3221225472;
      v50[2] = __smb2_smb_set_info_block_invoke;
      v50[3] = &unk_265072B88;
      v42 = v14;
      v52 = v42;
      uint64_t v55 = a2;
      id v43 = v19;
      id v51 = v43;
      v53 = &v63;
      v54 = &v59;
      uint64_t uint16le = smb_rq_simple_block(v41, v43, v50);

      if (uint16le)
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          smb2_smb_set_info_cold_3();
        }
        if (v43) {
          objc_msgSend(v43, "smb_rq_done");
        }
        v42[2](v42, uint16le);
      }
    }
    else
    {
      v44 = [v11 pd];
      uint64_t uint16le = smb_rq_simple(v44, v19);

      *(_DWORD *)(a2 + 84) = objc_msgSend(v19, "sr_ntstatus");
      if (uint16le)
      {
        v45 = &_os_log_internal;
        id v46 = &_os_log_internal;
        if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR)) {
          smb2_smb_set_info_cold_2(buf, uint16le, objc_msgSend(v19, "sr_ntstatus"));
        }
      }
      else
      {
        v47 = objc_msgSend(v19, "smb_rq_getreply");
        v64[3] = (uint64_t)v47;
        uint64_t uint16le = md_get_uint16le(v47, (_WORD *)v60 + 12);
        if (!uint16le)
        {
          if (*((_WORD *)v60 + 12) == 2)
          {
            uint64_t uint16le = 0;
          }
          else
          {
            if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
              smb2_smb_set_info_cold_1();
            }
            uint64_t uint16le = 72;
          }
        }
      }
      objc_msgSend(v19, "smb_rq_done");
    }
    goto LABEL_77;
  }
  if (v19) {
    objc_msgSend(v19, "smb_rq_done");
  }
  if (v14) {
LABEL_5:
  }
    v14[2](v14, uint16le);
LABEL_77:
  _Block_object_dispose(&v59, 8);
  _Block_object_dispose(&v63, 8);

  return uint16le;
}

void sub_23F84B1A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
}

void __smb2_smb_set_info_block_invoke(uint64_t a1, uint64_t uint16le)
{
  v4 = (void (**)(void, void))MEMORY[0x2455D48A0](*(void *)(a1 + 40));
  v5 = (id *)(a1 + 32);
  *(_DWORD *)(*(void *)(a1 + 64) + 84) = objc_msgSend(*(id *)(a1 + 32), "sr_ntstatus");
  if (uint16le)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      __smb2_smb_set_info_block_invoke_cold_2((id *)(a1 + 32));
    }
  }
  else
  {
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "smb_rq_getreply");
    v6 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
    uint64_t v8 = *(void *)(a1 + 56);
    uint64_t v7 = a1 + 56;
    uint64_t uint16le = md_get_uint16le(v6, (_WORD *)(*(void *)(v8 + 8) + 24));
    if (!uint16le)
    {
      if (*(_WORD *)(*(void *)(*(void *)v7 + 8) + 24) == 2)
      {
        uint64_t uint16le = 0;
      }
      else
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          __smb2_smb_set_info_block_invoke_cold_1();
        }
        uint64_t uint16le = 72;
      }
    }
  }
  if (*v5) {
    objc_msgSend(*v5, "smb_rq_done");
  }
  if (v4) {
    v4[2](v4, uint16le);
  }
}

uint64_t smb2fs_smb_set_delete(void *a1)
{
  uint64_t v4 = 0;
  memset(&v3[3], 0, 32);
  memset(v3, 0, 32);
  WORD2(v3[0]) = 3329;
  v3[2] = 1uLL;
  uint64_t v1 = smb2_smb_set_info(a1, (uint64_t)v3, 0, 0, 0, 0);
  if (v1 && piston_log_level && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    smb2fs_smb_set_delete_cold_1();
  }
  return v1;
}

uint64_t smb2fs_smb_set_eof(void *a1, unint64_t a2)
{
  uint64_t v5 = 0;
  memset(&v4[3], 0, 32);
  memset(v4, 0, 32);
  WORD2(v4[0]) = 5121;
  v4[2] = a2;
  uint64_t v2 = smb2_smb_set_info(a1, (uint64_t)v4, 0, 0, 0, 0);
  if (v2 && piston_log_level && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    smb2fs_smb_set_eof_cold_1();
  }
  return v2;
}

uint64_t smb2fs_smb_setfattrNT(void *a1, unsigned int a2, uint64_t *a3, uint64_t *a4, uint64_t *a5)
{
  id v9 = a1;
  v10 = objc_msgSend(v9, "pd", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
  id v11 = objc_msgSend(v10, "getShare:", objc_msgSend(v9, "shareID"));

  if (v11)
  {
    uint64_t v28 = 0;
    if (a3)
    {
      smb_time_local2NT(a3, (uint64_t *)&v28, [v11 fstype] == 1);
      a3 = v28;
    }
    uint64_t v28 = 0;
    if (a5)
    {
      smb_time_local2NT(a5, (uint64_t *)&v28, [v11 fstype] == 1);
      a5 = v28;
    }
    uint64_t v28 = 0;
    if (a4)
    {
      smb_time_local2NT(a4, (uint64_t *)&v28, [v11 fstype] == 1);
      a4 = v28;
    }

    WORD2(v22) = 1025;
    *((void *)&v23 + 1) = a3;
    v24 = a5;
    v25 = a4;
    uint64_t v26 = 0;
    uint64_t v27 = a2;
    uint64_t v12 = smb2_smb_set_info(v9, (uint64_t)&v22, 0, 0, 0, 0);
    if (v12 && piston_log_level && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      smb2fs_smb_setfattrNT_cold_3();
    }
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      smb2fs_smb_setfattrNT_cold_2(v9);
    }

    if (piston_log_level)
    {
      BOOL v13 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
      if (v13) {
        smb2fs_smb_setfattrNT_cold_1(v13, v14, v15, v16, v17, v18, v19, v20);
      }
    }
    uint64_t v12 = 22;
  }

  return v12;
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

void OUTLINED_FUNCTION_4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x18u);
}

void piston_read(void *a1, uint64_t a2, void *a3, uint64_t a4, void *a5)
{
  id v8 = a1;
  id v9 = a3;
  v10 = a5;
  id v11 = [v8 pd];
  uint64_t v12 = [v11 sock];

  if (!v12)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      piston_read_cold_1();
      if (!v10) {
        goto LABEL_8;
      }
    }
    else if (!v10)
    {
      goto LABEL_8;
    }
    v10[2](v10, 57);
    goto LABEL_8;
  }
  if (smb2_smb_read_one(v8, a2, v9, 0, v10)
    && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    piston_read_cold_2();
  }
LABEL_8:
}

uint64_t smb2_smb_read_one(void *a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  id v9 = a1;
  id v10 = a3;
  id v11 = a5;
  unsigned int v12 = *(_DWORD *)(a2 + 16);
  BOOL v13 = [v9 pd];
  unsigned int v14 = *(_DWORD *)([v13 getSessionPtr] + 84);

  if (v14 >= v12) {
    unsigned int v15 = v12;
  }
  else {
    unsigned int v15 = v14;
  }
  unsigned int v38 = v15;
  uint64_t v16 = [v9 treeID];
  uint64_t v17 = [v9 onEncryptedShare];
  uint64_t v18 = [v9 pd];
  id v37 = 0;
  uint64_t v19 = smb2_rq_alloc(8, v16, v17, &v38, v18, &v37);
  id v20 = v37;

  if (!v19)
  {
    if (v12 >= v38) {
      int v21 = v12 - v38;
    }
    else {
      int v21 = 0;
    }
    uint64_t v22 = objc_msgSend(v20, "smb_rq_getrequest");
    mb_put_uint16le(v22, 49);
    mb_put_uint16le(v22, 0);
    mb_put_uint32le(v22, v38);
    mb_put_uint64le(v22, *(void *)a2);
    if (a4)
    {
      uint64_t v23 = -1;
      mb_put_uint64le(v22, -1);
    }
    else
    {
      mb_put_uint64le(v22, [v9 fid]);
      [v9 fid];
      uint64_t v23 = v24;
    }
    mb_put_uint64le(v22, v23);
    mb_put_uint32le(v22, 1);
    mb_put_uint32le(v22, 0);
    mb_put_uint32le(v22, v21);
    mb_put_uint32le(v22, 0);
    mb_put_uint8(v22, 0);
    if (a4)
    {
      smb2_rq_align8(v20);
      objc_msgSend(v20, "smb_rq_set_srflags:", 256);
      uint64_t v19 = 0;
      *a4 = v20;
      goto LABEL_24;
    }
    v25 = [v9 pd];
    uint64_t v29 = MEMORY[0x263EF8330];
    uint64_t v30 = 3221225472;
    int v31 = __smb2_smb_read_one_block_invoke;
    uint64_t v32 = &unk_265072BB0;
    id v26 = v11;
    id v35 = v26;
    uint64_t v36 = a2;
    id v27 = v20;
    id v33 = v27;
    id v34 = v10;
    uint64_t v19 = smb_rq_simple_block(v25, v27, &v29);

    if (!v19)
    {
LABEL_23:

      goto LABEL_24;
    }
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      smb2_smb_read_one_cold_1();
      if (!v27)
      {
LABEL_21:
        if (v26) {
          (*((void (**)(id, uint64_t))v26 + 2))(v26, v19);
        }
        goto LABEL_23;
      }
    }
    else if (!v27)
    {
      goto LABEL_21;
    }
    objc_msgSend(v27, "smb_rq_done", v29, v30, v31, v32, v33);
    goto LABEL_21;
  }
  if (v20) {
    objc_msgSend(v20, "smb_rq_done");
  }
  if (v11) {
    (*((void (**)(id, uint64_t))v11 + 2))(v11, v19);
  }
LABEL_24:

  return v19;
}

void piston_write(void *a1, uint64_t a2, uint64_t a3, void *a4, void *a5)
{
  id v8 = a1;
  id v9 = a4;
  id v10 = a5;
  id v11 = [v8 pd];
  unsigned int v12 = [v11 sock];

  if (!v12)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      piston_write_cold_1();
      if (!v10) {
        goto LABEL_8;
      }
    }
    else if (!v10)
    {
      goto LABEL_8;
    }
    v10[2](v10, 57);
    goto LABEL_8;
  }
  if (smb2_smb_write_one(v8, a2, v9, 0, v10)
    && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    piston_write_cold_2();
  }
LABEL_8:
}

uint64_t smb2_smb_write_one(void *a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  id v9 = a1;
  id v10 = a3;
  id v11 = a5;
  unsigned int v12 = *(_DWORD *)(a2 + 16);
  BOOL v13 = [v9 pd];
  uint64_t v14 = [v13 getSessionPtr];

  unsigned int v15 = *(_DWORD *)(v14 + 88);
  if (v15 >= v12) {
    unsigned int v15 = v12;
  }
  unsigned int v37 = v15;
  uint64_t v16 = [v9 treeID];
  uint64_t v17 = [v9 onEncryptedShare];
  uint64_t v18 = [v9 pd];
  id v36 = 0;
  uint64_t v19 = smb2_rq_alloc(9, v16, v17, &v37, v18, &v36);
  id v20 = v36;

  if (v19) {
    goto LABEL_4;
  }
  if (v12 >= v37) {
    int v21 = v12 - v37;
  }
  else {
    int v21 = 0;
  }
  unint64_t v22 = [v10 length];
  if (v22 >= v37)
  {
    uint64_t v24 = objc_msgSend(v20, "smb_rq_getrequest");
    mb_put_uint16le(v24, 49);
    mb_put_uint16le(v24, 112);
    mb_put_uint32le(v24, v37);
    mb_put_uint64le(v24, *(void *)a2);
    if (a4)
    {
      uint64_t v25 = -1;
      mb_put_uint64le(v24, -1);
    }
    else
    {
      mb_put_uint64le(v24, [v9 fid]);
      [v9 fid];
      uint64_t v25 = v26;
    }
    mb_put_uint64le(v24, v25);
    mb_put_uint32le(v24, 0);
    mb_put_uint32le(v24, v21);
    mb_put_uint32le(v24, 0);
    mb_put_uint32le(v24, *(_DWORD *)(a2 + 20));
    if ([v20 onEncryptedShare])
    {
      id v27 = (char *)[v10 bytes];
      uint64_t v28 = mb_put_mem(v24, v27, v37, 0);
      if (v28)
      {
        uint64_t v19 = v28;
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          smb2_smb_write_one_cold_3();
        }
LABEL_4:
        if (v20) {
          objc_msgSend(v20, "smb_rq_done");
        }
        if (v11) {
          v11[2](v11, v19);
        }
        goto LABEL_17;
      }
    }
    else
    {
      [v20 setWriteData:v10];
      [v20 setWriteLen:v37];
    }
    if (a4)
    {
      smb2_rq_align8(v20);
      objc_msgSend(v20, "smb_rq_set_srflags:", 256);
      uint64_t v19 = 0;
      *a4 = v20;
      goto LABEL_17;
    }
    uint64_t v29 = [v9 pd];
    v32[0] = MEMORY[0x263EF8330];
    v32[1] = 3221225472;
    v32[2] = __smb2_smb_write_one_block_invoke;
    v32[3] = &unk_265072BD8;
    uint64_t v30 = v11;
    id v34 = v30;
    uint64_t v35 = a2;
    id v31 = v20;
    id v33 = v31;
    uint64_t v19 = smb_rq_simple_block(v29, v31, v32);

    if (!v19)
    {
LABEL_35:

      goto LABEL_17;
    }
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      smb2_smb_write_one_cold_2();
      if (!v31)
      {
LABEL_33:
        if (v30) {
          v30[2](v30, v19);
        }
        goto LABEL_35;
      }
    }
    else if (!v31)
    {
      goto LABEL_33;
    }
    objc_msgSend(v31, "smb_rq_done");
    goto LABEL_33;
  }
  if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    if (!v20) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
  smb2_smb_write_one_cold_1(v10);
  if (v20) {
LABEL_14:
  }
    objc_msgSend(v20, "smb_rq_done");
LABEL_15:
  uint64_t v19 = 22;
  if (v11) {
    v11[2](v11, 22);
  }
LABEL_17:

  return v19;
}

uint64_t smb2_smb_parse_read_one(void *a1, uint64_t a2)
{
  __int16 v10 = 0;
  __int16 v9 = 0;
  unsigned int v7 = 0;
  int v8 = 0;
  uint64_t result = md_get_uint16le(a1, &v10);
  if (!result)
  {
    if (v10 == 17)
    {
      uint64_t result = md_get_uint8(a1, (char *)&v9 + 1);
      if (!result)
      {
        uint64_t result = md_get_uint8(a1, (char *)&v9);
        if (!result)
        {
          uint64_t result = md_get_uint32le(a1, &v7);
          if (!result)
          {
            uint64_t result = md_get_uint32le(a1, &v8);
            if (!result)
            {
              uint64_t result = md_get_uint32le(a1, &v8);
              if (!result)
              {
                if (!HIBYTE(v9) || (HIBYTE(v9) -= 80, uint64_t result = md_get_mem(a1, 0, HIBYTE(v9), 0), !result))
                {
                  if (v7)
                  {
                    unsigned int v5 = *(_DWORD *)(a2 + 16);
                    if (v7 >= v5) {
                      uint64_t v6 = v5;
                    }
                    else {
                      uint64_t v6 = v7;
                    }
                    uint64_t result = md_get_mem(a1, *(char **)(a2 + 8), v6, 0);
                    if (result)
                    {
                      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
                        smb2_smb_parse_read_one_cold_1();
                      }
                      uint64_t result = 12;
                    }
                    *(_DWORD *)(a2 + 28) = v6;
                  }
                  else
                  {
                    uint64_t result = 0;
                    *(_DWORD *)(a2 + 28) = 0;
                  }
                }
              }
            }
          }
        }
      }
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        smb2_smb_parse_read_one_cold_2();
      }
      return 72;
    }
  }
  return result;
}

uint64_t smb2_smb_parse_write_one(void *a1, uint64_t a2)
{
  int v6 = 0;
  int v7 = 0;
  int v5 = 0;
  uint64_t result = md_get_uint16le(a1, (_WORD *)&v7 + 1);
  if (!result)
  {
    if (HIWORD(v7) == 17)
    {
      uint64_t result = md_get_uint16le(a1, &v7);
      if (!result)
      {
        uint64_t result = md_get_uint32le(a1, &v5);
        if (!result)
        {
          *(_DWORD *)(a2 + 28) = v5;
          uint64_t result = md_get_uint32le(a1, &v6);
          if (!result) {
            return md_get_uint32le(a1, &v6);
          }
        }
      }
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        smb2_smb_parse_write_one_cold_1();
      }
      return 72;
    }
  }
  return result;
}

void __smb2_smb_read_one_block_invoke(uint64_t a1, uint64_t one)
{
  uint64_t v4 = (void (**)(void, void))MEMORY[0x2455D48A0](*(void *)(a1 + 48));
  int v5 = (id *)(a1 + 32);
  *(_DWORD *)(*(void *)(a1 + 56) + 24) = objc_msgSend(*(id *)(a1 + 32), "sr_ntstatus");
  if (one)
  {
    if (one != 96 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      __smb2_smb_read_one_block_invoke_cold_1((id *)(a1 + 32));
    }
  }
  else
  {
    one = smb2_smb_parse_read_one(objc_msgSend(*(id *)(a1 + 32), "smb_rq_getreply"), *(void *)(a1 + 56));
  }
  if (*v5) {
    objc_msgSend(*v5, "smb_rq_done");
  }
  if (v4) {
    v4[2](v4, one);
  }
}

void __smb2_smb_write_one_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (void (**)(void, void))MEMORY[0x2455D48A0](*(void *)(a1 + 40));
  int v5 = (id *)(a1 + 32);
  *(_DWORD *)(*(void *)(a1 + 48) + 24) = objc_msgSend(*(id *)(a1 + 32), "sr_ntstatus");
  if (a2)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      __smb2_smb_write_one_block_invoke_cold_1((id *)(a1 + 32));
    }
  }
  else
  {
    a2 = smb2_smb_parse_write_one(objc_msgSend(*(id *)(a1 + 32), "smb_rq_getreply"), *(void *)(a1 + 48));
  }
  if (*v5) {
    objc_msgSend(*v5, "smb_rq_done");
  }
  if (v4) {
    v4[2](v4, a2);
  }
}

void piston_query_dir(void *a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  id v9 = a1;
  id v10 = a3;
  id v11 = a4;
  unsigned int v12 = a5;
  BOOL v13 = [v9 pd];
  uint64_t v14 = [v13 sock];

  if (!v14)
  {
    BOOL v15 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v15)
    {
      piston_query_dir_cold_1(v15, v16, v17, v18, v19, v20, v21, v22);
      if (!v12) {
        goto LABEL_8;
      }
    }
    else if (!v12)
    {
      goto LABEL_8;
    }
    v12[2](v12, 57);
    goto LABEL_8;
  }
  if (smb2_smb_query_dir(v9, a2, v10, v11, 0, 0, v12)
    && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    piston_query_dir_cold_2();
  }
LABEL_8:
}

unint64_t smb2_smb_query_dir(void *a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, void *a7)
{
  uint64_t v64 = *MEMORY[0x263EF8340];
  id v13 = a1;
  id v14 = a3;
  id v15 = a4;
  uint64_t v16 = a7;
  uint64_t v59 = 0;
  v60 = &v59;
  uint64_t v61 = 0x2020000000;
  uint64_t v62 = 0;
  uint64_t v58 = 0;
  if (!v15)
  {
    BOOL v22 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v22) {
      smb2_smb_query_dir_cold_1(v22, v23, v24, v25, v26, v27, v28, v29);
    }
    if (v16)
    {
      unint64_t dir = 22;
      v16[2](v16, 22);
      id v21 = 0;
      goto LABEL_37;
    }
    id v21 = 0;
    goto LABEL_14;
  }
  HIDWORD(v58) = [v15 length];
  cstring_len = (char *)smb_get_cstring_len(v14, &v58);
  uint64_t v17 = [v13 treeID];
  uint64_t v18 = [v13 onEncryptedShare];
  uint64_t v19 = [v13 pd];
  id v57 = 0;
  unint64_t dir = smb2_rq_alloc(14, v17, v18, (unsigned int *)&v58 + 1, v19, &v57);
  id v21 = v57;

  if (!dir)
  {
    if (a5) {
      *a5 = v21;
    }
    uint64_t v30 = objc_msgSend(v21, "smb_rq_getrequest");
    mb_put_uint16le(v30, 33);
    mb_put_uint8(v30, *(unsigned char *)a2);
    mb_put_uint8(v30, *(unsigned char *)(a2 + 1));
    mb_put_uint32le(v30, *(_DWORD *)(a2 + 4));
    if (a6)
    {
      uint64_t v31 = -1;
      mb_put_uint64le(v30, -1);
    }
    else
    {
      mb_put_uint64le(v30, [v13 fid]);
      [v13 fid];
      uint64_t v31 = v32;
    }
    mb_put_uint64le(v30, v31);
    mb_put_uint16le(v30, 96);
    id v33 = (_WORD *)mb_reserve(v30, 2uLL);
    mb_put_uint32le(v30, SHIDWORD(v58));
    if (!v58)
    {
      *id v33 = 0;
      mb_put_uint16le(v30, 0);
      goto LABEL_29;
    }
    smb2_rq_bstart(v21, (uint64_t)v33);
    if (cstring_len)
    {
      unint64_t dir = smb2fs_fullpath(v30, cstring_len, v58, 0, 0, *(_DWORD *)(a2 + 8));
      if (dir)
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          smb2_smb_query_dir_cold_5();
        }
        if (v16) {
          goto LABEL_4;
        }
        goto LABEL_37;
      }
      smb_rq_bend(v21);
LABEL_29:
      if (a6)
      {
        smb2_rq_align8(v21);
        objc_msgSend(v21, "smb_rq_set_srflags:", 256);
        id v21 = v21;
        unint64_t dir = 0;
        *a6 = v21;
      }
      else if (v16)
      {
        v42 = [v13 pd];
        v51[0] = MEMORY[0x263EF8330];
        v51[1] = 3221225472;
        v51[2] = __smb2_smb_query_dir_block_invoke;
        v51[3] = &unk_265072C00;
        id v43 = v16;
        v54 = v43;
        uint64_t v56 = a2;
        id v21 = v21;
        id v52 = v21;
        uint64_t v55 = &v59;
        id v53 = v15;
        unint64_t dir = smb_rq_simple_block(v42, v21, v51);

        if (dir)
        {
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
            smb2_smb_query_dir_cold_3();
          }
          v43[2](v43, dir);
        }
      }
      else
      {
        v45 = [v13 pd];
        unint64_t dir = smb_rq_simple(v45, v21);

        *(_DWORD *)(a2 + 12) = objc_msgSend(v21, "sr_ntstatus");
        if (dir)
        {
          if (dir != 2)
          {
            id v46 = &_os_log_internal;
            id v47 = &_os_log_internal;
            if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR)) {
              smb2_smb_query_dir_cold_2(buf, dir, objc_msgSend(v21, "sr_ntstatus"));
            }
          }
        }
        else
        {
          v48 = objc_msgSend(v21, "smb_rq_getreply");
          v60[3] = (uint64_t)v48;
          unint64_t dir = smb2_smb_parse_query_dir(v48, v49, v15, 0);
        }
      }
      goto LABEL_37;
    }
    BOOL v34 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v34) {
      smb2_smb_query_dir_cold_4(v34, v35, v36, v37, v38, v39, v40, v41);
    }
    if (v16)
    {
      unint64_t dir = 22;
      v16[2](v16, 22);
      goto LABEL_37;
    }
LABEL_14:
    unint64_t dir = 22;
    goto LABEL_37;
  }
  if (v16) {
LABEL_4:
  }
    v16[2](v16, dir);
LABEL_37:
  _Block_object_dispose(&v59, 8);

  return dir;
}

void sub_23F84C968(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

unint64_t smb2_smb_parse_query_dir(void *a1, uint64_t a2, void *a3, unsigned int *a4)
{
  id v6 = a3;
  unsigned int v50 = 0;
  int v51 = 0;
  uint64_t uint16le = md_get_uint16le(a1, (_WORD *)&v51 + 1);
  if (uint16le)
  {
    unint64_t mem = uint16le;
    BOOL v9 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v9) {
      smb2_smb_parse_query_dir_cold_6(v9, v10, v11, v12, v13, v14, v15, v16);
    }
  }
  else if (HIWORD(v51) == 9)
  {
    uint64_t v17 = md_get_uint16le(a1, &v51);
    if (v17)
    {
      unint64_t mem = v17;
      BOOL v18 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
      if (v18) {
        smb2_smb_parse_query_dir_cold_4(v18, v19, v20, v21, v22, v23, v24, v25);
      }
    }
    else
    {
      uint64_t uint32le = md_get_uint32le(a1, &v50);
      if (uint32le)
      {
        unint64_t mem = uint32le;
        BOOL v28 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
        if (v28) {
          smb2_smb_parse_query_dir_cold_3(v28, v29, v30, v31, v32, v33, v34, v35);
        }
      }
      else
      {
        if (a4) {
          *a4 = v50;
        }
        if ((_WORD)v51 && (LOWORD(v51) = v51 - 72, uint64_t v36 = md_get_mem(a1, 0, (unsigned __int16)v51, 0), v36))
        {
          unint64_t mem = v36;
          BOOL v37 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
          if (v37) {
            smb2_smb_parse_query_dir_cold_2(v37, v38, v39, v40, v41, v42, v43, v44);
          }
        }
        else
        {
          unint64_t mem = v50;
          if (v50)
          {
            if ([v6 length] >= mem) {
              unsigned int v45 = v50;
            }
            else {
              unsigned int v45 = [v6 length];
            }
            id v48 = v6;
            uint64_t v49 = v45;
            unint64_t mem = md_get_mem(a1, (char *)[v48 bytes], v45, 0);
            if (mem)
            {
              if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
                smb2_smb_parse_query_dir_cold_1();
              }
              unint64_t mem = 12;
            }
            id v46 = v48;
            uint64_t v47 = v49;
          }
          else
          {
            id v46 = v6;
            uint64_t v47 = 0;
          }
          [v46 setLength:v47];
        }
      }
    }
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      smb2_smb_parse_query_dir_cold_5();
    }
    unint64_t mem = 72;
  }

  return mem;
}

void __smb2_smb_query_dir_block_invoke(uint64_t a1, unint64_t dir)
{
  uint64_t v4 = (void (**)(void, void))MEMORY[0x2455D48A0](*(void *)(a1 + 48));
  int v5 = (id *)(a1 + 32);
  *(_DWORD *)(*(void *)(a1 + 64) + 12) = objc_msgSend(*(id *)(a1 + 32), "sr_ntstatus");
  if (dir)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      __smb2_smb_query_dir_block_invoke_cold_1((id *)(a1 + 32));
    }
  }
  else
  {
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "smb_rq_getreply");
    unint64_t dir = smb2_smb_parse_query_dir(*(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 24), v6, *(void **)(a1 + 40), 0);
  }
  if (*v5) {
    objc_msgSend(*v5, "smb_rq_done");
  }
  if (v4) {
    v4[2](v4, dir);
  }
}

void sub_23F84CEFC(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_23F84D610(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 56));
  _Unwind_Resume(a1);
}

void sub_23F84DCC8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void piston_change_notify(void *a1, _DWORD *a2, __int16 a3, int a4, void *a5, void *a6)
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v10 = a1;
  id v35 = a5;
  id v11 = a6;
  uint64_t v12 = [v10 pd];
  uint64_t v13 = [v12 sock];

  if (v13)
  {
    id v14 = v10;
    id v15 = v35;
    uint64_t v16 = (void (**)(id, uint64_t))v11;
    uint64_t v38 = 0;
    uint64_t v39 = &v38;
    uint64_t v40 = 0x2020000000;
    uint64_t v41 = 0;
    uint64_t v34 = v15;
    unsigned int v17 = [v15 length];
    if (v17 >= 0xA0000) {
      int v18 = 655360;
    }
    else {
      int v18 = v17;
    }
    int v37 = v18;
    uint64_t v19 = [v14 treeID];
    uint64_t v20 = [v14 onEncryptedShare];
    uint64_t v21 = [v14 pd];
    id v36 = 0;
    uint64_t v22 = smb2_rq_alloc(15, v19, v20, (unsigned int *)&v37, v21, &v36);
    id v23 = v36;

    if (v22)
    {
      if (v23) {
        objc_msgSend(v23, "smb_rq_done");
      }
      if (v16) {
        v16[2](v16, v22);
      }
    }
    else
    {
      uint64_t v24 = objc_msgSend(v23, "smb_rq_getrequest");
      mb_put_uint16le(v24, 32);
      mb_put_uint16le(v24, a3);
      mb_put_uint32le(v24, v37);
      mb_put_uint64le(v24, [v14 fid]);
      [v14 fid];
      mb_put_uint64le(v24, v25);
      mb_put_uint32le(v24, a4);
      mb_put_uint32le(v24, 0);
      objc_msgSend(v23, "smb_rq_set_srflags:", 2);
      if (v16)
      {
        uint64_t v26 = [v14 pd];
        *(void *)buf = MEMORY[0x263EF8330];
        uint64_t v43 = 3221225472;
        uint64_t v44 = __smb2_smb_change_notify_block_invoke;
        unsigned int v45 = &unk_265072C00;
        uint64_t v27 = v16;
        id v48 = v27;
        unsigned int v50 = a2;
        id v28 = v23;
        id v46 = v28;
        uint64_t v49 = &v38;
        id v47 = v34;
        uint64_t v22 = smb_rq_simple_block(v26, v28, buf);

        if (v22)
        {
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
            piston_change_notify_cold_4();
          }
          if (v28) {
            objc_msgSend(v28, "smb_rq_done");
          }
          v27[2](v27, v22);
        }
      }
      else
      {
        uint64_t v29 = [v14 pd];
        LODWORD(v22) = smb_rq_simple(v29, v23);

        *a2 = objc_msgSend(v23, "sr_ntstatus");
        if (v22)
        {
          uint64_t v30 = &_os_log_internal;
          id v31 = &_os_log_internal;
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
            piston_change_notify_cold_3(buf, v22, objc_msgSend(v23, "sr_ntstatus"));
          }
        }
        else
        {
          uint64_t v32 = objc_msgSend(v23, "smb_rq_getreply");
          v39[3] = (uint64_t)v32;
          LODWORD(v22) = smb2_smb_parse_change_notify(v32, v34);
        }
        objc_msgSend(v23, "smb_rq_done");
      }
    }
    _Block_object_dispose(&v38, 8);

    if (v22 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      piston_change_notify_cold_2();
    }
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      piston_change_notify_cold_1();
    }
    if (v11) {
      (*((void (**)(id, uint64_t))v11 + 2))(v11, 57);
    }
  }
}

void sub_23F84ECA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

unint64_t smb2_smb_parse_change_notify(void *a1, void *a2)
{
  id v3 = a2;
  unsigned int v18 = 0;
  int v19 = 0;
  unint64_t uint16le = md_get_uint16le(a1, (_WORD *)&v19 + 1);
  if (!uint16le)
  {
    if (HIWORD(v19) == 9)
    {
      unint64_t uint16le = md_get_uint16le(a1, &v19);
      if (!uint16le)
      {
        unint64_t uint16le = md_get_uint32le(a1, &v18);
        if (!uint16le)
        {
          if (!(_WORD)v19
            || (LOWORD(v19) = v19 - 72, unint64_t uint16le = md_get_mem(a1, 0, (unsigned __int16)v19, 0), !uint16le))
          {
            unint64_t uint16le = v18;
            if (v18)
            {
              if ([v3 length] >= uint16le) {
                unsigned int v5 = v18;
              }
              else {
                unsigned int v5 = [v3 length];
              }
              id v16 = v3;
              uint64_t v17 = v5;
              if (md_get_mem(a1, (char *)[v16 bytes], v5, 0))
              {
                if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
                  smb2_smb_parse_change_notify_cold_1();
                }
                unint64_t uint16le = 12;
              }
              else
              {
                unint64_t uint16le = 0;
              }
              id v14 = v16;
              uint64_t v15 = v17;
            }
            else
            {
              id v14 = v3;
              uint64_t v15 = 0;
            }
            [v14 setLength:v15];
          }
        }
      }
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        smb2_smb_parse_change_notify_cold_2((uint64_t)&v19 + 2, v6, v7, v8, v9, v10, v11, v12);
      }
      unint64_t uint16le = 72;
    }
  }

  return uint16le;
}

void __smb2_smb_change_notify_block_invoke(uint64_t a1, unint64_t a2)
{
  uint64_t v4 = (void (**)(void, void))MEMORY[0x2455D48A0](*(void *)(a1 + 48));
  unsigned int v5 = (id *)(a1 + 32);
  **(_DWORD **)(a1 + 64) = objc_msgSend(*(id *)(a1 + 32), "sr_ntstatus");
  if (a2)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      __smb2_smb_change_notify_block_invoke_cold_1((id *)(a1 + 32), a2);
    }
  }
  else
  {
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "smb_rq_getreply");
    a2 = smb2_smb_parse_change_notify(*(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 24), *(void **)(a1 + 40));
  }
  if (*v5) {
    objc_msgSend(*v5, "smb_rq_done");
  }
  if (v4) {
    v4[2](v4, a2);
  }
}

void piston_query_info(void *a1, unsigned __int8 *a2, void *a3, void *a4, void *a5, void *a6, void *a7)
{
  if (smb2_smb_query_info(a1, a2, a3, a4, a5, a6, 0, a7))
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      piston_query_info_cold_1();
    }
  }
}

uint64_t smb2_smb_query_info(void *a1, unsigned __int8 *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  uint64_t v67 = *MEMORY[0x263EF8340];
  id v15 = a1;
  id v49 = a3;
  id v50 = a4;
  id v16 = a5;
  id v17 = a6;
  unsigned int v18 = a8;
  uint64_t v62 = 0;
  uint64_t v63 = &v62;
  uint64_t v64 = 0x2020000000;
  uint64_t v65 = 0;
  int v61 = 0;
  int v19 = [v15 pd];
  uint64_t v20 = [v19 sock];
  LODWORD(a6) = v20 == 0;

  if (a6)
  {
    BOOL v22 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v22) {
      smb2_smb_query_info_cold_1(v22, v23, v24, v25, v26, v27, v28, v29);
    }
    if (v18) {
      v18[2](v18, 57);
    }
    id v30 = 0;
    uint64_t info = 100;
  }
  else
  {
    if (v17) {
      int v61 = objc_msgSend(v17, "length", v49, v50);
    }
    if (v16) {
      unsigned int v21 = [v16 length];
    }
    else {
      unsigned int v21 = 0;
    }
    int v32 = *a2;
    if (v32 == 3)
    {
      if (a2[1])
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          smb2_smb_query_info_cold_7();
        }
        goto LABEL_39;
      }
    }
    else
    {
      if (v32 == 2)
      {
        int v34 = a2[1];
        if (v34 != 5 && v34 != 3)
        {
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
            smb2_smb_query_info_cold_6();
          }
          goto LABEL_39;
        }
      }
      else
      {
        if (v32 != 1)
        {
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
            smb2_smb_query_info_cold_2();
          }
          goto LABEL_39;
        }
        unsigned int v33 = a2[1];
        if (v33 > 0x3B || ((1 << v33) & 0x801000010444040) == 0)
        {
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
            smb2_smb_query_info_cold_3();
          }
LABEL_39:
          if (v18)
          {
            uint64_t info = 22;
            v18[2](v18, 22);
            id v30 = 0;
          }
          else
          {
            id v30 = 0;
            uint64_t info = 22;
          }
          goto LABEL_61;
        }
      }
      int v61 = 0x10000;
    }
    uint64_t v35 = objc_msgSend(v15, "treeID", v49);
    uint64_t v36 = [v15 onEncryptedShare];
    int v37 = [v15 pd];
    id v60 = 0;
    uint64_t info = smb2_rq_alloc(16, v35, v36, (unsigned int *)&v61, v37, &v60);
    id v30 = v60;

    if (info)
    {
      if (v30) {
        objc_msgSend(v30, "smb_rq_done");
      }
      if (v18) {
        v18[2](v18, info);
      }
    }
    else
    {
      uint64_t v38 = objc_msgSend(v30, "smb_rq_getrequest");
      mb_put_uint16le(v38, 41);
      mb_put_uint8(v38, *a2);
      mb_put_uint8(v38, a2[1]);
      mb_put_uint32le(v38, v61);
      if (v21) {
        __int16 v39 = 104;
      }
      else {
        __int16 v39 = 0;
      }
      mb_put_uint16le(v38, v39);
      mb_put_uint16le(v38, 0);
      mb_put_uint32le(v38, v21);
      mb_put_uint32le(v38, *((_DWORD *)a2 + 1));
      mb_put_uint32le(v38, *((_DWORD *)a2 + 2));
      if (a7)
      {
        uint64_t v40 = -1;
        mb_put_uint64le(v38, -1);
      }
      else
      {
        mb_put_uint64le(v38, [v15 fid]);
        [v15 fid];
        uint64_t v40 = v41;
      }
      mb_put_uint64le(v38, v40);
      if (v21) {
        mb_put_mem(v38, (char *)[v16 bytes], v21, 0);
      }
      if (a7)
      {
        smb2_rq_align8(v30);
        objc_msgSend(v30, "smb_rq_set_srflags:", 256);
        id v30 = v30;
        uint64_t info = 0;
        *a7 = v30;
      }
      else if (v18)
      {
        uint64_t v42 = [v15 pd];
        v51[0] = MEMORY[0x263EF8330];
        v51[1] = 3221225472;
        v51[2] = __smb2_smb_query_info_block_invoke;
        v51[3] = &unk_265072CC8;
        uint64_t v43 = v18;
        id v57 = v43;
        uint64_t v59 = a2;
        id v30 = v30;
        id v52 = v30;
        uint64_t v58 = &v62;
        id v53 = v15;
        id v54 = v49;
        id v55 = v50;
        id v56 = v17;
        uint64_t info = smb_rq_simple_block(v42, v30, v51);

        if (info)
        {
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
            smb2_smb_query_info_cold_5();
          }
          if (v30) {
            objc_msgSend(v30, "smb_rq_done");
          }
          v43[2](v43, info);
        }
      }
      else
      {
        uint64_t v44 = [v15 pd];
        uint64_t info = smb_rq_simple(v44, v30);

        *((_DWORD *)a2 + 3) = objc_msgSend(v30, "sr_ntstatus");
        if (info)
        {
          unsigned int v45 = &_os_log_internal;
          id v46 = &_os_log_internal;
          if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR)) {
            smb2_smb_query_info_cold_4(buf, info, objc_msgSend(v30, "sr_ntstatus"));
          }
        }
        else
        {
          id v47 = objc_msgSend(v30, "smb_rq_getreply");
          v63[3] = (uint64_t)v47;
          uint64_t info = smb2_smb_parse_query_info(v15, v47, a2, v49, v50, v17);
        }
        objc_msgSend(v30, "smb_rq_done");
      }
    }
  }
LABEL_61:
  _Block_object_dispose(&v62, 8);

  return info;
}

void sub_23F84F59C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void piston_query_share_info(void *a1, int a2, uint64_t a3, void *a4, void *a5, void *a6)
{
  id v11 = a1;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = [v11 sock];

  if (!v15)
  {
    BOOL v18 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v18)
    {
      piston_query_share_info_cold_1(v18, v19, v20, v21, v22, v23, v24, v25);
      if (!v14) {
        goto LABEL_6;
      }
    }
    else if (!v14)
    {
      goto LABEL_6;
    }
    v14[2](v14, 57);
    goto LABEL_6;
  }
  id v16 = [v11 sock];
  id v17 = objc_msgSend(v16, "signing_queue");
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __piston_query_share_info_block_invoke;
  v26[3] = &unk_265072CA0;
  id v27 = v11;
  int v32 = a2;
  id v28 = v12;
  uint64_t v31 = a3;
  id v29 = v13;
  id v30 = v14;
  dispatch_async(v17, v26);

LABEL_6:
}

void __piston_query_share_info_block_invoke(uint64_t a1)
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  bzero(v39, 0x470uLL);
  bzero(v38, 0x470uLL);
  uint64_t v2 = [*(id *)(a1 + 32) getShare:*(unsigned int *)(a1 + 72)];
  if (v2)
  {
    id v3 = [[SMBNode alloc] init:*(void *)(a1 + 32)];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = [v3 commonInit:*(void *)(a1 + 32) onShareID:*(unsigned int *)(a1 + 72)];
      if (v5)
      {
        uint64_t v6 = v5;
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          __piston_query_share_info_block_invoke_cold_7();
        }
LABEL_6:
        uint64_t v7 = 0;
        goto LABEL_13;
      }
      uint64_t v17 = *(void *)([*(id *)(a1 + 32) getSessionPtr] + 560);
      int v18 = [v2 fstype];
      BOOL v20 = (*(void *)([*(id *)(a1 + 32) getSessionPtr] + 560) & 0x800) == 0 && v18 == 0;
      if ((v17 & 0xC0) != 0) {
        uint64_t v21 = 1;
      }
      else {
        uint64_t v21 = 17;
      }
      uint64_t fid = smb2_smb_create_fid(v4, 0, 0, 1048705, 2, 7, 1, v21, 0, 0, 0);
      if (fid)
      {
        uint64_t v6 = fid;
        if (piston_log_level && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          __piston_query_share_info_block_invoke_cold_6();
        }
        goto LABEL_6;
      }
      *(_WORD *)uint64_t v38 = 770;
      uint64_t info = smb2_smb_query_info(v4, v38, 0, 0, 0, 0, 0, 0);
      if (info)
      {
        uint64_t v6 = info;
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          __piston_query_share_info_block_invoke_cold_5();
        }
LABEL_32:
        uint64_t v7 = 0;
LABEL_45:
        if (smb2_smb_close_fid(v4, 0, 0)
          && piston_log_level
          && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
        {
          __piston_query_share_info_block_invoke_cold_3();
        }
        goto LABEL_13;
      }
      if (!v18)
      {
        *(_WORD *)__int16 v39 = 1282;
        uint64_t v37 = smb2_smb_query_info(v4, v39, 0, 0, 0, 0, 0, 0);
        if (v37)
        {
          uint64_t v6 = v37;
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
            __piston_query_share_info_block_invoke_cold_4();
          }
          goto LABEL_32;
        }
        if (v20) {
          smb2fs_smb_check_copyfile(v4);
        }
      }
      if ((*(unsigned char *)([*(id *)(a1 + 32) getSessionPtr] + 560) & 0x40) != 0)
      {
        if (*(void *)([*(id *)(a1 + 32) getSessionPtr] + 584)) {
          uint64_t v25 = 5;
        }
        else {
          uint64_t v25 = 1;
        }
        unint64_t v26 = v25 & 0xFFFFFFFFFFFFFDFFLL | ((((unint64_t)*(unsigned int *)([*(id *)(a1 + 32) getSessionPtr]+ 584) >> 4) & 1) << 9);
        unint64_t v27 = v26 & 0xFFFFFFFFFFFFFFF7 | (8
                                          * (((unint64_t)*(unsigned int *)([*(id *)(a1 + 32) getSessionPtr]+ 584) >> 1) & 1));
        unint64_t v28 = v27 & 0xFFFFFFFFFFFFFFEFLL | (16
                                          * (((unint64_t)*(unsigned int *)([*(id *)(a1 + 32) getSessionPtr]+ 584) >> 2) & 1));
        unint64_t v29 = v28 & 0xFFFFFFFFFFFFFFDFLL | (32
                                          * (((unint64_t)*(unsigned int *)([*(id *)(a1 + 32) getSessionPtr]+ 584) >> 3) & 1));
        unint64_t v30 = v29 & 0xFFFFFFFFFFFFFFBFLL | ((*(_DWORD *)([*(id *)(a1 + 32) getSessionPtr] + 592) & 1) << 6);
        unint64_t v31 = v30 & 0xFFFFFFFFFFFFFF7FLL | ((((unint64_t)*(unsigned int *)([*(id *)(a1 + 32) getSessionPtr]+ 592) >> 1) & 1) << 7);
        uint64_t v24 = v31 | (*(_DWORD *)([*(id *)(a1 + 32) getSessionPtr] + 592) << 6) & 0x100;
        if (*(void *)([*(id *)(a1 + 32) getSessionPtr] + 600))
        {
          uint64_t v7 = objc_msgSend([NSString alloc], "initWithCString:encoding:", *(void *)(objc_msgSend(*(id *)(a1 + 32), "getSessionPtr") + 600), 4);
          [*(id *)(a1 + 40) setString:v7];
LABEL_42:
          uint64_t v32 = (*(void *)([*(id *)(a1 + 32) getSessionPtr] + 560) >> 10) & 2 | v24;
          *(_DWORD *)(*(void *)(a1 + 64) + 16) = [v2 fstype];
          unsigned int v33 = objc_msgSend(v2, "file_system_name");

          if (v33)
          {
            int v34 = *(void **)(a1 + 48);
            uint64_t v35 = objc_msgSend(v2, "file_system_name");
            [v34 setString:v35];
          }
          *(_DWORD *)(*(void *)(a1 + 64) + 20) = objc_msgSend(v2, "file_system_attrs");
          *(_DWORD *)(*(void *)(a1 + 64) + 24) = objc_msgSend(v2, "max_component_name_len");
          objc_msgSend(v2, "statfs_lock");
          *(_DWORD *)(*(void *)(a1 + 64) + 28) = objc_msgSend(v2, "fs_block_size");
          *(void *)(*(void *)(a1 + 64) + 32) = objc_msgSend(v2, "fs_iosize");
          *(void *)(*(void *)(a1 + 64) + 40) = objc_msgSend(v2, "fs_blocks");
          *(void *)(*(void *)(a1 + 64) + 48) = objc_msgSend(v2, "fs_blocks_free");
          *(void *)(*(void *)(a1 + 64) + 56) = objc_msgSend(v2, "fs_blocks_avail");
          *(void *)(*(void *)(a1 + 64) + 64) = objc_msgSend(v2, "fs_files");
          *(void *)(*(void *)(a1 + 64) + 72) = objc_msgSend(v2, "fs_files_free");
          objc_msgSend(v2, "statfs_unlock");
          uint64_t v6 = 0;
          uint64_t v36 = *(void *)(a1 + 64);
          *(_DWORD *)uint64_t v36 = 0;
          *(void *)(v36 + 8) = v32;
          goto LABEL_45;
        }
      }
      else
      {
        uint64_t v24 = 0;
      }
      uint64_t v7 = 0;
      goto LABEL_42;
    }
    BOOL v8 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v8) {
      __piston_query_share_info_block_invoke_cold_2(v8, v9, v10, v11, v12, v13, v14, v15);
    }
    uint64_t v4 = 0;
    uint64_t v7 = 0;
    uint64_t v6 = 12;
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      __piston_query_share_info_block_invoke_cold_1();
    }
    uint64_t v4 = 0;
    uint64_t v7 = 0;
    uint64_t v6 = 22;
  }
LABEL_13:
  uint64_t v16 = *(void *)(a1 + 56);
  if (v16) {
    (*(void (**)(uint64_t, uint64_t))(v16 + 16))(v16, v6);
  }
}

uint64_t smb2_smb_parse_query_info(void *a1, void *a2, unsigned __int8 *a3, void *a4, void *a5, void *a6)
{
  v96[2] = *MEMORY[0x263EF8340];
  id v11 = a1;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  uint64_t v15 = [v11 pd];
  uint64_t v16 = [v15 getSessionPtr];

  int v94 = 0;
  size_t size = 0;
  uint64_t v92 = 0;
  uint64_t v89 = 0;
  uint64_t v90 = 0;
  uint64_t v95 = 0;
  v96[0] = 0;
  v96[1] = 0;
  uint64_t v88 = 0;
  uint64_t uint16le = md_get_uint16le(a2, (_WORD *)&v94 + 1);
  if (uint16le) {
    goto LABEL_13;
  }
  if (HIWORD(v94) != 9)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      smb2_smb_parse_query_info_cold_9();
    }
    uint64_t uint16le = 72;
    goto LABEL_13;
  }
  uint64_t uint16le = md_get_uint16le(a2, &v94);
  if (uint16le) {
    goto LABEL_13;
  }
  uint64_t uint16le = md_get_uint32le(a2, (_DWORD *)&size + 1);
  if (uint16le) {
    goto LABEL_13;
  }
  if ((_WORD)v94)
  {
    LOWORD(v94) = v94 - 72;
    uint64_t uint16le = md_get_mem(a2, 0, (unsigned __int16)v94, 0);
    if (uint16le) {
      goto LABEL_13;
    }
  }
  int v18 = *a3;
  if (v18 == 1 && a3[1] == 22)
  {
    uint64_t v19 = smb2_smb_parse_file_stream_info(v11, a2, (uint64_t)a3, v12, v14, SHIDWORD(size));
LABEL_39:
    uint64_t uint16le = v19;
    goto LABEL_13;
  }
  if (!HIDWORD(size))
  {
LABEL_64:
    uint64_t uint16le = 0;
    goto LABEL_13;
  }
  if (v18 == 3)
  {
    uint64_t v19 = smb2_smb_parse_security(a2, v14, HIDWORD(size));
    goto LABEL_39;
  }
  if (v18 == 2)
  {
    int v25 = a3[1];
    if (v25 == 3)
    {
      uint64_t v19 = smb2_smb_parse_fs_size(v11, a2, (uint64_t)a3);
      goto LABEL_39;
    }
    if (v25 == 5)
    {
      uint64_t v19 = smb2_smb_parse_fs_attr(v11, a2, (uint64_t)a3);
      goto LABEL_39;
    }
    goto LABEL_64;
  }
  if (v18 != 1) {
    goto LABEL_64;
  }
  uint64_t uint16le = 0;
  unsigned int v21 = a3[1];
  if (v21 <= 0x15)
  {
    switch(v21)
    {
      case 6u:
        uint64_t uint16le = md_get_uint64le(a2, &v92);
        if (!uint16le) {
          *((void *)a3 + 141) = v92;
        }
        break;
      case 0xEu:
        uint64_t uint16le = md_get_uint64le(a2, &v88);
        if (uint16le) {
          goto LABEL_13;
        }
        if (v14)
        {
          uint64_t v22 = &v88;
          uint64_t v23 = v14;
          uint64_t v24 = 8;
          goto LABEL_53;
        }
        BOOL v35 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
        if (v35) {
          smb2_smb_parse_query_info_cold_1(v35, v36, v37, v38, v39, v40, v41, v42);
        }
        goto LABEL_70;
      case 0x12u:
        uint64_t v19 = smb2_smb_parse_file_all_info(v16, a2, v13);
        goto LABEL_39;
    }
    goto LABEL_13;
  }
  if (a3[1] <= 0x2Fu)
  {
    if (v21 == 22)
    {
      BOOL v26 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
      if (v26) {
        smb2_smb_parse_query_info_cold_8(v26, v27, v28, v29, v30, v31, v32, v33);
      }
      goto LABEL_64;
    }
    if (v21 == 28)
    {
      uint64_t uint16le = md_get_uint64le(a2, &v89);
      if (!uint16le)
      {
        uint64_t uint16le = md_get_uint16le(a2, &v90);
        if (!uint16le)
        {
          uint64_t uint16le = md_get_uint8(a2, (char *)&v90 + 2);
          if (!uint16le)
          {
            uint64_t uint16le = md_get_uint8(a2, (char *)&v90 + 3);
            if (!uint16le)
            {
              uint64_t uint16le = md_get_uint8(a2, (char *)&v90 + 4);
              if (!uint16le)
              {
                uint64_t uint16le = md_get_mem(a2, (char *)&v90 + 5, 3, 0);
                if (!uint16le)
                {
                  if (v14)
                  {
                    uint64_t v22 = &v89;
                    uint64_t v23 = v14;
                    uint64_t v24 = 16;
LABEL_53:
                    [v23 appendBytes:v22 length:v24];
                    goto LABEL_64;
                  }
                  BOOL v80 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
                  if (v80) {
                    smb2_smb_parse_query_info_cold_1(v80, v81, v82, v83, v84, v85, v86, v87);
                  }
                  goto LABEL_70;
                }
              }
            }
          }
        }
      }
    }
    goto LABEL_13;
  }
  if (v21 == 48)
  {
    uint64_t uint16le = md_get_uint32le(a2, &size);
    if (uint16le) {
      goto LABEL_13;
    }
    size_t v34 = size;
    if (!size)
    {
      if (piston_log_level)
      {
        BOOL v43 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
        if (v43) {
          smb2_smb_parse_query_info_cold_3(v43, v44, v45, v46, v47, v48, v49, v50);
        }
      }
      goto LABEL_64;
    }
    if (size >> 4 >= 0xFFF)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        smb2_smb_parse_query_info_cold_4();
      }
      goto LABEL_70;
    }
    unint64_t v91 = size;
    uint64_t v51 = (char *)malloc_type_malloc(size, 0x36D362C8uLL);
    if (!v51)
    {
      uint64_t uint16le = 12;
      goto LABEL_13;
    }
    id v52 = v51;
    bzero(v51, v34);
    uint64_t uint16le = md_get_mem(a2, v52, v34, 0);
    if (!uint16le)
    {
      uint64_t v62 = smbfs_ntwrkname_tolocal((const UInt8 *)v52, &v91, 1);
      if (v62)
      {
        uint64_t v63 = v62;
        if (v14)
        {
          [v14 appendBytes:v62 length:v91];
          uint64_t uint16le = 0;
        }
        else
        {
          BOOL v72 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
          if (v72) {
            smb2_smb_parse_query_info_cold_1(v72, v73, v74, v75, v76, v77, v78, v79);
          }
          uint64_t uint16le = 22;
        }
        free(v52);
        id v53 = (char *)v63;
        goto LABEL_82;
      }
      BOOL v64 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
      if (v64) {
        smb2_smb_parse_query_info_cold_5(v64, v65, v66, v67, v68, v69, v70, v71);
      }
      uint64_t uint16le = 22;
    }
    id v53 = v52;
LABEL_82:
    free(v53);
    goto LABEL_13;
  }
  if (v21 == 59)
  {
    uint64_t uint16le = md_get_uint64le(a2, &v95);
    if (!uint16le)
    {
      uint64_t uint16le = md_get_mem(a2, (char *)v96, 16, 0);
      if (!uint16le)
      {
        if (v14)
        {
          uint64_t v22 = &v95;
          uint64_t v23 = v14;
          uint64_t v24 = 24;
          goto LABEL_53;
        }
        BOOL v54 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
        if (v54) {
          smb2_smb_parse_query_info_cold_1(v54, v55, v56, v57, v58, v59, v60, v61);
        }
LABEL_70:
        uint64_t uint16le = 22;
      }
    }
  }
LABEL_13:

  return uint16le;
}

uint64_t smb2_smb_parse_file_stream_info(void *a1, void *a2, uint64_t a3, void *a4, void *a5, int a6)
{
  id v11 = a1;
  id v12 = a4;
  id v13 = a5;
  id v14 = [v11 pd];
  uint64_t v15 = [v14 getSessionPtr];

  if (v12) {
    uint64_t v16 = (const char *)[v12 cStringUsingEncoding:4];
  }
  else {
    uint64_t v16 = 0;
  }
  BOOL v17 = v16 == 0;
  uint64_t v18 = *(void *)(a3 + 1080);
  unint64_t v19 = *(void *)(a3 + 1088);
  unint64_t v20 = *(void *)(a3 + 1096);
  int v21 = *(_DWORD *)(a3 + 1104);
  unint64_t v22 = *(void *)(a3 + 1112);
  unint64_t v23 = *(void *)(a3 + 1120);
  uint64_t v69 = v13;
  int v68 = v21;
  if (!a6)
  {
    char v45 = 0;
    int v46 = 0;
    int v24 = 0;
    unsigned int v47 = 93;
    int v38 = 32;
    goto LABEL_93;
  }
  BOOL v65 = v16 == 0;
  int v66 = 0;
  unint64_t v62 = *(void *)(a3 + 1112);
  unint64_t v63 = *(void *)(a3 + 1120);
  unint64_t v60 = *(void *)(a3 + 1096);
  unint64_t v61 = *(void *)(a3 + 1088);
  uint64_t v64 = *(void *)(a3 + 1080);
  int v67 = 0;
  int v24 = 0;
  if (v13) {
    BOOL v25 = 0;
  }
  else {
    BOOL v25 = v12 != 0;
  }
  if (v16) {
    BOOL v26 = v13 == 0;
  }
  else {
    BOOL v26 = 0;
  }
  BOOL v58 = v26;
  BOOL v59 = v25;
  uint64_t v27 = 23;
  if ((v21 & 0x10) != 0) {
    uint64_t v27 = 13;
  }
  unint64_t v57 = v27;
  uint64_t v28 = "com.apple.ResourceFork";
  if ((v21 & 0x10) != 0) {
    uint64_t v28 = "AFP_Resource";
  }
  uint64_t v56 = v28;
  while (1)
  {
    unint64_t v72 = 0;
    uint64_t v73 = 0;
    unint64_t v70 = 0;
    alloc_size_t size = 0;
    unsigned int uint32le = md_get_uint32le(a2, (_DWORD *)&v73 + 1);
    if (uint32le
      || (unsigned int uint32le = md_get_uint32le(a2, &v73)) != 0
      || (unsigned int uint32le = md_get_uint64le(a2, &v72)) != 0
      || (unsigned int uint32le = md_get_uint64le(a2, &alloc_size)) != 0)
    {
      unsigned int v47 = uint32le;
LABEL_86:
      int v38 = 0;
      goto LABEL_92;
    }
    if (*(unsigned char *)(v15 + 560) & 0x40) != 0 && (*(unsigned char *)(v15 + 584)) {
      alloc_size_t size = smb2_smb_get_alloc_size(v11, v72);
    }
    if (v73 > *(_DWORD *)(v15 + 80))
    {
      int v38 = 0;
      goto LABEL_91;
    }
    uint64_t v30 = (char *)malloc_type_malloc(v73, 0x5EFBB865uLL);
    if (!v30)
    {
      int v38 = 0;
      unsigned int v47 = 12;
      goto LABEL_92;
    }
    uint64_t v31 = v30;
    bzero(v30, v73);
    unsigned int mem = md_get_mem(a2, v31, v73, 0);
    if (mem)
    {
      unsigned int v47 = mem;
      free(v31);
      goto LABEL_86;
    }
    int v33 = v73;
    if (v73 < 2 || v31[(v73 - 1)])
    {
      unsigned int v34 = v73;
    }
    else
    {
      unsigned int v34 = v73;
      if (!v31[(v73 - 2)])
      {
        LODWORD(v73) = v73 - 2;
        unsigned int v34 = v33 - 2;
      }
    }
    unint64_t v70 = v34;
    BOOL v35 = (char *)smbfs_ntwrkname_tolocal((const UInt8 *)v31, &v70, 1);
    free(v31);
    if (v35)
    {
      if (v70 < 7 || *v35 != 58) {
        goto LABEL_42;
      }
      uint64_t v36 = &v35[v70 - 6];
      if (*(_DWORD *)v36 != 1094984762 || *(_WORD *)&v35[v70 - 2] != 16724) {
        goto LABEL_42;
      }
      if (v70 == 7)
      {
        int v67 = 1;
LABEL_42:
        free(v35);
        goto LABEL_43;
      }
      if (v70 - 6 > 0x80) {
        goto LABEL_42;
      }
      v70 -= 6;
      *uint64_t v36 = 0;
      uint64_t v40 = v35 + 1;
      unint64_t v55 = v70;
      if (v70 < 0x11)
      {
        if (v70 < 0xD)
        {
          if (v70 != 12) {
            goto LABEL_70;
          }
          goto LABEL_56;
        }
      }
      else if (!strncmp(v35 + 1, "com.apple.system.", 0x11uLL))
      {
        goto LABEL_42;
      }
      if (!strncasecmp(v35 + 1, "AFP_Resource", 0xDuLL))
      {
        v66 |= 1u;
        unint64_t v63 = alloc_size;
        if (v59)
        {
          unint64_t v62 = v72;
          unint64_t v70 = 13;
          uint64_t v40 = "AFP_Resource";
          uint64_t v41 = 13;
        }
        else
        {
          unint64_t v70 = v57;
          if (v69 && !v72)
          {
            unint64_t v62 = 0;
            goto LABEL_42;
          }
          unint64_t v62 = v72;
          uint64_t v40 = v56;
          uint64_t v41 = v57;
        }
        unint64_t v55 = v41;
        goto LABEL_68;
      }
LABEL_56:
      if (!strncasecmp(v35 + 1, "AFP_AfpInfo", 0xCuLL))
      {
        if (v58 || (v68 & 0x10) != 0)
        {
          unint64_t v70 = 12;
          unint64_t v55 = 12;
          uint64_t v40 = "AFP_AfpInfo";
        }
        else
        {
          unint64_t v70 = 21;
          unint64_t v55 = 21;
          uint64_t v40 = "com.apple.FinderInfo";
        }
        v66 |= 2u;
        if (!v72) {
          goto LABEL_42;
        }
      }
LABEL_68:
      if (!strncasecmp(v40, "AFP_DeskTop", 0xCuLL) || !strncasecmp(v40, "AFP_IdIndex", 0xCuLL))
      {
        if (v16)
        {
          int v42 = strncasecmp("AFP_DeskTop", v16, 0xCuLL);
          int v43 = v65;
          if (!v42) {
            int v43 = 1;
          }
          BOOL v65 = v43;
        }
        goto LABEL_42;
      }
LABEL_70:
      if (v69)
      {
        [v69 appendBytes:v40 length:v55];
      }
      else if (!v65 && v16)
      {
        unsigned int v44 = strnlen(v16, 0x100uLL);
        if (v55 >= v44 && !strncasecmp(v40, v16, v44))
        {
          BOOL v65 = 1;
          unint64_t v60 = alloc_size;
          unint64_t v61 = v72;
        }
        else
        {
          BOOL v65 = 0;
        }
        goto LABEL_42;
      }
      if (!v16) {
        v64 += v70;
      }
      goto LABEL_42;
    }
LABEL_43:
    int v38 = HIDWORD(v73);
    uint64_t v39 = (HIDWORD(v73) - (v33 + 24));
    if (HIDWORD(v73) > v33 + 24) {
      break;
    }
LABEL_46:
    ++v24;
    if (!v38)
    {
      unsigned int v47 = 0;
      goto LABEL_92;
    }
  }
  HIDWORD(v73) -= v33 + 24;
  if (v39 <= *(_DWORD *)(v15 + 80))
  {
    md_get_mem(a2, 0, v39, 0);
    int v38 = HIDWORD(v73);
    goto LABEL_46;
  }
  int v38 = 0;
  ++v24;
LABEL_91:
  unsigned int v47 = 72;
LABEL_92:
  unint64_t v23 = v63;
  uint64_t v18 = v64;
  unint64_t v20 = v60;
  unint64_t v19 = v61;
  unint64_t v22 = v62;
  char v45 = v66;
  int v46 = v67;
  BOOL v17 = v65;
LABEL_93:
  if (v46 == 1 && v24 == 1) {
    int v38 = 32;
  }
  int v49 = (v45 & 3 | v38) ^ 3;
  *(void *)(a3 + 1080) = v18;
  if (v45) {
    unint64_t v50 = v22;
  }
  else {
    unint64_t v50 = 0;
  }
  if (v45) {
    unint64_t v51 = v23;
  }
  else {
    unint64_t v51 = 0;
  }
  *(void *)(a3 + 1088) = v19;
  *(void *)(a3 + 1096) = v20;
  *(_DWORD *)(a3 + 1104) = v68;
  *(_DWORD *)(a3 + 1108) = v49;
  *(void *)(a3 + 1112) = v50;
  *(void *)(a3 + 1120) = v51;
  if (!v17 || v47 == 2) {
    uint64_t v53 = 93;
  }
  else {
    uint64_t v53 = v47;
  }

  return v53;
}

uint64_t smb2_smb_parse_file_all_info(uint64_t a1, void *a2, void *a3)
{
  uint64_t v66 = *MEMORY[0x263EF8340];
  id v5 = a3;
  size_t size = 0;
  unint64_t v49 = 0;
  int v47 = 0;
  size_t v46 = 0;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  uint64_t uint64le = md_get_uint64le(a2, &v49);
  if (uint64le) {
    goto LABEL_35;
  }
  if (v49) {
    smb_time_NT2local(v49, &v56);
  }
  uint64_t uint64le = md_get_uint64le(a2, &v49);
  if (uint64le) {
    goto LABEL_35;
  }
  if (v49) {
    smb_time_NT2local(v49, &v53);
  }
  uint64_t uint64le = md_get_uint64le(a2, &v49);
  if (uint64le) {
    goto LABEL_35;
  }
  if (v49) {
    smb_time_NT2local(v49, &v55);
  }
  uint64_t uint64le = md_get_uint64le(a2, &v49);
  if (uint64le) {
    goto LABEL_35;
  }
  if (v49) {
    smb_time_NT2local(v49, &v54);
  }
  uint64_t uint64le = md_get_uint32le(a2, (_DWORD *)&v51 + 2);
  if (uint64le) {
    goto LABEL_35;
  }
  if ((BYTE8(v51) & 0x10) != 0)
  {
    *(void *)&long long v51 = v51 | 1;
    int v7 = 2;
  }
  else
  {
    int v7 = 1;
  }
  DWORD2(v58) = v7;
  uint64_t uint64le = md_get_uint32le(a2, 0);
  if (uint64le) {
    goto LABEL_35;
  }
  uint64_t uint64le = md_get_uint64le(a2, (void *)&v52 + 1);
  if (uint64le) {
    goto LABEL_35;
  }
  uint64_t uint64le = md_get_uint64le(a2, &v52);
  if (uint64le) {
    goto LABEL_35;
  }
  uint64_t uint64le = md_get_uint32le(a2, 0);
  if (uint64le) {
    goto LABEL_35;
  }
  uint64_t uint64le = md_get_uint8(a2, 0);
  if (uint64le) {
    goto LABEL_35;
  }
  char v45 = a2;
  uint64_t uint64le = md_get_uint8(a2, 0);
  if (uint64le) {
    goto LABEL_35;
  }
  uint64_t uint64le = md_get_uint16(a2, 0);
  if (uint64le) {
    goto LABEL_35;
  }
  uint64_t uint64le = md_get_uint64le(a2, &v57);
  if (uint64le) {
    goto LABEL_35;
  }
  smb2fs_smb_file_id_check(a1, v57, 0, 0);
  uint64_t uint64le = md_get_uint32le(a2, &size);
  if (uint64le) {
    goto LABEL_35;
  }
  if ((BYTE9(v51) & 4) != 0)
  {
    DWORD2(v61) = size;
    if (size == -1610612724)
    {
      *(void *)&long long v51 = v51 | 1;
      DWORD2(v58) = 5;
    }
  }
  else
  {
    DWORD2(v61) = 0;
  }
  uint64_t uint64le = md_get_uint32le(a2, &v47);
  if (uint64le
    || (uint64_t uint64le = md_get_uint64le(a2, 0), uint64le)
    || (uint64_t uint64le = md_get_uint32le(a2, 0), uint64le)
    || (uint64_t uint64le = md_get_uint32le(a2, 0), uint64le)
    || (uint64_t uint64le = md_get_uint32le(a2, (_DWORD *)&size + 1), uint64le))
  {
LABEL_35:
    uint64_t v8 = uint64le;
    uint64_t v9 = 0;
    goto LABEL_36;
  }
  size_t v11 = HIDWORD(size);
  if (HIDWORD(size))
  {
    if (HIDWORD(size) >> 4 >= 0xFFF)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        smb2_smb_parse_file_all_info_cold_4();
      }
      uint64_t v9 = 0;
      uint64_t v8 = 22;
      goto LABEL_36;
    }
    size_t v46 = HIDWORD(size);
    int v24 = (char *)malloc_type_malloc(HIDWORD(size), 0x90248D1AuLL);
    if (!v24)
    {
      uint64_t v9 = 0;
      uint64_t v8 = 12;
      goto LABEL_36;
    }
    int v21 = v24;
    bzero(v24, v11);
    uint64_t mem = md_get_mem(v45, v21, v11, 0);
    if (mem)
    {
      uint64_t v23 = mem;
      uint64_t v9 = 0;
      unint64_t v20 = 0;
LABEL_64:
      free(v21);
      goto LABEL_65;
    }
    if (v11 == 2)
    {
      if (*v21 == 92 && !v21[1])
      {
LABEL_88:
        unint64_t v20 = 0;
        goto LABEL_46;
      }
    }
    else if (v11 < 2)
    {
LABEL_76:
      uint64_t v34 = v11 - 2;
      if (v11 <= 1) {
        uint64_t v34 = 0;
      }
      BOOL v35 = &v21[v34];
      if (v34 >= 1)
      {
        do
        {
          if (*v35 == 92 && !v35[1]) {
            break;
          }
          v35 -= 2;
        }
        while (v35 > v21);
      }
      if (*v35 == 92) {
        v35 += 2 * (v35[1] == 0);
      }
      size_t v46 = &v21[v11] - v35;
      uint64_t v36 = smbfs_ntwrkname_tolocal((const UInt8 *)v35, &v46, 1);
      if (v36)
      {
        unint64_t v20 = v36;
        goto LABEL_46;
      }
      BOOL v37 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
      if (v37) {
        smb2_smb_parse_file_all_info_cold_5(v37, v38, v39, v40, v41, v42, v43, v44);
      }
      goto LABEL_88;
    }
    if (!v21[v11 - 1] && !v21[v11 - 2])
    {
      size_t v46 = v11 - 2;
      v11 -= 2;
    }
    goto LABEL_76;
  }
  if (piston_log_level)
  {
    BOOL v12 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v12) {
      smb2_smb_parse_file_all_info_cold_3(v12, v13, v14, v15, v16, v17, v18, v19);
    }
  }
  unint64_t v20 = 0;
  int v21 = 0;
LABEL_46:
  if (v5)
  {
    v50[12] = v63;
    v50[13] = v64;
    v50[14] = v65;
    v50[8] = v59;
    v50[9] = v60;
    v50[10] = v61;
    v50[11] = v62;
    void v50[4] = v55;
    v50[5] = v56;
    v50[6] = v57;
    v50[7] = v58;
    v50[0] = v51;
    v50[1] = v52;
    v50[2] = v53;
    v50[3] = v54;
    [v5 setAttributes:v50];
    if (v20)
    {
      unint64_t v22 = (void *)[[NSString alloc] initWithCString:v20 encoding:4];
      uint64_t v9 = v22;
      if (v22 && (unint64_t)[v22 length] >= 0x100)
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          smb2_smb_parse_file_all_info_cold_2();
        }

        uint64_t v9 = 0;
        uint64_t v23 = 22;
        goto LABEL_62;
      }
    }
    else
    {
      uint64_t v9 = 0;
    }
    uint64_t v23 = 0;
LABEL_62:
    [v5 setName:v9];
    goto LABEL_63;
  }
  BOOL v26 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
  if (v26) {
    smb2_smb_parse_file_all_info_cold_1(v26, v27, v28, v29, v30, v31, v32, v33);
  }
  uint64_t v9 = 0;
  uint64_t v23 = 12;
LABEL_63:
  if (v21) {
    goto LABEL_64;
  }
LABEL_65:
  if (v20) {
    free(v20);
  }
  uint64_t v8 = v23;
LABEL_36:

  return v8;
}

uint64_t smb2_smb_parse_fs_attr(void *a1, void *a2, uint64_t a3)
{
  __src[130] = *MEMORY[0x263EF8340];
  id v5 = a1;
  bzero(__src, 0x410uLL);
  uint64_t v6 = objc_msgSend(v5, "pd", 0);
  int v7 = objc_msgSend(v6, "getShare:", objc_msgSend(v5, "shareID"));

  if (v7)
  {
    uint64_t uint32le = md_get_uint32le(a2, __src);
    if (!uint32le)
    {
      uint64_t uint32le = md_get_uint32le(a2, (_DWORD *)__src + 1);
      if (!uint32le)
      {
        if (HIDWORD(__src[0]) >= 0x1FF)
        {
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
            smb2_smb_parse_fs_attr_cold_5();
          }
          HIDWORD(__src[0]) = 510;
        }
        uint64_t uint32le = md_get_uint32le(a2, &__src[1]);
        if (!uint32le)
        {
          [v7 setFstype:1];
          objc_msgSend(v7, "setFile_system_attrs:", 0);
          objc_msgSend(v7, "setMax_component_name_len:", 255);
          objc_msgSend(v7, "setFile_system_attrs:", LODWORD(__src[0]));
          objc_msgSend(v7, "setMax_component_name_len:", HIDWORD(__src[0]));
          if ((LODWORD(__src[1]) - 1) >= 0x3FF)
          {
            memcpy((void *)(a3 + 16), __src, 0x410uLL);
            uint64_t uint32le = 0;
          }
          else
          {
            uint64_t v9 = (char *)malloc_type_malloc(LODWORD(__src[1]), 0x2D332C02uLL);
            if (v9)
            {
              uint64_t v10 = v9;
              bzero(v9, LODWORD(__src[1]));
              uint64_t mem = md_get_mem(a2, v10, LODWORD(__src[1]), 0);
              if (mem)
              {
                uint64_t uint32le = mem;
                BOOL v12 = 0;
LABEL_49:
                free(v10);

                goto LABEL_16;
              }
              size_t v36 = LODWORD(__src[1]);
              unint64_t v22 = smbfs_ntwrkname_tolocal((const UInt8 *)v10, &v36, 1);
              if (v22)
              {
                strncpy((char *)&__src[2], (const char *)v22, 0x400uLL);
                BOOL v12 = (void *)[[NSString alloc] initWithCString:v22 encoding:4];
                objc_msgSend(v7, "setFile_system_name:", v12);
                uint64_t uint32le = 0;
              }
              else
              {
                BOOL v23 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
                if (v23) {
                  smb2_smb_parse_fs_attr_cold_4(v23, v24, v25, v26, v27, v28, v29, v30);
                }
                BOOL v12 = 0;
                uint64_t uint32le = 72;
              }
              uint64_t v31 = [v5 pd];
              uint64_t v32 = *(void *)([v31 getSessionPtr] + 560);

              if ((v32 & 0x40) != 0)
              {
                uint64_t v35 = 7;
LABEL_39:
                [v7 setFstype:v35];
LABEL_44:
                if (piston_log_level && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
                  smb2_smb_parse_fs_attr_cold_3(v7);
                }
                memcpy((void *)(a3 + 16), __src, 0x410uLL);
                if (v22) {
                  free(v22);
                }
                goto LABEL_49;
              }
              if (!v22) {
                goto LABEL_44;
              }
              size_t v33 = v36 + 1;
              size_t v36 = v33;
              if (!strncmp((const char *)v22, "FAT", v33)
                || !strncmp((const char *)v22, "FAT12", v33)
                || !strncmp((const char *)v22, "FAT16", v33)
                || !strncmp((const char *)v22, "FAT32", v33))
              {
                uint64_t v34 = 1;
              }
              else if (!strncmp((const char *)v22, "CDFS", v33))
              {
                uint64_t v34 = 2;
              }
              else if (!strncmp((const char *)v22, "UDF", v33))
              {
                uint64_t v34 = 3;
              }
              else
              {
                if (strncmp((const char *)v22, "NTFS", v33)
                  && strncmp((const char *)v22, "ReFS", v33)
                  && strncmp((const char *)v22, "MAFS", v33))
                {
                  goto LABEL_42;
                }
                uint64_t v34 = 4;
              }
              [v7 setFstype:v34];
LABEL_42:
              if ([v7 fstype] != 4
                || (objc_msgSend(v7, "file_system_attrs") & 0x40000) == 0)
              {
                goto LABEL_44;
              }
              uint64_t v35 = 5;
              goto LABEL_39;
            }
            BOOL v14 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
            if (v14) {
              smb2_smb_parse_fs_attr_cold_2(v14, v15, v16, v17, v18, v19, v20, v21);
            }
            uint64_t uint32le = 12;
          }
        }
      }
    }
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      smb2_smb_parse_fs_attr_cold_1(v5);
    }
    uint64_t uint32le = 22;
  }
LABEL_16:

  return uint32le;
}

uint64_t smb2_smb_parse_fs_size(void *a1, void *a2, uint64_t a3)
{
  id v5 = a1;
  uint64_t v6 = [v5 pd];
  long long v17 = 0uLL;
  uint64_t v18 = 0;
  int v7 = objc_msgSend(v6, "getShare:", objc_msgSend(v5, "shareID"));
  if (v7)
  {
    uint64_t uint64le = md_get_uint64le(a2, &v17);
    if (!uint64le)
    {
      uint64_t uint64le = md_get_uint64le(a2, (void *)&v17 + 1);
      if (!uint64le)
      {
        uint64_t uint64le = md_get_uint32le(a2, &v18);
        if (!uint64le)
        {
          uint64_t uint64le = md_get_uint32le(a2, (_DWORD *)&v18 + 1);
          if (!uint64le)
          {
            objc_msgSend(v7, "setTotal_alloc_units:", (void)v17);
            objc_msgSend(v7, "setAvail_alloc_units:", *((void *)&v17 + 1));
            objc_msgSend(v7, "setSectors_per_alloc_unit:", v18);
            objc_msgSend(v7, "setBytes_per_sector:", HIDWORD(v18));
            uint64_t v9 = objc_msgSend(v7, "total_alloc_units");
            uint64_t v10 = objc_msgSend(v7, "avail_alloc_units");
            int v11 = objc_msgSend(v7, "bytes_per_sector");
            uint64_t v12 = objc_msgSend(v7, "sectors_per_alloc_unit") * v11;
            objc_msgSend(v7, "statfs_lock");
            objc_msgSend(v7, "setFs_block_size:", v12);
            objc_msgSend(v7, "setFs_blocks:", v9);
            objc_msgSend(v7, "setFs_blocks_free:", v10);
            objc_msgSend(v7, "setFs_blocks_avail:", v10);
            objc_msgSend(v7, "setFs_files:", v9 - 2);
            objc_msgSend(v7, "setFs_files_free:", v10);
            unsigned int v13 = *(_DWORD *)([v6 getSessionPtr] + 84);
            if (*(_DWORD *)([v6 getSessionPtr] + 88) > v13) {
              unsigned int v13 = *(_DWORD *)([v6 getSessionPtr] + 88);
            }
            unint64_t v14 = 0x1000 / (4096 - (v13 & 0xFFF)) * (unint64_t)v13;
            if (v14 <= 0x100000) {
              unint64_t v14 = 0x100000;
            }
            if (v14 >= 0x4000000) {
              uint64_t v15 = 0x4000000;
            }
            else {
              uint64_t v15 = v14;
            }
            objc_msgSend(v7, "setFs_iosize:", v15);
            objc_msgSend(v7, "statfs_unlock");
            uint64_t uint64le = 0;
            *(_OWORD *)(a3 + 1056) = v17;
            *(void *)(a3 + 1072) = v18;
          }
        }
      }
    }
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      smb2_smb_parse_fs_size_cold_1(v5);
    }
    uint64_t uint64le = 22;
  }

  return uint64le;
}

uint64_t smb2_smb_parse_security(void *a1, void *a2, unsigned int a3)
{
  id v5 = a2;
  if (v5)
  {
    if (a3 < 0x14)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        smb2_smb_parse_security_cold_3();
      }
      uint64_t mem = 72;
    }
    else
    {
      uint64_t v6 = a3;
      int v7 = (char *)malloc_type_malloc(a3, 0x1285D28CuLL);
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t mem = md_get_mem(a1, v7, v6, 0);
        if (mem)
        {
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
            smb2_smb_parse_security_cold_2();
          }
        }
        else
        {
          [v5 appendBytes:v8 length:v6];
        }
        free(v8);
      }
      else
      {
        uint64_t mem = 12;
      }
    }
  }
  else
  {
    BOOL v10 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v10) {
      smb2_smb_parse_security_cold_1(v10, v11, v12, v13, v14, v15, v16, v17);
    }
    uint64_t mem = 22;
  }

  return mem;
}

void __smb2_smb_query_info_block_invoke(uint64_t a1, uint64_t info)
{
  uint64_t v4 = (void (**)(void, void))MEMORY[0x2455D48A0](*(void *)(a1 + 72));
  id v5 = (id *)(a1 + 32);
  *(_DWORD *)(*(void *)(a1 + 88) + 12) = objc_msgSend(*(id *)(a1 + 32), "sr_ntstatus");
  if (info)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      __smb2_smb_query_info_block_invoke_cold_1((id *)(a1 + 32));
    }
  }
  else
  {
    *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "smb_rq_getreply");
    uint64_t info = smb2_smb_parse_query_info(*(void **)(a1 + 40), *(void **)(*(void *)(*(void *)(a1 + 80) + 8) + 24), *(unsigned __int8 **)(a1 + 88), *(void **)(a1 + 48), *(void **)(a1 + 56), *(void **)(a1 + 64));
  }
  if (*v5) {
    objc_msgSend(*v5, "smb_rq_done");
  }
  if (v4) {
    v4[2](v4, info);
  }
}

uint64_t smb2fs_smb_listxattrs(void *a1, void *a2, size_t *a3)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v5 = a1;
  bzero(v30, 0x470uLL);
  id v6 = objc_alloc_init(MEMORY[0x263EFF990]);
  if (!v6)
  {
    BOOL v13 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v13) {
      smb2fs_smb_listxattrs_cold_1(v13, v14, v15, v16, v17, v18, v19, v20);
    }
    goto LABEL_17;
  }
  *(_WORD *)uint64_t v30 = 5633;
  int v32 = 16;
  uint64_t info = smb2_smb_query_info(v5, v30, 0, 0, 0, 0, 0, 0);
  if (info)
  {
    uint64_t v8 = info;
    if (info != 93)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        smb2fs_smb_listxattrs_cold_2();
      }
      goto LABEL_18;
    }
  }
  size_t v9 = size;
  if (!size)
  {
    uint64_t v8 = 0;
LABEL_18:
    *a2 = 0;
    *a3 = 0;
    goto LABEL_19;
  }
  BOOL v10 = malloc_type_malloc(size, 0xE1DC7F6CuLL);
  if (!v10)
  {
    BOOL v21 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v21) {
      smb2fs_smb_listxattrs_cold_3(v21, v22, v23, v24, v25, v26, v27, v28);
    }
LABEL_17:
    uint64_t v8 = 12;
    goto LABEL_18;
  }
  uint64_t v11 = v10;
  bzero(v30, 0x470uLL);
  *(_WORD *)uint64_t v30 = 5633;
  int v32 = 16;
  uint64_t v12 = smb2_smb_query_info(v5, v30, 0, 0, 0, v6, 0, 0);
  if (v12)
  {
    uint64_t v8 = v12;
    if (v12 != 93)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        smb2fs_smb_listxattrs_cold_2();
      }
      free(v11);
      goto LABEL_18;
    }
  }
  if ([v6 length] <= v9)
  {
    objc_msgSend(v6, "getBytes:length:", v11, objc_msgSend(v6, "length"));
    size_t v9 = [v6 length];
  }
  else
  {
    [v6 getBytes:v11 length:v9];
  }
  uint64_t v8 = 0;
  *a3 = v9;
  *a2 = v11;
LABEL_19:

  return v8;
}

void OUTLINED_FUNCTION_5(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

void OUTLINED_FUNCTION_6(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

uint64_t mbuf_free(void *a1)
{
  if (!a1) {
    return 0;
  }
  uint64_t v2 = a1[5];
  if (!*(_DWORD *)a1 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    mbuf_free_cold_1();
  }
  if (*((unsigned char *)a1 + 4))
  {
    uint64_t v4 = (void (*)(void, void, void))a1[6];
    if (v4) {
      v4(a1[7], a1[1], a1[4]);
    }
  }
  else
  {
    id v3 = (void *)a1[4];
    if (v3) {
      free(v3);
    }
  }
  free(a1);
  return v2;
}

uint64_t smb_mbuf_get(int a1, int a2, void *a3, size_t a4)
{
  uint64_t result = 22;
  if (!a1 && a2 == 1)
  {
    uint64_t v8 = (char *)malloc_type_malloc(0x50uLL, 0x10B0040FDA39B43uLL);
    if (v8)
    {
      size_t v9 = v8;
      *((_OWORD *)v8 + 4) = 0u;
      *(_OWORD *)(v8 + 52) = 0u;
      *(_OWORD *)(v8 + 36) = 0u;
      *(_OWORD *)(v8 + 20) = 0u;
      *(_OWORD *)(v8 + 4) = 0u;
      *(_DWORD *)uint64_t v8 = 1;
      if (!a4)
      {
LABEL_7:
        uint64_t result = 0;
        *a3 = v9;
        return result;
      }
      BOOL v10 = malloc_type_malloc(a4, 0xC2A01180uLL);
      v9[4] = v10;
      if (v10)
      {
        v9[1] = a4;
        goto LABEL_7;
      }
      mbuf_free(v9);
    }
    return 12;
  }
  return result;
}

void *mbuf_freem(void *result)
{
  for (; result; uint64_t result = (void *)mbuf_free(result))
    ;
  return result;
}

uint64_t mbuf_gethdr(int a1, int a2, void *a3)
{
  int v6 = getpagesize();
  uint64_t result = smb_mbuf_get(a1, a2, a3, v6);
  if (!result) {
    *(_DWORD *)(*a3 + 4) |= 6u;
  }
  return result;
}

uint64_t mbuf_get(int a1, int a2, void *a3)
{
  size_t v6 = getpagesize();
  return smb_mbuf_get(a1, a2, a3, v6);
}

uint64_t mbuf_get_chain_len(uint64_t a1)
{
  for (uint64_t i = 0; a1; a1 = *(void *)(a1 + 40))
    i += *(void *)(a1 + 16);
  return i;
}

uint64_t mbuf_len(uint64_t result)
{
  if (result) {
    return *(void *)(result + 16);
  }
  return result;
}

uint64_t mbuf_next(uint64_t result)
{
  if (result) {
    return *(void *)(result + 40);
  }
  return result;
}

uint64_t mbuf_getcluster(int a1, int a2, size_t a3, void *a4)
{
  uint64_t v8 = (void *)*a4;
  if (*a4)
  {
    do
      uint64_t v8 = (void *)mbuf_free(v8);
    while (v8);
    *a4 = 0;
  }
  uint64_t result = smb_mbuf_get(a1, a2, a4, a3);
  if (!result)
  {
    if (*a4) {
      *(_DWORD *)(*a4 + 4) |= 6u;
    }
  }
  return result;
}

uint64_t mbuf_attachcluster(int a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t result = 22;
  if (a4 && a6)
  {
    uint64_t v14 = *(_OWORD **)a3;
    if (*(void *)a3)
    {
      uint64_t v15 = (void *)*((void *)v14 + 4);
      if (v15)
      {
        free(v15);
        *(void *)(*(void *)a3 + 32) = 0;
        uint64_t v14 = *(_OWORD **)a3;
      }
LABEL_10:
      uint64_t result = 0;
      *((_DWORD *)v14 + 1) = 7;
      *((void *)v14 + 1) = a6;
      *((void *)v14 + 4) = a4;
      *(void *)(*(void *)a3 + 48) = a5;
      *(void *)(*(void *)a3 + 56) = a7;
      return result;
    }
    uint64_t result = 22;
    if (!a1 && a2 == 1)
    {
      uint64_t v16 = malloc_type_malloc(0x50uLL, 0x10B0040FDA39B43uLL);
      if (!v16) {
        return 12;
      }
      uint64_t v14 = v16;
      v16[4] = 0u;
      *(_OWORD *)((char *)v16 + 52) = 0u;
      *(_OWORD *)((char *)v16 + 36) = 0u;
      *(_OWORD *)((char *)v16 + 20) = 0u;
      *(_OWORD *)((char *)v16 + 4) = 0u;
      *(_DWORD *)uint64_t v16 = 1;
      *(void *)a3 = v16;
      goto LABEL_10;
    }
  }
  return result;
}

uint64_t mbuf_maxlen(uint64_t result)
{
  if (result) {
    return *(void *)(result + 8);
  }
  return result;
}

uint64_t mbuf_setlen(uint64_t result, uint64_t a2)
{
  if (result) {
    *(void *)(result + 16) = a2;
  }
  return result;
}

uint64_t mbuf_pkthdr_len(uint64_t a1)
{
  return *(void *)(a1 + 24);
}

uint64_t mbuf_pkthdr_setlen(uint64_t result, uint64_t a2)
{
  *(void *)(result + 24) = a2;
  return result;
}

uint64_t mbuf_pkthdr_adjustlen(uint64_t result, int a2)
{
  *(void *)(result + 24) += a2;
  return result;
}

uint64_t mbuf_setnext(uint64_t a1, _DWORD *a2)
{
  if (!a2 || !*a2) {
    return 22;
  }
  int v2 = *(_DWORD *)(a1 + 4);
  if ((v2 & 4) != 0)
  {
    *(_DWORD *)(a1 + 4) = v2 & 0xFFFFFFFB;
    a2[1] |= 4u;
  }
  uint64_t v3 = 0;
  *(void *)(a1 + 40) = a2;
  return v3;
}

uint64_t mbuf_is_write(uint64_t a1, void *a2, void *a3)
{
  if ((*(unsigned char *)(a1 + 4) & 8) == 0) {
    return 0;
  }
  uint64_t v4 = *(void *)(a1 + 72);
  *a2 = *(void *)(a1 + 64);
  *a3 = v4;
  return 1;
}

uint64_t mbuf_set_write(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_DWORD *)(a1 + 4) |= 8u;
  *(void *)(a1 + 64) = a2;
  *(void *)(a1 + 72) = a3;
  return 0;
}

uint64_t mbuf_data(uint64_t result)
{
  if (result) {
    return *(void *)(result + 32);
  }
  return result;
}

uint64_t mbuf_trailingspace(uint64_t a1)
{
  return *(void *)(a1 + 8) - *(void *)(a1 + 16);
}

uint64_t mbuf_copydata(void *a1, unint64_t a2, size_t a3, char *__dst)
{
  size_t v5 = a3;
  if (a2)
  {
    while (a1)
    {
      unint64_t v7 = a1[2];
      BOOL v8 = a2 >= v7;
      unint64_t v9 = a2 - v7;
      if (!v8) {
        goto LABEL_7;
      }
      a1 = (void *)a1[5];
      a2 = v9;
      if (!v9)
      {
        a2 = 0;
        goto LABEL_7;
      }
    }
  }
  else
  {
LABEL_7:
    if (!a3) {
      return 0;
    }
    while (a1)
    {
      if (a1[2] - a2 >= v5) {
        size_t v10 = v5;
      }
      else {
        size_t v10 = a1[2] - a2;
      }
      memmove(__dst, (const void *)(a1[4] + a2), v10);
      a2 = 0;
      __dst += v10;
      a1 = (void *)a1[5];
      v5 -= v10;
      if (!v5) {
        return 0;
      }
    }
  }
  return 22;
}

uint64_t mbuf_split(void *a1, unint64_t a2, uint64_t a3, void *a4)
{
  if (!a1)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      mbuf_split_cold_1();
    }
    return 22;
  }
  unint64_t v7 = a1 + 1;
  unint64_t v6 = a1[1];
  size_t v8 = v6 - a2;
  if (v6 < a2)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      mbuf_split_cold_2(v7, a2);
    }
    return 22;
  }
  int v11 = smb_mbuf_get(0, 1, a4, v8);
  if (v11)
  {
    int v12 = v11;
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      mbuf_split_cold_3(v12);
    }
    return 12;
  }
  else
  {
    if (*a4) {
      BOOL v13 = *(void **)(*a4 + 32);
    }
    else {
      BOOL v13 = 0;
    }
    memmove(v13, (const void *)(a1[4] + a2), v8);
    if (*a4)
    {
      uint64_t result = 0;
      *(void *)(*a4 + 16) = v8;
    }
    else
    {
      uint64_t result = 12;
    }
    a1[2] = a2;
  }
  return result;
}

uint64_t m_fixhdr(uint64_t a1)
{
  uint64_t v1 = 0;
  if (a1)
  {
    uint64_t v2 = a1;
    do
    {
      v1 += *(void *)(v2 + 16);
      uint64_t v2 = *(void *)(v2 + 40);
    }
    while (v2);
  }
  *(void *)(a1 + 24) = v1;
  return v1;
}

uint64_t mbuf_concatenate(uint64_t result, _DWORD *a2)
{
  if (result)
  {
    uint64_t v2 = result;
    do
    {
      uint64_t v3 = v2;
      uint64_t v2 = *(void *)(v2 + 40);
    }
    while (v2);
    if (a2 && *a2)
    {
      int v4 = *(_DWORD *)(v3 + 4);
      if ((v4 & 4) != 0)
      {
        *(_DWORD *)(v3 + 4) = v4 & 0xFFFFFFFB;
        a2[1] |= 4u;
      }
      *(void *)(v3 + 40) = a2;
    }
  }
  return result;
}

uint64_t mb_pullup(void *a1)
{
  uint64_t v11 = 0;
  uint64_t v1 = (void *)*a1;
  if (!*a1 || !v1[5]) {
    return 0;
  }
  size_t v3 = 0;
  int v4 = (void *)*a1;
  do
  {
    v3 += v4[2];
    int v4 = (void *)v4[5];
  }
  while (v4);
  v1[3] = v3;
  uint64_t v5 = mbuf_getcluster(0, 1, v3, &v11);
  if (!v5)
  {
    unint64_t v6 = (void *)*a1;
    unint64_t v7 = (void *)v11;
    if (v11)
    {
      uint64_t v8 = mbuf_copydata(v6, 0, v3, *(char **)(v11 + 32));
      if (v8)
      {
        uint64_t v5 = v8;
        do
          unint64_t v7 = (void *)mbuf_free(v7);
        while (v7);
        return v5;
      }
    }
    else
    {
      uint64_t v5 = mbuf_copydata(v6, 0, v3, 0);
      if (v5) {
        return v5;
      }
    }
    v7[2] = v3;
    v7[3] = v3;
    size_t v10 = (void *)*a1;
    if (*a1)
    {
      do
        size_t v10 = (void *)mbuf_free(v10);
      while (v10);
    }
    uint64_t v5 = 0;
    *a1 = v7;
    a1[1] = v7;
  }
  return v5;
}

uint64_t mb_fixhdr(uint64_t *a1)
{
  uint64_t v1 = *a1;
  if (*a1)
  {
    uint64_t result = 0;
    uint64_t v3 = v1;
    do
    {
      result += *(void *)(v3 + 16);
      uint64_t v3 = *(void *)(v3 + 40);
    }
    while (v3);
  }
  else
  {
    uint64_t result = 0;
  }
  *(void *)(v1 + 24) = result;
  return result;
}

uint64_t mb_getbuffer(uint64_t a1, unint64_t a2)
{
  unint64_t v3 = *(void *)(a1 + 16);
  if (v3 >= a2)
  {
    uint64_t v5 = *(void *)(a1 + 8);
    if (v5)
    {
LABEL_13:
      uint64_t v9 = *(void *)(v5 + 32);
      uint64_t v5 = *(void *)(v5 + 16);
    }
    else
    {
      uint64_t v9 = 0;
    }
    return v9 + v5;
  }
  else
  {
    while (1)
    {
      uint64_t v11 = 0;
      if (mbuf_getcluster(0, 1, v3 + a2, &v11)) {
        return 0;
      }
      uint64_t v5 = v11;
      if (v11)
      {
        *(void *)(v11 + 16) = 0;
        if (*(_DWORD *)v5)
        {
          uint64_t v6 = *(void *)(a1 + 8);
          int v7 = *(_DWORD *)(v6 + 4);
          if ((v7 & 4) != 0)
          {
            *(_DWORD *)(v6 + 4) = v7 & 0xFFFFFFFB;
            *(_DWORD *)(v5 + 4) |= 4u;
          }
          uint64_t v8 = 0;
          *(void *)(v6 + 40) = v5;
        }
        else
        {
          uint64_t v8 = 0;
        }
      }
      else
      {
        uint64_t v8 = MEMORY[0x10];
      }
      unint64_t v3 = *(void *)(v5 + 8) - v8 + *(void *)(a1 + 16);
      *(void *)(a1 + 8) = v5;
      *(void *)(a1 + 16) = v3;
      if (v3 >= a2) {
        goto LABEL_13;
      }
    }
  }
}

uint64_t mb_consume(uint64_t result, unint64_t a2)
{
  uint64_t v2 = *(void *)(result + 8);
  *(void *)(result + 16) -= a2;
  *(int64x2_t *)(result + 24) = vaddq_s64(*(int64x2_t *)(result + 24), vdupq_n_s64(a2));
  if (v2) {
    *(void *)(v2 + 16) += a2;
  }
  return result;
}

double mb_initm(uint64_t a1, uint64_t a2)
{
  double result = 0.0;
  *(void *)(a1 + 32) = 0;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(void *)a1 = a2;
  *(void *)(a1 + 8) = a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 8) - *(void *)(a2 + 16);
  return result;
}

double mb_init(uint64_t a1)
{
  uint64_t v4 = 0;
  if (!mbuf_gethdr(0, 1, &v4))
  {
    uint64_t v3 = v4;
    double result = 0.0;
    *(void *)(a1 + 32) = 0;
    *(_OWORD *)a1 = 0u;
    *(_OWORD *)(a1 + 16) = 0u;
    *(void *)a1 = v3;
    *(void *)(a1 + 8) = v3;
    *(void *)(a1 + 16) = *(void *)(v3 + 8) - *(void *)(v3 + 16);
  }
  return result;
}

void *mb_done(void **a1)
{
  double result = *a1;
  if (result)
  {
    do
      double result = (void *)mbuf_free(result);
    while (result);
    *a1 = 0;
  }
  return result;
}

uint64_t mb_detach(uint64_t *a1)
{
  uint64_t v1 = *a1;
  *a1 = 0;
  return v1;
}

uint64_t mb_reserve(uint64_t a1, unint64_t a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v5 = *(void *)(a1 + 8);
  unint64_t v4 = *(void *)(a1 + 16);
  if (v4 >= a2)
  {
    uint64_t v9 = *(void *)(a1 + 8);
    goto LABEL_9;
  }
  uint64_t v13 = 0;
  int v6 = getpagesize();
  int v7 = smb_mbuf_get(0, 1, &v13, v6);
  uint64_t result = 0;
  if (v7) {
    return result;
  }
  uint64_t v9 = v13;
  if (v13)
  {
    unint64_t v4 = *(void *)(v13 + 8);
    if (v4 < a2)
    {
      if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        goto LABEL_6;
      }
      uint64_t v12 = *(void *)(v9 + 8);
      goto LABEL_21;
    }
    if (*(_DWORD *)v13)
    {
      int v11 = *(_DWORD *)(v5 + 4);
      if ((v11 & 4) != 0)
      {
        *(_DWORD *)(v5 + 4) = v11 & 0xFFFFFFFB;
        *(_DWORD *)(v9 + 4) |= 4u;
      }
      *(void *)(v5 + 40) = v9;
    }
    *(void *)(a1 + 8) = v9;
    *(void *)(v9 + 16) = 0;
LABEL_9:
    *(void *)(a1 + 16) = v4 - a2;
    *(int64x2_t *)(a1 + 24) = vaddq_s64(*(int64x2_t *)(a1 + 24), vdupq_n_s64(a2));
    if (v9)
    {
      uint64_t v10 = *(void *)(v9 + 16);
      uint64_t result = *(void *)(v9 + 32) + v10;
      *(void *)(v9 + 16) = v10 + a2;
      return result;
    }
    return 0;
  }
  if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    return 0;
  }
  uint64_t v12 = 0;
LABEL_21:
  if (mb_reserve_cold_1(buf, a2, v12, v9 == 0)) {
    return 0;
  }
  do
  {
LABEL_6:
    uint64_t result = mbuf_free((void *)v9);
    uint64_t v9 = result;
  }
  while (result);
  return result;
}

uint64_t mb_put_padbyte(uint64_t a1)
{
  char __src = 0;
  uint64_t v1 = *(void *)(a1 + 8);
  if (v1)
  {
    uint64_t v2 = *(void *)(v1 + 32);
    uint64_t v1 = *(void *)(v1 + 16);
  }
  else
  {
    LODWORD(v2) = 0;
  }
  if ((v2 + v1)) {
    return mb_put_mem(a1, &__src, 1uLL, 0);
  }
  else {
    return 0;
  }
}

uint64_t mb_put_mem(uint64_t a1, char *__src, size_t a3, int a4)
{
  uint64_t v5 = *(void **)(a1 + 8);
  size_t v6 = *(void *)(a1 + 16);
  if (!a3) {
    goto LABEL_34;
  }
  size_t v8 = a3;
  while (2)
  {
    if (v6) {
      goto LABEL_19;
    }
    do
    {
      if (v5)
      {
        uint64_t v10 = (void *)v5[5];
        if (v10) {
          goto LABEL_17;
        }
        uint64_t v25 = 0;
        int v11 = mbuf_getcluster(0, 1, v8, &v25);
        uint64_t v12 = v5;
        if (v11) {
          return 55;
        }
        do
        {
          uint64_t v13 = v12;
          uint64_t v12 = (void *)v12[5];
        }
        while (v12);
        uint64_t v14 = v25;
        if (v25 && *v25)
        {
          int v15 = *((_DWORD *)v13 + 1);
          if ((v15 & 4) != 0)
          {
            *((_DWORD *)v13 + 1) = v15 & 0xFFFFFFFB;
            v14[1] |= 4u;
          }
          v13[5] = v14;
        }
      }
      else
      {
        uint64_t v25 = 0;
        if (mbuf_getcluster(0, 1, v8, &v25)) {
          return 55;
        }
        uint64_t v5 = v25;
      }
      if (!v5) {
        return 55;
      }
      uint64_t v10 = (void *)v5[5];
LABEL_17:
      uint64_t v16 = v10[1];
      uint64_t v17 = v10[2];
      uint64_t v5 = v10;
      size_t v6 = v16 - v17;
    }
    while (v16 == v17);
    uint64_t v5 = v10;
LABEL_19:
    if (v6 >= v8) {
      size_t v18 = v8;
    }
    else {
      size_t v18 = v6;
    }
    if (v5)
    {
      uint64_t v19 = v5[4];
      if (v19)
      {
        uint64_t v20 = (unsigned char *)(v19 + v5[2]);
        if (a4)
        {
          if (a4 == 3)
          {
            bzero(v20, v18);
          }
          else if (a4 == 2 && v18)
          {
            size_t v21 = v18;
            uint64_t v22 = __src;
            do
            {
              char v23 = *v22++;
              *v20++ = v23;
              --v21;
            }
            while (v21);
          }
        }
        else
        {
          memmove(v20, __src, v18);
        }
        __src += v18;
        v5[2] += v18;
        v6 -= v18;
        *(int64x2_t *)(a1 + 24) = vaddq_s64(*(int64x2_t *)(a1 + 24), vdupq_n_s64(v18));
        v8 -= v18;
        if (!v8)
        {
LABEL_34:
          uint64_t result = 0;
          *(void *)(a1 + 8) = v5;
          *(void *)(a1 + 16) = v6;
          return result;
        }
        continue;
      }
    }
    return 55;
  }
}

uint64_t mb_put_uint8(uint64_t a1, char a2)
{
  char __src = a2;
  return mb_put_mem(a1, &__src, 1uLL, 0);
}

uint64_t mb_put_uint16be(uint64_t a1, unsigned int a2)
{
  __int16 __src = __rev16(a2);
  return mb_put_mem(a1, (char *)&__src, 2uLL, 0);
}

uint64_t mb_put_uint16le(uint64_t a1, __int16 a2)
{
  __int16 __src = a2;
  return mb_put_mem(a1, (char *)&__src, 2uLL, 0);
}

uint64_t mb_put_uint32be(uint64_t a1, unsigned int a2)
{
  unsigned int __src = bswap32(a2);
  return mb_put_mem(a1, (char *)&__src, 4uLL, 0);
}

uint64_t mb_put_uint32le(uint64_t a1, int a2)
{
  int __src = a2;
  return mb_put_mem(a1, (char *)&__src, 4uLL, 0);
}

uint64_t mb_put_uint64be(uint64_t a1, unint64_t a2)
{
  unint64_t __src = bswap64(a2);
  return mb_put_mem(a1, (char *)&__src, 8uLL, 0);
}

uint64_t mb_put_uint64le(uint64_t a1, uint64_t a2)
{
  uint64_t __src = a2;
  return mb_put_mem(a1, (char *)&__src, 8uLL, 0);
}

uint64_t mb_put_mbuf(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    if (*(_DWORD *)a2)
    {
      uint64_t v2 = *(void *)(a1 + 8);
      int v3 = *(_DWORD *)(v2 + 4);
      if ((v3 & 4) != 0)
      {
        *(_DWORD *)(v2 + 4) = v3 & 0xFFFFFFFB;
        *(_DWORD *)(a2 + 4) |= 4u;
      }
      *(void *)(v2 + 40) = a2;
    }
    int64x2_t v4 = *(int64x2_t *)(a1 + 24);
    do
    {
      uint64_t v5 = a2;
      size_t v6 = (const double *)(a2 + 16);
      int64x2_t v7 = (int64x2_t)vld1q_dup_f64(v6);
      int64x2_t v4 = vaddq_s64(v4, v7);
      a2 = *(void *)(a2 + 40);
    }
    while (a2);
    *(int64x2_t *)(a1 + 24) = v4;
  }
  else
  {
    uint64_t v5 = 0;
  }
  uint64_t v8 = *(void *)(v5 + 8) - *(void *)(v5 + 16);
  *(void *)(a1 + 8) = v5;
  *(void *)(a1 + 16) = v8;
  return 0;
}

uint64_t md_initm(uint64_t result, uint64_t a2)
{
  *(_OWORD *)uint64_t result = 0u;
  *(_OWORD *)(result + 16) = 0u;
  *(void *)uint64_t result = a2;
  *(void *)(result + 8) = a2;
  if (a2) {
    uint64_t v2 = *(void *)(a2 + 32);
  }
  else {
    uint64_t v2 = 0;
  }
  *(void *)(result + 16) = v2;
  *(void *)(result + 24) = 0;
  return result;
}

uint64_t md_init(uint64_t a1)
{
  uint64_t v4 = 0;
  if (mbuf_gethdr(0, 1, &v4)) {
    return 55;
  }
  uint64_t v3 = v4;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v3;
  if (v3) {
    uint64_t v3 = *(void *)(v3 + 32);
  }
  uint64_t result = 0;
  *(void *)(a1 + 16) = v3;
  *(void *)(a1 + 24) = 0;
  return result;
}

void *md_done(void **a1)
{
  uint64_t result = *a1;
  if (result)
  {
    do
      uint64_t result = (void *)mbuf_free(result);
    while (result);
    *a1 = 0;
  }
  return result;
}

uint64_t md_get_mem(void *a1, char *__dst, uint64_t a3, int a4)
{
  if (!a3)
  {
LABEL_20:
    uint64_t result = 0;
    a1[3] += a3;
    return result;
  }
  uint64_t v8 = (void *)a1[1];
  unint64_t v9 = a3;
  while (v8)
  {
    for (uint64_t i = (char *)a1[2]; ; a1[2] = i)
    {
      unint64_t v11 = v8[2] + v8[4] - (void)i;
      if (v11) {
        break;
      }
      uint64_t v8 = (void *)v8[5];
      a1[1] = v8;
      if (!v8) {
        goto LABEL_21;
      }
      uint64_t i = (char *)v8[4];
    }
    if (v11 >= v9) {
      size_t v12 = v9;
    }
    else {
      size_t v12 = v8[2] + v8[4] - (void)i;
    }
    a1[2] = &i[v12];
    if (!__dst) {
      goto LABEL_19;
    }
    if (a4)
    {
      if (a4 == 2)
      {
        size_t v13 = v12;
        do
        {
          char v14 = *i++;
          *__dst++ = v14;
          --v13;
        }
        while (v13);
        goto LABEL_19;
      }
    }
    else
    {
      memmove(__dst, i, v12);
    }
    __dst += v12;
LABEL_19:
    v9 -= v12;
    if (!v9) {
      goto LABEL_20;
    }
  }
LABEL_21:
  if (piston_log_level)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      md_get_mem_cold_1(a3, v9);
    }
  }
  return 72;
}

uint64_t md_get_uint8(void *a1, char *a2)
{
  return md_get_mem(a1, a2, 1, 2);
}

uint64_t md_get_uint16(void *a1, char *a2)
{
  return md_get_mem(a1, a2, 2, 2);
}

uint64_t md_get_uint16le(void *a1, _WORD *a2)
{
  __int16 __dst = 0;
  uint64_t result = md_get_mem(a1, (char *)&__dst, 2, 2);
  if (a2)
  {
    if (!result) {
      *a2 = __dst;
    }
  }
  return result;
}

uint64_t md_get_uint16be(void *a1, _WORD *a2)
{
  unsigned __int16 __dst = 0;
  uint64_t result = md_get_mem(a1, (char *)&__dst, 2, 2);
  if (a2)
  {
    if (!result) {
      *a2 = bswap32(__dst) >> 16;
    }
  }
  return result;
}

uint64_t md_get_uint32(void *a1, char *a2)
{
  return md_get_mem(a1, a2, 4, 2);
}

uint64_t md_get_uint32be(void *a1, _DWORD *a2)
{
  unsigned int __dst = 0;
  uint64_t result = md_get_mem(a1, (char *)&__dst, 4, 2);
  if (a2)
  {
    if (!result) {
      *a2 = bswap32(__dst);
    }
  }
  return result;
}

uint64_t md_get_uint32le(void *a1, _DWORD *a2)
{
  int __dst = 0;
  uint64_t result = md_get_mem(a1, (char *)&__dst, 4, 2);
  if (a2)
  {
    if (!result) {
      *a2 = __dst;
    }
  }
  return result;
}

uint64_t md_get_uint64(void *a1, char *a2)
{
  return md_get_mem(a1, a2, 8, 2);
}

uint64_t md_get_uint64be(void *a1, void *a2)
{
  unint64_t __dst = 0;
  uint64_t result = md_get_mem(a1, (char *)&__dst, 8, 2);
  if (a2)
  {
    if (!result) {
      *a2 = bswap64(__dst);
    }
  }
  return result;
}

uint64_t md_get_uint64le(void *a1, void *a2)
{
  uint64_t __dst = 0;
  uint64_t result = md_get_mem(a1, (char *)&__dst, 8, 2);
  if (a2)
  {
    if (!result) {
      *a2 = __dst;
    }
  }
  return result;
}

uint64_t md_get_size(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 8);
  if (!v1) {
    return 0;
  }
  uint64_t result = 0;
  uint64_t v4 = *(void *)(a1 + 16);
  do
  {
    if (v4) {
      uint64_t v5 = v1[4] - v4 + v1[2];
    }
    else {
      uint64_t v5 = v1[2];
    }
    uint64_t v4 = 0;
    result += v5;
    uint64_t v1 = (void *)v1[5];
  }
  while (v1);
  return result;
}

uint64_t md_get_utf16_strlen(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 8);
  if (!v1) {
    return 0;
  }
  uint64_t result = 0;
  uint64_t v4 = *(unsigned char **)(a1 + 16);
  while (1)
  {
    uint64_t v5 = v1[4] - (void)v4 + v1[2];
    if ((v5 & 0xFFFFFFFFFFFFFFFELL) != 0) {
      break;
    }
    int64x2_t v7 = v4;
LABEL_9:
    uint64_t v1 = (void *)v1[5];
    if (!v1) {
      return result;
    }
    uint64_t v4 = (unsigned char *)v1[4];
    if (v5)
    {
      if (!*v7 && !*v4) {
        return result;
      }
      ++v4;
    }
  }
  unint64_t v6 = 0;
  while (*(_WORD *)&v4[v6])
  {
    v6 += 2;
    if (v6 >= (v5 & 0xFFFFFFFFFFFFFFFELL))
    {
      int64x2_t v7 = &v4[v6];
      result += v6;
      goto LABEL_9;
    }
  }
  result += v6;
  return result;
}

__n128 md_shadow_copy(__n128 *a1, __n128 *a2)
{
  __n128 result = *a1;
  *a2 = *a1;
  a2[1].n128_u64[0] = a1[1].n128_u64[0];
  return result;
}

void piston_tree_connect(void *a1, void *a2, uint64_t a3, void *a4)
{
  id v7 = a1;
  id v8 = a2;
  unint64_t v9 = a4;
  uint64_t v44 = 0;
  char v45 = &v44;
  uint64_t v46 = 0x2020000000;
  int v47 = 22;
  uint64_t v40 = 0;
  uint64_t v41 = &v40;
  uint64_t v42 = 0x2020000000;
  uint64_t v43 = 0;
  uint64_t v36 = 0;
  BOOL v37 = &v36;
  uint64_t v38 = 0x2020000000;
  uint64_t v39 = 0;
  uint64_t v10 = [v7 sock];

  if (!v10)
  {
    BOOL v16 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v16)
    {
      piston_tree_connect_cold_1(v16, v17, v18, v19, v20, v21, v22, v23);
      if (!v9) {
        goto LABEL_11;
      }
    }
    else if (!v9)
    {
      goto LABEL_11;
    }
    v9[2](v9, 57);
    goto LABEL_11;
  }
  unint64_t v11 = [v7 sock];
  size_t v12 = (const char *)[v11 getIPv4IPv6DotName];

  if (*v12)
  {
    v37[3] = (uint64_t)v12;
    size_t v13 = strnlen(v12, 0x10uLL);
    v41[3] = v13;
    v30[0] = MEMORY[0x263EF8330];
    v30[1] = 3221225472;
    v30[2] = __piston_tree_connect_block_invoke_3;
    v30[3] = &unk_265072CF0;
    v31[1] = v12;
    v31[0] = v9;
    int v14 = smb2_smb_tree_connect(v7, v8, v12, v13, a3, v30);
    int v15 = (id *)v31;
    *((_DWORD *)v45 + 6) = v14;
  }
  else
  {
    uint64_t v24 = [v7 sock];
    id v25 = [v24 serverName];
    uint64_t v26 = [v25 cStringUsingEncoding:4];
    v37[3] = v26;

    uint64_t v27 = (const char *)v37[3];
    size_t v28 = strnlen(v27, 0x100uLL);
    v41[3] = v28;
    v32[0] = MEMORY[0x263EF8330];
    v32[1] = 3221225472;
    v32[2] = __piston_tree_connect_block_invoke;
    v32[3] = &unk_265072D18;
    v35[0] = v9;
    v35[1] = &v36;
    id v33 = v7;
    v35[2] = &v40;
    v35[3] = &v44;
    v35[4] = v12;
    id v34 = v8;
    v35[5] = a3;
    int v29 = smb2_smb_tree_connect(v33, v34, v27, v28, a3, v32);
    int v15 = (id *)v35;
    *((_DWORD *)v45 + 6) = v29;
  }
  if (*((_DWORD *)v45 + 6) && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    piston_tree_connect_cold_2();
  }
LABEL_11:
  _Block_object_dispose(&v36, 8);
  _Block_object_dispose(&v40, 8);
  _Block_object_dispose(&v44, 8);
}

void sub_23F852F8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
  _Block_object_dispose(&a28, 8);
  _Block_object_dispose((const void *)(v28 - 152), 8);
  _Block_object_dispose((const void *)(v28 - 120), 8);
  _Unwind_Resume(a1);
}

uint64_t smb2_smb_tree_connect(void *a1, void *a2, const char *a3, uint64_t a4, uint64_t a5, void *a6)
{
  id v11 = a1;
  id v12 = a2;
  size_t v13 = a6;
  unsigned int v76 = 0;
  int v14 = [MEMORY[0x263F08708] characterSetWithCharactersInString:@"\"\\:"];
  if (!v12)
  {
    BOOL v26 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v26) {
      smb2_smb_tree_connect_cold_1(v26, v27, v28, v29, v30, v31, v32, v33);
    }
    goto LABEL_11;
  }
  int v15 = [MEMORY[0x263F08708] controlCharacterSet];
  uint64_t v16 = [v12 rangeOfCharacterFromSet:v15];

  if (v16 != 0x7FFFFFFFFFFFFFFFLL)
  {
    BOOL v35 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v35)
    {
      smb2_smb_tree_connect_cold_8(v35, v36, v37, v38, v39, v40, v41, v42);
      if (!v13) {
        goto LABEL_29;
      }
      goto LABEL_19;
    }
    goto LABEL_18;
  }
  if ([v12 rangeOfCharacterFromSet:v14] != 0x7FFFFFFFFFFFFFFFLL)
  {
    BOOL v44 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v44)
    {
      smb2_smb_tree_connect_cold_7(v44, v45, v46, v47, v48, v49, v50, v51);
      if (v13) {
        goto LABEL_19;
      }
      goto LABEL_29;
    }
LABEL_18:
    if (v13)
    {
LABEL_19:
      uint64_t v34 = 22;
      v13[2](v13, 22);
      goto LABEL_20;
    }
LABEL_29:
    id v43 = 0;
    uint64_t v34 = 22;
    goto LABEL_30;
  }
  cstring_len = smb_get_cstring_len(v12, &v76);
  if (!cstring_len)
  {
    BOOL v52 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v52) {
      smb2_smb_tree_connect_cold_2(v52, v53, v54, v55, v56, v57, v58, v59);
    }
LABEL_11:
    if (v13)
    {
      uint64_t v34 = 12;
      v13[2](v13, 12);
LABEL_20:
      id v43 = 0;
      goto LABEL_30;
    }
    id v43 = 0;
    uint64_t v34 = 12;
    goto LABEL_30;
  }
  if (v76 >= 0x51)
  {
    BOOL v18 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v18)
    {
      smb2_smb_tree_connect_cold_3(v18, v19, v20, v21, v22, v23, v24, v25);
      if (!v13) {
        goto LABEL_29;
      }
      goto LABEL_19;
    }
    goto LABEL_18;
  }
  long long v60 = cstring_len;
  id v75 = 0;
  uint64_t v34 = smb2_rq_alloc(3, 0, 0, 0, v11, &v75);
  id v61 = v75;
  id v43 = v61;
  if (v34) {
    goto LABEL_37;
  }
  uint64_t v62 = objc_msgSend(v61, "smb_rq_getrequest");
  mb_put_uint16le(v62, 9);
  mb_put_uint16le(v62, 0);
  mb_put_uint16le(v62, 72);
  smb_rq_bstart(v43);
  smb_put_dmem(v62, "\\\\"", 2, 0, 1, 0);
  uint64_t v68 = v62;
  uint64_t v63 = smb_put_dmem(v62, a3, a4, 0, 1, 0);
  if (v63)
  {
    uint64_t v34 = v63;
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      smb2_smb_tree_connect_cold_6();
      if (!v43) {
        goto LABEL_39;
      }
LABEL_38:
      objc_msgSend(v43, "smb_rq_done", v68);
      goto LABEL_39;
    }
LABEL_37:
    if (!v43) {
      goto LABEL_39;
    }
    goto LABEL_38;
  }
  uint64_t v65 = smb_put_dmem(v62, "\\"", 1, 0, 1, 0);
  if (v65)
  {
    uint64_t v34 = v65;
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      goto LABEL_37;
    }
    smb2_smb_tree_connect_cold_5();
    if (v43) {
      goto LABEL_38;
    }
    goto LABEL_39;
  }
  uint64_t v66 = smb_put_dmem(v62, v60, v76, 0, 1, 0);
  if (v66)
  {
    uint64_t v34 = v66;
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      goto LABEL_37;
    }
    smb2_smb_tree_connect_cold_4();
    if (v43) {
      goto LABEL_38;
    }
LABEL_39:
    if (v13) {
      v13[2](v13, v34);
    }
    goto LABEL_30;
  }
  smb_rq_bend(v43);
  if ((*(unsigned char *)([v11 getSessionPtr] + 554) & 2) != 0) {
    objc_msgSend(v43, "smb_rq_set_srflags:", 1024);
  }
  v69[0] = MEMORY[0x263EF8330];
  v69[1] = 3221225472;
  v69[2] = __smb2_smb_tree_connect_block_invoke;
  v69[3] = &unk_265072D40;
  int v67 = v13;
  uint64_t v73 = v67;
  uint64_t v74 = a5;
  id v43 = v43;
  id v70 = v43;
  id v71 = v12;
  id v72 = v11;
  uint64_t v34 = smb_rq_simple_block(v72, v43, v69);
  if (v34)
  {
    if (v43) {
      objc_msgSend(v43, "smb_rq_done");
    }
    if (v67) {
      v67[2](v67, v34);
    }
  }

LABEL_30:
  return v34;
}

void __piston_tree_connect_block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2 == 57 || !a2)
  {
    uint64_t v4 = *(void *)(a1 + 48);
    if (v4)
    {
      uint64_t v5 = *(void (**)(void))(v4 + 16);
      v5();
    }
    return;
  }
  if (piston_log_level && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    __piston_tree_connect_block_invoke_cold_2(a1, a2);
  }
  unint64_t v6 = [*(id *)(a1 + 32) sock];
  uint64_t v7 = [v6 getServerAddress];

  if (v7)
  {
    id v8 = [*(id *)(a1 + 32) sock];
    int v9 = *(unsigned __int8 *)([v8 getServerAddress] + 1);

    uint64_t v10 = [*(id *)(a1 + 32) sock];
    uint64_t v11 = [v10 getServerAddress];
    uint64_t v12 = v11;
    if (v9 == 2)
    {

      size_t v13 = (const void *)(v12 + 4);
      int v14 = *(char **)(a1 + 80);
      int v15 = [*(id *)(a1 + 32) sock];
      socklen_t v16 = [v15 getIPv4IPv6DotNameMaxLength];
      int v17 = 2;
    }
    else
    {
      int v18 = *(unsigned __int8 *)(v11 + 1);

      if (v18 != 30) {
        goto LABEL_16;
      }
      uint64_t v19 = [*(id *)(a1 + 32) sock];
      uint64_t v20 = [v19 getServerAddress];

      size_t v13 = (const void *)(v20 + 4);
      int v14 = *(char **)(a1 + 80);
      int v15 = [*(id *)(a1 + 32) sock];
      socklen_t v16 = [v15 getIPv4IPv6DotNameMaxLength];
      int v17 = 30;
    }
    inet_ntop(v17, v13, v14, v16);
  }
LABEL_16:
  uint64_t v21 = *(unsigned char **)(a1 + 80);
  if (*v21)
  {
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v21;
    *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = strnlen(*(const char **)(*(void *)(*(void *)(a1 + 56)+ 8)+ 24), 0x10uLL);
    uint64_t v22 = *(void **)(a1 + 32);
    uint64_t v23 = *(void **)(a1 + 40);
    uint64_t v24 = *(const char **)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
    uint64_t v25 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
    v28[0] = MEMORY[0x263EF8330];
    v28[1] = 3221225472;
    v28[2] = __piston_tree_connect_block_invoke_1;
    v28[3] = &unk_265072CF0;
    uint64_t v26 = *(void *)(a1 + 88);
    uint64_t v30 = *(void *)(a1 + 80);
    id v29 = *(id *)(a1 + 48);
    *(_DWORD *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = smb2_smb_tree_connect(v22, v23, v24, v25, v26, v28);
    if (*(_DWORD *)(*(void *)(*(void *)(a1 + 72) + 8) + 24)
      && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      __piston_tree_connect_block_invoke_cold_1();
    }
  }
  else
  {
    uint64_t v27 = *(void *)(a1 + 48);
    if (v27) {
      (*(void (**)(uint64_t, uint64_t))(v27 + 16))(v27, a2);
    }
  }
}

uint64_t __piston_tree_connect_block_invoke_1(uint64_t a1, int a2)
{
  if (a2) {
    **(unsigned char **)(a1 + 40) = 0;
  }
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __piston_tree_connect_block_invoke_3(uint64_t a1, int a2)
{
  if (a2) {
    **(unsigned char **)(a1 + 40) = 0;
  }
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void piston_tree_disconnect(void *a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v7 = a1;
  id v8 = a4;
  int v9 = [v7 sock];

  if (!v9)
  {
    BOOL v17 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v17)
    {
      piston_tree_disconnect_cold_1(v17, v18, v19, v20, v21, v22, v23, v24);
      if (!v8) {
        goto LABEL_29;
      }
    }
    else if (!v8)
    {
      goto LABEL_29;
    }
    v8[2](v8, 57);
    goto LABEL_29;
  }
  id v10 = v7;
  uint64_t v11 = v8;
  uint64_t v12 = [v10 getShare:a2];
  size_t v13 = v12;
  if (!v12)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      piston_tree_disconnect_cold_3();
      if (v11) {
        goto LABEL_15;
      }
    }
    else if (v11)
    {
      goto LABEL_15;
    }
LABEL_18:
    id v16 = 0;
    LODWORD(v14) = 22;
    goto LABEL_26;
  }
  if (objc_msgSend(v12, "tree_id") != -1 && objc_msgSend(v13, "tree_id"))
  {
    id v36 = 0;
    uint64_t v14 = smb2_rq_alloc(4, objc_msgSend(v13, "tree_id"), objc_msgSend(v13, "isEncrypted"), 0, v10, &v36);
    id v15 = v36;
    id v16 = v15;
    if (v14)
    {
      if (v15) {
        objc_msgSend(v15, "smb_rq_done");
      }
      if (v11) {
        v11[2](v11, v14);
      }
      goto LABEL_26;
    }
    uint64_t v25 = objc_msgSend(v15, "smb_rq_getrequest");
    mb_put_uint16le(v25, 4);
    mb_put_uint16le(v25, 0);
    uint64_t v27 = MEMORY[0x263EF8330];
    uint64_t v28 = 3221225472;
    id v29 = __smb2_smb_tree_disconnect_block_invoke;
    uint64_t v30 = &unk_265072D68;
    uint64_t v26 = v11;
    uint64_t v33 = v26;
    int v35 = a2;
    id v31 = v10;
    uint64_t v34 = a3;
    id v16 = v16;
    id v32 = v16;
    uint64_t v14 = smb_rq_simple_block(v31, v16, &v27);
    if (!v14) {
      goto LABEL_25;
    }
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      piston_tree_disconnect_cold_5();
      if (!v16)
      {
LABEL_23:
        if (v26) {
          v26[2](v26, v14);
        }
LABEL_25:

        goto LABEL_26;
      }
    }
    else if (!v16)
    {
      goto LABEL_23;
    }
    objc_msgSend(v16, "smb_rq_done", v27, v28, v29, v30, v31);
    goto LABEL_23;
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    piston_tree_disconnect_cold_4(v13);
    if (v11) {
      goto LABEL_15;
    }
    goto LABEL_18;
  }
  if (!v11) {
    goto LABEL_18;
  }
LABEL_15:
  LODWORD(v14) = 22;
  v11[2](v11, 22);
  id v16 = 0;
LABEL_26:

  if (v14 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    piston_tree_disconnect_cold_2();
  }
LABEL_29:
}

void __smb2_smb_tree_connect_block_invoke(uint64_t a1, uint64_t a2)
{
  __int16 v14 = 0;
  unsigned __int8 v13 = 0;
  unsigned int v12 = 0;
  uint64_t v4 = (void (**)(void, void))MEMORY[0x2455D48A0](*(void *)(a1 + 56));
  uint64_t v5 = (id *)(a1 + 32);
  **(_DWORD **)(a1 + 64) = objc_msgSend(*(id *)(a1 + 32), "sr_ntstatus");
  if (a2)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      __smb2_smb_tree_connect_block_invoke_cold_2((id *)(a1 + 32));
    }
    unint64_t v6 = 0;
    id v7 = 0;
    goto LABEL_7;
  }
  id v8 = objc_msgSend(*(id *)(a1 + 32), "smb_rq_getreply");
  id v7 = objc_alloc_init(SMBShare);
  [(SMBShare *)v7 setSharename:*(void *)(a1 + 40)];
  uint64_t v9 = objc_msgSend(*(id *)(a1 + 32), "sr_rsptreeid");
  [(SMBShare *)v7 setTree_id:v9];
  unint64_t v6 = [NSNumber numberWithUnsignedInt:v9];
  uint64_t uint16le = md_get_uint16le(v8, &v14);
  if (uint16le)
  {
LABEL_6:
    a2 = uint16le;
    goto LABEL_7;
  }
  if (v14 == 16)
  {
    uint64_t uint16le = md_get_uint8(v8, (char *)&v13);
    if (uint16le) {
      goto LABEL_6;
    }
    [(SMBShare *)v7 setShare_type:v13];
    uint64_t uint16le = md_get_uint8(v8, (char *)&v13);
    if (uint16le) {
      goto LABEL_6;
    }
    uint64_t uint16le = md_get_uint32le(v8, &v12);
    if (uint16le) {
      goto LABEL_6;
    }
    [(SMBShare *)v7 setShare_flags:v12];
    if (([(SMBShare *)v7 share_flags] & 0x8000) != 0
      || (*(_DWORD *)(objc_msgSend(*v5, "sr_sessionp") + 552) & 0x28800) != 0
      && (*(_WORD *)(objc_msgSend(*v5, "sr_sessionp") + 68) & 4) != 0)
    {
      [(SMBShare *)v7 setIsEncrypted:1];
    }
    uint64_t uint16le = md_get_uint32le(v8, &v12);
    if (uint16le) {
      goto LABEL_6;
    }
    [(SMBShare *)v7 setShare_capabilities:v12];
    uint64_t uint16le = md_get_uint32le(v8, &v12);
    if (uint16le) {
      goto LABEL_6;
    }
    [(SMBShare *)v7 setShare_max_access:v12];
    if (*(void *)(a1 + 64))
    {
      *(unsigned char *)(*(void *)(a1 + 64) + 4) = [(SMBShare *)v7 share_type];
      *(_DWORD *)(*(void *)(a1 + 64) + 8) = [(SMBShare *)v7 share_flags];
      *(_DWORD *)(*(void *)(a1 + 64) + 12) = [(SMBShare *)v7 share_capabilities];
      *(_DWORD *)(*(void *)(a1 + 64) + 16) = [(SMBShare *)v7 share_max_access];
      *(_DWORD *)(*(void *)(a1 + 64) + 20) = [(SMBShare *)v7 tree_id];
    }
    objc_msgSend(*(id *)(a1 + 48), "share_list_lock");
    uint64_t v11 = [*(id *)(a1 + 48) shareList];
    [v11 setObject:v7 forKey:v6];

    objc_msgSend(*(id *)(a1 + 48), "share_list_unlock");
    a2 = 0;
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      __smb2_smb_tree_connect_block_invoke_cold_1();
    }
    a2 = 72;
  }
LABEL_7:
  if (*v5) {
    objc_msgSend(*v5, "smb_rq_done");
  }
  if (v4) {
    v4[2](v4, a2);
  }
}

void __smb2_smb_tree_disconnect_block_invoke(uint64_t a1, uint64_t uint16le)
{
  __int16 v9 = 0;
  uint64_t v4 = (void (**)(void, void))MEMORY[0x2455D48A0](*(void *)(a1 + 48));
  uint64_t v5 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 64)];
  objc_msgSend(*(id *)(a1 + 32), "share_list_lock");
  unint64_t v6 = [*(id *)(a1 + 32) shareList];
  [v6 removeObjectForKey:v5];

  objc_msgSend(*(id *)(a1 + 32), "share_list_unlock");
  id v8 = *(void **)(a1 + 40);
  uint64_t v7 = a1 + 40;
  **(_DWORD **)(v7 + 16) = objc_msgSend(v8, "sr_ntstatus");
  if (uint16le)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      __smb2_smb_tree_disconnect_block_invoke_cold_2((id *)v7);
    }
  }
  else
  {
    uint64_t uint16le = md_get_uint16le(objc_msgSend(*(id *)v7, "smb_rq_getreply"), &v9);
    if (!uint16le && v9 != 4)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        __smb2_smb_tree_disconnect_block_invoke_cold_1();
      }
      uint64_t uint16le = 72;
    }
  }
  if (*(void *)v7) {
    objc_msgSend(*(id *)v7, "smb_rq_done");
  }
  if (v4) {
    v4[2](v4, uint16le);
  }
}

unsigned int -[SMBShare fs_block_size](SMBShare *self, SEL a2)
{
  return self->_fs_block_size;
}

void -[SMBShare setFs_block_size:](SMBShare *self, SEL a2, unsigned int a3)
{
  self->_fs_block_size_t size = a3;
}

unint64_t -[SMBShare fs_blocks](SMBShare *self, SEL a2)
{
  return self->_fs_blocks;
}

void -[SMBShare setFs_blocks:](SMBShare *self, SEL a2, unint64_t a3)
{
  self->_fs_blocks = a3;
}

unint64_t -[SMBShare fs_blocks_free](SMBShare *self, SEL a2)
{
  return self->_fs_blocks_free;
}

void -[SMBShare setFs_blocks_free:](SMBShare *self, SEL a2, unint64_t a3)
{
  self->_fs_blocks_free = a3;
}

unint64_t -[SMBShare fs_blocks_avail](SMBShare *self, SEL a2)
{
  return self->_fs_blocks_avail;
}

void -[SMBShare setFs_blocks_avail:](SMBShare *self, SEL a2, unint64_t a3)
{
  self->_fs_blocks_avail = a3;
}

void OUTLINED_FUNCTION_4_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x1Cu);
}

void piston_logoff(void *a1, uint64_t a2, void *a3)
{
  id v5 = a1;
  unint64_t v6 = a3;
  uint64_t v7 = [v5 getSessionPtr];
  __int16 v29 = 0;
  id v8 = [v5 sock];

  if (v8)
  {
    id v28 = 0;
    uint64_t uint16le = smb2_rq_alloc(2, 0, 0, 0, v5, &v28);
    id v10 = v28;
    uint64_t v11 = v10;
    if (!uint16le)
    {
      uint64_t v12 = objc_msgSend(v10, "smb_rq_getrequest");
      mb_put_uint16le(v12, 4);
      mb_put_uint16le(v12, 0);
      uint64_t uint16le = smb_rq_simple(v5, v11);
      if (a2) {
        *(_DWORD *)(a2 + 16) = objc_msgSend(v11, "sr_ntstatus");
      }
      if (uint16le)
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          piston_logoff_cold_3(v11, uint16le);
        }
      }
      else
      {
        *(void *)(v7 + 568) = 0;
        uint64_t uint16le = md_get_uint16le(objc_msgSend(v11, "smb_rq_getreply"), &v29);
        if (!uint16le && v29 != 4)
        {
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
            piston_logoff_cold_2((uint64_t)&v29, v21, v22, v23, v24, v25, v26, v27);
          }
          uint64_t uint16le = 0;
        }
      }
    }
    if (v11) {
      objc_msgSend(v11, "smb_rq_done");
    }
    if (v6) {
      goto LABEL_20;
    }
  }
  else
  {
    BOOL v13 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v13) {
      piston_logoff_cold_1(v13, v14, v15, v16, v17, v18, v19, v20);
    }
    uint64_t v11 = 0;
    if (v6)
    {
      uint64_t uint16le = 57;
LABEL_20:
      v6[2](v6, uint16le);
    }
  }
}

void piston_session_setup(void *a1, void *a2, void *a3, void *a4, uint64_t a5, void *a6)
{
  id v11 = a1;
  id v12 = a2;
  id v13 = a3;
  id v14 = a4;
  uint64_t v15 = a6;
  uint64_t v16 = [v11 sock];

  if (!v16)
  {
    BOOL v19 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v19)
    {
      piston_session_setup_cold_1(v19, v20, v21, v22, v23, v24, v25, v26);
      if (!v15) {
        goto LABEL_6;
      }
    }
    else if (!v15)
    {
      goto LABEL_6;
    }
    v15[2](v15, 57);
    goto LABEL_6;
  }
  uint64_t v17 = [v11 sock];
  uint64_t v18 = objc_msgSend(v17, "signing_queue");
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __piston_session_setup_block_invoke;
  v27[3] = &unk_265072DB8;
  id v28 = v11;
  uint64_t v33 = a5;
  id v29 = v12;
  id v30 = v13;
  id v31 = v14;
  id v32 = v15;
  dispatch_async(v18, v27);

LABEL_6:
}

uint64_t __piston_session_setup_block_invoke(uint64_t a1)
{
  uint64_t v118 = *MEMORY[0x263EF8340];
  uint64_t v2 = (id *)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 32) getSessionPtr];
  v110 = (int **)(a1 + 72);
  uint64_t v108 = a1;
  if (**(unsigned char **)(a1 + 72))
  {
    [*v2 setUserName:@"GUEST"];
    [*v2 setPassword:&stru_26F34E068];
    *(void *)(v3 + 552) |= 0x400000uLL;
    [*v2 setRealm:0];
    if ((piston_log_level & 4) != 0)
    {
      BOOL v7 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
      if (v7) {
        __piston_session_setup_block_invoke_cold_12(v7, v8, v9, v10, v11, v12, v13, v14);
      }
    }
    goto LABEL_9;
  }
  if (*(void *)(a1 + 40) && *(void *)(a1 + 48))
  {
    objc_msgSend(*(id *)(a1 + 32), "setUserName:");
    [*(id *)(a1 + 32) setPassword:*(void *)(a1 + 48)];
    uint64_t v4 = *(void *)(a1 + 56);
    if (v4)
    {
      id v5 = *v2;
    }
    else
    {
      if ((piston_log_level & 4) != 0)
      {
        BOOL v69 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
        if (v69) {
          __piston_session_setup_block_invoke_cold_11(v69, v70, v71, v72, v73, v74, v75, v76);
        }
      }
      id v5 = *v2;
      uint64_t v4 = 0;
    }
    [v5 setRealm:v4];
    uint64_t v77 = [*v2 realm];
    if (v77)
    {
      uint64_t v78 = (void *)v77;
      uint64_t v79 = [*v2 realm];
      uint64_t v80 = [v79 length];

      if (v80)
      {
        if ((piston_log_level & 4) != 0 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          __piston_session_setup_block_invoke_cold_10(v2);
        }
      }
    }
    unint64_t v81 = *(void *)(v3 + 560) & 0xFFFFFFFFFF8FFFFFLL;
    *(void *)(v3 + 560) = v81;
    int v82 = **v110;
    if ((v82 & 8) != 0)
    {
      *(void *)(v3 + 560) = v81 | 0x200000;
      if ((piston_log_level & 4) != 0)
      {
        BOOL v91 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
        if (v91) {
          __piston_session_setup_block_invoke_cold_9(v91, v92, v93, v94, v95, v96, v97, v98);
        }
      }
    }
    else if ((v82 & 2) != 0)
    {
      *(void *)(v3 + 560) = v81 | 0x400000;
      if ((piston_log_level & 4) != 0)
      {
        BOOL v99 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
        if (v99) {
          __piston_session_setup_block_invoke_cold_8(v99, v100, v101, v102, v103, v104, v105, v106);
        }
      }
    }
    else if ((v82 & 4) != 0)
    {
      *(void *)(v3 + 560) = v81 | 0x100000;
      if ((piston_log_level & 4) != 0)
      {
        BOOL v83 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
        if (v83) {
          __piston_session_setup_block_invoke_cold_7(v83, v84, v85, v86, v87, v88, v89, v90);
        }
      }
    }
LABEL_9:
    uint64_t v15 = *(void *)(v3 + 560);
    if ((v15 & 0x100) != 0)
    {
      uint64_t v16 = *(void *)(v3 + 552);
      if ((v16 & 0xC00000) != 0)
      {
        *(void *)(v3 + 552) = v16 & 0xFFFFFFFFFFFFFFF7;
        *(void *)(v3 + 560) = v15 & 0xFFFFFFFFFFFFFEFFLL;
      }
    }
    uint64_t v17 = *((void *)*v110 + 1);
    if (v17) {
      *(void *)(v3 + 576) = v17;
    }
    *(void *)(v3 + 568) = 0;
    *(_DWORD *)(v3 + 168) = -1073741802;
    *(void *)&long long v6 = 136315394;
    long long v107 = v6;
    v109 = v2;
    while (1)
    {
      uint64_t v18 = piston_gss_transact(*v2);
      uint64_t v19 = v18;
      if (v18 && v18 != 35)
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          __piston_session_setup_block_invoke_cold_3();
        }
        if (*(void *)(v3 + 568)) {
          [*v2 logoff];
        }
        goto LABEL_82;
      }
      if (*(_DWORD *)(v3 + 168) == -1073741802) {
        break;
      }
LABEL_62:
      if (v19 != 35)
      {
        uint64_t v43 = *(void *)(v3 + 552);
        __int16 v44 = *(_WORD *)(v3 + 68);
        if (v43 & 0x8C00000) == 0 && (v44)
        {
          if (piston_log_level)
          {
            BOOL v45 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
            if (v45) {
              __piston_session_setup_block_invoke_cold_5(v45, v46, v47, v48, v49, v50, v51, v52);
            }
          }
          objc_msgSend(*v2, "logoff", v107);
          uint64_t v19 = 80;
          goto LABEL_85;
        }
        if (v44)
        {
          *(void *)(v3 + 552) = v43 & 0xFFFFFFFFFFFFFFF7;
          smb_reset_sig(v3);
          uint64_t v65 = *(void **)(v3 + 272);
          if (!v65) {
            goto LABEL_99;
          }
          free(v65);
          uint64_t v19 = 0;
          *(void *)(v3 + 272) = 0;
          *(void *)(v3 + 280) = 0;
        }
        else
        {
          if ((v43 & 0x28800) != 0) {
            piston_smb3_derive_keys(*v2);
          }
          uint64_t v62 = *(void *)(v3 + 272);
          if (v62)
          {
            int v63 = smb3_verify_session_setup(v3, v62, *(void *)(v3 + 280));
            free(*(void **)(v3 + 272));
            *(void *)(v3 + 272) = 0;
            *(void *)(v3 + 280) = 0;
            if (v63)
            {
              if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
                __piston_session_setup_block_invoke_cold_4();
              }
              objc_msgSend(*v2, "logoff", smb_reset_sig(v3));
              int v64 = 0;
              uint64_t v19 = 80;
              goto LABEL_101;
            }
          }
LABEL_99:
          uint64_t v19 = 0;
        }
        int v64 = 1;
LABEL_101:
        smb2_rq_credit_start(v3, 0);
        piston_gss_reset((gss_cred_id_t *)v3);
        if (v64)
        {
          uint64_t v66 = *v110;
          if (*v110
            && (*((_WORD *)v66 + 10) = *(_WORD *)(v3 + 68),
                *((void *)v66 + 3) = *(void *)(v3 + 568),
                *((void *)v66 + 4) = 0,
                [*v2 sock],
                int v67 = objc_claimAutoreleasedReturnValue(),
                int v68 = [v67 isPerAppVPN],
                v67,
                v68 == 1))
          {
            uint64_t v19 = 0;
            *((void *)*v110 + 4) |= 1uLL;
          }
          else
          {
            uint64_t v19 = 0;
          }
        }
        goto LABEL_86;
      }
    }
    uint64_t v20 = v3;
    uint64_t v21 = *v110;
    id v22 = *v2;
    uint64_t v23 = [v22 getSessionPtr];
    uint64_t v24 = 0;
    *(_DWORD *)&size[1] = 0;
    size[0] = 0;
    unint64_t v25 = (*(_DWORD *)(v23 + 80) - 64);
    uint64_t v26 = *(char **)(v23 + 160);
    do
    {
      if (v24) {
        objc_msgSend(v24, "smb_rq_done");
      }
      id v111 = v24;
      uint64_t uint16le = smb2_rq_alloc(1, 0, 0, 0, v22, &v111);
      id v28 = v111;

      if (uint16le) {
        break;
      }
      uint64_t v29 = objc_msgSend(v28, "smb_rq_getrequest");
      mb_put_uint16le(v29, 25);
      mb_put_uint8(v29, 0);
      char client_security_mode = smb2_smb_get_client_security_mode(v23);
      mb_put_uint8(v29, client_security_mode);
      mb_put_uint32le(v29, 1);
      mb_put_uint32le(v29, 0);
      mb_put_uint16le(v29, 88);
      unint64_t v31 = *(void *)(v23 + 152);
      if (v31 <= v25) {
        size_t v32 = v31;
      }
      else {
        size_t v32 = v25;
      }
      mb_put_uint16le(v29, v32);
      mb_put_uint64le(v29, *(void *)(v23 + 576));
      mb_put_mem(v29, v26, v32, 0);
      uint64_t uint16le = smb_rq_simple(v22, v28);
      int v33 = objc_msgSend(v28, "sr_ntstatus");
      *(_DWORD *)(v23 + 168) = v33;
      v21[4] = v33;
      if (uint16le && (objc_msgSend(v28, "sr_flags") & 0x10) != 0)
      {
        if (!*(void *)(v23 + 152)) {
          break;
        }
      }
      else
      {
        if (!*(void *)(v23 + 568)) {
          *(void *)(v23 + 568) = objc_msgSend(v28, "sr_rspsessionid");
        }
        v26 += v32;
        size_t v34 = *(void *)(v23 + 152) - v32;
        *(void *)(v23 + 152) = v34;
        if (!v34) {
          break;
        }
      }
      uint64_t v24 = v28;
    }
    while (uint16le == 35);
    int v35 = *(void **)(v23 + 160);
    if (v35)
    {
      free(v35);
      *(void *)(v23 + 160) = 0;
    }
    *(void *)(v23 + 152) = 0;
    uint64_t v3 = v20;
    if (uint16le && uint16le != 35)
    {
      if ((piston_log_level & 4) != 0 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)&size[3] = v107;
        v113 = "smb2_smb_gss_session_setup";
        __int16 v114 = 1024;
        int v115 = uint16le;
        _os_log_error_impl(&dword_23F849000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s: Extended security authorization failed! %d\n", (uint8_t *)&size[3], 0x12u);
      }
    }
    else
    {
      id v36 = objc_msgSend(v28, "smb_rq_getreply", v107);
      uint64_t uint16le = md_get_uint16le(v36, &size[2]);
      if (!uint16le)
      {
        int v37 = size[2];
        if (size[2] == 9)
        {
          uint64_t uint16le = md_get_uint16le(v36, (_WORD *)(v23 + 68));
          if (!uint16le)
          {
            uint64_t uint16le = md_get_uint16le(v36, &size[1]);
            if (!uint16le)
            {
              uint64_t uint16le = md_get_uint16le(v36, size);
              if (!uint16le)
              {
                if (!size[1] || (size[1] -= 72, uint64_t uint16le = md_get_mem(v36, 0, size[1], 0), !uint16le))
                {
                  uint64_t v38 = *(void **)(v23 + 144);
                  if (v38)
                  {
                    free(v38);
                    *(void *)(v23 + 144) = 0;
                  }
                  size_t v39 = size[0];
                  *(void *)(v23 + 136) = size[0];
                  if (!v39)
                  {
                    objc_msgSend(v28, "smb_rq_done");
                    uint64_t uint16le = 0;
                    goto LABEL_58;
                  }
                  uint64_t v40 = (char *)malloc_type_malloc(v39, 0x2A2DC1F8uLL);
                  *(void *)(v23 + 144) = v40;
                  if (v40)
                  {
                    uint64_t v41 = size[0];
                    *(void *)(v23 + 136) = size[0];
                    uint64_t uint16le = md_get_mem(v36, v40, v41, 0);
                    objc_msgSend(v28, "smb_rq_done");
                    if (!uint16le) {
                      goto LABEL_58;
                    }
                    goto LABEL_57;
                  }
                  uint64_t uint16le = 12;
                }
              }
            }
          }
        }
        else
        {
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)&size[3] = v107;
            v113 = "smb2_smb_gss_session_setup";
            __int16 v114 = 1024;
            int v115 = v37;
            _os_log_error_impl(&dword_23F849000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s: Bad struct size: %u\n", (uint8_t *)&size[3], 0x12u);
          }
          uint64_t uint16le = 72;
        }
      }
    }
    objc_msgSend(v28, "smb_rq_done", v107);
LABEL_57:
    *(void *)(v23 + 568) = 0;
LABEL_58:

    if ((piston_log_level & 4) != 0 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      int v42 = (*v110)[4];
      *(_DWORD *)&size[3] = 136315650;
      v113 = "piston_session_setup_block_invoke";
      __int16 v114 = 1024;
      int v115 = uint16le;
      __int16 v116 = 1024;
      int v117 = v42;
      _os_log_error_impl(&dword_23F849000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s: smb2_smb_gss_session_setup <%d> NT Status<0x%x>\n", (uint8_t *)&size[3], 0x18u);
    }
    uint64_t v2 = v109;
    if (uint16le)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        __piston_session_setup_block_invoke_cold_6((uint64_t)v110, uint16le);
      }
      uint64_t v19 = uint16le;
      goto LABEL_82;
    }
    goto LABEL_62;
  }
  BOOL v53 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
  if (v53) {
    __piston_session_setup_block_invoke_cold_2(v53, v54, v55, v56, v57, v58, v59, v60);
  }
  uint64_t v19 = 22;
LABEL_82:
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    __piston_session_setup_block_invoke_cold_1();
  }
  smb_reset_sig(v3);
LABEL_85:
  piston_gss_reset((gss_cred_id_t *)v3);
LABEL_86:
  uint64_t result = *(void *)(v108 + 64);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, v19);
  }
  return result;
}

uint64_t piston_ntstatus_to_errno(unsigned int a1)
{
  int v1 = (a1 >> 30) ^ 2;
  if ((v1 - 2) < 2) {
    return 0;
  }
  if (v1)
  {
    for (uint64_t i = 0; i != 306; i += 2)
    {
      if (nt2errno[i] == a1) {
        return nt2errno[i + 1];
      }
    }
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      piston_ntstatus_to_errno_cold_1();
    }
    return 5;
  }
  if (a1 == -2147483643) {
    return 0;
  }
  if (a1 != -2147483642)
  {
    if (a1 != -2147483603) {
      printf("%s: Unable to map warning ntstatus to errno, ntstatus: 0x%x\n", "piston_ntstatus_warning_to_errno", a1);
    }
    return 5;
  }
  return 2;
}

void piston_set_session_key(void *a1, const void *a2, int a3)
{
  LODWORD(v3) = a3;
  uint64_t v5 = [a1 getSessionPtr];
  if (a2 && v3)
  {
    uint64_t v6 = v5;
    smb_reset_sig(v5);
    *(_DWORD *)(v6 + 240) = v3;
    BOOL v7 = malloc_type_malloc(v3, 0x70345BD7uLL);
    *(void *)(v6 + 232) = v7;
    if (v7)
    {
      memcpy(v7, a2, *(unsigned int *)(v6 + 240));
      if (v3 >= 0x10) {
        unsigned int v8 = 16;
      }
      else {
        unsigned int v8 = v3;
      }
      if ((*(void *)(v6 + 552) & 0x1000) != 0) {
        size_t v3 = v8;
      }
      else {
        size_t v3 = v3;
      }
      uint64_t v9 = malloc_type_malloc(v3, 0x44F6225uLL);
      *(void *)(v6 + 216) = v9;
      if (v9)
      {
        memmove(v9, a2, v3);
        *(_DWORD *)(v6 + 224) = v3;
      }
      else
      {
        BOOL v18 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
        if (v18) {
          piston_set_session_key_cold_2(v18, v19, v20, v21, v22, v23, v24, v25);
        }
      }
    }
    else
    {
      BOOL v10 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
      if (v10) {
        piston_set_session_key_cold_1(v10, v11, v12, v13, v14, v15, v16, v17);
      }
    }
  }
}

uint64_t smb_convert_network_to_path(char *a1, size_t __n, UInt8 *a3, CFIndex *a4, int a5, char a6, int a7)
{
  id v30 = a3;
  __s1 = a1;
  CFIndex v8 = *a4;
  CFIndex v29 = *a4;
  if (!a1)
  {
    CFIndex v11 = v8;
LABEL_47:
    uint64_t v26 = 0;
    *a4 = v8 - v11;
    return v26;
  }
  size_t v9 = __n;
  if (v8) {
    BOOL v10 = __n == 0;
  }
  else {
    BOOL v10 = 1;
  }
  CFIndex v11 = v8;
  if (v10) {
    goto LABEL_47;
  }
  size_t v28 = 0;
  while (1)
  {
    if (a7)
    {
      if (v9 >= 2)
      {
        uint64_t v17 = 0;
        size_t v18 = v9 >> 1;
        while (1)
        {
          if (!*(_WORD *)&a1[v17])
          {
LABEL_19:
            uint64_t v15 = 0;
            goto LABEL_23;
          }
          if (*(unsigned __int16 *)&a1[v17] == a5) {
            break;
          }
          v17 += 2;
          if (2 * (v9 >> 1) == v17) {
            goto LABEL_19;
          }
        }
        uint64_t v15 = &a1[v17];
        *(_WORD *)&a1[v17] = 0;
        size_t v18 = (v9 - 2) >> 1;
        v9 -= 2;
LABEL_23:
        if (v9 >= 2)
        {
          uint64_t v24 = 2 * v18;
          uint64_t v20 = a1;
          uint64_t v25 = &a1[2 * v18];
          while (*(_WORD *)v20)
          {
            v20 += 2;
            v24 -= 2;
            if (!v24)
            {
              uint64_t v20 = v25;
              goto LABEL_25;
            }
          }
          goto LABEL_25;
        }
      }
      else
      {
        uint64_t v15 = 0;
        size_t v9 = 1;
      }
      uint64_t v20 = a1;
LABEL_25:
      size_t v19 = v20 - a1;
      goto LABEL_26;
    }
    uint64_t v16 = 0;
    while (1)
    {
      if (!a1[v16])
      {
LABEL_14:
        uint64_t v15 = 0;
        goto LABEL_21;
      }
      if (a1[v16] == a5) {
        break;
      }
      if (v9 == ++v16) {
        goto LABEL_14;
      }
    }
    --v9;
    uint64_t v15 = &a1[v16];
    a1[v16] = 0;
    a1 = __s1;
LABEL_21:
    size_t v19 = strnlen(a1, v9);
LABEL_26:
    size_t v28 = v19;
    uint64_t v21 = smb_convert_from_network((const UInt8 **)&__s1, &v28, &v30, &v29, a6, a7);
    if (v21) {
      break;
    }
    if (v15)
    {
      if (a7) {
        *(_WORD *)v15++ = a5;
      }
      else {
        *uint64_t v15 = a5;
      }
      __s1 = v15 + 1;
      if (!v29) {
        return 7;
      }
      unint64_t v22 = v28;
      CFIndex v11 = v29 - 1;
      uint64_t v23 = v30;
      --v29;
      ++v30;
      *uint64_t v23 = 47;
      a1 = __s1;
    }
    else
    {
      a1 = 0;
      __s1 = 0;
      unint64_t v22 = v28;
      CFIndex v11 = v29;
    }
    if (a1)
    {
      if (v11)
      {
        size_t v9 = v9 - v19 + v22;
        if (v9) {
          continue;
        }
      }
    }
    CFIndex v8 = *a4;
    goto LABEL_47;
  }
  uint64_t v26 = v21;
  if (piston_log_level && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    smb_convert_network_to_path_cold_1();
  }
  return v26;
}

uint64_t smb_convert_from_network(const UInt8 **a1, unint64_t *a2, UInt8 **a3, CFIndex *a4, char a5, int a6)
{
  if (!a1)
  {
    BOOL v31 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v31) {
      smb_convert_from_network_cold_1(v31, v32, v33, v34, v35, v36, v37, v38);
    }
    return 22;
  }
  BOOL v7 = *a1;
  if (!*a1)
  {
    BOOL v39 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v39) {
      smb_convert_from_network_cold_2(v39, v40, v41, v42, v43, v44, v45, v46);
    }
    return 22;
  }
  if (!a3)
  {
    BOOL v47 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v47) {
      smb_convert_from_network_cold_3(v47, v48, v49, v50, v51, v52, v53, v54);
    }
    return 22;
  }
  if (!a6)
  {
    BOOL v55 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v55) {
      smb_convert_from_network_cold_4(v55, v56, v57, v58, v59, v60, v61, v62);
    }
    return 22;
  }
  unint64_t v10 = *a2;
  if (!*a2) {
    return 0;
  }
  if ((a5 & 0x20) != 0)
  {
    unint64_t v12 = 0;
    do
    {
      __int16 v13 = *(_WORD *)&v7[v12];
      if ((v13 & 0xFFC0) == 0xF000 && (v13 & 0x3Fu) <= 0x29) {
        __int16 v13 = sfm2mac[v13 & 0x3F];
      }
      *(_WORD *)&v7[v12] = v13;
      v12 += 2;
    }
    while (v12 < v10);
  }
  CFIndex v14 = *a4;
  CFIndex maxBufLen = 0;
  uint64_t v15 = *a3;
  CFAllocatorRef v16 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFStringRef v17 = CFStringCreateWithBytes((CFAllocatorRef)*MEMORY[0x263EFFB08], v7, v10, 0x14000100u, 0);
  if (!v17)
  {
    BOOL v63 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v63) {
      smb_convert_from_network_cold_5(v63, v64, v65, v66, v67, v68, v69, v70);
    }
    return 22;
  }
  CFStringRef v18 = v17;
  MutableCopy = CFStringCreateMutableCopy(v16, 0, v17);
  if (!MutableCopy)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      smb_convert_from_network_cold_6();
    }
    CFRelease(v18);
    return 22;
  }
  CFStringRef v20 = MutableCopy;
  CFStringNormalize(MutableCopy, kCFStringNormalizationFormD);
  CFIndex Length = CFStringGetLength(v20);
  v94.location = 0;
  v94.length = Length;
  CFIndex v92 = v14;
  if (!CFStringGetBytes(v20, v94, 0x8000100u, 0, 0, 0, 0, &maxBufLen))
  {
    BOOL v72 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v72) {
      smb_convert_from_network_cold_7(v72, v73, v74, v75, v76, v77, v78, v79);
    }
    goto LABEL_38;
  }
  CFIndex v14 = maxBufLen;
  if (!v15)
  {
    uint64_t v80 = (UInt8 *)malloc_type_calloc(maxBufLen, 1uLL, 0x1130D56BuLL);
    if (!v80)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        smb_convert_from_network_cold_8();
      }
      LODWORD(v15) = 0;
      uint64_t v30 = 12;
      goto LABEL_52;
    }
    v95.location = 0;
    v95.length = Length;
    unint64_t v81 = v80;
    if (CFStringGetBytes(v20, v95, 0x8000100u, 0, 0, v80, v14, &maxBufLen))
    {
      int v82 = v81;
      uint64_t v30 = 0;
      *a3 = v82;
LABEL_45:
      LODWORD(v15) = 1;
      goto LABEL_53;
    }
LABEL_46:
    BOOL v83 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    LODWORD(v14) = v92;
    if (v83)
    {
      smb_convert_from_network_cold_9(v83, v84, v85, v86, v87, v88, v89, v90);
      if (!v15) {
        goto LABEL_48;
      }
    }
    else if (!v15)
    {
LABEL_48:
      free(v81);
      goto LABEL_39;
    }
LABEL_38:
    LODWORD(v15) = 0;
LABEL_39:
    uint64_t v30 = 22;
    goto LABEL_53;
  }
  if (maxBufLen <= v92)
  {
    v96.location = 0;
    v96.length = Length;
    unint64_t v81 = *a3;
    if (CFStringGetBytes(v20, v96, 0x8000100u, 0, 0, *a3, maxBufLen, &maxBufLen))
    {
      uint64_t v30 = 0;
      goto LABEL_45;
    }
    goto LABEL_46;
  }
  BOOL v22 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
  if (v22) {
    smb_convert_from_network_cold_10(v22, v23, v24, v25, v26, v27, v28, v29);
  }
  LODWORD(v15) = 0;
  uint64_t v30 = 34;
LABEL_52:
  LODWORD(v14) = v92;
LABEL_53:
  CFRelease(v18);
  CFRelease(v20);
  if (v15)
  {
    uint64_t v30 = 0;
    *a1 += v10;
    unint64_t v91 = v14 | v92 & 0xFFFFFFFF00000000;
    *a3 += v91;
    *a2 -= v10;
    *a4 -= v91;
  }
  return v30;
}

uint64_t smb_convert_path_to_network(char *__s1, size_t __n, UInt8 *a3, unint64_t *a4, __int16 a5, char a6, int a7)
{
  BOOL v31 = a3;
  uint64_t v32 = __s1;
  unint64_t v8 = *a4;
  unint64_t v29 = *a4;
  size_t v30 = 0;
  if (a7) {
    unint64_t v9 = 2;
  }
  else {
    unint64_t v9 = 1;
  }
  if (__s1)
  {
    size_t v10 = __n;
    if (v8) {
      BOOL v11 = __n == 0;
    }
    else {
      BOOL v11 = 1;
    }
    unint64_t v12 = v8;
    if (!v11)
    {
      CFAllocatorRef v16 = __s1;
      while (1)
      {
        uint64_t v17 = 0;
        while (1)
        {
          if (!v16[v17])
          {
LABEL_14:
            CFStringRef v18 = 0;
            int v19 = 1;
            goto LABEL_16;
          }
          if (v16[v17] == 47) {
            break;
          }
          if (v10 == ++v17) {
            goto LABEL_14;
          }
        }
        int v19 = 0;
        --v10;
        CFStringRef v18 = &v16[v17];
        v16[v17] = 0;
        CFAllocatorRef v16 = v32;
LABEL_16:
        size_t v20 = strnlen(v16, v10);
        size_t v21 = v20;
        size_t v30 = v20;
        if (v20 == 2)
        {
          if (*v16 != 46) {
            goto LABEL_23;
          }
          int v22 = v16[1];
        }
        else
        {
          if (v20 != 1) {
            goto LABEL_23;
          }
          int v22 = *v16;
        }
        if (v22 == 46)
        {
          char v23 = 0;
          goto LABEL_24;
        }
LABEL_23:
        char v23 = a6;
LABEL_24:
        uint64_t result = smb_convert_to_network((const char **)&v32, (uint64_t *)&v30, &v31, (uint64_t *)&v29, v23, a7);
        if (result) {
          return result;
        }
        if (v19)
        {
          uint64_t v32 = 0;
          unint64_t v12 = v29;
LABEL_34:
          unint64_t v8 = *a4;
          break;
        }
        *CFStringRef v18 = 47;
        uint64_t v25 = v18 + 1;
        uint64_t v32 = (char *)v25;
        unint64_t v12 = v29 - v9;
        if (v29 < v9) {
          return 7;
        }
        uint64_t v26 = v30;
        uint64_t v27 = v31;
        v29 -= v9;
        if (a7)
        {
          *(_WORD *)BOOL v31 = a5;
          uint64_t v28 = v27 + 2;
          CFAllocatorRef v16 = (char *)v25;
        }
        else
        {
          *BOOL v31 = a5;
          uint64_t v28 = v27 + 1;
          CFAllocatorRef v16 = v32;
        }
        BOOL v31 = v28;
        if (v16)
        {
          if (v12)
          {
            size_t v10 = v10 - v21 + v26;
            if (v10) {
              continue;
            }
          }
        }
        goto LABEL_34;
      }
    }
  }
  else
  {
    unint64_t v12 = v8;
  }
  uint64_t result = 0;
  *a4 = v8 - v12;
  return result;
}

uint64_t smb_convert_to_network(const char **a1, uint64_t *a2, UInt8 **a3, uint64_t *a4, char a5, int a6)
{
  if (!a1)
  {
    BOOL v30 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v30) {
      smb_convert_to_network_cold_1(v30, v31, v32, v33, v34, v35, v36, v37);
    }
    return 22;
  }
  BOOL v7 = *a1;
  if (!*a1)
  {
    BOOL v38 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v38) {
      smb_convert_to_network_cold_2(v38, v39, v40, v41, v42, v43, v44, v45);
    }
    return 22;
  }
  if (!a3)
  {
    BOOL v46 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v46) {
      smb_convert_to_network_cold_3(v46, v47, v48, v49, v50, v51, v52, v53);
    }
    return 22;
  }
  if (!*a3)
  {
    BOOL v54 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v54) {
      smb_convert_to_network_cold_4(v54, v55, v56, v57, v58, v59, v60, v61);
    }
    return 22;
  }
  if (!a6)
  {
    BOOL v62 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v62) {
      smb_convert_to_network_cold_5(v62, v63, v64, v65, v66, v67, v68, v69);
    }
    return 22;
  }
  uint64_t v10 = *a2;
  if (!*a2) {
    return 0;
  }
  uint64_t v13 = *a4;
  CFIndex usedBufLen = 0;
  CFAllocatorRef v14 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFStringRef v15 = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x263EFFB08], v7, 0x8000100u);
  if (!v15)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      smb_convert_to_network_cold_6();
    }
    return 22;
  }
  CFStringRef v16 = v15;
  MutableCopy = CFStringCreateMutableCopy(v14, 0, v15);
  if (!MutableCopy)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      smb_convert_to_network_cold_7();
    }
    CFRelease(v16);
    return 22;
  }
  CFStringRef v18 = MutableCopy;
  uint64_t v77 = v13;
  CFStringNormalize(MutableCopy, kCFStringNormalizationFormC);
  CFIndex Length = CFStringGetLength(v18);
  v79.location = 0;
  v79.length = Length;
  if (CFStringGetBytes(v18, v79, 0x14000100u, 0, 0, 0, 0, &usedBufLen))
  {
    if (usedBufLen > v77)
    {
      BOOL v20 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
      if (v20) {
        smb_convert_to_network_cold_9(v20, v21, v22, v23, v24, v25, v26, v27);
      }
      int v28 = 0;
      uint64_t v29 = 34;
      goto LABEL_39;
    }
    v80.location = 0;
    v80.length = Length;
    if (CFStringGetBytes(v18, v80, 0x14000100u, 0, 0, *a3, usedBufLen, 0))
    {
      uint64_t v29 = 0;
      unsigned int v76 = usedBufLen;
      int v28 = 1;
      goto LABEL_40;
    }
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      smb_convert_to_network_cold_10();
    }
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    smb_convert_to_network_cold_8();
  }
  int v28 = 0;
  uint64_t v29 = 22;
LABEL_39:
  unsigned int v76 = v77;
LABEL_40:
  CFRelease(v16);
  CFRelease(v18);
  if (v28)
  {
    unint64_t v71 = v76 | v77 & 0xFFFFFFFF00000000;
    if ((a5 & 0x20) != 0 && v71)
    {
      BOOL v72 = *a3;
      unint64_t v73 = v76 | v77 & 0xFFFFFFFF00000000;
      while (1)
      {
        unsigned int v74 = *(unsigned __int16 *)v72;
        if (v74 <= 0x7F) {
          break;
        }
LABEL_55:
        v72 += 2;
        v73 -= 2;
        if (!v73) {
          goto LABEL_56;
        }
      }
      if (v73 == 2)
      {
        if (v74 == 32)
        {
          LOWORD(v74) = -4056;
          goto LABEL_54;
        }
        if (v74 == 46)
        {
          LOWORD(v74) = -4055;
LABEL_54:
          *(_WORD *)BOOL v72 = v74;
          goto LABEL_55;
        }
      }
      if (v74 > 0x1F)
      {
        int v75 = mac2sfm[v74 - 32];
        if (v74 != v75) {
          LOWORD(v74) = v75 | 0xF000;
        }
      }
      else
      {
        LOWORD(v74) = v74 | 0xF000;
      }
      goto LABEL_54;
    }
LABEL_56:
    uint64_t v29 = 0;
    *a1 += v10;
    *a3 += v71;
    *a2 -= v10;
    *a4 -= v71;
  }
  return v29;
}

const char *smb_get_cstring_len(void *a1, _DWORD *a2)
{
  id v3 = a1;
  uint64_t v4 = v3;
  *a2 = 0;
  if (v3)
  {
    uint64_t v5 = (const char *)[v3 cStringUsingEncoding:4];
    uint64_t v6 = v5;
    if (v5) {
      *a2 = strlen(v5);
    }
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

uint64_t smb_put_dmem(uint64_t a1, const char *a2, uint64_t a3, char a4, int a5, void *a6)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  uint64_t v18 = a3;
  int v19 = a2;
  if (!a3) {
    return 0;
  }
  unint64_t v10 = 2 * a3 + 2;
  if (v10 < 0x201)
  {
    BOOL v11 = v20;
    unint64_t v10 = 512;
  }
  else
  {
    BOOL v11 = (UInt8 *)malloc_type_malloc(2 * a3 + 2, 0x9B41D396uLL);
    if (!v11) {
      return 12;
    }
  }
  unint64_t v16 = v10;
  uint64_t v17 = v11;
  uint64_t v12 = smb_convert_to_network(&v19, &v18, &v17, (uint64_t *)&v16, a4, a5);
  if (!v12)
  {
    size_t v13 = v10 - v16;
    if (a5) {
      mb_put_padbyte(a1);
    }
    uint64_t v14 = mb_put_mem(a1, (char *)v11, v13, 0);
    uint64_t v12 = v14;
    if (a6 && !v14) {
      *a6 += v13;
    }
  }
  if (v11 != v20) {
    free(v11);
  }
  return v12;
}

unsigned char *smb_strndup(const char *a1, size_t a2)
{
  if (!a1) {
    return 0;
  }
  size_t v3 = strnlen(a1, a2);
  uint64_t v4 = malloc_type_malloc(v3 + 1, 0xC0F07796uLL);
  uint64_t v5 = v4;
  if (v4)
  {
    memcpy(v4, a1, v3);
    v5[v3] = 0;
  }
  return v5;
}

unint64_t smb_time_NT2local(unint64_t result, void *a2)
{
  unint64_t v2 = 100 * (result % HUNDRED_NSEC_PER_SEC);
  *a2 = result / HUNDRED_NSEC_PER_SEC - DIFF1970TO1601;
  a2[1] = v2;
  return result;
}

uint64_t *smb_time_local2NT(uint64_t *result, uint64_t *a2, int a3)
{
  uint64_t v3 = *result;
  if (a3) {
    uint64_t v4 = ((v3 & 0xFFFFFFFFFFFFFFFELL) + DIFF1970TO1601) * HUNDRED_NSEC_PER_SEC;
  }
  else {
    uint64_t v4 = result[1] / 100 + (DIFF1970TO1601 + v3) * HUNDRED_NSEC_PER_SEC;
  }
  *a2 = v4;
  return result;
}

unint64_t smb2_smb_get_alloc_size(void *a1, unint64_t a2)
{
  id v3 = a1;
  uint64_t v4 = [v3 pd];
  uint64_t v5 = objc_msgSend(v4, "getShare:", objc_msgSend(v3, "shareID"));

  if (v5)
  {
    if (a2)
    {
      objc_msgSend(v5, "statfs_lock");
      if (objc_msgSend(v5, "fs_block_size"))
      {
        unint64_t v6 = a2 / objc_msgSend(v5, "fs_block_size");
        unint64_t v7 = v6 * objc_msgSend(v5, "fs_block_size");
        a2 = v7 + objc_msgSend(v5, "fs_block_size");
      }
      else
      {
        BOOL v8 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
        if (v8) {
          smb2_smb_get_alloc_size_cold_2(v8, v9, v10, v11, v12, v13, v14, v15);
        }
        a2 = 0;
      }
      objc_msgSend(v5, "statfs_unlock");
    }
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      smb2_smb_get_alloc_size_cold_1(v3);
    }
    a2 = 0;
  }

  return a2;
}

uint64_t smb2_smb_get_client_capabilities(uint64_t a1)
{
  if (a1) {
    return (*(unsigned __int8 *)(a1 + 561) << 27 >> 31) & 0x77;
  }
  uint64_t result = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
  if (result)
  {
    smb2_smb_get_client_capabilities_cold_1(result, v2, v3, v4, v5, v6, v7, v8);
    return 0;
  }
  return result;
}

uint64_t smb2_smb_get_client_dialects(uint64_t a1, int a2, __int16 *a3, __int16 *a4, unint64_t a5)
{
  if (a5 <= 9)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      smb2_smb_get_client_dialects_cold_1();
    }
    return 12;
  }
  if (a2)
  {
    *a3 = 1;
    uint64_t v9 = *(void *)(a1 + 552);
    if ((v9 & 0x20000) != 0)
    {
      uint64_t result = 0;
      __int16 v19 = 785;
    }
    else if ((v9 & 0x8000) != 0)
    {
      uint64_t result = 0;
      __int16 v19 = 770;
    }
    else if ((v9 & 0x800) != 0)
    {
      uint64_t result = 0;
      __int16 v19 = 768;
    }
    else if ((v9 & 0x4000) != 0)
    {
      uint64_t result = 0;
      __int16 v19 = 528;
    }
    else
    {
      if ((v9 & 0x2000) == 0)
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          smb2_smb_get_client_dialects_cold_3(a1 + 552, v10, v11, v12, v13, v14, v15, v16);
        }
        return 22;
      }
      uint64_t result = 0;
      __int16 v19 = 514;
    }
    *a4 = v19;
    return result;
  }
  uint64_t v17 = *(void *)(a1 + 560) & 0x1002;
  switch(v17)
  {
    case 2:
      uint64_t result = 0;
      *a3 = 2;
      *(_DWORD *)a4 = 34603522;
      break;
    case 4096:
      uint64_t result = 0;
      *a3 = 3;
      *(_DWORD *)a4 = 50463488;
      a4[2] = 785;
      break;
    case 4098:
      if ((*(unsigned char *)(a1 + 555) & 0x40) != 0)
      {
        if (piston_log_level)
        {
          BOOL v20 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
          if (v20) {
            smb2_smb_get_client_dialects_cold_2(v20, v21, v22, v23, v24, v25, v26, v27);
          }
        }
        __int16 v18 = 4;
      }
      else
      {
        __int16 v18 = 5;
      }
      uint64_t result = 0;
      *a3 = v18;
      *(void *)a4 = 0x302030002100202;
      a4[4] = 785;
      break;
    default:
      return 0;
  }
  return result;
}

uint64_t smb2_smb_get_client_security_mode(uint64_t a1)
{
  if (a1)
  {
    if (*(unsigned char *)(a1 + 561)) {
      return 2;
    }
  }
  else
  {
    BOOL v2 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v2) {
      smb2_smb_get_client_security_mode_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
  return 1;
}

void smb2fs_smb_file_id_check(uint64_t a1, uint64_t a2, _DWORD *a3, int a4)
{
  if (a2) {
    return;
  }
  uint64_t v5 = *(void *)(a1 + 560);
  if ((v5 & 0x10) == 0) {
    return;
  }
  if (a3 && a4)
  {
    if (a4 == 4)
    {
      int v6 = *a3 - 3014656;
LABEL_9:
      if (v6 == 46) {
        return;
      }
      goto LABEL_10;
    }
    if (a4 == 2)
    {
      int v6 = *(unsigned __int16 *)a3;
      goto LABEL_9;
    }
  }
LABEL_10:
  if (piston_log_level)
  {
    BOOL v7 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v7) {
      smb2fs_smb_file_id_check_cold_1(v7, v8, v9, v10, v11, v12, v13, v14);
    }
    uint64_t v5 = *(void *)(a1 + 560);
  }
  *(void *)(a1 + 560) = v5 & 0xFFFFFFFFFFFFFFEFLL;
}

uint64_t piston_get_create_options(void *a1, uint64_t a2, void *a3, void *a4, void *a5, int a6, __int16 a7, int a8)
{
  id v15 = a1;
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  uint64_t v19 = a6 == 2;
  if (a8)
  {
    BOOL v20 = [v15 getShare:a2];
    uint64_t v21 = v20;
    if (v20)
    {
      if ([v20 fstype])
      {
        if ((objc_msgSend(v21, "file_system_attrs") & 0x80) == 0) {
          goto LABEL_26;
        }
      }
      else
      {
        BOOL v22 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
        if (v22) {
          piston_get_create_options_cold_2(v22, v23, v24, v25, v26, v27, v28, v29);
        }
      }
    }
    else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      piston_get_create_options_cold_1();
    }
    BOOL v32 = (a7 & 0x1400) != 0x400 || v18 != 0 || v17 != 0 || v16 == 0;
    unsigned int v33 = v19 | 0x200000;
    if (v32) {
      unsigned int v33 = a6 == 2;
    }
    if (a6 == 5) {
      uint64_t v19 = 0x200000;
    }
    else {
      uint64_t v19 = v33;
    }
  }
  else
  {
    uint64_t v21 = 0;
  }
LABEL_26:

  return v19;
}

uint64_t smb2fs_fullpath(uint64_t a1, char *a2, size_t a3, const char *a4, uint64_t a5, char a6)
{
  if (a2)
  {
    size_t v12 = 2 * a3 + 2;
    size_t v18 = v12;
    uint64_t v13 = (UInt8 *)malloc_type_malloc(v12, 0xDE2F6702uLL);
    if (!v13) {
      return 12;
    }
    uint64_t v14 = v13;
    bzero(v13, v12);
    uint64_t v15 = smb_convert_path_to_network(a2, a3, v14, &v18, 92, a6, 1);
    if (v15)
    {
      uint64_t v16 = v15;
      free(v14);
      return v16;
    }
    uint64_t v16 = mb_put_mem(a1, (char *)v14, v18, 0);
    free(v14);
    if (v16) {
      return v16;
    }
  }
  if (!a4) {
    return 0;
  }
  uint64_t v16 = mb_put_uint16le(a1, 58);
  if (!v16)
  {
    uint64_t v16 = smb_put_dmem(a1, a4, a5, a6, 1, 0);
    if (!v16) {
      return 0;
    }
  }
  return v16;
}

UInt8 *smbfs_ntwrkname_tolocal(const UInt8 *a1, unint64_t *a2, int a3)
{
  uint64_t v13 = a1;
  if (!a2 || !*a2) {
    return 0;
  }
  uint64_t v5 = 9;
  if (!a3) {
    uint64_t v5 = 3;
  }
  if (*a2 * v5 >= 0x1FFFF) {
    CFIndex v6 = 0x1FFFFLL;
  }
  else {
    CFIndex v6 = *a2 * v5;
  }
  BOOL v7 = (UInt8 *)malloc_type_malloc(v6 + 1, 0x2C168D1FuLL);
  CFIndex v10 = v6;
  unint64_t v11 = *a2;
  size_t v12 = v7;
  smb_convert_from_network(&v13, &v11, &v12, &v10, 32, a3);
  CFIndex v8 = v6 - v10;
  *a2 = v6 - v10;
  v7[v8] = 0;
  return v7;
}

uint64_t smbfs_ntwrkname_tolocal_buffer(const UInt8 *a1, unint64_t *a2, UInt8 *a3, unint64_t a4, int a5)
{
  uint64_t v15 = a1;
  if (!a2) {
    return 22;
  }
  unint64_t v6 = *a2;
  if (!*a2) {
    return 22;
  }
  if (a5) {
    unint64_t v9 = 9 * v6;
  }
  else {
    unint64_t v9 = 3 * v6;
  }
  if (v9 >= 0x1FFFF) {
    unint64_t v9 = 0x1FFFFLL;
  }
  if (v9 > a4) {
    return 28;
  }
  unint64_t v13 = *a2;
  uint64_t v14 = a3;
  unint64_t v12 = a4;
  smb_convert_from_network(&v15, &v13, &v14, (CFIndex *)&v12, 32, a5);
  uint64_t result = 0;
  unint64_t v11 = a4 - v12;
  *a2 = a4 - v12;
  a3[v11] = 0;
  return result;
}

void OUTLINED_FUNCTION_1_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void piston_close_file(void *a1, char a2, _DWORD *a3, void *a4)
{
  id v7 = a1;
  CFIndex v8 = a4;
  uint64_t v9 = [v7 pd];
  CFIndex v10 = [v9 sock];

  if (!v10)
  {
    BOOL v11 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v11)
    {
      piston_close_file_cold_1(v11, v12, v13, v14, v15, v16, v17, v18);
      if (!v8) {
        goto LABEL_8;
      }
    }
    else if (!v8)
    {
      goto LABEL_8;
    }
    v8[2](v8, 57);
    goto LABEL_8;
  }
  if (smb2_smb_close(v7, a2, a3, 0, v8) && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    piston_close_file_cold_2();
  }
LABEL_8:
}

uint64_t smb2_smb_close(void *a1, char a2, _DWORD *a3, void *a4, void *a5)
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v9 = a1;
  CFIndex v10 = a5;
  uint64_t v44 = 0;
  uint64_t v45 = &v44;
  uint64_t v46 = 0x2020000000;
  uint64_t v47 = 0;
  if (!a4 && ![v9 fid])
  {
    [v9 fid];
    if (!v11)
    {
      BOOL v12 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
      if (v12) {
        smb2_smb_close_cold_3(v12, v13, v14, v15, v16, v17, v18, v19);
      }
    }
  }
  uint64_t v20 = [v9 treeID];
  uint64_t v21 = [v9 onEncryptedShare];
  BOOL v22 = [v9 pd];
  id v43 = 0;
  uint64_t v23 = smb2_rq_alloc(6, v20, v21, 0, v22, &v43);
  id v24 = v43;

  if (v23)
  {
    if (v24) {
      objc_msgSend(v24, "smb_rq_done");
    }
    if (v10) {
      v10[2](v10, v23);
    }
  }
  else
  {
    objc_msgSend(v24, "smb_rq_set_extflag:", 8);
    uint64_t v25 = objc_msgSend(v24, "smb_rq_getrequest");
    mb_put_uint16le(v25, 24);
    __int16 v26 = a2 & 1;
    mb_put_uint16le(v25, v26);
    mb_put_uint32le(v25, 0);
    if (a4)
    {
      mb_put_uint64le(v25, -1);
      mb_put_uint64le(v25, -1);
      smb2_rq_align8(v24);
      objc_msgSend(v24, "smb_rq_set_srflags:", 256);
      uint64_t v23 = 0;
      *a4 = v24;
    }
    else
    {
      mb_put_uint64le(v25, [v9 fid]);
      [v9 fid];
      mb_put_uint64le(v25, v27);
      if (v10)
      {
        uint64_t v28 = [v9 pd];
        v36[0] = MEMORY[0x263EF8330];
        v36[1] = 3221225472;
        v36[2] = __smb2_smb_close_block_invoke;
        v36[3] = &unk_265072E08;
        uint64_t v29 = v10;
        uint64_t v39 = v29;
        uint64_t v41 = a3;
        id v30 = v24;
        id v37 = v30;
        uint64_t v40 = &v44;
        __int16 v42 = v26;
        id v38 = v9;
        uint64_t v23 = smb_rq_simple_block(v28, v30, v36);

        if (v23)
        {
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
            smb2_smb_close_cold_2();
          }
          if (v30) {
            objc_msgSend(v30, "smb_rq_done");
          }
          v29[2](v29, v23);
        }
      }
      else
      {
        uint64_t v31 = [v9 pd];
        uint64_t v23 = smb_rq_simple(v31, v24);

        *a3 = objc_msgSend(v24, "sr_ntstatus");
        if (v23)
        {
          BOOL v32 = &_os_log_internal;
          id v33 = &_os_log_internal;
          if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
            smb2_smb_close_cold_1(v48, v23, objc_msgSend(v24, "sr_ntstatus"));
          }
        }
        else
        {
          uint64_t v34 = objc_msgSend(v24, "smb_rq_getreply");
          v45[3] = (uint64_t)v34;
          uint64_t v23 = smb2_smb_parse_close(v34, v26, (uint64_t)a3);
          if (!v23) {
            [v9 setIsOpen:0];
          }
        }
        objc_msgSend(v24, "smb_rq_done");
      }
    }
  }
  _Block_object_dispose(&v44, 8);

  return v23;
}

void sub_23F8596E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void piston_create_file(void *a1, uint64_t a2, void *a3)
{
  id v5 = a1;
  unint64_t v6 = a3;
  id v7 = [v5 pd];
  CFIndex v8 = [v7 sock];

  if (!v8)
  {
    BOOL v9 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v9)
    {
      piston_create_file_cold_1(v9, v10, v11, v12, v13, v14, v15, v16);
      if (!v6) {
        goto LABEL_8;
      }
    }
    else if (!v6)
    {
      goto LABEL_8;
    }
    v6[2](v6, 57);
    goto LABEL_8;
  }
  if (smb2_smb_create(v5, a2, 0, 0, v6)
    && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    piston_create_file_cold_2();
  }
LABEL_8:
}

uint64_t smb2_smb_create(void *a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  uint64_t v96 = *MEMORY[0x263EF8340];
  id v8 = a1;
  id v81 = a3;
  id v9 = a5;
  uint64_t v91 = 0;
  CFIndex v92 = &v91;
  uint64_t v93 = 0x2020000000;
  uint64_t v94 = 0;
  uint64_t v90 = 0;
  uint64_t v10 = [v8 name];
  cstring_len = (char *)smb_get_cstring_len(v10, (_DWORD *)&v90 + 1);

  uint64_t v12 = [v8 streamName];
  uint64_t v13 = smb_get_cstring_len(v12, &v90);

  uint64_t v14 = [v8 treeID];
  uint64_t v15 = [v8 onEncryptedShare];
  uint64_t v16 = [v8 pd];
  id v89 = 0;
  uint64_t v17 = smb2_rq_alloc(5, v14, v15, 0, v16, &v89);
  id v18 = v89;

  if (!v17)
  {
    objc_msgSend(v18, "smb_rq_set_extflag:", 8);
    uint64_t v19 = objc_msgSend(v18, "smb_rq_getrequest");
    mb_put_uint16le(v19, 57);
    mb_put_uint8(v19, 0);
    mb_put_uint8(v19, *(unsigned char *)(a2 + 8));
    mb_put_uint32le(v19, *(_DWORD *)(a2 + 12));
    mb_put_uint64le(v19, 0);
    mb_put_uint64le(v19, 0);
    mb_put_uint32le(v19, *(_DWORD *)(a2 + 16));
    mb_put_uint32le(v19, *(_DWORD *)(a2 + 20));
    mb_put_uint32le(v19, *(_DWORD *)(a2 + 24));
    mb_put_uint32le(v19, *(_DWORD *)(a2 + 28));
    mb_put_uint32le(v19, *(_DWORD *)(a2 + 32));
    mb_put_uint16le(v19, 120);
    uint64_t v20 = (_WORD *)mb_reserve(v19, 2uLL);
    uint64_t v21 = (_DWORD *)mb_reserve(v19, 4uLL);
    CFRange v79 = (_DWORD *)mb_reserve(v19, 4uLL);
    BOOL v22 = [v8 name];
    if (v22)
    {
    }
    else
    {
      uint64_t v23 = [v8 streamName];
      BOOL v24 = v23 == 0;

      if (v24)
      {
        *uint64_t v20 = 0;
LABEL_24:
        mb_put_uint16le(v19, 0);
        int v25 = (unsigned __int16)*v20;
LABEL_25:
        uint64_t v27 = [v8 pd];
        uint64_t v28 = [v27 getSessionPtr];

        uint64_t v29 = *(void *)a2;
        if ((*(void *)a2 & 0x4F4) == 0)
        {
          *CFRange v79 = 0;
          *uint64_t v21 = 0;
LABEL_85:
          if (a4)
          {
            smb2_rq_align8(v18);
            objc_msgSend(v18, "smb_rq_set_srflags:", 256);
            uint64_t v17 = 0;
            *a4 = v18;
          }
          else if (v9)
          {
            unint64_t v71 = [v8 pd];
            v82[0] = MEMORY[0x263EF8330];
            v82[1] = 3221225472;
            v82[2] = __smb2_smb_create_block_invoke;
            v82[3] = &unk_265072E30;
            id v72 = v9;
            id v86 = v72;
            uint64_t v88 = a2;
            id v73 = v18;
            id v83 = v73;
            uint64_t v87 = &v91;
            id v84 = v8;
            id v85 = v81;
            uint64_t v17 = smb_rq_simple_block(v71, v73, v82);

            if (v17)
            {
              if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
                smb2_smb_create_cold_2();
              }
              if (v73) {
                objc_msgSend(v73, "smb_rq_done");
              }
              (*((void (**)(id, uint64_t))v72 + 2))(v72, v17);
            }
          }
          else
          {
            unsigned int v74 = [v8 pd];
            uint64_t v17 = smb_rq_simple(v74, v18);

            *(_DWORD *)(a2 + 52) = objc_msgSend(v18, "sr_ntstatus");
            if (v17)
            {
              int v75 = &_os_log_internal;
              id v76 = &_os_log_internal;
              if (os_log_type_enabled(v75, OS_LOG_TYPE_ERROR)) {
                smb2_smb_create_cold_1(v95, v17, objc_msgSend(v18, "sr_ntstatus"));
              }
            }
            else
            {
              uint64_t v77 = (__n128 *)objc_msgSend(v18, "smb_rq_getreply");
              v92[3] = (uint64_t)v77;
              uint64_t v17 = smb2_smb_parse_create(v8, v77, a2, v81);
              if (!v17)
              {
                objc_msgSend(v8, "setFid:", *(void *)(a2 + 120), *(void *)(a2 + 128));
                [v8 setIsOpen:1];
                uint64_t v17 = 0;
              }
            }
            objc_msgSend(v18, "smb_rq_done");
          }
          goto LABEL_102;
        }
        if (v25) {
          int v30 = v25 + 120;
        }
        else {
          int v30 = 122;
        }
        int v31 = v30 & 7;
        if ((v30 & 7) != 0)
        {
          int v32 = 8 - v31;
          mb_put_mem(v19, 0, (8 - v31), 3);
          v30 += v32;
          uint64_t v29 = *(void *)a2;
        }
        *uint64_t v21 = v30;
        if ((v29 & 0x10) != 0)
        {
          uint64_t v35 = (_DWORD *)mb_reserve(v19, 4uLL);
          *uint64_t v35 = 0;
          mb_put_uint16le(v19, 16);
          mb_put_uint16le(v19, 4);
          mb_put_uint16le(v19, 0);
          mb_put_uint16le(v19, 24);
          mb_put_uint32le(v19, 24);
          mb_put_uint32be(v19, 0x4141504Cu);
          mb_put_uint32le(v19, 0);
          mb_put_uint32le(v19, 1);
          mb_put_uint32le(v19, 0);
          mb_put_uint64le(v19, 7);
          mb_put_uint64le(v19, 31);
          uint64_t v37 = *(void *)a2;
          int v33 = 48;
          if ((*(void *)a2 & 0x20) == 0)
          {
            int v36 = 48;
            if ((v37 & 4) != 0)
            {
LABEL_45:
              *uint64_t v35 = v36;
              goto LABEL_47;
            }
LABEL_40:
            if ((v37 & 0x40) != 0)
            {
LABEL_48:
              *uint64_t v35 = v36;
LABEL_49:
              if (*(unsigned char *)(a2 + 233))
              {
                int v38 = *(_DWORD *)(a2 + 244);
                uint64_t v35 = (_DWORD *)mb_reserve(v19, 4uLL);
                *uint64_t v35 = 0;
                mb_put_uint16le(v19, 16);
                mb_put_uint16le(v19, 4);
                mb_put_uint16le(v19, 0);
                mb_put_uint16le(v19, 24);
                mb_put_uint32le(v19, 32);
                mb_put_uint32be(v19, 0x44483251u);
                mb_put_uint32le(v19, 0);
                mb_put_uint32le(v19, v38);
                if ((*(unsigned char *)(a2 + 232) & 0x20) != 0)
                {
                  BOOL v40 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
                  if (v40) {
                    smb2_smb_create_cold_5(v40, v41, v42, v43, v44, v45, v46, v47);
                  }
                  int v39 = 2;
                }
                else
                {
                  int v39 = 0;
                }
                mb_put_uint32le(v19, v39);
                mb_put_uint64le(v19, 0);
                mb_put_mem(v19, (char *)(a2 + 200), 0x10uLL, 0);
                v33 += 56;
                *(void *)(a2 + 232) |= 0x100uLL;
                int v36 = 56;
              }
              else
              {
                uint64_t v35 = (_DWORD *)mb_reserve(v19, 4uLL);
                *uint64_t v35 = 0;
                mb_put_uint16le(v19, 16);
                mb_put_uint16le(v19, 4);
                mb_put_uint16le(v19, 0);
                mb_put_uint16le(v19, 24);
                mb_put_uint32le(v19, 16);
                mb_put_uint32be(v19, 0x44486E51u);
                mb_put_uint32le(v19, 0);
                mb_put_uint64le(v19, 0);
                mb_put_uint64le(v19, 0);
                v33 += 40;
                int v36 = 40;
              }
            }
LABEL_57:
            if ((*(unsigned char *)a2 & 0x80) == 0)
            {
              uint64_t v34 = v28;
              goto LABEL_68;
            }
            *uint64_t v35 = v36;
LABEL_60:
            uint64_t v48 = *(void *)(a2 + 232);
            uint64_t v35 = (_DWORD *)mb_reserve(v19, 4uLL);
            *uint64_t v35 = 0;
            mb_put_uint16le(v19, 16);
            mb_put_uint16le(v19, 4);
            mb_put_uint16le(v19, 0);
            mb_put_uint16le(v19, 24);
            if ((v48 & 0x100) != 0)
            {
              mb_put_uint32le(v19, 36);
              mb_put_uint32be(v19, 0x44483243u);
              mb_put_uint32le(v19, 0);
              mb_put_uint64le(v19, *(void *)(a2 + 216));
              mb_put_uint64le(v19, *(void *)(a2 + 224));
              mb_put_mem(v19, (char *)(a2 + 200), 0x10uLL, 0);
              if ((*(unsigned char *)(a2 + 232) & 0x40) != 0)
              {
                BOOL v50 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
                if (v50) {
                  smb2_smb_create_cold_4(v50, v51, v52, v53, v54, v55, v56, v57);
                }
                int v49 = 2;
              }
              else
              {
                int v49 = 0;
              }
              mb_put_uint32le(v19, v49);
              mb_put_uint32le(v19, 0);
              uint64_t v34 = v28;
              v33 += 64;
              int v36 = 64;
            }
            else
            {
              mb_put_uint32le(v19, 16);
              mb_put_uint32be(v19, 0x44486E43u);
              mb_put_uint32le(v19, 0);
              mb_put_uint64le(v19, *(void *)(a2 + 216));
              mb_put_uint64le(v19, *(void *)(a2 + 224));
              uint64_t v34 = v28;
              v33 += 40;
              int v36 = 40;
            }
            goto LABEL_68;
          }
          *(_DWORD *)(a2 + 144) = 2;
          *uint64_t v35 = 48;
          int v33 = 88;
        }
        else
        {
          if ((v29 & 0x20) == 0)
          {
            int v33 = 0;
            if ((v29 & 4) == 0)
            {
              if ((v29 & 0x40) == 0)
              {
                if ((v29 & 0x80) == 0)
                {
                  uint64_t v34 = v28;
                  uint64_t v35 = 0;
                  int v36 = 0;
LABEL_68:
                  uint64_t v58 = *(void *)a2;
                  if ((*(void *)a2 & 0x4C0) != 0)
                  {
                    if ((*(_DWORD *)(v34 + 552) & 0x28800) != 0 && (*(unsigned char *)(a2 + 232) & 0x60) != 0)
                    {
                      BOOL v59 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
                      if (v59) {
                        smb2_smb_create_cold_3(v59, v60, v61, v62, v63, v64, v65, v66);
                      }
                    }
                    else
                    {
                      uint64_t v67 = 240;
                      if ((v58 & 0x80) == 0) {
                        uint64_t v67 = 168;
                      }
                      int v68 = *(_DWORD *)(a2 + v67);
                      if (v35) {
                        *uint64_t v35 = v36;
                      }
                      uint64_t v69 = *(void *)(a2 + 232);
                      *(_DWORD *)mb_reserve(v19, 4uLL) = 0;
                      mb_put_uint16le(v19, 16);
                      mb_put_uint16le(v19, 4);
                      mb_put_uint16le(v19, 0);
                      mb_put_uint16le(v19, 24);
                      if (v69 & 0x100 | v58 & 0x400)
                      {
                        mb_put_uint32le(v19, 52);
                        mb_put_uint32be(v19, 0x52714C73u);
                        mb_put_uint32le(v19, 0);
                        mb_put_uint64le(v19, *(void *)(a2 + 152));
                        mb_put_uint64le(v19, *(void *)(a2 + 160));
                        mb_put_uint32le(v19, v68);
                        if (*(void *)(a2 + 176) && *(void *)(a2 + 184))
                        {
                          mb_put_uint32le(v19, 4);
                          mb_put_uint64le(v19, 0);
                          mb_put_uint64le(v19, *(void *)(a2 + 176));
                          uint64_t v70 = *(void *)(a2 + 184);
                        }
                        else
                        {
                          mb_put_uint32le(v19, 0);
                          mb_put_uint64le(v19, 0);
                          mb_put_uint64le(v19, 0);
                          uint64_t v70 = 0;
                        }
                        mb_put_uint64le(v19, v70);
                        *(_WORD *)(a2 + 192) = 0;
                        mb_put_uint16le(v19, 0);
                        mb_put_uint16le(v19, 0);
                        mb_put_uint32le(v19, 0);
                        v33 += 80;
                        *(void *)(a2 + 232) |= 0x200uLL;
                      }
                      else
                      {
                        mb_put_uint32le(v19, 32);
                        mb_put_uint32be(v19, 0x52714C73u);
                        mb_put_uint32le(v19, 0);
                        mb_put_uint64le(v19, *(void *)(a2 + 152));
                        mb_put_uint64le(v19, *(void *)(a2 + 160));
                        mb_put_uint32le(v19, v68);
                        mb_put_uint32le(v19, 0);
                        mb_put_uint64le(v19, 0);
                        v33 += 56;
                      }
                    }
                  }
                  *CFRange v79 = v33;
                  goto LABEL_85;
                }
                goto LABEL_60;
              }
              goto LABEL_49;
            }
            int v36 = 0;
LABEL_47:
            uint64_t v35 = (_DWORD *)mb_reserve(v19, 4uLL);
            *uint64_t v35 = 0;
            mb_put_uint16le(v19, 16);
            mb_put_uint16le(v19, 4);
            mb_put_uint16le(v19, 0);
            mb_put_uint16le(v19, 0);
            mb_put_uint32le(v19, 0);
            mb_put_uint32be(v19, 0x4D784163u);
            mb_put_uint32le(v19, 0);
            v33 += 24;
            if ((*(void *)a2 & 0x40) != 0) {
              goto LABEL_48;
            }
            goto LABEL_57;
          }
          *(_DWORD *)(a2 + 144) = 2;
          int v33 = 40;
        }
        uint64_t v35 = (_DWORD *)mb_reserve(v19, 4uLL);
        *uint64_t v35 = 0;
        mb_put_uint16le(v19, 16);
        mb_put_uint16le(v19, 4);
        mb_put_uint16le(v19, 0);
        mb_put_uint16le(v19, 24);
        mb_put_uint32le(v19, 16);
        mb_put_uint32be(v19, 0x4141504Cu);
        mb_put_uint32le(v19, 0);
        mb_put_uint32le(v19, 2);
        mb_put_uint32le(v19, 0);
        mb_put_uint64le(v19, *(void *)(a2 + 136));
        uint64_t v37 = *(void *)a2;
        int v36 = 40;
        if ((*(void *)a2 & 4) != 0) {
          goto LABEL_45;
        }
        goto LABEL_40;
      }
    }
    if ((*(unsigned char *)a2 & 8) != 0)
    {
      mb_put_mem(v19, cstring_len, HIDWORD(v90), 0);
      int v25 = WORD2(v90);
      *uint64_t v20 = WORD2(v90);
      if ((*(unsigned char *)(a2 + 1) & 8) == 0) {
        goto LABEL_21;
      }
      __int16 v26 = (_DWORD *)objc_msgSend(v18, "sr_flagsp");
      *v26 |= 0x10000000u;
    }
    else
    {
      smb2_rq_bstart(v18, (uint64_t)v20);
      uint64_t v17 = smb2fs_fullpath(v19, cstring_len, HIDWORD(v90), v13, v90, 32);
      if (v17)
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          smb2_smb_create_cold_6();
        }
        if (v18) {
          objc_msgSend(v18, "smb_rq_done");
        }
        if (v9) {
          goto LABEL_5;
        }
        goto LABEL_102;
      }
      smb_rq_bend(v18);
    }
    int v25 = (unsigned __int16)*v20;
LABEL_21:
    if (v25) {
      goto LABEL_25;
    }
    goto LABEL_24;
  }
  if (v18) {
    objc_msgSend(v18, "smb_rq_done");
  }
  if (v9) {
LABEL_5:
  }
    (*((void (**)(id, uint64_t))v9 + 2))(v9, v17);
LABEL_102:
  _Block_object_dispose(&v91, 8);

  return v17;
}

void sub_23F85A50C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void piston_resolveID(void *a1, int a2, uint64_t a3, void *a4, void *a5)
{
  id v9 = a1;
  id v10 = a4;
  uint64_t v11 = a5;
  uint64_t v12 = [v9 sock];

  if (!v12)
  {
    BOOL v21 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v21)
    {
      piston_resolveID_cold_1(v21, v22, v23, v24, v25, v26, v27, v28);
      if (!v11) {
        goto LABEL_10;
      }
    }
    else if (!v11)
    {
      goto LABEL_10;
    }
    v11[2](v11, 57);
    goto LABEL_10;
  }
  if (*(unsigned char *)([v9 getSessionPtr] + 592))
  {
    uint64_t v29 = [v9 sock];
    int v30 = objc_msgSend(v29, "signing_queue");
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __piston_resolveID_block_invoke;
    block[3] = &unk_265072DE0;
    int v36 = a2;
    id v32 = v9;
    uint64_t v35 = a3;
    id v33 = v10;
    uint64_t v34 = v11;
    dispatch_async(v30, block);

    goto LABEL_10;
  }
  BOOL v13 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
  if (v13)
  {
    piston_resolveID_cold_2(v13, v14, v15, v16, v17, v18, v19, v20);
    if (!v11) {
      goto LABEL_10;
    }
    goto LABEL_5;
  }
  if (v11) {
LABEL_5:
  }
    v11[2](v11, 45);
LABEL_10:
}

void __piston_resolveID_block_invoke(uint64_t a1)
{
  BOOL v2 = [*(id *)(a1 + 32) getShare:*(unsigned int *)(a1 + 64)];
  if (v2)
  {
    id v3 = [[SMBNode alloc] init:*(void *)(a1 + 32)];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = [v3 commonInit:*(void *)(a1 + 32) onShareID:*(unsigned int *)(a1 + 64)];
      if (v5)
      {
        uint64_t fid = v5;
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          __piston_resolveID_block_invoke_cold_5();
        }
      }
      else
      {
        uint64_t fid = smb2_smb_create_fid(v4, 0, 0, 1048705, 2, 7, 1, 33, *(_OWORD **)(a1 + 56), *(void **)(a1 + 40), 0);
        if (fid)
        {
          if (piston_log_level && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
            __piston_resolveID_block_invoke_cold_4();
          }
        }
        else if (smb2_smb_close_fid(v4, 0, 0) && piston_log_level)
        {
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
            __piston_resolveID_block_invoke_cold_3();
          }
          uint64_t fid = 0;
        }
      }
    }
    else
    {
      BOOL v7 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
      if (v7) {
        __piston_resolveID_block_invoke_cold_2(v7, v8, v9, v10, v11, v12, v13, v14);
      }
      uint64_t v4 = 0;
      uint64_t fid = 12;
    }
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      __piston_resolveID_block_invoke_cold_1();
    }
    uint64_t v4 = 0;
    uint64_t fid = 22;
  }
  uint64_t v15 = *(void *)(a1 + 48);
  if (v15) {
    (*(void (**)(uint64_t, uint64_t))(v15 + 16))(v15, fid);
  }
}

uint64_t smb2_smb_create_fid(void *a1, void *a2, void *a3, int a4, int a5, int a6, int a7, uint64_t a8, _OWORD *a9, void *a10, void *a11)
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v16 = a1;
  id v17 = a3;
  id v18 = a10;
  uint64_t v36 = 0;
  memset(&v35[1], 0, 224);
  if (a9) {
    uint64_t v19 = a9;
  }
  else {
    uint64_t v19 = v35;
  }
  v35[0] = 0uLL;
  id v20 = a2;
  BOOL v21 = [v16 pd];
  int options = piston_get_create_options(v21, [v16 shareID], v20, 0, 0, a5, 0, 0);

  *(void *)uint64_t v19 = a8;
  *((unsigned char *)v19 + 8) = 0;
  *((_DWORD *)v19 + 3) = 2;
  *((_DWORD *)v19 + 4) = a4;
  *((_DWORD *)v19 + 5) = 128;
  *((_DWORD *)v19 + 6) = a6;
  *((_DWORD *)v19 + 7) = a7;
  *((_DWORD *)v19 + 8) = options;
  [v16 setName:v20];

  if (v17) {
    [v16 setStreamName:v17];
  }
  uint64_t v23 = smb2_smb_create(v16, (uint64_t)v19, v18, a11, 0);
  if (v23 && piston_log_level && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    uint64_t v25 = v35;
    if (a9) {
      uint64_t v25 = a9;
    }
    int v26 = *((_DWORD *)v25 + 13);
    *(_DWORD *)buf = 136315650;
    int v30 = "smb2_smb_create_fid";
    __int16 v31 = 1024;
    int v32 = v23;
    __int16 v33 = 1024;
    int v34 = v26;
    _os_log_error_impl(&dword_23F849000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s: smb2_smb_create failed %d ntstatus 0x%x\n", buf, 0x18u);
  }

  return v23;
}

uint64_t smb2_smb_close_fid(void *a1, _DWORD *a2, void *a3)
{
  memset(v7, 0, sizeof(v7));
  if (a2) {
    id v3 = a2;
  }
  else {
    id v3 = v7;
  }
  uint64_t v4 = smb2_smb_close(a1, 0, v3, a3, 0);
  if (v4) {
    BOOL v5 = piston_log_level == 0;
  }
  else {
    BOOL v5 = 1;
  }
  if (!v5 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    smb2_smb_close_fid_cold_1();
  }
  return v4;
}

uint64_t smb2_smb_parse_close(void *a1, char a2, uint64_t a3)
{
  __int16 v11 = 0;
  int v10 = 0;
  __int16 v9 = 0;
  int v8 = 0;
  uint64_t v7 = 0;
  uint64_t result = md_get_uint16le(a1, &v9);
  if (!result)
  {
    if (v9 == 60)
    {
      uint64_t result = md_get_uint16le(a1, &v11);
      if (!result)
      {
        if (a2)
        {
          if ((v11 & 1) == 0)
          {
            uint64_t result = 0;
            *(_DWORD *)(a3 + 56) = 0;
            *(_OWORD *)(a3 + 40) = 0u;
            *(_OWORD *)(a3 + 24) = 0u;
            *(_OWORD *)(a3 + 8) = 0u;
            return result;
          }
        }
        else if ((v11 & 1) == 0)
        {
          return 0;
        }
        uint64_t result = md_get_uint32le(a1, &v10);
        if (!result)
        {
          uint64_t result = md_get_uint64le(a1, &v7);
          if (!result)
          {
            *(void *)(a3 + 8) = v7;
            uint64_t result = md_get_uint64le(a1, &v7);
            if (!result)
            {
              *(void *)(a3 + 16) = v7;
              uint64_t result = md_get_uint64le(a1, &v7);
              if (!result)
              {
                *(void *)(a3 + 24) = v7;
                uint64_t result = md_get_uint64le(a1, &v7);
                if (!result)
                {
                  *(void *)(a3 + 32) = v7;
                  uint64_t result = md_get_uint64le(a1, &v7);
                  if (!result)
                  {
                    *(void *)(a3 + 40) = v7;
                    uint64_t result = md_get_uint64le(a1, &v7);
                    if (!result)
                    {
                      *(void *)(a3 + 48) = v7;
                      uint64_t result = md_get_uint32le(a1, &v8);
                      if (!result) {
                        *(_DWORD *)(a3 + 56) = v8;
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
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        smb2_smb_parse_close_cold_1();
      }
      return 72;
    }
  }
  return result;
}

void __smb2_smb_close_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (void (**)(void, void))MEMORY[0x2455D48A0](*(void *)(a1 + 48));
  BOOL v5 = (id *)(a1 + 32);
  **(_DWORD **)(a1 + 64) = objc_msgSend(*(id *)(a1 + 32), "sr_ntstatus");
  if (a2)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      __smb2_smb_close_block_invoke_cold_1((id *)(a1 + 32));
    }
  }
  else
  {
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "smb_rq_getreply");
    a2 = smb2_smb_parse_close(*(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 24), *(_WORD *)(a1 + 72), *(void *)(a1 + 64));
    if (!a2) {
      [*(id *)(a1 + 40) setIsOpen:0];
    }
  }
  if (*v5) {
    objc_msgSend(*v5, "smb_rq_done");
  }
  if (v4) {
    v4[2](v4, a2);
  }
}

uint64_t smb2_smb_parse_create(void *a1, __n128 *a2, uint64_t a3, void *a4)
{
  id v7 = a1;
  id v8 = a4;
  __int16 v27 = 0;
  char v26 = 0;
  int v25 = 0;
  uint64_t v23 = 0;
  uint64_t v24 = 0;
  long long v22 = 0uLL;
  __int16 v9 = [v7 pd];
  uint64_t v10 = [v9 getSessionPtr];

  uint64_t uint16le = md_get_uint16le(a2, &v27);
  if (!uint16le)
  {
    if (v27 == 89)
    {
      uint64_t uint16le = md_get_uint8(a2, &v26);
      if (!uint16le)
      {
        *(unsigned char *)(a3 + 56) = v26;
        uint64_t uint16le = md_get_uint8(a2, &v26);
        if (!uint16le)
        {
          if ((*(_DWORD *)(v10 + 552) & 0x28800) != 0) {
            *(unsigned char *)(a3 + 57) = v26;
          }
          uint64_t uint16le = md_get_uint32le(a2, &v25);
          if (!uint16le)
          {
            *(_DWORD *)(a3 + 60) = v25;
            uint64_t uint16le = md_get_uint64le(a2, &v24);
            if (!uint16le)
            {
              *(void *)(a3 + 64) = v24;
              uint64_t uint16le = md_get_uint64le(a2, &v24);
              if (!uint16le)
              {
                *(void *)(a3 + 72) = v24;
                uint64_t uint16le = md_get_uint64le(a2, &v24);
                if (!uint16le)
                {
                  *(void *)(a3 + 80) = v24;
                  uint64_t uint16le = md_get_uint64le(a2, &v24);
                  if (!uint16le)
                  {
                    *(void *)(a3 + 88) = v24;
                    uint64_t uint16le = md_get_uint64le(a2, &v24);
                    if (!uint16le)
                    {
                      *(void *)(a3 + 96) = v24;
                      uint64_t uint16le = md_get_uint64le(a2, &v24);
                      if (!uint16le)
                      {
                        *(void *)(a3 + 104) = v24;
                        uint64_t uint16le = md_get_uint32le(a2, &v25);
                        if (!uint16le)
                        {
                          *(_DWORD *)(a3 + 112) = v25;
                          uint64_t uint16le = md_get_uint32le(a2, &v25);
                          if (!uint16le)
                          {
                            uint64_t uint16le = md_get_uint64le(a2, &v22);
                            if (!uint16le)
                            {
                              uint64_t uint16le = md_get_uint64le(a2, (void *)&v22 + 1);
                              if (!uint16le)
                              {
                                uint64_t uint16le = md_get_uint32le(a2, (_DWORD *)&v23 + 1);
                                if (!uint16le)
                                {
                                  uint64_t uint16le = md_get_uint32le(a2, &v23);
                                  if (!uint16le)
                                  {
                                    if (!v23
                                      || (uint64_t uint16le = smb2_smb_parse_create_contexts(v7, a2, (_DWORD *)&v23 + 1, a3, v8),
                                          !uint16le))
                                    {
                                      if ((*(unsigned char *)a3 & 0x10) != 0)
                                      {
                                        uint64_t v12 = *(void *)(v10 + 560);
                                        if ((v12 & 0x40) == 0)
                                        {
                                          if (piston_log_level)
                                          {
                                            BOOL v13 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
                                            if (v13) {
                                              smb2_smb_parse_create_cold_1(v13, v14, v15, v16, v17, v18, v19, v20);
                                            }
                                            uint64_t v12 = *(void *)(v10 + 560);
                                          }
                                          *(void *)(v10 + 560) = v12 | 0x80;
                                        }
                                      }
                                      uint64_t uint16le = 0;
                                      *(_OWORD *)(a3 + 120) = v22;
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
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        smb2_smb_parse_create_cold_2();
      }
      uint64_t uint16le = 72;
    }
  }

  return uint16le;
}

void __smb2_smb_create_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (void (**)(void, void))MEMORY[0x2455D48A0](*(void *)(a1 + 56));
  BOOL v5 = (id *)(a1 + 32);
  *(_DWORD *)(*(void *)(a1 + 72) + 52) = objc_msgSend(*(id *)(a1 + 32), "sr_ntstatus");
  if (a2)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      __smb2_smb_create_block_invoke_cold_1((id *)(a1 + 32));
    }
  }
  else
  {
    *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "smb_rq_getreply");
    a2 = smb2_smb_parse_create(*(void **)(a1 + 40), *(__n128 **)(*(void *)(*(void *)(a1 + 64) + 8) + 24), *(void *)(a1 + 72), *(void **)(a1 + 48));
    if (!a2)
    {
      objc_msgSend(*(id *)(a1 + 40), "setFid:", *(void *)(*(void *)(a1 + 72) + 120), *(void *)(*(void *)(a1 + 72) + 128));
      [*(id *)(a1 + 40) setIsOpen:1];
    }
  }
  if (*v5) {
    objc_msgSend(*v5, "smb_rq_done");
  }
  if (v4) {
    v4[2](v4, a2);
  }
}

uint64_t smb2_smb_parse_create_contexts(void *a1, __n128 *a2, _DWORD *a3, uint64_t a4, void *a5)
{
  uint64_t v94 = *MEMORY[0x263EF8340];
  id v9 = a1;
  id v10 = a5;
  unsigned int v68 = 0;
  int v67 = 0;
  __int16 v66 = 0;
  unsigned int v65 = 0;
  uint64_t v63 = 0;
  uint64_t v64 = 0;
  __s = 0;
  uint64_t v62 = 0;
  unsigned int v60 = 0;
  memset(v59, 0, sizeof(v59));
  uint64_t v57 = 0;
  uint64_t v58 = 0;
  int v56 = 0;
  __int16 v55 = 0;
  uint64_t v54 = 0;
  __int16 v11 = [v9 pd];
  uint64_t v12 = (void *)[v11 getSessionPtr];

  if (!*a3 || (uint64_t v13 = (*a3 - 152), *a3 = v13, v14 = md_get_mem(a2, 0, v13, 0), !v14))
  {
    uint64_t v16 = 0;
    while (1)
    {
      md_shadow_copy(a2, v59);
      uint64_t uint32le = md_get_uint32le(v59, &v68);
      if (uint32le
        || (uint64_t uint32le = md_get_uint16le(v59, (_WORD *)&v67 + 1), uint32le)
        || (uint64_t uint32le = md_get_uint16le(v59, &v67), uint32le))
      {
LABEL_144:
        uint64_t mem = uint32le;
        goto LABEL_145;
      }
      if ((unsigned __int16)v67 != 4)
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          smb2_smb_parse_create_contexts_cold_20();
        }
        goto LABEL_148;
      }
      uint64_t uint32le = md_get_uint16le(v59, 0);
      if (uint32le) {
        goto LABEL_144;
      }
      uint64_t uint32le = md_get_uint16le(v59, &v66);
      if (uint32le) {
        goto LABEL_144;
      }
      uint64_t uint32le = md_get_uint32le(v59, &v65);
      if (uint32le) {
        goto LABEL_144;
      }
      uint64_t uint32le = md_get_uint32be(v59, (_DWORD *)&v64 + 1);
      if (uint32le) {
        goto LABEL_144;
      }
      uint64_t uint32le = md_get_uint32le(v59, 0);
      if (uint32le) {
        goto LABEL_144;
      }
      if (SHIDWORD(v64) <= 1145597506)
      {
        switch(HIDWORD(v64))
        {
          case 0x4141504C:
            if (v65 <= 7)
            {
              if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
                smb2_smb_parse_create_contexts_cold_13();
              }
              goto LABEL_148;
            }
            uint64_t uint32le = md_get_uint32le(v59, &v63);
            if (uint32le) {
              goto LABEL_144;
            }
            uint64_t uint32le = md_get_uint32le(v59, 0);
            if (uint32le) {
              goto LABEL_144;
            }
            if (v63 == 2)
            {
              if (!v10)
              {
                if (piston_log_level)
                {
                  BOOL v46 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
                  if (v46) {
                    smb2_smb_parse_create_contexts_cold_18(v46, v47, v48, v49, v50, v51, v52, v53);
                  }
                }
                goto LABEL_148;
              }
              if (v65 <= 0xF)
              {
                if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
                  smb2_smb_parse_create_contexts_cold_19();
                }
                goto LABEL_148;
              }
              uint64_t uint32le = md_get_uint32le(v59, &v60);
              if (uint32le) {
                goto LABEL_144;
              }
              *(_DWORD *)(a4 + 144) = piston_ntstatus_to_errno(v60);
              smb2_smb_parse_create_str(v59, 1, (UInt8 **)&__s);
              if (__s)
              {
                uint64_t v36 = [[NSString alloc] initWithCString:__s encoding:4];

                [v10 setString:v36];
                free(__s);
                __s = 0;
                uint64_t v16 = (void *)v36;
              }
            }
            else
            {
              if (v63 != 1)
              {
                if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
                  smb2_smb_parse_create_contexts_cold_14();
                }
                goto LABEL_148;
              }
              if (v65 <= 0xF)
              {
                if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
                  smb2_smb_parse_create_contexts_cold_15();
                }
                goto LABEL_148;
              }
              uint64_t uint32le = md_get_uint64le(v59, &v62);
              if (uint32le) {
                goto LABEL_144;
              }
              if (v62) {
                unsigned int v25 = 24;
              }
              else {
                unsigned int v25 = 16;
              }
              if ((v62 & 2) != 0) {
                v25 += 8;
              }
              if ((v62 & 4) != 0) {
                v25 += 8;
              }
              if (v65 < v25)
              {
                if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
                  smb2_smb_parse_create_contexts_cold_16();
                }
                goto LABEL_148;
              }
              if (v62)
              {
                uint64_t uint32le = md_get_uint64le(v59, v12 + 73);
                if (uint32le) {
                  goto LABEL_144;
                }
              }
              if ((v12[73] & 2) != 0) {
                v12[70] |= 0x800uLL;
              }
              char v26 = v62;
              if ((v62 & 2) != 0)
              {
                uint64_t uint32le = md_get_uint64le(v59, v12 + 74);
                if (uint32le) {
                  goto LABEL_144;
                }
                char v26 = v62;
              }
              if ((v26 & 4) != 0)
              {
                uint64_t uint32le = md_get_uint32le(v59, 0);
                if (uint32le) {
                  goto LABEL_144;
                }
                smb2_smb_parse_create_str(v59, 0, (UInt8 **)&__s);
                __int16 v27 = (void *)v12[75];
                if (v27) {
                  free(v27);
                }
                uint64_t v28 = __s;
                if (__s && strlen(__s) >= 0x1FE) {
                  __s[509] = 0;
                }
                v12[75] = v28;
              }
              if (piston_log_level && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
                smb2_smb_parse_create_contexts_cold_17(v69, &v70, v29);
              }
              v12[70] |= 0x40uLL;
            }
            break;
          case 0x44483243:
            break;
          case 0x44483251:
            if (v65 != 8)
            {
              if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
                smb2_smb_parse_create_contexts_cold_12();
              }
              goto LABEL_148;
            }
            uint64_t uint32le = md_get_uint32le(v59, (_DWORD *)&v54 + 1);
            if (uint32le) {
              goto LABEL_144;
            }
            int v20 = *(_DWORD *)(a4 + 244);
            int v21 = HIDWORD(v54);
            if (v20 && v20 != HIDWORD(v54))
            {
              if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
              {
                int v42 = *(_DWORD *)(a4 + 244);
                *(_DWORD *)buf = 136315650;
                id v86 = "smb2_smb_parse_create_contexts";
                __int16 v87 = 1024;
                *(_DWORD *)uint64_t v88 = HIDWORD(v54);
                *(_WORD *)&v88[4] = 1024;
                *(_DWORD *)&v88[6] = v42;
                _os_log_error_impl(&dword_23F849000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s: Granted Dur Handle V2 timeout %d does not match requested %d \n", buf, 0x18u);
              }
              int v21 = HIDWORD(v54);
            }
            *(_DWORD *)(a4 + 244) = v21;
            uint64_t uint32le = md_get_uint32le(v59, &v56);
            if (uint32le) {
              goto LABEL_144;
            }
            uint64_t v18 = *(void *)(a4 + 232);
            if ((v18 & 0x100) == 0)
            {
              if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
                smb2_smb_parse_create_contexts_cold_11(v77, &v78, v22);
              }
              uint64_t v18 = *(void *)(a4 + 232) | 0x800;
              *(void *)(a4 + 232) = v18;
            }
            char v23 = v56;
            if ((v18 & 0x20) != 0)
            {
              BOOL v34 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
              if ((v23 & 2) != 0)
              {
                if (v34) {
                  smb2_smb_parse_create_contexts_cold_10(v75, &v76, v35);
                }
                unint64_t v24 = *(void *)(a4 + 232) & 0xFFFFFFFFFFFFFF5FLL | 0x80;
                goto LABEL_139;
              }
              if (v34) {
                smb2_smb_parse_create_contexts_cold_9(v73, &v74, v35);
              }
            }
            else
            {
              if ((v56 & 2) == 0) {
                goto LABEL_41;
              }
              if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
                smb2_smb_parse_create_contexts_cold_8(v71, &v72, v39);
              }
            }
            break;
          default:
            goto LABEL_150;
        }
      }
      else
      {
        if (SHIDWORD(v64) <= 1299726690)
        {
          if (HIDWORD(v64) == 1145597507) {
            goto LABEL_140;
          }
          if (HIDWORD(v64) != 1145597521) {
            goto LABEL_150;
          }
          if (v65 != 8)
          {
            if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
              smb2_smb_parse_create_contexts_cold_7();
            }
LABEL_148:
            uint64_t mem = 72;
            goto LABEL_145;
          }
          uint64_t uint32le = md_get_uint64le(v59, 0);
          if (uint32le) {
            goto LABEL_144;
          }
          uint64_t v18 = *(void *)(a4 + 232);
          if ((v18 & 0x100) != 0)
          {
            if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
              smb2_smb_parse_create_contexts_cold_6(v79, &v80, v19);
            }
            uint64_t v18 = *(void *)(a4 + 232) | 0x800;
          }
LABEL_41:
          unint64_t v24 = v18 & 0xFFFFFFFFFFFFFFFALL | 4;
LABEL_139:
          *(void *)(a4 + 232) = v24;
          goto LABEL_140;
        }
        if (HIDWORD(v64) == 1383156851)
        {
          if (v65 != 32 && v65 != 52)
          {
            if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
              smb2_smb_parse_create_contexts_cold_3();
            }
            goto LABEL_148;
          }
          uint64_t uint32le = md_get_uint64le(v59, &v58);
          if (uint32le) {
            goto LABEL_144;
          }
          uint64_t uint32le = md_get_uint64le(v59, &v57);
          if (uint32le) {
            goto LABEL_144;
          }
          if (v58 != *(void *)(a4 + 152) || v57 != *(void *)(a4 + 160))
          {
            if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
            {
              uint64_t v40 = *(void *)(a4 + 152);
              uint64_t v41 = *(void *)(a4 + 160);
              *(_DWORD *)buf = 136316162;
              id v86 = "smb2_smb_parse_create_contexts";
              __int16 v87 = 2048;
              *(void *)uint64_t v88 = v40;
              *(_WORD *)&v88[8] = 2048;
              uint64_t v89 = v41;
              __int16 v90 = 2048;
              uint64_t v91 = v58;
              __int16 v92 = 2048;
              uint64_t v93 = v57;
              _os_log_error_impl(&dword_23F849000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s: Lease key mismatch: 0x%llx:0x%llx != 0x%llx:0x%llx\n", buf, 0x34u);
            }
            uint64_t v30 = v57;
            *(void *)(a4 + 152) = v58;
            *(void *)(a4 + 160) = v30;
          }
          uint64_t uint32le = md_get_uint32le(v59, &v54);
          if (uint32le) {
            goto LABEL_144;
          }
          uint64_t uint32le = md_get_uint32le(v59, &v56);
          if (uint32le) {
            goto LABEL_144;
          }
          if ((v56 & 4) != 0) {
            *(void *)(a4 + 232) |= 0x10uLL;
          }
          uint64_t uint32le = md_get_uint64le(v59, 0);
          if (uint32le) {
            goto LABEL_144;
          }
          if (v65 == 52)
          {
            uint64_t uint32le = md_get_uint64le(v59, &v58);
            if (uint32le) {
              goto LABEL_144;
            }
            uint64_t uint32le = md_get_uint64le(v59, &v57);
            if (uint32le) {
              goto LABEL_144;
            }
            if ((*(unsigned char *)(a4 + 232) & 0x10) != 0 && (v58 != *(void *)(a4 + 176) || v57 != *(void *)(a4 + 184)))
            {
              if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
              {
                uint64_t v43 = *(void *)(a4 + 176);
                uint64_t v44 = *(void *)(a4 + 184);
                *(_DWORD *)buf = 136316162;
                id v86 = "smb2_smb_parse_create_contexts";
                __int16 v87 = 2048;
                *(void *)uint64_t v88 = v43;
                *(_WORD *)&v88[8] = 2048;
                uint64_t v89 = v44;
                __int16 v90 = 2048;
                uint64_t v91 = v58;
                __int16 v92 = 2048;
                uint64_t v93 = v57;
                _os_log_error_impl(&dword_23F849000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s: Parent Lease key mismatch: 0x%llx:0x%llx != 0x%llx:0x%llx\n", buf, 0x34u);
              }
              uint64_t v31 = v57;
              *(void *)(a4 + 176) = v58;
              *(void *)(a4 + 184) = v31;
            }
            uint64_t uint32le = md_get_uint16le(v59, &v55);
            if (uint32le) {
              goto LABEL_144;
            }
            *(_WORD *)(a4 + 192) = v55;
            *(_DWORD *)(a4 + 240) = v54;
            uint64_t uint32le = md_get_uint16le(v59, 0);
            if (uint32le) {
              goto LABEL_144;
            }
            unint64_t v32 = *(void *)(a4 + 232);
            if ((v32 & 0x200) == 0)
            {
              if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
                smb2_smb_parse_create_contexts_cold_4(v83, &v84, v33);
              }
              unint64_t v32 = *(void *)(a4 + 232) | 0x800;
            }
            if ((v32 & 0x40) != 0)
            {
              unint64_t v32 = v32 & 0xFFFFFFFFFFFFFF3FLL | 0x80;
            }
            else if ((v32 & 2) != 0)
            {
              unint64_t v32 = v32 & 0xFFFFFFFFFFFFFFF9 | 4;
            }
          }
          else
          {
            *(_DWORD *)(a4 + 240) = v54;
            unint64_t v32 = *(void *)(a4 + 232);
            if ((v32 & 0x200) != 0)
            {
              if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
                smb2_smb_parse_create_contexts_cold_5(v81, &v82, v37);
              }
              unint64_t v32 = *(void *)(a4 + 232) | 0x800;
            }
          }
          unint64_t v24 = v32 | 8;
          goto LABEL_139;
        }
        if (HIDWORD(v64) != 1299726691)
        {
LABEL_150:
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
            smb2_smb_parse_create_contexts_cold_1();
          }
          goto LABEL_148;
        }
        if (v65 != 8)
        {
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
            smb2_smb_parse_create_contexts_cold_2();
          }
          goto LABEL_148;
        }
        uint64_t uint32le = md_get_uint32le(v59, &v64);
        if (uint32le) {
          goto LABEL_144;
        }
        if (v64)
        {
          if (piston_log_level && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            id v86 = "smb2_smb_parse_create_contexts";
            __int16 v87 = 1024;
            *(_DWORD *)uint64_t v88 = v64;
            _os_log_error_impl(&dword_23F849000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s: MxAc Query Status failed: 0x%x\n", buf, 0x12u);
          }
        }
        else
        {
          uint64_t uint32le = md_get_uint32le(v59, (_DWORD *)&v63 + 1);
          if (uint32le) {
            goto LABEL_144;
          }
          int v38 = HIDWORD(v63);
          if (*(unsigned char *)(a4 + 1))
          {
            int v38 = HIDWORD(v63) | 0x10000;
            HIDWORD(v63) |= 0x10000u;
          }
          *(_DWORD *)(a4 + 116) = v38;
        }
      }
LABEL_140:
      if (!v68)
      {
        uint64_t mem = 0;
        goto LABEL_145;
      }
      uint64_t mem = md_get_mem(a2, 0, v68, 0);
      if (mem || !v68) {
        goto LABEL_145;
      }
    }
  }
  uint64_t mem = v14;
  uint64_t v16 = 0;
LABEL_145:

  return mem;
}

void smb2_smb_parse_create_str(void *a1, int a2, UInt8 **a3)
{
  LODWORD(size) = 0;
  if (md_get_uint32le(a1, &size)) {
    return;
  }
  if (a2) {
    unsigned int v6 = 2048;
  }
  else {
    unsigned int v6 = 510;
  }
  if (!size)
  {
    *a3 = 0;
    return;
  }
  if (size > v6)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      smb2_smb_parse_create_str_cold_1();
    }
    return;
  }
  id v7 = (char *)malloc_type_malloc(size, 0xF8B7D3F1uLL);
  if (v7)
  {
    id v8 = v7;
    if (md_get_mem(a1, v7, size, 0))
    {
LABEL_26:
      free(v8);
      return;
    }
    size_t v9 = size;
    unint64_t v21 = size;
    if (a2)
    {
      size_t v20 = 9 * size + 1;
      id v10 = (UInt8 *)malloc_type_malloc(v20, 0x1C935430uLL);
      __int16 v11 = v10;
      if (!v10) {
        goto LABEL_25;
      }
      bzero(v10, 9 * v9 + 1);
      if (!smb_convert_network_to_path(v8, v9, v11, (CFIndex *)&v20, 92, 32, 1)) {
        goto LABEL_25;
      }
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        smb2_smb_parse_create_str_cold_4();
      }
      free(v11);
    }
    else
    {
      __int16 v11 = smbfs_ntwrkname_tolocal((const UInt8 *)v8, &v21, 1);
      if (v11)
      {
LABEL_25:
        *a3 = v11;
        goto LABEL_26;
      }
      BOOL v12 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
      if (v12) {
        smb2_smb_parse_create_str_cold_3(v12, v13, v14, v15, v16, v17, v18, v19);
      }
    }
    __int16 v11 = 0;
    goto LABEL_25;
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    smb2_smb_parse_create_str_cold_2();
  }
}

void OUTLINED_FUNCTION_4_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

uint64_t OUTLINED_FUNCTION_7@<X0>(uint64_t result@<X0>, int a2@<W1>, int a3@<W2>, uint64_t a4@<X8>)
{
  *(void *)(result + 4) = a4;
  *(_WORD *)(result + 12) = 1024;
  *(_DWORD *)(result + 14) = a2;
  *(_WORD *)(result + 18) = 1024;
  *(_DWORD *)(result + 20) = a3;
  return result;
}

uint64_t piston_hexdump(const char *a1, const char *a2, unsigned __int8 *a3, uint64_t a4)
{
  int v4 = a4;
  uint64_t v5 = a3;
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t result = printf("%s: %s %p length %ld \n", a1, a2, a3, a4);
  if (v5)
  {
    if (v4 >= 1)
    {
      uint64_t v7 = 0;
      uint64_t v8 = v4;
      int v18 = v4;
      do
      {
        int v9 = snprintf(__str, 0x200uLL, "%6.6x - ", v7);
        uint64_t v10 = 0;
        __int16 v11 = &__str[v9];
        BOOL v12 = (char *)(512 - v9);
        do
        {
          if (v7 + v10 >= v8) {
            int v13 = snprintf(v11, (size_t)v12, "   ");
          }
          else {
            int v13 = snprintf(v11, (size_t)v12, "%2.2x ");
          }
          v11 += v13;
          BOOL v12 = (char *)(&__str[(void)v12] - v11);
          ++v10;
        }
        while (v10 != 16);
        uint64_t v14 = 0;
        uint64_t v15 = &v11[snprintf(v11, (size_t)v12, " \"")];
        uint64_t v16 = (char *)(&__str[(void)v12] - v15);
        do
        {
          if (v7 + v14 < v8)
          {
            if (v5[v14] - 26 > 0x63) {
              int v17 = snprintf(v15, (size_t)v16, ".");
            }
            else {
              int v17 = snprintf(v15, (size_t)v16, "%c");
            }
            v15 += v17;
            uint64_t v16 = (char *)(&__str[(void)v16] - v15);
          }
          ++v14;
        }
        while (v14 != 16);
        printf("%s \n", __str);
        v7 += 16;
        v5 += 16;
      }
      while ((int)v7 < v18);
    }
    return puts(" ");
  }
  return result;
}

void piston_lease_break_ack(void *a1, unsigned int *a2, void *a3)
{
  id v5 = a1;
  unsigned int v6 = a3;
  uint64_t v7 = [v5 sock];

  if (!v7)
  {
    BOOL v8 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v8)
    {
      piston_lease_break_ack_cold_1(v8, v9, v10, v11, v12, v13, v14, v15);
      if (!v6) {
        goto LABEL_8;
      }
    }
    else if (!v6)
    {
      goto LABEL_8;
    }
    v6[2](v6, 57);
    goto LABEL_8;
  }
  if (smb2_smb_lease_break_ack(v5, a2, v6) && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    piston_lease_break_ack_cold_2();
  }
LABEL_8:
}

uint64_t smb2_smb_lease_break_ack(void *a1, unsigned int *a2, void *a3)
{
  id v5 = a1;
  unsigned int v6 = a3;
  uint64_t v7 = [v5 getShare:*a2];
  BOOL v8 = v7;
  if (!v7)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      smb2_smb_lease_break_ack_cold_1();
      if (v6) {
        goto LABEL_9;
      }
    }
    else if (v6)
    {
LABEL_9:
      uint64_t v9 = 22;
      v6[2](v6, 22);
      id v11 = 0;
      goto LABEL_19;
    }
    id v11 = 0;
    uint64_t v9 = 22;
    goto LABEL_19;
  }
  id v22 = 0;
  uint64_t v9 = smb2_rq_alloc(18, objc_msgSend(v7, "tree_id"), objc_msgSend(v7, "isEncrypted"), 0, v5, &v22);
  id v10 = v22;
  id v11 = v10;
  if (!v9)
  {
    uint64_t v12 = objc_msgSend(v10, "smb_rq_getrequest");
    mb_put_uint16le(v12, 36);
    mb_put_uint16le(v12, 0);
    mb_put_uint32le(v12, 0);
    mb_put_uint64le(v12, *((void *)a2 + 1));
    mb_put_uint64le(v12, *((void *)a2 + 2));
    mb_put_uint32le(v12, a2[6]);
    mb_put_uint64le(v12, 0);
    uint64_t v15 = MEMORY[0x263EF8330];
    uint64_t v16 = 3221225472;
    int v17 = __smb2_smb_lease_break_ack_block_invoke;
    int v18 = &unk_265072BD8;
    uint64_t v13 = v6;
    uint64_t v20 = v13;
    unint64_t v21 = a2;
    id v11 = v11;
    id v19 = v11;
    uint64_t v9 = smb_rq_simple_block(v5, v11, &v15);
    if (!v9)
    {
LABEL_16:

      goto LABEL_19;
    }
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      smb2_smb_lease_break_ack_cold_2();
      if (!v11)
      {
LABEL_14:
        if (v13) {
          v13[2](v13, v9);
        }
        goto LABEL_16;
      }
    }
    else if (!v11)
    {
      goto LABEL_14;
    }
    objc_msgSend(v11, "smb_rq_done", v15, v16, v17, v18);
    goto LABEL_14;
  }
  if (v10) {
    objc_msgSend(v10, "smb_rq_done");
  }
  if (v6) {
    v6[2](v6, v9);
  }
LABEL_19:

  return v9;
}

void __smb2_smb_lease_break_ack_block_invoke(uint64_t a1, uint64_t uint16le)
{
  int v13 = 0;
  int v14 = 0;
  uint64_t v12 = 0;
  int v4 = (void (**)(void, void))MEMORY[0x2455D48A0](*(void *)(a1 + 40));
  id v5 = (id *)(a1 + 32);
  int v6 = objc_msgSend(*(id *)(a1 + 32), "sr_ntstatus");
  uint64_t v8 = *(void *)(a1 + 48);
  uint64_t v7 = a1 + 48;
  *(_DWORD *)(v8 + 28) = v6;
  if (uint16le)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      __smb2_smb_lease_break_ack_block_invoke_cold_3(v5, uint16le);
    }
    goto LABEL_17;
  }
  uint64_t v9 = objc_msgSend(*v5, "smb_rq_getreply");
  uint64_t uint16le = md_get_uint16le(v9, (_WORD *)&v14 + 1);
  if (uint16le) {
    goto LABEL_17;
  }
  if (HIWORD(v14) != 36)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      __smb2_smb_lease_break_ack_block_invoke_cold_2();
    }
    goto LABEL_16;
  }
  uint64_t uint16le = md_get_uint16le(v9, &v14);
  if (uint16le) {
    goto LABEL_17;
  }
  uint64_t uint16le = md_get_uint32le(v9, 0);
  if (uint16le) {
    goto LABEL_17;
  }
  uint64_t uint16le = md_get_uint64le(v9, &v12);
  if (uint16le) {
    goto LABEL_17;
  }
  *(void *)(*(void *)v7 + 32) = v12;
  uint64_t uint16le = md_get_uint64le(v9, &v12);
  if (uint16le) {
    goto LABEL_17;
  }
  uint64_t v10 = v12;
  id v11 = *(void **)v7;
  v11[5] = v12;
  if (v11[1] != v11[4] || v11[2] != v10)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      __smb2_smb_lease_break_ack_block_invoke_cold_1(v7);
    }
LABEL_16:
    uint64_t uint16le = 72;
    goto LABEL_17;
  }
  uint64_t uint16le = md_get_uint32le(v9, &v13);
  if (!uint16le)
  {
    *(_DWORD *)(*(void *)v7 + 48) = v13;
    uint64_t uint16le = md_get_uint64le(v9, 0);
  }
LABEL_17:
  if (*v5) {
    objc_msgSend(*v5, "smb_rq_done");
  }
  if (v4) {
    v4[2](v4, uint16le);
  }
}

uint64_t smb2_smb_parse_lease_break(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v54 = 0;
  int v52 = 0;
  int v53 = 0;
  uint64_t v51 = 0;
  int v4 = [v3 sock];
  id v5 = [v4 getEventHandler];

  if (!v5)
  {
    BOOL v11 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v11) {
      smb2_smb_parse_lease_break_cold_1(v11, v12, v13, v14, v15, v16, v17, v18);
    }
    mbuf_freem(a2);
LABEL_8:
    uint64_t v8 = 0;
    goto LABEL_19;
  }
  int v6 = objc_alloc_init(SMBPistonEvents);
  if (v6)
  {
    uint64_t v7 = v6;
    id v50 = 0;
    uint64_t v8 = smb2_rq_alloc(18, 0, 0, 0, v3, &v50);
    id v9 = v50;
    uint64_t v10 = v9;
    if (v8)
    {
      mbuf_freem(a2);
LABEL_18:

      goto LABEL_19;
    }
    uint64_t v54 = (long long *)objc_msgSend(v9, "smb_rq_getreply");
    md_initm((uint64_t)v54, (uint64_t)a2);
    uint64_t v27 = smb2_rq_parse_header(v10, &v54);
    if (v27)
    {
      uint64_t v8 = v27;
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        smb2_smb_parse_lease_break_cold_4();
      }
      goto LABEL_17;
    }
    uint64_t uint16le = md_get_uint16le(v54, (_WORD *)&v53 + 1);
    if (uint16le)
    {
LABEL_16:
      uint64_t v8 = uint16le;
LABEL_17:
      objc_msgSend(v10, "smb_rq_done");
      goto LABEL_18;
    }
    if (HIWORD(v53) == 44)
    {
      uint64_t uint16le = md_get_uint16le(v54, &v53);
      if (uint16le) {
        goto LABEL_16;
      }
      __int16 v30 = v53;
      uint64_t uint16le = md_get_uint32le(v54, &v52);
      if (uint16le) {
        goto LABEL_16;
      }
      int v31 = v52;
      uint64_t uint16le = md_get_uint64le(v54, &v51);
      if (uint16le) {
        goto LABEL_16;
      }
      uint64_t v32 = v51;
      uint64_t uint16le = md_get_uint64le(v54, &v51);
      if (uint16le) {
        goto LABEL_16;
      }
      uint64_t v33 = v51;
      uint64_t uint16le = md_get_uint32le(v54, &v52);
      if (uint16le) {
        goto LABEL_16;
      }
      int v34 = v52;
      uint64_t uint16le = md_get_uint32le(v54, &v52);
      if (uint16le) {
        goto LABEL_16;
      }
      int v35 = v52;
      uint64_t uint16le = md_get_uint32le(v54, 0);
      if (uint16le) {
        goto LABEL_16;
      }
      uint64_t uint16le = md_get_uint32le(v54, 0);
      if (uint16le) {
        goto LABEL_16;
      }
      uint64_t uint16le = md_get_uint32le(v54, 0);
      if (uint16le) {
        goto LABEL_16;
      }
      v44[0] = v30;
      v44[1] = 0;
      int v45 = v31;
      uint64_t v46 = v32;
      uint64_t v47 = v33;
      int v48 = v34;
      int v49 = v35;
      [(SMBPistonEvents *)v7 setLeaseBreak:v44];
      uint64_t v36 = [v3 sock];
      uint64_t v37 = objc_msgSend(v36, "recv_queue");
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __smb2_smb_parse_lease_break_block_invoke;
      block[3] = &unk_265072E58;
      id v41 = v3;
      int v42 = v7;
      id v43 = v10;
      id v38 = v10;
      uint64_t v39 = v7;
      dispatch_async(v37, block);

      goto LABEL_8;
    }
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      smb2_smb_parse_lease_break_cold_3();
    }
    objc_msgSend(v10, "smb_rq_done");

    uint64_t v8 = 72;
  }
  else
  {
    BOOL v19 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v19) {
      smb2_smb_parse_lease_break_cold_2(v19, v20, v21, v22, v23, v24, v25, v26);
    }
    mbuf_freem(a2);
    uint64_t v8 = 12;
  }
LABEL_19:

  return v8;
}

uint64_t __smb2_smb_parse_lease_break_block_invoke(uint64_t a1)
{
  BOOL v2 = [*(id *)(a1 + 32) sock];
  [v2 callEventHandler:8 contextPtr:*(void *)(a1 + 40) returnValue:0];

  id v3 = *(void **)(a1 + 48);
  return objc_msgSend(v3, "smb_rq_done");
}

void piston_lock(void *a1, int *a2, void *a3)
{
  id v5 = a1;
  int v6 = a3;
  uint64_t v7 = [v5 pd];
  uint64_t v8 = [v7 sock];

  if (!v8)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      piston_lock_cold_1();
      if (!v6) {
        goto LABEL_28;
      }
    }
    else if (!v6)
    {
      goto LABEL_28;
    }
    v6[2](v6, 57);
    goto LABEL_28;
  }
  id v9 = v5;
  uint64_t v10 = v6;
  uint64_t v11 = *a2;
  if (v11 < 3)
  {
    int v12 = dword_23F8827C0[v11];
    uint64_t v13 = [v9 treeID];
    uint64_t v14 = [v9 onEncryptedShare];
    uint64_t v15 = [v9 pd];
    id v29 = 0;
    uint64_t v16 = smb2_rq_alloc(10, v13, v14, 0, v15, &v29);
    id v17 = v29;

    if (v16)
    {
      if (v17) {
        objc_msgSend(v17, "smb_rq_done");
      }
      if (v10) {
        v10[2](v10, v16);
      }
      goto LABEL_25;
    }
    objc_msgSend(v17, "smb_rq_set_extflag:", 8);
    uint64_t v18 = objc_msgSend(v17, "smb_rq_getrequest");
    mb_put_uint16le(v18, 48);
    mb_put_uint16le(v18, 1);
    mb_put_uint32le(v18, 0);
    mb_put_uint64le(v18, [v9 fid]);
    [v9 fid];
    mb_put_uint64le(v18, v19);
    mb_put_uint64le(v18, *((void *)a2 + 1));
    mb_put_uint64le(v18, *((void *)a2 + 2));
    mb_put_uint32le(v18, v12);
    mb_put_uint32le(v18, 0);
    uint64_t v20 = [v9 pd];
    uint64_t v22 = MEMORY[0x263EF8330];
    uint64_t v23 = 3221225472;
    uint64_t v24 = __smb2_smb_lock_block_invoke;
    uint64_t v25 = &unk_265072BD8;
    uint64_t v21 = v10;
    uint64_t v27 = v21;
    uint64_t v28 = a2;
    id v17 = v17;
    id v26 = v17;
    uint64_t v16 = smb_rq_simple_block(v20, v17, &v22);

    if (!v16) {
      goto LABEL_20;
    }
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      piston_lock_cold_3();
      if (!v17)
      {
LABEL_18:
        if (v21) {
          v21[2](v21, v16);
        }
LABEL_20:

        goto LABEL_25;
      }
    }
    else if (!v17)
    {
      goto LABEL_18;
    }
    objc_msgSend(v17, "smb_rq_done", v22, v23, v24, v25);
    goto LABEL_18;
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    piston_lock_cold_4();
    if (v10) {
      goto LABEL_13;
    }
LABEL_24:
    id v17 = 0;
    LODWORD(v16) = 22;
    goto LABEL_25;
  }
  if (!v10) {
    goto LABEL_24;
  }
LABEL_13:
  LODWORD(v16) = 22;
  v10[2](v10, 22);
  id v17 = 0;
LABEL_25:

  if (v16 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    piston_lock_cold_2();
  }
LABEL_28:
}

void __smb2_smb_lock_block_invoke(uint64_t a1, uint64_t uint16le)
{
  int v15 = 0;
  int v4 = (void (**)(void, void))MEMORY[0x2455D48A0](*(void *)(a1 + 40));
  int v6 = *(void **)(a1 + 32);
  uint64_t v5 = a1 + 32;
  *(_DWORD *)(*(void *)(v5 + 16) + 24) = objc_msgSend(v6, "sr_ntstatus");
  if (uint16le)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      __smb2_smb_lock_block_invoke_cold_2((id *)v5, uint16le);
    }
  }
  else
  {
    uint64_t v7 = objc_msgSend(*(id *)v5, "smb_rq_getreply");
    uint64_t uint16le = md_get_uint16le(v7, (_WORD *)&v15 + 1);
    if (!uint16le)
    {
      if (HIWORD(v15) == 4)
      {
        uint64_t uint16le = md_get_uint16le(v7, &v15);
      }
      else
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          __smb2_smb_lock_block_invoke_cold_1((uint64_t)&v15 + 2, v8, v9, v10, v11, v12, v13, v14);
        }
        uint64_t uint16le = 72;
      }
    }
  }
  if (*(void *)v5) {
    objc_msgSend(*(id *)v5, "smb_rq_done");
  }
  if (v4) {
    v4[2](v4, uint16le);
  }
}

void piston_ioctl(void *a1, void *a2, uint64_t a3, uint64_t a4, void *a5, void *a6, void *a7, void *a8, uint64_t a9, void *a10)
{
  if (smb2_smb_ioctl(a1, a2, a3, a4, a7, a5, a6, a8, a9, 0, a10))
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      piston_ioctl_cold_1();
    }
  }
}

uint64_t smb2_smb_ioctl(void *a1, void *a2, uint64_t a3, uint64_t a4, void *a5, void *a6, void *a7, void *a8, uint64_t a9, void *a10, void *a11)
{
  uint64_t v186 = *MEMORY[0x263EF8340];
  id v18 = a1;
  id v19 = a2;
  id v166 = a5;
  id v168 = a6;
  id v167 = a7;
  id v165 = a8;
  uint64_t v20 = a11;
  uint64_t v181 = 0;
  v182 = &v181;
  uint64_t v183 = 0x2020000000;
  uint64_t v184 = 0;
  size_t __n = 0;
  size_t v180 = 0;
  id v21 = v18;
  uint64_t v22 = v21;
  if (v19)
  {
    id v23 = [v19 pd];

    uint64_t v24 = [v19 treeID];
    uint64_t v25 = [v19 onEncryptedShare];
    id v26 = 0;
  }
  else
  {
    uint64_t v27 = [v21 getShare:a3];
    id v26 = v27;
    if (!v27)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        smb2_smb_ioctl_cold_1();
      }
      if (v20)
      {
        uint64_t v30 = 22;
        v20[2](v20, 22);
        id v26 = 0;
        id v32 = 0;
      }
      else
      {
        id v26 = 0;
        id v32 = 0;
        uint64_t v30 = 22;
      }
      id v23 = v22;
      goto LABEL_156;
    }
    uint64_t v24 = objc_msgSend(v27, "tree_id");
    uint64_t v25 = [v26 isEncrypted];
    id v23 = v22;
  }
  uint64_t v28 = [v23 sock];
  BOOL v29 = v28 == 0;

  if (v29)
  {
    BOOL v33 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v33) {
      smb2_smb_ioctl_cold_2(v33, v34, v35, v36, v37, v38, v39, v40);
    }
    if (v20) {
      v20[2](v20, 57);
    }
    id v32 = 0;
    uint64_t v30 = 100;
    goto LABEL_156;
  }
  id v178 = 0;
  uint64_t v30 = smb2_rq_alloc(11, v24, v25, 0, v23, &v178);
  id v31 = v178;
  id v32 = v31;
  if (!v30)
  {
    uint64_t v41 = objc_msgSend(v31, "smb_rq_getrequest");
    mb_put_uint16le(v41, 57);
    mb_put_uint16le(v41, 0);
    v164 = (int *)(a4 + 4);
    mb_put_uint32le(v41, *(_DWORD *)(a4 + 4));
    int v42 = *(_DWORD *)(a4 + 4);
    if (v42 == 393620 || v42 == 1311236 || v42 == 1114136 || a10)
    {
      uint64_t v43 = -1;
      mb_put_uint64le(v41, -1);
    }
    else
    {
      mb_put_uint64le(v41, [v19 fid]);
      [v19 fid];
      uint64_t v43 = v71;
    }
    mb_put_uint64le(v41, v43);
    int v44 = *v164;
    if (*v164 > 1163286)
    {
      if (v44 > 1311235)
      {
        if (v44 == 1311236)
        {
          objc_msgSend(v32, "smb_rq_set_srflags:", 1024);
          int v68 = *(unsigned __int16 *)(a4 + 22);
          mb_put_uint32le(v41, 120);
          mb_put_uint32le(v41, 2 * v68 + 24);
          mb_put_uint32le(v41, 0);
          mb_put_uint32le(v41, 0);
          mb_put_uint32le(v41, 0);
          mb_put_uint32le(v41, 40);
          mb_put_uint32le(v41, 1);
          mb_put_uint32le(v41, 0);
          mb_put_uint32le(v41, *(_DWORD *)(a4 + 16));
          *(_OWORD *)mb_reserve(v41, 0x10uLL) = *(_OWORD *)(a4 + 40);
          mb_put_uint16le(v41, *(_WORD *)(a4 + 20));
          mb_put_uint16le(v41, *(_WORD *)(a4 + 22));
          if (*(_WORD *)(a4 + 22))
          {
            unint64_t v69 = 0;
            do
              mb_put_uint16le(v41, *(_WORD *)(a4 + 24 + 2 * v69++));
            while (v69 < *(unsigned __int16 *)(a4 + 22));
          }
          goto LABEL_74;
        }
        if (v44 == 1327346)
        {
          if (v168)
          {
            unsigned int v64 = [v168 length];
            mb_put_uint32le(v41, 120);
            mb_put_uint32le(v41, v64);
            mb_put_uint32le(v41, 0);
            mb_put_uint32le(v41, 0);
            mb_put_uint32le(v41, 0);
            mb_put_uint32le(v41, [v167 length]);
            mb_put_uint32le(v41, 1);
            mb_put_uint32le(v41, 0);
            mb_put_mem(v41, (char *)[v168 bytes], v64, 0);
            if ((*(unsigned char *)([v23 getSessionPtr] + 560) & 0x40) != 0) {
              objc_msgSend(v32, "smb_rq_set_srflags:", 512);
            }
            goto LABEL_74;
          }
          BOOL v113 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
          if (v113) {
            smb2_smb_ioctl_cold_16(v113, v114, v115, v116, v117, v118, v119, v120);
          }
          if (!v32) {
            goto LABEL_141;
          }
          goto LABEL_140;
        }
        goto LABEL_84;
      }
      if (v44 == 1163287)
      {
        if (v168 && v167)
        {
          if ([v168 length])
          {
            mb_put_uint32le(v41, 120);
            mb_put_uint32le(v41, [v168 length]);
            mb_put_uint32le(v41, 0);
            mb_put_uint32le(v41, 0);
            mb_put_uint32le(v41, 0);
            mb_put_uint32le(v41, [v167 length]);
            mb_put_uint32le(v41, 1);
            mb_put_uint32le(v41, 0);
            id v67 = v168;
            mb_put_mem(v41, (char *)[v67 bytes], objc_msgSend(v67, "length"), 0);
            goto LABEL_74;
          }
          BOOL v142 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
          if (v142) {
            smb2_smb_ioctl_cold_10(v142, v143, v144, v145, v146, v147, v148, v149);
          }
          if (!v32) {
            goto LABEL_141;
          }
        }
        else
        {
          BOOL v80 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
          if (v80) {
            smb2_smb_ioctl_cold_9(v80, v81, v82, v83, v84, v85, v86, v87);
          }
          if (!v32) {
            goto LABEL_141;
          }
        }
        goto LABEL_140;
      }
      if (v44 != 1310840)
      {
LABEL_84:
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          smb2_smb_ioctl_cold_3();
        }
        if (!v32) {
          goto LABEL_141;
        }
        goto LABEL_140;
      }
      if (!v167)
      {
        BOOL v97 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
        if (v97) {
          smb2_smb_ioctl_cold_17(v97, v98, v99, v100, v101, v102, v103, v104);
        }
        if (!v32) {
          goto LABEL_141;
        }
        goto LABEL_140;
      }
      mb_put_uint32le(v41, 0);
      mb_put_uint32le(v41, 0);
      mb_put_uint32le(v41, 0);
      mb_put_uint32le(v41, 0);
      mb_put_uint32le(v41, 0);
      int v54 = [v167 length];
    }
    else
    {
      if (v44 <= 589991)
      {
        if (v44 == 393620)
        {
          if (!v166 || !v167)
          {
            BOOL v72 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
            if (v72) {
              smb2_smb_ioctl_cold_4(v72, v73, v74, v75, v76, v77, v78, v79);
            }
            if (!v32) {
              goto LABEL_148;
            }
            goto LABEL_147;
          }
          cstring_len = (char *)smb_get_cstring_len(v166, (_DWORD *)&__n + 1);
          int v66 = HIDWORD(__n);
          mb_put_uint32le(v41, 120);
          mb_put_uint32le(v41, v66 + 4);
          mb_put_uint32le(v41, 0);
          mb_put_uint32le(v41, 0);
          mb_put_uint32le(v41, 0);
          mb_put_uint32le(v41, [v167 length]);
          mb_put_uint32le(v41, 1);
          mb_put_uint32le(v41, 0);
          mb_put_uint16le(v41, *(_WORD *)(a4 + 8));
          if (cstring_len)
          {
            uint64_t v30 = mb_put_mem(v41, cstring_len, HIDWORD(__n), 0);
            if (v30)
            {
              if (v32) {
                objc_msgSend(v32, "smb_rq_done");
              }
              if (v20) {
                goto LABEL_170;
              }
              goto LABEL_156;
            }
            mb_put_uint16le(v41, 0);
            goto LABEL_74;
          }
          BOOL v150 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
          if (v150) {
            smb2_smb_ioctl_cold_5(v150, v151, v152, v153, v154, v155, v156, v157);
          }
          if (v32) {
LABEL_147:
          }
            objc_msgSend(v32, "smb_rq_done");
LABEL_148:
          uint64_t v30 = 22;
          if (v20) {
            v20[2](v20, 22);
          }
          goto LABEL_156;
        }
        if (v44 == 589988)
        {
          if (v166)
          {
            int v45 = smb_get_cstring_len(v166, &__n);
            if ((__n - 32761) <= 0xFFFF8007)
            {
              BOOL v46 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
              if (v46) {
                smb2_smb_ioctl_cold_15(v46, v47, v48, v49, v50, v51, v52, v53);
              }
              if (!v32) {
                goto LABEL_141;
              }
              goto LABEL_140;
            }
            v129 = (char *)v45;
            size_t v180 = 2 * __n + 2;
            v130 = (UInt8 *)malloc_type_malloc(v180, 0x4BDE6BB7uLL);
            v131 = v130;
            if (v130)
            {
              bzero(v130, v180);
              uint64_t v30 = smb_convert_path_to_network(v129, __n, v131, &v180, 92, 32, 1);
              if (v30)
              {
                free(v131);
                if (v32) {
                  objc_msgSend(v32, "smb_rq_done");
                }
                if (v20) {
                  goto LABEL_170;
                }
                goto LABEL_156;
              }
              objc_msgSend(v32, "smb_rq_set_extflag:", 8);
              size_t v163 = v180;
              mb_put_uint32le(v41, 120);
              mb_put_uint32le(v41, (unsigned __int16)(2 * v163 + 12) + 8);
              mb_put_uint32le(v41, 0);
              mb_put_uint32le(v41, 0);
              mb_put_uint32le(v41, 0);
              mb_put_uint32le(v41, 0);
              mb_put_uint32le(v41, 1);
              mb_put_uint32le(v41, 0);
              mb_put_uint32le(v41, -1610612724);
              mb_put_uint16le(v41, 2 * v163 + 12);
              mb_put_uint16le(v41, 0);
              mb_put_uint16le(v41, 0);
              mb_put_uint16le(v41, v163);
              mb_put_uint16le(v41, v163);
              mb_put_uint16le(v41, v163);
              mb_put_uint32le(v41, *v131 != 92);
              mb_put_mem(v41, (char *)v131, (unsigned __int16)v163, 0);
              mb_put_mem(v41, (char *)v131, (unsigned __int16)v163, 0);
              free(v131);
LABEL_74:
              if (a10)
              {
                smb2_rq_align8(v32);
                objc_msgSend(v32, "smb_rq_set_srflags:", 256);
                id v32 = v32;
                uint64_t v30 = 0;
                *a10 = v32;
              }
              else if (v20)
              {
                v169[0] = MEMORY[0x263EF8330];
                v169[1] = 3221225472;
                v169[2] = __smb2_smb_ioctl_block_invoke;
                v169[3] = &unk_265072CC8;
                uint64_t v70 = v20;
                v175 = v70;
                uint64_t v177 = a4;
                id v32 = v32;
                id v170 = v32;
                v176 = &v181;
                id v23 = v23;
                id v171 = v23;
                id v172 = v166;
                id v173 = v168;
                id v174 = v167;
                uint64_t v30 = smb_rq_simple_block(v23, v32, v169);
                if (v30)
                {
                  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
                    smb2_smb_ioctl_cold_7();
                  }
                  if (v32) {
                    objc_msgSend(v32, "smb_rq_done");
                  }
                  v70[2](v70, v30);
                }
              }
              else
              {
                uint64_t v30 = smb_rq_simple(v23, v32);
                *(_DWORD *)(a4 + 12) = objc_msgSend(v32, "sr_ntstatus");
                if (v30)
                {
                  if (*v164 == 1327346 && v30 == 22)
                  {
                    uint64_t v88 = objc_msgSend(v32, "smb_rq_getreply");
                    v182[3] = (uint64_t)v88;
                    smb2_smb_parse_ioctl_internal(v23, v88, a4, v166, v167);
                    uint64_t v30 = 22;
                  }
                  else
                  {
                    v159 = &_os_log_internal;
                    id v160 = &_os_log_internal;
                    if (os_log_type_enabled(v159, OS_LOG_TYPE_ERROR)) {
                      smb2_smb_ioctl_cold_6(buf, v30, objc_msgSend(v32, "sr_ntstatus"));
                    }
                  }
                }
                else
                {
                  v158 = objc_msgSend(v32, "smb_rq_getreply");
                  v182[3] = (uint64_t)v158;
                  uint64_t v30 = smb2_smb_parse_ioctl_internal(v23, v158, a4, v166, v167);
                }
                objc_msgSend(v32, "smb_rq_done", v163);
              }
              goto LABEL_156;
            }
            if (v32) {
              goto LABEL_161;
            }
            goto LABEL_162;
          }
          BOOL v89 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
          if (v89) {
            smb2_smb_ioctl_cold_8(v89, v90, v91, v92, v93, v94, v95, v96);
          }
          if (v32) {
            goto LABEL_147;
          }
          goto LABEL_148;
        }
        goto LABEL_84;
      }
      if (v44 != 589992)
      {
        if (v44 == 1114136)
        {
          if (!v165)
          {
            BOOL v105 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
            if (v105) {
              smb2_smb_ioctl_cold_11(v105, v106, v107, v108, v109, v110, v111, v112);
            }
            if (!v32) {
              goto LABEL_148;
            }
            goto LABEL_147;
          }
          __int16 v55 = (char *)smb_get_cstring_len(v165, &__n);
          if (!v55)
          {
            BOOL v132 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
            if (v132) {
              smb2_smb_ioctl_cold_12(v132, v133, v134, v135, v136, v137, v138, v139);
            }
            if (!v32) {
              goto LABEL_148;
            }
            goto LABEL_147;
          }
          if ((__n - 32761) > 0xFFFF8007)
          {
            size_t v180 = 2 * __n + 2;
            v140 = (UInt8 *)malloc_type_malloc(v180, 0xD28BACC1uLL);
            v141 = v140;
            if (v140)
            {
              bzero(v140, v180);
              uint64_t v30 = smb_convert_path_to_network(v55, __n, v141, &v180, 92, 32, 1);
              if (v30)
              {
                free(v141);
                if (v32) {
                  objc_msgSend(v32, "smb_rq_done");
                }
                if (v20) {
                  goto LABEL_170;
                }
                goto LABEL_156;
              }
              int v162 = v180;
              mb_put_uint32le(v41, 120);
              mb_put_uint32le(v41, v162 + 14);
              mb_put_uint32le(v41, 0);
              mb_put_uint32le(v41, 0);
              mb_put_uint32le(v41, 0);
              mb_put_uint32le(v41, 0);
              mb_put_uint32le(v41, 1);
              mb_put_uint32le(v41, 0);
              mb_put_uint64le(v41, a9);
              mb_put_uint32le(v41, v180);
              mb_put_uint8(v41, a9 != 0);
              mb_put_uint8(v41, 0);
              uint64_t v30 = mb_put_mem(v41, (char *)v141, v180, 0);
              free(v141);
              if (v30)
              {
                if (v32) {
                  objc_msgSend(v32, "smb_rq_done");
                }
                if (v20) {
                  goto LABEL_170;
                }
                goto LABEL_156;
              }
              goto LABEL_74;
            }
            if (v32) {
LABEL_161:
            }
              objc_msgSend(v32, "smb_rq_done");
LABEL_162:
            uint64_t v30 = 12;
            if (v20) {
              v20[2](v20, 12);
            }
            goto LABEL_156;
          }
          BOOL v56 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
          if (v56) {
            smb2_smb_ioctl_cold_13(v56, v57, v58, v59, v60, v61, v62, v63);
          }
          if (!v32) {
            goto LABEL_141;
          }
LABEL_140:
          objc_msgSend(v32, "smb_rq_done");
LABEL_141:
          uint64_t v30 = 72;
          if (v20) {
            v20[2](v20, 72);
          }
          goto LABEL_156;
        }
        goto LABEL_84;
      }
      if (!v166)
      {
        BOOL v121 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
        if (v121) {
          smb2_smb_ioctl_cold_8(v121, v122, v123, v124, v125, v126, v127, v128);
        }
        if (!v32) {
          goto LABEL_148;
        }
        goto LABEL_147;
      }
      mb_put_uint32le(v41, 0);
      mb_put_uint32le(v41, 0);
      mb_put_uint32le(v41, 0);
      mb_put_uint32le(v41, 0);
      mb_put_uint32le(v41, 0);
      int v54 = 0x10000;
    }
    mb_put_uint32le(v41, v54);
    mb_put_uint32le(v41, 1);
    mb_put_uint32le(v41, 0);
    goto LABEL_74;
  }
  if (v31) {
    objc_msgSend(v31, "smb_rq_done");
  }
  if (v20) {
LABEL_170:
  }
    v20[2](v20, v30);
LABEL_156:

  _Block_object_dispose(&v181, 8);
  return v30;
}

void sub_23F85DF98(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

void piston_validate_negotiate(void *a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v7 = a1;
  id v8 = a4;
  uint64_t v39 = 0;
  uint64_t v40 = &v39;
  uint64_t v41 = 0x2020000000;
  int v42 = 0;
  uint64_t v9 = [v7 getSessionPtr];
  uint64_t v10 = v9;
  if (!v9)
  {
    BOOL v15 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v15) {
      piston_validate_negotiate_cold_1(v15, v16, v17, v18, v19, v20, v21, v22);
    }
    uint64_t v13 = v40;
    uint64_t v14 = 22;
LABEL_11:
    *((_DWORD *)v13 + 6) = v14;
    if (!v8) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }
  if ((*(void *)(v9 + 552) & 0xC07000) != 0x1000)
  {
    uint64_t v14 = 0;
    *((_DWORD *)v40 + 6) = 0;
    if (!v8) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }
  uint64_t v11 = [v7 sock];

  if (v11)
  {
    *(_DWORD *)(a2 + 16) = *(_DWORD *)(v10 + 172);
    *(_OWORD *)(a2 + 40) = *(_OWORD *)(v10 + 176);
    unsigned int v12 = *(unsigned __int16 *)(v10 + 194);
    *(_WORD *)(a2 + 20) = *(_WORD *)(v10 + 192);
    if (v12 >= 6)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        piston_validate_negotiate_cold_3();
      }
      uint64_t v13 = v40;
      uint64_t v14 = 12;
      goto LABEL_11;
    }
    *(_WORD *)(a2 + 22) = v12;
    if (v12)
    {
      unint64_t v31 = 0;
      do
      {
        *(_WORD *)(a2 + 24 + 2 * v31) = *(_WORD *)(v10 + 196 + 2 * v31);
        ++v31;
      }
      while (v31 < *(unsigned __int16 *)(v10 + 194));
    }
    *(_DWORD *)(a2 + 4) = 1311236;
    v34[0] = MEMORY[0x263EF8330];
    v34[1] = 3221225472;
    v34[2] = __piston_validate_negotiate_block_invoke;
    v34[3] = &unk_265072E80;
    uint64_t v36 = &v39;
    uint64_t v37 = a2;
    uint64_t v38 = v10;
    id v32 = (void (**)(void))v8;
    id v35 = v32;
    int v33 = smb2_smb_ioctl(v7, 0, a3, a2, 0, 0, 0, 0, 0, 0, v34);
    *((_DWORD *)v40 + 6) = v33;
    if (v33)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        piston_validate_negotiate_cold_4();
        if (v32)
        {
LABEL_26:
          if (*((_DWORD *)v40 + 6)) {
            v32[2](v32);
          }
        }
      }
      else if (v32)
      {
        goto LABEL_26;
      }
    }

    goto LABEL_19;
  }
  BOOL v23 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
  if (v23)
  {
    piston_validate_negotiate_cold_2(v23, v24, v25, v26, v27, v28, v29, v30);
    if (!v8) {
      goto LABEL_19;
    }
    goto LABEL_17;
  }
  if (v8)
  {
LABEL_17:
    uint64_t v14 = 57;
LABEL_18:
    (*((void (**)(id, uint64_t))v8 + 2))(v8, v14);
  }
LABEL_19:
  _Block_object_dispose(&v39, 8);
}

void sub_23F85E26C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __piston_validate_negotiate_block_invoke(void *a1, int a2)
{
  id v3 = a1 + 5;
  *(_DWORD *)(*(void *)(a1[5] + 8) + 24) = a2;
  uint64_t v4 = *(void *)(a1[5] + 8);
  int v5 = *(_DWORD *)(v4 + 24);
  if (!v5)
  {
    uint64_t v8 = a1[6];
    uint64_t v7 = a1[7];
    if (*(_DWORD *)(v8 + 56) != *(_DWORD *)(v7 + 76))
    {
      BOOL v19 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
      if (v19) {
        __piston_validate_negotiate_block_invoke_cold_9(v19, v20, v21, v22, v23, v24, v25, v26);
      }
      goto LABEL_23;
    }
    if (*(void *)(v8 + 40) != *(void *)(v7 + 92) || *(void *)(v8 + 48) != *(void *)(v7 + 100))
    {
      BOOL v10 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
      if (v10) {
        __piston_validate_negotiate_block_invoke_cold_8(v10, v11, v12, v13, v14, v15, v16, v17);
      }
      goto LABEL_23;
    }
    if (*(unsigned __int16 *)(v8 + 60) != *(unsigned __int16 *)(v7 + 108))
    {
      BOOL v37 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
      if (v37) {
        __piston_validate_negotiate_block_invoke_cold_7(v37, v38, v39, v40, v41, v42, v43, v44);
      }
      goto LABEL_23;
    }
    int v28 = *(unsigned __int16 *)(v8 + 64);
    if (v28 > 767)
    {
      if (v28 == 768)
      {
        if ((*(unsigned char *)(v7 + 553) & 0x18) != 0) {
          goto LABEL_24;
        }
        BOOL v29 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
        if (v29) {
          goto LABEL_46;
        }
        goto LABEL_23;
      }
      if (v28 == 770)
      {
        if ((*(unsigned char *)(v7 + 553) & 0x90) != 0) {
          goto LABEL_24;
        }
        BOOL v29 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
        if (v29) {
          goto LABEL_46;
        }
        goto LABEL_23;
      }
    }
    else
    {
      if (v28 == 514)
      {
        if ((*(unsigned char *)(v7 + 553) & 0x30) != 0) {
          goto LABEL_24;
        }
        BOOL v29 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
        if (v29) {
          goto LABEL_46;
        }
        goto LABEL_23;
      }
      if (v28 == 528)
      {
        if ((*(unsigned char *)(v7 + 553) & 0x50) != 0) {
          goto LABEL_24;
        }
        BOOL v29 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
        if (v29) {
LABEL_46:
        }
          __piston_validate_negotiate_block_invoke_cold_3(v29, v30, v31, v32, v33, v34, v35, v36);
LABEL_23:
        *(_DWORD *)(*(void *)(*v3 + 8) + 24) = 80;
        goto LABEL_24;
      }
    }
    BOOL v45 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v45) {
      __piston_validate_negotiate_block_invoke_cold_2(v45, v46, v47, v48, v49, v50, v51, v52);
    }
    goto LABEL_23;
  }
  if (v5 == 45 || v5 == 22)
  {
    if (piston_log_level)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        __piston_validate_negotiate_block_invoke_cold_10();
      }
      uint64_t v4 = *(void *)(*v3 + 8);
    }
    *(_DWORD *)(v4 + 24) = 0;
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    __piston_validate_negotiate_block_invoke_cold_1();
  }
LABEL_24:
  uint64_t result = a1[4];
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(unsigned int *)(*(void *)(*v3 + 8) + 24));
  }
  return result;
}

uint64_t smb2_smb_parse_ioctl_internal(void *a1, void *a2, uint64_t a3, void *a4, void *a5)
{
  id v9 = a4;
  id v10 = a5;
  int v29 = 0;
  int v30 = 0;
  uint64_t v27 = 0;
  uint64_t v28 = 0;
  uint64_t v25 = 0;
  uint64_t v26 = 0;
  uint64_t v24 = 0;
  __int16 v23 = 0;
  int v22 = 0;
  uint64_t v11 = [a1 getSessionPtr];
  uint64_t uint16le = md_get_uint16le(a2, (_WORD *)&v30 + 1);
  if (uint16le) {
    goto LABEL_20;
  }
  if (HIWORD(v30) != 49)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      smb2_smb_parse_ioctl_internal_cold_12();
    }
    goto LABEL_19;
  }
  uint64_t uint16le = md_get_uint16le(a2, &v30);
  if (uint16le) {
    goto LABEL_20;
  }
  uint64_t uint16le = md_get_uint32le(a2, &v29);
  if (uint16le) {
    goto LABEL_20;
  }
  uint64_t uint16le = md_get_uint64le(a2, &v27);
  if (uint16le) {
    goto LABEL_20;
  }
  uint64_t uint16le = md_get_uint64le(a2, &v28);
  if (uint16le) {
    goto LABEL_20;
  }
  uint64_t uint16le = md_get_uint32le(a2, (_DWORD *)&v26 + 1);
  if (uint16le) {
    goto LABEL_20;
  }
  uint64_t uint16le = md_get_uint32le(a2, &v26);
  if (uint16le) {
    goto LABEL_20;
  }
  uint64_t uint16le = md_get_uint32le(a2, (_DWORD *)&v25 + 1);
  if (uint16le) {
    goto LABEL_20;
  }
  uint64_t uint16le = md_get_uint32le(a2, &v25);
  if (uint16le) {
    goto LABEL_20;
  }
  uint64_t uint16le = md_get_uint32le(a2, (_DWORD *)&v24 + 1);
  if (uint16le) {
    goto LABEL_20;
  }
  uint64_t uint16le = md_get_uint32le(a2, &v24);
  if (uint16le) {
    goto LABEL_20;
  }
  if (v29 <= 1163286)
  {
    uint64_t uint16le = 0;
    if (v29 <= 589991)
    {
      if (v29 != 393620)
      {
        int v13 = 589988;
        goto LABEL_34;
      }
      goto LABEL_47;
    }
    if (v29 != 589992)
    {
      int v13 = 1114136;
LABEL_34:
      if (v29 == v13) {
        goto LABEL_20;
      }
      goto LABEL_71;
    }
    uint64_t reparse_point = smb2_smb_parse_get_reparse_point(v11, v9, a2);
LABEL_62:
    uint64_t uint16le = reparse_point;
    goto LABEL_20;
  }
  if (v29 > 1311235)
  {
    if (v29 == 1311236)
    {
      unsigned int v19 = v25;
      if (v25 != 24 && piston_log_level)
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          smb2_smb_parse_ioctl_internal_cold_11();
        }
        unsigned int v19 = v25;
      }
      if (v19 <= 0x17)
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          smb2_smb_parse_ioctl_internal_cold_10();
        }
        goto LABEL_19;
      }
      uint64_t uint16le = md_get_uint32le(a2, &v22);
      if (!uint16le)
      {
        *(_DWORD *)(a3 + 56) = v22;
        uint64_t uint16le = md_get_mem(a2, (char *)(a3 + 40), 16, 0);
        if (!uint16le)
        {
          uint64_t uint16le = md_get_uint16le(a2, &v23);
          if (!uint16le)
          {
            *(_WORD *)(a3 + 60) = v23;
            *(_WORD *)(a3 + 62) = 1;
            uint64_t reparse_point = md_get_uint16le(a2, (_WORD *)(a3 + 64));
            goto LABEL_62;
          }
        }
      }
      goto LABEL_20;
    }
    if (v29 == 1327346)
    {
      if (v26 && piston_log_level && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        smb2_smb_parse_ioctl_internal_cold_4();
      }
      if (v25 != 12)
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          smb2_smb_parse_ioctl_internal_cold_8();
        }
        goto LABEL_19;
      }
      uint64_t uint16le = smb2_smb_parse_copychunk_response(a2, v10);
      if (uint16le && piston_log_level && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        smb2_smb_parse_ioctl_internal_cold_7();
      }
      goto LABEL_20;
    }
LABEL_71:
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      smb2_smb_parse_ioctl_internal_cold_1();
    }
LABEL_19:
    uint64_t uint16le = 72;
    goto LABEL_20;
  }
  if (v29 == 1163287)
  {
LABEL_47:
    int v16 = piston_log_level;
    if (v26 && piston_log_level)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        smb2_smb_parse_ioctl_internal_cold_4();
      }
      int v16 = piston_log_level;
    }
    if (HIDWORD(v24) && v16 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      smb2_smb_parse_ioctl_internal_cold_3();
    }
    if (!HIDWORD(v25) || (HIDWORD(v25) -= 112, uint64_t uint16le = md_get_mem(a2, 0, HIDWORD(v25), 0), !uint16le))
    {
      unint64_t v17 = v25;
      if (v25)
      {
        if ([v10 length] >= v17) {
          unsigned int v18 = v25;
        }
        else {
          unsigned int v18 = [v10 length];
        }
        id v20 = v10;
        uint64_t v21 = v18;
        if (md_get_mem(a2, (char *)[v20 bytes], v18, 0))
        {
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
            smb2_smb_parse_ioctl_internal_cold_2();
          }
          uint64_t uint16le = 12;
        }
        else
        {
          uint64_t uint16le = 0;
        }
        [v20 setLength:v21];
      }
      else
      {
        [v10 setLength:0];
        uint64_t uint16le = 0;
      }
    }
    goto LABEL_20;
  }
  if (v29 != 1310840) {
    goto LABEL_71;
  }
  if (v26 && piston_log_level && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    smb2_smb_parse_ioctl_internal_cold_4();
  }
  if (v25 != 32)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      smb2_smb_parse_ioctl_internal_cold_5();
    }
    goto LABEL_19;
  }
  if (!HIDWORD(v25) || (HIDWORD(v25) -= 112, uint64_t uint16le = md_get_mem(a2, 0, HIDWORD(v25), 0), !uint16le))
  {
    uint64_t reparse_point = smb2_smb_parse_get_resume_key(a2, v10);
    goto LABEL_62;
  }
LABEL_20:

  return uint16le;
}

void __smb2_smb_ioctl_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (void (**)(void, void))MEMORY[0x2455D48A0](*(void *)(a1 + 72));
  int v5 = (id *)(a1 + 32);
  int v6 = objc_msgSend(*(id *)(a1 + 32), "sr_ntstatus");
  uint64_t v7 = *(void *)(a1 + 88);
  *(_DWORD *)(v7 + 12) = v6;
  if (a2)
  {
    if (a2 == 22 && *(_DWORD *)(v7 + 4) == 1327346)
    {
      *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "smb_rq_getreply");
      smb2_smb_parse_ioctl_internal(*(void **)(a1 + 40), *(void **)(*(void *)(*(void *)(a1 + 80) + 8) + 24), *(void *)(a1 + 88), *(void **)(a1 + 48), *(void **)(a1 + 64));
      a2 = 22;
    }
    else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      __smb2_smb_ioctl_block_invoke_cold_1((id *)(a1 + 32), a2);
    }
  }
  else
  {
    *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "smb_rq_getreply");
    a2 = smb2_smb_parse_ioctl_internal(*(void **)(a1 + 40), *(void **)(*(void *)(*(void *)(a1 + 80) + 8) + 24), *(void *)(a1 + 88), *(void **)(a1 + 48), *(void **)(a1 + 64));
  }
  if (*v5) {
    objc_msgSend(*v5, "smb_rq_done");
  }
  if (v4) {
    v4[2](v4, a2);
  }
}

uint64_t smb2_smb_parse_ioctl(void *a1, void *a2, uint64_t a3, void *a4, void *a5, void *a6)
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = [a1 pd];
  uint64_t v15 = v14;
  if (v14)
  {
    uint64_t v16 = smb2_smb_parse_ioctl_internal(v14, a2, a3, v11, v13);
  }
  else
  {
    BOOL v17 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v17) {
      smb2_smb_parse_ioctl_cold_1(v17, v18, v19, v20, v21, v22, v23, v24);
    }
    uint64_t v16 = 22;
  }

  return v16;
}

void piston_server_copy_file(void *a1, uint64_t a2, void *a3, void *a4, uint64_t a5, uint64_t a6, void *a7)
{
  id v13 = a1;
  id v14 = a3;
  id v15 = a4;
  id v16 = a7;
  if ((*(unsigned char *)([v13 getSessionPtr] + 560) & 0x40) == 0
    || (*(unsigned char *)([v13 getSessionPtr] + 584) & 2) == 0)
  {
    uint64_t v71 = a6;
    uint64_t v72 = a5;
    id v17 = v13;
    id v18 = v14;
    id v19 = v15;
    uint64_t v20 = (void (**)(id, uint64_t))v16;
    uint64_t v81 = 0;
    uint64_t v82 = 0;
    uint64_t v21 = [v17 getShare:a2];
    if (v21)
    {
      id v74 = v14;
      id v22 = [[SMBNode alloc] init:v17];
      if (!v22)
      {
        BOOL v23 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
        if (v23) {
          piston_server_copy_file_cold_10(v23, v24, v25, v26, v27, v28, v29, v30);
        }
        v20[2](v20, 12);
        id v22 = 0;
      }
      uint64_t v75 = v18;
      uint64_t v76 = v22;
      uint64_t v31 = [v22 commonInit:v17 onShareID:a2];
      if (v31)
      {
        uint64_t v32 = v31;
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          piston_server_copy_file_cold_7();
        }
        v20[2](v20, v32);
      }
      id v33 = [[SMBNode alloc] init:v17];
      if (!v33)
      {
        BOOL v34 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
        if (v34) {
          piston_server_copy_file_cold_8(v34, v35, v36, v37, v38, v39, v40, v41);
        }
        v20[2](v20, 12);
      }
      uint64_t v73 = v19;
      uint64_t v42 = [v33 commonInit:v17 onShareID:a2];
      if (v42)
      {
        uint64_t v43 = v42;
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          piston_server_copy_file_cold_7();
        }
        v20[2](v20, v43);
      }
      uint64_t v44 = malloc_type_malloc(0x18uLL, 0x1010040113C0ABBuLL);
      if (v44)
      {
        BOOL v45 = v44;
        if ((objc_msgSend(v21, "file_system_attrs") & 0x40000) == 0)
        {
          BOOL v46 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
          id v18 = v75;
          if (v46) {
            piston_server_copy_file_cold_3(v46, v47, v48, v49, v50, v51, v52, v53);
          }
          free(v45);
          v20[2](v20, 45);
LABEL_46:

          id v19 = v73;
          id v14 = v74;
          goto LABEL_47;
        }
        uint64_t fid = smb2_smb_create_fid(v76, v75, 0, 137, 1, 1, 1, 0, 0, 0, 0);
        if (!fid)
        {
          uint64_t v64 = smb2fs_smb_listxattrs(v76, &v82, (size_t *)&v81);
          if (v64)
          {
            uint64_t v65 = v64;
            if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
              piston_server_copy_file_cold_5();
            }
          }
          else
          {
            uint64_t v66 = smb2_smb_close_fid(v76, 0, 0);
            if (!v66)
            {
              void *v45 = 0;
              v45[1] = 0;
              v45[2] = 0;
              uint64_t v67 = (uint64_t)v82;
              uint64_t v70 = v81;
              v77[0] = MEMORY[0x263EF8330];
              v77[1] = 3221225472;
              v77[2] = __smb2fs_smb_copyfile_win_block_invoke;
              v77[3] = &unk_265072EA8;
              uint64_t v79 = v82;
              BOOL v80 = v45;
              uint64_t v78 = v20;
              uint64_t v68 = (uint64_t)v45;
              id v19 = v73;
              uint64_t v69 = v67;
              id v18 = v75;
              smb2fs_smb_copyfile_win_xattr(v17, a2, v75, v73, v72, v68, v69, v70, 0, 0, v71, v77);

              id v14 = v74;
              goto LABEL_47;
            }
            uint64_t v65 = v66;
            if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
              piston_server_copy_file_cold_4();
            }
          }
          id v18 = v75;
          if (v82) {
            free(v82);
          }
          free(v45);
          v20[2](v20, v65);
          goto LABEL_46;
        }
        uint64_t v63 = fid;
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          piston_server_copy_file_cold_6();
        }
        free(v45);
        v20[2](v20, v63);
      }
      else
      {
        BOOL v54 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
        if (v54) {
          piston_server_copy_file_cold_2(v54, v55, v56, v57, v58, v59, v60, v61);
        }
        v20[2](v20, 12);
      }

      id v14 = v74;
      id v18 = v75;
      id v19 = v73;
LABEL_47:

      goto LABEL_48;
    }
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      piston_server_copy_file_cold_1();
      if (!v20) {
        goto LABEL_47;
      }
    }
    else if (!v20)
    {
      goto LABEL_47;
    }
    v20[2](v20, 22);
    goto LABEL_47;
  }
  smb2fs_smb_copyfile_stream(v13, a2, v14, v15, a5, 1, 0, 0, v16);
LABEL_48:
}

void smb2fs_smb_copyfile_stream(void *a1, uint64_t a2, void *a3, void *a4, char a5, int a6, void *a7, int a8, void *a9)
{
  uint64_t v140 = *MEMORY[0x263EF8340];
  id v15 = a1;
  id v16 = a3;
  id v17 = a4;
  id v18 = a9;
  uint64_t v137 = 0;
  long long v135 = 0u;
  long long v136 = 0u;
  long long v133 = 0u;
  long long v134 = 0u;
  long long v131 = 0u;
  long long v132 = 0u;
  long long v129 = 0u;
  long long v130 = 0u;
  long long v128 = 0u;
  memset(v127, 0, sizeof(v127));
  id v19 = [v15 getShare:a2];
  if (!v19)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      smb2fs_smb_copyfile_stream_cold_1();
      if (!v18) {
        goto LABEL_72;
      }
    }
    else if (!v18)
    {
      goto LABEL_72;
    }
    v18[2](v18, 22);
    goto LABEL_72;
  }
  id v20 = [[SMBNode alloc] init:v15];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v108 = v17;
    uint64_t v22 = [v20 commonInit:v15 onShareID:a2];
    if (v22)
    {
      uint64_t v23 = v22;
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        smb2fs_smb_copyfile_stream_cold_14();
      }
      v18[2](v18, v23);
    }
    id v24 = [[SMBNode alloc] init:v15];
    if (!v24)
    {
      BOOL v38 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
      if (v38) {
        smb2fs_smb_copyfile_stream_cold_3(v38, v39, v40, v41, v42, v43, v44, v45);
      }
      v18[2](v18, 12);

      goto LABEL_71;
    }
    uint64_t v25 = v24;
    uint64_t v26 = [v24 commonInit:v15 onShareID:a2];
    if (v26)
    {
      uint64_t v27 = v26;
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        smb2fs_smb_copyfile_stream_cold_14();
      }
      v18[2](v18, v27);
    }
    if (a7) {
      a7 = (void *)[[NSString alloc] initWithCString:a7 encoding:4];
    }
    uint64_t fid = smb2_smb_create_fid(v21, v16, a7, 137, 1, 1, 1, 2 * (a8 != 0), v127, 0, 0);
    if (fid)
    {
      uint64_t v29 = fid;
      if (piston_log_level && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        smb2fs_smb_copyfile_stream_cold_13();
      }
LABEL_18:
      v18[2](v18, v29);

LABEL_71:
      id v17 = v108;
      goto LABEL_72;
    }
    uint64_t v107 = *((void *)&v128 + 1);
    if (a5) {
      int v46 = 2;
    }
    else {
      int v46 = 5;
    }
    if (a8) {
      uint64_t v47 = 3;
    }
    else {
      uint64_t v47 = 1;
    }
    if (a8) {
      int v48 = 5;
    }
    else {
      int v48 = v46;
    }
    uint64_t v49 = smb2_smb_create_fid(v25, v108, a7, 407, 1, 0, v48, v47, 0, 0, 0);
    if (v49)
    {
      uint64_t v29 = v49;
      if (piston_log_level && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        smb2fs_smb_copyfile_stream_cold_12();
      }
      if (smb2_smb_close_fid(v21, 0, 0)
        && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        smb2fs_smb_copyfile_stream_cold_11();
      }
      goto LABEL_18;
    }
    uint64_t v103 = a7;
    v110[0] = MEMORY[0x263EF8330];
    v110[1] = 3221225472;
    uint64_t v111 = __smb2fs_smb_copyfile_stream_block_invoke;
    uint64_t v112 = &unk_265072EF8;
    int v117 = a6;
    id v50 = v25;
    id v113 = v50;
    uint64_t v116 = v107;
    id v51 = v21;
    id v114 = v51;
    uint64_t v118 = 0x100000001;
    uint64_t v115 = v18;
    id v105 = v15;
    id v52 = v51;
    id v106 = v50;
    uint64_t v53 = v110;
    id v54 = objc_alloc_init(MEMORY[0x263EFF990]);
    uint64_t v104 = v54;
    if (!v54)
    {
      BOOL v63 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
      if (v63) {
        smb2fs_smb_copyfile_stream_cold_4(v63, v64, v65, v66, v67, v68, v69, v70);
      }
      uint64_t v62 = 0;
      uint64_t v61 = 12;
      uint64_t v71 = v103;
      goto LABEL_69;
    }
    uint64_t v55 = v54;
    uint64_t v102 = v53;
    uint64_t v56 = malloc_type_malloc(0x1A0uLL, 0x60BFFDF0uLL);
    if (!v56)
    {
      BOOL v72 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
      uint64_t v71 = v103;
      if (v72) {
        smb2fs_smb_copyfile_stream_cold_5(v72, v73, v74, v75, v76, v77, v78, v79);
      }
      uint64_t v62 = 0;
      uint64_t v61 = 12;
      goto LABEL_69;
    }
    uint64_t v57 = v56;
    uint64_t v101 = v52;
    v56[24] = 0u;
    v56[25] = 0u;
    v56[22] = 0u;
    v56[23] = 0u;
    v56[20] = 0u;
    v56[21] = 0u;
    v56[18] = 0u;
    v56[19] = 0u;
    v56[16] = 0u;
    v56[17] = 0u;
    v56[14] = 0u;
    v56[15] = 0u;
    v56[12] = 0u;
    v56[13] = 0u;
    v56[10] = 0u;
    v56[11] = 0u;
    v56[8] = 0u;
    v56[9] = 0u;
    v56[6] = 0u;
    v56[7] = 0u;
    v56[4] = 0u;
    v56[5] = 0u;
    v56[2] = 0u;
    v56[3] = 0u;
    *uint64_t v56 = 0u;
    v56[1] = 0u;
    uint64_t v58 = malloc_type_malloc(0x60uLL, 0x1000040718B784FuLL);
    if (v58)
    {
      uint64_t v59 = (uint64_t)v58;
      v58[4] = 0u;
      v58[5] = 0u;
      v58[2] = 0u;
      v58[3] = 0u;
      *uint64_t v58 = 0u;
      v58[1] = 0u;
      *((_DWORD *)v58 + 1) = 1310840;
      [v55 setLength:32];
      uint64_t v60 = smb2_smb_ioctl(0, v101, 0, v59, 0, 0, v55, 0, 0, 0, 0);
      if (v60)
      {
        uint64_t v61 = v60;
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          smb2fs_smb_copyfile_stream_cold_10();
        }
        uint64_t v62 = 0;
        goto LABEL_67;
      }
      if ((unint64_t)[v55 length] <= 0x17)
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          smb2fs_smb_copyfile_stream_cold_7(v55);
        }
        uint64_t v62 = 0;
        uint64_t v61 = 72;
        goto LABEL_67;
      }
      [v55 getBytes:&v138 length:24];
      *(_DWORD *)(v59 + 4) = 1327346;
      [v55 setLength:12];
      *(_OWORD *)uint64_t v57 = v138;
      v57[2] = v139;
      *((_DWORD *)v57 + 7) = 0;
      if (a6 == 1)
      {
        id v89 = objc_alloc_init(MEMORY[0x263EFF990]);
        if (v89)
        {
          uint64_t v62 = v89;
          [v89 appendBytes:v57 length:32];
          *((_DWORD *)v57 + 6) = 0;
          uint64_t v119 = MEMORY[0x263EF8330];
          uint64_t v120 = 3221225472;
          BOOL v121 = __smb2fs_smb_copychunks_block_invoke;
          uint64_t v122 = &unk_265072F20;
          uint64_t v90 = v55;
          uint64_t v123 = v90;
          uint64_t v125 = (void *)v59;
          uint64_t v126 = v57;
          uint64_t v88 = v102;
          uint64_t v124 = v102;
          uint64_t v61 = smb2_smb_ioctl(v105, v106, 0, v59, 0, v62, v90, 0, 0, 0, &v119);

          uint64_t v71 = v103;
          id v52 = v101;
          if (!v61) {
            goto LABEL_70;
          }
          goto LABEL_68;
        }
        BOOL v93 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
        if (v93) {
          smb2fs_smb_copyfile_stream_cold_4(v93, v94, v95, v96, v97, v98, v99, v100);
        }
        goto LABEL_62;
      }
      uint64_t v91 = (unint64_t *)malloc_type_malloc(0x20uLL, 0x1000040F6D918ACuLL);
      if (v91)
      {
        uint64_t v92 = v91;
        *uint64_t v91 = v107;
        v91[1] = 0;
        *((_OWORD *)v91 + 1) = xmmword_23F8827D0;
        uint64_t v119 = MEMORY[0x263EF8330];
        uint64_t v120 = 3221225472;
        BOOL v121 = __smb2fs_smb_copychunks_block_invoke_3;
        uint64_t v122 = &unk_265072EA8;
        uint64_t v124 = v91;
        uint64_t v125 = v57;
        uint64_t v88 = v102;
        uint64_t v123 = v102;
        smb2fs_smb_copychunks_win(v105, v106, v107, (uint64_t)v57, v92, v59, &v119);

        uint64_t v62 = 0;
        uint64_t v71 = v103;
        id v52 = v101;
        goto LABEL_70;
      }
      BOOL v80 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
      if (v80) {
        goto LABEL_61;
      }
    }
    else
    {
      BOOL v80 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
      if (v80) {
LABEL_61:
      }
        smb2fs_smb_copyfile_stream_cold_5(v80, v81, v82, v83, v84, v85, v86, v87);
    }
LABEL_62:
    uint64_t v62 = 0;
    uint64_t v61 = 12;
LABEL_67:
    uint64_t v71 = v103;
    id v52 = v101;
    uint64_t v88 = v102;
LABEL_68:
    free(v57);
    uint64_t v53 = v88;
LABEL_69:
    v111((uint64_t)v53, v61);
    uint64_t v88 = v53;
LABEL_70:

    goto LABEL_71;
  }
  BOOL v30 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
  if (v30) {
    smb2fs_smb_copyfile_stream_cold_2(v30, v31, v32, v33, v34, v35, v36, v37);
  }
  v18[2](v18, 12);
LABEL_72:
}

uint64_t smb2fs_smb_check_copyfile(void *a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v1 = a1;
  memset(v17, 0, sizeof(v17));
  id v2 = objc_alloc_init(MEMORY[0x263EFF990]);
  id v3 = v2;
  if (v2)
  {
    DWORD1(v17[0]) = 1310840;
    [v2 setLength:32];
    uint64_t v4 = smb2_smb_ioctl(0, v1, 0, (uint64_t)v17, 0, 0, v3, 0, 0, 0, 0);
    if (v4)
    {
      uint64_t v5 = v4;
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        smb2fs_smb_check_copyfile_cold_3();
      }
    }
    else if ((unint64_t)[v3 length] > 0x17)
    {
      id v14 = [v1 pd];
      uint64_t v15 = [v14 getSessionPtr];
      *(void *)(v15 + 560) |= 0x800uLL;

      uint64_t v5 = 0;
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        smb2fs_smb_check_copyfile_cold_2(v3);
      }
      uint64_t v5 = 72;
    }
  }
  else
  {
    BOOL v6 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v6) {
      smb2fs_smb_check_copyfile_cold_1(v6, v7, v8, v9, v10, v11, v12, v13);
    }
    uint64_t v5 = 12;
  }

  return v5;
}

uint64_t smb2_smb_parse_get_reparse_point(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  uint64_t v20 = 0;
  size_t size = 0;
  int v18 = 0;
  CFIndex v17 = 0;
  uint64_t uint32le = md_get_uint32le(a3, (_DWORD *)&v20 + 1);
  if (!uint32le)
  {
    if (HIDWORD(v20) == -1610612724)
    {
      uint64_t uint32le = md_get_uint16le(a3, (_WORD *)&size + 3);
      if (!uint32le)
      {
        uint64_t uint32le = md_get_uint16le(a3, (_WORD *)&size + 2);
        if (!uint32le)
        {
          uint64_t uint32le = md_get_uint16le(a3, (_WORD *)&size + 1);
          if (!uint32le)
          {
            uint64_t uint32le = md_get_uint16le(a3, &size);
            if (!uint32le)
            {
              uint64_t uint32le = md_get_uint16le(a3, (_WORD *)&v18 + 1);
              if (!uint32le)
              {
                uint64_t uint32le = md_get_uint16le(a3, &v18);
                if (!uint32le)
                {
                  uint64_t uint32le = md_get_uint32le(a3, &v20);
                  if (!uint32le)
                  {
                    unsigned int v7 = (unsigned __int16)size;
                    if (!(_WORD)size || *(_DWORD *)(a1 + 80) < (unsigned __int16)size) {
                      goto LABEL_12;
                    }
                    if (WORD1(size))
                    {
                      uint64_t uint32le = md_get_mem(a3, 0, WORD1(size), 0);
                      if (uint32le) {
                        goto LABEL_16;
                      }
                      unsigned int v7 = (unsigned __int16)size;
                    }
                    uint64_t v9 = (char *)malloc_type_malloc(v7, 0x66D929C1uLL);
                    if (v9)
                    {
                      uint64_t v10 = v9;
                      uint64_t uint32le = md_get_mem(a3, v9, (unsigned __int16)size, 0);
                      if (!uint32le)
                      {
                        size_t v11 = 9 * (unsigned __int16)size + 1;
                        CFIndex v17 = v11;
                        uint64_t v12 = (UInt8 *)malloc_type_malloc(v11, 0x133FDE33uLL);
                        if (v12)
                        {
                          uint64_t v13 = v12;
                          bzero(v12, v11);
                          uint64_t v14 = smb_convert_network_to_path(v10, (unsigned __int16)size, v13, &v17, 92, 32, 1);
                          uint64_t uint32le = v14;
                          if (v5 && !v14)
                          {
                            id v15 = [NSString alloc];
                            id v16 = objc_msgSend(v15, "initWithCString:encoding:", v13, 4, v17);
                            [v5 setString:v16];
                          }
                          free(v13);
                        }
                        else
                        {
                          uint64_t uint32le = 12;
                        }
                      }
                      free(v10);
                    }
                    else
                    {
LABEL_12:
                      uint64_t uint32le = 12;
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        smb2_smb_parse_get_reparse_point_cold_1();
      }
      uint64_t uint32le = 72;
    }
  }
LABEL_16:

  return uint32le;
}

uint64_t smb2_smb_parse_get_resume_key(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t mem = md_get_mem(a1, (char *)[v3 bytes], 32, 0);
  if (mem)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      smb2_smb_parse_get_resume_key_cold_1();
    }
    uint64_t mem = 12;
  }
  [v3 setLength:32];

  return mem;
}

uint64_t smb2_smb_parse_copychunk_response(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t mem = md_get_mem(a1, (char *)[v3 bytes], 12, 0);
  if (mem)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      smb2_smb_parse_copychunk_response_cold_1();
    }
    uint64_t mem = 12;
  }
  [v3 setLength:12];

  return mem;
}

void smb2fs_smb_copyfile_win_xattr(void *a1, uint64_t a2, void *a3, void *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, int a10, uint64_t a11, void *a12)
{
  id v19 = a1;
  id v20 = a3;
  id v21 = a4;
  id v22 = a12;
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __smb2fs_smb_copyfile_win_xattr_block_invoke;
  v27[3] = &unk_265072ED0;
  uint64_t v32 = a6;
  uint64_t v33 = a8;
  int v37 = a2;
  id v28 = v19;
  id v29 = v20;
  uint64_t v34 = a7;
  uint64_t v35 = a5;
  uint64_t v36 = a11;
  id v30 = v21;
  id v31 = v22;
  id v23 = v22;
  id v24 = v21;
  id v25 = v20;
  id v26 = v19;
  smb2fs_smb_copyfile_stream(v26, a2, v25, v24, a5, 0, a9, a10, v27);
}

uint64_t __smb2fs_smb_copyfile_win_block_invoke(void *a1, int a2)
{
  if (a2 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    __smb2fs_smb_copyfile_win_block_invoke_cold_1();
  }
  id v3 = (void *)a1[5];
  if (v3) {
    free(v3);
  }
  uint64_t v4 = (void *)a1[6];
  if (v4) {
    free(v4);
  }
  return (*(uint64_t (**)(void))(a1[4] + 16))();
}

uint64_t __smb2fs_smb_copyfile_win_xattr_block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      __smb2fs_smb_copyfile_win_xattr_block_invoke_cold_1();
    }
    return (*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  uint64_t v4 = *(uint64_t **)(a1 + 64);
  uint64_t v5 = *v4;
  if (!*v4)
  {
    uint64_t v11 = *(void *)(a1 + 72);
    v4[1] = v11;
    if (v11)
    {
      *uint64_t v4 = *(void *)(a1 + 80);
      uint64_t v8 = *(void *)(a1 + 64);
      size_t v9 = *(void *)(a1 + 72);
      uint64_t v10 = *(const char **)v8;
      goto LABEL_10;
    }
    return (*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  uint64_t v6 = v4[2] + 1;
  uint64_t v7 = v4[1] - v6;
  v4[1] = v7;
  v4[2] = v6;
  if (!v7) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  *uint64_t v4 = v5 + v6;
  uint64_t v8 = *(void *)(a1 + 64);
  uint64_t v10 = *(const char **)v8;
  size_t v9 = *(void *)(v8 + 8);
LABEL_10:
  size_t v12 = strnlen(v10, v9);
  *(void *)(v8 + 16) = v12;
  return smb2fs_smb_copyfile_win_xattr(*(void *)(a1 + 32), *(unsigned int *)(a1 + 104), *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 88), v8, *(void *)(a1 + 80), *(void *)(a1 + 72), v10, v12, *(void *)(a1 + 96), *(void *)(a1 + 56));
}

uint64_t __smb2fs_smb_copyfile_stream_block_invoke(uint64_t a1, int a2)
{
  __darwin_time_t tv_sec = 0;
  uint64_t v5 = 0;
  if (a2)
  {
    if (piston_log_level && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      __smb2fs_smb_copyfile_stream_block_invoke_cold_5();
    }
    return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  if (*(_DWORD *)(a1 + 64)) {
    goto LABEL_6;
  }
  if (smb2fs_smb_set_eof(*(void **)(a1 + 32), *(void *)(a1 + 56)))
  {
    if (piston_log_level && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      __smb2fs_smb_copyfile_stream_block_invoke_cold_4();
    }
  }
  else
  {
    v6.__darwin_time_t tv_sec = 0;
    *(void *)&v6.tv_usec = 0;
    gettimeofday(&v6, 0);
    __darwin_time_t tv_sec = v6.tv_sec;
    uint64_t v5 = 1000 * v6.tv_usec;
    if (!smb2fs_smb_setfattrNT(*(void **)(a1 + 32), 0, 0, &tv_sec, 0))
    {
LABEL_6:
      if (*(_DWORD *)(a1 + 68) == 1
        && smb2_smb_close_fid(*(void **)(a1 + 40), 0, 0)
        && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        __smb2fs_smb_copyfile_stream_block_invoke_cold_2();
      }
      if (*(_DWORD *)(a1 + 72) == 1
        && smb2_smb_close_fid(*(void **)(a1 + 32), 0, 0)
        && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        __smb2fs_smb_copyfile_stream_block_invoke_cold_1();
      }
      return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
    }
    if (piston_log_level && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      __smb2fs_smb_copyfile_stream_block_invoke_cold_3();
    }
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

uint64_t __smb2fs_smb_copychunks_block_invoke(uint64_t a1, int a2)
{
  if (a2 && piston_log_level && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    __smb2fs_smb_copychunks_block_invoke_cold_3();
  }
  if ((unint64_t)[*(id *)(a1 + 32) length] <= 0xB
    && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    __smb2fs_smb_copychunks_block_invoke_cold_2((id *)(a1 + 32));
  }
  unsigned int v3 = *(_DWORD *)(*(void *)(a1 + 48) + 12);
  if (v3)
  {
    if (piston_log_level)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        __smb2fs_smb_copychunks_block_invoke_cold_1();
      }
      unsigned int v3 = *(_DWORD *)(*(void *)(a1 + 48) + 12);
    }
    piston_ntstatus_to_errno(v3);
  }
  uint64_t v4 = *(void **)(a1 + 56);
  if (v4) {
    free(v4);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

void smb2fs_smb_copychunks_win(void *a1, void *a2, uint64_t a3, uint64_t a4, unint64_t *a5, uint64_t a6, void *a7)
{
  uint64_t v13 = a1;
  id v14 = a2;
  id v15 = a7;
  id v16 = objc_alloc_init(MEMORY[0x263EFF990]);
  CFIndex v17 = v16;
  if (v16)
  {
    uint64_t v44 = a3;
    uint64_t v45 = v13;
    [v16 setLength:12];
    LODWORD(v13) = 0;
    uint64_t v18 = 0;
    unint64_t v19 = *((unsigned int *)a5 + 6);
    unint64_t v21 = *a5;
    unint64_t v20 = a5[1];
    if (v19 && v21)
    {
      uint64_t v13 = 0;
      uint64_t v18 = 0;
      unint64_t v22 = *((unsigned int *)a5 + 5);
      int64x2_t v23 = vdupq_n_s64(v20);
      id v24 = (_DWORD *)(a4 + 52);
      unint64_t v25 = *a5;
      do
      {
        if (v25 <= v22) {
          unint64_t v26 = v25;
        }
        else {
          unint64_t v26 = v22;
        }
        *(v24 - 1) = v26;
        _DWORD *v24 = 0;
        *(int64x2_t *)(v24 - 5) = v23;
        v18 += v26;
        if ((unint64_t)++v13 >= v19) {
          break;
        }
        int64x2_t v23 = vaddq_s64(v23, vdupq_n_s64(v26));
        v24 += 6;
        v25 -= v26;
      }
      while (v25);
    }
    *a5 = v21 - v18;
    a5[1] = v18 + v20;
    *(_DWORD *)(a4 + 24) = v13;
    id v27 = objc_alloc_init(MEMORY[0x263EFF990]);
    if (!v27)
    {
      BOOL v28 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
      if (v28) {
        smb2fs_smb_copychunks_win_cold_1(v28, v29, v30, v31, v32, v33, v34, v35);
      }
      v15[2](v15, 0);
    }
    [v27 appendBytes:a4 length:(24 * v13 + 32)];
    v46[0] = MEMORY[0x263EF8330];
    v46[1] = 3221225472;
    v46[2] = __smb2fs_smb_copychunks_win_block_invoke;
    v46[3] = &unk_265072F48;
    int v57 = (int)v13;
    id v51 = a5;
    uint64_t v52 = v18;
    uint64_t v53 = a6;
    id v47 = v17;
    uint64_t v13 = v45;
    uint64_t v54 = v44;
    uint64_t v55 = a4;
    int v48 = v45;
    id v49 = v14;
    uint64_t v56 = a4;
    id v50 = v15;
    smb2_smb_ioctl(0, v49, 0, a6, 0, v27, v47, 0, 0, 0, v46);
  }
  else
  {
    BOOL v36 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v36) {
      smb2fs_smb_copychunks_win_cold_1(v36, v37, v38, v39, v40, v41, v42, v43);
    }
    v15[2](v15, 12);
  }
}

uint64_t __smb2fs_smb_copychunks_block_invoke_3(void *a1, int a2)
{
  if (a2 && piston_log_level && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    __smb2fs_smb_copychunks_block_invoke_3_cold_1();
  }
  unsigned int v3 = (void *)a1[5];
  if (v3) {
    free(v3);
  }
  uint64_t v4 = (void *)a1[6];
  if (v4) {
    free(v4);
  }
  return (*(uint64_t (**)(void))(a1[4] + 16))();
}

uint64_t __smb2fs_smb_copychunks_win_block_invoke(uint64_t a1, int a2)
{
  int v2 = a2;
  unsigned int v13 = 0;
  uint64_t v12 = 0;
  if (a2)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      __smb2fs_smb_copychunks_win_block_invoke_cold_6(a1, v2);
    }
    if (*(_DWORD *)(*(void *)(a1 + 80) + 12) != -1073741811) {
      return (*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16))();
    }
  }
  if ((unint64_t)objc_msgSend(*(id *)(a1 + 32), "length", v12) > 0xB)
  {
    [*(id *)(a1 + 32) getBytes:&v12 length:12];
    unsigned int v4 = *(_DWORD *)(*(void *)(a1 + 80) + 12);
    if (v4)
    {
      if (v4 == -1073741811)
      {
        uint64_t v5 = *(_DWORD **)(a1 + 64);
        if (!v5[4])
        {
          unsigned int v7 = HIDWORD(v12);
          unsigned int v8 = v5[5];
          if (HIDWORD(v12) < v8)
          {
            v5[5] = HIDWORD(v12);
            unsigned int v8 = v7;
          }
          unsigned int v9 = v13 / v8;
          if (v9 >= v12) {
            unsigned int v9 = v12;
          }
          v5[6] = v9;
          v5[4] = 1;
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
            __smb2fs_smb_copychunks_win_block_invoke_cold_3();
          }
          uint64_t v10 = *(void *)(a1 + 88);
          uint64_t v11 = *(void **)(a1 + 64);
          *uint64_t v11 = v10;
          v11[1] = 0;
          if (!v10) {
            return (*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16))();
          }
          return smb2fs_smb_copychunks_win(*(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 88), *(void *)(a1 + 104));
        }
      }
      if (piston_log_level)
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          __smb2fs_smb_copychunks_win_block_invoke_cold_2();
        }
        unsigned int v4 = *(_DWORD *)(*(void *)(a1 + 80) + 12);
      }
      int v2 = piston_ntstatus_to_errno(v4);
    }
    else
    {
      if (v12 != *(_DWORD *)(*(void *)(a1 + 96) + 24))
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          __smb2fs_smb_copychunks_win_block_invoke_cold_5();
        }
        return (*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16))();
      }
      if (*(void *)(a1 + 72) != v13)
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          __smb2fs_smb_copychunks_win_block_invoke_cold_4();
        }
        return (*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16))();
      }
    }
    if (v2 || !**(void **)(a1 + 64)) {
      return (*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16))();
    }
    return smb2fs_smb_copychunks_win(*(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 88), *(void *)(a1 + 104));
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    __smb2fs_smb_copychunks_win_block_invoke_cold_1((id *)(a1 + 32));
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16))();
}

void OUTLINED_FUNCTION_9(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

uint64_t smb2_smb_echo(void *a1)
{
  id v1 = a1;
  int v2 = [v1 sock];

  if (!v2)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      smb2_smb_echo_cold_1();
    }
    uint64_t v3 = 57;
    goto LABEL_14;
  }
  id v16 = 0;
  uint64_t v3 = smb2_rq_alloc(13, 0, 0, 0, v1, &v16);
  id v4 = v16;
  id v5 = v4;
  if (!v3)
  {
    v17.__darwin_time_t tv_sec = 0;
    *(void *)&v17.tv_usec = 0;
    uint64_t v6 = objc_msgSend(v4, "smb_rq_getrequest");
    mb_put_uint16le(v6, 4);
    mb_put_uint16le(v6, 0);
    gettimeofday(&v17, 0);
    __darwin_time_t tv_sec = v17.tv_sec;
    uint64_t v8 = 1000 * v17.tv_usec;
    unsigned int v9 = [v1 sock];
    objc_msgSend(v9, "setLast_echo:", tv_sec, v8);

    uint64_t v11 = MEMORY[0x263EF8330];
    uint64_t v12 = 3221225472;
    unsigned int v13 = __smb2_smb_echo_block_invoke;
    id v14 = &unk_265072F70;
    id v5 = v5;
    id v15 = v5;
    uint64_t v3 = smb_rq_simple_block(v1, v5, &v11);
    if (v3)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        smb2_smb_echo_cold_2(v3);
        if (!v5) {
          goto LABEL_12;
        }
        goto LABEL_11;
      }
      if (v5) {
LABEL_11:
      }
        objc_msgSend(v5, "smb_rq_done", v11, v12, v13, v14);
    }
LABEL_12:

    goto LABEL_13;
  }
  if (v4)
  {
    objc_msgSend(v4, "smb_rq_done");
LABEL_13:
  }
LABEL_14:

  return v3;
}

void *__smb2_smb_echo_block_invoke(uint64_t a1, int a2)
{
  int v6 = 0;
  if (a2)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      __smb2_smb_echo_block_invoke_cold_2(a1, a2);
    }
  }
  else
  {
    id v4 = objc_msgSend(*(id *)(a1 + 32), "smb_rq_getreply");
    if (!md_get_uint16le(v4, (_WORD *)&v6 + 1))
    {
      if (HIWORD(v6) == 4)
      {
        md_get_uint16le(v4, &v6);
      }
      else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        __smb2_smb_echo_block_invoke_cold_1((unsigned __int16 *)&v6 + 1);
      }
    }
  }
  uint64_t result = *(void **)(a1 + 32);
  if (result) {
    return objc_msgSend(result, "smb_rq_done");
  }
  return result;
}

uint64_t smb2_rq_credit_increment(void *a1)
{
  id v7 = a1;
  uint64_t v1 = objc_msgSend(v7, "sr_sessionp");
  if (objc_msgSend(v7, "sr_rspcreditsgranted"))
  {
    int v2 = objc_msgSend(v7, "sr_command");
    if ((v2 - 2) >= 2)
    {
      if (v2)
      {
        if (v2 == 1)
        {
          pthread_mutex_lock((pthread_mutex_t *)(v1 + 608));
          atomic_fetch_add((atomic_uint *volatile)(v1 + 684), objc_msgSend(v7, "sr_rspcreditsgranted"));
        }
        else
        {
          pthread_mutex_lock((pthread_mutex_t *)(v1 + 608));
          atomic_fetch_add((atomic_uint *volatile)(v1 + 680), objc_msgSend(v7, "sr_rspcreditsgranted"));
          signed int v3 = atomic_load((unsigned int *)(v1 + 680));
          unsigned int v4 = atomic_load((unsigned int *)(v1 + 688));
          if (v4 < v3)
          {
            if (v3 >= 0xFFFF) {
              signed int v3 = 0xFFFF;
            }
            atomic_store(v3, (unsigned int *)(v1 + 688));
          }
          if (atomic_load((unsigned int *)(v1 + 692)))
          {
            atomic_fetch_add((atomic_uint *volatile)(v1 + 692), 0xFFFFFFFF);
            pthread_cond_signal((pthread_cond_t *)(v1 + 696));
          }
        }
        pthread_mutex_unlock((pthread_mutex_t *)(v1 + 608));
      }
    }
  }
  return MEMORY[0x270F9A758]();
}

void smb_rq_bend(void *a1)
{
  id v1 = a1;
  if (objc_msgSend(v1, "sr_bcount"))
  {
    unint64_t v2 = *(void *)(objc_msgSend(v1, "smb_rq_getrequest") + 24);
    if (v2 >= 0x10000)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        smb_rq_bend_cold_2();
      }
      LOWORD(v2) = -1;
    }
    *(_WORD *)objc_msgSend(v1, "sr_bcount") = v2;
  }
  else
  {
    BOOL v3 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v3) {
      smb_rq_bend_cold_1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void smb_rq_bend32(void *a1)
{
  id v1 = a1;
  if (objc_msgSend(v1, "sr_lcount"))
  {
    unint64_t v2 = *(void *)(objc_msgSend(v1, "smb_rq_getrequest") + 24);
    if (HIDWORD(v2))
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        smb_rq_bend32_cold_2();
      }
      LODWORD(v2) = 0xFFFFFFF;
    }
    *(_DWORD *)objc_msgSend(v1, "sr_lcount") = v2;
  }
  else
  {
    BOOL v3 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v3) {
      smb_rq_bend32_cold_1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void smb_rq_bstart(void *a1)
{
  id v1 = a1;
  uint64_t v2 = objc_msgSend(v1, "smb_rq_getrequest");
  objc_msgSend(v1, "setSr_bcount:", mb_reserve(v2, 2uLL));

  *(void *)(v2 + 24) = 0;
}

void smb_rq_cancel_all_requests(pthread_mutex_t *a1, void *a2, _DWORD *a3, void *a4, void *a5)
{
  id v9 = a2;
  id v10 = a4;
  uint64_t v11 = a5;
  uint64_t v12 = smb_rq_find(a1, v9, 0, 0, 0, 0, 1);
  if (v12)
  {
    unsigned int v13 = (void *)v12;
    do
    {
      if ((objc_msgSend(v13, "sr_extflags") & 2) == 0)
      {
        objc_msgSend(v13, "smb_rq_set_extflag:", 16);
        smb_rq_dequeue(a1, v9, a3, v10, v13);
        if ((objc_msgSend(v13, "sr_extflags") & 4) != 0)
        {
          v15[0] = MEMORY[0x263EF8330];
          v15[1] = 3221225472;
          v15[2] = __smb_rq_cancel_all_requests_block_invoke;
          v15[3] = &unk_265072F98;
          id v16 = v13;
          int v17 = 57;
          dispatch_async(v11, v15);
        }
      }
      uint64_t v14 = smb_rq_find(a1, v9, 0, 0, 0, 0, 1);

      unsigned int v13 = (void *)v14;
    }
    while (v14);
  }
}

id smb_rq_find(pthread_mutex_t *a1, void *a2, uint64_t a3, BOOL *a4, uint64_t *a5, void *a6, char a7)
{
  uint64_t v59 = *MEMORY[0x263EF8340];
  id v11 = a2;
  v52.__darwin_time_t tv_sec = 0;
  *(void *)&v52.__darwin_suseconds_t tv_usec = 0;
  pthread_mutex_lock(a1);
  uint64_t v12 = [v11 count];
  if (!v12)
  {
    if (a4) {
      *a4 = 1;
    }
    if (a5) {
      *a5 = 0;
    }
    if (a6) {
      *a6 = 0;
    }
    pthread_mutex_unlock(a1);
    id v37 = 0;
    goto LABEL_56;
  }
  uint64_t v14 = v12;
  uint64_t v45 = a4;
  int v46 = a1;
  id v15 = 0;
  id v16 = 0;
  int v17 = 0;
  uint64_t v47 = 0;
  uint64_t v49 = 0;
  uint64_t v50 = 0;
  uint64_t v18 = 0;
  *(void *)&long long v13 = 136315650;
  long long v44 = v13;
  unint64_t v19 = a5;
  while (1)
  {
    unint64_t v20 = v16;
    id v16 = objc_msgSend(v11, "objectAtIndexedSubscript:", v18, v44);

    if (v16) {
      break;
    }
LABEL_29:
    if (v14 == ++v18) {
      goto LABEL_39;
    }
  }
  if ((objc_msgSend(v16, "sr_flags") & 2) == 0)
  {
    if (!v17) {
      goto LABEL_9;
    }
    uint64_t v21 = objc_msgSend(v16, "sr_credit_timesent");
    BOOL v23 = v50 <= v21;
    if (v50 == v21) {
      BOOL v23 = v49 <= v22;
    }
    if (!v23)
    {
LABEL_9:
      uint64_t v47 = objc_msgSend(v16, "sr_messageid");
      uint64_t v24 = objc_msgSend(v16, "sr_credit_timesent");
      uint64_t v49 = v25;
      uint64_t v50 = v24;
    }
    int v17 = 1;
  }
  if ((a7 & 1) == 0)
  {
    if (objc_msgSend(v16, "sr_messageid") != a3)
    {
LABEL_15:
      char v27 = objc_msgSend(v16, "sr_extflags");
      if (a6
        && (v27 & 4) != 0
        && (objc_msgSend(v16, "sr_flags") & 2) == 0
        && (objc_msgSend(v16, "sr_flags") & 0x200) == 0)
      {
        gettimeofday(&v52, 0);
        __darwin_suseconds_t tv_usec = v52.tv_usec;
        uint64_t v29 = -121;
        if (v52.tv_usec >= 0) {
          uint64_t v29 = -120;
        }
        uint64_t v30 = v29 + v52.tv_sec;
        uint64_t v31 = objc_msgSend(v16, "sr_timesent");
        BOOL v33 = v30 <= v31;
        if (v30 == v31)
        {
          uint64_t v34 = 1000 * tv_usec;
          if (tv_usec < 0) {
            v34 += 1000000000;
          }
          BOOL v33 = v34 <= v32;
        }
        unint64_t v19 = a5;
        if (!v33)
        {
          objc_msgSend(v16, "smb_rq_set_extflag:", 4);
          objc_msgSend(v16, "setSr_extflags:", objc_msgSend(v16, "sr_extflags") & 0xFFFFFFFBLL);
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
          {
            int v35 = objc_msgSend(v16, "sr_command");
            uint64_t v36 = objc_msgSend(v16, "sr_messageid");
            *(_DWORD *)buf = v44;
            uint64_t v54 = "smb_rq_find";
            __int16 v55 = 1024;
            int v56 = v35;
            __int16 v57 = 2048;
            uint64_t v58 = v36;
            _os_log_error_impl(&dword_23F849000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s: Timed out waiting on the response for <0x%x> message_id = <%lld> \n", buf, 0x1Cu);
          }
          *a6 = v16;
        }
      }
      goto LABEL_29;
    }
    id v26 = v16;

    if (v19)
    {
      id v15 = v26;
      goto LABEL_15;
    }
    pthread_mutex_unlock(v46);
    id v15 = v26;
LABEL_44:
    uint64_t v39 = v45;
    if (!v45) {
      goto LABEL_55;
    }
    goto LABEL_48;
  }
  id v38 = v16;

  id v15 = v38;
  unint64_t v19 = a5;
LABEL_39:
  pthread_mutex_unlock(v46);
  if (!v19) {
    goto LABEL_44;
  }
  if (v17)
  {
    uint64_t v39 = v45;
    uint64_t v40 = v47;
  }
  else
  {
    uint64_t v39 = v45;
    uint64_t v40 = v47;
    if (v15) {
      uint64_t v40 = objc_msgSend(v15, "sr_messageid");
    }
  }
  *a5 = v40;
  if (v39)
  {
LABEL_48:
    BOOL v42 = v14 == 1 && v15 != 0;
    *uint64_t v39 = v42;
  }
LABEL_55:
  id v37 = v15;

LABEL_56:
  return v37;
}

void smb_rq_dequeue(pthread_mutex_t *a1, void *a2, _DWORD *a3, void *a4, void *a5)
{
  id v11 = a2;
  id v9 = a4;
  id v10 = a5;
  pthread_mutex_lock(a1);
  [v11 removeObjectIdenticalTo:v10];

  if (*a3 == 1 && ![v11 count])
  {
    *a3 = 0;
    dispatch_suspend(v9);
  }
  pthread_mutex_unlock(a1);
}

uint64_t __smb_rq_cancel_all_requests_block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "smb_rq_callback:", *(unsigned int *)(a1 + 40));
}

void smb_rq_empty_queue(pthread_mutex_t *a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = a2;
  pthread_mutex_lock(a1);
  uint64_t v4 = [v3 lastObject];
  if (v4)
  {
    uint64_t v6 = (void *)v4;
    uint64_t v7 = &_os_log_internal;
    *(void *)&long long v5 = 136315650;
    long long v11 = v5;
    do
    {
      objc_msgSend(v3, "removeLastObject", v11);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        uint64_t v9 = objc_msgSend(v6, "sr_messageid");
        int v10 = objc_msgSend(v6, "sr_command");
        *(_DWORD *)buf = v11;
        long long v13 = "smb_rq_empty_queue";
        __int16 v14 = 2048;
        uint64_t v15 = v9;
        __int16 v16 = 1024;
        int v17 = v10;
        _os_log_error_impl(&dword_23F849000, v7, OS_LOG_TYPE_ERROR, "%s: rqp with message ID <%lld> cmd <%d> left on queue \n", buf, 0x1Cu);
      }
      objc_msgSend(v6, "smb_rq_done");
      uint64_t v8 = [v3 lastObject];

      uint64_t v6 = (void *)v8;
    }
    while (v8);
  }
  pthread_mutex_unlock(a1);
}

void smb_rq_enqueue(pthread_mutex_t *a1, void *a2, _DWORD *a3, void *a4, void *a5)
{
  object = a4;
  id v9 = a5;
  id v10 = a2;
  pthread_mutex_lock(a1);
  [v10 addObject:v9];

  if (!*a3)
  {
    *a3 = 1;
    dispatch_resume(object);
  }
  pthread_mutex_unlock(a1);
}

id smb_rq_find_cmpd(pthread_mutex_t *a1, void *a2, uint64_t a3, void *a4)
{
  id v7 = a2;
  pthread_mutex_lock(a1);
  uint64_t v8 = [v7 count];
  if (!v8)
  {
    if (a4) {
      *a4 = 0;
    }
    pthread_mutex_unlock(a1);
    id v17 = 0;
    goto LABEL_19;
  }
  uint64_t v9 = v8;
  uint64_t v10 = 0;
  long long v11 = 0;
  while (1)
  {
    uint64_t v12 = v11;
    long long v11 = [v7 objectAtIndexedSubscript:v10];

    if (v11) {
      break;
    }
LABEL_9:
    if (++v10 == v9)
    {
      id v13 = 0;
      id v17 = 0;
      goto LABEL_12;
    }
  }
  id v13 = v11;
  uint64_t v14 = objc_msgSend(v13, "sr_next_rqp");
  if (!v14)
  {
LABEL_8:

    goto LABEL_9;
  }
  uint64_t v15 = (void *)v14;
  while (objc_msgSend(v15, "sr_messageid") != a3)
  {
    uint64_t v16 = objc_msgSend(v15, "sr_next_rqp");

    uint64_t v15 = (void *)v16;
    if (!v16) {
      goto LABEL_8;
    }
  }
  id v17 = v15;
LABEL_12:
  pthread_mutex_unlock(a1);
  if (a4 && v17) {
    *a4 = v13;
  }

LABEL_19:
  return v17;
}

void smb_rq_handle_async_pending(void *a1, uint64_t a2)
{
  id v3 = a1;
  objc_msgSend(v3, "smb_rq_set_extflag:", 32);
  objc_msgSend(v3, "setSr_rspasyncid:", *(void *)(a2 + 32));
  objc_msgSend(v3, "setSr_rspcreditsgranted:", *(unsigned __int16 *)(a2 + 14));
  smb2_rq_credit_increment(v3);
  smb_rq_set_time_sent(v3, 1);
}

void smb_rq_set_time_sent(void *a1, int a2)
{
  id v5 = a1;
  v6.__darwin_time_t tv_sec = 0;
  *(void *)&v6.__darwin_suseconds_t tv_usec = 0;
  gettimeofday(&v6, 0);
  __darwin_time_t tv_sec = v6.tv_sec;
  uint64_t v4 = 1000 * v6.tv_usec;
  if (!a2) {
    objc_msgSend(v5, "setSr_credit_timesent:", v6.tv_sec, 1000 * v6.tv_usec);
  }
  objc_msgSend(v5, "setSr_timesent:", tv_sec, v4);
}

uint64_t smb_rq_simple(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = a1;
  objc_msgSend(v3, "smb_rq_set_srflags:", 2048);
  if (objc_msgSend(v3, "sr_command") == 2) {
    uint64_t v5 = 5;
  }
  else {
    uint64_t v5 = 0;
  }
  uint64_t v6 = smb_rq_simple_timed(v4, v3, v5);

  return v6;
}

uint64_t smb_rq_simple_timed(void *a1, void *a2, uint64_t a3)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v5 = a1;
  id v6 = a2;
  uint64_t v23 = 0;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x2020000000;
  int v26 = 0;
  dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
  uint64_t v8 = [v5 sock];
  BOOL v9 = v8 == 0;

  if (v9)
  {
    uint64_t v12 = 57;
  }
  else
  {
    objc_msgSend(v6, "setSr_timeout:", a3);
    if ((objc_msgSend(v6, "sr_flags") & 0x800) != 0)
    {
      uint64_t v17 = MEMORY[0x263EF8330];
      uint64_t v18 = 3221225472;
      unint64_t v19 = __smb_rq_simple_timed_block_invoke;
      unint64_t v20 = &unk_265072FC0;
      uint64_t v22 = &v23;
      uint64_t v21 = v7;
      objc_msgSend(v6, "setSr_callback:", &v17);
    }
    uint64_t v10 = objc_msgSend(v5, "sock", v17, v18, v19, v20);
    int v11 = [v10 sendRequest:v6];
    *((_DWORD *)v24 + 6) = v11;

    if (*((_DWORD *)v24 + 6))
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        smb_rq_simple_timed_cold_2();
      }
    }
    else if ((objc_msgSend(v6, "sr_flags") & 0x800) != 0)
    {
      if (objc_msgSend(v6, "sr_timeout"))
      {
        dispatch_time_t v13 = dispatch_time(0, 1000000000 * objc_msgSend(v6, "sr_timeout"));
        if (dispatch_semaphore_wait(v7, v13))
        {
          uint64_t v14 = &_os_log_internal;
          id v15 = &_os_log_internal;
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
            smb_rq_simple_timed_cold_1(objc_msgSend(v6, "sr_command"), buf, objc_msgSend(v6, "sr_timeout"));
          }

          *((_DWORD *)v24 + 6) = 60;
        }
      }
      else
      {
        dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
      }
    }
    uint64_t v12 = *((unsigned int *)v24 + 6);
  }

  _Block_object_dispose(&v23, 8);
  return v12;
}

void sub_23F86220C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t smb_rq_simple_block(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  uint64_t v8 = [v5 sock];

  if (v8)
  {
    objc_msgSend(v6, "setSr_callback:", v7);
    objc_msgSend(v6, "setSr_timeout:", 0);
    BOOL v9 = [v5 sock];
    uint64_t v10 = [v9 sendRequest:v6];

    if (v10 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      smb_rq_simple_block_cold_1();
    }
  }
  else
  {
    uint64_t v10 = 57;
  }

  return v10;
}

intptr_t __smb_rq_simple_timed_block_invoke(uint64_t a1, int a2)
{
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t smb2_rq_align8(void *a1)
{
  uint64_t result = objc_msgSend(a1, "smb_rq_getrequest");
  uint64_t v2 = *(void *)(result + 32) & 7;
  if (v2)
  {
    return mb_put_mem(result, 0, 8 - v2, 3);
  }
  return result;
}

uint64_t smb2_rq_alloc(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int *a4, void *a5, void *a6)
{
  uint64_t v85 = *MEMORY[0x263EF8340];
  id v11 = a5;
  uint64_t v12 = [v11 getSessionPtr];
  dispatch_time_t v13 = objc_alloc_init(SMB_rq);
  uint64_t v14 = v13;
  if (!v13)
  {
    BOOL v19 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v19) {
      smb2_rq_alloc_cold_1(v19, v20, v21, v22, v23, v24, v25, v26);
    }
    uint64_t v27 = 12;
    goto LABEL_66;
  }
  [(SMB_rq *)v13 setSr_command:a1];
  [(SMB_rq *)v14 setSr_creditcharge:1];
  [(SMB_rq *)v14 setSr_creditsrequested:1];
  [(SMB_rq *)v14 setSr_rqtreeid:0];
  [(SMB_rq *)v14 setSr_rqsessionid:*(void *)(v12 + 568)];
  [(SMB_rq *)v14 setWriteData:0];
  [(SMB_rq *)v14 setWriteLen:0];
  [(SMB_rq *)v14 setSr_pd:v11];
  [(SMB_rq *)v14 smb_rq_set_extflag:1];
  [(SMB_rq *)v14 setSr_sessionp:v12];
  [(SMB_rq *)v14 setOnEncryptedShare:a3];
  id v15 = v14;
  v72.__darwin_time_t tv_sec = 0;
  v72.tv_nsec = 0;
  v71.__darwin_time_t tv_sec = 0;
  *(void *)&v71.__darwin_suseconds_t tv_usec = 0;
  uint64_t v16 = [(SMB_rq *)v15 sr_sessionp];
  uint64_t v17 = (pthread_mutex_t *)(v16 + 608);
  pthread_mutex_lock((pthread_mutex_t *)(v16 + 608));
  int v18 = [(SMB_rq *)v15 sr_command];
  if (v18 <= 1)
  {
    if (v18)
    {
      if (v18 != 1) {
        goto LABEL_13;
      }
      [(SMB_rq *)v15 setSr_creditsrequested:256];
    }
    else
    {
      [(SMB_rq *)v15 setSr_creditcharge:0];
      [(SMB_rq *)v15 setSr_creditsrequested:0];
      atomic_store(0, (unsigned int *)(v16 + 680));
      atomic_store(0, (unsigned int *)(v16 + 684));
      atomic_store(0, (unsigned int *)(v16 + 688));
    }
  }
  else if ((v18 - 2) >= 2)
  {
    if (v18 == 18)
    {
LABEL_17:
      uint64_t v69 = a6;
      id v70 = v11;
LABEL_18:
      while (1)
      {
        unint64_t v28 = atomic_load((unsigned int *)(v16 + 680));
        if ((int)v28 >= 1)
        {
          if (!*(_DWORD *)(v16 + 744)) {
            break;
          }
          unint64_t v29 = atomic_load((unint64_t *)(v16 + 672));
          unint64_t v30 = *(void *)(v16 + 752);
          unint64_t v31 = atomic_load((unint64_t *)(v16 + 672));
          unint64_t v32 = v29 <= v30 ? v31 + ~v30 : v31 - *(void *)(v16 + 752);
          if (v32 <= v28) {
            break;
          }
        }
        if ([(SMB_rq *)v15 sr_command] == 13
          || ([(SMB_rq *)v15 sr_extflags] & 0x80000000) != 0)
        {
          uint64_t v27 = 55;
          id v11 = v70;
          goto LABEL_40;
        }
        if (piston_log_level && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
        {
          unsigned int v38 = atomic_load((unsigned int *)(v16 + 688));
          unint64_t v39 = atomic_load((unint64_t *)(v16 + 672));
          uint64_t v40 = *(void *)(v16 + 752);
          unsigned int v41 = atomic_load((unsigned int *)(v16 + 692));
          *(_DWORD *)buf = 136316418;
          uint64_t v74 = "smb2_rq_credit_decrement";
          __int16 v75 = 1024;
          unsigned int v76 = v28;
          __int16 v77 = 1024;
          unsigned int v78 = v38;
          __int16 v79 = 2048;
          unint64_t v80 = v39;
          __int16 v81 = 2048;
          uint64_t v82 = v40;
          __int16 v83 = 1024;
          unsigned int v84 = v41;
          _os_log_error_impl(&dword_23F849000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s: Wait for credits curr %d max %d curr ID %lld pending ID %lld session_credits_wait %d\n", buf, 0x32u);
        }
        int v33 = 60;
        while (1)
        {
          atomic_fetch_add((atomic_uint *volatile)(v16 + 692), 1u);
          timespec v72 = (timespec)xmmword_23F8827F0;
          gettimeofday(&v71, 0);
          v72.tv_sec += v71.tv_sec;
          v72.tv_nsec += 1000 * v71.tv_usec;
          int v34 = pthread_cond_timedwait((pthread_cond_t *)(v16 + 696), v17, &v72);
          if (v34 != 60 && v34 != 35) {
            break;
          }
          if (atomic_load((unsigned int *)(v16 + 692))) {
            atomic_fetch_add((atomic_uint *volatile)(v16 + 692), 0xFFFFFFFF);
          }
          int v36 = atomic_load((unsigned int *)(v16 + 680));
          if (v36 > 0) {
            break;
          }
          if (!--v33)
          {
            unsigned int v37 = atomic_load((unsigned int *)(v16 + 680));
            if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
            {
              unsigned int v42 = atomic_load((unsigned int *)(v16 + 688));
              unint64_t v43 = atomic_load((unint64_t *)(v16 + 672));
              uint64_t v44 = *(void *)(v16 + 752);
              unsigned int v45 = atomic_load((unsigned int *)(v16 + 692));
              *(_DWORD *)buf = 136316418;
              uint64_t v74 = "smb2_rq_credit_decrement";
              __int16 v75 = 1024;
              unsigned int v76 = v37;
              __int16 v77 = 1024;
              unsigned int v78 = v42;
              __int16 v79 = 2048;
              unint64_t v80 = v43;
              __int16 v81 = 2048;
              uint64_t v82 = v44;
              __int16 v83 = 1024;
              unsigned int v84 = v45;
              _os_log_error_impl(&dword_23F849000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s: Timed out waiting for credits curr %d max %d curr ID %lld pending ID %lld session_credits_wait %d\n", buf, 0x32u);
            }
            pthread_mutex_unlock(v17);
            pthread_mutex_lock(v17);
            goto LABEL_18;
          }
        }
      }
      a2 = a2;
      if (a4)
      {
        unsigned int v46 = *a4;
        uint64_t v47 = v15;
        uint64_t v48 = [(SMB_rq *)v47 sr_sessionp];
        if (v46 > 0x10000)
        {
          int v49 = atomic_load((unsigned int *)(v48 + 680));
          if (v49 >= 11)
          {
            int v50 = (__int16)(((v46 - 1) >> 16) + 1) + 10;
            int v51 = (v49 - 10) << 16;
            BOOL v52 = v50 <= v49;
            if (v50 <= v49) {
              unsigned __int16 v53 = ((v46 - 1) >> 16) + 1;
            }
            else {
              unsigned __int16 v53 = v49 - 10;
            }
            if (!v52) {
              unsigned int v46 = v51;
            }
            [(SMB_rq *)v47 setSr_creditcharge:v53];
          }
          else
          {
            unsigned int v46 = 0x10000;
          }
        }

        *a4 = v46;
      }
      atomic_fetch_add((atomic_uint *volatile)(v16 + 680), -(__int16)[(SMB_rq *)v15 sr_creditcharge]);
      int v54 = atomic_load((unsigned int *)(v16 + 680));
      id v11 = v70;
      a6 = v69;
      if (v54 <= 65534)
      {
        [(SMB_rq *)v15 setSr_creditsrequested:256];
        if (v54 < 0 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          smb2_rq_alloc_cold_4();
        }
      }
      goto LABEL_56;
    }
LABEL_13:
    if ((*(unsigned char *)(v16 + 553) & 0x10) == 0)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        smb2_rq_alloc_cold_2(v15);
      }
      uint64_t v27 = 73;
LABEL_40:
      pthread_mutex_unlock(v17);

      [(SMB_rq *)v15 setSr_creditcharge:0];
      goto LABEL_61;
    }
    goto LABEL_17;
  }
LABEL_56:
  pthread_mutex_unlock(v17);

  unsigned int v55 = [(SMB_rq *)v15 sr_command];
  if (v55 > 0xD || ((1 << v55) & 0x300F) == 0) {
    [(SMB_rq *)v15 setSr_rqtreeid:a2];
  }
  int v56 = [(SMB_rq *)v15 smb_rq_getrequest];
  __int16 v57 = [(SMB_rq *)v15 smb_rq_getreply];
  mb_done(v56);
  md_done(v57);
  double v59 = mb_init((uint64_t)v56);
  if (v58)
  {
    uint64_t v27 = v58;
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      smb2_rq_alloc_cold_3();
    }
LABEL_61:
    [(SMB_rq *)v15 smb_rq_done];
    goto LABEL_66;
  }
  char v60 = [(SMB_rq *)v15 sr_flags];
  mb_put_mem((uint64_t)v56, "\xFESMB", 4uLL, 0);
  mb_put_uint16le((uint64_t)v56, 64);
  [(SMB_rq *)v15 setSr_creditchargep:mb_reserve((uint64_t)v56, 2uLL)];
  unsigned __int16 v61 = [(SMB_rq *)v15 sr_creditcharge];
  *[(SMB_rq *)v15 sr_creditchargep] = v61;
  mb_put_uint32le((uint64_t)v56, 0);
  mb_put_uint16le((uint64_t)v56, [(SMB_rq *)v15 sr_command]);
  [(SMB_rq *)v15 setSr_creditreqp:mb_reserve((uint64_t)v56, 2uLL)];
  unsigned __int16 v62 = [(SMB_rq *)v15 sr_creditsrequested];
  *[(SMB_rq *)v15 sr_creditreqp] = v62;
  [(SMB_rq *)v15 setSr_flagsp:mb_reserve((uint64_t)v56, 4uLL)];
  unsigned int v63 = [(SMB_rq *)v15 sr_rqflags];
  if ((v60 & 2) != 0)
  {
    [(SMB_rq *)v15 setSr_rqflags:v63 | 2];
    unsigned int v65 = [(SMB_rq *)v15 sr_rqflags];
    *[(SMB_rq *)v15 sr_flagsp] = v65;
    [(SMB_rq *)v15 setSr_nextcmdp:mb_reserve((uint64_t)v56, 4uLL)];
    unsigned int v66 = [(SMB_rq *)v15 sr_nextcmd];
    *[(SMB_rq *)v15 sr_nextcmdp] = v66;
    [(SMB_rq *)v15 setSr_messageidp:mb_reserve((uint64_t)v56, 8uLL)];
    *[(SMB_rq *)v15 sr_messageidp] = 0;
    mb_put_uint64le((uint64_t)v56, 0);
  }
  else
  {
    *[(SMB_rq *)v15 sr_flagsp] = v63;
    [(SMB_rq *)v15 setSr_nextcmdp:mb_reserve((uint64_t)v56, 4uLL)];
    unsigned int v64 = [(SMB_rq *)v15 sr_nextcmd];
    *[(SMB_rq *)v15 sr_nextcmdp] = v64;
    [(SMB_rq *)v15 setSr_messageidp:mb_reserve((uint64_t)v56, 8uLL)];
    *[(SMB_rq *)v15 sr_messageidp] = 0;
    mb_put_uint32le((uint64_t)v56, 65279);
    mb_put_uint32le((uint64_t)v56, [(SMB_rq *)v15 sr_rqtreeid]);
  }
  mb_put_uint64le((uint64_t)v56, [(SMB_rq *)v15 sr_rqsessionid]);
  [(SMB_rq *)v15 setSr_rqsigp:mb_reserve((uint64_t)v56, 0x10uLL)];
  uint64_t v67 = [(SMB_rq *)v15 sr_rqsigp];
  *(void *)uint64_t v67 = 0;
  *((void *)v67 + 1) = 0;
  uint64_t v27 = 0;
  *a6 = v15;
LABEL_66:

  return v27;
}

void smb2_rq_bstart(void *a1, uint64_t a2)
{
  id v3 = a1;
  uint64_t v4 = objc_msgSend(v3, "smb_rq_getrequest");
  objc_msgSend(v3, "setSr_bcount:", a2);

  *(void *)(v4 + 24) = 0;
}

void smb2_rq_bstart32(void *a1, uint64_t a2)
{
  id v3 = a1;
  uint64_t v4 = objc_msgSend(v3, "smb_rq_getrequest");
  objc_msgSend(v3, "setSr_lcount:", a2);

  *(void *)(v4 + 24) = 0;
}

uint64_t smb2_rq_credit_start(uint64_t a1, unsigned int a2)
{
  uint64_t v4 = (pthread_mutex_t *)(a1 + 608);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 608));
  id v5 = (atomic_uint *)(a1 + 680);
  if (a2)
  {
    atomic_fetch_add(v5, a2);
  }
  else
  {
    unsigned int v6 = atomic_load((unsigned int *)(a1 + 684));
    atomic_fetch_add(v5, v6);
  }
  unsigned int v7 = atomic_load((unsigned int *)(a1 + 680));
  atomic_store(v7, (unsigned int *)(a1 + 688));
  *(_DWORD *)(a1 + 744) = 0;
  *(void *)(a1 + 752) = 0;
  if (atomic_load((unsigned int *)(a1 + 692)))
  {
    atomic_fetch_add((atomic_uint *volatile)(a1 + 692), 0xFFFFFFFF);
    pthread_cond_signal((pthread_cond_t *)(a1 + 696));
  }
  return pthread_mutex_unlock(v4);
}

uint64_t smb2_rq_message_id_increment(void *a1)
{
  id v1 = a1;
  uint64_t v2 = objc_msgSend(v1, "sr_sessionp");
  if (!v1)
  {
    BOOL v11 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v11) {
      smb2_rq_message_id_increment_cold_1(v11, v12, v13, v14, v15, v16, v17, v18);
    }
    goto LABEL_13;
  }
  uint64_t v3 = v2;
  if (!v2)
  {
    BOOL v19 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v19) {
      smb2_rq_message_id_increment_cold_2(v19, v20, v21, v22, v23, v24, v25, v26);
    }
LABEL_13:
    uint64_t v27 = 12;
    goto LABEL_16;
  }
  uint64_t v4 = (pthread_mutex_t *)(v2 + 608);
  pthread_mutex_lock((pthread_mutex_t *)(v2 + 608));
  if (objc_msgSend(v1, "sr_command"))
  {
    __int16 v5 = objc_msgSend(v1, "sr_flags");
    atomic_fetch_add((atomic_ullong *volatile)(v3 + 672), objc_msgSend(v1, "sr_creditcharge"));
    objc_msgSend(v1, "setSr_messageid:");
    uint64_t v6 = objc_msgSend(v1, "sr_messageid");
    *objc_msgSend(v1, "sr_messageidp") = v6;
    if ((v5 & 0x100) != 0)
    {
      uint64_t v7 = objc_msgSend(v1, "sr_next_rqp");
      if (v7)
      {
        uint64_t v8 = (void *)v7;
        do
        {
          atomic_fetch_add((atomic_ullong *volatile)(v3 + 672), objc_msgSend(v8, "sr_creditcharge"));
          objc_msgSend(v8, "setSr_messageid:");
          uint64_t v9 = objc_msgSend(v8, "sr_messageid");
          *objc_msgSend(v8, "sr_messageidp") = v9;
          uint64_t v10 = objc_msgSend(v8, "sr_next_rqp");

          uint64_t v8 = (void *)v10;
        }
        while (v10);
      }
    }
  }
  else
  {
    atomic_fetch_add((atomic_ullong *volatile)(v3 + 672), 1uLL);
    objc_msgSend(v1, "setSr_messageid:");
    uint64_t v28 = objc_msgSend(v1, "sr_messageid");
    *objc_msgSend(v1, "sr_messageidp") = v28;
  }
  pthread_mutex_unlock(v4);
  uint64_t v27 = 0;
LABEL_16:

  return v27;
}

uint64_t smb2_rq_next_command(void *a1, void *a2, void *a3)
{
  uint64_t v5 = *a2 + objc_msgSend(a1, "sr_rspnextcmd");
  *a2 = v5;
  uint64_t v6 = v5 - a3[3];
  if (v6 < 1) {
    return 0;
  }
  uint64_t mem = md_get_mem(a3, 0, v6, 0);
  if (mem && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    smb2_rq_next_command_cold_1();
  }
  return mem;
}

uint64_t smb2_rq_parse_header(void *a1, long long **a2)
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v3 = a1;
  int v37 = 0;
  __int16 v36 = 0;
  __int16 v35 = 0;
  __int16 v34 = 0;
  uint64_t v32 = 0;
  uint64_t v33 = 0;
  long long v30 = 0u;
  long long v31 = 0u;
  uint64_t v4 = objc_msgSend(v3, "sr_sessionp");
  unsigned int v5 = objc_msgSend(v3, "sr_command");
  unsigned int v29 = 0;
  unsigned __int16 v28 = 0;
  uint64_t v27 = 0;
  if (v3)
  {
    unsigned int v6 = v5;
    uint64_t v7 = *a2;
    long long v8 = (*a2)[1];
    long long v30 = **a2;
    long long v31 = v8;
    unsigned int uint32le = md_get_uint32le(v7, &v37);
    if (uint32le) {
      goto LABEL_19;
    }
    unsigned int uint32le = md_get_uint16le(*a2, &v36);
    if (uint32le) {
      goto LABEL_19;
    }
    if (v36 == 64)
    {
      unsigned int uint32le = md_get_uint16le(*a2, &v35);
      if (uint32le) {
        goto LABEL_19;
      }
      unsigned int uint32le = md_get_uint32le(*a2, &v29);
      if (uint32le) {
        goto LABEL_19;
      }
      objc_msgSend(v3, "setSr_ntstatus:", v29);
      unsigned int uint32le = md_get_uint16le(*a2, &v34);
      if (uint32le) {
        goto LABEL_19;
      }
      unsigned int uint32le = md_get_uint16le(*a2, &v28);
      if (uint32le) {
        goto LABEL_19;
      }
      objc_msgSend(v3, "setSr_rspcreditsgranted:", v28);
      smb2_rq_credit_increment(v3);
      unsigned int uint32le = md_get_uint32le(*a2, &v29);
      if (uint32le) {
        goto LABEL_19;
      }
      objc_msgSend(v3, "setSr_rspflags:", v29);
      unsigned int uint32le = md_get_uint32le(*a2, &v29);
      if (uint32le) {
        goto LABEL_19;
      }
      objc_msgSend(v3, "setSr_rspnextcmd:", v29);
      unsigned int uint32le = md_get_uint64le(*a2, &v33);
      if (uint32le) {
        goto LABEL_19;
      }
      char v10 = objc_msgSend(v3, "sr_rspflags");
      BOOL v11 = *a2;
      if ((v10 & 2) == 0)
      {
        unsigned int uint32le = md_get_uint32le(v11, &v29);
        if (uint32le) {
          goto LABEL_19;
        }
        objc_msgSend(v3, "setSr_rsppid:", v29);
        unsigned int uint32le = md_get_uint32le(*a2, &v29);
        if (uint32le) {
          goto LABEL_19;
        }
        objc_msgSend(v3, "setSr_rsptreeid:", v29);
        goto LABEL_31;
      }
      unsigned int uint32le = md_get_uint64le(v11, &v32);
      if (uint32le) {
        goto LABEL_19;
      }
      uint64_t v24 = v32;
      if (v24 == objc_msgSend(v3, "sr_rspasyncid"))
      {
LABEL_31:
        unsigned int uint32le = md_get_uint64le(*a2, &v27);
        if (uint32le) {
          goto LABEL_19;
        }
        objc_msgSend(v3, "setSr_rspsessionid:", v27);
        unsigned int uint32le = md_get_mem(*a2, __dst, 16, 0);
        if (uint32le) {
          goto LABEL_19;
        }
        uint64_t v25 = *(void *)(v4 + 552);
        if ((v25 & 0x28800) != 0)
        {
          if ((*(_WORD *)(v4 + 68) & 4) == 0)
          {
            if (v6 <= 3 && v6 != 2) {
              goto LABEL_42;
            }
            if (!objc_msgSend(v3, "onEncryptedShare", v27))
            {
              uint64_t v25 = *(void *)(v4 + 552);
              goto LABEL_42;
            }
LABEL_45:
            unsigned int uint32le = piston_ntstatus_to_errno(objc_msgSend(v3, "sr_ntstatus", v27));
            int v26 = objc_msgSend(v3, "sr_ntstatus");
            if (v26 == -1073740964)
            {
              if (piston_log_level && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
                smb2_rq_parse_header_cold_3(v3);
              }
            }
            else if (v26 == -1073741670 {
                   && piston_log_level
            }
                   && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
            {
              smb2_rq_parse_header_cold_2(v3);
            }
            goto LABEL_19;
          }
          if (v6) {
            goto LABEL_45;
          }
        }
LABEL_42:
        if ((v25 & 8) != 0 || (objc_msgSend(v3, "sr_flags") & 0x400) != 0)
        {
          unsigned int uint32le = smb2_rq_verify(v3, (uint64_t)&v30, __dst);
          if (uint32le) {
            goto LABEL_19;
          }
        }
        goto LABEL_45;
      }
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        smb2_rq_parse_header_cold_4(&v33, &v32, v3);
      }
    }
    else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      smb2_rq_parse_header_cold_5();
    }
    unsigned int uint32le = 72;
    goto LABEL_19;
  }
  BOOL v12 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
  if (v12) {
    smb2_rq_parse_header_cold_1(v12, v13, v14, v15, v16, v17, v18, v19);
  }
  unsigned int uint32le = 12;
LABEL_19:
  int v20 = objc_msgSend(v3, "sr_command", v27);
  if (uint32le == 16 && v20 == 5) {
    uint64_t v22 = 35;
  }
  else {
    uint64_t v22 = uint32le;
  }
  [v3 setReplyError:v22];

  return v22;
}

void piston_smb3_derive_keys(void *a1)
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v1 = a1;
  uint64_t v2 = v1;
  if (v1)
  {
    uint64_t v3 = [v1 getSessionPtr];
    if (v3)
    {
      uint64_t v4 = v3;
      *(_DWORD *)(v3 + 260) = 0;
      *(_DWORD *)(v3 + 488) = 0;
      *(_DWORD *)(v3 + 528) = 0;
      memset(&ctx, 0, sizeof(ctx));
      uint64_t __buf = 0;
      uint64_t v5 = v3 + 224;
      CCHmacInit(&ctx, 1u, *(const void **)(v3 + 216), *(unsigned int *)(v3 + 224));
      arc4random_buf(&__buf, 8uLL);
      CCHmacUpdate(&ctx, &__buf, 8uLL);
      CCHmacFinal(&ctx, &macOut);
      *(_OWORD *)(v5 + 312) = macOut;
      if (*(void *)(v5 - 8))
      {
        if (*(_DWORD *)v5 > 0xFu)
        {
          if ((*(unsigned char *)(v4 + 554) & 2) != 0)
          {
            *(_OWORD *)ctx.CCHmacContext ctx = *(_OWORD *)"SMBSigningKey";
          }
          else
          {
            long long macOut = *(_OWORD *)"SmbSign";
            *(_OWORD *)ctx.CCHmacContext ctx = *(_OWORD *)"SMB2AESCMAC";
          }
          if (piston_smb3_kdf_hmac_sha256())
          {
            if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
              piston_smb3_derive_keys_cold_7();
            }
          }
          else
          {
            *(_DWORD *)(v4 + 260) = 16;
            *(void *)(v4 + 456) = 0;
            *(void *)(v4 + 464) = 0;
            *(_DWORD *)(v4 + 488) = 0;
            if ((*(unsigned char *)(v4 + 554) & 2) != 0)
            {
              strcpy((char *)&ctx, "SMBC2SCipherKey");
              if (*(unsigned __int16 *)(v4 + 492) - 3 > 1) {
                int v30 = 16;
              }
              else {
                int v30 = 32;
              }
            }
            else
            {
              long long macOut = *(_OWORD *)"ServerIn ";
              *(_OWORD *)ctx.CCHmacContext ctx = *(_OWORD *)"SMB2AESCCM";
              int v30 = 16;
            }
            if (piston_smb3_kdf_hmac_sha256())
            {
              if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
                piston_smb3_derive_keys_cold_6();
              }
            }
            else
            {
              *(_DWORD *)(v4 + 488) = v30;
              if ((*(unsigned char *)(v4 + 554) & 2) != 0)
              {
                strcpy((char *)&ctx, "SMBS2CCipherKey");
                if (*(unsigned __int16 *)(v4 + 492) - 3 > 1) {
                  int v31 = 16;
                }
                else {
                  int v31 = 32;
                }
              }
              else
              {
                long long macOut = *(_OWORD *)"ServerOut";
                *(_OWORD *)ctx.CCHmacContext ctx = *(_OWORD *)"SMB2AESCCM";
                int v31 = 16;
              }
              if (piston_smb3_kdf_hmac_sha256())
              {
                if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
                  piston_smb3_derive_keys_cold_5();
                }
              }
              else
              {
                *(_DWORD *)(v4 + 528) = v31;
              }
            }
          }
        }
        else if (piston_log_level && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
        {
          piston_smb3_derive_keys_cold_4();
        }
      }
      else if (piston_log_level)
      {
        BOOL v22 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
        if (v22) {
          piston_smb3_derive_keys_cold_3(v22, v23, v24, v25, v26, v27, v28, v29);
        }
      }
    }
    else
    {
      BOOL v14 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
      if (v14) {
        piston_smb3_derive_keys_cold_2(v14, v15, v16, v17, v18, v19, v20, v21);
      }
    }
  }
  else
  {
    BOOL v6 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v6) {
      piston_smb3_derive_keys_cold_1(v6, v7, v8, v9, v10, v11, v12, v13);
    }
  }
}

uint64_t piston_smb3_kdf_hmac_sha256()
{
  uint64_t CtrHmac = CCKDFParametersCreateCtrHmac();
  if (!CtrHmac)
  {
    uint64_t CtrHmac = CCDeriveKey();
    CCKDFParametersDestroy();
  }
  return CtrHmac;
}

double smb_reset_sig(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 216);
  if (v2)
  {
    free(v2);
    *(void *)(a1 + 216) = 0;
  }
  *(_DWORD *)(a1 + 224) = 0;
  uint64_t v3 = *(void **)(a1 + 232);
  if (v3)
  {
    free(v3);
    *(void *)(a1 + 232) = 0;
  }
  *(_DWORD *)(a1 + 240) = 0;
  *(void *)(a1 + 252) = 0;
  *(void *)(a1 + 244) = 0;
  *(_DWORD *)(a1 + 260) = 0;
  double result = 0.0;
  *(_OWORD *)(a1 + 456) = 0u;
  *(_OWORD *)(a1 + 472) = 0u;
  *(_DWORD *)(a1 + 488) = 0;
  return result;
}

uint64_t smb2_rq_sign(void *a1)
{
  uint64_t v66 = *MEMORY[0x263EF8340];
  id v1 = a1;
  uint64_t v2 = objc_msgSend(v1, "sr_sessionp");
  unsigned int v3 = objc_msgSend(v1, "sr_command");
  if (!v1)
  {
    if (piston_log_level)
    {
      BOOL v5 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
      if (v5) {
        smb2_rq_sign_cold_1(v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
    goto LABEL_44;
  }
  if (!v2)
  {
    BOOL v13 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v13) {
      smb2_rq_sign_cold_2(v13, v14, v15, v16, v17, v18, v19, v20);
    }
    goto LABEL_44;
  }
  if (v3 < 2)
  {
    uint64_t v4 = 0;
    goto LABEL_45;
  }
  if (!*(void *)(v2 + 216))
  {
    BOOL v48 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v48) {
      smb2_rq_sign_cold_3(v48, v49, v50, v51, v52, v53, v54, v55);
    }
LABEL_44:
    uint64_t v4 = 22;
    goto LABEL_45;
  }
  uint64_t v21 = *(void *)(v2 + 552) & 0x28800;
  id v57 = v1;
  id v22 = v1;
  uint64_t v23 = &piston_log_level;
  uint64_t v24 = &_os_log_internal;
  uint64_t v58 = v21;
  do
  {
    id v25 = v22;
    uint64_t v26 = v25;
    if (v21)
    {
      uint64_t v27 = objc_msgSend(v25, "sr_sessionp");
      uint64_t v28 = objc_msgSend(v26, "sr_rqsigp");
      if (v28)
      {
        uint32_t v29 = *(_DWORD *)(v27 + 260);
        if (v29 > 0xF)
        {
          uint64_t v39 = v28;
          *uint64_t v28 = 0;
          v28[1] = 0;
          uint64_t v40 = (_DWORD *)objc_msgSend(v26, "sr_flagsp");
          *v40 |= 8u;
          unsigned int v41 = (uint64_t *)objc_msgSend(v26, "smb_rq_getrequest");
          uint64_t v42 = *v41;
          if (*v41)
          {
            unint64_t v43 = 0;
            do
            {
              v43 += mbuf_len(v42);
              uint64_t v42 = mbuf_next(v42);
            }
            while (v42);
          }
          else
          {
            unint64_t v43 = 0;
          }
          uint64_t v44 = v23;
          if (objc_msgSend(v26, "sr_command") == 9)
          {
            int v45 = [v26 writeLen];
            id v46 = [v26 writeData];
            uint64_t v47 = [v46 bytes];
          }
          else
          {
            uint64_t v47 = 0;
            int v45 = 0;
          }
          smb3_get_signature(v27, v26, v41, 0, v43, v47, v45, (objc_msgSend(v26, "sr_flags") >> 8) & 1, v39);
          uint64_t v23 = v44;
          uint64_t v21 = v58;
        }
        else if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          buf.ctx[0] = 136315394;
          *(void *)&buf.ctx[1] = "smb3_sign";
          LOWORD(buf.ctx[3]) = 1024;
          *(uint32_t *)((char *)&buf.ctx[3] + 2) = v29;
          _os_log_error_impl(&dword_23F849000, v24, OS_LOG_TYPE_ERROR, "%s: smb3 keylen %u\n", (uint8_t *)&buf, 0x12u);
        }
      }
      else if (*v23 && os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        smb2_rq_sign_cold_5(v59, &v60);
      }
    }
    else
    {
      memset(&buf, 0, sizeof(buf));
      uint64_t v30 = objc_msgSend(v25, "sr_sessionp");
      int v31 = objc_msgSend(v26, "sr_rqsigp");
      uint64_t data = 0;
      if (v31)
      {
        uint64_t v32 = v31;
        memset(macOut, 0, sizeof(macOut));
        *int v31 = 0;
        v31[1] = 0;
        uint64_t v33 = (_DWORD *)objc_msgSend(v26, "sr_flagsp");
        *v33 |= 8u;
        __int16 v34 = (uint64_t *)objc_msgSend(v26, "smb_rq_getrequest");
        CCHmacInit(&buf, 2u, *(const void **)(v30 + 216), *(unsigned int *)(v30 + 224));
        for (uint64_t i = *v34; i; uint64_t i = mbuf_next(i))
        {
          __int16 v36 = (const void *)mbuf_data(i);
          size_t v37 = mbuf_len(i);
          CCHmacUpdate(&buf, v36, v37);
        }
        if (objc_msgSend(v26, "sr_command") == 9)
        {
          id v38 = [v26 writeData];
          CCHmacUpdate(&buf, (const void *)[v38 bytes], objc_msgSend(v26, "writeLen"));

          if ((objc_msgSend(v26, "sr_flags") & 0x100) != 0 && (objc_msgSend(v26, "writeLen") & 7) != 0) {
            CCHmacUpdate(&buf, &data, 8 - ([v26 writeLen] & 7));
          }
        }
        CCHmacFinal(&buf, macOut);
        *uint64_t v32 = macOut[0];
      }
      else if (*v23 && os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        smb2_rq_sign_cold_4(v61, &v62);
      }
    }

    objc_msgSend(v26, "sr_next_rqp");
    id v22 = (id)objc_claimAutoreleasedReturnValue();
  }
  while (v22);
  uint64_t v4 = 0;
  id v1 = v57;
LABEL_45:

  return v4;
}

uint64_t smb2_rq_verify(void *a1, uint64_t a2, const void *a3)
{
  uint64_t v137 = *MEMORY[0x263EF8340];
  id v5 = a1;
  uint64_t v6 = objc_msgSend(v5, "sr_sessionp");
  unsigned int v7 = objc_msgSend(v5, "sr_command");
  if (v5)
  {
    if (!v6)
    {
      BOOL v34 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
      if (v34) {
        smb2_rq_verify_cold_2(v34, v35, v36, v37, v38, v39, v40, v41);
      }
      goto LABEL_24;
    }
    unsigned int v8 = v7;
    LODWORD(v9) = objc_msgSend(v5, "sr_rspnextcmd");
    if ((*(unsigned char *)(v6 + 552) & 8) == 0 && (objc_msgSend(v5, "sr_flags") & 0x400) == 0)
    {
      if (piston_log_level)
      {
        BOOL v10 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
        if (v10) {
          smb2_rq_verify_cold_3(v10, v11, v12, v13, v14, v15, v16, v17);
        }
      }
      goto LABEL_24;
    }
    uint64_t v26 = 0;
    if (!*(void *)(v6 + 216) || v8 == 18 || v8 < 2) {
      goto LABEL_25;
    }
    uint64_t v27 = *(void *)(v6 + 552);
    if ((v27 & 0x800000) != 0)
    {
LABEL_24:
      uint64_t v26 = 0;
      goto LABEL_25;
    }
    uint64_t v28 = v27 & 0x28800;
    id v29 = v5;
    uint64_t v30 = v29;
    if (v28)
    {
      uint64_t v31 = objc_msgSend(v29, "sr_sessionp");
      if (v31)
      {
        uint64_t v32 = v31;
        if (*(_DWORD *)(v31 + 260) > 0xFu)
        {
          long long v133 = v30;
          uint64_t v58 = *(void *)(a2 + 8);
          uint64_t v59 = mbuf_data(v58);
          uint64_t v60 = mbuf_len(v58);
          uint64_t v61 = *(void *)(a2 + 8);
          if (v61)
          {
            unint64_t v62 = v60 + v59 - *(void *)(a2 + 16);
            unint64_t v63 = 48;
            while (1)
            {
              if (v61 != *(void *)(a2 + 8)) {
                unint64_t v62 = mbuf_len(v61);
              }
              if (v63 < v62) {
                break;
              }
              uint64_t v61 = mbuf_next(v61);
              v63 -= v62;
              if (!v61) {
                goto LABEL_39;
              }
            }
            unint64_t v80 = 16;
            while (1)
            {
              uint64_t v81 = v61 == *(void *)(a2 + 8) ? *(void *)(a2 + 16) : mbuf_data(v61);
              uint64_t v82 = (void *)(v81 + v63);
              size_t v83 = v80 >= v62 - v63 ? v62 - v63 : v80;
              bzero(v82, v83);
              v80 -= v83;
              uint64_t v84 = mbuf_next(v61);
              if (!v84) {
                break;
              }
              uint64_t v61 = v84;
              unint64_t v62 = mbuf_len(v84);
              unint64_t v63 = 0;
              if (!v80) {
                goto LABEL_105;
              }
            }
            if (!v80)
            {
LABEL_105:
              if (v9)
              {
                unint64_t v9 = v9;
                uint64_t v30 = v133;
              }
              else
              {
                uint64_t v105 = *(void *)(a2 + 8);
                uint64_t v106 = mbuf_data(v105);
                unint64_t v9 = mbuf_len(v105) + v106 - *(void *)(a2 + 16);
                uint64_t v107 = mbuf_next(v105);
                uint64_t v30 = v133;
                if (v107)
                {
                  uint64_t v108 = v107;
                  do
                  {
                    v9 += mbuf_len(v108);
                    uint64_t v108 = mbuf_next(v108);
                  }
                  while (v108);
                }
              }
              smb3_get_signature(v32, v30, 0, a2, v9, 0, 0, 0, &ctx);
              int v33 = timingsafe_bcmp(a3, &ctx, 0x10uLL);
              if (v33
                && piston_log_level
                && (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR) || !smb2_rq_verify_cold_19(v30))
                && (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR) || !smb2_rq_verify_cold_18())
                && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
              {
                smb2_rq_verify_cold_17();
              }
              goto LABEL_46;
            }
            BOOL v97 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
            if (v97) {
              smb2_rq_verify_cold_20(v97, v98, v99, v100, v101, v102, v103, v104);
            }
          }
          else
          {
LABEL_39:
            BOOL v64 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
            if (v64) {
              smb2_rq_verify_cold_16(v64, v65, v66, v67, v68, v69, v70, v71);
            }
          }
          goto LABEL_41;
        }
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          smb2_rq_verify_cold_15();
        }
        int v33 = 80;
        goto LABEL_46;
      }
      BOOL v50 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
      if (v50) {
        smb2_rq_verify_cold_14(v50, v51, v52, v53, v54, v55, v56, v57);
      }
    }
    else
    {
      memset(&ctx, 0, sizeof(ctx));
      uint64_t v43 = objc_msgSend(v29, "sr_sessionp");
      if (v43)
      {
        uint64_t v44 = v43;
        long long v133 = v30;
        uint64_t v45 = *(void *)(a2 + 8);
        uint64_t v46 = mbuf_data(v45);
        unint64_t v47 = mbuf_len(v45) + v46 - *(void *)(a2 + 16);
        unint64_t v48 = mbuf_len(v45);
        unint64_t v49 = mbuf_len(v45) - v47;
        if (v49 > v48)
        {
          if (piston_log_level && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
            smb2_rq_verify_cold_6();
          }
          goto LABEL_41;
        }
        if (v9)
        {
          unint64_t v9 = v9;
        }
        else
        {
          uint64_t v85 = mbuf_next(v45);
          unint64_t v9 = v47;
          if (v85)
          {
            uint64_t v86 = v85;
            unint64_t v9 = v47;
            do
            {
              v9 += mbuf_len(v86);
              uint64_t v86 = mbuf_next(v86);
            }
            while (v86);
          }
        }
        if (v9 <= 0x3F)
        {
          if (!piston_log_level) {
            goto LABEL_41;
          }
          uint64_t v30 = v133;
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
            smb2_rq_verify_cold_7();
          }
LABEL_70:
          int v33 = 72;
          goto LABEL_46;
        }
        data[0] = 0;
        data[1] = 0;
        CCHmacInit(&ctx, 2u, *(const void **)(v44 + 216), *(unsigned int *)(v44 + 224));
        unint64_t v87 = 48;
        while (1)
        {
          if (v47)
          {
            if (v49 > v48)
            {
              if (piston_log_level && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
                smb2_rq_verify_cold_6();
              }
              goto LABEL_41;
            }
          }
          else
          {
            uint64_t v88 = mbuf_next(v45);
            if (!v88)
            {
              if (!piston_log_level) {
                goto LABEL_41;
              }
              BOOL v109 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
              uint64_t v30 = v133;
              if (v109) {
                smb2_rq_verify_cold_8(v109, v110, v111, v112, v113, v114, v115, v116);
              }
              goto LABEL_70;
            }
            uint64_t v45 = v88;
            unint64_t v47 = mbuf_len(v88);
            unint64_t v48 = mbuf_len(v45);
            unint64_t v49 = 0;
          }
          if (v87 >= v47) {
            size_t v89 = v47;
          }
          else {
            size_t v89 = v87;
          }
          uint64_t v90 = mbuf_data(v45);
          CCHmacUpdate(&ctx, (const void *)(v90 + v49), v89);
          v49 += v89;
          v47 -= v89;
          v9 -= v89;
          v87 -= v89;
          if (!v87)
          {
            unint64_t v91 = 16;
            CCHmacUpdate(&ctx, data, 0x10uLL);
            while (1)
            {
              if (v47)
              {
                if (v49 > v48)
                {
                  if (piston_log_level && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
                    goto LABEL_124;
                  }
                  goto LABEL_41;
                }
              }
              else
              {
                uint64_t v92 = mbuf_next(v45);
                if (!v92)
                {
                  if (!piston_log_level) {
                    goto LABEL_41;
                  }
                  BOOL v117 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
                  uint64_t v30 = v133;
                  if (v117) {
                    smb2_rq_verify_cold_8(v117, v118, v119, v120, v121, v122, v123, v124);
                  }
                  goto LABEL_70;
                }
                uint64_t v45 = v92;
                unint64_t v47 = mbuf_len(v92);
                unint64_t v48 = mbuf_len(v45);
                unint64_t v49 = 0;
              }
              if (v91 >= v47) {
                unint64_t v93 = v47;
              }
              else {
                unint64_t v93 = v91;
              }
              v49 += v93;
              v47 -= v93;
              v9 -= v93;
              v91 -= v93;
              if (!v91)
              {
                if (!v9)
                {
LABEL_101:
                  CCHmacFinal(&ctx, macOut);
                  int v33 = timingsafe_bcmp(a3, macOut, 0x10uLL);
                  goto LABEL_42;
                }
                while (1)
                {
                  if (v47)
                  {
                    if (v49 > v48)
                    {
                      if (!piston_log_level || !os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
                        goto LABEL_41;
                      }
LABEL_124:
                      smb2_rq_verify_cold_6();
LABEL_41:
                      int v33 = 72;
LABEL_42:
                      uint64_t v30 = v133;
LABEL_46:

                      if (v33)
                      {
                        if (piston_log_level && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
                          smb2_rq_verify_cold_4(v30);
                        }
                        uint64_t v26 = 80;
                        goto LABEL_25;
                      }
                      goto LABEL_24;
                    }
                  }
                  else
                  {
                    uint64_t v94 = mbuf_next(v45);
                    if (!v94)
                    {
                      if (piston_log_level)
                      {
                        BOOL v125 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
                        if (v125) {
                          smb2_rq_verify_cold_8(v125, v126, v127, v128, v129, v130, v131, v132);
                        }
                      }
                      goto LABEL_41;
                    }
                    uint64_t v45 = v94;
                    unint64_t v47 = mbuf_len(v94);
                    unint64_t v48 = mbuf_len(v45);
                    unint64_t v49 = 0;
                  }
                  if (v9 >= v47) {
                    size_t v95 = v47;
                  }
                  else {
                    size_t v95 = v9;
                  }
                  uint64_t v96 = mbuf_data(v45);
                  CCHmacUpdate(&ctx, (const void *)(v96 + v49), v95);
                  v49 += v95;
                  v47 -= v95;
                  v9 -= v95;
                  if (!v9) {
                    goto LABEL_101;
                  }
                }
              }
            }
          }
        }
      }
      BOOL v72 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
      if (v72) {
        smb2_rq_verify_cold_5(v72, v73, v74, v75, v76, v77, v78, v79);
      }
    }
    int v33 = 22;
    goto LABEL_46;
  }
  if (piston_log_level)
  {
    BOOL v18 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v18) {
      smb2_rq_verify_cold_1(v18, v19, v20, v21, v22, v23, v24, v25);
    }
  }
  uint64_t v26 = 22;
LABEL_25:

  return v26;
}

uint64_t smb3_rq_encrypt(void *a1)
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v1 = a1;
  uint64_t v38 = 0;
  uint64_t v2 = objc_msgSend(v1, "sr_sessionp");
  long long v41 = 0uLL;
  long long v40 = 0uLL;
  cryptorRef[1] = 0;
  size_t dataOutMoved = 0;
  dataOut[0] = 0;
  dataOut[1] = 0;
  cryptorRef[0] = 0;
  unsigned int v3 = (_WORD *)(v2 + 492);
  if (*(unsigned __int16 *)(v2 + 492) - 1 >= 4)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      smb3_rq_encrypt_cold_18();
    }
    *unsigned int v3 = 1;
  }
  uint64_t v4 = (uint64_t *)objc_msgSend(v1, "smb_rq_getrequest");
  __int16 v5 = objc_msgSend(v1, "sr_flags");
  uint64_t v6 = (_DWORD *)mb_detach(v4);
  if ((v5 & 0x100) != 0)
  {
    uint64_t v7 = objc_msgSend(v1, "sr_next_rqp");
    if (v7)
    {
      unsigned int v8 = (void *)v7;
      do
      {
        unint64_t v9 = (_DWORD *)mb_detach((uint64_t *)objc_msgSend(v8, "smb_rq_getrequest"));
        uint64_t v6 = (_DWORD *)mbuf_concatenate((uint64_t)v6, v9);
        uint64_t v10 = objc_msgSend(v8, "sr_next_rqp");

        unsigned int v8 = (void *)v10;
      }
      while (v10);
    }
    m_fixhdr((uint64_t)v6);
  }
  uint64_t v38 = 0;
  if (*(_DWORD *)(v2 + 488))
  {
    if (mbuf_gethdr(0, 1, &v38))
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        smb3_rq_encrypt_cold_17();
      }
      uint64_t v11 = 55;
    }
    else
    {
      uint64_t v20 = mbuf_data((uint64_t)v38);
      *(_OWORD *)uint64_t v20 = 0u;
      *(_OWORD *)(v20 + 16) = 0u;
      *(_OWORD *)(v20 + 32) = 0u;
      *(_DWORD *)(v20 + 48) = 0;
      *(_DWORD *)uint64_t v20 = 1112364029;
      pthread_mutex_lock((pthread_mutex_t *)v2);
      uint64_t v21 = *(void *)(v2 + 544);
      *(void *)(v2 + 544) = v21 + 1;
      if (v21 == -1)
      {
        *(void *)(v2 + 544) = 1;
        ++*(void *)(v2 + 536);
      }
      pthread_mutex_unlock((pthread_mutex_t *)v2);
      long long v41 = *(_OWORD *)(v2 + 536);
      switch(*(_WORD *)(v2 + 492))
      {
        case 1:
        case 3:
          HIBYTE(v41) = 0;
          *(_DWORD *)((char *)&v41 + 11) = 0;
          break;
        case 2:
        case 4:
          HIDWORD(v41) = 0;
          break;
        default:
          break;
      }
      *(_OWORD *)(v20 + 20) = v41;
      unint64_t chain_len = mbuf_get_chain_len((uint64_t)v6);
      if (!HIDWORD(chain_len))
      {
        *(_DWORD *)(v20 + 36) = chain_len;
        *(_WORD *)(v20 + 42) = 1;
        *(void *)(v20 + 44) = objc_msgSend(v1, "sr_rqsessionid");
        mbuf_setlen((uint64_t)v38, 52);
        switch(*v3)
        {
          case 1:
          case 3:
            if (CCCryptorCreateWithMode(0, 0xCu, 0, 0, 0, (const void *)(v2 + 456), *(unsigned int *)(v2 + 488), 0, 0, 0, 0, cryptorRef))
            {
              if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
                goto LABEL_77;
              }
              goto LABEL_29;
            }
            if (CCCryptorAddParameter())
            {
              if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
                smb3_rq_encrypt_cold_15();
              }
              goto LABEL_77;
            }
            if (CCCryptorAddParameter())
            {
              if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
                smb3_rq_encrypt_cold_14();
              }
              goto LABEL_77;
            }
            if (CCCryptorAddParameter())
            {
              if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
                goto LABEL_77;
              }
              goto LABEL_38;
            }
            if (CCCryptorAddParameter())
            {
              if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
                goto LABEL_77;
              }
              goto LABEL_44;
            }
            if (v6)
            {
              uint64_t v29 = (uint64_t)v6;
              do
              {
                uint64_t v30 = mbuf_len(v29);
                if (v30)
                {
                  size_t v31 = v30;
                  uint64_t v32 = cryptorRef[0];
                  int v33 = (const void *)mbuf_data(v29);
                  BOOL v34 = (void *)mbuf_data(v29);
                  if (CCCryptorUpdate(v32, v33, v31, v34, v31, &dataOutMoved))
                  {
                    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
                      goto LABEL_77;
                    }
                    goto LABEL_60;
                  }
                }
                uint64_t v29 = mbuf_next(v29);
              }
              while (v29);
            }
            if (CCCryptorFinal(cryptorRef[0], dataOut, 0x10uLL, &dataOutMoved))
            {
              if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
                smb3_rq_encrypt_cold_10();
              }
            }
            else if (dataOutMoved)
            {
              if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
                smb3_rq_encrypt_cold_9();
              }
            }
            else
            {
              if (!CCCryptorGetParameter()) {
                goto LABEL_83;
              }
              if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
                smb3_rq_encrypt_cold_8();
              }
            }
            goto LABEL_77;
          case 2:
          case 4:
            if (CCCryptorCreateWithMode(0, 0xBu, 0, 0, 0, (const void *)(v2 + 456), *(unsigned int *)(v2 + 488), 0, 0, 0, 0, cryptorRef))
            {
              if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
LABEL_29:
              }
                smb3_rq_encrypt_cold_7();
              goto LABEL_77;
            }
            if (CCCryptorAddParameter())
            {
              if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
LABEL_38:
              }
                smb3_rq_encrypt_cold_6();
              goto LABEL_77;
            }
            if (CCCryptorAddParameter())
            {
              if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
LABEL_44:
              }
                smb3_rq_encrypt_cold_5();
              goto LABEL_77;
            }
            if (!v6) {
              goto LABEL_53;
            }
            uint64_t v23 = (uint64_t)v6;
            break;
          default:
            goto LABEL_84;
        }
        do
        {
          uint64_t v24 = mbuf_len(v23);
          if (v24)
          {
            size_t v25 = v24;
            uint64_t v26 = cryptorRef[0];
            uint64_t v27 = (const void *)mbuf_data(v23);
            uint64_t v28 = (void *)mbuf_data(v23);
            if (CCCryptorUpdate(v26, v27, v25, v28, v25, &dataOutMoved))
            {
              if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
LABEL_60:
              }
                smb3_rq_encrypt_cold_4();
              goto LABEL_77;
            }
          }
          uint64_t v23 = mbuf_next(v23);
        }
        while (v23);
LABEL_53:
        if (CCCryptorGCMFinalize())
        {
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
            smb3_rq_encrypt_cold_3();
          }
          goto LABEL_77;
        }
LABEL_83:
        *(_OWORD *)(v20 + 4) = v40;
LABEL_84:
        uint64_t v38 = (void *)mbuf_concatenate((uint64_t)v38, v6);
        m_fixhdr((uint64_t)v38);
        mb_initm((uint64_t)v4, (uint64_t)v38);
        uint64_t v11 = 0;
        goto LABEL_80;
      }
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        smb3_rq_encrypt_cold_2();
      }
LABEL_77:
      uint64_t v11 = 80;
    }
    mbuf_freem(v6);
    if (v38) {
      mbuf_freem(v38);
    }
LABEL_80:
    if (cryptorRef[0]) {
      CCCryptorRelease(cryptorRef[0]);
    }
    goto LABEL_82;
  }
  BOOL v12 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
  if (v12) {
    smb3_rq_encrypt_cold_1(v12, v13, v14, v15, v16, v17, v18, v19);
  }
  uint64_t v11 = 22;
LABEL_82:

  return v11;
}

uint64_t smb3_msg_decrypt(uint64_t a1, void **a2)
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  CCCryptorRef cryptorRef = 0;
  uint64_t v46 = 0;
  long long v48 = 0uLL;
  size_t dataOutMoved = 0;
  dataOut[0] = 0;
  dataOut[1] = 0;
  uint64_t v4 = (_WORD *)(a1 + 492);
  if (*(unsigned __int16 *)(a1 + 492) - 1 >= 4)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      smb3_msg_decrypt_cold_22();
    }
    *uint64_t v4 = 1;
  }
  uint64_t v46 = 0;
  if (!*(_DWORD *)(a1 + 528))
  {
    BOOL v9 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v9) {
      smb3_msg_decrypt_cold_1(v9, v10, v11, v12, v13, v14, v15, v16);
    }
    goto LABEL_13;
  }
  __int16 v5 = *a2;
  if (mbuf_split(*a2, 0x34uLL, 0, &v46))
  {
LABEL_10:
    uint64_t v8 = 72;
    goto LABEL_14;
  }
  uint64_t v6 = mbuf_data((uint64_t)v5);
  uint64_t v7 = v6;
  if (*(_DWORD *)v6 != 1112364029)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      smb3_msg_decrypt_cold_21((unsigned __int8 *)v7);
    }
    goto LABEL_10;
  }
  if (*(_WORD *)(v6 + 42) != 1)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      smb3_msg_decrypt_cold_20();
    }
    goto LABEL_13;
  }
  if (*(void *)(v6 + 44) != *(void *)(a1 + 568))
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      smb3_msg_decrypt_cold_19();
    }
LABEL_13:
    uint64_t v8 = 80;
LABEL_14:
    __int16 v5 = v46;
    if (v46) {
LABEL_15:
    }
      mbuf_freem(v5);
    return v8;
  }
  switch(*v4)
  {
    case 1:
    case 3:
      if (CCCryptorCreateWithMode(1u, 0xCu, 0, 0, 0, (const void *)(a1 + 494), *(unsigned int *)(a1 + 528), 0, 0, 0, 0, &cryptorRef))
      {
        if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          goto LABEL_13;
        }
        goto LABEL_22;
      }
      if (CCCryptorAddParameter())
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          smb3_msg_decrypt_cold_17();
        }
        goto LABEL_13;
      }
      if (CCCryptorAddParameter())
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          smb3_msg_decrypt_cold_16();
        }
        goto LABEL_13;
      }
      if (CCCryptorAddParameter())
      {
        if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          goto LABEL_13;
        }
        goto LABEL_35;
      }
      if (CCCryptorAddParameter())
      {
        if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          goto LABEL_13;
        }
        goto LABEL_41;
      }
      uint64_t v24 = (uint64_t)v46;
      if (v46)
      {
        do
        {
          uint64_t v25 = mbuf_len(v24);
          if (v25)
          {
            size_t v26 = v25;
            uint64_t v27 = cryptorRef;
            uint64_t v28 = (const void *)mbuf_data(v24);
            uint64_t v29 = (void *)mbuf_data(v24);
            if (CCCryptorUpdate(v27, v28, v26, v29, v26, &dataOutMoved))
            {
              if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
                goto LABEL_13;
              }
              goto LABEL_56;
            }
          }
          uint64_t v24 = mbuf_next(v24);
        }
        while (v24);
      }
      if (CCCryptorFinal(cryptorRef, dataOut, 0x10uLL, &dataOutMoved))
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          smb3_msg_decrypt_cold_12();
        }
      }
      else if (dataOutMoved)
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          smb3_msg_decrypt_cold_11();
        }
      }
      else if (CCCryptorGetParameter())
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          smb3_msg_decrypt_cold_10();
        }
      }
      else
      {
        if (!cc_cmp_safe()) {
          goto LABEL_82;
        }
        if (piston_log_level)
        {
          BOOL v30 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
          if (v30) {
            smb3_msg_decrypt_cold_9(v30, v31, v32, v33, v34, v35, v36, v37);
          }
          if (piston_log_level)
          {
            if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
              smb3_msg_decrypt_cold_8(v7 + 4, (unsigned __int8 *)v7, v38, v39, v40, v41, v42, v43);
            }
            if (piston_log_level && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
              smb3_msg_decrypt_cold_7();
            }
          }
        }
      }
      goto LABEL_13;
    case 2:
    case 4:
      if (CCCryptorCreateWithMode(1u, 0xBu, 0, 0, 0, (const void *)(a1 + 494), *(unsigned int *)(a1 + 528), 0, 0, 0, 0, &cryptorRef))
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
LABEL_22:
        }
          smb3_msg_decrypt_cold_6();
        goto LABEL_13;
      }
      if (CCCryptorAddParameter())
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
LABEL_35:
        }
          smb3_msg_decrypt_cold_5();
        goto LABEL_13;
      }
      if (CCCryptorAddParameter())
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
LABEL_41:
        }
          smb3_msg_decrypt_cold_4();
        goto LABEL_13;
      }
      uint64_t v18 = (uint64_t)v46;
      if (!v46) {
        goto LABEL_49;
      }
      break;
    default:
      goto LABEL_82;
  }
  do
  {
    uint64_t v19 = mbuf_len(v18);
    if (v19)
    {
      size_t v20 = v19;
      uint64_t v21 = cryptorRef;
      uint64_t v22 = (const void *)mbuf_data(v18);
      uint64_t v23 = (void *)mbuf_data(v18);
      if (CCCryptorUpdate(v21, v22, v20, v23, v20, &dataOutMoved))
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
LABEL_56:
        }
          smb3_msg_decrypt_cold_3();
        goto LABEL_13;
      }
    }
    uint64_t v18 = mbuf_next(v18);
  }
  while (v18);
LABEL_49:
  long long v48 = *(_OWORD *)(v7 + 4);
  if (CCCryptorGCMFinalize())
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      smb3_msg_decrypt_cold_2();
    }
    goto LABEL_13;
  }
LABEL_82:
  uint64_t v8 = 0;
  *a2 = v46;
  if (v5) {
    goto LABEL_15;
  }
  return v8;
}

uint64_t smb3_verify_session_setup(uint64_t a1, uint64_t a2, unint64_t a3)
{
  ccaes_cbc_encrypt_mode();
  int v6 = *(unsigned __int16 *)(a1 + 264);
  if (!a2 || !a3)
  {
    BOOL v7 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v7) {
      smb3_verify_session_setup_cold_1(v7, v8, v9, v10, v11, v12, v13, v14);
    }
    return 80;
  }
  if (a3 <= 0x40)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      smb3_verify_session_setup_cold_2();
    }
    return 80;
  }
  if (*(_DWORD *)(a1 + 260) <= 0xFu)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      smb3_verify_session_setup_cold_3();
    }
    return 80;
  }
  *(void *)(a2 + 48) = 0;
  *(void *)(a2 + 56) = 0;
  if (v6 == 2)
  {
    if (CCCryptorGCMOneshotEncrypt())
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        smb3_verify_session_setup_cold_9();
      }
      return 80;
    }
  }
  else
  {
    if (v6 != 1)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        smb3_verify_session_setup_cold_4();
      }
      return 80;
    }
    if (cccmac_one_shot_generate())
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        smb3_verify_session_setup_cold_8();
      }
      return 80;
    }
  }
  uint64_t result = cc_cmp_safe();
  if (result)
  {
    if (piston_log_level)
    {
      BOOL v16 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
      if (v16) {
        smb3_verify_session_setup_cold_7(v16, v17, v18, v19, v20, v21, v22, v23);
      }
      if (piston_log_level)
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          smb3_verify_session_setup_cold_6();
        }
        if (piston_log_level && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          smb3_verify_session_setup_cold_5();
        }
      }
    }
    return 80;
  }
  return result;
}

uint64_t smb311_pre_auth_integrity_hash_init(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  memset(v11, 0, sizeof(v11));
  if (!a1) {
    return 22;
  }
  memset(&v10, 0, sizeof(v10));
  CC_SHA512_Init(&v10);
  if (a2) {
    int v6 = (_OWORD *)(a1 + 328);
  }
  else {
    int v6 = v11;
  }
  CC_SHA512_Update(&v10, v6, 0x40u);
  for (; a3; a3 = mbuf_next(a3))
  {
    if (mbuf_len(a3))
    {
      BOOL v7 = (const void *)mbuf_data(a3);
      CC_LONG v8 = mbuf_len(a3);
      CC_SHA512_Update(&v10, v7, v8);
    }
  }
  CC_SHA512_Final((unsigned __int8 *)(a1 + 392), &v10);
  return 0;
}

uint64_t smb311_pre_auth_integrity_hash_update(uint64_t a1, uint64_t a2)
{
  if (!a1) {
    return 22;
  }
  memset(&v8, 0, sizeof(v8));
  CC_SHA512_Init(&v8);
  uint64_t v4 = (void *)(a1 + 392);
  CC_SHA512_Update(&v8, v4, 0x40u);
  for (; a2; a2 = mbuf_next(a2))
  {
    if (mbuf_len(a2))
    {
      __int16 v5 = (const void *)mbuf_data(a2);
      CC_LONG v6 = mbuf_len(a2);
      CC_SHA512_Update(&v8, v5, v6);
    }
  }
  CC_SHA512_Final((unsigned __int8 *)v4, &v8);
  return 0;
}

uint64_t smb311_pre_auth_integrity_hash_print(uint64_t a1)
{
  if (a1) {
    return 0;
  }
  else {
    return 22;
  }
}

void smb3_get_signature(uint64_t a1, void *a2, uint64_t *a3, uint64_t a4, unint64_t a5, uint64_t a6, int a7, int a8, void *a9)
{
  uint64_t v61 = *MEMORY[0x263EF8340];
  id v16 = a2;
  long long v59 = 0u;
  long long v60 = 0u;
  uint64_t v57 = 0;
  uint64_t v58 = 0;
  int v17 = *(unsigned __int16 *)(a1 + 264);
  CCCryptorRef cryptorRef = 0;
  uint64_t v56 = 0;
  if (!a9)
  {
    BOOL v26 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v26) {
      smb3_get_signature_cold_1(v26, v27, v28, v29, v30, v31, v32, v33);
    }
    goto LABEL_80;
  }
  if (!((unint64_t)a3 | a4))
  {
    BOOL v18 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v18) {
      smb3_get_signature_cold_2(v18, v19, v20, v21, v22, v23, v24, v25);
    }
    goto LABEL_80;
  }
  if (*(_DWORD *)(a1 + 260) <= 0xFu)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      smb3_get_signature_cold_3();
    }
    goto LABEL_80;
  }
  *a9 = 0;
  a9[1] = 0;
  uint64_t v34 = (uint64_t *)(a4 + 8);
  if (!a4) {
    uint64_t v34 = a3;
  }
  uint64_t v35 = *v34;
  int v53 = a8;
  if (v17 == 2)
  {
    if (CCCryptorCreateWithMode(0, 0xBu, 0, 0, 0, (const void *)(a1 + 244), *(unsigned int *)(a1 + 260), 0, 0, 0, 0, &cryptorRef))
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        smb3_get_signature_cold_16();
      }
      goto LABEL_78;
    }
    uint64_t v56 = objc_msgSend(v16, "sr_messageid");
    if (a4) {
      LODWORD(v57) = v57 | 1;
    }
    if (objc_msgSend(v16, "sr_command") == 12) {
      LODWORD(v57) = v57 | 2;
    }
    if (CCCryptorGCMSetIV())
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        smb3_get_signature_cold_14();
      }
      goto LABEL_78;
    }
    uint64_t v36 = 0;
  }
  else
  {
    if (v17 != 1)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        smb3_get_signature_cold_4();
      }
      goto LABEL_78;
    }
    uint64_t v36 = CCAESCmacCreate();
    if (!v36)
    {
      BOOL v43 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
      if (v43) {
        smb3_get_signature_cold_5(v43, v44, v45, v46, v47, v48, v49, v50);
      }
      goto LABEL_78;
    }
  }
  int v51 = a7;
  id v52 = v16;
  uint64_t v54 = v36;
  if (!v35)
  {
LABEL_35:
    id v16 = v52;
    uint64_t v42 = v54;
    if (!a6 || !v51) {
      goto LABEL_63;
    }
    if (v17 == 2)
    {
      if (CCCryptorGCMAddAAD())
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          smb3_get_signature_cold_12();
        }
        goto LABEL_76;
      }
    }
    else
    {
      CCAESCmacUpdate();
    }
    if (v53 && (v51 & 7) != 0)
    {
      if (v17 != 2)
      {
        CCAESCmacUpdate();
LABEL_64:
        CCAESCmacFinal();
        goto LABEL_71;
      }
      if (CCCryptorGCMAddAAD())
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          smb3_get_signature_cold_11();
        }
        goto LABEL_76;
      }
    }
    else
    {
LABEL_63:
      if (v17 != 2) {
        goto LABEL_64;
      }
    }
    if (CCCryptorGCMFinalize())
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        smb3_get_signature_cold_9();
      }
      goto LABEL_76;
    }
LABEL_71:
    if (a4 && a5 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      smb3_get_signature_cold_8();
    }
    *(_OWORD *)a9 = v59;
    goto LABEL_76;
  }
  uint64_t v37 = v35;
  while (1)
  {
    if (a4 && v37 == v35)
    {
      uint64_t v38 = mbuf_data(v35);
      unint64_t v39 = mbuf_len(v35) + v38 - *(void *)(a4 + 16);
    }
    else
    {
      unint64_t v39 = mbuf_len(v37);
      mbuf_data(v37);
    }
    if (a4) {
      BOOL v40 = a5 == 0;
    }
    else {
      BOOL v40 = 1;
    }
    int v41 = !v40;
    if ((v41 & (a5 < v39)) != 0) {
      unint64_t v39 = a5;
    }
    if (v17 == 2) {
      break;
    }
    CCAESCmacUpdate();
LABEL_32:
    if (!v41 || (a5 -= v39) != 0)
    {
      uint64_t v37 = mbuf_next(v37);
      if (v37) {
        continue;
      }
    }
    goto LABEL_35;
  }
  if (!CCCryptorGCMAddAAD()) {
    goto LABEL_32;
  }
  id v16 = v52;
  uint64_t v42 = v54;
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    smb3_get_signature_cold_14();
  }
LABEL_76:
  if (v42) {
    CCAESCmacDestroy();
  }
LABEL_78:
  if (cryptorRef)
  {
    CCCryptorGCMReset();
    CCCryptorRelease(cryptorRef);
  }
LABEL_80:
}

void OUTLINED_FUNCTION_4_4(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

void OUTLINED_FUNCTION_8(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x6Cu);
}

void OUTLINED_FUNCTION_9_0(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

void OUTLINED_FUNCTION_11(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x20u);
}

void piston_flush(void *a1, _WORD *a2, void *a3)
{
  id v5 = a1;
  CC_LONG v6 = a3;
  BOOL v7 = [v5 pd];
  CC_SHA512_CTX v8 = [v7 sock];

  if (!v8)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      piston_flush_cold_1();
      if (!v6) {
        goto LABEL_20;
      }
    }
    else if (!v6)
    {
      goto LABEL_20;
    }
    v6[2](v6, 57);
    goto LABEL_20;
  }
  id v9 = v5;
  CC_SHA512_CTX v10 = v6;
  uint64_t v11 = [v9 treeID];
  uint64_t v12 = [v9 onEncryptedShare];
  uint64_t v13 = [v9 pd];
  id v28 = 0;
  uint64_t v14 = smb2_rq_alloc(7, v11, v12, 0, v13, &v28);
  id v15 = v28;

  if (v14)
  {
    if (v15) {
      objc_msgSend(v15, "smb_rq_done");
    }
    if (v10) {
      v10[2](v10, v14);
    }
    goto LABEL_17;
  }
  uint64_t v16 = objc_msgSend(v15, "smb_rq_getrequest");
  mb_put_uint16le(v16, 24);
  mb_put_uint16le(v16, -(*a2 & 1));
  mb_put_uint32le(v16, 0);
  mb_put_uint64le(v16, [v9 fid]);
  [v9 fid];
  mb_put_uint64le(v16, v17);
  BOOL v18 = [v9 pd];
  uint64_t v21 = MEMORY[0x263EF8330];
  uint64_t v22 = 3221225472;
  uint64_t v23 = __smb2_smb_flush_block_invoke;
  uint64_t v24 = &unk_265072BD8;
  uint64_t v19 = v10;
  BOOL v26 = v19;
  uint64_t v27 = a2;
  id v20 = v15;
  id v25 = v20;
  uint64_t v14 = smb_rq_simple_block(v18, v20, &v21);

  if (v14)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      piston_flush_cold_3();
      if (!v20)
      {
LABEL_14:
        if (v19) {
          v19[2](v19, v14);
        }
        goto LABEL_16;
      }
    }
    else if (!v20)
    {
      goto LABEL_14;
    }
    objc_msgSend(v20, "smb_rq_done", v21, v22, v23, v24);
    goto LABEL_14;
  }
LABEL_16:

LABEL_17:
  if (v14 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    piston_flush_cold_2();
  }
LABEL_20:
}

void __smb2_smb_flush_block_invoke(uint64_t a1, uint64_t uint16le)
{
  int v15 = 0;
  uint64_t v4 = (void (**)(void, void))MEMORY[0x2455D48A0](*(void *)(a1 + 40));
  CC_LONG v6 = *(void **)(a1 + 32);
  uint64_t v5 = a1 + 32;
  *(_DWORD *)(*(void *)(v5 + 16) + 4) = objc_msgSend(v6, "sr_ntstatus");
  if (uint16le)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      __smb2_smb_flush_block_invoke_cold_2((id *)v5, uint16le);
    }
  }
  else
  {
    BOOL v7 = objc_msgSend(*(id *)v5, "smb_rq_getreply");
    uint64_t uint16le = md_get_uint16le(v7, (_WORD *)&v15 + 1);
    if (!uint16le)
    {
      if (HIWORD(v15) == 4)
      {
        uint64_t uint16le = md_get_uint16le(v7, &v15);
      }
      else
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          __smb2_smb_flush_block_invoke_cold_1((uint64_t)&v15 + 2, v8, v9, v10, v11, v12, v13, v14);
        }
        uint64_t uint16le = 72;
      }
    }
  }
  if (*(void *)v5) {
    objc_msgSend(*(id *)v5, "smb_rq_done");
  }
  if (v4) {
    v4[2](v4, uint16le);
  }
}

void sub_23F866A78(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 152));
  _Unwind_Resume(a1);
}

void sub_23F868270(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,char a32)
{
}

void sub_23F868480(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location, char a17)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a17, 8);
  _Unwind_Resume(a1);
}

void sub_23F868644(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16)
{
  objc_destroyWeak(v16);
  _Block_object_dispose(&a16, 8);
  _Block_object_dispose((const void *)(v17 - 56), 8);
  objc_destroyWeak((id *)(v17 - 24));
  _Unwind_Resume(a1);
}

void sub_23F868F04(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location, char a20,uint64_t a21,uint64_t a22,uint64_t a23,char a24)
{
}

void sub_23F86934C(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 56));
  _Unwind_Resume(a1);
}

void piston_gss_reset(gss_cred_id_t *cred_handle)
{
  OM_uint32 minor_status = 0;
  uint64_t v2 = cred_handle + 15;
  if (cred_handle[15])
  {
    gss_delete_sec_context(&minor_status, v2, 0);
    *uint64_t v2 = 0;
  }
  if (cred_handle[16])
  {
    gss_destroy_cred(&minor_status, cred_handle + 16);
    cred_handle[16] = 0;
  }
  gss_cred_id_t v3 = cred_handle[18];
  if (v3)
  {
    free(v3);
    cred_handle[18] = 0;
  }
  cred_handle[17] = 0;
  gss_cred_id_t v4 = cred_handle[20];
  if (v4)
  {
    free(v4);
    cred_handle[20] = 0;
  }
  cred_handle[19] = 0;
}

uint64_t piston_gss_parse_server_mechs(uint64_t a1)
{
  output_token.length = 0;
  output_token.value = 0;
  memset(v14, 0, sizeof(v14));
  memset(v12, 0, sizeof(v12));
  long long v13 = 0u;
  if (!*(void *)(a1 + 144)) {
    return 589824;
  }
  OM_uint32 minor_status = 0;
  uint64_t v2 = gss_decapsulate_token((gss_const_buffer_t)(a1 + 136), MEMORY[0x263F08E40], &output_token);
  if (!v2)
  {
    int v3 = decode_NegotiationToken((uint64_t)output_token.value, output_token.length, (uint64_t)v14, 0);
    if (v3)
    {
      if ((piston_log_level & 4) != 0 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        piston_gss_parse_server_mechs_cold_3();
      }
      uint64_t v4 = decode_NegotiationTokenWin((uint64_t)output_token.value, output_token.length, (uint64_t)v12, 0);
      if (v4)
      {
        uint64_t v2 = v4;
        if ((piston_log_level & 4) != 0 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          piston_gss_parse_server_mechs_cold_2();
        }
        int v5 = 0;
        goto LABEL_44;
      }
      if (LODWORD(v12[0]) != 1)
      {
        gss_release_buffer(&minor_status, &output_token);
        int v5 = 0;
        uint64_t v2 = 589824;
        goto LABEL_48;
      }
      p_value = (void **)v12 + 1;
      if (*((void *)&v13 + 1)
        && **((void **)&v13 + 1)
        && (piston_log_level & 4) != 0
        && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        piston_gss_parse_server_mechs_cold_1();
      }
      int v5 = 0;
    }
    else
    {
      if (LODWORD(v14[0].length) != 1)
      {
        int v5 = 1;
        uint64_t v2 = 589824;
LABEL_44:
        gss_release_buffer(&minor_status, &output_token);
        goto LABEL_49;
      }
      p_value = &v14[0].value;
      int v5 = 1;
    }
    if (*(_DWORD *)p_value)
    {
      uint64_t v7 = 0;
      unint64_t v8 = 0;
      while (1)
      {
        uint64_t v2 = der_print_heim_oid();
        if (!v2) {
          break;
        }
LABEL_41:
        ++v8;
        v7 += 16;
        if (v8 >= *(unsigned int *)p_value) {
          goto LABEL_47;
        }
      }
      if (!strcmp(0, "1.2.840.48018.1.2.2"))
      {
        int v9 = 1;
      }
      else if (!strcmp(0, "1.2.840.113554.1.2.2"))
      {
        int v9 = 2;
      }
      else if (!strcmp(0, "1.2.752.43.14.3"))
      {
        int v9 = 4;
      }
      else if (!strcmp(0, "1.3.6.1.5.5.14"))
      {
        int v9 = 8;
      }
      else if (!strcmp(0, "1.3.6.1.4.1.311.2.2.10"))
      {
        int v9 = 16;
      }
      else if (!strcmp(0, "1.3.5.1.5.2.7"))
      {
        int v9 = 32;
      }
      else
      {
        if (strcmp(0, "1.3.6.1.5.2.5"))
        {
LABEL_40:
          free(0);
          goto LABEL_41;
        }
        int v9 = 64;
      }
      *(_DWORD *)(a1 + 112) |= v9;
      goto LABEL_40;
    }
    uint64_t v2 = 589824;
LABEL_47:
    gss_release_buffer(&minor_status, &output_token);
    if (!v3) {
      goto LABEL_49;
    }
LABEL_48:
    free_NegotiationTokenWin((uint64_t)v12);
LABEL_49:
    if (v5) {
      free_NegotiationToken((uint64_t)v14);
    }
  }
  return v2;
}

uint64_t piston_gss_transact(void *a1)
{
  uint64_t v237 = *MEMORY[0x263EF8340];
  id v1 = a1;
  *(void *)OM_uint32 minor_status = 0;
  OM_uint32 ret_flags = 0;
  gss_name_t output_name = 0;
  gss_OID actual_mech_type = 0;
  input_name_buffer.length = 0;
  input_name_buffer.value = 0;
  uint64_t v2 = [v1 getSessionPtr];
  int v3 = [v1 sock];

  if (v3)
  {
    uint64_t v4 = *(void *)(v2 + 560);
    if ((v4 & 0x200000) != 0)
    {
      int v5 = (gss_OID_desc *)MEMORY[0x263F08E18];
    }
    else if ((v4 & 0x400000) != 0)
    {
      if ((piston_log_level & 4) != 0)
      {
        BOOL v15 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
        if (v15) {
          piston_gss_transact_cold_39(v15, v16, v17, v18, v19, v20, v21, v22);
        }
      }
      int v5 = (gss_OID_desc *)MEMORY[0x263F08E10];
    }
    else
    {
      int v5 = (gss_OID_desc *)MEMORY[0x263F08E38];
    }
    if (*(void *)(v2 + 128)) {
      goto LABEL_14;
    }
    uint64_t v32 = [v1 userName];

    if (!v32)
    {
      BOOL v68 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
      if (v68) {
        piston_gss_transact_cold_2(v68, v69, v70, v71, v72, v73, v74, v75);
      }
      goto LABEL_61;
    }
    if (gss_oid_equal(v5, MEMORY[0x263F08E18]))
    {
      if ((piston_log_level & 4) != 0)
      {
        BOOL v33 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
        if (v33) {
          piston_gss_transact_cold_38(v33, v34, v35, v36, v37, v38, v39, v40);
        }
      }
      id v41 = v1;
      output_cred_handle.__sig = 0;
      error[0] = 0;
      uint64_t v42 = [v41 getSessionPtr];
      if (!gss_oid_equal(v5, MEMORY[0x263F08E18]))
      {
        int v51 = 0;
        uint64_t v50 = 0;
        OM_uint32 v55 = 983040;
LABEL_166:

        goto LABEL_167;
      }
      BOOL v43 = NSString;
      uint64_t v44 = [v41 userName];
      uint64_t v45 = [v41 realm];
      uint64_t v46 = (const void *)[v43 stringWithFormat:@"%@@%@", v44, v45];
      gss_name_t v47 = GSSCreateName(v46, MEMORY[0x263F08E00], error);

      if (!v47)
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          piston_gss_transact_cold_28((uint64_t)error, v100, v101, v102, v103, v104, v105, v106);
        }
        uint64_t v50 = 0;
        int v51 = 0;
        OM_uint32 v55 = 983040;
        goto LABEL_164;
      }
      CFUUIDRef v48 = CFUUIDCreate(0);
      desired_name = v47;
      if (!v48)
      {
        BOOL v108 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
        if (v108) {
          piston_gss_transact_cold_29(v108, v109, v110, v111, v112, v113, v114, v115);
        }
        uint64_t v50 = 0;
        int v51 = 0;
        OM_uint32 v55 = 983040;
        goto LABEL_163;
      }
      CFUUIDRef v49 = v48;
      uint64_t v50 = (__CFString *)CFUUIDCreateString(0, v48);
      if (!v50)
      {
        BOOL v118 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
        if (v118) {
          piston_gss_transact_cold_30(v118, v119, v120, v121, v122, v123, v124, v125);
        }
        int v51 = 0;
        OM_uint32 v55 = 983040;
        goto LABEL_162;
      }
      int v51 = [NSString stringWithFormat:@"XCACHE:%@", v50];
      if ((piston_log_level & 4) != 0 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        piston_gss_transact_cold_37();
      }
      id v52 = [MEMORY[0x263EFF9A0] dictionary];
      if (!v52)
      {
        BOOL v137 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
        if (v137) {
          piston_gss_transact_cold_31(v137, v138, v139, v140, v141, v142, v143, v144);
        }
        OM_uint32 v55 = 983040;
        goto LABEL_161;
      }
      int v53 = [v41 password];
      [v52 setObject:v53 forKey:@"kGSSICPassword"];

      [v52 setObject:v51 forKey:@"kGSSICKerberosCacheName"];
      OM_uint32 v54 = gss_aapl_initial_cred(desired_name, MEMORY[0x263F08E18], (CFDictionaryRef)v52, (gss_cred_id_t *)&output_cred_handle, error);
      if (v54)
      {
        OM_uint32 v55 = v54;
        uint64_t v56 = piston_gss_error(v54, 0, v5);
        BOOL v57 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
        if (v56)
        {
          if (v57) {
            piston_gss_transact_cold_36();
          }
          free(v56);
        }
        else if (v57)
        {
          piston_gss_transact_cold_35();
        }
      }
      else
      {
        if (output_cred_handle.__sig)
        {
          CFUUIDRef v145 = GSSCredentialCopyUUID((gss_cred_id_t)output_cred_handle.__sig);
          if (v145)
          {
            CFUUIDRef v146 = v145;
            if ((piston_log_level & 4) != 0 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
              piston_gss_transact_cold_34();
            }
            CFRelease(v146);
            OM_uint32 v55 = 0;
            *(void *)(v42 + 128) = output_cred_handle.__sig;
            goto LABEL_161;
          }
          BOOL v192 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
          if (v192) {
            piston_gss_transact_cold_33(v192, v193, v194, v195, v196, v197, v198, v199);
          }
        }
        else
        {
          BOOL v184 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
          if (v184) {
            piston_gss_transact_cold_32(v184, v185, v186, v187, v188, v189, v190, v191);
          }
        }
        OM_uint32 v55 = 0;
      }
LABEL_161:

LABEL_162:
      CFRelease(v49);
LABEL_163:
      CFRelease(desired_name);
LABEL_164:
      if (error[0]) {
        CFRelease(error[0]);
      }
      goto LABEL_166;
    }
    id v81 = v1;
    *(_OWORD *)status_value = 0u;
    memset(&v235, 0, sizeof(v235));
    memset(&output_cred_handle, 0, sizeof(output_cred_handle));
    LODWORD(rctx) = 0;
    uint64_t v82 = [v81 getSessionPtr];
    OM_uint32 v233 = 0;
    uint64_t v230 = 0;
    int v83 = pthread_mutex_init(&output_cred_handle, 0);
    if (v83)
    {
      printf("pthread_mutex_init failed <%d> \n", v83);
LABEL_81:
      OM_uint32 v55 = 851968;
      goto LABEL_167;
    }
    int v107 = pthread_cond_init(&v235, 0);
    if (v107)
    {
      printf("pthread_cond_init failed <%d> \n", v107);
      pthread_mutex_destroy(&output_cred_handle);
      goto LABEL_81;
    }
    status_value[0] = 0;
    if ((*(_WORD *)(v82 + 554) & 0x840) == 0)
    {
      uint64_t v158 = [v81 realm];
      if (!v158
        || (v159 = (void *)v158,
            [v81 realm],
            id v160 = objc_claimAutoreleasedReturnValue(),
            uint64_t v161 = [v160 length],
            v160,
            v159,
            !v161))
      {
        if (gss_oid_equal(v5, MEMORY[0x263F08E10])) {
          [v81 setRealm:@"WELLKNOWN:COM.APPLE.LKDC"];
        }
        if (gss_oid_equal(v5, MEMORY[0x263F08E18]))
        {
          int v162 = piston_gss_get_realm();
          [v81 setRealm:v162];
        }
      }
    }
    uint64_t v126 = [v81 userName];
    cstring_len = (__CFError *)smb_get_cstring_len(v126, &v233);

    uint64_t v128 = [v81 password];
    uint64_t v129 = (__CFError *)smb_get_cstring_len(v128, (_DWORD *)&v230 + 1);

    uint64_t v130 = [v81 realm];
    uint64_t v131 = (__CFError *)smb_get_cstring_len(v130, &v230);

    error[0] = (CFErrorRef)1;
    error[1] = cstring_len;
    error[2] = v131;
    error[3] = v129;
    error[4] = 0;
    OM_uint32 v132 = __ApplePrivate_gss_acquire_cred_ex_f();
    if (v132)
    {
      OM_uint32 v55 = v132;
      long long v133 = piston_gss_error(v132, (OM_uint32)rctx, v5);
      BOOL v134 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
      if (v133)
      {
        if (v134) {
          goto LABEL_140;
        }
        goto LABEL_141;
      }
      if (!v134) {
        goto LABEL_176;
      }
    }
    else
    {
      pthread_mutex_lock(&output_cred_handle);
      while (!status_value[0])
      {
        int v163 = pthread_cond_wait(&v235, &output_cred_handle);
        if (v163)
        {
          int v164 = v163;
          id v165 = strerror(v163);
          printf("pthread_cond_wait failed <%s (%d)> \n", v165, v164);
          status_value[1] = 851968;
        }
      }
      pthread_mutex_unlock(&output_cred_handle);
      OM_uint32 v55 = status_value[1];
      if (!status_value[1])
      {
        *(void *)(v82 + 128) = *(void *)&status_value[2];
        goto LABEL_176;
      }
      LODWORD(rctx) = 0;
      long long v133 = piston_gss_error(status_value[1], 0, v5);
      BOOL v166 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
      if (v133)
      {
        if (v166) {
LABEL_140:
        }
          piston_gss_transact_cold_25();
LABEL_141:
        free(v133);
LABEL_176:
        pthread_mutex_destroy(&output_cred_handle);
        pthread_cond_destroy(&v235);
LABEL_167:

        if (v55)
        {
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
            piston_gss_transact_cold_23();
          }
          goto LABEL_170;
        }
LABEL_14:
        if (gss_oid_equal(v5, MEMORY[0x263F08E18]))
        {
          uint64_t v23 = NSString;
          uint64_t v24 = [v1 sock];
          id v25 = [v24 serverName];
          BOOL v26 = [v23 stringWithFormat:@"cifs@%@", v25];

          if ((piston_log_level & 4) != 0 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
            piston_gss_transact_cold_21(v26);
          }
          id v27 = v26;
          value = (void *)[v27 cStringUsingEncoding:4];
          input_name_buffer.value = value;
        }
        else
        {
          if (gss_oid_equal(v5, MEMORY[0x263F08E10]))
          {
            input_name_buffer.length = 39;
            input_name_buffer.value = "cifs/localhost@WELLKNOWN:COM.APPLE.LKDC";
            OM_uint32 v29 = gss_import_name(&minor_status[1], &input_name_buffer, MEMORY[0x263F08E20], &output_name);
            if (v29)
            {
LABEL_20:
              uint64_t v30 = piston_gss_error(v29, minor_status[1], MEMORY[0x263F08E40]);
              BOOL v31 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
              if (v30)
              {
                if (v31) {
                  piston_gss_transact_cold_20();
                }
                free(v30);
              }
              else if (v31)
              {
                piston_gss_transact_cold_19();
              }
              goto LABEL_61;
            }
LABEL_44:
            OM_uint32 inited = gss_init_sec_context(&minor_status[1], *(gss_cred_id_t *)(v2 + 128), (gss_ctx_id_t *)(v2 + 120), output_name, MEMORY[0x263F08E40], 0x2Au, 0xFFFFFFFF, 0, (gss_buffer_t)(v2 + 136), &actual_mech_type, (gss_buffer_t)(v2 + 152), &ret_flags, 0);
            if (inited == 1)
            {
              if ((piston_log_level & 4) != 0)
              {
                BOOL v84 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
                if (v84) {
                  piston_gss_transact_cold_18(v84, v85, v86, v87, v88, v89, v90, v91);
                }
              }
              uint64_t v14 = 35;
              goto LABEL_171;
            }
            OM_uint32 v59 = inited;
            if (inited)
            {
              uint64_t v92 = piston_gss_error(inited, minor_status[1], MEMORY[0x263F08E40]);
              if (v92)
              {
                unint64_t v93 = v92;
                printf("%s: gss_init_sec_context failed <%s> \n", "piston_gss_transact", v92);
                free(v93);
              }
              else
              {
                printf("%s: gss_init_sec_context failed <0x%x> \n", "piston_gss_transact", v59);
              }
              goto LABEL_170;
            }
            if ((piston_log_level & 4) != 0)
            {
              BOOL v60 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
              if (v60) {
                piston_gss_transact_cold_17(v60, v61, v62, v63, v64, v65, v66, v67);
              }
            }
            if (*(void *)(v2 + 152) >= 0x401uLL)
            {
              if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
                piston_gss_transact_cold_3();
              }
              goto LABEL_61;
            }
            gss_OID v94 = actual_mech_type;
            id v95 = v1;
            OM_uint32 v233 = 0;
            error[0] = 0;
            rCCHmacContext ctx = 0;
            uint64_t v96 = [v95 getSessionPtr];
            if (gss_oid_equal(v94, MEMORY[0x263F08E38]))
            {
              OM_uint32 v97 = gss_inquire_sec_context_by_oid(&v233, *(gss_ctx_id_t *)(v96 + 120), MEMORY[0x263F08E30], (gss_buffer_set_t *)error);
              if (v97)
              {
                uint64_t v98 = piston_gss_error(v97, v233, v94);
                BOOL v99 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
                if (!v98)
                {
                  if (v99) {
                    piston_gss_transact_cold_15();
                  }
                  goto LABEL_194;
                }
                if (v99) {
                  piston_gss_transact_cold_16();
                }
                goto LABEL_92;
              }
              CFErrorRef v135 = error[0];
              uint64_t v136 = *(void *)error[0];
              if (!*(void *)error[0])
              {
                BOOL v167 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
                if (v167) {
                  piston_gss_transact_cold_14(v167, v168, v169, v170, v171, v172, v173, v174);
                }
                goto LABEL_194;
              }
              if (v136 != 1 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
              {
                LODWORD(output_cred_handle.__sig) = 136315394;
                *(uint64_t *)((char *)&output_cred_handle.__sig + 4) = (uint64_t)"piston_gss_get_sessionkey";
                *(_WORD *)&output_cred_handle.__opaque[4] = 2048;
                *(void *)&output_cred_handle.__opaque[6] = v136;
                _os_log_error_impl(&dword_23F849000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s: Multiple keys received [%ld], using first key though.\n", (uint8_t *)&output_cred_handle, 0x16u);
                CFErrorRef v135 = error[0];
              }
              piston_set_session_key(v95, *(const void **)(*((void *)v135 + 1) + 8), **((_DWORD **)v135 + 1));
              gss_release_buffer_set(&v233, (gss_buffer_set_t *)error);
LABEL_184:

              if (gss_oid_equal(actual_mech_type, MEMORY[0x263F08E38]))
              {
                output_cred_handle.__sig = 0;
                if (gss_inquire_sec_context_by_oid(minor_status, *(gss_ctx_id_t *)(v2 + 120), MEMORY[0x263F08E08], (gss_buffer_set_t *)&output_cred_handle))
                {
                  if (piston_log_level && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
                    piston_gss_transact_cold_7();
                  }
                }
                else
                {
                  if (**(_DWORD **)(*(void *)(output_cred_handle.__sig + 8) + 8))
                  {
                    *(void *)(v2 + 552) |= 0x8000000uLL;
                    BOOL v208 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
                    if (v208) {
                      piston_gss_transact_cold_6(v208, v209, v210, v211, v212, v213, v214, v215);
                    }
                  }
                  else if (piston_log_level)
                  {
                    BOOL v216 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
                    if (v216) {
                      piston_gss_transact_cold_5(v216, v217, v218, v219, v220, v221, v222, v223);
                    }
                  }
                  gss_release_buffer_set(minor_status, (gss_buffer_set_t *)&output_cred_handle);
                }
              }
              uint64_t v14 = 0;
              goto LABEL_171;
            }
            if (!gss_oid_equal(v94, MEMORY[0x263F08E10]) && !gss_oid_equal(v94, MEMORY[0x263F08E18]))
            {
              BOOL v176 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
              if (v176) {
                piston_gss_transact_cold_4(v176, v177, v178, v179, v180, v181, v182, v183);
              }
              goto LABEL_194;
            }
            OM_uint32 v116 = gss_krb5_export_lucid_sec_context(&v233, (gss_ctx_id_t *)(v96 + 120), 1u, &rctx);
            if (v116)
            {
              uint64_t v98 = piston_gss_error(v116, v233, v94);
              BOOL v117 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
              if (!v98)
              {
                if (v117) {
                  piston_gss_transact_cold_12();
                }
                goto LABEL_194;
              }
              if (v117) {
                piston_gss_transact_cold_13();
              }
LABEL_92:
              free(v98);
LABEL_194:

LABEL_170:
              uint64_t v14 = 80;
LABEL_171:
              if (output_name) {
                gss_release_name(&minor_status[1], &output_name);
              }
              goto LABEL_173;
            }
            uint64_t v147 = rctx;
            if (*(_DWORD *)rctx == 1)
            {
              if ((piston_log_level & 4) != 0 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
                piston_gss_transact_cold_10();
              }
              int v148 = v147[8];
              if (v148 == 1)
              {
                if (v147[16]) {
                  uint64_t v157 = (uint64_t)(v147 + 22);
                }
                else {
                  uint64_t v157 = (uint64_t)(v147 + 18);
                }
LABEL_180:
                if ((piston_log_level & 4) != 0 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
                  piston_gss_transact_cold_8(v157, v201, v202, v203, v204, v205, v206, v207);
                }
                piston_set_session_key(v95, *(const void **)(v157 + 8), *(_DWORD *)(v157 + 4));
                gss_krb5_free_lucid_sec_context(&v233, rctx);
                goto LABEL_184;
              }
              if (!v148)
              {
                if ((piston_log_level & 4) != 0)
                {
                  BOOL v149 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
                  if (v149) {
                    piston_gss_transact_cold_9(v149, v150, v151, v152, v153, v154, v155, v156);
                  }
                }
                uint64_t v157 = (uint64_t)(v147 + 12);
                goto LABEL_180;
              }
              v175 = v147;
            }
            else
            {
              if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
                piston_gss_transact_cold_11();
              }
              v175 = 0;
            }
            gss_krb5_free_lucid_sec_context(&v233, v175);
            goto LABEL_194;
          }
          if (!gss_oid_equal(v5, MEMORY[0x263F08E38]))
          {
LABEL_61:
            uint64_t v14 = 22;
            goto LABEL_171;
          }
          uint64_t v76 = NSString;
          uint64_t v77 = [v1 sock];
          uint64_t v78 = [v77 serverName];
          id v27 = [v76 stringWithFormat:@"cifs@%@", v78];

          if ((piston_log_level & 4) != 0 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
            piston_gss_transact_cold_21(v27);
          }
          uint64_t v79 = [v1 sock];
          id v80 = [v79 serverName];
          input_name_buffer.value = (void *)[v80 cStringUsingEncoding:4];

          value = input_name_buffer.value;
        }
        input_name_buffer.length = strlen((const char *)value);
        OM_uint32 v29 = gss_import_name(&minor_status[1], &input_name_buffer, MEMORY[0x263F08DF8], &output_name);

        if (v29) {
          goto LABEL_20;
        }
        goto LABEL_44;
      }
      if (!v166) {
        goto LABEL_176;
      }
    }
    piston_gss_transact_cold_24();
    goto LABEL_176;
  }
  BOOL v6 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
  if (v6) {
    piston_gss_transact_cold_1(v6, v7, v8, v9, v10, v11, v12, v13);
  }
  uint64_t v14 = 57;
LABEL_173:

  return v14;
}

char *piston_gss_error(OM_uint32 status_value, OM_uint32 a2, gss_OID mech_type)
{
  status_string.value = 0;
  *(void *)message_content = 0;
  uint64_t v7 = 0;
  buffer.length = 0;
  status_string.length = 0;
  buffer.value = 0;
  if (!(gss_display_status(&message_content[1], status_value, 1, mech_type, message_content, &status_string) >> 16))
  {
    message_content[0] = 0;
    if (!(gss_display_status(&message_content[1], a2, 2, mech_type, message_content, &buffer) >> 16)
      && (asprintf(&v7, "gss-code: %lu %.*s -- mech-code: %lu %.*s", status_value, SLODWORD(status_string.length), (const char *)status_string.value, a2, SLODWORD(buffer.length), (const char *)buffer.value) < 0|| !v7))
    {
      uint64_t v7 = 0;
    }
  }
  gss_release_buffer(&message_content[1], &status_string);
  gss_release_buffer(&message_content[1], &buffer);
  return v7;
}

id piston_gss_get_realm()
{
  BOOL v6 = 0;
  krb5_context v7 = 0;
  krb5_error_code inited = krb5_init_context(&v7);
  if (inited)
  {
    printf("%s: krb5_init_context failed <%d> \n", "piston_gss_get_realm", inited);
LABEL_5:
    int v3 = 0;
    goto LABEL_6;
  }
  krb5_error_code default_realm = krb5_get_default_realm(v7, &v6);
  if (default_realm)
  {
    error_message = krb5_get_error_message(v7, default_realm);
    printf("%s: krb5_get_default_realm failed <%s> \n", "piston_gss_get_realm", error_message);
    krb5_free_error_message(v7, error_message);
    goto LABEL_5;
  }
  MEMORY[0x2455D44E0](v7);
  if (!v6) {
    goto LABEL_5;
  }
  id v5 = [NSString alloc];
  int v3 = (void *)[v5 initWithCString:v6 encoding:4];
LABEL_6:
  return v3;
}

uint64_t piston_gss_acquire_cred_complete(uint64_t a1, int a2, uint64_t a3, uint64_t a4, gss_OID_set_desc_struct *a5)
{
  gss_OID_set set = a5;
  OM_uint32 minor_status = 0;
  gss_release_oid_set(&minor_status, &set);
  *(void *)(a1 + 120) = a4;
  *(_DWORD *)(a1 + 116) = a2;
  pthread_mutex_lock((pthread_mutex_t *)a1);
  *(_DWORD *)(a1 + 112) = 1;
  pthread_cond_signal((pthread_cond_t *)(a1 + 64));
  return pthread_mutex_unlock((pthread_mutex_t *)a1);
}

void piston_negotiate(void *a1, void *a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7)
{
  id v13 = a1;
  unint64_t v14 = a2;
  unint64_t v15 = a3;
  uint64_t v16 = a7;
  uint64_t v17 = [v13 sock];

  if (v17) {
    [v13 setSock:0];
  }
  uint64_t v18 = objc_alloc_init(SMBSocket);
  [v13 setSock:v18];
  uint64_t v19 = [v13 sock];

  if (!v19)
  {
    BOOL v28 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v28)
    {
      piston_negotiate_cold_1(v28, v29, v30, v31, v32, v33, v34, v35);
      if (!v16) {
        goto LABEL_37;
      }
    }
    else if (!v16)
    {
      goto LABEL_37;
    }
    v16[2](v16, 12);
    goto LABEL_37;
  }
  if (v14 | v15)
  {
    uint64_t v36 = [v13 sock];
    [v36 setPort:a4];

    if (!v14)
    {
LABEL_30:
      if (v15)
      {
        uint64_t v58 = [v13 sock];
        [v58 setNetBiosName:v15];
      }
      OM_uint32 v59 = [v13 sock];
      [v59 setConnectTimeOut:a5];

      BOOL v60 = [v13 sock];
      uint64_t v61 = [v60 openSocket:v13];

      if (v61)
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          piston_negotiate_cold_3();
        }
        [v13 setSock:0];
        if (v16) {
          v16[2](v16, v61);
        }
      }
      else
      {
        uint64_t v62 = [v13 sock];
        uint64_t v63 = objc_msgSend(v62, "signing_queue");
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __piston_negotiate_block_invoke;
        block[3] = &unk_2650731E8;
        id v83 = v13;
        BOOL v84 = v16;
        uint64_t v85 = a6;
        dispatch_async(v63, block);
      }
      goto LABEL_37;
    }
    if ([(id)v14 containsString:@"["]
      && [(id)v14 containsString:@"]"]
      && [(id)v14 characterAtIndex:0] == 91)
    {
      uint64_t v37 = @"]";
    }
    else
    {
      uint64_t v37 = @":";
      if (![(id)v14 containsString:@":"]) {
        goto LABEL_28;
      }
    }
    uint64_t v38 = [(id)v14 componentsSeparatedByString:v37];
    if (v38)
    {
      uint64_t v39 = v38;
      uint64_t v81 = a6;
      uint64_t v40 = [v38 firstObject];
      if (v40)
      {
        id v41 = (void *)v40;
        uint64_t v42 = [v39 firstObject];
        uint64_t v43 = [v42 length];

        if (v43)
        {
          uint64_t v44 = [v39 firstObject];
          uint64_t v45 = [MEMORY[0x263F08708] characterSetWithCharactersInString:@"["];
          uint64_t v46 = [v44 stringByTrimmingCharactersInSet:v45];

          if (v46 && [v46 length])
          {
            gss_name_t v47 = [v13 sock];
            [v47 setServerName:v46];

            uint64_t v48 = [v39 objectAtIndex:1];
            if (v48
              && (CFUUIDRef v49 = (void *)v48,
                  [v39 objectAtIndex:1],
                  uint64_t v50 = objc_claimAutoreleasedReturnValue(),
                  uint64_t v51 = [v50 length],
                  v50,
                  v49,
                  v51))
            {
              id v52 = [v39 objectAtIndex:1];
              int v53 = [MEMORY[0x263F08708] characterSetWithCharactersInString:@":"];
              OM_uint32 v54 = [v52 stringByTrimmingCharactersInSet:v53];

              if (v54 && [v54 length])
              {
                id v80 = objc_alloc_init(MEMORY[0x263F08A30]);
                OM_uint32 v55 = [v80 numberFromString:v54];
                uint64_t v56 = [v55 unsignedShortValue];

                BOOL v57 = [v13 sock];
                [v57 setPort:v56];

                OM_uint32 v54 = 0;
              }
              a6 = v81;
            }
            else
            {
              a6 = v81;
            }
            goto LABEL_29;
          }
          BOOL v72 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
          if (v72)
          {
            piston_negotiate_cold_5(v72, v73, v74, v75, v76, v77, v78, v79);
            if (!v16) {
              goto LABEL_49;
            }
          }
          else if (!v16)
          {
LABEL_49:

            goto LABEL_50;
          }
          v16[2](v16, 22);
          goto LABEL_49;
        }
      }
      BOOL v64 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
      if (v64)
      {
        piston_negotiate_cold_4(v64, v65, v66, v67, v68, v69, v70, v71);
        if (!v16) {
          goto LABEL_50;
        }
      }
      else if (!v16)
      {
LABEL_50:

        goto LABEL_37;
      }
      v16[2](v16, 22);
      goto LABEL_50;
    }
LABEL_28:
    uint64_t v39 = [v13 sock];
    [v39 setServerName:v14];
LABEL_29:

    goto LABEL_30;
  }
  BOOL v20 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
  if (v20)
  {
    piston_negotiate_cold_2(v20, v21, v22, v23, v24, v25, v26, v27);
    if (!v16) {
      goto LABEL_37;
    }
    goto LABEL_7;
  }
  if (v16) {
LABEL_7:
  }
    v16[2](v16, 22);
LABEL_37:
}

void __piston_negotiate_block_invoke(uint64_t a1)
{
  uint64_t v56 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) getSessionPtr];
  int v3 = [*(id *)(a1 + 32) sock];
  uint64_t v4 = [v3 connectSocket];

  if (v4)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      __piston_negotiate_block_invoke_cold_3();
    }
    [*(id *)(a1 + 32) setSock:0];
    uint64_t v5 = *(void *)(a1 + 40);
    if (v5) {
      (*(void (**)(uint64_t, uint64_t))(v5 + 16))(v5, v4);
    }
    id v6 = 0;
    goto LABEL_18;
  }
  int v7 = *(_DWORD *)(v2 + 64);
  uint64_t v8 = *(void **)(a1 + 32);
  id v52 = 0;
  int v9 = smb2_rq_alloc(0, 0, 0, 0, v8, &v52);
  id v10 = v52;
  id v6 = v10;
  if (v9)
  {
    if (v10) {
      objc_msgSend(v10, "smb_rq_done");
    }
LABEL_10:
    uint64_t v11 = *(void *)(a1 + 40);
    if (!v11) {
      goto LABEL_18;
    }
    uint64_t v12 = *(void (**)(void))(v11 + 16);
LABEL_17:
    v12();
    goto LABEL_18;
  }
  uint64_t v13 = objc_msgSend(v10, "smb_rq_getrequest");
  mb_put_uint16le(v13, 36);
  if (!smb2_smb_get_client_dialects(v2, 0, (__int16 *)(v2 + 194), (__int16 *)(v2 + 196), 0x10uLL))
  {
    mb_put_uint16le(v13, *(_WORD *)(v2 + 194));
    __int16 client_security_mode = smb2_smb_get_client_security_mode(v2);
    *(_WORD *)(v2 + 192) = client_security_mode;
    mb_put_uint16le(v13, client_security_mode);
    mb_put_uint16le(v13, 0);
    int client_capabilities = smb2_smb_get_client_capabilities(v2);
    *(_DWORD *)(v2 + 172) = client_capabilities;
    mb_put_uint32le(v13, client_capabilities);
    *(_OWORD *)mb_reserve(v13, 0x10uLL) = *(_OWORD *)(v2 + 176);
    uint64_t v17 = (_DWORD *)mb_reserve(v13, 4uLL);
    uint64_t v18 = (_WORD *)mb_reserve(v13, 2uLL);
    mb_put_uint16le(v13, 0);
    LODWORD(v19) = *(unsigned __int16 *)(v2 + 194);
    if (*(_WORD *)(v2 + 194))
    {
      unint64_t v20 = 0;
      do
      {
        mb_put_uint16le(v13, *(_WORD *)(v2 + 196 + 2 * v20++));
        unint64_t v19 = *(unsigned __int16 *)(v2 + 194);
      }
      while (v20 < v19);
    }
    if ((*(unsigned char *)(v2 + 555) & 0x40) != 0) {
      goto LABEL_26;
    }
    int v21 = 2 * v19 + 36;
    int v22 = v21 & 6;
    if ((v21 & 6) != 0)
    {
      int v23 = 8 - v22;
      mb_put_mem(v13, 0, (8 - v22), 3);
      v21 += v23;
    }
    if ((*(unsigned char *)(v2 + 561) & 0x10) == 0)
    {
LABEL_26:
      _DWORD *v17 = 0;
      *uint64_t v18 = 0;
      goto LABEL_27;
    }
    uint64_t v43 = v18;
    uint64_t v30 = [*(id *)(a1 + 32) sock];
    id v31 = [v30 serverName];
    uint64_t v32 = [v31 cStringUsingEncoding:4];

    uint64_t v44 = (const char *)v32;
    if (!v32)
    {
      uint64_t v33 = [*(id *)(a1 + 32) sock];
      uint64_t v44 = (const char *)[v33 getIPv4IPv6DotName];
    }
    _DWORD *v17 = v21 + 64;
    uint64_t v53 = 0;
    arc4random_buf((void *)(v2 + 296), 0x20uLL);
    mb_put_uint16le(v13, 1);
    mb_put_uint16le(v13, 38);
    mb_put_uint32le(v13, 0);
    mb_put_uint16le(v13, 1);
    mb_put_uint16le(v13, 32);
    mb_put_uint16le(v13, 1);
    mb_put_mem(v13, (char *)(v2 + 296), 0x20uLL, 0);
    mb_put_mem(v13, 0, 2uLL, 3);
    uint64_t v34 = *(void *)(v2 + 560);
    int v35 = vaddvq_s32((int32x4_t)(*(_OWORD *)&vshlq_u32((uint32x4_t)vdupq_n_s32(v34), (uint32x4_t)xmmword_23F882880) & __PAIR128__(0xFFFFFF01FFFFFF01, 0xFFFFFF01FFFFFF01)));
    if (!v35)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)CCHmacContext buf = 136315138;
        OM_uint32 v55 = "smb2_smb_add_negotiate_contexts";
        _os_log_error_impl(&dword_23F849000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s: No encryption algorithm set? Assuming AES-128-CCM \n", buf, 0xCu);
        uint64_t v34 = *(void *)(v2 + 560);
      }
      *(void *)(v2 + 560) = v34 | 0x1000000;
      LOWORD(v35) = 1;
    }
    __int16 v36 = 2 * v35 + 2;
    mb_put_uint16le(v13, 2);
    mb_put_uint16le(v13, v36 & 0xFFFE);
    mb_put_uint32le(v13, 0);
    mb_put_uint16le(v13, v35);
    uint64_t v37 = *(void *)(v2 + 560);
    if ((v37 & 0x8000000) != 0)
    {
      mb_put_uint16le(v13, 4);
      uint64_t v37 = *(void *)(v2 + 560);
    }
    if ((v37 & 0x4000000) != 0)
    {
      mb_put_uint16le(v13, 3);
      uint64_t v37 = *(void *)(v2 + 560);
      if ((v37 & 0x2000000) == 0)
      {
LABEL_44:
        if ((v37 & 0x1000000) == 0)
        {
LABEL_46:
          if ((v36 & 6) != 0) {
            mb_put_mem(v13, 0, 8 - (v36 & 6u), 3);
          }
          mb_put_uint16le(v13, 3);
          mb_put_uint16le(v13, 10);
          mb_put_uint32le(v13, 0);
          mb_put_uint16le(v13, 1);
          mb_put_uint16le(v13, 0);
          mb_put_uint32le(v13, 0);
          mb_put_uint16le(v13, 0);
          mb_put_mem(v13, 0, 6uLL, 3);
          mb_put_uint16le(v13, 8);
          mb_put_uint16le(v13, 6);
          mb_put_uint32le(v13, 0);
          mb_put_uint16le(v13, 2);
          mb_put_uint16le(v13, 2);
          mb_put_uint16le(v13, 1);
          mb_put_mem(v13, 0, 2uLL, 3);
          mb_put_uint16le(v13, 5);
          uint64_t v38 = (_WORD *)mb_reserve(v13, 2uLL);
          mb_put_uint32le(v13, 0);
          if (v44)
          {
            size_t v39 = strlen(v44);
            uint64_t v40 = v13;
            id v41 = v44;
          }
          else
          {
            id v41 = "UnknownServer";
            uint64_t v40 = v13;
            size_t v39 = 13;
          }
          int v42 = smb_put_dmem(v40, v41, v39, 0, 1, &v53);
          *uint64_t v38 = v53;
          if (v42)
          {
            if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
              __piston_negotiate_block_invoke_cold_2();
            }
            goto LABEL_10;
          }
          *uint64_t v43 = 5;
LABEL_27:
          *(void *)(v2 + 552) |= 0x1000uLL;
          v45[0] = MEMORY[0x263EF8330];
          v45[1] = 3221225472;
          v45[2] = __piston_negotiate_block_invoke_9;
          v45[3] = &unk_2650731C0;
          uint64_t v24 = *(void **)(a1 + 32);
          id v25 = *(id *)(a1 + 40);
          uint64_t v26 = *(void *)(a1 + 48);
          id v47 = v25;
          uint64_t v48 = v26;
          id v6 = v6;
          uint64_t v49 = v2;
          uint64_t v50 = 0;
          int v51 = v7;
          id v46 = v6;
          uint64_t v27 = smb_rq_simple_block(v24, v6, v45);
          if (!v27)
          {
LABEL_33:

            goto LABEL_18;
          }
          uint64_t v28 = v27;
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
          {
            __piston_negotiate_block_invoke_cold_1();
            if (!v6)
            {
LABEL_31:
              uint64_t v29 = *(void *)(a1 + 40);
              if (v29) {
                (*(void (**)(uint64_t, uint64_t))(v29 + 16))(v29, v28);
              }
              goto LABEL_33;
            }
          }
          else if (!v6)
          {
            goto LABEL_31;
          }
          objc_msgSend(v6, "smb_rq_done");
          goto LABEL_31;
        }
LABEL_45:
        mb_put_uint16le(v13, 1);
        goto LABEL_46;
      }
    }
    else if ((v37 & 0x2000000) == 0)
    {
      goto LABEL_44;
    }
    mb_put_uint16le(v13, 2);
    if ((*(void *)(v2 + 560) & 0x1000000) == 0) {
      goto LABEL_46;
    }
    goto LABEL_45;
  }
  if (v6) {
    objc_msgSend(v6, "smb_rq_done");
  }
  uint64_t v14 = *(void *)(a1 + 40);
  if (v14)
  {
    uint64_t v12 = *(void (**)(void))(v14 + 16);
    goto LABEL_17;
  }
LABEL_18:
}

void __piston_negotiate_block_invoke_9(uint64_t a1, int a2)
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  uint64_t v4 = (void (**)(void, void))MEMORY[0x2455D48A0](*(void *)(a1 + 40));
  uint64_t v5 = (id *)(a1 + 32);
  **(_DWORD **)(a1 + 48) = objc_msgSend(*(id *)(a1 + 32), "sr_ntstatus");
  if (a2)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      __piston_negotiate_block_invoke_9_cold_6((id *)(a1 + 32), a2);
    }
LABEL_17:
    uint64_t v11 = 45;
    goto LABEL_18;
  }
  id v6 = *v5;
  size_t size = 0;
  int v30 = 0;
  uint64_t v7 = objc_msgSend(v6, "sr_sessionp");
  uint64_t v8 = (__n128 *)objc_msgSend(v6, "smb_rq_getreply");
  if (md_get_uint16le(v8, (_WORD *)&size + 3)) {
    goto LABEL_14;
  }
  if (HIWORD(size) != 65)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      __piston_negotiate_block_invoke_9_cold_5();
    }
    goto LABEL_14;
  }
  if (md_get_uint16le(v8, (_WORD *)(v7 + 108)))
  {
LABEL_14:

LABEL_15:
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      __piston_negotiate_block_invoke_9_cold_1();
    }
    goto LABEL_17;
  }
  __int16 v9 = *(_WORD *)(v7 + 108);
  if (v9) {
    *(void *)(v7 + 552) |= 4uLL;
  }
  if ((v9 & 2) != 0)
  {
    uint64_t v10 = *(void *)(v7 + 552) | 8;
    goto LABEL_24;
  }
  uint64_t v10 = *(void *)(v7 + 552);
  if (*(unsigned char *)(v7 + 561)) {
LABEL_24:
  }
    v10 |= 8uLL;
  *(void *)(v7 + 552) = v10 | 3;
  if (md_get_uint16le(v8, (_WORD *)(v7 + 70))) {
    goto LABEL_14;
  }
  unsigned int v12 = *(unsigned __int16 *)(v7 + 70);
  if (v12 > 0x2FF)
  {
    switch(v12)
    {
      case 0x300u:
        uint64_t v13 = 6144;
        break;
      case 0x311u:
        uint64_t v13 = 135168;
        break;
      case 0x302u:
        uint64_t v13 = 36864;
        break;
      default:
        goto LABEL_64;
    }
  }
  else
  {
    switch(v12)
    {
      case 0x202u:
        uint64_t v13 = 12288;
        break;
      case 0x210u:
        uint64_t v13 = 20480;
        break;
      case 0x2FFu:
        uint64_t v13 = 4096;
        break;
      default:
LABEL_64:
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          __piston_negotiate_block_invoke_9_cold_2();
        }
        goto LABEL_14;
    }
  }
  *(void *)(v7 + 552) |= v13;
  if (md_get_uint16le(v8, &size)) {
    goto LABEL_14;
  }
  if (md_get_mem(v8, (char *)(v7 + 92), 16, 0)) {
    goto LABEL_14;
  }
  uint64_t v14 = (unsigned int *)(v7 + 76);
  if (md_get_uint32le(v8, (_DWORD *)(v7 + 76))) {
    goto LABEL_14;
  }
  unsigned int v15 = *v14;
  if ((*v14 & 2) == 0)
  {
    if (piston_log_level && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)CCHmacContext buf = 136315138;
      uint64_t v33 = "smb2_smb_parse_negotiate";
      _os_log_error_impl(&dword_23F849000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s: Server does not support leasing but supports dir leases? Disabling dir leases. \n", buf, 0xCu);
      unsigned int v15 = *v14;
    }
    *uint64_t v14 = v15 & 0xFFFFFFDF;
  }
  if ((*(unsigned char *)(v7 + 553) & 0xC8) != 0 && (v15 & 2) != 0)
  {
    uint64_t v16 = objc_msgSend(v6, "sr_pd");
    uint64_t v17 = [v16 sock];
    unsigned int v18 = objc_msgSend(v17, "resp_wait_timeout");

    if (v18 <= 0x2C)
    {
      unint64_t v19 = objc_msgSend(v6, "sr_pd");
      unint64_t v20 = [v19 sock];
      objc_msgSend(v20, "setResp_wait_timeout:", 45);

      if (piston_log_level)
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          __piston_negotiate_block_invoke_9_cold_4(v6);
        }
      }
    }
  }
  if (md_get_uint32le(v8, (_DWORD *)(v7 + 80))
    || md_get_uint32le(v8, (_DWORD *)(v7 + 84))
    || md_get_uint32le(v8, (_DWORD *)(v7 + 88))
    || md_get_mem(v8, __dst, 8, 0)
    || md_get_mem(v8, v34, 8, 0)
    || md_get_uint16le(v8, (_WORD *)&size + 2)
    || md_get_uint16le(v8, (_WORD *)&size + 1)
    || md_get_uint32le(v8, &v30))
  {
    goto LABEL_14;
  }
  if (WORD2(size))
  {
    WORD2(size) -= 128;
    if (md_get_mem(v8, 0, WORD2(size), 0)) {
      goto LABEL_14;
    }
    int v21 = WORD2(size) + 64;
  }
  else
  {
    int v21 = 64;
  }
  int v22 = *(void **)(v7 + 144);
  if (v22)
  {
    free(v22);
    *(void *)(v7 + 144) = 0;
  }
  *(void *)(v7 + 136) = 0;
  if (WORD1(size))
  {
    int v23 = (char *)malloc_type_malloc(WORD1(size), 0xBA86BDD5uLL);
    *(void *)(v7 + 144) = v23;
    if (v23)
    {
      uint64_t v24 = WORD1(size);
      *(void *)(v7 + 136) = WORD1(size);
      if (!md_get_mem(v8, v23, v24, 0))
      {
        piston_gss_parse_server_mechs(v7);
        int v25 = 0;
        v21 += WORD1(size);
        goto LABEL_75;
      }
      goto LABEL_14;
    }
    int v25 = 12;
  }
  else
  {
    int v25 = 0;
  }
LABEL_75:
  if ((*(unsigned char *)(v7 + 554) & 2) != 0) {
    int v25 = smb2_smb_parse_negotiate_contexts(v7, v8, v21, v30, (unsigned __int16)size);
  }

  if (v25) {
    goto LABEL_15;
  }
  if (*(_DWORD *)(a1 + 68) == 1
    && *(_DWORD *)(a1 + 72) != *(_DWORD *)(*(void *)(a1 + 56) + 64)
    && piston_log_level
    && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    __piston_negotiate_block_invoke_9_cold_3((int *)(a1 + 72), a1 + 56);
  }
  uint64_t v26 = *(void *)(a1 + 48);
  uint64_t v11 = 0;
  if (v26)
  {
    uint64_t v27 = *(void *)(a1 + 56);
    *(_WORD *)(v26 + 4) = *(_WORD *)(v27 + 108);
    *(_DWORD *)(v26 + 6) = *(_DWORD *)(v27 + 70);
    *(_OWORD *)(v26 + 16) = *(_OWORD *)(v27 + 92);
    uint64_t v29 = *(void *)(a1 + 48);
    uint64_t v28 = *(void *)(a1 + 56);
    *(_OWORD *)(v29 + 32) = *(_OWORD *)(v28 + 76);
    *(_DWORD *)(v29 + 48) = *(_DWORD *)(v28 + 112);
  }
LABEL_18:
  if (*v5) {
    objc_msgSend(*v5, "smb_rq_done");
  }
  if (v4) {
    v4[2](v4, v11);
  }
}

uint64_t smb2_smb_parse_negotiate_contexts(uint64_t a1, __n128 *a2, int a3, int a4, int a5)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  int v27 = 0;
  int v28 = 0;
  int v25 = 0;
  int v26 = 0;
  __int16 v24 = 0;
  int v22 = 0;
  int v23 = 0;
  memset(v21, 0, sizeof(v21));
  if (a1)
  {
    if (a4)
    {
      uint64_t result = md_get_mem(a2, 0, (a4 - a3 - 64), 0);
      if (result) {
        return result;
      }
    }
    __int16 v9 = &_os_log_internal;
    while (1)
    {
      md_shadow_copy(a2, v21);
      uint64_t result = md_get_uint16le(v21, (_WORD *)&v28 + 1);
      if (result) {
        return result;
      }
      uint64_t result = md_get_uint16le(v21, &v28);
      if (result) {
        return result;
      }
      uint64_t result = md_get_uint32le(v21, 0);
      if (result) {
        return result;
      }
      switch(HIWORD(v28))
      {
        case 1:
          uint64_t result = md_get_uint16le(v21, (_WORD *)&v27 + 1);
          if (result) {
            return result;
          }
          uint64_t result = md_get_uint16le(v21, &v27);
          if (result) {
            return result;
          }
          if (!HIWORD(v27)) {
            goto LABEL_15;
          }
          int v10 = 0;
          while (1)
          {
            uint64_t result = md_get_uint16le(v21, (_WORD *)&v26 + 1);
            if (result) {
              return result;
            }
            if (++v10 >= HIWORD(v27))
            {
LABEL_15:
              uint64_t result = md_get_mem(v21, 0, (unsigned __int16)v27, 0);
              if (!result) {
                goto LABEL_36;
              }
              return result;
            }
          }
        case 2:
          uint64_t result = md_get_uint16le(v21, &v26);
          if (!result)
          {
            if ((unsigned __int16)v26 != 1)
            {
              if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
                smb2_smb_parse_negotiate_contexts_cold_2();
              }
              return 72;
            }
            uint64_t result = md_get_uint16le(v21, (_WORD *)&v25 + 1);
            if (!result)
            {
              *(_WORD *)(a1 + 492) = HIWORD(v25);
              goto LABEL_36;
            }
          }
          return result;
        case 3:
          uint64_t result = md_get_uint16le(v21, &v25);
          if (!result)
          {
            uint64_t result = md_get_uint16le(v21, 0);
            if (!result)
            {
              uint64_t result = md_get_uint32le(v21, &v23);
              if (!result)
              {
                if (!(_WORD)v25) {
                  goto LABEL_36;
                }
                int v11 = 0;
                while (1)
                {
                  uint64_t result = md_get_uint16le(v21, &v24);
                  if (result) {
                    break;
                  }
                  if (++v11 >= (unsigned __int16)v25) {
                    goto LABEL_36;
                  }
                }
              }
            }
          }
          return result;
        case 6:
        case 7:
          goto LABEL_36;
        case 8:
          uint64_t result = md_get_uint16le(v21, (_WORD *)&v22 + 1);
          if (result) {
            return result;
          }
          if (HIWORD(v22) != 1)
          {
            if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
              smb2_smb_parse_negotiate_contexts_cold_4();
            }
            return 72;
          }
          uint64_t result = md_get_uint16le(v21, &v22);
          if (result) {
            return result;
          }
          if ((unsigned __int16)v22 - 3 <= 0xFFFFFFFD)
          {
            if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
              smb2_smb_parse_negotiate_contexts_cold_3();
            }
            return 22;
          }
          *(_WORD *)(a1 + 264) = v22;
LABEL_36:
          if (!(_WORD)--a5) {
            return 0;
          }
          if ((v28 & 7) != 0) {
            unsigned __int16 v12 = ((v28 + 8) & 0xFFF8) + 8;
          }
          else {
            unsigned __int16 v12 = v28 + 8;
          }
          LOWORD(v28) = v12;
          uint64_t result = md_get_mem(a2, 0, v12, 0);
          if (result) {
            return result;
          }
          break;
        default:
          if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)CCHmacContext buf = 136315394;
            int v30 = "smb2_smb_parse_negotiate_contexts";
            __int16 v31 = 1024;
            int v32 = HIWORD(v28);
            _os_log_error_impl(&dword_23F849000, v9, OS_LOG_TYPE_ERROR, "%s: Unknown context type: 0x%x\n", buf, 0x12u);
          }
          goto LABEL_36;
      }
    }
  }
  BOOL v13 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
  if (v13) {
    smb2_smb_parse_negotiate_contexts_cold_1(v13, v14, v15, v16, v17, v18, v19, v20);
  }
  return 22;
}

uint64_t decode_MechType(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F992C0](&asn1_MechType, 0, a1, a2, a3, a4);
}

uint64_t encode_MechType(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F992C8](&asn1_MechType, a1, a2, a3, a4);
}

uint64_t length_MechType(uint64_t a1)
{
  return MEMORY[0x270F992D8](&asn1_MechType, a1);
}

uint64_t free_MechType(uint64_t a1)
{
  return MEMORY[0x270F992D0](&asn1_MechType, a1);
}

uint64_t copy_MechType(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270F992B8](&asn1_MechType, a1, a2);
}

uint64_t decode_MechTypeList(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F992C0](&asn1_MechTypeList, 0, a1, a2, a3, a4);
}

uint64_t encode_MechTypeList(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F992C8](&asn1_MechTypeList, a1, a2, a3, a4);
}

uint64_t length_MechTypeList(uint64_t a1)
{
  return MEMORY[0x270F992D8](&asn1_MechTypeList, a1);
}

uint64_t free_MechTypeList(uint64_t a1)
{
  return MEMORY[0x270F992D0](&asn1_MechTypeList, a1);
}

uint64_t copy_MechTypeList(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270F992B8](&asn1_MechTypeList, a1, a2);
}

uint64_t decode_ContextFlags(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F992C0](&asn1_ContextFlags, 0, a1, a2, a3, a4);
}

uint64_t encode_ContextFlags(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F992C8](&asn1_ContextFlags, a1, a2, a3, a4);
}

uint64_t length_ContextFlags(uint64_t a1)
{
  return MEMORY[0x270F992D8](&asn1_ContextFlags, a1);
}

uint64_t free_ContextFlags(uint64_t a1)
{
  return MEMORY[0x270F992D0](&asn1_ContextFlags, a1);
}

uint64_t copy_ContextFlags(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270F992B8](&asn1_ContextFlags, a1, a2);
}

uint64_t ContextFlags2int(char a1)
{
  return a1 & 0x7F;
}

uint64_t int2ContextFlags(char a1)
{
  return a1 & 0x7F;
}

uint64_t decode_NegHints(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F992C0](&asn1_NegHints, 0, a1, a2, a3, a4);
}

uint64_t encode_NegHints(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F992C8](&asn1_NegHints, a1, a2, a3, a4);
}

uint64_t length_NegHints(uint64_t a1)
{
  return MEMORY[0x270F992D8](&asn1_NegHints, a1);
}

uint64_t free_NegHints(uint64_t a1)
{
  return MEMORY[0x270F992D0](&asn1_NegHints, a1);
}

uint64_t copy_NegHints(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270F992B8](&asn1_NegHints, a1, a2);
}

uint64_t decode_NegTokenInitWin(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F992C0](&asn1_NegTokenInitWin, 0, a1, a2, a3, a4);
}

uint64_t encode_NegTokenInitWin(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F992C8](&asn1_NegTokenInitWin, a1, a2, a3, a4);
}

uint64_t length_NegTokenInitWin(uint64_t a1)
{
  return MEMORY[0x270F992D8](&asn1_NegTokenInitWin, a1);
}

uint64_t free_NegTokenInitWin(uint64_t a1)
{
  return MEMORY[0x270F992D0](&asn1_NegTokenInitWin, a1);
}

uint64_t copy_NegTokenInitWin(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270F992B8](&asn1_NegTokenInitWin, a1, a2);
}

uint64_t decode_NegTokenInit(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F992C0](&asn1_NegTokenInit, 0, a1, a2, a3, a4);
}

uint64_t encode_NegTokenInit(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F992C8](&asn1_NegTokenInit, a1, a2, a3, a4);
}

uint64_t length_NegTokenInit(uint64_t a1)
{
  return MEMORY[0x270F992D8](&asn1_NegTokenInit, a1);
}

uint64_t free_NegTokenInit(uint64_t a1)
{
  return MEMORY[0x270F992D0](&asn1_NegTokenInit, a1);
}

uint64_t copy_NegTokenInit(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270F992B8](&asn1_NegTokenInit, a1, a2);
}

uint64_t decode_NegResultEnum(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F992C0](&asn1_NegResultEnum, 0, a1, a2, a3, a4);
}

uint64_t encode_NegResultEnum(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F992C8](&asn1_NegResultEnum, a1, a2, a3, a4);
}

uint64_t length_NegResultEnum(uint64_t a1)
{
  return MEMORY[0x270F992D8](&asn1_NegResultEnum, a1);
}

uint64_t free_NegResultEnum(uint64_t a1)
{
  return MEMORY[0x270F992D0](&asn1_NegResultEnum, a1);
}

uint64_t copy_NegResultEnum(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270F992B8](&asn1_NegResultEnum, a1, a2);
}

uint64_t decode_NegTokenResp(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F992C0](&asn1_NegTokenResp, 0, a1, a2, a3, a4);
}

uint64_t encode_NegTokenResp(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F992C8](&asn1_NegTokenResp, a1, a2, a3, a4);
}

uint64_t length_NegTokenResp(uint64_t a1)
{
  return MEMORY[0x270F992D8](&asn1_NegTokenResp, a1);
}

uint64_t free_NegTokenResp(uint64_t a1)
{
  return MEMORY[0x270F992D0](&asn1_NegTokenResp, a1);
}

uint64_t copy_NegTokenResp(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270F992B8](&asn1_NegTokenResp, a1, a2);
}

uint64_t decode_NegotiationToken(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F992C0](&asn1_NegotiationToken, 0, a1, a2, a3, a4);
}

uint64_t encode_NegotiationToken(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F992C8](&asn1_NegotiationToken, a1, a2, a3, a4);
}

uint64_t length_NegotiationToken(uint64_t a1)
{
  return MEMORY[0x270F992D8](&asn1_NegotiationToken, a1);
}

uint64_t free_NegotiationToken(uint64_t a1)
{
  return MEMORY[0x270F992D0](&asn1_NegotiationToken, a1);
}

uint64_t copy_NegotiationToken(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270F992B8](&asn1_NegotiationToken, a1, a2);
}

uint64_t decode_NegotiationTokenWin(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F992C0](&asn1_NegotiationTokenWin, 0, a1, a2, a3, a4);
}

uint64_t encode_NegotiationTokenWin(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F992C8](&asn1_NegotiationTokenWin, a1, a2, a3, a4);
}

uint64_t length_NegotiationTokenWin(uint64_t a1)
{
  return MEMORY[0x270F992D8](&asn1_NegotiationTokenWin, a1);
}

uint64_t free_NegotiationTokenWin(uint64_t a1)
{
  return MEMORY[0x270F992D0](&asn1_NegotiationTokenWin, a1);
}

uint64_t copy_NegotiationTokenWin(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270F992B8](&asn1_NegotiationTokenWin, a1, a2);
}

void piston_set_info_cold_1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  int v0 = 136315138;
  id v1 = "piston_set_info";
  _os_log_error_impl(&dword_23F849000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s: sock is NULL. \n", (uint8_t *)&v0, 0xCu);
}

void piston_set_info_cold_2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v0, "%s: smb2_smb_set_info failed <%d> \n", v1, v2, v3, v4, 2u);
}

void smb2_smb_set_info_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v0, "%s: Bad struct size: %u\n", v1, v2, v3, v4, 2u);
}

void smb2_smb_set_info_cold_2(uint8_t *buf, int a2, int a3)
{
  *(_DWORD *)CCHmacContext buf = 136315650;
  *(void *)(buf + 4) = "smb2_smb_set_info";
  *((_WORD *)buf + 6) = 1024;
  *(_DWORD *)(buf + 14) = a2;
  *((_WORD *)buf + 9) = 1024;
  *((_DWORD *)buf + 5) = a3;
  _os_log_error_impl(&dword_23F849000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s: Reply failed <%d> ntStatus <0x%x> \n", buf, 0x18u);
}

void smb2_smb_set_info_cold_3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v0, "%s: smb_rq_simple_block failed <%d> \n", v1, v2, v3, v4, 2u);
}

void smb2_smb_set_info_cold_4()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v0, "%s: Unknown file info class: %d\n", v1, v2, v3, v4, 2u);
}

void smb2_smb_set_info_cold_5()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v0, "%s: error %d from smb_put_dmem for name\n", v1, v2, v3, v4, 2u);
}

void __smb2_smb_set_info_block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v0, "%s: Bad struct size: %u\n", v1, v2, v3, v4, 2u);
}

void __smb2_smb_set_info_block_invoke_cold_2(id *a1)
{
  objc_msgSend(*a1, "sr_ntstatus");
  OUTLINED_FUNCTION_4(&dword_23F849000, &_os_log_internal, v1, "%s: Reply failed <%d> ntStatus <0x%x> \n", v2, v3, v4, v5, 2u);
}

void smb2fs_smb_set_delete_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4(&dword_23F849000, &_os_log_internal, v0, "%s: smb2_smb_set_info failed %d ntstatus %d\n", v1, v2, v3, v4, 2u);
}

void smb2fs_smb_set_eof_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4(&dword_23F849000, &_os_log_internal, v0, "%s: smb2_smb_set_info failed %d ntstatus %d\n", v1, v2, v3, v4, 2u);
}

void smb2fs_smb_setfattrNT_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void smb2fs_smb_setfattrNT_cold_2(void *a1)
{
  [a1 shareID];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v1, "%s: share_id <%d> not found. \n", v2, v3, v4, v5, 2u);
}

void smb2fs_smb_setfattrNT_cold_3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4(&dword_23F849000, &_os_log_internal, v0, "%s: smb2_smb_set_info failed %d ntstatus %d\n", v1, v2, v3, v4, 2u);
}

void piston_read_cold_1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  int v0 = 136315138;
  uint64_t v1 = "piston_read";
  _os_log_error_impl(&dword_23F849000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s: sock is NULL. \n", (uint8_t *)&v0, 0xCu);
}

void piston_read_cold_2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v0, "%s: smb2_smb_read_one failed <%d> \n", v1, v2, v3, v4, 2u);
}

void smb2_smb_read_one_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v0, "%s: smb_rq_simple_block failed <%d> \n", v1, v2, v3, v4, 2u);
}

void piston_write_cold_1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  int v0 = 136315138;
  uint64_t v1 = "piston_write";
  _os_log_error_impl(&dword_23F849000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s: sock is NULL. \n", (uint8_t *)&v0, 0xCu);
}

void piston_write_cold_2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v0, "%s: smb2_smb_write_one failed <%d> \n", v1, v2, v3, v4, 2u);
}

void smb2_smb_write_one_cold_1(void *a1)
{
  [a1 length];
  OUTLINED_FUNCTION_4(&dword_23F849000, &_os_log_internal, v1, "%s: Not enough data in ioBuffer <%d> < <%d> \n", v2, v3, v4, v5, 2u);
}

void smb2_smb_write_one_cold_2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v0, "%s: smb_rq_simple_block failed <%d> \n", v1, v2, v3, v4, 2u);
}

void smb2_smb_write_one_cold_3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v0, "%s: mb_put_mem failed <%d> \n", v1, v2, v3, v4, 2u);
}

void smb2_smb_parse_read_one_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v0, "%s: md_get_mem failed %d\n", v1, v2, v3, v4, 2u);
}

void smb2_smb_parse_read_one_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v0, "%s: Bad struct size: %u\n", v1, v2, v3, v4, 2u);
}

void smb2_smb_parse_write_one_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v0, "%s: Bad struct size: %u\n", v1, v2, v3, v4, 2u);
}

void __smb2_smb_read_one_block_invoke_cold_1(id *a1)
{
  objc_msgSend(*a1, "sr_ntstatus");
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_4(&dword_23F849000, &_os_log_internal, v1, "%s: Reply failed <%d> ntStatus <0x%x> \n", v2, v3, v4, v5, 2u);
}

void __smb2_smb_write_one_block_invoke_cold_1(id *a1)
{
  objc_msgSend(*a1, "sr_ntstatus");
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_4(&dword_23F849000, &_os_log_internal, v1, "%s: Reply failed <%d> ntStatus <0x%x> \n", v2, v3, v4, v5, 2u);
}

void piston_query_dir_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void piston_query_dir_cold_2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v0, "%s: smb2_smb_query_info failed <%d> \n", v1, v2, v3, v4, 2u);
}

void smb2_smb_query_dir_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void smb2_smb_query_dir_cold_2(uint8_t *buf, int a2, int a3)
{
  *(_DWORD *)CCHmacContext buf = 136315650;
  *(void *)(buf + 4) = "smb2_smb_query_dir";
  *((_WORD *)buf + 6) = 1024;
  *(_DWORD *)(buf + 14) = a2;
  *((_WORD *)buf + 9) = 1024;
  *((_DWORD *)buf + 5) = a3;
  _os_log_error_impl(&dword_23F849000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s: Reply failed <%d> ntStatus <0x%x> \n", buf, 0x18u);
}

void smb2_smb_query_dir_cold_3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v0, "%s: smb_rq_simple_block failed <%d> \n", v1, v2, v3, v4, 2u);
}

void smb2_smb_query_dir_cold_4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void smb2_smb_query_dir_cold_5()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v0, "%s: error 0x%x from smb_put_dmem for name\n", v1, v2, v3, v4, 2u);
}

void smb2_smb_parse_query_dir_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v0, "%s: md_get_mem failed %d\n", v1, v2, v3, v4, 2u);
}

void smb2_smb_parse_query_dir_cold_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void smb2_smb_parse_query_dir_cold_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void smb2_smb_parse_query_dir_cold_4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void smb2_smb_parse_query_dir_cold_5()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v0, "%s: Bad struct size: %u\n", v1, v2, v3, v4, 2u);
}

void smb2_smb_parse_query_dir_cold_6(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __smb2_smb_query_dir_block_invoke_cold_1(id *a1)
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  objc_msgSend(*a1, "sr_ntstatus");
  v1[0] = 136315650;
  OUTLINED_FUNCTION_2_0();
  _os_log_error_impl(&dword_23F849000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s: Reply failed <%d> ntStatus <0x%x> \n", (uint8_t *)v1, 0x18u);
}

void piston_change_notify_cold_1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  int v0 = 136315138;
  uint64_t v1 = "piston_change_notify";
  _os_log_error_impl(&dword_23F849000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s: sock is NULL. \n", (uint8_t *)&v0, 0xCu);
}

void piston_change_notify_cold_2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v0, "%s: smb2_smb_change_notify failed <%d> \n", v1, v2, v3, v4, 2u);
}

void piston_change_notify_cold_3(uint8_t *buf, int a2, int a3)
{
  *(_DWORD *)CCHmacContext buf = 136315650;
  *(void *)(buf + 4) = "smb2_smb_change_notify";
  *((_WORD *)buf + 6) = 1024;
  *(_DWORD *)(buf + 14) = a2;
  *((_WORD *)buf + 9) = 1024;
  *((_DWORD *)buf + 5) = a3;
  _os_log_error_impl(&dword_23F849000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s: Reply failed <%d> ntStatus <0x%x> \n", buf, 0x18u);
}

void piston_change_notify_cold_4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v0, "%s: smb_rq_simple_block failed <%d> \n", v1, v2, v3, v4, 2u);
}

void smb2_smb_parse_change_notify_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v0, "%s: md_get_mem failed %d\n", v1, v2, v3, v4, 2u);
}

void smb2_smb_parse_change_notify_cold_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __smb2_smb_change_notify_block_invoke_cold_1(id *a1, int a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  int v3 = objc_msgSend(*a1, "sr_ntstatus");
  int v4 = 136315650;
  uint64_t v5 = "smb2_smb_change_notify_block_invoke";
  __int16 v6 = 1024;
  int v7 = a2;
  __int16 v8 = 1024;
  int v9 = v3;
  _os_log_error_impl(&dword_23F849000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s: Reply failed <%d> ntStatus <0x%x> \n", (uint8_t *)&v4, 0x18u);
}

void piston_query_info_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v0, "%s: smb2_smb_query_info failed <%d> \n", v1, v2, v3, v4, 2u);
}

void smb2_smb_query_info_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void smb2_smb_query_info_cold_2()
{
  OUTLINED_FUNCTION_6(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v0, "%s: Unknown info_type: %d\n", v1, v2, v3, v4, 2u);
}

void smb2_smb_query_info_cold_3()
{
  OUTLINED_FUNCTION_6(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v0, "%s: Unknown SMB2_0_INFO_FILE/file_info_class: %d\n", v1, v2, v3, v4, 2u);
}

void smb2_smb_query_info_cold_4(uint8_t *buf, int a2, int a3)
{
  *(_DWORD *)CCHmacContext buf = 136315650;
  *(void *)(buf + 4) = "smb2_smb_query_info";
  *((_WORD *)buf + 6) = 1024;
  *(_DWORD *)(buf + 14) = a2;
  *((_WORD *)buf + 9) = 1024;
  *((_DWORD *)buf + 5) = a3;
  _os_log_error_impl(&dword_23F849000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s: Reply failed <%d> ntStatus <0x%x> \n", buf, 0x18u);
}

void smb2_smb_query_info_cold_5()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v0, "%s: smb_rq_simple_block failed <%d> \n", v1, v2, v3, v4, 2u);
}

void smb2_smb_query_info_cold_6()
{
  OUTLINED_FUNCTION_6(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v0, "%s: Unknown SMB2_0_INFO_FILESYSTEM/file_info_class: %d\n", v1, v2, v3, v4, 2u);
}

void smb2_smb_query_info_cold_7()
{
  OUTLINED_FUNCTION_6(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v0, "%s: Unknown SMB2_0_INFO_SECURITY/file_info_class: %d\n", v1, v2, v3, v4, 2u);
}

void piston_query_share_info_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __piston_query_share_info_block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v0, "%s: share_id <%d> not found. \n", v1, v2, v3, v4, 2u);
}

void __piston_query_share_info_block_invoke_cold_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __piston_query_share_info_block_invoke_cold_3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v0, "%s: smb2_smb_close_fid failed %d\n", v1, v2, v3, v4, 2u);
}

void __piston_query_share_info_block_invoke_cold_4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v0, "%s: smb2_smb_query_info failed for fs_attr <%d> \n", v1, v2, v3, v4, 2u);
}

void __piston_query_share_info_block_invoke_cold_5()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v0, "%s: smb2_smb_query_info failed for fs_size <%d> \n", v1, v2, v3, v4, 2u);
}

void __piston_query_share_info_block_invoke_cold_6()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v0, "%s: smb2_smb_create_fid failed %d\n", v1, v2, v3, v4, 2u);
}

void __piston_query_share_info_block_invoke_cold_7()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v0, "%s: commonInit failed %d \n", v1, v2, v3, v4, 2u);
}

void smb2_smb_parse_query_info_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void smb2_smb_parse_query_info_cold_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void smb2_smb_parse_query_info_cold_4()
{
  OUTLINED_FUNCTION_5(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v0, "%s: Illegal file name len %d\n", v1, v2, v3, v4, 2u);
}

void smb2_smb_parse_query_info_cold_5(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_23F849000, &_os_log_internal, a3, "%s: smbfs_ntwrkname_tolocal returned NULL\n", a5, a6, a7, a8, 2u);
}

void smb2_smb_parse_query_info_cold_8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void smb2_smb_parse_query_info_cold_9()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v0, "%s: Bad struct size: %u\n", v1, v2, v3, v4, 2u);
}

void smb2_smb_parse_file_all_info_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void smb2_smb_parse_file_all_info_cold_2()
{
  OUTLINED_FUNCTION_4_0();
  _os_log_error_impl(v0, v1, v2, v3, v4, 0x20u);
}

void smb2_smb_parse_file_all_info_cold_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void smb2_smb_parse_file_all_info_cold_4()
{
  OUTLINED_FUNCTION_5(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v0, "%s: Illegal file name len %d\n", v1, v2, v3, v4, 2u);
}

void smb2_smb_parse_file_all_info_cold_5(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_23F849000, &_os_log_internal, a3, "%s: smbfs_ntwrkname_tolocal returned NULL. Bad path from server? \n", a5, a6, a7, a8, 2u);
}

void smb2_smb_parse_fs_attr_cold_1(void *a1)
{
  [a1 shareID];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v1, "%s: share_id <%d> not found. \n", v2, v3, v4, v5, 2u);
}

void smb2_smb_parse_fs_attr_cold_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void smb2_smb_parse_fs_attr_cold_3(void *a1)
{
  id v2 = [a1 sharename];
  [v2 cStringUsingEncoding:4];
  objc_msgSend(a1, "file_system_attrs");
  objc_msgSend(a1, "max_component_name_len");
  [a1 fstype];
  OUTLINED_FUNCTION_4_0();
  _os_log_error_impl(v3, v4, v5, v6, v7, 0x32u);
}

void smb2_smb_parse_fs_attr_cold_4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_23F849000, &_os_log_internal, a3, "%s: smbfs_ntwrkname_tolocal return NULL\n", a5, a6, a7, a8, 2u);
}

void smb2_smb_parse_fs_attr_cold_5()
{
  OUTLINED_FUNCTION_5(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v0, "%s: Illegal file name len %u\n", v1, v2, v3, v4, 2u);
}

void smb2_smb_parse_fs_size_cold_1(void *a1)
{
  [a1 shareID];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v1, "%s: treeID <%d> not found. \n", v2, v3, v4, v5, 2u);
}

void smb2_smb_parse_security_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void smb2_smb_parse_security_cold_2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v0, "%s: md_get_mem failed %d\n", v1, v2, v3, v4, 2u);
}

void smb2_smb_parse_security_cold_3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4_0();
  _os_log_error_impl(v0, v1, v2, v3, v4, 0x1Cu);
}

void __smb2_smb_query_info_block_invoke_cold_1(id *a1)
{
  objc_msgSend(*a1, "sr_ntstatus");
  OUTLINED_FUNCTION_4_0();
  _os_log_error_impl(v1, v2, v3, v4, v5, 0x18u);
}

void smb2fs_smb_listxattrs_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void smb2fs_smb_listxattrs_cold_2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v0, "%s: smb2_smb_query_info failed, error: %d\n", v1, v2, v3, v4, 2u);
}

void smb2fs_smb_listxattrs_cold_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void mbuf_free_cold_1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  int v0 = 136315138;
  uint64_t v1 = "mbuf_free";
  _os_log_error_impl(&dword_23F849000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s: Double FREE", (uint8_t *)&v0, 0xCu);
}

void mbuf_split_cold_1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  int v0 = 136315138;
  uint64_t v1 = "mbuf_split";
  _os_log_error_impl(&dword_23F849000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s: src is null \n", (uint8_t *)&v0, 0xCu);
}

void mbuf_split_cold_2(uint64_t *a1, uint64_t a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v2 = *a1;
  int v3 = 136315650;
  uint64_t v4 = "mbuf_split";
  __int16 v5 = 2048;
  uint64_t v6 = a2;
  __int16 v7 = 2048;
  uint64_t v8 = v2;
  _os_log_error_impl(&dword_23F849000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s: offset %zu > src->m_maxlen %zu \n", (uint8_t *)&v3, 0x20u);
}

void mbuf_split_cold_3(int a1)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  int v1 = 136315394;
  uint64_t v2 = "mbuf_split";
  __int16 v3 = 1024;
  int v4 = a1;
  _os_log_error_impl(&dword_23F849000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s: smb_mbuf_get failed <%d> \n", (uint8_t *)&v1, 0x12u);
}

uint64_t mb_reserve_cold_1(uint8_t *buf, uint64_t a2, uint64_t a3, char a4)
{
  *(_DWORD *)CCHmacContext buf = 136315650;
  *(void *)(buf + 4) = "mb_reserve";
  *((_WORD *)buf + 6) = 2048;
  *(void *)(buf + 14) = a2;
  *((_WORD *)buf + 11) = 2048;
  *((void *)buf + 3) = a3;
  _os_log_error_impl(&dword_23F849000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s: mb_reserve: size (%ld) > mbuf_maxlen (%ld)", buf, 0x20u);
  return a4 & 1;
}

void md_get_mem_cold_1(uint64_t a1, uint64_t a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  int v2 = 136315650;
  __int16 v3 = "md_get_mem";
  __int16 v4 = 2048;
  uint64_t v5 = a1;
  __int16 v6 = 2048;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_23F849000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s: WARNING: Incomplete copy original size_t size = %ld size_t size = %ld\n", (uint8_t *)&v2, 0x20u);
}

void piston_tree_connect_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void piston_tree_connect_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v0, "%s: smb2_smb_tree_connect failed <%d> \n", v1, v2, v3, v4, 2u);
}

void smb2_smb_tree_connect_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void smb2_smb_tree_connect_cold_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void smb2_smb_tree_connect_cold_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void smb2_smb_tree_connect_cold_4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v0, "%s: error %d from smb_put_dmem for share name\n", v1, v2, v3, v4, 2u);
}

void smb2_smb_tree_connect_cold_5()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v0, "%s: error %d from smb_put_dmem for back slash\n", v1, v2, v3, v4, 2u);
}

void smb2_smb_tree_connect_cold_6()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v0, "%s: error %d from smb_put_dmem for srvr name\n", v1, v2, v3, v4, 2u);
}

void smb2_smb_tree_connect_cold_7(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void smb2_smb_tree_connect_cold_8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __piston_tree_connect_block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v0, "%s: smb2_smb_tree_connect with IP address failed <%d> \n", v1, v2, v3, v4, 2u);
}

void __piston_tree_connect_block_invoke_cold_2(uint64_t a1, int a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
  int v3 = 136315650;
  uint64_t v4 = "piston_tree_connect_block_invoke";
  __int16 v5 = 1024;
  int v6 = a2;
  __int16 v7 = 2080;
  uint64_t v8 = v2;
  _os_log_error_impl(&dword_23F849000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s: treeconnect failed <%d> with server name <%s> \n", (uint8_t *)&v3, 0x1Cu);
}

void piston_tree_disconnect_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void piston_tree_disconnect_cold_2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_23F849000, &_os_log_internal, v0, "%s: smb2_smb_tree_disconnect failed <%d> for share_id <%d>\n", v1, v2, v3, v4, 2u);
}

void piston_tree_disconnect_cold_3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v0, "%s: share_id <%d> not found. \n", v1, v2, v3, v4, 2u);
}

void piston_tree_disconnect_cold_4(void *a1)
{
  objc_msgSend(a1, "tree_id");
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v1, "%s: tree_id <%d> is invalid. \n", v2, v3, v4, v5, 2u);
}

void piston_tree_disconnect_cold_5()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v0, "%s: smb_rq_simple_block failed <%d> \n", v1, v2, v3, v4, 2u);
}

void __smb2_smb_tree_connect_block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v0, "%s: Bad struct size: %u\n", v1, v2, v3, v4, 2u);
}

void __smb2_smb_tree_connect_block_invoke_cold_2(id *a1)
{
  objc_msgSend(*a1, "sr_ntstatus");
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_4(&dword_23F849000, &_os_log_internal, v1, "%s: Reply failed <%d> ntStatus <0x%x> \n", v2, v3, v4, v5, 2u);
}

void __smb2_smb_tree_disconnect_block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v0, "%s: Bad struct size: %u\n", v1, v2, v3, v4, 2u);
}

void __smb2_smb_tree_disconnect_block_invoke_cold_2(id *a1)
{
  objc_msgSend(*a1, "sr_ntstatus");
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_4(&dword_23F849000, &_os_log_internal, v1, "%s: Reply failed <%d> ntStatus <0x%x> \n", v2, v3, v4, v5, 2u);
}

void piston_logoff_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void piston_logoff_cold_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void piston_logoff_cold_3(void *a1, int a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  int v2 = 136315650;
  uint64_t v3 = "piston_logoff";
  __int16 v4 = 1024;
  int v5 = a2;
  __int16 v6 = 1024;
  int v7 = objc_msgSend(a1, "sr_ntstatus");
  _os_log_error_impl(&dword_23F849000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s: Reply failed <%d> ntStatus <0x%x> \n", (uint8_t *)&v2, 0x18u);
}

void piston_session_setup_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __piston_session_setup_block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v0, "%s: reset keys due to <%d> \n", v1, v2, v3, v4, 2u);
}

void __piston_session_setup_block_invoke_cold_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __piston_session_setup_block_invoke_cold_3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v0, "%s: piston_gss_transact failed <%d>\n", v1, v2, v3, v4, 2u);
}

void __piston_session_setup_block_invoke_cold_4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v0, "%s: smb3_verify_session_setup returned %d. \n", v1, v2, v3, v4, 2u);
}

void __piston_session_setup_block_invoke_cold_5(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __piston_session_setup_block_invoke_cold_6(uint64_t a1, int a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  int v2 = *(_DWORD *)(*(void *)a1 + 16);
  int v3 = 136315650;
  uint64_t v4 = "piston_session_setup_block_invoke";
  __int16 v5 = 1024;
  int v6 = a2;
  __int16 v7 = 1024;
  int v8 = v2;
  _os_log_error_impl(&dword_23F849000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s: smb2_smb_gss_session_setup failed <%d> NT Status<0x%x> \n", (uint8_t *)&v3, 0x18u);
}

void __piston_session_setup_block_invoke_cold_7(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __piston_session_setup_block_invoke_cold_8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __piston_session_setup_block_invoke_cold_9(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __piston_session_setup_block_invoke_cold_10(id *a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v1 = [*a1 realm];
  int v2 = 136315394;
  int v3 = "piston_session_setup_block_invoke";
  __int16 v4 = 2080;
  uint64_t v5 = [v1 cStringUsingEncoding:4];
  _os_log_error_impl(&dword_23F849000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s: Using realm <%s> \n", (uint8_t *)&v2, 0x16u);
}

void __piston_session_setup_block_invoke_cold_11(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __piston_session_setup_block_invoke_cold_12(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void piston_ntstatus_to_errno_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v0, "%s: Couldn't map ntstatus (0x%x) to errno returning EIO\n", v1, v2, v3, v4, 2u);
}

void piston_set_session_key_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void piston_set_session_key_cold_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void smb_convert_network_to_path_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v0, "%s: smb_convert_from_network = %d\n", v1, v2, v3, v4, 2u);
}

void smb_convert_from_network_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void smb_convert_from_network_cold_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void smb_convert_from_network_cold_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void smb_convert_from_network_cold_4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void smb_convert_from_network_cold_5(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void smb_convert_from_network_cold_6()
{
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_0(&dword_23F849000, &_os_log_internal, v0, "%s: CFStringCreateMutableCopy failed for <%s>\n", v1, v2, v3, v4, 2u);
}

void smb_convert_from_network_cold_7(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void smb_convert_from_network_cold_8()
{
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_1_0(&dword_23F849000, &_os_log_internal, v0, "%s: calloc failed for encode_len <%lu>\n", v1, v2, v3, v4, 2u);
}

void smb_convert_from_network_cold_9(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void smb_convert_from_network_cold_10(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void smb_convert_to_network_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void smb_convert_to_network_cold_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void smb_convert_to_network_cold_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void smb_convert_to_network_cold_4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void smb_convert_to_network_cold_5(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void smb_convert_to_network_cold_6()
{
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_0(&dword_23F849000, &_os_log_internal, v0, "%s: CFStringCreateWithCString failed for <%s>\n", v1, v2, v3, v4, 2u);
}

void smb_convert_to_network_cold_7()
{
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_0(&dword_23F849000, &_os_log_internal, v0, "%s: CFStringCreateMutableCopy failed for <%s>\n", v1, v2, v3, v4, 2u);
}

void smb_convert_to_network_cold_8()
{
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_0(&dword_23F849000, &_os_log_internal, v0, "%s: CFStringGetBytes failed to get len for <%s>\n", v1, v2, v3, v4, 2u);
}

void smb_convert_to_network_cold_9(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void smb_convert_to_network_cold_10()
{
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_0(&dword_23F849000, &_os_log_internal, v0, "%s: CFStringGetBytes failed for <%s>\n", v1, v2, v3, v4, 2u);
}

void smb2_smb_get_alloc_size_cold_1(void *a1)
{
  [a1 shareID];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v1, "%s: share_id <%d> not found. \n", v2, v3, v4, v5, 2u);
}

void smb2_smb_get_alloc_size_cold_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void smb2_smb_get_client_capabilities_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void smb2_smb_get_client_dialects_cold_1()
{
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_1_0(&dword_23F849000, &_os_log_internal, v0, "%s: Not enough space for dialects %ld \n", v1, v2, v3, v4, 2u);
}

void smb2_smb_get_client_dialects_cold_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void smb2_smb_get_client_dialects_cold_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void smb2_smb_get_client_security_mode_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void smb2fs_smb_file_id_check_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void piston_get_create_options_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v0, "%s: share_id <%d> not found. \n", v1, v2, v3, v4, 2u);
}

void piston_get_create_options_cold_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void piston_close_file_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void piston_close_file_cold_2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v0, "%s: smb2_smb_close failed <%d> \n", v1, v2, v3, v4, 2u);
}

void smb2_smb_close_cold_1(_DWORD *a1, int a2, int a3)
{
  *a1 = 136315650;
  OUTLINED_FUNCTION_7((uint64_t)a1, a2, a3, (uint64_t)"smb2_smb_close");
  _os_log_error_impl(&dword_23F849000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s: Reply failed <%d> ntStatus <0x%x> \n", v3, 0x18u);
}

void smb2_smb_close_cold_2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v0, "%s: smb_rq_simple_block failed <%d> \n", v1, v2, v3, v4, 2u);
}

void smb2_smb_close_cold_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void piston_create_file_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void piston_create_file_cold_2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v0, "%s: smb2_smb_create failed <%d> \n", v1, v2, v3, v4, 2u);
}

void smb2_smb_create_cold_1(_DWORD *a1, int a2, int a3)
{
  *a1 = 136315650;
  OUTLINED_FUNCTION_7((uint64_t)a1, a2, a3, (uint64_t)"smb2_smb_create");
  _os_log_error_impl(&dword_23F849000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s: Reply failed <%d> ntStatus <0x%x> \n", v3, 0x18u);
}

void smb2_smb_create_cold_2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v0, "%s: smb_rq_simple_block failed <%d> \n", v1, v2, v3, v4, 2u);
}

void smb2_smb_create_cold_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void smb2_smb_create_cold_4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void smb2_smb_create_cold_5(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void smb2_smb_create_cold_6()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v0, "%s: error %d from smb_put_dmem for name\n", v1, v2, v3, v4, 2u);
}

void piston_resolveID_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void piston_resolveID_cold_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __piston_resolveID_block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v0, "%s: share_id <%d> not found. \n", v1, v2, v3, v4, 2u);
}

void __piston_resolveID_block_invoke_cold_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __piston_resolveID_block_invoke_cold_3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v0, "%s: smb2_smb_close_fid failed %d\n", v1, v2, v3, v4, 2u);
}

void __piston_resolveID_block_invoke_cold_4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v0, "%s: smb2_smb_create_fid failed %d\n", v1, v2, v3, v4, 2u);
}

void __piston_resolveID_block_invoke_cold_5()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v0, "%s: commonInit failed %d \n", v1, v2, v3, v4, 2u);
}

void smb2_smb_close_fid_cold_1()
{
  OUTLINED_FUNCTION_5(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_4(&dword_23F849000, &_os_log_internal, v0, "%s: smb2_smb_close failed %d ntstatus 0x%x\n", v1, v2, v3, v4, 2u);
}

void smb2_smb_parse_close_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v0, "%s: Bad struct size: %u\n", v1, v2, v3, v4, 2u);
}

void __smb2_smb_close_block_invoke_cold_1(id *a1)
{
  objc_msgSend(*a1, "sr_ntstatus");
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_4(&dword_23F849000, &_os_log_internal, v1, "%s: Reply failed <%d> ntStatus <0x%x> \n", v2, v3, v4, v5, 2u);
}

void smb2_smb_parse_create_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void smb2_smb_parse_create_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v0, "%s: Bad struct size: %u\n", v1, v2, v3, v4, 2u);
}

void __smb2_smb_create_block_invoke_cold_1(id *a1)
{
  objc_msgSend(*a1, "sr_ntstatus");
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_4(&dword_23F849000, &_os_log_internal, v1, "%s: Reply failed <%d> ntStatus <0x%x> \n", v2, v3, v4, v5, 2u);
}

void smb2_smb_parse_create_contexts_cold_1()
{
  OUTLINED_FUNCTION_5(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v0, "%s: Unknown context name: 0x%x\n", v1, v2, v3, v4, 2u);
}

void smb2_smb_parse_create_contexts_cold_2()
{
  OUTLINED_FUNCTION_5(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v0, "%s: Illegal MxAc data len: %u\n", v1, v2, v3, v4, 2u);
}

void smb2_smb_parse_create_contexts_cold_3()
{
  OUTLINED_FUNCTION_5(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v0, "%s: Illegal RqLs data len: %u\n", v1, v2, v3, v4, 2u);
}

void smb2_smb_parse_create_contexts_cold_4(uint8_t *a1, void *a2, uint64_t a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "smb2_smb_parse_create_contexts";
  OUTLINED_FUNCTION_4_2(&dword_23F849000, &_os_log_internal, a3, "%s: Received lease V2 response for a lease V1 request \n", a1);
}

void smb2_smb_parse_create_contexts_cold_5(uint8_t *a1, void *a2, uint64_t a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "smb2_smb_parse_create_contexts";
  OUTLINED_FUNCTION_4_2(&dword_23F849000, &_os_log_internal, a3, "%s: Received lease V1 response for a lease V2 request \n", a1);
}

void smb2_smb_parse_create_contexts_cold_6(uint8_t *a1, void *a2, uint64_t a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "smb2_smb_parse_create_contexts";
  OUTLINED_FUNCTION_4_2(&dword_23F849000, &_os_log_internal, a3, "%s: Received Durable Handle V1 response for a Durable Handle V2 request \n", a1);
}

void smb2_smb_parse_create_contexts_cold_7()
{
  OUTLINED_FUNCTION_5(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v0, "%s: Illegal DHnQ data len: %u\n", v1, v2, v3, v4, 2u);
}

void smb2_smb_parse_create_contexts_cold_8(uint8_t *a1, void *a2, uint64_t a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "smb2_smb_parse_create_contexts";
  OUTLINED_FUNCTION_4_2(&dword_23F849000, &_os_log_internal, a3, "%s: Server unexpectedly granted persistent handle??? \n", a1);
}

void smb2_smb_parse_create_contexts_cold_9(uint8_t *a1, void *a2, uint64_t a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "smb2_smb_parse_create_contexts";
  OUTLINED_FUNCTION_4_2(&dword_23F849000, &_os_log_internal, a3, "%s: Server failed to grant persistent handle??? \n", a1);
}

void smb2_smb_parse_create_contexts_cold_10(uint8_t *a1, void *a2, uint64_t a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "smb2_smb_parse_create_contexts";
  OUTLINED_FUNCTION_4_2(&dword_23F849000, &_os_log_internal, a3, "%s: Persistent handle granted \n", a1);
}

void smb2_smb_parse_create_contexts_cold_11(uint8_t *a1, void *a2, uint64_t a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "smb2_smb_parse_create_contexts";
  OUTLINED_FUNCTION_4_2(&dword_23F849000, &_os_log_internal, a3, "%s: Received Durable Handle V2 response for a Durable Handle V1 request \n", a1);
}

void smb2_smb_parse_create_contexts_cold_12()
{
  OUTLINED_FUNCTION_5(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v0, "%s: Illegal DH2Q data len: %u\n", v1, v2, v3, v4, 2u);
}

void smb2_smb_parse_create_contexts_cold_13()
{
  OUTLINED_FUNCTION_5(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v0, "%s: Illegal AAPL data len: %u\n", v1, v2, v3, v4, 2u);
}

void smb2_smb_parse_create_contexts_cold_14()
{
  OUTLINED_FUNCTION_5(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v0, "%s: Unknown AAPL subcommand: %d\n", v1, v2, v3, v4, 2u);
}

void smb2_smb_parse_create_contexts_cold_15()
{
  OUTLINED_FUNCTION_5(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v0, "%s: Illegal AAPL data len (cmd/pad): %u\n", v1, v2, v3, v4, 2u);
}

void smb2_smb_parse_create_contexts_cold_16()
{
  OUTLINED_FUNCTION_5(*MEMORY[0x263EF8340]);
  uint64_t v1 = *v0;
  int v3 = 136315650;
  uint64_t v4 = "smb2_smb_parse_create_contexts";
  __int16 v5 = 1024;
  int v6 = v2;
  __int16 v7 = 2048;
  uint64_t v8 = v1;
  _os_log_error_impl(&dword_23F849000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s: Illegal kAAPL_SERVER_QUERY data len: %u, reply_bitmap 0x%llx\n", (uint8_t *)&v3, 0x1Cu);
}

void smb2_smb_parse_create_contexts_cold_17(uint8_t *a1, void *a2, uint64_t a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "smb2_smb_parse_create_contexts";
  OUTLINED_FUNCTION_4_2(&dword_23F849000, &_os_log_internal, a3, "%s: Found an OS X server\n", a1);
}

void smb2_smb_parse_create_contexts_cold_18(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void smb2_smb_parse_create_contexts_cold_19()
{
  OUTLINED_FUNCTION_5(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v0, "%s: Illegal kAAPL_RESOLVE_ID data len (cmd/pad): %u\n", v1, v2, v3, v4, 2u);
}

void smb2_smb_parse_create_contexts_cold_20()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v0, "%s: Illegal context name length: %u\n", v1, v2, v3, v4, 2u);
}

void smb2_smb_parse_create_str_cold_1()
{
  OUTLINED_FUNCTION_5(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_23F849000, &_os_log_internal, v0, "%s: Illegal string len <%d> > <%d>\n", v1, v2, v3, v4, 2u);
}

void smb2_smb_parse_create_str_cold_2()
{
  OUTLINED_FUNCTION_5(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v0, "%s: Malloc failed for model string %d\n", v1, v2, v3, v4, 2u);
}

void smb2_smb_parse_create_str_cold_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_23F849000, &_os_log_internal, a3, "%s: smbfs_ntwrkname_tolocal return NULL\n", a5, a6, a7, a8, 2u);
}

void smb2_smb_parse_create_str_cold_4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v0, "%s: smb_convert_network_to_path failed %d\n", v1, v2, v3, v4, 2u);
}

void piston_lease_break_ack_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void piston_lease_break_ack_cold_2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v0, "%s: smb2_smb_lease_break_ack failed <%d> \n", v1, v2, v3, v4, 2u);
}

void smb2_smb_lease_break_ack_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v0, "%s: treeID <%d> not found. \n", v1, v2, v3, v4, 2u);
}

void smb2_smb_lease_break_ack_cold_2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v0, "%s: smb_rq_simple_block failed <%d> \n", v1, v2, v3, v4, 2u);
}

void __smb2_smb_lease_break_ack_block_invoke_cold_1(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v1 = *(void *)(*(void *)a1 + 8);
  uint64_t v2 = *(void *)(*(void *)a1 + 16);
  uint64_t v4 = *(void *)(*(void *)a1 + 32);
  uint64_t v3 = *(void *)(*(void *)a1 + 40);
  int v5 = 136316162;
  int v6 = "smb2_smb_lease_break_ack_block_invoke";
  __int16 v7 = 2048;
  uint64_t v8 = v1;
  __int16 v9 = 2048;
  uint64_t v10 = v2;
  __int16 v11 = 2048;
  uint64_t v12 = v4;
  __int16 v13 = 2048;
  uint64_t v14 = v3;
  _os_log_error_impl(&dword_23F849000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s: Lease key mismatch: 0x%llx:0x%llx != 0x%llx:0x%llx\n", (uint8_t *)&v5, 0x34u);
}

void __smb2_smb_lease_break_ack_block_invoke_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v0, "%s: Bad struct size: %u\n", v1, v2, v3, v4, 2u);
}

void __smb2_smb_lease_break_ack_block_invoke_cold_3(id *a1, int a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  int v3 = objc_msgSend(*a1, "sr_ntstatus");
  int v4 = 136315650;
  int v5 = "smb2_smb_lease_break_ack_block_invoke";
  __int16 v6 = 1024;
  int v7 = a2;
  __int16 v8 = 1024;
  int v9 = v3;
  _os_log_error_impl(&dword_23F849000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s: Reply failed <%d> ntStatus <0x%x> \n", (uint8_t *)&v4, 0x18u);
}

void smb2_smb_parse_lease_break_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void smb2_smb_parse_lease_break_cold_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void smb2_smb_parse_lease_break_cold_3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v0, "%s: Bad struct size: %u\n", v1, v2, v3, v4, 2u);
}

void smb2_smb_parse_lease_break_cold_4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v0, "%s: smb2_rq_parse_header failed %d for lease break \n", v1, v2, v3, v4, 2u);
}

void piston_lock_cold_1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  int v0 = 136315138;
  uint64_t v1 = "piston_lock";
  _os_log_error_impl(&dword_23F849000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s: sock is NULL. \n", (uint8_t *)&v0, 0xCu);
}

void piston_lock_cold_2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v0, "%s: smb2_smb_lock failed <%d> \n", v1, v2, v3, v4, 2u);
}

void piston_lock_cold_3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v0, "%s: smb_rq_simple_block failed <%d> \n", v1, v2, v3, v4, 2u);
}

void piston_lock_cold_4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v0, "%s: Unknown lock type %d\n", v1, v2, v3, v4, 2u);
}

void __smb2_smb_lock_block_invoke_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __smb2_smb_lock_block_invoke_cold_2(id *a1, int a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  int v3 = objc_msgSend(*a1, "sr_ntstatus");
  int v4 = 136315650;
  int v5 = "smb2_smb_lock_block_invoke";
  __int16 v6 = 1024;
  int v7 = a2;
  __int16 v8 = 1024;
  int v9 = v3;
  _os_log_error_impl(&dword_23F849000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s: Reply failed <%d> ntStatus <0x%x> \n", (uint8_t *)&v4, 0x18u);
}

void piston_ioctl_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v0, "%s: smb2_smb_ioctl failed <%d> \n", v1, v2, v3, v4, 2u);
}

void smb2_smb_ioctl_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v0, "%s: share_id <%d> not found. \n", v1, v2, v3, v4, 2u);
}

void smb2_smb_ioctl_cold_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void smb2_smb_ioctl_cold_3()
{
  OUTLINED_FUNCTION_5(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v0, "%s: Unsupported ioctl: %d\n", v1, v2, v3, v4, 2u);
}

void smb2_smb_ioctl_cold_4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void smb2_smb_ioctl_cold_5(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void smb2_smb_ioctl_cold_6(uint8_t *buf, int a2, int a3)
{
  *(_DWORD *)CCHmacContext buf = 136315650;
  *(void *)(buf + 4) = "smb2_smb_ioctl";
  *((_WORD *)buf + 6) = 1024;
  *(_DWORD *)(buf + 14) = a2;
  *((_WORD *)buf + 9) = 1024;
  *((_DWORD *)buf + 5) = a3;
  _os_log_error_impl(&dword_23F849000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s: Reply failed <%d> ntStatus <0x%x> \n", buf, 0x18u);
}

void smb2_smb_ioctl_cold_7()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v0, "%s: smb_rq_simple_block failed <%d> \n", v1, v2, v3, v4, 2u);
}

void smb2_smb_ioctl_cold_8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void smb2_smb_ioctl_cold_9(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void smb2_smb_ioctl_cold_10(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void smb2_smb_ioctl_cold_11(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void smb2_smb_ioctl_cold_12(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void smb2_smb_ioctl_cold_13(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void smb2_smb_ioctl_cold_15(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void smb2_smb_ioctl_cold_16(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void smb2_smb_ioctl_cold_17(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void piston_validate_negotiate_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void piston_validate_negotiate_cold_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void piston_validate_negotiate_cold_3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v0, "%s: Dialect count too high <%hu>? \n", v1, v2, v3, v4, 2u);
}

void piston_validate_negotiate_cold_4()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v0, "%s: smb2_smb_ioctl failed <%d> \n", v1, v2, v3, v4, 2u);
}

void __piston_validate_negotiate_block_invoke_cold_1()
{
  OUTLINED_FUNCTION_9(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v0, "%s: smb2_smb_ioctl failed %d\n", v1, v2, v3, v4, 2u);
}

void __piston_validate_negotiate_block_invoke_cold_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __piston_validate_negotiate_block_invoke_cold_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __piston_validate_negotiate_block_invoke_cold_7(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __piston_validate_negotiate_block_invoke_cold_8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __piston_validate_negotiate_block_invoke_cold_9(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __piston_validate_negotiate_block_invoke_cold_10()
{
  OUTLINED_FUNCTION_9(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v0, "%s: Server does not fully support Validate Negotiate %d\n", v1, v2, v3, v4, 2u);
}

void smb2_smb_parse_ioctl_internal_cold_1()
{
  OUTLINED_FUNCTION_5(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v0, "%s: Unsupported ret ioctl: %d\n", v1, v2, v3, v4, 2u);
}

void smb2_smb_parse_ioctl_internal_cold_2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v0, "%s: md_get_mem failed %d\n", v1, v2, v3, v4, 2u);
}

void smb2_smb_parse_ioctl_internal_cold_3()
{
  OUTLINED_FUNCTION_5(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v0, "%s: flags is supposed to be 0: %u\n", v1, v2, v3, v4, 2u);
}

void smb2_smb_parse_ioctl_internal_cold_4()
{
  OUTLINED_FUNCTION_5(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v0, "%s: ret_input_len is supposed to be 0: %u\n", v1, v2, v3, v4, 2u);
}

void smb2_smb_parse_ioctl_internal_cold_5()
{
  OUTLINED_FUNCTION_5(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v0, "%s: ret_output_len is supposed to be 32, got: %u\n", v1, v2, v3, v4, 2u);
}

void smb2_smb_parse_ioctl_internal_cold_7()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v0, "%s: smb2_smb_parse_copychunk_response failed, error: %d\n", v1, v2, v3, v4, 2u);
}

void smb2_smb_parse_ioctl_internal_cold_8()
{
  OUTLINED_FUNCTION_5(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v0, "%s: ret_output_len is supposed to be 12, got: %u\n", v1, v2, v3, v4, 2u);
}

void smb2_smb_parse_ioctl_internal_cold_10()
{
  OUTLINED_FUNCTION_5(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v0, "%s: Validate Neg output buffer too small: %d\n", v1, v2, v3, v4, 2u);
}

void smb2_smb_parse_ioctl_internal_cold_11()
{
  OUTLINED_FUNCTION_5(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v0, "%s: output_count is supposed to be 24, got: %u\n", v1, v2, v3, v4, 2u);
}

void smb2_smb_parse_ioctl_internal_cold_12()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v0, "%s: Bad struct size: %u\n", v1, v2, v3, v4, 2u);
}

void __smb2_smb_ioctl_block_invoke_cold_1(id *a1, int a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  int v3 = objc_msgSend(*a1, "sr_ntstatus");
  int v4 = 136315650;
  int v5 = "smb2_smb_ioctl_block_invoke";
  __int16 v6 = 1024;
  int v7 = a2;
  __int16 v8 = 1024;
  int v9 = v3;
  _os_log_error_impl(&dword_23F849000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s: Reply failed <%d> ntStatus <0x%x> \n", (uint8_t *)&v4, 0x18u);
}

void smb2_smb_parse_ioctl_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void piston_server_copy_file_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v0, "%s: share_id <%d> not found. \n", v1, v2, v3, v4, 2u);
}

void piston_server_copy_file_cold_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void piston_server_copy_file_cold_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void piston_server_copy_file_cold_4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v0, "%s: smb2_smb_close_fid failed (src) %d\n", v1, v2, v3, v4, 2u);
}

void piston_server_copy_file_cold_5()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v0, "%s: smb2fs_smb_listxattrs failed %d\n", v1, v2, v3, v4, 2u);
}

void piston_server_copy_file_cold_6()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v0, "%s: smb2_smb_create_fid failed (src file) %d\n", v1, v2, v3, v4, 2u);
}

void piston_server_copy_file_cold_7()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v0, "%s: commonInit failed %d \n", v1, v2, v3, v4, 2u);
}

void piston_server_copy_file_cold_8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void piston_server_copy_file_cold_10(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void smb2fs_smb_copyfile_stream_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v0, "%s: share_id <%d> not found. \n", v1, v2, v3, v4, 2u);
}

void smb2fs_smb_copyfile_stream_cold_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void smb2fs_smb_copyfile_stream_cold_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void smb2fs_smb_copyfile_stream_cold_4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void smb2fs_smb_copyfile_stream_cold_5(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void smb2fs_smb_copyfile_stream_cold_7(void *a1)
{
  [a1 length];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v1, "%s: Resume key too short %d \n", v2, v3, v4, v5, 2u);
}

void smb2fs_smb_copyfile_stream_cold_10()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v0, "%s: smb2_smb_ioctl failed to get resume key, error: %d\n", v1, v2, v3, v4, 2u);
}

void smb2fs_smb_copyfile_stream_cold_11()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v0, "%s: smb2_smb_close_fid failed (src) %d\n", v1, v2, v3, v4, 2u);
}

void smb2fs_smb_copyfile_stream_cold_12()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v0, "%s: smb2_smb_create_fid failed (targ file) %d\n", v1, v2, v3, v4, 2u);
}

void smb2fs_smb_copyfile_stream_cold_13()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v0, "%s: smb2_smb_create_fid failed (src file) %d\n", v1, v2, v3, v4, 2u);
}

void smb2fs_smb_copyfile_stream_cold_14()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v0, "%s: commonInit failed %d \n", v1, v2, v3, v4, 2u);
}

void smb2fs_smb_check_copyfile_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void smb2fs_smb_check_copyfile_cold_2(void *a1)
{
  [a1 length];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v1, "%s: Resume key too short %d \n", v2, v3, v4, v5, 2u);
}

void smb2fs_smb_check_copyfile_cold_3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v0, "%s: smb2_smb_ioctl failed to get resume key, error: %d\n", v1, v2, v3, v4, 2u);
}

void smb2_smb_parse_get_reparse_point_cold_1()
{
  OUTLINED_FUNCTION_5(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v0, "%s: Bad reparse tag: %u\n", v1, v2, v3, v4, 2u);
}

void smb2_smb_parse_get_resume_key_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v0, "%s: md_get_mem failed %d\n", v1, v2, v3, v4, 2u);
}

void smb2_smb_parse_copychunk_response_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v0, "%s: md_get_mem failed %d\n", v1, v2, v3, v4, 2u);
}

void __smb2fs_smb_copyfile_win_block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v0, "%s: smb2fs_smb_copyfile_win_xattr failed %d \n", v1, v2, v3, v4, 2u);
}

void __smb2fs_smb_copyfile_win_xattr_block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v0, "%s: smb2fs_smb_copyfile_stream failed %d \n", v1, v2, v3, v4, 2u);
}

void __smb2fs_smb_copyfile_stream_block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v0, "%s: smb2_smb_close_fid failed (tgt) %d\n", v1, v2, v3, v4, 2u);
}

void __smb2fs_smb_copyfile_stream_block_invoke_cold_2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v0, "%s: smb2_smb_close_fid failed (src) %d\n", v1, v2, v3, v4, 2u);
}

void __smb2fs_smb_copyfile_stream_block_invoke_cold_3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v0, "%s: failed setting mtime: %d\n", v1, v2, v3, v4, 2u);
}

void __smb2fs_smb_copyfile_stream_block_invoke_cold_4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v0, "%s: failed setting target eof, error: %d\n", v1, v2, v3, v4, 2u);
}

void __smb2fs_smb_copyfile_stream_block_invoke_cold_5()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v0, "%s: smb2fs_smb_copychunks failed %d\n", v1, v2, v3, v4, 2u);
}

void __smb2fs_smb_copychunks_block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v0, "%s: copychunk result: nt_stat: 0x%0x\n", v1, v2, v3, v4, 2u);
}

void __smb2fs_smb_copychunks_block_invoke_cold_2(id *a1)
{
  [*a1 length];
  OUTLINED_FUNCTION_5_2();
  OUTLINED_FUNCTION_4_1(&dword_23F849000, &_os_log_internal, v1, "%s: rcv_output_buffer too small, expected: %lu, got: %u\n", v2, v3, v4, v5, 2u);
}

void __smb2fs_smb_copychunks_block_invoke_cold_3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v0, "%s: smb2_smb_ioctl failed %d\n", v1, v2, v3, v4, 2u);
}

void smb2fs_smb_copychunks_win_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __smb2fs_smb_copychunks_block_invoke_3_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v0, "%s: smb2fs_smb_copychunks_win failed %d\n", v1, v2, v3, v4, 2u);
}

void __smb2fs_smb_copychunks_win_block_invoke_cold_1(id *a1)
{
  [*a1 length];
  OUTLINED_FUNCTION_5_2();
  OUTLINED_FUNCTION_4_1(&dword_23F849000, &_os_log_internal, v1, "%s: rcv_output_buffer too small, expected: %lu, got: %u\n", v2, v3, v4, v5, 2u);
}

void __smb2fs_smb_copychunks_win_block_invoke_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v0, "%s: smb2_smb_ioctl result: nt_stat: 0x%0x\n", v1, v2, v3, v4, 2u);
}

void __smb2fs_smb_copychunks_win_block_invoke_cold_3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v0, "%s: Trying with smaller chunk size <%d> \n", v1, v2, v3, v4, 2u);
}

void __smb2fs_smb_copychunks_win_block_invoke_cold_4()
{
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_4_1(&dword_23F849000, &_os_log_internal, v0, "%s: copychunk error: total_bytes_written: %u, expected: %llu\n", v1, v2, v3, v4, 2u);
}

void __smb2fs_smb_copychunks_win_block_invoke_cold_5()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  v2[0] = 136315650;
  OUTLINED_FUNCTION_7_0();
  __int16 v3 = v0;
  int v4 = v1;
  _os_log_error_impl(&dword_23F849000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s: copychunk error: chunks_written: %u, expected: %u\n", (uint8_t *)v2, 0x18u);
}

void __smb2fs_smb_copychunks_win_block_invoke_cold_6(uint64_t a1, int a2)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(uint64_t **)(a1 + 64);
  uint64_t v3 = *(void *)(a1 + 72);
  uint64_t v4 = *v2;
  LODWORD(v2) = *((_DWORD *)v2 + 5);
  int v5 = *(_DWORD *)(a1 + 112);
  int v6 = 136316418;
  int v7 = "smb2fs_smb_copychunks_win_block_invoke";
  __int16 v8 = 1024;
  int v9 = a2;
  __int16 v10 = 2048;
  uint64_t v11 = v4;
  __int16 v12 = 1024;
  int v13 = (int)v2;
  __int16 v14 = 1024;
  int v15 = v5;
  __int16 v16 = 2048;
  uint64_t v17 = v3;
  _os_log_error_impl(&dword_23F849000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s: smb2_smb_ioctl error: %d, remain: %llu, max_chunk: %u, count: %u, this_len: %llu\n", (uint8_t *)&v6, 0x32u);
}

void smb2_smb_echo_cold_1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  int v0 = 136315138;
  int v1 = "smb2_smb_echo";
  _os_log_error_impl(&dword_23F849000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s: sock is NULL. \n", (uint8_t *)&v0, 0xCu);
}

void smb2_smb_echo_cold_2(int a1)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  int v1 = 136315394;
  uint64_t v2 = "smb2_smb_echo";
  __int16 v3 = 1024;
  int v4 = a1;
  _os_log_error_impl(&dword_23F849000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s: smb_rq_simple_block failed <%d> \n", (uint8_t *)&v1, 0x12u);
}

void __smb2_smb_echo_block_invoke_cold_1(unsigned __int16 *a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v1 = *a1;
  int v2 = 136315394;
  __int16 v3 = "smb2_smb_echo_block_invoke";
  __int16 v4 = 1024;
  int v5 = v1;
  _os_log_error_impl(&dword_23F849000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s: Bad struct size: %u\n", (uint8_t *)&v2, 0x12u);
}

void __smb2_smb_echo_block_invoke_cold_2(uint64_t a1, int a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  int v3 = objc_msgSend(*(id *)(a1 + 32), "sr_ntstatus");
  int v4 = 136315650;
  int v5 = "smb2_smb_echo_block_invoke";
  __int16 v6 = 1024;
  int v7 = a2;
  __int16 v8 = 1024;
  int v9 = v3;
  _os_log_error_impl(&dword_23F849000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s: Reply failed <%d> ntStatus <0x%x> \n", (uint8_t *)&v4, 0x18u);
}

void smb_rq_bend_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void smb_rq_bend_cold_2()
{
  uint64_t v1 = *MEMORY[0x263EF8340];
  v0[0] = 136315394;
  OUTLINED_FUNCTION_4_3();
  _os_log_error_impl(&dword_23F849000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s: byte count too large (%ld)\n", (uint8_t *)v0, 0x16u);
}

void smb_rq_bend32_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void smb_rq_bend32_cold_2()
{
  uint64_t v1 = *MEMORY[0x263EF8340];
  v0[0] = 136315394;
  OUTLINED_FUNCTION_4_3();
  _os_log_error_impl(&dword_23F849000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s: byte count too large (%ld)\n", (uint8_t *)v0, 0x16u);
}

void smb_rq_simple_timed_cold_1(unsigned __int16 a1, uint8_t *buf, int a3)
{
  *(_DWORD *)CCHmacContext buf = 136315650;
  *(void *)(buf + 4) = "smb_rq_simple_timed";
  *((_WORD *)buf + 6) = 1024;
  *(_DWORD *)(buf + 14) = a3;
  *((_WORD *)buf + 9) = 1024;
  *((_DWORD *)buf + 5) = a1;
  _os_log_error_impl(&dword_23F849000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s: timed out <%d> secs waiting on cmd <%x> \n", buf, 0x18u);
}

void smb_rq_simple_timed_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v0, "%s: piston_send_request failed <%d> \n", v1, v2, v3, v4, 2u);
}

void smb_rq_simple_block_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v0, "%s: piston_send_request failed <%d> \n", v1, v2, v3, v4, 2u);
}

void smb2_rq_alloc_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void smb2_rq_alloc_cold_2(void *a1)
{
  objc_msgSend(a1, "sr_command");
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v1, "%s: SMB 2/3 not allowed on SMB 1 connection. cmd = %x\n", v2, v3, v4, v5, 2u);
}

void smb2_rq_alloc_cold_3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v0, "%s: mb_init failed <%d> \n", v1, v2, v3, v4, 2u);
}

void smb2_rq_alloc_cold_4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v0, "%s: credit count %d < 0 \n", v1, v2, v3, v4, 2u);
}

void smb2_rq_message_id_increment_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void smb2_rq_message_id_increment_cold_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void smb2_rq_next_command_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v0, "%s: md_get_mem failed %d\n", v1, v2, v3, v4, 2u);
}

void smb2_rq_parse_header_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void smb2_rq_parse_header_cold_2(void *a1)
{
  objc_msgSend(a1, "sr_command");
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v1, "%s: STATUS_INSUFFICIENT_RESOURCES: while attempting cmd %x\n", v2, v3, v4, v5, 2u);
}

void smb2_rq_parse_header_cold_3(void *a1)
{
  objc_msgSend(a1, "sr_command");
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v1, "%s: STATUS_NETWORK_SESSION_EXPIRED: while attempting cmd %x. Reconnecting.\n", v2, v3, v4, v5, 2u);
}

void smb2_rq_parse_header_cold_4(uint64_t *a1, uint64_t *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t v3 = *a1;
  uint64_t v4 = *a2;
  int v5 = 136315906;
  __int16 v6 = "smb2_rq_parse_header";
  __int16 v7 = 2048;
  uint64_t v8 = v3;
  __int16 v9 = 2048;
  uint64_t v10 = v4;
  __int16 v11 = 2048;
  uint64_t v12 = objc_msgSend(a3, "sr_rspasyncid");
  _os_log_error_impl(&dword_23F849000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s: Async rsp ids do not match: id %lld async_id %lld ! = %lld\n", (uint8_t *)&v5, 0x2Au);
}

void smb2_rq_parse_header_cold_5()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v0, "%s: Bad struct size: %u\n", v1, v2, v3, v4, 2u);
}

void piston_smb3_derive_keys_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void piston_smb3_derive_keys_cold_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void piston_smb3_derive_keys_cold_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void piston_smb3_derive_keys_cold_4()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v0, "%s: Warning: Session.SessionKey too small, len: %u\n", v1, v2, v3, v4, 2u);
}

void piston_smb3_derive_keys_cold_5()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v0, "%s: Could not generate smb3 decrypt key, error: %d \n", v1, v2, v3, v4, 2u);
}

void piston_smb3_derive_keys_cold_6()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v0, "%s: Could not generate smb3 encrypt key, error: %d \n", v1, v2, v3, v4, 2u);
}

void piston_smb3_derive_keys_cold_7()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v0, "%s: piston_smb3_kdf_hmac_sha256 failed <%d>\n", v1, v2, v3, v4, 2u);
}

void smb2_rq_sign_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void smb2_rq_sign_cold_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void smb2_rq_sign_cold_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void smb2_rq_sign_cold_4(uint8_t *buf, void *a2)
{
  *(_DWORD *)CCHmacContext buf = 136315138;
  *a2 = "smb2_sign";
  _os_log_error_impl(&dword_23F849000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s: sr_rqsig was never allocated.\n", buf, 0xCu);
}

void smb2_rq_sign_cold_5(uint8_t *buf, void *a2)
{
  *(_DWORD *)CCHmacContext buf = 136315138;
  *a2 = "smb3_sign";
  _os_log_error_impl(&dword_23F849000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s: sr_rqsig was never allocated.\n", buf, 0xCu);
}

void smb2_rq_verify_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void smb2_rq_verify_cold_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void smb2_rq_verify_cold_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void smb2_rq_verify_cold_4(void *a1)
{
  objc_msgSend(a1, "sr_messageid");
  OUTLINED_FUNCTION_4_1(&dword_23F849000, &_os_log_internal, v1, "%s: Could not verify signature for sr_command %x, msgid: %llu\n", v2, v3, v4, v5, 2u);
}

void smb2_rq_verify_cold_5(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void smb2_rq_verify_cold_6()
{
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_11(&dword_23F849000, &_os_log_internal, v0, "%s: mb_off: %lu past end of mbuf, mbuf_len: %lu\n", v1, v2, v3, v4, 2u);
}

void smb2_rq_verify_cold_7()
{
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_1_0(&dword_23F849000, &_os_log_internal, v0, "%s: reply length: %lu too short\n", v1, v2, v3, v4, 2u);
}

void smb2_rq_verify_cold_8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_23F849000, &_os_log_internal, a3, "%s: mbuf_next didn't return an mbuf\n", a5, a6, a7, a8, 2u);
}

void smb2_rq_verify_cold_14(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void smb2_rq_verify_cold_15()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v0, "%s: SMB3 signing key len too small: %u\n", v1, v2, v3, v4, 2u);
}

void smb2_rq_verify_cold_16(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void smb2_rq_verify_cold_17()
{
  OUTLINED_FUNCTION_4_4(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_8(&dword_23F849000, &_os_log_internal, v0, "%s: SigExpected: %02x %02x %02x %02x %02x %02x %02x %02x %02x %02x %02x %02x %02x %02x %02x %02x\n", v1, v2, v3, v4, 2u);
}

BOOL smb2_rq_verify_cold_18()
{
  OUTLINED_FUNCTION_4_4(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_8(&dword_23F849000, &_os_log_internal, v0, "%s: SigCalc: %02x %02x %02x %02x %02x %02x %02x %02x %02x %02x %02x %02x %02x %02x %02x %02x\n", v1, v2, v3, v4, 2u);
  return piston_log_level == 0;
}

BOOL smb2_rq_verify_cold_19(void *a1)
{
  objc_msgSend(a1, "sr_messageid");
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_1_0(&dword_23F849000, &_os_log_internal, v1, "%s: SMB3 signature mismatch: mid %llu\n", v2, v3, v4, v5, 2u);
  return piston_log_level == 0;
}

void smb2_rq_verify_cold_20(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void smb3_rq_encrypt_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void smb3_rq_encrypt_cold_2()
{
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_1_0(&dword_23F849000, &_os_log_internal, v0, "%s: mb msglen too big for transform: %lu\n", v1, v2, v3, v4, 2u);
}

void smb3_rq_encrypt_cold_3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v0, "%s: CCCryptorGCMFinalize ccstatus %d", v1, v2, v3, v4, 2u);
}

void smb3_rq_encrypt_cold_4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v0, "%s: CCCryptorUpdate smbhdr ccstatus %d", v1, v2, v3, v4, 2u);
}

void smb3_rq_encrypt_cold_5()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v0, "%s: CCCryptorAddParameter kCCParameterAuthData ccstatus %d", v1, v2, v3, v4, 2u);
}

void smb3_rq_encrypt_cold_6()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v0, "%s: CCCryptorAddParameter kCCParameterIV ccstatus %d", v1, v2, v3, v4, 2u);
}

void smb3_rq_encrypt_cold_7()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v0, "%s: CCCryptorCreateWithMode ccstatus %d", v1, v2, v3, v4, 2u);
}

void smb3_rq_encrypt_cold_8()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v0, "%s: CCCryptorGetParameter kCCParameterAuthTag ccstatus %d", v1, v2, v3, v4, 2u);
}

void smb3_rq_encrypt_cold_9()
{
  OUTLINED_FUNCTION_4_3();
  OUTLINED_FUNCTION_1_0(&dword_23F849000, &_os_log_internal, v0, "%s: CCCryptorFinal had leftover data of len %zu", v1, v2, v3, v4, 2u);
}

void smb3_rq_encrypt_cold_10()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v0, "%s: CCCryptorFinal ccstatus %d", v1, v2, v3, v4, 2u);
}

void smb3_rq_encrypt_cold_14()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v0, "%s: CCCryptorAddParameter kCCMacSize ccstatus %d", v1, v2, v3, v4, 2u);
}

void smb3_rq_encrypt_cold_15()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v0, "%s: CCCryptorAddParameter kCCDataSize ccstatus %d", v1, v2, v3, v4, 2u);
}

void smb3_rq_encrypt_cold_17()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v0, "%s: No mbuf for transform hdr, error: %d\n", v1, v2, v3, v4, 2u);
}

void smb3_rq_encrypt_cold_18()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v0, "%s: Unknown cipher %d defaulting to SMB2_ENCRYPTION_AES_128_CCM \n", v1, v2, v3, v4, 2u);
}

void smb3_msg_decrypt_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void smb3_msg_decrypt_cold_2()
{
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_4_1(&dword_23F849000, &_os_log_internal, v0, "%s: %s: CCCryptorGCMFinalize ccstatus %d", v1, v2, v3, v4, 2u);
}

void smb3_msg_decrypt_cold_3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v0, "%s: CCCryptorUpdate hdr+payload ccstatus %d", v1, v2, v3, v4, 2u);
}

void smb3_msg_decrypt_cold_4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v0, "%s: CCCryptorAddParameter kCCParameterAuthData ccstatus %d", v1, v2, v3, v4, 2u);
}

void smb3_msg_decrypt_cold_5()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v0, "%s: CCCryptorAddParameter kCCParameterIV ccstatus %d", v1, v2, v3, v4, 2u);
}

void smb3_msg_decrypt_cold_6()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v0, "%s: CCCryptorCreateWithMode ccstatus %d", v1, v2, v3, v4, 2u);
}

void smb3_msg_decrypt_cold_7()
{
  OUTLINED_FUNCTION_4_4(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_8(&dword_23F849000, &_os_log_internal, v0, "%s: CalcSig: %02x %02x %02x %02x %02x %02x %02x %02x %02x %02x %02x %02x %02x %02x %02x %02x\n", v1, v2, v3, v4, 2u);
}

void smb3_msg_decrypt_cold_8(uint64_t a1, unsigned __int8 *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void smb3_msg_decrypt_cold_9(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void smb3_msg_decrypt_cold_10()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v0, "%s: CCCryptorGetParameter kCCParameterAuthTag ccstatus %d", v1, v2, v3, v4, 2u);
}

void smb3_msg_decrypt_cold_11()
{
  OUTLINED_FUNCTION_4_3();
  OUTLINED_FUNCTION_1_0(&dword_23F849000, &_os_log_internal, v0, "%s: CCCryptorFinal had leftover data of len %zu", v1, v2, v3, v4, 2u);
}

void smb3_msg_decrypt_cold_12()
{
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_4_1(&dword_23F849000, &_os_log_internal, v0, "%s: %s: CCCryptorFinal ccstatus %d", v1, v2, v3, v4, 2u);
}

void smb3_msg_decrypt_cold_16()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v0, "%s: CCCryptorAddParameter kCCMacSize ccstatus %d", v1, v2, v3, v4, 2u);
}

void smb3_msg_decrypt_cold_17()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v0, "%s: CCCryptorAddParameter kCCDataSize ccstatus %d", v1, v2, v3, v4, 2u);
}

void smb3_msg_decrypt_cold_19()
{
  OUTLINED_FUNCTION_4_3();
  OUTLINED_FUNCTION_11(&dword_23F849000, &_os_log_internal, v0, "%s: TF sess_id mismatch: expect: %llu got: %llu\n", v1, v2, v3, v4, 2u);
}

void smb3_msg_decrypt_cold_20()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v0, "%s: Unsupported ENCR alg: %u\n", v1, v2, v3, v4, 2u);
}

void smb3_msg_decrypt_cold_21(unsigned __int8 *a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  int v1 = *a1;
  int v2 = a1[1];
  int v3 = a1[2];
  int v4 = a1[3];
  int v5 = 136316162;
  __int16 v6 = "smb3_msg_decrypt";
  __int16 v7 = 1024;
  int v8 = v1;
  __int16 v9 = 1024;
  int v10 = v2;
  __int16 v11 = 1024;
  int v12 = v3;
  __int16 v13 = 1024;
  int v14 = v4;
  _os_log_error_impl(&dword_23F849000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s: TF HDR protocol incorrect: %02x %02x %02x %02x\n", (uint8_t *)&v5, 0x24u);
}

void smb3_msg_decrypt_cold_22()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v0, "%s: Unknown cipher %d defaulting to SMB2_ENCRYPTION_AES_128_CCM \n", v1, v2, v3, v4, 2u);
}

void smb3_verify_session_setup_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void smb3_verify_session_setup_cold_2()
{
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_1_0(&dword_23F849000, &_os_log_internal, v0, "%s: sess_setup_reply is too small %zu \n", v1, v2, v3, v4, 2u);
}

void smb3_verify_session_setup_cold_3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v0, "%s: SMB3 keylen too small %u\n", v1, v2, v3, v4, 2u);
}

void smb3_verify_session_setup_cold_4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v0, "%s: Signing algorithm (%u) not supported", v1, v2, v3, v4, 2u);
}

void smb3_verify_session_setup_cold_5()
{
  OUTLINED_FUNCTION_9_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_8(&dword_23F849000, &_os_log_internal, v0, "%s: SigExpected: %02x %02x %02x %02x %02x %02x %02x %02x %02x %02x %02x %02x %02x %02x %02x %02x\n", v1, v2, v3, v4, 2u);
}

void smb3_verify_session_setup_cold_6()
{
  OUTLINED_FUNCTION_9_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_8(&dword_23F849000, &_os_log_internal, v0, "%s: SigCalc: %02x %02x %02x %02x %02x %02x %02x %02x %02x %02x %02x %02x %02x %02x %02x %02x\n", v1, v2, v3, v4, 2u);
}

void smb3_verify_session_setup_cold_7(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void smb3_verify_session_setup_cold_8()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v0, "%s: cccmac_one_shot_generate failed %d \n", v1, v2, v3, v4, 2u);
}

void smb3_verify_session_setup_cold_9()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v0, "%s: CCCryptorGCMOneshotEncrypt failed <%d> \n", v1, v2, v3, v4, 2u);
}

void smb3_get_signature_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void smb3_get_signature_cold_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void smb3_get_signature_cold_3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v0, "%s: smb3 keylen %u\n", v1, v2, v3, v4, 2u);
}

void smb3_get_signature_cold_4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v0, "%s: Signing algorithm (%u) not supported", v1, v2, v3, v4, 2u);
}

void smb3_get_signature_cold_5(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void smb3_get_signature_cold_8()
{
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_1_0(&dword_23F849000, &_os_log_internal, v0, "%s: Not enough bytes in packet? <%zu>\n", v1, v2, v3, v4, 2u);
}

void smb3_get_signature_cold_9()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v0, "%s: CCCryptorGCMFinalize failed <%d> \n", v1, v2, v3, v4, 2u);
}

void smb3_get_signature_cold_11()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v0, "%s: CCCryptorGCMSetIV failed <%d> for write pads \n", v1, v2, v3, v4, 2u);
}

void smb3_get_signature_cold_12()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v0, "%s: CCCryptorGCMSetIV failed <%d> for write \n", v1, v2, v3, v4, 2u);
}

void smb3_get_signature_cold_14()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v0, "%s: CCCryptorGCMSetIV failed <%d> \n", v1, v2, v3, v4, 2u);
}

void smb3_get_signature_cold_16()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v0, "%s: CCCryptorCreateWithMode failed <%d> \n", v1, v2, v3, v4, 2u);
}

void piston_flush_cold_1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  int v0 = 136315138;
  uint64_t v1 = "piston_flush";
  _os_log_error_impl(&dword_23F849000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s: sock is NULL. \n", (uint8_t *)&v0, 0xCu);
}

void piston_flush_cold_2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v0, "%s: smb2_smb_flush failed <%d> \n", v1, v2, v3, v4, 2u);
}

void piston_flush_cold_3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v0, "%s: smb_rq_simple_block failed <%d> \n", v1, v2, v3, v4, 2u);
}

void __smb2_smb_flush_block_invoke_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __smb2_smb_flush_block_invoke_cold_2(id *a1, int a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  int v3 = objc_msgSend(*a1, "sr_ntstatus");
  int v4 = 136315650;
  int v5 = "smb2_smb_flush_block_invoke";
  __int16 v6 = 1024;
  int v7 = a2;
  __int16 v8 = 1024;
  int v9 = v3;
  _os_log_error_impl(&dword_23F849000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s: Reply failed <%d> ntStatus <0x%x> \n", (uint8_t *)&v4, 0x18u);
}

void piston_gss_parse_server_mechs_cold_1()
{
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_0(&dword_23F849000, &_os_log_internal, v0, "%s: hintsname(%s)\n", v1, v2, v3, v4, 2u);
}

void piston_gss_parse_server_mechs_cold_2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v0, "%s: [%d]decode_NegotiationToken <NegotiationToken win>\n", v1, v2, v3, v4, 2u);
}

void piston_gss_parse_server_mechs_cold_3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v0, "%s: [%d]decode_NegotiationToken <NegotiationToken rfc2478>\n", v1, v2, v3, v4, 2u);
}

void piston_gss_transact_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void piston_gss_transact_cold_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void piston_gss_transact_cold_3()
{
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_4(&dword_23F849000, &_os_log_internal, v0, "%s: gss output token len <%u> is larger than MAX_SECBLOBLEN <%u>\n", v1, v2, v3, v4, 2u);
}

void piston_gss_transact_cold_4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void piston_gss_transact_cold_5(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void piston_gss_transact_cold_6(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void piston_gss_transact_cold_7()
{
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_4(&dword_23F849000, &_os_log_internal, v0, "%s: gss_inquire_sec_context_by_oid returned major %d; minor %d \n",
    v1,
    v2,
    v3,
    v4,
    2u);
}

void piston_gss_transact_cold_8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_23F849000, &_os_log_internal, a3, "%s: lucid key type = %d len = %d \n", a5, a6, a7, a8, 2u);
}

void piston_gss_transact_cold_9(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void piston_gss_transact_cold_10()
{
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_4(&dword_23F849000, &_os_log_internal, v0, "%s: vers = %d, protocol = %d\n", v1, v2, v3, v4, 2u);
}

void piston_gss_transact_cold_11()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v0, "%s: Lucid version %d is unsupported\n", v1, v2, v3, v4, 2u);
}

void piston_gss_transact_cold_12()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v0, "%s: gss_krb5_export_lucid_sec_context failed <0x%x> \n", v1, v2, v3, v4, 2u);
}

void piston_gss_transact_cold_13()
{
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_0(&dword_23F849000, &_os_log_internal, v0, "%s: gss_krb5_export_lucid_sec_context failed <%s> \n", v1, v2, v3, v4, 2u);
}

void piston_gss_transact_cold_14(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void piston_gss_transact_cold_15()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v0, "%s: gss_inquire_sec_context_by_oid failed <0x%x> \n", v1, v2, v3, v4, 2u);
}

void piston_gss_transact_cold_16()
{
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_0(&dword_23F849000, &_os_log_internal, v0, "%s: gss_inquire_sec_context_by_oid failed <%s> \n", v1, v2, v3, v4, 2u);
}

void piston_gss_transact_cold_17(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void piston_gss_transact_cold_18(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void piston_gss_transact_cold_19()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v0, "%s: gss_import_name failed <0x%x> \n", v1, v2, v3, v4, 2u);
}

void piston_gss_transact_cold_20()
{
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_0(&dword_23F849000, &_os_log_internal, v0, "%s: gss_import_name failed <%s> \n", v1, v2, v3, v4, 2u);
}

void piston_gss_transact_cold_21(void *a1)
{
  [a1 cStringUsingEncoding:4];
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_0(&dword_23F849000, &_os_log_internal, v1, "%s: service_principal <%s> \n", v2, v3, v4, v5, 2u);
}

void piston_gss_transact_cold_23()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v0, "%s: piston_gss_acquire_cred failed <0x%x> \n", v1, v2, v3, v4, 2u);
}

void piston_gss_transact_cold_24()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v0, "%s: gss_acquire_cred_ex_f failed <0x%x> \n", v1, v2, v3, v4, 2u);
}

void piston_gss_transact_cold_25()
{
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_0(&dword_23F849000, &_os_log_internal, v0, "%s: gss_acquire_cred_ex_f failed <%s> \n", v1, v2, v3, v4, 2u);
}

void piston_gss_transact_cold_28(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void piston_gss_transact_cold_29(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_23F849000, &_os_log_internal, a3, "%s: CFUUIDCreate returned NULL", a5, a6, a7, a8, 2u);
}

void piston_gss_transact_cold_30(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_23F849000, &_os_log_internal, a3, "%s: CFBridgingRelease returned NULL", a5, a6, a7, a8, 2u);
}

void piston_gss_transact_cold_31(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_23F849000, &_os_log_internal, a3, "%s: [NSMutableDictionary dictionary] returned NULL", a5, a6, a7, a8, 2u);
}

void piston_gss_transact_cold_32(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void piston_gss_transact_cold_33(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_23F849000, &_os_log_internal, a3, "%s: GSSCredentialCopyUUID returned NULL", a5, a6, a7, a8, 2u);
}

void piston_gss_transact_cold_34()
{
  OUTLINED_FUNCTION_7_2();
  OUTLINED_FUNCTION_1_0(&dword_23F849000, &_os_log_internal, v0, "%s: gss_aapl_initial_cred - uuid(%@)", v1, v2, v3, v4, 2u);
}

void piston_gss_transact_cold_35()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v0, "%s: gss_aapl_initial_cred failed <0x%x> \n", v1, v2, v3, v4, 2u);
}

void piston_gss_transact_cold_36()
{
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_0(&dword_23F849000, &_os_log_internal, v0, "%s: gss_aapl_initial_cred failed <%s> \n", v1, v2, v3, v4, 2u);
}

void piston_gss_transact_cold_37()
{
  OUTLINED_FUNCTION_7_2();
  OUTLINED_FUNCTION_1_0(&dword_23F849000, &_os_log_internal, v0, "%s: kGSSICKerberosCacheName: %@", v1, v2, v3, v4, 2u);
}

void piston_gss_transact_cold_38(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void piston_gss_transact_cold_39(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void piston_negotiate_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void piston_negotiate_cold_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void piston_negotiate_cold_3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v0, "%s: openSocket failed <%d> \n", v1, v2, v3, v4, 2u);
}

void piston_negotiate_cold_4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void piston_negotiate_cold_5(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __piston_negotiate_block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v0, "%s: smb_rq_simple_block failed <%d> \n", v1, v2, v3, v4, 2u);
}

void __piston_negotiate_block_invoke_cold_2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v0, "%s: smb2_smb_add_negotiate_contexts failed %d \n", v1, v2, v3, v4, 2u);
}

void __piston_negotiate_block_invoke_cold_3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v0, "%s: connectSocket failed <%d> \n", v1, v2, v3, v4, 2u);
}

void __piston_negotiate_block_invoke_9_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v0, "%s: smb2_smb_negotiate_parse failed <%d>\n", v1, v2, v3, v4, 2u);
}

void __piston_negotiate_block_invoke_9_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v0, "%s: Unknown dialect 0x%x\n", v1, v2, v3, v4, 2u);
}

void __piston_negotiate_block_invoke_9_cold_3(int *a1, uint64_t a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  int v2 = *a1;
  int v3 = *(_DWORD *)(*(void *)a2 + 64);
  int v4 = 136315650;
  uint64_t v5 = "piston_negotiate_block_invoke";
  __int16 v6 = 1024;
  int v7 = v2;
  __int16 v8 = 1024;
  int v9 = v3;
  _os_log_error_impl(&dword_23F849000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s: Reconnecting with different sv_caps <0x%x> != <0x%x>\n", (uint8_t *)&v4, 0x18u);
}

void __piston_negotiate_block_invoke_9_cold_4(void *a1)
{
  uint64_t v1 = objc_msgSend(a1, "sr_pd");
  int v2 = [v1 sock];
  objc_msgSend(v2, "resp_wait_timeout");
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v3, "%s: session_resp_wait_timeout changed to %d\n", v4, v5, v6, v7, 2u);
}

void __piston_negotiate_block_invoke_9_cold_5()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v0, "%s: Bad struct size: %u\n", v1, v2, v3, v4, 2u);
}

void __piston_negotiate_block_invoke_9_cold_6(id *a1, int a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  int v3 = objc_msgSend(*a1, "sr_ntstatus");
  int v4 = 136315650;
  uint64_t v5 = "piston_negotiate_block_invoke";
  __int16 v6 = 1024;
  int v7 = a2;
  __int16 v8 = 1024;
  int v9 = v3;
  _os_log_error_impl(&dword_23F849000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s: Reply failed <%d> ntStatus <0x%x> \n", (uint8_t *)&v4, 0x18u);
}

void smb2_smb_parse_negotiate_contexts_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void smb2_smb_parse_negotiate_contexts_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v0, "%s: CipherCount is supposed to be 1 (%d) \n", v1, v2, v3, v4, 2u);
}

void smb2_smb_parse_negotiate_contexts_cold_3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v0, "%s: Server provided an invalid signing algorithm (%u)", v1, v2, v3, v4, 2u);
}

void smb2_smb_parse_negotiate_contexts_cold_4()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v0, "%s: Server must set SigningCnt to 1 (%d) \n", v1, v2, v3, v4, 2u);
}

uint64_t CCAESCmacCreate()
{
  return MEMORY[0x270ED77C8]();
}

uint64_t CCAESCmacDestroy()
{
  return MEMORY[0x270ED77D0]();
}

uint64_t CCAESCmacFinal()
{
  return MEMORY[0x270ED77D8]();
}

uint64_t CCAESCmacUpdate()
{
  return MEMORY[0x270ED77E0]();
}

uint64_t CCCryptorAddParameter()
{
  return MEMORY[0x270ED78A8]();
}

CCCryptorStatus CCCryptorCreateWithMode(CCOperation op, CCMode mode, CCAlgorithm alg, CCPadding padding, const void *iv, const void *key, size_t keyLength, const void *tweak, size_t tweakLength, int numRounds, CCModeOptions options, CCCryptorRef *cryptorRef)
{
  return MEMORY[0x270ED78D0](*(void *)&op, *(void *)&mode, *(void *)&alg, *(void *)&padding, iv, key, keyLength, tweak);
}

CCCryptorStatus CCCryptorFinal(CCCryptorRef cryptorRef, void *dataOut, size_t dataOutAvailable, size_t *dataOutMoved)
{
  return MEMORY[0x270ED78E8](cryptorRef, dataOut, dataOutAvailable, dataOutMoved);
}

uint64_t CCCryptorGCMAddAAD()
{
  return MEMORY[0x270ED78F0]();
}

uint64_t CCCryptorGCMFinalize()
{
  return MEMORY[0x270ED7908]();
}

uint64_t CCCryptorGCMOneshotEncrypt()
{
  return MEMORY[0x270ED7918]();
}

uint64_t CCCryptorGCMReset()
{
  return MEMORY[0x270ED7920]();
}

uint64_t CCCryptorGCMSetIV()
{
  return MEMORY[0x270ED7928]();
}

uint64_t CCCryptorGetParameter()
{
  return MEMORY[0x270ED7938]();
}

CCCryptorStatus CCCryptorRelease(CCCryptorRef cryptorRef)
{
  return MEMORY[0x270ED7940](cryptorRef);
}

CCCryptorStatus CCCryptorUpdate(CCCryptorRef cryptorRef, const void *dataIn, size_t dataInLength, void *dataOut, size_t dataOutAvailable, size_t *dataOutMoved)
{
  return MEMORY[0x270ED7950](cryptorRef, dataIn, dataInLength, dataOut, dataOutAvailable, dataOutMoved);
}

uint64_t CCDeriveKey()
{
  return MEMORY[0x270ED7958]();
}

void CCHmacFinal(CCHmacContext *ctx, void *macOut)
{
}

void CCHmacInit(CCHmacContext *ctx, CCHmacAlgorithm algorithm, const void *key, size_t keyLength)
{
}

void CCHmacUpdate(CCHmacContext *ctx, const void *data, size_t dataLength)
{
}

uint64_t CCKDFParametersCreateCtrHmac()
{
  return MEMORY[0x270ED7A18]();
}

uint64_t CCKDFParametersDestroy()
{
  return MEMORY[0x270ED7A28]();
}

int CC_SHA512_Final(unsigned __int8 *md, CC_SHA512_CTX *c)
{
  return MEMORY[0x270ED7B70](md, c);
}

int CC_SHA512_Init(CC_SHA512_CTX *c)
{
  return MEMORY[0x270ED7B78](c);
}

int CC_SHA512_Update(CC_SHA512_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x270ED7B80](c, data, *(void *)&len);
}

void CFRelease(CFTypeRef cf)
{
}

CFMutableStringRef CFStringCreateMutableCopy(CFAllocatorRef alloc, CFIndex maxLength, CFStringRef theString)
{
  return (CFMutableStringRef)MEMORY[0x270EE50B8](alloc, maxLength, theString);
}

CFStringRef CFStringCreateWithBytes(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation)
{
  return (CFStringRef)MEMORY[0x270EE50D0](alloc, bytes, numBytes, *(void *)&encoding, isExternalRepresentation);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x270EE50E0](alloc, cStr, *(void *)&encoding);
}

CFIndex CFStringGetBytes(CFStringRef theString, CFRange range, CFStringEncoding encoding, UInt8 lossByte, Boolean isExternalRepresentation, UInt8 *buffer, CFIndex maxBufLen, CFIndex *usedBufLen)
{
  return MEMORY[0x270EE5170](theString, range.location, range.length, *(void *)&encoding, lossByte, isExternalRepresentation, buffer, maxBufLen);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x270EE51D8](theString);
}

void CFStringNormalize(CFMutableStringRef theString, CFStringNormalizationForm theForm)
{
}

CFUUIDRef CFUUIDCreate(CFAllocatorRef alloc)
{
  return (CFUUIDRef)MEMORY[0x270EE5470](alloc);
}

CFStringRef CFUUIDCreateString(CFAllocatorRef alloc, CFUUIDRef uuid)
{
  return (CFStringRef)MEMORY[0x270EE5488](alloc, uuid);
}

gss_name_t GSSCreateName(CFTypeRef name, gss_const_OID name_type, CFErrorRef *error)
{
  return (gss_name_t)MEMORY[0x270EF2CD8](name, name_type, error);
}

CFUUIDRef GSSCredentialCopyUUID(gss_cred_id_t credential)
{
  return (CFUUIDRef)MEMORY[0x270EF2CE8](credential);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t __ApplePrivate_gss_acquire_cred_ex_f()
{
  return MEMORY[0x270EF2D10]();
}

int *__error(void)
{
  return (int *)MEMORY[0x270ED7DC0]();
}

int __snprintf_chk(char *a1, size_t a2, int a3, size_t a4, const char *a5, ...)
{
  return MEMORY[0x270ED7EA8](a1, a2, *(void *)&a3, a4, a5);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void arc4random_buf(void *__buf, size_t __nbytes)
{
}

int asprintf(char **a1, const char *a2, ...)
{
  return MEMORY[0x270ED8688](a1, a2);
}

void bzero(void *a1, size_t a2)
{
}

uint64_t cc_cmp_safe()
{
  return MEMORY[0x270ED87D8]();
}

uint64_t ccaes_cbc_encrypt_mode()
{
  return MEMORY[0x270ED87E8]();
}

uint64_t cccmac_one_shot_generate()
{
  return MEMORY[0x270ED8848]();
}

uint64_t der_print_heim_oid()
{
  return MEMORY[0x270F993B0]();
}

void dispatch_activate(dispatch_object_t object)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

BOOL dispatch_data_apply(dispatch_data_t data, dispatch_data_applier_t applier)
{
  return MEMORY[0x270ED92B8](data, applier);
}

dispatch_data_t dispatch_data_create(const void *buffer, size_t size, dispatch_queue_t queue, dispatch_block_t destructor)
{
  return (dispatch_data_t)MEMORY[0x270ED92D0](buffer, size, queue, destructor);
}

dispatch_data_t dispatch_data_create_concat(dispatch_data_t data1, dispatch_data_t data2)
{
  return (dispatch_data_t)MEMORY[0x270ED92E0](data1, data2);
}

size_t dispatch_data_get_size(dispatch_data_t data)
{
  return MEMORY[0x270ED9300](data);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x270ED94B8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x270ED94C8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x270ED94D0](dsema, timeout);
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x270ED9510](type, handle, mask, queue);
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

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

dispatch_time_t dispatch_walltime(const timespec *when, int64_t delta)
{
  return MEMORY[0x270ED95B8](when, delta);
}

void free(void *a1)
{
}

int gethostuuid(uuid_t a1, const timespec *a2)
{
  return MEMORY[0x270ED9C60](a1, a2);
}

int getpagesize(void)
{
  return MEMORY[0x270ED9CC8]();
}

int gettimeofday(timeval *a1, void *a2)
{
  return MEMORY[0x270ED9D98](a1, a2);
}

OM_uint32 gss_aapl_initial_cred(gss_name_t desired_name, gss_const_OID desired_mech, CFDictionaryRef attributes, gss_cred_id_t *output_cred_handle, CFErrorRef *error)
{
  return MEMORY[0x270EF2D28](desired_name, desired_mech, attributes, output_cred_handle, error);
}

OM_uint32 gss_decapsulate_token(gss_const_buffer_t input_token, gss_const_OID oid, gss_buffer_t output_token)
{
  return MEMORY[0x270EF2D48](input_token, oid, output_token);
}

OM_uint32 gss_delete_sec_context(OM_uint32 *minor_status, gss_ctx_id_t *context_handle, gss_buffer_t output_token)
{
  return MEMORY[0x270EF2D50](minor_status, context_handle, output_token);
}

OM_uint32 gss_destroy_cred(OM_uint32 *min_stat, gss_cred_id_t *cred_handle)
{
  return MEMORY[0x270EF2D58](min_stat, cred_handle);
}

OM_uint32 gss_display_status(OM_uint32 *minor_status, OM_uint32 status_value, int status_type, gss_OID mech_type, OM_uint32 *message_content, gss_buffer_t status_string)
{
  return MEMORY[0x270EF2D60](minor_status, *(void *)&status_value, *(void *)&status_type, mech_type, message_content, status_string);
}

OM_uint32 gss_import_name(OM_uint32 *minor_status, gss_buffer_t input_name_buffer, gss_const_OID input_name_type, gss_name_t *output_name)
{
  return MEMORY[0x270EF2D68](minor_status, input_name_buffer, input_name_type, output_name);
}

OM_uint32 gss_init_sec_context(OM_uint32 *minor_status, gss_cred_id_t initiator_cred_handle, gss_ctx_id_t *context_handle, gss_name_t target_name, gss_OID input_mech_type, OM_uint32 req_flags, OM_uint32 time_req, gss_channel_bindings_t input_chan_bindings, gss_buffer_t input_token, gss_OID *actual_mech_type, gss_buffer_t output_token, OM_uint32 *ret_flags, OM_uint32 *time_rec)
{
  return MEMORY[0x270EF2D70](minor_status, initiator_cred_handle, context_handle, target_name, input_mech_type, *(void *)&req_flags, *(void *)&time_req, input_chan_bindings);
}

OM_uint32 gss_inquire_sec_context_by_oid(OM_uint32 *minor_status, gss_ctx_id_t context_handle, gss_OID desired_object, gss_buffer_set_t *data_set)
{
  return MEMORY[0x270EF2D80](minor_status, context_handle, desired_object, data_set);
}

OM_uint32 gss_krb5_export_lucid_sec_context(OM_uint32 *minor_status, gss_ctx_id_t *context_handle, OM_uint32 version, void **rctx)
{
  return MEMORY[0x270EF2D90](minor_status, context_handle, *(void *)&version, rctx);
}

OM_uint32 gss_krb5_free_lucid_sec_context(OM_uint32 *minor_status, void *c)
{
  return MEMORY[0x270EF2D98](minor_status, c);
}

int gss_oid_equal(gss_const_OID a, gss_const_OID b)
{
  return MEMORY[0x270EF2DA0](a, b);
}

OM_uint32 gss_release_buffer(OM_uint32 *minor_status, gss_buffer_t buffer)
{
  return MEMORY[0x270EF2DA8](minor_status, buffer);
}

OM_uint32 gss_release_buffer_set(OM_uint32 *minor_status, gss_buffer_set_t *buffer_set)
{
  return MEMORY[0x270EF2DB0](minor_status, buffer_set);
}

OM_uint32 gss_release_name(OM_uint32 *minor_status, gss_name_t *input_name)
{
  return MEMORY[0x270EF2DC0](minor_status, input_name);
}

OM_uint32 gss_release_oid_set(OM_uint32 *minor_status, gss_OID_set *set)
{
  return MEMORY[0x270EF2DC8](minor_status, set);
}

const char *__cdecl inet_ntop(int a1, const void *a2, char *a3, socklen_t a4)
{
  return (const char *)MEMORY[0x270ED9EC0](*(void *)&a1, a2, a3, *(void *)&a4);
}

void krb5_free_context(krb5_context a1)
{
}

void krb5_free_error_message(krb5_context a1, const char *a2)
{
}

krb5_error_code krb5_get_default_realm(krb5_context a1, char **a2)
{
  return MEMORY[0x270F39B20](a1, a2);
}

const char *__cdecl krb5_get_error_message(krb5_context a1, krb5_error_code a2)
{
  return (const char *)MEMORY[0x270F39B28](a1, *(void *)&a2);
}

krb5_error_code krb5_init_context(krb5_context *a1)
{
  return MEMORY[0x270F39BD0](a1);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA388](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x270EDA468](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

void nw_connection_cancel(nw_connection_t connection)
{
}

uint64_t nw_connection_copy_connected_remote_endpoint()
{
  return MEMORY[0x270EF7B68]();
}

nw_path_t nw_connection_copy_current_path(nw_connection_t connection)
{
  return (nw_path_t)MEMORY[0x270EF7B70](connection);
}

nw_connection_t nw_connection_create(nw_endpoint_t endpoint, nw_parameters_t parameters)
{
  return (nw_connection_t)MEMORY[0x270EF7BA8](endpoint, parameters);
}

void nw_connection_force_cancel(nw_connection_t connection)
{
}

uint64_t nw_connection_read_buffer()
{
  return MEMORY[0x270EF7C60]();
}

void nw_connection_receive(nw_connection_t connection, uint32_t minimum_incomplete_length, uint32_t maximum_length, nw_connection_receive_completion_t completion)
{
}

void nw_connection_send(nw_connection_t connection, dispatch_data_t content, nw_content_context_t context, BOOL is_complete, nw_connection_send_completion_t completion)
{
}

void nw_connection_set_better_path_available_handler(nw_connection_t connection, nw_connection_BOOLean_event_handler_t handler)
{
}

uint64_t nw_connection_set_cancel_handler()
{
  return MEMORY[0x270EF7CB0]();
}

uint64_t nw_connection_set_event_handler()
{
  return MEMORY[0x270EF7CB8]();
}

void nw_connection_set_queue(nw_connection_t connection, dispatch_queue_t queue)
{
}

uint64_t nw_connection_set_read_close_handler()
{
  return MEMORY[0x270EF7CE0]();
}

void nw_connection_set_viability_changed_handler(nw_connection_t connection, nw_connection_BOOLean_event_handler_t handler)
{
}

uint64_t nw_connection_set_write_close_handler()
{
  return MEMORY[0x270EF7D00]();
}

void nw_connection_start(nw_connection_t connection)
{
}

nw_endpoint_t nw_endpoint_create_host(const char *hostname, const char *port)
{
  return (nw_endpoint_t)MEMORY[0x270EF7EB0](hostname, port);
}

const sockaddr *__cdecl nw_endpoint_get_address(nw_endpoint_t endpoint)
{
  return (const sockaddr *)MEMORY[0x270EF7EE8](endpoint);
}

int nw_error_get_error_code(nw_error_t error)
{
  return MEMORY[0x270EF7FD0](error);
}

nw_parameters_t nw_parameters_create(void)
{
  return (nw_parameters_t)MEMORY[0x270EF8518]();
}

uint64_t nw_parameters_set_data_mode()
{
  return MEMORY[0x270EF8620]();
}

uint64_t nw_parameters_set_keepalive_enabled()
{
  return MEMORY[0x270EF8688]();
}

uint64_t nw_parameters_set_no_delay()
{
  return MEMORY[0x270EF86B8]();
}

uint64_t nw_path_is_per_app_vpn()
{
  return MEMORY[0x270EF89D0]();
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_copyStruct(void *dest, const void *src, ptrdiff_t size, BOOL atomic, BOOL hasStrong)
{
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x270F9A678](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x270F9A688](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
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

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
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
  return (id)MEMORY[0x270F9A9F8](location, obj);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

int printf(const char *a1, ...)
{
  return MEMORY[0x270EDAD20](a1);
}

int pthread_cond_destroy(pthread_cond_t *a1)
{
  return MEMORY[0x270EDAE58](a1);
}

int pthread_cond_init(pthread_cond_t *a1, const pthread_condattr_t *a2)
{
  return MEMORY[0x270EDAE60](a1, a2);
}

int pthread_cond_signal(pthread_cond_t *a1)
{
  return MEMORY[0x270EDAE68](a1);
}

int pthread_cond_timedwait(pthread_cond_t *a1, pthread_mutex_t *a2, const timespec *a3)
{
  return MEMORY[0x270EDAE78](a1, a2, a3);
}

int pthread_cond_wait(pthread_cond_t *a1, pthread_mutex_t *a2)
{
  return MEMORY[0x270EDAE88](a1, a2);
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

int puts(const char *a1)
{
  return MEMORY[0x270EDB098](a1);
}

uint64_t random(void)
{
  return MEMORY[0x270EDB0E8]();
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x270EDB510](__str, __size, __format);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x270EDB5B0](__s1, __s2);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x270EDB5D8](*(void *)&__errnum);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}

int strncasecmp(const char *a1, const char *a2, size_t a3)
{
  return MEMORY[0x270EDB620](a1, a2, a3);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x270EDB638](__s1, __s2, __n);
}

char *__cdecl strncpy(char *__dst, const char *__src, size_t __n)
{
  return (char *)MEMORY[0x270EDB648](__dst, __src, __n);
}

size_t strnlen(const char *__s1, size_t __n)
{
  return MEMORY[0x270EDB658](__s1, __n);
}

int timingsafe_bcmp(const void *__b1, const void *__b2, size_t __len)
{
  return MEMORY[0x270EDB950](__b1, __b2, __len);
}