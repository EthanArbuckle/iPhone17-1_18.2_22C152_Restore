@interface AutocompleteClientSource
+ (BOOL)itemIsFromMail:(id)a3;
+ (BOOL)itemIsFromMessages:(id)a3;
+ (BOOL)itemIsMarkedLocation:(id)a3;
+ (BOOL)itemIsRecentPlace:(id)a3;
+ (BOOL)itemIsRecentSearch:(id)a3;
+ (id)autocompleteClientSourceAppIconWithType:(int64_t)a3;
+ (id)autocompleteClientSourceTitleWithType:(int64_t)a3;
+ (id)autocompleteClientSourceTitleWithType:(int64_t)a3 contactName:(id)a4;
+ (int64_t)autocompleteClientSourceTypeWithItem:(id)a3;
@end

@implementation AutocompleteClientSource

+ (int64_t)autocompleteClientSourceTypeWithItem:(id)a3
{
  id v4 = a3;
  if ([a1 itemIsRecentSearch:v4])
  {
    int64_t v5 = 1;
  }
  else if ([a1 itemIsRecentPlace:v4])
  {
    int64_t v5 = 2;
  }
  else if ([a1 itemIsFromMail:v4])
  {
    int64_t v5 = 3;
  }
  else if ([a1 itemIsFromMessages:v4])
  {
    int64_t v5 = 4;
  }
  else if ([a1 itemIsMarkedLocation:v4])
  {
    int64_t v5 = 5;
  }
  else
  {
    int64_t v5 = 0;
  }

  return v5;
}

+ (BOOL)itemIsRecentSearch:(id)a3
{
  id v3 = a3;
  if ([v3 containsPossiblePersonalizedItemSourceType:7]) {
    unsigned __int8 v4 = [v3 containsPossiblePersonalizedItemSourceSubtype:11];
  }
  else {
    unsigned __int8 v4 = 0;
  }

  return v4;
}

+ (BOOL)itemIsRecentPlace:(id)a3
{
  id v3 = a3;
  if ([v3 containsPossiblePersonalizedItemSourceType:7]
    && ([v3 containsPossiblePersonalizedItemSourceSubtype:10] & 1) != 0)
  {
    unsigned __int8 v4 = 1;
  }
  else if ([v3 containsPossiblePersonalizedItemSourceType:9])
  {
    unsigned __int8 v4 = [v3 containsPossiblePersonalizedItemSourceSubtype:17];
  }
  else
  {
    unsigned __int8 v4 = 0;
  }

  return v4;
}

+ (BOOL)itemIsFromMail:(id)a3
{
  id v3 = a3;
  if ([v3 containsPossiblePersonalizedItemSourceType:5]) {
    unsigned __int8 v4 = [v3 containsPossiblePersonalizedItemSourceSubtype:4];
  }
  else {
    unsigned __int8 v4 = 0;
  }

  return v4;
}

+ (BOOL)itemIsFromMessages:(id)a3
{
  id v3 = a3;
  if ([v3 containsPossiblePersonalizedItemSourceType:5]) {
    unsigned __int8 v4 = [v3 containsPossiblePersonalizedItemSourceSubtype:5];
  }
  else {
    unsigned __int8 v4 = 0;
  }

  return v4;
}

+ (BOOL)itemIsMarkedLocation:(id)a3
{
  id v3 = [a3 autocompleteObject];
  objc_opt_class();
  BOOL v4 = (objc_opt_isKindOfClass() & 1) != 0 && [v3 type] == 3;

  return v4;
}

+ (id)autocompleteClientSourceTitleWithType:(int64_t)a3
{
  return [a1 autocompleteClientSourceTitleWithType:a3 contactName:0];
}

+ (id)autocompleteClientSourceTitleWithType:(int64_t)a3 contactName:(id)a4
{
  id v5 = a4;
  v6 = v5;
  switch(a3)
  {
    case 1:
      v7 = +[NSBundle mainBundle];
      v8 = v7;
      CFStringRef v9 = @"Recent Search";
      goto LABEL_15;
    case 2:
      v7 = +[NSBundle mainBundle];
      v8 = v7;
      CFStringRef v9 = @"Recently Viewed";
      goto LABEL_15;
    case 3:
      if ([v5 length])
      {
        v11 = +[NSBundle mainBundle];
        v8 = v11;
        CFStringRef v12 = @"Siri found in Mail from %@";
        goto LABEL_9;
      }
      v7 = +[NSBundle mainBundle];
      v8 = v7;
      CFStringRef v9 = @"Siri found in Mail";
      goto LABEL_15;
    case 4:
      if ([v5 length])
      {
        v11 = +[NSBundle mainBundle];
        v8 = v11;
        CFStringRef v12 = @"Siri found in Messages from %@";
LABEL_9:
        v13 = [v11 localizedStringForKey:v12 value:@"localized string not found" table:0];
        v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v13, v6);
      }
      else
      {
        v7 = +[NSBundle mainBundle];
        v8 = v7;
        CFStringRef v9 = @"Siri found in Messages";
LABEL_15:
        v10 = [v7 localizedStringForKey:v9 value:@"localized string not found" table:0];
      }

LABEL_17:
      return v10;
    case 5:
      unsigned int v14 = +[LibraryUIUtilities isMyPlacesEnabled];
      v7 = +[NSBundle mainBundle];
      v8 = v7;
      if (v14) {
        CFStringRef v9 = @"Marked Location";
      }
      else {
        CFStringRef v9 = @"Dropped Pin";
      }
      goto LABEL_15;
    default:
      v10 = 0;
      goto LABEL_17;
  }
}

+ (id)autocompleteClientSourceAppIconWithType:(int64_t)a3
{
  CFStringRef v3 = @"com.apple.MobileSMS";
  if (a3 != 4) {
    CFStringRef v3 = 0;
  }
  if (a3 == 3) {
    BOOL v4 = @"com.apple.mobilemail";
  }
  else {
    BOOL v4 = (__CFString *)v3;
  }
  if ([(__CFString *)v4 length])
  {
    id v5 = +[UIScreen mainScreen];
    [v5 scale];
    v6 = +[UIImage _applicationIconImageForBundleIdentifier:format:scale:](UIImage, "_applicationIconImageForBundleIdentifier:format:scale:", v4, 2);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

@end