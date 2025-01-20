@interface MTLDebugResource
- (BOOL)doesAliasAllResources:(const void *)a3 count:(unint64_t)a4;
- (BOOL)doesAliasAnyResources:(const void *)a3 count:(unint64_t)a4;
- (BOOL)doesAliasResource:(id)a3;
- (MTLDebugResource)initWithBaseObject:(id)a3;
- (id)baseObject;
@end

@implementation MTLDebugResource

- (MTLDebugResource)initWithBaseObject:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MTLDebugResource;
  result = [(MTLDebugResource *)&v5 init];
  if (result) {
    result->_baseObject = a3;
  }
  return result;
}

- (BOOL)doesAliasResource:(id)a3
{
  if (!objc_msgSend(-[MTLDebugResource baseObject](self, "baseObject"), "heap")) {
    _MTLMessageContextPush_();
  }
  if (![a3 heap]) {
    _MTLMessageContextPush_();
  }
  _MTLMessageContextEnd();
  return objc_msgSend(-[MTLDebugResource baseObject](self, "baseObject"), "doesAliasResource:", objc_msgSend(a3, "baseObject"));
}

- (BOOL)doesAliasAllResources:(const void *)a3 count:(unint64_t)a4
{
  objc_msgSend(-[MTLDebugResource baseObject](self, "baseObject", 0, 0, 0, 0, 0, 0, 0, *MEMORY[0x263EF8340]), "device");
  _MTLMessageContextBegin_();
  if (a4)
  {
    if (a3)
    {
      BOOL v7 = 0;
    }
    else
    {
      _MTLMessageContextPush_();
      BOOL v7 = 1;
    }
  }
  else
  {
    _MTLMessageContextPush_();
    BOOL v7 = a3 == 0;
  }
  if (!objc_msgSend(-[MTLDebugResource baseObject](self, "baseObject"), "heap")) {
    _MTLMessageContextPush_();
  }
  if (a4) {
    char v8 = v7;
  }
  else {
    char v8 = 1;
  }
  if ((v8 & 1) == 0)
  {
    uint64_t v11 = 0;
    do
    {
      if (![(id)a3[v11] heap]) {
        _MTLMessageContextPush_();
      }
      ++v11;
    }
    while (a4 != v11);
  }
  _MTLMessageContextEnd();
  if (!a4) {
    return 0;
  }
  uint64_t v9 = 0;
  do
  {
    *(void *)((char *)&v12 + 8 * v9 - ((8 * a4 + 15) & 0xFFFFFFFFFFFFFFF0)) = [(id)a3[v9] baseObject];
    ++v9;
  }
  while (a4 != v9);
  return objc_msgSend(-[MTLDebugResource baseObject](self, "baseObject"), "doesAliasAllResources:count:", (char *)&v12 - ((8 * a4 + 15) & 0xFFFFFFFFFFFFFFF0), a4);
}

- (BOOL)doesAliasAnyResources:(const void *)a3 count:(unint64_t)a4
{
  objc_msgSend(-[MTLDebugResource baseObject](self, "baseObject", 0, 0, 0, 0, 0, 0, 0, *MEMORY[0x263EF8340]), "device");
  _MTLMessageContextBegin_();
  if (a4)
  {
    if (a3)
    {
      BOOL v7 = 0;
    }
    else
    {
      _MTLMessageContextPush_();
      BOOL v7 = 1;
    }
  }
  else
  {
    _MTLMessageContextPush_();
    BOOL v7 = a3 == 0;
  }
  if (!objc_msgSend(-[MTLDebugResource baseObject](self, "baseObject"), "heap")) {
    _MTLMessageContextPush_();
  }
  if (a4) {
    char v8 = v7;
  }
  else {
    char v8 = 1;
  }
  if ((v8 & 1) == 0)
  {
    uint64_t v11 = 0;
    do
    {
      if (![(id)a3[v11] heap]) {
        _MTLMessageContextPush_();
      }
      ++v11;
    }
    while (a4 != v11);
  }
  _MTLMessageContextEnd();
  if (!a4) {
    return 0;
  }
  uint64_t v9 = 0;
  do
  {
    *(void *)((char *)&v12 + 8 * v9 - ((8 * a4 + 15) & 0xFFFFFFFFFFFFFFF0)) = [(id)a3[v9] baseObject];
    ++v9;
  }
  while (a4 != v9);
  return objc_msgSend(-[MTLDebugResource baseObject](self, "baseObject"), "doesAliasAnyResources:count:", (char *)&v12 - ((8 * a4 + 15) & 0xFFFFFFFFFFFFFFF0), a4);
}

- (id)baseObject
{
  return self->_baseObject;
}

@end