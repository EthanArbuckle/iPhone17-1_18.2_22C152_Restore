@interface STMutableBackgroundActivitiesStatusDomainDataChangeContext
- (id)copyWithZone:(_NSZone *)a3;
- (void)setUserInitiated:(BOOL)a3;
@end

@implementation STMutableBackgroundActivitiesStatusDomainDataChangeContext

- (void)setUserInitiated:(BOOL)a3
{
  if (self->super._userInitiated != a3) {
    self->super._userInitiated = a3;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = +[STBackgroundActivitiesStatusDomainDataChangeContext allocWithZone:a3];
  if (result)
  {
    id v5 = result;
    BOOL v6 = [(STBackgroundActivitiesStatusDomainDataChangeContext *)self isUserInitiated];
    v7.receiver = v5;
    v7.super_class = (Class)STBackgroundActivitiesStatusDomainDataChangeContext;
    id result = [(STBackgroundActivitiesStatusDomainDataChangeContext *)&v7 init];
    if (result) {
      *((unsigned char *)result + 8) = v6;
    }
  }
  return result;
}

@end