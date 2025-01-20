@interface TrustedPeersHelperEgoPeerStatus
+ (BOOL)supportsSecureCoding;
- (BOOL)isExcluded;
- (BOOL)isLocked;
- (NSDictionary)peerCountsByMachineID;
- (NSDictionary)viablePeerCountsByModelID;
- (NSString)egoPeerID;
- (NSString)egoPeerMachineID;
- (TrustedPeersHelperEgoPeerStatus)initWithCoder:(id)a3;
- (TrustedPeersHelperEgoPeerStatus)initWithEgoPeerID:(id)a3 egoPeerMachineID:(id)a4 status:(unint64_t)a5 viablePeerCountsByModelID:(id)a6 peerCountsByMachineID:(id)a7 isExcluded:(BOOL)a8 isLocked:(BOOL)a9;
- (id)description;
- (unint64_t)egoStatus;
- (unint64_t)numberOfPeersInOctagon;
- (void)encodeWithCoder:(id)a3;
- (void)setEgoPeerID:(id)a3;
- (void)setEgoPeerMachineID:(id)a3;
- (void)setEgoStatus:(unint64_t)a3;
- (void)setIsExcluded:(BOOL)a3;
- (void)setIsLocked:(BOOL)a3;
- (void)setNumberOfPeersInOctagon:(unint64_t)a3;
- (void)setPeerCountsByMachineID:(id)a3;
- (void)setViablePeerCountsByModelID:(id)a3;
@end

@implementation TrustedPeersHelperEgoPeerStatus

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_peerCountsByMachineID, 0);
  objc_storeStrong((id *)&self->_viablePeerCountsByModelID, 0);
  objc_storeStrong((id *)&self->_egoPeerMachineID, 0);

  objc_storeStrong((id *)&self->_egoPeerID, 0);
}

- (void)setIsLocked:(BOOL)a3
{
  self->_isLocked = a3;
}

- (BOOL)isLocked
{
  return self->_isLocked;
}

- (void)setIsExcluded:(BOOL)a3
{
  self->_isExcluded = a3;
}

- (BOOL)isExcluded
{
  return self->_isExcluded;
}

- (void)setPeerCountsByMachineID:(id)a3
{
}

- (NSDictionary)peerCountsByMachineID
{
  return (NSDictionary *)objc_getProperty(self, a2, 56, 1);
}

- (void)setViablePeerCountsByModelID:(id)a3
{
}

- (NSDictionary)viablePeerCountsByModelID
{
  return (NSDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (void)setNumberOfPeersInOctagon:(unint64_t)a3
{
  self->_numberOfPeersInOctagon = a3;
}

- (unint64_t)numberOfPeersInOctagon
{
  return self->_numberOfPeersInOctagon;
}

- (void)setEgoPeerMachineID:(id)a3
{
}

- (NSString)egoPeerMachineID
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setEgoPeerID:(id)a3
{
}

- (NSString)egoPeerID
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setEgoStatus:(unint64_t)a3
{
  self->_egoStatus = a3;
}

- (unint64_t)egoStatus
{
  return self->_egoStatus;
}

- (void)encodeWithCoder:(id)a3
{
  id v8 = a3;
  v4 = [(TrustedPeersHelperEgoPeerStatus *)self egoPeerID];
  [v8 encodeObject:v4 forKey:@"peerID"];

  v5 = [(TrustedPeersHelperEgoPeerStatus *)self egoPeerMachineID];
  [v8 encodeObject:v5 forKey:@"mID"];

  [v8 encodeInt64:-[TrustedPeersHelperEgoPeerStatus egoStatus](self, "egoStatus") forKey:@"egoStatus"];
  v6 = [(TrustedPeersHelperEgoPeerStatus *)self viablePeerCountsByModelID];
  [v8 encodeObject:v6 forKey:@"viablePeerCountsByModelID"];

  v7 = [(TrustedPeersHelperEgoPeerStatus *)self peerCountsByMachineID];
  [v8 encodeObject:v7 forKey:@"peerCountsByMachineID"];

  [v8 encodeBool:-[TrustedPeersHelperEgoPeerStatus isExcluded](self, "isExcluded") forKey:@"isExcluded"];
  [v8 encodeBool:-[TrustedPeersHelperEgoPeerStatus isLocked](self, "isLocked") forKey:@"isLocked"];
}

- (TrustedPeersHelperEgoPeerStatus)initWithCoder:(id)a3
{
  id v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)TrustedPeersHelperEgoPeerStatus;
  v5 = [(TrustedPeersHelperEgoPeerStatus *)&v28 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"peerID"];
    egoPeerID = v5->_egoPeerID;
    v5->_egoPeerID = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"mID"];
    egoPeerMachineID = v5->_egoPeerMachineID;
    v5->_egoPeerMachineID = (NSString *)v8;

    v5->_egoStatus = (unint64_t)[v4 decodeInt64ForKey:@"egoStatus"];
    v31[0] = objc_opt_class();
    v31[1] = objc_opt_class();
    v31[2] = objc_opt_class();
    v10 = +[NSArray arrayWithObjects:v31 count:3];
    v11 = +[NSSet setWithArray:v10];
    uint64_t v12 = [v4 decodeObjectOfClasses:v11 forKey:@"viablePeerCountsByModelID"];
    viablePeerCountsByModelID = v5->_viablePeerCountsByModelID;
    v5->_viablePeerCountsByModelID = (NSDictionary *)v12;

    v5->_numberOfPeersInOctagon = 0;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    v14 = [(NSDictionary *)v5->_viablePeerCountsByModelID allValues];
    id v15 = [v14 countByEnumeratingWithState:&v24 objects:v30 count:16];
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = *(void *)v25;
      do
      {
        v18 = 0;
        do
        {
          if (*(void *)v25 != v17) {
            objc_enumerationMutation(v14);
          }
          v5->_numberOfPeersInOctagon += (unint64_t)[*(id *)(*((void *)&v24 + 1) + 8 * (void)v18) unsignedIntegerValue];
          v18 = (char *)v18 + 1;
        }
        while (v16 != v18);
        id v16 = [v14 countByEnumeratingWithState:&v24 objects:v30 count:16];
      }
      while (v16);
    }

    v29[0] = objc_opt_class();
    v29[1] = objc_opt_class();
    v29[2] = objc_opt_class();
    v19 = +[NSArray arrayWithObjects:v29 count:3];
    v20 = +[NSSet setWithArray:v19];
    uint64_t v21 = [v4 decodeObjectOfClasses:v20 forKey:@"peerCountsByMachineID"];
    peerCountsByMachineID = v5->_peerCountsByMachineID;
    v5->_peerCountsByMachineID = (NSDictionary *)v21;

    v5->_isExcluded = [v4 decodeBoolForKey:@"isExcluded"];
    v5->_isLocked = [v4 decodeBoolForKey:@"isLocked"];
  }

  return v5;
}

- (id)description
{
  v3 = [(TrustedPeersHelperEgoPeerStatus *)self egoPeerID];
  id v4 = [(TrustedPeersHelperEgoPeerStatus *)self egoPeerMachineID];
  v5 = +[NSString stringWithFormat:@"<TPHEgoPeerState: %@ (mid:%@)>", v3, v4];

  return v5;
}

- (TrustedPeersHelperEgoPeerStatus)initWithEgoPeerID:(id)a3 egoPeerMachineID:(id)a4 status:(unint64_t)a5 viablePeerCountsByModelID:(id)a6 peerCountsByMachineID:(id)a7 isExcluded:(BOOL)a8 isLocked:(BOOL)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a6;
  id v18 = a7;
  v32.receiver = self;
  v32.super_class = (Class)TrustedPeersHelperEgoPeerStatus;
  v19 = [(TrustedPeersHelperEgoPeerStatus *)&v32 init];
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_egoPeerID, a3);
    objc_storeStrong((id *)&v20->_egoPeerMachineID, a4);
    v20->_egoStatus = a5;
    objc_storeStrong((id *)&v20->_viablePeerCountsByModelID, a6);
    objc_storeStrong((id *)&v20->_peerCountsByMachineID, a7);
    v20->_numberOfPeersInOctagon = 0;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    uint64_t v21 = [v17 allValues];
    id v22 = [v21 countByEnumeratingWithState:&v28 objects:v33 count:16];
    if (v22)
    {
      id v23 = v22;
      uint64_t v24 = *(void *)v29;
      do
      {
        for (i = 0; i != v23; i = (char *)i + 1)
        {
          if (*(void *)v29 != v24) {
            objc_enumerationMutation(v21);
          }
          v20->_numberOfPeersInOctagon += (unint64_t)[*(id *)(*((void *)&v28 + 1) + 8 * i) unsignedIntegerValue];
        }
        id v23 = [v21 countByEnumeratingWithState:&v28 objects:v33 count:16];
      }
      while (v23);
    }

    v20->_isExcluded = a8;
    v20->_isLocked = a9;
  }

  return v20;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end