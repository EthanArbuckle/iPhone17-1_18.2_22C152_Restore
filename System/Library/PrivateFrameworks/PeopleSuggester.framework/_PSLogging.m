@interface _PSLogging
+ (id)contactEmbeddingChannel;
+ (id)coreBehaviorChannel;
+ (id)familyRecommenderChannel;
+ (id)featureGenerationChannel;
+ (id)feedbackChannel;
+ (id)generalChannel;
+ (id)heuristicsChannel;
+ (id)knnChannel;
+ (id)mediaAnalysisChannel;
+ (id)messagePinningChannel;
+ (id)rewriteChannel;
+ (id)shareExtensionChannel;
+ (id)suggestionSignpost;
@end

@implementation _PSLogging

+ (id)messagePinningChannel
{
  if (messagePinningChannel_onceToken != -1) {
    dispatch_once(&messagePinningChannel_onceToken, &__block_literal_global_3);
  }
  v2 = (void *)messagePinningChannel_messagePinningChannel;

  return v2;
}

+ (id)generalChannel
{
  if (generalChannel_onceToken != -1) {
    dispatch_once(&generalChannel_onceToken, &__block_literal_global_1);
  }
  v2 = (void *)generalChannel_generalChannel;

  return v2;
}

+ (id)familyRecommenderChannel
{
  if (familyRecommenderChannel_onceToken != -1) {
    dispatch_once(&familyRecommenderChannel_onceToken, &__block_literal_global_6);
  }
  v2 = (void *)familyRecommenderChannel_generalChannel;

  return v2;
}

+ (id)heuristicsChannel
{
  if (heuristicsChannel_onceToken != -1) {
    dispatch_once(&heuristicsChannel_onceToken, &__block_literal_global_9);
  }
  v2 = (void *)heuristicsChannel_heuristicsChannel;

  return v2;
}

+ (id)coreBehaviorChannel
{
  if (coreBehaviorChannel_onceToken != -1) {
    dispatch_once(&coreBehaviorChannel_onceToken, &__block_literal_global_12);
  }
  v2 = (void *)coreBehaviorChannel_coreBehaviorChannel;

  return v2;
}

+ (id)knnChannel
{
  if (knnChannel_onceToken != -1) {
    dispatch_once(&knnChannel_onceToken, &__block_literal_global_15);
  }
  v2 = (void *)knnChannel_knnChannel;

  return v2;
}

+ (id)feedbackChannel
{
  if (feedbackChannel_onceToken != -1) {
    dispatch_once(&feedbackChannel_onceToken, &__block_literal_global_18);
  }
  v2 = (void *)feedbackChannel_feedbackChannel;

  return v2;
}

+ (id)shareExtensionChannel
{
  if (shareExtensionChannel_onceToken != -1) {
    dispatch_once(&shareExtensionChannel_onceToken, &__block_literal_global_21);
  }
  v2 = (void *)shareExtensionChannel_shareExtensionChannel;

  return v2;
}

+ (id)mediaAnalysisChannel
{
  if (mediaAnalysisChannel__pasOnceToken10 != -1) {
    dispatch_once(&mediaAnalysisChannel__pasOnceToken10, &__block_literal_global_24);
  }
  v2 = (void *)mediaAnalysisChannel_mediaAnalysisChannel;

  return v2;
}

+ (id)contactEmbeddingChannel
{
  if (contactEmbeddingChannel_onceToken != -1) {
    dispatch_once(&contactEmbeddingChannel_onceToken, &__block_literal_global_27);
  }
  v2 = (void *)contactEmbeddingChannel_contactEmbeddingChannel;

  return v2;
}

+ (id)featureGenerationChannel
{
  if (featureGenerationChannel_onceToken != -1) {
    dispatch_once(&featureGenerationChannel_onceToken, &__block_literal_global_30);
  }
  v2 = (void *)featureGenerationChannel_featureGenerationChannel;

  return v2;
}

+ (id)rewriteChannel
{
  if (rewriteChannel_onceToken != -1) {
    dispatch_once(&rewriteChannel_onceToken, &__block_literal_global_33);
  }
  v2 = (void *)rewriteChannel_rewriteChannel;

  return v2;
}

+ (id)suggestionSignpost
{
  if (suggestionSignpost_onceToken != -1) {
    dispatch_once(&suggestionSignpost_onceToken, &__block_literal_global_36);
  }
  v2 = (void *)suggestionSignpost_suggestionSignpost;

  return v2;
}

@end