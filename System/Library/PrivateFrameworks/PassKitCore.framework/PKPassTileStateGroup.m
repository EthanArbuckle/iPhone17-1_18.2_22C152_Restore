@interface PKPassTileStateGroup
+ (BOOL)supportsSecureCoding;
+ (id)_createDefaultDashboardGroupStateWithMetadata:(id)a3;
- (BOOL)_setUpWithDictionary:(id)a3;
- (BOOL)isEqualToUnresolvedState:(id)a3;
- (NSString)footer;
- (NSString)footerActionTitle;
- (NSString)header;
- (NSString)headerActionTitle;
- (PKPassTileStateGroup)initWithCoder:(id)a3;
- (id)createResolvedStateWithBundle:(id)a3 privateBundle:(id)a4;
- (void)encodeWithCoder:(id)a3;
- (void)setFooter:(id)a3;
- (void)setFooterActionTitle:(id)a3;
- (void)setHeader:(id)a3;
- (void)setHeaderActionTitle:(id)a3;
@end

@implementation PKPassTileStateGroup

+ (id)_createDefaultDashboardGroupStateWithMetadata:(id)a3
{
  id v3 = +[PKPassTileState _createWithType:3];
  v4 = [v3 stateTypeGroup];

  [v4 setEnabled:1];
  v5 = (void *)[v4 createResolvedStateWithBundle:0 privateBundle:0];

  return v5;
}

- (BOOL)_setUpWithDictionary:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKPassTileStateGroup;
  BOOL v5 = [(PKPassTileState *)&v11 _setUpWithDictionary:v4];
  if (v5)
  {
    v6 = [v4 PKStringForKey:@"header"];
    header = self->_header;
    self->_header = v6;

    v8 = [v4 PKStringForKey:@"footer"];
    footer = self->_footer;
    self->_footer = v8;
  }
  return v5;
}

- (id)createResolvedStateWithBundle:(id)a3 privateBundle:(id)a4
{
  v14.receiver = self;
  v14.super_class = (Class)PKPassTileStateGroup;
  id v6 = a4;
  id v7 = a3;
  v8 = [(PKPassTileState *)&v14 createResolvedStateWithBundle:v7 privateBundle:v6];
  uint64_t v9 = PKLocalizedPassStringForPassBundle(self->_header, v7, v6);
  v10 = (void *)v8[8];
  v8[8] = v9;

  uint64_t v11 = PKLocalizedPassStringForPassBundle(self->_footer, v7, v6);

  v12 = (void *)v8[9];
  v8[9] = v11;

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPassTileStateGroup)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PKPassTileStateGroup;
  BOOL v5 = [(PKPassTileState *)&v15 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"header"];
    header = v5->_header;
    v5->_header = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"footer"];
    footer = v5->_footer;
    v5->_footer = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"actionTitle"];
    headerActionTitle = v5->_headerActionTitle;
    v5->_headerActionTitle = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"footerActionTitle"];
    footerActionTitle = v5->_footerActionTitle;
    v5->_footerActionTitle = (NSString *)v12;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PKPassTileStateGroup;
  id v4 = a3;
  [(PKPassTileState *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_header, @"header", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_footer forKey:@"footer"];
  [v4 encodeObject:self->_headerActionTitle forKey:@"actionTitle"];
  [v4 encodeObject:self->_footerActionTitle forKey:@"footerActionTitle"];
}

- (BOOL)isEqualToUnresolvedState:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PKPassTileStateGroup;
  if ([(PKPassTileState *)&v17 isEqualToUnresolvedState:v4])
  {
    objc_super v5 = (id *)v4;
    header = self->_header;
    id v7 = (NSString *)v5[8];
    uint64_t v8 = header;
    if (v7 == v8)
    {
    }
    else
    {
      uint64_t v9 = v8;
      if (v7) {
        BOOL v10 = v8 == 0;
      }
      else {
        BOOL v10 = 1;
      }
      if (v10) {
        goto LABEL_17;
      }
      BOOL v11 = [(NSString *)v7 isEqualToString:v8];

      if (!v11)
      {
        char v12 = 0;
LABEL_20:

        goto LABEL_21;
      }
    }
    footer = self->_footer;
    id v7 = (NSString *)v5[9];
    objc_super v14 = footer;
    if (v7 == v14)
    {
      char v12 = 1;
      uint64_t v9 = v7;
      goto LABEL_19;
    }
    uint64_t v9 = v14;
    if (v7) {
      BOOL v15 = v14 == 0;
    }
    else {
      BOOL v15 = 1;
    }
    if (!v15)
    {
      char v12 = [(NSString *)v7 isEqualToString:v14];
LABEL_19:

      goto LABEL_20;
    }
LABEL_17:
    char v12 = 0;
    goto LABEL_19;
  }
  char v12 = 0;
LABEL_21:

  return v12;
}

- (NSString)header
{
  return self->_header;
}

- (void)setHeader:(id)a3
{
}

- (NSString)footer
{
  return self->_footer;
}

- (void)setFooter:(id)a3
{
}

- (NSString)headerActionTitle
{
  return self->_headerActionTitle;
}

- (void)setHeaderActionTitle:(id)a3
{
}

- (NSString)footerActionTitle
{
  return self->_footerActionTitle;
}

- (void)setFooterActionTitle:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_footerActionTitle, 0);
  objc_storeStrong((id *)&self->_headerActionTitle, 0);
  objc_storeStrong((id *)&self->_footer, 0);
  objc_storeStrong((id *)&self->_header, 0);
}

@end