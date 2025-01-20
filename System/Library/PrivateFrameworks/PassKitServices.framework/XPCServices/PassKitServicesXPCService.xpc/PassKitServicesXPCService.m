int main(int argc, const char **argv, const char **envp)
{
  ServiceDelegate *v3;
  void *v4;

  v3 = objc_alloc_init(ServiceDelegate);
  v4 = +[NSXPCListener serviceListener];
  [v4 setDelegate:v3];
  [v4 resume];

  return 0;
}

void sub_100002FD0(uint64_t a1, void *a2)
{
  v3 = a2;
  v5 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = [*(id *)(a1 + 32) identifier];
    int v9 = 138412546;
    v10 = v3;
    __int16 v11 = 2112;
    v12 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Returning %@ for transaction %@.", (uint8_t *)&v9, 0x16u);
  }
  uint64_t v7 = *(void *)(a1 + 40);
  if (v3)
  {
    v8 = UIImagePNGRepresentation(v3);
    (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v8);
  }
  else
  {
    (*(void (**)(uint64_t, void))(v7 + 16))(v7, 0);
  }
}

void sub_1000031F8(uint64_t a1)
{
  v3 = +[PKPassLibrary sharedInstance];
  v4 = [v3 passWithUniqueID:*(void *)(a1 + 32)];

  if (v4)
  {
    v5 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = [v4 uniqueID];
      int v12 = 138412290;
      v13 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Getting snapshopt for pass %@", (uint8_t *)&v12, 0xCu);
    }
    id v7 = [objc_alloc((Class)PKPassView) initWithPass:v4 content:4 suppressedContent:2039];
    objc_msgSend(v7, "snapshotOfFrontFaceWithRequestedSize:", *(double *)(a1 + 48), *(double *)(a1 + 56));
    v8 = (UIImage *)objc_claimAutoreleasedReturnValue();
    int v9 = v8;
    uint64_t v10 = *(void *)(a1 + 40);
    if (v8)
    {
      __int16 v11 = UIImagePNGRepresentation(v8);
      (*(void (**)(uint64_t, void *))(v10 + 16))(v10, v11);
    }
    else
    {
      (*(void (**)(uint64_t, void))(v10 + 16))(v10, 0);
    }
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void sub_10000346C(uint64_t a1)
{
  PKPeerPaymentRecurringPaymentMemoImage();
  v2 = (UIImage *)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = *(void *)(a1 + 40);
  v5 = v2;
  if (v2)
  {
    v4 = UIImagePNGRepresentation(v2);
    (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v4);
  }
  else
  {
    (*(void (**)(uint64_t, void))(v3 + 16))(v3, 0);
  }
}

uint64_t PKLogFacilityTypeGetObject()
{
  return _PKLogFacilityTypeGetObject();
}

uint64_t PKPeerPaymentRecurringPaymentMemoImage()
{
  return _PKPeerPaymentRecurringPaymentMemoImage();
}

uint64_t PKScreenScale()
{
  return _PKScreenScale();
}

NSData *__cdecl UIImagePNGRepresentation(UIImage *image)
{
  return _UIImagePNGRepresentation(image);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
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

{
}

{
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_release(id a1)
{
}

void objc_storeStrong(id *location, id obj)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_serviceListener(void *a1, const char *a2, ...)
{
  return [a1 serviceListener];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_uniqueID(void *a1, const char *a2, ...)
{
  return [a1 uniqueID];
}