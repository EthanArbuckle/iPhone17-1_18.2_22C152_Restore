@interface SBSFocusModesHomeScreenSnapshot
+ (BOOL)supportsBSXPCSecureCoding;
- (BOOL)wantsListVisible;
- (BSMachPortSendRight)machPortSendRight;
- (NSString)focusModeIdentifier;
- (NSString)listIdentifier;
- (SBSFocusModesHomeScreenSnapshot)initWithBSXPCCoder:(id)a3;
- (SBSFocusModesHomeScreenSnapshot)initWithListIdentifier:(id)a3 focusModeIdentifier:(id)a4 machPortSendRight:(id)a5;
- (void)encodeWithBSXPCCoder:(id)a3;
- (void)setFocusModeIdentifier:(id)a3;
- (void)setListIdentifier:(id)a3;
- (void)setMachPortSendRight:(id)a3;
- (void)setWantsListVisible:(BOOL)a3;
@end

@implementation SBSFocusModesHomeScreenSnapshot

- (SBSFocusModesHomeScreenSnapshot)initWithListIdentifier:(id)a3 focusModeIdentifier:(id)a4 machPortSendRight:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)SBSFocusModesHomeScreenSnapshot;
  v11 = [(SBSFocusModesHomeScreenSnapshot *)&v19 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    listIdentifier = v11->_listIdentifier;
    v11->_listIdentifier = (NSString *)v12;

    uint64_t v14 = [v9 copy];
    focusModeIdentifier = v11->_focusModeIdentifier;
    v11->_focusModeIdentifier = (NSString *)v14;

    uint64_t v16 = [v10 copy];
    machPortSendRight = v11->_machPortSendRight;
    v11->_machPortSendRight = (BSMachPortSendRight *)v16;
  }
  return v11;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  listIdentifier = self->_listIdentifier;
  id v5 = a3;
  [v5 encodeObject:listIdentifier forKey:@"listIdentifier"];
  [v5 encodeObject:self->_focusModeIdentifier forKey:@"focusModeIdentifier"];
  [v5 encodeObject:self->_machPortSendRight forKey:@"machPortSendRight"];
  [v5 encodeBool:self->_wantsListVisible forKey:@"wantsListVisible"];
}

- (SBSFocusModesHomeScreenSnapshot)initWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeStringForKey:@"listIdentifier"];
  v6 = [v4 decodeStringForKey:@"focusModeIdentifier"];
  uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"machPortSendRight"];
  id v8 = (void *)v7;
  id v9 = 0;
  if (v5 && v6 && v7)
  {
    id v10 = [(SBSFocusModesHomeScreenSnapshot *)self initWithListIdentifier:v5 focusModeIdentifier:v6 machPortSendRight:v7];
    -[SBSFocusModesHomeScreenSnapshot setWantsListVisible:](v10, "setWantsListVisible:", [v4 decodeBoolForKey:@"wantsListVisible"]);
    self = v10;
    id v9 = self;
  }

  return v9;
}

- (NSString)listIdentifier
{
  return self->_listIdentifier;
}

- (void)setListIdentifier:(id)a3
{
}

- (NSString)focusModeIdentifier
{
  return self->_focusModeIdentifier;
}

- (void)setFocusModeIdentifier:(id)a3
{
}

- (BSMachPortSendRight)machPortSendRight
{
  return self->_machPortSendRight;
}

- (void)setMachPortSendRight:(id)a3
{
}

- (BOOL)wantsListVisible
{
  return self->_wantsListVisible;
}

- (void)setWantsListVisible:(BOOL)a3
{
  self->_wantsListVisible = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_machPortSendRight, 0);
  objc_storeStrong((id *)&self->_focusModeIdentifier, 0);
  objc_storeStrong((id *)&self->_listIdentifier, 0);
}

@end