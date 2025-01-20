@interface JSAKeychainStorage
+ (id)sharedInstance;
- (JSAKeychainStorage)init;
- (id)getItem:(id)a3;
- (void)getItemAsync:(id)a3 :(id)a4;
- (void)removeItem:(id)a3;
- (void)removeItemAsync:(id)a3 :(id)a4;
- (void)setItem:(id)a3 :(id)a4;
- (void)setItemAsync:(id)a3 :(id)a4 :(id)a5;
@end

@implementation JSAKeychainStorage

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_B800;
  block[3] = &unk_B2510;
  block[4] = a1;
  if (qword_CE300 != -1) {
    dispatch_once(&qword_CE300, block);
  }
  v2 = (void *)qword_CE308;

  return v2;
}

- (JSAKeychainStorage)init
{
  v7.receiver = self;
  v7.super_class = (Class)JSAKeychainStorage;
  v2 = [(JSAKeychainStorage *)&v7 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("JSAKeychainStorage.accessQueue", v3);
    accessQueue = v2->_accessQueue;
    v2->_accessQueue = (OS_dispatch_queue *)v4;
  }
  return v2;
}

- (id)getItem:(id)a3
{
  if (a3)
  {
    v3 = sub_B9AC((uint64_t)self, a3);
    [v3 setValue:kCFBooleanTrue forKey:kSecReturnData];
    [v3 setValue:kCFBooleanTrue forKey:kSecReturnAttributes];
    CFTypeRef result = 0;
    id v4 = 0;
    if (!SecItemCopyMatching((CFDictionaryRef)v3, &result))
    {
      v5 = (void *)result;
      v6 = [(id)result objectForKeyedSubscript:kSecValueData];
      id v4 = [objc_alloc((Class)NSString) initWithData:v6 encoding:4];
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (void)getItemAsync:(id)a3 :(id)a4
{
  id v6 = a3;
  id v7 = a4;
  accessQueue = self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_BB3C;
  block[3] = &unk_B2560;
  block[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_block_t v11 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_USER_INTERACTIVE, 0, block);
  dispatch_async(accessQueue, v11);
}

- (void)setItem:(id)a3 :(id)a4
{
  if (a3 && a4)
  {
    id v6 = a4;
    id v7 = sub_B9AC((uint64_t)self, a3);
    v8 = [v6 dataUsingEncoding:4];

    CFTypeRef v9 = 0;
    if (SecItemCopyMatching((CFDictionaryRef)v7, &v9))
    {
      [v7 setValue:v8 forKey:kSecValueData];
      SecItemAdd((CFDictionaryRef)v7, 0);
    }
    else
    {
      CFStringRef v10 = kSecValueData;
      dispatch_block_t v11 = v8;
      SecItemUpdate((CFDictionaryRef)v7, (CFDictionaryRef)+[NSDictionary dictionaryWithObjects:&v11 forKeys:&v10 count:1]);
    }
  }
}

- (void)setItemAsync:(id)a3 :(id)a4 :(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  accessQueue = self->_accessQueue;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_BE40;
  v16[3] = &unk_B2588;
  v16[4] = self;
  id v17 = v8;
  id v18 = v9;
  id v19 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_block_t v15 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_USER_INTERACTIVE, 0, v16);
  dispatch_async(accessQueue, v15);
}

- (void)removeItem:(id)a3
{
  if (a3)
  {
    sub_B9AC((uint64_t)self, a3);
    CFDictionaryRef v3 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    CFTypeRef result = 0;
    if (!SecItemCopyMatching(v3, &result)) {
      SecItemDelete(v3);
    }
  }
}

- (void)removeItemAsync:(id)a3 :(id)a4
{
  id v6 = a3;
  id v7 = a4;
  accessQueue = self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_BFEC;
  block[3] = &unk_B2560;
  block[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_block_t v11 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_USER_INITIATED, 0, block);
  dispatch_async(accessQueue, v11);
}

- (void).cxx_destruct
{
}

@end