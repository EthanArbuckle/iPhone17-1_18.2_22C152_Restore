@interface SPRMeta
+ (SPRMeta)current;
- (NSBundle)bundle;
- (NSDate)buildDate;
- (NSString)bundleIdentifier;
- (NSString)bundleVersion;
- (SPRMeta)initWithBundle:(id)a3 timestamp:(id)a4;
- (id)description;
@end

@implementation SPRMeta

+ (SPRMeta)current
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_2212510C0;
  block[3] = &unk_26459CB98;
  block[4] = a1;
  if (qword_26AD43400 != -1) {
    dispatch_once(&qword_26AD43400, block);
  }
  v2 = (void *)qword_26AD433F8;
  return (SPRMeta *)v2;
}

- (NSString)bundleIdentifier
{
  return (NSString *)((uint64_t (*)(NSBundle *, char *, __CFString *))MEMORY[0x270F9A6D0])(self->_bundle, sel_objectForInfoDictionaryKey_, @"CFBundleIdentifier");
}

- (NSString)bundleVersion
{
  return (NSString *)((uint64_t (*)(NSBundle *, char *, __CFString *))MEMORY[0x270F9A6D0])(self->_bundle, sel_objectForInfoDictionaryKey_, @"CFBundleVersion");
}

- (NSDate)buildDate
{
  v3 = objc_opt_new();
  objc_msgSend_setDateFormat_(v3, v4, @"EEE MMM dd HH:mm:ss yyyy", v5, v6, v7);
  v12 = objc_msgSend_dateFromString_(v3, v8, (uint64_t)self->_timestamp, v9, v10, v11);

  return (NSDate *)v12;
}

- (id)description
{
  uint64_t v7 = NSString;
  v8 = objc_msgSend_bundleIdentifier(self, a2, v2, v3, v4, v5);
  v14 = objc_msgSend_bundleVersion(self, v9, v10, v11, v12, v13);
  v20 = objc_msgSend_buildDate(self, v15, v16, v17, v18, v19);
  v25 = objc_msgSend_stringWithFormat_(v7, v21, @"SPRMeta(bundleIdentifier: %@, bundleVersion: %@, buildDate: %@)", v22, v23, v24, v8, v14, v20);

  return v25;
}

- (SPRMeta)initWithBundle:(id)a3 timestamp:(id)a4
{
  uint64_t v6 = (NSBundle *)a3;
  uint64_t v7 = (NSString *)a4;
  bundle = self->_bundle;
  self->_bundle = v6;
  uint64_t v9 = v6;

  timestamp = self->_timestamp;
  self->_timestamp = v7;

  return self;
}

- (NSBundle)bundle
{
  return (NSBundle *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundle, 0);
  objc_storeStrong((id *)&self->_timestamp, 0);
}

@end