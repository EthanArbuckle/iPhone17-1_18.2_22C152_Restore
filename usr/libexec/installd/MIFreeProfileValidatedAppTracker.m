@interface MIFreeProfileValidatedAppTracker
+ (id)sharedTracker;
- (BOOL)_onQueue_addAppIdentifierIfCachedOnContainer:(id)a3 error:(id *)a4;
- (BOOL)_onQueue_addReferenceForApplicationIdentifier:(id)a3 bundle:(id)a4 error:(id *)a5;
- (BOOL)_onQueue_discoverReferencesWithError:(id *)a3;
- (BOOL)_onQueue_removeReferenceForBundle:(id)a3 error:(id *)a4;
- (BOOL)addReferenceForApplicationIdentifier:(id)a3 bundle:(id)a4 error:(id *)a5;
- (BOOL)removeReferenceForBundle:(id)a3 error:(id *)a4;
- (MIFreeProfileValidatedAppTracker)init;
- (NSMutableSet)refs;
- (OS_dispatch_queue)q;
- (void)invalidateCache;
- (void)setRefs:(id)a3;
@end

@implementation MIFreeProfileValidatedAppTracker

+ (id)sharedTracker
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003B3C0;
  block[3] = &unk_10008CC28;
  block[4] = a1;
  if (qword_1000A6048 != -1) {
    dispatch_once(&qword_1000A6048, block);
  }
  v2 = (void *)qword_1000A6040;

  return v2;
}

- (MIFreeProfileValidatedAppTracker)init
{
  v8.receiver = self;
  v8.super_class = (Class)MIFreeProfileValidatedAppTracker;
  v2 = [(MIFreeProfileValidatedAppTracker *)&v8 init];
  if (v2
    && (dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM),
        v3 = objc_claimAutoreleasedReturnValue(),
        dispatch_queue_t v4 = dispatch_queue_create("com.apple.installd.MIFreeProfileValidatedAppTracker", v3),
        q = v2->_q,
        v2->_q = (OS_dispatch_queue *)v4,
        q,
        v3,
        !v2->_q))
  {
    if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3) {
      MOLogWrite();
    }
    v6 = 0;
  }
  else
  {
    v6 = v2;
  }

  return v6;
}

- (void)invalidateCache
{
  v3 = [(MIFreeProfileValidatedAppTracker *)self q];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003B554;
  block[3] = &unk_10008CC50;
  block[4] = self;
  dispatch_sync(v3, block);
}

- (BOOL)_onQueue_addAppIdentifierIfCachedOnContainer:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = sub_10003B6F0;
  v20 = sub_10003B700;
  id v21 = 0;
  v7 = [v6 containerURL];
  objc_super v8 = +[MIFileManager defaultManager];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10003B708;
  v15[3] = &unk_10008D898;
  v15[4] = self;
  v15[5] = &v16;
  v9 = [v8 enumerateURLsForItemsInDirectoryAtURL:v7 ignoreSymlinks:1 withBlock:v15];

  v10 = (void *)v17[5];
  if (v10 || (v10 = v9) != 0)
  {
    id v11 = v10;
    id v12 = v11;
    if (a4)
    {
      id v12 = v11;
      BOOL v13 = 0;
      *a4 = v12;
    }
    else
    {
      BOOL v13 = 0;
    }
  }
  else
  {
    id v12 = 0;
    BOOL v13 = 1;
  }

  _Block_object_dispose(&v16, 8);
  return v13;
}

- (BOOL)_onQueue_discoverReferencesWithError:(id *)a3
{
  v5 = [(MIFreeProfileValidatedAppTracker *)self q];
  dispatch_assert_queue_V2(v5);

  id v6 = objc_opt_new();
  [(MIFreeProfileValidatedAppTracker *)self setRefs:v6];

  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000;
  uint64_t v18 = sub_10003B6F0;
  v19 = sub_10003B700;
  id v20 = 0;
  v7 = +[MIGlobalConfiguration sharedInstance];
  objc_super v8 = [v7 primaryPersonaString];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10003BA18;
  v14[3] = &unk_10008D8C0;
  v14[4] = self;
  v14[5] = &v15;
  v9 = +[MIMCMContainer enumerateContainersWithClass:1 forPersona:v8 isTransient:0 identifiers:0 groupIdentifiers:0 usingBlock:v14];

  v10 = (void *)v16[5];
  if (v10)
  {
    id v11 = v10;

    BOOL v12 = 0;
    v9 = v11;
    if (!a3) {
      goto LABEL_7;
    }
  }
  else
  {
    BOOL v12 = v9 == 0;
    if (!a3) {
      goto LABEL_7;
    }
  }
  if (!v12) {
    *a3 = v9;
  }
LABEL_7:

  _Block_object_dispose(&v15, 8);
  return v12;
}

- (BOOL)_onQueue_addReferenceForApplicationIdentifier:(id)a3 bundle:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = [(MIFreeProfileValidatedAppTracker *)self q];
  dispatch_assert_queue_V2(v10);

  id v11 = +[MIFileManager defaultManager];
  if (([v9 isPlaceholder] & 1) != 0 || objc_msgSend(v9, "bundleType") != 4)
  {
    id v14 = 0;
    goto LABEL_6;
  }
  BOOL v12 = [(MIFreeProfileValidatedAppTracker *)self refs];
  if (v12)
  {

    id v13 = 0;
  }
  else
  {
    id v32 = 0;
    unsigned __int8 v17 = [(MIFreeProfileValidatedAppTracker *)self _onQueue_discoverReferencesWithError:&v32];
    id v13 = v32;
    id v14 = v13;
    if ((v17 & 1) == 0) {
      goto LABEL_17;
    }
  }
  uint64_t v18 = [(MIFreeProfileValidatedAppTracker *)self refs];
  if ((unint64_t)[v18 count] <= 2)
  {

    goto LABEL_13;
  }
  v19 = [(MIFreeProfileValidatedAppTracker *)self refs];
  unsigned __int8 v20 = [v19 containsObject:v8];

  if (v20)
  {
LABEL_13:
    v26 = [v9 bundleURL];
    id v31 = v13;
    unsigned __int8 v27 = [v11 setValidatedByFreeProfileAppIdentifier:v8 insecurelyCachedOnBundle:v26 error:&v31];
    id v14 = v31;

    if ((v27 & 1) == 0)
    {
      v29 = (void *)MIInstallerErrorDomain;
      v22 = [v9 bundleURL];
      v23 = [v22 path];
      uint64_t v25 = sub_100014A08((uint64_t)"-[MIFreeProfileValidatedAppTracker _onQueue_addReferenceForApplicationIdentifier:bundle:error:]", 176, v29, 4, v14, 0, @"Failed to set app identifier (%@) for %@", v30, (uint64_t)v8);
      id v13 = v14;
      goto LABEL_16;
    }
    v28 = [(MIFreeProfileValidatedAppTracker *)self refs];
    [v28 addObject:v8];

LABEL_6:
    BOOL v15 = 1;
    goto LABEL_7;
  }
  id v21 = (void *)MIInstallerErrorDomain;
  v33[0] = @"LegacyErrorString";
  v33[1] = MILibMISErrorNumberKey;
  v34[0] = @"ApplicationVerificationFailed";
  v34[1] = &off_100096FE8;
  v22 = +[NSDictionary dictionaryWithObjects:v34 forKeys:v33 count:2];
  v23 = [(MIFreeProfileValidatedAppTracker *)self refs];
  uint64_t v25 = sub_100014A08((uint64_t)"-[MIFreeProfileValidatedAppTracker _onQueue_addReferenceForApplicationIdentifier:bundle:error:]", 171, v21, 13, 0, v22, @"This device has reached the maximum number of installed apps using a free developer profile: %@", v24, (uint64_t)v23);
LABEL_16:

  id v14 = (id)v25;
LABEL_17:
  if (a5)
  {
    id v14 = v14;
    BOOL v15 = 0;
    *a5 = v14;
  }
  else
  {
    BOOL v15 = 0;
  }
LABEL_7:

  return v15;
}

- (BOOL)addReferenceForApplicationIdentifier:(id)a3 bundle:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x2020000000;
  char v30 = 0;
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x3032000000;
  uint64_t v24 = sub_10003B6F0;
  uint64_t v25 = sub_10003B700;
  id v26 = 0;
  v10 = [(MIFreeProfileValidatedAppTracker *)self q];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003BF64;
  block[3] = &unk_10008D688;
  v19 = &v27;
  block[4] = self;
  id v11 = v8;
  id v17 = v11;
  id v12 = v9;
  id v18 = v12;
  unsigned __int8 v20 = &v21;
  dispatch_sync(v10, block);

  int v13 = *((unsigned __int8 *)v28 + 24);
  if (a5 && !*((unsigned char *)v28 + 24))
  {
    *a5 = (id) v22[5];
    int v13 = *((unsigned __int8 *)v28 + 24);
  }
  BOOL v14 = v13 != 0;

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);

  return v14;
}

- (BOOL)_onQueue_removeReferenceForBundle:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (([v6 isPlaceholder] & 1) != 0 || objc_msgSend(v6, "bundleType") != 4) {
    goto LABEL_12;
  }
  v7 = +[MIFileManager defaultManager];
  id v8 = [v6 bundleURL];
  id v25 = 0;
  id v9 = [v7 insecureCachedAppIdentifierIfValidatedByFreeProfileForBundle:v8 error:&v25];
  id v10 = v25;

  if (v9)
  {
    id v11 = (char *)[v9 rangeOfString:@"."];
    if (v11 == (char *)0x7FFFFFFFFFFFFFFFLL || (int v13 = v11 + 1, v11 + 1 >= [v9 length]))
    {
      sub_100014A08((uint64_t)"-[MIFreeProfileValidatedAppTracker _onQueue_removeReferenceForBundle:error:]", 229, MIInstallerErrorDomain, 4, 0, 0, @"Cached app identifier contains invalid data (%@)", v12, (uint64_t)v9);
      BOOL v14 = 0;
      id v18 = v10;
      id v10 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      BOOL v14 = [v9 substringFromIndex:v13];
      BOOL v15 = [v6 identifier];
      unsigned __int8 v16 = [v14 isEqualToString:v15];

      if (v16)
      {
        id v17 = [(MIFreeProfileValidatedAppTracker *)self refs];
        [v17 removeObject:v9];

        MIUninstallProfilesForAppIdentifier();
LABEL_13:
        BOOL v20 = 1;
        goto LABEL_14;
      }
      v22 = (void *)MIInstallerErrorDomain;
      id v18 = [v6 identifier];
      uint64_t v24 = sub_100014A08((uint64_t)"-[MIFreeProfileValidatedAppTracker _onQueue_removeReferenceForBundle:error:]", 234, v22, 4, 0, 0, @"Cached bundle identifier (%@) does not match bundle identifier (%@)", v23, (uint64_t)v14);

      id v10 = (id)v24;
    }
    goto LABEL_18;
  }
  id v18 = [v10 domain];
  if ([v18 isEqualToString:NSPOSIXErrorDomain])
  {
    id v19 = [v10 code];

    if (v19 != (id)93)
    {
      BOOL v14 = 0;
      goto LABEL_19;
    }

LABEL_12:
    id v9 = 0;
    BOOL v14 = 0;
    id v10 = 0;
    goto LABEL_13;
  }
  BOOL v14 = 0;
LABEL_18:

LABEL_19:
  if (a4)
  {
    id v10 = v10;
    BOOL v20 = 0;
    *a4 = v10;
  }
  else
  {
    BOOL v20 = 0;
  }
LABEL_14:

  return v20;
}

- (BOOL)removeReferenceForBundle:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x2020000000;
  char v25 = 0;
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000;
  id v19 = sub_10003B6F0;
  BOOL v20 = sub_10003B700;
  id v21 = 0;
  v7 = [(MIFreeProfileValidatedAppTracker *)self q];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10003C3F4;
  v12[3] = &unk_10008CF10;
  BOOL v14 = &v22;
  v12[4] = self;
  id v8 = v6;
  id v13 = v8;
  BOOL v15 = &v16;
  dispatch_sync(v7, v12);

  int v9 = *((unsigned __int8 *)v23 + 24);
  if (a4 && !*((unsigned char *)v23 + 24))
  {
    *a4 = (id) v17[5];
    int v9 = *((unsigned __int8 *)v23 + 24);
  }
  BOOL v10 = v9 != 0;

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);

  return v10;
}

- (NSMutableSet)refs
{
  return self->_refs;
}

- (void)setRefs:(id)a3
{
}

- (OS_dispatch_queue)q
{
  return self->_q;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_q, 0);

  objc_storeStrong((id *)&self->_refs, 0);
}

@end