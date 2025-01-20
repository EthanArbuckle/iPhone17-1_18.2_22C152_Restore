@interface _SKUIInspectablePropertySection
- (NSMutableArray)properties;
- (NSString)friendlyName;
- (_SKUIInspectablePropertySection)init;
- (void)setFriendlyName:(id)a3;
@end

@implementation _SKUIInspectablePropertySection

- (_SKUIInspectablePropertySection)init
{
  v6.receiver = self;
  v6.super_class = (Class)_SKUIInspectablePropertySection;
  v2 = [(_SKUIInspectablePropertySection *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    properties = v2->_properties;
    v2->_properties = v3;
  }
  return v2;
}

- (NSString)friendlyName
{
  return self->_friendlyName;
}

- (void)setFriendlyName:(id)a3
{
}

- (NSMutableArray)properties
{
  return self->_properties;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_properties, 0);

  objc_storeStrong((id *)&self->_friendlyName, 0);
}

@end