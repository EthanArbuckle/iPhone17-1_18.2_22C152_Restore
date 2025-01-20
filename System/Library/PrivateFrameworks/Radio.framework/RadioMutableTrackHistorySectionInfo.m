@interface RadioMutableTrackHistorySectionInfo
- (void)setIndexTitle:(id)a3;
- (void)setName:(id)a3;
- (void)setNumberOfObjects:(unint64_t)a3;
- (void)setObjects:(id)a3;
@end

@implementation RadioMutableTrackHistorySectionInfo

- (void)setObjects:(id)a3
{
  self->super._objects = (NSArray *)[a3 copy];
  MEMORY[0x270F9A758]();
}

- (void)setNumberOfObjects:(unint64_t)a3
{
  self->super._numberOfObjects = a3;
}

- (void)setName:(id)a3
{
  self->super._name = (NSString *)[a3 copy];
  MEMORY[0x270F9A758]();
}

- (void)setIndexTitle:(id)a3
{
  self->super._indexTitle = (NSString *)[a3 copy];
  MEMORY[0x270F9A758]();
}

@end