@interface CKKSDeviceStateEntry
+ (BOOL)intransactionRecordChanged:(id)a3 contextID:(id)a4 resync:(BOOL)a5 error:(id *)a6;
+ (BOOL)intransactionRecordDeleted:(id)a3 contextID:(id)a4 resync:(BOOL)a5 error:(id *)a6;
+ (id)allInZone:(id)a3 error:(id *)a4;
+ (id)fromDatabase:(id)a3 contextID:(id)a4 zoneID:(id)a5 error:(id *)a6;
+ (id)fromDatabaseRow:(id)a3;
+ (id)intransactionCreateDeviceStateForView:(id)a3 accountTracker:(id)a4 lockStateTracker:(id)a5 error:(id *)a6;
+ (id)nameFromCKRecordID:(id)a3;
+ (id)sqlColumns;
+ (id)sqlTable;
+ (id)tryFromDatabase:(id)a3 contextID:(id)a4 zoneID:(id)a5 error:(id *)a6;
+ (id)tryFromDatabaseFromCKRecordID:(id)a3 contextID:(id)a4 error:(id *)a5;
- (BOOL)isEqual:(id)a3;
- (BOOL)matchesCKRecord:(id)a3;
- (NSDate)lastUnlockTime;
- (NSString)circlePeerID;
- (NSString)currentClassAUUID;
- (NSString)currentClassCUUID;
- (NSString)currentTLKUUID;
- (NSString)device;
- (NSString)octagonPeerID;
- (NSString)osVersion;
- (OTCliqueStatusWrapper)octagonStatus;
- (OctagonStateString)keyState;
- (id)CKRecordName;
- (id)cktypeToOTCliqueStatusWrapper:(id)a3;
- (id)cliqueStatusToCKType:(id)a3;
- (id)description;
- (id)initForDevice:(id)a3 contextID:(id)a4 osVersion:(id)a5 lastUnlockTime:(id)a6 octagonPeerID:(id)a7 octagonStatus:(id)a8 circlePeerID:(id)a9 circleStatus:(int)a10 keyState:(id)a11 currentTLKUUID:(id)a12 currentClassAUUID:(id)a13 currentClassCUUID:(id)a14 zoneID:(id)a15 encodedCKRecord:(id)a16;
- (id)sosCCStatusToCKType:(int)a3;
- (id)sqlValues;
- (id)updateCKRecord:(id)a3 zoneID:(id)a4;
- (id)whereClauseToFindSelf;
- (int)circleStatus;
- (int)cktypeToSOSCCStatus:(id)a3;
- (void)setCirclePeerID:(id)a3;
- (void)setCircleStatus:(int)a3;
- (void)setCurrentClassAUUID:(id)a3;
- (void)setCurrentClassCUUID:(id)a3;
- (void)setCurrentTLKUUID:(id)a3;
- (void)setDevice:(id)a3;
- (void)setFromCKRecord:(id)a3;
- (void)setKeyState:(id)a3;
- (void)setLastUnlockTime:(id)a3;
- (void)setOctagonPeerID:(id)a3;
- (void)setOctagonStatus:(id)a3;
- (void)setOsVersion:(id)a3;
@end

@implementation CKKSDeviceStateEntry

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentClassCUUID, 0);
  objc_storeStrong((id *)&self->_currentClassAUUID, 0);
  objc_storeStrong((id *)&self->_currentTLKUUID, 0);
  objc_storeStrong((id *)&self->_keyState, 0);
  objc_storeStrong((id *)&self->_octagonStatus, 0);
  objc_storeStrong((id *)&self->_octagonPeerID, 0);
  objc_storeStrong((id *)&self->_circlePeerID, 0);
  objc_storeStrong((id *)&self->_lastUnlockTime, 0);
  objc_storeStrong((id *)&self->_osVersion, 0);

  objc_storeStrong((id *)&self->_device, 0);
}

- (void)setCurrentClassCUUID:(id)a3
{
}

- (NSString)currentClassCUUID
{
  return (NSString *)objc_getProperty(self, a2, 136, 1);
}

- (void)setCurrentClassAUUID:(id)a3
{
}

- (NSString)currentClassAUUID
{
  return (NSString *)objc_getProperty(self, a2, 128, 1);
}

- (void)setCurrentTLKUUID:(id)a3
{
}

- (NSString)currentTLKUUID
{
  return (NSString *)objc_getProperty(self, a2, 120, 1);
}

- (void)setKeyState:(id)a3
{
}

- (OctagonStateString)keyState
{
  return (OctagonStateString *)objc_getProperty(self, a2, 112, 1);
}

- (void)setOctagonStatus:(id)a3
{
}

- (OTCliqueStatusWrapper)octagonStatus
{
  return (OTCliqueStatusWrapper *)objc_getProperty(self, a2, 104, 1);
}

- (void)setCircleStatus:(int)a3
{
  self->_circleStatus = a3;
}

- (int)circleStatus
{
  return self->_circleStatus;
}

- (void)setOctagonPeerID:(id)a3
{
}

- (NSString)octagonPeerID
{
  return (NSString *)objc_getProperty(self, a2, 96, 1);
}

- (void)setCirclePeerID:(id)a3
{
}

- (NSString)circlePeerID
{
  return (NSString *)objc_getProperty(self, a2, 88, 1);
}

- (void)setLastUnlockTime:(id)a3
{
}

- (NSDate)lastUnlockTime
{
  return (NSDate *)objc_getProperty(self, a2, 80, 1);
}

- (void)setOsVersion:(id)a3
{
}

- (NSString)osVersion
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (void)setDevice:(id)a3
{
}

- (NSString)device
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (id)sqlValues
{
  id v3 = objc_alloc_init((Class)NSISO8601DateFormatter);
  v57[0] = @"contextID";
  v55 = [(CKKSCKRecordHolder *)self contextID];
  v58[0] = v55;
  v57[1] = @"device";
  v54 = [(CKKSDeviceStateEntry *)self device];
  v58[1] = v54;
  v57[2] = @"ckzone";
  v4 = [(CKKSCKRecordHolder *)self zoneID];
  v5 = [v4 zoneName];

  if (v5)
  {
    id v6 = v5;
  }
  else
  {
    id v6 = +[NSNull null];
  }
  id v7 = v6;

  v58[2] = v7;
  v57[3] = @"osversion";
  v8 = [(CKKSDeviceStateEntry *)self osVersion];
  v9 = v8;
  if (v8)
  {
    id v10 = v8;
  }
  else
  {
    id v10 = +[NSNull null];
  }
  v11 = v10;

  v58[3] = v11;
  v57[4] = @"lastunlock";
  uint64_t v12 = [(CKKSDeviceStateEntry *)self lastUnlockTime];
  if (!v12
    || (v13 = (void *)v12,
        [(CKKSDeviceStateEntry *)self lastUnlockTime],
        v14 = objc_claimAutoreleasedReturnValue(),
        [v3 stringFromDate:v14],
        v15 = objc_claimAutoreleasedReturnValue(),
        v14,
        v13,
        !v15))
  {
    v15 = +[NSNull null];
  }
  v58[4] = v15;
  v57[5] = @"peerid";
  v16 = [(CKKSDeviceStateEntry *)self circlePeerID];
  v17 = v16;
  if (v16)
  {
    id v18 = v16;
  }
  else
  {
    id v18 = +[NSNull null];
  }
  id v19 = v18;

  v58[5] = v19;
  v57[6] = @"circlestatus";
  unsigned int v20 = [(CKKSDeviceStateEntry *)self circleStatus] + 1;
  if (v20 > 4) {
    CFStringRef v21 = @"kSOSCCError";
  }
  else {
    CFStringRef v21 = off_1003079C8[v20];
  }
  v58[6] = v21;
  v57[7] = @"octagonpeerid";
  v22 = [(CKKSDeviceStateEntry *)self octagonPeerID];
  v23 = v22;
  v52 = v19;
  if (v22)
  {
    id v24 = v22;
  }
  else
  {
    id v24 = +[NSNull null];
  }
  v25 = v24;

  v58[7] = v25;
  v57[8] = @"octagonstatus";
  uint64_t v26 = [(CKKSDeviceStateEntry *)self octagonStatus];
  if (!v26) {
    goto LABEL_21;
  }
  v27 = (void *)v26;
  v28 = [(CKKSDeviceStateEntry *)self octagonStatus];
  [v28 status];
  v29 = OTCliqueStatusToString();

  if (!v29)
  {
LABEL_21:
    v29 = +[NSNull null];
  }
  v58[8] = v29;
  v57[9] = @"keystate";
  v30 = [(CKKSDeviceStateEntry *)self keyState];
  v31 = v30;
  v56 = v3;
  if (v30)
  {
    id v32 = v30;
  }
  else
  {
    id v32 = +[NSNull null];
  }
  v33 = v32;

  v58[9] = v33;
  v57[10] = @"currentTLK";
  v34 = [(CKKSDeviceStateEntry *)self currentTLKUUID];
  v35 = v34;
  v53 = v7;
  if (v34)
  {
    id v36 = v34;
  }
  else
  {
    id v36 = +[NSNull null];
  }
  v37 = v36;

  v58[10] = v37;
  v57[11] = @"currentClassA";
  v38 = [(CKKSDeviceStateEntry *)self currentClassAUUID];
  v39 = v38;
  if (v38)
  {
    id v40 = v38;
  }
  else
  {
    id v40 = +[NSNull null];
  }
  v41 = v40;

  v58[11] = v41;
  v57[12] = @"currentClassC";
  v42 = [(CKKSDeviceStateEntry *)self currentClassCUUID];
  v43 = v42;
  if (v42)
  {
    id v44 = v42;
  }
  else
  {
    id v44 = +[NSNull null];
  }
  v45 = v44;

  v58[12] = v45;
  v57[13] = @"ckrecord";
  v46 = [(CKKSCKRecordHolder *)self encodedCKRecord];
  v47 = [v46 base64EncodedStringWithOptions:0];

  if (v47)
  {
    id v48 = v47;
  }
  else
  {
    id v48 = +[NSNull null];
  }
  v49 = v48;

  v58[13] = v49;
  v50 = +[NSDictionary dictionaryWithObjects:v58 forKeys:v57 count:14];

  return v50;
}

- (id)whereClauseToFindSelf
{
  v9[0] = @"contextID";
  id v3 = [(CKKSCKRecordHolder *)self contextID];
  v10[0] = v3;
  v9[1] = @"device";
  v4 = [(CKKSDeviceStateEntry *)self device];
  v10[1] = v4;
  v9[2] = @"ckzone";
  v5 = [(CKKSCKRecordHolder *)self zoneID];
  id v6 = [v5 zoneName];
  v10[2] = v6;
  id v7 = +[NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:3];

  return v7;
}

- (void)setFromCKRecord:(id)a3
{
  id v29 = a3;
  v4 = [v29 recordType];
  unsigned __int8 v5 = [v4 isEqualToString:@"devicestate"];

  if ((v5 & 1) == 0)
  {
    uint64_t v26 = [v29 recordType];
    v27 = +[NSString stringWithFormat:@"CKRecordType (%@) was not %@", v26, @"devicestate"];
    id v28 = +[NSException exceptionWithName:@"WrongCKRecordTypeException" reason:v27 userInfo:0];

    objc_exception_throw(v28);
  }
  [(CKKSCKRecordHolder *)self setStoredCKRecord:v29];
  id v6 = [v29 objectForKeyedSubscript:@"osver"];
  [(CKKSDeviceStateEntry *)self setOsVersion:v6];

  id v7 = [v29 objectForKeyedSubscript:@"lastunlock"];
  [(CKKSDeviceStateEntry *)self setLastUnlockTime:v7];

  v8 = [v29 recordID];
  v9 = +[CKKSDeviceStateEntry nameFromCKRecordID:v8];
  [(CKKSDeviceStateEntry *)self setDevice:v9];

  id v10 = [v29 objectForKeyedSubscript:@"octagonpeerid"];
  [(CKKSDeviceStateEntry *)self setOctagonPeerID:v10];

  v11 = [v29 objectForKeyedSubscript:@"octagonstatus"];
  uint64_t v12 = [(CKKSDeviceStateEntry *)self cktypeToOTCliqueStatusWrapper:v11];
  [(CKKSDeviceStateEntry *)self setOctagonStatus:v12];

  v13 = [v29 objectForKeyedSubscript:@"peerid"];
  [(CKKSDeviceStateEntry *)self setCirclePeerID:v13];

  v14 = [v29 objectForKeyedSubscript:@"circle"];
  [(CKKSDeviceStateEntry *)self setCircleStatus:[(CKKSDeviceStateEntry *)self cktypeToSOSCCStatus:v14]];

  v15 = [v29 objectForKeyedSubscript:@"keystate"];
  v16 = sub_1000B1188(v15);
  [(CKKSDeviceStateEntry *)self setKeyState:v16];

  v17 = [v29 objectForKeyedSubscript:@"currentTLK"];
  id v18 = [v17 recordID];
  id v19 = [v18 recordName];
  [(CKKSDeviceStateEntry *)self setCurrentTLKUUID:v19];

  unsigned int v20 = [v29 objectForKeyedSubscript:@"currentClassA"];
  CFStringRef v21 = [v20 recordID];
  v22 = [v21 recordName];
  [(CKKSDeviceStateEntry *)self setCurrentClassAUUID:v22];

  v23 = [v29 objectForKeyedSubscript:@"currentClassC"];
  id v24 = [v23 recordID];
  v25 = [v24 recordName];
  [(CKKSDeviceStateEntry *)self setCurrentClassCUUID:v25];
}

- (BOOL)matchesCKRecord:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = [v4 recordType];
  unsigned int v6 = [v5 isEqualToString:@"devicestate"];

  if (!v6) {
    goto LABEL_38;
  }
  id v7 = [v4 recordID];
  v8 = [v7 recordName];
  v9 = [(CKKSDeviceStateEntry *)self CKRecordName];
  unsigned int v10 = [v8 isEqualToString:v9];

  if (!v10) {
    goto LABEL_38;
  }
  v11 = [(CKKSDeviceStateEntry *)self lastUnlockTime];
  if (v11
    || ([v4 objectForKeyedSubscript:@"lastunlock"],
        (v8 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    uint64_t v12 = [v4 objectForKeyedSubscript:@"lastunlock"];
    v13 = [(CKKSDeviceStateEntry *)self lastUnlockTime];
    unsigned int v14 = [v12 isEqual:v13];

    if (v11)
    {

      if (!v14) {
        goto LABEL_38;
      }
    }
    else
    {

      if ((v14 & 1) == 0) {
        goto LABEL_38;
      }
    }
  }
  v15 = [(CKKSDeviceStateEntry *)self osVersion];
  if (v15
    || ([v4 objectForKeyedSubscript:@"osver"],
        (v8 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v16 = [v4 objectForKeyedSubscript:@"osver"];
    v17 = [(CKKSDeviceStateEntry *)self osVersion];
    unsigned int v18 = [v16 isEqualToString:v17];

    if (v15)
    {

      if (!v18) {
        goto LABEL_38;
      }
    }
    else
    {

      if ((v18 & 1) == 0) {
        goto LABEL_38;
      }
    }
  }
  id v19 = [(CKKSDeviceStateEntry *)self circlePeerID];
  if (v19
    || ([v4 objectForKeyedSubscript:@"peerid"],
        (v8 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    unsigned int v20 = [v4 objectForKeyedSubscript:@"peerid"];
    CFStringRef v21 = [(CKKSDeviceStateEntry *)self circlePeerID];
    unsigned int v22 = [v20 isEqualToString:v21];

    if (v19)
    {

      if (!v22) {
        goto LABEL_38;
      }
    }
    else
    {

      if ((v22 & 1) == 0) {
        goto LABEL_38;
      }
    }
  }
  v23 = [(CKKSDeviceStateEntry *)self octagonPeerID];
  if (v23
    || ([v4 objectForKeyedSubscript:@"octagonpeerid"],
        (v8 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v24 = [v4 objectForKeyedSubscript:@"octagonpeerid"];
    v25 = [(CKKSDeviceStateEntry *)self octagonPeerID];
    unsigned int v26 = [v24 isEqualToString:v25];

    if (v23)
    {

      if (!v26) {
        goto LABEL_38;
      }
    }
    else
    {

      if ((v26 & 1) == 0) {
        goto LABEL_38;
      }
    }
  }
  v27 = [(CKKSDeviceStateEntry *)self octagonStatus];
  if (!v27)
  {
    v8 = [v4 objectForKeyedSubscript:@"octagonstatus"];
    if (!v8) {
      goto LABEL_33;
    }
  }
  id v28 = [(CKKSDeviceStateEntry *)self octagonStatus];
  id v29 = [v4 objectForKeyedSubscript:@"octagonstatus"];
  v30 = [(CKKSDeviceStateEntry *)self cktypeToOTCliqueStatusWrapper:v29];
  unsigned __int8 v31 = [v28 isEqual:v30];

  if (!v27)
  {

    if ((v31 & 1) == 0) {
      goto LABEL_33;
    }
LABEL_38:
    unsigned __int8 v53 = 0;
    goto LABEL_39;
  }

  if (v31) {
    goto LABEL_38;
  }
LABEL_33:
  id v32 = [v4 objectForKeyedSubscript:@"circle"];
  unsigned int v33 = [(CKKSDeviceStateEntry *)self cktypeToSOSCCStatus:v32];
  unsigned int v34 = [(CKKSDeviceStateEntry *)self circleStatus];

  if (v33 != v34) {
    goto LABEL_38;
  }
  v35 = [v4 objectForKeyedSubscript:@"keystate"];
  id v36 = sub_1000B1188(v35);
  v37 = [(CKKSDeviceStateEntry *)self keyState];
  unsigned int v38 = [v36 isEqualToString:v37];

  if (!v38) {
    goto LABEL_38;
  }
  v39 = [v4 objectForKeyedSubscript:@"currentTLK"];
  id v40 = [v39 recordID];
  v41 = [v40 recordName];
  v42 = [(CKKSDeviceStateEntry *)self currentTLKUUID];
  unsigned int v43 = [v41 isEqualToString:v42];

  if (!v43) {
    goto LABEL_38;
  }
  id v44 = [v4 objectForKeyedSubscript:@"currentClassA"];
  v45 = [v44 recordID];
  v46 = [v45 recordName];
  v47 = [(CKKSDeviceStateEntry *)self currentTLKUUID];
  unsigned int v48 = [v46 isEqualToString:v47];

  if (!v48) {
    goto LABEL_38;
  }
  v49 = [v4 objectForKeyedSubscript:@"currentClassC"];
  v50 = [v49 recordID];
  v51 = [v50 recordName];
  v52 = [(CKKSDeviceStateEntry *)self currentTLKUUID];
  unsigned __int8 v53 = [v51 isEqualToString:v52];

LABEL_39:
  return v53;
}

- (id)updateCKRecord:(id)a3 zoneID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 recordID];
  v9 = [v8 recordName];
  unsigned int v10 = [(CKKSDeviceStateEntry *)self CKRecordName];
  unsigned __int8 v11 = [v9 isEqualToString:v10];

  if ((v11 & 1) == 0)
  {
    v50 = [v6 recordID];
    v51 = [v50 recordName];
    v52 = [(CKKSDeviceStateEntry *)self CKRecordName];
    unsigned __int8 v53 = +[NSString stringWithFormat:@"CKRecord name (%@) was not %@", v51, v52];
    id v54 = +[NSException exceptionWithName:@"WrongCKRecordNameException" reason:v53 userInfo:0];

    goto LABEL_23;
  }
  uint64_t v12 = [v6 recordType];
  unsigned __int8 v13 = [v12 isEqualToString:@"devicestate"];

  if ((v13 & 1) == 0)
  {
    v50 = [v6 recordType];
    v55 = +[NSString stringWithFormat:@"CKRecordType (%@) was not %@", v50, @"devicestate"];
    id v54 = +[NSException exceptionWithName:@"WrongCKRecordTypeException" reason:v55 userInfo:0];

LABEL_23:
    objc_exception_throw(v54);
  }
  unsigned int v14 = [(CKKSDeviceStateEntry *)self osVersion];
  [v6 setObject:v14 forKeyedSubscript:@"osver"];

  v15 = [(CKKSDeviceStateEntry *)self lastUnlockTime];
  [v6 setObject:v15 forKeyedSubscript:@"lastunlock"];

  v16 = [(CKKSDeviceStateEntry *)self octagonPeerID];
  [v6 setObject:v16 forKeyedSubscript:@"octagonpeerid"];

  v17 = [(CKKSDeviceStateEntry *)self octagonStatus];
  unsigned int v18 = [(CKKSDeviceStateEntry *)self cliqueStatusToCKType:v17];
  [v6 setObject:v18 forKeyedSubscript:@"octagonstatus"];

  id v19 = [(CKKSDeviceStateEntry *)self sosCCStatusToCKType:[(CKKSDeviceStateEntry *)self circleStatus]];
  [v6 setObject:v19 forKeyedSubscript:@"circle"];

  id v20 = [(CKKSDeviceStateEntry *)self keyState];
  CFStringRef v21 = sub_1000B0D6C();
  unsigned int v22 = v21;
  if (!v20)
  {
    id v24 = [v21 objectForKeyedSubscript:@"error"];
    goto LABEL_7;
  }
  v23 = [v21 objectForKeyedSubscript:v20];

  if (v23)
  {
    id v24 = v23;
    unsigned int v22 = v24;
LABEL_7:
    v25 = v24;
    goto LABEL_9;
  }
  unsigned int v26 = sub_1000B0D6C();
  v25 = [v26 objectForKeyedSubscript:@"error"];

  unsigned int v22 = 0;
LABEL_9:

  [v6 setObject:v25 forKeyedSubscript:@"keystate"];
  v27 = [(CKKSDeviceStateEntry *)self circlePeerID];
  [v6 setObject:v27 forKeyedSubscript:@"peerid"];

  id v28 = [(CKKSDeviceStateEntry *)self currentTLKUUID];
  if (v28)
  {
    id v29 = objc_alloc((Class)CKReference);
    id v30 = objc_alloc((Class)CKRecordID);
    unsigned __int8 v31 = [(CKKSDeviceStateEntry *)self currentTLKUUID];
    id v32 = [(CKKSCKRecordHolder *)self zoneID];
    id v33 = [v30 initWithRecordName:v31 zoneID:v32];
    id v34 = [v29 initWithRecordID:v33 action:0];
    [v6 setObject:v34 forKeyedSubscript:@"currentTLK"];
  }
  else
  {
    [v6 setObject:0 forKeyedSubscript:@"currentTLK"];
  }

  v35 = [(CKKSDeviceStateEntry *)self currentClassAUUID];
  if (v35)
  {
    id v36 = objc_alloc((Class)CKReference);
    id v37 = objc_alloc((Class)CKRecordID);
    unsigned int v38 = [(CKKSDeviceStateEntry *)self currentClassAUUID];
    v39 = [(CKKSCKRecordHolder *)self zoneID];
    id v40 = [v37 initWithRecordName:v38 zoneID:v39];
    id v41 = [v36 initWithRecordID:v40 action:0];
    [v6 setObject:v41 forKeyedSubscript:@"currentClassA"];
  }
  else
  {
    [v6 setObject:0 forKeyedSubscript:@"currentClassA"];
  }

  v42 = [(CKKSDeviceStateEntry *)self currentClassCUUID];
  if (v42)
  {
    id v43 = objc_alloc((Class)CKReference);
    id v44 = objc_alloc((Class)CKRecordID);
    v45 = [(CKKSDeviceStateEntry *)self currentClassCUUID];
    v46 = [(CKKSCKRecordHolder *)self zoneID];
    id v47 = [v44 initWithRecordName:v45 zoneID:v46];
    id v48 = [v43 initWithRecordID:v47 action:0];
    [v6 setObject:v48 forKeyedSubscript:@"currentClassC"];
  }
  else
  {
    [v6 setObject:0 forKeyedSubscript:@"currentClassC"];
  }

  return v6;
}

- (id)CKRecordName
{
  v2 = [(CKKSDeviceStateEntry *)self device];
  id v3 = +[NSString stringWithFormat:@"ckid-%@", v2];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    id v6 = [(CKKSCKRecordHolder *)self zoneID];
    id v106 = [v5 zoneID];
    id v107 = v6;
    unsigned int v105 = [v6 isEqual:v106];
    if (!v105)
    {
      int v12 = 0;
      uint64_t v104 = 0;
      memset(v101, 0, sizeof(v101));
      long long v103 = 0uLL;
      int v10 = 0;
      memset(v102, 0, sizeof(v102));
      int v11 = 0;
      int v13 = 0;
      int v14 = 0;
      int v15 = 0;
      int v16 = 0;
      BOOL v17 = 0;
      int v18 = 0;
      BOOL v19 = 0;
      goto LABEL_9;
    }
    v100 = [(CKKSDeviceStateEntry *)self device];
    HIDWORD(v104) = v100 == 0;
    if (v100 || ([v5 device], (v94 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v8 = [(CKKSDeviceStateEntry *)self device];
      v96 = [v5 device];
      v97 = v8;
      int v9 = 1;
      if (!objc_msgSend(v8, "isEqual:"))
      {
        LODWORD(v104) = 1;
        memset(v101, 0, sizeof(v101));
        long long v103 = 0uLL;
        int v10 = 0;
        memset(v102, 0, sizeof(v102));
        int v11 = 0;
        int v12 = 0;
        int v13 = 0;
        int v14 = 0;
        int v15 = 0;
        int v16 = 0;
        BOOL v17 = 0;
        int v18 = 0;
        BOOL v19 = 0;
        goto LABEL_9;
      }
    }
    else
    {
      v94 = 0;
      int v9 = 0;
    }
    uint64_t v32 = [(CKKSCKRecordHolder *)self contextID];
    HIDWORD(v103) = v32 == 0;
    LODWORD(v104) = v9;
    v95 = (void *)v32;
    if (v32 || ([v5 contextID], (v90 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      id v33 = [(CKKSCKRecordHolder *)self contextID];
      [v5 contextID];
      v92 = v93 = v33;
      if (!objc_msgSend(v33, "isEqual:"))
      {
        *(_OWORD *)&v101[12] = 1uLL;
        *(void *)&v101[4] = 0;
        *(void *)((char *)&v103 + 4) = 0;
        int v10 = 0;
        memset(v102, 0, sizeof(v102));
        *(_DWORD *)v101 = 0;
        int v11 = 0;
        int v12 = 0;
        *(void *)&v101[28] = 0;
        int v13 = 0;
        int v14 = 0;
        int v15 = 0;
        int v16 = 0;
        BOOL v17 = 0;
        int v18 = 0;
        BOOL v19 = 0;
        LODWORD(v103) = 1;
        goto LABEL_9;
      }
      LODWORD(v103) = 1;
    }
    else
    {
      v90 = 0;
      LODWORD(v103) = 0;
    }
    uint64_t v34 = [(CKKSDeviceStateEntry *)self osVersion];
    DWORD2(v103) = v34 == 0;
    v91 = (void *)v34;
    if (v34 || ([v5 osVersion], (v86 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v35 = [(CKKSDeviceStateEntry *)self osVersion];
      v88 = [v5 osVersion];
      v89 = v35;
      if (!objc_msgSend(v35, "isEqual:"))
      {
        *(void *)&v101[12] = 1;
        *(void *)v101 = 0;
        int v10 = 0;
        memset(v102, 0, sizeof(v102));
        int v11 = 0;
        int v12 = 0;
        *(void *)&v101[28] = 0;
        *(void *)&v101[20] = 0;
        int v13 = 0;
        int v14 = 0;
        int v15 = 0;
        int v16 = 0;
        BOOL v17 = 0;
        int v18 = 0;
        BOOL v19 = 0;
        *(_DWORD *)&v101[8] = 1;
        DWORD1(v103) = 1;
        goto LABEL_9;
      }
      DWORD1(v103) = 1;
    }
    else
    {
      v86 = 0;
      DWORD1(v103) = 0;
    }
    uint64_t v36 = [(CKKSDeviceStateEntry *)self lastUnlockTime];
    HIDWORD(v102[3]) = v36 == 0;
    v87 = (void *)v36;
    if (v36 || ([v5 lastUnlockTime], (v82 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      id v37 = [(CKKSDeviceStateEntry *)self lastUnlockTime];
      v84 = [v5 lastUnlockTime];
      v85 = v37;
      if (!objc_msgSend(v37, "isEqual:"))
      {
        *(void *)&v101[12] = 1;
        int v10 = 0;
        memset(v102, 0, 20);
        int v11 = 0;
        int v12 = 0;
        *(void *)&v101[28] = 0;
        *(void *)&v101[20] = 0;
        int v13 = 0;
        int v14 = 0;
        int v15 = 0;
        int v16 = 0;
        BOOL v17 = 0;
        int v18 = 0;
        BOOL v19 = 0;
        *(_DWORD *)&v101[8] = 1;
        *(void *)v101 = 0x100000000;
        *(void *)((char *)&v102[2] + 4) = 1;
        goto LABEL_9;
      }
      HIDWORD(v102[2]) = 1;
    }
    else
    {
      v82 = 0;
      HIDWORD(v102[2]) = 0;
    }
    uint64_t v38 = [(CKKSDeviceStateEntry *)self octagonPeerID];
    LODWORD(v102[3]) = v38 == 0;
    v83 = (void *)v38;
    if (v38 || ([v5 octagonPeerID], (v78 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v39 = [(CKKSDeviceStateEntry *)self octagonPeerID];
      v80 = [v5 octagonPeerID];
      v81 = v39;
      if (!objc_msgSend(v39, "isEqual:"))
      {
        *(void *)&v101[12] = 1;
        *(void *)((char *)v102 + 4) = 0;
        *(void *)((char *)&v102[1] + 4) = 0;
        int v11 = 0;
        int v12 = 0;
        *(void *)&v101[28] = 0;
        *(void *)&v101[20] = 0;
        int v13 = 0;
        int v14 = 0;
        int v15 = 0;
        int v16 = 0;
        BOOL v17 = 0;
        int v18 = 0;
        BOOL v19 = 0;
        *(_DWORD *)&v101[8] = 1;
        *(_DWORD *)v101 = 0;
        *(_DWORD *)&v101[4] = 1;
        int v10 = 1;
        LODWORD(v102[0]) = 1;
        goto LABEL_9;
      }
      LODWORD(v102[0]) = 1;
    }
    else
    {
      v78 = 0;
      LODWORD(v102[0]) = 0;
    }
    uint64_t v40 = [(CKKSDeviceStateEntry *)self octagonStatus];
    LODWORD(v102[2]) = v40 == 0;
    v79 = (void *)v40;
    if (v40 || ([v5 octagonStatus], (v74 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      id v41 = [(CKKSDeviceStateEntry *)self octagonStatus];
      v76 = [v5 octagonStatus];
      v77 = v41;
      if (!objc_msgSend(v41, "isEqual:"))
      {
        *(void *)&v101[12] = 1;
        int v11 = 0;
        HIDWORD(v102[0]) = 0;
        int v12 = 0;
        *(void *)&v101[28] = 0;
        *(void *)&v101[20] = 0;
        int v13 = 0;
        int v14 = 0;
        int v15 = 0;
        int v16 = 0;
        BOOL v17 = 0;
        int v18 = 0;
        BOOL v19 = 0;
        *(_DWORD *)&v101[4] = 1;
        *(_DWORD *)&v101[8] = 1;
        int v10 = 1;
        *(_DWORD *)v101 = 1;
        v102[1] = 1;
        goto LABEL_9;
      }
      LODWORD(v102[1]) = 1;
    }
    else
    {
      v74 = 0;
      LODWORD(v102[1]) = 0;
    }
    uint64_t v42 = [(CKKSDeviceStateEntry *)self circlePeerID];
    HIDWORD(v102[1]) = v42 == 0;
    v75 = (void *)v42;
    if (v42 || ([v5 circlePeerID], (v71 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      id v43 = [(CKKSDeviceStateEntry *)self circlePeerID];
      v72 = [v5 circlePeerID];
      v73 = v43;
      if (!objc_msgSend(v43, "isEqual:"))
      {
        *(void *)&v101[12] = 1;
        int v12 = 0;
        *(void *)&v101[28] = 0;
        *(void *)&v101[20] = 0;
        int v13 = 0;
        int v14 = 0;
        int v15 = 0;
        int v16 = 0;
        BOOL v17 = 0;
        int v18 = 0;
        BOOL v19 = 0;
        *(_DWORD *)&v101[4] = 1;
        *(_DWORD *)&v101[8] = 1;
        int v10 = 1;
        *(_DWORD *)v101 = 1;
        int v11 = 1;
        HIDWORD(v102[0]) = 1;
        goto LABEL_9;
      }
      HIDWORD(v102[0]) = 1;
    }
    else
    {
      v71 = 0;
      HIDWORD(v102[0]) = 0;
    }
    unsigned int v44 = [(CKKSDeviceStateEntry *)self circleStatus];
    if (v44 != [v5 circleStatus])
    {
      int v12 = 0;
      *(void *)&v101[28] = 0;
      *(void *)&v101[20] = 0;
      int v13 = 0;
      int v14 = 0;
      int v15 = 0;
      int v16 = 0;
      BOOL v17 = 0;
      int v18 = 0;
      BOOL v19 = 0;
      *(void *)&v101[12] = 1;
      *(_DWORD *)&v101[4] = 1;
      *(_DWORD *)&v101[8] = 1;
      int v10 = 1;
      *(_DWORD *)v101 = 1;
      int v11 = 1;
      goto LABEL_9;
    }
    v70 = [(CKKSDeviceStateEntry *)self keyState];
    *(_DWORD *)&v101[32] = v70 == 0;
    if (v70 || ([v5 keyState], (v66 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v45 = [(CKKSDeviceStateEntry *)self keyState];
      v68 = [v5 keyState];
      v69 = v45;
      if (!objc_msgSend(v45, "isEqual:"))
      {
        *(_DWORD *)&v101[12] = 1;
        int v13 = 0;
        *(void *)&v101[16] = 0;
        int v14 = 0;
        int v15 = 0;
        int v16 = 0;
        BOOL v17 = 0;
        int v18 = 0;
        BOOL v19 = 0;
        *(_DWORD *)&v101[4] = 1;
        *(_DWORD *)&v101[8] = 1;
        int v10 = 1;
        *(_DWORD *)v101 = 1;
        int v11 = 1;
        int v12 = 1;
        *(void *)&v101[24] = 1;
        goto LABEL_9;
      }
      *(_DWORD *)&v101[24] = 1;
    }
    else
    {
      v66 = 0;
      *(_DWORD *)&v101[24] = 0;
    }
    uint64_t v46 = [(CKKSDeviceStateEntry *)self currentTLKUUID];
    *(_DWORD *)&v101[28] = v46 == 0;
    v67 = (void *)v46;
    if (v46 || ([v5 currentTLKUUID], (v62 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      id v47 = [(CKKSDeviceStateEntry *)self currentTLKUUID];
      v64 = [v5 currentTLKUUID];
      v65 = v47;
      if (!objc_msgSend(v47, "isEqual:"))
      {
        uint64_t v7 = 1;
        int v14 = 0;
        int v15 = 0;
        int v16 = 0;
        BOOL v17 = 0;
        int v18 = 0;
        BOOL v19 = 0;
        *(_DWORD *)&v101[8] = 1;
        *(_DWORD *)&v101[12] = 1;
        *(_DWORD *)v101 = 1;
        *(_DWORD *)&v101[4] = 1;
        int v10 = 1;
        int v11 = 1;
        int v12 = 1;
        int v13 = 1;
        *(void *)&v101[16] = 1;
        goto LABEL_9;
      }
      int v48 = 1;
    }
    else
    {
      v62 = 0;
      int v48 = 0;
    }
    uint64_t v49 = [(CKKSDeviceStateEntry *)self currentClassAUUID];
    *(_DWORD *)&v101[20] = v49 == 0;
    v63 = (void *)v49;
    *(_DWORD *)&v101[16] = v48;
    if (v49 || ([v5 currentClassAUUID], (v58 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v50 = [(CKKSDeviceStateEntry *)self currentClassAUUID];
      v60 = [v5 currentClassAUUID];
      v61 = v50;
      if (!objc_msgSend(v50, "isEqual:"))
      {
        *(_DWORD *)&v101[12] = 1;
        int v16 = 0;
        BOOL v17 = 0;
        int v18 = 0;
        BOOL v19 = 0;
        *(_DWORD *)&v101[4] = 1;
        *(_DWORD *)&v101[8] = 1;
        int v10 = 1;
        *(_DWORD *)v101 = 1;
        int v11 = 1;
        int v12 = 1;
        int v13 = 1;
        int v14 = 1;
        int v15 = 1;
        goto LABEL_9;
      }
      int v55 = 1;
    }
    else
    {
      v58 = 0;
      int v55 = 0;
    }
    uint64_t v51 = [(CKKSDeviceStateEntry *)self currentClassCUUID];
    BOOL v99 = v51 == 0;
    v59 = (void *)v51;
    if (v51 || ([v5 currentClassCUUID], (v56 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v52 = [(CKKSDeviceStateEntry *)self currentClassCUUID];
      uint64_t v54 = [v5 currentClassCUUID];
      unsigned int v53 = [v52 isEqual:];
      int v18 = 1;
      v57 = v52;
      if (!v53)
      {
        *(_DWORD *)&v101[8] = 1;
        *(_DWORD *)&v101[12] = 1;
        BOOL v19 = 0;
        *(void *)v101 = 0x100000001;
        int v10 = 1;
        int v11 = 1;
        int v12 = 1;
        int v13 = 1;
        int v14 = 1;
        int v16 = 1;
LABEL_142:
        BOOL v17 = v99;
        int v15 = v55;
        uint64_t v7 = v54;
LABEL_9:
        if (v18)
        {
          id v98 = v4;
          BOOL v20 = v19;
          int v21 = v11;
          int v22 = v14;
          id v23 = v5;
          int v24 = v13;
          int v25 = v16;
          int v26 = v12;
          int v27 = v10;
          int v28 = v15;
          BOOL v29 = v17;

          BOOL v30 = v29;
          int v15 = v28;
          int v10 = v27;
          int v12 = v26;
          int v16 = v25;
          int v13 = v24;
          id v5 = v23;
          int v14 = v22;
          int v11 = v21;
          BOOL v19 = v20;
          id v4 = v98;
          if (!v30) {
            goto LABEL_11;
          }
        }
        else if (!v17)
        {
LABEL_11:
          if (v16) {
            goto LABEL_12;
          }
          goto LABEL_16;
        }

        if (v16)
        {
LABEL_12:

          if (!v15)
          {
LABEL_18:
            if (*(_DWORD *)&v101[20]) {

            }
            if (v14) {
            if (*(_DWORD *)&v101[16])
            }
            {
            }
            if (*(_DWORD *)&v101[28]) {

            }
            if (v13) {
            if (*(_DWORD *)&v101[24])
            }
            {
            }
            if (*(_DWORD *)&v101[32]) {

            }
            if (v12) {
            if (HIDWORD(v102[0]))
            }
            {
            }
            if (HIDWORD(v102[1])) {

            }
            if (v11) {
            if (LODWORD(v102[1]))
            }
            {
            }
            if (LODWORD(v102[2])) {

            }
            if (*(_DWORD *)v101) {
            if (LODWORD(v102[0]))
            }
            {
            }
            if (LODWORD(v102[3])) {

            }
            if (v10) {
            if (HIDWORD(v102[2]))
            }
            {
            }
            if (HIDWORD(v102[3])) {

            }
            if (*(_DWORD *)&v101[4]) {
            if (DWORD1(v103))
            }
            {
            }
            if (DWORD2(v103)) {

            }
            if (*(_DWORD *)&v101[8]) {
            if (v103)
            }
            {
            }
            if (HIDWORD(v103)) {

            }
            if (*(_DWORD *)&v101[12])
            {

              if (!v104) {
                goto LABEL_70;
              }
            }
            else if (!v104)
            {
LABEL_70:
              if (HIDWORD(v104)) {
                goto LABEL_71;
              }
              goto LABEL_75;
            }

            if (HIDWORD(v104))
            {
LABEL_71:

              if (!v105) {
                goto LABEL_77;
              }
              goto LABEL_76;
            }
LABEL_75:
            if (!v105)
            {
LABEL_77:

              goto LABEL_78;
            }
LABEL_76:

            goto LABEL_77;
          }
LABEL_17:

          goto LABEL_18;
        }
LABEL_16:
        if (!v15) {
          goto LABEL_18;
        }
        goto LABEL_17;
      }
    }
    else
    {
      v56 = 0;
      int v18 = 0;
    }
    *(_DWORD *)&v101[8] = 1;
    *(_DWORD *)&v101[12] = 1;
    *(_DWORD *)v101 = 1;
    *(_DWORD *)&v101[4] = 1;
    int v10 = 1;
    int v11 = 1;
    int v12 = 1;
    int v13 = 1;
    int v14 = 1;
    int v16 = 1;
    BOOL v19 = 1;
    goto LABEL_142;
  }
  BOOL v19 = 0;
LABEL_78:

  return v19;
}

- (id)description
{
  id v3 = [(CKKSCKRecordHolder *)self storedCKRecord];
  int v26 = [v3 modificationDate];

  uint64_t v4 = [(CKKSCKRecordHolder *)self contextID];
  int v25 = [(CKKSDeviceStateEntry *)self device];
  int v24 = [(CKKSDeviceStateEntry *)self circlePeerID];
  id v23 = [(CKKSDeviceStateEntry *)self octagonPeerID];
  int v22 = [(CKKSDeviceStateEntry *)self osVersion];
  int v21 = [(CKKSDeviceStateEntry *)self lastUnlockTime];
  id v5 = [(CKKSCKRecordHolder *)self zoneID];
  id v6 = [v5 zoneName];
  unsigned int v7 = [(CKKSDeviceStateEntry *)self circleStatus] + 1;
  BOOL v20 = (void *)v4;
  if (v7 > 4) {
    CFStringRef v8 = @"kSOSCCError";
  }
  else {
    CFStringRef v8 = off_1003079C8[v7];
  }
  int v9 = [(CKKSDeviceStateEntry *)self octagonStatus];
  if (v9)
  {
    BOOL v19 = [(CKKSDeviceStateEntry *)self octagonStatus];
    [v19 status];
    OTCliqueStatusToString();
    int v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    int v10 = @"CliqueMissing";
  }
  int v11 = [(CKKSDeviceStateEntry *)self keyState];
  int v12 = [(CKKSDeviceStateEntry *)self currentTLKUUID];
  int v13 = [(CKKSDeviceStateEntry *)self currentClassAUUID];
  uint64_t v14 = [(CKKSDeviceStateEntry *)self currentClassCUUID];
  int v15 = (void *)v14;
  CFStringRef v16 = @"unknown";
  if (v26) {
    CFStringRef v16 = v26;
  }
  BOOL v17 = +[NSString stringWithFormat:%@, %@, %@, %@ @<CKKSDeviceStateEntry[%@]: %@ %@ %@ %@ %@ %@ upd:%@>"", v20, v25, v24, v23, v22, v21, v6, v8, v10, v11, v12, v13, v14, v16];

  if (v9)
  {
  }

  return v17;
}

- (id)cktypeToOTCliqueStatusWrapper:(id)a3
{
  id v3 = a3;
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    unsigned int v4 = [v3 unsignedIntValue];
    unsigned int v5 = v4;
    switch(v4)
    {
      case 0u:
        id v6 = [OTCliqueStatusWrapper alloc];
        uint64_t v7 = 0;
        break;
      case 1u:
        id v6 = [OTCliqueStatusWrapper alloc];
        uint64_t v7 = 1;
        break;
      case 2u:
        id v6 = [OTCliqueStatusWrapper alloc];
        uint64_t v7 = 2;
        break;
      case 3u:
        id v6 = [OTCliqueStatusWrapper alloc];
        uint64_t v7 = 3;
        break;
      case 4u:
        id v6 = [OTCliqueStatusWrapper alloc];
        uint64_t v7 = 4;
        break;
      default:
        if (v4 != 111)
        {
          int v9 = sub_1000CD884(@"ckks", 0);
          if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
          {
            v11[0] = 67109120;
            v11[1] = v5;
            _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%d is not an OTCliqueStatus?", (uint8_t *)v11, 8u);
          }
        }
        id v6 = [OTCliqueStatusWrapper alloc];
        uint64_t v7 = -1;
        break;
    }
    CFStringRef v8 = [(OTCliqueStatusWrapper *)v6 initWithStatus:v7];
  }
  else
  {
    CFStringRef v8 = 0;
  }

  return v8;
}

- (id)cliqueStatusToCKType:(id)a3
{
  id v3 = a3;
  unsigned int v4 = v3;
  if (v3)
  {
    if ([v3 status] == (id)-1) {
      uint64_t v5 = 111;
    }
    else {
      uint64_t v5 = (uint64_t)[v4 status];
    }
    id v6 = +[NSNumber numberWithInt:v5];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (int)cktypeToSOSCCStatus:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_7:
    int v5 = -1;
    goto LABEL_8;
  }
  unsigned int v4 = [v3 unsignedIntValue];
  int v5 = v4;
  if (v4 + 1 >= 5)
  {
    if (v4 != 111)
    {
      id v6 = sub_1000CD884(@"ckks", 0);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        v8[0] = 67109120;
        v8[1] = v5;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "%d is not an SOSCCStatus?", (uint8_t *)v8, 8u);
      }
    }
    goto LABEL_7;
  }
LABEL_8:

  return v5;
}

- (id)sosCCStatusToCKType:(int)a3
{
  if (a3 == -1) {
    *(void *)&a3 = 111;
  }
  else {
    *(void *)&a3 = a3;
  }
  id v3 = +[NSNumber numberWithInt:*(void *)&a3];

  return v3;
}

- (id)initForDevice:(id)a3 contextID:(id)a4 osVersion:(id)a5 lastUnlockTime:(id)a6 octagonPeerID:(id)a7 octagonStatus:(id)a8 circlePeerID:(id)a9 circleStatus:(int)a10 keyState:(id)a11 currentTLKUUID:(id)a12 currentClassAUUID:(id)a13 currentClassCUUID:(id)a14 zoneID:(id)a15 encodedCKRecord:(id)a16
{
  id v36 = a3;
  id v35 = a5;
  id v34 = a6;
  id v33 = a7;
  id v28 = a8;
  id v32 = a8;
  id v31 = a9;
  id v30 = a11;
  id v21 = a12;
  id v22 = a13;
  id v23 = a14;
  v37.receiver = self;
  v37.super_class = (Class)CKKSDeviceStateEntry;
  int v24 = [(CKKSCKRecordHolder *)&v37 initWithCKRecordType:@"devicestate" encodedCKRecord:a16 contextID:a4 zoneID:a15];
  int v25 = v24;
  if (v24)
  {
    objc_storeStrong((id *)&v24->_device, a3);
    objc_storeStrong((id *)&v25->_osVersion, a5);
    objc_storeStrong((id *)&v25->_lastUnlockTime, a6);
    objc_storeStrong((id *)&v25->_octagonPeerID, a7);
    objc_storeStrong((id *)&v25->_octagonStatus, v28);
    v25->_circleStatus = a10;
    objc_storeStrong((id *)&v25->_keyState, a11);
    objc_storeStrong((id *)&v25->_circlePeerID, a9);
    objc_storeStrong((id *)&v25->_currentTLKUUID, a12);
    objc_storeStrong((id *)&v25->_currentClassAUUID, a13);
    objc_storeStrong((id *)&v25->_currentClassCUUID, a14);
  }

  return v25;
}

+ (BOOL)intransactionRecordDeleted:(id)a3 contextID:(id)a4 resync:(BOOL)a5 error:(id *)a6
{
  id v8 = a3;
  id v9 = a4;
  int v10 = [v8 zoneID];
  int v11 = [v10 zoneName];
  int v12 = sub_1000CD884(@"ckksdevice", v11);

  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    CFStringRef v23 = @"devicestate";
    __int16 v24 = 2112;
    id v25 = v8;
    _os_log_debug_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "CloudKit notification: deleted device state record(%@): %@", buf, 0x16u);
  }

  id v21 = 0;
  int v13 = +[CKKSDeviceStateEntry tryFromDatabaseFromCKRecordID:v8 contextID:v9 error:&v21];

  id v14 = v21;
  id v20 = v14;
  [(__CFString *)v13 deleteFromDatabase:&v20];
  id v15 = v20;

  CFStringRef v16 = [v8 zoneID];
  BOOL v17 = [v16 zoneName];
  int v18 = sub_1000CD884(@"ckksdevice", v17);

  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    CFStringRef v23 = v13;
    __int16 v24 = 2112;
    id v25 = v8;
    __int16 v26 = 2112;
    id v27 = v15;
    _os_log_debug_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "CKKSDeviceStateEntry(%@) was deleted: %@ error: %@", buf, 0x20u);
  }

  if (a6 && v15) {
    *a6 = v15;
  }

  return v15 == 0;
}

+ (BOOL)intransactionRecordChanged:(id)a3 contextID:(id)a4 resync:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  id v9 = (CKKSDeviceStateEntry *)a3;
  id v10 = a4;
  if (v7)
  {
    int v11 = [(CKKSDeviceStateEntry *)v9 recordID];
    int v12 = [v11 recordName];
    int v13 = [(CKKSDeviceStateEntry *)v9 recordID];
    id v14 = [v13 zoneID];
    id v36 = 0;
    id v15 = +[CKKSDeviceStateEntry tryFromDatabase:v12 contextID:v10 zoneID:v14 error:&v36];
    CFStringRef v16 = (CKKSDeviceStateEntry *)v36;

    if (v16)
    {
      BOOL v17 = [(CKKSDeviceStateEntry *)v9 recordID];
      int v18 = [v17 zoneID];
      BOOL v19 = [v18 zoneName];
      id v20 = sub_1000CD884(@"ckksresync", v19);

      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v38 = v16;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "error loading cdse: %@", buf, 0xCu);
      }
    }
    if (v15)
    {
      unsigned __int8 v21 = [(CKKSDeviceStateEntry *)v15 matchesCKRecord:v9];
      id v22 = [(CKKSDeviceStateEntry *)v9 recordID];
      CFStringRef v23 = [v22 zoneID];
      __int16 v24 = [v23 zoneName];
      id v25 = sub_1000CD884(@"ckksresync", v24);

      if (v21)
      {
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v38 = v9;
          _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Already know about this current item pointer, skipping update: %@", buf, 0xCu);
        }

        unsigned __int8 v26 = 1;
        goto LABEL_23;
      }
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        uint64_t v38 = v15;
        __int16 v39 = 2112;
        uint64_t v40 = v9;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "BUG: Local current device state entry doesn't match resynced CloudKit record(s): %@ %@", buf, 0x16u);
      }
    }
    else
    {
      id v27 = [(CKKSDeviceStateEntry *)v9 recordID];
      id v28 = [v27 zoneID];
      BOOL v29 = [v28 zoneName];
      id v25 = sub_1000CD884(@"ckksresync", v29);

      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v38 = v9;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "BUG: No current device state entry matching resynced CloudKit record: %@", buf, 0xCu);
      }
    }
  }
  id v15 = [(CKKSCKRecordHolder *)[CKKSDeviceStateEntry alloc] initWithCKRecord:v9 contextID:v10];
  id v35 = 0;
  unsigned __int8 v26 = [(CKKSSQLDatabaseObject *)v15 saveToDatabase:&v35];
  CFStringRef v16 = (CKKSDeviceStateEntry *)v35;
  if (v16) {
    unsigned __int8 v26 = 0;
  }
  if ((v26 & 1) == 0)
  {
    id v30 = [(CKKSDeviceStateEntry *)v9 recordID];
    id v31 = [v30 zoneID];
    id v32 = [v31 zoneName];
    id v33 = sub_1000CD884(@"ckksdevice", v32);

    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      uint64_t v38 = v15;
      __int16 v39 = 2112;
      uint64_t v40 = v16;
      __int16 v41 = 2112;
      uint64_t v42 = v9;
      _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "Failed to save device record to database: %@: %@ %@", buf, 0x20u);
    }

    if (a6) {
      *a6 = v16;
    }
  }
LABEL_23:

  return v26;
}

+ (id)intransactionCreateDeviceStateForView:(id)a3 accountTracker:(id)a4 lockStateTracker:(id)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  int v12 = [v9 contextID];
  id v13 = [v10 cdpCapableiCloudAccountStatus];
  if (v13 == (id)1)
  {
    id v14 = [v10 currentCKAccountInfo];
    id v15 = [v14 accountStatus];

    if (v15 == (id)1)
    {
      CFStringRef v16 = [v10 ckdeviceID];
      if (!v16)
      {
        id v30 = [v9 zoneName];
        id v31 = sub_1000CD884(@"ckksdevice", v30);

        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "No CK device ID available; cannot make device state entry",
            buf,
            2u);
        }

        NSErrorUserInfoKey v131 = NSLocalizedDescriptionKey;
        id v32 = [v10 currentCKAccountInfo];
        id v33 = +[NSString stringWithFormat:@"No CK device ID: %@", v32];
        v132 = v33;
        id v34 = +[NSDictionary dictionaryWithObjects:&v132 forKeys:&v131 count:1];
        id v18 = +[NSError errorWithDomain:@"CKKSErrorDomain" code:10 userInfo:v34];

        if (a6)
        {
          id v18 = v18;
          id v21 = 0;
          *a6 = v18;
        }
        else
        {
          id v21 = 0;
        }
        CFStringRef v16 = 0;
        goto LABEL_82;
      }
      BOOL v17 = [v9 zoneID];
      id v130 = 0;
      v120 = +[CKKSDeviceStateEntry tryFromDatabase:v16 contextID:v12 zoneID:v17 error:&v130];
      id v18 = v130;

      if (v18)
      {
        BOOL v19 = [v9 zoneName];
        id v20 = sub_1000CD884(@"ckksdevice", v19);

        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v136 = v18;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "Couldn't read old CKKSDeviceStateEntry from database: %@", buf, 0xCu);
        }

        if (a6)
        {
          id v18 = v18;
          id v21 = 0;
          *a6 = v18;
        }
        else
        {
          id v21 = 0;
        }
        unsigned int v53 = v120;
        goto LABEL_81;
      }
      v119 = v16;
      id v35 = [v9 contextID];
      id v36 = [v9 zoneID];
      id v129 = 0;
      objc_super v37 = +[CKKSCurrentKeyPointer tryFromDatabase:@"tlk" contextID:v35 zoneID:v36 error:&v129];
      id v38 = v129;

      __int16 v39 = [v9 contextID];
      uint64_t v40 = [v9 zoneID];
      id v128 = v38;
      v114 = +[CKKSCurrentKeyPointer tryFromDatabase:@"classA" contextID:v39 zoneID:v40 error:&v128];
      id v41 = v128;

      uint64_t v42 = [v9 contextID];
      id v43 = [v9 zoneID];
      id v127 = v41;
      v113 = +[CKKSCurrentKeyPointer tryFromDatabase:@"classC" contextID:v42 zoneID:v43 error:&v127];
      id v44 = v127;

      if (v44)
      {
        v45 = [v9 zoneName];
        uint64_t v46 = sub_1000CD884(@"ckksdevice", v45);

        if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v136 = v44;
          _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_ERROR, "Couldn't read current key pointers from database: %@; proceeding",
            buf,
            0xCu);
        }
      }
      v115 = v11;
      id v47 = [v37 currentKeyUUID];
      id v107 = v37;
      if (v47)
      {
        int v48 = [v37 currentKeyUUID];
        uint64_t v49 = [v9 contextID];
        v50 = [v9 zoneID];
        id v126 = 0;
        uint64_t v51 = +[CKKSKey tryFromDatabase:v48 contextID:v49 zoneID:v50 error:&v126];
        id v52 = v126;
      }
      else
      {
        uint64_t v51 = 0;
        id v52 = 0;
      }

      uint64_t v54 = [v114 currentKeyUUID];
      if (v54)
      {
        int v55 = [v114 currentKeyUUID];
        v56 = [v9 contextID];
        v57 = [v9 zoneID];
        id v125 = v52;
        v118 = +[CKKSKey tryFromDatabase:v55 contextID:v56 zoneID:v57 error:&v125];
        id v58 = v125;

        id v52 = v58;
      }
      else
      {
        v118 = 0;
      }

      v59 = [v113 currentKeyUUID];
      if (v59)
      {
        v60 = [v113 currentKeyUUID];
        v61 = [v9 contextID];
        v62 = [v9 zoneID];
        id v124 = v52;
        uint64_t v116 = +[CKKSKey tryFromDatabase:v60 contextID:v61 zoneID:v62 error:&v124];
        id v63 = v124;

        id v52 = v63;
      }
      else
      {
        uint64_t v116 = 0;
      }

      if (v52)
      {
        v64 = [v9 zoneName];
        v65 = sub_1000CD884(@"ckksdevice", v64);

        if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v136 = v52;
          _os_log_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_ERROR, "Couldn't read keys from database: %@; proceeding",
            buf,
            0xCu);
        }
      }
      id v123 = 0;
      id v66 = [v51 ensureKeyLoadedForContextID:v12 cache:0 error:&v123];
      id v67 = v123;
      if (v67)
      {
        unsigned int v68 = [v115 isLockedError:v67];
        v69 = [v9 zoneName];
        v70 = sub_1000CD884(@"ckksdevice", v69);

        BOOL v71 = os_log_type_enabled(v70, OS_LOG_TYPE_ERROR);
        if (v68)
        {
          if (v71)
          {
            *(_DWORD *)buf = 138412290;
            id v136 = v67;
            _os_log_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_ERROR, "Device is locked; couldn't read TLK from keychain. Assuming it is present and continuing; error was %@",
              buf,
              0xCu);
          }
          v72 = v67;
          id v67 = 0;
        }
        else
        {
          if (v71)
          {
            *(_DWORD *)buf = 138412290;
            id v136 = v67;
            _os_log_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_ERROR, "Couldn't read TLK from keychain. We do not have a current TLK. Error was %@", buf, 0xCu);
          }
          v72 = v51;
          uint64_t v51 = 0;
        }
      }
      id v122 = v67;
      id v73 = [v118 ensureKeyLoadedForContextID:v12 cache:0 error:&v122];
      id v74 = v122;

      if (v74)
      {
        unsigned int v75 = [v115 isLockedError:v74];
        v76 = [v9 zoneName];
        v77 = sub_1000CD884(@"ckksdevice", v76);

        BOOL v78 = os_log_type_enabled(v77, OS_LOG_TYPE_ERROR);
        if (v75)
        {
          if (v78)
          {
            *(_DWORD *)buf = 138412290;
            id v136 = v74;
            _os_log_impl((void *)&_mh_execute_header, v77, OS_LOG_TYPE_ERROR, "Device is locked; couldn't read ClassA key from keychain. Assuming it is present and continuing; error was %@",
              buf,
              0xCu);
          }
          v79 = v74;
          id v74 = 0;
        }
        else
        {
          if (v78)
          {
            *(_DWORD *)buf = 138412290;
            id v136 = v74;
            _os_log_impl((void *)&_mh_execute_header, v77, OS_LOG_TYPE_ERROR, "Couldn't read ClassA key from keychain. We do not have a current ClassA key. Error was %@", buf, 0xCu);
          }
          v79 = v118;
          v118 = 0;
        }
        v80 = (void *)v116;
      }
      else
      {
        v80 = (void *)v116;
      }
      id v121 = v74;
      id v81 = [v80 ensureKeyLoadedForContextID:v12 cache:0 error:&v121];
      id v18 = v121;

      if (v18)
      {
        v82 = [v9 zoneName];
        v83 = sub_1000CD884(@"ckksdevice", v82);

        if (os_log_type_enabled(v83, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v136 = v18;
          _os_log_impl((void *)&_mh_execute_header, v83, OS_LOG_TYPE_ERROR, "Couldn't read ClassC key from keychain. We do not have a current ClassC key. Error was %@", buf, 0xCu);
        }

        v80 = 0;
      }
      if (-[OTSOSActualAdapter sosEnabled]_0())
      {
        v84 = [v10 accountCirclePeerIDInitialized];
        if ([v84 wait:500000000])
        {
          v85 = [v10 accountCirclePeerID];

          if (v85) {
            goto LABEL_72;
          }
          v86 = [v9 zoneName];
          v84 = sub_1000CD884(@"ckksdevice", v86);

          if (os_log_type_enabled(v84, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v84, OS_LOG_TYPE_ERROR, "No SOS peer ID available", buf, 2u);
          }
        }
      }
LABEL_72:
      v87 = [v10 octagonInformationInitialized];
      if ([v87 wait:500000000])
      {
        v88 = [v10 octagonPeerID];

        if (v88)
        {
LABEL_77:
          v90 = +[NSCalendar calendarWithIdentifier:NSCalendarIdentifierISO8601];
          v91 = +[NSTimeZone timeZoneWithAbbreviation:@"UTC"];
          [v90 setTimeZone:v91];

          uint64_t v92 = [v115 lastUnlockTime];
          id v106 = v90;
          if (v92)
          {
            v93 = (void *)v92;
            v112 = [v90 startOfDayForDate:v92];
          }
          else
          {
            v112 = 0;
          }
          uint64_t v104 = [CKKSDeviceStateEntry alloc];
          v111 = [v9 contextID];
          v110 = -[OTDeviceInformationActualAdapter osVersion]_0();
          long long v103 = [v10 octagonPeerID];
          v109 = [v10 octagonStatus];
          v108 = [v10 accountCirclePeerID];
          unsigned int v105 = [v10 currentCircleStatus];
          unsigned int v102 = [v105 status];
          v101 = [v9 viewKeyHierarchyState];
          v100 = [v51 uuid];
          BOOL v99 = [v118 uuid];
          [v80 uuid];
          v94 = v117 = v80;
          v95 = [v9 zoneID];
          v96 = [v120 encodedCKRecord];
          LODWORD(v98) = v102;
          CFStringRef v16 = v119;
          id v21 = [(CKKSDeviceStateEntry *)v104 initForDevice:v119 contextID:v111 osVersion:v110 lastUnlockTime:v112 octagonPeerID:v103 octagonStatus:v109 circlePeerID:v108 circleStatus:v98 keyState:v101 currentTLKUUID:v100 currentClassAUUID:v99 currentClassCUUID:v94 zoneID:v95 encodedCKRecord:v96];

          unsigned int v53 = v120;
          id v11 = v115;
LABEL_81:

LABEL_82:
          goto LABEL_83;
        }
        v89 = [v9 zoneName];
        v87 = sub_1000CD884(@"ckksdevice", v89);

        if (os_log_type_enabled(v87, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v87, OS_LOG_TYPE_ERROR, "No octagon peer ID available", buf, 2u);
        }
      }

      goto LABEL_77;
    }
  }
  id v22 = [v9 zoneName];
  CFStringRef v23 = sub_1000CD884(@"ckksdevice", v22);

  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
  {
    __int16 v24 = [v10 currentCKAccountInfo];
    id v25 = @"available";
    if (v13 == (id)3) {
      id v25 = @"no account";
    }
    if (!v13) {
      id v25 = @"unknown";
    }
    unsigned __int8 v26 = v25;
    *(_DWORD *)buf = 138412546;
    id v136 = v24;
    __int16 v137 = 2112;
    v138 = v26;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "No iCloud account active: %@ cdp capable account:%@", buf, 0x16u);
  }
  NSErrorUserInfoKey v133 = NSLocalizedDescriptionKey;
  id v27 = [v10 currentCKAccountInfo];
  id v28 = +[NSString stringWithFormat:@"No active CDP Capable iCloud account: %@", v27];
  v134 = v28;
  BOOL v29 = +[NSDictionary dictionaryWithObjects:&v134 forKeys:&v133 count:1];
  id v18 = +[NSError errorWithDomain:@"securityd" code:-67671 userInfo:v29];

  if (a6)
  {
    id v18 = v18;
    id v21 = 0;
    *a6 = v18;
  }
  else
  {
    id v21 = 0;
  }
LABEL_83:

  return v21;
}

+ (id)fromDatabaseRow:(id)a3
{
  id v3 = a3;
  unsigned int v4 = [v3 objectForKeyedSubscript:@"octagonstatus"];
  uint64_t v5 = [v4 asString];

  if (v5) {
    id v6 = [[OTCliqueStatusWrapper alloc] initWithStatus:OTCliqueStatusFromString()];
  }
  else {
    id v6 = 0;
  }
  id v36 = [CKKSDeviceStateEntry alloc];
  BOOL v7 = [v3 objectForKeyedSubscript:@"device"];
  id v8 = [v7 asString];
  id v9 = [v3 objectForKeyedSubscript:@"contextID"];
  uint64_t v10 = [v9 asString];
  id v11 = [v3 objectForKeyedSubscript:@"osversion"];
  uint64_t v12 = [v11 asString];
  id v13 = [v3 objectForKeyedSubscript:@"lastunlock"];
  id v44 = [v13 asISO8601Date];
  id v43 = [v3 objectForKeyedSubscript:@"octagonpeerid"];
  uint64_t v42 = [v43 asString];
  id v41 = [v3 objectForKeyedSubscript:@"peerid"];
  uint64_t v40 = [v41 asString];
  __int16 v39 = [v3 objectForKeyedSubscript:@"circlestatus"];
  id v14 = [v39 asString];
  int v48 = v7;
  uint64_t v49 = (void *)v5;
  uint64_t v51 = (void *)v10;
  id v52 = v6;
  uint64_t v46 = v11;
  id v47 = v9;
  v50 = (void *)v12;
  v45 = v13;
  id v38 = v14;
  if (!v14)
  {
    int v16 = -1;
LABEL_9:
    int v33 = v16;
    goto LABEL_10;
  }
  id v15 = v14;
  if (!CFEqual(v14, @"kSOSCCInCircle") && !CFEqual(v15, @"kSOSCCInCircle"))
  {
    if (CFEqual(v15, @"kSOSCCNotInCircle"))
    {
      int v16 = 1;
    }
    else
    {
      if (!CFEqual(v15, @"kSOSCCRequestPending"))
      {
        BOOL v17 = v36;
        if (CFEqual(v15, @"kSOSCCCircleAbsent"))
        {
          int v27 = 3;
        }
        else
        {
          CFEqual(v15, @"kSOSCCError");
          int v27 = -1;
        }
        int v33 = v27;
        goto LABEL_11;
      }
      int v16 = 2;
    }
    goto LABEL_9;
  }
  int v33 = 0;
LABEL_10:
  BOOL v17 = v36;
LABEL_11:
  objc_super v37 = [v3 objectForKeyedSubscript:@"keystate"];
  id v30 = [v37 asString];
  id v35 = [v3 objectForKeyedSubscript:@"currentTLK"];
  BOOL v29 = [v35 asString];
  id v32 = [v3 objectForKeyedSubscript:@"currentClassA"];
  id v18 = [v32 asString];
  id v31 = [v3 objectForKeyedSubscript:@"currentClassC"];
  BOOL v19 = [v31 asString];
  id v20 = objc_alloc((Class)CKRecordZoneID);
  id v21 = [v3 objectForKeyedSubscript:@"ckzone"];
  id v22 = [v21 asString];
  id v23 = [v20 initWithZoneName:v22 ownerName:CKCurrentUserDefaultName];
  __int16 v24 = [v3 objectForKeyedSubscript:@"ckrecord"];

  id v25 = [v24 asBase64DecodedData];
  LODWORD(v28) = v33;
  id v34 = [(CKKSDeviceStateEntry *)v17 initForDevice:v8 contextID:v51 osVersion:v50 lastUnlockTime:v44 octagonPeerID:v42 octagonStatus:v52 circlePeerID:v40 circleStatus:v28 keyState:v30 currentTLKUUID:v29 currentClassAUUID:v18 currentClassCUUID:v19 zoneID:v23 encodedCKRecord:v25];

  return v34;
}

+ (id)sqlColumns
{
  return &off_100326FB0;
}

+ (id)sqlTable
{
  return @"ckdevicestate";
}

+ (id)allInZone:(id)a3 error:(id *)a4
{
  CFStringRef v13 = @"ckzone";
  id v6 = [a3 zoneName];
  BOOL v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    id v8 = +[NSNull null];
  }
  id v9 = v8;

  id v14 = v9;
  uint64_t v10 = +[NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1];
  id v11 = [a1 allWhere:v10 error:a4];

  return v11;
}

+ (id)tryFromDatabaseFromCKRecordID:(id)a3 contextID:(id)a4 error:(id *)a5
{
  id v8 = a4;
  v25[0] = @"device";
  id v9 = a3;
  uint64_t v10 = [a1 nameFromCKRecordID:v9];
  id v11 = v10;
  if (v10)
  {
    id v12 = v10;
  }
  else
  {
    id v12 = +[NSNull null];
  }
  CFStringRef v13 = v12;

  v26[0] = v13;
  v25[1] = @"contextID";
  id v14 = v8;
  id v15 = v14;
  if (v14)
  {
    id v16 = v14;
  }
  else
  {
    id v16 = +[NSNull null];
  }
  BOOL v17 = v16;

  v26[1] = v17;
  v25[2] = @"ckzone";
  id v18 = [v9 zoneID];

  BOOL v19 = [v18 zoneName];

  if (v19)
  {
    id v20 = v19;
  }
  else
  {
    id v20 = +[NSNull null];
  }
  id v21 = v20;

  v26[2] = v21;
  id v22 = +[NSDictionary dictionaryWithObjects:v26 forKeys:v25 count:3];
  id v23 = [a1 tryFromDatabaseWhere:v22 error:a5];

  return v23;
}

+ (id)tryFromDatabase:(id)a3 contextID:(id)a4 zoneID:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v28[0] = @"device";
  id v13 = v10;
  id v14 = v13;
  if (v13)
  {
    id v15 = v13;
  }
  else
  {
    id v15 = +[NSNull null];
  }
  id v16 = v15;

  v29[0] = v16;
  v28[1] = @"contextID";
  id v17 = v11;
  id v18 = v17;
  if (v17)
  {
    id v19 = v17;
  }
  else
  {
    id v19 = +[NSNull null];
  }
  id v20 = v19;

  v29[1] = v20;
  v28[2] = @"ckzone";
  id v21 = [v12 zoneName];
  id v22 = v21;
  if (v21)
  {
    id v23 = v21;
  }
  else
  {
    id v23 = +[NSNull null];
  }
  __int16 v24 = v23;

  v29[2] = v24;
  id v25 = +[NSDictionary dictionaryWithObjects:v29 forKeys:v28 count:3];
  unsigned __int8 v26 = [a1 tryFromDatabaseWhere:v25 error:a6];

  return v26;
}

+ (id)fromDatabase:(id)a3 contextID:(id)a4 zoneID:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v28[0] = @"device";
  id v13 = v10;
  id v14 = v13;
  if (v13)
  {
    id v15 = v13;
  }
  else
  {
    id v15 = +[NSNull null];
  }
  id v16 = v15;

  v29[0] = v16;
  v28[1] = @"contextID";
  id v17 = v11;
  id v18 = v17;
  if (v17)
  {
    id v19 = v17;
  }
  else
  {
    id v19 = +[NSNull null];
  }
  id v20 = v19;

  v29[1] = v20;
  v28[2] = @"ckzone";
  id v21 = [v12 zoneName];
  id v22 = v21;
  if (v21)
  {
    id v23 = v21;
  }
  else
  {
    id v23 = +[NSNull null];
  }
  __int16 v24 = v23;

  v29[2] = v24;
  id v25 = +[NSDictionary dictionaryWithObjects:v29 forKeys:v28 count:3];
  unsigned __int8 v26 = [a1 fromDatabaseWhere:v25 error:a6];

  return v26;
}

+ (id)nameFromCKRecordID:(id)a3
{
  id v3 = [a3 recordName];
  if ([v3 hasPrefix:@"ckid-"])
  {
    uint64_t v4 = [v3 substringFromIndex:[[@"ckid-" length]];

    id v3 = (void *)v4;
  }

  return v3;
}

@end