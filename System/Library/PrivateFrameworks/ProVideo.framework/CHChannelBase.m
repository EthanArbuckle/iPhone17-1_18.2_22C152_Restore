@interface CHChannelBase
+ (BOOL)_isOZChannelClassOK:(OZChannelBase *)a3;
+ (OZChannelBase)_newOZChannelWithName:(id)a3 channelID:(unsigned int)a4 flags:(unsigned int)a5;
+ (unsigned)_defaultChannelFlags;
+ (unsigned)_newChannelId;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)convertGlobalToLocal:(SEL)a3;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)convertLocalToGlobal:(SEL)a3;
- (BOOL)_shouldDeleteOZChannelOnDealloc;
- (BOOL)allowsKeyframes;
- (BOOL)configureWithChannelState:(id)a3;
- (BOOL)getNextKeyframeTime:(id *)a3;
- (BOOL)getPreviousKeyframeTime:(id *)a3;
- (BOOL)getResetCallback:(void *)a3 context:(void *)a4;
- (BOOL)hasKeyframeAtTime:(id *)a3;
- (BOOL)hasNextKeyframe:(id *)a3;
- (BOOL)hasPreviousKeyframe:(id *)a3;
- (BOOL)isCompoundChannel;
- (BOOL)isFolder;
- (BOOL)isModified;
- (BOOL)isStateModified;
- (BOOL)testDefaultFlag:(unint64_t)a3;
- (BOOL)testFlag:(unint64_t)a3;
- (CHChannelBase)init;
- (CHChannelBase)initWithOZChannel:(OZChannelBase *)a3 freeWhenDone:(BOOL)a4;
- (CHChannelBase)initWithParent:(id)a3 name:(id)a4;
- (CHChannelBase)initWithParent:(id)a3 name:(id)a4 channelID:(unsigned int)a5;
- (CHChannelBase)initWithParent:(id)a3 name:(id)a4 channelID:(unsigned int)a5 flags:(unsigned int)a6;
- (OZChannelBase)ozChannel;
- (id)channelFromChannelRefPath:(id)a3;
- (id)channelRefPath:(id)a3;
- (id)channelState;
- (id)copyWithZone:(_NSZone *)a3;
- (id)delegate;
- (id)description;
- (id)inspectorCtlrClassName;
- (id)keyframes:(id *)a3;
- (id)labelCtlrClassName;
- (id)name;
- (id)parameterCtlrClassName;
- (id)parent;
- (id)reverseDNSName:(id)a3;
- (id)rootBase;
- (unint64_t)flags;
- (unsigned)channelID;
- (void)_ozChannelWillBeDeleted:(void *)a3;
- (void)_replaceChannel:(OZChannelBase *)a3 flagsOnly:(BOOL)a4;
- (void)dealloc;
- (void)getMD5Value:(unsigned int *)a3;
- (void)lock;
- (void)release;
- (void)reset;
- (void)resetFlag:(unint64_t)a3;
- (void)resetToDefault;
- (void)saveStateAsDefault;
- (void)setAllowsKeyframes:(BOOL)a3;
- (void)setChannelID:(unsigned int)a3;
- (void)setFlag:(unint64_t)a3;
- (void)setFlags:(unint64_t)a3;
- (void)setInspectorCtlrClassName:(id)a3;
- (void)setLabelCtlrClassName:(id)a3;
- (void)setName:(id)a3;
- (void)setParameterCtlrClassName:(id)a3;
- (void)setResetCallback:(void *)a3 context:(void *)a4;
- (void)unlock;
@end

@implementation CHChannelBase

+ (BOOL)_isOZChannelClassOK:(OZChannelBase *)a3
{
  return 1;
}

+ (OZChannelBase)_newOZChannelWithName:(id)a3 channelID:(unsigned int)a4 flags:(unsigned int)a5
{
  return 0;
}

+ (unsigned)_newChannelId
{
  return atomic_fetch_add(+[CHChannelBase _newChannelId]::nextId, 1u);
}

+ (unsigned)_defaultChannelFlags
{
  return 0;
}

- (BOOL)allowsKeyframes
{
  return (*((uint64_t (**)(void))self->_pOZChannel->var0 + 64))();
}

- (void)setAllowsKeyframes:(BOOL)a3
{
}

- (CHChannelBase)initWithOZChannel:(OZChannelBase *)a3 freeWhenDone:(BOOL)a4
{
  if ([(id)objc_opt_class() _isOZChannelClassOK:a3])
  {
    objc_sync_enter(@"CHChannelWrapperLock");
    id WrapperForOZChannel = GetWrapperForOZChannel(a3);
    if (WrapperForOZChannel)
    {
      [(CHChannelBase *)self dealloc];
      v8 = (CHChannelBase *)WrapperForOZChannel;
    }
    else
    {
      v11.receiver = self;
      v11.super_class = (Class)CHChannelBase;
      v9 = [(CHChannelBase *)&v11 init];
      v8 = v9;
      if (v9)
      {
        v9->_pOZChannel = a3;
        v9->_freeWhenDone = a4;
        objc_sync_enter(@"CHChannelWrapperLock");
        a3->var9 = v8;
        objc_sync_exit(@"CHChannelWrapperLock");
      }
    }
    objc_sync_exit(@"CHChannelWrapperLock");
  }
  else
  {
    [(CHChannelBase *)self dealloc];
    return 0;
  }
  return v8;
}

- (CHChannelBase)initWithParent:(id)a3 name:(id)a4 channelID:(unsigned int)a5 flags:(unsigned int)a6
{
  v7 = -[CHChannelBase initWithOZChannel:freeWhenDone:](self, "initWithOZChannel:freeWhenDone:", [(id)objc_opt_class() _newOZChannelWithName:a4 channelID:*(void *)&a5 flags:*(void *)&a6], 1);
  if (v7) {
    [a3 addChild:v7];
  }
  return v7;
}

- (CHChannelBase)initWithParent:(id)a3 name:(id)a4 channelID:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v9 = [(id)objc_opt_class() _defaultChannelFlags];

  return [(CHChannelBase *)self initWithParent:a3 name:a4 channelID:v5 flags:v9];
}

- (CHChannelBase)initWithParent:(id)a3 name:(id)a4
{
  if (a3) {
    uint64_t v7 = [a3 _newChannelIdForChild];
  }
  else {
    uint64_t v7 = [(id)objc_opt_class() _newChannelId];
  }
  uint64_t v8 = v7;
  uint64_t v9 = [(id)objc_opt_class() _defaultChannelFlags];

  return [(CHChannelBase *)self initWithParent:a3 name:a4 channelID:v8 flags:v9];
}

- (CHChannelBase)init
{
  return [(CHChannelBase *)self initWithParent:0 name:&stru_1F119C770];
}

- (BOOL)_shouldDeleteOZChannelOnDealloc
{
  return self->_freeWhenDone && (pOZChannel = self->_pOZChannel) != 0 && pOZChannel->var6 == 0;
}

- (void)_ozChannelWillBeDeleted:(void *)a3
{
  self->_pOZChannel = 0;
}

- (void)release
{
  objc_sync_enter(@"CHChannelWrapperLock");
  v3.receiver = self;
  v3.super_class = (Class)CHChannelBase;
  [(CHChannelBase *)&v3 release];
  objc_sync_exit(@"CHChannelWrapperLock");
}

- (void)dealloc
{
  pOZChannel = self->_pOZChannel;
  if (pOZChannel)
  {
    objc_sync_enter(@"CHChannelWrapperLock");
    pOZChannel->var9 = 0;
    objc_sync_exit(@"CHChannelWrapperLock");
    if ([(CHChannelBase *)self _shouldDeleteOZChannelOnDealloc])
    {
      v4 = self->_pOZChannel;
      if (v4) {
        (*((void (**)(OZChannelBase *))v4->var0 + 1))(v4);
      }
    }
  }
  v5.receiver = self;
  v5.super_class = (Class)CHChannelBase;
  [(CHChannelBase *)&v5 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v3 = ChannelStateCopy(self->_pOZChannel, 0);
  id v4 = objc_alloc((Class)objc_opt_class());

  return (id)[v4 initWithOZChannel:v3 freeWhenDone:1];
}

- (id)description
{
  uint64_t v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  return (id)[v3 stringWithFormat:@"<%@: %p, oz=%p, name='%@', ID=%lu>", NSStringFromClass(v4), self, self->_pOZChannel, -[CHChannelBase name](self, "name"), -[CHChannelBase channelID](self, "channelID")];
}

- (OZChannelBase)ozChannel
{
  return self->_pOZChannel;
}

- (id)parent
{
  id result = self->_pOZChannel->var6;
  if (result) {
    return CHChannelWrapperForOZChannel((OZChannelBase *)result, 0);
  }
  return result;
}

- (id)rootBase
{
  id result = OZChannelBase::getChannelRootBase(self->_pOZChannel);
  if (result)
  {
    return CHChannelWrapperForOZChannel((OZChannelBase *)result, 0);
  }
  return result;
}

- (id)channelRefPath:(id)a3
{
  id v4 = (const OZChannelBase *)[a3 ozChannel];
  if (!v4) {
    return 0;
  }
  pOZChannel = self->_pOZChannel;
  if (!pOZChannel) {
    return 0;
  }
  OZChannelRef::OZChannelRef((OZChannelRef *)v9, pOZChannel, v4);
  if (v10 >= 0) {
    v6 = v9;
  }
  else {
    v6 = (void **)v9[0];
  }
  uint64_t v7 = (void *)[NSString stringWithUTF8String:v6];
  OZChannelRef::~OZChannelRef(v9);
  return v7;
}

- (id)channelFromChannelRefPath:(id)a3
{
  uint64_t v3 = 0;
  if (a3 && self->_pOZChannel)
  {
    if ([a3 length])
    {
      PCURL::PCURL((PCURL *)&v8, a3);
      OZChannelRef::OZChannelRef((OZChannelRef *)v9, &v8);
      PCString::~PCString(&v8);
      Channel = OZChannelRef::getChannel((OZChannelRef *)v9, self->_pOZChannel);
      uint64_t v3 = CHChannelWrapperForOZChannel(Channel, 0);
      OZChannelRef::~OZChannelRef(v9);
    }
    else
    {
      return 0;
    }
  }
  return v3;
}

- (id)delegate
{
  return 0;
}

- (id)name
{
  return PCString::ns_str(&self->_pOZChannel->var4);
}

- (void)setName:(id)a3
{
  pOZChannel = self->_pOZChannel;
  v4.var0 = 0;
  PCString::set(&v4, (CFStringRef)a3);
  OZChannelBase::setName(pOZChannel, &v4, 0);
  PCString::~PCString(&v4);
}

- (unsigned)channelID
{
  return self->_pOZChannel->var3;
}

- (void)setChannelID:(unsigned int)a3
{
}

- (unint64_t)flags
{
  return self->_pOZChannel->var7;
}

- (void)setFlags:(unint64_t)a3
{
}

- (BOOL)testFlag:(unint64_t)a3
{
  return OZChannelBase::testFlag(self->_pOZChannel, a3);
}

- (void)setFlag:(unint64_t)a3
{
}

- (void)resetFlag:(unint64_t)a3
{
}

- (BOOL)testDefaultFlag:(unint64_t)a3
{
  return OZChannelBase::testDefaultFlag(self->_pOZChannel, a3);
}

- (void)saveStateAsDefault
{
}

- (BOOL)isStateModified
{
  return (*((uint64_t (**)(void))self->_pOZChannel->var0 + 19))();
}

- (void)reset
{
}

- (void)resetToDefault
{
}

- (BOOL)getResetCallback:(void *)a3 context:(void *)a4
{
  objc_super v11 = 0;
  v12 = 0;
  BOOL v10 = 0;
  int ResetCallback = OZChannelBase::getResetCallback(self->_pOZChannel, &v12, &v11, &v10);
  if (ResetCallback)
  {
    if (a3)
    {
      if (v10) {
        uint64_t v7 = v12;
      }
      else {
        uint64_t v7 = 0;
      }
      *a3 = v7;
    }
    if (a4)
    {
      if (v10) {
        PCString v8 = v11;
      }
      else {
        PCString v8 = 0;
      }
      *a4 = v8;
    }
  }
  return ResetCallback;
}

- (void)setResetCallback:(void *)a3 context:(void *)a4
{
}

- (BOOL)isModified
{
  return (*((uint64_t (**)(OZChannelBase *, uint64_t))self->_pOZChannel->var0 + 62))(self->_pOZChannel, 1);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)convertGlobalToLocal:(SEL)a3
{
  retstr->var0 = 0;
  *(void *)&retstr->var1 = 0;
  retstr->var3 = 0;
  return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)(*((uint64_t (**)(OZChannelBase *, $3CC8671D27C23BF42ADDB32F2B5E48AE *))self->_pOZChannel->var0
                                               + 41))(self->_pOZChannel, a4);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)convertLocalToGlobal:(SEL)a3
{
  retstr->var0 = 0;
  *(void *)&retstr->var1 = 0;
  retstr->var3 = 0;
  return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)(*((uint64_t (**)(OZChannelBase *, $3CC8671D27C23BF42ADDB32F2B5E48AE *))self->_pOZChannel->var0
                                               + 42))(self->_pOZChannel, a4);
}

- (id)labelCtlrClassName
{
  return OZChannelBase::getLabelCtlrClassName(self->_pOZChannel);
}

- (void)setLabelCtlrClassName:(id)a3
{
}

- (id)parameterCtlrClassName
{
  return OZChannelBase::getParameterCtlrClassName(self->_pOZChannel);
}

- (void)setParameterCtlrClassName:(id)a3
{
}

- (id)inspectorCtlrClassName
{
  return OZChannelBase::getInspectorCtlrClassName(self->_pOZChannel);
}

- (void)setInspectorCtlrClassName:(id)a3
{
}

- (void)getMD5Value:(unsigned int *)a3
{
  OZChannelBase::getHash(self->_pOZChannel);
  if (a3) {
    *(_OWORD *)a3 = v4;
  }
}

- (id)channelState
{
  CFDataRef ChannelState = OZChannelBase::createChannelState(self->_pOZChannel, 1, 1);

  return ChannelState;
}

- (BOOL)configureWithChannelState:(id)a3
{
  return (*((uint64_t (**)(OZChannelBase *, id))self->_pOZChannel->var0 + 57))(self->_pOZChannel, a3);
}

- (void)lock
{
}

- (void)unlock
{
}

- (id)keyframes:(id *)a3
{
  pOZChannel = self->_pOZChannel;
  long long v4 = *(_OWORD *)&a3->var0.var3;
  long long v17 = *(_OWORD *)&a3->var0.var0;
  long long v18 = v4;
  long long v19 = *(_OWORD *)&a3->var1.var1;
  (*((void (**)(char **__return_ptr))pOZChannel->var0 + 65))(&v20);
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v6 = v21;
  if (v21 != v20)
  {
    uint64_t v7 = 0;
    unsigned int v8 = 1;
    do
    {
      uint64_t v9 = [FigTimeObj alloc];
      BOOL v10 = &v20[24 * v7];
      uint64_t v11 = *((void *)v10 + 2);
      long long v15 = *(_OWORD *)v10;
      uint64_t v16 = v11;
      v12 = [(FigTimeObj *)v9 initWithFigTime:&v15];
      [v5 addObject:v12];

      uint64_t v7 = v8;
      v6 = v20;
    }
    while (0xAAAAAAAAAAAAAAABLL * ((v21 - v20) >> 3) > v8++);
  }
  if (v6)
  {
    v21 = v6;
    operator delete(v6);
  }
  return v5;
}

- (BOOL)hasNextKeyframe:(id *)a3
{
  return (*((uint64_t (**)(OZChannelBase *, $3CC8671D27C23BF42ADDB32F2B5E48AE *, void))self->_pOZChannel->var0
          + 79))(self->_pOZChannel, a3, 0);
}

- (BOOL)hasPreviousKeyframe:(id *)a3
{
  return (*((uint64_t (**)(OZChannelBase *, $3CC8671D27C23BF42ADDB32F2B5E48AE *, void))self->_pOZChannel->var0
          + 78))(self->_pOZChannel, a3, 0);
}

- (BOOL)hasKeyframeAtTime:(id *)a3
{
  return (*((uint64_t (**)(OZChannelBase *, $3CC8671D27C23BF42ADDB32F2B5E48AE *, void))self->_pOZChannel->var0
          + 71))(self->_pOZChannel, a3, 0);
}

- (BOOL)getPreviousKeyframeTime:(id *)a3
{
  return (*((uint64_t (**)(OZChannelBase *, $3CC8671D27C23BF42ADDB32F2B5E48AE *, void))self->_pOZChannel->var0
          + 78))(self->_pOZChannel, a3, 0);
}

- (BOOL)getNextKeyframeTime:(id *)a3
{
  return (*((uint64_t (**)(OZChannelBase *, $3CC8671D27C23BF42ADDB32F2B5E48AE *, void))self->_pOZChannel->var0
          + 79))(self->_pOZChannel, a3, 0);
}

- (void)_replaceChannel:(OZChannelBase *)a3 flagsOnly:(BOOL)a4
{
  BOOL v4 = a4;
  pOZChannel = self->_pOZChannel;
  var6 = pOZChannel->var6;
  (*((void (**)(OZChannelBase *, SEL))pOZChannel->var0 + 44))(pOZChannel, a2);
  if (v4) {
    OZChannelBase::setFlags(pOZChannel, a3->var7);
  }
  else {
    (*((void (**)(OZChannelBase *, OZChannelBase *))pOZChannel->var0 + 32))(pOZChannel, a3);
  }
  (*((void (**)(OZChannelBase *))pOZChannel->var0 + 45))(pOZChannel);
  pOZChannel->var6 = var6;
}

- (BOOL)isFolder
{
  return (BYTE1(self->_pOZChannel->var7) >> 4) & 1;
}

- (BOOL)isCompoundChannel
{
  return (*((uint64_t (**)(void))self->_pOZChannel->var0 + 15))();
}

- (id)reverseDNSName:(id)a3
{
  if (a3 == self) {
    return 0;
  }
  BOOL v4 = objc_msgSend(-[CHChannelBase parent](self, "parent"), "reverseDNSName:", a3);
  id result = [(CHChannelBase *)self name];
  if (v4) {
    return (id)[v4 stringByAppendingFormat:@".%@", result];
  }
  return result;
}

@end