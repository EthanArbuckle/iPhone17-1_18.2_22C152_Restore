@interface POSOAPFaultDetail
- (POSOAPFaultDetail)init;
- (id)valueForKey:(id)a3;
- (void)setValue:(id)a3 forKey:(id)a4;
@end

@implementation POSOAPFaultDetail

- (POSOAPFaultDetail)init
{
  v6.receiver = self;
  v6.super_class = (Class)POSOAPFaultDetail;
  v2 = [(POSOAPFaultDetail *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    items = v2->_items;
    v2->_items = (NSMutableDictionary *)v3;
  }
  return v2;
}

- (id)valueForKey:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_items objectForKeyedSubscript:a3];
}

- (void)setValue:(id)a3 forKey:(id)a4
{
}

- (void).cxx_destruct
{
}

@end