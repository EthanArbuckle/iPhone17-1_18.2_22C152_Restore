@interface WaypointPlaceholder
- (BOOL)isEqual:(id)a3;
- (NSString)debugDescription;
- (NSString)description;
- (NSString)name;
- (SearchResult)displayableMarker;
- (WaypointPlaceholder)initWithName:(id)a3 displayableMarker:(id)a4;
- (unint64_t)hash;
- (void)_maps_buildDescriptionWithBlock:(id)a3;
@end

@implementation WaypointPlaceholder

- (WaypointPlaceholder)initWithName:(id)a3 displayableMarker:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)WaypointPlaceholder;
  v8 = [(WaypointPlaceholder *)&v14 init];
  if (v8)
  {
    v9 = (NSString *)[v6 copy];
    name = v8->_name;
    v8->_name = v9;

    v11 = (SearchResult *)[v7 copy];
    displayableMarker = v8->_displayableMarker;
    v8->_displayableMarker = v11;
  }
  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_name hash];
  return [(SearchResult *)self->_displayableMarker hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (WaypointPlaceholder *)a3;
  if (v4 == self)
  {
    unsigned __int8 v10 = 1;
  }
  else if ([(WaypointPlaceholder *)v4 isMemberOfClass:objc_opt_class()])
  {
    v5 = v4;
    id v6 = [(WaypointPlaceholder *)v5 name];
    id v7 = [(WaypointPlaceholder *)self name];
    if ([v6 isEqual:v7])
    {
      displayableMarker = self->_displayableMarker;
      v9 = [(WaypointPlaceholder *)v5 displayableMarker];
      unsigned __int8 v10 = [(SearchResult *)displayableMarker isEqualToSearchResult:v9 forPurpose:1];
    }
    else
    {
      unsigned __int8 v10 = 0;
    }
  }
  else
  {
    unsigned __int8 v10 = 0;
  }

  return v10;
}

- (NSString)description
{
  v2 = self;
  objc_super v14 = _NSConcreteStackBlock;
  uint64_t v15 = 3221225472;
  v16 = sub_10009270C;
  v17 = &unk_1012E9588;
  id v3 = objc_alloc_init((Class)NSMutableArray);
  id v18 = v3;
  v4 = objc_retainBlock(&v14);
  [(WaypointPlaceholder *)v2 _maps_buildDescriptionWithBlock:v4];
  v5 = v2;
  if (v5)
  {
    id v6 = (objc_class *)objc_opt_class();
    id v7 = NSStringFromClass(v6);
    if (objc_opt_respondsToSelector())
    {
      v8 = [(WaypointPlaceholder *)v5 performSelector:"accessibilityIdentifier"];
      v9 = v8;
      if (v8 && ![v8 isEqualToString:v7])
      {
        unsigned __int8 v10 = +[NSString stringWithFormat:@"%@<%p, %@>", v7, v5, v9, v14, v15, v16, v17];

        goto LABEL_7;
      }
    }
    unsigned __int8 v10 = +[NSString stringWithFormat:@"%@<%p>", v7, v5];
LABEL_7:

    goto LABEL_9;
  }
  unsigned __int8 v10 = @"<nil>";
LABEL_9:

  v11 = [v3 componentsJoinedByString:@", "];
  v12 = +[NSString stringWithFormat:@"%@ (%@)", v10, v11];

  return (NSString *)v12;
}

- (NSString)debugDescription
{
  v2 = self;
  objc_super v14 = _NSConcreteStackBlock;
  uint64_t v15 = 3221225472;
  v16 = sub_100AA1AAC;
  v17 = &unk_1012E9588;
  id v3 = objc_alloc_init((Class)NSMutableArray);
  id v18 = v3;
  v4 = objc_retainBlock(&v14);
  [(WaypointPlaceholder *)v2 _maps_buildDescriptionWithBlock:v4];
  v5 = v2;
  if (v5)
  {
    id v6 = (objc_class *)objc_opt_class();
    id v7 = NSStringFromClass(v6);
    if (objc_opt_respondsToSelector())
    {
      v8 = [(WaypointPlaceholder *)v5 performSelector:"accessibilityIdentifier"];
      v9 = v8;
      if (v8 && ![v8 isEqualToString:v7])
      {
        unsigned __int8 v10 = +[NSString stringWithFormat:@"%@<%p, %@>", v7, v5, v9, v14, v15, v16, v17];

        goto LABEL_7;
      }
    }
    unsigned __int8 v10 = +[NSString stringWithFormat:@"%@<%p>", v7, v5];
LABEL_7:

    goto LABEL_9;
  }
  unsigned __int8 v10 = @"<nil>";
LABEL_9:

  v11 = [v3 componentsJoinedByString:@"\n"];
  v12 = +[NSString stringWithFormat:@"%@ {\n%@\n}", v10, v11];

  return (NSString *)v12;
}

- (void)_maps_buildDescriptionWithBlock:(id)a3
{
  v4 = (void (**)(id, const __CFString *, SearchResult *))((char *)a3 + 16);
  v5 = (void (*)(void))*((void *)a3 + 2);
  id v6 = a3;
  v5();
  (*v4)(v6, @"displayableMarker", self->_displayableMarker);
}

- (NSString)name
{
  return self->_name;
}

- (SearchResult)displayableMarker
{
  return self->_displayableMarker;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayableMarker, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end