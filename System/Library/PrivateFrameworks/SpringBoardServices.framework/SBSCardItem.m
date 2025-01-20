@interface SBSCardItem
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)requiresPasscode;
- (NSData)iconData;
- (NSDictionary)userInfo;
- (NSString)body;
- (NSString)bundleName;
- (NSString)categoryIdentifier;
- (NSString)identifier;
- (NSString)subtitle;
- (NSString)title;
- (SBSCardItem)initWithCoder:(id)a3;
- (SBSCardItem)initWithIdentifier:(id)a3 categoryIdentifier:(id)a4 iconData:(id)a5 title:(id)a6 subtitle:(id)a7 body:(id)a8 requiresPasscode:(BOOL)a9 bundleName:(id)a10 userInfo:(id)a11;
- (SBSCardItem)initWithIdentifier:(id)a3 iconData:(id)a4 title:(id)a5 body:(id)a6 requiresPasscode:(BOOL)a7 bundleName:(id)a8 userInfo:(id)a9;
- (UIImage)thumbnail;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)sortDate;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setBody:(id)a3;
- (void)setBundleName:(id)a3;
- (void)setCategoryIdentifier:(id)a3;
- (void)setIconData:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setRequiresPasscode:(BOOL)a3;
- (void)setSubtitle:(id)a3;
- (void)setThumbnail:(id)a3;
- (void)setTitle:(id)a3;
- (void)setUserInfo:(id)a3;
@end

@implementation SBSCardItem

- (SBSCardItem)initWithIdentifier:(id)a3 categoryIdentifier:(id)a4 iconData:(id)a5 title:(id)a6 subtitle:(id)a7 body:(id)a8 requiresPasscode:(BOOL)a9 bundleName:(id)a10 userInfo:(id)a11
{
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v20 = a6;
  id v21 = a7;
  id v22 = a8;
  id v23 = a10;
  id v24 = a11;
  v27.receiver = self;
  v27.super_class = (Class)SBSCardItem;
  v25 = [(SBSCardItem *)&v27 init];
  if (v24 && ([MEMORY[0x1E4F28F98] propertyList:v24 isValidForFormat:200] & 1) == 0)
  {

    v25 = 0;
  }
  else if (v25)
  {
    [(SBSCardItem *)v25 setIdentifier:v17];
    [(SBSCardItem *)v25 setCategoryIdentifier:v18];
    [(SBSCardItem *)v25 setIconData:v19];
    [(SBSCardItem *)v25 setTitle:v20];
    [(SBSCardItem *)v25 setSubtitle:v21];
    [(SBSCardItem *)v25 setBody:v22];
    [(SBSCardItem *)v25 setRequiresPasscode:a9];
    [(SBSCardItem *)v25 setBundleName:v23];
    [(SBSCardItem *)v25 setUserInfo:v24];
  }

  return v25;
}

- (SBSCardItem)initWithIdentifier:(id)a3 iconData:(id)a4 title:(id)a5 body:(id)a6 requiresPasscode:(BOOL)a7 bundleName:(id)a8 userInfo:(id)a9
{
  LOBYTE(v10) = a7;
  return [(SBSCardItem *)self initWithIdentifier:a3 categoryIdentifier:0 iconData:a4 title:a5 subtitle:0 body:a6 requiresPasscode:v10 bundleName:a8 userInfo:a9];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SBSCardItem)initWithCoder:(id)a3
{
  id v3 = a3;
  v4 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
  v5 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"categoryIdentifier"];
  v6 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"iconData"];
  v7 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"title"];
  v8 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"subtitle"];
  v9 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"description"];
  char v10 = [v3 decodeBoolForKey:@"requiresPasscode"];
  v11 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"bundleName"];
  v12 = [v3 decodePropertyListForKey:@"userInfo"];

  LOBYTE(v15) = v10;
  v13 = [(SBSCardItem *)self initWithIdentifier:v4 categoryIdentifier:v5 iconData:v6 title:v7 subtitle:v8 body:v9 requiresPasscode:v15 bundleName:v11 userInfo:v12];

  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(SBSCardItem *)self identifier];
  [v4 encodeObject:v5 forKey:@"identifier"];

  v6 = [(SBSCardItem *)self categoryIdentifier];
  [v4 encodeObject:v6 forKey:@"categoryIdentifier"];

  v7 = [(SBSCardItem *)self iconData];
  [v4 encodeObject:v7 forKey:@"iconData"];

  v8 = [(SBSCardItem *)self title];
  [v4 encodeObject:v8 forKey:@"title"];

  v9 = [(SBSCardItem *)self subtitle];
  [v4 encodeObject:v9 forKey:@"subtitle"];

  char v10 = [(SBSCardItem *)self body];
  [v4 encodeObject:v10 forKey:@"description"];

  [v4 encodeBool:-[SBSCardItem requiresPasscode](self, "requiresPasscode") forKey:@"requiresPasscode"];
  v11 = [(SBSCardItem *)self bundleName];
  [v4 encodeObject:v11 forKey:@"bundleName"];

  id v12 = [(SBSCardItem *)self userInfo];
  [v4 encodeObject:v12 forKey:@"userInfo"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [[[objc_opt_class() allocWithZone:a3] init] autorelease];
  v5 = [(SBSCardItem *)self identifier];
  [v4 setIdentifier:v5];

  v6 = [(SBSCardItem *)self categoryIdentifier];
  [v4 setCategoryIdentifier:v6];

  v7 = [(SBSCardItem *)self iconData];
  [v4 setIconData:v7];

  v8 = [(SBSCardItem *)self title];
  [v4 setTitle:v8];

  v9 = [(SBSCardItem *)self subtitle];
  [v4 setSubtitle:v9];

  char v10 = [(SBSCardItem *)self body];
  [v4 setBody:v10];

  [v4 setRequiresPasscode:[self requiresPasscode]];
  v11 = [(SBSCardItem *)self bundleName];
  [v4 setBundleName:v11];

  id v12 = [(SBSCardItem *)self userInfo];
  [v4 setUserInfo:v12];

  return v4;
}

- (id)sortDate
{
  v2 = [MEMORY[0x1E4F1C9C8] distantFuture];
  id v3 = [v2 dateByAddingTimeInterval:1.0];

  return v3;
}

- (unint64_t)hash
{
  id v3 = [MEMORY[0x1E4F4F758] builder];
  id v4 = [(SBSCardItem *)self identifier];
  id v5 = (id)[v3 appendObject:v4];

  v6 = [(SBSCardItem *)self categoryIdentifier];
  id v7 = (id)[v3 appendObject:v6];

  v8 = [(SBSCardItem *)self iconData];
  id v9 = (id)[v3 appendObject:v8];

  char v10 = [(SBSCardItem *)self title];
  id v11 = (id)[v3 appendObject:v10];

  id v12 = [(SBSCardItem *)self subtitle];
  id v13 = (id)[v3 appendObject:v12];

  v14 = [(SBSCardItem *)self body];
  id v15 = (id)[v3 appendObject:v14];

  id v16 = [v3 appendBool:-[SBSCardItem requiresPasscode](self, "requiresPasscode")];
  id v17 = [(SBSCardItem *)self bundleName];
  id v18 = (id)[v3 appendObject:v17];

  id v19 = [(SBSCardItem *)self userInfo];
  id v20 = (id)[v3 appendObject:v19];

  unint64_t v21 = [v3 hash];
  return v21;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (SBSCardItem *)a3;
  if (self == v4)
  {
    char v34 = 1;
  }
  else
  {
    id v5 = [MEMORY[0x1E4F4F738] builderWithObject:v4 ofExpectedClass:objc_opt_class()];
    v6 = v4;
    id v7 = [(SBSCardItem *)self identifier];
    v52[0] = MEMORY[0x1E4F143A8];
    v52[1] = 3221225472;
    v52[2] = __23__SBSCardItem_isEqual___block_invoke;
    v52[3] = &unk_1E566CB30;
    v8 = v6;
    v53 = v8;
    id v9 = (id)[v5 appendString:v7 counterpart:v52];

    char v10 = [(SBSCardItem *)self categoryIdentifier];
    v50[0] = MEMORY[0x1E4F143A8];
    v50[1] = 3221225472;
    v50[2] = __23__SBSCardItem_isEqual___block_invoke_2;
    v50[3] = &unk_1E566CB30;
    id v11 = v8;
    v51 = v11;
    id v12 = (id)[v5 appendString:v10 counterpart:v50];

    id v13 = [(SBSCardItem *)self iconData];
    v48[0] = MEMORY[0x1E4F143A8];
    v48[1] = 3221225472;
    v48[2] = __23__SBSCardItem_isEqual___block_invoke_3;
    v48[3] = &unk_1E566CEC0;
    v14 = v11;
    v49 = v14;
    id v15 = (id)[v5 appendObject:v13 counterpart:v48];

    id v16 = [(SBSCardItem *)self title];
    v46[0] = MEMORY[0x1E4F143A8];
    v46[1] = 3221225472;
    v46[2] = __23__SBSCardItem_isEqual___block_invoke_4;
    v46[3] = &unk_1E566CB30;
    id v17 = v14;
    v47 = v17;
    id v18 = (id)[v5 appendString:v16 counterpart:v46];

    id v19 = [(SBSCardItem *)self subtitle];
    v44[0] = MEMORY[0x1E4F143A8];
    v44[1] = 3221225472;
    v44[2] = __23__SBSCardItem_isEqual___block_invoke_5;
    v44[3] = &unk_1E566CB30;
    id v20 = v17;
    v45 = v20;
    id v21 = (id)[v5 appendString:v19 counterpart:v44];

    id v22 = [(SBSCardItem *)self body];
    v42[0] = MEMORY[0x1E4F143A8];
    v42[1] = 3221225472;
    v42[2] = __23__SBSCardItem_isEqual___block_invoke_6;
    v42[3] = &unk_1E566CB30;
    id v23 = v20;
    v43 = v23;
    id v24 = (id)[v5 appendString:v22 counterpart:v42];

    BOOL v25 = [(SBSCardItem *)self requiresPasscode];
    v40[0] = MEMORY[0x1E4F143A8];
    v40[1] = 3221225472;
    v40[2] = __23__SBSCardItem_isEqual___block_invoke_7;
    v40[3] = &unk_1E566CF10;
    v26 = v23;
    v41 = v26;
    id v27 = (id)[v5 appendBool:v25 counterpart:v40];
    v28 = [(SBSCardItem *)self bundleName];
    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = __23__SBSCardItem_isEqual___block_invoke_8;
    v38[3] = &unk_1E566CB30;
    v29 = v26;
    id v39 = v29;
    id v30 = (id)[v5 appendString:v28 counterpart:v38];

    v31 = [(SBSCardItem *)self userInfo];
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __23__SBSCardItem_isEqual___block_invoke_9;
    v36[3] = &unk_1E566D3A0;
    id v37 = v29;
    id v32 = v29;
    id v33 = (id)[v5 appendObject:v31 counterpart:v36];

    char v34 = [v5 isEqual];
  }

  return v34;
}

uint64_t __23__SBSCardItem_isEqual___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) identifier];
}

uint64_t __23__SBSCardItem_isEqual___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) categoryIdentifier];
}

uint64_t __23__SBSCardItem_isEqual___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) iconData];
}

uint64_t __23__SBSCardItem_isEqual___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) title];
}

uint64_t __23__SBSCardItem_isEqual___block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) subtitle];
}

uint64_t __23__SBSCardItem_isEqual___block_invoke_6(uint64_t a1)
{
  return [*(id *)(a1 + 32) body];
}

uint64_t __23__SBSCardItem_isEqual___block_invoke_7(uint64_t a1)
{
  return [*(id *)(a1 + 32) requiresPasscode];
}

uint64_t __23__SBSCardItem_isEqual___block_invoke_8(uint64_t a1)
{
  return [*(id *)(a1 + 32) bundleName];
}

uint64_t __23__SBSCardItem_isEqual___block_invoke_9(uint64_t a1)
{
  return [*(id *)(a1 + 32) userInfo];
}

- (id)description
{
  id v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = [(SBSCardItem *)self identifier];
  v6 = [(SBSCardItem *)self categoryIdentifier];
  id v7 = [(SBSCardItem *)self title];
  v8 = [(SBSCardItem *)self body];
  BOOL v9 = [(SBSCardItem *)self requiresPasscode];
  char v10 = [(SBSCardItem *)self bundleName];
  id v11 = [(SBSCardItem *)self userInfo];
  id v12 = [v3 stringWithFormat:@"<%@:%p {identifier=%@ categoryIdentifier:=%@ title=%@ body=%@ requiresPasscode=%d bundleName=%@ userInfo=%@}>", v4, self, v5, v6, v7, v8, v9, v10, v11];

  return v12;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)categoryIdentifier
{
  return self->_categoryIdentifier;
}

- (void)setCategoryIdentifier:(id)a3
{
}

- (NSData)iconData
{
  return self->_iconData;
}

- (void)setIconData:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
}

- (NSString)body
{
  return self->_body;
}

- (void)setBody:(id)a3
{
}

- (BOOL)requiresPasscode
{
  return self->_requiresPasscode;
}

- (void)setRequiresPasscode:(BOOL)a3
{
  self->_requiresPasscode = a3;
}

- (NSString)bundleName
{
  return self->_bundleName;
}

- (void)setBundleName:(id)a3
{
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
}

- (UIImage)thumbnail
{
  return self->_thumbnail;
}

- (void)setThumbnail:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thumbnail, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_bundleName, 0);
  objc_storeStrong((id *)&self->_body, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_iconData, 0);
  objc_storeStrong((id *)&self->_categoryIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end