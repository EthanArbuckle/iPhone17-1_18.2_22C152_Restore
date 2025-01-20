@interface PGPeopleQuestionFactoryUtils
+ (id)personsWithPeopleHomeContextForPhotoLibrary:(id)a3;
@end

@implementation PGPeopleQuestionFactoryUtils

+ (id)personsWithPeopleHomeContextForPhotoLibrary:(id)a3
{
  v3 = [a3 librarySpecificFetchOptions];
  [v3 setPersonContext:1];
  v4 = [MEMORY[0x1E4F391F0] fetchPersonsWithOptions:v3];

  return v4;
}

@end