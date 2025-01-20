@interface _ANEModelToken
+ (id)codeSigningIDFor:(id *)a3 processIdentifier:(int)a4;
+ (id)processNameFor:(id *)a3 identifier:(int)a4;
+ (id)teamIDFor:(id *)a3 processIdentifier:(int)a4;
+ (id)tokenWithAuditToken:(id *)a3 modelIdentifier:(id)a4 processIdentifier:(int)a5;
+ (id)tokenWithCsIdentity:(id)a3 teamIdentity:(id)a4 modelIdentifier:(id)a5 processIdentifier:(int)a6;
- (NSString)csIdentity;
- (NSString)modelIdentifier;
- (NSString)teamIdentity;
- (_ANEModelToken)initWithAuditToken:(id *)a3 modelIdentifier:(id)a4 processIdentifier:(int)a5;
- (_ANEModelToken)initWithCsIdentity:(id)a3 teamIdentity:(id)a4 modelIdentifier:(id)a5 processIdentifier:(int)a6;
- (id)description;
- (int)processIdentifier;
@end

@implementation _ANEModelToken

+ (id)processNameFor:(id *)a3 identifier:(int)a4
{
  return 0;
}

+ (id)codeSigningIDFor:(id *)a3 processIdentifier:(int)a4
{
  long long v5 = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)token.val = *(_OWORD *)a3->var0;
  *(_OWORD *)&token.val[4] = v5;
  v6 = SecTaskCreateWithAuditToken(kCFAllocatorDefault, &token);
  if (v6)
  {
    v7 = v6;
    CFErrorRef error = 0;
    v8 = (__CFString *)SecTaskCopySigningIdentifier(v6, &error);
    CFErrorRef v9 = error;
    v10 = +[_ANELog daemon];
    v11 = v10;
    if (v9)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_10001B428();
      }

      CFRelease(error);
    }
    else
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        v13 = NSStringFromSelector(a2);
        token.val[0] = 138412546;
        *(void *)&token.val[1] = v13;
        LOWORD(token.val[3]) = 2112;
        *(void *)((char *)&token.val[3] + 2) = v8;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%@: SecTaskCopySigningIdentifier() returned csIdentity=\"%@\"", (uint8_t *)&token, 0x16u);
      }
    }
    CFRelease(v7);
  }
  else
  {
    v12 = +[_ANELog daemon];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_10001B39C();
    }

    v8 = 0;
  }

  return v8;
}

+ (id)teamIDFor:(id *)a3 processIdentifier:(int)a4
{
  long long v5 = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)token.val = *(_OWORD *)a3->var0;
  *(_OWORD *)&token.val[4] = v5;
  SecTaskRef v6 = SecTaskCreateWithAuditToken(kCFAllocatorDefault, &token);
  if (v6)
  {
    SecTaskRef v7 = v6;
    uint64_t v8 = SecTaskCopyTeamIdentifier();
    if (v8) {
      CFErrorRef v9 = (__CFString *)v8;
    }
    else {
      CFErrorRef v9 = &stru_10002CA38;
    }
    CFRelease(v7);
    v10 = +[_ANELog daemon];
    v11 = v10;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v13 = NSStringFromSelector(a2);
      token.val[0] = 138412546;
      *(void *)&token.val[1] = v13;
      LOWORD(token.val[3]) = 2112;
      *(void *)((char *)&token.val[3] + 2) = v9;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%@: SecTaskCopyTeamIdentifier() returned teamIdentity=\"%@\"", (uint8_t *)&token, 0x16u);
    }
  }
  else
  {
    v12 = +[_ANELog daemon];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_10001B39C();
    }

    CFErrorRef v9 = &stru_10002CA38;
  }

  return v9;
}

- (_ANEModelToken)initWithAuditToken:(id *)a3 modelIdentifier:(id)a4 processIdentifier:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v8 = a4;
  CFErrorRef v9 = objc_opt_class();
  long long v10 = *(_OWORD *)&a3->var0[4];
  long long v17 = *(_OWORD *)a3->var0;
  long long v18 = v10;
  v11 = [v9 teamIDFor:&v17 processIdentifier:v5];
  v12 = objc_opt_class();
  long long v13 = *(_OWORD *)&a3->var0[4];
  long long v17 = *(_OWORD *)a3->var0;
  long long v18 = v13;
  v14 = [v12 codeSigningIDFor:&v17 processIdentifier:v5];
  v15 = [(_ANEModelToken *)self initWithCsIdentity:v14 teamIdentity:v11 modelIdentifier:v8 processIdentifier:v5];

  return v15;
}

- (_ANEModelToken)initWithCsIdentity:(id)a3 teamIdentity:(id)a4 modelIdentifier:(id)a5 processIdentifier:(int)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v17.receiver = self;
  v17.super_class = (Class)_ANEModelToken;
  v14 = [(_ANEModelToken *)&v17 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_csIdentity, a3);
    objc_storeStrong((id *)&v15->_teamIdentity, a4);
    objc_storeStrong((id *)&v15->_modelIdentifier, a5);
    v15->_processIdentifier = a6;
  }

  return v15;
}

+ (id)tokenWithCsIdentity:(id)a3 teamIdentity:(id)a4 modelIdentifier:(id)a5 processIdentifier:(int)a6
{
  uint64_t v6 = *(void *)&a6;
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  id v12 = [[_ANEModelToken alloc] initWithCsIdentity:v11 teamIdentity:v10 modelIdentifier:v9 processIdentifier:v6];

  return v12;
}

+ (id)tokenWithAuditToken:(id *)a3 modelIdentifier:(id)a4 processIdentifier:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v7 = a4;
  id v8 = [_ANEModelToken alloc];
  long long v9 = *(_OWORD *)&a3->var0[4];
  v12[0] = *(_OWORD *)a3->var0;
  v12[1] = v9;
  id v10 = [(_ANEModelToken *)v8 initWithAuditToken:v12 modelIdentifier:v7 processIdentifier:v5];

  return v10;
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  uint64_t v5 = +[NSString stringWithFormat:@"%@: { csIdentity=%@ : teamIdentity=%@ }", v4, self->_csIdentity, self->_teamIdentity];

  return v5;
}

- (NSString)modelIdentifier
{
  return self->_modelIdentifier;
}

- (NSString)csIdentity
{
  return self->_csIdentity;
}

- (NSString)teamIdentity
{
  return self->_teamIdentity;
}

- (int)processIdentifier
{
  return self->_processIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_teamIdentity, 0);
  objc_storeStrong((id *)&self->_csIdentity, 0);

  objc_storeStrong((id *)&self->_modelIdentifier, 0);
}

@end