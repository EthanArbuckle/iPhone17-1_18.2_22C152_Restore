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
  self->_managedBySP = 0;
  if ([(NSData *)self->_discretionaryData length])
  {
    v3 = +[NFTLV TLVsWithData:self->_discretionaryData];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v4 = [v3 countByEnumeratingWithState:&v18 objects:v23 count:16];
    if (v4)
    {
      id v5 = v4;
      uint64_t v6 = *(void *)v19;
      do
      {
        for (i = 0; i != v5; i = (char *)i + 1)
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
            v9 = [v8 children];
            id v10 = [v9 countByEnumeratingWithState:&v14 objects:v22 count:16];
            if (v10)
            {
              id v11 = v10;
              uint64_t v12 = *(void *)v15;
              while (2)
              {
                for (j = 0; j != v11; j = (char *)j + 1)
                {
                  if (*(void *)v15 != v12) {
                    objc_enumerationMutation(v9);
                  }
                  if ([*(id *)(*((void *)&v14 + 1) + 8 * (void)j) tag] == 57154)
                  {
                    self->_managedBySP = 1;
                    goto LABEL_18;
                  }
                }
                id v11 = [v9 countByEnumeratingWithState:&v14 objects:v22 count:16];
                if (v11) {
                  continue;
                }
                break;
              }
            }
LABEL_18:
          }
        }
        id v5 = [v3 countByEnumeratingWithState:&v18 objects:v23 count:16];
      }
      while (v5);
    }
  }
}

- (id)description
{
  if ((self->_family - 1) > 7u) {
    CFStringRef v4 = @"UNKNOWN";
  }
  else {
    CFStringRef v4 = *(&off_1003015F8 + (char)(self->_family - 1));
  }
  CFStringRef v53 = v4;
  int v5 = [(NFApplet *)self lifecycleState];
  CFStringRef v6 = @"UNKNOWN";
  if (v5 <= 14)
  {
    switch(v5)
    {
      case 1:
        CFStringRef v6 = @"loaded";
        break;
      case 3:
        CFStringRef v6 = @"installed";
        break;
      case 7:
        CFStringRef v6 = @"selectable";
        break;
    }
  }
  else if (v5 > 128)
  {
    if (v5 == 129)
    {
      CFStringRef v6 = @"terminated";
    }
    else if (v5 == 130)
    {
      CFStringRef v6 = @"frozen";
    }
  }
  else if (v5 == 15)
  {
    CFStringRef v6 = @"personalized";
  }
  else if (v5 == 23)
  {
    CFStringRef v6 = @"pre-personalized";
  }
  CFStringRef v52 = v6;
  int activationState = self->_activationState;
  if (activationState == 128)
  {
    CFStringRef v8 = @"non-activatable";
  }
  else if (activationState == 1)
  {
    CFStringRef v8 = @"activated";
  }
  else if (self->_activationState)
  {
    CFStringRef v8 = @"UNKNOWN";
  }
  else
  {
    CFStringRef v8 = @"deactivated";
  }
  CFStringRef v48 = v8;
  id v47 = objc_alloc((Class)NSString);
  v59.receiver = self;
  v59.super_class = (Class)NFApplet;
  v51 = [(NFApplet *)&v59 description];
  v50 = [(NSData *)self->_identifierAsData NF_asHexString];
  uint64_t family = self->_family;
  uint64_t appletGPState = self->_appletGPState;
  if ([(NFApplet *)self isGPLocked]) {
    CFStringRef v9 = @"YES";
  }
  else {
    CFStringRef v9 = @"NO";
  }
  uint64_t v42 = self->_activationState;
  CFStringRef v43 = v9;
  if (self->_authTransientSupport) {
    CFStringRef v10 = @"YES";
  }
  else {
    CFStringRef v10 = @"NO";
  }
  if (self->_authTransientConfigurable) {
    CFStringRef v11 = @"YES";
  }
  else {
    CFStringRef v11 = @"NO";
  }
  CFStringRef v40 = v11;
  CFStringRef v41 = v10;
  groupHeadIDAsData = self->_groupHeadIDAsData;
  if (groupHeadIDAsData)
  {
    id v12 = objc_alloc((Class)NSString);
    v34 = [(NSData *)self->_groupHeadIDAsData NF_asHexString];
    v58 = (__CFString *)[v12 initWithFormat:@"groupHead=%@ ", v34];
  }
  else
  {
    v58 = &stru_100309C40;
  }
  NSUInteger v46 = [(NSArray *)self->_groupMemberIDs count];
  if (v46)
  {
    id v13 = objc_alloc((Class)NSString);
    v33 = [(NSArray *)self->_groupMemberIDs componentsJoinedByString:@", "];
    v57 = (__CFString *)[v13 initWithFormat:@"groupMembers={%@} ", v33];
  }
  else
  {
    v57 = &stru_100309C40;
  }
  NSUInteger v39 = [(NSArray *)self->_referencedAppIDs count];
  if (v39)
  {
    id v14 = objc_alloc((Class)NSString);
    v32 = [(NSArray *)self->_referencedAppIDs componentsJoinedByString:@", "];
    v56 = (__CFString *)[v14 initWithFormat:@"referencedApps={%@} ", v32];
  }
  else
  {
    v56 = &stru_100309C40;
  }
  if (self->_isContainer) {
    CFStringRef v15 = @"YES";
  }
  else {
    CFStringRef v15 = @"NO";
  }
  if (self->_isProxy) {
    CFStringRef v16 = @"YES";
  }
  else {
    CFStringRef v16 = @"NO";
  }
  CFStringRef v35 = v16;
  CFStringRef v36 = v15;
  packageIdentifierAsData = self->_packageIdentifierAsData;
  if (packageIdentifierAsData)
  {
    id v17 = objc_alloc((Class)NSString);
    v31 = [(NSData *)self->_packageIdentifierAsData NF_asHexString];
    v55 = (__CFString *)[v17 initWithFormat:@"packageIdentifier=%@ ", v31];
  }
  else
  {
    v55 = &stru_100309C40;
  }
  moduleIdentifierAsData = self->_moduleIdentifierAsData;
  if (moduleIdentifierAsData)
  {
    id v18 = objc_alloc((Class)NSString);
    v30 = [(NSData *)self->_moduleIdentifierAsData NF_asHexString];
    v54 = (__CFString *)[v18 initWithFormat:@"moduleIdentifier=%@ ", v30];
  }
  else
  {
    v54 = &stru_100309C40;
  }
  uint64_t groupActivationStyle = self->_groupActivationStyle;
  discretionaryData = self->_discretionaryData;
  if (discretionaryData) {
    long long v21 = (__CFString *)[objc_alloc((Class)NSString) initWithFormat:@"discretionaryData=%@ ", self->_discretionaryData];
  }
  else {
    long long v21 = &stru_100309C40;
  }
  NSUInteger v22 = [(NSArray *)self->_multiSEApplicationGroupMemberIDs count];
  if (v22)
  {
    id v23 = objc_alloc((Class)NSString);
    v2 = [(NSArray *)self->_multiSEApplicationGroupMemberIDs componentsJoinedByString:@", "];
    v24 = (__CFString *)[v23 initWithFormat:@"multiSsdMembers={%@} ", v2];
  }
  else
  {
    v24 = &stru_100309C40;
  }
  NSUInteger v25 = [(NSData *)self->_typeFSystemCode length];
  if (v25) {
    v26 = (__CFString *)[objc_alloc((Class)NSString) initWithFormat:@"systemCode=%@ ", self->_typeFSystemCode];
  }
  else {
    v26 = &stru_100309C40;
  }
  if (self->_managedBySP) {
    CFStringRef v27 = @"managedBySP=Y";
  }
  else {
    CFStringRef v27 = &stru_100309C40;
  }
  id v28 = objc_msgSend(v47, "initWithFormat:", @"%@ { identifier=%@ family=0x%x(%@) lifecycle=0x%x(%@) locked=%@ activation=0x%x(%@) authTransient=%@ authTransientConfigurable=%@ %@%@%@isContainer=%@ isProxy=%@ %@%@activationStyle=%d %@ %@%@seOS=%lu%@instanceACL=%@}", v51, v50, family, v53, appletGPState, v52, v43, v42, v48, v41, v40, v58, v57, v56, v36, v35,
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
    CFStringRef v3 = @"UNKNOWN";
  }
  else {
    CFStringRef v3 = *(&off_1003015F8 + (char)(self->_family - 1));
  }
  CFStringRef v38 = v3;
  int v4 = [(NFApplet *)self lifecycleState];
  CFStringRef v5 = @"UNKNOWN";
  if (v4 <= 14)
  {
    switch(v4)
    {
      case 1:
        CFStringRef v5 = @"loaded";
        break;
      case 3:
        CFStringRef v5 = @"installed";
        break;
      case 7:
        CFStringRef v5 = @"selectable";
        break;
    }
  }
  else if (v4 > 128)
  {
    if (v4 == 129)
    {
      CFStringRef v5 = @"terminated";
    }
    else if (v4 == 130)
    {
      CFStringRef v5 = @"frozen";
    }
  }
  else if (v4 == 15)
  {
    CFStringRef v5 = @"personalized";
  }
  else if (v4 == 23)
  {
    CFStringRef v5 = @"pre-personalized";
  }
  CFStringRef v37 = v5;
  int activationState = self->_activationState;
  if (activationState == 128)
  {
    CFStringRef v7 = @"non-activatable";
  }
  else if (activationState == 1)
  {
    CFStringRef v7 = @"activated";
  }
  else if (self->_activationState)
  {
    CFStringRef v7 = @"UNKNOWN";
  }
  else
  {
    CFStringRef v7 = @"deactivated";
  }
  CFStringRef v36 = v7;
  id v35 = objc_alloc((Class)NSMutableDictionary);
  uint64_t v8 = [(NSData *)self->_identifierAsData NF_asHexString];
  seIdentifier = self->_seIdentifier;
  v34 = (void *)v8;
  v32 = +[NSNumber numberWithUnsignedChar:self->_family];
  CFStringRef v9 = +[NSNumber numberWithUnsignedChar:self->_appletGPState];
  CFStringRef v10 = +[NSNumber numberWithUnsignedChar:self->_activationState];
  if (self->_authTransientSupport) {
    CFStringRef v11 = @"YES";
  }
  else {
    CFStringRef v11 = @"NO";
  }
  if (self->_authTransientConfigurable) {
    CFStringRef v12 = @"YES";
  }
  else {
    CFStringRef v12 = @"NO";
  }
  if (self->_isContainer) {
    CFStringRef v13 = @"YES";
  }
  else {
    CFStringRef v13 = @"NO";
  }
  if (self->_isProxy) {
    CFStringRef v14 = @"YES";
  }
  else {
    CFStringRef v14 = @"NO";
  }
  CFStringRef v15 = +[NSNumber numberWithUnsignedChar:self->_groupActivationStyle];
  CFStringRef v16 = +[NSNumber numberWithInteger:self->_seOS];
  id v17 = +[NSNumber numberWithBool:self->_managedBySP];
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
    v24 = [(NSData *)packageIdentifierAsData NF_asHexString];
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
  CFStringRef v5 = v4;
  if (v4 == self)
  {
    BOOL v6 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    BOOL v6 = [(NFApplet *)self isEqualToApplet:v5];
  }
  else
  {
    BOOL v6 = 0;
  }

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
    CFStringRef v5 = [(NFApplet *)self identifierAsData];
    BOOL v6 = [(NFApplet *)v4 identifierAsData];
    if ([v5 isEqualToData:v6])
    {
      id v7 = [(NFApplet *)self seOS];
      BOOL v8 = v7 == (id)[(NFApplet *)v4 seOS];
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
  id v4 = [objc_alloc((Class)NSData) initWithBytes:&unk_100283568 length:16];
  if ([(NSData *)moduleIdentifierAsData isEqualToData:v4])
  {
    unsigned __int8 v5 = 1;
  }
  else
  {
    BOOL v6 = self->_moduleIdentifierAsData;
    id v7 = [objc_alloc((Class)NSData) initWithBytes:&unk_100283578 length:10];
    unsigned __int8 v5 = [(NSData *)v6 isEqualToData:v7];
  }
  return v5;
}

- (BOOL)suppressTypeA
{
  moduleIdentifierAsData = self->_moduleIdentifierAsData;
  id v3 = [objc_alloc((Class)NSData) initWithBytes:&unk_100283582 length:10];
  LOBYTE(moduleIdentifierAsData) = [(NSData *)moduleIdentifierAsData isEqualToData:v3];

  return (char)moduleIdentifierAsData;
}

- (unsigned)supportedTypeFSystem
{
  if ((id)[(NSData *)self->_typeFSystemCode length] != (id)2) {
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
  unsigned __int8 v5 = [(NFApplet *)&v29 init];
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

    uint64_t v14 = +[NFNSCheckedDecoder coder:v4 decodeArrayOfClass:objc_opt_class() forKey:@"groupMembers"];
    groupMemberIDs = v5->_groupMemberIDs;
    v5->_groupMemberIDs = (NSArray *)v14;

    uint64_t v16 = +[NFNSCheckedDecoder coder:v4 decodeArrayOfClass:objc_opt_class() forKey:@"referencedApps"];
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
    uint64_t v22 = +[NFNSCheckedDecoder coder:v4 decodeArrayOfClass:objc_opt_class() forKey:@"multiSEApplicationGroup"];
    multiSEApplicationGroupMemberIDs = v5->_multiSEApplicationGroupMemberIDs;
    v5->_multiSEApplicationGroupMemberIDs = (NSArray *)v22;

    uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"typeFSystemCode"];
    typeFSystemCode = v5->_typeFSystemCode;
    v5->_typeFSystemCode = (NSData *)v24;

    v5->_seOS = (int64_t)[v4 decodeIntegerForKey:@"seOS"];
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
    id v6 = [(NSString *)self->_seIdentifier copyWithZone:a3];
    id v7 = (void *)*((void *)v5 + 11);
    *((void *)v5 + 11) = v6;

    id v8 = [(NSData *)self->_identifierAsData copyWithZone:a3];
    CFStringRef v9 = (void *)*((void *)v5 + 12);
    *((void *)v5 + 12) = v8;

    id v10 = [(NSData *)self->_discretionaryData copyWithZone:a3];
    CFStringRef v11 = (void *)*((void *)v5 + 13);
    *((void *)v5 + 13) = v10;

    *((unsigned char *)v5 + 76) = self->_family;
    *((unsigned char *)v5 + 75) = self->_appletGPState;
    *((unsigned char *)v5 + 77) = self->_activationState;
    *((unsigned char *)v5 + 78) = self->_authTransientSupport;
    *((unsigned char *)v5 + 79) = self->_authTransientConfigurable;
    id v12 = [(NSData *)self->_groupHeadIDAsData copyWithZone:a3];
    CFStringRef v13 = (void *)*((void *)v5 + 2);
    *((void *)v5 + 2) = v12;

    id v14 = [(NSArray *)self->_groupMemberIDs copyWithZone:a3];
    CFStringRef v15 = (void *)*((void *)v5 + 3);
    *((void *)v5 + 3) = v14;

    id v16 = [(NSArray *)self->_referencedAppIDs copyWithZone:a3];
    id v17 = (void *)*((void *)v5 + 4);
    *((void *)v5 + 4) = v16;

    *((unsigned char *)v5 + 73) = self->_isContainer;
    *((unsigned char *)v5 + 74) = self->_isProxy;
    id v18 = [(NSData *)self->_packageIdentifierAsData copyWithZone:a3];
    long long v19 = (void *)*((void *)v5 + 5);
    *((void *)v5 + 5) = v18;

    id v20 = [(NSData *)self->_moduleIdentifierAsData copyWithZone:a3];
    long long v21 = (void *)*((void *)v5 + 6);
    *((void *)v5 + 6) = v20;

    *((unsigned char *)v5 + 72) = self->_groupActivationStyle;
    id v22 = [(NSArray *)self->_multiSEApplicationGroupMemberIDs copyWithZone:a3];
    id v23 = (void *)*((void *)v5 + 7);
    *((void *)v5 + 7) = v22;

    id v24 = [(NSData *)self->_typeFSystemCode copyWithZone:a3];
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
    id v10 = +[NSAssertionHandler currentHandler];
    [v10 handleFailureInMethod:a2, self, @"NFApplet.m", 446, @"Invalid parameter not satisfying: %@", @"_appletCollection!=nil" object file lineNumber description];
  }
  if (self->_groupHeadIDAsData)
  {
    id v6 = objc_loadWeakRetained((id *)p_appletCollection);
    id v7 = [(NSData *)self->_groupHeadIDAsData NF_asHexString];
    id v8 = [v6 appletWithIdentifier:v7];
  }
  else
  {
    id v8 = 0;
  }

  return (NFApplet *)v8;
}

- (NSArray)groupMembers
{
  p_appletCollection = &self->_appletCollection;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_appletCollection);

  if (!WeakRetained)
  {
    id v24 = +[NSAssertionHandler currentHandler];
    [v24 handleFailureInMethod:a2, self, @"NFApplet.m", 453, @"Invalid parameter not satisfying: %@", @"_appletCollection!=nil" object file lineNumber description];
  }
  if (self->_groupMemberIDs)
  {
    id v5 = [objc_alloc((Class)NSMutableArray) initWithCapacity:-[NSArray count](self->_groupMemberIDs, "count")];
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    obj = self->_groupMemberIDs;
    id v6 = [(NSArray *)obj countByEnumeratingWithState:&v29 objects:v43 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v30;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v30 != v8) {
            objc_enumerationMutation(obj);
          }
          uint64_t v10 = *(void *)(*((void *)&v29 + 1) + 8 * i);
          id v11 = objc_loadWeakRetained((id *)p_appletCollection);
          id v12 = [v11 appletWithIdentifier:v10];

          if (v10)
          {
            [v5 addObject:v12];
          }
          else
          {
            dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
            uint64_t Logger = NFLogGetLogger();
            if (Logger)
            {
              id v14 = (void (*)(uint64_t, const char *, ...))Logger;
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
            dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
            id v18 = NFSharedLogGetLogger();
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
              id v22 = sel_getName(a2);
              *(_DWORD *)buf = 67110146;
              int v34 = v20;
              __int16 v35 = 2082;
              CFStringRef v36 = v21;
              __int16 v37 = 2082;
              CFStringRef v38 = v22;
              __int16 v39 = 1024;
              int v40 = 461;
              __int16 v41 = 2114;
              uint64_t v42 = 0;
              _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i No applet for %{public}@", buf, 0x2Cu);
            }
          }
        }
        id v7 = [(NSArray *)obj countByEnumeratingWithState:&v29 objects:v43 count:16];
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
  p_appletCollection = &self->_appletCollection;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_appletCollection);

  if (!WeakRetained)
  {
    id v24 = +[NSAssertionHandler currentHandler];
    [v24 handleFailureInMethod:a2, self, @"NFApplet.m", 472, @"Invalid parameter not satisfying: %@", @"_appletCollection!=nil" object file lineNumber description];
  }
  if (self->_referencedAppIDs)
  {
    id v5 = [objc_alloc((Class)NSMutableArray) initWithCapacity:-[NSArray count](self->_referencedAppIDs, "count")];
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    obj = self->_referencedAppIDs;
    id v6 = [(NSArray *)obj countByEnumeratingWithState:&v29 objects:v43 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v30;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v30 != v8) {
            objc_enumerationMutation(obj);
          }
          uint64_t v10 = *(void *)(*((void *)&v29 + 1) + 8 * i);
          id v11 = objc_loadWeakRetained((id *)p_appletCollection);
          id v12 = [v11 appletWithIdentifier:v10];

          if (v10)
          {
            [v5 addObject:v12];
          }
          else
          {
            dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
            uint64_t Logger = NFLogGetLogger();
            if (Logger)
            {
              id v14 = (void (*)(uint64_t, const char *, ...))Logger;
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
            dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
            id v18 = NFSharedLogGetLogger();
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
              id v22 = sel_getName(a2);
              *(_DWORD *)buf = 67110146;
              int v34 = v20;
              __int16 v35 = 2082;
              CFStringRef v36 = v21;
              __int16 v37 = 2082;
              CFStringRef v38 = v22;
              __int16 v39 = 1024;
              int v40 = 480;
              __int16 v41 = 2114;
              uint64_t v42 = 0;
              _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i No applet for %{public}@", buf, 0x2Cu);
            }
          }
        }
        id v7 = [(NSArray *)obj countByEnumeratingWithState:&v29 objects:v43 count:16];
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
  p_appletCollection = &self->_appletCollection;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_appletCollection);

  if (!WeakRetained)
  {
    id v24 = +[NSAssertionHandler currentHandler];
    [v24 handleFailureInMethod:a2, self, @"NFApplet.m", 491, @"Invalid parameter not satisfying: %@", @"_appletCollection!=nil" object file lineNumber description];
  }
  if (self->_multiSEApplicationGroupMemberIDs)
  {
    id v5 = [objc_alloc((Class)NSMutableArray) initWithCapacity:-[NSArray count](self->_multiSEApplicationGroupMemberIDs, "count")];
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    obj = self->_multiSEApplicationGroupMemberIDs;
    id v6 = [(NSArray *)obj countByEnumeratingWithState:&v29 objects:v43 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v30;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v30 != v8) {
            objc_enumerationMutation(obj);
          }
          uint64_t v10 = *(void *)(*((void *)&v29 + 1) + 8 * i);
          id v11 = objc_loadWeakRetained((id *)p_appletCollection);
          id v12 = [v11 appletWithIdentifier:v10];

          if (v10)
          {
            [v5 addObject:v12];
          }
          else
          {
            dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
            uint64_t Logger = NFLogGetLogger();
            if (Logger)
            {
              id v14 = (void (*)(uint64_t, const char *, ...))Logger;
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
            dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
            id v18 = NFSharedLogGetLogger();
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
              id v22 = sel_getName(a2);
              *(_DWORD *)buf = 67110146;
              int v34 = v20;
              __int16 v35 = 2082;
              CFStringRef v36 = v21;
              __int16 v37 = 2082;
              CFStringRef v38 = v22;
              __int16 v39 = 1024;
              int v40 = 499;
              __int16 v41 = 2114;
              uint64_t v42 = 0;
              _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i No applet for %{public}@", buf, 0x2Cu);
            }
          }
        }
        id v7 = [(NSArray *)obj countByEnumeratingWithState:&v29 objects:v43 count:16];
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
  id v3 = [(NFApplet *)self identifierAsData];
  id v4 = [objc_alloc((Class)NSData) initWithBytes:&unk_10028358C length:13];
  if ([v3 isEqualToData:v4])
  {
    unsigned __int8 v5 = 1;
  }
  else
  {
    id v6 = [(NFApplet *)self identifierAsData];
    id v7 = [objc_alloc((Class)NSData) initWithBytes:&unk_100283599 length:12];
    if ([v6 isEqualToData:v7])
    {
      unsigned __int8 v5 = 1;
    }
    else
    {
      uint64_t v8 = [(NFApplet *)self identifierAsData];
      id v9 = [objc_alloc((Class)NSData) initWithBytes:&unk_1002835A5 length:12];
      if ([v8 isEqualToData:v9])
      {
        unsigned __int8 v5 = 1;
      }
      else
      {
        uint64_t v10 = [(NFApplet *)self identifierAsData];
        id v11 = [objc_alloc((Class)NSData) initWithBytes:&unk_1002835B1 length:9];
        unsigned __int8 v5 = [v10 isEqualToData:v11];
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
      LOBYTE(appletGPState) = byte_1002835C8[v3];
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
  unsigned __int8 v5 = [(NFApplet *)&v46 init];
  if (v5)
  {
    id v6 = [v4 objectForKey:@"identifier"];
    if (!v6) {
      goto LABEL_8;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v7 = +[NSData NF_dataWithHexString:v6];
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_8;
      }
      id v7 = (NSData *)[v6 copy];
    }
    identifierAsData = v5->_identifierAsData;
    v5->_identifierAsData = v7;

LABEL_8:
    uint64_t v9 = [v4 objectForKeyedSubscript:@"seid"];
    seIdentifier = v5->_seIdentifier;
    v5->_seIdentifier = (NSString *)v9;

    uint64_t v11 = [v4 objectForKeyedSubscript:@"discretionary"];
    discretionaryData = v5->_discretionaryData;
    v5->_discretionaryData = (NSData *)v11;

    CFStringRef v13 = [v4 objectForKeyedSubscript:@"family"];
    v5->_uint64_t family = [v13 intValue];

    id v14 = [v4 objectForKeyedSubscript:@"lifecycleState"];
    v5->_int appletGPState = [v14 unsignedCharValue];

    CFStringRef v15 = [v4 objectForKeyedSubscript:@"activationState"];
    v5->_int activationState = [v15 intValue];

    id v16 = [v4 objectForKeyedSubscript:@"authTransientSupport"];
    v5->_authTransientSupport = [v16 BOOLValue];

    uint64_t v17 = [v4 objectForKeyedSubscript:@"authTransientConfigurable"];
    v5->_authTransientConfigurable = [v17 BOOLValue];

    id v18 = [v4 objectForKey:@"groupHead"];

    if (!v18) {
      goto LABEL_14;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v19 = +[NSData NF_dataWithHexString:v18];
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_14;
      }
      long long v19 = (NSData *)[v18 copy];
    }
    groupHeadIDAsData = v5->_groupHeadIDAsData;
    v5->_groupHeadIDAsData = v19;

LABEL_14:
    long long v21 = [v4 objectForKeyedSubscript:@"groupMembers"];
    id v22 = (NSArray *)[v21 copy];
    groupMemberIDs = v5->_groupMemberIDs;
    v5->_groupMemberIDs = v22;

    id v24 = [v4 objectForKeyedSubscript:@"referencedApps"];
    NSUInteger v25 = (NSArray *)[v24 copy];
    referencedAppIDs = v5->_referencedAppIDs;
    v5->_referencedAppIDs = v25;

    CFStringRef v27 = [v4 objectForKeyedSubscript:@"containerInstance"];
    v5->_isContainer = [v27 BOOLValue];

    id v28 = [v4 objectForKeyedSubscript:@"proxyInstance"];
    v5->_isProxy = [v28 BOOLValue];

    long long v29 = [v4 objectForKey:@"packageIdentifier"];

    if (!v29) {
      goto LABEL_20;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v30 = +[NSData NF_dataWithHexString:v29];
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_20;
      }
      long long v30 = (NSData *)[v29 copy];
    }
    packageIdentifierAsData = v5->_packageIdentifierAsData;
    v5->_packageIdentifierAsData = v30;

LABEL_20:
    long long v32 = [v4 objectForKey:@"moduleIdentifier"];

    if (v32)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v33 = +[NSData NF_dataWithHexString:v32];
LABEL_25:
        moduleIdentifierAsData = v5->_moduleIdentifierAsData;
        v5->_moduleIdentifierAsData = v33;

        goto LABEL_26;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v33 = (NSData *)[v32 copy];
        goto LABEL_25;
      }
    }
LABEL_26:
    __int16 v35 = [v4 objectForKeyedSubscript:@"groupActivationStyle"];
    v5->_uint64_t groupActivationStyle = [v35 intValue];

    CFStringRef v36 = [v4 objectForKeyedSubscript:@"multiSEApplicationGroup"];
    __int16 v37 = (NSArray *)[v36 copy];
    multiSEApplicationGroupMemberIDs = v5->_multiSEApplicationGroupMemberIDs;
    v5->_multiSEApplicationGroupMemberIDs = v37;

    __int16 v39 = [v4 objectForKeyedSubscript:@"typeFSystemCode"];
    int v40 = (NSData *)[v39 copy];
    typeFSystemCode = v5->_typeFSystemCode;
    v5->_typeFSystemCode = v40;

    uint64_t v42 = [v4 objectForKeyedSubscript:@"seOS"];
    v5->_seOS = (int64_t)[v42 unsignedIntegerValue];

    uint64_t v43 = [v4 objectForKeyedSubscript:@"instanceACL"];
    instanceACL = v5->_instanceACL;
    v5->_instanceACL = (NSData *)v43;

    [(NFApplet *)v5 _initManagedBySP];
  }

  return v5;
}

- (void)_setIsActive:(BOOL)a3
{
  if (self->_activationState == 128)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      id v6 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      uint64_t v10 = 45;
      if (isMetaClass) {
        uint64_t v10 = 43;
      }
      v6(4, "%c[%{public}s %{public}s]:%i Applet is non-activatable", v10, ClassName, Name, 625);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v11 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      id v12 = object_getClass(self);
      if (class_isMetaClass(v12)) {
        int v13 = 43;
      }
      else {
        int v13 = 45;
      }
      *(_DWORD *)buf = 67109890;
      int v16 = v13;
      __int16 v17 = 2082;
      id v18 = object_getClassName(self);
      __int16 v19 = 2082;
      int v20 = sel_getName(a2);
      __int16 v21 = 1024;
      int v22 = 625;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Applet is non-activatable", buf, 0x22u);
    }
  }
  else
  {
    self->_int activationState = a3;
  }
}

+ (id)aidListForPrinting:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new();
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
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
      id v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  id v12 = [objc_alloc((Class)NSString) initWithFormat:@"%@", v4];

  return v12;
}

- (BOOL)isPPSEControllable
{
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v2 = self->_referencedAppIDs;
  id v3 = [(NSArray *)v2 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v15;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v15 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v8 = objc_alloc((Class)NSData);
          id v9 = [v8 initWithBytes:&unk_1002835BA length:14];
          uint64_t v10 = [v9 NF_asHexString];
          id v11 = [v7 caseInsensitiveCompare:v10];

          if (!v11)
          {
            BOOL v12 = 1;
            goto LABEL_12;
          }
        }
      }
      id v4 = [(NSArray *)v2 countByEnumeratingWithState:&v14 objects:v18 count:16];
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