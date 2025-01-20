@interface TUIImpressionSnapshot
- (TUIImpressionSnapshot)initWithMap:(id)a3;
- (id)description;
- (id)impressionForIdentifier:(id)a3;
- (id)impressions;
@end

@implementation TUIImpressionSnapshot

- (TUIImpressionSnapshot)initWithMap:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TUIImpressionSnapshot;
  v5 = [(TUIImpressionSnapshot *)&v9 init];
  if (v5)
  {
    v6 = (NSDictionary *)[v4 copy];
    map = v5->_map;
    v5->_map = v6;
  }
  return v5;
}

- (id)impressionForIdentifier:(id)a3
{
  if (a3)
  {
    id v4 = -[NSDictionary objectForKeyedSubscript:](self->_map, "objectForKeyedSubscript:");
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

- (id)impressions
{
  return [(NSDictionary *)self->_map allValues];
}

- (id)description
{
  uint64_t v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  v5 = +[NSString stringWithFormat:@"<%@ impressions=%@>", v4, self->_map];

  return v5;
}

- (void).cxx_destruct
{
}

@end