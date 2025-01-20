@interface MTTheme(Library)
+ (id)insertNewTheme:()Library forUuid:inMOC:;
+ (uint64_t)createOrUpdateTheme:()Library forUuid:inMOC:;
- (id)convertToColorTheme;
- (uint64_t)populateWithColorTheme:()Library;
@end

@implementation MTTheme(Library)

+ (uint64_t)createOrUpdateTheme:()Library forUuid:inMOC:
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = [v9 themeForUuid:v8];
  v11 = v10;
  if (!v10)
  {
    id v15 = (id)[MEMORY[0x1E4F91FB8] insertNewTheme:v7 forUuid:v8 inMOC:v9];
LABEL_6:
    uint64_t v14 = 1;
    goto LABEL_7;
  }
  v12 = [v10 convertToColorTheme];
  char v13 = [v12 isEqual:v7];

  if ((v13 & 1) == 0)
  {
    [v11 populateWithColorTheme:v7];
    goto LABEL_6;
  }
  uint64_t v14 = 0;
LABEL_7:

  return v14;
}

+ (id)insertNewTheme:()Library forUuid:inMOC:
{
  id v7 = (void *)MEMORY[0x1E4F1C0A8];
  id v8 = a4;
  id v9 = a3;
  v10 = [v7 insertNewObjectForEntityForName:@"MTTheme" inManagedObjectContext:a5];
  [v10 setUuid:v8];

  [v10 populateWithColorTheme:v9];

  return v10;
}

- (id)convertToColorTheme
{
  v2 = objc_opt_new();
  v3 = [a1 backgroundColor];
  [v2 setBackgroundColor:v3];

  v4 = [a1 primaryTextColor];
  [v2 setPrimaryTextColor:v4];

  v5 = [a1 secondaryTextColor];
  [v2 setSecondaryTextColor:v5];

  objc_msgSend(v2, "setIsBackgroundLight:", objc_msgSend(a1, "isBackgroundLight"));

  return v2;
}

- (uint64_t)populateWithColorTheme:()Library
{
  id v4 = a3;
  v5 = [v4 backgroundColor];
  [a1 setBackgroundColor:v5];

  v6 = [v4 primaryTextColor];
  [a1 setPrimaryTextColor:v6];

  id v7 = [v4 secondaryTextColor];
  [a1 setSecondaryTextColor:v7];

  uint64_t v8 = [v4 isBackgroundLight];

  return [a1 setIsBackgroundLight:v8];
}

@end