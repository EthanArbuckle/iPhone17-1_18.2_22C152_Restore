@interface CHChannelCurve
+ (BOOL)_isOZChannelClassOK:(OZChannelBase *)a3;
+ (OZChannelBase)_newOZChannelWithName:(id)a3 channelID:(unsigned int)a4 flags:(unsigned int)a5;
- (id)addNewChannelWithXMLTypeInfo:(id)a3;
- (id)addVertexChannelsWithXMLTypeInfoForX:(id)a3 andForY:(id)a4;
- (id)vertexChannelFolders;
- (void)ozChannel;
@end

@implementation CHChannelCurve

+ (BOOL)_isOZChannelClassOK:(OZChannelBase *)a3
{
  return a3
}

+ (OZChannelBase)_newOZChannelWithName:(id)a3 channelID:(unsigned int)a4 flags:(unsigned int)a5
{
}

- (void)ozChannel
{
  result = self->super.super._pOZChannel;
  if (result) {
  return result;
  }
}

- (id)addNewChannelWithXMLTypeInfo:(id)a3
{
  return 0;
}

- (id)addVertexChannelsWithXMLTypeInfoForX:(id)a3 andForY:(id)a4
{
  pOZChannel = self->super.super._pOZChannel;
  if (pOZChannel) {
  else
  }
    v5 = 0;
  OZChannelCurve::addVertex(v5, MEMORY[0x1E4F1FA48], 0.0, 0.0);
}

- (id)vertexChannelFolders
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  pOZChannel = self->super.super._pOZChannel;
  if (pOZChannel) {
  else
  }
    v5 = 0;
  v6 = (char *)(v5 + 36);
  v21 = 0;
  v22 = 0;
  uint64_t v23 = 0;
  __p = 0;
  v19 = 0;
  uint64_t v20 = 0;
  (*(void (**)(void *, void **))(v5[36] + 288))(v5 + 36, &v21);
  v7 = (char *)(v5 + 65);
  (*(void (**)(char *, void **))(*(void *)v7 + 288))(v7, &__p);
  if (v21 != v22 && __p != v19)
  {
    v8 = (char *)v21 + 8;
    v9 = (char *)__p + 8;
    do
    {
      v16 = 0;
      v17 = 0;
      (*(void (**)(char *, void, OZChannelBase **))(*(void *)v6 + 552))(v6, *((void *)v8 - 1), &v17);
      (*(void (**)(char *, void, OZChannelBase **))(*(void *)v7 + 552))(v7, *((void *)v9 - 1), &v16);
      id v10 = objc_alloc(MEMORY[0x1E4F1C978]);
      v11 = CHChannelWrapperForOZChannel(v17, 0);
      v12 = objc_msgSend(v10, "initWithObjects:", v11, CHChannelWrapperForOZChannel(v16, 0), 0);
      [v3 addObject:v12];

      if (v8 == v22) {
        break;
      }
      v8 += 8;
      BOOL v13 = v9 == v19;
      v9 += 8;
    }
    while (!v13);
  }
  v14 = (void *)[MEMORY[0x1E4F1C978] arrayWithArray:v3];

  if (__p)
  {
    v19 = (char *)__p;
    operator delete(__p);
  }
  if (v21)
  {
    v22 = (char *)v21;
    operator delete(v21);
  }
  return v14;
}

@end