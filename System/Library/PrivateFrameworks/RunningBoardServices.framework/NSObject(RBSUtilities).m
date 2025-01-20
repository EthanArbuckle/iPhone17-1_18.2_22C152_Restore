@interface NSObject(RBSUtilities)
- (__CFString)NSRepresentation;
- (uint64_t)RBSIsXPCObject;
- (void)NSRepresentation;
@end

@implementation NSObject(RBSUtilities)

- (uint64_t)RBSIsXPCObject
{
  NSClassFromString(&cfstr_OsXpcObject.isa);
  id v0 = (id)objc_claimAutoreleasedReturnValue();
  return objc_opt_isKindOfClass() & 1;
}

- (__CFString)NSRepresentation
{
  if (([a1 conformsToProtocol:&unk_1EE2FBD60] & 1) == 0) {
    -[NSObject(RBSUtilities) NSRepresentation]();
  }
  return nsObjFromXPCObj(a1);
}

- (void)NSRepresentation
{
}

@end