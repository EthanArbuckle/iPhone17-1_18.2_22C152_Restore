@interface OADTableStyleCollection
- (NSString)defaultTableStyleId;
- (OADTableStyleCollection)init;
- (id)tableStyleWithId:(id)a3;
- (id)tableStyles;
- (void)addTableStyle:(id)a3;
- (void)setDefaultTableStyleId:(id)a3;
@end

@implementation OADTableStyleCollection

- (OADTableStyleCollection)init
{
  v8.receiver = self;
  v8.super_class = (Class)OADTableStyleCollection;
  v2 = [(OADTableStyleCollection *)&v8 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    styles = v2->_styles;
    v2->_styles = (NSMutableArray *)v3;

    uint64_t v5 = objc_opt_new();
    styleMap = v2->_styleMap;
    v2->_styleMap = (NSMutableDictionary *)v5;
  }
  return v2;
}

- (void)addTableStyle:(id)a3
{
  id v6 = a3;
  -[NSMutableArray addObject:](self->_styles, "addObject:");
  styleMap = self->_styleMap;
  uint64_t v5 = [v6 id];
  [(NSMutableDictionary *)styleMap setObject:v6 forKeyedSubscript:v5];
}

- (id)tableStyles
{
  return self->_styles;
}

- (id)tableStyleWithId:(id)a3
{
  uint64_t v3 = [(NSMutableDictionary *)self->_styleMap objectForKeyedSubscript:a3];
  return v3;
}

- (NSString)defaultTableStyleId
{
  return self->_defaultTableStyleId;
}

- (void)setDefaultTableStyleId:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultTableStyleId, 0);
  objc_storeStrong((id *)&self->_styleMap, 0);
  objc_storeStrong((id *)&self->_styles, 0);
}

@end