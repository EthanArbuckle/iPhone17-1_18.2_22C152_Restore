@interface MRNowPlayingClientCommandQueueEntry
- (MRPlayerPath)playerPath;
- (NSDate)dateCreated;
- (NSMutableDictionary)options;
- (id)commandCompletion;
- (id)description;
- (unsigned)command;
- (void)setCommand:(unsigned int)a3;
- (void)setCommandCompletion:(id)a3;
- (void)setDateCreated:(id)a3;
- (void)setOptions:(id)a3;
- (void)setPlayerPath:(id)a3;
@end

@implementation MRNowPlayingClientCommandQueueEntry

- (id)description
{
  v3 = MRMediaRemoteCopyCommandDescription(self->_command);
  v4 = [NSString stringWithFormat:@"<%@ %p, command = %@, playerPath=%@, options = %@\n>", objc_opt_class(), self, v3, self->_playerPath, self->_options];

  return v4;
}

- (unsigned)command
{
  return self->_command;
}

- (void)setCommand:(unsigned int)a3
{
  self->_command = a3;
}

- (NSMutableDictionary)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
}

- (MRPlayerPath)playerPath
{
  return self->_playerPath;
}

- (void)setPlayerPath:(id)a3
{
}

- (NSDate)dateCreated
{
  return self->_dateCreated;
}

- (void)setDateCreated:(id)a3
{
}

- (id)commandCompletion
{
  return self->_commandCompletion;
}

- (void)setCommandCompletion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_commandCompletion, 0);
  objc_storeStrong((id *)&self->_dateCreated, 0);
  objc_storeStrong((id *)&self->_playerPath, 0);

  objc_storeStrong((id *)&self->_options, 0);
}

@end