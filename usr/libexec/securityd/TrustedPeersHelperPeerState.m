@interface TrustedPeersHelperPeerState
+ (BOOL)supportsSecureCoding;
- (BOOL)identityIsPreapproved;
- (BOOL)memberChanges;
- (BOOL)unknownMachineIDsPresent;
- (NSString)osVersion;
- (NSString)peerID;
- (TPPBPeerStableInfoSetting)walrus;
- (TPPBPeerStableInfoSetting)webAccess;
- (TrustedPeersHelperPeerState)initWithCoder:(id)a3;
- (TrustedPeersHelperPeerState)initWithPeerID:(id)a3 isPreapproved:(BOOL)a4 status:(unint64_t)a5 memberChanges:(BOOL)a6 unknownMachineIDs:(BOOL)a7 osVersion:(id)a8 walrus:(id)a9 webAccess:(id)a10;
- (id)description;
- (unint64_t)peerStatus;
- (void)encodeWithCoder:(id)a3;
- (void)setIdentityIsPreapproved:(BOOL)a3;
- (void)setMemberChanges:(BOOL)a3;
- (void)setOsVersion:(id)a3;
- (void)setPeerID:(id)a3;
- (void)setPeerStatus:(unint64_t)a3;
- (void)setUnknownMachineIDsPresent:(BOOL)a3;
- (void)setWalrus:(id)a3;
- (void)setWebAccess:(id)a3;
@end

@implementation TrustedPeersHelperPeerState

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_webAccess, 0);
  objc_storeStrong((id *)&self->_walrus, 0);
  objc_storeStrong((id *)&self->_osVersion, 0);

  objc_storeStrong((id *)&self->_peerID, 0);
}

- (void)setWebAccess:(id)a3
{
}

- (TPPBPeerStableInfoSetting)webAccess
{
  return (TPPBPeerStableInfoSetting *)objc_getProperty(self, a2, 48, 1);
}

- (void)setWalrus:(id)a3
{
}

- (TPPBPeerStableInfoSetting)walrus
{
  return (TPPBPeerStableInfoSetting *)objc_getProperty(self, a2, 40, 1);
}

- (void)setOsVersion:(id)a3
{
}

- (NSString)osVersion
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setUnknownMachineIDsPresent:(BOOL)a3
{
  self->_unknownMachineIDsPresent = a3;
}

- (BOOL)unknownMachineIDsPresent
{
  return self->_unknownMachineIDsPresent;
}

- (void)setMemberChanges:(BOOL)a3
{
  self->_memberChanges = a3;
}

- (BOOL)memberChanges
{
  return self->_memberChanges;
}

- (void)setPeerStatus:(unint64_t)a3
{
  self->_peerStatus = a3;
}

- (unint64_t)peerStatus
{
  return self->_peerStatus;
}

- (void)setIdentityIsPreapproved:(BOOL)a3
{
  self->_identityIsPreapproved = a3;
}

- (BOOL)identityIsPreapproved
{
  return self->_identityIsPreapproved;
}

- (void)setPeerID:(id)a3
{
}

- (NSString)peerID
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(TrustedPeersHelperPeerState *)self peerID];
  [v4 encodeObject:v5 forKey:@"peerID"];

  [v4 encodeBool:-[TrustedPeersHelperPeerState identityIsPreapproved](self, "identityIsPreapproved") forKey:@"identityIsPreapproved"];
  [v4 encodeInt64:-[TrustedPeersHelperPeerState peerStatus](self, "peerStatus") forKey:@"peerStatus"];
  [v4 encodeInt64:-[TrustedPeersHelperPeerState memberChanges](self, "memberChanges") forKey:@"memberChanges"];
  [v4 encodeInt64:-[TrustedPeersHelperPeerState unknownMachineIDsPresent](self, "unknownMachineIDsPresent") forKey:@"unknownMachineIDs"];
  v6 = [(TrustedPeersHelperPeerState *)self osVersion];
  [v4 encodeObject:v6 forKey:@"osVersion"];

  v7 = [(TrustedPeersHelperPeerState *)self walrus];
  [v4 encodeObject:v7 forKey:@"walrus"];

  id v8 = [(TrustedPeersHelperPeerState *)self webAccess];
  [v4 encodeObject:v8 forKey:@"webAccess"];
}

- (TrustedPeersHelperPeerState)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)TrustedPeersHelperPeerState;
  v5 = [(TrustedPeersHelperPeerState *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"peerID"];
    peerID = v5->_peerID;
    v5->_peerID = (NSString *)v6;

    v5->_identityIsPreapproved = [v4 decodeBoolForKey:@"identityIsPreapproved"];
    v5->_peerStatus = (unint64_t)[v4 decodeInt64ForKey:@"peerStatus"];
    v5->_memberChanges = [v4 decodeInt64ForKey:@"memberChanges"] != 0;
    v5->_unknownMachineIDsPresent = [v4 decodeInt64ForKey:@"unknownMachineIDs"] != 0;
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"osVersion"];
    osVersion = v5->_osVersion;
    v5->_osVersion = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"walrus"];
    walrus = v5->_walrus;
    v5->_walrus = (TPPBPeerStableInfoSetting *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"webAccess"];
    webAccess = v5->_webAccess;
    v5->_webAccess = (TPPBPeerStableInfoSetting *)v12;
  }
  return v5;
}

- (id)description
{
  v3 = [(TrustedPeersHelperPeerState *)self peerID];
  unsigned int v4 = [(TrustedPeersHelperPeerState *)self identityIsPreapproved];
  [(TrustedPeersHelperPeerState *)self peerStatus];
  v5 = TPPeerStatusToString();
  if ([(TrustedPeersHelperPeerState *)self memberChanges]) {
    CFStringRef v6 = @"YES";
  }
  else {
    CFStringRef v6 = @"NO";
  }
  if ([(TrustedPeersHelperPeerState *)self unknownMachineIDsPresent]) {
    CFStringRef v7 = @"YES";
  }
  else {
    CFStringRef v7 = @"NO";
  }
  uint64_t v8 = [(TrustedPeersHelperPeerState *)self osVersion];
  v9 = (void *)v8;
  if (v8) {
    CFStringRef v10 = (const __CFString *)v8;
  }
  else {
    CFStringRef v10 = @"unknown";
  }
  v11 = [(TrustedPeersHelperPeerState *)self walrus];
  uint64_t v12 = [(TrustedPeersHelperPeerState *)self webAccess];
  v13 = +[NSString stringWithFormat:@"<TPHPeerState: %@ preapproved:%d status:%@ memberChanges: %@ unk. mIDs: %@ osVersion: %@ walrus: %@ webAccess: %@>", v3, v4, v5, v6, v7, v10, v11, v12];

  return v13;
}

- (TrustedPeersHelperPeerState)initWithPeerID:(id)a3 isPreapproved:(BOOL)a4 status:(unint64_t)a5 memberChanges:(BOOL)a6 unknownMachineIDs:(BOOL)a7 osVersion:(id)a8 walrus:(id)a9 webAccess:(id)a10
{
  id v23 = a3;
  id v15 = a8;
  id v16 = a9;
  id v17 = a10;
  v24.receiver = self;
  v24.super_class = (Class)TrustedPeersHelperPeerState;
  v18 = [(TrustedPeersHelperPeerState *)&v24 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_peerID, a3);
    v19->_identityIsPreapproved = a4;
    v19->_peerStatus = a5;
    v19->_memberChanges = a6;
    v19->_unknownMachineIDsPresent = a7;
    objc_storeStrong((id *)&v19->_osVersion, a8);
    objc_storeStrong((id *)&v19->_walrus, a9);
    objc_storeStrong((id *)&v19->_webAccess, a10);
  }

  return v19;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end