@interface OCIFontState
- (NSMutableDictionary)replacedFontMap;
- (OCIFontState)init;
@end

@implementation OCIFontState

- (OCIFontState)init
{
  v6.receiver = self;
  v6.super_class = (Class)OCIFontState;
  v2 = [(OCIFontState *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    replacedFontMap = v2->_replacedFontMap;
    v2->_replacedFontMap = (NSMutableDictionary *)v3;
  }
  return v2;
}

- (NSMutableDictionary)replacedFontMap
{
  return self->_replacedFontMap;
}

- (void).cxx_destruct
{
}

@end