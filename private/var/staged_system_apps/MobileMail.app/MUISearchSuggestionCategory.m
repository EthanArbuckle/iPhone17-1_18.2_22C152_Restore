@interface MUISearchSuggestionCategory
+ (id)cannedCategory;
+ (id)contactCategory;
+ (id)dateCategory;
+ (id)genericCategory;
+ (id)mailboxCategory;
+ (id)otherCategory;
- (BOOL)isLegacy;
@end

@implementation MUISearchSuggestionCategory

+ (id)contactCategory
{
  if (qword_100699A08 != -1) {
    dispatch_once(&qword_100699A08, &stru_10060AFD8);
  }
  v2 = (void *)qword_100699A00;

  return v2;
}

+ (id)genericCategory
{
  if (qword_100699AC0 != -1) {
    dispatch_once(&qword_100699AC0, &stru_10060B7C8);
  }
  v2 = (void *)qword_100699AB8;

  return v2;
}

+ (id)dateCategory
{
  if (qword_100699D58 != -1) {
    dispatch_once(&qword_100699D58, &stru_10060D288);
  }
  v2 = (void *)qword_100699D50;

  return v2;
}

+ (id)otherCategory
{
  if (qword_100699D68 != -1) {
    dispatch_once(&qword_100699D68, &stru_10060D2E8);
  }
  v2 = (void *)qword_100699D60;

  return v2;
}

+ (id)cannedCategory
{
  if (qword_100699D78 != -1) {
    dispatch_once(&qword_100699D78, &stru_10060D308);
  }
  v2 = (void *)qword_100699D70;

  return v2;
}

- (BOOL)isLegacy
{
  v3 = +[MUISearchSuggestionCategory mailboxCategory];
  if ([(MUISearchSuggestionCategory *)self isGroupedInCategory:v3])
  {
    unsigned __int8 v4 = 1;
  }
  else
  {
    v5 = +[MUISearchSuggestionCategory otherCategory];
    if ([(MUISearchSuggestionCategory *)self isGroupedInCategory:v5])
    {
      unsigned __int8 v4 = 1;
    }
    else
    {
      v6 = +[MUISearchSuggestionCategory cannedCategory];
      unsigned __int8 v4 = [(MUISearchSuggestionCategory *)self isGroupedInCategory:v6];
    }
  }

  return v4;
}

+ (id)mailboxCategory
{
  if (qword_100699E98 != -1) {
    dispatch_once(&qword_100699E98, &stru_10060DD70);
  }
  v2 = (void *)qword_100699E90;

  return v2;
}

@end