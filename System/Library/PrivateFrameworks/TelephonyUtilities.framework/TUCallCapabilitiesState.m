@interface TUCallCapabilitiesState
+ (BOOL)supportsSecureCoding;
- (BOOL)accountsMatchForSecondaryCalling;
- (BOOL)accountsSupportSecondaryCalling;
- (BOOL)areCTCapabilitiesValid;
- (BOOL)areRelayCallingFeaturesEnabled;
- (BOOL)isEmergencyCallbackModeEnabled;
- (BOOL)isEmergencyCallbackPossible;
- (BOOL)isFaceTimeAudioAvailable;
- (BOOL)isFaceTimeVideoAvailable;
- (BOOL)isRelayCallingEnabled;
- (BOOL)supportsBasebandCalling;
- (BOOL)supportsCellularData;
- (BOOL)supportsDisplayingFaceTimeAudioCalls;
- (BOOL)supportsDisplayingFaceTimeVideoCalls;
- (BOOL)supportsDisplayingTelephonyCalls;
- (BOOL)supportsFaceTimeAudioRelayCalling;
- (BOOL)supportsFaceTimeVideoRelayCalling;
- (BOOL)supportsPrimaryCalling;
- (BOOL)supportsRelayCalling;
- (BOOL)supportsTelephonyRelayCalling;
- (NSArray)cloudCallingDevices;
- (NSDictionary)relayCallingDisabledForDeviceID;
- (NSDictionary)senderIdentityCapabilitiesStateByUUID;
- (NSString)description;
- (NSString)outgoingRelayCallerID;
- (TUCallCapabilitiesState)init;
- (TUCallCapabilitiesState)initWithCoder:(id)a3;
- (TUCloudCallingDevice)defaultPairedDevice;
- (id)copyWithZone:(_NSZone *)a3;
- (id)publiclyAccessibleCopy;
- (id)publiclyAccessibleCopyWithZone:(_NSZone *)a3;
- (int)relayCallingAvailability;
- (void)encodeWithCoder:(id)a3;
- (void)setAccountsMatchForSecondaryCalling:(BOOL)a3;
- (void)setAccountsSupportSecondaryCalling:(BOOL)a3;
- (void)setCloudCallingDevices:(id)a3;
- (void)setCtCapabilitiesValid:(BOOL)a3;
- (void)setEmergencyCallbackModeEnabled:(BOOL)a3;
- (void)setEmergencyCallbackPossible:(BOOL)a3;
- (void)setFaceTimeAudioAvailable:(BOOL)a3;
- (void)setFaceTimeVideoAvailable:(BOOL)a3;
- (void)setOutgoingRelayCallerID:(id)a3;
- (void)setRelayCallingAvailability:(int)a3;
- (void)setRelayCallingDisabledForDeviceID:(id)a3;
- (void)setRelayCallingEnabled:(BOOL)a3;
- (void)setRelayCallingFeaturesEnabled:(BOOL)a3;
- (void)setSenderIdentityCapabilitiesStateByUUID:(id)a3;
- (void)setSupportsBasebandCalling:(BOOL)a3;
- (void)setSupportsCellularData:(BOOL)a3;
- (void)setSupportsDisplayingFaceTimeAudioCalls:(BOOL)a3;
- (void)setSupportsDisplayingFaceTimeVideoCalls:(BOOL)a3;
- (void)setSupportsDisplayingTelephonyCalls:(BOOL)a3;
- (void)setSupportsFaceTimeAudioRelayCalling:(BOOL)a3;
- (void)setSupportsFaceTimeVideoRelayCalling:(BOOL)a3;
- (void)setSupportsPrimaryCalling:(BOOL)a3;
- (void)setSupportsRelayCalling:(BOOL)a3;
- (void)setSupportsTelephonyRelayCalling:(BOOL)a3;
@end

@implementation TUCallCapabilitiesState

- (id)publiclyAccessibleCopyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setSupportsPrimaryCalling:", -[TUCallCapabilitiesState supportsPrimaryCalling](self, "supportsPrimaryCalling"));
  objc_msgSend(v4, "setSupportsBasebandCalling:", -[TUCallCapabilitiesState supportsBasebandCalling](self, "supportsBasebandCalling"));
  objc_msgSend(v4, "setSupportsCellularData:", -[TUCallCapabilitiesState supportsCellularData](self, "supportsCellularData"));
  objc_msgSend(v4, "setSupportsDisplayingTelephonyCalls:", -[TUCallCapabilitiesState supportsDisplayingTelephonyCalls](self, "supportsDisplayingTelephonyCalls"));
  objc_msgSend(v4, "setSupportsDisplayingFaceTimeAudioCalls:", -[TUCallCapabilitiesState supportsDisplayingFaceTimeAudioCalls](self, "supportsDisplayingFaceTimeAudioCalls"));
  objc_msgSend(v4, "setSupportsDisplayingFaceTimeVideoCalls:", -[TUCallCapabilitiesState supportsDisplayingFaceTimeVideoCalls](self, "supportsDisplayingFaceTimeVideoCalls"));
  objc_msgSend(v4, "setFaceTimeAudioAvailable:", -[TUCallCapabilitiesState isFaceTimeAudioAvailable](self, "isFaceTimeAudioAvailable"));
  objc_msgSend(v4, "setFaceTimeVideoAvailable:", -[TUCallCapabilitiesState isFaceTimeVideoAvailable](self, "isFaceTimeVideoAvailable"));
  objc_msgSend(v4, "setCtCapabilitiesValid:", -[TUCallCapabilitiesState areCTCapabilitiesValid](self, "areCTCapabilitiesValid"));
  objc_msgSend(v4, "setSupportsRelayCalling:", -[TUCallCapabilitiesState supportsRelayCalling](self, "supportsRelayCalling"));
  objc_msgSend(v4, "setAccountsMatchForSecondaryCalling:", -[TUCallCapabilitiesState accountsMatchForSecondaryCalling](self, "accountsMatchForSecondaryCalling"));
  objc_msgSend(v4, "setAccountsSupportSecondaryCalling:", -[TUCallCapabilitiesState accountsSupportSecondaryCalling](self, "accountsSupportSecondaryCalling"));
  objc_msgSend(v4, "setRelayCallingFeaturesEnabled:", -[TUCallCapabilitiesState areRelayCallingFeaturesEnabled](self, "areRelayCallingFeaturesEnabled"));
  objc_msgSend(v4, "setRelayCallingEnabled:", -[TUCallCapabilitiesState isRelayCallingEnabled](self, "isRelayCallingEnabled"));
  objc_msgSend(v4, "setRelayCallingAvailability:", -[TUCallCapabilitiesState relayCallingAvailability](self, "relayCallingAvailability"));
  objc_msgSend(v4, "setSupportsTelephonyRelayCalling:", -[TUCallCapabilitiesState supportsTelephonyRelayCalling](self, "supportsTelephonyRelayCalling"));
  objc_msgSend(v4, "setSupportsFaceTimeAudioRelayCalling:", -[TUCallCapabilitiesState supportsFaceTimeAudioRelayCalling](self, "supportsFaceTimeAudioRelayCalling"));
  objc_msgSend(v4, "setSupportsFaceTimeVideoRelayCalling:", -[TUCallCapabilitiesState supportsFaceTimeVideoRelayCalling](self, "supportsFaceTimeVideoRelayCalling"));
  v5 = [(TUCallCapabilitiesState *)self senderIdentityCapabilitiesStateByUUID];
  [v4 setSenderIdentityCapabilitiesStateByUUID:v5];

  return v4;
}

- (TUCallCapabilitiesState)initWithCoder:(id)a3
{
  v23[3] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(TUCallCapabilitiesState *)self init];
  if (v5)
  {
    -[TUCallCapabilitiesState setSupportsPrimaryCalling:](v5, "setSupportsPrimaryCalling:", [v4 decodeBoolForKey:@"supportsPrimaryCalling"]);
    -[TUCallCapabilitiesState setSupportsBasebandCalling:](v5, "setSupportsBasebandCalling:", [v4 decodeBoolForKey:@"supportsBasebandCalling"]);
    -[TUCallCapabilitiesState setSupportsCellularData:](v5, "setSupportsCellularData:", [v4 decodeBoolForKey:@"supportsCellularData"]);
    -[TUCallCapabilitiesState setSupportsDisplayingTelephonyCalls:](v5, "setSupportsDisplayingTelephonyCalls:", [v4 decodeBoolForKey:@"supportsDisplayingTelephonyCalls"]);
    -[TUCallCapabilitiesState setSupportsDisplayingFaceTimeAudioCalls:](v5, "setSupportsDisplayingFaceTimeAudioCalls:", [v4 decodeBoolForKey:@"supportsDisplayingFaceTimeAudioCalls"]);
    -[TUCallCapabilitiesState setSupportsDisplayingFaceTimeVideoCalls:](v5, "setSupportsDisplayingFaceTimeVideoCalls:", [v4 decodeBoolForKey:@"supportsDisplayingFaceTimeVideoCalls"]);
    -[TUCallCapabilitiesState setFaceTimeAudioAvailable:](v5, "setFaceTimeAudioAvailable:", [v4 decodeBoolForKey:@"faceTimeAudioAvailable"]);
    -[TUCallCapabilitiesState setFaceTimeVideoAvailable:](v5, "setFaceTimeVideoAvailable:", [v4 decodeBoolForKey:@"faceTimeVideoAvailable"]);
    -[TUCallCapabilitiesState setCtCapabilitiesValid:](v5, "setCtCapabilitiesValid:", [v4 decodeBoolForKey:@"ctCapabilitiesValid"]);
    -[TUCallCapabilitiesState setSupportsRelayCalling:](v5, "setSupportsRelayCalling:", [v4 decodeBoolForKey:@"supportsRelayCalling"]);
    -[TUCallCapabilitiesState setAccountsMatchForSecondaryCalling:](v5, "setAccountsMatchForSecondaryCalling:", [v4 decodeBoolForKey:@"accountsMatchForSecondaryCalling"]);
    -[TUCallCapabilitiesState setAccountsSupportSecondaryCalling:](v5, "setAccountsSupportSecondaryCalling:", [v4 decodeBoolForKey:@"accountsSupportSecondaryCalling"]);
    -[TUCallCapabilitiesState setRelayCallingFeaturesEnabled:](v5, "setRelayCallingFeaturesEnabled:", [v4 decodeBoolForKey:@"relayCallingFeaturesEnabled"]);
    -[TUCallCapabilitiesState setRelayCallingEnabled:](v5, "setRelayCallingEnabled:", [v4 decodeBoolForKey:@"relayCallingEnabled"]);
    -[TUCallCapabilitiesState setRelayCallingAvailability:](v5, "setRelayCallingAvailability:", [v4 decodeIntForKey:@"relayCallingAvailability"]);
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    v23[0] = objc_opt_class();
    v23[1] = objc_opt_class();
    v23[2] = objc_opt_class();
    v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:3];
    v8 = [v6 setWithArray:v7];
    v9 = [v4 decodeObjectOfClasses:v8 forKey:@"relayCallingDisabledForDeviceID"];
    [(TUCallCapabilitiesState *)v5 setRelayCallingDisabledForDeviceID:v9];

    -[TUCallCapabilitiesState setSupportsTelephonyRelayCalling:](v5, "setSupportsTelephonyRelayCalling:", [v4 decodeBoolForKey:@"supportsTelephonyRelayCalling"]);
    -[TUCallCapabilitiesState setSupportsFaceTimeAudioRelayCalling:](v5, "setSupportsFaceTimeAudioRelayCalling:", [v4 decodeBoolForKey:@"supportsFaceTimeAudioRelayCalling"]);
    -[TUCallCapabilitiesState setSupportsFaceTimeVideoRelayCalling:](v5, "setSupportsFaceTimeVideoRelayCalling:", [v4 decodeBoolForKey:@"supportsFaceTimeVideoRelayCalling"]);
    v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"outgoingRelayCallerID"];
    [(TUCallCapabilitiesState *)v5 setOutgoingRelayCallerID:v10];

    v11 = (void *)MEMORY[0x1E4F1CAD0];
    v22[0] = objc_opt_class();
    v22[1] = objc_opt_class();
    v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:2];
    v13 = [v11 setWithArray:v12];
    v14 = [v4 decodeObjectOfClasses:v13 forKey:@"cloudCallingDevices"];
    [(TUCallCapabilitiesState *)v5 setCloudCallingDevices:v14];

    -[TUCallCapabilitiesState setEmergencyCallbackModeEnabled:](v5, "setEmergencyCallbackModeEnabled:", [v4 decodeBoolForKey:@"emergencyCallbackModeEnabled"]);
    -[TUCallCapabilitiesState setEmergencyCallbackPossible:](v5, "setEmergencyCallbackPossible:", [v4 decodeBoolForKey:@"emergencyCallbackPossible"]);
    v15 = (void *)MEMORY[0x1E4F1CAD0];
    v21[0] = objc_opt_class();
    v21[1] = objc_opt_class();
    v21[2] = objc_opt_class();
    v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:3];
    v17 = [v15 setWithArray:v16];
    v18 = NSStringFromSelector(sel_senderIdentityCapabilitiesStateByUUID);
    v19 = [v4 decodeObjectOfClasses:v17 forKey:v18];
    [(TUCallCapabilitiesState *)v5 setSenderIdentityCapabilitiesStateByUUID:v19];
  }
  return v5;
}

- (void)setSupportsTelephonyRelayCalling:(BOOL)a3
{
  self->_supportsTelephonyRelayCalling = a3;
}

- (void)setSupportsRelayCalling:(BOOL)a3
{
  self->_supportsRelayCalling = a3;
}

- (void)setSupportsPrimaryCalling:(BOOL)a3
{
  self->_supportsPrimaryCalling = a3;
}

- (void)setSupportsFaceTimeVideoRelayCalling:(BOOL)a3
{
  self->_supportsFaceTimeVideoRelayCalling = a3;
}

- (void)setSupportsFaceTimeAudioRelayCalling:(BOOL)a3
{
  self->_supportsFaceTimeAudioRelayCalling = a3;
}

- (void)setSupportsDisplayingTelephonyCalls:(BOOL)a3
{
  self->_supportsDisplayingTelephonyCalls = a3;
}

- (void)setSupportsDisplayingFaceTimeVideoCalls:(BOOL)a3
{
  self->_supportsDisplayingFaceTimeVideoCalls = a3;
}

- (void)setSupportsDisplayingFaceTimeAudioCalls:(BOOL)a3
{
  self->_supportsDisplayingFaceTimeAudioCalls = a3;
}

- (void)setSupportsCellularData:(BOOL)a3
{
  self->_supportsCellularData = a3;
}

- (void)setSupportsBasebandCalling:(BOOL)a3
{
  self->_supportsBasebandCalling = a3;
}

- (void)setSenderIdentityCapabilitiesStateByUUID:(id)a3
{
}

- (void)setRelayCallingFeaturesEnabled:(BOOL)a3
{
  self->_relayCallingFeaturesEnabled = a3;
}

- (void)setRelayCallingEnabled:(BOOL)a3
{
  self->_relayCallingEnabled = a3;
}

- (void)setRelayCallingAvailability:(int)a3
{
  self->_relayCallingAvailability = a3;
}

- (void)setFaceTimeVideoAvailable:(BOOL)a3
{
  self->_faceTimeVideoAvailable = a3;
}

- (void)setFaceTimeAudioAvailable:(BOOL)a3
{
  self->_faceTimeAudioAvailable = a3;
}

- (void)setCtCapabilitiesValid:(BOOL)a3
{
  self->_ctCapabilitiesValid = a3;
}

- (void)setAccountsSupportSecondaryCalling:(BOOL)a3
{
  self->_accountsSupportSecondaryCalling = a3;
}

- (void)setAccountsMatchForSecondaryCalling:(BOOL)a3
{
  self->_accountsMatchForSecondaryCalling = a3;
}

- (TUCallCapabilitiesState)init
{
  v9.receiver = self;
  v9.super_class = (Class)TUCallCapabilitiesState;
  v2 = [(TUCallCapabilitiesState *)&v9 init];
  v3 = v2;
  if (v2)
  {
    cloudCallingDevices = v2->_cloudCallingDevices;
    v2->_cloudCallingDevices = (NSArray *)MEMORY[0x1E4F1CBF0];

    relayCallingDisabledForDeviceID = v3->_relayCallingDisabledForDeviceID;
    v6 = (NSDictionary *)MEMORY[0x1E4F1CC08];
    v3->_relayCallingDisabledForDeviceID = (NSDictionary *)MEMORY[0x1E4F1CC08];

    senderIdentityCapabilitiesStateByUUID = v3->_senderIdentityCapabilitiesStateByUUID;
    v3->_senderIdentityCapabilitiesStateByUUID = v6;
  }
  return v3;
}

- (void)setRelayCallingDisabledForDeviceID:(id)a3
{
}

- (void)setOutgoingRelayCallerID:(id)a3
{
}

- (void)setEmergencyCallbackPossible:(BOOL)a3
{
  self->_emergencyCallbackPossible = a3;
}

- (void)setEmergencyCallbackModeEnabled:(BOOL)a3
{
  self->_emergencyCallbackModeEnabled = a3;
}

- (void)setCloudCallingDevices:(id)a3
{
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", -[TUCallCapabilitiesState supportsPrimaryCalling](self, "supportsPrimaryCalling"), @"supportsPrimaryCalling");
  objc_msgSend(v4, "encodeBool:forKey:", -[TUCallCapabilitiesState supportsBasebandCalling](self, "supportsBasebandCalling"), @"supportsBasebandCalling");
  objc_msgSend(v4, "encodeBool:forKey:", -[TUCallCapabilitiesState supportsCellularData](self, "supportsCellularData"), @"supportsCellularData");
  objc_msgSend(v4, "encodeBool:forKey:", -[TUCallCapabilitiesState supportsDisplayingTelephonyCalls](self, "supportsDisplayingTelephonyCalls"), @"supportsDisplayingTelephonyCalls");
  objc_msgSend(v4, "encodeBool:forKey:", -[TUCallCapabilitiesState supportsDisplayingFaceTimeAudioCalls](self, "supportsDisplayingFaceTimeAudioCalls"), @"supportsDisplayingFaceTimeAudioCalls");
  objc_msgSend(v4, "encodeBool:forKey:", -[TUCallCapabilitiesState supportsDisplayingFaceTimeVideoCalls](self, "supportsDisplayingFaceTimeVideoCalls"), @"supportsDisplayingFaceTimeVideoCalls");
  objc_msgSend(v4, "encodeBool:forKey:", -[TUCallCapabilitiesState isFaceTimeAudioAvailable](self, "isFaceTimeAudioAvailable"), @"faceTimeAudioAvailable");
  objc_msgSend(v4, "encodeBool:forKey:", -[TUCallCapabilitiesState isFaceTimeVideoAvailable](self, "isFaceTimeVideoAvailable"), @"faceTimeVideoAvailable");
  objc_msgSend(v4, "encodeBool:forKey:", -[TUCallCapabilitiesState areCTCapabilitiesValid](self, "areCTCapabilitiesValid"), @"ctCapabilitiesValid");
  objc_msgSend(v4, "encodeBool:forKey:", -[TUCallCapabilitiesState supportsRelayCalling](self, "supportsRelayCalling"), @"supportsRelayCalling");
  objc_msgSend(v4, "encodeBool:forKey:", -[TUCallCapabilitiesState accountsMatchForSecondaryCalling](self, "accountsMatchForSecondaryCalling"), @"accountsMatchForSecondaryCalling");
  objc_msgSend(v4, "encodeBool:forKey:", -[TUCallCapabilitiesState accountsSupportSecondaryCalling](self, "accountsSupportSecondaryCalling"), @"accountsSupportSecondaryCalling");
  objc_msgSend(v4, "encodeBool:forKey:", -[TUCallCapabilitiesState areRelayCallingFeaturesEnabled](self, "areRelayCallingFeaturesEnabled"), @"relayCallingFeaturesEnabled");
  objc_msgSend(v4, "encodeBool:forKey:", -[TUCallCapabilitiesState isRelayCallingEnabled](self, "isRelayCallingEnabled"), @"relayCallingEnabled");
  objc_msgSend(v4, "encodeInt:forKey:", -[TUCallCapabilitiesState relayCallingAvailability](self, "relayCallingAvailability"), @"relayCallingAvailability");
  v5 = [(TUCallCapabilitiesState *)self relayCallingDisabledForDeviceID];
  [v4 encodeObject:v5 forKey:@"relayCallingDisabledForDeviceID"];

  objc_msgSend(v4, "encodeBool:forKey:", -[TUCallCapabilitiesState supportsTelephonyRelayCalling](self, "supportsTelephonyRelayCalling"), @"supportsTelephonyRelayCalling");
  objc_msgSend(v4, "encodeBool:forKey:", -[TUCallCapabilitiesState supportsFaceTimeAudioRelayCalling](self, "supportsFaceTimeAudioRelayCalling"), @"supportsFaceTimeAudioRelayCalling");
  objc_msgSend(v4, "encodeBool:forKey:", -[TUCallCapabilitiesState supportsFaceTimeVideoRelayCalling](self, "supportsFaceTimeVideoRelayCalling"), @"supportsFaceTimeVideoRelayCalling");
  v6 = [(TUCallCapabilitiesState *)self outgoingRelayCallerID];
  [v4 encodeObject:v6 forKey:@"outgoingRelayCallerID"];

  v7 = [(TUCallCapabilitiesState *)self cloudCallingDevices];
  [v4 encodeObject:v7 forKey:@"cloudCallingDevices"];

  objc_msgSend(v4, "encodeBool:forKey:", -[TUCallCapabilitiesState isEmergencyCallbackModeEnabled](self, "isEmergencyCallbackModeEnabled"), @"emergencyCallbackModeEnabled");
  objc_msgSend(v4, "encodeBool:forKey:", -[TUCallCapabilitiesState isEmergencyCallbackPossible](self, "isEmergencyCallbackPossible"), @"emergencyCallbackPossible");
  id v9 = [(TUCallCapabilitiesState *)self senderIdentityCapabilitiesStateByUUID];
  v8 = NSStringFromSelector(sel_senderIdentityCapabilitiesStateByUUID);
  [v4 encodeObject:v9 forKey:v8];
}

- (BOOL)supportsDisplayingFaceTimeVideoCalls
{
  return self->_supportsDisplayingFaceTimeVideoCalls;
}

- (BOOL)supportsTelephonyRelayCalling
{
  return self->_supportsTelephonyRelayCalling;
}

- (BOOL)supportsRelayCalling
{
  return self->_supportsRelayCalling;
}

- (BOOL)supportsFaceTimeVideoRelayCalling
{
  return self->_supportsFaceTimeVideoRelayCalling;
}

- (BOOL)supportsFaceTimeAudioRelayCalling
{
  return self->_supportsFaceTimeAudioRelayCalling;
}

- (BOOL)supportsDisplayingTelephonyCalls
{
  return self->_supportsDisplayingTelephonyCalls;
}

- (BOOL)supportsCellularData
{
  return self->_supportsCellularData;
}

- (BOOL)supportsBasebandCalling
{
  return self->_supportsBasebandCalling;
}

- (NSDictionary)senderIdentityCapabilitiesStateByUUID
{
  return self->_senderIdentityCapabilitiesStateByUUID;
}

- (int)relayCallingAvailability
{
  return self->_relayCallingAvailability;
}

- (BOOL)isRelayCallingEnabled
{
  return self->_relayCallingEnabled;
}

- (BOOL)isFaceTimeVideoAvailable
{
  return self->_faceTimeVideoAvailable;
}

- (BOOL)isFaceTimeAudioAvailable
{
  return self->_faceTimeAudioAvailable;
}

- (BOOL)areRelayCallingFeaturesEnabled
{
  return self->_relayCallingFeaturesEnabled;
}

- (BOOL)areCTCapabilitiesValid
{
  return self->_ctCapabilitiesValid;
}

- (BOOL)accountsSupportSecondaryCalling
{
  return self->_accountsSupportSecondaryCalling;
}

- (BOOL)accountsMatchForSecondaryCalling
{
  return self->_accountsMatchForSecondaryCalling;
}

- (NSDictionary)relayCallingDisabledForDeviceID
{
  return self->_relayCallingDisabledForDeviceID;
}

- (NSString)outgoingRelayCallerID
{
  return self->_outgoingRelayCallerID;
}

- (BOOL)isEmergencyCallbackPossible
{
  return self->_emergencyCallbackPossible;
}

- (BOOL)isEmergencyCallbackModeEnabled
{
  return self->_emergencyCallbackModeEnabled;
}

- (NSArray)cloudCallingDevices
{
  return self->_cloudCallingDevices;
}

- (BOOL)supportsPrimaryCalling
{
  return self->_supportsPrimaryCalling;
}

- (BOOL)supportsDisplayingFaceTimeAudioCalls
{
  return self->_supportsDisplayingFaceTimeAudioCalls;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)publiclyAccessibleCopy
{
  return [(TUCallCapabilitiesState *)self publiclyAccessibleCopyWithZone:0];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_senderIdentityCapabilitiesStateByUUID, 0);
  objc_storeStrong((id *)&self->_cloudCallingDevices, 0);
  objc_storeStrong((id *)&self->_outgoingRelayCallerID, 0);

  objc_storeStrong((id *)&self->_relayCallingDisabledForDeviceID, 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [(TUCallCapabilitiesState *)self publiclyAccessibleCopyWithZone:a3];
  v5 = [(TUCallCapabilitiesState *)self relayCallingDisabledForDeviceID];
  [v4 setRelayCallingDisabledForDeviceID:v5];

  v6 = [(TUCallCapabilitiesState *)self outgoingRelayCallerID];
  [v4 setOutgoingRelayCallerID:v6];

  id v7 = objc_alloc(MEMORY[0x1E4F1C978]);
  v8 = [(TUCallCapabilitiesState *)self cloudCallingDevices];
  id v9 = (void *)[v7 initWithArray:v8 copyItems:1];
  [v4 setCloudCallingDevices:v9];

  objc_msgSend(v4, "setEmergencyCallbackModeEnabled:", -[TUCallCapabilitiesState isEmergencyCallbackModeEnabled](self, "isEmergencyCallbackModeEnabled"));
  objc_msgSend(v4, "setEmergencyCallbackPossible:", -[TUCallCapabilitiesState isEmergencyCallbackPossible](self, "isEmergencyCallbackPossible"));
  return v4;
}

- (NSString)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p>\n", objc_opt_class(), self];
  [v3 appendString:@"Device Capabilities:\n"];
  if ([(TUCallCapabilitiesState *)self supportsPrimaryCalling]) {
    id v4 = @"YES";
  }
  else {
    id v4 = @"NO";
  }
  [v3 appendFormat:@"    supportsPrimaryCalling: %@\n", v4];
  if ([(TUCallCapabilitiesState *)self supportsBasebandCalling]) {
    v5 = @"YES";
  }
  else {
    v5 = @"NO";
  }
  [v3 appendFormat:@"    supportsBasebandCalling: %@\n", v5];
  if ([(TUCallCapabilitiesState *)self supportsCellularData]) {
    v6 = @"YES";
  }
  else {
    v6 = @"NO";
  }
  [v3 appendFormat:@"    supportsCellularData: %@\n", v6];
  [v3 appendString:@"Displaying support:\n"];
  if ([(TUCallCapabilitiesState *)self supportsDisplayingTelephonyCalls]) {
    id v7 = @"YES";
  }
  else {
    id v7 = @"NO";
  }
  [v3 appendFormat:@"    supportsDisplayingTelephonyCalls: %@\n", v7];
  if ([(TUCallCapabilitiesState *)self supportsDisplayingFaceTimeAudioCalls]) {
    v8 = @"YES";
  }
  else {
    v8 = @"NO";
  }
  [v3 appendFormat:@"    supportsDisplayingFaceTimeAudioCalls: %@\n", v8];
  if ([(TUCallCapabilitiesState *)self supportsDisplayingFaceTimeVideoCalls]) {
    id v9 = @"YES";
  }
  else {
    id v9 = @"NO";
  }
  [v3 appendFormat:@"    supportsDisplayingFaceTimeVideoCalls: %@\n", v9];
  [v3 appendString:@"Calling Availability:\n"];
  if ([(TUCallCapabilitiesState *)self isFaceTimeAudioAvailable]) {
    v10 = @"YES";
  }
  else {
    v10 = @"NO";
  }
  [v3 appendFormat:@"    isFaceTimeAudioAvailable: %@\n", v10];
  if ([(TUCallCapabilitiesState *)self isFaceTimeVideoAvailable]) {
    v11 = @"YES";
  }
  else {
    v11 = @"NO";
  }
  [v3 appendFormat:@"    isFaceTimeVideoAvailable: %@\n", v11];
  [v3 appendString:@"CT Capability Validity:\n"];
  if ([(TUCallCapabilitiesState *)self areCTCapabilitiesValid]) {
    v12 = @"YES";
  }
  else {
    v12 = @"NO";
  }
  [v3 appendFormat:@"    areCTCapabilitiesValid: %@\n", v12];
  [v3 appendString:@"Secondary calling:\n"];
  if ([(TUCallCapabilitiesState *)self accountsMatchForSecondaryCalling]) {
    v13 = @"YES";
  }
  else {
    v13 = @"NO";
  }
  [v3 appendFormat:@"    accountsMatchForSecondaryCalling: %@\n", v13];
  if ([(TUCallCapabilitiesState *)self accountsSupportSecondaryCalling]) {
    v14 = @"YES";
  }
  else {
    v14 = @"NO";
  }
  [v3 appendFormat:@"    accountsSupportSecondaryCalling: %@\n", v14];
  [v3 appendString:@"Relay calling:\n"];
  if ([(TUCallCapabilitiesState *)self supportsRelayCalling]) {
    v15 = @"YES";
  }
  else {
    v15 = @"NO";
  }
  [v3 appendFormat:@"    supportsRelayCalling: %@\n", v15];
  if ([(TUCallCapabilitiesState *)self areRelayCallingFeaturesEnabled]) {
    v16 = @"YES";
  }
  else {
    v16 = @"NO";
  }
  [v3 appendFormat:@"    areRelayCallingFeaturesEnabled: %@\n", v16];
  if ([(TUCallCapabilitiesState *)self isRelayCallingEnabled]) {
    v17 = @"YES";
  }
  else {
    v17 = @"NO";
  }
  [v3 appendFormat:@"    isRelayCallingEnabled: %@\n", v17];
  objc_msgSend(v3, "appendFormat:", @"    relayCallingAvailability: %d\n", -[TUCallCapabilitiesState relayCallingAvailability](self, "relayCallingAvailability"));
  v18 = [(TUCallCapabilitiesState *)self relayCallingDisabledForDeviceID];
  [v3 appendFormat:@"    relayCallingDisabledForDeviceID: %@\n", v18];

  [v3 appendString:@"Outgoing relay calling:\n"];
  if ([(TUCallCapabilitiesState *)self supportsTelephonyRelayCalling]) {
    v19 = @"YES";
  }
  else {
    v19 = @"NO";
  }
  [v3 appendFormat:@"    supportsTelephonyRelayCalling: %@\n", v19];
  if ([(TUCallCapabilitiesState *)self supportsFaceTimeAudioRelayCalling]) {
    v20 = @"YES";
  }
  else {
    v20 = @"NO";
  }
  [v3 appendFormat:@"    supportsFaceTimeAudioRelayCalling: %@\n", v20];
  if ([(TUCallCapabilitiesState *)self supportsFaceTimeVideoRelayCalling]) {
    v21 = @"YES";
  }
  else {
    v21 = @"NO";
  }
  [v3 appendFormat:@"    supportsFaceTimeVideoRelayCalling: %@\n", v21];
  v22 = [(TUCallCapabilitiesState *)self outgoingRelayCallerID];
  [v3 appendFormat:@"    outgoingRelayCallerID: %@\n", v22];

  [v3 appendString:@"Devices:\n"];
  v23 = [(TUCallCapabilitiesState *)self cloudCallingDevices];
  [v3 appendFormat:@"    cloudCallingDevices: %@\n", v23];

  [v3 appendString:@"Emergency callback:\n"];
  if ([(TUCallCapabilitiesState *)self isEmergencyCallbackModeEnabled]) {
    v24 = @"YES";
  }
  else {
    v24 = @"NO";
  }
  [v3 appendFormat:@"    emergencyCallbackModeEnabled: %@\n", v24];
  if ([(TUCallCapabilitiesState *)self isEmergencyCallbackPossible]) {
    v25 = @"YES";
  }
  else {
    v25 = @"NO";
  }
  [v3 appendFormat:@"    emergencyCallbackPossible: %@\n", v25];
  [v3 appendString:@"Sender Identity capabilities:\n"];
  v26 = [(TUCallCapabilitiesState *)self senderIdentityCapabilitiesStateByUUID];
  [v3 appendFormat:@"    senderIdentityCapabilitiesStateByUUID: %@\n", v26];

  return (NSString *)v3;
}

- (TUCloudCallingDevice)defaultPairedDevice
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v2 = [(TUCallCapabilitiesState *)self cloudCallingDevices];
  id v3 = (id)[v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v9;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v9 != v4) {
          objc_enumerationMutation(v2);
        }
        v6 = *(void **)(*((void *)&v8 + 1) + 8 * i);
        if ([v6 isDefaultPairedDevice])
        {
          id v3 = v6;
          goto LABEL_11;
        }
      }
      id v3 = (id)[v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (TUCloudCallingDevice *)v3;
}

@end