@interface SDContactFetchResult
- (NSArray)events;
- (NSData)currentHistoryToken;
- (void)setCurrentHistoryToken:(id)a3;
- (void)setEvents:(id)a3;
@end

@implementation SDContactFetchResult

- (NSArray)events
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (void)setEvents:(id)a3
{
}

- (NSData)currentHistoryToken
{
  return (NSData *)objc_getProperty(self, a2, 16, 1);
}

- (void)setCurrentHistoryToken:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentHistoryToken, 0);

  objc_storeStrong((id *)&self->_events, 0);
}

@end