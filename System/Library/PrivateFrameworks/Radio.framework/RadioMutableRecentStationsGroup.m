@interface RadioMutableRecentStationsGroup
- (id)copyWithZone:(_NSZone *)a3;
- (void)setActive:(BOOL)a3;
- (void)setLocalizedTitle:(id)a3;
- (void)setStations:(id)a3;
@end

@implementation RadioMutableRecentStationsGroup

- (void)setStations:(id)a3
{
  if (self->super._stations != a3)
  {
    self->super._stations = (NSArray *)[a3 copy];
    MEMORY[0x270F9A758]();
  }
}

- (void)setLocalizedTitle:(id)a3
{
  if (self->super._localizedTitle != a3)
  {
    self->super._localizedTitle = (NSString *)[a3 copy];
    MEMORY[0x270F9A758]();
  }
}

- (void)setActive:(BOOL)a3
{
  self->super._active = a3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_opt_class();
  return [(RadioRecentStationsGroup *)self _copyWithRecentStationsGroupClass:v4];
}

@end