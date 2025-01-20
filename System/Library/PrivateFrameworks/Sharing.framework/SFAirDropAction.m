@interface SFAirDropAction
+ (BOOL)supportsSecureCoding;
+ (id)testActionWithTitle:(id)a3 actionHandler:(id)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)requiresUnlockedUI;
- (BOOL)shouldUpdateUserResponse;
- (NSString)actionIdentifier;
- (NSString)localizedTitle;
- (NSString)singleItemLocalizedTitle;
- (NSString)transferIdentifier;
- (SFAirDropAction)initWithCoder:(id)a3;
- (SFAirDropAction)initWithTransferIdentifier:(id)a3 actionIdentifier:(id)a4 title:(id)a5 singleItemTitle:(id)a6 type:(int64_t)a7;
- (SFAirDropAction)initWithTransferIdentifier:(id)a3 actionIdentifier:(id)a4 title:(id)a5 singleItemTitle:(id)a6 type:(int64_t)a7 handler:(id)a8;
- (id)actionHandler;
- (id)description;
- (int64_t)type;
- (unint64_t)hash;
- (unint64_t)maxTransferState;
- (unint64_t)minRequiredTransferState;
- (void)encodeWithCoder:(id)a3;
- (void)setActionHandler:(id)a3;
- (void)setLocalizedTitle:(id)a3;
- (void)setMaxTransferState:(unint64_t)a3;
- (void)setMinRequiredTransferState:(unint64_t)a3;
- (void)setRequiresUnlockedUI:(BOOL)a3;
- (void)setShouldUpdateUserResponse:(BOOL)a3;
- (void)setSingleItemLocalizedTitle:(id)a3;
- (void)setType:(int64_t)a3;
- (void)triggerAction;
@end

@implementation SFAirDropAction

- (SFAirDropAction)initWithTransferIdentifier:(id)a3 actionIdentifier:(id)a4 title:(id)a5 singleItemTitle:(id)a6 type:(int64_t)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  v27.receiver = self;
  v27.super_class = (Class)SFAirDropAction;
  v16 = [(SFAirDropAction *)&v27 init];
  v17 = v16;
  if (v16)
  {
    v16->_type = a7;
    uint64_t v18 = [v12 copy];
    transferIdentifier = v17->_transferIdentifier;
    v17->_transferIdentifier = (NSString *)v18;

    uint64_t v20 = [v13 copy];
    actionIdentifier = v17->_actionIdentifier;
    v17->_actionIdentifier = (NSString *)v20;

    uint64_t v22 = [v14 copy];
    localizedTitle = v17->_localizedTitle;
    v17->_localizedTitle = (NSString *)v22;

    uint64_t v24 = [v15 copy];
    singleItemLocalizedTitle = v17->_singleItemLocalizedTitle;
    v17->_singleItemLocalizedTitle = (NSString *)v24;

    *(_OWORD *)&v17->_minRequiredTransferState = xmmword_1A56EA450;
    *(_WORD *)&v17->_requiresUnlockedUI = 257;
  }

  return v17;
}

- (SFAirDropAction)initWithTransferIdentifier:(id)a3 actionIdentifier:(id)a4 title:(id)a5 singleItemTitle:(id)a6 type:(int64_t)a7 handler:(id)a8
{
  id v14 = a8;
  id v15 = [(SFAirDropAction *)self initWithTransferIdentifier:a3 actionIdentifier:a4 title:a5 singleItemTitle:a6 type:a7];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __98__SFAirDropAction_initWithTransferIdentifier_actionIdentifier_title_singleItemTitle_type_handler___block_invoke;
  v18[3] = &unk_1E5BBE568;
  id v19 = v14;
  id v16 = v14;
  [(SFAirDropAction *)v15 setActionHandler:v18];

  return v15;
}

uint64_t __98__SFAirDropAction_initWithTransferIdentifier_actionIdentifier_title_singleItemTitle_type_handler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFAirDropAction)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(SFAirDropAction *)self initWithTransferIdentifier:&stru_1EF9BDC68 actionIdentifier:&stru_1EF9BDC68 title:&stru_1EF9BDC68 singleItemTitle:&stru_1EF9BDC68 type:1];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"transferIdentifier"];
    uint64_t v7 = [v6 copy];
    transferIdentifier = v5->_transferIdentifier;
    v5->_transferIdentifier = (NSString *)v7;

    v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"actionIdentifier"];
    uint64_t v10 = [v9 copy];
    actionIdentifier = v5->_actionIdentifier;
    v5->_actionIdentifier = (NSString *)v10;

    id v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"localizedTitle"];
    uint64_t v13 = [v12 copy];
    localizedTitle = v5->_localizedTitle;
    v5->_localizedTitle = (NSString *)v13;

    id v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"singleItemLocalizedTitle"];
    uint64_t v16 = [v15 copy];
    singleItemLocalizedTitle = v5->_singleItemLocalizedTitle;
    v5->_singleItemLocalizedTitle = (NSString *)v16;

    v5->_minRequiredTransferState = [v4 decodeIntegerForKey:@"minRequiredTransferState"];
    v5->_maxTransferState = [v4 decodeIntegerForKey:@"maxTransferState"];
    v5->_requiresUnlockedUI = [v4 decodeBoolForKey:@"requiresUnlockedUI"];
    v5->_shouldUpdateUserResponse = [v4 decodeBoolForKey:@"shouldUpdateUserResponse"];
    v5->_type = [v4 decodeIntegerForKey:@"type"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  transferIdentifier = self->_transferIdentifier;
  id v5 = a3;
  [v5 encodeObject:transferIdentifier forKey:@"transferIdentifier"];
  [v5 encodeObject:self->_actionIdentifier forKey:@"actionIdentifier"];
  [v5 encodeObject:self->_localizedTitle forKey:@"localizedTitle"];
  [v5 encodeObject:self->_singleItemLocalizedTitle forKey:@"singleItemLocalizedTitle"];
  [v5 encodeInteger:self->_minRequiredTransferState forKey:@"minRequiredTransferState"];
  [v5 encodeInteger:self->_maxTransferState forKey:@"maxTransferState"];
  [v5 encodeBool:self->_requiresUnlockedUI forKey:@"requiresUnlockedUI"];
  [v5 encodeBool:self->_shouldUpdateUserResponse forKey:@"shouldUpdateUserResponse"];
  [v5 encodeInteger:self->_type forKey:@"type"];
}

- (id)description
{
  objc_opt_class();
  NSAppendPrintF();
  id v14 = 0;
  NSAppendPrintF();
  id v3 = v14;

  NSAppendPrintF();
  id v4 = v3;

  NSAppendPrintF();
  id v5 = v4;

  NSAppendPrintF();
  id v6 = v5;

  uint64_t v7 = SFAirDropTransferStateToString(self->_minRequiredTransferState);
  uint64_t v13 = SFAirDropTransferStateToString(self->_maxTransferState);
  NSAppendPrintF();
  id v8 = v6;

  NSAppendPrintF();
  id v9 = v8;

  NSAppendPrintF();
  id v10 = v9;

  NSAppendPrintF();
  id v11 = v10;

  return v11;
}

- (unint64_t)hash
{
  id v3 = [(SFAirDropAction *)self transferIdentifier];
  uint64_t v4 = [v3 hash];
  id v5 = [(SFAirDropAction *)self actionIdentifier];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    unint64_t v6 = [(SFAirDropAction *)self transferIdentifier];
    uint64_t v7 = [v5 transferIdentifier];
    if ([v6 isEqual:v7])
    {
      id v8 = [(SFAirDropAction *)self actionIdentifier];
      id v9 = [v5 actionIdentifier];
      char v10 = [v8 isEqual:v9];
    }
    else
    {
      char v10 = 0;
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (void)triggerAction
{
  id v4 = [(SFAirDropAction *)self transferIdentifier];

  if (!v4)
  {
    uint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"SFAirDropAction.m" lineNumber:117 description:@"Cannot trigger action on action not associated with a Transfer"];
  }
  id location = 0;
  objc_initWeak(&location, self);
  id v5 = [(SFAirDropAction *)self actionHandler];
  id v6 = objc_loadWeakRetained(&location);
  ((void (**)(void, id))v5)[2](v5, v6);

  objc_destroyWeak(&location);
}

+ (id)testActionWithTitle:(id)a3 actionHandler:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = [SFAirDropAction alloc];
  id v8 = [MEMORY[0x1E4F29128] UUID];
  id v9 = [v8 UUIDString];
  char v10 = [MEMORY[0x1E4F29128] UUID];
  id v11 = [v10 UUIDString];
  id v12 = [(SFAirDropAction *)v7 initWithTransferIdentifier:v9 actionIdentifier:v11 title:v6 singleItemTitle:v6 type:1];

  [(SFAirDropAction *)v12 setActionHandler:v5];

  return v12;
}

- (NSString)localizedTitle
{
  return self->_localizedTitle;
}

- (void)setLocalizedTitle:(id)a3
{
}

- (NSString)singleItemLocalizedTitle
{
  return self->_singleItemLocalizedTitle;
}

- (void)setSingleItemLocalizedTitle:(id)a3
{
}

- (NSString)actionIdentifier
{
  return self->_actionIdentifier;
}

- (NSString)transferIdentifier
{
  return self->_transferIdentifier;
}

- (unint64_t)minRequiredTransferState
{
  return self->_minRequiredTransferState;
}

- (void)setMinRequiredTransferState:(unint64_t)a3
{
  self->_minRequiredTransferState = a3;
}

- (unint64_t)maxTransferState
{
  return self->_maxTransferState;
}

- (void)setMaxTransferState:(unint64_t)a3
{
  self->_maxTransferState = a3;
}

- (BOOL)requiresUnlockedUI
{
  return self->_requiresUnlockedUI;
}

- (void)setRequiresUnlockedUI:(BOOL)a3
{
  self->_requiresUnlockedUI = a3;
}

- (BOOL)shouldUpdateUserResponse
{
  return self->_shouldUpdateUserResponse;
}

- (void)setShouldUpdateUserResponse:(BOOL)a3
{
  self->_shouldUpdateUserResponse = a3;
}

- (id)actionHandler
{
  return self->_actionHandler;
}

- (void)setActionHandler:(id)a3
{
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_actionHandler, 0);
  objc_storeStrong((id *)&self->_transferIdentifier, 0);
  objc_storeStrong((id *)&self->_actionIdentifier, 0);
  objc_storeStrong((id *)&self->_singleItemLocalizedTitle, 0);

  objc_storeStrong((id *)&self->_localizedTitle, 0);
}

@end