@interface TranslationActivity
+ (id)allTranslationActivities;
- (BOOL)canPerformWithTabDocument:(id)a3;
- (BOOL)canPerformWithTranslationContext:(id)a3;
- (WBSTranslationContext)translationContext;
- (id)_systemImageName;
- (id)activityTitleWithTabDocument:(id)a3;
- (id)activityTitleWithTranslationContext:(id)a3;
- (id)activityType;
- (void)performActivityWithTabDocument:(id)a3;
- (void)prepareWithTabDocument:(id)a3;
@end

@implementation TranslationActivity

+ (id)allTranslationActivities
{
  v9[5] = *MEMORY[0x1E4F143B8];
  v2 = objc_alloc_init(ExitTranslationActivity);
  v9[0] = v2;
  v3 = objc_alloc_init(TranslationToAutoLocaleActivity);
  v9[1] = v3;
  v4 = objc_alloc_init(TranslationToChosenLocaleActivity);
  v9[2] = v4;
  v5 = objc_alloc_init(TranslationFeedbackActivity);
  v9[3] = v5;
  v6 = objc_alloc_init(TranslationRadarActivity);
  v9[4] = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:5];

  return v7;
}

- (id)activityTitleWithTabDocument:(id)a3
{
  v4 = [a3 translationContext];
  v5 = [(TranslationActivity *)self activityTitleWithTranslationContext:v4];

  return v5;
}

- (id)activityTitleWithTranslationContext:(id)a3
{
  return &stru_1F3C268E8;
}

- (BOOL)canPerformWithTabDocument:(id)a3
{
  v4 = [a3 translationContext];
  if (v4) {
    BOOL v5 = [(TranslationActivity *)self canPerformWithTranslationContext:v4];
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)canPerformWithTranslationContext:(id)a3
{
  return 1;
}

- (void)prepareWithTabDocument:(id)a3
{
  id v4 = [a3 translationContext];
  [(TranslationActivity *)self prepareWithTranslationContext:v4];
}

- (void)performActivityWithTabDocument:(id)a3
{
  id v4 = [a3 translationContext];
  [(TranslationActivity *)self performActivityWithTranslationContext:v4];
}

- (id)_systemImageName
{
  return @"translate";
}

- (id)activityType
{
  return @"SafariActivityTypeTranslation";
}

- (WBSTranslationContext)translationContext
{
  v2 = [(TabDocumentActivity *)self tabDocument];
  v3 = [v2 translationContext];

  return (WBSTranslationContext *)v3;
}

@end