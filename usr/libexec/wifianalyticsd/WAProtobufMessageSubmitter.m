@interface WAProtobufMessageSubmitter
- (basic_string<char,)_fieldNameFromKey:(std::allocator<char>> *__return_ptr)retstr;
- (id)_generateSetterInvocationFromInstance:(id)a3 andFieldKey:(id)a4 isRepeatable:(BOOL)a5;
- (id)instantiateAWDProtobufAndPopulateValues:(id)a3;
@end

@implementation WAProtobufMessageSubmitter

- (id)instantiateAWDProtobufAndPopulateValues:(id)a3
{
  id v4 = a3;
  v59 = v4;
  v5 = [v4 originalClassName];
  id v6 = objc_alloc_init(NSClassFromString(v5));

  if (!v4)
  {
    v50 = WALogCategoryDefaultHandle();
    obj = v50;
    if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      *(void *)&buf[4] = "-[WAProtobufMessageSubmitter instantiateAWDProtobufAndPopulateValues:]";
      __int16 v66 = 1024;
      int v67 = 20;
      _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_ERROR, "%{public}s::%d:PARSER: Told to submit a NULL MESSAGE", buf, 0x12u);
    }
    goto LABEL_73;
  }
  if (!v6)
  {
    obj = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(obj, OS_LOG_TYPE_ERROR))
    {
      v51 = [v4 key];
      v52 = [v4 originalClassName];
      *(_DWORD *)buf = 136447234;
      *(void *)&buf[4] = "-[WAProtobufMessageSubmitter instantiateAWDProtobufAndPopulateValues:]";
      __int16 v66 = 1024;
      int v67 = 21;
      __int16 v68 = 2112;
      id v69 = v51;
      __int16 v70 = 2112;
      v71 = v52;
      __int16 v72 = 2112;
      id v73 = v4;
      _os_log_impl((void *)&_mh_execute_header, obj, OS_LOG_TYPE_ERROR, "%{public}s::%d:PARSER: Didn't get an instantiated instance of AWD implementation in order to populate filed with key: %@ (%@). Bailing to avoid a crash. *** This is likely due to an out of date WirelessDiagnostics framework on the build (WiFiAnalytics model references classes contained in a newer version of WirelessDiagnostics framework). %@", buf, 0x30u);
    }
    goto LABEL_73;
  }
  long long v63 = 0u;
  long long v64 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  obj = [v4 mutableFields];
  id v7 = [obj countByEnumeratingWithState:&v61 objects:v60 count:16];
  if (!v7)
  {
LABEL_73:
    v8 = 0;
    goto LABEL_74;
  }
  v8 = 0;
  uint64_t v55 = *(void *)v62;
  do
  {
    uint64_t v9 = 0;
    id v56 = v7;
    do
    {
      if (*(void *)v62 != v55) {
        objc_enumerationMutation(obj);
      }
      uint64_t v58 = v9;
      uint64_t v10 = *(void *)(*((void *)&v61 + 1) + 8 * v9);
      v11 = [v59 mutableFields];
      v12 = [v11 objectForKeyedSubscript:v10];

      unint64_t v13 = 0;
      while ([v12 isRepeatable])
      {
        v14 = [v12 repeatableValues];
        BOOL v15 = v13 < (unint64_t)[v14 count];

        if (!v15) {
          goto LABEL_66;
        }
LABEL_13:
        v16 = [v12 key];
        v17 = -[WAProtobufMessageSubmitter _generateSetterInvocationFromInstance:andFieldKey:isRepeatable:](self, "_generateSetterInvocationFromInstance:andFieldKey:isRepeatable:", v6, v16, [v12 isRepeatable]);

        v8 = v17;
        [v17 selector];
        if ((objc_opt_respondsToSelector() & 1) == 0)
        {
          v18 = WALogCategoryDefaultHandle();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          {
            NSStringFromSelector((SEL)[v8 selector]);
            id v19 = (id)objc_claimAutoreleasedReturnValue();
            v20 = [v59 key];
            v21 = [v12 key];
            *(_DWORD *)buf = 136447234;
            *(void *)&buf[4] = "-[WAProtobufMessageSubmitter instantiateAWDProtobufAndPopulateValues:]";
            __int16 v66 = 1024;
            int v67 = 31;
            __int16 v68 = 2112;
            id v69 = v19;
            __int16 v70 = 2112;
            v71 = v20;
            __int16 v72 = 2112;
            id v73 = v21;
            _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%{public}s::%d:Instantiated metric class doesn't respond to expected selector for setting! Selector: %@ on a class with key: %@ for field with key: %@", buf, 0x30u);
          }
        }
        switch((unint64_t)[v12 type])
        {
          case 1uLL:
            *(void *)buf = 0;
            if ([v12 isRepeatable])
            {
              v33 = [v12 repeatableValues];
              v34 = [v33 objectAtIndexedSubscript:v13];
              [v34 doubleValue];
              uint64_t v36 = v35;
            }
            else
            {
              [v12 doubleValue];
              uint64_t v36 = v47;
            }
            *(void *)buf = v36;
            [v8 setArgument:buf atIndex:2];
            break;
          case 2uLL:
            *(_DWORD *)buf = 0;
            if ([v12 isRepeatable])
            {
              v37 = [v12 repeatableValues];
              v38 = [v37 objectAtIndexedSubscript:v13];
              [v38 floatValue];
              int v40 = v39;
            }
            else
            {
              [v12 floatValue];
              int v40 = v48;
            }
            *(_DWORD *)buf = v40;
            [v8 setArgument:buf atIndex:2];
            break;
          case 3uLL:
            *(_DWORD *)buf = 0;
            if ([v12 isRepeatable])
            {
              v28 = [v12 repeatableValues];
              v29 = [v28 objectAtIndexedSubscript:v13];
              unsigned int v25 = [v29 intValue];
            }
            else
            {
              unsigned int v25 = [v12 int32Value];
            }
            goto LABEL_42;
          case 4uLL:
            *(void *)buf = 0;
            if ([v12 isRepeatable])
            {
              v30 = [v12 repeatableValues];
              v31 = [v30 objectAtIndexedSubscript:v13];
              id v32 = [v31 longLongValue];
            }
            else
            {
              id v32 = [v12 int64Value];
            }
            goto LABEL_47;
          case 5uLL:
            *(_DWORD *)buf = 0;
            if ([v12 isRepeatable])
            {
              v23 = [v12 repeatableValues];
              v24 = [v23 objectAtIndexedSubscript:v13];
              unsigned int v25 = [v24 unsignedIntValue];
            }
            else
            {
              unsigned int v25 = [v12 uint32Value];
            }
LABEL_42:
            *(_DWORD *)buf = v25;
            [v8 setArgument:buf atIndex:2];
            break;
          case 6uLL:
            *(void *)buf = 0;
            if ([v12 isRepeatable])
            {
              v41 = [v12 repeatableValues];
              v42 = [v41 objectAtIndexedSubscript:v13];
              id v32 = [v42 unsignedLongLongValue];
            }
            else
            {
              id v32 = [v12 uint64Value];
            }
LABEL_47:
            *(void *)buf = v32;
            [v8 setArgument:buf atIndex:2];
            break;
          case 7uLL:
            buf[0] = 0;
            if ([v12 isRepeatable])
            {
              v43 = [v12 repeatableValues];
              v44 = [v43 objectAtIndexedSubscript:v13];
              unsigned __int8 v45 = [v44 BOOLValue];
            }
            else
            {
              unsigned __int8 v45 = [v12 BOOLValue];
            }
            buf[0] = v45;
            [v8 setArgument:buf atIndex:2];
            break;
          case 8uLL:
          case 9uLL:
            if ([v12 isRepeatable])
            {
              v22 = [v12 repeatableValues];
              *(void *)buf = [v22 objectAtIndexedSubscript:v13];
            }
            else
            {
              if ([v12 type] == (id)9) {
                [v12 bytesValue];
              }
              else {
              *(void *)buf = [v12 stringValue];
              }
            }
            [v8 setArgument:buf atIndex:2];
            [v8 retainArguments];

            break;
          case 0xAuLL:
            if ([v12 isRepeatable])
            {
              v26 = [v12 repeatableValues];
              v27 = [v26 objectAtIndexedSubscript:v13];
              *(void *)buf = [(WAProtobufMessageSubmitter *)self instantiateAWDProtobufAndPopulateValues:v27];
            }
            else
            {
              v26 = [v12 subMessageValue];
              *(void *)buf = [(WAProtobufMessageSubmitter *)self instantiateAWDProtobufAndPopulateValues:v26];
            }

            [v8 setArgument:buf atIndex:2];
            [v8 retainArguments];

            break;
          default:
            v46 = WALogCategoryDefaultHandle();
            if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136446466;
              *(void *)&buf[4] = "-[WAProtobufMessageSubmitter instantiateAWDProtobufAndPopulateValues:]";
              __int16 v66 = 1024;
              int v67 = 95;
              _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_ERROR, "%{public}s::%d:PARSER: unexpected type", buf, 0x12u);
            }

            break;
        }
        *(void *)buf = 0;
        [v8 getArgument:buf atIndex:2];
        BOOL v49 = [v12 type] == (id)10
           || [v12 type] == (id)9
           || [v12 type] == (id)8;
        if (*(void *)buf || !v49) {
          [v8 invoke];
        }
        ++v13;
      }
      if (!v13) {
        goto LABEL_13;
      }
LABEL_66:

      uint64_t v9 = v58 + 1;
    }
    while ((id)(v58 + 1) != v56);
    id v7 = [obj countByEnumeratingWithState:&v61 objects:v60 count:16];
  }
  while (v7);
LABEL_74:

  return v6;
}

- (id)_generateSetterInvocationFromInstance:(id)a3 andFieldKey:(id)a4 isRepeatable:(BOOL)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [v8 UTF8String];
  unint64_t v10 = (unint64_t)[v8 lengthOfBytesUsingEncoding:4];
  v11 = (void *)v10;
  if (v10 >= 0x7FFFFFFFFFFFFFF8) {
    sub_10002C050();
  }
  if (v10 >= 0x17)
  {
    uint64_t v13 = (v10 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v10 | 7) != 0x17) {
      uint64_t v13 = v10 | 7;
    }
    uint64_t v14 = v13 + 1;
    v12 = (void **)operator new(v13 + 1);
    __dst[1] = v11;
    unint64_t v36 = v14 | 0x8000000000000000;
    __dst[0] = v12;
    goto LABEL_8;
  }
  HIBYTE(v36) = v10;
  v12 = __dst;
  if (v10) {
LABEL_8:
  }
    memmove(v12, v9, (size_t)v11);
  *((unsigned char *)v11 + (void)v12) = 0;
  [(WAProtobufMessageSubmitter *)self _fieldNameFromKey:__dst];
  if (SHIBYTE(v36) < 0) {
    operator delete(__dst[0]);
  }
  std::operator+<char>();
  if (v34 >= 0) {
    size_t v15 = HIBYTE(v34);
  }
  else {
    size_t v15 = (size_t)v33[1];
  }
  v16 = __p;
  sub_10002C0F0((uint64_t)__p, v15 + 1);
  if (__p[23] < 0) {
    v16 = *(unsigned char **)__p;
  }
  if (v15)
  {
    if (v34 >= 0) {
      v17 = v33;
    }
    else {
      v17 = (void **)v33[0];
    }
    memmove(v16, v17, v15);
  }
  *(_WORD *)&v16[v15] = 58;
  if (__p[23] >= 0) {
    v18 = __p;
  }
  else {
    v18 = *(const char **)__p;
  }
  SEL v19 = sel_registerName(v18);
  if ((__p[23] & 0x80000000) != 0) {
    operator delete(*(void **)__p);
  }
  v20 = [(id)objc_opt_class() instanceMethodSignatureForSelector:v19];
  if (v20) {
    goto LABEL_52;
  }
  if (SHIBYTE(v37.__r_.__value_.__r.__words[2]) < 0)
  {
    v22 = (std::string *)v37.__r_.__value_.__r.__words[0];
    if (*(unsigned char *)(v37.__r_.__value_.__r.__words[0] + v37.__r_.__value_.__l.__size_ - 1) == 115)
    {
      uint64_t v21 = --v37.__r_.__value_.__l.__size_;
      goto LABEL_32;
    }
  }
  else if (v37.__r_.__value_.__s.__data_[HIBYTE(v37.__r_.__value_.__r.__words[2]) - 1] == 115)
  {
    uint64_t v21 = HIBYTE(v37.__r_.__value_.__r.__words[2]) - 1;
    *((unsigned char *)&v37.__r_.__value_.__s + 23) = (*((unsigned char *)&v37.__r_.__value_.__s + 23) - 1) & 0x7F;
    v22 = &v37;
LABEL_32:
    v22->__r_.__value_.__s.__data_[v21] = 0;
    goto LABEL_34;
  }
  std::string::append(&v37, "s");
LABEL_34:
  std::operator+<char>();
  if (SHIBYTE(v34) < 0) {
    operator delete(v33[0]);
  }
  uint64_t v34 = *(void *)&__p[16];
  *(_OWORD *)v33 = *(_OWORD *)__p;
  if (__p[23] >= 0) {
    size_t v23 = HIBYTE(*(void *)&__p[16]);
  }
  else {
    size_t v23 = *(void *)&__p[8];
  }
  v24 = __p;
  sub_10002C0F0((uint64_t)__p, v23 + 1);
  if (__p[23] < 0) {
    v24 = *(unsigned char **)__p;
  }
  if (v23)
  {
    if (v34 >= 0) {
      unsigned int v25 = v33;
    }
    else {
      unsigned int v25 = (void **)v33[0];
    }
    memmove(v24, v25, v23);
  }
  *(_WORD *)&v24[v23] = 58;
  if (__p[23] >= 0) {
    v26 = __p;
  }
  else {
    v26 = *(const char **)__p;
  }
  SEL v19 = sel_registerName(v26);
  if ((__p[23] & 0x80000000) != 0) {
    operator delete(*(void **)__p);
  }
  v20 = [(id)objc_opt_class() instanceMethodSignatureForSelector:v19];
  if (v20)
  {
LABEL_52:
    v27 = +[NSInvocation invocationWithMethodSignature:](NSInvocation, "invocationWithMethodSignature:", v20, v33[0], v33[1], v34);
    [v27 setTarget:v7];
    [v27 setSelector:v19];
    goto LABEL_53;
  }
  v30 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
  {
    v31 = &v37;
    if ((v37.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
      v31 = (std::string *)v37.__r_.__value_.__r.__words[0];
    }
    id v32 = v33;
    if (v34 < 0) {
      id v32 = (void **)v33[0];
    }
    *(_DWORD *)__p = 136447234;
    *(void *)&__p[4] = "-[WAProtobufMessageSubmitter _generateSetterInvocationFromInstance:andFieldKey:isRepeatable:]";
    *(_WORD *)&__p[12] = 1024;
    *(_DWORD *)&__p[14] = 132;
    *(_WORD *)&__p[18] = 2112;
    *(void *)&__p[20] = v8;
    __int16 v39 = 2080;
    int v40 = v31;
    __int16 v41 = 2080;
    v42 = v32;
    _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "%{public}s::%d:PARSER: Failed to generate method signature from fieldKey: %@ which resulted in AWD container field name: %s andSelectorString:%s", __p, 0x30u);
  }

  v20 = 0;
  v27 = 0;
LABEL_53:
  id v28 = v27;
  if (SHIBYTE(v34) < 0) {
    operator delete(v33[0]);
  }
  if (SHIBYTE(v37.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v37.__r_.__value_.__l.__data_);
  }

  return v28;
}

- (basic_string<char,)_fieldNameFromKey:(std::allocator<char>> *__return_ptr)retstr
{
  v2 = v1;
  var0 = retstr;
  *(_OWORD *)retstr->var0.var0.var0.var0.var0 = 0uLL;
  *((void *)&retstr->var0.var0.var0.var1 + 2) = 0;
  std::string::size_type v4 = HIBYTE(v1->__r_.__value_.__r.__words[2]);
  if (SHIBYTE(v1->__r_.__value_.__r.__words[2]) < 0)
  {
    v5 = (unsigned __int8 *)v1->__r_.__value_.__r.__words[0];
    std::string::size_type size = v1->__r_.__value_.__l.__size_;
  }
  else
  {
    v5 = (unsigned __int8 *)v1;
    std::string::size_type size = HIBYTE(v1->__r_.__value_.__r.__words[2]);
  }
  id v7 = &v5[size];
  if (size)
  {
    id v8 = v5;
    id v9 = &v5[size];
    do
    {
      unint64_t v10 = v8;
      v11 = v8;
      while (1)
      {
        int v12 = *v11++;
        if (v12 == 95) {
          break;
        }
        unint64_t v10 = v11;
        if (v11 == v7)
        {
          unint64_t v10 = v9;
          goto LABEL_13;
        }
      }
      id v8 = v10 + 1;
      id v9 = v10;
    }
    while (v11 != v7);
  }
  else
  {
    unint64_t v10 = v5;
  }
LABEL_13:
  uint64_t v13 = (unsigned __int8 *)(v10 - v5);
  if (v10 == v7) {
    std::string::size_type v14 = 0;
  }
  else {
    std::string::size_type v14 = (std::string::size_type)(v13 + 1);
  }
  if ((v4 & 0x80) != 0) {
    std::string::size_type v4 = v2->__r_.__value_.__l.__size_;
  }
  std::string::basic_string(&v16, v2, v14, v4, (std::allocator<char> *)&v17);
  var0->var0.var0 = (__rep)v16;
  if (*((char *)&var0->var0.var0.var0.var1 + 23) < 0) {
    var0 = (basic_string<char, std::char_traits<char>, std::allocator<char>> *)var0->var0.var0.var0.var1.var0;
  }
  result = (basic_string<char, std::char_traits<char>, std::allocator<char>> *)__toupper(var0->var0.var0.var0.var0.var0[0]);
  var0->var0.var0.var0.var0.var0[0] = (char)result;
  return result;
}

@end