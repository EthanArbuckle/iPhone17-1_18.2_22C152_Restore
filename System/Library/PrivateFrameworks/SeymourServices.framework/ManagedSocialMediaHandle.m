@interface ManagedSocialMediaHandle
- (ManagedSocialMediaHandle)initWithEntity:(id)a3 insertIntoManagedObjectContext:(id)a4;
@end

@implementation ManagedSocialMediaHandle

- (ManagedSocialMediaHandle)initWithEntity:(id)a3 insertIntoManagedObjectContext:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for ManagedSocialMediaHandle();
  return [(ManagedSocialMediaHandle *)&v7 initWithEntity:a3 insertIntoManagedObjectContext:a4];
}

@end