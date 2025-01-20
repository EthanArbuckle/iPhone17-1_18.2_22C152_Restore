@interface MRGroupSessionEligibilityStatus
+ (BOOL)supportsSecureCoding;
- (BOOL)idsAccountIsValid;
- (BOOL)isEligibleForHostingGroupSession;
- (BOOL)isEligibleForHostingGroupSessionExcludingAcknowledgements;
- (BOOL)isEligibleForJoiningGroupSession;
- (BOOL)isEqual:(id)a3;
- (BOOL)isManateeEnabled;
- (BOOL)routeIsValidForHosting;
- (MRGroupSessionEligibilityStatus)initWithCoder:(id)a3;
- (MRMediaUserState)currentMediaUserState;
- (NSArray)mediaUserStates;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryDescription;
- (id)differenceFrom:(id)a3;
- (unint64_t)mediaAccountHostingState;
- (unint64_t)mediaAccountJoiningState;
- (unsigned)routeType;
- (void)encodeWithCoder:(id)a3;
- (void)setCurrentMediaUserState:(id)a3;
- (void)setIdsAccountIsValid:(BOOL)a3;
- (void)setIsEligibleForHostingGroupSession:(BOOL)a3;
- (void)setIsEligibleForHostingGroupSessionExcludingAcknowledgements:(BOOL)a3;
- (void)setIsEligibleForJoiningGroupSession:(BOOL)a3;
- (void)setIsManateeEnabled:(BOOL)a3;
- (void)setMediaAccountHostingState:(unint64_t)a3;
- (void)setMediaAccountJoiningState:(unint64_t)a3;
- (void)setMediaUserStates:(id)a3;
- (void)setRouteIsValidForHosting:(BOOL)a3;
- (void)setRouteType:(unsigned __int8)a3;
@end

@implementation MRGroupSessionEligibilityStatus

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MRGroupSessionEligibilityStatus)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MRGroupSessionEligibilityStatus;
  v5 = [(MRGroupSessionEligibilityStatus *)&v9 init];
  if (v5)
  {
    -[MRGroupSessionEligibilityStatus setIsEligibleForHostingGroupSession:](v5, "setIsEligibleForHostingGroupSession:", [v4 decodeBoolForKey:@"ehgs"]);
    -[MRGroupSessionEligibilityStatus setIsEligibleForHostingGroupSessionExcludingAcknowledgements:](v5, "setIsEligibleForHostingGroupSessionExcludingAcknowledgements:", [v4 decodeBoolForKey:@"ehgsea"]);
    -[MRGroupSessionEligibilityStatus setIsEligibleForJoiningGroupSession:](v5, "setIsEligibleForJoiningGroupSession:", [v4 decodeBoolForKey:@"ejgS"]);
    -[MRGroupSessionEligibilityStatus setIsManateeEnabled:](v5, "setIsManateeEnabled:", [v4 decodeBoolForKey:@"mte"]);
    -[MRGroupSessionEligibilityStatus setIdsAccountIsValid:](v5, "setIdsAccountIsValid:", [v4 decodeBoolForKey:@"acv"]);
    -[MRGroupSessionEligibilityStatus setMediaAccountHostingState:](v5, "setMediaAccountHostingState:", [v4 decodeIntegerForKey:@"mhs"]);
    -[MRGroupSessionEligibilityStatus setMediaAccountJoiningState:](v5, "setMediaAccountJoiningState:", [v4 decodeIntegerForKey:@"mjs"]);
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"cmus"];
    [(MRGroupSessionEligibilityStatus *)v5 setCurrentMediaUserState:v6];

    v7 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"mus"];
    [(MRGroupSessionEligibilityStatus *)v5 setMediaUserStates:v7];

    -[MRGroupSessionEligibilityStatus setRouteType:](v5, "setRouteType:", [v4 decodeIntegerForKey:@"rt"]);
    -[MRGroupSessionEligibilityStatus setRouteIsValidForHosting:](v5, "setRouteIsValidForHosting:", [v4 decodeBoolForKey:@"rvH"]);
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  objc_msgSend(v6, "encodeBool:forKey:", -[MRGroupSessionEligibilityStatus isEligibleForHostingGroupSession](self, "isEligibleForHostingGroupSession"), @"ehgs");
  objc_msgSend(v6, "encodeBool:forKey:", -[MRGroupSessionEligibilityStatus isEligibleForHostingGroupSessionExcludingAcknowledgements](self, "isEligibleForHostingGroupSessionExcludingAcknowledgements"), @"ehgsea");
  objc_msgSend(v6, "encodeBool:forKey:", -[MRGroupSessionEligibilityStatus isEligibleForJoiningGroupSession](self, "isEligibleForJoiningGroupSession"), @"ejgS");
  objc_msgSend(v6, "encodeBool:forKey:", -[MRGroupSessionEligibilityStatus isManateeEnabled](self, "isManateeEnabled"), @"mte");
  objc_msgSend(v6, "encodeBool:forKey:", -[MRGroupSessionEligibilityStatus idsAccountIsValid](self, "idsAccountIsValid"), @"acv");
  objc_msgSend(v6, "encodeInteger:forKey:", -[MRGroupSessionEligibilityStatus mediaAccountHostingState](self, "mediaAccountHostingState"), @"mhs");
  objc_msgSend(v6, "encodeInteger:forKey:", -[MRGroupSessionEligibilityStatus mediaAccountJoiningState](self, "mediaAccountJoiningState"), @"mjs");
  id v4 = [(MRGroupSessionEligibilityStatus *)self currentMediaUserState];
  [v6 encodeObject:v4 forKey:@"cmus"];

  v5 = [(MRGroupSessionEligibilityStatus *)self mediaUserStates];
  [v6 encodeObject:v5 forKey:@"mus"];

  objc_msgSend(v6, "encodeInteger:forKey:", -[MRGroupSessionEligibilityStatus routeType](self, "routeType"), @"rt");
  objc_msgSend(v6, "encodeBool:forKey:", -[MRGroupSessionEligibilityStatus routeIsValidForHosting](self, "routeIsValidForHosting"), @"rvH");
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(MRGroupSessionEligibilityStatus);
  [(MRGroupSessionEligibilityStatus *)v4 setIsEligibleForHostingGroupSession:[(MRGroupSessionEligibilityStatus *)self isEligibleForHostingGroupSession]];
  [(MRGroupSessionEligibilityStatus *)v4 setIsEligibleForHostingGroupSessionExcludingAcknowledgements:[(MRGroupSessionEligibilityStatus *)self isEligibleForHostingGroupSessionExcludingAcknowledgements]];
  [(MRGroupSessionEligibilityStatus *)v4 setIsEligibleForJoiningGroupSession:[(MRGroupSessionEligibilityStatus *)self isEligibleForJoiningGroupSession]];
  [(MRGroupSessionEligibilityStatus *)v4 setIsManateeEnabled:[(MRGroupSessionEligibilityStatus *)self isManateeEnabled]];
  [(MRGroupSessionEligibilityStatus *)v4 setIdsAccountIsValid:[(MRGroupSessionEligibilityStatus *)self idsAccountIsValid]];
  [(MRGroupSessionEligibilityStatus *)v4 setMediaAccountHostingState:[(MRGroupSessionEligibilityStatus *)self mediaAccountHostingState]];
  [(MRGroupSessionEligibilityStatus *)v4 setMediaAccountJoiningState:[(MRGroupSessionEligibilityStatus *)self mediaAccountJoiningState]];
  v5 = [(MRGroupSessionEligibilityStatus *)self currentMediaUserState];
  id v6 = (void *)[v5 copy];
  [(MRGroupSessionEligibilityStatus *)v4 setCurrentMediaUserState:v6];

  v7 = [(MRGroupSessionEligibilityStatus *)self mediaUserStates];
  v8 = (void *)[v7 copy];
  [(MRGroupSessionEligibilityStatus *)v4 setMediaUserStates:v8];

  [(MRGroupSessionEligibilityStatus *)v4 setRouteType:[(MRGroupSessionEligibilityStatus *)self routeType]];
  [(MRGroupSessionEligibilityStatus *)v4 setRouteIsValidForHosting:[(MRGroupSessionEligibilityStatus *)self routeIsValidForHosting]];
  return v4;
}

- (BOOL)isEligibleForHostingGroupSessionExcludingAcknowledgements
{
  return self->_isEligibleForHostingGroupSessionExcludingAcknowledgements;
}

- (void)setRouteType:(unsigned __int8)a3
{
  self->_routeType = a3;
}

- (void)setRouteIsValidForHosting:(BOOL)a3
{
  self->_routeIsValidForHosting = a3;
}

- (void)setMediaUserStates:(id)a3
{
}

- (void)setMediaAccountJoiningState:(unint64_t)a3
{
  self->_mediaAccountJoiningState = a3;
}

- (void)setMediaAccountHostingState:(unint64_t)a3
{
  self->_mediaAccountHostingState = a3;
}

- (void)setIsManateeEnabled:(BOOL)a3
{
  self->_isManateeEnabled = a3;
}

- (void)setIsEligibleForJoiningGroupSession:(BOOL)a3
{
  self->_isEligibleForJoiningGroupSession = a3;
}

- (void)setIsEligibleForHostingGroupSessionExcludingAcknowledgements:(BOOL)a3
{
  self->_isEligibleForHostingGroupSessionExcludingAcknowledgements = a3;
}

- (void)setIsEligibleForHostingGroupSession:(BOOL)a3
{
  self->_isEligibleForHostingGroupSession = a3;
}

- (void)setIdsAccountIsValid:(BOOL)a3
{
  self->_idsAccountIsValid = a3;
}

- (void)setCurrentMediaUserState:(id)a3
{
}

- (unsigned)routeType
{
  return self->_routeType;
}

- (BOOL)routeIsValidForHosting
{
  return self->_routeIsValidForHosting;
}

- (NSArray)mediaUserStates
{
  return self->_mediaUserStates;
}

- (unint64_t)mediaAccountJoiningState
{
  return self->_mediaAccountJoiningState;
}

- (unint64_t)mediaAccountHostingState
{
  return self->_mediaAccountHostingState;
}

- (BOOL)isManateeEnabled
{
  return self->_isManateeEnabled;
}

- (BOOL)isEligibleForJoiningGroupSession
{
  return self->_isEligibleForJoiningGroupSession;
}

- (BOOL)isEligibleForHostingGroupSession
{
  return self->_isEligibleForHostingGroupSession;
}

- (BOOL)idsAccountIsValid
{
  return self->_idsAccountIsValid;
}

- (MRMediaUserState)currentMediaUserState
{
  return self->_currentMediaUserState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaUserStates, 0);

  objc_storeStrong((id *)&self->_currentMediaUserState, 0);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (MRGroupSessionEligibilityStatus *)a3;
  v5 = v4;
  if (v4 == self)
  {
    char v20 = 1;
    goto LABEL_19;
  }
  if (!v4 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    char v20 = 0;
    goto LABEL_19;
  }
  id v6 = v5;
  BOOL v7 = [(MRGroupSessionEligibilityStatus *)self isEligibleForHostingGroupSession];
  if (v7 != [(MRGroupSessionEligibilityStatus *)v6 isEligibleForHostingGroupSession]) {
    goto LABEL_15;
  }
  BOOL v8 = [(MRGroupSessionEligibilityStatus *)self isEligibleForHostingGroupSessionExcludingAcknowledgements];
  if (v8 != [(MRGroupSessionEligibilityStatus *)v6 isEligibleForHostingGroupSessionExcludingAcknowledgements])goto LABEL_15; {
  BOOL v9 = [(MRGroupSessionEligibilityStatus *)self isEligibleForJoiningGroupSession];
  }
  if (v9 != [(MRGroupSessionEligibilityStatus *)v6 isEligibleForJoiningGroupSession]) {
    goto LABEL_15;
  }
  BOOL v10 = [(MRGroupSessionEligibilityStatus *)self isManateeEnabled];
  if (v10 != [(MRGroupSessionEligibilityStatus *)v6 isManateeEnabled]) {
    goto LABEL_15;
  }
  BOOL v11 = [(MRGroupSessionEligibilityStatus *)self idsAccountIsValid];
  if (v11 != [(MRGroupSessionEligibilityStatus *)v6 idsAccountIsValid]) {
    goto LABEL_15;
  }
  BOOL v12 = [(MRGroupSessionEligibilityStatus *)self mediaAccountHostingState] == 0;
  if (v12 == ([(MRGroupSessionEligibilityStatus *)v6 mediaAccountHostingState] != 0)) {
    goto LABEL_15;
  }
  BOOL v13 = [(MRGroupSessionEligibilityStatus *)self mediaAccountJoiningState] == 0;
  if (v13 == ([(MRGroupSessionEligibilityStatus *)v6 mediaAccountJoiningState] != 0)) {
    goto LABEL_15;
  }
  BOOL v14 = [(MRGroupSessionEligibilityStatus *)self routeType] == 0;
  if (v14 == ([(MRGroupSessionEligibilityStatus *)v6 routeType] != 0)) {
    goto LABEL_15;
  }
  BOOL v15 = [(MRGroupSessionEligibilityStatus *)self routeIsValidForHosting];
  if (v15 != [(MRGroupSessionEligibilityStatus *)v6 routeIsValidForHosting]) {
    goto LABEL_15;
  }
  id v16 = [(MRGroupSessionEligibilityStatus *)self currentMediaUserState];
  id v17 = [(MRGroupSessionEligibilityStatus *)v6 currentMediaUserState];
  if (v16 == v17)
  {

    goto LABEL_21;
  }
  v18 = v17;
  char v19 = [v16 isEqual:v17];

  if (v19)
  {
LABEL_21:
    v22 = [(MRGroupSessionEligibilityStatus *)self mediaUserStates];
    v23 = [(MRGroupSessionEligibilityStatus *)v6 mediaUserStates];
    if (v22 == v23) {
      char v20 = 1;
    }
    else {
      char v20 = [v22 isEqual:v23];
    }

    goto LABEL_16;
  }
LABEL_15:
  char v20 = 0;
LABEL_16:

LABEL_19:
  return v20;
}

- (id)description
{
  v3 = (void *)MEMORY[0x1E4F28E78];
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  id v6 = [v3 stringWithFormat:@"<%@: ", v5];

  objc_msgSend(v6, "appendFormat:", @"eligibleForHosting=%d", -[MRGroupSessionEligibilityStatus isEligibleForHostingGroupSession](self, "isEligibleForHostingGroupSession"));
  [v6 appendFormat:@", isEligibleForHostingGroupSessionExcludingAcknowledgements=%d", -[MRGroupSessionEligibilityStatus isEligibleForHostingGroupSessionExcludingAcknowledgements](self, "isEligibleForHostingGroupSessionExcludingAcknowledgements")];
  [v6 appendFormat:@", eligibleForJoining=%d", -[MRGroupSessionEligibilityStatus isEligibleForJoiningGroupSession](self, "isEligibleForJoiningGroupSession")];
  [v6 appendFormat:@", manatee=%d", -[MRGroupSessionEligibilityStatus isManateeEnabled](self, "isManateeEnabled")];
  [v6 appendFormat:@", idsAccountValid=%d", -[MRGroupSessionEligibilityStatus idsAccountIsValid](self, "idsAccountIsValid")];
  unint64_t v7 = [(MRGroupSessionEligibilityStatus *)self mediaAccountHostingState];
  if (v7 - 1 > 5) {
    BOOL v8 = @"Indeterminate";
  }
  else {
    BOOL v8 = off_1E57D7988[v7 - 1];
  }
  [v6 appendFormat:@", mediaAccountHostingState=%@", v8];
  unint64_t v9 = [(MRGroupSessionEligibilityStatus *)self mediaAccountJoiningState];
  if (v9 - 1 > 4) {
    BOOL v10 = @"Indeterminate";
  }
  else {
    BOOL v10 = off_1E57D79B8[v9 - 1];
  }
  [v6 appendFormat:@", mediaAccountJoiningState=%@", v10];
  [v6 appendFormat:@", routeType=%d", -[MRGroupSessionEligibilityStatus routeType](self, "routeType")];
  [v6 appendFormat:@", routeValidForHosting=%d", -[MRGroupSessionEligibilityStatus routeIsValidForHosting](self, "routeIsValidForHosting")];
  BOOL v11 = [(MRGroupSessionEligibilityStatus *)self currentMediaUserState];
  [v6 appendFormat:@", currentMediaUserState=%@", v11];

  BOOL v12 = [(MRGroupSessionEligibilityStatus *)self mediaUserStates];
  unint64_t v13 = [v12 count];

  if (v13 >= 2)
  {
    BOOL v14 = [(MRGroupSessionEligibilityStatus *)self mediaUserStates];
    [v6 appendFormat:@", mediaUserStates=%@", v14];
  }
  [v6 appendString:@">"];

  return v6;
}

- (id)dictionaryDescription
{
  v3 = objc_opt_new();
  id v4 = objc_msgSend(NSNumber, "numberWithBool:", -[MRGroupSessionEligibilityStatus isEligibleForHostingGroupSession](self, "isEligibleForHostingGroupSession"));
  [v3 setObject:v4 forKeyedSubscript:@"isEligibleForHostingGroupSession"];

  v5 = objc_msgSend(NSNumber, "numberWithBool:", -[MRGroupSessionEligibilityStatus isEligibleForHostingGroupSessionExcludingAcknowledgements](self, "isEligibleForHostingGroupSessionExcludingAcknowledgements"));
  [v3 setObject:v5 forKeyedSubscript:@"isEligibleForHostingGroupSessionExcludingAcknowledgements"];

  id v6 = objc_msgSend(NSNumber, "numberWithBool:", -[MRGroupSessionEligibilityStatus isEligibleForJoiningGroupSession](self, "isEligibleForJoiningGroupSession"));
  [v3 setObject:v6 forKeyedSubscript:@"isEligibleForJoiningGroupSession"];

  unint64_t v7 = objc_msgSend(NSNumber, "numberWithBool:", -[MRGroupSessionEligibilityStatus isManateeEnabled](self, "isManateeEnabled"));
  [v3 setObject:v7 forKeyedSubscript:@"isManateeEnabled"];

  BOOL v8 = objc_msgSend(NSNumber, "numberWithBool:", -[MRGroupSessionEligibilityStatus idsAccountIsValid](self, "idsAccountIsValid"));
  [v3 setObject:v8 forKeyedSubscript:@"idsAccountIsValid"];

  unint64_t v9 = [(MRGroupSessionEligibilityStatus *)self mediaAccountHostingState] - 1;
  if (v9 > 5) {
    BOOL v10 = @"Indeterminate";
  }
  else {
    BOOL v10 = off_1E57D7988[v9];
  }
  [v3 setObject:v10 forKeyedSubscript:@"mediaAccountHostingState"];
  unint64_t v11 = [(MRGroupSessionEligibilityStatus *)self mediaAccountJoiningState] - 1;
  if (v11 > 4) {
    BOOL v12 = @"Indeterminate";
  }
  else {
    BOOL v12 = off_1E57D79B8[v11];
  }
  [v3 setObject:v12 forKeyedSubscript:@"mediaAccountJoiningState"];
  unint64_t v13 = [(MRGroupSessionEligibilityStatus *)self currentMediaUserState];
  BOOL v14 = (void *)[v13 copy];
  [v3 setObject:v14 forKeyedSubscript:@"currentMediaUserState"];

  BOOL v15 = [(MRGroupSessionEligibilityStatus *)self mediaUserStates];
  id v16 = (void *)[v15 copy];
  [v3 setObject:v16 forKeyedSubscript:@"mediaUserStates"];

  id v17 = MRGroupSessionRouteTypeDescription([(MRGroupSessionEligibilityStatus *)self routeType]);
  [v3 setObject:v17 forKeyedSubscript:@"routeType"];

  v18 = objc_msgSend(NSNumber, "numberWithBool:", -[MRGroupSessionEligibilityStatus routeIsValidForHosting](self, "routeIsValidForHosting"));
  [v3 setObject:v18 forKeyedSubscript:@"routeIsValidForHosting"];

  return v3;
}

- (id)differenceFrom:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(MRGroupSessionEligibilityStatus *)self dictionaryDescription];
  id v6 = [v4 dictionaryDescription];
  unint64_t v7 = (void *)MEMORY[0x1E4F1CAD0];
  BOOL v8 = [v5 allKeys];
  unint64_t v9 = [v6 allKeys];
  BOOL v10 = [v8 arrayByAddingObjectsFromArray:v9];
  unint64_t v11 = [v7 setWithArray:v10];

  uint64_t v12 = objc_opt_new();
  unint64_t v13 = (void *)v12;
  if (self)
  {
    if (v4)
    {
      id v30 = v4;
      v31 = (void *)v12;
      long long v34 = 0u;
      long long v35 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      v29 = v11;
      id v14 = v11;
      uint64_t v15 = [v14 countByEnumeratingWithState:&v32 objects:v36 count:16];
      if (!v15) {
        goto LABEL_15;
      }
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v33;
      while (1)
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v33 != v17) {
            objc_enumerationMutation(v14);
          }
          uint64_t v19 = *(void *)(*((void *)&v32 + 1) + 8 * i);
          id v20 = [v5 objectForKeyedSubscript:v19];
          id v21 = [v6 objectForKeyedSubscript:v19];
          if (v20 == v21)
          {
            v26 = v20;
            v25 = v20;
          }
          else
          {
            v22 = v21;
            char v23 = [v20 isEqual:v21];

            if (v23) {
              continue;
            }
            v24 = (void *)MEMORY[0x1E4F779D8];
            v25 = [v6 objectForKeyedSubscript:v19];
            v26 = [v5 objectForKeyedSubscript:v19];
            id v20 = [v24 pairWithFirst:v25 second:v26];
            [v31 setObject:v20 forKeyedSubscript:v19];
          }
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v32 objects:v36 count:16];
        if (!v16)
        {
LABEL_15:

          unint64_t v13 = v31;
          v27 = [v31 description];
          unint64_t v11 = v29;
          id v4 = v30;
          goto LABEL_18;
        }
      }
    }
    v27 = @"Changed from nil";
  }
  else
  {
    v27 = @"Changed to nil";
  }
LABEL_18:

  return v27;
}

@end