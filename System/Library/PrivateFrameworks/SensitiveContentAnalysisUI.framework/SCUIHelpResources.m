@interface SCUIHelpResources
+ (void)obtainChatWithParentsURL:(id)a3;
+ (void)openChatWithParents;
@end

@implementation SCUIHelpResources

+ (void)openChatWithParents
{
  int64_t v2 = +[SCUIHelpResources getCurrentInterventionType];

  +[SCUIContactParentsHelper openChatWithParentsForInterventionType:v2];
}

+ (void)obtainChatWithParentsURL:(id)a3
{
  id v3 = a3;
  +[SCUIContactParentsHelper obtainChatWithParentsURLForInterventionType:completionHandler:](SCUIContactParentsHelper, "obtainChatWithParentsURLForInterventionType:completionHandler:", +[SCUIHelpResources getCurrentInterventionType], v3);
}

@end