@interface CKInboxItem
- (CKInboxItem)initWithTitle:(id)a3 subtitle:(id)a4 systemImage:(id)a5 accessoryText:(id)a6 filterMode:(id)a7 action:(id)a8;
- (CKInboxItemSwift)inboxItemSwift;
- (NSNumber)filterMode;
- (NSUUID)identifier;
- (id)action;
- (id)description;
- (void)setAction:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setInboxItemSwift:(id)a3;
- (void)updateAccessory:(id)a3;
@end

@implementation CKInboxItem

- (CKInboxItem)initWithTitle:(id)a3 subtitle:(id)a4 systemImage:(id)a5 accessoryText:(id)a6 filterMode:(id)a7 action:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  v30.receiver = self;
  v30.super_class = (Class)CKInboxItem;
  v20 = [(CKInboxItem *)&v30 init];
  if (v20)
  {
    v21 = (NSUUID *)objc_alloc_init(MEMORY[0x1E4F29128]);
    identifier = v20->_identifier;
    v20->_identifier = v21;

    uint64_t v23 = [v19 copy];
    id action = v20->_action;
    v20->_id action = (id)v23;

    uint64_t v25 = [v18 copy];
    filterMode = v20->_filterMode;
    v20->_filterMode = (NSNumber *)v25;

    v27 = [[CKInboxItemSwift alloc] initWithIdentifier:v20->_identifier title:v14 subtitle:v15 systemImage:v16 accessoryText:v17];
    inboxItemSwift = v20->_inboxItemSwift;
    v20->_inboxItemSwift = v27;
  }
  return v20;
}

- (void)updateAccessory:(id)a3
{
  id v4 = a3;
  id v5 = [(CKInboxItem *)self inboxItemSwift];
  [v5 updateWithAccessoryText:v4];
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<CKInboxItem i:%@, swift:%@>", self->_identifier, self->_inboxItemSwift];
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSNumber)filterMode
{
  return self->_filterMode;
}

- (id)action
{
  return self->_action;
}

- (void)setAction:(id)a3
{
}

- (CKInboxItemSwift)inboxItemSwift
{
  return self->_inboxItemSwift;
}

- (void)setInboxItemSwift:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inboxItemSwift, 0);
  objc_storeStrong(&self->_action, 0);
  objc_storeStrong((id *)&self->_filterMode, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end