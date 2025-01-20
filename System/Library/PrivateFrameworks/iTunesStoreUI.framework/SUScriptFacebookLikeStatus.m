@interface SUScriptFacebookLikeStatus
+ (id)webScriptNameForKeyName:(id)a3;
+ (void)initialize;
- (NSArray)friends;
- (SUScriptFacebookLikeStatus)initWithLikeStatusDictionary:(id)a3;
- (id)_className;
- (id)isLikedByMe;
- (id)scriptAttributeKeys;
- (unint64_t)friendLikeCount;
- (unint64_t)globalLikeCount;
- (void)dealloc;
@end

@implementation SUScriptFacebookLikeStatus

- (SUScriptFacebookLikeStatus)initWithLikeStatusDictionary:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SUScriptFacebookLikeStatus;
  v4 = [(SUScriptObject *)&v6 init];
  if (v4) {
    v4->_dictionary = (NSDictionary *)[a3 copy];
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SUScriptFacebookLikeStatus;
  [(SUScriptObject *)&v3 dealloc];
}

- (id)_className
{
  return @"iTunesFacebookLikeStatus";
}

- (unint64_t)friendLikeCount
{
  id v2 = [(NSDictionary *)self->_dictionary objectForKey:ISWeakLinkedStringConstantForString()];

  return [v2 unsignedIntegerValue];
}

- (NSArray)friends
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  objc_super v3 = (NSArray *)[MEMORY[0x263EFF980] array];
  id v4 = [(NSDictionary *)self->_dictionary objectForKey:ISWeakLinkedStringConstantForString()];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v10 = [[SUScriptFacebookFriend alloc] initWithName:v9];
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            continue;
          }
          v10 = [[SUScriptFacebookFriend alloc] initWithFriendDictionary:v9];
        }
        v11 = v10;
        if (v10)
        {
          [(NSArray *)v3 addObject:v10];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }
  return v3;
}

- (unint64_t)globalLikeCount
{
  id v2 = [(NSDictionary *)self->_dictionary objectForKey:ISWeakLinkedStringConstantForString()];

  return [v2 unsignedIntegerValue];
}

- (id)isLikedByMe
{
  int v2 = objc_msgSend(-[NSDictionary objectForKey:](self->_dictionary, "objectForKey:", ISWeakLinkedStringConstantForString()), "BOOLValue");
  objc_super v3 = (id *)MEMORY[0x263EFFB40];
  if (!v2) {
    objc_super v3 = (id *)MEMORY[0x263EFFB38];
  }
  return *v3;
}

+ (id)webScriptNameForKeyName:(id)a3
{
  id result = (id)objc_msgSend((id)__KeyMapping_76, "objectForKey:");
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptFacebookLikeStatus;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForKeyName_, a3);
  }
  return result;
}

- (id)scriptAttributeKeys
{
  v4.receiver = self;
  v4.super_class = (Class)SUScriptFacebookLikeStatus;
  int v2 = [(SUScriptObject *)&v4 scriptAttributeKeys];
  -[NSMutableArray addObjectsFromArray:](v2, "addObjectsFromArray:", [(id)__KeyMapping_76 allKeys]);
  return v2;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1) {
    __KeyMapping_76 = objc_msgSend(objc_alloc(NSDictionary), "initWithObjectsAndKeys:", @"friendLikeCount", @"friends", @"friends", @"globalLikeCount", @"globalLikeCount", @"isLikedByMe", @"isLikedByMe", 0);
  }
}

@end