@interface SSMLServices
+ (id)shared;
- (BOOL)isSSMLValid:(id)a3;
- (SSMLServicesWrapper)conversionWrapper;
- (id)convertRange:(_NSRange)a3 forSSML:(id)a4;
- (id)generateSSMLFromAVSpeechUtterance:(id)a3;
- (id)generateSSMLFromPlainTalkString:(id)a3;
- (id)generateSSMLFromString:(id)a3;
- (id)parseSSMLToPlainTalk:(id)a3;
- (id)parseSSMLToPlainText:(id)a3;
- (void)setConversionWrapper:(id)a3;
@end

@implementation SSMLServices

+ (id)shared
{
  if (qword_1E96C47A8 != -1) {
    dispatch_once(&qword_1E96C47A8, &unk_1EFB80340);
  }
  v2 = (void *)qword_1E96C47B0;

  return v2;
}

- (id)generateSSMLFromString:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  v8 = objc_msgSend_generateSSMLFromString_(v4, v5, (uint64_t)v3, v6, v7);

  return v8;
}

- (id)generateSSMLFromAVSpeechUtterance:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  v8 = objc_msgSend_generateSSMLFromAVSpeechUtterance_(v4, v5, (uint64_t)v3, v6, v7);

  return v8;
}

- (id)generateSSMLFromPlainTalkString:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  v8 = objc_msgSend_generateSSMLFromPlainTalkString_(v4, v5, (uint64_t)v3, v6, v7);

  return v8;
}

- (BOOL)isSSMLValid:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v3 = a3;
  v4 = objc_opt_new();
  v8 = objc_msgSend_parseSSMLToPlainText_(v4, v5, (uint64_t)v3, v6, v7);

  if (v8)
  {
    v13 = objc_msgSend_error(v8, v9, v10, v11, v12);
    BOOL v14 = v13 == 0;
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

- (id)parseSSMLToPlainText:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  v8 = objc_msgSend_parseSSMLToPlainText_(v4, v5, (uint64_t)v3, v6, v7);

  return v8;
}

- (id)parseSSMLToPlainTalk:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  v8 = objc_msgSend_parseSSMLToPlainTalk_(v4, v5, (uint64_t)v3, v6, v7);

  return v8;
}

- (id)convertRange:(_NSRange)a3 forSSML:(id)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v7 = a4;
  v8 = self;
  objc_sync_enter(v8);
  v13 = objc_msgSend_conversionWrapper(v8, v9, v10, v11, v12);

  if (!v13)
  {
    v18 = objc_opt_new();
    objc_msgSend_setConversionWrapper_(v8, v19, (uint64_t)v18, v20, v21);
  }
  v22 = objc_msgSend_conversionWrapper(v8, v14, v15, v16, v17);
  v24 = objc_msgSend_convertRange_forSSML_(v22, v23, location, length, (uint64_t)v7);

  objc_sync_exit(v8);

  return v24;
}

- (SSMLServicesWrapper)conversionWrapper
{
  return self->_conversionWrapper;
}

- (void)setConversionWrapper:(id)a3
{
}

- (void).cxx_destruct
{
}

@end