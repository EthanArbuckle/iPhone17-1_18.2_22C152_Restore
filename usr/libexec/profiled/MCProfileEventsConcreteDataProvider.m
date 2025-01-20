@interface MCProfileEventsConcreteDataProvider
- (id)currentTime;
- (id)profileEventsFilePath;
@end

@implementation MCProfileEventsConcreteDataProvider

- (id)profileEventsFilePath
{
  return (id)_MCProfileEventsFilePath(self, a2);
}

- (id)currentTime
{
  return +[NSDate date];
}

@end