@interface NRParametersPhoneCallRelay
- (NRParametersPhoneCallRelay)initWithLocalPort:(id)a3;
@end

@implementation NRParametersPhoneCallRelay

- (NRParametersPhoneCallRelay)initWithLocalPort:(id)a3
{
  uint64_t v76 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    legacy_tcp_socket = nw_parameters_create_legacy_tcp_socket();
    if (!legacy_tcp_socket)
    {
      if (nrCopyLogObj_onceToken_2425 != -1) {
        dispatch_once(&nrCopyLogObj_onceToken_2425, &__block_literal_global_2426);
      }
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2427, OS_LOG_TYPE_FAULT))
      {
        _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2427, 17, (uint64_t)"nw_parameters_create_legacy_tcp_socket failed", v5, v6, v7, v8, v9, v74);
        v29 = 0;
      }
      else
      {
        v29 = 0;
      }
      goto LABEL_20;
    }
    nw_parameters_set_indefinite();
    v11 = nw_parameters_copy_default_protocol_stack(legacy_tcp_socket);
    options = nw_udp_create_options();
    nw_protocol_stack_set_transport_protocol(v11, options);

    nw_parameters_set_data_mode();
    nw_endpoint_t host = nw_endpoint_create_host("::", (const char *)[v4 UTF8String]);
    MEMORY[0x210512130](legacy_tcp_socket, host);
    xpc_object_t v14 = xpc_string_create("com.apple.networkrelay");
    if (v14)
    {
      v15 = v14;
      xpc_object_t v16 = xpc_string_create("PhoneCallRelayAgent");
      if (v16)
      {
        v17 = v16;
        xpc_object_t v18 = xpc_array_create(0, 0);
        if (v18)
        {
          v19 = v18;
          xpc_array_append_value(v18, v15);
          xpc_object_t v20 = xpc_array_create(0, 0);
          if (v20)
          {
            v21 = v20;
            xpc_array_append_value(v20, v17);
            nw_parameters_set_required_netagent_classes();
            nw_parameters_set_reuse_local_address(legacy_tcp_socket, 1);
            nw_parameters_set_no_proxy();
            v75.receiver = self;
            v75.super_class = (Class)NRParametersPhoneCallRelay;
            v22 = [(NRParameters *)&v75 initWithParameters:legacy_tcp_socket];
            self = v22;
            if (v22)
            {
              [(NRParameters *)v22 setServiceClass:3];
              v28 = self;
            }
            else
            {
              if (nrCopyLogObj_onceToken_2425 != -1) {
                dispatch_once(&nrCopyLogObj_onceToken_2425, &__block_literal_global_2426);
              }
              if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2427, OS_LOG_TYPE_FAULT)) {
                _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2427, 17, (uint64_t)"[super initWithParameters:] failed", v23, v24, v25, v26, v27, v74);
              }
            }

            v29 = self;
LABEL_20:

            goto LABEL_21;
          }
          v42 = nrCopyLogObj_2421();
          v43 = v42;
          if (sNRCopyLogToStdErr)
          {
          }
          else
          {
            BOOL v44 = os_log_type_enabled(v42, OS_LOG_TYPE_ERROR);

            if (!v44) {
              goto LABEL_49;
            }
          }
        }
        else
        {
          v39 = nrCopyLogObj_2421();
          v40 = v39;
          if (sNRCopyLogToStdErr)
          {
          }
          else
          {
            BOOL v41 = os_log_type_enabled(v39, OS_LOG_TYPE_ERROR);

            if (!v41) {
              goto LABEL_49;
            }
          }
        }
        id v66 = nrCopyLogObj_2421();
        _NRLogWithArgs((uint64_t)v66, 16, (uint64_t)"%s%.30s:%-4d ABORTING: xpc_array_create(%p, %u) failed", v67, v68, v69, v70, v71, (uint64_t)"");

LABEL_49:
        _os_log_pack_size();
        MEMORY[0x270FA5388]();
        __error();
        uint64_t v72 = _os_log_pack_fill();
        __os_log_helper_1_2_3_8_34_8_0_4_0(v72, (uint64_t)"nr_xpc_array_create");
LABEL_50:
        id v73 = nrCopyLogObj_2421();
        _NRLogAbortWithPack(v73);
      }
      v36 = nrCopyLogObj_2421();
      v37 = v36;
      if (sNRCopyLogToStdErr)
      {
      }
      else
      {
        BOOL v38 = os_log_type_enabled(v36, OS_LOG_TYPE_ERROR);

        if (!v38) {
          goto LABEL_44;
        }
      }
      id v59 = nrCopyLogObj_2421();
      _NRLogWithArgs((uint64_t)v59, 16, (uint64_t)"%s%.30s:%-4d ABORTING: xpc_string_create(%s) failed", v60, v61, v62, v63, v64, (uint64_t)"");

LABEL_44:
      _os_log_pack_size();
      MEMORY[0x270FA5388]();
      __error();
      uint64_t v65 = _os_log_pack_fill();
      *(_DWORD *)uint64_t v65 = 136446466;
      *(void *)(v65 + 4) = "nr_xpc_string_create";
      *(_WORD *)(v65 + 12) = 2080;
      *(void *)(v65 + 14) = "PhoneCallRelayAgent";
      goto LABEL_50;
    }
    v33 = nrCopyLogObj_2421();
    v34 = v33;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v35 = os_log_type_enabled(v33, OS_LOG_TYPE_ERROR);

      if (!v35) {
        goto LABEL_41;
      }
    }
    id v52 = nrCopyLogObj_2421();
    _NRLogWithArgs((uint64_t)v52, 16, (uint64_t)"%s%.30s:%-4d ABORTING: xpc_string_create(%s) failed", v53, v54, v55, v56, v57, (uint64_t)"");

LABEL_41:
    _os_log_pack_size();
    MEMORY[0x270FA5388]();
    __error();
    uint64_t v58 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v58 = 136446466;
    *(void *)(v58 + 4) = "nr_xpc_string_create";
    *(_WORD *)(v58 + 12) = 2080;
    *(void *)(v58 + 14) = "com.apple.networkrelay";
    goto LABEL_50;
  }
  v31 = nrCopyLogObj_2421();
  v32 = v31;
  if (sNRCopyLogToStdErr)
  {
  }
  else
  {
    BOOL v45 = os_log_type_enabled(v31, OS_LOG_TYPE_FAULT);

    if (!v45)
    {
      v29 = 0;
      goto LABEL_21;
    }
  }
  id v46 = nrCopyLogObj_2421();
  _NRLogWithArgs((uint64_t)v46, 17, (uint64_t)"%s called with null localPortString", v47, v48, v49, v50, v51, (uint64_t)"-[NRParametersPhoneCallRelay initWithLocalPort:]");

  v29 = 0;
LABEL_21:

  return v29;
}

@end