@interface _HDSPConcreteSource
- (BOOL)dontNotify;
- (BOOL)dontSync;
- (NSString)sourceIdentifier;
- (void)setDontNotify:(BOOL)a3;
- (void)setDontSync:(BOOL)a3;
- (void)setSourceIdentifier:(id)a3;
@end

@implementation _HDSPConcreteSource

- (NSString)sourceIdentifier
{
  return self->_sourceIdentifier;
}

- (void)setSourceIdentifier:(id)a3
{
}

- (BOOL)dontNotify
{
  return self->_dontNotify;
}

- (void)setDontNotify:(BOOL)a3
{
  self->_dontNotify = a3;
}

- (BOOL)dontSync
{
  return self->_dontSync;
}

- (void)setDontSync:(BOOL)a3
{
  self->_dontSync = a3;
}

- (void).cxx_destruct
{
}

@end