@interface WBSStartPageCustomizationItem
+ (id)itemWithIdentifier:(id)a3 enabled:(BOOL)a4;
+ (id)itemWithIdentifier:(id)a3 title:(id)a4 icon:(id)a5 enabled:(BOOL)a6;
- (BOOL)isEnabled;
- (NSString)title;
- (UIImage)icon;
- (WBSStartPageCustomizationItem)itemWithEnabled:(BOOL)a3;
- (id)description;
- (id)identifier;
@end

@implementation WBSStartPageCustomizationItem

+ (id)itemWithIdentifier:(id)a3 title:(id)a4 icon:(id)a5 enabled:(BOOL)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a4;
  v13 = objc_alloc_init((Class)a1);
  v14 = (void *)v13[2];
  v13[2] = v10;
  id v15 = v10;

  uint64_t v16 = [v12 copy];
  v17 = (void *)v13[3];
  v13[3] = v16;

  v18 = (void *)v13[4];
  v13[4] = v11;

  *((unsigned char *)v13 + 8) = a6;
  return v13;
}

+ (id)itemWithIdentifier:(id)a3 enabled:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = WBSStartPageSectionIdentifierTitle(v6);
  if ([v7 length])
  {
    v8 = WBSStartPageSectionIdentifierIcon(v6);
    v9 = [a1 itemWithIdentifier:v6 title:v7 icon:v8 enabled:v4];
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  if (self->_enabled) {
    v5 = @"YES";
  }
  else {
    v5 = @"NO";
  }
  return (id)objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; identifier = %@; title = %@; enabled = %@>",
               v4,
               self,
               self->_identifier,
               self->_title,
               v5);
}

- (WBSStartPageCustomizationItem)itemWithEnabled:(BOOL)a3
{
  v5 = (id *)objc_alloc_init((Class)objc_opt_class());
  objc_storeStrong(v5 + 2, self->_identifier);
  uint64_t v6 = [(NSString *)self->_title copy];
  id v7 = v5[3];
  v5[3] = (id)v6;

  objc_storeStrong(v5 + 4, self->_icon);
  *((unsigned char *)v5 + 8) = a3;
  return (WBSStartPageCustomizationItem *)v5;
}

- (id)identifier
{
  return self->_identifier;
}

- (NSString)title
{
  return self->_title;
}

- (UIImage)icon
{
  return self->_icon;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong(&self->_identifier, 0);
}

@end