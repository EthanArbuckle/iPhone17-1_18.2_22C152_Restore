@interface SAUUIDToSymbolicate
- (id)debugDescription;
@end

@implementation SAUUIDToSymbolicate

- (id)debugDescription
{
  id v3 = [NSString alloc];
  v4 = [(NSMutableArray *)self->_binaries firstObject];
  v5 = [v4 uuid];
  v6 = [(NSMutableArray *)self->_binaries firstObject];
  v7 = [v6 name];
  v8 = (void *)[v3 initWithFormat:@"%@ %@ (%lu)", v5, v7, -[NSMutableArray count](self->_binaries, "count")];

  return v8;
}

- (void).cxx_destruct
{
}

@end