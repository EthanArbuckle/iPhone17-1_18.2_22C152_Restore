@interface NFApplet
+ (BOOL)supportsSecureCoding;
+ (id)aidListForPrinting:(id)a3;
- (BOOL)authTransientConfigurable;
- (BOOL)authTransientSupport;
- (BOOL)containsSubKeys;
- (BOOL)isContainer;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToApplet:(id)a3;
- (BOOL)isGPLocked;
- (BOOL)isPPSEControllable;
- (BOOL)isProxy;
- (BOOL)isTypeF;
- (BOOL)managedBySP;
- (BOOL)suppressTypeA;
- (BOOL)suppressTypeB;
- (NFApplet)groupHead;
- (NFApplet)initWithCoder:(id)a3;
- (NFApplet)initWithDictionary:(id)a3;
- (NFAppletCollection)appletCollection;
- (NSArray)groupMemberIDs;
- (NSArray)groupMembers;
- (NSArray)multiSEGroupMemberIDs;
- (NSArray)referencedApps;
- (NSData)discretionaryData;
- (NSData)identifierAsData;
- (NSData)instanceACL;
- (NSString)groupHeadID;
- (NSString)identifier;
- (NSString)moduleIdentifier;
- (NSString)packageIdentifier;
- (NSString)seIdentifier;
- (id)asDictionary;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)multiSSDMembers;
- (int64_t)seOS;
- (unint64_t)rawGPState;
- (unsigned)activationState;
- (unsigned)family;
- (unsigned)groupActivationStyle;
- (unsigned)lifecycleState;
- (unsigned)supportedTypeFSystem;
- (void)_initManagedBySP;
- (void)_setIsActive:(BOOL)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setAppletCollection:(id)a3;
- (void)setInstanceACL:(id)a3;
@end

@implementation NFApplet

- (void)_initManagedBySP
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  self->_managedBySP = 0;
  if ([(NSData *)self->_discretionaryData length])
  {
    v3 = [MEMORY[0x1E4FBA880] TLVsWithData:self->_discretionaryData];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    uint64_t v4 = [v3 countByEnumeratingWithState:&v18 objects:v23 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v19 != v6) {
            objc_enumerationMutation(v3);
          }
          v8 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          if ([v8 tag] == 254)
          {
            long long v16 = 0u;
            long long v17 = 0u;
            long long v14 = 0u;
            long long v15 = 0u;
            v9 = objc_msgSend(v8, "children", 0);
            uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v22 count:16];
            if (v10)
            {
              uint64_t v11 = v10;
              uint64_t v12 = *(void *)v15;
              while (2)
              {
                for (uint64_t j = 0; j != v11; ++j)
                {
                  if (*(void *)v15 != v12) {
                    objc_enumerationMutation(v9);
                  }
                  if ([*(id *)(*((void *)&v14 + 1) + 8 * j) tag] == 57154)
                  {
                    self->_managedBySP = 1;
                    goto LABEL_18;
                  }
                }
                uint64_t v11 = [v9 countByEnumeratingWithState:&v14 objects:v22 count:16];
                if (v11) {
                  continue;
                }
                break;
              }
            }
LABEL_18:
          }
        }
        uint64_t v5 = [v3 countByEnumeratingWithState:&v18 objects:v23 count:16];
      }
      while (v5);
    }
  }
}

- (id)description
{
  if ((self->_family - 1) > 7u) {
    uint64_t v4 = @"UNKNOWN";
  }
  else {
    uint64_t v4 = (__CFString *)*((void *)&off_1E595D1F0 + (char)(self->_family - 1));
  }
  v53 = v4;
  int v5 = [(NFApplet *)self lifecycleState];
  uint64_t v6 = @"UNKNOWN";
  if (v5 <= 14)
  {
    switch(v5)
    {
      case 1:
        uint64_t v6 = @"loaded";
        break;
      case 3:
        uint64_t v6 = @"installed";
        break;
      case 7:
        uint64_t v6 = @"selectable";
        break;
    }
  }
  else if (v5 > 128)
  {
    if (v5 == 129)
    {
      uint64_t v6 = @"terminated";
    }
    else if (v5 == 130)
    {
      uint64_t v6 = @"frozen";
    }
  }
  else if (v5 == 15)
  {
    uint64_t v6 = @"personalized";
  }
  else if (v5 == 23)
  {
    uint64_t v6 = @"pre-personalized";
  }
  v52 = v6;
  int activationState = self->_activationState;
  if (activationState == 128)
  {
    v8 = @"non-activatable";
  }
  else if (activationState == 1)
  {
    v8 = @"activated";
  }
  else if (self->_activationState)
  {
    v8 = @"UNKNOWN";
  }
  else
  {
    v8 = @"deactivated";
  }
  v48 = v8;
  id v47 = [NSString alloc];
  v59.receiver = self;
  v59.super_class = (Class)NFApplet;
  v51 = [(NFApplet *)&v59 description];
  v50 = [(NSData *)self->_identifierAsData NF_asHexString];
  uint64_t family = self->_family;
  uint64_t appletGPState = self->_appletGPState;
  if ([(NFApplet *)self isGPLocked]) {
    v9 = @"YES";
  }
  else {
    v9 = @"NO";
  }
  uint64_t v42 = self->_activationState;
  v43 = v9;
  if (self->_authTransientSupport) {
    uint64_t v10 = @"YES";
  }
  else {
    uint64_t v10 = @"NO";
  }
  if (self->_authTransientConfigurable) {
    uint64_t v11 = @"YES";
  }
  else {
    uint64_t v11 = @"NO";
  }
  v40 = v11;
  v41 = v10;
  groupHeadIDAsData = self->_groupHeadIDAsData;
  if (groupHeadIDAsData)
  {
    id v12 = [NSString alloc];
    v34 = [(NSData *)self->_groupHeadIDAsData NF_asHexString];
    v58 = (__CFString *)[v12 initWithFormat:@"groupHead=%@ ", v34];
  }
  else
  {
    v58 = &stru_1EEF24A78;
  }
  NSUInteger v46 = [(NSArray *)self->_groupMemberIDs count];
  if (v46)
  {
    id v13 = [NSString alloc];
    v33 = [(NSArray *)self->_groupMemberIDs componentsJoinedByString:@", "];
    v57 = (__CFString *)[v13 initWithFormat:@"groupMembers={%@} ", v33];
  }
  else
  {
    v57 = &stru_1EEF24A78;
  }
  NSUInteger v39 = [(NSArray *)self->_referencedAppIDs count];
  if (v39)
  {
    id v14 = [NSString alloc];
    v32 = [(NSArray *)self->_referencedAppIDs componentsJoinedByString:@", "];
    v56 = (__CFString *)[v14 initWithFormat:@"referencedApps={%@} ", v32];
  }
  else
  {
    v56 = &stru_1EEF24A78;
  }
  if (self->_isContainer) {
    long long v15 = @"YES";
  }
  else {
    long long v15 = @"NO";
  }
  if (self->_isProxy) {
    long long v16 = @"YES";
  }
  else {
    long long v16 = @"NO";
  }
  v35 = v16;
  v36 = v15;
  packageIdentifierAsData = self->_packageIdentifierAsData;
  if (packageIdentifierAsData)
  {
    id v17 = [NSString alloc];
    v31 = [(NSData *)self->_packageIdentifierAsData NF_asHexString];
    v55 = (__CFString *)[v17 initWithFormat:@"packageIdentifier=%@ ", v31];
  }
  else
  {
    v55 = &stru_1EEF24A78;
  }
  moduleIdentifierAsData = self->_moduleIdentifierAsData;
  if (moduleIdentifierAsData)
  {
    id v18 = [NSString alloc];
    v30 = [(NSData *)self->_moduleIdentifierAsData NF_asHexString];
    v54 = (__CFString *)[v18 initWithFormat:@"moduleIdentifier=%@ ", v30];
  }
  else
  {
    v54 = &stru_1EEF24A78;
  }
  uint64_t groupActivationStyle = self->_groupActivationStyle;
  discretionaryData = self->_discretionaryData;
  if (discretionaryData) {
    long long v21 = (__CFString *)[[NSString alloc] initWithFormat:@"discretionaryData=%@ ", self->_discretionaryData];
  }
  else {
    long long v21 = &stru_1EEF24A78;
  }
  NSUInteger v22 = [(NSArray *)self->_multiSEApplicationGroupMemberIDs count];
  if (v22)
  {
    id v23 = [NSString alloc];
    v2 = [(NSArray *)self->_multiSEApplicationGroupMemberIDs componentsJoinedByString:@", "];
    uint64_t v24 = (__CFString *)[v23 initWithFormat:@"multiSsdMembers={%@} ", v2];
  }
  else
  {
    uint64_t v24 = &stru_1EEF24A78;
  }
  NSUInteger v25 = [(NSData *)self->_typeFSystemCode length];
  if (v25) {
    v26 = (__CFString *)[[NSString alloc] initWithFormat:@"systemCode=%@ ", self->_typeFSystemCode];
  }
  else {
    v26 = &stru_1EEF24A78;
  }
  if (self->_managedBySP) {
    v27 = @"managedBySP=Y";
  }
  else {
    v27 = &stru_1EEF24A78;
  }
  v28 = objc_msgSend(v47, "initWithFormat:", @"%@ { identifier=%@ family=0x%x(%@) lifecycle=0x%x(%@) locked=%@ activation=0x%x(%@) authTransient=%@ authTransientConfigurable=%@ %@%@%@isContainer=%@ isProxy=%@ %@%@activationStyle=%d %@ %@%@seOS=%lu%@instanceACL=%@}", v51, v50, family, v53, appletGPState, v52, v43, v42, v48, v41, v40, v58, v57, v56, v36, v35,
                  v55,
                  v54,
                  groupActivationStyle,
                  v21,
                  v24,
                  v26,
                  self->_seOS,
                  v27,
                  self->_instanceACL);
  if (v25) {

  }
  if (v22)
  {
  }
  if (discretionaryData) {

  }
  if (moduleIdentifierAsData)
  {
  }
  if (packageIdentifierAsData)
  {
  }
  if (v39)
  {
  }
  if (v46)
  {
  }
  if (groupHeadIDAsData)
  {
  }
  return v28;
}

- (id)asDictionary
{
  if ((self->_family - 1) > 7u) {
    v3 = @"UNKNOWN";
  }
  else {
    v3 = (__CFString *)*((void *)&off_1E595D1F0 + (char)(self->_family - 1));
  }
  v38 = v3;
  int v4 = [(NFApplet *)self lifecycleState];
  int v5 = @"UNKNOWN";
  if (v4 <= 14)
  {
    switch(v4)
    {
      case 1:
        int v5 = @"loaded";
        break;
      case 3:
        int v5 = @"installed";
        break;
      case 7:
        int v5 = @"selectable";
        break;
    }
  }
  else if (v4 > 128)
  {
    if (v4 == 129)
    {
      int v5 = @"terminated";
    }
    else if (v4 == 130)
    {
      int v5 = @"frozen";
    }
  }
  else if (v4 == 15)
  {
    int v5 = @"personalized";
  }
  else if (v4 == 23)
  {
    int v5 = @"pre-personalized";
  }
  v37 = v5;
  int activationState = self->_activationState;
  if (activationState == 128)
  {
    v7 = @"non-activatable";
  }
  else if (activationState == 1)
  {
    v7 = @"activated";
  }
  else if (self->_activationState)
  {
    v7 = @"UNKNOWN";
  }
  else
  {
    v7 = @"deactivated";
  }
  v36 = v7;
  id v35 = objc_alloc(MEMORY[0x1E4F1CA60]);
  uint64_t v8 = [(NSData *)self->_identifierAsData NF_asHexString];
  seIdentifier = self->_seIdentifier;
  v34 = (void *)v8;
  v32 = [NSNumber numberWithUnsignedChar:self->_family];
  v9 = [NSNumber numberWithUnsignedChar:self->_appletGPState];
  uint64_t v10 = [NSNumber numberWithUnsignedChar:self->_activationState];
  if (self->_authTransientSupport) {
    uint64_t v11 = @"YES";
  }
  else {
    uint64_t v11 = @"NO";
  }
  if (self->_authTransientConfigurable) {
    id v12 = @"YES";
  }
  else {
    id v12 = @"NO";
  }
  if (self->_isContainer) {
    id v13 = @"YES";
  }
  else {
    id v13 = @"NO";
  }
  if (self->_isProxy) {
    id v14 = @"YES";
  }
  else {
    id v14 = @"NO";
  }
  long long v15 = [NSNumber numberWithUnsignedChar:self->_groupActivationStyle];
  long long v16 = [NSNumber numberWithInteger:self->_seOS];
  id v17 = [NSNumber numberWithBool:self->_managedBySP];
  id v18 = objc_msgSend(v35, "initWithObjectsAndKeys:", v34, @"identifier", seIdentifier, @"seid", v32, @"family", v38, @"familyStr", v9, @"lifecycleState", v37, @"lifecycleStr", v10, @"activationState", v36, @"activationStr", v11,
                  @"authTransientSupport",
                  v12,
                  @"authTransientConfigurable",
                  v13,
                  @"containerInstance",
                  v14,
                  @"proxyInstance",
                  v15,
                  @"groupActivationStyle",
                  v16,
                  @"seOS",
                  v17,
                  @"managedBySP",
                  0);

  groupHeadIDAsData = self->_groupHeadIDAsData;
  if (groupHeadIDAsData)
  {
    long long v20 = [(NSData *)groupHeadIDAsData NF_asHexString];
    [v18 setObject:v20 forKey:@"groupHead"];
  }
  groupMemberIDs = self->_groupMemberIDs;
  if (groupMemberIDs) {
    [v18 setObject:groupMemberIDs forKey:@"groupMembers"];
  }
  referencedAppIDs = self->_referencedAppIDs;
  if (referencedAppIDs) {
    [v18 setObject:referencedAppIDs forKey:@"referencedApps"];
  }
  packageIdentifierAsData = self->_packageIdentifierAsData;
  if (packageIdentifierAsData)
  {
    uint64_t v24 = [(NSData *)packageIdentifierAsData NF_asHexString];
    [v18 setObject:v24 forKey:@"packageIdentifier"];
  }
  moduleIdentifierAsData = self->_moduleIdentifierAsData;
  if (moduleIdentifierAsData)
  {
    v26 = [(NSData *)moduleIdentifierAsData NF_asHexString];
    [v18 setObject:v26 forKey:@"moduleIdentifier"];
  }
  discretionaryData = self->_discretionaryData;
  if (discretionaryData) {
    [v18 setObject:discretionaryData forKey:@"discretionary"];
  }
  multiSEApplicationGroupMemberIDs = self->_multiSEApplicationGroupMemberIDs;
  if (multiSEApplicationGroupMemberIDs) {
    [v18 setObject:multiSEApplicationGroupMemberIDs forKey:@"multiSEApplicationGroup"];
  }
  typeFSystemCode = self->_typeFSystemCode;
  if (typeFSystemCode) {
    [v18 setObject:typeFSystemCode forKey:@"typeFSystemCode"];
  }
  instanceACL = self->_instanceACL;
  if (instanceACL) {
    [v18 setObject:instanceACL forKey:@"instanceACL"];
  }
  return v18;
}

- (BOOL)isEqual:(id)a3
{
  int v4 = (NFApplet *)a3;
  int v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(NFApplet *)self isEqualToApplet:v5];

  return v6;
}

- (BOOL)isEqualToApplet:(id)a3
{
  int v4 = (NFApplet *)a3;
  if (v4 == self)
  {
    BOOL v8 = 1;
  }
  else
  {
    int v5 = [(NFApplet *)self identifierAsData];
    BOOL v6 = [(NFApplet *)v4 identifierAsData];
    if ([v5 isEqualToData:v6])
    {
      int64_t v7 = [(NFApplet *)self seOS];
      BOOL v8 = v7 == [(NFApplet *)v4 seOS];
    }
    else
    {
      BOOL v8 = 0;
    }
  }
  return v8;
}

- (BOOL)isTypeF
{
  return [(NSData *)self->_typeFSystemCode length] != 0;
}

- (BOOL)suppressTypeB
{
  moduleIdentifierAsData = self->_moduleIdentifierAsData;
  int v4 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:&MID_MIFARE_MCM length:16];
  if ([(NSData *)moduleIdentifierAsData isEqualToData:v4])
  {
    char v5 = 1;
  }
  else
  {
    BOOL v6 = self->_moduleIdentifierAsData;
    int64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:&MID_DREAMWORKS length:10];
    char v5 = [(NSData *)v6 isEqualToData:v7];
  }
  return v5;
}

- (BOOL)suppressTypeA
{
  moduleIdentifierAsData = self->_moduleIdentifierAsData;
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:&MID_JPKI length:10];
  LOBYTE(moduleIdentifierAsData) = [(NSData *)moduleIdentifierAsData isEqualToData:v3];

  return (char)moduleIdentifierAsData;
}

- (unsigned)supportedTypeFSystem
{
  if ([(NSData *)self->_typeFSystemCode length] != 2) {
    return 0;
  }
  if (*(_WORD *)[(NSData *)self->_typeFSystemCode bytes] == 768) {
    return 1;
  }
  if (*(_WORD *)[(NSData *)self->_typeFSystemCode bytes] != 2176) {
    return 0;
  }
  return 2;
}

- (void)setInstanceACL:(id)a3
{
}

- (NFApplet)initWithCoder:(id)a3
{
  id v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)NFApplet;
  char v5 = [(NFApplet *)&v29 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"seid"];
    seIdentifier = v5->_seIdentifier;
    v5->_seIdentifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    identifierAsData = v5->_identifierAsData;
    v5->_identifierAsData = (NSData *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"discretionary"];
    discretionaryData = v5->_discretionaryData;
    v5->_discretionaryData = (NSData *)v10;

    v5->_uint64_t family = [v4 decodeInt32ForKey:@"family"];
    v5->_uint64_t appletGPState = [v4 decodeInt32ForKey:@"lifecycleState"];
    v5->_int activationState = [v4 decodeInt32ForKey:@"activationState"];
    v5->_authTransientSupport = [v4 decodeBoolForKey:@"authTransientSupport"];
    v5->_authTransientConfigurable = [v4 decodeBoolForKey:@"authTransientConfigurable"];
    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"groupHead"];
    groupHeadIDAsData = v5->_groupHeadIDAsData;
    v5->_groupHeadIDAsData = (NSData *)v12;

    uint64_t v14 = [MEMORY[0x1E4FBA858] coder:v4 decodeArrayOfClass:objc_opt_class() forKey:@"groupMembers"];
    groupMemberIDs = v5->_groupMemberIDs;
    v5->_groupMemberIDs = (NSArray *)v14;

    uint64_t v16 = [MEMORY[0x1E4FBA858] coder:v4 decodeArrayOfClass:objc_opt_class() forKey:@"referencedApps"];
    referencedAppIDs = v5->_referencedAppIDs;
    v5->_referencedAppIDs = (NSArray *)v16;

    v5->_isContainer = [v4 decodeBoolForKey:@"containerInstance"];
    v5->_isProxy = [v4 decodeBoolForKey:@"proxyInstance"];
    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"packageIdentifier"];
    packageIdentifierAsData = v5->_packageIdentifierAsData;
    v5->_packageIdentifierAsData = (NSData *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"moduleIdentifier"];
    moduleIdentifierAsData = v5->_moduleIdentifierAsData;
    v5->_moduleIdentifierAsData = (NSData *)v20;

    v5->_uint64_t groupActivationStyle = [v4 decodeInt32ForKey:@"groupActivationStyle"];
    uint64_t v22 = [MEMORY[0x1E4FBA858] coder:v4 decodeArrayOfClass:objc_opt_class() forKey:@"multiSEApplicationGroup"];
    multiSEApplicationGroupMemberIDs = v5->_multiSEApplicationGroupMemberIDs;
    v5->_multiSEApplicationGroupMemberIDs = (NSArray *)v22;

    uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"typeFSystemCode"];
    typeFSystemCode = v5->_typeFSystemCode;
    v5->_typeFSystemCode = (NSData *)v24;

    v5->_seOS = [v4 decodeIntegerForKey:@"seOS"];
    uint64_t v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"instanceACL"];
    instanceACL = v5->_instanceACL;
    v5->_instanceACL = (NSData *)v26;

    [(NFApplet *)v5 _initManagedBySP];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  seIdentifier = self->_seIdentifier;
  id v5 = a3;
  [v5 encodeObject:seIdentifier forKey:@"seid"];
  [v5 encodeObject:self->_identifierAsData forKey:@"identifier"];
  [v5 encodeObject:self->_discretionaryData forKey:@"discretionary"];
  [v5 encodeInt32:self->_family forKey:@"family"];
  [v5 encodeInt32:self->_appletGPState forKey:@"lifecycleState"];
  [v5 encodeInt32:self->_activationState forKey:@"activationState"];
  [v5 encodeBool:self->_authTransientSupport forKey:@"authTransientSupport"];
  [v5 encodeBool:self->_authTransientConfigurable forKey:@"authTransientConfigurable"];
  [v5 encodeObject:self->_groupHeadIDAsData forKey:@"groupHead"];
  [v5 encodeObject:self->_groupMemberIDs forKey:@"groupMembers"];
  [v5 encodeObject:self->_referencedAppIDs forKey:@"referencedApps"];
  [v5 encodeBool:self->_isContainer forKey:@"containerInstance"];
  [v5 encodeBool:self->_isProxy forKey:@"proxyInstance"];
  [v5 encodeObject:self->_packageIdentifierAsData forKey:@"packageIdentifier"];
  [v5 encodeObject:self->_moduleIdentifierAsData forKey:@"moduleIdentifier"];
  [v5 encodeInt32:self->_groupActivationStyle forKey:@"groupActivationStyle"];
  [v5 encodeObject:self->_multiSEApplicationGroupMemberIDs forKey:@"multiSEApplicationGroup"];
  [v5 encodeObject:self->_typeFSystemCode forKey:@"typeFSystemCode"];
  [v5 encodeInteger:self->_seOS forKey:@"seOS"];
  [v5 encodeObject:self->_instanceACL forKey:@"instanceACL"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_alloc_init((Class)objc_opt_class());
  if (v5)
  {
    uint64_t v6 = [(NSString *)self->_seIdentifier copyWithZone:a3];
    int64_t v7 = (void *)*((void *)v5 + 11);
    *((void *)v5 + 11) = v6;

    uint64_t v8 = [(NSData *)self->_identifierAsData copyWithZone:a3];
    v9 = (void *)*((void *)v5 + 12);
    *((void *)v5 + 12) = v8;

    uint64_t v10 = [(NSData *)self->_discretionaryData copyWithZone:a3];
    uint64_t v11 = (void *)*((void *)v5 + 13);
    *((void *)v5 + 13) = v10;

    *((unsigned char *)v5 + 76) = self->_family;
    *((unsigned char *)v5 + 75) = self->_appletGPState;
    *((unsigned char *)v5 + 77) = self->_activationState;
    *((unsigned char *)v5 + 78) = self->_authTransientSupport;
    *((unsigned char *)v5 + 79) = self->_authTransientConfigurable;
    uint64_t v12 = [(NSData *)self->_groupHeadIDAsData copyWithZone:a3];
    id v13 = (void *)*((void *)v5 + 2);
    *((void *)v5 + 2) = v12;

    uint64_t v14 = [(NSArray *)self->_groupMemberIDs copyWithZone:a3];
    long long v15 = (void *)*((void *)v5 + 3);
    *((void *)v5 + 3) = v14;

    uint64_t v16 = [(NSArray *)self->_referencedAppIDs copyWithZone:a3];
    id v17 = (void *)*((void *)v5 + 4);
    *((void *)v5 + 4) = v16;

    *((unsigned char *)v5 + 73) = self->_isContainer;
    *((unsigned char *)v5 + 74) = self->_isProxy;
    uint64_t v18 = [(NSData *)self->_packageIdentifierAsData copyWithZone:a3];
    long long v19 = (void *)*((void *)v5 + 5);
    *((void *)v5 + 5) = v18;

    uint64_t v20 = [(NSData *)self->_moduleIdentifierAsData copyWithZone:a3];
    long long v21 = (void *)*((void *)v5 + 6);
    *((void *)v5 + 6) = v20;

    *((unsigned char *)v5 + 72) = self->_groupActivationStyle;
    uint64_t v22 = [(NSArray *)self->_multiSEApplicationGroupMemberIDs copyWithZone:a3];
    id v23 = (void *)*((void *)v5 + 7);
    *((void *)v5 + 7) = v22;

    uint64_t v24 = [(NSData *)self->_typeFSystemCode copyWithZone:a3];
    NSUInteger v25 = (void *)*((void *)v5 + 8);
    *((void *)v5 + 8) = v24;

    *((unsigned char *)v5 + 80) = self->_managedBySP;
    objc_storeStrong((id *)v5 + 15, self->_instanceACL);
  }
  return v5;
}

- (NSArray)groupMemberIDs
{
  return self->_groupMemberIDs;
}

- (NSArray)multiSEGroupMemberIDs
{
  return self->_multiSEApplicationGroupMemberIDs;
}

- (NSString)groupHeadID
{
  return (NSString *)[(NSData *)self->_groupHeadIDAsData NF_asHexString];
}

- (BOOL)isContainer
{
  return self->_isContainer;
}

- (BOOL)isProxy
{
  return self->_isProxy;
}

- (NSString)identifier
{
  return (NSString *)[(NSData *)self->_identifierAsData NF_asHexString];
}

- (NSString)packageIdentifier
{
  return (NSString *)[(NSData *)self->_packageIdentifierAsData NF_asHexString];
}

- (NSString)moduleIdentifier
{
  return (NSString *)[(NSData *)self->_moduleIdentifierAsData NF_asHexString];
}

- (unsigned)groupActivationStyle
{
  return self->_groupActivationStyle;
}

- (NFAppletCollection)appletCollection
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_appletCollection);
  return (NFAppletCollection *)WeakRetained;
}

- (void)setAppletCollection:(id)a3
{
}

- (NFApplet)groupHead
{
  p_appletCollection = &self->_appletCollection;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_appletCollection);

  if (!WeakRetained)
  {
    uint64_t v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"NFApplet.m", 446, @"Invalid parameter not satisfying: %@", @"_appletCollection!=nil" object file lineNumber description];
  }
  if (self->_groupHeadIDAsData)
  {
    id v6 = objc_loadWeakRetained((id *)p_appletCollection);
    int64_t v7 = [(NSData *)self->_groupHeadIDAsData NF_asHexString];
    uint64_t v8 = [v6 appletWithIdentifier:v7];
  }
  else
  {
    uint64_t v8 = 0;
  }
  return (NFApplet *)v8;
}

- (NSArray)groupMembers
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  p_appletCollection = &self->_appletCollection;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_appletCollection);

  if (!WeakRetained)
  {
    uint64_t v24 = [MEMORY[0x1E4F28B00] currentHandler];
    [v24 handleFailureInMethod:a2, self, @"NFApplet.m", 453, @"Invalid parameter not satisfying: %@", @"_appletCollection!=nil" object file lineNumber description];
  }
  if (self->_groupMemberIDs)
  {
    id v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSArray count](self->_groupMemberIDs, "count"));
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    obuint64_t j = self->_groupMemberIDs;
    uint64_t v6 = [(NSArray *)obj countByEnumeratingWithState:&v29 objects:v43 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v30;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v30 != v8) {
            objc_enumerationMutation(obj);
          }
          uint64_t v10 = *(void *)(*((void *)&v29 + 1) + 8 * i);
          id v11 = objc_loadWeakRetained((id *)p_appletCollection);
          uint64_t v12 = [v11 appletWithIdentifier:v10];

          if (v10)
          {
            [v5 addObject:v12];
          }
          else
          {
            dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
            uint64_t Logger = NFLogGetLogger();
            if (Logger)
            {
              uint64_t v14 = (void (*)(uint64_t, const char *, ...))Logger;
              Class = object_getClass(self);
              BOOL isMetaClass = class_isMetaClass(Class);
              ClassName = object_getClassName(self);
              Name = sel_getName(a2);
              uint64_t v17 = 45;
              if (isMetaClass) {
                uint64_t v17 = 43;
              }
              v14(5, "%c[%{public}s %{public}s]:%i No applet for %{public}@", v17, ClassName, Name, 461, 0);
            }
            dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
            uint64_t v18 = NFSharedLogGetLogger();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
            {
              long long v19 = object_getClass(self);
              if (class_isMetaClass(v19)) {
                int v20 = 43;
              }
              else {
                int v20 = 45;
              }
              long long v21 = object_getClassName(self);
              uint64_t v22 = sel_getName(a2);
              *(_DWORD *)buf = 67110146;
              int v34 = v20;
              __int16 v35 = 2082;
              v36 = v21;
              __int16 v37 = 2082;
              v38 = v22;
              __int16 v39 = 1024;
              int v40 = 461;
              __int16 v41 = 2114;
              uint64_t v42 = 0;
              _os_log_impl(&dword_19D636000, v18, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i No applet for %{public}@", buf, 0x2Cu);
            }
          }
        }
        uint64_t v7 = [(NSArray *)obj countByEnumeratingWithState:&v29 objects:v43 count:16];
      }
      while (v7);
    }
  }
  else
  {
    id v5 = 0;
  }
  return (NSArray *)v5;
}

- (NSArray)referencedApps
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  p_appletCollection = &self->_appletCollection;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_appletCollection);

  if (!WeakRetained)
  {
    uint64_t v24 = [MEMORY[0x1E4F28B00] currentHandler];
    [v24 handleFailureInMethod:a2, self, @"NFApplet.m", 472, @"Invalid parameter not satisfying: %@", @"_appletCollection!=nil" object file lineNumber description];
  }
  if (self->_referencedAppIDs)
  {
    id v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSArray count](self->_referencedAppIDs, "count"));
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    obuint64_t j = self->_referencedAppIDs;
    uint64_t v6 = [(NSArray *)obj countByEnumeratingWithState:&v29 objects:v43 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v30;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v30 != v8) {
            objc_enumerationMutation(obj);
          }
          uint64_t v10 = *(void *)(*((void *)&v29 + 1) + 8 * i);
          id v11 = objc_loadWeakRetained((id *)p_appletCollection);
          uint64_t v12 = [v11 appletWithIdentifier:v10];

          if (v10)
          {
            [v5 addObject:v12];
          }
          else
          {
            dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
            uint64_t Logger = NFLogGetLogger();
            if (Logger)
            {
              uint64_t v14 = (void (*)(uint64_t, const char *, ...))Logger;
              Class = object_getClass(self);
              BOOL isMetaClass = class_isMetaClass(Class);
              ClassName = object_getClassName(self);
              Name = sel_getName(a2);
              uint64_t v17 = 45;
              if (isMetaClass) {
                uint64_t v17 = 43;
              }
              v14(5, "%c[%{public}s %{public}s]:%i No applet for %{public}@", v17, ClassName, Name, 480, 0);
            }
            dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
            uint64_t v18 = NFSharedLogGetLogger();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
            {
              long long v19 = object_getClass(self);
              if (class_isMetaClass(v19)) {
                int v20 = 43;
              }
              else {
                int v20 = 45;
              }
              long long v21 = object_getClassName(self);
              uint64_t v22 = sel_getName(a2);
              *(_DWORD *)buf = 67110146;
              int v34 = v20;
              __int16 v35 = 2082;
              v36 = v21;
              __int16 v37 = 2082;
              v38 = v22;
              __int16 v39 = 1024;
              int v40 = 480;
              __int16 v41 = 2114;
              uint64_t v42 = 0;
              _os_log_impl(&dword_19D636000, v18, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i No applet for %{public}@", buf, 0x2Cu);
            }
          }
        }
        uint64_t v7 = [(NSArray *)obj countByEnumeratingWithState:&v29 objects:v43 count:16];
      }
      while (v7);
    }
  }
  else
  {
    id v5 = 0;
  }
  return (NSArray *)v5;
}

- (id)multiSSDMembers
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  p_appletCollection = &self->_appletCollection;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_appletCollection);

  if (!WeakRetained)
  {
    uint64_t v24 = [MEMORY[0x1E4F28B00] currentHandler];
    [v24 handleFailureInMethod:a2, self, @"NFApplet.m", 491, @"Invalid parameter not satisfying: %@", @"_appletCollection!=nil" object file lineNumber description];
  }
  if (self->_multiSEApplicationGroupMemberIDs)
  {
    id v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSArray count](self->_multiSEApplicationGroupMemberIDs, "count"));
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    obuint64_t j = self->_multiSEApplicationGroupMemberIDs;
    uint64_t v6 = [(NSArray *)obj countByEnumeratingWithState:&v29 objects:v43 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v30;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v30 != v8) {
            objc_enumerationMutation(obj);
          }
          uint64_t v10 = *(void *)(*((void *)&v29 + 1) + 8 * i);
          id v11 = objc_loadWeakRetained((id *)p_appletCollection);
          uint64_t v12 = [v11 appletWithIdentifier:v10];

          if (v10)
          {
            [v5 addObject:v12];
          }
          else
          {
            dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
            uint64_t Logger = NFLogGetLogger();
            if (Logger)
            {
              uint64_t v14 = (void (*)(uint64_t, const char *, ...))Logger;
              Class = object_getClass(self);
              BOOL isMetaClass = class_isMetaClass(Class);
              ClassName = object_getClassName(self);
              Name = sel_getName(a2);
              uint64_t v17 = 45;
              if (isMetaClass) {
                uint64_t v17 = 43;
              }
              v14(5, "%c[%{public}s %{public}s]:%i No applet for %{public}@", v17, ClassName, Name, 499, 0);
            }
            dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
            uint64_t v18 = NFSharedLogGetLogger();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
            {
              long long v19 = object_getClass(self);
              if (class_isMetaClass(v19)) {
                int v20 = 43;
              }
              else {
                int v20 = 45;
              }
              long long v21 = object_getClassName(self);
              uint64_t v22 = sel_getName(a2);
              *(_DWORD *)buf = 67110146;
              int v34 = v20;
              __int16 v35 = 2082;
              v36 = v21;
              __int16 v37 = 2082;
              v38 = v22;
              __int16 v39 = 1024;
              int v40 = 499;
              __int16 v41 = 2114;
              uint64_t v42 = 0;
              _os_log_impl(&dword_19D636000, v18, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i No applet for %{public}@", buf, 0x2Cu);
            }
          }
        }
        uint64_t v7 = [(NSArray *)obj countByEnumeratingWithState:&v29 objects:v43 count:16];
      }
      while (v7);
    }
  }
  else
  {
    id v5 = 0;
  }
  return v5;
}

- (BOOL)isGPLocked
{
  int appletGPState = (char)self->_appletGPState;
  return appletGPState < 0 && (appletGPState + 125) < 0xFEu;
}

- (BOOL)containsSubKeys
{
  v3 = [(NFApplet *)self identifierAsData];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:&AID_PURPLE_TRUST_AIR_CCC_0 length:13];
  if ([v3 isEqualToData:v4])
  {
    char v5 = 1;
  }
  else
  {
    uint64_t v6 = [(NFApplet *)self identifierAsData];
    uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:&AID_PURPLE_TRUST_AIR_HOME length:12];
    if ([v6 isEqualToData:v7])
    {
      char v5 = 1;
    }
    else
    {
      uint64_t v8 = [(NFApplet *)self identifierAsData];
      v9 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:&AID_PURPLE_TRUST_AIR_HYDRA length:12];
      if ([v8 isEqualToData:v9])
      {
        char v5 = 1;
      }
      else
      {
        uint64_t v10 = [(NFApplet *)self identifierAsData];
        id v11 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:&AID_LYON length:9];
        char v5 = [v10 isEqualToData:v11];
      }
    }
  }
  return v5;
}

- (unsigned)lifecycleState
{
  int appletGPState = self->_appletGPState;
  if (appletGPState != 129 && appletGPState != 130)
  {
    HIDWORD(v4) = (appletGPState & 0x7F) - 1;
    LODWORD(v4) = HIDWORD(v4);
    unsigned int v3 = v4 >> 1;
    if (v3 > 0xB) {
      LOBYTE(appletGPState) = 0;
    }
    else {
      LOBYTE(appletGPState) = byte_19D6E62E0[v3];
    }
  }
  return appletGPState;
}

- (unint64_t)rawGPState
{
  return self->_appletGPState;
}

- (NSString)seIdentifier
{
  return self->_seIdentifier;
}

- (NSData)identifierAsData
{
  return self->_identifierAsData;
}

- (NSData)discretionaryData
{
  return self->_discretionaryData;
}

- (unsigned)family
{
  return self->_family;
}

- (unsigned)activationState
{
  return self->_activationState;
}

- (int64_t)seOS
{
  return self->_seOS;
}

- (BOOL)authTransientSupport
{
  return self->_authTransientSupport;
}

- (BOOL)authTransientConfigurable
{
  return self->_authTransientConfigurable;
}

- (BOOL)managedBySP
{
  return self->_managedBySP;
}

- (NSData)instanceACL
{
  return self->_instanceACL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_instanceACL, 0);
  objc_storeStrong((id *)&self->_discretionaryData, 0);
  objc_storeStrong((id *)&self->_identifierAsData, 0);
  objc_storeStrong((id *)&self->_seIdentifier, 0);
  objc_storeStrong((id *)&self->_typeFSystemCode, 0);
  objc_storeStrong((id *)&self->_multiSEApplicationGroupMemberIDs, 0);
  objc_storeStrong((id *)&self->_moduleIdentifierAsData, 0);
  objc_storeStrong((id *)&self->_packageIdentifierAsData, 0);
  objc_storeStrong((id *)&self->_referencedAppIDs, 0);
  objc_storeStrong((id *)&self->_groupMemberIDs, 0);
  objc_storeStrong((id *)&self->_groupHeadIDAsData, 0);
  objc_destroyWeak((id *)&self->_appletCollection);
}

- (NFApplet)initWithDictionary:(id)a3
{
  id v4 = a3;
  v46.receiver = self;
  v46.super_class = (Class)NFApplet;
  char v5 = [(NFApplet *)&v46 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKey:@"identifier"];
    if (!v6) {
      goto LABEL_8;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v7 = objc_msgSend(MEMORY[0x1E4F1C9B8], "NF_dataWithHexString:", v6);
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_8;
      }
      uint64_t v7 = [v6 copy];
    }
    identifierAsData = v5->_identifierAsData;
    v5->_identifierAsData = (NSData *)v7;

LABEL_8:
    uint64_t v9 = [v4 objectForKeyedSubscript:@"seid"];
    seIdentifier = v5->_seIdentifier;
    v5->_seIdentifier = (NSString *)v9;

    uint64_t v11 = [v4 objectForKeyedSubscript:@"discretionary"];
    discretionaryData = v5->_discretionaryData;
    v5->_discretionaryData = (NSData *)v11;

    id v13 = [v4 objectForKeyedSubscript:@"family"];
    v5->_uint64_t family = [v13 intValue];

    uint64_t v14 = [v4 objectForKeyedSubscript:@"lifecycleState"];
    v5->_int appletGPState = [v14 unsignedCharValue];

    long long v15 = [v4 objectForKeyedSubscript:@"activationState"];
    v5->_int activationState = [v15 intValue];

    uint64_t v16 = [v4 objectForKeyedSubscript:@"authTransientSupport"];
    v5->_authTransientSupport = [v16 BOOLValue];

    uint64_t v17 = [v4 objectForKeyedSubscript:@"authTransientConfigurable"];
    v5->_authTransientConfigurable = [v17 BOOLValue];

    uint64_t v18 = [v4 objectForKey:@"groupHead"];

    if (!v18) {
      goto LABEL_14;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v19 = objc_msgSend(MEMORY[0x1E4F1C9B8], "NF_dataWithHexString:", v18);
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_14;
      }
      uint64_t v19 = [v18 copy];
    }
    groupHeadIDAsData = v5->_groupHeadIDAsData;
    v5->_groupHeadIDAsData = (NSData *)v19;

LABEL_14:
    long long v21 = [v4 objectForKeyedSubscript:@"groupMembers"];
    uint64_t v22 = [v21 copy];
    groupMemberIDs = v5->_groupMemberIDs;
    v5->_groupMemberIDs = (NSArray *)v22;

    uint64_t v24 = [v4 objectForKeyedSubscript:@"referencedApps"];
    uint64_t v25 = [v24 copy];
    referencedAppIDs = v5->_referencedAppIDs;
    v5->_referencedAppIDs = (NSArray *)v25;

    v27 = [v4 objectForKeyedSubscript:@"containerInstance"];
    v5->_isContainer = [v27 BOOLValue];

    v28 = [v4 objectForKeyedSubscript:@"proxyInstance"];
    v5->_isProxy = [v28 BOOLValue];

    long long v29 = [v4 objectForKey:@"packageIdentifier"];

    if (!v29) {
      goto LABEL_20;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v30 = objc_msgSend(MEMORY[0x1E4F1C9B8], "NF_dataWithHexString:", v29);
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_20;
      }
      uint64_t v30 = [v29 copy];
    }
    packageIdentifierAsData = v5->_packageIdentifierAsData;
    v5->_packageIdentifierAsData = (NSData *)v30;

LABEL_20:
    long long v32 = [v4 objectForKey:@"moduleIdentifier"];

    if (v32)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v33 = objc_msgSend(MEMORY[0x1E4F1C9B8], "NF_dataWithHexString:", v32);
LABEL_25:
        moduleIdentifierAsData = v5->_moduleIdentifierAsData;
        v5->_moduleIdentifierAsData = (NSData *)v33;

        goto LABEL_26;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v33 = [v32 copy];
        goto LABEL_25;
      }
    }
LABEL_26:
    __int16 v35 = [v4 objectForKeyedSubscript:@"groupActivationStyle"];
    v5->_uint64_t groupActivationStyle = [v35 intValue];

    v36 = [v4 objectForKeyedSubscript:@"multiSEApplicationGroup"];
    uint64_t v37 = [v36 copy];
    multiSEApplicationGroupMemberIDs = v5->_multiSEApplicationGroupMemberIDs;
    v5->_multiSEApplicationGroupMemberIDs = (NSArray *)v37;

    __int16 v39 = [v4 objectForKeyedSubscript:@"typeFSystemCode"];
    uint64_t v40 = [v39 copy];
    typeFSystemCode = v5->_typeFSystemCode;
    v5->_typeFSystemCode = (NSData *)v40;

    uint64_t v42 = [v4 objectForKeyedSubscript:@"seOS"];
    v5->_seOS = [v42 unsignedIntegerValue];

    uint64_t v43 = [v4 objectForKeyedSubscript:@"instanceACL"];
    instanceACL = v5->_instanceACL;
    v5->_instanceACL = (NSData *)v43;

    [(NFApplet *)v5 _initManagedBySP];
  }

  return v5;
}

- (void)_setIsActive:(BOOL)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (self->_activationState == 128)
  {
    char v5 = (const void **)MEMORY[0x1E4FBA898];
    dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      uint64_t v7 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      uint64_t v11 = 45;
      if (isMetaClass) {
        uint64_t v11 = 43;
      }
      v7(4, "%c[%{public}s %{public}s]:%i Applet is non-activatable", v11, ClassName, Name, 625);
    }
    dispatch_get_specific(*v5);
    uint64_t v12 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      id v13 = object_getClass(self);
      if (class_isMetaClass(v13)) {
        int v14 = 43;
      }
      else {
        int v14 = 45;
      }
      *(_DWORD *)buf = 67109890;
      int v17 = v14;
      __int16 v18 = 2082;
      uint64_t v19 = object_getClassName(self);
      __int16 v20 = 2082;
      long long v21 = sel_getName(a2);
      __int16 v22 = 1024;
      int v23 = 625;
      _os_log_impl(&dword_19D636000, v12, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Applet is non-activatable", buf, 0x22u);
    }
  }
  else
  {
    self->_int activationState = a3;
  }
}

+ (id)aidListForPrinting:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_opt_new();
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v11 = [v10 identifier];
          [v4 addObject:v11];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  uint64_t v12 = (void *)[[NSString alloc] initWithFormat:@"%@", v4];
  return v12;
}

- (BOOL)isPPSEControllable
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v2 = self->_referencedAppIDs;
  uint64_t v3 = [(NSArray *)v2 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v15 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v8 = objc_alloc(MEMORY[0x1E4F1C9B8]);
          uint64_t v9 = objc_msgSend(v8, "initWithBytes:length:", &NF_PPSE_APPLET_IDENTIFIER, 14, (void)v14);
          uint64_t v10 = objc_msgSend(v9, "NF_asHexString");
          uint64_t v11 = [v7 caseInsensitiveCompare:v10];

          if (!v11)
          {
            BOOL v12 = 1;
            goto LABEL_12;
          }
        }
      }
      uint64_t v4 = [(NSArray *)v2 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  BOOL v12 = 0;
LABEL_12:

  return v12;
}

@end