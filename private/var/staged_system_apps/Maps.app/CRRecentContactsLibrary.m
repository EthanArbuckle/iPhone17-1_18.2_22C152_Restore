@interface CRRecentContactsLibrary
+ (id)mailSourcesBundleIdentifiers;
+ (id)messageSourcesBundleIdentifiers;
+ (id)webSourcesBundleIdentifiers;
@end

@implementation CRRecentContactsLibrary

+ (id)messageSourcesBundleIdentifiers
{
  if (qword_10160FC48 != -1) {
    dispatch_once(&qword_10160FC48, &stru_1012FE878);
  }
  v2 = (void *)qword_10160FC40;

  return v2;
}

+ (id)mailSourcesBundleIdentifiers
{
  if (qword_10160FC58 != -1) {
    dispatch_once(&qword_10160FC58, &stru_1012FE898);
  }
  v2 = (void *)qword_10160FC50;

  return v2;
}

+ (id)webSourcesBundleIdentifiers
{
  if (qword_10160FC68 != -1) {
    dispatch_once(&qword_10160FC68, &stru_1012FE8B8);
  }
  v2 = (void *)qword_10160FC60;

  return v2;
}

@end