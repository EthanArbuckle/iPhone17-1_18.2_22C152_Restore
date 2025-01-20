@interface _MDQueryTokenRewrite
- (NSArray)variations;
- (NSString)originalToken;
- (_MDQueryTokenRewrite)initWithOriginalToken:(id)a3 variations:(id)a4;
- (void)dealloc;
- (void)setOriginalToken:(id)a3;
@end

@implementation _MDQueryTokenRewrite

- (_MDQueryTokenRewrite)initWithOriginalToken:(id)a3 variations:(id)a4
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v8.receiver = self;
  v8.super_class = (Class)_MDQueryTokenRewrite;
  v6 = [(_MDQueryTokenRewrite *)&v8 init];
  if (v6)
  {
    v6->_originalToken = (NSString *)[a3 copy];
    v6->_variations = (NSArray *)[a4 copy];
  }
  return v6;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)_MDQueryTokenRewrite;
  [(_MDQueryTokenRewrite *)&v3 dealloc];
}

- (NSString)originalToken
{
  return self->_originalToken;
}

- (void)setOriginalToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSArray)variations
{
  return self->_variations;
}

@end