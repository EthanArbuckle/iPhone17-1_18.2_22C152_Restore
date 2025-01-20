@interface _UIUserDefaultsActivityProxy
+ (BOOL)supportsSecureCoding;
- (BOOL)canEdit;
- (BOOL)canHide;
- (BOOL)canMove;
- (BOOL)isDisabled;
- (BOOL)isHidden;
- (NSString)applicationBundleIdentifier;
- (NSUUID)identifier;
- (SFProxyText)activityTitle;
- (_UIUserDefaultsActivityProxy)initWithCoder:(id)a3;
- (_UIUserDefaultsActivityProxy)initWithIdentifier:(id)a3;
- (id)labelSlot;
- (unsigned)iconImageSlotID;
- (void)encodeWithCoder:(id)a3;
- (void)setActivityTitle:(id)a3;
- (void)setApplicationBundleIdentifier:(id)a3;
- (void)setCanEdit:(BOOL)a3;
- (void)setCanHide:(BOOL)a3;
- (void)setCanMove:(BOOL)a3;
- (void)setIconImageSlotID:(unsigned int)a3;
- (void)setIsDisabled:(BOOL)a3;
- (void)setIsHidden:(BOOL)a3;
@end

@implementation _UIUserDefaultsActivityProxy

- (_UIUserDefaultsActivityProxy)initWithIdentifier:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_UIUserDefaultsActivityProxy;
  v5 = [(_UIUserDefaultsActivityProxy *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    identifier = v5->_identifier;
    v5->_identifier = (NSUUID *)v6;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_UIUserDefaultsActivityProxy)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(_UIUserDefaultsActivityProxy *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSUUID *)v6;

    v5->_isDisabled = [v4 decodeBoolForKey:@"isDisabled"];
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"activityTitle"];
    activityTitle = v5->_activityTitle;
    v5->_activityTitle = (SFProxyText *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"applicationBundleIdentifier"];
    applicationBundleIdentifier = v5->_applicationBundleIdentifier;
    v5->_applicationBundleIdentifier = (NSString *)v10;

    v5->_iconImageSlotID = [v4 decodeInt32ForKey:@"iconImageSlotID"];
    v5->_canEdit = [v4 decodeBoolForKey:@"canEdit"];
    v5->_canMove = [v4 decodeBoolForKey:@"canMove"];
    v5->_canHide = [v4 decodeBoolForKey:@"canHide"];
    v5->_isHidden = [v4 decodeBoolForKey:@"isHidden"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v5 = a3;
  [v5 encodeObject:identifier forKey:@"identifier"];
  [v5 encodeBool:self->_isDisabled forKey:@"isDisabled"];
  [v5 encodeObject:self->_activityTitle forKey:@"activityTitle"];
  [v5 encodeObject:self->_applicationBundleIdentifier forKey:@"applicationBundleIdentifier"];
  [v5 encodeInt32:self->_iconImageSlotID forKey:@"iconImageSlotID"];
  [v5 encodeBool:self->_canEdit forKey:@"canEdit"];
  [v5 encodeBool:self->_canMove forKey:@"canMove"];
  [v5 encodeBool:self->_canHide forKey:@"canHide"];
  [v5 encodeBool:self->_isHidden forKey:@"isHidden"];
}

- (id)labelSlot
{
  v2 = (void *)MEMORY[0x1E4F28ED0];
  v3 = [(_UIUserDefaultsActivityProxy *)self activityTitle];
  id v4 = objc_msgSend(v2, "numberWithUnsignedInt:", objc_msgSend(v3, "slotIdentifier"));

  return v4;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (BOOL)isDisabled
{
  return self->_isDisabled;
}

- (void)setIsDisabled:(BOOL)a3
{
  self->_isDisabled = a3;
}

- (SFProxyText)activityTitle
{
  return self->_activityTitle;
}

- (void)setActivityTitle:(id)a3
{
}

- (NSString)applicationBundleIdentifier
{
  return self->_applicationBundleIdentifier;
}

- (void)setApplicationBundleIdentifier:(id)a3
{
}

- (unsigned)iconImageSlotID
{
  return self->_iconImageSlotID;
}

- (void)setIconImageSlotID:(unsigned int)a3
{
  self->_iconImageSlotID = a3;
}

- (BOOL)canEdit
{
  return self->_canEdit;
}

- (void)setCanEdit:(BOOL)a3
{
  self->_canEdit = a3;
}

- (BOOL)canMove
{
  return self->_canMove;
}

- (void)setCanMove:(BOOL)a3
{
  self->_canMove = a3;
}

- (BOOL)canHide
{
  return self->_canHide;
}

- (void)setCanHide:(BOOL)a3
{
  self->_canHide = a3;
}

- (BOOL)isHidden
{
  return self->_isHidden;
}

- (void)setIsHidden:(BOOL)a3
{
  self->_isHidden = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applicationBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_activityTitle, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end