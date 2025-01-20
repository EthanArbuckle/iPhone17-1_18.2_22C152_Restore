@interface CSDConversationABTestConfiguration
- (BOOL)isAuthTagEnabled;
- (BOOL)isShortMKIEnabled;
- (BOOL)isTLEEnabled;
- (CSDConversationABTestConfiguration)initWithGroupUUID:(id)a3;
- (CSDConversationServerBag)serverBag;
- (NSUUID)groupUUID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)TLESampleRate;
- (unint64_t)authTagSampleRate;
- (void)_generateABTestConfiguration;
- (void)setAuthTagSampleRate:(unint64_t)a3;
- (void)setIsAuthTagEnabled:(BOOL)a3;
- (void)setIsShortMKIEnabled:(BOOL)a3;
- (void)setIsTLEEnabled:(BOOL)a3;
- (void)setServerBag:(id)a3;
- (void)setTLESampleRate:(unint64_t)a3;
@end

@implementation CSDConversationABTestConfiguration

- (CSDConversationABTestConfiguration)initWithGroupUUID:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CSDConversationABTestConfiguration;
  v6 = [(CSDConversationABTestConfiguration *)&v13 init];
  if (v6)
  {
    v7 = objc_alloc_init(CSDSharedConversationServerBag);
    serverBag = v6->_serverBag;
    v6->_serverBag = (CSDConversationServerBag *)v7;

    objc_storeStrong((id *)&v6->_groupUUID, a3);
    v9 = [(CSDConversationABTestConfiguration *)v6 serverBag];
    v6->_authTagSampleRate = (unint64_t)[v9 uPlusOneAuthTagSampleRate];

    v10 = [(CSDConversationABTestConfiguration *)v6 serverBag];
    v6->_TLESampleRate = (unint64_t)[v10 groupFaceTimeTLESampleRate];

    v11 = [(CSDConversationABTestConfiguration *)v6 serverBag];
    v6->_isShortMKIEnabled = [v11 isShortMKIEnabled];

    [(CSDConversationABTestConfiguration *)v6 _generateABTestConfiguration];
  }

  return v6;
}

- (id)description
{
  v3 = +[NSMutableString stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  v4 = [(CSDConversationABTestConfiguration *)self groupUUID];
  [v3 appendFormat:@" groupUUID=%@", v4];

  if ([(CSDConversationABTestConfiguration *)self isShortMKIEnabled]) {
    CFStringRef v5 = @"YES";
  }
  else {
    CFStringRef v5 = @"NO";
  }
  [v3 appendFormat:@" isShortMKIEnabled=%@", v5];
  if ([(CSDConversationABTestConfiguration *)self isAuthTagEnabled]) {
    CFStringRef v6 = @"YES";
  }
  else {
    CFStringRef v6 = @"NO";
  }
  [v3 appendFormat:@" isAuthTagEnabled=%@", v6];
  if ([(CSDConversationABTestConfiguration *)self isTLEEnabled]) {
    CFStringRef v7 = @"YES";
  }
  else {
    CFStringRef v7 = @"NO";
  }
  [v3 appendFormat:@" isTLEEnabled=%@", v7];
  objc_msgSend(v3, "appendFormat:", @" TLESampleRate=%lu", -[CSDConversationABTestConfiguration TLESampleRate](self, "TLESampleRate"));
  objc_msgSend(v3, "appendFormat:", @" authTagSampleRate=%lu", -[CSDConversationABTestConfiguration authTagSampleRate](self, "authTagSampleRate"));
  [v3 appendString:@">"];
  id v8 = [v3 copy];

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = [(CSDConversationABTestConfiguration *)self groupUUID];
  CFStringRef v6 = (void *)v4[3];
  v4[3] = v5;

  *((unsigned char *)v4 + 8) = [(CSDConversationABTestConfiguration *)self isShortMKIEnabled];
  *((unsigned char *)v4 + 9) = [(CSDConversationABTestConfiguration *)self isAuthTagEnabled];
  *((unsigned char *)v4 + 10) = [(CSDConversationABTestConfiguration *)self isTLEEnabled];
  v4[5] = [(CSDConversationABTestConfiguration *)self TLESampleRate];
  v4[4] = [(CSDConversationABTestConfiguration *)self authTagSampleRate];
  return v4;
}

- (void)_generateABTestConfiguration
{
  v3 = [(CSDConversationABTestConfiguration *)self groupUUID];
  unsigned int v4 = [v3 hash];

  if ([(CSDConversationABTestConfiguration *)self isShortMKIEnabled]) {
    BOOL v5 = (id)[(CSDConversationABTestConfiguration *)self authTagSampleRate] == (id)100
  }
      || [(CSDConversationABTestConfiguration *)self authTagSampleRate] >= v4 % 0x64;
  else {
    BOOL v5 = 0;
  }
  [(CSDConversationABTestConfiguration *)self setIsAuthTagEnabled:v5];
  if ([(CSDConversationABTestConfiguration *)self isShortMKIEnabled]) {
    BOOL v6 = (id)[(CSDConversationABTestConfiguration *)self TLESampleRate] == (id)100
  }
      || [(CSDConversationABTestConfiguration *)self TLESampleRate] >= v4 % 0x64;
  else {
    BOOL v6 = 0;
  }
  [(CSDConversationABTestConfiguration *)self setIsTLEEnabled:v6];
  if (![(CSDConversationABTestConfiguration *)self isTLEEnabled]
    && ![(CSDConversationABTestConfiguration *)self isAuthTagEnabled]
    && [(CSDConversationABTestConfiguration *)self isShortMKIEnabled])
  {
    [(CSDConversationABTestConfiguration *)self setIsShortMKIEnabled:0];
    CFStringRef v7 = sub_100008DCC();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v15) = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "set isShortMKIEnabled to NO since both isTLEEnabled and isAuthTagEnabled are false", (uint8_t *)&v15, 2u);
    }
  }
  id v8 = sub_100008DCC();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v9 = @"NO";
    if ([(CSDConversationABTestConfiguration *)self isTLEEnabled]) {
      CFStringRef v10 = @"YES";
    }
    else {
      CFStringRef v10 = @"NO";
    }
    if ([(CSDConversationABTestConfiguration *)self isShortMKIEnabled]) {
      CFStringRef v11 = @"YES";
    }
    else {
      CFStringRef v11 = @"NO";
    }
    if ([(CSDConversationABTestConfiguration *)self isAuthTagEnabled]) {
      CFStringRef v9 = @"YES";
    }
    uint64_t v12 = v4;
    unint64_t v13 = [(CSDConversationABTestConfiguration *)self authTagSampleRate];
    unint64_t v14 = [(CSDConversationABTestConfiguration *)self TLESampleRate];
    int v15 = 138413570;
    CFStringRef v16 = v10;
    __int16 v17 = 2112;
    CFStringRef v18 = v11;
    __int16 v19 = 2112;
    CFStringRef v20 = v9;
    __int16 v21 = 2048;
    uint64_t v22 = v12;
    __int16 v23 = 2048;
    unint64_t v24 = v13;
    __int16 v25 = 2048;
    unint64_t v26 = v14;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "isTLEEnabled: %@, isShortMKIEnabled: %@, isAuthTagEnabled: %@, hashValue: %lu, authTagSampleRate: %lu, TLESampleRate: %lu", (uint8_t *)&v15, 0x3Eu);
  }
}

- (BOOL)isShortMKIEnabled
{
  return self->_isShortMKIEnabled;
}

- (void)setIsShortMKIEnabled:(BOOL)a3
{
  self->_isShortMKIEnabled = a3;
}

- (BOOL)isAuthTagEnabled
{
  return self->_isAuthTagEnabled;
}

- (void)setIsAuthTagEnabled:(BOOL)a3
{
  self->_isAuthTagEnabled = a3;
}

- (BOOL)isTLEEnabled
{
  return self->_isTLEEnabled;
}

- (void)setIsTLEEnabled:(BOOL)a3
{
  self->_isTLEEnabled = a3;
}

- (CSDConversationServerBag)serverBag
{
  return self->_serverBag;
}

- (void)setServerBag:(id)a3
{
}

- (NSUUID)groupUUID
{
  return self->_groupUUID;
}

- (unint64_t)authTagSampleRate
{
  return self->_authTagSampleRate;
}

- (void)setAuthTagSampleRate:(unint64_t)a3
{
  self->_authTagSampleRate = a3;
}

- (unint64_t)TLESampleRate
{
  return self->_TLESampleRate;
}

- (void)setTLESampleRate:(unint64_t)a3
{
  self->_TLESampleRate = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupUUID, 0);

  objc_storeStrong((id *)&self->_serverBag, 0);
}

@end