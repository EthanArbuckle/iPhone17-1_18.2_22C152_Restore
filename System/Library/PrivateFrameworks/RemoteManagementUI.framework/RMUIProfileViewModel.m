@interface RMUIProfileViewModel
+ (BOOL)supportsSecureCoding;
- (BOOL)isInteractiveProfile;
- (NSString)interactiveDetailsText;
- (NSString)profileIdentifier;
- (NSString)title;
- (NSString)value;
- (RMModelDeclarationBase)declaration;
- (RMUIInteractiveProfileFooterViewModel)footerViewModel;
- (RMUIInteractiveProfileToggleViewModel)toggleViewModel;
- (RMUIProfileViewModel)init;
- (RMUIProfileViewModel)initWithCoder:(id)a3;
- (signed)symbol;
- (void)clearModel;
- (void)encodeWithCoder:(id)a3;
- (void)setDeclaration:(id)a3;
- (void)setFooterViewModel:(id)a3;
- (void)setInteractiveDetailsText:(id)a3;
- (void)setInteractiveProfileActive:(BOOL)a3 profileIdentifier:(id)a4;
- (void)setIsInteractiveProfile:(BOOL)a3;
- (void)setProfileIdentifier:(id)a3;
- (void)setSymbol:(signed __int16)a3;
- (void)setTitle:(id)a3;
- (void)setToggleViewModel:(id)a3;
- (void)setValue:(id)a3;
@end

@implementation RMUIProfileViewModel

- (RMUIProfileViewModel)init
{
  v8.receiver = self;
  v8.super_class = (Class)RMUIProfileViewModel;
  v2 = [(RMUIProfileViewModel *)&v8 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    toggleViewModel = v2->_toggleViewModel;
    v2->_toggleViewModel = (RMUIInteractiveProfileToggleViewModel *)v3;

    uint64_t v5 = objc_opt_new();
    footerViewModel = v2->_footerViewModel;
    v2->_footerViewModel = (RMUIInteractiveProfileFooterViewModel *)v5;
  }
  return v2;
}

- (void)setInteractiveProfileActive:(BOOL)a3 profileIdentifier:(id)a4
{
  BOOL v4 = a3;
  [(RMUIProfileViewModel *)self setProfileIdentifier:a4];
  if (v4) {
    v6 = @"RMUI_PROFILE_ON";
  }
  else {
    v6 = @"RMUI_PROFILE_OFF";
  }
  v7 = +[RMUILocalizable string:v6];
  [(RMUIProfileViewModel *)self setValue:v7];

  objc_super v8 = [(RMUIProfileViewModel *)self toggleViewModel];
  [v8 setToggleState:v4];

  if (v4)
  {
    v9 = +[RMUILocalizable string:@"RMUI_PROFILE_DETAILS"];
    [(RMUIProfileViewModel *)self setInteractiveDetailsText:v9];

    id v12 = [(RMUIProfileViewModel *)self footerViewModel];
    [v12 setTitle:0];
  }
  else
  {
    v10 = +[RMUILocalizable string:@"RMUI_PROFILE_INSTALL_MESSAGE"];
    v11 = [(RMUIProfileViewModel *)self footerViewModel];
    [v11 setTitle:v10];

    [(RMUIProfileViewModel *)self setInteractiveDetailsText:0];
  }
}

- (void)clearModel
{
  [(RMUIProfileViewModel *)self setTitle:0];
  [(RMUIProfileViewModel *)self setSymbol:0];
  [(RMUIProfileViewModel *)self setValue:0];
  [(RMUIProfileViewModel *)self setProfileIdentifier:0];
  [(RMUIProfileViewModel *)self setDeclaration:0];

  [(RMUIProfileViewModel *)self setIsInteractiveProfile:0];
}

- (BOOL)isInteractiveProfile
{
  return self->_isInteractiveProfile;
}

- (void)setIsInteractiveProfile:(BOOL)a3
{
  self->_isInteractiveProfile = a3;
  if (!a3)
  {
    [(RMUIProfileViewModel *)self setInteractiveDetailsText:0];
    BOOL v4 = [(RMUIProfileViewModel *)self toggleViewModel];
    [v4 clearModel];

    id v5 = [(RMUIProfileViewModel *)self footerViewModel];
    [v5 clearModel];
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  BOOL v4 = NSNumber;
  id v5 = a3;
  v6 = objc_msgSend(v4, "numberWithShort:", -[RMUIProfileViewModel symbol](self, "symbol"));
  [v5 encodeObject:v6 forKey:@"symbol"];

  v7 = [(RMUIProfileViewModel *)self title];
  [v5 encodeObject:v7 forKey:@"title"];

  objc_super v8 = [(RMUIProfileViewModel *)self value];
  [v5 encodeObject:v8 forKey:@"value"];

  v9 = [(RMUIProfileViewModel *)self profileIdentifier];
  [v5 encodeObject:v9 forKey:@"profileIdentifier"];

  v10 = [(RMUIProfileViewModel *)self declaration];
  [v5 encodeObject:v10 forKey:@"declaration"];

  v11 = objc_msgSend(NSNumber, "numberWithBool:", -[RMUIProfileViewModel isInteractiveProfile](self, "isInteractiveProfile"));
  [v5 encodeObject:v11 forKey:@"isInteractiveProfile"];

  id v12 = [(RMUIProfileViewModel *)self interactiveDetailsText];
  [v5 encodeObject:v12 forKey:@"interactiveDetailsText"];

  v13 = [(RMUIProfileViewModel *)self toggleViewModel];
  [v5 encodeObject:v13 forKey:@"toggleViewModel"];

  id v14 = [(RMUIProfileViewModel *)self footerViewModel];
  [v5 encodeObject:v14 forKey:@"footerViewModel"];
}

- (RMUIProfileViewModel)initWithCoder:(id)a3
{
  id v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)RMUIProfileViewModel;
  id v5 = [(RMUIProfileViewModel *)&v30 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"symbol"];
    v5->_symbol = [v6 integerValue];

    v7 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v8 = [v4 decodeObjectOfClasses:v7 forKey:@"title"];
    title = v5->_title;
    v5->_title = (NSString *)v8;

    v10 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"value"];
    value = v5->_value;
    v5->_value = (NSString *)v11;

    v13 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v14 = [v4 decodeObjectOfClasses:v13 forKey:@"profileIdentifier"];
    profileIdentifier = v5->_profileIdentifier;
    v5->_profileIdentifier = (NSString *)v14;

    v16 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v17 = [v4 decodeObjectOfClasses:v16 forKey:@"declaration"];
    declaration = v5->_declaration;
    v5->_declaration = (RMModelDeclarationBase *)v17;

    v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"isInteractiveProfile"];
    v5->_isInteractiveProfile = [v19 BOOLValue];

    v20 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v21 = [v4 decodeObjectOfClasses:v20 forKey:@"interactiveDetailsText"];
    interactiveDetailsText = v5->_interactiveDetailsText;
    v5->_interactiveDetailsText = (NSString *)v21;

    v23 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v24 = [v4 decodeObjectOfClasses:v23 forKey:@"toggleViewModel"];
    toggleViewModel = v5->_toggleViewModel;
    v5->_toggleViewModel = (RMUIInteractiveProfileToggleViewModel *)v24;

    v26 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v27 = [v4 decodeObjectOfClasses:v26 forKey:@"footerViewModel"];
    footerViewModel = v5->_footerViewModel;
    v5->_footerViewModel = (RMUIInteractiveProfileFooterViewModel *)v27;
  }
  return v5;
}

- (signed)symbol
{
  return self->_symbol;
}

- (void)setSymbol:(signed __int16)a3
{
  self->_symbol = a3;
}

- (NSString)title
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setTitle:(id)a3
{
}

- (NSString)value
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setValue:(id)a3
{
}

- (NSString)profileIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setProfileIdentifier:(id)a3
{
}

- (RMModelDeclarationBase)declaration
{
  return (RMModelDeclarationBase *)objc_getProperty(self, a2, 40, 1);
}

- (void)setDeclaration:(id)a3
{
}

- (NSString)interactiveDetailsText
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setInteractiveDetailsText:(id)a3
{
}

- (RMUIInteractiveProfileToggleViewModel)toggleViewModel
{
  return (RMUIInteractiveProfileToggleViewModel *)objc_getProperty(self, a2, 56, 1);
}

- (void)setToggleViewModel:(id)a3
{
}

- (RMUIInteractiveProfileFooterViewModel)footerViewModel
{
  return (RMUIInteractiveProfileFooterViewModel *)objc_getProperty(self, a2, 64, 1);
}

- (void)setFooterViewModel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_footerViewModel, 0);
  objc_storeStrong((id *)&self->_toggleViewModel, 0);
  objc_storeStrong((id *)&self->_interactiveDetailsText, 0);
  objc_storeStrong((id *)&self->_declaration, 0);
  objc_storeStrong((id *)&self->_profileIdentifier, 0);
  objc_storeStrong((id *)&self->_value, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

@end