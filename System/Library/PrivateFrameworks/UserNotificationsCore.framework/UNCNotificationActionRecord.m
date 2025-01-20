@interface UNCNotificationActionRecord
+ (BOOL)supportsSecureCoding;
- (BOOL)hasSystemIcon;
- (BOOL)isAuthenticationRequired;
- (BOOL)isDestructive;
- (BOOL)isEqual:(id)a3;
- (BOOL)isForeground;
- (BOOL)shouldPreventNotificationDismiss;
- (NSArray)textInputButtonTitleLocalizationArguments;
- (NSArray)textInputPlaceholderLocalizationArguments;
- (NSArray)titleLocalizationArguments;
- (NSString)actionType;
- (NSString)iconImageName;
- (NSString)identifier;
- (NSString)textInputButtonTitle;
- (NSString)textInputButtonTitleLocalizationKey;
- (NSString)textInputPlaceholder;
- (NSString)textInputPlaceholderLocalizationKey;
- (NSString)title;
- (NSString)titleLocalizationKey;
- (NSURL)url;
- (UNCNotificationActionRecord)initWithCoder:(id)a3;
- (UNCNotificationActionRecord)initWithDictionaryRepresentation:(id)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setActionType:(id)a3;
- (void)setAuthenticationRequired:(BOOL)a3;
- (void)setDestructive:(BOOL)a3;
- (void)setForeground:(BOOL)a3;
- (void)setHasSystemIcon:(BOOL)a3;
- (void)setIconImageName:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setShouldPreventNotificationDismiss:(BOOL)a3;
- (void)setTextInputButtonTitle:(id)a3;
- (void)setTextInputButtonTitleLocalizationArguments:(id)a3;
- (void)setTextInputButtonTitleLocalizationKey:(id)a3;
- (void)setTextInputPlaceholder:(id)a3;
- (void)setTextInputPlaceholderLocalizationArguments:(id)a3;
- (void)setTextInputPlaceholderLocalizationKey:(id)a3;
- (void)setTitle:(id)a3;
- (void)setTitleLocalizationArguments:(id)a3;
- (void)setTitleLocalizationKey:(id)a3;
- (void)setUrl:(id)a3;
@end

@implementation UNCNotificationActionRecord

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_titleLocalizationKey, 0);
  objc_storeStrong((id *)&self->_titleLocalizationArguments, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_textInputPlaceholderLocalizationKey, 0);
  objc_storeStrong((id *)&self->_textInputPlaceholderLocalizationArguments, 0);
  objc_storeStrong((id *)&self->_textInputPlaceholder, 0);
  objc_storeStrong((id *)&self->_textInputButtonTitleLocalizationKey, 0);
  objc_storeStrong((id *)&self->_textInputButtonTitleLocalizationArguments, 0);
  objc_storeStrong((id *)&self->_textInputButtonTitle, 0);
  objc_storeStrong((id *)&self->_iconImageName, 0);
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong((id *)&self->_actionType, 0);
}

- (void)setUrl:(id)a3
{
}

- (UNCNotificationActionRecord)initWithDictionaryRepresentation:(id)a3
{
  id v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)UNCNotificationActionRecord;
  v5 = [(UNCNotificationActionRecord *)&v28 init];
  if (v5)
  {
    v6 = [v4 objectForKey:@"ActionType"];
    [(UNCNotificationActionRecord *)v5 setActionType:v6];

    v7 = [v4 objectForKey:@"Identifier"];
    [(UNCNotificationActionRecord *)v5 setIdentifier:v7];

    v8 = [v4 objectForKey:@"AuthenticationRequired"];
    -[UNCNotificationActionRecord setAuthenticationRequired:](v5, "setAuthenticationRequired:", [v8 BOOLValue]);

    v9 = [v4 objectForKey:@"Destructive"];
    -[UNCNotificationActionRecord setDestructive:](v5, "setDestructive:", [v9 BOOLValue]);

    v10 = [v4 objectForKey:@"Foreground"];
    -[UNCNotificationActionRecord setForeground:](v5, "setForeground:", [v10 BOOLValue]);

    v11 = [v4 objectForKey:@"HasSystemIcon"];
    -[UNCNotificationActionRecord setHasSystemIcon:](v5, "setHasSystemIcon:", [v11 BOOLValue]);

    v12 = [v4 objectForKey:@"IconImageName"];
    [(UNCNotificationActionRecord *)v5 setIconImageName:v12];

    v13 = [v4 objectForKey:@"ShouldPreventNotificationDismiss"];
    -[UNCNotificationActionRecord setShouldPreventNotificationDismiss:](v5, "setShouldPreventNotificationDismiss:", [v13 BOOLValue]);

    v14 = [v4 objectForKey:@"TextInputButtonTitle"];
    [(UNCNotificationActionRecord *)v5 setTextInputButtonTitle:v14];

    v15 = [v4 objectForKey:@"TextInputButtonTitleLocalizationArguments"];
    [(UNCNotificationActionRecord *)v5 setTextInputButtonTitleLocalizationArguments:v15];

    v16 = [v4 objectForKey:@"TextInputButtonTitleLocalizationKey"];
    [(UNCNotificationActionRecord *)v5 setTextInputButtonTitleLocalizationKey:v16];

    v17 = [v4 objectForKey:@"TextInputPlaceholder"];
    [(UNCNotificationActionRecord *)v5 setTextInputPlaceholder:v17];

    v18 = [v4 objectForKey:@"TextInputPlaceholderLocalizationArguments"];
    [(UNCNotificationActionRecord *)v5 setTextInputPlaceholderLocalizationArguments:v18];

    v19 = [v4 objectForKey:@"TextInputPlaceholderLocalizationKey"];
    [(UNCNotificationActionRecord *)v5 setTextInputPlaceholderLocalizationKey:v19];

    v20 = [v4 objectForKey:@"Title"];
    [(UNCNotificationActionRecord *)v5 setTitle:v20];

    v21 = [v4 objectForKey:@"TitleLocalizationArguments"];
    [(UNCNotificationActionRecord *)v5 setTitleLocalizationArguments:v21];

    v22 = [v4 objectForKey:@"TitleLocalizationKey"];
    [(UNCNotificationActionRecord *)v5 setTitleLocalizationKey:v22];

    v23 = [v4 objectForKey:@"URL"];

    if (v23)
    {
      v24 = NSURL;
      v25 = [v4 objectForKey:@"URL"];
      v26 = [v24 URLWithString:v25];
      [(UNCNotificationActionRecord *)v5 setUrl:v26];
    }
  }

  return v5;
}

- (void)setTitle:(id)a3
{
}

- (void)setShouldPreventNotificationDismiss:(BOOL)a3
{
  self->_shouldPreventNotificationDismiss = a3;
}

- (void)setIdentifier:(id)a3
{
}

- (void)setIconImageName:(id)a3
{
}

- (void)setHasSystemIcon:(BOOL)a3
{
  self->_hasSystemIcon = a3;
}

- (void)setForeground:(BOOL)a3
{
  self->_foreground = a3;
}

- (void)setDestructive:(BOOL)a3
{
  self->_destructive = a3;
}

- (void)setAuthenticationRequired:(BOOL)a3
{
  self->_authenticationRequired = a3;
}

- (void)setActionType:(id)a3
{
}

- (void)setTextInputPlaceholder:(id)a3
{
}

- (void)setTextInputButtonTitle:(id)a3
{
}

- (void)setTitleLocalizationKey:(id)a3
{
}

- (void)setTitleLocalizationArguments:(id)a3
{
}

- (void)setTextInputPlaceholderLocalizationKey:(id)a3
{
}

- (void)setTextInputPlaceholderLocalizationArguments:(id)a3
{
}

- (void)setTextInputButtonTitleLocalizationKey:(id)a3
{
}

- (void)setTextInputButtonTitleLocalizationArguments:(id)a3
{
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (!v4) {
    goto LABEL_21;
  }
  uint64_t v5 = objc_opt_class();
  if (v5 != objc_opt_class()) {
    goto LABEL_21;
  }
  v6 = [(UNCNotificationActionRecord *)self identifier];
  v7 = [v4 identifier];
  int v8 = UNEqualObjects();

  if (!v8) {
    goto LABEL_21;
  }
  v9 = [(UNCNotificationActionRecord *)self actionType];
  v10 = [v4 actionType];
  int v11 = UNEqualObjects();

  if (!v11) {
    goto LABEL_21;
  }
  int v12 = [(UNCNotificationActionRecord *)self isAuthenticationRequired];
  if (v12 != [v4 isAuthenticationRequired]) {
    goto LABEL_21;
  }
  int v13 = [(UNCNotificationActionRecord *)self isDestructive];
  if (v13 != [v4 isDestructive]) {
    goto LABEL_21;
  }
  int v14 = [(UNCNotificationActionRecord *)self isForeground];
  if (v14 != [v4 isForeground]) {
    goto LABEL_21;
  }
  int v15 = [(UNCNotificationActionRecord *)self hasSystemIcon];
  if (v15 != [v4 hasSystemIcon]) {
    goto LABEL_21;
  }
  int v16 = [(UNCNotificationActionRecord *)self shouldPreventNotificationDismiss];
  if (v16 != [v4 shouldPreventNotificationDismiss]) {
    goto LABEL_21;
  }
  v17 = [(UNCNotificationActionRecord *)self iconImageName];
  v18 = [v4 iconImageName];
  int v19 = UNEqualObjects();

  if (!v19) {
    goto LABEL_21;
  }
  v20 = [(UNCNotificationActionRecord *)self textInputButtonTitle];
  v21 = [v4 textInputButtonTitle];
  int v22 = UNEqualObjects();

  if (!v22) {
    goto LABEL_21;
  }
  v23 = [(UNCNotificationActionRecord *)self textInputButtonTitleLocalizationArguments];
  v24 = [v4 textInputButtonTitleLocalizationArguments];
  int v25 = UNEqualObjects();

  if (!v25) {
    goto LABEL_21;
  }
  v26 = [(UNCNotificationActionRecord *)self textInputButtonTitleLocalizationKey];
  v27 = [v4 textInputButtonTitleLocalizationKey];
  int v28 = UNEqualObjects();

  if (!v28) {
    goto LABEL_21;
  }
  v29 = [(UNCNotificationActionRecord *)self textInputPlaceholder];
  v30 = [v4 textInputPlaceholder];
  int v31 = UNEqualObjects();

  if (!v31) {
    goto LABEL_21;
  }
  v32 = [(UNCNotificationActionRecord *)self textInputPlaceholderLocalizationArguments];
  v33 = [v4 textInputPlaceholderLocalizationArguments];
  int v34 = UNEqualObjects();

  if (!v34) {
    goto LABEL_21;
  }
  v35 = [(UNCNotificationActionRecord *)self textInputPlaceholderLocalizationKey];
  v36 = [v4 textInputPlaceholderLocalizationKey];
  int v37 = UNEqualObjects();

  if (!v37) {
    goto LABEL_21;
  }
  v38 = [(UNCNotificationActionRecord *)self title];
  v39 = [v4 title];
  int v40 = UNEqualObjects();

  if (!v40) {
    goto LABEL_21;
  }
  v41 = [(UNCNotificationActionRecord *)self titleLocalizationArguments];
  v42 = [v4 titleLocalizationArguments];
  int v43 = UNEqualObjects();

  if (!v43) {
    goto LABEL_21;
  }
  v44 = [(UNCNotificationActionRecord *)self titleLocalizationKey];
  v45 = [v4 titleLocalizationKey];
  int v46 = UNEqualObjects();

  if (v46)
  {
    v47 = [(UNCNotificationActionRecord *)self url];
    v48 = [v4 url];
    char v49 = UNEqualObjects();
  }
  else
  {
LABEL_21:
    char v49 = 0;
  }

  return v49;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSURL)url
{
  return self->_url;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)titleLocalizationKey
{
  return self->_titleLocalizationKey;
}

- (NSArray)titleLocalizationArguments
{
  return self->_titleLocalizationArguments;
}

- (BOOL)shouldPreventNotificationDismiss
{
  return self->_shouldPreventNotificationDismiss;
}

- (BOOL)isForeground
{
  return self->_foreground;
}

- (BOOL)isDestructive
{
  return self->_destructive;
}

- (BOOL)isAuthenticationRequired
{
  return self->_authenticationRequired;
}

- (NSString)iconImageName
{
  return self->_iconImageName;
}

- (BOOL)hasSystemIcon
{
  return self->_hasSystemIcon;
}

- (NSString)actionType
{
  return self->_actionType;
}

- (NSString)textInputPlaceholder
{
  return self->_textInputPlaceholder;
}

- (NSString)textInputPlaceholderLocalizationKey
{
  return self->_textInputPlaceholderLocalizationKey;
}

- (NSArray)textInputPlaceholderLocalizationArguments
{
  return self->_textInputPlaceholderLocalizationArguments;
}

- (NSString)textInputButtonTitle
{
  return self->_textInputButtonTitle;
}

- (NSString)textInputButtonTitleLocalizationKey
{
  return self->_textInputButtonTitleLocalizationKey;
}

- (NSArray)textInputButtonTitleLocalizationArguments
{
  return self->_textInputButtonTitleLocalizationArguments;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  id v4 = [(UNCNotificationActionRecord *)self actionType];
  objc_msgSend(v3, "unc_safeSetObject:forKey:", v4, @"ActionType");

  uint64_t v5 = [(UNCNotificationActionRecord *)self identifier];
  objc_msgSend(v3, "unc_safeSetObject:forKey:", v5, @"Identifier");

  v6 = objc_msgSend(NSNumber, "numberWithBool:", -[UNCNotificationActionRecord hasSystemIcon](self, "hasSystemIcon"));
  objc_msgSend(v3, "unc_safeSetObject:forKey:", v6, @"HasSystemIcon");

  v7 = objc_msgSend(NSNumber, "numberWithBool:", -[UNCNotificationActionRecord isAuthenticationRequired](self, "isAuthenticationRequired"));
  objc_msgSend(v3, "unc_safeSetObject:forKey:", v7, @"AuthenticationRequired");

  int v8 = objc_msgSend(NSNumber, "numberWithBool:", -[UNCNotificationActionRecord isDestructive](self, "isDestructive"));
  objc_msgSend(v3, "unc_safeSetObject:forKey:", v8, @"Destructive");

  v9 = objc_msgSend(NSNumber, "numberWithBool:", -[UNCNotificationActionRecord isForeground](self, "isForeground"));
  objc_msgSend(v3, "unc_safeSetObject:forKey:", v9, @"Foreground");

  v10 = [(UNCNotificationActionRecord *)self iconImageName];
  objc_msgSend(v3, "unc_safeSetObject:forKey:", v10, @"IconImageName");

  int v11 = objc_msgSend(NSNumber, "numberWithBool:", -[UNCNotificationActionRecord shouldPreventNotificationDismiss](self, "shouldPreventNotificationDismiss"));
  objc_msgSend(v3, "unc_safeSetObject:forKey:", v11, @"ShouldPreventNotificationDismiss");

  int v12 = [(UNCNotificationActionRecord *)self textInputButtonTitle];
  objc_msgSend(v3, "unc_safeSetObject:forKey:", v12, @"TextInputButtonTitle");

  int v13 = [(UNCNotificationActionRecord *)self textInputButtonTitleLocalizationArguments];
  objc_msgSend(v3, "unc_safeSetObject:forKey:", v13, @"TextInputButtonTitleLocalizationArguments");

  int v14 = [(UNCNotificationActionRecord *)self textInputButtonTitleLocalizationKey];
  objc_msgSend(v3, "unc_safeSetObject:forKey:", v14, @"TextInputButtonTitleLocalizationKey");

  int v15 = [(UNCNotificationActionRecord *)self textInputPlaceholder];
  objc_msgSend(v3, "unc_safeSetObject:forKey:", v15, @"TextInputPlaceholder");

  int v16 = [(UNCNotificationActionRecord *)self textInputPlaceholderLocalizationArguments];
  objc_msgSend(v3, "unc_safeSetObject:forKey:", v16, @"TextInputPlaceholderLocalizationArguments");

  v17 = [(UNCNotificationActionRecord *)self textInputPlaceholderLocalizationKey];
  objc_msgSend(v3, "unc_safeSetObject:forKey:", v17, @"TextInputPlaceholderLocalizationKey");

  v18 = [(UNCNotificationActionRecord *)self title];
  objc_msgSend(v3, "unc_safeSetObject:forKey:", v18, @"Title");

  int v19 = [(UNCNotificationActionRecord *)self titleLocalizationArguments];
  objc_msgSend(v3, "unc_safeSetObject:forKey:", v19, @"TitleLocalizationArguments");

  v20 = [(UNCNotificationActionRecord *)self titleLocalizationKey];
  objc_msgSend(v3, "unc_safeSetObject:forKey:", v20, @"TitleLocalizationKey");

  v21 = [(UNCNotificationActionRecord *)self url];
  int v22 = [v21 absoluteString];
  objc_msgSend(v3, "unc_safeSetObject:forKey:", v22, @"URL");

  return v3;
}

- (id)description
{
  v3 = [MEMORY[0x263F29C40] builderWithObject:self];
  id v4 = [(UNCNotificationActionRecord *)self identifier];
  id v5 = (id)[v3 appendObject:v4 withName:@"Identifier"];

  v6 = [(UNCNotificationActionRecord *)self actionType];
  id v7 = (id)[v3 appendObject:v6 withName:@"ActionType"];

  id v8 = (id)objc_msgSend(v3, "appendBool:withName:", -[UNCNotificationActionRecord hasSystemIcon](self, "hasSystemIcon"), @"HasSystemIcon");
  id v9 = (id)objc_msgSend(v3, "appendBool:withName:", -[UNCNotificationActionRecord isAuthenticationRequired](self, "isAuthenticationRequired"), @"AuthenticationRequired");
  id v10 = (id)objc_msgSend(v3, "appendBool:withName:", -[UNCNotificationActionRecord isDestructive](self, "isDestructive"), @"Destructive");
  id v11 = (id)objc_msgSend(v3, "appendBool:withName:", -[UNCNotificationActionRecord isForeground](self, "isForeground"), @"Foreground");
  int v12 = [(UNCNotificationActionRecord *)self iconImageName];
  [v3 appendString:v12 withName:@"IconImageName"];

  id v13 = (id)objc_msgSend(v3, "appendBool:withName:", -[UNCNotificationActionRecord shouldPreventNotificationDismiss](self, "shouldPreventNotificationDismiss"), @"ShouldPreventNotificationDismiss");
  int v14 = [(UNCNotificationActionRecord *)self textInputButtonTitle];
  id v15 = (id)[v3 appendObject:v14 withName:@"textInputButtonTitle"];

  int v16 = [(UNCNotificationActionRecord *)self textInputButtonTitleLocalizationArguments];
  id v17 = (id)[v3 appendObject:v16 withName:@"textInputButtonTitleLocalizationArguments"];

  v18 = [(UNCNotificationActionRecord *)self textInputButtonTitleLocalizationKey];
  id v19 = (id)[v3 appendObject:v18 withName:@"textInputButtonTitleLocalizationKey"];

  v20 = [(UNCNotificationActionRecord *)self textInputPlaceholder];
  id v21 = (id)[v3 appendObject:v20 withName:@"textInputPlaceholder"];

  int v22 = [(UNCNotificationActionRecord *)self textInputPlaceholderLocalizationArguments];
  id v23 = (id)[v3 appendObject:v22 withName:@"textInputPlaceholderLocalizationArguments"];

  v24 = [(UNCNotificationActionRecord *)self textInputPlaceholderLocalizationKey];
  id v25 = (id)[v3 appendObject:v24 withName:@"textInputPlaceholderLocalizationKey"];

  v26 = [(UNCNotificationActionRecord *)self title];
  id v27 = (id)[v3 appendObject:v26 withName:@"Title"];

  int v28 = [(UNCNotificationActionRecord *)self titleLocalizationArguments];
  id v29 = (id)[v3 appendObject:v28 withName:@"TitleLocalizationArguments"];

  v30 = [(UNCNotificationActionRecord *)self titleLocalizationKey];
  id v31 = (id)[v3 appendObject:v30 withName:@"TitleLocalizationKey"];

  v32 = [(UNCNotificationActionRecord *)self url];
  id v33 = (id)[v3 appendObject:v32 withName:@"URL"];

  int v34 = [v3 build];

  return v34;
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x263F29C60] builder];
  id v4 = (id)objc_msgSend(v3, "appendBool:", -[UNCNotificationActionRecord isAuthenticationRequired](self, "isAuthenticationRequired"));
  id v5 = (id)objc_msgSend(v3, "appendBool:", -[UNCNotificationActionRecord isDestructive](self, "isDestructive"));
  id v6 = (id)objc_msgSend(v3, "appendBool:", -[UNCNotificationActionRecord isForeground](self, "isForeground"));
  id v7 = (id)objc_msgSend(v3, "appendBool:", -[UNCNotificationActionRecord hasSystemIcon](self, "hasSystemIcon"));
  id v8 = (id)objc_msgSend(v3, "appendBool:", -[UNCNotificationActionRecord shouldPreventNotificationDismiss](self, "shouldPreventNotificationDismiss"));
  id v9 = [(UNCNotificationActionRecord *)self identifier];
  id v10 = (id)[v3 appendObject:v9];

  id v11 = [(UNCNotificationActionRecord *)self actionType];
  id v12 = (id)[v3 appendObject:v11];

  id v13 = [(UNCNotificationActionRecord *)self iconImageName];
  id v14 = (id)[v3 appendObject:v13];

  id v15 = [(UNCNotificationActionRecord *)self textInputButtonTitle];
  id v16 = (id)[v3 appendObject:v15];

  id v17 = [(UNCNotificationActionRecord *)self textInputButtonTitleLocalizationArguments];
  id v18 = (id)[v3 appendObject:v17];

  id v19 = [(UNCNotificationActionRecord *)self textInputButtonTitleLocalizationKey];
  id v20 = (id)[v3 appendObject:v19];

  id v21 = [(UNCNotificationActionRecord *)self textInputPlaceholder];
  id v22 = (id)[v3 appendObject:v21];

  id v23 = [(UNCNotificationActionRecord *)self textInputPlaceholderLocalizationArguments];
  id v24 = (id)[v3 appendObject:v23];

  id v25 = [(UNCNotificationActionRecord *)self textInputPlaceholderLocalizationKey];
  id v26 = (id)[v3 appendObject:v25];

  id v27 = [(UNCNotificationActionRecord *)self title];
  id v28 = (id)[v3 appendObject:v27];

  id v29 = [(UNCNotificationActionRecord *)self titleLocalizationArguments];
  id v30 = (id)[v3 appendObject:v29];

  id v31 = [(UNCNotificationActionRecord *)self titleLocalizationKey];
  id v32 = (id)[v3 appendObject:v31];

  id v33 = [(UNCNotificationActionRecord *)self url];
  id v34 = (id)[v3 appendObject:v33];

  unint64_t v35 = [v3 hash];
  return v35;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(UNCNotificationActionRecord *)self dictionaryRepresentation];
  [v4 encodeObject:v5 forKey:@"dictionary"];
}

- (UNCNotificationActionRecord)initWithCoder:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = (void *)MEMORY[0x263EFFA08];
  id v5 = a3;
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  uint64_t v13 = objc_opt_class();
  uint64_t v14 = objc_opt_class();
  uint64_t v15 = objc_opt_class();
  uint64_t v16 = objc_opt_class();
  uint64_t v17 = objc_opt_class();
  id v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v11 count:7];
  id v7 = objc_msgSend(v4, "setWithArray:", v6, v11, v12, v13, v14, v15, v16);

  id v8 = [v5 decodeObjectOfClasses:v7 forKey:@"dictionary"];

  id v9 = [[UNCNotificationActionRecord alloc] initWithDictionaryRepresentation:v8];
  return v9;
}

@end