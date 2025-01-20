@interface SSMLServicesWrapper
- (SSMLParserWrapperInternal)underlyingObject;
- (SSMLRangeConverterInternal)converter;
- (SSMLServicesWrapper)init;
- (id)convertRange:(_NSRange)a3 forSSML:(id)a4;
- (id)generateSSMLFromAVSpeechUtterance:(id)a3;
- (id)generateSSMLFromPlainTalkString:(id)a3;
- (id)generateSSMLFromString:(id)a3;
- (id)parseSSMLToPlainTalk:(id)a3;
- (id)parseSSMLToPlainText:(id)a3;
- (void)setConverter:(id)a3;
@end

@implementation SSMLServicesWrapper

- (SSMLServicesWrapper)init
{
  v6.receiver = self;
  v6.super_class = (Class)SSMLServicesWrapper;
  v2 = [(SSMLServicesWrapper *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    underlyingObject = v2->_underlyingObject;
    v2->_underlyingObject = (SSMLParserWrapperInternal *)v3;
  }
  return v2;
}

- (id)generateSSMLFromString:(id)a3
{
  id v4 = a3;
  v9 = objc_msgSend_underlyingObject(self, v5, v6, v7, v8);
  v13 = objc_msgSend_generateSSMLFromString_(v9, v10, (uint64_t)v4, v11, v12);

  return v13;
}

- (id)generateSSMLFromPlainTalkString:(id)a3
{
  id v4 = a3;
  v9 = objc_msgSend_underlyingObject(self, v5, v6, v7, v8);
  v13 = objc_msgSend_generateSSMLFromPlainTalkString_(v9, v10, (uint64_t)v4, v11, v12);

  return v13;
}

- (id)generateSSMLFromAVSpeechUtterance:(id)a3
{
  id v4 = a3;
  v9 = objc_msgSend_underlyingObject(self, v5, v6, v7, v8);
  v13 = objc_msgSend_generateSSMLFromAVSpeechUtterance_(v9, v10, (uint64_t)v4, v11, v12);

  return v13;
}

- (id)parseSSMLToPlainText:(id)a3
{
  id v4 = a3;
  v9 = objc_msgSend_underlyingObject(self, v5, v6, v7, v8);
  v13 = objc_msgSend_parseSSMLToPlainText_(v9, v10, (uint64_t)v4, v11, v12);

  return v13;
}

- (id)parseSSMLToPlainTalk:(id)a3
{
  id v4 = a3;
  v9 = objc_msgSend_underlyingObject(self, v5, v6, v7, v8);
  v13 = objc_msgSend_parseSSMLToPlainTalk_(v9, v10, (uint64_t)v4, v11, v12);

  return v13;
}

- (SSMLParserWrapperInternal)underlyingObject
{
  return self->_underlyingObject;
}

- (SSMLRangeConverterInternal)converter
{
  return self->_converter;
}

- (void)setConverter:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_converter, 0);

  objc_storeStrong((id *)&self->_underlyingObject, 0);
}

- (id)convertRange:(_NSRange)a3 forSSML:(id)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v7 = a4;
  uint64_t v12 = objc_msgSend_converter(self, v8, v9, v10, v11);
  v17 = objc_msgSend_ssml(v12, v13, v14, v15, v16);

  if (!v17
    || (objc_msgSend_converter(self, v18, v19, v20, v21),
        v22 = objc_claimAutoreleasedReturnValue(),
        objc_msgSend_ssml(v22, v23, v24, v25, v26),
        v27 = objc_claimAutoreleasedReturnValue(),
        char isEqualToString = objc_msgSend_isEqualToString_(v27, v28, (uint64_t)v7, v29, v30),
        v27,
        v22,
        (isEqualToString & 1) == 0))
  {
    v36 = [SSMLRangeConverterInternal alloc];
    v40 = objc_msgSend_initWithSSML_(v36, v37, (uint64_t)v7, v38, v39);
    objc_msgSend_setConverter_(self, v41, (uint64_t)v40, v42, v43);
  }
  v44 = objc_msgSend_converter(self, v32, v33, v34, v35);
  v49 = objc_msgSend_plainString(v44, v45, v46, v47, v48);

  v54 = objc_msgSend_converter(self, v50, v51, v52, v53);
  uint64_t v57 = objc_msgSend_stringRangeFrom_(v54, v55, location, length, v56);
  uint64_t v59 = v58;

  if (v57 | v59)
  {
    v60 = objc_opt_new();
    v63 = objc_msgSend_substringWithRange_(v49, v61, v57, v59, v62);
    objc_msgSend_setPlainString_(v60, v64, (uint64_t)v63, v65, v66);

    objc_msgSend_setConvertedRange_(v60, v67, v57, v59, v68);
  }
  else
  {
    v60 = 0;
  }

  return v60;
}

@end