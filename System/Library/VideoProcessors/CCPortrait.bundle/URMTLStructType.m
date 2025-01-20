@interface URMTLStructType
- (NSArray)members;
- (URMTLStructType)init;
- (void)setMembers:(id)a3;
@end

@implementation URMTLStructType

- (URMTLStructType)init
{
  v3.receiver = self;
  v3.super_class = (Class)URMTLStructType;
  return [(URMTLStructType *)&v3 init];
}

- (NSArray)members
{
  return self->_members;
}

- (void)setMembers:(id)a3
{
}

- (void).cxx_destruct
{
}

@end