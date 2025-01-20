@interface _UISheetActiveDetent
- (NSString)_identifier;
- (_UISheetActiveDetent)initWithIdentifier:(id)a3 value:(double)a4;
- (double)_value;
- (id)description;
@end

@implementation _UISheetActiveDetent

- (void).cxx_destruct
{
}

- (double)_value
{
  return self->__value;
}

- (_UISheetActiveDetent)initWithIdentifier:(id)a3 value:(double)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_UISheetActiveDetent;
  v7 = [(_UISheetActiveDetent *)&v11 init];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    identifier = v7->__identifier;
    v7->__identifier = (NSString *)v8;

    v7->__value = a4;
  }

  return v7;
}

- (NSString)_identifier
{
  return self->__identifier;
}

- (id)description
{
  v8[2] = *MEMORY[0x1E4F143B8];
  v3 = NSStringFromSelector(sel__identifier);
  v8[0] = v3;
  v4 = NSStringFromSelector(sel__value);
  v8[1] = v4;
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:2];
  id v6 = +[UIDescriptionBuilder descriptionForObject:self keys:v5];

  return v6;
}

@end