@interface Group
+ (id)_propertySettersForAutomaticGroup;
+ (id)_updateDictionaryWithAutomaticGroup:(id)a3;
+ (id)databaseTable;
+ (id)insertAutomaticGroup:(id)a3 inDatabase:(id)a4;
- (id)automaticGroup;
- (id)sortedPassUniqueIdentifiers;
- (unint64_t)order;
- (void)updateWithAutomaticGroup:(id)a3;
- (void)updateWithOrder:(unint64_t)a3;
@end

@implementation Group

+ (id)databaseTable
{
  return @"pass_group";
}

+ (id)insertAutomaticGroup:(id)a3 inDatabase:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = +[SQLiteEntity anyInDatabase:v5 predicate:0];

  if (v7)
  {
    v8 = +[SQLiteEntity maxValueForProperty:@"group_order" predicate:0 database:v5];
    v7 = (char *)[v8 unsignedIntegerValue] + 1;
  }
  v9 = [Group alloc];
  v10 = +[Group _updateDictionaryWithAutomaticGroup:v6];

  v11 = [(SQLiteEntity *)v9 initWithPropertyValues:v10 inDatabase:v5];
  [(Group *)v11 updateWithOrder:v7];

  return v11;
}

- (void)updateWithAutomaticGroup:(id)a3
{
  id v4 = +[Group _updateDictionaryWithAutomaticGroup:a3];
  [(SQLiteEntity *)self setValuesWithDictionary:v4];
}

- (void)updateWithOrder:(unint64_t)a3
{
  id v4 = +[NSNumber numberWithUnsignedInteger:a3];
  [(SQLiteEntity *)self setValue:v4 forProperty:@"group_order"];
}

- (unint64_t)order
{
  v2 = [(SQLiteEntity *)self valueForProperty:@"group_order"];
  id v3 = [v2 unsignedIntegerValue];

  return (unint64_t)v3;
}

- (id)sortedPassUniqueIdentifiers
{
  v2 = [(SQLiteEntity *)self valueForProperty:@"internal_group_order"];
  if (v2)
  {
    v7[0] = objc_opt_class();
    v7[1] = objc_opt_class();
    id v3 = +[NSArray arrayWithObjects:v7 count:2];
    id v4 = +[NSSet setWithArray:v3];
    id v5 = +[NSKeyedUnarchiver unarchivedObjectOfClasses:v4 fromData:v2 error:0];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)automaticGroup
{
  id v3 = objc_alloc_init(PDAutomaticGroup);
  id v4 = +[Group _propertySettersForAutomaticGroup];
  id v5 = [v4 allKeys];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1004246DC;
  v11[3] = &unk_10072EDD0;
  id v12 = v4;
  id v6 = v3;
  v13 = v6;
  id v7 = v4;
  [(SQLiteEntity *)self getValuesForProperties:v5 withApplier:v11];

  v8 = v13;
  v9 = v6;

  return v9;
}

+ (id)_propertySettersForAutomaticGroup
{
  v4[0] = @"pass_type_id";
  v4[1] = @"pass_style";
  v5[0] = &stru_100750540;
  v5[1] = &stru_100750560;
  v4[2] = @"grouping_id";
  v4[3] = @"minimum_date";
  v5[2] = &stru_100750580;
  v5[3] = &stru_1007505A0;
  v4[4] = @"maximum_date";
  v4[5] = @"ingested_date";
  v5[4] = &stru_1007505C0;
  v5[5] = &stru_1007505E0;
  v4[6] = @"nfc_enabled";
  v4[7] = @"internal_group_order";
  v5[6] = &stru_100750600;
  v5[7] = &stru_100750620;
  v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:8];
  return v2;
}

+ (id)_updateDictionaryWithAutomaticGroup:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 sortedPassUniqueIdentifiers];
  v22 = (void *)v4;
  if (v4)
  {
    id v5 = +[NSKeyedArchiver archivedDataWithRootObject:v4 requiringSecureCoding:1 error:0];
  }
  else
  {
    id v5 = 0;
  }
  v23[0] = @"pass_type_id";
  v21 = [v3 passTypeID];
  v20 = (void *)_SQLValueForString();
  v24[0] = v20;
  v23[1] = @"pass_style";
  v19 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v3 passStyle]);
  v24[1] = v19;
  v23[2] = @"grouping_id";
  v18 = [v3 groupingID];
  v17 = (void *)_SQLValueForString();
  v24[2] = v17;
  v23[3] = @"minimum_date";
  id v6 = [v3 minDate];
  id v7 = (void *)_SQLValueForDate();
  v24[3] = v7;
  v23[4] = @"maximum_date";
  v8 = [v3 maxDate];
  v9 = (void *)_SQLValueForDate();
  v24[4] = v9;
  v23[5] = @"ingested_date";
  v10 = [v3 ingestedDate];
  v11 = (void *)_SQLValueForDate();
  v24[5] = v11;
  v23[6] = @"nfc_enabled";
  id v12 = [v3 isNFCEnabled];

  v13 = +[NSNumber numberWithBool:v12];
  v24[6] = v13;
  v23[7] = @"internal_group_order";
  v14 = v5;
  if (!v5)
  {
    v14 = +[NSNull null];
  }
  v24[7] = v14;
  v15 = +[NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:8];
  if (!v5) {

  }
  return v15;
}

@end