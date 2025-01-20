@interface CHChannelUndoState
- (BOOL)flagsOnly;
- (CHChannelUndoState)initWithChannel:(id)a3;
- (CHChannelUndoState)initWithChannel:(id)a3 flagsOnly:(BOOL)a4;
- (void)dealloc;
- (void)restoreChannel:(id)a3;
@end

@implementation CHChannelUndoState

- (void)dealloc
{
  ChannelStateDestroy((uint64_t)self->_pOZChannel, 1);
  v3.receiver = self;
  v3.super_class = (Class)CHChannelUndoState;
  [(CHChannelUndoState *)&v3 dealloc];
}

- (CHChannelUndoState)initWithChannel:(id)a3
{
  return [(CHChannelUndoState *)self initWithChannel:a3 flagsOnly:0];
}

- (CHChannelUndoState)initWithChannel:(id)a3 flagsOnly:(BOOL)a4
{
  BOOL v4 = a4;
  v8.receiver = self;
  v8.super_class = (Class)CHChannelUndoState;
  v6 = [(CHChannelUndoState *)&v8 init];
  if (v6)
  {
    v6->_pOZChannel = (OZChannelBase *)ChannelStateCopy((OZChannelBase *)[a3 ozChannel], v4);
    v6->_flagsOnly = v4;
  }
  return v6;
}

- (void)restoreChannel:(id)a3
{
}

- (BOOL)flagsOnly
{
  return self->_flagsOnly;
}

@end