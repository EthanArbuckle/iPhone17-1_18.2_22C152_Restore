@interface ICQTipInfo
+ (BOOL)supportsSecureCoding;
- (ICQTipIcon)icon;
- (ICQTipInfo)initWithCoder:(id)a3;
- (NSArray)actions;
- (NSString)anchor;
- (NSString)id;
- (NSString)subtitle;
- (NSString)title;
- (NSURL)dismissURL;
- (id)_parseTipIcon:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)initFromDictionary:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setActions:(id)a3;
- (void)setAnchor:(id)a3;
- (void)setDismissURL:(id)a3;
- (void)setIcon:(id)a3;
- (void)setId:(id)a3;
- (void)setSubtitle:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation ICQTipInfo

- (id)initFromDictionary:(id)a3
{
  id v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)ICQTipInfo;
  v5 = [(ICQTipInfo *)&v32 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"title"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(ICQTipInfo *)v5 setTitle:v6];
    }
    v7 = [v4 objectForKeyedSubscript:@"subTitle"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(ICQTipInfo *)v5 setSubtitle:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"anchor"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(ICQTipInfo *)v5 setAnchor:v8];
    }
    uint64_t v9 = [v4 objectForKeyedSubscript:@"id"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(ICQTipInfo *)v5 setId:v9];
    }
    v25 = (void *)v9;
    v10 = [v4 objectForKeyedSubscript:@"dismissURL"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v11 = [MEMORY[0x1E4F1CB10] URLWithString:v10];
      if (v11) {
        [(ICQTipInfo *)v5 setDismissURL:v11];
      }
    }
    v12 = [v4 objectForKeyedSubscript:@"icon"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v13 = [(ICQTipInfo *)v5 _parseTipIcon:v12];
      [(ICQTipInfo *)v5 setIcon:v13];
    }
    v14 = [v4 objectForKeyedSubscript:@"actions"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v15 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = __33__ICQTipInfo_initFromDictionary___block_invoke;
      v30[3] = &unk_1E6A531A8;
      id v31 = v15;
      id v16 = v15;
      [v14 enumerateObjectsUsingBlock:v30];
      [(ICQTipInfo *)v5 setActions:v16];
      id v17 = v31;
    }
    else
    {
      id v16 = [v4 objectForKeyedSubscript:@"button"];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_21:

        goto LABEL_22;
      }
      id v18 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __33__ICQTipInfo_initFromDictionary___block_invoke_2;
      v26[3] = &unk_1E6A531D0;
      id v27 = v6;
      v24 = v8;
      v19 = v7;
      v20 = v6;
      v21 = v5;
      v28 = v21;
      id v29 = v18;
      id v17 = v18;
      [v16 enumerateObjectsUsingBlock:v26];
      v22 = v21;
      v6 = v20;
      v7 = v19;
      v8 = v24;
      [(ICQTipInfo *)v22 setActions:v17];
    }
    goto LABEL_21;
  }
LABEL_22:

  return v5;
}

void __33__ICQTipInfo_initFromDictionary___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = [[ICQActionInfo alloc] initFromDictionary:v4];
    if (v3) {
      [*(id *)(a1 + 32) addObject:v3];
    }
  }
}

void __33__ICQTipInfo_initFromDictionary___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = objc_alloc_init(ICQActionInfo);
    [(ICQActionInfo *)v4 setIsDefault:0];
    v5 = [v3 objectForKeyedSubscript:@"url"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v6 = [MEMORY[0x1E4F1CB10] URLWithString:v5];
      if (v6) {
        [(ICQActionInfo *)v4 setActionURL:v6];
      }
    }
    v7 = [v3 objectForKeyedSubscript:@"action"];
    v8 = [v3 objectForKeyedSubscript:@"actionParameters"];
    if (v7)
    {
      id v9 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      if (v8)
      {
        v10 = [v8 objectForKeyedSubscript:@"purchaseAttribution"];
        v11 = [v8 objectForKeyedSubscript:@"route"];
        if (v10) {
          [v9 setObject:v10 forKeyedSubscript:@"purchaseAttribution"];
        }
        if (v11) {
          [v9 setObject:v11 forKeyedSubscript:@"route"];
        }
      }
      if (v5)
      {
        [v9 setObject:v5 forKeyedSubscript:@"URL"];
        [v9 setObject:v5 forKeyedSubscript:@"openURL"];
      }
      v12 = [[ICQLink alloc] initWithText:*(void *)(a1 + 32) action:_ICQActionForServerActionString(v7) parameters:v9];
    }
    else
    {
      v13 = _ICQGetLogSystem();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v16 = 0;
        _os_log_impl(&dword_1D5851000, v13, OS_LOG_TYPE_DEFAULT, "Parsing manage storage tip, no action type found", v16, 2u);
      }

      v12 = 0;
    }
    [(ICQActionInfo *)v4 setIcqLink:v12];
    v14 = [v3 objectForKeyedSubscript:@"text"];
    [(ICQActionInfo *)v4 setTitle:v14];

    id v15 = [*(id *)(a1 + 40) subtitle];
    [(ICQActionInfo *)v4 setSubtitle:v15];

    [(ICQActionInfo *)v4 setConfirmation:0];
    [*(id *)(a1 + 48) addObject:v4];
  }
}

- (id)_parseTipIcon:(id)a3
{
  id v3 = a3;
  id v4 = [v3 objectForKeyedSubscript:@"type"];
  if ([v4 isEqualToString:@"IMAGE"])
  {
    v5 = objc_alloc_init(ICQTipIconURL);
    [(ICQTipIcon *)v5 setType:v4];
    v6 = [v3 objectForKeyedSubscript:@"urls"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v7 = [[ICQImageURL alloc] initFromDictionary:v6];
      [(ICQTipIconURL *)v5 setImageURL:v7];
    }
    goto LABEL_6;
  }
  if ([v4 isEqualToString:@"SF_SYMBOL"])
  {
    v5 = objc_alloc_init(ICQTipIconSymbol);
    [(ICQTipIcon *)v5 setType:v4];
    v8 = [v3 objectForKeyedSubscript:@"path"];
    [(ICQTipIconURL *)v5 setPath:v8];

    id v9 = [v3 objectForKeyedSubscript:@"color"];
    [(ICQTipIconURL *)v5 setSystemColorName:v9];

    v6 = [v3 objectForKeyedSubscript:@"id"];
    [(ICQTipIconURL *)v5 setId:v6];
LABEL_6:

    goto LABEL_8;
  }
  v5 = 0;
LABEL_8:

  return v5;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"id: %@, title: %@, subtitle: %@, anchor: %@, dismissURL: %@, actions: %@, icon: %@", self->_id, self->_title, self->_subtitle, self->_anchor, self->_dismissURL, self->_actions, self->_icon];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(ICQTipInfo);
  [(ICQTipInfo *)v4 setId:self->_id];
  [(ICQTipInfo *)v4 setTitle:self->_title];
  [(ICQTipInfo *)v4 setSubtitle:self->_subtitle];
  [(ICQTipInfo *)v4 setAnchor:self->_anchor];
  [(ICQTipInfo *)v4 setDismissURL:self->_dismissURL];
  [(ICQTipInfo *)v4 setActions:self->_actions];
  [(ICQTipInfo *)v4 setIcon:self->_icon];
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id = self->_id;
  id v5 = a3;
  [v5 encodeObject:id forKey:@"id"];
  [v5 encodeObject:self->_title forKey:@"title"];
  [v5 encodeObject:self->_subtitle forKey:@"subTitle"];
  [v5 encodeObject:self->_anchor forKey:@"anchor"];
  [v5 encodeObject:self->_dismissURL forKey:@"dismissURL"];
  [v5 encodeObject:self->_actions forKey:@"actions"];
  [v5 encodeObject:self->_icon forKey:@"icon"];
}

- (ICQTipInfo)initWithCoder:(id)a3
{
  v25[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)ICQTipInfo;
  id v5 = [(ICQTipInfo *)&v24 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"id"];
    id = v5->_id;
    v5->_id = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"title"];
    title = v5->_title;
    v5->_title = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"subTitle"];
    subtitle = v5->_subtitle;
    v5->_subtitle = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"anchor"];
    anchor = v5->_anchor;
    v5->_anchor = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dismissURL"];
    dismissURL = v5->_dismissURL;
    v5->_dismissURL = (NSURL *)v14;

    id v16 = (void *)MEMORY[0x1E4F1CAD0];
    v25[0] = objc_opt_class();
    v25[1] = objc_opt_class();
    id v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:2];
    id v18 = [v16 setWithArray:v17];

    uint64_t v19 = [v4 decodeObjectOfClasses:v18 forKey:@"actions"];
    actions = v5->_actions;
    v5->_actions = (NSArray *)v19;

    uint64_t v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"icon"];
    icon = v5->_icon;
    v5->_icon = (ICQTipIcon *)v21;
  }
  return v5;
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

- (NSString)anchor
{
  return self->_anchor;
}

- (void)setAnchor:(id)a3
{
}

- (NSString)id
{
  return self->_id;
}

- (void)setId:(id)a3
{
}

- (NSURL)dismissURL
{
  return self->_dismissURL;
}

- (void)setDismissURL:(id)a3
{
}

- (NSArray)actions
{
  return self->_actions;
}

- (void)setActions:(id)a3
{
}

- (ICQTipIcon)icon
{
  return self->_icon;
}

- (void)setIcon:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong((id *)&self->_dismissURL, 0);
  objc_storeStrong((id *)&self->_id, 0);
  objc_storeStrong((id *)&self->_anchor, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end