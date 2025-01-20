@interface WFOpenURLContextualAction
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSString)bundleIdentifier;
- (NSURL)url;
- (WFOpenURLContextualAction)initWithCoder:(id)a3;
- (WFOpenURLContextualAction)initWithURL:(id)a3 bundleIdentifier:(id)a4 actionTitle:(id)a5;
- (id)uniqueIdentifier;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WFOpenURLContextualAction

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (NSURL)url
{
  return self->_url;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)WFOpenURLContextualAction;
  id v4 = a3;
  [(WFContextualAction *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_url, @"url", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_bundleIdentifier forKey:@"bundleIdentifier"];
}

- (WFOpenURLContextualAction)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)WFOpenURLContextualAction;
  objc_super v5 = [(WFContextualAction *)&v12 initWithCoder:v4];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"url"];
    uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bundleIdentifier"];
    v8 = (void *)v7;
    if (v6) {
      BOOL v9 = v7 == 0;
    }
    else {
      BOOL v9 = 1;
    }
    if (v9)
    {
      v10 = 0;
    }
    else
    {
      objc_storeStrong((id *)&v5->_url, v6);
      objc_storeStrong((id *)&v5->_bundleIdentifier, v8);
      v10 = v5;
    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)WFOpenURLContextualAction;
  if ([(WFContextualAction *)&v18 isEqual:v4])
  {
    id v5 = v4;
    if (!v5 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      LOBYTE(v11) = 0;
LABEL_20:

      goto LABEL_21;
    }
    v6 = [v5 url];
    uint64_t v7 = [(WFOpenURLContextualAction *)self url];
    id v8 = v6;
    id v9 = v7;
    v10 = v9;
    if (v8 == v9)
    {
    }
    else
    {
      LOBYTE(v11) = 0;
      objc_super v12 = v9;
      id v13 = v8;
      if (!v8 || !v9)
      {
LABEL_18:

LABEL_19:
        goto LABEL_20;
      }
      int v11 = [v8 isEqual:v9];

      if (!v11) {
        goto LABEL_19;
      }
    }
    v14 = [v5 bundleIdentifier];
    v15 = [(WFOpenURLContextualAction *)self bundleIdentifier];
    id v13 = v14;
    id v16 = v15;
    objc_super v12 = v16;
    if (v13 == v16)
    {
      LOBYTE(v11) = 1;
    }
    else
    {
      LOBYTE(v11) = 0;
      if (v13 && v16) {
        LOBYTE(v11) = [v13 isEqualToString:v16];
      }
    }

    goto LABEL_18;
  }
  LOBYTE(v11) = 0;
LABEL_21:

  return v11;
}

- (unint64_t)hash
{
  v3 = objc_opt_new();
  v11.receiver = self;
  v11.super_class = (Class)WFOpenURLContextualAction;
  id v4 = (id)objc_msgSend(v3, "combineInteger:", -[WFContextualAction hash](&v11, sel_hash));
  id v5 = [(WFOpenURLContextualAction *)self url];
  id v6 = (id)[v3 combine:v5];

  uint64_t v7 = [(WFOpenURLContextualAction *)self bundleIdentifier];
  id v8 = (id)[v3 combineContentsOfPropertyListObject:v7];

  unint64_t v9 = [v3 finalize];
  return v9;
}

- (id)uniqueIdentifier
{
  v16[2] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F70C20]);
  id v4 = [(WFOpenURLContextualAction *)self url];
  id v5 = (id)[v3 combine:v4];

  id v6 = [(WFOpenURLContextualAction *)self bundleIdentifier];
  id v7 = (id)[v3 combineContentsOfPropertyListObject:v6];

  id v8 = [(WFContextualAction *)self displayFormatString];
  id v9 = (id)[v3 combineContentsOfPropertyListObject:v8];

  v10 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v3, "finalize"));
  objc_super v11 = [v10 stringValue];

  objc_super v12 = [(WFContextualAction *)self identifier];
  v16[0] = v12;
  v16[1] = v11;
  id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:2];

  v14 = [v13 componentsJoinedByString:@"."];

  return v14;
}

- (WFOpenURLContextualAction)initWithURL:(id)a3 bundleIdentifier:(id)a4 actionTitle:(id)a5
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (v10)
  {
    if (v11)
    {
LABEL_6:
      id obj = a3;
      id v34 = v12;
      if (v12)
      {
        v17 = v12;
        objc_super v18 = 0;
        v19 = v17;
      }
      else
      {
        v17 = WFLocalizedStringWithKey(@"Open URL (Contextual Action)", @"Open URL %@");
        v19 = WFLocalizedStringWithKey(@"Open URL (Contextual Action, Title)", @"Open URL");
        objc_super v18 = @"%@";
      }
      v20 = [WFContextualActionParameter alloc];
      v21 = [v10 absoluteString];
      v22 = [(WFContextualActionParameter *)v20 initWithType:@"WFURLContentItem" displayString:0 wfParameterKey:@"WFInput" wfSerializedRepresentation:v21];
      v36 = v22;
      v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v36 count:1];
      v24 = +[WFContextualActionIcon iconWithApplicationBundleIdentifier:v11];
      self = [(WFContextualAction *)self initWithIdentifier:@"is.workflow.actions.openurl" wfActionIdentifier:@"is.workflow.actions.openurl" associatedAppBundleIdentifier:v11 parameters:v23 displayFormatString:v17 title:v19 subtitleFormatString:v18 icon:v24];

      if (self)
      {
        objc_storeStrong((id *)&self->_url, obj);
        v25 = (NSString *)[v11 copy];
        bundleIdentifier = self->_bundleIdentifier;
        self->_bundleIdentifier = v25;

        v27 = self;
      }

      v28 = self;
      id v12 = v34;
      goto LABEL_12;
    }
    id v35 = 0;
    id v13 = v10;
  }
  else
  {
    v30 = [MEMORY[0x1E4F28B00] currentHandler];
    [v30 handleFailureInMethod:a2, self, @"WFOpenURLContextualAction.m", 31, @"Invalid parameter not satisfying: %@", @"url" object file lineNumber description];

    if (v11) {
      goto LABEL_6;
    }
    id v35 = 0;
    v31 = [MEMORY[0x1E4F28B00] currentHandler];
    v32 = objc_msgSend(NSString, "stringWithUTF8String:", "NSString * _Nullable WFBundleIdentifierForHandlingURL(NSURL * _Nonnull __strong, NSError *__autoreleasing  _Nullable * _Nullable)");
    [v31 handleFailureInFunction:v32, @"WFOpenURLContextualAction.m", 23, @"Invalid parameter not satisfying: %@", @"url" file lineNumber description];
  }
  v14 = (void *)[objc_alloc(MEMORY[0x1E4F70BE0]) initWithURL:v10 error:&v35];
  uint64_t v15 = [v14 bundleIdentifier];

  id v16 = v35;
  id v11 = v16;
  if (v15)
  {

    id v11 = (id)v15;
    goto LABEL_6;
  }
  v17 = getWFVoiceShortcutClientLogObject();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v38 = "-[WFOpenURLContextualAction initWithURL:bundleIdentifier:actionTitle:]";
    __int16 v39 = 2112;
    id v40 = v10;
    _os_log_impl(&dword_1B3C5C000, v17, OS_LOG_TYPE_ERROR, "%s Can't determine what bundle identifier can open %@", buf, 0x16u);
  }
  v28 = 0;
LABEL_12:

  return v28;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end