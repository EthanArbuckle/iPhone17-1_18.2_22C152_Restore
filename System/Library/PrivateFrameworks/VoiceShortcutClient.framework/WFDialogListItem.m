@interface WFDialogListItem
+ (BOOL)supportsSecureCoding;
- (BOOL)hasAltText;
- (BOOL)hasImage;
- (BOOL)hasSubtitle;
- (BOOL)hideSubtitle;
- (BOOL)isEqual:(id)a3;
- (BOOL)selected;
- (BOOL)showingStaticContent;
- (NSString)identifier;
- (NSString)subtitle;
- (NSString)title;
- (WFDialogListItem)initWithCoder:(id)a3;
- (WFDialogListItem)initWithTitle:(id)a3 subtitle:(id)a4 identifier:(id)a5 image:(id)a6 selected:(BOOL)a7 hideSubtitle:(BOOL)a8 encodedTypedValue:(id)a9 serializedPossibleState:(id)a10;
- (WFEncodedTypedValue)encodedTypedValue;
- (WFImage)image;
- (WFPropertyListObject)serializedPossibleState;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setHideSubtitle:(BOOL)a3;
- (void)setImage:(id)a3;
- (void)setSubtitle:(id)a3;
@end

@implementation WFDialogListItem

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_encodedTypedValue, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_serializedPossibleState, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)setHideSubtitle:(BOOL)a3
{
  self->_hideSubtitle = a3;
}

- (BOOL)hideSubtitle
{
  return self->_hideSubtitle;
}

- (void)setImage:(id)a3
{
}

- (WFImage)image
{
  return self->_image;
}

- (void)setSubtitle:(id)a3
{
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (WFEncodedTypedValue)encodedTypedValue
{
  return self->_encodedTypedValue;
}

- (BOOL)hasAltText
{
  return self->_hasAltText;
}

- (BOOL)hasSubtitle
{
  return self->_hasSubtitle;
}

- (BOOL)hasImage
{
  return self->_hasImage;
}

- (BOOL)showingStaticContent
{
  return self->_showingStaticContent;
}

- (NSString)title
{
  return self->_title;
}

- (WFPropertyListObject)serializedPossibleState
{
  return self->_serializedPossibleState;
}

- (BOOL)selected
{
  return self->_selected;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (WFDialogListItem)initWithCoder:(id)a3
{
  id v3 = a3;
  v20 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
  v19 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"title"];
  v4 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"subtitle"];
  v5 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"image"];
  unsigned int v18 = [v3 decodeBoolForKey:@"selected"];
  unsigned int v17 = [v3 decodeBoolForKey:@"hideSubtitle"];
  v6 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"encodedTypedValue"];
  v7 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  v13 = objc_msgSend(v7, "setWithObjects:", v8, v9, v10, v11, v12, objc_opt_class(), 0);
  v14 = [v3 decodeObjectOfClasses:v13 forKey:@"serializedPossibleState"];

  v15 = [(WFDialogListItem *)self initWithTitle:v19 subtitle:v4 identifier:v20 image:v5 selected:v18 hideSubtitle:v17 encodedTypedValue:v6 serializedPossibleState:v14];
  return v15;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(WFDialogListItem *)self identifier];
  [v4 encodeObject:v5 forKey:@"identifier"];

  v6 = [(WFDialogListItem *)self title];
  [v4 encodeObject:v6 forKey:@"title"];

  v7 = [(WFDialogListItem *)self subtitle];
  [v4 encodeObject:v7 forKey:@"subtitle"];

  uint64_t v8 = [(WFDialogListItem *)self image];
  [v4 encodeObject:v8 forKey:@"image"];

  objc_msgSend(v4, "encodeBool:forKey:", -[WFDialogListItem selected](self, "selected"), @"selected");
  objc_msgSend(v4, "encodeBool:forKey:", -[WFDialogListItem hideSubtitle](self, "hideSubtitle"), @"hideSubtitle");
  uint64_t v9 = [(WFDialogListItem *)self encodedTypedValue];
  [v4 encodeObject:v9 forKey:@"encodedTypedValue"];

  id v10 = [(WFDialogListItem *)self serializedPossibleState];
  [v4 encodeObject:v10 forKey:@"serializedPossibleState"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = [(WFDialogListItem *)self identifier];
    v6 = [v4 identifier];
    id v7 = v5;
    id v8 = v6;
    uint64_t v9 = v8;
    if (v7 == v8)
    {
      char v10 = 1;
    }
    else
    {
      char v10 = 0;
      if (v7 && v8) {
        char v10 = [v7 isEqualToString:v8];
      }
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  v2 = [(WFDialogListItem *)self identifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (WFDialogListItem)initWithTitle:(id)a3 subtitle:(id)a4 identifier:(id)a5 image:(id)a6 selected:(BOOL)a7 hideSubtitle:(BOOL)a8 encodedTypedValue:(id)a9 serializedPossibleState:(id)a10
{
  id v29 = a3;
  id v28 = a4;
  id v15 = a5;
  id v27 = a6;
  id v16 = a9;
  id v17 = a10;
  v30.receiver = self;
  v30.super_class = (Class)WFDialogListItem;
  unsigned int v18 = [(WFDialogListItem *)&v30 init];
  if (v18)
  {
    if (v15)
    {
      v19 = (NSString *)v15;
      identifier = v18->_identifier;
      v18->_identifier = v19;
    }
    else
    {
      identifier = [MEMORY[0x1E4F29128] UUID];
      uint64_t v21 = [identifier UUIDString];
      v22 = v18->_identifier;
      v18->_identifier = (NSString *)v21;
    }
    objc_storeStrong((id *)&v18->_title, a3);
    objc_storeStrong((id *)&v18->_subtitle, a4);
    objc_storeStrong((id *)&v18->_image, a6);
    v18->_selected = a7;
    v18->_hideSubtitle = a8;
    objc_storeStrong((id *)&v18->_encodedTypedValue, a9);
    objc_storeStrong((id *)&v18->_serializedPossibleState, a10);
    v23 = v18;
  }

  return v18;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end