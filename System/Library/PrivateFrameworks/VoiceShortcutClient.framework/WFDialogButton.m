@interface WFDialogButton
+ (BOOL)supportsSecureCoding;
+ (id)cancelButton;
+ (id)defaultButtonWithTitle:(id)a3;
+ (id)doneButton;
+ (id)okButton;
+ (id)selectButton;
+ (id)startButton;
- (NSString)identifier;
- (NSString)title;
- (WFDialogButton)initWithCoder:(id)a3;
- (WFDialogButton)initWithIdentifier:(id)a3 title:(id)a4 style:(int64_t)a5;
- (WFDialogButton)initWithTitle:(id)a3 style:(int64_t)a4;
- (int64_t)style;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WFDialogButton

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (int64_t)style
{
  return self->_style;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  v4 = [(WFDialogButton *)self identifier];
  [v6 encodeObject:v4 forKey:@"identifier"];

  v5 = [(WFDialogButton *)self title];
  [v6 encodeObject:v5 forKey:@"title"];

  objc_msgSend(v6, "encodeInteger:forKey:", -[WFDialogButton style](self, "style"), @"style");
}

- (WFDialogButton)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)WFDialogButton;
  v5 = [(WFDialogButton *)&v12 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"title"];
    title = v5->_title;
    v5->_title = (NSString *)v8;

    v5->_style = [v4 decodeIntegerForKey:@"style"];
    v10 = v5;
  }

  return v5;
}

- (WFDialogButton)initWithTitle:(id)a3 style:(int64_t)a4
{
  uint64_t v6 = (void *)MEMORY[0x1E4F29128];
  id v7 = a3;
  uint64_t v8 = [v6 UUID];
  v9 = [v8 UUIDString];
  v10 = [(WFDialogButton *)self initWithIdentifier:v9 title:v7 style:a4];

  return v10;
}

- (WFDialogButton)initWithIdentifier:(id)a3 title:(id)a4 style:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v17.receiver = self;
  v17.super_class = (Class)WFDialogButton;
  v10 = [(WFDialogButton *)&v17 init];
  if (v10)
  {
    uint64_t v11 = [v8 copy];
    identifier = v10->_identifier;
    v10->_identifier = (NSString *)v11;

    uint64_t v13 = [v9 copy];
    title = v10->_title;
    v10->_title = (NSString *)v13;

    v10->_style = a5;
    v15 = v10;
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)cancelButton
{
  v2 = [WFDialogButton alloc];
  v3 = WFLocalizedString(@"Cancel");
  id v4 = [(WFDialogButton *)v2 initWithTitle:v3 style:1];

  return v4;
}

+ (id)selectButton
{
  v2 = [WFDialogButton alloc];
  v3 = WFLocalizedString(@"Select");
  id v4 = [(WFDialogButton *)v2 initWithTitle:v3 style:0];

  return v4;
}

+ (id)okButton
{
  v2 = [WFDialogButton alloc];
  v3 = WFLocalizedString(@"OK");
  id v4 = [(WFDialogButton *)v2 initWithTitle:v3 style:0];

  return v4;
}

+ (id)startButton
{
  v2 = [WFDialogButton alloc];
  v3 = WFLocalizedString(@"Start");
  id v4 = [(WFDialogButton *)v2 initWithTitle:v3 style:0];

  return v4;
}

+ (id)doneButton
{
  v2 = [WFDialogButton alloc];
  v3 = WFLocalizedString(@"Done");
  id v4 = [(WFDialogButton *)v2 initWithTitle:v3 style:0];

  return v4;
}

+ (id)defaultButtonWithTitle:(id)a3
{
  id v3 = a3;
  id v4 = [[WFDialogButton alloc] initWithTitle:v3 style:0];

  return v4;
}

@end