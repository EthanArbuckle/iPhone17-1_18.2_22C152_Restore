@interface GroupActivitiesManager.SuggestionProvider
- (UIActivityItemsConfigurationReading)activityItemsConfiguration;
- (_TtCE5MusicC9MusicCore22GroupActivitiesManager18SuggestionProvider)init;
@end

@implementation GroupActivitiesManager.SuggestionProvider

- (_TtCE5MusicC9MusicCore22GroupActivitiesManager18SuggestionProvider)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  v4 = (char *)self
     + OBJC_IVAR____TtCE5MusicC9MusicCore22GroupActivitiesManager18SuggestionProvider_playingItemSuggestion;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((_OWORD *)v4 + 2) = 0u;
  *((_OWORD *)v4 + 3) = 0u;
  *((void *)v4 + 8) = 0;
  v5 = (char *)self
     + OBJC_IVAR____TtCE5MusicC9MusicCore22GroupActivitiesManager18SuggestionProvider_containerItemSuggestion;
  *((void *)v5 + 8) = 0;
  *((_OWORD *)v5 + 2) = 0u;
  *((_OWORD *)v5 + 3) = 0u;
  *(_OWORD *)v5 = 0u;
  *((_OWORD *)v5 + 1) = 0u;
  v7.receiver = self;
  v7.super_class = ObjectType;
  return [(GroupActivitiesManager.SuggestionProvider *)&v7 init];
}

- (UIActivityItemsConfigurationReading)activityItemsConfiguration
{
  v2 = self;
  id v3 = GroupActivitiesManager.SuggestionProvider.activityItemsConfiguration.getter();

  return (UIActivityItemsConfigurationReading *)v3;
}

- (void).cxx_destruct
{
}

@end