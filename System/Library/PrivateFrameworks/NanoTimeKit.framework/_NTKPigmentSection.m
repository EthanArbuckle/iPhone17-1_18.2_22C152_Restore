@interface _NTKPigmentSection
- (NSString)name;
- (NTKPigmentEditOptionArray)items;
- (void)setItems:(id)a3;
- (void)setName:(id)a3;
@end

@implementation _NTKPigmentSection

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NTKPigmentEditOptionArray)items
{
  return self->_items;
}

- (void)setItems:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end