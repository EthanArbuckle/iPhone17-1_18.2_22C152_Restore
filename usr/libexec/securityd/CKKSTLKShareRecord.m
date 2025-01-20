@interface CKKSTLKShareRecord
+ (BOOL)intransactionRecordChanged:(id)a3 contextID:(id)a4 resync:(BOOL)a5 error:(id *)a6;
+ (BOOL)intransactionRecordDeleted:(id)a3 contextID:(id)a4 resync:(BOOL)a5 error:(id *)a6;
+ (id)allFor:(id)a3 contextID:(id)a4 keyUUID:(id)a5 zoneID:(id)a6 error:(id *)a7;
+ (id)allForUUID:(id)a3 contextID:(id)a4 zoneID:(id)a5 error:(id *)a6;
+ (id)allInZone:(id)a3 contextID:(id)a4 error:(id *)a5;
+ (id)ckrecordPrefix;
+ (id)countsWithContextID:(id)a3 zoneID:(id)a4 error:(id *)a5;
+ (id)fromDatabase:(id)a3 contextID:(id)a4 receiverPeerID:(id)a5 senderPeerID:(id)a6 zoneID:(id)a7 error:(id *)a8;
+ (id)fromDatabaseRow:(id)a3;
+ (id)share:(id)a3 contextID:(id)a4 as:(id)a5 to:(id)a6 epoch:(int64_t)a7 poisoned:(int64_t)a8 error:(id *)a9;
+ (id)sqlColumns;
+ (id)sqlTable;
+ (id)tryFromDatabase:(id)a3 contextID:(id)a4 receiverPeerID:(id)a5 senderPeerID:(id)a6 zoneID:(id)a7 error:(id *)a8;
+ (id)tryFromDatabaseFromCKRecordID:(id)a3 contextID:(id)a4 error:(id *)a5;
- (BOOL)isEqual:(id)a3;
- (BOOL)matchesCKRecord:(id)a3;
- (BOOL)signatureVerifiesWithPeerSet:(id)a3 error:(id *)a4;
- (BOOL)verifySignature:(id)a3 verifyingPeer:(id)a4 error:(id *)a5;
- (CKKSTLKShare)share;
- (CKKSTLKShareRecord)initWithShare:(id)a3 contextID:(id)a4 zoneID:(id)a5 encodedCKRecord:(id)a6;
- (NSData)signature;
- (NSData)wrappedTLK;
- (NSString)senderPeerID;
- (NSString)tlkUUID;
- (id)CKRecordName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dataForSigning;
- (id)description;
- (id)init:(id)a3 contextID:(id)a4 sender:(id)a5 receiver:(id)a6 curve:(int64_t)a7 version:(unint64_t)a8 epoch:(int64_t)a9 poisoned:(int64_t)a10 zoneID:(id)a11 encodedCKRecord:(id)a12;
- (id)initForKey:(id)a3 contextID:(id)a4 senderPeerID:(id)a5 recieverPeerID:(id)a6 receiverEncPublicKeySPKI:(id)a7 curve:(int64_t)a8 version:(unint64_t)a9 epoch:(int64_t)a10 poisoned:(int64_t)a11 wrappedKey:(id)a12 signature:(id)a13 zoneID:(id)a14 encodedCKRecord:(id)a15;
- (id)recoverTLK:(id)a3 trustedPeers:(id)a4 error:(id *)a5;
- (id)signRecord:(id)a3 error:(id *)a4;
- (id)sqlValues;
- (id)updateCKRecord:(id)a3 zoneID:(id)a4;
- (id)whereClauseToFindSelf;
- (int64_t)epoch;
- (int64_t)poisoned;
- (void)setFromCKRecord:(id)a3;
- (void)setShare:(id)a3;
@end

@implementation CKKSTLKShareRecord

- (void).cxx_destruct
{
}

- (void)setShare:(id)a3
{
}

- (CKKSTLKShare)share
{
  return (CKKSTLKShare *)objc_getProperty(self, a2, 56, 1);
}

- (id)sqlValues
{
  v44[0] = @"uuid";
  v43 = [(CKKSTLKShareRecord *)self share];
  v42 = [v43 tlkUUID];
  v45[0] = v42;
  v44[1] = @"contextID";
  v41 = [(CKKSCKRecordHolder *)self contextID];
  v45[1] = v41;
  v44[2] = @"senderpeerid";
  v40 = [(CKKSTLKShareRecord *)self share];
  v39 = [v40 senderPeerID];
  v45[2] = v39;
  v44[3] = @"recvpeerid";
  v38 = [(CKKSTLKShareRecord *)self share];
  v37 = [v38 receiverPeerID];
  v45[3] = v37;
  v44[4] = @"recvpubenckey";
  v3 = [(CKKSTLKShareRecord *)self share];
  v4 = [v3 receiverPublicEncryptionKeySPKI];
  v5 = [v4 base64EncodedStringWithOptions:0];

  if (v5)
  {
    id v6 = v5;
  }
  else
  {
    id v6 = +[NSNull null];
  }
  id v7 = v6;

  v36 = v7;
  v45[4] = v7;
  v44[5] = @"poisoned";
  v35 = [(CKKSTLKShareRecord *)self share];
  v34 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%ld", [v35 poisoned]);
  v45[5] = v34;
  v44[6] = @"epoch";
  v33 = [(CKKSTLKShareRecord *)self share];
  v32 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%ld", [v33 epoch]);
  v45[6] = v32;
  v44[7] = @"curve";
  v8 = [(CKKSTLKShareRecord *)self share];
  v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%ld", [v8 curve]);
  v45[7] = v9;
  v44[8] = @"version";
  v10 = [(CKKSTLKShareRecord *)self share];
  v11 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%ld", [v10 version]);
  v45[8] = v11;
  v44[9] = @"wrappedkey";
  v12 = [(CKKSTLKShareRecord *)self share];
  v13 = [v12 wrappedTLK];
  v14 = [v13 base64EncodedStringWithOptions:0];

  if (v14)
  {
    id v15 = v14;
  }
  else
  {
    id v15 = +[NSNull null];
  }
  v16 = v15;

  v45[9] = v16;
  v44[10] = @"signature";
  v17 = [(CKKSTLKShareRecord *)self share];
  v18 = [v17 signature];
  v19 = [v18 base64EncodedStringWithOptions:0];

  if (v19)
  {
    id v20 = v19;
  }
  else
  {
    id v20 = +[NSNull null];
  }
  v21 = v20;

  v45[10] = v21;
  v44[11] = @"ckzone";
  v22 = [(CKKSCKRecordHolder *)self zoneID];
  v23 = [v22 zoneName];

  if (v23)
  {
    id v24 = v23;
  }
  else
  {
    id v24 = +[NSNull null];
  }
  v25 = v24;

  v45[11] = v25;
  v44[12] = @"ckrecord";
  v26 = [(CKKSCKRecordHolder *)self encodedCKRecord];
  v27 = [v26 base64EncodedStringWithOptions:0];

  if (v27)
  {
    id v28 = v27;
  }
  else
  {
    id v28 = +[NSNull null];
  }
  v29 = v28;

  v45[12] = v29;
  v30 = +[NSDictionary dictionaryWithObjects:v45 forKeys:v44 count:13];

  return v30;
}

- (id)whereClauseToFindSelf
{
  v14[0] = @"uuid";
  v3 = [(CKKSTLKShareRecord *)self share];
  v4 = [v3 tlkUUID];
  v15[0] = v4;
  v14[1] = @"contextID";
  v5 = [(CKKSCKRecordHolder *)self contextID];
  v15[1] = v5;
  v14[2] = @"senderpeerid";
  id v6 = [(CKKSTLKShareRecord *)self share];
  id v7 = [v6 senderPeerID];
  v15[2] = v7;
  v14[3] = @"recvpeerid";
  v8 = [(CKKSTLKShareRecord *)self share];
  v9 = [v8 receiverPeerID];
  v15[3] = v9;
  v14[4] = @"ckzone";
  v10 = [(CKKSCKRecordHolder *)self zoneID];
  v11 = [v10 zoneName];
  v15[4] = v11;
  v12 = +[NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:5];

  return v12;
}

- (void)setFromCKRecord:(id)a3
{
  id v40 = a3;
  v4 = [v40 recordType];
  unsigned __int8 v5 = [v4 isEqualToString:@"tlkshare"];

  if ((v5 & 1) == 0)
  {
    v25 = [v40 recordType];
    v26 = +[NSString stringWithFormat:@"CKRecordType (%@) was not %@", v25, @"devicestate"];
    id v27 = +[NSException exceptionWithName:@"WrongCKRecordTypeException" reason:v26 userInfo:0];

    objc_exception_throw(v27);
  }
  [(CKKSCKRecordHolder *)self setStoredCKRecord:v40];
  uint64_t v6 = [v40 objectForKeyedSubscript:@"receiverPublicEncryptionKey"];
  v39 = self;
  if (v6
    && (id v7 = (void *)v6,
        +[NSNull null],
        v8 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v9 = [v7 isEqual:v8],
        v8,
        v7,
        (v9 & 1) == 0))
  {
    id v10 = objc_alloc((Class)NSData);
    v11 = [v40 objectForKeyedSubscript:@"receiverPublicEncryptionKey"];
    id v28 = [v10 initWithBase64EncodedString:v11 options:0];
  }
  else
  {
    id v28 = 0;
  }
  v12 = [CKKSTLKShare alloc];
  v38 = [v40 objectForKeyedSubscript:@"parentkeyref"];
  v37 = [v38 recordID];
  v13 = [v37 recordName];
  v14 = [v40 objectForKeyedSubscript:@"sender"];
  v33 = [v40 objectForKeyedSubscript:@"receiver"];
  v36 = [v40 objectForKeyedSubscript:@"curve"];
  id v31 = [v36 longValue];
  v35 = [v40 objectForKeyedSubscript:@"version"];
  id v30 = [v35 longValue];
  v34 = [v40 objectForKeyedSubscript:@"epoch"];
  id v15 = [v34 longValue];
  v32 = [v40 objectForKeyedSubscript:@"poisoned"];
  id v16 = [v32 longValue];
  id v17 = objc_alloc((Class)NSData);
  v29 = [v40 objectForKeyedSubscript:@"wrappedkey"];
  id v18 = [v17 initWithBase64EncodedString:v29 options:0];
  id v19 = objc_alloc((Class)NSData);
  id v20 = [v40 objectForKeyedSubscript:@"signature"];
  id v21 = [v19 initWithBase64EncodedString:v20 options:0];
  v22 = [v40 recordID];
  v23 = [v22 zoneID];
  id v24 = [(CKKSTLKShare *)v12 initForKey:v13 senderPeerID:v14 recieverPeerID:v33 receiverEncPublicKeySPKI:v28 curve:v31 version:v30 epoch:v15 poisoned:v16 wrappedKey:v18 signature:v21 zoneID:v23];
  [(CKKSTLKShareRecord *)v39 setShare:v24];
}

- (BOOL)matchesCKRecord:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = [v4 recordType];
  unsigned int v6 = [v5 isEqualToString:@"tlkshare"];

  if (!v6) {
    goto LABEL_4;
  }
  id v7 = [v4 recordID];
  v8 = [v7 recordName];
  unsigned __int8 v9 = [(CKKSTLKShareRecord *)self CKRecordName];
  unsigned int v10 = [v8 isEqualToString:v9];

  if (v10)
  {
    v11 = [CKKSTLKShareRecord alloc];
    v12 = [(CKKSCKRecordHolder *)self contextID];
    v13 = [(CKKSCKRecordHolder *)v11 initWithCKRecord:v4 contextID:v12];

    BOOL v14 = [(CKKSTLKShareRecord *)self isEqual:v13];
  }
  else
  {
LABEL_4:
    BOOL v14 = 0;
  }

  return v14;
}

- (id)updateCKRecord:(id)a3 zoneID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 recordID];
  unsigned __int8 v9 = [v8 recordName];
  unsigned int v10 = [(CKKSTLKShareRecord *)self CKRecordName];
  unsigned __int8 v11 = [v9 isEqualToString:v10];

  if ((v11 & 1) == 0)
  {
    v42 = [v6 recordID];
    v43 = [v42 recordName];
    v44 = [(CKKSTLKShareRecord *)self CKRecordName];
    v45 = +[NSString stringWithFormat:@"CKRecord name (%@) was not %@", v43, v44];
    id v46 = +[NSException exceptionWithName:@"WrongCKRecordNameException" reason:v45 userInfo:0];

    goto LABEL_8;
  }
  v12 = [v6 recordType];
  unsigned __int8 v13 = [v12 isEqualToString:@"tlkshare"];

  if ((v13 & 1) == 0)
  {
    v42 = [v6 recordType];
    v47 = +[NSString stringWithFormat:@"CKRecordType (%@) was not %@", v42, @"tlkshare"];
    id v46 = +[NSException exceptionWithName:@"WrongCKRecordTypeException" reason:v47 userInfo:0];

LABEL_8:
    objc_exception_throw(v46);
  }
  BOOL v14 = [(CKKSTLKShareRecord *)self share];
  id v15 = [v14 senderPeerID];
  [v6 setObject:v15 forKeyedSubscript:@"sender"];

  id v16 = [(CKKSTLKShareRecord *)self share];
  id v17 = [v16 receiverPeerID];
  [v6 setObject:v17 forKeyedSubscript:@"receiver"];

  id v18 = [(CKKSTLKShareRecord *)self share];
  id v19 = [v18 receiverPublicEncryptionKeySPKI];
  id v20 = [v19 base64EncodedStringWithOptions:0];
  [v6 setObject:v20 forKeyedSubscript:@"receiverPublicEncryptionKey"];

  id v21 = [(CKKSTLKShareRecord *)self share];
  v22 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v21 curve]);
  [v6 setObject:v22 forKeyedSubscript:@"curve"];

  v23 = [(CKKSTLKShareRecord *)self share];
  id v24 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v23 version]);
  [v6 setObject:v24 forKeyedSubscript:@"version"];

  v25 = [(CKKSTLKShareRecord *)self share];
  v26 = +[NSNumber numberWithLong:](NSNumber, "numberWithLong:", [v25 epoch]);
  [v6 setObject:v26 forKeyedSubscript:@"epoch"];

  id v27 = [(CKKSTLKShareRecord *)self share];
  id v28 = +[NSNumber numberWithLong:](NSNumber, "numberWithLong:", [v27 poisoned]);
  [v6 setObject:v28 forKeyedSubscript:@"poisoned"];

  id v29 = objc_alloc((Class)CKReference);
  id v30 = objc_alloc((Class)CKRecordID);
  id v31 = [(CKKSTLKShareRecord *)self share];
  v32 = [v31 tlkUUID];
  id v33 = [v30 initWithRecordName:v32 zoneID:v7];
  id v34 = [v29 initWithRecordID:v33 action:CKReferenceActionValidate];
  [v6 setObject:v34 forKeyedSubscript:@"parentkeyref"];

  v35 = [(CKKSTLKShareRecord *)self share];
  v36 = [v35 wrappedTLK];
  v37 = [v36 base64EncodedStringWithOptions:0];
  [v6 setObject:v37 forKeyedSubscript:@"wrappedkey"];

  v38 = [(CKKSTLKShareRecord *)self share];
  v39 = [v38 signature];
  id v40 = [v39 base64EncodedStringWithOptions:0];
  [v6 setObject:v40 forKeyedSubscript:@"signature"];

  return v6;
}

- (id)CKRecordName
{
  v3 = [(CKKSTLKShareRecord *)self share];
  id v4 = [v3 tlkUUID];
  unsigned __int8 v5 = [(CKKSTLKShareRecord *)self share];
  id v6 = [v5 receiverPeerID];
  id v7 = [(CKKSTLKShareRecord *)self share];
  v8 = [v7 senderPeerID];
  unsigned __int8 v9 = +[NSString stringWithFormat:@"tlkshare-%@::%@::%@", v4, v6, v8];

  return v9;
}

- (id)recoverTLK:(id)a3 trustedPeers:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  unsigned int v10 = [(CKKSTLKShareRecord *)self share];
  unsigned __int8 v11 = [(CKKSCKRecordHolder *)self storedCKRecord];
  v12 = [v10 recoverTLK:v9 trustedPeers:v8 ckrecord:v11 error:a5];

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    id v6 = [(CKKSTLKShareRecord *)self share];
    id v7 = [v5 share];

    unsigned __int8 v8 = [v6 isEqual:v7];
  }
  else
  {
    unsigned __int8 v8 = 0;
  }

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [(id)objc_opt_class() allocWithZone:a3];
  id v6 = [(CKKSTLKShareRecord *)self share];
  id v7 = [v6 copyWithZone:a3];
  unsigned __int8 v8 = [(CKKSCKRecordHolder *)self contextID];
  id v9 = [(CKKSCKRecordHolder *)self zoneID];
  unsigned int v10 = [(CKKSCKRecordHolder *)self encodedCKRecord];
  id v11 = [v5 initWithShare:v7 contextID:v8 zoneID:v9 encodedCKRecord:v10];

  return v11;
}

- (BOOL)signatureVerifiesWithPeerSet:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(CKKSTLKShareRecord *)self share];
  unsigned __int8 v8 = [(CKKSCKRecordHolder *)self storedCKRecord];
  LOBYTE(a4) = [v7 signatureVerifiesWithPeerSet:v6 ckrecord:v8 error:a4];

  return (char)a4;
}

- (BOOL)verifySignature:(id)a3 verifyingPeer:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  unsigned int v10 = [(CKKSTLKShareRecord *)self share];
  id v11 = [(CKKSCKRecordHolder *)self storedCKRecord];
  LOBYTE(a5) = [v10 verifySignature:v9 verifyingPeer:v8 ckrecord:v11 error:a5];

  return (char)a5;
}

- (id)signRecord:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(CKKSTLKShareRecord *)self share];
  id v8 = [(CKKSCKRecordHolder *)self storedCKRecord];
  id v9 = [v7 signRecord:v6 ckrecord:v8 error:a4];

  return v9;
}

- (id)dataForSigning
{
  v3 = [(CKKSTLKShareRecord *)self share];
  id v4 = [(CKKSCKRecordHolder *)self storedCKRecord];
  id v5 = [v3 dataForSigning:v4];

  return v5;
}

- (NSData)signature
{
  v2 = [(CKKSTLKShareRecord *)self share];
  v3 = [v2 signature];

  return (NSData *)v3;
}

- (NSData)wrappedTLK
{
  v2 = [(CKKSTLKShareRecord *)self share];
  v3 = [v2 wrappedTLK];

  return (NSData *)v3;
}

- (int64_t)poisoned
{
  v2 = [(CKKSTLKShareRecord *)self share];
  id v3 = [v2 poisoned];

  return (int64_t)v3;
}

- (int64_t)epoch
{
  v2 = [(CKKSTLKShareRecord *)self share];
  id v3 = [v2 epoch];

  return (int64_t)v3;
}

- (NSString)senderPeerID
{
  v2 = [(CKKSTLKShareRecord *)self share];
  id v3 = [v2 senderPeerID];

  return (NSString *)v3;
}

- (NSString)tlkUUID
{
  v2 = [(CKKSTLKShareRecord *)self share];
  id v3 = [v2 tlkUUID];

  return (NSString *)v3;
}

- (id)description
{
  id v3 = [(CKKSCKRecordHolder *)self contextID];
  id v4 = [(CKKSTLKShareRecord *)self share];
  id v5 = [v4 tlkUUID];
  id v6 = [(CKKSTLKShareRecord *)self share];
  id v7 = [v6 receiverPeerID];
  id v8 = [(CKKSTLKShareRecord *)self share];
  id v9 = [v8 senderPeerID];
  unsigned int v10 = [(CKKSCKRecordHolder *)self storedCKRecord];
  id v11 = [v10 modificationDate];
  v12 = +[NSString stringWithFormat:@"<CKKSTLKShare[%@](%@): recv:%@ send:%@ mod:%@>", v3, v5, v7, v9, v11];

  return v12;
}

- (id)initForKey:(id)a3 contextID:(id)a4 senderPeerID:(id)a5 recieverPeerID:(id)a6 receiverEncPublicKeySPKI:(id)a7 curve:(int64_t)a8 version:(unint64_t)a9 epoch:(int64_t)a10 poisoned:(int64_t)a11 wrappedKey:(id)a12 signature:(id)a13 zoneID:(id)a14 encodedCKRecord:(id)a15
{
  id v20 = a3;
  id v21 = a5;
  id v22 = a6;
  id v23 = a7;
  id v31 = a12;
  id v24 = a13;
  id v25 = a14;
  v32.receiver = self;
  v32.super_class = (Class)CKKSTLKShareRecord;
  v26 = [(CKKSCKRecordHolder *)&v32 initWithCKRecordType:@"tlkshare" encodedCKRecord:a15 contextID:a4 zoneID:v25];
  if (v26)
  {
    id v27 = [[CKKSTLKShare alloc] initForKey:v20 senderPeerID:v21 recieverPeerID:v22 receiverEncPublicKeySPKI:v23 curve:a8 version:a9 epoch:a10 poisoned:a11 wrappedKey:v31 signature:v24 zoneID:v25];
    share = v26->_share;
    v26->_share = v27;
  }
  return v26;
}

- (id)init:(id)a3 contextID:(id)a4 sender:(id)a5 receiver:(id)a6 curve:(int64_t)a7 version:(unint64_t)a8 epoch:(int64_t)a9 poisoned:(int64_t)a10 zoneID:(id)a11 encodedCKRecord:(id)a12
{
  id v18 = a3;
  id v19 = a5;
  id v20 = a6;
  id v21 = a11;
  v26.receiver = self;
  v26.super_class = (Class)CKKSTLKShareRecord;
  id v22 = [(CKKSCKRecordHolder *)&v26 initWithCKRecordType:@"tlkshare" encodedCKRecord:a12 contextID:a4 zoneID:v21];
  if (v22)
  {
    id v23 = [[CKKSTLKShare alloc] init:v18 sender:v19 receiver:v20 curve:a7 version:a8 epoch:a9 poisoned:a10 zoneID:v21];
    share = v22->_share;
    v22->_share = v23;
  }
  return v22;
}

- (CKKSTLKShareRecord)initWithShare:(id)a3 contextID:(id)a4 zoneID:(id)a5 encodedCKRecord:(id)a6
{
  id v11 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CKKSTLKShareRecord;
  v12 = [(CKKSCKRecordHolder *)&v15 initWithCKRecordType:@"tlkshare" encodedCKRecord:a6 contextID:a4 zoneID:a5];
  unsigned __int8 v13 = v12;
  if (v12) {
    objc_storeStrong((id *)&v12->_share, a3);
  }

  return v13;
}

+ (id)countsWithContextID:(id)a3 zoneID:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x3032000000;
  id v21 = sub_100199230;
  id v22 = sub_100199240;
  id v23 = 0;
  id v9 = [(id)objc_opt_class() sqlTable];
  v25[0] = v7;
  v24[0] = @"contextID";
  v24[1] = @"ckzone";
  unsigned int v10 = [v8 zoneName];
  id v11 = v10;
  if (v10)
  {
    id v12 = v10;
  }
  else
  {
    id v12 = +[NSNull null];
  }
  unsigned __int8 v13 = v12;

  v25[1] = v13;
  BOOL v14 = +[NSDictionary dictionaryWithObjects:v25 forKeys:v24 count:2];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100199248;
  v17[3] = &unk_100306000;
  v17[4] = &v18;
  +[CKKSSQLDatabaseObject queryDatabaseTable:v9 where:v14 columns:&off_100326FE0 groupBy:0 orderBy:0 limit:-1 processRow:v17 error:a5];

  id v15 = (id)v19[5];
  _Block_object_dispose(&v18, 8);

  return v15;
}

+ (BOOL)intransactionRecordDeleted:(id)a3 contextID:(id)a4 resync:(BOOL)a5 error:(id *)a6
{
  id v8 = (__CFString *)a3;
  id v9 = a4;
  unsigned int v10 = [(__CFString *)v8 zoneID];
  id v11 = [v10 zoneName];
  id v12 = sub_1000CD884(@"ckksshare", v11);

  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    CFStringRef v23 = @"tlkshare";
    __int16 v24 = 2112;
    id v25 = v8;
    _os_log_debug_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "CloudKit notification: deleted tlk share record(%@): %@", buf, 0x16u);
  }

  id v21 = 0;
  unsigned __int8 v13 = +[CKKSTLKShareRecord tryFromDatabaseFromCKRecordID:v8 contextID:v9 error:&v21];

  id v14 = v21;
  id v20 = v14;
  [v13 deleteFromDatabase:&v20];
  id v15 = (__CFString *)v20;

  if (v15)
  {
    id v16 = [(__CFString *)v8 zoneID];
    id v17 = [v16 zoneName];
    uint64_t v18 = sub_1000CD884(@"ckksshare", v17);

    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      CFStringRef v23 = v8;
      __int16 v24 = 2112;
      id v25 = v15;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "CK notification: Couldn't delete deleted TLKShare: %@ %@", buf, 0x16u);
    }

    if (a6) {
      *a6 = v15;
    }
  }

  return v15 == 0;
}

+ (BOOL)intransactionRecordChanged:(id)a3 contextID:(id)a4 resync:(BOOL)a5 error:(id *)a6
{
  id v8 = a3;
  id v9 = a4;
  unsigned int v10 = [(CKKSCKRecordHolder *)[CKKSTLKShareRecord alloc] initWithCKRecord:v8 contextID:v9];

  id v18 = 0;
  unsigned __int8 v11 = [(CKKSSQLDatabaseObject *)v10 saveToDatabase:&v18];
  id v12 = v18;
  if (v12) {
    unsigned __int8 v11 = 0;
  }
  if ((v11 & 1) == 0)
  {
    unsigned __int8 v13 = [v8 recordID];
    id v14 = [v13 zoneID];
    id v15 = [v14 zoneName];
    id v16 = sub_1000CD884(@"ckksshare", v15);

    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v20 = v10;
      __int16 v21 = 2112;
      id v22 = v12;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "Couldn't save new TLK share to database: %@ %@", buf, 0x16u);
    }

    if (a6) {
      *a6 = v12;
    }
  }

  return v11;
}

+ (id)fromDatabaseRow:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc((Class)CKRecordZoneID);
  id v5 = [v3 objectForKeyedSubscript:@"ckzone"];
  id v6 = [v5 asString];
  id v34 = [v4 initWithZoneName:v6 ownerName:CKCurrentUserDefaultName];

  id v7 = [v3 objectForKeyedSubscript:@"curve"];
  id v29 = [v7 asNSInteger];

  id v8 = [v3 objectForKeyedSubscript:@"version"];
  id v9 = [v8 asNSInteger];

  unsigned int v10 = [CKKSTLKShareRecord alloc];
  objc_super v32 = [v3 objectForKeyedSubscript:@"uuid"];
  id v33 = [v32 asString];
  id v31 = [v3 objectForKeyedSubscript:@"contextID"];
  id v25 = [v31 asString];
  id v28 = [v3 objectForKeyedSubscript:@"senderpeerid"];
  CFStringRef v23 = [v28 asString];
  id v27 = [v3 objectForKeyedSubscript:@"recvpeerid"];
  id v22 = [v27 asString];
  objc_super v26 = [v3 objectForKeyedSubscript:@"recvpubenckey"];
  id v20 = [v26 asBase64DecodedData];
  __int16 v24 = [v3 objectForKeyedSubscript:@"epoch"];
  id v11 = [v24 asNSInteger];
  __int16 v21 = [v3 objectForKeyedSubscript:@"poisoned"];
  id v12 = [v21 asNSInteger];
  unsigned __int8 v13 = [v3 objectForKeyedSubscript:@"wrappedkey"];
  id v14 = [v13 asBase64DecodedData];
  id v15 = [v3 objectForKeyedSubscript:@"signature"];
  id v16 = [v15 asBase64DecodedData];
  id v17 = [v3 objectForKeyedSubscript:@"ckrecord"];

  id v18 = [v17 asBase64DecodedData];
  id v30 = [(CKKSTLKShareRecord *)v10 initForKey:v33 contextID:v25 senderPeerID:v23 recieverPeerID:v22 receiverEncPublicKeySPKI:v20 curve:v29 version:v9 epoch:v11 poisoned:v12 wrappedKey:v14 signature:v16 zoneID:v34 encodedCKRecord:v18];

  return v30;
}

+ (id)sqlColumns
{
  return &off_100326FC8;
}

+ (id)sqlTable
{
  return @"tlkshare";
}

+ (id)ckrecordPrefix
{
  return @"tlkshare";
}

+ (id)tryFromDatabaseFromCKRecordID:(id)a3 contextID:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v59 = 0;
  unsigned int v10 = +[NSRegularExpression regularExpressionWithPattern:@"^tlkshare-(?<uuid>[0-9A-Fa-f-]*)::(?<receiver>.*)::(?<sender>.*)$" options:1 error:&v59];
  id v11 = v59;
  id v12 = v11;
  if (!v11)
  {
    id v14 = [v8 recordName];
    id v15 = [v8 recordName];
    id v16 = [v10 firstMatchInString:v14 options:0 range:[v15 length]];

    if (v16)
    {
      id v56 = a1;
      id v17 = [v8 recordName];
      id v18 = [v16 rangeWithName:@"uuid"];
      id v20 = [v17 substringWithRange:v18, v19];

      __int16 v21 = [v8 recordName];
      id v22 = [v16 rangeWithName:@"receiver"];
      __int16 v24 = [v21 substringWithRange:v22, v23];

      id v25 = [v8 recordName];
      v57 = v16;
      id v26 = [v16 rangeWithName:@"sender"];
      id v28 = [v25 substringWithRange:v26, v27];

      v60[0] = @"uuid";
      id v29 = v20;
      id v30 = v29;
      if (v29)
      {
        id v31 = v29;
      }
      else
      {
        id v31 = +[NSNull null];
      }
      id v34 = v31;

      v54 = v34;
      v61[0] = v34;
      v60[1] = @"contextID";
      id v35 = v9;
      v36 = v35;
      id v58 = v9;
      if (v35)
      {
        id v37 = v35;
      }
      else
      {
        id v37 = +[NSNull null];
      }
      id v38 = v37;

      v61[1] = v38;
      v60[2] = @"recvpeerid";
      id v39 = v24;
      id v33 = v39;
      if (v39)
      {
        id v40 = v39;
      }
      else
      {
        id v40 = +[NSNull null];
      }
      id v41 = v40;
      v53 = v38;
      v55 = v30;

      v61[2] = v41;
      v60[3] = @"senderpeerid";
      id v42 = v28;
      v43 = v42;
      v52 = v41;
      if (v42)
      {
        id v44 = v42;
      }
      else
      {
        id v44 = +[NSNull null];
      }
      v45 = v44;

      v61[3] = v45;
      v60[4] = @"ckzone";
      id v46 = [v8 zoneID];
      v47 = [v46 zoneName];

      if (v47)
      {
        id v48 = v47;
      }
      else
      {
        id v48 = +[NSNull null];
      }
      v49 = v48;

      v61[4] = v49;
      v50 = +[NSDictionary dictionaryWithObjects:v61 forKeys:v60 count:5];
      unsigned __int8 v13 = [v56 tryFromDatabaseWhere:v50 error:a5];

      id v16 = v57;
      objc_super v32 = v55;
    }
    else
    {
      if (!a5)
      {
        unsigned __int8 v13 = 0;
        goto LABEL_25;
      }
      id v58 = v9;
      objc_super v32 = [v8 recordName];
      id v33 = +[NSString stringWithFormat:@"Couldn't parse '%@' as a TLKShare ID", v32];
      +[NSError errorWithDomain:@"CKKSErrorDomain" code:22 description:v33];
      unsigned __int8 v13 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }

    id v9 = v58;
LABEL_25:

    goto LABEL_26;
  }
  unsigned __int8 v13 = 0;
  if (a5) {
    *a5 = v11;
  }
LABEL_26:

  return v13;
}

+ (id)allInZone:(id)a3 contextID:(id)a4 error:(id *)a5
{
  id v8 = a3;
  v20[0] = @"contextID";
  id v9 = a4;
  unsigned int v10 = v9;
  if (v9)
  {
    id v11 = v9;
  }
  else
  {
    id v11 = +[NSNull null];
  }
  id v12 = v11;

  v20[1] = @"ckzone";
  v21[0] = v12;
  unsigned __int8 v13 = [v8 zoneName];
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

  v21[1] = v16;
  id v17 = +[NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:2];
  id v18 = [a1 allWhere:v17 error:a5];

  return v18;
}

+ (id)allForUUID:(id)a3 contextID:(id)a4 zoneID:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v28[0] = @"uuid";
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
  __int16 v21 = [v12 zoneName];
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
  id v26 = [a1 allWhere:v25 error:a6];

  return v26;
}

+ (id)allFor:(id)a3 contextID:(id)a4 keyUUID:(id)a5 zoneID:(id)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  v31[0] = @"recvpeerid";
  id v16 = v12;
  id v17 = v16;
  if (v16)
  {
    id v18 = v16;
  }
  else
  {
    id v18 = +[NSNull null];
  }
  id v19 = v18;

  v32[0] = v19;
  v31[1] = @"contextID";
  id v20 = v13;
  __int16 v21 = v20;
  if (v20)
  {
    id v22 = v20;
  }
  else
  {
    id v22 = +[NSNull null];
  }
  id v23 = v22;

  v32[1] = v23;
  v32[2] = v14;
  v31[2] = @"uuid";
  v31[3] = @"ckzone";
  __int16 v24 = [v15 zoneName];
  id v25 = v24;
  if (v24)
  {
    id v26 = v24;
  }
  else
  {
    id v26 = +[NSNull null];
  }
  uint64_t v27 = v26;

  v32[3] = v27;
  id v28 = +[NSDictionary dictionaryWithObjects:v32 forKeys:v31 count:4];
  id v29 = [a1 allWhere:v28 error:a7];

  return v29;
}

+ (id)tryFromDatabase:(id)a3 contextID:(id)a4 receiverPeerID:(id)a5 senderPeerID:(id)a6 zoneID:(id)a7 error:(id *)a8
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v45[0] = @"uuid";
  id v17 = v12;
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

  v46[0] = v20;
  v45[1] = @"contextID";
  id v21 = v13;
  id v22 = v21;
  if (v21)
  {
    id v23 = v21;
  }
  else
  {
    id v23 = +[NSNull null];
  }
  id v24 = v23;

  v46[1] = v24;
  v45[2] = @"recvpeerid";
  id v25 = v14;
  id v26 = v25;
  if (v25)
  {
    id v27 = v25;
  }
  else
  {
    id v27 = +[NSNull null];
  }
  id v28 = v27;
  id v41 = v24;

  v46[2] = v28;
  v45[3] = @"senderpeerid";
  id v29 = v15;
  id v30 = v29;
  id v42 = v20;
  if (v29)
  {
    id v31 = v29;
  }
  else
  {
    id v31 = +[NSNull null];
  }
  objc_super v32 = v31;

  v46[3] = v32;
  v45[4] = @"ckzone";
  id v33 = v16;
  id v34 = [v16 zoneName];
  id v35 = v34;
  if (v34)
  {
    id v36 = v34;
  }
  else
  {
    id v36 = +[NSNull null];
  }
  id v37 = v36;

  v46[4] = v37;
  id v38 = +[NSDictionary dictionaryWithObjects:v46 forKeys:v45 count:5];
  id v39 = [a1 tryFromDatabaseWhere:v38 error:a8];

  return v39;
}

+ (id)fromDatabase:(id)a3 contextID:(id)a4 receiverPeerID:(id)a5 senderPeerID:(id)a6 zoneID:(id)a7 error:(id *)a8
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v45[0] = @"uuid";
  id v17 = v12;
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

  v46[0] = v20;
  v45[1] = @"contextID";
  id v21 = v13;
  id v22 = v21;
  if (v21)
  {
    id v23 = v21;
  }
  else
  {
    id v23 = +[NSNull null];
  }
  id v24 = v23;

  v46[1] = v24;
  v45[2] = @"recvpeerid";
  id v25 = v14;
  id v26 = v25;
  if (v25)
  {
    id v27 = v25;
  }
  else
  {
    id v27 = +[NSNull null];
  }
  id v28 = v27;
  id v41 = v24;

  v46[2] = v28;
  v45[3] = @"senderpeerid";
  id v29 = v15;
  id v30 = v29;
  id v42 = v20;
  if (v29)
  {
    id v31 = v29;
  }
  else
  {
    id v31 = +[NSNull null];
  }
  objc_super v32 = v31;

  v46[3] = v32;
  v45[4] = @"ckzone";
  id v33 = v16;
  id v34 = [v16 zoneName];
  id v35 = v34;
  if (v34)
  {
    id v36 = v34;
  }
  else
  {
    id v36 = +[NSNull null];
  }
  id v37 = v36;

  v46[4] = v37;
  id v38 = +[NSDictionary dictionaryWithObjects:v46 forKeys:v45 count:5];
  id v39 = [a1 fromDatabaseWhere:v38 error:a8];

  return v39;
}

+ (id)share:(id)a3 contextID:(id)a4 as:(id)a5 to:(id)a6 epoch:(int64_t)a7 poisoned:(int64_t)a8 error:(id *)a9
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = [v12 uuid];
  id v17 = [v15 peerID];
  id v18 = [v14 peerID];
  id v19 = [v12 zoneID];
  id v34 = 0;
  id v20 = v13;
  id v33 = +[CKKSTLKShareRecord tryFromDatabase:v16 contextID:v13 receiverPeerID:v17 senderPeerID:v18 zoneID:v19 error:&v34];
  id v21 = v34;

  if (v21)
  {
    id v22 = [v12 zoneID];
    id v23 = [v22 zoneName];
    id v24 = sub_1000CD884(@"ckksshare", v23);

    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v36 = v12;
      __int16 v37 = 2112;
      id v38 = v21;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "couldn't load old share for %@: %@", buf, 0x16u);
    }

    id v25 = 0;
    if (a9) {
      *a9 = v21;
    }
  }
  else
  {
    id v26 = +[CKKSTLKShare share:v12 as:v14 to:v15 epoch:a7 poisoned:a8 error:a9];
    if (v26)
    {
      id v27 = [CKKSTLKShareRecord alloc];
      id v28 = [v12 zoneID];
      id v29 = [v33 encodedCKRecord];
      id v25 = [(CKKSTLKShareRecord *)v27 initWithShare:v26 contextID:v20 zoneID:v28 encodedCKRecord:v29];
    }
    else
    {
      id v25 = 0;
    }
  }

  return v25;
}

@end