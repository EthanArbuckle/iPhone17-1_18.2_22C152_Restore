id sub_10000212C()
{
  void *v0;
  uint64_t vars8;

  if (qword_100008720 != -1) {
    dispatch_once(&qword_100008720, &stru_1000041C8);
  }
  v0 = (void *)qword_100008718;

  return v0;
}

void sub_100002180(id a1)
{
  qword_100008718 = (uint64_t)os_log_create("com.apple.tv.TVIntents", "Default");

  _objc_release_x1();
}

void sub_1000022FC(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = objc_alloc_init((Class)NSMutableDictionary);
    [v4 setObject:&__kCFBooleanTrue forKey:FBSOpenApplicationOptionKeyPromptUnlockDevice];
    v5 = +[LSApplicationWorkspace defaultWorkspace];
    id v15 = 0;
    unsigned int v6 = [v5 openURL:v3 withOptions:v4 error:&v15];
    id v7 = v15;

    uint64_t v8 = *(void *)(a1 + 32);
    id v9 = objc_alloc((Class)INPlayMediaIntentResponse);
    if (v6)
    {
      id v10 = [v9 initWithCode:4 userActivity:0];
      (*(void (**)(uint64_t, id))(v8 + 16))(v8, v10);

      v11 = sub_10000212C();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_100002C60();
      }
    }
    else
    {
      id v14 = [v9 initWithCode:6 userActivity:0];
      (*(void (**)(uint64_t, id))(v8 + 16))(v8, v14);

      v11 = sub_10000212C();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_100002C94(v7);
      }
    }
  }
  else
  {
    uint64_t v12 = *(void *)(a1 + 32);
    id v13 = [objc_alloc((Class)INPlayMediaIntentResponse) initWithCode:6 userActivity:0];
    (*(void (**)(uint64_t, id))(v12 + 16))(v12, v13);
  }
}

void sub_1000025CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1000025EC(uint64_t a1)
{
  uint64_t v1 = a1;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = [WeakRetained response];
  id v4 = v3;
  if (!v3)
  {
    (*(void (**)(void))(*(void *)(v1 + 40) + 16))();
    v37 = sub_10000212C();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
      sub_100002D18();
    }
    goto LABEL_54;
  }
  id v50 = WeakRetained;
  v51 = v3;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  id obj = [v3 items];
  id v5 = [obj countByEnumeratingWithState:&v54 objects:v58 count:16];
  if (!v5)
  {
LABEL_50:

    id WeakRetained = v50;
LABEL_51:
    (*(void (**)(void))(*(void *)(v1 + 40) + 16))();
    v37 = sub_10000212C();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
      sub_100002D4C();
    }
    goto LABEL_53;
  }
  id v6 = v5;
  uint64_t v7 = *(void *)v55;
  uint64_t v52 = v1;
LABEL_4:
  uint64_t v8 = 0;
  while (1)
  {
    if (*(void *)v55 != v7) {
      objc_enumerationMutation(obj);
    }
    id v9 = *(void **)(*((void *)&v54 + 1) + 8 * v8);
    id v10 = [v9 movieOrShowContent];
    id v11 = [v10 contentType];

    if (v11 == (id)4)
    {
      v18 = [v9 movieOrShowContent];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {

        goto LABEL_22;
      }
      v19 = *(void **)(v1 + 32);
      id v20 = v18;
      v21 = [v19 mediaContainer];
      v22 = [v21 identifier];
      v23 = [v20 canonicalShowID];

      unsigned __int8 v24 = [v22 isEqualToString:v23];
      if ((v24 & 1) == 0) {
        goto LABEL_22;
      }
    }
    else if (v11 == (id)2)
    {
      v25 = [*(id *)(v1 + 32) mediaContainer];
      v26 = [v25 identifier];
      v27 = [v9 movieOrShowContent];
      v28 = [v27 canonicalID];
      unsigned int v29 = [v26 isEqualToString:v28];

      if (!v29) {
        goto LABEL_22;
      }
    }
    else
    {
      if (v11 != (id)1) {
        goto LABEL_22;
      }
      uint64_t v12 = [*(id *)(v1 + 32) mediaItems];
      id v13 = [v12 firstObject];
      id v14 = [v13 identifier];
      id v15 = [v9 movieOrShowContent];
      v16 = [v15 canonicalID];
      unsigned __int8 v17 = [v14 isEqualToString:v16];

      uint64_t v1 = v52;
      if ((v17 & 1) == 0) {
        goto LABEL_22;
      }
    }
    v30 = [v9 playable];
    uint64_t v31 = [v30 playPunchoutURL];
    if (v31)
    {
      v32 = (void *)v31;
      goto LABEL_30;
    }
    v32 = [v9 playable];
    v33 = [v32 openPunchoutURL];
    if (v33) {
      goto LABEL_29;
    }
    v34 = [v9 playable];
    v35 = [v34 tvAppDeeplinkURL];
    if (v35) {
      break;
    }
    v36 = [v9 contentTVAppDeeplinkURL];

    uint64_t v1 = v52;
    if (v36) {
      goto LABEL_31;
    }
LABEL_22:
    if (v6 == (id)++v8)
    {
      id v6 = [obj countByEnumeratingWithState:&v54 objects:v58 count:16];
      if (v6) {
        goto LABEL_4;
      }
      goto LABEL_50;
    }
  }

  uint64_t v1 = v52;
LABEL_29:

LABEL_30:
LABEL_31:
  v38 = [v9 playable];
  v39 = [v38 playPunchoutURL];

  v40 = [v9 playable];
  v41 = [v40 tvAppDeeplinkURL];

  if (!v41)
  {
    v45 = [v9 playable];
    if ([v45 isEntitled])
    {
      v46 = [v9 playable];
      if ([v46 isAppInstalled])
      {
        id v47 = [v39 length];

        if (v47)
        {
          v37 = +[NSURL URLWithString:v39];
          v44 = sub_10000212C();
          if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR)) {
            sub_100002E38();
          }
LABEL_44:
          id WeakRetained = v50;
          goto LABEL_45;
        }
LABEL_41:
        v48 = [v9 contentTVAppDeeplinkURL];

        if (!v48)
        {

          goto LABEL_50;
        }
        v37 = [v9 contentTVAppDeeplinkURL];
        v44 = sub_10000212C();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR)) {
          sub_100002DB4(v37);
        }
        goto LABEL_44;
      }
    }
    goto LABEL_41;
  }
  v42 = [v9 playable];
  v43 = [v42 tvAppDeeplinkURL];
  v37 = +[WLKPlayableUtilities _punchoutURLForDirectPlayback:v43 ignoreExtras:1];

  v44 = sub_10000212C();
  id WeakRetained = v50;
  if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR)) {
    sub_100002EAC(v37);
  }
LABEL_45:

  if (!v37) {
    goto LABEL_51;
  }
  (*(void (**)(void))(*(void *)(v1 + 40) + 16))();
  v49 = sub_10000212C();
  if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR)) {
    sub_100002D80();
  }

LABEL_53:
  id v4 = v51;
LABEL_54:
}

void sub_100002BD8(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_100002BF4(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_100002C2C()
{
  sub_100002C14();
  sub_100002BD8((void *)&_mh_execute_header, v0, v1, "confirmPlayMedia - success", v2, v3, v4, v5, v6);
}

void sub_100002C60()
{
  sub_100002C14();
  sub_100002BD8((void *)&_mh_execute_header, v0, v1, "handlePlayMedia - success", v2, v3, v4, v5, v6);
}

void sub_100002C94(void *a1)
{
  uint64_t v1 = [a1 localizedDescription];
  sub_100002C20();
  sub_100002BF4((void *)&_mh_execute_header, v2, v3, "handlePlayMedia - failure: %@", v4, v5, v6, v7, v8);
}

void sub_100002D18()
{
  sub_100002C14();
  sub_100002BD8((void *)&_mh_execute_header, v0, v1, "buildPlayUrlForIntent - failure - no response", v2, v3, v4, v5, v6);
}

void sub_100002D4C()
{
  sub_100002C14();
  sub_100002BD8((void *)&_mh_execute_header, v0, v1, "buildPlayUrlForIntent - failure - no play url", v2, v3, v4, v5, v6);
}

void sub_100002D80()
{
  sub_100002C14();
  sub_100002BD8((void *)&_mh_execute_header, v0, v1, "buildPlayUrlForIntent - success", v2, v3, v4, v5, v6);
}

void sub_100002DB4(void *a1)
{
  uint64_t v1 = [a1 absoluteString];
  sub_100002C20();
  sub_100002BF4((void *)&_mh_execute_header, v2, v3, "buildPlayUrlForIntent - fall back to content's url _playUrlString: %@", v4, v5, v6, v7, v8);
}

void sub_100002E38()
{
  sub_100002C20();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "buildPlayUrlForIntent - 3rd party _playUrlString: %@", v1, 0xCu);
}

void sub_100002EAC(void *a1)
{
  uint64_t v1 = [a1 absoluteString];
  sub_100002C20();
  sub_100002BF4((void *)&_mh_execute_header, v2, v3, "buildPlayUrlForIntent - 1st party _playUrlString: %@", v4, v5, v6, v7, v8);
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
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

void objc_enumerationMutation(id obj)
{
}

id objc_initWeak(id *location, id val)
{
  return _objc_initWeak(location, val);
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return [a1 absoluteString];
}

id objc_msgSend_canonicalID(void *a1, const char *a2, ...)
{
  return [a1 canonicalID];
}

id objc_msgSend_canonicalShowID(void *a1, const char *a2, ...)
{
  return [a1 canonicalShowID];
}

id objc_msgSend_contentTVAppDeeplinkURL(void *a1, const char *a2, ...)
{
  return [a1 contentTVAppDeeplinkURL];
}

id objc_msgSend_contentType(void *a1, const char *a2, ...)
{
  return [a1 contentType];
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return [a1 defaultWorkspace];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_isAppInstalled(void *a1, const char *a2, ...)
{
  return [a1 isAppInstalled];
}

id objc_msgSend_isEntitled(void *a1, const char *a2, ...)
{
  return [a1 isEntitled];
}

id objc_msgSend_items(void *a1, const char *a2, ...)
{
  return [a1 items];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return [a1 localizedDescription];
}

id objc_msgSend_mediaContainer(void *a1, const char *a2, ...)
{
  return [a1 mediaContainer];
}

id objc_msgSend_mediaItems(void *a1, const char *a2, ...)
{
  return [a1 mediaItems];
}

id objc_msgSend_movieOrShowContent(void *a1, const char *a2, ...)
{
  return [a1 movieOrShowContent];
}

id objc_msgSend_openPunchoutURL(void *a1, const char *a2, ...)
{
  return [a1 openPunchoutURL];
}

id objc_msgSend_playPunchoutURL(void *a1, const char *a2, ...)
{
  return [a1 playPunchoutURL];
}

id objc_msgSend_playable(void *a1, const char *a2, ...)
{
  return [a1 playable];
}

id objc_msgSend_response(void *a1, const char *a2, ...)
{
  return [a1 response];
}

id objc_msgSend_tvAppDeeplinkURL(void *a1, const char *a2, ...)
{
  return [a1 tvAppDeeplinkURL];
}

id objc_msgSend_wlkDefaultQueue(void *a1, const char *a2, ...)
{
  return [a1 wlkDefaultQueue];
}