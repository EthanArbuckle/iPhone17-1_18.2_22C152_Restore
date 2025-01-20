@interface _UIHostActivityProxy
+ (BOOL)supportsSecureCoding;
- (BOOL)isDisabled;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFavorite;
- (BOOL)isRestricted;
- (BOOL)isUserDefaultsActivity;
- (BOOL)load;
- (NSAttributedString)activityFooter;
- (NSString)applicationBundleIdentifier;
- (NSString)description;
- (NSUUID)activityIdentifierCopy;
- (NSUUID)activityIdentifierOpen;
- (NSUUID)activityIdentifierShare;
- (NSUUID)identifier;
- (SFProxyText)activityTitle;
- (UIActivity)activity;
- (_UIHostActivityProxy)initWithActivity:(id)a3;
- (_UIHostActivityProxy)initWithCoder:(id)a3;
- (double)slotTextHeight;
- (id)loadHandler;
- (unint64_t)hash;
- (unsigned)iconImageSlotID;
- (unsigned)labelSlotID;
- (void)encodeWithCoder:(id)a3;
- (void)setActivityFooter:(id)a3;
- (void)setActivityIdentifierCopy:(id)a3;
- (void)setActivityIdentifierOpen:(id)a3;
- (void)setActivityIdentifierShare:(id)a3;
- (void)setActivityTitle:(id)a3;
- (void)setApplicationBundleIdentifier:(id)a3;
- (void)setIconImageSlotID:(unsigned int)a3;
- (void)setIsDisabled:(BOOL)a3;
- (void)setIsFavorite:(BOOL)a3;
- (void)setIsRestricted:(BOOL)a3;
- (void)setIsUserDefaultsActivity:(BOOL)a3;
- (void)setLabelSlotID:(unsigned int)a3;
- (void)setLoadHandler:(id)a3;
- (void)setSlotTextHeight:(double)a3;
@end

@implementation _UIHostActivityProxy

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_UIHostActivityProxy)initWithActivity:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_UIHostActivityProxy;
  v6 = [(_UIHostActivityProxy *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_activity, a3);
    uint64_t v8 = [v5 activityUUID];
    identifier = v7->_identifier;
    v7->_identifier = (NSUUID *)v8;
  }
  return v7;
}

- (_UIHostActivityProxy)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(_UIHostActivityProxy *)self init];
  if (v5)
  {
    -[_UIHostActivityProxy setIconImageSlotID:](v5, "setIconImageSlotID:", [v4 decodeInt32ForKey:@"iconImageSlotID"]);
    -[_UIHostActivityProxy setLabelSlotID:](v5, "setLabelSlotID:", [v4 decodeInt32ForKey:@"labelSlotID"]);
    [v4 decodeDoubleForKey:@"slotTextHeight"];
    -[_UIHostActivityProxy setSlotTextHeight:](v5, "setSlotTextHeight:");
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSUUID *)v6;

    v5->_isDisabled = [v4 decodeBoolForKey:@"isDisabled"];
    v5->_isFavorite = [v4 decodeBoolForKey:@"isFavorite"];
    v5->_isRestricted = [v4 decodeBoolForKey:@"isRestricted"];
    v5->_isUserDefaultsActivity = [v4 decodeBoolForKey:@"isUserDefaultsActivity"];
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"activityIdentifierShare"];
    activityIdentifierShare = v5->_activityIdentifierShare;
    v5->_activityIdentifierShare = (NSUUID *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"activityIdentifierOpen"];
    activityIdentifierOpen = v5->_activityIdentifierOpen;
    v5->_activityIdentifierOpen = (NSUUID *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"activityIdentifierCopy"];
    activityIdentifierCopy = v5->_activityIdentifierCopy;
    v5->_activityIdentifierCopy = (NSUUID *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"activityTitle"];
    activityTitle = v5->_activityTitle;
    v5->_activityTitle = (SFProxyText *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"activityFooter"];
    activityFooter = v5->_activityFooter;
    v5->_activityFooter = (NSAttributedString *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"applicationBundleIdentifier"];
    applicationBundleIdentifier = v5->_applicationBundleIdentifier;
    v5->_applicationBundleIdentifier = (NSString *)v18;

    if ([(_UIHostActivityProxy *)v5 labelSlotID])
    {
      v20 = [(_UIHostActivityProxy *)v5 activityTitle];
      int v21 = [v20 slotIdentifier];

      if (!v21)
      {
        id v22 = objc_alloc(MEMORY[0x1E4F9F6F8]);
        uint64_t v23 = [(_UIHostActivityProxy *)v5 labelSlotID];
        [(_UIHostActivityProxy *)v5 slotTextHeight];
        v24 = objc_msgSend(v22, "initWithSlotIdentifier:slotTextHeight:", v23);
        [(_UIHostActivityProxy *)v5 setActivityTitle:v24];
      }
    }
    if ([(_UIHostActivityProxy *)v5 isRestricted])
    {
      v25 = share_sheet_log();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT)) {
        -[_UIHostActivityProxy initWithCoder:]((uint64_t)v5, v25);
      }

      id v5 = 0;
    }
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInt32:forKey:", -[_UIHostActivityProxy iconImageSlotID](self, "iconImageSlotID"), @"iconImageSlotID");
  objc_msgSend(v4, "encodeInt32:forKey:", -[_UIHostActivityProxy labelSlotID](self, "labelSlotID"), @"labelSlotID");
  [(_UIHostActivityProxy *)self slotTextHeight];
  objc_msgSend(v4, "encodeDouble:forKey:", @"slotTextHeight");
  [v4 encodeObject:self->_identifier forKey:@"identifier"];
  [v4 encodeBool:self->_isDisabled forKey:@"isDisabled"];
  [v4 encodeBool:self->_isFavorite forKey:@"isFavorite"];
  [v4 encodeBool:self->_isRestricted forKey:@"isRestricted"];
  [v4 encodeBool:self->_isUserDefaultsActivity forKey:@"isUserDefaultsActivity"];
  [v4 encodeObject:self->_activityIdentifierShare forKey:@"activityIdentifierShare"];
  [v4 encodeObject:self->_activityIdentifierOpen forKey:@"activityIdentifierOpen"];
  [v4 encodeObject:self->_activityIdentifierCopy forKey:@"activityIdentifierCopy"];
  [v4 encodeObject:self->_activityTitle forKey:@"activityTitle"];
  [v4 encodeObject:self->_activityFooter forKey:@"activityFooter"];
  [v4 encodeObject:self->_applicationBundleIdentifier forKey:@"applicationBundleIdentifier"];
}

- (void)setIconImageSlotID:(unsigned int)a3
{
}

- (unsigned)iconImageSlotID
{
  return atomic_load(&self->_iconImageSlotID);
}

- (void)setLabelSlotID:(unsigned int)a3
{
}

- (unsigned)labelSlotID
{
  return atomic_load(&self->_labelSlotID);
}

- (void)setSlotTextHeight:(double)a3
{
}

- (double)slotTextHeight
{
  return COERCE_DOUBLE(atomic_load((unint64_t *)&self->_slotTextHeight));
}

- (NSString)description
{
  v17 = NSString;
  v18.receiver = self;
  v18.super_class = (Class)_UIHostActivityProxy;
  v3 = [(_UIHostActivityProxy *)&v18 description];
  id v4 = [(_UIHostActivityProxy *)self identifier];
  activity = self->_activity;
  uint64_t v5 = [(_UIHostActivityProxy *)self iconImageSlotID];
  uint64_t v6 = [(_UIHostActivityProxy *)self labelSlotID];
  if (self->_isDisabled) {
    v7 = @"YES";
  }
  else {
    v7 = @"NO";
  }
  if (self->_isFavorite) {
    uint64_t v8 = @"YES";
  }
  else {
    uint64_t v8 = @"NO";
  }
  if (self->_isRestricted) {
    v9 = @"YES";
  }
  else {
    v9 = @"NO";
  }
  if (self->_isUserDefaultsActivity) {
    uint64_t v10 = @"YES";
  }
  else {
    uint64_t v10 = @"NO";
  }
  long long v15 = *(_OWORD *)&self->_activityIdentifierShare;
  activityIdentifierCopy = self->_activityIdentifierCopy;
  [(_UIHostActivityProxy *)self slotTextHeight];
  v13 = [v17 stringWithFormat:@"<%@: identifier:%@ activity:%@ iconImageSlotID:%u, textSlot:%u, isDisabled:%@, isFavorite:%@, isRestricted:%@, isUserDefaultsActivity:%@, activityIdentifierShare:%@, activityIdentifierOpen:%@, activityIdentifierCopy:%@, textHeight:%f, activityTitle:%@, activityFooter:%@, bundleIdentifier:%@>", v3, v4, activity, v5, v6, v7, v8, v9, v10, v15, activityIdentifierCopy, v12, self->_activityTitle, self->_activityFooter, self->_applicationBundleIdentifier];

  return (NSString *)v13;
}

- (unint64_t)hash
{
  v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  uint64_t v5 = [v4 hash];

  uint64_t v6 = [(_UIHostActivityProxy *)self identifier];
  unint64_t v7 = [v6 hash] ^ v5;

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (_UIHostActivityProxy *)a3;
  if (self == v4)
  {
    char v12 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = v4;
      uint64_t v6 = [(_UIHostActivityProxy *)self identifier];
      unint64_t v7 = [(_UIHostActivityProxy *)v5 identifier];
      id v8 = v6;
      id v9 = v7;
      uint64_t v10 = v9;
      if (v8 == v9)
      {
      }
      else
      {
        if ((v8 == 0) == (v9 != 0))
        {
          char v12 = 0;
          v19 = v9;
          id v20 = v8;
LABEL_18:

          goto LABEL_19;
        }
        int v11 = [v8 isEqual:v9];

        if (!v11)
        {
LABEL_16:
          char v12 = 0;
LABEL_19:

          goto LABEL_20;
        }
      }
      unsigned int v13 = [(_UIHostActivityProxy *)self iconImageSlotID];
      if (v13 != [(_UIHostActivityProxy *)v5 iconImageSlotID]) {
        goto LABEL_16;
      }
      unsigned int v14 = [(_UIHostActivityProxy *)self labelSlotID];
      if (v14 != [(_UIHostActivityProxy *)v5 labelSlotID]) {
        goto LABEL_16;
      }
      BOOL v15 = [(_UIHostActivityProxy *)self isDisabled];
      if (v15 != [(_UIHostActivityProxy *)v5 isDisabled]) {
        goto LABEL_16;
      }
      BOOL v16 = [(_UIHostActivityProxy *)self isFavorite];
      if (v16 != [(_UIHostActivityProxy *)v5 isFavorite]) {
        goto LABEL_16;
      }
      BOOL v17 = [(_UIHostActivityProxy *)self isRestricted];
      if (v17 != [(_UIHostActivityProxy *)v5 isRestricted]) {
        goto LABEL_16;
      }
      BOOL v18 = [(_UIHostActivityProxy *)self isUserDefaultsActivity];
      if (v18 != [(_UIHostActivityProxy *)v5 isUserDefaultsActivity]) {
        goto LABEL_16;
      }
      id v22 = [(_UIHostActivityProxy *)self activityIdentifierShare];
      uint64_t v23 = [(_UIHostActivityProxy *)v5 activityIdentifierShare];
      id v20 = v22;
      id v24 = v23;
      v19 = v24;
      if (v20 == v24)
      {
      }
      else
      {
        if ((v20 == 0) == (v24 != 0))
        {
          char v12 = 0;
          v30 = v24;
          id v28 = v20;
          goto LABEL_65;
        }
        int v25 = [v20 isEqual:v24];

        if (!v25)
        {
          char v12 = 0;
          goto LABEL_18;
        }
      }
      v26 = [(_UIHostActivityProxy *)self activityIdentifierOpen];
      v27 = [(_UIHostActivityProxy *)v5 activityIdentifierOpen];
      id v28 = v26;
      id v29 = v27;
      v30 = v29;
      if (v28 == v29)
      {
      }
      else
      {
        if ((v28 == 0) == (v29 != 0))
        {
          char v12 = 0;
          v40 = v29;
          id v34 = v28;
LABEL_64:

          goto LABEL_65;
        }
        int v31 = [v28 isEqual:v29];

        if (!v31)
        {
          char v12 = 0;
LABEL_65:

          goto LABEL_18;
        }
      }
      v69 = v30;
      v32 = [(_UIHostActivityProxy *)self activityIdentifierCopy];
      v33 = [(_UIHostActivityProxy *)v5 activityIdentifierCopy];
      id v34 = v32;
      id v35 = v33;
      id v68 = v35;
      if (v34 == v35)
      {
      }
      else
      {
        v36 = v35;
        if ((v34 == 0) == (v35 != 0))
        {
          id v67 = v28;
          char v12 = 0;
          v49 = v34;
          v30 = v69;
LABEL_63:

          id v28 = v67;
          v40 = v68;
          goto LABEL_64;
        }
        v37 = v34;
        v38 = v34;
        v39 = v36;
        int v65 = [v37 isEqual:v36];

        id v34 = v38;
        if (!v65) {
          goto LABEL_43;
        }
      }
      [(_UIHostActivityProxy *)self slotTextHeight];
      double v42 = v41;
      [(_UIHostActivityProxy *)v5 slotTextHeight];
      if (vabdd_f64(v42, v43) >= 0.00000011920929)
      {
LABEL_43:
        char v12 = 0;
        v40 = v68;
        v30 = v69;
        goto LABEL_64;
      }
      v44 = [(_UIHostActivityProxy *)self activityTitle];
      v63 = [(_UIHostActivityProxy *)v5 activityTitle];
      id v45 = v44;
      id v46 = v63;
      id v66 = v45;
      id v67 = v28;
      id v64 = v46;
      if (v45 == v46)
      {
      }
      else
      {
        v47 = v46;
        if ((v45 == 0) == (v46 != 0))
        {
          char v12 = 0;
          id v52 = v45;
          v30 = v69;
LABEL_61:

          goto LABEL_62;
        }
        v48 = v46;
        int v61 = [v45 isEqual:v46];

        if (!v61)
        {
          char v12 = 0;
          v30 = v69;
LABEL_62:
          v36 = v64;
          v49 = v66;
          goto LABEL_63;
        }
      }
      id v62 = v34;
      v50 = [(_UIHostActivityProxy *)self activityFooter];
      v51 = [(_UIHostActivityProxy *)v5 activityFooter];
      id v52 = v50;
      id v53 = v51;
      id v60 = v53;
      if (v52 == v53)
      {
      }
      else
      {
        v54 = v53;
        if ((v52 == 0) == (v53 != 0))
        {
          char v12 = 0;
          id v58 = v52;
LABEL_59:

          goto LABEL_60;
        }
        int v55 = [v52 isEqual:v53];

        if (!v55)
        {
          char v12 = 0;
LABEL_60:
          v30 = v69;
          v47 = v60;
          id v34 = v62;
          goto LABEL_61;
        }
      }
      v56 = [(_UIHostActivityProxy *)self applicationBundleIdentifier];
      v57 = [(_UIHostActivityProxy *)v5 applicationBundleIdentifier];
      id v58 = v56;
      id v59 = v57;
      v54 = v59;
      if (v58 == v59)
      {
        char v12 = 1;
      }
      else if ((v58 == 0) == (v59 != 0))
      {
        char v12 = 0;
      }
      else
      {
        char v12 = [v58 isEqual:v59];
      }

      goto LABEL_59;
    }
    char v12 = 0;
  }
LABEL_20:

  return v12;
}

- (BOOL)load
{
  v3 = [(_UIHostActivityProxy *)self loadHandler];
  if (v3)
  {
    [(_UIHostActivityProxy *)self setLoadHandler:0];
    char v4 = ((uint64_t (**)(void, _UIHostActivityProxy *))v3)[2](v3, self);
  }
  else
  {
    char v4 = 1;
  }

  return v4;
}

- (UIActivity)activity
{
  return self->_activity;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (NSUUID)activityIdentifierShare
{
  return self->_activityIdentifierShare;
}

- (void)setActivityIdentifierShare:(id)a3
{
}

- (NSUUID)activityIdentifierOpen
{
  return self->_activityIdentifierOpen;
}

- (void)setActivityIdentifierOpen:(id)a3
{
}

- (NSUUID)activityIdentifierCopy
{
  return self->_activityIdentifierCopy;
}

- (void)setActivityIdentifierCopy:(id)a3
{
}

- (SFProxyText)activityTitle
{
  return self->_activityTitle;
}

- (void)setActivityTitle:(id)a3
{
}

- (NSAttributedString)activityFooter
{
  return self->_activityFooter;
}

- (void)setActivityFooter:(id)a3
{
}

- (NSString)applicationBundleIdentifier
{
  return self->_applicationBundleIdentifier;
}

- (void)setApplicationBundleIdentifier:(id)a3
{
}

- (BOOL)isFavorite
{
  return self->_isFavorite;
}

- (void)setIsFavorite:(BOOL)a3
{
  self->_isFavorite = a3;
}

- (BOOL)isDisabled
{
  return self->_isDisabled;
}

- (void)setIsDisabled:(BOOL)a3
{
  self->_isDisabled = a3;
}

- (BOOL)isUserDefaultsActivity
{
  return self->_isUserDefaultsActivity;
}

- (void)setIsUserDefaultsActivity:(BOOL)a3
{
  self->_isUserDefaultsActivity = a3;
}

- (BOOL)isRestricted
{
  return self->_isRestricted;
}

- (void)setIsRestricted:(BOOL)a3
{
  self->_isRestricted = a3;
}

- (id)loadHandler
{
  return self->_loadHandler;
}

- (void)setLoadHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_loadHandler, 0);
  objc_storeStrong((id *)&self->_applicationBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_activityFooter, 0);
  objc_storeStrong((id *)&self->_activityTitle, 0);
  objc_storeStrong((id *)&self->_activityIdentifierCopy, 0);
  objc_storeStrong((id *)&self->_activityIdentifierOpen, 0);
  objc_storeStrong((id *)&self->_activityIdentifierShare, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_activity, 0);
}

- (void)initWithCoder:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_1A0AD8000, a2, OS_LOG_TYPE_FAULT, "_UIHostActivityProxy:%@ is restricted.", (uint8_t *)&v2, 0xCu);
}

@end