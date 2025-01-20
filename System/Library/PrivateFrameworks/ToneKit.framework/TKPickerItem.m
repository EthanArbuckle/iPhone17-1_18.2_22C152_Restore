@interface TKPickerItem
- (id)description;
- (int64_t)section;
- (void)_appendDescriptionOfAttributeNamed:(id)a3 withBoolValue:(BOOL)a4 toString:(id)a5;
- (void)_appendDescriptionOfAttributeNamed:(id)a3 withIntegerValue:(int64_t)a4 toString:(id)a5;
- (void)_appendDescriptionOfAttributeNamed:(id)a3 withStringValue:(id)a4 toString:(id)a5;
- (void)_appendDescriptionOfAttributesToString:(id)a3;
- (void)_setSection:(int64_t)a3;
@end

@implementation TKPickerItem

- (id)description
{
  id v3 = objc_alloc(MEMORY[0x263F089D8]);
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = (void *)[v3 initWithFormat:@"<%@: %p", v5, self];

  [(TKPickerItem *)self _appendDescriptionOfAttributesToString:v6];
  [v6 appendString:@">"];

  return v6;
}

- (void)_appendDescriptionOfAttributesToString:(id)a3
{
  id v5 = a3;
  [(TKPickerItem *)self _appendDescriptionOfAttributeNamed:@"section" withIntegerValue:[(TKPickerItem *)self section] toString:v5];
  if ([(TKPickerItem *)self conformsToProtocol:&unk_26D3116E0])
  {
    uint64_t v4 = [(TKPickerItem *)self numberOfChildren];
    if (v4 >= 1) {
      [(TKPickerItem *)self _appendDescriptionOfAttributeNamed:@"numberOfChildren" withIntegerValue:v4 toString:v5];
    }
  }
}

- (void)_appendDescriptionOfAttributeNamed:(id)a3 withIntegerValue:(int64_t)a4 toString:(id)a5
{
  [a5 appendFormat:@"; %@ = %ld", a3, a4];
}

- (void)_appendDescriptionOfAttributeNamed:(id)a3 withBoolValue:(BOOL)a4 toString:(id)a5
{
  id v5 = @"NO";
  if (a4) {
    id v5 = @"YES";
  }
  [a5 appendFormat:@"; %@ = %@", a3, v5];
}

- (void)_appendDescriptionOfAttributeNamed:(id)a3 withStringValue:(id)a4 toString:(id)a5
{
  [a5 appendFormat:@"; %@ = \"%@\"", a3, a4];
}

- (int64_t)section
{
  return self->_section;
}

- (void)_setSection:(int64_t)a3
{
  self->_section = a3;
}

@end