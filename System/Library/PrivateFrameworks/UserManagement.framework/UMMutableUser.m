@interface UMMutableUser
- (BOOL)commitChanges;
- (BOOL)commitChangesWithError:(id *)a3;
@end

@implementation UMMutableUser

- (BOOL)commitChanges
{
  v3.receiver = self;
  v3.super_class = (Class)UMMutableUser;
  return [(UMUser *)&v3 commitChanges];
}

- (BOOL)commitChangesWithError:(id *)a3
{
  v4.receiver = self;
  v4.super_class = (Class)UMMutableUser;
  return [(UMUser *)&v4 commitChangesWithError:a3];
}

@end