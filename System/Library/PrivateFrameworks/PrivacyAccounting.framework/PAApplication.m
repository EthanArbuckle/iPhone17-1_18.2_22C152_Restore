@interface PAApplication
+ (BOOL)supportsSecureCoding;
+ (PAApplication)applicationForCurrentProcess;
+ (PAApplication)applicationWithAuditToken:(id *)a3;
+ (PAApplication)applicationWithBundleID:(id)a3;
+ (PAApplication)applicationWithPath:(id)a3;
+ (PAApplication)applicationWithType:(int64_t)a3 identifier:(id)a4;
- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken;
- (BOOL)isEqual:(id)a3;
- (NSString)bundleID;
- (NSString)descriptionForIdentifier;
- (NSString)identifier;
- (NSString)path;
- (OS_tcc_identity)assumedIdentity;
- (PAApplication)initWithAuditToken:(id *)a3;
- (PAApplication)initWithBundleID:(id)a3;
- (PAApplication)initWithCoder:(id)a3;
- (PAApplication)initWithInProcessAssumedIdentity:(id)a3;
- (PAApplication)initWithInProcessBridgedAssumedIdentity:(id)a3;
- (PAApplication)initWithInProcessIdentity;
- (PAApplication)initWithInsecureProcessIdentifier:(int)a3;
- (PAApplication)initWithPath:(id)a3;
- (PAApplication)initWithProto:(id)a3;
- (PAApplication)initWithProtoData:(id)a3;
- (PAApplication)initWithTCCIdentity:(id)a3;
- (PAApplication)initWithType:(int64_t)a3 identifier:(id)a4;
- (PABridgedTCCIdentity)bridgedAssumedIdentity;
- (id)JSONObject;
- (id)description;
- (id)descriptionForIdentifierType;
- (id)encodeAsProto;
- (id)proto;
- (int)insecureProcessIdentifier;
- (int64_t)identifierType;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PAApplication

+ (PAApplication)applicationForCurrentProcess
{
  if (applicationForCurrentProcess_onceToken != -1) {
    dispatch_once(&applicationForCurrentProcess_onceToken, &__block_literal_global_8);
  }
  v2 = (void *)applicationForCurrentProcess_application;

  return (PAApplication *)v2;
}

- (unint64_t)hash
{
  unint64_t result = self->_identifierType;
  switch(result)
  {
    case 0uLL:
      bundleID = self->_bundleID;
      unint64_t result = [(NSString *)bundleID hash];
      break;
    case 1uLL:
      unint64_t result = [(NSString *)self->_path hash] + 31;
      break;
    case 2uLL:
      int8x16_t v5 = veorq_s8(*(int8x16_t *)self->_auditToken.val, *(int8x16_t *)&self->_auditToken.val[4]);
      int16x8_t v6 = vmovl_high_s8(v5);
      int8x16_t v7 = (int8x16_t)vmovl_s16(*(int16x4_t *)v6.i8);
      int16x8_t v8 = vmovl_s8(*(int8x8_t *)v5.i8);
      int8x16_t v9 = (int8x16_t)vmovl_s16(*(int16x4_t *)v8.i8);
      int8x16_t v10 = (int8x16_t)vmovl_high_s16(v6);
      int8x16_t v11 = (int8x16_t)vmovl_high_s16(v8);
      *(int8x8_t *)v11.i8 = veor_s8(veor_s8(veor_s8(*(int8x8_t *)v9.i8, *(int8x8_t *)v7.i8), veor_s8(*(int8x8_t *)v11.i8, *(int8x8_t *)v10.i8)), veor_s8(veor_s8((int8x8_t)*(_OWORD *)&vextq_s8(v9, v9, 8uLL), (int8x8_t)*(_OWORD *)&vextq_s8(v7, v7, 8uLL)), veor_s8((int8x8_t)*(_OWORD *)&vextq_s8(v11, v11, 8uLL), (int8x8_t)*(_OWORD *)&vextq_s8(v10, v10, 8uLL))));
      v12.i64[0] = v11.i32[0];
      v12.i64[1] = v11.i32[1];
      unint64_t result = *(void *)&veor_s8((int8x8_t)v11.i32[0], (int8x8_t)*(_OWORD *)&vextq_s8(v12, v12, 8uLL)) + 62;
      break;
    case 3uLL:
      unint64_t result = self->_insecureProcessIdentifier + 93;
      break;
    case 4uLL:
      unint64_t result = [(PABridgedTCCIdentity *)self->_bridgedAssumedIdentity hash] + 124;
      break;
    default:
      return result;
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bridgedAssumedIdentity, 0);
  objc_storeStrong((id *)&self->_path, 0);

  objc_storeStrong((id *)&self->_bundleID, 0);
}

+ (PAApplication)applicationWithAuditToken:(id *)a3
{
  id v4 = objc_alloc((Class)a1);
  long long v5 = *(_OWORD *)&a3->var0[4];
  v8[0] = *(_OWORD *)a3->var0;
  v8[1] = v5;
  int16x8_t v6 = (void *)[v4 initWithAuditToken:v8];

  return (PAApplication *)v6;
}

- (PAApplication)initWithAuditToken:(id *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PAApplication;
  unint64_t result = [(PAApplication *)&v6 init];
  if (result)
  {
    result->_identifierType = 2;
    long long v5 = *(_OWORD *)&a3->var0[4];
    *(_OWORD *)result->_auditToken.val = *(_OWORD *)a3->var0;
    *(_OWORD *)&result->_auditToken.val[4] = v5;
  }
  return result;
}

- (id)JSONObject
{
  v3 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:2];
  id v4 = [(PAApplication *)self descriptionForIdentifierType];
  [v3 setObject:v4 forKeyedSubscript:@"identifierType"];

  long long v5 = [(PAApplication *)self descriptionForIdentifier];
  [v3 setObject:v5 forKeyedSubscript:@"identifier"];

  if (self->_identifierType == 4)
  {
    objc_super v6 = [(PABridgedTCCIdentity *)self->_bridgedAssumedIdentity description];
    [v3 setObject:v6 forKeyedSubscript:@"assumedIdentity"];
  }

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PAApplication *)a3;
  if (v4 == self)
  {
    LOBYTE(self) = 1;
  }
  else if ([(PAApplication *)v4 isMemberOfClass:objc_opt_class()])
  {
    long long v5 = v4;
    int64_t identifierType = self->_identifierType;
    if (identifierType == [(PAApplication *)v5 identifierType])
    {
      switch(self->_identifierType)
      {
        case 0:
          bundleID = self->_bundleID;
          path = v5->_bundleID;
          goto LABEL_10;
        case 1:
          bundleID = self->_path;
          path = v5->_path;
LABEL_10:
          BOOL v9 = [(NSString *)bundleID isEqualToString:path];
          goto LABEL_26;
        case 2:
          long long v17 = *(_OWORD *)self->_auditToken.val;
          long long v18 = *(_OWORD *)&self->_auditToken.val[4];
          long long v10 = *(_OWORD *)&v5->_auditToken.val[4];
          long long v16 = *(_OWORD *)v5->_auditToken.val;
          BOOL v13 = (void)v17 == (void)v16
             && *((void *)&v17 + 1) == *((void *)&v16 + 1)
             && (void)v18 == (void)v10
             && *((void *)&v18 + 1) == *((void *)&v10 + 1);
          goto LABEL_21;
        case 3:
          BOOL v13 = self->_insecureProcessIdentifier == v5->_insecureProcessIdentifier;
LABEL_21:
          LOBYTE(self) = v13;
          break;
        case 4:
          bridgedAssumedIdentity = self->_bridgedAssumedIdentity;
          if (bridgedAssumedIdentity == v5->_bridgedAssumedIdentity)
          {
            LOBYTE(self) = 1;
          }
          else
          {
            BOOL v9 = -[PABridgedTCCIdentity isEqual:](bridgedAssumedIdentity, "isEqual:");
LABEL_26:
            LOBYTE(self) = v9;
          }
          break;
        default:
          break;
      }
    }
    else
    {
      LOBYTE(self) = 0;
    }
  }
  else
  {
    LOBYTE(self) = 0;
  }

  return self & 1;
}

- (int64_t)identifierType
{
  return self->_identifierType;
}

- (NSString)descriptionForIdentifier
{
  switch(self->_identifierType)
  {
    case 0:
      bundleID = self->_bundleID;
      goto LABEL_5;
    case 1:
      bundleID = self->_path;
LABEL_5:
      v3 = bundleID;
      break;
    case 2:
      [NSString stringWithFormat:@"{pid:%d, version:%d}", self->_auditToken.val[5], self->_auditToken.val[7]];
      goto LABEL_8;
    case 3:
      objc_msgSend(NSString, "stringWithFormat:", @"{pid:%d}", self->_insecureProcessIdentifier, v5);
LABEL_8:
      v3 = (NSString *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      v3 = 0;
      break;
  }

  return v3;
}

- (id)descriptionForIdentifierType
{
  unint64_t identifierType = self->_identifierType;
  if (identifierType > 4) {
    return @"unknown";
  }
  else {
    return off_1E5D71588[identifierType];
  }
}

- (NSString)bundleID
{
  return self->_bundleID;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v7 = a3;
  [v7 encodeInteger:self->_identifierType forKey:@"identifierType"];
  switch(self->_identifierType)
  {
    case 0:
      bundleID = (PABridgedTCCIdentity *)self->_bundleID;
      uint64_t v5 = @"bundleID";
      goto LABEL_7;
    case 1:
      bundleID = (PABridgedTCCIdentity *)self->_path;
      uint64_t v5 = @"path";
      goto LABEL_7;
    case 2:
      objc_super v6 = [MEMORY[0x1E4F29238] valueWithBytes:&self->_auditToken objCType:"{?=[8I]}"];
      [v7 encodeObject:v6 forKey:@"auditToken"];

      break;
    case 3:
      [v7 encodeInt:self->_insecureProcessIdentifier forKey:@"insecureProcessIdentifier"];
      break;
    case 4:
      bundleID = self->_bridgedAssumedIdentity;
      uint64_t v5 = @"assumedIdentity";
LABEL_7:
      [v7 encodeObject:bundleID forKey:v5];
      break;
    default:
      break;
  }
}

+ (PAApplication)applicationWithType:(int64_t)a3 identifier:(id)a4
{
  id v6 = a4;
  id v7 = (void *)[objc_alloc((Class)a1) initWithType:a3 identifier:v6];

  return (PAApplication *)v7;
}

- (PAApplication)initWithType:(int64_t)a3 identifier:(id)a4
{
  id v6 = a4;
  if (a3 == 1)
  {
    id v7 = [(PAApplication *)self initWithPath:v6];
  }
  else
  {
    if (a3)
    {
      int16x8_t v8 = 0;
      goto LABEL_7;
    }
    id v7 = [(PAApplication *)self initWithBundleID:v6];
  }
  self = v7;
  int16x8_t v8 = self;
LABEL_7:

  return v8;
}

uint64_t __45__PAApplication_applicationForCurrentProcess__block_invoke()
{
  applicationForCurrentProcess_application = [[PAApplication alloc] initWithInProcessIdentity];

  return MEMORY[0x1F41817F8]();
}

- (PAApplication)initWithInProcessIdentity
{
  return [(PAApplication *)self initWithInProcessBridgedAssumedIdentity:0];
}

+ (PAApplication)applicationWithBundleID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)[objc_alloc((Class)a1) initWithBundleID:v4];

  return (PAApplication *)v5;
}

- (PAApplication)initWithCoder:(id)a3
{
  id v4 = a3;
  switch([v4 decodeIntegerForKey:@"identifierType"])
  {
    case 0:
      uint64_t v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bundleID"];
      id v6 = [(PAApplication *)self initWithBundleID:v5];
      goto LABEL_9;
    case 1:
      uint64_t v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"path"];
      id v6 = [(PAApplication *)self initWithPath:v5];
      goto LABEL_9;
    case 2:
      long long v12 = 0u;
      long long v13 = 0u;
      int16x8_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"auditToken"];
      [v8 getValue:&v12 size:32];

      v11[0] = v12;
      v11[1] = v13;
      BOOL v9 = [(PAApplication *)self initWithAuditToken:v11];
      goto LABEL_7;
    case 3:
      BOOL v9 = -[PAApplication initWithInsecureProcessIdentifier:](self, "initWithInsecureProcessIdentifier:", [v4 decodeIntForKey:@"insecureProcessIdentifier"]);
LABEL_7:
      self = v9;
      id v7 = self;
      break;
    case 4:
      uint64_t v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"assumedIdentity"];
      id v6 = [(PAApplication *)self initWithInProcessBridgedAssumedIdentity:v5];
LABEL_9:
      self = v6;

      id v7 = self;
      break;
    default:
      id v7 = 0;
      break;
  }

  return v7;
}

- (PAApplication)initWithTCCIdentity:(id)a3
{
  id v4 = a3;
  uint64_t type = tcc_identity_get_type();
  if (type == 1)
  {
    id v6 = [NSString stringWithUTF8String:tcc_identity_get_identifier()];
    id v7 = [(PAApplication *)self initWithPath:v6];
  }
  else
  {
    if (type)
    {
      int16x8_t v8 = 0;
      goto LABEL_7;
    }
    id v6 = [NSString stringWithUTF8String:tcc_identity_get_identifier()];
    id v7 = [(PAApplication *)self initWithBundleID:v6];
  }
  self = v7;

  int16x8_t v8 = self;
LABEL_7:

  return v8;
}

- (PAApplication)initWithBundleID:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PAApplication;
  uint64_t v5 = [(PAApplication *)&v10 init];
  id v6 = v5;
  if (v5)
  {
    v5->_unint64_t identifierType = 0;
    uint64_t v7 = [v4 copy];
    bundleID = v6->_bundleID;
    v6->_bundleID = (NSString *)v7;
  }
  return v6;
}

- (PAApplication)initWithInProcessBridgedAssumedIdentity:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PAApplication;
  id v6 = [(PAApplication *)&v9 init];
  uint64_t v7 = v6;
  if (v6)
  {
    v6->_unint64_t identifierType = 4;
    objc_storeStrong((id *)&v6->_bridgedAssumedIdentity, a3);
  }

  return v7;
}

+ (PAApplication)applicationWithPath:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[objc_alloc((Class)a1) initWithPath:v4];

  return (PAApplication *)v5;
}

- (PAApplication)initWithPath:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PAApplication;
  id v5 = [(PAApplication *)&v10 init];
  id v6 = v5;
  if (v5)
  {
    v5->_unint64_t identifierType = 1;
    uint64_t v7 = [v4 copy];
    path = v6->_path;
    v6->_path = (NSString *)v7;
  }
  return v6;
}

- (PAApplication)initWithInProcessAssumedIdentity:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [[PABridgedTCCIdentity alloc] initWithTCCIdentity:v4];
  }
  else
  {
    id v5 = 0;
  }
  id v6 = [(PAApplication *)self initWithInProcessBridgedAssumedIdentity:v5];

  return v6;
}

- (PAApplication)initWithInsecureProcessIdentifier:(int)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PAApplication;
  unint64_t result = [(PAApplication *)&v5 init];
  if (result)
  {
    result->_unint64_t identifierType = 3;
    result->_insecureProcessIdentifier = a3;
  }
  return result;
}

- (NSString)identifier
{
  int64_t identifierType = self->_identifierType;
  if (identifierType == 1)
  {
    v3 = [(PAApplication *)self path];
  }
  else if (identifierType)
  {
    v3 = 0;
  }
  else
  {
    v3 = [(PAApplication *)self bundleID];
  }

  return (NSString *)v3;
}

- (NSString)path
{
  return self->_path;
}

- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken
{
  long long v3 = *(_OWORD *)self[2].var0;
  *(_OWORD *)retstr->var0 = *(_OWORD *)&self[1].var0[4];
  *(_OWORD *)&retstr->var0[4] = v3;
  return self;
}

- (int)insecureProcessIdentifier
{
  return self->_insecureProcessIdentifier;
}

- (OS_tcc_identity)assumedIdentity
{
  return [(PABridgedTCCIdentity *)self->_bridgedAssumedIdentity identity];
}

- (id)description
{
  int64_t identifierType = self->_identifierType;
  id v4 = NSString;
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = [(PAApplication *)self descriptionForIdentifierType];
  uint64_t v7 = (void *)v6;
  if (identifierType == 4)
  {
    int16x8_t v8 = [v4 stringWithFormat:@"<%@ %p identifierType:%@ assumedIdentity:%@>", v5, self, v6, self->_bridgedAssumedIdentity];
  }
  else
  {
    objc_super v9 = [(PAApplication *)self descriptionForIdentifier];
    int16x8_t v8 = [v4 stringWithFormat:@"<%@ %p identifierType:%@ identifier:%@>", v5, self, v7, v9];
  }

  return v8;
}

- (id)encodeAsProto
{
  v2 = [(PAApplication *)self proto];
  long long v3 = [v2 data];

  return v3;
}

- (PAApplication)initWithProto:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    uint64_t v6 = [v5 identifier];

    if (v6)
    {
      int v7 = [v5 identifierType];
      if (v7 == 2)
      {
        int16x8_t v8 = [v5 identifier];
        objc_super v9 = [(PAApplication *)self initWithPath:v8];
      }
      else
      {
        if (v7 != 1)
        {
          uint64_t v6 = 0;
          goto LABEL_10;
        }
        int16x8_t v8 = [v5 identifier];
        objc_super v9 = [(PAApplication *)self initWithBundleID:v8];
      }
      self = v9;

      uint64_t v6 = self;
    }
LABEL_10:

    goto LABEL_11;
  }
  uint64_t v6 = 0;
LABEL_11:

  return v6;
}

- (PAApplication)initWithProtoData:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [[PAPBApplication alloc] initWithData:v4];

    uint64_t v6 = [(PAApplication *)self initWithProto:v5];
    self = v6;
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (id)proto
{
  long long v3 = objc_opt_new();
  id v4 = v3;
  int64_t identifierType = self->_identifierType;
  if (!identifierType)
  {
    uint64_t v6 = 1;
    uint64_t v7 = 16;
    goto LABEL_5;
  }
  if (identifierType == 1)
  {
    uint64_t v6 = 2;
    uint64_t v7 = 24;
LABEL_5:
    [v3 setIdentifierType:v6];
    [v4 setIdentifier:*(Class *)((char *)&self->super.isa + v7)];
    id v8 = v4;
    goto LABEL_7;
  }
  id v8 = 0;
LABEL_7:

  return v8;
}

- (PABridgedTCCIdentity)bridgedAssumedIdentity
{
  return self->_bridgedAssumedIdentity;
}

@end