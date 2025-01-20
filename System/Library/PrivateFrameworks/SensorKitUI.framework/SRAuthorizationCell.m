@interface SRAuthorizationCell
+ (id)authorizationCellForIndexPath:(id)a3 title:(id)a4 state:(id)a5 delegate:(id)a6 tableView:(id)a7;
- (NSIndexPath)indexPath;
- (SRAuthorizationCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (SRAuthorizationCellDelegate)delegate;
- (UISwitch)toggle;
- (void)dealloc;
- (void)setDelegate:(id)a3;
- (void)setIndexPath:(id)a3;
- (void)setToggle:(id)a3;
- (void)switchChanged;
@end

@implementation SRAuthorizationCell

- (SRAuthorizationCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)SRAuthorizationCell;
  v4 = [(SRAuthorizationCell *)&v7 initWithStyle:a3 reuseIdentifier:a4];
  v5 = v4;
  if (v4)
  {
    [(SRAuthorizationCell *)v4 setSelectionStyle:0];
    -[SRAuthorizationCell setToggle:](v5, "setToggle:", (id)objc_msgSend(objc_alloc(MEMORY[0x263F1CA10]), "initWithFrame:", 0.0, 0.0, 0.0, 0.0));
    [(UISwitch *)[(SRAuthorizationCell *)v5 toggle] addTarget:v5 action:sel_switchChanged forControlEvents:4096];
    [(SRAuthorizationCell *)v5 setAccessoryView:[(SRAuthorizationCell *)v5 toggle]];
    objc_msgSend((id)-[SRAuthorizationCell textLabel](v5, "textLabel"), "setLineBreakMode:", 0);
    objc_msgSend((id)-[SRAuthorizationCell textLabel](v5, "textLabel"), "setNumberOfLines:", 0);
    objc_msgSend((id)-[SRAuthorizationCell detailTextLabel](v5, "detailTextLabel"), "setLineBreakMode:", 0);
    objc_msgSend((id)-[SRAuthorizationCell detailTextLabel](v5, "detailTextLabel"), "setNumberOfLines:", 0);
  }
  return v5;
}

- (void)dealloc
{
  [(SRAuthorizationCell *)self setIndexPath:0];
  [(SRAuthorizationCell *)self setToggle:0];
  v3.receiver = self;
  v3.super_class = (Class)SRAuthorizationCell;
  [(SRAuthorizationCell *)&v3 dealloc];
}

- (void)switchChanged
{
  objc_super v3 = [(SRAuthorizationCell *)self delegate];
  BOOL v4 = [(UISwitch *)[(SRAuthorizationCell *)self toggle] isOn];
  v5 = [(SRAuthorizationCell *)self indexPath];
  [(SRAuthorizationCellDelegate *)v3 authorizationSwitchToggledWithValue:v4 indexPath:v5];
}

+ (id)authorizationCellForIndexPath:(id)a3 title:(id)a4 state:(id)a5 delegate:(id)a6 tableView:(id)a7
{
  v11 = (SRAuthorizationCell *)[a7 dequeueReusableCellWithIdentifier:@"SRAuthorizationSwitchRowReuseIdentifier"];
  if (!v11) {
    v11 = [[SRAuthorizationCell alloc] initWithStyle:0 reuseIdentifier:@"SRAuthorizationSwitchRowReuseIdentifier"];
  }
  objc_msgSend((id)-[SRAuthorizationCell textLabel](v11, "textLabel"), "setText:", a4);
  [(SRAuthorizationCell *)v11 setDelegate:a6];
  [(SRAuthorizationCell *)v11 setIndexPath:a3];
  -[UISwitch setOn:](-[SRAuthorizationCell toggle](v11, "toggle"), "setOn:", [a5 BOOLValue]);
  return v11;
}

- (UISwitch)toggle
{
  return self->_toggle;
}

- (void)setToggle:(id)a3
{
}

- (NSIndexPath)indexPath
{
  return self->_indexPath;
}

- (void)setIndexPath:(id)a3
{
}

- (SRAuthorizationCellDelegate)delegate
{
  return (SRAuthorizationCellDelegate *)objc_loadWeak((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end