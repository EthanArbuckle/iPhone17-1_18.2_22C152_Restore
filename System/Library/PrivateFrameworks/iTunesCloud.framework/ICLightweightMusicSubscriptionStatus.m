@interface ICLightweightMusicSubscriptionStatus
+ (BOOL)supportsSecureCoding;
- (BOOL)hasCapability:(unint64_t)a3;
- (BOOL)isEqual:(id)a3;
- (ICLightweightMusicSubscriptionStatus)initWithCoder:(id)a3;
- (NSArray)eligibleOffers;
- (NSDate)expirationDate;
- (id)_initWithExtendedSubscriptionStatus:(id)a3;
- (id)description;
- (int64_t)reasonType;
- (int64_t)statusType;
- (unint64_t)capabilities;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ICLightweightMusicSubscriptionStatus

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expirationDate, 0);

  objc_storeStrong((id *)&self->_eligibleOffers, 0);
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (NSArray)eligibleOffers
{
  return self->_eligibleOffers;
}

- (int64_t)reasonType
{
  return self->_reasonType;
}

- (int64_t)statusType
{
  return self->_statusType;
}

- (BOOL)hasCapability:(unint64_t)a3
{
  return (a3 & ~[(ICLightweightMusicSubscriptionStatus *)self capabilities]) == 0;
}

- (unint64_t)capabilities
{
  return +[ICMusicSubscriptionStatus _capabilitiesForStatusType:self->_statusType carrierBundlingStatusType:0 isMatchEnabled:0];
}

- (id)description
{
  id v3 = objc_alloc(MEMORY[0x1E4F28E78]);
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = (void *)[v3 initWithFormat:@"<%@: %p", v5, self];

  unint64_t statusType = self->_statusType;
  if (statusType > 3) {
    v8 = 0;
  }
  else {
    v8 = off_1E5ACD828[statusType];
  }
  v9 = v8;
  [v6 appendFormat:@"; unint64_t statusType = %@", v9];
  unint64_t reasonType = self->_reasonType;
  if (reasonType > 4) {
    v11 = 0;
  }
  else {
    v11 = off_1E5ACD848[reasonType];
  }
  v12 = v11;
  [v6 appendFormat:@"; unint64_t reasonType = %@", v12];
  v13 = ICMusicSubscriptionStatusCapabilitiesGetDescription([(ICLightweightMusicSubscriptionStatus *)self capabilities]);
  [v6 appendFormat:@"; capabilities = %@", v13];
  if ([(NSArray *)self->_eligibleOffers count])
  {
    v14 = [(NSArray *)self->_eligibleOffers componentsJoinedByString:@","];
    [v6 appendFormat:@"; eligibleOffers = [%@]", v14];
  }
  [v6 appendString:@">"];

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t statusType = self->_statusType;
  id v5 = a3;
  [v5 encodeInteger:statusType forKey:@"statusType"];
  [v5 encodeInteger:self->_reasonType forKey:@"reasonType"];
  [v5 encodeObject:self->_eligibleOffers forKey:@"eligibleOffers"];
  [v5 encodeObject:self->_expirationDate forKey:@"expirationDate"];
}

- (ICLightweightMusicSubscriptionStatus)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)ICLightweightMusicSubscriptionStatus;
  id v5 = [(ICLightweightMusicSubscriptionStatus *)&v17 init];
  if (v5)
  {
    unint64_t v6 = [v4 decodeIntegerForKey:@"statusType"];
    if (v6 >= 4) {
      unint64_t v7 = 0;
    }
    else {
      unint64_t v7 = v6;
    }
    v5->_int64_t statusType = v7;
    v5->_unint64_t reasonType = [v4 decodeIntegerForKey:@"reasonType"];
    v8 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v9 = objc_opt_class();
    v10 = objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    v11 = [v4 decodeObjectOfClasses:v10 forKey:@"eligibleOffers"];
    uint64_t v12 = [v11 copy];
    eligibleOffers = v5->_eligibleOffers;
    v5->_eligibleOffers = (NSArray *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"expirationDate"];
    expirationDate = v5->_expirationDate;
    v5->_expirationDate = (NSDate *)v14;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (ICLightweightMusicSubscriptionStatus *)a3;
  if (self == v4)
  {
    char v12 = 1;
    goto LABEL_11;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    char v12 = 0;
    goto LABEL_11;
  }
  id v5 = v4;
  unint64_t v6 = v5;
  if (self->_statusType != v5->_statusType || self->_reasonType != v5->_reasonType) {
    goto LABEL_7;
  }
  eligibleOffers = self->_eligibleOffers;
  v8 = v5->_eligibleOffers;
  if (eligibleOffers == v8)
  {

    goto LABEL_13;
  }
  uint64_t v9 = v8;
  v10 = eligibleOffers;
  int v11 = [(NSArray *)v10 isEqual:v9];

  if (v11)
  {
LABEL_13:
    expirationDate = self->_expirationDate;
    v15 = v6->_expirationDate;
    v16 = expirationDate;
    objc_super v17 = v16;
    if (v16 == v15) {
      char v12 = 1;
    }
    else {
      char v12 = [(NSDate *)v16 isEqual:v15];
    }

    goto LABEL_8;
  }
LABEL_7:
  char v12 = 0;
LABEL_8:

LABEL_11:
  return v12;
}

- (unint64_t)hash
{
  uint64_t v3 = MSVHasherSharedSeed();
  uint64_t v5 = v4;
  uint64_t v6 = v3 ^ 0x736F6D6570736575;
  uint64_t v7 = v4 ^ 0x646F72616E646F6DLL;
  uint64_t v8 = v3 ^ 0x6C7967656E657261;
  uint64_t v9 = (objc_class *)objc_opt_class();
  v10 = NSStringFromClass(v9);
  uint64_t v11 = [v10 hash];
  uint64_t v12 = v5 ^ 0x7465646279746573 ^ v11;
  uint64_t v13 = (v6 + v7) ^ __ROR8__(v7, 51);
  uint64_t v14 = v8 + v12;
  uint64_t v15 = (v8 + v12) ^ __ROR8__(v12, 48);
  uint64_t v16 = v15 + __ROR8__(v6 + v7, 32);
  uint64_t v86 = __ROR8__(v14 + v13, 32);
  uint64_t v90 = v16 ^ __ROR8__(v15, 43);
  uint64_t v17 = v16 ^ v11;
  uint64_t v81 = (v14 + v13) ^ __ROR8__(v13, 47);

  int64_t statusType = self->_statusType;
  int64_t reasonType = self->_reasonType;
  uint64_t v20 = (v17 + v81) ^ __ROR8__(v81, 51);
  uint64_t v21 = v86 + (v90 ^ statusType);
  uint64_t v22 = __ROR8__(v90 ^ statusType, 48);
  uint64_t v23 = (v21 ^ v22) + __ROR8__(v17 + v81, 32);
  uint64_t v24 = v23 ^ __ROR8__(v21 ^ v22, 43);
  uint64_t v25 = v21 + v20;
  int64_t v77 = v23 ^ statusType;
  uint64_t v82 = v25 ^ __ROR8__(v20, 47);
  int64_t v26 = ((v23 ^ statusType) + v82) ^ __ROR8__(v82, 51);
  int64_t v27 = __ROR8__(v25, 32) + (v24 ^ reasonType);
  uint64_t v28 = __ROR8__(v24 ^ reasonType, 48);
  int64_t v29 = (v27 ^ v28) + __ROR8__(v77 + v82, 32);
  int64_t v30 = v29 ^ __ROR8__(v27 ^ v28, 43);
  int64_t v31 = v27 + v26;
  uint64_t v87 = __ROR8__(v31, 32);
  uint64_t v91 = v30;
  int64_t v78 = v29 ^ reasonType;
  int64_t v83 = v31 ^ __ROR8__(v26, 47);
  v32 = self->_eligibleOffers;
  uint64_t v33 = [(NSArray *)v32 hash];
  int64_t v34 = (v78 + v83) ^ __ROR8__(v83, 51);
  uint64_t v35 = v87 + (v91 ^ v33);
  uint64_t v36 = __ROR8__(v91 ^ v33, 48);
  uint64_t v37 = (v35 ^ v36) + __ROR8__(v78 + v83, 32);
  uint64_t v38 = v37 ^ __ROR8__(v35 ^ v36, 43);
  uint64_t v39 = v35 + v34;
  uint64_t v88 = __ROR8__(v39, 32);
  uint64_t v92 = v38;
  uint64_t v79 = v37 ^ v33;
  uint64_t v84 = v39 ^ __ROR8__(v34, 47);

  v40 = self->_expirationDate;
  uint64_t v41 = [(NSDate *)v40 hash];
  uint64_t v42 = (v79 + v84) ^ __ROR8__(v84, 51);
  uint64_t v43 = v88 + (v92 ^ v41);
  uint64_t v44 = __ROR8__(v92 ^ v41, 48);
  uint64_t v45 = (v43 ^ v44) + __ROR8__(v79 + v84, 32);
  uint64_t v46 = v45 ^ __ROR8__(v43 ^ v44, 43);
  uint64_t v47 = v43 + v42;
  uint64_t v89 = __ROR8__(v47, 32);
  uint64_t v93 = v46;
  uint64_t v80 = v45 ^ v41;
  uint64_t v85 = v47 ^ __ROR8__(v42, 47);

  uint64_t v48 = (v80 + v85) ^ __ROR8__(v85, 51);
  uint64_t v49 = v89 + (v93 ^ 0x2800000000000000);
  uint64_t v50 = __ROR8__(v93 ^ 0x2800000000000000, 48);
  uint64_t v51 = (v49 ^ v50) + __ROR8__(v80 + v85, 32);
  uint64_t v52 = v51 ^ __ROR8__(v49 ^ v50, 43);
  uint64_t v53 = v49 + v48;
  uint64_t v54 = v53 ^ __ROR8__(v48, 47);
  uint64_t v55 = (v51 ^ 0x2800000000000000) + v54;
  uint64_t v56 = v55 ^ __ROR8__(v54, 51);
  uint64_t v57 = (__ROR8__(v53, 32) ^ 0xFFLL) + v52;
  uint64_t v58 = __ROR8__(v52, 48);
  uint64_t v59 = __ROR8__(v55, 32) + (v57 ^ v58);
  uint64_t v60 = v59 ^ __ROR8__(v57 ^ v58, 43);
  uint64_t v61 = v56 + v57;
  uint64_t v62 = v61 ^ __ROR8__(v56, 47);
  uint64_t v63 = v62 + v59;
  uint64_t v64 = v63 ^ __ROR8__(v62, 51);
  uint64_t v65 = __ROR8__(v61, 32) + v60;
  uint64_t v66 = __ROR8__(v60, 48);
  uint64_t v67 = __ROR8__(v63, 32) + (v65 ^ v66);
  uint64_t v68 = v67 ^ __ROR8__(v65 ^ v66, 43);
  uint64_t v69 = v64 + v65;
  uint64_t v70 = v69 ^ __ROR8__(v64, 47);
  uint64_t v71 = v70 + v67;
  uint64_t v72 = v71 ^ __ROR8__(v70, 51);
  uint64_t v73 = __ROR8__(v69, 32) + v68;
  uint64_t v74 = __ROR8__(v68, 48);
  uint64_t v75 = __ROR8__(v71, 32) + (v73 ^ v74);
  return (v72 + v73) ^ __ROR8__(v72, 47) ^ v75 ^ __ROR8__(v72 + v73, 32) ^ v75 ^ __ROR8__(v73 ^ v74, 43);
}

- (id)_initWithExtendedSubscriptionStatus:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ICLightweightMusicSubscriptionStatus;
  uint64_t v5 = [(ICLightweightMusicSubscriptionStatus *)&v12 init];
  if (v5)
  {
    v5->_int64_t statusType = [v4 statusType];
    v5->_int64_t reasonType = [v4 reasonType];
    uint64_t v6 = [v4 eligibleOffers];
    uint64_t v7 = [v6 copy];
    eligibleOffers = v5->_eligibleOffers;
    v5->_eligibleOffers = (NSArray *)v7;

    uint64_t v9 = [v4 expirationDate];
    expirationDate = v5->_expirationDate;
    v5->_expirationDate = (NSDate *)v9;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end