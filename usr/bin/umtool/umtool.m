void sub_100005320(id a1)
{
  uint64_t v1;
  void *v2;
  void v3[8];

  v3[0] = @"uid";
  v3[1] = @"alternateDSID";
  v3[2] = @"username";
  v3[3] = @"givenName";
  v3[4] = @"familyName";
  v3[5] = @"displayName";
  v3[6] = @"photoURL";
  v3[7] = @"userAuxiliaryString";
  v1 = +[NSArray arrayWithObjects:v3 count:8];
  v2 = (void *)qword_100010BF8;
  qword_100010BF8 = v1;
}

void sub_1000054D0(id a1)
{
  v3[0] = @"personastring";
  v3[1] = @"personatype";
  v3[2] = @"bundleid";
  v3[3] = @"imagepath";
  v3[4] = @"puid";
  v3[5] = @"ptestcount";
  uint64_t v1 = +[NSArray arrayWithObjects:v3 count:6];
  v2 = (void *)qword_100010C08;
  qword_100010C08 = v1;
}

uint64_t start()
{
  +[UMTestPrint println];
  uint64_t v1 = objc_opt_class();
  id v7 = 0;
  unsigned __int8 v2 = [v1 executeWithOutError:&v7];
  id v3 = v7;
  v4 = v3;
  if ((v2 & 1) == 0)
  {
    if (v3) {
      [v3 localizedDescription];
    }
    else {
    v5 = [v1 helpDetailsForDepth:0];
    }
    +[UMTestPrint println:@"%@", v5];
  }
  +[UMTestPrint println];

  return 0;
}

void sub_100006D90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,char a49)
{
}

uint64_t sub_100006DE8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100006DF8(uint64_t a1)
{
}

void sub_100006E00(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

id sub_1000075A4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v7 = *(id *)(a1 + 32);
  id v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v18;
LABEL_3:
    uint64_t v11 = 0;
    while (1)
    {
      if (*(void *)v18 != v10) {
        objc_enumerationMutation(v7);
      }
      uint64_t v12 = *(void *)(*((void *)&v17 + 1) + 8 * v11);
      v13 = [v5 objectForKeyedSubscript:v12];
      v14 = [v6 objectForKeyedSubscript:v12];
      id v15 = [v13 compare:v14 options:64];

      if (v15) {
        break;
      }
      if (v9 == (id)++v11)
      {
        id v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v9) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    id v15 = 0;
  }

  return v15;
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
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

void free(void *a1)
{
}

kern_return_t host_get_multiuser_config_flags(host_t host, uint32_t *multiuser_flags)
{
  return _host_get_multiuser_config_flags(host, multiuser_flags);
}

uint64_t kpersona_find_by_type()
{
  return _kpersona_find_by_type();
}

uint64_t kpersona_getpath()
{
  return _kpersona_getpath();
}

uint64_t kpersona_info()
{
  return _kpersona_info();
}

mach_port_t mach_host_self(void)
{
  return _mach_host_self();
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
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

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_enumerationMutation(id obj)
{
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

void objc_release(id a1)
{
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

void objc_storeStrong(id *location, id obj)
{
}

uint64_t os_variant_has_internal_diagnostics()
{
  return _os_variant_has_internal_diagnostics();
}

int printf(const char *a1, ...)
{
  return _printf(a1);
}

int putchar(int a1)
{
  return _putchar(a1);
}

int puts(const char *a1)
{
  return _puts(a1);
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend__passcodeIndex(void *a1, const char *a2, ...)
{
  return [a1 _passcodeIndex];
}

id objc_msgSend__personaAttributes(void *a1, const char *a2, ...)
{
  return [a1 _personaAttributes];
}

id objc_msgSend__printDivider(void *a1, const char *a2, ...)
{
  return [a1 _printDivider];
}

id objc_msgSend__userAttributes(void *a1, const char *a2, ...)
{
  return [a1 _userAttributes];
}

id objc_msgSend_allUsers(void *a1, const char *a2, ...)
{
  return [a1 allUsers];
}

id objc_msgSend_allUsersUnfiltered(void *a1, const char *a2, ...)
{
  return [a1 allUsersUnfiltered];
}

id objc_msgSend_alternateDSID(void *a1, const char *a2, ...)
{
  return [a1 alternateDSID];
}

id objc_msgSend_arguments(void *a1, const char *a2, ...)
{
  return [a1 arguments];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_creationDate(void *a1, const char *a2, ...)
{
  return [a1 creationDate];
}

id objc_msgSend_dataQuota(void *a1, const char *a2, ...)
{
  return [a1 dataQuota];
}

id objc_msgSend_dataUsed(void *a1, const char *a2, ...)
{
  return [a1 dataUsed];
}

id objc_msgSend_debugErrorCausingLogout(void *a1, const char *a2, ...)
{
  return [a1 debugErrorCausingLogout];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_diskNode(void *a1, const char *a2, ...)
{
  return [a1 diskNode];
}

id objc_msgSend_displayName(void *a1, const char *a2, ...)
{
  return [a1 displayName];
}

id objc_msgSend_examples(void *a1, const char *a2, ...)
{
  return [a1 examples];
}

id objc_msgSend_familyName(void *a1, const char *a2, ...)
{
  return [a1 familyName];
}

id objc_msgSend_fileInfoPath(void *a1, const char *a2, ...)
{
  return [a1 fileInfoPath];
}

id objc_msgSend_firstLoginEndDate(void *a1, const char *a2, ...)
{
  return [a1 firstLoginEndDate];
}

id objc_msgSend_firstLoginStartDate(void *a1, const char *a2, ...)
{
  return [a1 firstLoginStartDate];
}

id objc_msgSend_firstName(void *a1, const char *a2, ...)
{
  return [a1 firstName];
}

id objc_msgSend_getLayoutAttributes(void *a1, const char *a2, ...)
{
  return [a1 getLayoutAttributes];
}

id objc_msgSend_getNextArgument(void *a1, const char *a2, ...)
{
  return [a1 getNextArgument];
}

id objc_msgSend_getPersonaAttributes(void *a1, const char *a2, ...)
{
  return [a1 getPersonaAttributes];
}

id objc_msgSend_getProvisionAttributes(void *a1, const char *a2, ...)
{
  return [a1 getProvisionAttributes];
}

id objc_msgSend_getUser(void *a1, const char *a2, ...)
{
  return [a1 getUser];
}

id objc_msgSend_getUserAttributes(void *a1, const char *a2, ...)
{
  return [a1 getUserAttributes];
}

id objc_msgSend_gid(void *a1, const char *a2, ...)
{
  return [a1 gid];
}

id objc_msgSend_givenName(void *a1, const char *a2, ...)
{
  return [a1 givenName];
}

id objc_msgSend_goToPreviousArgument(void *a1, const char *a2, ...)
{
  return [a1 goToPreviousArgument];
}

id objc_msgSend_gracePeriod(void *a1, const char *a2, ...)
{
  return [a1 gracePeriod];
}

id objc_msgSend_hasDataToSync(void *a1, const char *a2, ...)
{
  return [a1 hasDataToSync];
}

id objc_msgSend_homeDirPath(void *a1, const char *a2, ...)
{
  return [a1 homeDirPath];
}

id objc_msgSend_homeDirectoryURL(void *a1, const char *a2, ...)
{
  return [a1 homeDirectoryURL];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_isAdminUser(void *a1, const char *a2, ...)
{
  return [a1 isAdminUser];
}

id objc_msgSend_isAuditor(void *a1, const char *a2, ...)
{
  return [a1 isAuditor];
}

id objc_msgSend_isDataSeparatedPersona(void *a1, const char *a2, ...)
{
  return [a1 isDataSeparatedPersona];
}

id objc_msgSend_isDefaultPersona(void *a1, const char *a2, ...)
{
  return [a1 isDefaultPersona];
}

id objc_msgSend_isDisabled(void *a1, const char *a2, ...)
{
  return [a1 isDisabled];
}

id objc_msgSend_isEnterprisePersona(void *a1, const char *a2, ...)
{
  return [a1 isEnterprisePersona];
}

id objc_msgSend_isLoginUser(void *a1, const char *a2, ...)
{
  return [a1 isLoginUser];
}

id objc_msgSend_isPersonalPersona(void *a1, const char *a2, ...)
{
  return [a1 isPersonalPersona];
}

id objc_msgSend_isPrimaryUser(void *a1, const char *a2, ...)
{
  return [a1 isPrimaryUser];
}

id objc_msgSend_isSystemPersona(void *a1, const char *a2, ...)
{
  return [a1 isSystemPersona];
}

id objc_msgSend_isTransientUser(void *a1, const char *a2, ...)
{
  return [a1 isTransientUser];
}

id objc_msgSend_isUniversalPersona(void *a1, const char *a2, ...)
{
  return [a1 isUniversalPersona];
}

id objc_msgSend_languages(void *a1, const char *a2, ...)
{
  return [a1 languages];
}

id objc_msgSend_lastCachedLoginEndDate(void *a1, const char *a2, ...)
{
  return [a1 lastCachedLoginEndDate];
}

id objc_msgSend_lastCachedLoginStartDate(void *a1, const char *a2, ...)
{
  return [a1 lastCachedLoginStartDate];
}

id objc_msgSend_lastLoginDate(void *a1, const char *a2, ...)
{
  return [a1 lastLoginDate];
}

id objc_msgSend_lastName(void *a1, const char *a2, ...)
{
  return [a1 lastName];
}

id objc_msgSend_lastRemoteAuthDate(void *a1, const char *a2, ...)
{
  return [a1 lastRemoteAuthDate];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_libInfoPath(void *a1, const char *a2, ...)
{
  return [a1 libInfoPath];
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return [a1 localizedDescription];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_passcodeLockGracePeriod(void *a1, const char *a2, ...)
{
  return [a1 passcodeLockGracePeriod];
}

id objc_msgSend_passcodeType(void *a1, const char *a2, ...)
{
  return [a1 passcodeType];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_personaLayoutPathURL(void *a1, const char *a2, ...)
{
  return [a1 personaLayoutPathURL];
}

id objc_msgSend_photoURL(void *a1, const char *a2, ...)
{
  return [a1 photoURL];
}

id objc_msgSend_println(void *a1, const char *a2, ...)
{
  return [a1 println];
}

id objc_msgSend_processInfo(void *a1, const char *a2, ...)
{
  return [a1 processInfo];
}

id objc_msgSend_sharedManager(void *a1, const char *a2, ...)
{
  return [a1 sharedManager];
}

id objc_msgSend_subcommands(void *a1, const char *a2, ...)
{
  return [a1 subcommands];
}

id objc_msgSend_uid(void *a1, const char *a2, ...)
{
  return [a1 uid];
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntValue];
}

id objc_msgSend_userAuxiliaryString(void *a1, const char *a2, ...)
{
  return [a1 userAuxiliaryString];
}

id objc_msgSend_userPersonaBundleIDList(void *a1, const char *a2, ...)
{
  return [a1 userPersonaBundleIDList];
}

id objc_msgSend_userPersonaDisplayName(void *a1, const char *a2, ...)
{
  return [a1 userPersonaDisplayName];
}

id objc_msgSend_userPersonaNickName(void *a1, const char *a2, ...)
{
  return [a1 userPersonaNickName];
}

id objc_msgSend_userPersonaType(void *a1, const char *a2, ...)
{
  return [a1 userPersonaType];
}

id objc_msgSend_userPersonaUniqueString(void *a1, const char *a2, ...)
{
  return [a1 userPersonaUniqueString];
}

id objc_msgSend_userType(void *a1, const char *a2, ...)
{
  return [a1 userType];
}

id objc_msgSend_userUUID(void *a1, const char *a2, ...)
{
  return [a1 userUUID];
}

id objc_msgSend_username(void *a1, const char *a2, ...)
{
  return [a1 username];
}

id objc_msgSend_volumeUUID(void *a1, const char *a2, ...)
{
  return [a1 volumeUUID];
}