@interface FCTagSearchOperationResult
- (FCStreamingResults)channels;
- (FCStreamingResults)topics;
- (void)setChannels:(id)a3;
- (void)setTopics:(id)a3;
@end

@implementation FCTagSearchOperationResult

- (FCStreamingResults)channels
{
  return self->_channels;
}

- (void)setChannels:(id)a3
{
}

- (FCStreamingResults)topics
{
  return self->_topics;
}

- (void)setTopics:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topics, 0);
  objc_storeStrong((id *)&self->_channels, 0);
}

@end