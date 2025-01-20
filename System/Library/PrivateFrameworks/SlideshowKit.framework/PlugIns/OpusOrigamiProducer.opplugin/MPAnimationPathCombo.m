@interface MPAnimationPathCombo
+ (id)animationPath;
- (MPAnimationPathCombo)init;
- (NSString)key;
- (NSString)operation;
- (id)animationPathForKey:(id)a3;
- (id)animationPaths;
- (id)copyWithZone:(_NSZone *)a3;
- (void)cleanup;
- (void)copyAnimationPaths:(id)a3;
- (void)dealloc;
- (void)removeAnimationPathForKey:(id)a3;
- (void)setAnimationPath:(id)a3;
- (void)setAnimationPath:(id)a3 forKey:(id)a4;
- (void)setKey:(id)a3;
- (void)setOperation:(id)a3;
@end

@implementation MPAnimationPathCombo

+ (id)animationPath
{
  v2 = objc_alloc_init(MPAnimationPathCombo);
  return v2;
}

- (MPAnimationPathCombo)init
{
  v4.receiver = self;
  v4.super_class = (Class)MPAnimationPathCombo;
  v2 = [(MPAnimationPath *)&v4 init];
  if (v2)
  {
    v2->_animationPaths = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v2->_key = 0;
    v2->_operation = 0;
  }
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MPAnimationPathCombo;
  id v4 = [(MPAnimationPath *)&v6 copyWithZone:a3];
  [v4 copyAnimationPaths:self->_animationPaths];
  objc_msgSend(v4, "setOperation:", -[NSString copy](self->_operation, "copy"));
  objc_msgSend(v4, "setKey:", -[NSString copy](self->_key, "copy"));
  return v4;
}

- (void)dealloc
{
  self->_animationPaths = 0;
  v3.receiver = self;
  v3.super_class = (Class)MPAnimationPathCombo;
  [(MPAnimationPath *)&v3 dealloc];
}

- (id)animationPaths
{
  return self->_animationPaths;
}

- (id)animationPathForKey:(id)a3
{
  return [(NSMutableDictionary *)self->_animationPaths objectForKey:a3];
}

- (void)setAnimationPath:(id)a3 forKey:(id)a4
{
  if (a3)
  {
    id v7 = [(MPAnimationPathCombo *)self animationPathForKey:a4];
    if (v7)
    {
      v8 = v7;
      id v9 = objc_msgSend(-[MPAnimationPath parentDocument](self, "parentDocument"), "undoManager");
      if (v9) {
        objc_msgSend(objc_msgSend(v9, "prepareWithInvocationTarget:", self), "setAnimationPath:forKey:", v8, a4);
      }
      [v8 setParent:0];
      [v8 setAnimationPath:0];
    }
    [a3 setParent:self];
    [(NSMutableDictionary *)self->_animationPaths setObject:a3 forKey:a4];
    animationPath = self->super._animationPath;
    if (animationPath)
    {
      [(MCAnimationPath *)animationPath removeAnimationPathForKey:a4];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
      v12 = off_1A4DC0;
      if ((isKindOfClass & 1) == 0) {
        v12 = off_1A4DC8;
      }
      id v13 = [(__objc2_class *)*v12 animationPathWithKey:a4];
      [(MCAnimationPath *)self->super._animationPath addAnimationPath:v13];
      [a3 setAnimationPath:v13];
    }
  }
  else
  {
    [(MPAnimationPathCombo *)self removeAnimationPathForKey:a4];
  }
}

- (void)removeAnimationPathForKey:(id)a3
{
  id v5 = -[MPAnimationPathCombo animationPathForKey:](self, "animationPathForKey:");
  id v6 = objc_msgSend(-[MPAnimationPath parentDocument](self, "parentDocument"), "undoManager");
  if (v6) {
    objc_msgSend(objc_msgSend(v6, "prepareWithInvocationTarget:", self), "setAnimationPath:forKey:", v5, a3);
  }
  animationPath = self->super._animationPath;
  if (animationPath)
  {
    [(MCAnimationPath *)animationPath removeAnimationPathForKey:a3];
    [v5 setAnimationPath:0];
  }
  [v5 setParent:0];
  animationPaths = self->_animationPaths;
  [(NSMutableDictionary *)animationPaths removeObjectForKey:a3];
}

- (void)setOperation:(id)a3
{
  operation = self->_operation;
  if (operation)
  {

    self->_operation = 0;
  }
  self->_operation = (NSString *)[a3 copy];
  animationPath = self->super._animationPath;
  if (animationPath)
  {
    [(MCAnimationPath *)animationPath setCombineOperation:a3];
  }
}

- (NSString)key
{
  if (objc_msgSend(-[MPAnimationPath parent](self, "parent"), "conformsToProtocol:", &OBJC_PROTOCOL___MPAnimationSupport))
  {
    v4.receiver = self;
    v4.super_class = (Class)MPAnimationPathCombo;
    return (NSString *)[(MPAnimationPath *)&v4 key];
  }
  else
  {
    return [(MPAnimationPathCombo *)self key];
  }
}

- (void)setKey:(id)a3
{
  if ((objc_msgSend(-[MPAnimationPath parent](self, "parent"), "conformsToProtocol:", &OBJC_PROTOCOL___MPAnimationSupport) & 1) == 0)
  {
    key = self->_key;
    if (key)
    {

      self->_key = 0;
    }
    id v6 = (NSString *)[a3 copy];
    self->_key = v6;
    animationPath = self->super._animationPath;
    if (animationPath)
    {
      [(MCAnimationPath *)animationPath setKey:v6];
    }
  }
}

- (NSString)operation
{
  return self->_operation;
}

- (void)cleanup
{
  id v3 = [(NSMutableDictionary *)self->_animationPaths allKeys];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      id v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [(MPAnimationPathCombo *)self removeAnimationPathForKey:*(void *)(*((void *)&v8 + 1) + 8 * (void)v7)];
        id v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)setAnimationPath:(id)a3
{
  v27.receiver = self;
  v27.super_class = (Class)MPAnimationPathCombo;
  [(MPAnimationPath *)&v27 setAnimationPath:a3];
  if (self->super._animationPath)
  {
    [(MCAnimationPath *)self->super._animationPath setCombineOperation:[(MPAnimationPathCombo *)self operation]];
    if ((objc_msgSend(-[MPAnimationPath parent](self, "parent"), "conformsToProtocol:", &OBJC_PROTOCOL___MPAnimationSupport) & 1) == 0)-[MCAnimationPath setKey:](self->super._animationPath, "setKey:", -[MPAnimationPathCombo key](self, "key")); {
    long long v25 = 0u;
    }
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    obj = self->_animationPaths;
    id v4 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v23 objects:v29 count:16];
    if (v4)
    {
      id v5 = v4;
      uint64_t v6 = *(void *)v24;
      do
      {
        for (i = 0; i != v5; i = (char *)i + 1)
        {
          if (*(void *)v24 != v6) {
            objc_enumerationMutation(obj);
          }
          uint64_t v8 = *(void *)(*((void *)&v23 + 1) + 8 * i);
          id v9 = [(NSMutableDictionary *)self->_animationPaths objectForKey:v8];
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            long long v10 = off_1A4DC0;
          }
          else {
            long long v10 = off_1A4DC8;
          }
          id v11 = [(__objc2_class *)*v10 animationPathWithKey:v8];
          [v9 setAnimationPath:v11];
          [(MCAnimationPath *)self->super._animationPath addAnimationPath:v11];
        }
        id v5 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v23 objects:v29 count:16];
      }
      while (v5);
    }
  }
  else
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    animationPaths = self->_animationPaths;
    id v13 = [(NSMutableDictionary *)animationPaths countByEnumeratingWithState:&v19 objects:v28 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v20;
      do
      {
        for (j = 0; j != v14; j = (char *)j + 1)
        {
          if (*(void *)v20 != v15) {
            objc_enumerationMutation(animationPaths);
          }
          uint64_t v17 = *(void *)(*((void *)&v19 + 1) + 8 * (void)j);
          objc_msgSend(-[NSMutableDictionary objectForKey:](self->_animationPaths, "objectForKey:", v17), "setAnimationPath:", 0);
          [(MCAnimationPath *)self->super._animationPath removeAnimationPathForKey:v17];
        }
        id v14 = [(NSMutableDictionary *)animationPaths countByEnumeratingWithState:&v19 objects:v28 count:16];
      }
      while (v14);
    }
  }
}

- (void)copyAnimationPaths:(id)a3
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = [a3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(a3);
        }
        uint64_t v9 = *(void *)(*((void *)&v11 + 1) + 8 * i);
        id v10 = objc_msgSend(objc_msgSend(a3, "objectForKey:", v9), "copy");
        [(MPAnimationPathCombo *)self setAnimationPath:v10 forKey:v9];
      }
      id v6 = [a3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
}

@end