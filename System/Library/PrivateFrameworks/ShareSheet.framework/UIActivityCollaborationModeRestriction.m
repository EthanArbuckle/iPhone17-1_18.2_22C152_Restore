@interface UIActivityCollaborationModeRestriction
+ (BOOL)supportsSecureCoding;
- (BOOL)allowContinueToMode;
- (NSString)alertDismissButtonTitle;
- (NSString)alertMessage;
- (NSString)alertRecoverySuggestionButtonTitle;
- (NSString)alertTitle;
- (NSURL)alertRecoverySuggestionButtonLaunchURL;
- (UIActivityCollaborationModeRestriction)initWithCoder:(id)a3;
- (UIActivityCollaborationModeRestriction)initWithDisabledMode:(int64_t)a3;
- (UIActivityCollaborationModeRestriction)initWithDisabledMode:(int64_t)a3 alertTitle:(id)a4 alertMessage:(id)a5;
- (UIActivityCollaborationModeRestriction)initWithDisabledMode:(int64_t)a3 alertTitle:(id)a4 alertMessage:(id)a5 alertDismissButtonTitle:(id)a6;
- (UIActivityCollaborationModeRestriction)initWithDisabledMode:(int64_t)a3 alertTitle:(id)a4 alertMessage:(id)a5 alertDismissButtonTitle:(id)a6 alertContinueToModeButtonTitle:(id)a7;
- (UIActivityCollaborationModeRestriction)initWithDisabledMode:(int64_t)a3 alertTitle:(id)a4 alertMessage:(id)a5 alertDismissButtonTitle:(id)a6 alertRecoverySuggestionButtonTitle:(id)a7 alertRecoverySuggestionButtonLaunchURL:(id)a8;
- (id)_initWithDisabledMode:(int64_t)a3 alertTitle:(id)a4 alertMessage:(id)a5 alertDismissButtonTitle:(id)a6 alertRecoverySuggestionButtonTitle:(id)a7 alertRecoverySuggestionButtonLaunchURL:(id)a8 allowContinueToMode:(BOOL)a9;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)descriptionForMode:(int64_t)a3;
- (int64_t)disabledMode;
- (void)encodeWithCoder:(id)a3;
@end

@implementation UIActivityCollaborationModeRestriction

- (UIActivityCollaborationModeRestriction)initWithDisabledMode:(int64_t)a3
{
  LOBYTE(v4) = 0;
  return (UIActivityCollaborationModeRestriction *)[(UIActivityCollaborationModeRestriction *)self _initWithDisabledMode:a3 alertTitle:0 alertMessage:0 alertDismissButtonTitle:0 alertRecoverySuggestionButtonTitle:0 alertRecoverySuggestionButtonLaunchURL:0 allowContinueToMode:v4];
}

- (UIActivityCollaborationModeRestriction)initWithDisabledMode:(int64_t)a3 alertTitle:(id)a4 alertMessage:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  v10 = _ShareSheetBundle();
  v11 = [v10 localizedStringForKey:@"Move to iCloud OK" value:@"OK" table:@"Localizable"];

  LOBYTE(v14) = 0;
  v12 = [(UIActivityCollaborationModeRestriction *)self _initWithDisabledMode:a3 alertTitle:v9 alertMessage:v8 alertDismissButtonTitle:v11 alertRecoverySuggestionButtonTitle:0 alertRecoverySuggestionButtonLaunchURL:0 allowContinueToMode:v14];

  return v12;
}

- (UIActivityCollaborationModeRestriction)initWithDisabledMode:(int64_t)a3 alertTitle:(id)a4 alertMessage:(id)a5 alertDismissButtonTitle:(id)a6
{
  LOBYTE(v7) = 0;
  return (UIActivityCollaborationModeRestriction *)[(UIActivityCollaborationModeRestriction *)self _initWithDisabledMode:a3 alertTitle:a4 alertMessage:a5 alertDismissButtonTitle:a6 alertRecoverySuggestionButtonTitle:0 alertRecoverySuggestionButtonLaunchURL:0 allowContinueToMode:v7];
}

- (UIActivityCollaborationModeRestriction)initWithDisabledMode:(int64_t)a3 alertTitle:(id)a4 alertMessage:(id)a5 alertDismissButtonTitle:(id)a6 alertRecoverySuggestionButtonTitle:(id)a7 alertRecoverySuggestionButtonLaunchURL:(id)a8
{
  LOBYTE(v9) = 0;
  return (UIActivityCollaborationModeRestriction *)[(UIActivityCollaborationModeRestriction *)self _initWithDisabledMode:a3 alertTitle:a4 alertMessage:a5 alertDismissButtonTitle:a6 alertRecoverySuggestionButtonTitle:a7 alertRecoverySuggestionButtonLaunchURL:a8 allowContinueToMode:v9];
}

- (UIActivityCollaborationModeRestriction)initWithDisabledMode:(int64_t)a3 alertTitle:(id)a4 alertMessage:(id)a5 alertDismissButtonTitle:(id)a6 alertContinueToModeButtonTitle:(id)a7
{
  LOBYTE(v8) = 1;
  return (UIActivityCollaborationModeRestriction *)[(UIActivityCollaborationModeRestriction *)self _initWithDisabledMode:a3 alertTitle:a4 alertMessage:a5 alertDismissButtonTitle:a6 alertRecoverySuggestionButtonTitle:a7 alertRecoverySuggestionButtonLaunchURL:0 allowContinueToMode:v8];
}

- (id)_initWithDisabledMode:(int64_t)a3 alertTitle:(id)a4 alertMessage:(id)a5 alertDismissButtonTitle:(id)a6 alertRecoverySuggestionButtonTitle:(id)a7 alertRecoverySuggestionButtonLaunchURL:(id)a8 allowContinueToMode:(BOOL)a9
{
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  v33.receiver = self;
  v33.super_class = (Class)UIActivityCollaborationModeRestriction;
  v20 = [(UIActivityCollaborationModeRestriction *)&v33 init];
  v21 = v20;
  if (v20)
  {
    v20->_disabledMode = a3;
    uint64_t v22 = [v15 copy];
    alertTitle = v21->_alertTitle;
    v21->_alertTitle = (NSString *)v22;

    uint64_t v24 = [v16 copy];
    alertMessage = v21->_alertMessage;
    v21->_alertMessage = (NSString *)v24;

    uint64_t v26 = [v17 copy];
    alertDismissButtonTitle = v21->_alertDismissButtonTitle;
    v21->_alertDismissButtonTitle = (NSString *)v26;

    uint64_t v28 = [v18 copy];
    alertRecoverySuggestionButtonTitle = v21->_alertRecoverySuggestionButtonTitle;
    v21->_alertRecoverySuggestionButtonTitle = (NSString *)v28;

    uint64_t v30 = [v19 copy];
    alertRecoverySuggestionButtonLaunchURL = v21->_alertRecoverySuggestionButtonLaunchURL;
    v21->_alertRecoverySuggestionButtonLaunchURL = (NSURL *)v30;

    v21->_allowContinueToMode = a9;
  }

  return v21;
}

- (id)description
{
  v3 = NSString;
  v15.receiver = self;
  v15.super_class = (Class)UIActivityCollaborationModeRestriction;
  uint64_t v4 = [(UIActivityCollaborationModeRestriction *)&v15 description];
  v5 = [(UIActivityCollaborationModeRestriction *)self descriptionForMode:[(UIActivityCollaborationModeRestriction *)self disabledMode]];
  v6 = [(UIActivityCollaborationModeRestriction *)self alertTitle];
  uint64_t v7 = [(UIActivityCollaborationModeRestriction *)self alertMessage];
  uint64_t v8 = [(UIActivityCollaborationModeRestriction *)self alertDismissButtonTitle];
  uint64_t v9 = [(UIActivityCollaborationModeRestriction *)self alertRecoverySuggestionButtonTitle];
  v10 = [(UIActivityCollaborationModeRestriction *)self alertRecoverySuggestionButtonLaunchURL];
  BOOL v11 = [(UIActivityCollaborationModeRestriction *)self allowContinueToMode];
  v12 = "no";
  if (v11) {
    v12 = "yes";
  }
  v13 = [v3 stringWithFormat:@"%@: disabledMode:%@ alertTitle:%@ alertMessage:%@ alertDismissButtonTitle:%@ alertRecoverySuggestionButtonTitle:%@ alertRecoverySuggestionButtonLaunchURL:%@ allowContinueToMode:%s", v4, v5, v6, v7, v8, v9, v10, v12];

  return v13;
}

- (id)descriptionForMode:(int64_t)a3
{
  v3 = @"unknown";
  if (a3 == 1) {
    v3 = @"collaborate";
  }
  if (a3) {
    return v3;
  }
  else {
    return @"sendCopy";
  }
}

- (UIActivityCollaborationModeRestriction)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeIntegerForKey:@"disabledMode"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"alertTitle"];
  uint64_t v7 = (void *)[v6 copy];

  uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"alertMessage"];
  uint64_t v9 = (void *)[v8 copy];

  v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"alertDismissButtonTitle"];
  BOOL v11 = (void *)[v10 copy];

  v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"alertRecoverySuggestionButtonTitle"];
  v13 = (void *)[v12 copy];

  uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"alertRecoverySuggestionButtonLaunchURL"];
  objc_super v15 = (void *)[v14 copy];

  LOBYTE(v14) = [v4 decodeBoolForKey:@"allowContinueToMode"];
  LOBYTE(v18) = (_BYTE)v14;
  id v16 = [(UIActivityCollaborationModeRestriction *)self _initWithDisabledMode:v5 alertTitle:v7 alertMessage:v9 alertDismissButtonTitle:v11 alertRecoverySuggestionButtonTitle:v13 alertRecoverySuggestionButtonLaunchURL:v15 allowContinueToMode:v18];

  return v16;
}

- (void)encodeWithCoder:(id)a3
{
  id v14 = a3;
  objc_msgSend(v14, "encodeInteger:forKey:", -[UIActivityCollaborationModeRestriction disabledMode](self, "disabledMode"), @"disabledMode");
  id v4 = [(UIActivityCollaborationModeRestriction *)self alertTitle];

  if (v4)
  {
    uint64_t v5 = [(UIActivityCollaborationModeRestriction *)self alertTitle];
    [v14 encodeObject:v5 forKey:@"alertTitle"];
  }
  v6 = [(UIActivityCollaborationModeRestriction *)self alertMessage];

  if (v6)
  {
    uint64_t v7 = [(UIActivityCollaborationModeRestriction *)self alertMessage];
    [v14 encodeObject:v7 forKey:@"alertMessage"];
  }
  uint64_t v8 = [(UIActivityCollaborationModeRestriction *)self alertDismissButtonTitle];

  if (v8)
  {
    uint64_t v9 = [(UIActivityCollaborationModeRestriction *)self alertDismissButtonTitle];
    [v14 encodeObject:v9 forKey:@"alertDismissButtonTitle"];
  }
  v10 = [(UIActivityCollaborationModeRestriction *)self alertRecoverySuggestionButtonTitle];

  if (v10)
  {
    BOOL v11 = [(UIActivityCollaborationModeRestriction *)self alertRecoverySuggestionButtonTitle];
    [v14 encodeObject:v11 forKey:@"alertRecoverySuggestionButtonTitle"];
  }
  v12 = [(UIActivityCollaborationModeRestriction *)self alertRecoverySuggestionButtonLaunchURL];

  if (v12)
  {
    v13 = [(UIActivityCollaborationModeRestriction *)self alertRecoverySuggestionButtonLaunchURL];
    [v14 encodeObject:v13 forKey:@"alertRecoverySuggestionButtonLaunchURL"];
  }
  objc_msgSend(v14, "encodeBool:forKey:", -[UIActivityCollaborationModeRestriction allowContinueToMode](self, "allowContinueToMode"), @"allowContinueToMode");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  int64_t v5 = [(UIActivityCollaborationModeRestriction *)self disabledMode];
  v6 = [(UIActivityCollaborationModeRestriction *)self alertTitle];
  uint64_t v7 = (void *)[v6 copyWithZone:a3];

  uint64_t v8 = [(UIActivityCollaborationModeRestriction *)self alertMessage];
  uint64_t v9 = (void *)[v8 copyWithZone:a3];

  v10 = [(UIActivityCollaborationModeRestriction *)self alertDismissButtonTitle];
  BOOL v11 = (void *)[v10 copyWithZone:a3];

  v12 = [(UIActivityCollaborationModeRestriction *)self alertRecoverySuggestionButtonTitle];
  v13 = (void *)[v12 copyWithZone:a3];

  id v14 = [(UIActivityCollaborationModeRestriction *)self alertRecoverySuggestionButtonLaunchURL];
  objc_super v15 = (void *)[v14 copyWithZone:a3];

  LOBYTE(v18) = [(UIActivityCollaborationModeRestriction *)self allowContinueToMode];
  id v16 = (void *)[objc_alloc((Class)objc_opt_class()) _initWithDisabledMode:v5 alertTitle:v7 alertMessage:v9 alertDismissButtonTitle:v11 alertRecoverySuggestionButtonTitle:v13 alertRecoverySuggestionButtonLaunchURL:v15 allowContinueToMode:v18];

  return v16;
}

- (int64_t)disabledMode
{
  return self->_disabledMode;
}

- (NSString)alertTitle
{
  return self->_alertTitle;
}

- (NSString)alertMessage
{
  return self->_alertMessage;
}

- (NSString)alertDismissButtonTitle
{
  return self->_alertDismissButtonTitle;
}

- (NSString)alertRecoverySuggestionButtonTitle
{
  return self->_alertRecoverySuggestionButtonTitle;
}

- (NSURL)alertRecoverySuggestionButtonLaunchURL
{
  return self->_alertRecoverySuggestionButtonLaunchURL;
}

- (BOOL)allowContinueToMode
{
  return self->_allowContinueToMode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alertRecoverySuggestionButtonLaunchURL, 0);
  objc_storeStrong((id *)&self->_alertRecoverySuggestionButtonTitle, 0);
  objc_storeStrong((id *)&self->_alertDismissButtonTitle, 0);
  objc_storeStrong((id *)&self->_alertMessage, 0);
  objc_storeStrong((id *)&self->_alertTitle, 0);
}

@end