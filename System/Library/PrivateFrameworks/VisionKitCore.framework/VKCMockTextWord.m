@interface VKCMockTextWord
- (NSString)text;
- (VKCMockTextWord)initWithWordsDictionary:(id)a3;
- (VKQuad)quad;
- (_NSRange)range;
- (void)setQuad:(id)a3;
- (void)setRange:(_NSRange)a3;
- (void)setText:(id)a3;
@end

@implementation VKCMockTextWord

- (VKCMockTextWord)initWithWordsDictionary:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)VKCMockTextWord;
  v5 = [(VKCMockTextWord *)&v10 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:VKCMockResultTextKey];
    [(VKCMockTextWord *)v5 setText:v6];

    v7 = [v4 objectForKeyedSubscript:VKCMockResultQuadKey];
    v8 = [[VKQuad alloc] initWithDictionary:v7];
    [(VKCMockTextWord *)v5 setQuad:v8];
  }
  return v5;
}

- (_NSRange)range
{
  NSUInteger length = self->_range.length;
  NSUInteger location = self->_range.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setRange:(_NSRange)a3
{
  self->_range = a3;
}

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
}

- (VKQuad)quad
{
  return self->_quad;
}

- (void)setQuad:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_quad, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

@end