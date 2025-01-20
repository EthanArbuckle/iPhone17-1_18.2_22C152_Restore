@interface CKKSCurrentKeySet
+ (id)loadForZone:(id)a3 contextID:(id)a4;
- (BOOL)proposed;
- (CKKSCurrentKeyPointer)currentClassAPointer;
- (CKKSCurrentKeyPointer)currentClassCPointer;
- (CKKSCurrentKeyPointer)currentTLKPointer;
- (CKKSCurrentKeySet)initWithZoneID:(id)a3 contextID:(id)a4;
- (CKKSKey)classA;
- (CKKSKey)classC;
- (CKKSKey)tlk;
- (CKRecordZoneID)zoneID;
- (NSArray)pendingTLKShares;
- (NSError)error;
- (NSString)contextID;
- (id)asKeychainBackedSet:(id *)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setClassA:(id)a3;
- (void)setClassC:(id)a3;
- (void)setCurrentClassAPointer:(id)a3;
- (void)setCurrentClassCPointer:(id)a3;
- (void)setCurrentTLKPointer:(id)a3;
- (void)setError:(id)a3;
- (void)setPendingTLKShares:(id)a3;
- (void)setProposed:(BOOL)a3;
- (void)setTlk:(id)a3;
- (void)setZoneID:(id)a3;
@end

@implementation CKKSCurrentKeySet

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingTLKShares, 0);
  objc_storeStrong((id *)&self->_currentClassCPointer, 0);
  objc_storeStrong((id *)&self->_currentClassAPointer, 0);
  objc_storeStrong((id *)&self->_currentTLKPointer, 0);
  objc_storeStrong((id *)&self->_classC, 0);
  objc_storeStrong((id *)&self->_classA, 0);
  objc_storeStrong((id *)&self->_tlk, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_contextID, 0);

  objc_storeStrong((id *)&self->_zoneID, 0);
}

- (void)setPendingTLKShares:(id)a3
{
}

- (NSArray)pendingTLKShares
{
  return (NSArray *)objc_getProperty(self, a2, 88, 1);
}

- (void)setProposed:(BOOL)a3
{
  self->_proposed = a3;
}

- (BOOL)proposed
{
  return self->_proposed;
}

- (void)setCurrentClassCPointer:(id)a3
{
}

- (CKKSCurrentKeyPointer)currentClassCPointer
{
  return (CKKSCurrentKeyPointer *)objc_getProperty(self, a2, 80, 1);
}

- (void)setCurrentClassAPointer:(id)a3
{
}

- (CKKSCurrentKeyPointer)currentClassAPointer
{
  return (CKKSCurrentKeyPointer *)objc_getProperty(self, a2, 72, 1);
}

- (void)setCurrentTLKPointer:(id)a3
{
}

- (CKKSCurrentKeyPointer)currentTLKPointer
{
  return (CKKSCurrentKeyPointer *)objc_getProperty(self, a2, 64, 1);
}

- (void)setClassC:(id)a3
{
}

- (CKKSKey)classC
{
  return (CKKSKey *)objc_getProperty(self, a2, 56, 1);
}

- (void)setClassA:(id)a3
{
}

- (CKKSKey)classA
{
  return (CKKSKey *)objc_getProperty(self, a2, 48, 1);
}

- (void)setTlk:(id)a3
{
}

- (CKKSKey)tlk
{
  return (CKKSKey *)objc_getProperty(self, a2, 40, 1);
}

- (void)setError:(id)a3
{
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 32, 1);
}

- (NSString)contextID
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setZoneID:(id)a3
{
}

- (CKRecordZoneID)zoneID
{
  return (CKRecordZoneID *)objc_getProperty(self, a2, 16, 1);
}

- (id)asKeychainBackedSet:(id *)a3
{
  v5 = [(CKKSCurrentKeySet *)self tlk];
  id v20 = 0;
  v6 = [v5 getKeychainBackedKey:&v20];
  id v7 = v20;

  v8 = [(CKKSCurrentKeySet *)self classA];
  id v19 = 0;
  v9 = [v8 getKeychainBackedKey:&v19];
  id v10 = v19;

  v11 = [(CKKSCurrentKeySet *)self classC];
  id v18 = 0;
  v12 = [v11 getKeychainBackedKey:&v18];
  id v13 = v18;

  if (v6 && v9 && v12)
  {
    v14 = [[CKKSKeychainBackedKeySet alloc] initWithTLK:v6 classA:v9 classC:v12 newUpload:[(CKKSCurrentKeySet *)self proposed]];
  }
  else if (a3)
  {
    if (v10) {
      id v15 = v10;
    }
    else {
      id v15 = v13;
    }
    if (v7) {
      id v16 = v7;
    }
    else {
      id v16 = v15;
    }
    +[NSError errorWithDomain:code:description:underlying:](NSError, "errorWithDomain:code:description:underlying:", @"CKKSErrorDomain", 53, @"unable to make keychain backed set; key is missing",
      v16);
    v14 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_alloc_init((Class)objc_opt_class());
  v6 = [(CKKSCurrentKeySet *)self zoneID];
  id v7 = [v6 copyWithZone:a3];
  [v5 setZoneID:v7];

  v8 = [(CKKSCurrentKeySet *)self currentTLKPointer];
  id v9 = [v8 copyWithZone:a3];
  [v5 setCurrentTLKPointer:v9];

  id v10 = [(CKKSCurrentKeySet *)self currentClassAPointer];
  id v11 = [v10 copyWithZone:a3];
  [v5 setCurrentClassAPointer:v11];

  v12 = [(CKKSCurrentKeySet *)self currentClassCPointer];
  id v13 = [v12 copyWithZone:a3];
  [v5 setCurrentClassCPointer:v13];

  v14 = [(CKKSCurrentKeySet *)self tlk];
  id v15 = [v14 copyWithZone:a3];
  [v5 setTlk:v15];

  id v16 = [(CKKSCurrentKeySet *)self classA];
  id v17 = [v16 copyWithZone:a3];
  [v5 setClassA:v17];

  id v18 = [(CKKSCurrentKeySet *)self classC];
  id v19 = [v18 copyWithZone:a3];
  [v5 setClassC:v19];

  [v5 setProposed:-[CKKSCurrentKeySet proposed](self, "proposed")];
  id v20 = [(CKKSCurrentKeySet *)self error];
  id v21 = [v20 copyWithZone:a3];
  [v5 setError:v21];

  return v5;
}

- (id)description
{
  v3 = [(CKKSCurrentKeySet *)self error];

  uint64_t v20 = [(CKKSCurrentKeySet *)self contextID];
  id v19 = [(CKKSCurrentKeySet *)self zoneID];
  v22 = [v19 zoneName];
  id v18 = [(CKKSCurrentKeySet *)self currentTLKPointer];
  id v21 = [v18 currentKeyUUID];
  v4 = [(CKKSCurrentKeySet *)self tlk];
  id v5 = [(CKKSCurrentKeySet *)self currentClassAPointer];
  v6 = [v5 currentKeyUUID];
  id v7 = [(CKKSCurrentKeySet *)self classA];
  v8 = [(CKKSCurrentKeySet *)self currentClassCPointer];
  id v9 = [v8 currentKeyUUID];
  id v10 = [(CKKSCurrentKeySet *)self classC];
  BOOL v11 = [(CKKSCurrentKeySet *)self proposed];
  BOOL v12 = v11;
  if (v3)
  {
    id v13 = [(CKKSCurrentKeySet *)self error];
    BOOL v17 = v12;
    v14 = (void *)v20;
    id v15 = +[NSString stringWithFormat:@"<CKKSCurrentKeySet[%@](%@): %@:%@ %@:%@ %@:%@ new:%d %@>", v20, v22, v21, v4, v6, v7, v9, v10, v17, v13];
  }
  else
  {
    v14 = (void *)v20;
    id v15 = +[NSString stringWithFormat:@"<CKKSCurrentKeySet[%@](%@): %@:%@ %@:%@ %@:%@ new:%d>", v20, v22, v21, v4, v6, v7, v9, v10, v11];
  }

  return v15;
}

- (CKKSCurrentKeySet)initWithZoneID:(id)a3 contextID:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CKKSCurrentKeySet;
  id v9 = [(CKKSCurrentKeySet *)&v12 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_zoneID, a3);
    objc_storeStrong((id *)&v10->_contextID, a4);
  }

  return v10;
}

+ (id)loadForZone:(id)a3 contextID:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [[CKKSCurrentKeySet alloc] initWithZoneID:v5 contextID:v6];
  id v39 = 0;
  id v8 = +[CKKSCurrentKeyPointer tryFromDatabase:@"tlk" contextID:v6 zoneID:v5 error:&v39];
  id v9 = v39;
  [(CKKSCurrentKeySet *)v7 setCurrentTLKPointer:v8];

  id v38 = v9;
  id v10 = +[CKKSCurrentKeyPointer tryFromDatabase:@"classA" contextID:v6 zoneID:v5 error:&v38];
  id v11 = v38;

  [(CKKSCurrentKeySet *)v7 setCurrentClassAPointer:v10];
  id v37 = v11;
  objc_super v12 = +[CKKSCurrentKeyPointer tryFromDatabase:@"classC" contextID:v6 zoneID:v5 error:&v37];
  id v13 = v37;

  [(CKKSCurrentKeySet *)v7 setCurrentClassCPointer:v12];
  v14 = [(CKKSCurrentKeySet *)v7 currentTLKPointer];
  id v15 = [v14 currentKeyUUID];
  if (v15)
  {
    id v16 = [(CKKSCurrentKeySet *)v7 currentTLKPointer];
    BOOL v17 = [v16 currentKeyUUID];
    id v36 = v13;
    id v18 = +[CKKSKey tryFromDatabase:v17 contextID:v6 zoneID:v5 error:&v36];
    id v19 = v36;

    [(CKKSCurrentKeySet *)v7 setTlk:v18];
    id v13 = v19;
  }
  else
  {
    [(CKKSCurrentKeySet *)v7 setTlk:0];
  }

  uint64_t v20 = [(CKKSCurrentKeySet *)v7 currentClassAPointer];
  id v21 = [v20 currentKeyUUID];
  if (v21)
  {
    v22 = [(CKKSCurrentKeySet *)v7 currentClassAPointer];
    v23 = [v22 currentKeyUUID];
    id v35 = v13;
    v24 = +[CKKSKey tryFromDatabase:v23 contextID:v6 zoneID:v5 error:&v35];
    id v25 = v35;

    [(CKKSCurrentKeySet *)v7 setClassA:v24];
    id v13 = v25;
  }
  else
  {
    [(CKKSCurrentKeySet *)v7 setClassA:0];
  }

  v26 = [(CKKSCurrentKeySet *)v7 currentClassCPointer];
  v27 = [v26 currentKeyUUID];
  if (v27)
  {
    v28 = [(CKKSCurrentKeySet *)v7 currentClassCPointer];
    v29 = [v28 currentKeyUUID];
    id v34 = v13;
    v30 = +[CKKSKey tryFromDatabase:v29 contextID:v6 zoneID:v5 error:&v34];
    id v31 = v34;

    [(CKKSCurrentKeySet *)v7 setClassC:v30];
    id v13 = v31;
  }
  else
  {
    [(CKKSCurrentKeySet *)v7 setClassC:0];
  }

  [(CKKSCurrentKeySet *)v7 setPendingTLKShares:0];
  [(CKKSCurrentKeySet *)v7 setProposed:0];
  [(CKKSCurrentKeySet *)v7 setError:v13];

  return v7;
}

@end