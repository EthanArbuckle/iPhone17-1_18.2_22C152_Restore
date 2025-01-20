const char *NetworkQualityStages_to_string(unsigned int a1)
{
  if (a1 > 0xB) {
    return "UnknownStage";
  }
  else {
    return off_26439D0E8[a1];
  }
}

void sub_2193029FC(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void sub_2193041F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39)
{
  _Block_object_dispose(&a39, 8);
  _Block_object_dispose((const void *)(v39 - 224), 8);
  _Block_object_dispose((const void *)(v39 - 192), 8);
  _Block_object_dispose((const void *)(v39 - 160), 8);
  _Unwind_Resume(a1);
}

uint64_t __getSymptomReporter_block_invoke()
{
  uint64_t result = symptom_framework_init();
  getSymptomReporter_symptomReporter = result;
  return result;
}

void OUTLINED_FUNCTION_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x1Cu);
}

uint64_t CreateSelfSignedIdentity(void *a1, void **a2, CFArrayRef *a3)
{
  v40[2] = *MEMORY[0x263EF8340];
  id v5 = a1;
  uint64_t v6 = *MEMORY[0x263F16FE0];
  uint64_t v7 = *MEMORY[0x263F16F98];
  v39[0] = *MEMORY[0x263F16FA8];
  v39[1] = v7;
  v40[0] = v6;
  v40[1] = &unk_26CAB1D50;
  CFDictionaryRef v8 = [NSDictionary dictionaryWithObjects:v40 forKeys:v39 count:2];
  RandomKey = SecKeyCreateRandomKey(v8, 0);
  if (RandomKey)
  {
    v10 = RandomKey;
    SecKeyRef v11 = SecKeyCopyPublicKey(RandomKey);
    if (v11)
    {
      SecKeyRef v12 = v11;
      v30 = a3;
      v36[0] = *MEMORY[0x263F17430];
      v36[1] = @"Apple Inc.";
      v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v36 count:2];
      v37 = v13;
      v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v37 count:1];
      v38[0] = v14;
      v34[0] = *MEMORY[0x263F17420];
      v34[1] = v5;
      id v31 = v5;
      v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v34 count:2];
      v35 = v15;
      v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v35 count:1];
      v38[1] = v16;
      v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v38 count:2];

      uint64_t v32 = *MEMORY[0x263F171B0];
      v18 = [NSNumber numberWithUnsignedInt:7];
      v33 = v18;
      v19 = [NSDictionary dictionaryWithObjects:&v33 forKeys:&v32 count:1];

      uint64_t SelfSignedCertificate = SecGenerateSelfSignedCertificate();
      if (SelfSignedCertificate)
      {
        v21 = (const void *)SelfSignedCertificate;
        uint64_t v22 = SecIdentityCreate();
        if (v22)
        {
          v23 = (__SecIdentity *)v22;
          uint64_t v24 = [MEMORY[0x263EFF8C0] arrayWithObject:v21];
          CFArrayRef v25 = *v30;
          CFArrayRef *v30 = (CFArrayRef)v24;

          sec_identity_t v26 = sec_identity_create_with_certificates(v23, *v30);
          v27 = *a2;
          *a2 = v26;

          CFRelease(v23);
          CFRelease(v21);
          uint64_t v28 = 0;
LABEL_18:
          id v5 = v31;
          CFRelease(v12);
          CFRelease(v10);

          goto LABEL_19;
        }
        netqual_log_init();
        if (os_log_type_enabled((os_log_t)os_log_netqual, OS_LOG_TYPE_ERROR)) {
          CreateSelfSignedIdentity_cold_4();
        }
        CFRelease(v21);
      }
      else
      {
        netqual_log_init();
        if (os_log_type_enabled((os_log_t)os_log_netqual, OS_LOG_TYPE_ERROR)) {
          CreateSelfSignedIdentity_cold_3();
        }
      }
      uint64_t v28 = 4294966387;
      goto LABEL_18;
    }
    netqual_log_init();
    if (os_log_type_enabled((os_log_t)os_log_netqual, OS_LOG_TYPE_ERROR)) {
      CreateSelfSignedIdentity_cold_2();
    }
    CFRelease(v10);
  }
  else
  {
    netqual_log_init();
    if (os_log_type_enabled((os_log_t)os_log_netqual, OS_LOG_TYPE_ERROR)) {
      CreateSelfSignedIdentity_cold_1();
    }
  }
  uint64_t v28 = 4294966387;
LABEL_19:

  return v28;
}

const char *nw_connection_client_accurate_ecn_state_to_string(unsigned int a1)
{
  if (a1 > 9) {
    return "ecn_unknown_state";
  }
  else {
    return off_26439D148[a1];
  }
}

const char *nw_interface_type_to_string(unsigned int a1)
{
  if (a1 > 4) {
    return "unknown";
  }
  else {
    return off_26439D198[a1];
  }
}

void OUTLINED_FUNCTION_1_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

void sub_21930BA14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,char a34)
{
  _Block_object_dispose(&a34, 8);
  _Block_object_dispose((const void *)(v34 - 216), 8);
  _Block_object_dispose((const void *)(v34 - 184), 8);
  _Block_object_dispose((const void *)(v34 - 152), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

void sub_21930E144(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41)
{
  _Block_object_dispose(&a33, 8);
  _Block_object_dispose(&a37, 8);
  _Block_object_dispose(&a41, 8);
  _Block_object_dispose((const void *)(v41 - 256), 8);
  _Unwind_Resume(a1);
}

float get_average(void *a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v1 = a1;
  if ([v1 count])
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v2 = v1;
    uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      int v5 = 0;
      uint64_t v6 = *(void *)v12;
      do
      {
        for (uint64_t i = 0; i != v4; ++i)
        {
          if (*(void *)v12 != v6) {
            objc_enumerationMutation(v2);
          }
          v5 += [*(id *)(*((void *)&v11 + 1) + 8 * i) intValue:v11];
        }
        uint64_t v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v4);
      float v8 = (float)v5;
    }
    else
    {
      float v8 = 0.0;
    }

    float v9 = v8 / (float)(unint64_t)[v2 count];
  }
  else
  {
    float v9 = 0.0;
  }

  return v9;
}

void netqual_log_init()
{
  if (netqual_log_init_onceToken != -1) {
    dispatch_once(&netqual_log_init_onceToken, &__block_literal_global_0);
  }
}

uint64_t __netqual_log_init_block_invoke()
{
  os_log_netqual = (uint64_t)os_log_create("com.apple.networkQuality", "netqual");

  return MEMORY[0x270F9A758]();
}

void sub_21930F958(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

__CFString *NetworkQualityNetworkServiceType_ToString(unint64_t a1)
{
  if (a1 > 0xB) {
    return @"unknown";
  }
  else {
    return off_26439D2B0[a1];
  }
}

void sub_219312788(_Unwind_Exception *a1)
{
}

void sub_219314200(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
}

void CreateSelfSignedIdentity_cold_1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_2192FE000, v0, v1, "%s:%u - SecKeyCreateRandomKey failed", v2, v3, v4, v5, v6);
}

void CreateSelfSignedIdentity_cold_2()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_2192FE000, v0, v1, "%s:%u - SecKeyCopyPublicKey failed", v2, v3, v4, v5, v6);
}

void CreateSelfSignedIdentity_cold_3()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_2192FE000, v0, v1, "%s:%u - SecGenerateSelfSignedCertificate() failed", v2, v3, v4, v5, v6);
}

void CreateSelfSignedIdentity_cold_4()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_2192FE000, v0, v1, "%s:%u - SecIdentityCreate() failed", v2, v3, v4, v5, v6);
}

void CFRelease(CFTypeRef cf)
{
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x270EF2C38](aSelector);
}

CFStringRef SCDynamicStoreCopyLocalHostName(SCDynamicStoreRef store)
{
  return (CFStringRef)MEMORY[0x270F054F0](store);
}

uint64_t SecGenerateSelfSignedCertificate()
{
  return MEMORY[0x270EFD940]();
}

uint64_t SecIdentityCreate()
{
  return MEMORY[0x270EFD958]();
}

SecKeyRef SecKeyCopyPublicKey(SecKeyRef key)
{
  return (SecKeyRef)MEMORY[0x270EFD9D8](key);
}

SecKeyRef SecKeyCreateRandomKey(CFDictionaryRef parameters, CFErrorRef *error)
{
  return (SecKeyRef)MEMORY[0x270EFDA40](parameters, error);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFURLRequestSetAllowedProtocolTypes()
{
  return MEMORY[0x270EE2A98]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x270ED85F8](*(void *)&__upper_bound);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_data_t dispatch_data_create(const void *buffer, size_t size, dispatch_queue_t queue, dispatch_block_t destructor)
{
  return (dispatch_data_t)MEMORY[0x270ED92D0](buffer, size, queue, destructor);
}

dispatch_data_t dispatch_data_create_subrange(dispatch_data_t data, size_t offset, size_t length)
{
  return (dispatch_data_t)MEMORY[0x270ED92F0](data, offset, length);
}

size_t dispatch_data_get_size(dispatch_data_t data)
{
  return MEMORY[0x270ED9300](data);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
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

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x270ED9378](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9448](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
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

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

void free(void *a1)
{
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x270EDA498](__b, *(void *)&__c, __len);
}

uint64_t nw_activity_activate()
{
  return MEMORY[0x270EF7998]();
}

uint64_t nw_activity_complete_with_reason()
{
  return MEMORY[0x270EF79A8]();
}

uint64_t nw_activity_create()
{
  return MEMORY[0x270EF79C8]();
}

uint64_t nw_activity_is_complete()
{
  return MEMORY[0x270EF7A18]();
}

uint64_t nw_activity_set_parent_activity()
{
  return MEMORY[0x270EF7A28]();
}

nw_advertise_descriptor_t nw_advertise_descriptor_create_bonjour_service(const char *name, const char *type, const char *domain)
{
  return (nw_advertise_descriptor_t)MEMORY[0x270EF7A40](name, type, domain);
}

uint64_t nw_array_get_count()
{
  return MEMORY[0x270EF7A88]();
}

uint64_t nw_array_get_object_at_index()
{
  return MEMORY[0x270EF7A90]();
}

void nw_connection_cancel(nw_connection_t connection)
{
}

nw_parameters_t nw_connection_copy_parameters(nw_connection_t connection)
{
  return (nw_parameters_t)MEMORY[0x270EF7B88](connection);
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

nw_protocol_metadata_t nw_content_context_copy_protocol_metadata(nw_content_context_t context, nw_protocol_definition_t protocol)
{
  return (nw_protocol_metadata_t)MEMORY[0x270EF7D40](context, protocol);
}

nw_content_context_t nw_content_context_create(const char *context_identifier)
{
  return (nw_content_context_t)MEMORY[0x270EF7D50](context_identifier);
}

void nw_content_context_set_metadata_for_protocol(nw_content_context_t context, nw_protocol_metadata_t protocol_metadata)
{
}

char *__cdecl nw_endpoint_copy_address_string(nw_endpoint_t endpoint)
{
  return (char *)MEMORY[0x270EF7E50](endpoint);
}

char *__cdecl nw_endpoint_copy_port_string(nw_endpoint_t endpoint)
{
  return (char *)MEMORY[0x270EF7E70](endpoint);
}

nw_endpoint_t nw_endpoint_create_bonjour_service(const char *name, const char *type, const char *domain)
{
  return (nw_endpoint_t)MEMORY[0x270EF7E98](name, type, domain);
}

nw_endpoint_t nw_endpoint_create_host(const char *hostname, const char *port)
{
  return (nw_endpoint_t)MEMORY[0x270EF7EB0](hostname, port);
}

const sockaddr *__cdecl nw_endpoint_get_address(nw_endpoint_t endpoint)
{
  return (const sockaddr *)MEMORY[0x270EF7EE8](endpoint);
}

const char *__cdecl nw_endpoint_get_bonjour_service_name(nw_endpoint_t endpoint)
{
  return (const char *)MEMORY[0x270EF7F00](endpoint);
}

const char *__cdecl nw_endpoint_get_hostname(nw_endpoint_t endpoint)
{
  return (const char *)MEMORY[0x270EF7F30](endpoint);
}

uint16_t nw_endpoint_get_port(nw_endpoint_t endpoint)
{
  return MEMORY[0x270EF7F48](endpoint);
}

int nw_error_get_error_code(nw_error_t error)
{
  return MEMORY[0x270EF7FD0](error);
}

nw_error_domain_t nw_error_get_error_domain(nw_error_t error)
{
  return MEMORY[0x270EF7FD8](error);
}

uint64_t nw_establishment_report_enumerate_protocol_l4s_state()
{
  return MEMORY[0x270EF7FE8]();
}

void nw_establishment_report_enumerate_protocols(nw_establishment_report_t report, nw_report_protocol_enumerator_t enumerate_block)
{
}

uint64_t nw_http2_set_idle_timeout()
{
  return MEMORY[0x270EF81E8]();
}

uint64_t nw_http3_set_idle_timeout()
{
  return MEMORY[0x270EF81F8]();
}

uint64_t nw_http_create_metadata_for_response()
{
  return MEMORY[0x270EF8210]();
}

uint64_t nw_http_fields_append()
{
  return MEMORY[0x270EF8228]();
}

uint64_t nw_http_messaging_create_options()
{
  return MEMORY[0x270EF8258]();
}

uint64_t nw_http_metadata_copy_request()
{
  return MEMORY[0x270EF8268]();
}

uint64_t nw_http_request_access_path()
{
  return MEMORY[0x270EF82A8]();
}

uint64_t nw_http_response_create_well_known()
{
  return MEMORY[0x270EF8300]();
}

uint64_t nw_http_response_get_status_code()
{
  return MEMORY[0x270EF8310]();
}

uint64_t nw_http_response_set_status_code()
{
  return MEMORY[0x270EF8328]();
}

uint64_t nw_interface_create_with_name()
{
  return MEMORY[0x270EF8348]();
}

uint64_t nw_interface_get_radio_type()
{
  return MEMORY[0x270EF8390]();
}

nw_interface_type_t nw_interface_get_type(nw_interface_t interface)
{
  return MEMORY[0x270EF83A0](interface);
}

uint64_t nw_interface_radio_type_to_string()
{
  return MEMORY[0x270EF83A8]();
}

void nw_listener_cancel(nw_listener_t listener)
{
}

nw_listener_t nw_listener_create(nw_parameters_t parameters)
{
  return (nw_listener_t)MEMORY[0x270EF8410](parameters);
}

uint64_t nw_listener_create_with_launchd_key()
{
  return MEMORY[0x270EF8418]();
}

nw_listener_t nw_listener_create_with_port(const char *port, nw_parameters_t parameters)
{
  return (nw_listener_t)MEMORY[0x270EF8420](port, parameters);
}

uint16_t nw_listener_get_port(nw_listener_t listener)
{
  return MEMORY[0x270EF8428](listener);
}

void nw_listener_set_advertise_descriptor(nw_listener_t listener, nw_advertise_descriptor_t advertise_descriptor)
{
}

void nw_listener_set_advertised_endpoint_changed_handler(nw_listener_t listener, nw_listener_advertised_endpoint_changed_handler_t handler)
{
}

void nw_listener_set_new_connection_handler(nw_listener_t listener, nw_listener_new_connection_handler_t handler)
{
}

void nw_listener_set_queue(nw_listener_t listener, dispatch_queue_t queue)
{
}

void nw_listener_set_state_changed_handler(nw_listener_t listener, nw_listener_state_changed_handler_t handler)
{
}

void nw_listener_start(nw_listener_t listener)
{
}

nw_protocol_stack_t nw_parameters_copy_default_protocol_stack(nw_parameters_t parameters)
{
  return (nw_protocol_stack_t)MEMORY[0x270EF84F8](parameters);
}

nw_endpoint_t nw_parameters_copy_local_endpoint(nw_parameters_t parameters)
{
  return (nw_endpoint_t)MEMORY[0x270EF8500](parameters);
}

uint64_t nw_parameters_create_quic_stream()
{
  return MEMORY[0x270EF8548]();
}

nw_parameters_t nw_parameters_create_secure_tcp(nw_parameters_configure_protocol_block_t configure_tls, nw_parameters_configure_protocol_block_t configure_tcp)
{
  return (nw_parameters_t)MEMORY[0x270EF8550](configure_tls, configure_tcp);
}

uint64_t nw_parameters_set_attach_protocol_listener()
{
  return MEMORY[0x270EF8600]();
}

uint64_t nw_parameters_set_data_mode()
{
  return MEMORY[0x270EF8620]();
}

uint64_t nw_parameters_set_prohibit_joining_protocols()
{
  return MEMORY[0x270EF8708]();
}

uint64_t nw_parameters_set_receive_any_interface()
{
  return MEMORY[0x270EF8710]();
}

void nw_parameters_set_reuse_local_address(nw_parameters_t parameters, BOOL reuse_local_address)
{
}

uint64_t nw_parameters_set_server_mode()
{
  return MEMORY[0x270EF8738]();
}

uint64_t nw_parameters_set_traffic_class()
{
  return MEMORY[0x270EF8770]();
}

uint64_t nw_protocol_copy_http_definition()
{
  return MEMORY[0x270EF8B38]();
}

uint64_t nw_protocol_copy_quic_connection_definition()
{
  return MEMORY[0x270EF8B50]();
}

nw_protocol_definition_t nw_protocol_copy_tcp_definition(void)
{
  return (nw_protocol_definition_t)MEMORY[0x270EF8B70]();
}

nw_protocol_definition_t nw_protocol_copy_tls_definition(void)
{
  return (nw_protocol_definition_t)MEMORY[0x270EF8B78]();
}

BOOL nw_protocol_definition_is_equal(nw_protocol_definition_t definition1, nw_protocol_definition_t definition2)
{
  return MEMORY[0x270EF8BC8](definition1, definition2);
}

void nw_protocol_stack_prepend_application_protocol(nw_protocol_stack_t stack, nw_protocol_options_t protocol)
{
}

uint64_t nw_quic_connection_copy_sec_protocol_options()
{
  return MEMORY[0x270EF90E8]();
}

uint64_t nw_quic_connection_set_enable_l4s()
{
  return MEMORY[0x270EF9280]();
}

uint64_t nw_resolver_cancel()
{
  return MEMORY[0x270EF93A8]();
}

uint64_t nw_resolver_create_with_endpoint()
{
  return MEMORY[0x270EF9478]();
}

uint64_t nw_resolver_set_update_handler()
{
  return MEMORY[0x270EF9498]();
}

uint64_t nw_tcp_options_set_enable_l4s()
{
  return MEMORY[0x270EF9590]();
}

sec_protocol_options_t nw_tls_copy_sec_protocol_options(nw_protocol_options_t options)
{
  return (sec_protocol_options_t)MEMORY[0x270EF95D0](options);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x270F9A598](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
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

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x270F9A678](self, _cmd, offset, atomic);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
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

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x270F9AA18](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x270F9AA20](obj);
}

void objc_terminate(void)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

sec_identity_t sec_identity_create_with_certificates(SecIdentityRef identity, CFArrayRef certificates)
{
  return (sec_identity_t)MEMORY[0x270EFDEA0](identity, certificates);
}

void sec_protocol_options_add_tls_application_protocol(sec_protocol_options_t options, const char *application_protocol)
{
}

void sec_protocol_options_append_tls_ciphersuite_group(sec_protocol_options_t options, tls_ciphersuite_group_t group)
{
}

void sec_protocol_options_set_local_identity(sec_protocol_options_t options, sec_identity_t identity)
{
}

void sec_protocol_options_set_peer_authentication_required(sec_protocol_options_t options, BOOL peer_authentication_required)
{
}

uint64_t symptom_framework_init()
{
  return MEMORY[0x270EDB780]();
}

uint64_t symptom_new()
{
  return MEMORY[0x270EDB788]();
}

uint64_t symptom_send()
{
  return MEMORY[0x270EDB798]();
}

uint64_t symptom_set_additional_qualifier()
{
  return MEMORY[0x270EDB7A0]();
}