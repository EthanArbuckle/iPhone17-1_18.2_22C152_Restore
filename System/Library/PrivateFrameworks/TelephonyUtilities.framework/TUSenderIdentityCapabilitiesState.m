@interface TUSenderIdentityCapabilitiesState
+ (BOOL)supportsSecureCoding;
- (BOOL)supportsSimultaneousVoiceAndData;
- (NSString)description;
- (NSUUID)senderIdentityUUID;
- (TUCTCapabilitiesState)csCallingCapabilitiesState;
- (TUCTCapabilitiesState)voLTECallingCapabilitiesState;
- (TUCTCapabilitiesState)wiFiCallingCapabilitiesState;
- (TUSenderIdentityCapabilitiesState)initWithCoder:(id)a3;
- (TUSenderIdentityCapabilitiesState)initWithSenderIdentityUUID:(id)a3;
- (TUThumperCTCapabilitiesState)thumperCallingCapabilitiesState;
- (id)copyWithZone:(_NSZone *)a3;
- (id)publiclyAccessibleCopy;
- (id)publiclyAccessibleCopyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setCsCallingCapabilitiesState:(id)a3;
- (void)setSupportsSimultaneousVoiceAndData:(BOOL)a3;
- (void)setThumperCallingCapabilitiesState:(id)a3;
- (void)setVoLTECallingCapabilitiesState:(id)a3;
- (void)setWiFiCallingCapabilitiesState:(id)a3;
@end

@implementation TUSenderIdentityCapabilitiesState

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(TUSenderIdentityCapabilitiesState *)self senderIdentityUUID];
  v6 = NSStringFromSelector(sel_senderIdentityUUID);
  [v4 encodeObject:v5 forKey:v6];

  BOOL v7 = [(TUSenderIdentityCapabilitiesState *)self supportsSimultaneousVoiceAndData];
  v8 = NSStringFromSelector(sel_supportsSimultaneousVoiceAndData);
  [v4 encodeBool:v7 forKey:v8];

  v9 = [(TUSenderIdentityCapabilitiesState *)self csCallingCapabilitiesState];
  v10 = NSStringFromSelector(sel_csCallingCapabilitiesState);
  [v4 encodeObject:v9 forKey:v10];

  v11 = [(TUSenderIdentityCapabilitiesState *)self voLTECallingCapabilitiesState];
  v12 = NSStringFromSelector(sel_voLTECallingCapabilitiesState);
  [v4 encodeObject:v11 forKey:v12];

  v13 = [(TUSenderIdentityCapabilitiesState *)self wiFiCallingCapabilitiesState];
  v14 = NSStringFromSelector(sel_wiFiCallingCapabilitiesState);
  [v4 encodeObject:v13 forKey:v14];

  id v16 = [(TUSenderIdentityCapabilitiesState *)self thumperCallingCapabilitiesState];
  v15 = NSStringFromSelector(sel_thumperCallingCapabilitiesState);
  [v4 encodeObject:v16 forKey:v15];
}

- (TUCTCapabilitiesState)wiFiCallingCapabilitiesState
{
  return self->_wiFiCallingCapabilitiesState;
}

- (TUCTCapabilitiesState)voLTECallingCapabilitiesState
{
  return self->_voLTECallingCapabilitiesState;
}

- (TUThumperCTCapabilitiesState)thumperCallingCapabilitiesState
{
  return self->_thumperCallingCapabilitiesState;
}

- (BOOL)supportsSimultaneousVoiceAndData
{
  return self->_supportsSimultaneousVoiceAndData;
}

- (NSUUID)senderIdentityUUID
{
  return self->_senderIdentityUUID;
}

- (TUCTCapabilitiesState)csCallingCapabilitiesState
{
  return self->_csCallingCapabilitiesState;
}

- (TUSenderIdentityCapabilitiesState)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  v6 = NSStringFromSelector(sel_senderIdentityUUID);
  BOOL v7 = [v4 decodeObjectOfClass:v5 forKey:v6];

  v8 = [(TUSenderIdentityCapabilitiesState *)self initWithSenderIdentityUUID:v7];
  if (v8)
  {
    v9 = NSStringFromSelector(sel_supportsSimultaneousVoiceAndData);
    v8->_supportsSimultaneousVoiceAndData = [v4 decodeBoolForKey:v9];

    uint64_t v10 = objc_opt_class();
    v11 = NSStringFromSelector(sel_csCallingCapabilitiesState);
    uint64_t v12 = [v4 decodeObjectOfClass:v10 forKey:v11];
    csCallingCapabilitiesState = v8->_csCallingCapabilitiesState;
    v8->_csCallingCapabilitiesState = (TUCTCapabilitiesState *)v12;

    uint64_t v14 = objc_opt_class();
    v15 = NSStringFromSelector(sel_voLTECallingCapabilitiesState);
    uint64_t v16 = [v4 decodeObjectOfClass:v14 forKey:v15];
    voLTECallingCapabilitiesState = v8->_voLTECallingCapabilitiesState;
    v8->_voLTECallingCapabilitiesState = (TUCTCapabilitiesState *)v16;

    uint64_t v18 = objc_opt_class();
    v19 = NSStringFromSelector(sel_wiFiCallingCapabilitiesState);
    uint64_t v20 = [v4 decodeObjectOfClass:v18 forKey:v19];
    wiFiCallingCapabilitiesState = v8->_wiFiCallingCapabilitiesState;
    v8->_wiFiCallingCapabilitiesState = (TUCTCapabilitiesState *)v20;

    uint64_t v22 = objc_opt_class();
    v23 = NSStringFromSelector(sel_thumperCallingCapabilitiesState);
    uint64_t v24 = [v4 decodeObjectOfClass:v22 forKey:v23];
    thumperCallingCapabilitiesState = v8->_thumperCallingCapabilitiesState;
    v8->_thumperCallingCapabilitiesState = (TUThumperCTCapabilitiesState *)v24;
  }
  return v8;
}

- (TUSenderIdentityCapabilitiesState)initWithSenderIdentityUUID:(id)a3
{
  id v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)TUSenderIdentityCapabilitiesState;
  v6 = [(TUSenderIdentityCapabilitiesState *)&v17 init];
  BOOL v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_senderIdentityUUID, a3);
    v8 = objc_alloc_init(TUCTCapabilitiesState);
    csCallingCapabilitiesState = v7->_csCallingCapabilitiesState;
    v7->_csCallingCapabilitiesState = v8;

    uint64_t v10 = objc_alloc_init(TUCTCapabilitiesState);
    voLTECallingCapabilitiesState = v7->_voLTECallingCapabilitiesState;
    v7->_voLTECallingCapabilitiesState = v10;

    uint64_t v12 = objc_alloc_init(TUCTCapabilitiesState);
    wiFiCallingCapabilitiesState = v7->_wiFiCallingCapabilitiesState;
    v7->_wiFiCallingCapabilitiesState = v12;

    uint64_t v14 = objc_alloc_init(TUThumperCTCapabilitiesState);
    thumperCallingCapabilitiesState = v7->_thumperCallingCapabilitiesState;
    v7->_thumperCallingCapabilitiesState = v14;
  }
  return v7;
}

- (NSString)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p>\n", objc_opt_class(), self];
  [v3 appendString:@"CDMA:\n"];
  BOOL v4 = [(TUSenderIdentityCapabilitiesState *)self supportsSimultaneousVoiceAndData];
  id v5 = @"NO";
  if (v4) {
    id v5 = @"YES";
  }
  [v3 appendFormat:@"    supportsSimultaneousVoiceAndData: %@\n", v5];
  [v3 appendString:@"CT Capabilities State:\n"];
  v6 = [(TUSenderIdentityCapabilitiesState *)self csCallingCapabilitiesState];
  [v3 appendFormat:@"    csCallingCapabilitiesState: %@\n", v6];

  BOOL v7 = [(TUSenderIdentityCapabilitiesState *)self voLTECallingCapabilitiesState];
  [v3 appendFormat:@"    voLTECallingCapabilitiesState: %@\n", v7];

  v8 = [(TUSenderIdentityCapabilitiesState *)self wiFiCallingCapabilitiesState];
  [v3 appendFormat:@"    wiFiCallingCapabilitiesState: %@\n", v8];

  v9 = [(TUSenderIdentityCapabilitiesState *)self thumperCallingCapabilitiesState];
  [v3 appendFormat:@"    thumperCallingCapabilitiesState: %@\n", v9];

  return (NSString *)v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = -[TUSenderIdentityCapabilitiesState publiclyAccessibleCopyWithZone:](self, "publiclyAccessibleCopyWithZone:");
  v6 = [(TUSenderIdentityCapabilitiesState *)self csCallingCapabilitiesState];
  BOOL v7 = (void *)[v6 copyWithZone:a3];
  [v5 setCsCallingCapabilitiesState:v7];

  v8 = [(TUSenderIdentityCapabilitiesState *)self voLTECallingCapabilitiesState];
  v9 = (void *)[v8 copyWithZone:a3];
  [v5 setVoLTECallingCapabilitiesState:v9];

  uint64_t v10 = [(TUSenderIdentityCapabilitiesState *)self wiFiCallingCapabilitiesState];
  v11 = (void *)[v10 copyWithZone:a3];
  [v5 setWiFiCallingCapabilitiesState:v11];

  uint64_t v12 = [(TUSenderIdentityCapabilitiesState *)self thumperCallingCapabilitiesState];
  v13 = (void *)[v12 copyWithZone:a3];
  [v5 setThumperCallingCapabilitiesState:v13];

  return v5;
}

- (id)publiclyAccessibleCopy
{
  return [(TUSenderIdentityCapabilitiesState *)self publiclyAccessibleCopyWithZone:0];
}

- (id)publiclyAccessibleCopyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = [(TUSenderIdentityCapabilitiesState *)self senderIdentityUUID];
  uint64_t v7 = [v6 copyWithZone:a3];
  v8 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v7;

  *(unsigned char *)(v5 + 8) = [(TUSenderIdentityCapabilitiesState *)self supportsSimultaneousVoiceAndData];
  v9 = [(TUSenderIdentityCapabilitiesState *)self csCallingCapabilitiesState];
  uint64_t v10 = [v9 publiclyAccessibleCopyWithZone:a3];
  v11 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v10;

  uint64_t v12 = [(TUSenderIdentityCapabilitiesState *)self voLTECallingCapabilitiesState];
  uint64_t v13 = [v12 publiclyAccessibleCopyWithZone:a3];
  uint64_t v14 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v13;

  v15 = [(TUSenderIdentityCapabilitiesState *)self wiFiCallingCapabilitiesState];
  uint64_t v16 = [v15 publiclyAccessibleCopyWithZone:a3];
  objc_super v17 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v16;

  uint64_t v18 = [(TUSenderIdentityCapabilitiesState *)self thumperCallingCapabilitiesState];
  uint64_t v19 = [v18 publiclyAccessibleCopyWithZone:a3];
  uint64_t v20 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v19;

  return (id)v5;
}

- (void)setSupportsSimultaneousVoiceAndData:(BOOL)a3
{
  self->_supportsSimultaneousVoiceAndData = a3;
}

- (void)setCsCallingCapabilitiesState:(id)a3
{
}

- (void)setVoLTECallingCapabilitiesState:(id)a3
{
}

- (void)setWiFiCallingCapabilitiesState:(id)a3
{
}

- (void)setThumperCallingCapabilitiesState:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thumperCallingCapabilitiesState, 0);
  objc_storeStrong((id *)&self->_wiFiCallingCapabilitiesState, 0);
  objc_storeStrong((id *)&self->_voLTECallingCapabilitiesState, 0);
  objc_storeStrong((id *)&self->_csCallingCapabilitiesState, 0);

  objc_storeStrong((id *)&self->_senderIdentityUUID, 0);
}

@end