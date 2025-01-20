@interface PGMenuItem
- (NSDictionary)dictionaryRepresentation;
- (NSString)description;
- (NSString)symbolName;
- (NSString)title;
- (PGMenuItem)initWithDictionary:(id)a3 action:(id)a4;
- (PGMenuItem)initWithTitle:(id)a3 symbolName:(id)a4 action:(id)a5;
- (id)action;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (int64_t)identifier;
- (void)invokeAction;
@end

@implementation PGMenuItem

- (PGMenuItem)initWithTitle:(id)a3 symbolName:(id)a4 action:(id)a5
{
  v21[3] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)PGMenuItem;
  v11 = [(PGMenuItem *)&v19 init];
  if (v11)
  {
    if (PGMenuItemIdentifier == 0x7FFFFFFFFFFFFFFFLL) {
      uint64_t v12 = 0;
    }
    else {
      uint64_t v12 = PGMenuItemIdentifier + 1;
    }
    PGMenuItemIdentifier = v12;
    v20[0] = &unk_1F0E5D768;
    v20[1] = &unk_1F0E5D780;
    v21[0] = v8;
    v21[1] = v9;
    v20[2] = &unk_1F0E5D798;
    v13 = objc_msgSend(NSNumber, "numberWithInteger:");
    v21[2] = v13;
    uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:3];
    dictionaryRepresentation = v11->_dictionaryRepresentation;
    v11->_dictionaryRepresentation = (NSDictionary *)v14;

    uint64_t v16 = MEMORY[0x1BA99D810](v10);
    id action = v11->_action;
    v11->_id action = (id)v16;
  }
  return v11;
}

- (PGMenuItem)initWithDictionary:(id)a3 action:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PGMenuItem;
  id v8 = [(PGMenuItem *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    dictionaryRepresentation = v8->_dictionaryRepresentation;
    v8->_dictionaryRepresentation = (NSDictionary *)v9;

    uint64_t v11 = MEMORY[0x1BA99D810](v7);
    id action = v8->_action;
    v8->_id action = (id)v11;
  }
  return v8;
}

- (NSString)title
{
  return (NSString *)[(NSDictionary *)self->_dictionaryRepresentation objectForKey:&unk_1F0E5D768];
}

- (NSString)symbolName
{
  return (NSString *)[(NSDictionary *)self->_dictionaryRepresentation objectForKey:&unk_1F0E5D780];
}

- (int64_t)identifier
{
  v2 = [(NSDictionary *)self->_dictionaryRepresentation objectForKey:&unk_1F0E5D798];
  int64_t v3 = [v2 integerValue];

  return v3;
}

- (void)invokeAction
{
}

- (NSString)description
{
  return (NSString *)[(PGMenuItem *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(PGMenuItem *)self succinctDescriptionBuilder];
  int64_t v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  int64_t v3 = [(PGMenuItem *)self descriptionBuilderWithMultilinePrefix:a3];
  v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  v4 = [(PGMenuItem *)self succinctDescriptionBuilder];
  v5 = [(PGMenuItem *)self title];
  [v4 appendString:v5 withName:@"title"];

  id v6 = [(PGMenuItem *)self symbolName];
  [v4 appendString:v6 withName:@"symbolName"];

  id v7 = (id)objc_msgSend(v4, "appendInteger:withName:", -[PGMenuItem identifier](self, "identifier"), @"identifier");

  return v4;
}

- (id)action
{
  return self->_action;
}

- (NSDictionary)dictionaryRepresentation
{
  return self->_dictionaryRepresentation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dictionaryRepresentation, 0);

  objc_storeStrong(&self->_action, 0);
}

@end