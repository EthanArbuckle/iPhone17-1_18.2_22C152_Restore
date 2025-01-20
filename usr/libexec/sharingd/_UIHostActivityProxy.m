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
  id v5 = a3;
  v6 = [(_UIHostActivityProxy *)self init];
  if (v6)
  {
    -[_UIHostActivityProxy setIconImageSlotID:](v6, "setIconImageSlotID:", [v5 decodeInt32ForKey:@"iconImageSlotID"]);
    -[_UIHostActivityProxy setLabelSlotID:](v6, "setLabelSlotID:", [v5 decodeInt32ForKey:@"labelSlotID"]);
    [v5 decodeDoubleForKey:@"slotTextHeight"];
    -[_UIHostActivityProxy setSlotTextHeight:](v6, "setSlotTextHeight:");
    uint64_t v7 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    identifier = v6->_identifier;
    v6->_identifier = (NSUUID *)v7;

    v6->_isDisabled = [v5 decodeBoolForKey:@"isDisabled"];
    v6->_isFavorite = [v5 decodeBoolForKey:@"isFavorite"];
    v6->_isRestricted = [v5 decodeBoolForKey:@"isRestricted"];
    v6->_isUserDefaultsActivity = [v5 decodeBoolForKey:@"isUserDefaultsActivity"];
    uint64_t v9 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"activityIdentifierShare"];
    activityIdentifierShare = v6->_activityIdentifierShare;
    v6->_activityIdentifierShare = (NSUUID *)v9;

    uint64_t v11 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"activityIdentifierOpen"];
    activityIdentifierOpen = v6->_activityIdentifierOpen;
    v6->_activityIdentifierOpen = (NSUUID *)v11;

    uint64_t v13 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"activityIdentifierCopy"];
    activityIdentifierCopy = v6->_activityIdentifierCopy;
    v6->_activityIdentifierCopy = (NSUUID *)v13;

    uint64_t v15 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"activityTitle"];
    activityTitle = v6->_activityTitle;
    v6->_activityTitle = (SFProxyText *)v15;

    uint64_t v17 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"activityFooter"];
    activityFooter = v6->_activityFooter;
    v6->_activityFooter = (NSAttributedString *)v17;

    uint64_t v19 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"applicationBundleIdentifier"];
    applicationBundleIdentifier = v6->_applicationBundleIdentifier;
    v6->_applicationBundleIdentifier = (NSString *)v19;

    if ([(_UIHostActivityProxy *)v6 labelSlotID])
    {
      v21 = [(_UIHostActivityProxy *)v6 activityTitle];
      unsigned int v22 = [v21 slotIdentifier];

      if (!v22)
      {
        v23 = [(_UIHostActivityProxy *)v6 activityTitle];
        v24 = [v23 text];

        if (v24)
        {
          v30 = +[NSAssertionHandler currentHandler];
          [v30 handleFailureInMethod:a2 object:v6 file:@"_UIHostActivityProxy.m" lineNumber:71 description:@"using slot and text at the same time for activityTitle."];
        }
        id v25 = objc_alloc((Class)SFProxyText);
        id v26 = (id)[(_UIHostActivityProxy *)v6 labelSlotID];
        [(_UIHostActivityProxy *)v6 slotTextHeight];
        id v27 = [v25 initWithSlotIdentifier:v26];
        [(_UIHostActivityProxy *)v6 setActivityTitle:v27];
      }
    }
    if ([(_UIHostActivityProxy *)v6 isRestricted])
    {
      v28 = share_sheet_log();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT)) {
        sub_10001B390((uint64_t)v6, v28);
      }

      v6 = 0;
    }
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeInt32:-[_UIHostActivityProxy iconImageSlotID] forKey:@"iconImageSlotID"];
  [v4 encodeInt32:-[_UIHostActivityProxy labelSlotID](self, "labelSlotID") forKey:@"labelSlotID"];
  [(_UIHostActivityProxy *)self slotTextHeight];
  [v4 encodeDouble:@"slotTextHeight" forKey:@"slotTextHeight"];
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
  v17.receiver = self;
  v17.super_class = (Class)_UIHostActivityProxy;
  v3 = [(_UIHostActivityProxy *)&v17 description];
  id v4 = [(_UIHostActivityProxy *)self identifier];
  activity = self->_activity;
  uint64_t v5 = [(_UIHostActivityProxy *)self iconImageSlotID];
  uint64_t v6 = [(_UIHostActivityProxy *)self labelSlotID];
  if (self->_isDisabled) {
    CFStringRef v7 = @"YES";
  }
  else {
    CFStringRef v7 = @"NO";
  }
  if (self->_isFavorite) {
    CFStringRef v8 = @"YES";
  }
  else {
    CFStringRef v8 = @"NO";
  }
  if (self->_isRestricted) {
    CFStringRef v9 = @"YES";
  }
  else {
    CFStringRef v9 = @"NO";
  }
  if (self->_isUserDefaultsActivity) {
    CFStringRef v10 = @"YES";
  }
  else {
    CFStringRef v10 = @"NO";
  }
  long long v15 = *(_OWORD *)&self->_activityIdentifierShare;
  activityIdentifierCopy = self->_activityIdentifierCopy;
  [(_UIHostActivityProxy *)self slotTextHeight];
  uint64_t v13 = +[NSString stringWithFormat:@"<%@: identifier:%@ activity:%@ iconImageSlotID:%u, textSlot:%u, isDisabled:%@, isFavorite:%@, isRestricted:%@, isUserDefaultsActivity:%@, activityIdentifierShare:%@, activityIdentifierOpen:%@, activityIdentifierCopy:%@, textHeight:%f, activityTitle:%@, activityFooter:%@, bundleIdentifier:%@>", v3, v4, activity, v5, v6, v7, v8, v9, v10, v15, activityIdentifierCopy, v12, self->_activityTitle, self->_activityFooter, self->_applicationBundleIdentifier];

  return (NSString *)v13;
}

- (unint64_t)hash
{
  v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  unint64_t v5 = (unint64_t)[v4 hash];

  uint64_t v6 = [(_UIHostActivityProxy *)self identifier];
  unint64_t v7 = (unint64_t)[v6 hash] ^ v5;

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (_UIHostActivityProxy *)a3;
  if (self == v4)
  {
    unsigned __int8 v12 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unint64_t v5 = v4;
      uint64_t v6 = [(_UIHostActivityProxy *)self identifier];
      unint64_t v7 = [(_UIHostActivityProxy *)v5 identifier];
      id v8 = v6;
      id v9 = v7;
      CFStringRef v10 = v9;
      if (v8 == v9)
      {
      }
      else
      {
        if ((v8 == 0) == (v9 != 0))
        {
          unsigned __int8 v12 = 0;
          uint64_t v19 = v9;
          id v20 = v8;
LABEL_18:

          goto LABEL_19;
        }
        unsigned int v11 = [v8 isEqual:v9];

        if (!v11)
        {
LABEL_16:
          unsigned __int8 v12 = 0;
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
      unsigned int v15 = [(_UIHostActivityProxy *)self isDisabled];
      if (v15 != [(_UIHostActivityProxy *)v5 isDisabled]) {
        goto LABEL_16;
      }
      unsigned int v16 = [(_UIHostActivityProxy *)self isFavorite];
      if (v16 != [(_UIHostActivityProxy *)v5 isFavorite]) {
        goto LABEL_16;
      }
      unsigned int v17 = [(_UIHostActivityProxy *)self isRestricted];
      if (v17 != [(_UIHostActivityProxy *)v5 isRestricted]) {
        goto LABEL_16;
      }
      unsigned int v18 = [(_UIHostActivityProxy *)self isUserDefaultsActivity];
      if (v18 != [(_UIHostActivityProxy *)v5 isUserDefaultsActivity]) {
        goto LABEL_16;
      }
      unsigned int v22 = [(_UIHostActivityProxy *)self activityIdentifierShare];
      v23 = [(_UIHostActivityProxy *)v5 activityIdentifierShare];
      id v20 = v22;
      id v24 = v23;
      uint64_t v19 = v24;
      if (v20 == v24)
      {
      }
      else
      {
        if ((v20 == 0) == (v24 != 0))
        {
          unsigned __int8 v12 = 0;
          v30 = v24;
          id v28 = v20;
          goto LABEL_65;
        }
        unsigned int v25 = [v20 isEqual:v24];

        if (!v25)
        {
          unsigned __int8 v12 = 0;
          goto LABEL_18;
        }
      }
      id v26 = [(_UIHostActivityProxy *)self activityIdentifierOpen];
      id v27 = [(_UIHostActivityProxy *)v5 activityIdentifierOpen];
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
          unsigned __int8 v12 = 0;
          v40 = v29;
          id v34 = v28;
LABEL_64:

          goto LABEL_65;
        }
        unsigned int v31 = [v28 isEqual:v29];

        if (!v31)
        {
          unsigned __int8 v12 = 0;
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
          unsigned __int8 v12 = 0;
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
        unsigned int v65 = [v37 isEqual:v36];

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
        unsigned __int8 v12 = 0;
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
          unsigned __int8 v12 = 0;
          id v52 = v45;
          v30 = v69;
LABEL_61:

          goto LABEL_62;
        }
        v48 = v46;
        unsigned int v61 = [v45 isEqual:v46];

        if (!v61)
        {
          unsigned __int8 v12 = 0;
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
          unsigned __int8 v12 = 0;
          id v58 = v52;
LABEL_59:

          goto LABEL_60;
        }
        unsigned int v55 = [v52 isEqual:v53];

        if (!v55)
        {
          unsigned __int8 v12 = 0;
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
        unsigned __int8 v12 = 1;
      }
      else if ((v58 == 0) == (v59 != 0))
      {
        unsigned __int8 v12 = 0;
      }
      else
      {
        unsigned __int8 v12 = [v58 isEqual:v59];
      }

      goto LABEL_59;
    }
    unsigned __int8 v12 = 0;
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

@end