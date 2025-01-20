@interface _UIRemoteKeyboardsToken
+ (id)uniqueToken;
- (BOOL)isEqual:(id)a3;
- (NSString)sceneIdentityString;
- (_UIRemoteKeyboardsToken)init;
- (id)description;
- (void)setSceneIdentityString:(id)a3;
@end

@implementation _UIRemoteKeyboardsToken

+ (id)uniqueToken
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (_UIRemoteKeyboardsToken)init
{
  v5.receiver = self;
  v5.super_class = (Class)_UIRemoteKeyboardsToken;
  id v2 = [(_UIRemoteKeyboardsToken *)&v5 init];
  if (v2)
  {
    if (qword_1EB25C728 != -1) {
      dispatch_once(&qword_1EB25C728, &__block_literal_global_1090_0);
    }
    int v3 = dword_1EB25C670++;
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
  v7.super_class = (Class)_UIRemoteKeyboardsToken;
  int v3 = [(_UIRemoteKeyboardsToken *)&v7 description];
  v4 = [(_UIRemoteKeyboardsToken *)self sceneIdentityString];
  BOOL v5 = [v3 stringByAppendingFormat:@" scene identity string %@", v4];

  return v5;
}

- (NSString)sceneIdentityString
{
  return self->sceneIdentityString;
}

- (void)setSceneIdentityString:(id)a3
{
}

- (void).cxx_destruct
{
}

@end