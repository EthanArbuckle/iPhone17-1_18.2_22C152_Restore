@interface SESKeychainWrapper
+ (id)sharedInstance;
+ (void)setInterposedWrapper:(id)a3;
- (BOOL)copyItemData:(id)a3 outData:(id *)a4 updateToApplePayView:(BOOL)a5 error:(id *)a6;
- (BOOL)copyMultipleItemData:(id)a3 outDatas:(id *)a4 error:(id *)a5;
- (BOOL)updateToApplePayView:(id)a3 error:(id *)a4;
- (SESKeychainWrapper)init;
- (id)otCliqueForAltDSID:(id)a3;
- (int)addItem:(id)a3;
- (int)deleteItem:(id)a3;
- (os_state_data_s)dumpState;
- (void)addKeychainItem:(id)a3 completion:(id)a4;
- (void)addLocalSEPeerIdentity:(id)a3 altDSID:(id)a4 completion:(id)a5;
- (void)canSyncSEKeys:(id)a3;
- (void)copyKeychainItemData:(id)a3 updateToApplePayView:(BOOL)a4 completion:(id)a5;
- (void)copyMultipleKeychainItemData:(id)a3 completion:(id)a4;
- (void)deleteKeychainItem:(id)a3 completion:(id)a4;
- (void)deleteSEView:(id)a3 altDSID:(id)a4 completion:(id)a5;
- (void)fetchCachedContentForSEView:(id)a3 altDSID:(id)a4 completion:(id)a5;
- (void)getSEPeerIdentityInfo:(id)a3 withCompletion:(id)a4;
- (void)modifyTLKSharesForView:(id)a3 altDSID:(id)a4 addingShares:(id)a5 removingShares:(id)a6 completion:(id)a7;
- (void)proposeRolledTLKForView:(id)a3 oldTLKRecord:(id)a4 newTLKRecord:(id)a5 newTLKSelfShare:(id)a6 altDSID:(id)a7 completion:(id)a8;
- (void)proposeTLKForView:(id)a3 record:(id)a4 selfShare:(id)a5 altDSID:(id)a6 completion:(id)a7;
- (void)removeLocalSEPeerIdentity:(id)a3 altDSID:(id)a4 completion:(id)a5;
- (void)syncContentsForSEView:(id)a3 altDSID:(id)a4 completion:(id)a5;
- (void)updateKeychainItemToApplePayView:(id)a3 completion:(id)a4;
@end

@implementation SESKeychainWrapper

+ (id)sharedInstance
{
  if (qword_10045CC70 != -1) {
    dispatch_once(&qword_10045CC70, &stru_10040BE58);
  }
  v2 = (void *)qword_10045CC68;

  return v2;
}

+ (void)setInterposedWrapper:(id)a3
{
  id v6 = a3;
  id v3 = +[SESKeychainWrapper sharedInstance];
  if (v6) {
    id v4 = v6;
  }
  else {
    id v4 = (id)objc_opt_new();
  }
  v5 = (void *)qword_10045CC68;
  qword_10045CC68 = (uint64_t)v4;
}

- (SESKeychainWrapper)init
{
  v11.receiver = self;
  v11.super_class = (Class)SESKeychainWrapper;
  v2 = [(SESKeychainWrapper *)&v11 init];
  if (v2)
  {
    id v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v4 = dispatch_queue_attr_make_with_qos_class(v3, (dispatch_qos_class_t)0x16u, 0);

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.seserviced.keychainwrapper", v4);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

    uint64_t v7 = objc_opt_new();
    lastRetrievedViewInformation = v2->_lastRetrievedViewInformation;
    v2->_lastRetrievedViewInformation = (NSMutableDictionary *)v7;

    v10 = v2;
    os_state_add_handler();
  }
  return v2;
}

- (void)canSyncSEKeys:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000110D0;
  v7[3] = &unk_10040BE80;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)getSEPeerIdentityInfo:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100011430;
  block[3] = &unk_10040BEE8;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

- (void)addLocalSEPeerIdentity:(id)a3 altDSID:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  queue = self->_queue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000117E4;
  v15[3] = &unk_10040B988;
  v15[4] = self;
  id v16 = v9;
  id v17 = v8;
  id v18 = v10;
  id v12 = v10;
  id v13 = v8;
  id v14 = v9;
  dispatch_async(queue, v15);
}

- (void)removeLocalSEPeerIdentity:(id)a3 altDSID:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  queue = self->_queue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100011998;
  v15[3] = &unk_10040B988;
  v15[4] = self;
  id v16 = v9;
  id v17 = v8;
  id v18 = v10;
  id v12 = v10;
  id v13 = v8;
  id v14 = v9;
  dispatch_async(queue, v15);
}

- (void)fetchCachedContentForSEView:(id)a3 altDSID:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100011B18;
  block[3] = &unk_10040BFB8;
  id v13 = v7;
  id v14 = v8;
  block[4] = self;
  id v10 = v7;
  id v11 = v8;
  dispatch_async(queue, block);
}

- (void)modifyTLKSharesForView:(id)a3 altDSID:(id)a4 addingShares:(id)a5 removingShares:(id)a6 completion:(id)a7
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  queue = self->_queue;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100012018;
  v20[3] = &unk_10040C068;
  id v21 = v12;
  id v22 = v13;
  id v23 = v11;
  id v24 = v14;
  id v16 = v11;
  id v17 = v13;
  id v18 = v12;
  id v19 = v14;
  dispatch_async(queue, v20);
}

- (void)proposeTLKForView:(id)a3 record:(id)a4 selfShare:(id)a5 altDSID:(id)a6 completion:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a7;
  queue = self->_queue;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_1000122C8;
  v20[3] = &unk_10040C068;
  id v21 = v11;
  id v22 = v12;
  id v23 = v13;
  id v24 = v14;
  id v16 = v13;
  id v17 = v12;
  id v18 = v11;
  id v19 = v14;
  dispatch_async(queue, v20);
}

- (void)syncContentsForSEView:(id)a3 altDSID:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  queue = self->_queue;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10001256C;
  v12[3] = &unk_10040C0B8;
  id v13 = v7;
  id v14 = v8;
  id v10 = v7;
  id v11 = v8;
  dispatch_async(queue, v12);
}

- (void)deleteSEView:(id)a3 altDSID:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = SESDefaultLogObject();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    id v17 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Deleting SE view %@", buf, 0xCu);
  }

  queue = self->_queue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000128E8;
  v13[3] = &unk_10040C0B8;
  id v14 = v7;
  id v15 = v8;
  id v11 = v7;
  id v12 = v8;
  dispatch_async(queue, v13);
}

- (void)proposeRolledTLKForView:(id)a3 oldTLKRecord:(id)a4 newTLKRecord:(id)a5 newTLKSelfShare:(id)a6 altDSID:(id)a7 completion:(id)a8
{
  id v9 = a8;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100012BC0;
  block[3] = &unk_10040C108;
  id v13 = v9;
  id v11 = v9;
  dispatch_async(queue, block);
}

- (int)addItem:(id)a3
{
  CFDictionaryRef v3 = (const __CFDictionary *)a3;
  OSStatus v4 = SecItemAdd(v3, 0);
  dispatch_queue_t v5 = SESDefaultLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v7[0] = 67109378;
    v7[1] = v4;
    __int16 v8 = 2112;
    CFDictionaryRef v9 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "SecItemAdd %d - %@", (uint8_t *)v7, 0x12u);
  }

  return v4;
}

- (int)deleteItem:(id)a3
{
  return SecItemDelete((CFDictionaryRef)a3);
}

- (BOOL)copyItemData:(id)a3 outData:(id *)a4 updateToApplePayView:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  id v9 = a3;
  id v10 = [v9 mutableCopy];
  [v10 setObject:&__kCFBooleanTrue forKeyedSubscript:kSecReturnData];
  [v10 setObject:&__kCFBooleanTrue forKeyedSubscript:kSecReturnAttributes];
  CFTypeRef result = 0;
  OSStatus v11 = SecItemCopyMatching((CFDictionaryRef)v10, &result);
  id v12 = SESDefaultLogObject();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)v25 = v11;
    *(_WORD *)&v25[4] = 2112;
    *(void *)&v25[6] = v10;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "SecItemCopyMatching %d : %@", buf, 0x12u);
  }

  if (v11 != -25300)
  {
    if (v11 || (id v14 = (void *)result) == 0)
    {
      if (!a6)
      {
        BOOL v13 = 0;
        goto LABEL_22;
      }
      id v14 = SESDefaultLogObject();
      id v19 = SESCreateAndLogError();
      BOOL v13 = 0;
    }
    else
    {
      if (v7)
      {
        id v15 = [(id)result objectForKeyedSubscript:kSecAttrSyncViewHint];
        uint64_t v16 = kSecAttrViewHintApplePay;
        unsigned int v17 = [v15 isEqualToString:kSecAttrViewHintApplePay];
        if (v17)
        {
          OSStatus v18 = 0;
        }
        else
        {
          CFStringRef v28 = kSecAttrSyncViewHint;
          uint64_t v29 = v16;
          CFDictionaryRef v20 = +[NSDictionary dictionaryWithObjects:&v29 forKeys:&v28 count:1];
          OSStatus v18 = SecItemUpdate((CFDictionaryRef)v9, v20);
        }
        id v21 = SESDefaultLogObject();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412802;
          *(void *)v25 = result;
          *(_WORD *)&v25[8] = 1024;
          *(_DWORD *)&v25[10] = v17 ^ 1;
          __int16 v26 = 1024;
          OSStatus v27 = v18;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "Item %@ upgrade needed %d status %d", buf, 0x18u);
        }
      }
      if (!a4)
      {
        BOOL v13 = 1;
        goto LABEL_21;
      }
      id v19 = [v14 objectForKeyedSubscript:kSecValueData];
      BOOL v13 = 1;
      a6 = a4;
    }
    *a6 = v19;
LABEL_21:

    goto LABEL_22;
  }
  BOOL v13 = 1;
LABEL_22:

  return v13;
}

- (BOOL)copyMultipleItemData:(id)a3 outDatas:(id *)a4 error:(id *)a5
{
  id v7 = [a3 mutableCopy];
  [v7 setObject:&__kCFBooleanTrue forKeyedSubscript:kSecReturnData];
  [v7 setObject:kSecMatchLimitAll forKeyedSubscript:kSecMatchLimit];
  CFTypeRef result = 0;
  OSStatus v8 = SecItemCopyMatching((CFDictionaryRef)v7, &result);
  if (v8 == -25300)
  {
    if (a4)
    {
      *a4 = +[NSArray array];
    }
LABEL_9:
    LOBYTE(a5) = 1;
    goto LABEL_10;
  }
  if (!v8)
  {
    id v9 = (void *)result;
    if (result)
    {
      if (a4) {
        *a4 = (id) (id) result;
      }

      goto LABEL_9;
    }
  }
  if (a5)
  {
    OSStatus v11 = SESDefaultLogObject();
    SESCreateAndLogError();
    *a5 = (id)objc_claimAutoreleasedReturnValue();

    LOBYTE(a5) = 0;
  }
LABEL_10:

  return (char)a5;
}

- (BOOL)updateToApplePayView:(id)a3 error:(id *)a4
{
  return [(SESKeychainWrapper *)self copyItemData:a3 outData:0 updateToApplePayView:1 error:a4];
}

- (void)addKeychainItem:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000131FC;
  block[3] = &unk_10040BEE8;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

- (void)copyKeychainItemData:(id)a3 updateToApplePayView:(BOOL)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  queue = self->_queue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000133A4;
  v13[3] = &unk_10040C130;
  void v13[4] = self;
  id v14 = v8;
  BOOL v16 = a4;
  id v15 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(queue, v13);
}

- (void)copyMultipleKeychainItemData:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000134EC;
  block[3] = &unk_10040BEE8;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

- (void)deleteKeychainItem:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100013630;
  block[3] = &unk_10040BEE8;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

- (void)updateKeychainItemToApplePayView:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000137D0;
  block[3] = &unk_10040BEE8;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

- (id)otCliqueForAltDSID:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)OTConfigurationContext);
  [v4 setContext:OTDefaultContext];
  dispatch_queue_t v5 = +[NSString stringWithAsciiData:v3];

  [v4 setAltDSID:v5];
  id v6 = [objc_alloc((Class)OTClique) initWithContextData:v4];

  return v6;
}

- (os_state_data_s)dumpState
{
  id v3 = objc_opt_new();
  id v4 = v3;
  lastEnabledDSID = self->_lastEnabledDSID;
  if (lastEnabledDSID) {
    [v3 setObject:lastEnabledDSID forKeyedSubscript:@"_lastEnabledDSID"];
  }
  lastLocalPeerIdentifier = self->_lastLocalPeerIdentifier;
  if (lastLocalPeerIdentifier)
  {
    id v7 = [(NSData *)lastLocalPeerIdentifier asHexString];
    [v4 setObject:v7 forKeyedSubscript:@"_lastLocalPeerIdentifier"];
  }
  lastTrustedPeerIdentities = self->_lastTrustedPeerIdentities;
  if (lastTrustedPeerIdentities)
  {
    id v9 = [(NSArray *)lastTrustedPeerIdentities ses_map:&stru_10040C170];
    [v4 setObject:v9 forKeyedSubscript:@"_lastTrustedPeers"];
  }
  lastRetrievedViewInformation = self->_lastRetrievedViewInformation;
  if (lastRetrievedViewInformation)
  {
    id v11 = [(NSMutableDictionary *)lastRetrievedViewInformation allValues];
    id v12 = [v11 ses_map:&stru_10040C1B0];
    [v4 setObject:v12 forKeyedSubscript:@"_lastViewInformation"];
  }
  id v13 = (os_state_data_s *)sub_1000190DC((uint64_t)"keychainwrapper", (uint64_t)v4);

  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastTrustedPeerIdentities, 0);
  objc_storeStrong((id *)&self->_lastLocalPeerIdentifier, 0);
  objc_storeStrong((id *)&self->_lastRetrievedViewInformation, 0);
  objc_storeStrong((id *)&self->_lastEnabledDSID, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end