@interface CHChannelFolder
+ (BOOL)_isOZChannelClassOK:(OZChannelBase *)a3;
+ (OZChannelBase)_newOZChannelWithName:(id)a3 channelID:(unsigned int)a4 flags:(unsigned int)a5;
+ (unsigned)_defaultChannelFlags;
- (BOOL)_shouldDeleteDescendantsOnRemoval;
- (BOOL)configureDescendantsWithChannelState:(id)a3;
- (BOOL)hasDescendant:(id)a3;
- (BOOL)hasDescendantWithFadeHandle;
- (BOOL)hasModifiedDescendant;
- (BOOL)hasTimeVaryingDescendant;
- (BOOL)testFolderFlag:(unsigned int)a3;
- (id)addNewChannelWithXMLTypeInfo:(id)a3;
- (id)channelStateForDescendants:(BOOL)a3;
- (id)childAtIndex:(unint64_t)a3;
- (id)childWithChannelID:(unsigned int)a3;
- (id)children;
- (id)debugDescription;
- (id)debugDescrptionWithIndentLevel:(unsigned int)a3;
- (id)descendantAtPath:(id)a3;
- (id)description;
- (id)pathToDescendant:(id)a3;
- (unint64_t)indexOfChild:(id)a3;
- (unsigned)_newChannelIdForChild;
- (unsigned)folderFlags;
- (unsigned)numberOfChildren;
- (void)addChild:(id)a3;
- (void)dealloc;
- (void)insertChild:(id)a3 atIndex:(unint64_t)a4;
- (void)iterateDescendantsWithOptions:(unsigned int)a3 usingBlock:(id)a4;
- (void)iterateDescendantsWithOptions:(unsigned int)a3 usingFunction:(void *)a4 contextInfo:(void *)a5;
- (void)iterateDescendantsWithOptions:(unsigned int)a3 usingSelector:(SEL)a4 delegate:(id)a5 contextInfo:(void *)a6;
- (void)ozChannel;
- (void)removeAllChildren;
- (void)removeChild:(id)a3;
- (void)resetFolderFlag:(unsigned int)a3;
- (void)setFolderFlag:(unsigned int)a3;
- (void)setFolderFlags:(unsigned int)a3;
@end

@implementation CHChannelFolder

+ (BOOL)_isOZChannelClassOK:(OZChannelBase *)a3
{
  return a3
}

+ (OZChannelBase)_newOZChannelWithName:(id)a3 channelID:(unsigned int)a4 flags:(unsigned int)a5
{
}

+ (unsigned)_defaultChannelFlags
{
  return 4096;
}

- (void)dealloc
{
  if ([(CHChannelBase *)self _shouldDeleteOZChannelOnDealloc])
  {
    pOZChannel = (OZChannelFolder *)self->super._pOZChannel;
    if (pOZChannel) {
    DeleteDescendants(pOZChannel);
    }
  }
  v4.receiver = self;
  v4.super_class = (Class)CHChannelFolder;
  [(CHChannelBase *)&v4 dealloc];
}

- (id)description
{
  v3 = NSString;
  objc_super v4 = (objc_class *)objc_opt_class();
  return (id)[v3 stringWithFormat:@"<%@: %p, oz=%p, name='%@', ID=%lu, #children=%lu>", NSStringFromClass(v4), self, self->super._pOZChannel, -[CHChannelBase name](self, "name"), -[CHChannelBase channelID](self, "channelID"), -[CHChannelFolder numberOfChildren](self, "numberOfChildren")];
}

- (id)debugDescrptionWithIndentLevel:(unsigned int)a3
{
  uint64_t v16 = 2 * a3;
  v5 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithFormat:@"%*s%@", v16, ", -[CHChannelFolder description](self, "description"")];
  objc_msgSend(v5, "appendString:", @"(");
  if (v6)
  {
    unint64_t v7 = v6[1] - *v6;
    if ((v7 & 0x7FFFFFFF8) != 0)
    {
      uint64_t v8 = 0;
      uint64_t v9 = a3 + 1;
      uint64_t v10 = (v7 >> 3);
      while (1)
      {
        v11 = *(OZChannelBase **)(*v6 + 8 * v8);
        if (!CHChannelWrapperClassForOZChannel((uint64_t)v11)) {
          break;
        }
        v12 = CHChannelWrapperForOZChannel(v11, 0);
        if ((objc_opt_respondsToSelector() & 1) == 0)
        {
          uint64_t v13 = [(OZChannelBase *)v12 description];
          goto LABEL_9;
        }
        uint64_t v13 = [(OZChannelBase *)v12 debugDescrptionWithIndentLevel:v9];
        uint64_t v14 = 0;
LABEL_10:
        [v5 appendFormat:@"\n%*s%@", v14, "", v13];
        if (v10 == ++v8) {
          goto LABEL_11;
        }
      }
      uint64_t v13 = CHDescriptionForOZChannel((uint64_t)v11);
LABEL_9:
      uint64_t v14 = (v16 + 2);
      goto LABEL_10;
    }
  }
LABEL_11:
  [v5 appendFormat:@"\n%*s"], v16, "");

  return v5;
}

- (id)debugDescription
{
  return [(CHChannelFolder *)self debugDescrptionWithIndentLevel:0];
}

- (void)ozChannel
{
  result = self->super._pOZChannel;
  if (result) {
  return result;
  }
}

- (BOOL)testFolderFlag:(unsigned int)a3
{
  pOZChannel = (OZChannelFolder *)self->super._pOZChannel;
  if (pOZChannel) {

  }
  return OZChannelFolder::testFoldFlag(pOZChannel, a3);
}

- (void)setFolderFlag:(unsigned int)a3
{
  pOZChannel = (OZChannelFolder *)self->super._pOZChannel;
  if (pOZChannel) {

  }
  OZChannelFolder::setFoldFlag(pOZChannel, a3);
}

- (void)resetFolderFlag:(unsigned int)a3
{
  pOZChannel = (OZChannelFolder *)self->super._pOZChannel;
  if (pOZChannel) {

  }
  OZChannelFolder::resetFoldFlag(pOZChannel, a3);
}

- (unsigned)folderFlags
{
}

- (void)setFolderFlags:(unsigned int)a3
{
  pOZChannel = (OZChannelFolder *)self->super._pOZChannel;
  if (pOZChannel) {

  }
  OZChannelFolder::setFoldFlags(pOZChannel, a3);
}

- (id)children
{
  if (v2) {
    uint64_t v3 = (v2[1] - *v2) >> 3;
  }
  else {
    LODWORD(v3) = 0;
  }
  objc_super v4 = (void *)[MEMORY[0x1E4F1CA48] arrayWithCapacity:(int)v3];
  if (v3)
  {
    uint64_t v5 = 0;
    uint64_t v6 = 8 * v3;
    do
    {
      objc_msgSend(v4, "addObject:", CHChannelWrapperForOZChannel(*(OZChannelBase **)(*v2 + v5), 0));
      v5 += 8;
    }
    while (v6 != v5);
  }
  return v4;
}

- (unsigned)numberOfChildren
{
  if (v2) {
    return (v2[1] - *v2) >> 3;
  }
  else {
    LODWORD(v3) = 0;
  }
  return v3;
}

- (id)childAtIndex:(unint64_t)a3
{
  return CHChannelWrapperForOZChannel(v3, 0);
}

- (unint64_t)indexOfChild:(id)a3
{
  pOZChannel = self->super._pOZChannel;
  if (pOZChannel) {
  else
  }
    uint64_t v5 = 0;
  uint64_t v6 = [a3 ozChannel];
  unint64_t v7 = (uint64_t *)v5[14];
  if (!v7) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  uint64_t v8 = *v7;
  uint64_t v9 = *(void *)(v5[14] + 8) - v8;
  if (!((unint64_t)v9 >> 3)) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  uint64_t v10 = v6;
  unint64_t result = 0;
  uint64_t v12 = (int)(v9 >> 3);
  while (*(void *)(v8 + 8 * result) != v10)
  {
    if (v12 == ++result) {
      return 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  return result;
}

- (id)childWithChannelID:(unsigned int)a3
{
  pOZChannel = (OZChannelFolder *)self->super._pOZChannel;
  if (pOZChannel) {
  id result = (id)OZChannelFolder::getDescendant(pOZChannel, a3);
  }
  if (result)
  {
    return CHChannelWrapperForOZChannel((OZChannelBase *)result, 0);
  }
  return result;
}

- (void)iterateDescendantsWithOptions:(unsigned int)a3 usingBlock:(id)a4
{
  uint64_t v5 = *(void *)&a3;
  pOZChannel = self->super._pOZChannel;
  if (pOZChannel) {

  }
  IterateDescendants((uint64_t)pOZChannel, v5, (uint64_t)a4);
}

- (void)iterateDescendantsWithOptions:(unsigned int)a3 usingFunction:(void *)a4 contextInfo:(void *)a5
{
  uint64_t v7 = *(void *)&a3;
  pOZChannel = self->super._pOZChannel;
  if (pOZChannel) {
  v9[0] = MEMORY[0x1E4F143A8];
  }
  v9[1] = *(void *)"";
  v9[2] = __75__CHChannelFolder_iterateDescendantsWithOptions_usingFunction_contextInfo___block_invoke;
  v9[3] = &__block_descriptor_48_e23_B16__0__CHChannelBase_8l;
  v9[4] = a4;
  v9[5] = a5;
  IterateDescendants((uint64_t)pOZChannel, v7, (uint64_t)v9);
}

uint64_t __75__CHChannelFolder_iterateDescendantsWithOptions_usingFunction_contextInfo___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, void))(a1 + 32))(a2, *(void *)(a1 + 40));
}

- (void)iterateDescendantsWithOptions:(unsigned int)a3 usingSelector:(SEL)a4 delegate:(id)a5 contextInfo:(void *)a6
{
  uint64_t v9 = *(void *)&a3;
  pOZChannel = self->super._pOZChannel;
  if (pOZChannel) {
  v11[0] = MEMORY[0x1E4F143A8];
  }
  v11[1] = *(void *)"";
  v11[2] = __84__CHChannelFolder_iterateDescendantsWithOptions_usingSelector_delegate_contextInfo___block_invoke;
  v11[3] = &unk_1E616D600;
  v11[4] = a5;
  v11[5] = a4;
  v11[6] = a6;
  IterateDescendants((uint64_t)pOZChannel, v9, (uint64_t)v11);
}

id __84__CHChannelFolder_iterateDescendantsWithOptions_usingSelector_delegate_contextInfo___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), *(SEL *)(a1 + 40), a2, *(void *)(a1 + 48));
}

- (unsigned)_newChannelIdForChild
{
  pOZChannel = self->super._pOZChannel;
  if (pOZChannel) {
  else
  }
    uint64_t v3 = 0;
  do
    unsigned int v4 = [(id)objc_opt_class() _newChannelId];
  while (OZChannelFolder::getDescendant(v3, v4));
  return v4;
}

- (void)addChild:(id)a3
{
  pOZChannel = self->super._pOZChannel;
  if (pOZChannel) {
  else
  }
    uint64_t v5 = 0;
  uint64_t v6 = (OZChannelBase *)[a3 ozChannel];
  FixupNewChild(v5, v6);

  OZChannelFolder::push_back(v5, v6);
}

- (void)insertChild:(id)a3 atIndex:(unint64_t)a4
{
  pOZChannel = self->super._pOZChannel;
  if (pOZChannel) {
  else
  }
    uint64_t v7 = 0;
  uint64_t v8 = (OZChannelBase *)[a3 ozChannel];
  FixupNewChild(v7, v8);
  uint64_t v9 = (uint64_t *)*((void *)v7 + 14);
  if (v9 && (uint64_t v10 = *v9, a4 != (int)((unint64_t)(*(void *)(*((void *)v7 + 14) + 8) - v10) >> 3))) {
    v11 = *(const OZChannelBase **)(v10 + 8 * a4);
  }
  else {
    v11 = 0;
  }

  OZChannelFolder::insertDescendantBefore(v7, v11, v8);
}

- (BOOL)_shouldDeleteDescendantsOnRemoval
{
  pOZChannel = self->super._pOZChannel;
  if (pOZChannel) {
  else
  }
    uint64_t v3 = 0;
  if (((*(uint64_t (**)(void *))(*v3 + 120))(v3) & 1) != 0
  {
    return 0;
  }
  do
  {
    BOOL result = [(id)CHPreexistingChannelWrapperForOZChannel(v3) _shouldDeleteOZChannelOnDealloc];
    if (result) {
      break;
    }
    uint64_t v3 = (void *)v3[6];
  }
  while (v3);
  return result;
}

- (void)removeChild:(id)a3
{
  if (a3)
  {
    pOZChannel = self->super._pOZChannel;
    if (pOZChannel) {
    else
    }
      uint64_t v6 = 0;
    uint64_t v7 = (OZChannelBase *)[a3 ozChannel];
    if ([(CHChannelFolder *)self _shouldDeleteDescendantsOnRemoval])
    {
      DeleteDescendant(v6, v7);
    }
    else
    {
      OZChannelFolder::removeDescendant(v6, v7);
    }
  }
}

- (void)removeAllChildren
{
  pOZChannel = self->super._pOZChannel;
  if (pOZChannel) {
  else
  }
    unsigned int v4 = 0;
  if ([(CHChannelFolder *)self _shouldDeleteDescendantsOnRemoval])
  {
    DeleteDescendants(v4);
  }
  else
  {
    OZChannelFolder::removeAllDescendants(v4, 1);
  }
}

- (id)channelStateForDescendants:(BOOL)a3
{
  CFDataRef ChannelState = OZChannelBase::createChannelState(self->super._pOZChannel, 1, a3);

  return ChannelState;
}

- (BOOL)configureDescendantsWithChannelState:(id)a3
{
  return (*((uint64_t (**)(OZChannelBase *, id))self->super._pOZChannel->var0 + 57))(self->super._pOZChannel, a3);
}

- (BOOL)hasDescendant:(id)a3
{
  pOZChannel = self->super._pOZChannel;
  if (pOZChannel) {
  else
  }
    uint64_t v5 = 0;
  uint64_t v6 = (OZChannelBase *)[a3 ozChannel];

  return OZChannelBase::isDescendantOf(v6, v5);
}

- (id)pathToDescendant:(id)a3
{
  pOZChannel = self->super._pOZChannel;
  if (pOZChannel) {
  else
  }
    uint64_t v5 = 0;
  OZChannelRef::OZChannelRef((OZChannelRef *)v9, (const OZChannelBase *)[a3 ozChannel], v5);
  if (v10 >= 0) {
    uint64_t v6 = v9;
  }
  else {
    uint64_t v6 = (void **)v9[0];
  }
  uint64_t v7 = (void *)[NSString stringWithCString:v6 encoding:1];
  OZChannelRef::~OZChannelRef(v9);
  return v7;
}

- (id)descendantAtPath:(id)a3
{
  v9.var0 = 0;
  PCString::set(&v9, (CFStringRef)a3);
  OZChannelRef::OZChannelRef((OZChannelRef *)v10, &v9);
  PCString::~PCString(&v9);
  pOZChannel = self->super._pOZChannel;
  if (pOZChannel) {
  else
  }
    uint64_t v5 = 0;
  Channel = OZChannelRef::getChannel((OZChannelRef *)v10, v5);
  uint64_t v7 = CHChannelWrapperForOZChannel(Channel, 0);
  OZChannelRef::~OZChannelRef(v10);
  return v7;
}

- (BOOL)hasModifiedDescendant
{
  if (!v2) {
    return 0;
  }
  uint64_t v3 = v2[1];
  if (*v2 == v3) {
    return 0;
  }
  uint64_t v4 = *v2 + 8;
  do
  {
    BOOL result = (*(uint64_t (**)(void, uint64_t))(**(void **)(v4 - 8) + 496))(*(void *)(v4 - 8), 1);
    if (result) {
      break;
    }
    BOOL v6 = v4 == v3;
    v4 += 8;
  }
  while (!v6);
  return result;
}

- (BOOL)hasDescendantWithFadeHandle
{
  pOZChannel = self->super._pOZChannel;
  if (pOZChannel) {
  uint64_t v3 = *(uint64_t (**)(void))(*(void *)pOZChannel + 664);
  }

  return v3();
}

- (BOOL)hasTimeVaryingDescendant
{
  pOZChannel = self->super._pOZChannel;
  if (pOZChannel) {
  else
  }
    uint64_t v3 = 0;
  if ((*(uint64_t (**)(void *))(*(void *)v3 + 560))(v3)) {
    return 1;
  }
  uint64_t v5 = *(uint64_t (**)(void *))(*(void *)v3 + 664);

  return v5(v3);
}

- (id)addNewChannelWithXMLTypeInfo:(id)a3
{
  return 0;
}

@end