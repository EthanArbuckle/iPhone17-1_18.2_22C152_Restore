@interface TUILinkEntityModel
- (NSDictionary)actionsMap;
- (NSSet)actions;
- (NSString)description;
- (NSString)identifier;
- (NSString)title;
- (NSString)type;
- (TUILinkEntityModel)initWithType:(id)a3 identifier:(id)a4 title:(id)a5 actionsMap:(id)a6;
@end

@implementation TUILinkEntityModel

- (TUILinkEntityModel)initWithType:(id)a3 identifier:(id)a4 title:(id)a5 actionsMap:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v24.receiver = self;
  v24.super_class = (Class)TUILinkEntityModel;
  v14 = [(TUILinkEntityModel *)&v24 init];
  if (v14)
  {
    v15 = (NSString *)[v10 copy];
    type = v14->_type;
    v14->_type = v15;

    v17 = (NSString *)[v11 copy];
    identifier = v14->_identifier;
    v14->_identifier = v17;

    v19 = (NSString *)[v12 copy];
    title = v14->_title;
    v14->_title = v19;

    v21 = (NSDictionary *)[v13 copy];
    actionsMap = v14->_actionsMap;
    v14->_actionsMap = v21;
  }
  return v14;
}

- (NSSet)actions
{
  v2 = [(NSDictionary *)self->_actionsMap allKeys];
  v3 = +[NSSet setWithArray:v2];

  return (NSSet *)v3;
}

- (NSString)description
{
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  long long v11 = *(_OWORD *)&self->_type;
  title = self->_title;
  v6 = [(NSDictionary *)self->_actionsMap allKeys];
  v7 = [v6 sortedArrayUsingSelector:"compare:"];
  v8 = [v7 componentsJoinedByString:@","];
  v9 = +[NSString stringWithFormat:@"<%@ type=%@ identifier='%@' title='%@' actions=%@>", v4, v11, title, v8];

  return (NSString *)v9;
}

- (NSString)type
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

- (NSDictionary)actionsMap
{
  return self->_actionsMap;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionsMap, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong((id *)&self->_type, 0);
}

@end