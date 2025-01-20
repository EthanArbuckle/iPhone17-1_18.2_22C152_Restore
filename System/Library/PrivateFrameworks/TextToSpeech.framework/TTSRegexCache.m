@interface TTSRegexCache
+ (id)sharedInstance;
- (NSMutableDictionary)cache;
- (TTSRegexCache)init;
- (id)regexForString:(id)a3;
- (id)regexForString:(id)a3 atStart:(BOOL)a4;
- (void)setCache:(id)a3;
@end

@implementation TTSRegexCache

+ (id)sharedInstance
{
  if (qword_1EB67ABB0 != -1) {
    dispatch_once(&qword_1EB67ABB0, &unk_1EFB804A0);
  }
  v2 = (void *)qword_1EB67AA70;

  return v2;
}

- (TTSRegexCache)init
{
  v12.receiver = self;
  v12.super_class = (Class)TTSRegexCache;
  v6 = [(TTSRegexCache *)&v12 init];
  if (v6)
  {
    v7 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v2, v3, v4, v5);
    objc_msgSend_setCache_(v6, v8, (uint64_t)v7, v9, v10);

    v6->_regexCacheLock._os_unfair_lock_opaque = 0;
  }
  return v6;
}

- (id)regexForString:(id)a3
{
  return (id)objc_msgSend_regexForString_atStart_(self, a2, (uint64_t)a3, 0, v3);
}

- (id)regexForString:(id)a3 atStart:(BOOL)a4
{
  BOOL v4 = a4;
  id v9 = a3;
  uint64_t v10 = v9;
  if (v4)
  {
    uint64_t v10 = objc_msgSend_stringWithFormat_(NSString, v6, @"^%@", v7, v8, v9);
  }
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x3032000000;
  v27 = sub_1A673057C;
  v28 = sub_1A673058C;
  id v29 = 0;
  v21[1] = (id)MEMORY[0x1E4F143A8];
  v21[2] = (id)3221225472;
  v21[3] = sub_1A6730594;
  v21[4] = &unk_1E5C6AAD0;
  v23 = &v24;
  v21[5] = self;
  id v11 = v10;
  id v22 = v11;
  AX_PERFORM_WITH_LOCK();
  objc_super v12 = (void *)v25[5];
  if (v12)
  {
    id v13 = v12;
  }
  else
  {
    id v14 = objc_alloc(MEMORY[0x1E4F28FD8]);
    v21[0] = 0;
    v16 = objc_msgSend_initWithPattern_options_error_(v14, v15, (uint64_t)v11, 1, (uint64_t)v21);
    id v17 = v21[0];
    if (v17)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        sub_1A689054C((uint64_t)v17);
      }
      id v13 = 0;
    }
    else
    {
      id v19 = v16;
      id v20 = v11;
      AX_PERFORM_WITH_LOCK();
      id v13 = v19;
    }
  }

  _Block_object_dispose(&v24, 8);

  return v13;
}

- (NSMutableDictionary)cache
{
  return self->_cache;
}

- (void)setCache:(id)a3
{
}

- (void).cxx_destruct
{
}

@end