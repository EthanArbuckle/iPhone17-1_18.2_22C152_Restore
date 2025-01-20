@interface RDUserData
+ (BOOL)supportsSecureCoding;
+ (void)fetchUserDataWithLanguage:(id)a3 completion:(id)a4;
+ (void)fetchUserDataWithLanguage:(id)a3 keepGoing:(id)a4 completion:(id)a5;
- (BOOL)isEqual:(id)a3;
- (NSArray)contactsWords;
- (NSDictionary)dictionaryRepresentation;
- (NSString)language;
- (RDUserData)initWithCoder:(id)a3;
- (id)_initWithLanguage:(id)a3;
- (id)debugDescription;
- (id)description;
- (unint64_t)hash;
- (void)_fetchContactsWithKeepGoing:(id)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation RDUserData

- (id)_initWithLanguage:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)RDUserData;
  v4 = [(RDUserData *)&v6 init];
  if (v4)
  {
    v4->_language = (NSString *)[a3 copy];
    v4->_contactsWords = (NSArray *)&__NSArray0__struct;
  }
  return v4;
}

- (void)dealloc
{
  language = self->_language;
  if (language) {

  }
  contactsWords = self->_contactsWords;
  if (contactsWords) {

  }
  v5.receiver = self;
  v5.super_class = (Class)RDUserData;
  [(RDUserData *)&v5 dealloc];
}

- (void)_fetchContactsWithKeepGoing:(id)a3
{
  uint64_t v33 = 0;
  v34 = &v33;
  uint64_t v35 = 0x2020000000;
  uint64_t v36 = 0;
  uint64_t v29 = 0;
  v30 = &v29;
  uint64_t v31 = 0x2020000000;
  uint64_t v32 = 0;
  id v5 = objc_alloc_init((Class)NSMutableArray);
  uint64_t v28 = 0;
  id v6 = objc_alloc_init((Class)CNContactStore);
  [v6 requestAccessForEntityType:0 completionHandler:&stru_1000EF3C8];
  v41[0] = CNContactGivenNameKey;
  v41[1] = CNContactMiddleNameKey;
  v41[2] = CNContactFamilyNameKey;
  v41[3] = CNContactNicknameKey;
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_10003C5A0;
  v27[3] = &unk_1000EF3F0;
  v27[4] = v5;
  v27[5] = a3;
  v27[6] = &v29;
  v27[7] = &v33;
  LODWORD(a3) = objc_msgSend(v6, "enumerateContactsWithFetchRequest:error:usingBlock:", objc_msgSend(objc_alloc((Class)CNContactFetchRequest), "initWithKeysToFetch:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v41, 4)), &v28, v27);
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x2020000000;
  uint64_t v26 = 0;
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x2020000000;
  uint64_t v22 = 0;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10003C724;
  v18[3] = &unk_1000EF418;
  v18[4] = v5;
  v18[5] = &v29;
  v18[6] = &v23;
  v18[7] = &v19;
  +[_INVocabulary enumerateVocabularyUsingBlock:v18];
  if (a3)
  {
    v7 = RXOSLog();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_7;
    }
    uint64_t v8 = v34[3];
    uint64_t v9 = v30[3];
    *(_DWORD *)buf = 134218240;
    uint64_t v38 = v8;
    __int16 v39 = 2048;
    uint64_t v40 = v9;
    v10 = "Found %lu and added %lu contact(s) for offline recognition";
    v11 = v7;
    os_log_type_t v12 = OS_LOG_TYPE_DEFAULT;
    uint32_t v13 = 22;
  }
  else
  {
    v14 = RXOSLog();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      goto LABEL_7;
    }
    *(_DWORD *)buf = 138412290;
    uint64_t v38 = v28;
    v10 = "Could not get contacts for offline recognition: %@";
    v11 = v14;
    os_log_type_t v12 = OS_LOG_TYPE_ERROR;
    uint32_t v13 = 12;
  }
  _os_log_impl((void *)&_mh_execute_header, v11, v12, v10, buf, v13);
LABEL_7:
  v15 = RXOSLog();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v16 = v24[3];
    uint64_t v17 = v20[3];
    *(_DWORD *)buf = 134218240;
    uint64_t v38 = v16;
    __int16 v39 = 2048;
    uint64_t v40 = v17;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Found %lu and added %lu contact(s) from INVocabulary for offline recognition", buf, 0x16u);
  }
  self->_contactsWords = (NSArray *)[v5 copy];
  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v33, 8);
}

+ (void)fetchUserDataWithLanguage:(id)a3 completion:(id)a4
{
}

+ (void)fetchUserDataWithLanguage:(id)a3 keepGoing:(id)a4 completion:(id)a5
{
  id v8 = [[RDUserData alloc] _initWithLanguage:a3];
  uint64_t v9 = dispatch_group_create();
  v10 = (objc_class *)objc_opt_class();
  v11 = [+[NSString stringWithFormat:@"%s.%@", class_getName(v10), a3] UTF8String];
  os_log_type_t v12 = dispatch_queue_create(v11, 0);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10003CE60;
  v19[3] = &unk_1000EF480;
  v19[4] = v8;
  v19[5] = a4;
  if (qword_1000FEBA8 != -1) {
    dispatch_once(&qword_1000FEBA8, &stru_1000EF4C8);
  }
  uint64_t v25 = 0;
  uint64_t v26 = &v25;
  uint64_t v27 = 0x2020000000;
  char v28 = 0;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003D378;
  block[3] = &unk_1000EF4F0;
  block[4] = @"Contacts";
  block[5] = &v25;
  dispatch_sync((dispatch_queue_t)qword_1000FEBB0, block);
  if (*((unsigned char *)v26 + 24))
  {
    uint32_t v13 = RXOSLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = @"Contacts";
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Skipping fetch for  %@ because another fetch is still active", (uint8_t *)&buf, 0xCu);
    }
  }
  else
  {
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_10003D3E0;
    v23[3] = &unk_1000EDD68;
    v23[4] = @"Contacts";
    v21[0] = 0;
    v21[1] = v21;
    v21[2] = 0x2020000000;
    char v22 = 0;
    [+[NSProcessInfo processInfo] systemUptime];
    uint64_t v15 = v14;
    dispatch_time_t v16 = dispatch_time(0, 15000000000);
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_10003D51C;
    v20[3] = &unk_1000EF518;
    v20[6] = v23;
    v20[7] = v21;
    v20[4] = @"Contacts";
    v20[5] = v9;
    dispatch_after(v16, v12, v20);
    dispatch_group_enter(v9);
    global_queue = dispatch_get_global_queue(0, 0);
    *(void *)&long long buf = _NSConcreteStackBlock;
    *((void *)&buf + 1) = 3221225472;
    v30 = sub_10003D5FC;
    uint64_t v31 = &unk_1000EF590;
    uint64_t v38 = v15;
    uint64_t v36 = v23;
    v37 = v21;
    uint64_t v32 = v12;
    CFStringRef v33 = @"Contacts";
    v34 = v9;
    uint64_t v35 = v19;
    dispatch_async(global_queue, &buf);
    _Block_object_dispose(v21, 8);
  }
  _Block_object_dispose(&v25, 8);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10003CEA8;
  v18[3] = &unk_1000EF4A8;
  v18[5] = a5;
  v18[6] = a4;
  v18[4] = v8;
  dispatch_group_notify(v9, v12, v18);
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_language hash];
  return (unint64_t)[(NSArray *)self->_contactsWords hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3) {
    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    LOBYTE(v6) = 0;
    return v6;
  }
  language = self->_language;
  if (language == *((NSString **)a3 + 2) || (unsigned int v6 = -[NSString isEqual:](language, "isEqual:")) != 0)
  {
    contactsWords = self->_contactsWords;
    if (contactsWords != *((NSArray **)a3 + 3))
    {
      LOBYTE(v6) = -[NSArray isEqual:](contactsWords, "isEqual:");
      return v6;
    }
LABEL_9:
    LOBYTE(v6) = 1;
  }
  return v6;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)RDUserData;
  return objc_msgSend(-[RDUserData description](&v3, "description"), "stringByAppendingFormat:", @"language=%@, contactsWords count=%ld", self->_language, -[NSArray count](self->_contactsWords, "count"));
}

- (id)debugDescription
{
  v3.receiver = self;
  v3.super_class = (Class)RDUserData;
  return objc_msgSend(-[RDUserData description](&v3, "description"), "stringByAppendingFormat:", @"language=%@, contactsWords=%@", self->_language, self->_contactsWords);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RDUserData)initWithCoder:(id)a3
{
  v4 = [(RDUserData *)self init];
  if (v4)
  {
    v4->_language = (NSString *)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"_language"];
    id v5 = (NSArray *)[a3 decodePropertyListForKey:@"_contactsWords"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v19 = 0u;
      long long v20 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      id v6 = [(NSArray *)v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (!v6)
      {
LABEL_14:
        v4->_contactsWords = v5;
        return v4;
      }
      uint64_t v7 = *(void *)v18;
LABEL_5:
      uint64_t v8 = 0;
      while (1)
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void **)(*((void *)&v17 + 1) + 8 * v8);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          break;
        }
        uint64_t v13 = 0;
        uint64_t v14 = &v13;
        uint64_t v15 = 0x2020000000;
        char v16 = 0;
        v12[0] = _NSConcreteStackBlock;
        v12[1] = 3221225472;
        v12[2] = sub_10003D890;
        v12[3] = &unk_1000EF5B8;
        v12[4] = &v13;
        [v9 enumerateKeysAndObjectsUsingBlock:v12];
        int v10 = *((unsigned __int8 *)v14 + 24);
        _Block_object_dispose(&v13, 8);
        if (v10) {
          break;
        }
        if (v6 == (id)++v8)
        {
          id v6 = [(NSArray *)v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
          if (v6) {
            goto LABEL_5;
          }
          goto LABEL_14;
        }
      }
    }
    id v5 = 0;
    goto LABEL_14;
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  [a3 encodeObject:self->_language forKey:@"_language"];
  contactsWords = self->_contactsWords;
  [a3 encodeObject:contactsWords forKey:@"_contactsWords"];
}

- (NSDictionary)dictionaryRepresentation
{
  return self->_dictionaryRepresentation;
}

- (NSString)language
{
  return self->_language;
}

- (NSArray)contactsWords
{
  return self->_contactsWords;
}

@end