@interface VUIRolesEntity
- (NSString)characterName;
- (NSString)personName;
- (NSString)roleTitle;
- (NSString)type;
- (VUIRolesEntity)initWithDictionary:(id)a3;
- (id)description;
- (void)setCharacterName:(id)a3;
- (void)setPersonName:(id)a3;
- (void)setRoleTitle:(id)a3;
- (void)setType:(id)a3;
@end

@implementation VUIRolesEntity

- (VUIRolesEntity)initWithDictionary:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)VUIRolesEntity;
  v5 = [(VUIRolesEntity *)&v15 init];
  if (v5 && [v4 count])
  {
    uint64_t v6 = objc_msgSend(v4, "vui_stringForKey:", @"type");
    type = v5->_type;
    v5->_type = (NSString *)v6;

    uint64_t v8 = objc_msgSend(v4, "vui_stringForKey:", @"roleTitle");
    roleTitle = v5->_roleTitle;
    v5->_roleTitle = (NSString *)v8;

    uint64_t v10 = objc_msgSend(v4, "vui_stringForKey:", @"personName");
    personName = v5->_personName;
    v5->_personName = (NSString *)v10;

    uint64_t v12 = objc_msgSend(v4, "vui_stringForKey:", @"characterName");
    characterName = v5->_characterName;
    v5->_characterName = (NSString *)v12;
  }
  return v5;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"Role type: %@, title: %@, person: %@, character: %@ ", self->_type, self->_roleTitle, self->_personName, self->_characterName];
}

- (NSString)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
}

- (NSString)roleTitle
{
  return self->_roleTitle;
}

- (void)setRoleTitle:(id)a3
{
}

- (NSString)personName
{
  return self->_personName;
}

- (void)setPersonName:(id)a3
{
}

- (NSString)characterName
{
  return self->_characterName;
}

- (void)setCharacterName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_characterName, 0);
  objc_storeStrong((id *)&self->_personName, 0);
  objc_storeStrong((id *)&self->_roleTitle, 0);
  objc_storeStrong((id *)&self->_type, 0);
}

@end