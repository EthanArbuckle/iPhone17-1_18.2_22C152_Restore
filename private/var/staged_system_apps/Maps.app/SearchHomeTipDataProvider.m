@interface SearchHomeTipDataProvider
- (NSArray)objects;
- (NSString)identifier;
- (NSString)title;
- (SearchHomeTipDataProvider)initWithObjects:(id)a3 type:(int64_t)a4 identifier:(id)a5 title:(id)a6;
- (id)headerAccessibilityIdentifier;
- (int64_t)type;
@end

@implementation SearchHomeTipDataProvider

- (SearchHomeTipDataProvider)initWithObjects:(id)a3 type:(int64_t)a4 identifier:(id)a5 title:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  v21.receiver = self;
  v21.super_class = (Class)SearchHomeTipDataProvider;
  v13 = [(SearchHomeTipDataProvider *)&v21 init];
  if (v13)
  {
    v14 = (NSArray *)[v10 copy];
    objects = v13->_objects;
    v13->_objects = v14;

    v13->_type = a4;
    v16 = (NSString *)[v11 copy];
    identifier = v13->_identifier;
    v13->_identifier = v16;

    v18 = (NSString *)[v12 copy];
    title = v13->_title;
    v13->_title = v18;
  }
  return v13;
}

- (NSArray)objects
{
  if (!MapsFeature_IsEnabled_MapsWally()
    || (GEOConfigGetBOOL() & 1) != 0
    || (+[MapsOfflineUIHelper sharedHelper],
        v3 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v4 = [v3 isUsingOfflineMaps],
        v3,
        (v4 & 1) != 0))
  {
    objects = self->_objects;
    v6 = (NSArray *)&__NSArray0__struct;
  }
  else
  {
    objects = self->_objects;
    v6 = (NSArray *)&off_1013ADD40;
  }
  self->_objects = v6;

  v7 = self->_objects;

  return v7;
}

- (id)headerAccessibilityIdentifier
{
  return @"SearchHomeTip";
}

- (int64_t)type
{
  return self->_type;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)title
{
  return self->_title;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong((id *)&self->_objects, 0);
}

@end