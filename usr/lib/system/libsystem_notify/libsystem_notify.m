uint64_t sub_1B2FAD490(uint64_t a1)
{
  uint64_t result;

  result = bootstrap_look_up2();
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t sub_1B2FAD4E4(uint64_t a1, void *a2)
{
  uint64_t result = MEMORY[0x1B3EB38D0](a2);
  if (result != MEMORY[0x1E4F14D18])
  {
    qword_1E9CAF980 = (uint64_t)"BUG IN CLIENT OF LIBNOTIFY: entitlement com.apple.private.darwin-notification.introspect "
                               "must be a non-empty *array* of strings";
    __break(1u);
    goto LABEL_7;
  }
  uint64_t result = xpc_array_get_count(a2);
  if (!result)
  {
LABEL_7:
    qword_1E9CAF980 = (uint64_t)"BUG IN CLIENT OF LIBNOTIFY: entitlement com.apple.private.darwin-notification.introspect "
                               "must be a *non-empty* array of strings";
    __break(1u);
    return result;
  }
  uint64_t v5 = result;
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = malloc_type_calloc(result, 0x10uLL, 0x1050040717B85FCuLL);
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __assert_rtn("_notification_introspection_init_block_invoke", "notify_client.c", 1888, "exempt_notifications != NULL");
  }
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v5;
  applier[0] = MEMORY[0x1E4F14BE8];
  applier[1] = 0x40000000;
  applier[2] = sub_1B2FADCA8;
  applier[3] = &unk_1E6018F60;
  applier[4] = *(void *)(a1 + 32);
  return xpc_array_apply(a2, applier);
}

void notify_monitor_file(int a1, const char *a2, int a3)
{
  mach_msg_return_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unsigned int v32;
  unsigned int v33;
  unsigned char msg[28];
  const char *v35;
  int v36;
  int v37;
  uint64_t v38;
  int v39;
  int v40;
  int v41;

  uint64_t v6 = sub_1B2FB1800();
  if ((*(_DWORD *)(v6 + 116) & 2) != 0)
  {
    os_unfair_lock_lock_with_options();
    v7 = *(_DWORD **)(v6 + 592);
    if (v7 && *v7 != *(_DWORD *)(v6 + 112))
    {
      unsigned int v10 = sub_1B2FB460C(v6);
      os_unfair_lock_unlock((os_unfair_lock_t)(v6 + 104));
      if (v10)
      {
        if (v10 < 0xB) {
          return;
        }
        uint64_t has_internal_diagnostics = os_variant_has_internal_diagnostics();
        if (!has_internal_diagnostics) {
          goto LABEL_37;
        }
        goto LABEL_34;
      }
    }
    else
    {
      os_unfair_lock_unlock((os_unfair_lock_t)(v6 + 104));
    }
  }
  if (!a2) {
    return;
  }
  uint64_t v8 = sub_1B2FB1720();
  if (!v8) {
    return;
  }
  uint64_t v9 = v8;
  if ((*(_DWORD *)(v8 + 24) & 0x80000000) != 0) {
    goto LABEL_12;
  }
  if (qword_1EB1C94E0 != -1) {
    dispatch_once(&qword_1EB1C94E0, &unk_1F0B10B10);
  }
  if (byte_1EB1C94D8)
  {
    qword_1E9CAF980 = (uint64_t)"BUG IN CLIENT OF LIBNOTIFY: loopback mode enabled but process wants to IPC to notifyd";
    __break(1u);
    return;
  }
  if (*(void *)(v9 + 88))
  {
LABEL_12:
    sub_1B2FB17A0((char *)v9);
    return;
  }
  if (*(_DWORD *)(v6 + 384) || (v32 = sub_1B2FAF064(v6)) == 0)
  {
    v19 = strdup(a2);
    if (v19)
    {
      v20 = v19;
      int v21 = strlen(a2) + 1;
      if ((*(unsigned char *)(v9 + 27) & 4) != 0) {
        a1 = *(_DWORD *)(*(void *)(v9 + 104) + 48);
      }
      int v22 = *(_DWORD *)(v6 + 384);
      v35 = a2;
      v36 = 16777472;
      v37 = v21;
      v38 = *MEMORY[0x1E4F14C30];
      v39 = a1;
      v40 = v21;
      v41 = a3;
      *(void *)msg = 2147483667;
      *(_DWORD *)&msg[8] = v22;
      *(_OWORD *)&msg[12] = xmmword_1B2FB7D20;
      if (MEMORY[0x1E4F14C88]) {
        voucher_mach_msg_set((mach_msg_header_t *)msg);
      }
      v23 = mach_msg((mach_msg_header_t *)msg, 1, 0x40u, 0, 0, 0, 0);
      *(void *)(v9 + 88) = v20;
      *(_DWORD *)(v9 + 96) = a3;
      sub_1B2FB17A0((char *)v9);
      if (v23)
      {
        v24 = os_variant_has_internal_diagnostics();
        if (v24) {
          sub_1B2FB4468("Libnotify: %s failed with code %d (%d) on line %d", v25, v26, v27, v28, v29, v30, v31, (char)"notify_monitor_file");
        }
        else {
          sub_1B2FB44F8(v24, "Libnotify: %s failed with code %d (%d) on line %d", v26, v27, v28, v29, v30, v31, (char)"notify_monitor_file");
        }
      }
      return;
    }
    uint64_t has_internal_diagnostics = os_variant_has_internal_diagnostics();
    if (!has_internal_diagnostics) {
      goto LABEL_37;
    }
LABEL_34:
    sub_1B2FB4468("Libnotify: %s failed with code %d on line %d", v12, v13, v14, v15, v16, v17, v18, (char)"notify_monitor_file");
    return;
  }
  v33 = v32;
  sub_1B2FB17A0((char *)v9);
  if (v33 >= 0xB)
  {
    uint64_t has_internal_diagnostics = os_variant_has_internal_diagnostics();
    if (has_internal_diagnostics) {
      goto LABEL_34;
    }
LABEL_37:
    sub_1B2FB44F8(has_internal_diagnostics, "Libnotify: %s failed with code %d on line %d", v13, v14, v15, v16, v17, v18, (char)"notify_monitor_file");
  }
}

uint64_t sub_1B2FAD9C0(uint64_t a1)
{
  *(void *)(a1 + 96) = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&long long v2 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v2 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)(a1 + 64) = v2;
  *(_OWORD *)(a1 + 80) = v2;
  *(_OWORD *)(a1 + 32) = v2;
  *(_OWORD *)(a1 + 48) = v2;
  *(_OWORD *)a1 = v2;
  *(_OWORD *)(a1 + 16) = v2;
  *(_DWORD *)(a1 + 104) = 0;
  *(_DWORD *)(a1 + 488) = 1;
  *(_DWORD *)(a1 + 396) = -1;
  *(_DWORD *)(a1 + 108) = 0;
  os_set_str_ptr_init();
  *(void *)(a1 + 480) = 32;
  os_set_32_ptr_init();
  *(void *)(a1 + 448) = 20;

  return sub_1B2FADA54(a1 + 128);
}

uint64_t sub_1B2FADA54(uint64_t a1)
{
  *(_DWORD *)(a1 + 208) = 1;
  *(void *)(a1 + 216) = 0xFFFFFFFF00000000;
  os_set_str_ptr_init();
  *(void *)(a1 + 32) = 8;
  os_set_64_ptr_init();
  *(void *)(a1 + 64) = 16;
  os_set_64_ptr_init();
  *(void *)(a1 + 96) = 64;
  os_set_32_ptr_init();
  *(void *)(a1 + 128) = 8;
  os_set_32_ptr_init();
  *(void *)(a1 + 160) = 16;

  return MEMORY[0x1F40CFB90](a1 + 168, 0, 1);
}

uint64_t sub_1B2FADB18()
{
  uint64_t result = sub_1B2FADC54((uint64_t)"com.apple.developer.web-browser-engine.restrict.notifyd", (uint64_t)&unk_1F0B10B30);
  byte_1EB1C94D8 = result;
  return result;
}

void sub_1B2FADB48(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2000000000;
  uint64_t v10 = 0;
  uint64_t v3 = 0;
  v4 = &v3;
  uint64_t v5 = 0x2000000000;
  uint64_t v6 = 0;
  v2[0] = MEMORY[0x1E4F14BE8];
  v2[1] = 0x40000000;
  v2[2] = sub_1B2FAD4E4;
  v2[3] = &unk_1E6018F88;
  v2[4] = &v7;
  v2[5] = &v3;
  *(unsigned char *)(v1 + 576) = sub_1B2FADC54((uint64_t)"com.apple.private.darwin-notification.introspect", (uint64_t)v2);
  *(void *)(v1 + 568) = v4[3];
  *(void *)(v1 + 560) = v8[3];
  _Block_object_dispose(&v3, 8);
  _Block_object_dispose(&v7, 8);
}

uint64_t sub_1B2FADC24()
{
  uint64_t result = sub_1B2FADC54((uint64_t)"com.apple.notify.root_access", (uint64_t)&unk_1F0B10B70);
  byte_1EB1C94C8 = result;
  return result;
}

uint64_t sub_1B2FADC54(uint64_t a1, uint64_t a2)
{
  uint64_t result = xpc_copy_entitlement_for_token();
  if (result)
  {
    v4 = (void *)result;
    uint64_t v5 = (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 16))(a2, result);
    xpc_release(v4);
    return v5;
  }
  return result;
}

uint64_t sub_1B2FADCA8(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t result = MEMORY[0x1B3EB38D0](a3);
  if (result == MEMORY[0x1E4F14D78])
  {
    string_ptr = xpc_string_get_string_ptr(a3);
    size_t length = xpc_string_get_length(a3);
    *(void *)(*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) + 16 * a2) = strdup(string_ptr);
    *(void *)(*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) + 16 * a2 + 8) = length;
    return 1;
  }
  else
  {
    qword_1E9CAF980 = (uint64_t)"BUG IN CLIENT OF LIBNOTIFY: entitlement com.apple.private.darwin-notification.introspect "
                               "must be a non-empty array of *strings*";
    __break(1u);
  }
  return result;
}

uint32_t notify_cancel(int token)
{
  uint64_t v1 = sub_1B2FB1800();
  if ((*(_DWORD *)(v1 + 116) & 2) == 0)
  {
LABEL_5:
    os_unfair_lock_lock_with_options();
    uint64_t v3 = os_set_32_ptr_find();
    if (v3 && (v4 = *(void *)(v1 + 448), uint64_t v5 = v3 - v4, v3 != v4))
    {
      int v7 = *(_DWORD *)(v5 + 24);
      if ((v7 & 0x1000000) == 0)
      {
        *(_DWORD *)(v5 + 24) = v7 | 0x1000000;
        sub_1B2FB196C(v1, (char *)v5);
      }
      os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 104));
      return 0;
    }
    else
    {
      os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 104));
      return 2;
    }
  }
  os_unfair_lock_lock_with_options();
  long long v2 = *(_DWORD **)(v1 + 592);
  if (!v2 || *v2 == *(_DWORD *)(v1 + 112))
  {
    os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 104));
    goto LABEL_5;
  }
  unsigned int v9 = sub_1B2FB460C(v1);
  os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 104));
  if (!v9) {
    goto LABEL_5;
  }
  uint32_t v6 = v9;
  if (v9 >= 0xB)
  {
    uint32_t v6 = 1000000;
    uint64_t has_internal_diagnostics = os_variant_has_internal_diagnostics();
    if (has_internal_diagnostics) {
      sub_1B2FB4468("Libnotify: %s failed with code %d on line %d", v11, v12, v13, v14, v15, v16, v17, (char)"notify_cancel");
    }
    else {
      sub_1B2FB44F8(has_internal_diagnostics, "Libnotify: %s failed with code %d on line %d", v12, v13, v14, v15, v16, v17, (char)"notify_cancel");
    }
  }
  return v6;
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  mach_msg_return_t v12;
  int v13;
  uint32_t v14;
  unsigned int v16;
  uint64_t has_internal_diagnostics;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  mach_port_name_t v27;
  mach_msg_return_t v28;
  BOOL v29;
  uint32_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  BOOL v39;
  uint32_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  int msg;
  unsigned char msg_4[60];
  uint64_t v51;

  v51 = *MEMORY[0x1E4F14BF8];
  uint64_t v4 = sub_1B2FB1800();
  if ((*(_DWORD *)(v4 + 116) & 2) != 0)
  {
    os_unfair_lock_lock_with_options();
    uint64_t v5 = *(_DWORD **)(v4 + 592);
    if (v5 && *v5 != *(_DWORD *)(v4 + 112))
    {
      uint64_t v16 = sub_1B2FB460C(v4);
      os_unfair_lock_unlock((os_unfair_lock_t)(v4 + 104));
      if (v16)
      {
        uint64_t v14 = v16;
        if (v16 >= 0xB)
        {
          uint64_t v14 = 1000000;
          uint64_t has_internal_diagnostics = os_variant_has_internal_diagnostics();
          if (has_internal_diagnostics) {
            sub_1B2FB4468("Libnotify: %s failed with code %d on line %d", v18, v19, v20, v21, v22, v23, v24, (char)"notify_get_state");
          }
          else {
            sub_1B2FB44F8(has_internal_diagnostics, "Libnotify: %s failed with code %d on line %d", v19, v20, v21, v22, v23, v24, (char)"notify_get_state");
          }
        }
        return v14;
      }
    }
    else
    {
      os_unfair_lock_unlock((os_unfair_lock_t)(v4 + 104));
    }
  }
  uint64_t v6 = sub_1B2FB1720();
  if (!v6) {
    return 2;
  }
  uint64_t v7 = v6;
  if (!*(void *)(v6 + 104))
  {
    sub_1B2FB17A0((char *)v6);
    return 2;
  }
  if ((*(_DWORD *)(v6 + 24) & 0x80000000) == 0)
  {
    if (qword_1EB1C94E0 != -1) {
      dispatch_once(&qword_1EB1C94E0, &unk_1F0B10B10);
    }
    if (byte_1EB1C94D8)
    {
      qword_1E9CAF980 = (uint64_t)"BUG IN CLIENT OF LIBNOTIFY: loopback mode enabled but process wants to IPC to notifyd";
      __break(1u);
    }
    if (!*(_DWORD *)(v4 + 384))
    {
      v30 = sub_1B2FAF064(v4);
      if (v30)
      {
        uint64_t v14 = v30;
        sub_1B2FB17A0((char *)v7);
        if (v14 >= 0xB)
        {
          v31 = os_variant_has_internal_diagnostics();
          if (v31) {
            sub_1B2FB4468("Libnotify: %s failed with code %d on line %d", v32, v33, v34, v35, v36, v37, v38, (char)"notify_get_state");
          }
          else {
            sub_1B2FB44F8(v31, "Libnotify: %s failed with code %d on line %d", v33, v34, v35, v36, v37, v38, (char)"notify_get_state");
          }
          return 1000000;
        }
        return v14;
      }
    }
    uint64_t v8 = *(os_unfair_lock_s **)(v7 + 104);
    if ((*(unsigned char *)(v7 + 27) & 4) != 0) {
      token = v8[12]._os_unfair_lock_opaque;
    }
    os_unfair_lock_lock_with_options();
    unint64_t v9 = *(void *)&v8->_os_unfair_lock_opaque;
    os_unfair_lock_unlock(v8 + 10);
    int v10 = *(_DWORD *)(v4 + 384);
    if (v9 >= 0xFFFFFFFFFFFFFFFELL)
    {
      memset(&msg_4[16], 0, 44);
      *(_OWORD *)msg_4 = 0uLL;
      *(void *)&msg_4[20] = *MEMORY[0x1E4F14C30];
      *(_DWORD *)&msg_4[28] = token;
      mach_port_name_t special_reply_port = mig_get_special_reply_port();
      *(_DWORD *)&msg_4[4] = v10;
      *(_DWORD *)&msg_4[8] = special_reply_port;
      msg = 5395;
      *(void *)&msg_4[12] = 0x3FA00000000;
      if (MEMORY[0x1E4F14C88])
      {
        voucher_mach_msg_set((mach_msg_header_t *)&msg);
        mach_port_name_t special_reply_port = *(_DWORD *)&msg_4[8];
      }
      uint64_t v12 = mach_msg((mach_msg_header_t *)&msg, 3162115, 0x24u, 0x40u, special_reply_port, 0, 0);
      uint64_t v13 = v12;
      if ((v12 - 268435458) <= 0xE && ((1 << (v12 - 2)) & 0x4003) != 0)
      {
        sub_1B2FB17A0((char *)v7);
LABEL_81:
        uint64_t v14 = 1000000;
        v41 = os_variant_has_internal_diagnostics();
        if (v41) {
          sub_1B2FB4468("Libnotify: %s failed with code %d (%d) on line %d", v42, v43, v44, v45, v46, v47, v48, (char)"notify_get_state");
        }
        else {
          sub_1B2FB44F8(v41, "Libnotify: %s failed with code %d (%d) on line %d", v43, v44, v45, v46, v47, v48, (char)"notify_get_state");
        }
        return v14;
      }
      if (v12)
      {
        mig_dealloc_special_reply_port();
LABEL_89:
        v40 = 0;
        goto LABEL_90;
      }
      if (*(_DWORD *)&msg_4[16] == 71)
      {
        uint64_t v13 = -308;
      }
      else if (*(_DWORD *)&msg_4[16] == 1118)
      {
        if ((msg & 0x80000000) == 0)
        {
          if (*(_DWORD *)msg_4 == 56)
          {
            if (!*(_DWORD *)&msg_4[4])
            {
              uint64_t v13 = *(_DWORD *)&msg_4[28];
              if (!*(_DWORD *)&msg_4[28])
              {
                *state64 = *(void *)&msg_4[32];
                unint64_t v9 = *(void *)&msg_4[40];
                v40 = *(_DWORD *)&msg_4[48];
LABEL_90:
                if (!(v13 | v40))
                {
                  sub_1B2FAE4C4(v8, v9);
                  sub_1B2FB17A0((char *)v7);
                  return 0;
                }
LABEL_80:
                sub_1B2FB17A0((char *)v7);
                if (!v13 && v40 < 0xB) {
                  return v40;
                }
                goto LABEL_81;
              }
              goto LABEL_88;
            }
          }
          else if (*(_DWORD *)msg_4 == 36)
          {
            if (*(_DWORD *)&msg_4[4]) {
              v39 = 1;
            }
            else {
              v39 = *(_DWORD *)&msg_4[28] == 0;
            }
            if (v39) {
              uint64_t v13 = -300;
            }
            else {
              uint64_t v13 = *(_DWORD *)&msg_4[28];
            }
            goto LABEL_88;
          }
        }
        uint64_t v13 = -300;
      }
      else
      {
        uint64_t v13 = -301;
      }
LABEL_88:
      mach_msg_destroy((mach_msg_header_t *)&msg);
      goto LABEL_89;
    }
    memset(&msg_4[16], 0, 36);
    *(_OWORD *)msg_4 = 0uLL;
    *(void *)&msg_4[20] = *MEMORY[0x1E4F14C30];
    *(void *)&msg_4[28] = v9;
    v27 = mig_get_special_reply_port();
    *(_DWORD *)&msg_4[4] = v10;
    *(_DWORD *)&msg_4[8] = v27;
    msg = 5395;
    *(void *)&msg_4[12] = 0x3F900000000;
    if (MEMORY[0x1E4F14C88])
    {
      voucher_mach_msg_set((mach_msg_header_t *)&msg);
      v27 = *(_DWORD *)&msg_4[8];
    }
    v28 = mach_msg((mach_msg_header_t *)&msg, 3162115, 0x28u, 0x38u, v27, 0, 0);
    uint64_t v13 = v28;
    if ((v28 - 268435458) > 0xE || ((1 << (v28 - 2)) & 0x4003) == 0)
    {
      if (!v28)
      {
        if (*(_DWORD *)&msg_4[16] == 71)
        {
          uint64_t v13 = -308;
        }
        else if (*(_DWORD *)&msg_4[16] == 1117)
        {
          if ((msg & 0x80000000) == 0)
          {
            if (*(_DWORD *)msg_4 == 48)
            {
              if (!*(_DWORD *)&msg_4[4])
              {
                uint64_t v13 = *(_DWORD *)&msg_4[28];
                if (!*(_DWORD *)&msg_4[28])
                {
                  *state64 = *(void *)&msg_4[32];
                  v40 = *(_DWORD *)&msg_4[40];
                  goto LABEL_80;
                }
                goto LABEL_78;
              }
            }
            else if (*(_DWORD *)msg_4 == 36)
            {
              if (*(_DWORD *)&msg_4[4]) {
                v29 = 1;
              }
              else {
                v29 = *(_DWORD *)&msg_4[28] == 0;
              }
              if (v29) {
                uint64_t v13 = -300;
              }
              else {
                uint64_t v13 = *(_DWORD *)&msg_4[28];
              }
              goto LABEL_78;
            }
          }
          uint64_t v13 = -300;
        }
        else
        {
          uint64_t v13 = -301;
        }
LABEL_78:
        mach_msg_destroy((mach_msg_header_t *)&msg);
        goto LABEL_79;
      }
      mig_dealloc_special_reply_port();
    }
LABEL_79:
    v40 = 0;
    goto LABEL_80;
  }
  if (state64)
  {
    *state64 = 0;
    os_unfair_lock_lock_with_options();
    v25 = os_set_64_ptr_find();
    if (v25 && (v26 = *(void *)(v4 + 192), v26 != v25))
    {
      uint64_t v14 = 0;
      *state64 = *(void *)(v25 - v26 + 24);
    }
    else
    {
      uint64_t v14 = 1;
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(v4 + 344));
  }
  else
  {
    uint64_t v14 = 10;
  }
  sub_1B2FB17A0((char *)v7);
  return v14;
}

void sub_1B2FAE4C4(os_unfair_lock_s *a1, uint64_t a2)
{
  if (a1)
  {
    uint64_t v4 = a1 + 10;
    os_unfair_lock_lock_with_options();
    os_unfair_lock_assert_owner(v4);
    *(void *)&a1->_os_unfair_lock_opaque = a2;
    os_unfair_lock_unlock(v4);
  }
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  if ((sub_1B2FAE5B4(name) & 1) == 0 && os_variant_has_internal_diagnostics()) {
    sub_1B2FB4468("LIBNOTIFY INTROSPECT: registering for non-exempt notification %s", v9, v10, v11, v12, v13, v14, v15, (char)name);
  }

  return sub_1B2FAEE9C((char *)name, (unsigned int *)out_token, queue, handler, 0);
}

uint64_t sub_1B2FAE5B4(const char *a1)
{
  uint64_t v2 = sub_1B2FB1800();
  block[0] = MEMORY[0x1E4F14BE8];
  block[1] = 0x40000000;
  block[2] = sub_1B2FADB48;
  block[3] = &unk_1E6018F38;
  block[4] = v2;
  if (qword_1EB1C94E8 == -1)
  {
    if (!a1) {
      return 1;
    }
  }
  else
  {
    dispatch_once(&qword_1EB1C94E8, block);
    if (!a1) {
      return 1;
    }
  }
  if (!*(unsigned char *)(v2 + 576)) {
    return 1;
  }
  uint64_t v3 = *(void *)(v2 + 568);
  if (v3)
  {
    uint64_t v4 = (void *)(*(void *)(v2 + 560) + 8);
    do
    {
      uint64_t v5 = (const char *)*(v4 - 1);
      size_t v6 = *v4 - 1;
      if (v5[v6] == 42)
      {
        if (!strncmp(a1, v5, v6)) {
          return 1;
        }
      }
      else if (!strcmp(a1, v5))
      {
        return 1;
      }
      v4 += 2;
      --v3;
    }
    while (v3);
  }
  return 0;
}

uint32_t notify_post(const char *name)
{
  mach_msg_return_t v40;
  uint64_t v41;
  unsigned int v42;
  mach_msg_header_t msg[23];
  uint64_t v44;

  v44 = *MEMORY[0x1E4F14BF8];
  uint64_t v2 = sub_1B2FB1800();
  if ((*(_DWORD *)(v2 + 116) & 2) != 0)
  {
    os_unfair_lock_lock_with_options();
    uint64_t v3 = *(_DWORD **)(v2 + 592);
    if (v3 && *v3 != *(_DWORD *)(v2 + 112))
    {
      unsigned int v9 = sub_1B2FB460C(v2);
      os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 104));
      if (v9)
      {
        uint32_t v7 = v9;
        if (v9 < 0xB) {
          return v7;
        }
        uint32_t v7 = 1000000;
        uint64_t has_internal_diagnostics = os_variant_has_internal_diagnostics();
        if (!has_internal_diagnostics)
        {
LABEL_36:
          sub_1B2FB44F8(has_internal_diagnostics, "Libnotify: %s failed with code %d on line %d", v12, v13, v14, v15, v16, v17, (char)"notify_post");
          return v7;
        }
LABEL_22:
        sub_1B2FB4468("Libnotify: %s failed with code %d on line %d", v11, v12, v13, v14, v15, v16, v17, (char)"notify_post");
        return v7;
      }
    }
    else
    {
      os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 104));
    }
  }
  if (!name) {
    return 1;
  }
  if (!strncmp(name, "self.", 5uLL)) {
    goto LABEL_10;
  }
  if (qword_1EB1C94E0 != -1) {
    dispatch_once(&qword_1EB1C94E0, &unk_1F0B10B10);
  }
  if (byte_1EB1C94D8)
  {
LABEL_10:
    os_unfair_lock_lock_with_options();
    uint64_t v4 = os_set_str_ptr_find();
    if (v4)
    {
      uint64_t v5 = v4 - *(void *)(v2 + 160);
      if (v5)
      {
        if (*(void *)(v5 + 8))
        {
          ++*(_DWORD *)(v5 + 60);
          size_t v6 = *(void **)v5;
          if (*(void *)v5)
          {
            do
            {
              sub_1B2FB0B08(v2 + 128, (uint64_t)v6);
              size_t v6 = (void *)*v6;
            }
            while (v6);
          }
        }
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 344));
    return 0;
  }
  if (!*(_DWORD *)(v2 + 384))
  {
    unsigned int v31 = sub_1B2FAF064(v2);
    if (v31)
    {
      uint32_t v7 = v31;
      if (v31 < 0xB) {
        return v7;
      }
      uint32_t v7 = 1000000;
      uint64_t has_internal_diagnostics = os_variant_has_internal_diagnostics();
      if (!has_internal_diagnostics) {
        goto LABEL_36;
      }
      goto LABEL_22;
    }
  }
  uint64_t v18 = sub_1B2FB1800();
  v19 = (os_unfair_lock_s *)(v18 + 104);
  os_unfair_lock_lock_with_options();
  v20 = (os_unfair_lock_s *)sub_1B2FB0128(v18, name, -1, 0);
  os_unfair_lock_unlock(v19);
  if (!v20)
  {
    unsigned int v32 = *(_DWORD *)(v2 + 384);
    if ((*(_DWORD *)(v2 + 116) & 4) != 0)
    {
      if (qword_1EB1C94D0 != -1) {
        dispatch_once(&qword_1EB1C94D0, &unk_1F0B10B50);
      }
      int v33 = sub_1B2FB7074(v32, name, byte_1EB1C94C8);
    }
    else
    {
      if (qword_1EB1C94D0 != -1) {
        dispatch_once(&qword_1EB1C94D0, &unk_1F0B10B50);
      }
      int v33 = sub_1B2FB09CC(v32, name, byte_1EB1C94C8);
    }
    if (!v33) {
      return 0;
    }
    uint64_t v23 = os_variant_has_internal_diagnostics();
    uint32_t v7 = 1000000;
    if (!v23) {
      goto LABEL_77;
    }
    goto LABEL_76;
  }
  os_unfair_lock_lock_with_options();
  if ((*(_DWORD *)(v2 + 116) & 4) != 0)
  {
    v42 = *(_DWORD *)(v2 + 384);
    if (qword_1EB1C94D0 != -1) {
      dispatch_once(&qword_1EB1C94D0, &unk_1F0B10B50);
    }
    if (sub_1B2FB7074(v42, name, byte_1EB1C94C8))
    {
      sub_1B2FB02C0(v20);
      uint64_t v23 = os_variant_has_internal_diagnostics();
      uint32_t v7 = 1000000;
      if (v23) {
        goto LABEL_76;
      }
      goto LABEL_77;
    }
    goto LABEL_68;
  }
  uint64_t v21 = *(void *)&v20->_os_unfair_lock_opaque;
  if (*(void *)&v20->_os_unfair_lock_opaque == -2)
  {
    unsigned int v34 = *(_DWORD *)(v2 + 384);
    if (qword_1EB1C94D0 != -1) {
      dispatch_once(&qword_1EB1C94D0, &unk_1F0B10B50);
    }
    mach_port_name_t v35 = byte_1EB1C94C8;
    memset(msg, 0, 512);
    *(void *)&msg[1].msgh_bits = *MEMORY[0x1E4F14C30];
    if (MEMORY[0x1E4F14C50]) {
      mach_port_t v36 = mig_strncpy_zerofill((char *)&msg[1].msgh_voucher_port, name, 512);
    }
    else {
      mach_port_t v36 = mig_strncpy((char *)&msg[1].msgh_voucher_port, name, 512);
    }
    msg[1].msgh_remote_port = 0;
    msg[1].msgh_local_port = v36;
    mach_msg_size_t v38 = ((v36 + 3) & 0xFFFFFFFC) + 44;
    *(mach_port_name_t *)((char *)&msg[1].msgh_voucher_port + ((v36 + 3) & 0xFFFFFFFC)) = v35;
    mach_port_name_t special_reply_port = mig_get_special_reply_port();
    *(void *)&msg[0].msgh_remote_port = __PAIR64__(special_reply_port, v34);
    msg[0].msgh_bits = 5395;
    *(void *)&msg[0].msgh_voucher_port = 0x3F000000000;
    if (MEMORY[0x1E4F14C88])
    {
      voucher_mach_msg_set(msg);
      mach_port_name_t special_reply_port = msg[0].msgh_local_port;
    }
    v40 = mach_msg(msg, 3162115, v38, 0x38u, special_reply_port, 0, 0);
    if ((v40 - 268435458) > 0xE || ((1 << (v40 - 2)) & 0x4003) == 0)
    {
      if (v40)
      {
        mig_dealloc_special_reply_port();
      }
      else if (msg[0].msgh_id != 1108 {
             || (msg[0].msgh_bits & 0x80000000) != 0
      }
             || *(void *)&msg[0].msgh_size != 48
             || msg[1].msgh_remote_port)
      {
        mach_msg_destroy(msg);
      }
      else
      {
        if (!msg[1].msgh_id)
        {
          v41 = *(void *)&msg[1].msgh_local_port;
          os_unfair_lock_assert_owner(v20 + 10);
          goto LABEL_67;
        }
        if (msg[1].msgh_id == 60)
        {
          os_unfair_lock_assert_owner(v20 + 10);
          v41 = -1;
LABEL_67:
          *(void *)&v20->_os_unfair_lock_opaque = v41;
          goto LABEL_68;
        }
      }
    }
    uint32_t v7 = 1000000;
    sub_1B2FB02C0(v20);
    uint64_t v23 = os_variant_has_internal_diagnostics();
    if (!v23) {
      goto LABEL_77;
    }
LABEL_76:
    sub_1B2FB4468("Libnotify: %s failed with code %d (%d) on line %d", v24, v25, v26, v27, v28, v29, v30, (char)"notify_post");
    return v7;
  }
  if (v21 == -1)
  {
    unsigned int v22 = *(_DWORD *)(v2 + 384);
    if (qword_1EB1C94D0 != -1) {
      dispatch_once(&qword_1EB1C94D0, &unk_1F0B10B50);
    }
    if (sub_1B2FB09CC(v22, name, byte_1EB1C94C8))
    {
      sub_1B2FB02C0(v20);
      uint64_t v23 = os_variant_has_internal_diagnostics();
      uint32_t v7 = 1000000;
      if (v23) {
        goto LABEL_76;
      }
LABEL_77:
      sub_1B2FB44F8(v23, "Libnotify: %s failed with code %d (%d) on line %d", v25, v26, v27, v28, v29, v30, (char)"notify_post");
      return v7;
    }
    os_unfair_lock_assert_owner(v20 + 10);
    v41 = -2;
    goto LABEL_67;
  }
  unsigned int v37 = *(_DWORD *)(v2 + 384);
  if (qword_1EB1C94D0 != -1) {
    dispatch_once(&qword_1EB1C94D0, &unk_1F0B10B50);
  }
  *(void *)&msg[1].msgh_bits = *MEMORY[0x1E4F14C30];
  *(void *)&msg[1].msgh_remote_port = v21;
  msg[1].msgh_voucher_port = byte_1EB1C94C8;
  *(void *)&msg[0].msgh_bits = 19;
  *(void *)&msg[0].msgh_voucher_port = 0x3F100000000;
  *(void *)&msg[0].msgh_remote_port = v37;
  if (MEMORY[0x1E4F14C88]) {
    voucher_mach_msg_set(msg);
  }
  if (mach_msg(msg, 2097153, 0x2Cu, 0, 0, 0, 0))
  {
    sub_1B2FB02C0(v20);
    uint64_t v23 = os_variant_has_internal_diagnostics();
    uint32_t v7 = 1000000;
    if (v23) {
      goto LABEL_76;
    }
    goto LABEL_77;
  }
LABEL_68:
  sub_1B2FB02C0(v20);
  return 0;
}

uint64_t sub_1B2FAEE9C(char *a1, unsigned int *a2, NSObject *a3, const void *a4, int a5)
{
  uint64_t v10 = sub_1B2FB1800();
  if ((*(_DWORD *)(v10 + 116) & 2) != 0)
  {
    os_unfair_lock_lock_with_options();
    uint64_t v11 = *(_DWORD **)(v10 + 592);
    if (v11 && *v11 != *(_DWORD *)(v10 + 112))
    {
      uint64_t v15 = sub_1B2FB460C(v10);
      os_unfair_lock_unlock((os_unfair_lock_t)(v10 + 104));
      if (v15)
      {
        uint64_t v12 = v15;
        if (v15 < 0xB) {
          return v12;
        }
        uint64_t v12 = 1000000;
        uint64_t has_internal_diagnostics = os_variant_has_internal_diagnostics();
        if (has_internal_diagnostics) {
          goto LABEL_15;
        }
        goto LABEL_16;
      }
    }
    else
    {
      os_unfair_lock_unlock((os_unfair_lock_t)(v10 + 104));
    }
  }
  uint64_t v12 = 10;
  if (a3)
  {
    if (a4)
    {
      notify_set_options(3u);
      uint64_t v12 = sub_1B2FAF7CC(a1, a2, v10, a5);
      if (!v12)
      {
        uint64_t v13 = sub_1B2FB1720();
        if (v13)
        {
          uint64_t v14 = v13;
          *(void *)(v13 + 48) = a3;
          dispatch_retain(a3);
          *(void *)(v14 + 56) = _Block_copy(a4);
          sub_1B2FB17A0((char *)v14);
          return 0;
        }
        uint64_t v12 = 1000000;
        uint64_t has_internal_diagnostics = os_variant_has_internal_diagnostics();
        if (has_internal_diagnostics)
        {
LABEL_15:
          sub_1B2FB4468("Libnotify: %s failed with code %d on line %d", v17, v18, v19, v20, v21, v22, v23, (char)"_notify_register_dispatch_with_extra_mp");
          return v12;
        }
LABEL_16:
        sub_1B2FB44F8(has_internal_diagnostics, "Libnotify: %s failed with code %d on line %d", v18, v19, v20, v21, v22, v23, (char)"_notify_register_dispatch_with_extra_mp");
      }
    }
  }
  return v12;
}

uint64_t sub_1B2FAF064(uint64_t a1)
{
  uint64_t v2 = (os_unfair_lock_s *)(a1 + 104);
  os_unfair_lock_lock_with_options();
  sub_1B2FAF0B0(a1, 0);
  uint64_t v4 = v3;
  os_unfair_lock_unlock(v2);
  return v4;
}

void sub_1B2FAF0B0(uint64_t a1, int a2)
{
  kern_return_t v12;
  int v13;
  uintptr_t v14;
  NSObject *global_queue;
  NSObject *v16;
  int v17;
  mach_port_name_t special_reply_port;
  mach_msg_return_t v19;
  int v20;
  BOOL v21;
  int v22;
  uint64_t *v23;
  int v24;
  NSObject *v25;
  NSObject *v26;
  int v27;
  void block[6];
  int v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  int v33;
  uint64_t v34;
  char *__lasts;
  uint64_t v36;
  uint64_t v37;
  unsigned char name[36];
  long long v39;
  int v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E4F14BF8];
  uint64_t v30 = 0;
  unsigned int v31 = &v30;
  unsigned int v32 = 0x2000000000;
  int v33 = 0;
  uint64_t v29 = 0;
  if ((*(_DWORD *)(a1 + 116) & 0x8000000) != 0) {
    goto LABEL_45;
  }
  os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 104));
  if (os_variant_has_internal_diagnostics() && (uint64_t v4 = getenv("DarwinNotificationLogging")) != 0)
  {
    uint64_t v5 = v4;
    if (!strcmp(v4, "1"))
    {
      *(void *)name = 0;
      *(void *)&name[8] = 0;
      mach_port_t v36 = 0;
      unsigned int v37 = 0;
      if ((_dyld_get_image_uuid() & 1) == 0)
      {
        *(void *)name = 0;
        *(void *)&name[8] = 0;
      }
      if (_dyld_get_shared_cache_uuid())
      {
        __lasts = 0;
        _dyld_get_shared_cache_range();
      }
      else
      {
        mach_port_t v36 = 0;
        unsigned int v37 = 0;
      }
      _os_log_simple();
      size_t v6 = &unk_1E9CAF958;
    }
    else
    {
      size_t v6 = malloc_type_calloc(1uLL, 0x20uLL, 0x10800400F6048E3uLL);
      *size_t v6 = 0;
      os_set_str_ptr_init();
      uint32_t v7 = strdup(v5);
      __lasts = 0;
      uint64_t v8 = strtok_r(v7, ",", &__lasts);
      if (v8)
      {
        unsigned int v9 = v8;
        do
        {
          uint64_t v10 = malloc_type_calloc(1uLL, 8uLL, 0x50040EE9192B6uLL);
          *uint64_t v10 = strdup(v9);
          os_set_str_ptr_insert();
          *(void *)name = 0;
          *(void *)&name[8] = 0;
          mach_port_t v36 = 0;
          unsigned int v37 = 0;
          if ((_dyld_get_image_uuid() & 1) == 0)
          {
            *(void *)name = 0;
            *(void *)&name[8] = 0;
          }
          if (_dyld_get_shared_cache_uuid())
          {
            unsigned int v34 = 0;
            _dyld_get_shared_cache_range();
          }
          else
          {
            mach_port_t v36 = 0;
            unsigned int v37 = 0;
          }
          _os_log_simple();
          unsigned int v9 = strtok_r(0, ",", &__lasts);
        }
        while (v9);
      }
      free(v7);
    }
  }
  else
  {
    size_t v6 = 0;
  }
  *(void *)(a1 + 584) = v6;
  if (_dispatch_is_multithreaded()) {
    atomic_fetch_or_explicit((atomic_uint *volatile)(a1 + 116), 3u, memory_order_relaxed);
  }
  if (qword_1EB1C94E0 != -1) {
    dispatch_once(&qword_1EB1C94E0, &unk_1F0B10B10);
  }
  if (byte_1EB1C94D8 && (*(_DWORD *)(a1 + 116) & 1) != 0)
  {
    if ((*(_DWORD *)(a1 + 392) + 1) <= 1)
    {
      *(_DWORD *)name = 0;
      uint64_t v12 = mach_port_allocate(*MEMORY[0x1E4F14C48], 1u, (mach_port_name_t *)name);
      *((_DWORD *)v31 + 6) = v12;
      if (!v12) {
        sub_1B2FB0EF8(a1, *(unsigned int *)name);
      }
    }
    goto LABEL_45;
  }
  *((_DWORD *)v31 + 6) = 0;
  block[0] = MEMORY[0x1E4F14BE8];
  block[1] = 0x40000000;
  block[2] = sub_1B2FAD490;
  block[3] = &unk_1E6018E58;
  block[4] = &v30;
  void block[5] = a1;
  if (*(void *)(a1 + 376) != -1) {
    dispatch_once((dispatch_once_t *)(a1 + 376), block);
  }
  if (*((_DWORD *)v31 + 6) || (int v11 = *(_DWORD *)(a1 + 384), (v11 + 1) < 2))
  {
LABEL_45:
    _Block_object_dispose(&v30, 8);
    return;
  }
  uint64_t v13 = *(_DWORD *)(a1 + 112);
  if (a2 != 1 && v13)
  {
LABEL_36:
    if (!*(void *)(a1 + 408) && (*(_DWORD *)(a1 + 116) & 2) != 0)
    {
      uint64_t v14 = *(int *)(a1 + 112);
      if (v14)
      {
        global_queue = dispatch_get_global_queue(2, 0);
        uint64_t v16 = dispatch_source_create(MEMORY[0x1E4F14BD0], v14, 0x80000000uLL, global_queue);
        *(void *)(a1 + 408) = v16;
        dispatch_source_set_event_handler_f(v16, (dispatch_function_t)sub_1B2FB45BC);
        dispatch_resume(*(dispatch_object_t *)(a1 + 408));
      }
    }
    if ((*(_DWORD *)(a1 + 116) & 1) != 0 && (*(_DWORD *)(a1 + 392) + 1) <= 1)
    {
      *(_DWORD *)name = 0;
      uint64_t v17 = sub_1B2FB0FD8(*(_DWORD *)(a1 + 384), &v29, name);
      *((_DWORD *)v31 + 6) = v17;
      if (!v17 && !v29) {
        sub_1B2FB0EF8(a1, *(unsigned int *)name);
      }
    }
    goto LABEL_45;
  }
  LODWORD(v36) = 0;
  LODWORD(__lasts) = 0;
  *(_DWORD *)(a1 + 112) = 0;
  v40 = 0;
  v39 = 0u;
  memset(&name[4], 0, 32);
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  *(_DWORD *)&name[8] = v11;
  *(_DWORD *)&name[12] = special_reply_port;
  *(_DWORD *)name = 5395;
  *(void *)&name[16] = 0x3FF00000000;
  if (MEMORY[0x1E4F14C88])
  {
    voucher_mach_msg_set((mach_msg_header_t *)name);
    mach_port_name_t special_reply_port = *(_DWORD *)&name[12];
  }
  uint64_t v19 = mach_msg((mach_msg_header_t *)name, 3227651, 0x18u, 0x38u, special_reply_port, 0, 0);
  uint64_t v20 = v19;
  if ((v19 - 268435458) <= 0xE && ((1 << (v19 - 2)) & 0x4003) != 0)
  {
    *((_DWORD *)v31 + 6) = v19;
LABEL_74:
    uint64_t v22 = sub_1B2FB6EFC(*(_DWORD *)(a1 + 384), &v36, &__lasts, &v29);
    uint64_t v23 = v31;
    *((_DWORD *)v31 + 6) = v22;
    if (!v22)
    {
      atomic_fetch_or_explicit((atomic_uint *volatile)(a1 + 116), 7u, memory_order_relaxed);
      uint64_t v22 = *((_DWORD *)v23 + 6);
    }
    if (v22 || v29) {
      goto LABEL_45;
    }
    goto LABEL_78;
  }
  if (v19)
  {
    mig_dealloc_special_reply_port();
    goto LABEL_73;
  }
  if (*(_DWORD *)&name[20] == 71)
  {
    uint64_t v20 = -308;
LABEL_72:
    mach_msg_destroy((mach_msg_header_t *)name);
LABEL_73:
    *((_DWORD *)v31 + 6) = v20;
    if (!v20) {
      goto LABEL_78;
    }
    goto LABEL_74;
  }
  if (*(_DWORD *)&name[20] != 1123)
  {
    uint64_t v20 = -301;
    goto LABEL_72;
  }
  if ((*(_DWORD *)name & 0x80000000) != 0) {
    goto LABEL_71;
  }
  if (*(_DWORD *)&name[4] != 48)
  {
    if (*(_DWORD *)&name[4] == 36)
    {
      if (*(_DWORD *)&name[8]) {
        uint64_t v21 = 1;
      }
      else {
        uint64_t v21 = *(_DWORD *)&name[32] == 0;
      }
      if (v21) {
        uint64_t v20 = -300;
      }
      else {
        uint64_t v20 = *(_DWORD *)&name[32];
      }
      goto LABEL_72;
    }
    goto LABEL_71;
  }
  if (*(_DWORD *)&name[8])
  {
LABEL_71:
    uint64_t v20 = -300;
    goto LABEL_72;
  }
  uint64_t v20 = *(_DWORD *)&name[32];
  if (*(_DWORD *)&name[32]) {
    goto LABEL_72;
  }
  LODWORD(__lasts) = DWORD1(v39);
  LODWORD(v36) = v39;
  uint64_t v27 = DWORD2(v39);
  uint64_t v29 = DWORD2(v39);
  *((_DWORD *)v31 + 6) = 0;
  if (v27) {
    goto LABEL_45;
  }
LABEL_78:
  if (v36 > 2)
  {
    uint64_t v24 = (int)__lasts;
    *(_DWORD *)(a1 + 112) = __lasts;
    if (a2 == 1 && v24 == v13) {
      goto LABEL_45;
    }
    uint64_t v25 = *(NSObject **)(a1 + 408);
    if (v25)
    {
      dispatch_source_cancel(v25);
      dispatch_release(*(dispatch_object_t *)(a1 + 408));
      *(void *)(a1 + 408) = 0;
    }
    if ((*(_DWORD *)(a1 + 392) + 1) >= 2)
    {
      uint64_t v26 = *(NSObject **)(a1 + 400);
      if (v26)
      {
        dispatch_source_cancel(v26);
        dispatch_release(*(dispatch_object_t *)(a1 + 400));
        *(void *)(a1 + 400) = 0;
      }
      *(_DWORD *)(a1 + 392) = 0;
    }
    goto LABEL_36;
  }
  qword_1E9CAF980 = (uint64_t)"BUG IN LIBNOTIFY: Unsupported protocol version";
  qword_1E9CAF9B0 = v36;
  __break(1u);
}

uint64_t sub_1B2FAF7CC(char *__s1, unsigned int *a2, uint64_t a3, int a4)
{
  uint64_t v54 = *MEMORY[0x1E4F14BF8];
  if (!a3) {
    __assert_rtn("notify_register_coalesced_registration", "notify_client.c", 3148, "globals");
  }
  if (!__s1) {
    __assert_rtn("notify_register_coalesced_registration", "notify_client.c", 3149, "name");
  }
  if (strncmp(__s1, "self.", 5uLL))
  {
    if (qword_1EB1C94E0 != -1) {
      dispatch_once(&qword_1EB1C94E0, &unk_1F0B10B10);
    }
    if (!byte_1EB1C94D8)
    {
      if (!*(_DWORD *)(a3 + 384) || (*(_DWORD *)(a3 + 392) + 1) <= 1)
      {
        uint64_t v9 = sub_1B2FAF064(a3);
        if (v9)
        {
          uint64_t v10 = v9;
          if ((v9 - 10) > 0xFFFFFFFD) {
            return v10;
          }
          uint64_t has_internal_diagnostics = os_variant_has_internal_diagnostics();
          if (has_internal_diagnostics)
          {
LABEL_46:
            sub_1B2FB4468("Libnotify: %s failed with code %d on line %d", v12, v13, v14, v15, v16, v17, v18, (char)"notify_register_coalesced_registration");
            return v10;
          }
LABEL_47:
          sub_1B2FB44F8(has_internal_diagnostics, "Libnotify: %s failed with code %d on line %d", v13, v14, v15, v16, v17, v18, (char)"notify_register_coalesced_registration");
          return v10;
        }
      }
      os_unfair_lock_lock_with_options();
      uint64_t v19 = os_set_str_ptr_find();
      if (v19)
      {
        uint64_t v20 = *(void *)(a3 + 480);
        if (v20 != v19)
        {
          if (*(void *)(v19 - v20 + 24))
          {
            uint64_t v21 = os_set_str_ptr_find();
            if (v21) {
              uint64_t v22 = v21 - *(void *)(a3 + 480);
            }
            else {
              uint64_t v22 = 0;
            }
            char v41 = 0;
            atomic_fetch_add_explicit((atomic_uint *volatile)(*(void *)(v22 + 24) + 16), 1u, memory_order_relaxed);
LABEL_54:
            os_unfair_lock_unlock((os_unfair_lock_t)(a3 + 104));
            int v43 = atomic_fetch_add_explicit((atomic_uint *volatile)(a3 + 488), 1u, memory_order_relaxed) + 1;
            if ((a4 - 1) >= 0xFFFFFFFE) {
              int v44 = 0;
            }
            else {
              int v44 = a4;
            }
            uint64_t v10 = sub_1B2FAFE48(__s1, -1, v43, v43, -1, 0x44000007u, v44, -1, *(_DWORD *)(a3 + 384), v41);
            if ((v41 & 1) == 0) {
              sub_1B2FB17A0(*(char **)(v22 + 24));
            }
            if (v10)
            {
              if (v10 >= 0xB)
              {
                uint64_t v45 = os_variant_has_internal_diagnostics();
                if (v45) {
                  sub_1B2FB4468("Libnotify: %s failed with code %d on line %d", v46, v47, v48, v49, v50, v51, v52, (char)"notify_register_coalesced_registration");
                }
                else {
                  sub_1B2FB44F8(v45, "Libnotify: %s failed with code %d on line %d", v47, v48, v49, v50, v51, v52, (char)"notify_register_coalesced_registration");
                }
                return 1000000;
              }
            }
            else
            {
              uint64_t v10 = 0;
              if (a2) {
                *a2 = v43;
              }
            }
            return v10;
          }
        }
      }
      unsigned int add_explicit = atomic_fetch_add_explicit((atomic_uint *volatile)(a3 + 488), 1u, memory_order_relaxed);
      unsigned int v24 = *(_DWORD *)(a3 + 384);
      mach_port_name_t v25 = add_explicit + 1;
      memset(msg, 0, 512);
      *(void *)&msg[1].msgh_bits = *MEMORY[0x1E4F14C30];
      if (MEMORY[0x1E4F14C50]) {
        mach_port_t v26 = mig_strncpy_zerofill((char *)&msg[1].msgh_voucher_port, __s1, 512);
      }
      else {
        mach_port_t v26 = mig_strncpy((char *)&msg[1].msgh_voucher_port, __s1, 512);
      }
      msg[1].msgh_remote_port = 0;
      msg[1].msgh_local_port = v26;
      unsigned int v27 = (v26 + 3) & 0xFFFFFFFC;
      *(mach_port_name_t *)((char *)&msg[1].msgh_voucher_port + v27) = v25;
      msg[0].msgh_bits = 19;
      *(void *)&msg[0].msgh_remote_port = v24;
      *(void *)&msg[0].msgh_voucher_port = 0x40200000000;
      if (MEMORY[0x1E4F14C88]) {
        voucher_mach_msg_set(msg);
      }
      if (mach_msg(msg, 1, v27 + 44, 0, 0, 0, 0))
      {
        os_unfair_lock_unlock((os_unfair_lock_t)(a3 + 104));
        uint64_t v28 = os_variant_has_internal_diagnostics();
        uint64_t v10 = 1000000;
        if (v28) {
          sub_1B2FB4468("Libnotify: %s failed with code %d (%d) on line %d", v29, v30, v31, v32, v33, v34, v35, (char)"notify_register_coalesced_registration");
        }
        else {
          sub_1B2FB44F8(v28, "Libnotify: %s failed with code %d (%d) on line %d", v30, v31, v32, v33, v34, v35, (char)"notify_register_coalesced_registration");
        }
        return v10;
      }
      int v36 = *(_DWORD *)(a3 + 392);
      os_unfair_lock_assert_owner((const os_unfair_lock *)(a3 + 104));
      uint64_t v37 = os_set_32_ptr_find();
      if (!v37 || *(void *)(a3 + 448) == v37)
      {
        mach_msg_size_t v38 = (char *)malloc_type_calloc(1uLL, 0x70uLL, 0x10B00400AF92624uLL);
        if (v38)
        {
          v39 = v38;
          v40 = sub_1B2FB0128(a3, __s1, -1, 1);
          if (v40)
          {
            *((_DWORD *)v39 + 4) = 1;
            *((_DWORD *)v39 + 5) = v25;
            *((_DWORD *)v39 + 16) = v25;
            *(_OWORD *)(v39 + 24) = xmmword_1B2FB7D10;
            *((_DWORD *)v39 + 10) = -1;
            *((_DWORD *)v39 + 11) = v36;
            *((void *)v39 + 13) = v40;
            v40[3] = v39;
            *((_DWORD *)v40 + 12) = v25;
            os_set_32_ptr_insert();
            if (sub_1B2FB0268())
            {
              *(_OWORD *)&msg[0].msgh_bits = 0uLL;
              if ((_dyld_get_image_uuid() & 1) == 0) {
                *(_OWORD *)&msg[0].msgh_bits = 0uLL;
              }
              if (_dyld_get_shared_cache_uuid()) {
                _dyld_get_shared_cache_range();
              }
              _os_log_simple();
            }
            uint64_t v42 = os_set_str_ptr_find();
            if (v42) {
              uint64_t v22 = v42 - *(void *)(a3 + 480);
            }
            else {
              uint64_t v22 = 0;
            }
            char v41 = 1;
            goto LABEL_54;
          }
          free(v39);
        }
      }
      os_unfair_lock_unlock((os_unfair_lock_t)(a3 + 104));
      uint64_t has_internal_diagnostics = os_variant_has_internal_diagnostics();
      uint64_t v10 = 1000000;
      if (has_internal_diagnostics) {
        goto LABEL_46;
      }
      goto LABEL_47;
    }
  }

  return sub_1B2FB0364(__s1, (mach_port_name_t *)(a3 + 392), 1073741825, a2, (os_unfair_lock_s *)a3);
}

uint64_t sub_1B2FAFE48(const char *a1, uint64_t a2, int a3, int a4, int a5, unsigned int a6, int a7, int a8, int a9, char a10)
{
  uint64_t v17 = sub_1B2FB1800();
  uint64_t v18 = (os_unfair_lock_s *)(v17 + 104);
  os_unfair_lock_lock_with_options();
  uint64_t v19 = os_set_32_ptr_find();
  if (v19 && *(void *)(v17 + 448) != v19) {
    goto LABEL_19;
  }
  uint64_t v20 = (os_unfair_lock *)sub_1B2FB0128(v17, a1, a2, 1);
  if (!v20) {
    goto LABEL_19;
  }
  uint64_t v21 = v20;
  char v37 = (char)a1;
  lock = v20 + 10;
  os_unfair_lock_lock_with_options();
  uint64_t v22 = malloc_type_calloc(1uLL, 0x70uLL, 0x10B00400AF92624uLL);
  if (!v22)
  {
    sub_1B2FB02C0(v21);
LABEL_19:
    os_unfair_lock_unlock(v18);
    return 14;
  }
  v22[4] = 1;
  int v36 = v22;
  v22[5] = a3;
  uint64_t v23 = (char *)(v22 + 5);
  os_set_32_ptr_insert();
  unsigned int v24 = a6 & 0xBFFFFFFF;
  if ((a6 & 0x4000000) == 0) {
    unsigned int v24 = a6;
  }
  *((_DWORD *)v23 + 1) = v24;
  *((_DWORD *)v23 + 2) = a5;
  *((_DWORD *)v23 + 3) = 0;
  *((_DWORD *)v23 + 4) = a8;
  *((_DWORD *)v23 + 5) = a7;
  *((_DWORD *)v23 + 6) = a9;
  *((_DWORD *)v23 + 11) = a4;
  *(void *)(v23 + 84) = v21;
  if ((v24 & 0x4000000) != 0 && (*(_DWORD *)(v17 + 116) & 1) != 0 && (v24 & 0xF) - 3 <= 4)
  {
    os_unfair_lock_assert_owner(lock);
    if ((a10 & 1) == 0)
    {
      uint64_t v25 = *(void *)&v21[6]._os_unfair_lock_opaque;
      if (v25) {
        atomic_fetch_add_explicit((atomic_uint *volatile)(v25 + 16), 1u, memory_order_relaxed);
      }
    }
    *int v36 = 0;
    mach_port_t v26 = *(void **)&v21[4]._os_unfair_lock_opaque;
    v36[1] = v26;
    *mach_port_t v26 = v36;
    *(void *)&v21[4]._os_unfair_lock_opaque = v36;
  }
  if (!LOBYTE(v21[13]._os_unfair_lock_opaque) && v21[11]._os_unfair_lock_opaque == 500)
  {
    LOBYTE(v21[13]._os_unfair_lock_opaque) = 1;
    uint64_t has_internal_diagnostics = os_variant_has_internal_diagnostics();
    if (has_internal_diagnostics) {
      sub_1B2FB4468("notify name \"%s\" has been registered %d times - this may be a leak", v28, v29, v30, v31, v32, v33, v34, v37);
    }
    else {
      sub_1B2FB44F8(has_internal_diagnostics, "notify name \"%s\" has been registered %d times - this may be a leak", v29, v30, v31, v32, v33, v34, v37);
    }
  }
  if (sub_1B2FB0268())
  {
    _dyld_get_image_uuid();
    if (_dyld_get_shared_cache_uuid()) {
      _dyld_get_shared_cache_range();
    }
    _os_log_simple();
  }
  os_unfair_lock_unlock(lock);
  os_unfair_lock_unlock(v18);
  return 0;
}

void *sub_1B2FB0128(uint64_t a1, const char *a2, uint64_t a3, int a4)
{
  os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 104));
  uint64_t v8 = os_set_str_ptr_find();
  if (v8 && (uint64_t v9 = *(void *)(a1 + 480), v9 != v8))
  {
    uint64_t v10 = (void *)(v8 - v9);
    atomic_fetch_add_explicit((atomic_uint *volatile)(v8 - v9 + 44), 1u, memory_order_relaxed);
  }
  else
  {
    if (!a4) {
      return 0;
    }
    uint64_t v10 = malloc_type_calloc(1uLL, 0x38uLL, 0x10B0040952A5435uLL);
    if (v10)
    {
      size_t v11 = strlen(a2) + 1;
      if (_dyld_is_memory_immutable())
      {
        char v12 = 0;
LABEL_10:
        v10[4] = a2;
        *((unsigned char *)v10 + 53) = v12;
        *((_DWORD *)v10 + 11) = 1;
        v10[1] = 0;
        *uint64_t v10 = a3;
        v10[2] = v10 + 1;
        *((_DWORD *)v10 + 12) = -1;
        *((_DWORD *)v10 + 10) = 0;
        *((unsigned char *)v10 + 52) = 0;
        os_set_str_ptr_insert();
        return v10;
      }
      uint64_t v13 = (char *)malloc_type_malloc(v11, 0xDA311156uLL);
      if (v13)
      {
        uint64_t v14 = v13;
        memcpy(v13, a2, v11);
        char v12 = 1;
        a2 = v14;
        goto LABEL_10;
      }
      free(v10);
      return 0;
    }
  }
  return v10;
}

BOOL sub_1B2FB0268()
{
  v0 = *(unsigned char **)(sub_1B2FB1800() + 584);
  if (!v0) {
    return 0;
  }
  if (*v0) {
    return 1;
  }
  return os_set_str_ptr_find() != 0;
}

void sub_1B2FB02C0(os_unfair_lock_s *a1)
{
  os_unfair_lock_unlock(a1 + 10);
  uint64_t v2 = (const os_unfair_lock *)sub_1B2FB1800();
  os_unfair_lock_lock_with_options();
  signed int v3 = atomic_fetch_add_explicit((atomic_uint *volatile)&a1[11], 0xFFFFFFFF, memory_order_release) - 1;
  if (v3 < 0) {
    __assert_rtn("atomic_refcount_release", "notify_client.c", 293, "result >= 0");
  }
  if (!v3)
  {
    __dmb(9u);
    sub_1B2FB24FC(v2, (uint64_t)a1);
  }

  os_unfair_lock_unlock((os_unfair_lock_t)&v2[26]);
}

uint64_t sub_1B2FB0364(const char *a1, mach_port_name_t *name, int a3, unsigned int *a4, os_unfair_lock_s *a5)
{
  if (!a5) {
    __assert_rtn("notify_register_mach_port_self", "notify_client.c", 2941, "globals");
  }
  if (a3)
  {
    mach_port_name_t v20 = *name;
    if (v20 + 1 < 2 || mach_port_insert_right(*MEMORY[0x1E4F14C48], v20, *name, 0x14u)) {
      return 3;
    }
  }
  else
  {
    uint64_t v10 = (ipc_space_t *)MEMORY[0x1E4F14C48];
    if (mach_port_allocate(*MEMORY[0x1E4F14C48], 1u, name))
    {
      uint64_t v11 = 1000000;
      uint64_t has_internal_diagnostics = os_variant_has_internal_diagnostics();
      if (has_internal_diagnostics) {
        sub_1B2FB4468("Libnotify: %s failed with code %d (%d) on line %d", v13, v14, v15, v16, v17, v18, v19, (char)"notify_register_mach_port_self");
      }
      else {
        sub_1B2FB44F8(has_internal_diagnostics, "Libnotify: %s failed with code %d (%d) on line %d", v14, v15, v16, v17, v18, v19, (char)"notify_register_mach_port_self");
      }
      return v11;
    }
    if (mach_port_insert_right(*v10, *name, *name, 0x14u))
    {
      mach_port_destruct(*v10, *name, 0, 0);
      return 3;
    }
  }
  unsigned int add_explicit = atomic_fetch_add_explicit((atomic_uint *volatile)&a5[122], 1u, memory_order_relaxed);
  mach_port_t v22 = *name;
  if (*name - 1 >= 0xFFFFFFFE)
  {
    uint64_t v11 = 3;
    if (a3) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }
  unsigned int v23 = add_explicit + 1;
  uint64_t v46 = 0;
  os_unfair_lock_lock_with_options();
  uint64_t v24 = sub_1B2FB06D4((uint64_t)&a5[32], a1, v23, &v46);
  if (v24)
  {
    uint64_t v11 = v24;
    os_unfair_lock_unlock(a5 + 86);
    if (a3)
    {
LABEL_19:
      if (v11 >= 0xB)
      {
        uint64_t v25 = os_variant_has_internal_diagnostics();
        if (v25) {
          sub_1B2FB4468("Libnotify: %s failed with code %d on line %d", v26, v27, v28, v29, v30, v31, v32, (char)"notify_register_mach_port_self");
        }
        else {
          sub_1B2FB44F8(v25, "Libnotify: %s failed with code %d on line %d", v27, v28, v29, v30, v31, v32, (char)"notify_register_mach_port_self");
        }
        return 1000000;
      }
      return v11;
    }
LABEL_18:
    mach_port_destruct(*MEMORY[0x1E4F14C48], *name, 0, 0);
    goto LABEL_19;
  }
  uint64_t v34 = v46;
  *(unsigned char *)(v46 + 79) = *(unsigned char *)(v46 + 79) & 0xF0 | 3;
  *(_DWORD *)(v34 + 56) = v22;
  uint64_t v35 = *(void *)(*(void *)(v34 + 48) + 16);
  os_unfair_lock_unlock(a5 + 86);
  uint64_t v36 = sub_1B2FAFE48(a1, v35, v23, v23, -1, 0x80000003, -1, -1, *name, 0);
  if (v36)
  {
    uint64_t v37 = v36;
    if ((a3 & 1) == 0) {
      mach_port_destruct(*MEMORY[0x1E4F14C48], *name, 0, 0);
    }
    sub_1B2FB22A8((uint64_t)&a5[32]);
    uint64_t v11 = v37;
    if (v37 >= 0xB)
    {
      uint64_t v11 = 1000000;
      uint64_t v38 = os_variant_has_internal_diagnostics();
      if (v38) {
        sub_1B2FB4468("Libnotify: %s failed with code %d on line %d", v39, v40, v41, v42, v43, v44, v45, (char)"notify_register_mach_port_self");
      }
      else {
        sub_1B2FB44F8(v38, "Libnotify: %s failed with code %d on line %d", v40, v41, v42, v43, v44, v45, (char)"notify_register_mach_port_self");
      }
    }
  }
  else
  {
    *a4 = v23;
    sub_1B2FB0898((uint64_t)a5, *name, a3);
    return 0;
  }
  return v11;
}

uint64_t sub_1B2FB06D4(uint64_t a1, const char *a2, unsigned int a3, void *a4)
{
  if (!a4) {
    return 0;
  }
  if (!a2) {
    return 7;
  }
  *a4 = 0;
  uint64_t v8 = os_set_str_ptr_find();
  if (!v8 || (uint64_t v9 = *(void *)(a1 + 32), v10 = v8 - v9, v8 == v9))
  {
    size_t v11 = strlen(a2);
    char v12 = (char *)malloc_type_calloc(1uLL, v11 + 73, 0x1817CFD2uLL);
    if (!v12) {
      return 47;
    }
    uint64_t v10 = (uint64_t)v12;
    ++*(_DWORD *)(a1 + 224);
    uint64_t v13 = v12 + 72;
    *(void *)(v10 + 8) = v13;
    memcpy(v13, a2, v11 + 1);
    uint64_t v14 = *(void *)a1 + 1;
    *(void *)(v10 + 16) = *(void *)a1;
    *(void *)a1 = v14;
    *(void *)(v10 + 48) = -4294966477;
    *(_DWORD *)(v10 + 60) = 1;
    *(void *)uint64_t v10 = 0;
    os_set_str_ptr_insert();
    os_set_64_ptr_insert();
  }
  ++*(_DWORD *)(v10 + 56);
  uint64_t v15 = os_set_64_ptr_find();
  if ((!v15 || *(void *)(a1 + 96) == v15) && (uint64_t v16 = malloc_type_calloc(1uLL, 0x58uLL, 0x10A0040BED8B209uLL)) != 0)
  {
    uint64_t v17 = v16;
    ++*(_DWORD *)(a1 + 232);
    v16[8] = a3;
    v16[6] = v10;
    uint64_t v18 = *(void *)v10;
    *uint64_t v16 = *(void *)v10;
    if (v18) {
      *(void *)(v18 + 8) = v16;
    }
    *(void *)uint64_t v10 = v16;
    v16[1] = v10;
    os_set_64_ptr_insert();
    uint64_t result = 0;
    *a4 = v17;
  }
  else
  {
    sub_1B2FB23F8(a1, v10);
    return 48;
  }
  return result;
}

void sub_1B2FB0898(uint64_t a1, int a2, int a3)
{
  if (a2)
  {
    char v3 = a3;
    if ((a3 & 0x40000000) == 0)
    {
      size_t v6 = (os_unfair_lock_s *)(a1 + 104);
      os_unfair_lock_lock_with_options();
      uint32_t v7 = *(_DWORD **)(a1 + 552);
      uint64_t v8 = *(unsigned int *)(a1 + 544);
      if (v8)
      {
        uint64_t v9 = 0;
        uint64_t v10 = *(int **)(a1 + 552);
        while (1)
        {
          int v11 = *v10;
          v10 += 3;
          if (v11 == a2) {
            break;
          }
          if (v8 == ++v9) {
            goto LABEL_7;
          }
        }
        ++v7[3 * v9 + 1];
      }
      else
      {
LABEL_7:
        *(_DWORD *)(a1 + 544) = v8 + 1;
        unsigned int v12 = *(_DWORD *)(a1 + 548);
        if (v8 >= v12)
        {
          unsigned int v13 = v12 >= 4 ? 2 * v12 : 4;
          *(_DWORD *)(a1 + 548) = v13;
          uint32_t v7 = reallocf(v7, 12 * v13);
          *(void *)(a1 + 552) = v7;
          if (!v7)
          {
            qword_1E9CAF980 = (uint64_t)"BUG IN CLIENT OF LIBNOTIFY: Unable to allocate port array: possible notification "
                                       "registration leak";
            __break(1u);
            return;
          }
        }
        uint64_t v14 = (char *)&v7[3 * v8];
        *(_DWORD *)uint64_t v14 = a2;
        *((_DWORD *)v14 + 1) = 1;
        v14[8] = (v3 & 1) == 0;
      }
      os_unfair_lock_unlock(v6);
    }
  }
}

uint64_t sub_1B2FB09CC(unsigned int a1, const char *a2, int a3)
{
  uint64_t v11 = *MEMORY[0x1E4F14BF8];
  memset(v10, 0, 480);
  long long v8 = 0u;
  long long v9 = 0u;
  *((void *)&v9 + 1) = *MEMORY[0x1E4F14C30];
  if (MEMORY[0x1E4F14C50]) {
    int v5 = mig_strncpy_zerofill((char *)v10 + 8, a2, 512);
  }
  else {
    int v5 = mig_strncpy((char *)v10 + 8, a2, 512);
  }
  LODWORD(v10[0]) = 0;
  DWORD1(v10[0]) = v5;
  uint64_t v6 = (v5 + 3) & 0xFFFFFFFC;
  *(_DWORD *)((char *)v10 + v6 + 8) = a3;
  LODWORD(v8) = 19;
  *((void *)&v8 + 1) = a1;
  *(void *)&long long v9 = 0x3F200000000;
  if (MEMORY[0x1E4F14C88]) {
    voucher_mach_msg_set((mach_msg_header_t *)&v8);
  }
  return mach_msg((mach_msg_header_t *)&v8, 2097153, v6 + 44, 0, 0, 0, 0);
}

void sub_1B2FB0B08(uint64_t a1, uint64_t a2)
{
  uint64_t v25 = *MEMORY[0x1E4F14BF8];
  if ((*(unsigned char *)(a2 + 79) & 0x20) != 0)
  {
    char v8 = *(unsigned char *)(a2 + 79) | 0x40;
    goto LABEL_31;
  }
  uint64_t v4 = os_set_32_ptr_find();
  if (v4)
  {
    uint64_t v5 = *(void *)(a1 + 160);
    char v6 = *(unsigned char *)(a2 + 79);
    if (v5 != v4)
    {
      uint64_t v7 = v4 - v5;
      if (*(unsigned char *)(v7 + 20))
      {
        ++*(unsigned char *)(a2 + 78);
        char v8 = v6 | 0x60;
        goto LABEL_31;
      }
      char v9 = 0;
      goto LABEL_8;
    }
    uint64_t v7 = 0;
  }
  else
  {
    uint64_t v7 = 0;
    char v6 = *(unsigned char *)(a2 + 79);
  }
  char v9 = 1;
LABEL_8:
  switch(v6 & 0xF)
  {
    case 3:
      mach_port_t v10 = *(_DWORD *)(a2 + 56);
      goto LABEL_36;
    case 4:
      if ((*(_DWORD *)(a2 + 56) & 0x80000000) != 0) {
        goto LABEL_30;
      }
      LODWORD(v24[0]) = bswap32(*(_DWORD *)(a2 + 64));
      if (write_NOCANCEL() != 4)
      {
        close_NOCANCEL();
        *(_DWORD *)(a2 + 56) = -1;
        return;
      }
LABEL_29:
      char v6 = *(unsigned char *)(a2 + 79);
LABEL_30:
      char v8 = v6 & 0x3F;
      break;
    case 5:
      pid_t v11 = *(_DWORD *)(a2 + 68);
      if (!v11) {
        pid_t v11 = getpid();
      }
      if (!kill(v11, *(_DWORD *)(a2 + 56))) {
        goto LABEL_29;
      }
      return;
    case 6:
      xpc_object_t v12 = xpc_dictionary_create(0, 0, 0);
      xpc_dictionary_set_string(v12, "Notification", *(const char **)(*(void *)(a2 + 48) + 8));
      uint64_t v13 = os_set_64_ptr_find();
      if (v13)
      {
        uint64_t v14 = *(void *)(a1 + 64);
        if (v14 != v13) {
          xpc_dictionary_set_uint64(v12, "_State", *(void *)(v13 - v14 + 24));
        }
      }
      int v15 = xpc_event_publisher_fire_noboost();
      xpc_release(v12);
      if (!v15) {
        goto LABEL_29;
      }
      if (v15 == 55 && !*(unsigned char *)(a2 + 80))
      {
        *(unsigned char *)(a2 + 80) = 1;
        memset(v24, 0, sizeof(v24));
        if (xpc_get_service_identifier_for_token())
        {
          if (os_variant_has_internal_diagnostics()) {
            sub_1B2FB4468("BUG IN CLIENT OF NOTIFYD: %s has not dequeued the last %d messages", v16, v17, v18, v19, v20, v21, v22, (char)v24);
          }
        }
      }
      return;
    case 7:
      if ((v9 & 1) == 0)
      {
        uint64_t v23 = *(void *)(v7 + 24);
        if (v23)
        {
          mach_port_t v10 = *(_DWORD *)(v23 + 8);
LABEL_36:
          sub_1B2FB0DAC(a1, a2, v10);
        }
      }
      return;
    default:
      goto LABEL_30;
  }
LABEL_31:
  *(unsigned char *)(a2 + 79) = v8;
}

uint64_t sub_1B2FB0DAC(uint64_t a1, uint64_t a2, mach_port_t a3)
{
  uint64_t v6 = os_set_32_ptr_find();
  if (v6 && (uint64_t v7 = *(void *)(a1 + 128), v7 != v6))
  {
    uint64_t v8 = v6 - v7;
    if (*(unsigned char *)(v6 - v7 + 12))
    {
      uint64_t result = 0;
      ++*(unsigned char *)(a2 + 78);
      char v13 = *(unsigned char *)(a2 + 79) | 0x60;
      goto LABEL_16;
    }
    char v9 = 0;
  }
  else
  {
    uint64_t v8 = 0;
    char v9 = 1;
  }
  if ((*(_DWORD *)(a1 + 208) & 2) != 0) {
    mach_msg_option_t v10 = 145;
  }
  else {
    mach_msg_option_t v10 = 17;
  }
  *(void *)&msg.msgh_bits = 0x1800000013;
  msg.msgh_remote_port = a3;
  msg.msgh_local_port = 0;
  mach_msg_id_t v11 = *(_DWORD *)(a2 + 64);
  msg.msgh_voucher_port = 0;
  msg.msgh_id = v11;
  uint64_t result = mach_msg(&msg, v10, 0x18u, 0, 0, 0, 0);
  if (!result)
  {
    char v13 = *(unsigned char *)(a2 + 79) & 0x3F;
LABEL_16:
    *(unsigned char *)(a2 + 79) = v13;
    return result;
  }
  if (result != 268435460) {
    return 46;
  }
  mach_msg_destroy(&msg);
  if ((*(unsigned char *)(a1 + 208) & 2) == 0) {
    return 45;
  }
  ++*(unsigned char *)(a2 + 78);
  *(unsigned char *)(a2 + 79) |= 0xE0u;
  uint64_t result = 0;
  if ((v9 & 1) == 0) {
    *(_DWORD *)(v8 + 12) |= 1u;
  }
  return result;
}

void sub_1B2FB0EF8(uint64_t a1, unsigned int a2)
{
  *(_DWORD *)(a1 + 392) = a2;
  uintptr_t v4 = a2;
  global_queue = dispatch_get_global_queue(2, 0);
  uint64_t v6 = dispatch_source_create(MEMORY[0x1E4F14BC8], v4, 0, global_queue);
  *(void *)(a1 + 400) = v6;
  dispatch_set_context(v6, (void *)a1);
  dispatch_source_set_event_handler_f(*(dispatch_source_t *)(a1 + 400), (dispatch_function_t)sub_1B2FB163C);
  uint64_t v7 = *(NSObject **)(a1 + 400);
  handler[0] = MEMORY[0x1E4F14BE8];
  handler[1] = 0x40000000;
  handler[2] = sub_1B2FB4BB8;
  handler[3] = &unk_1E6018E78;
  unsigned int v9 = a2;
  dispatch_source_set_cancel_handler(v7, handler);
  dispatch_resume(*(dispatch_object_t *)(a1 + 400));
}

uint64_t sub_1B2FB0FD8(int a1, _DWORD *a2, _DWORD *a3)
{
  uint64_t v13 = 0;
  long long v12 = 0u;
  *(_OWORD *)&msg[20] = 0u;
  *(_DWORD *)&msg[4] = 0;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  *(_DWORD *)&msg[8] = a1;
  *(_DWORD *)&msg[12] = special_reply_port;
  *(_DWORD *)mach_msg_header_t msg = 5395;
  *(void *)&msg[16] = 0x40100000000;
  if (MEMORY[0x1E4F14C88])
  {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
    mach_port_name_t special_reply_port = *(_DWORD *)&msg[12];
  }
  uint64_t v7 = mach_msg((mach_msg_header_t *)msg, 3162115, 0x18u, 0x3Cu, special_reply_port, 0, 0);
  uint64_t v8 = v7;
  if ((v7 - 268435458) > 0xE || ((1 << (v7 - 2)) & 0x4003) == 0)
  {
    if (!v7)
    {
      if (*(_DWORD *)&msg[20] == 71)
      {
        uint64_t v8 = 4294966988;
      }
      else if (*(_DWORD *)&msg[20] == 1125)
      {
        if ((*(_DWORD *)msg & 0x80000000) == 0)
        {
          if (*(_DWORD *)&msg[4] == 36)
          {
            uint64_t v8 = 4294966996;
            if (*(_DWORD *)&msg[32])
            {
              if (*(_DWORD *)&msg[8]) {
                uint64_t v8 = 4294966996;
              }
              else {
                uint64_t v8 = *(unsigned int *)&msg[32];
              }
            }
          }
          else
          {
            uint64_t v8 = 4294966996;
          }
          goto LABEL_23;
        }
        uint64_t v8 = 4294966996;
        if (*(_DWORD *)&msg[24] == 1 && *(_DWORD *)&msg[4] == 52 && !*(_DWORD *)&msg[8] && WORD1(v12) << 16 == 0x100000)
        {
          uint64_t v8 = 0;
          int v9 = *(_DWORD *)&msg[28];
          *a2 = HIDWORD(v12);
          *a3 = v9;
          return v8;
        }
      }
      else
      {
        uint64_t v8 = 4294966995;
      }
LABEL_23:
      mach_msg_destroy((mach_msg_header_t *)msg);
      return v8;
    }
    mig_dealloc_special_reply_port();
  }
  return v8;
}

uint32_t notify_check(int token, int *check)
{
  mach_msg_return_t v26;
  int v27;
  uint64_t v28;
  int v29;
  int v30;
  BOOL v31;
  unsigned char msg[36];
  long long v34;

  uint64_t v4 = sub_1B2FB1800();
  if ((*(_DWORD *)(v4 + 116) & 2) != 0)
  {
    os_unfair_lock_lock_with_options();
    uint64_t v5 = *(_DWORD **)(v4 + 592);
    if (v5 && *v5 != *(_DWORD *)(v4 + 112))
    {
      unsigned int v12 = sub_1B2FB460C(v4);
      os_unfair_lock_unlock((os_unfair_lock_t)(v4 + 104));
      if (v12)
      {
        int v11 = v12;
        if (v12 >= 0xB)
        {
          int v11 = 1000000;
          uint64_t has_internal_diagnostics = os_variant_has_internal_diagnostics();
          if (has_internal_diagnostics)
          {
LABEL_65:
            sub_1B2FB4468("Libnotify: %s failed with code %d on line %d", v14, v15, v16, v17, v18, v19, v20, (char)"notify_check");
            goto LABEL_68;
          }
LABEL_67:
          sub_1B2FB44F8(has_internal_diagnostics, "Libnotify: %s failed with code %d on line %d", v15, v16, v17, v18, v19, v20, (char)"notify_check");
          goto LABEL_68;
        }
        goto LABEL_68;
      }
    }
    else
    {
      os_unfair_lock_unlock((os_unfair_lock_t)(v4 + 104));
    }
  }
  if (check)
  {
    uint64_t v6 = sub_1B2FB1720();
    if (v6)
    {
      uint64_t v7 = v6;
      if ((*(_DWORD *)(v6 + 24) & 0x80000000) != 0)
      {
        os_unfair_lock_lock_with_options();
        uint64_t v21 = os_set_64_ptr_find();
        if (v21 && (uint64_t v22 = *(void *)(v4 + 224), v22 != v21))
        {
          uint64_t v28 = v21 - v22;
          uint64_t v29 = *(_DWORD *)(*(void *)(v28 + 48) + 60);
          if (v29 == *(_DWORD *)(v28 + 72))
          {
            uint64_t v30 = 0;
          }
          else
          {
            *(_DWORD *)(v28 + 72) = v29;
            uint64_t v30 = 1;
          }
          unsigned int v10 = 0;
          *check = v30;
        }
        else
        {
          unsigned int v10 = 2;
        }
        os_unfair_lock_unlock((os_unfair_lock_t)(v4 + 344));
LABEL_63:
        sub_1B2FB17A0((char *)v7);
        if (v10 < 0xB)
        {
          int v11 = v10;
          goto LABEL_68;
        }
        int v11 = 1000000;
        uint64_t has_internal_diagnostics = os_variant_has_internal_diagnostics();
        if (has_internal_diagnostics) {
          goto LABEL_65;
        }
        goto LABEL_67;
      }
      if (qword_1EB1C94E0 != -1) {
        dispatch_once(&qword_1EB1C94E0, &unk_1F0B10B10);
      }
      if (byte_1EB1C94D8)
      {
        qword_1E9CAF980 = (uint64_t)"BUG IN CLIENT OF LIBNOTIFY: loopback mode enabled but process wants to IPC to notifyd";
        __break(1u);
        return v6;
      }
      int v8 = *(_DWORD *)(v7 + 24);
      if ((v8 & 0xF) == 1)
      {
        if (*(void *)(v4 + 592))
        {
          *check = 0;
          os_unfair_lock_lock_with_options();
          uint64_t v9 = *(void *)(v4 + 592);
          if (*(_DWORD *)(v7 + 32) != *(_DWORD *)(v9 + 4 * *(unsigned int *)(v7 + 28)))
          {
            *check = 1;
            *(_DWORD *)(v7 + 32) = *(_DWORD *)(v9 + 4 * *(unsigned int *)(v7 + 28));
          }
          os_unfair_lock_unlock((os_unfair_lock_t)(v4 + 108));
          unsigned int v10 = 0;
        }
        else
        {
          unsigned int v10 = 32;
        }
        goto LABEL_63;
      }
      if (!*(_DWORD *)(v4 + 384))
      {
        unsigned int v10 = sub_1B2FAF064(v4);
        if (v10) {
          goto LABEL_63;
        }
        int v8 = *(_DWORD *)(v7 + 24);
      }
      int v23 = token;
      if ((v8 & 0x4000000) != 0) {
        int v23 = *(_DWORD *)(*(void *)(v7 + 104) + 48);
      }
      int v24 = *(_DWORD *)(v4 + 384);
      *(_OWORD *)&msg[20] = 0u;
      uint64_t v34 = 0u;
      *(_OWORD *)&msg[4] = 0u;
      *(void *)&msg[24] = *MEMORY[0x1E4F14C30];
      *(_DWORD *)&msg[32] = v23;
      mach_port_name_t special_reply_port = mig_get_special_reply_port();
      *(_DWORD *)&msg[8] = v24;
      *(_DWORD *)&msg[12] = special_reply_port;
      *(_DWORD *)mach_msg_header_t msg = 5395;
      *(void *)&msg[16] = 0x3EA00000000;
      if (MEMORY[0x1E4F14C88])
      {
        voucher_mach_msg_set((mach_msg_header_t *)msg);
        mach_port_name_t special_reply_port = *(_DWORD *)&msg[12];
      }
      uint64_t v26 = mach_msg((mach_msg_header_t *)msg, 3162115, 0x24u, 0x34u, special_reply_port, 0, 0);
      uint64_t v27 = v26;
      if ((v26 - 268435458) <= 0xE && ((1 << (v26 - 2)) & 0x4003) != 0)
      {
        unsigned int v10 = 33;
        goto LABEL_63;
      }
      if (v26)
      {
        mig_dealloc_special_reply_port();
        goto LABEL_60;
      }
      if (*(_DWORD *)&msg[20] == 71)
      {
        uint64_t v27 = -308;
      }
      else if (*(_DWORD *)&msg[20] == 1102)
      {
        if ((*(_DWORD *)msg & 0x80000000) == 0)
        {
          if (*(_DWORD *)&msg[4] == 44)
          {
            if (!*(_DWORD *)&msg[8])
            {
              uint64_t v27 = *(_DWORD *)&msg[32];
              if (!*(_DWORD *)&msg[32])
              {
                unsigned int v10 = DWORD1(v34);
                *check = v34;
                goto LABEL_63;
              }
              goto LABEL_59;
            }
          }
          else if (*(_DWORD *)&msg[4] == 36)
          {
            if (*(_DWORD *)&msg[8]) {
              uint64_t v31 = 1;
            }
            else {
              uint64_t v31 = *(_DWORD *)&msg[32] == 0;
            }
            if (v31) {
              uint64_t v27 = -300;
            }
            else {
              uint64_t v27 = *(_DWORD *)&msg[32];
            }
            goto LABEL_59;
          }
        }
        uint64_t v27 = -300;
      }
      else
      {
        uint64_t v27 = -301;
      }
LABEL_59:
      mach_msg_destroy((mach_msg_header_t *)msg);
LABEL_60:
      if (v27) {
        unsigned int v10 = 33;
      }
      else {
        unsigned int v10 = 0;
      }
      goto LABEL_63;
    }
    int v11 = 2;
  }
  else
  {
    int v11 = 10;
  }
LABEL_68:
  LODWORD(v6) = v11;
  return v6;
}

void sub_1B2FB15A4(uint64_t a1)
{
  if (notify_is_valid_token(*(_DWORD *)(a1 + 56))) {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  _Block_release(*(const void **)(a1 + 32));
  dispatch_release(*(dispatch_object_t *)(a1 + 48));
  uint64_t v2 = *(void **)(a1 + 40);
  if (v2)
  {
    free(v2);
  }
}

void sub_1B2FB163C(uint64_t a1)
{
  mach_port_name_t v1 = *(_DWORD *)(a1 + 392);
  if (v1)
  {
    int v2 = 4;
    do
    {
      int v3 = v2;
      memset(v9, 0, sizeof(v9));
      if (mach_msg((mach_msg_header_t *)v9, 258, 0, 0x20u, v1, 0, 0)) {
        break;
      }
      uint64_t v4 = sub_1B2FB1720();
      if (v4)
      {
        uint64_t v5 = (char *)v4;
        uint64_t v6 = *(void *)(v4 + 104);
        if (v6)
        {
          uint64_t v7 = (os_unfair_lock_s *)(v6 + 40);
          os_unfair_lock_lock_with_options();
          if ((v5[27] & 8) != 0)
          {
            for (i = *(char **)(v6 + 8); i; i = *(char **)i)
            {
              if (i != v5) {
                sub_1B2FB1E44((uint64_t)i);
              }
            }
          }
          else
          {
            sub_1B2FB1E44((uint64_t)v5);
          }
          os_unfair_lock_unlock(v7);
        }
        sub_1B2FB17A0(v5);
      }
      int v2 = v3 - 1;
    }
    while (v3);
  }
}

uint64_t sub_1B2FB1720()
{
  uint64_t v0 = sub_1B2FB1800();
  mach_port_name_t v1 = (os_unfair_lock_s *)(v0 + 104);
  os_unfair_lock_lock_with_options();
  uint64_t v2 = os_set_32_ptr_find();
  if (v2 && (uint64_t v3 = *(void *)(v0 + 448), v3 != v2))
  {
    uint64_t v4 = v2 - v3;
    atomic_fetch_add_explicit((atomic_uint *volatile)(v2 - v3 + 16), 1u, memory_order_relaxed);
  }
  else
  {
    uint64_t v4 = 0;
  }
  os_unfair_lock_unlock(v1);
  return v4;
}

void sub_1B2FB17A0(char *a1)
{
  uint64_t v2 = (os_unfair_lock_s *)sub_1B2FB1800();
  os_unfair_lock_lock_with_options();
  sub_1B2FB196C((uint64_t)v2, a1);

  os_unfair_lock_unlock(v2 + 26);
}

uint64_t sub_1B2FB1800()
{
  v15[3] = *MEMORY[0x1E4F14BF8];
  if (*MEMORY[0x1E4F14C38] == -1) {
    uint64_t v0 = *(void *)(MEMORY[0x1E4F14C38] + 8);
  }
  else {
    uint64_t v0 = _os_alloc_once();
  }
  if ((++qword_1EB1C94F0 & 3) != 0) {
    return v0;
  }
  uint64_t v1 = 0;
  unint64_t v2 = 0;
  uint64_t v3 = 0;
  do
  {
    uint64_t v4 = *(void *)(v0 + 8 * v1);
    if (v4 == 0xAAAAAAAAAAAAAAAALL) {
      goto LABEL_6;
    }
    v3 |= 1 << v1;
    if (v2)
    {
      if (v2 > 2) {
        goto LABEL_6;
      }
    }
    else
    {
      memset(v15, 0, 24);
    }
    v15[v2++] = v4;
LABEL_6:
    ++v1;
  }
  while (v1 != 13);
  if (v3)
  {
    uint64_t has_internal_diagnostics = os_variant_has_internal_diagnostics();
    if (has_internal_diagnostics) {
      sub_1B2FB4468("BUG IN LIBNOTIFY CLIENT: internal data structure corrupted [0x%04llx, 0x%llx, 0x%llx, 0x%llx]]", v6, v7, v8, v9, v10, v11, v12, v3);
    }
    else {
      sub_1B2FB44F8(has_internal_diagnostics, "BUG IN LIBNOTIFY CLIENT: internal data structure corrupted [0x%04llx, 0x%llx, 0x%llx, 0x%llx]]", v7, v8, v9, v10, v11, v12, v3);
    }
    *(void *)(v0 + 96) = 0xAAAAAAAAAAAAAAAALL;
    *(void *)&long long v13 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v13 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)(v0 + 64) = v13;
    *(_OWORD *)(v0 + 80) = v13;
    *(_OWORD *)(v0 + 32) = v13;
    *(_OWORD *)(v0 + 48) = v13;
    *(_OWORD *)uint64_t v0 = v13;
    *(_OWORD *)(v0 + 16) = v13;
  }
  return v0;
}

void sub_1B2FB196C(uint64_t a1, char *a2)
{
  uint64_t v4 = (const os_unfair_lock *)(a1 + 104);
  os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 104));
  if (!a2) {
    return;
  }
  signed int v5 = atomic_fetch_add_explicit((atomic_uint *volatile)a2 + 4, 0xFFFFFFFF, memory_order_release) - 1;
  if (v5 < 0) {
    goto LABEL_58;
  }
  if (v5) {
    return;
  }
  __dmb(9u);
  os_unfair_lock_assert_owner(v4);
  if ((char *)os_set_32_ptr_delete() != a2 + 20) {
    __assert_rtn("_nc_table_delete_n", "table.c", 76, "os_set_delete(&t->set, key) == expected");
  }
  int v6 = *((_DWORD *)a2 + 5);
  int v7 = *((_DWORD *)a2 + 6);
  os_unfair_lock_assert_owner(v4);
  uint64_t v8 = *((void *)a2 + 13);
  if (sub_1B2FB0268())
  {
    _dyld_get_image_uuid();
    if (_dyld_get_shared_cache_uuid()) {
      _dyld_get_shared_cache_range();
    }
    _os_log_simple();
  }
  int v9 = *((_DWORD *)a2 + 6);
  if ((v9 & 0x4000000) != 0)
  {
    os_unfair_lock_assert_owner(v4);
    os_unfair_lock_lock_with_options();
    uint64_t v10 = *(void *)a2;
    uint64_t v11 = (void *)*((void *)a2 + 1);
    if (*(void *)a2)
    {
      *(void *)(v10 + 8) = v11;
      uint64_t v11 = (void *)*((void *)a2 + 1);
    }
    else
    {
      *(void *)(v8 + 16) = v11;
    }
    *uint64_t v11 = v10;
    os_unfair_lock_unlock((os_unfair_lock_t)(v8 + 40));
    sub_1B2FB196C(a1, *(void *)(v8 + 24));
  }
  else if ((v9 & 0x8000000) != 0)
  {
    os_unfair_lock_lock_with_options();
    *(_DWORD *)(v8 + 48) = -1;
    *(void *)(v8 + 24) = 0;
    os_unfair_lock_unlock((os_unfair_lock_t)(v8 + 40));
    sub_1B2FB222C(*(_DWORD *)(a1 + 384), *((_DWORD *)a2 + 5));
  }
  int v12 = *((_DWORD *)a2 + 9);
  os_unfair_lock_assert_owner(v4);
  if (v12 < 0) {
    goto LABEL_37;
  }
  unint64_t v13 = *(unsigned int *)(a1 + 512);
  if (!v13) {
    goto LABEL_37;
  }
  unint64_t v14 = 0;
  do
  {
    if (*(_DWORD *)(*(void *)(a1 + 520) + 4 * v14) == v12) {
      uint64_t v15 = v14;
    }
    else {
      uint64_t v15 = 0xFFFFFFFFLL;
    }
    ++v14;
  }
  while (v14 < v13 && v15 == -1);
  if (v15 == -1) {
    goto LABEL_37;
  }
  uint64_t v16 = *(void *)(a1 + 536);
  int v17 = *(_DWORD *)(v16 + 4 * v15);
  BOOL v18 = __OFSUB__(v17, 1);
  int v19 = v17 - 1;
  if (v19 < 0 == v18)
  {
    *(_DWORD *)(v16 + 4 * v15) = v19;
    if (v19) {
      goto LABEL_37;
    }
  }
  close_NOCANCEL();
  close_NOCANCEL();
  LODWORD(v20) = *(_DWORD *)(a1 + 512);
  if (v20 == 1)
  {
    uint64_t v21 = *(void **)(a1 + 520);
LABEL_36:
    free(v21);
    *(void *)(a1 + 520) = 0;
    free(*(void **)(a1 + 528));
    *(void *)(a1 + 528) = 0;
    free(*(void **)(a1 + 536));
    *(void *)(a1 + 536) = 0;
    *(_DWORD *)(a1 + 512) = 0;
    goto LABEL_37;
  }
  unint64_t v22 = (v15 + 1);
  int v23 = *(_DWORD **)(a1 + 520);
  if (v22 < v20)
  {
    unsigned int v24 = v14 - 1;
    uint64_t v25 = *(void *)(a1 + 528);
    uint64_t v26 = *(void *)(a1 + 536);
    do
    {
      v23[v24] = v23[v22];
      *(_DWORD *)(v25 + 4 * v24) = *(_DWORD *)(v25 + 4 * v22);
      *(_DWORD *)(v26 + 4 * v24++) = *(_DWORD *)(v26 + 4 * v22++);
      unint64_t v20 = *(unsigned int *)(a1 + 512);
    }
    while (v22 < v20);
  }
  *(_DWORD *)(a1 + 512) = v20 - 1;
  *(void *)(a1 + 520) = reallocf(v23, 4 * (v20 - 1));
  *(void *)(a1 + 528) = reallocf(*(void **)(a1 + 528), 4 * *(unsigned int *)(a1 + 512));
  uint64_t v27 = reallocf(*(void **)(a1 + 536), 4 * *(unsigned int *)(a1 + 512));
  *(void *)(a1 + 536) = v27;
  uint64_t v21 = *(void **)(a1 + 520);
  if (!v21 || !v27 || !*(void *)(a1 + 528)) {
    goto LABEL_36;
  }
LABEL_37:
  sub_1B2FB20AC(a1, *((_DWORD *)a2 + 11), *((_DWORD *)a2 + 6));
  if ((*((_DWORD *)a2 + 6) & 0xF) == 7)
  {
    mach_port_name_t v28 = *((_DWORD *)a2 + 10);
    if (v28) {
      sub_1B2FB20AC(a1, v28, *((_DWORD *)a2 + 6) | 0x20000000);
    }
  }
  free(*((void **)a2 + 11));
  uint64_t v29 = (void *)*((void *)a2 + 7);
  if (v29) {
    dispatch_async_f(*((dispatch_queue_t *)a2 + 6), v29, MEMORY[0x1E4F14BE0]);
  }
  *((void *)a2 + 7) = 0;
  uint64_t v30 = *((void *)a2 + 6);
  if (v30) {
    dispatch_release(v30);
  }
  free(a2);
  os_unfair_lock_assert_owner(v4);
  if (!v8) {
    goto LABEL_47;
  }
  signed int v31 = atomic_fetch_add_explicit((atomic_uint *volatile)(v8 + 44), 0xFFFFFFFF, memory_order_release) - 1;
  if (v31 < 0) {
LABEL_58:
  }
    __assert_rtn("atomic_refcount_release", "notify_client.c", 293, "result >= 0");
  if (!v31)
  {
    __dmb(9u);
    sub_1B2FB24FC((const os_unfair_lock *)a1, v8);
    if ((v7 & 0x80000000) == 0) {
      goto LABEL_48;
    }
LABEL_57:
    sub_1B2FB22A8(a1 + 128);
    return;
  }
LABEL_47:
  if (v7 < 0) {
    goto LABEL_57;
  }
LABEL_48:
  if (qword_1EB1C94E0 != -1) {
    dispatch_once(&qword_1EB1C94E0, &unk_1F0B10B10);
  }
  if (byte_1EB1C94D8)
  {
    qword_1E9CAF980 = (uint64_t)"BUG IN CLIENT OF LIBNOTIFY: loopback mode enabled but process wants to IPC to notifyd";
    __break(1u);
  }
  if ((v7 & 0xC000000) == 0)
  {
    uint64_t v32 = sub_1B2FB222C(*(_DWORD *)(a1 + 384), v6);
    if (v32 != -308)
    {
      if (v32)
      {
        if (v32 != 268435459) {
          sub_1B2FB44F8(v32, "<- %s [%d] _notify_server_cancel_2 failed: 0x%08x\n", v33, v34, v35, v36, v37, v38, (char)"registration_node_delete_locked");
        }
      }
    }
  }
}

void sub_1B2FB1E44(uint64_t a1)
{
  if (*(void *)(a1 + 48))
  {
    unint64_t v2 = *(const void **)(a1 + 56);
    if (v2)
    {
      int v3 = *(_DWORD *)(a1 + 24);
      if ((v3 & 0x800000) != 0)
      {
        *(_DWORD *)(a1 + 24) = v3 | 0x400000;
      }
      else
      {
        int v4 = *(_DWORD *)(a1 + 20);
        signed int v5 = _Block_copy(v2);
        int v6 = *(NSObject **)(a1 + 48);
        dispatch_retain(v6);
        v8[0] = MEMORY[0x1E4F14BE8];
        v8[1] = 0x40000000;
        v8[2] = sub_1B2FB15A4;
        v8[3] = &unk_1E6019030;
        int v9 = v4;
        v8[4] = v5;
        v8[5] = 0;
        v8[6] = v6;
        dispatch_block_t v7 = dispatch_block_create(DISPATCH_BLOCK_DETACHED, v8);
        dispatch_async(v6, v7);
        _Block_release(v7);
      }
    }
  }
}

BOOL notify_is_valid_token(int val)
{
  uint64_t v1 = sub_1B2FB1800();
  unint64_t v2 = (os_unfair_lock_s *)(v1 + 104);
  os_unfair_lock_lock_with_options();
  uint64_t v3 = os_set_32_ptr_find();
  BOOL v5 = v3 && (v4 = *(void *)(v1 + 448), v4 != v3) && (*(unsigned char *)(v3 - v4 + 27) & 8) == 0;
  os_unfair_lock_unlock(v2);
  return v5;
}

void notify_set_options(unsigned int a1)
{
  uint64_t v2 = sub_1B2FB1800();
  uint64_t v3 = (unsigned int *)v2;
  if ((*(_DWORD *)(v2 + 116) & 0x8000000) != 0)
  {
    if ((a1 & 0x4000000) == 0)
    {
      *(_DWORD *)(v2 + 120) |= a1;
      return;
    }
    uint64_t v4 = (os_unfair_lock_s *)(v2 + 104);
    os_unfair_lock_lock_with_options();
    v3[29] = v3[30];
    v3[96] = v3[97];
  }
  else
  {
    if ((a1 & 0x8000000) == 0)
    {
      atomic_fetch_or_explicit((atomic_uint *volatile)(v2 + 116), a1, memory_order_relaxed);
      sub_1B2FAF064(v2);
      return;
    }
    uint64_t v4 = (os_unfair_lock_s *)(v2 + 104);
    os_unfair_lock_lock_with_options();
    __swp(v3 + 116, v3 + 29);
    v3[30] = v3 + 116;
    v3[97] = v3[96];
    v3[96] = 0;
  }

  os_unfair_lock_unlock(v4);
}

void sub_1B2FB20AC(uint64_t a1, mach_port_name_t a2, int a3)
{
  int v6 = *(_DWORD **)(a1 + 552);
  os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 104));
  if (a2)
  {
    if (*(_DWORD *)(a1 + 392) != a2)
    {
      uint64_t v7 = *(unsigned int *)(a1 + 544);
      if (v7)
      {
        uint64_t v8 = 0;
        int v9 = (unsigned int *)(a1 + 544);
        for (i = v6; *i != a2; i += 3)
        {
          if (v7 == ++v8) {
            return;
          }
        }
        uint64_t v11 = (char *)&v6[3 * v8];
        int v14 = *((_DWORD *)v11 + 1);
        int v12 = v11 + 4;
        int v13 = v14;
        if (v14 < 2)
        {
          if (LOBYTE(v6[3 * v8 + 2]))
          {
            mach_port_destruct(*MEMORY[0x1E4F14C48], a2, (4 * a3) >> 31, 0);
          }
          else if ((a3 & 0x20000000) != 0)
          {
            mach_port_deallocate(*MEMORY[0x1E4F14C48], a2);
          }
          unsigned int v15 = *v9 - 1;
          *int v9 = v15;
          if (v15 != v8)
          {
            uint64_t v16 = (char *)&v6[3 * v15];
            uint64_t v17 = *(void *)v16;
            i[2] = *((_DWORD *)v16 + 2);
            *(void *)i = v17;
            LODWORD(v8) = *v9;
          }
          if (v8)
          {
            uint64_t v18 = *(unsigned int *)(a1 + 548);
            if (v18 >= 5 && v8 <= v18 >> 2)
            {
              int v19 = malloc_type_realloc(v6, 6 * v18, 0xCB719FFuLL);
              if (v19)
              {
                *(void *)(a1 + 552) = v19;
                *(_DWORD *)(a1 + 548) >>= 1;
              }
            }
          }
          else
          {
            free(v6);
            *(void *)int v9 = 0;
            *(void *)(a1 + 552) = 0;
          }
        }
        else
        {
          *int v12 = v13 - 1;
        }
      }
    }
  }
}

uint64_t sub_1B2FB222C(mach_port_t a1, int a2)
{
  uint64_t v4 = *MEMORY[0x1E4F14C30];
  int v5 = a2;
  *(void *)&msg.msgh_bits = 19;
  msg.msgh_voucher_port = 0;
  msg.msgh_id = 1016;
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  if (MEMORY[0x1E4F14C88]) {
    voucher_mach_msg_set(&msg);
  }
  return mach_msg(&msg, 1, 0x24u, 0, 0, 0, 0);
}

void sub_1B2FB22A8(uint64_t a1)
{
  uint64_t v2 = (os_unfair_lock_s *)(a1 + 216);
  os_unfair_lock_lock_with_options();
  uint64_t v3 = os_set_64_ptr_find();
  if (v3)
  {
    uint64_t v4 = *(void *)(a1 + 96);
    int v5 = (uint64_t *)(v3 - v4);
    if (v3 != v4)
    {
      uint64_t v6 = v5[6];
      uint64_t v7 = *v5;
      if (*v5) {
        *(void *)(v7 + 8) = v5[1];
      }
      *(void *)v5[1] = v7;
      sub_1B2FB23AC(a1 + 72, v5[8], (uint64_t)(v5 + 8));
      int v8 = *((unsigned char *)v5 + 79) & 0xF;
      if (v8 == 3)
      {
        mach_port_deallocate(*MEMORY[0x1E4F14C48], *((_DWORD *)v5 + 14));
      }
      else if (v8 == 4 && (v5[7] & 0x80000000) == 0)
      {
        close_NOCANCEL();
      }
      free(v5);
      ++*(_DWORD *)(a1 + 236);
      sub_1B2FB23F8(a1, v6);
    }
  }

  os_unfair_lock_unlock(v2);
}

uint64_t sub_1B2FB23AC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = os_set_64_ptr_delete();
  if (result != a3) {
    __assert_rtn("_nc_table_delete_64", "table.c", 80, "os_set_delete(&t->set, key) == expected");
  }
  return result;
}

void sub_1B2FB23F8(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    int v4 = *(_DWORD *)(a2 + 56);
    if (!v4 || (int v5 = v4 - 1, (*(_DWORD *)(a2 + 56) = v5) == 0))
    {
      uint64_t v6 = *(unsigned int *)(a1 + 212);
      if (v6)
      {
        uint64_t v7 = 0;
        int v8 = *(void **)(a1 + 192);
        while (1)
        {
          uint64_t v9 = v7 + 1;
          if (v8[v7] == a2) {
            break;
          }
          ++v7;
          if (v6 == v9) {
            goto LABEL_16;
          }
        }
        if ((int)v7 + 1 < v6)
        {
          do
          {
            *(void *)(*(void *)(a1 + 192) + 8 * (v9 - 1)) = *(void *)(*(void *)(a1 + 192)
                                                                                          + 8 * v9);
            ++v9;
          }
          while (v6 != v9);
          int v8 = *(void **)(a1 + 192);
        }
        unsigned int v10 = v6 - 1;
        *(_DWORD *)(a1 + 212) = v10;
        if (v10)
        {
          uint64_t v11 = reallocf(v8, 8 * v10);
        }
        else
        {
          free(v8);
          uint64_t v11 = 0;
        }
        *(void *)(a1 + 192) = v11;
      }
LABEL_16:
      sub_1B2FB2560(a1 + 8, *(void *)(a2 + 8), a2 + 8);
      *(void *)(a2 + 8) = 0;
      sub_1B2FB23AC(a1 + 40, *(void *)(a2 + 16), a2 + 16);
      free((void *)a2);
      ++*(_DWORD *)(a1 + 228);
    }
  }
}

void sub_1B2FB24FC(const os_unfair_lock *a1, uint64_t a2)
{
  os_unfair_lock_assert_owner(a1 + 26);
  sub_1B2FB2560((uint64_t)&a1[114], *(void *)(a2 + 32), a2 + 32);
  if (*(unsigned char *)(a2 + 53)) {
    free(*(void **)(a2 + 32));
  }

  free((void *)a2);
}

uint64_t sub_1B2FB2560(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = os_set_str_ptr_delete();
  if (result != a3) {
    __assert_rtn("_nc_table_delete", "table.c", 72, "os_set_delete(&t->set, key) == expected");
  }
  return result;
}

void sub_1B2FB25AC(uint64_t a1, mach_msg_id_t a2)
{
  mach_port_t v3 = *(_DWORD *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 32);
  msg.msgh_remote_port = v3;
  *(void *)&msg.msgh_local_port = 0;
  *(void *)&msg.msgh_bits = 0x1800000013;
  msg.msgh_id = a2;
  if (mach_msg(&msg, 17, 0x18u, 0, 0, 0, 0) == 268435460)
  {
    v9[0] = MEMORY[0x1E4F14BE8];
    v9[1] = 0x40000000;
    v9[2] = sub_1B2FB5214;
    v9[3] = &unk_1E6018FC8;
    v9[4] = v4;
    if (*(void *)(v4 + 496) != -1) {
      dispatch_once((dispatch_once_t *)(v4 + 496), v9);
    }
    int v5 = *(NSObject **)(v4 + 504);
    if (v5)
    {
      block[0] = MEMORY[0x1E4F14BE8];
      block[1] = 0x40000000;
      block[2] = sub_1B2FB524C;
      block[3] = &unk_1E6018FE8;
      mach_port_t v7 = v3;
      mach_msg_id_t v8 = a2;
      dispatch_async(v5, block);
    }
  }
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  mach_msg_return_t v31;
  int v32;
  BOOL v33;
  unsigned int v34;
  uint64_t v35;
  uint64_t v36;
  unsigned int v37;
  unsigned int v38;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  unsigned char msg[64];
  long long v57;
  long long v58;
  long long v59;
  long long v60;
  long long v61;
  long long v62;
  long long v63;
  long long v64;
  long long v65;
  long long v66;
  long long v67;
  long long v68;
  long long v69;
  long long v70;
  long long v71;
  long long v72;
  long long v73;
  long long v74;
  long long v75;
  long long v76;
  long long v77;
  long long v78;
  long long v79;
  long long v80;
  long long v81;
  long long v82;
  long long v83;
  long long v84;
  uint64_t v85;
  uint64_t vars8;

  v85 = *MEMORY[0x1E4F14BF8];
  uint64_t v4 = sub_1B2FB1800();
  if ((sub_1B2FAE5B4(name) & 1) == 0 && os_variant_has_internal_diagnostics()) {
    sub_1B2FB4468("LIBNOTIFY INTROSPECT: registering for non-exempt notification %s", v40, v41, v42, v43, v44, v45, v46, (char)name);
  }
  v55 = 0;
  if ((*(_DWORD *)(v4 + 116) & 2) != 0)
  {
    os_unfair_lock_lock_with_options();
    int v5 = *(_DWORD **)(v4 + 592);
    if (v5 && *v5 != *(_DWORD *)(v4 + 112))
    {
      uint32_t v8 = sub_1B2FB460C(v4);
      os_unfair_lock_unlock((os_unfair_lock_t)(v4 + 104));
      if (v8)
      {
        if (v8 < 0xB) {
          return v8;
        }
        uint64_t has_internal_diagnostics = os_variant_has_internal_diagnostics();
        if (!has_internal_diagnostics) {
          goto LABEL_26;
        }
        goto LABEL_22;
      }
    }
    else
    {
      os_unfair_lock_unlock((os_unfair_lock_t)(v4 + 104));
    }
  }
  if ((*(_DWORD *)(v4 + 116) & 4) == 0)
  {
    if (!name) {
      return 1;
    }
    if (!out_token) {
      return 10;
    }
    *out_token = -1;
    if (!strncmp(name, "self.", 5uLL)) {
      goto LABEL_13;
    }
    if (qword_1EB1C94E0 != -1) {
      dispatch_once(&qword_1EB1C94E0, &unk_1F0B10B10);
    }
    if (byte_1EB1C94D8)
    {
LABEL_13:
      unsigned int v6 = atomic_fetch_add_explicit((atomic_uint *volatile)(v4 + 488), 1u, memory_order_relaxed) + 1;
      unsigned int v7 = sub_1B2FB2E10(v4 + 128, name, v6, &v55);
      if (v7)
      {
        uint32_t v8 = v7;
        if (v7 >= 0xB)
        {
          uint32_t v8 = 1000000;
          uint64_t v9 = os_variant_has_internal_diagnostics();
          if (v9)
          {
LABEL_16:
            uint64_t v17 = "Libnotify: %s failed with code %d on line %d";
LABEL_64:
            sub_1B2FB4468(v17, v10, v11, v12, v13, v14, v15, v16, (char)"notify_register_check");
            return v8;
          }
          goto LABEL_31;
        }
        return v8;
      }
      unsigned int v26 = sub_1B2FAFE48(name, v55, v6, v6, -1, 0x80000002, -1, -1, 0, 0);
      uint32_t v8 = v26;
      if (v26)
      {
        if (v26 < 0xB) {
          return v8;
        }
        uint64_t has_internal_diagnostics = os_variant_has_internal_diagnostics();
        if (!has_internal_diagnostics) {
          goto LABEL_26;
        }
        goto LABEL_22;
      }
      goto LABEL_73;
    }
    unsigned int v27 = *(_DWORD *)(v4 + 384);
    if (!v27)
    {
      uint64_t v34 = sub_1B2FAF064(v4);
      if (v34)
      {
        uint32_t v8 = v34;
        if (v34 < 0xB) {
          return v8;
        }
        uint32_t v8 = 1000000;
        uint64_t v9 = os_variant_has_internal_diagnostics();
        if (v9) {
          goto LABEL_16;
        }
        goto LABEL_31;
      }
      unsigned int v27 = *(_DWORD *)(v4 + 384);
    }
    v83 = 0u;
    v84 = 0u;
    unsigned int v6 = atomic_fetch_add_explicit((atomic_uint *volatile)(v4 + 488), 1u, memory_order_relaxed) + 1;
    v81 = 0u;
    v82 = 0u;
    v79 = 0u;
    v80 = 0u;
    v77 = 0u;
    v78 = 0u;
    v75 = 0u;
    v76 = 0u;
    v73 = 0u;
    v74 = 0u;
    v71 = 0u;
    v72 = 0u;
    v69 = 0u;
    v70 = 0u;
    v67 = 0u;
    v68 = 0u;
    v65 = 0u;
    v66 = 0u;
    v63 = 0u;
    v64 = 0u;
    v61 = 0u;
    v62 = 0u;
    v59 = 0u;
    v60 = 0u;
    v57 = 0u;
    v58 = 0u;
    memset(msg, 0, sizeof(msg));
    *(void *)&msg[24] = *MEMORY[0x1E4F14C30];
    if (MEMORY[0x1E4F14C50]) {
      int v28 = mig_strncpy_zerofill(&msg[40], name, 512);
    }
    else {
      int v28 = mig_strncpy(&msg[40], name, 512);
    }
    *(_DWORD *)&msg[32] = 0;
    *(_DWORD *)&unsigned char msg[36] = v28;
    mach_msg_size_t v29 = ((v28 + 3) & 0xFFFFFFFC) + 44;
    *(_DWORD *)&msg[((v28 + 3) & 0xFFFFFFFC) + 40] = v6;
    mach_port_name_t special_reply_port = mig_get_special_reply_port();
    *(void *)&msg[8] = __PAIR64__(special_reply_port, v27);
    *(_DWORD *)mach_msg_header_t msg = 5395;
    *(void *)&msg[16] = 0x3F400000000;
    if (MEMORY[0x1E4F14C88])
    {
      voucher_mach_msg_set((mach_msg_header_t *)msg);
      mach_port_name_t special_reply_port = *(_DWORD *)&msg[12];
    }
    signed int v31 = mach_msg((mach_msg_header_t *)msg, 3162115, v29, 0x40u, special_reply_port, 0, 0);
    uint64_t v32 = v31;
    if ((v31 - 268435458) <= 0xE && ((1 << (v31 - 2)) & 0x4003) != 0)
    {
LABEL_62:
      uint32_t v8 = 1000000;
      uint64_t v35 = os_variant_has_internal_diagnostics();
      if (!v35)
      {
        sub_1B2FB44F8(v35, "Libnotify: %s failed with code %d (%d) on line %d", v11, v12, v13, v14, v15, v16, (char)"notify_register_check");
        return v8;
      }
      uint64_t v17 = "Libnotify: %s failed with code %d (%d) on line %d";
      goto LABEL_64;
    }
    if (v31)
    {
      mig_dealloc_special_reply_port();
LABEL_61:
      if (v32) {
        goto LABEL_62;
      }
      uint64_t v36 = 0;
      uint64_t v37 = 0;
      goto LABEL_67;
    }
    if (*(_DWORD *)&msg[20] == 71)
    {
      uint64_t v32 = -308;
    }
    else if (*(_DWORD *)&msg[20] == 1112)
    {
      if ((*(_DWORD *)msg & 0x80000000) == 0)
      {
        if (*(_DWORD *)&msg[4] == 56)
        {
          if (!*(_DWORD *)&msg[8])
          {
            uint64_t v32 = *(_DWORD *)&msg[32];
            if (!*(_DWORD *)&msg[32])
            {
              uint32_t v8 = *(_DWORD *)&msg[52];
              if (*(_DWORD *)&msg[52])
              {
                if (*(_DWORD *)&msg[52] < 0xBu) {
                  return v8;
                }
                uint64_t v47 = os_variant_has_internal_diagnostics();
                if (v47) {
                  sub_1B2FB4468("Libnotify: %s failed with code %d on line %d", v48, v49, v50, v51, v52, v53, v54, (char)"notify_register_check");
                }
                else {
                  sub_1B2FB44F8(v47, "Libnotify: %s failed with code %d on line %d", v49, v50, v51, v52, v53, v54, (char)"notify_register_check");
                }
                return 1000000;
              }
              uint64_t v37 = *(_DWORD *)&msg[36];
              uint64_t v36 = *(void *)&msg[44];
              if (*(_DWORD *)&msg[36] == -1)
              {
                uint64_t v38 = sub_1B2FAFE48(name, *(uint64_t *)&msg[44], v6, v6, -1, 0x40000002u, -1, -1, 0, 0);
                goto LABEL_69;
              }
              uint64_t v32 = *(_DWORD *)&msg[40];
LABEL_67:
              os_unfair_lock_lock_with_options();
              if (!*(void *)(v4 + 592))
              {
                if (!sub_1B2FB2EB0(v37))
                {
                  uint32_t v8 = 1000000;
                  os_unfair_lock_unlock((os_unfair_lock_t)(v4 + 104));
                  return v8;
                }
                if (!*(void *)(v4 + 592))
                {
                  uint32_t v8 = 1000000;
                  os_unfair_lock_unlock((os_unfair_lock_t)(v4 + 104));
                  uint64_t v9 = os_variant_has_internal_diagnostics();
                  if (v9) {
                    goto LABEL_16;
                  }
LABEL_31:
                  sub_1B2FB44F8(v9, "Libnotify: %s failed with code %d on line %d", v11, v12, v13, v14, v15, v16, (char)"notify_register_check");
                  return v8;
                }
              }
              os_unfair_lock_unlock((os_unfair_lock_t)(v4 + 104));
              uint64_t v38 = sub_1B2FAFE48(name, v36, v6, v6, v32, 0x40000001u, -1, -1, 0, 0);
LABEL_69:
              uint32_t v8 = v38;
              if (v38)
              {
                if (v38 < 0xB) {
                  return v8;
                }
                uint64_t has_internal_diagnostics = os_variant_has_internal_diagnostics();
                if (!has_internal_diagnostics)
                {
LABEL_26:
                  sub_1B2FB44F8(has_internal_diagnostics, "Libnotify: %s failed with code %d on line %d", v20, v21, v22, v23, v24, v25, (char)"notify_register_check");
                  return 1000000;
                }
LABEL_22:
                sub_1B2FB4468("Libnotify: %s failed with code %d on line %d", v19, v20, v21, v22, v23, v24, v25, (char)"notify_register_check");
                return 1000000;
              }
LABEL_73:
              *out_token = v6;
              return v8;
            }
            goto LABEL_60;
          }
        }
        else if (*(_DWORD *)&msg[4] == 36)
        {
          if (*(_DWORD *)&msg[8]) {
            uint64_t v33 = 1;
          }
          else {
            uint64_t v33 = *(_DWORD *)&msg[32] == 0;
          }
          if (v33) {
            uint64_t v32 = -300;
          }
          else {
            uint64_t v32 = *(_DWORD *)&msg[32];
          }
          goto LABEL_60;
        }
      }
      uint64_t v32 = -300;
    }
    else
    {
      uint64_t v32 = -301;
    }
LABEL_60:
    mach_msg_destroy((mach_msg_header_t *)msg);
    goto LABEL_61;
  }

  return notify_register_plain(name, out_token);
}

uint64_t sub_1B2FB2E10(uint64_t a1, const char *a2, unsigned int a3, void *a4)
{
  uint64_t v12 = 0;
  uint32_t v8 = (os_unfair_lock_s *)(a1 + 216);
  os_unfair_lock_lock_with_options();
  uint64_t v9 = sub_1B2FB06D4(a1, a2, a3, &v12);
  if (!v9)
  {
    uint64_t v10 = v12;
    *(unsigned char *)(v12 + 79) = *(unsigned char *)(v12 + 79) & 0xF0 | 2;
    *a4 = *(void *)(*(void *)(v10 + 48) + 16);
  }
  os_unfair_lock_unlock(v8);
  return v9;
}

BOOL sub_1B2FB2EB0(unsigned int a1)
{
  uint64_t v2 = sub_1B2FB1800();
  int v3 = shm_open("apple.shm.notification_center", 0, 0);
  if (v3 == -1)
  {
    if (*__error() != 1)
    {
      int has_internal_diagnostics = os_variant_has_internal_diagnostics();
      unsigned int v7 = __error();
      if (has_internal_diagnostics) {
        sub_1B2FB4468("Libnotify: %s failed on line %d with errno %d", v8, v9, v10, v11, v12, v13, v14, (char)"shm_attach");
      }
      else {
        sub_1B2FB44F8((uint64_t)v7, "Libnotify: %s failed on line %d with errno %d", v9, v10, v11, v12, v13, v14, (char)"shm_attach");
      }
    }
    return 0;
  }
  else
  {
    uint64_t v4 = mmap(0, a1, 1, 1, v3, 0);
    BOOL v5 = v4 != (void *)-1;
    if (v4 == (void *)-1)
    {
      int v15 = os_variant_has_internal_diagnostics();
      uint64_t v16 = __error();
      if (v15) {
        sub_1B2FB4468("Libnotify: %s failed on line %d with errno %d", v17, v18, v19, v20, v21, v22, v23, (char)"shm_attach");
      }
      else {
        sub_1B2FB44F8((uint64_t)v16, "Libnotify: %s failed on line %d with errno %d", v18, v19, v20, v21, v22, v23, (char)"shm_attach");
      }
    }
    else
    {
      *(void *)(v2 + 592) = v4;
    }
    close_NOCANCEL();
  }
  return v5;
}

uint32_t notify_set_state(int token, uint64_t state64)
{
  mach_msg_return_t v12;
  int v13;
  BOOL v14;
  uint64_t has_internal_diagnostics;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  os_unfair_lock_s *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  mach_port_t v28;
  int v29;
  int v30;
  unsigned int v31;
  unsigned int v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  unint64_t v50;
  int v51;
  unsigned char msg[52];
  int v53;

  uint64_t v51 = 0;
  uint64_t v50 = 0;
  uint64_t v5 = sub_1B2FB1800();
  if ((*(_DWORD *)(v5 + 116) & 2) != 0)
  {
    os_unfair_lock_lock_with_options();
    unsigned int v6 = *(_DWORD **)(v5 + 592);
    if (v6 && *v6 != *(_DWORD *)(v5 + 112))
    {
      uint64_t v2 = (os_unfair_lock_s *)sub_1B2FB460C(v5);
      os_unfair_lock_unlock((os_unfair_lock_t)(v5 + 104));
      if (v2)
      {
        if (v2 >= 0xB)
        {
          int has_internal_diagnostics = os_variant_has_internal_diagnostics();
          if (has_internal_diagnostics) {
            sub_1B2FB4468("Libnotify: %s failed with code %d on line %d", v17, v18, v19, v20, v21, v22, v23, (char)"notify_set_state");
          }
          else {
            sub_1B2FB44F8(has_internal_diagnostics, "Libnotify: %s failed with code %d on line %d", v18, v19, v20, v21, v22, v23, (char)"notify_set_state");
          }
          LODWORD(v2) = 1000000;
        }
        return v2;
      }
    }
    else
    {
      os_unfair_lock_unlock((os_unfair_lock_t)(v5 + 104));
    }
  }
  uint64_t v7 = sub_1B2FB1720();
  if (!v7)
  {
LABEL_35:
    LODWORD(v2) = 2;
    return v2;
  }
  uint64_t v8 = v7;
  if (!*(void *)(v7 + 104))
  {
    sub_1B2FB17A0((char *)v7);
    goto LABEL_35;
  }
  if ((*(_DWORD *)(v7 + 24) & 0x80000000) == 0)
  {
    BOOL v9 = qword_1EB1C94E0 == -1;
    if (qword_1EB1C94E0 != -1) {
      dispatch_once(&qword_1EB1C94E0, &unk_1F0B10B10);
    }
    if (byte_1EB1C94D8)
    {
      qword_1E9CAF980 = (uint64_t)"BUG IN CLIENT OF LIBNOTIFY: loopback mode enabled but process wants to IPC to notifyd";
      __break(1u);
    }
    else
    {
      if (!*(_DWORD *)(v5 + 384))
      {
        signed int v31 = sub_1B2FAF064(v5);
        if (v31)
        {
          uint64_t v32 = v31;
          sub_1B2FB17A0((char *)v8);
          LODWORD(v2) = v32;
          if (v32 >= 0xB)
          {
            LODWORD(v2) = 1000000;
            uint64_t v33 = os_variant_has_internal_diagnostics();
            if (v33) {
              sub_1B2FB4468("Libnotify: %s failed with code %d on line %d", v34, v35, v36, v37, v38, v39, v40, (char)"notify_set_state");
            }
            else {
              sub_1B2FB44F8(v33, "Libnotify: %s failed with code %d on line %d", v35, v36, v37, v38, v39, v40, (char)"notify_set_state");
            }
          }
          return v2;
        }
      }
      uint64_t v51 = 0;
      uint64_t v2 = *(os_unfair_lock_s **)(v8 + 104);
      if ((*(unsigned char *)(v8 + 27) & 4) != 0) {
        token = v2[12]._os_unfair_lock_opaque;
      }
      os_unfair_lock_lock_with_options();
      uint64_t v50 = *(void *)&v2->_os_unfair_lock_opaque;
      os_unfair_lock_unlock(v2 + 10);
      if (v50 < 0xFFFFFFFFFFFFFFFELL)
      {
        uint64_t v51 = 0;
        int v28 = *(_DWORD *)(v5 + 384);
        if ((*(_DWORD *)(v5 + 116) & 4) != 0)
        {
          if (qword_1EB1C94D0 != -1) {
            dispatch_once(&qword_1EB1C94D0, &unk_1F0B10B50);
          }
          mach_msg_size_t v29 = sub_1B2FB7434(v28, v50, state64, byte_1EB1C94C8);
        }
        else
        {
          if (qword_1EB1C94D0 != -1) {
            dispatch_once(&qword_1EB1C94D0, &unk_1F0B10B50);
          }
          *(void *)&msg[24] = *MEMORY[0x1E4F14C30];
          *(void *)&msg[32] = v50;
          *(void *)&msg[40] = state64;
          *(_DWORD *)&msg[48] = byte_1EB1C94C8;
          *(void *)mach_msg_header_t msg = 19;
          *(_DWORD *)&msg[16] = 0;
          *(_DWORD *)&msg[20] = 1019;
          *(_DWORD *)&msg[8] = v28;
          *(_DWORD *)&msg[12] = 0;
          if (MEMORY[0x1E4F14C88]) {
            voucher_mach_msg_set((mach_msg_header_t *)msg);
          }
          mach_msg_size_t v29 = mach_msg((mach_msg_header_t *)msg, 1, 0x34u, 0, 0, 0, 0);
        }
        uint64_t v13 = v29;
        uint64_t v30 = 0;
LABEL_71:
        if (v13 | v30)
        {
          sub_1B2FB17A0((char *)v8);
          if (v13)
          {
            uint64_t v42 = os_variant_has_internal_diagnostics();
            LODWORD(v2) = 1000000;
            if (v42) {
              sub_1B2FB4468("Libnotify: %s failed with code %d (%d) on line %d", v43, v44, v45, v46, v47, v48, v49, (char)"notify_set_state");
            }
            else {
              sub_1B2FB44F8(v42, "Libnotify: %s failed with code %d (%d) on line %d", v44, v45, v46, v47, v48, v49, (char)"notify_set_state");
            }
            return v2;
          }
        }
        else
        {
          uint64_t v41 = mach_absolute_time();
          *(void *)(v8 + 72) = state64;
          *(void *)(v8 + 80) = v41;
          sub_1B2FB17A0((char *)v8);
        }
        LODWORD(v2) = 0;
        return v2;
      }
      int v10 = *(_DWORD *)(v5 + 116);
      LODWORD(v5) = *(_DWORD *)(v5 + 384);
      BOOL v9 = qword_1EB1C94D0 == -1;
      if ((v10 & 4) == 0)
      {
        if (qword_1EB1C94D0 != -1) {
          dispatch_once(&qword_1EB1C94D0, &unk_1F0B10B50);
        }
        memset(&msg[20], 0, 32);
        *(_OWORD *)&msg[4] = 0u;
        *(void *)&msg[24] = *MEMORY[0x1E4F14C30];
        *(_DWORD *)&msg[32] = token;
        *(void *)&unsigned char msg[36] = state64;
        v53 = 0;
        *(_DWORD *)&msg[44] = byte_1EB1C94C8;
        mach_port_name_t special_reply_port = mig_get_special_reply_port();
        *(_DWORD *)&msg[8] = v5;
        *(_DWORD *)&msg[12] = special_reply_port;
        *(_DWORD *)mach_msg_header_t msg = 5395;
        *(void *)&msg[16] = 0x3FC00000000;
        if (MEMORY[0x1E4F14C88])
        {
          voucher_mach_msg_set((mach_msg_header_t *)msg);
          mach_port_name_t special_reply_port = *(_DWORD *)&msg[12];
        }
        uint64_t v12 = mach_msg((mach_msg_header_t *)msg, 3162115, 0x30u, 0x38u, special_reply_port, 0, 0);
        uint64_t v13 = v12;
        if ((v12 - 268435458) <= 0xE && ((1 << (v12 - 2)) & 0x4003) != 0) {
          goto LABEL_68;
        }
        if (v12)
        {
          mig_dealloc_special_reply_port();
LABEL_68:
          uint64_t v30 = 0;
          goto LABEL_69;
        }
        if (*(_DWORD *)&msg[20] == 71)
        {
          uint64_t v13 = -308;
        }
        else if (*(_DWORD *)&msg[20] == 1120)
        {
          if ((*(_DWORD *)msg & 0x80000000) == 0)
          {
            if (*(_DWORD *)&msg[4] == 48)
            {
              if (!*(_DWORD *)&msg[8])
              {
                uint64_t v13 = *(_DWORD *)&msg[32];
                if (!*(_DWORD *)&msg[32])
                {
                  uint64_t v50 = *(void *)&msg[36];
                  uint64_t v30 = *(_DWORD *)&msg[44];
LABEL_69:
                  if (!(v13 | v30))
                  {
                    sub_1B2FAE4C4(v2, v50);
                    uint64_t v30 = 0;
                    uint64_t v13 = 0;
                  }
                  goto LABEL_71;
                }
                goto LABEL_67;
              }
            }
            else if (*(_DWORD *)&msg[4] == 36)
            {
              if (*(_DWORD *)&msg[8]) {
                uint64_t v14 = 1;
              }
              else {
                uint64_t v14 = *(_DWORD *)&msg[32] == 0;
              }
              if (v14) {
                uint64_t v13 = -300;
              }
              else {
                uint64_t v13 = *(_DWORD *)&msg[32];
              }
              goto LABEL_67;
            }
          }
          uint64_t v13 = -300;
        }
        else
        {
          uint64_t v13 = -301;
        }
LABEL_67:
        mach_msg_destroy((mach_msg_header_t *)msg);
        goto LABEL_68;
      }
    }
    if (!v9) {
      dispatch_once(&qword_1EB1C94D0, &unk_1F0B10B50);
    }
    uint64_t v13 = sub_1B2FB74B4(v5, token, state64, &v50, &v51, byte_1EB1C94C8);
    uint64_t v30 = v51;
    goto LABEL_69;
  }
  uint64_t v24 = (os_unfair_lock_s *)(v5 + 344);
  os_unfair_lock_lock_with_options();
  uint64_t v25 = os_set_64_ptr_find();
  if (v25 && (unsigned int v26 = *(void *)(v5 + 192), v27 = (void *)(v25 - v26), v25 != v26))
  {
    if (v27[1])
    {
      v27[3] = state64;
      LODWORD(v2) = 0;
      v27[4] = mach_absolute_time();
    }
    else
    {
      LODWORD(v2) = 7;
    }
  }
  else
  {
    LODWORD(v2) = 1;
  }
  os_unfair_lock_unlock(v24);
  sub_1B2FB17A0((char *)v8);
  return v2;
}

uint32_t notify_register_mach_port(const char *name, mach_port_t *notify_port, int flags, int *out_token)
{
  uint64_t v8 = sub_1B2FB1800();
  if ((sub_1B2FAE5B4(name) & 1) == 0 && os_variant_has_internal_diagnostics()) {
    sub_1B2FB4468("LIBNOTIFY INTROSPECT: registering for non-exempt notification %s", v49, v50, v51, v52, v53, v54, v55, (char)name);
  }
  if ((*(_DWORD *)(v8 + 116) & 2) != 0)
  {
    os_unfair_lock_lock_with_options();
    BOOL v9 = *(_DWORD **)(v8 + 592);
    if (v9 && *v9 != *(_DWORD *)(v8 + 112))
    {
      uint32_t v11 = sub_1B2FB460C(v8);
      os_unfair_lock_unlock((os_unfair_lock_t)(v8 + 104));
      if (v11)
      {
        if (v11 < 0xB) {
          return v11;
        }
        uint64_t has_internal_diagnostics = os_variant_has_internal_diagnostics();
        if (has_internal_diagnostics)
        {
          sub_1B2FB4468("Libnotify: %s failed with code %d on line %d", v13, v14, v15, v16, v17, v18, v19, (char)"notify_register_mach_port");
          return 1000000;
        }
        uint64_t v42 = "notify_register_mach_port";
LABEL_44:
        sub_1B2FB44F8(has_internal_diagnostics, "Libnotify: %s failed with code %d on line %d", v14, v15, v16, v17, v18, v19, (char)v42);
        return 1000000;
      }
    }
    else
    {
      os_unfair_lock_unlock((os_unfair_lock_t)(v8 + 104));
    }
  }
  if (!name) {
    return 1;
  }
  if (!notify_port) {
    return 3;
  }
  if (strncmp(name, "self.", 5uLL))
  {
    if (qword_1EB1C94E0 != -1) {
      dispatch_once(&qword_1EB1C94E0, &unk_1F0B10B10);
    }
    if (!byte_1EB1C94D8)
    {
      if (flags & 0x80000000) == 0 && (*(_DWORD *)(v8 + 116))
      {
        if ((flags & 1) == 0 && mach_port_allocate(*MEMORY[0x1E4F14C48], 1u, notify_port))
        {
          uint64_t v20 = os_variant_has_internal_diagnostics();
          uint32_t v11 = 1000000;
          if (v20)
          {
            int v28 = "notify_register_mach_port_via_dispatch";
LABEL_61:
            sub_1B2FB4468("Libnotify: %s failed with code %d (%d) on line %d", v21, v22, v23, v24, v25, v26, v27, (char)v28);
            return v11;
          }
          uint64_t v44 = "notify_register_mach_port_via_dispatch";
          goto LABEL_63;
        }
        mach_port_name_t v40 = *notify_port;
        if (*notify_port - 1 <= 0xFFFFFFFD)
        {
          uint64_t v41 = (ipc_space_t *)MEMORY[0x1E4F14C48];
          if (!mach_port_insert_right(*MEMORY[0x1E4F14C48], *notify_port, *notify_port, 0x14u))
          {
            global_queue = dispatch_get_global_queue(2, 0);
            v56[0] = MEMORY[0x1E4F14BE8];
            v56[1] = 0x40000000;
            v56[2] = sub_1B2FB25AC;
            v56[3] = &unk_1E6018FA8;
            mach_port_name_t v57 = v40;
            v56[4] = v8;
            uint32_t v46 = sub_1B2FAEE9C((char *)name, (unsigned int *)out_token, global_queue, v56, *notify_port);
            uint32_t v11 = v46;
            if ((flags & 1) != 0 || !v46)
            {
              if (!v46) {
                sub_1B2FB0898(v8, *notify_port, flags);
              }
            }
            else
            {
              mach_port_destruct(*v41, v40, 0, 0);
            }
            return v11;
          }
          if ((flags & 1) == 0) {
            mach_port_destruct(*v41, v40, 0, 0);
          }
        }
        return 3;
      }
      if (!strncmp(name, "self.", 5uLL)) {
        __assert_rtn("notify_register_mach_port_no_dispatch", "notify_client.c", 3044, "strncmp(name, SELF_PREFIX, SELF_PREFIX_LEN)");
      }
      if (byte_1EB1C94D8)
      {
        qword_1E9CAF980 = (uint64_t)"BUG IN CLIENT OF LIBNOTIFY: loopback mode enabled but process wants to IPC to notifyd";
        __break(1u);
        goto LABEL_79;
      }
      if ((flags & 1) == 0 || *notify_port + 1 >= 2)
      {
        if (!*(_DWORD *)(v8 + 384))
        {
          unsigned int v43 = sub_1B2FAF064(v8);
          if (v43)
          {
            uint32_t v11 = v43;
            if (v43 < 0xB) {
              return v11;
            }
            uint32_t v11 = 1000000;
            uint64_t v32 = os_variant_has_internal_diagnostics();
            if (v32)
            {
LABEL_52:
              sub_1B2FB4468("Libnotify: %s failed with code %d on line %d", v33, v34, v35, v36, v37, v38, v39, (char)"notify_register_mach_port_no_dispatch");
              return v11;
            }
LABEL_66:
            sub_1B2FB44F8(v32, "Libnotify: %s failed with code %d on line %d", v34, v35, v36, v37, v38, v39, (char)"notify_register_mach_port_no_dispatch");
            return v11;
          }
        }
        unsigned int add_explicit = atomic_fetch_add_explicit((atomic_uint *volatile)(v8 + 488), 1u, memory_order_relaxed);
        int v30 = add_explicit + 1;
        if (flags)
        {
          if (sub_1B2FB6B70(*(_DWORD *)(v8 + 384), name, add_explicit + 1, *notify_port))
          {
LABEL_59:
            uint64_t v20 = os_variant_has_internal_diagnostics();
            uint32_t v11 = 1000000;
            if (v20)
            {
              int v28 = "notify_register_mach_port_no_dispatch";
              goto LABEL_61;
            }
            uint64_t v44 = "notify_register_mach_port_no_dispatch";
LABEL_63:
            sub_1B2FB44F8(v20, "Libnotify: %s failed with code %d (%d) on line %d", v22, v23, v24, v25, v26, v27, (char)v44);
            return v11;
          }
          uint32_t v11 = sub_1B2FAFE48(name, -1, v30, v30, -1, 3u, -1, -1, *notify_port, 0);
          if (v11) {
            goto LABEL_69;
          }
        }
        else
        {
          LODWORD(v56[0]) = 0;
          *notify_port = 0;
          int v31 = sub_1B2FB6CBC(*(_DWORD *)(v8 + 384), name, add_explicit + 1, v56, notify_port);
          if (LODWORD(v56[0]))
          {
            if (!*notify_port)
            {
              uint32_t v11 = v56[0];
              if (LODWORD(v56[0]) >= 0xB)
              {
                uint32_t v11 = 1000000;
                uint64_t v32 = os_variant_has_internal_diagnostics();
                if (v32) {
                  goto LABEL_52;
                }
                goto LABEL_66;
              }
              return v11;
            }
LABEL_79:
            __assert_rtn("notify_register_mach_port_no_dispatch", "notify_client.c", 3084, "*notify_port == MACH_PORT_NULL");
          }
          if (v31)
          {
            mach_port_destruct(*MEMORY[0x1E4F14C48], *notify_port, 0, 0);
            goto LABEL_59;
          }
          uint32_t v47 = sub_1B2FAFE48(name, -1, v30, v30, -1, 3u, -1, -1, *notify_port, 0);
          if (v47)
          {
            uint32_t v11 = v47;
            mach_port_destruct(*MEMORY[0x1E4F14C48], *notify_port, 0, 0);
LABEL_69:
            if (v11 < 0xB) {
              return v11;
            }
            uint64_t has_internal_diagnostics = os_variant_has_internal_diagnostics();
            if (has_internal_diagnostics)
            {
              sub_1B2FB4468("Libnotify: %s failed with code %d on line %d", v48, v14, v15, v16, v17, v18, v19, (char)"notify_register_mach_port_no_dispatch");
              return 1000000;
            }
            uint64_t v42 = "notify_register_mach_port_no_dispatch";
            goto LABEL_44;
          }
        }
        sub_1B2FB0898(v8, *notify_port, flags);
        uint32_t v11 = 0;
        if (out_token) {
          *out_token = v30;
        }
        return v11;
      }
      return 3;
    }
  }

  return sub_1B2FB0364(name, notify_port, flags, (unsigned int *)out_token, (os_unfair_lock_s *)v8);
}

uint64_t notify_register_plain(const char *a1, _DWORD *a2)
{
  uint64_t v50 = *MEMORY[0x1E4F14BF8];
  uint64_t v4 = sub_1B2FB1800();
  if ((sub_1B2FAE5B4(a1) & 1) == 0 && os_variant_has_internal_diagnostics()) {
    sub_1B2FB4468("LIBNOTIFY INTROSPECT: registering for non-exempt notification %s", v41, v42, v43, v44, v45, v46, v47, (char)a1);
  }
  uint64_t v48 = 0;
  if ((*(_DWORD *)(v4 + 116) & 2) != 0)
  {
    os_unfair_lock_lock_with_options();
    uint64_t v5 = *(_DWORD **)(v4 + 592);
    if (v5 && *v5 != *(_DWORD *)(v4 + 112))
    {
      uint64_t v8 = sub_1B2FB460C(v4);
      os_unfair_lock_unlock((os_unfair_lock_t)(v4 + 104));
      if (v8)
      {
        if (v8 < 0xB) {
          return v8;
        }
        uint64_t has_internal_diagnostics = os_variant_has_internal_diagnostics();
        if (has_internal_diagnostics)
        {
LABEL_38:
          sub_1B2FB4468("Libnotify: %s failed with code %d on line %d", v19, v20, v21, v22, v23, v24, v25, (char)"notify_register_plain");
          return 1000000;
        }
LABEL_43:
        sub_1B2FB44F8(has_internal_diagnostics, "Libnotify: %s failed with code %d on line %d", v20, v21, v22, v23, v24, v25, (char)"notify_register_plain");
        return 1000000;
      }
    }
    else
    {
      os_unfair_lock_unlock((os_unfair_lock_t)(v4 + 104));
    }
  }
  if (!a1) {
    return 1;
  }
  if (!strncmp(a1, "self.", 5uLL)) {
    goto LABEL_11;
  }
  if (qword_1EB1C94E0 != -1) {
    dispatch_once(&qword_1EB1C94E0, &unk_1F0B10B10);
  }
  if (byte_1EB1C94D8)
  {
LABEL_11:
    unsigned int v6 = atomic_fetch_add_explicit((atomic_uint *volatile)(v4 + 488), 1u, memory_order_relaxed) + 1;
    uint64_t v7 = sub_1B2FB2E10(v4 + 128, a1, v6, &v48);
    if (v7)
    {
      uint64_t v8 = v7;
      if (v7 >= 0xB)
      {
        uint64_t v8 = 1000000;
        uint64_t v9 = os_variant_has_internal_diagnostics();
        if (v9) {
          goto LABEL_19;
        }
LABEL_42:
        sub_1B2FB44F8(v9, "Libnotify: %s failed with code %d on line %d", v11, v12, v13, v14, v15, v16, (char)"notify_register_plain");
        return v8;
      }
      return v8;
    }
    uint64_t v17 = sub_1B2FAFE48(a1, v48, v6, v6, -1, 0x80000002, -1, -1, 0, 0);
    if (!v17)
    {
      uint64_t v8 = 0;
      *a2 = v6;
      return v8;
    }
    uint64_t v8 = v17;
    if (v17 < 0xB) {
      return v8;
    }
    uint64_t v8 = 1000000;
    uint64_t v9 = os_variant_has_internal_diagnostics();
    if (!v9) {
      goto LABEL_42;
    }
LABEL_19:
    sub_1B2FB4468("Libnotify: %s failed with code %d on line %d", v10, v11, v12, v13, v14, v15, v16, (char)"notify_register_plain");
    return v8;
  }
  unsigned int v26 = *(_DWORD *)(v4 + 384);
  if (!v26)
  {
    uint64_t v38 = sub_1B2FAF064(v4);
    if (!v38)
    {
      unsigned int v26 = *(_DWORD *)(v4 + 384);
      goto LABEL_25;
    }
    uint64_t v8 = v38;
    if (v38 < 0xB) {
      return v8;
    }
    uint64_t has_internal_diagnostics = os_variant_has_internal_diagnostics();
    if (has_internal_diagnostics) {
      goto LABEL_38;
    }
    goto LABEL_43;
  }
LABEL_25:
  int v27 = atomic_fetch_add_explicit((atomic_uint *volatile)(v4 + 488), 1u, memory_order_relaxed) + 1;
  memset(msg, 0, 512);
  *(void *)&msg[1].msgh_bits = *MEMORY[0x1E4F14C30];
  if (MEMORY[0x1E4F14C50]) {
    mach_port_t v28 = mig_strncpy_zerofill((char *)&msg[1].msgh_voucher_port, a1, 512);
  }
  else {
    mach_port_t v28 = mig_strncpy((char *)&msg[1].msgh_voucher_port, a1, 512);
  }
  msg[1].msgh_remote_port = 0;
  msg[1].msgh_local_port = v28;
  unsigned int v29 = (v28 + 3) & 0xFFFFFFFC;
  *(mach_port_name_t *)((char *)&msg[1].msgh_voucher_port + v29) = v27;
  msg[0].msgh_bits = 19;
  *(void *)&msg[0].msgh_remote_port = v26;
  *(void *)&msg[0].msgh_voucher_port = 0x3F300000000;
  if (MEMORY[0x1E4F14C88]) {
    voucher_mach_msg_set(msg);
  }
  if (mach_msg(msg, 1, v29 + 44, 0, 0, 0, 0))
  {
    uint64_t v8 = 1000000;
    uint64_t v30 = os_variant_has_internal_diagnostics();
    if (v30) {
      sub_1B2FB4468("Libnotify: %s failed with code %d (%d) on line %d", v31, v32, v33, v34, v35, v36, v37, (char)"notify_register_plain");
    }
    else {
      sub_1B2FB44F8(v30, "Libnotify: %s failed with code %d (%d) on line %d", v32, v33, v34, v35, v36, v37, (char)"notify_register_plain");
    }
    return v8;
  }
  uint64_t v39 = sub_1B2FAFE48(a1, -1, v27, v27, -1, 0x40000002u, -1, -1, 0, 0);
  if (!v39)
  {
    uint64_t v8 = 0;
    *a2 = v27;
    return v8;
  }
  uint64_t v8 = v39;
  if (v39 >= 0xB)
  {
    uint64_t v8 = 1000000;
    uint64_t v9 = os_variant_has_internal_diagnostics();
    if (!v9) {
      goto LABEL_42;
    }
    goto LABEL_19;
  }
  return v8;
}

uint64_t notify_resume_pid(int a1)
{
  uint64_t v2 = sub_1B2FB1800();
  mach_port_t v3 = *(_DWORD *)(v2 + 384);
  if (v3)
  {
LABEL_2:
    uint64_t v17 = *MEMORY[0x1E4F14C30];
    int v18 = a1;
    *(void *)&msg.msgh_bits = 19;
    msg.msgh_voucher_port = 0;
    msg.msgh_id = 1007;
    msg.msgh_remote_port = v3;
    msg.msgh_local_port = 0;
    if (MEMORY[0x1E4F14C88]) {
      voucher_mach_msg_set(&msg);
    }
    if (!mach_msg(&msg, 1, 0x24u, 0, 0, 0, 0)) {
      return 0;
    }
    uint64_t has_internal_diagnostics = os_variant_has_internal_diagnostics();
    uint64_t v12 = 1000000;
    if (has_internal_diagnostics) {
      goto LABEL_6;
    }
LABEL_10:
    sub_1B2FB44F8(has_internal_diagnostics, "Libnotify: %s failed with code %d on line %d", v6, v7, v8, v9, v10, v11, (char)"notify_resume_pid");
    return v12;
  }
  uint64_t v13 = v2;
  uint64_t v14 = sub_1B2FAF064(v2);
  if (!v14)
  {
    mach_port_t v3 = *(_DWORD *)(v13 + 384);
    goto LABEL_2;
  }
  uint64_t v12 = v14;
  if (v14 < 0xB) {
    return v12;
  }
  uint64_t v12 = 1000000;
  uint64_t has_internal_diagnostics = os_variant_has_internal_diagnostics();
  if (!has_internal_diagnostics) {
    goto LABEL_10;
  }
LABEL_6:
  sub_1B2FB4468("Libnotify: %s failed with code %d on line %d", v5, v6, v7, v8, v9, v10, v11, (char)"notify_resume_pid");
  return v12;
}

uint64_t notify_suspend_pid(int a1)
{
  uint64_t v2 = sub_1B2FB1800();
  mach_port_t v3 = *(_DWORD *)(v2 + 384);
  if (v3)
  {
LABEL_2:
    uint64_t v17 = *MEMORY[0x1E4F14C30];
    int v18 = a1;
    *(void *)&msg.msgh_bits = 19;
    msg.msgh_voucher_port = 0;
    msg.msgh_id = 1006;
    msg.msgh_remote_port = v3;
    msg.msgh_local_port = 0;
    if (MEMORY[0x1E4F14C88]) {
      voucher_mach_msg_set(&msg);
    }
    if (!mach_msg(&msg, 1, 0x24u, 0, 0, 0, 0)) {
      return 0;
    }
    uint64_t has_internal_diagnostics = os_variant_has_internal_diagnostics();
    uint64_t v12 = 1000000;
    if (has_internal_diagnostics) {
      goto LABEL_6;
    }
LABEL_10:
    sub_1B2FB44F8(has_internal_diagnostics, "Libnotify: %s failed with code %d on line %d", v6, v7, v8, v9, v10, v11, (char)"notify_suspend_pid");
    return v12;
  }
  uint64_t v13 = v2;
  uint64_t v14 = sub_1B2FAF064(v2);
  if (!v14)
  {
    mach_port_t v3 = *(_DWORD *)(v13 + 384);
    goto LABEL_2;
  }
  uint64_t v12 = v14;
  if (v14 < 0xB) {
    return v12;
  }
  uint64_t v12 = 1000000;
  uint64_t has_internal_diagnostics = os_variant_has_internal_diagnostics();
  if (!has_internal_diagnostics) {
    goto LABEL_10;
  }
LABEL_6:
  sub_1B2FB4468("Libnotify: %s failed with code %d on line %d", v5, v6, v7, v8, v9, v10, v11, (char)"notify_suspend_pid");
  return v12;
}

BOOL sub_1B2FB4454(uint64_t a1, uint64_t a2)
{
  return a2 == MEMORY[0x1E4F14CF0];
}

void sub_1B2FB4468(const char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t v10 = 0;
  if (getpid() != 1)
  {
    vasprintf(&v10, a1, &a9);
    if (v10)
    {
      os_fault_with_payload();
      free(v10);
    }
  }
}

void sub_1B2FB44F8(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  v10[0] = 0;
  v10[1] = &a9;
  vasprintf(v10, a2, &a9);
  if (v10[0])
  {
    _simple_asl_log();
    uint64_t v9 = v10[0];
  }
  else
  {
    uint64_t v9 = 0;
  }
  free(v9);
}

double _notify_fork_child()
{
  uint64_t v0 = sub_1B2FB1800();
  sub_1B2FAD9C0(v0);
  if (*(_DWORD *)(v0 + 384) || _dispatch_is_fork_of_multithreaded_parent()) {
    *(_DWORD *)(v0 + 116) = 0x8000000;
  }
  sub_1B2FADA54(v0 + 128);
  *(_DWORD *)(v0 + 384) = 0;
  *(_DWORD *)(v0 + 112) = 0;
  *(_DWORD *)(v0 + 512) = 0;
  *(void *)(v0 + 592) = 0;
  double result = 0.0;
  *(_OWORD *)(v0 + 520) = 0u;
  *(_OWORD *)(v0 + 536) = 0u;
  *(void *)(v0 + 552) = 0;
  return result;
}

void sub_1B2FB45BC()
{
  uint64_t v0 = (os_unfair_lock_s *)sub_1B2FB1800();
  os_unfair_lock_lock_with_options();
  sub_1B2FB460C((uint64_t)v0);

  os_unfair_lock_unlock(v0 + 26);
}

uint64_t sub_1B2FB460C(uint64_t a1)
{
  if ((*(_DWORD *)(a1 + 116) & 2) == 0) {
    return 0;
  }
  uint64_t v1 = sub_1B2FAF0B0();
  if (v1 == 57) {
    return 0;
  }
  uint64_t v2 = v1;
  if (!v1) {
    os_set_32_ptr_foreach();
  }
  return v2;
}

uint64_t sub_1B2FB46BC(uint64_t a1, uint64_t a2)
{
  mach_msg_return_t v20;
  int v21;
  BOOL v22;
  int v24;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  size_t v34;
  int has_internal_diagnostics;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  long long v46;
  uint64_t v47;
  int v48;
  unsigned int v49;
  unsigned char msg[32];
  uint64_t v51;
  uint64_t v52;
  unsigned int v53;
  int v54;
  uint64_t v55;
  _OWORD v56[35];
  uint64_t v57;

  mach_port_name_t v57 = *MEMORY[0x1E4F14BF8];
  uint64_t v48 = -1;
  uint64_t v47 = -1;
  mach_port_t v3 = *(const char **)(*(void *)(a2 + 104) + 32);
  uint64_t v45 = sub_1B2FB1800();
  if (*(_DWORD *)(a2 + 24) >> 30 != 1) {
    return 1;
  }
  uint64_t v49 = 0;
  uid_t v4 = geteuid();
  if (v4)
  {
    uid_t v5 = v4;
    if (!strncmp(v3, "user.uid.", 9uLL))
    {
      snprintf(msg, 0x3FuLL, "%s%d", "user.uid.", v5);
      uint64_t v34 = strlen(msg);
      if (strncmp(v3, msg, v34) || v3[v34] && v3[v34] != 46)
      {
        uint64_t has_internal_diagnostics = os_variant_has_internal_diagnostics();
        uint64_t v36 = geteuid();
        if (has_internal_diagnostics) {
          sub_1B2FB4468("BUG IN LIBNOTIFY CLIENT: registration held for restricted name %s with process uid %d", v37, v38, v39, v40, v41, v42, v43, (char)v3);
        }
        else {
          sub_1B2FB44F8(v36, "BUG IN LIBNOTIFY CLIENT: registration held for restricted name %s with process uid %d", v38, v39, v40, v41, v42, v43, (char)v3);
        }
      }
    }
  }
  uint64_t v6 = *(const char **)(a2 + 88);
  if (v6) {
    int v7 = strlen(v6) + 1;
  }
  else {
    int v7 = 0;
  }
  int v8 = *(_DWORD *)(a2 + 24) & 0xF;
  int v9 = -51;
  uint64_t v44 = v3;
  while (1)
  {
    mach_port_name_t v10 = *(_DWORD *)(v45 + 384);
    int v11 = *(_DWORD *)(a2 + 20);
    if ((*(_DWORD *)(v45 + 116) & 4) != 0)
    {
      uint64_t v24 = v8 == 5 ? *(_DWORD *)(a2 + 40) : 0;
      uint64_t v21 = sub_1B2FB71AC(v10, v3, v11, v8, v24, *(_DWORD *)(a2 + 28), *(void *)(a2 + 72), *(void *)(a2 + 80), *(void *)(a2 + 88), v7, *(_DWORD *)(a2 + 96), &v48, &v47, (int *)&v49);
    }
    else
    {
      if (v8 == 5) {
        int v12 = *(_DWORD *)(a2 + 40);
      }
      else {
        int v12 = 0;
      }
      int v13 = *(_DWORD *)(a2 + 28);
      uint64_t v46 = *(_OWORD *)(a2 + 72);
      uint64_t v14 = *(void *)(a2 + 88);
      int v15 = *(_DWORD *)(a2 + 96);
      memset(v56, 0, 448);
      uint64_t v51 = 0x14000000000000;
      uint64_t v55 = 0;
      memset(msg, 0, sizeof(msg));
      *(_DWORD *)&msg[24] = 2;
      uint64_t v52 = v14;
      uint64_t v53 = 16777472;
      uint64_t v54 = v7;
      uint64_t v55 = *MEMORY[0x1E4F14C30];
      if (MEMORY[0x1E4F14C50]) {
        int v16 = mig_strncpy_zerofill((char *)v56 + 8, v3, 512);
      }
      else {
        int v16 = mig_strncpy((char *)v56 + 8, v3, 512);
      }
      LODWORD(v56[0]) = 0;
      DWORD1(v56[0]) = v16;
      uint64_t v17 = (v16 + 3) & 0xFFFFFFFC;
      int v18 = &msg[v17 - 512];
      *((_DWORD *)v18 + 146) = v11;
      *((_DWORD *)v18 + 147) = v8;
      *((_DWORD *)v18 + 148) = v12;
      *((_DWORD *)v18 + 149) = v13;
      *(_OWORD *)(v18 + 600) = v46;
      *((_DWORD *)v18 + 154) = v7;
      *((_DWORD *)v18 + 155) = v15;
      mach_port_name_t special_reply_port = mig_get_special_reply_port();
      *(void *)&msg[8] = __PAIR64__(special_reply_port, v10);
      *(_DWORD *)mach_msg_header_t msg = -2147478253;
      *(void *)&msg[16] = 0x3FE00000000;
      if (MEMORY[0x1E4F14C88])
      {
        voucher_mach_msg_set((mach_msg_header_t *)msg);
        mach_port_name_t special_reply_port = *(_DWORD *)&msg[12];
      }
      uint64_t v20 = mach_msg((mach_msg_header_t *)msg, 3227651, v17 + 112, 0x3Cu, special_reply_port, 0, 0);
      uint64_t v21 = v20;
      if ((v20 - 268435458) <= 0xE && ((1 << (v20 - 2)) & 0x4003) != 0)
      {
        mach_port_t v3 = v44;
        goto LABEL_38;
      }
      mach_port_t v3 = v44;
      if (v20)
      {
        mig_dealloc_special_reply_port();
        goto LABEL_38;
      }
      if (*(_DWORD *)&msg[20] == 71)
      {
        uint64_t v21 = -308;
        goto LABEL_37;
      }
      if (*(_DWORD *)&msg[20] != 1122)
      {
        uint64_t v21 = -301;
        goto LABEL_37;
      }
      if ((*(_DWORD *)msg & 0x80000000) != 0) {
        goto LABEL_36;
      }
      if (*(_DWORD *)&msg[4] != 52)
      {
        if (*(_DWORD *)&msg[4] == 36)
        {
          if (*(_DWORD *)&msg[8]) {
            uint64_t v22 = 1;
          }
          else {
            uint64_t v22 = v51 == 0;
          }
          if (v22) {
            uint64_t v21 = -300;
          }
          else {
            uint64_t v21 = v51;
          }
        }
        else
        {
LABEL_36:
          uint64_t v21 = -300;
        }
LABEL_37:
        mach_msg_destroy((mach_msg_header_t *)msg);
        goto LABEL_38;
      }
      if (*(_DWORD *)&msg[8]) {
        goto LABEL_36;
      }
      uint64_t v21 = v51;
      if (v51) {
        goto LABEL_37;
      }
      uint64_t v47 = v52;
      uint64_t v48 = HIDWORD(v51);
      uint64_t v49 = v53;
    }
LABEL_38:
    if (!v21) {
      break;
    }
    usleep_NOCANCEL();
    if (__CFADD__(v9++, 1)) {
      __assert_rtn("_notify_lib_regenerate_registration", "notify_client.c", 1494, "kstatus == KERN_SUCCESS");
    }
  }
  if (v49 > 0x39 || ((1 << v49) & 0x208000000000001) == 0)
  {
    unsigned int v26 = os_variant_has_internal_diagnostics();
    if (v26) {
      sub_1B2FB4468("Libnotify: _notify_server_regnerate failed for name %s with status %d (flags: %x, token %d)", v27, v28, v29, v30, v31, v32, v33, (char)v3);
    }
    else {
      sub_1B2FB44F8(v26, "Libnotify: _notify_server_regnerate failed for name %s with status %d (flags: %x, token %d)", v28, v29, v30, v31, v32, v33, (char)v3);
    }
  }
  *(_DWORD *)(a2 + 28) = v48;
  **(void **)(a2 + 104) = v47;
  return 1;
}

uint64_t sub_1B2FB4BB8(uint64_t a1)
{
  return mach_port_destruct(*MEMORY[0x1E4F14C48], *(_DWORD *)(a1 + 32), 0, 0);
}

BOOL sub_1B2FB4BD8(uint64_t a1, uint64_t a2)
{
  return a2 == MEMORY[0x1E4F14CF0];
}

uint32_t notify_register_signal(const char *name, int sig, int *out_token)
{
  uint64_t v60 = *MEMORY[0x1E4F14BF8];
  uint64_t v6 = sub_1B2FB1800();
  if ((sub_1B2FAE5B4(name) & 1) == 0 && os_variant_has_internal_diagnostics()) {
    sub_1B2FB4468("LIBNOTIFY INTROSPECT: registering for non-exempt notification %s", v50, v51, v52, v53, v54, v55, v56, (char)name);
  }
  if ((*(_DWORD *)(v6 + 116) & 2) != 0)
  {
    os_unfair_lock_lock_with_options();
    int v7 = *(_DWORD **)(v6 + 592);
    if (v7 && *v7 != *(_DWORD *)(v6 + 112))
    {
      uint32_t v12 = sub_1B2FB460C(v6);
      os_unfair_lock_unlock((os_unfair_lock_t)(v6 + 104));
      if (v12)
      {
        if (v12 < 0xB) {
          return v12;
        }
        uint64_t has_internal_diagnostics = os_variant_has_internal_diagnostics();
        if (!has_internal_diagnostics) {
          goto LABEL_47;
        }
        sub_1B2FB4468("Libnotify: %s failed with code %d on line %d", v25, v26, v27, v28, v29, v30, v31, (char)"notify_register_signal");
        return 1000000;
      }
    }
    else
    {
      os_unfair_lock_unlock((os_unfair_lock_t)(v6 + 104));
    }
  }
  if (!name) {
    return 1;
  }
  if (!strncmp(name, "self.", 5uLL)) {
    goto LABEL_11;
  }
  if (qword_1EB1C94E0 != -1) {
    dispatch_once(&qword_1EB1C94E0, &unk_1F0B10B10);
  }
  if (byte_1EB1C94D8)
  {
LABEL_11:
    unsigned int v8 = atomic_fetch_add_explicit((atomic_uint *volatile)(v6 + 488), 1u, memory_order_relaxed) + 1;
    *(void *)&msg[0].msgh_bits = 0;
    int v9 = (os_unfair_lock_s *)(v6 + 344);
    os_unfair_lock_lock_with_options();
    unsigned int v10 = sub_1B2FB06D4(v6 + 128, name, v8, msg);
    if (v10)
    {
      unsigned int v11 = v10;
      os_unfair_lock_unlock(v9);
      uint32_t v12 = v11;
      if (v11 >= 0xB)
      {
        uint32_t v12 = 1000000;
        uint64_t v13 = os_variant_has_internal_diagnostics();
        if (v13) {
          goto LABEL_31;
        }
        goto LABEL_49;
      }
    }
    else
    {
      uint64_t v21 = *(void *)&msg[0].msgh_bits;
      *(unsigned char *)(*(void *)&msg[0].msgh_bits + 79) = *(unsigned char *)(*(void *)&msg[0].msgh_bits + 79) & 0xF0 | 5;
      *(_DWORD *)(v21 + 68) = 0;
      *(_DWORD *)(v21 + 56) = sig;
      uint64_t v22 = *(void *)(*(void *)(v21 + 48) + 16);
      os_unfair_lock_unlock(v9);
      unsigned int v23 = sub_1B2FAFE48(name, v22, v8, v8, -1, 0x80000005, sig, -1, 0, 0);
      if (!v23)
      {
        uint32_t v12 = 0;
        *out_token = v8;
        return v12;
      }
      uint32_t v12 = v23;
      if (v23 >= 0xB)
      {
        uint32_t v12 = 1000000;
        uint64_t v13 = os_variant_has_internal_diagnostics();
        if (v13) {
          goto LABEL_31;
        }
        goto LABEL_49;
      }
    }
    return v12;
  }
  if (*(_DWORD *)(v6 + 116))
  {
    global_queue = dispatch_get_global_queue(2, 0);
    handler[0] = MEMORY[0x1E4F14BE8];
    handler[1] = 0x40000000;
    handler[2] = sub_1B2FB51DC;
    handler[3] = &unk_1E6018E30;
    int v58 = sig;
    uint32_t v12 = notify_register_dispatch(name, out_token, global_queue, handler);
    if (v12 >= 0xB)
    {
      uint32_t v12 = 1000000;
      uint64_t v13 = os_variant_has_internal_diagnostics();
      if (v13)
      {
LABEL_31:
        sub_1B2FB4468("Libnotify: %s failed with code %d on line %d", v14, v15, v16, v17, v18, v19, v20, (char)"notify_register_signal");
        return v12;
      }
LABEL_49:
      sub_1B2FB44F8(v13, "Libnotify: %s failed with code %d on line %d", v15, v16, v17, v18, v19, v20, (char)"notify_register_signal");
    }
  }
  else
  {
    unsigned int v32 = *(_DWORD *)(v6 + 384);
    if (!v32)
    {
      unsigned int v46 = sub_1B2FAF064(v6);
      if (v46)
      {
        uint32_t v12 = v46;
        if (v46 < 0xB) {
          return v12;
        }
        uint64_t has_internal_diagnostics = os_variant_has_internal_diagnostics();
        if (!has_internal_diagnostics) {
          goto LABEL_47;
        }
LABEL_43:
        sub_1B2FB4468("Libnotify: %s failed with code %d on line %d", v47, v26, v27, v28, v29, v30, v31, (char)"notify_register_signal");
        return 1000000;
      }
      unsigned int v32 = *(_DWORD *)(v6 + 384);
    }
    int v33 = atomic_fetch_add_explicit((atomic_uint *volatile)(v6 + 488), 1u, memory_order_relaxed) + 1;
    memset(msg, 0, 512);
    *(void *)&msg[1].msgh_bits = *MEMORY[0x1E4F14C30];
    if (MEMORY[0x1E4F14C50]) {
      mach_port_t v34 = mig_strncpy_zerofill((char *)&msg[1].msgh_voucher_port, name, 512);
    }
    else {
      mach_port_t v34 = mig_strncpy((char *)&msg[1].msgh_voucher_port, name, 512);
    }
    msg[1].msgh_remote_port = 0;
    msg[1].msgh_local_port = v34;
    unsigned int v36 = (v34 + 3) & 0xFFFFFFFC;
    uint64_t v37 = (char *)msg + v36;
    *((_DWORD *)v37 + 10) = v33;
    *((_DWORD *)v37 + 11) = sig;
    msg[0].msgh_bits = 19;
    *(void *)&msg[0].msgh_remote_port = v32;
    *(void *)&msg[0].msgh_voucher_port = 0x3F500000000;
    if (MEMORY[0x1E4F14C88]) {
      voucher_mach_msg_set(msg);
    }
    if (mach_msg(msg, 1, v36 + 48, 0, 0, 0, 0))
    {
      uint32_t v12 = 1000000;
      uint64_t v38 = os_variant_has_internal_diagnostics();
      if (v38) {
        sub_1B2FB4468("Libnotify: %s failed with code %d (%d) on line %d", v39, v40, v41, v42, v43, v44, v45, (char)"notify_register_signal");
      }
      else {
        sub_1B2FB44F8(v38, "Libnotify: %s failed with code %d (%d) on line %d", v40, v41, v42, v43, v44, v45, (char)"notify_register_signal");
      }
      return v12;
    }
    unsigned int v48 = sub_1B2FAFE48(name, -1, v33, v33, -1, 0x40000005u, sig, -1, 0, 0);
    uint32_t v12 = v48;
    if (!v48)
    {
      *out_token = v33;
      return v12;
    }
    if (v48 >= 0xB)
    {
      uint64_t has_internal_diagnostics = os_variant_has_internal_diagnostics();
      if (!has_internal_diagnostics)
      {
LABEL_47:
        sub_1B2FB44F8(has_internal_diagnostics, "Libnotify: %s failed with code %d on line %d", v26, v27, v28, v29, v30, v31, (char)"notify_register_signal");
        return 1000000;
      }
      goto LABEL_43;
    }
  }
  return v12;
}

uint64_t sub_1B2FB51DC(uint64_t a1)
{
  pid_t v2 = getpid();
  int v3 = *(_DWORD *)(a1 + 32);

  return kill(v2, v3);
}

dispatch_queue_t sub_1B2FB5214(uint64_t a1)
{
  dispatch_queue_t result = dispatch_queue_create("com.apple.notify.background.local.notification", 0);
  *(void *)(*(void *)(a1 + 32) + 504) = result;
  return result;
}

uint64_t sub_1B2FB524C(uint64_t a1)
{
  mach_msg_id_t v1 = *(_DWORD *)(a1 + 36);
  msg.msgh_remote_port = *(_DWORD *)(a1 + 32);
  msg.msgh_local_port = 0;
  *(void *)&msg.msgh_bits = 0x1800000013;
  msg.msgh_voucher_port = 0;
  msg.msgh_id = v1;
  return mach_msg(&msg, 1, 0x18u, 0, 0, 0, 0);
}

uint32_t notify_register_file_descriptor(const char *name, int *notify_fd, int flags, int *out_token)
{
  char v5 = flags;
  uint64_t v60 = *MEMORY[0x1E4F14BF8];
  uint64_t v8 = sub_1B2FB1800();
  if ((sub_1B2FAE5B4(name) & 1) == 0 && os_variant_has_internal_diagnostics()) {
    sub_1B2FB4468("LIBNOTIFY INTROSPECT: registering for non-exempt notification %s", v51, v52, v53, v54, v55, v56, v57, (char)name);
  }
  if ((*(_DWORD *)(v8 + 116) & 2) != 0)
  {
    os_unfair_lock_lock_with_options();
    int v9 = *(_DWORD **)(v8 + 592);
    if (v9 && *v9 != *(_DWORD *)(v8 + 112))
    {
      uint32_t v10 = sub_1B2FB460C(v8);
      os_unfair_lock_unlock((os_unfair_lock_t)(v8 + 104));
      if (v10)
      {
        if (v10 < 0xB) {
          return v10;
        }
        uint64_t has_internal_diagnostics = os_variant_has_internal_diagnostics();
        if (!has_internal_diagnostics)
        {
LABEL_62:
          sub_1B2FB44F8(has_internal_diagnostics, "Libnotify: %s failed with code %d on line %d", v17, v18, v19, v20, v21, v22, (char)"notify_register_file_descriptor");
          return 1000000;
        }
        sub_1B2FB4468("Libnotify: %s failed with code %d on line %d", v16, v17, v18, v19, v20, v21, v22, (char)"notify_register_file_descriptor");
        return 1000000;
      }
    }
    else
    {
      os_unfair_lock_unlock((os_unfair_lock_t)(v8 + 104));
    }
  }
  if (!name) {
    return 1;
  }
  if (!notify_fd) {
    return 4;
  }
  if (v5)
  {
    uint64_t v11 = *(unsigned int *)(v8 + 512);
    if (v11)
    {
      uint64_t v12 = 0;
      uint64_t v13 = *(void *)(v8 + 520);
      while (*(_DWORD *)(v13 + 4 * v12) != *notify_fd)
      {
        if (v11 == ++v12) {
          return 4;
        }
      }
      uint64_t v31 = 4 * v12;
      v59[0] = *(_DWORD *)(v13 + v31);
      v59[1] = *(_DWORD *)(*(void *)(v8 + 528) + v31);
      goto LABEL_25;
    }
    return 4;
  }
  if (pipe(v59) < 0)
  {
    uint64_t v23 = os_variant_has_internal_diagnostics();
    uint32_t v10 = 1000000;
    if (!v23) {
      goto LABEL_56;
    }
    goto LABEL_38;
  }
  *notify_fd = v59[0];
LABEL_25:
  if (strncmp(name, "self.", 5uLL))
  {
    if (qword_1EB1C94E0 != -1) {
      dispatch_once(&qword_1EB1C94E0, &unk_1F0B10B10);
    }
    if (!byte_1EB1C94D8)
    {
      if (*(_DWORD *)(v8 + 116))
      {
        uint32_t v10 = sub_1B2FB59F8((char *)name, (unsigned int *)out_token, v59[0], v59[1]);
        if (v10)
        {
          if ((v5 & 1) == 0)
          {
            close_NOCANCEL();
            close_NOCANCEL();
          }
          if (v10 < 0xB) {
            return v10;
          }
          uint64_t has_internal_diagnostics = os_variant_has_internal_diagnostics();
          if (!has_internal_diagnostics) {
            goto LABEL_62;
          }
LABEL_54:
          sub_1B2FB4468("Libnotify: %s failed with code %d on line %d", v49, v17, v18, v19, v20, v21, v22, (char)"notify_register_file_descriptor");
          return 1000000;
        }
      }
      else
      {
        if (!*(_DWORD *)(v8 + 384))
        {
          uint32_t v50 = sub_1B2FAF064(v8);
          if (v50)
          {
            uint32_t v10 = v50;
            if ((v5 & 1) == 0)
            {
              close_NOCANCEL();
              close_NOCANCEL();
            }
            if (v10 < 0xB) {
              return v10;
            }
            uint64_t has_internal_diagnostics = os_variant_has_internal_diagnostics();
            if (!has_internal_diagnostics) {
              goto LABEL_62;
            }
            goto LABEL_54;
          }
        }
        if ((fileport_makeport() & 0x80000000) != 0)
        {
          if ((v5 & 1) == 0)
          {
            close_NOCANCEL();
            close_NOCANCEL();
          }
          uint64_t v23 = os_variant_has_internal_diagnostics();
          uint32_t v10 = 1000000;
          if (v23) {
            goto LABEL_38;
          }
          goto LABEL_56;
        }
        int v40 = atomic_fetch_add_explicit((atomic_uint *volatile)(v8 + 488), 1u, memory_order_relaxed) + 1;
        if (sub_1B2FB6A24(*(_DWORD *)(v8 + 384), name, v40, 0))
        {
          if ((v5 & 1) == 0)
          {
            close_NOCANCEL();
            close_NOCANCEL();
          }
          uint64_t v41 = os_variant_has_internal_diagnostics();
          uint32_t v10 = 1000000;
          if (v41) {
            sub_1B2FB4468("Libnotify: %s failed with code %d (%d) on line %d", v42, v43, v44, v45, v46, v47, v48, (char)"notify_register_file_descriptor");
          }
          else {
            sub_1B2FB44F8(v41, "Libnotify: %s failed with code %d (%d) on line %d", v43, v44, v45, v46, v47, v48, (char)"notify_register_file_descriptor");
          }
          return v10;
        }
        uint32_t v10 = sub_1B2FAFE48(name, -1, v40, -1, -1, 4u, -1, *notify_fd, 0, 0);
        if (v10) {
          return v10;
        }
        *out_token = v40;
      }
      sub_1B2FB58A8(v59[0], v59[1]);
      return v10;
    }
  }
  unsigned int v32 = atomic_fetch_add_explicit((atomic_uint *volatile)(v8 + 488), 1u, memory_order_relaxed) + 1;
  int v33 = v59[1];
  uint64_t v58 = 0;
  mach_port_t v34 = (os_unfair_lock_s *)(v8 + 344);
  os_unfair_lock_lock_with_options();
  unsigned int v35 = sub_1B2FB06D4(v8 + 128, name, v32, &v58);
  if (!v35)
  {
    uint64_t v37 = v58;
    *(unsigned char *)(v58 + 79) = *(unsigned char *)(v58 + 79) & 0xF0 | 4;
    *(_DWORD *)(v37 + 56) = v33;
    uint64_t v38 = *(void *)(*(void *)(v37 + 48) + 16);
    os_unfair_lock_unlock((os_unfair_lock_t)(v8 + 344));
    unsigned int v39 = sub_1B2FAFE48(name, v38, v32, v32, -1, 0x80000004, -1, *notify_fd, 0, 0);
    if (!v39)
    {
      *out_token = v32;
      sub_1B2FB58A8(v59[0], v59[1]);
      return 0;
    }
    uint32_t v10 = v39;
    if (v39 < 0xB) {
      return v10;
    }
    uint32_t v10 = 1000000;
    uint64_t v23 = os_variant_has_internal_diagnostics();
    if (!v23) {
      goto LABEL_56;
    }
LABEL_38:
    sub_1B2FB4468("Libnotify: %s failed with code %d on line %d", v24, v25, v26, v27, v28, v29, v30, (char)"notify_register_file_descriptor");
    return v10;
  }
  unsigned int v36 = v35;
  os_unfair_lock_unlock(v34);
  if ((v5 & 1) == 0)
  {
    close_NOCANCEL();
    close_NOCANCEL();
  }
  uint32_t v10 = v36;
  if (v36 >= 0xB)
  {
    uint32_t v10 = 1000000;
    uint64_t v23 = os_variant_has_internal_diagnostics();
    if (v23) {
      goto LABEL_38;
    }
LABEL_56:
    sub_1B2FB44F8(v23, "Libnotify: %s failed with code %d on line %d", v25, v26, v27, v28, v29, v30, (char)"notify_register_file_descriptor");
  }
  return v10;
}

void sub_1B2FB58A8(int a1, int a2)
{
  uint64_t v4 = sub_1B2FB1800();
  if (((a2 | a1) & 0x80000000) == 0)
  {
    uint64_t v5 = v4;
    uint64_t v6 = (os_unfair_lock_s *)(v4 + 104);
    os_unfair_lock_lock_with_options();
    unint64_t v7 = *(unsigned int *)(v5 + 512);
    uint64_t v8 = *(_DWORD **)(v5 + 520);
    if (!v7) {
      goto LABEL_15;
    }
    unint64_t v9 = 0;
    do
    {
      if (v8[v9] == a1) {
        unsigned int v10 = v9;
      }
      else {
        unsigned int v10 = -1;
      }
      ++v9;
    }
    while (v10 == -1 && v9 < v7);
    if (v10 == -1)
    {
LABEL_15:
      *(_DWORD *)(v5 + 512) = v7 + 1;
      *(void *)(v5 + 520) = reallocf(v8, 4 * (v7 + 1));
      *(void *)(v5 + 528) = reallocf(*(void **)(v5 + 528), 4 * *(unsigned int *)(v5 + 512));
      uint64_t v12 = reallocf(*(void **)(v5 + 536), 4 * *(unsigned int *)(v5 + 512));
      *(void *)(v5 + 536) = v12;
      uint64_t v13 = *(void *)(v5 + 520);
      if (v13 && v12 && (uint64_t v14 = *(void *)(v5 + 528)) != 0)
      {
        *(_DWORD *)(v13 + 4 * v7) = a1;
        *(_DWORD *)(v14 + 4 * v7) = a2;
        v12[v7] = 1;
      }
      else
      {
        free(*(void **)(v5 + 520));
        *(void *)(v5 + 520) = 0;
        free(*(void **)(v5 + 528));
        *(void *)(v5 + 528) = 0;
        free(*(void **)(v5 + 536));
        *(void *)(v5 + 536) = 0;
        *(_DWORD *)(v5 + 512) = 0;
      }
    }
    else
    {
      ++*(_DWORD *)(*(void *)(v5 + 536) + 4 * v10);
    }
    os_unfair_lock_unlock(v6);
  }
}

uint64_t sub_1B2FB59F8(char *a1, unsigned int *a2, int a3, int a4)
{
  uint64_t v8 = sub_1B2FB1800();
  if (!*(_DWORD *)(v8 + 392)) {
    return 19;
  }
  uint64_t result = sub_1B2FAF7CC(a1, a2, v8, 0);
  if (!result)
  {
    uint64_t v10 = sub_1B2FB1720();
    if (v10)
    {
      uint64_t v11 = v10;
      *(_DWORD *)(v10 + 20) = *a2;
      *(_DWORD *)(v10 + 36) = a3;
      global_queue = dispatch_get_global_queue(2, 0);
      *(void *)(v11 + 48) = global_queue;
      dispatch_retain(global_queue);
      unsigned int v13 = bswap32(*(_DWORD *)(v11 + 20));
      aBlock[0] = MEMORY[0x1E4F14BE8];
      aBlock[1] = 0x40000000;
      aBlock[2] = sub_1B2FB5B00;
      aBlock[3] = &unk_1E6019008;
      int v15 = a4;
      unsigned int v16 = v13;
      *(void *)(v11 + 56) = _Block_copy(aBlock);
      sub_1B2FB17A0((char *)v11);
      return 0;
    }
    else
    {
      return 18;
    }
  }
  return result;
}

uint64_t sub_1B2FB5B00()
{
  return write_NOCANCEL();
}

void notify_peek(uint64_t a1, _DWORD *a2)
{
  uint64_t v3 = sub_1B2FB1800();
  if ((*(_DWORD *)(v3 + 116) & 2) != 0)
  {
    os_unfair_lock_lock_with_options();
    uint64_t v4 = *(_DWORD **)(v3 + 592);
    if (v4 && *v4 != *(_DWORD *)(v3 + 112))
    {
      unsigned int v10 = sub_1B2FB460C(v3);
      os_unfair_lock_unlock((os_unfair_lock_t)(v3 + 104));
      if (v10)
      {
        if (v10 < 0xB) {
          return;
        }
        uint64_t has_internal_diagnostics = os_variant_has_internal_diagnostics();
        if (has_internal_diagnostics)
        {
LABEL_25:
          sub_1B2FB4468("Libnotify: %s failed with code %d on line %d", v12, v13, v14, v15, v16, v17, v18, (char)"notify_peek");
          return;
        }
LABEL_30:
        sub_1B2FB44F8(has_internal_diagnostics, "Libnotify: %s failed with code %d on line %d", v13, v14, v15, v16, v17, v18, (char)"notify_peek");
        return;
      }
    }
    else
    {
      os_unfair_lock_unlock((os_unfair_lock_t)(v3 + 104));
    }
  }
  uint64_t v5 = sub_1B2FB1720();
  if (!v5) {
    return;
  }
  uint64_t v6 = v5;
  if ((*(_DWORD *)(v5 + 24) & 0x80000000) != 0)
  {
    if (a2)
    {
      os_unfair_lock_lock_with_options();
      uint64_t v8 = os_set_64_ptr_find();
      if (v8)
      {
        uint64_t v9 = *(void *)(v3 + 224);
        if (v9 != v8) {
          *a2 = *(_DWORD *)(*(void *)(v8 - v9 + 48) + 60);
        }
      }
      os_unfair_lock_unlock((os_unfair_lock_t)(v3 + 344));
    }
    goto LABEL_28;
  }
  if (qword_1EB1C94E0 != -1) {
    dispatch_once(&qword_1EB1C94E0, &unk_1F0B10B10);
  }
  if (byte_1EB1C94D8)
  {
    qword_1E9CAF980 = (uint64_t)"BUG IN CLIENT OF LIBNOTIFY: loopback mode enabled but process wants to IPC to notifyd";
    __break(1u);
    return;
  }
  if ((*(_DWORD *)(v6 + 24) & 0xF) != 1) {
    goto LABEL_28;
  }
  uint64_t v7 = *(void *)(v3 + 592);
  if (!v7)
  {
    sub_1B2FB17A0((char *)v6);
    uint64_t has_internal_diagnostics = os_variant_has_internal_diagnostics();
    if (has_internal_diagnostics) {
      goto LABEL_25;
    }
    goto LABEL_30;
  }
  *a2 = *(_DWORD *)(v7 + 4 * *(unsigned int *)(v6 + 28));
LABEL_28:
  sub_1B2FB17A0((char *)v6);
}

uint64_t notify_get_event(uint64_t a1, _DWORD *a2, uint64_t a3, _DWORD *a4)
{
  if ((byte_1E9CAF9B8 & 1) == 0)
  {
    uint64_t has_internal_diagnostics = os_variant_has_internal_diagnostics();
    if (has_internal_diagnostics) {
      sub_1B2FB4468("Libnotify client using deprecated function notify_get_event; this function does nothing",
    }
        v7,
        v8,
        v9,
        v10,
        v11,
        v12,
        v13,
        v15);
    else {
      sub_1B2FB44F8(has_internal_diagnostics, "Libnotify client using deprecated function notify_get_event; this function does nothing",
    }
        v8,
        v9,
        v10,
        v11,
        v12,
        v13,
        v15);
    byte_1E9CAF9B8 = 1;
  }
  if (a2) {
    *a2 = 0;
  }
  if (a4) {
    *a4 = 0;
  }
  return 0;
}

uint32_t notify_suspend(int token)
{
  mach_msg_return_t v9;
  int v10;
  uint32_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  os_unfair_lock_s *v16;
  uint64_t has_internal_diagnostics;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint32_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  int msg;
  unsigned char msg_4[44];

  uint64_t v2 = sub_1B2FB1800();
  if ((*(_DWORD *)(v2 + 116) & 2) == 0) {
    goto LABEL_5;
  }
  os_unfair_lock_lock_with_options();
  uint64_t v3 = *(_DWORD **)(v2 + 592);
  if (!v3 || *v3 == *(_DWORD *)(v2 + 112))
  {
    os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 104));
    goto LABEL_5;
  }
  uint64_t v11 = sub_1B2FB460C(v2);
  os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 104));
  if (!v11)
  {
LABEL_5:
    uint64_t v4 = sub_1B2FB1720();
    if (!v4) {
      return 2;
    }
    uint64_t v5 = v4;
    if ((*(_DWORD *)(v4 + 24) & 0x80000000) != 0)
    {
      os_unfair_lock_lock_with_options();
      uint64_t v12 = os_set_64_ptr_find();
      if (v12)
      {
        uint64_t v13 = *(void *)(v2 + 224);
        if (v13 != v12)
        {
          uint64_t v14 = v12 - v13;
          *(unsigned char *)(v14 + 79) |= 0x20u;
          char v15 = *(unsigned __int8 *)(v14 + 78);
          if (v15 != 255) {
            *(unsigned char *)(v14 + 78) = v15 + 1;
          }
        }
      }
      uint64_t v16 = (os_unfair_lock_s *)(v2 + 344);
    }
    else
    {
      if (qword_1EB1C94E0 != -1) {
        dispatch_once(&qword_1EB1C94E0, &unk_1F0B10B10);
      }
      if (byte_1EB1C94D8)
      {
        qword_1E9CAF980 = (uint64_t)"BUG IN CLIENT OF LIBNOTIFY: loopback mode enabled but process wants to IPC to notifyd";
        __break(1u);
        return token;
      }
      if (!*(_DWORD *)(v2 + 384))
      {
        uint64_t v26 = sub_1B2FAF064(v2);
        if (v26)
        {
          uint64_t v11 = v26;
          sub_1B2FB17A0((char *)v5);
          if (v11 >= 0xB)
          {
            uint64_t has_internal_diagnostics = os_variant_has_internal_diagnostics();
            if (has_internal_diagnostics)
            {
LABEL_34:
              sub_1B2FB4468("Libnotify: %s failed with code %d on line %d", v18, v19, v20, v21, v22, v23, v24, (char)"notify_suspend");
              return 1000000;
            }
LABEL_47:
            sub_1B2FB44F8(has_internal_diagnostics, "Libnotify: %s failed with code %d on line %d", v19, v20, v21, v22, v23, v24, (char)"notify_suspend");
            return 1000000;
          }
          return v11;
        }
      }
      os_unfair_lock_lock_with_options();
      int v6 = *(_DWORD *)(v5 + 24);
      if ((v6 & 0x4000000) == 0)
      {
        os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(v5 + 104) + 40));
        int v7 = *(_DWORD *)(v2 + 384);
        memset(&msg_4[16], 0, 28);
        *(_OWORD *)msg_4 = 0u;
        *(void *)&msg_4[20] = *MEMORY[0x1E4F14C30];
        *(_DWORD *)&msg_4[28] = token;
        mach_port_name_t special_reply_port = mig_get_special_reply_port();
        *(_DWORD *)&msg_4[4] = v7;
        *(_DWORD *)&msg_4[8] = special_reply_port;
        mach_msg_header_t msg = 5395;
        *(void *)&msg_4[12] = 0x3EC00000000;
        if (MEMORY[0x1E4F14C88])
        {
          voucher_mach_msg_set((mach_msg_header_t *)&msg);
          mach_port_name_t special_reply_port = *(_DWORD *)&msg_4[8];
        }
        uint64_t v9 = mach_msg((mach_msg_header_t *)&msg, 3162115, 0x24u, 0x30u, special_reply_port, 0, 0);
        uint64_t v10 = v9;
        if ((v9 - 268435458) <= 0xE && ((1 << (v9 - 2)) & 0x4003) != 0)
        {
          sub_1B2FB17A0((char *)v5);
          goto LABEL_56;
        }
        if (v9)
        {
          mig_dealloc_special_reply_port();
          goto LABEL_55;
        }
        if (*(_DWORD *)&msg_4[16] == 71)
        {
          uint64_t v10 = -308;
        }
        else
        {
          if (*(_DWORD *)&msg_4[16] == 1104)
          {
            if (msg < 0) {
              goto LABEL_53;
            }
            if (*(_DWORD *)msg_4 != 40)
            {
              if (*(_DWORD *)msg_4 == 36)
              {
                if (*(_DWORD *)&msg_4[4]) {
                  uint64_t v27 = 1;
                }
                else {
                  uint64_t v27 = *(_DWORD *)&msg_4[28] == 0;
                }
                if (v27) {
                  uint64_t v10 = -300;
                }
                else {
                  uint64_t v10 = *(_DWORD *)&msg_4[28];
                }
                goto LABEL_54;
              }
              goto LABEL_53;
            }
            if (*(_DWORD *)&msg_4[4])
            {
LABEL_53:
              uint64_t v10 = -300;
              goto LABEL_54;
            }
            uint64_t v10 = *(_DWORD *)&msg_4[28];
            if (*(_DWORD *)&msg_4[28]) {
              goto LABEL_54;
            }
            token = *(_DWORD *)&msg_4[32];
            sub_1B2FB17A0((char *)v5);
            if (token >= 0xB)
            {
LABEL_56:
              uint64_t v11 = 1000000;
              uint64_t v28 = os_variant_has_internal_diagnostics();
              if (v28) {
                sub_1B2FB4468("Libnotify: %s failed with code %d (%d) on line %d", v29, v30, v31, v32, v33, v34, v35, (char)"notify_suspend");
              }
              else {
                sub_1B2FB44F8(v28, "Libnotify: %s failed with code %d (%d) on line %d", v30, v31, v32, v33, v34, v35, (char)"notify_suspend");
              }
              return v11;
            }
            return token;
          }
          uint64_t v10 = -301;
        }
LABEL_54:
        mach_msg_destroy((mach_msg_header_t *)&msg);
LABEL_55:
        sub_1B2FB17A0((char *)v5);
        if (v10) {
          goto LABEL_56;
        }
        return 0;
      }
      *(_DWORD *)(v5 + 24) = v6 | 0x800000;
      uint64_t v16 = (os_unfair_lock_s *)(*(void *)(v5 + 104) + 40);
    }
    os_unfair_lock_unlock(v16);
    sub_1B2FB17A0((char *)v5);
    return 0;
  }
  if (v11 >= 0xB)
  {
    uint64_t has_internal_diagnostics = os_variant_has_internal_diagnostics();
    if (has_internal_diagnostics) {
      goto LABEL_34;
    }
    goto LABEL_47;
  }
  return v11;
}

uint32_t notify_resume(int token)
{
  mach_msg_return_t v9;
  int v10;
  uint32_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  char v16;
  uint64_t has_internal_diagnostics;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint32_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  int msg;
  unsigned char msg_4[44];

  uint64_t v2 = sub_1B2FB1800();
  if ((*(_DWORD *)(v2 + 116) & 2) == 0) {
    goto LABEL_5;
  }
  os_unfair_lock_lock_with_options();
  uint64_t v3 = *(_DWORD **)(v2 + 592);
  if (!v3 || *v3 == *(_DWORD *)(v2 + 112))
  {
    os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 104));
    goto LABEL_5;
  }
  uint64_t v11 = sub_1B2FB460C(v2);
  os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 104));
  if (!v11)
  {
LABEL_5:
    uint64_t v4 = sub_1B2FB1720();
    if (!v4) {
      return 2;
    }
    uint64_t v5 = v4;
    if ((*(_DWORD *)(v4 + 24) & 0x80000000) != 0)
    {
      os_unfair_lock_lock_with_options();
      uint64_t v12 = os_set_64_ptr_find();
      if (v12)
      {
        uint64_t v13 = *(void *)(v2 + 224);
        uint64_t v14 = v12 - v13;
        if (v12 != v13)
        {
          if (!*(unsigned char *)(v14 + 78) || (char v15 = *(unsigned char *)(v14 + 78) - 1, (*(unsigned char *)(v14 + 78) = v15) == 0))
          {
            uint64_t v16 = *(unsigned char *)(v14 + 79);
            *(unsigned char *)(v14 + 79) = v16 & 0x5F;
            if ((v16 & 0x40) != 0) {
              sub_1B2FB0B08(v2 + 128, v14);
            }
          }
        }
      }
      os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 344));
    }
    else
    {
      if (qword_1EB1C94E0 != -1) {
        dispatch_once(&qword_1EB1C94E0, &unk_1F0B10B10);
      }
      if (byte_1EB1C94D8)
      {
        qword_1E9CAF980 = (uint64_t)"BUG IN CLIENT OF LIBNOTIFY: loopback mode enabled but process wants to IPC to notifyd";
        __break(1u);
        return token;
      }
      if (!*(_DWORD *)(v2 + 384))
      {
        uint64_t v26 = sub_1B2FAF064(v2);
        if (v26)
        {
          uint64_t v11 = v26;
          sub_1B2FB17A0((char *)v5);
          if (v11 >= 0xB)
          {
            uint64_t has_internal_diagnostics = os_variant_has_internal_diagnostics();
            if (has_internal_diagnostics)
            {
LABEL_37:
              sub_1B2FB4468("Libnotify: %s failed with code %d on line %d", v18, v19, v20, v21, v22, v23, v24, (char)"notify_resume");
              return 1000000;
            }
LABEL_50:
            sub_1B2FB44F8(has_internal_diagnostics, "Libnotify: %s failed with code %d on line %d", v19, v20, v21, v22, v23, v24, (char)"notify_resume");
            return 1000000;
          }
          return v11;
        }
      }
      os_unfair_lock_lock_with_options();
      int v6 = *(_DWORD *)(v5 + 24);
      if ((v6 & 0x4000000) == 0)
      {
        os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(v5 + 104) + 40));
        int v7 = *(_DWORD *)(v2 + 384);
        memset(&msg_4[16], 0, 28);
        *(_OWORD *)msg_4 = 0u;
        *(void *)&msg_4[20] = *MEMORY[0x1E4F14C30];
        *(_DWORD *)&msg_4[28] = token;
        mach_port_name_t special_reply_port = mig_get_special_reply_port();
        *(_DWORD *)&msg_4[4] = v7;
        *(_DWORD *)&msg_4[8] = special_reply_port;
        mach_msg_header_t msg = 5395;
        *(void *)&msg_4[12] = 0x3ED00000000;
        if (MEMORY[0x1E4F14C88])
        {
          voucher_mach_msg_set((mach_msg_header_t *)&msg);
          mach_port_name_t special_reply_port = *(_DWORD *)&msg_4[8];
        }
        uint64_t v9 = mach_msg((mach_msg_header_t *)&msg, 3162115, 0x24u, 0x30u, special_reply_port, 0, 0);
        uint64_t v10 = v9;
        if ((v9 - 268435458) <= 0xE && ((1 << (v9 - 2)) & 0x4003) != 0)
        {
          sub_1B2FB17A0((char *)v5);
          goto LABEL_59;
        }
        if (v9)
        {
          mig_dealloc_special_reply_port();
          goto LABEL_58;
        }
        if (*(_DWORD *)&msg_4[16] == 71)
        {
          uint64_t v10 = -308;
        }
        else
        {
          if (*(_DWORD *)&msg_4[16] == 1105)
          {
            if (msg < 0) {
              goto LABEL_56;
            }
            if (*(_DWORD *)msg_4 != 40)
            {
              if (*(_DWORD *)msg_4 == 36)
              {
                if (*(_DWORD *)&msg_4[4]) {
                  uint64_t v27 = 1;
                }
                else {
                  uint64_t v27 = *(_DWORD *)&msg_4[28] == 0;
                }
                if (v27) {
                  uint64_t v10 = -300;
                }
                else {
                  uint64_t v10 = *(_DWORD *)&msg_4[28];
                }
                goto LABEL_57;
              }
              goto LABEL_56;
            }
            if (*(_DWORD *)&msg_4[4])
            {
LABEL_56:
              uint64_t v10 = -300;
              goto LABEL_57;
            }
            uint64_t v10 = *(_DWORD *)&msg_4[28];
            if (*(_DWORD *)&msg_4[28]) {
              goto LABEL_57;
            }
            token = *(_DWORD *)&msg_4[32];
            sub_1B2FB17A0((char *)v5);
            if (token >= 0xB)
            {
LABEL_59:
              uint64_t v11 = 1000000;
              uint64_t v28 = os_variant_has_internal_diagnostics();
              if (v28) {
                sub_1B2FB4468("Libnotify: %s failed with code %d (%d) on line %d", v29, v30, v31, v32, v33, v34, v35, (char)"notify_resume");
              }
              else {
                sub_1B2FB44F8(v28, "Libnotify: %s failed with code %d (%d) on line %d", v30, v31, v32, v33, v34, v35, (char)"notify_resume");
              }
              return v11;
            }
            return token;
          }
          uint64_t v10 = -301;
        }
LABEL_57:
        mach_msg_destroy((mach_msg_header_t *)&msg);
LABEL_58:
        sub_1B2FB17A0((char *)v5);
        if (v10) {
          goto LABEL_59;
        }
        return 0;
      }
      *(_DWORD *)(v5 + 24) = v6 & 0xFF3FFFFF;
      os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(v5 + 104) + 40));
      if ((v6 & 0x400000) != 0) {
        sub_1B2FB1E44(v5);
      }
    }
    sub_1B2FB17A0((char *)v5);
    return 0;
  }
  if (v11 >= 0xB)
  {
    uint64_t has_internal_diagnostics = os_variant_has_internal_diagnostics();
    if (has_internal_diagnostics) {
      goto LABEL_37;
    }
    goto LABEL_50;
  }
  return v11;
}

uint64_t notify_simple_post(char *name)
{
  if ((byte_1E9CAF9B9 & 1) == 0)
  {
    uint64_t has_internal_diagnostics = os_variant_has_internal_diagnostics();
    if (has_internal_diagnostics) {
      sub_1B2FB4468("Libnotify client using deprecated function notify_simple_post, use notify_post instead", v3, v4, v5, v6, v7, v8, v9, v11);
    }
    else {
      sub_1B2FB44F8(has_internal_diagnostics, "Libnotify client using deprecated function notify_simple_post, use notify_post instead", v4, v5, v6, v7, v8, v9, v11);
    }
    byte_1E9CAF9B9 = 1;
  }

  return notify_post(name);
}

uint64_t notify_dump_status()
{
  mach_msg_return_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int has_internal_diagnostics;
  int *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  unsigned char msg[36];
  uint64_t v42;

  uint64_t v0 = sub_1B2FB1800();
  uint64_t v1 = v0;
  if (*(_DWORD *)(v0 + 384) || (uint64_t v6 = sub_1B2FAF064(v0), !v6))
  {
    if ((creat_NOCANCEL() & 0x80000000) != 0)
    {
      uint64_t v5 = 1000000;
      uint64_t has_internal_diagnostics = os_variant_has_internal_diagnostics();
      uint64_t v16 = __error();
      if (has_internal_diagnostics) {
        sub_1B2FB4468("Libnotify: %s failed with code %d on line %d (errno: %d)", v17, v18, v19, v20, v21, v22, v23, (char)"notify_dump_status");
      }
      else {
        sub_1B2FB44F8((uint64_t)v16, "Libnotify: %s failed with code %d on line %d (errno: %d)", v18, v19, v20, v21, v22, v23, (char)"notify_dump_status");
      }
    }
    else if ((fileport_makeport() & 0x80000000) != 0)
    {
      close_NOCANCEL();
      uint64_t v24 = os_variant_has_internal_diagnostics();
      uint64_t v5 = 1000000;
      if (v24) {
        sub_1B2FB4468("Libnotify: %s failed with code %d on line %d (fileport_status: %d)", v25, v26, v27, v28, v29, v30, v31, (char)"notify_dump_status");
      }
      else {
        sub_1B2FB44F8(v24, "Libnotify: %s failed with code %d on line %d (fileport_status: %d)", v26, v27, v28, v29, v30, v31, (char)"notify_dump_status");
      }
    }
    else
    {
      int v2 = *(_DWORD *)(v1 + 384);
      *(_OWORD *)&msg[20] = 0u;
      *(_DWORD *)&msg[4] = 0;
      *(_DWORD *)&msg[24] = 1;
      *(_DWORD *)&msg[28] = 0;
      uint64_t v42 = 1114112;
      mach_port_name_t special_reply_port = mig_get_special_reply_port();
      *(_DWORD *)&msg[8] = v2;
      *(_DWORD *)&msg[12] = special_reply_port;
      *(_DWORD *)mach_msg_header_t msg = -2147478253;
      *(void *)&msg[16] = 0x40000000000;
      if (MEMORY[0x1E4F14C88])
      {
        voucher_mach_msg_set((mach_msg_header_t *)msg);
        mach_port_name_t special_reply_port = *(_DWORD *)&msg[12];
      }
      uint64_t v4 = mach_msg((mach_msg_header_t *)msg, 3162115, 0x28u, 0x2Cu, special_reply_port, 0, 0);
      if ((v4 - 268435458) > 0xE || ((1 << (v4 - 2)) & 0x4003) == 0)
      {
        if (v4)
        {
          mig_dealloc_special_reply_port();
        }
        else
        {
          if (*(_DWORD *)&msg[20] == 1124
            && (*(_DWORD *)msg & 0x80000000) == 0
            && *(_DWORD *)&msg[4] == 36
            && !*(_DWORD *)&msg[8]
            && !*(_DWORD *)&msg[32])
          {
            close_NOCANCEL();
            return 0;
          }
          mach_msg_destroy((mach_msg_header_t *)msg);
        }
      }
      close_NOCANCEL();
      unsigned int v32 = os_variant_has_internal_diagnostics();
      uint64_t v5 = 1000000;
      if (v32) {
        sub_1B2FB4468("Libnotify: %s failed with code %d on line %d (kstatus: %d)", v33, v34, v35, v36, v37, v38, v39, (char)"notify_dump_status");
      }
      else {
        sub_1B2FB44F8(v32, "Libnotify: %s failed with code %d on line %d (kstatus: %d)", v34, v35, v36, v37, v38, v39, (char)"notify_dump_status");
      }
    }
  }
  else
  {
    uint64_t v5 = v6;
    if (v6 >= 0xB)
    {
      uint64_t v5 = 1000000;
      uint64_t v7 = os_variant_has_internal_diagnostics();
      if (v7) {
        sub_1B2FB4468("Libnotify: %s failed with code %d on line %d", v8, v9, v10, v11, v12, v13, v14, (char)"notify_dump_status");
      }
      else {
        sub_1B2FB44F8(v7, "Libnotify: %s failed with code %d on line %d", v9, v10, v11, v12, v13, v14, (char)"notify_dump_status");
      }
    }
  }
  return v5;
}

uint64_t sub_1B2FB6A08(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, uint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), a2 - *(void *)(*(void *)(a1 + 40) + 24));
}

uint64_t sub_1B2FB6A24(unsigned int a1, const char *a2, int a3, int a4)
{
  uint64_t v14 = *MEMORY[0x1E4F14BF8];
  long long v12 = 0u;
  memset(v13, 0, 464);
  memset(&v9, 0, sizeof(v9));
  int v10 = 1;
  int v11 = a4;
  DWORD1(v12) = 1114112;
  *((void *)&v12 + 1) = *MEMORY[0x1E4F14C30];
  if (MEMORY[0x1E4F14C50]) {
    int v6 = mig_strncpy_zerofill((char *)v13 + 8, a2, 512);
  }
  else {
    int v6 = mig_strncpy((char *)v13 + 8, a2, 512);
  }
  LODWORD(v13[0]) = 0;
  DWORD1(v13[0]) = v6;
  uint64_t v7 = (v6 + 3) & 0xFFFFFFFC;
  *(_DWORD *)((char *)v13 + v7 + 8) = a3;
  v9.msgh_bits = -2147483629;
  *(void *)&v9.msgh_remote_port = a1;
  *(void *)&v9.msgh_voucher_port = 0x3F600000000;
  if (MEMORY[0x1E4F14C88]) {
    voucher_mach_msg_set(&v9);
  }
  return mach_msg(&v9, 1, v7 + 60, 0, 0, 0, 0);
}

uint64_t sub_1B2FB6B70(unsigned int a1, const char *a2, int a3, int a4)
{
  uint64_t v14 = *MEMORY[0x1E4F14BF8];
  long long v12 = 0u;
  memset(v13, 0, 464);
  memset(&v9, 0, sizeof(v9));
  int v10 = 1;
  int v11 = a4;
  DWORD1(v12) = 1310720;
  *((void *)&v12 + 1) = *MEMORY[0x1E4F14C30];
  if (MEMORY[0x1E4F14C50]) {
    int v6 = mig_strncpy_zerofill((char *)v13 + 8, a2, 512);
  }
  else {
    int v6 = mig_strncpy((char *)v13 + 8, a2, 512);
  }
  LODWORD(v13[0]) = 0;
  DWORD1(v13[0]) = v6;
  uint64_t v7 = (v6 + 3) & 0xFFFFFFFC;
  *(_DWORD *)((char *)v13 + v7 + 8) = a3;
  v9.msgh_bits = -2147483629;
  *(void *)&v9.msgh_remote_port = a1;
  *(void *)&v9.msgh_voucher_port = 0x3F700000000;
  if (MEMORY[0x1E4F14C88]) {
    voucher_mach_msg_set(&v9);
  }
  return mach_msg(&v9, 1, v7 + 60, 0, 0, 0, 0);
}

uint64_t sub_1B2FB6CBC(mach_port_name_t a1, const char *a2, int a3, _DWORD *a4, _DWORD *a5)
{
  uint64_t v49 = *MEMORY[0x1E4F14BF8];
  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
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
  *(_OWORD *)rcv_name = 0u;
  long long v18 = 0u;
  *((void *)&v18 + 1) = *MEMORY[0x1E4F14C30];
  if (MEMORY[0x1E4F14C50]) {
    int v9 = mig_strncpy_zerofill((char *)&v19 + 8, a2, 512);
  }
  else {
    int v9 = mig_strncpy((char *)&v19 + 8, a2, 512);
  }
  LODWORD(v19) = 0;
  DWORD1(v19) = v9;
  uint64_t v10 = (v9 + 3) & 0xFFFFFFFC;
  mach_msg_size_t v11 = v10 + 44;
  *(_DWORD *)((char *)&v19 + v10 + 8) = a3;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  rcv_name[2] = a1;
  rcv_name[3] = special_reply_port;
  rcv_name[0] = 5395;
  *(void *)&long long v18 = 0x40300000000;
  if (MEMORY[0x1E4F14C88])
  {
    voucher_mach_msg_set((mach_msg_header_t *)rcv_name);
    mach_port_name_t special_reply_port = rcv_name[3];
  }
  uint64_t v13 = mach_msg((mach_msg_header_t *)rcv_name, 3162115, v11, 0x3Cu, special_reply_port, 0, 0);
  uint64_t v14 = v13;
  if ((v13 - 268435458) > 0xE || ((1 << (v13 - 2)) & 0x4003) == 0)
  {
    if (!v13)
    {
      if (DWORD1(v18) == 71)
      {
        uint64_t v14 = 4294966988;
      }
      else if (DWORD1(v18) == 1127)
      {
        if ((rcv_name[0] & 0x80000000) == 0)
        {
          if (rcv_name[1] == 36)
          {
            uint64_t v14 = 4294966996;
            if (v19)
            {
              if (rcv_name[2]) {
                uint64_t v14 = 4294966996;
              }
              else {
                uint64_t v14 = v19;
              }
            }
          }
          else
          {
            uint64_t v14 = 4294966996;
          }
          goto LABEL_26;
        }
        uint64_t v14 = 4294966996;
        if (DWORD2(v18) == 1 && rcv_name[1] == 52 && !rcv_name[2] && WORD3(v19) << 16 == 0x100000)
        {
          uint64_t v14 = 0;
          int v15 = HIDWORD(v18);
          *a4 = v20;
          *a5 = v15;
          return v14;
        }
      }
      else
      {
        uint64_t v14 = 4294966995;
      }
LABEL_26:
      mach_msg_destroy((mach_msg_header_t *)rcv_name);
      return v14;
    }
    mig_dealloc_special_reply_port();
  }
  return v14;
}

uint64_t sub_1B2FB6EFC(int a1, _DWORD *a2, _DWORD *a3, _DWORD *a4)
{
  int v16 = 0;
  long long v15 = 0u;
  *(_OWORD *)&msg[20] = 0u;
  *(_DWORD *)&msg[4] = 0;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  *(_DWORD *)&msg[8] = a1;
  *(_DWORD *)&msg[12] = special_reply_port;
  *(_DWORD *)mach_msg_header_t msg = 5395;
  *(void *)&msg[16] = 0x40400000000;
  if (MEMORY[0x1E4F14C88])
  {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
    mach_port_name_t special_reply_port = *(_DWORD *)&msg[12];
  }
  uint64_t v9 = mach_msg((mach_msg_header_t *)msg, 3162115, 0x18u, 0x38u, special_reply_port, 0, 0);
  uint64_t v10 = v9;
  if ((v9 - 268435458) > 0xE || ((1 << (v9 - 2)) & 0x4003) == 0)
  {
    if (!v9)
    {
      if (*(_DWORD *)&msg[20] == 71)
      {
        uint64_t v10 = 4294966988;
      }
      else if (*(_DWORD *)&msg[20] == 1128)
      {
        if ((*(_DWORD *)msg & 0x80000000) == 0)
        {
          if (*(_DWORD *)&msg[4] == 48)
          {
            if (!*(_DWORD *)&msg[8])
            {
              uint64_t v10 = *(unsigned int *)&msg[32];
              if (!*(_DWORD *)&msg[32])
              {
                int v13 = DWORD1(v15);
                *a2 = v15;
                *a3 = v13;
                *a4 = DWORD2(v15);
                return v10;
              }
              goto LABEL_22;
            }
          }
          else if (*(_DWORD *)&msg[4] == 36)
          {
            if (*(_DWORD *)&msg[8]) {
              BOOL v11 = 1;
            }
            else {
              BOOL v11 = *(_DWORD *)&msg[32] == 0;
            }
            if (v11) {
              uint64_t v10 = 4294966996;
            }
            else {
              uint64_t v10 = *(unsigned int *)&msg[32];
            }
            goto LABEL_22;
          }
        }
        uint64_t v10 = 4294966996;
      }
      else
      {
        uint64_t v10 = 4294966995;
      }
LABEL_22:
      mach_msg_destroy((mach_msg_header_t *)msg);
      return v10;
    }
    mig_dealloc_special_reply_port();
  }
  return v10;
}

uint64_t sub_1B2FB7074(unsigned int a1, const char *a2, int a3)
{
  uint64_t v11 = *MEMORY[0x1E4F14BF8];
  memset(v10, 0, 480);
  long long v8 = 0u;
  long long v9 = 0u;
  *((void *)&v9 + 1) = *MEMORY[0x1E4F14C30];
  if (MEMORY[0x1E4F14C50]) {
    int v5 = mig_strncpy_zerofill((char *)v10 + 8, a2, 512);
  }
  else {
    int v5 = mig_strncpy((char *)v10 + 8, a2, 512);
  }
  LODWORD(v10[0]) = 0;
  DWORD1(v10[0]) = v5;
  uint64_t v6 = (v5 + 3) & 0xFFFFFFFC;
  *(_DWORD *)((char *)v10 + v6 + 8) = a3;
  LODWORD(v8) = 19;
  *((void *)&v8 + 1) = a1;
  *(void *)&long long v9 = 0x40500000000;
  if (MEMORY[0x1E4F14C88]) {
    voucher_mach_msg_set((mach_msg_header_t *)&v8);
  }
  return mach_msg((mach_msg_header_t *)&v8, 1, v6 + 44, 0, 0, 0, 0);
}

uint64_t sub_1B2FB71AC(mach_port_name_t a1, const char *a2, int a3, int a4, int a5, int a6, uint64_t a7, uint64_t a8, uint64_t a9, int a10, int a11, _DWORD *a12, void *a13, int *a14)
{
  uint64_t v38 = *MEMORY[0x1E4F14BF8];
  memset(v37, 0, 448);
  uint64_t v32 = 0x14000000000000;
  uint64_t v36 = 0;
  *(_OWORD *)rcv_name = 0u;
  long long v31 = 0u;
  DWORD2(v31) = 2;
  uint64_t v33 = a9;
  int v34 = 16777472;
  int v35 = a10;
  uint64_t v36 = *MEMORY[0x1E4F14C30];
  if (MEMORY[0x1E4F14C50]) {
    int v21 = mig_strncpy_zerofill((char *)v37 + 8, a2, 512);
  }
  else {
    int v21 = mig_strncpy((char *)v37 + 8, a2, 512);
  }
  LODWORD(v37[0]) = 0;
  DWORD1(v37[0]) = v21;
  uint64_t v22 = (v21 + 3) & 0xFFFFFFFC;
  mach_msg_size_t v23 = v22 + 112;
  long long v24 = (char *)rcv_name + v22;
  *((_DWORD *)v24 + 18) = a3;
  *((_DWORD *)v24 + 19) = a4;
  *((_DWORD *)v24 + 20) = a5;
  *((_DWORD *)v24 + 21) = a6;
  *((void *)v24 + 11) = a7;
  *((void *)v24 + 12) = a8;
  *((_DWORD *)v24 + 26) = a10;
  *((_DWORD *)v24 + 27) = a11;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  rcv_name[2] = a1;
  rcv_name[3] = special_reply_port;
  rcv_name[0] = -2147478253;
  *(void *)&long long v31 = 0x40600000000;
  if (MEMORY[0x1E4F14C88])
  {
    voucher_mach_msg_set((mach_msg_header_t *)rcv_name);
    mach_port_name_t special_reply_port = rcv_name[3];
  }
  uint64_t v26 = mach_msg((mach_msg_header_t *)rcv_name, 3162115, v23, 0x3Cu, special_reply_port, 0, 0);
  uint64_t v27 = v26;
  if ((v26 - 268435458) > 0xE || ((1 << (v26 - 2)) & 0x4003) == 0)
  {
    if (!v26)
    {
      if (DWORD1(v31) == 71)
      {
        uint64_t v27 = 4294966988;
      }
      else if (DWORD1(v31) == 1130)
      {
        if ((rcv_name[0] & 0x80000000) == 0)
        {
          if (rcv_name[1] == 52)
          {
            if (!rcv_name[2])
            {
              uint64_t v27 = v32;
              if (!v32)
              {
                *a12 = HIDWORD(v32);
                *a13 = v33;
                *a14 = v34;
                return v27;
              }
              goto LABEL_25;
            }
          }
          else if (rcv_name[1] == 36)
          {
            if (rcv_name[2]) {
              BOOL v28 = 1;
            }
            else {
              BOOL v28 = v32 == 0;
            }
            if (v28) {
              uint64_t v27 = 4294966996;
            }
            else {
              uint64_t v27 = v32;
            }
            goto LABEL_25;
          }
        }
        uint64_t v27 = 4294966996;
      }
      else
      {
        uint64_t v27 = 4294966995;
      }
LABEL_25:
      mach_msg_destroy((mach_msg_header_t *)rcv_name);
      return v27;
    }
    mig_dealloc_special_reply_port();
  }
  return v27;
}

uint64_t sub_1B2FB7434(mach_port_t a1, uint64_t a2, uint64_t a3, int a4)
{
  uint64_t v6 = *MEMORY[0x1E4F14C30];
  uint64_t v7 = a2;
  uint64_t v8 = a3;
  int v9 = a4;
  *(void *)&msg.msgh_bits = 19;
  msg.msgh_voucher_port = 0;
  msg.msgh_id = 1031;
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  if (MEMORY[0x1E4F14C88]) {
    voucher_mach_msg_set(&msg);
  }
  return mach_msg(&msg, 1, 0x34u, 0, 0, 0, 0);
}

uint64_t sub_1B2FB74B4(int a1, int a2, uint64_t a3, void *a4, _DWORD *a5, int a6)
{
  *(_OWORD *)&msg[20] = 0u;
  long long v15 = 0u;
  *(_OWORD *)&msg[4] = 0u;
  *(void *)&msg[24] = *MEMORY[0x1E4F14C30];
  *(_DWORD *)&msg[32] = a2;
  *(void *)&long long v15 = a3;
  int v16 = 0;
  DWORD2(v15) = a6;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  *(_DWORD *)&msg[8] = a1;
  *(_DWORD *)&msg[12] = special_reply_port;
  *(_DWORD *)mach_msg_header_t msg = 5395;
  *(void *)&msg[16] = 0x40800000000;
  if (MEMORY[0x1E4F14C88])
  {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
    mach_port_name_t special_reply_port = *(_DWORD *)&msg[12];
  }
  uint64_t v10 = mach_msg((mach_msg_header_t *)msg, 3162115, 0x30u, 0x38u, special_reply_port, 0, 0);
  uint64_t v11 = v10;
  if ((v10 - 268435458) > 0xE || ((1 << (v10 - 2)) & 0x4003) == 0)
  {
    if (!v10)
    {
      if (*(_DWORD *)&msg[20] == 71)
      {
        uint64_t v11 = 4294966988;
      }
      else if (*(_DWORD *)&msg[20] == 1132)
      {
        if ((*(_DWORD *)msg & 0x80000000) == 0)
        {
          if (*(_DWORD *)&msg[4] == 48)
          {
            if (!*(_DWORD *)&msg[8])
            {
              uint64_t v11 = *(unsigned int *)&msg[32];
              if (!*(_DWORD *)&msg[32])
              {
                *a4 = v15;
                *a5 = DWORD2(v15);
                return v11;
              }
              goto LABEL_22;
            }
          }
          else if (*(_DWORD *)&msg[4] == 36)
          {
            if (*(_DWORD *)&msg[8]) {
              BOOL v12 = 1;
            }
            else {
              BOOL v12 = *(_DWORD *)&msg[32] == 0;
            }
            if (v12) {
              uint64_t v11 = 4294966996;
            }
            else {
              uint64_t v11 = *(unsigned int *)&msg[32];
            }
            goto LABEL_22;
          }
        }
        uint64_t v11 = 4294966996;
      }
      else
      {
        uint64_t v11 = 4294966995;
      }
LABEL_22:
      mach_msg_destroy((mach_msg_header_t *)msg);
      return v11;
    }
    mig_dealloc_special_reply_port();
  }
  return v11;
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1F40CF6D8](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x1F40CFD60]();
}

uint64_t _dispatch_is_fork_of_multithreaded_parent()
{
  return MEMORY[0x1F40CF3D8]();
}

uint64_t _dispatch_is_multithreaded()
{
  return MEMORY[0x1F40CF3E0]();
}

uint64_t _dyld_get_image_uuid()
{
  return MEMORY[0x1F40CF5B8]();
}

uint64_t _dyld_get_shared_cache_range()
{
  return MEMORY[0x1F40CF5C8]();
}

uint64_t _dyld_get_shared_cache_uuid()
{
  return MEMORY[0x1F40CF5D0]();
}

uint64_t _dyld_is_memory_immutable()
{
  return MEMORY[0x1F40CF5E8]();
}

uint64_t _os_alloc_once()
{
  return MEMORY[0x1F40D0718]();
}

uint64_t _os_log_simple()
{
  return MEMORY[0x1F40D0720]();
}

uint64_t _simple_asl_log()
{
  return MEMORY[0x1F40D0798]();
}

uint64_t bootstrap_look_up2()
{
  return MEMORY[0x1F40D0B48]();
}

uint64_t close_NOCANCEL()
{
  return MEMORY[0x1F40CFEF0]();
}

uint64_t creat_NOCANCEL()
{
  return MEMORY[0x1F40CF828]();
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async_f(dispatch_queue_t queue, void *context, dispatch_function_t work)
{
}

dispatch_block_t dispatch_block_create(dispatch_block_flags_t flags, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x1F40CF428](flags, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1F40CF448](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1F40CF488](label, attr);
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

void dispatch_set_context(dispatch_object_t object, void *context)
{
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1F40CF4D8](type, handle, mask, queue);
}

void dispatch_source_set_cancel_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_event_handler_f(dispatch_source_t source, dispatch_function_t handler)
{
}

uint64_t fileport_makeport()
{
  return MEMORY[0x1F40CFF68]();
}

void free(void *a1)
{
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x1F40CF8B8](a1);
}

uid_t geteuid(void)
{
  return MEMORY[0x1F40CFFE0]();
}

pid_t getpid(void)
{
  return MEMORY[0x1F40D0000]();
}

int kill(pid_t a1, int a2)
{
  return MEMORY[0x1F40D00A8](*(void *)&a1, *(void *)&a2);
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1F40D00F8]();
}

mach_msg_return_t mach_msg(mach_msg_header_t *msg, mach_msg_option_t option, mach_msg_size_t send_size, mach_msg_size_t rcv_size, mach_port_name_t rcv_name, mach_msg_timeout_t timeout, mach_port_name_t notify)
{
  return MEMORY[0x1F40D0180](msg, *(void *)&option, *(void *)&send_size, *(void *)&rcv_size, *(void *)&rcv_name, *(void *)&timeout, *(void *)&notify);
}

void mach_msg_destroy(mach_msg_header_t *a1)
{
}

kern_return_t mach_port_allocate(ipc_space_t task, mach_port_right_t right, mach_port_name_t *name)
{
  return MEMORY[0x1F40D0198](*(void *)&task, *(void *)&right, name);
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return MEMORY[0x1F40D01A8](*(void *)&task, *(void *)&name);
}

kern_return_t mach_port_destruct(ipc_space_t task, mach_port_name_t name, mach_port_delta_t srdelta, mach_port_context_t guard)
{
  return MEMORY[0x1F40D01B0](*(void *)&task, *(void *)&name, *(void *)&srdelta, guard);
}

kern_return_t mach_port_insert_right(ipc_space_t task, mach_port_name_t name, mach_port_t poly, mach_msg_type_name_t polyPoly)
{
  return MEMORY[0x1F40D01C0](*(void *)&task, *(void *)&name, *(void *)&poly, *(void *)&polyPoly);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40D0670](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40D0678](size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40D0688](ptr, size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1F40CF920](__dst, __src, __n);
}

uint64_t mig_dealloc_special_reply_port()
{
  return MEMORY[0x1F40D02A0]();
}

uint64_t mig_get_special_reply_port()
{
  return MEMORY[0x1F40D02B0]();
}

int mig_strncpy(char *dest, const char *src, int len)
{
  return MEMORY[0x1F40D02C0](dest, src, *(void *)&len);
}

int mig_strncpy_zerofill(char *dest, const char *src, int len)
{
  return MEMORY[0x1F40D02C8](dest, src, *(void *)&len);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x1F40D02E0](a1, a2, *(void *)&a3, *(void *)&a4, *(void *)&a5, a6);
}

uint64_t os_fault_with_payload()
{
  return MEMORY[0x1F40D0338]();
}

uint64_t os_set_32_ptr_delete()
{
  return MEMORY[0x1F40CFBE0]();
}

uint64_t os_set_32_ptr_find()
{
  return MEMORY[0x1F40CFBE8]();
}

uint64_t os_set_32_ptr_foreach()
{
  return MEMORY[0x1F40CFBF0]();
}

uint64_t os_set_32_ptr_init()
{
  return MEMORY[0x1F40CFBF8]();
}

uint64_t os_set_32_ptr_insert()
{
  return MEMORY[0x1F40CFC00]();
}

uint64_t os_set_64_ptr_delete()
{
  return MEMORY[0x1F40CFC08]();
}

uint64_t os_set_64_ptr_find()
{
  return MEMORY[0x1F40CFC10]();
}

uint64_t os_set_64_ptr_init()
{
  return MEMORY[0x1F40CFC18]();
}

uint64_t os_set_64_ptr_insert()
{
  return MEMORY[0x1F40CFC20]();
}

uint64_t os_set_str_ptr_delete()
{
  return MEMORY[0x1F40CFC28]();
}

uint64_t os_set_str_ptr_find()
{
  return MEMORY[0x1F40CFC30]();
}

uint64_t os_set_str_ptr_init()
{
  return MEMORY[0x1F40CFC38]();
}

uint64_t os_set_str_ptr_insert()
{
  return MEMORY[0x1F40CFC40]();
}

void os_unfair_lock_assert_owner(const os_unfair_lock *lock)
{
}

uint64_t os_unfair_lock_lock_with_options()
{
  return MEMORY[0x1F40D0838]();
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t os_variant_has_internal_diagnostics()
{
  return MEMORY[0x1F40CFC78]();
}

int pipe(int a1[2])
{
  return MEMORY[0x1F40D0350](a1);
}

void *__cdecl reallocf(void *__ptr, size_t __size)
{
  return (void *)MEMORY[0x1F40D06B0](__ptr, __size);
}

int shm_open(const char *a1, int a2, ...)
{
  return MEMORY[0x1F40D0488](a1, *(void *)&a2);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1F40CF9E8](__str, __size, __format);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1F40CFA20](__s1, __s2);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x1F40CFA38](__s1);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1F40CFA60](__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x1F40CFA70](__s1, __s2, __n);
}

char *__cdecl strtok_r(char *__str, const char *__sep, char **__lasts)
{
  return (char *)MEMORY[0x1F40CFAB8](__str, __sep, __lasts);
}

uint64_t usleep_NOCANCEL()
{
  return MEMORY[0x1F40CFB20]();
}

int vasprintf(char **a1, const char *a2, va_list a3)
{
  return MEMORY[0x1F40CFB60](a1, a2, a3);
}

BOOLean_t voucher_mach_msg_set(mach_msg_header_t *msg)
{
  return MEMORY[0x1F40D0558](msg);
}

uint64_t write_NOCANCEL()
{
  return MEMORY[0x1F40D0600]();
}

BOOL xpc_array_apply(xpc_object_t xarray, xpc_array_applier_t applier)
{
  return MEMORY[0x1F40D0B70](xarray, applier);
}

size_t xpc_array_get_count(xpc_object_t xarray)
{
  return MEMORY[0x1F40D0B80](xarray);
}

uint64_t xpc_copy_entitlement_for_token()
{
  return MEMORY[0x1F40D0C58]();
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1F40D0CA0](keys, values, count);
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
}

uint64_t xpc_event_publisher_fire_noboost()
{
  return MEMORY[0x1F40D0D58]();
}

uint64_t xpc_get_service_identifier_for_token()
{
  return MEMORY[0x1F40D0D68]();
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x1F40D0D70](object);
}

void xpc_release(xpc_object_t object)
{
}

size_t xpc_string_get_length(xpc_object_t xstring)
{
  return MEMORY[0x1F40D0DD8](xstring);
}