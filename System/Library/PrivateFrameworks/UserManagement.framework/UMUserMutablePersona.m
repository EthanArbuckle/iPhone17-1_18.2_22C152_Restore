@interface UMUserMutablePersona
- (BOOL)commitChanges;
- (BOOL)commitChangesWithError:(id *)a3;
@end

@implementation UMUserMutablePersona

- (BOOL)commitChanges
{
  v3.receiver = self;
  v3.super_class = (Class)UMUserMutablePersona;
  return [(UMUserPersona *)&v3 commitChanges];
}

- (BOOL)commitChangesWithError:(id *)a3
{
  v4.receiver = self;
  v4.super_class = (Class)UMUserMutablePersona;
  return [(UMUserPersona *)&v4 commitChangesWithError:a3];
}

@end