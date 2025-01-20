@interface AEAConcreteAuditToken
+ (id)auditTokenWithData:(id)a3;
+ (id)invalidAuditToken;
- ($115C4C562B26FF47E01F9F4EA65B5887)underlyingToken;
- (AEAConcreteAuditToken)initWithAuditToken:(id *)a3;
- (BOOL)isEqual:(id)a3;
- (id)dataRepresentation;
- (int)processIdentifier;
- (unint64_t)hash;
@end

@implementation AEAConcreteAuditToken

- (AEAConcreteAuditToken)initWithAuditToken:(id *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)AEAConcreteAuditToken;
  result = [(AEAConcreteAuditToken *)&v6 init];
  if (result)
  {
    long long v5 = *(_OWORD *)&a3->var0[4];
    *(_OWORD *)result->_underlyingToken.val = *(_OWORD *)a3->var0;
    *(_OWORD *)&result->_underlyingToken.val[4] = v5;
  }
  return result;
}

+ (id)auditTokenWithData:(id)a3
{
  v3 = +[NSValue ae_valueFromData:a3 ofObjCType:"{?=[8I]}"];
  v4 = v3;
  if (v3)
  {
    *(void *)&long long v5 = -1;
    *((void *)&v5 + 1) = -1;
    long long v10 = v5;
    long long v11 = v5;
    [v3 getValue:&v10];
    objc_super v6 = [AEAConcreteAuditToken alloc];
    v9[0] = v10;
    v9[1] = v11;
    v7 = [(AEAConcreteAuditToken *)v6 initWithAuditToken:v9];
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)invalidAuditToken
{
  v2 = [AEAConcreteAuditToken alloc];
  *(void *)&long long v3 = -1;
  *((void *)&v3 + 1) = -1;
  v6[0] = v3;
  v6[1] = v3;
  v4 = [(AEAConcreteAuditToken *)v2 initWithAuditToken:v6];

  return v4;
}

- (int)processIdentifier
{
  [(AEAConcreteAuditToken *)self underlyingToken];
  return audit_token_to_pid(&v3);
}

- (id)dataRepresentation
{
  [(AEAConcreteAuditToken *)self underlyingToken];
  v2 = +[NSValue value:&v5 withObjCType:"{?=[8I]}"];
  audit_token_t v3 = [v2 ae_dataRepresentation];

  return v3;
}

- (unint64_t)hash
{
  return [(AEAConcreteAuditToken *)self processIdentifier];
}

- (BOOL)isEqual:(id)a3
{
  v4 = (AEAConcreteAuditToken *)a3;
  long long v5 = v4;
  if (!v4) {
    goto LABEL_5;
  }
  if (v4 == self)
  {
    BOOL v6 = 1;
    goto LABEL_7;
  }
  if ([(AEAConcreteAuditToken *)v4 isMemberOfClass:objc_opt_class()]) {
    BOOL v6 = sub_1000025F8(self, v5);
  }
  else {
LABEL_5:
  }
    BOOL v6 = 0;
LABEL_7:

  return v6;
}

- ($115C4C562B26FF47E01F9F4EA65B5887)underlyingToken
{
  long long v3 = *(_OWORD *)&self[1].var0[2];
  *(_OWORD *)retstr->var0 = *(_OWORD *)&self->var0[6];
  *(_OWORD *)&retstr->var0[4] = v3;
  return self;
}

@end