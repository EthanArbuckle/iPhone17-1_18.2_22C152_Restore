@interface NSUserDefaults(NSUserDefaults_TSUAdditions)
+ (void)tsu_registerDefaults;
@end

@implementation NSUserDefaults(NSUserDefaults_TSUAdditions)

+ (void)tsu_registerDefaults
{
  if (tsu_registerDefaults_onceToken != -1) {
    dispatch_once(&tsu_registerDefaults_onceToken, &__block_literal_global_23);
  }
}

@end