@interface SFAirDropNode
+ (id)nodeWithSFNode:(__SFNode *)a3;
- (BOOL)isClassroom;
- (BOOL)isClassroomCourse;
- (BOOL)isDisabled;
- (BOOL)isEqual:(id)a3;
- (BOOL)isKnown;
- (BOOL)isMe;
- (BOOL)isMonogram;
- (BOOL)isRapport;
- (BOOL)isSuggestion;
- (BOOL)isUltraWideBindCapable;
- (BOOL)isUnknown;
- (BOOL)isclassroomGroup;
- (BOOL)supportsCredentials;
- (BOOL)supportsFMF;
- (BOOL)supportsMixedTypes;
- (BOOL)supportsPasses;
- (CGImage)displayIcon;
- (CNContact)contact;
- (CURangingMeasurement)rangingMeasurement;
- (NSDate)discoveryDate;
- (NSNumber)suggestionIndex;
- (NSSet)actualHandles;
- (NSSet)contactIDs;
- (NSSet)formattedHandles;
- (NSString)contactIdentifier;
- (NSString)derivedIntentIdentifier;
- (NSString)description;
- (NSString)displayName;
- (NSString)model;
- (NSString)realName;
- (NSString)secondaryName;
- (NSString)transportBundleID;
- (NSUUID)endpointUUID;
- (NSUUID)nodeIdentifier;
- (SFAirDropNode)init;
- (id)displayNameForLocale:(id)a3;
- (id)node;
- (int64_t)selectionReason;
- (unint64_t)hash;
- (void)_updateDisplayIconWithSFNode:(__SFNode *)a3;
- (void)appendDiscoveryInfoToDisplayName:(id)a3;
- (void)cancelSend;
- (void)dealloc;
- (void)handleOperationCallback:(__SFOperation *)a3 event:(int64_t)a4 withResults:(id)a5;
- (void)setActualHandles:(id)a3;
- (void)setClassroom:(BOOL)a3;
- (void)setClassroomCourse:(BOOL)a3;
- (void)setClassroomGroup:(BOOL)a3;
- (void)setContact:(id)a3;
- (void)setContactIDs:(id)a3;
- (void)setContactIdentifier:(id)a3;
- (void)setDerivedIntentIdentifier:(id)a3;
- (void)setDisabled:(BOOL)a3;
- (void)setDisplayIcon:(CGImage *)a3;
- (void)setDisplayName:(id)a3;
- (void)setEndpointUUID:(id)a3;
- (void)setFormattedHandles:(id)a3;
- (void)setMe:(BOOL)a3;
- (void)setModel:(id)a3;
- (void)setMonogram:(BOOL)a3;
- (void)setNode:(id)a3;
- (void)setNodeIdentifier:(id)a3;
- (void)setRangingMeasurement:(id)a3;
- (void)setRapport:(BOOL)a3;
- (void)setRealName:(id)a3;
- (void)setSecondaryName:(id)a3;
- (void)setSelectionReason:(int64_t)a3;
- (void)setSuggestion:(BOOL)a3;
- (void)setSuggestionIndex:(id)a3;
- (void)setTransportBundleID:(id)a3;
- (void)setUltraWideBindCapable:(BOOL)a3;
- (void)setUnknown:(BOOL)a3;
- (void)startSendForBundleID:(id)a3 sessionID:(id)a4 items:(id)a5 description:(id)a6 previewImage:(CGImage *)a7 fromShareSheet:(BOOL)a8;
- (void)updateDisplayName;
- (void)updateWithSFNode:(__SFNode *)a3;
@end

@implementation SFAirDropNode

+ (id)nodeWithSFNode:(__SFNode *)a3
{
  v4 = objc_alloc_init(SFAirDropNode);
  [(SFAirDropNode *)v4 updateWithSFNode:a3];

  return v4;
}

- (SFAirDropNode)init
{
  v6.receiver = self;
  v6.super_class = (Class)SFAirDropNode;
  v2 = [(SFAirDropNode *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    discoveryDate = v2->_discoveryDate;
    v2->_discoveryDate = (NSDate *)v3;

    v2->_sender = 0;
  }
  return v2;
}

- (void)dealloc
{
  CGImageRelease(self->_displayIcon);
  v3.receiver = self;
  v3.super_class = (Class)SFAirDropNode;
  [(SFAirDropNode *)&v3 dealloc];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    if (-[SFAirDropNode isSuggestion](self, "isSuggestion") && [v5 isSuggestion])
    {
      realName = self->_realName;
      v7 = [v5 realName];
      BOOL v8 = [(NSString *)realName isEqualToString:v7];
    }
    else
    {
      v7 = [(SFAirDropNode *)self node];
      BOOL v8 = !valuesChanged(v7, (CFTypeRef)[v5 node]);
    }
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  v2 = [(SFAirDropNode *)self node];
  CFHashCode v3 = CFHash(v2);

  return v3;
}

- (NSString)description
{
  objc_opt_class();
  NSAppendPrintF();
  id v17 = 0;
  realName = self->_realName;
  NSAppendPrintF();
  id v3 = v17;

  id v4 = [(NSString *)self->_displayName stringByReplacingOccurrencesOfString:@"\n", @" ", realName, self withString];
  NSAppendPrintF();
  id v5 = v3;

  NSAppendPrintF();
  id v6 = v5;

  NSAppendPrintF();
  id v7 = v6;

  NSAppendPrintF();
  id v8 = v7;

  NSAppendPrintF();
  id v9 = v8;

  NSAppendPrintF();
  id v10 = v9;

  int64_t selectionReason = self->_selectionReason;
  if (selectionReason >= 1)
  {
    NSAppendPrintF();
    id v12 = v10;

    id v10 = v12;
  }
  if (self->_rangingMeasurement)
  {
    NSAppendPrintF();
    id v13 = v10;

    id v10 = v13;
  }
  NSAppendPrintF();
  id v14 = v10;

  return (NSString *)v14;
}

- (BOOL)isKnown
{
  return ![(SFAirDropNode *)self isUnknown];
}

- (void)updateWithSFNode:(__SFNode *)a3
{
  -[SFAirDropNode _updateDisplayIconWithSFNode:](self, "_updateDisplayIconWithSFNode:");
  self->_int64_t selectionReason = SFNodeGetSelectionReason((uint64_t)a3);
  self->_supportsCredentials = SFNodeSupportsCredentials((uint64_t)a3) != 0;
  self->_supportsFMF = SFNodeSupportsFMF((uint64_t)a3);
  self->_supportsPasses = SFNodeSupportsPasses((uint64_t)a3) != 0;
  self->_supportsMixedTypes = SFNodeSupportsMixedTypes((uint64_t)a3) != 0;
  self->_ultraWideBindCapable = SFNodeSupportsUWB((uint64_t)a3) != 0;
  CFSetRef v14 = SFNodeCopyKinds((uint64_t)a3);
  self->_disabled = [(__CFSet *)v14 containsObject:@"Disabled"];
  self->_me = [(__CFSet *)v14 containsObject:@"Me"];
  self->_unknown = [(__CFSet *)v14 containsObject:@"Unknown"];
  self->_monogram = [(__CFSet *)v14 containsObject:@"Monogram"];
  self->_classroom = [(__CFSet *)v14 containsObject:@"Classroom"];
  self->_classroomCourse = [(__CFSet *)v14 containsObject:@"ClassroomCourse"];
  self->_classroomGroup = [(__CFSet *)v14 containsObject:@"ClassroomGroup"];
  self->_suggestion = [(__CFSet *)v14 containsObject:@"Suggestion"];
  self->_rapport = [(__CFSet *)v14 containsObject:@"Rapport"];
  [(SFAirDropNode *)self setNode:a3];
  id v5 = (__CFString *)SFNodeCopyRealName((uint64_t)a3);
  [(SFAirDropNode *)self setRealName:v5];

  id v6 = (__CFString *)SFNodeCopySecondaryName((uint64_t)a3);
  [(SFAirDropNode *)self setSecondaryName:v6];

  id v7 = (__CFString *)SFNodeCopyContactIdentifier((uint64_t)a3);
  [(SFAirDropNode *)self setContactIdentifier:v7];

  id v8 = (__CFString *)SFNodeCopyModel((uint64_t)a3);
  [(SFAirDropNode *)self setModel:v8];

  id v9 = (__CFString *)SFNodeCopyTransportBundleID((uint64_t)a3);
  if (v9) {
    [(SFAirDropNode *)self setTransportBundleID:v9];
  }
  CFSetRef v10 = SFNodeCopyHandles((uint64_t)a3);
  [(SFAirDropNode *)self setActualHandles:v10];

  v11 = (void *)SFNodeCopyRangingData((uint64_t)a3);
  id v12 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v11 error:0];
  if (IsAppleInternalBuild())
  {
    if (CFPreferencesGetAppBooleanValue(@"ShowKnownInMagicHead", @"com.apple.Sharing", 0))
    {
      id v13 = [(SFAirDropNode *)self rangingMeasurement];

      if (v13)
      {
        if (!v12)
        {
          id v12 = [(SFAirDropNode *)self rangingMeasurement];
        }
      }
    }
  }
  [(SFAirDropNode *)self updateDisplayName];
  [(SFAirDropNode *)self setRangingMeasurement:v12];
}

- (void)_updateDisplayIconWithSFNode:(__SFNode *)a3
{
  id v5 = [(SFAirDropNode *)self node];
  if (v5)
  {
    id v6 = [(SFAirDropNode *)self node];
    IconData = (const void *)SFNodeGetIconData((uint64_t)v6);
  }
  else
  {
    IconData = 0;
  }

  if (a3)
  {
    id v8 = (void *)SFNodeGetIconData((uint64_t)a3);
    if (v8)
    {
      id v9 = v8;
      if (valuesChanged(IconData, v8))
      {
        CFSetRef v10 = SFCreateCGImageFromData(v9);
        [(SFAirDropNode *)self setDisplayIcon:v10];
        CGImageRelease(v10);
      }
    }
  }
}

- (void)setRangingMeasurement:(id)a3
{
  id v5 = a3;
  p_rangingMeasurement = &self->_rangingMeasurement;
  id v7 = self->_rangingMeasurement;
  id v8 = (CURangingMeasurement *)v5;
  v19 = v8;
  if (v7 == v8)
  {

    CFSetRef v10 = v19;
LABEL_18:

    goto LABEL_19;
  }
  if ((v8 != 0) == (v7 == 0))
  {

    goto LABEL_7;
  }
  char v9 = [(CURangingMeasurement *)v7 isEqual:v8];

  if ((v9 & 1) == 0)
  {
LABEL_7:
    objc_storeStrong((id *)&self->_rangingMeasurement, a3);
    v11 = +[SFSettingsDomain rootSettings];
    id v12 = [v11 magicHeadSettings];
    int v13 = [v12 showRangingValues];

    if (!v13) {
      goto LABEL_19;
    }
    char v14 = [(CURangingMeasurement *)*p_rangingMeasurement flags];
    v15 = (CURangingMeasurement *)objc_opt_new();
    CFSetRef v10 = v15;
    if ((v14 & 8) != 0)
    {
      [(CURangingMeasurement *)*p_rangingMeasurement ptsScore];
      [(CURangingMeasurement *)v10 appendFormat:@"%.2f", v16];
    }
    else
    {
      [(CURangingMeasurement *)v15 appendString:@"nil"];
    }
    [(CURangingMeasurement *)v10 appendString:@","];
    if ((v14 & 2) != 0)
    {
      [(CURangingMeasurement *)*p_rangingMeasurement horizontalAngle];
      [(CURangingMeasurement *)v10 appendFormat:@"%.2f", v17];
    }
    else
    {
      [(CURangingMeasurement *)v10 appendString:@"nil"];
    }
    [(CURangingMeasurement *)v10 appendString:@"°"];
    [(CURangingMeasurement *)v10 appendString:@","];
    if (v14)
    {
      [(CURangingMeasurement *)*p_rangingMeasurement distanceMeters];
      [(CURangingMeasurement *)v10 appendFormat:@"%.2f", v18];
    }
    else
    {
      [(CURangingMeasurement *)v10 appendString:@"nil"];
    }
    [(CURangingMeasurement *)v10 appendString:@"↔︎"];
    [(SFAirDropNode *)self appendDiscoveryInfoToDisplayName:v10];
    [(SFAirDropNode *)self setDisplayName:v10];
    goto LABEL_18;
  }
LABEL_19:
}

- (void)updateDisplayName
{
  id v3 = [(SFAirDropNode *)self node];

  if (self->_me && enableDeviceImages())
  {
    id v4 = NSString;
    id v5 = (__CFString *)SFNodeCopyModel((uint64_t)v3);
    v27 = [v4 stringWithFormat:@"My %@", v5];

    [(SFAirDropNode *)self setSecondaryName:&stru_1EF9BDC68];
    id v6 = v27;
  }
  else
  {
    id v6 = 0;
  }
  v28 = v6;
  if (![(__CFString *)v6 length] && (self->_unknown || self->_classroom))
  {
    CFStringRef v8 = SFNodeCopyDisplayName((uint64_t)v3);

    id v7 = (__CFString *)v8;
  }
  else
  {
    id v7 = v28;
  }
  v29 = v7;
  if ([(__CFString *)v7 length] || self->_me)
  {
    char v9 = v29;
  }
  else
  {
    CFStringRef v26 = SFNodeCopyNickName((uint64_t)v3);

    char v9 = (__CFString *)v26;
  }
  v30 = v9;
  if ([(__CFString *)v9 length] || !self->_me)
  {
    CFSetRef v10 = v30;
  }
  else
  {
    CFStringRef v11 = SFNodeCopyComputerName((uint64_t)v3);

    CFSetRef v10 = (__CFString *)v11;
  }
  v31 = v10;
  if ([(__CFString *)v10 length] || !self->_suggestion)
  {
    id v12 = v31;
  }
  else
  {
    CFStringRef v13 = SFNodeCopyDisplayName((uint64_t)v3);

    id v12 = (__CFString *)v13;
  }
  v32 = v12;
  if ([(__CFString *)v12 length])
  {
    id v14 = v32;
  }
  else
  {
    Name = (__CFString *)SFNodeCopyFirstName((uint64_t)v3);
    uint64_t v16 = (__CFString *)SFNodeCopyLastName((uint64_t)v3);
    uint64_t v17 = (NSPersonNameComponents *)objc_opt_new();
    nameComponents = self->_nameComponents;
    self->_nameComponents = v17;

    [(NSPersonNameComponents *)self->_nameComponents setGivenName:Name];
    [(NSPersonNameComponents *)self->_nameComponents setFamilyName:v16];
    v19 = objc_opt_new();
    [v19 setStyle:0];
    v20 = [MEMORY[0x1E4F1CA20] autoupdatingCurrentLocale];
    objc_msgSend(v19, "set_locale:", v20);

    uint64_t v21 = [v19 stringFromPersonNameComponents:self->_nameComponents];

    id v14 = (id)v21;
  }
  id v33 = v14;
  [(SFAirDropNode *)self setDisplayName:v14];
  v22 = +[SFSettingsDomain rootSettings];
  v23 = [v22 magicHeadSettings];
  int v24 = [v23 showRangingValues];

  if (v24)
  {
    v25 = (void *)[v33 mutableCopy];
    [(SFAirDropNode *)self appendDiscoveryInfoToDisplayName:v25];
    [(SFAirDropNode *)self setDisplayName:v25];
  }
}

- (void)appendDiscoveryInfoToDisplayName:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(SFAirDropNode *)self node];
  CFArrayRef v6 = SFNodeCopySiblingNodes((uint64_t)v5);

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  CFArrayRef v7 = v6;
  uint64_t v8 = [(__CFArray *)v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (!v8)
  {

    goto LABEL_18;
  }
  uint64_t v9 = v8;
  int v10 = 0;
  int v11 = 0;
  uint64_t v12 = *(void *)v17;
  do
  {
    for (uint64_t i = 0; i != v9; ++i)
    {
      if (*(void *)v17 != v12) {
        objc_enumerationMutation(v7);
      }
      CFSetRef v14 = SFNodeCopyKinds(*(void *)(*((void *)&v16 + 1) + 8 * i));
      CFSetRef v15 = v14;
      if (v11 & v10)
      {
        int v10 = 1;
LABEL_9:
        int v11 = 1;
        goto LABEL_11;
      }
      if ([(__CFSet *)v14 containsObject:@"Rapport", (void)v16]) {
        goto LABEL_9;
      }
      v10 |= [(__CFSet *)v15 containsObject:@"Bonjour"];
LABEL_11:
    }
    uint64_t v9 = [(__CFArray *)v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  }
  while (v9);

  if (v11) {
    [v4 appendString:@",B"];
  }
  if (v10) {
    [v4 appendString:@",A"];
  }
LABEL_18:
}

- (id)displayNameForLocale:(id)a3
{
  id v4 = a3;
  id v5 = +[SFSettingsDomain rootSettings];
  CFArrayRef v6 = [v5 magicHeadSettings];
  int v7 = [v6 showRangingValues];

  if (v7)
  {
    uint64_t v8 = [(SFAirDropNode *)self displayName];
  }
  else
  {
    id v9 = v4;
    if (!v9)
    {
      id v9 = [MEMORY[0x1E4F1CA20] currentLocale];
      int v10 = airdrop_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[SFAirDropNode displayNameForLocale:]();
      }
    }
    int v11 = self->_nameComponents;
    if (v11)
    {
      uint64_t v12 = objc_opt_new();
      [v12 setStyle:0];
      objc_msgSend(v12, "set_locale:", v9);
      uint64_t v8 = [v12 stringFromPersonNameComponents:v11];
    }
    else
    {
      CFStringRef v13 = airdrop_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
        -[SFAirDropNode displayNameForLocale:](self, v13);
      }

      uint64_t v8 = [(SFAirDropNode *)self displayName];
    }
  }

  return v8;
}

- (void)startSendForBundleID:(id)a3 sessionID:(id)a4 items:(id)a5 description:(id)a6 previewImage:(CGImage *)a7 fromShareSheet:(BOOL)a8
{
  BOOL v8 = a8;
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  if (!self->_sender)
  {
    long long v19 = airdrop_log();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
      -[SFAirDropNode startSendForBundleID:sessionID:items:description:previewImage:fromShareSheet:](a2, v17, v19);
    }

    v20 = (__SFOperation *)SFOperationCreate(0, @"Sender");
    self->_sender = v20;
    *(void *)&long long v21 = 0;
    *((void *)&v21 + 1) = self;
    uint64_t v22 = MEMORY[0x1E4F1C280];
    uint64_t v23 = MEMORY[0x1E4F1C278];
    uint64_t v24 = 0;
    SFOperationSetClient((uint64_t)v20, (uint64_t)operationCallBack, &v21);
    SFOperationSetDispatchQueue((uint64_t)self->_sender, MEMORY[0x1E4F14428]);
    SFOperationSetProperty((pthread_mutex_t *)self->_sender, @"Node", self->_node);
    if (v15) {
      SFOperationSetProperty((pthread_mutex_t *)self->_sender, @"BundleID", v15);
    }
    if (a7) {
      SFOperationSetProperty((pthread_mutex_t *)self->_sender, @"FileIcon", a7);
    }
    SFOperationSetProperty((pthread_mutex_t *)self->_sender, @"FromShareSheet", (const void *)[NSNumber numberWithBool:v8]);
    SFOperationSetProperty((pthread_mutex_t *)self->_sender, @"Items", v17);
    if (v16) {
      SFOperationSetProperty((pthread_mutex_t *)self->_sender, @"SessionID", v16);
    }
    if (v18) {
      SFOperationSetProperty((pthread_mutex_t *)self->_sender, @"ItemsDescription", v18);
    }
    SFOperationResume((uint64_t)self->_sender);
  }
}

- (void)cancelSend
{
  sender = self->_sender;
  if (sender)
  {
    SFOperationCancel((uint64_t)sender);
    CFRelease(self->_sender);
    self->_sender = 0;
  }
}

- (void)handleOperationCallback:(__SFOperation *)a3 event:(int64_t)a4 withResults:(id)a5
{
  id v8 = a5;
  switch(a4)
  {
    case 2:
      SFOperationResume((uint64_t)a3);
      break;
    case 3:
    case 5:
    case 6:
    case 7:
    case 8:
    case 11:
    case 14:
    case 15:
      break;
    case 4:
    case 9:
      goto LABEL_6;
    case 10:
      id v9 = airdrop_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[SFAirDropNode handleOperationCallback:event:withResults:]();
      }

LABEL_6:
      [(SFAirDropNode *)self cancelSend];
      break;
    default:
      int v10 = airdrop_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[SFAirDropNode handleOperationCallback:event:withResults:](a4, (uint64_t)v8, v10);
      }

      break;
  }
}

- (NSString)contactIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setContactIdentifier:(id)a3
{
}

- (BOOL)isDisabled
{
  return self->_disabled;
}

- (void)setDisabled:(BOOL)a3
{
  self->_disabled = a3;
}

- (CGImage)displayIcon
{
  return (CGImage *)objc_getProperty(self, a2, 48, 1);
}

- (void)setDisplayIcon:(CGImage *)a3
{
}

- (NSString)displayName
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setDisplayName:(id)a3
{
}

- (NSUUID)endpointUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 64, 1);
}

- (void)setEndpointUUID:(id)a3
{
}

- (NSUUID)nodeIdentifier
{
  return (NSUUID *)objc_getProperty(self, a2, 72, 1);
}

- (void)setNodeIdentifier:(id)a3
{
}

- (NSString)realName
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (void)setRealName:(id)a3
{
}

- (NSString)model
{
  return (NSString *)objc_getProperty(self, a2, 88, 1);
}

- (void)setModel:(id)a3
{
}

- (int64_t)selectionReason
{
  return self->_selectionReason;
}

- (void)setSelectionReason:(int64_t)a3
{
  self->_int64_t selectionReason = a3;
}

- (BOOL)isClassroom
{
  return self->_classroom;
}

- (void)setClassroom:(BOOL)a3
{
  self->_classroom = a3;
}

- (BOOL)isSuggestion
{
  return self->_suggestion;
}

- (void)setSuggestion:(BOOL)a3
{
  self->_suggestion = a3;
}

- (NSSet)formattedHandles
{
  return (NSSet *)objc_getProperty(self, a2, 104, 1);
}

- (void)setFormattedHandles:(id)a3
{
}

- (NSNumber)suggestionIndex
{
  return (NSNumber *)objc_getProperty(self, a2, 112, 1);
}

- (void)setSuggestionIndex:(id)a3
{
}

- (NSString)transportBundleID
{
  return (NSString *)objc_getProperty(self, a2, 120, 1);
}

- (void)setTransportBundleID:(id)a3
{
}

- (CNContact)contact
{
  return (CNContact *)objc_getProperty(self, a2, 128, 1);
}

- (void)setContact:(id)a3
{
}

- (NSDate)discoveryDate
{
  return (NSDate *)objc_getProperty(self, a2, 136, 1);
}

- (id)node
{
  return objc_getProperty(self, a2, 144, 1);
}

- (void)setNode:(id)a3
{
}

- (NSString)secondaryName
{
  return (NSString *)objc_getProperty(self, a2, 152, 1);
}

- (void)setSecondaryName:(id)a3
{
}

- (NSSet)actualHandles
{
  return (NSSet *)objc_getProperty(self, a2, 160, 1);
}

- (void)setActualHandles:(id)a3
{
}

- (CURangingMeasurement)rangingMeasurement
{
  return self->_rangingMeasurement;
}

- (NSSet)contactIDs
{
  return self->_contactIDs;
}

- (void)setContactIDs:(id)a3
{
}

- (NSString)derivedIntentIdentifier
{
  return self->_derivedIntentIdentifier;
}

- (void)setDerivedIntentIdentifier:(id)a3
{
}

- (BOOL)isMe
{
  return self->_me;
}

- (void)setMe:(BOOL)a3
{
  self->_me = a3;
}

- (BOOL)isUnknown
{
  return self->_unknown;
}

- (void)setUnknown:(BOOL)a3
{
  self->_unknown = a3;
}

- (BOOL)isMonogram
{
  return self->_monogram;
}

- (void)setMonogram:(BOOL)a3
{
  self->_monogram = a3;
}

- (BOOL)isclassroomGroup
{
  return self->_classroomGroup;
}

- (void)setClassroomGroup:(BOOL)a3
{
  self->_classroomGroup = a3;
}

- (BOOL)isClassroomCourse
{
  return self->_classroomCourse;
}

- (void)setClassroomCourse:(BOOL)a3
{
  self->_classroomCourse = a3;
}

- (BOOL)isRapport
{
  return self->_rapport;
}

- (void)setRapport:(BOOL)a3
{
  self->_rapport = a3;
}

- (BOOL)isUltraWideBindCapable
{
  return self->_ultraWideBindCapable;
}

- (void)setUltraWideBindCapable:(BOOL)a3
{
  self->_ultraWideBindCapable = a3;
}

- (BOOL)supportsCredentials
{
  return self->_supportsCredentials;
}

- (BOOL)supportsFMF
{
  return self->_supportsFMF;
}

- (BOOL)supportsPasses
{
  return self->_supportsPasses;
}

- (BOOL)supportsMixedTypes
{
  return self->_supportsMixedTypes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_derivedIntentIdentifier, 0);
  objc_storeStrong((id *)&self->_contactIDs, 0);
  objc_storeStrong((id *)&self->_rangingMeasurement, 0);
  objc_storeStrong((id *)&self->_actualHandles, 0);
  objc_storeStrong((id *)&self->_secondaryName, 0);
  objc_storeStrong(&self->_node, 0);
  objc_storeStrong((id *)&self->_discoveryDate, 0);
  objc_storeStrong((id *)&self->_contact, 0);
  objc_storeStrong((id *)&self->_transportBundleID, 0);
  objc_storeStrong((id *)&self->_suggestionIndex, 0);
  objc_storeStrong((id *)&self->_formattedHandles, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_realName, 0);
  objc_storeStrong((id *)&self->_nodeIdentifier, 0);
  objc_storeStrong((id *)&self->_endpointUUID, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_contactIdentifier, 0);

  objc_storeStrong((id *)&self->_nameComponents, 0);
}

- (void)displayNameForLocale:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  id v3 = [a1 displayName];
  OUTLINED_FUNCTION_5();
  _os_log_debug_impl(&dword_1A5389000, a2, OS_LOG_TYPE_DEBUG, "displayNameForLocale: _nameComponents = nil, fall back to displayName: %@", v4, 0xCu);
}

- (void)displayNameForLocale:.cold.2()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_5();
  _os_log_error_impl(&dword_1A5389000, v0, OS_LOG_TYPE_ERROR, "displayNameForLocale: inLocale = nil, using currentLocale: %@", v1, 0xCu);
}

- (void)startSendForBundleID:(NSObject *)a3 sessionID:items:description:previewImage:fromShareSheet:.cold.1(const char *a1, void *a2, NSObject *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = NSStringFromSelector(a1);
  CFArrayRef v6 = [a2 valueForKeyPath:@"class"];
  int v7 = 138412802;
  id v8 = v5;
  __int16 v9 = 2112;
  int v10 = v6;
  __int16 v11 = 2112;
  uint64_t v12 = a2;
  _os_log_debug_impl(&dword_1A5389000, a3, OS_LOG_TYPE_DEBUG, "AirDrop %@ Items \nTypes: [%@], \nValues: [%@]", (uint8_t *)&v7, 0x20u);
}

- (void)handleOperationCallback:(uint64_t)a1 event:(uint64_t)a2 withResults:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  int v5 = a1;
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  SFOperationEventToString(a1);
  OUTLINED_FUNCTION_5();
  __int16 v7 = 1024;
  int v8 = v5;
  __int16 v9 = 2112;
  uint64_t v10 = a2;
  _os_log_error_impl(&dword_1A5389000, a3, OS_LOG_TYPE_ERROR, "Sender UNHANDLED EVENT %@ [%d] %@", v6, 0x1Cu);
}

- (void)handleOperationCallback:event:withResults:.cold.2()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_5();
  _os_log_error_impl(&dword_1A5389000, v0, OS_LOG_TYPE_ERROR, "Sender kSFOperationEventErrorOccured %@", v1, 0xCu);
}

@end