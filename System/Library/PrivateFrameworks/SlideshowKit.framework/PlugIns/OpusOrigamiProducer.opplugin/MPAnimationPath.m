@interface MPAnimationPath
+ (id)animationPath;
- (BOOL)isTriggered;
- (MPAnimationPath)init;
- (id)animatedKey;
- (id)animatedParent;
- (id)animationPath;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)key;
- (id)parent;
- (id)parentDocument;
- (void)dealloc;
- (void)setAnimationPath:(id)a3;
- (void)setIsTriggered:(BOOL)a3;
- (void)setParent:(id)a3;
@end

@implementation MPAnimationPath

+ (id)animationPath
{
  v2 = objc_alloc_init(MPAnimationPathKeyframed);
  return v2;
}

- (MPAnimationPath)init
{
  v3.receiver = self;
  v3.super_class = (Class)MPAnimationPath;
  result = [(MPAnimationPath *)&v3 init];
  if (result)
  {
    result->_parentObject = 0;
    result->_animationPath = 0;
  }
  return result;
}

- (void)dealloc
{
  animationPath = self->_animationPath;
  if (animationPath)
  {

    self->_animationPath = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)MPAnimationPath;
  [(MPAnimationPath *)&v4 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setIsTriggered:", -[MPAnimationPath isTriggered](self, "isTriggered"));
  return v4;
}

- (id)description
{
  objc_super v3 = +[NSString stringWithFormat:@"=========================== Animation Path Description =========================\n"];
  if (self->_animationPath) {
    CFStringRef v4 = @"YES";
  }
  else {
    CFStringRef v4 = @"NO";
  }
  return [(NSString *)v3 stringByAppendingFormat:@"\t           Has MCAnimationPath: %@\n", v4];
}

- (id)key
{
  id v2 = objc_msgSend(-[MPAnimationSupport animationPaths](self->_parentObject, "animationPaths"), "allKeysForObject:", self);
  return [v2 lastObject];
}

- (BOOL)isTriggered
{
  return self->_isTriggered;
}

- (void)setIsTriggered:(BOOL)a3
{
  self->_isTriggered = a3;
  animationPath = self->_animationPath;
  if (animationPath) {
    -[MCAnimationPath setIsTriggered:](animationPath, "setIsTriggered:");
  }
}

- (id)parent
{
  return self->_parentObject;
}

- (id)animationPath
{
  return self->_animationPath;
}

- (void)setParent:(id)a3
{
  if (a3 && self->_parentObject) {
    objc_exception_throw(+[NSException exceptionWithName:@"ManyToOneException" reason:@"A animation path may one have one parent.  Please remove it first.  This is unsupported." userInfo:0]);
  }
  self->_parentObject = (MPAnimationSupport *)a3;
}

- (id)animatedParent
{
  for (i = self->_parentObject; i; i = (MPAnimationSupport *)[(MPAnimationSupport *)i parent])
  {
    if ([(MPAnimationSupport *)i conformsToProtocol:&OBJC_PROTOCOL___MPAnimationSupport])break; {
  }
    }
  return i;
}

- (id)animatedKey
{
  id v2 = self;
  for (i = self->_parentObject; i; id v2 = [(MPAnimationPath *)v2 parent])
  {
    if ([(MPAnimationSupport *)i conformsToProtocol:&OBJC_PROTOCOL___MPAnimationSupport])break; {
    i = (MPAnimationSupport *)[(MPAnimationSupport *)i parent];
    }
  }
  return [(MPAnimationPath *)v2 key];
}

- (id)parentDocument
{
  if (!self->_parentObject) {
    return 0;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_super v3 = (MPAnimationSupport *)[(MPAnimationSupport *)self->_parentObject parentEffect];
LABEL_4:
    parentObject = (MPAnimationSupport *)objc_msgSend(-[MPAnimationSupport parentContainer](v3, "parentContainer"), "parentLayer");
    goto LABEL_13;
  }
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  parentObject = self->_parentObject;
  if ((isKindOfClass & 1) == 0)
  {
    objc_opt_class();
    char v6 = objc_opt_isKindOfClass();
    parentObject = self->_parentObject;
    if ((v6 & 1) == 0)
    {
      objc_opt_class();
      char v7 = objc_opt_isKindOfClass();
      parentObject = self->_parentObject;
      if ((v7 & 1) == 0)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          objc_super v3 = self->_parentObject;
          goto LABEL_4;
        }
        objc_opt_class();
        char v8 = objc_opt_isKindOfClass();
        parentObject = self->_parentObject;
        if (v8) {
          goto LABEL_13;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          parentObject = self->_parentObject;
          goto LABEL_13;
        }
        return 0;
      }
    }
  }
LABEL_13:
  return [(MPAnimationSupport *)parentObject parentDocument];
}

- (void)setAnimationPath:(id)a3
{
  animationPath = self->_animationPath;
  if (animationPath)
  {

    self->_animationPath = 0;
  }
  char v6 = (MCAnimationPath *)a3;
  self->_animationPath = v6;
  if (v6)
  {
    BOOL isTriggered = self->_isTriggered;
    [(MCAnimationPath *)v6 setIsTriggered:isTriggered];
  }
}

@end