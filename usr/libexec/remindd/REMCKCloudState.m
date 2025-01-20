@interface REMCKCloudState
+ (id)defaultRelationshipKeyPathsForPrefetching;
+ (id)fetchRequest;
- (ICCloudObject)cloudObject;
@end

@implementation REMCKCloudState

- (ICCloudObject)cloudObject
{
  v3 = [(REMCKCloudState *)self object];

  if (v3)
  {
    uint64_t v4 = [(REMCKCloudState *)self object];
LABEL_15:
    id v11 = (id)v4;
    if (v4
      && (objc_opt_class(), (objc_opt_respondsToSelector() & 1) != 0)
      && (v12 = (unsigned int (*)(uint64_t, const char *))[(id)objc_opt_class() methodForSelector:"conformsToICCloudObject"], uint64_t v13 = objc_opt_class(), v12(v13, "conformsToICCloudObject")))
    {
      id v11 = v11;
      v10 = v11;
    }
    else
    {
      v10 = 0;
    }
    goto LABEL_20;
  }
  v5 = [(REMCKCloudState *)self list];

  if (v5)
  {
    uint64_t v4 = [(REMCKCloudState *)self list];
    goto LABEL_15;
  }
  v6 = [(REMCKCloudState *)self reminder];

  if (v6)
  {
    uint64_t v4 = [(REMCKCloudState *)self reminder];
    goto LABEL_15;
  }
  v7 = [(REMCKCloudState *)self template];

  if (v7)
  {
    uint64_t v4 = [(REMCKCloudState *)self template];
    goto LABEL_15;
  }
  v8 = [(REMCKCloudState *)self savedReminder];

  if (v8)
  {
    uint64_t v4 = [(REMCKCloudState *)self savedReminder];
    goto LABEL_15;
  }
  v9 = [(REMCKCloudState *)self savedAttachment];

  if (v9)
  {
    uint64_t v4 = [(REMCKCloudState *)self savedAttachment];
    goto LABEL_15;
  }
  v10 = [(REMCKCloudState *)self section];

  if (v10)
  {
    uint64_t v4 = [(REMCKCloudState *)self section];
    goto LABEL_15;
  }
  id v11 = 0;
LABEL_20:

  return (ICCloudObject *)v10;
}

+ (id)defaultRelationshipKeyPathsForPrefetching
{
  if (qword_100922A28 != -1) {
    dispatch_once(&qword_100922A28, &stru_1008AFEB8);
  }
  v2 = (void *)qword_100922A30;

  return v2;
}

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:@"REMCKCloudState"];
}

@end