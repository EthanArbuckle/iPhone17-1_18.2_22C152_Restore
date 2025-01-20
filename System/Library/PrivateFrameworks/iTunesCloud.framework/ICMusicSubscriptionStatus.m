@interface ICMusicSubscriptionStatus
+ (BOOL)supportsSecureCoding;
+ (id)dateFromMilliseconds:(id)a3;
+ (unint64_t)_capabilitiesForStatusType:(int64_t)a3 carrierBundlingStatusType:(int64_t)a4 isMatchEnabled:(BOOL)a5;
- (BOOL)hasAddToCloudLibraryCapability;
- (BOOL)hasCapability:(unint64_t)a3;
- (BOOL)hasCatalogPlaybackCapability;
- (BOOL)hasFamily;
- (BOOL)hasFamilyGreaterThanOneMember;
- (BOOL)hasOfflineSlots;
- (BOOL)isAdministrator;
- (BOOL)isAutoRenewEnabled;
- (BOOL)isBundleOnwer;
- (BOOL)isCloudMusicServiceEnabled;
- (BOOL)isDiscoveryModeEligible;
- (BOOL)isEligibleForFreeTrial;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToStatus:(id)a3;
- (BOOL)isHeadOfHousehold;
- (BOOL)isInFreePeriod;
- (BOOL)isInFreeTrial;
- (BOOL)isInGlidePreview;
- (BOOL)isMatchEnabled;
- (BOOL)isMinorAccountHolder;
- (BOOL)isPartOfBundle;
- (BOOL)isPurchaser;
- (ICMusicSubscriptionStatus)initWithCoder:(id)a3;
- (ICMusicSubscriptionStatus)initWithResponseDictionary:(id)a3;
- (NSArray)eligibleOffers;
- (NSArray)termsStatusList;
- (NSDate)expirationDate;
- (NSDate)initialPurchaseTimestamp;
- (NSDate)serviceBeginsTimestamp;
- (NSDate)studentExpirationDate;
- (NSDictionary)dictionaryRepresentation;
- (NSDictionary)responseDictionary;
- (NSNumber)acceptSilentAuth;
- (NSString)cellularOperatorName;
- (NSString)phoneNumber;
- (NSString)sessionIdentifier;
- (NSString)studentVerificationId;
- (NSString)studentVerifier;
- (id)_init;
- (id)description;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (int64_t)carrierBundlingErrorCode;
- (int64_t)carrierBundlingStatusType;
- (int64_t)reasonType;
- (int64_t)sourceType;
- (int64_t)statusType;
- (unint64_t)capabilities;
- (void)_copySubscriptionStatusPropertiesToStatus:(id)a3 withZone:(_NSZone *)a4;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ICMusicSubscriptionStatus

- (int64_t)statusType
{
  return self->_statusType;
}

- (int64_t)reasonType
{
  return self->_reasonType;
}

- (BOOL)hasCapability:(unint64_t)a3
{
  return (a3 & ~[(ICMusicSubscriptionStatus *)self capabilities]) == 0;
}

- (id)description
{
  unint64_t carrierBundlingStatusType = self->_carrierBundlingStatusType;
  if (carrierBundlingStatusType > 4) {
    v29 = 0;
  }
  else {
    v29 = off_1E5ACD7E8[carrierBundlingStatusType];
  }
  unint64_t sourceType = self->_sourceType;
  if (sourceType > 2) {
    v28 = 0;
  }
  else {
    v28 = off_1E5ACD810[sourceType];
  }
  if (self->_carrierBundlingErrorCode)
  {
    objc_msgSend(NSString, "stringWithFormat:", @" carrierBundlingErrorCode:%ld", self->_carrierBundlingErrorCode);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = &stru_1EF5F5C40;
  }
  if (self->_isMatchEnabled) {
    v6 = @"yes";
  }
  else {
    v6 = @"no";
  }
  unint64_t statusType = self->_statusType;
  if (statusType > 3) {
    v27 = 0;
  }
  else {
    v27 = off_1E5ACD828[statusType];
  }
  unint64_t reasonType = self->_reasonType;
  v34 = v5;
  if (reasonType > 4) {
    v26 = 0;
  }
  else {
    v26 = off_1E5ACD848[reasonType];
  }
  v33 = v6;
  v9 = ICMusicSubscriptionStatusCapabilitiesGetDescription([(ICMusicSubscriptionStatus *)self capabilities]);
  eligibleOffers = self->_eligibleOffers;
  if (eligibleOffers)
  {
    v11 = NSString;
    v12 = [(NSArray *)eligibleOffers componentsJoinedByString:@","];
    v13 = [v11 stringWithFormat:@" eligibleOffers:%@", v12];
  }
  else
  {
    v13 = &stru_1EF5F5C40;
  }
  v32 = NSString;
  v14 = (objc_class *)objc_opt_class();
  v31 = NSStringFromClass(v14);
  v15 = [NSNumber numberWithBool:self->_isAutoRenewEnabled];
  v30 = [NSNumber numberWithBool:self->_isInFreePeriod];
  v16 = [NSNumber numberWithBool:self->_isInFreeTrial];
  v17 = [NSNumber numberWithBool:self->_isEligibleForFreeTrial];
  v18 = NSNumber;
  [(NSDate *)self->_initialPurchaseTimestamp timeIntervalSince1970];
  v19 = objc_msgSend(v18, "numberWithDouble:");
  v20 = NSNumber;
  [(NSDate *)self->_serviceBeginsTimestamp timeIntervalSince1970];
  v21 = objc_msgSend(v20, "numberWithDouble:");
  v22 = NSNumber;
  [(NSDate *)self->_studentExpirationDate timeIntervalSince1970];
  v23 = objc_msgSend(v22, "numberWithDouble:");
  objc_msgSend(v32, "stringWithFormat:", @"<%@ %p statusType:%@, matchEnabled=%@, carrierBundlingStatusType:%@, reasonType:%@, sourceType:%@%@, capabilities:%@, eligibleOffers:[%@], isAutoRenewEnabled:%@, isInFreePeriod:%@, isInFreeTrial:%@, isEligibleForFreeTrial:%@, initialPurchaseTimestamp:%@, serviceBeginsTimestamp:%@, studentExpirationDate:%@, studentVerifier:%@, studentVerificationId:%@>", v31, self, v27, v33, v29, v26, v28, v34, v9, v13, v15, v30, v16, v17, v19, v21,
    v23,
    self->_studentVerifier,
  v24 = self->_studentVerificationId);

  return v24;
}

- (unint64_t)capabilities
{
  v3 = objc_opt_class();
  int64_t statusType = self->_statusType;
  int64_t carrierBundlingStatusType = self->_carrierBundlingStatusType;
  BOOL isMatchEnabled = self->_isMatchEnabled;

  return [v3 _capabilitiesForStatusType:statusType carrierBundlingStatusType:carrierBundlingStatusType isMatchEnabled:isMatchEnabled];
}

+ (unint64_t)_capabilitiesForStatusType:(int64_t)a3 carrierBundlingStatusType:(int64_t)a4 isMatchEnabled:(BOOL)a5
{
  BOOL v6 = a3 == 1 && a4 != 2;
  int v7 = a5 || v6;
  BOOL v8 = a4 != 2 && a3 == 1;
  if (a4 == 1)
  {
    int v7 = 1;
    BOOL v8 = 1;
  }
  BOOL v9 = (unint64_t)(a4 - 1) < 2 || a3 == 1;
  uint64_t v10 = v9 | 0x82;
  if (a3 != 3 && !v9) {
    uint64_t v10 = v9;
  }
  if (v7) {
    unint64_t v12 = v10 | 0x100;
  }
  else {
    unint64_t v12 = v10;
  }
  if (v8) {
    v12 |= 0x200uLL;
  }
  if (v9) {
    return v12 | 0x10000;
  }
  else {
    return v12;
  }
}

- (ICMusicSubscriptionStatus)initWithResponseDictionary:(id)a3
{
  uint64_t v131 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(ICMusicSubscriptionStatus *)self _init];

  id v115 = v5;
  if (!v5) {
    goto LABEL_133;
  }
  id v6 = v4;
  int v7 = [v6 objectForKey:@"_ICMusicSubscriptionStatusAdditionalProperties"];
  BOOL v8 = v6;
  if (v7)
  {
    BOOL v9 = (void *)[v6 mutableCopy];
    [v9 removeObjectForKey:@"_ICMusicSubscriptionStatusAdditionalProperties"];
    BOOL v8 = (void *)[v9 copy];
  }
  uint64_t v10 = [v8 copy];
  v11 = (void *)*((void *)v115 + 1);
  *((void *)v115 + 1) = v10;

  unint64_t v12 = [v6 objectForKey:@"account"];
  v111 = v12;
  v112 = v8;
  if (_NSIsNSDictionary())
  {
    v13 = [v12 objectForKey:@"isMinor"];
    if (objc_opt_respondsToSelector()) {
      *((unsigned char *)v115 + 16) = [v13 BOOLValue];
    }
    v14 = [v12 objectForKey:@"studentExpirationDate"];
    v15 = [v12 objectForKey:@"verifications"];
    if (_NSIsNSDictionary())
    {
      v16 = [v15 objectForKey:@"student"];
      if (_NSIsNSDictionary())
      {
        id v92 = v4;
        v17 = v7;
        v18 = [v16 objectForKey:@"verificationId"];
        if (_NSIsNSString())
        {
          uint64_t v19 = [v18 copy];
          v20 = (void *)*((void *)v115 + 4);
          *((void *)v115 + 4) = v19;
        }
        id v21 = v6;
        v22 = [v16 objectForKey:@"verifier"];
        if (_NSIsNSString())
        {
          uint64_t v23 = [v22 copy];
          v24 = (void *)*((void *)v115 + 5);
          *((void *)v115 + 5) = v23;
        }
        uint64_t v25 = [v16 objectForKey:@"expirationDate"];

        v14 = (void *)v25;
        int v7 = v17;
        unint64_t v12 = v111;
        BOOL v8 = v112;
        id v6 = v21;
        id v4 = v92;
      }
    }
    v26 = +[ICMusicSubscriptionStatus dateFromMilliseconds:v14];
    if (v26) {
      objc_storeStrong((id *)v115 + 3, v26);
    }
  }
  v114 = [v6 objectForKey:@"family"];
  if (_NSIsNSDictionary())
  {
    v27 = [v114 objectForKey:@"hasFamily"];
    if (objc_opt_respondsToSelector()) {
      *((unsigned char *)v115 + 48) = [v27 BOOLValue];
    }
    v28 = [v114 objectForKey:@"hasFamilyGreaterThanOneMember"];
    if (objc_opt_respondsToSelector()) {
      *((unsigned char *)v115 + 49) = [v28 BOOLValue];
    }
    v29 = [v114 objectForKey:@"isHoH"];
    if (objc_opt_respondsToSelector()) {
      *((unsigned char *)v115 + 50) = [v29 BOOLValue];
    }
  }
  v113 = [v6 objectForKey:@"match"];
  if (_NSIsNSDictionary())
  {
    v30 = [v113 objectForKey:@"status"];
    int v31 = _NSIsNSString();
    if (v31) {
      LOBYTE(v31) = [v30 isEqualToString:@"Enabled"];
    }
    *((unsigned char *)v115 + 51) = v31;
  }
  v32 = [v6 objectForKey:@"music"];
  v109 = v32;
  v110 = v7;
  if (_NSIsNSDictionary())
  {
    uint64_t v106 = [v32 objectForKey:@"expirationDate"];
    v33 = +[ICMusicSubscriptionStatus dateFromMilliseconds:](ICMusicSubscriptionStatus, "dateFromMilliseconds:");
    if (v33) {
      objc_storeStrong((id *)v115 + 7, v33);
    }
    v98 = [v32 objectForKey:@"initialPurchaseTimestamp"];
    v34 = +[ICMusicSubscriptionStatus dateFromMilliseconds:](ICMusicSubscriptionStatus, "dateFromMilliseconds:");
    if (v34) {
      objc_storeStrong((id *)v115 + 8, v34);
    }
    v96 = [v32 objectForKey:@"serviceBeginsTimestamp"];
    v35 = +[ICMusicSubscriptionStatus dateFromMilliseconds:](ICMusicSubscriptionStatus, "dateFromMilliseconds:");
    if (v35) {
      objc_storeStrong((id *)v115 + 9, v35);
    }
    v116 = v35;
    v105 = [v32 objectForKey:@"hasOfflineSlots"];
    if (objc_opt_respondsToSelector()) {
      *((unsigned char *)v115 + 80) = [v105 BOOLValue];
    }
    v104 = [v32 objectForKey:@"isAutoRenewEnabled"];
    if (objc_opt_respondsToSelector()) {
      *((unsigned char *)v115 + 81) = [v104 BOOLValue];
    }
    v103 = [v32 objectForKey:@"isInFreePeriod"];
    if (objc_opt_respondsToSelector()) {
      *((unsigned char *)v115 + 82) = [v103 BOOLValue];
    }
    v102 = [v32 objectForKey:@"isInFreeTrial"];
    if (objc_opt_respondsToSelector()) {
      *((unsigned char *)v115 + 83) = [v102 BOOLValue];
    }
    v101 = [v32 objectForKey:@"isNotEligibleForFreeTrial"];
    if (objc_opt_respondsToSelector()) {
      *((unsigned char *)v115 + 84) = [v101 BOOLValue] ^ 1;
    }
    v97 = v34;
    v100 = [v32 objectForKey:@"isPurchaser"];
    if (objc_opt_respondsToSelector()) {
      *((unsigned char *)v115 + 85) = [v100 BOOLValue];
    }
    v36 = v33;
    uint64_t v37 = [v32 objectForKey:@"source"];
    v95 = (void *)v37;
    if (_NSIsNSString()) {
      v38 = (void *)v37;
    }
    else {
      v38 = 0;
    }
    id v39 = v38;
    v40 = v39;
    if (v39)
    {
      if ([v39 isEqualToString:@"Apple"])
      {
        uint64_t v41 = 1;
      }
      else
      {
        if (![v40 isEqualToString:@"Carrier"]) {
          goto LABEL_58;
        }
        uint64_t v41 = 2;
      }
      *((void *)v115 + 13) = v41;
    }
LABEL_58:
    uint64_t v42 = [v32 objectForKey:@"reason"];
    v94 = (void *)v42;
    if (_NSIsNSString()) {
      v43 = (void *)v42;
    }
    else {
      v43 = 0;
    }
    id v108 = v43;
    v99 = [v32 objectForKey:@"status"];
    v44 = v36;
    if (_NSIsNSString())
    {
      if ([v99 isEqualToString:@"Enabled"])
      {
        *((void *)v115 + 14) = 1;
        uint64_t v45 = *((void *)v115 + 13);
        if (v45)
        {
          if (v45 != 2) {
            goto LABEL_74;
          }
          goto LABEL_72;
        }
        if ([v108 isEqualToString:@"Carrier"])
        {
LABEL_72:
          uint64_t v47 = 1;
          v48 = v115;
LABEL_73:
          v48[11] = v47;
        }
      }
      else
      {
        if ([v99 isEqualToString:@"Glide"])
        {
          uint64_t v46 = 3;
        }
        else
        {
          if (![v99 isEqualToString:@"Disabled"])
          {
            if ([v99 isEqualToString:@"Discovery"])
            {
              *((unsigned char *)v115 + 121) = 1;
              goto LABEL_74;
            }
            if (![v99 isEqualToString:@"Unlinked"])
            {
              *((void *)v115 + 14) = 0;
              goto LABEL_74;
            }
            v48 = v115;
            *((void *)v115 + 14) = 1;
            uint64_t v47 = 2;
            goto LABEL_73;
          }
          uint64_t v46 = 2;
        }
        *((void *)v115 + 14) = v46;
      }
    }
LABEL_74:
    v49 = [v32 objectForKey:@"isUnlinked"];
    if ((objc_opt_respondsToSelector() & 1) != 0 && [v49 BOOLValue]) {
      *((void *)v115 + 11) = 2;
    }
    v93 = v49;
    if (!v108) {
      goto LABEL_87;
    }
    if ([v108 isEqualToString:@"Individual"])
    {
      uint64_t v50 = 1;
    }
    else if ([v108 isEqualToString:@"Family"])
    {
      uint64_t v50 = 2;
    }
    else if ([v108 isEqualToString:@"Member"])
    {
      uint64_t v50 = 3;
    }
    else
    {
      if (![v108 isEqualToString:@"InvalidToken"])
      {
LABEL_87:
        *((unsigned char *)v115 + 168) = objc_msgSend(v32, "ic_BOOLValueForKey:", @"isPartOfBundle");
        *((unsigned char *)v115 + 169) = objc_msgSend(v32, "ic_BOOLValueForKey:", @"ownsBundle");
        v51 = [v32 objectForKey:@"eligibleOffers"];
        v52 = (void *)v106;
        if (_NSIsNSArray())
        {
          id v107 = v6;
          uint64_t v53 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v51, "count"));
          v54 = v51;
          v55 = (void *)v53;
          long long v121 = 0u;
          long long v122 = 0u;
          long long v123 = 0u;
          long long v124 = 0u;
          v91 = v54;
          id v56 = v54;
          uint64_t v57 = [v56 countByEnumeratingWithState:&v121 objects:v130 count:16];
          if (v57)
          {
            uint64_t v58 = v57;
            uint64_t v59 = *(void *)v122;
            do
            {
              for (uint64_t i = 0; i != v58; ++i)
              {
                if (*(void *)v122 != v59) {
                  objc_enumerationMutation(v56);
                }
                uint64_t v61 = *(void *)(*((void *)&v121 + 1) + 8 * i);
                if (_NSIsNSString())
                {
                  [v55 addObject:v61];
                }
                else
                {
                  v62 = os_log_create("com.apple.amp.iTunesCloud", "Default");
                  if (os_log_type_enabled(v62, OS_LOG_TYPE_FAULT))
                  {
                    *(_DWORD *)buf = 138543618;
                    id v127 = v115;
                    __int16 v128 = 2114;
                    uint64_t v129 = v61;
                    _os_log_impl(&dword_1A2D01000, v62, OS_LOG_TYPE_FAULT, "%{public}@ skipping invalid offer value %{public}@", buf, 0x16u);
                  }

                  v35 = v116;
                }
              }
              uint64_t v58 = [v56 countByEnumeratingWithState:&v121 objects:v130 count:16];
            }
            while (v58);
          }

          uint64_t v63 = [v55 copy];
          v64 = (void *)*((void *)v115 + 22);
          *((void *)v115 + 22) = v63;

          int v7 = v110;
          unint64_t v12 = v111;
          BOOL v8 = v112;
          v52 = (void *)v106;
          id v6 = v107;
          v51 = v91;
        }

        goto LABEL_102;
      }
      uint64_t v50 = 4;
    }
    *((void *)v115 + 12) = v50;
    goto LABEL_87;
  }
LABEL_102:
  v65 = objc_msgSend(v6, "objectForKey:", @"terms", v91);
  if (_NSIsNSArray())
  {
    id v66 = v4;
    long long v119 = 0u;
    long long v120 = 0u;
    long long v117 = 0u;
    long long v118 = 0u;
    id v67 = v65;
    uint64_t v68 = [v67 countByEnumeratingWithState:&v117 objects:v125 count:16];
    if (v68)
    {
      uint64_t v69 = v68;
      v70 = 0;
      uint64_t v71 = *(void *)v118;
      do
      {
        for (uint64_t j = 0; j != v69; ++j)
        {
          if (*(void *)v118 != v71) {
            objc_enumerationMutation(v67);
          }
          uint64_t v73 = *(void *)(*((void *)&v117 + 1) + 8 * j);
          if (_NSIsNSDictionary())
          {
            v74 = [[ICMusicSubscriptionStatusTerms alloc] initWithResponseTermsDictionary:v73];
            if (v74)
            {
              if (!v70)
              {
                v70 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v67, "count"));
              }
              [v70 addObject:v74];
            }
          }
        }
        uint64_t v69 = [v67 countByEnumeratingWithState:&v117 objects:v125 count:16];
      }
      while (v69);
    }
    else
    {
      v70 = 0;
    }

    id v4 = v66;
    int v7 = v110;
    unint64_t v12 = v111;
    BOOL v8 = v112;
  }
  else
  {
    v70 = 0;
  }
  objc_storeStrong((id *)v115 + 16, v70);
  uint64_t v75 = objc_msgSend(v6, "ic_numberValueForKey:", @"acceptSilentAuth");
  v76 = (void *)*((void *)v115 + 24);
  *((void *)v115 + 24) = v75;

  if (_NSIsNSDictionary())
  {
    id v77 = v7;
    v78 = [v77 objectForKey:@"phoneNumber"];
    if (_NSIsNSString())
    {
      uint64_t v79 = [v78 copy];
      v80 = (void *)*((void *)v115 + 17);
      *((void *)v115 + 17) = v79;
    }
    v81 = [v77 objectForKey:@"cellularOperatorName"];
    if (_NSIsNSString())
    {
      uint64_t v82 = [v81 copy];
      v83 = (void *)*((void *)v115 + 18);
      *((void *)v115 + 18) = v82;
    }
    v84 = [v77 objectForKey:@"sessionIdentifier"];
    if (_NSIsNSString())
    {
      uint64_t v85 = [v84 copy];
      v86 = (void *)*((void *)v115 + 19);
      *((void *)v115 + 19) = v85;
    }
    v87 = [v77 objectForKey:@"carrierBundlingErrorCode"];
    if (objc_opt_respondsToSelector()) {
      *((void *)v115 + 20) = [v87 integerValue];
    }
    v88 = [v77 objectForKey:@"carrierBundlingStatusType"];
    if (objc_opt_respondsToSelector()) {
      *((void *)v115 + 11) = [v88 integerValue];
    }

    int v7 = v110;
    unint64_t v12 = v111;
    BOOL v8 = v112;
  }

LABEL_133:
  v89 = (ICMusicSubscriptionStatus *)v115;

  return v89;
}

+ (id)dateFromMilliseconds:(id)a3
{
  id v3 = a3;
  if (objc_opt_respondsToSelector())
  {
    unint64_t v4 = [v3 unsignedLongLongValue];
  }
  else
  {
    if (!_NSIsNSString())
    {
      id v5 = 0;
      goto LABEL_8;
    }
    unint64_t v4 = strtoull((const char *)[v3 UTF8String], 0, 10);
  }
  id v5 = (void *)v4;
  if (v4) {
    id v5 = (void *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSince1970:(double)v4 / 1000.0];
  }
LABEL_8:

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (ICMusicSubscriptionStatus *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(ICMusicSubscriptionStatus *)self isEqualToStatus:v4];
  }

  return v5;
}

- (BOOL)isEqualToStatus:(id)a3
{
  unint64_t v4 = (ICMusicSubscriptionStatus *)a3;
  if (self == v4)
  {
    char v20 = 1;
  }
  else
  {
    responseDictionary = self->_responseDictionary;
    if (responseDictionary != v4->_responseDictionary
      && !-[NSDictionary isEqualToDictionary:](responseDictionary, "isEqualToDictionary:"))
    {
      goto LABEL_46;
    }
    if (self->_isMinorAccountHolder != v4->_isMinorAccountHolder) {
      goto LABEL_46;
    }
    studentExpirationDate = self->_studentExpirationDate;
    if (studentExpirationDate != v4->_studentExpirationDate
      && !-[NSDate isEqualToDate:](studentExpirationDate, "isEqualToDate:"))
    {
      goto LABEL_46;
    }
    studentVerificationId = self->_studentVerificationId;
    if (studentVerificationId != v4->_studentVerificationId
      && !-[NSString isEqualToString:](studentVerificationId, "isEqualToString:"))
    {
      goto LABEL_46;
    }
    studentVerifier = self->_studentVerifier;
    if (studentVerifier != v4->_studentVerifier && !-[NSString isEqualToString:](studentVerifier, "isEqualToString:")) {
      goto LABEL_46;
    }
    if (self->_hasFamily == v4->_hasFamily
      && self->_hasFamilyGreaterThanOneMember == v4->_hasFamilyGreaterThanOneMember
      && self->_isHeadOfHousehold == v4->_isHeadOfHousehold
      && self->_isMatchEnabled == v4->_isMatchEnabled
      && ((expirationDate = self->_expirationDate, expirationDate == v4->_expirationDate)
       || -[NSDate isEqualToDate:](expirationDate, "isEqualToDate:"))
      && ((initialPurchaseTimestamp = self->_initialPurchaseTimestamp,
           initialPurchaseTimestamp == v4->_initialPurchaseTimestamp)
       || -[NSDate isEqualToDate:](initialPurchaseTimestamp, "isEqualToDate:"))
      && ((serviceBeginsTimestamp = self->_serviceBeginsTimestamp, serviceBeginsTimestamp == v4->_serviceBeginsTimestamp)
       || -[NSDate isEqualToDate:](serviceBeginsTimestamp, "isEqualToDate:"))
      && self->_hasOfflineSlots == v4->_hasOfflineSlots
      && self->_isAutoRenewEnabled == v4->_isAutoRenewEnabled
      && self->_isInFreePeriod == v4->_isInFreePeriod
      && self->_isInFreeTrial == v4->_isInFreeTrial
      && self->_isEligibleForFreeTrial == v4->_isEligibleForFreeTrial
      && self->_isPurchaser == v4->_isPurchaser
      && self->_carrierBundlingStatusType == v4->_carrierBundlingStatusType
      && self->_reasonType == v4->_reasonType
      && self->_sourceType == v4->_sourceType
      && self->_statusType == v4->_statusType
      && self->_isAdministrator == v4->_isAdministrator
      && self->_isDiscoveryModeEligible == v4->_isDiscoveryModeEligible
      && ((termsStatusList = self->_termsStatusList, termsStatusList == v4->_termsStatusList)
       || -[NSArray isEqualToArray:](termsStatusList, "isEqualToArray:"))
      && ((phoneNumber = self->_phoneNumber, phoneNumber == v4->_phoneNumber)
       || -[NSString isEqualToString:](phoneNumber, "isEqualToString:"))
      && ((cellularOperatorName = self->_cellularOperatorName, cellularOperatorName == v4->_cellularOperatorName)
       || -[NSString isEqualToString:](cellularOperatorName, "isEqualToString:"))
      && ((sessionIdentifier = self->_sessionIdentifier, sessionIdentifier == v4->_sessionIdentifier)
       || -[NSString isEqualToString:](sessionIdentifier, "isEqualToString:"))
      && self->_carrierBundlingErrorCode == v4->_carrierBundlingErrorCode
      && self->_isPartOfBundle == v4->_isPartOfBundle
      && self->_isBundleOwner == v4->_isBundleOwner)
    {
      eligibleOffers = self->_eligibleOffers;
      v17 = v4->_eligibleOffers;
      v18 = eligibleOffers;
      uint64_t v19 = v18;
      if (v18 == v17) {
        char v20 = 1;
      }
      else {
        char v20 = [(NSArray *)v18 isEqual:v17];
      }
    }
    else
    {
LABEL_46:
      char v20 = 0;
    }
  }

  return v20;
}

- (NSDictionary)responseDictionary
{
  return self->_responseDictionary;
}

- (int64_t)carrierBundlingStatusType
{
  return self->_carrierBundlingStatusType;
}

- (BOOL)isMatchEnabled
{
  return self->_isMatchEnabled;
}

- (void)encodeWithCoder:(id)a3
{
  responseDictionary = self->_responseDictionary;
  id v5 = a3;
  [v5 encodeObject:responseDictionary forKey:@"responseDictionary"];
  [v5 encodeBool:self->_isMinorAccountHolder forKey:@"isMinorAccountHolder"];
  [v5 encodeObject:self->_studentVerificationId forKey:@"studentVerificationId"];
  [v5 encodeObject:self->_studentVerifier forKey:@"studentVerifier"];
  [v5 encodeObject:self->_studentExpirationDate forKey:@"studentExpirationDate"];
  [v5 encodeBool:self->_hasFamily forKey:@"hasFamily"];
  [v5 encodeBool:self->_hasFamilyGreaterThanOneMember forKey:@"hasFamilyGreaterThanOneMember"];
  [v5 encodeBool:self->_isHeadOfHousehold forKey:@"isHeadOfHousehold"];
  [v5 encodeBool:self->_isMatchEnabled forKey:@"isMatchEnabled"];
  [v5 encodeObject:self->_expirationDate forKey:@"expirationDate"];
  [v5 encodeObject:self->_initialPurchaseTimestamp forKey:@"initialPurchaseTimestamp"];
  [v5 encodeObject:self->_serviceBeginsTimestamp forKey:@"serviceBeginsTimestamp"];
  [v5 encodeBool:self->_hasOfflineSlots forKey:@"hasOfflineSlots"];
  [v5 encodeBool:self->_isAutoRenewEnabled forKey:@"isAutoRenewEnabled"];
  [v5 encodeBool:self->_isInFreePeriod forKey:@"isInFreePeriod"];
  [v5 encodeBool:self->_isInFreeTrial forKey:@"isInFreeTrial"];
  [v5 encodeBool:self->_isEligibleForFreeTrial forKey:@"isEligibleForFreeTrial"];
  [v5 encodeBool:self->_isPurchaser forKey:@"isPurchaser"];
  [v5 encodeInteger:self->_carrierBundlingStatusType forKey:@"carrierBundlingStatusType"];
  [v5 encodeInteger:self->_reasonType forKey:@"reasonType"];
  [v5 encodeInteger:self->_sourceType forKey:@"sourceType"];
  [v5 encodeInteger:self->_statusType forKey:@"statusType"];
  [v5 encodeBool:self->_isAdministrator forKey:@"isAdministrator"];
  [v5 encodeBool:self->_isDiscoveryModeEligible forKey:@"isDiscoveryModeEligible"];
  [v5 encodeObject:self->_termsStatusList forKey:@"termsStatusList"];
  [v5 encodeObject:self->_phoneNumber forKey:@"phoneNumber"];
  [v5 encodeObject:self->_cellularOperatorName forKey:@"cellularOperatorName"];
  [v5 encodeObject:self->_sessionIdentifier forKey:@"sessionIdentifier"];
  [v5 encodeInteger:self->_carrierBundlingErrorCode forKey:@"carrierBundlingErrorCode"];
  [v5 encodeBool:self->_isPartOfBundle forKey:@"isPartOfBundle"];
  [v5 encodeBool:self->_isBundleOwner forKey:@"isBundleOwner"];
  [v5 encodeObject:self->_eligibleOffers forKey:@"eligibleOffers"];
}

- (BOOL)isPartOfBundle
{
  return self->_partOfBundle;
}

- (BOOL)isMinorAccountHolder
{
  return self->_isMinorAccountHolder;
}

- (BOOL)isHeadOfHousehold
{
  return self->_isHeadOfHousehold;
}

- (BOOL)hasFamily
{
  return self->_hasFamily;
}

- (BOOL)hasFamilyGreaterThanOneMember
{
  return self->_hasFamilyGreaterThanOneMember;
}

- (NSArray)eligibleOffers
{
  return self->_eligibleOffers;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ICMusicSubscriptionStatus)initWithCoder:(id)a3
{
  id v4 = a3;
  if (initWithCoder__sAllowedClassesForPropertyListRepresentationOnceToken != -1) {
    dispatch_once(&initWithCoder__sAllowedClassesForPropertyListRepresentationOnceToken, &__block_literal_global_40940);
  }
  if (initWithCoder__sAllowedClassesForTermsStatusListOnceToken != -1) {
    dispatch_once(&initWithCoder__sAllowedClassesForTermsStatusListOnceToken, &__block_literal_global_227);
  }
  id v5 = [(ICMusicSubscriptionStatus *)self _init];
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClasses:initWithCoder__sAllowedClassesForPropertyListRepresentation forKey:@"responseDictionary"];
    uint64_t v7 = [v6 copy];
    responseDictionary = v5->_responseDictionary;
    v5->_responseDictionary = (NSDictionary *)v7;

    v5->_isMinorAccountHolder = [v4 decodeBoolForKey:@"isMinorAccountHolder"];
    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"studentExpirationDate"];
    studentExpirationDate = v5->_studentExpirationDate;
    v5->_studentExpirationDate = (NSDate *)v9;

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"studentVerificationId"];
    studentVerificationId = v5->_studentVerificationId;
    v5->_studentVerificationId = (NSString *)v11;

    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"studentVerifier"];
    studentVerifier = v5->_studentVerifier;
    v5->_studentVerifier = (NSString *)v13;

    v5->_hasFamily = [v4 decodeBoolForKey:@"hasFamily"];
    v5->_hasFamilyGreaterThanOneMember = [v4 decodeBoolForKey:@"hasFamilyGreaterThanOneMember"];
    v5->_isHeadOfHousehold = [v4 decodeBoolForKey:@"isHeadOfHousehold"];
    v5->_BOOL isMatchEnabled = [v4 decodeBoolForKey:@"isMatchEnabled"];
    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"expirationDate"];
    expirationDate = v5->_expirationDate;
    v5->_expirationDate = (NSDate *)v15;

    uint64_t v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"initialPurchaseTimestamp"];
    initialPurchaseTimestamp = v5->_initialPurchaseTimestamp;
    v5->_initialPurchaseTimestamp = (NSDate *)v17;

    uint64_t v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"serviceBeginsTimestamp"];
    serviceBeginsTimestamp = v5->_serviceBeginsTimestamp;
    v5->_serviceBeginsTimestamp = (NSDate *)v19;

    v5->_hasOfflineSlots = [v4 decodeBoolForKey:@"hasOfflineSlots"];
    v5->_isAutoRenewEnabled = [v4 decodeBoolForKey:@"isAutoRenewEnabled"];
    v5->_isInFreePeriod = [v4 decodeBoolForKey:@"isInFreePeriod"];
    v5->_isInFreeTrial = [v4 decodeBoolForKey:@"isInFreeTrial"];
    v5->_isEligibleForFreeTrial = [v4 decodeBoolForKey:@"isEligibleForFreeTrial"];
    v5->_isPurchaser = [v4 decodeBoolForKey:@"isPurchaser"];
    v5->_int64_t carrierBundlingStatusType = [v4 decodeIntegerForKey:@"carrierBundlingStatusType"];
    v5->_unint64_t reasonType = [v4 decodeIntegerForKey:@"reasonType"];
    v5->_unint64_t sourceType = [v4 decodeIntegerForKey:@"sourceType"];
    v5->_isAdministrator = [v4 decodeBoolForKey:@"isAdministrator"];
    v5->_isDiscoveryModeEligible = [v4 decodeBoolForKey:@"isDiscoveryModeEligible"];
    uint64_t v21 = [v4 decodeObjectOfClasses:initWithCoder__sAllowedClassesForTermsStatusList forKey:@"termsStatusList"];
    termsStatusList = v5->_termsStatusList;
    v5->_termsStatusList = (NSArray *)v21;

    uint64_t v23 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"phoneNumber"];
    phoneNumber = v5->_phoneNumber;
    v5->_phoneNumber = (NSString *)v23;

    uint64_t v25 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"cellularOperatorName"];
    cellularOperatorName = v5->_cellularOperatorName;
    v5->_cellularOperatorName = (NSString *)v25;

    uint64_t v27 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sessionIdentifier"];
    sessionIdentifier = v5->_sessionIdentifier;
    v5->_sessionIdentifier = (NSString *)v27;

    v5->_carrierBundlingErrorCode = [v4 decodeIntegerForKey:@"carrierBundlingErrorCode"];
    v5->_isPartOfBundle = [v4 decodeBoolForKey:@"isPartOfBundle"];
    v5->_isBundleOwner = [v4 decodeBoolForKey:@"isBundleOwner"];
    v29 = [v4 decodeObjectOfClasses:initWithCoder__sAllowedClassesForPropertyListRepresentation forKey:@"eligibleOffers"];
    uint64_t v30 = [v29 copy];
    eligibleOffers = v5->_eligibleOffers;
    v5->_eligibleOffers = (NSArray *)v30;

    unint64_t v32 = [v4 decodeIntegerForKey:@"statusType"];
    if (v32 >= 4) {
      unint64_t v33 = 0;
    }
    else {
      unint64_t v33 = v32;
    }
    v5->_int64_t statusType = v33;
  }

  return v5;
}

- (id)_init
{
  v3.receiver = self;
  v3.super_class = (Class)ICMusicSubscriptionStatus;
  return [(ICMusicSubscriptionStatus *)&v3 init];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_acceptSilentAuth, 0);
  objc_storeStrong((id *)&self->_eligibleOffers, 0);
  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
  objc_storeStrong((id *)&self->_cellularOperatorName, 0);
  objc_storeStrong((id *)&self->_phoneNumber, 0);
  objc_storeStrong((id *)&self->_termsStatusList, 0);
  objc_storeStrong((id *)&self->_serviceBeginsTimestamp, 0);
  objc_storeStrong((id *)&self->_initialPurchaseTimestamp, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_studentVerifier, 0);
  objc_storeStrong((id *)&self->_studentVerificationId, 0);
  objc_storeStrong((id *)&self->_studentExpirationDate, 0);

  objc_storeStrong((id *)&self->_responseDictionary, 0);
}

uint64_t __43__ICMusicSubscriptionStatus_initWithCoder___block_invoke_2()
{
  v0 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v1 = objc_opt_class();
  initWithCoder__sAllowedClassesForTermsStatusList = objc_msgSend(v0, "setWithObjects:", v1, objc_opt_class(), 0);

  return MEMORY[0x1F41817F8]();
}

uint64_t __43__ICMusicSubscriptionStatus_initWithCoder___block_invoke()
{
  v0 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  initWithCoder__sAllowedClassesForPropertyListRepresentation = objc_msgSend(v0, "setWithObjects:", v1, v2, v3, v4, v5, objc_opt_class(), 0);

  return MEMORY[0x1F41817F8]();
}

- (NSNumber)acceptSilentAuth
{
  return self->_acceptSilentAuth;
}

- (BOOL)isInGlidePreview
{
  return self->_inGlidePreview;
}

- (BOOL)isBundleOnwer
{
  return self->_bundleOwner;
}

- (int64_t)carrierBundlingErrorCode
{
  return self->_carrierBundlingErrorCode;
}

- (NSString)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (NSString)cellularOperatorName
{
  return self->_cellularOperatorName;
}

- (NSString)phoneNumber
{
  return self->_phoneNumber;
}

- (NSArray)termsStatusList
{
  return self->_termsStatusList;
}

- (BOOL)isDiscoveryModeEligible
{
  return self->_isDiscoveryModeEligible;
}

- (BOOL)isAdministrator
{
  return self->_isAdministrator;
}

- (int64_t)sourceType
{
  return self->_sourceType;
}

- (BOOL)isPurchaser
{
  return self->_isPurchaser;
}

- (BOOL)isEligibleForFreeTrial
{
  return self->_isEligibleForFreeTrial;
}

- (BOOL)isInFreePeriod
{
  return self->_isInFreePeriod;
}

- (BOOL)isInFreeTrial
{
  return self->_isInFreeTrial;
}

- (BOOL)isAutoRenewEnabled
{
  return self->_isAutoRenewEnabled;
}

- (BOOL)hasOfflineSlots
{
  return self->_hasOfflineSlots;
}

- (NSDate)serviceBeginsTimestamp
{
  return self->_serviceBeginsTimestamp;
}

- (NSDate)initialPurchaseTimestamp
{
  return self->_initialPurchaseTimestamp;
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (NSString)studentVerifier
{
  return self->_studentVerifier;
}

- (NSString)studentVerificationId
{
  return self->_studentVerificationId;
}

- (NSDate)studentExpirationDate
{
  return self->_studentExpirationDate;
}

- (void)_copySubscriptionStatusPropertiesToStatus:(id)a3 withZone:(_NSZone *)a4
{
  responseDictionary = self->_responseDictionary;
  uint64_t v7 = a3;
  uint64_t v8 = [(NSDictionary *)responseDictionary copyWithZone:a4];
  uint64_t v9 = (void *)v7[1];
  v7[1] = v8;

  *((unsigned char *)v7 + 16) = self->_isMinorAccountHolder;
  uint64_t v10 = [(NSDate *)self->_studentExpirationDate copyWithZone:a4];
  uint64_t v11 = (void *)v7[3];
  v7[3] = v10;

  uint64_t v12 = [(NSString *)self->_studentVerificationId copyWithZone:a4];
  uint64_t v13 = (void *)v7[4];
  v7[4] = v12;

  uint64_t v14 = [(NSString *)self->_studentVerifier copyWithZone:a4];
  uint64_t v15 = (void *)v7[5];
  v7[5] = v14;

  *((unsigned char *)v7 + 48) = self->_hasFamily;
  *((unsigned char *)v7 + 49) = self->_hasFamilyGreaterThanOneMember;
  *((unsigned char *)v7 + 50) = self->_isHeadOfHousehold;
  *((unsigned char *)v7 + 51) = self->_isMatchEnabled;
  uint64_t v16 = [(NSDate *)self->_expirationDate copyWithZone:a4];
  uint64_t v17 = (void *)v7[7];
  v7[7] = v16;

  uint64_t v18 = [(NSDate *)self->_initialPurchaseTimestamp copyWithZone:a4];
  uint64_t v19 = (void *)v7[8];
  v7[8] = v18;

  uint64_t v20 = [(NSDate *)self->_serviceBeginsTimestamp copyWithZone:a4];
  uint64_t v21 = (void *)v7[9];
  v7[9] = v20;

  *((unsigned char *)v7 + 80) = self->_hasOfflineSlots;
  *((unsigned char *)v7 + 81) = self->_isAutoRenewEnabled;
  *((unsigned char *)v7 + 82) = self->_isInFreePeriod;
  *((unsigned char *)v7 + 83) = self->_isInFreeTrial;
  *((unsigned char *)v7 + 84) = self->_isEligibleForFreeTrial;
  *((unsigned char *)v7 + 85) = self->_isPurchaser;
  v7[11] = self->_carrierBundlingStatusType;
  v7[12] = self->_reasonType;
  v7[13] = self->_sourceType;
  v7[14] = self->_statusType;
  *((unsigned char *)v7 + 120) = self->_isAdministrator;
  *((unsigned char *)v7 + 121) = self->_isDiscoveryModeEligible;
  uint64_t v22 = [(NSArray *)self->_termsStatusList copyWithZone:a4];
  uint64_t v23 = (void *)v7[16];
  v7[16] = v22;

  uint64_t v24 = [(NSString *)self->_phoneNumber copyWithZone:a4];
  uint64_t v25 = (void *)v7[17];
  v7[17] = v24;

  uint64_t v26 = [(NSString *)self->_cellularOperatorName copyWithZone:a4];
  uint64_t v27 = (void *)v7[18];
  v7[18] = v26;

  uint64_t v28 = [(NSString *)self->_sessionIdentifier copyWithZone:a4];
  v29 = (void *)v7[19];
  v7[19] = v28;

  v7[20] = self->_carrierBundlingErrorCode;
  *((unsigned char *)v7 + 168) = self->_isPartOfBundle;
  *((unsigned char *)v7 + 169) = self->_isBundleOwner;
  uint64_t v30 = [(NSArray *)self->_eligibleOffers copyWithZone:a4];
  id v31 = (id)v7[22];
  v7[22] = v30;
}

- (NSDictionary)dictionaryRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v4 = v3;
  phoneNumber = self->_phoneNumber;
  if (phoneNumber) {
    [v3 setObject:phoneNumber forKey:@"phoneNumber"];
  }
  cellularOperatorName = self->_cellularOperatorName;
  if (cellularOperatorName) {
    [v4 setObject:cellularOperatorName forKey:@"cellularOperatorName"];
  }
  sessionIdentifier = self->_sessionIdentifier;
  if (sessionIdentifier) {
    [v4 setObject:sessionIdentifier forKey:@"sessionIdentifier"];
  }
  if (self->_carrierBundlingErrorCode)
  {
    uint64_t v8 = objc_msgSend(NSNumber, "numberWithInteger:");
    [v4 setObject:v8 forKey:@"carrierBundlingErrorCode"];
  }
  uint64_t v9 = [NSNumber numberWithInteger:self->_carrierBundlingStatusType];
  [v4 setObject:v9 forKey:@"carrierBundlingStatusType"];

  id v10 = (id)[(NSDictionary *)self->_responseDictionary mutableCopy];
  if (!v10) {
    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  uint64_t v11 = (void *)[v4 copy];
  [v10 setObject:v11 forKey:@"_ICMusicSubscriptionStatusAdditionalProperties"];

  uint64_t v12 = (void *)[v10 copy];

  return (NSDictionary *)v12;
}

- (BOOL)isCloudMusicServiceEnabled
{
  return [(ICMusicSubscriptionStatus *)self hasCapability:256];
}

- (BOOL)hasAddToCloudLibraryCapability
{
  return [(ICMusicSubscriptionStatus *)self hasCapability:256];
}

- (BOOL)hasCatalogPlaybackCapability
{
  return [(ICMusicSubscriptionStatus *)self hasCapability:1];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v5 = [(ICMusicSubscriptionStatus *)[ICMutableMusicSubscriptionStatus alloc] _init];
  [(ICMusicSubscriptionStatus *)self _copySubscriptionStatusPropertiesToStatus:v5 withZone:a3];
  return v5;
}

@end