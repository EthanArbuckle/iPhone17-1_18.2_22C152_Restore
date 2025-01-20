@interface WiFiP2PAWDLState
+ (BOOL)supportsSecureCoding;
+ (id)currentState;
- (BOOL)isEnabled;
- (BOOL)isEqual:(id)a3;
- (BOOL)supportsDataTransfer;
- (BOOL)supportsSoloMode;
- (NSArray)channelSequence;
- (NSString)interfaceName;
- (WiFiChannel)peerMasterChannel;
- (WiFiChannel)peerPrimaryPreferredChannel;
- (WiFiChannel)peerSecondaryPreferredChannel;
- (WiFiMACAddress)macAddress;
- (WiFiP2PAWDLState)initWithCoder:(id)a3;
- (WiFiP2PAWDLState)initWithInterfaceName:(id)a3 supportsSoloMode:(BOOL)a4 supportsDataTransfer:(BOOL)a5 channelSequence:(id)a6 isEnabled:(BOOL)a7 substate:(unsigned int)a8 macAddress:(id)a9 peerMasterChannel:(id)a10 peerPrimaryPreferredChannel:(id)a11 peerSecondaryPreferredChannel:(id)a12;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unsigned)substate;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WiFiP2PAWDLState

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (WiFiP2PAWDLState)initWithInterfaceName:(id)a3 supportsSoloMode:(BOOL)a4 supportsDataTransfer:(BOOL)a5 channelSequence:(id)a6 isEnabled:(BOOL)a7 substate:(unsigned int)a8 macAddress:(id)a9 peerMasterChannel:(id)a10 peerPrimaryPreferredChannel:(id)a11 peerSecondaryPreferredChannel:(id)a12
{
  id v17 = a3;
  id v18 = a6;
  id v19 = a9;
  id v20 = a10;
  id v21 = a11;
  id v22 = a12;
  v38.receiver = self;
  v38.super_class = (Class)WiFiP2PAWDLState;
  v23 = [(WiFiP2PAWDLState *)&v38 init];
  if (v23)
  {
    uint64_t v24 = [v17 copy];
    interfaceName = v23->_interfaceName;
    v23->_interfaceName = (NSString *)v24;

    v23->_supportsSoloMode = a4;
    v23->_supportsDataTransfer = a5;
    uint64_t v26 = [v18 copy];
    channelSequence = v23->_channelSequence;
    v23->_channelSequence = (NSArray *)v26;

    v23->_isEnabled = a7;
    v23->_substate = a8;
    uint64_t v28 = [v19 copy];
    macAddress = v23->_macAddress;
    v23->_macAddress = (WiFiMACAddress *)v28;

    uint64_t v30 = [v20 copy];
    peerMasterChannel = v23->_peerMasterChannel;
    v23->_peerMasterChannel = (WiFiChannel *)v30;

    uint64_t v32 = [v21 copy];
    peerPrimaryPreferredChannel = v23->_peerPrimaryPreferredChannel;
    v23->_peerPrimaryPreferredChannel = (WiFiChannel *)v32;

    uint64_t v34 = [v22 copy];
    peerSecondaryPreferredChannel = v23->_peerSecondaryPreferredChannel;
    v23->_peerSecondaryPreferredChannel = (WiFiChannel *)v34;
  }
  return v23;
}

+ (id)currentState
{
  return +[WiFiP2PXPCConnection directQueryOnEndpointType:2 error:0 querying:&__block_literal_global_248];
}

uint64_t __32__WiFiP2PAWDLState_currentState__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "queryAWDLState:");
}

- (WiFiP2PAWDLState)initWithCoder:(id)a3
{
  v27[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = (void *)MEMORY[0x1E4F1CAD0];
  v27[0] = objc_opt_class();
  v27[1] = objc_opt_class();
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:2];
  v7 = [v5 setWithArray:v6];
  v8 = [v4 decodeObjectOfClasses:v7 forKey:@"AWDLState.channelSequenceKey"];

  if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v9 = v8;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v23;
      while (2)
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v23 != v12) {
            objc_enumerationMutation(v9);
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            id v20 = 0;
            v14 = v9;
            goto LABEL_20;
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }

    v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AWDLState.interfaceNameKey"];
    v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AWDLState.macAddressKey"];
    v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AWDLState.peerMasterChannelKey"];
    id v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AWDLState.peerPrimaryPreferredChannelKey"];
    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AWDLState.peerSecondaryPreferredChannelKey"];
    id v19 = (void *)v18;
    id v20 = 0;
    if (v14 && v15 && v16 && v17 && v18)
    {
      self = -[WiFiP2PAWDLState initWithInterfaceName:supportsSoloMode:supportsDataTransfer:channelSequence:isEnabled:substate:macAddress:peerMasterChannel:peerPrimaryPreferredChannel:peerSecondaryPreferredChannel:](self, "initWithInterfaceName:supportsSoloMode:supportsDataTransfer:channelSequence:isEnabled:substate:macAddress:peerMasterChannel:peerPrimaryPreferredChannel:peerSecondaryPreferredChannel:", v14, [v4 decodeBoolForKey:@"AWDLState.supportsSoloModeKey"], objc_msgSend(v4, "decodeBoolForKey:", @"AWDLState.supportsDataTransferKey"), v9, objc_msgSend(v4, "decodeBoolForKey:", @"AWDLState.isEnabledKey"), objc_msgSend(v4, "decodeInt32ForKey:", @"AWDLState.substateKey"), v15, v16, v17, v18);
      id v20 = self;
    }

LABEL_20:
  }
  else
  {
    id v20 = 0;
  }

  return v20;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(WiFiP2PAWDLState *)self interfaceName];
  [v4 encodeObject:v5 forKey:@"AWDLState.interfaceNameKey"];

  objc_msgSend(v4, "encodeBool:forKey:", -[WiFiP2PAWDLState supportsSoloMode](self, "supportsSoloMode"), @"AWDLState.supportsSoloModeKey");
  objc_msgSend(v4, "encodeBool:forKey:", -[WiFiP2PAWDLState supportsDataTransfer](self, "supportsDataTransfer"), @"AWDLState.supportsDataTransferKey");
  v6 = [(WiFiP2PAWDLState *)self channelSequence];
  [v4 encodeObject:v6 forKey:@"AWDLState.channelSequenceKey"];

  objc_msgSend(v4, "encodeBool:forKey:", -[WiFiP2PAWDLState isEnabled](self, "isEnabled"), @"AWDLState.isEnabledKey");
  objc_msgSend(v4, "encodeInt32:forKey:", -[WiFiP2PAWDLState substate](self, "substate"), @"AWDLState.substateKey");
  v7 = [(WiFiP2PAWDLState *)self macAddress];
  [v4 encodeObject:v7 forKey:@"AWDLState.macAddressKey"];

  v8 = [(WiFiP2PAWDLState *)self peerMasterChannel];
  [v4 encodeObject:v8 forKey:@"AWDLState.peerMasterChannelKey"];

  id v9 = [(WiFiP2PAWDLState *)self peerPrimaryPreferredChannel];
  [v4 encodeObject:v9 forKey:@"AWDLState.peerPrimaryPreferredChannelKey"];

  id v10 = [(WiFiP2PAWDLState *)self peerSecondaryPreferredChannel];
  [v4 encodeObject:v10 forKey:@"AWDLState.peerSecondaryPreferredChannelKey"];
}

- (id)description
{
  v3 = NSString;
  id v4 = [(WiFiP2PAWDLState *)self interfaceName];
  if ([(WiFiP2PAWDLState *)self isEnabled]) {
    v5 = "enabled";
  }
  else {
    v5 = "disabled";
  }
  if ([(WiFiP2PAWDLState *)self supportsSoloMode]) {
    v6 = " supportsSoloMode";
  }
  else {
    v6 = "";
  }
  v7 = [(WiFiP2PAWDLState *)self channelSequence];
  v8 = [v3 stringWithFormat:@"<%@: %s%s ChannelSequence=%@>", v4, v5, v6, v7];

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (WiFiP2PAWDLState *)a3;
  if (self != v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      BOOL v25 = 0;
      v5 = 0;
      goto LABEL_24;
    }
    v5 = v4;
    v6 = [(WiFiP2PAWDLState *)self interfaceName];
    v7 = [(WiFiP2PAWDLState *)v5 interfaceName];
    if ([v6 isEqual:v7])
    {
      BOOL v8 = [(WiFiP2PAWDLState *)self supportsSoloMode];
      if (v8 == [(WiFiP2PAWDLState *)v5 supportsSoloMode])
      {
        id v9 = [(WiFiP2PAWDLState *)self channelSequence];
        id v10 = [(WiFiP2PAWDLState *)v5 channelSequence];
        if ([v9 isEqual:v10])
        {
          BOOL v11 = [(WiFiP2PAWDLState *)self isEnabled];
          if (v11 == [(WiFiP2PAWDLState *)v5 isEnabled])
          {
            BOOL v12 = [(WiFiP2PAWDLState *)self supportsDataTransfer];
            if (v12 == [(WiFiP2PAWDLState *)v5 supportsDataTransfer])
            {
              unsigned int v13 = [(WiFiP2PAWDLState *)self substate];
              if (v13 == [(WiFiP2PAWDLState *)v5 substate])
              {
                v14 = [(WiFiP2PAWDLState *)self macAddress];
                v15 = [(WiFiP2PAWDLState *)v5 macAddress];
                if ([v14 isEqual:v15])
                {
                  v31 = v14;
                  v16 = [(WiFiP2PAWDLState *)self peerMasterChannel];
                  id v17 = [(WiFiP2PAWDLState *)v5 peerMasterChannel];
                  if ([v16 isEqual:v17])
                  {
                    uint64_t v28 = v17;
                    v29 = v15;
                    uint64_t v30 = v16;
                    uint64_t v18 = [(WiFiP2PAWDLState *)self peerPrimaryPreferredChannel];
                    uint64_t v19 = [(WiFiP2PAWDLState *)v5 peerPrimaryPreferredChannel];
                    id v20 = (void *)v18;
                    id v21 = (void *)v18;
                    long long v22 = (void *)v19;
                    if (objc_msgSend(v21, "isEqual:"))
                    {
                      long long v23 = [(WiFiP2PAWDLState *)self peerSecondaryPreferredChannel];
                      long long v24 = [(WiFiP2PAWDLState *)v5 peerSecondaryPreferredChannel];
                      char v27 = [v23 isEqual:v24];

                      if ((v27 & 1) == 0) {
                        goto LABEL_23;
                      }
                      goto LABEL_15;
                    }
                  }
                  else
                  {
                  }
                }
                else
                {
                }
              }
            }
          }
        }
      }
    }

LABEL_23:
    BOOL v25 = 0;
    goto LABEL_24;
  }
  v5 = 0;
LABEL_15:
  BOOL v25 = 1;
LABEL_24:

  return v25;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v16 = [WiFiP2PAWDLState alloc];
  id v4 = [(WiFiP2PAWDLState *)self interfaceName];
  BOOL v5 = [(WiFiP2PAWDLState *)self supportsSoloMode];
  BOOL v6 = [(WiFiP2PAWDLState *)self supportsDataTransfer];
  v7 = [(WiFiP2PAWDLState *)self channelSequence];
  BOOL v8 = [(WiFiP2PAWDLState *)self isEnabled];
  uint64_t v9 = [(WiFiP2PAWDLState *)self substate];
  id v10 = [(WiFiP2PAWDLState *)self macAddress];
  BOOL v11 = [(WiFiP2PAWDLState *)self peerMasterChannel];
  BOOL v12 = [(WiFiP2PAWDLState *)self peerPrimaryPreferredChannel];
  unsigned int v13 = [(WiFiP2PAWDLState *)self peerSecondaryPreferredChannel];
  v14 = [(WiFiP2PAWDLState *)v16 initWithInterfaceName:v4 supportsSoloMode:v5 supportsDataTransfer:v6 channelSequence:v7 isEnabled:v8 substate:v9 macAddress:v10 peerMasterChannel:v11 peerPrimaryPreferredChannel:v12 peerSecondaryPreferredChannel:v13];

  return v14;
}

- (NSString)interfaceName
{
  return self->_interfaceName;
}

- (BOOL)supportsSoloMode
{
  return self->_supportsSoloMode;
}

- (BOOL)supportsDataTransfer
{
  return self->_supportsDataTransfer;
}

- (NSArray)channelSequence
{
  return self->_channelSequence;
}

- (BOOL)isEnabled
{
  return self->_isEnabled;
}

- (unsigned)substate
{
  return self->_substate;
}

- (WiFiMACAddress)macAddress
{
  return self->_macAddress;
}

- (WiFiChannel)peerMasterChannel
{
  return self->_peerMasterChannel;
}

- (WiFiChannel)peerPrimaryPreferredChannel
{
  return self->_peerPrimaryPreferredChannel;
}

- (WiFiChannel)peerSecondaryPreferredChannel
{
  return self->_peerSecondaryPreferredChannel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_peerSecondaryPreferredChannel, 0);
  objc_storeStrong((id *)&self->_peerPrimaryPreferredChannel, 0);
  objc_storeStrong((id *)&self->_peerMasterChannel, 0);
  objc_storeStrong((id *)&self->_macAddress, 0);
  objc_storeStrong((id *)&self->_channelSequence, 0);
  objc_storeStrong((id *)&self->_interfaceName, 0);
}

@end