@interface _REInterfaceValue
- (NSArray)conformedInterfaces;
- (NSHashTable)conformedProtocols;
- (NSMapTable)methods;
- (NSMapTable)properties;
- (_REInterfaceKey)type;
- (void)setConformedInterfaces:(id)a3;
- (void)setConformedProtocols:(id)a3;
- (void)setMethods:(id)a3;
- (void)setProperties:(id)a3;
- (void)setType:(id)a3;
@end

@implementation _REInterfaceValue

- (_REInterfaceKey)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
}

- (NSArray)conformedInterfaces
{
  return self->_conformedInterfaces;
}

- (void)setConformedInterfaces:(id)a3
{
}

- (NSHashTable)conformedProtocols
{
  return self->_conformedProtocols;
}

- (void)setConformedProtocols:(id)a3
{
}

- (NSMapTable)properties
{
  return self->_properties;
}

- (void)setProperties:(id)a3
{
}

- (NSMapTable)methods
{
  return self->_methods;
}

- (void)setMethods:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_methods, 0);
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_conformedProtocols, 0);
  objc_storeStrong((id *)&self->_conformedInterfaces, 0);
  objc_storeStrong((id *)&self->_type, 0);
}

@end