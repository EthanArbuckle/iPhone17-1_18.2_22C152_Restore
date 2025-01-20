@interface _TUIImpressionStats
- (NSMutableDictionary)impressions;
- (_TUIImpressionStats)init;
- (id)impressionForData:(id)a3 size:(CGSize)a4 create:(BOOL)a5;
- (id)impressionForIdentifier:(id)a3;
- (void)clearImpressions;
@end

@implementation _TUIImpressionStats

- (_TUIImpressionStats)init
{
  v6.receiver = self;
  v6.super_class = (Class)_TUIImpressionStats;
  v2 = [(_TUIImpressionStats *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    impressions = v2->_impressions;
    v2->_impressions = (NSMutableDictionary *)v3;
  }
  return v2;
}

- (id)impressionForData:(id)a3 size:(CGSize)a4 create:(BOOL)a5
{
  BOOL v5 = a5;
  double height = a4.height;
  double width = a4.width;
  id v9 = a3;
  v10 = [v9 identifier];
  if (v10)
  {
    uint64_t v11 = [(NSMutableDictionary *)self->_impressions objectForKey:v10];
    if (v9 != 0 && v11 == 0) {
      v12 = 0;
    }
    else {
      v12 = (TUIImpression *)v11;
    }
    if (v9 != 0 && v11 == 0 && v5)
    {
      v14 = [TUIImpression alloc];
      v15 = [v9 data];
      v12 = -[TUIImpression initWithData:size:identifier:](v14, "initWithData:size:identifier:", v15, v10, width, height);

      [(NSMutableDictionary *)self->_impressions setObject:v12 forKeyedSubscript:v10];
    }
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)impressionForIdentifier:(id)a3
{
  if (a3)
  {
    v4 = -[NSMutableDictionary objectForKeyedSubscript:](self->_impressions, "objectForKeyedSubscript:");
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (void)clearImpressions
{
}

- (NSMutableDictionary)impressions
{
  return self->_impressions;
}

- (void).cxx_destruct
{
}

@end