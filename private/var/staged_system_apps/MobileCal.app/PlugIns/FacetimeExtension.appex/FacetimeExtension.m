void sub_1000027C0(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;

  v5 = a2;
  v6 = a3;
  v7 = [v5 URL];

  if (v7)
  {
    v8 = objc_alloc((Class)EKVirtualConferenceURLDescriptor);
    v9 = +[NSBundle mainBundle];
    v10 = [v9 localizedStringForKey:@"FaceTime" value:&stru_100004278 table:0];
    v11 = [v5 URL];
    v12 = [v8 initWithTitle:v10 URL:v11];

    v13 = objc_alloc((Class)EKVirtualConferenceDescriptor);
    v16 = v12;
    v14 = +[NSArray arrayWithObjects:&v16 count:1];
    v15 = [v13 initWithTitle:0 URLDescriptors:v14 conferenceDetails:0];

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void sub_100002A78(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if (!v5 && (a2 & 1) == 0)
  {
    id v5 = +[NSError errorWithDomain:EKVirtualConferenceProviderErrorDomain code:4 userInfo:0];
  }
  id v6 = v5;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100002BF4(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = v6;
  if (v5 && !v6 && ([v5 isLocallyCreated] & 1) != 0)
  {
    v8 = [a1[4] _conversationManager];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100002D1C;
    v11[3] = &unk_1000041C8;
    id v9 = a1[5];
    id v10 = a1[4];
    id v12 = v9;
    id v13 = v10;
    id v14 = v5;
    id v15 = a1[6];
    [v8 checkLinkValidity:v14 completionHandler:v11];
  }
  else
  {
    (*((void (**)(void))a1[6] + 2))();
  }
}

void sub_100002D1C(uint64_t a1, int a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  id v9 = v8;
  if (!v7 || !a2)
  {
    if (!a2)
    {
      id v10 = v8;
      if (v10) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
LABEL_9:
    id v14 = [*(id *)(a1 + 40) _conversationManager];
    uint64_t v15 = *(void *)(a1 + 32);
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100002F1C;
    v17[3] = &unk_1000041A0;
    uint64_t v16 = *(void *)(a1 + 48);
    id v18 = *(id *)(a1 + 56);
    [v14 renewLink:v16 expirationDate:v15 reason:1 completionHandler:v17];

    id v10 = v18;
    goto LABEL_10;
  }
  if ([v7 compare:*(void *)(a1 + 32)] == (id)-1) {
    goto LABEL_9;
  }
  id v10 = v9;
  if (v10 || (a2 & 1) != 0) {
    goto LABEL_7;
  }
LABEL_6:
  NSErrorUserInfoKey v19 = NSLocalizedDescriptionKey;
  v11 = +[NSBundle mainBundle];
  id v12 = [v11 localizedStringForKey:@"URL is invalid, possibly expired. Unable to renew.", &stru_100004278, 0 value table];
  v20 = v12;
  id v13 = +[NSDictionary dictionaryWithObjects:&v20 forKeys:&v19 count:1];

  id v10 = +[NSError errorWithDomain:EKVirtualConferenceProviderErrorDomain code:5 userInfo:v13];

LABEL_7:
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
LABEL_10:
}

uint64_t sub_100002F1C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_100003030(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100003144(uint64_t a1, void *a2, uint64_t a3)
{
  id v6 = a2;
  if (a3)
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 16), a2);
    [*(id *)(a1 + 32) __findFullLinkForLink:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
  }
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
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

void objc_enumerationMutation(id obj)
{
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_msgSend_FacetimeAppBundleID(void *a1, const char *a2, ...)
{
  return [a1 FacetimeAppBundleID];
}

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return [a1 URL];
}

id objc_msgSend__conversationManager(void *a1, const char *a2, ...)
{
  return [a1 _conversationManager];
}

id objc_msgSend__requiredAppInstalled(void *a1, const char *a2, ...)
{
  return [a1 _requiredAppInstalled];
}

id objc_msgSend__requiredServiceAvailable(void *a1, const char *a2, ...)
{
  return [a1 _requiredServiceAvailable];
}

id objc_msgSend_isLocallyCreated(void *a1, const char *a2, ...)
{
  return [a1 isLocallyCreated];
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return [a1 mainBundle];
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return [a1 set];
}