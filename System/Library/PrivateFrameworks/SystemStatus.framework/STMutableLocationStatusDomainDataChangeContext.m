@interface STMutableLocationStatusDomainDataChangeContext
- (id)copyWithZone:(_NSZone *)a3;
- (void)setUserInitiated:(BOOL)a3;
- (void)setWantsProminentIndication:(BOOL)a3;
@end

@implementation STMutableLocationStatusDomainDataChangeContext

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[STLocationStatusDomainDataChangeContext allocWithZone:a3];

  return -[STLocationStatusDomainDataChangeContext initWithChangeContext:](v4, self);
}

- (void)setUserInitiated:(BOOL)a3
{
  if (self->super._userInitiated != a3) {
    self->super._userInitiated = a3;
  }
}

- (void)setWantsProminentIndication:(BOOL)a3
{
  if (self->super._wantsProminentIndication != a3) {
    self->super._wantsProminentIndication = a3;
  }
}

@end