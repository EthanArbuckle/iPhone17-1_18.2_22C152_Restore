@interface SBSystemNotesPositionConfiguration
- (BOOL)edgeProtectEnabled;
- (SBSystemNotesPositionConfiguration)initWithEdgeProtectEnabled:(BOOL)a3 position:(unint64_t)a4;
- (unint64_t)position;
- (void)setEdgeProtectEnabled:(BOOL)a3;
- (void)setPosition:(unint64_t)a3;
@end

@implementation SBSystemNotesPositionConfiguration

- (SBSystemNotesPositionConfiguration)initWithEdgeProtectEnabled:(BOOL)a3 position:(unint64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)SBSystemNotesPositionConfiguration;
  result = [(SBSystemNotesPositionConfiguration *)&v7 init];
  if (result)
  {
    result->_edgeProtectEnabled = a3;
    result->_position = a4;
  }
  return result;
}

- (BOOL)edgeProtectEnabled
{
  return self->_edgeProtectEnabled;
}

- (void)setEdgeProtectEnabled:(BOOL)a3
{
  self->_edgeProtectEnabled = a3;
}

- (unint64_t)position
{
  return self->_position;
}

- (void)setPosition:(unint64_t)a3
{
  self->_position = a3;
}

@end