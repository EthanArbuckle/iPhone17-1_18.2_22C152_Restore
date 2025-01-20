@interface RAPPlacecardImageryIssueItem
+ (NSArray)defaultIssueItems;
- (BOOL)hasOverridenText;
- (NSString)localizedTitle;
- (RAPPlacecardImageryIssueItem)initWithType:(unint64_t)a3;
- (RAPPlacecardImageryIssueItem)initWithType:(unint64_t)a3 overridenText:(id)a4;
- (unint64_t)type;
@end

@implementation RAPPlacecardImageryIssueItem

- (RAPPlacecardImageryIssueItem)initWithType:(unint64_t)a3 overridenText:(id)a4
{
  id v7 = a4;
  v8 = [(RAPPlacecardImageryIssueItem *)self initWithType:a3];
  v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_overridenText, a4);
  }

  return v9;
}

- (RAPPlacecardImageryIssueItem)initWithType:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)RAPPlacecardImageryIssueItem;
  result = [(RAPPlacecardImageryIssueItem *)&v5 init];
  if (result) {
    result->_type = a3;
  }
  return result;
}

- (NSString)localizedTitle
{
  if ([(RAPPlacecardImageryIssueItem *)self hasOverridenText])
  {
    v3 = self->_overridenText;
  }
  else
  {
    switch(self->_type)
    {
      case 1uLL:
        v4 = +[NSBundle mainBundle];
        objc_super v5 = v4;
        CFStringRef v6 = @"Other [RAP]";
        goto LABEL_13;
      case 2uLL:
        v4 = +[NSBundle mainBundle];
        objc_super v5 = v4;
        CFStringRef v6 = @"Not Relevant [RAP]";
        goto LABEL_13;
      case 3uLL:
        v4 = +[NSBundle mainBundle];
        objc_super v5 = v4;
        CFStringRef v6 = @"Inappropriate Photo [RAP]";
        goto LABEL_13;
      case 4uLL:
        v4 = +[NSBundle mainBundle];
        objc_super v5 = v4;
        CFStringRef v6 = @"Poor Image Quality [RAP]";
        goto LABEL_13;
      case 5uLL:
        v4 = +[NSBundle mainBundle];
        objc_super v5 = v4;
        CFStringRef v6 = @"Privacy Concern [RAP]";
        goto LABEL_13;
      case 6uLL:
        v4 = +[NSBundle mainBundle];
        objc_super v5 = v4;
        CFStringRef v6 = @"Legal Issue [RAP]";
        goto LABEL_13;
      case 7uLL:
        v4 = +[NSBundle mainBundle];
        objc_super v5 = v4;
        CFStringRef v6 = @"Copyright Violation [RAP]";
        goto LABEL_13;
      case 8uLL:
        v4 = +[NSBundle mainBundle];
        objc_super v5 = v4;
        CFStringRef v6 = @"Inappropriate Name [RAP]";
LABEL_13:
        v3 = [v4 localizedStringForKey:v6 value:@"localized string not found" table:0];

        break;
      default:
        v3 = &stru_101324E70;
        break;
    }
  }

  return (NSString *)v3;
}

+ (NSArray)defaultIssueItems
{
  v2 = objc_opt_new();
  v3 = +[NSMutableArray arrayWithArray:&off_1013AE8C8];
  v4 = +[GEOCountryConfiguration sharedConfiguration];
  objc_super v5 = [v4 countryCode];
  unsigned int v6 = [v5 isEqualToString:@"KR"];

  if (v6)
  {
    [v3 removeObject:&off_1013AB788];
    [v3 removeObject:&off_1013AB7A0];
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v7 = v3;
  id v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v18;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        v13 = [RAPPlacecardImageryIssueItem alloc];
        v14 = [[RAPPlacecardImageryIssueItem alloc] initWithType:[v12 unsignedIntegerValue]];
        [v2 addObject:v14];
      }
      id v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v9);
  }

  id v15 = [v2 copy];

  return (NSArray *)v15;
}

- (BOOL)hasOverridenText
{
  return [(NSString *)self->_overridenText length] != 0;
}

- (unint64_t)type
{
  return self->_type;
}

- (void).cxx_destruct
{
}

@end