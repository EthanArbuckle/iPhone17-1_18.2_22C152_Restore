@interface SAGenericCommand
- (NSString)className;
- (NSString)group;
@end

@implementation SAGenericCommand

- (NSString)group
{
  return (NSString *)[(AceObject *)self topLevelPropertyForKey:@"$group"];
}

- (NSString)className
{
  return (NSString *)[(AceObject *)self topLevelPropertyForKey:@"$class"];
}

@end