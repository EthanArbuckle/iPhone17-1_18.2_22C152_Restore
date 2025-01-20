@interface MRDRedirectionCacheEntry
- (MRPlayerPath)playerPath;
- (NSMutableDictionary)commandDictionary;
- (NSMutableDictionary)completionBlockDictionary;
- (void)setCommandDictionary:(id)a3;
- (void)setCompletionBlockDictionary:(id)a3;
- (void)setPlayerPath:(id)a3;
@end

@implementation MRDRedirectionCacheEntry

- (MRPlayerPath)playerPath
{
  return self->_playerPath;
}

- (void)setPlayerPath:(id)a3
{
}

- (NSMutableDictionary)commandDictionary
{
  return self->_commandDictionary;
}

- (void)setCommandDictionary:(id)a3
{
}

- (NSMutableDictionary)completionBlockDictionary
{
  return self->_completionBlockDictionary;
}

- (void)setCompletionBlockDictionary:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completionBlockDictionary, 0);
  objc_storeStrong((id *)&self->_commandDictionary, 0);

  objc_storeStrong((id *)&self->_playerPath, 0);
}

@end