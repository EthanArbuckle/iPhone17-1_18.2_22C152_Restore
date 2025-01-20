@interface _UIKBArbiterClientToken
+ (id)uniqueToken;
- (BOOL)isEqual:(id)a3;
- (NSString)sceneIdentityString;
- (_UIKBArbiterClientToken)init;
- (id)description;
- (void)setSceneIdentityString:(id)a3;
@end

@implementation _UIKBArbiterClientToken

+ (id)uniqueToken
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (_UIKBArbiterClientToken)init
{
  v5.receiver = self;
  v5.super_class = (Class)_UIKBArbiterClientToken;
  id v2 = [(_UIKBArbiterClientToken *)&v5 init];
  if (v2)
  {
    if (qword_1EB25D278 != -1) {
      dispatch_once(&qword_1EB25D278, &__block_literal_global_676);
    }
    int v3 = _MergedGlobals_9_11++;
    v2->_identifier = v3;
  }
  return v2;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && self->_identifier == v4[2];

  return v5;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)_UIKBArbiterClientToken;
  int v3 = [(_UIKBArbiterClientToken *)&v7 description];
  v4 = [(_UIKBArbiterClientToken *)self sceneIdentityString];
  BOOL v5 = [v3 stringByAppendingFormat:@" scene identity string %@", v4];

  return v5;
}

- (NSString)sceneIdentityString
{
  return self->_sceneIdentityString;
}

- (void)setSceneIdentityString:(id)a3
{
}

- (void).cxx_destruct
{
}

@end