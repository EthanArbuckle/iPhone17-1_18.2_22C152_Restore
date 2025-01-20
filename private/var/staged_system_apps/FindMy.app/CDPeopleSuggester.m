@interface CDPeopleSuggester
+ (id)peopleSuggester;
@end

@implementation CDPeopleSuggester

+ (id)peopleSuggester
{
  v8.receiver = a1;
  v8.super_class = (Class)&OBJC_METACLASS___CDPeopleSuggester;
  v2 = [super peopleSuggester];
  v3 = +[NSSet setWithArray:&off_100646838];
  v4 = [v2 settings];
  [v4 setConstrainPersonIdType:v3];

  v5 = +[NSSet setWithArray:&off_100646850];
  v6 = [v2 settings];
  [v6 setConstrainMechanisms:v5];

  return v2;
}

@end