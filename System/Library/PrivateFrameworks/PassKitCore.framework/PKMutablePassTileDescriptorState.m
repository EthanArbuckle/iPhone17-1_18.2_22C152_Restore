@interface PKMutablePassTileDescriptorState
- (id)copyWithZone:(_NSZone *)a3;
- (void)setEnabled:(unint64_t)a3;
- (void)setInProgress:(BOOL)a3;
- (void)setStateIdentifier:(id)a3;
- (void)setStateOverride:(id)a3;
- (void)setSupported:(BOOL)a3;
@end

@implementation PKMutablePassTileDescriptorState

- (id)copyWithZone:(_NSZone *)a3
{
  if (!self) {
    return 0;
  }
  id v4 = [[PKPassTileDescriptorState alloc] initForType:self->super._type];
  -[PKPassTileDescriptorState _copyInto:]((uint64_t)self, (uint64_t)v4);
  return v4;
}

- (void)setSupported:(BOOL)a3
{
  if (self) {
    self->super._supported = a3;
  }
}

- (void)setEnabled:(unint64_t)a3
{
  if (self) {
    self->super._enabled = a3 != 0;
  }
}

- (void)setStateIdentifier:(id)a3
{
  if (self)
  {
    id v4 = (NSString *)[a3 copy];
    stateIdentifier = self->super._stateIdentifier;
    self->super._stateIdentifier = v4;
  }
}

- (void)setStateOverride:(id)a3
{
  id v5 = a3;
  if (self) {
    objc_storeStrong((id *)&self->super._stateOverride, a3);
  }
}

- (void)setInProgress:(BOOL)a3
{
  if (self) {
    self->super._inProgress = a3;
  }
}

@end