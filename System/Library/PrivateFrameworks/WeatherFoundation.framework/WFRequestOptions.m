@interface WFRequestOptions
- (NSMutableDictionary)httpHeaderDictionary;
- (void)addHttpHeaderField:(id)a3 withValue:(id)a4;
@end

@implementation WFRequestOptions

- (void)addHttpHeaderField:(id)a3 withValue:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  httpHeaderDictionary = self->_httpHeaderDictionary;
  if (!httpHeaderDictionary)
  {
    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    v9 = self->_httpHeaderDictionary;
    self->_httpHeaderDictionary = v8;

    httpHeaderDictionary = self->_httpHeaderDictionary;
  }
  [(NSMutableDictionary *)httpHeaderDictionary setValue:v6 forKey:v10];
}

- (NSMutableDictionary)httpHeaderDictionary
{
  return self->_httpHeaderDictionary;
}

- (void).cxx_destruct
{
}

@end