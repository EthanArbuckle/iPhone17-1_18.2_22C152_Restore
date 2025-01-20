@interface SSPlistDataReader
- (BOOL)doesBundleExistInAppAllowList:(id)a3;
- (NSArray)blocklist;
- (NSMutableArray)allKeys;
- (SSPlistDataReader)initWithPlistContainer:(_MDPlistContainer *)a3;
- (SSPlistDataReader)initWithPlistContainer:(_MDPlistContainer *)a3 obj:(id *)a4;
- (_MDPlistContainer)container;
- (double)doubleValueForBundle:(id)a3;
- (double)doubleValueForKey:(const char *)a3;
- (id)description;
- (int64_t)intValueForBundle:(id)a3 defaultValue:(int64_t)a4;
- (int64_t)intValueForKey:(const char *)a3 defaultValue:(int64_t)a4;
- (unint64_t)count;
- (void)dealloc;
@end

@implementation SSPlistDataReader

- (SSPlistDataReader)initWithPlistContainer:(_MDPlistContainer *)a3 obj:(id *)a4
{
  v10.receiver = self;
  v10.super_class = (Class)SSPlistDataReader;
  v6 = [(SSPlistDataReader *)&v10 init];
  v7 = v6;
  if (a3 && v6)
  {
    v6->_container = (_MDPlistContainer *)CFRetain(a3);
    $89967B733E8F0E8859294B5D59E7AF0F var2 = a4->var2;
    *(_OWORD *)&v7->_obj.containerBytes = *(_OWORD *)&a4->var0;
    v7->_obj.reference = ($37FF168C8709F524D812460C59637AB1)var2;
  }
  return v7;
}

- (SSPlistDataReader)initWithPlistContainer:(_MDPlistContainer *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)SSPlistDataReader;
  v4 = [(SSPlistDataReader *)&v9 init];
  v5 = v4;
  if (a3 && v4)
  {
    v4->_container = (_MDPlistContainer *)CFRetain(a3);
    _MDPlistGetRootPlistObjectFromPlist();
    *(_OWORD *)&v5->_obj.containerBytes = v7;
    v5->_obj.reference = v8;
  }
  return v5;
}

- (void)dealloc
{
  container = self->_container;
  if (container) {
    CFRelease(container);
  }
  v4.receiver = self;
  v4.super_class = (Class)SSPlistDataReader;
  [(SSPlistDataReader *)&v4 dealloc];
}

- (unint64_t)count
{
  if (self->_container) {
    return _MDPlistDictionaryGetCount();
  }
  else {
    return 0;
  }
}

- (NSMutableArray)allKeys
{
  v3 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[SSPlistDataReader count](self, "count"));
  objc_super v4 = v3;
  if (self->_container)
  {
    id v6 = v3;
    _MDPlistDictionaryIterate();
  }
  return (NSMutableArray *)v4;
}

void __28__SSPlistDataReader_allKeys__block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [NSString stringWithUTF8String:a2];
  [v2 addObject:v3];
}

- (NSArray)blocklist
{
  id v3 = [MEMORY[0x1E4F1CA48] array];
  objc_super v4 = v3;
  if (self->_container)
  {
    id v6 = v3;
    _MDPlistDictionaryIterate();
  }
  return (NSArray *)v4;
}

void __30__SSPlistDataReader_blocklist__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, long long *a4)
{
  long long v9 = *a4;
  uint64_t v10 = *((void *)a4 + 2);
  _MDPlistNumberGetDoubleValue();
  if (v6 < 0.0)
  {
    long long v7 = *(void **)(a1 + 32);
    $37FF168C8709F524D812460C59637AB1 v8 = objc_msgSend(NSString, "stringWithUTF8String:", a2, v9, v10);
    [v7 addObject:v8];
  }
}

- (BOOL)doesBundleExistInAppAllowList:(id)a3
{
  if (!self->_container) {
    return 0;
  }
  [a3 UTF8String];
  return _MDPlistDictionaryGetPlistObjectForKey() != 0;
}

- (double)doubleValueForKey:(const char *)a3
{
  double v3 = -1.0;
  if (a3 && self->_container && _MDPlistDictionaryGetPlistObjectForKey())
  {
    _MDPlistNumberGetDoubleValue();
    return v4;
  }
  return v3;
}

- (double)doubleValueForBundle:(id)a3
{
  id v4 = [a3 lowercaseString];
  -[SSPlistDataReader doubleValueForKey:](self, "doubleValueForKey:", [v4 UTF8String]);
  double v6 = v5;

  return v6;
}

- (int64_t)intValueForKey:(const char *)a3 defaultValue:(int64_t)a4
{
  if (a3 && self->_container && _MDPlistDictionaryGetPlistObjectForKey()) {
    return _MDPlistNumberGetIntValue();
  }
  return a4;
}

- (int64_t)intValueForBundle:(id)a3 defaultValue:(int64_t)a4
{
  id v6 = [a3 lowercaseString];
  int64_t v7 = -[SSPlistDataReader intValueForKey:defaultValue:](self, "intValueForKey:defaultValue:", [v6 UTF8String], a4);

  return v7;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@ %p> : (count=%d)", objc_opt_class(), self, -[SSPlistDataReader count](self, "count")];
}

- (_MDPlistContainer)container
{
  return self->_container;
}

@end