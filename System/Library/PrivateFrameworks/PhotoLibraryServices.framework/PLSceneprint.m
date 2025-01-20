@interface PLSceneprint
+ (id)entityName;
+ (id)insertInCurrentManagedObjectContext:(id)a3 withAdditionalAssetAttributes:(id)a4;
- (void)setDuplicateMatchingData:(id)a3 duplicateMatchingAlternateData:(id)a4;
- (void)willSave;
@end

@implementation PLSceneprint

+ (id)entityName
{
  return @"Sceneprint";
}

- (void)willSave
{
  v7.receiver = self;
  v7.super_class = (Class)PLSceneprint;
  [(PLManagedObject *)&v7 willSave];
  v3 = [(PLSceneprint *)self changedValues];
  if (([(PLSceneprint *)self isDeleted] & 1) == 0 && (MEMORY[0x19F38C0C0]() & 1) == 0)
  {
    v4 = [v3 objectForKeyedSubscript:@"duplicateMatchingData"];
    if (v4)
    {

LABEL_6:
      v6 = [(PLManagedObject *)self photoLibrary];
      +[PLDuplicateProcessor signalBackgroundJobServiceDuplicateProcessingWithLibrary:v6];

      goto LABEL_7;
    }
    v5 = [v3 objectForKeyedSubscript:@"duplicateMatchingAlternateData"];

    if (v5) {
      goto LABEL_6;
    }
  }
LABEL_7:
}

- (void)setDuplicateMatchingData:(id)a3 duplicateMatchingAlternateData:(id)a4
{
  unint64_t v9 = (unint64_t)a3;
  unint64_t v6 = (unint64_t)a4;
  if (!(v9 | v6))
  {
    [(PLSceneprint *)self setDuplicateMatchingData:0];
    objc_super v7 = self;
    unint64_t v8 = 0;
LABEL_7:
    [(PLSceneprint *)v7 setDuplicateMatchingAlternateData:v8];
    goto LABEL_8;
  }
  if (v9) {
    [(PLSceneprint *)self setDuplicateMatchingData:v9];
  }
  if (v6)
  {
    objc_super v7 = self;
    unint64_t v8 = v6;
    goto LABEL_7;
  }
LABEL_8:
}

+ (id)insertInCurrentManagedObjectContext:(id)a3 withAdditionalAssetAttributes:(id)a4
{
  id v5 = a4;
  unint64_t v6 = +[PLManagedObject insertInManagedObjectContext:a3];
  objc_super v7 = v6;
  if (v6) {
    [v6 setAdditionalAssetAttributes:v5];
  }

  return v7;
}

@end