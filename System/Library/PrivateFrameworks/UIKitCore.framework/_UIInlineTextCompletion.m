@interface _UIInlineTextCompletion
+ (id)inlineTextCompletion:(id)a3 source:(id)a4;
- (NSString)candidate;
- (NSString)input;
- (TIKeyboardCandidate)completion;
- (TIKeyboardCandidate)source;
- (_UIInlineTextCompletion)initWithCompletion:(id)a3 source:(id)a4;
@end

@implementation _UIInlineTextCompletion

+ (id)inlineTextCompletion:(id)a3 source:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = (void *)[objc_alloc((Class)objc_opt_class()) initWithCompletion:v6 source:v5];

  return v7;
}

- (_UIInlineTextCompletion)initWithCompletion:(id)a3 source:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_UIInlineTextCompletion;
  v8 = [(_UIInlineTextCompletion *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    completion = v8->_completion;
    v8->_completion = (TIKeyboardCandidate *)v9;

    uint64_t v11 = [v7 copy];
    source = v8->_source;
    v8->_source = (TIKeyboardCandidate *)v11;
  }
  return v8;
}

- (NSString)candidate
{
  v2 = [(_UIInlineTextCompletion *)self completion];
  v3 = [v2 candidate];

  return (NSString *)v3;
}

- (NSString)input
{
  v2 = [(_UIInlineTextCompletion *)self completion];
  v3 = [v2 input];

  return (NSString *)v3;
}

- (TIKeyboardCandidate)completion
{
  return self->_completion;
}

- (TIKeyboardCandidate)source
{
  return self->_source;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_completion, 0);
}

@end