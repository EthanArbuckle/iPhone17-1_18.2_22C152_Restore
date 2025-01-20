@interface _PUPosterEditingLook
- (NSString)description;
- (NSString)displayName;
- (NSString)identifier;
- (NSString)pu_timeFontIdentifier;
- (PRPosterColor)pu_timeFontColor;
- (_PUPosterEditingLook)initWithDisplayName:(id)a3;
- (_PUPosterEditingLook)initWithIdentifier:(id)a3 displayName:(id)a4;
- (_PUPosterEditingLook)initWithIdentifier:(id)a3 displayName:(id)a4 pu_timeAppearance:(unint64_t)a5 pu_timeFontIdentifier:(id)a6 pu_timeFontColor:(id)a7;
- (unint64_t)pu_timeAppearance;
@end

@implementation _PUPosterEditingLook

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pu_timeFontColor, 0);
  objc_storeStrong((id *)&self->_pu_timeFontIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
}

- (PRPosterColor)pu_timeFontColor
{
  return self->_pu_timeFontColor;
}

- (NSString)pu_timeFontIdentifier
{
  return self->_pu_timeFontIdentifier;
}

- (unint64_t)pu_timeAppearance
{
  return self->_pu_timeAppearance;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (NSString)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(_PUPosterEditingLook *)self identifier];
  v6 = [(_PUPosterEditingLook *)self displayName];
  unint64_t v7 = [(_PUPosterEditingLook *)self pu_timeAppearance];
  v8 = [(_PUPosterEditingLook *)self pu_timeFontIdentifier];
  v9 = [(_PUPosterEditingLook *)self pu_timeFontColor];
  objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; identifier = %@, displayName = %@, timeAppearance = %lu, fontIdentifier = %@, fontColor = %@>",
    v4,
    self,
    v5,
    v6,
    v7,
    v8,
  v10 = v9);

  return (NSString *)v10;
}

- (_PUPosterEditingLook)initWithDisplayName:(id)a3
{
  return [(_PUPosterEditingLook *)self initWithIdentifier:a3 displayName:a3];
}

- (_PUPosterEditingLook)initWithIdentifier:(id)a3 displayName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_PUPosterEditingLook;
  v8 = [(_PUPosterEditingLook *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    identifier = v8->_identifier;
    v8->_identifier = (NSString *)v9;

    uint64_t v11 = [v7 copy];
    displayName = v8->_displayName;
    v8->_displayName = (NSString *)v11;
  }
  return v8;
}

- (_PUPosterEditingLook)initWithIdentifier:(id)a3 displayName:(id)a4 pu_timeAppearance:(unint64_t)a5 pu_timeFontIdentifier:(id)a6 pu_timeFontColor:(id)a7
{
  id v13 = a6;
  id v14 = a7;
  v15 = [(_PUPosterEditingLook *)self initWithIdentifier:a3 displayName:a4];
  v16 = v15;
  if (v15)
  {
    v15->_pu_timeAppearance = a5;
    objc_storeStrong((id *)&v15->_pu_timeFontIdentifier, a6);
    objc_storeStrong((id *)&v16->_pu_timeFontColor, a7);
  }

  return v16;
}

@end