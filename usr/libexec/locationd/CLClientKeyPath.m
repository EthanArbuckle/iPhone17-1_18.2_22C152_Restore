@interface CLClientKeyPath
+ (CLClientKeyPath)clientKeyPathWithClientAnchor:(id)a3 anchorType:(char)a4;
+ (CLClientKeyPath)clientKeyPathWithClientAnchor:(id)a3 anchorType:(char)a4 subIdentityId:(id)a5 subIdentityType:(char)a6;
+ (CLClientKeyPath)clientKeyPathWithClientKey:(id)a3;
+ (CLClientKeyPath)clientKeyPathWithLegacyClientKey:(id)a3;
+ (CLClientKeyPath)clientKeyPathWithUserName:(id)a3 clientAnchor:(id)a4 anchorType:(char)a5;
+ (CLClientKeyPath)clientKeyPathWithUserName:(id)a3 clientAnchor:(id)a4 anchorType:(char)a5 subIdentityId:(id)a6 subIdentityType:(char)a7;
+ (id)clientKeyPathFromName:(Name *)a3;
+ (id)clientKeyPathFromName:(id)a1 subIdentityId:(SEL)a2 subIdentityType:(Name *)a3;
+ (id)nullClientKeyPath;
- (BOOL)isAuthLimited;
- (BOOL)isAuthSharingSubIdentity;
- (BOOL)isEqual:(id)a3;
- (BOOL)isValidCKP;
- (CLClientKeyPath)anchorKeyPath;
- (CLClientKeyPath)clientKeyPathWithReplacementAnchor:(id)a3 anchorType:(char)a4;
- (CLClientKeyPath)clientKeyPathWithReplacementSubIdentityId:(id)a3 subIdentityType:(char)a4;
- (CLClientKeyPath)clientKeyPathWithReplacementTypedAnchor:(id)a3;
- (CLClientKeyPath)clientKeyPathWithReplacementTypedSubIdentityId:(id)a3;
- (CLClientKeyPath)limitingCKP;
- (NSString)bundleId;
- (NSString)bundlePath;
- (NSString)clientAnchor;
- (NSString)clientAnchorWithType;
- (NSString)clientKey;
- (NSString)executablePath;
- (NSString)legacyClientKey;
- (NSString)nestedBundleId;
- (NSString)nestedBundlePath;
- (NSString)nestedExecutablePath;
- (NSString)subIdentityId;
- (NSString)subIdentityIdWithType;
- (NSString)userName;
- (NSString)userlessClientKeyPath;
- (NSString)website;
- (NSString)zoneId;
- (Name)clientName;
- (basic_string<char,)cppClientKey;
- (char)anchorType;
- (char)findComponent:(int)a3;
- (char)subIdentityType;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)extractComponentFromCharPtr:(char *)a3;
- (unint64_t)hash;
@end

@implementation CLClientKeyPath

+ (CLClientKeyPath)clientKeyPathWithClientAnchor:(id)a3 anchorType:(char)a4
{
  return +[CLClientKeyPath clientKeyPathWithUserName:0 clientAnchor:a3 anchorType:a4 subIdentityId:0 subIdentityType:33];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (char *)objc_alloc((Class)objc_opt_class());
  strcpy(v4 + 8, self->_buffer);
  return v4;
}

+ (id)clientKeyPathFromName:(Name *)a3
{
  sub_100089AE0((char *)__dst, (long long *)a3->fUserName.__r_.__value_.var0.var0.__data_);
  id v3 = +[CLClientKeyPath clientKeyPathFromName:__dst subIdentityId:0 subIdentityType:33];
  if (v18 < 0) {
    operator delete(__p);
  }
  if (v16 < 0) {
    operator delete(v15);
  }
  if (v14 < 0) {
    operator delete(v13);
  }
  if (v12 < 0) {
    operator delete(v11);
  }
  if (v10 < 0) {
    operator delete(v9);
  }
  if (v8 < 0) {
    operator delete(v7);
  }
  if (v6 < 0) {
    operator delete(__dst[0]);
  }
  return v3;
}

+ (id)clientKeyPathFromName:(id)a1 subIdentityId:(SEL)a2 subIdentityType:(Name *)a3
{
  uint64_t v5 = v4;
  uint64_t v6 = v3;
  if (_os_feature_enabled_impl())
  {
    if (*((char *)&a3->fUserName.__r_.__value_.var0.var1 + 23) < 0)
    {
      sub_1000DC48C(__p, a3->fUserName.__r_.__value_.var0.var1.__data_, a3->fUserName.__r_.__value_.var0.var1.__size_);
    }
    else
    {
      *(_OWORD *)__p = *(_OWORD *)a3->fUserName.__r_.__value_.var0.var0.__data_;
      uint64_t v17 = *((void *)&a3->fUserName.__r_.__value_.var0.var1 + 2);
    }
    if (v17 >= 0) {
      v9 = __p;
    }
    else {
      v9 = (void **)__p[0];
    }
    char v8 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v9, __p[0], __p[1], v17);
    if (SHIBYTE(v17) < 0) {
      operator delete(__p[0]);
    }
  }
  else
  {
    char v8 = 0;
  }
  sub_1000A8320((uint64_t)a3, (uint64_t)__p);
  if (v17 >= 0) {
    char v10 = __p;
  }
  else {
    char v10 = (void **)__p[0];
  }
  v11 = +[NSString stringWithUTF8String:v10];
  if (SHIBYTE(v17) < 0) {
    operator delete(__p[0]);
  }
  if ([(NSString *)v11 hasPrefix:+[NSString stringWithUTF8String:"com.apple.locationd.executable-"]])
  {
    p_var0 = &a3->fUserName.__r_.var0;
    if (a3[1].fUserName.__r_.__value_.var0.var0.__data_[7] < 0) {
      p_var0 = *(int **)p_var0;
    }
    v11 = +[NSString stringWithUTF8String:p_var0];
    uint64_t v13 = 101;
  }
  else if ([(NSString *)v11 hasPrefix:+[NSString stringWithUTF8String:"com.apple.locationd.bundle-"]])
  {
    p_size = &a3[1].fUserName.__r_.__value_.var0.var1.__size_;
    if (*((char *)&a3[1].fUserName.__r_.var1 + 3) < 0) {
      p_size = (unint64_t *)*p_size;
    }
    v11 = +[NSString stringWithUTF8String:p_size];
    uint64_t v13 = 112;
  }
  else
  {
    uint64_t v13 = 105;
  }
  return +[CLClientKeyPath clientKeyPathWithUserName:v8 clientAnchor:v11 anchorType:v13 subIdentityId:v6 subIdentityType:v5];
}

- (NSString)website
{
  uint64_t v3 = [(CLClientKeyPath *)self findComponent:2];
  if (!v3 || *v3 != 119) {
    return 0;
  }

  return (NSString *)[(CLClientKeyPath *)self extractComponentFromCharPtr:v3 + 1];
}

- (Name)clientName
{
  v2 = v1;
  *(_DWORD *)((char *)&retstr[2].fUserName.__r_.__value_.var0.var1.__size_ + 7) = 0;
  *(_OWORD *)&retstr[1].fUserName.__r_.var0 = 0u;
  *(_OWORD *)retstr[2].fUserName.__r_.__value_.var0.var0.__data_ = 0u;
  *(_OWORD *)&retstr->fUserName.var0 = 0u;
  *(_OWORD *)&retstr[1].fUserName.__r_.__value_.var0.var1.__size_ = 0u;
  *(_OWORD *)retstr->fUserName.__r_.__value_.var0.var0.__data_ = 0u;
  *((_OWORD *)&retstr->fUserName.__r_.__value_.var0.var1 + 1) = 0u;
  *(_OWORD *)&retstr[2].fUserName.__r_.var0 = 0u;
  *(_OWORD *)retstr[3].fUserName.__r_.__value_.var0.var0.__data_ = 0u;
  *((_OWORD *)&retstr[3].fUserName.__r_.__value_.var0.var1 + 1) = 0u;
  *(_OWORD *)&retstr[3].fUserName.var0 = 0u;
  *(__long *)((char *)&retstr[4].fUserName.__r_.__value_.var0.var1 + 3) = 0u;
  int v4 = *(unsigned __int8 *)[v1 findComponent:1];
  id v5 = [v2 clientAnchor];
  uint64_t v6 = (unsigned __int8 *)[v2 findComponent:2];
  if (!v6)
  {
    if (v5) {
      goto LABEL_23;
    }
LABEL_27:
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_10230B008);
    }
    char v10 = qword_102419538;
    if (!os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_65;
    }
    uint64_t __str = 68289282;
    __int16 __str_8 = 2082;
    __str_10 = "";
    __int16 __str_18 = 2114;
    *(void *)__str_20 = v2;
    v11 = "{\"msg%{public}.0s\":\"#warning #CLCKP creating Name from ckp with an empty anchor\", \"CKP\":%{public, locati"
          "on:escape_only}@}";
LABEL_38:
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&__str, 0x1Cu);
    goto LABEL_65;
  }
  int v7 = *v6;
  id v8 = [v2 subIdentityId];
  if (!v5) {
    goto LABEL_27;
  }
  if (v7 == 112)
  {
    if (v8)
    {
      if (v4 == 108)
      {
        sub_100134750(&v17, (char *)[v8 UTF8String]);
        sub_100134750(&v16, (char *)[v5 UTF8String]);
        sub_10151F9B0(&v17, &v16, (std::string *)&__str);
        sub_1000B6DC8((uint64_t)retstr, (long long *)&__str);
        if (v33 < 0) {
          operator delete(__p);
        }
        if (v31 < 0) {
          operator delete(v30);
        }
        if (v29 < 0) {
          operator delete(v28);
        }
        if (v27 < 0) {
          operator delete(v26);
        }
        if (v25 < 0) {
          operator delete(v24);
        }
        if (v23 < 0) {
          operator delete(*(void **)&__str_20[4]);
        }
        if ((__str_20[3] & 0x80000000) != 0) {
          operator delete((void *)__str);
        }
        if ((SHIBYTE(v16.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
          goto LABEL_62;
        }
        v9 = (void *)v16.__r_.__value_.__r.__words[0];
LABEL_61:
        operator delete(v9);
LABEL_62:
        if ((SHIBYTE(v17.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
          goto LABEL_65;
        }
        char v12 = (void *)v17.__r_.__value_.__r.__words[0];
        goto LABEL_64;
      }
      sub_100134750(&v17, (char *)[v8 UTF8String]);
      sub_1000B6F5C(&v17, (uint64_t)&__str);
LABEL_47:
      sub_1000B6DC8((uint64_t)retstr, (long long *)&__str);
      if (v33 < 0) {
        operator delete(__p);
      }
      if (v31 < 0) {
        operator delete(v30);
      }
      if (v29 < 0) {
        operator delete(v28);
      }
      if (v27 < 0) {
        operator delete(v26);
      }
      if (v25 < 0) {
        operator delete(v24);
      }
      if (v23 < 0) {
        operator delete(*(void **)&__str_20[4]);
      }
      if ((__str_20[3] & 0x80000000) == 0) {
        goto LABEL_62;
      }
      v9 = (void *)__str;
      goto LABEL_61;
    }
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_10230B008);
    }
    uint64_t v13 = qword_102419538;
    if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_FAULT))
    {
      uint64_t __str = 68289282;
      __int16 __str_8 = 2082;
      __str_10 = "";
      __int16 __str_18 = 2114;
      *(void *)__str_20 = v2;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#CLCKP creating Name from ckp which has SubIdentityTypeNestedBundlePath, but empty subId\", \"CKP\":%{public, location:escape_only}@}", (uint8_t *)&__str, 0x1Cu);
      if (qword_102419530 != -1) {
        dispatch_once(&qword_102419530, &stru_10230B008);
      }
    }
    char v14 = qword_102419538;
    if (os_signpost_enabled((os_log_t)qword_102419538))
    {
      uint64_t __str = 68289282;
      __int16 __str_8 = 2082;
      __str_10 = "";
      __int16 __str_18 = 2114;
      *(void *)__str_20 = v2;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v14, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#CLCKP creating Name from ckp which has SubIdentityTypeNestedBundlePath, but empty subId", "{\"msg%{public}.0s\":\"#CLCKP creating Name from ckp which has SubIdentityTypeNestedBundlePath, but empty subId\", \"CKP\":%{public, location:escape_only}@}", (uint8_t *)&__str, 0x1Cu);
    }
    goto LABEL_65;
  }
LABEL_23:
  switch(v4)
  {
    case 'e':
      sub_100134750(&__str, (char *)[v5 UTF8String]);
      std::string::operator=((std::string *)&retstr->fUserName.__r_.var0, (const std::string *)&__str);
      if ((__str_20[3] & 0x80000000) == 0) {
        goto LABEL_65;
      }
      char v12 = (void *)__str;
LABEL_64:
      operator delete(v12);
      goto LABEL_65;
    case 'p':
      sub_100134750(&v17, (char *)[v5 UTF8String]);
      sub_1000B6F5C(&v17, (uint64_t)&__str);
      goto LABEL_47;
    case 'i':
      sub_100134750(&v17, (char *)[v5 UTF8String]);
      sub_1000B7144(&v17, (uint64_t)&__str);
      goto LABEL_47;
  }
  if (qword_102419530 != -1) {
    dispatch_once(&qword_102419530, &stru_10230B008);
  }
  char v10 = qword_102419538;
  if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t __str = 68289282;
    __int16 __str_8 = 2082;
    __str_10 = "";
    __int16 __str_18 = 2114;
    *(void *)__str_20 = v2;
    v11 = "{\"msg%{public}.0s\":\"#Warning #CLCKP creating Name from CKP without valid anchor type. The resulting Name wi"
          "ll have the following client key: 'com.apple.locationd.executable-'\", \"CKP\":%{public, location:escape_only}@}";
    goto LABEL_38;
  }
LABEL_65:
  result = (Name *)_os_feature_enabled_impl();
  if (result)
  {
    sub_100134750(&__str, (char *)[v2 userName]);
    result = (Name *)sub_1001A5B7C((std::string *)retstr, (const std::string *)&__str);
    if ((__str_20[3] & 0x80000000) != 0) {
      operator delete((void *)__str);
    }
  }
  return result;
}

- (NSString)bundleId
{
  uint64_t v3 = [(CLClientKeyPath *)self findComponent:1];
  if (*v3 != 105) {
    return 0;
  }

  return (NSString *)[(CLClientKeyPath *)self extractComponentFromCharPtr:v3 + 1];
}

- (CLClientKeyPath)limitingCKP
{
  uint64_t v3 = [(CLClientKeyPath *)self findComponent:1];
  if (*v3 != 108) {
    return 0;
  }
  id v4 = [(CLClientKeyPath *)self extractComponentFromCharPtr:v3 + 1];
  id v5 = [(CLClientKeyPath *)self userName];

  return +[CLClientKeyPath clientKeyPathWithUserName:v5 clientAnchor:v4 anchorType:105];
}

- (NSString)legacyClientKey
{
  uint64_t v3 = [(CLClientKeyPath *)self userName];
  id v4 = [(CLClientKeyPath *)self findComponent:1];
  int v5 = *v4;
  uint64_t v6 = [(CLClientKeyPath *)self extractComponentFromCharPtr:v4 + 1];
  int v7 = [(CLClientKeyPath *)self findComponent:2];
  if (v7)
  {
    id v8 = v7;
    v9 = [(CLClientKeyPath *)self extractComponentFromCharPtr:v7 + 1];
    int v10 = *v8;
    switch(v10)
    {
      case 'e':
        v11 = &off_10232C308;
        goto LABEL_11;
      case 'i':
        goto LABEL_16;
      case 'p':
        v11 = &off_10232C310;
LABEL_11:
        uint64_t v13 = +[NSString stringWithFormat:@"%s%@", *v11, v9];
LABEL_15:
        v9 = v13;
LABEL_16:
        if (!v3) {
          return v9;
        }
        goto LABEL_17;
    }
  }
  switch(v5)
  {
    case '!':
      uint64_t v13 = +[NSString stringWithUTF8String:"com.apple.locationd.executable-"];
      goto LABEL_15;
    case 'e':
      char v12 = &off_10232C308;
      goto LABEL_14;
    case 'p':
      char v12 = &off_10232C310;
LABEL_14:
      uint64_t v13 = +[NSString stringWithFormat:@"%s%@", *v12, v6];
      goto LABEL_15;
  }
  v9 = v6;
  if (!v3) {
    return v9;
  }
LABEL_17:
  sub_100105D0C(__p);
  if (v17 >= 0) {
    char v14 = __p;
  }
  else {
    char v14 = (void **)__p[0];
  }
  v9 = +[NSString stringWithFormat:@"%@%s%@", v3, v14, v9];
  if (v17 < 0) {
    operator delete(__p[0]);
  }
  return v9;
}

- (NSString)userName
{
  if (!_os_feature_enabled_impl()) {
    return 0;
  }
  uint64_t v3 = [(CLClientKeyPath *)self findComponent:0];

  return (NSString *)[(CLClientKeyPath *)self extractComponentFromCharPtr:v3];
}

- (basic_string<char,)cppClientKey
{
  v2 = v1;
  id v4 = [v1 findComponent:2];
  if (v4 && (int v5 = v4, *v4 == 119))
  {
    unsigned char *v4 = 0;
    result = (basic_string<char, std::char_traits<char>, std::allocator<char>> *)sub_100134750(retstr, v2 + 8);
    *int v5 = 119;
  }
  else
  {
    return (basic_string<char, std::char_traits<char>, std::allocator<char>> *)sub_100134750(retstr, v2 + 8);
  }
  return result;
}

+ (CLClientKeyPath)clientKeyPathWithLegacyClientKey:(id)a3
{
  sub_100105D0C(__p);
  if (v17 >= 0) {
    id v4 = __p;
  }
  else {
    id v4 = (void **)__p[0];
  }
  id v5 = [a3 componentsSeparatedByString:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v4)];
  if (v17 < 0) {
    operator delete(__p[0]);
  }
  int v6 = _os_feature_enabled_impl();
  id v7 = [v5 count];
  if (!v6)
  {
    if (v7 == (id)1)
    {
      if (objc_msgSend(objc_msgSend(v5, "objectAtIndexedSubscript:", 0), "length"))
      {
        id v9 = [v5 objectAtIndexedSubscript:0];
        id v8 = 0;
      }
      else
      {
        id v8 = 0;
        id v9 = 0;
      }
      goto LABEL_19;
    }
    goto LABEL_27;
  }
  if (v7 != (id)2)
  {
    sub_101A9CDC4(a3);
LABEL_27:
    sub_101A9CF38(a3);
LABEL_28:
    v15 = (_Unwind_Exception *)sub_101A9CC50(a3);
    if (v17 < 0) {
      operator delete(__p[0]);
    }
    _Unwind_Resume(v15);
  }
  if (objc_msgSend(objc_msgSend(v5, "objectAtIndexedSubscript:", 0), "length")) {
    id v8 = [v5 objectAtIndexedSubscript:0];
  }
  else {
    id v8 = 0;
  }
  if (objc_msgSend(objc_msgSend(v5, "objectAtIndexedSubscript:", 1), "length")) {
    id v9 = [v5 objectAtIndexedSubscript:1];
  }
  else {
    id v9 = 0;
  }
  if (!sub_101004E8C((BOOL)v8)) {
    goto LABEL_28;
  }
LABEL_19:
  if (objc_msgSend(v9, "hasPrefix:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "com.apple.locationd.bundle-")))
  {
    int v10 = +[NSString stringWithUTF8String:"com.apple.locationd.bundle-"];
    uint64_t v11 = 112;
  }
  else
  {
    if (!objc_msgSend(v9, "hasPrefix:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "com.apple.locationd.executable-")))
    {
      uint64_t v11 = 105;
      return +[CLClientKeyPath clientKeyPathWithUserName:v8 clientAnchor:v9 anchorType:v11];
    }
    int v10 = +[NSString stringWithUTF8String:"com.apple.locationd.executable-"];
    uint64_t v11 = 101;
  }
  char v12 = (char *)[v9 rangeOfString:v10];
  id v9 = [v9 substringFromIndex:&v12[v13]];
  return +[CLClientKeyPath clientKeyPathWithUserName:v8 clientAnchor:v9 anchorType:v11];
}

- (char)subIdentityType
{
  v2 = [(CLClientKeyPath *)self findComponent:2];
  if (v2) {
    return *v2;
  }
  else {
    return 33;
  }
}

- (id)description
{
  return +[NSString stringWithUTF8String:self->_buffer];
}

- (BOOL)isValidCKP
{
  return +[CLClientKeyPath nullClientKeyPath] != self;
}

+ (id)nullClientKeyPath
{
  if (qword_1024828C0 != -1) {
    dispatch_once(&qword_1024828C0, &stru_10230AFA8);
  }
  return (id)qword_1024828B8;
}

- (id)extractComponentFromCharPtr:(char *)a3
{
  id v4 = strchr(a3, 58);
  if (!v4)
  {
    size_t v5 = strlen(a3);
    if (v5) {
      goto LABEL_3;
    }
    return 0;
  }
  size_t v5 = v4 - a3;
  if (v4 == a3) {
    return 0;
  }
LABEL_3:
  id v6 = [objc_alloc((Class)NSString) initWithBytes:a3 length:v5 encoding:4];

  return v6;
}

- (NSString)clientAnchor
{
  uint64_t v3 = [(CLClientKeyPath *)self findComponent:1] + 1;

  return (NSString *)[(CLClientKeyPath *)self extractComponentFromCharPtr:v3];
}

- (NSString)subIdentityId
{
  result = [(CLClientKeyPath *)self findComponent:2];
  if (result)
  {
    return (NSString *)[(CLClientKeyPath *)self extractComponentFromCharPtr:(char *)result + 1];
  }
  return result;
}

- (BOOL)isAuthLimited
{
  return *[(CLClientKeyPath *)self findComponent:1] == 108;
}

- (NSString)clientKey
{
  uint64_t v3 = [(CLClientKeyPath *)self findComponent:2];
  if (v3 && (id v4 = v3, *v3 == 119))
  {
    *uint64_t v3 = 0;
    result = +[NSString stringWithUTF8String:self->_buffer];
    char *v4 = 119;
  }
  else
  {
    return +[NSString stringWithUTF8String:self->_buffer];
  }
  return result;
}

- (BOOL)isAuthSharingSubIdentity
{
  if (*[(CLClientKeyPath *)self findComponent:1] == 108) {
    goto LABEL_5;
  }
  uint64_t v3 = [(CLClientKeyPath *)self findComponent:2];
  if (v3)
  {
    unsigned int v4 = *v3 - 101;
    if (v4 <= 0xB)
    {
      LODWORD(v3) = (0x811u >> v4) & 1;
      return (char)v3;
    }
LABEL_5:
    LOBYTE(v3) = 0;
  }
  return (char)v3;
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self) {
    return 1;
  }
  uint64_t v20 = v7;
  uint64_t v21 = v5;
  uint64_t v22 = v4;
  uint64_t v23 = v3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  uint64_t v13 = [(CLClientKeyPath *)self findComponent:2];
  char v14 = v13;
  if (v13 && *v13 == 119)
  {
    char *v13 = 0;
    int v15 = 1;
  }
  else
  {
    int v15 = 0;
  }
  char v17 = [a3 findComponent:2 v8, v20, v6, v21, v22, v23, v9, v10];
  char v18 = v17;
  if (v17 && *v17 == 119)
  {
    *char v17 = 0;
    int v19 = 1;
  }
  else
  {
    int v19 = 0;
  }
  BOOL result = strcmp(self->_buffer, (const char *)a3 + 8) == 0;
  if (v15) {
    *char v14 = 119;
  }
  if (v19) {
    *char v18 = 119;
  }
  return result;
}

- (char)findComponent:(int)a3
{
  if (_os_feature_enabled_impl())
  {
    int v6 = 0;
  }
  else
  {
    if (!a3)
    {
      sub_101A9CAE4(self);
LABEL_19:
      dispatch_once(&qword_102419530, &stru_10230B008);
      goto LABEL_12;
    }
    int v6 = 1;
  }
  BOOL result = self->_buffer;
  BOOL v8 = __OFSUB__(a3, v6);
  int v9 = a3 - v6;
  if ((v9 < 0) ^ v8 | (v9 == 0))
  {
LABEL_8:
    if (!*result) {
      return 0;
    }
    return result;
  }
  while (1)
  {
    uint64_t v10 = strchr(result, 58);
    if (!v10) {
      break;
    }
    BOOL result = v10 + 1;
    if (!--v9) {
      goto LABEL_8;
    }
  }
  uint64_t v3 = &qword_102419000;
  if (qword_102419530 != -1) {
    goto LABEL_19;
  }
LABEL_12:
  uint64_t v11 = qword_102419538;
  if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_ERROR))
  {
    int v13 = 68289282;
    int v14 = 0;
    __int16 v15 = 2082;
    std::string v16 = "";
    __int16 v17 = 2114;
    char v18 = self;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#Warning CLCKP with an incorrect number of components\", \"CKP\":%{public, location:escape_only}@}", (uint8_t *)&v13, 0x1Cu);
    if (v3[166] != -1) {
      dispatch_once(&qword_102419530, &stru_10230B008);
    }
  }
  char v12 = qword_102419538;
  if (os_signpost_enabled((os_log_t)qword_102419538))
  {
    int v13 = 68289282;
    int v14 = 0;
    __int16 v15 = 2082;
    std::string v16 = "";
    __int16 v17 = 2114;
    char v18 = self;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v12, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#Warning CLCKP with an incorrect number of components", "{\"msg%{public}.0s\":\"#Warning CLCKP with an incorrect number of components\", \"CKP\":%{public, location:escape_only}@}", (uint8_t *)&v13, 0x1Cu);
  }
  return 0;
}

+ (CLClientKeyPath)clientKeyPathWithClientKey:(id)a3
{
  if (objc_msgSend(a3, "isEqualToString:", objc_msgSend(+[CLClientKeyPath nullClientKeyPath](CLClientKeyPath, "nullClientKeyPath"), "clientKey")))
  {
    return (CLClientKeyPath *)+[CLClientKeyPath nullClientKeyPath];
  }
  id v5 = [a3 componentsSeparatedByString:+[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%c", 58)];
  int v6 = _os_feature_enabled_impl();
  id v7 = [v5 count];
  if (!v6)
  {
    if (v7 == (id)2)
    {
      if (objc_msgSend(objc_msgSend(v5, "objectAtIndexedSubscript:", 0), "length")) {
        id v9 = [v5 objectAtIndexedSubscript:0];
      }
      else {
        id v9 = 0;
      }
      uint64_t v11 = 1;
      id v8 = 0;
      id v12 = 0;
      uint64_t v13 = 2;
      if (!objc_msgSend(objc_msgSend(v5, "objectAtIndexedSubscript:", 1), "length"))
      {
LABEL_25:
        if (v9) {
          goto LABEL_26;
        }
LABEL_29:
        signed __int8 v14 = 33;
        if (v12) {
          goto LABEL_27;
        }
        goto LABEL_30;
      }
LABEL_24:
      id v12 = [v5 objectAtIndexedSubscript:v11];
      goto LABEL_25;
    }
    uint64_t v10 = 2;
LABEL_14:
    if ((id)v10 == [v5 count]) {
      goto LABEL_45;
    }
LABEL_41:
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_10230B008);
    }
    __int16 v17 = qword_102419538;
    if (!os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT)) {
      return (CLClientKeyPath *)+[CLClientKeyPath nullClientKeyPath];
    }
    *(_DWORD *)buf = 68289282;
    int v20 = 0;
    __int16 v21 = 2082;
    uint64_t v22 = "";
    __int16 v23 = 2114;
    id v24 = a3;
    char v18 = "{\"msg%{public}.0s\":\"#Warning creating #CLCKP from clientKey with incorrect number of components. Returning "
          "nullCKP\", \"clientKey\":%{public, location:escape_only}@}";
    goto LABEL_49;
  }
  if (v7 != (id)3)
  {
    uint64_t v10 = 3;
    goto LABEL_14;
  }
  if (objc_msgSend(objc_msgSend(v5, "objectAtIndexedSubscript:", 0), "length")) {
    id v8 = [v5 objectAtIndexedSubscript:0];
  }
  else {
    id v8 = 0;
  }
  if (objc_msgSend(objc_msgSend(v5, "objectAtIndexedSubscript:", 1), "length")) {
    id v9 = [v5 objectAtIndexedSubscript:1];
  }
  else {
    id v9 = 0;
  }
  uint64_t v11 = 2;
  uint64_t v13 = 3;
  if (objc_msgSend(objc_msgSend(v5, "objectAtIndexedSubscript:", 2), "length")) {
    goto LABEL_24;
  }
  id v12 = 0;
  if (!v9) {
    goto LABEL_29;
  }
LABEL_26:
  signed __int8 v14 = [v9 characterAtIndex:0];
  id v9 = [v9 substringFromIndex:1];
  if (v12)
  {
LABEL_27:
    signed __int8 v15 = [v12 characterAtIndex:0];
    id v12 = [v12 substringFromIndex:1];
    goto LABEL_31;
  }
LABEL_30:
  signed __int8 v15 = 33;
LABEL_31:
  if ((id)v13 != [v5 count]) {
    goto LABEL_41;
  }
  if (!v9)
  {
LABEL_45:
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_10230B008);
    }
    __int16 v17 = qword_102419538;
    if (!os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT)) {
      return (CLClientKeyPath *)+[CLClientKeyPath nullClientKeyPath];
    }
    *(_DWORD *)buf = 68289282;
    int v20 = 0;
    __int16 v21 = 2082;
    uint64_t v22 = "";
    __int16 v23 = 2114;
    id v24 = a3;
    char v18 = "{\"msg%{public}.0s\":\"#Warning creating #CLCKP from clientKey with nil anchor. Returning nullCKP\", \"clientK"
          "ey\":%{public, location:escape_only}@}";
    goto LABEL_49;
  }
  unsigned int v16 = v14 - 101;
  if (v16 > 0xB || ((1 << v16) & 0x891) == 0)
  {
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_10230B008);
    }
    __int16 v17 = qword_102419538;
    if (!os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT)) {
      return (CLClientKeyPath *)+[CLClientKeyPath nullClientKeyPath];
    }
    *(_DWORD *)buf = 68289282;
    int v20 = 0;
    __int16 v21 = 2082;
    uint64_t v22 = "";
    __int16 v23 = 2114;
    id v24 = a3;
    char v18 = "{\"msg%{public}.0s\":\"#Warning creating #CLCKP from clientKey with invalid anchor type. Returning nullCKP\", "
          "\"clientKey\":%{public, location:escape_only}@}";
    goto LABEL_49;
  }
  if (v12 && ((v15 - 101) > 0x15 || ((1 << (v15 - 101)) & 0x240811) == 0))
  {
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_10230B008);
    }
    __int16 v17 = qword_102419538;
    if (!os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT)) {
      return (CLClientKeyPath *)+[CLClientKeyPath nullClientKeyPath];
    }
    *(_DWORD *)buf = 68289282;
    int v20 = 0;
    __int16 v21 = 2082;
    uint64_t v22 = "";
    __int16 v23 = 2114;
    id v24 = a3;
    char v18 = "{\"msg%{public}.0s\":\"#Warning creating #CLCKP from clientKey with invalid subIdentity type. Returning nullCK"
          "P\", \"clientKey\":%{public, location:escape_only}@}";
LABEL_49:
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, v18, buf, 0x1Cu);
    return (CLClientKeyPath *)+[CLClientKeyPath nullClientKeyPath];
  }

  return +[CLClientKeyPath clientKeyPathWithUserName:clientAnchor:anchorType:subIdentityId:subIdentityType:](CLClientKeyPath, "clientKeyPathWithUserName:clientAnchor:anchorType:subIdentityId:subIdentityType:", v8, v9);
}

+ (CLClientKeyPath)clientKeyPathWithUserName:(id)a3 clientAnchor:(id)a4 anchorType:(char)a5 subIdentityId:(id)a6 subIdentityType:(char)a7
{
  int v8 = a7;
  LODWORD(v10) = a5;
  if (a4)
  {
    id v12 = a4;
    if ((a5 - 101) > 0xB || ((1 << (a5 - 101)) & 0x891) == 0)
    {
      if (qword_102419530 != -1) {
        dispatch_once(&qword_102419530, &stru_10230B008);
      }
      id v7 = &qword_102419000;
      v47 = qword_102419538;
      if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 68290819;
        int v56 = 0;
        __int16 v57 = 2082;
        v58 = "";
        __int16 v59 = 2114;
        id v60 = a3;
        __int16 v61 = 2114;
        v62 = v12;
        __int16 v63 = 2050;
        uint64_t v64 = (int)v10;
        __int16 v65 = 2114;
        id v66 = a6;
        __int16 v67 = 2050;
        uint64_t v68 = v8;
        __int16 v69 = 2082;
        v70 = "assert";
        __int16 v71 = 2081;
        v72 = "validateCKPAnchorType(anchorType)";
        _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#CLCKP anchorType must be valid\", \"userName\":%{public, location:escape_only}@, \"clientAnchor\":%{public, location:escape_only}@, \"anchorType\":%{public, location:CLClientKeyAnchorType}lld, \"subIdentityId\":%{public, location:escape_only}@, \"subIdentityType\":%{public, location:CLClientKeySubIdentityType}lld, \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x58u);
        if (qword_102419530 != -1) {
          dispatch_once(&qword_102419530, &stru_10230B008);
        }
      }
      v48 = qword_102419538;
      if (os_signpost_enabled((os_log_t)qword_102419538))
      {
        *(_DWORD *)buf = 68290819;
        int v56 = 0;
        __int16 v57 = 2082;
        v58 = "";
        __int16 v59 = 2114;
        id v60 = a3;
        __int16 v61 = 2114;
        v62 = v12;
        __int16 v63 = 2050;
        uint64_t v64 = (int)v10;
        __int16 v65 = 2114;
        id v66 = a6;
        __int16 v67 = 2050;
        uint64_t v68 = v8;
        __int16 v69 = 2082;
        v70 = "assert";
        __int16 v71 = 2081;
        v72 = "validateCKPAnchorType(anchorType)";
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v48, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#CLCKP anchorType must be valid", "{\"msg%{public}.0s\":\"#CLCKP anchorType must be valid\", \"userName\":%{public, location:escape_only}@, \"clientAnchor\":%{public, location:escape_only}@, \"anchorType\":%{public, location:CLClientKeyAnchorType}lld, \"subIdentityId\":%{public, location:escape_only}@, \"subIdentityType\":%{public, location:CLClientKeySubIdentityType}lld, \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x58u);
        if (qword_102419530 != -1) {
          dispatch_once(&qword_102419530, &stru_10230B008);
        }
      }
      v49 = qword_102419538;
      if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 68290819;
        int v56 = 0;
        __int16 v57 = 2082;
        v58 = "";
        __int16 v59 = 2114;
        id v60 = a3;
        __int16 v61 = 2114;
        v62 = v12;
        __int16 v63 = 2050;
        uint64_t v64 = (int)v10;
        __int16 v65 = 2114;
        id v66 = a6;
        __int16 v67 = 2050;
        uint64_t v68 = v8;
        __int16 v69 = 2082;
        v70 = "assert";
        __int16 v71 = 2081;
        v72 = "validateCKPAnchorType(anchorType)";
        _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"#CLCKP anchorType must be valid\", \"userName\":%{public, location:escape_only}@, \"clientAnchor\":%{public, location:escape_only}@, \"anchorType\":%{public, location:CLClientKeyAnchorType}lld, \"subIdentityId\":%{public, location:escape_only}@, \"subIdentityType\":%{public, location:CLClientKeySubIdentityType}lld, \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x58u);
      }
      v52 = "+[CLClientKeyPath clientKeyPathWithUserName:clientAnchor:anchorType:subIdentityId:subIdentityType:]";
      uint64_t v36 = 214;
      goto LABEL_112;
    }
    if (a5 == 108 && a7 != 112)
    {
      if (qword_102419530 != -1) {
        dispatch_once(&qword_102419530, &stru_10230B008);
      }
      v40 = qword_102419538;
      id v7 = (uint64_t *)"";
      if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 68290819;
        int v56 = 0;
        __int16 v57 = 2082;
        v58 = "";
        __int16 v59 = 2114;
        id v60 = a3;
        __int16 v61 = 2114;
        v62 = v12;
        __int16 v63 = 2050;
        uint64_t v64 = 108;
        __int16 v65 = 2114;
        id v66 = a6;
        __int16 v67 = 2050;
        uint64_t v68 = v8;
        __int16 v69 = 2082;
        v70 = "assert";
        __int16 v71 = 2081;
        v72 = "subIdentityType == kSubIdentityTypeNestedBundlePath";
        _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#CLCKP LimitingBundleId anchors must have a subIdentity of type kSubIdentityTypeNestedBundlePath\", \"userName\":%{public, location:escape_only}@, \"clientAnchor\":%{public, location:escape_only}@, \"anchorType\":%{public, location:CLClientKeyAnchorType}lld, \"subIdentityId\":%{public, location:escape_only}@, \"subIdentityType\":%{public, location:CLClientKeySubIdentityType}lld, \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x58u);
        if (qword_102419530 != -1) {
          dispatch_once(&qword_102419530, &stru_10230B008);
        }
      }
      v41 = qword_102419538;
      if (os_signpost_enabled((os_log_t)qword_102419538))
      {
        *(_DWORD *)buf = 68290819;
        int v56 = 0;
        __int16 v57 = 2082;
        v58 = "";
        __int16 v59 = 2114;
        id v60 = a3;
        __int16 v61 = 2114;
        v62 = v12;
        __int16 v63 = 2050;
        uint64_t v64 = 108;
        __int16 v65 = 2114;
        id v66 = a6;
        __int16 v67 = 2050;
        uint64_t v68 = v8;
        __int16 v69 = 2082;
        v70 = "assert";
        __int16 v71 = 2081;
        v72 = "subIdentityType == kSubIdentityTypeNestedBundlePath";
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v41, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#CLCKP LimitingBundleId anchors must have a subIdentity of type kSubIdentityTypeNestedBundlePath", "{\"msg%{public}.0s\":\"#CLCKP LimitingBundleId anchors must have a subIdentity of type kSubIdentityTypeNestedBundlePath\", \"userName\":%{public, location:escape_only}@, \"clientAnchor\":%{public, location:escape_only}@, \"anchorType\":%{public, location:CLClientKeyAnchorType}lld, \"subIdentityId\":%{public, location:escape_only}@, \"subIdentityType\":%{public, location:CLClientKeySubIdentityType}lld, \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x58u);
        if (qword_102419530 != -1) {
          dispatch_once(&qword_102419530, &stru_10230B008);
        }
      }
      uint64_t v10 = qword_102419538;
      if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 68290819;
        int v56 = 0;
        __int16 v57 = 2082;
        v58 = "";
        __int16 v59 = 2114;
        id v60 = a3;
        __int16 v61 = 2114;
        v62 = v12;
        __int16 v63 = 2050;
        uint64_t v64 = 108;
        __int16 v65 = 2114;
        id v66 = a6;
        __int16 v67 = 2050;
        uint64_t v68 = v8;
        __int16 v69 = 2082;
        v70 = "assert";
        __int16 v71 = 2081;
        v72 = "subIdentityType == kSubIdentityTypeNestedBundlePath";
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"#CLCKP LimitingBundleId anchors must have a subIdentity of type kSubIdentityTypeNestedBundlePath\", \"userName\":%{public, location:escape_only}@, \"clientAnchor\":%{public, location:escape_only}@, \"anchorType\":%{public, location:CLClientKeyAnchorType}lld, \"subIdentityId\":%{public, location:escape_only}@, \"subIdentityType\":%{public, location:CLClientKeySubIdentityType}lld, \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x58u);
      }
      v52 = "+[CLClientKeyPath clientKeyPathWithUserName:clientAnchor:anchorType:subIdentityId:subIdentityType:]";
      uint64_t v36 = 216;
      goto LABEL_112;
    }
    if (a6 && ((a7 - 101) > 0x15 || ((1 << (a7 - 101)) & 0x240811) == 0))
    {
      if (qword_102419530 != -1) {
        dispatch_once(&qword_102419530, &stru_10230B008);
      }
      id v7 = &qword_102419000;
      v37 = qword_102419538;
      if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 68290819;
        int v56 = 0;
        __int16 v57 = 2082;
        v58 = "";
        __int16 v59 = 2114;
        id v60 = a3;
        __int16 v61 = 2114;
        v62 = v12;
        __int16 v63 = 2050;
        uint64_t v64 = (int)v10;
        __int16 v65 = 2114;
        id v66 = a6;
        __int16 v67 = 2050;
        uint64_t v68 = v8;
        __int16 v69 = 2082;
        v70 = "assert";
        __int16 v71 = 2081;
        v72 = "validateCKPSubIdentityType(subIdentityType)";
        _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#CLCKP subIdentityType must be valid\", \"userName\":%{public, location:escape_only}@, \"clientAnchor\":%{public, location:escape_only}@, \"anchorType\":%{public, location:CLClientKeyAnchorType}lld, \"subIdentityId\":%{public, location:escape_only}@, \"subIdentityType\":%{public, location:CLClientKeySubIdentityType}lld, \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x58u);
        if (qword_102419530 != -1) {
          dispatch_once(&qword_102419530, &stru_10230B008);
        }
      }
      v38 = qword_102419538;
      if (os_signpost_enabled((os_log_t)qword_102419538))
      {
        *(_DWORD *)buf = 68290819;
        int v56 = 0;
        __int16 v57 = 2082;
        v58 = "";
        __int16 v59 = 2114;
        id v60 = a3;
        __int16 v61 = 2114;
        v62 = v12;
        __int16 v63 = 2050;
        uint64_t v64 = (int)v10;
        __int16 v65 = 2114;
        id v66 = a6;
        __int16 v67 = 2050;
        uint64_t v68 = v8;
        __int16 v69 = 2082;
        v70 = "assert";
        __int16 v71 = 2081;
        v72 = "validateCKPSubIdentityType(subIdentityType)";
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v38, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#CLCKP subIdentityType must be valid", "{\"msg%{public}.0s\":\"#CLCKP subIdentityType must be valid\", \"userName\":%{public, location:escape_only}@, \"clientAnchor\":%{public, location:escape_only}@, \"anchorType\":%{public, location:CLClientKeyAnchorType}lld, \"subIdentityId\":%{public, location:escape_only}@, \"subIdentityType\":%{public, location:CLClientKeySubIdentityType}lld, \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x58u);
        if (qword_102419530 != -1) {
          dispatch_once(&qword_102419530, &stru_10230B008);
        }
      }
      v39 = qword_102419538;
      if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 68290819;
        int v56 = 0;
        __int16 v57 = 2082;
        v58 = "";
        __int16 v59 = 2114;
        id v60 = a3;
        __int16 v61 = 2114;
        v62 = v12;
        __int16 v63 = 2050;
        uint64_t v64 = (int)v10;
        __int16 v65 = 2114;
        id v66 = a6;
        __int16 v67 = 2050;
        uint64_t v68 = v8;
        __int16 v69 = 2082;
        v70 = "assert";
        __int16 v71 = 2081;
        v72 = "validateCKPSubIdentityType(subIdentityType)";
        _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"#CLCKP subIdentityType must be valid\", \"userName\":%{public, location:escape_only}@, \"clientAnchor\":%{public, location:escape_only}@, \"anchorType\":%{public, location:CLClientKeyAnchorType}lld, \"subIdentityId\":%{public, location:escape_only}@, \"subIdentityType\":%{public, location:CLClientKeySubIdentityType}lld, \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x58u);
      }
      v52 = "+[CLClientKeyPath clientKeyPathWithUserName:clientAnchor:anchorType:subIdentityId:subIdentityType:]";
      uint64_t v36 = 219;
      goto LABEL_112;
    }
    if (!_os_feature_enabled_impl())
    {
      if (a3)
      {
        id v7 = &qword_102419000;
        if (qword_102419530 == -1) {
          goto LABEL_13;
        }
        goto LABEL_113;
      }
      goto LABEL_19;
    }
    if (!a3)
    {
      if (qword_102419530 != -1) {
        dispatch_once(&qword_102419530, &stru_10230B008);
      }
      v42 = qword_102419538;
      if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 68290819;
        int v56 = 0;
        __int16 v57 = 2082;
        v58 = "";
        __int16 v59 = 2114;
        id v60 = 0;
        __int16 v61 = 2114;
        v62 = v12;
        __int16 v63 = 2050;
        uint64_t v64 = (int)v10;
        __int16 v65 = 2114;
        id v66 = a6;
        __int16 v67 = 2050;
        uint64_t v68 = v8;
        __int16 v69 = 2082;
        v70 = "assert";
        __int16 v71 = 2081;
        v72 = "userName";
        _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#CLCKP initializing on cl_pula enabled devices requires userName\", \"userName\":%{public, location:escape_only}@, \"clientAnchor\":%{public, location:escape_only}@, \"anchorType\":%{public, location:CLClientKeyAnchorType}lld, \"subIdentityId\":%{public, location:escape_only}@, \"subIdentityType\":%{public, location:CLClientKeySubIdentityType}lld, \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x58u);
        if (qword_102419530 != -1) {
          dispatch_once(&qword_102419530, &stru_10230B008);
        }
      }
      v43 = qword_102419538;
      if (os_signpost_enabled((os_log_t)qword_102419538))
      {
        *(_DWORD *)buf = 68290819;
        int v56 = 0;
        __int16 v57 = 2082;
        v58 = "";
        __int16 v59 = 2114;
        id v60 = 0;
        __int16 v61 = 2114;
        v62 = v12;
        __int16 v63 = 2050;
        uint64_t v64 = (int)v10;
        __int16 v65 = 2114;
        id v66 = a6;
        __int16 v67 = 2050;
        uint64_t v68 = v8;
        __int16 v69 = 2082;
        v70 = "assert";
        __int16 v71 = 2081;
        v72 = "userName";
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v43, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#CLCKP initializing on cl_pula enabled devices requires userName", "{\"msg%{public}.0s\":\"#CLCKP initializing on cl_pula enabled devices requires userName\", \"userName\":%{public, location:escape_only}@, \"clientAnchor\":%{public, location:escape_only}@, \"anchorType\":%{public, location:CLClientKeyAnchorType}lld, \"subIdentityId\":%{public, location:escape_only}@, \"subIdentityType\":%{public, location:CLClientKeySubIdentityType}lld, \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x58u);
        if (qword_102419530 != -1) {
          dispatch_once(&qword_102419530, &stru_10230B008);
        }
      }
      a3 = (id)qword_102419538;
      if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 68290819;
        int v56 = 0;
        __int16 v57 = 2082;
        v58 = "";
        __int16 v59 = 2114;
        id v60 = 0;
        __int16 v61 = 2114;
        v62 = v12;
        __int16 v63 = 2050;
        uint64_t v64 = (int)v10;
        __int16 v65 = 2114;
        id v66 = a6;
        __int16 v67 = 2050;
        uint64_t v68 = v8;
        __int16 v69 = 2082;
        v70 = "assert";
        __int16 v71 = 2081;
        v72 = "userName";
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)a3, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"#CLCKP initializing on cl_pula enabled devices requires userName\", \"userName\":%{public, location:escape_only}@, \"clientAnchor\":%{public, location:escape_only}@, \"anchorType\":%{public, location:CLClientKeyAnchorType}lld, \"subIdentityId\":%{public, location:escape_only}@, \"subIdentityType\":%{public, location:CLClientKeySubIdentityType}lld, \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x58u);
      }
      v52 = "+[CLClientKeyPath clientKeyPathWithUserName:clientAnchor:anchorType:subIdentityId:subIdentityType:]";
      uint64_t v36 = 225;
      goto LABEL_112;
    }
    if (sub_101004E8C((BOOL)a3))
    {
      uint64_t v13 = (char *)[a3 length];
      uint64_t v14 = 2;
      goto LABEL_20;
    }
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_10230B008);
    }
    uint64_t v26 = qword_102419538;
    if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289794;
      int v56 = 0;
      __int16 v57 = 2082;
      v58 = "";
      __int16 v59 = 2114;
      id v60 = a3;
      __int16 v61 = 2114;
      v62 = v12;
      __int16 v63 = 2114;
      uint64_t v64 = (uint64_t)a6;
      __int16 v23 = "{\"msg%{public}.0s\":\"#warning CLCKP initializing with invalid user UUID. returning nullCKP\", \"userName\""
            ":%{public, location:escape_only}@, \"Anchor\":%{public, location:escape_only}@, \"SubId\":%{public, location:escape_only}@}";
      id v24 = v26;
      uint32_t v25 = 48;
LABEL_35:
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, v23, buf, v25);
    }
  }
  else
  {
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_10230B008);
    }
    v34 = qword_102419538;
    if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68290819;
      int v56 = 0;
      __int16 v57 = 2082;
      v58 = "";
      __int16 v59 = 2114;
      id v60 = a3;
      __int16 v61 = 2114;
      v62 = 0;
      __int16 v63 = 2050;
      uint64_t v64 = (int)v10;
      __int16 v65 = 2114;
      id v66 = a6;
      __int16 v67 = 2050;
      uint64_t v68 = v8;
      __int16 v69 = 2082;
      v70 = "assert";
      __int16 v71 = 2081;
      v72 = "clientAnchor";
      _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#CLCKP initialization must include anchor\", \"userName\":%{public, location:escape_only}@, \"clientAnchor\":%{public, location:escape_only}@, \"anchorType\":%{public, location:CLClientKeyAnchorType}lld, \"subIdentityId\":%{public, location:escape_only}@, \"subIdentityType\":%{public, location:CLClientKeySubIdentityType}lld, \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x58u);
      if (qword_102419530 != -1) {
        dispatch_once(&qword_102419530, &stru_10230B008);
      }
    }
    v35 = qword_102419538;
    if (os_signpost_enabled((os_log_t)qword_102419538))
    {
      *(_DWORD *)buf = 68290819;
      int v56 = 0;
      __int16 v57 = 2082;
      v58 = "";
      __int16 v59 = 2114;
      id v60 = a3;
      __int16 v61 = 2114;
      v62 = 0;
      __int16 v63 = 2050;
      uint64_t v64 = (int)v10;
      __int16 v65 = 2114;
      id v66 = a6;
      __int16 v67 = 2050;
      uint64_t v68 = v8;
      __int16 v69 = 2082;
      v70 = "assert";
      __int16 v71 = 2081;
      v72 = "clientAnchor";
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v35, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#CLCKP initialization must include anchor", "{\"msg%{public}.0s\":\"#CLCKP initialization must include anchor\", \"userName\":%{public, location:escape_only}@, \"clientAnchor\":%{public, location:escape_only}@, \"anchorType\":%{public, location:CLClientKeyAnchorType}lld, \"subIdentityId\":%{public, location:escape_only}@, \"subIdentityType\":%{public, location:CLClientKeySubIdentityType}lld, \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x58u);
      if (qword_102419530 != -1) {
        dispatch_once(&qword_102419530, &stru_10230B008);
      }
    }
    id v12 = qword_102419538;
    if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68290819;
      int v56 = 0;
      __int16 v57 = 2082;
      v58 = "";
      __int16 v59 = 2114;
      id v60 = a3;
      __int16 v61 = 2114;
      v62 = 0;
      __int16 v63 = 2050;
      uint64_t v64 = (int)v10;
      __int16 v65 = 2114;
      id v66 = a6;
      __int16 v67 = 2050;
      uint64_t v68 = v8;
      __int16 v69 = 2082;
      v70 = "assert";
      __int16 v71 = 2081;
      v72 = "clientAnchor";
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"#CLCKP initialization must include anchor\", \"userName\":%{public, location:escape_only}@, \"clientAnchor\":%{public, location:escape_only}@, \"anchorType\":%{public, location:CLClientKeyAnchorType}lld, \"subIdentityId\":%{public, location:escape_only}@, \"subIdentityType\":%{public, location:CLClientKeySubIdentityType}lld, \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x58u);
    }
    v52 = "+[CLClientKeyPath clientKeyPathWithUserName:clientAnchor:anchorType:subIdentityId:subIdentityType:]";
    uint64_t v36 = 213;
LABEL_112:
    while (1)
    {
      v50 = "/Library/Caches/com.apple.xbs/Sources/CoreLocation/Daemon/Core/ClientManagement/CLClientKeyPath.mm";
      uint64_t v51 = v36;
      abort_report_np();
LABEL_113:
      dispatch_once(&qword_102419530, &stru_10230B008);
LABEL_13:
      signed __int8 v15 = qword_102419538;
      if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 68290306;
        int v56 = 0;
        __int16 v57 = 2082;
        v58 = "";
        __int16 v59 = 2114;
        id v60 = a3;
        __int16 v61 = 2114;
        v62 = v12;
        __int16 v63 = 2050;
        uint64_t v64 = (int)v10;
        __int16 v65 = 2114;
        id v66 = a6;
        __int16 v67 = 2050;
        uint64_t v68 = v8;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#CLCKP initializing with userName when cl_pula is disabled. Ignoring userName.\", \"userName\":%{public, location:escape_only}@, \"clientAnchor\":%{public, location:escape_only}@, \"anchorType\":%{public, location:CLClientKeyAnchorType}lld, \"subIdentityId\":%{public, location:escape_only}@, \"subIdentityType\":%{public, location:CLClientKeySubIdentityType}lld}", buf, 0x44u);
        if (v7[166] != -1) {
          dispatch_once(&qword_102419530, &stru_10230B008);
        }
      }
      unsigned int v16 = qword_102419538;
      if (os_signpost_enabled((os_log_t)qword_102419538))
      {
        *(_DWORD *)buf = 68290306;
        int v56 = 0;
        __int16 v57 = 2082;
        v58 = "";
        __int16 v59 = 2114;
        id v60 = a3;
        __int16 v61 = 2114;
        v62 = v12;
        __int16 v63 = 2050;
        uint64_t v64 = (int)v10;
        __int16 v65 = 2114;
        id v66 = a6;
        __int16 v67 = 2050;
        uint64_t v68 = v8;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v16, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#CLCKP initializing with userName when cl_pula is disabled. Ignoring userName.", "{\"msg%{public}.0s\":\"#CLCKP initializing with userName when cl_pula is disabled. Ignoring userName.\", \"userName\":%{public, location:escape_only}@, \"clientAnchor\":%{public, location:escape_only}@, \"anchorType\":%{public, location:CLClientKeyAnchorType}lld, \"subIdentityId\":%{public, location:escape_only}@, \"subIdentityType\":%{public, location:CLClientKeySubIdentityType}lld}", buf, 0x44u);
      }
      a3 = 0;
LABEL_19:
      uint64_t v13 = 0;
      uint64_t v14 = 1;
LABEL_20:
      if (![v12 length]) {
        break;
      }
      if (a6) {
        uint64_t v17 = 2;
      }
      else {
        uint64_t v17 = 1;
      }
      id v18 = [v12 length];
      int v19 = &v13[v14 + v17 + (unint64_t)[a6 length] + (void)v18];
      if ((unint64_t)v19 < 0x1F8)
      {
        if ((unint64_t)v19 >= 0x18)
        {
          v28 = off_10229C088;
          char v29 = off_10229C0A0;
          if ((unint64_t)v19 < 0xF8) {
            char v29 = off_10229C090;
          }
          uint64_t v30 = 504;
          if ((unint64_t)v19 < 0xF8) {
            uint64_t v30 = 248;
          }
          if ((unint64_t)v19 < 0x78)
          {
            uint64_t v31 = 120;
          }
          else
          {
            v28 = v29;
            uint64_t v31 = v30;
          }
          BOOL v32 = (unint64_t)v19 >= 0x38;
          if ((unint64_t)v19 >= 0x38) {
            int v20 = v28;
          }
          else {
            int v20 = &off_10229C0A8;
          }
          if (v32) {
            size_t v21 = v31;
          }
          else {
            size_t v21 = 56;
          }
        }
        else
        {
          int v20 = off_10229C098;
          size_t v21 = 24;
        }
        char v27 = (char *)objc_alloc(*v20);
        strcpy((char *)buf, ":");
        __source[0] = (char)v10;
        __source[1] = 0;
        v53[0] = v8;
        v53[1] = 0;
        if (_os_feature_enabled_impl())
        {
          strlcpy(v27 + 8, (const char *)[a3 UTF8String], v21);
          strlcat(v27 + 8, (const char *)buf, v21);
        }
        strlcat(v27 + 8, __source, v21);
        strlcat(v27 + 8, (const char *)[v12 UTF8String], v21);
        strlcat(v27 + 8, (const char *)buf, v21);
        if (a6)
        {
          strlcat(v27 + 8, v53, v21);
          strlcat(v27 + 8, (const char *)[a6 UTF8String], v21);
        }
        return (CLClientKeyPath *)v27;
      }
      id v7 = &qword_102419000;
      if (qword_102419530 != -1) {
        dispatch_once(&qword_102419530, &stru_10230B008);
      }
      v44 = qword_102419538;
      if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 68290819;
        int v56 = 0;
        __int16 v57 = 2082;
        v58 = "";
        __int16 v59 = 2114;
        id v60 = a3;
        __int16 v61 = 2114;
        v62 = v12;
        __int16 v63 = 2050;
        uint64_t v64 = (int)v10;
        __int16 v65 = 2114;
        id v66 = a6;
        __int16 v67 = 2050;
        uint64_t v68 = v8;
        __int16 v69 = 2082;
        v70 = "assert";
        __int16 v71 = 2081;
        v72 = "ckp_length < kClientKeyPathMaxBufferLength";
        _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#CLCKP cannot init with parameters larger than the maximum 512 bytes\", \"userName\":%{public, location:escape_only}@, \"clientAnchor\":%{public, location:escape_only}@, \"anchorType\":%{public, location:CLClientKeyAnchorType}lld, \"subIdentityId\":%{public, location:escape_only}@, \"subIdentityType\":%{public, location:CLClientKeySubIdentityType}lld, \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x58u);
        if (qword_102419530 != -1) {
          dispatch_once(&qword_102419530, &stru_10230B008);
        }
      }
      v45 = qword_102419538;
      if (os_signpost_enabled((os_log_t)qword_102419538))
      {
        *(_DWORD *)buf = 68290819;
        int v56 = 0;
        __int16 v57 = 2082;
        v58 = "";
        __int16 v59 = 2114;
        id v60 = a3;
        __int16 v61 = 2114;
        v62 = v12;
        __int16 v63 = 2050;
        uint64_t v64 = (int)v10;
        __int16 v65 = 2114;
        id v66 = a6;
        __int16 v67 = 2050;
        uint64_t v68 = v8;
        __int16 v69 = 2082;
        v70 = "assert";
        __int16 v71 = 2081;
        v72 = "ckp_length < kClientKeyPathMaxBufferLength";
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v45, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#CLCKP cannot init with parameters larger than the maximum 512 bytes", "{\"msg%{public}.0s\":\"#CLCKP cannot init with parameters larger than the maximum 512 bytes\", \"userName\":%{public, location:escape_only}@, \"clientAnchor\":%{public, location:escape_only}@, \"anchorType\":%{public, location:CLClientKeyAnchorType}lld, \"subIdentityId\":%{public, location:escape_only}@, \"subIdentityType\":%{public, location:CLClientKeySubIdentityType}lld, \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x58u);
        if (qword_102419530 != -1) {
          dispatch_once(&qword_102419530, &stru_10230B008);
        }
      }
      v46 = qword_102419538;
      if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 68290819;
        int v56 = 0;
        __int16 v57 = 2082;
        v58 = "";
        __int16 v59 = 2114;
        id v60 = a3;
        __int16 v61 = 2114;
        v62 = v12;
        __int16 v63 = 2050;
        uint64_t v64 = (int)v10;
        __int16 v65 = 2114;
        id v66 = a6;
        __int16 v67 = 2050;
        uint64_t v68 = v8;
        __int16 v69 = 2082;
        v70 = "assert";
        __int16 v71 = 2081;
        v72 = "ckp_length < kClientKeyPathMaxBufferLength";
        _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"#CLCKP cannot init with parameters larger than the maximum 512 bytes\", \"userName\":%{public, location:escape_only}@, \"clientAnchor\":%{public, location:escape_only}@, \"anchorType\":%{public, location:CLClientKeyAnchorType}lld, \"subIdentityId\":%{public, location:escape_only}@, \"subIdentityType\":%{public, location:CLClientKeySubIdentityType}lld, \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x58u);
      }
      v52 = "+[CLClientKeyPath clientKeyPathWithUserName:clientAnchor:anchorType:subIdentityId:subIdentityType:]";
      uint64_t v36 = 266;
    }
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_10230B008);
    }
    uint64_t v22 = qword_102419538;
    if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68290306;
      int v56 = 0;
      __int16 v57 = 2082;
      v58 = "";
      __int16 v59 = 2114;
      id v60 = a3;
      __int16 v61 = 2114;
      v62 = v12;
      __int16 v63 = 2050;
      uint64_t v64 = (int)v10;
      __int16 v65 = 2114;
      id v66 = a6;
      __int16 v67 = 2050;
      uint64_t v68 = v8;
      __int16 v23 = "{\"msg%{public}.0s\":\"#Warning #CLCKP initialization must include non-empty anchor. Returning nullClientKey"
            "Path\", \"userName\":%{public, location:escape_only}@, \"clientAnchor\":%{public, location:escape_only}@, \""
            "anchorType\":%{public, location:CLClientKeyAnchorType}lld, \"subIdentityId\":%{public, location:escape_only}"
            "@, \"subIdentityType\":%{public, location:CLClientKeySubIdentityType}lld}";
      id v24 = v22;
      uint32_t v25 = 68;
      goto LABEL_35;
    }
  }
  return (CLClientKeyPath *)+[CLClientKeyPath nullClientKeyPath];
}

- (CLClientKeyPath)anchorKeyPath
{
  if ([(CLClientKeyPath *)self isAuthLimited]) {
    return self;
  }
  uint64_t v3 = [(CLClientKeyPath *)self findComponent:2];
  if (!v3) {
    return self;
  }
  id v4 = [objc_alloc((Class)NSString) initWithBytes:self->_buffer length:v3 - self->_buffer encoding:4];

  return +[CLClientKeyPath clientKeyPathWithClientKey:v4];
}

- (NSString)bundlePath
{
  uint64_t v3 = [(CLClientKeyPath *)self findComponent:1];
  if (*v3 != 112) {
    return 0;
  }

  return (NSString *)[(CLClientKeyPath *)self extractComponentFromCharPtr:v3 + 1];
}

+ (CLClientKeyPath)clientKeyPathWithUserName:(id)a3 clientAnchor:(id)a4 anchorType:(char)a5
{
  return +[CLClientKeyPath clientKeyPathWithUserName:a3 clientAnchor:a4 anchorType:a5 subIdentityId:0 subIdentityType:33];
}

- (NSString)nestedBundlePath
{
  uint64_t v3 = [(CLClientKeyPath *)self findComponent:2];
  if (!v3 || *v3 != 112) {
    return 0;
  }

  return (NSString *)[(CLClientKeyPath *)self extractComponentFromCharPtr:v3 + 1];
}

- (unint64_t)hash
{
  LOBYTE(v2) = self->_buffer[0];
  if (!(_BYTE)v2) {
    return 0;
  }
  unint64_t result = 0;
  id v5 = &self->_buffer[1];
  do
  {
    int v6 = v2;
    unint64_t result = 2 * (result + (char)v2);
    int v7 = *v5++;
    int v2 = v7;
    BOOL v9 = v6 == 58 && v2 == 119;
    if (v2) {
      BOOL v10 = !v9;
    }
    else {
      BOOL v10 = 0;
    }
  }
  while (v10);
  return result;
}

- (NSString)executablePath
{
  uint64_t v3 = [(CLClientKeyPath *)self findComponent:1];
  if (*v3 != 101) {
    return 0;
  }

  return (NSString *)[(CLClientKeyPath *)self extractComponentFromCharPtr:v3 + 1];
}

+ (CLClientKeyPath)clientKeyPathWithClientAnchor:(id)a3 anchorType:(char)a4 subIdentityId:(id)a5 subIdentityType:(char)a6
{
  return +[CLClientKeyPath clientKeyPathWithUserName:0 clientAnchor:a3 anchorType:a4 subIdentityId:a5 subIdentityType:a6];
}

- (CLClientKeyPath)clientKeyPathWithReplacementSubIdentityId:(id)a3 subIdentityType:(char)a4
{
  uint64_t v4 = a4;
  if (![a3 length]) {
    return self;
  }
  if ((v4 - 101) > 0x15 || ((1 << (v4 - 101)) & 0x240811) == 0)
  {
    if (qword_102419530 != -1) {
      goto LABEL_18;
    }
    while (1)
    {
      id v12 = qword_102419538;
      if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 68290307;
        int v16 = 0;
        __int16 v17 = 2082;
        id v18 = "";
        __int16 v19 = 2114;
        int v20 = self;
        __int16 v21 = 2114;
        id v22 = a3;
        __int16 v23 = 1026;
        int v24 = v4;
        __int16 v25 = 2082;
        uint64_t v26 = "assert";
        __int16 v27 = 2081;
        v28 = "validateCKPSubIdentityType(subIdentityType)";
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Attempted to create #CLCKP with invalid replacement subIdentity type.\", \"originalCKP\":%{public, location:escape_only}@, \"subId\":%{public, location:escape_only}@, \"subIdTypeChar\":%{public}d, \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x40u);
        if (qword_102419530 != -1) {
          dispatch_once(&qword_102419530, &stru_10230B008);
        }
      }
      uint64_t v13 = qword_102419538;
      if (os_signpost_enabled((os_log_t)qword_102419538))
      {
        *(_DWORD *)buf = 68290307;
        int v16 = 0;
        __int16 v17 = 2082;
        id v18 = "";
        __int16 v19 = 2114;
        int v20 = self;
        __int16 v21 = 2114;
        id v22 = a3;
        __int16 v23 = 1026;
        int v24 = v4;
        __int16 v25 = 2082;
        uint64_t v26 = "assert";
        __int16 v27 = 2081;
        v28 = "validateCKPSubIdentityType(subIdentityType)";
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v13, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Attempted to create #CLCKP with invalid replacement subIdentity type.", "{\"msg%{public}.0s\":\"Attempted to create #CLCKP with invalid replacement subIdentity type.\", \"originalCKP\":%{public, location:escape_only}@, \"subId\":%{public, location:escape_only}@, \"subIdTypeChar\":%{public}d, \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x40u);
        if (qword_102419530 != -1) {
          dispatch_once(&qword_102419530, &stru_10230B008);
        }
      }
      uint64_t v14 = qword_102419538;
      if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 68290307;
        int v16 = 0;
        __int16 v17 = 2082;
        id v18 = "";
        __int16 v19 = 2114;
        int v20 = self;
        __int16 v21 = 2114;
        id v22 = a3;
        __int16 v23 = 1026;
        int v24 = v4;
        __int16 v25 = 2082;
        uint64_t v26 = "assert";
        __int16 v27 = 2081;
        v28 = "validateCKPSubIdentityType(subIdentityType)";
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Attempted to create #CLCKP with invalid replacement subIdentity type.\", \"originalCKP\":%{public, location:escape_only}@, \"subId\":%{public, location:escape_only}@, \"subIdTypeChar\":%{public}d, \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x40u);
      }
      abort_report_np();
LABEL_18:
      dispatch_once(&qword_102419530, &stru_10230B008);
    }
  }
  int v8 = [(CLClientKeyPath *)self findComponent:1];
  id v9 = [(CLClientKeyPath *)self extractComponentFromCharPtr:v8 + 1];
  uint64_t v10 = *v8;
  uint64_t v11 = [(CLClientKeyPath *)self userName];

  return +[CLClientKeyPath clientKeyPathWithUserName:v11 clientAnchor:v9 anchorType:v10 subIdentityId:a3 subIdentityType:v4];
}

- (CLClientKeyPath)clientKeyPathWithReplacementAnchor:(id)a3 anchorType:(char)a4
{
  uint64_t v4 = a4;
  if ((a4 - 101) > 0xB || ((1 << (a4 - 101)) & 0x891) == 0)
  {
    if (qword_102419530 != -1) {
      goto LABEL_21;
    }
    while (1)
    {
      uint64_t v14 = qword_102419538;
      if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 68290307;
        int v18 = 0;
        __int16 v19 = 2082;
        int v20 = "";
        __int16 v21 = 2114;
        id v22 = self;
        __int16 v23 = 2114;
        id v24 = a3;
        __int16 v25 = 1026;
        int v26 = v4;
        __int16 v27 = 2082;
        v28 = "assert";
        __int16 v29 = 2081;
        uint64_t v30 = "validateCKPAnchorType(anchorType)";
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Attempted to create #CLCKP with either an empty clientAnchor or an invalid replacement anchor type.\", \"originalCKP\":%{public, location:escape_only}@, \"anchor\":%{public, location:escape_only}@, \"anchorTypeChar\":%{public}d, \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x40u);
        if (qword_102419530 != -1) {
          dispatch_once(&qword_102419530, &stru_10230B008);
        }
      }
      signed __int8 v15 = qword_102419538;
      if (os_signpost_enabled((os_log_t)qword_102419538))
      {
        *(_DWORD *)buf = 68290307;
        int v18 = 0;
        __int16 v19 = 2082;
        int v20 = "";
        __int16 v21 = 2114;
        id v22 = self;
        __int16 v23 = 2114;
        id v24 = a3;
        __int16 v25 = 1026;
        int v26 = v4;
        __int16 v27 = 2082;
        v28 = "assert";
        __int16 v29 = 2081;
        uint64_t v30 = "validateCKPAnchorType(anchorType)";
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v15, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Attempted to create #CLCKP with either an empty clientAnchor or an invalid replacement anchor type.", "{\"msg%{public}.0s\":\"Attempted to create #CLCKP with either an empty clientAnchor or an invalid replacement anchor type.\", \"originalCKP\":%{public, location:escape_only}@, \"anchor\":%{public, location:escape_only}@, \"anchorTypeChar\":%{public}d, \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x40u);
        if (qword_102419530 != -1) {
          dispatch_once(&qword_102419530, &stru_10230B008);
        }
      }
      int v16 = qword_102419538;
      if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 68290307;
        int v18 = 0;
        __int16 v19 = 2082;
        int v20 = "";
        __int16 v21 = 2114;
        id v22 = self;
        __int16 v23 = 2114;
        id v24 = a3;
        __int16 v25 = 1026;
        int v26 = v4;
        __int16 v27 = 2082;
        v28 = "assert";
        __int16 v29 = 2081;
        uint64_t v30 = "validateCKPAnchorType(anchorType)";
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Attempted to create #CLCKP with either an empty clientAnchor or an invalid replacement anchor type.\", \"originalCKP\":%{public, location:escape_only}@, \"anchor\":%{public, location:escape_only}@, \"anchorTypeChar\":%{public}d, \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x40u);
      }
      abort_report_np();
LABEL_21:
      dispatch_once(&qword_102419530, &stru_10230B008);
    }
  }
  int v8 = [(CLClientKeyPath *)self findComponent:2];
  if (v8)
  {
    id v9 = v8;
    id v10 = [(CLClientKeyPath *)self extractComponentFromCharPtr:v8 + 1];
    char v11 = *v9;
  }
  else
  {
    id v10 = 0;
    char v11 = 33;
  }
  id v12 = [(CLClientKeyPath *)self userName];

  return +[CLClientKeyPath clientKeyPathWithUserName:v12 clientAnchor:a3 anchorType:v4 subIdentityId:v10 subIdentityType:v11];
}

- (CLClientKeyPath)clientKeyPathWithReplacementTypedSubIdentityId:(id)a3
{
  if (![a3 length]) {
    return self;
  }
  id v6 = [a3 substringFromIndex:1];
  int v7 = (char *)[a3 UTF8String];
  if ((*v7 - 101) > 0x15 || ((1 << (*v7 - 101)) & 0x240811) == 0)
  {
    uint64_t v14 = (CLClientKeyPath *)sub_101A9D0AC(a3);
    return [(CLClientKeyPath *)v14 clientKeyPathWithReplacementTypedAnchor:v16];
  }
  else
  {
    char v9 = *v7;
    id v10 = [(CLClientKeyPath *)self findComponent:1];
    id v11 = [(CLClientKeyPath *)self extractComponentFromCharPtr:v10 + 1];
    uint64_t v12 = *v10;
    uint64_t v13 = [(CLClientKeyPath *)self userName];
    return +[CLClientKeyPath clientKeyPathWithUserName:v13 clientAnchor:v11 anchorType:v12 subIdentityId:v6 subIdentityType:v9];
  }
}

- (CLClientKeyPath)clientKeyPathWithReplacementTypedAnchor:(id)a3
{
  id v5 = [a3 substringFromIndex:1];
  id v6 = [a3 UTF8String];
  int v7 = (char)*v6;
  if ((v7 - 101) > 0xB || ((1 << (*v6 - 101)) & 0x891) == 0)
  {
    if (qword_102419530 != -1) {
      goto LABEL_21;
    }
    while (1)
    {
      SEL v15 = qword_102419538;
      if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 68290051;
        int v19 = 0;
        __int16 v20 = 2082;
        __int16 v21 = "";
        __int16 v22 = 2114;
        __int16 v23 = self;
        __int16 v24 = 2114;
        id v25 = a3;
        __int16 v26 = 2082;
        __int16 v27 = "assert";
        __int16 v28 = 2081;
        __int16 v29 = "validateCKPAnchorType(anchorType)";
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Attempted to create #CLCKP with invalid replacement typed-anchor.\", \"originalCKP\":%{public, location:escape_only}@, \"anchorWithType\":%{public, location:escape_only}@, \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x3Au);
        if (qword_102419530 != -1) {
          dispatch_once(&qword_102419530, &stru_10230B008);
        }
      }
      id v16 = qword_102419538;
      if (os_signpost_enabled((os_log_t)qword_102419538))
      {
        *(_DWORD *)buf = 68290051;
        int v19 = 0;
        __int16 v20 = 2082;
        __int16 v21 = "";
        __int16 v22 = 2114;
        __int16 v23 = self;
        __int16 v24 = 2114;
        id v25 = a3;
        __int16 v26 = 2082;
        __int16 v27 = "assert";
        __int16 v28 = 2081;
        __int16 v29 = "validateCKPAnchorType(anchorType)";
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v16, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Attempted to create #CLCKP with invalid replacement typed-anchor.", "{\"msg%{public}.0s\":\"Attempted to create #CLCKP with invalid replacement typed-anchor.\", \"originalCKP\":%{public, location:escape_only}@, \"anchorWithType\":%{public, location:escape_only}@, \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x3Au);
        if (qword_102419530 != -1) {
          dispatch_once(&qword_102419530, &stru_10230B008);
        }
      }
      __int16 v17 = qword_102419538;
      if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 68290051;
        int v19 = 0;
        __int16 v20 = 2082;
        __int16 v21 = "";
        __int16 v22 = 2114;
        __int16 v23 = self;
        __int16 v24 = 2114;
        id v25 = a3;
        __int16 v26 = 2082;
        __int16 v27 = "assert";
        __int16 v28 = 2081;
        __int16 v29 = "validateCKPAnchorType(anchorType)";
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Attempted to create #CLCKP with invalid replacement typed-anchor.\", \"originalCKP\":%{public, location:escape_only}@, \"anchorWithType\":%{public, location:escape_only}@, \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x3Au);
      }
      abort_report_np();
LABEL_21:
      dispatch_once(&qword_102419530, &stru_10230B008);
    }
  }
  char v9 = [(CLClientKeyPath *)self findComponent:2];
  if (v9)
  {
    id v10 = v9;
    id v11 = [(CLClientKeyPath *)self extractComponentFromCharPtr:v9 + 1];
    char v12 = *v10;
  }
  else
  {
    id v11 = 0;
    char v12 = 33;
  }
  uint64_t v13 = [(CLClientKeyPath *)self userName];

  return +[CLClientKeyPath clientKeyPathWithUserName:v13 clientAnchor:v5 anchorType:(char)v7 subIdentityId:v11 subIdentityType:v12];
}

- (char)anchorType
{
  return *[(CLClientKeyPath *)self findComponent:1];
}

- (NSString)clientAnchorWithType
{
  uint64_t v3 = [(CLClientKeyPath *)self findComponent:1];

  return (NSString *)[(CLClientKeyPath *)self extractComponentFromCharPtr:v3];
}

- (NSString)subIdentityIdWithType
{
  unint64_t result = [(CLClientKeyPath *)self findComponent:2];
  if (result)
  {
    return (NSString *)[(CLClientKeyPath *)self extractComponentFromCharPtr:result];
  }
  return result;
}

- (NSString)zoneId
{
  uint64_t v3 = [(CLClientKeyPath *)self findComponent:2];
  if (!v3 || *v3 != 122) {
    return 0;
  }

  return (NSString *)[(CLClientKeyPath *)self extractComponentFromCharPtr:v3 + 1];
}

- (NSString)nestedBundleId
{
  uint64_t v3 = [(CLClientKeyPath *)self findComponent:2];
  if (!v3 || *v3 != 105) {
    return 0;
  }

  return (NSString *)[(CLClientKeyPath *)self extractComponentFromCharPtr:v3 + 1];
}

- (NSString)nestedExecutablePath
{
  uint64_t v3 = [(CLClientKeyPath *)self findComponent:2];
  if (!v3 || *v3 != 101) {
    return 0;
  }

  return (NSString *)[(CLClientKeyPath *)self extractComponentFromCharPtr:v3 + 1];
}

- (NSString)userlessClientKeyPath
{
  int v2 = [(CLClientKeyPath *)self findComponent:1];

  return +[NSString stringWithUTF8String:v2];
}

@end